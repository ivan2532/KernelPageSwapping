#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "defs.h"
#include "spinlock.h"

#define RAM_PAGES_COUNT ( ((PHYSTOP - KERNBASE) / PGSIZE)*2 )

extern pagetable_t kernel_pagetable;

volatile int yielddisabled = 0;

struct lrupinfo {
  uchar refhistory;
  pte_t *pte;
  uint64 va;
  pagetable_t pagetable;
};

static struct lrupinfo lrupages[RAM_PAGES_COUNT] = {{0} };

uint64
getpaddress(pte_t *pte)
{
  uint64 ppn = ( (*pte) & 0x3FFFFFFFFFFFFL ) >> 10; // Extract bits 53-10 and shift to the right place
  uint64 physical_address = ppn << 12; // Shift left by 12 bits to accommodate for the page offset
  return physical_address;
}

void
setpaddress(pte_t *pte, uint64 new_ppn)
{
  uint64 masked_pte = *pte & ~0x3FFFFFFFFFFFFL;
  uint64 new_ppn_shifted = (new_ppn << 10) & 0x3FFFFFFFFFFFFL;
  *pte = masked_pte | new_ppn_shifted;
}

int
ispteready(pte_t *pte)
{
  return (*pte & PTE_V) && !(*pte & PTE_PENDING_DISK_OPERATION);
}

int
ispteswappable(pagetable_t pagetable, uint64 va, pte_t *pte)
{
  return  pagetable != kernel_pagetable
          && (uint64*)getpaddress(pte) != pagetable
          && *pte & PTE_U
          && !(*pte & PTE_X)
          && va != TRAMPOLINE
          && va != TRAPFRAME;
}

struct lrupinfo*
getfirstfreelrupage()
{
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
  {
    if(lrupages[i].pte == 0)
    {
      return &(lrupages[i]);
    }
  }

  return 0;
}

struct lrupinfo*
getpinfo(uint64 va, pagetable_t pagetable)
{
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
  {
    if(lrupages[i].pte == 0) continue;
    if(lrupages[i].pagetable == pagetable && lrupages[i].va == va)
    {
      return &(lrupages[i]);
    }
  }

  return 0;
}

void
reglrupage(pte_t *pte, uint64 va, pagetable_t pagetable)
{
  yielddisabled++;

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
  if(pinfo == 0)
  {
    pinfo = getfirstfreelrupage();
    if(pinfo == 0)
    {
      yielddisabled--;
      panic("reglrupage: no more space in lrupages");
    }

    pinfo->va = va;
    pinfo->pagetable = pagetable;
  }
  else // TODO: Does this ever happen?
  {
    yielddisabled--;
    panic("getpinfo: edge case isreal");
  }

  pinfo->refhistory = 0;
  pinfo->pte = pte;

  yielddisabled--;
}

void
unreglrupage(uint64 va, pagetable_t pagetable)
{
  yielddisabled++;

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
  if(pinfo == 0)
  {
    yielddisabled--;
    panic("unreglrupage: not mapped");
  }

  *pinfo = (struct lrupinfo){0};

  yielddisabled--;
}

void
updaterefhistory()
{
  yielddisabled++;

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
  {
    pte_t *pte = lrupages[i].pte;
    if(pte == 0) continue;
    if(*pte & PTE_ON_DISK) continue;

    uchar a = ( *pte & PTE_A ) == 0 ? 0 : 1;
    *pte &= ~PTE_A; // A = 0

    uchar mask = a << ( sizeof(uchar) * 8 - 1 );
    lrupages[i].refhistory = (lrupages[i].refhistory >> 1) | mask;
  }

  yielddisabled--;
}

struct lrupinfo*
getvictim()
{
  uchar minhistory = ~0;
  struct lrupinfo *result = 0;

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
  {
    pte_t *pte = lrupages[i].pte;
    if(pte == 0) continue;

    if(ispteready(pte) && lrupages[i].refhistory < minhistory)
    {
      result = &(lrupages[i]);
      minhistory = lrupages[i].refhistory;
    }
  }

  return result;
}

// Returns free page, 0 if there is none
void*
swapout()
{
  yielddisabled++;

  struct lrupinfo *pinfo = getvictim();
  if(pinfo == 0)
    panic("swapout: no victim!");

  pte_t *pte = pinfo->pte;
  uchar *data = (uchar*)getpaddress(pte);

  int diskpageno = write_page_to_disk(data);
  if(diskpageno < 0)
  {
    yielddisabled--;
    return 0;
  }

  setpaddress(pte, (uint64)diskpageno);
  *pte &= ~PTE_V; // V = 0
  *pte |= PTE_ON_DISK; // ON_DISK = 1
  pinfo->refhistory = 0;
  sfence_vma(); // Flush TLB

  yielddisabled--;
  return (void*)data;
}

int
swapin(uint64 va, pagetable_t pagetable)
{
  yielddisabled++;

  pte_t *pte = getpinfo(va, pagetable)->pte;
  if((*pte & PTE_ON_DISK) == 0)
    return 0;

  uchar *rampage = kalloc();
  if(rampage == 0)
  {
    yielddisabled--;
    return 0;
  }

  int diskpageno = (int) getpaddress(pte);
  take_page_from_disk(diskpageno, rampage);

  setpaddress(pte, (uint64)rampage);
  *pte |= PTE_V; // V = 1
  *pte &= ~PTE_ON_DISK; // ON_DISK = 0
  sfence_vma(); // Flush TLB

  yielddisabled--;
  return 1;
}