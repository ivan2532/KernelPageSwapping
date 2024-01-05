
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	90813103          	ld	sp,-1784(sp) # 8000b908 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	6505                	lui	a0,0x1
    8000000a:	f14025f3          	csrr	a1,mhartid
    8000000e:	0585                	addi	a1,a1,1
    80000010:	02b50533          	mul	a0,a0,a1
    80000014:	912a                	add	sp,sp,a0
    80000016:	1a4000ef          	jal	ra,800001ba <start>

000000008000001a <spin>:
    8000001a:	a001                	j	8000001a <spin>

000000008000001c <r_mhartid>:
#ifndef __ASSEMBLER__

// which hart (core) is this?
static inline uint64
r_mhartid()
{
    8000001c:	1101                	addi	sp,sp,-32
    8000001e:	ec22                	sd	s0,24(sp)
    80000020:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mhartid" : "=r" (x) );
    80000022:	f14027f3          	csrr	a5,mhartid
    80000026:	fef43423          	sd	a5,-24(s0)
  return x;
    8000002a:	fe843783          	ld	a5,-24(s0)
}
    8000002e:	853e                	mv	a0,a5
    80000030:	6462                	ld	s0,24(sp)
    80000032:	6105                	addi	sp,sp,32
    80000034:	8082                	ret

0000000080000036 <r_mstatus>:
#define MSTATUS_MPP_U (0L << 11)
#define MSTATUS_MIE (1L << 3)    // machine-mode interrupt enable.

static inline uint64
r_mstatus()
{
    80000036:	1101                	addi	sp,sp,-32
    80000038:	ec22                	sd	s0,24(sp)
    8000003a:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mstatus" : "=r" (x) );
    8000003c:	300027f3          	csrr	a5,mstatus
    80000040:	fef43423          	sd	a5,-24(s0)
  return x;
    80000044:	fe843783          	ld	a5,-24(s0)
}
    80000048:	853e                	mv	a0,a5
    8000004a:	6462                	ld	s0,24(sp)
    8000004c:	6105                	addi	sp,sp,32
    8000004e:	8082                	ret

0000000080000050 <w_mstatus>:

static inline void 
w_mstatus(uint64 x)
{
    80000050:	1101                	addi	sp,sp,-32
    80000052:	ec22                	sd	s0,24(sp)
    80000054:	1000                	addi	s0,sp,32
    80000056:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mstatus, %0" : : "r" (x));
    8000005a:	fe843783          	ld	a5,-24(s0)
    8000005e:	30079073          	csrw	mstatus,a5
}
    80000062:	0001                	nop
    80000064:	6462                	ld	s0,24(sp)
    80000066:	6105                	addi	sp,sp,32
    80000068:	8082                	ret

000000008000006a <w_mepc>:
// machine exception program counter, holds the
// instruction address to which a return from
// exception will go.
static inline void 
w_mepc(uint64 x)
{
    8000006a:	1101                	addi	sp,sp,-32
    8000006c:	ec22                	sd	s0,24(sp)
    8000006e:	1000                	addi	s0,sp,32
    80000070:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mepc, %0" : : "r" (x));
    80000074:	fe843783          	ld	a5,-24(s0)
    80000078:	34179073          	csrw	mepc,a5
}
    8000007c:	0001                	nop
    8000007e:	6462                	ld	s0,24(sp)
    80000080:	6105                	addi	sp,sp,32
    80000082:	8082                	ret

0000000080000084 <r_sie>:
#define SIE_SEIE (1L << 9) // external
#define SIE_STIE (1L << 5) // timer
#define SIE_SSIE (1L << 1) // software
static inline uint64
r_sie()
{
    80000084:	1101                	addi	sp,sp,-32
    80000086:	ec22                	sd	s0,24(sp)
    80000088:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, sie" : "=r" (x) );
    8000008a:	104027f3          	csrr	a5,sie
    8000008e:	fef43423          	sd	a5,-24(s0)
  return x;
    80000092:	fe843783          	ld	a5,-24(s0)
}
    80000096:	853e                	mv	a0,a5
    80000098:	6462                	ld	s0,24(sp)
    8000009a:	6105                	addi	sp,sp,32
    8000009c:	8082                	ret

000000008000009e <w_sie>:

static inline void 
w_sie(uint64 x)
{
    8000009e:	1101                	addi	sp,sp,-32
    800000a0:	ec22                	sd	s0,24(sp)
    800000a2:	1000                	addi	s0,sp,32
    800000a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sie, %0" : : "r" (x));
    800000a8:	fe843783          	ld	a5,-24(s0)
    800000ac:	10479073          	csrw	sie,a5
}
    800000b0:	0001                	nop
    800000b2:	6462                	ld	s0,24(sp)
    800000b4:	6105                	addi	sp,sp,32
    800000b6:	8082                	ret

00000000800000b8 <r_mie>:
#define MIE_MEIE (1L << 11) // external
#define MIE_MTIE (1L << 7)  // timer
#define MIE_MSIE (1L << 3)  // software
static inline uint64
r_mie()
{
    800000b8:	1101                	addi	sp,sp,-32
    800000ba:	ec22                	sd	s0,24(sp)
    800000bc:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("csrr %0, mie" : "=r" (x) );
    800000be:	304027f3          	csrr	a5,mie
    800000c2:	fef43423          	sd	a5,-24(s0)
  return x;
    800000c6:	fe843783          	ld	a5,-24(s0)
}
    800000ca:	853e                	mv	a0,a5
    800000cc:	6462                	ld	s0,24(sp)
    800000ce:	6105                	addi	sp,sp,32
    800000d0:	8082                	ret

00000000800000d2 <w_mie>:

static inline void 
w_mie(uint64 x)
{
    800000d2:	1101                	addi	sp,sp,-32
    800000d4:	ec22                	sd	s0,24(sp)
    800000d6:	1000                	addi	s0,sp,32
    800000d8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mie, %0" : : "r" (x));
    800000dc:	fe843783          	ld	a5,-24(s0)
    800000e0:	30479073          	csrw	mie,a5
}
    800000e4:	0001                	nop
    800000e6:	6462                	ld	s0,24(sp)
    800000e8:	6105                	addi	sp,sp,32
    800000ea:	8082                	ret

00000000800000ec <w_medeleg>:
  return x;
}

static inline void 
w_medeleg(uint64 x)
{
    800000ec:	1101                	addi	sp,sp,-32
    800000ee:	ec22                	sd	s0,24(sp)
    800000f0:	1000                	addi	s0,sp,32
    800000f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw medeleg, %0" : : "r" (x));
    800000f6:	fe843783          	ld	a5,-24(s0)
    800000fa:	30279073          	csrw	medeleg,a5
}
    800000fe:	0001                	nop
    80000100:	6462                	ld	s0,24(sp)
    80000102:	6105                	addi	sp,sp,32
    80000104:	8082                	ret

0000000080000106 <w_mideleg>:
  return x;
}

static inline void 
w_mideleg(uint64 x)
{
    80000106:	1101                	addi	sp,sp,-32
    80000108:	ec22                	sd	s0,24(sp)
    8000010a:	1000                	addi	s0,sp,32
    8000010c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mideleg, %0" : : "r" (x));
    80000110:	fe843783          	ld	a5,-24(s0)
    80000114:	30379073          	csrw	mideleg,a5
}
    80000118:	0001                	nop
    8000011a:	6462                	ld	s0,24(sp)
    8000011c:	6105                	addi	sp,sp,32
    8000011e:	8082                	ret

0000000080000120 <w_mtvec>:
}

// Machine-mode interrupt vector
static inline void 
w_mtvec(uint64 x)
{
    80000120:	1101                	addi	sp,sp,-32
    80000122:	ec22                	sd	s0,24(sp)
    80000124:	1000                	addi	s0,sp,32
    80000126:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mtvec, %0" : : "r" (x));
    8000012a:	fe843783          	ld	a5,-24(s0)
    8000012e:	30579073          	csrw	mtvec,a5
}
    80000132:	0001                	nop
    80000134:	6462                	ld	s0,24(sp)
    80000136:	6105                	addi	sp,sp,32
    80000138:	8082                	ret

000000008000013a <w_pmpcfg0>:

// Physical Memory Protection
static inline void
w_pmpcfg0(uint64 x)
{
    8000013a:	1101                	addi	sp,sp,-32
    8000013c:	ec22                	sd	s0,24(sp)
    8000013e:	1000                	addi	s0,sp,32
    80000140:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpcfg0, %0" : : "r" (x));
    80000144:	fe843783          	ld	a5,-24(s0)
    80000148:	3a079073          	csrw	pmpcfg0,a5
}
    8000014c:	0001                	nop
    8000014e:	6462                	ld	s0,24(sp)
    80000150:	6105                	addi	sp,sp,32
    80000152:	8082                	ret

0000000080000154 <w_pmpaddr0>:

static inline void
w_pmpaddr0(uint64 x)
{
    80000154:	1101                	addi	sp,sp,-32
    80000156:	ec22                	sd	s0,24(sp)
    80000158:	1000                	addi	s0,sp,32
    8000015a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw pmpaddr0, %0" : : "r" (x));
    8000015e:	fe843783          	ld	a5,-24(s0)
    80000162:	3b079073          	csrw	pmpaddr0,a5
}
    80000166:	0001                	nop
    80000168:	6462                	ld	s0,24(sp)
    8000016a:	6105                	addi	sp,sp,32
    8000016c:	8082                	ret

000000008000016e <w_satp>:

// supervisor address translation and protection;
// holds the address of the page table.
static inline void 
w_satp(uint64 x)
{
    8000016e:	1101                	addi	sp,sp,-32
    80000170:	ec22                	sd	s0,24(sp)
    80000172:	1000                	addi	s0,sp,32
    80000174:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80000178:	fe843783          	ld	a5,-24(s0)
    8000017c:	18079073          	csrw	satp,a5
}
    80000180:	0001                	nop
    80000182:	6462                	ld	s0,24(sp)
    80000184:	6105                	addi	sp,sp,32
    80000186:	8082                	ret

0000000080000188 <w_mscratch>:
  return x;
}

static inline void 
w_mscratch(uint64 x)
{
    80000188:	1101                	addi	sp,sp,-32
    8000018a:	ec22                	sd	s0,24(sp)
    8000018c:	1000                	addi	s0,sp,32
    8000018e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw mscratch, %0" : : "r" (x));
    80000192:	fe843783          	ld	a5,-24(s0)
    80000196:	34079073          	csrw	mscratch,a5
}
    8000019a:	0001                	nop
    8000019c:	6462                	ld	s0,24(sp)
    8000019e:	6105                	addi	sp,sp,32
    800001a0:	8082                	ret

00000000800001a2 <w_tp>:
  return x;
}

static inline void 
w_tp(uint64 x)
{
    800001a2:	1101                	addi	sp,sp,-32
    800001a4:	ec22                	sd	s0,24(sp)
    800001a6:	1000                	addi	s0,sp,32
    800001a8:	fea43423          	sd	a0,-24(s0)
  asm volatile("mv tp, %0" : : "r" (x));
    800001ac:	fe843783          	ld	a5,-24(s0)
    800001b0:	823e                	mv	tp,a5
}
    800001b2:	0001                	nop
    800001b4:	6462                	ld	s0,24(sp)
    800001b6:	6105                	addi	sp,sp,32
    800001b8:	8082                	ret

00000000800001ba <start>:
extern void timervec();

// entry.S jumps here in machine mode on stack0.
void
start()
{
    800001ba:	1101                	addi	sp,sp,-32
    800001bc:	ec06                	sd	ra,24(sp)
    800001be:	e822                	sd	s0,16(sp)
    800001c0:	1000                	addi	s0,sp,32
  // set M Previous Privilege mode to Supervisor, for mret.
  unsigned long x = r_mstatus();
    800001c2:	00000097          	auipc	ra,0x0
    800001c6:	e74080e7          	jalr	-396(ra) # 80000036 <r_mstatus>
    800001ca:	fea43423          	sd	a0,-24(s0)
  x &= ~MSTATUS_MPP_MASK;
    800001ce:	fe843703          	ld	a4,-24(s0)
    800001d2:	77f9                	lui	a5,0xffffe
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffc98cf>
    800001d8:	8ff9                	and	a5,a5,a4
    800001da:	fef43423          	sd	a5,-24(s0)
  x |= MSTATUS_MPP_S;
    800001de:	fe843703          	ld	a4,-24(s0)
    800001e2:	6785                	lui	a5,0x1
    800001e4:	80078793          	addi	a5,a5,-2048 # 800 <_entry-0x7ffff800>
    800001e8:	8fd9                	or	a5,a5,a4
    800001ea:	fef43423          	sd	a5,-24(s0)
  w_mstatus(x);
    800001ee:	fe843503          	ld	a0,-24(s0)
    800001f2:	00000097          	auipc	ra,0x0
    800001f6:	e5e080e7          	jalr	-418(ra) # 80000050 <w_mstatus>

  // set M Exception Program Counter to main, for mret.
  // requires gcc -mcmodel=medany
  w_mepc((uint64)main);
    800001fa:	00001797          	auipc	a5,0x1
    800001fe:	6b878793          	addi	a5,a5,1720 # 800018b2 <main>
    80000202:	853e                	mv	a0,a5
    80000204:	00000097          	auipc	ra,0x0
    80000208:	e66080e7          	jalr	-410(ra) # 8000006a <w_mepc>

  // disable paging for now.
  w_satp(0);
    8000020c:	4501                	li	a0,0
    8000020e:	00000097          	auipc	ra,0x0
    80000212:	f60080e7          	jalr	-160(ra) # 8000016e <w_satp>

  // delegate all interrupts and exceptions to supervisor mode.
  w_medeleg(0xffff);
    80000216:	67c1                	lui	a5,0x10
    80000218:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000021c:	00000097          	auipc	ra,0x0
    80000220:	ed0080e7          	jalr	-304(ra) # 800000ec <w_medeleg>
  w_mideleg(0xffff);
    80000224:	67c1                	lui	a5,0x10
    80000226:	fff78513          	addi	a0,a5,-1 # ffff <_entry-0x7fff0001>
    8000022a:	00000097          	auipc	ra,0x0
    8000022e:	edc080e7          	jalr	-292(ra) # 80000106 <w_mideleg>
  w_sie(r_sie() | SIE_SEIE | SIE_STIE | SIE_SSIE);
    80000232:	00000097          	auipc	ra,0x0
    80000236:	e52080e7          	jalr	-430(ra) # 80000084 <r_sie>
    8000023a:	87aa                	mv	a5,a0
    8000023c:	2227e793          	ori	a5,a5,546
    80000240:	853e                	mv	a0,a5
    80000242:	00000097          	auipc	ra,0x0
    80000246:	e5c080e7          	jalr	-420(ra) # 8000009e <w_sie>

  // configure Physical Memory Protection to give supervisor mode
  // access to all of physical memory.
  w_pmpaddr0(0x3fffffffffffffull);
    8000024a:	57fd                	li	a5,-1
    8000024c:	00a7d513          	srli	a0,a5,0xa
    80000250:	00000097          	auipc	ra,0x0
    80000254:	f04080e7          	jalr	-252(ra) # 80000154 <w_pmpaddr0>
  w_pmpcfg0(0xf);
    80000258:	453d                	li	a0,15
    8000025a:	00000097          	auipc	ra,0x0
    8000025e:	ee0080e7          	jalr	-288(ra) # 8000013a <w_pmpcfg0>

  // ask for clock interrupts.
  timerinit();
    80000262:	00000097          	auipc	ra,0x0
    80000266:	032080e7          	jalr	50(ra) # 80000294 <timerinit>

  // keep each CPU's hartid in its tp register, for cpuid().
  int id = r_mhartid();
    8000026a:	00000097          	auipc	ra,0x0
    8000026e:	db2080e7          	jalr	-590(ra) # 8000001c <r_mhartid>
    80000272:	87aa                	mv	a5,a0
    80000274:	fef42223          	sw	a5,-28(s0)
  w_tp(id);
    80000278:	fe442783          	lw	a5,-28(s0)
    8000027c:	853e                	mv	a0,a5
    8000027e:	00000097          	auipc	ra,0x0
    80000282:	f24080e7          	jalr	-220(ra) # 800001a2 <w_tp>

  // switch to supervisor mode and jump to main().
  asm volatile("mret");
    80000286:	30200073          	mret
}
    8000028a:	0001                	nop
    8000028c:	60e2                	ld	ra,24(sp)
    8000028e:	6442                	ld	s0,16(sp)
    80000290:	6105                	addi	sp,sp,32
    80000292:	8082                	ret

0000000080000294 <timerinit>:
// at timervec in kernelvec.S,
// which turns them into software interrupts for
// devintr() in trap.c.
void
timerinit()
{
    80000294:	1101                	addi	sp,sp,-32
    80000296:	ec06                	sd	ra,24(sp)
    80000298:	e822                	sd	s0,16(sp)
    8000029a:	1000                	addi	s0,sp,32
  // each CPU has a separate source of timer interrupts.
  int id = r_mhartid();
    8000029c:	00000097          	auipc	ra,0x0
    800002a0:	d80080e7          	jalr	-640(ra) # 8000001c <r_mhartid>
    800002a4:	87aa                	mv	a5,a0
    800002a6:	fef42623          	sw	a5,-20(s0)

  // ask the CLINT for a timer interrupt.
  int interval = 100000; // cycles; about 1/100th second in qemu.
    800002aa:	67e1                	lui	a5,0x18
    800002ac:	6a07879b          	addiw	a5,a5,1696
    800002b0:	fef42423          	sw	a5,-24(s0)
  *(uint64*)CLINT_MTIMECMP(id) = *(uint64*)CLINT_MTIME + interval;
    800002b4:	0200c7b7          	lui	a5,0x200c
    800002b8:	17e1                	addi	a5,a5,-8
    800002ba:	6398                	ld	a4,0(a5)
    800002bc:	fe842783          	lw	a5,-24(s0)
    800002c0:	fec42683          	lw	a3,-20(s0)
    800002c4:	0036969b          	slliw	a3,a3,0x3
    800002c8:	2681                	sext.w	a3,a3
    800002ca:	8636                	mv	a2,a3
    800002cc:	020046b7          	lui	a3,0x2004
    800002d0:	96b2                	add	a3,a3,a2
    800002d2:	97ba                	add	a5,a5,a4
    800002d4:	e29c                	sd	a5,0(a3)

  // prepare information in scratch[] for timervec.
  // scratch[0..2] : space for timervec to save registers.
  // scratch[3] : address of CLINT MTIMECMP register.
  // scratch[4] : desired interval (in cycles) between timer interrupts.
  uint64 *scratch = &timer_scratch[id][0];
    800002d6:	fec42703          	lw	a4,-20(s0)
    800002da:	87ba                	mv	a5,a4
    800002dc:	078a                	slli	a5,a5,0x2
    800002de:	97ba                	add	a5,a5,a4
    800002e0:	078e                	slli	a5,a5,0x3
    800002e2:	00013717          	auipc	a4,0x13
    800002e6:	66e70713          	addi	a4,a4,1646 # 80013950 <timer_scratch>
    800002ea:	97ba                	add	a5,a5,a4
    800002ec:	fef43023          	sd	a5,-32(s0)
  scratch[3] = CLINT_MTIMECMP(id);
    800002f0:	fec42783          	lw	a5,-20(s0)
    800002f4:	0037979b          	slliw	a5,a5,0x3
    800002f8:	2781                	sext.w	a5,a5
    800002fa:	873e                	mv	a4,a5
    800002fc:	020047b7          	lui	a5,0x2004
    80000300:	973e                	add	a4,a4,a5
    80000302:	fe043783          	ld	a5,-32(s0)
    80000306:	07e1                	addi	a5,a5,24
    80000308:	e398                	sd	a4,0(a5)
  scratch[4] = interval;
    8000030a:	fe043783          	ld	a5,-32(s0)
    8000030e:	02078793          	addi	a5,a5,32 # 2004020 <_entry-0x7dffbfe0>
    80000312:	fe842703          	lw	a4,-24(s0)
    80000316:	e398                	sd	a4,0(a5)
  w_mscratch((uint64)scratch);
    80000318:	fe043783          	ld	a5,-32(s0)
    8000031c:	853e                	mv	a0,a5
    8000031e:	00000097          	auipc	ra,0x0
    80000322:	e6a080e7          	jalr	-406(ra) # 80000188 <w_mscratch>

  // set the machine-mode trap handler.
  w_mtvec((uint64)timervec);
    80000326:	00008797          	auipc	a5,0x8
    8000032a:	6da78793          	addi	a5,a5,1754 # 80008a00 <timervec>
    8000032e:	853e                	mv	a0,a5
    80000330:	00000097          	auipc	ra,0x0
    80000334:	df0080e7          	jalr	-528(ra) # 80000120 <w_mtvec>

  // enable machine-mode interrupts.
  w_mstatus(r_mstatus() | MSTATUS_MIE);
    80000338:	00000097          	auipc	ra,0x0
    8000033c:	cfe080e7          	jalr	-770(ra) # 80000036 <r_mstatus>
    80000340:	87aa                	mv	a5,a0
    80000342:	0087e793          	ori	a5,a5,8
    80000346:	853e                	mv	a0,a5
    80000348:	00000097          	auipc	ra,0x0
    8000034c:	d08080e7          	jalr	-760(ra) # 80000050 <w_mstatus>

  // enable machine-mode timer interrupts.
  w_mie(r_mie() | MIE_MTIE);
    80000350:	00000097          	auipc	ra,0x0
    80000354:	d68080e7          	jalr	-664(ra) # 800000b8 <r_mie>
    80000358:	87aa                	mv	a5,a0
    8000035a:	0807e793          	ori	a5,a5,128
    8000035e:	853e                	mv	a0,a5
    80000360:	00000097          	auipc	ra,0x0
    80000364:	d72080e7          	jalr	-654(ra) # 800000d2 <w_mie>
}
    80000368:	0001                	nop
    8000036a:	60e2                	ld	ra,24(sp)
    8000036c:	6442                	ld	s0,16(sp)
    8000036e:	6105                	addi	sp,sp,32
    80000370:	8082                	ret

0000000080000372 <consputc>:
// called by printf(), and to echo input characters,
// but not from write().
//
void
consputc(int c)
{
    80000372:	1101                	addi	sp,sp,-32
    80000374:	ec06                	sd	ra,24(sp)
    80000376:	e822                	sd	s0,16(sp)
    80000378:	1000                	addi	s0,sp,32
    8000037a:	87aa                	mv	a5,a0
    8000037c:	fef42623          	sw	a5,-20(s0)
  if(c == BACKSPACE){
    80000380:	fec42783          	lw	a5,-20(s0)
    80000384:	0007871b          	sext.w	a4,a5
    80000388:	10000793          	li	a5,256
    8000038c:	02f71363          	bne	a4,a5,800003b2 <consputc+0x40>
    // if the user typed backspace, overwrite with a space.
    uartputc_sync('\b'); uartputc_sync(' '); uartputc_sync('\b');
    80000390:	4521                	li	a0,8
    80000392:	00001097          	auipc	ra,0x1
    80000396:	b66080e7          	jalr	-1178(ra) # 80000ef8 <uartputc_sync>
    8000039a:	02000513          	li	a0,32
    8000039e:	00001097          	auipc	ra,0x1
    800003a2:	b5a080e7          	jalr	-1190(ra) # 80000ef8 <uartputc_sync>
    800003a6:	4521                	li	a0,8
    800003a8:	00001097          	auipc	ra,0x1
    800003ac:	b50080e7          	jalr	-1200(ra) # 80000ef8 <uartputc_sync>
  } else {
    uartputc_sync(c);
  }
}
    800003b0:	a801                	j	800003c0 <consputc+0x4e>
    uartputc_sync(c);
    800003b2:	fec42783          	lw	a5,-20(s0)
    800003b6:	853e                	mv	a0,a5
    800003b8:	00001097          	auipc	ra,0x1
    800003bc:	b40080e7          	jalr	-1216(ra) # 80000ef8 <uartputc_sync>
}
    800003c0:	0001                	nop
    800003c2:	60e2                	ld	ra,24(sp)
    800003c4:	6442                	ld	s0,16(sp)
    800003c6:	6105                	addi	sp,sp,32
    800003c8:	8082                	ret

00000000800003ca <consolewrite>:
//
// user write()s to the console go here.
//
int
consolewrite(int user_src, uint64 src, int n)
{
    800003ca:	7179                	addi	sp,sp,-48
    800003cc:	f406                	sd	ra,40(sp)
    800003ce:	f022                	sd	s0,32(sp)
    800003d0:	1800                	addi	s0,sp,48
    800003d2:	87aa                	mv	a5,a0
    800003d4:	fcb43823          	sd	a1,-48(s0)
    800003d8:	8732                	mv	a4,a2
    800003da:	fcf42e23          	sw	a5,-36(s0)
    800003de:	87ba                	mv	a5,a4
    800003e0:	fcf42c23          	sw	a5,-40(s0)
  int i;

  for(i = 0; i < n; i++){
    800003e4:	fe042623          	sw	zero,-20(s0)
    800003e8:	a0a1                	j	80000430 <consolewrite+0x66>
    char c;
    if(either_copyin(&c, user_src, src+i, 1) == -1)
    800003ea:	fec42703          	lw	a4,-20(s0)
    800003ee:	fd043783          	ld	a5,-48(s0)
    800003f2:	00f70633          	add	a2,a4,a5
    800003f6:	fdc42703          	lw	a4,-36(s0)
    800003fa:	feb40793          	addi	a5,s0,-21
    800003fe:	4685                	li	a3,1
    80000400:	85ba                	mv	a1,a4
    80000402:	853e                	mv	a0,a5
    80000404:	00003097          	auipc	ra,0x3
    80000408:	43c080e7          	jalr	1084(ra) # 80003840 <either_copyin>
    8000040c:	87aa                	mv	a5,a0
    8000040e:	873e                	mv	a4,a5
    80000410:	57fd                	li	a5,-1
    80000412:	02f70863          	beq	a4,a5,80000442 <consolewrite+0x78>
      break;
    uartputc(c);
    80000416:	feb44783          	lbu	a5,-21(s0)
    8000041a:	2781                	sext.w	a5,a5
    8000041c:	853e                	mv	a0,a5
    8000041e:	00001097          	auipc	ra,0x1
    80000422:	a1c080e7          	jalr	-1508(ra) # 80000e3a <uartputc>
  for(i = 0; i < n; i++){
    80000426:	fec42783          	lw	a5,-20(s0)
    8000042a:	2785                	addiw	a5,a5,1
    8000042c:	fef42623          	sw	a5,-20(s0)
    80000430:	fec42703          	lw	a4,-20(s0)
    80000434:	fd842783          	lw	a5,-40(s0)
    80000438:	2701                	sext.w	a4,a4
    8000043a:	2781                	sext.w	a5,a5
    8000043c:	faf747e3          	blt	a4,a5,800003ea <consolewrite+0x20>
    80000440:	a011                	j	80000444 <consolewrite+0x7a>
      break;
    80000442:	0001                	nop
  }

  return i;
    80000444:	fec42783          	lw	a5,-20(s0)
}
    80000448:	853e                	mv	a0,a5
    8000044a:	70a2                	ld	ra,40(sp)
    8000044c:	7402                	ld	s0,32(sp)
    8000044e:	6145                	addi	sp,sp,48
    80000450:	8082                	ret

0000000080000452 <consoleread>:
// user_dist indicates whether dst is a user
// or kernel address.
//
int
consoleread(int user_dst, uint64 dst, int n)
{
    80000452:	7179                	addi	sp,sp,-48
    80000454:	f406                	sd	ra,40(sp)
    80000456:	f022                	sd	s0,32(sp)
    80000458:	1800                	addi	s0,sp,48
    8000045a:	87aa                	mv	a5,a0
    8000045c:	fcb43823          	sd	a1,-48(s0)
    80000460:	8732                	mv	a4,a2
    80000462:	fcf42e23          	sw	a5,-36(s0)
    80000466:	87ba                	mv	a5,a4
    80000468:	fcf42c23          	sw	a5,-40(s0)
  uint target;
  int c;
  char cbuf;

  target = n;
    8000046c:	fd842783          	lw	a5,-40(s0)
    80000470:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000474:	00013517          	auipc	a0,0x13
    80000478:	61c50513          	addi	a0,a0,1564 # 80013a90 <cons>
    8000047c:	00001097          	auipc	ra,0x1
    80000480:	eae080e7          	jalr	-338(ra) # 8000132a <acquire>
  while(n > 0){
    80000484:	a23d                	j	800005b2 <consoleread+0x160>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    80000486:	00002097          	auipc	ra,0x2
    8000048a:	536080e7          	jalr	1334(ra) # 800029bc <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	2fa080e7          	jalr	762(ra) # 8000378c <killed>
    8000049a:	87aa                	mv	a5,a0
    8000049c:	cb99                	beqz	a5,800004b2 <consoleread+0x60>
        release(&cons.lock);
    8000049e:	00013517          	auipc	a0,0x13
    800004a2:	5f250513          	addi	a0,a0,1522 # 80013a90 <cons>
    800004a6:	00001097          	auipc	ra,0x1
    800004aa:	ee8080e7          	jalr	-280(ra) # 8000138e <release>
        return -1;
    800004ae:	57fd                	li	a5,-1
    800004b0:	aa25                	j	800005e8 <consoleread+0x196>
      }
      sleep(&cons.r, &cons.lock);
    800004b2:	00013597          	auipc	a1,0x13
    800004b6:	5de58593          	addi	a1,a1,1502 # 80013a90 <cons>
    800004ba:	00013517          	auipc	a0,0x13
    800004be:	66e50513          	addi	a0,a0,1646 # 80013b28 <cons+0x98>
    800004c2:	00003097          	auipc	ra,0x3
    800004c6:	0bc080e7          	jalr	188(ra) # 8000357e <sleep>
    while(cons.r == cons.w){
    800004ca:	00013797          	auipc	a5,0x13
    800004ce:	5c678793          	addi	a5,a5,1478 # 80013a90 <cons>
    800004d2:	0987a703          	lw	a4,152(a5)
    800004d6:	00013797          	auipc	a5,0x13
    800004da:	5ba78793          	addi	a5,a5,1466 # 80013a90 <cons>
    800004de:	09c7a783          	lw	a5,156(a5)
    800004e2:	faf702e3          	beq	a4,a5,80000486 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
    800004e6:	00013797          	auipc	a5,0x13
    800004ea:	5aa78793          	addi	a5,a5,1450 # 80013a90 <cons>
    800004ee:	0987a783          	lw	a5,152(a5)
    800004f2:	2781                	sext.w	a5,a5
    800004f4:	0017871b          	addiw	a4,a5,1
    800004f8:	0007069b          	sext.w	a3,a4
    800004fc:	00013717          	auipc	a4,0x13
    80000500:	59470713          	addi	a4,a4,1428 # 80013a90 <cons>
    80000504:	08d72c23          	sw	a3,152(a4)
    80000508:	07f7f793          	andi	a5,a5,127
    8000050c:	2781                	sext.w	a5,a5
    8000050e:	00013717          	auipc	a4,0x13
    80000512:	58270713          	addi	a4,a4,1410 # 80013a90 <cons>
    80000516:	1782                	slli	a5,a5,0x20
    80000518:	9381                	srli	a5,a5,0x20
    8000051a:	97ba                	add	a5,a5,a4
    8000051c:	0187c783          	lbu	a5,24(a5)
    80000520:	fef42423          	sw	a5,-24(s0)

    if(c == C('D')){  // end-of-file
    80000524:	fe842783          	lw	a5,-24(s0)
    80000528:	0007871b          	sext.w	a4,a5
    8000052c:	4791                	li	a5,4
    8000052e:	02f71963          	bne	a4,a5,80000560 <consoleread+0x10e>
      if(n < target){
    80000532:	fd842703          	lw	a4,-40(s0)
    80000536:	fec42783          	lw	a5,-20(s0)
    8000053a:	2781                	sext.w	a5,a5
    8000053c:	08f77163          	bgeu	a4,a5,800005be <consoleread+0x16c>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        cons.r--;
    80000540:	00013797          	auipc	a5,0x13
    80000544:	55078793          	addi	a5,a5,1360 # 80013a90 <cons>
    80000548:	0987a783          	lw	a5,152(a5)
    8000054c:	37fd                	addiw	a5,a5,-1
    8000054e:	0007871b          	sext.w	a4,a5
    80000552:	00013797          	auipc	a5,0x13
    80000556:	53e78793          	addi	a5,a5,1342 # 80013a90 <cons>
    8000055a:	08e7ac23          	sw	a4,152(a5)
      }
      break;
    8000055e:	a085                	j	800005be <consoleread+0x16c>
    }

    // copy the input byte to the user-space buffer.
    cbuf = c;
    80000560:	fe842783          	lw	a5,-24(s0)
    80000564:	0ff7f793          	andi	a5,a5,255
    80000568:	fef403a3          	sb	a5,-25(s0)
    if(either_copyout(user_dst, dst, &cbuf, 1) == -1)
    8000056c:	fe740713          	addi	a4,s0,-25
    80000570:	fdc42783          	lw	a5,-36(s0)
    80000574:	4685                	li	a3,1
    80000576:	863a                	mv	a2,a4
    80000578:	fd043583          	ld	a1,-48(s0)
    8000057c:	853e                	mv	a0,a5
    8000057e:	00003097          	auipc	ra,0x3
    80000582:	24e080e7          	jalr	590(ra) # 800037cc <either_copyout>
    80000586:	87aa                	mv	a5,a0
    80000588:	873e                	mv	a4,a5
    8000058a:	57fd                	li	a5,-1
    8000058c:	02f70b63          	beq	a4,a5,800005c2 <consoleread+0x170>
      break;

    dst++;
    80000590:	fd043783          	ld	a5,-48(s0)
    80000594:	0785                	addi	a5,a5,1
    80000596:	fcf43823          	sd	a5,-48(s0)
    --n;
    8000059a:	fd842783          	lw	a5,-40(s0)
    8000059e:	37fd                	addiw	a5,a5,-1
    800005a0:	fcf42c23          	sw	a5,-40(s0)

    if(c == '\n'){
    800005a4:	fe842783          	lw	a5,-24(s0)
    800005a8:	0007871b          	sext.w	a4,a5
    800005ac:	47a9                	li	a5,10
    800005ae:	00f70c63          	beq	a4,a5,800005c6 <consoleread+0x174>
  while(n > 0){
    800005b2:	fd842783          	lw	a5,-40(s0)
    800005b6:	2781                	sext.w	a5,a5
    800005b8:	f0f049e3          	bgtz	a5,800004ca <consoleread+0x78>
    800005bc:	a031                	j	800005c8 <consoleread+0x176>
      break;
    800005be:	0001                	nop
    800005c0:	a021                	j	800005c8 <consoleread+0x176>
      break;
    800005c2:	0001                	nop
    800005c4:	a011                	j	800005c8 <consoleread+0x176>
      // a whole line has arrived, return to
      // the user-level read().
      break;
    800005c6:	0001                	nop
    }
  }
  release(&cons.lock);
    800005c8:	00013517          	auipc	a0,0x13
    800005cc:	4c850513          	addi	a0,a0,1224 # 80013a90 <cons>
    800005d0:	00001097          	auipc	ra,0x1
    800005d4:	dbe080e7          	jalr	-578(ra) # 8000138e <release>

  return target - n;
    800005d8:	fd842783          	lw	a5,-40(s0)
    800005dc:	fec42703          	lw	a4,-20(s0)
    800005e0:	40f707bb          	subw	a5,a4,a5
    800005e4:	2781                	sext.w	a5,a5
    800005e6:	2781                	sext.w	a5,a5
}
    800005e8:	853e                	mv	a0,a5
    800005ea:	70a2                	ld	ra,40(sp)
    800005ec:	7402                	ld	s0,32(sp)
    800005ee:	6145                	addi	sp,sp,48
    800005f0:	8082                	ret

00000000800005f2 <consoleintr>:
// do erase/kill processing, append to cons.buf,
// wake up consoleread() if a whole line has arrived.
//
void
consoleintr(int c)
{
    800005f2:	1101                	addi	sp,sp,-32
    800005f4:	ec06                	sd	ra,24(sp)
    800005f6:	e822                	sd	s0,16(sp)
    800005f8:	1000                	addi	s0,sp,32
    800005fa:	87aa                	mv	a5,a0
    800005fc:	fef42623          	sw	a5,-20(s0)
  acquire(&cons.lock);
    80000600:	00013517          	auipc	a0,0x13
    80000604:	49050513          	addi	a0,a0,1168 # 80013a90 <cons>
    80000608:	00001097          	auipc	ra,0x1
    8000060c:	d22080e7          	jalr	-734(ra) # 8000132a <acquire>

  switch(c){
    80000610:	fec42783          	lw	a5,-20(s0)
    80000614:	0007871b          	sext.w	a4,a5
    80000618:	07f00793          	li	a5,127
    8000061c:	0cf70763          	beq	a4,a5,800006ea <consoleintr+0xf8>
    80000620:	fec42783          	lw	a5,-20(s0)
    80000624:	0007871b          	sext.w	a4,a5
    80000628:	07f00793          	li	a5,127
    8000062c:	10e7c363          	blt	a5,a4,80000732 <consoleintr+0x140>
    80000630:	fec42783          	lw	a5,-20(s0)
    80000634:	0007871b          	sext.w	a4,a5
    80000638:	47d5                	li	a5,21
    8000063a:	06f70163          	beq	a4,a5,8000069c <consoleintr+0xaa>
    8000063e:	fec42783          	lw	a5,-20(s0)
    80000642:	0007871b          	sext.w	a4,a5
    80000646:	47d5                	li	a5,21
    80000648:	0ee7c563          	blt	a5,a4,80000732 <consoleintr+0x140>
    8000064c:	fec42783          	lw	a5,-20(s0)
    80000650:	0007871b          	sext.w	a4,a5
    80000654:	47a1                	li	a5,8
    80000656:	08f70a63          	beq	a4,a5,800006ea <consoleintr+0xf8>
    8000065a:	fec42783          	lw	a5,-20(s0)
    8000065e:	0007871b          	sext.w	a4,a5
    80000662:	47c1                	li	a5,16
    80000664:	0cf71763          	bne	a4,a5,80000732 <consoleintr+0x140>
  case C('P'):  // Print process list.
    procdump();
    80000668:	00003097          	auipc	ra,0x3
    8000066c:	24c080e7          	jalr	588(ra) # 800038b4 <procdump>
    break;
    80000670:	aad9                	j	80000846 <consoleintr+0x254>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
      cons.e--;
    80000672:	00013797          	auipc	a5,0x13
    80000676:	41e78793          	addi	a5,a5,1054 # 80013a90 <cons>
    8000067a:	0a07a783          	lw	a5,160(a5)
    8000067e:	37fd                	addiw	a5,a5,-1
    80000680:	0007871b          	sext.w	a4,a5
    80000684:	00013797          	auipc	a5,0x13
    80000688:	40c78793          	addi	a5,a5,1036 # 80013a90 <cons>
    8000068c:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000690:	10000513          	li	a0,256
    80000694:	00000097          	auipc	ra,0x0
    80000698:	cde080e7          	jalr	-802(ra) # 80000372 <consputc>
    while(cons.e != cons.w &&
    8000069c:	00013797          	auipc	a5,0x13
    800006a0:	3f478793          	addi	a5,a5,1012 # 80013a90 <cons>
    800006a4:	0a07a703          	lw	a4,160(a5)
    800006a8:	00013797          	auipc	a5,0x13
    800006ac:	3e878793          	addi	a5,a5,1000 # 80013a90 <cons>
    800006b0:	09c7a783          	lw	a5,156(a5)
    800006b4:	18f70463          	beq	a4,a5,8000083c <consoleintr+0x24a>
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
    800006b8:	00013797          	auipc	a5,0x13
    800006bc:	3d878793          	addi	a5,a5,984 # 80013a90 <cons>
    800006c0:	0a07a783          	lw	a5,160(a5)
    800006c4:	37fd                	addiw	a5,a5,-1
    800006c6:	2781                	sext.w	a5,a5
    800006c8:	07f7f793          	andi	a5,a5,127
    800006cc:	2781                	sext.w	a5,a5
    800006ce:	00013717          	auipc	a4,0x13
    800006d2:	3c270713          	addi	a4,a4,962 # 80013a90 <cons>
    800006d6:	1782                	slli	a5,a5,0x20
    800006d8:	9381                	srli	a5,a5,0x20
    800006da:	97ba                	add	a5,a5,a4
    800006dc:	0187c783          	lbu	a5,24(a5)
    while(cons.e != cons.w &&
    800006e0:	873e                	mv	a4,a5
    800006e2:	47a9                	li	a5,10
    800006e4:	f8f717e3          	bne	a4,a5,80000672 <consoleintr+0x80>
    }
    break;
    800006e8:	aa91                	j	8000083c <consoleintr+0x24a>
  case C('H'): // Backspace
  case '\x7f': // Delete key
    if(cons.e != cons.w){
    800006ea:	00013797          	auipc	a5,0x13
    800006ee:	3a678793          	addi	a5,a5,934 # 80013a90 <cons>
    800006f2:	0a07a703          	lw	a4,160(a5)
    800006f6:	00013797          	auipc	a5,0x13
    800006fa:	39a78793          	addi	a5,a5,922 # 80013a90 <cons>
    800006fe:	09c7a783          	lw	a5,156(a5)
    80000702:	12f70f63          	beq	a4,a5,80000840 <consoleintr+0x24e>
      cons.e--;
    80000706:	00013797          	auipc	a5,0x13
    8000070a:	38a78793          	addi	a5,a5,906 # 80013a90 <cons>
    8000070e:	0a07a783          	lw	a5,160(a5)
    80000712:	37fd                	addiw	a5,a5,-1
    80000714:	0007871b          	sext.w	a4,a5
    80000718:	00013797          	auipc	a5,0x13
    8000071c:	37878793          	addi	a5,a5,888 # 80013a90 <cons>
    80000720:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000724:	10000513          	li	a0,256
    80000728:	00000097          	auipc	ra,0x0
    8000072c:	c4a080e7          	jalr	-950(ra) # 80000372 <consputc>
    }
    break;
    80000730:	aa01                	j	80000840 <consoleintr+0x24e>
  default:
    if(c != 0 && cons.e-cons.r < INPUT_BUF_SIZE){
    80000732:	fec42783          	lw	a5,-20(s0)
    80000736:	2781                	sext.w	a5,a5
    80000738:	10078663          	beqz	a5,80000844 <consoleintr+0x252>
    8000073c:	00013797          	auipc	a5,0x13
    80000740:	35478793          	addi	a5,a5,852 # 80013a90 <cons>
    80000744:	0a07a703          	lw	a4,160(a5)
    80000748:	00013797          	auipc	a5,0x13
    8000074c:	34878793          	addi	a5,a5,840 # 80013a90 <cons>
    80000750:	0987a783          	lw	a5,152(a5)
    80000754:	40f707bb          	subw	a5,a4,a5
    80000758:	2781                	sext.w	a5,a5
    8000075a:	873e                	mv	a4,a5
    8000075c:	07f00793          	li	a5,127
    80000760:	0ee7e263          	bltu	a5,a4,80000844 <consoleintr+0x252>
      c = (c == '\r') ? '\n' : c;
    80000764:	fec42783          	lw	a5,-20(s0)
    80000768:	0007871b          	sext.w	a4,a5
    8000076c:	47b5                	li	a5,13
    8000076e:	00f70563          	beq	a4,a5,80000778 <consoleintr+0x186>
    80000772:	fec42783          	lw	a5,-20(s0)
    80000776:	a011                	j	8000077a <consoleintr+0x188>
    80000778:	47a9                	li	a5,10
    8000077a:	fef42623          	sw	a5,-20(s0)

      // echo back to the user.
      consputc(c);
    8000077e:	fec42783          	lw	a5,-20(s0)
    80000782:	853e                	mv	a0,a5
    80000784:	00000097          	auipc	ra,0x0
    80000788:	bee080e7          	jalr	-1042(ra) # 80000372 <consputc>

      // store for consumption by consoleread().
      cons.buf[cons.e++ % INPUT_BUF_SIZE] = c;
    8000078c:	00013797          	auipc	a5,0x13
    80000790:	30478793          	addi	a5,a5,772 # 80013a90 <cons>
    80000794:	0a07a783          	lw	a5,160(a5)
    80000798:	2781                	sext.w	a5,a5
    8000079a:	0017871b          	addiw	a4,a5,1
    8000079e:	0007069b          	sext.w	a3,a4
    800007a2:	00013717          	auipc	a4,0x13
    800007a6:	2ee70713          	addi	a4,a4,750 # 80013a90 <cons>
    800007aa:	0ad72023          	sw	a3,160(a4)
    800007ae:	07f7f793          	andi	a5,a5,127
    800007b2:	2781                	sext.w	a5,a5
    800007b4:	fec42703          	lw	a4,-20(s0)
    800007b8:	0ff77713          	andi	a4,a4,255
    800007bc:	00013697          	auipc	a3,0x13
    800007c0:	2d468693          	addi	a3,a3,724 # 80013a90 <cons>
    800007c4:	1782                	slli	a5,a5,0x20
    800007c6:	9381                	srli	a5,a5,0x20
    800007c8:	97b6                	add	a5,a5,a3
    800007ca:	00e78c23          	sb	a4,24(a5)

      if(c == '\n' || c == C('D') || cons.e-cons.r == INPUT_BUF_SIZE){
    800007ce:	fec42783          	lw	a5,-20(s0)
    800007d2:	0007871b          	sext.w	a4,a5
    800007d6:	47a9                	li	a5,10
    800007d8:	02f70d63          	beq	a4,a5,80000812 <consoleintr+0x220>
    800007dc:	fec42783          	lw	a5,-20(s0)
    800007e0:	0007871b          	sext.w	a4,a5
    800007e4:	4791                	li	a5,4
    800007e6:	02f70663          	beq	a4,a5,80000812 <consoleintr+0x220>
    800007ea:	00013797          	auipc	a5,0x13
    800007ee:	2a678793          	addi	a5,a5,678 # 80013a90 <cons>
    800007f2:	0a07a703          	lw	a4,160(a5)
    800007f6:	00013797          	auipc	a5,0x13
    800007fa:	29a78793          	addi	a5,a5,666 # 80013a90 <cons>
    800007fe:	0987a783          	lw	a5,152(a5)
    80000802:	40f707bb          	subw	a5,a4,a5
    80000806:	2781                	sext.w	a5,a5
    80000808:	873e                	mv	a4,a5
    8000080a:	08000793          	li	a5,128
    8000080e:	02f71b63          	bne	a4,a5,80000844 <consoleintr+0x252>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000812:	00013797          	auipc	a5,0x13
    80000816:	27e78793          	addi	a5,a5,638 # 80013a90 <cons>
    8000081a:	0a07a703          	lw	a4,160(a5)
    8000081e:	00013797          	auipc	a5,0x13
    80000822:	27278793          	addi	a5,a5,626 # 80013a90 <cons>
    80000826:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000082a:	00013517          	auipc	a0,0x13
    8000082e:	2fe50513          	addi	a0,a0,766 # 80013b28 <cons+0x98>
    80000832:	00003097          	auipc	ra,0x3
    80000836:	dc8080e7          	jalr	-568(ra) # 800035fa <wakeup>
      }
    }
    break;
    8000083a:	a029                	j	80000844 <consoleintr+0x252>
    break;
    8000083c:	0001                	nop
    8000083e:	a021                	j	80000846 <consoleintr+0x254>
    break;
    80000840:	0001                	nop
    80000842:	a011                	j	80000846 <consoleintr+0x254>
    break;
    80000844:	0001                	nop
  }
  
  release(&cons.lock);
    80000846:	00013517          	auipc	a0,0x13
    8000084a:	24a50513          	addi	a0,a0,586 # 80013a90 <cons>
    8000084e:	00001097          	auipc	ra,0x1
    80000852:	b40080e7          	jalr	-1216(ra) # 8000138e <release>
}
    80000856:	0001                	nop
    80000858:	60e2                	ld	ra,24(sp)
    8000085a:	6442                	ld	s0,16(sp)
    8000085c:	6105                	addi	sp,sp,32
    8000085e:	8082                	ret

0000000080000860 <consoleinit>:

void
consoleinit(void)
{
    80000860:	1141                	addi	sp,sp,-16
    80000862:	e406                	sd	ra,8(sp)
    80000864:	e022                	sd	s0,0(sp)
    80000866:	0800                	addi	s0,sp,16
  initlock(&cons.lock, "cons");
    80000868:	0000a597          	auipc	a1,0xa
    8000086c:	79858593          	addi	a1,a1,1944 # 8000b000 <etext>
    80000870:	00013517          	auipc	a0,0x13
    80000874:	22050513          	addi	a0,a0,544 # 80013a90 <cons>
    80000878:	00001097          	auipc	ra,0x1
    8000087c:	a82080e7          	jalr	-1406(ra) # 800012fa <initlock>

  uartinit();
    80000880:	00000097          	auipc	ra,0x0
    80000884:	540080e7          	jalr	1344(ra) # 80000dc0 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80000888:	00033797          	auipc	a5,0x33
    8000088c:	3a878793          	addi	a5,a5,936 # 80033c30 <devsw>
    80000890:	00000717          	auipc	a4,0x0
    80000894:	bc270713          	addi	a4,a4,-1086 # 80000452 <consoleread>
    80000898:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089a:	00033797          	auipc	a5,0x33
    8000089e:	39678793          	addi	a5,a5,918 # 80033c30 <devsw>
    800008a2:	00000717          	auipc	a4,0x0
    800008a6:	b2870713          	addi	a4,a4,-1240 # 800003ca <consolewrite>
    800008aa:	ef98                	sd	a4,24(a5)
}
    800008ac:	0001                	nop
    800008ae:	60a2                	ld	ra,8(sp)
    800008b0:	6402                	ld	s0,0(sp)
    800008b2:	0141                	addi	sp,sp,16
    800008b4:	8082                	ret

00000000800008b6 <printint>:

static char digits[] = "0123456789abcdef";

static void
printint(int xx, int base, int sign)
{
    800008b6:	7139                	addi	sp,sp,-64
    800008b8:	fc06                	sd	ra,56(sp)
    800008ba:	f822                	sd	s0,48(sp)
    800008bc:	0080                	addi	s0,sp,64
    800008be:	87aa                	mv	a5,a0
    800008c0:	86ae                	mv	a3,a1
    800008c2:	8732                	mv	a4,a2
    800008c4:	fcf42623          	sw	a5,-52(s0)
    800008c8:	87b6                	mv	a5,a3
    800008ca:	fcf42423          	sw	a5,-56(s0)
    800008ce:	87ba                	mv	a5,a4
    800008d0:	fcf42223          	sw	a5,-60(s0)
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    800008d4:	fc442783          	lw	a5,-60(s0)
    800008d8:	2781                	sext.w	a5,a5
    800008da:	c78d                	beqz	a5,80000904 <printint+0x4e>
    800008dc:	fcc42783          	lw	a5,-52(s0)
    800008e0:	01f7d79b          	srliw	a5,a5,0x1f
    800008e4:	0ff7f793          	andi	a5,a5,255
    800008e8:	fcf42223          	sw	a5,-60(s0)
    800008ec:	fc442783          	lw	a5,-60(s0)
    800008f0:	2781                	sext.w	a5,a5
    800008f2:	cb89                	beqz	a5,80000904 <printint+0x4e>
    x = -xx;
    800008f4:	fcc42783          	lw	a5,-52(s0)
    800008f8:	40f007bb          	negw	a5,a5
    800008fc:	2781                	sext.w	a5,a5
    800008fe:	fef42423          	sw	a5,-24(s0)
    80000902:	a029                	j	8000090c <printint+0x56>
  else
    x = xx;
    80000904:	fcc42783          	lw	a5,-52(s0)
    80000908:	fef42423          	sw	a5,-24(s0)

  i = 0;
    8000090c:	fe042623          	sw	zero,-20(s0)
  do {
    buf[i++] = digits[x % base];
    80000910:	fc842783          	lw	a5,-56(s0)
    80000914:	fe842703          	lw	a4,-24(s0)
    80000918:	02f777bb          	remuw	a5,a4,a5
    8000091c:	0007861b          	sext.w	a2,a5
    80000920:	fec42783          	lw	a5,-20(s0)
    80000924:	0017871b          	addiw	a4,a5,1
    80000928:	fee42623          	sw	a4,-20(s0)
    8000092c:	0000b697          	auipc	a3,0xb
    80000930:	ea468693          	addi	a3,a3,-348 # 8000b7d0 <digits>
    80000934:	02061713          	slli	a4,a2,0x20
    80000938:	9301                	srli	a4,a4,0x20
    8000093a:	9736                	add	a4,a4,a3
    8000093c:	00074703          	lbu	a4,0(a4)
    80000940:	ff040693          	addi	a3,s0,-16
    80000944:	97b6                	add	a5,a5,a3
    80000946:	fee78423          	sb	a4,-24(a5)
  } while((x /= base) != 0);
    8000094a:	fc842783          	lw	a5,-56(s0)
    8000094e:	fe842703          	lw	a4,-24(s0)
    80000952:	02f757bb          	divuw	a5,a4,a5
    80000956:	fef42423          	sw	a5,-24(s0)
    8000095a:	fe842783          	lw	a5,-24(s0)
    8000095e:	2781                	sext.w	a5,a5
    80000960:	fbc5                	bnez	a5,80000910 <printint+0x5a>

  if(sign)
    80000962:	fc442783          	lw	a5,-60(s0)
    80000966:	2781                	sext.w	a5,a5
    80000968:	cf85                	beqz	a5,800009a0 <printint+0xea>
    buf[i++] = '-';
    8000096a:	fec42783          	lw	a5,-20(s0)
    8000096e:	0017871b          	addiw	a4,a5,1
    80000972:	fee42623          	sw	a4,-20(s0)
    80000976:	ff040713          	addi	a4,s0,-16
    8000097a:	97ba                	add	a5,a5,a4
    8000097c:	02d00713          	li	a4,45
    80000980:	fee78423          	sb	a4,-24(a5)

  while(--i >= 0)
    80000984:	a831                	j	800009a0 <printint+0xea>
    consputc(buf[i]);
    80000986:	fec42783          	lw	a5,-20(s0)
    8000098a:	ff040713          	addi	a4,s0,-16
    8000098e:	97ba                	add	a5,a5,a4
    80000990:	fe87c783          	lbu	a5,-24(a5)
    80000994:	2781                	sext.w	a5,a5
    80000996:	853e                	mv	a0,a5
    80000998:	00000097          	auipc	ra,0x0
    8000099c:	9da080e7          	jalr	-1574(ra) # 80000372 <consputc>
  while(--i >= 0)
    800009a0:	fec42783          	lw	a5,-20(s0)
    800009a4:	37fd                	addiw	a5,a5,-1
    800009a6:	fef42623          	sw	a5,-20(s0)
    800009aa:	fec42783          	lw	a5,-20(s0)
    800009ae:	2781                	sext.w	a5,a5
    800009b0:	fc07dbe3          	bgez	a5,80000986 <printint+0xd0>
}
    800009b4:	0001                	nop
    800009b6:	0001                	nop
    800009b8:	70e2                	ld	ra,56(sp)
    800009ba:	7442                	ld	s0,48(sp)
    800009bc:	6121                	addi	sp,sp,64
    800009be:	8082                	ret

00000000800009c0 <printptr>:

static void
printptr(uint64 x)
{
    800009c0:	7179                	addi	sp,sp,-48
    800009c2:	f406                	sd	ra,40(sp)
    800009c4:	f022                	sd	s0,32(sp)
    800009c6:	1800                	addi	s0,sp,48
    800009c8:	fca43c23          	sd	a0,-40(s0)
  int i;
  consputc('0');
    800009cc:	03000513          	li	a0,48
    800009d0:	00000097          	auipc	ra,0x0
    800009d4:	9a2080e7          	jalr	-1630(ra) # 80000372 <consputc>
  consputc('x');
    800009d8:	07800513          	li	a0,120
    800009dc:	00000097          	auipc	ra,0x0
    800009e0:	996080e7          	jalr	-1642(ra) # 80000372 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    800009e4:	fe042623          	sw	zero,-20(s0)
    800009e8:	a81d                	j	80000a1e <printptr+0x5e>
    consputc(digits[x >> (sizeof(uint64) * 8 - 4)]);
    800009ea:	fd843783          	ld	a5,-40(s0)
    800009ee:	93f1                	srli	a5,a5,0x3c
    800009f0:	0000b717          	auipc	a4,0xb
    800009f4:	de070713          	addi	a4,a4,-544 # 8000b7d0 <digits>
    800009f8:	97ba                	add	a5,a5,a4
    800009fa:	0007c783          	lbu	a5,0(a5)
    800009fe:	2781                	sext.w	a5,a5
    80000a00:	853e                	mv	a0,a5
    80000a02:	00000097          	auipc	ra,0x0
    80000a06:	970080e7          	jalr	-1680(ra) # 80000372 <consputc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    80000a0a:	fec42783          	lw	a5,-20(s0)
    80000a0e:	2785                	addiw	a5,a5,1
    80000a10:	fef42623          	sw	a5,-20(s0)
    80000a14:	fd843783          	ld	a5,-40(s0)
    80000a18:	0792                	slli	a5,a5,0x4
    80000a1a:	fcf43c23          	sd	a5,-40(s0)
    80000a1e:	fec42783          	lw	a5,-20(s0)
    80000a22:	873e                	mv	a4,a5
    80000a24:	47bd                	li	a5,15
    80000a26:	fce7f2e3          	bgeu	a5,a4,800009ea <printptr+0x2a>
}
    80000a2a:	0001                	nop
    80000a2c:	0001                	nop
    80000a2e:	70a2                	ld	ra,40(sp)
    80000a30:	7402                	ld	s0,32(sp)
    80000a32:	6145                	addi	sp,sp,48
    80000a34:	8082                	ret

0000000080000a36 <printf>:

// Print to the console. only understands %d, %x, %p, %s.
void
printf(char *fmt, ...)
{
    80000a36:	7119                	addi	sp,sp,-128
    80000a38:	fc06                	sd	ra,56(sp)
    80000a3a:	f822                	sd	s0,48(sp)
    80000a3c:	0080                	addi	s0,sp,64
    80000a3e:	fca43423          	sd	a0,-56(s0)
    80000a42:	e40c                	sd	a1,8(s0)
    80000a44:	e810                	sd	a2,16(s0)
    80000a46:	ec14                	sd	a3,24(s0)
    80000a48:	f018                	sd	a4,32(s0)
    80000a4a:	f41c                	sd	a5,40(s0)
    80000a4c:	03043823          	sd	a6,48(s0)
    80000a50:	03143c23          	sd	a7,56(s0)
  va_list ap;
  int i, c, locking;
  char *s;

  locking = pr.locking;
    80000a54:	00013797          	auipc	a5,0x13
    80000a58:	0e478793          	addi	a5,a5,228 # 80013b38 <pr>
    80000a5c:	4f9c                	lw	a5,24(a5)
    80000a5e:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a62:	fdc42783          	lw	a5,-36(s0)
    80000a66:	2781                	sext.w	a5,a5
    80000a68:	cb89                	beqz	a5,80000a7a <printf+0x44>
    acquire(&pr.lock);
    80000a6a:	00013517          	auipc	a0,0x13
    80000a6e:	0ce50513          	addi	a0,a0,206 # 80013b38 <pr>
    80000a72:	00001097          	auipc	ra,0x1
    80000a76:	8b8080e7          	jalr	-1864(ra) # 8000132a <acquire>

  if (fmt == 0)
    80000a7a:	fc843783          	ld	a5,-56(s0)
    80000a7e:	eb89                	bnez	a5,80000a90 <printf+0x5a>
    panic("null fmt");
    80000a80:	0000a517          	auipc	a0,0xa
    80000a84:	58850513          	addi	a0,a0,1416 # 8000b008 <etext+0x8>
    80000a88:	00000097          	auipc	ra,0x0
    80000a8c:	204080e7          	jalr	516(ra) # 80000c8c <panic>

  va_start(ap, fmt);
    80000a90:	04040793          	addi	a5,s0,64
    80000a94:	fcf43023          	sd	a5,-64(s0)
    80000a98:	fc043783          	ld	a5,-64(s0)
    80000a9c:	fc878793          	addi	a5,a5,-56
    80000aa0:	fcf43823          	sd	a5,-48(s0)
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000aa4:	fe042623          	sw	zero,-20(s0)
    80000aa8:	a24d                	j	80000c4a <printf+0x214>
    if(c != '%'){
    80000aaa:	fd842783          	lw	a5,-40(s0)
    80000aae:	0007871b          	sext.w	a4,a5
    80000ab2:	02500793          	li	a5,37
    80000ab6:	00f70a63          	beq	a4,a5,80000aca <printf+0x94>
      consputc(c);
    80000aba:	fd842783          	lw	a5,-40(s0)
    80000abe:	853e                	mv	a0,a5
    80000ac0:	00000097          	auipc	ra,0x0
    80000ac4:	8b2080e7          	jalr	-1870(ra) # 80000372 <consputc>
      continue;
    80000ac8:	aaa5                	j	80000c40 <printf+0x20a>
    }
    c = fmt[++i] & 0xff;
    80000aca:	fec42783          	lw	a5,-20(s0)
    80000ace:	2785                	addiw	a5,a5,1
    80000ad0:	fef42623          	sw	a5,-20(s0)
    80000ad4:	fec42783          	lw	a5,-20(s0)
    80000ad8:	fc843703          	ld	a4,-56(s0)
    80000adc:	97ba                	add	a5,a5,a4
    80000ade:	0007c783          	lbu	a5,0(a5)
    80000ae2:	fcf42c23          	sw	a5,-40(s0)
    if(c == 0)
    80000ae6:	fd842783          	lw	a5,-40(s0)
    80000aea:	2781                	sext.w	a5,a5
    80000aec:	16078e63          	beqz	a5,80000c68 <printf+0x232>
      break;
    switch(c){
    80000af0:	fd842783          	lw	a5,-40(s0)
    80000af4:	0007871b          	sext.w	a4,a5
    80000af8:	07800793          	li	a5,120
    80000afc:	08f70963          	beq	a4,a5,80000b8e <printf+0x158>
    80000b00:	fd842783          	lw	a5,-40(s0)
    80000b04:	0007871b          	sext.w	a4,a5
    80000b08:	07800793          	li	a5,120
    80000b0c:	10e7cc63          	blt	a5,a4,80000c24 <printf+0x1ee>
    80000b10:	fd842783          	lw	a5,-40(s0)
    80000b14:	0007871b          	sext.w	a4,a5
    80000b18:	07300793          	li	a5,115
    80000b1c:	0af70563          	beq	a4,a5,80000bc6 <printf+0x190>
    80000b20:	fd842783          	lw	a5,-40(s0)
    80000b24:	0007871b          	sext.w	a4,a5
    80000b28:	07300793          	li	a5,115
    80000b2c:	0ee7cc63          	blt	a5,a4,80000c24 <printf+0x1ee>
    80000b30:	fd842783          	lw	a5,-40(s0)
    80000b34:	0007871b          	sext.w	a4,a5
    80000b38:	07000793          	li	a5,112
    80000b3c:	06f70863          	beq	a4,a5,80000bac <printf+0x176>
    80000b40:	fd842783          	lw	a5,-40(s0)
    80000b44:	0007871b          	sext.w	a4,a5
    80000b48:	07000793          	li	a5,112
    80000b4c:	0ce7cc63          	blt	a5,a4,80000c24 <printf+0x1ee>
    80000b50:	fd842783          	lw	a5,-40(s0)
    80000b54:	0007871b          	sext.w	a4,a5
    80000b58:	02500793          	li	a5,37
    80000b5c:	0af70d63          	beq	a4,a5,80000c16 <printf+0x1e0>
    80000b60:	fd842783          	lw	a5,-40(s0)
    80000b64:	0007871b          	sext.w	a4,a5
    80000b68:	06400793          	li	a5,100
    80000b6c:	0af71c63          	bne	a4,a5,80000c24 <printf+0x1ee>
    case 'd':
      printint(va_arg(ap, int), 10, 1);
    80000b70:	fd043783          	ld	a5,-48(s0)
    80000b74:	00878713          	addi	a4,a5,8
    80000b78:	fce43823          	sd	a4,-48(s0)
    80000b7c:	439c                	lw	a5,0(a5)
    80000b7e:	4605                	li	a2,1
    80000b80:	45a9                	li	a1,10
    80000b82:	853e                	mv	a0,a5
    80000b84:	00000097          	auipc	ra,0x0
    80000b88:	d32080e7          	jalr	-718(ra) # 800008b6 <printint>
      break;
    80000b8c:	a855                	j	80000c40 <printf+0x20a>
    case 'x':
      printint(va_arg(ap, int), 16, 1);
    80000b8e:	fd043783          	ld	a5,-48(s0)
    80000b92:	00878713          	addi	a4,a5,8
    80000b96:	fce43823          	sd	a4,-48(s0)
    80000b9a:	439c                	lw	a5,0(a5)
    80000b9c:	4605                	li	a2,1
    80000b9e:	45c1                	li	a1,16
    80000ba0:	853e                	mv	a0,a5
    80000ba2:	00000097          	auipc	ra,0x0
    80000ba6:	d14080e7          	jalr	-748(ra) # 800008b6 <printint>
      break;
    80000baa:	a859                	j	80000c40 <printf+0x20a>
    case 'p':
      printptr(va_arg(ap, uint64));
    80000bac:	fd043783          	ld	a5,-48(s0)
    80000bb0:	00878713          	addi	a4,a5,8
    80000bb4:	fce43823          	sd	a4,-48(s0)
    80000bb8:	639c                	ld	a5,0(a5)
    80000bba:	853e                	mv	a0,a5
    80000bbc:	00000097          	auipc	ra,0x0
    80000bc0:	e04080e7          	jalr	-508(ra) # 800009c0 <printptr>
      break;
    80000bc4:	a8b5                	j	80000c40 <printf+0x20a>
    case 's':
      if((s = va_arg(ap, char*)) == 0)
    80000bc6:	fd043783          	ld	a5,-48(s0)
    80000bca:	00878713          	addi	a4,a5,8
    80000bce:	fce43823          	sd	a4,-48(s0)
    80000bd2:	639c                	ld	a5,0(a5)
    80000bd4:	fef43023          	sd	a5,-32(s0)
    80000bd8:	fe043783          	ld	a5,-32(s0)
    80000bdc:	e79d                	bnez	a5,80000c0a <printf+0x1d4>
        s = "(null)";
    80000bde:	0000a797          	auipc	a5,0xa
    80000be2:	43a78793          	addi	a5,a5,1082 # 8000b018 <etext+0x18>
    80000be6:	fef43023          	sd	a5,-32(s0)
      for(; *s; s++)
    80000bea:	a005                	j	80000c0a <printf+0x1d4>
        consputc(*s);
    80000bec:	fe043783          	ld	a5,-32(s0)
    80000bf0:	0007c783          	lbu	a5,0(a5)
    80000bf4:	2781                	sext.w	a5,a5
    80000bf6:	853e                	mv	a0,a5
    80000bf8:	fffff097          	auipc	ra,0xfffff
    80000bfc:	77a080e7          	jalr	1914(ra) # 80000372 <consputc>
      for(; *s; s++)
    80000c00:	fe043783          	ld	a5,-32(s0)
    80000c04:	0785                	addi	a5,a5,1
    80000c06:	fef43023          	sd	a5,-32(s0)
    80000c0a:	fe043783          	ld	a5,-32(s0)
    80000c0e:	0007c783          	lbu	a5,0(a5)
    80000c12:	ffe9                	bnez	a5,80000bec <printf+0x1b6>
      break;
    80000c14:	a035                	j	80000c40 <printf+0x20a>
    case '%':
      consputc('%');
    80000c16:	02500513          	li	a0,37
    80000c1a:	fffff097          	auipc	ra,0xfffff
    80000c1e:	758080e7          	jalr	1880(ra) # 80000372 <consputc>
      break;
    80000c22:	a839                	j	80000c40 <printf+0x20a>
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
    80000c24:	02500513          	li	a0,37
    80000c28:	fffff097          	auipc	ra,0xfffff
    80000c2c:	74a080e7          	jalr	1866(ra) # 80000372 <consputc>
      consputc(c);
    80000c30:	fd842783          	lw	a5,-40(s0)
    80000c34:	853e                	mv	a0,a5
    80000c36:	fffff097          	auipc	ra,0xfffff
    80000c3a:	73c080e7          	jalr	1852(ra) # 80000372 <consputc>
      break;
    80000c3e:	0001                	nop
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    80000c40:	fec42783          	lw	a5,-20(s0)
    80000c44:	2785                	addiw	a5,a5,1
    80000c46:	fef42623          	sw	a5,-20(s0)
    80000c4a:	fec42783          	lw	a5,-20(s0)
    80000c4e:	fc843703          	ld	a4,-56(s0)
    80000c52:	97ba                	add	a5,a5,a4
    80000c54:	0007c783          	lbu	a5,0(a5)
    80000c58:	fcf42c23          	sw	a5,-40(s0)
    80000c5c:	fd842783          	lw	a5,-40(s0)
    80000c60:	2781                	sext.w	a5,a5
    80000c62:	e40794e3          	bnez	a5,80000aaa <printf+0x74>
    80000c66:	a011                	j	80000c6a <printf+0x234>
      break;
    80000c68:	0001                	nop
    }
  }
  va_end(ap);

  if(locking)
    80000c6a:	fdc42783          	lw	a5,-36(s0)
    80000c6e:	2781                	sext.w	a5,a5
    80000c70:	cb89                	beqz	a5,80000c82 <printf+0x24c>
    release(&pr.lock);
    80000c72:	00013517          	auipc	a0,0x13
    80000c76:	ec650513          	addi	a0,a0,-314 # 80013b38 <pr>
    80000c7a:	00000097          	auipc	ra,0x0
    80000c7e:	714080e7          	jalr	1812(ra) # 8000138e <release>
}
    80000c82:	0001                	nop
    80000c84:	70e2                	ld	ra,56(sp)
    80000c86:	7442                	ld	s0,48(sp)
    80000c88:	6109                	addi	sp,sp,128
    80000c8a:	8082                	ret

0000000080000c8c <panic>:

void
panic(char *s)
{
    80000c8c:	1101                	addi	sp,sp,-32
    80000c8e:	ec06                	sd	ra,24(sp)
    80000c90:	e822                	sd	s0,16(sp)
    80000c92:	1000                	addi	s0,sp,32
    80000c94:	fea43423          	sd	a0,-24(s0)
  pr.locking = 0;
    80000c98:	00013797          	auipc	a5,0x13
    80000c9c:	ea078793          	addi	a5,a5,-352 # 80013b38 <pr>
    80000ca0:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000ca4:	0000a517          	auipc	a0,0xa
    80000ca8:	37c50513          	addi	a0,a0,892 # 8000b020 <etext+0x20>
    80000cac:	00000097          	auipc	ra,0x0
    80000cb0:	d8a080e7          	jalr	-630(ra) # 80000a36 <printf>
  printf(s);
    80000cb4:	fe843503          	ld	a0,-24(s0)
    80000cb8:	00000097          	auipc	ra,0x0
    80000cbc:	d7e080e7          	jalr	-642(ra) # 80000a36 <printf>
  printf("\n");
    80000cc0:	0000a517          	auipc	a0,0xa
    80000cc4:	36850513          	addi	a0,a0,872 # 8000b028 <etext+0x28>
    80000cc8:	00000097          	auipc	ra,0x0
    80000ccc:	d6e080e7          	jalr	-658(ra) # 80000a36 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cd0:	0000b797          	auipc	a5,0xb
    80000cd4:	c5078793          	addi	a5,a5,-944 # 8000b920 <panicked>
    80000cd8:	4705                	li	a4,1
    80000cda:	c398                	sw	a4,0(a5)
  for(;;)
    80000cdc:	a001                	j	80000cdc <panic+0x50>

0000000080000cde <panic_concat>:
    ;
}

void
panic_concat(int count, ...)
{
    80000cde:	7119                	addi	sp,sp,-128
    80000ce0:	fc06                	sd	ra,56(sp)
    80000ce2:	f822                	sd	s0,48(sp)
    80000ce4:	0080                	addi	s0,sp,64
    80000ce6:	e40c                	sd	a1,8(s0)
    80000ce8:	e810                	sd	a2,16(s0)
    80000cea:	ec14                	sd	a3,24(s0)
    80000cec:	f018                	sd	a4,32(s0)
    80000cee:	f41c                	sd	a5,40(s0)
    80000cf0:	03043823          	sd	a6,48(s0)
    80000cf4:	03143c23          	sd	a7,56(s0)
    80000cf8:	87aa                	mv	a5,a0
    80000cfa:	fcf42623          	sw	a5,-52(s0)
  pr.locking = 0;
    80000cfe:	00013797          	auipc	a5,0x13
    80000d02:	e3a78793          	addi	a5,a5,-454 # 80013b38 <pr>
    80000d06:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000d0a:	0000a517          	auipc	a0,0xa
    80000d0e:	31650513          	addi	a0,a0,790 # 8000b020 <etext+0x20>
    80000d12:	00000097          	auipc	ra,0x0
    80000d16:	d24080e7          	jalr	-732(ra) # 80000a36 <printf>
  va_list ap;
  va_start(ap, count);
    80000d1a:	04040793          	addi	a5,s0,64
    80000d1e:	fcf43023          	sd	a5,-64(s0)
    80000d22:	fc043783          	ld	a5,-64(s0)
    80000d26:	fc878793          	addi	a5,a5,-56
    80000d2a:	fcf43c23          	sd	a5,-40(s0)
  for(int i = 0; i < count; i++){
    80000d2e:	fe042623          	sw	zero,-20(s0)
    80000d32:	a02d                	j	80000d5c <panic_concat+0x7e>
    char *s = va_arg(ap, char*);
    80000d34:	fd843783          	ld	a5,-40(s0)
    80000d38:	00878713          	addi	a4,a5,8
    80000d3c:	fce43c23          	sd	a4,-40(s0)
    80000d40:	639c                	ld	a5,0(a5)
    80000d42:	fef43023          	sd	a5,-32(s0)
    printf(s);
    80000d46:	fe043503          	ld	a0,-32(s0)
    80000d4a:	00000097          	auipc	ra,0x0
    80000d4e:	cec080e7          	jalr	-788(ra) # 80000a36 <printf>
  for(int i = 0; i < count; i++){
    80000d52:	fec42783          	lw	a5,-20(s0)
    80000d56:	2785                	addiw	a5,a5,1
    80000d58:	fef42623          	sw	a5,-20(s0)
    80000d5c:	fec42703          	lw	a4,-20(s0)
    80000d60:	fcc42783          	lw	a5,-52(s0)
    80000d64:	2701                	sext.w	a4,a4
    80000d66:	2781                	sext.w	a5,a5
    80000d68:	fcf746e3          	blt	a4,a5,80000d34 <panic_concat+0x56>
  }
  va_end(ap);
  printf("\n");
    80000d6c:	0000a517          	auipc	a0,0xa
    80000d70:	2bc50513          	addi	a0,a0,700 # 8000b028 <etext+0x28>
    80000d74:	00000097          	auipc	ra,0x0
    80000d78:	cc2080e7          	jalr	-830(ra) # 80000a36 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000d7c:	0000b797          	auipc	a5,0xb
    80000d80:	ba478793          	addi	a5,a5,-1116 # 8000b920 <panicked>
    80000d84:	4705                	li	a4,1
    80000d86:	c398                	sw	a4,0(a5)
  for(;;)
    80000d88:	a001                	j	80000d88 <panic_concat+0xaa>

0000000080000d8a <printfinit>:
    ;
}

void
printfinit(void)
{
    80000d8a:	1141                	addi	sp,sp,-16
    80000d8c:	e406                	sd	ra,8(sp)
    80000d8e:	e022                	sd	s0,0(sp)
    80000d90:	0800                	addi	s0,sp,16
  initlock(&pr.lock, "pr");
    80000d92:	0000a597          	auipc	a1,0xa
    80000d96:	29e58593          	addi	a1,a1,670 # 8000b030 <etext+0x30>
    80000d9a:	00013517          	auipc	a0,0x13
    80000d9e:	d9e50513          	addi	a0,a0,-610 # 80013b38 <pr>
    80000da2:	00000097          	auipc	ra,0x0
    80000da6:	558080e7          	jalr	1368(ra) # 800012fa <initlock>
  pr.locking = 1;
    80000daa:	00013797          	auipc	a5,0x13
    80000dae:	d8e78793          	addi	a5,a5,-626 # 80013b38 <pr>
    80000db2:	4705                	li	a4,1
    80000db4:	cf98                	sw	a4,24(a5)
}
    80000db6:	0001                	nop
    80000db8:	60a2                	ld	ra,8(sp)
    80000dba:	6402                	ld	s0,0(sp)
    80000dbc:	0141                	addi	sp,sp,16
    80000dbe:	8082                	ret

0000000080000dc0 <uartinit>:

void uartstart();

void
uartinit(void)
{
    80000dc0:	1141                	addi	sp,sp,-16
    80000dc2:	e406                	sd	ra,8(sp)
    80000dc4:	e022                	sd	s0,0(sp)
    80000dc6:	0800                	addi	s0,sp,16
  // disable interrupts.
  WriteReg(IER, 0x00);
    80000dc8:	100007b7          	lui	a5,0x10000
    80000dcc:	0785                	addi	a5,a5,1
    80000dce:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // special mode to set baud rate.
  WriteReg(LCR, LCR_BAUD_LATCH);
    80000dd2:	100007b7          	lui	a5,0x10000
    80000dd6:	078d                	addi	a5,a5,3
    80000dd8:	f8000713          	li	a4,-128
    80000ddc:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // LSB for baud rate of 38.4K.
  WriteReg(0, 0x03);
    80000de0:	100007b7          	lui	a5,0x10000
    80000de4:	470d                	li	a4,3
    80000de6:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // MSB for baud rate of 38.4K.
  WriteReg(1, 0x00);
    80000dea:	100007b7          	lui	a5,0x10000
    80000dee:	0785                	addi	a5,a5,1
    80000df0:	00078023          	sb	zero,0(a5) # 10000000 <_entry-0x70000000>

  // leave set-baud mode,
  // and set word length to 8 bits, no parity.
  WriteReg(LCR, LCR_EIGHT_BITS);
    80000df4:	100007b7          	lui	a5,0x10000
    80000df8:	078d                	addi	a5,a5,3
    80000dfa:	470d                	li	a4,3
    80000dfc:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // reset and enable FIFOs.
  WriteReg(FCR, FCR_FIFO_ENABLE | FCR_FIFO_CLEAR);
    80000e00:	100007b7          	lui	a5,0x10000
    80000e04:	0789                	addi	a5,a5,2
    80000e06:	471d                	li	a4,7
    80000e08:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  // enable transmit and receive interrupts.
  WriteReg(IER, IER_TX_ENABLE | IER_RX_ENABLE);
    80000e0c:	100007b7          	lui	a5,0x10000
    80000e10:	0785                	addi	a5,a5,1
    80000e12:	470d                	li	a4,3
    80000e14:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  initlock(&uart_tx_lock, "uart");
    80000e18:	0000a597          	auipc	a1,0xa
    80000e1c:	22058593          	addi	a1,a1,544 # 8000b038 <etext+0x38>
    80000e20:	00013517          	auipc	a0,0x13
    80000e24:	d3850513          	addi	a0,a0,-712 # 80013b58 <uart_tx_lock>
    80000e28:	00000097          	auipc	ra,0x0
    80000e2c:	4d2080e7          	jalr	1234(ra) # 800012fa <initlock>
}
    80000e30:	0001                	nop
    80000e32:	60a2                	ld	ra,8(sp)
    80000e34:	6402                	ld	s0,0(sp)
    80000e36:	0141                	addi	sp,sp,16
    80000e38:	8082                	ret

0000000080000e3a <uartputc>:
// because it may block, it can't be called
// from interrupts; it's only suitable for use
// by write().
void
uartputc(int c)
{
    80000e3a:	1101                	addi	sp,sp,-32
    80000e3c:	ec06                	sd	ra,24(sp)
    80000e3e:	e822                	sd	s0,16(sp)
    80000e40:	1000                	addi	s0,sp,32
    80000e42:	87aa                	mv	a5,a0
    80000e44:	fef42623          	sw	a5,-20(s0)
  acquire(&uart_tx_lock);
    80000e48:	00013517          	auipc	a0,0x13
    80000e4c:	d1050513          	addi	a0,a0,-752 # 80013b58 <uart_tx_lock>
    80000e50:	00000097          	auipc	ra,0x0
    80000e54:	4da080e7          	jalr	1242(ra) # 8000132a <acquire>

  if(panicked){
    80000e58:	0000b797          	auipc	a5,0xb
    80000e5c:	ac878793          	addi	a5,a5,-1336 # 8000b920 <panicked>
    80000e60:	439c                	lw	a5,0(a5)
    80000e62:	2781                	sext.w	a5,a5
    80000e64:	cf91                	beqz	a5,80000e80 <uartputc+0x46>
    for(;;)
    80000e66:	a001                	j	80000e66 <uartputc+0x2c>
      ;
  }
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    // buffer is full.
    // wait for uartstart() to open up space in the buffer.
    sleep(&uart_tx_r, &uart_tx_lock);
    80000e68:	00013597          	auipc	a1,0x13
    80000e6c:	cf058593          	addi	a1,a1,-784 # 80013b58 <uart_tx_lock>
    80000e70:	0000b517          	auipc	a0,0xb
    80000e74:	ac050513          	addi	a0,a0,-1344 # 8000b930 <uart_tx_r>
    80000e78:	00002097          	auipc	ra,0x2
    80000e7c:	706080e7          	jalr	1798(ra) # 8000357e <sleep>
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000e80:	0000b797          	auipc	a5,0xb
    80000e84:	ab078793          	addi	a5,a5,-1360 # 8000b930 <uart_tx_r>
    80000e88:	639c                	ld	a5,0(a5)
    80000e8a:	02078713          	addi	a4,a5,32
    80000e8e:	0000b797          	auipc	a5,0xb
    80000e92:	a9a78793          	addi	a5,a5,-1382 # 8000b928 <uart_tx_w>
    80000e96:	639c                	ld	a5,0(a5)
    80000e98:	fcf708e3          	beq	a4,a5,80000e68 <uartputc+0x2e>
  }
  uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000e9c:	0000b797          	auipc	a5,0xb
    80000ea0:	a8c78793          	addi	a5,a5,-1396 # 8000b928 <uart_tx_w>
    80000ea4:	639c                	ld	a5,0(a5)
    80000ea6:	8bfd                	andi	a5,a5,31
    80000ea8:	fec42703          	lw	a4,-20(s0)
    80000eac:	0ff77713          	andi	a4,a4,255
    80000eb0:	00013697          	auipc	a3,0x13
    80000eb4:	cc068693          	addi	a3,a3,-832 # 80013b70 <uart_tx_buf>
    80000eb8:	97b6                	add	a5,a5,a3
    80000eba:	00e78023          	sb	a4,0(a5)
  uart_tx_w += 1;
    80000ebe:	0000b797          	auipc	a5,0xb
    80000ec2:	a6a78793          	addi	a5,a5,-1430 # 8000b928 <uart_tx_w>
    80000ec6:	639c                	ld	a5,0(a5)
    80000ec8:	00178713          	addi	a4,a5,1
    80000ecc:	0000b797          	auipc	a5,0xb
    80000ed0:	a5c78793          	addi	a5,a5,-1444 # 8000b928 <uart_tx_w>
    80000ed4:	e398                	sd	a4,0(a5)
  uartstart();
    80000ed6:	00000097          	auipc	ra,0x0
    80000eda:	084080e7          	jalr	132(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    80000ede:	00013517          	auipc	a0,0x13
    80000ee2:	c7a50513          	addi	a0,a0,-902 # 80013b58 <uart_tx_lock>
    80000ee6:	00000097          	auipc	ra,0x0
    80000eea:	4a8080e7          	jalr	1192(ra) # 8000138e <release>
}
    80000eee:	0001                	nop
    80000ef0:	60e2                	ld	ra,24(sp)
    80000ef2:	6442                	ld	s0,16(sp)
    80000ef4:	6105                	addi	sp,sp,32
    80000ef6:	8082                	ret

0000000080000ef8 <uartputc_sync>:
// use interrupts, for use by kernel printf() and
// to echo characters. it spins waiting for the uart's
// output register to be empty.
void
uartputc_sync(int c)
{
    80000ef8:	1101                	addi	sp,sp,-32
    80000efa:	ec06                	sd	ra,24(sp)
    80000efc:	e822                	sd	s0,16(sp)
    80000efe:	1000                	addi	s0,sp,32
    80000f00:	87aa                	mv	a5,a0
    80000f02:	fef42623          	sw	a5,-20(s0)
  push_off();
    80000f06:	00000097          	auipc	ra,0x0
    80000f0a:	522080e7          	jalr	1314(ra) # 80001428 <push_off>

  if(panicked){
    80000f0e:	0000b797          	auipc	a5,0xb
    80000f12:	a1278793          	addi	a5,a5,-1518 # 8000b920 <panicked>
    80000f16:	439c                	lw	a5,0(a5)
    80000f18:	2781                	sext.w	a5,a5
    80000f1a:	c391                	beqz	a5,80000f1e <uartputc_sync+0x26>
    for(;;)
    80000f1c:	a001                	j	80000f1c <uartputc_sync+0x24>
      ;
  }

  // wait for Transmit Holding Empty to be set in LSR.
  while((ReadReg(LSR) & LSR_TX_IDLE) == 0)
    80000f1e:	0001                	nop
    80000f20:	100007b7          	lui	a5,0x10000
    80000f24:	0795                	addi	a5,a5,5
    80000f26:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f2a:	0ff7f793          	andi	a5,a5,255
    80000f2e:	2781                	sext.w	a5,a5
    80000f30:	0207f793          	andi	a5,a5,32
    80000f34:	2781                	sext.w	a5,a5
    80000f36:	d7ed                	beqz	a5,80000f20 <uartputc_sync+0x28>
    ;
  WriteReg(THR, c);
    80000f38:	100007b7          	lui	a5,0x10000
    80000f3c:	fec42703          	lw	a4,-20(s0)
    80000f40:	0ff77713          	andi	a4,a4,255
    80000f44:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>

  pop_off();
    80000f48:	00000097          	auipc	ra,0x0
    80000f4c:	538080e7          	jalr	1336(ra) # 80001480 <pop_off>
}
    80000f50:	0001                	nop
    80000f52:	60e2                	ld	ra,24(sp)
    80000f54:	6442                	ld	s0,16(sp)
    80000f56:	6105                	addi	sp,sp,32
    80000f58:	8082                	ret

0000000080000f5a <uartstart>:
// in the transmit buffer, send it.
// caller must hold uart_tx_lock.
// called from both the top- and bottom-half.
void
uartstart()
{
    80000f5a:	1101                	addi	sp,sp,-32
    80000f5c:	ec06                	sd	ra,24(sp)
    80000f5e:	e822                	sd	s0,16(sp)
    80000f60:	1000                	addi	s0,sp,32
  while(1){
    if(uart_tx_w == uart_tx_r){
    80000f62:	0000b797          	auipc	a5,0xb
    80000f66:	9c678793          	addi	a5,a5,-1594 # 8000b928 <uart_tx_w>
    80000f6a:	6398                	ld	a4,0(a5)
    80000f6c:	0000b797          	auipc	a5,0xb
    80000f70:	9c478793          	addi	a5,a5,-1596 # 8000b930 <uart_tx_r>
    80000f74:	639c                	ld	a5,0(a5)
    80000f76:	06f70a63          	beq	a4,a5,80000fea <uartstart+0x90>
      // transmit buffer is empty.
      return;
    }
    
    if((ReadReg(LSR) & LSR_TX_IDLE) == 0){
    80000f7a:	100007b7          	lui	a5,0x10000
    80000f7e:	0795                	addi	a5,a5,5
    80000f80:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80000f84:	0ff7f793          	andi	a5,a5,255
    80000f88:	2781                	sext.w	a5,a5
    80000f8a:	0207f793          	andi	a5,a5,32
    80000f8e:	2781                	sext.w	a5,a5
    80000f90:	cfb9                	beqz	a5,80000fee <uartstart+0x94>
      // so we cannot give it another byte.
      // it will interrupt when it's ready for a new byte.
      return;
    }
    
    int c = uart_tx_buf[uart_tx_r % UART_TX_BUF_SIZE];
    80000f92:	0000b797          	auipc	a5,0xb
    80000f96:	99e78793          	addi	a5,a5,-1634 # 8000b930 <uart_tx_r>
    80000f9a:	639c                	ld	a5,0(a5)
    80000f9c:	8bfd                	andi	a5,a5,31
    80000f9e:	00013717          	auipc	a4,0x13
    80000fa2:	bd270713          	addi	a4,a4,-1070 # 80013b70 <uart_tx_buf>
    80000fa6:	97ba                	add	a5,a5,a4
    80000fa8:	0007c783          	lbu	a5,0(a5)
    80000fac:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000fb0:	0000b797          	auipc	a5,0xb
    80000fb4:	98078793          	addi	a5,a5,-1664 # 8000b930 <uart_tx_r>
    80000fb8:	639c                	ld	a5,0(a5)
    80000fba:	00178713          	addi	a4,a5,1
    80000fbe:	0000b797          	auipc	a5,0xb
    80000fc2:	97278793          	addi	a5,a5,-1678 # 8000b930 <uart_tx_r>
    80000fc6:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000fc8:	0000b517          	auipc	a0,0xb
    80000fcc:	96850513          	addi	a0,a0,-1688 # 8000b930 <uart_tx_r>
    80000fd0:	00002097          	auipc	ra,0x2
    80000fd4:	62a080e7          	jalr	1578(ra) # 800035fa <wakeup>
    
    WriteReg(THR, c);
    80000fd8:	100007b7          	lui	a5,0x10000
    80000fdc:	fec42703          	lw	a4,-20(s0)
    80000fe0:	0ff77713          	andi	a4,a4,255
    80000fe4:	00e78023          	sb	a4,0(a5) # 10000000 <_entry-0x70000000>
  while(1){
    80000fe8:	bfad                	j	80000f62 <uartstart+0x8>
      return;
    80000fea:	0001                	nop
    80000fec:	a011                	j	80000ff0 <uartstart+0x96>
      return;
    80000fee:	0001                	nop
  }
}
    80000ff0:	60e2                	ld	ra,24(sp)
    80000ff2:	6442                	ld	s0,16(sp)
    80000ff4:	6105                	addi	sp,sp,32
    80000ff6:	8082                	ret

0000000080000ff8 <uartgetc>:

// read one input character from the UART.
// return -1 if none is waiting.
int
uartgetc(void)
{
    80000ff8:	1141                	addi	sp,sp,-16
    80000ffa:	e422                	sd	s0,8(sp)
    80000ffc:	0800                	addi	s0,sp,16
  if(ReadReg(LSR) & 0x01){
    80000ffe:	100007b7          	lui	a5,0x10000
    80001002:	0795                	addi	a5,a5,5
    80001004:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    80001008:	0ff7f793          	andi	a5,a5,255
    8000100c:	2781                	sext.w	a5,a5
    8000100e:	8b85                	andi	a5,a5,1
    80001010:	2781                	sext.w	a5,a5
    80001012:	cb89                	beqz	a5,80001024 <uartgetc+0x2c>
    // input data is ready.
    return ReadReg(RHR);
    80001014:	100007b7          	lui	a5,0x10000
    80001018:	0007c783          	lbu	a5,0(a5) # 10000000 <_entry-0x70000000>
    8000101c:	0ff7f793          	andi	a5,a5,255
    80001020:	2781                	sext.w	a5,a5
    80001022:	a011                	j	80001026 <uartgetc+0x2e>
  } else {
    return -1;
    80001024:	57fd                	li	a5,-1
  }
}
    80001026:	853e                	mv	a0,a5
    80001028:	6422                	ld	s0,8(sp)
    8000102a:	0141                	addi	sp,sp,16
    8000102c:	8082                	ret

000000008000102e <uartintr>:
// handle a uart interrupt, raised because input has
// arrived, or the uart is ready for more output, or
// both. called from devintr().
void
uartintr(void)
{
    8000102e:	1101                	addi	sp,sp,-32
    80001030:	ec06                	sd	ra,24(sp)
    80001032:	e822                	sd	s0,16(sp)
    80001034:	1000                	addi	s0,sp,32
  // read and process incoming characters.
  while(1){
    int c = uartgetc();
    80001036:	00000097          	auipc	ra,0x0
    8000103a:	fc2080e7          	jalr	-62(ra) # 80000ff8 <uartgetc>
    8000103e:	87aa                	mv	a5,a0
    80001040:	fef42623          	sw	a5,-20(s0)
    if(c == -1)
    80001044:	fec42783          	lw	a5,-20(s0)
    80001048:	0007871b          	sext.w	a4,a5
    8000104c:	57fd                	li	a5,-1
    8000104e:	00f70a63          	beq	a4,a5,80001062 <uartintr+0x34>
      break;
    consoleintr(c);
    80001052:	fec42783          	lw	a5,-20(s0)
    80001056:	853e                	mv	a0,a5
    80001058:	fffff097          	auipc	ra,0xfffff
    8000105c:	59a080e7          	jalr	1434(ra) # 800005f2 <consoleintr>
  while(1){
    80001060:	bfd9                	j	80001036 <uartintr+0x8>
      break;
    80001062:	0001                	nop
  }

  // send buffered characters.
  acquire(&uart_tx_lock);
    80001064:	00013517          	auipc	a0,0x13
    80001068:	af450513          	addi	a0,a0,-1292 # 80013b58 <uart_tx_lock>
    8000106c:	00000097          	auipc	ra,0x0
    80001070:	2be080e7          	jalr	702(ra) # 8000132a <acquire>
  uartstart();
    80001074:	00000097          	auipc	ra,0x0
    80001078:	ee6080e7          	jalr	-282(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    8000107c:	00013517          	auipc	a0,0x13
    80001080:	adc50513          	addi	a0,a0,-1316 # 80013b58 <uart_tx_lock>
    80001084:	00000097          	auipc	ra,0x0
    80001088:	30a080e7          	jalr	778(ra) # 8000138e <release>
}
    8000108c:	0001                	nop
    8000108e:	60e2                	ld	ra,24(sp)
    80001090:	6442                	ld	s0,16(sp)
    80001092:	6105                	addi	sp,sp,32
    80001094:	8082                	ret

0000000080001096 <kinit>:
  struct run *freelist;
} kmem;

void
kinit()
{
    80001096:	1141                	addi	sp,sp,-16
    80001098:	e406                	sd	ra,8(sp)
    8000109a:	e022                	sd	s0,0(sp)
    8000109c:	0800                	addi	s0,sp,16
  initlock(&kmem.lock, "kmem");
    8000109e:	0000a597          	auipc	a1,0xa
    800010a2:	fa258593          	addi	a1,a1,-94 # 8000b040 <etext+0x40>
    800010a6:	00013517          	auipc	a0,0x13
    800010aa:	aea50513          	addi	a0,a0,-1302 # 80013b90 <kmem>
    800010ae:	00000097          	auipc	ra,0x0
    800010b2:	24c080e7          	jalr	588(ra) # 800012fa <initlock>
  freerange(end, (void*)PHYSTOP);
    800010b6:	08100793          	li	a5,129
    800010ba:	01879593          	slli	a1,a5,0x18
    800010be:	00034517          	auipc	a0,0x34
    800010c2:	e7250513          	addi	a0,a0,-398 # 80034f30 <end>
    800010c6:	00000097          	auipc	ra,0x0
    800010ca:	012080e7          	jalr	18(ra) # 800010d8 <freerange>
}
    800010ce:	0001                	nop
    800010d0:	60a2                	ld	ra,8(sp)
    800010d2:	6402                	ld	s0,0(sp)
    800010d4:	0141                	addi	sp,sp,16
    800010d6:	8082                	ret

00000000800010d8 <freerange>:

void
freerange(void *pa_start, void *pa_end)
{
    800010d8:	7179                	addi	sp,sp,-48
    800010da:	f406                	sd	ra,40(sp)
    800010dc:	f022                	sd	s0,32(sp)
    800010de:	1800                	addi	s0,sp,48
    800010e0:	fca43c23          	sd	a0,-40(s0)
    800010e4:	fcb43823          	sd	a1,-48(s0)
  char *p;
  p = (char*)PGROUNDUP((uint64)pa_start);
    800010e8:	fd843703          	ld	a4,-40(s0)
    800010ec:	6785                	lui	a5,0x1
    800010ee:	17fd                	addi	a5,a5,-1
    800010f0:	973e                	add	a4,a4,a5
    800010f2:	77fd                	lui	a5,0xfffff
    800010f4:	8ff9                	and	a5,a5,a4
    800010f6:	fef43423          	sd	a5,-24(s0)
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    800010fa:	a829                	j	80001114 <freerange+0x3c>
    kfree(p);
    800010fc:	fe843503          	ld	a0,-24(s0)
    80001100:	00000097          	auipc	ra,0x0
    80001104:	030080e7          	jalr	48(ra) # 80001130 <kfree>
  for(; p + PGSIZE <= (char*)pa_end; p += PGSIZE)
    80001108:	fe843703          	ld	a4,-24(s0)
    8000110c:	6785                	lui	a5,0x1
    8000110e:	97ba                	add	a5,a5,a4
    80001110:	fef43423          	sd	a5,-24(s0)
    80001114:	fe843703          	ld	a4,-24(s0)
    80001118:	6785                	lui	a5,0x1
    8000111a:	97ba                	add	a5,a5,a4
    8000111c:	fd043703          	ld	a4,-48(s0)
    80001120:	fcf77ee3          	bgeu	a4,a5,800010fc <freerange+0x24>
}
    80001124:	0001                	nop
    80001126:	0001                	nop
    80001128:	70a2                	ld	ra,40(sp)
    8000112a:	7402                	ld	s0,32(sp)
    8000112c:	6145                	addi	sp,sp,48
    8000112e:	8082                	ret

0000000080001130 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(void *pa)
{
    80001130:	7179                	addi	sp,sp,-48
    80001132:	f406                	sd	ra,40(sp)
    80001134:	f022                	sd	s0,32(sp)
    80001136:	1800                	addi	s0,sp,48
    80001138:	fca43c23          	sd	a0,-40(s0)
  struct run *r;

  if(((uint64)pa % PGSIZE) != 0 || (char*)pa < end || (uint64)pa >= PHYSTOP)
    8000113c:	fd843703          	ld	a4,-40(s0)
    80001140:	6785                	lui	a5,0x1
    80001142:	17fd                	addi	a5,a5,-1
    80001144:	8ff9                	and	a5,a5,a4
    80001146:	e385                	bnez	a5,80001166 <kfree+0x36>
    80001148:	fd843703          	ld	a4,-40(s0)
    8000114c:	00034797          	auipc	a5,0x34
    80001150:	de478793          	addi	a5,a5,-540 # 80034f30 <end>
    80001154:	00f76963          	bltu	a4,a5,80001166 <kfree+0x36>
    80001158:	fd843703          	ld	a4,-40(s0)
    8000115c:	08100793          	li	a5,129
    80001160:	07e2                	slli	a5,a5,0x18
    80001162:	00f76a63          	bltu	a4,a5,80001176 <kfree+0x46>
    panic("kfree");
    80001166:	0000a517          	auipc	a0,0xa
    8000116a:	ee250513          	addi	a0,a0,-286 # 8000b048 <etext+0x48>
    8000116e:	00000097          	auipc	ra,0x0
    80001172:	b1e080e7          	jalr	-1250(ra) # 80000c8c <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    80001176:	6605                	lui	a2,0x1
    80001178:	4585                	li	a1,1
    8000117a:	fd843503          	ld	a0,-40(s0)
    8000117e:	00000097          	auipc	ra,0x0
    80001182:	380080e7          	jalr	896(ra) # 800014fe <memset>

  r = (struct run*)pa;
    80001186:	fd843783          	ld	a5,-40(s0)
    8000118a:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    8000118e:	00013517          	auipc	a0,0x13
    80001192:	a0250513          	addi	a0,a0,-1534 # 80013b90 <kmem>
    80001196:	00000097          	auipc	ra,0x0
    8000119a:	194080e7          	jalr	404(ra) # 8000132a <acquire>
  r->next = kmem.freelist;
    8000119e:	00013797          	auipc	a5,0x13
    800011a2:	9f278793          	addi	a5,a5,-1550 # 80013b90 <kmem>
    800011a6:	6f98                	ld	a4,24(a5)
    800011a8:	fe843783          	ld	a5,-24(s0)
    800011ac:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800011ae:	00013797          	auipc	a5,0x13
    800011b2:	9e278793          	addi	a5,a5,-1566 # 80013b90 <kmem>
    800011b6:	fe843703          	ld	a4,-24(s0)
    800011ba:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    800011bc:	00013517          	auipc	a0,0x13
    800011c0:	9d450513          	addi	a0,a0,-1580 # 80013b90 <kmem>
    800011c4:	00000097          	auipc	ra,0x0
    800011c8:	1ca080e7          	jalr	458(ra) # 8000138e <release>
}
    800011cc:	0001                	nop
    800011ce:	70a2                	ld	ra,40(sp)
    800011d0:	7402                	ld	s0,32(sp)
    800011d2:	6145                	addi	sp,sp,48
    800011d4:	8082                	ret

00000000800011d6 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
void *
kalloc(void)
{
    800011d6:	1101                	addi	sp,sp,-32
    800011d8:	ec06                	sd	ra,24(sp)
    800011da:	e822                	sd	s0,16(sp)
    800011dc:	1000                	addi	s0,sp,32
  struct run *r;

  acquire(&kmem.lock);
    800011de:	00013517          	auipc	a0,0x13
    800011e2:	9b250513          	addi	a0,a0,-1614 # 80013b90 <kmem>
    800011e6:	00000097          	auipc	ra,0x0
    800011ea:	144080e7          	jalr	324(ra) # 8000132a <acquire>
  r = kmem.freelist;
    800011ee:	00013797          	auipc	a5,0x13
    800011f2:	9a278793          	addi	a5,a5,-1630 # 80013b90 <kmem>
    800011f6:	6f9c                	ld	a5,24(a5)
    800011f8:	fef43423          	sd	a5,-24(s0)
  if(r)
    800011fc:	fe843783          	ld	a5,-24(s0)
    80001200:	cb89                	beqz	a5,80001212 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001202:	fe843783          	ld	a5,-24(s0)
    80001206:	6398                	ld	a4,0(a5)
    80001208:	00013797          	auipc	a5,0x13
    8000120c:	98878793          	addi	a5,a5,-1656 # 80013b90 <kmem>
    80001210:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001212:	00013517          	auipc	a0,0x13
    80001216:	97e50513          	addi	a0,a0,-1666 # 80013b90 <kmem>
    8000121a:	00000097          	auipc	ra,0x0
    8000121e:	174080e7          	jalr	372(ra) # 8000138e <release>

  if(r)
    80001222:	fe843783          	ld	a5,-24(s0)
    80001226:	cb89                	beqz	a5,80001238 <kalloc+0x62>
    memset((char*)r, 5, PGSIZE); // fill with junk
    80001228:	6605                	lui	a2,0x1
    8000122a:	4595                	li	a1,5
    8000122c:	fe843503          	ld	a0,-24(s0)
    80001230:	00000097          	auipc	ra,0x0
    80001234:	2ce080e7          	jalr	718(ra) # 800014fe <memset>
  return (void*)r;
    80001238:	fe843783          	ld	a5,-24(s0)
}
    8000123c:	853e                	mv	a0,a5
    8000123e:	60e2                	ld	ra,24(sp)
    80001240:	6442                	ld	s0,16(sp)
    80001242:	6105                	addi	sp,sp,32
    80001244:	8082                	ret

0000000080001246 <r_sstatus>:
{
    80001246:	1101                	addi	sp,sp,-32
    80001248:	ec22                	sd	s0,24(sp)
    8000124a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000124c:	100027f3          	csrr	a5,sstatus
    80001250:	fef43423          	sd	a5,-24(s0)
  return x;
    80001254:	fe843783          	ld	a5,-24(s0)
}
    80001258:	853e                	mv	a0,a5
    8000125a:	6462                	ld	s0,24(sp)
    8000125c:	6105                	addi	sp,sp,32
    8000125e:	8082                	ret

0000000080001260 <w_sstatus>:
{
    80001260:	1101                	addi	sp,sp,-32
    80001262:	ec22                	sd	s0,24(sp)
    80001264:	1000                	addi	s0,sp,32
    80001266:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8000126a:	fe843783          	ld	a5,-24(s0)
    8000126e:	10079073          	csrw	sstatus,a5
}
    80001272:	0001                	nop
    80001274:	6462                	ld	s0,24(sp)
    80001276:	6105                	addi	sp,sp,32
    80001278:	8082                	ret

000000008000127a <intr_on>:
{
    8000127a:	1141                	addi	sp,sp,-16
    8000127c:	e406                	sd	ra,8(sp)
    8000127e:	e022                	sd	s0,0(sp)
    80001280:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80001282:	00000097          	auipc	ra,0x0
    80001286:	fc4080e7          	jalr	-60(ra) # 80001246 <r_sstatus>
    8000128a:	87aa                	mv	a5,a0
    8000128c:	0027e793          	ori	a5,a5,2
    80001290:	853e                	mv	a0,a5
    80001292:	00000097          	auipc	ra,0x0
    80001296:	fce080e7          	jalr	-50(ra) # 80001260 <w_sstatus>
}
    8000129a:	0001                	nop
    8000129c:	60a2                	ld	ra,8(sp)
    8000129e:	6402                	ld	s0,0(sp)
    800012a0:	0141                	addi	sp,sp,16
    800012a2:	8082                	ret

00000000800012a4 <intr_off>:
{
    800012a4:	1141                	addi	sp,sp,-16
    800012a6:	e406                	sd	ra,8(sp)
    800012a8:	e022                	sd	s0,0(sp)
    800012aa:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800012ac:	00000097          	auipc	ra,0x0
    800012b0:	f9a080e7          	jalr	-102(ra) # 80001246 <r_sstatus>
    800012b4:	87aa                	mv	a5,a0
    800012b6:	9bf5                	andi	a5,a5,-3
    800012b8:	853e                	mv	a0,a5
    800012ba:	00000097          	auipc	ra,0x0
    800012be:	fa6080e7          	jalr	-90(ra) # 80001260 <w_sstatus>
}
    800012c2:	0001                	nop
    800012c4:	60a2                	ld	ra,8(sp)
    800012c6:	6402                	ld	s0,0(sp)
    800012c8:	0141                	addi	sp,sp,16
    800012ca:	8082                	ret

00000000800012cc <intr_get>:
{
    800012cc:	1101                	addi	sp,sp,-32
    800012ce:	ec06                	sd	ra,24(sp)
    800012d0:	e822                	sd	s0,16(sp)
    800012d2:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800012d4:	00000097          	auipc	ra,0x0
    800012d8:	f72080e7          	jalr	-142(ra) # 80001246 <r_sstatus>
    800012dc:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800012e0:	fe843783          	ld	a5,-24(s0)
    800012e4:	8b89                	andi	a5,a5,2
    800012e6:	00f037b3          	snez	a5,a5
    800012ea:	0ff7f793          	andi	a5,a5,255
    800012ee:	2781                	sext.w	a5,a5
}
    800012f0:	853e                	mv	a0,a5
    800012f2:	60e2                	ld	ra,24(sp)
    800012f4:	6442                	ld	s0,16(sp)
    800012f6:	6105                	addi	sp,sp,32
    800012f8:	8082                	ret

00000000800012fa <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    800012fa:	1101                	addi	sp,sp,-32
    800012fc:	ec22                	sd	s0,24(sp)
    800012fe:	1000                	addi	s0,sp,32
    80001300:	fea43423          	sd	a0,-24(s0)
    80001304:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    80001308:	fe843783          	ld	a5,-24(s0)
    8000130c:	fe043703          	ld	a4,-32(s0)
    80001310:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001312:	fe843783          	ld	a5,-24(s0)
    80001316:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000131a:	fe843783          	ld	a5,-24(s0)
    8000131e:	0007b823          	sd	zero,16(a5)
}
    80001322:	0001                	nop
    80001324:	6462                	ld	s0,24(sp)
    80001326:	6105                	addi	sp,sp,32
    80001328:	8082                	ret

000000008000132a <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000132a:	1101                	addi	sp,sp,-32
    8000132c:	ec06                	sd	ra,24(sp)
    8000132e:	e822                	sd	s0,16(sp)
    80001330:	1000                	addi	s0,sp,32
    80001332:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    80001336:	00000097          	auipc	ra,0x0
    8000133a:	0f2080e7          	jalr	242(ra) # 80001428 <push_off>
  if(holding(lk))
    8000133e:	fe843503          	ld	a0,-24(s0)
    80001342:	00000097          	auipc	ra,0x0
    80001346:	0a2080e7          	jalr	162(ra) # 800013e4 <holding>
    8000134a:	87aa                	mv	a5,a0
    8000134c:	cb89                	beqz	a5,8000135e <acquire+0x34>
    panic("acquire");
    8000134e:	0000a517          	auipc	a0,0xa
    80001352:	d0250513          	addi	a0,a0,-766 # 8000b050 <etext+0x50>
    80001356:	00000097          	auipc	ra,0x0
    8000135a:	936080e7          	jalr	-1738(ra) # 80000c8c <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    8000135e:	0001                	nop
    80001360:	fe843783          	ld	a5,-24(s0)
    80001364:	4705                	li	a4,1
    80001366:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    8000136a:	0007079b          	sext.w	a5,a4
    8000136e:	fbed                	bnez	a5,80001360 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001370:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    80001374:	00001097          	auipc	ra,0x1
    80001378:	60e080e7          	jalr	1550(ra) # 80002982 <mycpu>
    8000137c:	872a                	mv	a4,a0
    8000137e:	fe843783          	ld	a5,-24(s0)
    80001382:	eb98                	sd	a4,16(a5)
}
    80001384:	0001                	nop
    80001386:	60e2                	ld	ra,24(sp)
    80001388:	6442                	ld	s0,16(sp)
    8000138a:	6105                	addi	sp,sp,32
    8000138c:	8082                	ret

000000008000138e <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    8000138e:	1101                	addi	sp,sp,-32
    80001390:	ec06                	sd	ra,24(sp)
    80001392:	e822                	sd	s0,16(sp)
    80001394:	1000                	addi	s0,sp,32
    80001396:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    8000139a:	fe843503          	ld	a0,-24(s0)
    8000139e:	00000097          	auipc	ra,0x0
    800013a2:	046080e7          	jalr	70(ra) # 800013e4 <holding>
    800013a6:	87aa                	mv	a5,a0
    800013a8:	eb89                	bnez	a5,800013ba <release+0x2c>
    panic("release");
    800013aa:	0000a517          	auipc	a0,0xa
    800013ae:	cae50513          	addi	a0,a0,-850 # 8000b058 <etext+0x58>
    800013b2:	00000097          	auipc	ra,0x0
    800013b6:	8da080e7          	jalr	-1830(ra) # 80000c8c <panic>

  lk->cpu = 0;
    800013ba:	fe843783          	ld	a5,-24(s0)
    800013be:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800013c2:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    800013c6:	fe843783          	ld	a5,-24(s0)
    800013ca:	0f50000f          	fence	iorw,ow
    800013ce:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    800013d2:	00000097          	auipc	ra,0x0
    800013d6:	0ae080e7          	jalr	174(ra) # 80001480 <pop_off>
}
    800013da:	0001                	nop
    800013dc:	60e2                	ld	ra,24(sp)
    800013de:	6442                	ld	s0,16(sp)
    800013e0:	6105                	addi	sp,sp,32
    800013e2:	8082                	ret

00000000800013e4 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    800013e4:	7139                	addi	sp,sp,-64
    800013e6:	fc06                	sd	ra,56(sp)
    800013e8:	f822                	sd	s0,48(sp)
    800013ea:	f426                	sd	s1,40(sp)
    800013ec:	0080                	addi	s0,sp,64
    800013ee:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    800013f2:	fc843783          	ld	a5,-56(s0)
    800013f6:	439c                	lw	a5,0(a5)
    800013f8:	cf89                	beqz	a5,80001412 <holding+0x2e>
    800013fa:	fc843783          	ld	a5,-56(s0)
    800013fe:	6b84                	ld	s1,16(a5)
    80001400:	00001097          	auipc	ra,0x1
    80001404:	582080e7          	jalr	1410(ra) # 80002982 <mycpu>
    80001408:	87aa                	mv	a5,a0
    8000140a:	00f49463          	bne	s1,a5,80001412 <holding+0x2e>
    8000140e:	4785                	li	a5,1
    80001410:	a011                	j	80001414 <holding+0x30>
    80001412:	4781                	li	a5,0
    80001414:	fcf42e23          	sw	a5,-36(s0)
  return r;
    80001418:	fdc42783          	lw	a5,-36(s0)
}
    8000141c:	853e                	mv	a0,a5
    8000141e:	70e2                	ld	ra,56(sp)
    80001420:	7442                	ld	s0,48(sp)
    80001422:	74a2                	ld	s1,40(sp)
    80001424:	6121                	addi	sp,sp,64
    80001426:	8082                	ret

0000000080001428 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    80001428:	1101                	addi	sp,sp,-32
    8000142a:	ec06                	sd	ra,24(sp)
    8000142c:	e822                	sd	s0,16(sp)
    8000142e:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001430:	00000097          	auipc	ra,0x0
    80001434:	e9c080e7          	jalr	-356(ra) # 800012cc <intr_get>
    80001438:	87aa                	mv	a5,a0
    8000143a:	fef42623          	sw	a5,-20(s0)

  intr_off();
    8000143e:	00000097          	auipc	ra,0x0
    80001442:	e66080e7          	jalr	-410(ra) # 800012a4 <intr_off>
  if(mycpu()->noff == 0)
    80001446:	00001097          	auipc	ra,0x1
    8000144a:	53c080e7          	jalr	1340(ra) # 80002982 <mycpu>
    8000144e:	87aa                	mv	a5,a0
    80001450:	5fbc                	lw	a5,120(a5)
    80001452:	eb89                	bnez	a5,80001464 <push_off+0x3c>
    mycpu()->intena = old;
    80001454:	00001097          	auipc	ra,0x1
    80001458:	52e080e7          	jalr	1326(ra) # 80002982 <mycpu>
    8000145c:	872a                	mv	a4,a0
    8000145e:	fec42783          	lw	a5,-20(s0)
    80001462:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    80001464:	00001097          	auipc	ra,0x1
    80001468:	51e080e7          	jalr	1310(ra) # 80002982 <mycpu>
    8000146c:	87aa                	mv	a5,a0
    8000146e:	5fb8                	lw	a4,120(a5)
    80001470:	2705                	addiw	a4,a4,1
    80001472:	2701                	sext.w	a4,a4
    80001474:	dfb8                	sw	a4,120(a5)
}
    80001476:	0001                	nop
    80001478:	60e2                	ld	ra,24(sp)
    8000147a:	6442                	ld	s0,16(sp)
    8000147c:	6105                	addi	sp,sp,32
    8000147e:	8082                	ret

0000000080001480 <pop_off>:

void
pop_off(void)
{
    80001480:	1101                	addi	sp,sp,-32
    80001482:	ec06                	sd	ra,24(sp)
    80001484:	e822                	sd	s0,16(sp)
    80001486:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    80001488:	00001097          	auipc	ra,0x1
    8000148c:	4fa080e7          	jalr	1274(ra) # 80002982 <mycpu>
    80001490:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    80001494:	00000097          	auipc	ra,0x0
    80001498:	e38080e7          	jalr	-456(ra) # 800012cc <intr_get>
    8000149c:	87aa                	mv	a5,a0
    8000149e:	cb89                	beqz	a5,800014b0 <pop_off+0x30>
    panic("pop_off - interruptible");
    800014a0:	0000a517          	auipc	a0,0xa
    800014a4:	bc050513          	addi	a0,a0,-1088 # 8000b060 <etext+0x60>
    800014a8:	fffff097          	auipc	ra,0xfffff
    800014ac:	7e4080e7          	jalr	2020(ra) # 80000c8c <panic>
  if(c->noff < 1)
    800014b0:	fe843783          	ld	a5,-24(s0)
    800014b4:	5fbc                	lw	a5,120(a5)
    800014b6:	00f04a63          	bgtz	a5,800014ca <pop_off+0x4a>
    panic("pop_off");
    800014ba:	0000a517          	auipc	a0,0xa
    800014be:	bbe50513          	addi	a0,a0,-1090 # 8000b078 <etext+0x78>
    800014c2:	fffff097          	auipc	ra,0xfffff
    800014c6:	7ca080e7          	jalr	1994(ra) # 80000c8c <panic>
  c->noff -= 1;
    800014ca:	fe843783          	ld	a5,-24(s0)
    800014ce:	5fbc                	lw	a5,120(a5)
    800014d0:	37fd                	addiw	a5,a5,-1
    800014d2:	0007871b          	sext.w	a4,a5
    800014d6:	fe843783          	ld	a5,-24(s0)
    800014da:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	5fbc                	lw	a5,120(a5)
    800014e2:	eb89                	bnez	a5,800014f4 <pop_off+0x74>
    800014e4:	fe843783          	ld	a5,-24(s0)
    800014e8:	5ffc                	lw	a5,124(a5)
    800014ea:	c789                	beqz	a5,800014f4 <pop_off+0x74>
    intr_on();
    800014ec:	00000097          	auipc	ra,0x0
    800014f0:	d8e080e7          	jalr	-626(ra) # 8000127a <intr_on>
}
    800014f4:	0001                	nop
    800014f6:	60e2                	ld	ra,24(sp)
    800014f8:	6442                	ld	s0,16(sp)
    800014fa:	6105                	addi	sp,sp,32
    800014fc:	8082                	ret

00000000800014fe <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    800014fe:	7179                	addi	sp,sp,-48
    80001500:	f422                	sd	s0,40(sp)
    80001502:	1800                	addi	s0,sp,48
    80001504:	fca43c23          	sd	a0,-40(s0)
    80001508:	87ae                	mv	a5,a1
    8000150a:	8732                	mv	a4,a2
    8000150c:	fcf42a23          	sw	a5,-44(s0)
    80001510:	87ba                	mv	a5,a4
    80001512:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    80001516:	fd843783          	ld	a5,-40(s0)
    8000151a:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    8000151e:	fe042623          	sw	zero,-20(s0)
    80001522:	a00d                	j	80001544 <memset+0x46>
    cdst[i] = c;
    80001524:	fec42783          	lw	a5,-20(s0)
    80001528:	fe043703          	ld	a4,-32(s0)
    8000152c:	97ba                	add	a5,a5,a4
    8000152e:	fd442703          	lw	a4,-44(s0)
    80001532:	0ff77713          	andi	a4,a4,255
    80001536:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000153a:	fec42783          	lw	a5,-20(s0)
    8000153e:	2785                	addiw	a5,a5,1
    80001540:	fef42623          	sw	a5,-20(s0)
    80001544:	fec42703          	lw	a4,-20(s0)
    80001548:	fd042783          	lw	a5,-48(s0)
    8000154c:	2781                	sext.w	a5,a5
    8000154e:	fcf76be3          	bltu	a4,a5,80001524 <memset+0x26>
  }
  return dst;
    80001552:	fd843783          	ld	a5,-40(s0)
}
    80001556:	853e                	mv	a0,a5
    80001558:	7422                	ld	s0,40(sp)
    8000155a:	6145                	addi	sp,sp,48
    8000155c:	8082                	ret

000000008000155e <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    8000155e:	7139                	addi	sp,sp,-64
    80001560:	fc22                	sd	s0,56(sp)
    80001562:	0080                	addi	s0,sp,64
    80001564:	fca43c23          	sd	a0,-40(s0)
    80001568:	fcb43823          	sd	a1,-48(s0)
    8000156c:	87b2                	mv	a5,a2
    8000156e:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    80001572:	fd843783          	ld	a5,-40(s0)
    80001576:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    8000157a:	fd043783          	ld	a5,-48(s0)
    8000157e:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    80001582:	a0a1                	j	800015ca <memcmp+0x6c>
    if(*s1 != *s2)
    80001584:	fe843783          	ld	a5,-24(s0)
    80001588:	0007c703          	lbu	a4,0(a5)
    8000158c:	fe043783          	ld	a5,-32(s0)
    80001590:	0007c783          	lbu	a5,0(a5)
    80001594:	02f70163          	beq	a4,a5,800015b6 <memcmp+0x58>
      return *s1 - *s2;
    80001598:	fe843783          	ld	a5,-24(s0)
    8000159c:	0007c783          	lbu	a5,0(a5)
    800015a0:	0007871b          	sext.w	a4,a5
    800015a4:	fe043783          	ld	a5,-32(s0)
    800015a8:	0007c783          	lbu	a5,0(a5)
    800015ac:	2781                	sext.w	a5,a5
    800015ae:	40f707bb          	subw	a5,a4,a5
    800015b2:	2781                	sext.w	a5,a5
    800015b4:	a01d                	j	800015da <memcmp+0x7c>
    s1++, s2++;
    800015b6:	fe843783          	ld	a5,-24(s0)
    800015ba:	0785                	addi	a5,a5,1
    800015bc:	fef43423          	sd	a5,-24(s0)
    800015c0:	fe043783          	ld	a5,-32(s0)
    800015c4:	0785                	addi	a5,a5,1
    800015c6:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800015ca:	fcc42783          	lw	a5,-52(s0)
    800015ce:	fff7871b          	addiw	a4,a5,-1
    800015d2:	fce42623          	sw	a4,-52(s0)
    800015d6:	f7dd                	bnez	a5,80001584 <memcmp+0x26>
  }

  return 0;
    800015d8:	4781                	li	a5,0
}
    800015da:	853e                	mv	a0,a5
    800015dc:	7462                	ld	s0,56(sp)
    800015de:	6121                	addi	sp,sp,64
    800015e0:	8082                	ret

00000000800015e2 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    800015e2:	7139                	addi	sp,sp,-64
    800015e4:	fc22                	sd	s0,56(sp)
    800015e6:	0080                	addi	s0,sp,64
    800015e8:	fca43c23          	sd	a0,-40(s0)
    800015ec:	fcb43823          	sd	a1,-48(s0)
    800015f0:	87b2                	mv	a5,a2
    800015f2:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    800015f6:	fcc42783          	lw	a5,-52(s0)
    800015fa:	2781                	sext.w	a5,a5
    800015fc:	e781                	bnez	a5,80001604 <memmove+0x22>
    return dst;
    800015fe:	fd843783          	ld	a5,-40(s0)
    80001602:	a855                	j	800016b6 <memmove+0xd4>
  
  s = src;
    80001604:	fd043783          	ld	a5,-48(s0)
    80001608:	fef43423          	sd	a5,-24(s0)
  d = dst;
    8000160c:	fd843783          	ld	a5,-40(s0)
    80001610:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001614:	fe843703          	ld	a4,-24(s0)
    80001618:	fe043783          	ld	a5,-32(s0)
    8000161c:	08f77463          	bgeu	a4,a5,800016a4 <memmove+0xc2>
    80001620:	fcc46783          	lwu	a5,-52(s0)
    80001624:	fe843703          	ld	a4,-24(s0)
    80001628:	97ba                	add	a5,a5,a4
    8000162a:	fe043703          	ld	a4,-32(s0)
    8000162e:	06f77b63          	bgeu	a4,a5,800016a4 <memmove+0xc2>
    s += n;
    80001632:	fcc46783          	lwu	a5,-52(s0)
    80001636:	fe843703          	ld	a4,-24(s0)
    8000163a:	97ba                	add	a5,a5,a4
    8000163c:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001640:	fcc46783          	lwu	a5,-52(s0)
    80001644:	fe043703          	ld	a4,-32(s0)
    80001648:	97ba                	add	a5,a5,a4
    8000164a:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    8000164e:	a01d                	j	80001674 <memmove+0x92>
      *--d = *--s;
    80001650:	fe843783          	ld	a5,-24(s0)
    80001654:	17fd                	addi	a5,a5,-1
    80001656:	fef43423          	sd	a5,-24(s0)
    8000165a:	fe043783          	ld	a5,-32(s0)
    8000165e:	17fd                	addi	a5,a5,-1
    80001660:	fef43023          	sd	a5,-32(s0)
    80001664:	fe843783          	ld	a5,-24(s0)
    80001668:	0007c703          	lbu	a4,0(a5)
    8000166c:	fe043783          	ld	a5,-32(s0)
    80001670:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    80001674:	fcc42783          	lw	a5,-52(s0)
    80001678:	fff7871b          	addiw	a4,a5,-1
    8000167c:	fce42623          	sw	a4,-52(s0)
    80001680:	fbe1                	bnez	a5,80001650 <memmove+0x6e>
  if(s < d && s + n > d){
    80001682:	a805                	j	800016b2 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    80001684:	fe843703          	ld	a4,-24(s0)
    80001688:	00170793          	addi	a5,a4,1
    8000168c:	fef43423          	sd	a5,-24(s0)
    80001690:	fe043783          	ld	a5,-32(s0)
    80001694:	00178693          	addi	a3,a5,1
    80001698:	fed43023          	sd	a3,-32(s0)
    8000169c:	00074703          	lbu	a4,0(a4)
    800016a0:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800016a4:	fcc42783          	lw	a5,-52(s0)
    800016a8:	fff7871b          	addiw	a4,a5,-1
    800016ac:	fce42623          	sw	a4,-52(s0)
    800016b0:	fbf1                	bnez	a5,80001684 <memmove+0xa2>

  return dst;
    800016b2:	fd843783          	ld	a5,-40(s0)
}
    800016b6:	853e                	mv	a0,a5
    800016b8:	7462                	ld	s0,56(sp)
    800016ba:	6121                	addi	sp,sp,64
    800016bc:	8082                	ret

00000000800016be <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    800016be:	7179                	addi	sp,sp,-48
    800016c0:	f406                	sd	ra,40(sp)
    800016c2:	f022                	sd	s0,32(sp)
    800016c4:	1800                	addi	s0,sp,48
    800016c6:	fea43423          	sd	a0,-24(s0)
    800016ca:	feb43023          	sd	a1,-32(s0)
    800016ce:	87b2                	mv	a5,a2
    800016d0:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    800016d4:	fdc42783          	lw	a5,-36(s0)
    800016d8:	863e                	mv	a2,a5
    800016da:	fe043583          	ld	a1,-32(s0)
    800016de:	fe843503          	ld	a0,-24(s0)
    800016e2:	00000097          	auipc	ra,0x0
    800016e6:	f00080e7          	jalr	-256(ra) # 800015e2 <memmove>
    800016ea:	87aa                	mv	a5,a0
}
    800016ec:	853e                	mv	a0,a5
    800016ee:	70a2                	ld	ra,40(sp)
    800016f0:	7402                	ld	s0,32(sp)
    800016f2:	6145                	addi	sp,sp,48
    800016f4:	8082                	ret

00000000800016f6 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    800016f6:	7179                	addi	sp,sp,-48
    800016f8:	f422                	sd	s0,40(sp)
    800016fa:	1800                	addi	s0,sp,48
    800016fc:	fea43423          	sd	a0,-24(s0)
    80001700:	feb43023          	sd	a1,-32(s0)
    80001704:	87b2                	mv	a5,a2
    80001706:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    8000170a:	a005                	j	8000172a <strncmp+0x34>
    n--, p++, q++;
    8000170c:	fdc42783          	lw	a5,-36(s0)
    80001710:	37fd                	addiw	a5,a5,-1
    80001712:	fcf42e23          	sw	a5,-36(s0)
    80001716:	fe843783          	ld	a5,-24(s0)
    8000171a:	0785                	addi	a5,a5,1
    8000171c:	fef43423          	sd	a5,-24(s0)
    80001720:	fe043783          	ld	a5,-32(s0)
    80001724:	0785                	addi	a5,a5,1
    80001726:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    8000172a:	fdc42783          	lw	a5,-36(s0)
    8000172e:	2781                	sext.w	a5,a5
    80001730:	c385                	beqz	a5,80001750 <strncmp+0x5a>
    80001732:	fe843783          	ld	a5,-24(s0)
    80001736:	0007c783          	lbu	a5,0(a5)
    8000173a:	cb99                	beqz	a5,80001750 <strncmp+0x5a>
    8000173c:	fe843783          	ld	a5,-24(s0)
    80001740:	0007c703          	lbu	a4,0(a5)
    80001744:	fe043783          	ld	a5,-32(s0)
    80001748:	0007c783          	lbu	a5,0(a5)
    8000174c:	fcf700e3          	beq	a4,a5,8000170c <strncmp+0x16>
  if(n == 0)
    80001750:	fdc42783          	lw	a5,-36(s0)
    80001754:	2781                	sext.w	a5,a5
    80001756:	e399                	bnez	a5,8000175c <strncmp+0x66>
    return 0;
    80001758:	4781                	li	a5,0
    8000175a:	a839                	j	80001778 <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    8000175c:	fe843783          	ld	a5,-24(s0)
    80001760:	0007c783          	lbu	a5,0(a5)
    80001764:	0007871b          	sext.w	a4,a5
    80001768:	fe043783          	ld	a5,-32(s0)
    8000176c:	0007c783          	lbu	a5,0(a5)
    80001770:	2781                	sext.w	a5,a5
    80001772:	40f707bb          	subw	a5,a4,a5
    80001776:	2781                	sext.w	a5,a5
}
    80001778:	853e                	mv	a0,a5
    8000177a:	7422                	ld	s0,40(sp)
    8000177c:	6145                	addi	sp,sp,48
    8000177e:	8082                	ret

0000000080001780 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    80001780:	7139                	addi	sp,sp,-64
    80001782:	fc22                	sd	s0,56(sp)
    80001784:	0080                	addi	s0,sp,64
    80001786:	fca43c23          	sd	a0,-40(s0)
    8000178a:	fcb43823          	sd	a1,-48(s0)
    8000178e:	87b2                	mv	a5,a2
    80001790:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    80001794:	fd843783          	ld	a5,-40(s0)
    80001798:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    8000179c:	0001                	nop
    8000179e:	fcc42783          	lw	a5,-52(s0)
    800017a2:	fff7871b          	addiw	a4,a5,-1
    800017a6:	fce42623          	sw	a4,-52(s0)
    800017aa:	02f05e63          	blez	a5,800017e6 <strncpy+0x66>
    800017ae:	fd043703          	ld	a4,-48(s0)
    800017b2:	00170793          	addi	a5,a4,1
    800017b6:	fcf43823          	sd	a5,-48(s0)
    800017ba:	fd843783          	ld	a5,-40(s0)
    800017be:	00178693          	addi	a3,a5,1
    800017c2:	fcd43c23          	sd	a3,-40(s0)
    800017c6:	00074703          	lbu	a4,0(a4)
    800017ca:	00e78023          	sb	a4,0(a5)
    800017ce:	0007c783          	lbu	a5,0(a5)
    800017d2:	f7f1                	bnez	a5,8000179e <strncpy+0x1e>
    ;
  while(n-- > 0)
    800017d4:	a809                	j	800017e6 <strncpy+0x66>
    *s++ = 0;
    800017d6:	fd843783          	ld	a5,-40(s0)
    800017da:	00178713          	addi	a4,a5,1
    800017de:	fce43c23          	sd	a4,-40(s0)
    800017e2:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    800017e6:	fcc42783          	lw	a5,-52(s0)
    800017ea:	fff7871b          	addiw	a4,a5,-1
    800017ee:	fce42623          	sw	a4,-52(s0)
    800017f2:	fef042e3          	bgtz	a5,800017d6 <strncpy+0x56>
  return os;
    800017f6:	fe843783          	ld	a5,-24(s0)
}
    800017fa:	853e                	mv	a0,a5
    800017fc:	7462                	ld	s0,56(sp)
    800017fe:	6121                	addi	sp,sp,64
    80001800:	8082                	ret

0000000080001802 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001802:	7139                	addi	sp,sp,-64
    80001804:	fc22                	sd	s0,56(sp)
    80001806:	0080                	addi	s0,sp,64
    80001808:	fca43c23          	sd	a0,-40(s0)
    8000180c:	fcb43823          	sd	a1,-48(s0)
    80001810:	87b2                	mv	a5,a2
    80001812:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    80001816:	fd843783          	ld	a5,-40(s0)
    8000181a:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    8000181e:	fcc42783          	lw	a5,-52(s0)
    80001822:	2781                	sext.w	a5,a5
    80001824:	00f04563          	bgtz	a5,8000182e <safestrcpy+0x2c>
    return os;
    80001828:	fe843783          	ld	a5,-24(s0)
    8000182c:	a0a1                	j	80001874 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    8000182e:	fcc42783          	lw	a5,-52(s0)
    80001832:	37fd                	addiw	a5,a5,-1
    80001834:	fcf42623          	sw	a5,-52(s0)
    80001838:	fcc42783          	lw	a5,-52(s0)
    8000183c:	2781                	sext.w	a5,a5
    8000183e:	02f05563          	blez	a5,80001868 <safestrcpy+0x66>
    80001842:	fd043703          	ld	a4,-48(s0)
    80001846:	00170793          	addi	a5,a4,1
    8000184a:	fcf43823          	sd	a5,-48(s0)
    8000184e:	fd843783          	ld	a5,-40(s0)
    80001852:	00178693          	addi	a3,a5,1
    80001856:	fcd43c23          	sd	a3,-40(s0)
    8000185a:	00074703          	lbu	a4,0(a4)
    8000185e:	00e78023          	sb	a4,0(a5)
    80001862:	0007c783          	lbu	a5,0(a5)
    80001866:	f7e1                	bnez	a5,8000182e <safestrcpy+0x2c>
    ;
  *s = 0;
    80001868:	fd843783          	ld	a5,-40(s0)
    8000186c:	00078023          	sb	zero,0(a5)
  return os;
    80001870:	fe843783          	ld	a5,-24(s0)
}
    80001874:	853e                	mv	a0,a5
    80001876:	7462                	ld	s0,56(sp)
    80001878:	6121                	addi	sp,sp,64
    8000187a:	8082                	ret

000000008000187c <strlen>:

int
strlen(const char *s)
{
    8000187c:	7179                	addi	sp,sp,-48
    8000187e:	f422                	sd	s0,40(sp)
    80001880:	1800                	addi	s0,sp,48
    80001882:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    80001886:	fe042623          	sw	zero,-20(s0)
    8000188a:	a031                	j	80001896 <strlen+0x1a>
    8000188c:	fec42783          	lw	a5,-20(s0)
    80001890:	2785                	addiw	a5,a5,1
    80001892:	fef42623          	sw	a5,-20(s0)
    80001896:	fec42783          	lw	a5,-20(s0)
    8000189a:	fd843703          	ld	a4,-40(s0)
    8000189e:	97ba                	add	a5,a5,a4
    800018a0:	0007c783          	lbu	a5,0(a5)
    800018a4:	f7e5                	bnez	a5,8000188c <strlen+0x10>
    ;
  return n;
    800018a6:	fec42783          	lw	a5,-20(s0)
}
    800018aa:	853e                	mv	a0,a5
    800018ac:	7422                	ld	s0,40(sp)
    800018ae:	6145                	addi	sp,sp,48
    800018b0:	8082                	ret

00000000800018b2 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800018b2:	1141                	addi	sp,sp,-16
    800018b4:	e406                	sd	ra,8(sp)
    800018b6:	e022                	sd	s0,0(sp)
    800018b8:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800018ba:	00001097          	auipc	ra,0x1
    800018be:	0a4080e7          	jalr	164(ra) # 8000295e <cpuid>
    800018c2:	87aa                	mv	a5,a0
    800018c4:	efe1                	bnez	a5,8000199c <main+0xea>
    consoleinit();
    800018c6:	fffff097          	auipc	ra,0xfffff
    800018ca:	f9a080e7          	jalr	-102(ra) # 80000860 <consoleinit>
    printfinit();
    800018ce:	fffff097          	auipc	ra,0xfffff
    800018d2:	4bc080e7          	jalr	1212(ra) # 80000d8a <printfinit>
    printf("\n");
    800018d6:	00009517          	auipc	a0,0x9
    800018da:	7aa50513          	addi	a0,a0,1962 # 8000b080 <etext+0x80>
    800018de:	fffff097          	auipc	ra,0xfffff
    800018e2:	158080e7          	jalr	344(ra) # 80000a36 <printf>
    printf("xv6 kernel is booting\n");
    800018e6:	00009517          	auipc	a0,0x9
    800018ea:	7a250513          	addi	a0,a0,1954 # 8000b088 <etext+0x88>
    800018ee:	fffff097          	auipc	ra,0xfffff
    800018f2:	148080e7          	jalr	328(ra) # 80000a36 <printf>
    printf("\n");
    800018f6:	00009517          	auipc	a0,0x9
    800018fa:	78a50513          	addi	a0,a0,1930 # 8000b080 <etext+0x80>
    800018fe:	fffff097          	auipc	ra,0xfffff
    80001902:	138080e7          	jalr	312(ra) # 80000a36 <printf>
    kinit();         // physical page allocator
    80001906:	fffff097          	auipc	ra,0xfffff
    8000190a:	790080e7          	jalr	1936(ra) # 80001096 <kinit>
    kvminit();       // create kernel page table
    8000190e:	00000097          	auipc	ra,0x0
    80001912:	22a080e7          	jalr	554(ra) # 80001b38 <kvminit>
    kvminithart();   // turn on paging
    80001916:	00000097          	auipc	ra,0x0
    8000191a:	248080e7          	jalr	584(ra) # 80001b5e <kvminithart>
    procinit();      // process table
    8000191e:	00001097          	auipc	ra,0x1
    80001922:	f72080e7          	jalr	-142(ra) # 80002890 <procinit>
    trapinit();      // trap vectors
    80001926:	00002097          	auipc	ra,0x2
    8000192a:	276080e7          	jalr	630(ra) # 80003b9c <trapinit>
    trapinithart();  // install kernel trap vector
    8000192e:	00002097          	auipc	ra,0x2
    80001932:	298080e7          	jalr	664(ra) # 80003bc6 <trapinithart>
    plicinit();      // set up interrupt controller
    80001936:	00007097          	auipc	ra,0x7
    8000193a:	0f4080e7          	jalr	244(ra) # 80008a2a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    8000193e:	00007097          	auipc	ra,0x7
    80001942:	11a080e7          	jalr	282(ra) # 80008a58 <plicinithart>
    binit();         // buffer cache
    80001946:	00003097          	auipc	ra,0x3
    8000194a:	c92080e7          	jalr	-878(ra) # 800045d8 <binit>
    iinit();         // inode table
    8000194e:	00003097          	auipc	ra,0x3
    80001952:	4e8080e7          	jalr	1256(ra) # 80004e36 <iinit>
    fileinit();      // file table
    80001956:	00005097          	auipc	ra,0x5
    8000195a:	ebc080e7          	jalr	-324(ra) # 80006812 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    8000195e:	00009597          	auipc	a1,0x9
    80001962:	74258593          	addi	a1,a1,1858 # 8000b0a0 <etext+0xa0>
    80001966:	4501                	li	a0,0
    80001968:	00007097          	auipc	ra,0x7
    8000196c:	24a080e7          	jalr	586(ra) # 80008bb2 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    80001970:	00009597          	auipc	a1,0x9
    80001974:	74058593          	addi	a1,a1,1856 # 8000b0b0 <etext+0xb0>
    80001978:	4505                	li	a0,1
    8000197a:	00007097          	auipc	ra,0x7
    8000197e:	238080e7          	jalr	568(ra) # 80008bb2 <virtio_disk_init>

    userinit();      // first user process
    80001982:	00001097          	auipc	ra,0x1
    80001986:	3ba080e7          	jalr	954(ra) # 80002d3c <userinit>
    __sync_synchronize();
    8000198a:	0ff0000f          	fence
    started = 1;
    8000198e:	00012797          	auipc	a5,0x12
    80001992:	22278793          	addi	a5,a5,546 # 80013bb0 <started>
    80001996:	4705                	li	a4,1
    80001998:	c398                	sw	a4,0(a5)
    8000199a:	a0a9                	j	800019e4 <main+0x132>
  } else {
    while(started == 0)
    8000199c:	0001                	nop
    8000199e:	00012797          	auipc	a5,0x12
    800019a2:	21278793          	addi	a5,a5,530 # 80013bb0 <started>
    800019a6:	439c                	lw	a5,0(a5)
    800019a8:	2781                	sext.w	a5,a5
    800019aa:	dbf5                	beqz	a5,8000199e <main+0xec>
      ;
    __sync_synchronize();
    800019ac:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800019b0:	00001097          	auipc	ra,0x1
    800019b4:	fae080e7          	jalr	-82(ra) # 8000295e <cpuid>
    800019b8:	87aa                	mv	a5,a0
    800019ba:	85be                	mv	a1,a5
    800019bc:	00009517          	auipc	a0,0x9
    800019c0:	70450513          	addi	a0,a0,1796 # 8000b0c0 <etext+0xc0>
    800019c4:	fffff097          	auipc	ra,0xfffff
    800019c8:	072080e7          	jalr	114(ra) # 80000a36 <printf>
    kvminithart();    // turn on paging
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	192080e7          	jalr	402(ra) # 80001b5e <kvminithart>
    trapinithart();   // install kernel trap vector
    800019d4:	00002097          	auipc	ra,0x2
    800019d8:	1f2080e7          	jalr	498(ra) # 80003bc6 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    800019dc:	00007097          	auipc	ra,0x7
    800019e0:	07c080e7          	jalr	124(ra) # 80008a58 <plicinithart>
  }

  scheduler();        
    800019e4:	00002097          	auipc	ra,0x2
    800019e8:	96e080e7          	jalr	-1682(ra) # 80003352 <scheduler>

00000000800019ec <w_satp>:
{
    800019ec:	1101                	addi	sp,sp,-32
    800019ee:	ec22                	sd	s0,24(sp)
    800019f0:	1000                	addi	s0,sp,32
    800019f2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    800019f6:	fe843783          	ld	a5,-24(s0)
    800019fa:	18079073          	csrw	satp,a5
}
    800019fe:	0001                	nop
    80001a00:	6462                	ld	s0,24(sp)
    80001a02:	6105                	addi	sp,sp,32
    80001a04:	8082                	ret

0000000080001a06 <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    80001a06:	1141                	addi	sp,sp,-16
    80001a08:	e422                	sd	s0,8(sp)
    80001a0a:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001a0c:	12000073          	sfence.vma
}
    80001a10:	0001                	nop
    80001a12:	6422                	ld	s0,8(sp)
    80001a14:	0141                	addi	sp,sp,16
    80001a16:	8082                	ret

0000000080001a18 <kvmmake>:
static struct lrupinfo lrupages[(PHYSTOP - KERNBASE) / PGSIZE] = {{0}};

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001a18:	1101                	addi	sp,sp,-32
    80001a1a:	ec06                	sd	ra,24(sp)
    80001a1c:	e822                	sd	s0,16(sp)
    80001a1e:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001a20:	fffff097          	auipc	ra,0xfffff
    80001a24:	7b6080e7          	jalr	1974(ra) # 800011d6 <kalloc>
    80001a28:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001a2c:	6605                	lui	a2,0x1
    80001a2e:	4581                	li	a1,0
    80001a30:	fe843503          	ld	a0,-24(s0)
    80001a34:	00000097          	auipc	ra,0x0
    80001a38:	aca080e7          	jalr	-1334(ra) # 800014fe <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001a3c:	4719                	li	a4,6
    80001a3e:	6685                	lui	a3,0x1
    80001a40:	10000637          	lui	a2,0x10000
    80001a44:	100005b7          	lui	a1,0x10000
    80001a48:	fe843503          	ld	a0,-24(s0)
    80001a4c:	00000097          	auipc	ra,0x0
    80001a50:	32e080e7          	jalr	814(ra) # 80001d7a <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001a54:	4719                	li	a4,6
    80001a56:	6685                	lui	a3,0x1
    80001a58:	10001637          	lui	a2,0x10001
    80001a5c:	100015b7          	lui	a1,0x10001
    80001a60:	fe843503          	ld	a0,-24(s0)
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	316080e7          	jalr	790(ra) # 80001d7a <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001a6c:	4719                	li	a4,6
    80001a6e:	6685                	lui	a3,0x1
    80001a70:	10002637          	lui	a2,0x10002
    80001a74:	100025b7          	lui	a1,0x10002
    80001a78:	fe843503          	ld	a0,-24(s0)
    80001a7c:	00000097          	auipc	ra,0x0
    80001a80:	2fe080e7          	jalr	766(ra) # 80001d7a <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001a84:	4719                	li	a4,6
    80001a86:	004006b7          	lui	a3,0x400
    80001a8a:	0c000637          	lui	a2,0xc000
    80001a8e:	0c0005b7          	lui	a1,0xc000
    80001a92:	fe843503          	ld	a0,-24(s0)
    80001a96:	00000097          	auipc	ra,0x0
    80001a9a:	2e4080e7          	jalr	740(ra) # 80001d7a <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001a9e:	00009717          	auipc	a4,0x9
    80001aa2:	56270713          	addi	a4,a4,1378 # 8000b000 <etext>
    80001aa6:	800007b7          	lui	a5,0x80000
    80001aaa:	97ba                	add	a5,a5,a4
    80001aac:	4729                	li	a4,10
    80001aae:	86be                	mv	a3,a5
    80001ab0:	4785                	li	a5,1
    80001ab2:	01f79613          	slli	a2,a5,0x1f
    80001ab6:	4785                	li	a5,1
    80001ab8:	01f79593          	slli	a1,a5,0x1f
    80001abc:	fe843503          	ld	a0,-24(s0)
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	2ba080e7          	jalr	698(ra) # 80001d7a <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001ac8:	00009597          	auipc	a1,0x9
    80001acc:	53858593          	addi	a1,a1,1336 # 8000b000 <etext>
    80001ad0:	00009617          	auipc	a2,0x9
    80001ad4:	53060613          	addi	a2,a2,1328 # 8000b000 <etext>
    80001ad8:	00009797          	auipc	a5,0x9
    80001adc:	52878793          	addi	a5,a5,1320 # 8000b000 <etext>
    80001ae0:	08100713          	li	a4,129
    80001ae4:	0762                	slli	a4,a4,0x18
    80001ae6:	40f707b3          	sub	a5,a4,a5
    80001aea:	4719                	li	a4,6
    80001aec:	86be                	mv	a3,a5
    80001aee:	fe843503          	ld	a0,-24(s0)
    80001af2:	00000097          	auipc	ra,0x0
    80001af6:	288080e7          	jalr	648(ra) # 80001d7a <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001afa:	00008797          	auipc	a5,0x8
    80001afe:	50678793          	addi	a5,a5,1286 # 8000a000 <_trampoline>
    80001b02:	4729                	li	a4,10
    80001b04:	6685                	lui	a3,0x1
    80001b06:	863e                	mv	a2,a5
    80001b08:	040007b7          	lui	a5,0x4000
    80001b0c:	17fd                	addi	a5,a5,-1
    80001b0e:	00c79593          	slli	a1,a5,0xc
    80001b12:	fe843503          	ld	a0,-24(s0)
    80001b16:	00000097          	auipc	ra,0x0
    80001b1a:	264080e7          	jalr	612(ra) # 80001d7a <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001b1e:	fe843503          	ld	a0,-24(s0)
    80001b22:	00001097          	auipc	ra,0x1
    80001b26:	cb2080e7          	jalr	-846(ra) # 800027d4 <proc_mapstacks>
  
  return kpgtbl;
    80001b2a:	fe843783          	ld	a5,-24(s0)
}
    80001b2e:	853e                	mv	a0,a5
    80001b30:	60e2                	ld	ra,24(sp)
    80001b32:	6442                	ld	s0,16(sp)
    80001b34:	6105                	addi	sp,sp,32
    80001b36:	8082                	ret

0000000080001b38 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001b38:	1141                	addi	sp,sp,-16
    80001b3a:	e406                	sd	ra,8(sp)
    80001b3c:	e022                	sd	s0,0(sp)
    80001b3e:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001b40:	00000097          	auipc	ra,0x0
    80001b44:	ed8080e7          	jalr	-296(ra) # 80001a18 <kvmmake>
    80001b48:	872a                	mv	a4,a0
    80001b4a:	0000a797          	auipc	a5,0xa
    80001b4e:	dee78793          	addi	a5,a5,-530 # 8000b938 <kernel_pagetable>
    80001b52:	e398                	sd	a4,0(a5)
}
    80001b54:	0001                	nop
    80001b56:	60a2                	ld	ra,8(sp)
    80001b58:	6402                	ld	s0,0(sp)
    80001b5a:	0141                	addi	sp,sp,16
    80001b5c:	8082                	ret

0000000080001b5e <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001b5e:	1141                	addi	sp,sp,-16
    80001b60:	e406                	sd	ra,8(sp)
    80001b62:	e022                	sd	s0,0(sp)
    80001b64:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001b66:	00000097          	auipc	ra,0x0
    80001b6a:	ea0080e7          	jalr	-352(ra) # 80001a06 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001b6e:	0000a797          	auipc	a5,0xa
    80001b72:	dca78793          	addi	a5,a5,-566 # 8000b938 <kernel_pagetable>
    80001b76:	639c                	ld	a5,0(a5)
    80001b78:	00c7d713          	srli	a4,a5,0xc
    80001b7c:	57fd                	li	a5,-1
    80001b7e:	17fe                	slli	a5,a5,0x3f
    80001b80:	8fd9                	or	a5,a5,a4
    80001b82:	853e                	mv	a0,a5
    80001b84:	00000097          	auipc	ra,0x0
    80001b88:	e68080e7          	jalr	-408(ra) # 800019ec <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	e7a080e7          	jalr	-390(ra) # 80001a06 <sfence_vma>
}
    80001b94:	0001                	nop
    80001b96:	60a2                	ld	ra,8(sp)
    80001b98:	6402                	ld	s0,0(sp)
    80001b9a:	0141                	addi	sp,sp,16
    80001b9c:	8082                	ret

0000000080001b9e <reglrupage>:

static void
reglrupage(pte_t* pte)
{
    80001b9e:	1101                	addi	sp,sp,-32
    80001ba0:	ec22                	sd	s0,24(sp)
    80001ba2:	1000                	addi	s0,sp,32
    80001ba4:	fea43423          	sd	a0,-24(s0)
  lrupages[ ( ((uint64)pte) >> 12 ) - ( KERNBASE >> 12 ) ].refbits = (char)0;
    80001ba8:	fe843783          	ld	a5,-24(s0)
    80001bac:	00c7d713          	srli	a4,a5,0xc
    80001bb0:	fff807b7          	lui	a5,0xfff80
    80001bb4:	97ba                	add	a5,a5,a4
    80001bb6:	00012717          	auipc	a4,0x12
    80001bba:	00270713          	addi	a4,a4,2 # 80013bb8 <lrupages>
    80001bbe:	0792                	slli	a5,a5,0x4
    80001bc0:	97ba                	add	a5,a5,a4
    80001bc2:	00078023          	sb	zero,0(a5) # fffffffffff80000 <end+0xffffffff7ff4b0d0>
  lrupages[ ( ((uint64)pte) >> 12 ) - ( KERNBASE >> 12 ) ].pte = pte;
    80001bc6:	fe843783          	ld	a5,-24(s0)
    80001bca:	00c7d713          	srli	a4,a5,0xc
    80001bce:	fff807b7          	lui	a5,0xfff80
    80001bd2:	97ba                	add	a5,a5,a4
    80001bd4:	00012717          	auipc	a4,0x12
    80001bd8:	fe470713          	addi	a4,a4,-28 # 80013bb8 <lrupages>
    80001bdc:	0792                	slli	a5,a5,0x4
    80001bde:	97ba                	add	a5,a5,a4
    80001be0:	fe843703          	ld	a4,-24(s0)
    80001be4:	e798                	sd	a4,8(a5)
}
    80001be6:	0001                	nop
    80001be8:	6462                	ld	s0,24(sp)
    80001bea:	6105                	addi	sp,sp,32
    80001bec:	8082                	ret

0000000080001bee <unreglrupage>:

static void
unreglrupage(pte_t* pte)
{
    80001bee:	1101                	addi	sp,sp,-32
    80001bf0:	ec22                	sd	s0,24(sp)
    80001bf2:	1000                	addi	s0,sp,32
    80001bf4:	fea43423          	sd	a0,-24(s0)
  lrupages[ ( ((uint64)pte) >> 12 ) - ( KERNBASE >> 12 ) ].pte = 0;
    80001bf8:	fe843783          	ld	a5,-24(s0)
    80001bfc:	00c7d713          	srli	a4,a5,0xc
    80001c00:	fff807b7          	lui	a5,0xfff80
    80001c04:	97ba                	add	a5,a5,a4
    80001c06:	00012717          	auipc	a4,0x12
    80001c0a:	fb270713          	addi	a4,a4,-78 # 80013bb8 <lrupages>
    80001c0e:	0792                	slli	a5,a5,0x4
    80001c10:	97ba                	add	a5,a5,a4
    80001c12:	0007b423          	sd	zero,8(a5) # fffffffffff80008 <end+0xffffffff7ff4b0d8>
}
    80001c16:	0001                	nop
    80001c18:	6462                	ld	s0,24(sp)
    80001c1a:	6105                	addi	sp,sp,32
    80001c1c:	8082                	ret

0000000080001c1e <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001c1e:	7139                	addi	sp,sp,-64
    80001c20:	fc06                	sd	ra,56(sp)
    80001c22:	f822                	sd	s0,48(sp)
    80001c24:	0080                	addi	s0,sp,64
    80001c26:	fca43c23          	sd	a0,-40(s0)
    80001c2a:	fcb43823          	sd	a1,-48(s0)
    80001c2e:	87b2                	mv	a5,a2
    80001c30:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001c34:	fd043703          	ld	a4,-48(s0)
    80001c38:	57fd                	li	a5,-1
    80001c3a:	83e9                	srli	a5,a5,0x1a
    80001c3c:	00e7f463          	bgeu	a5,a4,80001c44 <walk+0x26>
    return 0;
    80001c40:	4781                	li	a5,0
    80001c42:	a85d                	j	80001cf8 <walk+0xda>

  for(int level = 2; level > 0; level--) {
    80001c44:	4789                	li	a5,2
    80001c46:	fef42623          	sw	a5,-20(s0)
    80001c4a:	a849                	j	80001cdc <walk+0xbe>
    pte_t *pte = &pagetable[PX(level, va)];
    80001c4c:	fec42703          	lw	a4,-20(s0)
    80001c50:	87ba                	mv	a5,a4
    80001c52:	0037979b          	slliw	a5,a5,0x3
    80001c56:	9fb9                	addw	a5,a5,a4
    80001c58:	2781                	sext.w	a5,a5
    80001c5a:	27b1                	addiw	a5,a5,12
    80001c5c:	2781                	sext.w	a5,a5
    80001c5e:	873e                	mv	a4,a5
    80001c60:	fd043783          	ld	a5,-48(s0)
    80001c64:	00e7d7b3          	srl	a5,a5,a4
    80001c68:	1ff7f793          	andi	a5,a5,511
    80001c6c:	078e                	slli	a5,a5,0x3
    80001c6e:	fd843703          	ld	a4,-40(s0)
    80001c72:	97ba                	add	a5,a5,a4
    80001c74:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001c78:	fe043783          	ld	a5,-32(s0)
    80001c7c:	639c                	ld	a5,0(a5)
    80001c7e:	8b85                	andi	a5,a5,1
    80001c80:	cb89                	beqz	a5,80001c92 <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001c82:	fe043783          	ld	a5,-32(s0)
    80001c86:	639c                	ld	a5,0(a5)
    80001c88:	83a9                	srli	a5,a5,0xa
    80001c8a:	07b2                	slli	a5,a5,0xc
    80001c8c:	fcf43c23          	sd	a5,-40(s0)
    80001c90:	a089                	j	80001cd2 <walk+0xb4>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001c92:	fcc42783          	lw	a5,-52(s0)
    80001c96:	2781                	sext.w	a5,a5
    80001c98:	cb91                	beqz	a5,80001cac <walk+0x8e>
    80001c9a:	fffff097          	auipc	ra,0xfffff
    80001c9e:	53c080e7          	jalr	1340(ra) # 800011d6 <kalloc>
    80001ca2:	fca43c23          	sd	a0,-40(s0)
    80001ca6:	fd843783          	ld	a5,-40(s0)
    80001caa:	e399                	bnez	a5,80001cb0 <walk+0x92>
        return 0;
    80001cac:	4781                	li	a5,0
    80001cae:	a0a9                	j	80001cf8 <walk+0xda>
      memset(pagetable, 0, PGSIZE);
    80001cb0:	6605                	lui	a2,0x1
    80001cb2:	4581                	li	a1,0
    80001cb4:	fd843503          	ld	a0,-40(s0)
    80001cb8:	00000097          	auipc	ra,0x0
    80001cbc:	846080e7          	jalr	-1978(ra) # 800014fe <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001cc0:	fd843783          	ld	a5,-40(s0)
    80001cc4:	83b1                	srli	a5,a5,0xc
    80001cc6:	07aa                	slli	a5,a5,0xa
    80001cc8:	0017e713          	ori	a4,a5,1
    80001ccc:	fe043783          	ld	a5,-32(s0)
    80001cd0:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001cd2:	fec42783          	lw	a5,-20(s0)
    80001cd6:	37fd                	addiw	a5,a5,-1
    80001cd8:	fef42623          	sw	a5,-20(s0)
    80001cdc:	fec42783          	lw	a5,-20(s0)
    80001ce0:	2781                	sext.w	a5,a5
    80001ce2:	f6f045e3          	bgtz	a5,80001c4c <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    80001ce6:	fd043783          	ld	a5,-48(s0)
    80001cea:	83b1                	srli	a5,a5,0xc
    80001cec:	1ff7f793          	andi	a5,a5,511
    80001cf0:	078e                	slli	a5,a5,0x3
    80001cf2:	fd843703          	ld	a4,-40(s0)
    80001cf6:	97ba                	add	a5,a5,a4
}
    80001cf8:	853e                	mv	a0,a5
    80001cfa:	70e2                	ld	ra,56(sp)
    80001cfc:	7442                	ld	s0,48(sp)
    80001cfe:	6121                	addi	sp,sp,64
    80001d00:	8082                	ret

0000000080001d02 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001d02:	7179                	addi	sp,sp,-48
    80001d04:	f406                	sd	ra,40(sp)
    80001d06:	f022                	sd	s0,32(sp)
    80001d08:	1800                	addi	s0,sp,48
    80001d0a:	fca43c23          	sd	a0,-40(s0)
    80001d0e:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001d12:	fd043703          	ld	a4,-48(s0)
    80001d16:	57fd                	li	a5,-1
    80001d18:	83e9                	srli	a5,a5,0x1a
    80001d1a:	00e7f463          	bgeu	a5,a4,80001d22 <walkaddr+0x20>
    return 0;
    80001d1e:	4781                	li	a5,0
    80001d20:	a881                	j	80001d70 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001d22:	4601                	li	a2,0
    80001d24:	fd043583          	ld	a1,-48(s0)
    80001d28:	fd843503          	ld	a0,-40(s0)
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	ef2080e7          	jalr	-270(ra) # 80001c1e <walk>
    80001d34:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001d38:	fe843783          	ld	a5,-24(s0)
    80001d3c:	e399                	bnez	a5,80001d42 <walkaddr+0x40>
    return 0;
    80001d3e:	4781                	li	a5,0
    80001d40:	a805                	j	80001d70 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001d42:	fe843783          	ld	a5,-24(s0)
    80001d46:	639c                	ld	a5,0(a5)
    80001d48:	8b85                	andi	a5,a5,1
    80001d4a:	e399                	bnez	a5,80001d50 <walkaddr+0x4e>
    return 0;
    80001d4c:	4781                	li	a5,0
    80001d4e:	a00d                	j	80001d70 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001d50:	fe843783          	ld	a5,-24(s0)
    80001d54:	639c                	ld	a5,0(a5)
    80001d56:	8bc1                	andi	a5,a5,16
    80001d58:	e399                	bnez	a5,80001d5e <walkaddr+0x5c>
    return 0;
    80001d5a:	4781                	li	a5,0
    80001d5c:	a811                	j	80001d70 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001d5e:	fe843783          	ld	a5,-24(s0)
    80001d62:	639c                	ld	a5,0(a5)
    80001d64:	83a9                	srli	a5,a5,0xa
    80001d66:	07b2                	slli	a5,a5,0xc
    80001d68:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001d6c:	fe043783          	ld	a5,-32(s0)
}
    80001d70:	853e                	mv	a0,a5
    80001d72:	70a2                	ld	ra,40(sp)
    80001d74:	7402                	ld	s0,32(sp)
    80001d76:	6145                	addi	sp,sp,48
    80001d78:	8082                	ret

0000000080001d7a <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001d7a:	7139                	addi	sp,sp,-64
    80001d7c:	fc06                	sd	ra,56(sp)
    80001d7e:	f822                	sd	s0,48(sp)
    80001d80:	0080                	addi	s0,sp,64
    80001d82:	fea43423          	sd	a0,-24(s0)
    80001d86:	feb43023          	sd	a1,-32(s0)
    80001d8a:	fcc43c23          	sd	a2,-40(s0)
    80001d8e:	fcd43823          	sd	a3,-48(s0)
    80001d92:	87ba                	mv	a5,a4
    80001d94:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001d98:	fcc42783          	lw	a5,-52(s0)
    80001d9c:	873e                	mv	a4,a5
    80001d9e:	fd843683          	ld	a3,-40(s0)
    80001da2:	fd043603          	ld	a2,-48(s0)
    80001da6:	fe043583          	ld	a1,-32(s0)
    80001daa:	fe843503          	ld	a0,-24(s0)
    80001dae:	00000097          	auipc	ra,0x0
    80001db2:	026080e7          	jalr	38(ra) # 80001dd4 <mappages>
    80001db6:	87aa                	mv	a5,a0
    80001db8:	cb89                	beqz	a5,80001dca <kvmmap+0x50>
    panic("kvmmap");
    80001dba:	00009517          	auipc	a0,0x9
    80001dbe:	31e50513          	addi	a0,a0,798 # 8000b0d8 <etext+0xd8>
    80001dc2:	fffff097          	auipc	ra,0xfffff
    80001dc6:	eca080e7          	jalr	-310(ra) # 80000c8c <panic>
}
    80001dca:	0001                	nop
    80001dcc:	70e2                	ld	ra,56(sp)
    80001dce:	7442                	ld	s0,48(sp)
    80001dd0:	6121                	addi	sp,sp,64
    80001dd2:	8082                	ret

0000000080001dd4 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001dd4:	711d                	addi	sp,sp,-96
    80001dd6:	ec86                	sd	ra,88(sp)
    80001dd8:	e8a2                	sd	s0,80(sp)
    80001dda:	1080                	addi	s0,sp,96
    80001ddc:	fca43423          	sd	a0,-56(s0)
    80001de0:	fcb43023          	sd	a1,-64(s0)
    80001de4:	fac43c23          	sd	a2,-72(s0)
    80001de8:	fad43823          	sd	a3,-80(s0)
    80001dec:	87ba                	mv	a5,a4
    80001dee:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001df2:	fb843783          	ld	a5,-72(s0)
    80001df6:	eb89                	bnez	a5,80001e08 <mappages+0x34>
    panic("mappages: size");
    80001df8:	00009517          	auipc	a0,0x9
    80001dfc:	2e850513          	addi	a0,a0,744 # 8000b0e0 <etext+0xe0>
    80001e00:	fffff097          	auipc	ra,0xfffff
    80001e04:	e8c080e7          	jalr	-372(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    80001e08:	fc043703          	ld	a4,-64(s0)
    80001e0c:	77fd                	lui	a5,0xfffff
    80001e0e:	8ff9                	and	a5,a5,a4
    80001e10:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001e14:	fc043703          	ld	a4,-64(s0)
    80001e18:	fb843783          	ld	a5,-72(s0)
    80001e1c:	97ba                	add	a5,a5,a4
    80001e1e:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffca0cf>
    80001e22:	77fd                	lui	a5,0xfffff
    80001e24:	8ff9                	and	a5,a5,a4
    80001e26:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001e2a:	4605                	li	a2,1
    80001e2c:	fe843583          	ld	a1,-24(s0)
    80001e30:	fc843503          	ld	a0,-56(s0)
    80001e34:	00000097          	auipc	ra,0x0
    80001e38:	dea080e7          	jalr	-534(ra) # 80001c1e <walk>
    80001e3c:	fca43c23          	sd	a0,-40(s0)
    80001e40:	fd843783          	ld	a5,-40(s0)
    80001e44:	e399                	bnez	a5,80001e4a <mappages+0x76>
      return -1;
    80001e46:	57fd                	li	a5,-1
    80001e48:	a0b5                	j	80001eb4 <mappages+0xe0>
    if(*pte & PTE_V)
    80001e4a:	fd843783          	ld	a5,-40(s0)
    80001e4e:	639c                	ld	a5,0(a5)
    80001e50:	8b85                	andi	a5,a5,1
    80001e52:	cb89                	beqz	a5,80001e64 <mappages+0x90>
      panic("mappages: remap");
    80001e54:	00009517          	auipc	a0,0x9
    80001e58:	29c50513          	addi	a0,a0,668 # 8000b0f0 <etext+0xf0>
    80001e5c:	fffff097          	auipc	ra,0xfffff
    80001e60:	e30080e7          	jalr	-464(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001e64:	fb043783          	ld	a5,-80(s0)
    80001e68:	83b1                	srli	a5,a5,0xc
    80001e6a:	00a79713          	slli	a4,a5,0xa
    80001e6e:	fac42783          	lw	a5,-84(s0)
    80001e72:	8fd9                	or	a5,a5,a4
    80001e74:	0017e713          	ori	a4,a5,1
    80001e78:	fd843783          	ld	a5,-40(s0)
    80001e7c:	e398                	sd	a4,0(a5)
    reglrupage(pte);
    80001e7e:	fd843503          	ld	a0,-40(s0)
    80001e82:	00000097          	auipc	ra,0x0
    80001e86:	d1c080e7          	jalr	-740(ra) # 80001b9e <reglrupage>
    if(a == last)
    80001e8a:	fe843703          	ld	a4,-24(s0)
    80001e8e:	fe043783          	ld	a5,-32(s0)
    80001e92:	00f70f63          	beq	a4,a5,80001eb0 <mappages+0xdc>
      break;
    a += PGSIZE;
    80001e96:	fe843703          	ld	a4,-24(s0)
    80001e9a:	6785                	lui	a5,0x1
    80001e9c:	97ba                	add	a5,a5,a4
    80001e9e:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001ea2:	fb043703          	ld	a4,-80(s0)
    80001ea6:	6785                	lui	a5,0x1
    80001ea8:	97ba                	add	a5,a5,a4
    80001eaa:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001eae:	bfb5                	j	80001e2a <mappages+0x56>
      break;
    80001eb0:	0001                	nop
  }
  return 0;
    80001eb2:	4781                	li	a5,0
}
    80001eb4:	853e                	mv	a0,a5
    80001eb6:	60e6                	ld	ra,88(sp)
    80001eb8:	6446                	ld	s0,80(sp)
    80001eba:	6125                	addi	sp,sp,96
    80001ebc:	8082                	ret

0000000080001ebe <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001ebe:	715d                	addi	sp,sp,-80
    80001ec0:	e486                	sd	ra,72(sp)
    80001ec2:	e0a2                	sd	s0,64(sp)
    80001ec4:	0880                	addi	s0,sp,80
    80001ec6:	fca43423          	sd	a0,-56(s0)
    80001eca:	fcb43023          	sd	a1,-64(s0)
    80001ece:	fac43c23          	sd	a2,-72(s0)
    80001ed2:	87b6                	mv	a5,a3
    80001ed4:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001ed8:	fc043703          	ld	a4,-64(s0)
    80001edc:	6785                	lui	a5,0x1
    80001ede:	17fd                	addi	a5,a5,-1
    80001ee0:	8ff9                	and	a5,a5,a4
    80001ee2:	cb89                	beqz	a5,80001ef4 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001ee4:	00009517          	auipc	a0,0x9
    80001ee8:	21c50513          	addi	a0,a0,540 # 8000b100 <etext+0x100>
    80001eec:	fffff097          	auipc	ra,0xfffff
    80001ef0:	da0080e7          	jalr	-608(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001ef4:	fc043783          	ld	a5,-64(s0)
    80001ef8:	fef43423          	sd	a5,-24(s0)
    80001efc:	a075                	j	80001fa8 <uvmunmap+0xea>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001efe:	4601                	li	a2,0
    80001f00:	fe843583          	ld	a1,-24(s0)
    80001f04:	fc843503          	ld	a0,-56(s0)
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	d16080e7          	jalr	-746(ra) # 80001c1e <walk>
    80001f10:	fea43023          	sd	a0,-32(s0)
    80001f14:	fe043783          	ld	a5,-32(s0)
    80001f18:	eb89                	bnez	a5,80001f2a <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001f1a:	00009517          	auipc	a0,0x9
    80001f1e:	1fe50513          	addi	a0,a0,510 # 8000b118 <etext+0x118>
    80001f22:	fffff097          	auipc	ra,0xfffff
    80001f26:	d6a080e7          	jalr	-662(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80001f2a:	fe043783          	ld	a5,-32(s0)
    80001f2e:	639c                	ld	a5,0(a5)
    80001f30:	8b85                	andi	a5,a5,1
    80001f32:	eb89                	bnez	a5,80001f44 <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80001f34:	00009517          	auipc	a0,0x9
    80001f38:	1f450513          	addi	a0,a0,500 # 8000b128 <etext+0x128>
    80001f3c:	fffff097          	auipc	ra,0xfffff
    80001f40:	d50080e7          	jalr	-688(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001f44:	fe043783          	ld	a5,-32(s0)
    80001f48:	639c                	ld	a5,0(a5)
    80001f4a:	3ff7f713          	andi	a4,a5,1023
    80001f4e:	4785                	li	a5,1
    80001f50:	00f71a63          	bne	a4,a5,80001f64 <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80001f54:	00009517          	auipc	a0,0x9
    80001f58:	1ec50513          	addi	a0,a0,492 # 8000b140 <etext+0x140>
    80001f5c:	fffff097          	auipc	ra,0xfffff
    80001f60:	d30080e7          	jalr	-720(ra) # 80000c8c <panic>
    if(do_free){
    80001f64:	fb442783          	lw	a5,-76(s0)
    80001f68:	2781                	sext.w	a5,a5
    80001f6a:	c78d                	beqz	a5,80001f94 <uvmunmap+0xd6>
      unreglrupage(pte);
    80001f6c:	fe043503          	ld	a0,-32(s0)
    80001f70:	00000097          	auipc	ra,0x0
    80001f74:	c7e080e7          	jalr	-898(ra) # 80001bee <unreglrupage>
      uint64 pa = PTE2PA(*pte);
    80001f78:	fe043783          	ld	a5,-32(s0)
    80001f7c:	639c                	ld	a5,0(a5)
    80001f7e:	83a9                	srli	a5,a5,0xa
    80001f80:	07b2                	slli	a5,a5,0xc
    80001f82:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80001f86:	fd843783          	ld	a5,-40(s0)
    80001f8a:	853e                	mv	a0,a5
    80001f8c:	fffff097          	auipc	ra,0xfffff
    80001f90:	1a4080e7          	jalr	420(ra) # 80001130 <kfree>
    }
    *pte = 0;
    80001f94:	fe043783          	ld	a5,-32(s0)
    80001f98:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001f9c:	fe843703          	ld	a4,-24(s0)
    80001fa0:	6785                	lui	a5,0x1
    80001fa2:	97ba                	add	a5,a5,a4
    80001fa4:	fef43423          	sd	a5,-24(s0)
    80001fa8:	fb843783          	ld	a5,-72(s0)
    80001fac:	00c79713          	slli	a4,a5,0xc
    80001fb0:	fc043783          	ld	a5,-64(s0)
    80001fb4:	97ba                	add	a5,a5,a4
    80001fb6:	fe843703          	ld	a4,-24(s0)
    80001fba:	f4f762e3          	bltu	a4,a5,80001efe <uvmunmap+0x40>
  }
}
    80001fbe:	0001                	nop
    80001fc0:	0001                	nop
    80001fc2:	60a6                	ld	ra,72(sp)
    80001fc4:	6406                	ld	s0,64(sp)
    80001fc6:	6161                	addi	sp,sp,80
    80001fc8:	8082                	ret

0000000080001fca <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80001fca:	1101                	addi	sp,sp,-32
    80001fcc:	ec06                	sd	ra,24(sp)
    80001fce:	e822                	sd	s0,16(sp)
    80001fd0:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80001fd2:	fffff097          	auipc	ra,0xfffff
    80001fd6:	204080e7          	jalr	516(ra) # 800011d6 <kalloc>
    80001fda:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80001fde:	fe843783          	ld	a5,-24(s0)
    80001fe2:	e399                	bnez	a5,80001fe8 <uvmcreate+0x1e>
    return 0;
    80001fe4:	4781                	li	a5,0
    80001fe6:	a819                	j	80001ffc <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80001fe8:	6605                	lui	a2,0x1
    80001fea:	4581                	li	a1,0
    80001fec:	fe843503          	ld	a0,-24(s0)
    80001ff0:	fffff097          	auipc	ra,0xfffff
    80001ff4:	50e080e7          	jalr	1294(ra) # 800014fe <memset>
  return pagetable;
    80001ff8:	fe843783          	ld	a5,-24(s0)
}
    80001ffc:	853e                	mv	a0,a5
    80001ffe:	60e2                	ld	ra,24(sp)
    80002000:	6442                	ld	s0,16(sp)
    80002002:	6105                	addi	sp,sp,32
    80002004:	8082                	ret

0000000080002006 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    80002006:	7139                	addi	sp,sp,-64
    80002008:	fc06                	sd	ra,56(sp)
    8000200a:	f822                	sd	s0,48(sp)
    8000200c:	0080                	addi	s0,sp,64
    8000200e:	fca43c23          	sd	a0,-40(s0)
    80002012:	fcb43823          	sd	a1,-48(s0)
    80002016:	87b2                	mv	a5,a2
    80002018:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    8000201c:	fcc42783          	lw	a5,-52(s0)
    80002020:	0007871b          	sext.w	a4,a5
    80002024:	6785                	lui	a5,0x1
    80002026:	00f76a63          	bltu	a4,a5,8000203a <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    8000202a:	00009517          	auipc	a0,0x9
    8000202e:	12e50513          	addi	a0,a0,302 # 8000b158 <etext+0x158>
    80002032:	fffff097          	auipc	ra,0xfffff
    80002036:	c5a080e7          	jalr	-934(ra) # 80000c8c <panic>
  mem = kalloc();
    8000203a:	fffff097          	auipc	ra,0xfffff
    8000203e:	19c080e7          	jalr	412(ra) # 800011d6 <kalloc>
    80002042:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80002046:	6605                	lui	a2,0x1
    80002048:	4581                	li	a1,0
    8000204a:	fe843503          	ld	a0,-24(s0)
    8000204e:	fffff097          	auipc	ra,0xfffff
    80002052:	4b0080e7          	jalr	1200(ra) # 800014fe <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80002056:	fe843783          	ld	a5,-24(s0)
    8000205a:	4779                	li	a4,30
    8000205c:	86be                	mv	a3,a5
    8000205e:	6605                	lui	a2,0x1
    80002060:	4581                	li	a1,0
    80002062:	fd843503          	ld	a0,-40(s0)
    80002066:	00000097          	auipc	ra,0x0
    8000206a:	d6e080e7          	jalr	-658(ra) # 80001dd4 <mappages>
  memmove(mem, src, sz);
    8000206e:	fcc42783          	lw	a5,-52(s0)
    80002072:	863e                	mv	a2,a5
    80002074:	fd043583          	ld	a1,-48(s0)
    80002078:	fe843503          	ld	a0,-24(s0)
    8000207c:	fffff097          	auipc	ra,0xfffff
    80002080:	566080e7          	jalr	1382(ra) # 800015e2 <memmove>
}
    80002084:	0001                	nop
    80002086:	70e2                	ld	ra,56(sp)
    80002088:	7442                	ld	s0,48(sp)
    8000208a:	6121                	addi	sp,sp,64
    8000208c:	8082                	ret

000000008000208e <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    8000208e:	7139                	addi	sp,sp,-64
    80002090:	fc06                	sd	ra,56(sp)
    80002092:	f822                	sd	s0,48(sp)
    80002094:	0080                	addi	s0,sp,64
    80002096:	fca43c23          	sd	a0,-40(s0)
    8000209a:	fcb43823          	sd	a1,-48(s0)
    8000209e:	fcc43423          	sd	a2,-56(s0)
    800020a2:	87b6                	mv	a5,a3
    800020a4:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    800020a8:	fc843703          	ld	a4,-56(s0)
    800020ac:	fd043783          	ld	a5,-48(s0)
    800020b0:	00f77563          	bgeu	a4,a5,800020ba <uvmalloc+0x2c>
    return oldsz;
    800020b4:	fd043783          	ld	a5,-48(s0)
    800020b8:	a87d                	j	80002176 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    800020ba:	fd043703          	ld	a4,-48(s0)
    800020be:	6785                	lui	a5,0x1
    800020c0:	17fd                	addi	a5,a5,-1
    800020c2:	973e                	add	a4,a4,a5
    800020c4:	77fd                	lui	a5,0xfffff
    800020c6:	8ff9                	and	a5,a5,a4
    800020c8:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    800020cc:	fd043783          	ld	a5,-48(s0)
    800020d0:	fef43423          	sd	a5,-24(s0)
    800020d4:	a849                	j	80002166 <uvmalloc+0xd8>
    mem = kalloc();
    800020d6:	fffff097          	auipc	ra,0xfffff
    800020da:	100080e7          	jalr	256(ra) # 800011d6 <kalloc>
    800020de:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    800020e2:	fe043783          	ld	a5,-32(s0)
    800020e6:	ef89                	bnez	a5,80002100 <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    800020e8:	fd043603          	ld	a2,-48(s0)
    800020ec:	fe843583          	ld	a1,-24(s0)
    800020f0:	fd843503          	ld	a0,-40(s0)
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	08c080e7          	jalr	140(ra) # 80002180 <uvmdealloc>
      return 0;
    800020fc:	4781                	li	a5,0
    800020fe:	a8a5                	j	80002176 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    80002100:	6605                	lui	a2,0x1
    80002102:	4581                	li	a1,0
    80002104:	fe043503          	ld	a0,-32(s0)
    80002108:	fffff097          	auipc	ra,0xfffff
    8000210c:	3f6080e7          	jalr	1014(ra) # 800014fe <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    80002110:	fe043683          	ld	a3,-32(s0)
    80002114:	fc442783          	lw	a5,-60(s0)
    80002118:	0127e793          	ori	a5,a5,18
    8000211c:	2781                	sext.w	a5,a5
    8000211e:	873e                	mv	a4,a5
    80002120:	6605                	lui	a2,0x1
    80002122:	fe843583          	ld	a1,-24(s0)
    80002126:	fd843503          	ld	a0,-40(s0)
    8000212a:	00000097          	auipc	ra,0x0
    8000212e:	caa080e7          	jalr	-854(ra) # 80001dd4 <mappages>
    80002132:	87aa                	mv	a5,a0
    80002134:	c39d                	beqz	a5,8000215a <uvmalloc+0xcc>
      kfree(mem);
    80002136:	fe043503          	ld	a0,-32(s0)
    8000213a:	fffff097          	auipc	ra,0xfffff
    8000213e:	ff6080e7          	jalr	-10(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80002142:	fd043603          	ld	a2,-48(s0)
    80002146:	fe843583          	ld	a1,-24(s0)
    8000214a:	fd843503          	ld	a0,-40(s0)
    8000214e:	00000097          	auipc	ra,0x0
    80002152:	032080e7          	jalr	50(ra) # 80002180 <uvmdealloc>
      return 0;
    80002156:	4781                	li	a5,0
    80002158:	a839                	j	80002176 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    8000215a:	fe843703          	ld	a4,-24(s0)
    8000215e:	6785                	lui	a5,0x1
    80002160:	97ba                	add	a5,a5,a4
    80002162:	fef43423          	sd	a5,-24(s0)
    80002166:	fe843703          	ld	a4,-24(s0)
    8000216a:	fc843783          	ld	a5,-56(s0)
    8000216e:	f6f764e3          	bltu	a4,a5,800020d6 <uvmalloc+0x48>
    }
  }
  return newsz;
    80002172:	fc843783          	ld	a5,-56(s0)
}
    80002176:	853e                	mv	a0,a5
    80002178:	70e2                	ld	ra,56(sp)
    8000217a:	7442                	ld	s0,48(sp)
    8000217c:	6121                	addi	sp,sp,64
    8000217e:	8082                	ret

0000000080002180 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80002180:	7139                	addi	sp,sp,-64
    80002182:	fc06                	sd	ra,56(sp)
    80002184:	f822                	sd	s0,48(sp)
    80002186:	0080                	addi	s0,sp,64
    80002188:	fca43c23          	sd	a0,-40(s0)
    8000218c:	fcb43823          	sd	a1,-48(s0)
    80002190:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002194:	fc843703          	ld	a4,-56(s0)
    80002198:	fd043783          	ld	a5,-48(s0)
    8000219c:	00f76563          	bltu	a4,a5,800021a6 <uvmdealloc+0x26>
    return oldsz;
    800021a0:	fd043783          	ld	a5,-48(s0)
    800021a4:	a885                	j	80002214 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800021a6:	fc843703          	ld	a4,-56(s0)
    800021aa:	6785                	lui	a5,0x1
    800021ac:	17fd                	addi	a5,a5,-1
    800021ae:	973e                	add	a4,a4,a5
    800021b0:	77fd                	lui	a5,0xfffff
    800021b2:	8f7d                	and	a4,a4,a5
    800021b4:	fd043683          	ld	a3,-48(s0)
    800021b8:	6785                	lui	a5,0x1
    800021ba:	17fd                	addi	a5,a5,-1
    800021bc:	96be                	add	a3,a3,a5
    800021be:	77fd                	lui	a5,0xfffff
    800021c0:	8ff5                	and	a5,a5,a3
    800021c2:	04f77763          	bgeu	a4,a5,80002210 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    800021c6:	fd043703          	ld	a4,-48(s0)
    800021ca:	6785                	lui	a5,0x1
    800021cc:	17fd                	addi	a5,a5,-1
    800021ce:	973e                	add	a4,a4,a5
    800021d0:	77fd                	lui	a5,0xfffff
    800021d2:	8f7d                	and	a4,a4,a5
    800021d4:	fc843683          	ld	a3,-56(s0)
    800021d8:	6785                	lui	a5,0x1
    800021da:	17fd                	addi	a5,a5,-1
    800021dc:	96be                	add	a3,a3,a5
    800021de:	77fd                	lui	a5,0xfffff
    800021e0:	8ff5                	and	a5,a5,a3
    800021e2:	40f707b3          	sub	a5,a4,a5
    800021e6:	83b1                	srli	a5,a5,0xc
    800021e8:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    800021ec:	fc843703          	ld	a4,-56(s0)
    800021f0:	6785                	lui	a5,0x1
    800021f2:	17fd                	addi	a5,a5,-1
    800021f4:	973e                	add	a4,a4,a5
    800021f6:	77fd                	lui	a5,0xfffff
    800021f8:	8ff9                	and	a5,a5,a4
    800021fa:	fec42703          	lw	a4,-20(s0)
    800021fe:	4685                	li	a3,1
    80002200:	863a                	mv	a2,a4
    80002202:	85be                	mv	a1,a5
    80002204:	fd843503          	ld	a0,-40(s0)
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	cb6080e7          	jalr	-842(ra) # 80001ebe <uvmunmap>
  }

  return newsz;
    80002210:	fc843783          	ld	a5,-56(s0)
}
    80002214:	853e                	mv	a0,a5
    80002216:	70e2                	ld	ra,56(sp)
    80002218:	7442                	ld	s0,48(sp)
    8000221a:	6121                	addi	sp,sp,64
    8000221c:	8082                	ret

000000008000221e <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000221e:	7139                	addi	sp,sp,-64
    80002220:	fc06                	sd	ra,56(sp)
    80002222:	f822                	sd	s0,48(sp)
    80002224:	0080                	addi	s0,sp,64
    80002226:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    8000222a:	fe042623          	sw	zero,-20(s0)
    8000222e:	a88d                	j	800022a0 <freewalk+0x82>
    pte_t pte = pagetable[i];
    80002230:	fec42783          	lw	a5,-20(s0)
    80002234:	078e                	slli	a5,a5,0x3
    80002236:	fc843703          	ld	a4,-56(s0)
    8000223a:	97ba                	add	a5,a5,a4
    8000223c:	639c                	ld	a5,0(a5)
    8000223e:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002242:	fe043783          	ld	a5,-32(s0)
    80002246:	8b85                	andi	a5,a5,1
    80002248:	cb9d                	beqz	a5,8000227e <freewalk+0x60>
    8000224a:	fe043783          	ld	a5,-32(s0)
    8000224e:	8bb9                	andi	a5,a5,14
    80002250:	e79d                	bnez	a5,8000227e <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    80002252:	fe043783          	ld	a5,-32(s0)
    80002256:	83a9                	srli	a5,a5,0xa
    80002258:	07b2                	slli	a5,a5,0xc
    8000225a:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    8000225e:	fd843783          	ld	a5,-40(s0)
    80002262:	853e                	mv	a0,a5
    80002264:	00000097          	auipc	ra,0x0
    80002268:	fba080e7          	jalr	-70(ra) # 8000221e <freewalk>
      pagetable[i] = 0;
    8000226c:	fec42783          	lw	a5,-20(s0)
    80002270:	078e                	slli	a5,a5,0x3
    80002272:	fc843703          	ld	a4,-56(s0)
    80002276:	97ba                	add	a5,a5,a4
    80002278:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffca0d0>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000227c:	a829                	j	80002296 <freewalk+0x78>
    } else if(pte & PTE_V){
    8000227e:	fe043783          	ld	a5,-32(s0)
    80002282:	8b85                	andi	a5,a5,1
    80002284:	cb89                	beqz	a5,80002296 <freewalk+0x78>
      panic("freewalk: leaf");
    80002286:	00009517          	auipc	a0,0x9
    8000228a:	ef250513          	addi	a0,a0,-270 # 8000b178 <etext+0x178>
    8000228e:	fffff097          	auipc	ra,0xfffff
    80002292:	9fe080e7          	jalr	-1538(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    80002296:	fec42783          	lw	a5,-20(s0)
    8000229a:	2785                	addiw	a5,a5,1
    8000229c:	fef42623          	sw	a5,-20(s0)
    800022a0:	fec42783          	lw	a5,-20(s0)
    800022a4:	0007871b          	sext.w	a4,a5
    800022a8:	1ff00793          	li	a5,511
    800022ac:	f8e7d2e3          	bge	a5,a4,80002230 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    800022b0:	fc843503          	ld	a0,-56(s0)
    800022b4:	fffff097          	auipc	ra,0xfffff
    800022b8:	e7c080e7          	jalr	-388(ra) # 80001130 <kfree>
}
    800022bc:	0001                	nop
    800022be:	70e2                	ld	ra,56(sp)
    800022c0:	7442                	ld	s0,48(sp)
    800022c2:	6121                	addi	sp,sp,64
    800022c4:	8082                	ret

00000000800022c6 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    800022c6:	1101                	addi	sp,sp,-32
    800022c8:	ec06                	sd	ra,24(sp)
    800022ca:	e822                	sd	s0,16(sp)
    800022cc:	1000                	addi	s0,sp,32
    800022ce:	fea43423          	sd	a0,-24(s0)
    800022d2:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    800022d6:	fe043783          	ld	a5,-32(s0)
    800022da:	c385                	beqz	a5,800022fa <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    800022dc:	fe043703          	ld	a4,-32(s0)
    800022e0:	6785                	lui	a5,0x1
    800022e2:	17fd                	addi	a5,a5,-1
    800022e4:	97ba                	add	a5,a5,a4
    800022e6:	83b1                	srli	a5,a5,0xc
    800022e8:	4685                	li	a3,1
    800022ea:	863e                	mv	a2,a5
    800022ec:	4581                	li	a1,0
    800022ee:	fe843503          	ld	a0,-24(s0)
    800022f2:	00000097          	auipc	ra,0x0
    800022f6:	bcc080e7          	jalr	-1076(ra) # 80001ebe <uvmunmap>
  freewalk(pagetable);
    800022fa:	fe843503          	ld	a0,-24(s0)
    800022fe:	00000097          	auipc	ra,0x0
    80002302:	f20080e7          	jalr	-224(ra) # 8000221e <freewalk>
}
    80002306:	0001                	nop
    80002308:	60e2                	ld	ra,24(sp)
    8000230a:	6442                	ld	s0,16(sp)
    8000230c:	6105                	addi	sp,sp,32
    8000230e:	8082                	ret

0000000080002310 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    80002310:	711d                	addi	sp,sp,-96
    80002312:	ec86                	sd	ra,88(sp)
    80002314:	e8a2                	sd	s0,80(sp)
    80002316:	1080                	addi	s0,sp,96
    80002318:	faa43c23          	sd	a0,-72(s0)
    8000231c:	fab43823          	sd	a1,-80(s0)
    80002320:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002324:	fe043423          	sd	zero,-24(s0)
    80002328:	a0d9                	j	800023ee <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    8000232a:	4601                	li	a2,0
    8000232c:	fe843583          	ld	a1,-24(s0)
    80002330:	fb843503          	ld	a0,-72(s0)
    80002334:	00000097          	auipc	ra,0x0
    80002338:	8ea080e7          	jalr	-1814(ra) # 80001c1e <walk>
    8000233c:	fea43023          	sd	a0,-32(s0)
    80002340:	fe043783          	ld	a5,-32(s0)
    80002344:	eb89                	bnez	a5,80002356 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002346:	00009517          	auipc	a0,0x9
    8000234a:	e4250513          	addi	a0,a0,-446 # 8000b188 <etext+0x188>
    8000234e:	fffff097          	auipc	ra,0xfffff
    80002352:	93e080e7          	jalr	-1730(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80002356:	fe043783          	ld	a5,-32(s0)
    8000235a:	639c                	ld	a5,0(a5)
    8000235c:	8b85                	andi	a5,a5,1
    8000235e:	eb89                	bnez	a5,80002370 <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    80002360:	00009517          	auipc	a0,0x9
    80002364:	e4850513          	addi	a0,a0,-440 # 8000b1a8 <etext+0x1a8>
    80002368:	fffff097          	auipc	ra,0xfffff
    8000236c:	924080e7          	jalr	-1756(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    80002370:	fe043783          	ld	a5,-32(s0)
    80002374:	639c                	ld	a5,0(a5)
    80002376:	83a9                	srli	a5,a5,0xa
    80002378:	07b2                	slli	a5,a5,0xc
    8000237a:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    8000237e:	fe043783          	ld	a5,-32(s0)
    80002382:	639c                	ld	a5,0(a5)
    80002384:	2781                	sext.w	a5,a5
    80002386:	3ff7f793          	andi	a5,a5,1023
    8000238a:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    8000238e:	fffff097          	auipc	ra,0xfffff
    80002392:	e48080e7          	jalr	-440(ra) # 800011d6 <kalloc>
    80002396:	fca43423          	sd	a0,-56(s0)
    8000239a:	fc843783          	ld	a5,-56(s0)
    8000239e:	c3a5                	beqz	a5,800023fe <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800023a0:	fd843783          	ld	a5,-40(s0)
    800023a4:	6605                	lui	a2,0x1
    800023a6:	85be                	mv	a1,a5
    800023a8:	fc843503          	ld	a0,-56(s0)
    800023ac:	fffff097          	auipc	ra,0xfffff
    800023b0:	236080e7          	jalr	566(ra) # 800015e2 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    800023b4:	fc843783          	ld	a5,-56(s0)
    800023b8:	fd442703          	lw	a4,-44(s0)
    800023bc:	86be                	mv	a3,a5
    800023be:	6605                	lui	a2,0x1
    800023c0:	fe843583          	ld	a1,-24(s0)
    800023c4:	fb043503          	ld	a0,-80(s0)
    800023c8:	00000097          	auipc	ra,0x0
    800023cc:	a0c080e7          	jalr	-1524(ra) # 80001dd4 <mappages>
    800023d0:	87aa                	mv	a5,a0
    800023d2:	cb81                	beqz	a5,800023e2 <uvmcopy+0xd2>
      kfree(mem);
    800023d4:	fc843503          	ld	a0,-56(s0)
    800023d8:	fffff097          	auipc	ra,0xfffff
    800023dc:	d58080e7          	jalr	-680(ra) # 80001130 <kfree>
      goto err;
    800023e0:	a005                	j	80002400 <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    800023e2:	fe843703          	ld	a4,-24(s0)
    800023e6:	6785                	lui	a5,0x1
    800023e8:	97ba                	add	a5,a5,a4
    800023ea:	fef43423          	sd	a5,-24(s0)
    800023ee:	fe843703          	ld	a4,-24(s0)
    800023f2:	fa843783          	ld	a5,-88(s0)
    800023f6:	f2f76ae3          	bltu	a4,a5,8000232a <uvmcopy+0x1a>
    }
  }
  return 0;
    800023fa:	4781                	li	a5,0
    800023fc:	a839                	j	8000241a <uvmcopy+0x10a>
      goto err;
    800023fe:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    80002400:	fe843783          	ld	a5,-24(s0)
    80002404:	83b1                	srli	a5,a5,0xc
    80002406:	4685                	li	a3,1
    80002408:	863e                	mv	a2,a5
    8000240a:	4581                	li	a1,0
    8000240c:	fb043503          	ld	a0,-80(s0)
    80002410:	00000097          	auipc	ra,0x0
    80002414:	aae080e7          	jalr	-1362(ra) # 80001ebe <uvmunmap>
  return -1;
    80002418:	57fd                	li	a5,-1
}
    8000241a:	853e                	mv	a0,a5
    8000241c:	60e6                	ld	ra,88(sp)
    8000241e:	6446                	ld	s0,80(sp)
    80002420:	6125                	addi	sp,sp,96
    80002422:	8082                	ret

0000000080002424 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002424:	7179                	addi	sp,sp,-48
    80002426:	f406                	sd	ra,40(sp)
    80002428:	f022                	sd	s0,32(sp)
    8000242a:	1800                	addi	s0,sp,48
    8000242c:	fca43c23          	sd	a0,-40(s0)
    80002430:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    80002434:	4601                	li	a2,0
    80002436:	fd043583          	ld	a1,-48(s0)
    8000243a:	fd843503          	ld	a0,-40(s0)
    8000243e:	fffff097          	auipc	ra,0xfffff
    80002442:	7e0080e7          	jalr	2016(ra) # 80001c1e <walk>
    80002446:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    8000244a:	fe843783          	ld	a5,-24(s0)
    8000244e:	eb89                	bnez	a5,80002460 <uvmclear+0x3c>
    panic("uvmclear");
    80002450:	00009517          	auipc	a0,0x9
    80002454:	d7850513          	addi	a0,a0,-648 # 8000b1c8 <etext+0x1c8>
    80002458:	fffff097          	auipc	ra,0xfffff
    8000245c:	834080e7          	jalr	-1996(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    80002460:	fe843783          	ld	a5,-24(s0)
    80002464:	639c                	ld	a5,0(a5)
    80002466:	fef7f713          	andi	a4,a5,-17
    8000246a:	fe843783          	ld	a5,-24(s0)
    8000246e:	e398                	sd	a4,0(a5)
  unreglrupage(pte);
    80002470:	fe843503          	ld	a0,-24(s0)
    80002474:	fffff097          	auipc	ra,0xfffff
    80002478:	77a080e7          	jalr	1914(ra) # 80001bee <unreglrupage>
}
    8000247c:	0001                	nop
    8000247e:	70a2                	ld	ra,40(sp)
    80002480:	7402                	ld	s0,32(sp)
    80002482:	6145                	addi	sp,sp,48
    80002484:	8082                	ret

0000000080002486 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    80002486:	715d                	addi	sp,sp,-80
    80002488:	e486                	sd	ra,72(sp)
    8000248a:	e0a2                	sd	s0,64(sp)
    8000248c:	0880                	addi	s0,sp,80
    8000248e:	fca43423          	sd	a0,-56(s0)
    80002492:	fcb43023          	sd	a1,-64(s0)
    80002496:	fac43c23          	sd	a2,-72(s0)
    8000249a:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    8000249e:	a055                	j	80002542 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    800024a0:	fc043703          	ld	a4,-64(s0)
    800024a4:	77fd                	lui	a5,0xfffff
    800024a6:	8ff9                	and	a5,a5,a4
    800024a8:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800024ac:	fe043583          	ld	a1,-32(s0)
    800024b0:	fc843503          	ld	a0,-56(s0)
    800024b4:	00000097          	auipc	ra,0x0
    800024b8:	84e080e7          	jalr	-1970(ra) # 80001d02 <walkaddr>
    800024bc:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800024c0:	fd843783          	ld	a5,-40(s0)
    800024c4:	e399                	bnez	a5,800024ca <copyout+0x44>
      return -1;
    800024c6:	57fd                	li	a5,-1
    800024c8:	a049                	j	8000254a <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    800024ca:	fe043703          	ld	a4,-32(s0)
    800024ce:	fc043783          	ld	a5,-64(s0)
    800024d2:	8f1d                	sub	a4,a4,a5
    800024d4:	6785                	lui	a5,0x1
    800024d6:	97ba                	add	a5,a5,a4
    800024d8:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800024dc:	fe843703          	ld	a4,-24(s0)
    800024e0:	fb043783          	ld	a5,-80(s0)
    800024e4:	00e7f663          	bgeu	a5,a4,800024f0 <copyout+0x6a>
      n = len;
    800024e8:	fb043783          	ld	a5,-80(s0)
    800024ec:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    800024f0:	fc043703          	ld	a4,-64(s0)
    800024f4:	fe043783          	ld	a5,-32(s0)
    800024f8:	8f1d                	sub	a4,a4,a5
    800024fa:	fd843783          	ld	a5,-40(s0)
    800024fe:	97ba                	add	a5,a5,a4
    80002500:	873e                	mv	a4,a5
    80002502:	fe843783          	ld	a5,-24(s0)
    80002506:	2781                	sext.w	a5,a5
    80002508:	863e                	mv	a2,a5
    8000250a:	fb843583          	ld	a1,-72(s0)
    8000250e:	853a                	mv	a0,a4
    80002510:	fffff097          	auipc	ra,0xfffff
    80002514:	0d2080e7          	jalr	210(ra) # 800015e2 <memmove>

    len -= n;
    80002518:	fb043703          	ld	a4,-80(s0)
    8000251c:	fe843783          	ld	a5,-24(s0)
    80002520:	40f707b3          	sub	a5,a4,a5
    80002524:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002528:	fb843703          	ld	a4,-72(s0)
    8000252c:	fe843783          	ld	a5,-24(s0)
    80002530:	97ba                	add	a5,a5,a4
    80002532:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002536:	fe043703          	ld	a4,-32(s0)
    8000253a:	6785                	lui	a5,0x1
    8000253c:	97ba                	add	a5,a5,a4
    8000253e:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    80002542:	fb043783          	ld	a5,-80(s0)
    80002546:	ffa9                	bnez	a5,800024a0 <copyout+0x1a>
  }
  return 0;
    80002548:	4781                	li	a5,0
}
    8000254a:	853e                	mv	a0,a5
    8000254c:	60a6                	ld	ra,72(sp)
    8000254e:	6406                	ld	s0,64(sp)
    80002550:	6161                	addi	sp,sp,80
    80002552:	8082                	ret

0000000080002554 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    80002554:	715d                	addi	sp,sp,-80
    80002556:	e486                	sd	ra,72(sp)
    80002558:	e0a2                	sd	s0,64(sp)
    8000255a:	0880                	addi	s0,sp,80
    8000255c:	fca43423          	sd	a0,-56(s0)
    80002560:	fcb43023          	sd	a1,-64(s0)
    80002564:	fac43c23          	sd	a2,-72(s0)
    80002568:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    8000256c:	a055                	j	80002610 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    8000256e:	fb843703          	ld	a4,-72(s0)
    80002572:	77fd                	lui	a5,0xfffff
    80002574:	8ff9                	and	a5,a5,a4
    80002576:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000257a:	fe043583          	ld	a1,-32(s0)
    8000257e:	fc843503          	ld	a0,-56(s0)
    80002582:	fffff097          	auipc	ra,0xfffff
    80002586:	780080e7          	jalr	1920(ra) # 80001d02 <walkaddr>
    8000258a:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000258e:	fd843783          	ld	a5,-40(s0)
    80002592:	e399                	bnez	a5,80002598 <copyin+0x44>
      return -1;
    80002594:	57fd                	li	a5,-1
    80002596:	a049                	j	80002618 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    80002598:	fe043703          	ld	a4,-32(s0)
    8000259c:	fb843783          	ld	a5,-72(s0)
    800025a0:	8f1d                	sub	a4,a4,a5
    800025a2:	6785                	lui	a5,0x1
    800025a4:	97ba                	add	a5,a5,a4
    800025a6:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800025aa:	fe843703          	ld	a4,-24(s0)
    800025ae:	fb043783          	ld	a5,-80(s0)
    800025b2:	00e7f663          	bgeu	a5,a4,800025be <copyin+0x6a>
      n = len;
    800025b6:	fb043783          	ld	a5,-80(s0)
    800025ba:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    800025be:	fb843703          	ld	a4,-72(s0)
    800025c2:	fe043783          	ld	a5,-32(s0)
    800025c6:	8f1d                	sub	a4,a4,a5
    800025c8:	fd843783          	ld	a5,-40(s0)
    800025cc:	97ba                	add	a5,a5,a4
    800025ce:	873e                	mv	a4,a5
    800025d0:	fe843783          	ld	a5,-24(s0)
    800025d4:	2781                	sext.w	a5,a5
    800025d6:	863e                	mv	a2,a5
    800025d8:	85ba                	mv	a1,a4
    800025da:	fc043503          	ld	a0,-64(s0)
    800025de:	fffff097          	auipc	ra,0xfffff
    800025e2:	004080e7          	jalr	4(ra) # 800015e2 <memmove>

    len -= n;
    800025e6:	fb043703          	ld	a4,-80(s0)
    800025ea:	fe843783          	ld	a5,-24(s0)
    800025ee:	40f707b3          	sub	a5,a4,a5
    800025f2:	faf43823          	sd	a5,-80(s0)
    dst += n;
    800025f6:	fc043703          	ld	a4,-64(s0)
    800025fa:	fe843783          	ld	a5,-24(s0)
    800025fe:	97ba                	add	a5,a5,a4
    80002600:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002604:	fe043703          	ld	a4,-32(s0)
    80002608:	6785                	lui	a5,0x1
    8000260a:	97ba                	add	a5,a5,a4
    8000260c:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002610:	fb043783          	ld	a5,-80(s0)
    80002614:	ffa9                	bnez	a5,8000256e <copyin+0x1a>
  }
  return 0;
    80002616:	4781                	li	a5,0
}
    80002618:	853e                	mv	a0,a5
    8000261a:	60a6                	ld	ra,72(sp)
    8000261c:	6406                	ld	s0,64(sp)
    8000261e:	6161                	addi	sp,sp,80
    80002620:	8082                	ret

0000000080002622 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002622:	711d                	addi	sp,sp,-96
    80002624:	ec86                	sd	ra,88(sp)
    80002626:	e8a2                	sd	s0,80(sp)
    80002628:	1080                	addi	s0,sp,96
    8000262a:	faa43c23          	sd	a0,-72(s0)
    8000262e:	fab43823          	sd	a1,-80(s0)
    80002632:	fac43423          	sd	a2,-88(s0)
    80002636:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000263a:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000263e:	a0f1                	j	8000270a <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    80002640:	fa843703          	ld	a4,-88(s0)
    80002644:	77fd                	lui	a5,0xfffff
    80002646:	8ff9                	and	a5,a5,a4
    80002648:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    8000264c:	fd043583          	ld	a1,-48(s0)
    80002650:	fb843503          	ld	a0,-72(s0)
    80002654:	fffff097          	auipc	ra,0xfffff
    80002658:	6ae080e7          	jalr	1710(ra) # 80001d02 <walkaddr>
    8000265c:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    80002660:	fc843783          	ld	a5,-56(s0)
    80002664:	e399                	bnez	a5,8000266a <copyinstr+0x48>
      return -1;
    80002666:	57fd                	li	a5,-1
    80002668:	a87d                	j	80002726 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    8000266a:	fd043703          	ld	a4,-48(s0)
    8000266e:	fa843783          	ld	a5,-88(s0)
    80002672:	8f1d                	sub	a4,a4,a5
    80002674:	6785                	lui	a5,0x1
    80002676:	97ba                	add	a5,a5,a4
    80002678:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    8000267c:	fe843703          	ld	a4,-24(s0)
    80002680:	fa043783          	ld	a5,-96(s0)
    80002684:	00e7f663          	bgeu	a5,a4,80002690 <copyinstr+0x6e>
      n = max;
    80002688:	fa043783          	ld	a5,-96(s0)
    8000268c:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    80002690:	fa843703          	ld	a4,-88(s0)
    80002694:	fd043783          	ld	a5,-48(s0)
    80002698:	8f1d                	sub	a4,a4,a5
    8000269a:	fc843783          	ld	a5,-56(s0)
    8000269e:	97ba                	add	a5,a5,a4
    800026a0:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    800026a4:	a891                	j	800026f8 <copyinstr+0xd6>
      if(*p == '\0'){
    800026a6:	fd843783          	ld	a5,-40(s0)
    800026aa:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    800026ae:	eb89                	bnez	a5,800026c0 <copyinstr+0x9e>
        *dst = '\0';
    800026b0:	fb043783          	ld	a5,-80(s0)
    800026b4:	00078023          	sb	zero,0(a5)
        got_null = 1;
    800026b8:	4785                	li	a5,1
    800026ba:	fef42223          	sw	a5,-28(s0)
        break;
    800026be:	a081                	j	800026fe <copyinstr+0xdc>
      } else {
        *dst = *p;
    800026c0:	fd843783          	ld	a5,-40(s0)
    800026c4:	0007c703          	lbu	a4,0(a5)
    800026c8:	fb043783          	ld	a5,-80(s0)
    800026cc:	00e78023          	sb	a4,0(a5)
      }
      --n;
    800026d0:	fe843783          	ld	a5,-24(s0)
    800026d4:	17fd                	addi	a5,a5,-1
    800026d6:	fef43423          	sd	a5,-24(s0)
      --max;
    800026da:	fa043783          	ld	a5,-96(s0)
    800026de:	17fd                	addi	a5,a5,-1
    800026e0:	faf43023          	sd	a5,-96(s0)
      p++;
    800026e4:	fd843783          	ld	a5,-40(s0)
    800026e8:	0785                	addi	a5,a5,1
    800026ea:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    800026ee:	fb043783          	ld	a5,-80(s0)
    800026f2:	0785                	addi	a5,a5,1
    800026f4:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    800026f8:	fe843783          	ld	a5,-24(s0)
    800026fc:	f7cd                	bnez	a5,800026a6 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    800026fe:	fd043703          	ld	a4,-48(s0)
    80002702:	6785                	lui	a5,0x1
    80002704:	97ba                	add	a5,a5,a4
    80002706:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000270a:	fe442783          	lw	a5,-28(s0)
    8000270e:	2781                	sext.w	a5,a5
    80002710:	e781                	bnez	a5,80002718 <copyinstr+0xf6>
    80002712:	fa043783          	ld	a5,-96(s0)
    80002716:	f78d                	bnez	a5,80002640 <copyinstr+0x1e>
  }
  if(got_null){
    80002718:	fe442783          	lw	a5,-28(s0)
    8000271c:	2781                	sext.w	a5,a5
    8000271e:	c399                	beqz	a5,80002724 <copyinstr+0x102>
    return 0;
    80002720:	4781                	li	a5,0
    80002722:	a011                	j	80002726 <copyinstr+0x104>
  } else {
    return -1;
    80002724:	57fd                	li	a5,-1
  }
}
    80002726:	853e                	mv	a0,a5
    80002728:	60e6                	ld	ra,88(sp)
    8000272a:	6446                	ld	s0,80(sp)
    8000272c:	6125                	addi	sp,sp,96
    8000272e:	8082                	ret

0000000080002730 <r_sstatus>:
{
    80002730:	1101                	addi	sp,sp,-32
    80002732:	ec22                	sd	s0,24(sp)
    80002734:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002736:	100027f3          	csrr	a5,sstatus
    8000273a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000273e:	fe843783          	ld	a5,-24(s0)
}
    80002742:	853e                	mv	a0,a5
    80002744:	6462                	ld	s0,24(sp)
    80002746:	6105                	addi	sp,sp,32
    80002748:	8082                	ret

000000008000274a <w_sstatus>:
{
    8000274a:	1101                	addi	sp,sp,-32
    8000274c:	ec22                	sd	s0,24(sp)
    8000274e:	1000                	addi	s0,sp,32
    80002750:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80002754:	fe843783          	ld	a5,-24(s0)
    80002758:	10079073          	csrw	sstatus,a5
}
    8000275c:	0001                	nop
    8000275e:	6462                	ld	s0,24(sp)
    80002760:	6105                	addi	sp,sp,32
    80002762:	8082                	ret

0000000080002764 <intr_on>:
{
    80002764:	1141                	addi	sp,sp,-16
    80002766:	e406                	sd	ra,8(sp)
    80002768:	e022                	sd	s0,0(sp)
    8000276a:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8000276c:	00000097          	auipc	ra,0x0
    80002770:	fc4080e7          	jalr	-60(ra) # 80002730 <r_sstatus>
    80002774:	87aa                	mv	a5,a0
    80002776:	0027e793          	ori	a5,a5,2
    8000277a:	853e                	mv	a0,a5
    8000277c:	00000097          	auipc	ra,0x0
    80002780:	fce080e7          	jalr	-50(ra) # 8000274a <w_sstatus>
}
    80002784:	0001                	nop
    80002786:	60a2                	ld	ra,8(sp)
    80002788:	6402                	ld	s0,0(sp)
    8000278a:	0141                	addi	sp,sp,16
    8000278c:	8082                	ret

000000008000278e <intr_get>:
{
    8000278e:	1101                	addi	sp,sp,-32
    80002790:	ec06                	sd	ra,24(sp)
    80002792:	e822                	sd	s0,16(sp)
    80002794:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80002796:	00000097          	auipc	ra,0x0
    8000279a:	f9a080e7          	jalr	-102(ra) # 80002730 <r_sstatus>
    8000279e:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800027a2:	fe843783          	ld	a5,-24(s0)
    800027a6:	8b89                	andi	a5,a5,2
    800027a8:	00f037b3          	snez	a5,a5
    800027ac:	0ff7f793          	andi	a5,a5,255
    800027b0:	2781                	sext.w	a5,a5
}
    800027b2:	853e                	mv	a0,a5
    800027b4:	60e2                	ld	ra,24(sp)
    800027b6:	6442                	ld	s0,16(sp)
    800027b8:	6105                	addi	sp,sp,32
    800027ba:	8082                	ret

00000000800027bc <r_tp>:
{
    800027bc:	1101                	addi	sp,sp,-32
    800027be:	ec22                	sd	s0,24(sp)
    800027c0:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    800027c2:	8792                	mv	a5,tp
    800027c4:	fef43423          	sd	a5,-24(s0)
  return x;
    800027c8:	fe843783          	ld	a5,-24(s0)
}
    800027cc:	853e                	mv	a0,a5
    800027ce:	6462                	ld	s0,24(sp)
    800027d0:	6105                	addi	sp,sp,32
    800027d2:	8082                	ret

00000000800027d4 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    800027d4:	7139                	addi	sp,sp,-64
    800027d6:	fc06                	sd	ra,56(sp)
    800027d8:	f822                	sd	s0,48(sp)
    800027da:	0080                	addi	s0,sp,64
    800027dc:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    800027e0:	00021797          	auipc	a5,0x21
    800027e4:	7d878793          	addi	a5,a5,2008 # 80023fb8 <proc>
    800027e8:	fef43423          	sd	a5,-24(s0)
    800027ec:	a061                	j	80002874 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    800027ee:	fffff097          	auipc	ra,0xfffff
    800027f2:	9e8080e7          	jalr	-1560(ra) # 800011d6 <kalloc>
    800027f6:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800027fa:	fe043783          	ld	a5,-32(s0)
    800027fe:	eb89                	bnez	a5,80002810 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002800:	00009517          	auipc	a0,0x9
    80002804:	9d850513          	addi	a0,a0,-1576 # 8000b1d8 <etext+0x1d8>
    80002808:	ffffe097          	auipc	ra,0xffffe
    8000280c:	484080e7          	jalr	1156(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002810:	fe843703          	ld	a4,-24(s0)
    80002814:	00021797          	auipc	a5,0x21
    80002818:	7a478793          	addi	a5,a5,1956 # 80023fb8 <proc>
    8000281c:	40f707b3          	sub	a5,a4,a5
    80002820:	4037d713          	srai	a4,a5,0x3
    80002824:	00009797          	auipc	a5,0x9
    80002828:	aac78793          	addi	a5,a5,-1364 # 8000b2d0 <etext+0x2d0>
    8000282c:	639c                	ld	a5,0(a5)
    8000282e:	02f707b3          	mul	a5,a4,a5
    80002832:	2781                	sext.w	a5,a5
    80002834:	2785                	addiw	a5,a5,1
    80002836:	2781                	sext.w	a5,a5
    80002838:	00d7979b          	slliw	a5,a5,0xd
    8000283c:	2781                	sext.w	a5,a5
    8000283e:	873e                	mv	a4,a5
    80002840:	040007b7          	lui	a5,0x4000
    80002844:	17fd                	addi	a5,a5,-1
    80002846:	07b2                	slli	a5,a5,0xc
    80002848:	8f99                	sub	a5,a5,a4
    8000284a:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    8000284e:	fe043783          	ld	a5,-32(s0)
    80002852:	4719                	li	a4,6
    80002854:	6685                	lui	a3,0x1
    80002856:	863e                	mv	a2,a5
    80002858:	fd843583          	ld	a1,-40(s0)
    8000285c:	fc843503          	ld	a0,-56(s0)
    80002860:	fffff097          	auipc	ra,0xfffff
    80002864:	51a080e7          	jalr	1306(ra) # 80001d7a <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002868:	fe843783          	ld	a5,-24(s0)
    8000286c:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002870:	fef43423          	sd	a5,-24(s0)
    80002874:	fe843703          	ld	a4,-24(s0)
    80002878:	00027797          	auipc	a5,0x27
    8000287c:	14078793          	addi	a5,a5,320 # 800299b8 <pid_lock>
    80002880:	f6f767e3          	bltu	a4,a5,800027ee <proc_mapstacks+0x1a>
  }
}
    80002884:	0001                	nop
    80002886:	0001                	nop
    80002888:	70e2                	ld	ra,56(sp)
    8000288a:	7442                	ld	s0,48(sp)
    8000288c:	6121                	addi	sp,sp,64
    8000288e:	8082                	ret

0000000080002890 <procinit>:

// initialize the proc table.
void
procinit(void)
{
    80002890:	1101                	addi	sp,sp,-32
    80002892:	ec06                	sd	ra,24(sp)
    80002894:	e822                	sd	s0,16(sp)
    80002896:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    80002898:	00009597          	auipc	a1,0x9
    8000289c:	94858593          	addi	a1,a1,-1720 # 8000b1e0 <etext+0x1e0>
    800028a0:	00027517          	auipc	a0,0x27
    800028a4:	11850513          	addi	a0,a0,280 # 800299b8 <pid_lock>
    800028a8:	fffff097          	auipc	ra,0xfffff
    800028ac:	a52080e7          	jalr	-1454(ra) # 800012fa <initlock>
  initlock(&wait_lock, "wait_lock");
    800028b0:	00009597          	auipc	a1,0x9
    800028b4:	93858593          	addi	a1,a1,-1736 # 8000b1e8 <etext+0x1e8>
    800028b8:	00027517          	auipc	a0,0x27
    800028bc:	11850513          	addi	a0,a0,280 # 800299d0 <wait_lock>
    800028c0:	fffff097          	auipc	ra,0xfffff
    800028c4:	a3a080e7          	jalr	-1478(ra) # 800012fa <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028c8:	00021797          	auipc	a5,0x21
    800028cc:	6f078793          	addi	a5,a5,1776 # 80023fb8 <proc>
    800028d0:	fef43423          	sd	a5,-24(s0)
    800028d4:	a0bd                	j	80002942 <procinit+0xb2>
      initlock(&p->lock, "proc");
    800028d6:	fe843783          	ld	a5,-24(s0)
    800028da:	00009597          	auipc	a1,0x9
    800028de:	91e58593          	addi	a1,a1,-1762 # 8000b1f8 <etext+0x1f8>
    800028e2:	853e                	mv	a0,a5
    800028e4:	fffff097          	auipc	ra,0xfffff
    800028e8:	a16080e7          	jalr	-1514(ra) # 800012fa <initlock>
      p->state = UNUSED;
    800028ec:	fe843783          	ld	a5,-24(s0)
    800028f0:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    800028f4:	fe843703          	ld	a4,-24(s0)
    800028f8:	00021797          	auipc	a5,0x21
    800028fc:	6c078793          	addi	a5,a5,1728 # 80023fb8 <proc>
    80002900:	40f707b3          	sub	a5,a4,a5
    80002904:	4037d713          	srai	a4,a5,0x3
    80002908:	00009797          	auipc	a5,0x9
    8000290c:	9c878793          	addi	a5,a5,-1592 # 8000b2d0 <etext+0x2d0>
    80002910:	639c                	ld	a5,0(a5)
    80002912:	02f707b3          	mul	a5,a4,a5
    80002916:	2781                	sext.w	a5,a5
    80002918:	2785                	addiw	a5,a5,1
    8000291a:	2781                	sext.w	a5,a5
    8000291c:	00d7979b          	slliw	a5,a5,0xd
    80002920:	2781                	sext.w	a5,a5
    80002922:	873e                	mv	a4,a5
    80002924:	040007b7          	lui	a5,0x4000
    80002928:	17fd                	addi	a5,a5,-1
    8000292a:	07b2                	slli	a5,a5,0xc
    8000292c:	8f99                	sub	a5,a5,a4
    8000292e:	873e                	mv	a4,a5
    80002930:	fe843783          	ld	a5,-24(s0)
    80002934:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002936:	fe843783          	ld	a5,-24(s0)
    8000293a:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    8000293e:	fef43423          	sd	a5,-24(s0)
    80002942:	fe843703          	ld	a4,-24(s0)
    80002946:	00027797          	auipc	a5,0x27
    8000294a:	07278793          	addi	a5,a5,114 # 800299b8 <pid_lock>
    8000294e:	f8f764e3          	bltu	a4,a5,800028d6 <procinit+0x46>
  }
}
    80002952:	0001                	nop
    80002954:	0001                	nop
    80002956:	60e2                	ld	ra,24(sp)
    80002958:	6442                	ld	s0,16(sp)
    8000295a:	6105                	addi	sp,sp,32
    8000295c:	8082                	ret

000000008000295e <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    8000295e:	1101                	addi	sp,sp,-32
    80002960:	ec06                	sd	ra,24(sp)
    80002962:	e822                	sd	s0,16(sp)
    80002964:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002966:	00000097          	auipc	ra,0x0
    8000296a:	e56080e7          	jalr	-426(ra) # 800027bc <r_tp>
    8000296e:	87aa                	mv	a5,a0
    80002970:	fef42623          	sw	a5,-20(s0)
  return id;
    80002974:	fec42783          	lw	a5,-20(s0)
}
    80002978:	853e                	mv	a0,a5
    8000297a:	60e2                	ld	ra,24(sp)
    8000297c:	6442                	ld	s0,16(sp)
    8000297e:	6105                	addi	sp,sp,32
    80002980:	8082                	ret

0000000080002982 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002982:	1101                	addi	sp,sp,-32
    80002984:	ec06                	sd	ra,24(sp)
    80002986:	e822                	sd	s0,16(sp)
    80002988:	1000                	addi	s0,sp,32
  int id = cpuid();
    8000298a:	00000097          	auipc	ra,0x0
    8000298e:	fd4080e7          	jalr	-44(ra) # 8000295e <cpuid>
    80002992:	87aa                	mv	a5,a0
    80002994:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002998:	fec42783          	lw	a5,-20(s0)
    8000299c:	00779713          	slli	a4,a5,0x7
    800029a0:	00021797          	auipc	a5,0x21
    800029a4:	21878793          	addi	a5,a5,536 # 80023bb8 <cpus>
    800029a8:	97ba                	add	a5,a5,a4
    800029aa:	fef43023          	sd	a5,-32(s0)
  return c;
    800029ae:	fe043783          	ld	a5,-32(s0)
}
    800029b2:	853e                	mv	a0,a5
    800029b4:	60e2                	ld	ra,24(sp)
    800029b6:	6442                	ld	s0,16(sp)
    800029b8:	6105                	addi	sp,sp,32
    800029ba:	8082                	ret

00000000800029bc <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    800029bc:	1101                	addi	sp,sp,-32
    800029be:	ec06                	sd	ra,24(sp)
    800029c0:	e822                	sd	s0,16(sp)
    800029c2:	1000                	addi	s0,sp,32
  push_off();
    800029c4:	fffff097          	auipc	ra,0xfffff
    800029c8:	a64080e7          	jalr	-1436(ra) # 80001428 <push_off>
  struct cpu *c = mycpu();
    800029cc:	00000097          	auipc	ra,0x0
    800029d0:	fb6080e7          	jalr	-74(ra) # 80002982 <mycpu>
    800029d4:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    800029d8:	fe843783          	ld	a5,-24(s0)
    800029dc:	639c                	ld	a5,0(a5)
    800029de:	fef43023          	sd	a5,-32(s0)
  pop_off();
    800029e2:	fffff097          	auipc	ra,0xfffff
    800029e6:	a9e080e7          	jalr	-1378(ra) # 80001480 <pop_off>
  return p;
    800029ea:	fe043783          	ld	a5,-32(s0)
}
    800029ee:	853e                	mv	a0,a5
    800029f0:	60e2                	ld	ra,24(sp)
    800029f2:	6442                	ld	s0,16(sp)
    800029f4:	6105                	addi	sp,sp,32
    800029f6:	8082                	ret

00000000800029f8 <allocpid>:

int
allocpid()
{
    800029f8:	1101                	addi	sp,sp,-32
    800029fa:	ec06                	sd	ra,24(sp)
    800029fc:	e822                	sd	s0,16(sp)
    800029fe:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002a00:	00027517          	auipc	a0,0x27
    80002a04:	fb850513          	addi	a0,a0,-72 # 800299b8 <pid_lock>
    80002a08:	fffff097          	auipc	ra,0xfffff
    80002a0c:	922080e7          	jalr	-1758(ra) # 8000132a <acquire>
  pid = nextpid;
    80002a10:	00009797          	auipc	a5,0x9
    80002a14:	db078793          	addi	a5,a5,-592 # 8000b7c0 <nextpid>
    80002a18:	439c                	lw	a5,0(a5)
    80002a1a:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002a1e:	00009797          	auipc	a5,0x9
    80002a22:	da278793          	addi	a5,a5,-606 # 8000b7c0 <nextpid>
    80002a26:	439c                	lw	a5,0(a5)
    80002a28:	2785                	addiw	a5,a5,1
    80002a2a:	0007871b          	sext.w	a4,a5
    80002a2e:	00009797          	auipc	a5,0x9
    80002a32:	d9278793          	addi	a5,a5,-622 # 8000b7c0 <nextpid>
    80002a36:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002a38:	00027517          	auipc	a0,0x27
    80002a3c:	f8050513          	addi	a0,a0,-128 # 800299b8 <pid_lock>
    80002a40:	fffff097          	auipc	ra,0xfffff
    80002a44:	94e080e7          	jalr	-1714(ra) # 8000138e <release>

  return pid;
    80002a48:	fec42783          	lw	a5,-20(s0)
}
    80002a4c:	853e                	mv	a0,a5
    80002a4e:	60e2                	ld	ra,24(sp)
    80002a50:	6442                	ld	s0,16(sp)
    80002a52:	6105                	addi	sp,sp,32
    80002a54:	8082                	ret

0000000080002a56 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002a56:	1101                	addi	sp,sp,-32
    80002a58:	ec06                	sd	ra,24(sp)
    80002a5a:	e822                	sd	s0,16(sp)
    80002a5c:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002a5e:	00021797          	auipc	a5,0x21
    80002a62:	55a78793          	addi	a5,a5,1370 # 80023fb8 <proc>
    80002a66:	fef43423          	sd	a5,-24(s0)
    80002a6a:	a80d                	j	80002a9c <allocproc+0x46>
    acquire(&p->lock);
    80002a6c:	fe843783          	ld	a5,-24(s0)
    80002a70:	853e                	mv	a0,a5
    80002a72:	fffff097          	auipc	ra,0xfffff
    80002a76:	8b8080e7          	jalr	-1864(ra) # 8000132a <acquire>
    if(p->state == UNUSED) {
    80002a7a:	fe843783          	ld	a5,-24(s0)
    80002a7e:	4f9c                	lw	a5,24(a5)
    80002a80:	cb85                	beqz	a5,80002ab0 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002a82:	fe843783          	ld	a5,-24(s0)
    80002a86:	853e                	mv	a0,a5
    80002a88:	fffff097          	auipc	ra,0xfffff
    80002a8c:	906080e7          	jalr	-1786(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002a90:	fe843783          	ld	a5,-24(s0)
    80002a94:	16878793          	addi	a5,a5,360
    80002a98:	fef43423          	sd	a5,-24(s0)
    80002a9c:	fe843703          	ld	a4,-24(s0)
    80002aa0:	00027797          	auipc	a5,0x27
    80002aa4:	f1878793          	addi	a5,a5,-232 # 800299b8 <pid_lock>
    80002aa8:	fcf762e3          	bltu	a4,a5,80002a6c <allocproc+0x16>
    }
  }
  return 0;
    80002aac:	4781                	li	a5,0
    80002aae:	a0e1                	j	80002b76 <allocproc+0x120>
      goto found;
    80002ab0:	0001                	nop

found:
  p->pid = allocpid();
    80002ab2:	00000097          	auipc	ra,0x0
    80002ab6:	f46080e7          	jalr	-186(ra) # 800029f8 <allocpid>
    80002aba:	87aa                	mv	a5,a0
    80002abc:	873e                	mv	a4,a5
    80002abe:	fe843783          	ld	a5,-24(s0)
    80002ac2:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002ac4:	fe843783          	ld	a5,-24(s0)
    80002ac8:	4705                	li	a4,1
    80002aca:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002acc:	ffffe097          	auipc	ra,0xffffe
    80002ad0:	70a080e7          	jalr	1802(ra) # 800011d6 <kalloc>
    80002ad4:	872a                	mv	a4,a0
    80002ad6:	fe843783          	ld	a5,-24(s0)
    80002ada:	efb8                	sd	a4,88(a5)
    80002adc:	fe843783          	ld	a5,-24(s0)
    80002ae0:	6fbc                	ld	a5,88(a5)
    80002ae2:	e385                	bnez	a5,80002b02 <allocproc+0xac>
    freeproc(p);
    80002ae4:	fe843503          	ld	a0,-24(s0)
    80002ae8:	00000097          	auipc	ra,0x0
    80002aec:	098080e7          	jalr	152(ra) # 80002b80 <freeproc>
    release(&p->lock);
    80002af0:	fe843783          	ld	a5,-24(s0)
    80002af4:	853e                	mv	a0,a5
    80002af6:	fffff097          	auipc	ra,0xfffff
    80002afa:	898080e7          	jalr	-1896(ra) # 8000138e <release>
    return 0;
    80002afe:	4781                	li	a5,0
    80002b00:	a89d                	j	80002b76 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002b02:	fe843503          	ld	a0,-24(s0)
    80002b06:	00000097          	auipc	ra,0x0
    80002b0a:	118080e7          	jalr	280(ra) # 80002c1e <proc_pagetable>
    80002b0e:	872a                	mv	a4,a0
    80002b10:	fe843783          	ld	a5,-24(s0)
    80002b14:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002b16:	fe843783          	ld	a5,-24(s0)
    80002b1a:	6bbc                	ld	a5,80(a5)
    80002b1c:	e385                	bnez	a5,80002b3c <allocproc+0xe6>
    freeproc(p);
    80002b1e:	fe843503          	ld	a0,-24(s0)
    80002b22:	00000097          	auipc	ra,0x0
    80002b26:	05e080e7          	jalr	94(ra) # 80002b80 <freeproc>
    release(&p->lock);
    80002b2a:	fe843783          	ld	a5,-24(s0)
    80002b2e:	853e                	mv	a0,a5
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	85e080e7          	jalr	-1954(ra) # 8000138e <release>
    return 0;
    80002b38:	4781                	li	a5,0
    80002b3a:	a835                	j	80002b76 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002b3c:	fe843783          	ld	a5,-24(s0)
    80002b40:	06078793          	addi	a5,a5,96
    80002b44:	07000613          	li	a2,112
    80002b48:	4581                	li	a1,0
    80002b4a:	853e                	mv	a0,a5
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	9b2080e7          	jalr	-1614(ra) # 800014fe <memset>
  p->context.ra = (uint64)forkret;
    80002b54:	00001717          	auipc	a4,0x1
    80002b58:	9da70713          	addi	a4,a4,-1574 # 8000352e <forkret>
    80002b5c:	fe843783          	ld	a5,-24(s0)
    80002b60:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002b62:	fe843783          	ld	a5,-24(s0)
    80002b66:	63b8                	ld	a4,64(a5)
    80002b68:	6785                	lui	a5,0x1
    80002b6a:	973e                	add	a4,a4,a5
    80002b6c:	fe843783          	ld	a5,-24(s0)
    80002b70:	f7b8                	sd	a4,104(a5)

  return p;
    80002b72:	fe843783          	ld	a5,-24(s0)
}
    80002b76:	853e                	mv	a0,a5
    80002b78:	60e2                	ld	ra,24(sp)
    80002b7a:	6442                	ld	s0,16(sp)
    80002b7c:	6105                	addi	sp,sp,32
    80002b7e:	8082                	ret

0000000080002b80 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002b80:	1101                	addi	sp,sp,-32
    80002b82:	ec06                	sd	ra,24(sp)
    80002b84:	e822                	sd	s0,16(sp)
    80002b86:	1000                	addi	s0,sp,32
    80002b88:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002b8c:	fe843783          	ld	a5,-24(s0)
    80002b90:	6fbc                	ld	a5,88(a5)
    80002b92:	cb89                	beqz	a5,80002ba4 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002b94:	fe843783          	ld	a5,-24(s0)
    80002b98:	6fbc                	ld	a5,88(a5)
    80002b9a:	853e                	mv	a0,a5
    80002b9c:	ffffe097          	auipc	ra,0xffffe
    80002ba0:	594080e7          	jalr	1428(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80002ba4:	fe843783          	ld	a5,-24(s0)
    80002ba8:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002bac:	fe843783          	ld	a5,-24(s0)
    80002bb0:	6bbc                	ld	a5,80(a5)
    80002bb2:	cf89                	beqz	a5,80002bcc <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002bb4:	fe843783          	ld	a5,-24(s0)
    80002bb8:	6bb8                	ld	a4,80(a5)
    80002bba:	fe843783          	ld	a5,-24(s0)
    80002bbe:	67bc                	ld	a5,72(a5)
    80002bc0:	85be                	mv	a1,a5
    80002bc2:	853a                	mv	a0,a4
    80002bc4:	00000097          	auipc	ra,0x0
    80002bc8:	11a080e7          	jalr	282(ra) # 80002cde <proc_freepagetable>
  p->pagetable = 0;
    80002bcc:	fe843783          	ld	a5,-24(s0)
    80002bd0:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002bd4:	fe843783          	ld	a5,-24(s0)
    80002bd8:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002bdc:	fe843783          	ld	a5,-24(s0)
    80002be0:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002be4:	fe843783          	ld	a5,-24(s0)
    80002be8:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002bec:	fe843783          	ld	a5,-24(s0)
    80002bf0:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002bf4:	fe843783          	ld	a5,-24(s0)
    80002bf8:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002bfc:	fe843783          	ld	a5,-24(s0)
    80002c00:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002c04:	fe843783          	ld	a5,-24(s0)
    80002c08:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002c0c:	fe843783          	ld	a5,-24(s0)
    80002c10:	0007ac23          	sw	zero,24(a5)
}
    80002c14:	0001                	nop
    80002c16:	60e2                	ld	ra,24(sp)
    80002c18:	6442                	ld	s0,16(sp)
    80002c1a:	6105                	addi	sp,sp,32
    80002c1c:	8082                	ret

0000000080002c1e <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002c1e:	7179                	addi	sp,sp,-48
    80002c20:	f406                	sd	ra,40(sp)
    80002c22:	f022                	sd	s0,32(sp)
    80002c24:	1800                	addi	s0,sp,48
    80002c26:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002c2a:	fffff097          	auipc	ra,0xfffff
    80002c2e:	3a0080e7          	jalr	928(ra) # 80001fca <uvmcreate>
    80002c32:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002c36:	fe843783          	ld	a5,-24(s0)
    80002c3a:	e399                	bnez	a5,80002c40 <proc_pagetable+0x22>
    return 0;
    80002c3c:	4781                	li	a5,0
    80002c3e:	a859                	j	80002cd4 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002c40:	00007797          	auipc	a5,0x7
    80002c44:	3c078793          	addi	a5,a5,960 # 8000a000 <_trampoline>
    80002c48:	4729                	li	a4,10
    80002c4a:	86be                	mv	a3,a5
    80002c4c:	6605                	lui	a2,0x1
    80002c4e:	040007b7          	lui	a5,0x4000
    80002c52:	17fd                	addi	a5,a5,-1
    80002c54:	00c79593          	slli	a1,a5,0xc
    80002c58:	fe843503          	ld	a0,-24(s0)
    80002c5c:	fffff097          	auipc	ra,0xfffff
    80002c60:	178080e7          	jalr	376(ra) # 80001dd4 <mappages>
    80002c64:	87aa                	mv	a5,a0
    80002c66:	0007db63          	bgez	a5,80002c7c <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002c6a:	4581                	li	a1,0
    80002c6c:	fe843503          	ld	a0,-24(s0)
    80002c70:	fffff097          	auipc	ra,0xfffff
    80002c74:	656080e7          	jalr	1622(ra) # 800022c6 <uvmfree>
    return 0;
    80002c78:	4781                	li	a5,0
    80002c7a:	a8a9                	j	80002cd4 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002c7c:	fd843783          	ld	a5,-40(s0)
    80002c80:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002c82:	4719                	li	a4,6
    80002c84:	86be                	mv	a3,a5
    80002c86:	6605                	lui	a2,0x1
    80002c88:	020007b7          	lui	a5,0x2000
    80002c8c:	17fd                	addi	a5,a5,-1
    80002c8e:	00d79593          	slli	a1,a5,0xd
    80002c92:	fe843503          	ld	a0,-24(s0)
    80002c96:	fffff097          	auipc	ra,0xfffff
    80002c9a:	13e080e7          	jalr	318(ra) # 80001dd4 <mappages>
    80002c9e:	87aa                	mv	a5,a0
    80002ca0:	0207d863          	bgez	a5,80002cd0 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002ca4:	4681                	li	a3,0
    80002ca6:	4605                	li	a2,1
    80002ca8:	040007b7          	lui	a5,0x4000
    80002cac:	17fd                	addi	a5,a5,-1
    80002cae:	00c79593          	slli	a1,a5,0xc
    80002cb2:	fe843503          	ld	a0,-24(s0)
    80002cb6:	fffff097          	auipc	ra,0xfffff
    80002cba:	208080e7          	jalr	520(ra) # 80001ebe <uvmunmap>
    uvmfree(pagetable, 0);
    80002cbe:	4581                	li	a1,0
    80002cc0:	fe843503          	ld	a0,-24(s0)
    80002cc4:	fffff097          	auipc	ra,0xfffff
    80002cc8:	602080e7          	jalr	1538(ra) # 800022c6 <uvmfree>
    return 0;
    80002ccc:	4781                	li	a5,0
    80002cce:	a019                	j	80002cd4 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002cd0:	fe843783          	ld	a5,-24(s0)
}
    80002cd4:	853e                	mv	a0,a5
    80002cd6:	70a2                	ld	ra,40(sp)
    80002cd8:	7402                	ld	s0,32(sp)
    80002cda:	6145                	addi	sp,sp,48
    80002cdc:	8082                	ret

0000000080002cde <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002cde:	1101                	addi	sp,sp,-32
    80002ce0:	ec06                	sd	ra,24(sp)
    80002ce2:	e822                	sd	s0,16(sp)
    80002ce4:	1000                	addi	s0,sp,32
    80002ce6:	fea43423          	sd	a0,-24(s0)
    80002cea:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002cee:	4681                	li	a3,0
    80002cf0:	4605                	li	a2,1
    80002cf2:	040007b7          	lui	a5,0x4000
    80002cf6:	17fd                	addi	a5,a5,-1
    80002cf8:	00c79593          	slli	a1,a5,0xc
    80002cfc:	fe843503          	ld	a0,-24(s0)
    80002d00:	fffff097          	auipc	ra,0xfffff
    80002d04:	1be080e7          	jalr	446(ra) # 80001ebe <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002d08:	4681                	li	a3,0
    80002d0a:	4605                	li	a2,1
    80002d0c:	020007b7          	lui	a5,0x2000
    80002d10:	17fd                	addi	a5,a5,-1
    80002d12:	00d79593          	slli	a1,a5,0xd
    80002d16:	fe843503          	ld	a0,-24(s0)
    80002d1a:	fffff097          	auipc	ra,0xfffff
    80002d1e:	1a4080e7          	jalr	420(ra) # 80001ebe <uvmunmap>
  uvmfree(pagetable, sz);
    80002d22:	fe043583          	ld	a1,-32(s0)
    80002d26:	fe843503          	ld	a0,-24(s0)
    80002d2a:	fffff097          	auipc	ra,0xfffff
    80002d2e:	59c080e7          	jalr	1436(ra) # 800022c6 <uvmfree>
}
    80002d32:	0001                	nop
    80002d34:	60e2                	ld	ra,24(sp)
    80002d36:	6442                	ld	s0,16(sp)
    80002d38:	6105                	addi	sp,sp,32
    80002d3a:	8082                	ret

0000000080002d3c <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002d3c:	1101                	addi	sp,sp,-32
    80002d3e:	ec06                	sd	ra,24(sp)
    80002d40:	e822                	sd	s0,16(sp)
    80002d42:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002d44:	00000097          	auipc	ra,0x0
    80002d48:	d12080e7          	jalr	-750(ra) # 80002a56 <allocproc>
    80002d4c:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002d50:	00009797          	auipc	a5,0x9
    80002d54:	bf078793          	addi	a5,a5,-1040 # 8000b940 <initproc>
    80002d58:	fe843703          	ld	a4,-24(s0)
    80002d5c:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002d5e:	fe843783          	ld	a5,-24(s0)
    80002d62:	6bbc                	ld	a5,80(a5)
    80002d64:	03400613          	li	a2,52
    80002d68:	00009597          	auipc	a1,0x9
    80002d6c:	a8058593          	addi	a1,a1,-1408 # 8000b7e8 <initcode>
    80002d70:	853e                	mv	a0,a5
    80002d72:	fffff097          	auipc	ra,0xfffff
    80002d76:	294080e7          	jalr	660(ra) # 80002006 <uvmfirst>
  p->sz = PGSIZE;
    80002d7a:	fe843783          	ld	a5,-24(s0)
    80002d7e:	6705                	lui	a4,0x1
    80002d80:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002d82:	fe843783          	ld	a5,-24(s0)
    80002d86:	6fbc                	ld	a5,88(a5)
    80002d88:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002d8c:	fe843783          	ld	a5,-24(s0)
    80002d90:	6fbc                	ld	a5,88(a5)
    80002d92:	6705                	lui	a4,0x1
    80002d94:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002d96:	fe843783          	ld	a5,-24(s0)
    80002d9a:	15878793          	addi	a5,a5,344
    80002d9e:	4641                	li	a2,16
    80002da0:	00008597          	auipc	a1,0x8
    80002da4:	46058593          	addi	a1,a1,1120 # 8000b200 <etext+0x200>
    80002da8:	853e                	mv	a0,a5
    80002daa:	fffff097          	auipc	ra,0xfffff
    80002dae:	a58080e7          	jalr	-1448(ra) # 80001802 <safestrcpy>
  p->cwd = namei("/");
    80002db2:	00008517          	auipc	a0,0x8
    80002db6:	45e50513          	addi	a0,a0,1118 # 8000b210 <etext+0x210>
    80002dba:	00003097          	auipc	ra,0x3
    80002dbe:	16e080e7          	jalr	366(ra) # 80005f28 <namei>
    80002dc2:	872a                	mv	a4,a0
    80002dc4:	fe843783          	ld	a5,-24(s0)
    80002dc8:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002dcc:	fe843783          	ld	a5,-24(s0)
    80002dd0:	470d                	li	a4,3
    80002dd2:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002dd4:	fe843783          	ld	a5,-24(s0)
    80002dd8:	853e                	mv	a0,a5
    80002dda:	ffffe097          	auipc	ra,0xffffe
    80002dde:	5b4080e7          	jalr	1460(ra) # 8000138e <release>
}
    80002de2:	0001                	nop
    80002de4:	60e2                	ld	ra,24(sp)
    80002de6:	6442                	ld	s0,16(sp)
    80002de8:	6105                	addi	sp,sp,32
    80002dea:	8082                	ret

0000000080002dec <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002dec:	7179                	addi	sp,sp,-48
    80002dee:	f406                	sd	ra,40(sp)
    80002df0:	f022                	sd	s0,32(sp)
    80002df2:	1800                	addi	s0,sp,48
    80002df4:	87aa                	mv	a5,a0
    80002df6:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002dfa:	00000097          	auipc	ra,0x0
    80002dfe:	bc2080e7          	jalr	-1086(ra) # 800029bc <myproc>
    80002e02:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002e06:	fe043783          	ld	a5,-32(s0)
    80002e0a:	67bc                	ld	a5,72(a5)
    80002e0c:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002e10:	fdc42783          	lw	a5,-36(s0)
    80002e14:	2781                	sext.w	a5,a5
    80002e16:	02f05963          	blez	a5,80002e48 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002e1a:	fe043783          	ld	a5,-32(s0)
    80002e1e:	6ba8                	ld	a0,80(a5)
    80002e20:	fdc42703          	lw	a4,-36(s0)
    80002e24:	fe843783          	ld	a5,-24(s0)
    80002e28:	97ba                	add	a5,a5,a4
    80002e2a:	4691                	li	a3,4
    80002e2c:	863e                	mv	a2,a5
    80002e2e:	fe843583          	ld	a1,-24(s0)
    80002e32:	fffff097          	auipc	ra,0xfffff
    80002e36:	25c080e7          	jalr	604(ra) # 8000208e <uvmalloc>
    80002e3a:	fea43423          	sd	a0,-24(s0)
    80002e3e:	fe843783          	ld	a5,-24(s0)
    80002e42:	eb95                	bnez	a5,80002e76 <growproc+0x8a>
      return -1;
    80002e44:	57fd                	li	a5,-1
    80002e46:	a835                	j	80002e82 <growproc+0x96>
    }
  } else if(n < 0){
    80002e48:	fdc42783          	lw	a5,-36(s0)
    80002e4c:	2781                	sext.w	a5,a5
    80002e4e:	0207d463          	bgez	a5,80002e76 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002e52:	fe043783          	ld	a5,-32(s0)
    80002e56:	6bb4                	ld	a3,80(a5)
    80002e58:	fdc42703          	lw	a4,-36(s0)
    80002e5c:	fe843783          	ld	a5,-24(s0)
    80002e60:	97ba                	add	a5,a5,a4
    80002e62:	863e                	mv	a2,a5
    80002e64:	fe843583          	ld	a1,-24(s0)
    80002e68:	8536                	mv	a0,a3
    80002e6a:	fffff097          	auipc	ra,0xfffff
    80002e6e:	316080e7          	jalr	790(ra) # 80002180 <uvmdealloc>
    80002e72:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002e76:	fe043783          	ld	a5,-32(s0)
    80002e7a:	fe843703          	ld	a4,-24(s0)
    80002e7e:	e7b8                	sd	a4,72(a5)
  return 0;
    80002e80:	4781                	li	a5,0
}
    80002e82:	853e                	mv	a0,a5
    80002e84:	70a2                	ld	ra,40(sp)
    80002e86:	7402                	ld	s0,32(sp)
    80002e88:	6145                	addi	sp,sp,48
    80002e8a:	8082                	ret

0000000080002e8c <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002e8c:	7179                	addi	sp,sp,-48
    80002e8e:	f406                	sd	ra,40(sp)
    80002e90:	f022                	sd	s0,32(sp)
    80002e92:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002e94:	00000097          	auipc	ra,0x0
    80002e98:	b28080e7          	jalr	-1240(ra) # 800029bc <myproc>
    80002e9c:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002ea0:	00000097          	auipc	ra,0x0
    80002ea4:	bb6080e7          	jalr	-1098(ra) # 80002a56 <allocproc>
    80002ea8:	fca43c23          	sd	a0,-40(s0)
    80002eac:	fd843783          	ld	a5,-40(s0)
    80002eb0:	e399                	bnez	a5,80002eb6 <fork+0x2a>
    return -1;
    80002eb2:	57fd                	li	a5,-1
    80002eb4:	aab5                	j	80003030 <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002eb6:	fe043783          	ld	a5,-32(s0)
    80002eba:	6bb8                	ld	a4,80(a5)
    80002ebc:	fd843783          	ld	a5,-40(s0)
    80002ec0:	6bb4                	ld	a3,80(a5)
    80002ec2:	fe043783          	ld	a5,-32(s0)
    80002ec6:	67bc                	ld	a5,72(a5)
    80002ec8:	863e                	mv	a2,a5
    80002eca:	85b6                	mv	a1,a3
    80002ecc:	853a                	mv	a0,a4
    80002ece:	fffff097          	auipc	ra,0xfffff
    80002ed2:	442080e7          	jalr	1090(ra) # 80002310 <uvmcopy>
    80002ed6:	87aa                	mv	a5,a0
    80002ed8:	0207d163          	bgez	a5,80002efa <fork+0x6e>
    freeproc(np);
    80002edc:	fd843503          	ld	a0,-40(s0)
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	ca0080e7          	jalr	-864(ra) # 80002b80 <freeproc>
    release(&np->lock);
    80002ee8:	fd843783          	ld	a5,-40(s0)
    80002eec:	853e                	mv	a0,a5
    80002eee:	ffffe097          	auipc	ra,0xffffe
    80002ef2:	4a0080e7          	jalr	1184(ra) # 8000138e <release>
    return -1;
    80002ef6:	57fd                	li	a5,-1
    80002ef8:	aa25                	j	80003030 <fork+0x1a4>
  }
  np->sz = p->sz;
    80002efa:	fe043783          	ld	a5,-32(s0)
    80002efe:	67b8                	ld	a4,72(a5)
    80002f00:	fd843783          	ld	a5,-40(s0)
    80002f04:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002f06:	fe043783          	ld	a5,-32(s0)
    80002f0a:	6fb8                	ld	a4,88(a5)
    80002f0c:	fd843783          	ld	a5,-40(s0)
    80002f10:	6fbc                	ld	a5,88(a5)
    80002f12:	86be                	mv	a3,a5
    80002f14:	12000793          	li	a5,288
    80002f18:	863e                	mv	a2,a5
    80002f1a:	85ba                	mv	a1,a4
    80002f1c:	8536                	mv	a0,a3
    80002f1e:	ffffe097          	auipc	ra,0xffffe
    80002f22:	7a0080e7          	jalr	1952(ra) # 800016be <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002f26:	fd843783          	ld	a5,-40(s0)
    80002f2a:	6fbc                	ld	a5,88(a5)
    80002f2c:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002f30:	fe042623          	sw	zero,-20(s0)
    80002f34:	a0a9                	j	80002f7e <fork+0xf2>
    if(p->ofile[i])
    80002f36:	fe043703          	ld	a4,-32(s0)
    80002f3a:	fec42783          	lw	a5,-20(s0)
    80002f3e:	07e9                	addi	a5,a5,26
    80002f40:	078e                	slli	a5,a5,0x3
    80002f42:	97ba                	add	a5,a5,a4
    80002f44:	639c                	ld	a5,0(a5)
    80002f46:	c79d                	beqz	a5,80002f74 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002f48:	fe043703          	ld	a4,-32(s0)
    80002f4c:	fec42783          	lw	a5,-20(s0)
    80002f50:	07e9                	addi	a5,a5,26
    80002f52:	078e                	slli	a5,a5,0x3
    80002f54:	97ba                	add	a5,a5,a4
    80002f56:	639c                	ld	a5,0(a5)
    80002f58:	853e                	mv	a0,a5
    80002f5a:	00004097          	auipc	ra,0x4
    80002f5e:	966080e7          	jalr	-1690(ra) # 800068c0 <filedup>
    80002f62:	86aa                	mv	a3,a0
    80002f64:	fd843703          	ld	a4,-40(s0)
    80002f68:	fec42783          	lw	a5,-20(s0)
    80002f6c:	07e9                	addi	a5,a5,26
    80002f6e:	078e                	slli	a5,a5,0x3
    80002f70:	97ba                	add	a5,a5,a4
    80002f72:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002f74:	fec42783          	lw	a5,-20(s0)
    80002f78:	2785                	addiw	a5,a5,1
    80002f7a:	fef42623          	sw	a5,-20(s0)
    80002f7e:	fec42783          	lw	a5,-20(s0)
    80002f82:	0007871b          	sext.w	a4,a5
    80002f86:	47bd                	li	a5,15
    80002f88:	fae7d7e3          	bge	a5,a4,80002f36 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002f8c:	fe043783          	ld	a5,-32(s0)
    80002f90:	1507b783          	ld	a5,336(a5)
    80002f94:	853e                	mv	a0,a5
    80002f96:	00002097          	auipc	ra,0x2
    80002f9a:	220080e7          	jalr	544(ra) # 800051b6 <idup>
    80002f9e:	872a                	mv	a4,a0
    80002fa0:	fd843783          	ld	a5,-40(s0)
    80002fa4:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002fa8:	fd843783          	ld	a5,-40(s0)
    80002fac:	15878713          	addi	a4,a5,344
    80002fb0:	fe043783          	ld	a5,-32(s0)
    80002fb4:	15878793          	addi	a5,a5,344
    80002fb8:	4641                	li	a2,16
    80002fba:	85be                	mv	a1,a5
    80002fbc:	853a                	mv	a0,a4
    80002fbe:	fffff097          	auipc	ra,0xfffff
    80002fc2:	844080e7          	jalr	-1980(ra) # 80001802 <safestrcpy>

  pid = np->pid;
    80002fc6:	fd843783          	ld	a5,-40(s0)
    80002fca:	5b9c                	lw	a5,48(a5)
    80002fcc:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80002fd0:	fd843783          	ld	a5,-40(s0)
    80002fd4:	853e                	mv	a0,a5
    80002fd6:	ffffe097          	auipc	ra,0xffffe
    80002fda:	3b8080e7          	jalr	952(ra) # 8000138e <release>

  acquire(&wait_lock);
    80002fde:	00027517          	auipc	a0,0x27
    80002fe2:	9f250513          	addi	a0,a0,-1550 # 800299d0 <wait_lock>
    80002fe6:	ffffe097          	auipc	ra,0xffffe
    80002fea:	344080e7          	jalr	836(ra) # 8000132a <acquire>
  np->parent = p;
    80002fee:	fd843783          	ld	a5,-40(s0)
    80002ff2:	fe043703          	ld	a4,-32(s0)
    80002ff6:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80002ff8:	00027517          	auipc	a0,0x27
    80002ffc:	9d850513          	addi	a0,a0,-1576 # 800299d0 <wait_lock>
    80003000:	ffffe097          	auipc	ra,0xffffe
    80003004:	38e080e7          	jalr	910(ra) # 8000138e <release>

  acquire(&np->lock);
    80003008:	fd843783          	ld	a5,-40(s0)
    8000300c:	853e                	mv	a0,a5
    8000300e:	ffffe097          	auipc	ra,0xffffe
    80003012:	31c080e7          	jalr	796(ra) # 8000132a <acquire>
  np->state = RUNNABLE;
    80003016:	fd843783          	ld	a5,-40(s0)
    8000301a:	470d                	li	a4,3
    8000301c:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    8000301e:	fd843783          	ld	a5,-40(s0)
    80003022:	853e                	mv	a0,a5
    80003024:	ffffe097          	auipc	ra,0xffffe
    80003028:	36a080e7          	jalr	874(ra) # 8000138e <release>

  return pid;
    8000302c:	fd442783          	lw	a5,-44(s0)
}
    80003030:	853e                	mv	a0,a5
    80003032:	70a2                	ld	ra,40(sp)
    80003034:	7402                	ld	s0,32(sp)
    80003036:	6145                	addi	sp,sp,48
    80003038:	8082                	ret

000000008000303a <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    8000303a:	7179                	addi	sp,sp,-48
    8000303c:	f406                	sd	ra,40(sp)
    8000303e:	f022                	sd	s0,32(sp)
    80003040:	1800                	addi	s0,sp,48
    80003042:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003046:	00021797          	auipc	a5,0x21
    8000304a:	f7278793          	addi	a5,a5,-142 # 80023fb8 <proc>
    8000304e:	fef43423          	sd	a5,-24(s0)
    80003052:	a081                	j	80003092 <reparent+0x58>
    if(pp->parent == p){
    80003054:	fe843783          	ld	a5,-24(s0)
    80003058:	7f9c                	ld	a5,56(a5)
    8000305a:	fd843703          	ld	a4,-40(s0)
    8000305e:	02f71463          	bne	a4,a5,80003086 <reparent+0x4c>
      pp->parent = initproc;
    80003062:	00009797          	auipc	a5,0x9
    80003066:	8de78793          	addi	a5,a5,-1826 # 8000b940 <initproc>
    8000306a:	6398                	ld	a4,0(a5)
    8000306c:	fe843783          	ld	a5,-24(s0)
    80003070:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80003072:	00009797          	auipc	a5,0x9
    80003076:	8ce78793          	addi	a5,a5,-1842 # 8000b940 <initproc>
    8000307a:	639c                	ld	a5,0(a5)
    8000307c:	853e                	mv	a0,a5
    8000307e:	00000097          	auipc	ra,0x0
    80003082:	57c080e7          	jalr	1404(ra) # 800035fa <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003086:	fe843783          	ld	a5,-24(s0)
    8000308a:	16878793          	addi	a5,a5,360
    8000308e:	fef43423          	sd	a5,-24(s0)
    80003092:	fe843703          	ld	a4,-24(s0)
    80003096:	00027797          	auipc	a5,0x27
    8000309a:	92278793          	addi	a5,a5,-1758 # 800299b8 <pid_lock>
    8000309e:	faf76be3          	bltu	a4,a5,80003054 <reparent+0x1a>
    }
  }
}
    800030a2:	0001                	nop
    800030a4:	0001                	nop
    800030a6:	70a2                	ld	ra,40(sp)
    800030a8:	7402                	ld	s0,32(sp)
    800030aa:	6145                	addi	sp,sp,48
    800030ac:	8082                	ret

00000000800030ae <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    800030ae:	7139                	addi	sp,sp,-64
    800030b0:	fc06                	sd	ra,56(sp)
    800030b2:	f822                	sd	s0,48(sp)
    800030b4:	0080                	addi	s0,sp,64
    800030b6:	87aa                	mv	a5,a0
    800030b8:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    800030bc:	00000097          	auipc	ra,0x0
    800030c0:	900080e7          	jalr	-1792(ra) # 800029bc <myproc>
    800030c4:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    800030c8:	00009797          	auipc	a5,0x9
    800030cc:	87878793          	addi	a5,a5,-1928 # 8000b940 <initproc>
    800030d0:	639c                	ld	a5,0(a5)
    800030d2:	fe043703          	ld	a4,-32(s0)
    800030d6:	00f71a63          	bne	a4,a5,800030ea <exit+0x3c>
    panic("init exiting");
    800030da:	00008517          	auipc	a0,0x8
    800030de:	13e50513          	addi	a0,a0,318 # 8000b218 <etext+0x218>
    800030e2:	ffffe097          	auipc	ra,0xffffe
    800030e6:	baa080e7          	jalr	-1110(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    800030ea:	fe042623          	sw	zero,-20(s0)
    800030ee:	a881                	j	8000313e <exit+0x90>
    if(p->ofile[fd]){
    800030f0:	fe043703          	ld	a4,-32(s0)
    800030f4:	fec42783          	lw	a5,-20(s0)
    800030f8:	07e9                	addi	a5,a5,26
    800030fa:	078e                	slli	a5,a5,0x3
    800030fc:	97ba                	add	a5,a5,a4
    800030fe:	639c                	ld	a5,0(a5)
    80003100:	cb95                	beqz	a5,80003134 <exit+0x86>
      struct file *f = p->ofile[fd];
    80003102:	fe043703          	ld	a4,-32(s0)
    80003106:	fec42783          	lw	a5,-20(s0)
    8000310a:	07e9                	addi	a5,a5,26
    8000310c:	078e                	slli	a5,a5,0x3
    8000310e:	97ba                	add	a5,a5,a4
    80003110:	639c                	ld	a5,0(a5)
    80003112:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80003116:	fd843503          	ld	a0,-40(s0)
    8000311a:	00004097          	auipc	ra,0x4
    8000311e:	80c080e7          	jalr	-2036(ra) # 80006926 <fileclose>
      p->ofile[fd] = 0;
    80003122:	fe043703          	ld	a4,-32(s0)
    80003126:	fec42783          	lw	a5,-20(s0)
    8000312a:	07e9                	addi	a5,a5,26
    8000312c:	078e                	slli	a5,a5,0x3
    8000312e:	97ba                	add	a5,a5,a4
    80003130:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80003134:	fec42783          	lw	a5,-20(s0)
    80003138:	2785                	addiw	a5,a5,1
    8000313a:	fef42623          	sw	a5,-20(s0)
    8000313e:	fec42783          	lw	a5,-20(s0)
    80003142:	0007871b          	sext.w	a4,a5
    80003146:	47bd                	li	a5,15
    80003148:	fae7d4e3          	bge	a5,a4,800030f0 <exit+0x42>
    }
  }

  begin_op();
    8000314c:	00003097          	auipc	ra,0x3
    80003150:	140080e7          	jalr	320(ra) # 8000628c <begin_op>
  iput(p->cwd);
    80003154:	fe043783          	ld	a5,-32(s0)
    80003158:	1507b783          	ld	a5,336(a5)
    8000315c:	853e                	mv	a0,a5
    8000315e:	00002097          	auipc	ra,0x2
    80003162:	232080e7          	jalr	562(ra) # 80005390 <iput>
  end_op();
    80003166:	00003097          	auipc	ra,0x3
    8000316a:	1e8080e7          	jalr	488(ra) # 8000634e <end_op>
  p->cwd = 0;
    8000316e:	fe043783          	ld	a5,-32(s0)
    80003172:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80003176:	00027517          	auipc	a0,0x27
    8000317a:	85a50513          	addi	a0,a0,-1958 # 800299d0 <wait_lock>
    8000317e:	ffffe097          	auipc	ra,0xffffe
    80003182:	1ac080e7          	jalr	428(ra) # 8000132a <acquire>

  // Give any children to init.
  reparent(p);
    80003186:	fe043503          	ld	a0,-32(s0)
    8000318a:	00000097          	auipc	ra,0x0
    8000318e:	eb0080e7          	jalr	-336(ra) # 8000303a <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003192:	fe043783          	ld	a5,-32(s0)
    80003196:	7f9c                	ld	a5,56(a5)
    80003198:	853e                	mv	a0,a5
    8000319a:	00000097          	auipc	ra,0x0
    8000319e:	460080e7          	jalr	1120(ra) # 800035fa <wakeup>
  
  acquire(&p->lock);
    800031a2:	fe043783          	ld	a5,-32(s0)
    800031a6:	853e                	mv	a0,a5
    800031a8:	ffffe097          	auipc	ra,0xffffe
    800031ac:	182080e7          	jalr	386(ra) # 8000132a <acquire>

  p->xstate = status;
    800031b0:	fe043783          	ld	a5,-32(s0)
    800031b4:	fcc42703          	lw	a4,-52(s0)
    800031b8:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    800031ba:	fe043783          	ld	a5,-32(s0)
    800031be:	4715                	li	a4,5
    800031c0:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    800031c2:	00027517          	auipc	a0,0x27
    800031c6:	80e50513          	addi	a0,a0,-2034 # 800299d0 <wait_lock>
    800031ca:	ffffe097          	auipc	ra,0xffffe
    800031ce:	1c4080e7          	jalr	452(ra) # 8000138e <release>

  // Jump into the scheduler, never to return.
  sched();
    800031d2:	00000097          	auipc	ra,0x0
    800031d6:	230080e7          	jalr	560(ra) # 80003402 <sched>
  panic("zombie exit");
    800031da:	00008517          	auipc	a0,0x8
    800031de:	04e50513          	addi	a0,a0,78 # 8000b228 <etext+0x228>
    800031e2:	ffffe097          	auipc	ra,0xffffe
    800031e6:	aaa080e7          	jalr	-1366(ra) # 80000c8c <panic>

00000000800031ea <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800031ea:	7139                	addi	sp,sp,-64
    800031ec:	fc06                	sd	ra,56(sp)
    800031ee:	f822                	sd	s0,48(sp)
    800031f0:	0080                	addi	s0,sp,64
    800031f2:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    800031f6:	fffff097          	auipc	ra,0xfffff
    800031fa:	7c6080e7          	jalr	1990(ra) # 800029bc <myproc>
    800031fe:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003202:	00026517          	auipc	a0,0x26
    80003206:	7ce50513          	addi	a0,a0,1998 # 800299d0 <wait_lock>
    8000320a:	ffffe097          	auipc	ra,0xffffe
    8000320e:	120080e7          	jalr	288(ra) # 8000132a <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003212:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003216:	00021797          	auipc	a5,0x21
    8000321a:	da278793          	addi	a5,a5,-606 # 80023fb8 <proc>
    8000321e:	fef43423          	sd	a5,-24(s0)
    80003222:	a8d1                	j	800032f6 <wait+0x10c>
      if(pp->parent == p){
    80003224:	fe843783          	ld	a5,-24(s0)
    80003228:	7f9c                	ld	a5,56(a5)
    8000322a:	fd843703          	ld	a4,-40(s0)
    8000322e:	0af71e63          	bne	a4,a5,800032ea <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    80003232:	fe843783          	ld	a5,-24(s0)
    80003236:	853e                	mv	a0,a5
    80003238:	ffffe097          	auipc	ra,0xffffe
    8000323c:	0f2080e7          	jalr	242(ra) # 8000132a <acquire>

        havekids = 1;
    80003240:	4785                	li	a5,1
    80003242:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    80003246:	fe843783          	ld	a5,-24(s0)
    8000324a:	4f9c                	lw	a5,24(a5)
    8000324c:	873e                	mv	a4,a5
    8000324e:	4795                	li	a5,5
    80003250:	08f71663          	bne	a4,a5,800032dc <wait+0xf2>
          // Found one.
          pid = pp->pid;
    80003254:	fe843783          	ld	a5,-24(s0)
    80003258:	5b9c                	lw	a5,48(a5)
    8000325a:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    8000325e:	fc843783          	ld	a5,-56(s0)
    80003262:	c7a9                	beqz	a5,800032ac <wait+0xc2>
    80003264:	fd843783          	ld	a5,-40(s0)
    80003268:	6bb8                	ld	a4,80(a5)
    8000326a:	fe843783          	ld	a5,-24(s0)
    8000326e:	02c78793          	addi	a5,a5,44
    80003272:	4691                	li	a3,4
    80003274:	863e                	mv	a2,a5
    80003276:	fc843583          	ld	a1,-56(s0)
    8000327a:	853a                	mv	a0,a4
    8000327c:	fffff097          	auipc	ra,0xfffff
    80003280:	20a080e7          	jalr	522(ra) # 80002486 <copyout>
    80003284:	87aa                	mv	a5,a0
    80003286:	0207d363          	bgez	a5,800032ac <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    8000328a:	fe843783          	ld	a5,-24(s0)
    8000328e:	853e                	mv	a0,a5
    80003290:	ffffe097          	auipc	ra,0xffffe
    80003294:	0fe080e7          	jalr	254(ra) # 8000138e <release>
            release(&wait_lock);
    80003298:	00026517          	auipc	a0,0x26
    8000329c:	73850513          	addi	a0,a0,1848 # 800299d0 <wait_lock>
    800032a0:	ffffe097          	auipc	ra,0xffffe
    800032a4:	0ee080e7          	jalr	238(ra) # 8000138e <release>
            return -1;
    800032a8:	57fd                	li	a5,-1
    800032aa:	a879                	j	80003348 <wait+0x15e>
          }
          freeproc(pp);
    800032ac:	fe843503          	ld	a0,-24(s0)
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	8d0080e7          	jalr	-1840(ra) # 80002b80 <freeproc>
          release(&pp->lock);
    800032b8:	fe843783          	ld	a5,-24(s0)
    800032bc:	853e                	mv	a0,a5
    800032be:	ffffe097          	auipc	ra,0xffffe
    800032c2:	0d0080e7          	jalr	208(ra) # 8000138e <release>
          release(&wait_lock);
    800032c6:	00026517          	auipc	a0,0x26
    800032ca:	70a50513          	addi	a0,a0,1802 # 800299d0 <wait_lock>
    800032ce:	ffffe097          	auipc	ra,0xffffe
    800032d2:	0c0080e7          	jalr	192(ra) # 8000138e <release>
          return pid;
    800032d6:	fd442783          	lw	a5,-44(s0)
    800032da:	a0bd                	j	80003348 <wait+0x15e>
        }
        release(&pp->lock);
    800032dc:	fe843783          	ld	a5,-24(s0)
    800032e0:	853e                	mv	a0,a5
    800032e2:	ffffe097          	auipc	ra,0xffffe
    800032e6:	0ac080e7          	jalr	172(ra) # 8000138e <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800032ea:	fe843783          	ld	a5,-24(s0)
    800032ee:	16878793          	addi	a5,a5,360
    800032f2:	fef43423          	sd	a5,-24(s0)
    800032f6:	fe843703          	ld	a4,-24(s0)
    800032fa:	00026797          	auipc	a5,0x26
    800032fe:	6be78793          	addi	a5,a5,1726 # 800299b8 <pid_lock>
    80003302:	f2f761e3          	bltu	a4,a5,80003224 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    80003306:	fe442783          	lw	a5,-28(s0)
    8000330a:	2781                	sext.w	a5,a5
    8000330c:	cb89                	beqz	a5,8000331e <wait+0x134>
    8000330e:	fd843503          	ld	a0,-40(s0)
    80003312:	00000097          	auipc	ra,0x0
    80003316:	47a080e7          	jalr	1146(ra) # 8000378c <killed>
    8000331a:	87aa                	mv	a5,a0
    8000331c:	cb99                	beqz	a5,80003332 <wait+0x148>
      release(&wait_lock);
    8000331e:	00026517          	auipc	a0,0x26
    80003322:	6b250513          	addi	a0,a0,1714 # 800299d0 <wait_lock>
    80003326:	ffffe097          	auipc	ra,0xffffe
    8000332a:	068080e7          	jalr	104(ra) # 8000138e <release>
      return -1;
    8000332e:	57fd                	li	a5,-1
    80003330:	a821                	j	80003348 <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    80003332:	00026597          	auipc	a1,0x26
    80003336:	69e58593          	addi	a1,a1,1694 # 800299d0 <wait_lock>
    8000333a:	fd843503          	ld	a0,-40(s0)
    8000333e:	00000097          	auipc	ra,0x0
    80003342:	240080e7          	jalr	576(ra) # 8000357e <sleep>
    havekids = 0;
    80003346:	b5f1                	j	80003212 <wait+0x28>
  }
}
    80003348:	853e                	mv	a0,a5
    8000334a:	70e2                	ld	ra,56(sp)
    8000334c:	7442                	ld	s0,48(sp)
    8000334e:	6121                	addi	sp,sp,64
    80003350:	8082                	ret

0000000080003352 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80003352:	1101                	addi	sp,sp,-32
    80003354:	ec06                	sd	ra,24(sp)
    80003356:	e822                	sd	s0,16(sp)
    80003358:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    8000335a:	fffff097          	auipc	ra,0xfffff
    8000335e:	628080e7          	jalr	1576(ra) # 80002982 <mycpu>
    80003362:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    80003366:	fe043783          	ld	a5,-32(s0)
    8000336a:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    8000336e:	fffff097          	auipc	ra,0xfffff
    80003372:	3f6080e7          	jalr	1014(ra) # 80002764 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    80003376:	00021797          	auipc	a5,0x21
    8000337a:	c4278793          	addi	a5,a5,-958 # 80023fb8 <proc>
    8000337e:	fef43423          	sd	a5,-24(s0)
    80003382:	a0bd                	j	800033f0 <scheduler+0x9e>
      acquire(&p->lock);
    80003384:	fe843783          	ld	a5,-24(s0)
    80003388:	853e                	mv	a0,a5
    8000338a:	ffffe097          	auipc	ra,0xffffe
    8000338e:	fa0080e7          	jalr	-96(ra) # 8000132a <acquire>
      if(p->state == RUNNABLE) {
    80003392:	fe843783          	ld	a5,-24(s0)
    80003396:	4f9c                	lw	a5,24(a5)
    80003398:	873e                	mv	a4,a5
    8000339a:	478d                	li	a5,3
    8000339c:	02f71d63          	bne	a4,a5,800033d6 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    800033a0:	fe843783          	ld	a5,-24(s0)
    800033a4:	4711                	li	a4,4
    800033a6:	cf98                	sw	a4,24(a5)
        c->proc = p;
    800033a8:	fe043783          	ld	a5,-32(s0)
    800033ac:	fe843703          	ld	a4,-24(s0)
    800033b0:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    800033b2:	fe043783          	ld	a5,-32(s0)
    800033b6:	00878713          	addi	a4,a5,8
    800033ba:	fe843783          	ld	a5,-24(s0)
    800033be:	06078793          	addi	a5,a5,96
    800033c2:	85be                	mv	a1,a5
    800033c4:	853a                	mv	a0,a4
    800033c6:	00000097          	auipc	ra,0x0
    800033ca:	5d0080e7          	jalr	1488(ra) # 80003996 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800033ce:	fe043783          	ld	a5,-32(s0)
    800033d2:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    800033d6:	fe843783          	ld	a5,-24(s0)
    800033da:	853e                	mv	a0,a5
    800033dc:	ffffe097          	auipc	ra,0xffffe
    800033e0:	fb2080e7          	jalr	-78(ra) # 8000138e <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    800033e4:	fe843783          	ld	a5,-24(s0)
    800033e8:	16878793          	addi	a5,a5,360
    800033ec:	fef43423          	sd	a5,-24(s0)
    800033f0:	fe843703          	ld	a4,-24(s0)
    800033f4:	00026797          	auipc	a5,0x26
    800033f8:	5c478793          	addi	a5,a5,1476 # 800299b8 <pid_lock>
    800033fc:	f8f764e3          	bltu	a4,a5,80003384 <scheduler+0x32>
    intr_on();
    80003400:	b7bd                	j	8000336e <scheduler+0x1c>

0000000080003402 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80003402:	7179                	addi	sp,sp,-48
    80003404:	f406                	sd	ra,40(sp)
    80003406:	f022                	sd	s0,32(sp)
    80003408:	ec26                	sd	s1,24(sp)
    8000340a:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    8000340c:	fffff097          	auipc	ra,0xfffff
    80003410:	5b0080e7          	jalr	1456(ra) # 800029bc <myproc>
    80003414:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    80003418:	fd843783          	ld	a5,-40(s0)
    8000341c:	853e                	mv	a0,a5
    8000341e:	ffffe097          	auipc	ra,0xffffe
    80003422:	fc6080e7          	jalr	-58(ra) # 800013e4 <holding>
    80003426:	87aa                	mv	a5,a0
    80003428:	eb89                	bnez	a5,8000343a <sched+0x38>
    panic("sched p->lock");
    8000342a:	00008517          	auipc	a0,0x8
    8000342e:	e0e50513          	addi	a0,a0,-498 # 8000b238 <etext+0x238>
    80003432:	ffffe097          	auipc	ra,0xffffe
    80003436:	85a080e7          	jalr	-1958(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    8000343a:	fffff097          	auipc	ra,0xfffff
    8000343e:	548080e7          	jalr	1352(ra) # 80002982 <mycpu>
    80003442:	87aa                	mv	a5,a0
    80003444:	5fbc                	lw	a5,120(a5)
    80003446:	873e                	mv	a4,a5
    80003448:	4785                	li	a5,1
    8000344a:	00f70a63          	beq	a4,a5,8000345e <sched+0x5c>
    panic("sched locks");
    8000344e:	00008517          	auipc	a0,0x8
    80003452:	dfa50513          	addi	a0,a0,-518 # 8000b248 <etext+0x248>
    80003456:	ffffe097          	auipc	ra,0xffffe
    8000345a:	836080e7          	jalr	-1994(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    8000345e:	fd843783          	ld	a5,-40(s0)
    80003462:	4f9c                	lw	a5,24(a5)
    80003464:	873e                	mv	a4,a5
    80003466:	4791                	li	a5,4
    80003468:	00f71a63          	bne	a4,a5,8000347c <sched+0x7a>
    panic("sched running");
    8000346c:	00008517          	auipc	a0,0x8
    80003470:	dec50513          	addi	a0,a0,-532 # 8000b258 <etext+0x258>
    80003474:	ffffe097          	auipc	ra,0xffffe
    80003478:	818080e7          	jalr	-2024(ra) # 80000c8c <panic>
  if(intr_get())
    8000347c:	fffff097          	auipc	ra,0xfffff
    80003480:	312080e7          	jalr	786(ra) # 8000278e <intr_get>
    80003484:	87aa                	mv	a5,a0
    80003486:	cb89                	beqz	a5,80003498 <sched+0x96>
    panic("sched interruptible");
    80003488:	00008517          	auipc	a0,0x8
    8000348c:	de050513          	addi	a0,a0,-544 # 8000b268 <etext+0x268>
    80003490:	ffffd097          	auipc	ra,0xffffd
    80003494:	7fc080e7          	jalr	2044(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    80003498:	fffff097          	auipc	ra,0xfffff
    8000349c:	4ea080e7          	jalr	1258(ra) # 80002982 <mycpu>
    800034a0:	87aa                	mv	a5,a0
    800034a2:	5ffc                	lw	a5,124(a5)
    800034a4:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800034a8:	fd843783          	ld	a5,-40(s0)
    800034ac:	06078493          	addi	s1,a5,96
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	4d2080e7          	jalr	1234(ra) # 80002982 <mycpu>
    800034b8:	87aa                	mv	a5,a0
    800034ba:	07a1                	addi	a5,a5,8
    800034bc:	85be                	mv	a1,a5
    800034be:	8526                	mv	a0,s1
    800034c0:	00000097          	auipc	ra,0x0
    800034c4:	4d6080e7          	jalr	1238(ra) # 80003996 <swtch>
  mycpu()->intena = intena;
    800034c8:	fffff097          	auipc	ra,0xfffff
    800034cc:	4ba080e7          	jalr	1210(ra) # 80002982 <mycpu>
    800034d0:	872a                	mv	a4,a0
    800034d2:	fd442783          	lw	a5,-44(s0)
    800034d6:	df7c                	sw	a5,124(a4)
}
    800034d8:	0001                	nop
    800034da:	70a2                	ld	ra,40(sp)
    800034dc:	7402                	ld	s0,32(sp)
    800034de:	64e2                	ld	s1,24(sp)
    800034e0:	6145                	addi	sp,sp,48
    800034e2:	8082                	ret

00000000800034e4 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800034e4:	1101                	addi	sp,sp,-32
    800034e6:	ec06                	sd	ra,24(sp)
    800034e8:	e822                	sd	s0,16(sp)
    800034ea:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800034ec:	fffff097          	auipc	ra,0xfffff
    800034f0:	4d0080e7          	jalr	1232(ra) # 800029bc <myproc>
    800034f4:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800034f8:	fe843783          	ld	a5,-24(s0)
    800034fc:	853e                	mv	a0,a5
    800034fe:	ffffe097          	auipc	ra,0xffffe
    80003502:	e2c080e7          	jalr	-468(ra) # 8000132a <acquire>
  p->state = RUNNABLE;
    80003506:	fe843783          	ld	a5,-24(s0)
    8000350a:	470d                	li	a4,3
    8000350c:	cf98                	sw	a4,24(a5)
  sched();
    8000350e:	00000097          	auipc	ra,0x0
    80003512:	ef4080e7          	jalr	-268(ra) # 80003402 <sched>
  release(&p->lock);
    80003516:	fe843783          	ld	a5,-24(s0)
    8000351a:	853e                	mv	a0,a5
    8000351c:	ffffe097          	auipc	ra,0xffffe
    80003520:	e72080e7          	jalr	-398(ra) # 8000138e <release>
}
    80003524:	0001                	nop
    80003526:	60e2                	ld	ra,24(sp)
    80003528:	6442                	ld	s0,16(sp)
    8000352a:	6105                	addi	sp,sp,32
    8000352c:	8082                	ret

000000008000352e <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    8000352e:	1141                	addi	sp,sp,-16
    80003530:	e406                	sd	ra,8(sp)
    80003532:	e022                	sd	s0,0(sp)
    80003534:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003536:	fffff097          	auipc	ra,0xfffff
    8000353a:	486080e7          	jalr	1158(ra) # 800029bc <myproc>
    8000353e:	87aa                	mv	a5,a0
    80003540:	853e                	mv	a0,a5
    80003542:	ffffe097          	auipc	ra,0xffffe
    80003546:	e4c080e7          	jalr	-436(ra) # 8000138e <release>

  if (first) {
    8000354a:	00008797          	auipc	a5,0x8
    8000354e:	27a78793          	addi	a5,a5,634 # 8000b7c4 <first.1699>
    80003552:	439c                	lw	a5,0(a5)
    80003554:	cf81                	beqz	a5,8000356c <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003556:	00008797          	auipc	a5,0x8
    8000355a:	26e78793          	addi	a5,a5,622 # 8000b7c4 <first.1699>
    8000355e:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003562:	4505                	li	a0,1
    80003564:	00001097          	auipc	ra,0x1
    80003568:	528080e7          	jalr	1320(ra) # 80004a8c <fsinit>
  }

  usertrapret();
    8000356c:	00000097          	auipc	ra,0x0
    80003570:	7dc080e7          	jalr	2012(ra) # 80003d48 <usertrapret>
}
    80003574:	0001                	nop
    80003576:	60a2                	ld	ra,8(sp)
    80003578:	6402                	ld	s0,0(sp)
    8000357a:	0141                	addi	sp,sp,16
    8000357c:	8082                	ret

000000008000357e <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    8000357e:	7179                	addi	sp,sp,-48
    80003580:	f406                	sd	ra,40(sp)
    80003582:	f022                	sd	s0,32(sp)
    80003584:	1800                	addi	s0,sp,48
    80003586:	fca43c23          	sd	a0,-40(s0)
    8000358a:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000358e:	fffff097          	auipc	ra,0xfffff
    80003592:	42e080e7          	jalr	1070(ra) # 800029bc <myproc>
    80003596:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    8000359a:	fe843783          	ld	a5,-24(s0)
    8000359e:	853e                	mv	a0,a5
    800035a0:	ffffe097          	auipc	ra,0xffffe
    800035a4:	d8a080e7          	jalr	-630(ra) # 8000132a <acquire>
  release(lk);
    800035a8:	fd043503          	ld	a0,-48(s0)
    800035ac:	ffffe097          	auipc	ra,0xffffe
    800035b0:	de2080e7          	jalr	-542(ra) # 8000138e <release>

  // Go to sleep.
  p->chan = chan;
    800035b4:	fe843783          	ld	a5,-24(s0)
    800035b8:	fd843703          	ld	a4,-40(s0)
    800035bc:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    800035be:	fe843783          	ld	a5,-24(s0)
    800035c2:	4709                	li	a4,2
    800035c4:	cf98                	sw	a4,24(a5)

  sched();
    800035c6:	00000097          	auipc	ra,0x0
    800035ca:	e3c080e7          	jalr	-452(ra) # 80003402 <sched>

  // Tidy up.
  p->chan = 0;
    800035ce:	fe843783          	ld	a5,-24(s0)
    800035d2:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800035d6:	fe843783          	ld	a5,-24(s0)
    800035da:	853e                	mv	a0,a5
    800035dc:	ffffe097          	auipc	ra,0xffffe
    800035e0:	db2080e7          	jalr	-590(ra) # 8000138e <release>
  acquire(lk);
    800035e4:	fd043503          	ld	a0,-48(s0)
    800035e8:	ffffe097          	auipc	ra,0xffffe
    800035ec:	d42080e7          	jalr	-702(ra) # 8000132a <acquire>
}
    800035f0:	0001                	nop
    800035f2:	70a2                	ld	ra,40(sp)
    800035f4:	7402                	ld	s0,32(sp)
    800035f6:	6145                	addi	sp,sp,48
    800035f8:	8082                	ret

00000000800035fa <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800035fa:	7179                	addi	sp,sp,-48
    800035fc:	f406                	sd	ra,40(sp)
    800035fe:	f022                	sd	s0,32(sp)
    80003600:	1800                	addi	s0,sp,48
    80003602:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80003606:	00021797          	auipc	a5,0x21
    8000360a:	9b278793          	addi	a5,a5,-1614 # 80023fb8 <proc>
    8000360e:	fef43423          	sd	a5,-24(s0)
    80003612:	a051                	j	80003696 <wakeup+0x9c>
    if(p != myproc()){
    80003614:	fffff097          	auipc	ra,0xfffff
    80003618:	3a8080e7          	jalr	936(ra) # 800029bc <myproc>
    8000361c:	872a                	mv	a4,a0
    8000361e:	fe843783          	ld	a5,-24(s0)
    80003622:	06e78463          	beq	a5,a4,8000368a <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    80003626:	fe843783          	ld	a5,-24(s0)
    8000362a:	853e                	mv	a0,a5
    8000362c:	ffffe097          	auipc	ra,0xffffe
    80003630:	db8080e7          	jalr	-584(ra) # 800013e4 <holding>
    80003634:	87aa                	mv	a5,a0
    80003636:	cb81                	beqz	a5,80003646 <wakeup+0x4c>
    80003638:	fe843783          	ld	a5,-24(s0)
    8000363c:	4f9c                	lw	a5,24(a5)
    8000363e:	873e                	mv	a4,a5
    80003640:	4785                	li	a5,1
    80003642:	04f70363          	beq	a4,a5,80003688 <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    80003646:	fe843783          	ld	a5,-24(s0)
    8000364a:	853e                	mv	a0,a5
    8000364c:	ffffe097          	auipc	ra,0xffffe
    80003650:	cde080e7          	jalr	-802(ra) # 8000132a <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80003654:	fe843783          	ld	a5,-24(s0)
    80003658:	4f9c                	lw	a5,24(a5)
    8000365a:	873e                	mv	a4,a5
    8000365c:	4789                	li	a5,2
    8000365e:	00f71d63          	bne	a4,a5,80003678 <wakeup+0x7e>
    80003662:	fe843783          	ld	a5,-24(s0)
    80003666:	739c                	ld	a5,32(a5)
    80003668:	fd843703          	ld	a4,-40(s0)
    8000366c:	00f71663          	bne	a4,a5,80003678 <wakeup+0x7e>
        p->state = RUNNABLE;
    80003670:	fe843783          	ld	a5,-24(s0)
    80003674:	470d                	li	a4,3
    80003676:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003678:	fe843783          	ld	a5,-24(s0)
    8000367c:	853e                	mv	a0,a5
    8000367e:	ffffe097          	auipc	ra,0xffffe
    80003682:	d10080e7          	jalr	-752(ra) # 8000138e <release>
    80003686:	a011                	j	8000368a <wakeup+0x90>
        continue;
    80003688:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    8000368a:	fe843783          	ld	a5,-24(s0)
    8000368e:	16878793          	addi	a5,a5,360
    80003692:	fef43423          	sd	a5,-24(s0)
    80003696:	fe843703          	ld	a4,-24(s0)
    8000369a:	00026797          	auipc	a5,0x26
    8000369e:	31e78793          	addi	a5,a5,798 # 800299b8 <pid_lock>
    800036a2:	f6f769e3          	bltu	a4,a5,80003614 <wakeup+0x1a>
    }
  }
}
    800036a6:	0001                	nop
    800036a8:	0001                	nop
    800036aa:	70a2                	ld	ra,40(sp)
    800036ac:	7402                	ld	s0,32(sp)
    800036ae:	6145                	addi	sp,sp,48
    800036b0:	8082                	ret

00000000800036b2 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    800036b2:	7179                	addi	sp,sp,-48
    800036b4:	f406                	sd	ra,40(sp)
    800036b6:	f022                	sd	s0,32(sp)
    800036b8:	1800                	addi	s0,sp,48
    800036ba:	87aa                	mv	a5,a0
    800036bc:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    800036c0:	00021797          	auipc	a5,0x21
    800036c4:	8f878793          	addi	a5,a5,-1800 # 80023fb8 <proc>
    800036c8:	fef43423          	sd	a5,-24(s0)
    800036cc:	a0ad                	j	80003736 <kill+0x84>
    acquire(&p->lock);
    800036ce:	fe843783          	ld	a5,-24(s0)
    800036d2:	853e                	mv	a0,a5
    800036d4:	ffffe097          	auipc	ra,0xffffe
    800036d8:	c56080e7          	jalr	-938(ra) # 8000132a <acquire>
    if(p->pid == pid){
    800036dc:	fe843783          	ld	a5,-24(s0)
    800036e0:	5b98                	lw	a4,48(a5)
    800036e2:	fdc42783          	lw	a5,-36(s0)
    800036e6:	2781                	sext.w	a5,a5
    800036e8:	02e79a63          	bne	a5,a4,8000371c <kill+0x6a>
      p->killed = 1;
    800036ec:	fe843783          	ld	a5,-24(s0)
    800036f0:	4705                	li	a4,1
    800036f2:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800036f4:	fe843783          	ld	a5,-24(s0)
    800036f8:	4f9c                	lw	a5,24(a5)
    800036fa:	873e                	mv	a4,a5
    800036fc:	4789                	li	a5,2
    800036fe:	00f71663          	bne	a4,a5,8000370a <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003702:	fe843783          	ld	a5,-24(s0)
    80003706:	470d                	li	a4,3
    80003708:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    8000370a:	fe843783          	ld	a5,-24(s0)
    8000370e:	853e                	mv	a0,a5
    80003710:	ffffe097          	auipc	ra,0xffffe
    80003714:	c7e080e7          	jalr	-898(ra) # 8000138e <release>
      return 0;
    80003718:	4781                	li	a5,0
    8000371a:	a03d                	j	80003748 <kill+0x96>
    }
    release(&p->lock);
    8000371c:	fe843783          	ld	a5,-24(s0)
    80003720:	853e                	mv	a0,a5
    80003722:	ffffe097          	auipc	ra,0xffffe
    80003726:	c6c080e7          	jalr	-916(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++){
    8000372a:	fe843783          	ld	a5,-24(s0)
    8000372e:	16878793          	addi	a5,a5,360
    80003732:	fef43423          	sd	a5,-24(s0)
    80003736:	fe843703          	ld	a4,-24(s0)
    8000373a:	00026797          	auipc	a5,0x26
    8000373e:	27e78793          	addi	a5,a5,638 # 800299b8 <pid_lock>
    80003742:	f8f766e3          	bltu	a4,a5,800036ce <kill+0x1c>
  }
  return -1;
    80003746:	57fd                	li	a5,-1
}
    80003748:	853e                	mv	a0,a5
    8000374a:	70a2                	ld	ra,40(sp)
    8000374c:	7402                	ld	s0,32(sp)
    8000374e:	6145                	addi	sp,sp,48
    80003750:	8082                	ret

0000000080003752 <setkilled>:

void
setkilled(struct proc *p)
{
    80003752:	1101                	addi	sp,sp,-32
    80003754:	ec06                	sd	ra,24(sp)
    80003756:	e822                	sd	s0,16(sp)
    80003758:	1000                	addi	s0,sp,32
    8000375a:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000375e:	fe843783          	ld	a5,-24(s0)
    80003762:	853e                	mv	a0,a5
    80003764:	ffffe097          	auipc	ra,0xffffe
    80003768:	bc6080e7          	jalr	-1082(ra) # 8000132a <acquire>
  p->killed = 1;
    8000376c:	fe843783          	ld	a5,-24(s0)
    80003770:	4705                	li	a4,1
    80003772:	d798                	sw	a4,40(a5)
  release(&p->lock);
    80003774:	fe843783          	ld	a5,-24(s0)
    80003778:	853e                	mv	a0,a5
    8000377a:	ffffe097          	auipc	ra,0xffffe
    8000377e:	c14080e7          	jalr	-1004(ra) # 8000138e <release>
}
    80003782:	0001                	nop
    80003784:	60e2                	ld	ra,24(sp)
    80003786:	6442                	ld	s0,16(sp)
    80003788:	6105                	addi	sp,sp,32
    8000378a:	8082                	ret

000000008000378c <killed>:

int
killed(struct proc *p)
{
    8000378c:	7179                	addi	sp,sp,-48
    8000378e:	f406                	sd	ra,40(sp)
    80003790:	f022                	sd	s0,32(sp)
    80003792:	1800                	addi	s0,sp,48
    80003794:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    80003798:	fd843783          	ld	a5,-40(s0)
    8000379c:	853e                	mv	a0,a5
    8000379e:	ffffe097          	auipc	ra,0xffffe
    800037a2:	b8c080e7          	jalr	-1140(ra) # 8000132a <acquire>
  k = p->killed;
    800037a6:	fd843783          	ld	a5,-40(s0)
    800037aa:	579c                	lw	a5,40(a5)
    800037ac:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    800037b0:	fd843783          	ld	a5,-40(s0)
    800037b4:	853e                	mv	a0,a5
    800037b6:	ffffe097          	auipc	ra,0xffffe
    800037ba:	bd8080e7          	jalr	-1064(ra) # 8000138e <release>
  return k;
    800037be:	fec42783          	lw	a5,-20(s0)
}
    800037c2:	853e                	mv	a0,a5
    800037c4:	70a2                	ld	ra,40(sp)
    800037c6:	7402                	ld	s0,32(sp)
    800037c8:	6145                	addi	sp,sp,48
    800037ca:	8082                	ret

00000000800037cc <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    800037cc:	7139                	addi	sp,sp,-64
    800037ce:	fc06                	sd	ra,56(sp)
    800037d0:	f822                	sd	s0,48(sp)
    800037d2:	0080                	addi	s0,sp,64
    800037d4:	87aa                	mv	a5,a0
    800037d6:	fcb43823          	sd	a1,-48(s0)
    800037da:	fcc43423          	sd	a2,-56(s0)
    800037de:	fcd43023          	sd	a3,-64(s0)
    800037e2:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800037e6:	fffff097          	auipc	ra,0xfffff
    800037ea:	1d6080e7          	jalr	470(ra) # 800029bc <myproc>
    800037ee:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    800037f2:	fdc42783          	lw	a5,-36(s0)
    800037f6:	2781                	sext.w	a5,a5
    800037f8:	c38d                	beqz	a5,8000381a <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    800037fa:	fe843783          	ld	a5,-24(s0)
    800037fe:	6bbc                	ld	a5,80(a5)
    80003800:	fc043683          	ld	a3,-64(s0)
    80003804:	fc843603          	ld	a2,-56(s0)
    80003808:	fd043583          	ld	a1,-48(s0)
    8000380c:	853e                	mv	a0,a5
    8000380e:	fffff097          	auipc	ra,0xfffff
    80003812:	c78080e7          	jalr	-904(ra) # 80002486 <copyout>
    80003816:	87aa                	mv	a5,a0
    80003818:	a839                	j	80003836 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    8000381a:	fd043783          	ld	a5,-48(s0)
    8000381e:	fc043703          	ld	a4,-64(s0)
    80003822:	2701                	sext.w	a4,a4
    80003824:	863a                	mv	a2,a4
    80003826:	fc843583          	ld	a1,-56(s0)
    8000382a:	853e                	mv	a0,a5
    8000382c:	ffffe097          	auipc	ra,0xffffe
    80003830:	db6080e7          	jalr	-586(ra) # 800015e2 <memmove>
    return 0;
    80003834:	4781                	li	a5,0
  }
}
    80003836:	853e                	mv	a0,a5
    80003838:	70e2                	ld	ra,56(sp)
    8000383a:	7442                	ld	s0,48(sp)
    8000383c:	6121                	addi	sp,sp,64
    8000383e:	8082                	ret

0000000080003840 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003840:	7139                	addi	sp,sp,-64
    80003842:	fc06                	sd	ra,56(sp)
    80003844:	f822                	sd	s0,48(sp)
    80003846:	0080                	addi	s0,sp,64
    80003848:	fca43c23          	sd	a0,-40(s0)
    8000384c:	87ae                	mv	a5,a1
    8000384e:	fcc43423          	sd	a2,-56(s0)
    80003852:	fcd43023          	sd	a3,-64(s0)
    80003856:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    8000385a:	fffff097          	auipc	ra,0xfffff
    8000385e:	162080e7          	jalr	354(ra) # 800029bc <myproc>
    80003862:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003866:	fd442783          	lw	a5,-44(s0)
    8000386a:	2781                	sext.w	a5,a5
    8000386c:	c38d                	beqz	a5,8000388e <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    8000386e:	fe843783          	ld	a5,-24(s0)
    80003872:	6bbc                	ld	a5,80(a5)
    80003874:	fc043683          	ld	a3,-64(s0)
    80003878:	fc843603          	ld	a2,-56(s0)
    8000387c:	fd843583          	ld	a1,-40(s0)
    80003880:	853e                	mv	a0,a5
    80003882:	fffff097          	auipc	ra,0xfffff
    80003886:	cd2080e7          	jalr	-814(ra) # 80002554 <copyin>
    8000388a:	87aa                	mv	a5,a0
    8000388c:	a839                	j	800038aa <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    8000388e:	fc843783          	ld	a5,-56(s0)
    80003892:	fc043703          	ld	a4,-64(s0)
    80003896:	2701                	sext.w	a4,a4
    80003898:	863a                	mv	a2,a4
    8000389a:	85be                	mv	a1,a5
    8000389c:	fd843503          	ld	a0,-40(s0)
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	d42080e7          	jalr	-702(ra) # 800015e2 <memmove>
    return 0;
    800038a8:	4781                	li	a5,0
  }
}
    800038aa:	853e                	mv	a0,a5
    800038ac:	70e2                	ld	ra,56(sp)
    800038ae:	7442                	ld	s0,48(sp)
    800038b0:	6121                	addi	sp,sp,64
    800038b2:	8082                	ret

00000000800038b4 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    800038b4:	1101                	addi	sp,sp,-32
    800038b6:	ec06                	sd	ra,24(sp)
    800038b8:	e822                	sd	s0,16(sp)
    800038ba:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    800038bc:	00008517          	auipc	a0,0x8
    800038c0:	9c450513          	addi	a0,a0,-1596 # 8000b280 <etext+0x280>
    800038c4:	ffffd097          	auipc	ra,0xffffd
    800038c8:	172080e7          	jalr	370(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    800038cc:	00020797          	auipc	a5,0x20
    800038d0:	6ec78793          	addi	a5,a5,1772 # 80023fb8 <proc>
    800038d4:	fef43423          	sd	a5,-24(s0)
    800038d8:	a04d                	j	8000397a <procdump+0xc6>
    if(p->state == UNUSED)
    800038da:	fe843783          	ld	a5,-24(s0)
    800038de:	4f9c                	lw	a5,24(a5)
    800038e0:	c7d1                	beqz	a5,8000396c <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    800038e2:	fe843783          	ld	a5,-24(s0)
    800038e6:	4f9c                	lw	a5,24(a5)
    800038e8:	873e                	mv	a4,a5
    800038ea:	4795                	li	a5,5
    800038ec:	02e7ee63          	bltu	a5,a4,80003928 <procdump+0x74>
    800038f0:	fe843783          	ld	a5,-24(s0)
    800038f4:	4f9c                	lw	a5,24(a5)
    800038f6:	00008717          	auipc	a4,0x8
    800038fa:	f2a70713          	addi	a4,a4,-214 # 8000b820 <states.1744>
    800038fe:	1782                	slli	a5,a5,0x20
    80003900:	9381                	srli	a5,a5,0x20
    80003902:	078e                	slli	a5,a5,0x3
    80003904:	97ba                	add	a5,a5,a4
    80003906:	639c                	ld	a5,0(a5)
    80003908:	c385                	beqz	a5,80003928 <procdump+0x74>
      state = states[p->state];
    8000390a:	fe843783          	ld	a5,-24(s0)
    8000390e:	4f9c                	lw	a5,24(a5)
    80003910:	00008717          	auipc	a4,0x8
    80003914:	f1070713          	addi	a4,a4,-240 # 8000b820 <states.1744>
    80003918:	1782                	slli	a5,a5,0x20
    8000391a:	9381                	srli	a5,a5,0x20
    8000391c:	078e                	slli	a5,a5,0x3
    8000391e:	97ba                	add	a5,a5,a4
    80003920:	639c                	ld	a5,0(a5)
    80003922:	fef43023          	sd	a5,-32(s0)
    80003926:	a039                	j	80003934 <procdump+0x80>
    else
      state = "???";
    80003928:	00008797          	auipc	a5,0x8
    8000392c:	96078793          	addi	a5,a5,-1696 # 8000b288 <etext+0x288>
    80003930:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003934:	fe843783          	ld	a5,-24(s0)
    80003938:	5b98                	lw	a4,48(a5)
    8000393a:	fe843783          	ld	a5,-24(s0)
    8000393e:	15878793          	addi	a5,a5,344
    80003942:	86be                	mv	a3,a5
    80003944:	fe043603          	ld	a2,-32(s0)
    80003948:	85ba                	mv	a1,a4
    8000394a:	00008517          	auipc	a0,0x8
    8000394e:	94650513          	addi	a0,a0,-1722 # 8000b290 <etext+0x290>
    80003952:	ffffd097          	auipc	ra,0xffffd
    80003956:	0e4080e7          	jalr	228(ra) # 80000a36 <printf>
    printf("\n");
    8000395a:	00008517          	auipc	a0,0x8
    8000395e:	92650513          	addi	a0,a0,-1754 # 8000b280 <etext+0x280>
    80003962:	ffffd097          	auipc	ra,0xffffd
    80003966:	0d4080e7          	jalr	212(ra) # 80000a36 <printf>
    8000396a:	a011                	j	8000396e <procdump+0xba>
      continue;
    8000396c:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    8000396e:	fe843783          	ld	a5,-24(s0)
    80003972:	16878793          	addi	a5,a5,360
    80003976:	fef43423          	sd	a5,-24(s0)
    8000397a:	fe843703          	ld	a4,-24(s0)
    8000397e:	00026797          	auipc	a5,0x26
    80003982:	03a78793          	addi	a5,a5,58 # 800299b8 <pid_lock>
    80003986:	f4f76ae3          	bltu	a4,a5,800038da <procdump+0x26>
  }
}
    8000398a:	0001                	nop
    8000398c:	0001                	nop
    8000398e:	60e2                	ld	ra,24(sp)
    80003990:	6442                	ld	s0,16(sp)
    80003992:	6105                	addi	sp,sp,32
    80003994:	8082                	ret

0000000080003996 <swtch>:
    80003996:	00153023          	sd	ra,0(a0)
    8000399a:	00253423          	sd	sp,8(a0)
    8000399e:	e900                	sd	s0,16(a0)
    800039a0:	ed04                	sd	s1,24(a0)
    800039a2:	03253023          	sd	s2,32(a0)
    800039a6:	03353423          	sd	s3,40(a0)
    800039aa:	03453823          	sd	s4,48(a0)
    800039ae:	03553c23          	sd	s5,56(a0)
    800039b2:	05653023          	sd	s6,64(a0)
    800039b6:	05753423          	sd	s7,72(a0)
    800039ba:	05853823          	sd	s8,80(a0)
    800039be:	05953c23          	sd	s9,88(a0)
    800039c2:	07a53023          	sd	s10,96(a0)
    800039c6:	07b53423          	sd	s11,104(a0)
    800039ca:	0005b083          	ld	ra,0(a1)
    800039ce:	0085b103          	ld	sp,8(a1)
    800039d2:	6980                	ld	s0,16(a1)
    800039d4:	6d84                	ld	s1,24(a1)
    800039d6:	0205b903          	ld	s2,32(a1)
    800039da:	0285b983          	ld	s3,40(a1)
    800039de:	0305ba03          	ld	s4,48(a1)
    800039e2:	0385ba83          	ld	s5,56(a1)
    800039e6:	0405bb03          	ld	s6,64(a1)
    800039ea:	0485bb83          	ld	s7,72(a1)
    800039ee:	0505bc03          	ld	s8,80(a1)
    800039f2:	0585bc83          	ld	s9,88(a1)
    800039f6:	0605bd03          	ld	s10,96(a1)
    800039fa:	0685bd83          	ld	s11,104(a1)
    800039fe:	8082                	ret

0000000080003a00 <r_sstatus>:
{
    80003a00:	1101                	addi	sp,sp,-32
    80003a02:	ec22                	sd	s0,24(sp)
    80003a04:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003a06:	100027f3          	csrr	a5,sstatus
    80003a0a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a0e:	fe843783          	ld	a5,-24(s0)
}
    80003a12:	853e                	mv	a0,a5
    80003a14:	6462                	ld	s0,24(sp)
    80003a16:	6105                	addi	sp,sp,32
    80003a18:	8082                	ret

0000000080003a1a <w_sstatus>:
{
    80003a1a:	1101                	addi	sp,sp,-32
    80003a1c:	ec22                	sd	s0,24(sp)
    80003a1e:	1000                	addi	s0,sp,32
    80003a20:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003a24:	fe843783          	ld	a5,-24(s0)
    80003a28:	10079073          	csrw	sstatus,a5
}
    80003a2c:	0001                	nop
    80003a2e:	6462                	ld	s0,24(sp)
    80003a30:	6105                	addi	sp,sp,32
    80003a32:	8082                	ret

0000000080003a34 <r_sip>:
{
    80003a34:	1101                	addi	sp,sp,-32
    80003a36:	ec22                	sd	s0,24(sp)
    80003a38:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003a3a:	144027f3          	csrr	a5,sip
    80003a3e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a42:	fe843783          	ld	a5,-24(s0)
}
    80003a46:	853e                	mv	a0,a5
    80003a48:	6462                	ld	s0,24(sp)
    80003a4a:	6105                	addi	sp,sp,32
    80003a4c:	8082                	ret

0000000080003a4e <w_sip>:
{
    80003a4e:	1101                	addi	sp,sp,-32
    80003a50:	ec22                	sd	s0,24(sp)
    80003a52:	1000                	addi	s0,sp,32
    80003a54:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003a58:	fe843783          	ld	a5,-24(s0)
    80003a5c:	14479073          	csrw	sip,a5
}
    80003a60:	0001                	nop
    80003a62:	6462                	ld	s0,24(sp)
    80003a64:	6105                	addi	sp,sp,32
    80003a66:	8082                	ret

0000000080003a68 <w_sepc>:
{
    80003a68:	1101                	addi	sp,sp,-32
    80003a6a:	ec22                	sd	s0,24(sp)
    80003a6c:	1000                	addi	s0,sp,32
    80003a6e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003a72:	fe843783          	ld	a5,-24(s0)
    80003a76:	14179073          	csrw	sepc,a5
}
    80003a7a:	0001                	nop
    80003a7c:	6462                	ld	s0,24(sp)
    80003a7e:	6105                	addi	sp,sp,32
    80003a80:	8082                	ret

0000000080003a82 <r_sepc>:
{
    80003a82:	1101                	addi	sp,sp,-32
    80003a84:	ec22                	sd	s0,24(sp)
    80003a86:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003a88:	141027f3          	csrr	a5,sepc
    80003a8c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a90:	fe843783          	ld	a5,-24(s0)
}
    80003a94:	853e                	mv	a0,a5
    80003a96:	6462                	ld	s0,24(sp)
    80003a98:	6105                	addi	sp,sp,32
    80003a9a:	8082                	ret

0000000080003a9c <w_stvec>:
{
    80003a9c:	1101                	addi	sp,sp,-32
    80003a9e:	ec22                	sd	s0,24(sp)
    80003aa0:	1000                	addi	s0,sp,32
    80003aa2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003aa6:	fe843783          	ld	a5,-24(s0)
    80003aaa:	10579073          	csrw	stvec,a5
}
    80003aae:	0001                	nop
    80003ab0:	6462                	ld	s0,24(sp)
    80003ab2:	6105                	addi	sp,sp,32
    80003ab4:	8082                	ret

0000000080003ab6 <r_satp>:
{
    80003ab6:	1101                	addi	sp,sp,-32
    80003ab8:	ec22                	sd	s0,24(sp)
    80003aba:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003abc:	180027f3          	csrr	a5,satp
    80003ac0:	fef43423          	sd	a5,-24(s0)
  return x;
    80003ac4:	fe843783          	ld	a5,-24(s0)
}
    80003ac8:	853e                	mv	a0,a5
    80003aca:	6462                	ld	s0,24(sp)
    80003acc:	6105                	addi	sp,sp,32
    80003ace:	8082                	ret

0000000080003ad0 <r_scause>:
{
    80003ad0:	1101                	addi	sp,sp,-32
    80003ad2:	ec22                	sd	s0,24(sp)
    80003ad4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003ad6:	142027f3          	csrr	a5,scause
    80003ada:	fef43423          	sd	a5,-24(s0)
  return x;
    80003ade:	fe843783          	ld	a5,-24(s0)
}
    80003ae2:	853e                	mv	a0,a5
    80003ae4:	6462                	ld	s0,24(sp)
    80003ae6:	6105                	addi	sp,sp,32
    80003ae8:	8082                	ret

0000000080003aea <r_stval>:
{
    80003aea:	1101                	addi	sp,sp,-32
    80003aec:	ec22                	sd	s0,24(sp)
    80003aee:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003af0:	143027f3          	csrr	a5,stval
    80003af4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003af8:	fe843783          	ld	a5,-24(s0)
}
    80003afc:	853e                	mv	a0,a5
    80003afe:	6462                	ld	s0,24(sp)
    80003b00:	6105                	addi	sp,sp,32
    80003b02:	8082                	ret

0000000080003b04 <intr_on>:
{
    80003b04:	1141                	addi	sp,sp,-16
    80003b06:	e406                	sd	ra,8(sp)
    80003b08:	e022                	sd	s0,0(sp)
    80003b0a:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003b0c:	00000097          	auipc	ra,0x0
    80003b10:	ef4080e7          	jalr	-268(ra) # 80003a00 <r_sstatus>
    80003b14:	87aa                	mv	a5,a0
    80003b16:	0027e793          	ori	a5,a5,2
    80003b1a:	853e                	mv	a0,a5
    80003b1c:	00000097          	auipc	ra,0x0
    80003b20:	efe080e7          	jalr	-258(ra) # 80003a1a <w_sstatus>
}
    80003b24:	0001                	nop
    80003b26:	60a2                	ld	ra,8(sp)
    80003b28:	6402                	ld	s0,0(sp)
    80003b2a:	0141                	addi	sp,sp,16
    80003b2c:	8082                	ret

0000000080003b2e <intr_off>:
{
    80003b2e:	1141                	addi	sp,sp,-16
    80003b30:	e406                	sd	ra,8(sp)
    80003b32:	e022                	sd	s0,0(sp)
    80003b34:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003b36:	00000097          	auipc	ra,0x0
    80003b3a:	eca080e7          	jalr	-310(ra) # 80003a00 <r_sstatus>
    80003b3e:	87aa                	mv	a5,a0
    80003b40:	9bf5                	andi	a5,a5,-3
    80003b42:	853e                	mv	a0,a5
    80003b44:	00000097          	auipc	ra,0x0
    80003b48:	ed6080e7          	jalr	-298(ra) # 80003a1a <w_sstatus>
}
    80003b4c:	0001                	nop
    80003b4e:	60a2                	ld	ra,8(sp)
    80003b50:	6402                	ld	s0,0(sp)
    80003b52:	0141                	addi	sp,sp,16
    80003b54:	8082                	ret

0000000080003b56 <intr_get>:
{
    80003b56:	1101                	addi	sp,sp,-32
    80003b58:	ec06                	sd	ra,24(sp)
    80003b5a:	e822                	sd	s0,16(sp)
    80003b5c:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003b5e:	00000097          	auipc	ra,0x0
    80003b62:	ea2080e7          	jalr	-350(ra) # 80003a00 <r_sstatus>
    80003b66:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003b6a:	fe843783          	ld	a5,-24(s0)
    80003b6e:	8b89                	andi	a5,a5,2
    80003b70:	00f037b3          	snez	a5,a5
    80003b74:	0ff7f793          	andi	a5,a5,255
    80003b78:	2781                	sext.w	a5,a5
}
    80003b7a:	853e                	mv	a0,a5
    80003b7c:	60e2                	ld	ra,24(sp)
    80003b7e:	6442                	ld	s0,16(sp)
    80003b80:	6105                	addi	sp,sp,32
    80003b82:	8082                	ret

0000000080003b84 <r_tp>:
{
    80003b84:	1101                	addi	sp,sp,-32
    80003b86:	ec22                	sd	s0,24(sp)
    80003b88:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003b8a:	8792                	mv	a5,tp
    80003b8c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b90:	fe843783          	ld	a5,-24(s0)
}
    80003b94:	853e                	mv	a0,a5
    80003b96:	6462                	ld	s0,24(sp)
    80003b98:	6105                	addi	sp,sp,32
    80003b9a:	8082                	ret

0000000080003b9c <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003b9c:	1141                	addi	sp,sp,-16
    80003b9e:	e406                	sd	ra,8(sp)
    80003ba0:	e022                	sd	s0,0(sp)
    80003ba2:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003ba4:	00007597          	auipc	a1,0x7
    80003ba8:	73458593          	addi	a1,a1,1844 # 8000b2d8 <etext+0x2d8>
    80003bac:	00026517          	auipc	a0,0x26
    80003bb0:	e3c50513          	addi	a0,a0,-452 # 800299e8 <tickslock>
    80003bb4:	ffffd097          	auipc	ra,0xffffd
    80003bb8:	746080e7          	jalr	1862(ra) # 800012fa <initlock>
}
    80003bbc:	0001                	nop
    80003bbe:	60a2                	ld	ra,8(sp)
    80003bc0:	6402                	ld	s0,0(sp)
    80003bc2:	0141                	addi	sp,sp,16
    80003bc4:	8082                	ret

0000000080003bc6 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003bc6:	1141                	addi	sp,sp,-16
    80003bc8:	e406                	sd	ra,8(sp)
    80003bca:	e022                	sd	s0,0(sp)
    80003bcc:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003bce:	00005797          	auipc	a5,0x5
    80003bd2:	da278793          	addi	a5,a5,-606 # 80008970 <kernelvec>
    80003bd6:	853e                	mv	a0,a5
    80003bd8:	00000097          	auipc	ra,0x0
    80003bdc:	ec4080e7          	jalr	-316(ra) # 80003a9c <w_stvec>
}
    80003be0:	0001                	nop
    80003be2:	60a2                	ld	ra,8(sp)
    80003be4:	6402                	ld	s0,0(sp)
    80003be6:	0141                	addi	sp,sp,16
    80003be8:	8082                	ret

0000000080003bea <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003bea:	7179                	addi	sp,sp,-48
    80003bec:	f406                	sd	ra,40(sp)
    80003bee:	f022                	sd	s0,32(sp)
    80003bf0:	ec26                	sd	s1,24(sp)
    80003bf2:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003bf4:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003bf8:	00000097          	auipc	ra,0x0
    80003bfc:	e08080e7          	jalr	-504(ra) # 80003a00 <r_sstatus>
    80003c00:	87aa                	mv	a5,a0
    80003c02:	1007f793          	andi	a5,a5,256
    80003c06:	cb89                	beqz	a5,80003c18 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003c08:	00007517          	auipc	a0,0x7
    80003c0c:	6d850513          	addi	a0,a0,1752 # 8000b2e0 <etext+0x2e0>
    80003c10:	ffffd097          	auipc	ra,0xffffd
    80003c14:	07c080e7          	jalr	124(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003c18:	00005797          	auipc	a5,0x5
    80003c1c:	d5878793          	addi	a5,a5,-680 # 80008970 <kernelvec>
    80003c20:	853e                	mv	a0,a5
    80003c22:	00000097          	auipc	ra,0x0
    80003c26:	e7a080e7          	jalr	-390(ra) # 80003a9c <w_stvec>

  struct proc *p = myproc();
    80003c2a:	fffff097          	auipc	ra,0xfffff
    80003c2e:	d92080e7          	jalr	-622(ra) # 800029bc <myproc>
    80003c32:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003c36:	fd043783          	ld	a5,-48(s0)
    80003c3a:	6fa4                	ld	s1,88(a5)
    80003c3c:	00000097          	auipc	ra,0x0
    80003c40:	e46080e7          	jalr	-442(ra) # 80003a82 <r_sepc>
    80003c44:	87aa                	mv	a5,a0
    80003c46:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003c48:	00000097          	auipc	ra,0x0
    80003c4c:	e88080e7          	jalr	-376(ra) # 80003ad0 <r_scause>
    80003c50:	872a                	mv	a4,a0
    80003c52:	47a1                	li	a5,8
    80003c54:	04f71163          	bne	a4,a5,80003c96 <usertrap+0xac>
    // system call

    if(killed(p))
    80003c58:	fd043503          	ld	a0,-48(s0)
    80003c5c:	00000097          	auipc	ra,0x0
    80003c60:	b30080e7          	jalr	-1232(ra) # 8000378c <killed>
    80003c64:	87aa                	mv	a5,a0
    80003c66:	c791                	beqz	a5,80003c72 <usertrap+0x88>
      exit(-1);
    80003c68:	557d                	li	a0,-1
    80003c6a:	fffff097          	auipc	ra,0xfffff
    80003c6e:	444080e7          	jalr	1092(ra) # 800030ae <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003c72:	fd043783          	ld	a5,-48(s0)
    80003c76:	6fbc                	ld	a5,88(a5)
    80003c78:	6f98                	ld	a4,24(a5)
    80003c7a:	fd043783          	ld	a5,-48(s0)
    80003c7e:	6fbc                	ld	a5,88(a5)
    80003c80:	0711                	addi	a4,a4,4
    80003c82:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003c84:	00000097          	auipc	ra,0x0
    80003c88:	e80080e7          	jalr	-384(ra) # 80003b04 <intr_on>

    syscall();
    80003c8c:	00000097          	auipc	ra,0x0
    80003c90:	688080e7          	jalr	1672(ra) # 80004314 <syscall>
    80003c94:	a885                	j	80003d04 <usertrap+0x11a>
  } else if((which_dev = devintr()) != 0){
    80003c96:	00000097          	auipc	ra,0x0
    80003c9a:	34e080e7          	jalr	846(ra) # 80003fe4 <devintr>
    80003c9e:	87aa                	mv	a5,a0
    80003ca0:	fcf42e23          	sw	a5,-36(s0)
    80003ca4:	fdc42783          	lw	a5,-36(s0)
    80003ca8:	2781                	sext.w	a5,a5
    80003caa:	efa9                	bnez	a5,80003d04 <usertrap+0x11a>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003cac:	00000097          	auipc	ra,0x0
    80003cb0:	e24080e7          	jalr	-476(ra) # 80003ad0 <r_scause>
    80003cb4:	872a                	mv	a4,a0
    80003cb6:	fd043783          	ld	a5,-48(s0)
    80003cba:	5b9c                	lw	a5,48(a5)
    80003cbc:	863e                	mv	a2,a5
    80003cbe:	85ba                	mv	a1,a4
    80003cc0:	00007517          	auipc	a0,0x7
    80003cc4:	64050513          	addi	a0,a0,1600 # 8000b300 <etext+0x300>
    80003cc8:	ffffd097          	auipc	ra,0xffffd
    80003ccc:	d6e080e7          	jalr	-658(ra) # 80000a36 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003cd0:	00000097          	auipc	ra,0x0
    80003cd4:	db2080e7          	jalr	-590(ra) # 80003a82 <r_sepc>
    80003cd8:	84aa                	mv	s1,a0
    80003cda:	00000097          	auipc	ra,0x0
    80003cde:	e10080e7          	jalr	-496(ra) # 80003aea <r_stval>
    80003ce2:	87aa                	mv	a5,a0
    80003ce4:	863e                	mv	a2,a5
    80003ce6:	85a6                	mv	a1,s1
    80003ce8:	00007517          	auipc	a0,0x7
    80003cec:	64850513          	addi	a0,a0,1608 # 8000b330 <etext+0x330>
    80003cf0:	ffffd097          	auipc	ra,0xffffd
    80003cf4:	d46080e7          	jalr	-698(ra) # 80000a36 <printf>
    setkilled(p);
    80003cf8:	fd043503          	ld	a0,-48(s0)
    80003cfc:	00000097          	auipc	ra,0x0
    80003d00:	a56080e7          	jalr	-1450(ra) # 80003752 <setkilled>
  }

  if(killed(p))
    80003d04:	fd043503          	ld	a0,-48(s0)
    80003d08:	00000097          	auipc	ra,0x0
    80003d0c:	a84080e7          	jalr	-1404(ra) # 8000378c <killed>
    80003d10:	87aa                	mv	a5,a0
    80003d12:	c791                	beqz	a5,80003d1e <usertrap+0x134>
    exit(-1);
    80003d14:	557d                	li	a0,-1
    80003d16:	fffff097          	auipc	ra,0xfffff
    80003d1a:	398080e7          	jalr	920(ra) # 800030ae <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003d1e:	fdc42783          	lw	a5,-36(s0)
    80003d22:	0007871b          	sext.w	a4,a5
    80003d26:	4789                	li	a5,2
    80003d28:	00f71663          	bne	a4,a5,80003d34 <usertrap+0x14a>
    yield();
    80003d2c:	fffff097          	auipc	ra,0xfffff
    80003d30:	7b8080e7          	jalr	1976(ra) # 800034e4 <yield>

  usertrapret();
    80003d34:	00000097          	auipc	ra,0x0
    80003d38:	014080e7          	jalr	20(ra) # 80003d48 <usertrapret>
}
    80003d3c:	0001                	nop
    80003d3e:	70a2                	ld	ra,40(sp)
    80003d40:	7402                	ld	s0,32(sp)
    80003d42:	64e2                	ld	s1,24(sp)
    80003d44:	6145                	addi	sp,sp,48
    80003d46:	8082                	ret

0000000080003d48 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003d48:	715d                	addi	sp,sp,-80
    80003d4a:	e486                	sd	ra,72(sp)
    80003d4c:	e0a2                	sd	s0,64(sp)
    80003d4e:	fc26                	sd	s1,56(sp)
    80003d50:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003d52:	fffff097          	auipc	ra,0xfffff
    80003d56:	c6a080e7          	jalr	-918(ra) # 800029bc <myproc>
    80003d5a:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003d5e:	00000097          	auipc	ra,0x0
    80003d62:	dd0080e7          	jalr	-560(ra) # 80003b2e <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003d66:	00006717          	auipc	a4,0x6
    80003d6a:	29a70713          	addi	a4,a4,666 # 8000a000 <_trampoline>
    80003d6e:	00006797          	auipc	a5,0x6
    80003d72:	29278793          	addi	a5,a5,658 # 8000a000 <_trampoline>
    80003d76:	8f1d                	sub	a4,a4,a5
    80003d78:	040007b7          	lui	a5,0x4000
    80003d7c:	17fd                	addi	a5,a5,-1
    80003d7e:	07b2                	slli	a5,a5,0xc
    80003d80:	97ba                	add	a5,a5,a4
    80003d82:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003d86:	fd043503          	ld	a0,-48(s0)
    80003d8a:	00000097          	auipc	ra,0x0
    80003d8e:	d12080e7          	jalr	-750(ra) # 80003a9c <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003d92:	fd843783          	ld	a5,-40(s0)
    80003d96:	6fa4                	ld	s1,88(a5)
    80003d98:	00000097          	auipc	ra,0x0
    80003d9c:	d1e080e7          	jalr	-738(ra) # 80003ab6 <r_satp>
    80003da0:	87aa                	mv	a5,a0
    80003da2:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003da4:	fd843783          	ld	a5,-40(s0)
    80003da8:	63b4                	ld	a3,64(a5)
    80003daa:	fd843783          	ld	a5,-40(s0)
    80003dae:	6fbc                	ld	a5,88(a5)
    80003db0:	6705                	lui	a4,0x1
    80003db2:	9736                	add	a4,a4,a3
    80003db4:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003db6:	fd843783          	ld	a5,-40(s0)
    80003dba:	6fbc                	ld	a5,88(a5)
    80003dbc:	00000717          	auipc	a4,0x0
    80003dc0:	e2e70713          	addi	a4,a4,-466 # 80003bea <usertrap>
    80003dc4:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003dc6:	fd843783          	ld	a5,-40(s0)
    80003dca:	6fa4                	ld	s1,88(a5)
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	db8080e7          	jalr	-584(ra) # 80003b84 <r_tp>
    80003dd4:	87aa                	mv	a5,a0
    80003dd6:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003dd8:	00000097          	auipc	ra,0x0
    80003ddc:	c28080e7          	jalr	-984(ra) # 80003a00 <r_sstatus>
    80003de0:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003de4:	fc843783          	ld	a5,-56(s0)
    80003de8:	eff7f793          	andi	a5,a5,-257
    80003dec:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003df0:	fc843783          	ld	a5,-56(s0)
    80003df4:	0207e793          	ori	a5,a5,32
    80003df8:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003dfc:	fc843503          	ld	a0,-56(s0)
    80003e00:	00000097          	auipc	ra,0x0
    80003e04:	c1a080e7          	jalr	-998(ra) # 80003a1a <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003e08:	fd843783          	ld	a5,-40(s0)
    80003e0c:	6fbc                	ld	a5,88(a5)
    80003e0e:	6f9c                	ld	a5,24(a5)
    80003e10:	853e                	mv	a0,a5
    80003e12:	00000097          	auipc	ra,0x0
    80003e16:	c56080e7          	jalr	-938(ra) # 80003a68 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003e1a:	fd843783          	ld	a5,-40(s0)
    80003e1e:	6bbc                	ld	a5,80(a5)
    80003e20:	00c7d713          	srli	a4,a5,0xc
    80003e24:	57fd                	li	a5,-1
    80003e26:	17fe                	slli	a5,a5,0x3f
    80003e28:	8fd9                	or	a5,a5,a4
    80003e2a:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003e2e:	00006717          	auipc	a4,0x6
    80003e32:	26e70713          	addi	a4,a4,622 # 8000a09c <userret>
    80003e36:	00006797          	auipc	a5,0x6
    80003e3a:	1ca78793          	addi	a5,a5,458 # 8000a000 <_trampoline>
    80003e3e:	8f1d                	sub	a4,a4,a5
    80003e40:	040007b7          	lui	a5,0x4000
    80003e44:	17fd                	addi	a5,a5,-1
    80003e46:	07b2                	slli	a5,a5,0xc
    80003e48:	97ba                	add	a5,a5,a4
    80003e4a:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003e4e:	fb843783          	ld	a5,-72(s0)
    80003e52:	fc043503          	ld	a0,-64(s0)
    80003e56:	9782                	jalr	a5
}
    80003e58:	0001                	nop
    80003e5a:	60a6                	ld	ra,72(sp)
    80003e5c:	6406                	ld	s0,64(sp)
    80003e5e:	74e2                	ld	s1,56(sp)
    80003e60:	6161                	addi	sp,sp,80
    80003e62:	8082                	ret

0000000080003e64 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003e64:	7139                	addi	sp,sp,-64
    80003e66:	fc06                	sd	ra,56(sp)
    80003e68:	f822                	sd	s0,48(sp)
    80003e6a:	f426                	sd	s1,40(sp)
    80003e6c:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003e6e:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003e72:	00000097          	auipc	ra,0x0
    80003e76:	c10080e7          	jalr	-1008(ra) # 80003a82 <r_sepc>
    80003e7a:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003e7e:	00000097          	auipc	ra,0x0
    80003e82:	b82080e7          	jalr	-1150(ra) # 80003a00 <r_sstatus>
    80003e86:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003e8a:	00000097          	auipc	ra,0x0
    80003e8e:	c46080e7          	jalr	-954(ra) # 80003ad0 <r_scause>
    80003e92:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003e96:	fc843783          	ld	a5,-56(s0)
    80003e9a:	1007f793          	andi	a5,a5,256
    80003e9e:	eb89                	bnez	a5,80003eb0 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003ea0:	00007517          	auipc	a0,0x7
    80003ea4:	4b050513          	addi	a0,a0,1200 # 8000b350 <etext+0x350>
    80003ea8:	ffffd097          	auipc	ra,0xffffd
    80003eac:	de4080e7          	jalr	-540(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    80003eb0:	00000097          	auipc	ra,0x0
    80003eb4:	ca6080e7          	jalr	-858(ra) # 80003b56 <intr_get>
    80003eb8:	87aa                	mv	a5,a0
    80003eba:	cb89                	beqz	a5,80003ecc <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003ebc:	00007517          	auipc	a0,0x7
    80003ec0:	4bc50513          	addi	a0,a0,1212 # 8000b378 <etext+0x378>
    80003ec4:	ffffd097          	auipc	ra,0xffffd
    80003ec8:	dc8080e7          	jalr	-568(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    80003ecc:	00000097          	auipc	ra,0x0
    80003ed0:	118080e7          	jalr	280(ra) # 80003fe4 <devintr>
    80003ed4:	87aa                	mv	a5,a0
    80003ed6:	fcf42e23          	sw	a5,-36(s0)
    80003eda:	fdc42783          	lw	a5,-36(s0)
    80003ede:	2781                	sext.w	a5,a5
    80003ee0:	e7b9                	bnez	a5,80003f2e <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003ee2:	fc043583          	ld	a1,-64(s0)
    80003ee6:	00007517          	auipc	a0,0x7
    80003eea:	4b250513          	addi	a0,a0,1202 # 8000b398 <etext+0x398>
    80003eee:	ffffd097          	auipc	ra,0xffffd
    80003ef2:	b48080e7          	jalr	-1208(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003ef6:	00000097          	auipc	ra,0x0
    80003efa:	b8c080e7          	jalr	-1140(ra) # 80003a82 <r_sepc>
    80003efe:	84aa                	mv	s1,a0
    80003f00:	00000097          	auipc	ra,0x0
    80003f04:	bea080e7          	jalr	-1046(ra) # 80003aea <r_stval>
    80003f08:	87aa                	mv	a5,a0
    80003f0a:	863e                	mv	a2,a5
    80003f0c:	85a6                	mv	a1,s1
    80003f0e:	00007517          	auipc	a0,0x7
    80003f12:	49a50513          	addi	a0,a0,1178 # 8000b3a8 <etext+0x3a8>
    80003f16:	ffffd097          	auipc	ra,0xffffd
    80003f1a:	b20080e7          	jalr	-1248(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80003f1e:	00007517          	auipc	a0,0x7
    80003f22:	4a250513          	addi	a0,a0,1186 # 8000b3c0 <etext+0x3c0>
    80003f26:	ffffd097          	auipc	ra,0xffffd
    80003f2a:	d66080e7          	jalr	-666(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80003f2e:	fdc42783          	lw	a5,-36(s0)
    80003f32:	0007871b          	sext.w	a4,a5
    80003f36:	4789                	li	a5,2
    80003f38:	02f71663          	bne	a4,a5,80003f64 <kerneltrap+0x100>
    80003f3c:	fffff097          	auipc	ra,0xfffff
    80003f40:	a80080e7          	jalr	-1408(ra) # 800029bc <myproc>
    80003f44:	87aa                	mv	a5,a0
    80003f46:	cf99                	beqz	a5,80003f64 <kerneltrap+0x100>
    80003f48:	fffff097          	auipc	ra,0xfffff
    80003f4c:	a74080e7          	jalr	-1420(ra) # 800029bc <myproc>
    80003f50:	87aa                	mv	a5,a0
    80003f52:	4f9c                	lw	a5,24(a5)
    80003f54:	873e                	mv	a4,a5
    80003f56:	4791                	li	a5,4
    80003f58:	00f71663          	bne	a4,a5,80003f64 <kerneltrap+0x100>
    yield();
    80003f5c:	fffff097          	auipc	ra,0xfffff
    80003f60:	588080e7          	jalr	1416(ra) # 800034e4 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80003f64:	fd043503          	ld	a0,-48(s0)
    80003f68:	00000097          	auipc	ra,0x0
    80003f6c:	b00080e7          	jalr	-1280(ra) # 80003a68 <w_sepc>
  w_sstatus(sstatus);
    80003f70:	fc843503          	ld	a0,-56(s0)
    80003f74:	00000097          	auipc	ra,0x0
    80003f78:	aa6080e7          	jalr	-1370(ra) # 80003a1a <w_sstatus>
}
    80003f7c:	0001                	nop
    80003f7e:	70e2                	ld	ra,56(sp)
    80003f80:	7442                	ld	s0,48(sp)
    80003f82:	74a2                	ld	s1,40(sp)
    80003f84:	6121                	addi	sp,sp,64
    80003f86:	8082                	ret

0000000080003f88 <clockintr>:

void
clockintr()
{
    80003f88:	1141                	addi	sp,sp,-16
    80003f8a:	e406                	sd	ra,8(sp)
    80003f8c:	e022                	sd	s0,0(sp)
    80003f8e:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80003f90:	00026517          	auipc	a0,0x26
    80003f94:	a5850513          	addi	a0,a0,-1448 # 800299e8 <tickslock>
    80003f98:	ffffd097          	auipc	ra,0xffffd
    80003f9c:	392080e7          	jalr	914(ra) # 8000132a <acquire>
  ticks++;
    80003fa0:	00008797          	auipc	a5,0x8
    80003fa4:	9a878793          	addi	a5,a5,-1624 # 8000b948 <ticks>
    80003fa8:	439c                	lw	a5,0(a5)
    80003faa:	2785                	addiw	a5,a5,1
    80003fac:	0007871b          	sext.w	a4,a5
    80003fb0:	00008797          	auipc	a5,0x8
    80003fb4:	99878793          	addi	a5,a5,-1640 # 8000b948 <ticks>
    80003fb8:	c398                	sw	a4,0(a5)
  wakeup(&ticks);
    80003fba:	00008517          	auipc	a0,0x8
    80003fbe:	98e50513          	addi	a0,a0,-1650 # 8000b948 <ticks>
    80003fc2:	fffff097          	auipc	ra,0xfffff
    80003fc6:	638080e7          	jalr	1592(ra) # 800035fa <wakeup>
  release(&tickslock);
    80003fca:	00026517          	auipc	a0,0x26
    80003fce:	a1e50513          	addi	a0,a0,-1506 # 800299e8 <tickslock>
    80003fd2:	ffffd097          	auipc	ra,0xffffd
    80003fd6:	3bc080e7          	jalr	956(ra) # 8000138e <release>
}
    80003fda:	0001                	nop
    80003fdc:	60a2                	ld	ra,8(sp)
    80003fde:	6402                	ld	s0,0(sp)
    80003fe0:	0141                	addi	sp,sp,16
    80003fe2:	8082                	ret

0000000080003fe4 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80003fe4:	1101                	addi	sp,sp,-32
    80003fe6:	ec06                	sd	ra,24(sp)
    80003fe8:	e822                	sd	s0,16(sp)
    80003fea:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80003fec:	00000097          	auipc	ra,0x0
    80003ff0:	ae4080e7          	jalr	-1308(ra) # 80003ad0 <r_scause>
    80003ff4:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80003ff8:	fe843783          	ld	a5,-24(s0)
    80003ffc:	0a07d263          	bgez	a5,800040a0 <devintr+0xbc>
     (scause & 0xff) == 9){
    80004000:	fe843783          	ld	a5,-24(s0)
    80004004:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80004008:	47a5                	li	a5,9
    8000400a:	08f71b63          	bne	a4,a5,800040a0 <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    8000400e:	00005097          	auipc	ra,0x5
    80004012:	a9e080e7          	jalr	-1378(ra) # 80008aac <plic_claim>
    80004016:	87aa                	mv	a5,a0
    80004018:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    8000401c:	fe442783          	lw	a5,-28(s0)
    80004020:	0007871b          	sext.w	a4,a5
    80004024:	47a9                	li	a5,10
    80004026:	00f71763          	bne	a4,a5,80004034 <devintr+0x50>
      uartintr();
    8000402a:	ffffd097          	auipc	ra,0xffffd
    8000402e:	004080e7          	jalr	4(ra) # 8000102e <uartintr>
    80004032:	a891                	j	80004086 <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    80004034:	fe442783          	lw	a5,-28(s0)
    80004038:	0007871b          	sext.w	a4,a5
    8000403c:	4785                	li	a5,1
    8000403e:	00f71863          	bne	a4,a5,8000404e <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004042:	4501                	li	a0,0
    80004044:	00006097          	auipc	ra,0x6
    80004048:	c26080e7          	jalr	-986(ra) # 80009c6a <virtio_disk_intr>
    8000404c:	a82d                	j	80004086 <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    8000404e:	fe442783          	lw	a5,-28(s0)
    80004052:	0007871b          	sext.w	a4,a5
    80004056:	4789                	li	a5,2
    80004058:	00f71863          	bne	a4,a5,80004068 <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    8000405c:	4505                	li	a0,1
    8000405e:	00006097          	auipc	ra,0x6
    80004062:	c0c080e7          	jalr	-1012(ra) # 80009c6a <virtio_disk_intr>
    80004066:	a005                	j	80004086 <devintr+0xa2>
    } else if(irq){
    80004068:	fe442783          	lw	a5,-28(s0)
    8000406c:	2781                	sext.w	a5,a5
    8000406e:	cf81                	beqz	a5,80004086 <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    80004070:	fe442783          	lw	a5,-28(s0)
    80004074:	85be                	mv	a1,a5
    80004076:	00007517          	auipc	a0,0x7
    8000407a:	35a50513          	addi	a0,a0,858 # 8000b3d0 <etext+0x3d0>
    8000407e:	ffffd097          	auipc	ra,0xffffd
    80004082:	9b8080e7          	jalr	-1608(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80004086:	fe442783          	lw	a5,-28(s0)
    8000408a:	2781                	sext.w	a5,a5
    8000408c:	cb81                	beqz	a5,8000409c <devintr+0xb8>
      plic_complete(irq);
    8000408e:	fe442783          	lw	a5,-28(s0)
    80004092:	853e                	mv	a0,a5
    80004094:	00005097          	auipc	ra,0x5
    80004098:	a56080e7          	jalr	-1450(ra) # 80008aea <plic_complete>

    return 1;
    8000409c:	4785                	li	a5,1
    8000409e:	a081                	j	800040de <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    800040a0:	fe843703          	ld	a4,-24(s0)
    800040a4:	57fd                	li	a5,-1
    800040a6:	17fe                	slli	a5,a5,0x3f
    800040a8:	0785                	addi	a5,a5,1
    800040aa:	02f71963          	bne	a4,a5,800040dc <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800040ae:	fffff097          	auipc	ra,0xfffff
    800040b2:	8b0080e7          	jalr	-1872(ra) # 8000295e <cpuid>
    800040b6:	87aa                	mv	a5,a0
    800040b8:	e789                	bnez	a5,800040c2 <devintr+0xde>
      clockintr();
    800040ba:	00000097          	auipc	ra,0x0
    800040be:	ece080e7          	jalr	-306(ra) # 80003f88 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800040c2:	00000097          	auipc	ra,0x0
    800040c6:	972080e7          	jalr	-1678(ra) # 80003a34 <r_sip>
    800040ca:	87aa                	mv	a5,a0
    800040cc:	9bf5                	andi	a5,a5,-3
    800040ce:	853e                	mv	a0,a5
    800040d0:	00000097          	auipc	ra,0x0
    800040d4:	97e080e7          	jalr	-1666(ra) # 80003a4e <w_sip>

    return 2;
    800040d8:	4789                	li	a5,2
    800040da:	a011                	j	800040de <devintr+0xfa>
  } else {
    return 0;
    800040dc:	4781                	li	a5,0
  }
}
    800040de:	853e                	mv	a0,a5
    800040e0:	60e2                	ld	ra,24(sp)
    800040e2:	6442                	ld	s0,16(sp)
    800040e4:	6105                	addi	sp,sp,32
    800040e6:	8082                	ret

00000000800040e8 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    800040e8:	7179                	addi	sp,sp,-48
    800040ea:	f406                	sd	ra,40(sp)
    800040ec:	f022                	sd	s0,32(sp)
    800040ee:	1800                	addi	s0,sp,48
    800040f0:	fca43c23          	sd	a0,-40(s0)
    800040f4:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800040f8:	fffff097          	auipc	ra,0xfffff
    800040fc:	8c4080e7          	jalr	-1852(ra) # 800029bc <myproc>
    80004100:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    80004104:	fe843783          	ld	a5,-24(s0)
    80004108:	67bc                	ld	a5,72(a5)
    8000410a:	fd843703          	ld	a4,-40(s0)
    8000410e:	00f77b63          	bgeu	a4,a5,80004124 <fetchaddr+0x3c>
    80004112:	fd843783          	ld	a5,-40(s0)
    80004116:	00878713          	addi	a4,a5,8
    8000411a:	fe843783          	ld	a5,-24(s0)
    8000411e:	67bc                	ld	a5,72(a5)
    80004120:	00e7f463          	bgeu	a5,a4,80004128 <fetchaddr+0x40>
    return -1;
    80004124:	57fd                	li	a5,-1
    80004126:	a01d                	j	8000414c <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004128:	fe843783          	ld	a5,-24(s0)
    8000412c:	6bbc                	ld	a5,80(a5)
    8000412e:	46a1                	li	a3,8
    80004130:	fd843603          	ld	a2,-40(s0)
    80004134:	fd043583          	ld	a1,-48(s0)
    80004138:	853e                	mv	a0,a5
    8000413a:	ffffe097          	auipc	ra,0xffffe
    8000413e:	41a080e7          	jalr	1050(ra) # 80002554 <copyin>
    80004142:	87aa                	mv	a5,a0
    80004144:	c399                	beqz	a5,8000414a <fetchaddr+0x62>
    return -1;
    80004146:	57fd                	li	a5,-1
    80004148:	a011                	j	8000414c <fetchaddr+0x64>
  return 0;
    8000414a:	4781                	li	a5,0
}
    8000414c:	853e                	mv	a0,a5
    8000414e:	70a2                	ld	ra,40(sp)
    80004150:	7402                	ld	s0,32(sp)
    80004152:	6145                	addi	sp,sp,48
    80004154:	8082                	ret

0000000080004156 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004156:	7139                	addi	sp,sp,-64
    80004158:	fc06                	sd	ra,56(sp)
    8000415a:	f822                	sd	s0,48(sp)
    8000415c:	0080                	addi	s0,sp,64
    8000415e:	fca43c23          	sd	a0,-40(s0)
    80004162:	fcb43823          	sd	a1,-48(s0)
    80004166:	87b2                	mv	a5,a2
    80004168:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    8000416c:	fffff097          	auipc	ra,0xfffff
    80004170:	850080e7          	jalr	-1968(ra) # 800029bc <myproc>
    80004174:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    80004178:	fe843783          	ld	a5,-24(s0)
    8000417c:	6bbc                	ld	a5,80(a5)
    8000417e:	fcc42703          	lw	a4,-52(s0)
    80004182:	86ba                	mv	a3,a4
    80004184:	fd843603          	ld	a2,-40(s0)
    80004188:	fd043583          	ld	a1,-48(s0)
    8000418c:	853e                	mv	a0,a5
    8000418e:	ffffe097          	auipc	ra,0xffffe
    80004192:	494080e7          	jalr	1172(ra) # 80002622 <copyinstr>
    80004196:	87aa                	mv	a5,a0
    80004198:	0007d463          	bgez	a5,800041a0 <fetchstr+0x4a>
    return -1;
    8000419c:	57fd                	li	a5,-1
    8000419e:	a801                	j	800041ae <fetchstr+0x58>
  return strlen(buf);
    800041a0:	fd043503          	ld	a0,-48(s0)
    800041a4:	ffffd097          	auipc	ra,0xffffd
    800041a8:	6d8080e7          	jalr	1752(ra) # 8000187c <strlen>
    800041ac:	87aa                	mv	a5,a0
}
    800041ae:	853e                	mv	a0,a5
    800041b0:	70e2                	ld	ra,56(sp)
    800041b2:	7442                	ld	s0,48(sp)
    800041b4:	6121                	addi	sp,sp,64
    800041b6:	8082                	ret

00000000800041b8 <argraw>:

static uint64
argraw(int n)
{
    800041b8:	7179                	addi	sp,sp,-48
    800041ba:	f406                	sd	ra,40(sp)
    800041bc:	f022                	sd	s0,32(sp)
    800041be:	1800                	addi	s0,sp,48
    800041c0:	87aa                	mv	a5,a0
    800041c2:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800041c6:	ffffe097          	auipc	ra,0xffffe
    800041ca:	7f6080e7          	jalr	2038(ra) # 800029bc <myproc>
    800041ce:	fea43423          	sd	a0,-24(s0)
    800041d2:	fdc42783          	lw	a5,-36(s0)
    800041d6:	0007871b          	sext.w	a4,a5
    800041da:	4795                	li	a5,5
    800041dc:	06e7e263          	bltu	a5,a4,80004240 <argraw+0x88>
    800041e0:	fdc46783          	lwu	a5,-36(s0)
    800041e4:	00279713          	slli	a4,a5,0x2
    800041e8:	00007797          	auipc	a5,0x7
    800041ec:	21078793          	addi	a5,a5,528 # 8000b3f8 <etext+0x3f8>
    800041f0:	97ba                	add	a5,a5,a4
    800041f2:	439c                	lw	a5,0(a5)
    800041f4:	0007871b          	sext.w	a4,a5
    800041f8:	00007797          	auipc	a5,0x7
    800041fc:	20078793          	addi	a5,a5,512 # 8000b3f8 <etext+0x3f8>
    80004200:	97ba                	add	a5,a5,a4
    80004202:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    80004204:	fe843783          	ld	a5,-24(s0)
    80004208:	6fbc                	ld	a5,88(a5)
    8000420a:	7bbc                	ld	a5,112(a5)
    8000420c:	a091                	j	80004250 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    8000420e:	fe843783          	ld	a5,-24(s0)
    80004212:	6fbc                	ld	a5,88(a5)
    80004214:	7fbc                	ld	a5,120(a5)
    80004216:	a82d                	j	80004250 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004218:	fe843783          	ld	a5,-24(s0)
    8000421c:	6fbc                	ld	a5,88(a5)
    8000421e:	63dc                	ld	a5,128(a5)
    80004220:	a805                	j	80004250 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004222:	fe843783          	ld	a5,-24(s0)
    80004226:	6fbc                	ld	a5,88(a5)
    80004228:	67dc                	ld	a5,136(a5)
    8000422a:	a01d                	j	80004250 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    8000422c:	fe843783          	ld	a5,-24(s0)
    80004230:	6fbc                	ld	a5,88(a5)
    80004232:	6bdc                	ld	a5,144(a5)
    80004234:	a831                	j	80004250 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    80004236:	fe843783          	ld	a5,-24(s0)
    8000423a:	6fbc                	ld	a5,88(a5)
    8000423c:	6fdc                	ld	a5,152(a5)
    8000423e:	a809                	j	80004250 <argraw+0x98>
  }
  panic("argraw");
    80004240:	00007517          	auipc	a0,0x7
    80004244:	1b050513          	addi	a0,a0,432 # 8000b3f0 <etext+0x3f0>
    80004248:	ffffd097          	auipc	ra,0xffffd
    8000424c:	a44080e7          	jalr	-1468(ra) # 80000c8c <panic>
  return -1;
}
    80004250:	853e                	mv	a0,a5
    80004252:	70a2                	ld	ra,40(sp)
    80004254:	7402                	ld	s0,32(sp)
    80004256:	6145                	addi	sp,sp,48
    80004258:	8082                	ret

000000008000425a <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    8000425a:	1101                	addi	sp,sp,-32
    8000425c:	ec06                	sd	ra,24(sp)
    8000425e:	e822                	sd	s0,16(sp)
    80004260:	1000                	addi	s0,sp,32
    80004262:	87aa                	mv	a5,a0
    80004264:	feb43023          	sd	a1,-32(s0)
    80004268:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    8000426c:	fec42783          	lw	a5,-20(s0)
    80004270:	853e                	mv	a0,a5
    80004272:	00000097          	auipc	ra,0x0
    80004276:	f46080e7          	jalr	-186(ra) # 800041b8 <argraw>
    8000427a:	87aa                	mv	a5,a0
    8000427c:	0007871b          	sext.w	a4,a5
    80004280:	fe043783          	ld	a5,-32(s0)
    80004284:	c398                	sw	a4,0(a5)
}
    80004286:	0001                	nop
    80004288:	60e2                	ld	ra,24(sp)
    8000428a:	6442                	ld	s0,16(sp)
    8000428c:	6105                	addi	sp,sp,32
    8000428e:	8082                	ret

0000000080004290 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    80004290:	1101                	addi	sp,sp,-32
    80004292:	ec06                	sd	ra,24(sp)
    80004294:	e822                	sd	s0,16(sp)
    80004296:	1000                	addi	s0,sp,32
    80004298:	87aa                	mv	a5,a0
    8000429a:	feb43023          	sd	a1,-32(s0)
    8000429e:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800042a2:	fec42783          	lw	a5,-20(s0)
    800042a6:	853e                	mv	a0,a5
    800042a8:	00000097          	auipc	ra,0x0
    800042ac:	f10080e7          	jalr	-240(ra) # 800041b8 <argraw>
    800042b0:	872a                	mv	a4,a0
    800042b2:	fe043783          	ld	a5,-32(s0)
    800042b6:	e398                	sd	a4,0(a5)
}
    800042b8:	0001                	nop
    800042ba:	60e2                	ld	ra,24(sp)
    800042bc:	6442                	ld	s0,16(sp)
    800042be:	6105                	addi	sp,sp,32
    800042c0:	8082                	ret

00000000800042c2 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800042c2:	7179                	addi	sp,sp,-48
    800042c4:	f406                	sd	ra,40(sp)
    800042c6:	f022                	sd	s0,32(sp)
    800042c8:	1800                	addi	s0,sp,48
    800042ca:	87aa                	mv	a5,a0
    800042cc:	fcb43823          	sd	a1,-48(s0)
    800042d0:	8732                	mv	a4,a2
    800042d2:	fcf42e23          	sw	a5,-36(s0)
    800042d6:	87ba                	mv	a5,a4
    800042d8:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    800042dc:	fe840713          	addi	a4,s0,-24
    800042e0:	fdc42783          	lw	a5,-36(s0)
    800042e4:	85ba                	mv	a1,a4
    800042e6:	853e                	mv	a0,a5
    800042e8:	00000097          	auipc	ra,0x0
    800042ec:	fa8080e7          	jalr	-88(ra) # 80004290 <argaddr>
  return fetchstr(addr, buf, max);
    800042f0:	fe843783          	ld	a5,-24(s0)
    800042f4:	fd842703          	lw	a4,-40(s0)
    800042f8:	863a                	mv	a2,a4
    800042fa:	fd043583          	ld	a1,-48(s0)
    800042fe:	853e                	mv	a0,a5
    80004300:	00000097          	auipc	ra,0x0
    80004304:	e56080e7          	jalr	-426(ra) # 80004156 <fetchstr>
    80004308:	87aa                	mv	a5,a0
}
    8000430a:	853e                	mv	a0,a5
    8000430c:	70a2                	ld	ra,40(sp)
    8000430e:	7402                	ld	s0,32(sp)
    80004310:	6145                	addi	sp,sp,48
    80004312:	8082                	ret

0000000080004314 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    80004314:	7179                	addi	sp,sp,-48
    80004316:	f406                	sd	ra,40(sp)
    80004318:	f022                	sd	s0,32(sp)
    8000431a:	ec26                	sd	s1,24(sp)
    8000431c:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    8000431e:	ffffe097          	auipc	ra,0xffffe
    80004322:	69e080e7          	jalr	1694(ra) # 800029bc <myproc>
    80004326:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    8000432a:	fd843783          	ld	a5,-40(s0)
    8000432e:	6fbc                	ld	a5,88(a5)
    80004330:	77dc                	ld	a5,168(a5)
    80004332:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80004336:	fd442783          	lw	a5,-44(s0)
    8000433a:	2781                	sext.w	a5,a5
    8000433c:	04f05263          	blez	a5,80004380 <syscall+0x6c>
    80004340:	fd442783          	lw	a5,-44(s0)
    80004344:	873e                	mv	a4,a5
    80004346:	47d5                	li	a5,21
    80004348:	02e7ec63          	bltu	a5,a4,80004380 <syscall+0x6c>
    8000434c:	00007717          	auipc	a4,0x7
    80004350:	50470713          	addi	a4,a4,1284 # 8000b850 <syscalls>
    80004354:	fd442783          	lw	a5,-44(s0)
    80004358:	078e                	slli	a5,a5,0x3
    8000435a:	97ba                	add	a5,a5,a4
    8000435c:	639c                	ld	a5,0(a5)
    8000435e:	c38d                	beqz	a5,80004380 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    80004360:	00007717          	auipc	a4,0x7
    80004364:	4f070713          	addi	a4,a4,1264 # 8000b850 <syscalls>
    80004368:	fd442783          	lw	a5,-44(s0)
    8000436c:	078e                	slli	a5,a5,0x3
    8000436e:	97ba                	add	a5,a5,a4
    80004370:	6398                	ld	a4,0(a5)
    80004372:	fd843783          	ld	a5,-40(s0)
    80004376:	6fa4                	ld	s1,88(a5)
    80004378:	9702                	jalr	a4
    8000437a:	87aa                	mv	a5,a0
    8000437c:	f8bc                	sd	a5,112(s1)
    8000437e:	a815                	j	800043b2 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    80004380:	fd843783          	ld	a5,-40(s0)
    80004384:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    80004386:	fd843783          	ld	a5,-40(s0)
    8000438a:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    8000438e:	fd442683          	lw	a3,-44(s0)
    80004392:	863e                	mv	a2,a5
    80004394:	85ba                	mv	a1,a4
    80004396:	00007517          	auipc	a0,0x7
    8000439a:	07a50513          	addi	a0,a0,122 # 8000b410 <etext+0x410>
    8000439e:	ffffc097          	auipc	ra,0xffffc
    800043a2:	698080e7          	jalr	1688(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    800043a6:	fd843783          	ld	a5,-40(s0)
    800043aa:	6fbc                	ld	a5,88(a5)
    800043ac:	577d                	li	a4,-1
    800043ae:	fbb8                	sd	a4,112(a5)
  }
}
    800043b0:	0001                	nop
    800043b2:	0001                	nop
    800043b4:	70a2                	ld	ra,40(sp)
    800043b6:	7402                	ld	s0,32(sp)
    800043b8:	64e2                	ld	s1,24(sp)
    800043ba:	6145                	addi	sp,sp,48
    800043bc:	8082                	ret

00000000800043be <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800043be:	1101                	addi	sp,sp,-32
    800043c0:	ec06                	sd	ra,24(sp)
    800043c2:	e822                	sd	s0,16(sp)
    800043c4:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    800043c6:	fec40793          	addi	a5,s0,-20
    800043ca:	85be                	mv	a1,a5
    800043cc:	4501                	li	a0,0
    800043ce:	00000097          	auipc	ra,0x0
    800043d2:	e8c080e7          	jalr	-372(ra) # 8000425a <argint>
  exit(n);
    800043d6:	fec42783          	lw	a5,-20(s0)
    800043da:	853e                	mv	a0,a5
    800043dc:	fffff097          	auipc	ra,0xfffff
    800043e0:	cd2080e7          	jalr	-814(ra) # 800030ae <exit>
  return 0;  // not reached
    800043e4:	4781                	li	a5,0
}
    800043e6:	853e                	mv	a0,a5
    800043e8:	60e2                	ld	ra,24(sp)
    800043ea:	6442                	ld	s0,16(sp)
    800043ec:	6105                	addi	sp,sp,32
    800043ee:	8082                	ret

00000000800043f0 <sys_getpid>:

uint64
sys_getpid(void)
{
    800043f0:	1141                	addi	sp,sp,-16
    800043f2:	e406                	sd	ra,8(sp)
    800043f4:	e022                	sd	s0,0(sp)
    800043f6:	0800                	addi	s0,sp,16
  return myproc()->pid;
    800043f8:	ffffe097          	auipc	ra,0xffffe
    800043fc:	5c4080e7          	jalr	1476(ra) # 800029bc <myproc>
    80004400:	87aa                	mv	a5,a0
    80004402:	5b9c                	lw	a5,48(a5)
}
    80004404:	853e                	mv	a0,a5
    80004406:	60a2                	ld	ra,8(sp)
    80004408:	6402                	ld	s0,0(sp)
    8000440a:	0141                	addi	sp,sp,16
    8000440c:	8082                	ret

000000008000440e <sys_fork>:

uint64
sys_fork(void)
{
    8000440e:	1141                	addi	sp,sp,-16
    80004410:	e406                	sd	ra,8(sp)
    80004412:	e022                	sd	s0,0(sp)
    80004414:	0800                	addi	s0,sp,16
  return fork();
    80004416:	fffff097          	auipc	ra,0xfffff
    8000441a:	a76080e7          	jalr	-1418(ra) # 80002e8c <fork>
    8000441e:	87aa                	mv	a5,a0
}
    80004420:	853e                	mv	a0,a5
    80004422:	60a2                	ld	ra,8(sp)
    80004424:	6402                	ld	s0,0(sp)
    80004426:	0141                	addi	sp,sp,16
    80004428:	8082                	ret

000000008000442a <sys_wait>:

uint64
sys_wait(void)
{
    8000442a:	1101                	addi	sp,sp,-32
    8000442c:	ec06                	sd	ra,24(sp)
    8000442e:	e822                	sd	s0,16(sp)
    80004430:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    80004432:	fe840793          	addi	a5,s0,-24
    80004436:	85be                	mv	a1,a5
    80004438:	4501                	li	a0,0
    8000443a:	00000097          	auipc	ra,0x0
    8000443e:	e56080e7          	jalr	-426(ra) # 80004290 <argaddr>
  return wait(p);
    80004442:	fe843783          	ld	a5,-24(s0)
    80004446:	853e                	mv	a0,a5
    80004448:	fffff097          	auipc	ra,0xfffff
    8000444c:	da2080e7          	jalr	-606(ra) # 800031ea <wait>
    80004450:	87aa                	mv	a5,a0
}
    80004452:	853e                	mv	a0,a5
    80004454:	60e2                	ld	ra,24(sp)
    80004456:	6442                	ld	s0,16(sp)
    80004458:	6105                	addi	sp,sp,32
    8000445a:	8082                	ret

000000008000445c <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8000445c:	1101                	addi	sp,sp,-32
    8000445e:	ec06                	sd	ra,24(sp)
    80004460:	e822                	sd	s0,16(sp)
    80004462:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    80004464:	fe440793          	addi	a5,s0,-28
    80004468:	85be                	mv	a1,a5
    8000446a:	4501                	li	a0,0
    8000446c:	00000097          	auipc	ra,0x0
    80004470:	dee080e7          	jalr	-530(ra) # 8000425a <argint>
  addr = myproc()->sz;
    80004474:	ffffe097          	auipc	ra,0xffffe
    80004478:	548080e7          	jalr	1352(ra) # 800029bc <myproc>
    8000447c:	87aa                	mv	a5,a0
    8000447e:	67bc                	ld	a5,72(a5)
    80004480:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    80004484:	fe442783          	lw	a5,-28(s0)
    80004488:	853e                	mv	a0,a5
    8000448a:	fffff097          	auipc	ra,0xfffff
    8000448e:	962080e7          	jalr	-1694(ra) # 80002dec <growproc>
    80004492:	87aa                	mv	a5,a0
    80004494:	0007d463          	bgez	a5,8000449c <sys_sbrk+0x40>
    return -1;
    80004498:	57fd                	li	a5,-1
    8000449a:	a019                	j	800044a0 <sys_sbrk+0x44>
  return addr;
    8000449c:	fe843783          	ld	a5,-24(s0)
}
    800044a0:	853e                	mv	a0,a5
    800044a2:	60e2                	ld	ra,24(sp)
    800044a4:	6442                	ld	s0,16(sp)
    800044a6:	6105                	addi	sp,sp,32
    800044a8:	8082                	ret

00000000800044aa <sys_sleep>:

uint64
sys_sleep(void)
{
    800044aa:	1101                	addi	sp,sp,-32
    800044ac:	ec06                	sd	ra,24(sp)
    800044ae:	e822                	sd	s0,16(sp)
    800044b0:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    800044b2:	fe840793          	addi	a5,s0,-24
    800044b6:	85be                	mv	a1,a5
    800044b8:	4501                	li	a0,0
    800044ba:	00000097          	auipc	ra,0x0
    800044be:	da0080e7          	jalr	-608(ra) # 8000425a <argint>
  acquire(&tickslock);
    800044c2:	00025517          	auipc	a0,0x25
    800044c6:	52650513          	addi	a0,a0,1318 # 800299e8 <tickslock>
    800044ca:	ffffd097          	auipc	ra,0xffffd
    800044ce:	e60080e7          	jalr	-416(ra) # 8000132a <acquire>
  ticks0 = ticks;
    800044d2:	00007797          	auipc	a5,0x7
    800044d6:	47678793          	addi	a5,a5,1142 # 8000b948 <ticks>
    800044da:	439c                	lw	a5,0(a5)
    800044dc:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    800044e0:	a099                	j	80004526 <sys_sleep+0x7c>
    if(killed(myproc())){
    800044e2:	ffffe097          	auipc	ra,0xffffe
    800044e6:	4da080e7          	jalr	1242(ra) # 800029bc <myproc>
    800044ea:	87aa                	mv	a5,a0
    800044ec:	853e                	mv	a0,a5
    800044ee:	fffff097          	auipc	ra,0xfffff
    800044f2:	29e080e7          	jalr	670(ra) # 8000378c <killed>
    800044f6:	87aa                	mv	a5,a0
    800044f8:	cb99                	beqz	a5,8000450e <sys_sleep+0x64>
      release(&tickslock);
    800044fa:	00025517          	auipc	a0,0x25
    800044fe:	4ee50513          	addi	a0,a0,1262 # 800299e8 <tickslock>
    80004502:	ffffd097          	auipc	ra,0xffffd
    80004506:	e8c080e7          	jalr	-372(ra) # 8000138e <release>
      return -1;
    8000450a:	57fd                	li	a5,-1
    8000450c:	a0b1                	j	80004558 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    8000450e:	00025597          	auipc	a1,0x25
    80004512:	4da58593          	addi	a1,a1,1242 # 800299e8 <tickslock>
    80004516:	00007517          	auipc	a0,0x7
    8000451a:	43250513          	addi	a0,a0,1074 # 8000b948 <ticks>
    8000451e:	fffff097          	auipc	ra,0xfffff
    80004522:	060080e7          	jalr	96(ra) # 8000357e <sleep>
  while(ticks - ticks0 < n){
    80004526:	00007797          	auipc	a5,0x7
    8000452a:	42278793          	addi	a5,a5,1058 # 8000b948 <ticks>
    8000452e:	4398                	lw	a4,0(a5)
    80004530:	fec42783          	lw	a5,-20(s0)
    80004534:	40f707bb          	subw	a5,a4,a5
    80004538:	0007871b          	sext.w	a4,a5
    8000453c:	fe842783          	lw	a5,-24(s0)
    80004540:	2781                	sext.w	a5,a5
    80004542:	faf760e3          	bltu	a4,a5,800044e2 <sys_sleep+0x38>
  }
  release(&tickslock);
    80004546:	00025517          	auipc	a0,0x25
    8000454a:	4a250513          	addi	a0,a0,1186 # 800299e8 <tickslock>
    8000454e:	ffffd097          	auipc	ra,0xffffd
    80004552:	e40080e7          	jalr	-448(ra) # 8000138e <release>
  return 0;
    80004556:	4781                	li	a5,0
}
    80004558:	853e                	mv	a0,a5
    8000455a:	60e2                	ld	ra,24(sp)
    8000455c:	6442                	ld	s0,16(sp)
    8000455e:	6105                	addi	sp,sp,32
    80004560:	8082                	ret

0000000080004562 <sys_kill>:

uint64
sys_kill(void)
{
    80004562:	1101                	addi	sp,sp,-32
    80004564:	ec06                	sd	ra,24(sp)
    80004566:	e822                	sd	s0,16(sp)
    80004568:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    8000456a:	fec40793          	addi	a5,s0,-20
    8000456e:	85be                	mv	a1,a5
    80004570:	4501                	li	a0,0
    80004572:	00000097          	auipc	ra,0x0
    80004576:	ce8080e7          	jalr	-792(ra) # 8000425a <argint>
  return kill(pid);
    8000457a:	fec42783          	lw	a5,-20(s0)
    8000457e:	853e                	mv	a0,a5
    80004580:	fffff097          	auipc	ra,0xfffff
    80004584:	132080e7          	jalr	306(ra) # 800036b2 <kill>
    80004588:	87aa                	mv	a5,a0
}
    8000458a:	853e                	mv	a0,a5
    8000458c:	60e2                	ld	ra,24(sp)
    8000458e:	6442                	ld	s0,16(sp)
    80004590:	6105                	addi	sp,sp,32
    80004592:	8082                	ret

0000000080004594 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004594:	1101                	addi	sp,sp,-32
    80004596:	ec06                	sd	ra,24(sp)
    80004598:	e822                	sd	s0,16(sp)
    8000459a:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8000459c:	00025517          	auipc	a0,0x25
    800045a0:	44c50513          	addi	a0,a0,1100 # 800299e8 <tickslock>
    800045a4:	ffffd097          	auipc	ra,0xffffd
    800045a8:	d86080e7          	jalr	-634(ra) # 8000132a <acquire>
  xticks = ticks;
    800045ac:	00007797          	auipc	a5,0x7
    800045b0:	39c78793          	addi	a5,a5,924 # 8000b948 <ticks>
    800045b4:	439c                	lw	a5,0(a5)
    800045b6:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    800045ba:	00025517          	auipc	a0,0x25
    800045be:	42e50513          	addi	a0,a0,1070 # 800299e8 <tickslock>
    800045c2:	ffffd097          	auipc	ra,0xffffd
    800045c6:	dcc080e7          	jalr	-564(ra) # 8000138e <release>
  return xticks;
    800045ca:	fec46783          	lwu	a5,-20(s0)
}
    800045ce:	853e                	mv	a0,a5
    800045d0:	60e2                	ld	ra,24(sp)
    800045d2:	6442                	ld	s0,16(sp)
    800045d4:	6105                	addi	sp,sp,32
    800045d6:	8082                	ret

00000000800045d8 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800045d8:	1101                	addi	sp,sp,-32
    800045da:	ec06                	sd	ra,24(sp)
    800045dc:	e822                	sd	s0,16(sp)
    800045de:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800045e0:	00007597          	auipc	a1,0x7
    800045e4:	e5058593          	addi	a1,a1,-432 # 8000b430 <etext+0x430>
    800045e8:	00025517          	auipc	a0,0x25
    800045ec:	41850513          	addi	a0,a0,1048 # 80029a00 <bcache>
    800045f0:	ffffd097          	auipc	ra,0xffffd
    800045f4:	d0a080e7          	jalr	-758(ra) # 800012fa <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800045f8:	00025717          	auipc	a4,0x25
    800045fc:	40870713          	addi	a4,a4,1032 # 80029a00 <bcache>
    80004600:	67a1                	lui	a5,0x8
    80004602:	97ba                	add	a5,a5,a4
    80004604:	0002d717          	auipc	a4,0x2d
    80004608:	66470713          	addi	a4,a4,1636 # 80031c68 <bcache+0x8268>
    8000460c:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80004610:	00025717          	auipc	a4,0x25
    80004614:	3f070713          	addi	a4,a4,1008 # 80029a00 <bcache>
    80004618:	67a1                	lui	a5,0x8
    8000461a:	97ba                	add	a5,a5,a4
    8000461c:	0002d717          	auipc	a4,0x2d
    80004620:	64c70713          	addi	a4,a4,1612 # 80031c68 <bcache+0x8268>
    80004624:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004628:	00025797          	auipc	a5,0x25
    8000462c:	3f078793          	addi	a5,a5,1008 # 80029a18 <bcache+0x18>
    80004630:	fef43423          	sd	a5,-24(s0)
    80004634:	a895                	j	800046a8 <binit+0xd0>
    b->next = bcache.head.next;
    80004636:	00025717          	auipc	a4,0x25
    8000463a:	3ca70713          	addi	a4,a4,970 # 80029a00 <bcache>
    8000463e:	67a1                	lui	a5,0x8
    80004640:	97ba                	add	a5,a5,a4
    80004642:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004646:	fe843783          	ld	a5,-24(s0)
    8000464a:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    8000464c:	fe843783          	ld	a5,-24(s0)
    80004650:	0002d717          	auipc	a4,0x2d
    80004654:	61870713          	addi	a4,a4,1560 # 80031c68 <bcache+0x8268>
    80004658:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    8000465a:	fe843783          	ld	a5,-24(s0)
    8000465e:	07c1                	addi	a5,a5,16
    80004660:	00007597          	auipc	a1,0x7
    80004664:	dd858593          	addi	a1,a1,-552 # 8000b438 <etext+0x438>
    80004668:	853e                	mv	a0,a5
    8000466a:	00002097          	auipc	ra,0x2
    8000466e:	034080e7          	jalr	52(ra) # 8000669e <initsleeplock>
    bcache.head.next->prev = b;
    80004672:	00025717          	auipc	a4,0x25
    80004676:	38e70713          	addi	a4,a4,910 # 80029a00 <bcache>
    8000467a:	67a1                	lui	a5,0x8
    8000467c:	97ba                	add	a5,a5,a4
    8000467e:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004682:	fe843703          	ld	a4,-24(s0)
    80004686:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004688:	00025717          	auipc	a4,0x25
    8000468c:	37870713          	addi	a4,a4,888 # 80029a00 <bcache>
    80004690:	67a1                	lui	a5,0x8
    80004692:	97ba                	add	a5,a5,a4
    80004694:	fe843703          	ld	a4,-24(s0)
    80004698:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000469c:	fe843783          	ld	a5,-24(s0)
    800046a0:	45878793          	addi	a5,a5,1112
    800046a4:	fef43423          	sd	a5,-24(s0)
    800046a8:	0002d797          	auipc	a5,0x2d
    800046ac:	5c078793          	addi	a5,a5,1472 # 80031c68 <bcache+0x8268>
    800046b0:	fe843703          	ld	a4,-24(s0)
    800046b4:	f8f761e3          	bltu	a4,a5,80004636 <binit+0x5e>
  }
}
    800046b8:	0001                	nop
    800046ba:	0001                	nop
    800046bc:	60e2                	ld	ra,24(sp)
    800046be:	6442                	ld	s0,16(sp)
    800046c0:	6105                	addi	sp,sp,32
    800046c2:	8082                	ret

00000000800046c4 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800046c4:	7179                	addi	sp,sp,-48
    800046c6:	f406                	sd	ra,40(sp)
    800046c8:	f022                	sd	s0,32(sp)
    800046ca:	1800                	addi	s0,sp,48
    800046cc:	87aa                	mv	a5,a0
    800046ce:	872e                	mv	a4,a1
    800046d0:	fcf42e23          	sw	a5,-36(s0)
    800046d4:	87ba                	mv	a5,a4
    800046d6:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    800046da:	00025517          	auipc	a0,0x25
    800046de:	32650513          	addi	a0,a0,806 # 80029a00 <bcache>
    800046e2:	ffffd097          	auipc	ra,0xffffd
    800046e6:	c48080e7          	jalr	-952(ra) # 8000132a <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800046ea:	00025717          	auipc	a4,0x25
    800046ee:	31670713          	addi	a4,a4,790 # 80029a00 <bcache>
    800046f2:	67a1                	lui	a5,0x8
    800046f4:	97ba                	add	a5,a5,a4
    800046f6:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800046fa:	fef43423          	sd	a5,-24(s0)
    800046fe:	a095                	j	80004762 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80004700:	fe843783          	ld	a5,-24(s0)
    80004704:	4798                	lw	a4,8(a5)
    80004706:	fdc42783          	lw	a5,-36(s0)
    8000470a:	2781                	sext.w	a5,a5
    8000470c:	04e79663          	bne	a5,a4,80004758 <bget+0x94>
    80004710:	fe843783          	ld	a5,-24(s0)
    80004714:	47d8                	lw	a4,12(a5)
    80004716:	fd842783          	lw	a5,-40(s0)
    8000471a:	2781                	sext.w	a5,a5
    8000471c:	02e79e63          	bne	a5,a4,80004758 <bget+0x94>
      b->refcnt++;
    80004720:	fe843783          	ld	a5,-24(s0)
    80004724:	43bc                	lw	a5,64(a5)
    80004726:	2785                	addiw	a5,a5,1
    80004728:	0007871b          	sext.w	a4,a5
    8000472c:	fe843783          	ld	a5,-24(s0)
    80004730:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004732:	00025517          	auipc	a0,0x25
    80004736:	2ce50513          	addi	a0,a0,718 # 80029a00 <bcache>
    8000473a:	ffffd097          	auipc	ra,0xffffd
    8000473e:	c54080e7          	jalr	-940(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    80004742:	fe843783          	ld	a5,-24(s0)
    80004746:	07c1                	addi	a5,a5,16
    80004748:	853e                	mv	a0,a5
    8000474a:	00002097          	auipc	ra,0x2
    8000474e:	fa0080e7          	jalr	-96(ra) # 800066ea <acquiresleep>
      return b;
    80004752:	fe843783          	ld	a5,-24(s0)
    80004756:	a07d                	j	80004804 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004758:	fe843783          	ld	a5,-24(s0)
    8000475c:	6bbc                	ld	a5,80(a5)
    8000475e:	fef43423          	sd	a5,-24(s0)
    80004762:	fe843703          	ld	a4,-24(s0)
    80004766:	0002d797          	auipc	a5,0x2d
    8000476a:	50278793          	addi	a5,a5,1282 # 80031c68 <bcache+0x8268>
    8000476e:	f8f719e3          	bne	a4,a5,80004700 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004772:	00025717          	auipc	a4,0x25
    80004776:	28e70713          	addi	a4,a4,654 # 80029a00 <bcache>
    8000477a:	67a1                	lui	a5,0x8
    8000477c:	97ba                	add	a5,a5,a4
    8000477e:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004782:	fef43423          	sd	a5,-24(s0)
    80004786:	a8b9                	j	800047e4 <bget+0x120>
    if(b->refcnt == 0) {
    80004788:	fe843783          	ld	a5,-24(s0)
    8000478c:	43bc                	lw	a5,64(a5)
    8000478e:	e7b1                	bnez	a5,800047da <bget+0x116>
      b->dev = dev;
    80004790:	fe843783          	ld	a5,-24(s0)
    80004794:	fdc42703          	lw	a4,-36(s0)
    80004798:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    8000479a:	fe843783          	ld	a5,-24(s0)
    8000479e:	fd842703          	lw	a4,-40(s0)
    800047a2:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    800047a4:	fe843783          	ld	a5,-24(s0)
    800047a8:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    800047ac:	fe843783          	ld	a5,-24(s0)
    800047b0:	4705                	li	a4,1
    800047b2:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800047b4:	00025517          	auipc	a0,0x25
    800047b8:	24c50513          	addi	a0,a0,588 # 80029a00 <bcache>
    800047bc:	ffffd097          	auipc	ra,0xffffd
    800047c0:	bd2080e7          	jalr	-1070(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    800047c4:	fe843783          	ld	a5,-24(s0)
    800047c8:	07c1                	addi	a5,a5,16
    800047ca:	853e                	mv	a0,a5
    800047cc:	00002097          	auipc	ra,0x2
    800047d0:	f1e080e7          	jalr	-226(ra) # 800066ea <acquiresleep>
      return b;
    800047d4:	fe843783          	ld	a5,-24(s0)
    800047d8:	a035                	j	80004804 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800047da:	fe843783          	ld	a5,-24(s0)
    800047de:	67bc                	ld	a5,72(a5)
    800047e0:	fef43423          	sd	a5,-24(s0)
    800047e4:	fe843703          	ld	a4,-24(s0)
    800047e8:	0002d797          	auipc	a5,0x2d
    800047ec:	48078793          	addi	a5,a5,1152 # 80031c68 <bcache+0x8268>
    800047f0:	f8f71ce3          	bne	a4,a5,80004788 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800047f4:	00007517          	auipc	a0,0x7
    800047f8:	c4c50513          	addi	a0,a0,-948 # 8000b440 <etext+0x440>
    800047fc:	ffffc097          	auipc	ra,0xffffc
    80004800:	490080e7          	jalr	1168(ra) # 80000c8c <panic>
}
    80004804:	853e                	mv	a0,a5
    80004806:	70a2                	ld	ra,40(sp)
    80004808:	7402                	ld	s0,32(sp)
    8000480a:	6145                	addi	sp,sp,48
    8000480c:	8082                	ret

000000008000480e <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    8000480e:	7179                	addi	sp,sp,-48
    80004810:	f406                	sd	ra,40(sp)
    80004812:	f022                	sd	s0,32(sp)
    80004814:	1800                	addi	s0,sp,48
    80004816:	87aa                	mv	a5,a0
    80004818:	872e                	mv	a4,a1
    8000481a:	fcf42e23          	sw	a5,-36(s0)
    8000481e:	87ba                	mv	a5,a4
    80004820:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004824:	fd842703          	lw	a4,-40(s0)
    80004828:	fdc42783          	lw	a5,-36(s0)
    8000482c:	85ba                	mv	a1,a4
    8000482e:	853e                	mv	a0,a5
    80004830:	00000097          	auipc	ra,0x0
    80004834:	e94080e7          	jalr	-364(ra) # 800046c4 <bget>
    80004838:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    8000483c:	fe843783          	ld	a5,-24(s0)
    80004840:	439c                	lw	a5,0(a5)
    80004842:	ef91                	bnez	a5,8000485e <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    80004844:	4681                	li	a3,0
    80004846:	4601                	li	a2,0
    80004848:	fe843583          	ld	a1,-24(s0)
    8000484c:	4501                	li	a0,0
    8000484e:	00005097          	auipc	ra,0x5
    80004852:	d14080e7          	jalr	-748(ra) # 80009562 <virtio_disk_rw>
    b->valid = 1;
    80004856:	fe843783          	ld	a5,-24(s0)
    8000485a:	4705                	li	a4,1
    8000485c:	c398                	sw	a4,0(a5)
  }
  return b;
    8000485e:	fe843783          	ld	a5,-24(s0)
}
    80004862:	853e                	mv	a0,a5
    80004864:	70a2                	ld	ra,40(sp)
    80004866:	7402                	ld	s0,32(sp)
    80004868:	6145                	addi	sp,sp,48
    8000486a:	8082                	ret

000000008000486c <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    8000486c:	1101                	addi	sp,sp,-32
    8000486e:	ec06                	sd	ra,24(sp)
    80004870:	e822                	sd	s0,16(sp)
    80004872:	1000                	addi	s0,sp,32
    80004874:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004878:	fe843783          	ld	a5,-24(s0)
    8000487c:	07c1                	addi	a5,a5,16
    8000487e:	853e                	mv	a0,a5
    80004880:	00002097          	auipc	ra,0x2
    80004884:	f2a080e7          	jalr	-214(ra) # 800067aa <holdingsleep>
    80004888:	87aa                	mv	a5,a0
    8000488a:	eb89                	bnez	a5,8000489c <bwrite+0x30>
    panic("bwrite");
    8000488c:	00007517          	auipc	a0,0x7
    80004890:	bcc50513          	addi	a0,a0,-1076 # 8000b458 <etext+0x458>
    80004894:	ffffc097          	auipc	ra,0xffffc
    80004898:	3f8080e7          	jalr	1016(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    8000489c:	4681                	li	a3,0
    8000489e:	4605                	li	a2,1
    800048a0:	fe843583          	ld	a1,-24(s0)
    800048a4:	4501                	li	a0,0
    800048a6:	00005097          	auipc	ra,0x5
    800048aa:	cbc080e7          	jalr	-836(ra) # 80009562 <virtio_disk_rw>
}
    800048ae:	0001                	nop
    800048b0:	60e2                	ld	ra,24(sp)
    800048b2:	6442                	ld	s0,16(sp)
    800048b4:	6105                	addi	sp,sp,32
    800048b6:	8082                	ret

00000000800048b8 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    800048b8:	1101                	addi	sp,sp,-32
    800048ba:	ec06                	sd	ra,24(sp)
    800048bc:	e822                	sd	s0,16(sp)
    800048be:	1000                	addi	s0,sp,32
    800048c0:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800048c4:	fe843783          	ld	a5,-24(s0)
    800048c8:	07c1                	addi	a5,a5,16
    800048ca:	853e                	mv	a0,a5
    800048cc:	00002097          	auipc	ra,0x2
    800048d0:	ede080e7          	jalr	-290(ra) # 800067aa <holdingsleep>
    800048d4:	87aa                	mv	a5,a0
    800048d6:	eb89                	bnez	a5,800048e8 <brelse+0x30>
    panic("brelse");
    800048d8:	00007517          	auipc	a0,0x7
    800048dc:	b8850513          	addi	a0,a0,-1144 # 8000b460 <etext+0x460>
    800048e0:	ffffc097          	auipc	ra,0xffffc
    800048e4:	3ac080e7          	jalr	940(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    800048e8:	fe843783          	ld	a5,-24(s0)
    800048ec:	07c1                	addi	a5,a5,16
    800048ee:	853e                	mv	a0,a5
    800048f0:	00002097          	auipc	ra,0x2
    800048f4:	e68080e7          	jalr	-408(ra) # 80006758 <releasesleep>

  acquire(&bcache.lock);
    800048f8:	00025517          	auipc	a0,0x25
    800048fc:	10850513          	addi	a0,a0,264 # 80029a00 <bcache>
    80004900:	ffffd097          	auipc	ra,0xffffd
    80004904:	a2a080e7          	jalr	-1494(ra) # 8000132a <acquire>
  b->refcnt--;
    80004908:	fe843783          	ld	a5,-24(s0)
    8000490c:	43bc                	lw	a5,64(a5)
    8000490e:	37fd                	addiw	a5,a5,-1
    80004910:	0007871b          	sext.w	a4,a5
    80004914:	fe843783          	ld	a5,-24(s0)
    80004918:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    8000491a:	fe843783          	ld	a5,-24(s0)
    8000491e:	43bc                	lw	a5,64(a5)
    80004920:	e7b5                	bnez	a5,8000498c <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004922:	fe843783          	ld	a5,-24(s0)
    80004926:	6bbc                	ld	a5,80(a5)
    80004928:	fe843703          	ld	a4,-24(s0)
    8000492c:	6738                	ld	a4,72(a4)
    8000492e:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004930:	fe843783          	ld	a5,-24(s0)
    80004934:	67bc                	ld	a5,72(a5)
    80004936:	fe843703          	ld	a4,-24(s0)
    8000493a:	6b38                	ld	a4,80(a4)
    8000493c:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    8000493e:	00025717          	auipc	a4,0x25
    80004942:	0c270713          	addi	a4,a4,194 # 80029a00 <bcache>
    80004946:	67a1                	lui	a5,0x8
    80004948:	97ba                	add	a5,a5,a4
    8000494a:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000494e:	fe843783          	ld	a5,-24(s0)
    80004952:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004954:	fe843783          	ld	a5,-24(s0)
    80004958:	0002d717          	auipc	a4,0x2d
    8000495c:	31070713          	addi	a4,a4,784 # 80031c68 <bcache+0x8268>
    80004960:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004962:	00025717          	auipc	a4,0x25
    80004966:	09e70713          	addi	a4,a4,158 # 80029a00 <bcache>
    8000496a:	67a1                	lui	a5,0x8
    8000496c:	97ba                	add	a5,a5,a4
    8000496e:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004972:	fe843703          	ld	a4,-24(s0)
    80004976:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004978:	00025717          	auipc	a4,0x25
    8000497c:	08870713          	addi	a4,a4,136 # 80029a00 <bcache>
    80004980:	67a1                	lui	a5,0x8
    80004982:	97ba                	add	a5,a5,a4
    80004984:	fe843703          	ld	a4,-24(s0)
    80004988:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    8000498c:	00025517          	auipc	a0,0x25
    80004990:	07450513          	addi	a0,a0,116 # 80029a00 <bcache>
    80004994:	ffffd097          	auipc	ra,0xffffd
    80004998:	9fa080e7          	jalr	-1542(ra) # 8000138e <release>
}
    8000499c:	0001                	nop
    8000499e:	60e2                	ld	ra,24(sp)
    800049a0:	6442                	ld	s0,16(sp)
    800049a2:	6105                	addi	sp,sp,32
    800049a4:	8082                	ret

00000000800049a6 <bpin>:

void
bpin(struct buf *b) {
    800049a6:	1101                	addi	sp,sp,-32
    800049a8:	ec06                	sd	ra,24(sp)
    800049aa:	e822                	sd	s0,16(sp)
    800049ac:	1000                	addi	s0,sp,32
    800049ae:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    800049b2:	00025517          	auipc	a0,0x25
    800049b6:	04e50513          	addi	a0,a0,78 # 80029a00 <bcache>
    800049ba:	ffffd097          	auipc	ra,0xffffd
    800049be:	970080e7          	jalr	-1680(ra) # 8000132a <acquire>
  b->refcnt++;
    800049c2:	fe843783          	ld	a5,-24(s0)
    800049c6:	43bc                	lw	a5,64(a5)
    800049c8:	2785                	addiw	a5,a5,1
    800049ca:	0007871b          	sext.w	a4,a5
    800049ce:	fe843783          	ld	a5,-24(s0)
    800049d2:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    800049d4:	00025517          	auipc	a0,0x25
    800049d8:	02c50513          	addi	a0,a0,44 # 80029a00 <bcache>
    800049dc:	ffffd097          	auipc	ra,0xffffd
    800049e0:	9b2080e7          	jalr	-1614(ra) # 8000138e <release>
}
    800049e4:	0001                	nop
    800049e6:	60e2                	ld	ra,24(sp)
    800049e8:	6442                	ld	s0,16(sp)
    800049ea:	6105                	addi	sp,sp,32
    800049ec:	8082                	ret

00000000800049ee <bunpin>:

void
bunpin(struct buf *b) {
    800049ee:	1101                	addi	sp,sp,-32
    800049f0:	ec06                	sd	ra,24(sp)
    800049f2:	e822                	sd	s0,16(sp)
    800049f4:	1000                	addi	s0,sp,32
    800049f6:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    800049fa:	00025517          	auipc	a0,0x25
    800049fe:	00650513          	addi	a0,a0,6 # 80029a00 <bcache>
    80004a02:	ffffd097          	auipc	ra,0xffffd
    80004a06:	928080e7          	jalr	-1752(ra) # 8000132a <acquire>
  b->refcnt--;
    80004a0a:	fe843783          	ld	a5,-24(s0)
    80004a0e:	43bc                	lw	a5,64(a5)
    80004a10:	37fd                	addiw	a5,a5,-1
    80004a12:	0007871b          	sext.w	a4,a5
    80004a16:	fe843783          	ld	a5,-24(s0)
    80004a1a:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004a1c:	00025517          	auipc	a0,0x25
    80004a20:	fe450513          	addi	a0,a0,-28 # 80029a00 <bcache>
    80004a24:	ffffd097          	auipc	ra,0xffffd
    80004a28:	96a080e7          	jalr	-1686(ra) # 8000138e <release>
}
    80004a2c:	0001                	nop
    80004a2e:	60e2                	ld	ra,24(sp)
    80004a30:	6442                	ld	s0,16(sp)
    80004a32:	6105                	addi	sp,sp,32
    80004a34:	8082                	ret

0000000080004a36 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004a36:	7179                	addi	sp,sp,-48
    80004a38:	f406                	sd	ra,40(sp)
    80004a3a:	f022                	sd	s0,32(sp)
    80004a3c:	1800                	addi	s0,sp,48
    80004a3e:	87aa                	mv	a5,a0
    80004a40:	fcb43823          	sd	a1,-48(s0)
    80004a44:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004a48:	fdc42783          	lw	a5,-36(s0)
    80004a4c:	4585                	li	a1,1
    80004a4e:	853e                	mv	a0,a5
    80004a50:	00000097          	auipc	ra,0x0
    80004a54:	dbe080e7          	jalr	-578(ra) # 8000480e <bread>
    80004a58:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004a5c:	fe843783          	ld	a5,-24(s0)
    80004a60:	05878793          	addi	a5,a5,88
    80004a64:	02000613          	li	a2,32
    80004a68:	85be                	mv	a1,a5
    80004a6a:	fd043503          	ld	a0,-48(s0)
    80004a6e:	ffffd097          	auipc	ra,0xffffd
    80004a72:	b74080e7          	jalr	-1164(ra) # 800015e2 <memmove>
  brelse(bp);
    80004a76:	fe843503          	ld	a0,-24(s0)
    80004a7a:	00000097          	auipc	ra,0x0
    80004a7e:	e3e080e7          	jalr	-450(ra) # 800048b8 <brelse>
}
    80004a82:	0001                	nop
    80004a84:	70a2                	ld	ra,40(sp)
    80004a86:	7402                	ld	s0,32(sp)
    80004a88:	6145                	addi	sp,sp,48
    80004a8a:	8082                	ret

0000000080004a8c <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004a8c:	1101                	addi	sp,sp,-32
    80004a8e:	ec06                	sd	ra,24(sp)
    80004a90:	e822                	sd	s0,16(sp)
    80004a92:	1000                	addi	s0,sp,32
    80004a94:	87aa                	mv	a5,a0
    80004a96:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004a9a:	fec42783          	lw	a5,-20(s0)
    80004a9e:	0002d597          	auipc	a1,0x2d
    80004aa2:	62258593          	addi	a1,a1,1570 # 800320c0 <sb>
    80004aa6:	853e                	mv	a0,a5
    80004aa8:	00000097          	auipc	ra,0x0
    80004aac:	f8e080e7          	jalr	-114(ra) # 80004a36 <readsb>
  if(sb.magic != FSMAGIC)
    80004ab0:	0002d797          	auipc	a5,0x2d
    80004ab4:	61078793          	addi	a5,a5,1552 # 800320c0 <sb>
    80004ab8:	439c                	lw	a5,0(a5)
    80004aba:	873e                	mv	a4,a5
    80004abc:	102037b7          	lui	a5,0x10203
    80004ac0:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004ac4:	00f70a63          	beq	a4,a5,80004ad8 <fsinit+0x4c>
    panic("invalid file system");
    80004ac8:	00007517          	auipc	a0,0x7
    80004acc:	9a050513          	addi	a0,a0,-1632 # 8000b468 <etext+0x468>
    80004ad0:	ffffc097          	auipc	ra,0xffffc
    80004ad4:	1bc080e7          	jalr	444(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004ad8:	fec42783          	lw	a5,-20(s0)
    80004adc:	0002d597          	auipc	a1,0x2d
    80004ae0:	5e458593          	addi	a1,a1,1508 # 800320c0 <sb>
    80004ae4:	853e                	mv	a0,a5
    80004ae6:	00001097          	auipc	ra,0x1
    80004aea:	49c080e7          	jalr	1180(ra) # 80005f82 <initlog>
}
    80004aee:	0001                	nop
    80004af0:	60e2                	ld	ra,24(sp)
    80004af2:	6442                	ld	s0,16(sp)
    80004af4:	6105                	addi	sp,sp,32
    80004af6:	8082                	ret

0000000080004af8 <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004af8:	7179                	addi	sp,sp,-48
    80004afa:	f406                	sd	ra,40(sp)
    80004afc:	f022                	sd	s0,32(sp)
    80004afe:	1800                	addi	s0,sp,48
    80004b00:	87aa                	mv	a5,a0
    80004b02:	872e                	mv	a4,a1
    80004b04:	fcf42e23          	sw	a5,-36(s0)
    80004b08:	87ba                	mv	a5,a4
    80004b0a:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004b0e:	fdc42783          	lw	a5,-36(s0)
    80004b12:	fd842703          	lw	a4,-40(s0)
    80004b16:	85ba                	mv	a1,a4
    80004b18:	853e                	mv	a0,a5
    80004b1a:	00000097          	auipc	ra,0x0
    80004b1e:	cf4080e7          	jalr	-780(ra) # 8000480e <bread>
    80004b22:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004b26:	fe843783          	ld	a5,-24(s0)
    80004b2a:	05878793          	addi	a5,a5,88
    80004b2e:	40000613          	li	a2,1024
    80004b32:	4581                	li	a1,0
    80004b34:	853e                	mv	a0,a5
    80004b36:	ffffd097          	auipc	ra,0xffffd
    80004b3a:	9c8080e7          	jalr	-1592(ra) # 800014fe <memset>
  log_write(bp);
    80004b3e:	fe843503          	ld	a0,-24(s0)
    80004b42:	00002097          	auipc	ra,0x2
    80004b46:	a28080e7          	jalr	-1496(ra) # 8000656a <log_write>
  brelse(bp);
    80004b4a:	fe843503          	ld	a0,-24(s0)
    80004b4e:	00000097          	auipc	ra,0x0
    80004b52:	d6a080e7          	jalr	-662(ra) # 800048b8 <brelse>
}
    80004b56:	0001                	nop
    80004b58:	70a2                	ld	ra,40(sp)
    80004b5a:	7402                	ld	s0,32(sp)
    80004b5c:	6145                	addi	sp,sp,48
    80004b5e:	8082                	ret

0000000080004b60 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004b60:	7139                	addi	sp,sp,-64
    80004b62:	fc06                	sd	ra,56(sp)
    80004b64:	f822                	sd	s0,48(sp)
    80004b66:	0080                	addi	s0,sp,64
    80004b68:	87aa                	mv	a5,a0
    80004b6a:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004b6e:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004b72:	fe042623          	sw	zero,-20(s0)
    80004b76:	a2b5                	j	80004ce2 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004b78:	fec42783          	lw	a5,-20(s0)
    80004b7c:	41f7d71b          	sraiw	a4,a5,0x1f
    80004b80:	0137571b          	srliw	a4,a4,0x13
    80004b84:	9fb9                	addw	a5,a5,a4
    80004b86:	40d7d79b          	sraiw	a5,a5,0xd
    80004b8a:	2781                	sext.w	a5,a5
    80004b8c:	0007871b          	sext.w	a4,a5
    80004b90:	0002d797          	auipc	a5,0x2d
    80004b94:	53078793          	addi	a5,a5,1328 # 800320c0 <sb>
    80004b98:	4fdc                	lw	a5,28(a5)
    80004b9a:	9fb9                	addw	a5,a5,a4
    80004b9c:	0007871b          	sext.w	a4,a5
    80004ba0:	fcc42783          	lw	a5,-52(s0)
    80004ba4:	85ba                	mv	a1,a4
    80004ba6:	853e                	mv	a0,a5
    80004ba8:	00000097          	auipc	ra,0x0
    80004bac:	c66080e7          	jalr	-922(ra) # 8000480e <bread>
    80004bb0:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004bb4:	fe042423          	sw	zero,-24(s0)
    80004bb8:	a0dd                	j	80004c9e <balloc+0x13e>
      m = 1 << (bi % 8);
    80004bba:	fe842703          	lw	a4,-24(s0)
    80004bbe:	41f7579b          	sraiw	a5,a4,0x1f
    80004bc2:	01d7d79b          	srliw	a5,a5,0x1d
    80004bc6:	9f3d                	addw	a4,a4,a5
    80004bc8:	8b1d                	andi	a4,a4,7
    80004bca:	40f707bb          	subw	a5,a4,a5
    80004bce:	2781                	sext.w	a5,a5
    80004bd0:	4705                	li	a4,1
    80004bd2:	00f717bb          	sllw	a5,a4,a5
    80004bd6:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004bda:	fe842783          	lw	a5,-24(s0)
    80004bde:	41f7d71b          	sraiw	a4,a5,0x1f
    80004be2:	01d7571b          	srliw	a4,a4,0x1d
    80004be6:	9fb9                	addw	a5,a5,a4
    80004be8:	4037d79b          	sraiw	a5,a5,0x3
    80004bec:	2781                	sext.w	a5,a5
    80004bee:	fe043703          	ld	a4,-32(s0)
    80004bf2:	97ba                	add	a5,a5,a4
    80004bf4:	0587c783          	lbu	a5,88(a5)
    80004bf8:	0007871b          	sext.w	a4,a5
    80004bfc:	fdc42783          	lw	a5,-36(s0)
    80004c00:	8ff9                	and	a5,a5,a4
    80004c02:	2781                	sext.w	a5,a5
    80004c04:	ebc1                	bnez	a5,80004c94 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004c06:	fe842783          	lw	a5,-24(s0)
    80004c0a:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c0e:	01d7571b          	srliw	a4,a4,0x1d
    80004c12:	9fb9                	addw	a5,a5,a4
    80004c14:	4037d79b          	sraiw	a5,a5,0x3
    80004c18:	2781                	sext.w	a5,a5
    80004c1a:	fe043703          	ld	a4,-32(s0)
    80004c1e:	973e                	add	a4,a4,a5
    80004c20:	05874703          	lbu	a4,88(a4)
    80004c24:	0187169b          	slliw	a3,a4,0x18
    80004c28:	4186d69b          	sraiw	a3,a3,0x18
    80004c2c:	fdc42703          	lw	a4,-36(s0)
    80004c30:	0187171b          	slliw	a4,a4,0x18
    80004c34:	4187571b          	sraiw	a4,a4,0x18
    80004c38:	8f55                	or	a4,a4,a3
    80004c3a:	0187171b          	slliw	a4,a4,0x18
    80004c3e:	4187571b          	sraiw	a4,a4,0x18
    80004c42:	0ff77713          	andi	a4,a4,255
    80004c46:	fe043683          	ld	a3,-32(s0)
    80004c4a:	97b6                	add	a5,a5,a3
    80004c4c:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004c50:	fe043503          	ld	a0,-32(s0)
    80004c54:	00002097          	auipc	ra,0x2
    80004c58:	916080e7          	jalr	-1770(ra) # 8000656a <log_write>
        brelse(bp);
    80004c5c:	fe043503          	ld	a0,-32(s0)
    80004c60:	00000097          	auipc	ra,0x0
    80004c64:	c58080e7          	jalr	-936(ra) # 800048b8 <brelse>
        bzero(dev, b + bi);
    80004c68:	fcc42683          	lw	a3,-52(s0)
    80004c6c:	fec42703          	lw	a4,-20(s0)
    80004c70:	fe842783          	lw	a5,-24(s0)
    80004c74:	9fb9                	addw	a5,a5,a4
    80004c76:	2781                	sext.w	a5,a5
    80004c78:	85be                	mv	a1,a5
    80004c7a:	8536                	mv	a0,a3
    80004c7c:	00000097          	auipc	ra,0x0
    80004c80:	e7c080e7          	jalr	-388(ra) # 80004af8 <bzero>
        return b + bi;
    80004c84:	fec42703          	lw	a4,-20(s0)
    80004c88:	fe842783          	lw	a5,-24(s0)
    80004c8c:	9fb9                	addw	a5,a5,a4
    80004c8e:	2781                	sext.w	a5,a5
    80004c90:	2781                	sext.w	a5,a5
    80004c92:	a895                	j	80004d06 <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004c94:	fe842783          	lw	a5,-24(s0)
    80004c98:	2785                	addiw	a5,a5,1
    80004c9a:	fef42423          	sw	a5,-24(s0)
    80004c9e:	fe842783          	lw	a5,-24(s0)
    80004ca2:	0007871b          	sext.w	a4,a5
    80004ca6:	6789                	lui	a5,0x2
    80004ca8:	02f75163          	bge	a4,a5,80004cca <balloc+0x16a>
    80004cac:	fec42703          	lw	a4,-20(s0)
    80004cb0:	fe842783          	lw	a5,-24(s0)
    80004cb4:	9fb9                	addw	a5,a5,a4
    80004cb6:	2781                	sext.w	a5,a5
    80004cb8:	0007871b          	sext.w	a4,a5
    80004cbc:	0002d797          	auipc	a5,0x2d
    80004cc0:	40478793          	addi	a5,a5,1028 # 800320c0 <sb>
    80004cc4:	43dc                	lw	a5,4(a5)
    80004cc6:	eef76ae3          	bltu	a4,a5,80004bba <balloc+0x5a>
      }
    }
    brelse(bp);
    80004cca:	fe043503          	ld	a0,-32(s0)
    80004cce:	00000097          	auipc	ra,0x0
    80004cd2:	bea080e7          	jalr	-1046(ra) # 800048b8 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004cd6:	fec42703          	lw	a4,-20(s0)
    80004cda:	6789                	lui	a5,0x2
    80004cdc:	9fb9                	addw	a5,a5,a4
    80004cde:	fef42623          	sw	a5,-20(s0)
    80004ce2:	0002d797          	auipc	a5,0x2d
    80004ce6:	3de78793          	addi	a5,a5,990 # 800320c0 <sb>
    80004cea:	43d8                	lw	a4,4(a5)
    80004cec:	fec42783          	lw	a5,-20(s0)
    80004cf0:	e8e7e4e3          	bltu	a5,a4,80004b78 <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004cf4:	00006517          	auipc	a0,0x6
    80004cf8:	78c50513          	addi	a0,a0,1932 # 8000b480 <etext+0x480>
    80004cfc:	ffffc097          	auipc	ra,0xffffc
    80004d00:	d3a080e7          	jalr	-710(ra) # 80000a36 <printf>
  return 0;
    80004d04:	4781                	li	a5,0
}
    80004d06:	853e                	mv	a0,a5
    80004d08:	70e2                	ld	ra,56(sp)
    80004d0a:	7442                	ld	s0,48(sp)
    80004d0c:	6121                	addi	sp,sp,64
    80004d0e:	8082                	ret

0000000080004d10 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004d10:	7179                	addi	sp,sp,-48
    80004d12:	f406                	sd	ra,40(sp)
    80004d14:	f022                	sd	s0,32(sp)
    80004d16:	1800                	addi	s0,sp,48
    80004d18:	87aa                	mv	a5,a0
    80004d1a:	872e                	mv	a4,a1
    80004d1c:	fcf42e23          	sw	a5,-36(s0)
    80004d20:	87ba                	mv	a5,a4
    80004d22:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004d26:	fdc42683          	lw	a3,-36(s0)
    80004d2a:	fd842783          	lw	a5,-40(s0)
    80004d2e:	00d7d79b          	srliw	a5,a5,0xd
    80004d32:	0007871b          	sext.w	a4,a5
    80004d36:	0002d797          	auipc	a5,0x2d
    80004d3a:	38a78793          	addi	a5,a5,906 # 800320c0 <sb>
    80004d3e:	4fdc                	lw	a5,28(a5)
    80004d40:	9fb9                	addw	a5,a5,a4
    80004d42:	2781                	sext.w	a5,a5
    80004d44:	85be                	mv	a1,a5
    80004d46:	8536                	mv	a0,a3
    80004d48:	00000097          	auipc	ra,0x0
    80004d4c:	ac6080e7          	jalr	-1338(ra) # 8000480e <bread>
    80004d50:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004d54:	fd842703          	lw	a4,-40(s0)
    80004d58:	6789                	lui	a5,0x2
    80004d5a:	17fd                	addi	a5,a5,-1
    80004d5c:	8ff9                	and	a5,a5,a4
    80004d5e:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004d62:	fe442703          	lw	a4,-28(s0)
    80004d66:	41f7579b          	sraiw	a5,a4,0x1f
    80004d6a:	01d7d79b          	srliw	a5,a5,0x1d
    80004d6e:	9f3d                	addw	a4,a4,a5
    80004d70:	8b1d                	andi	a4,a4,7
    80004d72:	40f707bb          	subw	a5,a4,a5
    80004d76:	2781                	sext.w	a5,a5
    80004d78:	4705                	li	a4,1
    80004d7a:	00f717bb          	sllw	a5,a4,a5
    80004d7e:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004d82:	fe442783          	lw	a5,-28(s0)
    80004d86:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d8a:	01d7571b          	srliw	a4,a4,0x1d
    80004d8e:	9fb9                	addw	a5,a5,a4
    80004d90:	4037d79b          	sraiw	a5,a5,0x3
    80004d94:	2781                	sext.w	a5,a5
    80004d96:	fe843703          	ld	a4,-24(s0)
    80004d9a:	97ba                	add	a5,a5,a4
    80004d9c:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004da0:	0007871b          	sext.w	a4,a5
    80004da4:	fe042783          	lw	a5,-32(s0)
    80004da8:	8ff9                	and	a5,a5,a4
    80004daa:	2781                	sext.w	a5,a5
    80004dac:	eb89                	bnez	a5,80004dbe <bfree+0xae>
    panic("freeing free block");
    80004dae:	00006517          	auipc	a0,0x6
    80004db2:	6ea50513          	addi	a0,a0,1770 # 8000b498 <etext+0x498>
    80004db6:	ffffc097          	auipc	ra,0xffffc
    80004dba:	ed6080e7          	jalr	-298(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    80004dbe:	fe442783          	lw	a5,-28(s0)
    80004dc2:	41f7d71b          	sraiw	a4,a5,0x1f
    80004dc6:	01d7571b          	srliw	a4,a4,0x1d
    80004dca:	9fb9                	addw	a5,a5,a4
    80004dcc:	4037d79b          	sraiw	a5,a5,0x3
    80004dd0:	2781                	sext.w	a5,a5
    80004dd2:	fe843703          	ld	a4,-24(s0)
    80004dd6:	973e                	add	a4,a4,a5
    80004dd8:	05874703          	lbu	a4,88(a4)
    80004ddc:	0187169b          	slliw	a3,a4,0x18
    80004de0:	4186d69b          	sraiw	a3,a3,0x18
    80004de4:	fe042703          	lw	a4,-32(s0)
    80004de8:	0187171b          	slliw	a4,a4,0x18
    80004dec:	4187571b          	sraiw	a4,a4,0x18
    80004df0:	fff74713          	not	a4,a4
    80004df4:	0187171b          	slliw	a4,a4,0x18
    80004df8:	4187571b          	sraiw	a4,a4,0x18
    80004dfc:	8f75                	and	a4,a4,a3
    80004dfe:	0187171b          	slliw	a4,a4,0x18
    80004e02:	4187571b          	sraiw	a4,a4,0x18
    80004e06:	0ff77713          	andi	a4,a4,255
    80004e0a:	fe843683          	ld	a3,-24(s0)
    80004e0e:	97b6                	add	a5,a5,a3
    80004e10:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004e14:	fe843503          	ld	a0,-24(s0)
    80004e18:	00001097          	auipc	ra,0x1
    80004e1c:	752080e7          	jalr	1874(ra) # 8000656a <log_write>
  brelse(bp);
    80004e20:	fe843503          	ld	a0,-24(s0)
    80004e24:	00000097          	auipc	ra,0x0
    80004e28:	a94080e7          	jalr	-1388(ra) # 800048b8 <brelse>
}
    80004e2c:	0001                	nop
    80004e2e:	70a2                	ld	ra,40(sp)
    80004e30:	7402                	ld	s0,32(sp)
    80004e32:	6145                	addi	sp,sp,48
    80004e34:	8082                	ret

0000000080004e36 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004e36:	1101                	addi	sp,sp,-32
    80004e38:	ec06                	sd	ra,24(sp)
    80004e3a:	e822                	sd	s0,16(sp)
    80004e3c:	1000                	addi	s0,sp,32
  int i = 0;
    80004e3e:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004e42:	00006597          	auipc	a1,0x6
    80004e46:	66e58593          	addi	a1,a1,1646 # 8000b4b0 <etext+0x4b0>
    80004e4a:	0002d517          	auipc	a0,0x2d
    80004e4e:	29650513          	addi	a0,a0,662 # 800320e0 <itable>
    80004e52:	ffffc097          	auipc	ra,0xffffc
    80004e56:	4a8080e7          	jalr	1192(ra) # 800012fa <initlock>
  for(i = 0; i < NINODE; i++) {
    80004e5a:	fe042623          	sw	zero,-20(s0)
    80004e5e:	a82d                	j	80004e98 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004e60:	fec42703          	lw	a4,-20(s0)
    80004e64:	87ba                	mv	a5,a4
    80004e66:	0792                	slli	a5,a5,0x4
    80004e68:	97ba                	add	a5,a5,a4
    80004e6a:	078e                	slli	a5,a5,0x3
    80004e6c:	02078713          	addi	a4,a5,32
    80004e70:	0002d797          	auipc	a5,0x2d
    80004e74:	27078793          	addi	a5,a5,624 # 800320e0 <itable>
    80004e78:	97ba                	add	a5,a5,a4
    80004e7a:	07a1                	addi	a5,a5,8
    80004e7c:	00006597          	auipc	a1,0x6
    80004e80:	63c58593          	addi	a1,a1,1596 # 8000b4b8 <etext+0x4b8>
    80004e84:	853e                	mv	a0,a5
    80004e86:	00002097          	auipc	ra,0x2
    80004e8a:	818080e7          	jalr	-2024(ra) # 8000669e <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004e8e:	fec42783          	lw	a5,-20(s0)
    80004e92:	2785                	addiw	a5,a5,1
    80004e94:	fef42623          	sw	a5,-20(s0)
    80004e98:	fec42783          	lw	a5,-20(s0)
    80004e9c:	0007871b          	sext.w	a4,a5
    80004ea0:	03100793          	li	a5,49
    80004ea4:	fae7dee3          	bge	a5,a4,80004e60 <iinit+0x2a>
  }
}
    80004ea8:	0001                	nop
    80004eaa:	0001                	nop
    80004eac:	60e2                	ld	ra,24(sp)
    80004eae:	6442                	ld	s0,16(sp)
    80004eb0:	6105                	addi	sp,sp,32
    80004eb2:	8082                	ret

0000000080004eb4 <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004eb4:	7139                	addi	sp,sp,-64
    80004eb6:	fc06                	sd	ra,56(sp)
    80004eb8:	f822                	sd	s0,48(sp)
    80004eba:	0080                	addi	s0,sp,64
    80004ebc:	87aa                	mv	a5,a0
    80004ebe:	872e                	mv	a4,a1
    80004ec0:	fcf42623          	sw	a5,-52(s0)
    80004ec4:	87ba                	mv	a5,a4
    80004ec6:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004eca:	4785                	li	a5,1
    80004ecc:	fef42623          	sw	a5,-20(s0)
    80004ed0:	a855                	j	80004f84 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004ed2:	fec42783          	lw	a5,-20(s0)
    80004ed6:	8391                	srli	a5,a5,0x4
    80004ed8:	0007871b          	sext.w	a4,a5
    80004edc:	0002d797          	auipc	a5,0x2d
    80004ee0:	1e478793          	addi	a5,a5,484 # 800320c0 <sb>
    80004ee4:	4f9c                	lw	a5,24(a5)
    80004ee6:	9fb9                	addw	a5,a5,a4
    80004ee8:	0007871b          	sext.w	a4,a5
    80004eec:	fcc42783          	lw	a5,-52(s0)
    80004ef0:	85ba                	mv	a1,a4
    80004ef2:	853e                	mv	a0,a5
    80004ef4:	00000097          	auipc	ra,0x0
    80004ef8:	91a080e7          	jalr	-1766(ra) # 8000480e <bread>
    80004efc:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004f00:	fe043783          	ld	a5,-32(s0)
    80004f04:	05878713          	addi	a4,a5,88
    80004f08:	fec42783          	lw	a5,-20(s0)
    80004f0c:	8bbd                	andi	a5,a5,15
    80004f0e:	079a                	slli	a5,a5,0x6
    80004f10:	97ba                	add	a5,a5,a4
    80004f12:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004f16:	fd843783          	ld	a5,-40(s0)
    80004f1a:	00079783          	lh	a5,0(a5)
    80004f1e:	eba1                	bnez	a5,80004f6e <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004f20:	04000613          	li	a2,64
    80004f24:	4581                	li	a1,0
    80004f26:	fd843503          	ld	a0,-40(s0)
    80004f2a:	ffffc097          	auipc	ra,0xffffc
    80004f2e:	5d4080e7          	jalr	1492(ra) # 800014fe <memset>
      dip->type = type;
    80004f32:	fd843783          	ld	a5,-40(s0)
    80004f36:	fca45703          	lhu	a4,-54(s0)
    80004f3a:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80004f3e:	fe043503          	ld	a0,-32(s0)
    80004f42:	00001097          	auipc	ra,0x1
    80004f46:	628080e7          	jalr	1576(ra) # 8000656a <log_write>
      brelse(bp);
    80004f4a:	fe043503          	ld	a0,-32(s0)
    80004f4e:	00000097          	auipc	ra,0x0
    80004f52:	96a080e7          	jalr	-1686(ra) # 800048b8 <brelse>
      return iget(dev, inum);
    80004f56:	fec42703          	lw	a4,-20(s0)
    80004f5a:	fcc42783          	lw	a5,-52(s0)
    80004f5e:	85ba                	mv	a1,a4
    80004f60:	853e                	mv	a0,a5
    80004f62:	00000097          	auipc	ra,0x0
    80004f66:	138080e7          	jalr	312(ra) # 8000509a <iget>
    80004f6a:	87aa                	mv	a5,a0
    80004f6c:	a835                	j	80004fa8 <ialloc+0xf4>
    }
    brelse(bp);
    80004f6e:	fe043503          	ld	a0,-32(s0)
    80004f72:	00000097          	auipc	ra,0x0
    80004f76:	946080e7          	jalr	-1722(ra) # 800048b8 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80004f7a:	fec42783          	lw	a5,-20(s0)
    80004f7e:	2785                	addiw	a5,a5,1
    80004f80:	fef42623          	sw	a5,-20(s0)
    80004f84:	0002d797          	auipc	a5,0x2d
    80004f88:	13c78793          	addi	a5,a5,316 # 800320c0 <sb>
    80004f8c:	47d8                	lw	a4,12(a5)
    80004f8e:	fec42783          	lw	a5,-20(s0)
    80004f92:	f4e7e0e3          	bltu	a5,a4,80004ed2 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    80004f96:	00006517          	auipc	a0,0x6
    80004f9a:	52a50513          	addi	a0,a0,1322 # 8000b4c0 <etext+0x4c0>
    80004f9e:	ffffc097          	auipc	ra,0xffffc
    80004fa2:	a98080e7          	jalr	-1384(ra) # 80000a36 <printf>
  return 0;
    80004fa6:	4781                	li	a5,0
}
    80004fa8:	853e                	mv	a0,a5
    80004faa:	70e2                	ld	ra,56(sp)
    80004fac:	7442                	ld	s0,48(sp)
    80004fae:	6121                	addi	sp,sp,64
    80004fb0:	8082                	ret

0000000080004fb2 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80004fb2:	7179                	addi	sp,sp,-48
    80004fb4:	f406                	sd	ra,40(sp)
    80004fb6:	f022                	sd	s0,32(sp)
    80004fb8:	1800                	addi	s0,sp,48
    80004fba:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80004fbe:	fd843783          	ld	a5,-40(s0)
    80004fc2:	4394                	lw	a3,0(a5)
    80004fc4:	fd843783          	ld	a5,-40(s0)
    80004fc8:	43dc                	lw	a5,4(a5)
    80004fca:	0047d79b          	srliw	a5,a5,0x4
    80004fce:	0007871b          	sext.w	a4,a5
    80004fd2:	0002d797          	auipc	a5,0x2d
    80004fd6:	0ee78793          	addi	a5,a5,238 # 800320c0 <sb>
    80004fda:	4f9c                	lw	a5,24(a5)
    80004fdc:	9fb9                	addw	a5,a5,a4
    80004fde:	2781                	sext.w	a5,a5
    80004fe0:	85be                	mv	a1,a5
    80004fe2:	8536                	mv	a0,a3
    80004fe4:	00000097          	auipc	ra,0x0
    80004fe8:	82a080e7          	jalr	-2006(ra) # 8000480e <bread>
    80004fec:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80004ff0:	fe843783          	ld	a5,-24(s0)
    80004ff4:	05878713          	addi	a4,a5,88
    80004ff8:	fd843783          	ld	a5,-40(s0)
    80004ffc:	43dc                	lw	a5,4(a5)
    80004ffe:	1782                	slli	a5,a5,0x20
    80005000:	9381                	srli	a5,a5,0x20
    80005002:	8bbd                	andi	a5,a5,15
    80005004:	079a                	slli	a5,a5,0x6
    80005006:	97ba                	add	a5,a5,a4
    80005008:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    8000500c:	fd843783          	ld	a5,-40(s0)
    80005010:	04479703          	lh	a4,68(a5)
    80005014:	fe043783          	ld	a5,-32(s0)
    80005018:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    8000501c:	fd843783          	ld	a5,-40(s0)
    80005020:	04679703          	lh	a4,70(a5)
    80005024:	fe043783          	ld	a5,-32(s0)
    80005028:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    8000502c:	fd843783          	ld	a5,-40(s0)
    80005030:	04879703          	lh	a4,72(a5)
    80005034:	fe043783          	ld	a5,-32(s0)
    80005038:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    8000503c:	fd843783          	ld	a5,-40(s0)
    80005040:	04a79703          	lh	a4,74(a5)
    80005044:	fe043783          	ld	a5,-32(s0)
    80005048:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    8000504c:	fd843783          	ld	a5,-40(s0)
    80005050:	47f8                	lw	a4,76(a5)
    80005052:	fe043783          	ld	a5,-32(s0)
    80005056:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005058:	fe043783          	ld	a5,-32(s0)
    8000505c:	00c78713          	addi	a4,a5,12
    80005060:	fd843783          	ld	a5,-40(s0)
    80005064:	05078793          	addi	a5,a5,80
    80005068:	03400613          	li	a2,52
    8000506c:	85be                	mv	a1,a5
    8000506e:	853a                	mv	a0,a4
    80005070:	ffffc097          	auipc	ra,0xffffc
    80005074:	572080e7          	jalr	1394(ra) # 800015e2 <memmove>
  log_write(bp);
    80005078:	fe843503          	ld	a0,-24(s0)
    8000507c:	00001097          	auipc	ra,0x1
    80005080:	4ee080e7          	jalr	1262(ra) # 8000656a <log_write>
  brelse(bp);
    80005084:	fe843503          	ld	a0,-24(s0)
    80005088:	00000097          	auipc	ra,0x0
    8000508c:	830080e7          	jalr	-2000(ra) # 800048b8 <brelse>
}
    80005090:	0001                	nop
    80005092:	70a2                	ld	ra,40(sp)
    80005094:	7402                	ld	s0,32(sp)
    80005096:	6145                	addi	sp,sp,48
    80005098:	8082                	ret

000000008000509a <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    8000509a:	7179                	addi	sp,sp,-48
    8000509c:	f406                	sd	ra,40(sp)
    8000509e:	f022                	sd	s0,32(sp)
    800050a0:	1800                	addi	s0,sp,48
    800050a2:	87aa                	mv	a5,a0
    800050a4:	872e                	mv	a4,a1
    800050a6:	fcf42e23          	sw	a5,-36(s0)
    800050aa:	87ba                	mv	a5,a4
    800050ac:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    800050b0:	0002d517          	auipc	a0,0x2d
    800050b4:	03050513          	addi	a0,a0,48 # 800320e0 <itable>
    800050b8:	ffffc097          	auipc	ra,0xffffc
    800050bc:	272080e7          	jalr	626(ra) # 8000132a <acquire>

  // Is the inode already in the table?
  empty = 0;
    800050c0:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800050c4:	0002d797          	auipc	a5,0x2d
    800050c8:	03478793          	addi	a5,a5,52 # 800320f8 <itable+0x18>
    800050cc:	fef43423          	sd	a5,-24(s0)
    800050d0:	a89d                	j	80005146 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800050d2:	fe843783          	ld	a5,-24(s0)
    800050d6:	479c                	lw	a5,8(a5)
    800050d8:	04f05663          	blez	a5,80005124 <iget+0x8a>
    800050dc:	fe843783          	ld	a5,-24(s0)
    800050e0:	4398                	lw	a4,0(a5)
    800050e2:	fdc42783          	lw	a5,-36(s0)
    800050e6:	2781                	sext.w	a5,a5
    800050e8:	02e79e63          	bne	a5,a4,80005124 <iget+0x8a>
    800050ec:	fe843783          	ld	a5,-24(s0)
    800050f0:	43d8                	lw	a4,4(a5)
    800050f2:	fd842783          	lw	a5,-40(s0)
    800050f6:	2781                	sext.w	a5,a5
    800050f8:	02e79663          	bne	a5,a4,80005124 <iget+0x8a>
      ip->ref++;
    800050fc:	fe843783          	ld	a5,-24(s0)
    80005100:	479c                	lw	a5,8(a5)
    80005102:	2785                	addiw	a5,a5,1
    80005104:	0007871b          	sext.w	a4,a5
    80005108:	fe843783          	ld	a5,-24(s0)
    8000510c:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    8000510e:	0002d517          	auipc	a0,0x2d
    80005112:	fd250513          	addi	a0,a0,-46 # 800320e0 <itable>
    80005116:	ffffc097          	auipc	ra,0xffffc
    8000511a:	278080e7          	jalr	632(ra) # 8000138e <release>
      return ip;
    8000511e:	fe843783          	ld	a5,-24(s0)
    80005122:	a069                	j	800051ac <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80005124:	fe043783          	ld	a5,-32(s0)
    80005128:	eb89                	bnez	a5,8000513a <iget+0xa0>
    8000512a:	fe843783          	ld	a5,-24(s0)
    8000512e:	479c                	lw	a5,8(a5)
    80005130:	e789                	bnez	a5,8000513a <iget+0xa0>
      empty = ip;
    80005132:	fe843783          	ld	a5,-24(s0)
    80005136:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    8000513a:	fe843783          	ld	a5,-24(s0)
    8000513e:	08878793          	addi	a5,a5,136
    80005142:	fef43423          	sd	a5,-24(s0)
    80005146:	fe843703          	ld	a4,-24(s0)
    8000514a:	0002f797          	auipc	a5,0x2f
    8000514e:	a3e78793          	addi	a5,a5,-1474 # 80033b88 <log>
    80005152:	f8f760e3          	bltu	a4,a5,800050d2 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80005156:	fe043783          	ld	a5,-32(s0)
    8000515a:	eb89                	bnez	a5,8000516c <iget+0xd2>
    panic("iget: no inodes");
    8000515c:	00006517          	auipc	a0,0x6
    80005160:	37c50513          	addi	a0,a0,892 # 8000b4d8 <etext+0x4d8>
    80005164:	ffffc097          	auipc	ra,0xffffc
    80005168:	b28080e7          	jalr	-1240(ra) # 80000c8c <panic>

  ip = empty;
    8000516c:	fe043783          	ld	a5,-32(s0)
    80005170:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005174:	fe843783          	ld	a5,-24(s0)
    80005178:	fdc42703          	lw	a4,-36(s0)
    8000517c:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000517e:	fe843783          	ld	a5,-24(s0)
    80005182:	fd842703          	lw	a4,-40(s0)
    80005186:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005188:	fe843783          	ld	a5,-24(s0)
    8000518c:	4705                	li	a4,1
    8000518e:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80005190:	fe843783          	ld	a5,-24(s0)
    80005194:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005198:	0002d517          	auipc	a0,0x2d
    8000519c:	f4850513          	addi	a0,a0,-184 # 800320e0 <itable>
    800051a0:	ffffc097          	auipc	ra,0xffffc
    800051a4:	1ee080e7          	jalr	494(ra) # 8000138e <release>

  return ip;
    800051a8:	fe843783          	ld	a5,-24(s0)
}
    800051ac:	853e                	mv	a0,a5
    800051ae:	70a2                	ld	ra,40(sp)
    800051b0:	7402                	ld	s0,32(sp)
    800051b2:	6145                	addi	sp,sp,48
    800051b4:	8082                	ret

00000000800051b6 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800051b6:	1101                	addi	sp,sp,-32
    800051b8:	ec06                	sd	ra,24(sp)
    800051ba:	e822                	sd	s0,16(sp)
    800051bc:	1000                	addi	s0,sp,32
    800051be:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800051c2:	0002d517          	auipc	a0,0x2d
    800051c6:	f1e50513          	addi	a0,a0,-226 # 800320e0 <itable>
    800051ca:	ffffc097          	auipc	ra,0xffffc
    800051ce:	160080e7          	jalr	352(ra) # 8000132a <acquire>
  ip->ref++;
    800051d2:	fe843783          	ld	a5,-24(s0)
    800051d6:	479c                	lw	a5,8(a5)
    800051d8:	2785                	addiw	a5,a5,1
    800051da:	0007871b          	sext.w	a4,a5
    800051de:	fe843783          	ld	a5,-24(s0)
    800051e2:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800051e4:	0002d517          	auipc	a0,0x2d
    800051e8:	efc50513          	addi	a0,a0,-260 # 800320e0 <itable>
    800051ec:	ffffc097          	auipc	ra,0xffffc
    800051f0:	1a2080e7          	jalr	418(ra) # 8000138e <release>
  return ip;
    800051f4:	fe843783          	ld	a5,-24(s0)
}
    800051f8:	853e                	mv	a0,a5
    800051fa:	60e2                	ld	ra,24(sp)
    800051fc:	6442                	ld	s0,16(sp)
    800051fe:	6105                	addi	sp,sp,32
    80005200:	8082                	ret

0000000080005202 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005202:	7179                	addi	sp,sp,-48
    80005204:	f406                	sd	ra,40(sp)
    80005206:	f022                	sd	s0,32(sp)
    80005208:	1800                	addi	s0,sp,48
    8000520a:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    8000520e:	fd843783          	ld	a5,-40(s0)
    80005212:	c791                	beqz	a5,8000521e <ilock+0x1c>
    80005214:	fd843783          	ld	a5,-40(s0)
    80005218:	479c                	lw	a5,8(a5)
    8000521a:	00f04a63          	bgtz	a5,8000522e <ilock+0x2c>
    panic("ilock");
    8000521e:	00006517          	auipc	a0,0x6
    80005222:	2ca50513          	addi	a0,a0,714 # 8000b4e8 <etext+0x4e8>
    80005226:	ffffc097          	auipc	ra,0xffffc
    8000522a:	a66080e7          	jalr	-1434(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    8000522e:	fd843783          	ld	a5,-40(s0)
    80005232:	07c1                	addi	a5,a5,16
    80005234:	853e                	mv	a0,a5
    80005236:	00001097          	auipc	ra,0x1
    8000523a:	4b4080e7          	jalr	1204(ra) # 800066ea <acquiresleep>

  if(ip->valid == 0){
    8000523e:	fd843783          	ld	a5,-40(s0)
    80005242:	43bc                	lw	a5,64(a5)
    80005244:	e7e5                	bnez	a5,8000532c <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005246:	fd843783          	ld	a5,-40(s0)
    8000524a:	4394                	lw	a3,0(a5)
    8000524c:	fd843783          	ld	a5,-40(s0)
    80005250:	43dc                	lw	a5,4(a5)
    80005252:	0047d79b          	srliw	a5,a5,0x4
    80005256:	0007871b          	sext.w	a4,a5
    8000525a:	0002d797          	auipc	a5,0x2d
    8000525e:	e6678793          	addi	a5,a5,-410 # 800320c0 <sb>
    80005262:	4f9c                	lw	a5,24(a5)
    80005264:	9fb9                	addw	a5,a5,a4
    80005266:	2781                	sext.w	a5,a5
    80005268:	85be                	mv	a1,a5
    8000526a:	8536                	mv	a0,a3
    8000526c:	fffff097          	auipc	ra,0xfffff
    80005270:	5a2080e7          	jalr	1442(ra) # 8000480e <bread>
    80005274:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005278:	fe843783          	ld	a5,-24(s0)
    8000527c:	05878713          	addi	a4,a5,88
    80005280:	fd843783          	ld	a5,-40(s0)
    80005284:	43dc                	lw	a5,4(a5)
    80005286:	1782                	slli	a5,a5,0x20
    80005288:	9381                	srli	a5,a5,0x20
    8000528a:	8bbd                	andi	a5,a5,15
    8000528c:	079a                	slli	a5,a5,0x6
    8000528e:	97ba                	add	a5,a5,a4
    80005290:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005294:	fe043783          	ld	a5,-32(s0)
    80005298:	00079703          	lh	a4,0(a5)
    8000529c:	fd843783          	ld	a5,-40(s0)
    800052a0:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800052a4:	fe043783          	ld	a5,-32(s0)
    800052a8:	00279703          	lh	a4,2(a5)
    800052ac:	fd843783          	ld	a5,-40(s0)
    800052b0:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800052b4:	fe043783          	ld	a5,-32(s0)
    800052b8:	00479703          	lh	a4,4(a5)
    800052bc:	fd843783          	ld	a5,-40(s0)
    800052c0:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800052c4:	fe043783          	ld	a5,-32(s0)
    800052c8:	00679703          	lh	a4,6(a5)
    800052cc:	fd843783          	ld	a5,-40(s0)
    800052d0:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800052d4:	fe043783          	ld	a5,-32(s0)
    800052d8:	4798                	lw	a4,8(a5)
    800052da:	fd843783          	ld	a5,-40(s0)
    800052de:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800052e0:	fd843783          	ld	a5,-40(s0)
    800052e4:	05078713          	addi	a4,a5,80
    800052e8:	fe043783          	ld	a5,-32(s0)
    800052ec:	07b1                	addi	a5,a5,12
    800052ee:	03400613          	li	a2,52
    800052f2:	85be                	mv	a1,a5
    800052f4:	853a                	mv	a0,a4
    800052f6:	ffffc097          	auipc	ra,0xffffc
    800052fa:	2ec080e7          	jalr	748(ra) # 800015e2 <memmove>
    brelse(bp);
    800052fe:	fe843503          	ld	a0,-24(s0)
    80005302:	fffff097          	auipc	ra,0xfffff
    80005306:	5b6080e7          	jalr	1462(ra) # 800048b8 <brelse>
    ip->valid = 1;
    8000530a:	fd843783          	ld	a5,-40(s0)
    8000530e:	4705                	li	a4,1
    80005310:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005312:	fd843783          	ld	a5,-40(s0)
    80005316:	04479783          	lh	a5,68(a5)
    8000531a:	eb89                	bnez	a5,8000532c <ilock+0x12a>
      panic("ilock: no type");
    8000531c:	00006517          	auipc	a0,0x6
    80005320:	1d450513          	addi	a0,a0,468 # 8000b4f0 <etext+0x4f0>
    80005324:	ffffc097          	auipc	ra,0xffffc
    80005328:	968080e7          	jalr	-1688(ra) # 80000c8c <panic>
  }
}
    8000532c:	0001                	nop
    8000532e:	70a2                	ld	ra,40(sp)
    80005330:	7402                	ld	s0,32(sp)
    80005332:	6145                	addi	sp,sp,48
    80005334:	8082                	ret

0000000080005336 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005336:	1101                	addi	sp,sp,-32
    80005338:	ec06                	sd	ra,24(sp)
    8000533a:	e822                	sd	s0,16(sp)
    8000533c:	1000                	addi	s0,sp,32
    8000533e:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005342:	fe843783          	ld	a5,-24(s0)
    80005346:	c385                	beqz	a5,80005366 <iunlock+0x30>
    80005348:	fe843783          	ld	a5,-24(s0)
    8000534c:	07c1                	addi	a5,a5,16
    8000534e:	853e                	mv	a0,a5
    80005350:	00001097          	auipc	ra,0x1
    80005354:	45a080e7          	jalr	1114(ra) # 800067aa <holdingsleep>
    80005358:	87aa                	mv	a5,a0
    8000535a:	c791                	beqz	a5,80005366 <iunlock+0x30>
    8000535c:	fe843783          	ld	a5,-24(s0)
    80005360:	479c                	lw	a5,8(a5)
    80005362:	00f04a63          	bgtz	a5,80005376 <iunlock+0x40>
    panic("iunlock");
    80005366:	00006517          	auipc	a0,0x6
    8000536a:	19a50513          	addi	a0,a0,410 # 8000b500 <etext+0x500>
    8000536e:	ffffc097          	auipc	ra,0xffffc
    80005372:	91e080e7          	jalr	-1762(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    80005376:	fe843783          	ld	a5,-24(s0)
    8000537a:	07c1                	addi	a5,a5,16
    8000537c:	853e                	mv	a0,a5
    8000537e:	00001097          	auipc	ra,0x1
    80005382:	3da080e7          	jalr	986(ra) # 80006758 <releasesleep>
}
    80005386:	0001                	nop
    80005388:	60e2                	ld	ra,24(sp)
    8000538a:	6442                	ld	s0,16(sp)
    8000538c:	6105                	addi	sp,sp,32
    8000538e:	8082                	ret

0000000080005390 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    80005390:	1101                	addi	sp,sp,-32
    80005392:	ec06                	sd	ra,24(sp)
    80005394:	e822                	sd	s0,16(sp)
    80005396:	1000                	addi	s0,sp,32
    80005398:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000539c:	0002d517          	auipc	a0,0x2d
    800053a0:	d4450513          	addi	a0,a0,-700 # 800320e0 <itable>
    800053a4:	ffffc097          	auipc	ra,0xffffc
    800053a8:	f86080e7          	jalr	-122(ra) # 8000132a <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800053ac:	fe843783          	ld	a5,-24(s0)
    800053b0:	479c                	lw	a5,8(a5)
    800053b2:	873e                	mv	a4,a5
    800053b4:	4785                	li	a5,1
    800053b6:	06f71f63          	bne	a4,a5,80005434 <iput+0xa4>
    800053ba:	fe843783          	ld	a5,-24(s0)
    800053be:	43bc                	lw	a5,64(a5)
    800053c0:	cbb5                	beqz	a5,80005434 <iput+0xa4>
    800053c2:	fe843783          	ld	a5,-24(s0)
    800053c6:	04a79783          	lh	a5,74(a5)
    800053ca:	e7ad                	bnez	a5,80005434 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800053cc:	fe843783          	ld	a5,-24(s0)
    800053d0:	07c1                	addi	a5,a5,16
    800053d2:	853e                	mv	a0,a5
    800053d4:	00001097          	auipc	ra,0x1
    800053d8:	316080e7          	jalr	790(ra) # 800066ea <acquiresleep>

    release(&itable.lock);
    800053dc:	0002d517          	auipc	a0,0x2d
    800053e0:	d0450513          	addi	a0,a0,-764 # 800320e0 <itable>
    800053e4:	ffffc097          	auipc	ra,0xffffc
    800053e8:	faa080e7          	jalr	-86(ra) # 8000138e <release>

    itrunc(ip);
    800053ec:	fe843503          	ld	a0,-24(s0)
    800053f0:	00000097          	auipc	ra,0x0
    800053f4:	21a080e7          	jalr	538(ra) # 8000560a <itrunc>
    ip->type = 0;
    800053f8:	fe843783          	ld	a5,-24(s0)
    800053fc:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005400:	fe843503          	ld	a0,-24(s0)
    80005404:	00000097          	auipc	ra,0x0
    80005408:	bae080e7          	jalr	-1106(ra) # 80004fb2 <iupdate>
    ip->valid = 0;
    8000540c:	fe843783          	ld	a5,-24(s0)
    80005410:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005414:	fe843783          	ld	a5,-24(s0)
    80005418:	07c1                	addi	a5,a5,16
    8000541a:	853e                	mv	a0,a5
    8000541c:	00001097          	auipc	ra,0x1
    80005420:	33c080e7          	jalr	828(ra) # 80006758 <releasesleep>

    acquire(&itable.lock);
    80005424:	0002d517          	auipc	a0,0x2d
    80005428:	cbc50513          	addi	a0,a0,-836 # 800320e0 <itable>
    8000542c:	ffffc097          	auipc	ra,0xffffc
    80005430:	efe080e7          	jalr	-258(ra) # 8000132a <acquire>
  }

  ip->ref--;
    80005434:	fe843783          	ld	a5,-24(s0)
    80005438:	479c                	lw	a5,8(a5)
    8000543a:	37fd                	addiw	a5,a5,-1
    8000543c:	0007871b          	sext.w	a4,a5
    80005440:	fe843783          	ld	a5,-24(s0)
    80005444:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005446:	0002d517          	auipc	a0,0x2d
    8000544a:	c9a50513          	addi	a0,a0,-870 # 800320e0 <itable>
    8000544e:	ffffc097          	auipc	ra,0xffffc
    80005452:	f40080e7          	jalr	-192(ra) # 8000138e <release>
}
    80005456:	0001                	nop
    80005458:	60e2                	ld	ra,24(sp)
    8000545a:	6442                	ld	s0,16(sp)
    8000545c:	6105                	addi	sp,sp,32
    8000545e:	8082                	ret

0000000080005460 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005460:	1101                	addi	sp,sp,-32
    80005462:	ec06                	sd	ra,24(sp)
    80005464:	e822                	sd	s0,16(sp)
    80005466:	1000                	addi	s0,sp,32
    80005468:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000546c:	fe843503          	ld	a0,-24(s0)
    80005470:	00000097          	auipc	ra,0x0
    80005474:	ec6080e7          	jalr	-314(ra) # 80005336 <iunlock>
  iput(ip);
    80005478:	fe843503          	ld	a0,-24(s0)
    8000547c:	00000097          	auipc	ra,0x0
    80005480:	f14080e7          	jalr	-236(ra) # 80005390 <iput>
}
    80005484:	0001                	nop
    80005486:	60e2                	ld	ra,24(sp)
    80005488:	6442                	ld	s0,16(sp)
    8000548a:	6105                	addi	sp,sp,32
    8000548c:	8082                	ret

000000008000548e <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    8000548e:	7139                	addi	sp,sp,-64
    80005490:	fc06                	sd	ra,56(sp)
    80005492:	f822                	sd	s0,48(sp)
    80005494:	0080                	addi	s0,sp,64
    80005496:	fca43423          	sd	a0,-56(s0)
    8000549a:	87ae                	mv	a5,a1
    8000549c:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800054a0:	fc442783          	lw	a5,-60(s0)
    800054a4:	0007871b          	sext.w	a4,a5
    800054a8:	47ad                	li	a5,11
    800054aa:	04e7ee63          	bltu	a5,a4,80005506 <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    800054ae:	fc843703          	ld	a4,-56(s0)
    800054b2:	fc446783          	lwu	a5,-60(s0)
    800054b6:	07d1                	addi	a5,a5,20
    800054b8:	078a                	slli	a5,a5,0x2
    800054ba:	97ba                	add	a5,a5,a4
    800054bc:	439c                	lw	a5,0(a5)
    800054be:	fef42623          	sw	a5,-20(s0)
    800054c2:	fec42783          	lw	a5,-20(s0)
    800054c6:	2781                	sext.w	a5,a5
    800054c8:	ef85                	bnez	a5,80005500 <bmap+0x72>
      addr = balloc(ip->dev);
    800054ca:	fc843783          	ld	a5,-56(s0)
    800054ce:	439c                	lw	a5,0(a5)
    800054d0:	853e                	mv	a0,a5
    800054d2:	fffff097          	auipc	ra,0xfffff
    800054d6:	68e080e7          	jalr	1678(ra) # 80004b60 <balloc>
    800054da:	87aa                	mv	a5,a0
    800054dc:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800054e0:	fec42783          	lw	a5,-20(s0)
    800054e4:	2781                	sext.w	a5,a5
    800054e6:	e399                	bnez	a5,800054ec <bmap+0x5e>
        return 0;
    800054e8:	4781                	li	a5,0
    800054ea:	aa19                	j	80005600 <bmap+0x172>
      ip->addrs[bn] = addr;
    800054ec:	fc843703          	ld	a4,-56(s0)
    800054f0:	fc446783          	lwu	a5,-60(s0)
    800054f4:	07d1                	addi	a5,a5,20
    800054f6:	078a                	slli	a5,a5,0x2
    800054f8:	97ba                	add	a5,a5,a4
    800054fa:	fec42703          	lw	a4,-20(s0)
    800054fe:	c398                	sw	a4,0(a5)
    }
    return addr;
    80005500:	fec42783          	lw	a5,-20(s0)
    80005504:	a8f5                	j	80005600 <bmap+0x172>
  }
  bn -= NDIRECT;
    80005506:	fc442783          	lw	a5,-60(s0)
    8000550a:	37d1                	addiw	a5,a5,-12
    8000550c:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005510:	fc442783          	lw	a5,-60(s0)
    80005514:	0007871b          	sext.w	a4,a5
    80005518:	0ff00793          	li	a5,255
    8000551c:	0ce7ea63          	bltu	a5,a4,800055f0 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    80005520:	fc843783          	ld	a5,-56(s0)
    80005524:	0807a783          	lw	a5,128(a5)
    80005528:	fef42623          	sw	a5,-20(s0)
    8000552c:	fec42783          	lw	a5,-20(s0)
    80005530:	2781                	sext.w	a5,a5
    80005532:	eb85                	bnez	a5,80005562 <bmap+0xd4>
      addr = balloc(ip->dev);
    80005534:	fc843783          	ld	a5,-56(s0)
    80005538:	439c                	lw	a5,0(a5)
    8000553a:	853e                	mv	a0,a5
    8000553c:	fffff097          	auipc	ra,0xfffff
    80005540:	624080e7          	jalr	1572(ra) # 80004b60 <balloc>
    80005544:	87aa                	mv	a5,a0
    80005546:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    8000554a:	fec42783          	lw	a5,-20(s0)
    8000554e:	2781                	sext.w	a5,a5
    80005550:	e399                	bnez	a5,80005556 <bmap+0xc8>
        return 0;
    80005552:	4781                	li	a5,0
    80005554:	a075                	j	80005600 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    80005556:	fc843783          	ld	a5,-56(s0)
    8000555a:	fec42703          	lw	a4,-20(s0)
    8000555e:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005562:	fc843783          	ld	a5,-56(s0)
    80005566:	439c                	lw	a5,0(a5)
    80005568:	fec42703          	lw	a4,-20(s0)
    8000556c:	85ba                	mv	a1,a4
    8000556e:	853e                	mv	a0,a5
    80005570:	fffff097          	auipc	ra,0xfffff
    80005574:	29e080e7          	jalr	670(ra) # 8000480e <bread>
    80005578:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    8000557c:	fe043783          	ld	a5,-32(s0)
    80005580:	05878793          	addi	a5,a5,88
    80005584:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005588:	fc446783          	lwu	a5,-60(s0)
    8000558c:	078a                	slli	a5,a5,0x2
    8000558e:	fd843703          	ld	a4,-40(s0)
    80005592:	97ba                	add	a5,a5,a4
    80005594:	439c                	lw	a5,0(a5)
    80005596:	fef42623          	sw	a5,-20(s0)
    8000559a:	fec42783          	lw	a5,-20(s0)
    8000559e:	2781                	sext.w	a5,a5
    800055a0:	ef9d                	bnez	a5,800055de <bmap+0x150>
      addr = balloc(ip->dev);
    800055a2:	fc843783          	ld	a5,-56(s0)
    800055a6:	439c                	lw	a5,0(a5)
    800055a8:	853e                	mv	a0,a5
    800055aa:	fffff097          	auipc	ra,0xfffff
    800055ae:	5b6080e7          	jalr	1462(ra) # 80004b60 <balloc>
    800055b2:	87aa                	mv	a5,a0
    800055b4:	fef42623          	sw	a5,-20(s0)
      if(addr){
    800055b8:	fec42783          	lw	a5,-20(s0)
    800055bc:	2781                	sext.w	a5,a5
    800055be:	c385                	beqz	a5,800055de <bmap+0x150>
        a[bn] = addr;
    800055c0:	fc446783          	lwu	a5,-60(s0)
    800055c4:	078a                	slli	a5,a5,0x2
    800055c6:	fd843703          	ld	a4,-40(s0)
    800055ca:	97ba                	add	a5,a5,a4
    800055cc:	fec42703          	lw	a4,-20(s0)
    800055d0:	c398                	sw	a4,0(a5)
        log_write(bp);
    800055d2:	fe043503          	ld	a0,-32(s0)
    800055d6:	00001097          	auipc	ra,0x1
    800055da:	f94080e7          	jalr	-108(ra) # 8000656a <log_write>
      }
    }
    brelse(bp);
    800055de:	fe043503          	ld	a0,-32(s0)
    800055e2:	fffff097          	auipc	ra,0xfffff
    800055e6:	2d6080e7          	jalr	726(ra) # 800048b8 <brelse>
    return addr;
    800055ea:	fec42783          	lw	a5,-20(s0)
    800055ee:	a809                	j	80005600 <bmap+0x172>
  }

  panic("bmap: out of range");
    800055f0:	00006517          	auipc	a0,0x6
    800055f4:	f1850513          	addi	a0,a0,-232 # 8000b508 <etext+0x508>
    800055f8:	ffffb097          	auipc	ra,0xffffb
    800055fc:	694080e7          	jalr	1684(ra) # 80000c8c <panic>
}
    80005600:	853e                	mv	a0,a5
    80005602:	70e2                	ld	ra,56(sp)
    80005604:	7442                	ld	s0,48(sp)
    80005606:	6121                	addi	sp,sp,64
    80005608:	8082                	ret

000000008000560a <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    8000560a:	7139                	addi	sp,sp,-64
    8000560c:	fc06                	sd	ra,56(sp)
    8000560e:	f822                	sd	s0,48(sp)
    80005610:	0080                	addi	s0,sp,64
    80005612:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005616:	fe042623          	sw	zero,-20(s0)
    8000561a:	a899                	j	80005670 <itrunc+0x66>
    if(ip->addrs[i]){
    8000561c:	fc843703          	ld	a4,-56(s0)
    80005620:	fec42783          	lw	a5,-20(s0)
    80005624:	07d1                	addi	a5,a5,20
    80005626:	078a                	slli	a5,a5,0x2
    80005628:	97ba                	add	a5,a5,a4
    8000562a:	439c                	lw	a5,0(a5)
    8000562c:	cf8d                	beqz	a5,80005666 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    8000562e:	fc843783          	ld	a5,-56(s0)
    80005632:	439c                	lw	a5,0(a5)
    80005634:	0007869b          	sext.w	a3,a5
    80005638:	fc843703          	ld	a4,-56(s0)
    8000563c:	fec42783          	lw	a5,-20(s0)
    80005640:	07d1                	addi	a5,a5,20
    80005642:	078a                	slli	a5,a5,0x2
    80005644:	97ba                	add	a5,a5,a4
    80005646:	439c                	lw	a5,0(a5)
    80005648:	85be                	mv	a1,a5
    8000564a:	8536                	mv	a0,a3
    8000564c:	fffff097          	auipc	ra,0xfffff
    80005650:	6c4080e7          	jalr	1732(ra) # 80004d10 <bfree>
      ip->addrs[i] = 0;
    80005654:	fc843703          	ld	a4,-56(s0)
    80005658:	fec42783          	lw	a5,-20(s0)
    8000565c:	07d1                	addi	a5,a5,20
    8000565e:	078a                	slli	a5,a5,0x2
    80005660:	97ba                	add	a5,a5,a4
    80005662:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005666:	fec42783          	lw	a5,-20(s0)
    8000566a:	2785                	addiw	a5,a5,1
    8000566c:	fef42623          	sw	a5,-20(s0)
    80005670:	fec42783          	lw	a5,-20(s0)
    80005674:	0007871b          	sext.w	a4,a5
    80005678:	47ad                	li	a5,11
    8000567a:	fae7d1e3          	bge	a5,a4,8000561c <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    8000567e:	fc843783          	ld	a5,-56(s0)
    80005682:	0807a783          	lw	a5,128(a5)
    80005686:	cbc5                	beqz	a5,80005736 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005688:	fc843783          	ld	a5,-56(s0)
    8000568c:	4398                	lw	a4,0(a5)
    8000568e:	fc843783          	ld	a5,-56(s0)
    80005692:	0807a783          	lw	a5,128(a5)
    80005696:	85be                	mv	a1,a5
    80005698:	853a                	mv	a0,a4
    8000569a:	fffff097          	auipc	ra,0xfffff
    8000569e:	174080e7          	jalr	372(ra) # 8000480e <bread>
    800056a2:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800056a6:	fe043783          	ld	a5,-32(s0)
    800056aa:	05878793          	addi	a5,a5,88
    800056ae:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    800056b2:	fe042423          	sw	zero,-24(s0)
    800056b6:	a081                	j	800056f6 <itrunc+0xec>
      if(a[j])
    800056b8:	fe842783          	lw	a5,-24(s0)
    800056bc:	078a                	slli	a5,a5,0x2
    800056be:	fd843703          	ld	a4,-40(s0)
    800056c2:	97ba                	add	a5,a5,a4
    800056c4:	439c                	lw	a5,0(a5)
    800056c6:	c39d                	beqz	a5,800056ec <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800056c8:	fc843783          	ld	a5,-56(s0)
    800056cc:	439c                	lw	a5,0(a5)
    800056ce:	0007869b          	sext.w	a3,a5
    800056d2:	fe842783          	lw	a5,-24(s0)
    800056d6:	078a                	slli	a5,a5,0x2
    800056d8:	fd843703          	ld	a4,-40(s0)
    800056dc:	97ba                	add	a5,a5,a4
    800056de:	439c                	lw	a5,0(a5)
    800056e0:	85be                	mv	a1,a5
    800056e2:	8536                	mv	a0,a3
    800056e4:	fffff097          	auipc	ra,0xfffff
    800056e8:	62c080e7          	jalr	1580(ra) # 80004d10 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800056ec:	fe842783          	lw	a5,-24(s0)
    800056f0:	2785                	addiw	a5,a5,1
    800056f2:	fef42423          	sw	a5,-24(s0)
    800056f6:	fe842783          	lw	a5,-24(s0)
    800056fa:	873e                	mv	a4,a5
    800056fc:	0ff00793          	li	a5,255
    80005700:	fae7fce3          	bgeu	a5,a4,800056b8 <itrunc+0xae>
    }
    brelse(bp);
    80005704:	fe043503          	ld	a0,-32(s0)
    80005708:	fffff097          	auipc	ra,0xfffff
    8000570c:	1b0080e7          	jalr	432(ra) # 800048b8 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005710:	fc843783          	ld	a5,-56(s0)
    80005714:	439c                	lw	a5,0(a5)
    80005716:	0007871b          	sext.w	a4,a5
    8000571a:	fc843783          	ld	a5,-56(s0)
    8000571e:	0807a783          	lw	a5,128(a5)
    80005722:	85be                	mv	a1,a5
    80005724:	853a                	mv	a0,a4
    80005726:	fffff097          	auipc	ra,0xfffff
    8000572a:	5ea080e7          	jalr	1514(ra) # 80004d10 <bfree>
    ip->addrs[NDIRECT] = 0;
    8000572e:	fc843783          	ld	a5,-56(s0)
    80005732:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005736:	fc843783          	ld	a5,-56(s0)
    8000573a:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    8000573e:	fc843503          	ld	a0,-56(s0)
    80005742:	00000097          	auipc	ra,0x0
    80005746:	870080e7          	jalr	-1936(ra) # 80004fb2 <iupdate>
}
    8000574a:	0001                	nop
    8000574c:	70e2                	ld	ra,56(sp)
    8000574e:	7442                	ld	s0,48(sp)
    80005750:	6121                	addi	sp,sp,64
    80005752:	8082                	ret

0000000080005754 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005754:	1101                	addi	sp,sp,-32
    80005756:	ec22                	sd	s0,24(sp)
    80005758:	1000                	addi	s0,sp,32
    8000575a:	fea43423          	sd	a0,-24(s0)
    8000575e:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005762:	fe843783          	ld	a5,-24(s0)
    80005766:	439c                	lw	a5,0(a5)
    80005768:	0007871b          	sext.w	a4,a5
    8000576c:	fe043783          	ld	a5,-32(s0)
    80005770:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005772:	fe843783          	ld	a5,-24(s0)
    80005776:	43d8                	lw	a4,4(a5)
    80005778:	fe043783          	ld	a5,-32(s0)
    8000577c:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    8000577e:	fe843783          	ld	a5,-24(s0)
    80005782:	04479703          	lh	a4,68(a5)
    80005786:	fe043783          	ld	a5,-32(s0)
    8000578a:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    8000578e:	fe843783          	ld	a5,-24(s0)
    80005792:	04a79703          	lh	a4,74(a5)
    80005796:	fe043783          	ld	a5,-32(s0)
    8000579a:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    8000579e:	fe843783          	ld	a5,-24(s0)
    800057a2:	47fc                	lw	a5,76(a5)
    800057a4:	02079713          	slli	a4,a5,0x20
    800057a8:	9301                	srli	a4,a4,0x20
    800057aa:	fe043783          	ld	a5,-32(s0)
    800057ae:	eb98                	sd	a4,16(a5)
}
    800057b0:	0001                	nop
    800057b2:	6462                	ld	s0,24(sp)
    800057b4:	6105                	addi	sp,sp,32
    800057b6:	8082                	ret

00000000800057b8 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    800057b8:	715d                	addi	sp,sp,-80
    800057ba:	e486                	sd	ra,72(sp)
    800057bc:	e0a2                	sd	s0,64(sp)
    800057be:	0880                	addi	s0,sp,80
    800057c0:	fca43423          	sd	a0,-56(s0)
    800057c4:	87ae                	mv	a5,a1
    800057c6:	fac43c23          	sd	a2,-72(s0)
    800057ca:	fcf42223          	sw	a5,-60(s0)
    800057ce:	87b6                	mv	a5,a3
    800057d0:	fcf42023          	sw	a5,-64(s0)
    800057d4:	87ba                	mv	a5,a4
    800057d6:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800057da:	fc843783          	ld	a5,-56(s0)
    800057de:	47f8                	lw	a4,76(a5)
    800057e0:	fc042783          	lw	a5,-64(s0)
    800057e4:	2781                	sext.w	a5,a5
    800057e6:	00f76e63          	bltu	a4,a5,80005802 <readi+0x4a>
    800057ea:	fc042703          	lw	a4,-64(s0)
    800057ee:	fb442783          	lw	a5,-76(s0)
    800057f2:	9fb9                	addw	a5,a5,a4
    800057f4:	0007871b          	sext.w	a4,a5
    800057f8:	fc042783          	lw	a5,-64(s0)
    800057fc:	2781                	sext.w	a5,a5
    800057fe:	00f77463          	bgeu	a4,a5,80005806 <readi+0x4e>
    return 0;
    80005802:	4781                	li	a5,0
    80005804:	a289                	j	80005946 <readi+0x18e>
  if(off + n > ip->size)
    80005806:	fc042703          	lw	a4,-64(s0)
    8000580a:	fb442783          	lw	a5,-76(s0)
    8000580e:	9fb9                	addw	a5,a5,a4
    80005810:	0007871b          	sext.w	a4,a5
    80005814:	fc843783          	ld	a5,-56(s0)
    80005818:	47fc                	lw	a5,76(a5)
    8000581a:	00e7fb63          	bgeu	a5,a4,80005830 <readi+0x78>
    n = ip->size - off;
    8000581e:	fc843783          	ld	a5,-56(s0)
    80005822:	47f8                	lw	a4,76(a5)
    80005824:	fc042783          	lw	a5,-64(s0)
    80005828:	40f707bb          	subw	a5,a4,a5
    8000582c:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005830:	fe042623          	sw	zero,-20(s0)
    80005834:	a8ed                	j	8000592e <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    80005836:	fc042783          	lw	a5,-64(s0)
    8000583a:	00a7d79b          	srliw	a5,a5,0xa
    8000583e:	2781                	sext.w	a5,a5
    80005840:	85be                	mv	a1,a5
    80005842:	fc843503          	ld	a0,-56(s0)
    80005846:	00000097          	auipc	ra,0x0
    8000584a:	c48080e7          	jalr	-952(ra) # 8000548e <bmap>
    8000584e:	87aa                	mv	a5,a0
    80005850:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005854:	fe842783          	lw	a5,-24(s0)
    80005858:	2781                	sext.w	a5,a5
    8000585a:	c3fd                	beqz	a5,80005940 <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    8000585c:	fc843783          	ld	a5,-56(s0)
    80005860:	439c                	lw	a5,0(a5)
    80005862:	fe842703          	lw	a4,-24(s0)
    80005866:	85ba                	mv	a1,a4
    80005868:	853e                	mv	a0,a5
    8000586a:	fffff097          	auipc	ra,0xfffff
    8000586e:	fa4080e7          	jalr	-92(ra) # 8000480e <bread>
    80005872:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005876:	fc042783          	lw	a5,-64(s0)
    8000587a:	3ff7f793          	andi	a5,a5,1023
    8000587e:	2781                	sext.w	a5,a5
    80005880:	40000713          	li	a4,1024
    80005884:	40f707bb          	subw	a5,a4,a5
    80005888:	0007869b          	sext.w	a3,a5
    8000588c:	fb442703          	lw	a4,-76(s0)
    80005890:	fec42783          	lw	a5,-20(s0)
    80005894:	40f707bb          	subw	a5,a4,a5
    80005898:	2781                	sext.w	a5,a5
    8000589a:	863e                	mv	a2,a5
    8000589c:	87b6                	mv	a5,a3
    8000589e:	0007869b          	sext.w	a3,a5
    800058a2:	0006071b          	sext.w	a4,a2
    800058a6:	00d77363          	bgeu	a4,a3,800058ac <readi+0xf4>
    800058aa:	87b2                	mv	a5,a2
    800058ac:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    800058b0:	fe043783          	ld	a5,-32(s0)
    800058b4:	05878713          	addi	a4,a5,88
    800058b8:	fc046783          	lwu	a5,-64(s0)
    800058bc:	3ff7f793          	andi	a5,a5,1023
    800058c0:	973e                	add	a4,a4,a5
    800058c2:	fdc46683          	lwu	a3,-36(s0)
    800058c6:	fc442783          	lw	a5,-60(s0)
    800058ca:	863a                	mv	a2,a4
    800058cc:	fb843583          	ld	a1,-72(s0)
    800058d0:	853e                	mv	a0,a5
    800058d2:	ffffe097          	auipc	ra,0xffffe
    800058d6:	efa080e7          	jalr	-262(ra) # 800037cc <either_copyout>
    800058da:	87aa                	mv	a5,a0
    800058dc:	873e                	mv	a4,a5
    800058de:	57fd                	li	a5,-1
    800058e0:	00f71c63          	bne	a4,a5,800058f8 <readi+0x140>
      brelse(bp);
    800058e4:	fe043503          	ld	a0,-32(s0)
    800058e8:	fffff097          	auipc	ra,0xfffff
    800058ec:	fd0080e7          	jalr	-48(ra) # 800048b8 <brelse>
      tot = -1;
    800058f0:	57fd                	li	a5,-1
    800058f2:	fef42623          	sw	a5,-20(s0)
      break;
    800058f6:	a0b1                	j	80005942 <readi+0x18a>
    }
    brelse(bp);
    800058f8:	fe043503          	ld	a0,-32(s0)
    800058fc:	fffff097          	auipc	ra,0xfffff
    80005900:	fbc080e7          	jalr	-68(ra) # 800048b8 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005904:	fec42703          	lw	a4,-20(s0)
    80005908:	fdc42783          	lw	a5,-36(s0)
    8000590c:	9fb9                	addw	a5,a5,a4
    8000590e:	fef42623          	sw	a5,-20(s0)
    80005912:	fc042703          	lw	a4,-64(s0)
    80005916:	fdc42783          	lw	a5,-36(s0)
    8000591a:	9fb9                	addw	a5,a5,a4
    8000591c:	fcf42023          	sw	a5,-64(s0)
    80005920:	fdc46783          	lwu	a5,-36(s0)
    80005924:	fb843703          	ld	a4,-72(s0)
    80005928:	97ba                	add	a5,a5,a4
    8000592a:	faf43c23          	sd	a5,-72(s0)
    8000592e:	fec42703          	lw	a4,-20(s0)
    80005932:	fb442783          	lw	a5,-76(s0)
    80005936:	2701                	sext.w	a4,a4
    80005938:	2781                	sext.w	a5,a5
    8000593a:	eef76ee3          	bltu	a4,a5,80005836 <readi+0x7e>
    8000593e:	a011                	j	80005942 <readi+0x18a>
      break;
    80005940:	0001                	nop
  }
  return tot;
    80005942:	fec42783          	lw	a5,-20(s0)
}
    80005946:	853e                	mv	a0,a5
    80005948:	60a6                	ld	ra,72(sp)
    8000594a:	6406                	ld	s0,64(sp)
    8000594c:	6161                	addi	sp,sp,80
    8000594e:	8082                	ret

0000000080005950 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005950:	715d                	addi	sp,sp,-80
    80005952:	e486                	sd	ra,72(sp)
    80005954:	e0a2                	sd	s0,64(sp)
    80005956:	0880                	addi	s0,sp,80
    80005958:	fca43423          	sd	a0,-56(s0)
    8000595c:	87ae                	mv	a5,a1
    8000595e:	fac43c23          	sd	a2,-72(s0)
    80005962:	fcf42223          	sw	a5,-60(s0)
    80005966:	87b6                	mv	a5,a3
    80005968:	fcf42023          	sw	a5,-64(s0)
    8000596c:	87ba                	mv	a5,a4
    8000596e:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005972:	fc843783          	ld	a5,-56(s0)
    80005976:	47f8                	lw	a4,76(a5)
    80005978:	fc042783          	lw	a5,-64(s0)
    8000597c:	2781                	sext.w	a5,a5
    8000597e:	00f76e63          	bltu	a4,a5,8000599a <writei+0x4a>
    80005982:	fc042703          	lw	a4,-64(s0)
    80005986:	fb442783          	lw	a5,-76(s0)
    8000598a:	9fb9                	addw	a5,a5,a4
    8000598c:	0007871b          	sext.w	a4,a5
    80005990:	fc042783          	lw	a5,-64(s0)
    80005994:	2781                	sext.w	a5,a5
    80005996:	00f77463          	bgeu	a4,a5,8000599e <writei+0x4e>
    return -1;
    8000599a:	57fd                	li	a5,-1
    8000599c:	aab9                	j	80005afa <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    8000599e:	fc042703          	lw	a4,-64(s0)
    800059a2:	fb442783          	lw	a5,-76(s0)
    800059a6:	9fb9                	addw	a5,a5,a4
    800059a8:	2781                	sext.w	a5,a5
    800059aa:	873e                	mv	a4,a5
    800059ac:	000437b7          	lui	a5,0x43
    800059b0:	00e7f463          	bgeu	a5,a4,800059b8 <writei+0x68>
    return -1;
    800059b4:	57fd                	li	a5,-1
    800059b6:	a291                	j	80005afa <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    800059b8:	fe042623          	sw	zero,-20(s0)
    800059bc:	a201                	j	80005abc <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    800059be:	fc042783          	lw	a5,-64(s0)
    800059c2:	00a7d79b          	srliw	a5,a5,0xa
    800059c6:	2781                	sext.w	a5,a5
    800059c8:	85be                	mv	a1,a5
    800059ca:	fc843503          	ld	a0,-56(s0)
    800059ce:	00000097          	auipc	ra,0x0
    800059d2:	ac0080e7          	jalr	-1344(ra) # 8000548e <bmap>
    800059d6:	87aa                	mv	a5,a0
    800059d8:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    800059dc:	fe842783          	lw	a5,-24(s0)
    800059e0:	2781                	sext.w	a5,a5
    800059e2:	c7f5                	beqz	a5,80005ace <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    800059e4:	fc843783          	ld	a5,-56(s0)
    800059e8:	439c                	lw	a5,0(a5)
    800059ea:	fe842703          	lw	a4,-24(s0)
    800059ee:	85ba                	mv	a1,a4
    800059f0:	853e                	mv	a0,a5
    800059f2:	fffff097          	auipc	ra,0xfffff
    800059f6:	e1c080e7          	jalr	-484(ra) # 8000480e <bread>
    800059fa:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    800059fe:	fc042783          	lw	a5,-64(s0)
    80005a02:	3ff7f793          	andi	a5,a5,1023
    80005a06:	2781                	sext.w	a5,a5
    80005a08:	40000713          	li	a4,1024
    80005a0c:	40f707bb          	subw	a5,a4,a5
    80005a10:	0007869b          	sext.w	a3,a5
    80005a14:	fb442703          	lw	a4,-76(s0)
    80005a18:	fec42783          	lw	a5,-20(s0)
    80005a1c:	40f707bb          	subw	a5,a4,a5
    80005a20:	2781                	sext.w	a5,a5
    80005a22:	863e                	mv	a2,a5
    80005a24:	87b6                	mv	a5,a3
    80005a26:	0007869b          	sext.w	a3,a5
    80005a2a:	0006071b          	sext.w	a4,a2
    80005a2e:	00d77363          	bgeu	a4,a3,80005a34 <writei+0xe4>
    80005a32:	87b2                	mv	a5,a2
    80005a34:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005a38:	fe043783          	ld	a5,-32(s0)
    80005a3c:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005a40:	fc046783          	lwu	a5,-64(s0)
    80005a44:	3ff7f793          	andi	a5,a5,1023
    80005a48:	97ba                	add	a5,a5,a4
    80005a4a:	fdc46683          	lwu	a3,-36(s0)
    80005a4e:	fc442703          	lw	a4,-60(s0)
    80005a52:	fb843603          	ld	a2,-72(s0)
    80005a56:	85ba                	mv	a1,a4
    80005a58:	853e                	mv	a0,a5
    80005a5a:	ffffe097          	auipc	ra,0xffffe
    80005a5e:	de6080e7          	jalr	-538(ra) # 80003840 <either_copyin>
    80005a62:	87aa                	mv	a5,a0
    80005a64:	873e                	mv	a4,a5
    80005a66:	57fd                	li	a5,-1
    80005a68:	00f71963          	bne	a4,a5,80005a7a <writei+0x12a>
      brelse(bp);
    80005a6c:	fe043503          	ld	a0,-32(s0)
    80005a70:	fffff097          	auipc	ra,0xfffff
    80005a74:	e48080e7          	jalr	-440(ra) # 800048b8 <brelse>
      break;
    80005a78:	a8a1                	j	80005ad0 <writei+0x180>
    }
    log_write(bp);
    80005a7a:	fe043503          	ld	a0,-32(s0)
    80005a7e:	00001097          	auipc	ra,0x1
    80005a82:	aec080e7          	jalr	-1300(ra) # 8000656a <log_write>
    brelse(bp);
    80005a86:	fe043503          	ld	a0,-32(s0)
    80005a8a:	fffff097          	auipc	ra,0xfffff
    80005a8e:	e2e080e7          	jalr	-466(ra) # 800048b8 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005a92:	fec42703          	lw	a4,-20(s0)
    80005a96:	fdc42783          	lw	a5,-36(s0)
    80005a9a:	9fb9                	addw	a5,a5,a4
    80005a9c:	fef42623          	sw	a5,-20(s0)
    80005aa0:	fc042703          	lw	a4,-64(s0)
    80005aa4:	fdc42783          	lw	a5,-36(s0)
    80005aa8:	9fb9                	addw	a5,a5,a4
    80005aaa:	fcf42023          	sw	a5,-64(s0)
    80005aae:	fdc46783          	lwu	a5,-36(s0)
    80005ab2:	fb843703          	ld	a4,-72(s0)
    80005ab6:	97ba                	add	a5,a5,a4
    80005ab8:	faf43c23          	sd	a5,-72(s0)
    80005abc:	fec42703          	lw	a4,-20(s0)
    80005ac0:	fb442783          	lw	a5,-76(s0)
    80005ac4:	2701                	sext.w	a4,a4
    80005ac6:	2781                	sext.w	a5,a5
    80005ac8:	eef76be3          	bltu	a4,a5,800059be <writei+0x6e>
    80005acc:	a011                	j	80005ad0 <writei+0x180>
      break;
    80005ace:	0001                	nop
  }

  if(off > ip->size)
    80005ad0:	fc843783          	ld	a5,-56(s0)
    80005ad4:	47f8                	lw	a4,76(a5)
    80005ad6:	fc042783          	lw	a5,-64(s0)
    80005ada:	2781                	sext.w	a5,a5
    80005adc:	00f77763          	bgeu	a4,a5,80005aea <writei+0x19a>
    ip->size = off;
    80005ae0:	fc843783          	ld	a5,-56(s0)
    80005ae4:	fc042703          	lw	a4,-64(s0)
    80005ae8:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005aea:	fc843503          	ld	a0,-56(s0)
    80005aee:	fffff097          	auipc	ra,0xfffff
    80005af2:	4c4080e7          	jalr	1220(ra) # 80004fb2 <iupdate>

  return tot;
    80005af6:	fec42783          	lw	a5,-20(s0)
}
    80005afa:	853e                	mv	a0,a5
    80005afc:	60a6                	ld	ra,72(sp)
    80005afe:	6406                	ld	s0,64(sp)
    80005b00:	6161                	addi	sp,sp,80
    80005b02:	8082                	ret

0000000080005b04 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005b04:	1101                	addi	sp,sp,-32
    80005b06:	ec06                	sd	ra,24(sp)
    80005b08:	e822                	sd	s0,16(sp)
    80005b0a:	1000                	addi	s0,sp,32
    80005b0c:	fea43423          	sd	a0,-24(s0)
    80005b10:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005b14:	4639                	li	a2,14
    80005b16:	fe043583          	ld	a1,-32(s0)
    80005b1a:	fe843503          	ld	a0,-24(s0)
    80005b1e:	ffffc097          	auipc	ra,0xffffc
    80005b22:	bd8080e7          	jalr	-1064(ra) # 800016f6 <strncmp>
    80005b26:	87aa                	mv	a5,a0
}
    80005b28:	853e                	mv	a0,a5
    80005b2a:	60e2                	ld	ra,24(sp)
    80005b2c:	6442                	ld	s0,16(sp)
    80005b2e:	6105                	addi	sp,sp,32
    80005b30:	8082                	ret

0000000080005b32 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005b32:	715d                	addi	sp,sp,-80
    80005b34:	e486                	sd	ra,72(sp)
    80005b36:	e0a2                	sd	s0,64(sp)
    80005b38:	0880                	addi	s0,sp,80
    80005b3a:	fca43423          	sd	a0,-56(s0)
    80005b3e:	fcb43023          	sd	a1,-64(s0)
    80005b42:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005b46:	fc843783          	ld	a5,-56(s0)
    80005b4a:	04479783          	lh	a5,68(a5)
    80005b4e:	0007871b          	sext.w	a4,a5
    80005b52:	4785                	li	a5,1
    80005b54:	00f70a63          	beq	a4,a5,80005b68 <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005b58:	00006517          	auipc	a0,0x6
    80005b5c:	9c850513          	addi	a0,a0,-1592 # 8000b520 <etext+0x520>
    80005b60:	ffffb097          	auipc	ra,0xffffb
    80005b64:	12c080e7          	jalr	300(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005b68:	fe042623          	sw	zero,-20(s0)
    80005b6c:	a849                	j	80005bfe <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005b6e:	fd840793          	addi	a5,s0,-40
    80005b72:	fec42683          	lw	a3,-20(s0)
    80005b76:	4741                	li	a4,16
    80005b78:	863e                	mv	a2,a5
    80005b7a:	4581                	li	a1,0
    80005b7c:	fc843503          	ld	a0,-56(s0)
    80005b80:	00000097          	auipc	ra,0x0
    80005b84:	c38080e7          	jalr	-968(ra) # 800057b8 <readi>
    80005b88:	87aa                	mv	a5,a0
    80005b8a:	873e                	mv	a4,a5
    80005b8c:	47c1                	li	a5,16
    80005b8e:	00f70a63          	beq	a4,a5,80005ba2 <dirlookup+0x70>
      panic("dirlookup read");
    80005b92:	00006517          	auipc	a0,0x6
    80005b96:	9a650513          	addi	a0,a0,-1626 # 8000b538 <etext+0x538>
    80005b9a:	ffffb097          	auipc	ra,0xffffb
    80005b9e:	0f2080e7          	jalr	242(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005ba2:	fd845783          	lhu	a5,-40(s0)
    80005ba6:	c7b1                	beqz	a5,80005bf2 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005ba8:	fd840793          	addi	a5,s0,-40
    80005bac:	0789                	addi	a5,a5,2
    80005bae:	85be                	mv	a1,a5
    80005bb0:	fc043503          	ld	a0,-64(s0)
    80005bb4:	00000097          	auipc	ra,0x0
    80005bb8:	f50080e7          	jalr	-176(ra) # 80005b04 <namecmp>
    80005bbc:	87aa                	mv	a5,a0
    80005bbe:	eb9d                	bnez	a5,80005bf4 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005bc0:	fb843783          	ld	a5,-72(s0)
    80005bc4:	c791                	beqz	a5,80005bd0 <dirlookup+0x9e>
        *poff = off;
    80005bc6:	fb843783          	ld	a5,-72(s0)
    80005bca:	fec42703          	lw	a4,-20(s0)
    80005bce:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005bd0:	fd845783          	lhu	a5,-40(s0)
    80005bd4:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005bd8:	fc843783          	ld	a5,-56(s0)
    80005bdc:	439c                	lw	a5,0(a5)
    80005bde:	fe842703          	lw	a4,-24(s0)
    80005be2:	85ba                	mv	a1,a4
    80005be4:	853e                	mv	a0,a5
    80005be6:	fffff097          	auipc	ra,0xfffff
    80005bea:	4b4080e7          	jalr	1204(ra) # 8000509a <iget>
    80005bee:	87aa                	mv	a5,a0
    80005bf0:	a005                	j	80005c10 <dirlookup+0xde>
      continue;
    80005bf2:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005bf4:	fec42783          	lw	a5,-20(s0)
    80005bf8:	27c1                	addiw	a5,a5,16
    80005bfa:	fef42623          	sw	a5,-20(s0)
    80005bfe:	fc843783          	ld	a5,-56(s0)
    80005c02:	47f8                	lw	a4,76(a5)
    80005c04:	fec42783          	lw	a5,-20(s0)
    80005c08:	2781                	sext.w	a5,a5
    80005c0a:	f6e7e2e3          	bltu	a5,a4,80005b6e <dirlookup+0x3c>
    }
  }

  return 0;
    80005c0e:	4781                	li	a5,0
}
    80005c10:	853e                	mv	a0,a5
    80005c12:	60a6                	ld	ra,72(sp)
    80005c14:	6406                	ld	s0,64(sp)
    80005c16:	6161                	addi	sp,sp,80
    80005c18:	8082                	ret

0000000080005c1a <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005c1a:	715d                	addi	sp,sp,-80
    80005c1c:	e486                	sd	ra,72(sp)
    80005c1e:	e0a2                	sd	s0,64(sp)
    80005c20:	0880                	addi	s0,sp,80
    80005c22:	fca43423          	sd	a0,-56(s0)
    80005c26:	fcb43023          	sd	a1,-64(s0)
    80005c2a:	87b2                	mv	a5,a2
    80005c2c:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005c30:	4601                	li	a2,0
    80005c32:	fc043583          	ld	a1,-64(s0)
    80005c36:	fc843503          	ld	a0,-56(s0)
    80005c3a:	00000097          	auipc	ra,0x0
    80005c3e:	ef8080e7          	jalr	-264(ra) # 80005b32 <dirlookup>
    80005c42:	fea43023          	sd	a0,-32(s0)
    80005c46:	fe043783          	ld	a5,-32(s0)
    80005c4a:	cb89                	beqz	a5,80005c5c <dirlink+0x42>
    iput(ip);
    80005c4c:	fe043503          	ld	a0,-32(s0)
    80005c50:	fffff097          	auipc	ra,0xfffff
    80005c54:	740080e7          	jalr	1856(ra) # 80005390 <iput>
    return -1;
    80005c58:	57fd                	li	a5,-1
    80005c5a:	a075                	j	80005d06 <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c5c:	fe042623          	sw	zero,-20(s0)
    80005c60:	a0a1                	j	80005ca8 <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005c62:	fd040793          	addi	a5,s0,-48
    80005c66:	fec42683          	lw	a3,-20(s0)
    80005c6a:	4741                	li	a4,16
    80005c6c:	863e                	mv	a2,a5
    80005c6e:	4581                	li	a1,0
    80005c70:	fc843503          	ld	a0,-56(s0)
    80005c74:	00000097          	auipc	ra,0x0
    80005c78:	b44080e7          	jalr	-1212(ra) # 800057b8 <readi>
    80005c7c:	87aa                	mv	a5,a0
    80005c7e:	873e                	mv	a4,a5
    80005c80:	47c1                	li	a5,16
    80005c82:	00f70a63          	beq	a4,a5,80005c96 <dirlink+0x7c>
      panic("dirlink read");
    80005c86:	00006517          	auipc	a0,0x6
    80005c8a:	8c250513          	addi	a0,a0,-1854 # 8000b548 <etext+0x548>
    80005c8e:	ffffb097          	auipc	ra,0xffffb
    80005c92:	ffe080e7          	jalr	-2(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005c96:	fd045783          	lhu	a5,-48(s0)
    80005c9a:	cf99                	beqz	a5,80005cb8 <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c9c:	fec42783          	lw	a5,-20(s0)
    80005ca0:	27c1                	addiw	a5,a5,16
    80005ca2:	2781                	sext.w	a5,a5
    80005ca4:	fef42623          	sw	a5,-20(s0)
    80005ca8:	fc843783          	ld	a5,-56(s0)
    80005cac:	47f8                	lw	a4,76(a5)
    80005cae:	fec42783          	lw	a5,-20(s0)
    80005cb2:	fae7e8e3          	bltu	a5,a4,80005c62 <dirlink+0x48>
    80005cb6:	a011                	j	80005cba <dirlink+0xa0>
      break;
    80005cb8:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005cba:	fd040793          	addi	a5,s0,-48
    80005cbe:	0789                	addi	a5,a5,2
    80005cc0:	4639                	li	a2,14
    80005cc2:	fc043583          	ld	a1,-64(s0)
    80005cc6:	853e                	mv	a0,a5
    80005cc8:	ffffc097          	auipc	ra,0xffffc
    80005ccc:	ab8080e7          	jalr	-1352(ra) # 80001780 <strncpy>
  de.inum = inum;
    80005cd0:	fbc42783          	lw	a5,-68(s0)
    80005cd4:	17c2                	slli	a5,a5,0x30
    80005cd6:	93c1                	srli	a5,a5,0x30
    80005cd8:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005cdc:	fd040793          	addi	a5,s0,-48
    80005ce0:	fec42683          	lw	a3,-20(s0)
    80005ce4:	4741                	li	a4,16
    80005ce6:	863e                	mv	a2,a5
    80005ce8:	4581                	li	a1,0
    80005cea:	fc843503          	ld	a0,-56(s0)
    80005cee:	00000097          	auipc	ra,0x0
    80005cf2:	c62080e7          	jalr	-926(ra) # 80005950 <writei>
    80005cf6:	87aa                	mv	a5,a0
    80005cf8:	873e                	mv	a4,a5
    80005cfa:	47c1                	li	a5,16
    80005cfc:	00f70463          	beq	a4,a5,80005d04 <dirlink+0xea>
    return -1;
    80005d00:	57fd                	li	a5,-1
    80005d02:	a011                	j	80005d06 <dirlink+0xec>

  return 0;
    80005d04:	4781                	li	a5,0
}
    80005d06:	853e                	mv	a0,a5
    80005d08:	60a6                	ld	ra,72(sp)
    80005d0a:	6406                	ld	s0,64(sp)
    80005d0c:	6161                	addi	sp,sp,80
    80005d0e:	8082                	ret

0000000080005d10 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005d10:	7179                	addi	sp,sp,-48
    80005d12:	f406                	sd	ra,40(sp)
    80005d14:	f022                	sd	s0,32(sp)
    80005d16:	1800                	addi	s0,sp,48
    80005d18:	fca43c23          	sd	a0,-40(s0)
    80005d1c:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005d20:	a031                	j	80005d2c <skipelem+0x1c>
    path++;
    80005d22:	fd843783          	ld	a5,-40(s0)
    80005d26:	0785                	addi	a5,a5,1
    80005d28:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005d2c:	fd843783          	ld	a5,-40(s0)
    80005d30:	0007c783          	lbu	a5,0(a5)
    80005d34:	873e                	mv	a4,a5
    80005d36:	02f00793          	li	a5,47
    80005d3a:	fef704e3          	beq	a4,a5,80005d22 <skipelem+0x12>
  if(*path == 0)
    80005d3e:	fd843783          	ld	a5,-40(s0)
    80005d42:	0007c783          	lbu	a5,0(a5)
    80005d46:	e399                	bnez	a5,80005d4c <skipelem+0x3c>
    return 0;
    80005d48:	4781                	li	a5,0
    80005d4a:	a06d                	j	80005df4 <skipelem+0xe4>
  s = path;
    80005d4c:	fd843783          	ld	a5,-40(s0)
    80005d50:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005d54:	a031                	j	80005d60 <skipelem+0x50>
    path++;
    80005d56:	fd843783          	ld	a5,-40(s0)
    80005d5a:	0785                	addi	a5,a5,1
    80005d5c:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005d60:	fd843783          	ld	a5,-40(s0)
    80005d64:	0007c783          	lbu	a5,0(a5)
    80005d68:	873e                	mv	a4,a5
    80005d6a:	02f00793          	li	a5,47
    80005d6e:	00f70763          	beq	a4,a5,80005d7c <skipelem+0x6c>
    80005d72:	fd843783          	ld	a5,-40(s0)
    80005d76:	0007c783          	lbu	a5,0(a5)
    80005d7a:	fff1                	bnez	a5,80005d56 <skipelem+0x46>
  len = path - s;
    80005d7c:	fd843703          	ld	a4,-40(s0)
    80005d80:	fe843783          	ld	a5,-24(s0)
    80005d84:	40f707b3          	sub	a5,a4,a5
    80005d88:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005d8c:	fe442783          	lw	a5,-28(s0)
    80005d90:	0007871b          	sext.w	a4,a5
    80005d94:	47b5                	li	a5,13
    80005d96:	00e7dc63          	bge	a5,a4,80005dae <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005d9a:	4639                	li	a2,14
    80005d9c:	fe843583          	ld	a1,-24(s0)
    80005da0:	fd043503          	ld	a0,-48(s0)
    80005da4:	ffffc097          	auipc	ra,0xffffc
    80005da8:	83e080e7          	jalr	-1986(ra) # 800015e2 <memmove>
    80005dac:	a80d                	j	80005dde <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005dae:	fe442783          	lw	a5,-28(s0)
    80005db2:	863e                	mv	a2,a5
    80005db4:	fe843583          	ld	a1,-24(s0)
    80005db8:	fd043503          	ld	a0,-48(s0)
    80005dbc:	ffffc097          	auipc	ra,0xffffc
    80005dc0:	826080e7          	jalr	-2010(ra) # 800015e2 <memmove>
    name[len] = 0;
    80005dc4:	fe442783          	lw	a5,-28(s0)
    80005dc8:	fd043703          	ld	a4,-48(s0)
    80005dcc:	97ba                	add	a5,a5,a4
    80005dce:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005dd2:	a031                	j	80005dde <skipelem+0xce>
    path++;
    80005dd4:	fd843783          	ld	a5,-40(s0)
    80005dd8:	0785                	addi	a5,a5,1
    80005dda:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005dde:	fd843783          	ld	a5,-40(s0)
    80005de2:	0007c783          	lbu	a5,0(a5)
    80005de6:	873e                	mv	a4,a5
    80005de8:	02f00793          	li	a5,47
    80005dec:	fef704e3          	beq	a4,a5,80005dd4 <skipelem+0xc4>
  return path;
    80005df0:	fd843783          	ld	a5,-40(s0)
}
    80005df4:	853e                	mv	a0,a5
    80005df6:	70a2                	ld	ra,40(sp)
    80005df8:	7402                	ld	s0,32(sp)
    80005dfa:	6145                	addi	sp,sp,48
    80005dfc:	8082                	ret

0000000080005dfe <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005dfe:	7139                	addi	sp,sp,-64
    80005e00:	fc06                	sd	ra,56(sp)
    80005e02:	f822                	sd	s0,48(sp)
    80005e04:	0080                	addi	s0,sp,64
    80005e06:	fca43c23          	sd	a0,-40(s0)
    80005e0a:	87ae                	mv	a5,a1
    80005e0c:	fcc43423          	sd	a2,-56(s0)
    80005e10:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005e14:	fd843783          	ld	a5,-40(s0)
    80005e18:	0007c783          	lbu	a5,0(a5)
    80005e1c:	873e                	mv	a4,a5
    80005e1e:	02f00793          	li	a5,47
    80005e22:	00f71b63          	bne	a4,a5,80005e38 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005e26:	4585                	li	a1,1
    80005e28:	4505                	li	a0,1
    80005e2a:	fffff097          	auipc	ra,0xfffff
    80005e2e:	270080e7          	jalr	624(ra) # 8000509a <iget>
    80005e32:	fea43423          	sd	a0,-24(s0)
    80005e36:	a84d                	j	80005ee8 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005e38:	ffffd097          	auipc	ra,0xffffd
    80005e3c:	b84080e7          	jalr	-1148(ra) # 800029bc <myproc>
    80005e40:	87aa                	mv	a5,a0
    80005e42:	1507b783          	ld	a5,336(a5)
    80005e46:	853e                	mv	a0,a5
    80005e48:	fffff097          	auipc	ra,0xfffff
    80005e4c:	36e080e7          	jalr	878(ra) # 800051b6 <idup>
    80005e50:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005e54:	a851                	j	80005ee8 <namex+0xea>
    ilock(ip);
    80005e56:	fe843503          	ld	a0,-24(s0)
    80005e5a:	fffff097          	auipc	ra,0xfffff
    80005e5e:	3a8080e7          	jalr	936(ra) # 80005202 <ilock>
    if(ip->type != T_DIR){
    80005e62:	fe843783          	ld	a5,-24(s0)
    80005e66:	04479783          	lh	a5,68(a5)
    80005e6a:	0007871b          	sext.w	a4,a5
    80005e6e:	4785                	li	a5,1
    80005e70:	00f70a63          	beq	a4,a5,80005e84 <namex+0x86>
      iunlockput(ip);
    80005e74:	fe843503          	ld	a0,-24(s0)
    80005e78:	fffff097          	auipc	ra,0xfffff
    80005e7c:	5e8080e7          	jalr	1512(ra) # 80005460 <iunlockput>
      return 0;
    80005e80:	4781                	li	a5,0
    80005e82:	a871                	j	80005f1e <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005e84:	fd442783          	lw	a5,-44(s0)
    80005e88:	2781                	sext.w	a5,a5
    80005e8a:	cf99                	beqz	a5,80005ea8 <namex+0xaa>
    80005e8c:	fd843783          	ld	a5,-40(s0)
    80005e90:	0007c783          	lbu	a5,0(a5)
    80005e94:	eb91                	bnez	a5,80005ea8 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005e96:	fe843503          	ld	a0,-24(s0)
    80005e9a:	fffff097          	auipc	ra,0xfffff
    80005e9e:	49c080e7          	jalr	1180(ra) # 80005336 <iunlock>
      return ip;
    80005ea2:	fe843783          	ld	a5,-24(s0)
    80005ea6:	a8a5                	j	80005f1e <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005ea8:	4601                	li	a2,0
    80005eaa:	fc843583          	ld	a1,-56(s0)
    80005eae:	fe843503          	ld	a0,-24(s0)
    80005eb2:	00000097          	auipc	ra,0x0
    80005eb6:	c80080e7          	jalr	-896(ra) # 80005b32 <dirlookup>
    80005eba:	fea43023          	sd	a0,-32(s0)
    80005ebe:	fe043783          	ld	a5,-32(s0)
    80005ec2:	eb89                	bnez	a5,80005ed4 <namex+0xd6>
      iunlockput(ip);
    80005ec4:	fe843503          	ld	a0,-24(s0)
    80005ec8:	fffff097          	auipc	ra,0xfffff
    80005ecc:	598080e7          	jalr	1432(ra) # 80005460 <iunlockput>
      return 0;
    80005ed0:	4781                	li	a5,0
    80005ed2:	a0b1                	j	80005f1e <namex+0x120>
    }
    iunlockput(ip);
    80005ed4:	fe843503          	ld	a0,-24(s0)
    80005ed8:	fffff097          	auipc	ra,0xfffff
    80005edc:	588080e7          	jalr	1416(ra) # 80005460 <iunlockput>
    ip = next;
    80005ee0:	fe043783          	ld	a5,-32(s0)
    80005ee4:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005ee8:	fc843583          	ld	a1,-56(s0)
    80005eec:	fd843503          	ld	a0,-40(s0)
    80005ef0:	00000097          	auipc	ra,0x0
    80005ef4:	e20080e7          	jalr	-480(ra) # 80005d10 <skipelem>
    80005ef8:	fca43c23          	sd	a0,-40(s0)
    80005efc:	fd843783          	ld	a5,-40(s0)
    80005f00:	fbb9                	bnez	a5,80005e56 <namex+0x58>
  }
  if(nameiparent){
    80005f02:	fd442783          	lw	a5,-44(s0)
    80005f06:	2781                	sext.w	a5,a5
    80005f08:	cb89                	beqz	a5,80005f1a <namex+0x11c>
    iput(ip);
    80005f0a:	fe843503          	ld	a0,-24(s0)
    80005f0e:	fffff097          	auipc	ra,0xfffff
    80005f12:	482080e7          	jalr	1154(ra) # 80005390 <iput>
    return 0;
    80005f16:	4781                	li	a5,0
    80005f18:	a019                	j	80005f1e <namex+0x120>
  }
  return ip;
    80005f1a:	fe843783          	ld	a5,-24(s0)
}
    80005f1e:	853e                	mv	a0,a5
    80005f20:	70e2                	ld	ra,56(sp)
    80005f22:	7442                	ld	s0,48(sp)
    80005f24:	6121                	addi	sp,sp,64
    80005f26:	8082                	ret

0000000080005f28 <namei>:

struct inode*
namei(char *path)
{
    80005f28:	7179                	addi	sp,sp,-48
    80005f2a:	f406                	sd	ra,40(sp)
    80005f2c:	f022                	sd	s0,32(sp)
    80005f2e:	1800                	addi	s0,sp,48
    80005f30:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005f34:	fe040793          	addi	a5,s0,-32
    80005f38:	863e                	mv	a2,a5
    80005f3a:	4581                	li	a1,0
    80005f3c:	fd843503          	ld	a0,-40(s0)
    80005f40:	00000097          	auipc	ra,0x0
    80005f44:	ebe080e7          	jalr	-322(ra) # 80005dfe <namex>
    80005f48:	87aa                	mv	a5,a0
}
    80005f4a:	853e                	mv	a0,a5
    80005f4c:	70a2                	ld	ra,40(sp)
    80005f4e:	7402                	ld	s0,32(sp)
    80005f50:	6145                	addi	sp,sp,48
    80005f52:	8082                	ret

0000000080005f54 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80005f54:	1101                	addi	sp,sp,-32
    80005f56:	ec06                	sd	ra,24(sp)
    80005f58:	e822                	sd	s0,16(sp)
    80005f5a:	1000                	addi	s0,sp,32
    80005f5c:	fea43423          	sd	a0,-24(s0)
    80005f60:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80005f64:	fe043603          	ld	a2,-32(s0)
    80005f68:	4585                	li	a1,1
    80005f6a:	fe843503          	ld	a0,-24(s0)
    80005f6e:	00000097          	auipc	ra,0x0
    80005f72:	e90080e7          	jalr	-368(ra) # 80005dfe <namex>
    80005f76:	87aa                	mv	a5,a0
}
    80005f78:	853e                	mv	a0,a5
    80005f7a:	60e2                	ld	ra,24(sp)
    80005f7c:	6442                	ld	s0,16(sp)
    80005f7e:	6105                	addi	sp,sp,32
    80005f80:	8082                	ret

0000000080005f82 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80005f82:	1101                	addi	sp,sp,-32
    80005f84:	ec06                	sd	ra,24(sp)
    80005f86:	e822                	sd	s0,16(sp)
    80005f88:	1000                	addi	s0,sp,32
    80005f8a:	87aa                	mv	a5,a0
    80005f8c:	feb43023          	sd	a1,-32(s0)
    80005f90:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80005f94:	00005597          	auipc	a1,0x5
    80005f98:	5c458593          	addi	a1,a1,1476 # 8000b558 <etext+0x558>
    80005f9c:	0002e517          	auipc	a0,0x2e
    80005fa0:	bec50513          	addi	a0,a0,-1044 # 80033b88 <log>
    80005fa4:	ffffb097          	auipc	ra,0xffffb
    80005fa8:	356080e7          	jalr	854(ra) # 800012fa <initlock>
  log.start = sb->logstart;
    80005fac:	fe043783          	ld	a5,-32(s0)
    80005fb0:	4bdc                	lw	a5,20(a5)
    80005fb2:	0007871b          	sext.w	a4,a5
    80005fb6:	0002e797          	auipc	a5,0x2e
    80005fba:	bd278793          	addi	a5,a5,-1070 # 80033b88 <log>
    80005fbe:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80005fc0:	fe043783          	ld	a5,-32(s0)
    80005fc4:	4b9c                	lw	a5,16(a5)
    80005fc6:	0007871b          	sext.w	a4,a5
    80005fca:	0002e797          	auipc	a5,0x2e
    80005fce:	bbe78793          	addi	a5,a5,-1090 # 80033b88 <log>
    80005fd2:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80005fd4:	0002e797          	auipc	a5,0x2e
    80005fd8:	bb478793          	addi	a5,a5,-1100 # 80033b88 <log>
    80005fdc:	fec42703          	lw	a4,-20(s0)
    80005fe0:	d798                	sw	a4,40(a5)
  recover_from_log();
    80005fe2:	00000097          	auipc	ra,0x0
    80005fe6:	272080e7          	jalr	626(ra) # 80006254 <recover_from_log>
}
    80005fea:	0001                	nop
    80005fec:	60e2                	ld	ra,24(sp)
    80005fee:	6442                	ld	s0,16(sp)
    80005ff0:	6105                	addi	sp,sp,32
    80005ff2:	8082                	ret

0000000080005ff4 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80005ff4:	7139                	addi	sp,sp,-64
    80005ff6:	fc06                	sd	ra,56(sp)
    80005ff8:	f822                	sd	s0,48(sp)
    80005ffa:	0080                	addi	s0,sp,64
    80005ffc:	87aa                	mv	a5,a0
    80005ffe:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006002:	fe042623          	sw	zero,-20(s0)
    80006006:	a0f9                	j	800060d4 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80006008:	0002e797          	auipc	a5,0x2e
    8000600c:	b8078793          	addi	a5,a5,-1152 # 80033b88 <log>
    80006010:	579c                	lw	a5,40(a5)
    80006012:	0007869b          	sext.w	a3,a5
    80006016:	0002e797          	auipc	a5,0x2e
    8000601a:	b7278793          	addi	a5,a5,-1166 # 80033b88 <log>
    8000601e:	4f9c                	lw	a5,24(a5)
    80006020:	fec42703          	lw	a4,-20(s0)
    80006024:	9fb9                	addw	a5,a5,a4
    80006026:	2781                	sext.w	a5,a5
    80006028:	2785                	addiw	a5,a5,1
    8000602a:	2781                	sext.w	a5,a5
    8000602c:	2781                	sext.w	a5,a5
    8000602e:	85be                	mv	a1,a5
    80006030:	8536                	mv	a0,a3
    80006032:	ffffe097          	auipc	ra,0xffffe
    80006036:	7dc080e7          	jalr	2012(ra) # 8000480e <bread>
    8000603a:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    8000603e:	0002e797          	auipc	a5,0x2e
    80006042:	b4a78793          	addi	a5,a5,-1206 # 80033b88 <log>
    80006046:	579c                	lw	a5,40(a5)
    80006048:	0007869b          	sext.w	a3,a5
    8000604c:	0002e717          	auipc	a4,0x2e
    80006050:	b3c70713          	addi	a4,a4,-1220 # 80033b88 <log>
    80006054:	fec42783          	lw	a5,-20(s0)
    80006058:	07a1                	addi	a5,a5,8
    8000605a:	078a                	slli	a5,a5,0x2
    8000605c:	97ba                	add	a5,a5,a4
    8000605e:	4b9c                	lw	a5,16(a5)
    80006060:	2781                	sext.w	a5,a5
    80006062:	85be                	mv	a1,a5
    80006064:	8536                	mv	a0,a3
    80006066:	ffffe097          	auipc	ra,0xffffe
    8000606a:	7a8080e7          	jalr	1960(ra) # 8000480e <bread>
    8000606e:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006072:	fd843783          	ld	a5,-40(s0)
    80006076:	05878713          	addi	a4,a5,88
    8000607a:	fe043783          	ld	a5,-32(s0)
    8000607e:	05878793          	addi	a5,a5,88
    80006082:	40000613          	li	a2,1024
    80006086:	85be                	mv	a1,a5
    80006088:	853a                	mv	a0,a4
    8000608a:	ffffb097          	auipc	ra,0xffffb
    8000608e:	558080e7          	jalr	1368(ra) # 800015e2 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006092:	fd843503          	ld	a0,-40(s0)
    80006096:	ffffe097          	auipc	ra,0xffffe
    8000609a:	7d6080e7          	jalr	2006(ra) # 8000486c <bwrite>
    if(recovering == 0)
    8000609e:	fcc42783          	lw	a5,-52(s0)
    800060a2:	2781                	sext.w	a5,a5
    800060a4:	e799                	bnez	a5,800060b2 <install_trans+0xbe>
      bunpin(dbuf);
    800060a6:	fd843503          	ld	a0,-40(s0)
    800060aa:	fffff097          	auipc	ra,0xfffff
    800060ae:	944080e7          	jalr	-1724(ra) # 800049ee <bunpin>
    brelse(lbuf);
    800060b2:	fe043503          	ld	a0,-32(s0)
    800060b6:	fffff097          	auipc	ra,0xfffff
    800060ba:	802080e7          	jalr	-2046(ra) # 800048b8 <brelse>
    brelse(dbuf);
    800060be:	fd843503          	ld	a0,-40(s0)
    800060c2:	ffffe097          	auipc	ra,0xffffe
    800060c6:	7f6080e7          	jalr	2038(ra) # 800048b8 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800060ca:	fec42783          	lw	a5,-20(s0)
    800060ce:	2785                	addiw	a5,a5,1
    800060d0:	fef42623          	sw	a5,-20(s0)
    800060d4:	0002e797          	auipc	a5,0x2e
    800060d8:	ab478793          	addi	a5,a5,-1356 # 80033b88 <log>
    800060dc:	57d8                	lw	a4,44(a5)
    800060de:	fec42783          	lw	a5,-20(s0)
    800060e2:	2781                	sext.w	a5,a5
    800060e4:	f2e7c2e3          	blt	a5,a4,80006008 <install_trans+0x14>
  }
}
    800060e8:	0001                	nop
    800060ea:	0001                	nop
    800060ec:	70e2                	ld	ra,56(sp)
    800060ee:	7442                	ld	s0,48(sp)
    800060f0:	6121                	addi	sp,sp,64
    800060f2:	8082                	ret

00000000800060f4 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800060f4:	7179                	addi	sp,sp,-48
    800060f6:	f406                	sd	ra,40(sp)
    800060f8:	f022                	sd	s0,32(sp)
    800060fa:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800060fc:	0002e797          	auipc	a5,0x2e
    80006100:	a8c78793          	addi	a5,a5,-1396 # 80033b88 <log>
    80006104:	579c                	lw	a5,40(a5)
    80006106:	0007871b          	sext.w	a4,a5
    8000610a:	0002e797          	auipc	a5,0x2e
    8000610e:	a7e78793          	addi	a5,a5,-1410 # 80033b88 <log>
    80006112:	4f9c                	lw	a5,24(a5)
    80006114:	2781                	sext.w	a5,a5
    80006116:	85be                	mv	a1,a5
    80006118:	853a                	mv	a0,a4
    8000611a:	ffffe097          	auipc	ra,0xffffe
    8000611e:	6f4080e7          	jalr	1780(ra) # 8000480e <bread>
    80006122:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80006126:	fe043783          	ld	a5,-32(s0)
    8000612a:	05878793          	addi	a5,a5,88
    8000612e:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006132:	fd843783          	ld	a5,-40(s0)
    80006136:	4398                	lw	a4,0(a5)
    80006138:	0002e797          	auipc	a5,0x2e
    8000613c:	a5078793          	addi	a5,a5,-1456 # 80033b88 <log>
    80006140:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006142:	fe042623          	sw	zero,-20(s0)
    80006146:	a03d                	j	80006174 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80006148:	fd843703          	ld	a4,-40(s0)
    8000614c:	fec42783          	lw	a5,-20(s0)
    80006150:	078a                	slli	a5,a5,0x2
    80006152:	97ba                	add	a5,a5,a4
    80006154:	43d8                	lw	a4,4(a5)
    80006156:	0002e697          	auipc	a3,0x2e
    8000615a:	a3268693          	addi	a3,a3,-1486 # 80033b88 <log>
    8000615e:	fec42783          	lw	a5,-20(s0)
    80006162:	07a1                	addi	a5,a5,8
    80006164:	078a                	slli	a5,a5,0x2
    80006166:	97b6                	add	a5,a5,a3
    80006168:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000616a:	fec42783          	lw	a5,-20(s0)
    8000616e:	2785                	addiw	a5,a5,1
    80006170:	fef42623          	sw	a5,-20(s0)
    80006174:	0002e797          	auipc	a5,0x2e
    80006178:	a1478793          	addi	a5,a5,-1516 # 80033b88 <log>
    8000617c:	57d8                	lw	a4,44(a5)
    8000617e:	fec42783          	lw	a5,-20(s0)
    80006182:	2781                	sext.w	a5,a5
    80006184:	fce7c2e3          	blt	a5,a4,80006148 <read_head+0x54>
  }
  brelse(buf);
    80006188:	fe043503          	ld	a0,-32(s0)
    8000618c:	ffffe097          	auipc	ra,0xffffe
    80006190:	72c080e7          	jalr	1836(ra) # 800048b8 <brelse>
}
    80006194:	0001                	nop
    80006196:	70a2                	ld	ra,40(sp)
    80006198:	7402                	ld	s0,32(sp)
    8000619a:	6145                	addi	sp,sp,48
    8000619c:	8082                	ret

000000008000619e <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000619e:	7179                	addi	sp,sp,-48
    800061a0:	f406                	sd	ra,40(sp)
    800061a2:	f022                	sd	s0,32(sp)
    800061a4:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800061a6:	0002e797          	auipc	a5,0x2e
    800061aa:	9e278793          	addi	a5,a5,-1566 # 80033b88 <log>
    800061ae:	579c                	lw	a5,40(a5)
    800061b0:	0007871b          	sext.w	a4,a5
    800061b4:	0002e797          	auipc	a5,0x2e
    800061b8:	9d478793          	addi	a5,a5,-1580 # 80033b88 <log>
    800061bc:	4f9c                	lw	a5,24(a5)
    800061be:	2781                	sext.w	a5,a5
    800061c0:	85be                	mv	a1,a5
    800061c2:	853a                	mv	a0,a4
    800061c4:	ffffe097          	auipc	ra,0xffffe
    800061c8:	64a080e7          	jalr	1610(ra) # 8000480e <bread>
    800061cc:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800061d0:	fe043783          	ld	a5,-32(s0)
    800061d4:	05878793          	addi	a5,a5,88
    800061d8:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    800061dc:	0002e797          	auipc	a5,0x2e
    800061e0:	9ac78793          	addi	a5,a5,-1620 # 80033b88 <log>
    800061e4:	57d8                	lw	a4,44(a5)
    800061e6:	fd843783          	ld	a5,-40(s0)
    800061ea:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800061ec:	fe042623          	sw	zero,-20(s0)
    800061f0:	a03d                	j	8000621e <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800061f2:	0002e717          	auipc	a4,0x2e
    800061f6:	99670713          	addi	a4,a4,-1642 # 80033b88 <log>
    800061fa:	fec42783          	lw	a5,-20(s0)
    800061fe:	07a1                	addi	a5,a5,8
    80006200:	078a                	slli	a5,a5,0x2
    80006202:	97ba                	add	a5,a5,a4
    80006204:	4b98                	lw	a4,16(a5)
    80006206:	fd843683          	ld	a3,-40(s0)
    8000620a:	fec42783          	lw	a5,-20(s0)
    8000620e:	078a                	slli	a5,a5,0x2
    80006210:	97b6                	add	a5,a5,a3
    80006212:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006214:	fec42783          	lw	a5,-20(s0)
    80006218:	2785                	addiw	a5,a5,1
    8000621a:	fef42623          	sw	a5,-20(s0)
    8000621e:	0002e797          	auipc	a5,0x2e
    80006222:	96a78793          	addi	a5,a5,-1686 # 80033b88 <log>
    80006226:	57d8                	lw	a4,44(a5)
    80006228:	fec42783          	lw	a5,-20(s0)
    8000622c:	2781                	sext.w	a5,a5
    8000622e:	fce7c2e3          	blt	a5,a4,800061f2 <write_head+0x54>
  }
  bwrite(buf);
    80006232:	fe043503          	ld	a0,-32(s0)
    80006236:	ffffe097          	auipc	ra,0xffffe
    8000623a:	636080e7          	jalr	1590(ra) # 8000486c <bwrite>
  brelse(buf);
    8000623e:	fe043503          	ld	a0,-32(s0)
    80006242:	ffffe097          	auipc	ra,0xffffe
    80006246:	676080e7          	jalr	1654(ra) # 800048b8 <brelse>
}
    8000624a:	0001                	nop
    8000624c:	70a2                	ld	ra,40(sp)
    8000624e:	7402                	ld	s0,32(sp)
    80006250:	6145                	addi	sp,sp,48
    80006252:	8082                	ret

0000000080006254 <recover_from_log>:

static void
recover_from_log(void)
{
    80006254:	1141                	addi	sp,sp,-16
    80006256:	e406                	sd	ra,8(sp)
    80006258:	e022                	sd	s0,0(sp)
    8000625a:	0800                	addi	s0,sp,16
  read_head();
    8000625c:	00000097          	auipc	ra,0x0
    80006260:	e98080e7          	jalr	-360(ra) # 800060f4 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006264:	4505                	li	a0,1
    80006266:	00000097          	auipc	ra,0x0
    8000626a:	d8e080e7          	jalr	-626(ra) # 80005ff4 <install_trans>
  log.lh.n = 0;
    8000626e:	0002e797          	auipc	a5,0x2e
    80006272:	91a78793          	addi	a5,a5,-1766 # 80033b88 <log>
    80006276:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    8000627a:	00000097          	auipc	ra,0x0
    8000627e:	f24080e7          	jalr	-220(ra) # 8000619e <write_head>
}
    80006282:	0001                	nop
    80006284:	60a2                	ld	ra,8(sp)
    80006286:	6402                	ld	s0,0(sp)
    80006288:	0141                	addi	sp,sp,16
    8000628a:	8082                	ret

000000008000628c <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000628c:	1141                	addi	sp,sp,-16
    8000628e:	e406                	sd	ra,8(sp)
    80006290:	e022                	sd	s0,0(sp)
    80006292:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006294:	0002e517          	auipc	a0,0x2e
    80006298:	8f450513          	addi	a0,a0,-1804 # 80033b88 <log>
    8000629c:	ffffb097          	auipc	ra,0xffffb
    800062a0:	08e080e7          	jalr	142(ra) # 8000132a <acquire>
  while(1){
    if(log.committing){
    800062a4:	0002e797          	auipc	a5,0x2e
    800062a8:	8e478793          	addi	a5,a5,-1820 # 80033b88 <log>
    800062ac:	53dc                	lw	a5,36(a5)
    800062ae:	cf91                	beqz	a5,800062ca <begin_op+0x3e>
      sleep(&log, &log.lock);
    800062b0:	0002e597          	auipc	a1,0x2e
    800062b4:	8d858593          	addi	a1,a1,-1832 # 80033b88 <log>
    800062b8:	0002e517          	auipc	a0,0x2e
    800062bc:	8d050513          	addi	a0,a0,-1840 # 80033b88 <log>
    800062c0:	ffffd097          	auipc	ra,0xffffd
    800062c4:	2be080e7          	jalr	702(ra) # 8000357e <sleep>
    800062c8:	bff1                	j	800062a4 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800062ca:	0002e797          	auipc	a5,0x2e
    800062ce:	8be78793          	addi	a5,a5,-1858 # 80033b88 <log>
    800062d2:	57d8                	lw	a4,44(a5)
    800062d4:	0002e797          	auipc	a5,0x2e
    800062d8:	8b478793          	addi	a5,a5,-1868 # 80033b88 <log>
    800062dc:	539c                	lw	a5,32(a5)
    800062de:	2785                	addiw	a5,a5,1
    800062e0:	2781                	sext.w	a5,a5
    800062e2:	86be                	mv	a3,a5
    800062e4:	87b6                	mv	a5,a3
    800062e6:	0027979b          	slliw	a5,a5,0x2
    800062ea:	9fb5                	addw	a5,a5,a3
    800062ec:	0017979b          	slliw	a5,a5,0x1
    800062f0:	2781                	sext.w	a5,a5
    800062f2:	9fb9                	addw	a5,a5,a4
    800062f4:	2781                	sext.w	a5,a5
    800062f6:	873e                	mv	a4,a5
    800062f8:	47f9                	li	a5,30
    800062fa:	00e7df63          	bge	a5,a4,80006318 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800062fe:	0002e597          	auipc	a1,0x2e
    80006302:	88a58593          	addi	a1,a1,-1910 # 80033b88 <log>
    80006306:	0002e517          	auipc	a0,0x2e
    8000630a:	88250513          	addi	a0,a0,-1918 # 80033b88 <log>
    8000630e:	ffffd097          	auipc	ra,0xffffd
    80006312:	270080e7          	jalr	624(ra) # 8000357e <sleep>
    80006316:	b779                	j	800062a4 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006318:	0002e797          	auipc	a5,0x2e
    8000631c:	87078793          	addi	a5,a5,-1936 # 80033b88 <log>
    80006320:	539c                	lw	a5,32(a5)
    80006322:	2785                	addiw	a5,a5,1
    80006324:	0007871b          	sext.w	a4,a5
    80006328:	0002e797          	auipc	a5,0x2e
    8000632c:	86078793          	addi	a5,a5,-1952 # 80033b88 <log>
    80006330:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006332:	0002e517          	auipc	a0,0x2e
    80006336:	85650513          	addi	a0,a0,-1962 # 80033b88 <log>
    8000633a:	ffffb097          	auipc	ra,0xffffb
    8000633e:	054080e7          	jalr	84(ra) # 8000138e <release>
      break;
    80006342:	0001                	nop
    }
  }
}
    80006344:	0001                	nop
    80006346:	60a2                	ld	ra,8(sp)
    80006348:	6402                	ld	s0,0(sp)
    8000634a:	0141                	addi	sp,sp,16
    8000634c:	8082                	ret

000000008000634e <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000634e:	1101                	addi	sp,sp,-32
    80006350:	ec06                	sd	ra,24(sp)
    80006352:	e822                	sd	s0,16(sp)
    80006354:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006356:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    8000635a:	0002e517          	auipc	a0,0x2e
    8000635e:	82e50513          	addi	a0,a0,-2002 # 80033b88 <log>
    80006362:	ffffb097          	auipc	ra,0xffffb
    80006366:	fc8080e7          	jalr	-56(ra) # 8000132a <acquire>
  log.outstanding -= 1;
    8000636a:	0002e797          	auipc	a5,0x2e
    8000636e:	81e78793          	addi	a5,a5,-2018 # 80033b88 <log>
    80006372:	539c                	lw	a5,32(a5)
    80006374:	37fd                	addiw	a5,a5,-1
    80006376:	0007871b          	sext.w	a4,a5
    8000637a:	0002e797          	auipc	a5,0x2e
    8000637e:	80e78793          	addi	a5,a5,-2034 # 80033b88 <log>
    80006382:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006384:	0002e797          	auipc	a5,0x2e
    80006388:	80478793          	addi	a5,a5,-2044 # 80033b88 <log>
    8000638c:	53dc                	lw	a5,36(a5)
    8000638e:	cb89                	beqz	a5,800063a0 <end_op+0x52>
    panic("log.committing");
    80006390:	00005517          	auipc	a0,0x5
    80006394:	1d050513          	addi	a0,a0,464 # 8000b560 <etext+0x560>
    80006398:	ffffb097          	auipc	ra,0xffffb
    8000639c:	8f4080e7          	jalr	-1804(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    800063a0:	0002d797          	auipc	a5,0x2d
    800063a4:	7e878793          	addi	a5,a5,2024 # 80033b88 <log>
    800063a8:	539c                	lw	a5,32(a5)
    800063aa:	eb99                	bnez	a5,800063c0 <end_op+0x72>
    do_commit = 1;
    800063ac:	4785                	li	a5,1
    800063ae:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800063b2:	0002d797          	auipc	a5,0x2d
    800063b6:	7d678793          	addi	a5,a5,2006 # 80033b88 <log>
    800063ba:	4705                	li	a4,1
    800063bc:	d3d8                	sw	a4,36(a5)
    800063be:	a809                	j	800063d0 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800063c0:	0002d517          	auipc	a0,0x2d
    800063c4:	7c850513          	addi	a0,a0,1992 # 80033b88 <log>
    800063c8:	ffffd097          	auipc	ra,0xffffd
    800063cc:	232080e7          	jalr	562(ra) # 800035fa <wakeup>
  }
  release(&log.lock);
    800063d0:	0002d517          	auipc	a0,0x2d
    800063d4:	7b850513          	addi	a0,a0,1976 # 80033b88 <log>
    800063d8:	ffffb097          	auipc	ra,0xffffb
    800063dc:	fb6080e7          	jalr	-74(ra) # 8000138e <release>

  if(do_commit){
    800063e0:	fec42783          	lw	a5,-20(s0)
    800063e4:	2781                	sext.w	a5,a5
    800063e6:	c3b9                	beqz	a5,8000642c <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800063e8:	00000097          	auipc	ra,0x0
    800063ec:	134080e7          	jalr	308(ra) # 8000651c <commit>
    acquire(&log.lock);
    800063f0:	0002d517          	auipc	a0,0x2d
    800063f4:	79850513          	addi	a0,a0,1944 # 80033b88 <log>
    800063f8:	ffffb097          	auipc	ra,0xffffb
    800063fc:	f32080e7          	jalr	-206(ra) # 8000132a <acquire>
    log.committing = 0;
    80006400:	0002d797          	auipc	a5,0x2d
    80006404:	78878793          	addi	a5,a5,1928 # 80033b88 <log>
    80006408:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000640c:	0002d517          	auipc	a0,0x2d
    80006410:	77c50513          	addi	a0,a0,1916 # 80033b88 <log>
    80006414:	ffffd097          	auipc	ra,0xffffd
    80006418:	1e6080e7          	jalr	486(ra) # 800035fa <wakeup>
    release(&log.lock);
    8000641c:	0002d517          	auipc	a0,0x2d
    80006420:	76c50513          	addi	a0,a0,1900 # 80033b88 <log>
    80006424:	ffffb097          	auipc	ra,0xffffb
    80006428:	f6a080e7          	jalr	-150(ra) # 8000138e <release>
  }
}
    8000642c:	0001                	nop
    8000642e:	60e2                	ld	ra,24(sp)
    80006430:	6442                	ld	s0,16(sp)
    80006432:	6105                	addi	sp,sp,32
    80006434:	8082                	ret

0000000080006436 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80006436:	7179                	addi	sp,sp,-48
    80006438:	f406                	sd	ra,40(sp)
    8000643a:	f022                	sd	s0,32(sp)
    8000643c:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    8000643e:	fe042623          	sw	zero,-20(s0)
    80006442:	a86d                	j	800064fc <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006444:	0002d797          	auipc	a5,0x2d
    80006448:	74478793          	addi	a5,a5,1860 # 80033b88 <log>
    8000644c:	579c                	lw	a5,40(a5)
    8000644e:	0007869b          	sext.w	a3,a5
    80006452:	0002d797          	auipc	a5,0x2d
    80006456:	73678793          	addi	a5,a5,1846 # 80033b88 <log>
    8000645a:	4f9c                	lw	a5,24(a5)
    8000645c:	fec42703          	lw	a4,-20(s0)
    80006460:	9fb9                	addw	a5,a5,a4
    80006462:	2781                	sext.w	a5,a5
    80006464:	2785                	addiw	a5,a5,1
    80006466:	2781                	sext.w	a5,a5
    80006468:	2781                	sext.w	a5,a5
    8000646a:	85be                	mv	a1,a5
    8000646c:	8536                	mv	a0,a3
    8000646e:	ffffe097          	auipc	ra,0xffffe
    80006472:	3a0080e7          	jalr	928(ra) # 8000480e <bread>
    80006476:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    8000647a:	0002d797          	auipc	a5,0x2d
    8000647e:	70e78793          	addi	a5,a5,1806 # 80033b88 <log>
    80006482:	579c                	lw	a5,40(a5)
    80006484:	0007869b          	sext.w	a3,a5
    80006488:	0002d717          	auipc	a4,0x2d
    8000648c:	70070713          	addi	a4,a4,1792 # 80033b88 <log>
    80006490:	fec42783          	lw	a5,-20(s0)
    80006494:	07a1                	addi	a5,a5,8
    80006496:	078a                	slli	a5,a5,0x2
    80006498:	97ba                	add	a5,a5,a4
    8000649a:	4b9c                	lw	a5,16(a5)
    8000649c:	2781                	sext.w	a5,a5
    8000649e:	85be                	mv	a1,a5
    800064a0:	8536                	mv	a0,a3
    800064a2:	ffffe097          	auipc	ra,0xffffe
    800064a6:	36c080e7          	jalr	876(ra) # 8000480e <bread>
    800064aa:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800064ae:	fe043783          	ld	a5,-32(s0)
    800064b2:	05878713          	addi	a4,a5,88
    800064b6:	fd843783          	ld	a5,-40(s0)
    800064ba:	05878793          	addi	a5,a5,88
    800064be:	40000613          	li	a2,1024
    800064c2:	85be                	mv	a1,a5
    800064c4:	853a                	mv	a0,a4
    800064c6:	ffffb097          	auipc	ra,0xffffb
    800064ca:	11c080e7          	jalr	284(ra) # 800015e2 <memmove>
    bwrite(to);  // write the log
    800064ce:	fe043503          	ld	a0,-32(s0)
    800064d2:	ffffe097          	auipc	ra,0xffffe
    800064d6:	39a080e7          	jalr	922(ra) # 8000486c <bwrite>
    brelse(from);
    800064da:	fd843503          	ld	a0,-40(s0)
    800064de:	ffffe097          	auipc	ra,0xffffe
    800064e2:	3da080e7          	jalr	986(ra) # 800048b8 <brelse>
    brelse(to);
    800064e6:	fe043503          	ld	a0,-32(s0)
    800064ea:	ffffe097          	auipc	ra,0xffffe
    800064ee:	3ce080e7          	jalr	974(ra) # 800048b8 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800064f2:	fec42783          	lw	a5,-20(s0)
    800064f6:	2785                	addiw	a5,a5,1
    800064f8:	fef42623          	sw	a5,-20(s0)
    800064fc:	0002d797          	auipc	a5,0x2d
    80006500:	68c78793          	addi	a5,a5,1676 # 80033b88 <log>
    80006504:	57d8                	lw	a4,44(a5)
    80006506:	fec42783          	lw	a5,-20(s0)
    8000650a:	2781                	sext.w	a5,a5
    8000650c:	f2e7cce3          	blt	a5,a4,80006444 <write_log+0xe>
  }
}
    80006510:	0001                	nop
    80006512:	0001                	nop
    80006514:	70a2                	ld	ra,40(sp)
    80006516:	7402                	ld	s0,32(sp)
    80006518:	6145                	addi	sp,sp,48
    8000651a:	8082                	ret

000000008000651c <commit>:

static void
commit()
{
    8000651c:	1141                	addi	sp,sp,-16
    8000651e:	e406                	sd	ra,8(sp)
    80006520:	e022                	sd	s0,0(sp)
    80006522:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006524:	0002d797          	auipc	a5,0x2d
    80006528:	66478793          	addi	a5,a5,1636 # 80033b88 <log>
    8000652c:	57dc                	lw	a5,44(a5)
    8000652e:	02f05963          	blez	a5,80006560 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006532:	00000097          	auipc	ra,0x0
    80006536:	f04080e7          	jalr	-252(ra) # 80006436 <write_log>
    write_head();    // Write header to disk -- the real commit
    8000653a:	00000097          	auipc	ra,0x0
    8000653e:	c64080e7          	jalr	-924(ra) # 8000619e <write_head>
    install_trans(0); // Now install writes to home locations
    80006542:	4501                	li	a0,0
    80006544:	00000097          	auipc	ra,0x0
    80006548:	ab0080e7          	jalr	-1360(ra) # 80005ff4 <install_trans>
    log.lh.n = 0;
    8000654c:	0002d797          	auipc	a5,0x2d
    80006550:	63c78793          	addi	a5,a5,1596 # 80033b88 <log>
    80006554:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006558:	00000097          	auipc	ra,0x0
    8000655c:	c46080e7          	jalr	-954(ra) # 8000619e <write_head>
  }
}
    80006560:	0001                	nop
    80006562:	60a2                	ld	ra,8(sp)
    80006564:	6402                	ld	s0,0(sp)
    80006566:	0141                	addi	sp,sp,16
    80006568:	8082                	ret

000000008000656a <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    8000656a:	7179                	addi	sp,sp,-48
    8000656c:	f406                	sd	ra,40(sp)
    8000656e:	f022                	sd	s0,32(sp)
    80006570:	1800                	addi	s0,sp,48
    80006572:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006576:	0002d517          	auipc	a0,0x2d
    8000657a:	61250513          	addi	a0,a0,1554 # 80033b88 <log>
    8000657e:	ffffb097          	auipc	ra,0xffffb
    80006582:	dac080e7          	jalr	-596(ra) # 8000132a <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006586:	0002d797          	auipc	a5,0x2d
    8000658a:	60278793          	addi	a5,a5,1538 # 80033b88 <log>
    8000658e:	57dc                	lw	a5,44(a5)
    80006590:	873e                	mv	a4,a5
    80006592:	47f5                	li	a5,29
    80006594:	02e7c063          	blt	a5,a4,800065b4 <log_write+0x4a>
    80006598:	0002d797          	auipc	a5,0x2d
    8000659c:	5f078793          	addi	a5,a5,1520 # 80033b88 <log>
    800065a0:	57d8                	lw	a4,44(a5)
    800065a2:	0002d797          	auipc	a5,0x2d
    800065a6:	5e678793          	addi	a5,a5,1510 # 80033b88 <log>
    800065aa:	4fdc                	lw	a5,28(a5)
    800065ac:	37fd                	addiw	a5,a5,-1
    800065ae:	2781                	sext.w	a5,a5
    800065b0:	00f74a63          	blt	a4,a5,800065c4 <log_write+0x5a>
    panic("too big a transaction");
    800065b4:	00005517          	auipc	a0,0x5
    800065b8:	fbc50513          	addi	a0,a0,-68 # 8000b570 <etext+0x570>
    800065bc:	ffffa097          	auipc	ra,0xffffa
    800065c0:	6d0080e7          	jalr	1744(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    800065c4:	0002d797          	auipc	a5,0x2d
    800065c8:	5c478793          	addi	a5,a5,1476 # 80033b88 <log>
    800065cc:	539c                	lw	a5,32(a5)
    800065ce:	00f04a63          	bgtz	a5,800065e2 <log_write+0x78>
    panic("log_write outside of trans");
    800065d2:	00005517          	auipc	a0,0x5
    800065d6:	fb650513          	addi	a0,a0,-74 # 8000b588 <etext+0x588>
    800065da:	ffffa097          	auipc	ra,0xffffa
    800065de:	6b2080e7          	jalr	1714(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    800065e2:	fe042623          	sw	zero,-20(s0)
    800065e6:	a03d                	j	80006614 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    800065e8:	0002d717          	auipc	a4,0x2d
    800065ec:	5a070713          	addi	a4,a4,1440 # 80033b88 <log>
    800065f0:	fec42783          	lw	a5,-20(s0)
    800065f4:	07a1                	addi	a5,a5,8
    800065f6:	078a                	slli	a5,a5,0x2
    800065f8:	97ba                	add	a5,a5,a4
    800065fa:	4b9c                	lw	a5,16(a5)
    800065fc:	0007871b          	sext.w	a4,a5
    80006600:	fd843783          	ld	a5,-40(s0)
    80006604:	47dc                	lw	a5,12(a5)
    80006606:	02f70263          	beq	a4,a5,8000662a <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    8000660a:	fec42783          	lw	a5,-20(s0)
    8000660e:	2785                	addiw	a5,a5,1
    80006610:	fef42623          	sw	a5,-20(s0)
    80006614:	0002d797          	auipc	a5,0x2d
    80006618:	57478793          	addi	a5,a5,1396 # 80033b88 <log>
    8000661c:	57d8                	lw	a4,44(a5)
    8000661e:	fec42783          	lw	a5,-20(s0)
    80006622:	2781                	sext.w	a5,a5
    80006624:	fce7c2e3          	blt	a5,a4,800065e8 <log_write+0x7e>
    80006628:	a011                	j	8000662c <log_write+0xc2>
      break;
    8000662a:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    8000662c:	fd843783          	ld	a5,-40(s0)
    80006630:	47dc                	lw	a5,12(a5)
    80006632:	0007871b          	sext.w	a4,a5
    80006636:	0002d697          	auipc	a3,0x2d
    8000663a:	55268693          	addi	a3,a3,1362 # 80033b88 <log>
    8000663e:	fec42783          	lw	a5,-20(s0)
    80006642:	07a1                	addi	a5,a5,8
    80006644:	078a                	slli	a5,a5,0x2
    80006646:	97b6                	add	a5,a5,a3
    80006648:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    8000664a:	0002d797          	auipc	a5,0x2d
    8000664e:	53e78793          	addi	a5,a5,1342 # 80033b88 <log>
    80006652:	57d8                	lw	a4,44(a5)
    80006654:	fec42783          	lw	a5,-20(s0)
    80006658:	2781                	sext.w	a5,a5
    8000665a:	02e79563          	bne	a5,a4,80006684 <log_write+0x11a>
    bpin(b);
    8000665e:	fd843503          	ld	a0,-40(s0)
    80006662:	ffffe097          	auipc	ra,0xffffe
    80006666:	344080e7          	jalr	836(ra) # 800049a6 <bpin>
    log.lh.n++;
    8000666a:	0002d797          	auipc	a5,0x2d
    8000666e:	51e78793          	addi	a5,a5,1310 # 80033b88 <log>
    80006672:	57dc                	lw	a5,44(a5)
    80006674:	2785                	addiw	a5,a5,1
    80006676:	0007871b          	sext.w	a4,a5
    8000667a:	0002d797          	auipc	a5,0x2d
    8000667e:	50e78793          	addi	a5,a5,1294 # 80033b88 <log>
    80006682:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006684:	0002d517          	auipc	a0,0x2d
    80006688:	50450513          	addi	a0,a0,1284 # 80033b88 <log>
    8000668c:	ffffb097          	auipc	ra,0xffffb
    80006690:	d02080e7          	jalr	-766(ra) # 8000138e <release>
}
    80006694:	0001                	nop
    80006696:	70a2                	ld	ra,40(sp)
    80006698:	7402                	ld	s0,32(sp)
    8000669a:	6145                	addi	sp,sp,48
    8000669c:	8082                	ret

000000008000669e <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000669e:	1101                	addi	sp,sp,-32
    800066a0:	ec06                	sd	ra,24(sp)
    800066a2:	e822                	sd	s0,16(sp)
    800066a4:	1000                	addi	s0,sp,32
    800066a6:	fea43423          	sd	a0,-24(s0)
    800066aa:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    800066ae:	fe843783          	ld	a5,-24(s0)
    800066b2:	07a1                	addi	a5,a5,8
    800066b4:	00005597          	auipc	a1,0x5
    800066b8:	ef458593          	addi	a1,a1,-268 # 8000b5a8 <etext+0x5a8>
    800066bc:	853e                	mv	a0,a5
    800066be:	ffffb097          	auipc	ra,0xffffb
    800066c2:	c3c080e7          	jalr	-964(ra) # 800012fa <initlock>
  lk->name = name;
    800066c6:	fe843783          	ld	a5,-24(s0)
    800066ca:	fe043703          	ld	a4,-32(s0)
    800066ce:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    800066d0:	fe843783          	ld	a5,-24(s0)
    800066d4:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800066d8:	fe843783          	ld	a5,-24(s0)
    800066dc:	0207a423          	sw	zero,40(a5)
}
    800066e0:	0001                	nop
    800066e2:	60e2                	ld	ra,24(sp)
    800066e4:	6442                	ld	s0,16(sp)
    800066e6:	6105                	addi	sp,sp,32
    800066e8:	8082                	ret

00000000800066ea <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    800066ea:	1101                	addi	sp,sp,-32
    800066ec:	ec06                	sd	ra,24(sp)
    800066ee:	e822                	sd	s0,16(sp)
    800066f0:	1000                	addi	s0,sp,32
    800066f2:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800066f6:	fe843783          	ld	a5,-24(s0)
    800066fa:	07a1                	addi	a5,a5,8
    800066fc:	853e                	mv	a0,a5
    800066fe:	ffffb097          	auipc	ra,0xffffb
    80006702:	c2c080e7          	jalr	-980(ra) # 8000132a <acquire>
  while (lk->locked) {
    80006706:	a819                	j	8000671c <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006708:	fe843783          	ld	a5,-24(s0)
    8000670c:	07a1                	addi	a5,a5,8
    8000670e:	85be                	mv	a1,a5
    80006710:	fe843503          	ld	a0,-24(s0)
    80006714:	ffffd097          	auipc	ra,0xffffd
    80006718:	e6a080e7          	jalr	-406(ra) # 8000357e <sleep>
  while (lk->locked) {
    8000671c:	fe843783          	ld	a5,-24(s0)
    80006720:	439c                	lw	a5,0(a5)
    80006722:	f3fd                	bnez	a5,80006708 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006724:	fe843783          	ld	a5,-24(s0)
    80006728:	4705                	li	a4,1
    8000672a:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    8000672c:	ffffc097          	auipc	ra,0xffffc
    80006730:	290080e7          	jalr	656(ra) # 800029bc <myproc>
    80006734:	87aa                	mv	a5,a0
    80006736:	5b98                	lw	a4,48(a5)
    80006738:	fe843783          	ld	a5,-24(s0)
    8000673c:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    8000673e:	fe843783          	ld	a5,-24(s0)
    80006742:	07a1                	addi	a5,a5,8
    80006744:	853e                	mv	a0,a5
    80006746:	ffffb097          	auipc	ra,0xffffb
    8000674a:	c48080e7          	jalr	-952(ra) # 8000138e <release>
}
    8000674e:	0001                	nop
    80006750:	60e2                	ld	ra,24(sp)
    80006752:	6442                	ld	s0,16(sp)
    80006754:	6105                	addi	sp,sp,32
    80006756:	8082                	ret

0000000080006758 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006758:	1101                	addi	sp,sp,-32
    8000675a:	ec06                	sd	ra,24(sp)
    8000675c:	e822                	sd	s0,16(sp)
    8000675e:	1000                	addi	s0,sp,32
    80006760:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006764:	fe843783          	ld	a5,-24(s0)
    80006768:	07a1                	addi	a5,a5,8
    8000676a:	853e                	mv	a0,a5
    8000676c:	ffffb097          	auipc	ra,0xffffb
    80006770:	bbe080e7          	jalr	-1090(ra) # 8000132a <acquire>
  lk->locked = 0;
    80006774:	fe843783          	ld	a5,-24(s0)
    80006778:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000677c:	fe843783          	ld	a5,-24(s0)
    80006780:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006784:	fe843503          	ld	a0,-24(s0)
    80006788:	ffffd097          	auipc	ra,0xffffd
    8000678c:	e72080e7          	jalr	-398(ra) # 800035fa <wakeup>
  release(&lk->lk);
    80006790:	fe843783          	ld	a5,-24(s0)
    80006794:	07a1                	addi	a5,a5,8
    80006796:	853e                	mv	a0,a5
    80006798:	ffffb097          	auipc	ra,0xffffb
    8000679c:	bf6080e7          	jalr	-1034(ra) # 8000138e <release>
}
    800067a0:	0001                	nop
    800067a2:	60e2                	ld	ra,24(sp)
    800067a4:	6442                	ld	s0,16(sp)
    800067a6:	6105                	addi	sp,sp,32
    800067a8:	8082                	ret

00000000800067aa <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    800067aa:	7139                	addi	sp,sp,-64
    800067ac:	fc06                	sd	ra,56(sp)
    800067ae:	f822                	sd	s0,48(sp)
    800067b0:	f426                	sd	s1,40(sp)
    800067b2:	0080                	addi	s0,sp,64
    800067b4:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    800067b8:	fc843783          	ld	a5,-56(s0)
    800067bc:	07a1                	addi	a5,a5,8
    800067be:	853e                	mv	a0,a5
    800067c0:	ffffb097          	auipc	ra,0xffffb
    800067c4:	b6a080e7          	jalr	-1174(ra) # 8000132a <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800067c8:	fc843783          	ld	a5,-56(s0)
    800067cc:	439c                	lw	a5,0(a5)
    800067ce:	cf99                	beqz	a5,800067ec <holdingsleep+0x42>
    800067d0:	fc843783          	ld	a5,-56(s0)
    800067d4:	5784                	lw	s1,40(a5)
    800067d6:	ffffc097          	auipc	ra,0xffffc
    800067da:	1e6080e7          	jalr	486(ra) # 800029bc <myproc>
    800067de:	87aa                	mv	a5,a0
    800067e0:	5b9c                	lw	a5,48(a5)
    800067e2:	8726                	mv	a4,s1
    800067e4:	00f71463          	bne	a4,a5,800067ec <holdingsleep+0x42>
    800067e8:	4785                	li	a5,1
    800067ea:	a011                	j	800067ee <holdingsleep+0x44>
    800067ec:	4781                	li	a5,0
    800067ee:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    800067f2:	fc843783          	ld	a5,-56(s0)
    800067f6:	07a1                	addi	a5,a5,8
    800067f8:	853e                	mv	a0,a5
    800067fa:	ffffb097          	auipc	ra,0xffffb
    800067fe:	b94080e7          	jalr	-1132(ra) # 8000138e <release>
  return r;
    80006802:	fdc42783          	lw	a5,-36(s0)
}
    80006806:	853e                	mv	a0,a5
    80006808:	70e2                	ld	ra,56(sp)
    8000680a:	7442                	ld	s0,48(sp)
    8000680c:	74a2                	ld	s1,40(sp)
    8000680e:	6121                	addi	sp,sp,64
    80006810:	8082                	ret

0000000080006812 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006812:	1141                	addi	sp,sp,-16
    80006814:	e406                	sd	ra,8(sp)
    80006816:	e022                	sd	s0,0(sp)
    80006818:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    8000681a:	00005597          	auipc	a1,0x5
    8000681e:	d9e58593          	addi	a1,a1,-610 # 8000b5b8 <etext+0x5b8>
    80006822:	0002d517          	auipc	a0,0x2d
    80006826:	4ae50513          	addi	a0,a0,1198 # 80033cd0 <ftable>
    8000682a:	ffffb097          	auipc	ra,0xffffb
    8000682e:	ad0080e7          	jalr	-1328(ra) # 800012fa <initlock>
}
    80006832:	0001                	nop
    80006834:	60a2                	ld	ra,8(sp)
    80006836:	6402                	ld	s0,0(sp)
    80006838:	0141                	addi	sp,sp,16
    8000683a:	8082                	ret

000000008000683c <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    8000683c:	1101                	addi	sp,sp,-32
    8000683e:	ec06                	sd	ra,24(sp)
    80006840:	e822                	sd	s0,16(sp)
    80006842:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006844:	0002d517          	auipc	a0,0x2d
    80006848:	48c50513          	addi	a0,a0,1164 # 80033cd0 <ftable>
    8000684c:	ffffb097          	auipc	ra,0xffffb
    80006850:	ade080e7          	jalr	-1314(ra) # 8000132a <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006854:	0002d797          	auipc	a5,0x2d
    80006858:	49478793          	addi	a5,a5,1172 # 80033ce8 <ftable+0x18>
    8000685c:	fef43423          	sd	a5,-24(s0)
    80006860:	a815                	j	80006894 <filealloc+0x58>
    if(f->ref == 0){
    80006862:	fe843783          	ld	a5,-24(s0)
    80006866:	43dc                	lw	a5,4(a5)
    80006868:	e385                	bnez	a5,80006888 <filealloc+0x4c>
      f->ref = 1;
    8000686a:	fe843783          	ld	a5,-24(s0)
    8000686e:	4705                	li	a4,1
    80006870:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006872:	0002d517          	auipc	a0,0x2d
    80006876:	45e50513          	addi	a0,a0,1118 # 80033cd0 <ftable>
    8000687a:	ffffb097          	auipc	ra,0xffffb
    8000687e:	b14080e7          	jalr	-1260(ra) # 8000138e <release>
      return f;
    80006882:	fe843783          	ld	a5,-24(s0)
    80006886:	a805                	j	800068b6 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006888:	fe843783          	ld	a5,-24(s0)
    8000688c:	02878793          	addi	a5,a5,40
    80006890:	fef43423          	sd	a5,-24(s0)
    80006894:	0002e797          	auipc	a5,0x2e
    80006898:	3f478793          	addi	a5,a5,1012 # 80034c88 <disk>
    8000689c:	fe843703          	ld	a4,-24(s0)
    800068a0:	fcf761e3          	bltu	a4,a5,80006862 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    800068a4:	0002d517          	auipc	a0,0x2d
    800068a8:	42c50513          	addi	a0,a0,1068 # 80033cd0 <ftable>
    800068ac:	ffffb097          	auipc	ra,0xffffb
    800068b0:	ae2080e7          	jalr	-1310(ra) # 8000138e <release>
  return 0;
    800068b4:	4781                	li	a5,0
}
    800068b6:	853e                	mv	a0,a5
    800068b8:	60e2                	ld	ra,24(sp)
    800068ba:	6442                	ld	s0,16(sp)
    800068bc:	6105                	addi	sp,sp,32
    800068be:	8082                	ret

00000000800068c0 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    800068c0:	1101                	addi	sp,sp,-32
    800068c2:	ec06                	sd	ra,24(sp)
    800068c4:	e822                	sd	s0,16(sp)
    800068c6:	1000                	addi	s0,sp,32
    800068c8:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    800068cc:	0002d517          	auipc	a0,0x2d
    800068d0:	40450513          	addi	a0,a0,1028 # 80033cd0 <ftable>
    800068d4:	ffffb097          	auipc	ra,0xffffb
    800068d8:	a56080e7          	jalr	-1450(ra) # 8000132a <acquire>
  if(f->ref < 1)
    800068dc:	fe843783          	ld	a5,-24(s0)
    800068e0:	43dc                	lw	a5,4(a5)
    800068e2:	00f04a63          	bgtz	a5,800068f6 <filedup+0x36>
    panic("filedup");
    800068e6:	00005517          	auipc	a0,0x5
    800068ea:	cda50513          	addi	a0,a0,-806 # 8000b5c0 <etext+0x5c0>
    800068ee:	ffffa097          	auipc	ra,0xffffa
    800068f2:	39e080e7          	jalr	926(ra) # 80000c8c <panic>
  f->ref++;
    800068f6:	fe843783          	ld	a5,-24(s0)
    800068fa:	43dc                	lw	a5,4(a5)
    800068fc:	2785                	addiw	a5,a5,1
    800068fe:	0007871b          	sext.w	a4,a5
    80006902:	fe843783          	ld	a5,-24(s0)
    80006906:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006908:	0002d517          	auipc	a0,0x2d
    8000690c:	3c850513          	addi	a0,a0,968 # 80033cd0 <ftable>
    80006910:	ffffb097          	auipc	ra,0xffffb
    80006914:	a7e080e7          	jalr	-1410(ra) # 8000138e <release>
  return f;
    80006918:	fe843783          	ld	a5,-24(s0)
}
    8000691c:	853e                	mv	a0,a5
    8000691e:	60e2                	ld	ra,24(sp)
    80006920:	6442                	ld	s0,16(sp)
    80006922:	6105                	addi	sp,sp,32
    80006924:	8082                	ret

0000000080006926 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006926:	715d                	addi	sp,sp,-80
    80006928:	e486                	sd	ra,72(sp)
    8000692a:	e0a2                	sd	s0,64(sp)
    8000692c:	0880                	addi	s0,sp,80
    8000692e:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006932:	0002d517          	auipc	a0,0x2d
    80006936:	39e50513          	addi	a0,a0,926 # 80033cd0 <ftable>
    8000693a:	ffffb097          	auipc	ra,0xffffb
    8000693e:	9f0080e7          	jalr	-1552(ra) # 8000132a <acquire>
  if(f->ref < 1)
    80006942:	fb843783          	ld	a5,-72(s0)
    80006946:	43dc                	lw	a5,4(a5)
    80006948:	00f04a63          	bgtz	a5,8000695c <fileclose+0x36>
    panic("fileclose");
    8000694c:	00005517          	auipc	a0,0x5
    80006950:	c7c50513          	addi	a0,a0,-900 # 8000b5c8 <etext+0x5c8>
    80006954:	ffffa097          	auipc	ra,0xffffa
    80006958:	338080e7          	jalr	824(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    8000695c:	fb843783          	ld	a5,-72(s0)
    80006960:	43dc                	lw	a5,4(a5)
    80006962:	37fd                	addiw	a5,a5,-1
    80006964:	0007871b          	sext.w	a4,a5
    80006968:	fb843783          	ld	a5,-72(s0)
    8000696c:	c3d8                	sw	a4,4(a5)
    8000696e:	fb843783          	ld	a5,-72(s0)
    80006972:	43dc                	lw	a5,4(a5)
    80006974:	00f05b63          	blez	a5,8000698a <fileclose+0x64>
    release(&ftable.lock);
    80006978:	0002d517          	auipc	a0,0x2d
    8000697c:	35850513          	addi	a0,a0,856 # 80033cd0 <ftable>
    80006980:	ffffb097          	auipc	ra,0xffffb
    80006984:	a0e080e7          	jalr	-1522(ra) # 8000138e <release>
    80006988:	a879                	j	80006a26 <fileclose+0x100>
    return;
  }
  ff = *f;
    8000698a:	fb843783          	ld	a5,-72(s0)
    8000698e:	638c                	ld	a1,0(a5)
    80006990:	6790                	ld	a2,8(a5)
    80006992:	6b94                	ld	a3,16(a5)
    80006994:	6f98                	ld	a4,24(a5)
    80006996:	739c                	ld	a5,32(a5)
    80006998:	fcb43423          	sd	a1,-56(s0)
    8000699c:	fcc43823          	sd	a2,-48(s0)
    800069a0:	fcd43c23          	sd	a3,-40(s0)
    800069a4:	fee43023          	sd	a4,-32(s0)
    800069a8:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    800069ac:	fb843783          	ld	a5,-72(s0)
    800069b0:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    800069b4:	fb843783          	ld	a5,-72(s0)
    800069b8:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    800069bc:	0002d517          	auipc	a0,0x2d
    800069c0:	31450513          	addi	a0,a0,788 # 80033cd0 <ftable>
    800069c4:	ffffb097          	auipc	ra,0xffffb
    800069c8:	9ca080e7          	jalr	-1590(ra) # 8000138e <release>

  if(ff.type == FD_PIPE){
    800069cc:	fc842783          	lw	a5,-56(s0)
    800069d0:	873e                	mv	a4,a5
    800069d2:	4785                	li	a5,1
    800069d4:	00f71e63          	bne	a4,a5,800069f0 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    800069d8:	fd843783          	ld	a5,-40(s0)
    800069dc:	fd144703          	lbu	a4,-47(s0)
    800069e0:	2701                	sext.w	a4,a4
    800069e2:	85ba                	mv	a1,a4
    800069e4:	853e                	mv	a0,a5
    800069e6:	00000097          	auipc	ra,0x0
    800069ea:	5aa080e7          	jalr	1450(ra) # 80006f90 <pipeclose>
    800069ee:	a825                	j	80006a26 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    800069f0:	fc842783          	lw	a5,-56(s0)
    800069f4:	873e                	mv	a4,a5
    800069f6:	4789                	li	a5,2
    800069f8:	00f70863          	beq	a4,a5,80006a08 <fileclose+0xe2>
    800069fc:	fc842783          	lw	a5,-56(s0)
    80006a00:	873e                	mv	a4,a5
    80006a02:	478d                	li	a5,3
    80006a04:	02f71163          	bne	a4,a5,80006a26 <fileclose+0x100>
    begin_op();
    80006a08:	00000097          	auipc	ra,0x0
    80006a0c:	884080e7          	jalr	-1916(ra) # 8000628c <begin_op>
    iput(ff.ip);
    80006a10:	fe043783          	ld	a5,-32(s0)
    80006a14:	853e                	mv	a0,a5
    80006a16:	fffff097          	auipc	ra,0xfffff
    80006a1a:	97a080e7          	jalr	-1670(ra) # 80005390 <iput>
    end_op();
    80006a1e:	00000097          	auipc	ra,0x0
    80006a22:	930080e7          	jalr	-1744(ra) # 8000634e <end_op>
  }
}
    80006a26:	60a6                	ld	ra,72(sp)
    80006a28:	6406                	ld	s0,64(sp)
    80006a2a:	6161                	addi	sp,sp,80
    80006a2c:	8082                	ret

0000000080006a2e <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006a2e:	7139                	addi	sp,sp,-64
    80006a30:	fc06                	sd	ra,56(sp)
    80006a32:	f822                	sd	s0,48(sp)
    80006a34:	0080                	addi	s0,sp,64
    80006a36:	fca43423          	sd	a0,-56(s0)
    80006a3a:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006a3e:	ffffc097          	auipc	ra,0xffffc
    80006a42:	f7e080e7          	jalr	-130(ra) # 800029bc <myproc>
    80006a46:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006a4a:	fc843783          	ld	a5,-56(s0)
    80006a4e:	439c                	lw	a5,0(a5)
    80006a50:	873e                	mv	a4,a5
    80006a52:	4789                	li	a5,2
    80006a54:	00f70963          	beq	a4,a5,80006a66 <filestat+0x38>
    80006a58:	fc843783          	ld	a5,-56(s0)
    80006a5c:	439c                	lw	a5,0(a5)
    80006a5e:	873e                	mv	a4,a5
    80006a60:	478d                	li	a5,3
    80006a62:	06f71263          	bne	a4,a5,80006ac6 <filestat+0x98>
    ilock(f->ip);
    80006a66:	fc843783          	ld	a5,-56(s0)
    80006a6a:	6f9c                	ld	a5,24(a5)
    80006a6c:	853e                	mv	a0,a5
    80006a6e:	ffffe097          	auipc	ra,0xffffe
    80006a72:	794080e7          	jalr	1940(ra) # 80005202 <ilock>
    stati(f->ip, &st);
    80006a76:	fc843783          	ld	a5,-56(s0)
    80006a7a:	6f9c                	ld	a5,24(a5)
    80006a7c:	fd040713          	addi	a4,s0,-48
    80006a80:	85ba                	mv	a1,a4
    80006a82:	853e                	mv	a0,a5
    80006a84:	fffff097          	auipc	ra,0xfffff
    80006a88:	cd0080e7          	jalr	-816(ra) # 80005754 <stati>
    iunlock(f->ip);
    80006a8c:	fc843783          	ld	a5,-56(s0)
    80006a90:	6f9c                	ld	a5,24(a5)
    80006a92:	853e                	mv	a0,a5
    80006a94:	fffff097          	auipc	ra,0xfffff
    80006a98:	8a2080e7          	jalr	-1886(ra) # 80005336 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006a9c:	fe843783          	ld	a5,-24(s0)
    80006aa0:	6bbc                	ld	a5,80(a5)
    80006aa2:	fd040713          	addi	a4,s0,-48
    80006aa6:	46e1                	li	a3,24
    80006aa8:	863a                	mv	a2,a4
    80006aaa:	fc043583          	ld	a1,-64(s0)
    80006aae:	853e                	mv	a0,a5
    80006ab0:	ffffc097          	auipc	ra,0xffffc
    80006ab4:	9d6080e7          	jalr	-1578(ra) # 80002486 <copyout>
    80006ab8:	87aa                	mv	a5,a0
    80006aba:	0007d463          	bgez	a5,80006ac2 <filestat+0x94>
      return -1;
    80006abe:	57fd                	li	a5,-1
    80006ac0:	a021                	j	80006ac8 <filestat+0x9a>
    return 0;
    80006ac2:	4781                	li	a5,0
    80006ac4:	a011                	j	80006ac8 <filestat+0x9a>
  }
  return -1;
    80006ac6:	57fd                	li	a5,-1
}
    80006ac8:	853e                	mv	a0,a5
    80006aca:	70e2                	ld	ra,56(sp)
    80006acc:	7442                	ld	s0,48(sp)
    80006ace:	6121                	addi	sp,sp,64
    80006ad0:	8082                	ret

0000000080006ad2 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006ad2:	7139                	addi	sp,sp,-64
    80006ad4:	fc06                	sd	ra,56(sp)
    80006ad6:	f822                	sd	s0,48(sp)
    80006ad8:	0080                	addi	s0,sp,64
    80006ada:	fca43c23          	sd	a0,-40(s0)
    80006ade:	fcb43823          	sd	a1,-48(s0)
    80006ae2:	87b2                	mv	a5,a2
    80006ae4:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006ae8:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006aec:	fd843783          	ld	a5,-40(s0)
    80006af0:	0087c783          	lbu	a5,8(a5)
    80006af4:	e399                	bnez	a5,80006afa <fileread+0x28>
    return -1;
    80006af6:	57fd                	li	a5,-1
    80006af8:	aa1d                	j	80006c2e <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006afa:	fd843783          	ld	a5,-40(s0)
    80006afe:	439c                	lw	a5,0(a5)
    80006b00:	873e                	mv	a4,a5
    80006b02:	4785                	li	a5,1
    80006b04:	02f71363          	bne	a4,a5,80006b2a <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006b08:	fd843783          	ld	a5,-40(s0)
    80006b0c:	6b9c                	ld	a5,16(a5)
    80006b0e:	fcc42703          	lw	a4,-52(s0)
    80006b12:	863a                	mv	a2,a4
    80006b14:	fd043583          	ld	a1,-48(s0)
    80006b18:	853e                	mv	a0,a5
    80006b1a:	00000097          	auipc	ra,0x0
    80006b1e:	670080e7          	jalr	1648(ra) # 8000718a <piperead>
    80006b22:	87aa                	mv	a5,a0
    80006b24:	fef42623          	sw	a5,-20(s0)
    80006b28:	a209                	j	80006c2a <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006b2a:	fd843783          	ld	a5,-40(s0)
    80006b2e:	439c                	lw	a5,0(a5)
    80006b30:	873e                	mv	a4,a5
    80006b32:	478d                	li	a5,3
    80006b34:	06f71863          	bne	a4,a5,80006ba4 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006b38:	fd843783          	ld	a5,-40(s0)
    80006b3c:	02479783          	lh	a5,36(a5)
    80006b40:	2781                	sext.w	a5,a5
    80006b42:	0207c863          	bltz	a5,80006b72 <fileread+0xa0>
    80006b46:	fd843783          	ld	a5,-40(s0)
    80006b4a:	02479783          	lh	a5,36(a5)
    80006b4e:	0007871b          	sext.w	a4,a5
    80006b52:	47a5                	li	a5,9
    80006b54:	00e7cf63          	blt	a5,a4,80006b72 <fileread+0xa0>
    80006b58:	fd843783          	ld	a5,-40(s0)
    80006b5c:	02479783          	lh	a5,36(a5)
    80006b60:	2781                	sext.w	a5,a5
    80006b62:	0002d717          	auipc	a4,0x2d
    80006b66:	0ce70713          	addi	a4,a4,206 # 80033c30 <devsw>
    80006b6a:	0792                	slli	a5,a5,0x4
    80006b6c:	97ba                	add	a5,a5,a4
    80006b6e:	639c                	ld	a5,0(a5)
    80006b70:	e399                	bnez	a5,80006b76 <fileread+0xa4>
      return -1;
    80006b72:	57fd                	li	a5,-1
    80006b74:	a86d                	j	80006c2e <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006b76:	fd843783          	ld	a5,-40(s0)
    80006b7a:	02479783          	lh	a5,36(a5)
    80006b7e:	2781                	sext.w	a5,a5
    80006b80:	0002d717          	auipc	a4,0x2d
    80006b84:	0b070713          	addi	a4,a4,176 # 80033c30 <devsw>
    80006b88:	0792                	slli	a5,a5,0x4
    80006b8a:	97ba                	add	a5,a5,a4
    80006b8c:	6398                	ld	a4,0(a5)
    80006b8e:	fcc42783          	lw	a5,-52(s0)
    80006b92:	863e                	mv	a2,a5
    80006b94:	fd043583          	ld	a1,-48(s0)
    80006b98:	4505                	li	a0,1
    80006b9a:	9702                	jalr	a4
    80006b9c:	87aa                	mv	a5,a0
    80006b9e:	fef42623          	sw	a5,-20(s0)
    80006ba2:	a061                	j	80006c2a <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006ba4:	fd843783          	ld	a5,-40(s0)
    80006ba8:	439c                	lw	a5,0(a5)
    80006baa:	873e                	mv	a4,a5
    80006bac:	4789                	li	a5,2
    80006bae:	06f71663          	bne	a4,a5,80006c1a <fileread+0x148>
    ilock(f->ip);
    80006bb2:	fd843783          	ld	a5,-40(s0)
    80006bb6:	6f9c                	ld	a5,24(a5)
    80006bb8:	853e                	mv	a0,a5
    80006bba:	ffffe097          	auipc	ra,0xffffe
    80006bbe:	648080e7          	jalr	1608(ra) # 80005202 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006bc2:	fd843783          	ld	a5,-40(s0)
    80006bc6:	6f88                	ld	a0,24(a5)
    80006bc8:	fd843783          	ld	a5,-40(s0)
    80006bcc:	539c                	lw	a5,32(a5)
    80006bce:	fcc42703          	lw	a4,-52(s0)
    80006bd2:	86be                	mv	a3,a5
    80006bd4:	fd043603          	ld	a2,-48(s0)
    80006bd8:	4585                	li	a1,1
    80006bda:	fffff097          	auipc	ra,0xfffff
    80006bde:	bde080e7          	jalr	-1058(ra) # 800057b8 <readi>
    80006be2:	87aa                	mv	a5,a0
    80006be4:	fef42623          	sw	a5,-20(s0)
    80006be8:	fec42783          	lw	a5,-20(s0)
    80006bec:	2781                	sext.w	a5,a5
    80006bee:	00f05d63          	blez	a5,80006c08 <fileread+0x136>
      f->off += r;
    80006bf2:	fd843783          	ld	a5,-40(s0)
    80006bf6:	5398                	lw	a4,32(a5)
    80006bf8:	fec42783          	lw	a5,-20(s0)
    80006bfc:	9fb9                	addw	a5,a5,a4
    80006bfe:	0007871b          	sext.w	a4,a5
    80006c02:	fd843783          	ld	a5,-40(s0)
    80006c06:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006c08:	fd843783          	ld	a5,-40(s0)
    80006c0c:	6f9c                	ld	a5,24(a5)
    80006c0e:	853e                	mv	a0,a5
    80006c10:	ffffe097          	auipc	ra,0xffffe
    80006c14:	726080e7          	jalr	1830(ra) # 80005336 <iunlock>
    80006c18:	a809                	j	80006c2a <fileread+0x158>
  } else {
    panic("fileread");
    80006c1a:	00005517          	auipc	a0,0x5
    80006c1e:	9be50513          	addi	a0,a0,-1602 # 8000b5d8 <etext+0x5d8>
    80006c22:	ffffa097          	auipc	ra,0xffffa
    80006c26:	06a080e7          	jalr	106(ra) # 80000c8c <panic>
  }

  return r;
    80006c2a:	fec42783          	lw	a5,-20(s0)
}
    80006c2e:	853e                	mv	a0,a5
    80006c30:	70e2                	ld	ra,56(sp)
    80006c32:	7442                	ld	s0,48(sp)
    80006c34:	6121                	addi	sp,sp,64
    80006c36:	8082                	ret

0000000080006c38 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006c38:	715d                	addi	sp,sp,-80
    80006c3a:	e486                	sd	ra,72(sp)
    80006c3c:	e0a2                	sd	s0,64(sp)
    80006c3e:	0880                	addi	s0,sp,80
    80006c40:	fca43423          	sd	a0,-56(s0)
    80006c44:	fcb43023          	sd	a1,-64(s0)
    80006c48:	87b2                	mv	a5,a2
    80006c4a:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006c4e:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006c52:	fc843783          	ld	a5,-56(s0)
    80006c56:	0097c783          	lbu	a5,9(a5)
    80006c5a:	e399                	bnez	a5,80006c60 <filewrite+0x28>
    return -1;
    80006c5c:	57fd                	li	a5,-1
    80006c5e:	aad1                	j	80006e32 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006c60:	fc843783          	ld	a5,-56(s0)
    80006c64:	439c                	lw	a5,0(a5)
    80006c66:	873e                	mv	a4,a5
    80006c68:	4785                	li	a5,1
    80006c6a:	02f71363          	bne	a4,a5,80006c90 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006c6e:	fc843783          	ld	a5,-56(s0)
    80006c72:	6b9c                	ld	a5,16(a5)
    80006c74:	fbc42703          	lw	a4,-68(s0)
    80006c78:	863a                	mv	a2,a4
    80006c7a:	fc043583          	ld	a1,-64(s0)
    80006c7e:	853e                	mv	a0,a5
    80006c80:	00000097          	auipc	ra,0x0
    80006c84:	3b8080e7          	jalr	952(ra) # 80007038 <pipewrite>
    80006c88:	87aa                	mv	a5,a0
    80006c8a:	fef42623          	sw	a5,-20(s0)
    80006c8e:	a245                	j	80006e2e <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006c90:	fc843783          	ld	a5,-56(s0)
    80006c94:	439c                	lw	a5,0(a5)
    80006c96:	873e                	mv	a4,a5
    80006c98:	478d                	li	a5,3
    80006c9a:	06f71863          	bne	a4,a5,80006d0a <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006c9e:	fc843783          	ld	a5,-56(s0)
    80006ca2:	02479783          	lh	a5,36(a5)
    80006ca6:	2781                	sext.w	a5,a5
    80006ca8:	0207c863          	bltz	a5,80006cd8 <filewrite+0xa0>
    80006cac:	fc843783          	ld	a5,-56(s0)
    80006cb0:	02479783          	lh	a5,36(a5)
    80006cb4:	0007871b          	sext.w	a4,a5
    80006cb8:	47a5                	li	a5,9
    80006cba:	00e7cf63          	blt	a5,a4,80006cd8 <filewrite+0xa0>
    80006cbe:	fc843783          	ld	a5,-56(s0)
    80006cc2:	02479783          	lh	a5,36(a5)
    80006cc6:	2781                	sext.w	a5,a5
    80006cc8:	0002d717          	auipc	a4,0x2d
    80006ccc:	f6870713          	addi	a4,a4,-152 # 80033c30 <devsw>
    80006cd0:	0792                	slli	a5,a5,0x4
    80006cd2:	97ba                	add	a5,a5,a4
    80006cd4:	679c                	ld	a5,8(a5)
    80006cd6:	e399                	bnez	a5,80006cdc <filewrite+0xa4>
      return -1;
    80006cd8:	57fd                	li	a5,-1
    80006cda:	aaa1                	j	80006e32 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006cdc:	fc843783          	ld	a5,-56(s0)
    80006ce0:	02479783          	lh	a5,36(a5)
    80006ce4:	2781                	sext.w	a5,a5
    80006ce6:	0002d717          	auipc	a4,0x2d
    80006cea:	f4a70713          	addi	a4,a4,-182 # 80033c30 <devsw>
    80006cee:	0792                	slli	a5,a5,0x4
    80006cf0:	97ba                	add	a5,a5,a4
    80006cf2:	6798                	ld	a4,8(a5)
    80006cf4:	fbc42783          	lw	a5,-68(s0)
    80006cf8:	863e                	mv	a2,a5
    80006cfa:	fc043583          	ld	a1,-64(s0)
    80006cfe:	4505                	li	a0,1
    80006d00:	9702                	jalr	a4
    80006d02:	87aa                	mv	a5,a0
    80006d04:	fef42623          	sw	a5,-20(s0)
    80006d08:	a21d                	j	80006e2e <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006d0a:	fc843783          	ld	a5,-56(s0)
    80006d0e:	439c                	lw	a5,0(a5)
    80006d10:	873e                	mv	a4,a5
    80006d12:	4789                	li	a5,2
    80006d14:	10f71563          	bne	a4,a5,80006e1e <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006d18:	6785                	lui	a5,0x1
    80006d1a:	c007879b          	addiw	a5,a5,-1024
    80006d1e:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006d22:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006d26:	a0d9                	j	80006dec <filewrite+0x1b4>
      int n1 = n - i;
    80006d28:	fbc42703          	lw	a4,-68(s0)
    80006d2c:	fe842783          	lw	a5,-24(s0)
    80006d30:	40f707bb          	subw	a5,a4,a5
    80006d34:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006d38:	fe442703          	lw	a4,-28(s0)
    80006d3c:	fe042783          	lw	a5,-32(s0)
    80006d40:	2701                	sext.w	a4,a4
    80006d42:	2781                	sext.w	a5,a5
    80006d44:	00e7d663          	bge	a5,a4,80006d50 <filewrite+0x118>
        n1 = max;
    80006d48:	fe042783          	lw	a5,-32(s0)
    80006d4c:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006d50:	fffff097          	auipc	ra,0xfffff
    80006d54:	53c080e7          	jalr	1340(ra) # 8000628c <begin_op>
      ilock(f->ip);
    80006d58:	fc843783          	ld	a5,-56(s0)
    80006d5c:	6f9c                	ld	a5,24(a5)
    80006d5e:	853e                	mv	a0,a5
    80006d60:	ffffe097          	auipc	ra,0xffffe
    80006d64:	4a2080e7          	jalr	1186(ra) # 80005202 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006d68:	fc843783          	ld	a5,-56(s0)
    80006d6c:	6f88                	ld	a0,24(a5)
    80006d6e:	fe842703          	lw	a4,-24(s0)
    80006d72:	fc043783          	ld	a5,-64(s0)
    80006d76:	00f70633          	add	a2,a4,a5
    80006d7a:	fc843783          	ld	a5,-56(s0)
    80006d7e:	539c                	lw	a5,32(a5)
    80006d80:	fe442703          	lw	a4,-28(s0)
    80006d84:	86be                	mv	a3,a5
    80006d86:	4585                	li	a1,1
    80006d88:	fffff097          	auipc	ra,0xfffff
    80006d8c:	bc8080e7          	jalr	-1080(ra) # 80005950 <writei>
    80006d90:	87aa                	mv	a5,a0
    80006d92:	fcf42e23          	sw	a5,-36(s0)
    80006d96:	fdc42783          	lw	a5,-36(s0)
    80006d9a:	2781                	sext.w	a5,a5
    80006d9c:	00f05d63          	blez	a5,80006db6 <filewrite+0x17e>
        f->off += r;
    80006da0:	fc843783          	ld	a5,-56(s0)
    80006da4:	5398                	lw	a4,32(a5)
    80006da6:	fdc42783          	lw	a5,-36(s0)
    80006daa:	9fb9                	addw	a5,a5,a4
    80006dac:	0007871b          	sext.w	a4,a5
    80006db0:	fc843783          	ld	a5,-56(s0)
    80006db4:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006db6:	fc843783          	ld	a5,-56(s0)
    80006dba:	6f9c                	ld	a5,24(a5)
    80006dbc:	853e                	mv	a0,a5
    80006dbe:	ffffe097          	auipc	ra,0xffffe
    80006dc2:	578080e7          	jalr	1400(ra) # 80005336 <iunlock>
      end_op();
    80006dc6:	fffff097          	auipc	ra,0xfffff
    80006dca:	588080e7          	jalr	1416(ra) # 8000634e <end_op>

      if(r != n1){
    80006dce:	fdc42703          	lw	a4,-36(s0)
    80006dd2:	fe442783          	lw	a5,-28(s0)
    80006dd6:	2701                	sext.w	a4,a4
    80006dd8:	2781                	sext.w	a5,a5
    80006dda:	02f71263          	bne	a4,a5,80006dfe <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006dde:	fe842703          	lw	a4,-24(s0)
    80006de2:	fdc42783          	lw	a5,-36(s0)
    80006de6:	9fb9                	addw	a5,a5,a4
    80006de8:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006dec:	fe842703          	lw	a4,-24(s0)
    80006df0:	fbc42783          	lw	a5,-68(s0)
    80006df4:	2701                	sext.w	a4,a4
    80006df6:	2781                	sext.w	a5,a5
    80006df8:	f2f748e3          	blt	a4,a5,80006d28 <filewrite+0xf0>
    80006dfc:	a011                	j	80006e00 <filewrite+0x1c8>
        break;
    80006dfe:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006e00:	fe842703          	lw	a4,-24(s0)
    80006e04:	fbc42783          	lw	a5,-68(s0)
    80006e08:	2701                	sext.w	a4,a4
    80006e0a:	2781                	sext.w	a5,a5
    80006e0c:	00f71563          	bne	a4,a5,80006e16 <filewrite+0x1de>
    80006e10:	fbc42783          	lw	a5,-68(s0)
    80006e14:	a011                	j	80006e18 <filewrite+0x1e0>
    80006e16:	57fd                	li	a5,-1
    80006e18:	fef42623          	sw	a5,-20(s0)
    80006e1c:	a809                	j	80006e2e <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006e1e:	00004517          	auipc	a0,0x4
    80006e22:	7ca50513          	addi	a0,a0,1994 # 8000b5e8 <etext+0x5e8>
    80006e26:	ffffa097          	auipc	ra,0xffffa
    80006e2a:	e66080e7          	jalr	-410(ra) # 80000c8c <panic>
  }

  return ret;
    80006e2e:	fec42783          	lw	a5,-20(s0)
}
    80006e32:	853e                	mv	a0,a5
    80006e34:	60a6                	ld	ra,72(sp)
    80006e36:	6406                	ld	s0,64(sp)
    80006e38:	6161                	addi	sp,sp,80
    80006e3a:	8082                	ret

0000000080006e3c <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006e3c:	7179                	addi	sp,sp,-48
    80006e3e:	f406                	sd	ra,40(sp)
    80006e40:	f022                	sd	s0,32(sp)
    80006e42:	1800                	addi	s0,sp,48
    80006e44:	fca43c23          	sd	a0,-40(s0)
    80006e48:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006e4c:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006e50:	fd043783          	ld	a5,-48(s0)
    80006e54:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006e58:	fd043783          	ld	a5,-48(s0)
    80006e5c:	6398                	ld	a4,0(a5)
    80006e5e:	fd843783          	ld	a5,-40(s0)
    80006e62:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006e64:	00000097          	auipc	ra,0x0
    80006e68:	9d8080e7          	jalr	-1576(ra) # 8000683c <filealloc>
    80006e6c:	872a                	mv	a4,a0
    80006e6e:	fd843783          	ld	a5,-40(s0)
    80006e72:	e398                	sd	a4,0(a5)
    80006e74:	fd843783          	ld	a5,-40(s0)
    80006e78:	639c                	ld	a5,0(a5)
    80006e7a:	c3e9                	beqz	a5,80006f3c <pipealloc+0x100>
    80006e7c:	00000097          	auipc	ra,0x0
    80006e80:	9c0080e7          	jalr	-1600(ra) # 8000683c <filealloc>
    80006e84:	872a                	mv	a4,a0
    80006e86:	fd043783          	ld	a5,-48(s0)
    80006e8a:	e398                	sd	a4,0(a5)
    80006e8c:	fd043783          	ld	a5,-48(s0)
    80006e90:	639c                	ld	a5,0(a5)
    80006e92:	c7cd                	beqz	a5,80006f3c <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006e94:	ffffa097          	auipc	ra,0xffffa
    80006e98:	342080e7          	jalr	834(ra) # 800011d6 <kalloc>
    80006e9c:	fea43423          	sd	a0,-24(s0)
    80006ea0:	fe843783          	ld	a5,-24(s0)
    80006ea4:	cfd1                	beqz	a5,80006f40 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006ea6:	fe843783          	ld	a5,-24(s0)
    80006eaa:	4705                	li	a4,1
    80006eac:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006eb0:	fe843783          	ld	a5,-24(s0)
    80006eb4:	4705                	li	a4,1
    80006eb6:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006eba:	fe843783          	ld	a5,-24(s0)
    80006ebe:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006ec2:	fe843783          	ld	a5,-24(s0)
    80006ec6:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006eca:	fe843783          	ld	a5,-24(s0)
    80006ece:	00004597          	auipc	a1,0x4
    80006ed2:	72a58593          	addi	a1,a1,1834 # 8000b5f8 <etext+0x5f8>
    80006ed6:	853e                	mv	a0,a5
    80006ed8:	ffffa097          	auipc	ra,0xffffa
    80006edc:	422080e7          	jalr	1058(ra) # 800012fa <initlock>
  (*f0)->type = FD_PIPE;
    80006ee0:	fd843783          	ld	a5,-40(s0)
    80006ee4:	639c                	ld	a5,0(a5)
    80006ee6:	4705                	li	a4,1
    80006ee8:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006eea:	fd843783          	ld	a5,-40(s0)
    80006eee:	639c                	ld	a5,0(a5)
    80006ef0:	4705                	li	a4,1
    80006ef2:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006ef6:	fd843783          	ld	a5,-40(s0)
    80006efa:	639c                	ld	a5,0(a5)
    80006efc:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006f00:	fd843783          	ld	a5,-40(s0)
    80006f04:	639c                	ld	a5,0(a5)
    80006f06:	fe843703          	ld	a4,-24(s0)
    80006f0a:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006f0c:	fd043783          	ld	a5,-48(s0)
    80006f10:	639c                	ld	a5,0(a5)
    80006f12:	4705                	li	a4,1
    80006f14:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006f16:	fd043783          	ld	a5,-48(s0)
    80006f1a:	639c                	ld	a5,0(a5)
    80006f1c:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006f20:	fd043783          	ld	a5,-48(s0)
    80006f24:	639c                	ld	a5,0(a5)
    80006f26:	4705                	li	a4,1
    80006f28:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006f2c:	fd043783          	ld	a5,-48(s0)
    80006f30:	639c                	ld	a5,0(a5)
    80006f32:	fe843703          	ld	a4,-24(s0)
    80006f36:	eb98                	sd	a4,16(a5)
  return 0;
    80006f38:	4781                	li	a5,0
    80006f3a:	a0b1                	j	80006f86 <pipealloc+0x14a>
    goto bad;
    80006f3c:	0001                	nop
    80006f3e:	a011                	j	80006f42 <pipealloc+0x106>
    goto bad;
    80006f40:	0001                	nop

 bad:
  if(pi)
    80006f42:	fe843783          	ld	a5,-24(s0)
    80006f46:	c799                	beqz	a5,80006f54 <pipealloc+0x118>
    kfree((char*)pi);
    80006f48:	fe843503          	ld	a0,-24(s0)
    80006f4c:	ffffa097          	auipc	ra,0xffffa
    80006f50:	1e4080e7          	jalr	484(ra) # 80001130 <kfree>
  if(*f0)
    80006f54:	fd843783          	ld	a5,-40(s0)
    80006f58:	639c                	ld	a5,0(a5)
    80006f5a:	cb89                	beqz	a5,80006f6c <pipealloc+0x130>
    fileclose(*f0);
    80006f5c:	fd843783          	ld	a5,-40(s0)
    80006f60:	639c                	ld	a5,0(a5)
    80006f62:	853e                	mv	a0,a5
    80006f64:	00000097          	auipc	ra,0x0
    80006f68:	9c2080e7          	jalr	-1598(ra) # 80006926 <fileclose>
  if(*f1)
    80006f6c:	fd043783          	ld	a5,-48(s0)
    80006f70:	639c                	ld	a5,0(a5)
    80006f72:	cb89                	beqz	a5,80006f84 <pipealloc+0x148>
    fileclose(*f1);
    80006f74:	fd043783          	ld	a5,-48(s0)
    80006f78:	639c                	ld	a5,0(a5)
    80006f7a:	853e                	mv	a0,a5
    80006f7c:	00000097          	auipc	ra,0x0
    80006f80:	9aa080e7          	jalr	-1622(ra) # 80006926 <fileclose>
  return -1;
    80006f84:	57fd                	li	a5,-1
}
    80006f86:	853e                	mv	a0,a5
    80006f88:	70a2                	ld	ra,40(sp)
    80006f8a:	7402                	ld	s0,32(sp)
    80006f8c:	6145                	addi	sp,sp,48
    80006f8e:	8082                	ret

0000000080006f90 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80006f90:	1101                	addi	sp,sp,-32
    80006f92:	ec06                	sd	ra,24(sp)
    80006f94:	e822                	sd	s0,16(sp)
    80006f96:	1000                	addi	s0,sp,32
    80006f98:	fea43423          	sd	a0,-24(s0)
    80006f9c:	87ae                	mv	a5,a1
    80006f9e:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80006fa2:	fe843783          	ld	a5,-24(s0)
    80006fa6:	853e                	mv	a0,a5
    80006fa8:	ffffa097          	auipc	ra,0xffffa
    80006fac:	382080e7          	jalr	898(ra) # 8000132a <acquire>
  if(writable){
    80006fb0:	fe442783          	lw	a5,-28(s0)
    80006fb4:	2781                	sext.w	a5,a5
    80006fb6:	cf99                	beqz	a5,80006fd4 <pipeclose+0x44>
    pi->writeopen = 0;
    80006fb8:	fe843783          	ld	a5,-24(s0)
    80006fbc:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80006fc0:	fe843783          	ld	a5,-24(s0)
    80006fc4:	21878793          	addi	a5,a5,536
    80006fc8:	853e                	mv	a0,a5
    80006fca:	ffffc097          	auipc	ra,0xffffc
    80006fce:	630080e7          	jalr	1584(ra) # 800035fa <wakeup>
    80006fd2:	a831                	j	80006fee <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80006fd4:	fe843783          	ld	a5,-24(s0)
    80006fd8:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80006fdc:	fe843783          	ld	a5,-24(s0)
    80006fe0:	21c78793          	addi	a5,a5,540
    80006fe4:	853e                	mv	a0,a5
    80006fe6:	ffffc097          	auipc	ra,0xffffc
    80006fea:	614080e7          	jalr	1556(ra) # 800035fa <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80006fee:	fe843783          	ld	a5,-24(s0)
    80006ff2:	2207a783          	lw	a5,544(a5)
    80006ff6:	e785                	bnez	a5,8000701e <pipeclose+0x8e>
    80006ff8:	fe843783          	ld	a5,-24(s0)
    80006ffc:	2247a783          	lw	a5,548(a5)
    80007000:	ef99                	bnez	a5,8000701e <pipeclose+0x8e>
    release(&pi->lock);
    80007002:	fe843783          	ld	a5,-24(s0)
    80007006:	853e                	mv	a0,a5
    80007008:	ffffa097          	auipc	ra,0xffffa
    8000700c:	386080e7          	jalr	902(ra) # 8000138e <release>
    kfree((char*)pi);
    80007010:	fe843503          	ld	a0,-24(s0)
    80007014:	ffffa097          	auipc	ra,0xffffa
    80007018:	11c080e7          	jalr	284(ra) # 80001130 <kfree>
    8000701c:	a809                	j	8000702e <pipeclose+0x9e>
  } else
    release(&pi->lock);
    8000701e:	fe843783          	ld	a5,-24(s0)
    80007022:	853e                	mv	a0,a5
    80007024:	ffffa097          	auipc	ra,0xffffa
    80007028:	36a080e7          	jalr	874(ra) # 8000138e <release>
}
    8000702c:	0001                	nop
    8000702e:	0001                	nop
    80007030:	60e2                	ld	ra,24(sp)
    80007032:	6442                	ld	s0,16(sp)
    80007034:	6105                	addi	sp,sp,32
    80007036:	8082                	ret

0000000080007038 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80007038:	715d                	addi	sp,sp,-80
    8000703a:	e486                	sd	ra,72(sp)
    8000703c:	e0a2                	sd	s0,64(sp)
    8000703e:	0880                	addi	s0,sp,80
    80007040:	fca43423          	sd	a0,-56(s0)
    80007044:	fcb43023          	sd	a1,-64(s0)
    80007048:	87b2                	mv	a5,a2
    8000704a:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    8000704e:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007052:	ffffc097          	auipc	ra,0xffffc
    80007056:	96a080e7          	jalr	-1686(ra) # 800029bc <myproc>
    8000705a:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    8000705e:	fc843783          	ld	a5,-56(s0)
    80007062:	853e                	mv	a0,a5
    80007064:	ffffa097          	auipc	ra,0xffffa
    80007068:	2c6080e7          	jalr	710(ra) # 8000132a <acquire>
  while(i < n){
    8000706c:	a8f1                	j	80007148 <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    8000706e:	fc843783          	ld	a5,-56(s0)
    80007072:	2207a783          	lw	a5,544(a5)
    80007076:	cb89                	beqz	a5,80007088 <pipewrite+0x50>
    80007078:	fe043503          	ld	a0,-32(s0)
    8000707c:	ffffc097          	auipc	ra,0xffffc
    80007080:	710080e7          	jalr	1808(ra) # 8000378c <killed>
    80007084:	87aa                	mv	a5,a0
    80007086:	cb91                	beqz	a5,8000709a <pipewrite+0x62>
      release(&pi->lock);
    80007088:	fc843783          	ld	a5,-56(s0)
    8000708c:	853e                	mv	a0,a5
    8000708e:	ffffa097          	auipc	ra,0xffffa
    80007092:	300080e7          	jalr	768(ra) # 8000138e <release>
      return -1;
    80007096:	57fd                	li	a5,-1
    80007098:	a0e5                	j	80007180 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    8000709a:	fc843783          	ld	a5,-56(s0)
    8000709e:	21c7a703          	lw	a4,540(a5)
    800070a2:	fc843783          	ld	a5,-56(s0)
    800070a6:	2187a783          	lw	a5,536(a5)
    800070aa:	2007879b          	addiw	a5,a5,512
    800070ae:	2781                	sext.w	a5,a5
    800070b0:	02f71863          	bne	a4,a5,800070e0 <pipewrite+0xa8>
      wakeup(&pi->nread);
    800070b4:	fc843783          	ld	a5,-56(s0)
    800070b8:	21878793          	addi	a5,a5,536
    800070bc:	853e                	mv	a0,a5
    800070be:	ffffc097          	auipc	ra,0xffffc
    800070c2:	53c080e7          	jalr	1340(ra) # 800035fa <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800070c6:	fc843783          	ld	a5,-56(s0)
    800070ca:	21c78793          	addi	a5,a5,540
    800070ce:	fc843703          	ld	a4,-56(s0)
    800070d2:	85ba                	mv	a1,a4
    800070d4:	853e                	mv	a0,a5
    800070d6:	ffffc097          	auipc	ra,0xffffc
    800070da:	4a8080e7          	jalr	1192(ra) # 8000357e <sleep>
    800070de:	a0ad                	j	80007148 <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800070e0:	fe043783          	ld	a5,-32(s0)
    800070e4:	6ba8                	ld	a0,80(a5)
    800070e6:	fec42703          	lw	a4,-20(s0)
    800070ea:	fc043783          	ld	a5,-64(s0)
    800070ee:	973e                	add	a4,a4,a5
    800070f0:	fdf40793          	addi	a5,s0,-33
    800070f4:	4685                	li	a3,1
    800070f6:	863a                	mv	a2,a4
    800070f8:	85be                	mv	a1,a5
    800070fa:	ffffb097          	auipc	ra,0xffffb
    800070fe:	45a080e7          	jalr	1114(ra) # 80002554 <copyin>
    80007102:	87aa                	mv	a5,a0
    80007104:	873e                	mv	a4,a5
    80007106:	57fd                	li	a5,-1
    80007108:	04f70963          	beq	a4,a5,8000715a <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8000710c:	fc843783          	ld	a5,-56(s0)
    80007110:	21c7a783          	lw	a5,540(a5)
    80007114:	2781                	sext.w	a5,a5
    80007116:	0017871b          	addiw	a4,a5,1
    8000711a:	0007069b          	sext.w	a3,a4
    8000711e:	fc843703          	ld	a4,-56(s0)
    80007122:	20d72e23          	sw	a3,540(a4)
    80007126:	1ff7f793          	andi	a5,a5,511
    8000712a:	2781                	sext.w	a5,a5
    8000712c:	fdf44703          	lbu	a4,-33(s0)
    80007130:	fc843683          	ld	a3,-56(s0)
    80007134:	1782                	slli	a5,a5,0x20
    80007136:	9381                	srli	a5,a5,0x20
    80007138:	97b6                	add	a5,a5,a3
    8000713a:	00e78c23          	sb	a4,24(a5)
      i++;
    8000713e:	fec42783          	lw	a5,-20(s0)
    80007142:	2785                	addiw	a5,a5,1
    80007144:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80007148:	fec42703          	lw	a4,-20(s0)
    8000714c:	fbc42783          	lw	a5,-68(s0)
    80007150:	2701                	sext.w	a4,a4
    80007152:	2781                	sext.w	a5,a5
    80007154:	f0f74de3          	blt	a4,a5,8000706e <pipewrite+0x36>
    80007158:	a011                	j	8000715c <pipewrite+0x124>
        break;
    8000715a:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    8000715c:	fc843783          	ld	a5,-56(s0)
    80007160:	21878793          	addi	a5,a5,536
    80007164:	853e                	mv	a0,a5
    80007166:	ffffc097          	auipc	ra,0xffffc
    8000716a:	494080e7          	jalr	1172(ra) # 800035fa <wakeup>
  release(&pi->lock);
    8000716e:	fc843783          	ld	a5,-56(s0)
    80007172:	853e                	mv	a0,a5
    80007174:	ffffa097          	auipc	ra,0xffffa
    80007178:	21a080e7          	jalr	538(ra) # 8000138e <release>

  return i;
    8000717c:	fec42783          	lw	a5,-20(s0)
}
    80007180:	853e                	mv	a0,a5
    80007182:	60a6                	ld	ra,72(sp)
    80007184:	6406                	ld	s0,64(sp)
    80007186:	6161                	addi	sp,sp,80
    80007188:	8082                	ret

000000008000718a <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    8000718a:	715d                	addi	sp,sp,-80
    8000718c:	e486                	sd	ra,72(sp)
    8000718e:	e0a2                	sd	s0,64(sp)
    80007190:	0880                	addi	s0,sp,80
    80007192:	fca43423          	sd	a0,-56(s0)
    80007196:	fcb43023          	sd	a1,-64(s0)
    8000719a:	87b2                	mv	a5,a2
    8000719c:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800071a0:	ffffc097          	auipc	ra,0xffffc
    800071a4:	81c080e7          	jalr	-2020(ra) # 800029bc <myproc>
    800071a8:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800071ac:	fc843783          	ld	a5,-56(s0)
    800071b0:	853e                	mv	a0,a5
    800071b2:	ffffa097          	auipc	ra,0xffffa
    800071b6:	178080e7          	jalr	376(ra) # 8000132a <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800071ba:	a835                	j	800071f6 <piperead+0x6c>
    if(killed(pr)){
    800071bc:	fe043503          	ld	a0,-32(s0)
    800071c0:	ffffc097          	auipc	ra,0xffffc
    800071c4:	5cc080e7          	jalr	1484(ra) # 8000378c <killed>
    800071c8:	87aa                	mv	a5,a0
    800071ca:	cb91                	beqz	a5,800071de <piperead+0x54>
      release(&pi->lock);
    800071cc:	fc843783          	ld	a5,-56(s0)
    800071d0:	853e                	mv	a0,a5
    800071d2:	ffffa097          	auipc	ra,0xffffa
    800071d6:	1bc080e7          	jalr	444(ra) # 8000138e <release>
      return -1;
    800071da:	57fd                	li	a5,-1
    800071dc:	a8dd                	j	800072d2 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    800071de:	fc843783          	ld	a5,-56(s0)
    800071e2:	21878793          	addi	a5,a5,536
    800071e6:	fc843703          	ld	a4,-56(s0)
    800071ea:	85ba                	mv	a1,a4
    800071ec:	853e                	mv	a0,a5
    800071ee:	ffffc097          	auipc	ra,0xffffc
    800071f2:	390080e7          	jalr	912(ra) # 8000357e <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800071f6:	fc843783          	ld	a5,-56(s0)
    800071fa:	2187a703          	lw	a4,536(a5)
    800071fe:	fc843783          	ld	a5,-56(s0)
    80007202:	21c7a783          	lw	a5,540(a5)
    80007206:	00f71763          	bne	a4,a5,80007214 <piperead+0x8a>
    8000720a:	fc843783          	ld	a5,-56(s0)
    8000720e:	2247a783          	lw	a5,548(a5)
    80007212:	f7cd                	bnez	a5,800071bc <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007214:	fe042623          	sw	zero,-20(s0)
    80007218:	a8bd                	j	80007296 <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    8000721a:	fc843783          	ld	a5,-56(s0)
    8000721e:	2187a703          	lw	a4,536(a5)
    80007222:	fc843783          	ld	a5,-56(s0)
    80007226:	21c7a783          	lw	a5,540(a5)
    8000722a:	06f70f63          	beq	a4,a5,800072a8 <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    8000722e:	fc843783          	ld	a5,-56(s0)
    80007232:	2187a783          	lw	a5,536(a5)
    80007236:	2781                	sext.w	a5,a5
    80007238:	0017871b          	addiw	a4,a5,1
    8000723c:	0007069b          	sext.w	a3,a4
    80007240:	fc843703          	ld	a4,-56(s0)
    80007244:	20d72c23          	sw	a3,536(a4)
    80007248:	1ff7f793          	andi	a5,a5,511
    8000724c:	2781                	sext.w	a5,a5
    8000724e:	fc843703          	ld	a4,-56(s0)
    80007252:	1782                	slli	a5,a5,0x20
    80007254:	9381                	srli	a5,a5,0x20
    80007256:	97ba                	add	a5,a5,a4
    80007258:	0187c783          	lbu	a5,24(a5)
    8000725c:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007260:	fe043783          	ld	a5,-32(s0)
    80007264:	6ba8                	ld	a0,80(a5)
    80007266:	fec42703          	lw	a4,-20(s0)
    8000726a:	fc043783          	ld	a5,-64(s0)
    8000726e:	97ba                	add	a5,a5,a4
    80007270:	fdf40713          	addi	a4,s0,-33
    80007274:	4685                	li	a3,1
    80007276:	863a                	mv	a2,a4
    80007278:	85be                	mv	a1,a5
    8000727a:	ffffb097          	auipc	ra,0xffffb
    8000727e:	20c080e7          	jalr	524(ra) # 80002486 <copyout>
    80007282:	87aa                	mv	a5,a0
    80007284:	873e                	mv	a4,a5
    80007286:	57fd                	li	a5,-1
    80007288:	02f70263          	beq	a4,a5,800072ac <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000728c:	fec42783          	lw	a5,-20(s0)
    80007290:	2785                	addiw	a5,a5,1
    80007292:	fef42623          	sw	a5,-20(s0)
    80007296:	fec42703          	lw	a4,-20(s0)
    8000729a:	fbc42783          	lw	a5,-68(s0)
    8000729e:	2701                	sext.w	a4,a4
    800072a0:	2781                	sext.w	a5,a5
    800072a2:	f6f74ce3          	blt	a4,a5,8000721a <piperead+0x90>
    800072a6:	a021                	j	800072ae <piperead+0x124>
      break;
    800072a8:	0001                	nop
    800072aa:	a011                	j	800072ae <piperead+0x124>
      break;
    800072ac:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800072ae:	fc843783          	ld	a5,-56(s0)
    800072b2:	21c78793          	addi	a5,a5,540
    800072b6:	853e                	mv	a0,a5
    800072b8:	ffffc097          	auipc	ra,0xffffc
    800072bc:	342080e7          	jalr	834(ra) # 800035fa <wakeup>
  release(&pi->lock);
    800072c0:	fc843783          	ld	a5,-56(s0)
    800072c4:	853e                	mv	a0,a5
    800072c6:	ffffa097          	auipc	ra,0xffffa
    800072ca:	0c8080e7          	jalr	200(ra) # 8000138e <release>
  return i;
    800072ce:	fec42783          	lw	a5,-20(s0)
}
    800072d2:	853e                	mv	a0,a5
    800072d4:	60a6                	ld	ra,72(sp)
    800072d6:	6406                	ld	s0,64(sp)
    800072d8:	6161                	addi	sp,sp,80
    800072da:	8082                	ret

00000000800072dc <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    800072dc:	7179                	addi	sp,sp,-48
    800072de:	f422                	sd	s0,40(sp)
    800072e0:	1800                	addi	s0,sp,48
    800072e2:	87aa                	mv	a5,a0
    800072e4:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    800072e8:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    800072ec:	fdc42783          	lw	a5,-36(s0)
    800072f0:	8b85                	andi	a5,a5,1
    800072f2:	2781                	sext.w	a5,a5
    800072f4:	c781                	beqz	a5,800072fc <flags2perm+0x20>
      perm = PTE_X;
    800072f6:	47a1                	li	a5,8
    800072f8:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    800072fc:	fdc42783          	lw	a5,-36(s0)
    80007300:	8b89                	andi	a5,a5,2
    80007302:	2781                	sext.w	a5,a5
    80007304:	c799                	beqz	a5,80007312 <flags2perm+0x36>
      perm |= PTE_W;
    80007306:	fec42783          	lw	a5,-20(s0)
    8000730a:	0047e793          	ori	a5,a5,4
    8000730e:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007312:	fec42783          	lw	a5,-20(s0)
}
    80007316:	853e                	mv	a0,a5
    80007318:	7422                	ld	s0,40(sp)
    8000731a:	6145                	addi	sp,sp,48
    8000731c:	8082                	ret

000000008000731e <exec>:

int
exec(char *path, char **argv)
{
    8000731e:	de010113          	addi	sp,sp,-544
    80007322:	20113c23          	sd	ra,536(sp)
    80007326:	20813823          	sd	s0,528(sp)
    8000732a:	20913423          	sd	s1,520(sp)
    8000732e:	1400                	addi	s0,sp,544
    80007330:	dea43423          	sd	a0,-536(s0)
    80007334:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007338:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    8000733c:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007340:	ffffb097          	auipc	ra,0xffffb
    80007344:	67c080e7          	jalr	1660(ra) # 800029bc <myproc>
    80007348:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    8000734c:	fffff097          	auipc	ra,0xfffff
    80007350:	f40080e7          	jalr	-192(ra) # 8000628c <begin_op>

  if((ip = namei(path)) == 0){
    80007354:	de843503          	ld	a0,-536(s0)
    80007358:	fffff097          	auipc	ra,0xfffff
    8000735c:	bd0080e7          	jalr	-1072(ra) # 80005f28 <namei>
    80007360:	faa43423          	sd	a0,-88(s0)
    80007364:	fa843783          	ld	a5,-88(s0)
    80007368:	e799                	bnez	a5,80007376 <exec+0x58>
    end_op();
    8000736a:	fffff097          	auipc	ra,0xfffff
    8000736e:	fe4080e7          	jalr	-28(ra) # 8000634e <end_op>
    return -1;
    80007372:	57fd                	li	a5,-1
    80007374:	a1a9                	j	800077be <exec+0x4a0>
  }
  ilock(ip);
    80007376:	fa843503          	ld	a0,-88(s0)
    8000737a:	ffffe097          	auipc	ra,0xffffe
    8000737e:	e88080e7          	jalr	-376(ra) # 80005202 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    80007382:	e3040793          	addi	a5,s0,-464
    80007386:	04000713          	li	a4,64
    8000738a:	4681                	li	a3,0
    8000738c:	863e                	mv	a2,a5
    8000738e:	4581                	li	a1,0
    80007390:	fa843503          	ld	a0,-88(s0)
    80007394:	ffffe097          	auipc	ra,0xffffe
    80007398:	424080e7          	jalr	1060(ra) # 800057b8 <readi>
    8000739c:	87aa                	mv	a5,a0
    8000739e:	873e                	mv	a4,a5
    800073a0:	04000793          	li	a5,64
    800073a4:	3af71763          	bne	a4,a5,80007752 <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800073a8:	e3042783          	lw	a5,-464(s0)
    800073ac:	873e                	mv	a4,a5
    800073ae:	464c47b7          	lui	a5,0x464c4
    800073b2:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800073b6:	3af71063          	bne	a4,a5,80007756 <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800073ba:	f9843503          	ld	a0,-104(s0)
    800073be:	ffffc097          	auipc	ra,0xffffc
    800073c2:	860080e7          	jalr	-1952(ra) # 80002c1e <proc_pagetable>
    800073c6:	faa43023          	sd	a0,-96(s0)
    800073ca:	fa043783          	ld	a5,-96(s0)
    800073ce:	38078663          	beqz	a5,8000775a <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800073d2:	fc042623          	sw	zero,-52(s0)
    800073d6:	e5043783          	ld	a5,-432(s0)
    800073da:	fcf42423          	sw	a5,-56(s0)
    800073de:	a0fd                	j	800074cc <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800073e0:	df840793          	addi	a5,s0,-520
    800073e4:	fc842683          	lw	a3,-56(s0)
    800073e8:	03800713          	li	a4,56
    800073ec:	863e                	mv	a2,a5
    800073ee:	4581                	li	a1,0
    800073f0:	fa843503          	ld	a0,-88(s0)
    800073f4:	ffffe097          	auipc	ra,0xffffe
    800073f8:	3c4080e7          	jalr	964(ra) # 800057b8 <readi>
    800073fc:	87aa                	mv	a5,a0
    800073fe:	873e                	mv	a4,a5
    80007400:	03800793          	li	a5,56
    80007404:	34f71d63          	bne	a4,a5,8000775e <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80007408:	df842783          	lw	a5,-520(s0)
    8000740c:	873e                	mv	a4,a5
    8000740e:	4785                	li	a5,1
    80007410:	0af71163          	bne	a4,a5,800074b2 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    80007414:	e2043703          	ld	a4,-480(s0)
    80007418:	e1843783          	ld	a5,-488(s0)
    8000741c:	34f76363          	bltu	a4,a5,80007762 <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007420:	e0843703          	ld	a4,-504(s0)
    80007424:	e2043783          	ld	a5,-480(s0)
    80007428:	973e                	add	a4,a4,a5
    8000742a:	e0843783          	ld	a5,-504(s0)
    8000742e:	32f76c63          	bltu	a4,a5,80007766 <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007432:	e0843703          	ld	a4,-504(s0)
    80007436:	6785                	lui	a5,0x1
    80007438:	17fd                	addi	a5,a5,-1
    8000743a:	8ff9                	and	a5,a5,a4
    8000743c:	32079763          	bnez	a5,8000776a <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007440:	e0843703          	ld	a4,-504(s0)
    80007444:	e2043783          	ld	a5,-480(s0)
    80007448:	00f704b3          	add	s1,a4,a5
    8000744c:	dfc42783          	lw	a5,-516(s0)
    80007450:	2781                	sext.w	a5,a5
    80007452:	853e                	mv	a0,a5
    80007454:	00000097          	auipc	ra,0x0
    80007458:	e88080e7          	jalr	-376(ra) # 800072dc <flags2perm>
    8000745c:	87aa                	mv	a5,a0
    8000745e:	86be                	mv	a3,a5
    80007460:	8626                	mv	a2,s1
    80007462:	fb843583          	ld	a1,-72(s0)
    80007466:	fa043503          	ld	a0,-96(s0)
    8000746a:	ffffb097          	auipc	ra,0xffffb
    8000746e:	c24080e7          	jalr	-988(ra) # 8000208e <uvmalloc>
    80007472:	f6a43823          	sd	a0,-144(s0)
    80007476:	f7043783          	ld	a5,-144(s0)
    8000747a:	2e078a63          	beqz	a5,8000776e <exec+0x450>
      goto bad;
    sz = sz1;
    8000747e:	f7043783          	ld	a5,-144(s0)
    80007482:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    80007486:	e0843783          	ld	a5,-504(s0)
    8000748a:	e0043703          	ld	a4,-512(s0)
    8000748e:	0007069b          	sext.w	a3,a4
    80007492:	e1843703          	ld	a4,-488(s0)
    80007496:	2701                	sext.w	a4,a4
    80007498:	fa843603          	ld	a2,-88(s0)
    8000749c:	85be                	mv	a1,a5
    8000749e:	fa043503          	ld	a0,-96(s0)
    800074a2:	00000097          	auipc	ra,0x0
    800074a6:	330080e7          	jalr	816(ra) # 800077d2 <loadseg>
    800074aa:	87aa                	mv	a5,a0
    800074ac:	2c07c363          	bltz	a5,80007772 <exec+0x454>
    800074b0:	a011                	j	800074b4 <exec+0x196>
      continue;
    800074b2:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800074b4:	fcc42783          	lw	a5,-52(s0)
    800074b8:	2785                	addiw	a5,a5,1
    800074ba:	fcf42623          	sw	a5,-52(s0)
    800074be:	fc842783          	lw	a5,-56(s0)
    800074c2:	0387879b          	addiw	a5,a5,56
    800074c6:	2781                	sext.w	a5,a5
    800074c8:	fcf42423          	sw	a5,-56(s0)
    800074cc:	e6845783          	lhu	a5,-408(s0)
    800074d0:	0007871b          	sext.w	a4,a5
    800074d4:	fcc42783          	lw	a5,-52(s0)
    800074d8:	2781                	sext.w	a5,a5
    800074da:	f0e7c3e3          	blt	a5,a4,800073e0 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800074de:	fa843503          	ld	a0,-88(s0)
    800074e2:	ffffe097          	auipc	ra,0xffffe
    800074e6:	f7e080e7          	jalr	-130(ra) # 80005460 <iunlockput>
  end_op();
    800074ea:	fffff097          	auipc	ra,0xfffff
    800074ee:	e64080e7          	jalr	-412(ra) # 8000634e <end_op>
  ip = 0;
    800074f2:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800074f6:	ffffb097          	auipc	ra,0xffffb
    800074fa:	4c6080e7          	jalr	1222(ra) # 800029bc <myproc>
    800074fe:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007502:	f9843783          	ld	a5,-104(s0)
    80007506:	67bc                	ld	a5,72(a5)
    80007508:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    8000750c:	fb843703          	ld	a4,-72(s0)
    80007510:	6785                	lui	a5,0x1
    80007512:	17fd                	addi	a5,a5,-1
    80007514:	973e                	add	a4,a4,a5
    80007516:	77fd                	lui	a5,0xfffff
    80007518:	8ff9                	and	a5,a5,a4
    8000751a:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    8000751e:	fb843703          	ld	a4,-72(s0)
    80007522:	6789                	lui	a5,0x2
    80007524:	97ba                	add	a5,a5,a4
    80007526:	4691                	li	a3,4
    80007528:	863e                	mv	a2,a5
    8000752a:	fb843583          	ld	a1,-72(s0)
    8000752e:	fa043503          	ld	a0,-96(s0)
    80007532:	ffffb097          	auipc	ra,0xffffb
    80007536:	b5c080e7          	jalr	-1188(ra) # 8000208e <uvmalloc>
    8000753a:	f8a43423          	sd	a0,-120(s0)
    8000753e:	f8843783          	ld	a5,-120(s0)
    80007542:	22078a63          	beqz	a5,80007776 <exec+0x458>
    goto bad;
  sz = sz1;
    80007546:	f8843783          	ld	a5,-120(s0)
    8000754a:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    8000754e:	fb843703          	ld	a4,-72(s0)
    80007552:	77f9                	lui	a5,0xffffe
    80007554:	97ba                	add	a5,a5,a4
    80007556:	85be                	mv	a1,a5
    80007558:	fa043503          	ld	a0,-96(s0)
    8000755c:	ffffb097          	auipc	ra,0xffffb
    80007560:	ec8080e7          	jalr	-312(ra) # 80002424 <uvmclear>
  sp = sz;
    80007564:	fb843783          	ld	a5,-72(s0)
    80007568:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    8000756c:	fb043703          	ld	a4,-80(s0)
    80007570:	77fd                	lui	a5,0xfffff
    80007572:	97ba                	add	a5,a5,a4
    80007574:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007578:	fc043023          	sd	zero,-64(s0)
    8000757c:	a845                	j	8000762c <exec+0x30e>
    if(argc >= MAXARG)
    8000757e:	fc043703          	ld	a4,-64(s0)
    80007582:	47fd                	li	a5,31
    80007584:	1ee7eb63          	bltu	a5,a4,8000777a <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007588:	fc043783          	ld	a5,-64(s0)
    8000758c:	078e                	slli	a5,a5,0x3
    8000758e:	de043703          	ld	a4,-544(s0)
    80007592:	97ba                	add	a5,a5,a4
    80007594:	639c                	ld	a5,0(a5)
    80007596:	853e                	mv	a0,a5
    80007598:	ffffa097          	auipc	ra,0xffffa
    8000759c:	2e4080e7          	jalr	740(ra) # 8000187c <strlen>
    800075a0:	87aa                	mv	a5,a0
    800075a2:	2785                	addiw	a5,a5,1
    800075a4:	2781                	sext.w	a5,a5
    800075a6:	873e                	mv	a4,a5
    800075a8:	fb043783          	ld	a5,-80(s0)
    800075ac:	8f99                	sub	a5,a5,a4
    800075ae:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800075b2:	fb043783          	ld	a5,-80(s0)
    800075b6:	9bc1                	andi	a5,a5,-16
    800075b8:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800075bc:	fb043703          	ld	a4,-80(s0)
    800075c0:	f8043783          	ld	a5,-128(s0)
    800075c4:	1af76d63          	bltu	a4,a5,8000777e <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800075c8:	fc043783          	ld	a5,-64(s0)
    800075cc:	078e                	slli	a5,a5,0x3
    800075ce:	de043703          	ld	a4,-544(s0)
    800075d2:	97ba                	add	a5,a5,a4
    800075d4:	6384                	ld	s1,0(a5)
    800075d6:	fc043783          	ld	a5,-64(s0)
    800075da:	078e                	slli	a5,a5,0x3
    800075dc:	de043703          	ld	a4,-544(s0)
    800075e0:	97ba                	add	a5,a5,a4
    800075e2:	639c                	ld	a5,0(a5)
    800075e4:	853e                	mv	a0,a5
    800075e6:	ffffa097          	auipc	ra,0xffffa
    800075ea:	296080e7          	jalr	662(ra) # 8000187c <strlen>
    800075ee:	87aa                	mv	a5,a0
    800075f0:	2785                	addiw	a5,a5,1
    800075f2:	2781                	sext.w	a5,a5
    800075f4:	86be                	mv	a3,a5
    800075f6:	8626                	mv	a2,s1
    800075f8:	fb043583          	ld	a1,-80(s0)
    800075fc:	fa043503          	ld	a0,-96(s0)
    80007600:	ffffb097          	auipc	ra,0xffffb
    80007604:	e86080e7          	jalr	-378(ra) # 80002486 <copyout>
    80007608:	87aa                	mv	a5,a0
    8000760a:	1607cc63          	bltz	a5,80007782 <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    8000760e:	fc043783          	ld	a5,-64(s0)
    80007612:	078e                	slli	a5,a5,0x3
    80007614:	fe040713          	addi	a4,s0,-32
    80007618:	97ba                	add	a5,a5,a4
    8000761a:	fb043703          	ld	a4,-80(s0)
    8000761e:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffc9f60>
  for(argc = 0; argv[argc]; argc++) {
    80007622:	fc043783          	ld	a5,-64(s0)
    80007626:	0785                	addi	a5,a5,1
    80007628:	fcf43023          	sd	a5,-64(s0)
    8000762c:	fc043783          	ld	a5,-64(s0)
    80007630:	078e                	slli	a5,a5,0x3
    80007632:	de043703          	ld	a4,-544(s0)
    80007636:	97ba                	add	a5,a5,a4
    80007638:	639c                	ld	a5,0(a5)
    8000763a:	f3b1                	bnez	a5,8000757e <exec+0x260>
  }
  ustack[argc] = 0;
    8000763c:	fc043783          	ld	a5,-64(s0)
    80007640:	078e                	slli	a5,a5,0x3
    80007642:	fe040713          	addi	a4,s0,-32
    80007646:	97ba                	add	a5,a5,a4
    80007648:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    8000764c:	fc043783          	ld	a5,-64(s0)
    80007650:	0785                	addi	a5,a5,1
    80007652:	078e                	slli	a5,a5,0x3
    80007654:	fb043703          	ld	a4,-80(s0)
    80007658:	40f707b3          	sub	a5,a4,a5
    8000765c:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007660:	fb043783          	ld	a5,-80(s0)
    80007664:	9bc1                	andi	a5,a5,-16
    80007666:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    8000766a:	fb043703          	ld	a4,-80(s0)
    8000766e:	f8043783          	ld	a5,-128(s0)
    80007672:	10f76a63          	bltu	a4,a5,80007786 <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80007676:	fc043783          	ld	a5,-64(s0)
    8000767a:	0785                	addi	a5,a5,1
    8000767c:	00379713          	slli	a4,a5,0x3
    80007680:	e7040793          	addi	a5,s0,-400
    80007684:	86ba                	mv	a3,a4
    80007686:	863e                	mv	a2,a5
    80007688:	fb043583          	ld	a1,-80(s0)
    8000768c:	fa043503          	ld	a0,-96(s0)
    80007690:	ffffb097          	auipc	ra,0xffffb
    80007694:	df6080e7          	jalr	-522(ra) # 80002486 <copyout>
    80007698:	87aa                	mv	a5,a0
    8000769a:	0e07c863          	bltz	a5,8000778a <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    8000769e:	f9843783          	ld	a5,-104(s0)
    800076a2:	6fbc                	ld	a5,88(a5)
    800076a4:	fb043703          	ld	a4,-80(s0)
    800076a8:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800076aa:	de843783          	ld	a5,-536(s0)
    800076ae:	fcf43c23          	sd	a5,-40(s0)
    800076b2:	fd843783          	ld	a5,-40(s0)
    800076b6:	fcf43823          	sd	a5,-48(s0)
    800076ba:	a025                	j	800076e2 <exec+0x3c4>
    if(*s == '/')
    800076bc:	fd843783          	ld	a5,-40(s0)
    800076c0:	0007c783          	lbu	a5,0(a5)
    800076c4:	873e                	mv	a4,a5
    800076c6:	02f00793          	li	a5,47
    800076ca:	00f71763          	bne	a4,a5,800076d8 <exec+0x3ba>
      last = s+1;
    800076ce:	fd843783          	ld	a5,-40(s0)
    800076d2:	0785                	addi	a5,a5,1
    800076d4:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    800076d8:	fd843783          	ld	a5,-40(s0)
    800076dc:	0785                	addi	a5,a5,1
    800076de:	fcf43c23          	sd	a5,-40(s0)
    800076e2:	fd843783          	ld	a5,-40(s0)
    800076e6:	0007c783          	lbu	a5,0(a5)
    800076ea:	fbe9                	bnez	a5,800076bc <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    800076ec:	f9843783          	ld	a5,-104(s0)
    800076f0:	15878793          	addi	a5,a5,344
    800076f4:	4641                	li	a2,16
    800076f6:	fd043583          	ld	a1,-48(s0)
    800076fa:	853e                	mv	a0,a5
    800076fc:	ffffa097          	auipc	ra,0xffffa
    80007700:	106080e7          	jalr	262(ra) # 80001802 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007704:	f9843783          	ld	a5,-104(s0)
    80007708:	6bbc                	ld	a5,80(a5)
    8000770a:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    8000770e:	f9843783          	ld	a5,-104(s0)
    80007712:	fa043703          	ld	a4,-96(s0)
    80007716:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007718:	f9843783          	ld	a5,-104(s0)
    8000771c:	fb843703          	ld	a4,-72(s0)
    80007720:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007722:	f9843783          	ld	a5,-104(s0)
    80007726:	6fbc                	ld	a5,88(a5)
    80007728:	e4843703          	ld	a4,-440(s0)
    8000772c:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8000772e:	f9843783          	ld	a5,-104(s0)
    80007732:	6fbc                	ld	a5,88(a5)
    80007734:	fb043703          	ld	a4,-80(s0)
    80007738:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    8000773a:	f9043583          	ld	a1,-112(s0)
    8000773e:	f7843503          	ld	a0,-136(s0)
    80007742:	ffffb097          	auipc	ra,0xffffb
    80007746:	59c080e7          	jalr	1436(ra) # 80002cde <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8000774a:	fc043783          	ld	a5,-64(s0)
    8000774e:	2781                	sext.w	a5,a5
    80007750:	a0bd                	j	800077be <exec+0x4a0>
    goto bad;
    80007752:	0001                	nop
    80007754:	a825                	j	8000778c <exec+0x46e>
    goto bad;
    80007756:	0001                	nop
    80007758:	a815                	j	8000778c <exec+0x46e>
    goto bad;
    8000775a:	0001                	nop
    8000775c:	a805                	j	8000778c <exec+0x46e>
      goto bad;
    8000775e:	0001                	nop
    80007760:	a035                	j	8000778c <exec+0x46e>
      goto bad;
    80007762:	0001                	nop
    80007764:	a025                	j	8000778c <exec+0x46e>
      goto bad;
    80007766:	0001                	nop
    80007768:	a015                	j	8000778c <exec+0x46e>
      goto bad;
    8000776a:	0001                	nop
    8000776c:	a005                	j	8000778c <exec+0x46e>
      goto bad;
    8000776e:	0001                	nop
    80007770:	a831                	j	8000778c <exec+0x46e>
      goto bad;
    80007772:	0001                	nop
    80007774:	a821                	j	8000778c <exec+0x46e>
    goto bad;
    80007776:	0001                	nop
    80007778:	a811                	j	8000778c <exec+0x46e>
      goto bad;
    8000777a:	0001                	nop
    8000777c:	a801                	j	8000778c <exec+0x46e>
      goto bad;
    8000777e:	0001                	nop
    80007780:	a031                	j	8000778c <exec+0x46e>
      goto bad;
    80007782:	0001                	nop
    80007784:	a021                	j	8000778c <exec+0x46e>
    goto bad;
    80007786:	0001                	nop
    80007788:	a011                	j	8000778c <exec+0x46e>
    goto bad;
    8000778a:	0001                	nop

 bad:
  if(pagetable)
    8000778c:	fa043783          	ld	a5,-96(s0)
    80007790:	cb89                	beqz	a5,800077a2 <exec+0x484>
    proc_freepagetable(pagetable, sz);
    80007792:	fb843583          	ld	a1,-72(s0)
    80007796:	fa043503          	ld	a0,-96(s0)
    8000779a:	ffffb097          	auipc	ra,0xffffb
    8000779e:	544080e7          	jalr	1348(ra) # 80002cde <proc_freepagetable>
  if(ip){
    800077a2:	fa843783          	ld	a5,-88(s0)
    800077a6:	cb99                	beqz	a5,800077bc <exec+0x49e>
    iunlockput(ip);
    800077a8:	fa843503          	ld	a0,-88(s0)
    800077ac:	ffffe097          	auipc	ra,0xffffe
    800077b0:	cb4080e7          	jalr	-844(ra) # 80005460 <iunlockput>
    end_op();
    800077b4:	fffff097          	auipc	ra,0xfffff
    800077b8:	b9a080e7          	jalr	-1126(ra) # 8000634e <end_op>
  }
  return -1;
    800077bc:	57fd                	li	a5,-1
}
    800077be:	853e                	mv	a0,a5
    800077c0:	21813083          	ld	ra,536(sp)
    800077c4:	21013403          	ld	s0,528(sp)
    800077c8:	20813483          	ld	s1,520(sp)
    800077cc:	22010113          	addi	sp,sp,544
    800077d0:	8082                	ret

00000000800077d2 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    800077d2:	7139                	addi	sp,sp,-64
    800077d4:	fc06                	sd	ra,56(sp)
    800077d6:	f822                	sd	s0,48(sp)
    800077d8:	0080                	addi	s0,sp,64
    800077da:	fca43c23          	sd	a0,-40(s0)
    800077de:	fcb43823          	sd	a1,-48(s0)
    800077e2:	fcc43423          	sd	a2,-56(s0)
    800077e6:	87b6                	mv	a5,a3
    800077e8:	fcf42223          	sw	a5,-60(s0)
    800077ec:	87ba                	mv	a5,a4
    800077ee:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    800077f2:	fe042623          	sw	zero,-20(s0)
    800077f6:	a05d                	j	8000789c <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    800077f8:	fec46703          	lwu	a4,-20(s0)
    800077fc:	fd043783          	ld	a5,-48(s0)
    80007800:	97ba                	add	a5,a5,a4
    80007802:	85be                	mv	a1,a5
    80007804:	fd843503          	ld	a0,-40(s0)
    80007808:	ffffa097          	auipc	ra,0xffffa
    8000780c:	4fa080e7          	jalr	1274(ra) # 80001d02 <walkaddr>
    80007810:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007814:	fe043783          	ld	a5,-32(s0)
    80007818:	eb89                	bnez	a5,8000782a <loadseg+0x58>
      panic("loadseg: address should exist");
    8000781a:	00004517          	auipc	a0,0x4
    8000781e:	de650513          	addi	a0,a0,-538 # 8000b600 <etext+0x600>
    80007822:	ffff9097          	auipc	ra,0xffff9
    80007826:	46a080e7          	jalr	1130(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    8000782a:	fc042703          	lw	a4,-64(s0)
    8000782e:	fec42783          	lw	a5,-20(s0)
    80007832:	40f707bb          	subw	a5,a4,a5
    80007836:	2781                	sext.w	a5,a5
    80007838:	873e                	mv	a4,a5
    8000783a:	6785                	lui	a5,0x1
    8000783c:	00f77b63          	bgeu	a4,a5,80007852 <loadseg+0x80>
      n = sz - i;
    80007840:	fc042703          	lw	a4,-64(s0)
    80007844:	fec42783          	lw	a5,-20(s0)
    80007848:	40f707bb          	subw	a5,a4,a5
    8000784c:	fef42423          	sw	a5,-24(s0)
    80007850:	a021                	j	80007858 <loadseg+0x86>
    else
      n = PGSIZE;
    80007852:	6785                	lui	a5,0x1
    80007854:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007858:	fc442703          	lw	a4,-60(s0)
    8000785c:	fec42783          	lw	a5,-20(s0)
    80007860:	9fb9                	addw	a5,a5,a4
    80007862:	2781                	sext.w	a5,a5
    80007864:	fe842703          	lw	a4,-24(s0)
    80007868:	86be                	mv	a3,a5
    8000786a:	fe043603          	ld	a2,-32(s0)
    8000786e:	4581                	li	a1,0
    80007870:	fc843503          	ld	a0,-56(s0)
    80007874:	ffffe097          	auipc	ra,0xffffe
    80007878:	f44080e7          	jalr	-188(ra) # 800057b8 <readi>
    8000787c:	87aa                	mv	a5,a0
    8000787e:	0007871b          	sext.w	a4,a5
    80007882:	fe842783          	lw	a5,-24(s0)
    80007886:	2781                	sext.w	a5,a5
    80007888:	00e78463          	beq	a5,a4,80007890 <loadseg+0xbe>
      return -1;
    8000788c:	57fd                	li	a5,-1
    8000788e:	a005                	j	800078ae <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007890:	fec42703          	lw	a4,-20(s0)
    80007894:	6785                	lui	a5,0x1
    80007896:	9fb9                	addw	a5,a5,a4
    80007898:	fef42623          	sw	a5,-20(s0)
    8000789c:	fec42703          	lw	a4,-20(s0)
    800078a0:	fc042783          	lw	a5,-64(s0)
    800078a4:	2701                	sext.w	a4,a4
    800078a6:	2781                	sext.w	a5,a5
    800078a8:	f4f768e3          	bltu	a4,a5,800077f8 <loadseg+0x26>
  }
  
  return 0;
    800078ac:	4781                	li	a5,0
}
    800078ae:	853e                	mv	a0,a5
    800078b0:	70e2                	ld	ra,56(sp)
    800078b2:	7442                	ld	s0,48(sp)
    800078b4:	6121                	addi	sp,sp,64
    800078b6:	8082                	ret

00000000800078b8 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    800078b8:	7139                	addi	sp,sp,-64
    800078ba:	fc06                	sd	ra,56(sp)
    800078bc:	f822                	sd	s0,48(sp)
    800078be:	0080                	addi	s0,sp,64
    800078c0:	87aa                	mv	a5,a0
    800078c2:	fcb43823          	sd	a1,-48(s0)
    800078c6:	fcc43423          	sd	a2,-56(s0)
    800078ca:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    800078ce:	fe440713          	addi	a4,s0,-28
    800078d2:	fdc42783          	lw	a5,-36(s0)
    800078d6:	85ba                	mv	a1,a4
    800078d8:	853e                	mv	a0,a5
    800078da:	ffffd097          	auipc	ra,0xffffd
    800078de:	980080e7          	jalr	-1664(ra) # 8000425a <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    800078e2:	fe442783          	lw	a5,-28(s0)
    800078e6:	0207c863          	bltz	a5,80007916 <argfd+0x5e>
    800078ea:	fe442783          	lw	a5,-28(s0)
    800078ee:	873e                	mv	a4,a5
    800078f0:	47bd                	li	a5,15
    800078f2:	02e7c263          	blt	a5,a4,80007916 <argfd+0x5e>
    800078f6:	ffffb097          	auipc	ra,0xffffb
    800078fa:	0c6080e7          	jalr	198(ra) # 800029bc <myproc>
    800078fe:	872a                	mv	a4,a0
    80007900:	fe442783          	lw	a5,-28(s0)
    80007904:	07e9                	addi	a5,a5,26
    80007906:	078e                	slli	a5,a5,0x3
    80007908:	97ba                	add	a5,a5,a4
    8000790a:	639c                	ld	a5,0(a5)
    8000790c:	fef43423          	sd	a5,-24(s0)
    80007910:	fe843783          	ld	a5,-24(s0)
    80007914:	e399                	bnez	a5,8000791a <argfd+0x62>
    return -1;
    80007916:	57fd                	li	a5,-1
    80007918:	a015                	j	8000793c <argfd+0x84>
  if(pfd)
    8000791a:	fd043783          	ld	a5,-48(s0)
    8000791e:	c791                	beqz	a5,8000792a <argfd+0x72>
    *pfd = fd;
    80007920:	fe442703          	lw	a4,-28(s0)
    80007924:	fd043783          	ld	a5,-48(s0)
    80007928:	c398                	sw	a4,0(a5)
  if(pf)
    8000792a:	fc843783          	ld	a5,-56(s0)
    8000792e:	c791                	beqz	a5,8000793a <argfd+0x82>
    *pf = f;
    80007930:	fc843783          	ld	a5,-56(s0)
    80007934:	fe843703          	ld	a4,-24(s0)
    80007938:	e398                	sd	a4,0(a5)
  return 0;
    8000793a:	4781                	li	a5,0
}
    8000793c:	853e                	mv	a0,a5
    8000793e:	70e2                	ld	ra,56(sp)
    80007940:	7442                	ld	s0,48(sp)
    80007942:	6121                	addi	sp,sp,64
    80007944:	8082                	ret

0000000080007946 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007946:	7179                	addi	sp,sp,-48
    80007948:	f406                	sd	ra,40(sp)
    8000794a:	f022                	sd	s0,32(sp)
    8000794c:	1800                	addi	s0,sp,48
    8000794e:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007952:	ffffb097          	auipc	ra,0xffffb
    80007956:	06a080e7          	jalr	106(ra) # 800029bc <myproc>
    8000795a:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    8000795e:	fe042623          	sw	zero,-20(s0)
    80007962:	a825                	j	8000799a <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007964:	fe043703          	ld	a4,-32(s0)
    80007968:	fec42783          	lw	a5,-20(s0)
    8000796c:	07e9                	addi	a5,a5,26
    8000796e:	078e                	slli	a5,a5,0x3
    80007970:	97ba                	add	a5,a5,a4
    80007972:	639c                	ld	a5,0(a5)
    80007974:	ef91                	bnez	a5,80007990 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007976:	fe043703          	ld	a4,-32(s0)
    8000797a:	fec42783          	lw	a5,-20(s0)
    8000797e:	07e9                	addi	a5,a5,26
    80007980:	078e                	slli	a5,a5,0x3
    80007982:	97ba                	add	a5,a5,a4
    80007984:	fd843703          	ld	a4,-40(s0)
    80007988:	e398                	sd	a4,0(a5)
      return fd;
    8000798a:	fec42783          	lw	a5,-20(s0)
    8000798e:	a831                	j	800079aa <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007990:	fec42783          	lw	a5,-20(s0)
    80007994:	2785                	addiw	a5,a5,1
    80007996:	fef42623          	sw	a5,-20(s0)
    8000799a:	fec42783          	lw	a5,-20(s0)
    8000799e:	0007871b          	sext.w	a4,a5
    800079a2:	47bd                	li	a5,15
    800079a4:	fce7d0e3          	bge	a5,a4,80007964 <fdalloc+0x1e>
    }
  }
  return -1;
    800079a8:	57fd                	li	a5,-1
}
    800079aa:	853e                	mv	a0,a5
    800079ac:	70a2                	ld	ra,40(sp)
    800079ae:	7402                	ld	s0,32(sp)
    800079b0:	6145                	addi	sp,sp,48
    800079b2:	8082                	ret

00000000800079b4 <sys_dup>:

uint64
sys_dup(void)
{
    800079b4:	1101                	addi	sp,sp,-32
    800079b6:	ec06                	sd	ra,24(sp)
    800079b8:	e822                	sd	s0,16(sp)
    800079ba:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    800079bc:	fe040793          	addi	a5,s0,-32
    800079c0:	863e                	mv	a2,a5
    800079c2:	4581                	li	a1,0
    800079c4:	4501                	li	a0,0
    800079c6:	00000097          	auipc	ra,0x0
    800079ca:	ef2080e7          	jalr	-270(ra) # 800078b8 <argfd>
    800079ce:	87aa                	mv	a5,a0
    800079d0:	0007d463          	bgez	a5,800079d8 <sys_dup+0x24>
    return -1;
    800079d4:	57fd                	li	a5,-1
    800079d6:	a81d                	j	80007a0c <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    800079d8:	fe043783          	ld	a5,-32(s0)
    800079dc:	853e                	mv	a0,a5
    800079de:	00000097          	auipc	ra,0x0
    800079e2:	f68080e7          	jalr	-152(ra) # 80007946 <fdalloc>
    800079e6:	87aa                	mv	a5,a0
    800079e8:	fef42623          	sw	a5,-20(s0)
    800079ec:	fec42783          	lw	a5,-20(s0)
    800079f0:	2781                	sext.w	a5,a5
    800079f2:	0007d463          	bgez	a5,800079fa <sys_dup+0x46>
    return -1;
    800079f6:	57fd                	li	a5,-1
    800079f8:	a811                	j	80007a0c <sys_dup+0x58>
  filedup(f);
    800079fa:	fe043783          	ld	a5,-32(s0)
    800079fe:	853e                	mv	a0,a5
    80007a00:	fffff097          	auipc	ra,0xfffff
    80007a04:	ec0080e7          	jalr	-320(ra) # 800068c0 <filedup>
  return fd;
    80007a08:	fec42783          	lw	a5,-20(s0)
}
    80007a0c:	853e                	mv	a0,a5
    80007a0e:	60e2                	ld	ra,24(sp)
    80007a10:	6442                	ld	s0,16(sp)
    80007a12:	6105                	addi	sp,sp,32
    80007a14:	8082                	ret

0000000080007a16 <sys_read>:

uint64
sys_read(void)
{
    80007a16:	7179                	addi	sp,sp,-48
    80007a18:	f406                	sd	ra,40(sp)
    80007a1a:	f022                	sd	s0,32(sp)
    80007a1c:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007a1e:	fd840793          	addi	a5,s0,-40
    80007a22:	85be                	mv	a1,a5
    80007a24:	4505                	li	a0,1
    80007a26:	ffffd097          	auipc	ra,0xffffd
    80007a2a:	86a080e7          	jalr	-1942(ra) # 80004290 <argaddr>
  argint(2, &n);
    80007a2e:	fe440793          	addi	a5,s0,-28
    80007a32:	85be                	mv	a1,a5
    80007a34:	4509                	li	a0,2
    80007a36:	ffffd097          	auipc	ra,0xffffd
    80007a3a:	824080e7          	jalr	-2012(ra) # 8000425a <argint>
  if(argfd(0, 0, &f) < 0)
    80007a3e:	fe840793          	addi	a5,s0,-24
    80007a42:	863e                	mv	a2,a5
    80007a44:	4581                	li	a1,0
    80007a46:	4501                	li	a0,0
    80007a48:	00000097          	auipc	ra,0x0
    80007a4c:	e70080e7          	jalr	-400(ra) # 800078b8 <argfd>
    80007a50:	87aa                	mv	a5,a0
    80007a52:	0007d463          	bgez	a5,80007a5a <sys_read+0x44>
    return -1;
    80007a56:	57fd                	li	a5,-1
    80007a58:	a839                	j	80007a76 <sys_read+0x60>
  return fileread(f, p, n);
    80007a5a:	fe843783          	ld	a5,-24(s0)
    80007a5e:	fd843703          	ld	a4,-40(s0)
    80007a62:	fe442683          	lw	a3,-28(s0)
    80007a66:	8636                	mv	a2,a3
    80007a68:	85ba                	mv	a1,a4
    80007a6a:	853e                	mv	a0,a5
    80007a6c:	fffff097          	auipc	ra,0xfffff
    80007a70:	066080e7          	jalr	102(ra) # 80006ad2 <fileread>
    80007a74:	87aa                	mv	a5,a0
}
    80007a76:	853e                	mv	a0,a5
    80007a78:	70a2                	ld	ra,40(sp)
    80007a7a:	7402                	ld	s0,32(sp)
    80007a7c:	6145                	addi	sp,sp,48
    80007a7e:	8082                	ret

0000000080007a80 <sys_write>:

uint64
sys_write(void)
{
    80007a80:	7179                	addi	sp,sp,-48
    80007a82:	f406                	sd	ra,40(sp)
    80007a84:	f022                	sd	s0,32(sp)
    80007a86:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007a88:	fd840793          	addi	a5,s0,-40
    80007a8c:	85be                	mv	a1,a5
    80007a8e:	4505                	li	a0,1
    80007a90:	ffffd097          	auipc	ra,0xffffd
    80007a94:	800080e7          	jalr	-2048(ra) # 80004290 <argaddr>
  argint(2, &n);
    80007a98:	fe440793          	addi	a5,s0,-28
    80007a9c:	85be                	mv	a1,a5
    80007a9e:	4509                	li	a0,2
    80007aa0:	ffffc097          	auipc	ra,0xffffc
    80007aa4:	7ba080e7          	jalr	1978(ra) # 8000425a <argint>
  if(argfd(0, 0, &f) < 0)
    80007aa8:	fe840793          	addi	a5,s0,-24
    80007aac:	863e                	mv	a2,a5
    80007aae:	4581                	li	a1,0
    80007ab0:	4501                	li	a0,0
    80007ab2:	00000097          	auipc	ra,0x0
    80007ab6:	e06080e7          	jalr	-506(ra) # 800078b8 <argfd>
    80007aba:	87aa                	mv	a5,a0
    80007abc:	0007d463          	bgez	a5,80007ac4 <sys_write+0x44>
    return -1;
    80007ac0:	57fd                	li	a5,-1
    80007ac2:	a839                	j	80007ae0 <sys_write+0x60>

  return filewrite(f, p, n);
    80007ac4:	fe843783          	ld	a5,-24(s0)
    80007ac8:	fd843703          	ld	a4,-40(s0)
    80007acc:	fe442683          	lw	a3,-28(s0)
    80007ad0:	8636                	mv	a2,a3
    80007ad2:	85ba                	mv	a1,a4
    80007ad4:	853e                	mv	a0,a5
    80007ad6:	fffff097          	auipc	ra,0xfffff
    80007ada:	162080e7          	jalr	354(ra) # 80006c38 <filewrite>
    80007ade:	87aa                	mv	a5,a0
}
    80007ae0:	853e                	mv	a0,a5
    80007ae2:	70a2                	ld	ra,40(sp)
    80007ae4:	7402                	ld	s0,32(sp)
    80007ae6:	6145                	addi	sp,sp,48
    80007ae8:	8082                	ret

0000000080007aea <sys_close>:

uint64
sys_close(void)
{
    80007aea:	1101                	addi	sp,sp,-32
    80007aec:	ec06                	sd	ra,24(sp)
    80007aee:	e822                	sd	s0,16(sp)
    80007af0:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007af2:	fe040713          	addi	a4,s0,-32
    80007af6:	fec40793          	addi	a5,s0,-20
    80007afa:	863a                	mv	a2,a4
    80007afc:	85be                	mv	a1,a5
    80007afe:	4501                	li	a0,0
    80007b00:	00000097          	auipc	ra,0x0
    80007b04:	db8080e7          	jalr	-584(ra) # 800078b8 <argfd>
    80007b08:	87aa                	mv	a5,a0
    80007b0a:	0007d463          	bgez	a5,80007b12 <sys_close+0x28>
    return -1;
    80007b0e:	57fd                	li	a5,-1
    80007b10:	a02d                	j	80007b3a <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007b12:	ffffb097          	auipc	ra,0xffffb
    80007b16:	eaa080e7          	jalr	-342(ra) # 800029bc <myproc>
    80007b1a:	872a                	mv	a4,a0
    80007b1c:	fec42783          	lw	a5,-20(s0)
    80007b20:	07e9                	addi	a5,a5,26
    80007b22:	078e                	slli	a5,a5,0x3
    80007b24:	97ba                	add	a5,a5,a4
    80007b26:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007b2a:	fe043783          	ld	a5,-32(s0)
    80007b2e:	853e                	mv	a0,a5
    80007b30:	fffff097          	auipc	ra,0xfffff
    80007b34:	df6080e7          	jalr	-522(ra) # 80006926 <fileclose>
  return 0;
    80007b38:	4781                	li	a5,0
}
    80007b3a:	853e                	mv	a0,a5
    80007b3c:	60e2                	ld	ra,24(sp)
    80007b3e:	6442                	ld	s0,16(sp)
    80007b40:	6105                	addi	sp,sp,32
    80007b42:	8082                	ret

0000000080007b44 <sys_fstat>:

uint64
sys_fstat(void)
{
    80007b44:	1101                	addi	sp,sp,-32
    80007b46:	ec06                	sd	ra,24(sp)
    80007b48:	e822                	sd	s0,16(sp)
    80007b4a:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007b4c:	fe040793          	addi	a5,s0,-32
    80007b50:	85be                	mv	a1,a5
    80007b52:	4505                	li	a0,1
    80007b54:	ffffc097          	auipc	ra,0xffffc
    80007b58:	73c080e7          	jalr	1852(ra) # 80004290 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007b5c:	fe840793          	addi	a5,s0,-24
    80007b60:	863e                	mv	a2,a5
    80007b62:	4581                	li	a1,0
    80007b64:	4501                	li	a0,0
    80007b66:	00000097          	auipc	ra,0x0
    80007b6a:	d52080e7          	jalr	-686(ra) # 800078b8 <argfd>
    80007b6e:	87aa                	mv	a5,a0
    80007b70:	0007d463          	bgez	a5,80007b78 <sys_fstat+0x34>
    return -1;
    80007b74:	57fd                	li	a5,-1
    80007b76:	a821                	j	80007b8e <sys_fstat+0x4a>
  return filestat(f, st);
    80007b78:	fe843783          	ld	a5,-24(s0)
    80007b7c:	fe043703          	ld	a4,-32(s0)
    80007b80:	85ba                	mv	a1,a4
    80007b82:	853e                	mv	a0,a5
    80007b84:	fffff097          	auipc	ra,0xfffff
    80007b88:	eaa080e7          	jalr	-342(ra) # 80006a2e <filestat>
    80007b8c:	87aa                	mv	a5,a0
}
    80007b8e:	853e                	mv	a0,a5
    80007b90:	60e2                	ld	ra,24(sp)
    80007b92:	6442                	ld	s0,16(sp)
    80007b94:	6105                	addi	sp,sp,32
    80007b96:	8082                	ret

0000000080007b98 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007b98:	7169                	addi	sp,sp,-304
    80007b9a:	f606                	sd	ra,296(sp)
    80007b9c:	f222                	sd	s0,288(sp)
    80007b9e:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007ba0:	ed040793          	addi	a5,s0,-304
    80007ba4:	08000613          	li	a2,128
    80007ba8:	85be                	mv	a1,a5
    80007baa:	4501                	li	a0,0
    80007bac:	ffffc097          	auipc	ra,0xffffc
    80007bb0:	716080e7          	jalr	1814(ra) # 800042c2 <argstr>
    80007bb4:	87aa                	mv	a5,a0
    80007bb6:	0007cf63          	bltz	a5,80007bd4 <sys_link+0x3c>
    80007bba:	f5040793          	addi	a5,s0,-176
    80007bbe:	08000613          	li	a2,128
    80007bc2:	85be                	mv	a1,a5
    80007bc4:	4505                	li	a0,1
    80007bc6:	ffffc097          	auipc	ra,0xffffc
    80007bca:	6fc080e7          	jalr	1788(ra) # 800042c2 <argstr>
    80007bce:	87aa                	mv	a5,a0
    80007bd0:	0007d463          	bgez	a5,80007bd8 <sys_link+0x40>
    return -1;
    80007bd4:	57fd                	li	a5,-1
    80007bd6:	aab5                	j	80007d52 <sys_link+0x1ba>

  begin_op();
    80007bd8:	ffffe097          	auipc	ra,0xffffe
    80007bdc:	6b4080e7          	jalr	1716(ra) # 8000628c <begin_op>
  if((ip = namei(old)) == 0){
    80007be0:	ed040793          	addi	a5,s0,-304
    80007be4:	853e                	mv	a0,a5
    80007be6:	ffffe097          	auipc	ra,0xffffe
    80007bea:	342080e7          	jalr	834(ra) # 80005f28 <namei>
    80007bee:	fea43423          	sd	a0,-24(s0)
    80007bf2:	fe843783          	ld	a5,-24(s0)
    80007bf6:	e799                	bnez	a5,80007c04 <sys_link+0x6c>
    end_op();
    80007bf8:	ffffe097          	auipc	ra,0xffffe
    80007bfc:	756080e7          	jalr	1878(ra) # 8000634e <end_op>
    return -1;
    80007c00:	57fd                	li	a5,-1
    80007c02:	aa81                	j	80007d52 <sys_link+0x1ba>
  }

  ilock(ip);
    80007c04:	fe843503          	ld	a0,-24(s0)
    80007c08:	ffffd097          	auipc	ra,0xffffd
    80007c0c:	5fa080e7          	jalr	1530(ra) # 80005202 <ilock>
  if(ip->type == T_DIR){
    80007c10:	fe843783          	ld	a5,-24(s0)
    80007c14:	04479783          	lh	a5,68(a5)
    80007c18:	0007871b          	sext.w	a4,a5
    80007c1c:	4785                	li	a5,1
    80007c1e:	00f71e63          	bne	a4,a5,80007c3a <sys_link+0xa2>
    iunlockput(ip);
    80007c22:	fe843503          	ld	a0,-24(s0)
    80007c26:	ffffe097          	auipc	ra,0xffffe
    80007c2a:	83a080e7          	jalr	-1990(ra) # 80005460 <iunlockput>
    end_op();
    80007c2e:	ffffe097          	auipc	ra,0xffffe
    80007c32:	720080e7          	jalr	1824(ra) # 8000634e <end_op>
    return -1;
    80007c36:	57fd                	li	a5,-1
    80007c38:	aa29                	j	80007d52 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007c3a:	fe843783          	ld	a5,-24(s0)
    80007c3e:	04a79783          	lh	a5,74(a5)
    80007c42:	17c2                	slli	a5,a5,0x30
    80007c44:	93c1                	srli	a5,a5,0x30
    80007c46:	2785                	addiw	a5,a5,1
    80007c48:	17c2                	slli	a5,a5,0x30
    80007c4a:	93c1                	srli	a5,a5,0x30
    80007c4c:	0107971b          	slliw	a4,a5,0x10
    80007c50:	4107571b          	sraiw	a4,a4,0x10
    80007c54:	fe843783          	ld	a5,-24(s0)
    80007c58:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007c5c:	fe843503          	ld	a0,-24(s0)
    80007c60:	ffffd097          	auipc	ra,0xffffd
    80007c64:	352080e7          	jalr	850(ra) # 80004fb2 <iupdate>
  iunlock(ip);
    80007c68:	fe843503          	ld	a0,-24(s0)
    80007c6c:	ffffd097          	auipc	ra,0xffffd
    80007c70:	6ca080e7          	jalr	1738(ra) # 80005336 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007c74:	fd040713          	addi	a4,s0,-48
    80007c78:	f5040793          	addi	a5,s0,-176
    80007c7c:	85ba                	mv	a1,a4
    80007c7e:	853e                	mv	a0,a5
    80007c80:	ffffe097          	auipc	ra,0xffffe
    80007c84:	2d4080e7          	jalr	724(ra) # 80005f54 <nameiparent>
    80007c88:	fea43023          	sd	a0,-32(s0)
    80007c8c:	fe043783          	ld	a5,-32(s0)
    80007c90:	cba5                	beqz	a5,80007d00 <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007c92:	fe043503          	ld	a0,-32(s0)
    80007c96:	ffffd097          	auipc	ra,0xffffd
    80007c9a:	56c080e7          	jalr	1388(ra) # 80005202 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007c9e:	fe043783          	ld	a5,-32(s0)
    80007ca2:	4398                	lw	a4,0(a5)
    80007ca4:	fe843783          	ld	a5,-24(s0)
    80007ca8:	439c                	lw	a5,0(a5)
    80007caa:	02f71263          	bne	a4,a5,80007cce <sys_link+0x136>
    80007cae:	fe843783          	ld	a5,-24(s0)
    80007cb2:	43d8                	lw	a4,4(a5)
    80007cb4:	fd040793          	addi	a5,s0,-48
    80007cb8:	863a                	mv	a2,a4
    80007cba:	85be                	mv	a1,a5
    80007cbc:	fe043503          	ld	a0,-32(s0)
    80007cc0:	ffffe097          	auipc	ra,0xffffe
    80007cc4:	f5a080e7          	jalr	-166(ra) # 80005c1a <dirlink>
    80007cc8:	87aa                	mv	a5,a0
    80007cca:	0007d963          	bgez	a5,80007cdc <sys_link+0x144>
    iunlockput(dp);
    80007cce:	fe043503          	ld	a0,-32(s0)
    80007cd2:	ffffd097          	auipc	ra,0xffffd
    80007cd6:	78e080e7          	jalr	1934(ra) # 80005460 <iunlockput>
    goto bad;
    80007cda:	a025                	j	80007d02 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007cdc:	fe043503          	ld	a0,-32(s0)
    80007ce0:	ffffd097          	auipc	ra,0xffffd
    80007ce4:	780080e7          	jalr	1920(ra) # 80005460 <iunlockput>
  iput(ip);
    80007ce8:	fe843503          	ld	a0,-24(s0)
    80007cec:	ffffd097          	auipc	ra,0xffffd
    80007cf0:	6a4080e7          	jalr	1700(ra) # 80005390 <iput>

  end_op();
    80007cf4:	ffffe097          	auipc	ra,0xffffe
    80007cf8:	65a080e7          	jalr	1626(ra) # 8000634e <end_op>

  return 0;
    80007cfc:	4781                	li	a5,0
    80007cfe:	a891                	j	80007d52 <sys_link+0x1ba>
    goto bad;
    80007d00:	0001                	nop

bad:
  ilock(ip);
    80007d02:	fe843503          	ld	a0,-24(s0)
    80007d06:	ffffd097          	auipc	ra,0xffffd
    80007d0a:	4fc080e7          	jalr	1276(ra) # 80005202 <ilock>
  ip->nlink--;
    80007d0e:	fe843783          	ld	a5,-24(s0)
    80007d12:	04a79783          	lh	a5,74(a5)
    80007d16:	17c2                	slli	a5,a5,0x30
    80007d18:	93c1                	srli	a5,a5,0x30
    80007d1a:	37fd                	addiw	a5,a5,-1
    80007d1c:	17c2                	slli	a5,a5,0x30
    80007d1e:	93c1                	srli	a5,a5,0x30
    80007d20:	0107971b          	slliw	a4,a5,0x10
    80007d24:	4107571b          	sraiw	a4,a4,0x10
    80007d28:	fe843783          	ld	a5,-24(s0)
    80007d2c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d30:	fe843503          	ld	a0,-24(s0)
    80007d34:	ffffd097          	auipc	ra,0xffffd
    80007d38:	27e080e7          	jalr	638(ra) # 80004fb2 <iupdate>
  iunlockput(ip);
    80007d3c:	fe843503          	ld	a0,-24(s0)
    80007d40:	ffffd097          	auipc	ra,0xffffd
    80007d44:	720080e7          	jalr	1824(ra) # 80005460 <iunlockput>
  end_op();
    80007d48:	ffffe097          	auipc	ra,0xffffe
    80007d4c:	606080e7          	jalr	1542(ra) # 8000634e <end_op>
  return -1;
    80007d50:	57fd                	li	a5,-1
}
    80007d52:	853e                	mv	a0,a5
    80007d54:	70b2                	ld	ra,296(sp)
    80007d56:	7412                	ld	s0,288(sp)
    80007d58:	6155                	addi	sp,sp,304
    80007d5a:	8082                	ret

0000000080007d5c <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007d5c:	7139                	addi	sp,sp,-64
    80007d5e:	fc06                	sd	ra,56(sp)
    80007d60:	f822                	sd	s0,48(sp)
    80007d62:	0080                	addi	s0,sp,64
    80007d64:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007d68:	02000793          	li	a5,32
    80007d6c:	fef42623          	sw	a5,-20(s0)
    80007d70:	a0b1                	j	80007dbc <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007d72:	fd840793          	addi	a5,s0,-40
    80007d76:	fec42683          	lw	a3,-20(s0)
    80007d7a:	4741                	li	a4,16
    80007d7c:	863e                	mv	a2,a5
    80007d7e:	4581                	li	a1,0
    80007d80:	fc843503          	ld	a0,-56(s0)
    80007d84:	ffffe097          	auipc	ra,0xffffe
    80007d88:	a34080e7          	jalr	-1484(ra) # 800057b8 <readi>
    80007d8c:	87aa                	mv	a5,a0
    80007d8e:	873e                	mv	a4,a5
    80007d90:	47c1                	li	a5,16
    80007d92:	00f70a63          	beq	a4,a5,80007da6 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007d96:	00004517          	auipc	a0,0x4
    80007d9a:	88a50513          	addi	a0,a0,-1910 # 8000b620 <etext+0x620>
    80007d9e:	ffff9097          	auipc	ra,0xffff9
    80007da2:	eee080e7          	jalr	-274(ra) # 80000c8c <panic>
    if(de.inum != 0)
    80007da6:	fd845783          	lhu	a5,-40(s0)
    80007daa:	c399                	beqz	a5,80007db0 <isdirempty+0x54>
      return 0;
    80007dac:	4781                	li	a5,0
    80007dae:	a839                	j	80007dcc <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007db0:	fec42783          	lw	a5,-20(s0)
    80007db4:	27c1                	addiw	a5,a5,16
    80007db6:	2781                	sext.w	a5,a5
    80007db8:	fef42623          	sw	a5,-20(s0)
    80007dbc:	fc843783          	ld	a5,-56(s0)
    80007dc0:	47f8                	lw	a4,76(a5)
    80007dc2:	fec42783          	lw	a5,-20(s0)
    80007dc6:	fae7e6e3          	bltu	a5,a4,80007d72 <isdirempty+0x16>
  }
  return 1;
    80007dca:	4785                	li	a5,1
}
    80007dcc:	853e                	mv	a0,a5
    80007dce:	70e2                	ld	ra,56(sp)
    80007dd0:	7442                	ld	s0,48(sp)
    80007dd2:	6121                	addi	sp,sp,64
    80007dd4:	8082                	ret

0000000080007dd6 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007dd6:	7155                	addi	sp,sp,-208
    80007dd8:	e586                	sd	ra,200(sp)
    80007dda:	e1a2                	sd	s0,192(sp)
    80007ddc:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007dde:	f4040793          	addi	a5,s0,-192
    80007de2:	08000613          	li	a2,128
    80007de6:	85be                	mv	a1,a5
    80007de8:	4501                	li	a0,0
    80007dea:	ffffc097          	auipc	ra,0xffffc
    80007dee:	4d8080e7          	jalr	1240(ra) # 800042c2 <argstr>
    80007df2:	87aa                	mv	a5,a0
    80007df4:	0007d463          	bgez	a5,80007dfc <sys_unlink+0x26>
    return -1;
    80007df8:	57fd                	li	a5,-1
    80007dfa:	a2ed                	j	80007fe4 <sys_unlink+0x20e>

  begin_op();
    80007dfc:	ffffe097          	auipc	ra,0xffffe
    80007e00:	490080e7          	jalr	1168(ra) # 8000628c <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007e04:	fc040713          	addi	a4,s0,-64
    80007e08:	f4040793          	addi	a5,s0,-192
    80007e0c:	85ba                	mv	a1,a4
    80007e0e:	853e                	mv	a0,a5
    80007e10:	ffffe097          	auipc	ra,0xffffe
    80007e14:	144080e7          	jalr	324(ra) # 80005f54 <nameiparent>
    80007e18:	fea43423          	sd	a0,-24(s0)
    80007e1c:	fe843783          	ld	a5,-24(s0)
    80007e20:	e799                	bnez	a5,80007e2e <sys_unlink+0x58>
    end_op();
    80007e22:	ffffe097          	auipc	ra,0xffffe
    80007e26:	52c080e7          	jalr	1324(ra) # 8000634e <end_op>
    return -1;
    80007e2a:	57fd                	li	a5,-1
    80007e2c:	aa65                	j	80007fe4 <sys_unlink+0x20e>
  }

  ilock(dp);
    80007e2e:	fe843503          	ld	a0,-24(s0)
    80007e32:	ffffd097          	auipc	ra,0xffffd
    80007e36:	3d0080e7          	jalr	976(ra) # 80005202 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007e3a:	fc040793          	addi	a5,s0,-64
    80007e3e:	00003597          	auipc	a1,0x3
    80007e42:	7fa58593          	addi	a1,a1,2042 # 8000b638 <etext+0x638>
    80007e46:	853e                	mv	a0,a5
    80007e48:	ffffe097          	auipc	ra,0xffffe
    80007e4c:	cbc080e7          	jalr	-836(ra) # 80005b04 <namecmp>
    80007e50:	87aa                	mv	a5,a0
    80007e52:	16078b63          	beqz	a5,80007fc8 <sys_unlink+0x1f2>
    80007e56:	fc040793          	addi	a5,s0,-64
    80007e5a:	00003597          	auipc	a1,0x3
    80007e5e:	7e658593          	addi	a1,a1,2022 # 8000b640 <etext+0x640>
    80007e62:	853e                	mv	a0,a5
    80007e64:	ffffe097          	auipc	ra,0xffffe
    80007e68:	ca0080e7          	jalr	-864(ra) # 80005b04 <namecmp>
    80007e6c:	87aa                	mv	a5,a0
    80007e6e:	14078d63          	beqz	a5,80007fc8 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007e72:	f3c40713          	addi	a4,s0,-196
    80007e76:	fc040793          	addi	a5,s0,-64
    80007e7a:	863a                	mv	a2,a4
    80007e7c:	85be                	mv	a1,a5
    80007e7e:	fe843503          	ld	a0,-24(s0)
    80007e82:	ffffe097          	auipc	ra,0xffffe
    80007e86:	cb0080e7          	jalr	-848(ra) # 80005b32 <dirlookup>
    80007e8a:	fea43023          	sd	a0,-32(s0)
    80007e8e:	fe043783          	ld	a5,-32(s0)
    80007e92:	12078d63          	beqz	a5,80007fcc <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007e96:	fe043503          	ld	a0,-32(s0)
    80007e9a:	ffffd097          	auipc	ra,0xffffd
    80007e9e:	368080e7          	jalr	872(ra) # 80005202 <ilock>

  if(ip->nlink < 1)
    80007ea2:	fe043783          	ld	a5,-32(s0)
    80007ea6:	04a79783          	lh	a5,74(a5)
    80007eaa:	2781                	sext.w	a5,a5
    80007eac:	00f04a63          	bgtz	a5,80007ec0 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007eb0:	00003517          	auipc	a0,0x3
    80007eb4:	79850513          	addi	a0,a0,1944 # 8000b648 <etext+0x648>
    80007eb8:	ffff9097          	auipc	ra,0xffff9
    80007ebc:	dd4080e7          	jalr	-556(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007ec0:	fe043783          	ld	a5,-32(s0)
    80007ec4:	04479783          	lh	a5,68(a5)
    80007ec8:	0007871b          	sext.w	a4,a5
    80007ecc:	4785                	li	a5,1
    80007ece:	02f71163          	bne	a4,a5,80007ef0 <sys_unlink+0x11a>
    80007ed2:	fe043503          	ld	a0,-32(s0)
    80007ed6:	00000097          	auipc	ra,0x0
    80007eda:	e86080e7          	jalr	-378(ra) # 80007d5c <isdirempty>
    80007ede:	87aa                	mv	a5,a0
    80007ee0:	eb81                	bnez	a5,80007ef0 <sys_unlink+0x11a>
    iunlockput(ip);
    80007ee2:	fe043503          	ld	a0,-32(s0)
    80007ee6:	ffffd097          	auipc	ra,0xffffd
    80007eea:	57a080e7          	jalr	1402(ra) # 80005460 <iunlockput>
    goto bad;
    80007eee:	a0c5                	j	80007fce <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007ef0:	fd040793          	addi	a5,s0,-48
    80007ef4:	4641                	li	a2,16
    80007ef6:	4581                	li	a1,0
    80007ef8:	853e                	mv	a0,a5
    80007efa:	ffff9097          	auipc	ra,0xffff9
    80007efe:	604080e7          	jalr	1540(ra) # 800014fe <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007f02:	fd040793          	addi	a5,s0,-48
    80007f06:	f3c42683          	lw	a3,-196(s0)
    80007f0a:	4741                	li	a4,16
    80007f0c:	863e                	mv	a2,a5
    80007f0e:	4581                	li	a1,0
    80007f10:	fe843503          	ld	a0,-24(s0)
    80007f14:	ffffe097          	auipc	ra,0xffffe
    80007f18:	a3c080e7          	jalr	-1476(ra) # 80005950 <writei>
    80007f1c:	87aa                	mv	a5,a0
    80007f1e:	873e                	mv	a4,a5
    80007f20:	47c1                	li	a5,16
    80007f22:	00f70a63          	beq	a4,a5,80007f36 <sys_unlink+0x160>
    panic("unlink: writei");
    80007f26:	00003517          	auipc	a0,0x3
    80007f2a:	73a50513          	addi	a0,a0,1850 # 8000b660 <etext+0x660>
    80007f2e:	ffff9097          	auipc	ra,0xffff9
    80007f32:	d5e080e7          	jalr	-674(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    80007f36:	fe043783          	ld	a5,-32(s0)
    80007f3a:	04479783          	lh	a5,68(a5)
    80007f3e:	0007871b          	sext.w	a4,a5
    80007f42:	4785                	li	a5,1
    80007f44:	02f71963          	bne	a4,a5,80007f76 <sys_unlink+0x1a0>
    dp->nlink--;
    80007f48:	fe843783          	ld	a5,-24(s0)
    80007f4c:	04a79783          	lh	a5,74(a5)
    80007f50:	17c2                	slli	a5,a5,0x30
    80007f52:	93c1                	srli	a5,a5,0x30
    80007f54:	37fd                	addiw	a5,a5,-1
    80007f56:	17c2                	slli	a5,a5,0x30
    80007f58:	93c1                	srli	a5,a5,0x30
    80007f5a:	0107971b          	slliw	a4,a5,0x10
    80007f5e:	4107571b          	sraiw	a4,a4,0x10
    80007f62:	fe843783          	ld	a5,-24(s0)
    80007f66:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80007f6a:	fe843503          	ld	a0,-24(s0)
    80007f6e:	ffffd097          	auipc	ra,0xffffd
    80007f72:	044080e7          	jalr	68(ra) # 80004fb2 <iupdate>
  }
  iunlockput(dp);
    80007f76:	fe843503          	ld	a0,-24(s0)
    80007f7a:	ffffd097          	auipc	ra,0xffffd
    80007f7e:	4e6080e7          	jalr	1254(ra) # 80005460 <iunlockput>

  ip->nlink--;
    80007f82:	fe043783          	ld	a5,-32(s0)
    80007f86:	04a79783          	lh	a5,74(a5)
    80007f8a:	17c2                	slli	a5,a5,0x30
    80007f8c:	93c1                	srli	a5,a5,0x30
    80007f8e:	37fd                	addiw	a5,a5,-1
    80007f90:	17c2                	slli	a5,a5,0x30
    80007f92:	93c1                	srli	a5,a5,0x30
    80007f94:	0107971b          	slliw	a4,a5,0x10
    80007f98:	4107571b          	sraiw	a4,a4,0x10
    80007f9c:	fe043783          	ld	a5,-32(s0)
    80007fa0:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007fa4:	fe043503          	ld	a0,-32(s0)
    80007fa8:	ffffd097          	auipc	ra,0xffffd
    80007fac:	00a080e7          	jalr	10(ra) # 80004fb2 <iupdate>
  iunlockput(ip);
    80007fb0:	fe043503          	ld	a0,-32(s0)
    80007fb4:	ffffd097          	auipc	ra,0xffffd
    80007fb8:	4ac080e7          	jalr	1196(ra) # 80005460 <iunlockput>

  end_op();
    80007fbc:	ffffe097          	auipc	ra,0xffffe
    80007fc0:	392080e7          	jalr	914(ra) # 8000634e <end_op>

  return 0;
    80007fc4:	4781                	li	a5,0
    80007fc6:	a839                	j	80007fe4 <sys_unlink+0x20e>
    goto bad;
    80007fc8:	0001                	nop
    80007fca:	a011                	j	80007fce <sys_unlink+0x1f8>
    goto bad;
    80007fcc:	0001                	nop

bad:
  iunlockput(dp);
    80007fce:	fe843503          	ld	a0,-24(s0)
    80007fd2:	ffffd097          	auipc	ra,0xffffd
    80007fd6:	48e080e7          	jalr	1166(ra) # 80005460 <iunlockput>
  end_op();
    80007fda:	ffffe097          	auipc	ra,0xffffe
    80007fde:	374080e7          	jalr	884(ra) # 8000634e <end_op>
  return -1;
    80007fe2:	57fd                	li	a5,-1
}
    80007fe4:	853e                	mv	a0,a5
    80007fe6:	60ae                	ld	ra,200(sp)
    80007fe8:	640e                	ld	s0,192(sp)
    80007fea:	6169                	addi	sp,sp,208
    80007fec:	8082                	ret

0000000080007fee <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80007fee:	7139                	addi	sp,sp,-64
    80007ff0:	fc06                	sd	ra,56(sp)
    80007ff2:	f822                	sd	s0,48(sp)
    80007ff4:	0080                	addi	s0,sp,64
    80007ff6:	fca43423          	sd	a0,-56(s0)
    80007ffa:	87ae                	mv	a5,a1
    80007ffc:	8736                	mv	a4,a3
    80007ffe:	fcf41323          	sh	a5,-58(s0)
    80008002:	87b2                	mv	a5,a2
    80008004:	fcf41223          	sh	a5,-60(s0)
    80008008:	87ba                	mv	a5,a4
    8000800a:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    8000800e:	fd040793          	addi	a5,s0,-48
    80008012:	85be                	mv	a1,a5
    80008014:	fc843503          	ld	a0,-56(s0)
    80008018:	ffffe097          	auipc	ra,0xffffe
    8000801c:	f3c080e7          	jalr	-196(ra) # 80005f54 <nameiparent>
    80008020:	fea43423          	sd	a0,-24(s0)
    80008024:	fe843783          	ld	a5,-24(s0)
    80008028:	e399                	bnez	a5,8000802e <create+0x40>
    return 0;
    8000802a:	4781                	li	a5,0
    8000802c:	a2ed                	j	80008216 <create+0x228>

  ilock(dp);
    8000802e:	fe843503          	ld	a0,-24(s0)
    80008032:	ffffd097          	auipc	ra,0xffffd
    80008036:	1d0080e7          	jalr	464(ra) # 80005202 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    8000803a:	fd040793          	addi	a5,s0,-48
    8000803e:	4601                	li	a2,0
    80008040:	85be                	mv	a1,a5
    80008042:	fe843503          	ld	a0,-24(s0)
    80008046:	ffffe097          	auipc	ra,0xffffe
    8000804a:	aec080e7          	jalr	-1300(ra) # 80005b32 <dirlookup>
    8000804e:	fea43023          	sd	a0,-32(s0)
    80008052:	fe043783          	ld	a5,-32(s0)
    80008056:	c3ad                	beqz	a5,800080b8 <create+0xca>
    iunlockput(dp);
    80008058:	fe843503          	ld	a0,-24(s0)
    8000805c:	ffffd097          	auipc	ra,0xffffd
    80008060:	404080e7          	jalr	1028(ra) # 80005460 <iunlockput>
    ilock(ip);
    80008064:	fe043503          	ld	a0,-32(s0)
    80008068:	ffffd097          	auipc	ra,0xffffd
    8000806c:	19a080e7          	jalr	410(ra) # 80005202 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80008070:	fc641783          	lh	a5,-58(s0)
    80008074:	0007871b          	sext.w	a4,a5
    80008078:	4789                	li	a5,2
    8000807a:	02f71763          	bne	a4,a5,800080a8 <create+0xba>
    8000807e:	fe043783          	ld	a5,-32(s0)
    80008082:	04479783          	lh	a5,68(a5)
    80008086:	0007871b          	sext.w	a4,a5
    8000808a:	4789                	li	a5,2
    8000808c:	00f70b63          	beq	a4,a5,800080a2 <create+0xb4>
    80008090:	fe043783          	ld	a5,-32(s0)
    80008094:	04479783          	lh	a5,68(a5)
    80008098:	0007871b          	sext.w	a4,a5
    8000809c:	478d                	li	a5,3
    8000809e:	00f71563          	bne	a4,a5,800080a8 <create+0xba>
      return ip;
    800080a2:	fe043783          	ld	a5,-32(s0)
    800080a6:	aa85                	j	80008216 <create+0x228>
    iunlockput(ip);
    800080a8:	fe043503          	ld	a0,-32(s0)
    800080ac:	ffffd097          	auipc	ra,0xffffd
    800080b0:	3b4080e7          	jalr	948(ra) # 80005460 <iunlockput>
    return 0;
    800080b4:	4781                	li	a5,0
    800080b6:	a285                	j	80008216 <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    800080b8:	fe843783          	ld	a5,-24(s0)
    800080bc:	439c                	lw	a5,0(a5)
    800080be:	fc641703          	lh	a4,-58(s0)
    800080c2:	85ba                	mv	a1,a4
    800080c4:	853e                	mv	a0,a5
    800080c6:	ffffd097          	auipc	ra,0xffffd
    800080ca:	dee080e7          	jalr	-530(ra) # 80004eb4 <ialloc>
    800080ce:	fea43023          	sd	a0,-32(s0)
    800080d2:	fe043783          	ld	a5,-32(s0)
    800080d6:	eb89                	bnez	a5,800080e8 <create+0xfa>
    iunlockput(dp);
    800080d8:	fe843503          	ld	a0,-24(s0)
    800080dc:	ffffd097          	auipc	ra,0xffffd
    800080e0:	384080e7          	jalr	900(ra) # 80005460 <iunlockput>
    return 0;
    800080e4:	4781                	li	a5,0
    800080e6:	aa05                	j	80008216 <create+0x228>
  }

  ilock(ip);
    800080e8:	fe043503          	ld	a0,-32(s0)
    800080ec:	ffffd097          	auipc	ra,0xffffd
    800080f0:	116080e7          	jalr	278(ra) # 80005202 <ilock>
  ip->major = major;
    800080f4:	fe043783          	ld	a5,-32(s0)
    800080f8:	fc445703          	lhu	a4,-60(s0)
    800080fc:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80008100:	fe043783          	ld	a5,-32(s0)
    80008104:	fc245703          	lhu	a4,-62(s0)
    80008108:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    8000810c:	fe043783          	ld	a5,-32(s0)
    80008110:	4705                	li	a4,1
    80008112:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008116:	fe043503          	ld	a0,-32(s0)
    8000811a:	ffffd097          	auipc	ra,0xffffd
    8000811e:	e98080e7          	jalr	-360(ra) # 80004fb2 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008122:	fc641783          	lh	a5,-58(s0)
    80008126:	0007871b          	sext.w	a4,a5
    8000812a:	4785                	li	a5,1
    8000812c:	04f71463          	bne	a4,a5,80008174 <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80008130:	fe043783          	ld	a5,-32(s0)
    80008134:	43dc                	lw	a5,4(a5)
    80008136:	863e                	mv	a2,a5
    80008138:	00003597          	auipc	a1,0x3
    8000813c:	50058593          	addi	a1,a1,1280 # 8000b638 <etext+0x638>
    80008140:	fe043503          	ld	a0,-32(s0)
    80008144:	ffffe097          	auipc	ra,0xffffe
    80008148:	ad6080e7          	jalr	-1322(ra) # 80005c1a <dirlink>
    8000814c:	87aa                	mv	a5,a0
    8000814e:	0807ca63          	bltz	a5,800081e2 <create+0x1f4>
    80008152:	fe843783          	ld	a5,-24(s0)
    80008156:	43dc                	lw	a5,4(a5)
    80008158:	863e                	mv	a2,a5
    8000815a:	00003597          	auipc	a1,0x3
    8000815e:	4e658593          	addi	a1,a1,1254 # 8000b640 <etext+0x640>
    80008162:	fe043503          	ld	a0,-32(s0)
    80008166:	ffffe097          	auipc	ra,0xffffe
    8000816a:	ab4080e7          	jalr	-1356(ra) # 80005c1a <dirlink>
    8000816e:	87aa                	mv	a5,a0
    80008170:	0607c963          	bltz	a5,800081e2 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80008174:	fe043783          	ld	a5,-32(s0)
    80008178:	43d8                	lw	a4,4(a5)
    8000817a:	fd040793          	addi	a5,s0,-48
    8000817e:	863a                	mv	a2,a4
    80008180:	85be                	mv	a1,a5
    80008182:	fe843503          	ld	a0,-24(s0)
    80008186:	ffffe097          	auipc	ra,0xffffe
    8000818a:	a94080e7          	jalr	-1388(ra) # 80005c1a <dirlink>
    8000818e:	87aa                	mv	a5,a0
    80008190:	0407cb63          	bltz	a5,800081e6 <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    80008194:	fc641783          	lh	a5,-58(s0)
    80008198:	0007871b          	sext.w	a4,a5
    8000819c:	4785                	li	a5,1
    8000819e:	02f71963          	bne	a4,a5,800081d0 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    800081a2:	fe843783          	ld	a5,-24(s0)
    800081a6:	04a79783          	lh	a5,74(a5)
    800081aa:	17c2                	slli	a5,a5,0x30
    800081ac:	93c1                	srli	a5,a5,0x30
    800081ae:	2785                	addiw	a5,a5,1
    800081b0:	17c2                	slli	a5,a5,0x30
    800081b2:	93c1                	srli	a5,a5,0x30
    800081b4:	0107971b          	slliw	a4,a5,0x10
    800081b8:	4107571b          	sraiw	a4,a4,0x10
    800081bc:	fe843783          	ld	a5,-24(s0)
    800081c0:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800081c4:	fe843503          	ld	a0,-24(s0)
    800081c8:	ffffd097          	auipc	ra,0xffffd
    800081cc:	dea080e7          	jalr	-534(ra) # 80004fb2 <iupdate>
  }

  iunlockput(dp);
    800081d0:	fe843503          	ld	a0,-24(s0)
    800081d4:	ffffd097          	auipc	ra,0xffffd
    800081d8:	28c080e7          	jalr	652(ra) # 80005460 <iunlockput>

  return ip;
    800081dc:	fe043783          	ld	a5,-32(s0)
    800081e0:	a81d                	j	80008216 <create+0x228>
      goto fail;
    800081e2:	0001                	nop
    800081e4:	a011                	j	800081e8 <create+0x1fa>
    goto fail;
    800081e6:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    800081e8:	fe043783          	ld	a5,-32(s0)
    800081ec:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    800081f0:	fe043503          	ld	a0,-32(s0)
    800081f4:	ffffd097          	auipc	ra,0xffffd
    800081f8:	dbe080e7          	jalr	-578(ra) # 80004fb2 <iupdate>
  iunlockput(ip);
    800081fc:	fe043503          	ld	a0,-32(s0)
    80008200:	ffffd097          	auipc	ra,0xffffd
    80008204:	260080e7          	jalr	608(ra) # 80005460 <iunlockput>
  iunlockput(dp);
    80008208:	fe843503          	ld	a0,-24(s0)
    8000820c:	ffffd097          	auipc	ra,0xffffd
    80008210:	254080e7          	jalr	596(ra) # 80005460 <iunlockput>
  return 0;
    80008214:	4781                	li	a5,0
}
    80008216:	853e                	mv	a0,a5
    80008218:	70e2                	ld	ra,56(sp)
    8000821a:	7442                	ld	s0,48(sp)
    8000821c:	6121                	addi	sp,sp,64
    8000821e:	8082                	ret

0000000080008220 <sys_open>:

uint64
sys_open(void)
{
    80008220:	7131                	addi	sp,sp,-192
    80008222:	fd06                	sd	ra,184(sp)
    80008224:	f922                	sd	s0,176(sp)
    80008226:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    80008228:	f4c40793          	addi	a5,s0,-180
    8000822c:	85be                	mv	a1,a5
    8000822e:	4505                	li	a0,1
    80008230:	ffffc097          	auipc	ra,0xffffc
    80008234:	02a080e7          	jalr	42(ra) # 8000425a <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    80008238:	f5040793          	addi	a5,s0,-176
    8000823c:	08000613          	li	a2,128
    80008240:	85be                	mv	a1,a5
    80008242:	4501                	li	a0,0
    80008244:	ffffc097          	auipc	ra,0xffffc
    80008248:	07e080e7          	jalr	126(ra) # 800042c2 <argstr>
    8000824c:	87aa                	mv	a5,a0
    8000824e:	fef42223          	sw	a5,-28(s0)
    80008252:	fe442783          	lw	a5,-28(s0)
    80008256:	2781                	sext.w	a5,a5
    80008258:	0007d463          	bgez	a5,80008260 <sys_open+0x40>
    return -1;
    8000825c:	57fd                	li	a5,-1
    8000825e:	a429                	j	80008468 <sys_open+0x248>

  begin_op();
    80008260:	ffffe097          	auipc	ra,0xffffe
    80008264:	02c080e7          	jalr	44(ra) # 8000628c <begin_op>

  if(omode & O_CREATE){
    80008268:	f4c42783          	lw	a5,-180(s0)
    8000826c:	2007f793          	andi	a5,a5,512
    80008270:	2781                	sext.w	a5,a5
    80008272:	c795                	beqz	a5,8000829e <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    80008274:	f5040793          	addi	a5,s0,-176
    80008278:	4681                	li	a3,0
    8000827a:	4601                	li	a2,0
    8000827c:	4589                	li	a1,2
    8000827e:	853e                	mv	a0,a5
    80008280:	00000097          	auipc	ra,0x0
    80008284:	d6e080e7          	jalr	-658(ra) # 80007fee <create>
    80008288:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    8000828c:	fe843783          	ld	a5,-24(s0)
    80008290:	e7bd                	bnez	a5,800082fe <sys_open+0xde>
      end_op();
    80008292:	ffffe097          	auipc	ra,0xffffe
    80008296:	0bc080e7          	jalr	188(ra) # 8000634e <end_op>
      return -1;
    8000829a:	57fd                	li	a5,-1
    8000829c:	a2f1                	j	80008468 <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    8000829e:	f5040793          	addi	a5,s0,-176
    800082a2:	853e                	mv	a0,a5
    800082a4:	ffffe097          	auipc	ra,0xffffe
    800082a8:	c84080e7          	jalr	-892(ra) # 80005f28 <namei>
    800082ac:	fea43423          	sd	a0,-24(s0)
    800082b0:	fe843783          	ld	a5,-24(s0)
    800082b4:	e799                	bnez	a5,800082c2 <sys_open+0xa2>
      end_op();
    800082b6:	ffffe097          	auipc	ra,0xffffe
    800082ba:	098080e7          	jalr	152(ra) # 8000634e <end_op>
      return -1;
    800082be:	57fd                	li	a5,-1
    800082c0:	a265                	j	80008468 <sys_open+0x248>
    }
    ilock(ip);
    800082c2:	fe843503          	ld	a0,-24(s0)
    800082c6:	ffffd097          	auipc	ra,0xffffd
    800082ca:	f3c080e7          	jalr	-196(ra) # 80005202 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800082ce:	fe843783          	ld	a5,-24(s0)
    800082d2:	04479783          	lh	a5,68(a5)
    800082d6:	0007871b          	sext.w	a4,a5
    800082da:	4785                	li	a5,1
    800082dc:	02f71163          	bne	a4,a5,800082fe <sys_open+0xde>
    800082e0:	f4c42783          	lw	a5,-180(s0)
    800082e4:	cf89                	beqz	a5,800082fe <sys_open+0xde>
      iunlockput(ip);
    800082e6:	fe843503          	ld	a0,-24(s0)
    800082ea:	ffffd097          	auipc	ra,0xffffd
    800082ee:	176080e7          	jalr	374(ra) # 80005460 <iunlockput>
      end_op();
    800082f2:	ffffe097          	auipc	ra,0xffffe
    800082f6:	05c080e7          	jalr	92(ra) # 8000634e <end_op>
      return -1;
    800082fa:	57fd                	li	a5,-1
    800082fc:	a2b5                	j	80008468 <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800082fe:	fe843783          	ld	a5,-24(s0)
    80008302:	04479783          	lh	a5,68(a5)
    80008306:	0007871b          	sext.w	a4,a5
    8000830a:	478d                	li	a5,3
    8000830c:	02f71e63          	bne	a4,a5,80008348 <sys_open+0x128>
    80008310:	fe843783          	ld	a5,-24(s0)
    80008314:	04679783          	lh	a5,70(a5)
    80008318:	2781                	sext.w	a5,a5
    8000831a:	0007cb63          	bltz	a5,80008330 <sys_open+0x110>
    8000831e:	fe843783          	ld	a5,-24(s0)
    80008322:	04679783          	lh	a5,70(a5)
    80008326:	0007871b          	sext.w	a4,a5
    8000832a:	47a5                	li	a5,9
    8000832c:	00e7de63          	bge	a5,a4,80008348 <sys_open+0x128>
    iunlockput(ip);
    80008330:	fe843503          	ld	a0,-24(s0)
    80008334:	ffffd097          	auipc	ra,0xffffd
    80008338:	12c080e7          	jalr	300(ra) # 80005460 <iunlockput>
    end_op();
    8000833c:	ffffe097          	auipc	ra,0xffffe
    80008340:	012080e7          	jalr	18(ra) # 8000634e <end_op>
    return -1;
    80008344:	57fd                	li	a5,-1
    80008346:	a20d                	j	80008468 <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008348:	ffffe097          	auipc	ra,0xffffe
    8000834c:	4f4080e7          	jalr	1268(ra) # 8000683c <filealloc>
    80008350:	fca43c23          	sd	a0,-40(s0)
    80008354:	fd843783          	ld	a5,-40(s0)
    80008358:	cf99                	beqz	a5,80008376 <sys_open+0x156>
    8000835a:	fd843503          	ld	a0,-40(s0)
    8000835e:	fffff097          	auipc	ra,0xfffff
    80008362:	5e8080e7          	jalr	1512(ra) # 80007946 <fdalloc>
    80008366:	87aa                	mv	a5,a0
    80008368:	fcf42a23          	sw	a5,-44(s0)
    8000836c:	fd442783          	lw	a5,-44(s0)
    80008370:	2781                	sext.w	a5,a5
    80008372:	0207d763          	bgez	a5,800083a0 <sys_open+0x180>
    if(f)
    80008376:	fd843783          	ld	a5,-40(s0)
    8000837a:	c799                	beqz	a5,80008388 <sys_open+0x168>
      fileclose(f);
    8000837c:	fd843503          	ld	a0,-40(s0)
    80008380:	ffffe097          	auipc	ra,0xffffe
    80008384:	5a6080e7          	jalr	1446(ra) # 80006926 <fileclose>
    iunlockput(ip);
    80008388:	fe843503          	ld	a0,-24(s0)
    8000838c:	ffffd097          	auipc	ra,0xffffd
    80008390:	0d4080e7          	jalr	212(ra) # 80005460 <iunlockput>
    end_op();
    80008394:	ffffe097          	auipc	ra,0xffffe
    80008398:	fba080e7          	jalr	-70(ra) # 8000634e <end_op>
    return -1;
    8000839c:	57fd                	li	a5,-1
    8000839e:	a0e9                	j	80008468 <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    800083a0:	fe843783          	ld	a5,-24(s0)
    800083a4:	04479783          	lh	a5,68(a5)
    800083a8:	0007871b          	sext.w	a4,a5
    800083ac:	478d                	li	a5,3
    800083ae:	00f71f63          	bne	a4,a5,800083cc <sys_open+0x1ac>
    f->type = FD_DEVICE;
    800083b2:	fd843783          	ld	a5,-40(s0)
    800083b6:	470d                	li	a4,3
    800083b8:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800083ba:	fe843783          	ld	a5,-24(s0)
    800083be:	04679703          	lh	a4,70(a5)
    800083c2:	fd843783          	ld	a5,-40(s0)
    800083c6:	02e79223          	sh	a4,36(a5)
    800083ca:	a809                	j	800083dc <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    800083cc:	fd843783          	ld	a5,-40(s0)
    800083d0:	4709                	li	a4,2
    800083d2:	c398                	sw	a4,0(a5)
    f->off = 0;
    800083d4:	fd843783          	ld	a5,-40(s0)
    800083d8:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    800083dc:	fd843783          	ld	a5,-40(s0)
    800083e0:	fe843703          	ld	a4,-24(s0)
    800083e4:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800083e6:	f4c42783          	lw	a5,-180(s0)
    800083ea:	8b85                	andi	a5,a5,1
    800083ec:	2781                	sext.w	a5,a5
    800083ee:	0017b793          	seqz	a5,a5
    800083f2:	0ff7f793          	andi	a5,a5,255
    800083f6:	873e                	mv	a4,a5
    800083f8:	fd843783          	ld	a5,-40(s0)
    800083fc:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008400:	f4c42783          	lw	a5,-180(s0)
    80008404:	8b85                	andi	a5,a5,1
    80008406:	2781                	sext.w	a5,a5
    80008408:	e791                	bnez	a5,80008414 <sys_open+0x1f4>
    8000840a:	f4c42783          	lw	a5,-180(s0)
    8000840e:	8b89                	andi	a5,a5,2
    80008410:	2781                	sext.w	a5,a5
    80008412:	c399                	beqz	a5,80008418 <sys_open+0x1f8>
    80008414:	4785                	li	a5,1
    80008416:	a011                	j	8000841a <sys_open+0x1fa>
    80008418:	4781                	li	a5,0
    8000841a:	0ff7f713          	andi	a4,a5,255
    8000841e:	fd843783          	ld	a5,-40(s0)
    80008422:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008426:	f4c42783          	lw	a5,-180(s0)
    8000842a:	4007f793          	andi	a5,a5,1024
    8000842e:	2781                	sext.w	a5,a5
    80008430:	c385                	beqz	a5,80008450 <sys_open+0x230>
    80008432:	fe843783          	ld	a5,-24(s0)
    80008436:	04479783          	lh	a5,68(a5)
    8000843a:	0007871b          	sext.w	a4,a5
    8000843e:	4789                	li	a5,2
    80008440:	00f71863          	bne	a4,a5,80008450 <sys_open+0x230>
    itrunc(ip);
    80008444:	fe843503          	ld	a0,-24(s0)
    80008448:	ffffd097          	auipc	ra,0xffffd
    8000844c:	1c2080e7          	jalr	450(ra) # 8000560a <itrunc>
  }

  iunlock(ip);
    80008450:	fe843503          	ld	a0,-24(s0)
    80008454:	ffffd097          	auipc	ra,0xffffd
    80008458:	ee2080e7          	jalr	-286(ra) # 80005336 <iunlock>
  end_op();
    8000845c:	ffffe097          	auipc	ra,0xffffe
    80008460:	ef2080e7          	jalr	-270(ra) # 8000634e <end_op>

  return fd;
    80008464:	fd442783          	lw	a5,-44(s0)
}
    80008468:	853e                	mv	a0,a5
    8000846a:	70ea                	ld	ra,184(sp)
    8000846c:	744a                	ld	s0,176(sp)
    8000846e:	6129                	addi	sp,sp,192
    80008470:	8082                	ret

0000000080008472 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008472:	7135                	addi	sp,sp,-160
    80008474:	ed06                	sd	ra,152(sp)
    80008476:	e922                	sd	s0,144(sp)
    80008478:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    8000847a:	ffffe097          	auipc	ra,0xffffe
    8000847e:	e12080e7          	jalr	-494(ra) # 8000628c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80008482:	f6840793          	addi	a5,s0,-152
    80008486:	08000613          	li	a2,128
    8000848a:	85be                	mv	a1,a5
    8000848c:	4501                	li	a0,0
    8000848e:	ffffc097          	auipc	ra,0xffffc
    80008492:	e34080e7          	jalr	-460(ra) # 800042c2 <argstr>
    80008496:	87aa                	mv	a5,a0
    80008498:	0207c163          	bltz	a5,800084ba <sys_mkdir+0x48>
    8000849c:	f6840793          	addi	a5,s0,-152
    800084a0:	4681                	li	a3,0
    800084a2:	4601                	li	a2,0
    800084a4:	4585                	li	a1,1
    800084a6:	853e                	mv	a0,a5
    800084a8:	00000097          	auipc	ra,0x0
    800084ac:	b46080e7          	jalr	-1210(ra) # 80007fee <create>
    800084b0:	fea43423          	sd	a0,-24(s0)
    800084b4:	fe843783          	ld	a5,-24(s0)
    800084b8:	e799                	bnez	a5,800084c6 <sys_mkdir+0x54>
    end_op();
    800084ba:	ffffe097          	auipc	ra,0xffffe
    800084be:	e94080e7          	jalr	-364(ra) # 8000634e <end_op>
    return -1;
    800084c2:	57fd                	li	a5,-1
    800084c4:	a821                	j	800084dc <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800084c6:	fe843503          	ld	a0,-24(s0)
    800084ca:	ffffd097          	auipc	ra,0xffffd
    800084ce:	f96080e7          	jalr	-106(ra) # 80005460 <iunlockput>
  end_op();
    800084d2:	ffffe097          	auipc	ra,0xffffe
    800084d6:	e7c080e7          	jalr	-388(ra) # 8000634e <end_op>
  return 0;
    800084da:	4781                	li	a5,0
}
    800084dc:	853e                	mv	a0,a5
    800084de:	60ea                	ld	ra,152(sp)
    800084e0:	644a                	ld	s0,144(sp)
    800084e2:	610d                	addi	sp,sp,160
    800084e4:	8082                	ret

00000000800084e6 <sys_mknod>:

uint64
sys_mknod(void)
{
    800084e6:	7135                	addi	sp,sp,-160
    800084e8:	ed06                	sd	ra,152(sp)
    800084ea:	e922                	sd	s0,144(sp)
    800084ec:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    800084ee:	ffffe097          	auipc	ra,0xffffe
    800084f2:	d9e080e7          	jalr	-610(ra) # 8000628c <begin_op>
  argint(1, &major);
    800084f6:	f6440793          	addi	a5,s0,-156
    800084fa:	85be                	mv	a1,a5
    800084fc:	4505                	li	a0,1
    800084fe:	ffffc097          	auipc	ra,0xffffc
    80008502:	d5c080e7          	jalr	-676(ra) # 8000425a <argint>
  argint(2, &minor);
    80008506:	f6040793          	addi	a5,s0,-160
    8000850a:	85be                	mv	a1,a5
    8000850c:	4509                	li	a0,2
    8000850e:	ffffc097          	auipc	ra,0xffffc
    80008512:	d4c080e7          	jalr	-692(ra) # 8000425a <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008516:	f6840793          	addi	a5,s0,-152
    8000851a:	08000613          	li	a2,128
    8000851e:	85be                	mv	a1,a5
    80008520:	4501                	li	a0,0
    80008522:	ffffc097          	auipc	ra,0xffffc
    80008526:	da0080e7          	jalr	-608(ra) # 800042c2 <argstr>
    8000852a:	87aa                	mv	a5,a0
    8000852c:	0207cc63          	bltz	a5,80008564 <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008530:	f6442783          	lw	a5,-156(s0)
    80008534:	0107971b          	slliw	a4,a5,0x10
    80008538:	4107571b          	sraiw	a4,a4,0x10
    8000853c:	f6042783          	lw	a5,-160(s0)
    80008540:	0107969b          	slliw	a3,a5,0x10
    80008544:	4106d69b          	sraiw	a3,a3,0x10
    80008548:	f6840793          	addi	a5,s0,-152
    8000854c:	863a                	mv	a2,a4
    8000854e:	458d                	li	a1,3
    80008550:	853e                	mv	a0,a5
    80008552:	00000097          	auipc	ra,0x0
    80008556:	a9c080e7          	jalr	-1380(ra) # 80007fee <create>
    8000855a:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    8000855e:	fe843783          	ld	a5,-24(s0)
    80008562:	e799                	bnez	a5,80008570 <sys_mknod+0x8a>
    end_op();
    80008564:	ffffe097          	auipc	ra,0xffffe
    80008568:	dea080e7          	jalr	-534(ra) # 8000634e <end_op>
    return -1;
    8000856c:	57fd                	li	a5,-1
    8000856e:	a821                	j	80008586 <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008570:	fe843503          	ld	a0,-24(s0)
    80008574:	ffffd097          	auipc	ra,0xffffd
    80008578:	eec080e7          	jalr	-276(ra) # 80005460 <iunlockput>
  end_op();
    8000857c:	ffffe097          	auipc	ra,0xffffe
    80008580:	dd2080e7          	jalr	-558(ra) # 8000634e <end_op>
  return 0;
    80008584:	4781                	li	a5,0
}
    80008586:	853e                	mv	a0,a5
    80008588:	60ea                	ld	ra,152(sp)
    8000858a:	644a                	ld	s0,144(sp)
    8000858c:	610d                	addi	sp,sp,160
    8000858e:	8082                	ret

0000000080008590 <sys_chdir>:

uint64
sys_chdir(void)
{
    80008590:	7135                	addi	sp,sp,-160
    80008592:	ed06                	sd	ra,152(sp)
    80008594:	e922                	sd	s0,144(sp)
    80008596:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008598:	ffffa097          	auipc	ra,0xffffa
    8000859c:	424080e7          	jalr	1060(ra) # 800029bc <myproc>
    800085a0:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800085a4:	ffffe097          	auipc	ra,0xffffe
    800085a8:	ce8080e7          	jalr	-792(ra) # 8000628c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800085ac:	f6040793          	addi	a5,s0,-160
    800085b0:	08000613          	li	a2,128
    800085b4:	85be                	mv	a1,a5
    800085b6:	4501                	li	a0,0
    800085b8:	ffffc097          	auipc	ra,0xffffc
    800085bc:	d0a080e7          	jalr	-758(ra) # 800042c2 <argstr>
    800085c0:	87aa                	mv	a5,a0
    800085c2:	0007ce63          	bltz	a5,800085de <sys_chdir+0x4e>
    800085c6:	f6040793          	addi	a5,s0,-160
    800085ca:	853e                	mv	a0,a5
    800085cc:	ffffe097          	auipc	ra,0xffffe
    800085d0:	95c080e7          	jalr	-1700(ra) # 80005f28 <namei>
    800085d4:	fea43023          	sd	a0,-32(s0)
    800085d8:	fe043783          	ld	a5,-32(s0)
    800085dc:	e799                	bnez	a5,800085ea <sys_chdir+0x5a>
    end_op();
    800085de:	ffffe097          	auipc	ra,0xffffe
    800085e2:	d70080e7          	jalr	-656(ra) # 8000634e <end_op>
    return -1;
    800085e6:	57fd                	li	a5,-1
    800085e8:	a0b5                	j	80008654 <sys_chdir+0xc4>
  }
  ilock(ip);
    800085ea:	fe043503          	ld	a0,-32(s0)
    800085ee:	ffffd097          	auipc	ra,0xffffd
    800085f2:	c14080e7          	jalr	-1004(ra) # 80005202 <ilock>
  if(ip->type != T_DIR){
    800085f6:	fe043783          	ld	a5,-32(s0)
    800085fa:	04479783          	lh	a5,68(a5)
    800085fe:	0007871b          	sext.w	a4,a5
    80008602:	4785                	li	a5,1
    80008604:	00f70e63          	beq	a4,a5,80008620 <sys_chdir+0x90>
    iunlockput(ip);
    80008608:	fe043503          	ld	a0,-32(s0)
    8000860c:	ffffd097          	auipc	ra,0xffffd
    80008610:	e54080e7          	jalr	-428(ra) # 80005460 <iunlockput>
    end_op();
    80008614:	ffffe097          	auipc	ra,0xffffe
    80008618:	d3a080e7          	jalr	-710(ra) # 8000634e <end_op>
    return -1;
    8000861c:	57fd                	li	a5,-1
    8000861e:	a81d                	j	80008654 <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008620:	fe043503          	ld	a0,-32(s0)
    80008624:	ffffd097          	auipc	ra,0xffffd
    80008628:	d12080e7          	jalr	-750(ra) # 80005336 <iunlock>
  iput(p->cwd);
    8000862c:	fe843783          	ld	a5,-24(s0)
    80008630:	1507b783          	ld	a5,336(a5)
    80008634:	853e                	mv	a0,a5
    80008636:	ffffd097          	auipc	ra,0xffffd
    8000863a:	d5a080e7          	jalr	-678(ra) # 80005390 <iput>
  end_op();
    8000863e:	ffffe097          	auipc	ra,0xffffe
    80008642:	d10080e7          	jalr	-752(ra) # 8000634e <end_op>
  p->cwd = ip;
    80008646:	fe843783          	ld	a5,-24(s0)
    8000864a:	fe043703          	ld	a4,-32(s0)
    8000864e:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008652:	4781                	li	a5,0
}
    80008654:	853e                	mv	a0,a5
    80008656:	60ea                	ld	ra,152(sp)
    80008658:	644a                	ld	s0,144(sp)
    8000865a:	610d                	addi	sp,sp,160
    8000865c:	8082                	ret

000000008000865e <sys_exec>:

uint64
sys_exec(void)
{
    8000865e:	7161                	addi	sp,sp,-432
    80008660:	f706                	sd	ra,424(sp)
    80008662:	f322                	sd	s0,416(sp)
    80008664:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    80008666:	e6040793          	addi	a5,s0,-416
    8000866a:	85be                	mv	a1,a5
    8000866c:	4505                	li	a0,1
    8000866e:	ffffc097          	auipc	ra,0xffffc
    80008672:	c22080e7          	jalr	-990(ra) # 80004290 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    80008676:	f6840793          	addi	a5,s0,-152
    8000867a:	08000613          	li	a2,128
    8000867e:	85be                	mv	a1,a5
    80008680:	4501                	li	a0,0
    80008682:	ffffc097          	auipc	ra,0xffffc
    80008686:	c40080e7          	jalr	-960(ra) # 800042c2 <argstr>
    8000868a:	87aa                	mv	a5,a0
    8000868c:	0007d463          	bgez	a5,80008694 <sys_exec+0x36>
    return -1;
    80008690:	57fd                	li	a5,-1
    80008692:	a249                	j	80008814 <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    80008694:	e6840793          	addi	a5,s0,-408
    80008698:	10000613          	li	a2,256
    8000869c:	4581                	li	a1,0
    8000869e:	853e                	mv	a0,a5
    800086a0:	ffff9097          	auipc	ra,0xffff9
    800086a4:	e5e080e7          	jalr	-418(ra) # 800014fe <memset>
  for(i=0;; i++){
    800086a8:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800086ac:	fec42783          	lw	a5,-20(s0)
    800086b0:	873e                	mv	a4,a5
    800086b2:	47fd                	li	a5,31
    800086b4:	10e7e463          	bltu	a5,a4,800087bc <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800086b8:	fec42783          	lw	a5,-20(s0)
    800086bc:	00379713          	slli	a4,a5,0x3
    800086c0:	e6043783          	ld	a5,-416(s0)
    800086c4:	97ba                	add	a5,a5,a4
    800086c6:	e5840713          	addi	a4,s0,-424
    800086ca:	85ba                	mv	a1,a4
    800086cc:	853e                	mv	a0,a5
    800086ce:	ffffc097          	auipc	ra,0xffffc
    800086d2:	a1a080e7          	jalr	-1510(ra) # 800040e8 <fetchaddr>
    800086d6:	87aa                	mv	a5,a0
    800086d8:	0e07c463          	bltz	a5,800087c0 <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    800086dc:	e5843783          	ld	a5,-424(s0)
    800086e0:	eb95                	bnez	a5,80008714 <sys_exec+0xb6>
      argv[i] = 0;
    800086e2:	fec42783          	lw	a5,-20(s0)
    800086e6:	078e                	slli	a5,a5,0x3
    800086e8:	ff040713          	addi	a4,s0,-16
    800086ec:	97ba                	add	a5,a5,a4
    800086ee:	e607bc23          	sd	zero,-392(a5)
      break;
    800086f2:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    800086f4:	e6840713          	addi	a4,s0,-408
    800086f8:	f6840793          	addi	a5,s0,-152
    800086fc:	85ba                	mv	a1,a4
    800086fe:	853e                	mv	a0,a5
    80008700:	fffff097          	auipc	ra,0xfffff
    80008704:	c1e080e7          	jalr	-994(ra) # 8000731e <exec>
    80008708:	87aa                	mv	a5,a0
    8000870a:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000870e:	fe042623          	sw	zero,-20(s0)
    80008712:	a059                	j	80008798 <sys_exec+0x13a>
    argv[i] = kalloc();
    80008714:	ffff9097          	auipc	ra,0xffff9
    80008718:	ac2080e7          	jalr	-1342(ra) # 800011d6 <kalloc>
    8000871c:	872a                	mv	a4,a0
    8000871e:	fec42783          	lw	a5,-20(s0)
    80008722:	078e                	slli	a5,a5,0x3
    80008724:	ff040693          	addi	a3,s0,-16
    80008728:	97b6                	add	a5,a5,a3
    8000872a:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    8000872e:	fec42783          	lw	a5,-20(s0)
    80008732:	078e                	slli	a5,a5,0x3
    80008734:	ff040713          	addi	a4,s0,-16
    80008738:	97ba                	add	a5,a5,a4
    8000873a:	e787b783          	ld	a5,-392(a5)
    8000873e:	c3d9                	beqz	a5,800087c4 <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008740:	e5843703          	ld	a4,-424(s0)
    80008744:	fec42783          	lw	a5,-20(s0)
    80008748:	078e                	slli	a5,a5,0x3
    8000874a:	ff040693          	addi	a3,s0,-16
    8000874e:	97b6                	add	a5,a5,a3
    80008750:	e787b783          	ld	a5,-392(a5)
    80008754:	6605                	lui	a2,0x1
    80008756:	85be                	mv	a1,a5
    80008758:	853a                	mv	a0,a4
    8000875a:	ffffc097          	auipc	ra,0xffffc
    8000875e:	9fc080e7          	jalr	-1540(ra) # 80004156 <fetchstr>
    80008762:	87aa                	mv	a5,a0
    80008764:	0607c263          	bltz	a5,800087c8 <sys_exec+0x16a>
  for(i=0;; i++){
    80008768:	fec42783          	lw	a5,-20(s0)
    8000876c:	2785                	addiw	a5,a5,1
    8000876e:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008772:	bf2d                	j	800086ac <sys_exec+0x4e>
    kfree(argv[i]);
    80008774:	fec42783          	lw	a5,-20(s0)
    80008778:	078e                	slli	a5,a5,0x3
    8000877a:	ff040713          	addi	a4,s0,-16
    8000877e:	97ba                	add	a5,a5,a4
    80008780:	e787b783          	ld	a5,-392(a5)
    80008784:	853e                	mv	a0,a5
    80008786:	ffff9097          	auipc	ra,0xffff9
    8000878a:	9aa080e7          	jalr	-1622(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000878e:	fec42783          	lw	a5,-20(s0)
    80008792:	2785                	addiw	a5,a5,1
    80008794:	fef42623          	sw	a5,-20(s0)
    80008798:	fec42783          	lw	a5,-20(s0)
    8000879c:	873e                	mv	a4,a5
    8000879e:	47fd                	li	a5,31
    800087a0:	00e7eb63          	bltu	a5,a4,800087b6 <sys_exec+0x158>
    800087a4:	fec42783          	lw	a5,-20(s0)
    800087a8:	078e                	slli	a5,a5,0x3
    800087aa:	ff040713          	addi	a4,s0,-16
    800087ae:	97ba                	add	a5,a5,a4
    800087b0:	e787b783          	ld	a5,-392(a5)
    800087b4:	f3e1                	bnez	a5,80008774 <sys_exec+0x116>

  return ret;
    800087b6:	fe842783          	lw	a5,-24(s0)
    800087ba:	a8a9                	j	80008814 <sys_exec+0x1b6>
      goto bad;
    800087bc:	0001                	nop
    800087be:	a031                	j	800087ca <sys_exec+0x16c>
      goto bad;
    800087c0:	0001                	nop
    800087c2:	a021                	j	800087ca <sys_exec+0x16c>
      goto bad;
    800087c4:	0001                	nop
    800087c6:	a011                	j	800087ca <sys_exec+0x16c>
      goto bad;
    800087c8:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800087ca:	fe042623          	sw	zero,-20(s0)
    800087ce:	a01d                	j	800087f4 <sys_exec+0x196>
    kfree(argv[i]);
    800087d0:	fec42783          	lw	a5,-20(s0)
    800087d4:	078e                	slli	a5,a5,0x3
    800087d6:	ff040713          	addi	a4,s0,-16
    800087da:	97ba                	add	a5,a5,a4
    800087dc:	e787b783          	ld	a5,-392(a5)
    800087e0:	853e                	mv	a0,a5
    800087e2:	ffff9097          	auipc	ra,0xffff9
    800087e6:	94e080e7          	jalr	-1714(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800087ea:	fec42783          	lw	a5,-20(s0)
    800087ee:	2785                	addiw	a5,a5,1
    800087f0:	fef42623          	sw	a5,-20(s0)
    800087f4:	fec42783          	lw	a5,-20(s0)
    800087f8:	873e                	mv	a4,a5
    800087fa:	47fd                	li	a5,31
    800087fc:	00e7eb63          	bltu	a5,a4,80008812 <sys_exec+0x1b4>
    80008800:	fec42783          	lw	a5,-20(s0)
    80008804:	078e                	slli	a5,a5,0x3
    80008806:	ff040713          	addi	a4,s0,-16
    8000880a:	97ba                	add	a5,a5,a4
    8000880c:	e787b783          	ld	a5,-392(a5)
    80008810:	f3e1                	bnez	a5,800087d0 <sys_exec+0x172>
  return -1;
    80008812:	57fd                	li	a5,-1
}
    80008814:	853e                	mv	a0,a5
    80008816:	70ba                	ld	ra,424(sp)
    80008818:	741a                	ld	s0,416(sp)
    8000881a:	615d                	addi	sp,sp,432
    8000881c:	8082                	ret

000000008000881e <sys_pipe>:

uint64
sys_pipe(void)
{
    8000881e:	7139                	addi	sp,sp,-64
    80008820:	fc06                	sd	ra,56(sp)
    80008822:	f822                	sd	s0,48(sp)
    80008824:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008826:	ffffa097          	auipc	ra,0xffffa
    8000882a:	196080e7          	jalr	406(ra) # 800029bc <myproc>
    8000882e:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008832:	fe040793          	addi	a5,s0,-32
    80008836:	85be                	mv	a1,a5
    80008838:	4501                	li	a0,0
    8000883a:	ffffc097          	auipc	ra,0xffffc
    8000883e:	a56080e7          	jalr	-1450(ra) # 80004290 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008842:	fd040713          	addi	a4,s0,-48
    80008846:	fd840793          	addi	a5,s0,-40
    8000884a:	85ba                	mv	a1,a4
    8000884c:	853e                	mv	a0,a5
    8000884e:	ffffe097          	auipc	ra,0xffffe
    80008852:	5ee080e7          	jalr	1518(ra) # 80006e3c <pipealloc>
    80008856:	87aa                	mv	a5,a0
    80008858:	0007d463          	bgez	a5,80008860 <sys_pipe+0x42>
    return -1;
    8000885c:	57fd                	li	a5,-1
    8000885e:	a219                	j	80008964 <sys_pipe+0x146>
  fd0 = -1;
    80008860:	57fd                	li	a5,-1
    80008862:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008866:	fd843783          	ld	a5,-40(s0)
    8000886a:	853e                	mv	a0,a5
    8000886c:	fffff097          	auipc	ra,0xfffff
    80008870:	0da080e7          	jalr	218(ra) # 80007946 <fdalloc>
    80008874:	87aa                	mv	a5,a0
    80008876:	fcf42623          	sw	a5,-52(s0)
    8000887a:	fcc42783          	lw	a5,-52(s0)
    8000887e:	0207c063          	bltz	a5,8000889e <sys_pipe+0x80>
    80008882:	fd043783          	ld	a5,-48(s0)
    80008886:	853e                	mv	a0,a5
    80008888:	fffff097          	auipc	ra,0xfffff
    8000888c:	0be080e7          	jalr	190(ra) # 80007946 <fdalloc>
    80008890:	87aa                	mv	a5,a0
    80008892:	fcf42423          	sw	a5,-56(s0)
    80008896:	fc842783          	lw	a5,-56(s0)
    8000889a:	0207df63          	bgez	a5,800088d8 <sys_pipe+0xba>
    if(fd0 >= 0)
    8000889e:	fcc42783          	lw	a5,-52(s0)
    800088a2:	0007cb63          	bltz	a5,800088b8 <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    800088a6:	fcc42783          	lw	a5,-52(s0)
    800088aa:	fe843703          	ld	a4,-24(s0)
    800088ae:	07e9                	addi	a5,a5,26
    800088b0:	078e                	slli	a5,a5,0x3
    800088b2:	97ba                	add	a5,a5,a4
    800088b4:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800088b8:	fd843783          	ld	a5,-40(s0)
    800088bc:	853e                	mv	a0,a5
    800088be:	ffffe097          	auipc	ra,0xffffe
    800088c2:	068080e7          	jalr	104(ra) # 80006926 <fileclose>
    fileclose(wf);
    800088c6:	fd043783          	ld	a5,-48(s0)
    800088ca:	853e                	mv	a0,a5
    800088cc:	ffffe097          	auipc	ra,0xffffe
    800088d0:	05a080e7          	jalr	90(ra) # 80006926 <fileclose>
    return -1;
    800088d4:	57fd                	li	a5,-1
    800088d6:	a079                	j	80008964 <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800088d8:	fe843783          	ld	a5,-24(s0)
    800088dc:	6bbc                	ld	a5,80(a5)
    800088de:	fe043703          	ld	a4,-32(s0)
    800088e2:	fcc40613          	addi	a2,s0,-52
    800088e6:	4691                	li	a3,4
    800088e8:	85ba                	mv	a1,a4
    800088ea:	853e                	mv	a0,a5
    800088ec:	ffffa097          	auipc	ra,0xffffa
    800088f0:	b9a080e7          	jalr	-1126(ra) # 80002486 <copyout>
    800088f4:	87aa                	mv	a5,a0
    800088f6:	0207c463          	bltz	a5,8000891e <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    800088fa:	fe843783          	ld	a5,-24(s0)
    800088fe:	6bb8                	ld	a4,80(a5)
    80008900:	fe043783          	ld	a5,-32(s0)
    80008904:	0791                	addi	a5,a5,4
    80008906:	fc840613          	addi	a2,s0,-56
    8000890a:	4691                	li	a3,4
    8000890c:	85be                	mv	a1,a5
    8000890e:	853a                	mv	a0,a4
    80008910:	ffffa097          	auipc	ra,0xffffa
    80008914:	b76080e7          	jalr	-1162(ra) # 80002486 <copyout>
    80008918:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    8000891a:	0407d463          	bgez	a5,80008962 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    8000891e:	fcc42783          	lw	a5,-52(s0)
    80008922:	fe843703          	ld	a4,-24(s0)
    80008926:	07e9                	addi	a5,a5,26
    80008928:	078e                	slli	a5,a5,0x3
    8000892a:	97ba                	add	a5,a5,a4
    8000892c:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008930:	fc842783          	lw	a5,-56(s0)
    80008934:	fe843703          	ld	a4,-24(s0)
    80008938:	07e9                	addi	a5,a5,26
    8000893a:	078e                	slli	a5,a5,0x3
    8000893c:	97ba                	add	a5,a5,a4
    8000893e:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008942:	fd843783          	ld	a5,-40(s0)
    80008946:	853e                	mv	a0,a5
    80008948:	ffffe097          	auipc	ra,0xffffe
    8000894c:	fde080e7          	jalr	-34(ra) # 80006926 <fileclose>
    fileclose(wf);
    80008950:	fd043783          	ld	a5,-48(s0)
    80008954:	853e                	mv	a0,a5
    80008956:	ffffe097          	auipc	ra,0xffffe
    8000895a:	fd0080e7          	jalr	-48(ra) # 80006926 <fileclose>
    return -1;
    8000895e:	57fd                	li	a5,-1
    80008960:	a011                	j	80008964 <sys_pipe+0x146>
  }
  return 0;
    80008962:	4781                	li	a5,0
}
    80008964:	853e                	mv	a0,a5
    80008966:	70e2                	ld	ra,56(sp)
    80008968:	7442                	ld	s0,48(sp)
    8000896a:	6121                	addi	sp,sp,64
    8000896c:	8082                	ret
	...

0000000080008970 <kernelvec>:
    80008970:	7111                	addi	sp,sp,-256
    80008972:	e006                	sd	ra,0(sp)
    80008974:	e40a                	sd	sp,8(sp)
    80008976:	e80e                	sd	gp,16(sp)
    80008978:	ec12                	sd	tp,24(sp)
    8000897a:	f016                	sd	t0,32(sp)
    8000897c:	f41a                	sd	t1,40(sp)
    8000897e:	f81e                	sd	t2,48(sp)
    80008980:	fc22                	sd	s0,56(sp)
    80008982:	e0a6                	sd	s1,64(sp)
    80008984:	e4aa                	sd	a0,72(sp)
    80008986:	e8ae                	sd	a1,80(sp)
    80008988:	ecb2                	sd	a2,88(sp)
    8000898a:	f0b6                	sd	a3,96(sp)
    8000898c:	f4ba                	sd	a4,104(sp)
    8000898e:	f8be                	sd	a5,112(sp)
    80008990:	fcc2                	sd	a6,120(sp)
    80008992:	e146                	sd	a7,128(sp)
    80008994:	e54a                	sd	s2,136(sp)
    80008996:	e94e                	sd	s3,144(sp)
    80008998:	ed52                	sd	s4,152(sp)
    8000899a:	f156                	sd	s5,160(sp)
    8000899c:	f55a                	sd	s6,168(sp)
    8000899e:	f95e                	sd	s7,176(sp)
    800089a0:	fd62                	sd	s8,184(sp)
    800089a2:	e1e6                	sd	s9,192(sp)
    800089a4:	e5ea                	sd	s10,200(sp)
    800089a6:	e9ee                	sd	s11,208(sp)
    800089a8:	edf2                	sd	t3,216(sp)
    800089aa:	f1f6                	sd	t4,224(sp)
    800089ac:	f5fa                	sd	t5,232(sp)
    800089ae:	f9fe                	sd	t6,240(sp)
    800089b0:	cb4fb0ef          	jal	ra,80003e64 <kerneltrap>
    800089b4:	6082                	ld	ra,0(sp)
    800089b6:	6122                	ld	sp,8(sp)
    800089b8:	61c2                	ld	gp,16(sp)
    800089ba:	7282                	ld	t0,32(sp)
    800089bc:	7322                	ld	t1,40(sp)
    800089be:	73c2                	ld	t2,48(sp)
    800089c0:	7462                	ld	s0,56(sp)
    800089c2:	6486                	ld	s1,64(sp)
    800089c4:	6526                	ld	a0,72(sp)
    800089c6:	65c6                	ld	a1,80(sp)
    800089c8:	6666                	ld	a2,88(sp)
    800089ca:	7686                	ld	a3,96(sp)
    800089cc:	7726                	ld	a4,104(sp)
    800089ce:	77c6                	ld	a5,112(sp)
    800089d0:	7866                	ld	a6,120(sp)
    800089d2:	688a                	ld	a7,128(sp)
    800089d4:	692a                	ld	s2,136(sp)
    800089d6:	69ca                	ld	s3,144(sp)
    800089d8:	6a6a                	ld	s4,152(sp)
    800089da:	7a8a                	ld	s5,160(sp)
    800089dc:	7b2a                	ld	s6,168(sp)
    800089de:	7bca                	ld	s7,176(sp)
    800089e0:	7c6a                	ld	s8,184(sp)
    800089e2:	6c8e                	ld	s9,192(sp)
    800089e4:	6d2e                	ld	s10,200(sp)
    800089e6:	6dce                	ld	s11,208(sp)
    800089e8:	6e6e                	ld	t3,216(sp)
    800089ea:	7e8e                	ld	t4,224(sp)
    800089ec:	7f2e                	ld	t5,232(sp)
    800089ee:	7fce                	ld	t6,240(sp)
    800089f0:	6111                	addi	sp,sp,256
    800089f2:	10200073          	sret
    800089f6:	00000013          	nop
    800089fa:	00000013          	nop
    800089fe:	0001                	nop

0000000080008a00 <timervec>:
    80008a00:	34051573          	csrrw	a0,mscratch,a0
    80008a04:	e10c                	sd	a1,0(a0)
    80008a06:	e510                	sd	a2,8(a0)
    80008a08:	e914                	sd	a3,16(a0)
    80008a0a:	6d0c                	ld	a1,24(a0)
    80008a0c:	7110                	ld	a2,32(a0)
    80008a0e:	6194                	ld	a3,0(a1)
    80008a10:	96b2                	add	a3,a3,a2
    80008a12:	e194                	sd	a3,0(a1)
    80008a14:	4589                	li	a1,2
    80008a16:	14459073          	csrw	sip,a1
    80008a1a:	6914                	ld	a3,16(a0)
    80008a1c:	6510                	ld	a2,8(a0)
    80008a1e:	610c                	ld	a1,0(a0)
    80008a20:	34051573          	csrrw	a0,mscratch,a0
    80008a24:	30200073          	mret
	...

0000000080008a2a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008a2a:	1141                	addi	sp,sp,-16
    80008a2c:	e422                	sd	s0,8(sp)
    80008a2e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008a30:	0c0007b7          	lui	a5,0xc000
    80008a34:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008a38:	4705                	li	a4,1
    80008a3a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008a3c:	0c0007b7          	lui	a5,0xc000
    80008a40:	0791                	addi	a5,a5,4
    80008a42:	4705                	li	a4,1
    80008a44:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008a46:	0c0007b7          	lui	a5,0xc000
    80008a4a:	07a1                	addi	a5,a5,8
    80008a4c:	4705                	li	a4,1
    80008a4e:	c398                	sw	a4,0(a5)
}
    80008a50:	0001                	nop
    80008a52:	6422                	ld	s0,8(sp)
    80008a54:	0141                	addi	sp,sp,16
    80008a56:	8082                	ret

0000000080008a58 <plicinithart>:

void
plicinithart(void)
{
    80008a58:	1101                	addi	sp,sp,-32
    80008a5a:	ec06                	sd	ra,24(sp)
    80008a5c:	e822                	sd	s0,16(sp)
    80008a5e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008a60:	ffffa097          	auipc	ra,0xffffa
    80008a64:	efe080e7          	jalr	-258(ra) # 8000295e <cpuid>
    80008a68:	87aa                	mv	a5,a0
    80008a6a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008a6e:	fec42783          	lw	a5,-20(s0)
    80008a72:	0087979b          	slliw	a5,a5,0x8
    80008a76:	2781                	sext.w	a5,a5
    80008a78:	873e                	mv	a4,a5
    80008a7a:	0c0027b7          	lui	a5,0xc002
    80008a7e:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008a82:	97ba                	add	a5,a5,a4
    80008a84:	873e                	mv	a4,a5
    80008a86:	40600793          	li	a5,1030
    80008a8a:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008a8c:	fec42783          	lw	a5,-20(s0)
    80008a90:	00d7979b          	slliw	a5,a5,0xd
    80008a94:	2781                	sext.w	a5,a5
    80008a96:	873e                	mv	a4,a5
    80008a98:	0c2017b7          	lui	a5,0xc201
    80008a9c:	97ba                	add	a5,a5,a4
    80008a9e:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008aa2:	0001                	nop
    80008aa4:	60e2                	ld	ra,24(sp)
    80008aa6:	6442                	ld	s0,16(sp)
    80008aa8:	6105                	addi	sp,sp,32
    80008aaa:	8082                	ret

0000000080008aac <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008aac:	1101                	addi	sp,sp,-32
    80008aae:	ec06                	sd	ra,24(sp)
    80008ab0:	e822                	sd	s0,16(sp)
    80008ab2:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008ab4:	ffffa097          	auipc	ra,0xffffa
    80008ab8:	eaa080e7          	jalr	-342(ra) # 8000295e <cpuid>
    80008abc:	87aa                	mv	a5,a0
    80008abe:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008ac2:	fec42783          	lw	a5,-20(s0)
    80008ac6:	00d7979b          	slliw	a5,a5,0xd
    80008aca:	2781                	sext.w	a5,a5
    80008acc:	873e                	mv	a4,a5
    80008ace:	0c2017b7          	lui	a5,0xc201
    80008ad2:	0791                	addi	a5,a5,4
    80008ad4:	97ba                	add	a5,a5,a4
    80008ad6:	439c                	lw	a5,0(a5)
    80008ad8:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008adc:	fe842783          	lw	a5,-24(s0)
}
    80008ae0:	853e                	mv	a0,a5
    80008ae2:	60e2                	ld	ra,24(sp)
    80008ae4:	6442                	ld	s0,16(sp)
    80008ae6:	6105                	addi	sp,sp,32
    80008ae8:	8082                	ret

0000000080008aea <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008aea:	7179                	addi	sp,sp,-48
    80008aec:	f406                	sd	ra,40(sp)
    80008aee:	f022                	sd	s0,32(sp)
    80008af0:	1800                	addi	s0,sp,48
    80008af2:	87aa                	mv	a5,a0
    80008af4:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008af8:	ffffa097          	auipc	ra,0xffffa
    80008afc:	e66080e7          	jalr	-410(ra) # 8000295e <cpuid>
    80008b00:	87aa                	mv	a5,a0
    80008b02:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008b06:	fec42783          	lw	a5,-20(s0)
    80008b0a:	00d7979b          	slliw	a5,a5,0xd
    80008b0e:	2781                	sext.w	a5,a5
    80008b10:	873e                	mv	a4,a5
    80008b12:	0c2017b7          	lui	a5,0xc201
    80008b16:	0791                	addi	a5,a5,4
    80008b18:	97ba                	add	a5,a5,a4
    80008b1a:	873e                	mv	a4,a5
    80008b1c:	fdc42783          	lw	a5,-36(s0)
    80008b20:	c31c                	sw	a5,0(a4)
}
    80008b22:	0001                	nop
    80008b24:	70a2                	ld	ra,40(sp)
    80008b26:	7402                	ld	s0,32(sp)
    80008b28:	6145                	addi	sp,sp,48
    80008b2a:	8082                	ret

0000000080008b2c <r_sstatus>:
{
    80008b2c:	1101                	addi	sp,sp,-32
    80008b2e:	ec22                	sd	s0,24(sp)
    80008b30:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80008b32:	100027f3          	csrr	a5,sstatus
    80008b36:	fef43423          	sd	a5,-24(s0)
  return x;
    80008b3a:	fe843783          	ld	a5,-24(s0)
}
    80008b3e:	853e                	mv	a0,a5
    80008b40:	6462                	ld	s0,24(sp)
    80008b42:	6105                	addi	sp,sp,32
    80008b44:	8082                	ret

0000000080008b46 <w_sstatus>:
{
    80008b46:	1101                	addi	sp,sp,-32
    80008b48:	ec22                	sd	s0,24(sp)
    80008b4a:	1000                	addi	s0,sp,32
    80008b4c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80008b50:	fe843783          	ld	a5,-24(s0)
    80008b54:	10079073          	csrw	sstatus,a5
}
    80008b58:	0001                	nop
    80008b5a:	6462                	ld	s0,24(sp)
    80008b5c:	6105                	addi	sp,sp,32
    80008b5e:	8082                	ret

0000000080008b60 <intr_on>:
{
    80008b60:	1141                	addi	sp,sp,-16
    80008b62:	e406                	sd	ra,8(sp)
    80008b64:	e022                	sd	s0,0(sp)
    80008b66:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80008b68:	00000097          	auipc	ra,0x0
    80008b6c:	fc4080e7          	jalr	-60(ra) # 80008b2c <r_sstatus>
    80008b70:	87aa                	mv	a5,a0
    80008b72:	0027e793          	ori	a5,a5,2
    80008b76:	853e                	mv	a0,a5
    80008b78:	00000097          	auipc	ra,0x0
    80008b7c:	fce080e7          	jalr	-50(ra) # 80008b46 <w_sstatus>
}
    80008b80:	0001                	nop
    80008b82:	60a2                	ld	ra,8(sp)
    80008b84:	6402                	ld	s0,0(sp)
    80008b86:	0141                	addi	sp,sp,16
    80008b88:	8082                	ret

0000000080008b8a <intr_off>:
{
    80008b8a:	1141                	addi	sp,sp,-16
    80008b8c:	e406                	sd	ra,8(sp)
    80008b8e:	e022                	sd	s0,0(sp)
    80008b90:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80008b92:	00000097          	auipc	ra,0x0
    80008b96:	f9a080e7          	jalr	-102(ra) # 80008b2c <r_sstatus>
    80008b9a:	87aa                	mv	a5,a0
    80008b9c:	9bf5                	andi	a5,a5,-3
    80008b9e:	853e                	mv	a0,a5
    80008ba0:	00000097          	auipc	ra,0x0
    80008ba4:	fa6080e7          	jalr	-90(ra) # 80008b46 <w_sstatus>
}
    80008ba8:	0001                	nop
    80008baa:	60a2                	ld	ra,8(sp)
    80008bac:	6402                	ld	s0,0(sp)
    80008bae:	0141                	addi	sp,sp,16
    80008bb0:	8082                	ret

0000000080008bb2 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    80008bb2:	7139                	addi	sp,sp,-64
    80008bb4:	fc06                	sd	ra,56(sp)
    80008bb6:	f822                	sd	s0,48(sp)
    80008bb8:	0080                	addi	s0,sp,64
    80008bba:	87aa                	mv	a5,a0
    80008bbc:	fcb43023          	sd	a1,-64(s0)
    80008bc0:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80008bc4:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008bc8:	fcc42703          	lw	a4,-52(s0)
    80008bcc:	15000793          	li	a5,336
    80008bd0:	02f707b3          	mul	a5,a4,a5
    80008bd4:	13078713          	addi	a4,a5,304 # c201130 <_entry-0x73dfeed0>
    80008bd8:	0002c797          	auipc	a5,0x2c
    80008bdc:	0b078793          	addi	a5,a5,176 # 80034c88 <disk>
    80008be0:	97ba                	add	a5,a5,a4
    80008be2:	fc043583          	ld	a1,-64(s0)
    80008be6:	853e                	mv	a0,a5
    80008be8:	ffff8097          	auipc	ra,0xffff8
    80008bec:	712080e7          	jalr	1810(ra) # 800012fa <initlock>
  disk[id].name = name;
    80008bf0:	0002c717          	auipc	a4,0x2c
    80008bf4:	09870713          	addi	a4,a4,152 # 80034c88 <disk>
    80008bf8:	fcc42683          	lw	a3,-52(s0)
    80008bfc:	15000793          	li	a5,336
    80008c00:	02f687b3          	mul	a5,a3,a5
    80008c04:	97ba                	add	a5,a5,a4
    80008c06:	fc043703          	ld	a4,-64(s0)
    80008c0a:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008c0c:	fcc42703          	lw	a4,-52(s0)
    80008c10:	67c1                	lui	a5,0x10
    80008c12:	0785                	addi	a5,a5,1
    80008c14:	97ba                	add	a5,a5,a4
    80008c16:	07b2                	slli	a5,a5,0xc
    80008c18:	439c                	lw	a5,0(a5)
    80008c1a:	2781                	sext.w	a5,a5
    80008c1c:	873e                	mv	a4,a5
    80008c1e:	747277b7          	lui	a5,0x74727
    80008c22:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008c26:	04f71c63          	bne	a4,a5,80008c7e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008c2a:	fcc42703          	lw	a4,-52(s0)
    80008c2e:	67c1                	lui	a5,0x10
    80008c30:	0785                	addi	a5,a5,1
    80008c32:	97ba                	add	a5,a5,a4
    80008c34:	07b2                	slli	a5,a5,0xc
    80008c36:	0791                	addi	a5,a5,4
    80008c38:	439c                	lw	a5,0(a5)
    80008c3a:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008c3c:	873e                	mv	a4,a5
    80008c3e:	4789                	li	a5,2
    80008c40:	02f71f63          	bne	a4,a5,80008c7e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008c44:	fcc42703          	lw	a4,-52(s0)
    80008c48:	67c1                	lui	a5,0x10
    80008c4a:	0785                	addi	a5,a5,1
    80008c4c:	97ba                	add	a5,a5,a4
    80008c4e:	07b2                	slli	a5,a5,0xc
    80008c50:	07a1                	addi	a5,a5,8
    80008c52:	439c                	lw	a5,0(a5)
    80008c54:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008c56:	873e                	mv	a4,a5
    80008c58:	4789                	li	a5,2
    80008c5a:	02f71263          	bne	a4,a5,80008c7e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008c5e:	fcc42703          	lw	a4,-52(s0)
    80008c62:	67c1                	lui	a5,0x10
    80008c64:	0785                	addi	a5,a5,1
    80008c66:	97ba                	add	a5,a5,a4
    80008c68:	07b2                	slli	a5,a5,0xc
    80008c6a:	07b1                	addi	a5,a5,12
    80008c6c:	439c                	lw	a5,0(a5)
    80008c6e:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008c70:	873e                	mv	a4,a5
    80008c72:	554d47b7          	lui	a5,0x554d4
    80008c76:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008c7a:	00f70d63          	beq	a4,a5,80008c94 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    80008c7e:	fc043603          	ld	a2,-64(s0)
    80008c82:	00003597          	auipc	a1,0x3
    80008c86:	9ee58593          	addi	a1,a1,-1554 # 8000b670 <etext+0x670>
    80008c8a:	4509                	li	a0,2
    80008c8c:	ffff8097          	auipc	ra,0xffff8
    80008c90:	052080e7          	jalr	82(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008c94:	fcc42703          	lw	a4,-52(s0)
    80008c98:	67c1                	lui	a5,0x10
    80008c9a:	0785                	addi	a5,a5,1
    80008c9c:	97ba                	add	a5,a5,a4
    80008c9e:	07b2                	slli	a5,a5,0xc
    80008ca0:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008ca4:	873e                	mv	a4,a5
    80008ca6:	fe842783          	lw	a5,-24(s0)
    80008caa:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008cac:	fe842783          	lw	a5,-24(s0)
    80008cb0:	0017e793          	ori	a5,a5,1
    80008cb4:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008cb8:	fcc42703          	lw	a4,-52(s0)
    80008cbc:	67c1                	lui	a5,0x10
    80008cbe:	0785                	addi	a5,a5,1
    80008cc0:	97ba                	add	a5,a5,a4
    80008cc2:	07b2                	slli	a5,a5,0xc
    80008cc4:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008cc8:	873e                	mv	a4,a5
    80008cca:	fe842783          	lw	a5,-24(s0)
    80008cce:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008cd0:	fe842783          	lw	a5,-24(s0)
    80008cd4:	0027e793          	ori	a5,a5,2
    80008cd8:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008cdc:	fcc42703          	lw	a4,-52(s0)
    80008ce0:	67c1                	lui	a5,0x10
    80008ce2:	0785                	addi	a5,a5,1
    80008ce4:	97ba                	add	a5,a5,a4
    80008ce6:	07b2                	slli	a5,a5,0xc
    80008ce8:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008cec:	873e                	mv	a4,a5
    80008cee:	fe842783          	lw	a5,-24(s0)
    80008cf2:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008cf4:	fcc42703          	lw	a4,-52(s0)
    80008cf8:	67c1                	lui	a5,0x10
    80008cfa:	0785                	addi	a5,a5,1
    80008cfc:	97ba                	add	a5,a5,a4
    80008cfe:	07b2                	slli	a5,a5,0xc
    80008d00:	07c1                	addi	a5,a5,16
    80008d02:	439c                	lw	a5,0(a5)
    80008d04:	2781                	sext.w	a5,a5
    80008d06:	1782                	slli	a5,a5,0x20
    80008d08:	9381                	srli	a5,a5,0x20
    80008d0a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008d0e:	fe043783          	ld	a5,-32(s0)
    80008d12:	fdf7f793          	andi	a5,a5,-33
    80008d16:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008d1a:	fe043783          	ld	a5,-32(s0)
    80008d1e:	f7f7f793          	andi	a5,a5,-129
    80008d22:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008d26:	fe043703          	ld	a4,-32(s0)
    80008d2a:	77fd                	lui	a5,0xfffff
    80008d2c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffca8cf>
    80008d30:	8ff9                	and	a5,a5,a4
    80008d32:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008d36:	fe043703          	ld	a4,-32(s0)
    80008d3a:	77fd                	lui	a5,0xfffff
    80008d3c:	17fd                	addi	a5,a5,-1
    80008d3e:	8ff9                	and	a5,a5,a4
    80008d40:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008d44:	fe043703          	ld	a4,-32(s0)
    80008d48:	f80007b7          	lui	a5,0xf8000
    80008d4c:	17fd                	addi	a5,a5,-1
    80008d4e:	8ff9                	and	a5,a5,a4
    80008d50:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008d54:	fe043703          	ld	a4,-32(s0)
    80008d58:	e00007b7          	lui	a5,0xe0000
    80008d5c:	17fd                	addi	a5,a5,-1
    80008d5e:	8ff9                	and	a5,a5,a4
    80008d60:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008d64:	fe043703          	ld	a4,-32(s0)
    80008d68:	f00007b7          	lui	a5,0xf0000
    80008d6c:	17fd                	addi	a5,a5,-1
    80008d6e:	8ff9                	and	a5,a5,a4
    80008d70:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008d74:	fcc42703          	lw	a4,-52(s0)
    80008d78:	67c1                	lui	a5,0x10
    80008d7a:	0785                	addi	a5,a5,1
    80008d7c:	97ba                	add	a5,a5,a4
    80008d7e:	07b2                	slli	a5,a5,0xc
    80008d80:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80008d84:	873e                	mv	a4,a5
    80008d86:	fe043783          	ld	a5,-32(s0)
    80008d8a:	2781                	sext.w	a5,a5
    80008d8c:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008d8e:	fe842783          	lw	a5,-24(s0)
    80008d92:	0087e793          	ori	a5,a5,8
    80008d96:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008d9a:	fcc42703          	lw	a4,-52(s0)
    80008d9e:	67c1                	lui	a5,0x10
    80008da0:	0785                	addi	a5,a5,1
    80008da2:	97ba                	add	a5,a5,a4
    80008da4:	07b2                	slli	a5,a5,0xc
    80008da6:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008daa:	873e                	mv	a4,a5
    80008dac:	fe842783          	lw	a5,-24(s0)
    80008db0:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80008db2:	fcc42703          	lw	a4,-52(s0)
    80008db6:	67c1                	lui	a5,0x10
    80008db8:	0785                	addi	a5,a5,1
    80008dba:	97ba                	add	a5,a5,a4
    80008dbc:	07b2                	slli	a5,a5,0xc
    80008dbe:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008dc2:	439c                	lw	a5,0(a5)
    80008dc4:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80008dc8:	fe842783          	lw	a5,-24(s0)
    80008dcc:	8ba1                	andi	a5,a5,8
    80008dce:	2781                	sext.w	a5,a5
    80008dd0:	ef81                	bnez	a5,80008de8 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    80008dd2:	00003617          	auipc	a2,0x3
    80008dd6:	8be60613          	addi	a2,a2,-1858 # 8000b690 <etext+0x690>
    80008dda:	fc043583          	ld	a1,-64(s0)
    80008dde:	4509                	li	a0,2
    80008de0:	ffff8097          	auipc	ra,0xffff8
    80008de4:	efe080e7          	jalr	-258(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008de8:	fcc42703          	lw	a4,-52(s0)
    80008dec:	67c1                	lui	a5,0x10
    80008dee:	0785                	addi	a5,a5,1
    80008df0:	97ba                	add	a5,a5,a4
    80008df2:	07b2                	slli	a5,a5,0xc
    80008df4:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    80008df8:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    80008dfc:	fcc42703          	lw	a4,-52(s0)
    80008e00:	67c1                	lui	a5,0x10
    80008e02:	0785                	addi	a5,a5,1
    80008e04:	97ba                	add	a5,a5,a4
    80008e06:	07b2                	slli	a5,a5,0xc
    80008e08:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80008e0c:	439c                	lw	a5,0(a5)
    80008e0e:	2781                	sext.w	a5,a5
    80008e10:	cf81                	beqz	a5,80008e28 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    80008e12:	00003617          	auipc	a2,0x3
    80008e16:	89e60613          	addi	a2,a2,-1890 # 8000b6b0 <etext+0x6b0>
    80008e1a:	fc043583          	ld	a1,-64(s0)
    80008e1e:	4509                	li	a0,2
    80008e20:	ffff8097          	auipc	ra,0xffff8
    80008e24:	ebe080e7          	jalr	-322(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008e28:	fcc42703          	lw	a4,-52(s0)
    80008e2c:	67c1                	lui	a5,0x10
    80008e2e:	0785                	addi	a5,a5,1
    80008e30:	97ba                	add	a5,a5,a4
    80008e32:	07b2                	slli	a5,a5,0xc
    80008e34:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80008e38:	439c                	lw	a5,0(a5)
    80008e3a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008e3e:	fdc42783          	lw	a5,-36(s0)
    80008e42:	2781                	sext.w	a5,a5
    80008e44:	ef81                	bnez	a5,80008e5c <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    80008e46:	00003617          	auipc	a2,0x3
    80008e4a:	89260613          	addi	a2,a2,-1902 # 8000b6d8 <etext+0x6d8>
    80008e4e:	fc043583          	ld	a1,-64(s0)
    80008e52:	4509                	li	a0,2
    80008e54:	ffff8097          	auipc	ra,0xffff8
    80008e58:	e8a080e7          	jalr	-374(ra) # 80000cde <panic_concat>
  if(max < NUM)
    80008e5c:	fdc42783          	lw	a5,-36(s0)
    80008e60:	0007871b          	sext.w	a4,a5
    80008e64:	479d                	li	a5,7
    80008e66:	00e7ed63          	bltu	a5,a4,80008e80 <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    80008e6a:	00003617          	auipc	a2,0x3
    80008e6e:	88e60613          	addi	a2,a2,-1906 # 8000b6f8 <etext+0x6f8>
    80008e72:	fc043583          	ld	a1,-64(s0)
    80008e76:	4509                	li	a0,2
    80008e78:	ffff8097          	auipc	ra,0xffff8
    80008e7c:	e66080e7          	jalr	-410(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    80008e80:	ffff8097          	auipc	ra,0xffff8
    80008e84:	356080e7          	jalr	854(ra) # 800011d6 <kalloc>
    80008e88:	862a                	mv	a2,a0
    80008e8a:	0002c717          	auipc	a4,0x2c
    80008e8e:	dfe70713          	addi	a4,a4,-514 # 80034c88 <disk>
    80008e92:	fcc42683          	lw	a3,-52(s0)
    80008e96:	15000793          	li	a5,336
    80008e9a:	02f687b3          	mul	a5,a3,a5
    80008e9e:	97ba                	add	a5,a5,a4
    80008ea0:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    80008ea2:	ffff8097          	auipc	ra,0xffff8
    80008ea6:	334080e7          	jalr	820(ra) # 800011d6 <kalloc>
    80008eaa:	862a                	mv	a2,a0
    80008eac:	0002c717          	auipc	a4,0x2c
    80008eb0:	ddc70713          	addi	a4,a4,-548 # 80034c88 <disk>
    80008eb4:	fcc42683          	lw	a3,-52(s0)
    80008eb8:	15000793          	li	a5,336
    80008ebc:	02f687b3          	mul	a5,a3,a5
    80008ec0:	97ba                	add	a5,a5,a4
    80008ec2:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    80008ec4:	ffff8097          	auipc	ra,0xffff8
    80008ec8:	312080e7          	jalr	786(ra) # 800011d6 <kalloc>
    80008ecc:	862a                	mv	a2,a0
    80008ece:	0002c717          	auipc	a4,0x2c
    80008ed2:	dba70713          	addi	a4,a4,-582 # 80034c88 <disk>
    80008ed6:	fcc42683          	lw	a3,-52(s0)
    80008eda:	15000793          	li	a5,336
    80008ede:	02f687b3          	mul	a5,a3,a5
    80008ee2:	97ba                	add	a5,a5,a4
    80008ee4:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    80008ee6:	0002c717          	auipc	a4,0x2c
    80008eea:	da270713          	addi	a4,a4,-606 # 80034c88 <disk>
    80008eee:	fcc42683          	lw	a3,-52(s0)
    80008ef2:	15000793          	li	a5,336
    80008ef6:	02f687b3          	mul	a5,a3,a5
    80008efa:	97ba                	add	a5,a5,a4
    80008efc:	679c                	ld	a5,8(a5)
    80008efe:	cb9d                	beqz	a5,80008f34 <virtio_disk_init+0x382>
    80008f00:	0002c717          	auipc	a4,0x2c
    80008f04:	d8870713          	addi	a4,a4,-632 # 80034c88 <disk>
    80008f08:	fcc42683          	lw	a3,-52(s0)
    80008f0c:	15000793          	li	a5,336
    80008f10:	02f687b3          	mul	a5,a3,a5
    80008f14:	97ba                	add	a5,a5,a4
    80008f16:	6b9c                	ld	a5,16(a5)
    80008f18:	cf91                	beqz	a5,80008f34 <virtio_disk_init+0x382>
    80008f1a:	0002c717          	auipc	a4,0x2c
    80008f1e:	d6e70713          	addi	a4,a4,-658 # 80034c88 <disk>
    80008f22:	fcc42683          	lw	a3,-52(s0)
    80008f26:	15000793          	li	a5,336
    80008f2a:	02f687b3          	mul	a5,a3,a5
    80008f2e:	97ba                	add	a5,a5,a4
    80008f30:	6f9c                	ld	a5,24(a5)
    80008f32:	ef81                	bnez	a5,80008f4a <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80008f34:	00002617          	auipc	a2,0x2
    80008f38:	7ec60613          	addi	a2,a2,2028 # 8000b720 <etext+0x720>
    80008f3c:	fc043583          	ld	a1,-64(s0)
    80008f40:	4509                	li	a0,2
    80008f42:	ffff8097          	auipc	ra,0xffff8
    80008f46:	d9c080e7          	jalr	-612(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    80008f4a:	0002c717          	auipc	a4,0x2c
    80008f4e:	d3e70713          	addi	a4,a4,-706 # 80034c88 <disk>
    80008f52:	fcc42683          	lw	a3,-52(s0)
    80008f56:	15000793          	li	a5,336
    80008f5a:	02f687b3          	mul	a5,a3,a5
    80008f5e:	97ba                	add	a5,a5,a4
    80008f60:	679c                	ld	a5,8(a5)
    80008f62:	6605                	lui	a2,0x1
    80008f64:	4581                	li	a1,0
    80008f66:	853e                	mv	a0,a5
    80008f68:	ffff8097          	auipc	ra,0xffff8
    80008f6c:	596080e7          	jalr	1430(ra) # 800014fe <memset>
  memset(disk[id].avail, 0, PGSIZE);
    80008f70:	0002c717          	auipc	a4,0x2c
    80008f74:	d1870713          	addi	a4,a4,-744 # 80034c88 <disk>
    80008f78:	fcc42683          	lw	a3,-52(s0)
    80008f7c:	15000793          	li	a5,336
    80008f80:	02f687b3          	mul	a5,a3,a5
    80008f84:	97ba                	add	a5,a5,a4
    80008f86:	6b9c                	ld	a5,16(a5)
    80008f88:	6605                	lui	a2,0x1
    80008f8a:	4581                	li	a1,0
    80008f8c:	853e                	mv	a0,a5
    80008f8e:	ffff8097          	auipc	ra,0xffff8
    80008f92:	570080e7          	jalr	1392(ra) # 800014fe <memset>
  memset(disk[id].used, 0, PGSIZE);
    80008f96:	0002c717          	auipc	a4,0x2c
    80008f9a:	cf270713          	addi	a4,a4,-782 # 80034c88 <disk>
    80008f9e:	fcc42683          	lw	a3,-52(s0)
    80008fa2:	15000793          	li	a5,336
    80008fa6:	02f687b3          	mul	a5,a3,a5
    80008faa:	97ba                	add	a5,a5,a4
    80008fac:	6f9c                	ld	a5,24(a5)
    80008fae:	6605                	lui	a2,0x1
    80008fb0:	4581                	li	a1,0
    80008fb2:	853e                	mv	a0,a5
    80008fb4:	ffff8097          	auipc	ra,0xffff8
    80008fb8:	54a080e7          	jalr	1354(ra) # 800014fe <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80008fbc:	fcc42703          	lw	a4,-52(s0)
    80008fc0:	67c1                	lui	a5,0x10
    80008fc2:	0785                	addi	a5,a5,1
    80008fc4:	97ba                	add	a5,a5,a4
    80008fc6:	07b2                	slli	a5,a5,0xc
    80008fc8:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    80008fcc:	873e                	mv	a4,a5
    80008fce:	47a1                	li	a5,8
    80008fd0:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    80008fd2:	0002c717          	auipc	a4,0x2c
    80008fd6:	cb670713          	addi	a4,a4,-842 # 80034c88 <disk>
    80008fda:	fcc42683          	lw	a3,-52(s0)
    80008fde:	15000793          	li	a5,336
    80008fe2:	02f687b3          	mul	a5,a3,a5
    80008fe6:	97ba                	add	a5,a5,a4
    80008fe8:	679c                	ld	a5,8(a5)
    80008fea:	86be                	mv	a3,a5
    80008fec:	fcc42703          	lw	a4,-52(s0)
    80008ff0:	67c1                	lui	a5,0x10
    80008ff2:	0785                	addi	a5,a5,1
    80008ff4:	97ba                	add	a5,a5,a4
    80008ff6:	07b2                	slli	a5,a5,0xc
    80008ff8:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    80008ffc:	873e                	mv	a4,a5
    80008ffe:	0006879b          	sext.w	a5,a3
    80009002:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    80009004:	0002c717          	auipc	a4,0x2c
    80009008:	c8470713          	addi	a4,a4,-892 # 80034c88 <disk>
    8000900c:	fcc42683          	lw	a3,-52(s0)
    80009010:	15000793          	li	a5,336
    80009014:	02f687b3          	mul	a5,a3,a5
    80009018:	97ba                	add	a5,a5,a4
    8000901a:	679c                	ld	a5,8(a5)
    8000901c:	0207d693          	srli	a3,a5,0x20
    80009020:	fcc42703          	lw	a4,-52(s0)
    80009024:	67c1                	lui	a5,0x10
    80009026:	0785                	addi	a5,a5,1
    80009028:	97ba                	add	a5,a5,a4
    8000902a:	07b2                	slli	a5,a5,0xc
    8000902c:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    80009030:	873e                	mv	a4,a5
    80009032:	0006879b          	sext.w	a5,a3
    80009036:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009038:	0002c717          	auipc	a4,0x2c
    8000903c:	c5070713          	addi	a4,a4,-944 # 80034c88 <disk>
    80009040:	fcc42683          	lw	a3,-52(s0)
    80009044:	15000793          	li	a5,336
    80009048:	02f687b3          	mul	a5,a3,a5
    8000904c:	97ba                	add	a5,a5,a4
    8000904e:	6b9c                	ld	a5,16(a5)
    80009050:	86be                	mv	a3,a5
    80009052:	fcc42703          	lw	a4,-52(s0)
    80009056:	67c1                	lui	a5,0x10
    80009058:	0785                	addi	a5,a5,1
    8000905a:	97ba                	add	a5,a5,a4
    8000905c:	07b2                	slli	a5,a5,0xc
    8000905e:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    80009062:	873e                	mv	a4,a5
    80009064:	0006879b          	sext.w	a5,a3
    80009068:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    8000906a:	0002c717          	auipc	a4,0x2c
    8000906e:	c1e70713          	addi	a4,a4,-994 # 80034c88 <disk>
    80009072:	fcc42683          	lw	a3,-52(s0)
    80009076:	15000793          	li	a5,336
    8000907a:	02f687b3          	mul	a5,a3,a5
    8000907e:	97ba                	add	a5,a5,a4
    80009080:	6b9c                	ld	a5,16(a5)
    80009082:	0207d693          	srli	a3,a5,0x20
    80009086:	fcc42703          	lw	a4,-52(s0)
    8000908a:	67c1                	lui	a5,0x10
    8000908c:	0785                	addi	a5,a5,1
    8000908e:	97ba                	add	a5,a5,a4
    80009090:	07b2                	slli	a5,a5,0xc
    80009092:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    80009096:	873e                	mv	a4,a5
    80009098:	0006879b          	sext.w	a5,a3
    8000909c:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    8000909e:	0002c717          	auipc	a4,0x2c
    800090a2:	bea70713          	addi	a4,a4,-1046 # 80034c88 <disk>
    800090a6:	fcc42683          	lw	a3,-52(s0)
    800090aa:	15000793          	li	a5,336
    800090ae:	02f687b3          	mul	a5,a3,a5
    800090b2:	97ba                	add	a5,a5,a4
    800090b4:	6f9c                	ld	a5,24(a5)
    800090b6:	86be                	mv	a3,a5
    800090b8:	fcc42703          	lw	a4,-52(s0)
    800090bc:	67c1                	lui	a5,0x10
    800090be:	0785                	addi	a5,a5,1
    800090c0:	97ba                	add	a5,a5,a4
    800090c2:	07b2                	slli	a5,a5,0xc
    800090c4:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    800090c8:	873e                	mv	a4,a5
    800090ca:	0006879b          	sext.w	a5,a3
    800090ce:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    800090d0:	0002c717          	auipc	a4,0x2c
    800090d4:	bb870713          	addi	a4,a4,-1096 # 80034c88 <disk>
    800090d8:	fcc42683          	lw	a3,-52(s0)
    800090dc:	15000793          	li	a5,336
    800090e0:	02f687b3          	mul	a5,a3,a5
    800090e4:	97ba                	add	a5,a5,a4
    800090e6:	6f9c                	ld	a5,24(a5)
    800090e8:	0207d693          	srli	a3,a5,0x20
    800090ec:	fcc42703          	lw	a4,-52(s0)
    800090f0:	67c1                	lui	a5,0x10
    800090f2:	0785                	addi	a5,a5,1
    800090f4:	97ba                	add	a5,a5,a4
    800090f6:	07b2                	slli	a5,a5,0xc
    800090f8:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    800090fc:	873e                	mv	a4,a5
    800090fe:	0006879b          	sext.w	a5,a3
    80009102:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80009104:	fcc42703          	lw	a4,-52(s0)
    80009108:	67c1                	lui	a5,0x10
    8000910a:	0785                	addi	a5,a5,1
    8000910c:	97ba                	add	a5,a5,a4
    8000910e:	07b2                	slli	a5,a5,0xc
    80009110:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80009114:	873e                	mv	a4,a5
    80009116:	4785                	li	a5,1
    80009118:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000911a:	fe042623          	sw	zero,-20(s0)
    8000911e:	a03d                	j	8000914c <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    80009120:	0002c697          	auipc	a3,0x2c
    80009124:	b6868693          	addi	a3,a3,-1176 # 80034c88 <disk>
    80009128:	fec42703          	lw	a4,-20(s0)
    8000912c:	fcc42603          	lw	a2,-52(s0)
    80009130:	15000793          	li	a5,336
    80009134:	02f607b3          	mul	a5,a2,a5
    80009138:	97b6                	add	a5,a5,a3
    8000913a:	97ba                	add	a5,a5,a4
    8000913c:	4705                	li	a4,1
    8000913e:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    80009142:	fec42783          	lw	a5,-20(s0)
    80009146:	2785                	addiw	a5,a5,1
    80009148:	fef42623          	sw	a5,-20(s0)
    8000914c:	fec42783          	lw	a5,-20(s0)
    80009150:	0007871b          	sext.w	a4,a5
    80009154:	479d                	li	a5,7
    80009156:	fce7d5e3          	bge	a5,a4,80009120 <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000915a:	fe842783          	lw	a5,-24(s0)
    8000915e:	0047e793          	ori	a5,a5,4
    80009162:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009166:	fcc42703          	lw	a4,-52(s0)
    8000916a:	67c1                	lui	a5,0x10
    8000916c:	0785                	addi	a5,a5,1
    8000916e:	97ba                	add	a5,a5,a4
    80009170:	07b2                	slli	a5,a5,0xc
    80009172:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009176:	873e                	mv	a4,a5
    80009178:	fe842783          	lw	a5,-24(s0)
    8000917c:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    8000917e:	fcc42783          	lw	a5,-52(s0)
    80009182:	0007871b          	sext.w	a4,a5
    80009186:	4785                	li	a5,1
    80009188:	06f71663          	bne	a4,a5,800091f4 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    8000918c:	ffff8097          	auipc	ra,0xffff8
    80009190:	04a080e7          	jalr	74(ra) # 800011d6 <kalloc>
    80009194:	872a                	mv	a4,a0
    80009196:	0002c797          	auipc	a5,0x2c
    8000919a:	d9278793          	addi	a5,a5,-622 # 80034f28 <swap_buffer>
    8000919e:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    800091a0:	0002c797          	auipc	a5,0x2c
    800091a4:	d8878793          	addi	a5,a5,-632 # 80034f28 <swap_buffer>
    800091a8:	639c                	ld	a5,0(a5)
    800091aa:	eb89                	bnez	a5,800091bc <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    800091ac:	00002517          	auipc	a0,0x2
    800091b0:	58c50513          	addi	a0,a0,1420 # 8000b738 <etext+0x738>
    800091b4:	ffff8097          	auipc	ra,0xffff8
    800091b8:	ad8080e7          	jalr	-1320(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    800091bc:	0002c797          	auipc	a5,0x2c
    800091c0:	d6c78793          	addi	a5,a5,-660 # 80034f28 <swap_buffer>
    800091c4:	639c                	ld	a5,0(a5)
    800091c6:	40000613          	li	a2,1024
    800091ca:	4581                	li	a1,0
    800091cc:	853e                	mv	a0,a5
    800091ce:	ffff8097          	auipc	ra,0xffff8
    800091d2:	330080e7          	jalr	816(ra) # 800014fe <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    800091d6:	0002c797          	auipc	a5,0x2c
    800091da:	d5278793          	addi	a5,a5,-686 # 80034f28 <swap_buffer>
    800091de:	639c                	ld	a5,0(a5)
    800091e0:	07c1                	addi	a5,a5,16
    800091e2:	00002597          	auipc	a1,0x2
    800091e6:	58658593          	addi	a1,a1,1414 # 8000b768 <etext+0x768>
    800091ea:	853e                	mv	a0,a5
    800091ec:	ffffd097          	auipc	ra,0xffffd
    800091f0:	4b2080e7          	jalr	1202(ra) # 8000669e <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    800091f4:	0001                	nop
    800091f6:	70e2                	ld	ra,56(sp)
    800091f8:	7442                	ld	s0,48(sp)
    800091fa:	6121                	addi	sp,sp,64
    800091fc:	8082                	ret

00000000800091fe <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    800091fe:	7179                	addi	sp,sp,-48
    80009200:	f422                	sd	s0,40(sp)
    80009202:	1800                	addi	s0,sp,48
    80009204:	87aa                	mv	a5,a0
    80009206:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    8000920a:	fe042623          	sw	zero,-20(s0)
    8000920e:	a891                	j	80009262 <alloc_desc+0x64>
    if(disk[id].free[i]){
    80009210:	0002c697          	auipc	a3,0x2c
    80009214:	a7868693          	addi	a3,a3,-1416 # 80034c88 <disk>
    80009218:	fec42703          	lw	a4,-20(s0)
    8000921c:	fdc42603          	lw	a2,-36(s0)
    80009220:	15000793          	li	a5,336
    80009224:	02f607b3          	mul	a5,a2,a5
    80009228:	97b6                	add	a5,a5,a3
    8000922a:	97ba                	add	a5,a5,a4
    8000922c:	0207c783          	lbu	a5,32(a5)
    80009230:	c785                	beqz	a5,80009258 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009232:	0002c697          	auipc	a3,0x2c
    80009236:	a5668693          	addi	a3,a3,-1450 # 80034c88 <disk>
    8000923a:	fec42703          	lw	a4,-20(s0)
    8000923e:	fdc42603          	lw	a2,-36(s0)
    80009242:	15000793          	li	a5,336
    80009246:	02f607b3          	mul	a5,a2,a5
    8000924a:	97b6                	add	a5,a5,a3
    8000924c:	97ba                	add	a5,a5,a4
    8000924e:	02078023          	sb	zero,32(a5)
      return i;
    80009252:	fec42783          	lw	a5,-20(s0)
    80009256:	a831                	j	80009272 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    80009258:	fec42783          	lw	a5,-20(s0)
    8000925c:	2785                	addiw	a5,a5,1
    8000925e:	fef42623          	sw	a5,-20(s0)
    80009262:	fec42783          	lw	a5,-20(s0)
    80009266:	0007871b          	sext.w	a4,a5
    8000926a:	479d                	li	a5,7
    8000926c:	fae7d2e3          	bge	a5,a4,80009210 <alloc_desc+0x12>
    }
  }
  return -1;
    80009270:	57fd                	li	a5,-1
}
    80009272:	853e                	mv	a0,a5
    80009274:	7422                	ld	s0,40(sp)
    80009276:	6145                	addi	sp,sp,48
    80009278:	8082                	ret

000000008000927a <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    8000927a:	1101                	addi	sp,sp,-32
    8000927c:	ec06                	sd	ra,24(sp)
    8000927e:	e822                	sd	s0,16(sp)
    80009280:	1000                	addi	s0,sp,32
    80009282:	87aa                	mv	a5,a0
    80009284:	872e                	mv	a4,a1
    80009286:	fef42623          	sw	a5,-20(s0)
    8000928a:	87ba                	mv	a5,a4
    8000928c:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    80009290:	fe842783          	lw	a5,-24(s0)
    80009294:	0007871b          	sext.w	a4,a5
    80009298:	479d                	li	a5,7
    8000929a:	02e7d863          	bge	a5,a4,800092ca <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    8000929e:	0002c717          	auipc	a4,0x2c
    800092a2:	9ea70713          	addi	a4,a4,-1558 # 80034c88 <disk>
    800092a6:	fec42683          	lw	a3,-20(s0)
    800092aa:	15000793          	li	a5,336
    800092ae:	02f687b3          	mul	a5,a3,a5
    800092b2:	97ba                	add	a5,a5,a4
    800092b4:	639c                	ld	a5,0(a5)
    800092b6:	00002617          	auipc	a2,0x2
    800092ba:	4c260613          	addi	a2,a2,1218 # 8000b778 <etext+0x778>
    800092be:	85be                	mv	a1,a5
    800092c0:	4509                	li	a0,2
    800092c2:	ffff8097          	auipc	ra,0xffff8
    800092c6:	a1c080e7          	jalr	-1508(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    800092ca:	0002c697          	auipc	a3,0x2c
    800092ce:	9be68693          	addi	a3,a3,-1602 # 80034c88 <disk>
    800092d2:	fe842703          	lw	a4,-24(s0)
    800092d6:	fec42603          	lw	a2,-20(s0)
    800092da:	15000793          	li	a5,336
    800092de:	02f607b3          	mul	a5,a2,a5
    800092e2:	97b6                	add	a5,a5,a3
    800092e4:	97ba                	add	a5,a5,a4
    800092e6:	0207c783          	lbu	a5,32(a5)
    800092ea:	c79d                	beqz	a5,80009318 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    800092ec:	0002c717          	auipc	a4,0x2c
    800092f0:	99c70713          	addi	a4,a4,-1636 # 80034c88 <disk>
    800092f4:	fec42683          	lw	a3,-20(s0)
    800092f8:	15000793          	li	a5,336
    800092fc:	02f687b3          	mul	a5,a3,a5
    80009300:	97ba                	add	a5,a5,a4
    80009302:	639c                	ld	a5,0(a5)
    80009304:	00002617          	auipc	a2,0x2
    80009308:	48460613          	addi	a2,a2,1156 # 8000b788 <etext+0x788>
    8000930c:	85be                	mv	a1,a5
    8000930e:	4509                	li	a0,2
    80009310:	ffff8097          	auipc	ra,0xffff8
    80009314:	9ce080e7          	jalr	-1586(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    80009318:	0002c717          	auipc	a4,0x2c
    8000931c:	97070713          	addi	a4,a4,-1680 # 80034c88 <disk>
    80009320:	fec42683          	lw	a3,-20(s0)
    80009324:	15000793          	li	a5,336
    80009328:	02f687b3          	mul	a5,a3,a5
    8000932c:	97ba                	add	a5,a5,a4
    8000932e:	6798                	ld	a4,8(a5)
    80009330:	fe842783          	lw	a5,-24(s0)
    80009334:	0792                	slli	a5,a5,0x4
    80009336:	97ba                	add	a5,a5,a4
    80009338:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000933c:	0002c717          	auipc	a4,0x2c
    80009340:	94c70713          	addi	a4,a4,-1716 # 80034c88 <disk>
    80009344:	fec42683          	lw	a3,-20(s0)
    80009348:	15000793          	li	a5,336
    8000934c:	02f687b3          	mul	a5,a3,a5
    80009350:	97ba                	add	a5,a5,a4
    80009352:	6798                	ld	a4,8(a5)
    80009354:	fe842783          	lw	a5,-24(s0)
    80009358:	0792                	slli	a5,a5,0x4
    8000935a:	97ba                	add	a5,a5,a4
    8000935c:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    80009360:	0002c717          	auipc	a4,0x2c
    80009364:	92870713          	addi	a4,a4,-1752 # 80034c88 <disk>
    80009368:	fec42683          	lw	a3,-20(s0)
    8000936c:	15000793          	li	a5,336
    80009370:	02f687b3          	mul	a5,a3,a5
    80009374:	97ba                	add	a5,a5,a4
    80009376:	6798                	ld	a4,8(a5)
    80009378:	fe842783          	lw	a5,-24(s0)
    8000937c:	0792                	slli	a5,a5,0x4
    8000937e:	97ba                	add	a5,a5,a4
    80009380:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    80009384:	0002c717          	auipc	a4,0x2c
    80009388:	90470713          	addi	a4,a4,-1788 # 80034c88 <disk>
    8000938c:	fec42683          	lw	a3,-20(s0)
    80009390:	15000793          	li	a5,336
    80009394:	02f687b3          	mul	a5,a3,a5
    80009398:	97ba                	add	a5,a5,a4
    8000939a:	6798                	ld	a4,8(a5)
    8000939c:	fe842783          	lw	a5,-24(s0)
    800093a0:	0792                	slli	a5,a5,0x4
    800093a2:	97ba                	add	a5,a5,a4
    800093a4:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    800093a8:	0002c697          	auipc	a3,0x2c
    800093ac:	8e068693          	addi	a3,a3,-1824 # 80034c88 <disk>
    800093b0:	fe842703          	lw	a4,-24(s0)
    800093b4:	fec42603          	lw	a2,-20(s0)
    800093b8:	15000793          	li	a5,336
    800093bc:	02f607b3          	mul	a5,a2,a5
    800093c0:	97b6                	add	a5,a5,a3
    800093c2:	97ba                	add	a5,a5,a4
    800093c4:	4705                	li	a4,1
    800093c6:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    800093ca:	0002c717          	auipc	a4,0x2c
    800093ce:	8be70713          	addi	a4,a4,-1858 # 80034c88 <disk>
    800093d2:	fec42683          	lw	a3,-20(s0)
    800093d6:	15000793          	li	a5,336
    800093da:	02f687b3          	mul	a5,a3,a5
    800093de:	97ba                	add	a5,a5,a4
    800093e0:	1487a783          	lw	a5,328(a5)
    800093e4:	e39d                	bnez	a5,8000940a <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    800093e6:	fec42703          	lw	a4,-20(s0)
    800093ea:	15000793          	li	a5,336
    800093ee:	02f707b3          	mul	a5,a4,a5
    800093f2:	02078713          	addi	a4,a5,32
    800093f6:	0002c797          	auipc	a5,0x2c
    800093fa:	89278793          	addi	a5,a5,-1902 # 80034c88 <disk>
    800093fe:	97ba                	add	a5,a5,a4
    80009400:	853e                	mv	a0,a5
    80009402:	ffffa097          	auipc	ra,0xffffa
    80009406:	1f8080e7          	jalr	504(ra) # 800035fa <wakeup>
  }
}
    8000940a:	0001                	nop
    8000940c:	60e2                	ld	ra,24(sp)
    8000940e:	6442                	ld	s0,16(sp)
    80009410:	6105                	addi	sp,sp,32
    80009412:	8082                	ret

0000000080009414 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009414:	7179                	addi	sp,sp,-48
    80009416:	f406                	sd	ra,40(sp)
    80009418:	f022                	sd	s0,32(sp)
    8000941a:	1800                	addi	s0,sp,48
    8000941c:	87aa                	mv	a5,a0
    8000941e:	872e                	mv	a4,a1
    80009420:	fcf42e23          	sw	a5,-36(s0)
    80009424:	87ba                	mv	a5,a4
    80009426:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    8000942a:	0002c717          	auipc	a4,0x2c
    8000942e:	85e70713          	addi	a4,a4,-1954 # 80034c88 <disk>
    80009432:	fdc42683          	lw	a3,-36(s0)
    80009436:	15000793          	li	a5,336
    8000943a:	02f687b3          	mul	a5,a3,a5
    8000943e:	97ba                	add	a5,a5,a4
    80009440:	6798                	ld	a4,8(a5)
    80009442:	fd842783          	lw	a5,-40(s0)
    80009446:	0792                	slli	a5,a5,0x4
    80009448:	97ba                	add	a5,a5,a4
    8000944a:	00c7d783          	lhu	a5,12(a5)
    8000944e:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009452:	0002c717          	auipc	a4,0x2c
    80009456:	83670713          	addi	a4,a4,-1994 # 80034c88 <disk>
    8000945a:	fdc42683          	lw	a3,-36(s0)
    8000945e:	15000793          	li	a5,336
    80009462:	02f687b3          	mul	a5,a3,a5
    80009466:	97ba                	add	a5,a5,a4
    80009468:	6798                	ld	a4,8(a5)
    8000946a:	fd842783          	lw	a5,-40(s0)
    8000946e:	0792                	slli	a5,a5,0x4
    80009470:	97ba                	add	a5,a5,a4
    80009472:	00e7d783          	lhu	a5,14(a5)
    80009476:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    8000947a:	fd842703          	lw	a4,-40(s0)
    8000947e:	fdc42783          	lw	a5,-36(s0)
    80009482:	85ba                	mv	a1,a4
    80009484:	853e                	mv	a0,a5
    80009486:	00000097          	auipc	ra,0x0
    8000948a:	df4080e7          	jalr	-524(ra) # 8000927a <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    8000948e:	fec42783          	lw	a5,-20(s0)
    80009492:	8b85                	andi	a5,a5,1
    80009494:	2781                	sext.w	a5,a5
    80009496:	c791                	beqz	a5,800094a2 <free_chain+0x8e>
      i = nxt;
    80009498:	fe842783          	lw	a5,-24(s0)
    8000949c:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    800094a0:	b769                	j	8000942a <free_chain+0x16>
    else
      break;
    800094a2:	0001                	nop
  }
}
    800094a4:	0001                	nop
    800094a6:	70a2                	ld	ra,40(sp)
    800094a8:	7402                	ld	s0,32(sp)
    800094aa:	6145                	addi	sp,sp,48
    800094ac:	8082                	ret

00000000800094ae <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    800094ae:	7139                	addi	sp,sp,-64
    800094b0:	fc06                	sd	ra,56(sp)
    800094b2:	f822                	sd	s0,48(sp)
    800094b4:	f426                	sd	s1,40(sp)
    800094b6:	0080                	addi	s0,sp,64
    800094b8:	87aa                	mv	a5,a0
    800094ba:	fcb43023          	sd	a1,-64(s0)
    800094be:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    800094c2:	fc042e23          	sw	zero,-36(s0)
    800094c6:	a041                	j	80009546 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    800094c8:	fdc42783          	lw	a5,-36(s0)
    800094cc:	078a                	slli	a5,a5,0x2
    800094ce:	fc043703          	ld	a4,-64(s0)
    800094d2:	00f704b3          	add	s1,a4,a5
    800094d6:	fcc42783          	lw	a5,-52(s0)
    800094da:	853e                	mv	a0,a5
    800094dc:	00000097          	auipc	ra,0x0
    800094e0:	d22080e7          	jalr	-734(ra) # 800091fe <alloc_desc>
    800094e4:	87aa                	mv	a5,a0
    800094e6:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    800094e8:	fdc42783          	lw	a5,-36(s0)
    800094ec:	078a                	slli	a5,a5,0x2
    800094ee:	fc043703          	ld	a4,-64(s0)
    800094f2:	97ba                	add	a5,a5,a4
    800094f4:	439c                	lw	a5,0(a5)
    800094f6:	0407d363          	bgez	a5,8000953c <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    800094fa:	fc042c23          	sw	zero,-40(s0)
    800094fe:	a02d                	j	80009528 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    80009500:	fd842783          	lw	a5,-40(s0)
    80009504:	078a                	slli	a5,a5,0x2
    80009506:	fc043703          	ld	a4,-64(s0)
    8000950a:	97ba                	add	a5,a5,a4
    8000950c:	4398                	lw	a4,0(a5)
    8000950e:	fcc42783          	lw	a5,-52(s0)
    80009512:	85ba                	mv	a1,a4
    80009514:	853e                	mv	a0,a5
    80009516:	00000097          	auipc	ra,0x0
    8000951a:	d64080e7          	jalr	-668(ra) # 8000927a <free_desc>
      for(int j = 0; j < i; j++)
    8000951e:	fd842783          	lw	a5,-40(s0)
    80009522:	2785                	addiw	a5,a5,1
    80009524:	fcf42c23          	sw	a5,-40(s0)
    80009528:	fd842703          	lw	a4,-40(s0)
    8000952c:	fdc42783          	lw	a5,-36(s0)
    80009530:	2701                	sext.w	a4,a4
    80009532:	2781                	sext.w	a5,a5
    80009534:	fcf746e3          	blt	a4,a5,80009500 <alloc3_desc+0x52>
      return -1;
    80009538:	57fd                	li	a5,-1
    8000953a:	a831                	j	80009556 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    8000953c:	fdc42783          	lw	a5,-36(s0)
    80009540:	2785                	addiw	a5,a5,1
    80009542:	fcf42e23          	sw	a5,-36(s0)
    80009546:	fdc42783          	lw	a5,-36(s0)
    8000954a:	0007871b          	sext.w	a4,a5
    8000954e:	4789                	li	a5,2
    80009550:	f6e7dce3          	bge	a5,a4,800094c8 <alloc3_desc+0x1a>
    }
  }
  return 0;
    80009554:	4781                	li	a5,0
}
    80009556:	853e                	mv	a0,a5
    80009558:	70e2                	ld	ra,56(sp)
    8000955a:	7442                	ld	s0,48(sp)
    8000955c:	74a2                	ld	s1,40(sp)
    8000955e:	6121                	addi	sp,sp,64
    80009560:	8082                	ret

0000000080009562 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    80009562:	715d                	addi	sp,sp,-80
    80009564:	e486                	sd	ra,72(sp)
    80009566:	e0a2                	sd	s0,64(sp)
    80009568:	0880                	addi	s0,sp,80
    8000956a:	87aa                	mv	a5,a0
    8000956c:	fcb43023          	sd	a1,-64(s0)
    80009570:	8736                	mv	a4,a3
    80009572:	fcf42623          	sw	a5,-52(s0)
    80009576:	87b2                	mv	a5,a2
    80009578:	fcf42423          	sw	a5,-56(s0)
    8000957c:	87ba                	mv	a5,a4
    8000957e:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80009582:	fc043783          	ld	a5,-64(s0)
    80009586:	47dc                	lw	a5,12(a5)
    80009588:	0017979b          	slliw	a5,a5,0x1
    8000958c:	2781                	sext.w	a5,a5
    8000958e:	1782                	slli	a5,a5,0x20
    80009590:	9381                	srli	a5,a5,0x20
    80009592:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    80009596:	fcc42703          	lw	a4,-52(s0)
    8000959a:	15000793          	li	a5,336
    8000959e:	02f707b3          	mul	a5,a4,a5
    800095a2:	13078713          	addi	a4,a5,304
    800095a6:	0002b797          	auipc	a5,0x2b
    800095aa:	6e278793          	addi	a5,a5,1762 # 80034c88 <disk>
    800095ae:	97ba                	add	a5,a5,a4
    800095b0:	853e                	mv	a0,a5
    800095b2:	ffff8097          	auipc	ra,0xffff8
    800095b6:	d78080e7          	jalr	-648(ra) # 8000132a <acquire>
  disk[id].bw_transfer = busy_wait;
    800095ba:	0002b717          	auipc	a4,0x2b
    800095be:	6ce70713          	addi	a4,a4,1742 # 80034c88 <disk>
    800095c2:	fcc42683          	lw	a3,-52(s0)
    800095c6:	15000793          	li	a5,336
    800095ca:	02f687b3          	mul	a5,a3,a5
    800095ce:	97ba                	add	a5,a5,a4
    800095d0:	fbc42703          	lw	a4,-68(s0)
    800095d4:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    800095d8:	fd040713          	addi	a4,s0,-48
    800095dc:	fcc42783          	lw	a5,-52(s0)
    800095e0:	85ba                	mv	a1,a4
    800095e2:	853e                	mv	a0,a5
    800095e4:	00000097          	auipc	ra,0x0
    800095e8:	eca080e7          	jalr	-310(ra) # 800094ae <alloc3_desc>
    800095ec:	87aa                	mv	a5,a0
    800095ee:	c3e9                	beqz	a5,800096b0 <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    800095f0:	fbc42783          	lw	a5,-68(s0)
    800095f4:	2781                	sext.w	a5,a5
    800095f6:	e3b9                	bnez	a5,8000963c <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    800095f8:	fcc42703          	lw	a4,-52(s0)
    800095fc:	15000793          	li	a5,336
    80009600:	02f707b3          	mul	a5,a4,a5
    80009604:	02078713          	addi	a4,a5,32
    80009608:	0002b797          	auipc	a5,0x2b
    8000960c:	68078793          	addi	a5,a5,1664 # 80034c88 <disk>
    80009610:	00f706b3          	add	a3,a4,a5
    80009614:	fcc42703          	lw	a4,-52(s0)
    80009618:	15000793          	li	a5,336
    8000961c:	02f707b3          	mul	a5,a4,a5
    80009620:	13078713          	addi	a4,a5,304
    80009624:	0002b797          	auipc	a5,0x2b
    80009628:	66478793          	addi	a5,a5,1636 # 80034c88 <disk>
    8000962c:	97ba                	add	a5,a5,a4
    8000962e:	85be                	mv	a1,a5
    80009630:	8536                	mv	a0,a3
    80009632:	ffffa097          	auipc	ra,0xffffa
    80009636:	f4c080e7          	jalr	-180(ra) # 8000357e <sleep>
    8000963a:	bf79                	j	800095d8 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    8000963c:	fcc42703          	lw	a4,-52(s0)
    80009640:	15000793          	li	a5,336
    80009644:	02f707b3          	mul	a5,a4,a5
    80009648:	13078713          	addi	a4,a5,304
    8000964c:	0002b797          	auipc	a5,0x2b
    80009650:	63c78793          	addi	a5,a5,1596 # 80034c88 <disk>
    80009654:	97ba                	add	a5,a5,a4
    80009656:	853e                	mv	a0,a5
    80009658:	ffff8097          	auipc	ra,0xffff8
    8000965c:	d36080e7          	jalr	-714(ra) # 8000138e <release>
        intr_on();
    80009660:	fffff097          	auipc	ra,0xfffff
    80009664:	500080e7          	jalr	1280(ra) # 80008b60 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    80009668:	0001                	nop
    8000966a:	fd040713          	addi	a4,s0,-48
    8000966e:	fcc42783          	lw	a5,-52(s0)
    80009672:	85ba                	mv	a1,a4
    80009674:	853e                	mv	a0,a5
    80009676:	00000097          	auipc	ra,0x0
    8000967a:	e38080e7          	jalr	-456(ra) # 800094ae <alloc3_desc>
    8000967e:	87aa                	mv	a5,a0
    80009680:	f7ed                	bnez	a5,8000966a <virtio_disk_rw+0x108>
        intr_off();
    80009682:	fffff097          	auipc	ra,0xfffff
    80009686:	508080e7          	jalr	1288(ra) # 80008b8a <intr_off>
        acquire(&disk[id].vdisk_lock);
    8000968a:	fcc42703          	lw	a4,-52(s0)
    8000968e:	15000793          	li	a5,336
    80009692:	02f707b3          	mul	a5,a4,a5
    80009696:	13078713          	addi	a4,a5,304
    8000969a:	0002b797          	auipc	a5,0x2b
    8000969e:	5ee78793          	addi	a5,a5,1518 # 80034c88 <disk>
    800096a2:	97ba                	add	a5,a5,a4
    800096a4:	853e                	mv	a0,a5
    800096a6:	ffff8097          	auipc	ra,0xffff8
    800096aa:	c84080e7          	jalr	-892(ra) # 8000132a <acquire>
    if(alloc3_desc(id, idx) == 0) {
    800096ae:	b72d                	j	800095d8 <virtio_disk_rw+0x76>
      break;
    800096b0:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    800096b2:	fd042683          	lw	a3,-48(s0)
    800096b6:	fcc42703          	lw	a4,-52(s0)
    800096ba:	87ba                	mv	a5,a4
    800096bc:	078a                	slli	a5,a5,0x2
    800096be:	97ba                	add	a5,a5,a4
    800096c0:	078a                	slli	a5,a5,0x2
    800096c2:	97ba                	add	a5,a5,a4
    800096c4:	97b6                	add	a5,a5,a3
    800096c6:	07ad                	addi	a5,a5,11
    800096c8:	00479713          	slli	a4,a5,0x4
    800096cc:	0002b797          	auipc	a5,0x2b
    800096d0:	5bc78793          	addi	a5,a5,1468 # 80034c88 <disk>
    800096d4:	97ba                	add	a5,a5,a4
    800096d6:	fef43023          	sd	a5,-32(s0)

  if(write)
    800096da:	fc842783          	lw	a5,-56(s0)
    800096de:	2781                	sext.w	a5,a5
    800096e0:	c791                	beqz	a5,800096ec <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    800096e2:	fe043783          	ld	a5,-32(s0)
    800096e6:	4705                	li	a4,1
    800096e8:	c398                	sw	a4,0(a5)
    800096ea:	a029                	j	800096f4 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    800096ec:	fe043783          	ld	a5,-32(s0)
    800096f0:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    800096f4:	fe043783          	ld	a5,-32(s0)
    800096f8:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    800096fc:	fe043783          	ld	a5,-32(s0)
    80009700:	fe843703          	ld	a4,-24(s0)
    80009704:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    80009706:	0002b717          	auipc	a4,0x2b
    8000970a:	58270713          	addi	a4,a4,1410 # 80034c88 <disk>
    8000970e:	fcc42683          	lw	a3,-52(s0)
    80009712:	15000793          	li	a5,336
    80009716:	02f687b3          	mul	a5,a3,a5
    8000971a:	97ba                	add	a5,a5,a4
    8000971c:	6798                	ld	a4,8(a5)
    8000971e:	fd042783          	lw	a5,-48(s0)
    80009722:	0792                	slli	a5,a5,0x4
    80009724:	97ba                	add	a5,a5,a4
    80009726:	fe043703          	ld	a4,-32(s0)
    8000972a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    8000972c:	0002b717          	auipc	a4,0x2b
    80009730:	55c70713          	addi	a4,a4,1372 # 80034c88 <disk>
    80009734:	fcc42683          	lw	a3,-52(s0)
    80009738:	15000793          	li	a5,336
    8000973c:	02f687b3          	mul	a5,a3,a5
    80009740:	97ba                	add	a5,a5,a4
    80009742:	6798                	ld	a4,8(a5)
    80009744:	fd042783          	lw	a5,-48(s0)
    80009748:	0792                	slli	a5,a5,0x4
    8000974a:	97ba                	add	a5,a5,a4
    8000974c:	4741                	li	a4,16
    8000974e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009750:	0002b717          	auipc	a4,0x2b
    80009754:	53870713          	addi	a4,a4,1336 # 80034c88 <disk>
    80009758:	fcc42683          	lw	a3,-52(s0)
    8000975c:	15000793          	li	a5,336
    80009760:	02f687b3          	mul	a5,a3,a5
    80009764:	97ba                	add	a5,a5,a4
    80009766:	6798                	ld	a4,8(a5)
    80009768:	fd042783          	lw	a5,-48(s0)
    8000976c:	0792                	slli	a5,a5,0x4
    8000976e:	97ba                	add	a5,a5,a4
    80009770:	4705                	li	a4,1
    80009772:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    80009776:	fd442603          	lw	a2,-44(s0)
    8000977a:	0002b717          	auipc	a4,0x2b
    8000977e:	50e70713          	addi	a4,a4,1294 # 80034c88 <disk>
    80009782:	fcc42683          	lw	a3,-52(s0)
    80009786:	15000793          	li	a5,336
    8000978a:	02f687b3          	mul	a5,a3,a5
    8000978e:	97ba                	add	a5,a5,a4
    80009790:	6798                	ld	a4,8(a5)
    80009792:	fd042783          	lw	a5,-48(s0)
    80009796:	0792                	slli	a5,a5,0x4
    80009798:	97ba                	add	a5,a5,a4
    8000979a:	03061713          	slli	a4,a2,0x30
    8000979e:	9341                	srli	a4,a4,0x30
    800097a0:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    800097a4:	fc043783          	ld	a5,-64(s0)
    800097a8:	05878613          	addi	a2,a5,88
    800097ac:	0002b717          	auipc	a4,0x2b
    800097b0:	4dc70713          	addi	a4,a4,1244 # 80034c88 <disk>
    800097b4:	fcc42683          	lw	a3,-52(s0)
    800097b8:	15000793          	li	a5,336
    800097bc:	02f687b3          	mul	a5,a3,a5
    800097c0:	97ba                	add	a5,a5,a4
    800097c2:	6798                	ld	a4,8(a5)
    800097c4:	fd442783          	lw	a5,-44(s0)
    800097c8:	0792                	slli	a5,a5,0x4
    800097ca:	97ba                	add	a5,a5,a4
    800097cc:	8732                	mv	a4,a2
    800097ce:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    800097d0:	0002b717          	auipc	a4,0x2b
    800097d4:	4b870713          	addi	a4,a4,1208 # 80034c88 <disk>
    800097d8:	fcc42683          	lw	a3,-52(s0)
    800097dc:	15000793          	li	a5,336
    800097e0:	02f687b3          	mul	a5,a3,a5
    800097e4:	97ba                	add	a5,a5,a4
    800097e6:	6798                	ld	a4,8(a5)
    800097e8:	fd442783          	lw	a5,-44(s0)
    800097ec:	0792                	slli	a5,a5,0x4
    800097ee:	97ba                	add	a5,a5,a4
    800097f0:	40000713          	li	a4,1024
    800097f4:	c798                	sw	a4,8(a5)
  if(write)
    800097f6:	fc842783          	lw	a5,-56(s0)
    800097fa:	2781                	sext.w	a5,a5
    800097fc:	c785                	beqz	a5,80009824 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    800097fe:	0002b717          	auipc	a4,0x2b
    80009802:	48a70713          	addi	a4,a4,1162 # 80034c88 <disk>
    80009806:	fcc42683          	lw	a3,-52(s0)
    8000980a:	15000793          	li	a5,336
    8000980e:	02f687b3          	mul	a5,a3,a5
    80009812:	97ba                	add	a5,a5,a4
    80009814:	6798                	ld	a4,8(a5)
    80009816:	fd442783          	lw	a5,-44(s0)
    8000981a:	0792                	slli	a5,a5,0x4
    8000981c:	97ba                	add	a5,a5,a4
    8000981e:	00079623          	sh	zero,12(a5)
    80009822:	a025                	j	8000984a <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009824:	0002b717          	auipc	a4,0x2b
    80009828:	46470713          	addi	a4,a4,1124 # 80034c88 <disk>
    8000982c:	fcc42683          	lw	a3,-52(s0)
    80009830:	15000793          	li	a5,336
    80009834:	02f687b3          	mul	a5,a3,a5
    80009838:	97ba                	add	a5,a5,a4
    8000983a:	6798                	ld	a4,8(a5)
    8000983c:	fd442783          	lw	a5,-44(s0)
    80009840:	0792                	slli	a5,a5,0x4
    80009842:	97ba                	add	a5,a5,a4
    80009844:	4709                	li	a4,2
    80009846:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000984a:	0002b717          	auipc	a4,0x2b
    8000984e:	43e70713          	addi	a4,a4,1086 # 80034c88 <disk>
    80009852:	fcc42683          	lw	a3,-52(s0)
    80009856:	15000793          	li	a5,336
    8000985a:	02f687b3          	mul	a5,a3,a5
    8000985e:	97ba                	add	a5,a5,a4
    80009860:	6798                	ld	a4,8(a5)
    80009862:	fd442783          	lw	a5,-44(s0)
    80009866:	0792                	slli	a5,a5,0x4
    80009868:	97ba                	add	a5,a5,a4
    8000986a:	00c7d703          	lhu	a4,12(a5)
    8000986e:	0002b697          	auipc	a3,0x2b
    80009872:	41a68693          	addi	a3,a3,1050 # 80034c88 <disk>
    80009876:	fcc42603          	lw	a2,-52(s0)
    8000987a:	15000793          	li	a5,336
    8000987e:	02f607b3          	mul	a5,a2,a5
    80009882:	97b6                	add	a5,a5,a3
    80009884:	6794                	ld	a3,8(a5)
    80009886:	fd442783          	lw	a5,-44(s0)
    8000988a:	0792                	slli	a5,a5,0x4
    8000988c:	97b6                	add	a5,a5,a3
    8000988e:	00176713          	ori	a4,a4,1
    80009892:	1742                	slli	a4,a4,0x30
    80009894:	9341                	srli	a4,a4,0x30
    80009896:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    8000989a:	fd842603          	lw	a2,-40(s0)
    8000989e:	0002b717          	auipc	a4,0x2b
    800098a2:	3ea70713          	addi	a4,a4,1002 # 80034c88 <disk>
    800098a6:	fcc42683          	lw	a3,-52(s0)
    800098aa:	15000793          	li	a5,336
    800098ae:	02f687b3          	mul	a5,a3,a5
    800098b2:	97ba                	add	a5,a5,a4
    800098b4:	6798                	ld	a4,8(a5)
    800098b6:	fd442783          	lw	a5,-44(s0)
    800098ba:	0792                	slli	a5,a5,0x4
    800098bc:	97ba                	add	a5,a5,a4
    800098be:	03061713          	slli	a4,a2,0x30
    800098c2:	9341                	srli	a4,a4,0x30
    800098c4:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    800098c8:	fd042603          	lw	a2,-48(s0)
    800098cc:	0002b697          	auipc	a3,0x2b
    800098d0:	3bc68693          	addi	a3,a3,956 # 80034c88 <disk>
    800098d4:	fcc42703          	lw	a4,-52(s0)
    800098d8:	87ba                	mv	a5,a4
    800098da:	078a                	slli	a5,a5,0x2
    800098dc:	97ba                	add	a5,a5,a4
    800098de:	078a                	slli	a5,a5,0x2
    800098e0:	97ba                	add	a5,a5,a4
    800098e2:	97b2                	add	a5,a5,a2
    800098e4:	078d                	addi	a5,a5,3
    800098e6:	0792                	slli	a5,a5,0x4
    800098e8:	97b6                	add	a5,a5,a3
    800098ea:	577d                	li	a4,-1
    800098ec:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    800098f0:	fd042683          	lw	a3,-48(s0)
    800098f4:	fcc42703          	lw	a4,-52(s0)
    800098f8:	87ba                	mv	a5,a4
    800098fa:	078a                	slli	a5,a5,0x2
    800098fc:	97ba                	add	a5,a5,a4
    800098fe:	078a                	slli	a5,a5,0x2
    80009900:	97ba                	add	a5,a5,a4
    80009902:	97b6                	add	a5,a5,a3
    80009904:	078d                	addi	a5,a5,3
    80009906:	00479713          	slli	a4,a5,0x4
    8000990a:	0002b797          	auipc	a5,0x2b
    8000990e:	37e78793          	addi	a5,a5,894 # 80034c88 <disk>
    80009912:	97ba                	add	a5,a5,a4
    80009914:	00878613          	addi	a2,a5,8
    80009918:	0002b717          	auipc	a4,0x2b
    8000991c:	37070713          	addi	a4,a4,880 # 80034c88 <disk>
    80009920:	fcc42683          	lw	a3,-52(s0)
    80009924:	15000793          	li	a5,336
    80009928:	02f687b3          	mul	a5,a3,a5
    8000992c:	97ba                	add	a5,a5,a4
    8000992e:	6798                	ld	a4,8(a5)
    80009930:	fd842783          	lw	a5,-40(s0)
    80009934:	0792                	slli	a5,a5,0x4
    80009936:	97ba                	add	a5,a5,a4
    80009938:	8732                	mv	a4,a2
    8000993a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    8000993c:	0002b717          	auipc	a4,0x2b
    80009940:	34c70713          	addi	a4,a4,844 # 80034c88 <disk>
    80009944:	fcc42683          	lw	a3,-52(s0)
    80009948:	15000793          	li	a5,336
    8000994c:	02f687b3          	mul	a5,a3,a5
    80009950:	97ba                	add	a5,a5,a4
    80009952:	6798                	ld	a4,8(a5)
    80009954:	fd842783          	lw	a5,-40(s0)
    80009958:	0792                	slli	a5,a5,0x4
    8000995a:	97ba                	add	a5,a5,a4
    8000995c:	4705                	li	a4,1
    8000995e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009960:	0002b717          	auipc	a4,0x2b
    80009964:	32870713          	addi	a4,a4,808 # 80034c88 <disk>
    80009968:	fcc42683          	lw	a3,-52(s0)
    8000996c:	15000793          	li	a5,336
    80009970:	02f687b3          	mul	a5,a3,a5
    80009974:	97ba                	add	a5,a5,a4
    80009976:	6798                	ld	a4,8(a5)
    80009978:	fd842783          	lw	a5,-40(s0)
    8000997c:	0792                	slli	a5,a5,0x4
    8000997e:	97ba                	add	a5,a5,a4
    80009980:	4709                	li	a4,2
    80009982:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009986:	0002b717          	auipc	a4,0x2b
    8000998a:	30270713          	addi	a4,a4,770 # 80034c88 <disk>
    8000998e:	fcc42683          	lw	a3,-52(s0)
    80009992:	15000793          	li	a5,336
    80009996:	02f687b3          	mul	a5,a3,a5
    8000999a:	97ba                	add	a5,a5,a4
    8000999c:	6798                	ld	a4,8(a5)
    8000999e:	fd842783          	lw	a5,-40(s0)
    800099a2:	0792                	slli	a5,a5,0x4
    800099a4:	97ba                	add	a5,a5,a4
    800099a6:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    800099aa:	fc043783          	ld	a5,-64(s0)
    800099ae:	4705                	li	a4,1
    800099b0:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    800099b2:	fd042603          	lw	a2,-48(s0)
    800099b6:	0002b697          	auipc	a3,0x2b
    800099ba:	2d268693          	addi	a3,a3,722 # 80034c88 <disk>
    800099be:	fcc42703          	lw	a4,-52(s0)
    800099c2:	87ba                	mv	a5,a4
    800099c4:	078a                	slli	a5,a5,0x2
    800099c6:	97ba                	add	a5,a5,a4
    800099c8:	078a                	slli	a5,a5,0x2
    800099ca:	97ba                	add	a5,a5,a4
    800099cc:	97b2                	add	a5,a5,a2
    800099ce:	078d                	addi	a5,a5,3
    800099d0:	0792                	slli	a5,a5,0x4
    800099d2:	97b6                	add	a5,a5,a3
    800099d4:	fc043703          	ld	a4,-64(s0)
    800099d8:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    800099da:	fd042583          	lw	a1,-48(s0)
    800099de:	0002b717          	auipc	a4,0x2b
    800099e2:	2aa70713          	addi	a4,a4,682 # 80034c88 <disk>
    800099e6:	fcc42683          	lw	a3,-52(s0)
    800099ea:	15000793          	li	a5,336
    800099ee:	02f687b3          	mul	a5,a3,a5
    800099f2:	97ba                	add	a5,a5,a4
    800099f4:	6b94                	ld	a3,16(a5)
    800099f6:	0002b717          	auipc	a4,0x2b
    800099fa:	29270713          	addi	a4,a4,658 # 80034c88 <disk>
    800099fe:	fcc42603          	lw	a2,-52(s0)
    80009a02:	15000793          	li	a5,336
    80009a06:	02f607b3          	mul	a5,a2,a5
    80009a0a:	97ba                	add	a5,a5,a4
    80009a0c:	6b9c                	ld	a5,16(a5)
    80009a0e:	0027d783          	lhu	a5,2(a5)
    80009a12:	2781                	sext.w	a5,a5
    80009a14:	8b9d                	andi	a5,a5,7
    80009a16:	2781                	sext.w	a5,a5
    80009a18:	03059713          	slli	a4,a1,0x30
    80009a1c:	9341                	srli	a4,a4,0x30
    80009a1e:	0786                	slli	a5,a5,0x1
    80009a20:	97b6                	add	a5,a5,a3
    80009a22:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009a26:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009a2a:	0002b717          	auipc	a4,0x2b
    80009a2e:	25e70713          	addi	a4,a4,606 # 80034c88 <disk>
    80009a32:	fcc42683          	lw	a3,-52(s0)
    80009a36:	15000793          	li	a5,336
    80009a3a:	02f687b3          	mul	a5,a3,a5
    80009a3e:	97ba                	add	a5,a5,a4
    80009a40:	6b9c                	ld	a5,16(a5)
    80009a42:	0027d703          	lhu	a4,2(a5)
    80009a46:	0002b697          	auipc	a3,0x2b
    80009a4a:	24268693          	addi	a3,a3,578 # 80034c88 <disk>
    80009a4e:	fcc42603          	lw	a2,-52(s0)
    80009a52:	15000793          	li	a5,336
    80009a56:	02f607b3          	mul	a5,a2,a5
    80009a5a:	97b6                	add	a5,a5,a3
    80009a5c:	6b9c                	ld	a5,16(a5)
    80009a5e:	2705                	addiw	a4,a4,1
    80009a60:	1742                	slli	a4,a4,0x30
    80009a62:	9341                	srli	a4,a4,0x30
    80009a64:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009a68:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009a6c:	fcc42703          	lw	a4,-52(s0)
    80009a70:	67c1                	lui	a5,0x10
    80009a72:	0785                	addi	a5,a5,1
    80009a74:	97ba                	add	a5,a5,a4
    80009a76:	07b2                	slli	a5,a5,0xc
    80009a78:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009a7c:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009a80:	a871                	j	80009b1c <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009a82:	fbc42783          	lw	a5,-68(s0)
    80009a86:	2781                	sext.w	a5,a5
    80009a88:	e795                	bnez	a5,80009ab4 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009a8a:	fcc42703          	lw	a4,-52(s0)
    80009a8e:	15000793          	li	a5,336
    80009a92:	02f707b3          	mul	a5,a4,a5
    80009a96:	13078713          	addi	a4,a5,304
    80009a9a:	0002b797          	auipc	a5,0x2b
    80009a9e:	1ee78793          	addi	a5,a5,494 # 80034c88 <disk>
    80009aa2:	97ba                	add	a5,a5,a4
    80009aa4:	85be                	mv	a1,a5
    80009aa6:	fc043503          	ld	a0,-64(s0)
    80009aaa:	ffffa097          	auipc	ra,0xffffa
    80009aae:	ad4080e7          	jalr	-1324(ra) # 8000357e <sleep>
    80009ab2:	a0ad                	j	80009b1c <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009ab4:	fcc42703          	lw	a4,-52(s0)
    80009ab8:	15000793          	li	a5,336
    80009abc:	02f707b3          	mul	a5,a4,a5
    80009ac0:	13078713          	addi	a4,a5,304
    80009ac4:	0002b797          	auipc	a5,0x2b
    80009ac8:	1c478793          	addi	a5,a5,452 # 80034c88 <disk>
    80009acc:	97ba                	add	a5,a5,a4
    80009ace:	853e                	mv	a0,a5
    80009ad0:	ffff8097          	auipc	ra,0xffff8
    80009ad4:	8be080e7          	jalr	-1858(ra) # 8000138e <release>
        intr_on();
    80009ad8:	fffff097          	auipc	ra,0xfffff
    80009adc:	088080e7          	jalr	136(ra) # 80008b60 <intr_on>
        while(b->disk == 1);
    80009ae0:	0001                	nop
    80009ae2:	fc043783          	ld	a5,-64(s0)
    80009ae6:	43dc                	lw	a5,4(a5)
    80009ae8:	873e                	mv	a4,a5
    80009aea:	4785                	li	a5,1
    80009aec:	fef70be3          	beq	a4,a5,80009ae2 <virtio_disk_rw+0x580>
        intr_off();
    80009af0:	fffff097          	auipc	ra,0xfffff
    80009af4:	09a080e7          	jalr	154(ra) # 80008b8a <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009af8:	fcc42703          	lw	a4,-52(s0)
    80009afc:	15000793          	li	a5,336
    80009b00:	02f707b3          	mul	a5,a4,a5
    80009b04:	13078713          	addi	a4,a5,304
    80009b08:	0002b797          	auipc	a5,0x2b
    80009b0c:	18078793          	addi	a5,a5,384 # 80034c88 <disk>
    80009b10:	97ba                	add	a5,a5,a4
    80009b12:	853e                	mv	a0,a5
    80009b14:	ffff8097          	auipc	ra,0xffff8
    80009b18:	816080e7          	jalr	-2026(ra) # 8000132a <acquire>
  while(b->disk == 1) {
    80009b1c:	fc043783          	ld	a5,-64(s0)
    80009b20:	43dc                	lw	a5,4(a5)
    80009b22:	873e                	mv	a4,a5
    80009b24:	4785                	li	a5,1
    80009b26:	f4f70ee3          	beq	a4,a5,80009a82 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    80009b2a:	fd042603          	lw	a2,-48(s0)
    80009b2e:	0002b697          	auipc	a3,0x2b
    80009b32:	15a68693          	addi	a3,a3,346 # 80034c88 <disk>
    80009b36:	fcc42703          	lw	a4,-52(s0)
    80009b3a:	87ba                	mv	a5,a4
    80009b3c:	078a                	slli	a5,a5,0x2
    80009b3e:	97ba                	add	a5,a5,a4
    80009b40:	078a                	slli	a5,a5,0x2
    80009b42:	97ba                	add	a5,a5,a4
    80009b44:	97b2                	add	a5,a5,a2
    80009b46:	078d                	addi	a5,a5,3
    80009b48:	0792                	slli	a5,a5,0x4
    80009b4a:	97b6                	add	a5,a5,a3
    80009b4c:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    80009b50:	fd042703          	lw	a4,-48(s0)
    80009b54:	fcc42783          	lw	a5,-52(s0)
    80009b58:	85ba                	mv	a1,a4
    80009b5a:	853e                	mv	a0,a5
    80009b5c:	00000097          	auipc	ra,0x0
    80009b60:	8b8080e7          	jalr	-1864(ra) # 80009414 <free_chain>

  release(&disk[id].vdisk_lock);
    80009b64:	fcc42703          	lw	a4,-52(s0)
    80009b68:	15000793          	li	a5,336
    80009b6c:	02f707b3          	mul	a5,a4,a5
    80009b70:	13078713          	addi	a4,a5,304
    80009b74:	0002b797          	auipc	a5,0x2b
    80009b78:	11478793          	addi	a5,a5,276 # 80034c88 <disk>
    80009b7c:	97ba                	add	a5,a5,a4
    80009b7e:	853e                	mv	a0,a5
    80009b80:	ffff8097          	auipc	ra,0xffff8
    80009b84:	80e080e7          	jalr	-2034(ra) # 8000138e <release>
}
    80009b88:	0001                	nop
    80009b8a:	60a6                	ld	ra,72(sp)
    80009b8c:	6406                	ld	s0,64(sp)
    80009b8e:	6161                	addi	sp,sp,80
    80009b90:	8082                	ret

0000000080009b92 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009b92:	7179                	addi	sp,sp,-48
    80009b94:	f406                	sd	ra,40(sp)
    80009b96:	f022                	sd	s0,32(sp)
    80009b98:	1800                	addi	s0,sp,48
    80009b9a:	87aa                	mv	a5,a0
    80009b9c:	fcb43823          	sd	a1,-48(s0)
    80009ba0:	8732                	mv	a4,a2
    80009ba2:	fcf42e23          	sw	a5,-36(s0)
    80009ba6:	87ba                	mv	a5,a4
    80009ba8:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009bac:	0002b797          	auipc	a5,0x2b
    80009bb0:	37c78793          	addi	a5,a5,892 # 80034f28 <swap_buffer>
    80009bb4:	639c                	ld	a5,0(a5)
    80009bb6:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009bba:	fdc42703          	lw	a4,-36(s0)
    80009bbe:	fe843783          	ld	a5,-24(s0)
    80009bc2:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    80009bc4:	fe843783          	ld	a5,-24(s0)
    80009bc8:	05878793          	addi	a5,a5,88
    80009bcc:	40000613          	li	a2,1024
    80009bd0:	fd043583          	ld	a1,-48(s0)
    80009bd4:	853e                	mv	a0,a5
    80009bd6:	ffff8097          	auipc	ra,0xffff8
    80009bda:	a0c080e7          	jalr	-1524(ra) # 800015e2 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    80009bde:	fd842783          	lw	a5,-40(s0)
    80009be2:	86be                	mv	a3,a5
    80009be4:	4605                	li	a2,1
    80009be6:	fe843583          	ld	a1,-24(s0)
    80009bea:	4505                	li	a0,1
    80009bec:	00000097          	auipc	ra,0x0
    80009bf0:	976080e7          	jalr	-1674(ra) # 80009562 <virtio_disk_rw>
}
    80009bf4:	0001                	nop
    80009bf6:	70a2                	ld	ra,40(sp)
    80009bf8:	7402                	ld	s0,32(sp)
    80009bfa:	6145                	addi	sp,sp,48
    80009bfc:	8082                	ret

0000000080009bfe <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009bfe:	7179                	addi	sp,sp,-48
    80009c00:	f406                	sd	ra,40(sp)
    80009c02:	f022                	sd	s0,32(sp)
    80009c04:	1800                	addi	s0,sp,48
    80009c06:	87aa                	mv	a5,a0
    80009c08:	fcb43823          	sd	a1,-48(s0)
    80009c0c:	8732                	mv	a4,a2
    80009c0e:	fcf42e23          	sw	a5,-36(s0)
    80009c12:	87ba                	mv	a5,a4
    80009c14:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009c18:	0002b797          	auipc	a5,0x2b
    80009c1c:	31078793          	addi	a5,a5,784 # 80034f28 <swap_buffer>
    80009c20:	639c                	ld	a5,0(a5)
    80009c22:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009c26:	fdc42703          	lw	a4,-36(s0)
    80009c2a:	fe843783          	ld	a5,-24(s0)
    80009c2e:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    80009c30:	fd842783          	lw	a5,-40(s0)
    80009c34:	86be                	mv	a3,a5
    80009c36:	4601                	li	a2,0
    80009c38:	fe843583          	ld	a1,-24(s0)
    80009c3c:	4505                	li	a0,1
    80009c3e:	00000097          	auipc	ra,0x0
    80009c42:	924080e7          	jalr	-1756(ra) # 80009562 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009c46:	fe843783          	ld	a5,-24(s0)
    80009c4a:	05878793          	addi	a5,a5,88
    80009c4e:	40000613          	li	a2,1024
    80009c52:	85be                	mv	a1,a5
    80009c54:	fd043503          	ld	a0,-48(s0)
    80009c58:	ffff8097          	auipc	ra,0xffff8
    80009c5c:	98a080e7          	jalr	-1654(ra) # 800015e2 <memmove>
}
    80009c60:	0001                	nop
    80009c62:	70a2                	ld	ra,40(sp)
    80009c64:	7402                	ld	s0,32(sp)
    80009c66:	6145                	addi	sp,sp,48
    80009c68:	8082                	ret

0000000080009c6a <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    80009c6a:	7179                	addi	sp,sp,-48
    80009c6c:	f406                	sd	ra,40(sp)
    80009c6e:	f022                	sd	s0,32(sp)
    80009c70:	1800                	addi	s0,sp,48
    80009c72:	87aa                	mv	a5,a0
    80009c74:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    80009c78:	fdc42703          	lw	a4,-36(s0)
    80009c7c:	15000793          	li	a5,336
    80009c80:	02f707b3          	mul	a5,a4,a5
    80009c84:	13078713          	addi	a4,a5,304
    80009c88:	0002b797          	auipc	a5,0x2b
    80009c8c:	00078793          	mv	a5,a5
    80009c90:	97ba                	add	a5,a5,a4
    80009c92:	853e                	mv	a0,a5
    80009c94:	ffff7097          	auipc	ra,0xffff7
    80009c98:	696080e7          	jalr	1686(ra) # 8000132a <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80009c9c:	fdc42703          	lw	a4,-36(s0)
    80009ca0:	67c1                	lui	a5,0x10
    80009ca2:	0785                	addi	a5,a5,1
    80009ca4:	97ba                	add	a5,a5,a4
    80009ca6:	07b2                	slli	a5,a5,0xc
    80009ca8:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    80009cac:	439c                	lw	a5,0(a5)
    80009cae:	0007869b          	sext.w	a3,a5
    80009cb2:	fdc42703          	lw	a4,-36(s0)
    80009cb6:	67c1                	lui	a5,0x10
    80009cb8:	0785                	addi	a5,a5,1
    80009cba:	97ba                	add	a5,a5,a4
    80009cbc:	07b2                	slli	a5,a5,0xc
    80009cbe:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    80009cc2:	873e                	mv	a4,a5
    80009cc4:	87b6                	mv	a5,a3
    80009cc6:	8b8d                	andi	a5,a5,3
    80009cc8:	2781                	sext.w	a5,a5
    80009cca:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    80009ccc:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    80009cd0:	aa05                	j	80009e00 <virtio_disk_intr+0x196>
    __sync_synchronize();
    80009cd2:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    80009cd6:	0002b717          	auipc	a4,0x2b
    80009cda:	fb270713          	addi	a4,a4,-78 # 80034c88 <disk>
    80009cde:	fdc42683          	lw	a3,-36(s0)
    80009ce2:	15000793          	li	a5,336
    80009ce6:	02f687b3          	mul	a5,a3,a5
    80009cea:	97ba                	add	a5,a5,a4
    80009cec:	6f98                	ld	a4,24(a5)
    80009cee:	0002b697          	auipc	a3,0x2b
    80009cf2:	f9a68693          	addi	a3,a3,-102 # 80034c88 <disk>
    80009cf6:	fdc42603          	lw	a2,-36(s0)
    80009cfa:	15000793          	li	a5,336
    80009cfe:	02f607b3          	mul	a5,a2,a5
    80009d02:	97b6                	add	a5,a5,a3
    80009d04:	0287d783          	lhu	a5,40(a5)
    80009d08:	2781                	sext.w	a5,a5
    80009d0a:	8b9d                	andi	a5,a5,7
    80009d0c:	2781                	sext.w	a5,a5
    80009d0e:	078e                	slli	a5,a5,0x3
    80009d10:	97ba                	add	a5,a5,a4
    80009d12:	43dc                	lw	a5,4(a5)
    80009d14:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    80009d18:	0002b697          	auipc	a3,0x2b
    80009d1c:	f7068693          	addi	a3,a3,-144 # 80034c88 <disk>
    80009d20:	fec42603          	lw	a2,-20(s0)
    80009d24:	fdc42703          	lw	a4,-36(s0)
    80009d28:	87ba                	mv	a5,a4
    80009d2a:	078a                	slli	a5,a5,0x2
    80009d2c:	97ba                	add	a5,a5,a4
    80009d2e:	078a                	slli	a5,a5,0x2
    80009d30:	97ba                	add	a5,a5,a4
    80009d32:	97b2                	add	a5,a5,a2
    80009d34:	078d                	addi	a5,a5,3
    80009d36:	0792                	slli	a5,a5,0x4
    80009d38:	97b6                	add	a5,a5,a3
    80009d3a:	0087c783          	lbu	a5,8(a5)
    80009d3e:	c79d                	beqz	a5,80009d6c <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    80009d40:	0002b717          	auipc	a4,0x2b
    80009d44:	f4870713          	addi	a4,a4,-184 # 80034c88 <disk>
    80009d48:	fdc42683          	lw	a3,-36(s0)
    80009d4c:	15000793          	li	a5,336
    80009d50:	02f687b3          	mul	a5,a3,a5
    80009d54:	97ba                	add	a5,a5,a4
    80009d56:	639c                	ld	a5,0(a5)
    80009d58:	00002617          	auipc	a2,0x2
    80009d5c:	a4060613          	addi	a2,a2,-1472 # 8000b798 <etext+0x798>
    80009d60:	85be                	mv	a1,a5
    80009d62:	4509                	li	a0,2
    80009d64:	ffff7097          	auipc	ra,0xffff7
    80009d68:	f7a080e7          	jalr	-134(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    80009d6c:	0002b697          	auipc	a3,0x2b
    80009d70:	f1c68693          	addi	a3,a3,-228 # 80034c88 <disk>
    80009d74:	fec42603          	lw	a2,-20(s0)
    80009d78:	fdc42703          	lw	a4,-36(s0)
    80009d7c:	87ba                	mv	a5,a4
    80009d7e:	078a                	slli	a5,a5,0x2
    80009d80:	97ba                	add	a5,a5,a4
    80009d82:	078a                	slli	a5,a5,0x2
    80009d84:	97ba                	add	a5,a5,a4
    80009d86:	97b2                	add	a5,a5,a2
    80009d88:	078d                	addi	a5,a5,3
    80009d8a:	0792                	slli	a5,a5,0x4
    80009d8c:	97b6                	add	a5,a5,a3
    80009d8e:	639c                	ld	a5,0(a5)
    80009d90:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009d94:	fe043783          	ld	a5,-32(s0)
    80009d98:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    80009d9c:	0002b717          	auipc	a4,0x2b
    80009da0:	eec70713          	addi	a4,a4,-276 # 80034c88 <disk>
    80009da4:	fdc42683          	lw	a3,-36(s0)
    80009da8:	15000793          	li	a5,336
    80009dac:	02f687b3          	mul	a5,a3,a5
    80009db0:	97ba                	add	a5,a5,a4
    80009db2:	1487a783          	lw	a5,328(a5)
    80009db6:	e799                	bnez	a5,80009dc4 <virtio_disk_intr+0x15a>
        wakeup(b);
    80009db8:	fe043503          	ld	a0,-32(s0)
    80009dbc:	ffffa097          	auipc	ra,0xffffa
    80009dc0:	83e080e7          	jalr	-1986(ra) # 800035fa <wakeup>
    }

    disk[id].used_idx += 1;
    80009dc4:	0002b717          	auipc	a4,0x2b
    80009dc8:	ec470713          	addi	a4,a4,-316 # 80034c88 <disk>
    80009dcc:	fdc42683          	lw	a3,-36(s0)
    80009dd0:	15000793          	li	a5,336
    80009dd4:	02f687b3          	mul	a5,a3,a5
    80009dd8:	97ba                	add	a5,a5,a4
    80009dda:	0287d783          	lhu	a5,40(a5)
    80009dde:	2785                	addiw	a5,a5,1
    80009de0:	03079713          	slli	a4,a5,0x30
    80009de4:	9341                	srli	a4,a4,0x30
    80009de6:	0002b697          	auipc	a3,0x2b
    80009dea:	ea268693          	addi	a3,a3,-350 # 80034c88 <disk>
    80009dee:	fdc42603          	lw	a2,-36(s0)
    80009df2:	15000793          	li	a5,336
    80009df6:	02f607b3          	mul	a5,a2,a5
    80009dfa:	97b6                	add	a5,a5,a3
    80009dfc:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    80009e00:	0002b717          	auipc	a4,0x2b
    80009e04:	e8870713          	addi	a4,a4,-376 # 80034c88 <disk>
    80009e08:	fdc42683          	lw	a3,-36(s0)
    80009e0c:	15000793          	li	a5,336
    80009e10:	02f687b3          	mul	a5,a3,a5
    80009e14:	97ba                	add	a5,a5,a4
    80009e16:	0287d603          	lhu	a2,40(a5)
    80009e1a:	0002b717          	auipc	a4,0x2b
    80009e1e:	e6e70713          	addi	a4,a4,-402 # 80034c88 <disk>
    80009e22:	fdc42683          	lw	a3,-36(s0)
    80009e26:	15000793          	li	a5,336
    80009e2a:	02f687b3          	mul	a5,a3,a5
    80009e2e:	97ba                	add	a5,a5,a4
    80009e30:	6f9c                	ld	a5,24(a5)
    80009e32:	0027d783          	lhu	a5,2(a5)
    80009e36:	0006071b          	sext.w	a4,a2
    80009e3a:	2781                	sext.w	a5,a5
    80009e3c:	e8f71be3          	bne	a4,a5,80009cd2 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    80009e40:	fdc42703          	lw	a4,-36(s0)
    80009e44:	15000793          	li	a5,336
    80009e48:	02f707b3          	mul	a5,a4,a5
    80009e4c:	13078713          	addi	a4,a5,304
    80009e50:	0002b797          	auipc	a5,0x2b
    80009e54:	e3878793          	addi	a5,a5,-456 # 80034c88 <disk>
    80009e58:	97ba                	add	a5,a5,a4
    80009e5a:	853e                	mv	a0,a5
    80009e5c:	ffff7097          	auipc	ra,0xffff7
    80009e60:	532080e7          	jalr	1330(ra) # 8000138e <release>
}
    80009e64:	0001                	nop
    80009e66:	70a2                	ld	ra,40(sp)
    80009e68:	7402                	ld	s0,32(sp)
    80009e6a:	6145                	addi	sp,sp,48
    80009e6c:	8082                	ret
	...

000000008000a000 <_trampoline>:
    8000a000:	14051073          	csrw	sscratch,a0
    8000a004:	02000537          	lui	a0,0x2000
    8000a008:	357d                	addiw	a0,a0,-1
    8000a00a:	0536                	slli	a0,a0,0xd
    8000a00c:	02153423          	sd	ra,40(a0) # 2000028 <_entry-0x7dffffd8>
    8000a010:	02253823          	sd	sp,48(a0)
    8000a014:	02353c23          	sd	gp,56(a0)
    8000a018:	04453023          	sd	tp,64(a0)
    8000a01c:	04553423          	sd	t0,72(a0)
    8000a020:	04653823          	sd	t1,80(a0)
    8000a024:	04753c23          	sd	t2,88(a0)
    8000a028:	f120                	sd	s0,96(a0)
    8000a02a:	f524                	sd	s1,104(a0)
    8000a02c:	fd2c                	sd	a1,120(a0)
    8000a02e:	e150                	sd	a2,128(a0)
    8000a030:	e554                	sd	a3,136(a0)
    8000a032:	e958                	sd	a4,144(a0)
    8000a034:	ed5c                	sd	a5,152(a0)
    8000a036:	0b053023          	sd	a6,160(a0)
    8000a03a:	0b153423          	sd	a7,168(a0)
    8000a03e:	0b253823          	sd	s2,176(a0)
    8000a042:	0b353c23          	sd	s3,184(a0)
    8000a046:	0d453023          	sd	s4,192(a0)
    8000a04a:	0d553423          	sd	s5,200(a0)
    8000a04e:	0d653823          	sd	s6,208(a0)
    8000a052:	0d753c23          	sd	s7,216(a0)
    8000a056:	0f853023          	sd	s8,224(a0)
    8000a05a:	0f953423          	sd	s9,232(a0)
    8000a05e:	0fa53823          	sd	s10,240(a0)
    8000a062:	0fb53c23          	sd	s11,248(a0)
    8000a066:	11c53023          	sd	t3,256(a0)
    8000a06a:	11d53423          	sd	t4,264(a0)
    8000a06e:	11e53823          	sd	t5,272(a0)
    8000a072:	11f53c23          	sd	t6,280(a0)
    8000a076:	140022f3          	csrr	t0,sscratch
    8000a07a:	06553823          	sd	t0,112(a0)
    8000a07e:	00853103          	ld	sp,8(a0)
    8000a082:	02053203          	ld	tp,32(a0)
    8000a086:	01053283          	ld	t0,16(a0)
    8000a08a:	00053303          	ld	t1,0(a0)
    8000a08e:	12000073          	sfence.vma
    8000a092:	18031073          	csrw	satp,t1
    8000a096:	12000073          	sfence.vma
    8000a09a:	8282                	jr	t0

000000008000a09c <userret>:
    8000a09c:	12000073          	sfence.vma
    8000a0a0:	18051073          	csrw	satp,a0
    8000a0a4:	12000073          	sfence.vma
    8000a0a8:	02000537          	lui	a0,0x2000
    8000a0ac:	357d                	addiw	a0,a0,-1
    8000a0ae:	0536                	slli	a0,a0,0xd
    8000a0b0:	02853083          	ld	ra,40(a0) # 2000028 <_entry-0x7dffffd8>
    8000a0b4:	03053103          	ld	sp,48(a0)
    8000a0b8:	03853183          	ld	gp,56(a0)
    8000a0bc:	04053203          	ld	tp,64(a0)
    8000a0c0:	04853283          	ld	t0,72(a0)
    8000a0c4:	05053303          	ld	t1,80(a0)
    8000a0c8:	05853383          	ld	t2,88(a0)
    8000a0cc:	7120                	ld	s0,96(a0)
    8000a0ce:	7524                	ld	s1,104(a0)
    8000a0d0:	7d2c                	ld	a1,120(a0)
    8000a0d2:	6150                	ld	a2,128(a0)
    8000a0d4:	6554                	ld	a3,136(a0)
    8000a0d6:	6958                	ld	a4,144(a0)
    8000a0d8:	6d5c                	ld	a5,152(a0)
    8000a0da:	0a053803          	ld	a6,160(a0)
    8000a0de:	0a853883          	ld	a7,168(a0)
    8000a0e2:	0b053903          	ld	s2,176(a0)
    8000a0e6:	0b853983          	ld	s3,184(a0)
    8000a0ea:	0c053a03          	ld	s4,192(a0)
    8000a0ee:	0c853a83          	ld	s5,200(a0)
    8000a0f2:	0d053b03          	ld	s6,208(a0)
    8000a0f6:	0d853b83          	ld	s7,216(a0)
    8000a0fa:	0e053c03          	ld	s8,224(a0)
    8000a0fe:	0e853c83          	ld	s9,232(a0)
    8000a102:	0f053d03          	ld	s10,240(a0)
    8000a106:	0f853d83          	ld	s11,248(a0)
    8000a10a:	10053e03          	ld	t3,256(a0)
    8000a10e:	10853e83          	ld	t4,264(a0)
    8000a112:	11053f03          	ld	t5,272(a0)
    8000a116:	11853f83          	ld	t6,280(a0)
    8000a11a:	7928                	ld	a0,112(a0)
    8000a11c:	10200073          	sret
	...
