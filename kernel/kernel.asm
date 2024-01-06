
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	90813103          	ld	sp,-1784(sp) # 8000c908 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffc08cf>
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
    800001fe:	6f678793          	addi	a5,a5,1782 # 800018f0 <main>
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
    800002e2:	00014717          	auipc	a4,0x14
    800002e6:	66e70713          	addi	a4,a4,1646 # 80014950 <timer_scratch>
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
    80000326:	00009797          	auipc	a5,0x9
    8000032a:	bfa78793          	addi	a5,a5,-1030 # 80008f20 <timervec>
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
    80000404:	00004097          	auipc	ra,0x4
    80000408:	8f8080e7          	jalr	-1800(ra) # 80003cfc <either_copyin>
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
    80000474:	00014517          	auipc	a0,0x14
    80000478:	61c50513          	addi	a0,a0,1564 # 80014a90 <cons>
    8000047c:	00001097          	auipc	ra,0x1
    80000480:	eec080e7          	jalr	-276(ra) # 80001368 <acquire>
  while(n > 0){
    80000484:	a23d                	j	800005b2 <consoleread+0x160>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    80000486:	00003097          	auipc	ra,0x3
    8000048a:	9f2080e7          	jalr	-1550(ra) # 80002e78 <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	7b6080e7          	jalr	1974(ra) # 80003c48 <killed>
    8000049a:	87aa                	mv	a5,a0
    8000049c:	cb99                	beqz	a5,800004b2 <consoleread+0x60>
        release(&cons.lock);
    8000049e:	00014517          	auipc	a0,0x14
    800004a2:	5f250513          	addi	a0,a0,1522 # 80014a90 <cons>
    800004a6:	00001097          	auipc	ra,0x1
    800004aa:	f26080e7          	jalr	-218(ra) # 800013cc <release>
        return -1;
    800004ae:	57fd                	li	a5,-1
    800004b0:	aa25                	j	800005e8 <consoleread+0x196>
      }
      sleep(&cons.r, &cons.lock);
    800004b2:	00014597          	auipc	a1,0x14
    800004b6:	5de58593          	addi	a1,a1,1502 # 80014a90 <cons>
    800004ba:	00014517          	auipc	a0,0x14
    800004be:	66e50513          	addi	a0,a0,1646 # 80014b28 <cons+0x98>
    800004c2:	00003097          	auipc	ra,0x3
    800004c6:	578080e7          	jalr	1400(ra) # 80003a3a <sleep>
    while(cons.r == cons.w){
    800004ca:	00014797          	auipc	a5,0x14
    800004ce:	5c678793          	addi	a5,a5,1478 # 80014a90 <cons>
    800004d2:	0987a703          	lw	a4,152(a5)
    800004d6:	00014797          	auipc	a5,0x14
    800004da:	5ba78793          	addi	a5,a5,1466 # 80014a90 <cons>
    800004de:	09c7a783          	lw	a5,156(a5)
    800004e2:	faf702e3          	beq	a4,a5,80000486 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
    800004e6:	00014797          	auipc	a5,0x14
    800004ea:	5aa78793          	addi	a5,a5,1450 # 80014a90 <cons>
    800004ee:	0987a783          	lw	a5,152(a5)
    800004f2:	2781                	sext.w	a5,a5
    800004f4:	0017871b          	addiw	a4,a5,1
    800004f8:	0007069b          	sext.w	a3,a4
    800004fc:	00014717          	auipc	a4,0x14
    80000500:	59470713          	addi	a4,a4,1428 # 80014a90 <cons>
    80000504:	08d72c23          	sw	a3,152(a4)
    80000508:	07f7f793          	andi	a5,a5,127
    8000050c:	2781                	sext.w	a5,a5
    8000050e:	00014717          	auipc	a4,0x14
    80000512:	58270713          	addi	a4,a4,1410 # 80014a90 <cons>
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
    80000540:	00014797          	auipc	a5,0x14
    80000544:	55078793          	addi	a5,a5,1360 # 80014a90 <cons>
    80000548:	0987a783          	lw	a5,152(a5)
    8000054c:	37fd                	addiw	a5,a5,-1
    8000054e:	0007871b          	sext.w	a4,a5
    80000552:	00014797          	auipc	a5,0x14
    80000556:	53e78793          	addi	a5,a5,1342 # 80014a90 <cons>
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
    80000582:	70a080e7          	jalr	1802(ra) # 80003c88 <either_copyout>
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
    800005c8:	00014517          	auipc	a0,0x14
    800005cc:	4c850513          	addi	a0,a0,1224 # 80014a90 <cons>
    800005d0:	00001097          	auipc	ra,0x1
    800005d4:	dfc080e7          	jalr	-516(ra) # 800013cc <release>

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
    80000600:	00014517          	auipc	a0,0x14
    80000604:	49050513          	addi	a0,a0,1168 # 80014a90 <cons>
    80000608:	00001097          	auipc	ra,0x1
    8000060c:	d60080e7          	jalr	-672(ra) # 80001368 <acquire>

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
    8000066c:	708080e7          	jalr	1800(ra) # 80003d70 <procdump>
    break;
    80000670:	aad9                	j	80000846 <consoleintr+0x254>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
      cons.e--;
    80000672:	00014797          	auipc	a5,0x14
    80000676:	41e78793          	addi	a5,a5,1054 # 80014a90 <cons>
    8000067a:	0a07a783          	lw	a5,160(a5)
    8000067e:	37fd                	addiw	a5,a5,-1
    80000680:	0007871b          	sext.w	a4,a5
    80000684:	00014797          	auipc	a5,0x14
    80000688:	40c78793          	addi	a5,a5,1036 # 80014a90 <cons>
    8000068c:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000690:	10000513          	li	a0,256
    80000694:	00000097          	auipc	ra,0x0
    80000698:	cde080e7          	jalr	-802(ra) # 80000372 <consputc>
    while(cons.e != cons.w &&
    8000069c:	00014797          	auipc	a5,0x14
    800006a0:	3f478793          	addi	a5,a5,1012 # 80014a90 <cons>
    800006a4:	0a07a703          	lw	a4,160(a5)
    800006a8:	00014797          	auipc	a5,0x14
    800006ac:	3e878793          	addi	a5,a5,1000 # 80014a90 <cons>
    800006b0:	09c7a783          	lw	a5,156(a5)
    800006b4:	18f70463          	beq	a4,a5,8000083c <consoleintr+0x24a>
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
    800006b8:	00014797          	auipc	a5,0x14
    800006bc:	3d878793          	addi	a5,a5,984 # 80014a90 <cons>
    800006c0:	0a07a783          	lw	a5,160(a5)
    800006c4:	37fd                	addiw	a5,a5,-1
    800006c6:	2781                	sext.w	a5,a5
    800006c8:	07f7f793          	andi	a5,a5,127
    800006cc:	2781                	sext.w	a5,a5
    800006ce:	00014717          	auipc	a4,0x14
    800006d2:	3c270713          	addi	a4,a4,962 # 80014a90 <cons>
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
    800006ea:	00014797          	auipc	a5,0x14
    800006ee:	3a678793          	addi	a5,a5,934 # 80014a90 <cons>
    800006f2:	0a07a703          	lw	a4,160(a5)
    800006f6:	00014797          	auipc	a5,0x14
    800006fa:	39a78793          	addi	a5,a5,922 # 80014a90 <cons>
    800006fe:	09c7a783          	lw	a5,156(a5)
    80000702:	12f70f63          	beq	a4,a5,80000840 <consoleintr+0x24e>
      cons.e--;
    80000706:	00014797          	auipc	a5,0x14
    8000070a:	38a78793          	addi	a5,a5,906 # 80014a90 <cons>
    8000070e:	0a07a783          	lw	a5,160(a5)
    80000712:	37fd                	addiw	a5,a5,-1
    80000714:	0007871b          	sext.w	a4,a5
    80000718:	00014797          	auipc	a5,0x14
    8000071c:	37878793          	addi	a5,a5,888 # 80014a90 <cons>
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
    8000073c:	00014797          	auipc	a5,0x14
    80000740:	35478793          	addi	a5,a5,852 # 80014a90 <cons>
    80000744:	0a07a703          	lw	a4,160(a5)
    80000748:	00014797          	auipc	a5,0x14
    8000074c:	34878793          	addi	a5,a5,840 # 80014a90 <cons>
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
    8000078c:	00014797          	auipc	a5,0x14
    80000790:	30478793          	addi	a5,a5,772 # 80014a90 <cons>
    80000794:	0a07a783          	lw	a5,160(a5)
    80000798:	2781                	sext.w	a5,a5
    8000079a:	0017871b          	addiw	a4,a5,1
    8000079e:	0007069b          	sext.w	a3,a4
    800007a2:	00014717          	auipc	a4,0x14
    800007a6:	2ee70713          	addi	a4,a4,750 # 80014a90 <cons>
    800007aa:	0ad72023          	sw	a3,160(a4)
    800007ae:	07f7f793          	andi	a5,a5,127
    800007b2:	2781                	sext.w	a5,a5
    800007b4:	fec42703          	lw	a4,-20(s0)
    800007b8:	0ff77713          	andi	a4,a4,255
    800007bc:	00014697          	auipc	a3,0x14
    800007c0:	2d468693          	addi	a3,a3,724 # 80014a90 <cons>
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
    800007ea:	00014797          	auipc	a5,0x14
    800007ee:	2a678793          	addi	a5,a5,678 # 80014a90 <cons>
    800007f2:	0a07a703          	lw	a4,160(a5)
    800007f6:	00014797          	auipc	a5,0x14
    800007fa:	29a78793          	addi	a5,a5,666 # 80014a90 <cons>
    800007fe:	0987a783          	lw	a5,152(a5)
    80000802:	40f707bb          	subw	a5,a4,a5
    80000806:	2781                	sext.w	a5,a5
    80000808:	873e                	mv	a4,a5
    8000080a:	08000793          	li	a5,128
    8000080e:	02f71b63          	bne	a4,a5,80000844 <consoleintr+0x252>
        // wake up consoleread() if a whole line (or end-of-file)
        // has arrived.
        cons.w = cons.e;
    80000812:	00014797          	auipc	a5,0x14
    80000816:	27e78793          	addi	a5,a5,638 # 80014a90 <cons>
    8000081a:	0a07a703          	lw	a4,160(a5)
    8000081e:	00014797          	auipc	a5,0x14
    80000822:	27278793          	addi	a5,a5,626 # 80014a90 <cons>
    80000826:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000082a:	00014517          	auipc	a0,0x14
    8000082e:	2fe50513          	addi	a0,a0,766 # 80014b28 <cons+0x98>
    80000832:	00003097          	auipc	ra,0x3
    80000836:	284080e7          	jalr	644(ra) # 80003ab6 <wakeup>
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
    80000846:	00014517          	auipc	a0,0x14
    8000084a:	24a50513          	addi	a0,a0,586 # 80014a90 <cons>
    8000084e:	00001097          	auipc	ra,0x1
    80000852:	b7e080e7          	jalr	-1154(ra) # 800013cc <release>
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
    80000868:	0000b597          	auipc	a1,0xb
    8000086c:	79858593          	addi	a1,a1,1944 # 8000c000 <etext>
    80000870:	00014517          	auipc	a0,0x14
    80000874:	22050513          	addi	a0,a0,544 # 80014a90 <cons>
    80000878:	00001097          	auipc	ra,0x1
    8000087c:	ac0080e7          	jalr	-1344(ra) # 80001338 <initlock>

  uartinit();
    80000880:	00000097          	auipc	ra,0x0
    80000884:	540080e7          	jalr	1344(ra) # 80000dc0 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80000888:	0003c797          	auipc	a5,0x3c
    8000088c:	3a878793          	addi	a5,a5,936 # 8003cc30 <devsw>
    80000890:	00000717          	auipc	a4,0x0
    80000894:	bc270713          	addi	a4,a4,-1086 # 80000452 <consoleread>
    80000898:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089a:	0003c797          	auipc	a5,0x3c
    8000089e:	39678793          	addi	a5,a5,918 # 8003cc30 <devsw>
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
    8000092c:	0000c697          	auipc	a3,0xc
    80000930:	ea468693          	addi	a3,a3,-348 # 8000c7d0 <digits>
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
    800009f0:	0000c717          	auipc	a4,0xc
    800009f4:	de070713          	addi	a4,a4,-544 # 8000c7d0 <digits>
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
    80000a54:	00014797          	auipc	a5,0x14
    80000a58:	0e478793          	addi	a5,a5,228 # 80014b38 <pr>
    80000a5c:	4f9c                	lw	a5,24(a5)
    80000a5e:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a62:	fdc42783          	lw	a5,-36(s0)
    80000a66:	2781                	sext.w	a5,a5
    80000a68:	cb89                	beqz	a5,80000a7a <printf+0x44>
    acquire(&pr.lock);
    80000a6a:	00014517          	auipc	a0,0x14
    80000a6e:	0ce50513          	addi	a0,a0,206 # 80014b38 <pr>
    80000a72:	00001097          	auipc	ra,0x1
    80000a76:	8f6080e7          	jalr	-1802(ra) # 80001368 <acquire>

  if (fmt == 0)
    80000a7a:	fc843783          	ld	a5,-56(s0)
    80000a7e:	eb89                	bnez	a5,80000a90 <printf+0x5a>
    panic("null fmt");
    80000a80:	0000b517          	auipc	a0,0xb
    80000a84:	58850513          	addi	a0,a0,1416 # 8000c008 <etext+0x8>
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
    80000bde:	0000b797          	auipc	a5,0xb
    80000be2:	43a78793          	addi	a5,a5,1082 # 8000c018 <etext+0x18>
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
    80000c72:	00014517          	auipc	a0,0x14
    80000c76:	ec650513          	addi	a0,a0,-314 # 80014b38 <pr>
    80000c7a:	00000097          	auipc	ra,0x0
    80000c7e:	752080e7          	jalr	1874(ra) # 800013cc <release>
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
    80000c98:	00014797          	auipc	a5,0x14
    80000c9c:	ea078793          	addi	a5,a5,-352 # 80014b38 <pr>
    80000ca0:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000ca4:	0000b517          	auipc	a0,0xb
    80000ca8:	37c50513          	addi	a0,a0,892 # 8000c020 <etext+0x20>
    80000cac:	00000097          	auipc	ra,0x0
    80000cb0:	d8a080e7          	jalr	-630(ra) # 80000a36 <printf>
  printf(s);
    80000cb4:	fe843503          	ld	a0,-24(s0)
    80000cb8:	00000097          	auipc	ra,0x0
    80000cbc:	d7e080e7          	jalr	-642(ra) # 80000a36 <printf>
  printf("\n");
    80000cc0:	0000b517          	auipc	a0,0xb
    80000cc4:	36850513          	addi	a0,a0,872 # 8000c028 <etext+0x28>
    80000cc8:	00000097          	auipc	ra,0x0
    80000ccc:	d6e080e7          	jalr	-658(ra) # 80000a36 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000cd0:	0000c797          	auipc	a5,0xc
    80000cd4:	c5078793          	addi	a5,a5,-944 # 8000c920 <panicked>
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
    80000cfe:	00014797          	auipc	a5,0x14
    80000d02:	e3a78793          	addi	a5,a5,-454 # 80014b38 <pr>
    80000d06:	0007ac23          	sw	zero,24(a5)
  printf("panic: ");
    80000d0a:	0000b517          	auipc	a0,0xb
    80000d0e:	31650513          	addi	a0,a0,790 # 8000c020 <etext+0x20>
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
    80000d6c:	0000b517          	auipc	a0,0xb
    80000d70:	2bc50513          	addi	a0,a0,700 # 8000c028 <etext+0x28>
    80000d74:	00000097          	auipc	ra,0x0
    80000d78:	cc2080e7          	jalr	-830(ra) # 80000a36 <printf>
  panicked = 1; // freeze uart output from other CPUs
    80000d7c:	0000c797          	auipc	a5,0xc
    80000d80:	ba478793          	addi	a5,a5,-1116 # 8000c920 <panicked>
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
    80000d92:	0000b597          	auipc	a1,0xb
    80000d96:	29e58593          	addi	a1,a1,670 # 8000c030 <etext+0x30>
    80000d9a:	00014517          	auipc	a0,0x14
    80000d9e:	d9e50513          	addi	a0,a0,-610 # 80014b38 <pr>
    80000da2:	00000097          	auipc	ra,0x0
    80000da6:	596080e7          	jalr	1430(ra) # 80001338 <initlock>
  pr.locking = 1;
    80000daa:	00014797          	auipc	a5,0x14
    80000dae:	d8e78793          	addi	a5,a5,-626 # 80014b38 <pr>
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
    80000e18:	0000b597          	auipc	a1,0xb
    80000e1c:	22058593          	addi	a1,a1,544 # 8000c038 <etext+0x38>
    80000e20:	00014517          	auipc	a0,0x14
    80000e24:	d3850513          	addi	a0,a0,-712 # 80014b58 <uart_tx_lock>
    80000e28:	00000097          	auipc	ra,0x0
    80000e2c:	510080e7          	jalr	1296(ra) # 80001338 <initlock>
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
    80000e48:	00014517          	auipc	a0,0x14
    80000e4c:	d1050513          	addi	a0,a0,-752 # 80014b58 <uart_tx_lock>
    80000e50:	00000097          	auipc	ra,0x0
    80000e54:	518080e7          	jalr	1304(ra) # 80001368 <acquire>

  if(panicked){
    80000e58:	0000c797          	auipc	a5,0xc
    80000e5c:	ac878793          	addi	a5,a5,-1336 # 8000c920 <panicked>
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
    80000e68:	00014597          	auipc	a1,0x14
    80000e6c:	cf058593          	addi	a1,a1,-784 # 80014b58 <uart_tx_lock>
    80000e70:	0000c517          	auipc	a0,0xc
    80000e74:	ac050513          	addi	a0,a0,-1344 # 8000c930 <uart_tx_r>
    80000e78:	00003097          	auipc	ra,0x3
    80000e7c:	bc2080e7          	jalr	-1086(ra) # 80003a3a <sleep>
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000e80:	0000c797          	auipc	a5,0xc
    80000e84:	ab078793          	addi	a5,a5,-1360 # 8000c930 <uart_tx_r>
    80000e88:	639c                	ld	a5,0(a5)
    80000e8a:	02078713          	addi	a4,a5,32
    80000e8e:	0000c797          	auipc	a5,0xc
    80000e92:	a9a78793          	addi	a5,a5,-1382 # 8000c928 <uart_tx_w>
    80000e96:	639c                	ld	a5,0(a5)
    80000e98:	fcf708e3          	beq	a4,a5,80000e68 <uartputc+0x2e>
  }
  uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000e9c:	0000c797          	auipc	a5,0xc
    80000ea0:	a8c78793          	addi	a5,a5,-1396 # 8000c928 <uart_tx_w>
    80000ea4:	639c                	ld	a5,0(a5)
    80000ea6:	8bfd                	andi	a5,a5,31
    80000ea8:	fec42703          	lw	a4,-20(s0)
    80000eac:	0ff77713          	andi	a4,a4,255
    80000eb0:	00014697          	auipc	a3,0x14
    80000eb4:	cc068693          	addi	a3,a3,-832 # 80014b70 <uart_tx_buf>
    80000eb8:	97b6                	add	a5,a5,a3
    80000eba:	00e78023          	sb	a4,0(a5)
  uart_tx_w += 1;
    80000ebe:	0000c797          	auipc	a5,0xc
    80000ec2:	a6a78793          	addi	a5,a5,-1430 # 8000c928 <uart_tx_w>
    80000ec6:	639c                	ld	a5,0(a5)
    80000ec8:	00178713          	addi	a4,a5,1
    80000ecc:	0000c797          	auipc	a5,0xc
    80000ed0:	a5c78793          	addi	a5,a5,-1444 # 8000c928 <uart_tx_w>
    80000ed4:	e398                	sd	a4,0(a5)
  uartstart();
    80000ed6:	00000097          	auipc	ra,0x0
    80000eda:	084080e7          	jalr	132(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    80000ede:	00014517          	auipc	a0,0x14
    80000ee2:	c7a50513          	addi	a0,a0,-902 # 80014b58 <uart_tx_lock>
    80000ee6:	00000097          	auipc	ra,0x0
    80000eea:	4e6080e7          	jalr	1254(ra) # 800013cc <release>
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
    80000f0a:	560080e7          	jalr	1376(ra) # 80001466 <push_off>

  if(panicked){
    80000f0e:	0000c797          	auipc	a5,0xc
    80000f12:	a1278793          	addi	a5,a5,-1518 # 8000c920 <panicked>
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
    80000f4c:	576080e7          	jalr	1398(ra) # 800014be <pop_off>
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
    80000f62:	0000c797          	auipc	a5,0xc
    80000f66:	9c678793          	addi	a5,a5,-1594 # 8000c928 <uart_tx_w>
    80000f6a:	6398                	ld	a4,0(a5)
    80000f6c:	0000c797          	auipc	a5,0xc
    80000f70:	9c478793          	addi	a5,a5,-1596 # 8000c930 <uart_tx_r>
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
    80000f92:	0000c797          	auipc	a5,0xc
    80000f96:	99e78793          	addi	a5,a5,-1634 # 8000c930 <uart_tx_r>
    80000f9a:	639c                	ld	a5,0(a5)
    80000f9c:	8bfd                	andi	a5,a5,31
    80000f9e:	00014717          	auipc	a4,0x14
    80000fa2:	bd270713          	addi	a4,a4,-1070 # 80014b70 <uart_tx_buf>
    80000fa6:	97ba                	add	a5,a5,a4
    80000fa8:	0007c783          	lbu	a5,0(a5)
    80000fac:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000fb0:	0000c797          	auipc	a5,0xc
    80000fb4:	98078793          	addi	a5,a5,-1664 # 8000c930 <uart_tx_r>
    80000fb8:	639c                	ld	a5,0(a5)
    80000fba:	00178713          	addi	a4,a5,1
    80000fbe:	0000c797          	auipc	a5,0xc
    80000fc2:	97278793          	addi	a5,a5,-1678 # 8000c930 <uart_tx_r>
    80000fc6:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000fc8:	0000c517          	auipc	a0,0xc
    80000fcc:	96850513          	addi	a0,a0,-1688 # 8000c930 <uart_tx_r>
    80000fd0:	00003097          	auipc	ra,0x3
    80000fd4:	ae6080e7          	jalr	-1306(ra) # 80003ab6 <wakeup>
    
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
    80001064:	00014517          	auipc	a0,0x14
    80001068:	af450513          	addi	a0,a0,-1292 # 80014b58 <uart_tx_lock>
    8000106c:	00000097          	auipc	ra,0x0
    80001070:	2fc080e7          	jalr	764(ra) # 80001368 <acquire>
  uartstart();
    80001074:	00000097          	auipc	ra,0x0
    80001078:	ee6080e7          	jalr	-282(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    8000107c:	00014517          	auipc	a0,0x14
    80001080:	adc50513          	addi	a0,a0,-1316 # 80014b58 <uart_tx_lock>
    80001084:	00000097          	auipc	ra,0x0
    80001088:	348080e7          	jalr	840(ra) # 800013cc <release>
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
    8000109e:	0000b597          	auipc	a1,0xb
    800010a2:	fa258593          	addi	a1,a1,-94 # 8000c040 <etext+0x40>
    800010a6:	00014517          	auipc	a0,0x14
    800010aa:	aea50513          	addi	a0,a0,-1302 # 80014b90 <kmem>
    800010ae:	00000097          	auipc	ra,0x0
    800010b2:	28a080e7          	jalr	650(ra) # 80001338 <initlock>
  freerange(end, (void*)PHYSTOP);
    800010b6:	08100793          	li	a5,129
    800010ba:	01879593          	slli	a1,a5,0x18
    800010be:	0003d517          	auipc	a0,0x3d
    800010c2:	e7250513          	addi	a0,a0,-398 # 8003df30 <end>
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
    8000114c:	0003d797          	auipc	a5,0x3d
    80001150:	de478793          	addi	a5,a5,-540 # 8003df30 <end>
    80001154:	00f76963          	bltu	a4,a5,80001166 <kfree+0x36>
    80001158:	fd843703          	ld	a4,-40(s0)
    8000115c:	08100793          	li	a5,129
    80001160:	07e2                	slli	a5,a5,0x18
    80001162:	00f76a63          	bltu	a4,a5,80001176 <kfree+0x46>
    panic("kfree");
    80001166:	0000b517          	auipc	a0,0xb
    8000116a:	ee250513          	addi	a0,a0,-286 # 8000c048 <etext+0x48>
    8000116e:	00000097          	auipc	ra,0x0
    80001172:	b1e080e7          	jalr	-1250(ra) # 80000c8c <panic>

  // Fill with junk to catch dangling refs.
  memset(pa, 1, PGSIZE);
    80001176:	6605                	lui	a2,0x1
    80001178:	4585                	li	a1,1
    8000117a:	fd843503          	ld	a0,-40(s0)
    8000117e:	00000097          	auipc	ra,0x0
    80001182:	3be080e7          	jalr	958(ra) # 8000153c <memset>

  r = (struct run*)pa;
    80001186:	fd843783          	ld	a5,-40(s0)
    8000118a:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    8000118e:	00014517          	auipc	a0,0x14
    80001192:	a0250513          	addi	a0,a0,-1534 # 80014b90 <kmem>
    80001196:	00000097          	auipc	ra,0x0
    8000119a:	1d2080e7          	jalr	466(ra) # 80001368 <acquire>
  r->next = kmem.freelist;
    8000119e:	00014797          	auipc	a5,0x14
    800011a2:	9f278793          	addi	a5,a5,-1550 # 80014b90 <kmem>
    800011a6:	6f98                	ld	a4,24(a5)
    800011a8:	fe843783          	ld	a5,-24(s0)
    800011ac:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800011ae:	00014797          	auipc	a5,0x14
    800011b2:	9e278793          	addi	a5,a5,-1566 # 80014b90 <kmem>
    800011b6:	fe843703          	ld	a4,-24(s0)
    800011ba:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    800011bc:	00014517          	auipc	a0,0x14
    800011c0:	9d450513          	addi	a0,a0,-1580 # 80014b90 <kmem>
    800011c4:	00000097          	auipc	ra,0x0
    800011c8:	208080e7          	jalr	520(ra) # 800013cc <release>
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
    800011d6:	715d                	addi	sp,sp,-80
    800011d8:	e486                	sd	ra,72(sp)
    800011da:	e0a2                	sd	s0,64(sp)
    800011dc:	0880                	addi	s0,sp,80
  struct run *r;

  acquire(&kmem.lock);
    800011de:	00014517          	auipc	a0,0x14
    800011e2:	9b250513          	addi	a0,a0,-1614 # 80014b90 <kmem>
    800011e6:	00000097          	auipc	ra,0x0
    800011ea:	182080e7          	jalr	386(ra) # 80001368 <acquire>
  r = kmem.freelist;
    800011ee:	00014797          	auipc	a5,0x14
    800011f2:	9a278793          	addi	a5,a5,-1630 # 80014b90 <kmem>
    800011f6:	6f9c                	ld	a5,24(a5)
    800011f8:	fef43423          	sd	a5,-24(s0)
  if(r)
    800011fc:	fe843783          	ld	a5,-24(s0)
    80001200:	cb89                	beqz	a5,80001212 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001202:	fe843783          	ld	a5,-24(s0)
    80001206:	6398                	ld	a4,0(a5)
    80001208:	00014797          	auipc	a5,0x14
    8000120c:	98878793          	addi	a5,a5,-1656 # 80014b90 <kmem>
    80001210:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001212:	00014517          	auipc	a0,0x14
    80001216:	97e50513          	addi	a0,a0,-1666 # 80014b90 <kmem>
    8000121a:	00000097          	auipc	ra,0x0
    8000121e:	1b2080e7          	jalr	434(ra) # 800013cc <release>

  if(!r)
    80001222:	fe843783          	ld	a5,-24(s0)
    80001226:	ef8d                	bnez	a5,80001260 <kalloc+0x8a>
    r = swapout(getvictim());
    80001228:	fd040793          	addi	a5,s0,-48
    8000122c:	853e                	mv	a0,a5
    8000122e:	00001097          	auipc	ra,0x1
    80001232:	a2c080e7          	jalr	-1492(ra) # 80001c5a <getvictim>
    80001236:	fd043783          	ld	a5,-48(s0)
    8000123a:	faf43823          	sd	a5,-80(s0)
    8000123e:	fd843783          	ld	a5,-40(s0)
    80001242:	faf43c23          	sd	a5,-72(s0)
    80001246:	fe043783          	ld	a5,-32(s0)
    8000124a:	fcf43023          	sd	a5,-64(s0)
    8000124e:	fb040793          	addi	a5,s0,-80
    80001252:	853e                	mv	a0,a5
    80001254:	00001097          	auipc	ra,0x1
    80001258:	af8080e7          	jalr	-1288(ra) # 80001d4c <swapout>
    8000125c:	fea43423          	sd	a0,-24(s0)

  if(r)
    80001260:	fe843783          	ld	a5,-24(s0)
    80001264:	cb89                	beqz	a5,80001276 <kalloc+0xa0>
    memset((char*)r, 5, PGSIZE); // fill with junk
    80001266:	6605                	lui	a2,0x1
    80001268:	4595                	li	a1,5
    8000126a:	fe843503          	ld	a0,-24(s0)
    8000126e:	00000097          	auipc	ra,0x0
    80001272:	2ce080e7          	jalr	718(ra) # 8000153c <memset>
  return (void*)r;
    80001276:	fe843783          	ld	a5,-24(s0)
}
    8000127a:	853e                	mv	a0,a5
    8000127c:	60a6                	ld	ra,72(sp)
    8000127e:	6406                	ld	s0,64(sp)
    80001280:	6161                	addi	sp,sp,80
    80001282:	8082                	ret

0000000080001284 <r_sstatus>:
{
    80001284:	1101                	addi	sp,sp,-32
    80001286:	ec22                	sd	s0,24(sp)
    80001288:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000128a:	100027f3          	csrr	a5,sstatus
    8000128e:	fef43423          	sd	a5,-24(s0)
  return x;
    80001292:	fe843783          	ld	a5,-24(s0)
}
    80001296:	853e                	mv	a0,a5
    80001298:	6462                	ld	s0,24(sp)
    8000129a:	6105                	addi	sp,sp,32
    8000129c:	8082                	ret

000000008000129e <w_sstatus>:
{
    8000129e:	1101                	addi	sp,sp,-32
    800012a0:	ec22                	sd	s0,24(sp)
    800012a2:	1000                	addi	s0,sp,32
    800012a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800012a8:	fe843783          	ld	a5,-24(s0)
    800012ac:	10079073          	csrw	sstatus,a5
}
    800012b0:	0001                	nop
    800012b2:	6462                	ld	s0,24(sp)
    800012b4:	6105                	addi	sp,sp,32
    800012b6:	8082                	ret

00000000800012b8 <intr_on>:
{
    800012b8:	1141                	addi	sp,sp,-16
    800012ba:	e406                	sd	ra,8(sp)
    800012bc:	e022                	sd	s0,0(sp)
    800012be:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800012c0:	00000097          	auipc	ra,0x0
    800012c4:	fc4080e7          	jalr	-60(ra) # 80001284 <r_sstatus>
    800012c8:	87aa                	mv	a5,a0
    800012ca:	0027e793          	ori	a5,a5,2
    800012ce:	853e                	mv	a0,a5
    800012d0:	00000097          	auipc	ra,0x0
    800012d4:	fce080e7          	jalr	-50(ra) # 8000129e <w_sstatus>
}
    800012d8:	0001                	nop
    800012da:	60a2                	ld	ra,8(sp)
    800012dc:	6402                	ld	s0,0(sp)
    800012de:	0141                	addi	sp,sp,16
    800012e0:	8082                	ret

00000000800012e2 <intr_off>:
{
    800012e2:	1141                	addi	sp,sp,-16
    800012e4:	e406                	sd	ra,8(sp)
    800012e6:	e022                	sd	s0,0(sp)
    800012e8:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800012ea:	00000097          	auipc	ra,0x0
    800012ee:	f9a080e7          	jalr	-102(ra) # 80001284 <r_sstatus>
    800012f2:	87aa                	mv	a5,a0
    800012f4:	9bf5                	andi	a5,a5,-3
    800012f6:	853e                	mv	a0,a5
    800012f8:	00000097          	auipc	ra,0x0
    800012fc:	fa6080e7          	jalr	-90(ra) # 8000129e <w_sstatus>
}
    80001300:	0001                	nop
    80001302:	60a2                	ld	ra,8(sp)
    80001304:	6402                	ld	s0,0(sp)
    80001306:	0141                	addi	sp,sp,16
    80001308:	8082                	ret

000000008000130a <intr_get>:
{
    8000130a:	1101                	addi	sp,sp,-32
    8000130c:	ec06                	sd	ra,24(sp)
    8000130e:	e822                	sd	s0,16(sp)
    80001310:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80001312:	00000097          	auipc	ra,0x0
    80001316:	f72080e7          	jalr	-142(ra) # 80001284 <r_sstatus>
    8000131a:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    8000131e:	fe843783          	ld	a5,-24(s0)
    80001322:	8b89                	andi	a5,a5,2
    80001324:	00f037b3          	snez	a5,a5
    80001328:	0ff7f793          	andi	a5,a5,255
    8000132c:	2781                	sext.w	a5,a5
}
    8000132e:	853e                	mv	a0,a5
    80001330:	60e2                	ld	ra,24(sp)
    80001332:	6442                	ld	s0,16(sp)
    80001334:	6105                	addi	sp,sp,32
    80001336:	8082                	ret

0000000080001338 <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    80001338:	1101                	addi	sp,sp,-32
    8000133a:	ec22                	sd	s0,24(sp)
    8000133c:	1000                	addi	s0,sp,32
    8000133e:	fea43423          	sd	a0,-24(s0)
    80001342:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    80001346:	fe843783          	ld	a5,-24(s0)
    8000134a:	fe043703          	ld	a4,-32(s0)
    8000134e:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001350:	fe843783          	ld	a5,-24(s0)
    80001354:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    80001358:	fe843783          	ld	a5,-24(s0)
    8000135c:	0007b823          	sd	zero,16(a5)
}
    80001360:	0001                	nop
    80001362:	6462                	ld	s0,24(sp)
    80001364:	6105                	addi	sp,sp,32
    80001366:	8082                	ret

0000000080001368 <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    80001368:	1101                	addi	sp,sp,-32
    8000136a:	ec06                	sd	ra,24(sp)
    8000136c:	e822                	sd	s0,16(sp)
    8000136e:	1000                	addi	s0,sp,32
    80001370:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    80001374:	00000097          	auipc	ra,0x0
    80001378:	0f2080e7          	jalr	242(ra) # 80001466 <push_off>
  if(holding(lk))
    8000137c:	fe843503          	ld	a0,-24(s0)
    80001380:	00000097          	auipc	ra,0x0
    80001384:	0a2080e7          	jalr	162(ra) # 80001422 <holding>
    80001388:	87aa                	mv	a5,a0
    8000138a:	cb89                	beqz	a5,8000139c <acquire+0x34>
    panic("acquire");
    8000138c:	0000b517          	auipc	a0,0xb
    80001390:	cc450513          	addi	a0,a0,-828 # 8000c050 <etext+0x50>
    80001394:	00000097          	auipc	ra,0x0
    80001398:	8f8080e7          	jalr	-1800(ra) # 80000c8c <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    8000139c:	0001                	nop
    8000139e:	fe843783          	ld	a5,-24(s0)
    800013a2:	4705                	li	a4,1
    800013a4:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    800013a8:	0007079b          	sext.w	a5,a4
    800013ac:	fbed                	bnez	a5,8000139e <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800013ae:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    800013b2:	00002097          	auipc	ra,0x2
    800013b6:	a8c080e7          	jalr	-1396(ra) # 80002e3e <mycpu>
    800013ba:	872a                	mv	a4,a0
    800013bc:	fe843783          	ld	a5,-24(s0)
    800013c0:	eb98                	sd	a4,16(a5)
}
    800013c2:	0001                	nop
    800013c4:	60e2                	ld	ra,24(sp)
    800013c6:	6442                	ld	s0,16(sp)
    800013c8:	6105                	addi	sp,sp,32
    800013ca:	8082                	ret

00000000800013cc <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800013cc:	1101                	addi	sp,sp,-32
    800013ce:	ec06                	sd	ra,24(sp)
    800013d0:	e822                	sd	s0,16(sp)
    800013d2:	1000                	addi	s0,sp,32
    800013d4:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800013d8:	fe843503          	ld	a0,-24(s0)
    800013dc:	00000097          	auipc	ra,0x0
    800013e0:	046080e7          	jalr	70(ra) # 80001422 <holding>
    800013e4:	87aa                	mv	a5,a0
    800013e6:	eb89                	bnez	a5,800013f8 <release+0x2c>
    panic("release");
    800013e8:	0000b517          	auipc	a0,0xb
    800013ec:	c7050513          	addi	a0,a0,-912 # 8000c058 <etext+0x58>
    800013f0:	00000097          	auipc	ra,0x0
    800013f4:	89c080e7          	jalr	-1892(ra) # 80000c8c <panic>

  lk->cpu = 0;
    800013f8:	fe843783          	ld	a5,-24(s0)
    800013fc:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001400:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    80001404:	fe843783          	ld	a5,-24(s0)
    80001408:	0f50000f          	fence	iorw,ow
    8000140c:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    80001410:	00000097          	auipc	ra,0x0
    80001414:	0ae080e7          	jalr	174(ra) # 800014be <pop_off>
}
    80001418:	0001                	nop
    8000141a:	60e2                	ld	ra,24(sp)
    8000141c:	6442                	ld	s0,16(sp)
    8000141e:	6105                	addi	sp,sp,32
    80001420:	8082                	ret

0000000080001422 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    80001422:	7139                	addi	sp,sp,-64
    80001424:	fc06                	sd	ra,56(sp)
    80001426:	f822                	sd	s0,48(sp)
    80001428:	f426                	sd	s1,40(sp)
    8000142a:	0080                	addi	s0,sp,64
    8000142c:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001430:	fc843783          	ld	a5,-56(s0)
    80001434:	439c                	lw	a5,0(a5)
    80001436:	cf89                	beqz	a5,80001450 <holding+0x2e>
    80001438:	fc843783          	ld	a5,-56(s0)
    8000143c:	6b84                	ld	s1,16(a5)
    8000143e:	00002097          	auipc	ra,0x2
    80001442:	a00080e7          	jalr	-1536(ra) # 80002e3e <mycpu>
    80001446:	87aa                	mv	a5,a0
    80001448:	00f49463          	bne	s1,a5,80001450 <holding+0x2e>
    8000144c:	4785                	li	a5,1
    8000144e:	a011                	j	80001452 <holding+0x30>
    80001450:	4781                	li	a5,0
    80001452:	fcf42e23          	sw	a5,-36(s0)
  return r;
    80001456:	fdc42783          	lw	a5,-36(s0)
}
    8000145a:	853e                	mv	a0,a5
    8000145c:	70e2                	ld	ra,56(sp)
    8000145e:	7442                	ld	s0,48(sp)
    80001460:	74a2                	ld	s1,40(sp)
    80001462:	6121                	addi	sp,sp,64
    80001464:	8082                	ret

0000000080001466 <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    80001466:	1101                	addi	sp,sp,-32
    80001468:	ec06                	sd	ra,24(sp)
    8000146a:	e822                	sd	s0,16(sp)
    8000146c:	1000                	addi	s0,sp,32
  int old = intr_get();
    8000146e:	00000097          	auipc	ra,0x0
    80001472:	e9c080e7          	jalr	-356(ra) # 8000130a <intr_get>
    80001476:	87aa                	mv	a5,a0
    80001478:	fef42623          	sw	a5,-20(s0)

  intr_off();
    8000147c:	00000097          	auipc	ra,0x0
    80001480:	e66080e7          	jalr	-410(ra) # 800012e2 <intr_off>
  if(mycpu()->noff == 0)
    80001484:	00002097          	auipc	ra,0x2
    80001488:	9ba080e7          	jalr	-1606(ra) # 80002e3e <mycpu>
    8000148c:	87aa                	mv	a5,a0
    8000148e:	5fbc                	lw	a5,120(a5)
    80001490:	eb89                	bnez	a5,800014a2 <push_off+0x3c>
    mycpu()->intena = old;
    80001492:	00002097          	auipc	ra,0x2
    80001496:	9ac080e7          	jalr	-1620(ra) # 80002e3e <mycpu>
    8000149a:	872a                	mv	a4,a0
    8000149c:	fec42783          	lw	a5,-20(s0)
    800014a0:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800014a2:	00002097          	auipc	ra,0x2
    800014a6:	99c080e7          	jalr	-1636(ra) # 80002e3e <mycpu>
    800014aa:	87aa                	mv	a5,a0
    800014ac:	5fb8                	lw	a4,120(a5)
    800014ae:	2705                	addiw	a4,a4,1
    800014b0:	2701                	sext.w	a4,a4
    800014b2:	dfb8                	sw	a4,120(a5)
}
    800014b4:	0001                	nop
    800014b6:	60e2                	ld	ra,24(sp)
    800014b8:	6442                	ld	s0,16(sp)
    800014ba:	6105                	addi	sp,sp,32
    800014bc:	8082                	ret

00000000800014be <pop_off>:

void
pop_off(void)
{
    800014be:	1101                	addi	sp,sp,-32
    800014c0:	ec06                	sd	ra,24(sp)
    800014c2:	e822                	sd	s0,16(sp)
    800014c4:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    800014c6:	00002097          	auipc	ra,0x2
    800014ca:	978080e7          	jalr	-1672(ra) # 80002e3e <mycpu>
    800014ce:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800014d2:	00000097          	auipc	ra,0x0
    800014d6:	e38080e7          	jalr	-456(ra) # 8000130a <intr_get>
    800014da:	87aa                	mv	a5,a0
    800014dc:	cb89                	beqz	a5,800014ee <pop_off+0x30>
    panic("pop_off - interruptible");
    800014de:	0000b517          	auipc	a0,0xb
    800014e2:	b8250513          	addi	a0,a0,-1150 # 8000c060 <etext+0x60>
    800014e6:	fffff097          	auipc	ra,0xfffff
    800014ea:	7a6080e7          	jalr	1958(ra) # 80000c8c <panic>
  if(c->noff < 1)
    800014ee:	fe843783          	ld	a5,-24(s0)
    800014f2:	5fbc                	lw	a5,120(a5)
    800014f4:	00f04a63          	bgtz	a5,80001508 <pop_off+0x4a>
    panic("pop_off");
    800014f8:	0000b517          	auipc	a0,0xb
    800014fc:	b8050513          	addi	a0,a0,-1152 # 8000c078 <etext+0x78>
    80001500:	fffff097          	auipc	ra,0xfffff
    80001504:	78c080e7          	jalr	1932(ra) # 80000c8c <panic>
  c->noff -= 1;
    80001508:	fe843783          	ld	a5,-24(s0)
    8000150c:	5fbc                	lw	a5,120(a5)
    8000150e:	37fd                	addiw	a5,a5,-1
    80001510:	0007871b          	sext.w	a4,a5
    80001514:	fe843783          	ld	a5,-24(s0)
    80001518:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    8000151a:	fe843783          	ld	a5,-24(s0)
    8000151e:	5fbc                	lw	a5,120(a5)
    80001520:	eb89                	bnez	a5,80001532 <pop_off+0x74>
    80001522:	fe843783          	ld	a5,-24(s0)
    80001526:	5ffc                	lw	a5,124(a5)
    80001528:	c789                	beqz	a5,80001532 <pop_off+0x74>
    intr_on();
    8000152a:	00000097          	auipc	ra,0x0
    8000152e:	d8e080e7          	jalr	-626(ra) # 800012b8 <intr_on>
}
    80001532:	0001                	nop
    80001534:	60e2                	ld	ra,24(sp)
    80001536:	6442                	ld	s0,16(sp)
    80001538:	6105                	addi	sp,sp,32
    8000153a:	8082                	ret

000000008000153c <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    8000153c:	7179                	addi	sp,sp,-48
    8000153e:	f422                	sd	s0,40(sp)
    80001540:	1800                	addi	s0,sp,48
    80001542:	fca43c23          	sd	a0,-40(s0)
    80001546:	87ae                	mv	a5,a1
    80001548:	8732                	mv	a4,a2
    8000154a:	fcf42a23          	sw	a5,-44(s0)
    8000154e:	87ba                	mv	a5,a4
    80001550:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    80001554:	fd843783          	ld	a5,-40(s0)
    80001558:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    8000155c:	fe042623          	sw	zero,-20(s0)
    80001560:	a00d                	j	80001582 <memset+0x46>
    cdst[i] = c;
    80001562:	fec42783          	lw	a5,-20(s0)
    80001566:	fe043703          	ld	a4,-32(s0)
    8000156a:	97ba                	add	a5,a5,a4
    8000156c:	fd442703          	lw	a4,-44(s0)
    80001570:	0ff77713          	andi	a4,a4,255
    80001574:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    80001578:	fec42783          	lw	a5,-20(s0)
    8000157c:	2785                	addiw	a5,a5,1
    8000157e:	fef42623          	sw	a5,-20(s0)
    80001582:	fec42703          	lw	a4,-20(s0)
    80001586:	fd042783          	lw	a5,-48(s0)
    8000158a:	2781                	sext.w	a5,a5
    8000158c:	fcf76be3          	bltu	a4,a5,80001562 <memset+0x26>
  }
  return dst;
    80001590:	fd843783          	ld	a5,-40(s0)
}
    80001594:	853e                	mv	a0,a5
    80001596:	7422                	ld	s0,40(sp)
    80001598:	6145                	addi	sp,sp,48
    8000159a:	8082                	ret

000000008000159c <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    8000159c:	7139                	addi	sp,sp,-64
    8000159e:	fc22                	sd	s0,56(sp)
    800015a0:	0080                	addi	s0,sp,64
    800015a2:	fca43c23          	sd	a0,-40(s0)
    800015a6:	fcb43823          	sd	a1,-48(s0)
    800015aa:	87b2                	mv	a5,a2
    800015ac:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    800015b0:	fd843783          	ld	a5,-40(s0)
    800015b4:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    800015b8:	fd043783          	ld	a5,-48(s0)
    800015bc:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800015c0:	a0a1                	j	80001608 <memcmp+0x6c>
    if(*s1 != *s2)
    800015c2:	fe843783          	ld	a5,-24(s0)
    800015c6:	0007c703          	lbu	a4,0(a5)
    800015ca:	fe043783          	ld	a5,-32(s0)
    800015ce:	0007c783          	lbu	a5,0(a5)
    800015d2:	02f70163          	beq	a4,a5,800015f4 <memcmp+0x58>
      return *s1 - *s2;
    800015d6:	fe843783          	ld	a5,-24(s0)
    800015da:	0007c783          	lbu	a5,0(a5)
    800015de:	0007871b          	sext.w	a4,a5
    800015e2:	fe043783          	ld	a5,-32(s0)
    800015e6:	0007c783          	lbu	a5,0(a5)
    800015ea:	2781                	sext.w	a5,a5
    800015ec:	40f707bb          	subw	a5,a4,a5
    800015f0:	2781                	sext.w	a5,a5
    800015f2:	a01d                	j	80001618 <memcmp+0x7c>
    s1++, s2++;
    800015f4:	fe843783          	ld	a5,-24(s0)
    800015f8:	0785                	addi	a5,a5,1
    800015fa:	fef43423          	sd	a5,-24(s0)
    800015fe:	fe043783          	ld	a5,-32(s0)
    80001602:	0785                	addi	a5,a5,1
    80001604:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    80001608:	fcc42783          	lw	a5,-52(s0)
    8000160c:	fff7871b          	addiw	a4,a5,-1
    80001610:	fce42623          	sw	a4,-52(s0)
    80001614:	f7dd                	bnez	a5,800015c2 <memcmp+0x26>
  }

  return 0;
    80001616:	4781                	li	a5,0
}
    80001618:	853e                	mv	a0,a5
    8000161a:	7462                	ld	s0,56(sp)
    8000161c:	6121                	addi	sp,sp,64
    8000161e:	8082                	ret

0000000080001620 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    80001620:	7139                	addi	sp,sp,-64
    80001622:	fc22                	sd	s0,56(sp)
    80001624:	0080                	addi	s0,sp,64
    80001626:	fca43c23          	sd	a0,-40(s0)
    8000162a:	fcb43823          	sd	a1,-48(s0)
    8000162e:	87b2                	mv	a5,a2
    80001630:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    80001634:	fcc42783          	lw	a5,-52(s0)
    80001638:	2781                	sext.w	a5,a5
    8000163a:	e781                	bnez	a5,80001642 <memmove+0x22>
    return dst;
    8000163c:	fd843783          	ld	a5,-40(s0)
    80001640:	a855                	j	800016f4 <memmove+0xd4>
  
  s = src;
    80001642:	fd043783          	ld	a5,-48(s0)
    80001646:	fef43423          	sd	a5,-24(s0)
  d = dst;
    8000164a:	fd843783          	ld	a5,-40(s0)
    8000164e:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001652:	fe843703          	ld	a4,-24(s0)
    80001656:	fe043783          	ld	a5,-32(s0)
    8000165a:	08f77463          	bgeu	a4,a5,800016e2 <memmove+0xc2>
    8000165e:	fcc46783          	lwu	a5,-52(s0)
    80001662:	fe843703          	ld	a4,-24(s0)
    80001666:	97ba                	add	a5,a5,a4
    80001668:	fe043703          	ld	a4,-32(s0)
    8000166c:	06f77b63          	bgeu	a4,a5,800016e2 <memmove+0xc2>
    s += n;
    80001670:	fcc46783          	lwu	a5,-52(s0)
    80001674:	fe843703          	ld	a4,-24(s0)
    80001678:	97ba                	add	a5,a5,a4
    8000167a:	fef43423          	sd	a5,-24(s0)
    d += n;
    8000167e:	fcc46783          	lwu	a5,-52(s0)
    80001682:	fe043703          	ld	a4,-32(s0)
    80001686:	97ba                	add	a5,a5,a4
    80001688:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    8000168c:	a01d                	j	800016b2 <memmove+0x92>
      *--d = *--s;
    8000168e:	fe843783          	ld	a5,-24(s0)
    80001692:	17fd                	addi	a5,a5,-1
    80001694:	fef43423          	sd	a5,-24(s0)
    80001698:	fe043783          	ld	a5,-32(s0)
    8000169c:	17fd                	addi	a5,a5,-1
    8000169e:	fef43023          	sd	a5,-32(s0)
    800016a2:	fe843783          	ld	a5,-24(s0)
    800016a6:	0007c703          	lbu	a4,0(a5)
    800016aa:	fe043783          	ld	a5,-32(s0)
    800016ae:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800016b2:	fcc42783          	lw	a5,-52(s0)
    800016b6:	fff7871b          	addiw	a4,a5,-1
    800016ba:	fce42623          	sw	a4,-52(s0)
    800016be:	fbe1                	bnez	a5,8000168e <memmove+0x6e>
  if(s < d && s + n > d){
    800016c0:	a805                	j	800016f0 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    800016c2:	fe843703          	ld	a4,-24(s0)
    800016c6:	00170793          	addi	a5,a4,1
    800016ca:	fef43423          	sd	a5,-24(s0)
    800016ce:	fe043783          	ld	a5,-32(s0)
    800016d2:	00178693          	addi	a3,a5,1
    800016d6:	fed43023          	sd	a3,-32(s0)
    800016da:	00074703          	lbu	a4,0(a4)
    800016de:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800016e2:	fcc42783          	lw	a5,-52(s0)
    800016e6:	fff7871b          	addiw	a4,a5,-1
    800016ea:	fce42623          	sw	a4,-52(s0)
    800016ee:	fbf1                	bnez	a5,800016c2 <memmove+0xa2>

  return dst;
    800016f0:	fd843783          	ld	a5,-40(s0)
}
    800016f4:	853e                	mv	a0,a5
    800016f6:	7462                	ld	s0,56(sp)
    800016f8:	6121                	addi	sp,sp,64
    800016fa:	8082                	ret

00000000800016fc <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    800016fc:	7179                	addi	sp,sp,-48
    800016fe:	f406                	sd	ra,40(sp)
    80001700:	f022                	sd	s0,32(sp)
    80001702:	1800                	addi	s0,sp,48
    80001704:	fea43423          	sd	a0,-24(s0)
    80001708:	feb43023          	sd	a1,-32(s0)
    8000170c:	87b2                	mv	a5,a2
    8000170e:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    80001712:	fdc42783          	lw	a5,-36(s0)
    80001716:	863e                	mv	a2,a5
    80001718:	fe043583          	ld	a1,-32(s0)
    8000171c:	fe843503          	ld	a0,-24(s0)
    80001720:	00000097          	auipc	ra,0x0
    80001724:	f00080e7          	jalr	-256(ra) # 80001620 <memmove>
    80001728:	87aa                	mv	a5,a0
}
    8000172a:	853e                	mv	a0,a5
    8000172c:	70a2                	ld	ra,40(sp)
    8000172e:	7402                	ld	s0,32(sp)
    80001730:	6145                	addi	sp,sp,48
    80001732:	8082                	ret

0000000080001734 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    80001734:	7179                	addi	sp,sp,-48
    80001736:	f422                	sd	s0,40(sp)
    80001738:	1800                	addi	s0,sp,48
    8000173a:	fea43423          	sd	a0,-24(s0)
    8000173e:	feb43023          	sd	a1,-32(s0)
    80001742:	87b2                	mv	a5,a2
    80001744:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    80001748:	a005                	j	80001768 <strncmp+0x34>
    n--, p++, q++;
    8000174a:	fdc42783          	lw	a5,-36(s0)
    8000174e:	37fd                	addiw	a5,a5,-1
    80001750:	fcf42e23          	sw	a5,-36(s0)
    80001754:	fe843783          	ld	a5,-24(s0)
    80001758:	0785                	addi	a5,a5,1
    8000175a:	fef43423          	sd	a5,-24(s0)
    8000175e:	fe043783          	ld	a5,-32(s0)
    80001762:	0785                	addi	a5,a5,1
    80001764:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    80001768:	fdc42783          	lw	a5,-36(s0)
    8000176c:	2781                	sext.w	a5,a5
    8000176e:	c385                	beqz	a5,8000178e <strncmp+0x5a>
    80001770:	fe843783          	ld	a5,-24(s0)
    80001774:	0007c783          	lbu	a5,0(a5)
    80001778:	cb99                	beqz	a5,8000178e <strncmp+0x5a>
    8000177a:	fe843783          	ld	a5,-24(s0)
    8000177e:	0007c703          	lbu	a4,0(a5)
    80001782:	fe043783          	ld	a5,-32(s0)
    80001786:	0007c783          	lbu	a5,0(a5)
    8000178a:	fcf700e3          	beq	a4,a5,8000174a <strncmp+0x16>
  if(n == 0)
    8000178e:	fdc42783          	lw	a5,-36(s0)
    80001792:	2781                	sext.w	a5,a5
    80001794:	e399                	bnez	a5,8000179a <strncmp+0x66>
    return 0;
    80001796:	4781                	li	a5,0
    80001798:	a839                	j	800017b6 <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    8000179a:	fe843783          	ld	a5,-24(s0)
    8000179e:	0007c783          	lbu	a5,0(a5)
    800017a2:	0007871b          	sext.w	a4,a5
    800017a6:	fe043783          	ld	a5,-32(s0)
    800017aa:	0007c783          	lbu	a5,0(a5)
    800017ae:	2781                	sext.w	a5,a5
    800017b0:	40f707bb          	subw	a5,a4,a5
    800017b4:	2781                	sext.w	a5,a5
}
    800017b6:	853e                	mv	a0,a5
    800017b8:	7422                	ld	s0,40(sp)
    800017ba:	6145                	addi	sp,sp,48
    800017bc:	8082                	ret

00000000800017be <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    800017be:	7139                	addi	sp,sp,-64
    800017c0:	fc22                	sd	s0,56(sp)
    800017c2:	0080                	addi	s0,sp,64
    800017c4:	fca43c23          	sd	a0,-40(s0)
    800017c8:	fcb43823          	sd	a1,-48(s0)
    800017cc:	87b2                	mv	a5,a2
    800017ce:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800017d2:	fd843783          	ld	a5,-40(s0)
    800017d6:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800017da:	0001                	nop
    800017dc:	fcc42783          	lw	a5,-52(s0)
    800017e0:	fff7871b          	addiw	a4,a5,-1
    800017e4:	fce42623          	sw	a4,-52(s0)
    800017e8:	02f05e63          	blez	a5,80001824 <strncpy+0x66>
    800017ec:	fd043703          	ld	a4,-48(s0)
    800017f0:	00170793          	addi	a5,a4,1
    800017f4:	fcf43823          	sd	a5,-48(s0)
    800017f8:	fd843783          	ld	a5,-40(s0)
    800017fc:	00178693          	addi	a3,a5,1
    80001800:	fcd43c23          	sd	a3,-40(s0)
    80001804:	00074703          	lbu	a4,0(a4)
    80001808:	00e78023          	sb	a4,0(a5)
    8000180c:	0007c783          	lbu	a5,0(a5)
    80001810:	f7f1                	bnez	a5,800017dc <strncpy+0x1e>
    ;
  while(n-- > 0)
    80001812:	a809                	j	80001824 <strncpy+0x66>
    *s++ = 0;
    80001814:	fd843783          	ld	a5,-40(s0)
    80001818:	00178713          	addi	a4,a5,1
    8000181c:	fce43c23          	sd	a4,-40(s0)
    80001820:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    80001824:	fcc42783          	lw	a5,-52(s0)
    80001828:	fff7871b          	addiw	a4,a5,-1
    8000182c:	fce42623          	sw	a4,-52(s0)
    80001830:	fef042e3          	bgtz	a5,80001814 <strncpy+0x56>
  return os;
    80001834:	fe843783          	ld	a5,-24(s0)
}
    80001838:	853e                	mv	a0,a5
    8000183a:	7462                	ld	s0,56(sp)
    8000183c:	6121                	addi	sp,sp,64
    8000183e:	8082                	ret

0000000080001840 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001840:	7139                	addi	sp,sp,-64
    80001842:	fc22                	sd	s0,56(sp)
    80001844:	0080                	addi	s0,sp,64
    80001846:	fca43c23          	sd	a0,-40(s0)
    8000184a:	fcb43823          	sd	a1,-48(s0)
    8000184e:	87b2                	mv	a5,a2
    80001850:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    80001854:	fd843783          	ld	a5,-40(s0)
    80001858:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    8000185c:	fcc42783          	lw	a5,-52(s0)
    80001860:	2781                	sext.w	a5,a5
    80001862:	00f04563          	bgtz	a5,8000186c <safestrcpy+0x2c>
    return os;
    80001866:	fe843783          	ld	a5,-24(s0)
    8000186a:	a0a1                	j	800018b2 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    8000186c:	fcc42783          	lw	a5,-52(s0)
    80001870:	37fd                	addiw	a5,a5,-1
    80001872:	fcf42623          	sw	a5,-52(s0)
    80001876:	fcc42783          	lw	a5,-52(s0)
    8000187a:	2781                	sext.w	a5,a5
    8000187c:	02f05563          	blez	a5,800018a6 <safestrcpy+0x66>
    80001880:	fd043703          	ld	a4,-48(s0)
    80001884:	00170793          	addi	a5,a4,1
    80001888:	fcf43823          	sd	a5,-48(s0)
    8000188c:	fd843783          	ld	a5,-40(s0)
    80001890:	00178693          	addi	a3,a5,1
    80001894:	fcd43c23          	sd	a3,-40(s0)
    80001898:	00074703          	lbu	a4,0(a4)
    8000189c:	00e78023          	sb	a4,0(a5)
    800018a0:	0007c783          	lbu	a5,0(a5)
    800018a4:	f7e1                	bnez	a5,8000186c <safestrcpy+0x2c>
    ;
  *s = 0;
    800018a6:	fd843783          	ld	a5,-40(s0)
    800018aa:	00078023          	sb	zero,0(a5)
  return os;
    800018ae:	fe843783          	ld	a5,-24(s0)
}
    800018b2:	853e                	mv	a0,a5
    800018b4:	7462                	ld	s0,56(sp)
    800018b6:	6121                	addi	sp,sp,64
    800018b8:	8082                	ret

00000000800018ba <strlen>:

int
strlen(const char *s)
{
    800018ba:	7179                	addi	sp,sp,-48
    800018bc:	f422                	sd	s0,40(sp)
    800018be:	1800                	addi	s0,sp,48
    800018c0:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    800018c4:	fe042623          	sw	zero,-20(s0)
    800018c8:	a031                	j	800018d4 <strlen+0x1a>
    800018ca:	fec42783          	lw	a5,-20(s0)
    800018ce:	2785                	addiw	a5,a5,1
    800018d0:	fef42623          	sw	a5,-20(s0)
    800018d4:	fec42783          	lw	a5,-20(s0)
    800018d8:	fd843703          	ld	a4,-40(s0)
    800018dc:	97ba                	add	a5,a5,a4
    800018de:	0007c783          	lbu	a5,0(a5)
    800018e2:	f7e5                	bnez	a5,800018ca <strlen+0x10>
    ;
  return n;
    800018e4:	fec42783          	lw	a5,-20(s0)
}
    800018e8:	853e                	mv	a0,a5
    800018ea:	7422                	ld	s0,40(sp)
    800018ec:	6145                	addi	sp,sp,48
    800018ee:	8082                	ret

00000000800018f0 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800018f0:	1141                	addi	sp,sp,-16
    800018f2:	e406                	sd	ra,8(sp)
    800018f4:	e022                	sd	s0,0(sp)
    800018f6:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800018f8:	00001097          	auipc	ra,0x1
    800018fc:	522080e7          	jalr	1314(ra) # 80002e1a <cpuid>
    80001900:	87aa                	mv	a5,a0
    80001902:	efe1                	bnez	a5,800019da <main+0xea>
    consoleinit();
    80001904:	fffff097          	auipc	ra,0xfffff
    80001908:	f5c080e7          	jalr	-164(ra) # 80000860 <consoleinit>
    printfinit();
    8000190c:	fffff097          	auipc	ra,0xfffff
    80001910:	47e080e7          	jalr	1150(ra) # 80000d8a <printfinit>
    printf("\n");
    80001914:	0000a517          	auipc	a0,0xa
    80001918:	76c50513          	addi	a0,a0,1900 # 8000c080 <etext+0x80>
    8000191c:	fffff097          	auipc	ra,0xfffff
    80001920:	11a080e7          	jalr	282(ra) # 80000a36 <printf>
    printf("xv6 kernel is booting\n");
    80001924:	0000a517          	auipc	a0,0xa
    80001928:	76450513          	addi	a0,a0,1892 # 8000c088 <etext+0x88>
    8000192c:	fffff097          	auipc	ra,0xfffff
    80001930:	10a080e7          	jalr	266(ra) # 80000a36 <printf>
    printf("\n");
    80001934:	0000a517          	auipc	a0,0xa
    80001938:	74c50513          	addi	a0,a0,1868 # 8000c080 <etext+0x80>
    8000193c:	fffff097          	auipc	ra,0xfffff
    80001940:	0fa080e7          	jalr	250(ra) # 80000a36 <printf>
    kinit();         // physical page allocator
    80001944:	fffff097          	auipc	ra,0xfffff
    80001948:	752080e7          	jalr	1874(ra) # 80001096 <kinit>
    kvminit();       // create kernel page table
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	6c8080e7          	jalr	1736(ra) # 80002014 <kvminit>
    kvminithart();   // turn on paging
    80001954:	00000097          	auipc	ra,0x0
    80001958:	6ee080e7          	jalr	1774(ra) # 80002042 <kvminithart>
    procinit();      // process table
    8000195c:	00001097          	auipc	ra,0x1
    80001960:	3f0080e7          	jalr	1008(ra) # 80002d4c <procinit>
    trapinit();      // trap vectors
    80001964:	00002097          	auipc	ra,0x2
    80001968:	6f4080e7          	jalr	1780(ra) # 80004058 <trapinit>
    trapinithart();  // install kernel trap vector
    8000196c:	00002097          	auipc	ra,0x2
    80001970:	716080e7          	jalr	1814(ra) # 80004082 <trapinithart>
    plicinit();      // set up interrupt controller
    80001974:	00007097          	auipc	ra,0x7
    80001978:	5d6080e7          	jalr	1494(ra) # 80008f4a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    8000197c:	00007097          	auipc	ra,0x7
    80001980:	5fc080e7          	jalr	1532(ra) # 80008f78 <plicinithart>
    binit();         // buffer cache
    80001984:	00003097          	auipc	ra,0x3
    80001988:	16a080e7          	jalr	362(ra) # 80004aee <binit>
    iinit();         // inode table
    8000198c:	00004097          	auipc	ra,0x4
    80001990:	9c0080e7          	jalr	-1600(ra) # 8000534c <iinit>
    fileinit();      // file table
    80001994:	00005097          	auipc	ra,0x5
    80001998:	394080e7          	jalr	916(ra) # 80006d28 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    8000199c:	0000a597          	auipc	a1,0xa
    800019a0:	70458593          	addi	a1,a1,1796 # 8000c0a0 <etext+0xa0>
    800019a4:	4501                	li	a0,0
    800019a6:	00007097          	auipc	ra,0x7
    800019aa:	72c080e7          	jalr	1836(ra) # 800090d2 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    800019ae:	0000a597          	auipc	a1,0xa
    800019b2:	70258593          	addi	a1,a1,1794 # 8000c0b0 <etext+0xb0>
    800019b6:	4505                	li	a0,1
    800019b8:	00007097          	auipc	ra,0x7
    800019bc:	71a080e7          	jalr	1818(ra) # 800090d2 <virtio_disk_init>

    userinit();      // first user process
    800019c0:	00002097          	auipc	ra,0x2
    800019c4:	838080e7          	jalr	-1992(ra) # 800031f8 <userinit>
    __sync_synchronize();
    800019c8:	0ff0000f          	fence
    started = 1;
    800019cc:	00013797          	auipc	a5,0x13
    800019d0:	1e478793          	addi	a5,a5,484 # 80014bb0 <started>
    800019d4:	4705                	li	a4,1
    800019d6:	c398                	sw	a4,0(a5)
    800019d8:	a0a9                	j	80001a22 <main+0x132>
  } else {
    while(started == 0)
    800019da:	0001                	nop
    800019dc:	00013797          	auipc	a5,0x13
    800019e0:	1d478793          	addi	a5,a5,468 # 80014bb0 <started>
    800019e4:	439c                	lw	a5,0(a5)
    800019e6:	2781                	sext.w	a5,a5
    800019e8:	dbf5                	beqz	a5,800019dc <main+0xec>
      ;
    __sync_synchronize();
    800019ea:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800019ee:	00001097          	auipc	ra,0x1
    800019f2:	42c080e7          	jalr	1068(ra) # 80002e1a <cpuid>
    800019f6:	87aa                	mv	a5,a0
    800019f8:	85be                	mv	a1,a5
    800019fa:	0000a517          	auipc	a0,0xa
    800019fe:	6c650513          	addi	a0,a0,1734 # 8000c0c0 <etext+0xc0>
    80001a02:	fffff097          	auipc	ra,0xfffff
    80001a06:	034080e7          	jalr	52(ra) # 80000a36 <printf>
    kvminithart();    // turn on paging
    80001a0a:	00000097          	auipc	ra,0x0
    80001a0e:	638080e7          	jalr	1592(ra) # 80002042 <kvminithart>
    trapinithart();   // install kernel trap vector
    80001a12:	00002097          	auipc	ra,0x2
    80001a16:	670080e7          	jalr	1648(ra) # 80004082 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001a1a:	00007097          	auipc	ra,0x7
    80001a1e:	55e080e7          	jalr	1374(ra) # 80008f78 <plicinithart>
  }

  scheduler();        
    80001a22:	00002097          	auipc	ra,0x2
    80001a26:	dec080e7          	jalr	-532(ra) # 8000380e <scheduler>

0000000080001a2a <w_satp>:
{
    80001a2a:	1101                	addi	sp,sp,-32
    80001a2c:	ec22                	sd	s0,24(sp)
    80001a2e:	1000                	addi	s0,sp,32
    80001a30:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80001a34:	fe843783          	ld	a5,-24(s0)
    80001a38:	18079073          	csrw	satp,a5
}
    80001a3c:	0001                	nop
    80001a3e:	6462                	ld	s0,24(sp)
    80001a40:	6105                	addi	sp,sp,32
    80001a42:	8082                	ret

0000000080001a44 <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    80001a44:	1141                	addi	sp,sp,-16
    80001a46:	e422                	sd	s0,8(sp)
    80001a48:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001a4a:	12000073          	sfence.vma
}
    80001a4e:	0001                	nop
    80001a50:	6422                	ld	s0,8(sp)
    80001a52:	0141                	addi	sp,sp,16
    80001a54:	8082                	ret

0000000080001a56 <getlruindex>:
#define LRUPAGESSIZE ((PHYSTOP - KERNBASE) / PGSIZE)
static struct lrupinfo lrupages[LRUPAGESSIZE] = {{0}};

uint64
getlruindex(uint64 va)
{
    80001a56:	1101                	addi	sp,sp,-32
    80001a58:	ec22                	sd	s0,24(sp)
    80001a5a:	1000                	addi	s0,sp,32
    80001a5c:	fea43423          	sd	a0,-24(s0)
  return va >> 12;
    80001a60:	fe843783          	ld	a5,-24(s0)
    80001a64:	83b1                	srli	a5,a5,0xc
}
    80001a66:	853e                	mv	a0,a5
    80001a68:	6462                	ld	s0,24(sp)
    80001a6a:	6105                	addi	sp,sp,32
    80001a6c:	8082                	ret

0000000080001a6e <getpaddress>:

uint64
getpaddress(pte_t *pte)
{
    80001a6e:	7179                	addi	sp,sp,-48
    80001a70:	f422                	sd	s0,40(sp)
    80001a72:	1800                	addi	s0,sp,48
    80001a74:	fca43c23          	sd	a0,-40(s0)
  uint64 ppn = ( (*pte) & 0x3FFFFFFFFFFFFL ) >> 10; // Extract bits 53-10 and shift to the right place
    80001a78:	fd843783          	ld	a5,-40(s0)
    80001a7c:	639c                	ld	a5,0(a5)
    80001a7e:	00a7d713          	srli	a4,a5,0xa
    80001a82:	57fd                	li	a5,-1
    80001a84:	83e1                	srli	a5,a5,0x18
    80001a86:	8ff9                	and	a5,a5,a4
    80001a88:	fef43423          	sd	a5,-24(s0)
  uint64 physical_address = ppn << 12; // Shift left by 12 bits to accommodate for the page offset
    80001a8c:	fe843783          	ld	a5,-24(s0)
    80001a90:	07b2                	slli	a5,a5,0xc
    80001a92:	fef43023          	sd	a5,-32(s0)
  return physical_address;
    80001a96:	fe043783          	ld	a5,-32(s0)
}
    80001a9a:	853e                	mv	a0,a5
    80001a9c:	7422                	ld	s0,40(sp)
    80001a9e:	6145                	addi	sp,sp,48
    80001aa0:	8082                	ret

0000000080001aa2 <reglrupage>:

void
reglrupage(pte_t *pte, uint64 va)
{
    80001aa2:	7179                	addi	sp,sp,-48
    80001aa4:	f406                	sd	ra,40(sp)
    80001aa6:	f022                	sd	s0,32(sp)
    80001aa8:	1800                	addi	s0,sp,48
    80001aaa:	fca43c23          	sd	a0,-40(s0)
    80001aae:	fcb43823          	sd	a1,-48(s0)
  uint64 i = getlruindex(va);
    80001ab2:	fd043503          	ld	a0,-48(s0)
    80001ab6:	00000097          	auipc	ra,0x0
    80001aba:	fa0080e7          	jalr	-96(ra) # 80001a56 <getlruindex>
    80001abe:	fea43423          	sd	a0,-24(s0)
  lrupages[i].refhistory = (uchar)0;
    80001ac2:	00013697          	auipc	a3,0x13
    80001ac6:	0f668693          	addi	a3,a3,246 # 80014bb8 <lrupages>
    80001aca:	fe843703          	ld	a4,-24(s0)
    80001ace:	87ba                	mv	a5,a4
    80001ad0:	0786                	slli	a5,a5,0x1
    80001ad2:	97ba                	add	a5,a5,a4
    80001ad4:	078e                	slli	a5,a5,0x3
    80001ad6:	97b6                	add	a5,a5,a3
    80001ad8:	00078023          	sb	zero,0(a5)
  lrupages[i].pte = pte;
    80001adc:	00013697          	auipc	a3,0x13
    80001ae0:	0dc68693          	addi	a3,a3,220 # 80014bb8 <lrupages>
    80001ae4:	fe843703          	ld	a4,-24(s0)
    80001ae8:	87ba                	mv	a5,a4
    80001aea:	0786                	slli	a5,a5,0x1
    80001aec:	97ba                	add	a5,a5,a4
    80001aee:	078e                	slli	a5,a5,0x3
    80001af0:	97b6                	add	a5,a5,a3
    80001af2:	fd843703          	ld	a4,-40(s0)
    80001af6:	e798                	sd	a4,8(a5)
  lrupages[i].va = va;
    80001af8:	00013697          	auipc	a3,0x13
    80001afc:	0c068693          	addi	a3,a3,192 # 80014bb8 <lrupages>
    80001b00:	fe843703          	ld	a4,-24(s0)
    80001b04:	87ba                	mv	a5,a4
    80001b06:	0786                	slli	a5,a5,0x1
    80001b08:	97ba                	add	a5,a5,a4
    80001b0a:	078e                	slli	a5,a5,0x3
    80001b0c:	97b6                	add	a5,a5,a3
    80001b0e:	fd043703          	ld	a4,-48(s0)
    80001b12:	eb98                	sd	a4,16(a5)
}
    80001b14:	0001                	nop
    80001b16:	70a2                	ld	ra,40(sp)
    80001b18:	7402                	ld	s0,32(sp)
    80001b1a:	6145                	addi	sp,sp,48
    80001b1c:	8082                	ret

0000000080001b1e <unreglrupage>:

void
unreglrupage(uint64 va)
{
    80001b1e:	7179                	addi	sp,sp,-48
    80001b20:	f406                	sd	ra,40(sp)
    80001b22:	f022                	sd	s0,32(sp)
    80001b24:	1800                	addi	s0,sp,48
    80001b26:	fca43c23          	sd	a0,-40(s0)
  uint64 i = getlruindex(va);
    80001b2a:	fd843503          	ld	a0,-40(s0)
    80001b2e:	00000097          	auipc	ra,0x0
    80001b32:	f28080e7          	jalr	-216(ra) # 80001a56 <getlruindex>
    80001b36:	fea43423          	sd	a0,-24(s0)
  lrupages[i].pte = 0;
    80001b3a:	00013697          	auipc	a3,0x13
    80001b3e:	07e68693          	addi	a3,a3,126 # 80014bb8 <lrupages>
    80001b42:	fe843703          	ld	a4,-24(s0)
    80001b46:	87ba                	mv	a5,a4
    80001b48:	0786                	slli	a5,a5,0x1
    80001b4a:	97ba                	add	a5,a5,a4
    80001b4c:	078e                	slli	a5,a5,0x3
    80001b4e:	97b6                	add	a5,a5,a3
    80001b50:	0007b423          	sd	zero,8(a5)
}
    80001b54:	0001                	nop
    80001b56:	70a2                	ld	ra,40(sp)
    80001b58:	7402                	ld	s0,32(sp)
    80001b5a:	6145                	addi	sp,sp,48
    80001b5c:	8082                	ret

0000000080001b5e <updaterefhistory>:

void
updaterefhistory()
{
    80001b5e:	1101                	addi	sp,sp,-32
    80001b60:	ec22                	sd	s0,24(sp)
    80001b62:	1000                	addi	s0,sp,32
  uint64 i;
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001b64:	fe043423          	sd	zero,-24(s0)
    80001b68:	a8f9                	j	80001c46 <updaterefhistory+0xe8>
  {
    if(lrupages[i].pte == 0) continue;
    80001b6a:	00013697          	auipc	a3,0x13
    80001b6e:	04e68693          	addi	a3,a3,78 # 80014bb8 <lrupages>
    80001b72:	fe843703          	ld	a4,-24(s0)
    80001b76:	87ba                	mv	a5,a4
    80001b78:	0786                	slli	a5,a5,0x1
    80001b7a:	97ba                	add	a5,a5,a4
    80001b7c:	078e                	slli	a5,a5,0x3
    80001b7e:	97b6                	add	a5,a5,a3
    80001b80:	679c                	ld	a5,8(a5)
    80001b82:	cfc5                	beqz	a5,80001c3a <updaterefhistory+0xdc>

    uchar a = ( *(lrupages[i].pte) & PTE_A ) == 0 ? 0 : 1;
    80001b84:	00013697          	auipc	a3,0x13
    80001b88:	03468693          	addi	a3,a3,52 # 80014bb8 <lrupages>
    80001b8c:	fe843703          	ld	a4,-24(s0)
    80001b90:	87ba                	mv	a5,a4
    80001b92:	0786                	slli	a5,a5,0x1
    80001b94:	97ba                	add	a5,a5,a4
    80001b96:	078e                	slli	a5,a5,0x3
    80001b98:	97b6                	add	a5,a5,a3
    80001b9a:	679c                	ld	a5,8(a5)
    80001b9c:	639c                	ld	a5,0(a5)
    80001b9e:	0407f793          	andi	a5,a5,64
    80001ba2:	00f037b3          	snez	a5,a5
    80001ba6:	0ff7f793          	andi	a5,a5,255
    80001baa:	fef403a3          	sb	a5,-25(s0)
    *(lrupages[i].pte) = (*lrupages[i].pte) & (~PTE_A);
    80001bae:	00013697          	auipc	a3,0x13
    80001bb2:	00a68693          	addi	a3,a3,10 # 80014bb8 <lrupages>
    80001bb6:	fe843703          	ld	a4,-24(s0)
    80001bba:	87ba                	mv	a5,a4
    80001bbc:	0786                	slli	a5,a5,0x1
    80001bbe:	97ba                	add	a5,a5,a4
    80001bc0:	078e                	slli	a5,a5,0x3
    80001bc2:	97b6                	add	a5,a5,a3
    80001bc4:	679c                	ld	a5,8(a5)
    80001bc6:	6394                	ld	a3,0(a5)
    80001bc8:	00013617          	auipc	a2,0x13
    80001bcc:	ff060613          	addi	a2,a2,-16 # 80014bb8 <lrupages>
    80001bd0:	fe843703          	ld	a4,-24(s0)
    80001bd4:	87ba                	mv	a5,a4
    80001bd6:	0786                	slli	a5,a5,0x1
    80001bd8:	97ba                	add	a5,a5,a4
    80001bda:	078e                	slli	a5,a5,0x3
    80001bdc:	97b2                	add	a5,a5,a2
    80001bde:	679c                	ld	a5,8(a5)
    80001be0:	fbf6f713          	andi	a4,a3,-65
    80001be4:	e398                	sd	a4,0(a5)

    uchar mask = a << (sizeof(uchar) * 8 - 1);
    80001be6:	fe744783          	lbu	a5,-25(s0)
    80001bea:	0077979b          	slliw	a5,a5,0x7
    80001bee:	fef40323          	sb	a5,-26(s0)
    lrupages[i].refhistory = (lrupages[i].refhistory >> 1) | mask;
    80001bf2:	00013697          	auipc	a3,0x13
    80001bf6:	fc668693          	addi	a3,a3,-58 # 80014bb8 <lrupages>
    80001bfa:	fe843703          	ld	a4,-24(s0)
    80001bfe:	87ba                	mv	a5,a4
    80001c00:	0786                	slli	a5,a5,0x1
    80001c02:	97ba                	add	a5,a5,a4
    80001c04:	078e                	slli	a5,a5,0x3
    80001c06:	97b6                	add	a5,a5,a3
    80001c08:	0007c783          	lbu	a5,0(a5)
    80001c0c:	0017d79b          	srliw	a5,a5,0x1
    80001c10:	0ff7f713          	andi	a4,a5,255
    80001c14:	fe644783          	lbu	a5,-26(s0)
    80001c18:	8fd9                	or	a5,a5,a4
    80001c1a:	0ff7f693          	andi	a3,a5,255
    80001c1e:	00013617          	auipc	a2,0x13
    80001c22:	f9a60613          	addi	a2,a2,-102 # 80014bb8 <lrupages>
    80001c26:	fe843703          	ld	a4,-24(s0)
    80001c2a:	87ba                	mv	a5,a4
    80001c2c:	0786                	slli	a5,a5,0x1
    80001c2e:	97ba                	add	a5,a5,a4
    80001c30:	078e                	slli	a5,a5,0x3
    80001c32:	97b2                	add	a5,a5,a2
    80001c34:	00d78023          	sb	a3,0(a5)
    80001c38:	a011                	j	80001c3c <updaterefhistory+0xde>
    if(lrupages[i].pte == 0) continue;
    80001c3a:	0001                	nop
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001c3c:	fe843783          	ld	a5,-24(s0)
    80001c40:	0785                	addi	a5,a5,1
    80001c42:	fef43423          	sd	a5,-24(s0)
    80001c46:	fe843703          	ld	a4,-24(s0)
    80001c4a:	6785                	lui	a5,0x1
    80001c4c:	f0f76fe3          	bltu	a4,a5,80001b6a <updaterefhistory+0xc>
  }
}
    80001c50:	0001                	nop
    80001c52:	0001                	nop
    80001c54:	6462                	ld	s0,24(sp)
    80001c56:	6105                	addi	sp,sp,32
    80001c58:	8082                	ret

0000000080001c5a <getvictim>:

struct lrupinfo
getvictim()
{
    80001c5a:	715d                	addi	sp,sp,-80
    80001c5c:	e4a2                	sd	s0,72(sp)
    80001c5e:	0880                	addi	s0,sp,80
    80001c60:	faa43c23          	sd	a0,-72(s0)
  uint64 i;
  uchar minhistory = ~0;
    80001c64:	57fd                	li	a5,-1
    80001c66:	fef403a3          	sb	a5,-25(s0)
  struct lrupinfo result = lrupages[0];
    80001c6a:	00013797          	auipc	a5,0x13
    80001c6e:	f4e78793          	addi	a5,a5,-178 # 80014bb8 <lrupages>
    80001c72:	6398                	ld	a4,0(a5)
    80001c74:	fce43423          	sd	a4,-56(s0)
    80001c78:	6798                	ld	a4,8(a5)
    80001c7a:	fce43823          	sd	a4,-48(s0)
    80001c7e:	6b9c                	ld	a5,16(a5)
    80001c80:	fcf43c23          	sd	a5,-40(s0)
  result.pte = 0;
    80001c84:	fc043823          	sd	zero,-48(s0)

  for(i = 0; i < LRUPAGESSIZE; i++)
    80001c88:	fe043423          	sd	zero,-24(s0)
    80001c8c:	a859                	j	80001d22 <getvictim+0xc8>
  {
    if(lrupages[i].pte == 0) continue;
    80001c8e:	00013697          	auipc	a3,0x13
    80001c92:	f2a68693          	addi	a3,a3,-214 # 80014bb8 <lrupages>
    80001c96:	fe843703          	ld	a4,-24(s0)
    80001c9a:	87ba                	mv	a5,a4
    80001c9c:	0786                	slli	a5,a5,0x1
    80001c9e:	97ba                	add	a5,a5,a4
    80001ca0:	078e                	slli	a5,a5,0x3
    80001ca2:	97b6                	add	a5,a5,a3
    80001ca4:	679c                	ld	a5,8(a5)
    80001ca6:	cba5                	beqz	a5,80001d16 <getvictim+0xbc>
    if(lrupages[i].refhistory < minhistory)
    80001ca8:	00013697          	auipc	a3,0x13
    80001cac:	f1068693          	addi	a3,a3,-240 # 80014bb8 <lrupages>
    80001cb0:	fe843703          	ld	a4,-24(s0)
    80001cb4:	87ba                	mv	a5,a4
    80001cb6:	0786                	slli	a5,a5,0x1
    80001cb8:	97ba                	add	a5,a5,a4
    80001cba:	078e                	slli	a5,a5,0x3
    80001cbc:	97b6                	add	a5,a5,a3
    80001cbe:	0007c703          	lbu	a4,0(a5)
    80001cc2:	fe744783          	lbu	a5,-25(s0)
    80001cc6:	0ff7f793          	andi	a5,a5,255
    80001cca:	04f77763          	bgeu	a4,a5,80001d18 <getvictim+0xbe>
    {
      result = lrupages[i];
    80001cce:	00013697          	auipc	a3,0x13
    80001cd2:	eea68693          	addi	a3,a3,-278 # 80014bb8 <lrupages>
    80001cd6:	fe843703          	ld	a4,-24(s0)
    80001cda:	87ba                	mv	a5,a4
    80001cdc:	0786                	slli	a5,a5,0x1
    80001cde:	97ba                	add	a5,a5,a4
    80001ce0:	078e                	slli	a5,a5,0x3
    80001ce2:	97b6                	add	a5,a5,a3
    80001ce4:	6398                	ld	a4,0(a5)
    80001ce6:	fce43423          	sd	a4,-56(s0)
    80001cea:	6798                	ld	a4,8(a5)
    80001cec:	fce43823          	sd	a4,-48(s0)
    80001cf0:	6b9c                	ld	a5,16(a5)
    80001cf2:	fcf43c23          	sd	a5,-40(s0)
      minhistory = lrupages[i].refhistory;
    80001cf6:	00013697          	auipc	a3,0x13
    80001cfa:	ec268693          	addi	a3,a3,-318 # 80014bb8 <lrupages>
    80001cfe:	fe843703          	ld	a4,-24(s0)
    80001d02:	87ba                	mv	a5,a4
    80001d04:	0786                	slli	a5,a5,0x1
    80001d06:	97ba                	add	a5,a5,a4
    80001d08:	078e                	slli	a5,a5,0x3
    80001d0a:	97b6                	add	a5,a5,a3
    80001d0c:	0007c783          	lbu	a5,0(a5)
    80001d10:	fef403a3          	sb	a5,-25(s0)
    80001d14:	a011                	j	80001d18 <getvictim+0xbe>
    if(lrupages[i].pte == 0) continue;
    80001d16:	0001                	nop
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001d18:	fe843783          	ld	a5,-24(s0)
    80001d1c:	0785                	addi	a5,a5,1
    80001d1e:	fef43423          	sd	a5,-24(s0)
    80001d22:	fe843703          	ld	a4,-24(s0)
    80001d26:	6785                	lui	a5,0x1
    80001d28:	f6f763e3          	bltu	a4,a5,80001c8e <getvictim+0x34>
    }
  }

  return result;
    80001d2c:	fb843783          	ld	a5,-72(s0)
    80001d30:	fc843703          	ld	a4,-56(s0)
    80001d34:	e398                	sd	a4,0(a5)
    80001d36:	fd043703          	ld	a4,-48(s0)
    80001d3a:	e798                	sd	a4,8(a5)
    80001d3c:	fd843703          	ld	a4,-40(s0)
    80001d40:	eb98                	sd	a4,16(a5)
}
    80001d42:	fb843503          	ld	a0,-72(s0)
    80001d46:	6426                	ld	s0,72(sp)
    80001d48:	6161                	addi	sp,sp,80
    80001d4a:	8082                	ret

0000000080001d4c <swapout>:

// Returns free page
void*
swapout(struct lrupinfo pinfo)
{
    80001d4c:	715d                	addi	sp,sp,-80
    80001d4e:	e486                	sd	ra,72(sp)
    80001d50:	e0a2                	sd	s0,64(sp)
    80001d52:	fc26                	sd	s1,56(sp)
    80001d54:	0880                	addi	s0,sp,80
    80001d56:	84aa                	mv	s1,a0
  uint64 lruindex = getlruindex(pinfo.va);
    80001d58:	689c                	ld	a5,16(s1)
    80001d5a:	853e                	mv	a0,a5
    80001d5c:	00000097          	auipc	ra,0x0
    80001d60:	cfa080e7          	jalr	-774(ra) # 80001a56 <getlruindex>
    80001d64:	fca43823          	sd	a0,-48(s0)
  pte_t *pte = pinfo.pte;
    80001d68:	649c                	ld	a5,8(s1)
    80001d6a:	fcf43423          	sd	a5,-56(s0)

  int blkn = (int)lruindex*4;
    80001d6e:	fd043783          	ld	a5,-48(s0)
    80001d72:	2781                	sext.w	a5,a5
    80001d74:	0027979b          	slliw	a5,a5,0x2
    80001d78:	fcf42223          	sw	a5,-60(s0)
  uchar *data = (uchar*)getpaddress(pte);
    80001d7c:	fc843503          	ld	a0,-56(s0)
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	cee080e7          	jalr	-786(ra) # 80001a6e <getpaddress>
    80001d88:	87aa                	mv	a5,a0
    80001d8a:	faf43c23          	sd	a5,-72(s0)

  for(int i = 0; i < 4; i++)
    80001d8e:	fc042e23          	sw	zero,-36(s0)
    80001d92:	a82d                	j	80001dcc <swapout+0x80>
  {
    write_block(blkn + i, data + i*1024, 1);
    80001d94:	fc442703          	lw	a4,-60(s0)
    80001d98:	fdc42783          	lw	a5,-36(s0)
    80001d9c:	9fb9                	addw	a5,a5,a4
    80001d9e:	0007871b          	sext.w	a4,a5
    80001da2:	fdc42783          	lw	a5,-36(s0)
    80001da6:	00a7979b          	slliw	a5,a5,0xa
    80001daa:	2781                	sext.w	a5,a5
    80001dac:	86be                	mv	a3,a5
    80001dae:	fb843783          	ld	a5,-72(s0)
    80001db2:	97b6                	add	a5,a5,a3
    80001db4:	4605                	li	a2,1
    80001db6:	85be                	mv	a1,a5
    80001db8:	853a                	mv	a0,a4
    80001dba:	00008097          	auipc	ra,0x8
    80001dbe:	2f8080e7          	jalr	760(ra) # 8000a0b2 <write_block>
  for(int i = 0; i < 4; i++)
    80001dc2:	fdc42783          	lw	a5,-36(s0)
    80001dc6:	2785                	addiw	a5,a5,1
    80001dc8:	fcf42e23          	sw	a5,-36(s0)
    80001dcc:	fdc42783          	lw	a5,-36(s0)
    80001dd0:	0007871b          	sext.w	a4,a5
    80001dd4:	478d                	li	a5,3
    80001dd6:	fae7dfe3          	bge	a5,a4,80001d94 <swapout+0x48>
  }

  *pte &= ~PTE_V; // V = 0
    80001dda:	fc843783          	ld	a5,-56(s0)
    80001dde:	639c                	ld	a5,0(a5)
    80001de0:	ffe7f713          	andi	a4,a5,-2
    80001de4:	fc843783          	ld	a5,-56(s0)
    80001de8:	e398                	sd	a4,0(a5)
  *pte |= PTE_ON_DISK; // ON_DISK = 1
    80001dea:	fc843783          	ld	a5,-56(s0)
    80001dee:	639c                	ld	a5,0(a5)
    80001df0:	1007e713          	ori	a4,a5,256
    80001df4:	fc843783          	ld	a5,-56(s0)
    80001df8:	e398                	sd	a4,0(a5)

  sfence_vma(); // Flush TLB
    80001dfa:	00000097          	auipc	ra,0x0
    80001dfe:	c4a080e7          	jalr	-950(ra) # 80001a44 <sfence_vma>

  return (void*)data;
    80001e02:	fb843783          	ld	a5,-72(s0)
}
    80001e06:	853e                	mv	a0,a5
    80001e08:	60a6                	ld	ra,72(sp)
    80001e0a:	6406                	ld	s0,64(sp)
    80001e0c:	74e2                	ld	s1,56(sp)
    80001e0e:	6161                	addi	sp,sp,80
    80001e10:	8082                	ret

0000000080001e12 <swapin>:

int
swapin(uint64 va)
{
    80001e12:	715d                	addi	sp,sp,-80
    80001e14:	e486                	sd	ra,72(sp)
    80001e16:	e0a2                	sd	s0,64(sp)
    80001e18:	0880                	addi	s0,sp,80
    80001e1a:	faa43c23          	sd	a0,-72(s0)
  uint64 lruindex = getlruindex(va);
    80001e1e:	fb843503          	ld	a0,-72(s0)
    80001e22:	00000097          	auipc	ra,0x0
    80001e26:	c34080e7          	jalr	-972(ra) # 80001a56 <getlruindex>
    80001e2a:	fea43023          	sd	a0,-32(s0)
  pte_t *pte = lrupages[lruindex].pte;
    80001e2e:	00013697          	auipc	a3,0x13
    80001e32:	d8a68693          	addi	a3,a3,-630 # 80014bb8 <lrupages>
    80001e36:	fe043703          	ld	a4,-32(s0)
    80001e3a:	87ba                	mv	a5,a4
    80001e3c:	0786                	slli	a5,a5,0x1
    80001e3e:	97ba                	add	a5,a5,a4
    80001e40:	078e                	slli	a5,a5,0x3
    80001e42:	97b6                	add	a5,a5,a3
    80001e44:	679c                	ld	a5,8(a5)
    80001e46:	fcf43c23          	sd	a5,-40(s0)

  if((*pte & PTE_ON_DISK) == 0)
    80001e4a:	fd843783          	ld	a5,-40(s0)
    80001e4e:	639c                	ld	a5,0(a5)
    80001e50:	1007f793          	andi	a5,a5,256
    80001e54:	e399                	bnez	a5,80001e5a <swapin+0x48>
    return 0;
    80001e56:	4781                	li	a5,0
    80001e58:	a849                	j	80001eea <swapin+0xd8>

  int blkn = (int)lruindex*4;
    80001e5a:	fe043783          	ld	a5,-32(s0)
    80001e5e:	2781                	sext.w	a5,a5
    80001e60:	0027979b          	slliw	a5,a5,0x2
    80001e64:	fcf42a23          	sw	a5,-44(s0)
  uchar *data = kalloc();
    80001e68:	fffff097          	auipc	ra,0xfffff
    80001e6c:	36e080e7          	jalr	878(ra) # 800011d6 <kalloc>
    80001e70:	fca43423          	sd	a0,-56(s0)

  for(int i = 0; i < 4; i++)
    80001e74:	fe042623          	sw	zero,-20(s0)
    80001e78:	a82d                	j	80001eb2 <swapin+0xa0>
  {
    read_block(blkn + i, data + i*1024, 0);
    80001e7a:	fd442703          	lw	a4,-44(s0)
    80001e7e:	fec42783          	lw	a5,-20(s0)
    80001e82:	9fb9                	addw	a5,a5,a4
    80001e84:	0007871b          	sext.w	a4,a5
    80001e88:	fec42783          	lw	a5,-20(s0)
    80001e8c:	00a7979b          	slliw	a5,a5,0xa
    80001e90:	2781                	sext.w	a5,a5
    80001e92:	86be                	mv	a3,a5
    80001e94:	fc843783          	ld	a5,-56(s0)
    80001e98:	97b6                	add	a5,a5,a3
    80001e9a:	4601                	li	a2,0
    80001e9c:	85be                	mv	a1,a5
    80001e9e:	853a                	mv	a0,a4
    80001ea0:	00008097          	auipc	ra,0x8
    80001ea4:	27e080e7          	jalr	638(ra) # 8000a11e <read_block>
  for(int i = 0; i < 4; i++)
    80001ea8:	fec42783          	lw	a5,-20(s0)
    80001eac:	2785                	addiw	a5,a5,1
    80001eae:	fef42623          	sw	a5,-20(s0)
    80001eb2:	fec42783          	lw	a5,-20(s0)
    80001eb6:	0007871b          	sext.w	a4,a5
    80001eba:	478d                	li	a5,3
    80001ebc:	fae7dfe3          	bge	a5,a4,80001e7a <swapin+0x68>
  }

  *pte |= PTE_V; // V = 1
    80001ec0:	fd843783          	ld	a5,-40(s0)
    80001ec4:	639c                	ld	a5,0(a5)
    80001ec6:	0017e713          	ori	a4,a5,1
    80001eca:	fd843783          	ld	a5,-40(s0)
    80001ece:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_ON_DISK; // ON_DISK = 0
    80001ed0:	fd843783          	ld	a5,-40(s0)
    80001ed4:	639c                	ld	a5,0(a5)
    80001ed6:	eff7f713          	andi	a4,a5,-257
    80001eda:	fd843783          	ld	a5,-40(s0)
    80001ede:	e398                	sd	a4,0(a5)

  sfence_vma(); // Flush TLB
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	b64080e7          	jalr	-1180(ra) # 80001a44 <sfence_vma>

  return 1;
    80001ee8:	4785                	li	a5,1
}
    80001eea:	853e                	mv	a0,a5
    80001eec:	60a6                	ld	ra,72(sp)
    80001eee:	6406                	ld	s0,64(sp)
    80001ef0:	6161                	addi	sp,sp,80
    80001ef2:	8082                	ret

0000000080001ef4 <kvmmake>:

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001ef4:	1101                	addi	sp,sp,-32
    80001ef6:	ec06                	sd	ra,24(sp)
    80001ef8:	e822                	sd	s0,16(sp)
    80001efa:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001efc:	fffff097          	auipc	ra,0xfffff
    80001f00:	2da080e7          	jalr	730(ra) # 800011d6 <kalloc>
    80001f04:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001f08:	6605                	lui	a2,0x1
    80001f0a:	4581                	li	a1,0
    80001f0c:	fe843503          	ld	a0,-24(s0)
    80001f10:	fffff097          	auipc	ra,0xfffff
    80001f14:	62c080e7          	jalr	1580(ra) # 8000153c <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001f18:	4719                	li	a4,6
    80001f1a:	6685                	lui	a3,0x1
    80001f1c:	10000637          	lui	a2,0x10000
    80001f20:	100005b7          	lui	a1,0x10000
    80001f24:	fe843503          	ld	a0,-24(s0)
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	300080e7          	jalr	768(ra) # 80002228 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001f30:	4719                	li	a4,6
    80001f32:	6685                	lui	a3,0x1
    80001f34:	10001637          	lui	a2,0x10001
    80001f38:	100015b7          	lui	a1,0x10001
    80001f3c:	fe843503          	ld	a0,-24(s0)
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	2e8080e7          	jalr	744(ra) # 80002228 <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001f48:	4719                	li	a4,6
    80001f4a:	6685                	lui	a3,0x1
    80001f4c:	10002637          	lui	a2,0x10002
    80001f50:	100025b7          	lui	a1,0x10002
    80001f54:	fe843503          	ld	a0,-24(s0)
    80001f58:	00000097          	auipc	ra,0x0
    80001f5c:	2d0080e7          	jalr	720(ra) # 80002228 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001f60:	4719                	li	a4,6
    80001f62:	004006b7          	lui	a3,0x400
    80001f66:	0c000637          	lui	a2,0xc000
    80001f6a:	0c0005b7          	lui	a1,0xc000
    80001f6e:	fe843503          	ld	a0,-24(s0)
    80001f72:	00000097          	auipc	ra,0x0
    80001f76:	2b6080e7          	jalr	694(ra) # 80002228 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001f7a:	0000a717          	auipc	a4,0xa
    80001f7e:	08670713          	addi	a4,a4,134 # 8000c000 <etext>
    80001f82:	800007b7          	lui	a5,0x80000
    80001f86:	97ba                	add	a5,a5,a4
    80001f88:	4729                	li	a4,10
    80001f8a:	86be                	mv	a3,a5
    80001f8c:	4785                	li	a5,1
    80001f8e:	01f79613          	slli	a2,a5,0x1f
    80001f92:	4785                	li	a5,1
    80001f94:	01f79593          	slli	a1,a5,0x1f
    80001f98:	fe843503          	ld	a0,-24(s0)
    80001f9c:	00000097          	auipc	ra,0x0
    80001fa0:	28c080e7          	jalr	652(ra) # 80002228 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001fa4:	0000a597          	auipc	a1,0xa
    80001fa8:	05c58593          	addi	a1,a1,92 # 8000c000 <etext>
    80001fac:	0000a617          	auipc	a2,0xa
    80001fb0:	05460613          	addi	a2,a2,84 # 8000c000 <etext>
    80001fb4:	0000a797          	auipc	a5,0xa
    80001fb8:	04c78793          	addi	a5,a5,76 # 8000c000 <etext>
    80001fbc:	08100713          	li	a4,129
    80001fc0:	0762                	slli	a4,a4,0x18
    80001fc2:	40f707b3          	sub	a5,a4,a5
    80001fc6:	4719                	li	a4,6
    80001fc8:	86be                	mv	a3,a5
    80001fca:	fe843503          	ld	a0,-24(s0)
    80001fce:	00000097          	auipc	ra,0x0
    80001fd2:	25a080e7          	jalr	602(ra) # 80002228 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001fd6:	00009797          	auipc	a5,0x9
    80001fda:	02a78793          	addi	a5,a5,42 # 8000b000 <_trampoline>
    80001fde:	4729                	li	a4,10
    80001fe0:	6685                	lui	a3,0x1
    80001fe2:	863e                	mv	a2,a5
    80001fe4:	040007b7          	lui	a5,0x4000
    80001fe8:	17fd                	addi	a5,a5,-1
    80001fea:	00c79593          	slli	a1,a5,0xc
    80001fee:	fe843503          	ld	a0,-24(s0)
    80001ff2:	00000097          	auipc	ra,0x0
    80001ff6:	236080e7          	jalr	566(ra) # 80002228 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001ffa:	fe843503          	ld	a0,-24(s0)
    80001ffe:	00001097          	auipc	ra,0x1
    80002002:	c92080e7          	jalr	-878(ra) # 80002c90 <proc_mapstacks>
  
  return kpgtbl;
    80002006:	fe843783          	ld	a5,-24(s0)
}
    8000200a:	853e                	mv	a0,a5
    8000200c:	60e2                	ld	ra,24(sp)
    8000200e:	6442                	ld	s0,16(sp)
    80002010:	6105                	addi	sp,sp,32
    80002012:	8082                	ret

0000000080002014 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80002014:	1141                	addi	sp,sp,-16
    80002016:	e406                	sd	ra,8(sp)
    80002018:	e022                	sd	s0,0(sp)
    8000201a:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    8000201c:	00000097          	auipc	ra,0x0
    80002020:	ed8080e7          	jalr	-296(ra) # 80001ef4 <kvmmake>
    80002024:	872a                	mv	a4,a0
    80002026:	0000b797          	auipc	a5,0xb
    8000202a:	91278793          	addi	a5,a5,-1774 # 8000c938 <kernel_pagetable>
    8000202e:	e398                	sd	a4,0(a5)
  updaterefhistory();
    80002030:	00000097          	auipc	ra,0x0
    80002034:	b2e080e7          	jalr	-1234(ra) # 80001b5e <updaterefhistory>
}
    80002038:	0001                	nop
    8000203a:	60a2                	ld	ra,8(sp)
    8000203c:	6402                	ld	s0,0(sp)
    8000203e:	0141                	addi	sp,sp,16
    80002040:	8082                	ret

0000000080002042 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80002042:	1141                	addi	sp,sp,-16
    80002044:	e406                	sd	ra,8(sp)
    80002046:	e022                	sd	s0,0(sp)
    80002048:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    8000204a:	00000097          	auipc	ra,0x0
    8000204e:	9fa080e7          	jalr	-1542(ra) # 80001a44 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80002052:	0000b797          	auipc	a5,0xb
    80002056:	8e678793          	addi	a5,a5,-1818 # 8000c938 <kernel_pagetable>
    8000205a:	639c                	ld	a5,0(a5)
    8000205c:	00c7d713          	srli	a4,a5,0xc
    80002060:	57fd                	li	a5,-1
    80002062:	17fe                	slli	a5,a5,0x3f
    80002064:	8fd9                	or	a5,a5,a4
    80002066:	853e                	mv	a0,a5
    80002068:	00000097          	auipc	ra,0x0
    8000206c:	9c2080e7          	jalr	-1598(ra) # 80001a2a <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80002070:	00000097          	auipc	ra,0x0
    80002074:	9d4080e7          	jalr	-1580(ra) # 80001a44 <sfence_vma>
}
    80002078:	0001                	nop
    8000207a:	60a2                	ld	ra,8(sp)
    8000207c:	6402                	ld	s0,0(sp)
    8000207e:	0141                	addi	sp,sp,16
    80002080:	8082                	ret

0000000080002082 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80002082:	7139                	addi	sp,sp,-64
    80002084:	fc06                	sd	ra,56(sp)
    80002086:	f822                	sd	s0,48(sp)
    80002088:	0080                	addi	s0,sp,64
    8000208a:	fca43c23          	sd	a0,-40(s0)
    8000208e:	fcb43823          	sd	a1,-48(s0)
    80002092:	87b2                	mv	a5,a2
    80002094:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80002098:	fd043703          	ld	a4,-48(s0)
    8000209c:	57fd                	li	a5,-1
    8000209e:	83e9                	srli	a5,a5,0x1a
    800020a0:	00e7f463          	bgeu	a5,a4,800020a8 <walk+0x26>
    return 0;
    800020a4:	4781                	li	a5,0
    800020a6:	a8f9                	j	80002184 <walk+0x102>

  for(int level = 2; level > 0; level--) {
    800020a8:	4789                	li	a5,2
    800020aa:	fef42623          	sw	a5,-20(s0)
    800020ae:	a86d                	j	80002168 <walk+0xe6>
    pte_t *pte = &pagetable[PX(level, va)];
    800020b0:	fec42703          	lw	a4,-20(s0)
    800020b4:	87ba                	mv	a5,a4
    800020b6:	0037979b          	slliw	a5,a5,0x3
    800020ba:	9fb9                	addw	a5,a5,a4
    800020bc:	2781                	sext.w	a5,a5
    800020be:	27b1                	addiw	a5,a5,12
    800020c0:	2781                	sext.w	a5,a5
    800020c2:	873e                	mv	a4,a5
    800020c4:	fd043783          	ld	a5,-48(s0)
    800020c8:	00e7d7b3          	srl	a5,a5,a4
    800020cc:	1ff7f793          	andi	a5,a5,511
    800020d0:	078e                	slli	a5,a5,0x3
    800020d2:	fd843703          	ld	a4,-40(s0)
    800020d6:	97ba                	add	a5,a5,a4
    800020d8:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    800020dc:	fe043783          	ld	a5,-32(s0)
    800020e0:	639c                	ld	a5,0(a5)
    800020e2:	8b85                	andi	a5,a5,1
    800020e4:	cb89                	beqz	a5,800020f6 <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    800020e6:	fe043783          	ld	a5,-32(s0)
    800020ea:	639c                	ld	a5,0(a5)
    800020ec:	83a9                	srli	a5,a5,0xa
    800020ee:	07b2                	slli	a5,a5,0xc
    800020f0:	fcf43c23          	sd	a5,-40(s0)
    800020f4:	a0ad                	j	8000215e <walk+0xdc>
    }
    else if(*pte & PTE_ON_DISK) {
    800020f6:	fe043783          	ld	a5,-32(s0)
    800020fa:	639c                	ld	a5,0(a5)
    800020fc:	1007f793          	andi	a5,a5,256
    80002100:	cf99                	beqz	a5,8000211e <walk+0x9c>
      swapin(va);
    80002102:	fd043503          	ld	a0,-48(s0)
    80002106:	00000097          	auipc	ra,0x0
    8000210a:	d0c080e7          	jalr	-756(ra) # 80001e12 <swapin>
      pagetable = (pagetable_t)PTE2PA(*pte);
    8000210e:	fe043783          	ld	a5,-32(s0)
    80002112:	639c                	ld	a5,0(a5)
    80002114:	83a9                	srli	a5,a5,0xa
    80002116:	07b2                	slli	a5,a5,0xc
    80002118:	fcf43c23          	sd	a5,-40(s0)
    8000211c:	a089                	j	8000215e <walk+0xdc>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    8000211e:	fcc42783          	lw	a5,-52(s0)
    80002122:	2781                	sext.w	a5,a5
    80002124:	cb91                	beqz	a5,80002138 <walk+0xb6>
    80002126:	fffff097          	auipc	ra,0xfffff
    8000212a:	0b0080e7          	jalr	176(ra) # 800011d6 <kalloc>
    8000212e:	fca43c23          	sd	a0,-40(s0)
    80002132:	fd843783          	ld	a5,-40(s0)
    80002136:	e399                	bnez	a5,8000213c <walk+0xba>
        return 0;
    80002138:	4781                	li	a5,0
    8000213a:	a0a9                	j	80002184 <walk+0x102>
      memset(pagetable, 0, PGSIZE);
    8000213c:	6605                	lui	a2,0x1
    8000213e:	4581                	li	a1,0
    80002140:	fd843503          	ld	a0,-40(s0)
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	3f8080e7          	jalr	1016(ra) # 8000153c <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    8000214c:	fd843783          	ld	a5,-40(s0)
    80002150:	83b1                	srli	a5,a5,0xc
    80002152:	07aa                	slli	a5,a5,0xa
    80002154:	0017e713          	ori	a4,a5,1
    80002158:	fe043783          	ld	a5,-32(s0)
    8000215c:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    8000215e:	fec42783          	lw	a5,-20(s0)
    80002162:	37fd                	addiw	a5,a5,-1
    80002164:	fef42623          	sw	a5,-20(s0)
    80002168:	fec42783          	lw	a5,-20(s0)
    8000216c:	2781                	sext.w	a5,a5
    8000216e:	f4f041e3          	bgtz	a5,800020b0 <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    80002172:	fd043783          	ld	a5,-48(s0)
    80002176:	83b1                	srli	a5,a5,0xc
    80002178:	1ff7f793          	andi	a5,a5,511
    8000217c:	078e                	slli	a5,a5,0x3
    8000217e:	fd843703          	ld	a4,-40(s0)
    80002182:	97ba                	add	a5,a5,a4
}
    80002184:	853e                	mv	a0,a5
    80002186:	70e2                	ld	ra,56(sp)
    80002188:	7442                	ld	s0,48(sp)
    8000218a:	6121                	addi	sp,sp,64
    8000218c:	8082                	ret

000000008000218e <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    8000218e:	7179                	addi	sp,sp,-48
    80002190:	f406                	sd	ra,40(sp)
    80002192:	f022                	sd	s0,32(sp)
    80002194:	1800                	addi	s0,sp,48
    80002196:	fca43c23          	sd	a0,-40(s0)
    8000219a:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    8000219e:	fd043703          	ld	a4,-48(s0)
    800021a2:	57fd                	li	a5,-1
    800021a4:	83e9                	srli	a5,a5,0x1a
    800021a6:	00e7f463          	bgeu	a5,a4,800021ae <walkaddr+0x20>
    return 0;
    800021aa:	4781                	li	a5,0
    800021ac:	a88d                	j	8000221e <walkaddr+0x90>

  pte = walk(pagetable, va, 0);
    800021ae:	4601                	li	a2,0
    800021b0:	fd043583          	ld	a1,-48(s0)
    800021b4:	fd843503          	ld	a0,-40(s0)
    800021b8:	00000097          	auipc	ra,0x0
    800021bc:	eca080e7          	jalr	-310(ra) # 80002082 <walk>
    800021c0:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800021c4:	fe843783          	ld	a5,-24(s0)
    800021c8:	e399                	bnez	a5,800021ce <walkaddr+0x40>
    return 0;
    800021ca:	4781                	li	a5,0
    800021cc:	a889                	j	8000221e <walkaddr+0x90>
  if((*pte & PTE_V) == 0 && (*pte & PTE_ON_DISK) != 0)
    800021ce:	fe843783          	ld	a5,-24(s0)
    800021d2:	639c                	ld	a5,0(a5)
    800021d4:	8b85                	andi	a5,a5,1
    800021d6:	ef89                	bnez	a5,800021f0 <walkaddr+0x62>
    800021d8:	fe843783          	ld	a5,-24(s0)
    800021dc:	639c                	ld	a5,0(a5)
    800021de:	1007f793          	andi	a5,a5,256
    800021e2:	c799                	beqz	a5,800021f0 <walkaddr+0x62>
    swapin(va);
    800021e4:	fd043503          	ld	a0,-48(s0)
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	c2a080e7          	jalr	-982(ra) # 80001e12 <swapin>
  if((*pte & PTE_V) == 0)
    800021f0:	fe843783          	ld	a5,-24(s0)
    800021f4:	639c                	ld	a5,0(a5)
    800021f6:	8b85                	andi	a5,a5,1
    800021f8:	e399                	bnez	a5,800021fe <walkaddr+0x70>
    return 0;
    800021fa:	4781                	li	a5,0
    800021fc:	a00d                	j	8000221e <walkaddr+0x90>
  if((*pte & PTE_U) == 0)
    800021fe:	fe843783          	ld	a5,-24(s0)
    80002202:	639c                	ld	a5,0(a5)
    80002204:	8bc1                	andi	a5,a5,16
    80002206:	e399                	bnez	a5,8000220c <walkaddr+0x7e>
    return 0;
    80002208:	4781                	li	a5,0
    8000220a:	a811                	j	8000221e <walkaddr+0x90>
  pa = PTE2PA(*pte);
    8000220c:	fe843783          	ld	a5,-24(s0)
    80002210:	639c                	ld	a5,0(a5)
    80002212:	83a9                	srli	a5,a5,0xa
    80002214:	07b2                	slli	a5,a5,0xc
    80002216:	fef43023          	sd	a5,-32(s0)
  return pa;
    8000221a:	fe043783          	ld	a5,-32(s0)
}
    8000221e:	853e                	mv	a0,a5
    80002220:	70a2                	ld	ra,40(sp)
    80002222:	7402                	ld	s0,32(sp)
    80002224:	6145                	addi	sp,sp,48
    80002226:	8082                	ret

0000000080002228 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80002228:	7139                	addi	sp,sp,-64
    8000222a:	fc06                	sd	ra,56(sp)
    8000222c:	f822                	sd	s0,48(sp)
    8000222e:	0080                	addi	s0,sp,64
    80002230:	fea43423          	sd	a0,-24(s0)
    80002234:	feb43023          	sd	a1,-32(s0)
    80002238:	fcc43c23          	sd	a2,-40(s0)
    8000223c:	fcd43823          	sd	a3,-48(s0)
    80002240:	87ba                	mv	a5,a4
    80002242:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80002246:	fcc42783          	lw	a5,-52(s0)
    8000224a:	873e                	mv	a4,a5
    8000224c:	fd843683          	ld	a3,-40(s0)
    80002250:	fd043603          	ld	a2,-48(s0)
    80002254:	fe043583          	ld	a1,-32(s0)
    80002258:	fe843503          	ld	a0,-24(s0)
    8000225c:	00000097          	auipc	ra,0x0
    80002260:	026080e7          	jalr	38(ra) # 80002282 <mappages>
    80002264:	87aa                	mv	a5,a0
    80002266:	cb89                	beqz	a5,80002278 <kvmmap+0x50>
    panic("kvmmap");
    80002268:	0000a517          	auipc	a0,0xa
    8000226c:	e7050513          	addi	a0,a0,-400 # 8000c0d8 <etext+0xd8>
    80002270:	fffff097          	auipc	ra,0xfffff
    80002274:	a1c080e7          	jalr	-1508(ra) # 80000c8c <panic>
}
    80002278:	0001                	nop
    8000227a:	70e2                	ld	ra,56(sp)
    8000227c:	7442                	ld	s0,48(sp)
    8000227e:	6121                	addi	sp,sp,64
    80002280:	8082                	ret

0000000080002282 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80002282:	711d                	addi	sp,sp,-96
    80002284:	ec86                	sd	ra,88(sp)
    80002286:	e8a2                	sd	s0,80(sp)
    80002288:	1080                	addi	s0,sp,96
    8000228a:	fca43423          	sd	a0,-56(s0)
    8000228e:	fcb43023          	sd	a1,-64(s0)
    80002292:	fac43c23          	sd	a2,-72(s0)
    80002296:	fad43823          	sd	a3,-80(s0)
    8000229a:	87ba                	mv	a5,a4
    8000229c:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    800022a0:	fb843783          	ld	a5,-72(s0)
    800022a4:	eb89                	bnez	a5,800022b6 <mappages+0x34>
    panic("mappages: size");
    800022a6:	0000a517          	auipc	a0,0xa
    800022aa:	e3a50513          	addi	a0,a0,-454 # 8000c0e0 <etext+0xe0>
    800022ae:	fffff097          	auipc	ra,0xfffff
    800022b2:	9de080e7          	jalr	-1570(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    800022b6:	fc043703          	ld	a4,-64(s0)
    800022ba:	77fd                	lui	a5,0xfffff
    800022bc:	8ff9                	and	a5,a5,a4
    800022be:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    800022c2:	fc043703          	ld	a4,-64(s0)
    800022c6:	fb843783          	ld	a5,-72(s0)
    800022ca:	97ba                	add	a5,a5,a4
    800022cc:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffc10cf>
    800022d0:	77fd                	lui	a5,0xfffff
    800022d2:	8ff9                	and	a5,a5,a4
    800022d4:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    800022d8:	4605                	li	a2,1
    800022da:	fe843583          	ld	a1,-24(s0)
    800022de:	fc843503          	ld	a0,-56(s0)
    800022e2:	00000097          	auipc	ra,0x0
    800022e6:	da0080e7          	jalr	-608(ra) # 80002082 <walk>
    800022ea:	fca43c23          	sd	a0,-40(s0)
    800022ee:	fd843783          	ld	a5,-40(s0)
    800022f2:	e399                	bnez	a5,800022f8 <mappages+0x76>
      return -1;
    800022f4:	57fd                	li	a5,-1
    800022f6:	a8ad                	j	80002370 <mappages+0xee>
    if(*pte & PTE_V)
    800022f8:	fd843783          	ld	a5,-40(s0)
    800022fc:	639c                	ld	a5,0(a5)
    800022fe:	8b85                	andi	a5,a5,1
    80002300:	cb89                	beqz	a5,80002312 <mappages+0x90>
      panic("mappages: remap");
    80002302:	0000a517          	auipc	a0,0xa
    80002306:	dee50513          	addi	a0,a0,-530 # 8000c0f0 <etext+0xf0>
    8000230a:	fffff097          	auipc	ra,0xfffff
    8000230e:	982080e7          	jalr	-1662(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80002312:	fb043783          	ld	a5,-80(s0)
    80002316:	83b1                	srli	a5,a5,0xc
    80002318:	00a79713          	slli	a4,a5,0xa
    8000231c:	fac42783          	lw	a5,-84(s0)
    80002320:	8fd9                	or	a5,a5,a4
    80002322:	0017e713          	ori	a4,a5,1
    80002326:	fd843783          	ld	a5,-40(s0)
    8000232a:	e398                	sd	a4,0(a5)
    if(*pte & PTE_U)
    8000232c:	fd843783          	ld	a5,-40(s0)
    80002330:	639c                	ld	a5,0(a5)
    80002332:	8bc1                	andi	a5,a5,16
    80002334:	cb89                	beqz	a5,80002346 <mappages+0xc4>
      reglrupage(pte, a);
    80002336:	fe843583          	ld	a1,-24(s0)
    8000233a:	fd843503          	ld	a0,-40(s0)
    8000233e:	fffff097          	auipc	ra,0xfffff
    80002342:	764080e7          	jalr	1892(ra) # 80001aa2 <reglrupage>
    if(a == last)
    80002346:	fe843703          	ld	a4,-24(s0)
    8000234a:	fe043783          	ld	a5,-32(s0)
    8000234e:	00f70f63          	beq	a4,a5,8000236c <mappages+0xea>
      break;
    a += PGSIZE;
    80002352:	fe843703          	ld	a4,-24(s0)
    80002356:	6785                	lui	a5,0x1
    80002358:	97ba                	add	a5,a5,a4
    8000235a:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    8000235e:	fb043703          	ld	a4,-80(s0)
    80002362:	6785                	lui	a5,0x1
    80002364:	97ba                	add	a5,a5,a4
    80002366:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    8000236a:	b7bd                	j	800022d8 <mappages+0x56>
      break;
    8000236c:	0001                	nop
  }
  return 0;
    8000236e:	4781                	li	a5,0
}
    80002370:	853e                	mv	a0,a5
    80002372:	60e6                	ld	ra,88(sp)
    80002374:	6446                	ld	s0,80(sp)
    80002376:	6125                	addi	sp,sp,96
    80002378:	8082                	ret

000000008000237a <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    8000237a:	715d                	addi	sp,sp,-80
    8000237c:	e486                	sd	ra,72(sp)
    8000237e:	e0a2                	sd	s0,64(sp)
    80002380:	0880                	addi	s0,sp,80
    80002382:	fca43423          	sd	a0,-56(s0)
    80002386:	fcb43023          	sd	a1,-64(s0)
    8000238a:	fac43c23          	sd	a2,-72(s0)
    8000238e:	87b6                	mv	a5,a3
    80002390:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80002394:	fc043703          	ld	a4,-64(s0)
    80002398:	6785                	lui	a5,0x1
    8000239a:	17fd                	addi	a5,a5,-1
    8000239c:	8ff9                	and	a5,a5,a4
    8000239e:	cb89                	beqz	a5,800023b0 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    800023a0:	0000a517          	auipc	a0,0xa
    800023a4:	d6050513          	addi	a0,a0,-672 # 8000c100 <etext+0x100>
    800023a8:	fffff097          	auipc	ra,0xfffff
    800023ac:	8e4080e7          	jalr	-1820(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    800023b0:	fc043783          	ld	a5,-64(s0)
    800023b4:	fef43423          	sd	a5,-24(s0)
    800023b8:	a075                	j	80002464 <uvmunmap+0xea>
    if((pte = walk(pagetable, a, 0)) == 0)
    800023ba:	4601                	li	a2,0
    800023bc:	fe843583          	ld	a1,-24(s0)
    800023c0:	fc843503          	ld	a0,-56(s0)
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	cbe080e7          	jalr	-834(ra) # 80002082 <walk>
    800023cc:	fea43023          	sd	a0,-32(s0)
    800023d0:	fe043783          	ld	a5,-32(s0)
    800023d4:	eb89                	bnez	a5,800023e6 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    800023d6:	0000a517          	auipc	a0,0xa
    800023da:	d4250513          	addi	a0,a0,-702 # 8000c118 <etext+0x118>
    800023de:	fffff097          	auipc	ra,0xfffff
    800023e2:	8ae080e7          	jalr	-1874(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    800023e6:	fe043783          	ld	a5,-32(s0)
    800023ea:	639c                	ld	a5,0(a5)
    800023ec:	8b85                	andi	a5,a5,1
    800023ee:	eb89                	bnez	a5,80002400 <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    800023f0:	0000a517          	auipc	a0,0xa
    800023f4:	d3850513          	addi	a0,a0,-712 # 8000c128 <etext+0x128>
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	894080e7          	jalr	-1900(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80002400:	fe043783          	ld	a5,-32(s0)
    80002404:	639c                	ld	a5,0(a5)
    80002406:	3ff7f713          	andi	a4,a5,1023
    8000240a:	4785                	li	a5,1
    8000240c:	00f71a63          	bne	a4,a5,80002420 <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80002410:	0000a517          	auipc	a0,0xa
    80002414:	d3050513          	addi	a0,a0,-720 # 8000c140 <etext+0x140>
    80002418:	fffff097          	auipc	ra,0xfffff
    8000241c:	874080e7          	jalr	-1932(ra) # 80000c8c <panic>
    if(do_free){
    80002420:	fb442783          	lw	a5,-76(s0)
    80002424:	2781                	sext.w	a5,a5
    80002426:	c78d                	beqz	a5,80002450 <uvmunmap+0xd6>
      unreglrupage(a);
    80002428:	fe843503          	ld	a0,-24(s0)
    8000242c:	fffff097          	auipc	ra,0xfffff
    80002430:	6f2080e7          	jalr	1778(ra) # 80001b1e <unreglrupage>
      uint64 pa = PTE2PA(*pte);
    80002434:	fe043783          	ld	a5,-32(s0)
    80002438:	639c                	ld	a5,0(a5)
    8000243a:	83a9                	srli	a5,a5,0xa
    8000243c:	07b2                	slli	a5,a5,0xc
    8000243e:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80002442:	fd843783          	ld	a5,-40(s0)
    80002446:	853e                	mv	a0,a5
    80002448:	fffff097          	auipc	ra,0xfffff
    8000244c:	ce8080e7          	jalr	-792(ra) # 80001130 <kfree>
    }
    *pte = 0;
    80002450:	fe043783          	ld	a5,-32(s0)
    80002454:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80002458:	fe843703          	ld	a4,-24(s0)
    8000245c:	6785                	lui	a5,0x1
    8000245e:	97ba                	add	a5,a5,a4
    80002460:	fef43423          	sd	a5,-24(s0)
    80002464:	fb843783          	ld	a5,-72(s0)
    80002468:	00c79713          	slli	a4,a5,0xc
    8000246c:	fc043783          	ld	a5,-64(s0)
    80002470:	97ba                	add	a5,a5,a4
    80002472:	fe843703          	ld	a4,-24(s0)
    80002476:	f4f762e3          	bltu	a4,a5,800023ba <uvmunmap+0x40>
  }
}
    8000247a:	0001                	nop
    8000247c:	0001                	nop
    8000247e:	60a6                	ld	ra,72(sp)
    80002480:	6406                	ld	s0,64(sp)
    80002482:	6161                	addi	sp,sp,80
    80002484:	8082                	ret

0000000080002486 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80002486:	1101                	addi	sp,sp,-32
    80002488:	ec06                	sd	ra,24(sp)
    8000248a:	e822                	sd	s0,16(sp)
    8000248c:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    8000248e:	fffff097          	auipc	ra,0xfffff
    80002492:	d48080e7          	jalr	-696(ra) # 800011d6 <kalloc>
    80002496:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    8000249a:	fe843783          	ld	a5,-24(s0)
    8000249e:	e399                	bnez	a5,800024a4 <uvmcreate+0x1e>
    return 0;
    800024a0:	4781                	li	a5,0
    800024a2:	a819                	j	800024b8 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    800024a4:	6605                	lui	a2,0x1
    800024a6:	4581                	li	a1,0
    800024a8:	fe843503          	ld	a0,-24(s0)
    800024ac:	fffff097          	auipc	ra,0xfffff
    800024b0:	090080e7          	jalr	144(ra) # 8000153c <memset>
  return pagetable;
    800024b4:	fe843783          	ld	a5,-24(s0)
}
    800024b8:	853e                	mv	a0,a5
    800024ba:	60e2                	ld	ra,24(sp)
    800024bc:	6442                	ld	s0,16(sp)
    800024be:	6105                	addi	sp,sp,32
    800024c0:	8082                	ret

00000000800024c2 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    800024c2:	7139                	addi	sp,sp,-64
    800024c4:	fc06                	sd	ra,56(sp)
    800024c6:	f822                	sd	s0,48(sp)
    800024c8:	0080                	addi	s0,sp,64
    800024ca:	fca43c23          	sd	a0,-40(s0)
    800024ce:	fcb43823          	sd	a1,-48(s0)
    800024d2:	87b2                	mv	a5,a2
    800024d4:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    800024d8:	fcc42783          	lw	a5,-52(s0)
    800024dc:	0007871b          	sext.w	a4,a5
    800024e0:	6785                	lui	a5,0x1
    800024e2:	00f76a63          	bltu	a4,a5,800024f6 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    800024e6:	0000a517          	auipc	a0,0xa
    800024ea:	c7250513          	addi	a0,a0,-910 # 8000c158 <etext+0x158>
    800024ee:	ffffe097          	auipc	ra,0xffffe
    800024f2:	79e080e7          	jalr	1950(ra) # 80000c8c <panic>
  mem = kalloc();
    800024f6:	fffff097          	auipc	ra,0xfffff
    800024fa:	ce0080e7          	jalr	-800(ra) # 800011d6 <kalloc>
    800024fe:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80002502:	6605                	lui	a2,0x1
    80002504:	4581                	li	a1,0
    80002506:	fe843503          	ld	a0,-24(s0)
    8000250a:	fffff097          	auipc	ra,0xfffff
    8000250e:	032080e7          	jalr	50(ra) # 8000153c <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80002512:	fe843783          	ld	a5,-24(s0)
    80002516:	4779                	li	a4,30
    80002518:	86be                	mv	a3,a5
    8000251a:	6605                	lui	a2,0x1
    8000251c:	4581                	li	a1,0
    8000251e:	fd843503          	ld	a0,-40(s0)
    80002522:	00000097          	auipc	ra,0x0
    80002526:	d60080e7          	jalr	-672(ra) # 80002282 <mappages>
  memmove(mem, src, sz);
    8000252a:	fcc42783          	lw	a5,-52(s0)
    8000252e:	863e                	mv	a2,a5
    80002530:	fd043583          	ld	a1,-48(s0)
    80002534:	fe843503          	ld	a0,-24(s0)
    80002538:	fffff097          	auipc	ra,0xfffff
    8000253c:	0e8080e7          	jalr	232(ra) # 80001620 <memmove>
}
    80002540:	0001                	nop
    80002542:	70e2                	ld	ra,56(sp)
    80002544:	7442                	ld	s0,48(sp)
    80002546:	6121                	addi	sp,sp,64
    80002548:	8082                	ret

000000008000254a <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    8000254a:	7139                	addi	sp,sp,-64
    8000254c:	fc06                	sd	ra,56(sp)
    8000254e:	f822                	sd	s0,48(sp)
    80002550:	0080                	addi	s0,sp,64
    80002552:	fca43c23          	sd	a0,-40(s0)
    80002556:	fcb43823          	sd	a1,-48(s0)
    8000255a:	fcc43423          	sd	a2,-56(s0)
    8000255e:	87b6                	mv	a5,a3
    80002560:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80002564:	fc843703          	ld	a4,-56(s0)
    80002568:	fd043783          	ld	a5,-48(s0)
    8000256c:	00f77563          	bgeu	a4,a5,80002576 <uvmalloc+0x2c>
    return oldsz;
    80002570:	fd043783          	ld	a5,-48(s0)
    80002574:	a87d                	j	80002632 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80002576:	fd043703          	ld	a4,-48(s0)
    8000257a:	6785                	lui	a5,0x1
    8000257c:	17fd                	addi	a5,a5,-1
    8000257e:	973e                	add	a4,a4,a5
    80002580:	77fd                	lui	a5,0xfffff
    80002582:	8ff9                	and	a5,a5,a4
    80002584:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002588:	fd043783          	ld	a5,-48(s0)
    8000258c:	fef43423          	sd	a5,-24(s0)
    80002590:	a849                	j	80002622 <uvmalloc+0xd8>
    mem = kalloc();
    80002592:	fffff097          	auipc	ra,0xfffff
    80002596:	c44080e7          	jalr	-956(ra) # 800011d6 <kalloc>
    8000259a:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    8000259e:	fe043783          	ld	a5,-32(s0)
    800025a2:	ef89                	bnez	a5,800025bc <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    800025a4:	fd043603          	ld	a2,-48(s0)
    800025a8:	fe843583          	ld	a1,-24(s0)
    800025ac:	fd843503          	ld	a0,-40(s0)
    800025b0:	00000097          	auipc	ra,0x0
    800025b4:	08c080e7          	jalr	140(ra) # 8000263c <uvmdealloc>
      return 0;
    800025b8:	4781                	li	a5,0
    800025ba:	a8a5                	j	80002632 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    800025bc:	6605                	lui	a2,0x1
    800025be:	4581                	li	a1,0
    800025c0:	fe043503          	ld	a0,-32(s0)
    800025c4:	fffff097          	auipc	ra,0xfffff
    800025c8:	f78080e7          	jalr	-136(ra) # 8000153c <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    800025cc:	fe043683          	ld	a3,-32(s0)
    800025d0:	fc442783          	lw	a5,-60(s0)
    800025d4:	0127e793          	ori	a5,a5,18
    800025d8:	2781                	sext.w	a5,a5
    800025da:	873e                	mv	a4,a5
    800025dc:	6605                	lui	a2,0x1
    800025de:	fe843583          	ld	a1,-24(s0)
    800025e2:	fd843503          	ld	a0,-40(s0)
    800025e6:	00000097          	auipc	ra,0x0
    800025ea:	c9c080e7          	jalr	-868(ra) # 80002282 <mappages>
    800025ee:	87aa                	mv	a5,a0
    800025f0:	c39d                	beqz	a5,80002616 <uvmalloc+0xcc>
      kfree(mem);
    800025f2:	fe043503          	ld	a0,-32(s0)
    800025f6:	fffff097          	auipc	ra,0xfffff
    800025fa:	b3a080e7          	jalr	-1222(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    800025fe:	fd043603          	ld	a2,-48(s0)
    80002602:	fe843583          	ld	a1,-24(s0)
    80002606:	fd843503          	ld	a0,-40(s0)
    8000260a:	00000097          	auipc	ra,0x0
    8000260e:	032080e7          	jalr	50(ra) # 8000263c <uvmdealloc>
      return 0;
    80002612:	4781                	li	a5,0
    80002614:	a839                	j	80002632 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002616:	fe843703          	ld	a4,-24(s0)
    8000261a:	6785                	lui	a5,0x1
    8000261c:	97ba                	add	a5,a5,a4
    8000261e:	fef43423          	sd	a5,-24(s0)
    80002622:	fe843703          	ld	a4,-24(s0)
    80002626:	fc843783          	ld	a5,-56(s0)
    8000262a:	f6f764e3          	bltu	a4,a5,80002592 <uvmalloc+0x48>
    }
  }
  return newsz;
    8000262e:	fc843783          	ld	a5,-56(s0)
}
    80002632:	853e                	mv	a0,a5
    80002634:	70e2                	ld	ra,56(sp)
    80002636:	7442                	ld	s0,48(sp)
    80002638:	6121                	addi	sp,sp,64
    8000263a:	8082                	ret

000000008000263c <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    8000263c:	7139                	addi	sp,sp,-64
    8000263e:	fc06                	sd	ra,56(sp)
    80002640:	f822                	sd	s0,48(sp)
    80002642:	0080                	addi	s0,sp,64
    80002644:	fca43c23          	sd	a0,-40(s0)
    80002648:	fcb43823          	sd	a1,-48(s0)
    8000264c:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002650:	fc843703          	ld	a4,-56(s0)
    80002654:	fd043783          	ld	a5,-48(s0)
    80002658:	00f76563          	bltu	a4,a5,80002662 <uvmdealloc+0x26>
    return oldsz;
    8000265c:	fd043783          	ld	a5,-48(s0)
    80002660:	a885                	j	800026d0 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002662:	fc843703          	ld	a4,-56(s0)
    80002666:	6785                	lui	a5,0x1
    80002668:	17fd                	addi	a5,a5,-1
    8000266a:	973e                	add	a4,a4,a5
    8000266c:	77fd                	lui	a5,0xfffff
    8000266e:	8f7d                	and	a4,a4,a5
    80002670:	fd043683          	ld	a3,-48(s0)
    80002674:	6785                	lui	a5,0x1
    80002676:	17fd                	addi	a5,a5,-1
    80002678:	96be                	add	a3,a3,a5
    8000267a:	77fd                	lui	a5,0xfffff
    8000267c:	8ff5                	and	a5,a5,a3
    8000267e:	04f77763          	bgeu	a4,a5,800026cc <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002682:	fd043703          	ld	a4,-48(s0)
    80002686:	6785                	lui	a5,0x1
    80002688:	17fd                	addi	a5,a5,-1
    8000268a:	973e                	add	a4,a4,a5
    8000268c:	77fd                	lui	a5,0xfffff
    8000268e:	8f7d                	and	a4,a4,a5
    80002690:	fc843683          	ld	a3,-56(s0)
    80002694:	6785                	lui	a5,0x1
    80002696:	17fd                	addi	a5,a5,-1
    80002698:	96be                	add	a3,a3,a5
    8000269a:	77fd                	lui	a5,0xfffff
    8000269c:	8ff5                	and	a5,a5,a3
    8000269e:	40f707b3          	sub	a5,a4,a5
    800026a2:	83b1                	srli	a5,a5,0xc
    800026a4:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    800026a8:	fc843703          	ld	a4,-56(s0)
    800026ac:	6785                	lui	a5,0x1
    800026ae:	17fd                	addi	a5,a5,-1
    800026b0:	973e                	add	a4,a4,a5
    800026b2:	77fd                	lui	a5,0xfffff
    800026b4:	8ff9                	and	a5,a5,a4
    800026b6:	fec42703          	lw	a4,-20(s0)
    800026ba:	4685                	li	a3,1
    800026bc:	863a                	mv	a2,a4
    800026be:	85be                	mv	a1,a5
    800026c0:	fd843503          	ld	a0,-40(s0)
    800026c4:	00000097          	auipc	ra,0x0
    800026c8:	cb6080e7          	jalr	-842(ra) # 8000237a <uvmunmap>
  }

  return newsz;
    800026cc:	fc843783          	ld	a5,-56(s0)
}
    800026d0:	853e                	mv	a0,a5
    800026d2:	70e2                	ld	ra,56(sp)
    800026d4:	7442                	ld	s0,48(sp)
    800026d6:	6121                	addi	sp,sp,64
    800026d8:	8082                	ret

00000000800026da <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    800026da:	7139                	addi	sp,sp,-64
    800026dc:	fc06                	sd	ra,56(sp)
    800026de:	f822                	sd	s0,48(sp)
    800026e0:	0080                	addi	s0,sp,64
    800026e2:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    800026e6:	fe042623          	sw	zero,-20(s0)
    800026ea:	a88d                	j	8000275c <freewalk+0x82>
    pte_t pte = pagetable[i];
    800026ec:	fec42783          	lw	a5,-20(s0)
    800026f0:	078e                	slli	a5,a5,0x3
    800026f2:	fc843703          	ld	a4,-56(s0)
    800026f6:	97ba                	add	a5,a5,a4
    800026f8:	639c                	ld	a5,0(a5)
    800026fa:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800026fe:	fe043783          	ld	a5,-32(s0)
    80002702:	8b85                	andi	a5,a5,1
    80002704:	cb9d                	beqz	a5,8000273a <freewalk+0x60>
    80002706:	fe043783          	ld	a5,-32(s0)
    8000270a:	8bb9                	andi	a5,a5,14
    8000270c:	e79d                	bnez	a5,8000273a <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    8000270e:	fe043783          	ld	a5,-32(s0)
    80002712:	83a9                	srli	a5,a5,0xa
    80002714:	07b2                	slli	a5,a5,0xc
    80002716:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    8000271a:	fd843783          	ld	a5,-40(s0)
    8000271e:	853e                	mv	a0,a5
    80002720:	00000097          	auipc	ra,0x0
    80002724:	fba080e7          	jalr	-70(ra) # 800026da <freewalk>
      pagetable[i] = 0;
    80002728:	fec42783          	lw	a5,-20(s0)
    8000272c:	078e                	slli	a5,a5,0x3
    8000272e:	fc843703          	ld	a4,-56(s0)
    80002732:	97ba                	add	a5,a5,a4
    80002734:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffc10d0>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002738:	a829                	j	80002752 <freewalk+0x78>
    } else if(pte & PTE_V){
    8000273a:	fe043783          	ld	a5,-32(s0)
    8000273e:	8b85                	andi	a5,a5,1
    80002740:	cb89                	beqz	a5,80002752 <freewalk+0x78>
      panic("freewalk: leaf");
    80002742:	0000a517          	auipc	a0,0xa
    80002746:	a3650513          	addi	a0,a0,-1482 # 8000c178 <etext+0x178>
    8000274a:	ffffe097          	auipc	ra,0xffffe
    8000274e:	542080e7          	jalr	1346(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    80002752:	fec42783          	lw	a5,-20(s0)
    80002756:	2785                	addiw	a5,a5,1
    80002758:	fef42623          	sw	a5,-20(s0)
    8000275c:	fec42783          	lw	a5,-20(s0)
    80002760:	0007871b          	sext.w	a4,a5
    80002764:	1ff00793          	li	a5,511
    80002768:	f8e7d2e3          	bge	a5,a4,800026ec <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000276c:	fc843503          	ld	a0,-56(s0)
    80002770:	fffff097          	auipc	ra,0xfffff
    80002774:	9c0080e7          	jalr	-1600(ra) # 80001130 <kfree>
}
    80002778:	0001                	nop
    8000277a:	70e2                	ld	ra,56(sp)
    8000277c:	7442                	ld	s0,48(sp)
    8000277e:	6121                	addi	sp,sp,64
    80002780:	8082                	ret

0000000080002782 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002782:	1101                	addi	sp,sp,-32
    80002784:	ec06                	sd	ra,24(sp)
    80002786:	e822                	sd	s0,16(sp)
    80002788:	1000                	addi	s0,sp,32
    8000278a:	fea43423          	sd	a0,-24(s0)
    8000278e:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002792:	fe043783          	ld	a5,-32(s0)
    80002796:	c385                	beqz	a5,800027b6 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002798:	fe043703          	ld	a4,-32(s0)
    8000279c:	6785                	lui	a5,0x1
    8000279e:	17fd                	addi	a5,a5,-1
    800027a0:	97ba                	add	a5,a5,a4
    800027a2:	83b1                	srli	a5,a5,0xc
    800027a4:	4685                	li	a3,1
    800027a6:	863e                	mv	a2,a5
    800027a8:	4581                	li	a1,0
    800027aa:	fe843503          	ld	a0,-24(s0)
    800027ae:	00000097          	auipc	ra,0x0
    800027b2:	bcc080e7          	jalr	-1076(ra) # 8000237a <uvmunmap>
  freewalk(pagetable);
    800027b6:	fe843503          	ld	a0,-24(s0)
    800027ba:	00000097          	auipc	ra,0x0
    800027be:	f20080e7          	jalr	-224(ra) # 800026da <freewalk>
}
    800027c2:	0001                	nop
    800027c4:	60e2                	ld	ra,24(sp)
    800027c6:	6442                	ld	s0,16(sp)
    800027c8:	6105                	addi	sp,sp,32
    800027ca:	8082                	ret

00000000800027cc <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    800027cc:	711d                	addi	sp,sp,-96
    800027ce:	ec86                	sd	ra,88(sp)
    800027d0:	e8a2                	sd	s0,80(sp)
    800027d2:	1080                	addi	s0,sp,96
    800027d4:	faa43c23          	sd	a0,-72(s0)
    800027d8:	fab43823          	sd	a1,-80(s0)
    800027dc:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    800027e0:	fe043423          	sd	zero,-24(s0)
    800027e4:	a0d9                	j	800028aa <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    800027e6:	4601                	li	a2,0
    800027e8:	fe843583          	ld	a1,-24(s0)
    800027ec:	fb843503          	ld	a0,-72(s0)
    800027f0:	00000097          	auipc	ra,0x0
    800027f4:	892080e7          	jalr	-1902(ra) # 80002082 <walk>
    800027f8:	fea43023          	sd	a0,-32(s0)
    800027fc:	fe043783          	ld	a5,-32(s0)
    80002800:	eb89                	bnez	a5,80002812 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002802:	0000a517          	auipc	a0,0xa
    80002806:	98650513          	addi	a0,a0,-1658 # 8000c188 <etext+0x188>
    8000280a:	ffffe097          	auipc	ra,0xffffe
    8000280e:	482080e7          	jalr	1154(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80002812:	fe043783          	ld	a5,-32(s0)
    80002816:	639c                	ld	a5,0(a5)
    80002818:	8b85                	andi	a5,a5,1
    8000281a:	eb89                	bnez	a5,8000282c <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    8000281c:	0000a517          	auipc	a0,0xa
    80002820:	98c50513          	addi	a0,a0,-1652 # 8000c1a8 <etext+0x1a8>
    80002824:	ffffe097          	auipc	ra,0xffffe
    80002828:	468080e7          	jalr	1128(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    8000282c:	fe043783          	ld	a5,-32(s0)
    80002830:	639c                	ld	a5,0(a5)
    80002832:	83a9                	srli	a5,a5,0xa
    80002834:	07b2                	slli	a5,a5,0xc
    80002836:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    8000283a:	fe043783          	ld	a5,-32(s0)
    8000283e:	639c                	ld	a5,0(a5)
    80002840:	2781                	sext.w	a5,a5
    80002842:	3ff7f793          	andi	a5,a5,1023
    80002846:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    8000284a:	fffff097          	auipc	ra,0xfffff
    8000284e:	98c080e7          	jalr	-1652(ra) # 800011d6 <kalloc>
    80002852:	fca43423          	sd	a0,-56(s0)
    80002856:	fc843783          	ld	a5,-56(s0)
    8000285a:	c3a5                	beqz	a5,800028ba <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000285c:	fd843783          	ld	a5,-40(s0)
    80002860:	6605                	lui	a2,0x1
    80002862:	85be                	mv	a1,a5
    80002864:	fc843503          	ld	a0,-56(s0)
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	db8080e7          	jalr	-584(ra) # 80001620 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002870:	fc843783          	ld	a5,-56(s0)
    80002874:	fd442703          	lw	a4,-44(s0)
    80002878:	86be                	mv	a3,a5
    8000287a:	6605                	lui	a2,0x1
    8000287c:	fe843583          	ld	a1,-24(s0)
    80002880:	fb043503          	ld	a0,-80(s0)
    80002884:	00000097          	auipc	ra,0x0
    80002888:	9fe080e7          	jalr	-1538(ra) # 80002282 <mappages>
    8000288c:	87aa                	mv	a5,a0
    8000288e:	cb81                	beqz	a5,8000289e <uvmcopy+0xd2>
      kfree(mem);
    80002890:	fc843503          	ld	a0,-56(s0)
    80002894:	fffff097          	auipc	ra,0xfffff
    80002898:	89c080e7          	jalr	-1892(ra) # 80001130 <kfree>
      goto err;
    8000289c:	a005                	j	800028bc <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000289e:	fe843703          	ld	a4,-24(s0)
    800028a2:	6785                	lui	a5,0x1
    800028a4:	97ba                	add	a5,a5,a4
    800028a6:	fef43423          	sd	a5,-24(s0)
    800028aa:	fe843703          	ld	a4,-24(s0)
    800028ae:	fa843783          	ld	a5,-88(s0)
    800028b2:	f2f76ae3          	bltu	a4,a5,800027e6 <uvmcopy+0x1a>
    }
  }
  return 0;
    800028b6:	4781                	li	a5,0
    800028b8:	a839                	j	800028d6 <uvmcopy+0x10a>
      goto err;
    800028ba:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    800028bc:	fe843783          	ld	a5,-24(s0)
    800028c0:	83b1                	srli	a5,a5,0xc
    800028c2:	4685                	li	a3,1
    800028c4:	863e                	mv	a2,a5
    800028c6:	4581                	li	a1,0
    800028c8:	fb043503          	ld	a0,-80(s0)
    800028cc:	00000097          	auipc	ra,0x0
    800028d0:	aae080e7          	jalr	-1362(ra) # 8000237a <uvmunmap>
  return -1;
    800028d4:	57fd                	li	a5,-1
}
    800028d6:	853e                	mv	a0,a5
    800028d8:	60e6                	ld	ra,88(sp)
    800028da:	6446                	ld	s0,80(sp)
    800028dc:	6125                	addi	sp,sp,96
    800028de:	8082                	ret

00000000800028e0 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    800028e0:	7179                	addi	sp,sp,-48
    800028e2:	f406                	sd	ra,40(sp)
    800028e4:	f022                	sd	s0,32(sp)
    800028e6:	1800                	addi	s0,sp,48
    800028e8:	fca43c23          	sd	a0,-40(s0)
    800028ec:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800028f0:	4601                	li	a2,0
    800028f2:	fd043583          	ld	a1,-48(s0)
    800028f6:	fd843503          	ld	a0,-40(s0)
    800028fa:	fffff097          	auipc	ra,0xfffff
    800028fe:	788080e7          	jalr	1928(ra) # 80002082 <walk>
    80002902:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80002906:	fe843783          	ld	a5,-24(s0)
    8000290a:	eb89                	bnez	a5,8000291c <uvmclear+0x3c>
    panic("uvmclear");
    8000290c:	0000a517          	auipc	a0,0xa
    80002910:	8bc50513          	addi	a0,a0,-1860 # 8000c1c8 <etext+0x1c8>
    80002914:	ffffe097          	auipc	ra,0xffffe
    80002918:	378080e7          	jalr	888(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    8000291c:	fe843783          	ld	a5,-24(s0)
    80002920:	639c                	ld	a5,0(a5)
    80002922:	fef7f713          	andi	a4,a5,-17
    80002926:	fe843783          	ld	a5,-24(s0)
    8000292a:	e398                	sd	a4,0(a5)
  unreglrupage(va);
    8000292c:	fd043503          	ld	a0,-48(s0)
    80002930:	fffff097          	auipc	ra,0xfffff
    80002934:	1ee080e7          	jalr	494(ra) # 80001b1e <unreglrupage>
}
    80002938:	0001                	nop
    8000293a:	70a2                	ld	ra,40(sp)
    8000293c:	7402                	ld	s0,32(sp)
    8000293e:	6145                	addi	sp,sp,48
    80002940:	8082                	ret

0000000080002942 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    80002942:	715d                	addi	sp,sp,-80
    80002944:	e486                	sd	ra,72(sp)
    80002946:	e0a2                	sd	s0,64(sp)
    80002948:	0880                	addi	s0,sp,80
    8000294a:	fca43423          	sd	a0,-56(s0)
    8000294e:	fcb43023          	sd	a1,-64(s0)
    80002952:	fac43c23          	sd	a2,-72(s0)
    80002956:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    8000295a:	a055                	j	800029fe <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    8000295c:	fc043703          	ld	a4,-64(s0)
    80002960:	77fd                	lui	a5,0xfffff
    80002962:	8ff9                	and	a5,a5,a4
    80002964:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002968:	fe043583          	ld	a1,-32(s0)
    8000296c:	fc843503          	ld	a0,-56(s0)
    80002970:	00000097          	auipc	ra,0x0
    80002974:	81e080e7          	jalr	-2018(ra) # 8000218e <walkaddr>
    80002978:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000297c:	fd843783          	ld	a5,-40(s0)
    80002980:	e399                	bnez	a5,80002986 <copyout+0x44>
      return -1;
    80002982:	57fd                	li	a5,-1
    80002984:	a049                	j	80002a06 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    80002986:	fe043703          	ld	a4,-32(s0)
    8000298a:	fc043783          	ld	a5,-64(s0)
    8000298e:	8f1d                	sub	a4,a4,a5
    80002990:	6785                	lui	a5,0x1
    80002992:	97ba                	add	a5,a5,a4
    80002994:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002998:	fe843703          	ld	a4,-24(s0)
    8000299c:	fb043783          	ld	a5,-80(s0)
    800029a0:	00e7f663          	bgeu	a5,a4,800029ac <copyout+0x6a>
      n = len;
    800029a4:	fb043783          	ld	a5,-80(s0)
    800029a8:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    800029ac:	fc043703          	ld	a4,-64(s0)
    800029b0:	fe043783          	ld	a5,-32(s0)
    800029b4:	8f1d                	sub	a4,a4,a5
    800029b6:	fd843783          	ld	a5,-40(s0)
    800029ba:	97ba                	add	a5,a5,a4
    800029bc:	873e                	mv	a4,a5
    800029be:	fe843783          	ld	a5,-24(s0)
    800029c2:	2781                	sext.w	a5,a5
    800029c4:	863e                	mv	a2,a5
    800029c6:	fb843583          	ld	a1,-72(s0)
    800029ca:	853a                	mv	a0,a4
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	c54080e7          	jalr	-940(ra) # 80001620 <memmove>

    len -= n;
    800029d4:	fb043703          	ld	a4,-80(s0)
    800029d8:	fe843783          	ld	a5,-24(s0)
    800029dc:	40f707b3          	sub	a5,a4,a5
    800029e0:	faf43823          	sd	a5,-80(s0)
    src += n;
    800029e4:	fb843703          	ld	a4,-72(s0)
    800029e8:	fe843783          	ld	a5,-24(s0)
    800029ec:	97ba                	add	a5,a5,a4
    800029ee:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    800029f2:	fe043703          	ld	a4,-32(s0)
    800029f6:	6785                	lui	a5,0x1
    800029f8:	97ba                	add	a5,a5,a4
    800029fa:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800029fe:	fb043783          	ld	a5,-80(s0)
    80002a02:	ffa9                	bnez	a5,8000295c <copyout+0x1a>
  }
  return 0;
    80002a04:	4781                	li	a5,0
}
    80002a06:	853e                	mv	a0,a5
    80002a08:	60a6                	ld	ra,72(sp)
    80002a0a:	6406                	ld	s0,64(sp)
    80002a0c:	6161                	addi	sp,sp,80
    80002a0e:	8082                	ret

0000000080002a10 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    80002a10:	715d                	addi	sp,sp,-80
    80002a12:	e486                	sd	ra,72(sp)
    80002a14:	e0a2                	sd	s0,64(sp)
    80002a16:	0880                	addi	s0,sp,80
    80002a18:	fca43423          	sd	a0,-56(s0)
    80002a1c:	fcb43023          	sd	a1,-64(s0)
    80002a20:	fac43c23          	sd	a2,-72(s0)
    80002a24:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002a28:	a055                	j	80002acc <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    80002a2a:	fb843703          	ld	a4,-72(s0)
    80002a2e:	77fd                	lui	a5,0xfffff
    80002a30:	8ff9                	and	a5,a5,a4
    80002a32:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002a36:	fe043583          	ld	a1,-32(s0)
    80002a3a:	fc843503          	ld	a0,-56(s0)
    80002a3e:	fffff097          	auipc	ra,0xfffff
    80002a42:	750080e7          	jalr	1872(ra) # 8000218e <walkaddr>
    80002a46:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002a4a:	fd843783          	ld	a5,-40(s0)
    80002a4e:	e399                	bnez	a5,80002a54 <copyin+0x44>
      return -1;
    80002a50:	57fd                	li	a5,-1
    80002a52:	a049                	j	80002ad4 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    80002a54:	fe043703          	ld	a4,-32(s0)
    80002a58:	fb843783          	ld	a5,-72(s0)
    80002a5c:	8f1d                	sub	a4,a4,a5
    80002a5e:	6785                	lui	a5,0x1
    80002a60:	97ba                	add	a5,a5,a4
    80002a62:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002a66:	fe843703          	ld	a4,-24(s0)
    80002a6a:	fb043783          	ld	a5,-80(s0)
    80002a6e:	00e7f663          	bgeu	a5,a4,80002a7a <copyin+0x6a>
      n = len;
    80002a72:	fb043783          	ld	a5,-80(s0)
    80002a76:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80002a7a:	fb843703          	ld	a4,-72(s0)
    80002a7e:	fe043783          	ld	a5,-32(s0)
    80002a82:	8f1d                	sub	a4,a4,a5
    80002a84:	fd843783          	ld	a5,-40(s0)
    80002a88:	97ba                	add	a5,a5,a4
    80002a8a:	873e                	mv	a4,a5
    80002a8c:	fe843783          	ld	a5,-24(s0)
    80002a90:	2781                	sext.w	a5,a5
    80002a92:	863e                	mv	a2,a5
    80002a94:	85ba                	mv	a1,a4
    80002a96:	fc043503          	ld	a0,-64(s0)
    80002a9a:	fffff097          	auipc	ra,0xfffff
    80002a9e:	b86080e7          	jalr	-1146(ra) # 80001620 <memmove>

    len -= n;
    80002aa2:	fb043703          	ld	a4,-80(s0)
    80002aa6:	fe843783          	ld	a5,-24(s0)
    80002aaa:	40f707b3          	sub	a5,a4,a5
    80002aae:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002ab2:	fc043703          	ld	a4,-64(s0)
    80002ab6:	fe843783          	ld	a5,-24(s0)
    80002aba:	97ba                	add	a5,a5,a4
    80002abc:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002ac0:	fe043703          	ld	a4,-32(s0)
    80002ac4:	6785                	lui	a5,0x1
    80002ac6:	97ba                	add	a5,a5,a4
    80002ac8:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002acc:	fb043783          	ld	a5,-80(s0)
    80002ad0:	ffa9                	bnez	a5,80002a2a <copyin+0x1a>
  }
  return 0;
    80002ad2:	4781                	li	a5,0
}
    80002ad4:	853e                	mv	a0,a5
    80002ad6:	60a6                	ld	ra,72(sp)
    80002ad8:	6406                	ld	s0,64(sp)
    80002ada:	6161                	addi	sp,sp,80
    80002adc:	8082                	ret

0000000080002ade <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002ade:	711d                	addi	sp,sp,-96
    80002ae0:	ec86                	sd	ra,88(sp)
    80002ae2:	e8a2                	sd	s0,80(sp)
    80002ae4:	1080                	addi	s0,sp,96
    80002ae6:	faa43c23          	sd	a0,-72(s0)
    80002aea:	fab43823          	sd	a1,-80(s0)
    80002aee:	fac43423          	sd	a2,-88(s0)
    80002af2:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    80002af6:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    80002afa:	a0f1                	j	80002bc6 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    80002afc:	fa843703          	ld	a4,-88(s0)
    80002b00:	77fd                	lui	a5,0xfffff
    80002b02:	8ff9                	and	a5,a5,a4
    80002b04:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    80002b08:	fd043583          	ld	a1,-48(s0)
    80002b0c:	fb843503          	ld	a0,-72(s0)
    80002b10:	fffff097          	auipc	ra,0xfffff
    80002b14:	67e080e7          	jalr	1662(ra) # 8000218e <walkaddr>
    80002b18:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    80002b1c:	fc843783          	ld	a5,-56(s0)
    80002b20:	e399                	bnez	a5,80002b26 <copyinstr+0x48>
      return -1;
    80002b22:	57fd                	li	a5,-1
    80002b24:	a87d                	j	80002be2 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    80002b26:	fd043703          	ld	a4,-48(s0)
    80002b2a:	fa843783          	ld	a5,-88(s0)
    80002b2e:	8f1d                	sub	a4,a4,a5
    80002b30:	6785                	lui	a5,0x1
    80002b32:	97ba                	add	a5,a5,a4
    80002b34:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    80002b38:	fe843703          	ld	a4,-24(s0)
    80002b3c:	fa043783          	ld	a5,-96(s0)
    80002b40:	00e7f663          	bgeu	a5,a4,80002b4c <copyinstr+0x6e>
      n = max;
    80002b44:	fa043783          	ld	a5,-96(s0)
    80002b48:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    80002b4c:	fa843703          	ld	a4,-88(s0)
    80002b50:	fd043783          	ld	a5,-48(s0)
    80002b54:	8f1d                	sub	a4,a4,a5
    80002b56:	fc843783          	ld	a5,-56(s0)
    80002b5a:	97ba                	add	a5,a5,a4
    80002b5c:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002b60:	a891                	j	80002bb4 <copyinstr+0xd6>
      if(*p == '\0'){
    80002b62:	fd843783          	ld	a5,-40(s0)
    80002b66:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    80002b6a:	eb89                	bnez	a5,80002b7c <copyinstr+0x9e>
        *dst = '\0';
    80002b6c:	fb043783          	ld	a5,-80(s0)
    80002b70:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002b74:	4785                	li	a5,1
    80002b76:	fef42223          	sw	a5,-28(s0)
        break;
    80002b7a:	a081                	j	80002bba <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002b7c:	fd843783          	ld	a5,-40(s0)
    80002b80:	0007c703          	lbu	a4,0(a5)
    80002b84:	fb043783          	ld	a5,-80(s0)
    80002b88:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002b8c:	fe843783          	ld	a5,-24(s0)
    80002b90:	17fd                	addi	a5,a5,-1
    80002b92:	fef43423          	sd	a5,-24(s0)
      --max;
    80002b96:	fa043783          	ld	a5,-96(s0)
    80002b9a:	17fd                	addi	a5,a5,-1
    80002b9c:	faf43023          	sd	a5,-96(s0)
      p++;
    80002ba0:	fd843783          	ld	a5,-40(s0)
    80002ba4:	0785                	addi	a5,a5,1
    80002ba6:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    80002baa:	fb043783          	ld	a5,-80(s0)
    80002bae:	0785                	addi	a5,a5,1
    80002bb0:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002bb4:	fe843783          	ld	a5,-24(s0)
    80002bb8:	f7cd                	bnez	a5,80002b62 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    80002bba:	fd043703          	ld	a4,-48(s0)
    80002bbe:	6785                	lui	a5,0x1
    80002bc0:	97ba                	add	a5,a5,a4
    80002bc2:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    80002bc6:	fe442783          	lw	a5,-28(s0)
    80002bca:	2781                	sext.w	a5,a5
    80002bcc:	e781                	bnez	a5,80002bd4 <copyinstr+0xf6>
    80002bce:	fa043783          	ld	a5,-96(s0)
    80002bd2:	f78d                	bnez	a5,80002afc <copyinstr+0x1e>
  }
  if(got_null){
    80002bd4:	fe442783          	lw	a5,-28(s0)
    80002bd8:	2781                	sext.w	a5,a5
    80002bda:	c399                	beqz	a5,80002be0 <copyinstr+0x102>
    return 0;
    80002bdc:	4781                	li	a5,0
    80002bde:	a011                	j	80002be2 <copyinstr+0x104>
  } else {
    return -1;
    80002be0:	57fd                	li	a5,-1
  }
}
    80002be2:	853e                	mv	a0,a5
    80002be4:	60e6                	ld	ra,88(sp)
    80002be6:	6446                	ld	s0,80(sp)
    80002be8:	6125                	addi	sp,sp,96
    80002bea:	8082                	ret

0000000080002bec <r_sstatus>:
{
    80002bec:	1101                	addi	sp,sp,-32
    80002bee:	ec22                	sd	s0,24(sp)
    80002bf0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002bf2:	100027f3          	csrr	a5,sstatus
    80002bf6:	fef43423          	sd	a5,-24(s0)
  return x;
    80002bfa:	fe843783          	ld	a5,-24(s0)
}
    80002bfe:	853e                	mv	a0,a5
    80002c00:	6462                	ld	s0,24(sp)
    80002c02:	6105                	addi	sp,sp,32
    80002c04:	8082                	ret

0000000080002c06 <w_sstatus>:
{
    80002c06:	1101                	addi	sp,sp,-32
    80002c08:	ec22                	sd	s0,24(sp)
    80002c0a:	1000                	addi	s0,sp,32
    80002c0c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80002c10:	fe843783          	ld	a5,-24(s0)
    80002c14:	10079073          	csrw	sstatus,a5
}
    80002c18:	0001                	nop
    80002c1a:	6462                	ld	s0,24(sp)
    80002c1c:	6105                	addi	sp,sp,32
    80002c1e:	8082                	ret

0000000080002c20 <intr_on>:
{
    80002c20:	1141                	addi	sp,sp,-16
    80002c22:	e406                	sd	ra,8(sp)
    80002c24:	e022                	sd	s0,0(sp)
    80002c26:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80002c28:	00000097          	auipc	ra,0x0
    80002c2c:	fc4080e7          	jalr	-60(ra) # 80002bec <r_sstatus>
    80002c30:	87aa                	mv	a5,a0
    80002c32:	0027e793          	ori	a5,a5,2
    80002c36:	853e                	mv	a0,a5
    80002c38:	00000097          	auipc	ra,0x0
    80002c3c:	fce080e7          	jalr	-50(ra) # 80002c06 <w_sstatus>
}
    80002c40:	0001                	nop
    80002c42:	60a2                	ld	ra,8(sp)
    80002c44:	6402                	ld	s0,0(sp)
    80002c46:	0141                	addi	sp,sp,16
    80002c48:	8082                	ret

0000000080002c4a <intr_get>:
{
    80002c4a:	1101                	addi	sp,sp,-32
    80002c4c:	ec06                	sd	ra,24(sp)
    80002c4e:	e822                	sd	s0,16(sp)
    80002c50:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80002c52:	00000097          	auipc	ra,0x0
    80002c56:	f9a080e7          	jalr	-102(ra) # 80002bec <r_sstatus>
    80002c5a:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002c5e:	fe843783          	ld	a5,-24(s0)
    80002c62:	8b89                	andi	a5,a5,2
    80002c64:	00f037b3          	snez	a5,a5
    80002c68:	0ff7f793          	andi	a5,a5,255
    80002c6c:	2781                	sext.w	a5,a5
}
    80002c6e:	853e                	mv	a0,a5
    80002c70:	60e2                	ld	ra,24(sp)
    80002c72:	6442                	ld	s0,16(sp)
    80002c74:	6105                	addi	sp,sp,32
    80002c76:	8082                	ret

0000000080002c78 <r_tp>:
{
    80002c78:	1101                	addi	sp,sp,-32
    80002c7a:	ec22                	sd	s0,24(sp)
    80002c7c:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002c7e:	8792                	mv	a5,tp
    80002c80:	fef43423          	sd	a5,-24(s0)
  return x;
    80002c84:	fe843783          	ld	a5,-24(s0)
}
    80002c88:	853e                	mv	a0,a5
    80002c8a:	6462                	ld	s0,24(sp)
    80002c8c:	6105                	addi	sp,sp,32
    80002c8e:	8082                	ret

0000000080002c90 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    80002c90:	7139                	addi	sp,sp,-64
    80002c92:	fc06                	sd	ra,56(sp)
    80002c94:	f822                	sd	s0,48(sp)
    80002c96:	0080                	addi	s0,sp,64
    80002c98:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002c9c:	0002a797          	auipc	a5,0x2a
    80002ca0:	31c78793          	addi	a5,a5,796 # 8002cfb8 <proc>
    80002ca4:	fef43423          	sd	a5,-24(s0)
    80002ca8:	a061                	j	80002d30 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    80002caa:	ffffe097          	auipc	ra,0xffffe
    80002cae:	52c080e7          	jalr	1324(ra) # 800011d6 <kalloc>
    80002cb2:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80002cb6:	fe043783          	ld	a5,-32(s0)
    80002cba:	eb89                	bnez	a5,80002ccc <proc_mapstacks+0x3c>
      panic("kalloc");
    80002cbc:	00009517          	auipc	a0,0x9
    80002cc0:	51c50513          	addi	a0,a0,1308 # 8000c1d8 <etext+0x1d8>
    80002cc4:	ffffe097          	auipc	ra,0xffffe
    80002cc8:	fc8080e7          	jalr	-56(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002ccc:	fe843703          	ld	a4,-24(s0)
    80002cd0:	0002a797          	auipc	a5,0x2a
    80002cd4:	2e878793          	addi	a5,a5,744 # 8002cfb8 <proc>
    80002cd8:	40f707b3          	sub	a5,a4,a5
    80002cdc:	4037d713          	srai	a4,a5,0x3
    80002ce0:	00009797          	auipc	a5,0x9
    80002ce4:	5f078793          	addi	a5,a5,1520 # 8000c2d0 <etext+0x2d0>
    80002ce8:	639c                	ld	a5,0(a5)
    80002cea:	02f707b3          	mul	a5,a4,a5
    80002cee:	2781                	sext.w	a5,a5
    80002cf0:	2785                	addiw	a5,a5,1
    80002cf2:	2781                	sext.w	a5,a5
    80002cf4:	00d7979b          	slliw	a5,a5,0xd
    80002cf8:	2781                	sext.w	a5,a5
    80002cfa:	873e                	mv	a4,a5
    80002cfc:	040007b7          	lui	a5,0x4000
    80002d00:	17fd                	addi	a5,a5,-1
    80002d02:	07b2                	slli	a5,a5,0xc
    80002d04:	8f99                	sub	a5,a5,a4
    80002d06:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    80002d0a:	fe043783          	ld	a5,-32(s0)
    80002d0e:	4719                	li	a4,6
    80002d10:	6685                	lui	a3,0x1
    80002d12:	863e                	mv	a2,a5
    80002d14:	fd843583          	ld	a1,-40(s0)
    80002d18:	fc843503          	ld	a0,-56(s0)
    80002d1c:	fffff097          	auipc	ra,0xfffff
    80002d20:	50c080e7          	jalr	1292(ra) # 80002228 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002d24:	fe843783          	ld	a5,-24(s0)
    80002d28:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002d2c:	fef43423          	sd	a5,-24(s0)
    80002d30:	fe843703          	ld	a4,-24(s0)
    80002d34:	00030797          	auipc	a5,0x30
    80002d38:	c8478793          	addi	a5,a5,-892 # 800329b8 <pid_lock>
    80002d3c:	f6f767e3          	bltu	a4,a5,80002caa <proc_mapstacks+0x1a>
  }
}
    80002d40:	0001                	nop
    80002d42:	0001                	nop
    80002d44:	70e2                	ld	ra,56(sp)
    80002d46:	7442                	ld	s0,48(sp)
    80002d48:	6121                	addi	sp,sp,64
    80002d4a:	8082                	ret

0000000080002d4c <procinit>:

// initialize the proc table.
void
procinit(void)
{
    80002d4c:	1101                	addi	sp,sp,-32
    80002d4e:	ec06                	sd	ra,24(sp)
    80002d50:	e822                	sd	s0,16(sp)
    80002d52:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    80002d54:	00009597          	auipc	a1,0x9
    80002d58:	48c58593          	addi	a1,a1,1164 # 8000c1e0 <etext+0x1e0>
    80002d5c:	00030517          	auipc	a0,0x30
    80002d60:	c5c50513          	addi	a0,a0,-932 # 800329b8 <pid_lock>
    80002d64:	ffffe097          	auipc	ra,0xffffe
    80002d68:	5d4080e7          	jalr	1492(ra) # 80001338 <initlock>
  initlock(&wait_lock, "wait_lock");
    80002d6c:	00009597          	auipc	a1,0x9
    80002d70:	47c58593          	addi	a1,a1,1148 # 8000c1e8 <etext+0x1e8>
    80002d74:	00030517          	auipc	a0,0x30
    80002d78:	c5c50513          	addi	a0,a0,-932 # 800329d0 <wait_lock>
    80002d7c:	ffffe097          	auipc	ra,0xffffe
    80002d80:	5bc080e7          	jalr	1468(ra) # 80001338 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002d84:	0002a797          	auipc	a5,0x2a
    80002d88:	23478793          	addi	a5,a5,564 # 8002cfb8 <proc>
    80002d8c:	fef43423          	sd	a5,-24(s0)
    80002d90:	a0bd                	j	80002dfe <procinit+0xb2>
      initlock(&p->lock, "proc");
    80002d92:	fe843783          	ld	a5,-24(s0)
    80002d96:	00009597          	auipc	a1,0x9
    80002d9a:	46258593          	addi	a1,a1,1122 # 8000c1f8 <etext+0x1f8>
    80002d9e:	853e                	mv	a0,a5
    80002da0:	ffffe097          	auipc	ra,0xffffe
    80002da4:	598080e7          	jalr	1432(ra) # 80001338 <initlock>
      p->state = UNUSED;
    80002da8:	fe843783          	ld	a5,-24(s0)
    80002dac:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    80002db0:	fe843703          	ld	a4,-24(s0)
    80002db4:	0002a797          	auipc	a5,0x2a
    80002db8:	20478793          	addi	a5,a5,516 # 8002cfb8 <proc>
    80002dbc:	40f707b3          	sub	a5,a4,a5
    80002dc0:	4037d713          	srai	a4,a5,0x3
    80002dc4:	00009797          	auipc	a5,0x9
    80002dc8:	50c78793          	addi	a5,a5,1292 # 8000c2d0 <etext+0x2d0>
    80002dcc:	639c                	ld	a5,0(a5)
    80002dce:	02f707b3          	mul	a5,a4,a5
    80002dd2:	2781                	sext.w	a5,a5
    80002dd4:	2785                	addiw	a5,a5,1
    80002dd6:	2781                	sext.w	a5,a5
    80002dd8:	00d7979b          	slliw	a5,a5,0xd
    80002ddc:	2781                	sext.w	a5,a5
    80002dde:	873e                	mv	a4,a5
    80002de0:	040007b7          	lui	a5,0x4000
    80002de4:	17fd                	addi	a5,a5,-1
    80002de6:	07b2                	slli	a5,a5,0xc
    80002de8:	8f99                	sub	a5,a5,a4
    80002dea:	873e                	mv	a4,a5
    80002dec:	fe843783          	ld	a5,-24(s0)
    80002df0:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002df2:	fe843783          	ld	a5,-24(s0)
    80002df6:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002dfa:	fef43423          	sd	a5,-24(s0)
    80002dfe:	fe843703          	ld	a4,-24(s0)
    80002e02:	00030797          	auipc	a5,0x30
    80002e06:	bb678793          	addi	a5,a5,-1098 # 800329b8 <pid_lock>
    80002e0a:	f8f764e3          	bltu	a4,a5,80002d92 <procinit+0x46>
  }
}
    80002e0e:	0001                	nop
    80002e10:	0001                	nop
    80002e12:	60e2                	ld	ra,24(sp)
    80002e14:	6442                	ld	s0,16(sp)
    80002e16:	6105                	addi	sp,sp,32
    80002e18:	8082                	ret

0000000080002e1a <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002e1a:	1101                	addi	sp,sp,-32
    80002e1c:	ec06                	sd	ra,24(sp)
    80002e1e:	e822                	sd	s0,16(sp)
    80002e20:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002e22:	00000097          	auipc	ra,0x0
    80002e26:	e56080e7          	jalr	-426(ra) # 80002c78 <r_tp>
    80002e2a:	87aa                	mv	a5,a0
    80002e2c:	fef42623          	sw	a5,-20(s0)
  return id;
    80002e30:	fec42783          	lw	a5,-20(s0)
}
    80002e34:	853e                	mv	a0,a5
    80002e36:	60e2                	ld	ra,24(sp)
    80002e38:	6442                	ld	s0,16(sp)
    80002e3a:	6105                	addi	sp,sp,32
    80002e3c:	8082                	ret

0000000080002e3e <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002e3e:	1101                	addi	sp,sp,-32
    80002e40:	ec06                	sd	ra,24(sp)
    80002e42:	e822                	sd	s0,16(sp)
    80002e44:	1000                	addi	s0,sp,32
  int id = cpuid();
    80002e46:	00000097          	auipc	ra,0x0
    80002e4a:	fd4080e7          	jalr	-44(ra) # 80002e1a <cpuid>
    80002e4e:	87aa                	mv	a5,a0
    80002e50:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002e54:	fec42783          	lw	a5,-20(s0)
    80002e58:	00779713          	slli	a4,a5,0x7
    80002e5c:	0002a797          	auipc	a5,0x2a
    80002e60:	d5c78793          	addi	a5,a5,-676 # 8002cbb8 <cpus>
    80002e64:	97ba                	add	a5,a5,a4
    80002e66:	fef43023          	sd	a5,-32(s0)
  return c;
    80002e6a:	fe043783          	ld	a5,-32(s0)
}
    80002e6e:	853e                	mv	a0,a5
    80002e70:	60e2                	ld	ra,24(sp)
    80002e72:	6442                	ld	s0,16(sp)
    80002e74:	6105                	addi	sp,sp,32
    80002e76:	8082                	ret

0000000080002e78 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002e78:	1101                	addi	sp,sp,-32
    80002e7a:	ec06                	sd	ra,24(sp)
    80002e7c:	e822                	sd	s0,16(sp)
    80002e7e:	1000                	addi	s0,sp,32
  push_off();
    80002e80:	ffffe097          	auipc	ra,0xffffe
    80002e84:	5e6080e7          	jalr	1510(ra) # 80001466 <push_off>
  struct cpu *c = mycpu();
    80002e88:	00000097          	auipc	ra,0x0
    80002e8c:	fb6080e7          	jalr	-74(ra) # 80002e3e <mycpu>
    80002e90:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002e94:	fe843783          	ld	a5,-24(s0)
    80002e98:	639c                	ld	a5,0(a5)
    80002e9a:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002e9e:	ffffe097          	auipc	ra,0xffffe
    80002ea2:	620080e7          	jalr	1568(ra) # 800014be <pop_off>
  return p;
    80002ea6:	fe043783          	ld	a5,-32(s0)
}
    80002eaa:	853e                	mv	a0,a5
    80002eac:	60e2                	ld	ra,24(sp)
    80002eae:	6442                	ld	s0,16(sp)
    80002eb0:	6105                	addi	sp,sp,32
    80002eb2:	8082                	ret

0000000080002eb4 <allocpid>:

int
allocpid()
{
    80002eb4:	1101                	addi	sp,sp,-32
    80002eb6:	ec06                	sd	ra,24(sp)
    80002eb8:	e822                	sd	s0,16(sp)
    80002eba:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002ebc:	00030517          	auipc	a0,0x30
    80002ec0:	afc50513          	addi	a0,a0,-1284 # 800329b8 <pid_lock>
    80002ec4:	ffffe097          	auipc	ra,0xffffe
    80002ec8:	4a4080e7          	jalr	1188(ra) # 80001368 <acquire>
  pid = nextpid;
    80002ecc:	0000a797          	auipc	a5,0xa
    80002ed0:	8f478793          	addi	a5,a5,-1804 # 8000c7c0 <nextpid>
    80002ed4:	439c                	lw	a5,0(a5)
    80002ed6:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002eda:	0000a797          	auipc	a5,0xa
    80002ede:	8e678793          	addi	a5,a5,-1818 # 8000c7c0 <nextpid>
    80002ee2:	439c                	lw	a5,0(a5)
    80002ee4:	2785                	addiw	a5,a5,1
    80002ee6:	0007871b          	sext.w	a4,a5
    80002eea:	0000a797          	auipc	a5,0xa
    80002eee:	8d678793          	addi	a5,a5,-1834 # 8000c7c0 <nextpid>
    80002ef2:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002ef4:	00030517          	auipc	a0,0x30
    80002ef8:	ac450513          	addi	a0,a0,-1340 # 800329b8 <pid_lock>
    80002efc:	ffffe097          	auipc	ra,0xffffe
    80002f00:	4d0080e7          	jalr	1232(ra) # 800013cc <release>

  return pid;
    80002f04:	fec42783          	lw	a5,-20(s0)
}
    80002f08:	853e                	mv	a0,a5
    80002f0a:	60e2                	ld	ra,24(sp)
    80002f0c:	6442                	ld	s0,16(sp)
    80002f0e:	6105                	addi	sp,sp,32
    80002f10:	8082                	ret

0000000080002f12 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002f12:	1101                	addi	sp,sp,-32
    80002f14:	ec06                	sd	ra,24(sp)
    80002f16:	e822                	sd	s0,16(sp)
    80002f18:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002f1a:	0002a797          	auipc	a5,0x2a
    80002f1e:	09e78793          	addi	a5,a5,158 # 8002cfb8 <proc>
    80002f22:	fef43423          	sd	a5,-24(s0)
    80002f26:	a80d                	j	80002f58 <allocproc+0x46>
    acquire(&p->lock);
    80002f28:	fe843783          	ld	a5,-24(s0)
    80002f2c:	853e                	mv	a0,a5
    80002f2e:	ffffe097          	auipc	ra,0xffffe
    80002f32:	43a080e7          	jalr	1082(ra) # 80001368 <acquire>
    if(p->state == UNUSED) {
    80002f36:	fe843783          	ld	a5,-24(s0)
    80002f3a:	4f9c                	lw	a5,24(a5)
    80002f3c:	cb85                	beqz	a5,80002f6c <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002f3e:	fe843783          	ld	a5,-24(s0)
    80002f42:	853e                	mv	a0,a5
    80002f44:	ffffe097          	auipc	ra,0xffffe
    80002f48:	488080e7          	jalr	1160(ra) # 800013cc <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002f4c:	fe843783          	ld	a5,-24(s0)
    80002f50:	16878793          	addi	a5,a5,360
    80002f54:	fef43423          	sd	a5,-24(s0)
    80002f58:	fe843703          	ld	a4,-24(s0)
    80002f5c:	00030797          	auipc	a5,0x30
    80002f60:	a5c78793          	addi	a5,a5,-1444 # 800329b8 <pid_lock>
    80002f64:	fcf762e3          	bltu	a4,a5,80002f28 <allocproc+0x16>
    }
  }
  return 0;
    80002f68:	4781                	li	a5,0
    80002f6a:	a0e1                	j	80003032 <allocproc+0x120>
      goto found;
    80002f6c:	0001                	nop

found:
  p->pid = allocpid();
    80002f6e:	00000097          	auipc	ra,0x0
    80002f72:	f46080e7          	jalr	-186(ra) # 80002eb4 <allocpid>
    80002f76:	87aa                	mv	a5,a0
    80002f78:	873e                	mv	a4,a5
    80002f7a:	fe843783          	ld	a5,-24(s0)
    80002f7e:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002f80:	fe843783          	ld	a5,-24(s0)
    80002f84:	4705                	li	a4,1
    80002f86:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002f88:	ffffe097          	auipc	ra,0xffffe
    80002f8c:	24e080e7          	jalr	590(ra) # 800011d6 <kalloc>
    80002f90:	872a                	mv	a4,a0
    80002f92:	fe843783          	ld	a5,-24(s0)
    80002f96:	efb8                	sd	a4,88(a5)
    80002f98:	fe843783          	ld	a5,-24(s0)
    80002f9c:	6fbc                	ld	a5,88(a5)
    80002f9e:	e385                	bnez	a5,80002fbe <allocproc+0xac>
    freeproc(p);
    80002fa0:	fe843503          	ld	a0,-24(s0)
    80002fa4:	00000097          	auipc	ra,0x0
    80002fa8:	098080e7          	jalr	152(ra) # 8000303c <freeproc>
    release(&p->lock);
    80002fac:	fe843783          	ld	a5,-24(s0)
    80002fb0:	853e                	mv	a0,a5
    80002fb2:	ffffe097          	auipc	ra,0xffffe
    80002fb6:	41a080e7          	jalr	1050(ra) # 800013cc <release>
    return 0;
    80002fba:	4781                	li	a5,0
    80002fbc:	a89d                	j	80003032 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002fbe:	fe843503          	ld	a0,-24(s0)
    80002fc2:	00000097          	auipc	ra,0x0
    80002fc6:	118080e7          	jalr	280(ra) # 800030da <proc_pagetable>
    80002fca:	872a                	mv	a4,a0
    80002fcc:	fe843783          	ld	a5,-24(s0)
    80002fd0:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002fd2:	fe843783          	ld	a5,-24(s0)
    80002fd6:	6bbc                	ld	a5,80(a5)
    80002fd8:	e385                	bnez	a5,80002ff8 <allocproc+0xe6>
    freeproc(p);
    80002fda:	fe843503          	ld	a0,-24(s0)
    80002fde:	00000097          	auipc	ra,0x0
    80002fe2:	05e080e7          	jalr	94(ra) # 8000303c <freeproc>
    release(&p->lock);
    80002fe6:	fe843783          	ld	a5,-24(s0)
    80002fea:	853e                	mv	a0,a5
    80002fec:	ffffe097          	auipc	ra,0xffffe
    80002ff0:	3e0080e7          	jalr	992(ra) # 800013cc <release>
    return 0;
    80002ff4:	4781                	li	a5,0
    80002ff6:	a835                	j	80003032 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002ff8:	fe843783          	ld	a5,-24(s0)
    80002ffc:	06078793          	addi	a5,a5,96
    80003000:	07000613          	li	a2,112
    80003004:	4581                	li	a1,0
    80003006:	853e                	mv	a0,a5
    80003008:	ffffe097          	auipc	ra,0xffffe
    8000300c:	534080e7          	jalr	1332(ra) # 8000153c <memset>
  p->context.ra = (uint64)forkret;
    80003010:	00001717          	auipc	a4,0x1
    80003014:	9da70713          	addi	a4,a4,-1574 # 800039ea <forkret>
    80003018:	fe843783          	ld	a5,-24(s0)
    8000301c:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    8000301e:	fe843783          	ld	a5,-24(s0)
    80003022:	63b8                	ld	a4,64(a5)
    80003024:	6785                	lui	a5,0x1
    80003026:	973e                	add	a4,a4,a5
    80003028:	fe843783          	ld	a5,-24(s0)
    8000302c:	f7b8                	sd	a4,104(a5)

  return p;
    8000302e:	fe843783          	ld	a5,-24(s0)
}
    80003032:	853e                	mv	a0,a5
    80003034:	60e2                	ld	ra,24(sp)
    80003036:	6442                	ld	s0,16(sp)
    80003038:	6105                	addi	sp,sp,32
    8000303a:	8082                	ret

000000008000303c <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    8000303c:	1101                	addi	sp,sp,-32
    8000303e:	ec06                	sd	ra,24(sp)
    80003040:	e822                	sd	s0,16(sp)
    80003042:	1000                	addi	s0,sp,32
    80003044:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80003048:	fe843783          	ld	a5,-24(s0)
    8000304c:	6fbc                	ld	a5,88(a5)
    8000304e:	cb89                	beqz	a5,80003060 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80003050:	fe843783          	ld	a5,-24(s0)
    80003054:	6fbc                	ld	a5,88(a5)
    80003056:	853e                	mv	a0,a5
    80003058:	ffffe097          	auipc	ra,0xffffe
    8000305c:	0d8080e7          	jalr	216(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80003060:	fe843783          	ld	a5,-24(s0)
    80003064:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80003068:	fe843783          	ld	a5,-24(s0)
    8000306c:	6bbc                	ld	a5,80(a5)
    8000306e:	cf89                	beqz	a5,80003088 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80003070:	fe843783          	ld	a5,-24(s0)
    80003074:	6bb8                	ld	a4,80(a5)
    80003076:	fe843783          	ld	a5,-24(s0)
    8000307a:	67bc                	ld	a5,72(a5)
    8000307c:	85be                	mv	a1,a5
    8000307e:	853a                	mv	a0,a4
    80003080:	00000097          	auipc	ra,0x0
    80003084:	11a080e7          	jalr	282(ra) # 8000319a <proc_freepagetable>
  p->pagetable = 0;
    80003088:	fe843783          	ld	a5,-24(s0)
    8000308c:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80003090:	fe843783          	ld	a5,-24(s0)
    80003094:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80003098:	fe843783          	ld	a5,-24(s0)
    8000309c:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    800030a0:	fe843783          	ld	a5,-24(s0)
    800030a4:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    800030a8:	fe843783          	ld	a5,-24(s0)
    800030ac:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    800030b0:	fe843783          	ld	a5,-24(s0)
    800030b4:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    800030b8:	fe843783          	ld	a5,-24(s0)
    800030bc:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    800030c0:	fe843783          	ld	a5,-24(s0)
    800030c4:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    800030c8:	fe843783          	ld	a5,-24(s0)
    800030cc:	0007ac23          	sw	zero,24(a5)
}
    800030d0:	0001                	nop
    800030d2:	60e2                	ld	ra,24(sp)
    800030d4:	6442                	ld	s0,16(sp)
    800030d6:	6105                	addi	sp,sp,32
    800030d8:	8082                	ret

00000000800030da <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    800030da:	7179                	addi	sp,sp,-48
    800030dc:	f406                	sd	ra,40(sp)
    800030de:	f022                	sd	s0,32(sp)
    800030e0:	1800                	addi	s0,sp,48
    800030e2:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    800030e6:	fffff097          	auipc	ra,0xfffff
    800030ea:	3a0080e7          	jalr	928(ra) # 80002486 <uvmcreate>
    800030ee:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    800030f2:	fe843783          	ld	a5,-24(s0)
    800030f6:	e399                	bnez	a5,800030fc <proc_pagetable+0x22>
    return 0;
    800030f8:	4781                	li	a5,0
    800030fa:	a859                	j	80003190 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    800030fc:	00008797          	auipc	a5,0x8
    80003100:	f0478793          	addi	a5,a5,-252 # 8000b000 <_trampoline>
    80003104:	4729                	li	a4,10
    80003106:	86be                	mv	a3,a5
    80003108:	6605                	lui	a2,0x1
    8000310a:	040007b7          	lui	a5,0x4000
    8000310e:	17fd                	addi	a5,a5,-1
    80003110:	00c79593          	slli	a1,a5,0xc
    80003114:	fe843503          	ld	a0,-24(s0)
    80003118:	fffff097          	auipc	ra,0xfffff
    8000311c:	16a080e7          	jalr	362(ra) # 80002282 <mappages>
    80003120:	87aa                	mv	a5,a0
    80003122:	0007db63          	bgez	a5,80003138 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80003126:	4581                	li	a1,0
    80003128:	fe843503          	ld	a0,-24(s0)
    8000312c:	fffff097          	auipc	ra,0xfffff
    80003130:	656080e7          	jalr	1622(ra) # 80002782 <uvmfree>
    return 0;
    80003134:	4781                	li	a5,0
    80003136:	a8a9                	j	80003190 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80003138:	fd843783          	ld	a5,-40(s0)
    8000313c:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    8000313e:	4719                	li	a4,6
    80003140:	86be                	mv	a3,a5
    80003142:	6605                	lui	a2,0x1
    80003144:	020007b7          	lui	a5,0x2000
    80003148:	17fd                	addi	a5,a5,-1
    8000314a:	00d79593          	slli	a1,a5,0xd
    8000314e:	fe843503          	ld	a0,-24(s0)
    80003152:	fffff097          	auipc	ra,0xfffff
    80003156:	130080e7          	jalr	304(ra) # 80002282 <mappages>
    8000315a:	87aa                	mv	a5,a0
    8000315c:	0207d863          	bgez	a5,8000318c <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80003160:	4681                	li	a3,0
    80003162:	4605                	li	a2,1
    80003164:	040007b7          	lui	a5,0x4000
    80003168:	17fd                	addi	a5,a5,-1
    8000316a:	00c79593          	slli	a1,a5,0xc
    8000316e:	fe843503          	ld	a0,-24(s0)
    80003172:	fffff097          	auipc	ra,0xfffff
    80003176:	208080e7          	jalr	520(ra) # 8000237a <uvmunmap>
    uvmfree(pagetable, 0);
    8000317a:	4581                	li	a1,0
    8000317c:	fe843503          	ld	a0,-24(s0)
    80003180:	fffff097          	auipc	ra,0xfffff
    80003184:	602080e7          	jalr	1538(ra) # 80002782 <uvmfree>
    return 0;
    80003188:	4781                	li	a5,0
    8000318a:	a019                	j	80003190 <proc_pagetable+0xb6>
  }

  return pagetable;
    8000318c:	fe843783          	ld	a5,-24(s0)
}
    80003190:	853e                	mv	a0,a5
    80003192:	70a2                	ld	ra,40(sp)
    80003194:	7402                	ld	s0,32(sp)
    80003196:	6145                	addi	sp,sp,48
    80003198:	8082                	ret

000000008000319a <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    8000319a:	1101                	addi	sp,sp,-32
    8000319c:	ec06                	sd	ra,24(sp)
    8000319e:	e822                	sd	s0,16(sp)
    800031a0:	1000                	addi	s0,sp,32
    800031a2:	fea43423          	sd	a0,-24(s0)
    800031a6:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    800031aa:	4681                	li	a3,0
    800031ac:	4605                	li	a2,1
    800031ae:	040007b7          	lui	a5,0x4000
    800031b2:	17fd                	addi	a5,a5,-1
    800031b4:	00c79593          	slli	a1,a5,0xc
    800031b8:	fe843503          	ld	a0,-24(s0)
    800031bc:	fffff097          	auipc	ra,0xfffff
    800031c0:	1be080e7          	jalr	446(ra) # 8000237a <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    800031c4:	4681                	li	a3,0
    800031c6:	4605                	li	a2,1
    800031c8:	020007b7          	lui	a5,0x2000
    800031cc:	17fd                	addi	a5,a5,-1
    800031ce:	00d79593          	slli	a1,a5,0xd
    800031d2:	fe843503          	ld	a0,-24(s0)
    800031d6:	fffff097          	auipc	ra,0xfffff
    800031da:	1a4080e7          	jalr	420(ra) # 8000237a <uvmunmap>
  uvmfree(pagetable, sz);
    800031de:	fe043583          	ld	a1,-32(s0)
    800031e2:	fe843503          	ld	a0,-24(s0)
    800031e6:	fffff097          	auipc	ra,0xfffff
    800031ea:	59c080e7          	jalr	1436(ra) # 80002782 <uvmfree>
}
    800031ee:	0001                	nop
    800031f0:	60e2                	ld	ra,24(sp)
    800031f2:	6442                	ld	s0,16(sp)
    800031f4:	6105                	addi	sp,sp,32
    800031f6:	8082                	ret

00000000800031f8 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    800031f8:	1101                	addi	sp,sp,-32
    800031fa:	ec06                	sd	ra,24(sp)
    800031fc:	e822                	sd	s0,16(sp)
    800031fe:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80003200:	00000097          	auipc	ra,0x0
    80003204:	d12080e7          	jalr	-750(ra) # 80002f12 <allocproc>
    80003208:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    8000320c:	00009797          	auipc	a5,0x9
    80003210:	73478793          	addi	a5,a5,1844 # 8000c940 <initproc>
    80003214:	fe843703          	ld	a4,-24(s0)
    80003218:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    8000321a:	fe843783          	ld	a5,-24(s0)
    8000321e:	6bbc                	ld	a5,80(a5)
    80003220:	03400613          	li	a2,52
    80003224:	00009597          	auipc	a1,0x9
    80003228:	5c458593          	addi	a1,a1,1476 # 8000c7e8 <initcode>
    8000322c:	853e                	mv	a0,a5
    8000322e:	fffff097          	auipc	ra,0xfffff
    80003232:	294080e7          	jalr	660(ra) # 800024c2 <uvmfirst>
  p->sz = PGSIZE;
    80003236:	fe843783          	ld	a5,-24(s0)
    8000323a:	6705                	lui	a4,0x1
    8000323c:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    8000323e:	fe843783          	ld	a5,-24(s0)
    80003242:	6fbc                	ld	a5,88(a5)
    80003244:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80003248:	fe843783          	ld	a5,-24(s0)
    8000324c:	6fbc                	ld	a5,88(a5)
    8000324e:	6705                	lui	a4,0x1
    80003250:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80003252:	fe843783          	ld	a5,-24(s0)
    80003256:	15878793          	addi	a5,a5,344
    8000325a:	4641                	li	a2,16
    8000325c:	00009597          	auipc	a1,0x9
    80003260:	fa458593          	addi	a1,a1,-92 # 8000c200 <etext+0x200>
    80003264:	853e                	mv	a0,a5
    80003266:	ffffe097          	auipc	ra,0xffffe
    8000326a:	5da080e7          	jalr	1498(ra) # 80001840 <safestrcpy>
  p->cwd = namei("/");
    8000326e:	00009517          	auipc	a0,0x9
    80003272:	fa250513          	addi	a0,a0,-94 # 8000c210 <etext+0x210>
    80003276:	00003097          	auipc	ra,0x3
    8000327a:	1c8080e7          	jalr	456(ra) # 8000643e <namei>
    8000327e:	872a                	mv	a4,a0
    80003280:	fe843783          	ld	a5,-24(s0)
    80003284:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80003288:	fe843783          	ld	a5,-24(s0)
    8000328c:	470d                	li	a4,3
    8000328e:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80003290:	fe843783          	ld	a5,-24(s0)
    80003294:	853e                	mv	a0,a5
    80003296:	ffffe097          	auipc	ra,0xffffe
    8000329a:	136080e7          	jalr	310(ra) # 800013cc <release>
}
    8000329e:	0001                	nop
    800032a0:	60e2                	ld	ra,24(sp)
    800032a2:	6442                	ld	s0,16(sp)
    800032a4:	6105                	addi	sp,sp,32
    800032a6:	8082                	ret

00000000800032a8 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    800032a8:	7179                	addi	sp,sp,-48
    800032aa:	f406                	sd	ra,40(sp)
    800032ac:	f022                	sd	s0,32(sp)
    800032ae:	1800                	addi	s0,sp,48
    800032b0:	87aa                	mv	a5,a0
    800032b2:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    800032b6:	00000097          	auipc	ra,0x0
    800032ba:	bc2080e7          	jalr	-1086(ra) # 80002e78 <myproc>
    800032be:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    800032c2:	fe043783          	ld	a5,-32(s0)
    800032c6:	67bc                	ld	a5,72(a5)
    800032c8:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    800032cc:	fdc42783          	lw	a5,-36(s0)
    800032d0:	2781                	sext.w	a5,a5
    800032d2:	02f05963          	blez	a5,80003304 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    800032d6:	fe043783          	ld	a5,-32(s0)
    800032da:	6ba8                	ld	a0,80(a5)
    800032dc:	fdc42703          	lw	a4,-36(s0)
    800032e0:	fe843783          	ld	a5,-24(s0)
    800032e4:	97ba                	add	a5,a5,a4
    800032e6:	4691                	li	a3,4
    800032e8:	863e                	mv	a2,a5
    800032ea:	fe843583          	ld	a1,-24(s0)
    800032ee:	fffff097          	auipc	ra,0xfffff
    800032f2:	25c080e7          	jalr	604(ra) # 8000254a <uvmalloc>
    800032f6:	fea43423          	sd	a0,-24(s0)
    800032fa:	fe843783          	ld	a5,-24(s0)
    800032fe:	eb95                	bnez	a5,80003332 <growproc+0x8a>
      return -1;
    80003300:	57fd                	li	a5,-1
    80003302:	a835                	j	8000333e <growproc+0x96>
    }
  } else if(n < 0){
    80003304:	fdc42783          	lw	a5,-36(s0)
    80003308:	2781                	sext.w	a5,a5
    8000330a:	0207d463          	bgez	a5,80003332 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    8000330e:	fe043783          	ld	a5,-32(s0)
    80003312:	6bb4                	ld	a3,80(a5)
    80003314:	fdc42703          	lw	a4,-36(s0)
    80003318:	fe843783          	ld	a5,-24(s0)
    8000331c:	97ba                	add	a5,a5,a4
    8000331e:	863e                	mv	a2,a5
    80003320:	fe843583          	ld	a1,-24(s0)
    80003324:	8536                	mv	a0,a3
    80003326:	fffff097          	auipc	ra,0xfffff
    8000332a:	316080e7          	jalr	790(ra) # 8000263c <uvmdealloc>
    8000332e:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80003332:	fe043783          	ld	a5,-32(s0)
    80003336:	fe843703          	ld	a4,-24(s0)
    8000333a:	e7b8                	sd	a4,72(a5)
  return 0;
    8000333c:	4781                	li	a5,0
}
    8000333e:	853e                	mv	a0,a5
    80003340:	70a2                	ld	ra,40(sp)
    80003342:	7402                	ld	s0,32(sp)
    80003344:	6145                	addi	sp,sp,48
    80003346:	8082                	ret

0000000080003348 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80003348:	7179                	addi	sp,sp,-48
    8000334a:	f406                	sd	ra,40(sp)
    8000334c:	f022                	sd	s0,32(sp)
    8000334e:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80003350:	00000097          	auipc	ra,0x0
    80003354:	b28080e7          	jalr	-1240(ra) # 80002e78 <myproc>
    80003358:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    8000335c:	00000097          	auipc	ra,0x0
    80003360:	bb6080e7          	jalr	-1098(ra) # 80002f12 <allocproc>
    80003364:	fca43c23          	sd	a0,-40(s0)
    80003368:	fd843783          	ld	a5,-40(s0)
    8000336c:	e399                	bnez	a5,80003372 <fork+0x2a>
    return -1;
    8000336e:	57fd                	li	a5,-1
    80003370:	aab5                	j	800034ec <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80003372:	fe043783          	ld	a5,-32(s0)
    80003376:	6bb8                	ld	a4,80(a5)
    80003378:	fd843783          	ld	a5,-40(s0)
    8000337c:	6bb4                	ld	a3,80(a5)
    8000337e:	fe043783          	ld	a5,-32(s0)
    80003382:	67bc                	ld	a5,72(a5)
    80003384:	863e                	mv	a2,a5
    80003386:	85b6                	mv	a1,a3
    80003388:	853a                	mv	a0,a4
    8000338a:	fffff097          	auipc	ra,0xfffff
    8000338e:	442080e7          	jalr	1090(ra) # 800027cc <uvmcopy>
    80003392:	87aa                	mv	a5,a0
    80003394:	0207d163          	bgez	a5,800033b6 <fork+0x6e>
    freeproc(np);
    80003398:	fd843503          	ld	a0,-40(s0)
    8000339c:	00000097          	auipc	ra,0x0
    800033a0:	ca0080e7          	jalr	-864(ra) # 8000303c <freeproc>
    release(&np->lock);
    800033a4:	fd843783          	ld	a5,-40(s0)
    800033a8:	853e                	mv	a0,a5
    800033aa:	ffffe097          	auipc	ra,0xffffe
    800033ae:	022080e7          	jalr	34(ra) # 800013cc <release>
    return -1;
    800033b2:	57fd                	li	a5,-1
    800033b4:	aa25                	j	800034ec <fork+0x1a4>
  }
  np->sz = p->sz;
    800033b6:	fe043783          	ld	a5,-32(s0)
    800033ba:	67b8                	ld	a4,72(a5)
    800033bc:	fd843783          	ld	a5,-40(s0)
    800033c0:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    800033c2:	fe043783          	ld	a5,-32(s0)
    800033c6:	6fb8                	ld	a4,88(a5)
    800033c8:	fd843783          	ld	a5,-40(s0)
    800033cc:	6fbc                	ld	a5,88(a5)
    800033ce:	86be                	mv	a3,a5
    800033d0:	12000793          	li	a5,288
    800033d4:	863e                	mv	a2,a5
    800033d6:	85ba                	mv	a1,a4
    800033d8:	8536                	mv	a0,a3
    800033da:	ffffe097          	auipc	ra,0xffffe
    800033de:	322080e7          	jalr	802(ra) # 800016fc <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    800033e2:	fd843783          	ld	a5,-40(s0)
    800033e6:	6fbc                	ld	a5,88(a5)
    800033e8:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    800033ec:	fe042623          	sw	zero,-20(s0)
    800033f0:	a0a9                	j	8000343a <fork+0xf2>
    if(p->ofile[i])
    800033f2:	fe043703          	ld	a4,-32(s0)
    800033f6:	fec42783          	lw	a5,-20(s0)
    800033fa:	07e9                	addi	a5,a5,26
    800033fc:	078e                	slli	a5,a5,0x3
    800033fe:	97ba                	add	a5,a5,a4
    80003400:	639c                	ld	a5,0(a5)
    80003402:	c79d                	beqz	a5,80003430 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80003404:	fe043703          	ld	a4,-32(s0)
    80003408:	fec42783          	lw	a5,-20(s0)
    8000340c:	07e9                	addi	a5,a5,26
    8000340e:	078e                	slli	a5,a5,0x3
    80003410:	97ba                	add	a5,a5,a4
    80003412:	639c                	ld	a5,0(a5)
    80003414:	853e                	mv	a0,a5
    80003416:	00004097          	auipc	ra,0x4
    8000341a:	9c0080e7          	jalr	-1600(ra) # 80006dd6 <filedup>
    8000341e:	86aa                	mv	a3,a0
    80003420:	fd843703          	ld	a4,-40(s0)
    80003424:	fec42783          	lw	a5,-20(s0)
    80003428:	07e9                	addi	a5,a5,26
    8000342a:	078e                	slli	a5,a5,0x3
    8000342c:	97ba                	add	a5,a5,a4
    8000342e:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80003430:	fec42783          	lw	a5,-20(s0)
    80003434:	2785                	addiw	a5,a5,1
    80003436:	fef42623          	sw	a5,-20(s0)
    8000343a:	fec42783          	lw	a5,-20(s0)
    8000343e:	0007871b          	sext.w	a4,a5
    80003442:	47bd                	li	a5,15
    80003444:	fae7d7e3          	bge	a5,a4,800033f2 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80003448:	fe043783          	ld	a5,-32(s0)
    8000344c:	1507b783          	ld	a5,336(a5)
    80003450:	853e                	mv	a0,a5
    80003452:	00002097          	auipc	ra,0x2
    80003456:	27a080e7          	jalr	634(ra) # 800056cc <idup>
    8000345a:	872a                	mv	a4,a0
    8000345c:	fd843783          	ld	a5,-40(s0)
    80003460:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80003464:	fd843783          	ld	a5,-40(s0)
    80003468:	15878713          	addi	a4,a5,344
    8000346c:	fe043783          	ld	a5,-32(s0)
    80003470:	15878793          	addi	a5,a5,344
    80003474:	4641                	li	a2,16
    80003476:	85be                	mv	a1,a5
    80003478:	853a                	mv	a0,a4
    8000347a:	ffffe097          	auipc	ra,0xffffe
    8000347e:	3c6080e7          	jalr	966(ra) # 80001840 <safestrcpy>

  pid = np->pid;
    80003482:	fd843783          	ld	a5,-40(s0)
    80003486:	5b9c                	lw	a5,48(a5)
    80003488:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    8000348c:	fd843783          	ld	a5,-40(s0)
    80003490:	853e                	mv	a0,a5
    80003492:	ffffe097          	auipc	ra,0xffffe
    80003496:	f3a080e7          	jalr	-198(ra) # 800013cc <release>

  acquire(&wait_lock);
    8000349a:	0002f517          	auipc	a0,0x2f
    8000349e:	53650513          	addi	a0,a0,1334 # 800329d0 <wait_lock>
    800034a2:	ffffe097          	auipc	ra,0xffffe
    800034a6:	ec6080e7          	jalr	-314(ra) # 80001368 <acquire>
  np->parent = p;
    800034aa:	fd843783          	ld	a5,-40(s0)
    800034ae:	fe043703          	ld	a4,-32(s0)
    800034b2:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    800034b4:	0002f517          	auipc	a0,0x2f
    800034b8:	51c50513          	addi	a0,a0,1308 # 800329d0 <wait_lock>
    800034bc:	ffffe097          	auipc	ra,0xffffe
    800034c0:	f10080e7          	jalr	-240(ra) # 800013cc <release>

  acquire(&np->lock);
    800034c4:	fd843783          	ld	a5,-40(s0)
    800034c8:	853e                	mv	a0,a5
    800034ca:	ffffe097          	auipc	ra,0xffffe
    800034ce:	e9e080e7          	jalr	-354(ra) # 80001368 <acquire>
  np->state = RUNNABLE;
    800034d2:	fd843783          	ld	a5,-40(s0)
    800034d6:	470d                	li	a4,3
    800034d8:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    800034da:	fd843783          	ld	a5,-40(s0)
    800034de:	853e                	mv	a0,a5
    800034e0:	ffffe097          	auipc	ra,0xffffe
    800034e4:	eec080e7          	jalr	-276(ra) # 800013cc <release>

  return pid;
    800034e8:	fd442783          	lw	a5,-44(s0)
}
    800034ec:	853e                	mv	a0,a5
    800034ee:	70a2                	ld	ra,40(sp)
    800034f0:	7402                	ld	s0,32(sp)
    800034f2:	6145                	addi	sp,sp,48
    800034f4:	8082                	ret

00000000800034f6 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    800034f6:	7179                	addi	sp,sp,-48
    800034f8:	f406                	sd	ra,40(sp)
    800034fa:	f022                	sd	s0,32(sp)
    800034fc:	1800                	addi	s0,sp,48
    800034fe:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003502:	0002a797          	auipc	a5,0x2a
    80003506:	ab678793          	addi	a5,a5,-1354 # 8002cfb8 <proc>
    8000350a:	fef43423          	sd	a5,-24(s0)
    8000350e:	a081                	j	8000354e <reparent+0x58>
    if(pp->parent == p){
    80003510:	fe843783          	ld	a5,-24(s0)
    80003514:	7f9c                	ld	a5,56(a5)
    80003516:	fd843703          	ld	a4,-40(s0)
    8000351a:	02f71463          	bne	a4,a5,80003542 <reparent+0x4c>
      pp->parent = initproc;
    8000351e:	00009797          	auipc	a5,0x9
    80003522:	42278793          	addi	a5,a5,1058 # 8000c940 <initproc>
    80003526:	6398                	ld	a4,0(a5)
    80003528:	fe843783          	ld	a5,-24(s0)
    8000352c:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    8000352e:	00009797          	auipc	a5,0x9
    80003532:	41278793          	addi	a5,a5,1042 # 8000c940 <initproc>
    80003536:	639c                	ld	a5,0(a5)
    80003538:	853e                	mv	a0,a5
    8000353a:	00000097          	auipc	ra,0x0
    8000353e:	57c080e7          	jalr	1404(ra) # 80003ab6 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003542:	fe843783          	ld	a5,-24(s0)
    80003546:	16878793          	addi	a5,a5,360
    8000354a:	fef43423          	sd	a5,-24(s0)
    8000354e:	fe843703          	ld	a4,-24(s0)
    80003552:	0002f797          	auipc	a5,0x2f
    80003556:	46678793          	addi	a5,a5,1126 # 800329b8 <pid_lock>
    8000355a:	faf76be3          	bltu	a4,a5,80003510 <reparent+0x1a>
    }
  }
}
    8000355e:	0001                	nop
    80003560:	0001                	nop
    80003562:	70a2                	ld	ra,40(sp)
    80003564:	7402                	ld	s0,32(sp)
    80003566:	6145                	addi	sp,sp,48
    80003568:	8082                	ret

000000008000356a <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    8000356a:	7139                	addi	sp,sp,-64
    8000356c:	fc06                	sd	ra,56(sp)
    8000356e:	f822                	sd	s0,48(sp)
    80003570:	0080                	addi	s0,sp,64
    80003572:	87aa                	mv	a5,a0
    80003574:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003578:	00000097          	auipc	ra,0x0
    8000357c:	900080e7          	jalr	-1792(ra) # 80002e78 <myproc>
    80003580:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80003584:	00009797          	auipc	a5,0x9
    80003588:	3bc78793          	addi	a5,a5,956 # 8000c940 <initproc>
    8000358c:	639c                	ld	a5,0(a5)
    8000358e:	fe043703          	ld	a4,-32(s0)
    80003592:	00f71a63          	bne	a4,a5,800035a6 <exit+0x3c>
    panic("init exiting");
    80003596:	00009517          	auipc	a0,0x9
    8000359a:	c8250513          	addi	a0,a0,-894 # 8000c218 <etext+0x218>
    8000359e:	ffffd097          	auipc	ra,0xffffd
    800035a2:	6ee080e7          	jalr	1774(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    800035a6:	fe042623          	sw	zero,-20(s0)
    800035aa:	a881                	j	800035fa <exit+0x90>
    if(p->ofile[fd]){
    800035ac:	fe043703          	ld	a4,-32(s0)
    800035b0:	fec42783          	lw	a5,-20(s0)
    800035b4:	07e9                	addi	a5,a5,26
    800035b6:	078e                	slli	a5,a5,0x3
    800035b8:	97ba                	add	a5,a5,a4
    800035ba:	639c                	ld	a5,0(a5)
    800035bc:	cb95                	beqz	a5,800035f0 <exit+0x86>
      struct file *f = p->ofile[fd];
    800035be:	fe043703          	ld	a4,-32(s0)
    800035c2:	fec42783          	lw	a5,-20(s0)
    800035c6:	07e9                	addi	a5,a5,26
    800035c8:	078e                	slli	a5,a5,0x3
    800035ca:	97ba                	add	a5,a5,a4
    800035cc:	639c                	ld	a5,0(a5)
    800035ce:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    800035d2:	fd843503          	ld	a0,-40(s0)
    800035d6:	00004097          	auipc	ra,0x4
    800035da:	866080e7          	jalr	-1946(ra) # 80006e3c <fileclose>
      p->ofile[fd] = 0;
    800035de:	fe043703          	ld	a4,-32(s0)
    800035e2:	fec42783          	lw	a5,-20(s0)
    800035e6:	07e9                	addi	a5,a5,26
    800035e8:	078e                	slli	a5,a5,0x3
    800035ea:	97ba                	add	a5,a5,a4
    800035ec:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    800035f0:	fec42783          	lw	a5,-20(s0)
    800035f4:	2785                	addiw	a5,a5,1
    800035f6:	fef42623          	sw	a5,-20(s0)
    800035fa:	fec42783          	lw	a5,-20(s0)
    800035fe:	0007871b          	sext.w	a4,a5
    80003602:	47bd                	li	a5,15
    80003604:	fae7d4e3          	bge	a5,a4,800035ac <exit+0x42>
    }
  }

  begin_op();
    80003608:	00003097          	auipc	ra,0x3
    8000360c:	19a080e7          	jalr	410(ra) # 800067a2 <begin_op>
  iput(p->cwd);
    80003610:	fe043783          	ld	a5,-32(s0)
    80003614:	1507b783          	ld	a5,336(a5)
    80003618:	853e                	mv	a0,a5
    8000361a:	00002097          	auipc	ra,0x2
    8000361e:	28c080e7          	jalr	652(ra) # 800058a6 <iput>
  end_op();
    80003622:	00003097          	auipc	ra,0x3
    80003626:	242080e7          	jalr	578(ra) # 80006864 <end_op>
  p->cwd = 0;
    8000362a:	fe043783          	ld	a5,-32(s0)
    8000362e:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80003632:	0002f517          	auipc	a0,0x2f
    80003636:	39e50513          	addi	a0,a0,926 # 800329d0 <wait_lock>
    8000363a:	ffffe097          	auipc	ra,0xffffe
    8000363e:	d2e080e7          	jalr	-722(ra) # 80001368 <acquire>

  // Give any children to init.
  reparent(p);
    80003642:	fe043503          	ld	a0,-32(s0)
    80003646:	00000097          	auipc	ra,0x0
    8000364a:	eb0080e7          	jalr	-336(ra) # 800034f6 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    8000364e:	fe043783          	ld	a5,-32(s0)
    80003652:	7f9c                	ld	a5,56(a5)
    80003654:	853e                	mv	a0,a5
    80003656:	00000097          	auipc	ra,0x0
    8000365a:	460080e7          	jalr	1120(ra) # 80003ab6 <wakeup>
  
  acquire(&p->lock);
    8000365e:	fe043783          	ld	a5,-32(s0)
    80003662:	853e                	mv	a0,a5
    80003664:	ffffe097          	auipc	ra,0xffffe
    80003668:	d04080e7          	jalr	-764(ra) # 80001368 <acquire>

  p->xstate = status;
    8000366c:	fe043783          	ld	a5,-32(s0)
    80003670:	fcc42703          	lw	a4,-52(s0)
    80003674:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003676:	fe043783          	ld	a5,-32(s0)
    8000367a:	4715                	li	a4,5
    8000367c:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    8000367e:	0002f517          	auipc	a0,0x2f
    80003682:	35250513          	addi	a0,a0,850 # 800329d0 <wait_lock>
    80003686:	ffffe097          	auipc	ra,0xffffe
    8000368a:	d46080e7          	jalr	-698(ra) # 800013cc <release>

  // Jump into the scheduler, never to return.
  sched();
    8000368e:	00000097          	auipc	ra,0x0
    80003692:	230080e7          	jalr	560(ra) # 800038be <sched>
  panic("zombie exit");
    80003696:	00009517          	auipc	a0,0x9
    8000369a:	b9250513          	addi	a0,a0,-1134 # 8000c228 <etext+0x228>
    8000369e:	ffffd097          	auipc	ra,0xffffd
    800036a2:	5ee080e7          	jalr	1518(ra) # 80000c8c <panic>

00000000800036a6 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800036a6:	7139                	addi	sp,sp,-64
    800036a8:	fc06                	sd	ra,56(sp)
    800036aa:	f822                	sd	s0,48(sp)
    800036ac:	0080                	addi	s0,sp,64
    800036ae:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    800036b2:	fffff097          	auipc	ra,0xfffff
    800036b6:	7c6080e7          	jalr	1990(ra) # 80002e78 <myproc>
    800036ba:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    800036be:	0002f517          	auipc	a0,0x2f
    800036c2:	31250513          	addi	a0,a0,786 # 800329d0 <wait_lock>
    800036c6:	ffffe097          	auipc	ra,0xffffe
    800036ca:	ca2080e7          	jalr	-862(ra) # 80001368 <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800036ce:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800036d2:	0002a797          	auipc	a5,0x2a
    800036d6:	8e678793          	addi	a5,a5,-1818 # 8002cfb8 <proc>
    800036da:	fef43423          	sd	a5,-24(s0)
    800036de:	a8d1                	j	800037b2 <wait+0x10c>
      if(pp->parent == p){
    800036e0:	fe843783          	ld	a5,-24(s0)
    800036e4:	7f9c                	ld	a5,56(a5)
    800036e6:	fd843703          	ld	a4,-40(s0)
    800036ea:	0af71e63          	bne	a4,a5,800037a6 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    800036ee:	fe843783          	ld	a5,-24(s0)
    800036f2:	853e                	mv	a0,a5
    800036f4:	ffffe097          	auipc	ra,0xffffe
    800036f8:	c74080e7          	jalr	-908(ra) # 80001368 <acquire>

        havekids = 1;
    800036fc:	4785                	li	a5,1
    800036fe:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    80003702:	fe843783          	ld	a5,-24(s0)
    80003706:	4f9c                	lw	a5,24(a5)
    80003708:	873e                	mv	a4,a5
    8000370a:	4795                	li	a5,5
    8000370c:	08f71663          	bne	a4,a5,80003798 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    80003710:	fe843783          	ld	a5,-24(s0)
    80003714:	5b9c                	lw	a5,48(a5)
    80003716:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    8000371a:	fc843783          	ld	a5,-56(s0)
    8000371e:	c7a9                	beqz	a5,80003768 <wait+0xc2>
    80003720:	fd843783          	ld	a5,-40(s0)
    80003724:	6bb8                	ld	a4,80(a5)
    80003726:	fe843783          	ld	a5,-24(s0)
    8000372a:	02c78793          	addi	a5,a5,44
    8000372e:	4691                	li	a3,4
    80003730:	863e                	mv	a2,a5
    80003732:	fc843583          	ld	a1,-56(s0)
    80003736:	853a                	mv	a0,a4
    80003738:	fffff097          	auipc	ra,0xfffff
    8000373c:	20a080e7          	jalr	522(ra) # 80002942 <copyout>
    80003740:	87aa                	mv	a5,a0
    80003742:	0207d363          	bgez	a5,80003768 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    80003746:	fe843783          	ld	a5,-24(s0)
    8000374a:	853e                	mv	a0,a5
    8000374c:	ffffe097          	auipc	ra,0xffffe
    80003750:	c80080e7          	jalr	-896(ra) # 800013cc <release>
            release(&wait_lock);
    80003754:	0002f517          	auipc	a0,0x2f
    80003758:	27c50513          	addi	a0,a0,636 # 800329d0 <wait_lock>
    8000375c:	ffffe097          	auipc	ra,0xffffe
    80003760:	c70080e7          	jalr	-912(ra) # 800013cc <release>
            return -1;
    80003764:	57fd                	li	a5,-1
    80003766:	a879                	j	80003804 <wait+0x15e>
          }
          freeproc(pp);
    80003768:	fe843503          	ld	a0,-24(s0)
    8000376c:	00000097          	auipc	ra,0x0
    80003770:	8d0080e7          	jalr	-1840(ra) # 8000303c <freeproc>
          release(&pp->lock);
    80003774:	fe843783          	ld	a5,-24(s0)
    80003778:	853e                	mv	a0,a5
    8000377a:	ffffe097          	auipc	ra,0xffffe
    8000377e:	c52080e7          	jalr	-942(ra) # 800013cc <release>
          release(&wait_lock);
    80003782:	0002f517          	auipc	a0,0x2f
    80003786:	24e50513          	addi	a0,a0,590 # 800329d0 <wait_lock>
    8000378a:	ffffe097          	auipc	ra,0xffffe
    8000378e:	c42080e7          	jalr	-958(ra) # 800013cc <release>
          return pid;
    80003792:	fd442783          	lw	a5,-44(s0)
    80003796:	a0bd                	j	80003804 <wait+0x15e>
        }
        release(&pp->lock);
    80003798:	fe843783          	ld	a5,-24(s0)
    8000379c:	853e                	mv	a0,a5
    8000379e:	ffffe097          	auipc	ra,0xffffe
    800037a2:	c2e080e7          	jalr	-978(ra) # 800013cc <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800037a6:	fe843783          	ld	a5,-24(s0)
    800037aa:	16878793          	addi	a5,a5,360
    800037ae:	fef43423          	sd	a5,-24(s0)
    800037b2:	fe843703          	ld	a4,-24(s0)
    800037b6:	0002f797          	auipc	a5,0x2f
    800037ba:	20278793          	addi	a5,a5,514 # 800329b8 <pid_lock>
    800037be:	f2f761e3          	bltu	a4,a5,800036e0 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    800037c2:	fe442783          	lw	a5,-28(s0)
    800037c6:	2781                	sext.w	a5,a5
    800037c8:	cb89                	beqz	a5,800037da <wait+0x134>
    800037ca:	fd843503          	ld	a0,-40(s0)
    800037ce:	00000097          	auipc	ra,0x0
    800037d2:	47a080e7          	jalr	1146(ra) # 80003c48 <killed>
    800037d6:	87aa                	mv	a5,a0
    800037d8:	cb99                	beqz	a5,800037ee <wait+0x148>
      release(&wait_lock);
    800037da:	0002f517          	auipc	a0,0x2f
    800037de:	1f650513          	addi	a0,a0,502 # 800329d0 <wait_lock>
    800037e2:	ffffe097          	auipc	ra,0xffffe
    800037e6:	bea080e7          	jalr	-1046(ra) # 800013cc <release>
      return -1;
    800037ea:	57fd                	li	a5,-1
    800037ec:	a821                	j	80003804 <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800037ee:	0002f597          	auipc	a1,0x2f
    800037f2:	1e258593          	addi	a1,a1,482 # 800329d0 <wait_lock>
    800037f6:	fd843503          	ld	a0,-40(s0)
    800037fa:	00000097          	auipc	ra,0x0
    800037fe:	240080e7          	jalr	576(ra) # 80003a3a <sleep>
    havekids = 0;
    80003802:	b5f1                	j	800036ce <wait+0x28>
  }
}
    80003804:	853e                	mv	a0,a5
    80003806:	70e2                	ld	ra,56(sp)
    80003808:	7442                	ld	s0,48(sp)
    8000380a:	6121                	addi	sp,sp,64
    8000380c:	8082                	ret

000000008000380e <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    8000380e:	1101                	addi	sp,sp,-32
    80003810:	ec06                	sd	ra,24(sp)
    80003812:	e822                	sd	s0,16(sp)
    80003814:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003816:	fffff097          	auipc	ra,0xfffff
    8000381a:	628080e7          	jalr	1576(ra) # 80002e3e <mycpu>
    8000381e:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    80003822:	fe043783          	ld	a5,-32(s0)
    80003826:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    8000382a:	fffff097          	auipc	ra,0xfffff
    8000382e:	3f6080e7          	jalr	1014(ra) # 80002c20 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    80003832:	00029797          	auipc	a5,0x29
    80003836:	78678793          	addi	a5,a5,1926 # 8002cfb8 <proc>
    8000383a:	fef43423          	sd	a5,-24(s0)
    8000383e:	a0bd                	j	800038ac <scheduler+0x9e>
      acquire(&p->lock);
    80003840:	fe843783          	ld	a5,-24(s0)
    80003844:	853e                	mv	a0,a5
    80003846:	ffffe097          	auipc	ra,0xffffe
    8000384a:	b22080e7          	jalr	-1246(ra) # 80001368 <acquire>
      if(p->state == RUNNABLE) {
    8000384e:	fe843783          	ld	a5,-24(s0)
    80003852:	4f9c                	lw	a5,24(a5)
    80003854:	873e                	mv	a4,a5
    80003856:	478d                	li	a5,3
    80003858:	02f71d63          	bne	a4,a5,80003892 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    8000385c:	fe843783          	ld	a5,-24(s0)
    80003860:	4711                	li	a4,4
    80003862:	cf98                	sw	a4,24(a5)
        c->proc = p;
    80003864:	fe043783          	ld	a5,-32(s0)
    80003868:	fe843703          	ld	a4,-24(s0)
    8000386c:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    8000386e:	fe043783          	ld	a5,-32(s0)
    80003872:	00878713          	addi	a4,a5,8
    80003876:	fe843783          	ld	a5,-24(s0)
    8000387a:	06078793          	addi	a5,a5,96
    8000387e:	85be                	mv	a1,a5
    80003880:	853a                	mv	a0,a4
    80003882:	00000097          	auipc	ra,0x0
    80003886:	5d0080e7          	jalr	1488(ra) # 80003e52 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    8000388a:	fe043783          	ld	a5,-32(s0)
    8000388e:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    80003892:	fe843783          	ld	a5,-24(s0)
    80003896:	853e                	mv	a0,a5
    80003898:	ffffe097          	auipc	ra,0xffffe
    8000389c:	b34080e7          	jalr	-1228(ra) # 800013cc <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    800038a0:	fe843783          	ld	a5,-24(s0)
    800038a4:	16878793          	addi	a5,a5,360
    800038a8:	fef43423          	sd	a5,-24(s0)
    800038ac:	fe843703          	ld	a4,-24(s0)
    800038b0:	0002f797          	auipc	a5,0x2f
    800038b4:	10878793          	addi	a5,a5,264 # 800329b8 <pid_lock>
    800038b8:	f8f764e3          	bltu	a4,a5,80003840 <scheduler+0x32>
    intr_on();
    800038bc:	b7bd                	j	8000382a <scheduler+0x1c>

00000000800038be <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800038be:	7179                	addi	sp,sp,-48
    800038c0:	f406                	sd	ra,40(sp)
    800038c2:	f022                	sd	s0,32(sp)
    800038c4:	ec26                	sd	s1,24(sp)
    800038c6:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800038c8:	fffff097          	auipc	ra,0xfffff
    800038cc:	5b0080e7          	jalr	1456(ra) # 80002e78 <myproc>
    800038d0:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800038d4:	fd843783          	ld	a5,-40(s0)
    800038d8:	853e                	mv	a0,a5
    800038da:	ffffe097          	auipc	ra,0xffffe
    800038de:	b48080e7          	jalr	-1208(ra) # 80001422 <holding>
    800038e2:	87aa                	mv	a5,a0
    800038e4:	eb89                	bnez	a5,800038f6 <sched+0x38>
    panic("sched p->lock");
    800038e6:	00009517          	auipc	a0,0x9
    800038ea:	95250513          	addi	a0,a0,-1710 # 8000c238 <etext+0x238>
    800038ee:	ffffd097          	auipc	ra,0xffffd
    800038f2:	39e080e7          	jalr	926(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    800038f6:	fffff097          	auipc	ra,0xfffff
    800038fa:	548080e7          	jalr	1352(ra) # 80002e3e <mycpu>
    800038fe:	87aa                	mv	a5,a0
    80003900:	5fbc                	lw	a5,120(a5)
    80003902:	873e                	mv	a4,a5
    80003904:	4785                	li	a5,1
    80003906:	00f70a63          	beq	a4,a5,8000391a <sched+0x5c>
    panic("sched locks");
    8000390a:	00009517          	auipc	a0,0x9
    8000390e:	93e50513          	addi	a0,a0,-1730 # 8000c248 <etext+0x248>
    80003912:	ffffd097          	auipc	ra,0xffffd
    80003916:	37a080e7          	jalr	890(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    8000391a:	fd843783          	ld	a5,-40(s0)
    8000391e:	4f9c                	lw	a5,24(a5)
    80003920:	873e                	mv	a4,a5
    80003922:	4791                	li	a5,4
    80003924:	00f71a63          	bne	a4,a5,80003938 <sched+0x7a>
    panic("sched running");
    80003928:	00009517          	auipc	a0,0x9
    8000392c:	93050513          	addi	a0,a0,-1744 # 8000c258 <etext+0x258>
    80003930:	ffffd097          	auipc	ra,0xffffd
    80003934:	35c080e7          	jalr	860(ra) # 80000c8c <panic>
  if(intr_get())
    80003938:	fffff097          	auipc	ra,0xfffff
    8000393c:	312080e7          	jalr	786(ra) # 80002c4a <intr_get>
    80003940:	87aa                	mv	a5,a0
    80003942:	cb89                	beqz	a5,80003954 <sched+0x96>
    panic("sched interruptible");
    80003944:	00009517          	auipc	a0,0x9
    80003948:	92450513          	addi	a0,a0,-1756 # 8000c268 <etext+0x268>
    8000394c:	ffffd097          	auipc	ra,0xffffd
    80003950:	340080e7          	jalr	832(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    80003954:	fffff097          	auipc	ra,0xfffff
    80003958:	4ea080e7          	jalr	1258(ra) # 80002e3e <mycpu>
    8000395c:	87aa                	mv	a5,a0
    8000395e:	5ffc                	lw	a5,124(a5)
    80003960:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003964:	fd843783          	ld	a5,-40(s0)
    80003968:	06078493          	addi	s1,a5,96
    8000396c:	fffff097          	auipc	ra,0xfffff
    80003970:	4d2080e7          	jalr	1234(ra) # 80002e3e <mycpu>
    80003974:	87aa                	mv	a5,a0
    80003976:	07a1                	addi	a5,a5,8
    80003978:	85be                	mv	a1,a5
    8000397a:	8526                	mv	a0,s1
    8000397c:	00000097          	auipc	ra,0x0
    80003980:	4d6080e7          	jalr	1238(ra) # 80003e52 <swtch>
  mycpu()->intena = intena;
    80003984:	fffff097          	auipc	ra,0xfffff
    80003988:	4ba080e7          	jalr	1210(ra) # 80002e3e <mycpu>
    8000398c:	872a                	mv	a4,a0
    8000398e:	fd442783          	lw	a5,-44(s0)
    80003992:	df7c                	sw	a5,124(a4)
}
    80003994:	0001                	nop
    80003996:	70a2                	ld	ra,40(sp)
    80003998:	7402                	ld	s0,32(sp)
    8000399a:	64e2                	ld	s1,24(sp)
    8000399c:	6145                	addi	sp,sp,48
    8000399e:	8082                	ret

00000000800039a0 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800039a0:	1101                	addi	sp,sp,-32
    800039a2:	ec06                	sd	ra,24(sp)
    800039a4:	e822                	sd	s0,16(sp)
    800039a6:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800039a8:	fffff097          	auipc	ra,0xfffff
    800039ac:	4d0080e7          	jalr	1232(ra) # 80002e78 <myproc>
    800039b0:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800039b4:	fe843783          	ld	a5,-24(s0)
    800039b8:	853e                	mv	a0,a5
    800039ba:	ffffe097          	auipc	ra,0xffffe
    800039be:	9ae080e7          	jalr	-1618(ra) # 80001368 <acquire>
  p->state = RUNNABLE;
    800039c2:	fe843783          	ld	a5,-24(s0)
    800039c6:	470d                	li	a4,3
    800039c8:	cf98                	sw	a4,24(a5)
  sched();
    800039ca:	00000097          	auipc	ra,0x0
    800039ce:	ef4080e7          	jalr	-268(ra) # 800038be <sched>
  release(&p->lock);
    800039d2:	fe843783          	ld	a5,-24(s0)
    800039d6:	853e                	mv	a0,a5
    800039d8:	ffffe097          	auipc	ra,0xffffe
    800039dc:	9f4080e7          	jalr	-1548(ra) # 800013cc <release>
}
    800039e0:	0001                	nop
    800039e2:	60e2                	ld	ra,24(sp)
    800039e4:	6442                	ld	s0,16(sp)
    800039e6:	6105                	addi	sp,sp,32
    800039e8:	8082                	ret

00000000800039ea <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800039ea:	1141                	addi	sp,sp,-16
    800039ec:	e406                	sd	ra,8(sp)
    800039ee:	e022                	sd	s0,0(sp)
    800039f0:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800039f2:	fffff097          	auipc	ra,0xfffff
    800039f6:	486080e7          	jalr	1158(ra) # 80002e78 <myproc>
    800039fa:	87aa                	mv	a5,a0
    800039fc:	853e                	mv	a0,a5
    800039fe:	ffffe097          	auipc	ra,0xffffe
    80003a02:	9ce080e7          	jalr	-1586(ra) # 800013cc <release>

  if (first) {
    80003a06:	00009797          	auipc	a5,0x9
    80003a0a:	dbe78793          	addi	a5,a5,-578 # 8000c7c4 <first.1699>
    80003a0e:	439c                	lw	a5,0(a5)
    80003a10:	cf81                	beqz	a5,80003a28 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003a12:	00009797          	auipc	a5,0x9
    80003a16:	db278793          	addi	a5,a5,-590 # 8000c7c4 <first.1699>
    80003a1a:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003a1e:	4505                	li	a0,1
    80003a20:	00001097          	auipc	ra,0x1
    80003a24:	582080e7          	jalr	1410(ra) # 80004fa2 <fsinit>
  }

  usertrapret();
    80003a28:	00001097          	auipc	ra,0x1
    80003a2c:	816080e7          	jalr	-2026(ra) # 8000423e <usertrapret>
}
    80003a30:	0001                	nop
    80003a32:	60a2                	ld	ra,8(sp)
    80003a34:	6402                	ld	s0,0(sp)
    80003a36:	0141                	addi	sp,sp,16
    80003a38:	8082                	ret

0000000080003a3a <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003a3a:	7179                	addi	sp,sp,-48
    80003a3c:	f406                	sd	ra,40(sp)
    80003a3e:	f022                	sd	s0,32(sp)
    80003a40:	1800                	addi	s0,sp,48
    80003a42:	fca43c23          	sd	a0,-40(s0)
    80003a46:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003a4a:	fffff097          	auipc	ra,0xfffff
    80003a4e:	42e080e7          	jalr	1070(ra) # 80002e78 <myproc>
    80003a52:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003a56:	fe843783          	ld	a5,-24(s0)
    80003a5a:	853e                	mv	a0,a5
    80003a5c:	ffffe097          	auipc	ra,0xffffe
    80003a60:	90c080e7          	jalr	-1780(ra) # 80001368 <acquire>
  release(lk);
    80003a64:	fd043503          	ld	a0,-48(s0)
    80003a68:	ffffe097          	auipc	ra,0xffffe
    80003a6c:	964080e7          	jalr	-1692(ra) # 800013cc <release>

  // Go to sleep.
  p->chan = chan;
    80003a70:	fe843783          	ld	a5,-24(s0)
    80003a74:	fd843703          	ld	a4,-40(s0)
    80003a78:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003a7a:	fe843783          	ld	a5,-24(s0)
    80003a7e:	4709                	li	a4,2
    80003a80:	cf98                	sw	a4,24(a5)

  sched();
    80003a82:	00000097          	auipc	ra,0x0
    80003a86:	e3c080e7          	jalr	-452(ra) # 800038be <sched>

  // Tidy up.
  p->chan = 0;
    80003a8a:	fe843783          	ld	a5,-24(s0)
    80003a8e:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    80003a92:	fe843783          	ld	a5,-24(s0)
    80003a96:	853e                	mv	a0,a5
    80003a98:	ffffe097          	auipc	ra,0xffffe
    80003a9c:	934080e7          	jalr	-1740(ra) # 800013cc <release>
  acquire(lk);
    80003aa0:	fd043503          	ld	a0,-48(s0)
    80003aa4:	ffffe097          	auipc	ra,0xffffe
    80003aa8:	8c4080e7          	jalr	-1852(ra) # 80001368 <acquire>
}
    80003aac:	0001                	nop
    80003aae:	70a2                	ld	ra,40(sp)
    80003ab0:	7402                	ld	s0,32(sp)
    80003ab2:	6145                	addi	sp,sp,48
    80003ab4:	8082                	ret

0000000080003ab6 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    80003ab6:	7179                	addi	sp,sp,-48
    80003ab8:	f406                	sd	ra,40(sp)
    80003aba:	f022                	sd	s0,32(sp)
    80003abc:	1800                	addi	s0,sp,48
    80003abe:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80003ac2:	00029797          	auipc	a5,0x29
    80003ac6:	4f678793          	addi	a5,a5,1270 # 8002cfb8 <proc>
    80003aca:	fef43423          	sd	a5,-24(s0)
    80003ace:	a051                	j	80003b52 <wakeup+0x9c>
    if(p != myproc()){
    80003ad0:	fffff097          	auipc	ra,0xfffff
    80003ad4:	3a8080e7          	jalr	936(ra) # 80002e78 <myproc>
    80003ad8:	872a                	mv	a4,a0
    80003ada:	fe843783          	ld	a5,-24(s0)
    80003ade:	06e78463          	beq	a5,a4,80003b46 <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    80003ae2:	fe843783          	ld	a5,-24(s0)
    80003ae6:	853e                	mv	a0,a5
    80003ae8:	ffffe097          	auipc	ra,0xffffe
    80003aec:	93a080e7          	jalr	-1734(ra) # 80001422 <holding>
    80003af0:	87aa                	mv	a5,a0
    80003af2:	cb81                	beqz	a5,80003b02 <wakeup+0x4c>
    80003af4:	fe843783          	ld	a5,-24(s0)
    80003af8:	4f9c                	lw	a5,24(a5)
    80003afa:	873e                	mv	a4,a5
    80003afc:	4785                	li	a5,1
    80003afe:	04f70363          	beq	a4,a5,80003b44 <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    80003b02:	fe843783          	ld	a5,-24(s0)
    80003b06:	853e                	mv	a0,a5
    80003b08:	ffffe097          	auipc	ra,0xffffe
    80003b0c:	860080e7          	jalr	-1952(ra) # 80001368 <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80003b10:	fe843783          	ld	a5,-24(s0)
    80003b14:	4f9c                	lw	a5,24(a5)
    80003b16:	873e                	mv	a4,a5
    80003b18:	4789                	li	a5,2
    80003b1a:	00f71d63          	bne	a4,a5,80003b34 <wakeup+0x7e>
    80003b1e:	fe843783          	ld	a5,-24(s0)
    80003b22:	739c                	ld	a5,32(a5)
    80003b24:	fd843703          	ld	a4,-40(s0)
    80003b28:	00f71663          	bne	a4,a5,80003b34 <wakeup+0x7e>
        p->state = RUNNABLE;
    80003b2c:	fe843783          	ld	a5,-24(s0)
    80003b30:	470d                	li	a4,3
    80003b32:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003b34:	fe843783          	ld	a5,-24(s0)
    80003b38:	853e                	mv	a0,a5
    80003b3a:	ffffe097          	auipc	ra,0xffffe
    80003b3e:	892080e7          	jalr	-1902(ra) # 800013cc <release>
    80003b42:	a011                	j	80003b46 <wakeup+0x90>
        continue;
    80003b44:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    80003b46:	fe843783          	ld	a5,-24(s0)
    80003b4a:	16878793          	addi	a5,a5,360
    80003b4e:	fef43423          	sd	a5,-24(s0)
    80003b52:	fe843703          	ld	a4,-24(s0)
    80003b56:	0002f797          	auipc	a5,0x2f
    80003b5a:	e6278793          	addi	a5,a5,-414 # 800329b8 <pid_lock>
    80003b5e:	f6f769e3          	bltu	a4,a5,80003ad0 <wakeup+0x1a>
    }
  }
}
    80003b62:	0001                	nop
    80003b64:	0001                	nop
    80003b66:	70a2                	ld	ra,40(sp)
    80003b68:	7402                	ld	s0,32(sp)
    80003b6a:	6145                	addi	sp,sp,48
    80003b6c:	8082                	ret

0000000080003b6e <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003b6e:	7179                	addi	sp,sp,-48
    80003b70:	f406                	sd	ra,40(sp)
    80003b72:	f022                	sd	s0,32(sp)
    80003b74:	1800                	addi	s0,sp,48
    80003b76:	87aa                	mv	a5,a0
    80003b78:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003b7c:	00029797          	auipc	a5,0x29
    80003b80:	43c78793          	addi	a5,a5,1084 # 8002cfb8 <proc>
    80003b84:	fef43423          	sd	a5,-24(s0)
    80003b88:	a0ad                	j	80003bf2 <kill+0x84>
    acquire(&p->lock);
    80003b8a:	fe843783          	ld	a5,-24(s0)
    80003b8e:	853e                	mv	a0,a5
    80003b90:	ffffd097          	auipc	ra,0xffffd
    80003b94:	7d8080e7          	jalr	2008(ra) # 80001368 <acquire>
    if(p->pid == pid){
    80003b98:	fe843783          	ld	a5,-24(s0)
    80003b9c:	5b98                	lw	a4,48(a5)
    80003b9e:	fdc42783          	lw	a5,-36(s0)
    80003ba2:	2781                	sext.w	a5,a5
    80003ba4:	02e79a63          	bne	a5,a4,80003bd8 <kill+0x6a>
      p->killed = 1;
    80003ba8:	fe843783          	ld	a5,-24(s0)
    80003bac:	4705                	li	a4,1
    80003bae:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80003bb0:	fe843783          	ld	a5,-24(s0)
    80003bb4:	4f9c                	lw	a5,24(a5)
    80003bb6:	873e                	mv	a4,a5
    80003bb8:	4789                	li	a5,2
    80003bba:	00f71663          	bne	a4,a5,80003bc6 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003bbe:	fe843783          	ld	a5,-24(s0)
    80003bc2:	470d                	li	a4,3
    80003bc4:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003bc6:	fe843783          	ld	a5,-24(s0)
    80003bca:	853e                	mv	a0,a5
    80003bcc:	ffffe097          	auipc	ra,0xffffe
    80003bd0:	800080e7          	jalr	-2048(ra) # 800013cc <release>
      return 0;
    80003bd4:	4781                	li	a5,0
    80003bd6:	a03d                	j	80003c04 <kill+0x96>
    }
    release(&p->lock);
    80003bd8:	fe843783          	ld	a5,-24(s0)
    80003bdc:	853e                	mv	a0,a5
    80003bde:	ffffd097          	auipc	ra,0xffffd
    80003be2:	7ee080e7          	jalr	2030(ra) # 800013cc <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003be6:	fe843783          	ld	a5,-24(s0)
    80003bea:	16878793          	addi	a5,a5,360
    80003bee:	fef43423          	sd	a5,-24(s0)
    80003bf2:	fe843703          	ld	a4,-24(s0)
    80003bf6:	0002f797          	auipc	a5,0x2f
    80003bfa:	dc278793          	addi	a5,a5,-574 # 800329b8 <pid_lock>
    80003bfe:	f8f766e3          	bltu	a4,a5,80003b8a <kill+0x1c>
  }
  return -1;
    80003c02:	57fd                	li	a5,-1
}
    80003c04:	853e                	mv	a0,a5
    80003c06:	70a2                	ld	ra,40(sp)
    80003c08:	7402                	ld	s0,32(sp)
    80003c0a:	6145                	addi	sp,sp,48
    80003c0c:	8082                	ret

0000000080003c0e <setkilled>:

void
setkilled(struct proc *p)
{
    80003c0e:	1101                	addi	sp,sp,-32
    80003c10:	ec06                	sd	ra,24(sp)
    80003c12:	e822                	sd	s0,16(sp)
    80003c14:	1000                	addi	s0,sp,32
    80003c16:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003c1a:	fe843783          	ld	a5,-24(s0)
    80003c1e:	853e                	mv	a0,a5
    80003c20:	ffffd097          	auipc	ra,0xffffd
    80003c24:	748080e7          	jalr	1864(ra) # 80001368 <acquire>
  p->killed = 1;
    80003c28:	fe843783          	ld	a5,-24(s0)
    80003c2c:	4705                	li	a4,1
    80003c2e:	d798                	sw	a4,40(a5)
  release(&p->lock);
    80003c30:	fe843783          	ld	a5,-24(s0)
    80003c34:	853e                	mv	a0,a5
    80003c36:	ffffd097          	auipc	ra,0xffffd
    80003c3a:	796080e7          	jalr	1942(ra) # 800013cc <release>
}
    80003c3e:	0001                	nop
    80003c40:	60e2                	ld	ra,24(sp)
    80003c42:	6442                	ld	s0,16(sp)
    80003c44:	6105                	addi	sp,sp,32
    80003c46:	8082                	ret

0000000080003c48 <killed>:

int
killed(struct proc *p)
{
    80003c48:	7179                	addi	sp,sp,-48
    80003c4a:	f406                	sd	ra,40(sp)
    80003c4c:	f022                	sd	s0,32(sp)
    80003c4e:	1800                	addi	s0,sp,48
    80003c50:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    80003c54:	fd843783          	ld	a5,-40(s0)
    80003c58:	853e                	mv	a0,a5
    80003c5a:	ffffd097          	auipc	ra,0xffffd
    80003c5e:	70e080e7          	jalr	1806(ra) # 80001368 <acquire>
  k = p->killed;
    80003c62:	fd843783          	ld	a5,-40(s0)
    80003c66:	579c                	lw	a5,40(a5)
    80003c68:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    80003c6c:	fd843783          	ld	a5,-40(s0)
    80003c70:	853e                	mv	a0,a5
    80003c72:	ffffd097          	auipc	ra,0xffffd
    80003c76:	75a080e7          	jalr	1882(ra) # 800013cc <release>
  return k;
    80003c7a:	fec42783          	lw	a5,-20(s0)
}
    80003c7e:	853e                	mv	a0,a5
    80003c80:	70a2                	ld	ra,40(sp)
    80003c82:	7402                	ld	s0,32(sp)
    80003c84:	6145                	addi	sp,sp,48
    80003c86:	8082                	ret

0000000080003c88 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003c88:	7139                	addi	sp,sp,-64
    80003c8a:	fc06                	sd	ra,56(sp)
    80003c8c:	f822                	sd	s0,48(sp)
    80003c8e:	0080                	addi	s0,sp,64
    80003c90:	87aa                	mv	a5,a0
    80003c92:	fcb43823          	sd	a1,-48(s0)
    80003c96:	fcc43423          	sd	a2,-56(s0)
    80003c9a:	fcd43023          	sd	a3,-64(s0)
    80003c9e:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003ca2:	fffff097          	auipc	ra,0xfffff
    80003ca6:	1d6080e7          	jalr	470(ra) # 80002e78 <myproc>
    80003caa:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003cae:	fdc42783          	lw	a5,-36(s0)
    80003cb2:	2781                	sext.w	a5,a5
    80003cb4:	c38d                	beqz	a5,80003cd6 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80003cb6:	fe843783          	ld	a5,-24(s0)
    80003cba:	6bbc                	ld	a5,80(a5)
    80003cbc:	fc043683          	ld	a3,-64(s0)
    80003cc0:	fc843603          	ld	a2,-56(s0)
    80003cc4:	fd043583          	ld	a1,-48(s0)
    80003cc8:	853e                	mv	a0,a5
    80003cca:	fffff097          	auipc	ra,0xfffff
    80003cce:	c78080e7          	jalr	-904(ra) # 80002942 <copyout>
    80003cd2:	87aa                	mv	a5,a0
    80003cd4:	a839                	j	80003cf2 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    80003cd6:	fd043783          	ld	a5,-48(s0)
    80003cda:	fc043703          	ld	a4,-64(s0)
    80003cde:	2701                	sext.w	a4,a4
    80003ce0:	863a                	mv	a2,a4
    80003ce2:	fc843583          	ld	a1,-56(s0)
    80003ce6:	853e                	mv	a0,a5
    80003ce8:	ffffe097          	auipc	ra,0xffffe
    80003cec:	938080e7          	jalr	-1736(ra) # 80001620 <memmove>
    return 0;
    80003cf0:	4781                	li	a5,0
  }
}
    80003cf2:	853e                	mv	a0,a5
    80003cf4:	70e2                	ld	ra,56(sp)
    80003cf6:	7442                	ld	s0,48(sp)
    80003cf8:	6121                	addi	sp,sp,64
    80003cfa:	8082                	ret

0000000080003cfc <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003cfc:	7139                	addi	sp,sp,-64
    80003cfe:	fc06                	sd	ra,56(sp)
    80003d00:	f822                	sd	s0,48(sp)
    80003d02:	0080                	addi	s0,sp,64
    80003d04:	fca43c23          	sd	a0,-40(s0)
    80003d08:	87ae                	mv	a5,a1
    80003d0a:	fcc43423          	sd	a2,-56(s0)
    80003d0e:	fcd43023          	sd	a3,-64(s0)
    80003d12:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003d16:	fffff097          	auipc	ra,0xfffff
    80003d1a:	162080e7          	jalr	354(ra) # 80002e78 <myproc>
    80003d1e:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003d22:	fd442783          	lw	a5,-44(s0)
    80003d26:	2781                	sext.w	a5,a5
    80003d28:	c38d                	beqz	a5,80003d4a <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80003d2a:	fe843783          	ld	a5,-24(s0)
    80003d2e:	6bbc                	ld	a5,80(a5)
    80003d30:	fc043683          	ld	a3,-64(s0)
    80003d34:	fc843603          	ld	a2,-56(s0)
    80003d38:	fd843583          	ld	a1,-40(s0)
    80003d3c:	853e                	mv	a0,a5
    80003d3e:	fffff097          	auipc	ra,0xfffff
    80003d42:	cd2080e7          	jalr	-814(ra) # 80002a10 <copyin>
    80003d46:	87aa                	mv	a5,a0
    80003d48:	a839                	j	80003d66 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003d4a:	fc843783          	ld	a5,-56(s0)
    80003d4e:	fc043703          	ld	a4,-64(s0)
    80003d52:	2701                	sext.w	a4,a4
    80003d54:	863a                	mv	a2,a4
    80003d56:	85be                	mv	a1,a5
    80003d58:	fd843503          	ld	a0,-40(s0)
    80003d5c:	ffffe097          	auipc	ra,0xffffe
    80003d60:	8c4080e7          	jalr	-1852(ra) # 80001620 <memmove>
    return 0;
    80003d64:	4781                	li	a5,0
  }
}
    80003d66:	853e                	mv	a0,a5
    80003d68:	70e2                	ld	ra,56(sp)
    80003d6a:	7442                	ld	s0,48(sp)
    80003d6c:	6121                	addi	sp,sp,64
    80003d6e:	8082                	ret

0000000080003d70 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003d70:	1101                	addi	sp,sp,-32
    80003d72:	ec06                	sd	ra,24(sp)
    80003d74:	e822                	sd	s0,16(sp)
    80003d76:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003d78:	00008517          	auipc	a0,0x8
    80003d7c:	50850513          	addi	a0,a0,1288 # 8000c280 <etext+0x280>
    80003d80:	ffffd097          	auipc	ra,0xffffd
    80003d84:	cb6080e7          	jalr	-842(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003d88:	00029797          	auipc	a5,0x29
    80003d8c:	23078793          	addi	a5,a5,560 # 8002cfb8 <proc>
    80003d90:	fef43423          	sd	a5,-24(s0)
    80003d94:	a04d                	j	80003e36 <procdump+0xc6>
    if(p->state == UNUSED)
    80003d96:	fe843783          	ld	a5,-24(s0)
    80003d9a:	4f9c                	lw	a5,24(a5)
    80003d9c:	c7d1                	beqz	a5,80003e28 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003d9e:	fe843783          	ld	a5,-24(s0)
    80003da2:	4f9c                	lw	a5,24(a5)
    80003da4:	873e                	mv	a4,a5
    80003da6:	4795                	li	a5,5
    80003da8:	02e7ee63          	bltu	a5,a4,80003de4 <procdump+0x74>
    80003dac:	fe843783          	ld	a5,-24(s0)
    80003db0:	4f9c                	lw	a5,24(a5)
    80003db2:	00009717          	auipc	a4,0x9
    80003db6:	a6e70713          	addi	a4,a4,-1426 # 8000c820 <states.1744>
    80003dba:	1782                	slli	a5,a5,0x20
    80003dbc:	9381                	srli	a5,a5,0x20
    80003dbe:	078e                	slli	a5,a5,0x3
    80003dc0:	97ba                	add	a5,a5,a4
    80003dc2:	639c                	ld	a5,0(a5)
    80003dc4:	c385                	beqz	a5,80003de4 <procdump+0x74>
      state = states[p->state];
    80003dc6:	fe843783          	ld	a5,-24(s0)
    80003dca:	4f9c                	lw	a5,24(a5)
    80003dcc:	00009717          	auipc	a4,0x9
    80003dd0:	a5470713          	addi	a4,a4,-1452 # 8000c820 <states.1744>
    80003dd4:	1782                	slli	a5,a5,0x20
    80003dd6:	9381                	srli	a5,a5,0x20
    80003dd8:	078e                	slli	a5,a5,0x3
    80003dda:	97ba                	add	a5,a5,a4
    80003ddc:	639c                	ld	a5,0(a5)
    80003dde:	fef43023          	sd	a5,-32(s0)
    80003de2:	a039                	j	80003df0 <procdump+0x80>
    else
      state = "???";
    80003de4:	00008797          	auipc	a5,0x8
    80003de8:	4a478793          	addi	a5,a5,1188 # 8000c288 <etext+0x288>
    80003dec:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003df0:	fe843783          	ld	a5,-24(s0)
    80003df4:	5b98                	lw	a4,48(a5)
    80003df6:	fe843783          	ld	a5,-24(s0)
    80003dfa:	15878793          	addi	a5,a5,344
    80003dfe:	86be                	mv	a3,a5
    80003e00:	fe043603          	ld	a2,-32(s0)
    80003e04:	85ba                	mv	a1,a4
    80003e06:	00008517          	auipc	a0,0x8
    80003e0a:	48a50513          	addi	a0,a0,1162 # 8000c290 <etext+0x290>
    80003e0e:	ffffd097          	auipc	ra,0xffffd
    80003e12:	c28080e7          	jalr	-984(ra) # 80000a36 <printf>
    printf("\n");
    80003e16:	00008517          	auipc	a0,0x8
    80003e1a:	46a50513          	addi	a0,a0,1130 # 8000c280 <etext+0x280>
    80003e1e:	ffffd097          	auipc	ra,0xffffd
    80003e22:	c18080e7          	jalr	-1000(ra) # 80000a36 <printf>
    80003e26:	a011                	j	80003e2a <procdump+0xba>
      continue;
    80003e28:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003e2a:	fe843783          	ld	a5,-24(s0)
    80003e2e:	16878793          	addi	a5,a5,360
    80003e32:	fef43423          	sd	a5,-24(s0)
    80003e36:	fe843703          	ld	a4,-24(s0)
    80003e3a:	0002f797          	auipc	a5,0x2f
    80003e3e:	b7e78793          	addi	a5,a5,-1154 # 800329b8 <pid_lock>
    80003e42:	f4f76ae3          	bltu	a4,a5,80003d96 <procdump+0x26>
  }
}
    80003e46:	0001                	nop
    80003e48:	0001                	nop
    80003e4a:	60e2                	ld	ra,24(sp)
    80003e4c:	6442                	ld	s0,16(sp)
    80003e4e:	6105                	addi	sp,sp,32
    80003e50:	8082                	ret

0000000080003e52 <swtch>:
    80003e52:	00153023          	sd	ra,0(a0)
    80003e56:	00253423          	sd	sp,8(a0)
    80003e5a:	e900                	sd	s0,16(a0)
    80003e5c:	ed04                	sd	s1,24(a0)
    80003e5e:	03253023          	sd	s2,32(a0)
    80003e62:	03353423          	sd	s3,40(a0)
    80003e66:	03453823          	sd	s4,48(a0)
    80003e6a:	03553c23          	sd	s5,56(a0)
    80003e6e:	05653023          	sd	s6,64(a0)
    80003e72:	05753423          	sd	s7,72(a0)
    80003e76:	05853823          	sd	s8,80(a0)
    80003e7a:	05953c23          	sd	s9,88(a0)
    80003e7e:	07a53023          	sd	s10,96(a0)
    80003e82:	07b53423          	sd	s11,104(a0)
    80003e86:	0005b083          	ld	ra,0(a1)
    80003e8a:	0085b103          	ld	sp,8(a1)
    80003e8e:	6980                	ld	s0,16(a1)
    80003e90:	6d84                	ld	s1,24(a1)
    80003e92:	0205b903          	ld	s2,32(a1)
    80003e96:	0285b983          	ld	s3,40(a1)
    80003e9a:	0305ba03          	ld	s4,48(a1)
    80003e9e:	0385ba83          	ld	s5,56(a1)
    80003ea2:	0405bb03          	ld	s6,64(a1)
    80003ea6:	0485bb83          	ld	s7,72(a1)
    80003eaa:	0505bc03          	ld	s8,80(a1)
    80003eae:	0585bc83          	ld	s9,88(a1)
    80003eb2:	0605bd03          	ld	s10,96(a1)
    80003eb6:	0685bd83          	ld	s11,104(a1)
    80003eba:	8082                	ret

0000000080003ebc <r_sstatus>:
{
    80003ebc:	1101                	addi	sp,sp,-32
    80003ebe:	ec22                	sd	s0,24(sp)
    80003ec0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003ec2:	100027f3          	csrr	a5,sstatus
    80003ec6:	fef43423          	sd	a5,-24(s0)
  return x;
    80003eca:	fe843783          	ld	a5,-24(s0)
}
    80003ece:	853e                	mv	a0,a5
    80003ed0:	6462                	ld	s0,24(sp)
    80003ed2:	6105                	addi	sp,sp,32
    80003ed4:	8082                	ret

0000000080003ed6 <w_sstatus>:
{
    80003ed6:	1101                	addi	sp,sp,-32
    80003ed8:	ec22                	sd	s0,24(sp)
    80003eda:	1000                	addi	s0,sp,32
    80003edc:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003ee0:	fe843783          	ld	a5,-24(s0)
    80003ee4:	10079073          	csrw	sstatus,a5
}
    80003ee8:	0001                	nop
    80003eea:	6462                	ld	s0,24(sp)
    80003eec:	6105                	addi	sp,sp,32
    80003eee:	8082                	ret

0000000080003ef0 <r_sip>:
{
    80003ef0:	1101                	addi	sp,sp,-32
    80003ef2:	ec22                	sd	s0,24(sp)
    80003ef4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003ef6:	144027f3          	csrr	a5,sip
    80003efa:	fef43423          	sd	a5,-24(s0)
  return x;
    80003efe:	fe843783          	ld	a5,-24(s0)
}
    80003f02:	853e                	mv	a0,a5
    80003f04:	6462                	ld	s0,24(sp)
    80003f06:	6105                	addi	sp,sp,32
    80003f08:	8082                	ret

0000000080003f0a <w_sip>:
{
    80003f0a:	1101                	addi	sp,sp,-32
    80003f0c:	ec22                	sd	s0,24(sp)
    80003f0e:	1000                	addi	s0,sp,32
    80003f10:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003f14:	fe843783          	ld	a5,-24(s0)
    80003f18:	14479073          	csrw	sip,a5
}
    80003f1c:	0001                	nop
    80003f1e:	6462                	ld	s0,24(sp)
    80003f20:	6105                	addi	sp,sp,32
    80003f22:	8082                	ret

0000000080003f24 <w_sepc>:
{
    80003f24:	1101                	addi	sp,sp,-32
    80003f26:	ec22                	sd	s0,24(sp)
    80003f28:	1000                	addi	s0,sp,32
    80003f2a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003f2e:	fe843783          	ld	a5,-24(s0)
    80003f32:	14179073          	csrw	sepc,a5
}
    80003f36:	0001                	nop
    80003f38:	6462                	ld	s0,24(sp)
    80003f3a:	6105                	addi	sp,sp,32
    80003f3c:	8082                	ret

0000000080003f3e <r_sepc>:
{
    80003f3e:	1101                	addi	sp,sp,-32
    80003f40:	ec22                	sd	s0,24(sp)
    80003f42:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003f44:	141027f3          	csrr	a5,sepc
    80003f48:	fef43423          	sd	a5,-24(s0)
  return x;
    80003f4c:	fe843783          	ld	a5,-24(s0)
}
    80003f50:	853e                	mv	a0,a5
    80003f52:	6462                	ld	s0,24(sp)
    80003f54:	6105                	addi	sp,sp,32
    80003f56:	8082                	ret

0000000080003f58 <w_stvec>:
{
    80003f58:	1101                	addi	sp,sp,-32
    80003f5a:	ec22                	sd	s0,24(sp)
    80003f5c:	1000                	addi	s0,sp,32
    80003f5e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003f62:	fe843783          	ld	a5,-24(s0)
    80003f66:	10579073          	csrw	stvec,a5
}
    80003f6a:	0001                	nop
    80003f6c:	6462                	ld	s0,24(sp)
    80003f6e:	6105                	addi	sp,sp,32
    80003f70:	8082                	ret

0000000080003f72 <r_satp>:
{
    80003f72:	1101                	addi	sp,sp,-32
    80003f74:	ec22                	sd	s0,24(sp)
    80003f76:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003f78:	180027f3          	csrr	a5,satp
    80003f7c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003f80:	fe843783          	ld	a5,-24(s0)
}
    80003f84:	853e                	mv	a0,a5
    80003f86:	6462                	ld	s0,24(sp)
    80003f88:	6105                	addi	sp,sp,32
    80003f8a:	8082                	ret

0000000080003f8c <r_scause>:
{
    80003f8c:	1101                	addi	sp,sp,-32
    80003f8e:	ec22                	sd	s0,24(sp)
    80003f90:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003f92:	142027f3          	csrr	a5,scause
    80003f96:	fef43423          	sd	a5,-24(s0)
  return x;
    80003f9a:	fe843783          	ld	a5,-24(s0)
}
    80003f9e:	853e                	mv	a0,a5
    80003fa0:	6462                	ld	s0,24(sp)
    80003fa2:	6105                	addi	sp,sp,32
    80003fa4:	8082                	ret

0000000080003fa6 <r_stval>:
{
    80003fa6:	1101                	addi	sp,sp,-32
    80003fa8:	ec22                	sd	s0,24(sp)
    80003faa:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003fac:	143027f3          	csrr	a5,stval
    80003fb0:	fef43423          	sd	a5,-24(s0)
  return x;
    80003fb4:	fe843783          	ld	a5,-24(s0)
}
    80003fb8:	853e                	mv	a0,a5
    80003fba:	6462                	ld	s0,24(sp)
    80003fbc:	6105                	addi	sp,sp,32
    80003fbe:	8082                	ret

0000000080003fc0 <intr_on>:
{
    80003fc0:	1141                	addi	sp,sp,-16
    80003fc2:	e406                	sd	ra,8(sp)
    80003fc4:	e022                	sd	s0,0(sp)
    80003fc6:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003fc8:	00000097          	auipc	ra,0x0
    80003fcc:	ef4080e7          	jalr	-268(ra) # 80003ebc <r_sstatus>
    80003fd0:	87aa                	mv	a5,a0
    80003fd2:	0027e793          	ori	a5,a5,2
    80003fd6:	853e                	mv	a0,a5
    80003fd8:	00000097          	auipc	ra,0x0
    80003fdc:	efe080e7          	jalr	-258(ra) # 80003ed6 <w_sstatus>
}
    80003fe0:	0001                	nop
    80003fe2:	60a2                	ld	ra,8(sp)
    80003fe4:	6402                	ld	s0,0(sp)
    80003fe6:	0141                	addi	sp,sp,16
    80003fe8:	8082                	ret

0000000080003fea <intr_off>:
{
    80003fea:	1141                	addi	sp,sp,-16
    80003fec:	e406                	sd	ra,8(sp)
    80003fee:	e022                	sd	s0,0(sp)
    80003ff0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003ff2:	00000097          	auipc	ra,0x0
    80003ff6:	eca080e7          	jalr	-310(ra) # 80003ebc <r_sstatus>
    80003ffa:	87aa                	mv	a5,a0
    80003ffc:	9bf5                	andi	a5,a5,-3
    80003ffe:	853e                	mv	a0,a5
    80004000:	00000097          	auipc	ra,0x0
    80004004:	ed6080e7          	jalr	-298(ra) # 80003ed6 <w_sstatus>
}
    80004008:	0001                	nop
    8000400a:	60a2                	ld	ra,8(sp)
    8000400c:	6402                	ld	s0,0(sp)
    8000400e:	0141                	addi	sp,sp,16
    80004010:	8082                	ret

0000000080004012 <intr_get>:
{
    80004012:	1101                	addi	sp,sp,-32
    80004014:	ec06                	sd	ra,24(sp)
    80004016:	e822                	sd	s0,16(sp)
    80004018:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    8000401a:	00000097          	auipc	ra,0x0
    8000401e:	ea2080e7          	jalr	-350(ra) # 80003ebc <r_sstatus>
    80004022:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80004026:	fe843783          	ld	a5,-24(s0)
    8000402a:	8b89                	andi	a5,a5,2
    8000402c:	00f037b3          	snez	a5,a5
    80004030:	0ff7f793          	andi	a5,a5,255
    80004034:	2781                	sext.w	a5,a5
}
    80004036:	853e                	mv	a0,a5
    80004038:	60e2                	ld	ra,24(sp)
    8000403a:	6442                	ld	s0,16(sp)
    8000403c:	6105                	addi	sp,sp,32
    8000403e:	8082                	ret

0000000080004040 <r_tp>:
{
    80004040:	1101                	addi	sp,sp,-32
    80004042:	ec22                	sd	s0,24(sp)
    80004044:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80004046:	8792                	mv	a5,tp
    80004048:	fef43423          	sd	a5,-24(s0)
  return x;
    8000404c:	fe843783          	ld	a5,-24(s0)
}
    80004050:	853e                	mv	a0,a5
    80004052:	6462                	ld	s0,24(sp)
    80004054:	6105                	addi	sp,sp,32
    80004056:	8082                	ret

0000000080004058 <trapinit>:

extern int swapin(uint64 va);

void
trapinit(void)
{
    80004058:	1141                	addi	sp,sp,-16
    8000405a:	e406                	sd	ra,8(sp)
    8000405c:	e022                	sd	s0,0(sp)
    8000405e:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80004060:	00008597          	auipc	a1,0x8
    80004064:	27858593          	addi	a1,a1,632 # 8000c2d8 <etext+0x2d8>
    80004068:	0002f517          	auipc	a0,0x2f
    8000406c:	98050513          	addi	a0,a0,-1664 # 800329e8 <tickslock>
    80004070:	ffffd097          	auipc	ra,0xffffd
    80004074:	2c8080e7          	jalr	712(ra) # 80001338 <initlock>
}
    80004078:	0001                	nop
    8000407a:	60a2                	ld	ra,8(sp)
    8000407c:	6402                	ld	s0,0(sp)
    8000407e:	0141                	addi	sp,sp,16
    80004080:	8082                	ret

0000000080004082 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80004082:	1141                	addi	sp,sp,-16
    80004084:	e406                	sd	ra,8(sp)
    80004086:	e022                	sd	s0,0(sp)
    80004088:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    8000408a:	00005797          	auipc	a5,0x5
    8000408e:	e0678793          	addi	a5,a5,-506 # 80008e90 <kernelvec>
    80004092:	853e                	mv	a0,a5
    80004094:	00000097          	auipc	ra,0x0
    80004098:	ec4080e7          	jalr	-316(ra) # 80003f58 <w_stvec>
}
    8000409c:	0001                	nop
    8000409e:	60a2                	ld	ra,8(sp)
    800040a0:	6402                	ld	s0,0(sp)
    800040a2:	0141                	addi	sp,sp,16
    800040a4:	8082                	ret

00000000800040a6 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    800040a6:	7139                	addi	sp,sp,-64
    800040a8:	fc06                	sd	ra,56(sp)
    800040aa:	f822                	sd	s0,48(sp)
    800040ac:	f426                	sd	s1,40(sp)
    800040ae:	0080                	addi	s0,sp,64
  int which_dev = 0;
    800040b0:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    800040b4:	00000097          	auipc	ra,0x0
    800040b8:	e08080e7          	jalr	-504(ra) # 80003ebc <r_sstatus>
    800040bc:	87aa                	mv	a5,a0
    800040be:	1007f793          	andi	a5,a5,256
    800040c2:	cb89                	beqz	a5,800040d4 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    800040c4:	00008517          	auipc	a0,0x8
    800040c8:	21c50513          	addi	a0,a0,540 # 8000c2e0 <etext+0x2e0>
    800040cc:	ffffd097          	auipc	ra,0xffffd
    800040d0:	bc0080e7          	jalr	-1088(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    800040d4:	00005797          	auipc	a5,0x5
    800040d8:	dbc78793          	addi	a5,a5,-580 # 80008e90 <kernelvec>
    800040dc:	853e                	mv	a0,a5
    800040de:	00000097          	auipc	ra,0x0
    800040e2:	e7a080e7          	jalr	-390(ra) # 80003f58 <w_stvec>

  struct proc *p = myproc();
    800040e6:	fffff097          	auipc	ra,0xfffff
    800040ea:	d92080e7          	jalr	-622(ra) # 80002e78 <myproc>
    800040ee:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    800040f2:	fd043783          	ld	a5,-48(s0)
    800040f6:	6fa4                	ld	s1,88(a5)
    800040f8:	00000097          	auipc	ra,0x0
    800040fc:	e46080e7          	jalr	-442(ra) # 80003f3e <r_sepc>
    80004100:	87aa                	mv	a5,a0
    80004102:	ec9c                	sd	a5,24(s1)

  uint64 scause = r_scause();
    80004104:	00000097          	auipc	ra,0x0
    80004108:	e88080e7          	jalr	-376(ra) # 80003f8c <r_scause>
    8000410c:	fca43423          	sd	a0,-56(s0)

  int pfhandled = 0;
    80004110:	fc042c23          	sw	zero,-40(s0)
  if(scause == 13) {
    80004114:	fc843703          	ld	a4,-56(s0)
    80004118:	47b5                	li	a5,13
    8000411a:	02f71163          	bne	a4,a5,8000413c <usertrap+0x96>
    // page fault

    uint64 va = (uint64)r_stval();
    8000411e:	00000097          	auipc	ra,0x0
    80004122:	e88080e7          	jalr	-376(ra) # 80003fa6 <r_stval>
    80004126:	fca43023          	sd	a0,-64(s0)
    pfhandled = swapin(va);
    8000412a:	fc043503          	ld	a0,-64(s0)
    8000412e:	ffffe097          	auipc	ra,0xffffe
    80004132:	ce4080e7          	jalr	-796(ra) # 80001e12 <swapin>
    80004136:	87aa                	mv	a5,a0
    80004138:	fcf42c23          	sw	a5,-40(s0)
  }

  if(pfhandled == 0)
    8000413c:	fd842783          	lw	a5,-40(s0)
    80004140:	2781                	sext.w	a5,a5
    80004142:	efc5                	bnez	a5,800041fa <usertrap+0x154>
  {
    if(scause == 8) {
    80004144:	fc843703          	ld	a4,-56(s0)
    80004148:	47a1                	li	a5,8
    8000414a:	04f71163          	bne	a4,a5,8000418c <usertrap+0xe6>
      // system call

      if(killed(p))
    8000414e:	fd043503          	ld	a0,-48(s0)
    80004152:	00000097          	auipc	ra,0x0
    80004156:	af6080e7          	jalr	-1290(ra) # 80003c48 <killed>
    8000415a:	87aa                	mv	a5,a0
    8000415c:	c791                	beqz	a5,80004168 <usertrap+0xc2>
        exit(-1);
    8000415e:	557d                	li	a0,-1
    80004160:	fffff097          	auipc	ra,0xfffff
    80004164:	40a080e7          	jalr	1034(ra) # 8000356a <exit>

      // sepc points to the ecall instruction,
      // but we want to return to the next instruction.
      p->trapframe->epc += 4;
    80004168:	fd043783          	ld	a5,-48(s0)
    8000416c:	6fbc                	ld	a5,88(a5)
    8000416e:	6f98                	ld	a4,24(a5)
    80004170:	fd043783          	ld	a5,-48(s0)
    80004174:	6fbc                	ld	a5,88(a5)
    80004176:	0711                	addi	a4,a4,4
    80004178:	ef98                	sd	a4,24(a5)

      // an interrupt will change sepc, scause, and sstatus,
      // so enable only now that we're done with those registers.
      intr_on();
    8000417a:	00000097          	auipc	ra,0x0
    8000417e:	e46080e7          	jalr	-442(ra) # 80003fc0 <intr_on>

      syscall();
    80004182:	00000097          	auipc	ra,0x0
    80004186:	6a8080e7          	jalr	1704(ra) # 8000482a <syscall>
    8000418a:	a885                	j	800041fa <usertrap+0x154>
    } else if((which_dev = devintr()) != 0){
    8000418c:	00000097          	auipc	ra,0x0
    80004190:	36e080e7          	jalr	878(ra) # 800044fa <devintr>
    80004194:	87aa                	mv	a5,a0
    80004196:	fcf42e23          	sw	a5,-36(s0)
    8000419a:	fdc42783          	lw	a5,-36(s0)
    8000419e:	2781                	sext.w	a5,a5
    800041a0:	efa9                	bnez	a5,800041fa <usertrap+0x154>
      // ok
    } else {
      printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    800041a2:	00000097          	auipc	ra,0x0
    800041a6:	dea080e7          	jalr	-534(ra) # 80003f8c <r_scause>
    800041aa:	872a                	mv	a4,a0
    800041ac:	fd043783          	ld	a5,-48(s0)
    800041b0:	5b9c                	lw	a5,48(a5)
    800041b2:	863e                	mv	a2,a5
    800041b4:	85ba                	mv	a1,a4
    800041b6:	00008517          	auipc	a0,0x8
    800041ba:	14a50513          	addi	a0,a0,330 # 8000c300 <etext+0x300>
    800041be:	ffffd097          	auipc	ra,0xffffd
    800041c2:	878080e7          	jalr	-1928(ra) # 80000a36 <printf>
      printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    800041c6:	00000097          	auipc	ra,0x0
    800041ca:	d78080e7          	jalr	-648(ra) # 80003f3e <r_sepc>
    800041ce:	84aa                	mv	s1,a0
    800041d0:	00000097          	auipc	ra,0x0
    800041d4:	dd6080e7          	jalr	-554(ra) # 80003fa6 <r_stval>
    800041d8:	87aa                	mv	a5,a0
    800041da:	863e                	mv	a2,a5
    800041dc:	85a6                	mv	a1,s1
    800041de:	00008517          	auipc	a0,0x8
    800041e2:	15250513          	addi	a0,a0,338 # 8000c330 <etext+0x330>
    800041e6:	ffffd097          	auipc	ra,0xffffd
    800041ea:	850080e7          	jalr	-1968(ra) # 80000a36 <printf>
      setkilled(p);
    800041ee:	fd043503          	ld	a0,-48(s0)
    800041f2:	00000097          	auipc	ra,0x0
    800041f6:	a1c080e7          	jalr	-1508(ra) # 80003c0e <setkilled>
    }
  }

  if(killed(p))
    800041fa:	fd043503          	ld	a0,-48(s0)
    800041fe:	00000097          	auipc	ra,0x0
    80004202:	a4a080e7          	jalr	-1462(ra) # 80003c48 <killed>
    80004206:	87aa                	mv	a5,a0
    80004208:	c791                	beqz	a5,80004214 <usertrap+0x16e>
    exit(-1);
    8000420a:	557d                	li	a0,-1
    8000420c:	fffff097          	auipc	ra,0xfffff
    80004210:	35e080e7          	jalr	862(ra) # 8000356a <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80004214:	fdc42783          	lw	a5,-36(s0)
    80004218:	0007871b          	sext.w	a4,a5
    8000421c:	4789                	li	a5,2
    8000421e:	00f71663          	bne	a4,a5,8000422a <usertrap+0x184>
    yield();
    80004222:	fffff097          	auipc	ra,0xfffff
    80004226:	77e080e7          	jalr	1918(ra) # 800039a0 <yield>

  usertrapret();
    8000422a:	00000097          	auipc	ra,0x0
    8000422e:	014080e7          	jalr	20(ra) # 8000423e <usertrapret>
}
    80004232:	0001                	nop
    80004234:	70e2                	ld	ra,56(sp)
    80004236:	7442                	ld	s0,48(sp)
    80004238:	74a2                	ld	s1,40(sp)
    8000423a:	6121                	addi	sp,sp,64
    8000423c:	8082                	ret

000000008000423e <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    8000423e:	715d                	addi	sp,sp,-80
    80004240:	e486                	sd	ra,72(sp)
    80004242:	e0a2                	sd	s0,64(sp)
    80004244:	fc26                	sd	s1,56(sp)
    80004246:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80004248:	fffff097          	auipc	ra,0xfffff
    8000424c:	c30080e7          	jalr	-976(ra) # 80002e78 <myproc>
    80004250:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80004254:	00000097          	auipc	ra,0x0
    80004258:	d96080e7          	jalr	-618(ra) # 80003fea <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    8000425c:	00007717          	auipc	a4,0x7
    80004260:	da470713          	addi	a4,a4,-604 # 8000b000 <_trampoline>
    80004264:	00007797          	auipc	a5,0x7
    80004268:	d9c78793          	addi	a5,a5,-612 # 8000b000 <_trampoline>
    8000426c:	8f1d                	sub	a4,a4,a5
    8000426e:	040007b7          	lui	a5,0x4000
    80004272:	17fd                	addi	a5,a5,-1
    80004274:	07b2                	slli	a5,a5,0xc
    80004276:	97ba                	add	a5,a5,a4
    80004278:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    8000427c:	fd043503          	ld	a0,-48(s0)
    80004280:	00000097          	auipc	ra,0x0
    80004284:	cd8080e7          	jalr	-808(ra) # 80003f58 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80004288:	fd843783          	ld	a5,-40(s0)
    8000428c:	6fa4                	ld	s1,88(a5)
    8000428e:	00000097          	auipc	ra,0x0
    80004292:	ce4080e7          	jalr	-796(ra) # 80003f72 <r_satp>
    80004296:	87aa                	mv	a5,a0
    80004298:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    8000429a:	fd843783          	ld	a5,-40(s0)
    8000429e:	63b4                	ld	a3,64(a5)
    800042a0:	fd843783          	ld	a5,-40(s0)
    800042a4:	6fbc                	ld	a5,88(a5)
    800042a6:	6705                	lui	a4,0x1
    800042a8:	9736                	add	a4,a4,a3
    800042aa:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    800042ac:	fd843783          	ld	a5,-40(s0)
    800042b0:	6fbc                	ld	a5,88(a5)
    800042b2:	00000717          	auipc	a4,0x0
    800042b6:	df470713          	addi	a4,a4,-524 # 800040a6 <usertrap>
    800042ba:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    800042bc:	fd843783          	ld	a5,-40(s0)
    800042c0:	6fa4                	ld	s1,88(a5)
    800042c2:	00000097          	auipc	ra,0x0
    800042c6:	d7e080e7          	jalr	-642(ra) # 80004040 <r_tp>
    800042ca:	87aa                	mv	a5,a0
    800042cc:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    800042ce:	00000097          	auipc	ra,0x0
    800042d2:	bee080e7          	jalr	-1042(ra) # 80003ebc <r_sstatus>
    800042d6:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    800042da:	fc843783          	ld	a5,-56(s0)
    800042de:	eff7f793          	andi	a5,a5,-257
    800042e2:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    800042e6:	fc843783          	ld	a5,-56(s0)
    800042ea:	0207e793          	ori	a5,a5,32
    800042ee:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    800042f2:	fc843503          	ld	a0,-56(s0)
    800042f6:	00000097          	auipc	ra,0x0
    800042fa:	be0080e7          	jalr	-1056(ra) # 80003ed6 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    800042fe:	fd843783          	ld	a5,-40(s0)
    80004302:	6fbc                	ld	a5,88(a5)
    80004304:	6f9c                	ld	a5,24(a5)
    80004306:	853e                	mv	a0,a5
    80004308:	00000097          	auipc	ra,0x0
    8000430c:	c1c080e7          	jalr	-996(ra) # 80003f24 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80004310:	fd843783          	ld	a5,-40(s0)
    80004314:	6bbc                	ld	a5,80(a5)
    80004316:	00c7d713          	srli	a4,a5,0xc
    8000431a:	57fd                	li	a5,-1
    8000431c:	17fe                	slli	a5,a5,0x3f
    8000431e:	8fd9                	or	a5,a5,a4
    80004320:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80004324:	00007717          	auipc	a4,0x7
    80004328:	d7870713          	addi	a4,a4,-648 # 8000b09c <userret>
    8000432c:	00007797          	auipc	a5,0x7
    80004330:	cd478793          	addi	a5,a5,-812 # 8000b000 <_trampoline>
    80004334:	8f1d                	sub	a4,a4,a5
    80004336:	040007b7          	lui	a5,0x4000
    8000433a:	17fd                	addi	a5,a5,-1
    8000433c:	07b2                	slli	a5,a5,0xc
    8000433e:	97ba                	add	a5,a5,a4
    80004340:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80004344:	fb843783          	ld	a5,-72(s0)
    80004348:	fc043503          	ld	a0,-64(s0)
    8000434c:	9782                	jalr	a5
}
    8000434e:	0001                	nop
    80004350:	60a6                	ld	ra,72(sp)
    80004352:	6406                	ld	s0,64(sp)
    80004354:	74e2                	ld	s1,56(sp)
    80004356:	6161                	addi	sp,sp,80
    80004358:	8082                	ret

000000008000435a <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    8000435a:	7139                	addi	sp,sp,-64
    8000435c:	fc06                	sd	ra,56(sp)
    8000435e:	f822                	sd	s0,48(sp)
    80004360:	f426                	sd	s1,40(sp)
    80004362:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80004364:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80004368:	00000097          	auipc	ra,0x0
    8000436c:	bd6080e7          	jalr	-1066(ra) # 80003f3e <r_sepc>
    80004370:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80004374:	00000097          	auipc	ra,0x0
    80004378:	b48080e7          	jalr	-1208(ra) # 80003ebc <r_sstatus>
    8000437c:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80004380:	00000097          	auipc	ra,0x0
    80004384:	c0c080e7          	jalr	-1012(ra) # 80003f8c <r_scause>
    80004388:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    8000438c:	fc843783          	ld	a5,-56(s0)
    80004390:	1007f793          	andi	a5,a5,256
    80004394:	eb89                	bnez	a5,800043a6 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80004396:	00008517          	auipc	a0,0x8
    8000439a:	fba50513          	addi	a0,a0,-70 # 8000c350 <etext+0x350>
    8000439e:	ffffd097          	auipc	ra,0xffffd
    800043a2:	8ee080e7          	jalr	-1810(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    800043a6:	00000097          	auipc	ra,0x0
    800043aa:	c6c080e7          	jalr	-916(ra) # 80004012 <intr_get>
    800043ae:	87aa                	mv	a5,a0
    800043b0:	cb89                	beqz	a5,800043c2 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    800043b2:	00008517          	auipc	a0,0x8
    800043b6:	fc650513          	addi	a0,a0,-58 # 8000c378 <etext+0x378>
    800043ba:	ffffd097          	auipc	ra,0xffffd
    800043be:	8d2080e7          	jalr	-1838(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    800043c2:	00000097          	auipc	ra,0x0
    800043c6:	138080e7          	jalr	312(ra) # 800044fa <devintr>
    800043ca:	87aa                	mv	a5,a0
    800043cc:	fcf42e23          	sw	a5,-36(s0)
    800043d0:	fdc42783          	lw	a5,-36(s0)
    800043d4:	2781                	sext.w	a5,a5
    800043d6:	e7b9                	bnez	a5,80004424 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    800043d8:	fc043583          	ld	a1,-64(s0)
    800043dc:	00008517          	auipc	a0,0x8
    800043e0:	fbc50513          	addi	a0,a0,-68 # 8000c398 <etext+0x398>
    800043e4:	ffffc097          	auipc	ra,0xffffc
    800043e8:	652080e7          	jalr	1618(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    800043ec:	00000097          	auipc	ra,0x0
    800043f0:	b52080e7          	jalr	-1198(ra) # 80003f3e <r_sepc>
    800043f4:	84aa                	mv	s1,a0
    800043f6:	00000097          	auipc	ra,0x0
    800043fa:	bb0080e7          	jalr	-1104(ra) # 80003fa6 <r_stval>
    800043fe:	87aa                	mv	a5,a0
    80004400:	863e                	mv	a2,a5
    80004402:	85a6                	mv	a1,s1
    80004404:	00008517          	auipc	a0,0x8
    80004408:	fa450513          	addi	a0,a0,-92 # 8000c3a8 <etext+0x3a8>
    8000440c:	ffffc097          	auipc	ra,0xffffc
    80004410:	62a080e7          	jalr	1578(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80004414:	00008517          	auipc	a0,0x8
    80004418:	fac50513          	addi	a0,a0,-84 # 8000c3c0 <etext+0x3c0>
    8000441c:	ffffd097          	auipc	ra,0xffffd
    80004420:	870080e7          	jalr	-1936(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80004424:	fdc42783          	lw	a5,-36(s0)
    80004428:	0007871b          	sext.w	a4,a5
    8000442c:	4789                	li	a5,2
    8000442e:	02f71663          	bne	a4,a5,8000445a <kerneltrap+0x100>
    80004432:	fffff097          	auipc	ra,0xfffff
    80004436:	a46080e7          	jalr	-1466(ra) # 80002e78 <myproc>
    8000443a:	87aa                	mv	a5,a0
    8000443c:	cf99                	beqz	a5,8000445a <kerneltrap+0x100>
    8000443e:	fffff097          	auipc	ra,0xfffff
    80004442:	a3a080e7          	jalr	-1478(ra) # 80002e78 <myproc>
    80004446:	87aa                	mv	a5,a0
    80004448:	4f9c                	lw	a5,24(a5)
    8000444a:	873e                	mv	a4,a5
    8000444c:	4791                	li	a5,4
    8000444e:	00f71663          	bne	a4,a5,8000445a <kerneltrap+0x100>
    yield();
    80004452:	fffff097          	auipc	ra,0xfffff
    80004456:	54e080e7          	jalr	1358(ra) # 800039a0 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    8000445a:	fd043503          	ld	a0,-48(s0)
    8000445e:	00000097          	auipc	ra,0x0
    80004462:	ac6080e7          	jalr	-1338(ra) # 80003f24 <w_sepc>
  w_sstatus(sstatus);
    80004466:	fc843503          	ld	a0,-56(s0)
    8000446a:	00000097          	auipc	ra,0x0
    8000446e:	a6c080e7          	jalr	-1428(ra) # 80003ed6 <w_sstatus>
}
    80004472:	0001                	nop
    80004474:	70e2                	ld	ra,56(sp)
    80004476:	7442                	ld	s0,48(sp)
    80004478:	74a2                	ld	s1,40(sp)
    8000447a:	6121                	addi	sp,sp,64
    8000447c:	8082                	ret

000000008000447e <clockintr>:

void
clockintr()
{
    8000447e:	1141                	addi	sp,sp,-16
    80004480:	e406                	sd	ra,8(sp)
    80004482:	e022                	sd	s0,0(sp)
    80004484:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004486:	0002e517          	auipc	a0,0x2e
    8000448a:	56250513          	addi	a0,a0,1378 # 800329e8 <tickslock>
    8000448e:	ffffd097          	auipc	ra,0xffffd
    80004492:	eda080e7          	jalr	-294(ra) # 80001368 <acquire>
  ticks++;
    80004496:	00008797          	auipc	a5,0x8
    8000449a:	4b278793          	addi	a5,a5,1202 # 8000c948 <ticks>
    8000449e:	439c                	lw	a5,0(a5)
    800044a0:	2785                	addiw	a5,a5,1
    800044a2:	0007871b          	sext.w	a4,a5
    800044a6:	00008797          	auipc	a5,0x8
    800044aa:	4a278793          	addi	a5,a5,1186 # 8000c948 <ticks>
    800044ae:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    800044b0:	00008797          	auipc	a5,0x8
    800044b4:	49878793          	addi	a5,a5,1176 # 8000c948 <ticks>
    800044b8:	439c                	lw	a5,0(a5)
    800044ba:	873e                	mv	a4,a5
    800044bc:	06400793          	li	a5,100
    800044c0:	02f777bb          	remuw	a5,a4,a5
    800044c4:	2781                	sext.w	a5,a5
    800044c6:	e789                	bnez	a5,800044d0 <clockintr+0x52>
  {
    updaterefhistory();
    800044c8:	ffffd097          	auipc	ra,0xffffd
    800044cc:	696080e7          	jalr	1686(ra) # 80001b5e <updaterefhistory>
  }

  wakeup(&ticks);
    800044d0:	00008517          	auipc	a0,0x8
    800044d4:	47850513          	addi	a0,a0,1144 # 8000c948 <ticks>
    800044d8:	fffff097          	auipc	ra,0xfffff
    800044dc:	5de080e7          	jalr	1502(ra) # 80003ab6 <wakeup>
  release(&tickslock);
    800044e0:	0002e517          	auipc	a0,0x2e
    800044e4:	50850513          	addi	a0,a0,1288 # 800329e8 <tickslock>
    800044e8:	ffffd097          	auipc	ra,0xffffd
    800044ec:	ee4080e7          	jalr	-284(ra) # 800013cc <release>
}
    800044f0:	0001                	nop
    800044f2:	60a2                	ld	ra,8(sp)
    800044f4:	6402                	ld	s0,0(sp)
    800044f6:	0141                	addi	sp,sp,16
    800044f8:	8082                	ret

00000000800044fa <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    800044fa:	1101                	addi	sp,sp,-32
    800044fc:	ec06                	sd	ra,24(sp)
    800044fe:	e822                	sd	s0,16(sp)
    80004500:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80004502:	00000097          	auipc	ra,0x0
    80004506:	a8a080e7          	jalr	-1398(ra) # 80003f8c <r_scause>
    8000450a:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    8000450e:	fe843783          	ld	a5,-24(s0)
    80004512:	0a07d263          	bgez	a5,800045b6 <devintr+0xbc>
     (scause & 0xff) == 9){
    80004516:	fe843783          	ld	a5,-24(s0)
    8000451a:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    8000451e:	47a5                	li	a5,9
    80004520:	08f71b63          	bne	a4,a5,800045b6 <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004524:	00005097          	auipc	ra,0x5
    80004528:	aa8080e7          	jalr	-1368(ra) # 80008fcc <plic_claim>
    8000452c:	87aa                	mv	a5,a0
    8000452e:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004532:	fe442783          	lw	a5,-28(s0)
    80004536:	0007871b          	sext.w	a4,a5
    8000453a:	47a9                	li	a5,10
    8000453c:	00f71763          	bne	a4,a5,8000454a <devintr+0x50>
      uartintr();
    80004540:	ffffd097          	auipc	ra,0xffffd
    80004544:	aee080e7          	jalr	-1298(ra) # 8000102e <uartintr>
    80004548:	a891                	j	8000459c <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    8000454a:	fe442783          	lw	a5,-28(s0)
    8000454e:	0007871b          	sext.w	a4,a5
    80004552:	4785                	li	a5,1
    80004554:	00f71863          	bne	a4,a5,80004564 <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004558:	4501                	li	a0,0
    8000455a:	00006097          	auipc	ra,0x6
    8000455e:	c30080e7          	jalr	-976(ra) # 8000a18a <virtio_disk_intr>
    80004562:	a82d                	j	8000459c <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    80004564:	fe442783          	lw	a5,-28(s0)
    80004568:	0007871b          	sext.w	a4,a5
    8000456c:	4789                	li	a5,2
    8000456e:	00f71863          	bne	a4,a5,8000457e <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    80004572:	4505                	li	a0,1
    80004574:	00006097          	auipc	ra,0x6
    80004578:	c16080e7          	jalr	-1002(ra) # 8000a18a <virtio_disk_intr>
    8000457c:	a005                	j	8000459c <devintr+0xa2>
    } else if(irq){
    8000457e:	fe442783          	lw	a5,-28(s0)
    80004582:	2781                	sext.w	a5,a5
    80004584:	cf81                	beqz	a5,8000459c <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    80004586:	fe442783          	lw	a5,-28(s0)
    8000458a:	85be                	mv	a1,a5
    8000458c:	00008517          	auipc	a0,0x8
    80004590:	e4450513          	addi	a0,a0,-444 # 8000c3d0 <etext+0x3d0>
    80004594:	ffffc097          	auipc	ra,0xffffc
    80004598:	4a2080e7          	jalr	1186(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    8000459c:	fe442783          	lw	a5,-28(s0)
    800045a0:	2781                	sext.w	a5,a5
    800045a2:	cb81                	beqz	a5,800045b2 <devintr+0xb8>
      plic_complete(irq);
    800045a4:	fe442783          	lw	a5,-28(s0)
    800045a8:	853e                	mv	a0,a5
    800045aa:	00005097          	auipc	ra,0x5
    800045ae:	a60080e7          	jalr	-1440(ra) # 8000900a <plic_complete>

    return 1;
    800045b2:	4785                	li	a5,1
    800045b4:	a081                	j	800045f4 <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    800045b6:	fe843703          	ld	a4,-24(s0)
    800045ba:	57fd                	li	a5,-1
    800045bc:	17fe                	slli	a5,a5,0x3f
    800045be:	0785                	addi	a5,a5,1
    800045c0:	02f71963          	bne	a4,a5,800045f2 <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800045c4:	fffff097          	auipc	ra,0xfffff
    800045c8:	856080e7          	jalr	-1962(ra) # 80002e1a <cpuid>
    800045cc:	87aa                	mv	a5,a0
    800045ce:	e789                	bnez	a5,800045d8 <devintr+0xde>
      clockintr();
    800045d0:	00000097          	auipc	ra,0x0
    800045d4:	eae080e7          	jalr	-338(ra) # 8000447e <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800045d8:	00000097          	auipc	ra,0x0
    800045dc:	918080e7          	jalr	-1768(ra) # 80003ef0 <r_sip>
    800045e0:	87aa                	mv	a5,a0
    800045e2:	9bf5                	andi	a5,a5,-3
    800045e4:	853e                	mv	a0,a5
    800045e6:	00000097          	auipc	ra,0x0
    800045ea:	924080e7          	jalr	-1756(ra) # 80003f0a <w_sip>

    return 2;
    800045ee:	4789                	li	a5,2
    800045f0:	a011                	j	800045f4 <devintr+0xfa>
  } else {
    return 0;
    800045f2:	4781                	li	a5,0
  }
}
    800045f4:	853e                	mv	a0,a5
    800045f6:	60e2                	ld	ra,24(sp)
    800045f8:	6442                	ld	s0,16(sp)
    800045fa:	6105                	addi	sp,sp,32
    800045fc:	8082                	ret

00000000800045fe <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    800045fe:	7179                	addi	sp,sp,-48
    80004600:	f406                	sd	ra,40(sp)
    80004602:	f022                	sd	s0,32(sp)
    80004604:	1800                	addi	s0,sp,48
    80004606:	fca43c23          	sd	a0,-40(s0)
    8000460a:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000460e:	fffff097          	auipc	ra,0xfffff
    80004612:	86a080e7          	jalr	-1942(ra) # 80002e78 <myproc>
    80004616:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    8000461a:	fe843783          	ld	a5,-24(s0)
    8000461e:	67bc                	ld	a5,72(a5)
    80004620:	fd843703          	ld	a4,-40(s0)
    80004624:	00f77b63          	bgeu	a4,a5,8000463a <fetchaddr+0x3c>
    80004628:	fd843783          	ld	a5,-40(s0)
    8000462c:	00878713          	addi	a4,a5,8
    80004630:	fe843783          	ld	a5,-24(s0)
    80004634:	67bc                	ld	a5,72(a5)
    80004636:	00e7f463          	bgeu	a5,a4,8000463e <fetchaddr+0x40>
    return -1;
    8000463a:	57fd                	li	a5,-1
    8000463c:	a01d                	j	80004662 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    8000463e:	fe843783          	ld	a5,-24(s0)
    80004642:	6bbc                	ld	a5,80(a5)
    80004644:	46a1                	li	a3,8
    80004646:	fd843603          	ld	a2,-40(s0)
    8000464a:	fd043583          	ld	a1,-48(s0)
    8000464e:	853e                	mv	a0,a5
    80004650:	ffffe097          	auipc	ra,0xffffe
    80004654:	3c0080e7          	jalr	960(ra) # 80002a10 <copyin>
    80004658:	87aa                	mv	a5,a0
    8000465a:	c399                	beqz	a5,80004660 <fetchaddr+0x62>
    return -1;
    8000465c:	57fd                	li	a5,-1
    8000465e:	a011                	j	80004662 <fetchaddr+0x64>
  return 0;
    80004660:	4781                	li	a5,0
}
    80004662:	853e                	mv	a0,a5
    80004664:	70a2                	ld	ra,40(sp)
    80004666:	7402                	ld	s0,32(sp)
    80004668:	6145                	addi	sp,sp,48
    8000466a:	8082                	ret

000000008000466c <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    8000466c:	7139                	addi	sp,sp,-64
    8000466e:	fc06                	sd	ra,56(sp)
    80004670:	f822                	sd	s0,48(sp)
    80004672:	0080                	addi	s0,sp,64
    80004674:	fca43c23          	sd	a0,-40(s0)
    80004678:	fcb43823          	sd	a1,-48(s0)
    8000467c:	87b2                	mv	a5,a2
    8000467e:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004682:	ffffe097          	auipc	ra,0xffffe
    80004686:	7f6080e7          	jalr	2038(ra) # 80002e78 <myproc>
    8000468a:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    8000468e:	fe843783          	ld	a5,-24(s0)
    80004692:	6bbc                	ld	a5,80(a5)
    80004694:	fcc42703          	lw	a4,-52(s0)
    80004698:	86ba                	mv	a3,a4
    8000469a:	fd843603          	ld	a2,-40(s0)
    8000469e:	fd043583          	ld	a1,-48(s0)
    800046a2:	853e                	mv	a0,a5
    800046a4:	ffffe097          	auipc	ra,0xffffe
    800046a8:	43a080e7          	jalr	1082(ra) # 80002ade <copyinstr>
    800046ac:	87aa                	mv	a5,a0
    800046ae:	0007d463          	bgez	a5,800046b6 <fetchstr+0x4a>
    return -1;
    800046b2:	57fd                	li	a5,-1
    800046b4:	a801                	j	800046c4 <fetchstr+0x58>
  return strlen(buf);
    800046b6:	fd043503          	ld	a0,-48(s0)
    800046ba:	ffffd097          	auipc	ra,0xffffd
    800046be:	200080e7          	jalr	512(ra) # 800018ba <strlen>
    800046c2:	87aa                	mv	a5,a0
}
    800046c4:	853e                	mv	a0,a5
    800046c6:	70e2                	ld	ra,56(sp)
    800046c8:	7442                	ld	s0,48(sp)
    800046ca:	6121                	addi	sp,sp,64
    800046cc:	8082                	ret

00000000800046ce <argraw>:

static uint64
argraw(int n)
{
    800046ce:	7179                	addi	sp,sp,-48
    800046d0:	f406                	sd	ra,40(sp)
    800046d2:	f022                	sd	s0,32(sp)
    800046d4:	1800                	addi	s0,sp,48
    800046d6:	87aa                	mv	a5,a0
    800046d8:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800046dc:	ffffe097          	auipc	ra,0xffffe
    800046e0:	79c080e7          	jalr	1948(ra) # 80002e78 <myproc>
    800046e4:	fea43423          	sd	a0,-24(s0)
    800046e8:	fdc42783          	lw	a5,-36(s0)
    800046ec:	0007871b          	sext.w	a4,a5
    800046f0:	4795                	li	a5,5
    800046f2:	06e7e263          	bltu	a5,a4,80004756 <argraw+0x88>
    800046f6:	fdc46783          	lwu	a5,-36(s0)
    800046fa:	00279713          	slli	a4,a5,0x2
    800046fe:	00008797          	auipc	a5,0x8
    80004702:	cfa78793          	addi	a5,a5,-774 # 8000c3f8 <etext+0x3f8>
    80004706:	97ba                	add	a5,a5,a4
    80004708:	439c                	lw	a5,0(a5)
    8000470a:	0007871b          	sext.w	a4,a5
    8000470e:	00008797          	auipc	a5,0x8
    80004712:	cea78793          	addi	a5,a5,-790 # 8000c3f8 <etext+0x3f8>
    80004716:	97ba                	add	a5,a5,a4
    80004718:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    8000471a:	fe843783          	ld	a5,-24(s0)
    8000471e:	6fbc                	ld	a5,88(a5)
    80004720:	7bbc                	ld	a5,112(a5)
    80004722:	a091                	j	80004766 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004724:	fe843783          	ld	a5,-24(s0)
    80004728:	6fbc                	ld	a5,88(a5)
    8000472a:	7fbc                	ld	a5,120(a5)
    8000472c:	a82d                	j	80004766 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    8000472e:	fe843783          	ld	a5,-24(s0)
    80004732:	6fbc                	ld	a5,88(a5)
    80004734:	63dc                	ld	a5,128(a5)
    80004736:	a805                	j	80004766 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004738:	fe843783          	ld	a5,-24(s0)
    8000473c:	6fbc                	ld	a5,88(a5)
    8000473e:	67dc                	ld	a5,136(a5)
    80004740:	a01d                	j	80004766 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004742:	fe843783          	ld	a5,-24(s0)
    80004746:	6fbc                	ld	a5,88(a5)
    80004748:	6bdc                	ld	a5,144(a5)
    8000474a:	a831                	j	80004766 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000474c:	fe843783          	ld	a5,-24(s0)
    80004750:	6fbc                	ld	a5,88(a5)
    80004752:	6fdc                	ld	a5,152(a5)
    80004754:	a809                	j	80004766 <argraw+0x98>
  }
  panic("argraw");
    80004756:	00008517          	auipc	a0,0x8
    8000475a:	c9a50513          	addi	a0,a0,-870 # 8000c3f0 <etext+0x3f0>
    8000475e:	ffffc097          	auipc	ra,0xffffc
    80004762:	52e080e7          	jalr	1326(ra) # 80000c8c <panic>
  return -1;
}
    80004766:	853e                	mv	a0,a5
    80004768:	70a2                	ld	ra,40(sp)
    8000476a:	7402                	ld	s0,32(sp)
    8000476c:	6145                	addi	sp,sp,48
    8000476e:	8082                	ret

0000000080004770 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    80004770:	1101                	addi	sp,sp,-32
    80004772:	ec06                	sd	ra,24(sp)
    80004774:	e822                	sd	s0,16(sp)
    80004776:	1000                	addi	s0,sp,32
    80004778:	87aa                	mv	a5,a0
    8000477a:	feb43023          	sd	a1,-32(s0)
    8000477e:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004782:	fec42783          	lw	a5,-20(s0)
    80004786:	853e                	mv	a0,a5
    80004788:	00000097          	auipc	ra,0x0
    8000478c:	f46080e7          	jalr	-186(ra) # 800046ce <argraw>
    80004790:	87aa                	mv	a5,a0
    80004792:	0007871b          	sext.w	a4,a5
    80004796:	fe043783          	ld	a5,-32(s0)
    8000479a:	c398                	sw	a4,0(a5)
}
    8000479c:	0001                	nop
    8000479e:	60e2                	ld	ra,24(sp)
    800047a0:	6442                	ld	s0,16(sp)
    800047a2:	6105                	addi	sp,sp,32
    800047a4:	8082                	ret

00000000800047a6 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    800047a6:	1101                	addi	sp,sp,-32
    800047a8:	ec06                	sd	ra,24(sp)
    800047aa:	e822                	sd	s0,16(sp)
    800047ac:	1000                	addi	s0,sp,32
    800047ae:	87aa                	mv	a5,a0
    800047b0:	feb43023          	sd	a1,-32(s0)
    800047b4:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800047b8:	fec42783          	lw	a5,-20(s0)
    800047bc:	853e                	mv	a0,a5
    800047be:	00000097          	auipc	ra,0x0
    800047c2:	f10080e7          	jalr	-240(ra) # 800046ce <argraw>
    800047c6:	872a                	mv	a4,a0
    800047c8:	fe043783          	ld	a5,-32(s0)
    800047cc:	e398                	sd	a4,0(a5)
}
    800047ce:	0001                	nop
    800047d0:	60e2                	ld	ra,24(sp)
    800047d2:	6442                	ld	s0,16(sp)
    800047d4:	6105                	addi	sp,sp,32
    800047d6:	8082                	ret

00000000800047d8 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800047d8:	7179                	addi	sp,sp,-48
    800047da:	f406                	sd	ra,40(sp)
    800047dc:	f022                	sd	s0,32(sp)
    800047de:	1800                	addi	s0,sp,48
    800047e0:	87aa                	mv	a5,a0
    800047e2:	fcb43823          	sd	a1,-48(s0)
    800047e6:	8732                	mv	a4,a2
    800047e8:	fcf42e23          	sw	a5,-36(s0)
    800047ec:	87ba                	mv	a5,a4
    800047ee:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    800047f2:	fe840713          	addi	a4,s0,-24
    800047f6:	fdc42783          	lw	a5,-36(s0)
    800047fa:	85ba                	mv	a1,a4
    800047fc:	853e                	mv	a0,a5
    800047fe:	00000097          	auipc	ra,0x0
    80004802:	fa8080e7          	jalr	-88(ra) # 800047a6 <argaddr>
  return fetchstr(addr, buf, max);
    80004806:	fe843783          	ld	a5,-24(s0)
    8000480a:	fd842703          	lw	a4,-40(s0)
    8000480e:	863a                	mv	a2,a4
    80004810:	fd043583          	ld	a1,-48(s0)
    80004814:	853e                	mv	a0,a5
    80004816:	00000097          	auipc	ra,0x0
    8000481a:	e56080e7          	jalr	-426(ra) # 8000466c <fetchstr>
    8000481e:	87aa                	mv	a5,a0
}
    80004820:	853e                	mv	a0,a5
    80004822:	70a2                	ld	ra,40(sp)
    80004824:	7402                	ld	s0,32(sp)
    80004826:	6145                	addi	sp,sp,48
    80004828:	8082                	ret

000000008000482a <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    8000482a:	7179                	addi	sp,sp,-48
    8000482c:	f406                	sd	ra,40(sp)
    8000482e:	f022                	sd	s0,32(sp)
    80004830:	ec26                	sd	s1,24(sp)
    80004832:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004834:	ffffe097          	auipc	ra,0xffffe
    80004838:	644080e7          	jalr	1604(ra) # 80002e78 <myproc>
    8000483c:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004840:	fd843783          	ld	a5,-40(s0)
    80004844:	6fbc                	ld	a5,88(a5)
    80004846:	77dc                	ld	a5,168(a5)
    80004848:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000484c:	fd442783          	lw	a5,-44(s0)
    80004850:	2781                	sext.w	a5,a5
    80004852:	04f05263          	blez	a5,80004896 <syscall+0x6c>
    80004856:	fd442783          	lw	a5,-44(s0)
    8000485a:	873e                	mv	a4,a5
    8000485c:	47d5                	li	a5,21
    8000485e:	02e7ec63          	bltu	a5,a4,80004896 <syscall+0x6c>
    80004862:	00008717          	auipc	a4,0x8
    80004866:	fee70713          	addi	a4,a4,-18 # 8000c850 <syscalls>
    8000486a:	fd442783          	lw	a5,-44(s0)
    8000486e:	078e                	slli	a5,a5,0x3
    80004870:	97ba                	add	a5,a5,a4
    80004872:	639c                	ld	a5,0(a5)
    80004874:	c38d                	beqz	a5,80004896 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    80004876:	00008717          	auipc	a4,0x8
    8000487a:	fda70713          	addi	a4,a4,-38 # 8000c850 <syscalls>
    8000487e:	fd442783          	lw	a5,-44(s0)
    80004882:	078e                	slli	a5,a5,0x3
    80004884:	97ba                	add	a5,a5,a4
    80004886:	6398                	ld	a4,0(a5)
    80004888:	fd843783          	ld	a5,-40(s0)
    8000488c:	6fa4                	ld	s1,88(a5)
    8000488e:	9702                	jalr	a4
    80004890:	87aa                	mv	a5,a0
    80004892:	f8bc                	sd	a5,112(s1)
    80004894:	a815                	j	800048c8 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    80004896:	fd843783          	ld	a5,-40(s0)
    8000489a:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    8000489c:	fd843783          	ld	a5,-40(s0)
    800048a0:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800048a4:	fd442683          	lw	a3,-44(s0)
    800048a8:	863e                	mv	a2,a5
    800048aa:	85ba                	mv	a1,a4
    800048ac:	00008517          	auipc	a0,0x8
    800048b0:	b6450513          	addi	a0,a0,-1180 # 8000c410 <etext+0x410>
    800048b4:	ffffc097          	auipc	ra,0xffffc
    800048b8:	182080e7          	jalr	386(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    800048bc:	fd843783          	ld	a5,-40(s0)
    800048c0:	6fbc                	ld	a5,88(a5)
    800048c2:	577d                	li	a4,-1
    800048c4:	fbb8                	sd	a4,112(a5)
  }
}
    800048c6:	0001                	nop
    800048c8:	0001                	nop
    800048ca:	70a2                	ld	ra,40(sp)
    800048cc:	7402                	ld	s0,32(sp)
    800048ce:	64e2                	ld	s1,24(sp)
    800048d0:	6145                	addi	sp,sp,48
    800048d2:	8082                	ret

00000000800048d4 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800048d4:	1101                	addi	sp,sp,-32
    800048d6:	ec06                	sd	ra,24(sp)
    800048d8:	e822                	sd	s0,16(sp)
    800048da:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    800048dc:	fec40793          	addi	a5,s0,-20
    800048e0:	85be                	mv	a1,a5
    800048e2:	4501                	li	a0,0
    800048e4:	00000097          	auipc	ra,0x0
    800048e8:	e8c080e7          	jalr	-372(ra) # 80004770 <argint>
  exit(n);
    800048ec:	fec42783          	lw	a5,-20(s0)
    800048f0:	853e                	mv	a0,a5
    800048f2:	fffff097          	auipc	ra,0xfffff
    800048f6:	c78080e7          	jalr	-904(ra) # 8000356a <exit>
  return 0;  // not reached
    800048fa:	4781                	li	a5,0
}
    800048fc:	853e                	mv	a0,a5
    800048fe:	60e2                	ld	ra,24(sp)
    80004900:	6442                	ld	s0,16(sp)
    80004902:	6105                	addi	sp,sp,32
    80004904:	8082                	ret

0000000080004906 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004906:	1141                	addi	sp,sp,-16
    80004908:	e406                	sd	ra,8(sp)
    8000490a:	e022                	sd	s0,0(sp)
    8000490c:	0800                	addi	s0,sp,16
  return myproc()->pid;
    8000490e:	ffffe097          	auipc	ra,0xffffe
    80004912:	56a080e7          	jalr	1386(ra) # 80002e78 <myproc>
    80004916:	87aa                	mv	a5,a0
    80004918:	5b9c                	lw	a5,48(a5)
}
    8000491a:	853e                	mv	a0,a5
    8000491c:	60a2                	ld	ra,8(sp)
    8000491e:	6402                	ld	s0,0(sp)
    80004920:	0141                	addi	sp,sp,16
    80004922:	8082                	ret

0000000080004924 <sys_fork>:

uint64
sys_fork(void)
{
    80004924:	1141                	addi	sp,sp,-16
    80004926:	e406                	sd	ra,8(sp)
    80004928:	e022                	sd	s0,0(sp)
    8000492a:	0800                	addi	s0,sp,16
  return fork();
    8000492c:	fffff097          	auipc	ra,0xfffff
    80004930:	a1c080e7          	jalr	-1508(ra) # 80003348 <fork>
    80004934:	87aa                	mv	a5,a0
}
    80004936:	853e                	mv	a0,a5
    80004938:	60a2                	ld	ra,8(sp)
    8000493a:	6402                	ld	s0,0(sp)
    8000493c:	0141                	addi	sp,sp,16
    8000493e:	8082                	ret

0000000080004940 <sys_wait>:

uint64
sys_wait(void)
{
    80004940:	1101                	addi	sp,sp,-32
    80004942:	ec06                	sd	ra,24(sp)
    80004944:	e822                	sd	s0,16(sp)
    80004946:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    80004948:	fe840793          	addi	a5,s0,-24
    8000494c:	85be                	mv	a1,a5
    8000494e:	4501                	li	a0,0
    80004950:	00000097          	auipc	ra,0x0
    80004954:	e56080e7          	jalr	-426(ra) # 800047a6 <argaddr>
  return wait(p);
    80004958:	fe843783          	ld	a5,-24(s0)
    8000495c:	853e                	mv	a0,a5
    8000495e:	fffff097          	auipc	ra,0xfffff
    80004962:	d48080e7          	jalr	-696(ra) # 800036a6 <wait>
    80004966:	87aa                	mv	a5,a0
}
    80004968:	853e                	mv	a0,a5
    8000496a:	60e2                	ld	ra,24(sp)
    8000496c:	6442                	ld	s0,16(sp)
    8000496e:	6105                	addi	sp,sp,32
    80004970:	8082                	ret

0000000080004972 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004972:	1101                	addi	sp,sp,-32
    80004974:	ec06                	sd	ra,24(sp)
    80004976:	e822                	sd	s0,16(sp)
    80004978:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    8000497a:	fe440793          	addi	a5,s0,-28
    8000497e:	85be                	mv	a1,a5
    80004980:	4501                	li	a0,0
    80004982:	00000097          	auipc	ra,0x0
    80004986:	dee080e7          	jalr	-530(ra) # 80004770 <argint>
  addr = myproc()->sz;
    8000498a:	ffffe097          	auipc	ra,0xffffe
    8000498e:	4ee080e7          	jalr	1262(ra) # 80002e78 <myproc>
    80004992:	87aa                	mv	a5,a0
    80004994:	67bc                	ld	a5,72(a5)
    80004996:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    8000499a:	fe442783          	lw	a5,-28(s0)
    8000499e:	853e                	mv	a0,a5
    800049a0:	fffff097          	auipc	ra,0xfffff
    800049a4:	908080e7          	jalr	-1784(ra) # 800032a8 <growproc>
    800049a8:	87aa                	mv	a5,a0
    800049aa:	0007d463          	bgez	a5,800049b2 <sys_sbrk+0x40>
    return -1;
    800049ae:	57fd                	li	a5,-1
    800049b0:	a019                	j	800049b6 <sys_sbrk+0x44>
  return addr;
    800049b2:	fe843783          	ld	a5,-24(s0)
}
    800049b6:	853e                	mv	a0,a5
    800049b8:	60e2                	ld	ra,24(sp)
    800049ba:	6442                	ld	s0,16(sp)
    800049bc:	6105                	addi	sp,sp,32
    800049be:	8082                	ret

00000000800049c0 <sys_sleep>:

uint64
sys_sleep(void)
{
    800049c0:	1101                	addi	sp,sp,-32
    800049c2:	ec06                	sd	ra,24(sp)
    800049c4:	e822                	sd	s0,16(sp)
    800049c6:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    800049c8:	fe840793          	addi	a5,s0,-24
    800049cc:	85be                	mv	a1,a5
    800049ce:	4501                	li	a0,0
    800049d0:	00000097          	auipc	ra,0x0
    800049d4:	da0080e7          	jalr	-608(ra) # 80004770 <argint>
  acquire(&tickslock);
    800049d8:	0002e517          	auipc	a0,0x2e
    800049dc:	01050513          	addi	a0,a0,16 # 800329e8 <tickslock>
    800049e0:	ffffd097          	auipc	ra,0xffffd
    800049e4:	988080e7          	jalr	-1656(ra) # 80001368 <acquire>
  ticks0 = ticks;
    800049e8:	00008797          	auipc	a5,0x8
    800049ec:	f6078793          	addi	a5,a5,-160 # 8000c948 <ticks>
    800049f0:	439c                	lw	a5,0(a5)
    800049f2:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    800049f6:	a099                	j	80004a3c <sys_sleep+0x7c>
    if(killed(myproc())){
    800049f8:	ffffe097          	auipc	ra,0xffffe
    800049fc:	480080e7          	jalr	1152(ra) # 80002e78 <myproc>
    80004a00:	87aa                	mv	a5,a0
    80004a02:	853e                	mv	a0,a5
    80004a04:	fffff097          	auipc	ra,0xfffff
    80004a08:	244080e7          	jalr	580(ra) # 80003c48 <killed>
    80004a0c:	87aa                	mv	a5,a0
    80004a0e:	cb99                	beqz	a5,80004a24 <sys_sleep+0x64>
      release(&tickslock);
    80004a10:	0002e517          	auipc	a0,0x2e
    80004a14:	fd850513          	addi	a0,a0,-40 # 800329e8 <tickslock>
    80004a18:	ffffd097          	auipc	ra,0xffffd
    80004a1c:	9b4080e7          	jalr	-1612(ra) # 800013cc <release>
      return -1;
    80004a20:	57fd                	li	a5,-1
    80004a22:	a0b1                	j	80004a6e <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004a24:	0002e597          	auipc	a1,0x2e
    80004a28:	fc458593          	addi	a1,a1,-60 # 800329e8 <tickslock>
    80004a2c:	00008517          	auipc	a0,0x8
    80004a30:	f1c50513          	addi	a0,a0,-228 # 8000c948 <ticks>
    80004a34:	fffff097          	auipc	ra,0xfffff
    80004a38:	006080e7          	jalr	6(ra) # 80003a3a <sleep>
  while(ticks - ticks0 < n){
    80004a3c:	00008797          	auipc	a5,0x8
    80004a40:	f0c78793          	addi	a5,a5,-244 # 8000c948 <ticks>
    80004a44:	4398                	lw	a4,0(a5)
    80004a46:	fec42783          	lw	a5,-20(s0)
    80004a4a:	40f707bb          	subw	a5,a4,a5
    80004a4e:	0007871b          	sext.w	a4,a5
    80004a52:	fe842783          	lw	a5,-24(s0)
    80004a56:	2781                	sext.w	a5,a5
    80004a58:	faf760e3          	bltu	a4,a5,800049f8 <sys_sleep+0x38>
  }
  release(&tickslock);
    80004a5c:	0002e517          	auipc	a0,0x2e
    80004a60:	f8c50513          	addi	a0,a0,-116 # 800329e8 <tickslock>
    80004a64:	ffffd097          	auipc	ra,0xffffd
    80004a68:	968080e7          	jalr	-1688(ra) # 800013cc <release>
  return 0;
    80004a6c:	4781                	li	a5,0
}
    80004a6e:	853e                	mv	a0,a5
    80004a70:	60e2                	ld	ra,24(sp)
    80004a72:	6442                	ld	s0,16(sp)
    80004a74:	6105                	addi	sp,sp,32
    80004a76:	8082                	ret

0000000080004a78 <sys_kill>:

uint64
sys_kill(void)
{
    80004a78:	1101                	addi	sp,sp,-32
    80004a7a:	ec06                	sd	ra,24(sp)
    80004a7c:	e822                	sd	s0,16(sp)
    80004a7e:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    80004a80:	fec40793          	addi	a5,s0,-20
    80004a84:	85be                	mv	a1,a5
    80004a86:	4501                	li	a0,0
    80004a88:	00000097          	auipc	ra,0x0
    80004a8c:	ce8080e7          	jalr	-792(ra) # 80004770 <argint>
  return kill(pid);
    80004a90:	fec42783          	lw	a5,-20(s0)
    80004a94:	853e                	mv	a0,a5
    80004a96:	fffff097          	auipc	ra,0xfffff
    80004a9a:	0d8080e7          	jalr	216(ra) # 80003b6e <kill>
    80004a9e:	87aa                	mv	a5,a0
}
    80004aa0:	853e                	mv	a0,a5
    80004aa2:	60e2                	ld	ra,24(sp)
    80004aa4:	6442                	ld	s0,16(sp)
    80004aa6:	6105                	addi	sp,sp,32
    80004aa8:	8082                	ret

0000000080004aaa <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004aaa:	1101                	addi	sp,sp,-32
    80004aac:	ec06                	sd	ra,24(sp)
    80004aae:	e822                	sd	s0,16(sp)
    80004ab0:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004ab2:	0002e517          	auipc	a0,0x2e
    80004ab6:	f3650513          	addi	a0,a0,-202 # 800329e8 <tickslock>
    80004aba:	ffffd097          	auipc	ra,0xffffd
    80004abe:	8ae080e7          	jalr	-1874(ra) # 80001368 <acquire>
  xticks = ticks;
    80004ac2:	00008797          	auipc	a5,0x8
    80004ac6:	e8678793          	addi	a5,a5,-378 # 8000c948 <ticks>
    80004aca:	439c                	lw	a5,0(a5)
    80004acc:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004ad0:	0002e517          	auipc	a0,0x2e
    80004ad4:	f1850513          	addi	a0,a0,-232 # 800329e8 <tickslock>
    80004ad8:	ffffd097          	auipc	ra,0xffffd
    80004adc:	8f4080e7          	jalr	-1804(ra) # 800013cc <release>
  return xticks;
    80004ae0:	fec46783          	lwu	a5,-20(s0)
}
    80004ae4:	853e                	mv	a0,a5
    80004ae6:	60e2                	ld	ra,24(sp)
    80004ae8:	6442                	ld	s0,16(sp)
    80004aea:	6105                	addi	sp,sp,32
    80004aec:	8082                	ret

0000000080004aee <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004aee:	1101                	addi	sp,sp,-32
    80004af0:	ec06                	sd	ra,24(sp)
    80004af2:	e822                	sd	s0,16(sp)
    80004af4:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80004af6:	00008597          	auipc	a1,0x8
    80004afa:	93a58593          	addi	a1,a1,-1734 # 8000c430 <etext+0x430>
    80004afe:	0002e517          	auipc	a0,0x2e
    80004b02:	f0250513          	addi	a0,a0,-254 # 80032a00 <bcache>
    80004b06:	ffffd097          	auipc	ra,0xffffd
    80004b0a:	832080e7          	jalr	-1998(ra) # 80001338 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80004b0e:	0002e717          	auipc	a4,0x2e
    80004b12:	ef270713          	addi	a4,a4,-270 # 80032a00 <bcache>
    80004b16:	67a1                	lui	a5,0x8
    80004b18:	97ba                	add	a5,a5,a4
    80004b1a:	00036717          	auipc	a4,0x36
    80004b1e:	14e70713          	addi	a4,a4,334 # 8003ac68 <bcache+0x8268>
    80004b22:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80004b26:	0002e717          	auipc	a4,0x2e
    80004b2a:	eda70713          	addi	a4,a4,-294 # 80032a00 <bcache>
    80004b2e:	67a1                	lui	a5,0x8
    80004b30:	97ba                	add	a5,a5,a4
    80004b32:	00036717          	auipc	a4,0x36
    80004b36:	13670713          	addi	a4,a4,310 # 8003ac68 <bcache+0x8268>
    80004b3a:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004b3e:	0002e797          	auipc	a5,0x2e
    80004b42:	eda78793          	addi	a5,a5,-294 # 80032a18 <bcache+0x18>
    80004b46:	fef43423          	sd	a5,-24(s0)
    80004b4a:	a895                	j	80004bbe <binit+0xd0>
    b->next = bcache.head.next;
    80004b4c:	0002e717          	auipc	a4,0x2e
    80004b50:	eb470713          	addi	a4,a4,-332 # 80032a00 <bcache>
    80004b54:	67a1                	lui	a5,0x8
    80004b56:	97ba                	add	a5,a5,a4
    80004b58:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b5c:	fe843783          	ld	a5,-24(s0)
    80004b60:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004b62:	fe843783          	ld	a5,-24(s0)
    80004b66:	00036717          	auipc	a4,0x36
    80004b6a:	10270713          	addi	a4,a4,258 # 8003ac68 <bcache+0x8268>
    80004b6e:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004b70:	fe843783          	ld	a5,-24(s0)
    80004b74:	07c1                	addi	a5,a5,16
    80004b76:	00008597          	auipc	a1,0x8
    80004b7a:	8c258593          	addi	a1,a1,-1854 # 8000c438 <etext+0x438>
    80004b7e:	853e                	mv	a0,a5
    80004b80:	00002097          	auipc	ra,0x2
    80004b84:	034080e7          	jalr	52(ra) # 80006bb4 <initsleeplock>
    bcache.head.next->prev = b;
    80004b88:	0002e717          	auipc	a4,0x2e
    80004b8c:	e7870713          	addi	a4,a4,-392 # 80032a00 <bcache>
    80004b90:	67a1                	lui	a5,0x8
    80004b92:	97ba                	add	a5,a5,a4
    80004b94:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b98:	fe843703          	ld	a4,-24(s0)
    80004b9c:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004b9e:	0002e717          	auipc	a4,0x2e
    80004ba2:	e6270713          	addi	a4,a4,-414 # 80032a00 <bcache>
    80004ba6:	67a1                	lui	a5,0x8
    80004ba8:	97ba                	add	a5,a5,a4
    80004baa:	fe843703          	ld	a4,-24(s0)
    80004bae:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004bb2:	fe843783          	ld	a5,-24(s0)
    80004bb6:	45878793          	addi	a5,a5,1112
    80004bba:	fef43423          	sd	a5,-24(s0)
    80004bbe:	00036797          	auipc	a5,0x36
    80004bc2:	0aa78793          	addi	a5,a5,170 # 8003ac68 <bcache+0x8268>
    80004bc6:	fe843703          	ld	a4,-24(s0)
    80004bca:	f8f761e3          	bltu	a4,a5,80004b4c <binit+0x5e>
  }
}
    80004bce:	0001                	nop
    80004bd0:	0001                	nop
    80004bd2:	60e2                	ld	ra,24(sp)
    80004bd4:	6442                	ld	s0,16(sp)
    80004bd6:	6105                	addi	sp,sp,32
    80004bd8:	8082                	ret

0000000080004bda <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80004bda:	7179                	addi	sp,sp,-48
    80004bdc:	f406                	sd	ra,40(sp)
    80004bde:	f022                	sd	s0,32(sp)
    80004be0:	1800                	addi	s0,sp,48
    80004be2:	87aa                	mv	a5,a0
    80004be4:	872e                	mv	a4,a1
    80004be6:	fcf42e23          	sw	a5,-36(s0)
    80004bea:	87ba                	mv	a5,a4
    80004bec:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004bf0:	0002e517          	auipc	a0,0x2e
    80004bf4:	e1050513          	addi	a0,a0,-496 # 80032a00 <bcache>
    80004bf8:	ffffc097          	auipc	ra,0xffffc
    80004bfc:	770080e7          	jalr	1904(ra) # 80001368 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004c00:	0002e717          	auipc	a4,0x2e
    80004c04:	e0070713          	addi	a4,a4,-512 # 80032a00 <bcache>
    80004c08:	67a1                	lui	a5,0x8
    80004c0a:	97ba                	add	a5,a5,a4
    80004c0c:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004c10:	fef43423          	sd	a5,-24(s0)
    80004c14:	a095                	j	80004c78 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80004c16:	fe843783          	ld	a5,-24(s0)
    80004c1a:	4798                	lw	a4,8(a5)
    80004c1c:	fdc42783          	lw	a5,-36(s0)
    80004c20:	2781                	sext.w	a5,a5
    80004c22:	04e79663          	bne	a5,a4,80004c6e <bget+0x94>
    80004c26:	fe843783          	ld	a5,-24(s0)
    80004c2a:	47d8                	lw	a4,12(a5)
    80004c2c:	fd842783          	lw	a5,-40(s0)
    80004c30:	2781                	sext.w	a5,a5
    80004c32:	02e79e63          	bne	a5,a4,80004c6e <bget+0x94>
      b->refcnt++;
    80004c36:	fe843783          	ld	a5,-24(s0)
    80004c3a:	43bc                	lw	a5,64(a5)
    80004c3c:	2785                	addiw	a5,a5,1
    80004c3e:	0007871b          	sext.w	a4,a5
    80004c42:	fe843783          	ld	a5,-24(s0)
    80004c46:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004c48:	0002e517          	auipc	a0,0x2e
    80004c4c:	db850513          	addi	a0,a0,-584 # 80032a00 <bcache>
    80004c50:	ffffc097          	auipc	ra,0xffffc
    80004c54:	77c080e7          	jalr	1916(ra) # 800013cc <release>
      acquiresleep(&b->lock);
    80004c58:	fe843783          	ld	a5,-24(s0)
    80004c5c:	07c1                	addi	a5,a5,16
    80004c5e:	853e                	mv	a0,a5
    80004c60:	00002097          	auipc	ra,0x2
    80004c64:	fa0080e7          	jalr	-96(ra) # 80006c00 <acquiresleep>
      return b;
    80004c68:	fe843783          	ld	a5,-24(s0)
    80004c6c:	a07d                	j	80004d1a <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004c6e:	fe843783          	ld	a5,-24(s0)
    80004c72:	6bbc                	ld	a5,80(a5)
    80004c74:	fef43423          	sd	a5,-24(s0)
    80004c78:	fe843703          	ld	a4,-24(s0)
    80004c7c:	00036797          	auipc	a5,0x36
    80004c80:	fec78793          	addi	a5,a5,-20 # 8003ac68 <bcache+0x8268>
    80004c84:	f8f719e3          	bne	a4,a5,80004c16 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004c88:	0002e717          	auipc	a4,0x2e
    80004c8c:	d7870713          	addi	a4,a4,-648 # 80032a00 <bcache>
    80004c90:	67a1                	lui	a5,0x8
    80004c92:	97ba                	add	a5,a5,a4
    80004c94:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004c98:	fef43423          	sd	a5,-24(s0)
    80004c9c:	a8b9                	j	80004cfa <bget+0x120>
    if(b->refcnt == 0) {
    80004c9e:	fe843783          	ld	a5,-24(s0)
    80004ca2:	43bc                	lw	a5,64(a5)
    80004ca4:	e7b1                	bnez	a5,80004cf0 <bget+0x116>
      b->dev = dev;
    80004ca6:	fe843783          	ld	a5,-24(s0)
    80004caa:	fdc42703          	lw	a4,-36(s0)
    80004cae:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004cb0:	fe843783          	ld	a5,-24(s0)
    80004cb4:	fd842703          	lw	a4,-40(s0)
    80004cb8:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004cba:	fe843783          	ld	a5,-24(s0)
    80004cbe:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004cc2:	fe843783          	ld	a5,-24(s0)
    80004cc6:	4705                	li	a4,1
    80004cc8:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004cca:	0002e517          	auipc	a0,0x2e
    80004cce:	d3650513          	addi	a0,a0,-714 # 80032a00 <bcache>
    80004cd2:	ffffc097          	auipc	ra,0xffffc
    80004cd6:	6fa080e7          	jalr	1786(ra) # 800013cc <release>
      acquiresleep(&b->lock);
    80004cda:	fe843783          	ld	a5,-24(s0)
    80004cde:	07c1                	addi	a5,a5,16
    80004ce0:	853e                	mv	a0,a5
    80004ce2:	00002097          	auipc	ra,0x2
    80004ce6:	f1e080e7          	jalr	-226(ra) # 80006c00 <acquiresleep>
      return b;
    80004cea:	fe843783          	ld	a5,-24(s0)
    80004cee:	a035                	j	80004d1a <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004cf0:	fe843783          	ld	a5,-24(s0)
    80004cf4:	67bc                	ld	a5,72(a5)
    80004cf6:	fef43423          	sd	a5,-24(s0)
    80004cfa:	fe843703          	ld	a4,-24(s0)
    80004cfe:	00036797          	auipc	a5,0x36
    80004d02:	f6a78793          	addi	a5,a5,-150 # 8003ac68 <bcache+0x8268>
    80004d06:	f8f71ce3          	bne	a4,a5,80004c9e <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004d0a:	00007517          	auipc	a0,0x7
    80004d0e:	73650513          	addi	a0,a0,1846 # 8000c440 <etext+0x440>
    80004d12:	ffffc097          	auipc	ra,0xffffc
    80004d16:	f7a080e7          	jalr	-134(ra) # 80000c8c <panic>
}
    80004d1a:	853e                	mv	a0,a5
    80004d1c:	70a2                	ld	ra,40(sp)
    80004d1e:	7402                	ld	s0,32(sp)
    80004d20:	6145                	addi	sp,sp,48
    80004d22:	8082                	ret

0000000080004d24 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004d24:	7179                	addi	sp,sp,-48
    80004d26:	f406                	sd	ra,40(sp)
    80004d28:	f022                	sd	s0,32(sp)
    80004d2a:	1800                	addi	s0,sp,48
    80004d2c:	87aa                	mv	a5,a0
    80004d2e:	872e                	mv	a4,a1
    80004d30:	fcf42e23          	sw	a5,-36(s0)
    80004d34:	87ba                	mv	a5,a4
    80004d36:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004d3a:	fd842703          	lw	a4,-40(s0)
    80004d3e:	fdc42783          	lw	a5,-36(s0)
    80004d42:	85ba                	mv	a1,a4
    80004d44:	853e                	mv	a0,a5
    80004d46:	00000097          	auipc	ra,0x0
    80004d4a:	e94080e7          	jalr	-364(ra) # 80004bda <bget>
    80004d4e:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004d52:	fe843783          	ld	a5,-24(s0)
    80004d56:	439c                	lw	a5,0(a5)
    80004d58:	ef91                	bnez	a5,80004d74 <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    80004d5a:	4681                	li	a3,0
    80004d5c:	4601                	li	a2,0
    80004d5e:	fe843583          	ld	a1,-24(s0)
    80004d62:	4501                	li	a0,0
    80004d64:	00005097          	auipc	ra,0x5
    80004d68:	d1e080e7          	jalr	-738(ra) # 80009a82 <virtio_disk_rw>
    b->valid = 1;
    80004d6c:	fe843783          	ld	a5,-24(s0)
    80004d70:	4705                	li	a4,1
    80004d72:	c398                	sw	a4,0(a5)
  }
  return b;
    80004d74:	fe843783          	ld	a5,-24(s0)
}
    80004d78:	853e                	mv	a0,a5
    80004d7a:	70a2                	ld	ra,40(sp)
    80004d7c:	7402                	ld	s0,32(sp)
    80004d7e:	6145                	addi	sp,sp,48
    80004d80:	8082                	ret

0000000080004d82 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004d82:	1101                	addi	sp,sp,-32
    80004d84:	ec06                	sd	ra,24(sp)
    80004d86:	e822                	sd	s0,16(sp)
    80004d88:	1000                	addi	s0,sp,32
    80004d8a:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004d8e:	fe843783          	ld	a5,-24(s0)
    80004d92:	07c1                	addi	a5,a5,16
    80004d94:	853e                	mv	a0,a5
    80004d96:	00002097          	auipc	ra,0x2
    80004d9a:	f2a080e7          	jalr	-214(ra) # 80006cc0 <holdingsleep>
    80004d9e:	87aa                	mv	a5,a0
    80004da0:	eb89                	bnez	a5,80004db2 <bwrite+0x30>
    panic("bwrite");
    80004da2:	00007517          	auipc	a0,0x7
    80004da6:	6b650513          	addi	a0,a0,1718 # 8000c458 <etext+0x458>
    80004daa:	ffffc097          	auipc	ra,0xffffc
    80004dae:	ee2080e7          	jalr	-286(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    80004db2:	4681                	li	a3,0
    80004db4:	4605                	li	a2,1
    80004db6:	fe843583          	ld	a1,-24(s0)
    80004dba:	4501                	li	a0,0
    80004dbc:	00005097          	auipc	ra,0x5
    80004dc0:	cc6080e7          	jalr	-826(ra) # 80009a82 <virtio_disk_rw>
}
    80004dc4:	0001                	nop
    80004dc6:	60e2                	ld	ra,24(sp)
    80004dc8:	6442                	ld	s0,16(sp)
    80004dca:	6105                	addi	sp,sp,32
    80004dcc:	8082                	ret

0000000080004dce <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004dce:	1101                	addi	sp,sp,-32
    80004dd0:	ec06                	sd	ra,24(sp)
    80004dd2:	e822                	sd	s0,16(sp)
    80004dd4:	1000                	addi	s0,sp,32
    80004dd6:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004dda:	fe843783          	ld	a5,-24(s0)
    80004dde:	07c1                	addi	a5,a5,16
    80004de0:	853e                	mv	a0,a5
    80004de2:	00002097          	auipc	ra,0x2
    80004de6:	ede080e7          	jalr	-290(ra) # 80006cc0 <holdingsleep>
    80004dea:	87aa                	mv	a5,a0
    80004dec:	eb89                	bnez	a5,80004dfe <brelse+0x30>
    panic("brelse");
    80004dee:	00007517          	auipc	a0,0x7
    80004df2:	67250513          	addi	a0,a0,1650 # 8000c460 <etext+0x460>
    80004df6:	ffffc097          	auipc	ra,0xffffc
    80004dfa:	e96080e7          	jalr	-362(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    80004dfe:	fe843783          	ld	a5,-24(s0)
    80004e02:	07c1                	addi	a5,a5,16
    80004e04:	853e                	mv	a0,a5
    80004e06:	00002097          	auipc	ra,0x2
    80004e0a:	e68080e7          	jalr	-408(ra) # 80006c6e <releasesleep>

  acquire(&bcache.lock);
    80004e0e:	0002e517          	auipc	a0,0x2e
    80004e12:	bf250513          	addi	a0,a0,-1038 # 80032a00 <bcache>
    80004e16:	ffffc097          	auipc	ra,0xffffc
    80004e1a:	552080e7          	jalr	1362(ra) # 80001368 <acquire>
  b->refcnt--;
    80004e1e:	fe843783          	ld	a5,-24(s0)
    80004e22:	43bc                	lw	a5,64(a5)
    80004e24:	37fd                	addiw	a5,a5,-1
    80004e26:	0007871b          	sext.w	a4,a5
    80004e2a:	fe843783          	ld	a5,-24(s0)
    80004e2e:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004e30:	fe843783          	ld	a5,-24(s0)
    80004e34:	43bc                	lw	a5,64(a5)
    80004e36:	e7b5                	bnez	a5,80004ea2 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004e38:	fe843783          	ld	a5,-24(s0)
    80004e3c:	6bbc                	ld	a5,80(a5)
    80004e3e:	fe843703          	ld	a4,-24(s0)
    80004e42:	6738                	ld	a4,72(a4)
    80004e44:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004e46:	fe843783          	ld	a5,-24(s0)
    80004e4a:	67bc                	ld	a5,72(a5)
    80004e4c:	fe843703          	ld	a4,-24(s0)
    80004e50:	6b38                	ld	a4,80(a4)
    80004e52:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004e54:	0002e717          	auipc	a4,0x2e
    80004e58:	bac70713          	addi	a4,a4,-1108 # 80032a00 <bcache>
    80004e5c:	67a1                	lui	a5,0x8
    80004e5e:	97ba                	add	a5,a5,a4
    80004e60:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004e64:	fe843783          	ld	a5,-24(s0)
    80004e68:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004e6a:	fe843783          	ld	a5,-24(s0)
    80004e6e:	00036717          	auipc	a4,0x36
    80004e72:	dfa70713          	addi	a4,a4,-518 # 8003ac68 <bcache+0x8268>
    80004e76:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004e78:	0002e717          	auipc	a4,0x2e
    80004e7c:	b8870713          	addi	a4,a4,-1144 # 80032a00 <bcache>
    80004e80:	67a1                	lui	a5,0x8
    80004e82:	97ba                	add	a5,a5,a4
    80004e84:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004e88:	fe843703          	ld	a4,-24(s0)
    80004e8c:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004e8e:	0002e717          	auipc	a4,0x2e
    80004e92:	b7270713          	addi	a4,a4,-1166 # 80032a00 <bcache>
    80004e96:	67a1                	lui	a5,0x8
    80004e98:	97ba                	add	a5,a5,a4
    80004e9a:	fe843703          	ld	a4,-24(s0)
    80004e9e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004ea2:	0002e517          	auipc	a0,0x2e
    80004ea6:	b5e50513          	addi	a0,a0,-1186 # 80032a00 <bcache>
    80004eaa:	ffffc097          	auipc	ra,0xffffc
    80004eae:	522080e7          	jalr	1314(ra) # 800013cc <release>
}
    80004eb2:	0001                	nop
    80004eb4:	60e2                	ld	ra,24(sp)
    80004eb6:	6442                	ld	s0,16(sp)
    80004eb8:	6105                	addi	sp,sp,32
    80004eba:	8082                	ret

0000000080004ebc <bpin>:

void
bpin(struct buf *b) {
    80004ebc:	1101                	addi	sp,sp,-32
    80004ebe:	ec06                	sd	ra,24(sp)
    80004ec0:	e822                	sd	s0,16(sp)
    80004ec2:	1000                	addi	s0,sp,32
    80004ec4:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004ec8:	0002e517          	auipc	a0,0x2e
    80004ecc:	b3850513          	addi	a0,a0,-1224 # 80032a00 <bcache>
    80004ed0:	ffffc097          	auipc	ra,0xffffc
    80004ed4:	498080e7          	jalr	1176(ra) # 80001368 <acquire>
  b->refcnt++;
    80004ed8:	fe843783          	ld	a5,-24(s0)
    80004edc:	43bc                	lw	a5,64(a5)
    80004ede:	2785                	addiw	a5,a5,1
    80004ee0:	0007871b          	sext.w	a4,a5
    80004ee4:	fe843783          	ld	a5,-24(s0)
    80004ee8:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004eea:	0002e517          	auipc	a0,0x2e
    80004eee:	b1650513          	addi	a0,a0,-1258 # 80032a00 <bcache>
    80004ef2:	ffffc097          	auipc	ra,0xffffc
    80004ef6:	4da080e7          	jalr	1242(ra) # 800013cc <release>
}
    80004efa:	0001                	nop
    80004efc:	60e2                	ld	ra,24(sp)
    80004efe:	6442                	ld	s0,16(sp)
    80004f00:	6105                	addi	sp,sp,32
    80004f02:	8082                	ret

0000000080004f04 <bunpin>:

void
bunpin(struct buf *b) {
    80004f04:	1101                	addi	sp,sp,-32
    80004f06:	ec06                	sd	ra,24(sp)
    80004f08:	e822                	sd	s0,16(sp)
    80004f0a:	1000                	addi	s0,sp,32
    80004f0c:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004f10:	0002e517          	auipc	a0,0x2e
    80004f14:	af050513          	addi	a0,a0,-1296 # 80032a00 <bcache>
    80004f18:	ffffc097          	auipc	ra,0xffffc
    80004f1c:	450080e7          	jalr	1104(ra) # 80001368 <acquire>
  b->refcnt--;
    80004f20:	fe843783          	ld	a5,-24(s0)
    80004f24:	43bc                	lw	a5,64(a5)
    80004f26:	37fd                	addiw	a5,a5,-1
    80004f28:	0007871b          	sext.w	a4,a5
    80004f2c:	fe843783          	ld	a5,-24(s0)
    80004f30:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004f32:	0002e517          	auipc	a0,0x2e
    80004f36:	ace50513          	addi	a0,a0,-1330 # 80032a00 <bcache>
    80004f3a:	ffffc097          	auipc	ra,0xffffc
    80004f3e:	492080e7          	jalr	1170(ra) # 800013cc <release>
}
    80004f42:	0001                	nop
    80004f44:	60e2                	ld	ra,24(sp)
    80004f46:	6442                	ld	s0,16(sp)
    80004f48:	6105                	addi	sp,sp,32
    80004f4a:	8082                	ret

0000000080004f4c <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004f4c:	7179                	addi	sp,sp,-48
    80004f4e:	f406                	sd	ra,40(sp)
    80004f50:	f022                	sd	s0,32(sp)
    80004f52:	1800                	addi	s0,sp,48
    80004f54:	87aa                	mv	a5,a0
    80004f56:	fcb43823          	sd	a1,-48(s0)
    80004f5a:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004f5e:	fdc42783          	lw	a5,-36(s0)
    80004f62:	4585                	li	a1,1
    80004f64:	853e                	mv	a0,a5
    80004f66:	00000097          	auipc	ra,0x0
    80004f6a:	dbe080e7          	jalr	-578(ra) # 80004d24 <bread>
    80004f6e:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004f72:	fe843783          	ld	a5,-24(s0)
    80004f76:	05878793          	addi	a5,a5,88
    80004f7a:	02000613          	li	a2,32
    80004f7e:	85be                	mv	a1,a5
    80004f80:	fd043503          	ld	a0,-48(s0)
    80004f84:	ffffc097          	auipc	ra,0xffffc
    80004f88:	69c080e7          	jalr	1692(ra) # 80001620 <memmove>
  brelse(bp);
    80004f8c:	fe843503          	ld	a0,-24(s0)
    80004f90:	00000097          	auipc	ra,0x0
    80004f94:	e3e080e7          	jalr	-450(ra) # 80004dce <brelse>
}
    80004f98:	0001                	nop
    80004f9a:	70a2                	ld	ra,40(sp)
    80004f9c:	7402                	ld	s0,32(sp)
    80004f9e:	6145                	addi	sp,sp,48
    80004fa0:	8082                	ret

0000000080004fa2 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004fa2:	1101                	addi	sp,sp,-32
    80004fa4:	ec06                	sd	ra,24(sp)
    80004fa6:	e822                	sd	s0,16(sp)
    80004fa8:	1000                	addi	s0,sp,32
    80004faa:	87aa                	mv	a5,a0
    80004fac:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004fb0:	fec42783          	lw	a5,-20(s0)
    80004fb4:	00036597          	auipc	a1,0x36
    80004fb8:	10c58593          	addi	a1,a1,268 # 8003b0c0 <sb>
    80004fbc:	853e                	mv	a0,a5
    80004fbe:	00000097          	auipc	ra,0x0
    80004fc2:	f8e080e7          	jalr	-114(ra) # 80004f4c <readsb>
  if(sb.magic != FSMAGIC)
    80004fc6:	00036797          	auipc	a5,0x36
    80004fca:	0fa78793          	addi	a5,a5,250 # 8003b0c0 <sb>
    80004fce:	439c                	lw	a5,0(a5)
    80004fd0:	873e                	mv	a4,a5
    80004fd2:	102037b7          	lui	a5,0x10203
    80004fd6:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004fda:	00f70a63          	beq	a4,a5,80004fee <fsinit+0x4c>
    panic("invalid file system");
    80004fde:	00007517          	auipc	a0,0x7
    80004fe2:	48a50513          	addi	a0,a0,1162 # 8000c468 <etext+0x468>
    80004fe6:	ffffc097          	auipc	ra,0xffffc
    80004fea:	ca6080e7          	jalr	-858(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004fee:	fec42783          	lw	a5,-20(s0)
    80004ff2:	00036597          	auipc	a1,0x36
    80004ff6:	0ce58593          	addi	a1,a1,206 # 8003b0c0 <sb>
    80004ffa:	853e                	mv	a0,a5
    80004ffc:	00001097          	auipc	ra,0x1
    80005000:	49c080e7          	jalr	1180(ra) # 80006498 <initlog>
}
    80005004:	0001                	nop
    80005006:	60e2                	ld	ra,24(sp)
    80005008:	6442                	ld	s0,16(sp)
    8000500a:	6105                	addi	sp,sp,32
    8000500c:	8082                	ret

000000008000500e <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    8000500e:	7179                	addi	sp,sp,-48
    80005010:	f406                	sd	ra,40(sp)
    80005012:	f022                	sd	s0,32(sp)
    80005014:	1800                	addi	s0,sp,48
    80005016:	87aa                	mv	a5,a0
    80005018:	872e                	mv	a4,a1
    8000501a:	fcf42e23          	sw	a5,-36(s0)
    8000501e:	87ba                	mv	a5,a4
    80005020:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80005024:	fdc42783          	lw	a5,-36(s0)
    80005028:	fd842703          	lw	a4,-40(s0)
    8000502c:	85ba                	mv	a1,a4
    8000502e:	853e                	mv	a0,a5
    80005030:	00000097          	auipc	ra,0x0
    80005034:	cf4080e7          	jalr	-780(ra) # 80004d24 <bread>
    80005038:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    8000503c:	fe843783          	ld	a5,-24(s0)
    80005040:	05878793          	addi	a5,a5,88
    80005044:	40000613          	li	a2,1024
    80005048:	4581                	li	a1,0
    8000504a:	853e                	mv	a0,a5
    8000504c:	ffffc097          	auipc	ra,0xffffc
    80005050:	4f0080e7          	jalr	1264(ra) # 8000153c <memset>
  log_write(bp);
    80005054:	fe843503          	ld	a0,-24(s0)
    80005058:	00002097          	auipc	ra,0x2
    8000505c:	a28080e7          	jalr	-1496(ra) # 80006a80 <log_write>
  brelse(bp);
    80005060:	fe843503          	ld	a0,-24(s0)
    80005064:	00000097          	auipc	ra,0x0
    80005068:	d6a080e7          	jalr	-662(ra) # 80004dce <brelse>
}
    8000506c:	0001                	nop
    8000506e:	70a2                	ld	ra,40(sp)
    80005070:	7402                	ld	s0,32(sp)
    80005072:	6145                	addi	sp,sp,48
    80005074:	8082                	ret

0000000080005076 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80005076:	7139                	addi	sp,sp,-64
    80005078:	fc06                	sd	ra,56(sp)
    8000507a:	f822                	sd	s0,48(sp)
    8000507c:	0080                	addi	s0,sp,64
    8000507e:	87aa                	mv	a5,a0
    80005080:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80005084:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80005088:	fe042623          	sw	zero,-20(s0)
    8000508c:	a2b5                	j	800051f8 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    8000508e:	fec42783          	lw	a5,-20(s0)
    80005092:	41f7d71b          	sraiw	a4,a5,0x1f
    80005096:	0137571b          	srliw	a4,a4,0x13
    8000509a:	9fb9                	addw	a5,a5,a4
    8000509c:	40d7d79b          	sraiw	a5,a5,0xd
    800050a0:	2781                	sext.w	a5,a5
    800050a2:	0007871b          	sext.w	a4,a5
    800050a6:	00036797          	auipc	a5,0x36
    800050aa:	01a78793          	addi	a5,a5,26 # 8003b0c0 <sb>
    800050ae:	4fdc                	lw	a5,28(a5)
    800050b0:	9fb9                	addw	a5,a5,a4
    800050b2:	0007871b          	sext.w	a4,a5
    800050b6:	fcc42783          	lw	a5,-52(s0)
    800050ba:	85ba                	mv	a1,a4
    800050bc:	853e                	mv	a0,a5
    800050be:	00000097          	auipc	ra,0x0
    800050c2:	c66080e7          	jalr	-922(ra) # 80004d24 <bread>
    800050c6:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    800050ca:	fe042423          	sw	zero,-24(s0)
    800050ce:	a0dd                	j	800051b4 <balloc+0x13e>
      m = 1 << (bi % 8);
    800050d0:	fe842703          	lw	a4,-24(s0)
    800050d4:	41f7579b          	sraiw	a5,a4,0x1f
    800050d8:	01d7d79b          	srliw	a5,a5,0x1d
    800050dc:	9f3d                	addw	a4,a4,a5
    800050de:	8b1d                	andi	a4,a4,7
    800050e0:	40f707bb          	subw	a5,a4,a5
    800050e4:	2781                	sext.w	a5,a5
    800050e6:	4705                	li	a4,1
    800050e8:	00f717bb          	sllw	a5,a4,a5
    800050ec:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    800050f0:	fe842783          	lw	a5,-24(s0)
    800050f4:	41f7d71b          	sraiw	a4,a5,0x1f
    800050f8:	01d7571b          	srliw	a4,a4,0x1d
    800050fc:	9fb9                	addw	a5,a5,a4
    800050fe:	4037d79b          	sraiw	a5,a5,0x3
    80005102:	2781                	sext.w	a5,a5
    80005104:	fe043703          	ld	a4,-32(s0)
    80005108:	97ba                	add	a5,a5,a4
    8000510a:	0587c783          	lbu	a5,88(a5)
    8000510e:	0007871b          	sext.w	a4,a5
    80005112:	fdc42783          	lw	a5,-36(s0)
    80005116:	8ff9                	and	a5,a5,a4
    80005118:	2781                	sext.w	a5,a5
    8000511a:	ebc1                	bnez	a5,800051aa <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    8000511c:	fe842783          	lw	a5,-24(s0)
    80005120:	41f7d71b          	sraiw	a4,a5,0x1f
    80005124:	01d7571b          	srliw	a4,a4,0x1d
    80005128:	9fb9                	addw	a5,a5,a4
    8000512a:	4037d79b          	sraiw	a5,a5,0x3
    8000512e:	2781                	sext.w	a5,a5
    80005130:	fe043703          	ld	a4,-32(s0)
    80005134:	973e                	add	a4,a4,a5
    80005136:	05874703          	lbu	a4,88(a4)
    8000513a:	0187169b          	slliw	a3,a4,0x18
    8000513e:	4186d69b          	sraiw	a3,a3,0x18
    80005142:	fdc42703          	lw	a4,-36(s0)
    80005146:	0187171b          	slliw	a4,a4,0x18
    8000514a:	4187571b          	sraiw	a4,a4,0x18
    8000514e:	8f55                	or	a4,a4,a3
    80005150:	0187171b          	slliw	a4,a4,0x18
    80005154:	4187571b          	sraiw	a4,a4,0x18
    80005158:	0ff77713          	andi	a4,a4,255
    8000515c:	fe043683          	ld	a3,-32(s0)
    80005160:	97b6                	add	a5,a5,a3
    80005162:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80005166:	fe043503          	ld	a0,-32(s0)
    8000516a:	00002097          	auipc	ra,0x2
    8000516e:	916080e7          	jalr	-1770(ra) # 80006a80 <log_write>
        brelse(bp);
    80005172:	fe043503          	ld	a0,-32(s0)
    80005176:	00000097          	auipc	ra,0x0
    8000517a:	c58080e7          	jalr	-936(ra) # 80004dce <brelse>
        bzero(dev, b + bi);
    8000517e:	fcc42683          	lw	a3,-52(s0)
    80005182:	fec42703          	lw	a4,-20(s0)
    80005186:	fe842783          	lw	a5,-24(s0)
    8000518a:	9fb9                	addw	a5,a5,a4
    8000518c:	2781                	sext.w	a5,a5
    8000518e:	85be                	mv	a1,a5
    80005190:	8536                	mv	a0,a3
    80005192:	00000097          	auipc	ra,0x0
    80005196:	e7c080e7          	jalr	-388(ra) # 8000500e <bzero>
        return b + bi;
    8000519a:	fec42703          	lw	a4,-20(s0)
    8000519e:	fe842783          	lw	a5,-24(s0)
    800051a2:	9fb9                	addw	a5,a5,a4
    800051a4:	2781                	sext.w	a5,a5
    800051a6:	2781                	sext.w	a5,a5
    800051a8:	a895                	j	8000521c <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    800051aa:	fe842783          	lw	a5,-24(s0)
    800051ae:	2785                	addiw	a5,a5,1
    800051b0:	fef42423          	sw	a5,-24(s0)
    800051b4:	fe842783          	lw	a5,-24(s0)
    800051b8:	0007871b          	sext.w	a4,a5
    800051bc:	6789                	lui	a5,0x2
    800051be:	02f75163          	bge	a4,a5,800051e0 <balloc+0x16a>
    800051c2:	fec42703          	lw	a4,-20(s0)
    800051c6:	fe842783          	lw	a5,-24(s0)
    800051ca:	9fb9                	addw	a5,a5,a4
    800051cc:	2781                	sext.w	a5,a5
    800051ce:	0007871b          	sext.w	a4,a5
    800051d2:	00036797          	auipc	a5,0x36
    800051d6:	eee78793          	addi	a5,a5,-274 # 8003b0c0 <sb>
    800051da:	43dc                	lw	a5,4(a5)
    800051dc:	eef76ae3          	bltu	a4,a5,800050d0 <balloc+0x5a>
      }
    }
    brelse(bp);
    800051e0:	fe043503          	ld	a0,-32(s0)
    800051e4:	00000097          	auipc	ra,0x0
    800051e8:	bea080e7          	jalr	-1046(ra) # 80004dce <brelse>
  for(b = 0; b < sb.size; b += BPB){
    800051ec:	fec42703          	lw	a4,-20(s0)
    800051f0:	6789                	lui	a5,0x2
    800051f2:	9fb9                	addw	a5,a5,a4
    800051f4:	fef42623          	sw	a5,-20(s0)
    800051f8:	00036797          	auipc	a5,0x36
    800051fc:	ec878793          	addi	a5,a5,-312 # 8003b0c0 <sb>
    80005200:	43d8                	lw	a4,4(a5)
    80005202:	fec42783          	lw	a5,-20(s0)
    80005206:	e8e7e4e3          	bltu	a5,a4,8000508e <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    8000520a:	00007517          	auipc	a0,0x7
    8000520e:	27650513          	addi	a0,a0,630 # 8000c480 <etext+0x480>
    80005212:	ffffc097          	auipc	ra,0xffffc
    80005216:	824080e7          	jalr	-2012(ra) # 80000a36 <printf>
  return 0;
    8000521a:	4781                	li	a5,0
}
    8000521c:	853e                	mv	a0,a5
    8000521e:	70e2                	ld	ra,56(sp)
    80005220:	7442                	ld	s0,48(sp)
    80005222:	6121                	addi	sp,sp,64
    80005224:	8082                	ret

0000000080005226 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80005226:	7179                	addi	sp,sp,-48
    80005228:	f406                	sd	ra,40(sp)
    8000522a:	f022                	sd	s0,32(sp)
    8000522c:	1800                	addi	s0,sp,48
    8000522e:	87aa                	mv	a5,a0
    80005230:	872e                	mv	a4,a1
    80005232:	fcf42e23          	sw	a5,-36(s0)
    80005236:	87ba                	mv	a5,a4
    80005238:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    8000523c:	fdc42683          	lw	a3,-36(s0)
    80005240:	fd842783          	lw	a5,-40(s0)
    80005244:	00d7d79b          	srliw	a5,a5,0xd
    80005248:	0007871b          	sext.w	a4,a5
    8000524c:	00036797          	auipc	a5,0x36
    80005250:	e7478793          	addi	a5,a5,-396 # 8003b0c0 <sb>
    80005254:	4fdc                	lw	a5,28(a5)
    80005256:	9fb9                	addw	a5,a5,a4
    80005258:	2781                	sext.w	a5,a5
    8000525a:	85be                	mv	a1,a5
    8000525c:	8536                	mv	a0,a3
    8000525e:	00000097          	auipc	ra,0x0
    80005262:	ac6080e7          	jalr	-1338(ra) # 80004d24 <bread>
    80005266:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    8000526a:	fd842703          	lw	a4,-40(s0)
    8000526e:	6789                	lui	a5,0x2
    80005270:	17fd                	addi	a5,a5,-1
    80005272:	8ff9                	and	a5,a5,a4
    80005274:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80005278:	fe442703          	lw	a4,-28(s0)
    8000527c:	41f7579b          	sraiw	a5,a4,0x1f
    80005280:	01d7d79b          	srliw	a5,a5,0x1d
    80005284:	9f3d                	addw	a4,a4,a5
    80005286:	8b1d                	andi	a4,a4,7
    80005288:	40f707bb          	subw	a5,a4,a5
    8000528c:	2781                	sext.w	a5,a5
    8000528e:	4705                	li	a4,1
    80005290:	00f717bb          	sllw	a5,a4,a5
    80005294:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80005298:	fe442783          	lw	a5,-28(s0)
    8000529c:	41f7d71b          	sraiw	a4,a5,0x1f
    800052a0:	01d7571b          	srliw	a4,a4,0x1d
    800052a4:	9fb9                	addw	a5,a5,a4
    800052a6:	4037d79b          	sraiw	a5,a5,0x3
    800052aa:	2781                	sext.w	a5,a5
    800052ac:	fe843703          	ld	a4,-24(s0)
    800052b0:	97ba                	add	a5,a5,a4
    800052b2:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    800052b6:	0007871b          	sext.w	a4,a5
    800052ba:	fe042783          	lw	a5,-32(s0)
    800052be:	8ff9                	and	a5,a5,a4
    800052c0:	2781                	sext.w	a5,a5
    800052c2:	eb89                	bnez	a5,800052d4 <bfree+0xae>
    panic("freeing free block");
    800052c4:	00007517          	auipc	a0,0x7
    800052c8:	1d450513          	addi	a0,a0,468 # 8000c498 <etext+0x498>
    800052cc:	ffffc097          	auipc	ra,0xffffc
    800052d0:	9c0080e7          	jalr	-1600(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    800052d4:	fe442783          	lw	a5,-28(s0)
    800052d8:	41f7d71b          	sraiw	a4,a5,0x1f
    800052dc:	01d7571b          	srliw	a4,a4,0x1d
    800052e0:	9fb9                	addw	a5,a5,a4
    800052e2:	4037d79b          	sraiw	a5,a5,0x3
    800052e6:	2781                	sext.w	a5,a5
    800052e8:	fe843703          	ld	a4,-24(s0)
    800052ec:	973e                	add	a4,a4,a5
    800052ee:	05874703          	lbu	a4,88(a4)
    800052f2:	0187169b          	slliw	a3,a4,0x18
    800052f6:	4186d69b          	sraiw	a3,a3,0x18
    800052fa:	fe042703          	lw	a4,-32(s0)
    800052fe:	0187171b          	slliw	a4,a4,0x18
    80005302:	4187571b          	sraiw	a4,a4,0x18
    80005306:	fff74713          	not	a4,a4
    8000530a:	0187171b          	slliw	a4,a4,0x18
    8000530e:	4187571b          	sraiw	a4,a4,0x18
    80005312:	8f75                	and	a4,a4,a3
    80005314:	0187171b          	slliw	a4,a4,0x18
    80005318:	4187571b          	sraiw	a4,a4,0x18
    8000531c:	0ff77713          	andi	a4,a4,255
    80005320:	fe843683          	ld	a3,-24(s0)
    80005324:	97b6                	add	a5,a5,a3
    80005326:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    8000532a:	fe843503          	ld	a0,-24(s0)
    8000532e:	00001097          	auipc	ra,0x1
    80005332:	752080e7          	jalr	1874(ra) # 80006a80 <log_write>
  brelse(bp);
    80005336:	fe843503          	ld	a0,-24(s0)
    8000533a:	00000097          	auipc	ra,0x0
    8000533e:	a94080e7          	jalr	-1388(ra) # 80004dce <brelse>
}
    80005342:	0001                	nop
    80005344:	70a2                	ld	ra,40(sp)
    80005346:	7402                	ld	s0,32(sp)
    80005348:	6145                	addi	sp,sp,48
    8000534a:	8082                	ret

000000008000534c <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    8000534c:	1101                	addi	sp,sp,-32
    8000534e:	ec06                	sd	ra,24(sp)
    80005350:	e822                	sd	s0,16(sp)
    80005352:	1000                	addi	s0,sp,32
  int i = 0;
    80005354:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80005358:	00007597          	auipc	a1,0x7
    8000535c:	15858593          	addi	a1,a1,344 # 8000c4b0 <etext+0x4b0>
    80005360:	00036517          	auipc	a0,0x36
    80005364:	d8050513          	addi	a0,a0,-640 # 8003b0e0 <itable>
    80005368:	ffffc097          	auipc	ra,0xffffc
    8000536c:	fd0080e7          	jalr	-48(ra) # 80001338 <initlock>
  for(i = 0; i < NINODE; i++) {
    80005370:	fe042623          	sw	zero,-20(s0)
    80005374:	a82d                	j	800053ae <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80005376:	fec42703          	lw	a4,-20(s0)
    8000537a:	87ba                	mv	a5,a4
    8000537c:	0792                	slli	a5,a5,0x4
    8000537e:	97ba                	add	a5,a5,a4
    80005380:	078e                	slli	a5,a5,0x3
    80005382:	02078713          	addi	a4,a5,32
    80005386:	00036797          	auipc	a5,0x36
    8000538a:	d5a78793          	addi	a5,a5,-678 # 8003b0e0 <itable>
    8000538e:	97ba                	add	a5,a5,a4
    80005390:	07a1                	addi	a5,a5,8
    80005392:	00007597          	auipc	a1,0x7
    80005396:	12658593          	addi	a1,a1,294 # 8000c4b8 <etext+0x4b8>
    8000539a:	853e                	mv	a0,a5
    8000539c:	00002097          	auipc	ra,0x2
    800053a0:	818080e7          	jalr	-2024(ra) # 80006bb4 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    800053a4:	fec42783          	lw	a5,-20(s0)
    800053a8:	2785                	addiw	a5,a5,1
    800053aa:	fef42623          	sw	a5,-20(s0)
    800053ae:	fec42783          	lw	a5,-20(s0)
    800053b2:	0007871b          	sext.w	a4,a5
    800053b6:	03100793          	li	a5,49
    800053ba:	fae7dee3          	bge	a5,a4,80005376 <iinit+0x2a>
  }
}
    800053be:	0001                	nop
    800053c0:	0001                	nop
    800053c2:	60e2                	ld	ra,24(sp)
    800053c4:	6442                	ld	s0,16(sp)
    800053c6:	6105                	addi	sp,sp,32
    800053c8:	8082                	ret

00000000800053ca <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    800053ca:	7139                	addi	sp,sp,-64
    800053cc:	fc06                	sd	ra,56(sp)
    800053ce:	f822                	sd	s0,48(sp)
    800053d0:	0080                	addi	s0,sp,64
    800053d2:	87aa                	mv	a5,a0
    800053d4:	872e                	mv	a4,a1
    800053d6:	fcf42623          	sw	a5,-52(s0)
    800053da:	87ba                	mv	a5,a4
    800053dc:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    800053e0:	4785                	li	a5,1
    800053e2:	fef42623          	sw	a5,-20(s0)
    800053e6:	a855                	j	8000549a <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    800053e8:	fec42783          	lw	a5,-20(s0)
    800053ec:	8391                	srli	a5,a5,0x4
    800053ee:	0007871b          	sext.w	a4,a5
    800053f2:	00036797          	auipc	a5,0x36
    800053f6:	cce78793          	addi	a5,a5,-818 # 8003b0c0 <sb>
    800053fa:	4f9c                	lw	a5,24(a5)
    800053fc:	9fb9                	addw	a5,a5,a4
    800053fe:	0007871b          	sext.w	a4,a5
    80005402:	fcc42783          	lw	a5,-52(s0)
    80005406:	85ba                	mv	a1,a4
    80005408:	853e                	mv	a0,a5
    8000540a:	00000097          	auipc	ra,0x0
    8000540e:	91a080e7          	jalr	-1766(ra) # 80004d24 <bread>
    80005412:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80005416:	fe043783          	ld	a5,-32(s0)
    8000541a:	05878713          	addi	a4,a5,88
    8000541e:	fec42783          	lw	a5,-20(s0)
    80005422:	8bbd                	andi	a5,a5,15
    80005424:	079a                	slli	a5,a5,0x6
    80005426:	97ba                	add	a5,a5,a4
    80005428:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    8000542c:	fd843783          	ld	a5,-40(s0)
    80005430:	00079783          	lh	a5,0(a5)
    80005434:	eba1                	bnez	a5,80005484 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80005436:	04000613          	li	a2,64
    8000543a:	4581                	li	a1,0
    8000543c:	fd843503          	ld	a0,-40(s0)
    80005440:	ffffc097          	auipc	ra,0xffffc
    80005444:	0fc080e7          	jalr	252(ra) # 8000153c <memset>
      dip->type = type;
    80005448:	fd843783          	ld	a5,-40(s0)
    8000544c:	fca45703          	lhu	a4,-54(s0)
    80005450:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005454:	fe043503          	ld	a0,-32(s0)
    80005458:	00001097          	auipc	ra,0x1
    8000545c:	628080e7          	jalr	1576(ra) # 80006a80 <log_write>
      brelse(bp);
    80005460:	fe043503          	ld	a0,-32(s0)
    80005464:	00000097          	auipc	ra,0x0
    80005468:	96a080e7          	jalr	-1686(ra) # 80004dce <brelse>
      return iget(dev, inum);
    8000546c:	fec42703          	lw	a4,-20(s0)
    80005470:	fcc42783          	lw	a5,-52(s0)
    80005474:	85ba                	mv	a1,a4
    80005476:	853e                	mv	a0,a5
    80005478:	00000097          	auipc	ra,0x0
    8000547c:	138080e7          	jalr	312(ra) # 800055b0 <iget>
    80005480:	87aa                	mv	a5,a0
    80005482:	a835                	j	800054be <ialloc+0xf4>
    }
    brelse(bp);
    80005484:	fe043503          	ld	a0,-32(s0)
    80005488:	00000097          	auipc	ra,0x0
    8000548c:	946080e7          	jalr	-1722(ra) # 80004dce <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80005490:	fec42783          	lw	a5,-20(s0)
    80005494:	2785                	addiw	a5,a5,1
    80005496:	fef42623          	sw	a5,-20(s0)
    8000549a:	00036797          	auipc	a5,0x36
    8000549e:	c2678793          	addi	a5,a5,-986 # 8003b0c0 <sb>
    800054a2:	47d8                	lw	a4,12(a5)
    800054a4:	fec42783          	lw	a5,-20(s0)
    800054a8:	f4e7e0e3          	bltu	a5,a4,800053e8 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    800054ac:	00007517          	auipc	a0,0x7
    800054b0:	01450513          	addi	a0,a0,20 # 8000c4c0 <etext+0x4c0>
    800054b4:	ffffb097          	auipc	ra,0xffffb
    800054b8:	582080e7          	jalr	1410(ra) # 80000a36 <printf>
  return 0;
    800054bc:	4781                	li	a5,0
}
    800054be:	853e                	mv	a0,a5
    800054c0:	70e2                	ld	ra,56(sp)
    800054c2:	7442                	ld	s0,48(sp)
    800054c4:	6121                	addi	sp,sp,64
    800054c6:	8082                	ret

00000000800054c8 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    800054c8:	7179                	addi	sp,sp,-48
    800054ca:	f406                	sd	ra,40(sp)
    800054cc:	f022                	sd	s0,32(sp)
    800054ce:	1800                	addi	s0,sp,48
    800054d0:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800054d4:	fd843783          	ld	a5,-40(s0)
    800054d8:	4394                	lw	a3,0(a5)
    800054da:	fd843783          	ld	a5,-40(s0)
    800054de:	43dc                	lw	a5,4(a5)
    800054e0:	0047d79b          	srliw	a5,a5,0x4
    800054e4:	0007871b          	sext.w	a4,a5
    800054e8:	00036797          	auipc	a5,0x36
    800054ec:	bd878793          	addi	a5,a5,-1064 # 8003b0c0 <sb>
    800054f0:	4f9c                	lw	a5,24(a5)
    800054f2:	9fb9                	addw	a5,a5,a4
    800054f4:	2781                	sext.w	a5,a5
    800054f6:	85be                	mv	a1,a5
    800054f8:	8536                	mv	a0,a3
    800054fa:	00000097          	auipc	ra,0x0
    800054fe:	82a080e7          	jalr	-2006(ra) # 80004d24 <bread>
    80005502:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005506:	fe843783          	ld	a5,-24(s0)
    8000550a:	05878713          	addi	a4,a5,88
    8000550e:	fd843783          	ld	a5,-40(s0)
    80005512:	43dc                	lw	a5,4(a5)
    80005514:	1782                	slli	a5,a5,0x20
    80005516:	9381                	srli	a5,a5,0x20
    80005518:	8bbd                	andi	a5,a5,15
    8000551a:	079a                	slli	a5,a5,0x6
    8000551c:	97ba                	add	a5,a5,a4
    8000551e:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80005522:	fd843783          	ld	a5,-40(s0)
    80005526:	04479703          	lh	a4,68(a5)
    8000552a:	fe043783          	ld	a5,-32(s0)
    8000552e:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80005532:	fd843783          	ld	a5,-40(s0)
    80005536:	04679703          	lh	a4,70(a5)
    8000553a:	fe043783          	ld	a5,-32(s0)
    8000553e:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80005542:	fd843783          	ld	a5,-40(s0)
    80005546:	04879703          	lh	a4,72(a5)
    8000554a:	fe043783          	ld	a5,-32(s0)
    8000554e:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80005552:	fd843783          	ld	a5,-40(s0)
    80005556:	04a79703          	lh	a4,74(a5)
    8000555a:	fe043783          	ld	a5,-32(s0)
    8000555e:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80005562:	fd843783          	ld	a5,-40(s0)
    80005566:	47f8                	lw	a4,76(a5)
    80005568:	fe043783          	ld	a5,-32(s0)
    8000556c:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    8000556e:	fe043783          	ld	a5,-32(s0)
    80005572:	00c78713          	addi	a4,a5,12
    80005576:	fd843783          	ld	a5,-40(s0)
    8000557a:	05078793          	addi	a5,a5,80
    8000557e:	03400613          	li	a2,52
    80005582:	85be                	mv	a1,a5
    80005584:	853a                	mv	a0,a4
    80005586:	ffffc097          	auipc	ra,0xffffc
    8000558a:	09a080e7          	jalr	154(ra) # 80001620 <memmove>
  log_write(bp);
    8000558e:	fe843503          	ld	a0,-24(s0)
    80005592:	00001097          	auipc	ra,0x1
    80005596:	4ee080e7          	jalr	1262(ra) # 80006a80 <log_write>
  brelse(bp);
    8000559a:	fe843503          	ld	a0,-24(s0)
    8000559e:	00000097          	auipc	ra,0x0
    800055a2:	830080e7          	jalr	-2000(ra) # 80004dce <brelse>
}
    800055a6:	0001                	nop
    800055a8:	70a2                	ld	ra,40(sp)
    800055aa:	7402                	ld	s0,32(sp)
    800055ac:	6145                	addi	sp,sp,48
    800055ae:	8082                	ret

00000000800055b0 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    800055b0:	7179                	addi	sp,sp,-48
    800055b2:	f406                	sd	ra,40(sp)
    800055b4:	f022                	sd	s0,32(sp)
    800055b6:	1800                	addi	s0,sp,48
    800055b8:	87aa                	mv	a5,a0
    800055ba:	872e                	mv	a4,a1
    800055bc:	fcf42e23          	sw	a5,-36(s0)
    800055c0:	87ba                	mv	a5,a4
    800055c2:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    800055c6:	00036517          	auipc	a0,0x36
    800055ca:	b1a50513          	addi	a0,a0,-1254 # 8003b0e0 <itable>
    800055ce:	ffffc097          	auipc	ra,0xffffc
    800055d2:	d9a080e7          	jalr	-614(ra) # 80001368 <acquire>

  // Is the inode already in the table?
  empty = 0;
    800055d6:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800055da:	00036797          	auipc	a5,0x36
    800055de:	b1e78793          	addi	a5,a5,-1250 # 8003b0f8 <itable+0x18>
    800055e2:	fef43423          	sd	a5,-24(s0)
    800055e6:	a89d                	j	8000565c <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800055e8:	fe843783          	ld	a5,-24(s0)
    800055ec:	479c                	lw	a5,8(a5)
    800055ee:	04f05663          	blez	a5,8000563a <iget+0x8a>
    800055f2:	fe843783          	ld	a5,-24(s0)
    800055f6:	4398                	lw	a4,0(a5)
    800055f8:	fdc42783          	lw	a5,-36(s0)
    800055fc:	2781                	sext.w	a5,a5
    800055fe:	02e79e63          	bne	a5,a4,8000563a <iget+0x8a>
    80005602:	fe843783          	ld	a5,-24(s0)
    80005606:	43d8                	lw	a4,4(a5)
    80005608:	fd842783          	lw	a5,-40(s0)
    8000560c:	2781                	sext.w	a5,a5
    8000560e:	02e79663          	bne	a5,a4,8000563a <iget+0x8a>
      ip->ref++;
    80005612:	fe843783          	ld	a5,-24(s0)
    80005616:	479c                	lw	a5,8(a5)
    80005618:	2785                	addiw	a5,a5,1
    8000561a:	0007871b          	sext.w	a4,a5
    8000561e:	fe843783          	ld	a5,-24(s0)
    80005622:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80005624:	00036517          	auipc	a0,0x36
    80005628:	abc50513          	addi	a0,a0,-1348 # 8003b0e0 <itable>
    8000562c:	ffffc097          	auipc	ra,0xffffc
    80005630:	da0080e7          	jalr	-608(ra) # 800013cc <release>
      return ip;
    80005634:	fe843783          	ld	a5,-24(s0)
    80005638:	a069                	j	800056c2 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    8000563a:	fe043783          	ld	a5,-32(s0)
    8000563e:	eb89                	bnez	a5,80005650 <iget+0xa0>
    80005640:	fe843783          	ld	a5,-24(s0)
    80005644:	479c                	lw	a5,8(a5)
    80005646:	e789                	bnez	a5,80005650 <iget+0xa0>
      empty = ip;
    80005648:	fe843783          	ld	a5,-24(s0)
    8000564c:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005650:	fe843783          	ld	a5,-24(s0)
    80005654:	08878793          	addi	a5,a5,136
    80005658:	fef43423          	sd	a5,-24(s0)
    8000565c:	fe843703          	ld	a4,-24(s0)
    80005660:	00037797          	auipc	a5,0x37
    80005664:	52878793          	addi	a5,a5,1320 # 8003cb88 <log>
    80005668:	f8f760e3          	bltu	a4,a5,800055e8 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    8000566c:	fe043783          	ld	a5,-32(s0)
    80005670:	eb89                	bnez	a5,80005682 <iget+0xd2>
    panic("iget: no inodes");
    80005672:	00007517          	auipc	a0,0x7
    80005676:	e6650513          	addi	a0,a0,-410 # 8000c4d8 <etext+0x4d8>
    8000567a:	ffffb097          	auipc	ra,0xffffb
    8000567e:	612080e7          	jalr	1554(ra) # 80000c8c <panic>

  ip = empty;
    80005682:	fe043783          	ld	a5,-32(s0)
    80005686:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    8000568a:	fe843783          	ld	a5,-24(s0)
    8000568e:	fdc42703          	lw	a4,-36(s0)
    80005692:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    80005694:	fe843783          	ld	a5,-24(s0)
    80005698:	fd842703          	lw	a4,-40(s0)
    8000569c:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    8000569e:	fe843783          	ld	a5,-24(s0)
    800056a2:	4705                	li	a4,1
    800056a4:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800056a6:	fe843783          	ld	a5,-24(s0)
    800056aa:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    800056ae:	00036517          	auipc	a0,0x36
    800056b2:	a3250513          	addi	a0,a0,-1486 # 8003b0e0 <itable>
    800056b6:	ffffc097          	auipc	ra,0xffffc
    800056ba:	d16080e7          	jalr	-746(ra) # 800013cc <release>

  return ip;
    800056be:	fe843783          	ld	a5,-24(s0)
}
    800056c2:	853e                	mv	a0,a5
    800056c4:	70a2                	ld	ra,40(sp)
    800056c6:	7402                	ld	s0,32(sp)
    800056c8:	6145                	addi	sp,sp,48
    800056ca:	8082                	ret

00000000800056cc <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800056cc:	1101                	addi	sp,sp,-32
    800056ce:	ec06                	sd	ra,24(sp)
    800056d0:	e822                	sd	s0,16(sp)
    800056d2:	1000                	addi	s0,sp,32
    800056d4:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800056d8:	00036517          	auipc	a0,0x36
    800056dc:	a0850513          	addi	a0,a0,-1528 # 8003b0e0 <itable>
    800056e0:	ffffc097          	auipc	ra,0xffffc
    800056e4:	c88080e7          	jalr	-888(ra) # 80001368 <acquire>
  ip->ref++;
    800056e8:	fe843783          	ld	a5,-24(s0)
    800056ec:	479c                	lw	a5,8(a5)
    800056ee:	2785                	addiw	a5,a5,1
    800056f0:	0007871b          	sext.w	a4,a5
    800056f4:	fe843783          	ld	a5,-24(s0)
    800056f8:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800056fa:	00036517          	auipc	a0,0x36
    800056fe:	9e650513          	addi	a0,a0,-1562 # 8003b0e0 <itable>
    80005702:	ffffc097          	auipc	ra,0xffffc
    80005706:	cca080e7          	jalr	-822(ra) # 800013cc <release>
  return ip;
    8000570a:	fe843783          	ld	a5,-24(s0)
}
    8000570e:	853e                	mv	a0,a5
    80005710:	60e2                	ld	ra,24(sp)
    80005712:	6442                	ld	s0,16(sp)
    80005714:	6105                	addi	sp,sp,32
    80005716:	8082                	ret

0000000080005718 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005718:	7179                	addi	sp,sp,-48
    8000571a:	f406                	sd	ra,40(sp)
    8000571c:	f022                	sd	s0,32(sp)
    8000571e:	1800                	addi	s0,sp,48
    80005720:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    80005724:	fd843783          	ld	a5,-40(s0)
    80005728:	c791                	beqz	a5,80005734 <ilock+0x1c>
    8000572a:	fd843783          	ld	a5,-40(s0)
    8000572e:	479c                	lw	a5,8(a5)
    80005730:	00f04a63          	bgtz	a5,80005744 <ilock+0x2c>
    panic("ilock");
    80005734:	00007517          	auipc	a0,0x7
    80005738:	db450513          	addi	a0,a0,-588 # 8000c4e8 <etext+0x4e8>
    8000573c:	ffffb097          	auipc	ra,0xffffb
    80005740:	550080e7          	jalr	1360(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    80005744:	fd843783          	ld	a5,-40(s0)
    80005748:	07c1                	addi	a5,a5,16
    8000574a:	853e                	mv	a0,a5
    8000574c:	00001097          	auipc	ra,0x1
    80005750:	4b4080e7          	jalr	1204(ra) # 80006c00 <acquiresleep>

  if(ip->valid == 0){
    80005754:	fd843783          	ld	a5,-40(s0)
    80005758:	43bc                	lw	a5,64(a5)
    8000575a:	e7e5                	bnez	a5,80005842 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000575c:	fd843783          	ld	a5,-40(s0)
    80005760:	4394                	lw	a3,0(a5)
    80005762:	fd843783          	ld	a5,-40(s0)
    80005766:	43dc                	lw	a5,4(a5)
    80005768:	0047d79b          	srliw	a5,a5,0x4
    8000576c:	0007871b          	sext.w	a4,a5
    80005770:	00036797          	auipc	a5,0x36
    80005774:	95078793          	addi	a5,a5,-1712 # 8003b0c0 <sb>
    80005778:	4f9c                	lw	a5,24(a5)
    8000577a:	9fb9                	addw	a5,a5,a4
    8000577c:	2781                	sext.w	a5,a5
    8000577e:	85be                	mv	a1,a5
    80005780:	8536                	mv	a0,a3
    80005782:	fffff097          	auipc	ra,0xfffff
    80005786:	5a2080e7          	jalr	1442(ra) # 80004d24 <bread>
    8000578a:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000578e:	fe843783          	ld	a5,-24(s0)
    80005792:	05878713          	addi	a4,a5,88
    80005796:	fd843783          	ld	a5,-40(s0)
    8000579a:	43dc                	lw	a5,4(a5)
    8000579c:	1782                	slli	a5,a5,0x20
    8000579e:	9381                	srli	a5,a5,0x20
    800057a0:	8bbd                	andi	a5,a5,15
    800057a2:	079a                	slli	a5,a5,0x6
    800057a4:	97ba                	add	a5,a5,a4
    800057a6:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800057aa:	fe043783          	ld	a5,-32(s0)
    800057ae:	00079703          	lh	a4,0(a5)
    800057b2:	fd843783          	ld	a5,-40(s0)
    800057b6:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800057ba:	fe043783          	ld	a5,-32(s0)
    800057be:	00279703          	lh	a4,2(a5)
    800057c2:	fd843783          	ld	a5,-40(s0)
    800057c6:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800057ca:	fe043783          	ld	a5,-32(s0)
    800057ce:	00479703          	lh	a4,4(a5)
    800057d2:	fd843783          	ld	a5,-40(s0)
    800057d6:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800057da:	fe043783          	ld	a5,-32(s0)
    800057de:	00679703          	lh	a4,6(a5)
    800057e2:	fd843783          	ld	a5,-40(s0)
    800057e6:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800057ea:	fe043783          	ld	a5,-32(s0)
    800057ee:	4798                	lw	a4,8(a5)
    800057f0:	fd843783          	ld	a5,-40(s0)
    800057f4:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800057f6:	fd843783          	ld	a5,-40(s0)
    800057fa:	05078713          	addi	a4,a5,80
    800057fe:	fe043783          	ld	a5,-32(s0)
    80005802:	07b1                	addi	a5,a5,12
    80005804:	03400613          	li	a2,52
    80005808:	85be                	mv	a1,a5
    8000580a:	853a                	mv	a0,a4
    8000580c:	ffffc097          	auipc	ra,0xffffc
    80005810:	e14080e7          	jalr	-492(ra) # 80001620 <memmove>
    brelse(bp);
    80005814:	fe843503          	ld	a0,-24(s0)
    80005818:	fffff097          	auipc	ra,0xfffff
    8000581c:	5b6080e7          	jalr	1462(ra) # 80004dce <brelse>
    ip->valid = 1;
    80005820:	fd843783          	ld	a5,-40(s0)
    80005824:	4705                	li	a4,1
    80005826:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005828:	fd843783          	ld	a5,-40(s0)
    8000582c:	04479783          	lh	a5,68(a5)
    80005830:	eb89                	bnez	a5,80005842 <ilock+0x12a>
      panic("ilock: no type");
    80005832:	00007517          	auipc	a0,0x7
    80005836:	cbe50513          	addi	a0,a0,-834 # 8000c4f0 <etext+0x4f0>
    8000583a:	ffffb097          	auipc	ra,0xffffb
    8000583e:	452080e7          	jalr	1106(ra) # 80000c8c <panic>
  }
}
    80005842:	0001                	nop
    80005844:	70a2                	ld	ra,40(sp)
    80005846:	7402                	ld	s0,32(sp)
    80005848:	6145                	addi	sp,sp,48
    8000584a:	8082                	ret

000000008000584c <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    8000584c:	1101                	addi	sp,sp,-32
    8000584e:	ec06                	sd	ra,24(sp)
    80005850:	e822                	sd	s0,16(sp)
    80005852:	1000                	addi	s0,sp,32
    80005854:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005858:	fe843783          	ld	a5,-24(s0)
    8000585c:	c385                	beqz	a5,8000587c <iunlock+0x30>
    8000585e:	fe843783          	ld	a5,-24(s0)
    80005862:	07c1                	addi	a5,a5,16
    80005864:	853e                	mv	a0,a5
    80005866:	00001097          	auipc	ra,0x1
    8000586a:	45a080e7          	jalr	1114(ra) # 80006cc0 <holdingsleep>
    8000586e:	87aa                	mv	a5,a0
    80005870:	c791                	beqz	a5,8000587c <iunlock+0x30>
    80005872:	fe843783          	ld	a5,-24(s0)
    80005876:	479c                	lw	a5,8(a5)
    80005878:	00f04a63          	bgtz	a5,8000588c <iunlock+0x40>
    panic("iunlock");
    8000587c:	00007517          	auipc	a0,0x7
    80005880:	c8450513          	addi	a0,a0,-892 # 8000c500 <etext+0x500>
    80005884:	ffffb097          	auipc	ra,0xffffb
    80005888:	408080e7          	jalr	1032(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    8000588c:	fe843783          	ld	a5,-24(s0)
    80005890:	07c1                	addi	a5,a5,16
    80005892:	853e                	mv	a0,a5
    80005894:	00001097          	auipc	ra,0x1
    80005898:	3da080e7          	jalr	986(ra) # 80006c6e <releasesleep>
}
    8000589c:	0001                	nop
    8000589e:	60e2                	ld	ra,24(sp)
    800058a0:	6442                	ld	s0,16(sp)
    800058a2:	6105                	addi	sp,sp,32
    800058a4:	8082                	ret

00000000800058a6 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800058a6:	1101                	addi	sp,sp,-32
    800058a8:	ec06                	sd	ra,24(sp)
    800058aa:	e822                	sd	s0,16(sp)
    800058ac:	1000                	addi	s0,sp,32
    800058ae:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800058b2:	00036517          	auipc	a0,0x36
    800058b6:	82e50513          	addi	a0,a0,-2002 # 8003b0e0 <itable>
    800058ba:	ffffc097          	auipc	ra,0xffffc
    800058be:	aae080e7          	jalr	-1362(ra) # 80001368 <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800058c2:	fe843783          	ld	a5,-24(s0)
    800058c6:	479c                	lw	a5,8(a5)
    800058c8:	873e                	mv	a4,a5
    800058ca:	4785                	li	a5,1
    800058cc:	06f71f63          	bne	a4,a5,8000594a <iput+0xa4>
    800058d0:	fe843783          	ld	a5,-24(s0)
    800058d4:	43bc                	lw	a5,64(a5)
    800058d6:	cbb5                	beqz	a5,8000594a <iput+0xa4>
    800058d8:	fe843783          	ld	a5,-24(s0)
    800058dc:	04a79783          	lh	a5,74(a5)
    800058e0:	e7ad                	bnez	a5,8000594a <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800058e2:	fe843783          	ld	a5,-24(s0)
    800058e6:	07c1                	addi	a5,a5,16
    800058e8:	853e                	mv	a0,a5
    800058ea:	00001097          	auipc	ra,0x1
    800058ee:	316080e7          	jalr	790(ra) # 80006c00 <acquiresleep>

    release(&itable.lock);
    800058f2:	00035517          	auipc	a0,0x35
    800058f6:	7ee50513          	addi	a0,a0,2030 # 8003b0e0 <itable>
    800058fa:	ffffc097          	auipc	ra,0xffffc
    800058fe:	ad2080e7          	jalr	-1326(ra) # 800013cc <release>

    itrunc(ip);
    80005902:	fe843503          	ld	a0,-24(s0)
    80005906:	00000097          	auipc	ra,0x0
    8000590a:	21a080e7          	jalr	538(ra) # 80005b20 <itrunc>
    ip->type = 0;
    8000590e:	fe843783          	ld	a5,-24(s0)
    80005912:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005916:	fe843503          	ld	a0,-24(s0)
    8000591a:	00000097          	auipc	ra,0x0
    8000591e:	bae080e7          	jalr	-1106(ra) # 800054c8 <iupdate>
    ip->valid = 0;
    80005922:	fe843783          	ld	a5,-24(s0)
    80005926:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    8000592a:	fe843783          	ld	a5,-24(s0)
    8000592e:	07c1                	addi	a5,a5,16
    80005930:	853e                	mv	a0,a5
    80005932:	00001097          	auipc	ra,0x1
    80005936:	33c080e7          	jalr	828(ra) # 80006c6e <releasesleep>

    acquire(&itable.lock);
    8000593a:	00035517          	auipc	a0,0x35
    8000593e:	7a650513          	addi	a0,a0,1958 # 8003b0e0 <itable>
    80005942:	ffffc097          	auipc	ra,0xffffc
    80005946:	a26080e7          	jalr	-1498(ra) # 80001368 <acquire>
  }

  ip->ref--;
    8000594a:	fe843783          	ld	a5,-24(s0)
    8000594e:	479c                	lw	a5,8(a5)
    80005950:	37fd                	addiw	a5,a5,-1
    80005952:	0007871b          	sext.w	a4,a5
    80005956:	fe843783          	ld	a5,-24(s0)
    8000595a:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000595c:	00035517          	auipc	a0,0x35
    80005960:	78450513          	addi	a0,a0,1924 # 8003b0e0 <itable>
    80005964:	ffffc097          	auipc	ra,0xffffc
    80005968:	a68080e7          	jalr	-1432(ra) # 800013cc <release>
}
    8000596c:	0001                	nop
    8000596e:	60e2                	ld	ra,24(sp)
    80005970:	6442                	ld	s0,16(sp)
    80005972:	6105                	addi	sp,sp,32
    80005974:	8082                	ret

0000000080005976 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005976:	1101                	addi	sp,sp,-32
    80005978:	ec06                	sd	ra,24(sp)
    8000597a:	e822                	sd	s0,16(sp)
    8000597c:	1000                	addi	s0,sp,32
    8000597e:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    80005982:	fe843503          	ld	a0,-24(s0)
    80005986:	00000097          	auipc	ra,0x0
    8000598a:	ec6080e7          	jalr	-314(ra) # 8000584c <iunlock>
  iput(ip);
    8000598e:	fe843503          	ld	a0,-24(s0)
    80005992:	00000097          	auipc	ra,0x0
    80005996:	f14080e7          	jalr	-236(ra) # 800058a6 <iput>
}
    8000599a:	0001                	nop
    8000599c:	60e2                	ld	ra,24(sp)
    8000599e:	6442                	ld	s0,16(sp)
    800059a0:	6105                	addi	sp,sp,32
    800059a2:	8082                	ret

00000000800059a4 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    800059a4:	7139                	addi	sp,sp,-64
    800059a6:	fc06                	sd	ra,56(sp)
    800059a8:	f822                	sd	s0,48(sp)
    800059aa:	0080                	addi	s0,sp,64
    800059ac:	fca43423          	sd	a0,-56(s0)
    800059b0:	87ae                	mv	a5,a1
    800059b2:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800059b6:	fc442783          	lw	a5,-60(s0)
    800059ba:	0007871b          	sext.w	a4,a5
    800059be:	47ad                	li	a5,11
    800059c0:	04e7ee63          	bltu	a5,a4,80005a1c <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    800059c4:	fc843703          	ld	a4,-56(s0)
    800059c8:	fc446783          	lwu	a5,-60(s0)
    800059cc:	07d1                	addi	a5,a5,20
    800059ce:	078a                	slli	a5,a5,0x2
    800059d0:	97ba                	add	a5,a5,a4
    800059d2:	439c                	lw	a5,0(a5)
    800059d4:	fef42623          	sw	a5,-20(s0)
    800059d8:	fec42783          	lw	a5,-20(s0)
    800059dc:	2781                	sext.w	a5,a5
    800059de:	ef85                	bnez	a5,80005a16 <bmap+0x72>
      addr = balloc(ip->dev);
    800059e0:	fc843783          	ld	a5,-56(s0)
    800059e4:	439c                	lw	a5,0(a5)
    800059e6:	853e                	mv	a0,a5
    800059e8:	fffff097          	auipc	ra,0xfffff
    800059ec:	68e080e7          	jalr	1678(ra) # 80005076 <balloc>
    800059f0:	87aa                	mv	a5,a0
    800059f2:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800059f6:	fec42783          	lw	a5,-20(s0)
    800059fa:	2781                	sext.w	a5,a5
    800059fc:	e399                	bnez	a5,80005a02 <bmap+0x5e>
        return 0;
    800059fe:	4781                	li	a5,0
    80005a00:	aa19                	j	80005b16 <bmap+0x172>
      ip->addrs[bn] = addr;
    80005a02:	fc843703          	ld	a4,-56(s0)
    80005a06:	fc446783          	lwu	a5,-60(s0)
    80005a0a:	07d1                	addi	a5,a5,20
    80005a0c:	078a                	slli	a5,a5,0x2
    80005a0e:	97ba                	add	a5,a5,a4
    80005a10:	fec42703          	lw	a4,-20(s0)
    80005a14:	c398                	sw	a4,0(a5)
    }
    return addr;
    80005a16:	fec42783          	lw	a5,-20(s0)
    80005a1a:	a8f5                	j	80005b16 <bmap+0x172>
  }
  bn -= NDIRECT;
    80005a1c:	fc442783          	lw	a5,-60(s0)
    80005a20:	37d1                	addiw	a5,a5,-12
    80005a22:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005a26:	fc442783          	lw	a5,-60(s0)
    80005a2a:	0007871b          	sext.w	a4,a5
    80005a2e:	0ff00793          	li	a5,255
    80005a32:	0ce7ea63          	bltu	a5,a4,80005b06 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    80005a36:	fc843783          	ld	a5,-56(s0)
    80005a3a:	0807a783          	lw	a5,128(a5)
    80005a3e:	fef42623          	sw	a5,-20(s0)
    80005a42:	fec42783          	lw	a5,-20(s0)
    80005a46:	2781                	sext.w	a5,a5
    80005a48:	eb85                	bnez	a5,80005a78 <bmap+0xd4>
      addr = balloc(ip->dev);
    80005a4a:	fc843783          	ld	a5,-56(s0)
    80005a4e:	439c                	lw	a5,0(a5)
    80005a50:	853e                	mv	a0,a5
    80005a52:	fffff097          	auipc	ra,0xfffff
    80005a56:	624080e7          	jalr	1572(ra) # 80005076 <balloc>
    80005a5a:	87aa                	mv	a5,a0
    80005a5c:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005a60:	fec42783          	lw	a5,-20(s0)
    80005a64:	2781                	sext.w	a5,a5
    80005a66:	e399                	bnez	a5,80005a6c <bmap+0xc8>
        return 0;
    80005a68:	4781                	li	a5,0
    80005a6a:	a075                	j	80005b16 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    80005a6c:	fc843783          	ld	a5,-56(s0)
    80005a70:	fec42703          	lw	a4,-20(s0)
    80005a74:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005a78:	fc843783          	ld	a5,-56(s0)
    80005a7c:	439c                	lw	a5,0(a5)
    80005a7e:	fec42703          	lw	a4,-20(s0)
    80005a82:	85ba                	mv	a1,a4
    80005a84:	853e                	mv	a0,a5
    80005a86:	fffff097          	auipc	ra,0xfffff
    80005a8a:	29e080e7          	jalr	670(ra) # 80004d24 <bread>
    80005a8e:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005a92:	fe043783          	ld	a5,-32(s0)
    80005a96:	05878793          	addi	a5,a5,88
    80005a9a:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005a9e:	fc446783          	lwu	a5,-60(s0)
    80005aa2:	078a                	slli	a5,a5,0x2
    80005aa4:	fd843703          	ld	a4,-40(s0)
    80005aa8:	97ba                	add	a5,a5,a4
    80005aaa:	439c                	lw	a5,0(a5)
    80005aac:	fef42623          	sw	a5,-20(s0)
    80005ab0:	fec42783          	lw	a5,-20(s0)
    80005ab4:	2781                	sext.w	a5,a5
    80005ab6:	ef9d                	bnez	a5,80005af4 <bmap+0x150>
      addr = balloc(ip->dev);
    80005ab8:	fc843783          	ld	a5,-56(s0)
    80005abc:	439c                	lw	a5,0(a5)
    80005abe:	853e                	mv	a0,a5
    80005ac0:	fffff097          	auipc	ra,0xfffff
    80005ac4:	5b6080e7          	jalr	1462(ra) # 80005076 <balloc>
    80005ac8:	87aa                	mv	a5,a0
    80005aca:	fef42623          	sw	a5,-20(s0)
      if(addr){
    80005ace:	fec42783          	lw	a5,-20(s0)
    80005ad2:	2781                	sext.w	a5,a5
    80005ad4:	c385                	beqz	a5,80005af4 <bmap+0x150>
        a[bn] = addr;
    80005ad6:	fc446783          	lwu	a5,-60(s0)
    80005ada:	078a                	slli	a5,a5,0x2
    80005adc:	fd843703          	ld	a4,-40(s0)
    80005ae0:	97ba                	add	a5,a5,a4
    80005ae2:	fec42703          	lw	a4,-20(s0)
    80005ae6:	c398                	sw	a4,0(a5)
        log_write(bp);
    80005ae8:	fe043503          	ld	a0,-32(s0)
    80005aec:	00001097          	auipc	ra,0x1
    80005af0:	f94080e7          	jalr	-108(ra) # 80006a80 <log_write>
      }
    }
    brelse(bp);
    80005af4:	fe043503          	ld	a0,-32(s0)
    80005af8:	fffff097          	auipc	ra,0xfffff
    80005afc:	2d6080e7          	jalr	726(ra) # 80004dce <brelse>
    return addr;
    80005b00:	fec42783          	lw	a5,-20(s0)
    80005b04:	a809                	j	80005b16 <bmap+0x172>
  }

  panic("bmap: out of range");
    80005b06:	00007517          	auipc	a0,0x7
    80005b0a:	a0250513          	addi	a0,a0,-1534 # 8000c508 <etext+0x508>
    80005b0e:	ffffb097          	auipc	ra,0xffffb
    80005b12:	17e080e7          	jalr	382(ra) # 80000c8c <panic>
}
    80005b16:	853e                	mv	a0,a5
    80005b18:	70e2                	ld	ra,56(sp)
    80005b1a:	7442                	ld	s0,48(sp)
    80005b1c:	6121                	addi	sp,sp,64
    80005b1e:	8082                	ret

0000000080005b20 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005b20:	7139                	addi	sp,sp,-64
    80005b22:	fc06                	sd	ra,56(sp)
    80005b24:	f822                	sd	s0,48(sp)
    80005b26:	0080                	addi	s0,sp,64
    80005b28:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005b2c:	fe042623          	sw	zero,-20(s0)
    80005b30:	a899                	j	80005b86 <itrunc+0x66>
    if(ip->addrs[i]){
    80005b32:	fc843703          	ld	a4,-56(s0)
    80005b36:	fec42783          	lw	a5,-20(s0)
    80005b3a:	07d1                	addi	a5,a5,20
    80005b3c:	078a                	slli	a5,a5,0x2
    80005b3e:	97ba                	add	a5,a5,a4
    80005b40:	439c                	lw	a5,0(a5)
    80005b42:	cf8d                	beqz	a5,80005b7c <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005b44:	fc843783          	ld	a5,-56(s0)
    80005b48:	439c                	lw	a5,0(a5)
    80005b4a:	0007869b          	sext.w	a3,a5
    80005b4e:	fc843703          	ld	a4,-56(s0)
    80005b52:	fec42783          	lw	a5,-20(s0)
    80005b56:	07d1                	addi	a5,a5,20
    80005b58:	078a                	slli	a5,a5,0x2
    80005b5a:	97ba                	add	a5,a5,a4
    80005b5c:	439c                	lw	a5,0(a5)
    80005b5e:	85be                	mv	a1,a5
    80005b60:	8536                	mv	a0,a3
    80005b62:	fffff097          	auipc	ra,0xfffff
    80005b66:	6c4080e7          	jalr	1732(ra) # 80005226 <bfree>
      ip->addrs[i] = 0;
    80005b6a:	fc843703          	ld	a4,-56(s0)
    80005b6e:	fec42783          	lw	a5,-20(s0)
    80005b72:	07d1                	addi	a5,a5,20
    80005b74:	078a                	slli	a5,a5,0x2
    80005b76:	97ba                	add	a5,a5,a4
    80005b78:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005b7c:	fec42783          	lw	a5,-20(s0)
    80005b80:	2785                	addiw	a5,a5,1
    80005b82:	fef42623          	sw	a5,-20(s0)
    80005b86:	fec42783          	lw	a5,-20(s0)
    80005b8a:	0007871b          	sext.w	a4,a5
    80005b8e:	47ad                	li	a5,11
    80005b90:	fae7d1e3          	bge	a5,a4,80005b32 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    80005b94:	fc843783          	ld	a5,-56(s0)
    80005b98:	0807a783          	lw	a5,128(a5)
    80005b9c:	cbc5                	beqz	a5,80005c4c <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005b9e:	fc843783          	ld	a5,-56(s0)
    80005ba2:	4398                	lw	a4,0(a5)
    80005ba4:	fc843783          	ld	a5,-56(s0)
    80005ba8:	0807a783          	lw	a5,128(a5)
    80005bac:	85be                	mv	a1,a5
    80005bae:	853a                	mv	a0,a4
    80005bb0:	fffff097          	auipc	ra,0xfffff
    80005bb4:	174080e7          	jalr	372(ra) # 80004d24 <bread>
    80005bb8:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005bbc:	fe043783          	ld	a5,-32(s0)
    80005bc0:	05878793          	addi	a5,a5,88
    80005bc4:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005bc8:	fe042423          	sw	zero,-24(s0)
    80005bcc:	a081                	j	80005c0c <itrunc+0xec>
      if(a[j])
    80005bce:	fe842783          	lw	a5,-24(s0)
    80005bd2:	078a                	slli	a5,a5,0x2
    80005bd4:	fd843703          	ld	a4,-40(s0)
    80005bd8:	97ba                	add	a5,a5,a4
    80005bda:	439c                	lw	a5,0(a5)
    80005bdc:	c39d                	beqz	a5,80005c02 <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005bde:	fc843783          	ld	a5,-56(s0)
    80005be2:	439c                	lw	a5,0(a5)
    80005be4:	0007869b          	sext.w	a3,a5
    80005be8:	fe842783          	lw	a5,-24(s0)
    80005bec:	078a                	slli	a5,a5,0x2
    80005bee:	fd843703          	ld	a4,-40(s0)
    80005bf2:	97ba                	add	a5,a5,a4
    80005bf4:	439c                	lw	a5,0(a5)
    80005bf6:	85be                	mv	a1,a5
    80005bf8:	8536                	mv	a0,a3
    80005bfa:	fffff097          	auipc	ra,0xfffff
    80005bfe:	62c080e7          	jalr	1580(ra) # 80005226 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    80005c02:	fe842783          	lw	a5,-24(s0)
    80005c06:	2785                	addiw	a5,a5,1
    80005c08:	fef42423          	sw	a5,-24(s0)
    80005c0c:	fe842783          	lw	a5,-24(s0)
    80005c10:	873e                	mv	a4,a5
    80005c12:	0ff00793          	li	a5,255
    80005c16:	fae7fce3          	bgeu	a5,a4,80005bce <itrunc+0xae>
    }
    brelse(bp);
    80005c1a:	fe043503          	ld	a0,-32(s0)
    80005c1e:	fffff097          	auipc	ra,0xfffff
    80005c22:	1b0080e7          	jalr	432(ra) # 80004dce <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005c26:	fc843783          	ld	a5,-56(s0)
    80005c2a:	439c                	lw	a5,0(a5)
    80005c2c:	0007871b          	sext.w	a4,a5
    80005c30:	fc843783          	ld	a5,-56(s0)
    80005c34:	0807a783          	lw	a5,128(a5)
    80005c38:	85be                	mv	a1,a5
    80005c3a:	853a                	mv	a0,a4
    80005c3c:	fffff097          	auipc	ra,0xfffff
    80005c40:	5ea080e7          	jalr	1514(ra) # 80005226 <bfree>
    ip->addrs[NDIRECT] = 0;
    80005c44:	fc843783          	ld	a5,-56(s0)
    80005c48:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005c4c:	fc843783          	ld	a5,-56(s0)
    80005c50:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005c54:	fc843503          	ld	a0,-56(s0)
    80005c58:	00000097          	auipc	ra,0x0
    80005c5c:	870080e7          	jalr	-1936(ra) # 800054c8 <iupdate>
}
    80005c60:	0001                	nop
    80005c62:	70e2                	ld	ra,56(sp)
    80005c64:	7442                	ld	s0,48(sp)
    80005c66:	6121                	addi	sp,sp,64
    80005c68:	8082                	ret

0000000080005c6a <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005c6a:	1101                	addi	sp,sp,-32
    80005c6c:	ec22                	sd	s0,24(sp)
    80005c6e:	1000                	addi	s0,sp,32
    80005c70:	fea43423          	sd	a0,-24(s0)
    80005c74:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005c78:	fe843783          	ld	a5,-24(s0)
    80005c7c:	439c                	lw	a5,0(a5)
    80005c7e:	0007871b          	sext.w	a4,a5
    80005c82:	fe043783          	ld	a5,-32(s0)
    80005c86:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005c88:	fe843783          	ld	a5,-24(s0)
    80005c8c:	43d8                	lw	a4,4(a5)
    80005c8e:	fe043783          	ld	a5,-32(s0)
    80005c92:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    80005c94:	fe843783          	ld	a5,-24(s0)
    80005c98:	04479703          	lh	a4,68(a5)
    80005c9c:	fe043783          	ld	a5,-32(s0)
    80005ca0:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80005ca4:	fe843783          	ld	a5,-24(s0)
    80005ca8:	04a79703          	lh	a4,74(a5)
    80005cac:	fe043783          	ld	a5,-32(s0)
    80005cb0:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80005cb4:	fe843783          	ld	a5,-24(s0)
    80005cb8:	47fc                	lw	a5,76(a5)
    80005cba:	02079713          	slli	a4,a5,0x20
    80005cbe:	9301                	srli	a4,a4,0x20
    80005cc0:	fe043783          	ld	a5,-32(s0)
    80005cc4:	eb98                	sd	a4,16(a5)
}
    80005cc6:	0001                	nop
    80005cc8:	6462                	ld	s0,24(sp)
    80005cca:	6105                	addi	sp,sp,32
    80005ccc:	8082                	ret

0000000080005cce <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005cce:	715d                	addi	sp,sp,-80
    80005cd0:	e486                	sd	ra,72(sp)
    80005cd2:	e0a2                	sd	s0,64(sp)
    80005cd4:	0880                	addi	s0,sp,80
    80005cd6:	fca43423          	sd	a0,-56(s0)
    80005cda:	87ae                	mv	a5,a1
    80005cdc:	fac43c23          	sd	a2,-72(s0)
    80005ce0:	fcf42223          	sw	a5,-60(s0)
    80005ce4:	87b6                	mv	a5,a3
    80005ce6:	fcf42023          	sw	a5,-64(s0)
    80005cea:	87ba                	mv	a5,a4
    80005cec:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005cf0:	fc843783          	ld	a5,-56(s0)
    80005cf4:	47f8                	lw	a4,76(a5)
    80005cf6:	fc042783          	lw	a5,-64(s0)
    80005cfa:	2781                	sext.w	a5,a5
    80005cfc:	00f76e63          	bltu	a4,a5,80005d18 <readi+0x4a>
    80005d00:	fc042703          	lw	a4,-64(s0)
    80005d04:	fb442783          	lw	a5,-76(s0)
    80005d08:	9fb9                	addw	a5,a5,a4
    80005d0a:	0007871b          	sext.w	a4,a5
    80005d0e:	fc042783          	lw	a5,-64(s0)
    80005d12:	2781                	sext.w	a5,a5
    80005d14:	00f77463          	bgeu	a4,a5,80005d1c <readi+0x4e>
    return 0;
    80005d18:	4781                	li	a5,0
    80005d1a:	a289                	j	80005e5c <readi+0x18e>
  if(off + n > ip->size)
    80005d1c:	fc042703          	lw	a4,-64(s0)
    80005d20:	fb442783          	lw	a5,-76(s0)
    80005d24:	9fb9                	addw	a5,a5,a4
    80005d26:	0007871b          	sext.w	a4,a5
    80005d2a:	fc843783          	ld	a5,-56(s0)
    80005d2e:	47fc                	lw	a5,76(a5)
    80005d30:	00e7fb63          	bgeu	a5,a4,80005d46 <readi+0x78>
    n = ip->size - off;
    80005d34:	fc843783          	ld	a5,-56(s0)
    80005d38:	47f8                	lw	a4,76(a5)
    80005d3a:	fc042783          	lw	a5,-64(s0)
    80005d3e:	40f707bb          	subw	a5,a4,a5
    80005d42:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005d46:	fe042623          	sw	zero,-20(s0)
    80005d4a:	a8ed                	j	80005e44 <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    80005d4c:	fc042783          	lw	a5,-64(s0)
    80005d50:	00a7d79b          	srliw	a5,a5,0xa
    80005d54:	2781                	sext.w	a5,a5
    80005d56:	85be                	mv	a1,a5
    80005d58:	fc843503          	ld	a0,-56(s0)
    80005d5c:	00000097          	auipc	ra,0x0
    80005d60:	c48080e7          	jalr	-952(ra) # 800059a4 <bmap>
    80005d64:	87aa                	mv	a5,a0
    80005d66:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005d6a:	fe842783          	lw	a5,-24(s0)
    80005d6e:	2781                	sext.w	a5,a5
    80005d70:	c3fd                	beqz	a5,80005e56 <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    80005d72:	fc843783          	ld	a5,-56(s0)
    80005d76:	439c                	lw	a5,0(a5)
    80005d78:	fe842703          	lw	a4,-24(s0)
    80005d7c:	85ba                	mv	a1,a4
    80005d7e:	853e                	mv	a0,a5
    80005d80:	fffff097          	auipc	ra,0xfffff
    80005d84:	fa4080e7          	jalr	-92(ra) # 80004d24 <bread>
    80005d88:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005d8c:	fc042783          	lw	a5,-64(s0)
    80005d90:	3ff7f793          	andi	a5,a5,1023
    80005d94:	2781                	sext.w	a5,a5
    80005d96:	40000713          	li	a4,1024
    80005d9a:	40f707bb          	subw	a5,a4,a5
    80005d9e:	0007869b          	sext.w	a3,a5
    80005da2:	fb442703          	lw	a4,-76(s0)
    80005da6:	fec42783          	lw	a5,-20(s0)
    80005daa:	40f707bb          	subw	a5,a4,a5
    80005dae:	2781                	sext.w	a5,a5
    80005db0:	863e                	mv	a2,a5
    80005db2:	87b6                	mv	a5,a3
    80005db4:	0007869b          	sext.w	a3,a5
    80005db8:	0006071b          	sext.w	a4,a2
    80005dbc:	00d77363          	bgeu	a4,a3,80005dc2 <readi+0xf4>
    80005dc0:	87b2                	mv	a5,a2
    80005dc2:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005dc6:	fe043783          	ld	a5,-32(s0)
    80005dca:	05878713          	addi	a4,a5,88
    80005dce:	fc046783          	lwu	a5,-64(s0)
    80005dd2:	3ff7f793          	andi	a5,a5,1023
    80005dd6:	973e                	add	a4,a4,a5
    80005dd8:	fdc46683          	lwu	a3,-36(s0)
    80005ddc:	fc442783          	lw	a5,-60(s0)
    80005de0:	863a                	mv	a2,a4
    80005de2:	fb843583          	ld	a1,-72(s0)
    80005de6:	853e                	mv	a0,a5
    80005de8:	ffffe097          	auipc	ra,0xffffe
    80005dec:	ea0080e7          	jalr	-352(ra) # 80003c88 <either_copyout>
    80005df0:	87aa                	mv	a5,a0
    80005df2:	873e                	mv	a4,a5
    80005df4:	57fd                	li	a5,-1
    80005df6:	00f71c63          	bne	a4,a5,80005e0e <readi+0x140>
      brelse(bp);
    80005dfa:	fe043503          	ld	a0,-32(s0)
    80005dfe:	fffff097          	auipc	ra,0xfffff
    80005e02:	fd0080e7          	jalr	-48(ra) # 80004dce <brelse>
      tot = -1;
    80005e06:	57fd                	li	a5,-1
    80005e08:	fef42623          	sw	a5,-20(s0)
      break;
    80005e0c:	a0b1                	j	80005e58 <readi+0x18a>
    }
    brelse(bp);
    80005e0e:	fe043503          	ld	a0,-32(s0)
    80005e12:	fffff097          	auipc	ra,0xfffff
    80005e16:	fbc080e7          	jalr	-68(ra) # 80004dce <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005e1a:	fec42703          	lw	a4,-20(s0)
    80005e1e:	fdc42783          	lw	a5,-36(s0)
    80005e22:	9fb9                	addw	a5,a5,a4
    80005e24:	fef42623          	sw	a5,-20(s0)
    80005e28:	fc042703          	lw	a4,-64(s0)
    80005e2c:	fdc42783          	lw	a5,-36(s0)
    80005e30:	9fb9                	addw	a5,a5,a4
    80005e32:	fcf42023          	sw	a5,-64(s0)
    80005e36:	fdc46783          	lwu	a5,-36(s0)
    80005e3a:	fb843703          	ld	a4,-72(s0)
    80005e3e:	97ba                	add	a5,a5,a4
    80005e40:	faf43c23          	sd	a5,-72(s0)
    80005e44:	fec42703          	lw	a4,-20(s0)
    80005e48:	fb442783          	lw	a5,-76(s0)
    80005e4c:	2701                	sext.w	a4,a4
    80005e4e:	2781                	sext.w	a5,a5
    80005e50:	eef76ee3          	bltu	a4,a5,80005d4c <readi+0x7e>
    80005e54:	a011                	j	80005e58 <readi+0x18a>
      break;
    80005e56:	0001                	nop
  }
  return tot;
    80005e58:	fec42783          	lw	a5,-20(s0)
}
    80005e5c:	853e                	mv	a0,a5
    80005e5e:	60a6                	ld	ra,72(sp)
    80005e60:	6406                	ld	s0,64(sp)
    80005e62:	6161                	addi	sp,sp,80
    80005e64:	8082                	ret

0000000080005e66 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005e66:	715d                	addi	sp,sp,-80
    80005e68:	e486                	sd	ra,72(sp)
    80005e6a:	e0a2                	sd	s0,64(sp)
    80005e6c:	0880                	addi	s0,sp,80
    80005e6e:	fca43423          	sd	a0,-56(s0)
    80005e72:	87ae                	mv	a5,a1
    80005e74:	fac43c23          	sd	a2,-72(s0)
    80005e78:	fcf42223          	sw	a5,-60(s0)
    80005e7c:	87b6                	mv	a5,a3
    80005e7e:	fcf42023          	sw	a5,-64(s0)
    80005e82:	87ba                	mv	a5,a4
    80005e84:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005e88:	fc843783          	ld	a5,-56(s0)
    80005e8c:	47f8                	lw	a4,76(a5)
    80005e8e:	fc042783          	lw	a5,-64(s0)
    80005e92:	2781                	sext.w	a5,a5
    80005e94:	00f76e63          	bltu	a4,a5,80005eb0 <writei+0x4a>
    80005e98:	fc042703          	lw	a4,-64(s0)
    80005e9c:	fb442783          	lw	a5,-76(s0)
    80005ea0:	9fb9                	addw	a5,a5,a4
    80005ea2:	0007871b          	sext.w	a4,a5
    80005ea6:	fc042783          	lw	a5,-64(s0)
    80005eaa:	2781                	sext.w	a5,a5
    80005eac:	00f77463          	bgeu	a4,a5,80005eb4 <writei+0x4e>
    return -1;
    80005eb0:	57fd                	li	a5,-1
    80005eb2:	aab9                	j	80006010 <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005eb4:	fc042703          	lw	a4,-64(s0)
    80005eb8:	fb442783          	lw	a5,-76(s0)
    80005ebc:	9fb9                	addw	a5,a5,a4
    80005ebe:	2781                	sext.w	a5,a5
    80005ec0:	873e                	mv	a4,a5
    80005ec2:	000437b7          	lui	a5,0x43
    80005ec6:	00e7f463          	bgeu	a5,a4,80005ece <writei+0x68>
    return -1;
    80005eca:	57fd                	li	a5,-1
    80005ecc:	a291                	j	80006010 <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005ece:	fe042623          	sw	zero,-20(s0)
    80005ed2:	a201                	j	80005fd2 <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005ed4:	fc042783          	lw	a5,-64(s0)
    80005ed8:	00a7d79b          	srliw	a5,a5,0xa
    80005edc:	2781                	sext.w	a5,a5
    80005ede:	85be                	mv	a1,a5
    80005ee0:	fc843503          	ld	a0,-56(s0)
    80005ee4:	00000097          	auipc	ra,0x0
    80005ee8:	ac0080e7          	jalr	-1344(ra) # 800059a4 <bmap>
    80005eec:	87aa                	mv	a5,a0
    80005eee:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005ef2:	fe842783          	lw	a5,-24(s0)
    80005ef6:	2781                	sext.w	a5,a5
    80005ef8:	c7f5                	beqz	a5,80005fe4 <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005efa:	fc843783          	ld	a5,-56(s0)
    80005efe:	439c                	lw	a5,0(a5)
    80005f00:	fe842703          	lw	a4,-24(s0)
    80005f04:	85ba                	mv	a1,a4
    80005f06:	853e                	mv	a0,a5
    80005f08:	fffff097          	auipc	ra,0xfffff
    80005f0c:	e1c080e7          	jalr	-484(ra) # 80004d24 <bread>
    80005f10:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005f14:	fc042783          	lw	a5,-64(s0)
    80005f18:	3ff7f793          	andi	a5,a5,1023
    80005f1c:	2781                	sext.w	a5,a5
    80005f1e:	40000713          	li	a4,1024
    80005f22:	40f707bb          	subw	a5,a4,a5
    80005f26:	0007869b          	sext.w	a3,a5
    80005f2a:	fb442703          	lw	a4,-76(s0)
    80005f2e:	fec42783          	lw	a5,-20(s0)
    80005f32:	40f707bb          	subw	a5,a4,a5
    80005f36:	2781                	sext.w	a5,a5
    80005f38:	863e                	mv	a2,a5
    80005f3a:	87b6                	mv	a5,a3
    80005f3c:	0007869b          	sext.w	a3,a5
    80005f40:	0006071b          	sext.w	a4,a2
    80005f44:	00d77363          	bgeu	a4,a3,80005f4a <writei+0xe4>
    80005f48:	87b2                	mv	a5,a2
    80005f4a:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005f4e:	fe043783          	ld	a5,-32(s0)
    80005f52:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005f56:	fc046783          	lwu	a5,-64(s0)
    80005f5a:	3ff7f793          	andi	a5,a5,1023
    80005f5e:	97ba                	add	a5,a5,a4
    80005f60:	fdc46683          	lwu	a3,-36(s0)
    80005f64:	fc442703          	lw	a4,-60(s0)
    80005f68:	fb843603          	ld	a2,-72(s0)
    80005f6c:	85ba                	mv	a1,a4
    80005f6e:	853e                	mv	a0,a5
    80005f70:	ffffe097          	auipc	ra,0xffffe
    80005f74:	d8c080e7          	jalr	-628(ra) # 80003cfc <either_copyin>
    80005f78:	87aa                	mv	a5,a0
    80005f7a:	873e                	mv	a4,a5
    80005f7c:	57fd                	li	a5,-1
    80005f7e:	00f71963          	bne	a4,a5,80005f90 <writei+0x12a>
      brelse(bp);
    80005f82:	fe043503          	ld	a0,-32(s0)
    80005f86:	fffff097          	auipc	ra,0xfffff
    80005f8a:	e48080e7          	jalr	-440(ra) # 80004dce <brelse>
      break;
    80005f8e:	a8a1                	j	80005fe6 <writei+0x180>
    }
    log_write(bp);
    80005f90:	fe043503          	ld	a0,-32(s0)
    80005f94:	00001097          	auipc	ra,0x1
    80005f98:	aec080e7          	jalr	-1300(ra) # 80006a80 <log_write>
    brelse(bp);
    80005f9c:	fe043503          	ld	a0,-32(s0)
    80005fa0:	fffff097          	auipc	ra,0xfffff
    80005fa4:	e2e080e7          	jalr	-466(ra) # 80004dce <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005fa8:	fec42703          	lw	a4,-20(s0)
    80005fac:	fdc42783          	lw	a5,-36(s0)
    80005fb0:	9fb9                	addw	a5,a5,a4
    80005fb2:	fef42623          	sw	a5,-20(s0)
    80005fb6:	fc042703          	lw	a4,-64(s0)
    80005fba:	fdc42783          	lw	a5,-36(s0)
    80005fbe:	9fb9                	addw	a5,a5,a4
    80005fc0:	fcf42023          	sw	a5,-64(s0)
    80005fc4:	fdc46783          	lwu	a5,-36(s0)
    80005fc8:	fb843703          	ld	a4,-72(s0)
    80005fcc:	97ba                	add	a5,a5,a4
    80005fce:	faf43c23          	sd	a5,-72(s0)
    80005fd2:	fec42703          	lw	a4,-20(s0)
    80005fd6:	fb442783          	lw	a5,-76(s0)
    80005fda:	2701                	sext.w	a4,a4
    80005fdc:	2781                	sext.w	a5,a5
    80005fde:	eef76be3          	bltu	a4,a5,80005ed4 <writei+0x6e>
    80005fe2:	a011                	j	80005fe6 <writei+0x180>
      break;
    80005fe4:	0001                	nop
  }

  if(off > ip->size)
    80005fe6:	fc843783          	ld	a5,-56(s0)
    80005fea:	47f8                	lw	a4,76(a5)
    80005fec:	fc042783          	lw	a5,-64(s0)
    80005ff0:	2781                	sext.w	a5,a5
    80005ff2:	00f77763          	bgeu	a4,a5,80006000 <writei+0x19a>
    ip->size = off;
    80005ff6:	fc843783          	ld	a5,-56(s0)
    80005ffa:	fc042703          	lw	a4,-64(s0)
    80005ffe:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80006000:	fc843503          	ld	a0,-56(s0)
    80006004:	fffff097          	auipc	ra,0xfffff
    80006008:	4c4080e7          	jalr	1220(ra) # 800054c8 <iupdate>

  return tot;
    8000600c:	fec42783          	lw	a5,-20(s0)
}
    80006010:	853e                	mv	a0,a5
    80006012:	60a6                	ld	ra,72(sp)
    80006014:	6406                	ld	s0,64(sp)
    80006016:	6161                	addi	sp,sp,80
    80006018:	8082                	ret

000000008000601a <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    8000601a:	1101                	addi	sp,sp,-32
    8000601c:	ec06                	sd	ra,24(sp)
    8000601e:	e822                	sd	s0,16(sp)
    80006020:	1000                	addi	s0,sp,32
    80006022:	fea43423          	sd	a0,-24(s0)
    80006026:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    8000602a:	4639                	li	a2,14
    8000602c:	fe043583          	ld	a1,-32(s0)
    80006030:	fe843503          	ld	a0,-24(s0)
    80006034:	ffffb097          	auipc	ra,0xffffb
    80006038:	700080e7          	jalr	1792(ra) # 80001734 <strncmp>
    8000603c:	87aa                	mv	a5,a0
}
    8000603e:	853e                	mv	a0,a5
    80006040:	60e2                	ld	ra,24(sp)
    80006042:	6442                	ld	s0,16(sp)
    80006044:	6105                	addi	sp,sp,32
    80006046:	8082                	ret

0000000080006048 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80006048:	715d                	addi	sp,sp,-80
    8000604a:	e486                	sd	ra,72(sp)
    8000604c:	e0a2                	sd	s0,64(sp)
    8000604e:	0880                	addi	s0,sp,80
    80006050:	fca43423          	sd	a0,-56(s0)
    80006054:	fcb43023          	sd	a1,-64(s0)
    80006058:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    8000605c:	fc843783          	ld	a5,-56(s0)
    80006060:	04479783          	lh	a5,68(a5)
    80006064:	0007871b          	sext.w	a4,a5
    80006068:	4785                	li	a5,1
    8000606a:	00f70a63          	beq	a4,a5,8000607e <dirlookup+0x36>
    panic("dirlookup not DIR");
    8000606e:	00006517          	auipc	a0,0x6
    80006072:	4b250513          	addi	a0,a0,1202 # 8000c520 <etext+0x520>
    80006076:	ffffb097          	auipc	ra,0xffffb
    8000607a:	c16080e7          	jalr	-1002(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    8000607e:	fe042623          	sw	zero,-20(s0)
    80006082:	a849                	j	80006114 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80006084:	fd840793          	addi	a5,s0,-40
    80006088:	fec42683          	lw	a3,-20(s0)
    8000608c:	4741                	li	a4,16
    8000608e:	863e                	mv	a2,a5
    80006090:	4581                	li	a1,0
    80006092:	fc843503          	ld	a0,-56(s0)
    80006096:	00000097          	auipc	ra,0x0
    8000609a:	c38080e7          	jalr	-968(ra) # 80005cce <readi>
    8000609e:	87aa                	mv	a5,a0
    800060a0:	873e                	mv	a4,a5
    800060a2:	47c1                	li	a5,16
    800060a4:	00f70a63          	beq	a4,a5,800060b8 <dirlookup+0x70>
      panic("dirlookup read");
    800060a8:	00006517          	auipc	a0,0x6
    800060ac:	49050513          	addi	a0,a0,1168 # 8000c538 <etext+0x538>
    800060b0:	ffffb097          	auipc	ra,0xffffb
    800060b4:	bdc080e7          	jalr	-1060(ra) # 80000c8c <panic>
    if(de.inum == 0)
    800060b8:	fd845783          	lhu	a5,-40(s0)
    800060bc:	c7b1                	beqz	a5,80006108 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    800060be:	fd840793          	addi	a5,s0,-40
    800060c2:	0789                	addi	a5,a5,2
    800060c4:	85be                	mv	a1,a5
    800060c6:	fc043503          	ld	a0,-64(s0)
    800060ca:	00000097          	auipc	ra,0x0
    800060ce:	f50080e7          	jalr	-176(ra) # 8000601a <namecmp>
    800060d2:	87aa                	mv	a5,a0
    800060d4:	eb9d                	bnez	a5,8000610a <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    800060d6:	fb843783          	ld	a5,-72(s0)
    800060da:	c791                	beqz	a5,800060e6 <dirlookup+0x9e>
        *poff = off;
    800060dc:	fb843783          	ld	a5,-72(s0)
    800060e0:	fec42703          	lw	a4,-20(s0)
    800060e4:	c398                	sw	a4,0(a5)
      inum = de.inum;
    800060e6:	fd845783          	lhu	a5,-40(s0)
    800060ea:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    800060ee:	fc843783          	ld	a5,-56(s0)
    800060f2:	439c                	lw	a5,0(a5)
    800060f4:	fe842703          	lw	a4,-24(s0)
    800060f8:	85ba                	mv	a1,a4
    800060fa:	853e                	mv	a0,a5
    800060fc:	fffff097          	auipc	ra,0xfffff
    80006100:	4b4080e7          	jalr	1204(ra) # 800055b0 <iget>
    80006104:	87aa                	mv	a5,a0
    80006106:	a005                	j	80006126 <dirlookup+0xde>
      continue;
    80006108:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    8000610a:	fec42783          	lw	a5,-20(s0)
    8000610e:	27c1                	addiw	a5,a5,16
    80006110:	fef42623          	sw	a5,-20(s0)
    80006114:	fc843783          	ld	a5,-56(s0)
    80006118:	47f8                	lw	a4,76(a5)
    8000611a:	fec42783          	lw	a5,-20(s0)
    8000611e:	2781                	sext.w	a5,a5
    80006120:	f6e7e2e3          	bltu	a5,a4,80006084 <dirlookup+0x3c>
    }
  }

  return 0;
    80006124:	4781                	li	a5,0
}
    80006126:	853e                	mv	a0,a5
    80006128:	60a6                	ld	ra,72(sp)
    8000612a:	6406                	ld	s0,64(sp)
    8000612c:	6161                	addi	sp,sp,80
    8000612e:	8082                	ret

0000000080006130 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80006130:	715d                	addi	sp,sp,-80
    80006132:	e486                	sd	ra,72(sp)
    80006134:	e0a2                	sd	s0,64(sp)
    80006136:	0880                	addi	s0,sp,80
    80006138:	fca43423          	sd	a0,-56(s0)
    8000613c:	fcb43023          	sd	a1,-64(s0)
    80006140:	87b2                	mv	a5,a2
    80006142:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80006146:	4601                	li	a2,0
    80006148:	fc043583          	ld	a1,-64(s0)
    8000614c:	fc843503          	ld	a0,-56(s0)
    80006150:	00000097          	auipc	ra,0x0
    80006154:	ef8080e7          	jalr	-264(ra) # 80006048 <dirlookup>
    80006158:	fea43023          	sd	a0,-32(s0)
    8000615c:	fe043783          	ld	a5,-32(s0)
    80006160:	cb89                	beqz	a5,80006172 <dirlink+0x42>
    iput(ip);
    80006162:	fe043503          	ld	a0,-32(s0)
    80006166:	fffff097          	auipc	ra,0xfffff
    8000616a:	740080e7          	jalr	1856(ra) # 800058a6 <iput>
    return -1;
    8000616e:	57fd                	li	a5,-1
    80006170:	a075                	j	8000621c <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80006172:	fe042623          	sw	zero,-20(s0)
    80006176:	a0a1                	j	800061be <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80006178:	fd040793          	addi	a5,s0,-48
    8000617c:	fec42683          	lw	a3,-20(s0)
    80006180:	4741                	li	a4,16
    80006182:	863e                	mv	a2,a5
    80006184:	4581                	li	a1,0
    80006186:	fc843503          	ld	a0,-56(s0)
    8000618a:	00000097          	auipc	ra,0x0
    8000618e:	b44080e7          	jalr	-1212(ra) # 80005cce <readi>
    80006192:	87aa                	mv	a5,a0
    80006194:	873e                	mv	a4,a5
    80006196:	47c1                	li	a5,16
    80006198:	00f70a63          	beq	a4,a5,800061ac <dirlink+0x7c>
      panic("dirlink read");
    8000619c:	00006517          	auipc	a0,0x6
    800061a0:	3ac50513          	addi	a0,a0,940 # 8000c548 <etext+0x548>
    800061a4:	ffffb097          	auipc	ra,0xffffb
    800061a8:	ae8080e7          	jalr	-1304(ra) # 80000c8c <panic>
    if(de.inum == 0)
    800061ac:	fd045783          	lhu	a5,-48(s0)
    800061b0:	cf99                	beqz	a5,800061ce <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    800061b2:	fec42783          	lw	a5,-20(s0)
    800061b6:	27c1                	addiw	a5,a5,16
    800061b8:	2781                	sext.w	a5,a5
    800061ba:	fef42623          	sw	a5,-20(s0)
    800061be:	fc843783          	ld	a5,-56(s0)
    800061c2:	47f8                	lw	a4,76(a5)
    800061c4:	fec42783          	lw	a5,-20(s0)
    800061c8:	fae7e8e3          	bltu	a5,a4,80006178 <dirlink+0x48>
    800061cc:	a011                	j	800061d0 <dirlink+0xa0>
      break;
    800061ce:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    800061d0:	fd040793          	addi	a5,s0,-48
    800061d4:	0789                	addi	a5,a5,2
    800061d6:	4639                	li	a2,14
    800061d8:	fc043583          	ld	a1,-64(s0)
    800061dc:	853e                	mv	a0,a5
    800061de:	ffffb097          	auipc	ra,0xffffb
    800061e2:	5e0080e7          	jalr	1504(ra) # 800017be <strncpy>
  de.inum = inum;
    800061e6:	fbc42783          	lw	a5,-68(s0)
    800061ea:	17c2                	slli	a5,a5,0x30
    800061ec:	93c1                	srli	a5,a5,0x30
    800061ee:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800061f2:	fd040793          	addi	a5,s0,-48
    800061f6:	fec42683          	lw	a3,-20(s0)
    800061fa:	4741                	li	a4,16
    800061fc:	863e                	mv	a2,a5
    800061fe:	4581                	li	a1,0
    80006200:	fc843503          	ld	a0,-56(s0)
    80006204:	00000097          	auipc	ra,0x0
    80006208:	c62080e7          	jalr	-926(ra) # 80005e66 <writei>
    8000620c:	87aa                	mv	a5,a0
    8000620e:	873e                	mv	a4,a5
    80006210:	47c1                	li	a5,16
    80006212:	00f70463          	beq	a4,a5,8000621a <dirlink+0xea>
    return -1;
    80006216:	57fd                	li	a5,-1
    80006218:	a011                	j	8000621c <dirlink+0xec>

  return 0;
    8000621a:	4781                	li	a5,0
}
    8000621c:	853e                	mv	a0,a5
    8000621e:	60a6                	ld	ra,72(sp)
    80006220:	6406                	ld	s0,64(sp)
    80006222:	6161                	addi	sp,sp,80
    80006224:	8082                	ret

0000000080006226 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80006226:	7179                	addi	sp,sp,-48
    80006228:	f406                	sd	ra,40(sp)
    8000622a:	f022                	sd	s0,32(sp)
    8000622c:	1800                	addi	s0,sp,48
    8000622e:	fca43c23          	sd	a0,-40(s0)
    80006232:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80006236:	a031                	j	80006242 <skipelem+0x1c>
    path++;
    80006238:	fd843783          	ld	a5,-40(s0)
    8000623c:	0785                	addi	a5,a5,1
    8000623e:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80006242:	fd843783          	ld	a5,-40(s0)
    80006246:	0007c783          	lbu	a5,0(a5)
    8000624a:	873e                	mv	a4,a5
    8000624c:	02f00793          	li	a5,47
    80006250:	fef704e3          	beq	a4,a5,80006238 <skipelem+0x12>
  if(*path == 0)
    80006254:	fd843783          	ld	a5,-40(s0)
    80006258:	0007c783          	lbu	a5,0(a5)
    8000625c:	e399                	bnez	a5,80006262 <skipelem+0x3c>
    return 0;
    8000625e:	4781                	li	a5,0
    80006260:	a06d                	j	8000630a <skipelem+0xe4>
  s = path;
    80006262:	fd843783          	ld	a5,-40(s0)
    80006266:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    8000626a:	a031                	j	80006276 <skipelem+0x50>
    path++;
    8000626c:	fd843783          	ld	a5,-40(s0)
    80006270:	0785                	addi	a5,a5,1
    80006272:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80006276:	fd843783          	ld	a5,-40(s0)
    8000627a:	0007c783          	lbu	a5,0(a5)
    8000627e:	873e                	mv	a4,a5
    80006280:	02f00793          	li	a5,47
    80006284:	00f70763          	beq	a4,a5,80006292 <skipelem+0x6c>
    80006288:	fd843783          	ld	a5,-40(s0)
    8000628c:	0007c783          	lbu	a5,0(a5)
    80006290:	fff1                	bnez	a5,8000626c <skipelem+0x46>
  len = path - s;
    80006292:	fd843703          	ld	a4,-40(s0)
    80006296:	fe843783          	ld	a5,-24(s0)
    8000629a:	40f707b3          	sub	a5,a4,a5
    8000629e:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    800062a2:	fe442783          	lw	a5,-28(s0)
    800062a6:	0007871b          	sext.w	a4,a5
    800062aa:	47b5                	li	a5,13
    800062ac:	00e7dc63          	bge	a5,a4,800062c4 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    800062b0:	4639                	li	a2,14
    800062b2:	fe843583          	ld	a1,-24(s0)
    800062b6:	fd043503          	ld	a0,-48(s0)
    800062ba:	ffffb097          	auipc	ra,0xffffb
    800062be:	366080e7          	jalr	870(ra) # 80001620 <memmove>
    800062c2:	a80d                	j	800062f4 <skipelem+0xce>
  else {
    memmove(name, s, len);
    800062c4:	fe442783          	lw	a5,-28(s0)
    800062c8:	863e                	mv	a2,a5
    800062ca:	fe843583          	ld	a1,-24(s0)
    800062ce:	fd043503          	ld	a0,-48(s0)
    800062d2:	ffffb097          	auipc	ra,0xffffb
    800062d6:	34e080e7          	jalr	846(ra) # 80001620 <memmove>
    name[len] = 0;
    800062da:	fe442783          	lw	a5,-28(s0)
    800062de:	fd043703          	ld	a4,-48(s0)
    800062e2:	97ba                	add	a5,a5,a4
    800062e4:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    800062e8:	a031                	j	800062f4 <skipelem+0xce>
    path++;
    800062ea:	fd843783          	ld	a5,-40(s0)
    800062ee:	0785                	addi	a5,a5,1
    800062f0:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    800062f4:	fd843783          	ld	a5,-40(s0)
    800062f8:	0007c783          	lbu	a5,0(a5)
    800062fc:	873e                	mv	a4,a5
    800062fe:	02f00793          	li	a5,47
    80006302:	fef704e3          	beq	a4,a5,800062ea <skipelem+0xc4>
  return path;
    80006306:	fd843783          	ld	a5,-40(s0)
}
    8000630a:	853e                	mv	a0,a5
    8000630c:	70a2                	ld	ra,40(sp)
    8000630e:	7402                	ld	s0,32(sp)
    80006310:	6145                	addi	sp,sp,48
    80006312:	8082                	ret

0000000080006314 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80006314:	7139                	addi	sp,sp,-64
    80006316:	fc06                	sd	ra,56(sp)
    80006318:	f822                	sd	s0,48(sp)
    8000631a:	0080                	addi	s0,sp,64
    8000631c:	fca43c23          	sd	a0,-40(s0)
    80006320:	87ae                	mv	a5,a1
    80006322:	fcc43423          	sd	a2,-56(s0)
    80006326:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    8000632a:	fd843783          	ld	a5,-40(s0)
    8000632e:	0007c783          	lbu	a5,0(a5)
    80006332:	873e                	mv	a4,a5
    80006334:	02f00793          	li	a5,47
    80006338:	00f71b63          	bne	a4,a5,8000634e <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    8000633c:	4585                	li	a1,1
    8000633e:	4505                	li	a0,1
    80006340:	fffff097          	auipc	ra,0xfffff
    80006344:	270080e7          	jalr	624(ra) # 800055b0 <iget>
    80006348:	fea43423          	sd	a0,-24(s0)
    8000634c:	a84d                	j	800063fe <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    8000634e:	ffffd097          	auipc	ra,0xffffd
    80006352:	b2a080e7          	jalr	-1238(ra) # 80002e78 <myproc>
    80006356:	87aa                	mv	a5,a0
    80006358:	1507b783          	ld	a5,336(a5)
    8000635c:	853e                	mv	a0,a5
    8000635e:	fffff097          	auipc	ra,0xfffff
    80006362:	36e080e7          	jalr	878(ra) # 800056cc <idup>
    80006366:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    8000636a:	a851                	j	800063fe <namex+0xea>
    ilock(ip);
    8000636c:	fe843503          	ld	a0,-24(s0)
    80006370:	fffff097          	auipc	ra,0xfffff
    80006374:	3a8080e7          	jalr	936(ra) # 80005718 <ilock>
    if(ip->type != T_DIR){
    80006378:	fe843783          	ld	a5,-24(s0)
    8000637c:	04479783          	lh	a5,68(a5)
    80006380:	0007871b          	sext.w	a4,a5
    80006384:	4785                	li	a5,1
    80006386:	00f70a63          	beq	a4,a5,8000639a <namex+0x86>
      iunlockput(ip);
    8000638a:	fe843503          	ld	a0,-24(s0)
    8000638e:	fffff097          	auipc	ra,0xfffff
    80006392:	5e8080e7          	jalr	1512(ra) # 80005976 <iunlockput>
      return 0;
    80006396:	4781                	li	a5,0
    80006398:	a871                	j	80006434 <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    8000639a:	fd442783          	lw	a5,-44(s0)
    8000639e:	2781                	sext.w	a5,a5
    800063a0:	cf99                	beqz	a5,800063be <namex+0xaa>
    800063a2:	fd843783          	ld	a5,-40(s0)
    800063a6:	0007c783          	lbu	a5,0(a5)
    800063aa:	eb91                	bnez	a5,800063be <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    800063ac:	fe843503          	ld	a0,-24(s0)
    800063b0:	fffff097          	auipc	ra,0xfffff
    800063b4:	49c080e7          	jalr	1180(ra) # 8000584c <iunlock>
      return ip;
    800063b8:	fe843783          	ld	a5,-24(s0)
    800063bc:	a8a5                	j	80006434 <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    800063be:	4601                	li	a2,0
    800063c0:	fc843583          	ld	a1,-56(s0)
    800063c4:	fe843503          	ld	a0,-24(s0)
    800063c8:	00000097          	auipc	ra,0x0
    800063cc:	c80080e7          	jalr	-896(ra) # 80006048 <dirlookup>
    800063d0:	fea43023          	sd	a0,-32(s0)
    800063d4:	fe043783          	ld	a5,-32(s0)
    800063d8:	eb89                	bnez	a5,800063ea <namex+0xd6>
      iunlockput(ip);
    800063da:	fe843503          	ld	a0,-24(s0)
    800063de:	fffff097          	auipc	ra,0xfffff
    800063e2:	598080e7          	jalr	1432(ra) # 80005976 <iunlockput>
      return 0;
    800063e6:	4781                	li	a5,0
    800063e8:	a0b1                	j	80006434 <namex+0x120>
    }
    iunlockput(ip);
    800063ea:	fe843503          	ld	a0,-24(s0)
    800063ee:	fffff097          	auipc	ra,0xfffff
    800063f2:	588080e7          	jalr	1416(ra) # 80005976 <iunlockput>
    ip = next;
    800063f6:	fe043783          	ld	a5,-32(s0)
    800063fa:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    800063fe:	fc843583          	ld	a1,-56(s0)
    80006402:	fd843503          	ld	a0,-40(s0)
    80006406:	00000097          	auipc	ra,0x0
    8000640a:	e20080e7          	jalr	-480(ra) # 80006226 <skipelem>
    8000640e:	fca43c23          	sd	a0,-40(s0)
    80006412:	fd843783          	ld	a5,-40(s0)
    80006416:	fbb9                	bnez	a5,8000636c <namex+0x58>
  }
  if(nameiparent){
    80006418:	fd442783          	lw	a5,-44(s0)
    8000641c:	2781                	sext.w	a5,a5
    8000641e:	cb89                	beqz	a5,80006430 <namex+0x11c>
    iput(ip);
    80006420:	fe843503          	ld	a0,-24(s0)
    80006424:	fffff097          	auipc	ra,0xfffff
    80006428:	482080e7          	jalr	1154(ra) # 800058a6 <iput>
    return 0;
    8000642c:	4781                	li	a5,0
    8000642e:	a019                	j	80006434 <namex+0x120>
  }
  return ip;
    80006430:	fe843783          	ld	a5,-24(s0)
}
    80006434:	853e                	mv	a0,a5
    80006436:	70e2                	ld	ra,56(sp)
    80006438:	7442                	ld	s0,48(sp)
    8000643a:	6121                	addi	sp,sp,64
    8000643c:	8082                	ret

000000008000643e <namei>:

struct inode*
namei(char *path)
{
    8000643e:	7179                	addi	sp,sp,-48
    80006440:	f406                	sd	ra,40(sp)
    80006442:	f022                	sd	s0,32(sp)
    80006444:	1800                	addi	s0,sp,48
    80006446:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    8000644a:	fe040793          	addi	a5,s0,-32
    8000644e:	863e                	mv	a2,a5
    80006450:	4581                	li	a1,0
    80006452:	fd843503          	ld	a0,-40(s0)
    80006456:	00000097          	auipc	ra,0x0
    8000645a:	ebe080e7          	jalr	-322(ra) # 80006314 <namex>
    8000645e:	87aa                	mv	a5,a0
}
    80006460:	853e                	mv	a0,a5
    80006462:	70a2                	ld	ra,40(sp)
    80006464:	7402                	ld	s0,32(sp)
    80006466:	6145                	addi	sp,sp,48
    80006468:	8082                	ret

000000008000646a <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    8000646a:	1101                	addi	sp,sp,-32
    8000646c:	ec06                	sd	ra,24(sp)
    8000646e:	e822                	sd	s0,16(sp)
    80006470:	1000                	addi	s0,sp,32
    80006472:	fea43423          	sd	a0,-24(s0)
    80006476:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    8000647a:	fe043603          	ld	a2,-32(s0)
    8000647e:	4585                	li	a1,1
    80006480:	fe843503          	ld	a0,-24(s0)
    80006484:	00000097          	auipc	ra,0x0
    80006488:	e90080e7          	jalr	-368(ra) # 80006314 <namex>
    8000648c:	87aa                	mv	a5,a0
}
    8000648e:	853e                	mv	a0,a5
    80006490:	60e2                	ld	ra,24(sp)
    80006492:	6442                	ld	s0,16(sp)
    80006494:	6105                	addi	sp,sp,32
    80006496:	8082                	ret

0000000080006498 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80006498:	1101                	addi	sp,sp,-32
    8000649a:	ec06                	sd	ra,24(sp)
    8000649c:	e822                	sd	s0,16(sp)
    8000649e:	1000                	addi	s0,sp,32
    800064a0:	87aa                	mv	a5,a0
    800064a2:	feb43023          	sd	a1,-32(s0)
    800064a6:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    800064aa:	00006597          	auipc	a1,0x6
    800064ae:	0ae58593          	addi	a1,a1,174 # 8000c558 <etext+0x558>
    800064b2:	00036517          	auipc	a0,0x36
    800064b6:	6d650513          	addi	a0,a0,1750 # 8003cb88 <log>
    800064ba:	ffffb097          	auipc	ra,0xffffb
    800064be:	e7e080e7          	jalr	-386(ra) # 80001338 <initlock>
  log.start = sb->logstart;
    800064c2:	fe043783          	ld	a5,-32(s0)
    800064c6:	4bdc                	lw	a5,20(a5)
    800064c8:	0007871b          	sext.w	a4,a5
    800064cc:	00036797          	auipc	a5,0x36
    800064d0:	6bc78793          	addi	a5,a5,1724 # 8003cb88 <log>
    800064d4:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800064d6:	fe043783          	ld	a5,-32(s0)
    800064da:	4b9c                	lw	a5,16(a5)
    800064dc:	0007871b          	sext.w	a4,a5
    800064e0:	00036797          	auipc	a5,0x36
    800064e4:	6a878793          	addi	a5,a5,1704 # 8003cb88 <log>
    800064e8:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800064ea:	00036797          	auipc	a5,0x36
    800064ee:	69e78793          	addi	a5,a5,1694 # 8003cb88 <log>
    800064f2:	fec42703          	lw	a4,-20(s0)
    800064f6:	d798                	sw	a4,40(a5)
  recover_from_log();
    800064f8:	00000097          	auipc	ra,0x0
    800064fc:	272080e7          	jalr	626(ra) # 8000676a <recover_from_log>
}
    80006500:	0001                	nop
    80006502:	60e2                	ld	ra,24(sp)
    80006504:	6442                	ld	s0,16(sp)
    80006506:	6105                	addi	sp,sp,32
    80006508:	8082                	ret

000000008000650a <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    8000650a:	7139                	addi	sp,sp,-64
    8000650c:	fc06                	sd	ra,56(sp)
    8000650e:	f822                	sd	s0,48(sp)
    80006510:	0080                	addi	s0,sp,64
    80006512:	87aa                	mv	a5,a0
    80006514:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006518:	fe042623          	sw	zero,-20(s0)
    8000651c:	a0f9                	j	800065ea <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    8000651e:	00036797          	auipc	a5,0x36
    80006522:	66a78793          	addi	a5,a5,1642 # 8003cb88 <log>
    80006526:	579c                	lw	a5,40(a5)
    80006528:	0007869b          	sext.w	a3,a5
    8000652c:	00036797          	auipc	a5,0x36
    80006530:	65c78793          	addi	a5,a5,1628 # 8003cb88 <log>
    80006534:	4f9c                	lw	a5,24(a5)
    80006536:	fec42703          	lw	a4,-20(s0)
    8000653a:	9fb9                	addw	a5,a5,a4
    8000653c:	2781                	sext.w	a5,a5
    8000653e:	2785                	addiw	a5,a5,1
    80006540:	2781                	sext.w	a5,a5
    80006542:	2781                	sext.w	a5,a5
    80006544:	85be                	mv	a1,a5
    80006546:	8536                	mv	a0,a3
    80006548:	ffffe097          	auipc	ra,0xffffe
    8000654c:	7dc080e7          	jalr	2012(ra) # 80004d24 <bread>
    80006550:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80006554:	00036797          	auipc	a5,0x36
    80006558:	63478793          	addi	a5,a5,1588 # 8003cb88 <log>
    8000655c:	579c                	lw	a5,40(a5)
    8000655e:	0007869b          	sext.w	a3,a5
    80006562:	00036717          	auipc	a4,0x36
    80006566:	62670713          	addi	a4,a4,1574 # 8003cb88 <log>
    8000656a:	fec42783          	lw	a5,-20(s0)
    8000656e:	07a1                	addi	a5,a5,8
    80006570:	078a                	slli	a5,a5,0x2
    80006572:	97ba                	add	a5,a5,a4
    80006574:	4b9c                	lw	a5,16(a5)
    80006576:	2781                	sext.w	a5,a5
    80006578:	85be                	mv	a1,a5
    8000657a:	8536                	mv	a0,a3
    8000657c:	ffffe097          	auipc	ra,0xffffe
    80006580:	7a8080e7          	jalr	1960(ra) # 80004d24 <bread>
    80006584:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006588:	fd843783          	ld	a5,-40(s0)
    8000658c:	05878713          	addi	a4,a5,88
    80006590:	fe043783          	ld	a5,-32(s0)
    80006594:	05878793          	addi	a5,a5,88
    80006598:	40000613          	li	a2,1024
    8000659c:	85be                	mv	a1,a5
    8000659e:	853a                	mv	a0,a4
    800065a0:	ffffb097          	auipc	ra,0xffffb
    800065a4:	080080e7          	jalr	128(ra) # 80001620 <memmove>
    bwrite(dbuf);  // write dst to disk
    800065a8:	fd843503          	ld	a0,-40(s0)
    800065ac:	ffffe097          	auipc	ra,0xffffe
    800065b0:	7d6080e7          	jalr	2006(ra) # 80004d82 <bwrite>
    if(recovering == 0)
    800065b4:	fcc42783          	lw	a5,-52(s0)
    800065b8:	2781                	sext.w	a5,a5
    800065ba:	e799                	bnez	a5,800065c8 <install_trans+0xbe>
      bunpin(dbuf);
    800065bc:	fd843503          	ld	a0,-40(s0)
    800065c0:	fffff097          	auipc	ra,0xfffff
    800065c4:	944080e7          	jalr	-1724(ra) # 80004f04 <bunpin>
    brelse(lbuf);
    800065c8:	fe043503          	ld	a0,-32(s0)
    800065cc:	fffff097          	auipc	ra,0xfffff
    800065d0:	802080e7          	jalr	-2046(ra) # 80004dce <brelse>
    brelse(dbuf);
    800065d4:	fd843503          	ld	a0,-40(s0)
    800065d8:	ffffe097          	auipc	ra,0xffffe
    800065dc:	7f6080e7          	jalr	2038(ra) # 80004dce <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800065e0:	fec42783          	lw	a5,-20(s0)
    800065e4:	2785                	addiw	a5,a5,1
    800065e6:	fef42623          	sw	a5,-20(s0)
    800065ea:	00036797          	auipc	a5,0x36
    800065ee:	59e78793          	addi	a5,a5,1438 # 8003cb88 <log>
    800065f2:	57d8                	lw	a4,44(a5)
    800065f4:	fec42783          	lw	a5,-20(s0)
    800065f8:	2781                	sext.w	a5,a5
    800065fa:	f2e7c2e3          	blt	a5,a4,8000651e <install_trans+0x14>
  }
}
    800065fe:	0001                	nop
    80006600:	0001                	nop
    80006602:	70e2                	ld	ra,56(sp)
    80006604:	7442                	ld	s0,48(sp)
    80006606:	6121                	addi	sp,sp,64
    80006608:	8082                	ret

000000008000660a <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    8000660a:	7179                	addi	sp,sp,-48
    8000660c:	f406                	sd	ra,40(sp)
    8000660e:	f022                	sd	s0,32(sp)
    80006610:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006612:	00036797          	auipc	a5,0x36
    80006616:	57678793          	addi	a5,a5,1398 # 8003cb88 <log>
    8000661a:	579c                	lw	a5,40(a5)
    8000661c:	0007871b          	sext.w	a4,a5
    80006620:	00036797          	auipc	a5,0x36
    80006624:	56878793          	addi	a5,a5,1384 # 8003cb88 <log>
    80006628:	4f9c                	lw	a5,24(a5)
    8000662a:	2781                	sext.w	a5,a5
    8000662c:	85be                	mv	a1,a5
    8000662e:	853a                	mv	a0,a4
    80006630:	ffffe097          	auipc	ra,0xffffe
    80006634:	6f4080e7          	jalr	1780(ra) # 80004d24 <bread>
    80006638:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    8000663c:	fe043783          	ld	a5,-32(s0)
    80006640:	05878793          	addi	a5,a5,88
    80006644:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006648:	fd843783          	ld	a5,-40(s0)
    8000664c:	4398                	lw	a4,0(a5)
    8000664e:	00036797          	auipc	a5,0x36
    80006652:	53a78793          	addi	a5,a5,1338 # 8003cb88 <log>
    80006656:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006658:	fe042623          	sw	zero,-20(s0)
    8000665c:	a03d                	j	8000668a <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    8000665e:	fd843703          	ld	a4,-40(s0)
    80006662:	fec42783          	lw	a5,-20(s0)
    80006666:	078a                	slli	a5,a5,0x2
    80006668:	97ba                	add	a5,a5,a4
    8000666a:	43d8                	lw	a4,4(a5)
    8000666c:	00036697          	auipc	a3,0x36
    80006670:	51c68693          	addi	a3,a3,1308 # 8003cb88 <log>
    80006674:	fec42783          	lw	a5,-20(s0)
    80006678:	07a1                	addi	a5,a5,8
    8000667a:	078a                	slli	a5,a5,0x2
    8000667c:	97b6                	add	a5,a5,a3
    8000667e:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006680:	fec42783          	lw	a5,-20(s0)
    80006684:	2785                	addiw	a5,a5,1
    80006686:	fef42623          	sw	a5,-20(s0)
    8000668a:	00036797          	auipc	a5,0x36
    8000668e:	4fe78793          	addi	a5,a5,1278 # 8003cb88 <log>
    80006692:	57d8                	lw	a4,44(a5)
    80006694:	fec42783          	lw	a5,-20(s0)
    80006698:	2781                	sext.w	a5,a5
    8000669a:	fce7c2e3          	blt	a5,a4,8000665e <read_head+0x54>
  }
  brelse(buf);
    8000669e:	fe043503          	ld	a0,-32(s0)
    800066a2:	ffffe097          	auipc	ra,0xffffe
    800066a6:	72c080e7          	jalr	1836(ra) # 80004dce <brelse>
}
    800066aa:	0001                	nop
    800066ac:	70a2                	ld	ra,40(sp)
    800066ae:	7402                	ld	s0,32(sp)
    800066b0:	6145                	addi	sp,sp,48
    800066b2:	8082                	ret

00000000800066b4 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    800066b4:	7179                	addi	sp,sp,-48
    800066b6:	f406                	sd	ra,40(sp)
    800066b8:	f022                	sd	s0,32(sp)
    800066ba:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800066bc:	00036797          	auipc	a5,0x36
    800066c0:	4cc78793          	addi	a5,a5,1228 # 8003cb88 <log>
    800066c4:	579c                	lw	a5,40(a5)
    800066c6:	0007871b          	sext.w	a4,a5
    800066ca:	00036797          	auipc	a5,0x36
    800066ce:	4be78793          	addi	a5,a5,1214 # 8003cb88 <log>
    800066d2:	4f9c                	lw	a5,24(a5)
    800066d4:	2781                	sext.w	a5,a5
    800066d6:	85be                	mv	a1,a5
    800066d8:	853a                	mv	a0,a4
    800066da:	ffffe097          	auipc	ra,0xffffe
    800066de:	64a080e7          	jalr	1610(ra) # 80004d24 <bread>
    800066e2:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800066e6:	fe043783          	ld	a5,-32(s0)
    800066ea:	05878793          	addi	a5,a5,88
    800066ee:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    800066f2:	00036797          	auipc	a5,0x36
    800066f6:	49678793          	addi	a5,a5,1174 # 8003cb88 <log>
    800066fa:	57d8                	lw	a4,44(a5)
    800066fc:	fd843783          	ld	a5,-40(s0)
    80006700:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006702:	fe042623          	sw	zero,-20(s0)
    80006706:	a03d                	j	80006734 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006708:	00036717          	auipc	a4,0x36
    8000670c:	48070713          	addi	a4,a4,1152 # 8003cb88 <log>
    80006710:	fec42783          	lw	a5,-20(s0)
    80006714:	07a1                	addi	a5,a5,8
    80006716:	078a                	slli	a5,a5,0x2
    80006718:	97ba                	add	a5,a5,a4
    8000671a:	4b98                	lw	a4,16(a5)
    8000671c:	fd843683          	ld	a3,-40(s0)
    80006720:	fec42783          	lw	a5,-20(s0)
    80006724:	078a                	slli	a5,a5,0x2
    80006726:	97b6                	add	a5,a5,a3
    80006728:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000672a:	fec42783          	lw	a5,-20(s0)
    8000672e:	2785                	addiw	a5,a5,1
    80006730:	fef42623          	sw	a5,-20(s0)
    80006734:	00036797          	auipc	a5,0x36
    80006738:	45478793          	addi	a5,a5,1108 # 8003cb88 <log>
    8000673c:	57d8                	lw	a4,44(a5)
    8000673e:	fec42783          	lw	a5,-20(s0)
    80006742:	2781                	sext.w	a5,a5
    80006744:	fce7c2e3          	blt	a5,a4,80006708 <write_head+0x54>
  }
  bwrite(buf);
    80006748:	fe043503          	ld	a0,-32(s0)
    8000674c:	ffffe097          	auipc	ra,0xffffe
    80006750:	636080e7          	jalr	1590(ra) # 80004d82 <bwrite>
  brelse(buf);
    80006754:	fe043503          	ld	a0,-32(s0)
    80006758:	ffffe097          	auipc	ra,0xffffe
    8000675c:	676080e7          	jalr	1654(ra) # 80004dce <brelse>
}
    80006760:	0001                	nop
    80006762:	70a2                	ld	ra,40(sp)
    80006764:	7402                	ld	s0,32(sp)
    80006766:	6145                	addi	sp,sp,48
    80006768:	8082                	ret

000000008000676a <recover_from_log>:

static void
recover_from_log(void)
{
    8000676a:	1141                	addi	sp,sp,-16
    8000676c:	e406                	sd	ra,8(sp)
    8000676e:	e022                	sd	s0,0(sp)
    80006770:	0800                	addi	s0,sp,16
  read_head();
    80006772:	00000097          	auipc	ra,0x0
    80006776:	e98080e7          	jalr	-360(ra) # 8000660a <read_head>
  install_trans(1); // if committed, copy from log to disk
    8000677a:	4505                	li	a0,1
    8000677c:	00000097          	auipc	ra,0x0
    80006780:	d8e080e7          	jalr	-626(ra) # 8000650a <install_trans>
  log.lh.n = 0;
    80006784:	00036797          	auipc	a5,0x36
    80006788:	40478793          	addi	a5,a5,1028 # 8003cb88 <log>
    8000678c:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    80006790:	00000097          	auipc	ra,0x0
    80006794:	f24080e7          	jalr	-220(ra) # 800066b4 <write_head>
}
    80006798:	0001                	nop
    8000679a:	60a2                	ld	ra,8(sp)
    8000679c:	6402                	ld	s0,0(sp)
    8000679e:	0141                	addi	sp,sp,16
    800067a0:	8082                	ret

00000000800067a2 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800067a2:	1141                	addi	sp,sp,-16
    800067a4:	e406                	sd	ra,8(sp)
    800067a6:	e022                	sd	s0,0(sp)
    800067a8:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800067aa:	00036517          	auipc	a0,0x36
    800067ae:	3de50513          	addi	a0,a0,990 # 8003cb88 <log>
    800067b2:	ffffb097          	auipc	ra,0xffffb
    800067b6:	bb6080e7          	jalr	-1098(ra) # 80001368 <acquire>
  while(1){
    if(log.committing){
    800067ba:	00036797          	auipc	a5,0x36
    800067be:	3ce78793          	addi	a5,a5,974 # 8003cb88 <log>
    800067c2:	53dc                	lw	a5,36(a5)
    800067c4:	cf91                	beqz	a5,800067e0 <begin_op+0x3e>
      sleep(&log, &log.lock);
    800067c6:	00036597          	auipc	a1,0x36
    800067ca:	3c258593          	addi	a1,a1,962 # 8003cb88 <log>
    800067ce:	00036517          	auipc	a0,0x36
    800067d2:	3ba50513          	addi	a0,a0,954 # 8003cb88 <log>
    800067d6:	ffffd097          	auipc	ra,0xffffd
    800067da:	264080e7          	jalr	612(ra) # 80003a3a <sleep>
    800067de:	bff1                	j	800067ba <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800067e0:	00036797          	auipc	a5,0x36
    800067e4:	3a878793          	addi	a5,a5,936 # 8003cb88 <log>
    800067e8:	57d8                	lw	a4,44(a5)
    800067ea:	00036797          	auipc	a5,0x36
    800067ee:	39e78793          	addi	a5,a5,926 # 8003cb88 <log>
    800067f2:	539c                	lw	a5,32(a5)
    800067f4:	2785                	addiw	a5,a5,1
    800067f6:	2781                	sext.w	a5,a5
    800067f8:	86be                	mv	a3,a5
    800067fa:	87b6                	mv	a5,a3
    800067fc:	0027979b          	slliw	a5,a5,0x2
    80006800:	9fb5                	addw	a5,a5,a3
    80006802:	0017979b          	slliw	a5,a5,0x1
    80006806:	2781                	sext.w	a5,a5
    80006808:	9fb9                	addw	a5,a5,a4
    8000680a:	2781                	sext.w	a5,a5
    8000680c:	873e                	mv	a4,a5
    8000680e:	47f9                	li	a5,30
    80006810:	00e7df63          	bge	a5,a4,8000682e <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    80006814:	00036597          	auipc	a1,0x36
    80006818:	37458593          	addi	a1,a1,884 # 8003cb88 <log>
    8000681c:	00036517          	auipc	a0,0x36
    80006820:	36c50513          	addi	a0,a0,876 # 8003cb88 <log>
    80006824:	ffffd097          	auipc	ra,0xffffd
    80006828:	216080e7          	jalr	534(ra) # 80003a3a <sleep>
    8000682c:	b779                	j	800067ba <begin_op+0x18>
    } else {
      log.outstanding += 1;
    8000682e:	00036797          	auipc	a5,0x36
    80006832:	35a78793          	addi	a5,a5,858 # 8003cb88 <log>
    80006836:	539c                	lw	a5,32(a5)
    80006838:	2785                	addiw	a5,a5,1
    8000683a:	0007871b          	sext.w	a4,a5
    8000683e:	00036797          	auipc	a5,0x36
    80006842:	34a78793          	addi	a5,a5,842 # 8003cb88 <log>
    80006846:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006848:	00036517          	auipc	a0,0x36
    8000684c:	34050513          	addi	a0,a0,832 # 8003cb88 <log>
    80006850:	ffffb097          	auipc	ra,0xffffb
    80006854:	b7c080e7          	jalr	-1156(ra) # 800013cc <release>
      break;
    80006858:	0001                	nop
    }
  }
}
    8000685a:	0001                	nop
    8000685c:	60a2                	ld	ra,8(sp)
    8000685e:	6402                	ld	s0,0(sp)
    80006860:	0141                	addi	sp,sp,16
    80006862:	8082                	ret

0000000080006864 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80006864:	1101                	addi	sp,sp,-32
    80006866:	ec06                	sd	ra,24(sp)
    80006868:	e822                	sd	s0,16(sp)
    8000686a:	1000                	addi	s0,sp,32
  int do_commit = 0;
    8000686c:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006870:	00036517          	auipc	a0,0x36
    80006874:	31850513          	addi	a0,a0,792 # 8003cb88 <log>
    80006878:	ffffb097          	auipc	ra,0xffffb
    8000687c:	af0080e7          	jalr	-1296(ra) # 80001368 <acquire>
  log.outstanding -= 1;
    80006880:	00036797          	auipc	a5,0x36
    80006884:	30878793          	addi	a5,a5,776 # 8003cb88 <log>
    80006888:	539c                	lw	a5,32(a5)
    8000688a:	37fd                	addiw	a5,a5,-1
    8000688c:	0007871b          	sext.w	a4,a5
    80006890:	00036797          	auipc	a5,0x36
    80006894:	2f878793          	addi	a5,a5,760 # 8003cb88 <log>
    80006898:	d398                	sw	a4,32(a5)
  if(log.committing)
    8000689a:	00036797          	auipc	a5,0x36
    8000689e:	2ee78793          	addi	a5,a5,750 # 8003cb88 <log>
    800068a2:	53dc                	lw	a5,36(a5)
    800068a4:	cb89                	beqz	a5,800068b6 <end_op+0x52>
    panic("log.committing");
    800068a6:	00006517          	auipc	a0,0x6
    800068aa:	cba50513          	addi	a0,a0,-838 # 8000c560 <etext+0x560>
    800068ae:	ffffa097          	auipc	ra,0xffffa
    800068b2:	3de080e7          	jalr	990(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    800068b6:	00036797          	auipc	a5,0x36
    800068ba:	2d278793          	addi	a5,a5,722 # 8003cb88 <log>
    800068be:	539c                	lw	a5,32(a5)
    800068c0:	eb99                	bnez	a5,800068d6 <end_op+0x72>
    do_commit = 1;
    800068c2:	4785                	li	a5,1
    800068c4:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800068c8:	00036797          	auipc	a5,0x36
    800068cc:	2c078793          	addi	a5,a5,704 # 8003cb88 <log>
    800068d0:	4705                	li	a4,1
    800068d2:	d3d8                	sw	a4,36(a5)
    800068d4:	a809                	j	800068e6 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800068d6:	00036517          	auipc	a0,0x36
    800068da:	2b250513          	addi	a0,a0,690 # 8003cb88 <log>
    800068de:	ffffd097          	auipc	ra,0xffffd
    800068e2:	1d8080e7          	jalr	472(ra) # 80003ab6 <wakeup>
  }
  release(&log.lock);
    800068e6:	00036517          	auipc	a0,0x36
    800068ea:	2a250513          	addi	a0,a0,674 # 8003cb88 <log>
    800068ee:	ffffb097          	auipc	ra,0xffffb
    800068f2:	ade080e7          	jalr	-1314(ra) # 800013cc <release>

  if(do_commit){
    800068f6:	fec42783          	lw	a5,-20(s0)
    800068fa:	2781                	sext.w	a5,a5
    800068fc:	c3b9                	beqz	a5,80006942 <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800068fe:	00000097          	auipc	ra,0x0
    80006902:	134080e7          	jalr	308(ra) # 80006a32 <commit>
    acquire(&log.lock);
    80006906:	00036517          	auipc	a0,0x36
    8000690a:	28250513          	addi	a0,a0,642 # 8003cb88 <log>
    8000690e:	ffffb097          	auipc	ra,0xffffb
    80006912:	a5a080e7          	jalr	-1446(ra) # 80001368 <acquire>
    log.committing = 0;
    80006916:	00036797          	auipc	a5,0x36
    8000691a:	27278793          	addi	a5,a5,626 # 8003cb88 <log>
    8000691e:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    80006922:	00036517          	auipc	a0,0x36
    80006926:	26650513          	addi	a0,a0,614 # 8003cb88 <log>
    8000692a:	ffffd097          	auipc	ra,0xffffd
    8000692e:	18c080e7          	jalr	396(ra) # 80003ab6 <wakeup>
    release(&log.lock);
    80006932:	00036517          	auipc	a0,0x36
    80006936:	25650513          	addi	a0,a0,598 # 8003cb88 <log>
    8000693a:	ffffb097          	auipc	ra,0xffffb
    8000693e:	a92080e7          	jalr	-1390(ra) # 800013cc <release>
  }
}
    80006942:	0001                	nop
    80006944:	60e2                	ld	ra,24(sp)
    80006946:	6442                	ld	s0,16(sp)
    80006948:	6105                	addi	sp,sp,32
    8000694a:	8082                	ret

000000008000694c <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    8000694c:	7179                	addi	sp,sp,-48
    8000694e:	f406                	sd	ra,40(sp)
    80006950:	f022                	sd	s0,32(sp)
    80006952:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006954:	fe042623          	sw	zero,-20(s0)
    80006958:	a86d                	j	80006a12 <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    8000695a:	00036797          	auipc	a5,0x36
    8000695e:	22e78793          	addi	a5,a5,558 # 8003cb88 <log>
    80006962:	579c                	lw	a5,40(a5)
    80006964:	0007869b          	sext.w	a3,a5
    80006968:	00036797          	auipc	a5,0x36
    8000696c:	22078793          	addi	a5,a5,544 # 8003cb88 <log>
    80006970:	4f9c                	lw	a5,24(a5)
    80006972:	fec42703          	lw	a4,-20(s0)
    80006976:	9fb9                	addw	a5,a5,a4
    80006978:	2781                	sext.w	a5,a5
    8000697a:	2785                	addiw	a5,a5,1
    8000697c:	2781                	sext.w	a5,a5
    8000697e:	2781                	sext.w	a5,a5
    80006980:	85be                	mv	a1,a5
    80006982:	8536                	mv	a0,a3
    80006984:	ffffe097          	auipc	ra,0xffffe
    80006988:	3a0080e7          	jalr	928(ra) # 80004d24 <bread>
    8000698c:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80006990:	00036797          	auipc	a5,0x36
    80006994:	1f878793          	addi	a5,a5,504 # 8003cb88 <log>
    80006998:	579c                	lw	a5,40(a5)
    8000699a:	0007869b          	sext.w	a3,a5
    8000699e:	00036717          	auipc	a4,0x36
    800069a2:	1ea70713          	addi	a4,a4,490 # 8003cb88 <log>
    800069a6:	fec42783          	lw	a5,-20(s0)
    800069aa:	07a1                	addi	a5,a5,8
    800069ac:	078a                	slli	a5,a5,0x2
    800069ae:	97ba                	add	a5,a5,a4
    800069b0:	4b9c                	lw	a5,16(a5)
    800069b2:	2781                	sext.w	a5,a5
    800069b4:	85be                	mv	a1,a5
    800069b6:	8536                	mv	a0,a3
    800069b8:	ffffe097          	auipc	ra,0xffffe
    800069bc:	36c080e7          	jalr	876(ra) # 80004d24 <bread>
    800069c0:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800069c4:	fe043783          	ld	a5,-32(s0)
    800069c8:	05878713          	addi	a4,a5,88
    800069cc:	fd843783          	ld	a5,-40(s0)
    800069d0:	05878793          	addi	a5,a5,88
    800069d4:	40000613          	li	a2,1024
    800069d8:	85be                	mv	a1,a5
    800069da:	853a                	mv	a0,a4
    800069dc:	ffffb097          	auipc	ra,0xffffb
    800069e0:	c44080e7          	jalr	-956(ra) # 80001620 <memmove>
    bwrite(to);  // write the log
    800069e4:	fe043503          	ld	a0,-32(s0)
    800069e8:	ffffe097          	auipc	ra,0xffffe
    800069ec:	39a080e7          	jalr	922(ra) # 80004d82 <bwrite>
    brelse(from);
    800069f0:	fd843503          	ld	a0,-40(s0)
    800069f4:	ffffe097          	auipc	ra,0xffffe
    800069f8:	3da080e7          	jalr	986(ra) # 80004dce <brelse>
    brelse(to);
    800069fc:	fe043503          	ld	a0,-32(s0)
    80006a00:	ffffe097          	auipc	ra,0xffffe
    80006a04:	3ce080e7          	jalr	974(ra) # 80004dce <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006a08:	fec42783          	lw	a5,-20(s0)
    80006a0c:	2785                	addiw	a5,a5,1
    80006a0e:	fef42623          	sw	a5,-20(s0)
    80006a12:	00036797          	auipc	a5,0x36
    80006a16:	17678793          	addi	a5,a5,374 # 8003cb88 <log>
    80006a1a:	57d8                	lw	a4,44(a5)
    80006a1c:	fec42783          	lw	a5,-20(s0)
    80006a20:	2781                	sext.w	a5,a5
    80006a22:	f2e7cce3          	blt	a5,a4,8000695a <write_log+0xe>
  }
}
    80006a26:	0001                	nop
    80006a28:	0001                	nop
    80006a2a:	70a2                	ld	ra,40(sp)
    80006a2c:	7402                	ld	s0,32(sp)
    80006a2e:	6145                	addi	sp,sp,48
    80006a30:	8082                	ret

0000000080006a32 <commit>:

static void
commit()
{
    80006a32:	1141                	addi	sp,sp,-16
    80006a34:	e406                	sd	ra,8(sp)
    80006a36:	e022                	sd	s0,0(sp)
    80006a38:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006a3a:	00036797          	auipc	a5,0x36
    80006a3e:	14e78793          	addi	a5,a5,334 # 8003cb88 <log>
    80006a42:	57dc                	lw	a5,44(a5)
    80006a44:	02f05963          	blez	a5,80006a76 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006a48:	00000097          	auipc	ra,0x0
    80006a4c:	f04080e7          	jalr	-252(ra) # 8000694c <write_log>
    write_head();    // Write header to disk -- the real commit
    80006a50:	00000097          	auipc	ra,0x0
    80006a54:	c64080e7          	jalr	-924(ra) # 800066b4 <write_head>
    install_trans(0); // Now install writes to home locations
    80006a58:	4501                	li	a0,0
    80006a5a:	00000097          	auipc	ra,0x0
    80006a5e:	ab0080e7          	jalr	-1360(ra) # 8000650a <install_trans>
    log.lh.n = 0;
    80006a62:	00036797          	auipc	a5,0x36
    80006a66:	12678793          	addi	a5,a5,294 # 8003cb88 <log>
    80006a6a:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006a6e:	00000097          	auipc	ra,0x0
    80006a72:	c46080e7          	jalr	-954(ra) # 800066b4 <write_head>
  }
}
    80006a76:	0001                	nop
    80006a78:	60a2                	ld	ra,8(sp)
    80006a7a:	6402                	ld	s0,0(sp)
    80006a7c:	0141                	addi	sp,sp,16
    80006a7e:	8082                	ret

0000000080006a80 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006a80:	7179                	addi	sp,sp,-48
    80006a82:	f406                	sd	ra,40(sp)
    80006a84:	f022                	sd	s0,32(sp)
    80006a86:	1800                	addi	s0,sp,48
    80006a88:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006a8c:	00036517          	auipc	a0,0x36
    80006a90:	0fc50513          	addi	a0,a0,252 # 8003cb88 <log>
    80006a94:	ffffb097          	auipc	ra,0xffffb
    80006a98:	8d4080e7          	jalr	-1836(ra) # 80001368 <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006a9c:	00036797          	auipc	a5,0x36
    80006aa0:	0ec78793          	addi	a5,a5,236 # 8003cb88 <log>
    80006aa4:	57dc                	lw	a5,44(a5)
    80006aa6:	873e                	mv	a4,a5
    80006aa8:	47f5                	li	a5,29
    80006aaa:	02e7c063          	blt	a5,a4,80006aca <log_write+0x4a>
    80006aae:	00036797          	auipc	a5,0x36
    80006ab2:	0da78793          	addi	a5,a5,218 # 8003cb88 <log>
    80006ab6:	57d8                	lw	a4,44(a5)
    80006ab8:	00036797          	auipc	a5,0x36
    80006abc:	0d078793          	addi	a5,a5,208 # 8003cb88 <log>
    80006ac0:	4fdc                	lw	a5,28(a5)
    80006ac2:	37fd                	addiw	a5,a5,-1
    80006ac4:	2781                	sext.w	a5,a5
    80006ac6:	00f74a63          	blt	a4,a5,80006ada <log_write+0x5a>
    panic("too big a transaction");
    80006aca:	00006517          	auipc	a0,0x6
    80006ace:	aa650513          	addi	a0,a0,-1370 # 8000c570 <etext+0x570>
    80006ad2:	ffffa097          	auipc	ra,0xffffa
    80006ad6:	1ba080e7          	jalr	442(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    80006ada:	00036797          	auipc	a5,0x36
    80006ade:	0ae78793          	addi	a5,a5,174 # 8003cb88 <log>
    80006ae2:	539c                	lw	a5,32(a5)
    80006ae4:	00f04a63          	bgtz	a5,80006af8 <log_write+0x78>
    panic("log_write outside of trans");
    80006ae8:	00006517          	auipc	a0,0x6
    80006aec:	aa050513          	addi	a0,a0,-1376 # 8000c588 <etext+0x588>
    80006af0:	ffffa097          	auipc	ra,0xffffa
    80006af4:	19c080e7          	jalr	412(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006af8:	fe042623          	sw	zero,-20(s0)
    80006afc:	a03d                	j	80006b2a <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006afe:	00036717          	auipc	a4,0x36
    80006b02:	08a70713          	addi	a4,a4,138 # 8003cb88 <log>
    80006b06:	fec42783          	lw	a5,-20(s0)
    80006b0a:	07a1                	addi	a5,a5,8
    80006b0c:	078a                	slli	a5,a5,0x2
    80006b0e:	97ba                	add	a5,a5,a4
    80006b10:	4b9c                	lw	a5,16(a5)
    80006b12:	0007871b          	sext.w	a4,a5
    80006b16:	fd843783          	ld	a5,-40(s0)
    80006b1a:	47dc                	lw	a5,12(a5)
    80006b1c:	02f70263          	beq	a4,a5,80006b40 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    80006b20:	fec42783          	lw	a5,-20(s0)
    80006b24:	2785                	addiw	a5,a5,1
    80006b26:	fef42623          	sw	a5,-20(s0)
    80006b2a:	00036797          	auipc	a5,0x36
    80006b2e:	05e78793          	addi	a5,a5,94 # 8003cb88 <log>
    80006b32:	57d8                	lw	a4,44(a5)
    80006b34:	fec42783          	lw	a5,-20(s0)
    80006b38:	2781                	sext.w	a5,a5
    80006b3a:	fce7c2e3          	blt	a5,a4,80006afe <log_write+0x7e>
    80006b3e:	a011                	j	80006b42 <log_write+0xc2>
      break;
    80006b40:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80006b42:	fd843783          	ld	a5,-40(s0)
    80006b46:	47dc                	lw	a5,12(a5)
    80006b48:	0007871b          	sext.w	a4,a5
    80006b4c:	00036697          	auipc	a3,0x36
    80006b50:	03c68693          	addi	a3,a3,60 # 8003cb88 <log>
    80006b54:	fec42783          	lw	a5,-20(s0)
    80006b58:	07a1                	addi	a5,a5,8
    80006b5a:	078a                	slli	a5,a5,0x2
    80006b5c:	97b6                	add	a5,a5,a3
    80006b5e:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006b60:	00036797          	auipc	a5,0x36
    80006b64:	02878793          	addi	a5,a5,40 # 8003cb88 <log>
    80006b68:	57d8                	lw	a4,44(a5)
    80006b6a:	fec42783          	lw	a5,-20(s0)
    80006b6e:	2781                	sext.w	a5,a5
    80006b70:	02e79563          	bne	a5,a4,80006b9a <log_write+0x11a>
    bpin(b);
    80006b74:	fd843503          	ld	a0,-40(s0)
    80006b78:	ffffe097          	auipc	ra,0xffffe
    80006b7c:	344080e7          	jalr	836(ra) # 80004ebc <bpin>
    log.lh.n++;
    80006b80:	00036797          	auipc	a5,0x36
    80006b84:	00878793          	addi	a5,a5,8 # 8003cb88 <log>
    80006b88:	57dc                	lw	a5,44(a5)
    80006b8a:	2785                	addiw	a5,a5,1
    80006b8c:	0007871b          	sext.w	a4,a5
    80006b90:	00036797          	auipc	a5,0x36
    80006b94:	ff878793          	addi	a5,a5,-8 # 8003cb88 <log>
    80006b98:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006b9a:	00036517          	auipc	a0,0x36
    80006b9e:	fee50513          	addi	a0,a0,-18 # 8003cb88 <log>
    80006ba2:	ffffb097          	auipc	ra,0xffffb
    80006ba6:	82a080e7          	jalr	-2006(ra) # 800013cc <release>
}
    80006baa:	0001                	nop
    80006bac:	70a2                	ld	ra,40(sp)
    80006bae:	7402                	ld	s0,32(sp)
    80006bb0:	6145                	addi	sp,sp,48
    80006bb2:	8082                	ret

0000000080006bb4 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80006bb4:	1101                	addi	sp,sp,-32
    80006bb6:	ec06                	sd	ra,24(sp)
    80006bb8:	e822                	sd	s0,16(sp)
    80006bba:	1000                	addi	s0,sp,32
    80006bbc:	fea43423          	sd	a0,-24(s0)
    80006bc0:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    80006bc4:	fe843783          	ld	a5,-24(s0)
    80006bc8:	07a1                	addi	a5,a5,8
    80006bca:	00006597          	auipc	a1,0x6
    80006bce:	9de58593          	addi	a1,a1,-1570 # 8000c5a8 <etext+0x5a8>
    80006bd2:	853e                	mv	a0,a5
    80006bd4:	ffffa097          	auipc	ra,0xffffa
    80006bd8:	764080e7          	jalr	1892(ra) # 80001338 <initlock>
  lk->name = name;
    80006bdc:	fe843783          	ld	a5,-24(s0)
    80006be0:	fe043703          	ld	a4,-32(s0)
    80006be4:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006be6:	fe843783          	ld	a5,-24(s0)
    80006bea:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006bee:	fe843783          	ld	a5,-24(s0)
    80006bf2:	0207a423          	sw	zero,40(a5)
}
    80006bf6:	0001                	nop
    80006bf8:	60e2                	ld	ra,24(sp)
    80006bfa:	6442                	ld	s0,16(sp)
    80006bfc:	6105                	addi	sp,sp,32
    80006bfe:	8082                	ret

0000000080006c00 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80006c00:	1101                	addi	sp,sp,-32
    80006c02:	ec06                	sd	ra,24(sp)
    80006c04:	e822                	sd	s0,16(sp)
    80006c06:	1000                	addi	s0,sp,32
    80006c08:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006c0c:	fe843783          	ld	a5,-24(s0)
    80006c10:	07a1                	addi	a5,a5,8
    80006c12:	853e                	mv	a0,a5
    80006c14:	ffffa097          	auipc	ra,0xffffa
    80006c18:	754080e7          	jalr	1876(ra) # 80001368 <acquire>
  while (lk->locked) {
    80006c1c:	a819                	j	80006c32 <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006c1e:	fe843783          	ld	a5,-24(s0)
    80006c22:	07a1                	addi	a5,a5,8
    80006c24:	85be                	mv	a1,a5
    80006c26:	fe843503          	ld	a0,-24(s0)
    80006c2a:	ffffd097          	auipc	ra,0xffffd
    80006c2e:	e10080e7          	jalr	-496(ra) # 80003a3a <sleep>
  while (lk->locked) {
    80006c32:	fe843783          	ld	a5,-24(s0)
    80006c36:	439c                	lw	a5,0(a5)
    80006c38:	f3fd                	bnez	a5,80006c1e <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006c3a:	fe843783          	ld	a5,-24(s0)
    80006c3e:	4705                	li	a4,1
    80006c40:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80006c42:	ffffc097          	auipc	ra,0xffffc
    80006c46:	236080e7          	jalr	566(ra) # 80002e78 <myproc>
    80006c4a:	87aa                	mv	a5,a0
    80006c4c:	5b98                	lw	a4,48(a5)
    80006c4e:	fe843783          	ld	a5,-24(s0)
    80006c52:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006c54:	fe843783          	ld	a5,-24(s0)
    80006c58:	07a1                	addi	a5,a5,8
    80006c5a:	853e                	mv	a0,a5
    80006c5c:	ffffa097          	auipc	ra,0xffffa
    80006c60:	770080e7          	jalr	1904(ra) # 800013cc <release>
}
    80006c64:	0001                	nop
    80006c66:	60e2                	ld	ra,24(sp)
    80006c68:	6442                	ld	s0,16(sp)
    80006c6a:	6105                	addi	sp,sp,32
    80006c6c:	8082                	ret

0000000080006c6e <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006c6e:	1101                	addi	sp,sp,-32
    80006c70:	ec06                	sd	ra,24(sp)
    80006c72:	e822                	sd	s0,16(sp)
    80006c74:	1000                	addi	s0,sp,32
    80006c76:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006c7a:	fe843783          	ld	a5,-24(s0)
    80006c7e:	07a1                	addi	a5,a5,8
    80006c80:	853e                	mv	a0,a5
    80006c82:	ffffa097          	auipc	ra,0xffffa
    80006c86:	6e6080e7          	jalr	1766(ra) # 80001368 <acquire>
  lk->locked = 0;
    80006c8a:	fe843783          	ld	a5,-24(s0)
    80006c8e:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006c92:	fe843783          	ld	a5,-24(s0)
    80006c96:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006c9a:	fe843503          	ld	a0,-24(s0)
    80006c9e:	ffffd097          	auipc	ra,0xffffd
    80006ca2:	e18080e7          	jalr	-488(ra) # 80003ab6 <wakeup>
  release(&lk->lk);
    80006ca6:	fe843783          	ld	a5,-24(s0)
    80006caa:	07a1                	addi	a5,a5,8
    80006cac:	853e                	mv	a0,a5
    80006cae:	ffffa097          	auipc	ra,0xffffa
    80006cb2:	71e080e7          	jalr	1822(ra) # 800013cc <release>
}
    80006cb6:	0001                	nop
    80006cb8:	60e2                	ld	ra,24(sp)
    80006cba:	6442                	ld	s0,16(sp)
    80006cbc:	6105                	addi	sp,sp,32
    80006cbe:	8082                	ret

0000000080006cc0 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006cc0:	7139                	addi	sp,sp,-64
    80006cc2:	fc06                	sd	ra,56(sp)
    80006cc4:	f822                	sd	s0,48(sp)
    80006cc6:	f426                	sd	s1,40(sp)
    80006cc8:	0080                	addi	s0,sp,64
    80006cca:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006cce:	fc843783          	ld	a5,-56(s0)
    80006cd2:	07a1                	addi	a5,a5,8
    80006cd4:	853e                	mv	a0,a5
    80006cd6:	ffffa097          	auipc	ra,0xffffa
    80006cda:	692080e7          	jalr	1682(ra) # 80001368 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006cde:	fc843783          	ld	a5,-56(s0)
    80006ce2:	439c                	lw	a5,0(a5)
    80006ce4:	cf99                	beqz	a5,80006d02 <holdingsleep+0x42>
    80006ce6:	fc843783          	ld	a5,-56(s0)
    80006cea:	5784                	lw	s1,40(a5)
    80006cec:	ffffc097          	auipc	ra,0xffffc
    80006cf0:	18c080e7          	jalr	396(ra) # 80002e78 <myproc>
    80006cf4:	87aa                	mv	a5,a0
    80006cf6:	5b9c                	lw	a5,48(a5)
    80006cf8:	8726                	mv	a4,s1
    80006cfa:	00f71463          	bne	a4,a5,80006d02 <holdingsleep+0x42>
    80006cfe:	4785                	li	a5,1
    80006d00:	a011                	j	80006d04 <holdingsleep+0x44>
    80006d02:	4781                	li	a5,0
    80006d04:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006d08:	fc843783          	ld	a5,-56(s0)
    80006d0c:	07a1                	addi	a5,a5,8
    80006d0e:	853e                	mv	a0,a5
    80006d10:	ffffa097          	auipc	ra,0xffffa
    80006d14:	6bc080e7          	jalr	1724(ra) # 800013cc <release>
  return r;
    80006d18:	fdc42783          	lw	a5,-36(s0)
}
    80006d1c:	853e                	mv	a0,a5
    80006d1e:	70e2                	ld	ra,56(sp)
    80006d20:	7442                	ld	s0,48(sp)
    80006d22:	74a2                	ld	s1,40(sp)
    80006d24:	6121                	addi	sp,sp,64
    80006d26:	8082                	ret

0000000080006d28 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006d28:	1141                	addi	sp,sp,-16
    80006d2a:	e406                	sd	ra,8(sp)
    80006d2c:	e022                	sd	s0,0(sp)
    80006d2e:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006d30:	00006597          	auipc	a1,0x6
    80006d34:	88858593          	addi	a1,a1,-1912 # 8000c5b8 <etext+0x5b8>
    80006d38:	00036517          	auipc	a0,0x36
    80006d3c:	f9850513          	addi	a0,a0,-104 # 8003ccd0 <ftable>
    80006d40:	ffffa097          	auipc	ra,0xffffa
    80006d44:	5f8080e7          	jalr	1528(ra) # 80001338 <initlock>
}
    80006d48:	0001                	nop
    80006d4a:	60a2                	ld	ra,8(sp)
    80006d4c:	6402                	ld	s0,0(sp)
    80006d4e:	0141                	addi	sp,sp,16
    80006d50:	8082                	ret

0000000080006d52 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006d52:	1101                	addi	sp,sp,-32
    80006d54:	ec06                	sd	ra,24(sp)
    80006d56:	e822                	sd	s0,16(sp)
    80006d58:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006d5a:	00036517          	auipc	a0,0x36
    80006d5e:	f7650513          	addi	a0,a0,-138 # 8003ccd0 <ftable>
    80006d62:	ffffa097          	auipc	ra,0xffffa
    80006d66:	606080e7          	jalr	1542(ra) # 80001368 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006d6a:	00036797          	auipc	a5,0x36
    80006d6e:	f7e78793          	addi	a5,a5,-130 # 8003cce8 <ftable+0x18>
    80006d72:	fef43423          	sd	a5,-24(s0)
    80006d76:	a815                	j	80006daa <filealloc+0x58>
    if(f->ref == 0){
    80006d78:	fe843783          	ld	a5,-24(s0)
    80006d7c:	43dc                	lw	a5,4(a5)
    80006d7e:	e385                	bnez	a5,80006d9e <filealloc+0x4c>
      f->ref = 1;
    80006d80:	fe843783          	ld	a5,-24(s0)
    80006d84:	4705                	li	a4,1
    80006d86:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006d88:	00036517          	auipc	a0,0x36
    80006d8c:	f4850513          	addi	a0,a0,-184 # 8003ccd0 <ftable>
    80006d90:	ffffa097          	auipc	ra,0xffffa
    80006d94:	63c080e7          	jalr	1596(ra) # 800013cc <release>
      return f;
    80006d98:	fe843783          	ld	a5,-24(s0)
    80006d9c:	a805                	j	80006dcc <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006d9e:	fe843783          	ld	a5,-24(s0)
    80006da2:	02878793          	addi	a5,a5,40
    80006da6:	fef43423          	sd	a5,-24(s0)
    80006daa:	00037797          	auipc	a5,0x37
    80006dae:	ede78793          	addi	a5,a5,-290 # 8003dc88 <disk>
    80006db2:	fe843703          	ld	a4,-24(s0)
    80006db6:	fcf761e3          	bltu	a4,a5,80006d78 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006dba:	00036517          	auipc	a0,0x36
    80006dbe:	f1650513          	addi	a0,a0,-234 # 8003ccd0 <ftable>
    80006dc2:	ffffa097          	auipc	ra,0xffffa
    80006dc6:	60a080e7          	jalr	1546(ra) # 800013cc <release>
  return 0;
    80006dca:	4781                	li	a5,0
}
    80006dcc:	853e                	mv	a0,a5
    80006dce:	60e2                	ld	ra,24(sp)
    80006dd0:	6442                	ld	s0,16(sp)
    80006dd2:	6105                	addi	sp,sp,32
    80006dd4:	8082                	ret

0000000080006dd6 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006dd6:	1101                	addi	sp,sp,-32
    80006dd8:	ec06                	sd	ra,24(sp)
    80006dda:	e822                	sd	s0,16(sp)
    80006ddc:	1000                	addi	s0,sp,32
    80006dde:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006de2:	00036517          	auipc	a0,0x36
    80006de6:	eee50513          	addi	a0,a0,-274 # 8003ccd0 <ftable>
    80006dea:	ffffa097          	auipc	ra,0xffffa
    80006dee:	57e080e7          	jalr	1406(ra) # 80001368 <acquire>
  if(f->ref < 1)
    80006df2:	fe843783          	ld	a5,-24(s0)
    80006df6:	43dc                	lw	a5,4(a5)
    80006df8:	00f04a63          	bgtz	a5,80006e0c <filedup+0x36>
    panic("filedup");
    80006dfc:	00005517          	auipc	a0,0x5
    80006e00:	7c450513          	addi	a0,a0,1988 # 8000c5c0 <etext+0x5c0>
    80006e04:	ffffa097          	auipc	ra,0xffffa
    80006e08:	e88080e7          	jalr	-376(ra) # 80000c8c <panic>
  f->ref++;
    80006e0c:	fe843783          	ld	a5,-24(s0)
    80006e10:	43dc                	lw	a5,4(a5)
    80006e12:	2785                	addiw	a5,a5,1
    80006e14:	0007871b          	sext.w	a4,a5
    80006e18:	fe843783          	ld	a5,-24(s0)
    80006e1c:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006e1e:	00036517          	auipc	a0,0x36
    80006e22:	eb250513          	addi	a0,a0,-334 # 8003ccd0 <ftable>
    80006e26:	ffffa097          	auipc	ra,0xffffa
    80006e2a:	5a6080e7          	jalr	1446(ra) # 800013cc <release>
  return f;
    80006e2e:	fe843783          	ld	a5,-24(s0)
}
    80006e32:	853e                	mv	a0,a5
    80006e34:	60e2                	ld	ra,24(sp)
    80006e36:	6442                	ld	s0,16(sp)
    80006e38:	6105                	addi	sp,sp,32
    80006e3a:	8082                	ret

0000000080006e3c <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006e3c:	715d                	addi	sp,sp,-80
    80006e3e:	e486                	sd	ra,72(sp)
    80006e40:	e0a2                	sd	s0,64(sp)
    80006e42:	0880                	addi	s0,sp,80
    80006e44:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006e48:	00036517          	auipc	a0,0x36
    80006e4c:	e8850513          	addi	a0,a0,-376 # 8003ccd0 <ftable>
    80006e50:	ffffa097          	auipc	ra,0xffffa
    80006e54:	518080e7          	jalr	1304(ra) # 80001368 <acquire>
  if(f->ref < 1)
    80006e58:	fb843783          	ld	a5,-72(s0)
    80006e5c:	43dc                	lw	a5,4(a5)
    80006e5e:	00f04a63          	bgtz	a5,80006e72 <fileclose+0x36>
    panic("fileclose");
    80006e62:	00005517          	auipc	a0,0x5
    80006e66:	76650513          	addi	a0,a0,1894 # 8000c5c8 <etext+0x5c8>
    80006e6a:	ffffa097          	auipc	ra,0xffffa
    80006e6e:	e22080e7          	jalr	-478(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006e72:	fb843783          	ld	a5,-72(s0)
    80006e76:	43dc                	lw	a5,4(a5)
    80006e78:	37fd                	addiw	a5,a5,-1
    80006e7a:	0007871b          	sext.w	a4,a5
    80006e7e:	fb843783          	ld	a5,-72(s0)
    80006e82:	c3d8                	sw	a4,4(a5)
    80006e84:	fb843783          	ld	a5,-72(s0)
    80006e88:	43dc                	lw	a5,4(a5)
    80006e8a:	00f05b63          	blez	a5,80006ea0 <fileclose+0x64>
    release(&ftable.lock);
    80006e8e:	00036517          	auipc	a0,0x36
    80006e92:	e4250513          	addi	a0,a0,-446 # 8003ccd0 <ftable>
    80006e96:	ffffa097          	auipc	ra,0xffffa
    80006e9a:	536080e7          	jalr	1334(ra) # 800013cc <release>
    80006e9e:	a879                	j	80006f3c <fileclose+0x100>
    return;
  }
  ff = *f;
    80006ea0:	fb843783          	ld	a5,-72(s0)
    80006ea4:	638c                	ld	a1,0(a5)
    80006ea6:	6790                	ld	a2,8(a5)
    80006ea8:	6b94                	ld	a3,16(a5)
    80006eaa:	6f98                	ld	a4,24(a5)
    80006eac:	739c                	ld	a5,32(a5)
    80006eae:	fcb43423          	sd	a1,-56(s0)
    80006eb2:	fcc43823          	sd	a2,-48(s0)
    80006eb6:	fcd43c23          	sd	a3,-40(s0)
    80006eba:	fee43023          	sd	a4,-32(s0)
    80006ebe:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006ec2:	fb843783          	ld	a5,-72(s0)
    80006ec6:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006eca:	fb843783          	ld	a5,-72(s0)
    80006ece:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006ed2:	00036517          	auipc	a0,0x36
    80006ed6:	dfe50513          	addi	a0,a0,-514 # 8003ccd0 <ftable>
    80006eda:	ffffa097          	auipc	ra,0xffffa
    80006ede:	4f2080e7          	jalr	1266(ra) # 800013cc <release>

  if(ff.type == FD_PIPE){
    80006ee2:	fc842783          	lw	a5,-56(s0)
    80006ee6:	873e                	mv	a4,a5
    80006ee8:	4785                	li	a5,1
    80006eea:	00f71e63          	bne	a4,a5,80006f06 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006eee:	fd843783          	ld	a5,-40(s0)
    80006ef2:	fd144703          	lbu	a4,-47(s0)
    80006ef6:	2701                	sext.w	a4,a4
    80006ef8:	85ba                	mv	a1,a4
    80006efa:	853e                	mv	a0,a5
    80006efc:	00000097          	auipc	ra,0x0
    80006f00:	5aa080e7          	jalr	1450(ra) # 800074a6 <pipeclose>
    80006f04:	a825                	j	80006f3c <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006f06:	fc842783          	lw	a5,-56(s0)
    80006f0a:	873e                	mv	a4,a5
    80006f0c:	4789                	li	a5,2
    80006f0e:	00f70863          	beq	a4,a5,80006f1e <fileclose+0xe2>
    80006f12:	fc842783          	lw	a5,-56(s0)
    80006f16:	873e                	mv	a4,a5
    80006f18:	478d                	li	a5,3
    80006f1a:	02f71163          	bne	a4,a5,80006f3c <fileclose+0x100>
    begin_op();
    80006f1e:	00000097          	auipc	ra,0x0
    80006f22:	884080e7          	jalr	-1916(ra) # 800067a2 <begin_op>
    iput(ff.ip);
    80006f26:	fe043783          	ld	a5,-32(s0)
    80006f2a:	853e                	mv	a0,a5
    80006f2c:	fffff097          	auipc	ra,0xfffff
    80006f30:	97a080e7          	jalr	-1670(ra) # 800058a6 <iput>
    end_op();
    80006f34:	00000097          	auipc	ra,0x0
    80006f38:	930080e7          	jalr	-1744(ra) # 80006864 <end_op>
  }
}
    80006f3c:	60a6                	ld	ra,72(sp)
    80006f3e:	6406                	ld	s0,64(sp)
    80006f40:	6161                	addi	sp,sp,80
    80006f42:	8082                	ret

0000000080006f44 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006f44:	7139                	addi	sp,sp,-64
    80006f46:	fc06                	sd	ra,56(sp)
    80006f48:	f822                	sd	s0,48(sp)
    80006f4a:	0080                	addi	s0,sp,64
    80006f4c:	fca43423          	sd	a0,-56(s0)
    80006f50:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006f54:	ffffc097          	auipc	ra,0xffffc
    80006f58:	f24080e7          	jalr	-220(ra) # 80002e78 <myproc>
    80006f5c:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006f60:	fc843783          	ld	a5,-56(s0)
    80006f64:	439c                	lw	a5,0(a5)
    80006f66:	873e                	mv	a4,a5
    80006f68:	4789                	li	a5,2
    80006f6a:	00f70963          	beq	a4,a5,80006f7c <filestat+0x38>
    80006f6e:	fc843783          	ld	a5,-56(s0)
    80006f72:	439c                	lw	a5,0(a5)
    80006f74:	873e                	mv	a4,a5
    80006f76:	478d                	li	a5,3
    80006f78:	06f71263          	bne	a4,a5,80006fdc <filestat+0x98>
    ilock(f->ip);
    80006f7c:	fc843783          	ld	a5,-56(s0)
    80006f80:	6f9c                	ld	a5,24(a5)
    80006f82:	853e                	mv	a0,a5
    80006f84:	ffffe097          	auipc	ra,0xffffe
    80006f88:	794080e7          	jalr	1940(ra) # 80005718 <ilock>
    stati(f->ip, &st);
    80006f8c:	fc843783          	ld	a5,-56(s0)
    80006f90:	6f9c                	ld	a5,24(a5)
    80006f92:	fd040713          	addi	a4,s0,-48
    80006f96:	85ba                	mv	a1,a4
    80006f98:	853e                	mv	a0,a5
    80006f9a:	fffff097          	auipc	ra,0xfffff
    80006f9e:	cd0080e7          	jalr	-816(ra) # 80005c6a <stati>
    iunlock(f->ip);
    80006fa2:	fc843783          	ld	a5,-56(s0)
    80006fa6:	6f9c                	ld	a5,24(a5)
    80006fa8:	853e                	mv	a0,a5
    80006faa:	fffff097          	auipc	ra,0xfffff
    80006fae:	8a2080e7          	jalr	-1886(ra) # 8000584c <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006fb2:	fe843783          	ld	a5,-24(s0)
    80006fb6:	6bbc                	ld	a5,80(a5)
    80006fb8:	fd040713          	addi	a4,s0,-48
    80006fbc:	46e1                	li	a3,24
    80006fbe:	863a                	mv	a2,a4
    80006fc0:	fc043583          	ld	a1,-64(s0)
    80006fc4:	853e                	mv	a0,a5
    80006fc6:	ffffc097          	auipc	ra,0xffffc
    80006fca:	97c080e7          	jalr	-1668(ra) # 80002942 <copyout>
    80006fce:	87aa                	mv	a5,a0
    80006fd0:	0007d463          	bgez	a5,80006fd8 <filestat+0x94>
      return -1;
    80006fd4:	57fd                	li	a5,-1
    80006fd6:	a021                	j	80006fde <filestat+0x9a>
    return 0;
    80006fd8:	4781                	li	a5,0
    80006fda:	a011                	j	80006fde <filestat+0x9a>
  }
  return -1;
    80006fdc:	57fd                	li	a5,-1
}
    80006fde:	853e                	mv	a0,a5
    80006fe0:	70e2                	ld	ra,56(sp)
    80006fe2:	7442                	ld	s0,48(sp)
    80006fe4:	6121                	addi	sp,sp,64
    80006fe6:	8082                	ret

0000000080006fe8 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006fe8:	7139                	addi	sp,sp,-64
    80006fea:	fc06                	sd	ra,56(sp)
    80006fec:	f822                	sd	s0,48(sp)
    80006fee:	0080                	addi	s0,sp,64
    80006ff0:	fca43c23          	sd	a0,-40(s0)
    80006ff4:	fcb43823          	sd	a1,-48(s0)
    80006ff8:	87b2                	mv	a5,a2
    80006ffa:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006ffe:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80007002:	fd843783          	ld	a5,-40(s0)
    80007006:	0087c783          	lbu	a5,8(a5)
    8000700a:	e399                	bnez	a5,80007010 <fileread+0x28>
    return -1;
    8000700c:	57fd                	li	a5,-1
    8000700e:	aa1d                	j	80007144 <fileread+0x15c>

  if(f->type == FD_PIPE){
    80007010:	fd843783          	ld	a5,-40(s0)
    80007014:	439c                	lw	a5,0(a5)
    80007016:	873e                	mv	a4,a5
    80007018:	4785                	li	a5,1
    8000701a:	02f71363          	bne	a4,a5,80007040 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    8000701e:	fd843783          	ld	a5,-40(s0)
    80007022:	6b9c                	ld	a5,16(a5)
    80007024:	fcc42703          	lw	a4,-52(s0)
    80007028:	863a                	mv	a2,a4
    8000702a:	fd043583          	ld	a1,-48(s0)
    8000702e:	853e                	mv	a0,a5
    80007030:	00000097          	auipc	ra,0x0
    80007034:	670080e7          	jalr	1648(ra) # 800076a0 <piperead>
    80007038:	87aa                	mv	a5,a0
    8000703a:	fef42623          	sw	a5,-20(s0)
    8000703e:	a209                	j	80007140 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80007040:	fd843783          	ld	a5,-40(s0)
    80007044:	439c                	lw	a5,0(a5)
    80007046:	873e                	mv	a4,a5
    80007048:	478d                	li	a5,3
    8000704a:	06f71863          	bne	a4,a5,800070ba <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    8000704e:	fd843783          	ld	a5,-40(s0)
    80007052:	02479783          	lh	a5,36(a5)
    80007056:	2781                	sext.w	a5,a5
    80007058:	0207c863          	bltz	a5,80007088 <fileread+0xa0>
    8000705c:	fd843783          	ld	a5,-40(s0)
    80007060:	02479783          	lh	a5,36(a5)
    80007064:	0007871b          	sext.w	a4,a5
    80007068:	47a5                	li	a5,9
    8000706a:	00e7cf63          	blt	a5,a4,80007088 <fileread+0xa0>
    8000706e:	fd843783          	ld	a5,-40(s0)
    80007072:	02479783          	lh	a5,36(a5)
    80007076:	2781                	sext.w	a5,a5
    80007078:	00036717          	auipc	a4,0x36
    8000707c:	bb870713          	addi	a4,a4,-1096 # 8003cc30 <devsw>
    80007080:	0792                	slli	a5,a5,0x4
    80007082:	97ba                	add	a5,a5,a4
    80007084:	639c                	ld	a5,0(a5)
    80007086:	e399                	bnez	a5,8000708c <fileread+0xa4>
      return -1;
    80007088:	57fd                	li	a5,-1
    8000708a:	a86d                	j	80007144 <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    8000708c:	fd843783          	ld	a5,-40(s0)
    80007090:	02479783          	lh	a5,36(a5)
    80007094:	2781                	sext.w	a5,a5
    80007096:	00036717          	auipc	a4,0x36
    8000709a:	b9a70713          	addi	a4,a4,-1126 # 8003cc30 <devsw>
    8000709e:	0792                	slli	a5,a5,0x4
    800070a0:	97ba                	add	a5,a5,a4
    800070a2:	6398                	ld	a4,0(a5)
    800070a4:	fcc42783          	lw	a5,-52(s0)
    800070a8:	863e                	mv	a2,a5
    800070aa:	fd043583          	ld	a1,-48(s0)
    800070ae:	4505                	li	a0,1
    800070b0:	9702                	jalr	a4
    800070b2:	87aa                	mv	a5,a0
    800070b4:	fef42623          	sw	a5,-20(s0)
    800070b8:	a061                	j	80007140 <fileread+0x158>
  } else if(f->type == FD_INODE){
    800070ba:	fd843783          	ld	a5,-40(s0)
    800070be:	439c                	lw	a5,0(a5)
    800070c0:	873e                	mv	a4,a5
    800070c2:	4789                	li	a5,2
    800070c4:	06f71663          	bne	a4,a5,80007130 <fileread+0x148>
    ilock(f->ip);
    800070c8:	fd843783          	ld	a5,-40(s0)
    800070cc:	6f9c                	ld	a5,24(a5)
    800070ce:	853e                	mv	a0,a5
    800070d0:	ffffe097          	auipc	ra,0xffffe
    800070d4:	648080e7          	jalr	1608(ra) # 80005718 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    800070d8:	fd843783          	ld	a5,-40(s0)
    800070dc:	6f88                	ld	a0,24(a5)
    800070de:	fd843783          	ld	a5,-40(s0)
    800070e2:	539c                	lw	a5,32(a5)
    800070e4:	fcc42703          	lw	a4,-52(s0)
    800070e8:	86be                	mv	a3,a5
    800070ea:	fd043603          	ld	a2,-48(s0)
    800070ee:	4585                	li	a1,1
    800070f0:	fffff097          	auipc	ra,0xfffff
    800070f4:	bde080e7          	jalr	-1058(ra) # 80005cce <readi>
    800070f8:	87aa                	mv	a5,a0
    800070fa:	fef42623          	sw	a5,-20(s0)
    800070fe:	fec42783          	lw	a5,-20(s0)
    80007102:	2781                	sext.w	a5,a5
    80007104:	00f05d63          	blez	a5,8000711e <fileread+0x136>
      f->off += r;
    80007108:	fd843783          	ld	a5,-40(s0)
    8000710c:	5398                	lw	a4,32(a5)
    8000710e:	fec42783          	lw	a5,-20(s0)
    80007112:	9fb9                	addw	a5,a5,a4
    80007114:	0007871b          	sext.w	a4,a5
    80007118:	fd843783          	ld	a5,-40(s0)
    8000711c:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    8000711e:	fd843783          	ld	a5,-40(s0)
    80007122:	6f9c                	ld	a5,24(a5)
    80007124:	853e                	mv	a0,a5
    80007126:	ffffe097          	auipc	ra,0xffffe
    8000712a:	726080e7          	jalr	1830(ra) # 8000584c <iunlock>
    8000712e:	a809                	j	80007140 <fileread+0x158>
  } else {
    panic("fileread");
    80007130:	00005517          	auipc	a0,0x5
    80007134:	4a850513          	addi	a0,a0,1192 # 8000c5d8 <etext+0x5d8>
    80007138:	ffffa097          	auipc	ra,0xffffa
    8000713c:	b54080e7          	jalr	-1196(ra) # 80000c8c <panic>
  }

  return r;
    80007140:	fec42783          	lw	a5,-20(s0)
}
    80007144:	853e                	mv	a0,a5
    80007146:	70e2                	ld	ra,56(sp)
    80007148:	7442                	ld	s0,48(sp)
    8000714a:	6121                	addi	sp,sp,64
    8000714c:	8082                	ret

000000008000714e <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    8000714e:	715d                	addi	sp,sp,-80
    80007150:	e486                	sd	ra,72(sp)
    80007152:	e0a2                	sd	s0,64(sp)
    80007154:	0880                	addi	s0,sp,80
    80007156:	fca43423          	sd	a0,-56(s0)
    8000715a:	fcb43023          	sd	a1,-64(s0)
    8000715e:	87b2                	mv	a5,a2
    80007160:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80007164:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80007168:	fc843783          	ld	a5,-56(s0)
    8000716c:	0097c783          	lbu	a5,9(a5)
    80007170:	e399                	bnez	a5,80007176 <filewrite+0x28>
    return -1;
    80007172:	57fd                	li	a5,-1
    80007174:	aad1                	j	80007348 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80007176:	fc843783          	ld	a5,-56(s0)
    8000717a:	439c                	lw	a5,0(a5)
    8000717c:	873e                	mv	a4,a5
    8000717e:	4785                	li	a5,1
    80007180:	02f71363          	bne	a4,a5,800071a6 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80007184:	fc843783          	ld	a5,-56(s0)
    80007188:	6b9c                	ld	a5,16(a5)
    8000718a:	fbc42703          	lw	a4,-68(s0)
    8000718e:	863a                	mv	a2,a4
    80007190:	fc043583          	ld	a1,-64(s0)
    80007194:	853e                	mv	a0,a5
    80007196:	00000097          	auipc	ra,0x0
    8000719a:	3b8080e7          	jalr	952(ra) # 8000754e <pipewrite>
    8000719e:	87aa                	mv	a5,a0
    800071a0:	fef42623          	sw	a5,-20(s0)
    800071a4:	a245                	j	80007344 <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    800071a6:	fc843783          	ld	a5,-56(s0)
    800071aa:	439c                	lw	a5,0(a5)
    800071ac:	873e                	mv	a4,a5
    800071ae:	478d                	li	a5,3
    800071b0:	06f71863          	bne	a4,a5,80007220 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    800071b4:	fc843783          	ld	a5,-56(s0)
    800071b8:	02479783          	lh	a5,36(a5)
    800071bc:	2781                	sext.w	a5,a5
    800071be:	0207c863          	bltz	a5,800071ee <filewrite+0xa0>
    800071c2:	fc843783          	ld	a5,-56(s0)
    800071c6:	02479783          	lh	a5,36(a5)
    800071ca:	0007871b          	sext.w	a4,a5
    800071ce:	47a5                	li	a5,9
    800071d0:	00e7cf63          	blt	a5,a4,800071ee <filewrite+0xa0>
    800071d4:	fc843783          	ld	a5,-56(s0)
    800071d8:	02479783          	lh	a5,36(a5)
    800071dc:	2781                	sext.w	a5,a5
    800071de:	00036717          	auipc	a4,0x36
    800071e2:	a5270713          	addi	a4,a4,-1454 # 8003cc30 <devsw>
    800071e6:	0792                	slli	a5,a5,0x4
    800071e8:	97ba                	add	a5,a5,a4
    800071ea:	679c                	ld	a5,8(a5)
    800071ec:	e399                	bnez	a5,800071f2 <filewrite+0xa4>
      return -1;
    800071ee:	57fd                	li	a5,-1
    800071f0:	aaa1                	j	80007348 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    800071f2:	fc843783          	ld	a5,-56(s0)
    800071f6:	02479783          	lh	a5,36(a5)
    800071fa:	2781                	sext.w	a5,a5
    800071fc:	00036717          	auipc	a4,0x36
    80007200:	a3470713          	addi	a4,a4,-1484 # 8003cc30 <devsw>
    80007204:	0792                	slli	a5,a5,0x4
    80007206:	97ba                	add	a5,a5,a4
    80007208:	6798                	ld	a4,8(a5)
    8000720a:	fbc42783          	lw	a5,-68(s0)
    8000720e:	863e                	mv	a2,a5
    80007210:	fc043583          	ld	a1,-64(s0)
    80007214:	4505                	li	a0,1
    80007216:	9702                	jalr	a4
    80007218:	87aa                	mv	a5,a0
    8000721a:	fef42623          	sw	a5,-20(s0)
    8000721e:	a21d                	j	80007344 <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80007220:	fc843783          	ld	a5,-56(s0)
    80007224:	439c                	lw	a5,0(a5)
    80007226:	873e                	mv	a4,a5
    80007228:	4789                	li	a5,2
    8000722a:	10f71563          	bne	a4,a5,80007334 <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    8000722e:	6785                	lui	a5,0x1
    80007230:	c007879b          	addiw	a5,a5,-1024
    80007234:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80007238:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    8000723c:	a0d9                	j	80007302 <filewrite+0x1b4>
      int n1 = n - i;
    8000723e:	fbc42703          	lw	a4,-68(s0)
    80007242:	fe842783          	lw	a5,-24(s0)
    80007246:	40f707bb          	subw	a5,a4,a5
    8000724a:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    8000724e:	fe442703          	lw	a4,-28(s0)
    80007252:	fe042783          	lw	a5,-32(s0)
    80007256:	2701                	sext.w	a4,a4
    80007258:	2781                	sext.w	a5,a5
    8000725a:	00e7d663          	bge	a5,a4,80007266 <filewrite+0x118>
        n1 = max;
    8000725e:	fe042783          	lw	a5,-32(s0)
    80007262:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80007266:	fffff097          	auipc	ra,0xfffff
    8000726a:	53c080e7          	jalr	1340(ra) # 800067a2 <begin_op>
      ilock(f->ip);
    8000726e:	fc843783          	ld	a5,-56(s0)
    80007272:	6f9c                	ld	a5,24(a5)
    80007274:	853e                	mv	a0,a5
    80007276:	ffffe097          	auipc	ra,0xffffe
    8000727a:	4a2080e7          	jalr	1186(ra) # 80005718 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    8000727e:	fc843783          	ld	a5,-56(s0)
    80007282:	6f88                	ld	a0,24(a5)
    80007284:	fe842703          	lw	a4,-24(s0)
    80007288:	fc043783          	ld	a5,-64(s0)
    8000728c:	00f70633          	add	a2,a4,a5
    80007290:	fc843783          	ld	a5,-56(s0)
    80007294:	539c                	lw	a5,32(a5)
    80007296:	fe442703          	lw	a4,-28(s0)
    8000729a:	86be                	mv	a3,a5
    8000729c:	4585                	li	a1,1
    8000729e:	fffff097          	auipc	ra,0xfffff
    800072a2:	bc8080e7          	jalr	-1080(ra) # 80005e66 <writei>
    800072a6:	87aa                	mv	a5,a0
    800072a8:	fcf42e23          	sw	a5,-36(s0)
    800072ac:	fdc42783          	lw	a5,-36(s0)
    800072b0:	2781                	sext.w	a5,a5
    800072b2:	00f05d63          	blez	a5,800072cc <filewrite+0x17e>
        f->off += r;
    800072b6:	fc843783          	ld	a5,-56(s0)
    800072ba:	5398                	lw	a4,32(a5)
    800072bc:	fdc42783          	lw	a5,-36(s0)
    800072c0:	9fb9                	addw	a5,a5,a4
    800072c2:	0007871b          	sext.w	a4,a5
    800072c6:	fc843783          	ld	a5,-56(s0)
    800072ca:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    800072cc:	fc843783          	ld	a5,-56(s0)
    800072d0:	6f9c                	ld	a5,24(a5)
    800072d2:	853e                	mv	a0,a5
    800072d4:	ffffe097          	auipc	ra,0xffffe
    800072d8:	578080e7          	jalr	1400(ra) # 8000584c <iunlock>
      end_op();
    800072dc:	fffff097          	auipc	ra,0xfffff
    800072e0:	588080e7          	jalr	1416(ra) # 80006864 <end_op>

      if(r != n1){
    800072e4:	fdc42703          	lw	a4,-36(s0)
    800072e8:	fe442783          	lw	a5,-28(s0)
    800072ec:	2701                	sext.w	a4,a4
    800072ee:	2781                	sext.w	a5,a5
    800072f0:	02f71263          	bne	a4,a5,80007314 <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    800072f4:	fe842703          	lw	a4,-24(s0)
    800072f8:	fdc42783          	lw	a5,-36(s0)
    800072fc:	9fb9                	addw	a5,a5,a4
    800072fe:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80007302:	fe842703          	lw	a4,-24(s0)
    80007306:	fbc42783          	lw	a5,-68(s0)
    8000730a:	2701                	sext.w	a4,a4
    8000730c:	2781                	sext.w	a5,a5
    8000730e:	f2f748e3          	blt	a4,a5,8000723e <filewrite+0xf0>
    80007312:	a011                	j	80007316 <filewrite+0x1c8>
        break;
    80007314:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80007316:	fe842703          	lw	a4,-24(s0)
    8000731a:	fbc42783          	lw	a5,-68(s0)
    8000731e:	2701                	sext.w	a4,a4
    80007320:	2781                	sext.w	a5,a5
    80007322:	00f71563          	bne	a4,a5,8000732c <filewrite+0x1de>
    80007326:	fbc42783          	lw	a5,-68(s0)
    8000732a:	a011                	j	8000732e <filewrite+0x1e0>
    8000732c:	57fd                	li	a5,-1
    8000732e:	fef42623          	sw	a5,-20(s0)
    80007332:	a809                	j	80007344 <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80007334:	00005517          	auipc	a0,0x5
    80007338:	2b450513          	addi	a0,a0,692 # 8000c5e8 <etext+0x5e8>
    8000733c:	ffffa097          	auipc	ra,0xffffa
    80007340:	950080e7          	jalr	-1712(ra) # 80000c8c <panic>
  }

  return ret;
    80007344:	fec42783          	lw	a5,-20(s0)
}
    80007348:	853e                	mv	a0,a5
    8000734a:	60a6                	ld	ra,72(sp)
    8000734c:	6406                	ld	s0,64(sp)
    8000734e:	6161                	addi	sp,sp,80
    80007350:	8082                	ret

0000000080007352 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80007352:	7179                	addi	sp,sp,-48
    80007354:	f406                	sd	ra,40(sp)
    80007356:	f022                	sd	s0,32(sp)
    80007358:	1800                	addi	s0,sp,48
    8000735a:	fca43c23          	sd	a0,-40(s0)
    8000735e:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80007362:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80007366:	fd043783          	ld	a5,-48(s0)
    8000736a:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    8000736e:	fd043783          	ld	a5,-48(s0)
    80007372:	6398                	ld	a4,0(a5)
    80007374:	fd843783          	ld	a5,-40(s0)
    80007378:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    8000737a:	00000097          	auipc	ra,0x0
    8000737e:	9d8080e7          	jalr	-1576(ra) # 80006d52 <filealloc>
    80007382:	872a                	mv	a4,a0
    80007384:	fd843783          	ld	a5,-40(s0)
    80007388:	e398                	sd	a4,0(a5)
    8000738a:	fd843783          	ld	a5,-40(s0)
    8000738e:	639c                	ld	a5,0(a5)
    80007390:	c3e9                	beqz	a5,80007452 <pipealloc+0x100>
    80007392:	00000097          	auipc	ra,0x0
    80007396:	9c0080e7          	jalr	-1600(ra) # 80006d52 <filealloc>
    8000739a:	872a                	mv	a4,a0
    8000739c:	fd043783          	ld	a5,-48(s0)
    800073a0:	e398                	sd	a4,0(a5)
    800073a2:	fd043783          	ld	a5,-48(s0)
    800073a6:	639c                	ld	a5,0(a5)
    800073a8:	c7cd                	beqz	a5,80007452 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    800073aa:	ffffa097          	auipc	ra,0xffffa
    800073ae:	e2c080e7          	jalr	-468(ra) # 800011d6 <kalloc>
    800073b2:	fea43423          	sd	a0,-24(s0)
    800073b6:	fe843783          	ld	a5,-24(s0)
    800073ba:	cfd1                	beqz	a5,80007456 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    800073bc:	fe843783          	ld	a5,-24(s0)
    800073c0:	4705                	li	a4,1
    800073c2:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    800073c6:	fe843783          	ld	a5,-24(s0)
    800073ca:	4705                	li	a4,1
    800073cc:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    800073d0:	fe843783          	ld	a5,-24(s0)
    800073d4:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    800073d8:	fe843783          	ld	a5,-24(s0)
    800073dc:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    800073e0:	fe843783          	ld	a5,-24(s0)
    800073e4:	00005597          	auipc	a1,0x5
    800073e8:	21458593          	addi	a1,a1,532 # 8000c5f8 <etext+0x5f8>
    800073ec:	853e                	mv	a0,a5
    800073ee:	ffffa097          	auipc	ra,0xffffa
    800073f2:	f4a080e7          	jalr	-182(ra) # 80001338 <initlock>
  (*f0)->type = FD_PIPE;
    800073f6:	fd843783          	ld	a5,-40(s0)
    800073fa:	639c                	ld	a5,0(a5)
    800073fc:	4705                	li	a4,1
    800073fe:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80007400:	fd843783          	ld	a5,-40(s0)
    80007404:	639c                	ld	a5,0(a5)
    80007406:	4705                	li	a4,1
    80007408:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    8000740c:	fd843783          	ld	a5,-40(s0)
    80007410:	639c                	ld	a5,0(a5)
    80007412:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80007416:	fd843783          	ld	a5,-40(s0)
    8000741a:	639c                	ld	a5,0(a5)
    8000741c:	fe843703          	ld	a4,-24(s0)
    80007420:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80007422:	fd043783          	ld	a5,-48(s0)
    80007426:	639c                	ld	a5,0(a5)
    80007428:	4705                	li	a4,1
    8000742a:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    8000742c:	fd043783          	ld	a5,-48(s0)
    80007430:	639c                	ld	a5,0(a5)
    80007432:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80007436:	fd043783          	ld	a5,-48(s0)
    8000743a:	639c                	ld	a5,0(a5)
    8000743c:	4705                	li	a4,1
    8000743e:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80007442:	fd043783          	ld	a5,-48(s0)
    80007446:	639c                	ld	a5,0(a5)
    80007448:	fe843703          	ld	a4,-24(s0)
    8000744c:	eb98                	sd	a4,16(a5)
  return 0;
    8000744e:	4781                	li	a5,0
    80007450:	a0b1                	j	8000749c <pipealloc+0x14a>
    goto bad;
    80007452:	0001                	nop
    80007454:	a011                	j	80007458 <pipealloc+0x106>
    goto bad;
    80007456:	0001                	nop

 bad:
  if(pi)
    80007458:	fe843783          	ld	a5,-24(s0)
    8000745c:	c799                	beqz	a5,8000746a <pipealloc+0x118>
    kfree((char*)pi);
    8000745e:	fe843503          	ld	a0,-24(s0)
    80007462:	ffffa097          	auipc	ra,0xffffa
    80007466:	cce080e7          	jalr	-818(ra) # 80001130 <kfree>
  if(*f0)
    8000746a:	fd843783          	ld	a5,-40(s0)
    8000746e:	639c                	ld	a5,0(a5)
    80007470:	cb89                	beqz	a5,80007482 <pipealloc+0x130>
    fileclose(*f0);
    80007472:	fd843783          	ld	a5,-40(s0)
    80007476:	639c                	ld	a5,0(a5)
    80007478:	853e                	mv	a0,a5
    8000747a:	00000097          	auipc	ra,0x0
    8000747e:	9c2080e7          	jalr	-1598(ra) # 80006e3c <fileclose>
  if(*f1)
    80007482:	fd043783          	ld	a5,-48(s0)
    80007486:	639c                	ld	a5,0(a5)
    80007488:	cb89                	beqz	a5,8000749a <pipealloc+0x148>
    fileclose(*f1);
    8000748a:	fd043783          	ld	a5,-48(s0)
    8000748e:	639c                	ld	a5,0(a5)
    80007490:	853e                	mv	a0,a5
    80007492:	00000097          	auipc	ra,0x0
    80007496:	9aa080e7          	jalr	-1622(ra) # 80006e3c <fileclose>
  return -1;
    8000749a:	57fd                	li	a5,-1
}
    8000749c:	853e                	mv	a0,a5
    8000749e:	70a2                	ld	ra,40(sp)
    800074a0:	7402                	ld	s0,32(sp)
    800074a2:	6145                	addi	sp,sp,48
    800074a4:	8082                	ret

00000000800074a6 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    800074a6:	1101                	addi	sp,sp,-32
    800074a8:	ec06                	sd	ra,24(sp)
    800074aa:	e822                	sd	s0,16(sp)
    800074ac:	1000                	addi	s0,sp,32
    800074ae:	fea43423          	sd	a0,-24(s0)
    800074b2:	87ae                	mv	a5,a1
    800074b4:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    800074b8:	fe843783          	ld	a5,-24(s0)
    800074bc:	853e                	mv	a0,a5
    800074be:	ffffa097          	auipc	ra,0xffffa
    800074c2:	eaa080e7          	jalr	-342(ra) # 80001368 <acquire>
  if(writable){
    800074c6:	fe442783          	lw	a5,-28(s0)
    800074ca:	2781                	sext.w	a5,a5
    800074cc:	cf99                	beqz	a5,800074ea <pipeclose+0x44>
    pi->writeopen = 0;
    800074ce:	fe843783          	ld	a5,-24(s0)
    800074d2:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800074d6:	fe843783          	ld	a5,-24(s0)
    800074da:	21878793          	addi	a5,a5,536
    800074de:	853e                	mv	a0,a5
    800074e0:	ffffc097          	auipc	ra,0xffffc
    800074e4:	5d6080e7          	jalr	1494(ra) # 80003ab6 <wakeup>
    800074e8:	a831                	j	80007504 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800074ea:	fe843783          	ld	a5,-24(s0)
    800074ee:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    800074f2:	fe843783          	ld	a5,-24(s0)
    800074f6:	21c78793          	addi	a5,a5,540
    800074fa:	853e                	mv	a0,a5
    800074fc:	ffffc097          	auipc	ra,0xffffc
    80007500:	5ba080e7          	jalr	1466(ra) # 80003ab6 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80007504:	fe843783          	ld	a5,-24(s0)
    80007508:	2207a783          	lw	a5,544(a5)
    8000750c:	e785                	bnez	a5,80007534 <pipeclose+0x8e>
    8000750e:	fe843783          	ld	a5,-24(s0)
    80007512:	2247a783          	lw	a5,548(a5)
    80007516:	ef99                	bnez	a5,80007534 <pipeclose+0x8e>
    release(&pi->lock);
    80007518:	fe843783          	ld	a5,-24(s0)
    8000751c:	853e                	mv	a0,a5
    8000751e:	ffffa097          	auipc	ra,0xffffa
    80007522:	eae080e7          	jalr	-338(ra) # 800013cc <release>
    kfree((char*)pi);
    80007526:	fe843503          	ld	a0,-24(s0)
    8000752a:	ffffa097          	auipc	ra,0xffffa
    8000752e:	c06080e7          	jalr	-1018(ra) # 80001130 <kfree>
    80007532:	a809                	j	80007544 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80007534:	fe843783          	ld	a5,-24(s0)
    80007538:	853e                	mv	a0,a5
    8000753a:	ffffa097          	auipc	ra,0xffffa
    8000753e:	e92080e7          	jalr	-366(ra) # 800013cc <release>
}
    80007542:	0001                	nop
    80007544:	0001                	nop
    80007546:	60e2                	ld	ra,24(sp)
    80007548:	6442                	ld	s0,16(sp)
    8000754a:	6105                	addi	sp,sp,32
    8000754c:	8082                	ret

000000008000754e <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8000754e:	715d                	addi	sp,sp,-80
    80007550:	e486                	sd	ra,72(sp)
    80007552:	e0a2                	sd	s0,64(sp)
    80007554:	0880                	addi	s0,sp,80
    80007556:	fca43423          	sd	a0,-56(s0)
    8000755a:	fcb43023          	sd	a1,-64(s0)
    8000755e:	87b2                	mv	a5,a2
    80007560:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80007564:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007568:	ffffc097          	auipc	ra,0xffffc
    8000756c:	910080e7          	jalr	-1776(ra) # 80002e78 <myproc>
    80007570:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80007574:	fc843783          	ld	a5,-56(s0)
    80007578:	853e                	mv	a0,a5
    8000757a:	ffffa097          	auipc	ra,0xffffa
    8000757e:	dee080e7          	jalr	-530(ra) # 80001368 <acquire>
  while(i < n){
    80007582:	a8f1                	j	8000765e <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    80007584:	fc843783          	ld	a5,-56(s0)
    80007588:	2207a783          	lw	a5,544(a5)
    8000758c:	cb89                	beqz	a5,8000759e <pipewrite+0x50>
    8000758e:	fe043503          	ld	a0,-32(s0)
    80007592:	ffffc097          	auipc	ra,0xffffc
    80007596:	6b6080e7          	jalr	1718(ra) # 80003c48 <killed>
    8000759a:	87aa                	mv	a5,a0
    8000759c:	cb91                	beqz	a5,800075b0 <pipewrite+0x62>
      release(&pi->lock);
    8000759e:	fc843783          	ld	a5,-56(s0)
    800075a2:	853e                	mv	a0,a5
    800075a4:	ffffa097          	auipc	ra,0xffffa
    800075a8:	e28080e7          	jalr	-472(ra) # 800013cc <release>
      return -1;
    800075ac:	57fd                	li	a5,-1
    800075ae:	a0e5                	j	80007696 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    800075b0:	fc843783          	ld	a5,-56(s0)
    800075b4:	21c7a703          	lw	a4,540(a5)
    800075b8:	fc843783          	ld	a5,-56(s0)
    800075bc:	2187a783          	lw	a5,536(a5)
    800075c0:	2007879b          	addiw	a5,a5,512
    800075c4:	2781                	sext.w	a5,a5
    800075c6:	02f71863          	bne	a4,a5,800075f6 <pipewrite+0xa8>
      wakeup(&pi->nread);
    800075ca:	fc843783          	ld	a5,-56(s0)
    800075ce:	21878793          	addi	a5,a5,536
    800075d2:	853e                	mv	a0,a5
    800075d4:	ffffc097          	auipc	ra,0xffffc
    800075d8:	4e2080e7          	jalr	1250(ra) # 80003ab6 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800075dc:	fc843783          	ld	a5,-56(s0)
    800075e0:	21c78793          	addi	a5,a5,540
    800075e4:	fc843703          	ld	a4,-56(s0)
    800075e8:	85ba                	mv	a1,a4
    800075ea:	853e                	mv	a0,a5
    800075ec:	ffffc097          	auipc	ra,0xffffc
    800075f0:	44e080e7          	jalr	1102(ra) # 80003a3a <sleep>
    800075f4:	a0ad                	j	8000765e <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800075f6:	fe043783          	ld	a5,-32(s0)
    800075fa:	6ba8                	ld	a0,80(a5)
    800075fc:	fec42703          	lw	a4,-20(s0)
    80007600:	fc043783          	ld	a5,-64(s0)
    80007604:	973e                	add	a4,a4,a5
    80007606:	fdf40793          	addi	a5,s0,-33
    8000760a:	4685                	li	a3,1
    8000760c:	863a                	mv	a2,a4
    8000760e:	85be                	mv	a1,a5
    80007610:	ffffb097          	auipc	ra,0xffffb
    80007614:	400080e7          	jalr	1024(ra) # 80002a10 <copyin>
    80007618:	87aa                	mv	a5,a0
    8000761a:	873e                	mv	a4,a5
    8000761c:	57fd                	li	a5,-1
    8000761e:	04f70963          	beq	a4,a5,80007670 <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80007622:	fc843783          	ld	a5,-56(s0)
    80007626:	21c7a783          	lw	a5,540(a5)
    8000762a:	2781                	sext.w	a5,a5
    8000762c:	0017871b          	addiw	a4,a5,1
    80007630:	0007069b          	sext.w	a3,a4
    80007634:	fc843703          	ld	a4,-56(s0)
    80007638:	20d72e23          	sw	a3,540(a4)
    8000763c:	1ff7f793          	andi	a5,a5,511
    80007640:	2781                	sext.w	a5,a5
    80007642:	fdf44703          	lbu	a4,-33(s0)
    80007646:	fc843683          	ld	a3,-56(s0)
    8000764a:	1782                	slli	a5,a5,0x20
    8000764c:	9381                	srli	a5,a5,0x20
    8000764e:	97b6                	add	a5,a5,a3
    80007650:	00e78c23          	sb	a4,24(a5)
      i++;
    80007654:	fec42783          	lw	a5,-20(s0)
    80007658:	2785                	addiw	a5,a5,1
    8000765a:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    8000765e:	fec42703          	lw	a4,-20(s0)
    80007662:	fbc42783          	lw	a5,-68(s0)
    80007666:	2701                	sext.w	a4,a4
    80007668:	2781                	sext.w	a5,a5
    8000766a:	f0f74de3          	blt	a4,a5,80007584 <pipewrite+0x36>
    8000766e:	a011                	j	80007672 <pipewrite+0x124>
        break;
    80007670:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007672:	fc843783          	ld	a5,-56(s0)
    80007676:	21878793          	addi	a5,a5,536
    8000767a:	853e                	mv	a0,a5
    8000767c:	ffffc097          	auipc	ra,0xffffc
    80007680:	43a080e7          	jalr	1082(ra) # 80003ab6 <wakeup>
  release(&pi->lock);
    80007684:	fc843783          	ld	a5,-56(s0)
    80007688:	853e                	mv	a0,a5
    8000768a:	ffffa097          	auipc	ra,0xffffa
    8000768e:	d42080e7          	jalr	-702(ra) # 800013cc <release>

  return i;
    80007692:	fec42783          	lw	a5,-20(s0)
}
    80007696:	853e                	mv	a0,a5
    80007698:	60a6                	ld	ra,72(sp)
    8000769a:	6406                	ld	s0,64(sp)
    8000769c:	6161                	addi	sp,sp,80
    8000769e:	8082                	ret

00000000800076a0 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800076a0:	715d                	addi	sp,sp,-80
    800076a2:	e486                	sd	ra,72(sp)
    800076a4:	e0a2                	sd	s0,64(sp)
    800076a6:	0880                	addi	s0,sp,80
    800076a8:	fca43423          	sd	a0,-56(s0)
    800076ac:	fcb43023          	sd	a1,-64(s0)
    800076b0:	87b2                	mv	a5,a2
    800076b2:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800076b6:	ffffb097          	auipc	ra,0xffffb
    800076ba:	7c2080e7          	jalr	1986(ra) # 80002e78 <myproc>
    800076be:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800076c2:	fc843783          	ld	a5,-56(s0)
    800076c6:	853e                	mv	a0,a5
    800076c8:	ffffa097          	auipc	ra,0xffffa
    800076cc:	ca0080e7          	jalr	-864(ra) # 80001368 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800076d0:	a835                	j	8000770c <piperead+0x6c>
    if(killed(pr)){
    800076d2:	fe043503          	ld	a0,-32(s0)
    800076d6:	ffffc097          	auipc	ra,0xffffc
    800076da:	572080e7          	jalr	1394(ra) # 80003c48 <killed>
    800076de:	87aa                	mv	a5,a0
    800076e0:	cb91                	beqz	a5,800076f4 <piperead+0x54>
      release(&pi->lock);
    800076e2:	fc843783          	ld	a5,-56(s0)
    800076e6:	853e                	mv	a0,a5
    800076e8:	ffffa097          	auipc	ra,0xffffa
    800076ec:	ce4080e7          	jalr	-796(ra) # 800013cc <release>
      return -1;
    800076f0:	57fd                	li	a5,-1
    800076f2:	a8dd                	j	800077e8 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    800076f4:	fc843783          	ld	a5,-56(s0)
    800076f8:	21878793          	addi	a5,a5,536
    800076fc:	fc843703          	ld	a4,-56(s0)
    80007700:	85ba                	mv	a1,a4
    80007702:	853e                	mv	a0,a5
    80007704:	ffffc097          	auipc	ra,0xffffc
    80007708:	336080e7          	jalr	822(ra) # 80003a3a <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000770c:	fc843783          	ld	a5,-56(s0)
    80007710:	2187a703          	lw	a4,536(a5)
    80007714:	fc843783          	ld	a5,-56(s0)
    80007718:	21c7a783          	lw	a5,540(a5)
    8000771c:	00f71763          	bne	a4,a5,8000772a <piperead+0x8a>
    80007720:	fc843783          	ld	a5,-56(s0)
    80007724:	2247a783          	lw	a5,548(a5)
    80007728:	f7cd                	bnez	a5,800076d2 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000772a:	fe042623          	sw	zero,-20(s0)
    8000772e:	a8bd                	j	800077ac <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    80007730:	fc843783          	ld	a5,-56(s0)
    80007734:	2187a703          	lw	a4,536(a5)
    80007738:	fc843783          	ld	a5,-56(s0)
    8000773c:	21c7a783          	lw	a5,540(a5)
    80007740:	06f70f63          	beq	a4,a5,800077be <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    80007744:	fc843783          	ld	a5,-56(s0)
    80007748:	2187a783          	lw	a5,536(a5)
    8000774c:	2781                	sext.w	a5,a5
    8000774e:	0017871b          	addiw	a4,a5,1
    80007752:	0007069b          	sext.w	a3,a4
    80007756:	fc843703          	ld	a4,-56(s0)
    8000775a:	20d72c23          	sw	a3,536(a4)
    8000775e:	1ff7f793          	andi	a5,a5,511
    80007762:	2781                	sext.w	a5,a5
    80007764:	fc843703          	ld	a4,-56(s0)
    80007768:	1782                	slli	a5,a5,0x20
    8000776a:	9381                	srli	a5,a5,0x20
    8000776c:	97ba                	add	a5,a5,a4
    8000776e:	0187c783          	lbu	a5,24(a5)
    80007772:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007776:	fe043783          	ld	a5,-32(s0)
    8000777a:	6ba8                	ld	a0,80(a5)
    8000777c:	fec42703          	lw	a4,-20(s0)
    80007780:	fc043783          	ld	a5,-64(s0)
    80007784:	97ba                	add	a5,a5,a4
    80007786:	fdf40713          	addi	a4,s0,-33
    8000778a:	4685                	li	a3,1
    8000778c:	863a                	mv	a2,a4
    8000778e:	85be                	mv	a1,a5
    80007790:	ffffb097          	auipc	ra,0xffffb
    80007794:	1b2080e7          	jalr	434(ra) # 80002942 <copyout>
    80007798:	87aa                	mv	a5,a0
    8000779a:	873e                	mv	a4,a5
    8000779c:	57fd                	li	a5,-1
    8000779e:	02f70263          	beq	a4,a5,800077c2 <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800077a2:	fec42783          	lw	a5,-20(s0)
    800077a6:	2785                	addiw	a5,a5,1
    800077a8:	fef42623          	sw	a5,-20(s0)
    800077ac:	fec42703          	lw	a4,-20(s0)
    800077b0:	fbc42783          	lw	a5,-68(s0)
    800077b4:	2701                	sext.w	a4,a4
    800077b6:	2781                	sext.w	a5,a5
    800077b8:	f6f74ce3          	blt	a4,a5,80007730 <piperead+0x90>
    800077bc:	a021                	j	800077c4 <piperead+0x124>
      break;
    800077be:	0001                	nop
    800077c0:	a011                	j	800077c4 <piperead+0x124>
      break;
    800077c2:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800077c4:	fc843783          	ld	a5,-56(s0)
    800077c8:	21c78793          	addi	a5,a5,540
    800077cc:	853e                	mv	a0,a5
    800077ce:	ffffc097          	auipc	ra,0xffffc
    800077d2:	2e8080e7          	jalr	744(ra) # 80003ab6 <wakeup>
  release(&pi->lock);
    800077d6:	fc843783          	ld	a5,-56(s0)
    800077da:	853e                	mv	a0,a5
    800077dc:	ffffa097          	auipc	ra,0xffffa
    800077e0:	bf0080e7          	jalr	-1040(ra) # 800013cc <release>
  return i;
    800077e4:	fec42783          	lw	a5,-20(s0)
}
    800077e8:	853e                	mv	a0,a5
    800077ea:	60a6                	ld	ra,72(sp)
    800077ec:	6406                	ld	s0,64(sp)
    800077ee:	6161                	addi	sp,sp,80
    800077f0:	8082                	ret

00000000800077f2 <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    800077f2:	7179                	addi	sp,sp,-48
    800077f4:	f422                	sd	s0,40(sp)
    800077f6:	1800                	addi	s0,sp,48
    800077f8:	87aa                	mv	a5,a0
    800077fa:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    800077fe:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    80007802:	fdc42783          	lw	a5,-36(s0)
    80007806:	8b85                	andi	a5,a5,1
    80007808:	2781                	sext.w	a5,a5
    8000780a:	c781                	beqz	a5,80007812 <flags2perm+0x20>
      perm = PTE_X;
    8000780c:	47a1                	li	a5,8
    8000780e:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    80007812:	fdc42783          	lw	a5,-36(s0)
    80007816:	8b89                	andi	a5,a5,2
    80007818:	2781                	sext.w	a5,a5
    8000781a:	c799                	beqz	a5,80007828 <flags2perm+0x36>
      perm |= PTE_W;
    8000781c:	fec42783          	lw	a5,-20(s0)
    80007820:	0047e793          	ori	a5,a5,4
    80007824:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007828:	fec42783          	lw	a5,-20(s0)
}
    8000782c:	853e                	mv	a0,a5
    8000782e:	7422                	ld	s0,40(sp)
    80007830:	6145                	addi	sp,sp,48
    80007832:	8082                	ret

0000000080007834 <exec>:

int
exec(char *path, char **argv)
{
    80007834:	de010113          	addi	sp,sp,-544
    80007838:	20113c23          	sd	ra,536(sp)
    8000783c:	20813823          	sd	s0,528(sp)
    80007840:	20913423          	sd	s1,520(sp)
    80007844:	1400                	addi	s0,sp,544
    80007846:	dea43423          	sd	a0,-536(s0)
    8000784a:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    8000784e:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007852:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007856:	ffffb097          	auipc	ra,0xffffb
    8000785a:	622080e7          	jalr	1570(ra) # 80002e78 <myproc>
    8000785e:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007862:	fffff097          	auipc	ra,0xfffff
    80007866:	f40080e7          	jalr	-192(ra) # 800067a2 <begin_op>

  if((ip = namei(path)) == 0){
    8000786a:	de843503          	ld	a0,-536(s0)
    8000786e:	fffff097          	auipc	ra,0xfffff
    80007872:	bd0080e7          	jalr	-1072(ra) # 8000643e <namei>
    80007876:	faa43423          	sd	a0,-88(s0)
    8000787a:	fa843783          	ld	a5,-88(s0)
    8000787e:	e799                	bnez	a5,8000788c <exec+0x58>
    end_op();
    80007880:	fffff097          	auipc	ra,0xfffff
    80007884:	fe4080e7          	jalr	-28(ra) # 80006864 <end_op>
    return -1;
    80007888:	57fd                	li	a5,-1
    8000788a:	a1a9                	j	80007cd4 <exec+0x4a0>
  }
  ilock(ip);
    8000788c:	fa843503          	ld	a0,-88(s0)
    80007890:	ffffe097          	auipc	ra,0xffffe
    80007894:	e88080e7          	jalr	-376(ra) # 80005718 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    80007898:	e3040793          	addi	a5,s0,-464
    8000789c:	04000713          	li	a4,64
    800078a0:	4681                	li	a3,0
    800078a2:	863e                	mv	a2,a5
    800078a4:	4581                	li	a1,0
    800078a6:	fa843503          	ld	a0,-88(s0)
    800078aa:	ffffe097          	auipc	ra,0xffffe
    800078ae:	424080e7          	jalr	1060(ra) # 80005cce <readi>
    800078b2:	87aa                	mv	a5,a0
    800078b4:	873e                	mv	a4,a5
    800078b6:	04000793          	li	a5,64
    800078ba:	3af71763          	bne	a4,a5,80007c68 <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800078be:	e3042783          	lw	a5,-464(s0)
    800078c2:	873e                	mv	a4,a5
    800078c4:	464c47b7          	lui	a5,0x464c4
    800078c8:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800078cc:	3af71063          	bne	a4,a5,80007c6c <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800078d0:	f9843503          	ld	a0,-104(s0)
    800078d4:	ffffc097          	auipc	ra,0xffffc
    800078d8:	806080e7          	jalr	-2042(ra) # 800030da <proc_pagetable>
    800078dc:	faa43023          	sd	a0,-96(s0)
    800078e0:	fa043783          	ld	a5,-96(s0)
    800078e4:	38078663          	beqz	a5,80007c70 <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800078e8:	fc042623          	sw	zero,-52(s0)
    800078ec:	e5043783          	ld	a5,-432(s0)
    800078f0:	fcf42423          	sw	a5,-56(s0)
    800078f4:	a0fd                	j	800079e2 <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800078f6:	df840793          	addi	a5,s0,-520
    800078fa:	fc842683          	lw	a3,-56(s0)
    800078fe:	03800713          	li	a4,56
    80007902:	863e                	mv	a2,a5
    80007904:	4581                	li	a1,0
    80007906:	fa843503          	ld	a0,-88(s0)
    8000790a:	ffffe097          	auipc	ra,0xffffe
    8000790e:	3c4080e7          	jalr	964(ra) # 80005cce <readi>
    80007912:	87aa                	mv	a5,a0
    80007914:	873e                	mv	a4,a5
    80007916:	03800793          	li	a5,56
    8000791a:	34f71d63          	bne	a4,a5,80007c74 <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    8000791e:	df842783          	lw	a5,-520(s0)
    80007922:	873e                	mv	a4,a5
    80007924:	4785                	li	a5,1
    80007926:	0af71163          	bne	a4,a5,800079c8 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    8000792a:	e2043703          	ld	a4,-480(s0)
    8000792e:	e1843783          	ld	a5,-488(s0)
    80007932:	34f76363          	bltu	a4,a5,80007c78 <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007936:	e0843703          	ld	a4,-504(s0)
    8000793a:	e2043783          	ld	a5,-480(s0)
    8000793e:	973e                	add	a4,a4,a5
    80007940:	e0843783          	ld	a5,-504(s0)
    80007944:	32f76c63          	bltu	a4,a5,80007c7c <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007948:	e0843703          	ld	a4,-504(s0)
    8000794c:	6785                	lui	a5,0x1
    8000794e:	17fd                	addi	a5,a5,-1
    80007950:	8ff9                	and	a5,a5,a4
    80007952:	32079763          	bnez	a5,80007c80 <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007956:	e0843703          	ld	a4,-504(s0)
    8000795a:	e2043783          	ld	a5,-480(s0)
    8000795e:	00f704b3          	add	s1,a4,a5
    80007962:	dfc42783          	lw	a5,-516(s0)
    80007966:	2781                	sext.w	a5,a5
    80007968:	853e                	mv	a0,a5
    8000796a:	00000097          	auipc	ra,0x0
    8000796e:	e88080e7          	jalr	-376(ra) # 800077f2 <flags2perm>
    80007972:	87aa                	mv	a5,a0
    80007974:	86be                	mv	a3,a5
    80007976:	8626                	mv	a2,s1
    80007978:	fb843583          	ld	a1,-72(s0)
    8000797c:	fa043503          	ld	a0,-96(s0)
    80007980:	ffffb097          	auipc	ra,0xffffb
    80007984:	bca080e7          	jalr	-1078(ra) # 8000254a <uvmalloc>
    80007988:	f6a43823          	sd	a0,-144(s0)
    8000798c:	f7043783          	ld	a5,-144(s0)
    80007990:	2e078a63          	beqz	a5,80007c84 <exec+0x450>
      goto bad;
    sz = sz1;
    80007994:	f7043783          	ld	a5,-144(s0)
    80007998:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    8000799c:	e0843783          	ld	a5,-504(s0)
    800079a0:	e0043703          	ld	a4,-512(s0)
    800079a4:	0007069b          	sext.w	a3,a4
    800079a8:	e1843703          	ld	a4,-488(s0)
    800079ac:	2701                	sext.w	a4,a4
    800079ae:	fa843603          	ld	a2,-88(s0)
    800079b2:	85be                	mv	a1,a5
    800079b4:	fa043503          	ld	a0,-96(s0)
    800079b8:	00000097          	auipc	ra,0x0
    800079bc:	330080e7          	jalr	816(ra) # 80007ce8 <loadseg>
    800079c0:	87aa                	mv	a5,a0
    800079c2:	2c07c363          	bltz	a5,80007c88 <exec+0x454>
    800079c6:	a011                	j	800079ca <exec+0x196>
      continue;
    800079c8:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800079ca:	fcc42783          	lw	a5,-52(s0)
    800079ce:	2785                	addiw	a5,a5,1
    800079d0:	fcf42623          	sw	a5,-52(s0)
    800079d4:	fc842783          	lw	a5,-56(s0)
    800079d8:	0387879b          	addiw	a5,a5,56
    800079dc:	2781                	sext.w	a5,a5
    800079de:	fcf42423          	sw	a5,-56(s0)
    800079e2:	e6845783          	lhu	a5,-408(s0)
    800079e6:	0007871b          	sext.w	a4,a5
    800079ea:	fcc42783          	lw	a5,-52(s0)
    800079ee:	2781                	sext.w	a5,a5
    800079f0:	f0e7c3e3          	blt	a5,a4,800078f6 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800079f4:	fa843503          	ld	a0,-88(s0)
    800079f8:	ffffe097          	auipc	ra,0xffffe
    800079fc:	f7e080e7          	jalr	-130(ra) # 80005976 <iunlockput>
  end_op();
    80007a00:	fffff097          	auipc	ra,0xfffff
    80007a04:	e64080e7          	jalr	-412(ra) # 80006864 <end_op>
  ip = 0;
    80007a08:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    80007a0c:	ffffb097          	auipc	ra,0xffffb
    80007a10:	46c080e7          	jalr	1132(ra) # 80002e78 <myproc>
    80007a14:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007a18:	f9843783          	ld	a5,-104(s0)
    80007a1c:	67bc                	ld	a5,72(a5)
    80007a1e:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007a22:	fb843703          	ld	a4,-72(s0)
    80007a26:	6785                	lui	a5,0x1
    80007a28:	17fd                	addi	a5,a5,-1
    80007a2a:	973e                	add	a4,a4,a5
    80007a2c:	77fd                	lui	a5,0xfffff
    80007a2e:	8ff9                	and	a5,a5,a4
    80007a30:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    80007a34:	fb843703          	ld	a4,-72(s0)
    80007a38:	6789                	lui	a5,0x2
    80007a3a:	97ba                	add	a5,a5,a4
    80007a3c:	4691                	li	a3,4
    80007a3e:	863e                	mv	a2,a5
    80007a40:	fb843583          	ld	a1,-72(s0)
    80007a44:	fa043503          	ld	a0,-96(s0)
    80007a48:	ffffb097          	auipc	ra,0xffffb
    80007a4c:	b02080e7          	jalr	-1278(ra) # 8000254a <uvmalloc>
    80007a50:	f8a43423          	sd	a0,-120(s0)
    80007a54:	f8843783          	ld	a5,-120(s0)
    80007a58:	22078a63          	beqz	a5,80007c8c <exec+0x458>
    goto bad;
  sz = sz1;
    80007a5c:	f8843783          	ld	a5,-120(s0)
    80007a60:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007a64:	fb843703          	ld	a4,-72(s0)
    80007a68:	77f9                	lui	a5,0xffffe
    80007a6a:	97ba                	add	a5,a5,a4
    80007a6c:	85be                	mv	a1,a5
    80007a6e:	fa043503          	ld	a0,-96(s0)
    80007a72:	ffffb097          	auipc	ra,0xffffb
    80007a76:	e6e080e7          	jalr	-402(ra) # 800028e0 <uvmclear>
  sp = sz;
    80007a7a:	fb843783          	ld	a5,-72(s0)
    80007a7e:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007a82:	fb043703          	ld	a4,-80(s0)
    80007a86:	77fd                	lui	a5,0xfffff
    80007a88:	97ba                	add	a5,a5,a4
    80007a8a:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007a8e:	fc043023          	sd	zero,-64(s0)
    80007a92:	a845                	j	80007b42 <exec+0x30e>
    if(argc >= MAXARG)
    80007a94:	fc043703          	ld	a4,-64(s0)
    80007a98:	47fd                	li	a5,31
    80007a9a:	1ee7eb63          	bltu	a5,a4,80007c90 <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007a9e:	fc043783          	ld	a5,-64(s0)
    80007aa2:	078e                	slli	a5,a5,0x3
    80007aa4:	de043703          	ld	a4,-544(s0)
    80007aa8:	97ba                	add	a5,a5,a4
    80007aaa:	639c                	ld	a5,0(a5)
    80007aac:	853e                	mv	a0,a5
    80007aae:	ffffa097          	auipc	ra,0xffffa
    80007ab2:	e0c080e7          	jalr	-500(ra) # 800018ba <strlen>
    80007ab6:	87aa                	mv	a5,a0
    80007ab8:	2785                	addiw	a5,a5,1
    80007aba:	2781                	sext.w	a5,a5
    80007abc:	873e                	mv	a4,a5
    80007abe:	fb043783          	ld	a5,-80(s0)
    80007ac2:	8f99                	sub	a5,a5,a4
    80007ac4:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007ac8:	fb043783          	ld	a5,-80(s0)
    80007acc:	9bc1                	andi	a5,a5,-16
    80007ace:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007ad2:	fb043703          	ld	a4,-80(s0)
    80007ad6:	f8043783          	ld	a5,-128(s0)
    80007ada:	1af76d63          	bltu	a4,a5,80007c94 <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007ade:	fc043783          	ld	a5,-64(s0)
    80007ae2:	078e                	slli	a5,a5,0x3
    80007ae4:	de043703          	ld	a4,-544(s0)
    80007ae8:	97ba                	add	a5,a5,a4
    80007aea:	6384                	ld	s1,0(a5)
    80007aec:	fc043783          	ld	a5,-64(s0)
    80007af0:	078e                	slli	a5,a5,0x3
    80007af2:	de043703          	ld	a4,-544(s0)
    80007af6:	97ba                	add	a5,a5,a4
    80007af8:	639c                	ld	a5,0(a5)
    80007afa:	853e                	mv	a0,a5
    80007afc:	ffffa097          	auipc	ra,0xffffa
    80007b00:	dbe080e7          	jalr	-578(ra) # 800018ba <strlen>
    80007b04:	87aa                	mv	a5,a0
    80007b06:	2785                	addiw	a5,a5,1
    80007b08:	2781                	sext.w	a5,a5
    80007b0a:	86be                	mv	a3,a5
    80007b0c:	8626                	mv	a2,s1
    80007b0e:	fb043583          	ld	a1,-80(s0)
    80007b12:	fa043503          	ld	a0,-96(s0)
    80007b16:	ffffb097          	auipc	ra,0xffffb
    80007b1a:	e2c080e7          	jalr	-468(ra) # 80002942 <copyout>
    80007b1e:	87aa                	mv	a5,a0
    80007b20:	1607cc63          	bltz	a5,80007c98 <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    80007b24:	fc043783          	ld	a5,-64(s0)
    80007b28:	078e                	slli	a5,a5,0x3
    80007b2a:	fe040713          	addi	a4,s0,-32
    80007b2e:	97ba                	add	a5,a5,a4
    80007b30:	fb043703          	ld	a4,-80(s0)
    80007b34:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffc0f60>
  for(argc = 0; argv[argc]; argc++) {
    80007b38:	fc043783          	ld	a5,-64(s0)
    80007b3c:	0785                	addi	a5,a5,1
    80007b3e:	fcf43023          	sd	a5,-64(s0)
    80007b42:	fc043783          	ld	a5,-64(s0)
    80007b46:	078e                	slli	a5,a5,0x3
    80007b48:	de043703          	ld	a4,-544(s0)
    80007b4c:	97ba                	add	a5,a5,a4
    80007b4e:	639c                	ld	a5,0(a5)
    80007b50:	f3b1                	bnez	a5,80007a94 <exec+0x260>
  }
  ustack[argc] = 0;
    80007b52:	fc043783          	ld	a5,-64(s0)
    80007b56:	078e                	slli	a5,a5,0x3
    80007b58:	fe040713          	addi	a4,s0,-32
    80007b5c:	97ba                	add	a5,a5,a4
    80007b5e:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007b62:	fc043783          	ld	a5,-64(s0)
    80007b66:	0785                	addi	a5,a5,1
    80007b68:	078e                	slli	a5,a5,0x3
    80007b6a:	fb043703          	ld	a4,-80(s0)
    80007b6e:	40f707b3          	sub	a5,a4,a5
    80007b72:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007b76:	fb043783          	ld	a5,-80(s0)
    80007b7a:	9bc1                	andi	a5,a5,-16
    80007b7c:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007b80:	fb043703          	ld	a4,-80(s0)
    80007b84:	f8043783          	ld	a5,-128(s0)
    80007b88:	10f76a63          	bltu	a4,a5,80007c9c <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80007b8c:	fc043783          	ld	a5,-64(s0)
    80007b90:	0785                	addi	a5,a5,1
    80007b92:	00379713          	slli	a4,a5,0x3
    80007b96:	e7040793          	addi	a5,s0,-400
    80007b9a:	86ba                	mv	a3,a4
    80007b9c:	863e                	mv	a2,a5
    80007b9e:	fb043583          	ld	a1,-80(s0)
    80007ba2:	fa043503          	ld	a0,-96(s0)
    80007ba6:	ffffb097          	auipc	ra,0xffffb
    80007baa:	d9c080e7          	jalr	-612(ra) # 80002942 <copyout>
    80007bae:	87aa                	mv	a5,a0
    80007bb0:	0e07c863          	bltz	a5,80007ca0 <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80007bb4:	f9843783          	ld	a5,-104(s0)
    80007bb8:	6fbc                	ld	a5,88(a5)
    80007bba:	fb043703          	ld	a4,-80(s0)
    80007bbe:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    80007bc0:	de843783          	ld	a5,-536(s0)
    80007bc4:	fcf43c23          	sd	a5,-40(s0)
    80007bc8:	fd843783          	ld	a5,-40(s0)
    80007bcc:	fcf43823          	sd	a5,-48(s0)
    80007bd0:	a025                	j	80007bf8 <exec+0x3c4>
    if(*s == '/')
    80007bd2:	fd843783          	ld	a5,-40(s0)
    80007bd6:	0007c783          	lbu	a5,0(a5)
    80007bda:	873e                	mv	a4,a5
    80007bdc:	02f00793          	li	a5,47
    80007be0:	00f71763          	bne	a4,a5,80007bee <exec+0x3ba>
      last = s+1;
    80007be4:	fd843783          	ld	a5,-40(s0)
    80007be8:	0785                	addi	a5,a5,1
    80007bea:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007bee:	fd843783          	ld	a5,-40(s0)
    80007bf2:	0785                	addi	a5,a5,1
    80007bf4:	fcf43c23          	sd	a5,-40(s0)
    80007bf8:	fd843783          	ld	a5,-40(s0)
    80007bfc:	0007c783          	lbu	a5,0(a5)
    80007c00:	fbe9                	bnez	a5,80007bd2 <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    80007c02:	f9843783          	ld	a5,-104(s0)
    80007c06:	15878793          	addi	a5,a5,344
    80007c0a:	4641                	li	a2,16
    80007c0c:	fd043583          	ld	a1,-48(s0)
    80007c10:	853e                	mv	a0,a5
    80007c12:	ffffa097          	auipc	ra,0xffffa
    80007c16:	c2e080e7          	jalr	-978(ra) # 80001840 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007c1a:	f9843783          	ld	a5,-104(s0)
    80007c1e:	6bbc                	ld	a5,80(a5)
    80007c20:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007c24:	f9843783          	ld	a5,-104(s0)
    80007c28:	fa043703          	ld	a4,-96(s0)
    80007c2c:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007c2e:	f9843783          	ld	a5,-104(s0)
    80007c32:	fb843703          	ld	a4,-72(s0)
    80007c36:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007c38:	f9843783          	ld	a5,-104(s0)
    80007c3c:	6fbc                	ld	a5,88(a5)
    80007c3e:	e4843703          	ld	a4,-440(s0)
    80007c42:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007c44:	f9843783          	ld	a5,-104(s0)
    80007c48:	6fbc                	ld	a5,88(a5)
    80007c4a:	fb043703          	ld	a4,-80(s0)
    80007c4e:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007c50:	f9043583          	ld	a1,-112(s0)
    80007c54:	f7843503          	ld	a0,-136(s0)
    80007c58:	ffffb097          	auipc	ra,0xffffb
    80007c5c:	542080e7          	jalr	1346(ra) # 8000319a <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007c60:	fc043783          	ld	a5,-64(s0)
    80007c64:	2781                	sext.w	a5,a5
    80007c66:	a0bd                	j	80007cd4 <exec+0x4a0>
    goto bad;
    80007c68:	0001                	nop
    80007c6a:	a825                	j	80007ca2 <exec+0x46e>
    goto bad;
    80007c6c:	0001                	nop
    80007c6e:	a815                	j	80007ca2 <exec+0x46e>
    goto bad;
    80007c70:	0001                	nop
    80007c72:	a805                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c74:	0001                	nop
    80007c76:	a035                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c78:	0001                	nop
    80007c7a:	a025                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c7c:	0001                	nop
    80007c7e:	a015                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c80:	0001                	nop
    80007c82:	a005                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c84:	0001                	nop
    80007c86:	a831                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c88:	0001                	nop
    80007c8a:	a821                	j	80007ca2 <exec+0x46e>
    goto bad;
    80007c8c:	0001                	nop
    80007c8e:	a811                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c90:	0001                	nop
    80007c92:	a801                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c94:	0001                	nop
    80007c96:	a031                	j	80007ca2 <exec+0x46e>
      goto bad;
    80007c98:	0001                	nop
    80007c9a:	a021                	j	80007ca2 <exec+0x46e>
    goto bad;
    80007c9c:	0001                	nop
    80007c9e:	a011                	j	80007ca2 <exec+0x46e>
    goto bad;
    80007ca0:	0001                	nop

 bad:
  if(pagetable)
    80007ca2:	fa043783          	ld	a5,-96(s0)
    80007ca6:	cb89                	beqz	a5,80007cb8 <exec+0x484>
    proc_freepagetable(pagetable, sz);
    80007ca8:	fb843583          	ld	a1,-72(s0)
    80007cac:	fa043503          	ld	a0,-96(s0)
    80007cb0:	ffffb097          	auipc	ra,0xffffb
    80007cb4:	4ea080e7          	jalr	1258(ra) # 8000319a <proc_freepagetable>
  if(ip){
    80007cb8:	fa843783          	ld	a5,-88(s0)
    80007cbc:	cb99                	beqz	a5,80007cd2 <exec+0x49e>
    iunlockput(ip);
    80007cbe:	fa843503          	ld	a0,-88(s0)
    80007cc2:	ffffe097          	auipc	ra,0xffffe
    80007cc6:	cb4080e7          	jalr	-844(ra) # 80005976 <iunlockput>
    end_op();
    80007cca:	fffff097          	auipc	ra,0xfffff
    80007cce:	b9a080e7          	jalr	-1126(ra) # 80006864 <end_op>
  }
  return -1;
    80007cd2:	57fd                	li	a5,-1
}
    80007cd4:	853e                	mv	a0,a5
    80007cd6:	21813083          	ld	ra,536(sp)
    80007cda:	21013403          	ld	s0,528(sp)
    80007cde:	20813483          	ld	s1,520(sp)
    80007ce2:	22010113          	addi	sp,sp,544
    80007ce6:	8082                	ret

0000000080007ce8 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007ce8:	7139                	addi	sp,sp,-64
    80007cea:	fc06                	sd	ra,56(sp)
    80007cec:	f822                	sd	s0,48(sp)
    80007cee:	0080                	addi	s0,sp,64
    80007cf0:	fca43c23          	sd	a0,-40(s0)
    80007cf4:	fcb43823          	sd	a1,-48(s0)
    80007cf8:	fcc43423          	sd	a2,-56(s0)
    80007cfc:	87b6                	mv	a5,a3
    80007cfe:	fcf42223          	sw	a5,-60(s0)
    80007d02:	87ba                	mv	a5,a4
    80007d04:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007d08:	fe042623          	sw	zero,-20(s0)
    80007d0c:	a05d                	j	80007db2 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    80007d0e:	fec46703          	lwu	a4,-20(s0)
    80007d12:	fd043783          	ld	a5,-48(s0)
    80007d16:	97ba                	add	a5,a5,a4
    80007d18:	85be                	mv	a1,a5
    80007d1a:	fd843503          	ld	a0,-40(s0)
    80007d1e:	ffffa097          	auipc	ra,0xffffa
    80007d22:	470080e7          	jalr	1136(ra) # 8000218e <walkaddr>
    80007d26:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007d2a:	fe043783          	ld	a5,-32(s0)
    80007d2e:	eb89                	bnez	a5,80007d40 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007d30:	00005517          	auipc	a0,0x5
    80007d34:	8d050513          	addi	a0,a0,-1840 # 8000c600 <etext+0x600>
    80007d38:	ffff9097          	auipc	ra,0xffff9
    80007d3c:	f54080e7          	jalr	-172(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    80007d40:	fc042703          	lw	a4,-64(s0)
    80007d44:	fec42783          	lw	a5,-20(s0)
    80007d48:	40f707bb          	subw	a5,a4,a5
    80007d4c:	2781                	sext.w	a5,a5
    80007d4e:	873e                	mv	a4,a5
    80007d50:	6785                	lui	a5,0x1
    80007d52:	00f77b63          	bgeu	a4,a5,80007d68 <loadseg+0x80>
      n = sz - i;
    80007d56:	fc042703          	lw	a4,-64(s0)
    80007d5a:	fec42783          	lw	a5,-20(s0)
    80007d5e:	40f707bb          	subw	a5,a4,a5
    80007d62:	fef42423          	sw	a5,-24(s0)
    80007d66:	a021                	j	80007d6e <loadseg+0x86>
    else
      n = PGSIZE;
    80007d68:	6785                	lui	a5,0x1
    80007d6a:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007d6e:	fc442703          	lw	a4,-60(s0)
    80007d72:	fec42783          	lw	a5,-20(s0)
    80007d76:	9fb9                	addw	a5,a5,a4
    80007d78:	2781                	sext.w	a5,a5
    80007d7a:	fe842703          	lw	a4,-24(s0)
    80007d7e:	86be                	mv	a3,a5
    80007d80:	fe043603          	ld	a2,-32(s0)
    80007d84:	4581                	li	a1,0
    80007d86:	fc843503          	ld	a0,-56(s0)
    80007d8a:	ffffe097          	auipc	ra,0xffffe
    80007d8e:	f44080e7          	jalr	-188(ra) # 80005cce <readi>
    80007d92:	87aa                	mv	a5,a0
    80007d94:	0007871b          	sext.w	a4,a5
    80007d98:	fe842783          	lw	a5,-24(s0)
    80007d9c:	2781                	sext.w	a5,a5
    80007d9e:	00e78463          	beq	a5,a4,80007da6 <loadseg+0xbe>
      return -1;
    80007da2:	57fd                	li	a5,-1
    80007da4:	a005                	j	80007dc4 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007da6:	fec42703          	lw	a4,-20(s0)
    80007daa:	6785                	lui	a5,0x1
    80007dac:	9fb9                	addw	a5,a5,a4
    80007dae:	fef42623          	sw	a5,-20(s0)
    80007db2:	fec42703          	lw	a4,-20(s0)
    80007db6:	fc042783          	lw	a5,-64(s0)
    80007dba:	2701                	sext.w	a4,a4
    80007dbc:	2781                	sext.w	a5,a5
    80007dbe:	f4f768e3          	bltu	a4,a5,80007d0e <loadseg+0x26>
  }
  
  return 0;
    80007dc2:	4781                	li	a5,0
}
    80007dc4:	853e                	mv	a0,a5
    80007dc6:	70e2                	ld	ra,56(sp)
    80007dc8:	7442                	ld	s0,48(sp)
    80007dca:	6121                	addi	sp,sp,64
    80007dcc:	8082                	ret

0000000080007dce <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007dce:	7139                	addi	sp,sp,-64
    80007dd0:	fc06                	sd	ra,56(sp)
    80007dd2:	f822                	sd	s0,48(sp)
    80007dd4:	0080                	addi	s0,sp,64
    80007dd6:	87aa                	mv	a5,a0
    80007dd8:	fcb43823          	sd	a1,-48(s0)
    80007ddc:	fcc43423          	sd	a2,-56(s0)
    80007de0:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    80007de4:	fe440713          	addi	a4,s0,-28
    80007de8:	fdc42783          	lw	a5,-36(s0)
    80007dec:	85ba                	mv	a1,a4
    80007dee:	853e                	mv	a0,a5
    80007df0:	ffffd097          	auipc	ra,0xffffd
    80007df4:	980080e7          	jalr	-1664(ra) # 80004770 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007df8:	fe442783          	lw	a5,-28(s0)
    80007dfc:	0207c863          	bltz	a5,80007e2c <argfd+0x5e>
    80007e00:	fe442783          	lw	a5,-28(s0)
    80007e04:	873e                	mv	a4,a5
    80007e06:	47bd                	li	a5,15
    80007e08:	02e7c263          	blt	a5,a4,80007e2c <argfd+0x5e>
    80007e0c:	ffffb097          	auipc	ra,0xffffb
    80007e10:	06c080e7          	jalr	108(ra) # 80002e78 <myproc>
    80007e14:	872a                	mv	a4,a0
    80007e16:	fe442783          	lw	a5,-28(s0)
    80007e1a:	07e9                	addi	a5,a5,26
    80007e1c:	078e                	slli	a5,a5,0x3
    80007e1e:	97ba                	add	a5,a5,a4
    80007e20:	639c                	ld	a5,0(a5)
    80007e22:	fef43423          	sd	a5,-24(s0)
    80007e26:	fe843783          	ld	a5,-24(s0)
    80007e2a:	e399                	bnez	a5,80007e30 <argfd+0x62>
    return -1;
    80007e2c:	57fd                	li	a5,-1
    80007e2e:	a015                	j	80007e52 <argfd+0x84>
  if(pfd)
    80007e30:	fd043783          	ld	a5,-48(s0)
    80007e34:	c791                	beqz	a5,80007e40 <argfd+0x72>
    *pfd = fd;
    80007e36:	fe442703          	lw	a4,-28(s0)
    80007e3a:	fd043783          	ld	a5,-48(s0)
    80007e3e:	c398                	sw	a4,0(a5)
  if(pf)
    80007e40:	fc843783          	ld	a5,-56(s0)
    80007e44:	c791                	beqz	a5,80007e50 <argfd+0x82>
    *pf = f;
    80007e46:	fc843783          	ld	a5,-56(s0)
    80007e4a:	fe843703          	ld	a4,-24(s0)
    80007e4e:	e398                	sd	a4,0(a5)
  return 0;
    80007e50:	4781                	li	a5,0
}
    80007e52:	853e                	mv	a0,a5
    80007e54:	70e2                	ld	ra,56(sp)
    80007e56:	7442                	ld	s0,48(sp)
    80007e58:	6121                	addi	sp,sp,64
    80007e5a:	8082                	ret

0000000080007e5c <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007e5c:	7179                	addi	sp,sp,-48
    80007e5e:	f406                	sd	ra,40(sp)
    80007e60:	f022                	sd	s0,32(sp)
    80007e62:	1800                	addi	s0,sp,48
    80007e64:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007e68:	ffffb097          	auipc	ra,0xffffb
    80007e6c:	010080e7          	jalr	16(ra) # 80002e78 <myproc>
    80007e70:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007e74:	fe042623          	sw	zero,-20(s0)
    80007e78:	a825                	j	80007eb0 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007e7a:	fe043703          	ld	a4,-32(s0)
    80007e7e:	fec42783          	lw	a5,-20(s0)
    80007e82:	07e9                	addi	a5,a5,26
    80007e84:	078e                	slli	a5,a5,0x3
    80007e86:	97ba                	add	a5,a5,a4
    80007e88:	639c                	ld	a5,0(a5)
    80007e8a:	ef91                	bnez	a5,80007ea6 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007e8c:	fe043703          	ld	a4,-32(s0)
    80007e90:	fec42783          	lw	a5,-20(s0)
    80007e94:	07e9                	addi	a5,a5,26
    80007e96:	078e                	slli	a5,a5,0x3
    80007e98:	97ba                	add	a5,a5,a4
    80007e9a:	fd843703          	ld	a4,-40(s0)
    80007e9e:	e398                	sd	a4,0(a5)
      return fd;
    80007ea0:	fec42783          	lw	a5,-20(s0)
    80007ea4:	a831                	j	80007ec0 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007ea6:	fec42783          	lw	a5,-20(s0)
    80007eaa:	2785                	addiw	a5,a5,1
    80007eac:	fef42623          	sw	a5,-20(s0)
    80007eb0:	fec42783          	lw	a5,-20(s0)
    80007eb4:	0007871b          	sext.w	a4,a5
    80007eb8:	47bd                	li	a5,15
    80007eba:	fce7d0e3          	bge	a5,a4,80007e7a <fdalloc+0x1e>
    }
  }
  return -1;
    80007ebe:	57fd                	li	a5,-1
}
    80007ec0:	853e                	mv	a0,a5
    80007ec2:	70a2                	ld	ra,40(sp)
    80007ec4:	7402                	ld	s0,32(sp)
    80007ec6:	6145                	addi	sp,sp,48
    80007ec8:	8082                	ret

0000000080007eca <sys_dup>:

uint64
sys_dup(void)
{
    80007eca:	1101                	addi	sp,sp,-32
    80007ecc:	ec06                	sd	ra,24(sp)
    80007ece:	e822                	sd	s0,16(sp)
    80007ed0:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007ed2:	fe040793          	addi	a5,s0,-32
    80007ed6:	863e                	mv	a2,a5
    80007ed8:	4581                	li	a1,0
    80007eda:	4501                	li	a0,0
    80007edc:	00000097          	auipc	ra,0x0
    80007ee0:	ef2080e7          	jalr	-270(ra) # 80007dce <argfd>
    80007ee4:	87aa                	mv	a5,a0
    80007ee6:	0007d463          	bgez	a5,80007eee <sys_dup+0x24>
    return -1;
    80007eea:	57fd                	li	a5,-1
    80007eec:	a81d                	j	80007f22 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007eee:	fe043783          	ld	a5,-32(s0)
    80007ef2:	853e                	mv	a0,a5
    80007ef4:	00000097          	auipc	ra,0x0
    80007ef8:	f68080e7          	jalr	-152(ra) # 80007e5c <fdalloc>
    80007efc:	87aa                	mv	a5,a0
    80007efe:	fef42623          	sw	a5,-20(s0)
    80007f02:	fec42783          	lw	a5,-20(s0)
    80007f06:	2781                	sext.w	a5,a5
    80007f08:	0007d463          	bgez	a5,80007f10 <sys_dup+0x46>
    return -1;
    80007f0c:	57fd                	li	a5,-1
    80007f0e:	a811                	j	80007f22 <sys_dup+0x58>
  filedup(f);
    80007f10:	fe043783          	ld	a5,-32(s0)
    80007f14:	853e                	mv	a0,a5
    80007f16:	fffff097          	auipc	ra,0xfffff
    80007f1a:	ec0080e7          	jalr	-320(ra) # 80006dd6 <filedup>
  return fd;
    80007f1e:	fec42783          	lw	a5,-20(s0)
}
    80007f22:	853e                	mv	a0,a5
    80007f24:	60e2                	ld	ra,24(sp)
    80007f26:	6442                	ld	s0,16(sp)
    80007f28:	6105                	addi	sp,sp,32
    80007f2a:	8082                	ret

0000000080007f2c <sys_read>:

uint64
sys_read(void)
{
    80007f2c:	7179                	addi	sp,sp,-48
    80007f2e:	f406                	sd	ra,40(sp)
    80007f30:	f022                	sd	s0,32(sp)
    80007f32:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007f34:	fd840793          	addi	a5,s0,-40
    80007f38:	85be                	mv	a1,a5
    80007f3a:	4505                	li	a0,1
    80007f3c:	ffffd097          	auipc	ra,0xffffd
    80007f40:	86a080e7          	jalr	-1942(ra) # 800047a6 <argaddr>
  argint(2, &n);
    80007f44:	fe440793          	addi	a5,s0,-28
    80007f48:	85be                	mv	a1,a5
    80007f4a:	4509                	li	a0,2
    80007f4c:	ffffd097          	auipc	ra,0xffffd
    80007f50:	824080e7          	jalr	-2012(ra) # 80004770 <argint>
  if(argfd(0, 0, &f) < 0)
    80007f54:	fe840793          	addi	a5,s0,-24
    80007f58:	863e                	mv	a2,a5
    80007f5a:	4581                	li	a1,0
    80007f5c:	4501                	li	a0,0
    80007f5e:	00000097          	auipc	ra,0x0
    80007f62:	e70080e7          	jalr	-400(ra) # 80007dce <argfd>
    80007f66:	87aa                	mv	a5,a0
    80007f68:	0007d463          	bgez	a5,80007f70 <sys_read+0x44>
    return -1;
    80007f6c:	57fd                	li	a5,-1
    80007f6e:	a839                	j	80007f8c <sys_read+0x60>
  return fileread(f, p, n);
    80007f70:	fe843783          	ld	a5,-24(s0)
    80007f74:	fd843703          	ld	a4,-40(s0)
    80007f78:	fe442683          	lw	a3,-28(s0)
    80007f7c:	8636                	mv	a2,a3
    80007f7e:	85ba                	mv	a1,a4
    80007f80:	853e                	mv	a0,a5
    80007f82:	fffff097          	auipc	ra,0xfffff
    80007f86:	066080e7          	jalr	102(ra) # 80006fe8 <fileread>
    80007f8a:	87aa                	mv	a5,a0
}
    80007f8c:	853e                	mv	a0,a5
    80007f8e:	70a2                	ld	ra,40(sp)
    80007f90:	7402                	ld	s0,32(sp)
    80007f92:	6145                	addi	sp,sp,48
    80007f94:	8082                	ret

0000000080007f96 <sys_write>:

uint64
sys_write(void)
{
    80007f96:	7179                	addi	sp,sp,-48
    80007f98:	f406                	sd	ra,40(sp)
    80007f9a:	f022                	sd	s0,32(sp)
    80007f9c:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007f9e:	fd840793          	addi	a5,s0,-40
    80007fa2:	85be                	mv	a1,a5
    80007fa4:	4505                	li	a0,1
    80007fa6:	ffffd097          	auipc	ra,0xffffd
    80007faa:	800080e7          	jalr	-2048(ra) # 800047a6 <argaddr>
  argint(2, &n);
    80007fae:	fe440793          	addi	a5,s0,-28
    80007fb2:	85be                	mv	a1,a5
    80007fb4:	4509                	li	a0,2
    80007fb6:	ffffc097          	auipc	ra,0xffffc
    80007fba:	7ba080e7          	jalr	1978(ra) # 80004770 <argint>
  if(argfd(0, 0, &f) < 0)
    80007fbe:	fe840793          	addi	a5,s0,-24
    80007fc2:	863e                	mv	a2,a5
    80007fc4:	4581                	li	a1,0
    80007fc6:	4501                	li	a0,0
    80007fc8:	00000097          	auipc	ra,0x0
    80007fcc:	e06080e7          	jalr	-506(ra) # 80007dce <argfd>
    80007fd0:	87aa                	mv	a5,a0
    80007fd2:	0007d463          	bgez	a5,80007fda <sys_write+0x44>
    return -1;
    80007fd6:	57fd                	li	a5,-1
    80007fd8:	a839                	j	80007ff6 <sys_write+0x60>

  return filewrite(f, p, n);
    80007fda:	fe843783          	ld	a5,-24(s0)
    80007fde:	fd843703          	ld	a4,-40(s0)
    80007fe2:	fe442683          	lw	a3,-28(s0)
    80007fe6:	8636                	mv	a2,a3
    80007fe8:	85ba                	mv	a1,a4
    80007fea:	853e                	mv	a0,a5
    80007fec:	fffff097          	auipc	ra,0xfffff
    80007ff0:	162080e7          	jalr	354(ra) # 8000714e <filewrite>
    80007ff4:	87aa                	mv	a5,a0
}
    80007ff6:	853e                	mv	a0,a5
    80007ff8:	70a2                	ld	ra,40(sp)
    80007ffa:	7402                	ld	s0,32(sp)
    80007ffc:	6145                	addi	sp,sp,48
    80007ffe:	8082                	ret

0000000080008000 <sys_close>:

uint64
sys_close(void)
{
    80008000:	1101                	addi	sp,sp,-32
    80008002:	ec06                	sd	ra,24(sp)
    80008004:	e822                	sd	s0,16(sp)
    80008006:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80008008:	fe040713          	addi	a4,s0,-32
    8000800c:	fec40793          	addi	a5,s0,-20
    80008010:	863a                	mv	a2,a4
    80008012:	85be                	mv	a1,a5
    80008014:	4501                	li	a0,0
    80008016:	00000097          	auipc	ra,0x0
    8000801a:	db8080e7          	jalr	-584(ra) # 80007dce <argfd>
    8000801e:	87aa                	mv	a5,a0
    80008020:	0007d463          	bgez	a5,80008028 <sys_close+0x28>
    return -1;
    80008024:	57fd                	li	a5,-1
    80008026:	a02d                	j	80008050 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80008028:	ffffb097          	auipc	ra,0xffffb
    8000802c:	e50080e7          	jalr	-432(ra) # 80002e78 <myproc>
    80008030:	872a                	mv	a4,a0
    80008032:	fec42783          	lw	a5,-20(s0)
    80008036:	07e9                	addi	a5,a5,26
    80008038:	078e                	slli	a5,a5,0x3
    8000803a:	97ba                	add	a5,a5,a4
    8000803c:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80008040:	fe043783          	ld	a5,-32(s0)
    80008044:	853e                	mv	a0,a5
    80008046:	fffff097          	auipc	ra,0xfffff
    8000804a:	df6080e7          	jalr	-522(ra) # 80006e3c <fileclose>
  return 0;
    8000804e:	4781                	li	a5,0
}
    80008050:	853e                	mv	a0,a5
    80008052:	60e2                	ld	ra,24(sp)
    80008054:	6442                	ld	s0,16(sp)
    80008056:	6105                	addi	sp,sp,32
    80008058:	8082                	ret

000000008000805a <sys_fstat>:

uint64
sys_fstat(void)
{
    8000805a:	1101                	addi	sp,sp,-32
    8000805c:	ec06                	sd	ra,24(sp)
    8000805e:	e822                	sd	s0,16(sp)
    80008060:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80008062:	fe040793          	addi	a5,s0,-32
    80008066:	85be                	mv	a1,a5
    80008068:	4505                	li	a0,1
    8000806a:	ffffc097          	auipc	ra,0xffffc
    8000806e:	73c080e7          	jalr	1852(ra) # 800047a6 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80008072:	fe840793          	addi	a5,s0,-24
    80008076:	863e                	mv	a2,a5
    80008078:	4581                	li	a1,0
    8000807a:	4501                	li	a0,0
    8000807c:	00000097          	auipc	ra,0x0
    80008080:	d52080e7          	jalr	-686(ra) # 80007dce <argfd>
    80008084:	87aa                	mv	a5,a0
    80008086:	0007d463          	bgez	a5,8000808e <sys_fstat+0x34>
    return -1;
    8000808a:	57fd                	li	a5,-1
    8000808c:	a821                	j	800080a4 <sys_fstat+0x4a>
  return filestat(f, st);
    8000808e:	fe843783          	ld	a5,-24(s0)
    80008092:	fe043703          	ld	a4,-32(s0)
    80008096:	85ba                	mv	a1,a4
    80008098:	853e                	mv	a0,a5
    8000809a:	fffff097          	auipc	ra,0xfffff
    8000809e:	eaa080e7          	jalr	-342(ra) # 80006f44 <filestat>
    800080a2:	87aa                	mv	a5,a0
}
    800080a4:	853e                	mv	a0,a5
    800080a6:	60e2                	ld	ra,24(sp)
    800080a8:	6442                	ld	s0,16(sp)
    800080aa:	6105                	addi	sp,sp,32
    800080ac:	8082                	ret

00000000800080ae <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    800080ae:	7169                	addi	sp,sp,-304
    800080b0:	f606                	sd	ra,296(sp)
    800080b2:	f222                	sd	s0,288(sp)
    800080b4:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    800080b6:	ed040793          	addi	a5,s0,-304
    800080ba:	08000613          	li	a2,128
    800080be:	85be                	mv	a1,a5
    800080c0:	4501                	li	a0,0
    800080c2:	ffffc097          	auipc	ra,0xffffc
    800080c6:	716080e7          	jalr	1814(ra) # 800047d8 <argstr>
    800080ca:	87aa                	mv	a5,a0
    800080cc:	0007cf63          	bltz	a5,800080ea <sys_link+0x3c>
    800080d0:	f5040793          	addi	a5,s0,-176
    800080d4:	08000613          	li	a2,128
    800080d8:	85be                	mv	a1,a5
    800080da:	4505                	li	a0,1
    800080dc:	ffffc097          	auipc	ra,0xffffc
    800080e0:	6fc080e7          	jalr	1788(ra) # 800047d8 <argstr>
    800080e4:	87aa                	mv	a5,a0
    800080e6:	0007d463          	bgez	a5,800080ee <sys_link+0x40>
    return -1;
    800080ea:	57fd                	li	a5,-1
    800080ec:	aab5                	j	80008268 <sys_link+0x1ba>

  begin_op();
    800080ee:	ffffe097          	auipc	ra,0xffffe
    800080f2:	6b4080e7          	jalr	1716(ra) # 800067a2 <begin_op>
  if((ip = namei(old)) == 0){
    800080f6:	ed040793          	addi	a5,s0,-304
    800080fa:	853e                	mv	a0,a5
    800080fc:	ffffe097          	auipc	ra,0xffffe
    80008100:	342080e7          	jalr	834(ra) # 8000643e <namei>
    80008104:	fea43423          	sd	a0,-24(s0)
    80008108:	fe843783          	ld	a5,-24(s0)
    8000810c:	e799                	bnez	a5,8000811a <sys_link+0x6c>
    end_op();
    8000810e:	ffffe097          	auipc	ra,0xffffe
    80008112:	756080e7          	jalr	1878(ra) # 80006864 <end_op>
    return -1;
    80008116:	57fd                	li	a5,-1
    80008118:	aa81                	j	80008268 <sys_link+0x1ba>
  }

  ilock(ip);
    8000811a:	fe843503          	ld	a0,-24(s0)
    8000811e:	ffffd097          	auipc	ra,0xffffd
    80008122:	5fa080e7          	jalr	1530(ra) # 80005718 <ilock>
  if(ip->type == T_DIR){
    80008126:	fe843783          	ld	a5,-24(s0)
    8000812a:	04479783          	lh	a5,68(a5)
    8000812e:	0007871b          	sext.w	a4,a5
    80008132:	4785                	li	a5,1
    80008134:	00f71e63          	bne	a4,a5,80008150 <sys_link+0xa2>
    iunlockput(ip);
    80008138:	fe843503          	ld	a0,-24(s0)
    8000813c:	ffffe097          	auipc	ra,0xffffe
    80008140:	83a080e7          	jalr	-1990(ra) # 80005976 <iunlockput>
    end_op();
    80008144:	ffffe097          	auipc	ra,0xffffe
    80008148:	720080e7          	jalr	1824(ra) # 80006864 <end_op>
    return -1;
    8000814c:	57fd                	li	a5,-1
    8000814e:	aa29                	j	80008268 <sys_link+0x1ba>
  }

  ip->nlink++;
    80008150:	fe843783          	ld	a5,-24(s0)
    80008154:	04a79783          	lh	a5,74(a5)
    80008158:	17c2                	slli	a5,a5,0x30
    8000815a:	93c1                	srli	a5,a5,0x30
    8000815c:	2785                	addiw	a5,a5,1
    8000815e:	17c2                	slli	a5,a5,0x30
    80008160:	93c1                	srli	a5,a5,0x30
    80008162:	0107971b          	slliw	a4,a5,0x10
    80008166:	4107571b          	sraiw	a4,a4,0x10
    8000816a:	fe843783          	ld	a5,-24(s0)
    8000816e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008172:	fe843503          	ld	a0,-24(s0)
    80008176:	ffffd097          	auipc	ra,0xffffd
    8000817a:	352080e7          	jalr	850(ra) # 800054c8 <iupdate>
  iunlock(ip);
    8000817e:	fe843503          	ld	a0,-24(s0)
    80008182:	ffffd097          	auipc	ra,0xffffd
    80008186:	6ca080e7          	jalr	1738(ra) # 8000584c <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    8000818a:	fd040713          	addi	a4,s0,-48
    8000818e:	f5040793          	addi	a5,s0,-176
    80008192:	85ba                	mv	a1,a4
    80008194:	853e                	mv	a0,a5
    80008196:	ffffe097          	auipc	ra,0xffffe
    8000819a:	2d4080e7          	jalr	724(ra) # 8000646a <nameiparent>
    8000819e:	fea43023          	sd	a0,-32(s0)
    800081a2:	fe043783          	ld	a5,-32(s0)
    800081a6:	cba5                	beqz	a5,80008216 <sys_link+0x168>
    goto bad;
  ilock(dp);
    800081a8:	fe043503          	ld	a0,-32(s0)
    800081ac:	ffffd097          	auipc	ra,0xffffd
    800081b0:	56c080e7          	jalr	1388(ra) # 80005718 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    800081b4:	fe043783          	ld	a5,-32(s0)
    800081b8:	4398                	lw	a4,0(a5)
    800081ba:	fe843783          	ld	a5,-24(s0)
    800081be:	439c                	lw	a5,0(a5)
    800081c0:	02f71263          	bne	a4,a5,800081e4 <sys_link+0x136>
    800081c4:	fe843783          	ld	a5,-24(s0)
    800081c8:	43d8                	lw	a4,4(a5)
    800081ca:	fd040793          	addi	a5,s0,-48
    800081ce:	863a                	mv	a2,a4
    800081d0:	85be                	mv	a1,a5
    800081d2:	fe043503          	ld	a0,-32(s0)
    800081d6:	ffffe097          	auipc	ra,0xffffe
    800081da:	f5a080e7          	jalr	-166(ra) # 80006130 <dirlink>
    800081de:	87aa                	mv	a5,a0
    800081e0:	0007d963          	bgez	a5,800081f2 <sys_link+0x144>
    iunlockput(dp);
    800081e4:	fe043503          	ld	a0,-32(s0)
    800081e8:	ffffd097          	auipc	ra,0xffffd
    800081ec:	78e080e7          	jalr	1934(ra) # 80005976 <iunlockput>
    goto bad;
    800081f0:	a025                	j	80008218 <sys_link+0x16a>
  }
  iunlockput(dp);
    800081f2:	fe043503          	ld	a0,-32(s0)
    800081f6:	ffffd097          	auipc	ra,0xffffd
    800081fa:	780080e7          	jalr	1920(ra) # 80005976 <iunlockput>
  iput(ip);
    800081fe:	fe843503          	ld	a0,-24(s0)
    80008202:	ffffd097          	auipc	ra,0xffffd
    80008206:	6a4080e7          	jalr	1700(ra) # 800058a6 <iput>

  end_op();
    8000820a:	ffffe097          	auipc	ra,0xffffe
    8000820e:	65a080e7          	jalr	1626(ra) # 80006864 <end_op>

  return 0;
    80008212:	4781                	li	a5,0
    80008214:	a891                	j	80008268 <sys_link+0x1ba>
    goto bad;
    80008216:	0001                	nop

bad:
  ilock(ip);
    80008218:	fe843503          	ld	a0,-24(s0)
    8000821c:	ffffd097          	auipc	ra,0xffffd
    80008220:	4fc080e7          	jalr	1276(ra) # 80005718 <ilock>
  ip->nlink--;
    80008224:	fe843783          	ld	a5,-24(s0)
    80008228:	04a79783          	lh	a5,74(a5)
    8000822c:	17c2                	slli	a5,a5,0x30
    8000822e:	93c1                	srli	a5,a5,0x30
    80008230:	37fd                	addiw	a5,a5,-1
    80008232:	17c2                	slli	a5,a5,0x30
    80008234:	93c1                	srli	a5,a5,0x30
    80008236:	0107971b          	slliw	a4,a5,0x10
    8000823a:	4107571b          	sraiw	a4,a4,0x10
    8000823e:	fe843783          	ld	a5,-24(s0)
    80008242:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008246:	fe843503          	ld	a0,-24(s0)
    8000824a:	ffffd097          	auipc	ra,0xffffd
    8000824e:	27e080e7          	jalr	638(ra) # 800054c8 <iupdate>
  iunlockput(ip);
    80008252:	fe843503          	ld	a0,-24(s0)
    80008256:	ffffd097          	auipc	ra,0xffffd
    8000825a:	720080e7          	jalr	1824(ra) # 80005976 <iunlockput>
  end_op();
    8000825e:	ffffe097          	auipc	ra,0xffffe
    80008262:	606080e7          	jalr	1542(ra) # 80006864 <end_op>
  return -1;
    80008266:	57fd                	li	a5,-1
}
    80008268:	853e                	mv	a0,a5
    8000826a:	70b2                	ld	ra,296(sp)
    8000826c:	7412                	ld	s0,288(sp)
    8000826e:	6155                	addi	sp,sp,304
    80008270:	8082                	ret

0000000080008272 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80008272:	7139                	addi	sp,sp,-64
    80008274:	fc06                	sd	ra,56(sp)
    80008276:	f822                	sd	s0,48(sp)
    80008278:	0080                	addi	s0,sp,64
    8000827a:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    8000827e:	02000793          	li	a5,32
    80008282:	fef42623          	sw	a5,-20(s0)
    80008286:	a0b1                	j	800082d2 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008288:	fd840793          	addi	a5,s0,-40
    8000828c:	fec42683          	lw	a3,-20(s0)
    80008290:	4741                	li	a4,16
    80008292:	863e                	mv	a2,a5
    80008294:	4581                	li	a1,0
    80008296:	fc843503          	ld	a0,-56(s0)
    8000829a:	ffffe097          	auipc	ra,0xffffe
    8000829e:	a34080e7          	jalr	-1484(ra) # 80005cce <readi>
    800082a2:	87aa                	mv	a5,a0
    800082a4:	873e                	mv	a4,a5
    800082a6:	47c1                	li	a5,16
    800082a8:	00f70a63          	beq	a4,a5,800082bc <isdirempty+0x4a>
      panic("isdirempty: readi");
    800082ac:	00004517          	auipc	a0,0x4
    800082b0:	37450513          	addi	a0,a0,884 # 8000c620 <etext+0x620>
    800082b4:	ffff9097          	auipc	ra,0xffff9
    800082b8:	9d8080e7          	jalr	-1576(ra) # 80000c8c <panic>
    if(de.inum != 0)
    800082bc:	fd845783          	lhu	a5,-40(s0)
    800082c0:	c399                	beqz	a5,800082c6 <isdirempty+0x54>
      return 0;
    800082c2:	4781                	li	a5,0
    800082c4:	a839                	j	800082e2 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    800082c6:	fec42783          	lw	a5,-20(s0)
    800082ca:	27c1                	addiw	a5,a5,16
    800082cc:	2781                	sext.w	a5,a5
    800082ce:	fef42623          	sw	a5,-20(s0)
    800082d2:	fc843783          	ld	a5,-56(s0)
    800082d6:	47f8                	lw	a4,76(a5)
    800082d8:	fec42783          	lw	a5,-20(s0)
    800082dc:	fae7e6e3          	bltu	a5,a4,80008288 <isdirempty+0x16>
  }
  return 1;
    800082e0:	4785                	li	a5,1
}
    800082e2:	853e                	mv	a0,a5
    800082e4:	70e2                	ld	ra,56(sp)
    800082e6:	7442                	ld	s0,48(sp)
    800082e8:	6121                	addi	sp,sp,64
    800082ea:	8082                	ret

00000000800082ec <sys_unlink>:

uint64
sys_unlink(void)
{
    800082ec:	7155                	addi	sp,sp,-208
    800082ee:	e586                	sd	ra,200(sp)
    800082f0:	e1a2                	sd	s0,192(sp)
    800082f2:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    800082f4:	f4040793          	addi	a5,s0,-192
    800082f8:	08000613          	li	a2,128
    800082fc:	85be                	mv	a1,a5
    800082fe:	4501                	li	a0,0
    80008300:	ffffc097          	auipc	ra,0xffffc
    80008304:	4d8080e7          	jalr	1240(ra) # 800047d8 <argstr>
    80008308:	87aa                	mv	a5,a0
    8000830a:	0007d463          	bgez	a5,80008312 <sys_unlink+0x26>
    return -1;
    8000830e:	57fd                	li	a5,-1
    80008310:	a2ed                	j	800084fa <sys_unlink+0x20e>

  begin_op();
    80008312:	ffffe097          	auipc	ra,0xffffe
    80008316:	490080e7          	jalr	1168(ra) # 800067a2 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    8000831a:	fc040713          	addi	a4,s0,-64
    8000831e:	f4040793          	addi	a5,s0,-192
    80008322:	85ba                	mv	a1,a4
    80008324:	853e                	mv	a0,a5
    80008326:	ffffe097          	auipc	ra,0xffffe
    8000832a:	144080e7          	jalr	324(ra) # 8000646a <nameiparent>
    8000832e:	fea43423          	sd	a0,-24(s0)
    80008332:	fe843783          	ld	a5,-24(s0)
    80008336:	e799                	bnez	a5,80008344 <sys_unlink+0x58>
    end_op();
    80008338:	ffffe097          	auipc	ra,0xffffe
    8000833c:	52c080e7          	jalr	1324(ra) # 80006864 <end_op>
    return -1;
    80008340:	57fd                	li	a5,-1
    80008342:	aa65                	j	800084fa <sys_unlink+0x20e>
  }

  ilock(dp);
    80008344:	fe843503          	ld	a0,-24(s0)
    80008348:	ffffd097          	auipc	ra,0xffffd
    8000834c:	3d0080e7          	jalr	976(ra) # 80005718 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80008350:	fc040793          	addi	a5,s0,-64
    80008354:	00004597          	auipc	a1,0x4
    80008358:	2e458593          	addi	a1,a1,740 # 8000c638 <etext+0x638>
    8000835c:	853e                	mv	a0,a5
    8000835e:	ffffe097          	auipc	ra,0xffffe
    80008362:	cbc080e7          	jalr	-836(ra) # 8000601a <namecmp>
    80008366:	87aa                	mv	a5,a0
    80008368:	16078b63          	beqz	a5,800084de <sys_unlink+0x1f2>
    8000836c:	fc040793          	addi	a5,s0,-64
    80008370:	00004597          	auipc	a1,0x4
    80008374:	2d058593          	addi	a1,a1,720 # 8000c640 <etext+0x640>
    80008378:	853e                	mv	a0,a5
    8000837a:	ffffe097          	auipc	ra,0xffffe
    8000837e:	ca0080e7          	jalr	-864(ra) # 8000601a <namecmp>
    80008382:	87aa                	mv	a5,a0
    80008384:	14078d63          	beqz	a5,800084de <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80008388:	f3c40713          	addi	a4,s0,-196
    8000838c:	fc040793          	addi	a5,s0,-64
    80008390:	863a                	mv	a2,a4
    80008392:	85be                	mv	a1,a5
    80008394:	fe843503          	ld	a0,-24(s0)
    80008398:	ffffe097          	auipc	ra,0xffffe
    8000839c:	cb0080e7          	jalr	-848(ra) # 80006048 <dirlookup>
    800083a0:	fea43023          	sd	a0,-32(s0)
    800083a4:	fe043783          	ld	a5,-32(s0)
    800083a8:	12078d63          	beqz	a5,800084e2 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    800083ac:	fe043503          	ld	a0,-32(s0)
    800083b0:	ffffd097          	auipc	ra,0xffffd
    800083b4:	368080e7          	jalr	872(ra) # 80005718 <ilock>

  if(ip->nlink < 1)
    800083b8:	fe043783          	ld	a5,-32(s0)
    800083bc:	04a79783          	lh	a5,74(a5)
    800083c0:	2781                	sext.w	a5,a5
    800083c2:	00f04a63          	bgtz	a5,800083d6 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    800083c6:	00004517          	auipc	a0,0x4
    800083ca:	28250513          	addi	a0,a0,642 # 8000c648 <etext+0x648>
    800083ce:	ffff9097          	auipc	ra,0xffff9
    800083d2:	8be080e7          	jalr	-1858(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    800083d6:	fe043783          	ld	a5,-32(s0)
    800083da:	04479783          	lh	a5,68(a5)
    800083de:	0007871b          	sext.w	a4,a5
    800083e2:	4785                	li	a5,1
    800083e4:	02f71163          	bne	a4,a5,80008406 <sys_unlink+0x11a>
    800083e8:	fe043503          	ld	a0,-32(s0)
    800083ec:	00000097          	auipc	ra,0x0
    800083f0:	e86080e7          	jalr	-378(ra) # 80008272 <isdirempty>
    800083f4:	87aa                	mv	a5,a0
    800083f6:	eb81                	bnez	a5,80008406 <sys_unlink+0x11a>
    iunlockput(ip);
    800083f8:	fe043503          	ld	a0,-32(s0)
    800083fc:	ffffd097          	auipc	ra,0xffffd
    80008400:	57a080e7          	jalr	1402(ra) # 80005976 <iunlockput>
    goto bad;
    80008404:	a0c5                	j	800084e4 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80008406:	fd040793          	addi	a5,s0,-48
    8000840a:	4641                	li	a2,16
    8000840c:	4581                	li	a1,0
    8000840e:	853e                	mv	a0,a5
    80008410:	ffff9097          	auipc	ra,0xffff9
    80008414:	12c080e7          	jalr	300(ra) # 8000153c <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008418:	fd040793          	addi	a5,s0,-48
    8000841c:	f3c42683          	lw	a3,-196(s0)
    80008420:	4741                	li	a4,16
    80008422:	863e                	mv	a2,a5
    80008424:	4581                	li	a1,0
    80008426:	fe843503          	ld	a0,-24(s0)
    8000842a:	ffffe097          	auipc	ra,0xffffe
    8000842e:	a3c080e7          	jalr	-1476(ra) # 80005e66 <writei>
    80008432:	87aa                	mv	a5,a0
    80008434:	873e                	mv	a4,a5
    80008436:	47c1                	li	a5,16
    80008438:	00f70a63          	beq	a4,a5,8000844c <sys_unlink+0x160>
    panic("unlink: writei");
    8000843c:	00004517          	auipc	a0,0x4
    80008440:	22450513          	addi	a0,a0,548 # 8000c660 <etext+0x660>
    80008444:	ffff9097          	auipc	ra,0xffff9
    80008448:	848080e7          	jalr	-1976(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    8000844c:	fe043783          	ld	a5,-32(s0)
    80008450:	04479783          	lh	a5,68(a5)
    80008454:	0007871b          	sext.w	a4,a5
    80008458:	4785                	li	a5,1
    8000845a:	02f71963          	bne	a4,a5,8000848c <sys_unlink+0x1a0>
    dp->nlink--;
    8000845e:	fe843783          	ld	a5,-24(s0)
    80008462:	04a79783          	lh	a5,74(a5)
    80008466:	17c2                	slli	a5,a5,0x30
    80008468:	93c1                	srli	a5,a5,0x30
    8000846a:	37fd                	addiw	a5,a5,-1
    8000846c:	17c2                	slli	a5,a5,0x30
    8000846e:	93c1                	srli	a5,a5,0x30
    80008470:	0107971b          	slliw	a4,a5,0x10
    80008474:	4107571b          	sraiw	a4,a4,0x10
    80008478:	fe843783          	ld	a5,-24(s0)
    8000847c:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008480:	fe843503          	ld	a0,-24(s0)
    80008484:	ffffd097          	auipc	ra,0xffffd
    80008488:	044080e7          	jalr	68(ra) # 800054c8 <iupdate>
  }
  iunlockput(dp);
    8000848c:	fe843503          	ld	a0,-24(s0)
    80008490:	ffffd097          	auipc	ra,0xffffd
    80008494:	4e6080e7          	jalr	1254(ra) # 80005976 <iunlockput>

  ip->nlink--;
    80008498:	fe043783          	ld	a5,-32(s0)
    8000849c:	04a79783          	lh	a5,74(a5)
    800084a0:	17c2                	slli	a5,a5,0x30
    800084a2:	93c1                	srli	a5,a5,0x30
    800084a4:	37fd                	addiw	a5,a5,-1
    800084a6:	17c2                	slli	a5,a5,0x30
    800084a8:	93c1                	srli	a5,a5,0x30
    800084aa:	0107971b          	slliw	a4,a5,0x10
    800084ae:	4107571b          	sraiw	a4,a4,0x10
    800084b2:	fe043783          	ld	a5,-32(s0)
    800084b6:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800084ba:	fe043503          	ld	a0,-32(s0)
    800084be:	ffffd097          	auipc	ra,0xffffd
    800084c2:	00a080e7          	jalr	10(ra) # 800054c8 <iupdate>
  iunlockput(ip);
    800084c6:	fe043503          	ld	a0,-32(s0)
    800084ca:	ffffd097          	auipc	ra,0xffffd
    800084ce:	4ac080e7          	jalr	1196(ra) # 80005976 <iunlockput>

  end_op();
    800084d2:	ffffe097          	auipc	ra,0xffffe
    800084d6:	392080e7          	jalr	914(ra) # 80006864 <end_op>

  return 0;
    800084da:	4781                	li	a5,0
    800084dc:	a839                	j	800084fa <sys_unlink+0x20e>
    goto bad;
    800084de:	0001                	nop
    800084e0:	a011                	j	800084e4 <sys_unlink+0x1f8>
    goto bad;
    800084e2:	0001                	nop

bad:
  iunlockput(dp);
    800084e4:	fe843503          	ld	a0,-24(s0)
    800084e8:	ffffd097          	auipc	ra,0xffffd
    800084ec:	48e080e7          	jalr	1166(ra) # 80005976 <iunlockput>
  end_op();
    800084f0:	ffffe097          	auipc	ra,0xffffe
    800084f4:	374080e7          	jalr	884(ra) # 80006864 <end_op>
  return -1;
    800084f8:	57fd                	li	a5,-1
}
    800084fa:	853e                	mv	a0,a5
    800084fc:	60ae                	ld	ra,200(sp)
    800084fe:	640e                	ld	s0,192(sp)
    80008500:	6169                	addi	sp,sp,208
    80008502:	8082                	ret

0000000080008504 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80008504:	7139                	addi	sp,sp,-64
    80008506:	fc06                	sd	ra,56(sp)
    80008508:	f822                	sd	s0,48(sp)
    8000850a:	0080                	addi	s0,sp,64
    8000850c:	fca43423          	sd	a0,-56(s0)
    80008510:	87ae                	mv	a5,a1
    80008512:	8736                	mv	a4,a3
    80008514:	fcf41323          	sh	a5,-58(s0)
    80008518:	87b2                	mv	a5,a2
    8000851a:	fcf41223          	sh	a5,-60(s0)
    8000851e:	87ba                	mv	a5,a4
    80008520:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80008524:	fd040793          	addi	a5,s0,-48
    80008528:	85be                	mv	a1,a5
    8000852a:	fc843503          	ld	a0,-56(s0)
    8000852e:	ffffe097          	auipc	ra,0xffffe
    80008532:	f3c080e7          	jalr	-196(ra) # 8000646a <nameiparent>
    80008536:	fea43423          	sd	a0,-24(s0)
    8000853a:	fe843783          	ld	a5,-24(s0)
    8000853e:	e399                	bnez	a5,80008544 <create+0x40>
    return 0;
    80008540:	4781                	li	a5,0
    80008542:	a2ed                	j	8000872c <create+0x228>

  ilock(dp);
    80008544:	fe843503          	ld	a0,-24(s0)
    80008548:	ffffd097          	auipc	ra,0xffffd
    8000854c:	1d0080e7          	jalr	464(ra) # 80005718 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008550:	fd040793          	addi	a5,s0,-48
    80008554:	4601                	li	a2,0
    80008556:	85be                	mv	a1,a5
    80008558:	fe843503          	ld	a0,-24(s0)
    8000855c:	ffffe097          	auipc	ra,0xffffe
    80008560:	aec080e7          	jalr	-1300(ra) # 80006048 <dirlookup>
    80008564:	fea43023          	sd	a0,-32(s0)
    80008568:	fe043783          	ld	a5,-32(s0)
    8000856c:	c3ad                	beqz	a5,800085ce <create+0xca>
    iunlockput(dp);
    8000856e:	fe843503          	ld	a0,-24(s0)
    80008572:	ffffd097          	auipc	ra,0xffffd
    80008576:	404080e7          	jalr	1028(ra) # 80005976 <iunlockput>
    ilock(ip);
    8000857a:	fe043503          	ld	a0,-32(s0)
    8000857e:	ffffd097          	auipc	ra,0xffffd
    80008582:	19a080e7          	jalr	410(ra) # 80005718 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80008586:	fc641783          	lh	a5,-58(s0)
    8000858a:	0007871b          	sext.w	a4,a5
    8000858e:	4789                	li	a5,2
    80008590:	02f71763          	bne	a4,a5,800085be <create+0xba>
    80008594:	fe043783          	ld	a5,-32(s0)
    80008598:	04479783          	lh	a5,68(a5)
    8000859c:	0007871b          	sext.w	a4,a5
    800085a0:	4789                	li	a5,2
    800085a2:	00f70b63          	beq	a4,a5,800085b8 <create+0xb4>
    800085a6:	fe043783          	ld	a5,-32(s0)
    800085aa:	04479783          	lh	a5,68(a5)
    800085ae:	0007871b          	sext.w	a4,a5
    800085b2:	478d                	li	a5,3
    800085b4:	00f71563          	bne	a4,a5,800085be <create+0xba>
      return ip;
    800085b8:	fe043783          	ld	a5,-32(s0)
    800085bc:	aa85                	j	8000872c <create+0x228>
    iunlockput(ip);
    800085be:	fe043503          	ld	a0,-32(s0)
    800085c2:	ffffd097          	auipc	ra,0xffffd
    800085c6:	3b4080e7          	jalr	948(ra) # 80005976 <iunlockput>
    return 0;
    800085ca:	4781                	li	a5,0
    800085cc:	a285                	j	8000872c <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    800085ce:	fe843783          	ld	a5,-24(s0)
    800085d2:	439c                	lw	a5,0(a5)
    800085d4:	fc641703          	lh	a4,-58(s0)
    800085d8:	85ba                	mv	a1,a4
    800085da:	853e                	mv	a0,a5
    800085dc:	ffffd097          	auipc	ra,0xffffd
    800085e0:	dee080e7          	jalr	-530(ra) # 800053ca <ialloc>
    800085e4:	fea43023          	sd	a0,-32(s0)
    800085e8:	fe043783          	ld	a5,-32(s0)
    800085ec:	eb89                	bnez	a5,800085fe <create+0xfa>
    iunlockput(dp);
    800085ee:	fe843503          	ld	a0,-24(s0)
    800085f2:	ffffd097          	auipc	ra,0xffffd
    800085f6:	384080e7          	jalr	900(ra) # 80005976 <iunlockput>
    return 0;
    800085fa:	4781                	li	a5,0
    800085fc:	aa05                	j	8000872c <create+0x228>
  }

  ilock(ip);
    800085fe:	fe043503          	ld	a0,-32(s0)
    80008602:	ffffd097          	auipc	ra,0xffffd
    80008606:	116080e7          	jalr	278(ra) # 80005718 <ilock>
  ip->major = major;
    8000860a:	fe043783          	ld	a5,-32(s0)
    8000860e:	fc445703          	lhu	a4,-60(s0)
    80008612:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80008616:	fe043783          	ld	a5,-32(s0)
    8000861a:	fc245703          	lhu	a4,-62(s0)
    8000861e:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008622:	fe043783          	ld	a5,-32(s0)
    80008626:	4705                	li	a4,1
    80008628:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    8000862c:	fe043503          	ld	a0,-32(s0)
    80008630:	ffffd097          	auipc	ra,0xffffd
    80008634:	e98080e7          	jalr	-360(ra) # 800054c8 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008638:	fc641783          	lh	a5,-58(s0)
    8000863c:	0007871b          	sext.w	a4,a5
    80008640:	4785                	li	a5,1
    80008642:	04f71463          	bne	a4,a5,8000868a <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80008646:	fe043783          	ld	a5,-32(s0)
    8000864a:	43dc                	lw	a5,4(a5)
    8000864c:	863e                	mv	a2,a5
    8000864e:	00004597          	auipc	a1,0x4
    80008652:	fea58593          	addi	a1,a1,-22 # 8000c638 <etext+0x638>
    80008656:	fe043503          	ld	a0,-32(s0)
    8000865a:	ffffe097          	auipc	ra,0xffffe
    8000865e:	ad6080e7          	jalr	-1322(ra) # 80006130 <dirlink>
    80008662:	87aa                	mv	a5,a0
    80008664:	0807ca63          	bltz	a5,800086f8 <create+0x1f4>
    80008668:	fe843783          	ld	a5,-24(s0)
    8000866c:	43dc                	lw	a5,4(a5)
    8000866e:	863e                	mv	a2,a5
    80008670:	00004597          	auipc	a1,0x4
    80008674:	fd058593          	addi	a1,a1,-48 # 8000c640 <etext+0x640>
    80008678:	fe043503          	ld	a0,-32(s0)
    8000867c:	ffffe097          	auipc	ra,0xffffe
    80008680:	ab4080e7          	jalr	-1356(ra) # 80006130 <dirlink>
    80008684:	87aa                	mv	a5,a0
    80008686:	0607c963          	bltz	a5,800086f8 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    8000868a:	fe043783          	ld	a5,-32(s0)
    8000868e:	43d8                	lw	a4,4(a5)
    80008690:	fd040793          	addi	a5,s0,-48
    80008694:	863a                	mv	a2,a4
    80008696:	85be                	mv	a1,a5
    80008698:	fe843503          	ld	a0,-24(s0)
    8000869c:	ffffe097          	auipc	ra,0xffffe
    800086a0:	a94080e7          	jalr	-1388(ra) # 80006130 <dirlink>
    800086a4:	87aa                	mv	a5,a0
    800086a6:	0407cb63          	bltz	a5,800086fc <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    800086aa:	fc641783          	lh	a5,-58(s0)
    800086ae:	0007871b          	sext.w	a4,a5
    800086b2:	4785                	li	a5,1
    800086b4:	02f71963          	bne	a4,a5,800086e6 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    800086b8:	fe843783          	ld	a5,-24(s0)
    800086bc:	04a79783          	lh	a5,74(a5)
    800086c0:	17c2                	slli	a5,a5,0x30
    800086c2:	93c1                	srli	a5,a5,0x30
    800086c4:	2785                	addiw	a5,a5,1
    800086c6:	17c2                	slli	a5,a5,0x30
    800086c8:	93c1                	srli	a5,a5,0x30
    800086ca:	0107971b          	slliw	a4,a5,0x10
    800086ce:	4107571b          	sraiw	a4,a4,0x10
    800086d2:	fe843783          	ld	a5,-24(s0)
    800086d6:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800086da:	fe843503          	ld	a0,-24(s0)
    800086de:	ffffd097          	auipc	ra,0xffffd
    800086e2:	dea080e7          	jalr	-534(ra) # 800054c8 <iupdate>
  }

  iunlockput(dp);
    800086e6:	fe843503          	ld	a0,-24(s0)
    800086ea:	ffffd097          	auipc	ra,0xffffd
    800086ee:	28c080e7          	jalr	652(ra) # 80005976 <iunlockput>

  return ip;
    800086f2:	fe043783          	ld	a5,-32(s0)
    800086f6:	a81d                	j	8000872c <create+0x228>
      goto fail;
    800086f8:	0001                	nop
    800086fa:	a011                	j	800086fe <create+0x1fa>
    goto fail;
    800086fc:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    800086fe:	fe043783          	ld	a5,-32(s0)
    80008702:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    80008706:	fe043503          	ld	a0,-32(s0)
    8000870a:	ffffd097          	auipc	ra,0xffffd
    8000870e:	dbe080e7          	jalr	-578(ra) # 800054c8 <iupdate>
  iunlockput(ip);
    80008712:	fe043503          	ld	a0,-32(s0)
    80008716:	ffffd097          	auipc	ra,0xffffd
    8000871a:	260080e7          	jalr	608(ra) # 80005976 <iunlockput>
  iunlockput(dp);
    8000871e:	fe843503          	ld	a0,-24(s0)
    80008722:	ffffd097          	auipc	ra,0xffffd
    80008726:	254080e7          	jalr	596(ra) # 80005976 <iunlockput>
  return 0;
    8000872a:	4781                	li	a5,0
}
    8000872c:	853e                	mv	a0,a5
    8000872e:	70e2                	ld	ra,56(sp)
    80008730:	7442                	ld	s0,48(sp)
    80008732:	6121                	addi	sp,sp,64
    80008734:	8082                	ret

0000000080008736 <sys_open>:

uint64
sys_open(void)
{
    80008736:	7131                	addi	sp,sp,-192
    80008738:	fd06                	sd	ra,184(sp)
    8000873a:	f922                	sd	s0,176(sp)
    8000873c:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    8000873e:	f4c40793          	addi	a5,s0,-180
    80008742:	85be                	mv	a1,a5
    80008744:	4505                	li	a0,1
    80008746:	ffffc097          	auipc	ra,0xffffc
    8000874a:	02a080e7          	jalr	42(ra) # 80004770 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    8000874e:	f5040793          	addi	a5,s0,-176
    80008752:	08000613          	li	a2,128
    80008756:	85be                	mv	a1,a5
    80008758:	4501                	li	a0,0
    8000875a:	ffffc097          	auipc	ra,0xffffc
    8000875e:	07e080e7          	jalr	126(ra) # 800047d8 <argstr>
    80008762:	87aa                	mv	a5,a0
    80008764:	fef42223          	sw	a5,-28(s0)
    80008768:	fe442783          	lw	a5,-28(s0)
    8000876c:	2781                	sext.w	a5,a5
    8000876e:	0007d463          	bgez	a5,80008776 <sys_open+0x40>
    return -1;
    80008772:	57fd                	li	a5,-1
    80008774:	a429                	j	8000897e <sys_open+0x248>

  begin_op();
    80008776:	ffffe097          	auipc	ra,0xffffe
    8000877a:	02c080e7          	jalr	44(ra) # 800067a2 <begin_op>

  if(omode & O_CREATE){
    8000877e:	f4c42783          	lw	a5,-180(s0)
    80008782:	2007f793          	andi	a5,a5,512
    80008786:	2781                	sext.w	a5,a5
    80008788:	c795                	beqz	a5,800087b4 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    8000878a:	f5040793          	addi	a5,s0,-176
    8000878e:	4681                	li	a3,0
    80008790:	4601                	li	a2,0
    80008792:	4589                	li	a1,2
    80008794:	853e                	mv	a0,a5
    80008796:	00000097          	auipc	ra,0x0
    8000879a:	d6e080e7          	jalr	-658(ra) # 80008504 <create>
    8000879e:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800087a2:	fe843783          	ld	a5,-24(s0)
    800087a6:	e7bd                	bnez	a5,80008814 <sys_open+0xde>
      end_op();
    800087a8:	ffffe097          	auipc	ra,0xffffe
    800087ac:	0bc080e7          	jalr	188(ra) # 80006864 <end_op>
      return -1;
    800087b0:	57fd                	li	a5,-1
    800087b2:	a2f1                	j	8000897e <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    800087b4:	f5040793          	addi	a5,s0,-176
    800087b8:	853e                	mv	a0,a5
    800087ba:	ffffe097          	auipc	ra,0xffffe
    800087be:	c84080e7          	jalr	-892(ra) # 8000643e <namei>
    800087c2:	fea43423          	sd	a0,-24(s0)
    800087c6:	fe843783          	ld	a5,-24(s0)
    800087ca:	e799                	bnez	a5,800087d8 <sys_open+0xa2>
      end_op();
    800087cc:	ffffe097          	auipc	ra,0xffffe
    800087d0:	098080e7          	jalr	152(ra) # 80006864 <end_op>
      return -1;
    800087d4:	57fd                	li	a5,-1
    800087d6:	a265                	j	8000897e <sys_open+0x248>
    }
    ilock(ip);
    800087d8:	fe843503          	ld	a0,-24(s0)
    800087dc:	ffffd097          	auipc	ra,0xffffd
    800087e0:	f3c080e7          	jalr	-196(ra) # 80005718 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800087e4:	fe843783          	ld	a5,-24(s0)
    800087e8:	04479783          	lh	a5,68(a5)
    800087ec:	0007871b          	sext.w	a4,a5
    800087f0:	4785                	li	a5,1
    800087f2:	02f71163          	bne	a4,a5,80008814 <sys_open+0xde>
    800087f6:	f4c42783          	lw	a5,-180(s0)
    800087fa:	cf89                	beqz	a5,80008814 <sys_open+0xde>
      iunlockput(ip);
    800087fc:	fe843503          	ld	a0,-24(s0)
    80008800:	ffffd097          	auipc	ra,0xffffd
    80008804:	176080e7          	jalr	374(ra) # 80005976 <iunlockput>
      end_op();
    80008808:	ffffe097          	auipc	ra,0xffffe
    8000880c:	05c080e7          	jalr	92(ra) # 80006864 <end_op>
      return -1;
    80008810:	57fd                	li	a5,-1
    80008812:	a2b5                	j	8000897e <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    80008814:	fe843783          	ld	a5,-24(s0)
    80008818:	04479783          	lh	a5,68(a5)
    8000881c:	0007871b          	sext.w	a4,a5
    80008820:	478d                	li	a5,3
    80008822:	02f71e63          	bne	a4,a5,8000885e <sys_open+0x128>
    80008826:	fe843783          	ld	a5,-24(s0)
    8000882a:	04679783          	lh	a5,70(a5)
    8000882e:	2781                	sext.w	a5,a5
    80008830:	0007cb63          	bltz	a5,80008846 <sys_open+0x110>
    80008834:	fe843783          	ld	a5,-24(s0)
    80008838:	04679783          	lh	a5,70(a5)
    8000883c:	0007871b          	sext.w	a4,a5
    80008840:	47a5                	li	a5,9
    80008842:	00e7de63          	bge	a5,a4,8000885e <sys_open+0x128>
    iunlockput(ip);
    80008846:	fe843503          	ld	a0,-24(s0)
    8000884a:	ffffd097          	auipc	ra,0xffffd
    8000884e:	12c080e7          	jalr	300(ra) # 80005976 <iunlockput>
    end_op();
    80008852:	ffffe097          	auipc	ra,0xffffe
    80008856:	012080e7          	jalr	18(ra) # 80006864 <end_op>
    return -1;
    8000885a:	57fd                	li	a5,-1
    8000885c:	a20d                	j	8000897e <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    8000885e:	ffffe097          	auipc	ra,0xffffe
    80008862:	4f4080e7          	jalr	1268(ra) # 80006d52 <filealloc>
    80008866:	fca43c23          	sd	a0,-40(s0)
    8000886a:	fd843783          	ld	a5,-40(s0)
    8000886e:	cf99                	beqz	a5,8000888c <sys_open+0x156>
    80008870:	fd843503          	ld	a0,-40(s0)
    80008874:	fffff097          	auipc	ra,0xfffff
    80008878:	5e8080e7          	jalr	1512(ra) # 80007e5c <fdalloc>
    8000887c:	87aa                	mv	a5,a0
    8000887e:	fcf42a23          	sw	a5,-44(s0)
    80008882:	fd442783          	lw	a5,-44(s0)
    80008886:	2781                	sext.w	a5,a5
    80008888:	0207d763          	bgez	a5,800088b6 <sys_open+0x180>
    if(f)
    8000888c:	fd843783          	ld	a5,-40(s0)
    80008890:	c799                	beqz	a5,8000889e <sys_open+0x168>
      fileclose(f);
    80008892:	fd843503          	ld	a0,-40(s0)
    80008896:	ffffe097          	auipc	ra,0xffffe
    8000889a:	5a6080e7          	jalr	1446(ra) # 80006e3c <fileclose>
    iunlockput(ip);
    8000889e:	fe843503          	ld	a0,-24(s0)
    800088a2:	ffffd097          	auipc	ra,0xffffd
    800088a6:	0d4080e7          	jalr	212(ra) # 80005976 <iunlockput>
    end_op();
    800088aa:	ffffe097          	auipc	ra,0xffffe
    800088ae:	fba080e7          	jalr	-70(ra) # 80006864 <end_op>
    return -1;
    800088b2:	57fd                	li	a5,-1
    800088b4:	a0e9                	j	8000897e <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    800088b6:	fe843783          	ld	a5,-24(s0)
    800088ba:	04479783          	lh	a5,68(a5)
    800088be:	0007871b          	sext.w	a4,a5
    800088c2:	478d                	li	a5,3
    800088c4:	00f71f63          	bne	a4,a5,800088e2 <sys_open+0x1ac>
    f->type = FD_DEVICE;
    800088c8:	fd843783          	ld	a5,-40(s0)
    800088cc:	470d                	li	a4,3
    800088ce:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800088d0:	fe843783          	ld	a5,-24(s0)
    800088d4:	04679703          	lh	a4,70(a5)
    800088d8:	fd843783          	ld	a5,-40(s0)
    800088dc:	02e79223          	sh	a4,36(a5)
    800088e0:	a809                	j	800088f2 <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    800088e2:	fd843783          	ld	a5,-40(s0)
    800088e6:	4709                	li	a4,2
    800088e8:	c398                	sw	a4,0(a5)
    f->off = 0;
    800088ea:	fd843783          	ld	a5,-40(s0)
    800088ee:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    800088f2:	fd843783          	ld	a5,-40(s0)
    800088f6:	fe843703          	ld	a4,-24(s0)
    800088fa:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800088fc:	f4c42783          	lw	a5,-180(s0)
    80008900:	8b85                	andi	a5,a5,1
    80008902:	2781                	sext.w	a5,a5
    80008904:	0017b793          	seqz	a5,a5
    80008908:	0ff7f793          	andi	a5,a5,255
    8000890c:	873e                	mv	a4,a5
    8000890e:	fd843783          	ld	a5,-40(s0)
    80008912:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008916:	f4c42783          	lw	a5,-180(s0)
    8000891a:	8b85                	andi	a5,a5,1
    8000891c:	2781                	sext.w	a5,a5
    8000891e:	e791                	bnez	a5,8000892a <sys_open+0x1f4>
    80008920:	f4c42783          	lw	a5,-180(s0)
    80008924:	8b89                	andi	a5,a5,2
    80008926:	2781                	sext.w	a5,a5
    80008928:	c399                	beqz	a5,8000892e <sys_open+0x1f8>
    8000892a:	4785                	li	a5,1
    8000892c:	a011                	j	80008930 <sys_open+0x1fa>
    8000892e:	4781                	li	a5,0
    80008930:	0ff7f713          	andi	a4,a5,255
    80008934:	fd843783          	ld	a5,-40(s0)
    80008938:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000893c:	f4c42783          	lw	a5,-180(s0)
    80008940:	4007f793          	andi	a5,a5,1024
    80008944:	2781                	sext.w	a5,a5
    80008946:	c385                	beqz	a5,80008966 <sys_open+0x230>
    80008948:	fe843783          	ld	a5,-24(s0)
    8000894c:	04479783          	lh	a5,68(a5)
    80008950:	0007871b          	sext.w	a4,a5
    80008954:	4789                	li	a5,2
    80008956:	00f71863          	bne	a4,a5,80008966 <sys_open+0x230>
    itrunc(ip);
    8000895a:	fe843503          	ld	a0,-24(s0)
    8000895e:	ffffd097          	auipc	ra,0xffffd
    80008962:	1c2080e7          	jalr	450(ra) # 80005b20 <itrunc>
  }

  iunlock(ip);
    80008966:	fe843503          	ld	a0,-24(s0)
    8000896a:	ffffd097          	auipc	ra,0xffffd
    8000896e:	ee2080e7          	jalr	-286(ra) # 8000584c <iunlock>
  end_op();
    80008972:	ffffe097          	auipc	ra,0xffffe
    80008976:	ef2080e7          	jalr	-270(ra) # 80006864 <end_op>

  return fd;
    8000897a:	fd442783          	lw	a5,-44(s0)
}
    8000897e:	853e                	mv	a0,a5
    80008980:	70ea                	ld	ra,184(sp)
    80008982:	744a                	ld	s0,176(sp)
    80008984:	6129                	addi	sp,sp,192
    80008986:	8082                	ret

0000000080008988 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008988:	7135                	addi	sp,sp,-160
    8000898a:	ed06                	sd	ra,152(sp)
    8000898c:	e922                	sd	s0,144(sp)
    8000898e:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    80008990:	ffffe097          	auipc	ra,0xffffe
    80008994:	e12080e7          	jalr	-494(ra) # 800067a2 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80008998:	f6840793          	addi	a5,s0,-152
    8000899c:	08000613          	li	a2,128
    800089a0:	85be                	mv	a1,a5
    800089a2:	4501                	li	a0,0
    800089a4:	ffffc097          	auipc	ra,0xffffc
    800089a8:	e34080e7          	jalr	-460(ra) # 800047d8 <argstr>
    800089ac:	87aa                	mv	a5,a0
    800089ae:	0207c163          	bltz	a5,800089d0 <sys_mkdir+0x48>
    800089b2:	f6840793          	addi	a5,s0,-152
    800089b6:	4681                	li	a3,0
    800089b8:	4601                	li	a2,0
    800089ba:	4585                	li	a1,1
    800089bc:	853e                	mv	a0,a5
    800089be:	00000097          	auipc	ra,0x0
    800089c2:	b46080e7          	jalr	-1210(ra) # 80008504 <create>
    800089c6:	fea43423          	sd	a0,-24(s0)
    800089ca:	fe843783          	ld	a5,-24(s0)
    800089ce:	e799                	bnez	a5,800089dc <sys_mkdir+0x54>
    end_op();
    800089d0:	ffffe097          	auipc	ra,0xffffe
    800089d4:	e94080e7          	jalr	-364(ra) # 80006864 <end_op>
    return -1;
    800089d8:	57fd                	li	a5,-1
    800089da:	a821                	j	800089f2 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800089dc:	fe843503          	ld	a0,-24(s0)
    800089e0:	ffffd097          	auipc	ra,0xffffd
    800089e4:	f96080e7          	jalr	-106(ra) # 80005976 <iunlockput>
  end_op();
    800089e8:	ffffe097          	auipc	ra,0xffffe
    800089ec:	e7c080e7          	jalr	-388(ra) # 80006864 <end_op>
  return 0;
    800089f0:	4781                	li	a5,0
}
    800089f2:	853e                	mv	a0,a5
    800089f4:	60ea                	ld	ra,152(sp)
    800089f6:	644a                	ld	s0,144(sp)
    800089f8:	610d                	addi	sp,sp,160
    800089fa:	8082                	ret

00000000800089fc <sys_mknod>:

uint64
sys_mknod(void)
{
    800089fc:	7135                	addi	sp,sp,-160
    800089fe:	ed06                	sd	ra,152(sp)
    80008a00:	e922                	sd	s0,144(sp)
    80008a02:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008a04:	ffffe097          	auipc	ra,0xffffe
    80008a08:	d9e080e7          	jalr	-610(ra) # 800067a2 <begin_op>
  argint(1, &major);
    80008a0c:	f6440793          	addi	a5,s0,-156
    80008a10:	85be                	mv	a1,a5
    80008a12:	4505                	li	a0,1
    80008a14:	ffffc097          	auipc	ra,0xffffc
    80008a18:	d5c080e7          	jalr	-676(ra) # 80004770 <argint>
  argint(2, &minor);
    80008a1c:	f6040793          	addi	a5,s0,-160
    80008a20:	85be                	mv	a1,a5
    80008a22:	4509                	li	a0,2
    80008a24:	ffffc097          	auipc	ra,0xffffc
    80008a28:	d4c080e7          	jalr	-692(ra) # 80004770 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008a2c:	f6840793          	addi	a5,s0,-152
    80008a30:	08000613          	li	a2,128
    80008a34:	85be                	mv	a1,a5
    80008a36:	4501                	li	a0,0
    80008a38:	ffffc097          	auipc	ra,0xffffc
    80008a3c:	da0080e7          	jalr	-608(ra) # 800047d8 <argstr>
    80008a40:	87aa                	mv	a5,a0
    80008a42:	0207cc63          	bltz	a5,80008a7a <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008a46:	f6442783          	lw	a5,-156(s0)
    80008a4a:	0107971b          	slliw	a4,a5,0x10
    80008a4e:	4107571b          	sraiw	a4,a4,0x10
    80008a52:	f6042783          	lw	a5,-160(s0)
    80008a56:	0107969b          	slliw	a3,a5,0x10
    80008a5a:	4106d69b          	sraiw	a3,a3,0x10
    80008a5e:	f6840793          	addi	a5,s0,-152
    80008a62:	863a                	mv	a2,a4
    80008a64:	458d                	li	a1,3
    80008a66:	853e                	mv	a0,a5
    80008a68:	00000097          	auipc	ra,0x0
    80008a6c:	a9c080e7          	jalr	-1380(ra) # 80008504 <create>
    80008a70:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008a74:	fe843783          	ld	a5,-24(s0)
    80008a78:	e799                	bnez	a5,80008a86 <sys_mknod+0x8a>
    end_op();
    80008a7a:	ffffe097          	auipc	ra,0xffffe
    80008a7e:	dea080e7          	jalr	-534(ra) # 80006864 <end_op>
    return -1;
    80008a82:	57fd                	li	a5,-1
    80008a84:	a821                	j	80008a9c <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008a86:	fe843503          	ld	a0,-24(s0)
    80008a8a:	ffffd097          	auipc	ra,0xffffd
    80008a8e:	eec080e7          	jalr	-276(ra) # 80005976 <iunlockput>
  end_op();
    80008a92:	ffffe097          	auipc	ra,0xffffe
    80008a96:	dd2080e7          	jalr	-558(ra) # 80006864 <end_op>
  return 0;
    80008a9a:	4781                	li	a5,0
}
    80008a9c:	853e                	mv	a0,a5
    80008a9e:	60ea                	ld	ra,152(sp)
    80008aa0:	644a                	ld	s0,144(sp)
    80008aa2:	610d                	addi	sp,sp,160
    80008aa4:	8082                	ret

0000000080008aa6 <sys_chdir>:

uint64
sys_chdir(void)
{
    80008aa6:	7135                	addi	sp,sp,-160
    80008aa8:	ed06                	sd	ra,152(sp)
    80008aaa:	e922                	sd	s0,144(sp)
    80008aac:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008aae:	ffffa097          	auipc	ra,0xffffa
    80008ab2:	3ca080e7          	jalr	970(ra) # 80002e78 <myproc>
    80008ab6:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    80008aba:	ffffe097          	auipc	ra,0xffffe
    80008abe:	ce8080e7          	jalr	-792(ra) # 800067a2 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008ac2:	f6040793          	addi	a5,s0,-160
    80008ac6:	08000613          	li	a2,128
    80008aca:	85be                	mv	a1,a5
    80008acc:	4501                	li	a0,0
    80008ace:	ffffc097          	auipc	ra,0xffffc
    80008ad2:	d0a080e7          	jalr	-758(ra) # 800047d8 <argstr>
    80008ad6:	87aa                	mv	a5,a0
    80008ad8:	0007ce63          	bltz	a5,80008af4 <sys_chdir+0x4e>
    80008adc:	f6040793          	addi	a5,s0,-160
    80008ae0:	853e                	mv	a0,a5
    80008ae2:	ffffe097          	auipc	ra,0xffffe
    80008ae6:	95c080e7          	jalr	-1700(ra) # 8000643e <namei>
    80008aea:	fea43023          	sd	a0,-32(s0)
    80008aee:	fe043783          	ld	a5,-32(s0)
    80008af2:	e799                	bnez	a5,80008b00 <sys_chdir+0x5a>
    end_op();
    80008af4:	ffffe097          	auipc	ra,0xffffe
    80008af8:	d70080e7          	jalr	-656(ra) # 80006864 <end_op>
    return -1;
    80008afc:	57fd                	li	a5,-1
    80008afe:	a0b5                	j	80008b6a <sys_chdir+0xc4>
  }
  ilock(ip);
    80008b00:	fe043503          	ld	a0,-32(s0)
    80008b04:	ffffd097          	auipc	ra,0xffffd
    80008b08:	c14080e7          	jalr	-1004(ra) # 80005718 <ilock>
  if(ip->type != T_DIR){
    80008b0c:	fe043783          	ld	a5,-32(s0)
    80008b10:	04479783          	lh	a5,68(a5)
    80008b14:	0007871b          	sext.w	a4,a5
    80008b18:	4785                	li	a5,1
    80008b1a:	00f70e63          	beq	a4,a5,80008b36 <sys_chdir+0x90>
    iunlockput(ip);
    80008b1e:	fe043503          	ld	a0,-32(s0)
    80008b22:	ffffd097          	auipc	ra,0xffffd
    80008b26:	e54080e7          	jalr	-428(ra) # 80005976 <iunlockput>
    end_op();
    80008b2a:	ffffe097          	auipc	ra,0xffffe
    80008b2e:	d3a080e7          	jalr	-710(ra) # 80006864 <end_op>
    return -1;
    80008b32:	57fd                	li	a5,-1
    80008b34:	a81d                	j	80008b6a <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008b36:	fe043503          	ld	a0,-32(s0)
    80008b3a:	ffffd097          	auipc	ra,0xffffd
    80008b3e:	d12080e7          	jalr	-750(ra) # 8000584c <iunlock>
  iput(p->cwd);
    80008b42:	fe843783          	ld	a5,-24(s0)
    80008b46:	1507b783          	ld	a5,336(a5)
    80008b4a:	853e                	mv	a0,a5
    80008b4c:	ffffd097          	auipc	ra,0xffffd
    80008b50:	d5a080e7          	jalr	-678(ra) # 800058a6 <iput>
  end_op();
    80008b54:	ffffe097          	auipc	ra,0xffffe
    80008b58:	d10080e7          	jalr	-752(ra) # 80006864 <end_op>
  p->cwd = ip;
    80008b5c:	fe843783          	ld	a5,-24(s0)
    80008b60:	fe043703          	ld	a4,-32(s0)
    80008b64:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008b68:	4781                	li	a5,0
}
    80008b6a:	853e                	mv	a0,a5
    80008b6c:	60ea                	ld	ra,152(sp)
    80008b6e:	644a                	ld	s0,144(sp)
    80008b70:	610d                	addi	sp,sp,160
    80008b72:	8082                	ret

0000000080008b74 <sys_exec>:

uint64
sys_exec(void)
{
    80008b74:	7161                	addi	sp,sp,-432
    80008b76:	f706                	sd	ra,424(sp)
    80008b78:	f322                	sd	s0,416(sp)
    80008b7a:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    80008b7c:	e6040793          	addi	a5,s0,-416
    80008b80:	85be                	mv	a1,a5
    80008b82:	4505                	li	a0,1
    80008b84:	ffffc097          	auipc	ra,0xffffc
    80008b88:	c22080e7          	jalr	-990(ra) # 800047a6 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    80008b8c:	f6840793          	addi	a5,s0,-152
    80008b90:	08000613          	li	a2,128
    80008b94:	85be                	mv	a1,a5
    80008b96:	4501                	li	a0,0
    80008b98:	ffffc097          	auipc	ra,0xffffc
    80008b9c:	c40080e7          	jalr	-960(ra) # 800047d8 <argstr>
    80008ba0:	87aa                	mv	a5,a0
    80008ba2:	0007d463          	bgez	a5,80008baa <sys_exec+0x36>
    return -1;
    80008ba6:	57fd                	li	a5,-1
    80008ba8:	a249                	j	80008d2a <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    80008baa:	e6840793          	addi	a5,s0,-408
    80008bae:	10000613          	li	a2,256
    80008bb2:	4581                	li	a1,0
    80008bb4:	853e                	mv	a0,a5
    80008bb6:	ffff9097          	auipc	ra,0xffff9
    80008bba:	986080e7          	jalr	-1658(ra) # 8000153c <memset>
  for(i=0;; i++){
    80008bbe:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    80008bc2:	fec42783          	lw	a5,-20(s0)
    80008bc6:	873e                	mv	a4,a5
    80008bc8:	47fd                	li	a5,31
    80008bca:	10e7e463          	bltu	a5,a4,80008cd2 <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008bce:	fec42783          	lw	a5,-20(s0)
    80008bd2:	00379713          	slli	a4,a5,0x3
    80008bd6:	e6043783          	ld	a5,-416(s0)
    80008bda:	97ba                	add	a5,a5,a4
    80008bdc:	e5840713          	addi	a4,s0,-424
    80008be0:	85ba                	mv	a1,a4
    80008be2:	853e                	mv	a0,a5
    80008be4:	ffffc097          	auipc	ra,0xffffc
    80008be8:	a1a080e7          	jalr	-1510(ra) # 800045fe <fetchaddr>
    80008bec:	87aa                	mv	a5,a0
    80008bee:	0e07c463          	bltz	a5,80008cd6 <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    80008bf2:	e5843783          	ld	a5,-424(s0)
    80008bf6:	eb95                	bnez	a5,80008c2a <sys_exec+0xb6>
      argv[i] = 0;
    80008bf8:	fec42783          	lw	a5,-20(s0)
    80008bfc:	078e                	slli	a5,a5,0x3
    80008bfe:	ff040713          	addi	a4,s0,-16
    80008c02:	97ba                	add	a5,a5,a4
    80008c04:	e607bc23          	sd	zero,-392(a5)
      break;
    80008c08:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008c0a:	e6840713          	addi	a4,s0,-408
    80008c0e:	f6840793          	addi	a5,s0,-152
    80008c12:	85ba                	mv	a1,a4
    80008c14:	853e                	mv	a0,a5
    80008c16:	fffff097          	auipc	ra,0xfffff
    80008c1a:	c1e080e7          	jalr	-994(ra) # 80007834 <exec>
    80008c1e:	87aa                	mv	a5,a0
    80008c20:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008c24:	fe042623          	sw	zero,-20(s0)
    80008c28:	a059                	j	80008cae <sys_exec+0x13a>
    argv[i] = kalloc();
    80008c2a:	ffff8097          	auipc	ra,0xffff8
    80008c2e:	5ac080e7          	jalr	1452(ra) # 800011d6 <kalloc>
    80008c32:	872a                	mv	a4,a0
    80008c34:	fec42783          	lw	a5,-20(s0)
    80008c38:	078e                	slli	a5,a5,0x3
    80008c3a:	ff040693          	addi	a3,s0,-16
    80008c3e:	97b6                	add	a5,a5,a3
    80008c40:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008c44:	fec42783          	lw	a5,-20(s0)
    80008c48:	078e                	slli	a5,a5,0x3
    80008c4a:	ff040713          	addi	a4,s0,-16
    80008c4e:	97ba                	add	a5,a5,a4
    80008c50:	e787b783          	ld	a5,-392(a5)
    80008c54:	c3d9                	beqz	a5,80008cda <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008c56:	e5843703          	ld	a4,-424(s0)
    80008c5a:	fec42783          	lw	a5,-20(s0)
    80008c5e:	078e                	slli	a5,a5,0x3
    80008c60:	ff040693          	addi	a3,s0,-16
    80008c64:	97b6                	add	a5,a5,a3
    80008c66:	e787b783          	ld	a5,-392(a5)
    80008c6a:	6605                	lui	a2,0x1
    80008c6c:	85be                	mv	a1,a5
    80008c6e:	853a                	mv	a0,a4
    80008c70:	ffffc097          	auipc	ra,0xffffc
    80008c74:	9fc080e7          	jalr	-1540(ra) # 8000466c <fetchstr>
    80008c78:	87aa                	mv	a5,a0
    80008c7a:	0607c263          	bltz	a5,80008cde <sys_exec+0x16a>
  for(i=0;; i++){
    80008c7e:	fec42783          	lw	a5,-20(s0)
    80008c82:	2785                	addiw	a5,a5,1
    80008c84:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008c88:	bf2d                	j	80008bc2 <sys_exec+0x4e>
    kfree(argv[i]);
    80008c8a:	fec42783          	lw	a5,-20(s0)
    80008c8e:	078e                	slli	a5,a5,0x3
    80008c90:	ff040713          	addi	a4,s0,-16
    80008c94:	97ba                	add	a5,a5,a4
    80008c96:	e787b783          	ld	a5,-392(a5)
    80008c9a:	853e                	mv	a0,a5
    80008c9c:	ffff8097          	auipc	ra,0xffff8
    80008ca0:	494080e7          	jalr	1172(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008ca4:	fec42783          	lw	a5,-20(s0)
    80008ca8:	2785                	addiw	a5,a5,1
    80008caa:	fef42623          	sw	a5,-20(s0)
    80008cae:	fec42783          	lw	a5,-20(s0)
    80008cb2:	873e                	mv	a4,a5
    80008cb4:	47fd                	li	a5,31
    80008cb6:	00e7eb63          	bltu	a5,a4,80008ccc <sys_exec+0x158>
    80008cba:	fec42783          	lw	a5,-20(s0)
    80008cbe:	078e                	slli	a5,a5,0x3
    80008cc0:	ff040713          	addi	a4,s0,-16
    80008cc4:	97ba                	add	a5,a5,a4
    80008cc6:	e787b783          	ld	a5,-392(a5)
    80008cca:	f3e1                	bnez	a5,80008c8a <sys_exec+0x116>

  return ret;
    80008ccc:	fe842783          	lw	a5,-24(s0)
    80008cd0:	a8a9                	j	80008d2a <sys_exec+0x1b6>
      goto bad;
    80008cd2:	0001                	nop
    80008cd4:	a031                	j	80008ce0 <sys_exec+0x16c>
      goto bad;
    80008cd6:	0001                	nop
    80008cd8:	a021                	j	80008ce0 <sys_exec+0x16c>
      goto bad;
    80008cda:	0001                	nop
    80008cdc:	a011                	j	80008ce0 <sys_exec+0x16c>
      goto bad;
    80008cde:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008ce0:	fe042623          	sw	zero,-20(s0)
    80008ce4:	a01d                	j	80008d0a <sys_exec+0x196>
    kfree(argv[i]);
    80008ce6:	fec42783          	lw	a5,-20(s0)
    80008cea:	078e                	slli	a5,a5,0x3
    80008cec:	ff040713          	addi	a4,s0,-16
    80008cf0:	97ba                	add	a5,a5,a4
    80008cf2:	e787b783          	ld	a5,-392(a5)
    80008cf6:	853e                	mv	a0,a5
    80008cf8:	ffff8097          	auipc	ra,0xffff8
    80008cfc:	438080e7          	jalr	1080(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008d00:	fec42783          	lw	a5,-20(s0)
    80008d04:	2785                	addiw	a5,a5,1
    80008d06:	fef42623          	sw	a5,-20(s0)
    80008d0a:	fec42783          	lw	a5,-20(s0)
    80008d0e:	873e                	mv	a4,a5
    80008d10:	47fd                	li	a5,31
    80008d12:	00e7eb63          	bltu	a5,a4,80008d28 <sys_exec+0x1b4>
    80008d16:	fec42783          	lw	a5,-20(s0)
    80008d1a:	078e                	slli	a5,a5,0x3
    80008d1c:	ff040713          	addi	a4,s0,-16
    80008d20:	97ba                	add	a5,a5,a4
    80008d22:	e787b783          	ld	a5,-392(a5)
    80008d26:	f3e1                	bnez	a5,80008ce6 <sys_exec+0x172>
  return -1;
    80008d28:	57fd                	li	a5,-1
}
    80008d2a:	853e                	mv	a0,a5
    80008d2c:	70ba                	ld	ra,424(sp)
    80008d2e:	741a                	ld	s0,416(sp)
    80008d30:	615d                	addi	sp,sp,432
    80008d32:	8082                	ret

0000000080008d34 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008d34:	7139                	addi	sp,sp,-64
    80008d36:	fc06                	sd	ra,56(sp)
    80008d38:	f822                	sd	s0,48(sp)
    80008d3a:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008d3c:	ffffa097          	auipc	ra,0xffffa
    80008d40:	13c080e7          	jalr	316(ra) # 80002e78 <myproc>
    80008d44:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008d48:	fe040793          	addi	a5,s0,-32
    80008d4c:	85be                	mv	a1,a5
    80008d4e:	4501                	li	a0,0
    80008d50:	ffffc097          	auipc	ra,0xffffc
    80008d54:	a56080e7          	jalr	-1450(ra) # 800047a6 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008d58:	fd040713          	addi	a4,s0,-48
    80008d5c:	fd840793          	addi	a5,s0,-40
    80008d60:	85ba                	mv	a1,a4
    80008d62:	853e                	mv	a0,a5
    80008d64:	ffffe097          	auipc	ra,0xffffe
    80008d68:	5ee080e7          	jalr	1518(ra) # 80007352 <pipealloc>
    80008d6c:	87aa                	mv	a5,a0
    80008d6e:	0007d463          	bgez	a5,80008d76 <sys_pipe+0x42>
    return -1;
    80008d72:	57fd                	li	a5,-1
    80008d74:	a219                	j	80008e7a <sys_pipe+0x146>
  fd0 = -1;
    80008d76:	57fd                	li	a5,-1
    80008d78:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008d7c:	fd843783          	ld	a5,-40(s0)
    80008d80:	853e                	mv	a0,a5
    80008d82:	fffff097          	auipc	ra,0xfffff
    80008d86:	0da080e7          	jalr	218(ra) # 80007e5c <fdalloc>
    80008d8a:	87aa                	mv	a5,a0
    80008d8c:	fcf42623          	sw	a5,-52(s0)
    80008d90:	fcc42783          	lw	a5,-52(s0)
    80008d94:	0207c063          	bltz	a5,80008db4 <sys_pipe+0x80>
    80008d98:	fd043783          	ld	a5,-48(s0)
    80008d9c:	853e                	mv	a0,a5
    80008d9e:	fffff097          	auipc	ra,0xfffff
    80008da2:	0be080e7          	jalr	190(ra) # 80007e5c <fdalloc>
    80008da6:	87aa                	mv	a5,a0
    80008da8:	fcf42423          	sw	a5,-56(s0)
    80008dac:	fc842783          	lw	a5,-56(s0)
    80008db0:	0207df63          	bgez	a5,80008dee <sys_pipe+0xba>
    if(fd0 >= 0)
    80008db4:	fcc42783          	lw	a5,-52(s0)
    80008db8:	0007cb63          	bltz	a5,80008dce <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    80008dbc:	fcc42783          	lw	a5,-52(s0)
    80008dc0:	fe843703          	ld	a4,-24(s0)
    80008dc4:	07e9                	addi	a5,a5,26
    80008dc6:	078e                	slli	a5,a5,0x3
    80008dc8:	97ba                	add	a5,a5,a4
    80008dca:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008dce:	fd843783          	ld	a5,-40(s0)
    80008dd2:	853e                	mv	a0,a5
    80008dd4:	ffffe097          	auipc	ra,0xffffe
    80008dd8:	068080e7          	jalr	104(ra) # 80006e3c <fileclose>
    fileclose(wf);
    80008ddc:	fd043783          	ld	a5,-48(s0)
    80008de0:	853e                	mv	a0,a5
    80008de2:	ffffe097          	auipc	ra,0xffffe
    80008de6:	05a080e7          	jalr	90(ra) # 80006e3c <fileclose>
    return -1;
    80008dea:	57fd                	li	a5,-1
    80008dec:	a079                	j	80008e7a <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008dee:	fe843783          	ld	a5,-24(s0)
    80008df2:	6bbc                	ld	a5,80(a5)
    80008df4:	fe043703          	ld	a4,-32(s0)
    80008df8:	fcc40613          	addi	a2,s0,-52
    80008dfc:	4691                	li	a3,4
    80008dfe:	85ba                	mv	a1,a4
    80008e00:	853e                	mv	a0,a5
    80008e02:	ffffa097          	auipc	ra,0xffffa
    80008e06:	b40080e7          	jalr	-1216(ra) # 80002942 <copyout>
    80008e0a:	87aa                	mv	a5,a0
    80008e0c:	0207c463          	bltz	a5,80008e34 <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008e10:	fe843783          	ld	a5,-24(s0)
    80008e14:	6bb8                	ld	a4,80(a5)
    80008e16:	fe043783          	ld	a5,-32(s0)
    80008e1a:	0791                	addi	a5,a5,4
    80008e1c:	fc840613          	addi	a2,s0,-56
    80008e20:	4691                	li	a3,4
    80008e22:	85be                	mv	a1,a5
    80008e24:	853a                	mv	a0,a4
    80008e26:	ffffa097          	auipc	ra,0xffffa
    80008e2a:	b1c080e7          	jalr	-1252(ra) # 80002942 <copyout>
    80008e2e:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008e30:	0407d463          	bgez	a5,80008e78 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008e34:	fcc42783          	lw	a5,-52(s0)
    80008e38:	fe843703          	ld	a4,-24(s0)
    80008e3c:	07e9                	addi	a5,a5,26
    80008e3e:	078e                	slli	a5,a5,0x3
    80008e40:	97ba                	add	a5,a5,a4
    80008e42:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008e46:	fc842783          	lw	a5,-56(s0)
    80008e4a:	fe843703          	ld	a4,-24(s0)
    80008e4e:	07e9                	addi	a5,a5,26
    80008e50:	078e                	slli	a5,a5,0x3
    80008e52:	97ba                	add	a5,a5,a4
    80008e54:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008e58:	fd843783          	ld	a5,-40(s0)
    80008e5c:	853e                	mv	a0,a5
    80008e5e:	ffffe097          	auipc	ra,0xffffe
    80008e62:	fde080e7          	jalr	-34(ra) # 80006e3c <fileclose>
    fileclose(wf);
    80008e66:	fd043783          	ld	a5,-48(s0)
    80008e6a:	853e                	mv	a0,a5
    80008e6c:	ffffe097          	auipc	ra,0xffffe
    80008e70:	fd0080e7          	jalr	-48(ra) # 80006e3c <fileclose>
    return -1;
    80008e74:	57fd                	li	a5,-1
    80008e76:	a011                	j	80008e7a <sys_pipe+0x146>
  }
  return 0;
    80008e78:	4781                	li	a5,0
}
    80008e7a:	853e                	mv	a0,a5
    80008e7c:	70e2                	ld	ra,56(sp)
    80008e7e:	7442                	ld	s0,48(sp)
    80008e80:	6121                	addi	sp,sp,64
    80008e82:	8082                	ret
	...

0000000080008e90 <kernelvec>:
    80008e90:	7111                	addi	sp,sp,-256
    80008e92:	e006                	sd	ra,0(sp)
    80008e94:	e40a                	sd	sp,8(sp)
    80008e96:	e80e                	sd	gp,16(sp)
    80008e98:	ec12                	sd	tp,24(sp)
    80008e9a:	f016                	sd	t0,32(sp)
    80008e9c:	f41a                	sd	t1,40(sp)
    80008e9e:	f81e                	sd	t2,48(sp)
    80008ea0:	fc22                	sd	s0,56(sp)
    80008ea2:	e0a6                	sd	s1,64(sp)
    80008ea4:	e4aa                	sd	a0,72(sp)
    80008ea6:	e8ae                	sd	a1,80(sp)
    80008ea8:	ecb2                	sd	a2,88(sp)
    80008eaa:	f0b6                	sd	a3,96(sp)
    80008eac:	f4ba                	sd	a4,104(sp)
    80008eae:	f8be                	sd	a5,112(sp)
    80008eb0:	fcc2                	sd	a6,120(sp)
    80008eb2:	e146                	sd	a7,128(sp)
    80008eb4:	e54a                	sd	s2,136(sp)
    80008eb6:	e94e                	sd	s3,144(sp)
    80008eb8:	ed52                	sd	s4,152(sp)
    80008eba:	f156                	sd	s5,160(sp)
    80008ebc:	f55a                	sd	s6,168(sp)
    80008ebe:	f95e                	sd	s7,176(sp)
    80008ec0:	fd62                	sd	s8,184(sp)
    80008ec2:	e1e6                	sd	s9,192(sp)
    80008ec4:	e5ea                	sd	s10,200(sp)
    80008ec6:	e9ee                	sd	s11,208(sp)
    80008ec8:	edf2                	sd	t3,216(sp)
    80008eca:	f1f6                	sd	t4,224(sp)
    80008ecc:	f5fa                	sd	t5,232(sp)
    80008ece:	f9fe                	sd	t6,240(sp)
    80008ed0:	c8afb0ef          	jal	ra,8000435a <kerneltrap>
    80008ed4:	6082                	ld	ra,0(sp)
    80008ed6:	6122                	ld	sp,8(sp)
    80008ed8:	61c2                	ld	gp,16(sp)
    80008eda:	7282                	ld	t0,32(sp)
    80008edc:	7322                	ld	t1,40(sp)
    80008ede:	73c2                	ld	t2,48(sp)
    80008ee0:	7462                	ld	s0,56(sp)
    80008ee2:	6486                	ld	s1,64(sp)
    80008ee4:	6526                	ld	a0,72(sp)
    80008ee6:	65c6                	ld	a1,80(sp)
    80008ee8:	6666                	ld	a2,88(sp)
    80008eea:	7686                	ld	a3,96(sp)
    80008eec:	7726                	ld	a4,104(sp)
    80008eee:	77c6                	ld	a5,112(sp)
    80008ef0:	7866                	ld	a6,120(sp)
    80008ef2:	688a                	ld	a7,128(sp)
    80008ef4:	692a                	ld	s2,136(sp)
    80008ef6:	69ca                	ld	s3,144(sp)
    80008ef8:	6a6a                	ld	s4,152(sp)
    80008efa:	7a8a                	ld	s5,160(sp)
    80008efc:	7b2a                	ld	s6,168(sp)
    80008efe:	7bca                	ld	s7,176(sp)
    80008f00:	7c6a                	ld	s8,184(sp)
    80008f02:	6c8e                	ld	s9,192(sp)
    80008f04:	6d2e                	ld	s10,200(sp)
    80008f06:	6dce                	ld	s11,208(sp)
    80008f08:	6e6e                	ld	t3,216(sp)
    80008f0a:	7e8e                	ld	t4,224(sp)
    80008f0c:	7f2e                	ld	t5,232(sp)
    80008f0e:	7fce                	ld	t6,240(sp)
    80008f10:	6111                	addi	sp,sp,256
    80008f12:	10200073          	sret
    80008f16:	00000013          	nop
    80008f1a:	00000013          	nop
    80008f1e:	0001                	nop

0000000080008f20 <timervec>:
    80008f20:	34051573          	csrrw	a0,mscratch,a0
    80008f24:	e10c                	sd	a1,0(a0)
    80008f26:	e510                	sd	a2,8(a0)
    80008f28:	e914                	sd	a3,16(a0)
    80008f2a:	6d0c                	ld	a1,24(a0)
    80008f2c:	7110                	ld	a2,32(a0)
    80008f2e:	6194                	ld	a3,0(a1)
    80008f30:	96b2                	add	a3,a3,a2
    80008f32:	e194                	sd	a3,0(a1)
    80008f34:	4589                	li	a1,2
    80008f36:	14459073          	csrw	sip,a1
    80008f3a:	6914                	ld	a3,16(a0)
    80008f3c:	6510                	ld	a2,8(a0)
    80008f3e:	610c                	ld	a1,0(a0)
    80008f40:	34051573          	csrrw	a0,mscratch,a0
    80008f44:	30200073          	mret
	...

0000000080008f4a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008f4a:	1141                	addi	sp,sp,-16
    80008f4c:	e422                	sd	s0,8(sp)
    80008f4e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008f50:	0c0007b7          	lui	a5,0xc000
    80008f54:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008f58:	4705                	li	a4,1
    80008f5a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008f5c:	0c0007b7          	lui	a5,0xc000
    80008f60:	0791                	addi	a5,a5,4
    80008f62:	4705                	li	a4,1
    80008f64:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008f66:	0c0007b7          	lui	a5,0xc000
    80008f6a:	07a1                	addi	a5,a5,8
    80008f6c:	4705                	li	a4,1
    80008f6e:	c398                	sw	a4,0(a5)
}
    80008f70:	0001                	nop
    80008f72:	6422                	ld	s0,8(sp)
    80008f74:	0141                	addi	sp,sp,16
    80008f76:	8082                	ret

0000000080008f78 <plicinithart>:

void
plicinithart(void)
{
    80008f78:	1101                	addi	sp,sp,-32
    80008f7a:	ec06                	sd	ra,24(sp)
    80008f7c:	e822                	sd	s0,16(sp)
    80008f7e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008f80:	ffffa097          	auipc	ra,0xffffa
    80008f84:	e9a080e7          	jalr	-358(ra) # 80002e1a <cpuid>
    80008f88:	87aa                	mv	a5,a0
    80008f8a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008f8e:	fec42783          	lw	a5,-20(s0)
    80008f92:	0087979b          	slliw	a5,a5,0x8
    80008f96:	2781                	sext.w	a5,a5
    80008f98:	873e                	mv	a4,a5
    80008f9a:	0c0027b7          	lui	a5,0xc002
    80008f9e:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008fa2:	97ba                	add	a5,a5,a4
    80008fa4:	873e                	mv	a4,a5
    80008fa6:	40600793          	li	a5,1030
    80008faa:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008fac:	fec42783          	lw	a5,-20(s0)
    80008fb0:	00d7979b          	slliw	a5,a5,0xd
    80008fb4:	2781                	sext.w	a5,a5
    80008fb6:	873e                	mv	a4,a5
    80008fb8:	0c2017b7          	lui	a5,0xc201
    80008fbc:	97ba                	add	a5,a5,a4
    80008fbe:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008fc2:	0001                	nop
    80008fc4:	60e2                	ld	ra,24(sp)
    80008fc6:	6442                	ld	s0,16(sp)
    80008fc8:	6105                	addi	sp,sp,32
    80008fca:	8082                	ret

0000000080008fcc <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008fcc:	1101                	addi	sp,sp,-32
    80008fce:	ec06                	sd	ra,24(sp)
    80008fd0:	e822                	sd	s0,16(sp)
    80008fd2:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008fd4:	ffffa097          	auipc	ra,0xffffa
    80008fd8:	e46080e7          	jalr	-442(ra) # 80002e1a <cpuid>
    80008fdc:	87aa                	mv	a5,a0
    80008fde:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008fe2:	fec42783          	lw	a5,-20(s0)
    80008fe6:	00d7979b          	slliw	a5,a5,0xd
    80008fea:	2781                	sext.w	a5,a5
    80008fec:	873e                	mv	a4,a5
    80008fee:	0c2017b7          	lui	a5,0xc201
    80008ff2:	0791                	addi	a5,a5,4
    80008ff4:	97ba                	add	a5,a5,a4
    80008ff6:	439c                	lw	a5,0(a5)
    80008ff8:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008ffc:	fe842783          	lw	a5,-24(s0)
}
    80009000:	853e                	mv	a0,a5
    80009002:	60e2                	ld	ra,24(sp)
    80009004:	6442                	ld	s0,16(sp)
    80009006:	6105                	addi	sp,sp,32
    80009008:	8082                	ret

000000008000900a <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    8000900a:	7179                	addi	sp,sp,-48
    8000900c:	f406                	sd	ra,40(sp)
    8000900e:	f022                	sd	s0,32(sp)
    80009010:	1800                	addi	s0,sp,48
    80009012:	87aa                	mv	a5,a0
    80009014:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80009018:	ffffa097          	auipc	ra,0xffffa
    8000901c:	e02080e7          	jalr	-510(ra) # 80002e1a <cpuid>
    80009020:	87aa                	mv	a5,a0
    80009022:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80009026:	fec42783          	lw	a5,-20(s0)
    8000902a:	00d7979b          	slliw	a5,a5,0xd
    8000902e:	2781                	sext.w	a5,a5
    80009030:	873e                	mv	a4,a5
    80009032:	0c2017b7          	lui	a5,0xc201
    80009036:	0791                	addi	a5,a5,4
    80009038:	97ba                	add	a5,a5,a4
    8000903a:	873e                	mv	a4,a5
    8000903c:	fdc42783          	lw	a5,-36(s0)
    80009040:	c31c                	sw	a5,0(a4)
}
    80009042:	0001                	nop
    80009044:	70a2                	ld	ra,40(sp)
    80009046:	7402                	ld	s0,32(sp)
    80009048:	6145                	addi	sp,sp,48
    8000904a:	8082                	ret

000000008000904c <r_sstatus>:
{
    8000904c:	1101                	addi	sp,sp,-32
    8000904e:	ec22                	sd	s0,24(sp)
    80009050:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80009052:	100027f3          	csrr	a5,sstatus
    80009056:	fef43423          	sd	a5,-24(s0)
  return x;
    8000905a:	fe843783          	ld	a5,-24(s0)
}
    8000905e:	853e                	mv	a0,a5
    80009060:	6462                	ld	s0,24(sp)
    80009062:	6105                	addi	sp,sp,32
    80009064:	8082                	ret

0000000080009066 <w_sstatus>:
{
    80009066:	1101                	addi	sp,sp,-32
    80009068:	ec22                	sd	s0,24(sp)
    8000906a:	1000                	addi	s0,sp,32
    8000906c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80009070:	fe843783          	ld	a5,-24(s0)
    80009074:	10079073          	csrw	sstatus,a5
}
    80009078:	0001                	nop
    8000907a:	6462                	ld	s0,24(sp)
    8000907c:	6105                	addi	sp,sp,32
    8000907e:	8082                	ret

0000000080009080 <intr_on>:
{
    80009080:	1141                	addi	sp,sp,-16
    80009082:	e406                	sd	ra,8(sp)
    80009084:	e022                	sd	s0,0(sp)
    80009086:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80009088:	00000097          	auipc	ra,0x0
    8000908c:	fc4080e7          	jalr	-60(ra) # 8000904c <r_sstatus>
    80009090:	87aa                	mv	a5,a0
    80009092:	0027e793          	ori	a5,a5,2
    80009096:	853e                	mv	a0,a5
    80009098:	00000097          	auipc	ra,0x0
    8000909c:	fce080e7          	jalr	-50(ra) # 80009066 <w_sstatus>
}
    800090a0:	0001                	nop
    800090a2:	60a2                	ld	ra,8(sp)
    800090a4:	6402                	ld	s0,0(sp)
    800090a6:	0141                	addi	sp,sp,16
    800090a8:	8082                	ret

00000000800090aa <intr_off>:
{
    800090aa:	1141                	addi	sp,sp,-16
    800090ac:	e406                	sd	ra,8(sp)
    800090ae:	e022                	sd	s0,0(sp)
    800090b0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800090b2:	00000097          	auipc	ra,0x0
    800090b6:	f9a080e7          	jalr	-102(ra) # 8000904c <r_sstatus>
    800090ba:	87aa                	mv	a5,a0
    800090bc:	9bf5                	andi	a5,a5,-3
    800090be:	853e                	mv	a0,a5
    800090c0:	00000097          	auipc	ra,0x0
    800090c4:	fa6080e7          	jalr	-90(ra) # 80009066 <w_sstatus>
}
    800090c8:	0001                	nop
    800090ca:	60a2                	ld	ra,8(sp)
    800090cc:	6402                	ld	s0,0(sp)
    800090ce:	0141                	addi	sp,sp,16
    800090d0:	8082                	ret

00000000800090d2 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    800090d2:	7139                	addi	sp,sp,-64
    800090d4:	fc06                	sd	ra,56(sp)
    800090d6:	f822                	sd	s0,48(sp)
    800090d8:	0080                	addi	s0,sp,64
    800090da:	87aa                	mv	a5,a0
    800090dc:	fcb43023          	sd	a1,-64(s0)
    800090e0:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    800090e4:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    800090e8:	fcc42703          	lw	a4,-52(s0)
    800090ec:	15000793          	li	a5,336
    800090f0:	02f707b3          	mul	a5,a4,a5
    800090f4:	13078713          	addi	a4,a5,304 # c201130 <_entry-0x73dfeed0>
    800090f8:	00035797          	auipc	a5,0x35
    800090fc:	b9078793          	addi	a5,a5,-1136 # 8003dc88 <disk>
    80009100:	97ba                	add	a5,a5,a4
    80009102:	fc043583          	ld	a1,-64(s0)
    80009106:	853e                	mv	a0,a5
    80009108:	ffff8097          	auipc	ra,0xffff8
    8000910c:	230080e7          	jalr	560(ra) # 80001338 <initlock>
  disk[id].name = name;
    80009110:	00035717          	auipc	a4,0x35
    80009114:	b7870713          	addi	a4,a4,-1160 # 8003dc88 <disk>
    80009118:	fcc42683          	lw	a3,-52(s0)
    8000911c:	15000793          	li	a5,336
    80009120:	02f687b3          	mul	a5,a3,a5
    80009124:	97ba                	add	a5,a5,a4
    80009126:	fc043703          	ld	a4,-64(s0)
    8000912a:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    8000912c:	fcc42703          	lw	a4,-52(s0)
    80009130:	67c1                	lui	a5,0x10
    80009132:	0785                	addi	a5,a5,1
    80009134:	97ba                	add	a5,a5,a4
    80009136:	07b2                	slli	a5,a5,0xc
    80009138:	439c                	lw	a5,0(a5)
    8000913a:	2781                	sext.w	a5,a5
    8000913c:	873e                	mv	a4,a5
    8000913e:	747277b7          	lui	a5,0x74727
    80009142:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80009146:	04f71c63          	bne	a4,a5,8000919e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    8000914a:	fcc42703          	lw	a4,-52(s0)
    8000914e:	67c1                	lui	a5,0x10
    80009150:	0785                	addi	a5,a5,1
    80009152:	97ba                	add	a5,a5,a4
    80009154:	07b2                	slli	a5,a5,0xc
    80009156:	0791                	addi	a5,a5,4
    80009158:	439c                	lw	a5,0(a5)
    8000915a:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    8000915c:	873e                	mv	a4,a5
    8000915e:	4789                	li	a5,2
    80009160:	02f71f63          	bne	a4,a5,8000919e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80009164:	fcc42703          	lw	a4,-52(s0)
    80009168:	67c1                	lui	a5,0x10
    8000916a:	0785                	addi	a5,a5,1
    8000916c:	97ba                	add	a5,a5,a4
    8000916e:	07b2                	slli	a5,a5,0xc
    80009170:	07a1                	addi	a5,a5,8
    80009172:	439c                	lw	a5,0(a5)
    80009174:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80009176:	873e                	mv	a4,a5
    80009178:	4789                	li	a5,2
    8000917a:	02f71263          	bne	a4,a5,8000919e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    8000917e:	fcc42703          	lw	a4,-52(s0)
    80009182:	67c1                	lui	a5,0x10
    80009184:	0785                	addi	a5,a5,1
    80009186:	97ba                	add	a5,a5,a4
    80009188:	07b2                	slli	a5,a5,0xc
    8000918a:	07b1                	addi	a5,a5,12
    8000918c:	439c                	lw	a5,0(a5)
    8000918e:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80009190:	873e                	mv	a4,a5
    80009192:	554d47b7          	lui	a5,0x554d4
    80009196:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    8000919a:	00f70d63          	beq	a4,a5,800091b4 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    8000919e:	fc043603          	ld	a2,-64(s0)
    800091a2:	00003597          	auipc	a1,0x3
    800091a6:	4ce58593          	addi	a1,a1,1230 # 8000c670 <etext+0x670>
    800091aa:	4509                	li	a0,2
    800091ac:	ffff8097          	auipc	ra,0xffff8
    800091b0:	b32080e7          	jalr	-1230(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    800091b4:	fcc42703          	lw	a4,-52(s0)
    800091b8:	67c1                	lui	a5,0x10
    800091ba:	0785                	addi	a5,a5,1
    800091bc:	97ba                	add	a5,a5,a4
    800091be:	07b2                	slli	a5,a5,0xc
    800091c0:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800091c4:	873e                	mv	a4,a5
    800091c6:	fe842783          	lw	a5,-24(s0)
    800091ca:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    800091cc:	fe842783          	lw	a5,-24(s0)
    800091d0:	0017e793          	ori	a5,a5,1
    800091d4:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    800091d8:	fcc42703          	lw	a4,-52(s0)
    800091dc:	67c1                	lui	a5,0x10
    800091de:	0785                	addi	a5,a5,1
    800091e0:	97ba                	add	a5,a5,a4
    800091e2:	07b2                	slli	a5,a5,0xc
    800091e4:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800091e8:	873e                	mv	a4,a5
    800091ea:	fe842783          	lw	a5,-24(s0)
    800091ee:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    800091f0:	fe842783          	lw	a5,-24(s0)
    800091f4:	0027e793          	ori	a5,a5,2
    800091f8:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    800091fc:	fcc42703          	lw	a4,-52(s0)
    80009200:	67c1                	lui	a5,0x10
    80009202:	0785                	addi	a5,a5,1
    80009204:	97ba                	add	a5,a5,a4
    80009206:	07b2                	slli	a5,a5,0xc
    80009208:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    8000920c:	873e                	mv	a4,a5
    8000920e:	fe842783          	lw	a5,-24(s0)
    80009212:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80009214:	fcc42703          	lw	a4,-52(s0)
    80009218:	67c1                	lui	a5,0x10
    8000921a:	0785                	addi	a5,a5,1
    8000921c:	97ba                	add	a5,a5,a4
    8000921e:	07b2                	slli	a5,a5,0xc
    80009220:	07c1                	addi	a5,a5,16
    80009222:	439c                	lw	a5,0(a5)
    80009224:	2781                	sext.w	a5,a5
    80009226:	1782                	slli	a5,a5,0x20
    80009228:	9381                	srli	a5,a5,0x20
    8000922a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    8000922e:	fe043783          	ld	a5,-32(s0)
    80009232:	fdf7f793          	andi	a5,a5,-33
    80009236:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    8000923a:	fe043783          	ld	a5,-32(s0)
    8000923e:	f7f7f793          	andi	a5,a5,-129
    80009242:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80009246:	fe043703          	ld	a4,-32(s0)
    8000924a:	77fd                	lui	a5,0xfffff
    8000924c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffc18cf>
    80009250:	8ff9                	and	a5,a5,a4
    80009252:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80009256:	fe043703          	ld	a4,-32(s0)
    8000925a:	77fd                	lui	a5,0xfffff
    8000925c:	17fd                	addi	a5,a5,-1
    8000925e:	8ff9                	and	a5,a5,a4
    80009260:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80009264:	fe043703          	ld	a4,-32(s0)
    80009268:	f80007b7          	lui	a5,0xf8000
    8000926c:	17fd                	addi	a5,a5,-1
    8000926e:	8ff9                	and	a5,a5,a4
    80009270:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80009274:	fe043703          	ld	a4,-32(s0)
    80009278:	e00007b7          	lui	a5,0xe0000
    8000927c:	17fd                	addi	a5,a5,-1
    8000927e:	8ff9                	and	a5,a5,a4
    80009280:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80009284:	fe043703          	ld	a4,-32(s0)
    80009288:	f00007b7          	lui	a5,0xf0000
    8000928c:	17fd                	addi	a5,a5,-1
    8000928e:	8ff9                	and	a5,a5,a4
    80009290:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80009294:	fcc42703          	lw	a4,-52(s0)
    80009298:	67c1                	lui	a5,0x10
    8000929a:	0785                	addi	a5,a5,1
    8000929c:	97ba                	add	a5,a5,a4
    8000929e:	07b2                	slli	a5,a5,0xc
    800092a0:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    800092a4:	873e                	mv	a4,a5
    800092a6:	fe043783          	ld	a5,-32(s0)
    800092aa:	2781                	sext.w	a5,a5
    800092ac:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    800092ae:	fe842783          	lw	a5,-24(s0)
    800092b2:	0087e793          	ori	a5,a5,8
    800092b6:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    800092ba:	fcc42703          	lw	a4,-52(s0)
    800092be:	67c1                	lui	a5,0x10
    800092c0:	0785                	addi	a5,a5,1
    800092c2:	97ba                	add	a5,a5,a4
    800092c4:	07b2                	slli	a5,a5,0xc
    800092c6:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800092ca:	873e                	mv	a4,a5
    800092cc:	fe842783          	lw	a5,-24(s0)
    800092d0:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    800092d2:	fcc42703          	lw	a4,-52(s0)
    800092d6:	67c1                	lui	a5,0x10
    800092d8:	0785                	addi	a5,a5,1
    800092da:	97ba                	add	a5,a5,a4
    800092dc:	07b2                	slli	a5,a5,0xc
    800092de:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800092e2:	439c                	lw	a5,0(a5)
    800092e4:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    800092e8:	fe842783          	lw	a5,-24(s0)
    800092ec:	8ba1                	andi	a5,a5,8
    800092ee:	2781                	sext.w	a5,a5
    800092f0:	ef81                	bnez	a5,80009308 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    800092f2:	00003617          	auipc	a2,0x3
    800092f6:	39e60613          	addi	a2,a2,926 # 8000c690 <etext+0x690>
    800092fa:	fc043583          	ld	a1,-64(s0)
    800092fe:	4509                	li	a0,2
    80009300:	ffff8097          	auipc	ra,0xffff8
    80009304:	9de080e7          	jalr	-1570(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    80009308:	fcc42703          	lw	a4,-52(s0)
    8000930c:	67c1                	lui	a5,0x10
    8000930e:	0785                	addi	a5,a5,1
    80009310:	97ba                	add	a5,a5,a4
    80009312:	07b2                	slli	a5,a5,0xc
    80009314:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    80009318:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    8000931c:	fcc42703          	lw	a4,-52(s0)
    80009320:	67c1                	lui	a5,0x10
    80009322:	0785                	addi	a5,a5,1
    80009324:	97ba                	add	a5,a5,a4
    80009326:	07b2                	slli	a5,a5,0xc
    80009328:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    8000932c:	439c                	lw	a5,0(a5)
    8000932e:	2781                	sext.w	a5,a5
    80009330:	cf81                	beqz	a5,80009348 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    80009332:	00003617          	auipc	a2,0x3
    80009336:	37e60613          	addi	a2,a2,894 # 8000c6b0 <etext+0x6b0>
    8000933a:	fc043583          	ld	a1,-64(s0)
    8000933e:	4509                	li	a0,2
    80009340:	ffff8097          	auipc	ra,0xffff8
    80009344:	99e080e7          	jalr	-1634(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    80009348:	fcc42703          	lw	a4,-52(s0)
    8000934c:	67c1                	lui	a5,0x10
    8000934e:	0785                	addi	a5,a5,1
    80009350:	97ba                	add	a5,a5,a4
    80009352:	07b2                	slli	a5,a5,0xc
    80009354:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80009358:	439c                	lw	a5,0(a5)
    8000935a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    8000935e:	fdc42783          	lw	a5,-36(s0)
    80009362:	2781                	sext.w	a5,a5
    80009364:	ef81                	bnez	a5,8000937c <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    80009366:	00003617          	auipc	a2,0x3
    8000936a:	37260613          	addi	a2,a2,882 # 8000c6d8 <etext+0x6d8>
    8000936e:	fc043583          	ld	a1,-64(s0)
    80009372:	4509                	li	a0,2
    80009374:	ffff8097          	auipc	ra,0xffff8
    80009378:	96a080e7          	jalr	-1686(ra) # 80000cde <panic_concat>
  if(max < NUM)
    8000937c:	fdc42783          	lw	a5,-36(s0)
    80009380:	0007871b          	sext.w	a4,a5
    80009384:	479d                	li	a5,7
    80009386:	00e7ed63          	bltu	a5,a4,800093a0 <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    8000938a:	00003617          	auipc	a2,0x3
    8000938e:	36e60613          	addi	a2,a2,878 # 8000c6f8 <etext+0x6f8>
    80009392:	fc043583          	ld	a1,-64(s0)
    80009396:	4509                	li	a0,2
    80009398:	ffff8097          	auipc	ra,0xffff8
    8000939c:	946080e7          	jalr	-1722(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    800093a0:	ffff8097          	auipc	ra,0xffff8
    800093a4:	e36080e7          	jalr	-458(ra) # 800011d6 <kalloc>
    800093a8:	862a                	mv	a2,a0
    800093aa:	00035717          	auipc	a4,0x35
    800093ae:	8de70713          	addi	a4,a4,-1826 # 8003dc88 <disk>
    800093b2:	fcc42683          	lw	a3,-52(s0)
    800093b6:	15000793          	li	a5,336
    800093ba:	02f687b3          	mul	a5,a3,a5
    800093be:	97ba                	add	a5,a5,a4
    800093c0:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    800093c2:	ffff8097          	auipc	ra,0xffff8
    800093c6:	e14080e7          	jalr	-492(ra) # 800011d6 <kalloc>
    800093ca:	862a                	mv	a2,a0
    800093cc:	00035717          	auipc	a4,0x35
    800093d0:	8bc70713          	addi	a4,a4,-1860 # 8003dc88 <disk>
    800093d4:	fcc42683          	lw	a3,-52(s0)
    800093d8:	15000793          	li	a5,336
    800093dc:	02f687b3          	mul	a5,a3,a5
    800093e0:	97ba                	add	a5,a5,a4
    800093e2:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    800093e4:	ffff8097          	auipc	ra,0xffff8
    800093e8:	df2080e7          	jalr	-526(ra) # 800011d6 <kalloc>
    800093ec:	862a                	mv	a2,a0
    800093ee:	00035717          	auipc	a4,0x35
    800093f2:	89a70713          	addi	a4,a4,-1894 # 8003dc88 <disk>
    800093f6:	fcc42683          	lw	a3,-52(s0)
    800093fa:	15000793          	li	a5,336
    800093fe:	02f687b3          	mul	a5,a3,a5
    80009402:	97ba                	add	a5,a5,a4
    80009404:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    80009406:	00035717          	auipc	a4,0x35
    8000940a:	88270713          	addi	a4,a4,-1918 # 8003dc88 <disk>
    8000940e:	fcc42683          	lw	a3,-52(s0)
    80009412:	15000793          	li	a5,336
    80009416:	02f687b3          	mul	a5,a3,a5
    8000941a:	97ba                	add	a5,a5,a4
    8000941c:	679c                	ld	a5,8(a5)
    8000941e:	cb9d                	beqz	a5,80009454 <virtio_disk_init+0x382>
    80009420:	00035717          	auipc	a4,0x35
    80009424:	86870713          	addi	a4,a4,-1944 # 8003dc88 <disk>
    80009428:	fcc42683          	lw	a3,-52(s0)
    8000942c:	15000793          	li	a5,336
    80009430:	02f687b3          	mul	a5,a3,a5
    80009434:	97ba                	add	a5,a5,a4
    80009436:	6b9c                	ld	a5,16(a5)
    80009438:	cf91                	beqz	a5,80009454 <virtio_disk_init+0x382>
    8000943a:	00035717          	auipc	a4,0x35
    8000943e:	84e70713          	addi	a4,a4,-1970 # 8003dc88 <disk>
    80009442:	fcc42683          	lw	a3,-52(s0)
    80009446:	15000793          	li	a5,336
    8000944a:	02f687b3          	mul	a5,a3,a5
    8000944e:	97ba                	add	a5,a5,a4
    80009450:	6f9c                	ld	a5,24(a5)
    80009452:	ef81                	bnez	a5,8000946a <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80009454:	00003617          	auipc	a2,0x3
    80009458:	2cc60613          	addi	a2,a2,716 # 8000c720 <etext+0x720>
    8000945c:	fc043583          	ld	a1,-64(s0)
    80009460:	4509                	li	a0,2
    80009462:	ffff8097          	auipc	ra,0xffff8
    80009466:	87c080e7          	jalr	-1924(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    8000946a:	00035717          	auipc	a4,0x35
    8000946e:	81e70713          	addi	a4,a4,-2018 # 8003dc88 <disk>
    80009472:	fcc42683          	lw	a3,-52(s0)
    80009476:	15000793          	li	a5,336
    8000947a:	02f687b3          	mul	a5,a3,a5
    8000947e:	97ba                	add	a5,a5,a4
    80009480:	679c                	ld	a5,8(a5)
    80009482:	6605                	lui	a2,0x1
    80009484:	4581                	li	a1,0
    80009486:	853e                	mv	a0,a5
    80009488:	ffff8097          	auipc	ra,0xffff8
    8000948c:	0b4080e7          	jalr	180(ra) # 8000153c <memset>
  memset(disk[id].avail, 0, PGSIZE);
    80009490:	00034717          	auipc	a4,0x34
    80009494:	7f870713          	addi	a4,a4,2040 # 8003dc88 <disk>
    80009498:	fcc42683          	lw	a3,-52(s0)
    8000949c:	15000793          	li	a5,336
    800094a0:	02f687b3          	mul	a5,a3,a5
    800094a4:	97ba                	add	a5,a5,a4
    800094a6:	6b9c                	ld	a5,16(a5)
    800094a8:	6605                	lui	a2,0x1
    800094aa:	4581                	li	a1,0
    800094ac:	853e                	mv	a0,a5
    800094ae:	ffff8097          	auipc	ra,0xffff8
    800094b2:	08e080e7          	jalr	142(ra) # 8000153c <memset>
  memset(disk[id].used, 0, PGSIZE);
    800094b6:	00034717          	auipc	a4,0x34
    800094ba:	7d270713          	addi	a4,a4,2002 # 8003dc88 <disk>
    800094be:	fcc42683          	lw	a3,-52(s0)
    800094c2:	15000793          	li	a5,336
    800094c6:	02f687b3          	mul	a5,a3,a5
    800094ca:	97ba                	add	a5,a5,a4
    800094cc:	6f9c                	ld	a5,24(a5)
    800094ce:	6605                	lui	a2,0x1
    800094d0:	4581                	li	a1,0
    800094d2:	853e                	mv	a0,a5
    800094d4:	ffff8097          	auipc	ra,0xffff8
    800094d8:	068080e7          	jalr	104(ra) # 8000153c <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    800094dc:	fcc42703          	lw	a4,-52(s0)
    800094e0:	67c1                	lui	a5,0x10
    800094e2:	0785                	addi	a5,a5,1
    800094e4:	97ba                	add	a5,a5,a4
    800094e6:	07b2                	slli	a5,a5,0xc
    800094e8:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    800094ec:	873e                	mv	a4,a5
    800094ee:	47a1                	li	a5,8
    800094f0:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    800094f2:	00034717          	auipc	a4,0x34
    800094f6:	79670713          	addi	a4,a4,1942 # 8003dc88 <disk>
    800094fa:	fcc42683          	lw	a3,-52(s0)
    800094fe:	15000793          	li	a5,336
    80009502:	02f687b3          	mul	a5,a3,a5
    80009506:	97ba                	add	a5,a5,a4
    80009508:	679c                	ld	a5,8(a5)
    8000950a:	86be                	mv	a3,a5
    8000950c:	fcc42703          	lw	a4,-52(s0)
    80009510:	67c1                	lui	a5,0x10
    80009512:	0785                	addi	a5,a5,1
    80009514:	97ba                	add	a5,a5,a4
    80009516:	07b2                	slli	a5,a5,0xc
    80009518:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    8000951c:	873e                	mv	a4,a5
    8000951e:	0006879b          	sext.w	a5,a3
    80009522:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    80009524:	00034717          	auipc	a4,0x34
    80009528:	76470713          	addi	a4,a4,1892 # 8003dc88 <disk>
    8000952c:	fcc42683          	lw	a3,-52(s0)
    80009530:	15000793          	li	a5,336
    80009534:	02f687b3          	mul	a5,a3,a5
    80009538:	97ba                	add	a5,a5,a4
    8000953a:	679c                	ld	a5,8(a5)
    8000953c:	0207d693          	srli	a3,a5,0x20
    80009540:	fcc42703          	lw	a4,-52(s0)
    80009544:	67c1                	lui	a5,0x10
    80009546:	0785                	addi	a5,a5,1
    80009548:	97ba                	add	a5,a5,a4
    8000954a:	07b2                	slli	a5,a5,0xc
    8000954c:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    80009550:	873e                	mv	a4,a5
    80009552:	0006879b          	sext.w	a5,a3
    80009556:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009558:	00034717          	auipc	a4,0x34
    8000955c:	73070713          	addi	a4,a4,1840 # 8003dc88 <disk>
    80009560:	fcc42683          	lw	a3,-52(s0)
    80009564:	15000793          	li	a5,336
    80009568:	02f687b3          	mul	a5,a3,a5
    8000956c:	97ba                	add	a5,a5,a4
    8000956e:	6b9c                	ld	a5,16(a5)
    80009570:	86be                	mv	a3,a5
    80009572:	fcc42703          	lw	a4,-52(s0)
    80009576:	67c1                	lui	a5,0x10
    80009578:	0785                	addi	a5,a5,1
    8000957a:	97ba                	add	a5,a5,a4
    8000957c:	07b2                	slli	a5,a5,0xc
    8000957e:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    80009582:	873e                	mv	a4,a5
    80009584:	0006879b          	sext.w	a5,a3
    80009588:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    8000958a:	00034717          	auipc	a4,0x34
    8000958e:	6fe70713          	addi	a4,a4,1790 # 8003dc88 <disk>
    80009592:	fcc42683          	lw	a3,-52(s0)
    80009596:	15000793          	li	a5,336
    8000959a:	02f687b3          	mul	a5,a3,a5
    8000959e:	97ba                	add	a5,a5,a4
    800095a0:	6b9c                	ld	a5,16(a5)
    800095a2:	0207d693          	srli	a3,a5,0x20
    800095a6:	fcc42703          	lw	a4,-52(s0)
    800095aa:	67c1                	lui	a5,0x10
    800095ac:	0785                	addi	a5,a5,1
    800095ae:	97ba                	add	a5,a5,a4
    800095b0:	07b2                	slli	a5,a5,0xc
    800095b2:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    800095b6:	873e                	mv	a4,a5
    800095b8:	0006879b          	sext.w	a5,a3
    800095bc:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    800095be:	00034717          	auipc	a4,0x34
    800095c2:	6ca70713          	addi	a4,a4,1738 # 8003dc88 <disk>
    800095c6:	fcc42683          	lw	a3,-52(s0)
    800095ca:	15000793          	li	a5,336
    800095ce:	02f687b3          	mul	a5,a3,a5
    800095d2:	97ba                	add	a5,a5,a4
    800095d4:	6f9c                	ld	a5,24(a5)
    800095d6:	86be                	mv	a3,a5
    800095d8:	fcc42703          	lw	a4,-52(s0)
    800095dc:	67c1                	lui	a5,0x10
    800095de:	0785                	addi	a5,a5,1
    800095e0:	97ba                	add	a5,a5,a4
    800095e2:	07b2                	slli	a5,a5,0xc
    800095e4:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    800095e8:	873e                	mv	a4,a5
    800095ea:	0006879b          	sext.w	a5,a3
    800095ee:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    800095f0:	00034717          	auipc	a4,0x34
    800095f4:	69870713          	addi	a4,a4,1688 # 8003dc88 <disk>
    800095f8:	fcc42683          	lw	a3,-52(s0)
    800095fc:	15000793          	li	a5,336
    80009600:	02f687b3          	mul	a5,a3,a5
    80009604:	97ba                	add	a5,a5,a4
    80009606:	6f9c                	ld	a5,24(a5)
    80009608:	0207d693          	srli	a3,a5,0x20
    8000960c:	fcc42703          	lw	a4,-52(s0)
    80009610:	67c1                	lui	a5,0x10
    80009612:	0785                	addi	a5,a5,1
    80009614:	97ba                	add	a5,a5,a4
    80009616:	07b2                	slli	a5,a5,0xc
    80009618:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    8000961c:	873e                	mv	a4,a5
    8000961e:	0006879b          	sext.w	a5,a3
    80009622:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80009624:	fcc42703          	lw	a4,-52(s0)
    80009628:	67c1                	lui	a5,0x10
    8000962a:	0785                	addi	a5,a5,1
    8000962c:	97ba                	add	a5,a5,a4
    8000962e:	07b2                	slli	a5,a5,0xc
    80009630:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80009634:	873e                	mv	a4,a5
    80009636:	4785                	li	a5,1
    80009638:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000963a:	fe042623          	sw	zero,-20(s0)
    8000963e:	a03d                	j	8000966c <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    80009640:	00034697          	auipc	a3,0x34
    80009644:	64868693          	addi	a3,a3,1608 # 8003dc88 <disk>
    80009648:	fec42703          	lw	a4,-20(s0)
    8000964c:	fcc42603          	lw	a2,-52(s0)
    80009650:	15000793          	li	a5,336
    80009654:	02f607b3          	mul	a5,a2,a5
    80009658:	97b6                	add	a5,a5,a3
    8000965a:	97ba                	add	a5,a5,a4
    8000965c:	4705                	li	a4,1
    8000965e:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    80009662:	fec42783          	lw	a5,-20(s0)
    80009666:	2785                	addiw	a5,a5,1
    80009668:	fef42623          	sw	a5,-20(s0)
    8000966c:	fec42783          	lw	a5,-20(s0)
    80009670:	0007871b          	sext.w	a4,a5
    80009674:	479d                	li	a5,7
    80009676:	fce7d5e3          	bge	a5,a4,80009640 <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000967a:	fe842783          	lw	a5,-24(s0)
    8000967e:	0047e793          	ori	a5,a5,4
    80009682:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009686:	fcc42703          	lw	a4,-52(s0)
    8000968a:	67c1                	lui	a5,0x10
    8000968c:	0785                	addi	a5,a5,1
    8000968e:	97ba                	add	a5,a5,a4
    80009690:	07b2                	slli	a5,a5,0xc
    80009692:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009696:	873e                	mv	a4,a5
    80009698:	fe842783          	lw	a5,-24(s0)
    8000969c:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    8000969e:	fcc42783          	lw	a5,-52(s0)
    800096a2:	0007871b          	sext.w	a4,a5
    800096a6:	4785                	li	a5,1
    800096a8:	06f71663          	bne	a4,a5,80009714 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    800096ac:	ffff8097          	auipc	ra,0xffff8
    800096b0:	b2a080e7          	jalr	-1238(ra) # 800011d6 <kalloc>
    800096b4:	872a                	mv	a4,a0
    800096b6:	00035797          	auipc	a5,0x35
    800096ba:	87278793          	addi	a5,a5,-1934 # 8003df28 <swap_buffer>
    800096be:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    800096c0:	00035797          	auipc	a5,0x35
    800096c4:	86878793          	addi	a5,a5,-1944 # 8003df28 <swap_buffer>
    800096c8:	639c                	ld	a5,0(a5)
    800096ca:	eb89                	bnez	a5,800096dc <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    800096cc:	00003517          	auipc	a0,0x3
    800096d0:	06c50513          	addi	a0,a0,108 # 8000c738 <etext+0x738>
    800096d4:	ffff7097          	auipc	ra,0xffff7
    800096d8:	5b8080e7          	jalr	1464(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    800096dc:	00035797          	auipc	a5,0x35
    800096e0:	84c78793          	addi	a5,a5,-1972 # 8003df28 <swap_buffer>
    800096e4:	639c                	ld	a5,0(a5)
    800096e6:	40000613          	li	a2,1024
    800096ea:	4581                	li	a1,0
    800096ec:	853e                	mv	a0,a5
    800096ee:	ffff8097          	auipc	ra,0xffff8
    800096f2:	e4e080e7          	jalr	-434(ra) # 8000153c <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    800096f6:	00035797          	auipc	a5,0x35
    800096fa:	83278793          	addi	a5,a5,-1998 # 8003df28 <swap_buffer>
    800096fe:	639c                	ld	a5,0(a5)
    80009700:	07c1                	addi	a5,a5,16
    80009702:	00003597          	auipc	a1,0x3
    80009706:	06658593          	addi	a1,a1,102 # 8000c768 <etext+0x768>
    8000970a:	853e                	mv	a0,a5
    8000970c:	ffffd097          	auipc	ra,0xffffd
    80009710:	4a8080e7          	jalr	1192(ra) # 80006bb4 <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    80009714:	0001                	nop
    80009716:	70e2                	ld	ra,56(sp)
    80009718:	7442                	ld	s0,48(sp)
    8000971a:	6121                	addi	sp,sp,64
    8000971c:	8082                	ret

000000008000971e <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    8000971e:	7179                	addi	sp,sp,-48
    80009720:	f422                	sd	s0,40(sp)
    80009722:	1800                	addi	s0,sp,48
    80009724:	87aa                	mv	a5,a0
    80009726:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    8000972a:	fe042623          	sw	zero,-20(s0)
    8000972e:	a891                	j	80009782 <alloc_desc+0x64>
    if(disk[id].free[i]){
    80009730:	00034697          	auipc	a3,0x34
    80009734:	55868693          	addi	a3,a3,1368 # 8003dc88 <disk>
    80009738:	fec42703          	lw	a4,-20(s0)
    8000973c:	fdc42603          	lw	a2,-36(s0)
    80009740:	15000793          	li	a5,336
    80009744:	02f607b3          	mul	a5,a2,a5
    80009748:	97b6                	add	a5,a5,a3
    8000974a:	97ba                	add	a5,a5,a4
    8000974c:	0207c783          	lbu	a5,32(a5)
    80009750:	c785                	beqz	a5,80009778 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009752:	00034697          	auipc	a3,0x34
    80009756:	53668693          	addi	a3,a3,1334 # 8003dc88 <disk>
    8000975a:	fec42703          	lw	a4,-20(s0)
    8000975e:	fdc42603          	lw	a2,-36(s0)
    80009762:	15000793          	li	a5,336
    80009766:	02f607b3          	mul	a5,a2,a5
    8000976a:	97b6                	add	a5,a5,a3
    8000976c:	97ba                	add	a5,a5,a4
    8000976e:	02078023          	sb	zero,32(a5)
      return i;
    80009772:	fec42783          	lw	a5,-20(s0)
    80009776:	a831                	j	80009792 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    80009778:	fec42783          	lw	a5,-20(s0)
    8000977c:	2785                	addiw	a5,a5,1
    8000977e:	fef42623          	sw	a5,-20(s0)
    80009782:	fec42783          	lw	a5,-20(s0)
    80009786:	0007871b          	sext.w	a4,a5
    8000978a:	479d                	li	a5,7
    8000978c:	fae7d2e3          	bge	a5,a4,80009730 <alloc_desc+0x12>
    }
  }
  return -1;
    80009790:	57fd                	li	a5,-1
}
    80009792:	853e                	mv	a0,a5
    80009794:	7422                	ld	s0,40(sp)
    80009796:	6145                	addi	sp,sp,48
    80009798:	8082                	ret

000000008000979a <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    8000979a:	1101                	addi	sp,sp,-32
    8000979c:	ec06                	sd	ra,24(sp)
    8000979e:	e822                	sd	s0,16(sp)
    800097a0:	1000                	addi	s0,sp,32
    800097a2:	87aa                	mv	a5,a0
    800097a4:	872e                	mv	a4,a1
    800097a6:	fef42623          	sw	a5,-20(s0)
    800097aa:	87ba                	mv	a5,a4
    800097ac:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    800097b0:	fe842783          	lw	a5,-24(s0)
    800097b4:	0007871b          	sext.w	a4,a5
    800097b8:	479d                	li	a5,7
    800097ba:	02e7d863          	bge	a5,a4,800097ea <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    800097be:	00034717          	auipc	a4,0x34
    800097c2:	4ca70713          	addi	a4,a4,1226 # 8003dc88 <disk>
    800097c6:	fec42683          	lw	a3,-20(s0)
    800097ca:	15000793          	li	a5,336
    800097ce:	02f687b3          	mul	a5,a3,a5
    800097d2:	97ba                	add	a5,a5,a4
    800097d4:	639c                	ld	a5,0(a5)
    800097d6:	00003617          	auipc	a2,0x3
    800097da:	fa260613          	addi	a2,a2,-94 # 8000c778 <etext+0x778>
    800097de:	85be                	mv	a1,a5
    800097e0:	4509                	li	a0,2
    800097e2:	ffff7097          	auipc	ra,0xffff7
    800097e6:	4fc080e7          	jalr	1276(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    800097ea:	00034697          	auipc	a3,0x34
    800097ee:	49e68693          	addi	a3,a3,1182 # 8003dc88 <disk>
    800097f2:	fe842703          	lw	a4,-24(s0)
    800097f6:	fec42603          	lw	a2,-20(s0)
    800097fa:	15000793          	li	a5,336
    800097fe:	02f607b3          	mul	a5,a2,a5
    80009802:	97b6                	add	a5,a5,a3
    80009804:	97ba                	add	a5,a5,a4
    80009806:	0207c783          	lbu	a5,32(a5)
    8000980a:	c79d                	beqz	a5,80009838 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    8000980c:	00034717          	auipc	a4,0x34
    80009810:	47c70713          	addi	a4,a4,1148 # 8003dc88 <disk>
    80009814:	fec42683          	lw	a3,-20(s0)
    80009818:	15000793          	li	a5,336
    8000981c:	02f687b3          	mul	a5,a3,a5
    80009820:	97ba                	add	a5,a5,a4
    80009822:	639c                	ld	a5,0(a5)
    80009824:	00003617          	auipc	a2,0x3
    80009828:	f6460613          	addi	a2,a2,-156 # 8000c788 <etext+0x788>
    8000982c:	85be                	mv	a1,a5
    8000982e:	4509                	li	a0,2
    80009830:	ffff7097          	auipc	ra,0xffff7
    80009834:	4ae080e7          	jalr	1198(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    80009838:	00034717          	auipc	a4,0x34
    8000983c:	45070713          	addi	a4,a4,1104 # 8003dc88 <disk>
    80009840:	fec42683          	lw	a3,-20(s0)
    80009844:	15000793          	li	a5,336
    80009848:	02f687b3          	mul	a5,a3,a5
    8000984c:	97ba                	add	a5,a5,a4
    8000984e:	6798                	ld	a4,8(a5)
    80009850:	fe842783          	lw	a5,-24(s0)
    80009854:	0792                	slli	a5,a5,0x4
    80009856:	97ba                	add	a5,a5,a4
    80009858:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000985c:	00034717          	auipc	a4,0x34
    80009860:	42c70713          	addi	a4,a4,1068 # 8003dc88 <disk>
    80009864:	fec42683          	lw	a3,-20(s0)
    80009868:	15000793          	li	a5,336
    8000986c:	02f687b3          	mul	a5,a3,a5
    80009870:	97ba                	add	a5,a5,a4
    80009872:	6798                	ld	a4,8(a5)
    80009874:	fe842783          	lw	a5,-24(s0)
    80009878:	0792                	slli	a5,a5,0x4
    8000987a:	97ba                	add	a5,a5,a4
    8000987c:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    80009880:	00034717          	auipc	a4,0x34
    80009884:	40870713          	addi	a4,a4,1032 # 8003dc88 <disk>
    80009888:	fec42683          	lw	a3,-20(s0)
    8000988c:	15000793          	li	a5,336
    80009890:	02f687b3          	mul	a5,a3,a5
    80009894:	97ba                	add	a5,a5,a4
    80009896:	6798                	ld	a4,8(a5)
    80009898:	fe842783          	lw	a5,-24(s0)
    8000989c:	0792                	slli	a5,a5,0x4
    8000989e:	97ba                	add	a5,a5,a4
    800098a0:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    800098a4:	00034717          	auipc	a4,0x34
    800098a8:	3e470713          	addi	a4,a4,996 # 8003dc88 <disk>
    800098ac:	fec42683          	lw	a3,-20(s0)
    800098b0:	15000793          	li	a5,336
    800098b4:	02f687b3          	mul	a5,a3,a5
    800098b8:	97ba                	add	a5,a5,a4
    800098ba:	6798                	ld	a4,8(a5)
    800098bc:	fe842783          	lw	a5,-24(s0)
    800098c0:	0792                	slli	a5,a5,0x4
    800098c2:	97ba                	add	a5,a5,a4
    800098c4:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    800098c8:	00034697          	auipc	a3,0x34
    800098cc:	3c068693          	addi	a3,a3,960 # 8003dc88 <disk>
    800098d0:	fe842703          	lw	a4,-24(s0)
    800098d4:	fec42603          	lw	a2,-20(s0)
    800098d8:	15000793          	li	a5,336
    800098dc:	02f607b3          	mul	a5,a2,a5
    800098e0:	97b6                	add	a5,a5,a3
    800098e2:	97ba                	add	a5,a5,a4
    800098e4:	4705                	li	a4,1
    800098e6:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    800098ea:	00034717          	auipc	a4,0x34
    800098ee:	39e70713          	addi	a4,a4,926 # 8003dc88 <disk>
    800098f2:	fec42683          	lw	a3,-20(s0)
    800098f6:	15000793          	li	a5,336
    800098fa:	02f687b3          	mul	a5,a3,a5
    800098fe:	97ba                	add	a5,a5,a4
    80009900:	1487a783          	lw	a5,328(a5)
    80009904:	e39d                	bnez	a5,8000992a <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    80009906:	fec42703          	lw	a4,-20(s0)
    8000990a:	15000793          	li	a5,336
    8000990e:	02f707b3          	mul	a5,a4,a5
    80009912:	02078713          	addi	a4,a5,32
    80009916:	00034797          	auipc	a5,0x34
    8000991a:	37278793          	addi	a5,a5,882 # 8003dc88 <disk>
    8000991e:	97ba                	add	a5,a5,a4
    80009920:	853e                	mv	a0,a5
    80009922:	ffffa097          	auipc	ra,0xffffa
    80009926:	194080e7          	jalr	404(ra) # 80003ab6 <wakeup>
  }
}
    8000992a:	0001                	nop
    8000992c:	60e2                	ld	ra,24(sp)
    8000992e:	6442                	ld	s0,16(sp)
    80009930:	6105                	addi	sp,sp,32
    80009932:	8082                	ret

0000000080009934 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009934:	7179                	addi	sp,sp,-48
    80009936:	f406                	sd	ra,40(sp)
    80009938:	f022                	sd	s0,32(sp)
    8000993a:	1800                	addi	s0,sp,48
    8000993c:	87aa                	mv	a5,a0
    8000993e:	872e                	mv	a4,a1
    80009940:	fcf42e23          	sw	a5,-36(s0)
    80009944:	87ba                	mv	a5,a4
    80009946:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    8000994a:	00034717          	auipc	a4,0x34
    8000994e:	33e70713          	addi	a4,a4,830 # 8003dc88 <disk>
    80009952:	fdc42683          	lw	a3,-36(s0)
    80009956:	15000793          	li	a5,336
    8000995a:	02f687b3          	mul	a5,a3,a5
    8000995e:	97ba                	add	a5,a5,a4
    80009960:	6798                	ld	a4,8(a5)
    80009962:	fd842783          	lw	a5,-40(s0)
    80009966:	0792                	slli	a5,a5,0x4
    80009968:	97ba                	add	a5,a5,a4
    8000996a:	00c7d783          	lhu	a5,12(a5)
    8000996e:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009972:	00034717          	auipc	a4,0x34
    80009976:	31670713          	addi	a4,a4,790 # 8003dc88 <disk>
    8000997a:	fdc42683          	lw	a3,-36(s0)
    8000997e:	15000793          	li	a5,336
    80009982:	02f687b3          	mul	a5,a3,a5
    80009986:	97ba                	add	a5,a5,a4
    80009988:	6798                	ld	a4,8(a5)
    8000998a:	fd842783          	lw	a5,-40(s0)
    8000998e:	0792                	slli	a5,a5,0x4
    80009990:	97ba                	add	a5,a5,a4
    80009992:	00e7d783          	lhu	a5,14(a5)
    80009996:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    8000999a:	fd842703          	lw	a4,-40(s0)
    8000999e:	fdc42783          	lw	a5,-36(s0)
    800099a2:	85ba                	mv	a1,a4
    800099a4:	853e                	mv	a0,a5
    800099a6:	00000097          	auipc	ra,0x0
    800099aa:	df4080e7          	jalr	-524(ra) # 8000979a <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800099ae:	fec42783          	lw	a5,-20(s0)
    800099b2:	8b85                	andi	a5,a5,1
    800099b4:	2781                	sext.w	a5,a5
    800099b6:	c791                	beqz	a5,800099c2 <free_chain+0x8e>
      i = nxt;
    800099b8:	fe842783          	lw	a5,-24(s0)
    800099bc:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    800099c0:	b769                	j	8000994a <free_chain+0x16>
    else
      break;
    800099c2:	0001                	nop
  }
}
    800099c4:	0001                	nop
    800099c6:	70a2                	ld	ra,40(sp)
    800099c8:	7402                	ld	s0,32(sp)
    800099ca:	6145                	addi	sp,sp,48
    800099cc:	8082                	ret

00000000800099ce <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    800099ce:	7139                	addi	sp,sp,-64
    800099d0:	fc06                	sd	ra,56(sp)
    800099d2:	f822                	sd	s0,48(sp)
    800099d4:	f426                	sd	s1,40(sp)
    800099d6:	0080                	addi	s0,sp,64
    800099d8:	87aa                	mv	a5,a0
    800099da:	fcb43023          	sd	a1,-64(s0)
    800099de:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    800099e2:	fc042e23          	sw	zero,-36(s0)
    800099e6:	a041                	j	80009a66 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    800099e8:	fdc42783          	lw	a5,-36(s0)
    800099ec:	078a                	slli	a5,a5,0x2
    800099ee:	fc043703          	ld	a4,-64(s0)
    800099f2:	00f704b3          	add	s1,a4,a5
    800099f6:	fcc42783          	lw	a5,-52(s0)
    800099fa:	853e                	mv	a0,a5
    800099fc:	00000097          	auipc	ra,0x0
    80009a00:	d22080e7          	jalr	-734(ra) # 8000971e <alloc_desc>
    80009a04:	87aa                	mv	a5,a0
    80009a06:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009a08:	fdc42783          	lw	a5,-36(s0)
    80009a0c:	078a                	slli	a5,a5,0x2
    80009a0e:	fc043703          	ld	a4,-64(s0)
    80009a12:	97ba                	add	a5,a5,a4
    80009a14:	439c                	lw	a5,0(a5)
    80009a16:	0407d363          	bgez	a5,80009a5c <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    80009a1a:	fc042c23          	sw	zero,-40(s0)
    80009a1e:	a02d                	j	80009a48 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    80009a20:	fd842783          	lw	a5,-40(s0)
    80009a24:	078a                	slli	a5,a5,0x2
    80009a26:	fc043703          	ld	a4,-64(s0)
    80009a2a:	97ba                	add	a5,a5,a4
    80009a2c:	4398                	lw	a4,0(a5)
    80009a2e:	fcc42783          	lw	a5,-52(s0)
    80009a32:	85ba                	mv	a1,a4
    80009a34:	853e                	mv	a0,a5
    80009a36:	00000097          	auipc	ra,0x0
    80009a3a:	d64080e7          	jalr	-668(ra) # 8000979a <free_desc>
      for(int j = 0; j < i; j++)
    80009a3e:	fd842783          	lw	a5,-40(s0)
    80009a42:	2785                	addiw	a5,a5,1
    80009a44:	fcf42c23          	sw	a5,-40(s0)
    80009a48:	fd842703          	lw	a4,-40(s0)
    80009a4c:	fdc42783          	lw	a5,-36(s0)
    80009a50:	2701                	sext.w	a4,a4
    80009a52:	2781                	sext.w	a5,a5
    80009a54:	fcf746e3          	blt	a4,a5,80009a20 <alloc3_desc+0x52>
      return -1;
    80009a58:	57fd                	li	a5,-1
    80009a5a:	a831                	j	80009a76 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    80009a5c:	fdc42783          	lw	a5,-36(s0)
    80009a60:	2785                	addiw	a5,a5,1
    80009a62:	fcf42e23          	sw	a5,-36(s0)
    80009a66:	fdc42783          	lw	a5,-36(s0)
    80009a6a:	0007871b          	sext.w	a4,a5
    80009a6e:	4789                	li	a5,2
    80009a70:	f6e7dce3          	bge	a5,a4,800099e8 <alloc3_desc+0x1a>
    }
  }
  return 0;
    80009a74:	4781                	li	a5,0
}
    80009a76:	853e                	mv	a0,a5
    80009a78:	70e2                	ld	ra,56(sp)
    80009a7a:	7442                	ld	s0,48(sp)
    80009a7c:	74a2                	ld	s1,40(sp)
    80009a7e:	6121                	addi	sp,sp,64
    80009a80:	8082                	ret

0000000080009a82 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    80009a82:	715d                	addi	sp,sp,-80
    80009a84:	e486                	sd	ra,72(sp)
    80009a86:	e0a2                	sd	s0,64(sp)
    80009a88:	0880                	addi	s0,sp,80
    80009a8a:	87aa                	mv	a5,a0
    80009a8c:	fcb43023          	sd	a1,-64(s0)
    80009a90:	8736                	mv	a4,a3
    80009a92:	fcf42623          	sw	a5,-52(s0)
    80009a96:	87b2                	mv	a5,a2
    80009a98:	fcf42423          	sw	a5,-56(s0)
    80009a9c:	87ba                	mv	a5,a4
    80009a9e:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80009aa2:	fc043783          	ld	a5,-64(s0)
    80009aa6:	47dc                	lw	a5,12(a5)
    80009aa8:	0017979b          	slliw	a5,a5,0x1
    80009aac:	2781                	sext.w	a5,a5
    80009aae:	1782                	slli	a5,a5,0x20
    80009ab0:	9381                	srli	a5,a5,0x20
    80009ab2:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    80009ab6:	fcc42703          	lw	a4,-52(s0)
    80009aba:	15000793          	li	a5,336
    80009abe:	02f707b3          	mul	a5,a4,a5
    80009ac2:	13078713          	addi	a4,a5,304
    80009ac6:	00034797          	auipc	a5,0x34
    80009aca:	1c278793          	addi	a5,a5,450 # 8003dc88 <disk>
    80009ace:	97ba                	add	a5,a5,a4
    80009ad0:	853e                	mv	a0,a5
    80009ad2:	ffff8097          	auipc	ra,0xffff8
    80009ad6:	896080e7          	jalr	-1898(ra) # 80001368 <acquire>
  disk[id].bw_transfer = busy_wait;
    80009ada:	00034717          	auipc	a4,0x34
    80009ade:	1ae70713          	addi	a4,a4,430 # 8003dc88 <disk>
    80009ae2:	fcc42683          	lw	a3,-52(s0)
    80009ae6:	15000793          	li	a5,336
    80009aea:	02f687b3          	mul	a5,a3,a5
    80009aee:	97ba                	add	a5,a5,a4
    80009af0:	fbc42703          	lw	a4,-68(s0)
    80009af4:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    80009af8:	fd040713          	addi	a4,s0,-48
    80009afc:	fcc42783          	lw	a5,-52(s0)
    80009b00:	85ba                	mv	a1,a4
    80009b02:	853e                	mv	a0,a5
    80009b04:	00000097          	auipc	ra,0x0
    80009b08:	eca080e7          	jalr	-310(ra) # 800099ce <alloc3_desc>
    80009b0c:	87aa                	mv	a5,a0
    80009b0e:	c3e9                	beqz	a5,80009bd0 <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    80009b10:	fbc42783          	lw	a5,-68(s0)
    80009b14:	2781                	sext.w	a5,a5
    80009b16:	e3b9                	bnez	a5,80009b5c <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    80009b18:	fcc42703          	lw	a4,-52(s0)
    80009b1c:	15000793          	li	a5,336
    80009b20:	02f707b3          	mul	a5,a4,a5
    80009b24:	02078713          	addi	a4,a5,32
    80009b28:	00034797          	auipc	a5,0x34
    80009b2c:	16078793          	addi	a5,a5,352 # 8003dc88 <disk>
    80009b30:	00f706b3          	add	a3,a4,a5
    80009b34:	fcc42703          	lw	a4,-52(s0)
    80009b38:	15000793          	li	a5,336
    80009b3c:	02f707b3          	mul	a5,a4,a5
    80009b40:	13078713          	addi	a4,a5,304
    80009b44:	00034797          	auipc	a5,0x34
    80009b48:	14478793          	addi	a5,a5,324 # 8003dc88 <disk>
    80009b4c:	97ba                	add	a5,a5,a4
    80009b4e:	85be                	mv	a1,a5
    80009b50:	8536                	mv	a0,a3
    80009b52:	ffffa097          	auipc	ra,0xffffa
    80009b56:	ee8080e7          	jalr	-280(ra) # 80003a3a <sleep>
    80009b5a:	bf79                	j	80009af8 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    80009b5c:	fcc42703          	lw	a4,-52(s0)
    80009b60:	15000793          	li	a5,336
    80009b64:	02f707b3          	mul	a5,a4,a5
    80009b68:	13078713          	addi	a4,a5,304
    80009b6c:	00034797          	auipc	a5,0x34
    80009b70:	11c78793          	addi	a5,a5,284 # 8003dc88 <disk>
    80009b74:	97ba                	add	a5,a5,a4
    80009b76:	853e                	mv	a0,a5
    80009b78:	ffff8097          	auipc	ra,0xffff8
    80009b7c:	854080e7          	jalr	-1964(ra) # 800013cc <release>
        intr_on();
    80009b80:	fffff097          	auipc	ra,0xfffff
    80009b84:	500080e7          	jalr	1280(ra) # 80009080 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    80009b88:	0001                	nop
    80009b8a:	fd040713          	addi	a4,s0,-48
    80009b8e:	fcc42783          	lw	a5,-52(s0)
    80009b92:	85ba                	mv	a1,a4
    80009b94:	853e                	mv	a0,a5
    80009b96:	00000097          	auipc	ra,0x0
    80009b9a:	e38080e7          	jalr	-456(ra) # 800099ce <alloc3_desc>
    80009b9e:	87aa                	mv	a5,a0
    80009ba0:	f7ed                	bnez	a5,80009b8a <virtio_disk_rw+0x108>
        intr_off();
    80009ba2:	fffff097          	auipc	ra,0xfffff
    80009ba6:	508080e7          	jalr	1288(ra) # 800090aa <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009baa:	fcc42703          	lw	a4,-52(s0)
    80009bae:	15000793          	li	a5,336
    80009bb2:	02f707b3          	mul	a5,a4,a5
    80009bb6:	13078713          	addi	a4,a5,304
    80009bba:	00034797          	auipc	a5,0x34
    80009bbe:	0ce78793          	addi	a5,a5,206 # 8003dc88 <disk>
    80009bc2:	97ba                	add	a5,a5,a4
    80009bc4:	853e                	mv	a0,a5
    80009bc6:	ffff7097          	auipc	ra,0xffff7
    80009bca:	7a2080e7          	jalr	1954(ra) # 80001368 <acquire>
    if(alloc3_desc(id, idx) == 0) {
    80009bce:	b72d                	j	80009af8 <virtio_disk_rw+0x76>
      break;
    80009bd0:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    80009bd2:	fd042683          	lw	a3,-48(s0)
    80009bd6:	fcc42703          	lw	a4,-52(s0)
    80009bda:	87ba                	mv	a5,a4
    80009bdc:	078a                	slli	a5,a5,0x2
    80009bde:	97ba                	add	a5,a5,a4
    80009be0:	078a                	slli	a5,a5,0x2
    80009be2:	97ba                	add	a5,a5,a4
    80009be4:	97b6                	add	a5,a5,a3
    80009be6:	07ad                	addi	a5,a5,11
    80009be8:	00479713          	slli	a4,a5,0x4
    80009bec:	00034797          	auipc	a5,0x34
    80009bf0:	09c78793          	addi	a5,a5,156 # 8003dc88 <disk>
    80009bf4:	97ba                	add	a5,a5,a4
    80009bf6:	fef43023          	sd	a5,-32(s0)

  if(write)
    80009bfa:	fc842783          	lw	a5,-56(s0)
    80009bfe:	2781                	sext.w	a5,a5
    80009c00:	c791                	beqz	a5,80009c0c <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009c02:	fe043783          	ld	a5,-32(s0)
    80009c06:	4705                	li	a4,1
    80009c08:	c398                	sw	a4,0(a5)
    80009c0a:	a029                	j	80009c14 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    80009c0c:	fe043783          	ld	a5,-32(s0)
    80009c10:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009c14:	fe043783          	ld	a5,-32(s0)
    80009c18:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    80009c1c:	fe043783          	ld	a5,-32(s0)
    80009c20:	fe843703          	ld	a4,-24(s0)
    80009c24:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    80009c26:	00034717          	auipc	a4,0x34
    80009c2a:	06270713          	addi	a4,a4,98 # 8003dc88 <disk>
    80009c2e:	fcc42683          	lw	a3,-52(s0)
    80009c32:	15000793          	li	a5,336
    80009c36:	02f687b3          	mul	a5,a3,a5
    80009c3a:	97ba                	add	a5,a5,a4
    80009c3c:	6798                	ld	a4,8(a5)
    80009c3e:	fd042783          	lw	a5,-48(s0)
    80009c42:	0792                	slli	a5,a5,0x4
    80009c44:	97ba                	add	a5,a5,a4
    80009c46:	fe043703          	ld	a4,-32(s0)
    80009c4a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80009c4c:	00034717          	auipc	a4,0x34
    80009c50:	03c70713          	addi	a4,a4,60 # 8003dc88 <disk>
    80009c54:	fcc42683          	lw	a3,-52(s0)
    80009c58:	15000793          	li	a5,336
    80009c5c:	02f687b3          	mul	a5,a3,a5
    80009c60:	97ba                	add	a5,a5,a4
    80009c62:	6798                	ld	a4,8(a5)
    80009c64:	fd042783          	lw	a5,-48(s0)
    80009c68:	0792                	slli	a5,a5,0x4
    80009c6a:	97ba                	add	a5,a5,a4
    80009c6c:	4741                	li	a4,16
    80009c6e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009c70:	00034717          	auipc	a4,0x34
    80009c74:	01870713          	addi	a4,a4,24 # 8003dc88 <disk>
    80009c78:	fcc42683          	lw	a3,-52(s0)
    80009c7c:	15000793          	li	a5,336
    80009c80:	02f687b3          	mul	a5,a3,a5
    80009c84:	97ba                	add	a5,a5,a4
    80009c86:	6798                	ld	a4,8(a5)
    80009c88:	fd042783          	lw	a5,-48(s0)
    80009c8c:	0792                	slli	a5,a5,0x4
    80009c8e:	97ba                	add	a5,a5,a4
    80009c90:	4705                	li	a4,1
    80009c92:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    80009c96:	fd442603          	lw	a2,-44(s0)
    80009c9a:	00034717          	auipc	a4,0x34
    80009c9e:	fee70713          	addi	a4,a4,-18 # 8003dc88 <disk>
    80009ca2:	fcc42683          	lw	a3,-52(s0)
    80009ca6:	15000793          	li	a5,336
    80009caa:	02f687b3          	mul	a5,a3,a5
    80009cae:	97ba                	add	a5,a5,a4
    80009cb0:	6798                	ld	a4,8(a5)
    80009cb2:	fd042783          	lw	a5,-48(s0)
    80009cb6:	0792                	slli	a5,a5,0x4
    80009cb8:	97ba                	add	a5,a5,a4
    80009cba:	03061713          	slli	a4,a2,0x30
    80009cbe:	9341                	srli	a4,a4,0x30
    80009cc0:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    80009cc4:	fc043783          	ld	a5,-64(s0)
    80009cc8:	05878613          	addi	a2,a5,88
    80009ccc:	00034717          	auipc	a4,0x34
    80009cd0:	fbc70713          	addi	a4,a4,-68 # 8003dc88 <disk>
    80009cd4:	fcc42683          	lw	a3,-52(s0)
    80009cd8:	15000793          	li	a5,336
    80009cdc:	02f687b3          	mul	a5,a3,a5
    80009ce0:	97ba                	add	a5,a5,a4
    80009ce2:	6798                	ld	a4,8(a5)
    80009ce4:	fd442783          	lw	a5,-44(s0)
    80009ce8:	0792                	slli	a5,a5,0x4
    80009cea:	97ba                	add	a5,a5,a4
    80009cec:	8732                	mv	a4,a2
    80009cee:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    80009cf0:	00034717          	auipc	a4,0x34
    80009cf4:	f9870713          	addi	a4,a4,-104 # 8003dc88 <disk>
    80009cf8:	fcc42683          	lw	a3,-52(s0)
    80009cfc:	15000793          	li	a5,336
    80009d00:	02f687b3          	mul	a5,a3,a5
    80009d04:	97ba                	add	a5,a5,a4
    80009d06:	6798                	ld	a4,8(a5)
    80009d08:	fd442783          	lw	a5,-44(s0)
    80009d0c:	0792                	slli	a5,a5,0x4
    80009d0e:	97ba                	add	a5,a5,a4
    80009d10:	40000713          	li	a4,1024
    80009d14:	c798                	sw	a4,8(a5)
  if(write)
    80009d16:	fc842783          	lw	a5,-56(s0)
    80009d1a:	2781                	sext.w	a5,a5
    80009d1c:	c785                	beqz	a5,80009d44 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    80009d1e:	00034717          	auipc	a4,0x34
    80009d22:	f6a70713          	addi	a4,a4,-150 # 8003dc88 <disk>
    80009d26:	fcc42683          	lw	a3,-52(s0)
    80009d2a:	15000793          	li	a5,336
    80009d2e:	02f687b3          	mul	a5,a3,a5
    80009d32:	97ba                	add	a5,a5,a4
    80009d34:	6798                	ld	a4,8(a5)
    80009d36:	fd442783          	lw	a5,-44(s0)
    80009d3a:	0792                	slli	a5,a5,0x4
    80009d3c:	97ba                	add	a5,a5,a4
    80009d3e:	00079623          	sh	zero,12(a5)
    80009d42:	a025                	j	80009d6a <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009d44:	00034717          	auipc	a4,0x34
    80009d48:	f4470713          	addi	a4,a4,-188 # 8003dc88 <disk>
    80009d4c:	fcc42683          	lw	a3,-52(s0)
    80009d50:	15000793          	li	a5,336
    80009d54:	02f687b3          	mul	a5,a3,a5
    80009d58:	97ba                	add	a5,a5,a4
    80009d5a:	6798                	ld	a4,8(a5)
    80009d5c:	fd442783          	lw	a5,-44(s0)
    80009d60:	0792                	slli	a5,a5,0x4
    80009d62:	97ba                	add	a5,a5,a4
    80009d64:	4709                	li	a4,2
    80009d66:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80009d6a:	00034717          	auipc	a4,0x34
    80009d6e:	f1e70713          	addi	a4,a4,-226 # 8003dc88 <disk>
    80009d72:	fcc42683          	lw	a3,-52(s0)
    80009d76:	15000793          	li	a5,336
    80009d7a:	02f687b3          	mul	a5,a3,a5
    80009d7e:	97ba                	add	a5,a5,a4
    80009d80:	6798                	ld	a4,8(a5)
    80009d82:	fd442783          	lw	a5,-44(s0)
    80009d86:	0792                	slli	a5,a5,0x4
    80009d88:	97ba                	add	a5,a5,a4
    80009d8a:	00c7d703          	lhu	a4,12(a5)
    80009d8e:	00034697          	auipc	a3,0x34
    80009d92:	efa68693          	addi	a3,a3,-262 # 8003dc88 <disk>
    80009d96:	fcc42603          	lw	a2,-52(s0)
    80009d9a:	15000793          	li	a5,336
    80009d9e:	02f607b3          	mul	a5,a2,a5
    80009da2:	97b6                	add	a5,a5,a3
    80009da4:	6794                	ld	a3,8(a5)
    80009da6:	fd442783          	lw	a5,-44(s0)
    80009daa:	0792                	slli	a5,a5,0x4
    80009dac:	97b6                	add	a5,a5,a3
    80009dae:	00176713          	ori	a4,a4,1
    80009db2:	1742                	slli	a4,a4,0x30
    80009db4:	9341                	srli	a4,a4,0x30
    80009db6:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    80009dba:	fd842603          	lw	a2,-40(s0)
    80009dbe:	00034717          	auipc	a4,0x34
    80009dc2:	eca70713          	addi	a4,a4,-310 # 8003dc88 <disk>
    80009dc6:	fcc42683          	lw	a3,-52(s0)
    80009dca:	15000793          	li	a5,336
    80009dce:	02f687b3          	mul	a5,a3,a5
    80009dd2:	97ba                	add	a5,a5,a4
    80009dd4:	6798                	ld	a4,8(a5)
    80009dd6:	fd442783          	lw	a5,-44(s0)
    80009dda:	0792                	slli	a5,a5,0x4
    80009ddc:	97ba                	add	a5,a5,a4
    80009dde:	03061713          	slli	a4,a2,0x30
    80009de2:	9341                	srli	a4,a4,0x30
    80009de4:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    80009de8:	fd042603          	lw	a2,-48(s0)
    80009dec:	00034697          	auipc	a3,0x34
    80009df0:	e9c68693          	addi	a3,a3,-356 # 8003dc88 <disk>
    80009df4:	fcc42703          	lw	a4,-52(s0)
    80009df8:	87ba                	mv	a5,a4
    80009dfa:	078a                	slli	a5,a5,0x2
    80009dfc:	97ba                	add	a5,a5,a4
    80009dfe:	078a                	slli	a5,a5,0x2
    80009e00:	97ba                	add	a5,a5,a4
    80009e02:	97b2                	add	a5,a5,a2
    80009e04:	078d                	addi	a5,a5,3
    80009e06:	0792                	slli	a5,a5,0x4
    80009e08:	97b6                	add	a5,a5,a3
    80009e0a:	577d                	li	a4,-1
    80009e0c:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009e10:	fd042683          	lw	a3,-48(s0)
    80009e14:	fcc42703          	lw	a4,-52(s0)
    80009e18:	87ba                	mv	a5,a4
    80009e1a:	078a                	slli	a5,a5,0x2
    80009e1c:	97ba                	add	a5,a5,a4
    80009e1e:	078a                	slli	a5,a5,0x2
    80009e20:	97ba                	add	a5,a5,a4
    80009e22:	97b6                	add	a5,a5,a3
    80009e24:	078d                	addi	a5,a5,3
    80009e26:	00479713          	slli	a4,a5,0x4
    80009e2a:	00034797          	auipc	a5,0x34
    80009e2e:	e5e78793          	addi	a5,a5,-418 # 8003dc88 <disk>
    80009e32:	97ba                	add	a5,a5,a4
    80009e34:	00878613          	addi	a2,a5,8
    80009e38:	00034717          	auipc	a4,0x34
    80009e3c:	e5070713          	addi	a4,a4,-432 # 8003dc88 <disk>
    80009e40:	fcc42683          	lw	a3,-52(s0)
    80009e44:	15000793          	li	a5,336
    80009e48:	02f687b3          	mul	a5,a3,a5
    80009e4c:	97ba                	add	a5,a5,a4
    80009e4e:	6798                	ld	a4,8(a5)
    80009e50:	fd842783          	lw	a5,-40(s0)
    80009e54:	0792                	slli	a5,a5,0x4
    80009e56:	97ba                	add	a5,a5,a4
    80009e58:	8732                	mv	a4,a2
    80009e5a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    80009e5c:	00034717          	auipc	a4,0x34
    80009e60:	e2c70713          	addi	a4,a4,-468 # 8003dc88 <disk>
    80009e64:	fcc42683          	lw	a3,-52(s0)
    80009e68:	15000793          	li	a5,336
    80009e6c:	02f687b3          	mul	a5,a3,a5
    80009e70:	97ba                	add	a5,a5,a4
    80009e72:	6798                	ld	a4,8(a5)
    80009e74:	fd842783          	lw	a5,-40(s0)
    80009e78:	0792                	slli	a5,a5,0x4
    80009e7a:	97ba                	add	a5,a5,a4
    80009e7c:	4705                	li	a4,1
    80009e7e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009e80:	00034717          	auipc	a4,0x34
    80009e84:	e0870713          	addi	a4,a4,-504 # 8003dc88 <disk>
    80009e88:	fcc42683          	lw	a3,-52(s0)
    80009e8c:	15000793          	li	a5,336
    80009e90:	02f687b3          	mul	a5,a3,a5
    80009e94:	97ba                	add	a5,a5,a4
    80009e96:	6798                	ld	a4,8(a5)
    80009e98:	fd842783          	lw	a5,-40(s0)
    80009e9c:	0792                	slli	a5,a5,0x4
    80009e9e:	97ba                	add	a5,a5,a4
    80009ea0:	4709                	li	a4,2
    80009ea2:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009ea6:	00034717          	auipc	a4,0x34
    80009eaa:	de270713          	addi	a4,a4,-542 # 8003dc88 <disk>
    80009eae:	fcc42683          	lw	a3,-52(s0)
    80009eb2:	15000793          	li	a5,336
    80009eb6:	02f687b3          	mul	a5,a3,a5
    80009eba:	97ba                	add	a5,a5,a4
    80009ebc:	6798                	ld	a4,8(a5)
    80009ebe:	fd842783          	lw	a5,-40(s0)
    80009ec2:	0792                	slli	a5,a5,0x4
    80009ec4:	97ba                	add	a5,a5,a4
    80009ec6:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009eca:	fc043783          	ld	a5,-64(s0)
    80009ece:	4705                	li	a4,1
    80009ed0:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    80009ed2:	fd042603          	lw	a2,-48(s0)
    80009ed6:	00034697          	auipc	a3,0x34
    80009eda:	db268693          	addi	a3,a3,-590 # 8003dc88 <disk>
    80009ede:	fcc42703          	lw	a4,-52(s0)
    80009ee2:	87ba                	mv	a5,a4
    80009ee4:	078a                	slli	a5,a5,0x2
    80009ee6:	97ba                	add	a5,a5,a4
    80009ee8:	078a                	slli	a5,a5,0x2
    80009eea:	97ba                	add	a5,a5,a4
    80009eec:	97b2                	add	a5,a5,a2
    80009eee:	078d                	addi	a5,a5,3
    80009ef0:	0792                	slli	a5,a5,0x4
    80009ef2:	97b6                	add	a5,a5,a3
    80009ef4:	fc043703          	ld	a4,-64(s0)
    80009ef8:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009efa:	fd042583          	lw	a1,-48(s0)
    80009efe:	00034717          	auipc	a4,0x34
    80009f02:	d8a70713          	addi	a4,a4,-630 # 8003dc88 <disk>
    80009f06:	fcc42683          	lw	a3,-52(s0)
    80009f0a:	15000793          	li	a5,336
    80009f0e:	02f687b3          	mul	a5,a3,a5
    80009f12:	97ba                	add	a5,a5,a4
    80009f14:	6b94                	ld	a3,16(a5)
    80009f16:	00034717          	auipc	a4,0x34
    80009f1a:	d7270713          	addi	a4,a4,-654 # 8003dc88 <disk>
    80009f1e:	fcc42603          	lw	a2,-52(s0)
    80009f22:	15000793          	li	a5,336
    80009f26:	02f607b3          	mul	a5,a2,a5
    80009f2a:	97ba                	add	a5,a5,a4
    80009f2c:	6b9c                	ld	a5,16(a5)
    80009f2e:	0027d783          	lhu	a5,2(a5)
    80009f32:	2781                	sext.w	a5,a5
    80009f34:	8b9d                	andi	a5,a5,7
    80009f36:	2781                	sext.w	a5,a5
    80009f38:	03059713          	slli	a4,a1,0x30
    80009f3c:	9341                	srli	a4,a4,0x30
    80009f3e:	0786                	slli	a5,a5,0x1
    80009f40:	97b6                	add	a5,a5,a3
    80009f42:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009f46:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009f4a:	00034717          	auipc	a4,0x34
    80009f4e:	d3e70713          	addi	a4,a4,-706 # 8003dc88 <disk>
    80009f52:	fcc42683          	lw	a3,-52(s0)
    80009f56:	15000793          	li	a5,336
    80009f5a:	02f687b3          	mul	a5,a3,a5
    80009f5e:	97ba                	add	a5,a5,a4
    80009f60:	6b9c                	ld	a5,16(a5)
    80009f62:	0027d703          	lhu	a4,2(a5)
    80009f66:	00034697          	auipc	a3,0x34
    80009f6a:	d2268693          	addi	a3,a3,-734 # 8003dc88 <disk>
    80009f6e:	fcc42603          	lw	a2,-52(s0)
    80009f72:	15000793          	li	a5,336
    80009f76:	02f607b3          	mul	a5,a2,a5
    80009f7a:	97b6                	add	a5,a5,a3
    80009f7c:	6b9c                	ld	a5,16(a5)
    80009f7e:	2705                	addiw	a4,a4,1
    80009f80:	1742                	slli	a4,a4,0x30
    80009f82:	9341                	srli	a4,a4,0x30
    80009f84:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009f88:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009f8c:	fcc42703          	lw	a4,-52(s0)
    80009f90:	67c1                	lui	a5,0x10
    80009f92:	0785                	addi	a5,a5,1
    80009f94:	97ba                	add	a5,a5,a4
    80009f96:	07b2                	slli	a5,a5,0xc
    80009f98:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009f9c:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009fa0:	a871                	j	8000a03c <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009fa2:	fbc42783          	lw	a5,-68(s0)
    80009fa6:	2781                	sext.w	a5,a5
    80009fa8:	e795                	bnez	a5,80009fd4 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009faa:	fcc42703          	lw	a4,-52(s0)
    80009fae:	15000793          	li	a5,336
    80009fb2:	02f707b3          	mul	a5,a4,a5
    80009fb6:	13078713          	addi	a4,a5,304
    80009fba:	00034797          	auipc	a5,0x34
    80009fbe:	cce78793          	addi	a5,a5,-818 # 8003dc88 <disk>
    80009fc2:	97ba                	add	a5,a5,a4
    80009fc4:	85be                	mv	a1,a5
    80009fc6:	fc043503          	ld	a0,-64(s0)
    80009fca:	ffffa097          	auipc	ra,0xffffa
    80009fce:	a70080e7          	jalr	-1424(ra) # 80003a3a <sleep>
    80009fd2:	a0ad                	j	8000a03c <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009fd4:	fcc42703          	lw	a4,-52(s0)
    80009fd8:	15000793          	li	a5,336
    80009fdc:	02f707b3          	mul	a5,a4,a5
    80009fe0:	13078713          	addi	a4,a5,304
    80009fe4:	00034797          	auipc	a5,0x34
    80009fe8:	ca478793          	addi	a5,a5,-860 # 8003dc88 <disk>
    80009fec:	97ba                	add	a5,a5,a4
    80009fee:	853e                	mv	a0,a5
    80009ff0:	ffff7097          	auipc	ra,0xffff7
    80009ff4:	3dc080e7          	jalr	988(ra) # 800013cc <release>
        intr_on();
    80009ff8:	fffff097          	auipc	ra,0xfffff
    80009ffc:	088080e7          	jalr	136(ra) # 80009080 <intr_on>
        while(b->disk == 1);
    8000a000:	0001                	nop
    8000a002:	fc043783          	ld	a5,-64(s0)
    8000a006:	43dc                	lw	a5,4(a5)
    8000a008:	873e                	mv	a4,a5
    8000a00a:	4785                	li	a5,1
    8000a00c:	fef70be3          	beq	a4,a5,8000a002 <virtio_disk_rw+0x580>
        intr_off();
    8000a010:	fffff097          	auipc	ra,0xfffff
    8000a014:	09a080e7          	jalr	154(ra) # 800090aa <intr_off>
        acquire(&disk[id].vdisk_lock);
    8000a018:	fcc42703          	lw	a4,-52(s0)
    8000a01c:	15000793          	li	a5,336
    8000a020:	02f707b3          	mul	a5,a4,a5
    8000a024:	13078713          	addi	a4,a5,304
    8000a028:	00034797          	auipc	a5,0x34
    8000a02c:	c6078793          	addi	a5,a5,-928 # 8003dc88 <disk>
    8000a030:	97ba                	add	a5,a5,a4
    8000a032:	853e                	mv	a0,a5
    8000a034:	ffff7097          	auipc	ra,0xffff7
    8000a038:	334080e7          	jalr	820(ra) # 80001368 <acquire>
  while(b->disk == 1) {
    8000a03c:	fc043783          	ld	a5,-64(s0)
    8000a040:	43dc                	lw	a5,4(a5)
    8000a042:	873e                	mv	a4,a5
    8000a044:	4785                	li	a5,1
    8000a046:	f4f70ee3          	beq	a4,a5,80009fa2 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    8000a04a:	fd042603          	lw	a2,-48(s0)
    8000a04e:	00034697          	auipc	a3,0x34
    8000a052:	c3a68693          	addi	a3,a3,-966 # 8003dc88 <disk>
    8000a056:	fcc42703          	lw	a4,-52(s0)
    8000a05a:	87ba                	mv	a5,a4
    8000a05c:	078a                	slli	a5,a5,0x2
    8000a05e:	97ba                	add	a5,a5,a4
    8000a060:	078a                	slli	a5,a5,0x2
    8000a062:	97ba                	add	a5,a5,a4
    8000a064:	97b2                	add	a5,a5,a2
    8000a066:	078d                	addi	a5,a5,3
    8000a068:	0792                	slli	a5,a5,0x4
    8000a06a:	97b6                	add	a5,a5,a3
    8000a06c:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    8000a070:	fd042703          	lw	a4,-48(s0)
    8000a074:	fcc42783          	lw	a5,-52(s0)
    8000a078:	85ba                	mv	a1,a4
    8000a07a:	853e                	mv	a0,a5
    8000a07c:	00000097          	auipc	ra,0x0
    8000a080:	8b8080e7          	jalr	-1864(ra) # 80009934 <free_chain>

  release(&disk[id].vdisk_lock);
    8000a084:	fcc42703          	lw	a4,-52(s0)
    8000a088:	15000793          	li	a5,336
    8000a08c:	02f707b3          	mul	a5,a4,a5
    8000a090:	13078713          	addi	a4,a5,304
    8000a094:	00034797          	auipc	a5,0x34
    8000a098:	bf478793          	addi	a5,a5,-1036 # 8003dc88 <disk>
    8000a09c:	97ba                	add	a5,a5,a4
    8000a09e:	853e                	mv	a0,a5
    8000a0a0:	ffff7097          	auipc	ra,0xffff7
    8000a0a4:	32c080e7          	jalr	812(ra) # 800013cc <release>
}
    8000a0a8:	0001                	nop
    8000a0aa:	60a6                	ld	ra,72(sp)
    8000a0ac:	6406                	ld	s0,64(sp)
    8000a0ae:	6161                	addi	sp,sp,80
    8000a0b0:	8082                	ret

000000008000a0b2 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    8000a0b2:	7179                	addi	sp,sp,-48
    8000a0b4:	f406                	sd	ra,40(sp)
    8000a0b6:	f022                	sd	s0,32(sp)
    8000a0b8:	1800                	addi	s0,sp,48
    8000a0ba:	87aa                	mv	a5,a0
    8000a0bc:	fcb43823          	sd	a1,-48(s0)
    8000a0c0:	8732                	mv	a4,a2
    8000a0c2:	fcf42e23          	sw	a5,-36(s0)
    8000a0c6:	87ba                	mv	a5,a4
    8000a0c8:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    8000a0cc:	00034797          	auipc	a5,0x34
    8000a0d0:	e5c78793          	addi	a5,a5,-420 # 8003df28 <swap_buffer>
    8000a0d4:	639c                	ld	a5,0(a5)
    8000a0d6:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    8000a0da:	fdc42703          	lw	a4,-36(s0)
    8000a0de:	fe843783          	ld	a5,-24(s0)
    8000a0e2:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    8000a0e4:	fe843783          	ld	a5,-24(s0)
    8000a0e8:	05878793          	addi	a5,a5,88
    8000a0ec:	40000613          	li	a2,1024
    8000a0f0:	fd043583          	ld	a1,-48(s0)
    8000a0f4:	853e                	mv	a0,a5
    8000a0f6:	ffff7097          	auipc	ra,0xffff7
    8000a0fa:	52a080e7          	jalr	1322(ra) # 80001620 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    8000a0fe:	fd842783          	lw	a5,-40(s0)
    8000a102:	86be                	mv	a3,a5
    8000a104:	4605                	li	a2,1
    8000a106:	fe843583          	ld	a1,-24(s0)
    8000a10a:	4505                	li	a0,1
    8000a10c:	00000097          	auipc	ra,0x0
    8000a110:	976080e7          	jalr	-1674(ra) # 80009a82 <virtio_disk_rw>
}
    8000a114:	0001                	nop
    8000a116:	70a2                	ld	ra,40(sp)
    8000a118:	7402                	ld	s0,32(sp)
    8000a11a:	6145                	addi	sp,sp,48
    8000a11c:	8082                	ret

000000008000a11e <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    8000a11e:	7179                	addi	sp,sp,-48
    8000a120:	f406                	sd	ra,40(sp)
    8000a122:	f022                	sd	s0,32(sp)
    8000a124:	1800                	addi	s0,sp,48
    8000a126:	87aa                	mv	a5,a0
    8000a128:	fcb43823          	sd	a1,-48(s0)
    8000a12c:	8732                	mv	a4,a2
    8000a12e:	fcf42e23          	sw	a5,-36(s0)
    8000a132:	87ba                	mv	a5,a4
    8000a134:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    8000a138:	00034797          	auipc	a5,0x34
    8000a13c:	df078793          	addi	a5,a5,-528 # 8003df28 <swap_buffer>
    8000a140:	639c                	ld	a5,0(a5)
    8000a142:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    8000a146:	fdc42703          	lw	a4,-36(s0)
    8000a14a:	fe843783          	ld	a5,-24(s0)
    8000a14e:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    8000a150:	fd842783          	lw	a5,-40(s0)
    8000a154:	86be                	mv	a3,a5
    8000a156:	4601                	li	a2,0
    8000a158:	fe843583          	ld	a1,-24(s0)
    8000a15c:	4505                	li	a0,1
    8000a15e:	00000097          	auipc	ra,0x0
    8000a162:	924080e7          	jalr	-1756(ra) # 80009a82 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    8000a166:	fe843783          	ld	a5,-24(s0)
    8000a16a:	05878793          	addi	a5,a5,88
    8000a16e:	40000613          	li	a2,1024
    8000a172:	85be                	mv	a1,a5
    8000a174:	fd043503          	ld	a0,-48(s0)
    8000a178:	ffff7097          	auipc	ra,0xffff7
    8000a17c:	4a8080e7          	jalr	1192(ra) # 80001620 <memmove>
}
    8000a180:	0001                	nop
    8000a182:	70a2                	ld	ra,40(sp)
    8000a184:	7402                	ld	s0,32(sp)
    8000a186:	6145                	addi	sp,sp,48
    8000a188:	8082                	ret

000000008000a18a <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    8000a18a:	7179                	addi	sp,sp,-48
    8000a18c:	f406                	sd	ra,40(sp)
    8000a18e:	f022                	sd	s0,32(sp)
    8000a190:	1800                	addi	s0,sp,48
    8000a192:	87aa                	mv	a5,a0
    8000a194:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    8000a198:	fdc42703          	lw	a4,-36(s0)
    8000a19c:	15000793          	li	a5,336
    8000a1a0:	02f707b3          	mul	a5,a4,a5
    8000a1a4:	13078713          	addi	a4,a5,304
    8000a1a8:	00034797          	auipc	a5,0x34
    8000a1ac:	ae078793          	addi	a5,a5,-1312 # 8003dc88 <disk>
    8000a1b0:	97ba                	add	a5,a5,a4
    8000a1b2:	853e                	mv	a0,a5
    8000a1b4:	ffff7097          	auipc	ra,0xffff7
    8000a1b8:	1b4080e7          	jalr	436(ra) # 80001368 <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000a1bc:	fdc42703          	lw	a4,-36(s0)
    8000a1c0:	67c1                	lui	a5,0x10
    8000a1c2:	0785                	addi	a5,a5,1
    8000a1c4:	97ba                	add	a5,a5,a4
    8000a1c6:	07b2                	slli	a5,a5,0xc
    8000a1c8:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    8000a1cc:	439c                	lw	a5,0(a5)
    8000a1ce:	0007869b          	sext.w	a3,a5
    8000a1d2:	fdc42703          	lw	a4,-36(s0)
    8000a1d6:	67c1                	lui	a5,0x10
    8000a1d8:	0785                	addi	a5,a5,1
    8000a1da:	97ba                	add	a5,a5,a4
    8000a1dc:	07b2                	slli	a5,a5,0xc
    8000a1de:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    8000a1e2:	873e                	mv	a4,a5
    8000a1e4:	87b6                	mv	a5,a3
    8000a1e6:	8b8d                	andi	a5,a5,3
    8000a1e8:	2781                	sext.w	a5,a5
    8000a1ea:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    8000a1ec:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    8000a1f0:	aa05                	j	8000a320 <virtio_disk_intr+0x196>
    __sync_synchronize();
    8000a1f2:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    8000a1f6:	00034717          	auipc	a4,0x34
    8000a1fa:	a9270713          	addi	a4,a4,-1390 # 8003dc88 <disk>
    8000a1fe:	fdc42683          	lw	a3,-36(s0)
    8000a202:	15000793          	li	a5,336
    8000a206:	02f687b3          	mul	a5,a3,a5
    8000a20a:	97ba                	add	a5,a5,a4
    8000a20c:	6f98                	ld	a4,24(a5)
    8000a20e:	00034697          	auipc	a3,0x34
    8000a212:	a7a68693          	addi	a3,a3,-1414 # 8003dc88 <disk>
    8000a216:	fdc42603          	lw	a2,-36(s0)
    8000a21a:	15000793          	li	a5,336
    8000a21e:	02f607b3          	mul	a5,a2,a5
    8000a222:	97b6                	add	a5,a5,a3
    8000a224:	0287d783          	lhu	a5,40(a5)
    8000a228:	2781                	sext.w	a5,a5
    8000a22a:	8b9d                	andi	a5,a5,7
    8000a22c:	2781                	sext.w	a5,a5
    8000a22e:	078e                	slli	a5,a5,0x3
    8000a230:	97ba                	add	a5,a5,a4
    8000a232:	43dc                	lw	a5,4(a5)
    8000a234:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    8000a238:	00034697          	auipc	a3,0x34
    8000a23c:	a5068693          	addi	a3,a3,-1456 # 8003dc88 <disk>
    8000a240:	fec42603          	lw	a2,-20(s0)
    8000a244:	fdc42703          	lw	a4,-36(s0)
    8000a248:	87ba                	mv	a5,a4
    8000a24a:	078a                	slli	a5,a5,0x2
    8000a24c:	97ba                	add	a5,a5,a4
    8000a24e:	078a                	slli	a5,a5,0x2
    8000a250:	97ba                	add	a5,a5,a4
    8000a252:	97b2                	add	a5,a5,a2
    8000a254:	078d                	addi	a5,a5,3
    8000a256:	0792                	slli	a5,a5,0x4
    8000a258:	97b6                	add	a5,a5,a3
    8000a25a:	0087c783          	lbu	a5,8(a5)
    8000a25e:	c79d                	beqz	a5,8000a28c <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    8000a260:	00034717          	auipc	a4,0x34
    8000a264:	a2870713          	addi	a4,a4,-1496 # 8003dc88 <disk>
    8000a268:	fdc42683          	lw	a3,-36(s0)
    8000a26c:	15000793          	li	a5,336
    8000a270:	02f687b3          	mul	a5,a3,a5
    8000a274:	97ba                	add	a5,a5,a4
    8000a276:	639c                	ld	a5,0(a5)
    8000a278:	00002617          	auipc	a2,0x2
    8000a27c:	52060613          	addi	a2,a2,1312 # 8000c798 <etext+0x798>
    8000a280:	85be                	mv	a1,a5
    8000a282:	4509                	li	a0,2
    8000a284:	ffff7097          	auipc	ra,0xffff7
    8000a288:	a5a080e7          	jalr	-1446(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    8000a28c:	00034697          	auipc	a3,0x34
    8000a290:	9fc68693          	addi	a3,a3,-1540 # 8003dc88 <disk>
    8000a294:	fec42603          	lw	a2,-20(s0)
    8000a298:	fdc42703          	lw	a4,-36(s0)
    8000a29c:	87ba                	mv	a5,a4
    8000a29e:	078a                	slli	a5,a5,0x2
    8000a2a0:	97ba                	add	a5,a5,a4
    8000a2a2:	078a                	slli	a5,a5,0x2
    8000a2a4:	97ba                	add	a5,a5,a4
    8000a2a6:	97b2                	add	a5,a5,a2
    8000a2a8:	078d                	addi	a5,a5,3
    8000a2aa:	0792                	slli	a5,a5,0x4
    8000a2ac:	97b6                	add	a5,a5,a3
    8000a2ae:	639c                	ld	a5,0(a5)
    8000a2b0:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    8000a2b4:	fe043783          	ld	a5,-32(s0)
    8000a2b8:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    8000a2bc:	00034717          	auipc	a4,0x34
    8000a2c0:	9cc70713          	addi	a4,a4,-1588 # 8003dc88 <disk>
    8000a2c4:	fdc42683          	lw	a3,-36(s0)
    8000a2c8:	15000793          	li	a5,336
    8000a2cc:	02f687b3          	mul	a5,a3,a5
    8000a2d0:	97ba                	add	a5,a5,a4
    8000a2d2:	1487a783          	lw	a5,328(a5)
    8000a2d6:	e799                	bnez	a5,8000a2e4 <virtio_disk_intr+0x15a>
        wakeup(b);
    8000a2d8:	fe043503          	ld	a0,-32(s0)
    8000a2dc:	ffff9097          	auipc	ra,0xffff9
    8000a2e0:	7da080e7          	jalr	2010(ra) # 80003ab6 <wakeup>
    }

    disk[id].used_idx += 1;
    8000a2e4:	00034717          	auipc	a4,0x34
    8000a2e8:	9a470713          	addi	a4,a4,-1628 # 8003dc88 <disk>
    8000a2ec:	fdc42683          	lw	a3,-36(s0)
    8000a2f0:	15000793          	li	a5,336
    8000a2f4:	02f687b3          	mul	a5,a3,a5
    8000a2f8:	97ba                	add	a5,a5,a4
    8000a2fa:	0287d783          	lhu	a5,40(a5)
    8000a2fe:	2785                	addiw	a5,a5,1
    8000a300:	03079713          	slli	a4,a5,0x30
    8000a304:	9341                	srli	a4,a4,0x30
    8000a306:	00034697          	auipc	a3,0x34
    8000a30a:	98268693          	addi	a3,a3,-1662 # 8003dc88 <disk>
    8000a30e:	fdc42603          	lw	a2,-36(s0)
    8000a312:	15000793          	li	a5,336
    8000a316:	02f607b3          	mul	a5,a2,a5
    8000a31a:	97b6                	add	a5,a5,a3
    8000a31c:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    8000a320:	00034717          	auipc	a4,0x34
    8000a324:	96870713          	addi	a4,a4,-1688 # 8003dc88 <disk>
    8000a328:	fdc42683          	lw	a3,-36(s0)
    8000a32c:	15000793          	li	a5,336
    8000a330:	02f687b3          	mul	a5,a3,a5
    8000a334:	97ba                	add	a5,a5,a4
    8000a336:	0287d603          	lhu	a2,40(a5)
    8000a33a:	00034717          	auipc	a4,0x34
    8000a33e:	94e70713          	addi	a4,a4,-1714 # 8003dc88 <disk>
    8000a342:	fdc42683          	lw	a3,-36(s0)
    8000a346:	15000793          	li	a5,336
    8000a34a:	02f687b3          	mul	a5,a3,a5
    8000a34e:	97ba                	add	a5,a5,a4
    8000a350:	6f9c                	ld	a5,24(a5)
    8000a352:	0027d783          	lhu	a5,2(a5)
    8000a356:	0006071b          	sext.w	a4,a2
    8000a35a:	2781                	sext.w	a5,a5
    8000a35c:	e8f71be3          	bne	a4,a5,8000a1f2 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    8000a360:	fdc42703          	lw	a4,-36(s0)
    8000a364:	15000793          	li	a5,336
    8000a368:	02f707b3          	mul	a5,a4,a5
    8000a36c:	13078713          	addi	a4,a5,304
    8000a370:	00034797          	auipc	a5,0x34
    8000a374:	91878793          	addi	a5,a5,-1768 # 8003dc88 <disk>
    8000a378:	97ba                	add	a5,a5,a4
    8000a37a:	853e                	mv	a0,a5
    8000a37c:	ffff7097          	auipc	ra,0xffff7
    8000a380:	050080e7          	jalr	80(ra) # 800013cc <release>
}
    8000a384:	0001                	nop
    8000a386:	70a2                	ld	ra,40(sp)
    8000a388:	7402                	ld	s0,32(sp)
    8000a38a:	6145                	addi	sp,sp,48
    8000a38c:	8082                	ret
	...

000000008000b000 <_trampoline>:
    8000b000:	14051073          	csrw	sscratch,a0
    8000b004:	02000537          	lui	a0,0x2000
    8000b008:	357d                	addiw	a0,a0,-1
    8000b00a:	0536                	slli	a0,a0,0xd
    8000b00c:	02153423          	sd	ra,40(a0) # 2000028 <_entry-0x7dffffd8>
    8000b010:	02253823          	sd	sp,48(a0)
    8000b014:	02353c23          	sd	gp,56(a0)
    8000b018:	04453023          	sd	tp,64(a0)
    8000b01c:	04553423          	sd	t0,72(a0)
    8000b020:	04653823          	sd	t1,80(a0)
    8000b024:	04753c23          	sd	t2,88(a0)
    8000b028:	f120                	sd	s0,96(a0)
    8000b02a:	f524                	sd	s1,104(a0)
    8000b02c:	fd2c                	sd	a1,120(a0)
    8000b02e:	e150                	sd	a2,128(a0)
    8000b030:	e554                	sd	a3,136(a0)
    8000b032:	e958                	sd	a4,144(a0)
    8000b034:	ed5c                	sd	a5,152(a0)
    8000b036:	0b053023          	sd	a6,160(a0)
    8000b03a:	0b153423          	sd	a7,168(a0)
    8000b03e:	0b253823          	sd	s2,176(a0)
    8000b042:	0b353c23          	sd	s3,184(a0)
    8000b046:	0d453023          	sd	s4,192(a0)
    8000b04a:	0d553423          	sd	s5,200(a0)
    8000b04e:	0d653823          	sd	s6,208(a0)
    8000b052:	0d753c23          	sd	s7,216(a0)
    8000b056:	0f853023          	sd	s8,224(a0)
    8000b05a:	0f953423          	sd	s9,232(a0)
    8000b05e:	0fa53823          	sd	s10,240(a0)
    8000b062:	0fb53c23          	sd	s11,248(a0)
    8000b066:	11c53023          	sd	t3,256(a0)
    8000b06a:	11d53423          	sd	t4,264(a0)
    8000b06e:	11e53823          	sd	t5,272(a0)
    8000b072:	11f53c23          	sd	t6,280(a0)
    8000b076:	140022f3          	csrr	t0,sscratch
    8000b07a:	06553823          	sd	t0,112(a0)
    8000b07e:	00853103          	ld	sp,8(a0)
    8000b082:	02053203          	ld	tp,32(a0)
    8000b086:	01053283          	ld	t0,16(a0)
    8000b08a:	00053303          	ld	t1,0(a0)
    8000b08e:	12000073          	sfence.vma
    8000b092:	18031073          	csrw	satp,t1
    8000b096:	12000073          	sfence.vma
    8000b09a:	8282                	jr	t0

000000008000b09c <userret>:
    8000b09c:	12000073          	sfence.vma
    8000b0a0:	18051073          	csrw	satp,a0
    8000b0a4:	12000073          	sfence.vma
    8000b0a8:	02000537          	lui	a0,0x2000
    8000b0ac:	357d                	addiw	a0,a0,-1
    8000b0ae:	0536                	slli	a0,a0,0xd
    8000b0b0:	02853083          	ld	ra,40(a0) # 2000028 <_entry-0x7dffffd8>
    8000b0b4:	03053103          	ld	sp,48(a0)
    8000b0b8:	03853183          	ld	gp,56(a0)
    8000b0bc:	04053203          	ld	tp,64(a0)
    8000b0c0:	04853283          	ld	t0,72(a0)
    8000b0c4:	05053303          	ld	t1,80(a0)
    8000b0c8:	05853383          	ld	t2,88(a0)
    8000b0cc:	7120                	ld	s0,96(a0)
    8000b0ce:	7524                	ld	s1,104(a0)
    8000b0d0:	7d2c                	ld	a1,120(a0)
    8000b0d2:	6150                	ld	a2,128(a0)
    8000b0d4:	6554                	ld	a3,136(a0)
    8000b0d6:	6958                	ld	a4,144(a0)
    8000b0d8:	6d5c                	ld	a5,152(a0)
    8000b0da:	0a053803          	ld	a6,160(a0)
    8000b0de:	0a853883          	ld	a7,168(a0)
    8000b0e2:	0b053903          	ld	s2,176(a0)
    8000b0e6:	0b853983          	ld	s3,184(a0)
    8000b0ea:	0c053a03          	ld	s4,192(a0)
    8000b0ee:	0c853a83          	ld	s5,200(a0)
    8000b0f2:	0d053b03          	ld	s6,208(a0)
    8000b0f6:	0d853b83          	ld	s7,216(a0)
    8000b0fa:	0e053c03          	ld	s8,224(a0)
    8000b0fe:	0e853c83          	ld	s9,232(a0)
    8000b102:	0f053d03          	ld	s10,240(a0)
    8000b106:	0f853d83          	ld	s11,248(a0)
    8000b10a:	10053e03          	ld	t3,256(a0)
    8000b10e:	10853e83          	ld	t4,264(a0)
    8000b112:	11053f03          	ld	t5,272(a0)
    8000b116:	11853f83          	ld	t6,280(a0)
    8000b11a:	7928                	ld	a0,112(a0)
    8000b11c:	10200073          	sret
	...
