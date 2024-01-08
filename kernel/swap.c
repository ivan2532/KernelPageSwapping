#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "defs.h"
#include "spinlock.h"

#define RAM_PAGES_COUNT ( ((PHYSTOP - KERNBASE) / PGSIZE)*2 )

extern pagetable_t kernel_pagetable;

volatile int yielddisabled = 0;

void
enableyield(struct spinlock *lock1, struct spinlock *lock2)
{
  if(!yielddisabled)
    return;

  if(lock1 != 0)
    acquire(lock1);
  if(lock2 != 0)
    acquire(lock2);

  yielddisabled = 0;
}

void
disableyield(struct spinlock *lock1, struct spinlock *lock2)
{
  if(yielddisabled)
    return;

  yielddisabled = 1;

  if(lock2 != 0)
    release(lock2);
  if(lock1 != 0)
    release(lock1);
}

struct lrupinfo {
  uchar refhistory;
  pte_t *pte;
  uint64 va;
  pagetable_t pagetable;
};

static struct lrupinfo lrupages[RAM_PAGES_COUNT] = {{0} };

void
setpaddress(pte_t *pte, uint64 pa)
{
  uint64 upper = (*pte >> 54) << 54;
  uint64 lower = (*pte << 54) >> 54;
  *pte = upper | PA2PTE(pa) | lower;
}

int
ispteswappable(pagetable_t pagetable, uint64 va, pte_t *pte)
{
  uint64 va_aligned = PGROUNDDOWN(va);
  return  pagetable != kernel_pagetable
          && (uint64*)PTE2PA(*pte) != pagetable
          && *pte & PTE_U
          && !(*pte & PTE_G)
          && va_aligned != TRAMPOLINE
          && va_aligned != TRAPFRAME;
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
  uint64 va_aligned = PGROUNDDOWN(va);
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
  {
    if(lrupages[i].pte == 0) continue;
    if(lrupages[i].pagetable == pagetable && lrupages[i].va == va_aligned)
    {
      return &(lrupages[i]);
    }
  }

  return 0;
}

void
reglrupage(pte_t *pte, uint64 va, pagetable_t pagetable)
{
  if(pte == 0)
    panic("reglrupage: pte is 0");

  int nestedcall = yielddisabled;
  disableyield(0, 0);

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
  if(pinfo == 0)
  {
    pinfo = getfirstfreelrupage();
    if(pinfo == 0)
    {
      if(!nestedcall)
        enableyield(0, 0);

      panic("reglrupage: no more space in lrupages");
    }

    pinfo->va = PGROUNDDOWN(va);
    pinfo->pagetable = pagetable;
  }
  else // TODO: Does this ever happen?
  {
    if(!nestedcall)
      enableyield(0, 0);

    panic("getpinfo: edge case isreal");
  }

  pinfo->refhistory = 0;
  pinfo->pte = pte;

  if(!nestedcall)
    enableyield(0, 0);
}

void
unreglrupage(pte_t *pte, uint64 va, pagetable_t pagetable)
{
  int nestedcall = yielddisabled;
  disableyield(0, 0);

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
  if(pinfo == 0)
  {
    if(!nestedcall)
      enableyield(0, 0);

    panic("unreglrupage: not mapped");
  }

  *pinfo = (struct lrupinfo){0};
  if(*pte & PTE_ON_DISK)
    deallocate_page(PTE2DPN(*pte));

  if(!nestedcall)
    enableyield(0, 0);
}

void
updaterefhistory()
{
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

    if((*pte & PTE_V) && lrupages[i].refhistory < minhistory)
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
  int nestedcall = yielddisabled;
  disableyield(0, 0);

  struct lrupinfo *pinfo = getvictim();
  if(pinfo == 0)
    panic("swapout: no victim!");

  pte_t *pte = pinfo->pte;
  uchar *data = (uchar*)PTE2PA(*pte);

  int diskpageno = write_page_to_disk(data);
  if(diskpageno < 0)
  {
    if(!nestedcall)
      enableyield(0, 0);

    return 0;
  }

  setpaddress(pte, ((uint64)diskpageno) << 12);
  *pte &= ~PTE_V; // V = 0
  *pte |= PTE_ON_DISK; // ON_DISK = 1
  pinfo->refhistory = 0;
  sfence_vma(); // Flush TLB

  if(!nestedcall)
    enableyield(0, 0);

  return (void*)data;
}

int
swapin(uint64 va, pagetable_t pagetable)
{
  int nestedcall = yielddisabled;
  disableyield(0, 0);

  struct lrupinfo *pinfo = getpinfo(va, pagetable);
  if(pinfo == 0)
  {
    if(!nestedcall)
      enableyield(0, 0);

    return 0;
  }

  pte_t *pte = pinfo->pte;
  if((*pte & PTE_ON_DISK) == 0)
  {
    if(!nestedcall)
      enableyield(0, 0);

    return 0;
  }

  uchar *rampage = kalloc();
  if(rampage == 0)
  {
    if(!nestedcall)
      enableyield(0, 0);

    return 0;
  }

  take_page_from_disk(PTE2DPN(*pte), rampage);

  setpaddress(pte, (uint64)rampage);
  *pte |= PTE_V; // V = 1
  *pte &= ~PTE_ON_DISK; // ON_DISK = 0
  sfence_vma(); // Flush TLB

  if(!nestedcall)
    enableyield(0, 0);

  return 1;
}