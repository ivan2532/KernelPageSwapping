
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
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffa84cf>
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
    8000032a:	c0a78793          	addi	a5,a5,-1014 # 80008f30 <timervec>
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
    80000408:	906080e7          	jalr	-1786(ra) # 80003d0a <either_copyin>
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
    8000048a:	a00080e7          	jalr	-1536(ra) # 80002e86 <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	7c4080e7          	jalr	1988(ra) # 80003c56 <killed>
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
    800004c6:	586080e7          	jalr	1414(ra) # 80003a48 <sleep>
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
    80000582:	718080e7          	jalr	1816(ra) # 80003c96 <either_copyout>
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
    8000066c:	716080e7          	jalr	1814(ra) # 80003d7e <procdump>
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
    80000836:	292080e7          	jalr	658(ra) # 80003ac4 <wakeup>
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
    80000888:	00054797          	auipc	a5,0x54
    8000088c:	3a878793          	addi	a5,a5,936 # 80054c30 <devsw>
    80000890:	00000717          	auipc	a4,0x0
    80000894:	bc270713          	addi	a4,a4,-1086 # 80000452 <consoleread>
    80000898:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089a:	00054797          	auipc	a5,0x54
    8000089e:	39678793          	addi	a5,a5,918 # 80054c30 <devsw>
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
    80000e7c:	bd0080e7          	jalr	-1072(ra) # 80003a48 <sleep>
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
    80000fd4:	af4080e7          	jalr	-1292(ra) # 80003ac4 <wakeup>
    
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
    800010be:	00055517          	auipc	a0,0x55
    800010c2:	27250513          	addi	a0,a0,626 # 80056330 <end>
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
    8000114c:	00055797          	auipc	a5,0x55
    80001150:	1e478793          	addi	a5,a5,484 # 80056330 <end>
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
    80001232:	a74080e7          	jalr	-1420(ra) # 80001ca2 <getvictim>
    80001236:	fd043783          	ld	a5,-48(s0)
    8000123a:	faf43823          	sd	a5,-80(s0)
    8000123e:	fd843783          	ld	a5,-40(s0)
    80001242:	faf43c23          	sd	a5,-72(s0)
    80001246:	fe043783          	ld	a5,-32(s0)
    8000124a:	fcf43023          	sd	a5,-64(s0)
    8000124e:	fb040793          	addi	a5,s0,-80
    80001252:	853e                	mv	a0,a5
    80001254:	00001097          	auipc	ra,0x1
    80001258:	b58080e7          	jalr	-1192(ra) # 80001dac <swapout>
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
    800013b6:	a9a080e7          	jalr	-1382(ra) # 80002e4c <mycpu>
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
    80001442:	a0e080e7          	jalr	-1522(ra) # 80002e4c <mycpu>
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
    80001488:	9c8080e7          	jalr	-1592(ra) # 80002e4c <mycpu>
    8000148c:	87aa                	mv	a5,a0
    8000148e:	5fbc                	lw	a5,120(a5)
    80001490:	eb89                	bnez	a5,800014a2 <push_off+0x3c>
    mycpu()->intena = old;
    80001492:	00002097          	auipc	ra,0x2
    80001496:	9ba080e7          	jalr	-1606(ra) # 80002e4c <mycpu>
    8000149a:	872a                	mv	a4,a0
    8000149c:	fec42783          	lw	a5,-20(s0)
    800014a0:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    800014a2:	00002097          	auipc	ra,0x2
    800014a6:	9aa080e7          	jalr	-1622(ra) # 80002e4c <mycpu>
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
    800014ca:	986080e7          	jalr	-1658(ra) # 80002e4c <mycpu>
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
    800018fc:	530080e7          	jalr	1328(ra) # 80002e28 <cpuid>
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
    80001950:	6a0080e7          	jalr	1696(ra) # 80001fec <kvminit>
    kvminithart();   // turn on paging
    80001954:	00000097          	auipc	ra,0x0
    80001958:	6c6080e7          	jalr	1734(ra) # 8000201a <kvminithart>
    procinit();      // process table
    8000195c:	00001097          	auipc	ra,0x1
    80001960:	3fe080e7          	jalr	1022(ra) # 80002d5a <procinit>
    trapinit();      // trap vectors
    80001964:	00002097          	auipc	ra,0x2
    80001968:	702080e7          	jalr	1794(ra) # 80004066 <trapinit>
    trapinithart();  // install kernel trap vector
    8000196c:	00002097          	auipc	ra,0x2
    80001970:	724080e7          	jalr	1828(ra) # 80004090 <trapinithart>
    plicinit();      // set up interrupt controller
    80001974:	00007097          	auipc	ra,0x7
    80001978:	5e6080e7          	jalr	1510(ra) # 80008f5a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    8000197c:	00007097          	auipc	ra,0x7
    80001980:	60c080e7          	jalr	1548(ra) # 80008f88 <plicinithart>
    binit();         // buffer cache
    80001984:	00003097          	auipc	ra,0x3
    80001988:	178080e7          	jalr	376(ra) # 80004afc <binit>
    iinit();         // inode table
    8000198c:	00004097          	auipc	ra,0x4
    80001990:	9ce080e7          	jalr	-1586(ra) # 8000535a <iinit>
    fileinit();      // file table
    80001994:	00005097          	auipc	ra,0x5
    80001998:	3a2080e7          	jalr	930(ra) # 80006d36 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    8000199c:	0000a597          	auipc	a1,0xa
    800019a0:	70458593          	addi	a1,a1,1796 # 8000c0a0 <etext+0xa0>
    800019a4:	4501                	li	a0,0
    800019a6:	00008097          	auipc	ra,0x8
    800019aa:	8d8080e7          	jalr	-1832(ra) # 8000927e <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    800019ae:	0000a597          	auipc	a1,0xa
    800019b2:	70258593          	addi	a1,a1,1794 # 8000c0b0 <etext+0xb0>
    800019b6:	4505                	li	a0,1
    800019b8:	00008097          	auipc	ra,0x8
    800019bc:	8c6080e7          	jalr	-1850(ra) # 8000927e <virtio_disk_init>

    userinit();      // first user process
    800019c0:	00002097          	auipc	ra,0x2
    800019c4:	846080e7          	jalr	-1978(ra) # 80003206 <userinit>
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
    800019f2:	43a080e7          	jalr	1082(ra) # 80002e28 <cpuid>
    800019f6:	87aa                	mv	a5,a0
    800019f8:	85be                	mv	a1,a5
    800019fa:	0000a517          	auipc	a0,0xa
    800019fe:	6c650513          	addi	a0,a0,1734 # 8000c0c0 <etext+0xc0>
    80001a02:	fffff097          	auipc	ra,0xfffff
    80001a06:	034080e7          	jalr	52(ra) # 80000a36 <printf>
    kvminithart();    // turn on paging
    80001a0a:	00000097          	auipc	ra,0x0
    80001a0e:	610080e7          	jalr	1552(ra) # 8000201a <kvminithart>
    trapinithart();   // install kernel trap vector
    80001a12:	00002097          	auipc	ra,0x2
    80001a16:	67e080e7          	jalr	1662(ra) # 80004090 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    80001a1a:	00007097          	auipc	ra,0x7
    80001a1e:	56e080e7          	jalr	1390(ra) # 80008f88 <plicinithart>
  }

  scheduler();        
    80001a22:	00002097          	auipc	ra,0x2
    80001a26:	dfa080e7          	jalr	-518(ra) # 8000381c <scheduler>

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
#define LRUPAGESSIZE ((PHYSTOP - KERNBASE) / PGSIZE)*2
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

0000000080001aa2 <setpaddress>:

void
setpaddress(pte_t *pte, uint64 new_ppn)
{
    80001aa2:	7179                	addi	sp,sp,-48
    80001aa4:	f422                	sd	s0,40(sp)
    80001aa6:	1800                	addi	s0,sp,48
    80001aa8:	fca43c23          	sd	a0,-40(s0)
    80001aac:	fcb43823          	sd	a1,-48(s0)
  uint64 masked_pte = *pte & ~0x3FFFFFFFFFFFFL;
    80001ab0:	fd843783          	ld	a5,-40(s0)
    80001ab4:	6398                	ld	a4,0(a5)
    80001ab6:	57fd                	li	a5,-1
    80001ab8:	17ca                	slli	a5,a5,0x32
    80001aba:	8ff9                	and	a5,a5,a4
    80001abc:	fef43423          	sd	a5,-24(s0)
  uint64 new_ppn_shifted = (new_ppn << 10) & 0x3FFFFFFFFFFFFL;
    80001ac0:	fd043783          	ld	a5,-48(s0)
    80001ac4:	00a79713          	slli	a4,a5,0xa
    80001ac8:	57fd                	li	a5,-1
    80001aca:	83b9                	srli	a5,a5,0xe
    80001acc:	8ff9                	and	a5,a5,a4
    80001ace:	fef43023          	sd	a5,-32(s0)
  *pte = masked_pte | new_ppn_shifted;
    80001ad2:	fe843703          	ld	a4,-24(s0)
    80001ad6:	fe043783          	ld	a5,-32(s0)
    80001ada:	8f5d                	or	a4,a4,a5
    80001adc:	fd843783          	ld	a5,-40(s0)
    80001ae0:	e398                	sd	a4,0(a5)
}
    80001ae2:	0001                	nop
    80001ae4:	7422                	ld	s0,40(sp)
    80001ae6:	6145                	addi	sp,sp,48
    80001ae8:	8082                	ret

0000000080001aea <reglrupage>:

void
reglrupage(pte_t *pte, uint64 va)
{
    80001aea:	7179                	addi	sp,sp,-48
    80001aec:	f406                	sd	ra,40(sp)
    80001aee:	f022                	sd	s0,32(sp)
    80001af0:	1800                	addi	s0,sp,48
    80001af2:	fca43c23          	sd	a0,-40(s0)
    80001af6:	fcb43823          	sd	a1,-48(s0)
  uint64 i = getlruindex(va);
    80001afa:	fd043503          	ld	a0,-48(s0)
    80001afe:	00000097          	auipc	ra,0x0
    80001b02:	f58080e7          	jalr	-168(ra) # 80001a56 <getlruindex>
    80001b06:	fea43423          	sd	a0,-24(s0)
  lrupages[i].refhistory = (uchar)0;
    80001b0a:	00013697          	auipc	a3,0x13
    80001b0e:	0ae68693          	addi	a3,a3,174 # 80014bb8 <lrupages>
    80001b12:	fe843703          	ld	a4,-24(s0)
    80001b16:	87ba                	mv	a5,a4
    80001b18:	0786                	slli	a5,a5,0x1
    80001b1a:	97ba                	add	a5,a5,a4
    80001b1c:	078e                	slli	a5,a5,0x3
    80001b1e:	97b6                	add	a5,a5,a3
    80001b20:	00078023          	sb	zero,0(a5)
  lrupages[i].pte = pte;
    80001b24:	00013697          	auipc	a3,0x13
    80001b28:	09468693          	addi	a3,a3,148 # 80014bb8 <lrupages>
    80001b2c:	fe843703          	ld	a4,-24(s0)
    80001b30:	87ba                	mv	a5,a4
    80001b32:	0786                	slli	a5,a5,0x1
    80001b34:	97ba                	add	a5,a5,a4
    80001b36:	078e                	slli	a5,a5,0x3
    80001b38:	97b6                	add	a5,a5,a3
    80001b3a:	fd843703          	ld	a4,-40(s0)
    80001b3e:	e798                	sd	a4,8(a5)
  lrupages[i].va = va;
    80001b40:	00013697          	auipc	a3,0x13
    80001b44:	07868693          	addi	a3,a3,120 # 80014bb8 <lrupages>
    80001b48:	fe843703          	ld	a4,-24(s0)
    80001b4c:	87ba                	mv	a5,a4
    80001b4e:	0786                	slli	a5,a5,0x1
    80001b50:	97ba                	add	a5,a5,a4
    80001b52:	078e                	slli	a5,a5,0x3
    80001b54:	97b6                	add	a5,a5,a3
    80001b56:	fd043703          	ld	a4,-48(s0)
    80001b5a:	eb98                	sd	a4,16(a5)
}
    80001b5c:	0001                	nop
    80001b5e:	70a2                	ld	ra,40(sp)
    80001b60:	7402                	ld	s0,32(sp)
    80001b62:	6145                	addi	sp,sp,48
    80001b64:	8082                	ret

0000000080001b66 <unreglrupage>:

void
unreglrupage(uint64 va)
{
    80001b66:	7179                	addi	sp,sp,-48
    80001b68:	f406                	sd	ra,40(sp)
    80001b6a:	f022                	sd	s0,32(sp)
    80001b6c:	1800                	addi	s0,sp,48
    80001b6e:	fca43c23          	sd	a0,-40(s0)
  uint64 i = getlruindex(va);
    80001b72:	fd843503          	ld	a0,-40(s0)
    80001b76:	00000097          	auipc	ra,0x0
    80001b7a:	ee0080e7          	jalr	-288(ra) # 80001a56 <getlruindex>
    80001b7e:	fea43423          	sd	a0,-24(s0)
  lrupages[i].pte = 0;
    80001b82:	00013697          	auipc	a3,0x13
    80001b86:	03668693          	addi	a3,a3,54 # 80014bb8 <lrupages>
    80001b8a:	fe843703          	ld	a4,-24(s0)
    80001b8e:	87ba                	mv	a5,a4
    80001b90:	0786                	slli	a5,a5,0x1
    80001b92:	97ba                	add	a5,a5,a4
    80001b94:	078e                	slli	a5,a5,0x3
    80001b96:	97b6                	add	a5,a5,a3
    80001b98:	0007b423          	sd	zero,8(a5)
}
    80001b9c:	0001                	nop
    80001b9e:	70a2                	ld	ra,40(sp)
    80001ba0:	7402                	ld	s0,32(sp)
    80001ba2:	6145                	addi	sp,sp,48
    80001ba4:	8082                	ret

0000000080001ba6 <updaterefhistory>:

void
updaterefhistory()
{
    80001ba6:	1101                	addi	sp,sp,-32
    80001ba8:	ec22                	sd	s0,24(sp)
    80001baa:	1000                	addi	s0,sp,32
  uint64 i;
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001bac:	fe043423          	sd	zero,-24(s0)
    80001bb0:	a8f9                	j	80001c8e <updaterefhistory+0xe8>
  {
    if(lrupages[i].pte == 0) continue;
    80001bb2:	00013697          	auipc	a3,0x13
    80001bb6:	00668693          	addi	a3,a3,6 # 80014bb8 <lrupages>
    80001bba:	fe843703          	ld	a4,-24(s0)
    80001bbe:	87ba                	mv	a5,a4
    80001bc0:	0786                	slli	a5,a5,0x1
    80001bc2:	97ba                	add	a5,a5,a4
    80001bc4:	078e                	slli	a5,a5,0x3
    80001bc6:	97b6                	add	a5,a5,a3
    80001bc8:	679c                	ld	a5,8(a5)
    80001bca:	cfc5                	beqz	a5,80001c82 <updaterefhistory+0xdc>

    uchar a = ( *(lrupages[i].pte) & PTE_A ) == 0 ? 0 : 1;
    80001bcc:	00013697          	auipc	a3,0x13
    80001bd0:	fec68693          	addi	a3,a3,-20 # 80014bb8 <lrupages>
    80001bd4:	fe843703          	ld	a4,-24(s0)
    80001bd8:	87ba                	mv	a5,a4
    80001bda:	0786                	slli	a5,a5,0x1
    80001bdc:	97ba                	add	a5,a5,a4
    80001bde:	078e                	slli	a5,a5,0x3
    80001be0:	97b6                	add	a5,a5,a3
    80001be2:	679c                	ld	a5,8(a5)
    80001be4:	639c                	ld	a5,0(a5)
    80001be6:	0407f793          	andi	a5,a5,64
    80001bea:	00f037b3          	snez	a5,a5
    80001bee:	0ff7f793          	andi	a5,a5,255
    80001bf2:	fef403a3          	sb	a5,-25(s0)
    *(lrupages[i].pte) = (*lrupages[i].pte) & (~PTE_A);
    80001bf6:	00013697          	auipc	a3,0x13
    80001bfa:	fc268693          	addi	a3,a3,-62 # 80014bb8 <lrupages>
    80001bfe:	fe843703          	ld	a4,-24(s0)
    80001c02:	87ba                	mv	a5,a4
    80001c04:	0786                	slli	a5,a5,0x1
    80001c06:	97ba                	add	a5,a5,a4
    80001c08:	078e                	slli	a5,a5,0x3
    80001c0a:	97b6                	add	a5,a5,a3
    80001c0c:	679c                	ld	a5,8(a5)
    80001c0e:	6394                	ld	a3,0(a5)
    80001c10:	00013617          	auipc	a2,0x13
    80001c14:	fa860613          	addi	a2,a2,-88 # 80014bb8 <lrupages>
    80001c18:	fe843703          	ld	a4,-24(s0)
    80001c1c:	87ba                	mv	a5,a4
    80001c1e:	0786                	slli	a5,a5,0x1
    80001c20:	97ba                	add	a5,a5,a4
    80001c22:	078e                	slli	a5,a5,0x3
    80001c24:	97b2                	add	a5,a5,a2
    80001c26:	679c                	ld	a5,8(a5)
    80001c28:	fbf6f713          	andi	a4,a3,-65
    80001c2c:	e398                	sd	a4,0(a5)

    uchar mask = a << (sizeof(uchar) * 8 - 1);
    80001c2e:	fe744783          	lbu	a5,-25(s0)
    80001c32:	0077979b          	slliw	a5,a5,0x7
    80001c36:	fef40323          	sb	a5,-26(s0)
    lrupages[i].refhistory = (lrupages[i].refhistory >> 1) | mask;
    80001c3a:	00013697          	auipc	a3,0x13
    80001c3e:	f7e68693          	addi	a3,a3,-130 # 80014bb8 <lrupages>
    80001c42:	fe843703          	ld	a4,-24(s0)
    80001c46:	87ba                	mv	a5,a4
    80001c48:	0786                	slli	a5,a5,0x1
    80001c4a:	97ba                	add	a5,a5,a4
    80001c4c:	078e                	slli	a5,a5,0x3
    80001c4e:	97b6                	add	a5,a5,a3
    80001c50:	0007c783          	lbu	a5,0(a5)
    80001c54:	0017d79b          	srliw	a5,a5,0x1
    80001c58:	0ff7f713          	andi	a4,a5,255
    80001c5c:	fe644783          	lbu	a5,-26(s0)
    80001c60:	8fd9                	or	a5,a5,a4
    80001c62:	0ff7f693          	andi	a3,a5,255
    80001c66:	00013617          	auipc	a2,0x13
    80001c6a:	f5260613          	addi	a2,a2,-174 # 80014bb8 <lrupages>
    80001c6e:	fe843703          	ld	a4,-24(s0)
    80001c72:	87ba                	mv	a5,a4
    80001c74:	0786                	slli	a5,a5,0x1
    80001c76:	97ba                	add	a5,a5,a4
    80001c78:	078e                	slli	a5,a5,0x3
    80001c7a:	97b2                	add	a5,a5,a2
    80001c7c:	00d78023          	sb	a3,0(a5)
    80001c80:	a011                	j	80001c84 <updaterefhistory+0xde>
    if(lrupages[i].pte == 0) continue;
    80001c82:	0001                	nop
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001c84:	fe843783          	ld	a5,-24(s0)
    80001c88:	0785                	addi	a5,a5,1
    80001c8a:	fef43423          	sd	a5,-24(s0)
    80001c8e:	fe843703          	ld	a4,-24(s0)
    80001c92:	6789                	lui	a5,0x2
    80001c94:	f0f76fe3          	bltu	a4,a5,80001bb2 <updaterefhistory+0xc>
  }
}
    80001c98:	0001                	nop
    80001c9a:	0001                	nop
    80001c9c:	6462                	ld	s0,24(sp)
    80001c9e:	6105                	addi	sp,sp,32
    80001ca0:	8082                	ret

0000000080001ca2 <getvictim>:

struct lrupinfo
getvictim()
{
    80001ca2:	715d                	addi	sp,sp,-80
    80001ca4:	e4a2                	sd	s0,72(sp)
    80001ca6:	0880                	addi	s0,sp,80
    80001ca8:	faa43c23          	sd	a0,-72(s0)
  uint64 i;
  uchar minhistory = ~0;
    80001cac:	57fd                	li	a5,-1
    80001cae:	fef403a3          	sb	a5,-25(s0)
  struct lrupinfo result = lrupages[0];
    80001cb2:	00013797          	auipc	a5,0x13
    80001cb6:	f0678793          	addi	a5,a5,-250 # 80014bb8 <lrupages>
    80001cba:	6398                	ld	a4,0(a5)
    80001cbc:	fce43023          	sd	a4,-64(s0)
    80001cc0:	6798                	ld	a4,8(a5)
    80001cc2:	fce43423          	sd	a4,-56(s0)
    80001cc6:	6b9c                	ld	a5,16(a5)
    80001cc8:	fcf43823          	sd	a5,-48(s0)
  result.pte = 0;
    80001ccc:	fc043423          	sd	zero,-56(s0)

  for(i = 0; i < LRUPAGESSIZE; i++)
    80001cd0:	fe043423          	sd	zero,-24(s0)
    80001cd4:	a07d                	j	80001d82 <getvictim+0xe0>
  {
    pte_t *pte = lrupages[i].pte;
    80001cd6:	00013697          	auipc	a3,0x13
    80001cda:	ee268693          	addi	a3,a3,-286 # 80014bb8 <lrupages>
    80001cde:	fe843703          	ld	a4,-24(s0)
    80001ce2:	87ba                	mv	a5,a4
    80001ce4:	0786                	slli	a5,a5,0x1
    80001ce6:	97ba                	add	a5,a5,a4
    80001ce8:	078e                	slli	a5,a5,0x3
    80001cea:	97b6                	add	a5,a5,a3
    80001cec:	679c                	ld	a5,8(a5)
    80001cee:	fcf43c23          	sd	a5,-40(s0)
    if(pte == 0) continue;
    80001cf2:	fd843783          	ld	a5,-40(s0)
    80001cf6:	cfb5                	beqz	a5,80001d72 <getvictim+0xd0>
    if(*pte & PTE_ON_DISK) continue;
    80001cf8:	fd843783          	ld	a5,-40(s0)
    80001cfc:	639c                	ld	a5,0(a5)
    80001cfe:	1007f793          	andi	a5,a5,256
    80001d02:	ebb5                	bnez	a5,80001d76 <getvictim+0xd4>

    if(lrupages[i].refhistory < minhistory)
    80001d04:	00013697          	auipc	a3,0x13
    80001d08:	eb468693          	addi	a3,a3,-332 # 80014bb8 <lrupages>
    80001d0c:	fe843703          	ld	a4,-24(s0)
    80001d10:	87ba                	mv	a5,a4
    80001d12:	0786                	slli	a5,a5,0x1
    80001d14:	97ba                	add	a5,a5,a4
    80001d16:	078e                	slli	a5,a5,0x3
    80001d18:	97b6                	add	a5,a5,a3
    80001d1a:	0007c703          	lbu	a4,0(a5)
    80001d1e:	fe744783          	lbu	a5,-25(s0)
    80001d22:	0ff7f793          	andi	a5,a5,255
    80001d26:	04f77963          	bgeu	a4,a5,80001d78 <getvictim+0xd6>
    {
      result = lrupages[i];
    80001d2a:	00013697          	auipc	a3,0x13
    80001d2e:	e8e68693          	addi	a3,a3,-370 # 80014bb8 <lrupages>
    80001d32:	fe843703          	ld	a4,-24(s0)
    80001d36:	87ba                	mv	a5,a4
    80001d38:	0786                	slli	a5,a5,0x1
    80001d3a:	97ba                	add	a5,a5,a4
    80001d3c:	078e                	slli	a5,a5,0x3
    80001d3e:	97b6                	add	a5,a5,a3
    80001d40:	6398                	ld	a4,0(a5)
    80001d42:	fce43023          	sd	a4,-64(s0)
    80001d46:	6798                	ld	a4,8(a5)
    80001d48:	fce43423          	sd	a4,-56(s0)
    80001d4c:	6b9c                	ld	a5,16(a5)
    80001d4e:	fcf43823          	sd	a5,-48(s0)
      minhistory = lrupages[i].refhistory;
    80001d52:	00013697          	auipc	a3,0x13
    80001d56:	e6668693          	addi	a3,a3,-410 # 80014bb8 <lrupages>
    80001d5a:	fe843703          	ld	a4,-24(s0)
    80001d5e:	87ba                	mv	a5,a4
    80001d60:	0786                	slli	a5,a5,0x1
    80001d62:	97ba                	add	a5,a5,a4
    80001d64:	078e                	slli	a5,a5,0x3
    80001d66:	97b6                	add	a5,a5,a3
    80001d68:	0007c783          	lbu	a5,0(a5)
    80001d6c:	fef403a3          	sb	a5,-25(s0)
    80001d70:	a021                	j	80001d78 <getvictim+0xd6>
    if(pte == 0) continue;
    80001d72:	0001                	nop
    80001d74:	a011                	j	80001d78 <getvictim+0xd6>
    if(*pte & PTE_ON_DISK) continue;
    80001d76:	0001                	nop
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001d78:	fe843783          	ld	a5,-24(s0)
    80001d7c:	0785                	addi	a5,a5,1
    80001d7e:	fef43423          	sd	a5,-24(s0)
    80001d82:	fe843703          	ld	a4,-24(s0)
    80001d86:	6789                	lui	a5,0x2
    80001d88:	f4f767e3          	bltu	a4,a5,80001cd6 <getvictim+0x34>
    }
  }

  return result;
    80001d8c:	fb843783          	ld	a5,-72(s0)
    80001d90:	fc043703          	ld	a4,-64(s0)
    80001d94:	e398                	sd	a4,0(a5)
    80001d96:	fc843703          	ld	a4,-56(s0)
    80001d9a:	e798                	sd	a4,8(a5)
    80001d9c:	fd043703          	ld	a4,-48(s0)
    80001da0:	eb98                	sd	a4,16(a5)
}
    80001da2:	fb843503          	ld	a0,-72(s0)
    80001da6:	6426                	ld	s0,72(sp)
    80001da8:	6161                	addi	sp,sp,80
    80001daa:	8082                	ret

0000000080001dac <swapout>:

// Returns free page
void*
swapout(struct lrupinfo pinfo)
{
    80001dac:	7179                	addi	sp,sp,-48
    80001dae:	f406                	sd	ra,40(sp)
    80001db0:	f022                	sd	s0,32(sp)
    80001db2:	1800                	addi	s0,sp,48
    80001db4:	80aa                	mv	ra,a0
  pte_t *pte = pinfo.pte;
    80001db6:	0080b783          	ld	a5,8(ra)
    80001dba:	fef43423          	sd	a5,-24(s0)
  uchar *data = (uchar*)getpaddress(pte);
    80001dbe:	fe843503          	ld	a0,-24(s0)
    80001dc2:	00000097          	auipc	ra,0x0
    80001dc6:	cac080e7          	jalr	-852(ra) # 80001a6e <getpaddress>
    80001dca:	87aa                	mv	a5,a0
    80001dcc:	fef43023          	sd	a5,-32(s0)
  int pageno = write_page(data);
    80001dd0:	fe043503          	ld	a0,-32(s0)
    80001dd4:	00008097          	auipc	ra,0x8
    80001dd8:	590080e7          	jalr	1424(ra) # 8000a364 <write_page>
    80001ddc:	87aa                	mv	a5,a0
    80001dde:	fcf42e23          	sw	a5,-36(s0)
  if(pageno < 0)
    80001de2:	fdc42783          	lw	a5,-36(s0)
    80001de6:	2781                	sext.w	a5,a5
    80001de8:	0007d463          	bgez	a5,80001df0 <swapout+0x44>
    return 0;
    80001dec:	4781                	li	a5,0
    80001dee:	a03d                	j	80001e1c <swapout+0x70>

  //setpaddress(pte, (uint64)pageno);
  *pte &= ~PTE_V; // V = 0
    80001df0:	fe843783          	ld	a5,-24(s0)
    80001df4:	639c                	ld	a5,0(a5)
    80001df6:	ffe7f713          	andi	a4,a5,-2
    80001dfa:	fe843783          	ld	a5,-24(s0)
    80001dfe:	e398                	sd	a4,0(a5)
  *pte |= PTE_ON_DISK; // ON_DISK = 1
    80001e00:	fe843783          	ld	a5,-24(s0)
    80001e04:	639c                	ld	a5,0(a5)
    80001e06:	1007e713          	ori	a4,a5,256
    80001e0a:	fe843783          	ld	a5,-24(s0)
    80001e0e:	e398                	sd	a4,0(a5)

  sfence_vma(); // Flush TLB
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	c34080e7          	jalr	-972(ra) # 80001a44 <sfence_vma>

  return (void*)data;
    80001e18:	fe043783          	ld	a5,-32(s0)
}
    80001e1c:	853e                	mv	a0,a5
    80001e1e:	70a2                	ld	ra,40(sp)
    80001e20:	7402                	ld	s0,32(sp)
    80001e22:	6145                	addi	sp,sp,48
    80001e24:	8082                	ret

0000000080001e26 <swapin>:

int
swapin(uint64 va)
{
    80001e26:	7139                	addi	sp,sp,-64
    80001e28:	fc06                	sd	ra,56(sp)
    80001e2a:	f822                	sd	s0,48(sp)
    80001e2c:	0080                	addi	s0,sp,64
    80001e2e:	fca43423          	sd	a0,-56(s0)
  uint64 lruindex = getlruindex(va);
    80001e32:	fc843503          	ld	a0,-56(s0)
    80001e36:	00000097          	auipc	ra,0x0
    80001e3a:	c20080e7          	jalr	-992(ra) # 80001a56 <getlruindex>
    80001e3e:	fea43423          	sd	a0,-24(s0)
  pte_t *pte = lrupages[lruindex].pte;
    80001e42:	00013697          	auipc	a3,0x13
    80001e46:	d7668693          	addi	a3,a3,-650 # 80014bb8 <lrupages>
    80001e4a:	fe843703          	ld	a4,-24(s0)
    80001e4e:	87ba                	mv	a5,a4
    80001e50:	0786                	slli	a5,a5,0x1
    80001e52:	97ba                	add	a5,a5,a4
    80001e54:	078e                	slli	a5,a5,0x3
    80001e56:	97b6                	add	a5,a5,a3
    80001e58:	679c                	ld	a5,8(a5)
    80001e5a:	fef43023          	sd	a5,-32(s0)

  if((*pte & PTE_ON_DISK) == 0)
    80001e5e:	fe043783          	ld	a5,-32(s0)
    80001e62:	639c                	ld	a5,0(a5)
    80001e64:	1007f793          	andi	a5,a5,256
    80001e68:	e399                	bnez	a5,80001e6e <swapin+0x48>
    return 0;
    80001e6a:	4781                	li	a5,0
    80001e6c:	a899                	j	80001ec2 <swapin+0x9c>

  uchar *data = kalloc();
    80001e6e:	fffff097          	auipc	ra,0xfffff
    80001e72:	368080e7          	jalr	872(ra) # 800011d6 <kalloc>
    80001e76:	fca43c23          	sd	a0,-40(s0)
  read_page((int)getpaddress(pte), data);
    80001e7a:	fe043503          	ld	a0,-32(s0)
    80001e7e:	00000097          	auipc	ra,0x0
    80001e82:	bf0080e7          	jalr	-1040(ra) # 80001a6e <getpaddress>
    80001e86:	87aa                	mv	a5,a0
    80001e88:	2781                	sext.w	a5,a5
    80001e8a:	fd843583          	ld	a1,-40(s0)
    80001e8e:	853e                	mv	a0,a5
    80001e90:	00008097          	auipc	ra,0x8
    80001e94:	56e080e7          	jalr	1390(ra) # 8000a3fe <read_page>

  *pte |= PTE_V; // V = 1
    80001e98:	fe043783          	ld	a5,-32(s0)
    80001e9c:	639c                	ld	a5,0(a5)
    80001e9e:	0017e713          	ori	a4,a5,1
    80001ea2:	fe043783          	ld	a5,-32(s0)
    80001ea6:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_ON_DISK; // ON_DISK = 0
    80001ea8:	fe043783          	ld	a5,-32(s0)
    80001eac:	639c                	ld	a5,0(a5)
    80001eae:	eff7f713          	andi	a4,a5,-257
    80001eb2:	fe043783          	ld	a5,-32(s0)
    80001eb6:	e398                	sd	a4,0(a5)

  sfence_vma(); // Flush TLB
    80001eb8:	00000097          	auipc	ra,0x0
    80001ebc:	b8c080e7          	jalr	-1140(ra) # 80001a44 <sfence_vma>

  return 1;
    80001ec0:	4785                	li	a5,1
}
    80001ec2:	853e                	mv	a0,a5
    80001ec4:	70e2                	ld	ra,56(sp)
    80001ec6:	7442                	ld	s0,48(sp)
    80001ec8:	6121                	addi	sp,sp,64
    80001eca:	8082                	ret

0000000080001ecc <kvmmake>:

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001ecc:	1101                	addi	sp,sp,-32
    80001ece:	ec06                	sd	ra,24(sp)
    80001ed0:	e822                	sd	s0,16(sp)
    80001ed2:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001ed4:	fffff097          	auipc	ra,0xfffff
    80001ed8:	302080e7          	jalr	770(ra) # 800011d6 <kalloc>
    80001edc:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001ee0:	6605                	lui	a2,0x1
    80001ee2:	4581                	li	a1,0
    80001ee4:	fe843503          	ld	a0,-24(s0)
    80001ee8:	fffff097          	auipc	ra,0xfffff
    80001eec:	654080e7          	jalr	1620(ra) # 8000153c <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001ef0:	4719                	li	a4,6
    80001ef2:	6685                	lui	a3,0x1
    80001ef4:	10000637          	lui	a2,0x10000
    80001ef8:	100005b7          	lui	a1,0x10000
    80001efc:	fe843503          	ld	a0,-24(s0)
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	300080e7          	jalr	768(ra) # 80002200 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001f08:	4719                	li	a4,6
    80001f0a:	6685                	lui	a3,0x1
    80001f0c:	10001637          	lui	a2,0x10001
    80001f10:	100015b7          	lui	a1,0x10001
    80001f14:	fe843503          	ld	a0,-24(s0)
    80001f18:	00000097          	auipc	ra,0x0
    80001f1c:	2e8080e7          	jalr	744(ra) # 80002200 <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001f20:	4719                	li	a4,6
    80001f22:	6685                	lui	a3,0x1
    80001f24:	10002637          	lui	a2,0x10002
    80001f28:	100025b7          	lui	a1,0x10002
    80001f2c:	fe843503          	ld	a0,-24(s0)
    80001f30:	00000097          	auipc	ra,0x0
    80001f34:	2d0080e7          	jalr	720(ra) # 80002200 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001f38:	4719                	li	a4,6
    80001f3a:	004006b7          	lui	a3,0x400
    80001f3e:	0c000637          	lui	a2,0xc000
    80001f42:	0c0005b7          	lui	a1,0xc000
    80001f46:	fe843503          	ld	a0,-24(s0)
    80001f4a:	00000097          	auipc	ra,0x0
    80001f4e:	2b6080e7          	jalr	694(ra) # 80002200 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001f52:	0000a717          	auipc	a4,0xa
    80001f56:	0ae70713          	addi	a4,a4,174 # 8000c000 <etext>
    80001f5a:	800007b7          	lui	a5,0x80000
    80001f5e:	97ba                	add	a5,a5,a4
    80001f60:	4729                	li	a4,10
    80001f62:	86be                	mv	a3,a5
    80001f64:	4785                	li	a5,1
    80001f66:	01f79613          	slli	a2,a5,0x1f
    80001f6a:	4785                	li	a5,1
    80001f6c:	01f79593          	slli	a1,a5,0x1f
    80001f70:	fe843503          	ld	a0,-24(s0)
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	28c080e7          	jalr	652(ra) # 80002200 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001f7c:	0000a597          	auipc	a1,0xa
    80001f80:	08458593          	addi	a1,a1,132 # 8000c000 <etext>
    80001f84:	0000a617          	auipc	a2,0xa
    80001f88:	07c60613          	addi	a2,a2,124 # 8000c000 <etext>
    80001f8c:	0000a797          	auipc	a5,0xa
    80001f90:	07478793          	addi	a5,a5,116 # 8000c000 <etext>
    80001f94:	08100713          	li	a4,129
    80001f98:	0762                	slli	a4,a4,0x18
    80001f9a:	40f707b3          	sub	a5,a4,a5
    80001f9e:	4719                	li	a4,6
    80001fa0:	86be                	mv	a3,a5
    80001fa2:	fe843503          	ld	a0,-24(s0)
    80001fa6:	00000097          	auipc	ra,0x0
    80001faa:	25a080e7          	jalr	602(ra) # 80002200 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001fae:	00009797          	auipc	a5,0x9
    80001fb2:	05278793          	addi	a5,a5,82 # 8000b000 <_trampoline>
    80001fb6:	4729                	li	a4,10
    80001fb8:	6685                	lui	a3,0x1
    80001fba:	863e                	mv	a2,a5
    80001fbc:	040007b7          	lui	a5,0x4000
    80001fc0:	17fd                	addi	a5,a5,-1
    80001fc2:	00c79593          	slli	a1,a5,0xc
    80001fc6:	fe843503          	ld	a0,-24(s0)
    80001fca:	00000097          	auipc	ra,0x0
    80001fce:	236080e7          	jalr	566(ra) # 80002200 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001fd2:	fe843503          	ld	a0,-24(s0)
    80001fd6:	00001097          	auipc	ra,0x1
    80001fda:	cc8080e7          	jalr	-824(ra) # 80002c9e <proc_mapstacks>
  
  return kpgtbl;
    80001fde:	fe843783          	ld	a5,-24(s0)
}
    80001fe2:	853e                	mv	a0,a5
    80001fe4:	60e2                	ld	ra,24(sp)
    80001fe6:	6442                	ld	s0,16(sp)
    80001fe8:	6105                	addi	sp,sp,32
    80001fea:	8082                	ret

0000000080001fec <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001fec:	1141                	addi	sp,sp,-16
    80001fee:	e406                	sd	ra,8(sp)
    80001ff0:	e022                	sd	s0,0(sp)
    80001ff2:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001ff4:	00000097          	auipc	ra,0x0
    80001ff8:	ed8080e7          	jalr	-296(ra) # 80001ecc <kvmmake>
    80001ffc:	872a                	mv	a4,a0
    80001ffe:	0000b797          	auipc	a5,0xb
    80002002:	93a78793          	addi	a5,a5,-1734 # 8000c938 <kernel_pagetable>
    80002006:	e398                	sd	a4,0(a5)
  updaterefhistory();
    80002008:	00000097          	auipc	ra,0x0
    8000200c:	b9e080e7          	jalr	-1122(ra) # 80001ba6 <updaterefhistory>
}
    80002010:	0001                	nop
    80002012:	60a2                	ld	ra,8(sp)
    80002014:	6402                	ld	s0,0(sp)
    80002016:	0141                	addi	sp,sp,16
    80002018:	8082                	ret

000000008000201a <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    8000201a:	1141                	addi	sp,sp,-16
    8000201c:	e406                	sd	ra,8(sp)
    8000201e:	e022                	sd	s0,0(sp)
    80002020:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80002022:	00000097          	auipc	ra,0x0
    80002026:	a22080e7          	jalr	-1502(ra) # 80001a44 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    8000202a:	0000b797          	auipc	a5,0xb
    8000202e:	90e78793          	addi	a5,a5,-1778 # 8000c938 <kernel_pagetable>
    80002032:	639c                	ld	a5,0(a5)
    80002034:	00c7d713          	srli	a4,a5,0xc
    80002038:	57fd                	li	a5,-1
    8000203a:	17fe                	slli	a5,a5,0x3f
    8000203c:	8fd9                	or	a5,a5,a4
    8000203e:	853e                	mv	a0,a5
    80002040:	00000097          	auipc	ra,0x0
    80002044:	9ea080e7          	jalr	-1558(ra) # 80001a2a <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80002048:	00000097          	auipc	ra,0x0
    8000204c:	9fc080e7          	jalr	-1540(ra) # 80001a44 <sfence_vma>
}
    80002050:	0001                	nop
    80002052:	60a2                	ld	ra,8(sp)
    80002054:	6402                	ld	s0,0(sp)
    80002056:	0141                	addi	sp,sp,16
    80002058:	8082                	ret

000000008000205a <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    8000205a:	7139                	addi	sp,sp,-64
    8000205c:	fc06                	sd	ra,56(sp)
    8000205e:	f822                	sd	s0,48(sp)
    80002060:	0080                	addi	s0,sp,64
    80002062:	fca43c23          	sd	a0,-40(s0)
    80002066:	fcb43823          	sd	a1,-48(s0)
    8000206a:	87b2                	mv	a5,a2
    8000206c:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80002070:	fd043703          	ld	a4,-48(s0)
    80002074:	57fd                	li	a5,-1
    80002076:	83e9                	srli	a5,a5,0x1a
    80002078:	00e7f463          	bgeu	a5,a4,80002080 <walk+0x26>
    return 0;
    8000207c:	4781                	li	a5,0
    8000207e:	a8f9                	j	8000215c <walk+0x102>

  for(int level = 2; level > 0; level--) {
    80002080:	4789                	li	a5,2
    80002082:	fef42623          	sw	a5,-20(s0)
    80002086:	a86d                	j	80002140 <walk+0xe6>
    pte_t *pte = &pagetable[PX(level, va)];
    80002088:	fec42703          	lw	a4,-20(s0)
    8000208c:	87ba                	mv	a5,a4
    8000208e:	0037979b          	slliw	a5,a5,0x3
    80002092:	9fb9                	addw	a5,a5,a4
    80002094:	2781                	sext.w	a5,a5
    80002096:	27b1                	addiw	a5,a5,12
    80002098:	2781                	sext.w	a5,a5
    8000209a:	873e                	mv	a4,a5
    8000209c:	fd043783          	ld	a5,-48(s0)
    800020a0:	00e7d7b3          	srl	a5,a5,a4
    800020a4:	1ff7f793          	andi	a5,a5,511
    800020a8:	078e                	slli	a5,a5,0x3
    800020aa:	fd843703          	ld	a4,-40(s0)
    800020ae:	97ba                	add	a5,a5,a4
    800020b0:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    800020b4:	fe043783          	ld	a5,-32(s0)
    800020b8:	639c                	ld	a5,0(a5)
    800020ba:	8b85                	andi	a5,a5,1
    800020bc:	cb89                	beqz	a5,800020ce <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    800020be:	fe043783          	ld	a5,-32(s0)
    800020c2:	639c                	ld	a5,0(a5)
    800020c4:	83a9                	srli	a5,a5,0xa
    800020c6:	07b2                	slli	a5,a5,0xc
    800020c8:	fcf43c23          	sd	a5,-40(s0)
    800020cc:	a0ad                	j	80002136 <walk+0xdc>
    }
    else if(*pte & PTE_ON_DISK) {
    800020ce:	fe043783          	ld	a5,-32(s0)
    800020d2:	639c                	ld	a5,0(a5)
    800020d4:	1007f793          	andi	a5,a5,256
    800020d8:	cf99                	beqz	a5,800020f6 <walk+0x9c>
      swapin(va);
    800020da:	fd043503          	ld	a0,-48(s0)
    800020de:	00000097          	auipc	ra,0x0
    800020e2:	d48080e7          	jalr	-696(ra) # 80001e26 <swapin>
      pagetable = (pagetable_t)PTE2PA(*pte);
    800020e6:	fe043783          	ld	a5,-32(s0)
    800020ea:	639c                	ld	a5,0(a5)
    800020ec:	83a9                	srli	a5,a5,0xa
    800020ee:	07b2                	slli	a5,a5,0xc
    800020f0:	fcf43c23          	sd	a5,-40(s0)
    800020f4:	a089                	j	80002136 <walk+0xdc>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    800020f6:	fcc42783          	lw	a5,-52(s0)
    800020fa:	2781                	sext.w	a5,a5
    800020fc:	cb91                	beqz	a5,80002110 <walk+0xb6>
    800020fe:	fffff097          	auipc	ra,0xfffff
    80002102:	0d8080e7          	jalr	216(ra) # 800011d6 <kalloc>
    80002106:	fca43c23          	sd	a0,-40(s0)
    8000210a:	fd843783          	ld	a5,-40(s0)
    8000210e:	e399                	bnez	a5,80002114 <walk+0xba>
        return 0;
    80002110:	4781                	li	a5,0
    80002112:	a0a9                	j	8000215c <walk+0x102>
      memset(pagetable, 0, PGSIZE);
    80002114:	6605                	lui	a2,0x1
    80002116:	4581                	li	a1,0
    80002118:	fd843503          	ld	a0,-40(s0)
    8000211c:	fffff097          	auipc	ra,0xfffff
    80002120:	420080e7          	jalr	1056(ra) # 8000153c <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80002124:	fd843783          	ld	a5,-40(s0)
    80002128:	83b1                	srli	a5,a5,0xc
    8000212a:	07aa                	slli	a5,a5,0xa
    8000212c:	0017e713          	ori	a4,a5,1
    80002130:	fe043783          	ld	a5,-32(s0)
    80002134:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80002136:	fec42783          	lw	a5,-20(s0)
    8000213a:	37fd                	addiw	a5,a5,-1
    8000213c:	fef42623          	sw	a5,-20(s0)
    80002140:	fec42783          	lw	a5,-20(s0)
    80002144:	2781                	sext.w	a5,a5
    80002146:	f4f041e3          	bgtz	a5,80002088 <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    8000214a:	fd043783          	ld	a5,-48(s0)
    8000214e:	83b1                	srli	a5,a5,0xc
    80002150:	1ff7f793          	andi	a5,a5,511
    80002154:	078e                	slli	a5,a5,0x3
    80002156:	fd843703          	ld	a4,-40(s0)
    8000215a:	97ba                	add	a5,a5,a4
}
    8000215c:	853e                	mv	a0,a5
    8000215e:	70e2                	ld	ra,56(sp)
    80002160:	7442                	ld	s0,48(sp)
    80002162:	6121                	addi	sp,sp,64
    80002164:	8082                	ret

0000000080002166 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80002166:	7179                	addi	sp,sp,-48
    80002168:	f406                	sd	ra,40(sp)
    8000216a:	f022                	sd	s0,32(sp)
    8000216c:	1800                	addi	s0,sp,48
    8000216e:	fca43c23          	sd	a0,-40(s0)
    80002172:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80002176:	fd043703          	ld	a4,-48(s0)
    8000217a:	57fd                	li	a5,-1
    8000217c:	83e9                	srli	a5,a5,0x1a
    8000217e:	00e7f463          	bgeu	a5,a4,80002186 <walkaddr+0x20>
    return 0;
    80002182:	4781                	li	a5,0
    80002184:	a88d                	j	800021f6 <walkaddr+0x90>

  pte = walk(pagetable, va, 0);
    80002186:	4601                	li	a2,0
    80002188:	fd043583          	ld	a1,-48(s0)
    8000218c:	fd843503          	ld	a0,-40(s0)
    80002190:	00000097          	auipc	ra,0x0
    80002194:	eca080e7          	jalr	-310(ra) # 8000205a <walk>
    80002198:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    8000219c:	fe843783          	ld	a5,-24(s0)
    800021a0:	e399                	bnez	a5,800021a6 <walkaddr+0x40>
    return 0;
    800021a2:	4781                	li	a5,0
    800021a4:	a889                	j	800021f6 <walkaddr+0x90>
  if((*pte & PTE_V) == 0 && (*pte & PTE_ON_DISK) != 0)
    800021a6:	fe843783          	ld	a5,-24(s0)
    800021aa:	639c                	ld	a5,0(a5)
    800021ac:	8b85                	andi	a5,a5,1
    800021ae:	ef89                	bnez	a5,800021c8 <walkaddr+0x62>
    800021b0:	fe843783          	ld	a5,-24(s0)
    800021b4:	639c                	ld	a5,0(a5)
    800021b6:	1007f793          	andi	a5,a5,256
    800021ba:	c799                	beqz	a5,800021c8 <walkaddr+0x62>
    swapin(va);
    800021bc:	fd043503          	ld	a0,-48(s0)
    800021c0:	00000097          	auipc	ra,0x0
    800021c4:	c66080e7          	jalr	-922(ra) # 80001e26 <swapin>
  if((*pte & PTE_V) == 0)
    800021c8:	fe843783          	ld	a5,-24(s0)
    800021cc:	639c                	ld	a5,0(a5)
    800021ce:	8b85                	andi	a5,a5,1
    800021d0:	e399                	bnez	a5,800021d6 <walkaddr+0x70>
    return 0;
    800021d2:	4781                	li	a5,0
    800021d4:	a00d                	j	800021f6 <walkaddr+0x90>
  if((*pte & PTE_U) == 0)
    800021d6:	fe843783          	ld	a5,-24(s0)
    800021da:	639c                	ld	a5,0(a5)
    800021dc:	8bc1                	andi	a5,a5,16
    800021de:	e399                	bnez	a5,800021e4 <walkaddr+0x7e>
    return 0;
    800021e0:	4781                	li	a5,0
    800021e2:	a811                	j	800021f6 <walkaddr+0x90>
  pa = PTE2PA(*pte);
    800021e4:	fe843783          	ld	a5,-24(s0)
    800021e8:	639c                	ld	a5,0(a5)
    800021ea:	83a9                	srli	a5,a5,0xa
    800021ec:	07b2                	slli	a5,a5,0xc
    800021ee:	fef43023          	sd	a5,-32(s0)
  return pa;
    800021f2:	fe043783          	ld	a5,-32(s0)
}
    800021f6:	853e                	mv	a0,a5
    800021f8:	70a2                	ld	ra,40(sp)
    800021fa:	7402                	ld	s0,32(sp)
    800021fc:	6145                	addi	sp,sp,48
    800021fe:	8082                	ret

0000000080002200 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80002200:	7139                	addi	sp,sp,-64
    80002202:	fc06                	sd	ra,56(sp)
    80002204:	f822                	sd	s0,48(sp)
    80002206:	0080                	addi	s0,sp,64
    80002208:	fea43423          	sd	a0,-24(s0)
    8000220c:	feb43023          	sd	a1,-32(s0)
    80002210:	fcc43c23          	sd	a2,-40(s0)
    80002214:	fcd43823          	sd	a3,-48(s0)
    80002218:	87ba                	mv	a5,a4
    8000221a:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    8000221e:	fcc42783          	lw	a5,-52(s0)
    80002222:	873e                	mv	a4,a5
    80002224:	fd843683          	ld	a3,-40(s0)
    80002228:	fd043603          	ld	a2,-48(s0)
    8000222c:	fe043583          	ld	a1,-32(s0)
    80002230:	fe843503          	ld	a0,-24(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	026080e7          	jalr	38(ra) # 8000225a <mappages>
    8000223c:	87aa                	mv	a5,a0
    8000223e:	cb89                	beqz	a5,80002250 <kvmmap+0x50>
    panic("kvmmap");
    80002240:	0000a517          	auipc	a0,0xa
    80002244:	e9850513          	addi	a0,a0,-360 # 8000c0d8 <etext+0xd8>
    80002248:	fffff097          	auipc	ra,0xfffff
    8000224c:	a44080e7          	jalr	-1468(ra) # 80000c8c <panic>
}
    80002250:	0001                	nop
    80002252:	70e2                	ld	ra,56(sp)
    80002254:	7442                	ld	s0,48(sp)
    80002256:	6121                	addi	sp,sp,64
    80002258:	8082                	ret

000000008000225a <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    8000225a:	711d                	addi	sp,sp,-96
    8000225c:	ec86                	sd	ra,88(sp)
    8000225e:	e8a2                	sd	s0,80(sp)
    80002260:	1080                	addi	s0,sp,96
    80002262:	fca43423          	sd	a0,-56(s0)
    80002266:	fcb43023          	sd	a1,-64(s0)
    8000226a:	fac43c23          	sd	a2,-72(s0)
    8000226e:	fad43823          	sd	a3,-80(s0)
    80002272:	87ba                	mv	a5,a4
    80002274:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80002278:	fb843783          	ld	a5,-72(s0)
    8000227c:	eb89                	bnez	a5,8000228e <mappages+0x34>
    panic("mappages: size");
    8000227e:	0000a517          	auipc	a0,0xa
    80002282:	e6250513          	addi	a0,a0,-414 # 8000c0e0 <etext+0xe0>
    80002286:	fffff097          	auipc	ra,0xfffff
    8000228a:	a06080e7          	jalr	-1530(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    8000228e:	fc043703          	ld	a4,-64(s0)
    80002292:	77fd                	lui	a5,0xfffff
    80002294:	8ff9                	and	a5,a5,a4
    80002296:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    8000229a:	fc043703          	ld	a4,-64(s0)
    8000229e:	fb843783          	ld	a5,-72(s0)
    800022a2:	97ba                	add	a5,a5,a4
    800022a4:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffa8ccf>
    800022a8:	77fd                	lui	a5,0xfffff
    800022aa:	8ff9                	and	a5,a5,a4
    800022ac:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    800022b0:	4605                	li	a2,1
    800022b2:	fe843583          	ld	a1,-24(s0)
    800022b6:	fc843503          	ld	a0,-56(s0)
    800022ba:	00000097          	auipc	ra,0x0
    800022be:	da0080e7          	jalr	-608(ra) # 8000205a <walk>
    800022c2:	fca43c23          	sd	a0,-40(s0)
    800022c6:	fd843783          	ld	a5,-40(s0)
    800022ca:	e399                	bnez	a5,800022d0 <mappages+0x76>
      return -1;
    800022cc:	57fd                	li	a5,-1
    800022ce:	a059                	j	80002354 <mappages+0xfa>
    if(*pte & PTE_V || *pte & PTE_ON_DISK)
    800022d0:	fd843783          	ld	a5,-40(s0)
    800022d4:	639c                	ld	a5,0(a5)
    800022d6:	8b85                	andi	a5,a5,1
    800022d8:	e799                	bnez	a5,800022e6 <mappages+0x8c>
    800022da:	fd843783          	ld	a5,-40(s0)
    800022de:	639c                	ld	a5,0(a5)
    800022e0:	1007f793          	andi	a5,a5,256
    800022e4:	cb89                	beqz	a5,800022f6 <mappages+0x9c>
      panic("mappages: remap");
    800022e6:	0000a517          	auipc	a0,0xa
    800022ea:	e0a50513          	addi	a0,a0,-502 # 8000c0f0 <etext+0xf0>
    800022ee:	fffff097          	auipc	ra,0xfffff
    800022f2:	99e080e7          	jalr	-1634(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    800022f6:	fb043783          	ld	a5,-80(s0)
    800022fa:	83b1                	srli	a5,a5,0xc
    800022fc:	00a79713          	slli	a4,a5,0xa
    80002300:	fac42783          	lw	a5,-84(s0)
    80002304:	8fd9                	or	a5,a5,a4
    80002306:	0017e713          	ori	a4,a5,1
    8000230a:	fd843783          	ld	a5,-40(s0)
    8000230e:	e398                	sd	a4,0(a5)
    if(*pte & PTE_U)
    80002310:	fd843783          	ld	a5,-40(s0)
    80002314:	639c                	ld	a5,0(a5)
    80002316:	8bc1                	andi	a5,a5,16
    80002318:	cb89                	beqz	a5,8000232a <mappages+0xd0>
      reglrupage(pte, a);
    8000231a:	fe843583          	ld	a1,-24(s0)
    8000231e:	fd843503          	ld	a0,-40(s0)
    80002322:	fffff097          	auipc	ra,0xfffff
    80002326:	7c8080e7          	jalr	1992(ra) # 80001aea <reglrupage>
    if(a == last)
    8000232a:	fe843703          	ld	a4,-24(s0)
    8000232e:	fe043783          	ld	a5,-32(s0)
    80002332:	00f70f63          	beq	a4,a5,80002350 <mappages+0xf6>
      break;
    a += PGSIZE;
    80002336:	fe843703          	ld	a4,-24(s0)
    8000233a:	6785                	lui	a5,0x1
    8000233c:	97ba                	add	a5,a5,a4
    8000233e:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80002342:	fb043703          	ld	a4,-80(s0)
    80002346:	6785                	lui	a5,0x1
    80002348:	97ba                	add	a5,a5,a4
    8000234a:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    8000234e:	b78d                	j	800022b0 <mappages+0x56>
      break;
    80002350:	0001                	nop
  }
  return 0;
    80002352:	4781                	li	a5,0
}
    80002354:	853e                	mv	a0,a5
    80002356:	60e6                	ld	ra,88(sp)
    80002358:	6446                	ld	s0,80(sp)
    8000235a:	6125                	addi	sp,sp,96
    8000235c:	8082                	ret

000000008000235e <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    8000235e:	715d                	addi	sp,sp,-80
    80002360:	e486                	sd	ra,72(sp)
    80002362:	e0a2                	sd	s0,64(sp)
    80002364:	0880                	addi	s0,sp,80
    80002366:	fca43423          	sd	a0,-56(s0)
    8000236a:	fcb43023          	sd	a1,-64(s0)
    8000236e:	fac43c23          	sd	a2,-72(s0)
    80002372:	87b6                	mv	a5,a3
    80002374:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80002378:	fc043703          	ld	a4,-64(s0)
    8000237c:	6785                	lui	a5,0x1
    8000237e:	17fd                	addi	a5,a5,-1
    80002380:	8ff9                	and	a5,a5,a4
    80002382:	cb89                	beqz	a5,80002394 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80002384:	0000a517          	auipc	a0,0xa
    80002388:	d7c50513          	addi	a0,a0,-644 # 8000c100 <etext+0x100>
    8000238c:	fffff097          	auipc	ra,0xfffff
    80002390:	900080e7          	jalr	-1792(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80002394:	fc043783          	ld	a5,-64(s0)
    80002398:	fef43423          	sd	a5,-24(s0)
    8000239c:	a8d9                	j	80002472 <uvmunmap+0x114>
    if((pte = walk(pagetable, a, 0)) == 0)
    8000239e:	4601                	li	a2,0
    800023a0:	fe843583          	ld	a1,-24(s0)
    800023a4:	fc843503          	ld	a0,-56(s0)
    800023a8:	00000097          	auipc	ra,0x0
    800023ac:	cb2080e7          	jalr	-846(ra) # 8000205a <walk>
    800023b0:	fea43023          	sd	a0,-32(s0)
    800023b4:	fe043783          	ld	a5,-32(s0)
    800023b8:	eb89                	bnez	a5,800023ca <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    800023ba:	0000a517          	auipc	a0,0xa
    800023be:	d5e50513          	addi	a0,a0,-674 # 8000c118 <etext+0x118>
    800023c2:	fffff097          	auipc	ra,0xfffff
    800023c6:	8ca080e7          	jalr	-1846(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0 && (*pte & PTE_ON_DISK) == 0)
    800023ca:	fe043783          	ld	a5,-32(s0)
    800023ce:	639c                	ld	a5,0(a5)
    800023d0:	8b85                	andi	a5,a5,1
    800023d2:	ef99                	bnez	a5,800023f0 <uvmunmap+0x92>
    800023d4:	fe043783          	ld	a5,-32(s0)
    800023d8:	639c                	ld	a5,0(a5)
    800023da:	1007f793          	andi	a5,a5,256
    800023de:	eb89                	bnez	a5,800023f0 <uvmunmap+0x92>
      panic("uvmunmap: not mapped");
    800023e0:	0000a517          	auipc	a0,0xa
    800023e4:	d4850513          	addi	a0,a0,-696 # 8000c128 <etext+0x128>
    800023e8:	fffff097          	auipc	ra,0xfffff
    800023ec:	8a4080e7          	jalr	-1884(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    800023f0:	fe043783          	ld	a5,-32(s0)
    800023f4:	639c                	ld	a5,0(a5)
    800023f6:	3ff7f713          	andi	a4,a5,1023
    800023fa:	4785                	li	a5,1
    800023fc:	00f71a63          	bne	a4,a5,80002410 <uvmunmap+0xb2>
      panic("uvmunmap: not a leaf");
    80002400:	0000a517          	auipc	a0,0xa
    80002404:	d4050513          	addi	a0,a0,-704 # 8000c140 <etext+0x140>
    80002408:	fffff097          	auipc	ra,0xfffff
    8000240c:	884080e7          	jalr	-1916(ra) # 80000c8c <panic>
    if(do_free){
    80002410:	fb442783          	lw	a5,-76(s0)
    80002414:	2781                	sext.w	a5,a5
    80002416:	c7a1                	beqz	a5,8000245e <uvmunmap+0x100>
      unreglrupage(a);
    80002418:	fe843503          	ld	a0,-24(s0)
    8000241c:	fffff097          	auipc	ra,0xfffff
    80002420:	74a080e7          	jalr	1866(ra) # 80001b66 <unreglrupage>
      uint64 pa = PTE2PA(*pte);
    80002424:	fe043783          	ld	a5,-32(s0)
    80002428:	639c                	ld	a5,0(a5)
    8000242a:	83a9                	srli	a5,a5,0xa
    8000242c:	07b2                	slli	a5,a5,0xc
    8000242e:	fcf43c23          	sd	a5,-40(s0)
      if(*pte & PTE_ON_DISK)
    80002432:	fe043783          	ld	a5,-32(s0)
    80002436:	639c                	ld	a5,0(a5)
    80002438:	1007f793          	andi	a5,a5,256
    8000243c:	cb91                	beqz	a5,80002450 <uvmunmap+0xf2>
        deallocate_page((int)pa);
    8000243e:	fd843783          	ld	a5,-40(s0)
    80002442:	2781                	sext.w	a5,a5
    80002444:	853e                	mv	a0,a5
    80002446:	00008097          	auipc	ra,0x8
    8000244a:	ef0080e7          	jalr	-272(ra) # 8000a336 <deallocate_page>
    8000244e:	a801                	j	8000245e <uvmunmap+0x100>
      else
        kfree((void*)pa);
    80002450:	fd843783          	ld	a5,-40(s0)
    80002454:	853e                	mv	a0,a5
    80002456:	fffff097          	auipc	ra,0xfffff
    8000245a:	cda080e7          	jalr	-806(ra) # 80001130 <kfree>
    }
    *pte = 0;
    8000245e:	fe043783          	ld	a5,-32(s0)
    80002462:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80002466:	fe843703          	ld	a4,-24(s0)
    8000246a:	6785                	lui	a5,0x1
    8000246c:	97ba                	add	a5,a5,a4
    8000246e:	fef43423          	sd	a5,-24(s0)
    80002472:	fb843783          	ld	a5,-72(s0)
    80002476:	00c79713          	slli	a4,a5,0xc
    8000247a:	fc043783          	ld	a5,-64(s0)
    8000247e:	97ba                	add	a5,a5,a4
    80002480:	fe843703          	ld	a4,-24(s0)
    80002484:	f0f76de3          	bltu	a4,a5,8000239e <uvmunmap+0x40>
  }
}
    80002488:	0001                	nop
    8000248a:	0001                	nop
    8000248c:	60a6                	ld	ra,72(sp)
    8000248e:	6406                	ld	s0,64(sp)
    80002490:	6161                	addi	sp,sp,80
    80002492:	8082                	ret

0000000080002494 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80002494:	1101                	addi	sp,sp,-32
    80002496:	ec06                	sd	ra,24(sp)
    80002498:	e822                	sd	s0,16(sp)
    8000249a:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    8000249c:	fffff097          	auipc	ra,0xfffff
    800024a0:	d3a080e7          	jalr	-710(ra) # 800011d6 <kalloc>
    800024a4:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    800024a8:	fe843783          	ld	a5,-24(s0)
    800024ac:	e399                	bnez	a5,800024b2 <uvmcreate+0x1e>
    return 0;
    800024ae:	4781                	li	a5,0
    800024b0:	a819                	j	800024c6 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    800024b2:	6605                	lui	a2,0x1
    800024b4:	4581                	li	a1,0
    800024b6:	fe843503          	ld	a0,-24(s0)
    800024ba:	fffff097          	auipc	ra,0xfffff
    800024be:	082080e7          	jalr	130(ra) # 8000153c <memset>
  return pagetable;
    800024c2:	fe843783          	ld	a5,-24(s0)
}
    800024c6:	853e                	mv	a0,a5
    800024c8:	60e2                	ld	ra,24(sp)
    800024ca:	6442                	ld	s0,16(sp)
    800024cc:	6105                	addi	sp,sp,32
    800024ce:	8082                	ret

00000000800024d0 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    800024d0:	7139                	addi	sp,sp,-64
    800024d2:	fc06                	sd	ra,56(sp)
    800024d4:	f822                	sd	s0,48(sp)
    800024d6:	0080                	addi	s0,sp,64
    800024d8:	fca43c23          	sd	a0,-40(s0)
    800024dc:	fcb43823          	sd	a1,-48(s0)
    800024e0:	87b2                	mv	a5,a2
    800024e2:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    800024e6:	fcc42783          	lw	a5,-52(s0)
    800024ea:	0007871b          	sext.w	a4,a5
    800024ee:	6785                	lui	a5,0x1
    800024f0:	00f76a63          	bltu	a4,a5,80002504 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    800024f4:	0000a517          	auipc	a0,0xa
    800024f8:	c6450513          	addi	a0,a0,-924 # 8000c158 <etext+0x158>
    800024fc:	ffffe097          	auipc	ra,0xffffe
    80002500:	790080e7          	jalr	1936(ra) # 80000c8c <panic>
  mem = kalloc();
    80002504:	fffff097          	auipc	ra,0xfffff
    80002508:	cd2080e7          	jalr	-814(ra) # 800011d6 <kalloc>
    8000250c:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80002510:	6605                	lui	a2,0x1
    80002512:	4581                	li	a1,0
    80002514:	fe843503          	ld	a0,-24(s0)
    80002518:	fffff097          	auipc	ra,0xfffff
    8000251c:	024080e7          	jalr	36(ra) # 8000153c <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80002520:	fe843783          	ld	a5,-24(s0)
    80002524:	4779                	li	a4,30
    80002526:	86be                	mv	a3,a5
    80002528:	6605                	lui	a2,0x1
    8000252a:	4581                	li	a1,0
    8000252c:	fd843503          	ld	a0,-40(s0)
    80002530:	00000097          	auipc	ra,0x0
    80002534:	d2a080e7          	jalr	-726(ra) # 8000225a <mappages>
  memmove(mem, src, sz);
    80002538:	fcc42783          	lw	a5,-52(s0)
    8000253c:	863e                	mv	a2,a5
    8000253e:	fd043583          	ld	a1,-48(s0)
    80002542:	fe843503          	ld	a0,-24(s0)
    80002546:	fffff097          	auipc	ra,0xfffff
    8000254a:	0da080e7          	jalr	218(ra) # 80001620 <memmove>
}
    8000254e:	0001                	nop
    80002550:	70e2                	ld	ra,56(sp)
    80002552:	7442                	ld	s0,48(sp)
    80002554:	6121                	addi	sp,sp,64
    80002556:	8082                	ret

0000000080002558 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    80002558:	7139                	addi	sp,sp,-64
    8000255a:	fc06                	sd	ra,56(sp)
    8000255c:	f822                	sd	s0,48(sp)
    8000255e:	0080                	addi	s0,sp,64
    80002560:	fca43c23          	sd	a0,-40(s0)
    80002564:	fcb43823          	sd	a1,-48(s0)
    80002568:	fcc43423          	sd	a2,-56(s0)
    8000256c:	87b6                	mv	a5,a3
    8000256e:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80002572:	fc843703          	ld	a4,-56(s0)
    80002576:	fd043783          	ld	a5,-48(s0)
    8000257a:	00f77563          	bgeu	a4,a5,80002584 <uvmalloc+0x2c>
    return oldsz;
    8000257e:	fd043783          	ld	a5,-48(s0)
    80002582:	a87d                	j	80002640 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80002584:	fd043703          	ld	a4,-48(s0)
    80002588:	6785                	lui	a5,0x1
    8000258a:	17fd                	addi	a5,a5,-1
    8000258c:	973e                	add	a4,a4,a5
    8000258e:	77fd                	lui	a5,0xfffff
    80002590:	8ff9                	and	a5,a5,a4
    80002592:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002596:	fd043783          	ld	a5,-48(s0)
    8000259a:	fef43423          	sd	a5,-24(s0)
    8000259e:	a849                	j	80002630 <uvmalloc+0xd8>
    mem = kalloc();
    800025a0:	fffff097          	auipc	ra,0xfffff
    800025a4:	c36080e7          	jalr	-970(ra) # 800011d6 <kalloc>
    800025a8:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    800025ac:	fe043783          	ld	a5,-32(s0)
    800025b0:	ef89                	bnez	a5,800025ca <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    800025b2:	fd043603          	ld	a2,-48(s0)
    800025b6:	fe843583          	ld	a1,-24(s0)
    800025ba:	fd843503          	ld	a0,-40(s0)
    800025be:	00000097          	auipc	ra,0x0
    800025c2:	08c080e7          	jalr	140(ra) # 8000264a <uvmdealloc>
      return 0;
    800025c6:	4781                	li	a5,0
    800025c8:	a8a5                	j	80002640 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    800025ca:	6605                	lui	a2,0x1
    800025cc:	4581                	li	a1,0
    800025ce:	fe043503          	ld	a0,-32(s0)
    800025d2:	fffff097          	auipc	ra,0xfffff
    800025d6:	f6a080e7          	jalr	-150(ra) # 8000153c <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    800025da:	fe043683          	ld	a3,-32(s0)
    800025de:	fc442783          	lw	a5,-60(s0)
    800025e2:	0127e793          	ori	a5,a5,18
    800025e6:	2781                	sext.w	a5,a5
    800025e8:	873e                	mv	a4,a5
    800025ea:	6605                	lui	a2,0x1
    800025ec:	fe843583          	ld	a1,-24(s0)
    800025f0:	fd843503          	ld	a0,-40(s0)
    800025f4:	00000097          	auipc	ra,0x0
    800025f8:	c66080e7          	jalr	-922(ra) # 8000225a <mappages>
    800025fc:	87aa                	mv	a5,a0
    800025fe:	c39d                	beqz	a5,80002624 <uvmalloc+0xcc>
      kfree(mem);
    80002600:	fe043503          	ld	a0,-32(s0)
    80002604:	fffff097          	auipc	ra,0xfffff
    80002608:	b2c080e7          	jalr	-1236(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    8000260c:	fd043603          	ld	a2,-48(s0)
    80002610:	fe843583          	ld	a1,-24(s0)
    80002614:	fd843503          	ld	a0,-40(s0)
    80002618:	00000097          	auipc	ra,0x0
    8000261c:	032080e7          	jalr	50(ra) # 8000264a <uvmdealloc>
      return 0;
    80002620:	4781                	li	a5,0
    80002622:	a839                	j	80002640 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002624:	fe843703          	ld	a4,-24(s0)
    80002628:	6785                	lui	a5,0x1
    8000262a:	97ba                	add	a5,a5,a4
    8000262c:	fef43423          	sd	a5,-24(s0)
    80002630:	fe843703          	ld	a4,-24(s0)
    80002634:	fc843783          	ld	a5,-56(s0)
    80002638:	f6f764e3          	bltu	a4,a5,800025a0 <uvmalloc+0x48>
    }
  }
  return newsz;
    8000263c:	fc843783          	ld	a5,-56(s0)
}
    80002640:	853e                	mv	a0,a5
    80002642:	70e2                	ld	ra,56(sp)
    80002644:	7442                	ld	s0,48(sp)
    80002646:	6121                	addi	sp,sp,64
    80002648:	8082                	ret

000000008000264a <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    8000264a:	7139                	addi	sp,sp,-64
    8000264c:	fc06                	sd	ra,56(sp)
    8000264e:	f822                	sd	s0,48(sp)
    80002650:	0080                	addi	s0,sp,64
    80002652:	fca43c23          	sd	a0,-40(s0)
    80002656:	fcb43823          	sd	a1,-48(s0)
    8000265a:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    8000265e:	fc843703          	ld	a4,-56(s0)
    80002662:	fd043783          	ld	a5,-48(s0)
    80002666:	00f76563          	bltu	a4,a5,80002670 <uvmdealloc+0x26>
    return oldsz;
    8000266a:	fd043783          	ld	a5,-48(s0)
    8000266e:	a885                	j	800026de <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002670:	fc843703          	ld	a4,-56(s0)
    80002674:	6785                	lui	a5,0x1
    80002676:	17fd                	addi	a5,a5,-1
    80002678:	973e                	add	a4,a4,a5
    8000267a:	77fd                	lui	a5,0xfffff
    8000267c:	8f7d                	and	a4,a4,a5
    8000267e:	fd043683          	ld	a3,-48(s0)
    80002682:	6785                	lui	a5,0x1
    80002684:	17fd                	addi	a5,a5,-1
    80002686:	96be                	add	a3,a3,a5
    80002688:	77fd                	lui	a5,0xfffff
    8000268a:	8ff5                	and	a5,a5,a3
    8000268c:	04f77763          	bgeu	a4,a5,800026da <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002690:	fd043703          	ld	a4,-48(s0)
    80002694:	6785                	lui	a5,0x1
    80002696:	17fd                	addi	a5,a5,-1
    80002698:	973e                	add	a4,a4,a5
    8000269a:	77fd                	lui	a5,0xfffff
    8000269c:	8f7d                	and	a4,a4,a5
    8000269e:	fc843683          	ld	a3,-56(s0)
    800026a2:	6785                	lui	a5,0x1
    800026a4:	17fd                	addi	a5,a5,-1
    800026a6:	96be                	add	a3,a3,a5
    800026a8:	77fd                	lui	a5,0xfffff
    800026aa:	8ff5                	and	a5,a5,a3
    800026ac:	40f707b3          	sub	a5,a4,a5
    800026b0:	83b1                	srli	a5,a5,0xc
    800026b2:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    800026b6:	fc843703          	ld	a4,-56(s0)
    800026ba:	6785                	lui	a5,0x1
    800026bc:	17fd                	addi	a5,a5,-1
    800026be:	973e                	add	a4,a4,a5
    800026c0:	77fd                	lui	a5,0xfffff
    800026c2:	8ff9                	and	a5,a5,a4
    800026c4:	fec42703          	lw	a4,-20(s0)
    800026c8:	4685                	li	a3,1
    800026ca:	863a                	mv	a2,a4
    800026cc:	85be                	mv	a1,a5
    800026ce:	fd843503          	ld	a0,-40(s0)
    800026d2:	00000097          	auipc	ra,0x0
    800026d6:	c8c080e7          	jalr	-884(ra) # 8000235e <uvmunmap>
  }

  return newsz;
    800026da:	fc843783          	ld	a5,-56(s0)
}
    800026de:	853e                	mv	a0,a5
    800026e0:	70e2                	ld	ra,56(sp)
    800026e2:	7442                	ld	s0,48(sp)
    800026e4:	6121                	addi	sp,sp,64
    800026e6:	8082                	ret

00000000800026e8 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    800026e8:	7139                	addi	sp,sp,-64
    800026ea:	fc06                	sd	ra,56(sp)
    800026ec:	f822                	sd	s0,48(sp)
    800026ee:	0080                	addi	s0,sp,64
    800026f0:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    800026f4:	fe042623          	sw	zero,-20(s0)
    800026f8:	a88d                	j	8000276a <freewalk+0x82>
    pte_t pte = pagetable[i];
    800026fa:	fec42783          	lw	a5,-20(s0)
    800026fe:	078e                	slli	a5,a5,0x3
    80002700:	fc843703          	ld	a4,-56(s0)
    80002704:	97ba                	add	a5,a5,a4
    80002706:	639c                	ld	a5,0(a5)
    80002708:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000270c:	fe043783          	ld	a5,-32(s0)
    80002710:	8b85                	andi	a5,a5,1
    80002712:	cb9d                	beqz	a5,80002748 <freewalk+0x60>
    80002714:	fe043783          	ld	a5,-32(s0)
    80002718:	8bb9                	andi	a5,a5,14
    8000271a:	e79d                	bnez	a5,80002748 <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    8000271c:	fe043783          	ld	a5,-32(s0)
    80002720:	83a9                	srli	a5,a5,0xa
    80002722:	07b2                	slli	a5,a5,0xc
    80002724:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    80002728:	fd843783          	ld	a5,-40(s0)
    8000272c:	853e                	mv	a0,a5
    8000272e:	00000097          	auipc	ra,0x0
    80002732:	fba080e7          	jalr	-70(ra) # 800026e8 <freewalk>
      pagetable[i] = 0;
    80002736:	fec42783          	lw	a5,-20(s0)
    8000273a:	078e                	slli	a5,a5,0x3
    8000273c:	fc843703          	ld	a4,-56(s0)
    80002740:	97ba                	add	a5,a5,a4
    80002742:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffa8cd0>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002746:	a829                	j	80002760 <freewalk+0x78>
    } else if(pte & PTE_V){
    80002748:	fe043783          	ld	a5,-32(s0)
    8000274c:	8b85                	andi	a5,a5,1
    8000274e:	cb89                	beqz	a5,80002760 <freewalk+0x78>
      panic("freewalk: leaf");
    80002750:	0000a517          	auipc	a0,0xa
    80002754:	a2850513          	addi	a0,a0,-1496 # 8000c178 <etext+0x178>
    80002758:	ffffe097          	auipc	ra,0xffffe
    8000275c:	534080e7          	jalr	1332(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    80002760:	fec42783          	lw	a5,-20(s0)
    80002764:	2785                	addiw	a5,a5,1
    80002766:	fef42623          	sw	a5,-20(s0)
    8000276a:	fec42783          	lw	a5,-20(s0)
    8000276e:	0007871b          	sext.w	a4,a5
    80002772:	1ff00793          	li	a5,511
    80002776:	f8e7d2e3          	bge	a5,a4,800026fa <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000277a:	fc843503          	ld	a0,-56(s0)
    8000277e:	fffff097          	auipc	ra,0xfffff
    80002782:	9b2080e7          	jalr	-1614(ra) # 80001130 <kfree>
}
    80002786:	0001                	nop
    80002788:	70e2                	ld	ra,56(sp)
    8000278a:	7442                	ld	s0,48(sp)
    8000278c:	6121                	addi	sp,sp,64
    8000278e:	8082                	ret

0000000080002790 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002790:	1101                	addi	sp,sp,-32
    80002792:	ec06                	sd	ra,24(sp)
    80002794:	e822                	sd	s0,16(sp)
    80002796:	1000                	addi	s0,sp,32
    80002798:	fea43423          	sd	a0,-24(s0)
    8000279c:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    800027a0:	fe043783          	ld	a5,-32(s0)
    800027a4:	c385                	beqz	a5,800027c4 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    800027a6:	fe043703          	ld	a4,-32(s0)
    800027aa:	6785                	lui	a5,0x1
    800027ac:	17fd                	addi	a5,a5,-1
    800027ae:	97ba                	add	a5,a5,a4
    800027b0:	83b1                	srli	a5,a5,0xc
    800027b2:	4685                	li	a3,1
    800027b4:	863e                	mv	a2,a5
    800027b6:	4581                	li	a1,0
    800027b8:	fe843503          	ld	a0,-24(s0)
    800027bc:	00000097          	auipc	ra,0x0
    800027c0:	ba2080e7          	jalr	-1118(ra) # 8000235e <uvmunmap>
  freewalk(pagetable);
    800027c4:	fe843503          	ld	a0,-24(s0)
    800027c8:	00000097          	auipc	ra,0x0
    800027cc:	f20080e7          	jalr	-224(ra) # 800026e8 <freewalk>
}
    800027d0:	0001                	nop
    800027d2:	60e2                	ld	ra,24(sp)
    800027d4:	6442                	ld	s0,16(sp)
    800027d6:	6105                	addi	sp,sp,32
    800027d8:	8082                	ret

00000000800027da <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    800027da:	711d                	addi	sp,sp,-96
    800027dc:	ec86                	sd	ra,88(sp)
    800027de:	e8a2                	sd	s0,80(sp)
    800027e0:	1080                	addi	s0,sp,96
    800027e2:	faa43c23          	sd	a0,-72(s0)
    800027e6:	fab43823          	sd	a1,-80(s0)
    800027ea:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    800027ee:	fe043423          	sd	zero,-24(s0)
    800027f2:	a0d9                	j	800028b8 <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    800027f4:	4601                	li	a2,0
    800027f6:	fe843583          	ld	a1,-24(s0)
    800027fa:	fb843503          	ld	a0,-72(s0)
    800027fe:	00000097          	auipc	ra,0x0
    80002802:	85c080e7          	jalr	-1956(ra) # 8000205a <walk>
    80002806:	fea43023          	sd	a0,-32(s0)
    8000280a:	fe043783          	ld	a5,-32(s0)
    8000280e:	eb89                	bnez	a5,80002820 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002810:	0000a517          	auipc	a0,0xa
    80002814:	97850513          	addi	a0,a0,-1672 # 8000c188 <etext+0x188>
    80002818:	ffffe097          	auipc	ra,0xffffe
    8000281c:	474080e7          	jalr	1140(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80002820:	fe043783          	ld	a5,-32(s0)
    80002824:	639c                	ld	a5,0(a5)
    80002826:	8b85                	andi	a5,a5,1
    80002828:	eb89                	bnez	a5,8000283a <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    8000282a:	0000a517          	auipc	a0,0xa
    8000282e:	97e50513          	addi	a0,a0,-1666 # 8000c1a8 <etext+0x1a8>
    80002832:	ffffe097          	auipc	ra,0xffffe
    80002836:	45a080e7          	jalr	1114(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    8000283a:	fe043783          	ld	a5,-32(s0)
    8000283e:	639c                	ld	a5,0(a5)
    80002840:	83a9                	srli	a5,a5,0xa
    80002842:	07b2                	slli	a5,a5,0xc
    80002844:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    80002848:	fe043783          	ld	a5,-32(s0)
    8000284c:	639c                	ld	a5,0(a5)
    8000284e:	2781                	sext.w	a5,a5
    80002850:	3ff7f793          	andi	a5,a5,1023
    80002854:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    80002858:	fffff097          	auipc	ra,0xfffff
    8000285c:	97e080e7          	jalr	-1666(ra) # 800011d6 <kalloc>
    80002860:	fca43423          	sd	a0,-56(s0)
    80002864:	fc843783          	ld	a5,-56(s0)
    80002868:	c3a5                	beqz	a5,800028c8 <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000286a:	fd843783          	ld	a5,-40(s0)
    8000286e:	6605                	lui	a2,0x1
    80002870:	85be                	mv	a1,a5
    80002872:	fc843503          	ld	a0,-56(s0)
    80002876:	fffff097          	auipc	ra,0xfffff
    8000287a:	daa080e7          	jalr	-598(ra) # 80001620 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    8000287e:	fc843783          	ld	a5,-56(s0)
    80002882:	fd442703          	lw	a4,-44(s0)
    80002886:	86be                	mv	a3,a5
    80002888:	6605                	lui	a2,0x1
    8000288a:	fe843583          	ld	a1,-24(s0)
    8000288e:	fb043503          	ld	a0,-80(s0)
    80002892:	00000097          	auipc	ra,0x0
    80002896:	9c8080e7          	jalr	-1592(ra) # 8000225a <mappages>
    8000289a:	87aa                	mv	a5,a0
    8000289c:	cb81                	beqz	a5,800028ac <uvmcopy+0xd2>
      kfree(mem);
    8000289e:	fc843503          	ld	a0,-56(s0)
    800028a2:	fffff097          	auipc	ra,0xfffff
    800028a6:	88e080e7          	jalr	-1906(ra) # 80001130 <kfree>
      goto err;
    800028aa:	a005                	j	800028ca <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    800028ac:	fe843703          	ld	a4,-24(s0)
    800028b0:	6785                	lui	a5,0x1
    800028b2:	97ba                	add	a5,a5,a4
    800028b4:	fef43423          	sd	a5,-24(s0)
    800028b8:	fe843703          	ld	a4,-24(s0)
    800028bc:	fa843783          	ld	a5,-88(s0)
    800028c0:	f2f76ae3          	bltu	a4,a5,800027f4 <uvmcopy+0x1a>
    }
  }
  return 0;
    800028c4:	4781                	li	a5,0
    800028c6:	a839                	j	800028e4 <uvmcopy+0x10a>
      goto err;
    800028c8:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    800028ca:	fe843783          	ld	a5,-24(s0)
    800028ce:	83b1                	srli	a5,a5,0xc
    800028d0:	4685                	li	a3,1
    800028d2:	863e                	mv	a2,a5
    800028d4:	4581                	li	a1,0
    800028d6:	fb043503          	ld	a0,-80(s0)
    800028da:	00000097          	auipc	ra,0x0
    800028de:	a84080e7          	jalr	-1404(ra) # 8000235e <uvmunmap>
  return -1;
    800028e2:	57fd                	li	a5,-1
}
    800028e4:	853e                	mv	a0,a5
    800028e6:	60e6                	ld	ra,88(sp)
    800028e8:	6446                	ld	s0,80(sp)
    800028ea:	6125                	addi	sp,sp,96
    800028ec:	8082                	ret

00000000800028ee <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    800028ee:	7179                	addi	sp,sp,-48
    800028f0:	f406                	sd	ra,40(sp)
    800028f2:	f022                	sd	s0,32(sp)
    800028f4:	1800                	addi	s0,sp,48
    800028f6:	fca43c23          	sd	a0,-40(s0)
    800028fa:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800028fe:	4601                	li	a2,0
    80002900:	fd043583          	ld	a1,-48(s0)
    80002904:	fd843503          	ld	a0,-40(s0)
    80002908:	fffff097          	auipc	ra,0xfffff
    8000290c:	752080e7          	jalr	1874(ra) # 8000205a <walk>
    80002910:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80002914:	fe843783          	ld	a5,-24(s0)
    80002918:	eb89                	bnez	a5,8000292a <uvmclear+0x3c>
    panic("uvmclear");
    8000291a:	0000a517          	auipc	a0,0xa
    8000291e:	8ae50513          	addi	a0,a0,-1874 # 8000c1c8 <etext+0x1c8>
    80002922:	ffffe097          	auipc	ra,0xffffe
    80002926:	36a080e7          	jalr	874(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    8000292a:	fe843783          	ld	a5,-24(s0)
    8000292e:	639c                	ld	a5,0(a5)
    80002930:	fef7f713          	andi	a4,a5,-17
    80002934:	fe843783          	ld	a5,-24(s0)
    80002938:	e398                	sd	a4,0(a5)
  unreglrupage(va);
    8000293a:	fd043503          	ld	a0,-48(s0)
    8000293e:	fffff097          	auipc	ra,0xfffff
    80002942:	228080e7          	jalr	552(ra) # 80001b66 <unreglrupage>
}
    80002946:	0001                	nop
    80002948:	70a2                	ld	ra,40(sp)
    8000294a:	7402                	ld	s0,32(sp)
    8000294c:	6145                	addi	sp,sp,48
    8000294e:	8082                	ret

0000000080002950 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    80002950:	715d                	addi	sp,sp,-80
    80002952:	e486                	sd	ra,72(sp)
    80002954:	e0a2                	sd	s0,64(sp)
    80002956:	0880                	addi	s0,sp,80
    80002958:	fca43423          	sd	a0,-56(s0)
    8000295c:	fcb43023          	sd	a1,-64(s0)
    80002960:	fac43c23          	sd	a2,-72(s0)
    80002964:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002968:	a055                	j	80002a0c <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    8000296a:	fc043703          	ld	a4,-64(s0)
    8000296e:	77fd                	lui	a5,0xfffff
    80002970:	8ff9                	and	a5,a5,a4
    80002972:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002976:	fe043583          	ld	a1,-32(s0)
    8000297a:	fc843503          	ld	a0,-56(s0)
    8000297e:	fffff097          	auipc	ra,0xfffff
    80002982:	7e8080e7          	jalr	2024(ra) # 80002166 <walkaddr>
    80002986:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000298a:	fd843783          	ld	a5,-40(s0)
    8000298e:	e399                	bnez	a5,80002994 <copyout+0x44>
      return -1;
    80002990:	57fd                	li	a5,-1
    80002992:	a049                	j	80002a14 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    80002994:	fe043703          	ld	a4,-32(s0)
    80002998:	fc043783          	ld	a5,-64(s0)
    8000299c:	8f1d                	sub	a4,a4,a5
    8000299e:	6785                	lui	a5,0x1
    800029a0:	97ba                	add	a5,a5,a4
    800029a2:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800029a6:	fe843703          	ld	a4,-24(s0)
    800029aa:	fb043783          	ld	a5,-80(s0)
    800029ae:	00e7f663          	bgeu	a5,a4,800029ba <copyout+0x6a>
      n = len;
    800029b2:	fb043783          	ld	a5,-80(s0)
    800029b6:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    800029ba:	fc043703          	ld	a4,-64(s0)
    800029be:	fe043783          	ld	a5,-32(s0)
    800029c2:	8f1d                	sub	a4,a4,a5
    800029c4:	fd843783          	ld	a5,-40(s0)
    800029c8:	97ba                	add	a5,a5,a4
    800029ca:	873e                	mv	a4,a5
    800029cc:	fe843783          	ld	a5,-24(s0)
    800029d0:	2781                	sext.w	a5,a5
    800029d2:	863e                	mv	a2,a5
    800029d4:	fb843583          	ld	a1,-72(s0)
    800029d8:	853a                	mv	a0,a4
    800029da:	fffff097          	auipc	ra,0xfffff
    800029de:	c46080e7          	jalr	-954(ra) # 80001620 <memmove>

    len -= n;
    800029e2:	fb043703          	ld	a4,-80(s0)
    800029e6:	fe843783          	ld	a5,-24(s0)
    800029ea:	40f707b3          	sub	a5,a4,a5
    800029ee:	faf43823          	sd	a5,-80(s0)
    src += n;
    800029f2:	fb843703          	ld	a4,-72(s0)
    800029f6:	fe843783          	ld	a5,-24(s0)
    800029fa:	97ba                	add	a5,a5,a4
    800029fc:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002a00:	fe043703          	ld	a4,-32(s0)
    80002a04:	6785                	lui	a5,0x1
    80002a06:	97ba                	add	a5,a5,a4
    80002a08:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    80002a0c:	fb043783          	ld	a5,-80(s0)
    80002a10:	ffa9                	bnez	a5,8000296a <copyout+0x1a>
  }
  return 0;
    80002a12:	4781                	li	a5,0
}
    80002a14:	853e                	mv	a0,a5
    80002a16:	60a6                	ld	ra,72(sp)
    80002a18:	6406                	ld	s0,64(sp)
    80002a1a:	6161                	addi	sp,sp,80
    80002a1c:	8082                	ret

0000000080002a1e <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    80002a1e:	715d                	addi	sp,sp,-80
    80002a20:	e486                	sd	ra,72(sp)
    80002a22:	e0a2                	sd	s0,64(sp)
    80002a24:	0880                	addi	s0,sp,80
    80002a26:	fca43423          	sd	a0,-56(s0)
    80002a2a:	fcb43023          	sd	a1,-64(s0)
    80002a2e:	fac43c23          	sd	a2,-72(s0)
    80002a32:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002a36:	a055                	j	80002ada <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    80002a38:	fb843703          	ld	a4,-72(s0)
    80002a3c:	77fd                	lui	a5,0xfffff
    80002a3e:	8ff9                	and	a5,a5,a4
    80002a40:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002a44:	fe043583          	ld	a1,-32(s0)
    80002a48:	fc843503          	ld	a0,-56(s0)
    80002a4c:	fffff097          	auipc	ra,0xfffff
    80002a50:	71a080e7          	jalr	1818(ra) # 80002166 <walkaddr>
    80002a54:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002a58:	fd843783          	ld	a5,-40(s0)
    80002a5c:	e399                	bnez	a5,80002a62 <copyin+0x44>
      return -1;
    80002a5e:	57fd                	li	a5,-1
    80002a60:	a049                	j	80002ae2 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    80002a62:	fe043703          	ld	a4,-32(s0)
    80002a66:	fb843783          	ld	a5,-72(s0)
    80002a6a:	8f1d                	sub	a4,a4,a5
    80002a6c:	6785                	lui	a5,0x1
    80002a6e:	97ba                	add	a5,a5,a4
    80002a70:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002a74:	fe843703          	ld	a4,-24(s0)
    80002a78:	fb043783          	ld	a5,-80(s0)
    80002a7c:	00e7f663          	bgeu	a5,a4,80002a88 <copyin+0x6a>
      n = len;
    80002a80:	fb043783          	ld	a5,-80(s0)
    80002a84:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80002a88:	fb843703          	ld	a4,-72(s0)
    80002a8c:	fe043783          	ld	a5,-32(s0)
    80002a90:	8f1d                	sub	a4,a4,a5
    80002a92:	fd843783          	ld	a5,-40(s0)
    80002a96:	97ba                	add	a5,a5,a4
    80002a98:	873e                	mv	a4,a5
    80002a9a:	fe843783          	ld	a5,-24(s0)
    80002a9e:	2781                	sext.w	a5,a5
    80002aa0:	863e                	mv	a2,a5
    80002aa2:	85ba                	mv	a1,a4
    80002aa4:	fc043503          	ld	a0,-64(s0)
    80002aa8:	fffff097          	auipc	ra,0xfffff
    80002aac:	b78080e7          	jalr	-1160(ra) # 80001620 <memmove>

    len -= n;
    80002ab0:	fb043703          	ld	a4,-80(s0)
    80002ab4:	fe843783          	ld	a5,-24(s0)
    80002ab8:	40f707b3          	sub	a5,a4,a5
    80002abc:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002ac0:	fc043703          	ld	a4,-64(s0)
    80002ac4:	fe843783          	ld	a5,-24(s0)
    80002ac8:	97ba                	add	a5,a5,a4
    80002aca:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002ace:	fe043703          	ld	a4,-32(s0)
    80002ad2:	6785                	lui	a5,0x1
    80002ad4:	97ba                	add	a5,a5,a4
    80002ad6:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002ada:	fb043783          	ld	a5,-80(s0)
    80002ade:	ffa9                	bnez	a5,80002a38 <copyin+0x1a>
  }
  return 0;
    80002ae0:	4781                	li	a5,0
}
    80002ae2:	853e                	mv	a0,a5
    80002ae4:	60a6                	ld	ra,72(sp)
    80002ae6:	6406                	ld	s0,64(sp)
    80002ae8:	6161                	addi	sp,sp,80
    80002aea:	8082                	ret

0000000080002aec <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002aec:	711d                	addi	sp,sp,-96
    80002aee:	ec86                	sd	ra,88(sp)
    80002af0:	e8a2                	sd	s0,80(sp)
    80002af2:	1080                	addi	s0,sp,96
    80002af4:	faa43c23          	sd	a0,-72(s0)
    80002af8:	fab43823          	sd	a1,-80(s0)
    80002afc:	fac43423          	sd	a2,-88(s0)
    80002b00:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    80002b04:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    80002b08:	a0f1                	j	80002bd4 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    80002b0a:	fa843703          	ld	a4,-88(s0)
    80002b0e:	77fd                	lui	a5,0xfffff
    80002b10:	8ff9                	and	a5,a5,a4
    80002b12:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    80002b16:	fd043583          	ld	a1,-48(s0)
    80002b1a:	fb843503          	ld	a0,-72(s0)
    80002b1e:	fffff097          	auipc	ra,0xfffff
    80002b22:	648080e7          	jalr	1608(ra) # 80002166 <walkaddr>
    80002b26:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    80002b2a:	fc843783          	ld	a5,-56(s0)
    80002b2e:	e399                	bnez	a5,80002b34 <copyinstr+0x48>
      return -1;
    80002b30:	57fd                	li	a5,-1
    80002b32:	a87d                	j	80002bf0 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    80002b34:	fd043703          	ld	a4,-48(s0)
    80002b38:	fa843783          	ld	a5,-88(s0)
    80002b3c:	8f1d                	sub	a4,a4,a5
    80002b3e:	6785                	lui	a5,0x1
    80002b40:	97ba                	add	a5,a5,a4
    80002b42:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    80002b46:	fe843703          	ld	a4,-24(s0)
    80002b4a:	fa043783          	ld	a5,-96(s0)
    80002b4e:	00e7f663          	bgeu	a5,a4,80002b5a <copyinstr+0x6e>
      n = max;
    80002b52:	fa043783          	ld	a5,-96(s0)
    80002b56:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    80002b5a:	fa843703          	ld	a4,-88(s0)
    80002b5e:	fd043783          	ld	a5,-48(s0)
    80002b62:	8f1d                	sub	a4,a4,a5
    80002b64:	fc843783          	ld	a5,-56(s0)
    80002b68:	97ba                	add	a5,a5,a4
    80002b6a:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002b6e:	a891                	j	80002bc2 <copyinstr+0xd6>
      if(*p == '\0'){
    80002b70:	fd843783          	ld	a5,-40(s0)
    80002b74:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    80002b78:	eb89                	bnez	a5,80002b8a <copyinstr+0x9e>
        *dst = '\0';
    80002b7a:	fb043783          	ld	a5,-80(s0)
    80002b7e:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002b82:	4785                	li	a5,1
    80002b84:	fef42223          	sw	a5,-28(s0)
        break;
    80002b88:	a081                	j	80002bc8 <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002b8a:	fd843783          	ld	a5,-40(s0)
    80002b8e:	0007c703          	lbu	a4,0(a5)
    80002b92:	fb043783          	ld	a5,-80(s0)
    80002b96:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002b9a:	fe843783          	ld	a5,-24(s0)
    80002b9e:	17fd                	addi	a5,a5,-1
    80002ba0:	fef43423          	sd	a5,-24(s0)
      --max;
    80002ba4:	fa043783          	ld	a5,-96(s0)
    80002ba8:	17fd                	addi	a5,a5,-1
    80002baa:	faf43023          	sd	a5,-96(s0)
      p++;
    80002bae:	fd843783          	ld	a5,-40(s0)
    80002bb2:	0785                	addi	a5,a5,1
    80002bb4:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    80002bb8:	fb043783          	ld	a5,-80(s0)
    80002bbc:	0785                	addi	a5,a5,1
    80002bbe:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002bc2:	fe843783          	ld	a5,-24(s0)
    80002bc6:	f7cd                	bnez	a5,80002b70 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    80002bc8:	fd043703          	ld	a4,-48(s0)
    80002bcc:	6785                	lui	a5,0x1
    80002bce:	97ba                	add	a5,a5,a4
    80002bd0:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    80002bd4:	fe442783          	lw	a5,-28(s0)
    80002bd8:	2781                	sext.w	a5,a5
    80002bda:	e781                	bnez	a5,80002be2 <copyinstr+0xf6>
    80002bdc:	fa043783          	ld	a5,-96(s0)
    80002be0:	f78d                	bnez	a5,80002b0a <copyinstr+0x1e>
  }
  if(got_null){
    80002be2:	fe442783          	lw	a5,-28(s0)
    80002be6:	2781                	sext.w	a5,a5
    80002be8:	c399                	beqz	a5,80002bee <copyinstr+0x102>
    return 0;
    80002bea:	4781                	li	a5,0
    80002bec:	a011                	j	80002bf0 <copyinstr+0x104>
  } else {
    return -1;
    80002bee:	57fd                	li	a5,-1
  }
}
    80002bf0:	853e                	mv	a0,a5
    80002bf2:	60e6                	ld	ra,88(sp)
    80002bf4:	6446                	ld	s0,80(sp)
    80002bf6:	6125                	addi	sp,sp,96
    80002bf8:	8082                	ret

0000000080002bfa <r_sstatus>:
{
    80002bfa:	1101                	addi	sp,sp,-32
    80002bfc:	ec22                	sd	s0,24(sp)
    80002bfe:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002c00:	100027f3          	csrr	a5,sstatus
    80002c04:	fef43423          	sd	a5,-24(s0)
  return x;
    80002c08:	fe843783          	ld	a5,-24(s0)
}
    80002c0c:	853e                	mv	a0,a5
    80002c0e:	6462                	ld	s0,24(sp)
    80002c10:	6105                	addi	sp,sp,32
    80002c12:	8082                	ret

0000000080002c14 <w_sstatus>:
{
    80002c14:	1101                	addi	sp,sp,-32
    80002c16:	ec22                	sd	s0,24(sp)
    80002c18:	1000                	addi	s0,sp,32
    80002c1a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80002c1e:	fe843783          	ld	a5,-24(s0)
    80002c22:	10079073          	csrw	sstatus,a5
}
    80002c26:	0001                	nop
    80002c28:	6462                	ld	s0,24(sp)
    80002c2a:	6105                	addi	sp,sp,32
    80002c2c:	8082                	ret

0000000080002c2e <intr_on>:
{
    80002c2e:	1141                	addi	sp,sp,-16
    80002c30:	e406                	sd	ra,8(sp)
    80002c32:	e022                	sd	s0,0(sp)
    80002c34:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80002c36:	00000097          	auipc	ra,0x0
    80002c3a:	fc4080e7          	jalr	-60(ra) # 80002bfa <r_sstatus>
    80002c3e:	87aa                	mv	a5,a0
    80002c40:	0027e793          	ori	a5,a5,2
    80002c44:	853e                	mv	a0,a5
    80002c46:	00000097          	auipc	ra,0x0
    80002c4a:	fce080e7          	jalr	-50(ra) # 80002c14 <w_sstatus>
}
    80002c4e:	0001                	nop
    80002c50:	60a2                	ld	ra,8(sp)
    80002c52:	6402                	ld	s0,0(sp)
    80002c54:	0141                	addi	sp,sp,16
    80002c56:	8082                	ret

0000000080002c58 <intr_get>:
{
    80002c58:	1101                	addi	sp,sp,-32
    80002c5a:	ec06                	sd	ra,24(sp)
    80002c5c:	e822                	sd	s0,16(sp)
    80002c5e:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80002c60:	00000097          	auipc	ra,0x0
    80002c64:	f9a080e7          	jalr	-102(ra) # 80002bfa <r_sstatus>
    80002c68:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002c6c:	fe843783          	ld	a5,-24(s0)
    80002c70:	8b89                	andi	a5,a5,2
    80002c72:	00f037b3          	snez	a5,a5
    80002c76:	0ff7f793          	andi	a5,a5,255
    80002c7a:	2781                	sext.w	a5,a5
}
    80002c7c:	853e                	mv	a0,a5
    80002c7e:	60e2                	ld	ra,24(sp)
    80002c80:	6442                	ld	s0,16(sp)
    80002c82:	6105                	addi	sp,sp,32
    80002c84:	8082                	ret

0000000080002c86 <r_tp>:
{
    80002c86:	1101                	addi	sp,sp,-32
    80002c88:	ec22                	sd	s0,24(sp)
    80002c8a:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002c8c:	8792                	mv	a5,tp
    80002c8e:	fef43423          	sd	a5,-24(s0)
  return x;
    80002c92:	fe843783          	ld	a5,-24(s0)
}
    80002c96:	853e                	mv	a0,a5
    80002c98:	6462                	ld	s0,24(sp)
    80002c9a:	6105                	addi	sp,sp,32
    80002c9c:	8082                	ret

0000000080002c9e <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    80002c9e:	7139                	addi	sp,sp,-64
    80002ca0:	fc06                	sd	ra,56(sp)
    80002ca2:	f822                	sd	s0,48(sp)
    80002ca4:	0080                	addi	s0,sp,64
    80002ca6:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002caa:	00042797          	auipc	a5,0x42
    80002cae:	30e78793          	addi	a5,a5,782 # 80044fb8 <proc>
    80002cb2:	fef43423          	sd	a5,-24(s0)
    80002cb6:	a061                	j	80002d3e <proc_mapstacks+0xa0>
    char *pa = kalloc();
    80002cb8:	ffffe097          	auipc	ra,0xffffe
    80002cbc:	51e080e7          	jalr	1310(ra) # 800011d6 <kalloc>
    80002cc0:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80002cc4:	fe043783          	ld	a5,-32(s0)
    80002cc8:	eb89                	bnez	a5,80002cda <proc_mapstacks+0x3c>
      panic("kalloc");
    80002cca:	00009517          	auipc	a0,0x9
    80002cce:	50e50513          	addi	a0,a0,1294 # 8000c1d8 <etext+0x1d8>
    80002cd2:	ffffe097          	auipc	ra,0xffffe
    80002cd6:	fba080e7          	jalr	-70(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002cda:	fe843703          	ld	a4,-24(s0)
    80002cde:	00042797          	auipc	a5,0x42
    80002ce2:	2da78793          	addi	a5,a5,730 # 80044fb8 <proc>
    80002ce6:	40f707b3          	sub	a5,a4,a5
    80002cea:	4037d713          	srai	a4,a5,0x3
    80002cee:	00009797          	auipc	a5,0x9
    80002cf2:	5e278793          	addi	a5,a5,1506 # 8000c2d0 <etext+0x2d0>
    80002cf6:	639c                	ld	a5,0(a5)
    80002cf8:	02f707b3          	mul	a5,a4,a5
    80002cfc:	2781                	sext.w	a5,a5
    80002cfe:	2785                	addiw	a5,a5,1
    80002d00:	2781                	sext.w	a5,a5
    80002d02:	00d7979b          	slliw	a5,a5,0xd
    80002d06:	2781                	sext.w	a5,a5
    80002d08:	873e                	mv	a4,a5
    80002d0a:	040007b7          	lui	a5,0x4000
    80002d0e:	17fd                	addi	a5,a5,-1
    80002d10:	07b2                	slli	a5,a5,0xc
    80002d12:	8f99                	sub	a5,a5,a4
    80002d14:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    80002d18:	fe043783          	ld	a5,-32(s0)
    80002d1c:	4719                	li	a4,6
    80002d1e:	6685                	lui	a3,0x1
    80002d20:	863e                	mv	a2,a5
    80002d22:	fd843583          	ld	a1,-40(s0)
    80002d26:	fc843503          	ld	a0,-56(s0)
    80002d2a:	fffff097          	auipc	ra,0xfffff
    80002d2e:	4d6080e7          	jalr	1238(ra) # 80002200 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002d32:	fe843783          	ld	a5,-24(s0)
    80002d36:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002d3a:	fef43423          	sd	a5,-24(s0)
    80002d3e:	fe843703          	ld	a4,-24(s0)
    80002d42:	00048797          	auipc	a5,0x48
    80002d46:	c7678793          	addi	a5,a5,-906 # 8004a9b8 <pid_lock>
    80002d4a:	f6f767e3          	bltu	a4,a5,80002cb8 <proc_mapstacks+0x1a>
  }
}
    80002d4e:	0001                	nop
    80002d50:	0001                	nop
    80002d52:	70e2                	ld	ra,56(sp)
    80002d54:	7442                	ld	s0,48(sp)
    80002d56:	6121                	addi	sp,sp,64
    80002d58:	8082                	ret

0000000080002d5a <procinit>:

// initialize the proc table.
void
procinit(void)
{
    80002d5a:	1101                	addi	sp,sp,-32
    80002d5c:	ec06                	sd	ra,24(sp)
    80002d5e:	e822                	sd	s0,16(sp)
    80002d60:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    80002d62:	00009597          	auipc	a1,0x9
    80002d66:	47e58593          	addi	a1,a1,1150 # 8000c1e0 <etext+0x1e0>
    80002d6a:	00048517          	auipc	a0,0x48
    80002d6e:	c4e50513          	addi	a0,a0,-946 # 8004a9b8 <pid_lock>
    80002d72:	ffffe097          	auipc	ra,0xffffe
    80002d76:	5c6080e7          	jalr	1478(ra) # 80001338 <initlock>
  initlock(&wait_lock, "wait_lock");
    80002d7a:	00009597          	auipc	a1,0x9
    80002d7e:	46e58593          	addi	a1,a1,1134 # 8000c1e8 <etext+0x1e8>
    80002d82:	00048517          	auipc	a0,0x48
    80002d86:	c4e50513          	addi	a0,a0,-946 # 8004a9d0 <wait_lock>
    80002d8a:	ffffe097          	auipc	ra,0xffffe
    80002d8e:	5ae080e7          	jalr	1454(ra) # 80001338 <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002d92:	00042797          	auipc	a5,0x42
    80002d96:	22678793          	addi	a5,a5,550 # 80044fb8 <proc>
    80002d9a:	fef43423          	sd	a5,-24(s0)
    80002d9e:	a0bd                	j	80002e0c <procinit+0xb2>
      initlock(&p->lock, "proc");
    80002da0:	fe843783          	ld	a5,-24(s0)
    80002da4:	00009597          	auipc	a1,0x9
    80002da8:	45458593          	addi	a1,a1,1108 # 8000c1f8 <etext+0x1f8>
    80002dac:	853e                	mv	a0,a5
    80002dae:	ffffe097          	auipc	ra,0xffffe
    80002db2:	58a080e7          	jalr	1418(ra) # 80001338 <initlock>
      p->state = UNUSED;
    80002db6:	fe843783          	ld	a5,-24(s0)
    80002dba:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    80002dbe:	fe843703          	ld	a4,-24(s0)
    80002dc2:	00042797          	auipc	a5,0x42
    80002dc6:	1f678793          	addi	a5,a5,502 # 80044fb8 <proc>
    80002dca:	40f707b3          	sub	a5,a4,a5
    80002dce:	4037d713          	srai	a4,a5,0x3
    80002dd2:	00009797          	auipc	a5,0x9
    80002dd6:	4fe78793          	addi	a5,a5,1278 # 8000c2d0 <etext+0x2d0>
    80002dda:	639c                	ld	a5,0(a5)
    80002ddc:	02f707b3          	mul	a5,a4,a5
    80002de0:	2781                	sext.w	a5,a5
    80002de2:	2785                	addiw	a5,a5,1
    80002de4:	2781                	sext.w	a5,a5
    80002de6:	00d7979b          	slliw	a5,a5,0xd
    80002dea:	2781                	sext.w	a5,a5
    80002dec:	873e                	mv	a4,a5
    80002dee:	040007b7          	lui	a5,0x4000
    80002df2:	17fd                	addi	a5,a5,-1
    80002df4:	07b2                	slli	a5,a5,0xc
    80002df6:	8f99                	sub	a5,a5,a4
    80002df8:	873e                	mv	a4,a5
    80002dfa:	fe843783          	ld	a5,-24(s0)
    80002dfe:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002e00:	fe843783          	ld	a5,-24(s0)
    80002e04:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002e08:	fef43423          	sd	a5,-24(s0)
    80002e0c:	fe843703          	ld	a4,-24(s0)
    80002e10:	00048797          	auipc	a5,0x48
    80002e14:	ba878793          	addi	a5,a5,-1112 # 8004a9b8 <pid_lock>
    80002e18:	f8f764e3          	bltu	a4,a5,80002da0 <procinit+0x46>
  }
}
    80002e1c:	0001                	nop
    80002e1e:	0001                	nop
    80002e20:	60e2                	ld	ra,24(sp)
    80002e22:	6442                	ld	s0,16(sp)
    80002e24:	6105                	addi	sp,sp,32
    80002e26:	8082                	ret

0000000080002e28 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002e28:	1101                	addi	sp,sp,-32
    80002e2a:	ec06                	sd	ra,24(sp)
    80002e2c:	e822                	sd	s0,16(sp)
    80002e2e:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002e30:	00000097          	auipc	ra,0x0
    80002e34:	e56080e7          	jalr	-426(ra) # 80002c86 <r_tp>
    80002e38:	87aa                	mv	a5,a0
    80002e3a:	fef42623          	sw	a5,-20(s0)
  return id;
    80002e3e:	fec42783          	lw	a5,-20(s0)
}
    80002e42:	853e                	mv	a0,a5
    80002e44:	60e2                	ld	ra,24(sp)
    80002e46:	6442                	ld	s0,16(sp)
    80002e48:	6105                	addi	sp,sp,32
    80002e4a:	8082                	ret

0000000080002e4c <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002e4c:	1101                	addi	sp,sp,-32
    80002e4e:	ec06                	sd	ra,24(sp)
    80002e50:	e822                	sd	s0,16(sp)
    80002e52:	1000                	addi	s0,sp,32
  int id = cpuid();
    80002e54:	00000097          	auipc	ra,0x0
    80002e58:	fd4080e7          	jalr	-44(ra) # 80002e28 <cpuid>
    80002e5c:	87aa                	mv	a5,a0
    80002e5e:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002e62:	fec42783          	lw	a5,-20(s0)
    80002e66:	00779713          	slli	a4,a5,0x7
    80002e6a:	00042797          	auipc	a5,0x42
    80002e6e:	d4e78793          	addi	a5,a5,-690 # 80044bb8 <cpus>
    80002e72:	97ba                	add	a5,a5,a4
    80002e74:	fef43023          	sd	a5,-32(s0)
  return c;
    80002e78:	fe043783          	ld	a5,-32(s0)
}
    80002e7c:	853e                	mv	a0,a5
    80002e7e:	60e2                	ld	ra,24(sp)
    80002e80:	6442                	ld	s0,16(sp)
    80002e82:	6105                	addi	sp,sp,32
    80002e84:	8082                	ret

0000000080002e86 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002e86:	1101                	addi	sp,sp,-32
    80002e88:	ec06                	sd	ra,24(sp)
    80002e8a:	e822                	sd	s0,16(sp)
    80002e8c:	1000                	addi	s0,sp,32
  push_off();
    80002e8e:	ffffe097          	auipc	ra,0xffffe
    80002e92:	5d8080e7          	jalr	1496(ra) # 80001466 <push_off>
  struct cpu *c = mycpu();
    80002e96:	00000097          	auipc	ra,0x0
    80002e9a:	fb6080e7          	jalr	-74(ra) # 80002e4c <mycpu>
    80002e9e:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002ea2:	fe843783          	ld	a5,-24(s0)
    80002ea6:	639c                	ld	a5,0(a5)
    80002ea8:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002eac:	ffffe097          	auipc	ra,0xffffe
    80002eb0:	612080e7          	jalr	1554(ra) # 800014be <pop_off>
  return p;
    80002eb4:	fe043783          	ld	a5,-32(s0)
}
    80002eb8:	853e                	mv	a0,a5
    80002eba:	60e2                	ld	ra,24(sp)
    80002ebc:	6442                	ld	s0,16(sp)
    80002ebe:	6105                	addi	sp,sp,32
    80002ec0:	8082                	ret

0000000080002ec2 <allocpid>:

int
allocpid()
{
    80002ec2:	1101                	addi	sp,sp,-32
    80002ec4:	ec06                	sd	ra,24(sp)
    80002ec6:	e822                	sd	s0,16(sp)
    80002ec8:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002eca:	00048517          	auipc	a0,0x48
    80002ece:	aee50513          	addi	a0,a0,-1298 # 8004a9b8 <pid_lock>
    80002ed2:	ffffe097          	auipc	ra,0xffffe
    80002ed6:	496080e7          	jalr	1174(ra) # 80001368 <acquire>
  pid = nextpid;
    80002eda:	0000a797          	auipc	a5,0xa
    80002ede:	8e678793          	addi	a5,a5,-1818 # 8000c7c0 <nextpid>
    80002ee2:	439c                	lw	a5,0(a5)
    80002ee4:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002ee8:	0000a797          	auipc	a5,0xa
    80002eec:	8d878793          	addi	a5,a5,-1832 # 8000c7c0 <nextpid>
    80002ef0:	439c                	lw	a5,0(a5)
    80002ef2:	2785                	addiw	a5,a5,1
    80002ef4:	0007871b          	sext.w	a4,a5
    80002ef8:	0000a797          	auipc	a5,0xa
    80002efc:	8c878793          	addi	a5,a5,-1848 # 8000c7c0 <nextpid>
    80002f00:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002f02:	00048517          	auipc	a0,0x48
    80002f06:	ab650513          	addi	a0,a0,-1354 # 8004a9b8 <pid_lock>
    80002f0a:	ffffe097          	auipc	ra,0xffffe
    80002f0e:	4c2080e7          	jalr	1218(ra) # 800013cc <release>

  return pid;
    80002f12:	fec42783          	lw	a5,-20(s0)
}
    80002f16:	853e                	mv	a0,a5
    80002f18:	60e2                	ld	ra,24(sp)
    80002f1a:	6442                	ld	s0,16(sp)
    80002f1c:	6105                	addi	sp,sp,32
    80002f1e:	8082                	ret

0000000080002f20 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002f20:	1101                	addi	sp,sp,-32
    80002f22:	ec06                	sd	ra,24(sp)
    80002f24:	e822                	sd	s0,16(sp)
    80002f26:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002f28:	00042797          	auipc	a5,0x42
    80002f2c:	09078793          	addi	a5,a5,144 # 80044fb8 <proc>
    80002f30:	fef43423          	sd	a5,-24(s0)
    80002f34:	a80d                	j	80002f66 <allocproc+0x46>
    acquire(&p->lock);
    80002f36:	fe843783          	ld	a5,-24(s0)
    80002f3a:	853e                	mv	a0,a5
    80002f3c:	ffffe097          	auipc	ra,0xffffe
    80002f40:	42c080e7          	jalr	1068(ra) # 80001368 <acquire>
    if(p->state == UNUSED) {
    80002f44:	fe843783          	ld	a5,-24(s0)
    80002f48:	4f9c                	lw	a5,24(a5)
    80002f4a:	cb85                	beqz	a5,80002f7a <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002f4c:	fe843783          	ld	a5,-24(s0)
    80002f50:	853e                	mv	a0,a5
    80002f52:	ffffe097          	auipc	ra,0xffffe
    80002f56:	47a080e7          	jalr	1146(ra) # 800013cc <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002f5a:	fe843783          	ld	a5,-24(s0)
    80002f5e:	16878793          	addi	a5,a5,360
    80002f62:	fef43423          	sd	a5,-24(s0)
    80002f66:	fe843703          	ld	a4,-24(s0)
    80002f6a:	00048797          	auipc	a5,0x48
    80002f6e:	a4e78793          	addi	a5,a5,-1458 # 8004a9b8 <pid_lock>
    80002f72:	fcf762e3          	bltu	a4,a5,80002f36 <allocproc+0x16>
    }
  }
  return 0;
    80002f76:	4781                	li	a5,0
    80002f78:	a0e1                	j	80003040 <allocproc+0x120>
      goto found;
    80002f7a:	0001                	nop

found:
  p->pid = allocpid();
    80002f7c:	00000097          	auipc	ra,0x0
    80002f80:	f46080e7          	jalr	-186(ra) # 80002ec2 <allocpid>
    80002f84:	87aa                	mv	a5,a0
    80002f86:	873e                	mv	a4,a5
    80002f88:	fe843783          	ld	a5,-24(s0)
    80002f8c:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002f8e:	fe843783          	ld	a5,-24(s0)
    80002f92:	4705                	li	a4,1
    80002f94:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002f96:	ffffe097          	auipc	ra,0xffffe
    80002f9a:	240080e7          	jalr	576(ra) # 800011d6 <kalloc>
    80002f9e:	872a                	mv	a4,a0
    80002fa0:	fe843783          	ld	a5,-24(s0)
    80002fa4:	efb8                	sd	a4,88(a5)
    80002fa6:	fe843783          	ld	a5,-24(s0)
    80002faa:	6fbc                	ld	a5,88(a5)
    80002fac:	e385                	bnez	a5,80002fcc <allocproc+0xac>
    freeproc(p);
    80002fae:	fe843503          	ld	a0,-24(s0)
    80002fb2:	00000097          	auipc	ra,0x0
    80002fb6:	098080e7          	jalr	152(ra) # 8000304a <freeproc>
    release(&p->lock);
    80002fba:	fe843783          	ld	a5,-24(s0)
    80002fbe:	853e                	mv	a0,a5
    80002fc0:	ffffe097          	auipc	ra,0xffffe
    80002fc4:	40c080e7          	jalr	1036(ra) # 800013cc <release>
    return 0;
    80002fc8:	4781                	li	a5,0
    80002fca:	a89d                	j	80003040 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002fcc:	fe843503          	ld	a0,-24(s0)
    80002fd0:	00000097          	auipc	ra,0x0
    80002fd4:	118080e7          	jalr	280(ra) # 800030e8 <proc_pagetable>
    80002fd8:	872a                	mv	a4,a0
    80002fda:	fe843783          	ld	a5,-24(s0)
    80002fde:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002fe0:	fe843783          	ld	a5,-24(s0)
    80002fe4:	6bbc                	ld	a5,80(a5)
    80002fe6:	e385                	bnez	a5,80003006 <allocproc+0xe6>
    freeproc(p);
    80002fe8:	fe843503          	ld	a0,-24(s0)
    80002fec:	00000097          	auipc	ra,0x0
    80002ff0:	05e080e7          	jalr	94(ra) # 8000304a <freeproc>
    release(&p->lock);
    80002ff4:	fe843783          	ld	a5,-24(s0)
    80002ff8:	853e                	mv	a0,a5
    80002ffa:	ffffe097          	auipc	ra,0xffffe
    80002ffe:	3d2080e7          	jalr	978(ra) # 800013cc <release>
    return 0;
    80003002:	4781                	li	a5,0
    80003004:	a835                	j	80003040 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80003006:	fe843783          	ld	a5,-24(s0)
    8000300a:	06078793          	addi	a5,a5,96
    8000300e:	07000613          	li	a2,112
    80003012:	4581                	li	a1,0
    80003014:	853e                	mv	a0,a5
    80003016:	ffffe097          	auipc	ra,0xffffe
    8000301a:	526080e7          	jalr	1318(ra) # 8000153c <memset>
  p->context.ra = (uint64)forkret;
    8000301e:	00001717          	auipc	a4,0x1
    80003022:	9da70713          	addi	a4,a4,-1574 # 800039f8 <forkret>
    80003026:	fe843783          	ld	a5,-24(s0)
    8000302a:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    8000302c:	fe843783          	ld	a5,-24(s0)
    80003030:	63b8                	ld	a4,64(a5)
    80003032:	6785                	lui	a5,0x1
    80003034:	973e                	add	a4,a4,a5
    80003036:	fe843783          	ld	a5,-24(s0)
    8000303a:	f7b8                	sd	a4,104(a5)

  return p;
    8000303c:	fe843783          	ld	a5,-24(s0)
}
    80003040:	853e                	mv	a0,a5
    80003042:	60e2                	ld	ra,24(sp)
    80003044:	6442                	ld	s0,16(sp)
    80003046:	6105                	addi	sp,sp,32
    80003048:	8082                	ret

000000008000304a <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    8000304a:	1101                	addi	sp,sp,-32
    8000304c:	ec06                	sd	ra,24(sp)
    8000304e:	e822                	sd	s0,16(sp)
    80003050:	1000                	addi	s0,sp,32
    80003052:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80003056:	fe843783          	ld	a5,-24(s0)
    8000305a:	6fbc                	ld	a5,88(a5)
    8000305c:	cb89                	beqz	a5,8000306e <freeproc+0x24>
    kfree((void*)p->trapframe);
    8000305e:	fe843783          	ld	a5,-24(s0)
    80003062:	6fbc                	ld	a5,88(a5)
    80003064:	853e                	mv	a0,a5
    80003066:	ffffe097          	auipc	ra,0xffffe
    8000306a:	0ca080e7          	jalr	202(ra) # 80001130 <kfree>
  p->trapframe = 0;
    8000306e:	fe843783          	ld	a5,-24(s0)
    80003072:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80003076:	fe843783          	ld	a5,-24(s0)
    8000307a:	6bbc                	ld	a5,80(a5)
    8000307c:	cf89                	beqz	a5,80003096 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    8000307e:	fe843783          	ld	a5,-24(s0)
    80003082:	6bb8                	ld	a4,80(a5)
    80003084:	fe843783          	ld	a5,-24(s0)
    80003088:	67bc                	ld	a5,72(a5)
    8000308a:	85be                	mv	a1,a5
    8000308c:	853a                	mv	a0,a4
    8000308e:	00000097          	auipc	ra,0x0
    80003092:	11a080e7          	jalr	282(ra) # 800031a8 <proc_freepagetable>
  p->pagetable = 0;
    80003096:	fe843783          	ld	a5,-24(s0)
    8000309a:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    8000309e:	fe843783          	ld	a5,-24(s0)
    800030a2:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    800030a6:	fe843783          	ld	a5,-24(s0)
    800030aa:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    800030ae:	fe843783          	ld	a5,-24(s0)
    800030b2:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    800030b6:	fe843783          	ld	a5,-24(s0)
    800030ba:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    800030be:	fe843783          	ld	a5,-24(s0)
    800030c2:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    800030c6:	fe843783          	ld	a5,-24(s0)
    800030ca:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    800030ce:	fe843783          	ld	a5,-24(s0)
    800030d2:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    800030d6:	fe843783          	ld	a5,-24(s0)
    800030da:	0007ac23          	sw	zero,24(a5)
}
    800030de:	0001                	nop
    800030e0:	60e2                	ld	ra,24(sp)
    800030e2:	6442                	ld	s0,16(sp)
    800030e4:	6105                	addi	sp,sp,32
    800030e6:	8082                	ret

00000000800030e8 <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    800030e8:	7179                	addi	sp,sp,-48
    800030ea:	f406                	sd	ra,40(sp)
    800030ec:	f022                	sd	s0,32(sp)
    800030ee:	1800                	addi	s0,sp,48
    800030f0:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    800030f4:	fffff097          	auipc	ra,0xfffff
    800030f8:	3a0080e7          	jalr	928(ra) # 80002494 <uvmcreate>
    800030fc:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80003100:	fe843783          	ld	a5,-24(s0)
    80003104:	e399                	bnez	a5,8000310a <proc_pagetable+0x22>
    return 0;
    80003106:	4781                	li	a5,0
    80003108:	a859                	j	8000319e <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    8000310a:	00008797          	auipc	a5,0x8
    8000310e:	ef678793          	addi	a5,a5,-266 # 8000b000 <_trampoline>
    80003112:	4729                	li	a4,10
    80003114:	86be                	mv	a3,a5
    80003116:	6605                	lui	a2,0x1
    80003118:	040007b7          	lui	a5,0x4000
    8000311c:	17fd                	addi	a5,a5,-1
    8000311e:	00c79593          	slli	a1,a5,0xc
    80003122:	fe843503          	ld	a0,-24(s0)
    80003126:	fffff097          	auipc	ra,0xfffff
    8000312a:	134080e7          	jalr	308(ra) # 8000225a <mappages>
    8000312e:	87aa                	mv	a5,a0
    80003130:	0007db63          	bgez	a5,80003146 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80003134:	4581                	li	a1,0
    80003136:	fe843503          	ld	a0,-24(s0)
    8000313a:	fffff097          	auipc	ra,0xfffff
    8000313e:	656080e7          	jalr	1622(ra) # 80002790 <uvmfree>
    return 0;
    80003142:	4781                	li	a5,0
    80003144:	a8a9                	j	8000319e <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80003146:	fd843783          	ld	a5,-40(s0)
    8000314a:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    8000314c:	4719                	li	a4,6
    8000314e:	86be                	mv	a3,a5
    80003150:	6605                	lui	a2,0x1
    80003152:	020007b7          	lui	a5,0x2000
    80003156:	17fd                	addi	a5,a5,-1
    80003158:	00d79593          	slli	a1,a5,0xd
    8000315c:	fe843503          	ld	a0,-24(s0)
    80003160:	fffff097          	auipc	ra,0xfffff
    80003164:	0fa080e7          	jalr	250(ra) # 8000225a <mappages>
    80003168:	87aa                	mv	a5,a0
    8000316a:	0207d863          	bgez	a5,8000319a <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    8000316e:	4681                	li	a3,0
    80003170:	4605                	li	a2,1
    80003172:	040007b7          	lui	a5,0x4000
    80003176:	17fd                	addi	a5,a5,-1
    80003178:	00c79593          	slli	a1,a5,0xc
    8000317c:	fe843503          	ld	a0,-24(s0)
    80003180:	fffff097          	auipc	ra,0xfffff
    80003184:	1de080e7          	jalr	478(ra) # 8000235e <uvmunmap>
    uvmfree(pagetable, 0);
    80003188:	4581                	li	a1,0
    8000318a:	fe843503          	ld	a0,-24(s0)
    8000318e:	fffff097          	auipc	ra,0xfffff
    80003192:	602080e7          	jalr	1538(ra) # 80002790 <uvmfree>
    return 0;
    80003196:	4781                	li	a5,0
    80003198:	a019                	j	8000319e <proc_pagetable+0xb6>
  }

  return pagetable;
    8000319a:	fe843783          	ld	a5,-24(s0)
}
    8000319e:	853e                	mv	a0,a5
    800031a0:	70a2                	ld	ra,40(sp)
    800031a2:	7402                	ld	s0,32(sp)
    800031a4:	6145                	addi	sp,sp,48
    800031a6:	8082                	ret

00000000800031a8 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    800031a8:	1101                	addi	sp,sp,-32
    800031aa:	ec06                	sd	ra,24(sp)
    800031ac:	e822                	sd	s0,16(sp)
    800031ae:	1000                	addi	s0,sp,32
    800031b0:	fea43423          	sd	a0,-24(s0)
    800031b4:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    800031b8:	4681                	li	a3,0
    800031ba:	4605                	li	a2,1
    800031bc:	040007b7          	lui	a5,0x4000
    800031c0:	17fd                	addi	a5,a5,-1
    800031c2:	00c79593          	slli	a1,a5,0xc
    800031c6:	fe843503          	ld	a0,-24(s0)
    800031ca:	fffff097          	auipc	ra,0xfffff
    800031ce:	194080e7          	jalr	404(ra) # 8000235e <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    800031d2:	4681                	li	a3,0
    800031d4:	4605                	li	a2,1
    800031d6:	020007b7          	lui	a5,0x2000
    800031da:	17fd                	addi	a5,a5,-1
    800031dc:	00d79593          	slli	a1,a5,0xd
    800031e0:	fe843503          	ld	a0,-24(s0)
    800031e4:	fffff097          	auipc	ra,0xfffff
    800031e8:	17a080e7          	jalr	378(ra) # 8000235e <uvmunmap>
  uvmfree(pagetable, sz);
    800031ec:	fe043583          	ld	a1,-32(s0)
    800031f0:	fe843503          	ld	a0,-24(s0)
    800031f4:	fffff097          	auipc	ra,0xfffff
    800031f8:	59c080e7          	jalr	1436(ra) # 80002790 <uvmfree>
}
    800031fc:	0001                	nop
    800031fe:	60e2                	ld	ra,24(sp)
    80003200:	6442                	ld	s0,16(sp)
    80003202:	6105                	addi	sp,sp,32
    80003204:	8082                	ret

0000000080003206 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80003206:	1101                	addi	sp,sp,-32
    80003208:	ec06                	sd	ra,24(sp)
    8000320a:	e822                	sd	s0,16(sp)
    8000320c:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    8000320e:	00000097          	auipc	ra,0x0
    80003212:	d12080e7          	jalr	-750(ra) # 80002f20 <allocproc>
    80003216:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    8000321a:	00009797          	auipc	a5,0x9
    8000321e:	72678793          	addi	a5,a5,1830 # 8000c940 <initproc>
    80003222:	fe843703          	ld	a4,-24(s0)
    80003226:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80003228:	fe843783          	ld	a5,-24(s0)
    8000322c:	6bbc                	ld	a5,80(a5)
    8000322e:	03400613          	li	a2,52
    80003232:	00009597          	auipc	a1,0x9
    80003236:	5b658593          	addi	a1,a1,1462 # 8000c7e8 <initcode>
    8000323a:	853e                	mv	a0,a5
    8000323c:	fffff097          	auipc	ra,0xfffff
    80003240:	294080e7          	jalr	660(ra) # 800024d0 <uvmfirst>
  p->sz = PGSIZE;
    80003244:	fe843783          	ld	a5,-24(s0)
    80003248:	6705                	lui	a4,0x1
    8000324a:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    8000324c:	fe843783          	ld	a5,-24(s0)
    80003250:	6fbc                	ld	a5,88(a5)
    80003252:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80003256:	fe843783          	ld	a5,-24(s0)
    8000325a:	6fbc                	ld	a5,88(a5)
    8000325c:	6705                	lui	a4,0x1
    8000325e:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80003260:	fe843783          	ld	a5,-24(s0)
    80003264:	15878793          	addi	a5,a5,344
    80003268:	4641                	li	a2,16
    8000326a:	00009597          	auipc	a1,0x9
    8000326e:	f9658593          	addi	a1,a1,-106 # 8000c200 <etext+0x200>
    80003272:	853e                	mv	a0,a5
    80003274:	ffffe097          	auipc	ra,0xffffe
    80003278:	5cc080e7          	jalr	1484(ra) # 80001840 <safestrcpy>
  p->cwd = namei("/");
    8000327c:	00009517          	auipc	a0,0x9
    80003280:	f9450513          	addi	a0,a0,-108 # 8000c210 <etext+0x210>
    80003284:	00003097          	auipc	ra,0x3
    80003288:	1c8080e7          	jalr	456(ra) # 8000644c <namei>
    8000328c:	872a                	mv	a4,a0
    8000328e:	fe843783          	ld	a5,-24(s0)
    80003292:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80003296:	fe843783          	ld	a5,-24(s0)
    8000329a:	470d                	li	a4,3
    8000329c:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    8000329e:	fe843783          	ld	a5,-24(s0)
    800032a2:	853e                	mv	a0,a5
    800032a4:	ffffe097          	auipc	ra,0xffffe
    800032a8:	128080e7          	jalr	296(ra) # 800013cc <release>
}
    800032ac:	0001                	nop
    800032ae:	60e2                	ld	ra,24(sp)
    800032b0:	6442                	ld	s0,16(sp)
    800032b2:	6105                	addi	sp,sp,32
    800032b4:	8082                	ret

00000000800032b6 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    800032b6:	7179                	addi	sp,sp,-48
    800032b8:	f406                	sd	ra,40(sp)
    800032ba:	f022                	sd	s0,32(sp)
    800032bc:	1800                	addi	s0,sp,48
    800032be:	87aa                	mv	a5,a0
    800032c0:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    800032c4:	00000097          	auipc	ra,0x0
    800032c8:	bc2080e7          	jalr	-1086(ra) # 80002e86 <myproc>
    800032cc:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    800032d0:	fe043783          	ld	a5,-32(s0)
    800032d4:	67bc                	ld	a5,72(a5)
    800032d6:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    800032da:	fdc42783          	lw	a5,-36(s0)
    800032de:	2781                	sext.w	a5,a5
    800032e0:	02f05963          	blez	a5,80003312 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    800032e4:	fe043783          	ld	a5,-32(s0)
    800032e8:	6ba8                	ld	a0,80(a5)
    800032ea:	fdc42703          	lw	a4,-36(s0)
    800032ee:	fe843783          	ld	a5,-24(s0)
    800032f2:	97ba                	add	a5,a5,a4
    800032f4:	4691                	li	a3,4
    800032f6:	863e                	mv	a2,a5
    800032f8:	fe843583          	ld	a1,-24(s0)
    800032fc:	fffff097          	auipc	ra,0xfffff
    80003300:	25c080e7          	jalr	604(ra) # 80002558 <uvmalloc>
    80003304:	fea43423          	sd	a0,-24(s0)
    80003308:	fe843783          	ld	a5,-24(s0)
    8000330c:	eb95                	bnez	a5,80003340 <growproc+0x8a>
      return -1;
    8000330e:	57fd                	li	a5,-1
    80003310:	a835                	j	8000334c <growproc+0x96>
    }
  } else if(n < 0){
    80003312:	fdc42783          	lw	a5,-36(s0)
    80003316:	2781                	sext.w	a5,a5
    80003318:	0207d463          	bgez	a5,80003340 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    8000331c:	fe043783          	ld	a5,-32(s0)
    80003320:	6bb4                	ld	a3,80(a5)
    80003322:	fdc42703          	lw	a4,-36(s0)
    80003326:	fe843783          	ld	a5,-24(s0)
    8000332a:	97ba                	add	a5,a5,a4
    8000332c:	863e                	mv	a2,a5
    8000332e:	fe843583          	ld	a1,-24(s0)
    80003332:	8536                	mv	a0,a3
    80003334:	fffff097          	auipc	ra,0xfffff
    80003338:	316080e7          	jalr	790(ra) # 8000264a <uvmdealloc>
    8000333c:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80003340:	fe043783          	ld	a5,-32(s0)
    80003344:	fe843703          	ld	a4,-24(s0)
    80003348:	e7b8                	sd	a4,72(a5)
  return 0;
    8000334a:	4781                	li	a5,0
}
    8000334c:	853e                	mv	a0,a5
    8000334e:	70a2                	ld	ra,40(sp)
    80003350:	7402                	ld	s0,32(sp)
    80003352:	6145                	addi	sp,sp,48
    80003354:	8082                	ret

0000000080003356 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80003356:	7179                	addi	sp,sp,-48
    80003358:	f406                	sd	ra,40(sp)
    8000335a:	f022                	sd	s0,32(sp)
    8000335c:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    8000335e:	00000097          	auipc	ra,0x0
    80003362:	b28080e7          	jalr	-1240(ra) # 80002e86 <myproc>
    80003366:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    8000336a:	00000097          	auipc	ra,0x0
    8000336e:	bb6080e7          	jalr	-1098(ra) # 80002f20 <allocproc>
    80003372:	fca43c23          	sd	a0,-40(s0)
    80003376:	fd843783          	ld	a5,-40(s0)
    8000337a:	e399                	bnez	a5,80003380 <fork+0x2a>
    return -1;
    8000337c:	57fd                	li	a5,-1
    8000337e:	aab5                	j	800034fa <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80003380:	fe043783          	ld	a5,-32(s0)
    80003384:	6bb8                	ld	a4,80(a5)
    80003386:	fd843783          	ld	a5,-40(s0)
    8000338a:	6bb4                	ld	a3,80(a5)
    8000338c:	fe043783          	ld	a5,-32(s0)
    80003390:	67bc                	ld	a5,72(a5)
    80003392:	863e                	mv	a2,a5
    80003394:	85b6                	mv	a1,a3
    80003396:	853a                	mv	a0,a4
    80003398:	fffff097          	auipc	ra,0xfffff
    8000339c:	442080e7          	jalr	1090(ra) # 800027da <uvmcopy>
    800033a0:	87aa                	mv	a5,a0
    800033a2:	0207d163          	bgez	a5,800033c4 <fork+0x6e>
    freeproc(np);
    800033a6:	fd843503          	ld	a0,-40(s0)
    800033aa:	00000097          	auipc	ra,0x0
    800033ae:	ca0080e7          	jalr	-864(ra) # 8000304a <freeproc>
    release(&np->lock);
    800033b2:	fd843783          	ld	a5,-40(s0)
    800033b6:	853e                	mv	a0,a5
    800033b8:	ffffe097          	auipc	ra,0xffffe
    800033bc:	014080e7          	jalr	20(ra) # 800013cc <release>
    return -1;
    800033c0:	57fd                	li	a5,-1
    800033c2:	aa25                	j	800034fa <fork+0x1a4>
  }
  np->sz = p->sz;
    800033c4:	fe043783          	ld	a5,-32(s0)
    800033c8:	67b8                	ld	a4,72(a5)
    800033ca:	fd843783          	ld	a5,-40(s0)
    800033ce:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    800033d0:	fe043783          	ld	a5,-32(s0)
    800033d4:	6fb8                	ld	a4,88(a5)
    800033d6:	fd843783          	ld	a5,-40(s0)
    800033da:	6fbc                	ld	a5,88(a5)
    800033dc:	86be                	mv	a3,a5
    800033de:	12000793          	li	a5,288
    800033e2:	863e                	mv	a2,a5
    800033e4:	85ba                	mv	a1,a4
    800033e6:	8536                	mv	a0,a3
    800033e8:	ffffe097          	auipc	ra,0xffffe
    800033ec:	314080e7          	jalr	788(ra) # 800016fc <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    800033f0:	fd843783          	ld	a5,-40(s0)
    800033f4:	6fbc                	ld	a5,88(a5)
    800033f6:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    800033fa:	fe042623          	sw	zero,-20(s0)
    800033fe:	a0a9                	j	80003448 <fork+0xf2>
    if(p->ofile[i])
    80003400:	fe043703          	ld	a4,-32(s0)
    80003404:	fec42783          	lw	a5,-20(s0)
    80003408:	07e9                	addi	a5,a5,26
    8000340a:	078e                	slli	a5,a5,0x3
    8000340c:	97ba                	add	a5,a5,a4
    8000340e:	639c                	ld	a5,0(a5)
    80003410:	c79d                	beqz	a5,8000343e <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80003412:	fe043703          	ld	a4,-32(s0)
    80003416:	fec42783          	lw	a5,-20(s0)
    8000341a:	07e9                	addi	a5,a5,26
    8000341c:	078e                	slli	a5,a5,0x3
    8000341e:	97ba                	add	a5,a5,a4
    80003420:	639c                	ld	a5,0(a5)
    80003422:	853e                	mv	a0,a5
    80003424:	00004097          	auipc	ra,0x4
    80003428:	9c0080e7          	jalr	-1600(ra) # 80006de4 <filedup>
    8000342c:	86aa                	mv	a3,a0
    8000342e:	fd843703          	ld	a4,-40(s0)
    80003432:	fec42783          	lw	a5,-20(s0)
    80003436:	07e9                	addi	a5,a5,26
    80003438:	078e                	slli	a5,a5,0x3
    8000343a:	97ba                	add	a5,a5,a4
    8000343c:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    8000343e:	fec42783          	lw	a5,-20(s0)
    80003442:	2785                	addiw	a5,a5,1
    80003444:	fef42623          	sw	a5,-20(s0)
    80003448:	fec42783          	lw	a5,-20(s0)
    8000344c:	0007871b          	sext.w	a4,a5
    80003450:	47bd                	li	a5,15
    80003452:	fae7d7e3          	bge	a5,a4,80003400 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80003456:	fe043783          	ld	a5,-32(s0)
    8000345a:	1507b783          	ld	a5,336(a5)
    8000345e:	853e                	mv	a0,a5
    80003460:	00002097          	auipc	ra,0x2
    80003464:	27a080e7          	jalr	634(ra) # 800056da <idup>
    80003468:	872a                	mv	a4,a0
    8000346a:	fd843783          	ld	a5,-40(s0)
    8000346e:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80003472:	fd843783          	ld	a5,-40(s0)
    80003476:	15878713          	addi	a4,a5,344
    8000347a:	fe043783          	ld	a5,-32(s0)
    8000347e:	15878793          	addi	a5,a5,344
    80003482:	4641                	li	a2,16
    80003484:	85be                	mv	a1,a5
    80003486:	853a                	mv	a0,a4
    80003488:	ffffe097          	auipc	ra,0xffffe
    8000348c:	3b8080e7          	jalr	952(ra) # 80001840 <safestrcpy>

  pid = np->pid;
    80003490:	fd843783          	ld	a5,-40(s0)
    80003494:	5b9c                	lw	a5,48(a5)
    80003496:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    8000349a:	fd843783          	ld	a5,-40(s0)
    8000349e:	853e                	mv	a0,a5
    800034a0:	ffffe097          	auipc	ra,0xffffe
    800034a4:	f2c080e7          	jalr	-212(ra) # 800013cc <release>

  acquire(&wait_lock);
    800034a8:	00047517          	auipc	a0,0x47
    800034ac:	52850513          	addi	a0,a0,1320 # 8004a9d0 <wait_lock>
    800034b0:	ffffe097          	auipc	ra,0xffffe
    800034b4:	eb8080e7          	jalr	-328(ra) # 80001368 <acquire>
  np->parent = p;
    800034b8:	fd843783          	ld	a5,-40(s0)
    800034bc:	fe043703          	ld	a4,-32(s0)
    800034c0:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    800034c2:	00047517          	auipc	a0,0x47
    800034c6:	50e50513          	addi	a0,a0,1294 # 8004a9d0 <wait_lock>
    800034ca:	ffffe097          	auipc	ra,0xffffe
    800034ce:	f02080e7          	jalr	-254(ra) # 800013cc <release>

  acquire(&np->lock);
    800034d2:	fd843783          	ld	a5,-40(s0)
    800034d6:	853e                	mv	a0,a5
    800034d8:	ffffe097          	auipc	ra,0xffffe
    800034dc:	e90080e7          	jalr	-368(ra) # 80001368 <acquire>
  np->state = RUNNABLE;
    800034e0:	fd843783          	ld	a5,-40(s0)
    800034e4:	470d                	li	a4,3
    800034e6:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    800034e8:	fd843783          	ld	a5,-40(s0)
    800034ec:	853e                	mv	a0,a5
    800034ee:	ffffe097          	auipc	ra,0xffffe
    800034f2:	ede080e7          	jalr	-290(ra) # 800013cc <release>

  return pid;
    800034f6:	fd442783          	lw	a5,-44(s0)
}
    800034fa:	853e                	mv	a0,a5
    800034fc:	70a2                	ld	ra,40(sp)
    800034fe:	7402                	ld	s0,32(sp)
    80003500:	6145                	addi	sp,sp,48
    80003502:	8082                	ret

0000000080003504 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80003504:	7179                	addi	sp,sp,-48
    80003506:	f406                	sd	ra,40(sp)
    80003508:	f022                	sd	s0,32(sp)
    8000350a:	1800                	addi	s0,sp,48
    8000350c:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003510:	00042797          	auipc	a5,0x42
    80003514:	aa878793          	addi	a5,a5,-1368 # 80044fb8 <proc>
    80003518:	fef43423          	sd	a5,-24(s0)
    8000351c:	a081                	j	8000355c <reparent+0x58>
    if(pp->parent == p){
    8000351e:	fe843783          	ld	a5,-24(s0)
    80003522:	7f9c                	ld	a5,56(a5)
    80003524:	fd843703          	ld	a4,-40(s0)
    80003528:	02f71463          	bne	a4,a5,80003550 <reparent+0x4c>
      pp->parent = initproc;
    8000352c:	00009797          	auipc	a5,0x9
    80003530:	41478793          	addi	a5,a5,1044 # 8000c940 <initproc>
    80003534:	6398                	ld	a4,0(a5)
    80003536:	fe843783          	ld	a5,-24(s0)
    8000353a:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    8000353c:	00009797          	auipc	a5,0x9
    80003540:	40478793          	addi	a5,a5,1028 # 8000c940 <initproc>
    80003544:	639c                	ld	a5,0(a5)
    80003546:	853e                	mv	a0,a5
    80003548:	00000097          	auipc	ra,0x0
    8000354c:	57c080e7          	jalr	1404(ra) # 80003ac4 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003550:	fe843783          	ld	a5,-24(s0)
    80003554:	16878793          	addi	a5,a5,360
    80003558:	fef43423          	sd	a5,-24(s0)
    8000355c:	fe843703          	ld	a4,-24(s0)
    80003560:	00047797          	auipc	a5,0x47
    80003564:	45878793          	addi	a5,a5,1112 # 8004a9b8 <pid_lock>
    80003568:	faf76be3          	bltu	a4,a5,8000351e <reparent+0x1a>
    }
  }
}
    8000356c:	0001                	nop
    8000356e:	0001                	nop
    80003570:	70a2                	ld	ra,40(sp)
    80003572:	7402                	ld	s0,32(sp)
    80003574:	6145                	addi	sp,sp,48
    80003576:	8082                	ret

0000000080003578 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80003578:	7139                	addi	sp,sp,-64
    8000357a:	fc06                	sd	ra,56(sp)
    8000357c:	f822                	sd	s0,48(sp)
    8000357e:	0080                	addi	s0,sp,64
    80003580:	87aa                	mv	a5,a0
    80003582:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003586:	00000097          	auipc	ra,0x0
    8000358a:	900080e7          	jalr	-1792(ra) # 80002e86 <myproc>
    8000358e:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80003592:	00009797          	auipc	a5,0x9
    80003596:	3ae78793          	addi	a5,a5,942 # 8000c940 <initproc>
    8000359a:	639c                	ld	a5,0(a5)
    8000359c:	fe043703          	ld	a4,-32(s0)
    800035a0:	00f71a63          	bne	a4,a5,800035b4 <exit+0x3c>
    panic("init exiting");
    800035a4:	00009517          	auipc	a0,0x9
    800035a8:	c7450513          	addi	a0,a0,-908 # 8000c218 <etext+0x218>
    800035ac:	ffffd097          	auipc	ra,0xffffd
    800035b0:	6e0080e7          	jalr	1760(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    800035b4:	fe042623          	sw	zero,-20(s0)
    800035b8:	a881                	j	80003608 <exit+0x90>
    if(p->ofile[fd]){
    800035ba:	fe043703          	ld	a4,-32(s0)
    800035be:	fec42783          	lw	a5,-20(s0)
    800035c2:	07e9                	addi	a5,a5,26
    800035c4:	078e                	slli	a5,a5,0x3
    800035c6:	97ba                	add	a5,a5,a4
    800035c8:	639c                	ld	a5,0(a5)
    800035ca:	cb95                	beqz	a5,800035fe <exit+0x86>
      struct file *f = p->ofile[fd];
    800035cc:	fe043703          	ld	a4,-32(s0)
    800035d0:	fec42783          	lw	a5,-20(s0)
    800035d4:	07e9                	addi	a5,a5,26
    800035d6:	078e                	slli	a5,a5,0x3
    800035d8:	97ba                	add	a5,a5,a4
    800035da:	639c                	ld	a5,0(a5)
    800035dc:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    800035e0:	fd843503          	ld	a0,-40(s0)
    800035e4:	00004097          	auipc	ra,0x4
    800035e8:	866080e7          	jalr	-1946(ra) # 80006e4a <fileclose>
      p->ofile[fd] = 0;
    800035ec:	fe043703          	ld	a4,-32(s0)
    800035f0:	fec42783          	lw	a5,-20(s0)
    800035f4:	07e9                	addi	a5,a5,26
    800035f6:	078e                	slli	a5,a5,0x3
    800035f8:	97ba                	add	a5,a5,a4
    800035fa:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    800035fe:	fec42783          	lw	a5,-20(s0)
    80003602:	2785                	addiw	a5,a5,1
    80003604:	fef42623          	sw	a5,-20(s0)
    80003608:	fec42783          	lw	a5,-20(s0)
    8000360c:	0007871b          	sext.w	a4,a5
    80003610:	47bd                	li	a5,15
    80003612:	fae7d4e3          	bge	a5,a4,800035ba <exit+0x42>
    }
  }

  begin_op();
    80003616:	00003097          	auipc	ra,0x3
    8000361a:	19a080e7          	jalr	410(ra) # 800067b0 <begin_op>
  iput(p->cwd);
    8000361e:	fe043783          	ld	a5,-32(s0)
    80003622:	1507b783          	ld	a5,336(a5)
    80003626:	853e                	mv	a0,a5
    80003628:	00002097          	auipc	ra,0x2
    8000362c:	28c080e7          	jalr	652(ra) # 800058b4 <iput>
  end_op();
    80003630:	00003097          	auipc	ra,0x3
    80003634:	242080e7          	jalr	578(ra) # 80006872 <end_op>
  p->cwd = 0;
    80003638:	fe043783          	ld	a5,-32(s0)
    8000363c:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80003640:	00047517          	auipc	a0,0x47
    80003644:	39050513          	addi	a0,a0,912 # 8004a9d0 <wait_lock>
    80003648:	ffffe097          	auipc	ra,0xffffe
    8000364c:	d20080e7          	jalr	-736(ra) # 80001368 <acquire>

  // Give any children to init.
  reparent(p);
    80003650:	fe043503          	ld	a0,-32(s0)
    80003654:	00000097          	auipc	ra,0x0
    80003658:	eb0080e7          	jalr	-336(ra) # 80003504 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    8000365c:	fe043783          	ld	a5,-32(s0)
    80003660:	7f9c                	ld	a5,56(a5)
    80003662:	853e                	mv	a0,a5
    80003664:	00000097          	auipc	ra,0x0
    80003668:	460080e7          	jalr	1120(ra) # 80003ac4 <wakeup>
  
  acquire(&p->lock);
    8000366c:	fe043783          	ld	a5,-32(s0)
    80003670:	853e                	mv	a0,a5
    80003672:	ffffe097          	auipc	ra,0xffffe
    80003676:	cf6080e7          	jalr	-778(ra) # 80001368 <acquire>

  p->xstate = status;
    8000367a:	fe043783          	ld	a5,-32(s0)
    8000367e:	fcc42703          	lw	a4,-52(s0)
    80003682:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003684:	fe043783          	ld	a5,-32(s0)
    80003688:	4715                	li	a4,5
    8000368a:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    8000368c:	00047517          	auipc	a0,0x47
    80003690:	34450513          	addi	a0,a0,836 # 8004a9d0 <wait_lock>
    80003694:	ffffe097          	auipc	ra,0xffffe
    80003698:	d38080e7          	jalr	-712(ra) # 800013cc <release>

  // Jump into the scheduler, never to return.
  sched();
    8000369c:	00000097          	auipc	ra,0x0
    800036a0:	230080e7          	jalr	560(ra) # 800038cc <sched>
  panic("zombie exit");
    800036a4:	00009517          	auipc	a0,0x9
    800036a8:	b8450513          	addi	a0,a0,-1148 # 8000c228 <etext+0x228>
    800036ac:	ffffd097          	auipc	ra,0xffffd
    800036b0:	5e0080e7          	jalr	1504(ra) # 80000c8c <panic>

00000000800036b4 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800036b4:	7139                	addi	sp,sp,-64
    800036b6:	fc06                	sd	ra,56(sp)
    800036b8:	f822                	sd	s0,48(sp)
    800036ba:	0080                	addi	s0,sp,64
    800036bc:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    800036c0:	fffff097          	auipc	ra,0xfffff
    800036c4:	7c6080e7          	jalr	1990(ra) # 80002e86 <myproc>
    800036c8:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    800036cc:	00047517          	auipc	a0,0x47
    800036d0:	30450513          	addi	a0,a0,772 # 8004a9d0 <wait_lock>
    800036d4:	ffffe097          	auipc	ra,0xffffe
    800036d8:	c94080e7          	jalr	-876(ra) # 80001368 <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800036dc:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800036e0:	00042797          	auipc	a5,0x42
    800036e4:	8d878793          	addi	a5,a5,-1832 # 80044fb8 <proc>
    800036e8:	fef43423          	sd	a5,-24(s0)
    800036ec:	a8d1                	j	800037c0 <wait+0x10c>
      if(pp->parent == p){
    800036ee:	fe843783          	ld	a5,-24(s0)
    800036f2:	7f9c                	ld	a5,56(a5)
    800036f4:	fd843703          	ld	a4,-40(s0)
    800036f8:	0af71e63          	bne	a4,a5,800037b4 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    800036fc:	fe843783          	ld	a5,-24(s0)
    80003700:	853e                	mv	a0,a5
    80003702:	ffffe097          	auipc	ra,0xffffe
    80003706:	c66080e7          	jalr	-922(ra) # 80001368 <acquire>

        havekids = 1;
    8000370a:	4785                	li	a5,1
    8000370c:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    80003710:	fe843783          	ld	a5,-24(s0)
    80003714:	4f9c                	lw	a5,24(a5)
    80003716:	873e                	mv	a4,a5
    80003718:	4795                	li	a5,5
    8000371a:	08f71663          	bne	a4,a5,800037a6 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    8000371e:	fe843783          	ld	a5,-24(s0)
    80003722:	5b9c                	lw	a5,48(a5)
    80003724:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    80003728:	fc843783          	ld	a5,-56(s0)
    8000372c:	c7a9                	beqz	a5,80003776 <wait+0xc2>
    8000372e:	fd843783          	ld	a5,-40(s0)
    80003732:	6bb8                	ld	a4,80(a5)
    80003734:	fe843783          	ld	a5,-24(s0)
    80003738:	02c78793          	addi	a5,a5,44
    8000373c:	4691                	li	a3,4
    8000373e:	863e                	mv	a2,a5
    80003740:	fc843583          	ld	a1,-56(s0)
    80003744:	853a                	mv	a0,a4
    80003746:	fffff097          	auipc	ra,0xfffff
    8000374a:	20a080e7          	jalr	522(ra) # 80002950 <copyout>
    8000374e:	87aa                	mv	a5,a0
    80003750:	0207d363          	bgez	a5,80003776 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    80003754:	fe843783          	ld	a5,-24(s0)
    80003758:	853e                	mv	a0,a5
    8000375a:	ffffe097          	auipc	ra,0xffffe
    8000375e:	c72080e7          	jalr	-910(ra) # 800013cc <release>
            release(&wait_lock);
    80003762:	00047517          	auipc	a0,0x47
    80003766:	26e50513          	addi	a0,a0,622 # 8004a9d0 <wait_lock>
    8000376a:	ffffe097          	auipc	ra,0xffffe
    8000376e:	c62080e7          	jalr	-926(ra) # 800013cc <release>
            return -1;
    80003772:	57fd                	li	a5,-1
    80003774:	a879                	j	80003812 <wait+0x15e>
          }
          freeproc(pp);
    80003776:	fe843503          	ld	a0,-24(s0)
    8000377a:	00000097          	auipc	ra,0x0
    8000377e:	8d0080e7          	jalr	-1840(ra) # 8000304a <freeproc>
          release(&pp->lock);
    80003782:	fe843783          	ld	a5,-24(s0)
    80003786:	853e                	mv	a0,a5
    80003788:	ffffe097          	auipc	ra,0xffffe
    8000378c:	c44080e7          	jalr	-956(ra) # 800013cc <release>
          release(&wait_lock);
    80003790:	00047517          	auipc	a0,0x47
    80003794:	24050513          	addi	a0,a0,576 # 8004a9d0 <wait_lock>
    80003798:	ffffe097          	auipc	ra,0xffffe
    8000379c:	c34080e7          	jalr	-972(ra) # 800013cc <release>
          return pid;
    800037a0:	fd442783          	lw	a5,-44(s0)
    800037a4:	a0bd                	j	80003812 <wait+0x15e>
        }
        release(&pp->lock);
    800037a6:	fe843783          	ld	a5,-24(s0)
    800037aa:	853e                	mv	a0,a5
    800037ac:	ffffe097          	auipc	ra,0xffffe
    800037b0:	c20080e7          	jalr	-992(ra) # 800013cc <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800037b4:	fe843783          	ld	a5,-24(s0)
    800037b8:	16878793          	addi	a5,a5,360
    800037bc:	fef43423          	sd	a5,-24(s0)
    800037c0:	fe843703          	ld	a4,-24(s0)
    800037c4:	00047797          	auipc	a5,0x47
    800037c8:	1f478793          	addi	a5,a5,500 # 8004a9b8 <pid_lock>
    800037cc:	f2f761e3          	bltu	a4,a5,800036ee <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    800037d0:	fe442783          	lw	a5,-28(s0)
    800037d4:	2781                	sext.w	a5,a5
    800037d6:	cb89                	beqz	a5,800037e8 <wait+0x134>
    800037d8:	fd843503          	ld	a0,-40(s0)
    800037dc:	00000097          	auipc	ra,0x0
    800037e0:	47a080e7          	jalr	1146(ra) # 80003c56 <killed>
    800037e4:	87aa                	mv	a5,a0
    800037e6:	cb99                	beqz	a5,800037fc <wait+0x148>
      release(&wait_lock);
    800037e8:	00047517          	auipc	a0,0x47
    800037ec:	1e850513          	addi	a0,a0,488 # 8004a9d0 <wait_lock>
    800037f0:	ffffe097          	auipc	ra,0xffffe
    800037f4:	bdc080e7          	jalr	-1060(ra) # 800013cc <release>
      return -1;
    800037f8:	57fd                	li	a5,-1
    800037fa:	a821                	j	80003812 <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800037fc:	00047597          	auipc	a1,0x47
    80003800:	1d458593          	addi	a1,a1,468 # 8004a9d0 <wait_lock>
    80003804:	fd843503          	ld	a0,-40(s0)
    80003808:	00000097          	auipc	ra,0x0
    8000380c:	240080e7          	jalr	576(ra) # 80003a48 <sleep>
    havekids = 0;
    80003810:	b5f1                	j	800036dc <wait+0x28>
  }
}
    80003812:	853e                	mv	a0,a5
    80003814:	70e2                	ld	ra,56(sp)
    80003816:	7442                	ld	s0,48(sp)
    80003818:	6121                	addi	sp,sp,64
    8000381a:	8082                	ret

000000008000381c <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    8000381c:	1101                	addi	sp,sp,-32
    8000381e:	ec06                	sd	ra,24(sp)
    80003820:	e822                	sd	s0,16(sp)
    80003822:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003824:	fffff097          	auipc	ra,0xfffff
    80003828:	628080e7          	jalr	1576(ra) # 80002e4c <mycpu>
    8000382c:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    80003830:	fe043783          	ld	a5,-32(s0)
    80003834:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    80003838:	fffff097          	auipc	ra,0xfffff
    8000383c:	3f6080e7          	jalr	1014(ra) # 80002c2e <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    80003840:	00041797          	auipc	a5,0x41
    80003844:	77878793          	addi	a5,a5,1912 # 80044fb8 <proc>
    80003848:	fef43423          	sd	a5,-24(s0)
    8000384c:	a0bd                	j	800038ba <scheduler+0x9e>
      acquire(&p->lock);
    8000384e:	fe843783          	ld	a5,-24(s0)
    80003852:	853e                	mv	a0,a5
    80003854:	ffffe097          	auipc	ra,0xffffe
    80003858:	b14080e7          	jalr	-1260(ra) # 80001368 <acquire>
      if(p->state == RUNNABLE) {
    8000385c:	fe843783          	ld	a5,-24(s0)
    80003860:	4f9c                	lw	a5,24(a5)
    80003862:	873e                	mv	a4,a5
    80003864:	478d                	li	a5,3
    80003866:	02f71d63          	bne	a4,a5,800038a0 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    8000386a:	fe843783          	ld	a5,-24(s0)
    8000386e:	4711                	li	a4,4
    80003870:	cf98                	sw	a4,24(a5)
        c->proc = p;
    80003872:	fe043783          	ld	a5,-32(s0)
    80003876:	fe843703          	ld	a4,-24(s0)
    8000387a:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    8000387c:	fe043783          	ld	a5,-32(s0)
    80003880:	00878713          	addi	a4,a5,8
    80003884:	fe843783          	ld	a5,-24(s0)
    80003888:	06078793          	addi	a5,a5,96
    8000388c:	85be                	mv	a1,a5
    8000388e:	853a                	mv	a0,a4
    80003890:	00000097          	auipc	ra,0x0
    80003894:	5d0080e7          	jalr	1488(ra) # 80003e60 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    80003898:	fe043783          	ld	a5,-32(s0)
    8000389c:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    800038a0:	fe843783          	ld	a5,-24(s0)
    800038a4:	853e                	mv	a0,a5
    800038a6:	ffffe097          	auipc	ra,0xffffe
    800038aa:	b26080e7          	jalr	-1242(ra) # 800013cc <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    800038ae:	fe843783          	ld	a5,-24(s0)
    800038b2:	16878793          	addi	a5,a5,360
    800038b6:	fef43423          	sd	a5,-24(s0)
    800038ba:	fe843703          	ld	a4,-24(s0)
    800038be:	00047797          	auipc	a5,0x47
    800038c2:	0fa78793          	addi	a5,a5,250 # 8004a9b8 <pid_lock>
    800038c6:	f8f764e3          	bltu	a4,a5,8000384e <scheduler+0x32>
    intr_on();
    800038ca:	b7bd                	j	80003838 <scheduler+0x1c>

00000000800038cc <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800038cc:	7179                	addi	sp,sp,-48
    800038ce:	f406                	sd	ra,40(sp)
    800038d0:	f022                	sd	s0,32(sp)
    800038d2:	ec26                	sd	s1,24(sp)
    800038d4:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800038d6:	fffff097          	auipc	ra,0xfffff
    800038da:	5b0080e7          	jalr	1456(ra) # 80002e86 <myproc>
    800038de:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800038e2:	fd843783          	ld	a5,-40(s0)
    800038e6:	853e                	mv	a0,a5
    800038e8:	ffffe097          	auipc	ra,0xffffe
    800038ec:	b3a080e7          	jalr	-1222(ra) # 80001422 <holding>
    800038f0:	87aa                	mv	a5,a0
    800038f2:	eb89                	bnez	a5,80003904 <sched+0x38>
    panic("sched p->lock");
    800038f4:	00009517          	auipc	a0,0x9
    800038f8:	94450513          	addi	a0,a0,-1724 # 8000c238 <etext+0x238>
    800038fc:	ffffd097          	auipc	ra,0xffffd
    80003900:	390080e7          	jalr	912(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    80003904:	fffff097          	auipc	ra,0xfffff
    80003908:	548080e7          	jalr	1352(ra) # 80002e4c <mycpu>
    8000390c:	87aa                	mv	a5,a0
    8000390e:	5fbc                	lw	a5,120(a5)
    80003910:	873e                	mv	a4,a5
    80003912:	4785                	li	a5,1
    80003914:	00f70a63          	beq	a4,a5,80003928 <sched+0x5c>
    panic("sched locks");
    80003918:	00009517          	auipc	a0,0x9
    8000391c:	93050513          	addi	a0,a0,-1744 # 8000c248 <etext+0x248>
    80003920:	ffffd097          	auipc	ra,0xffffd
    80003924:	36c080e7          	jalr	876(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    80003928:	fd843783          	ld	a5,-40(s0)
    8000392c:	4f9c                	lw	a5,24(a5)
    8000392e:	873e                	mv	a4,a5
    80003930:	4791                	li	a5,4
    80003932:	00f71a63          	bne	a4,a5,80003946 <sched+0x7a>
    panic("sched running");
    80003936:	00009517          	auipc	a0,0x9
    8000393a:	92250513          	addi	a0,a0,-1758 # 8000c258 <etext+0x258>
    8000393e:	ffffd097          	auipc	ra,0xffffd
    80003942:	34e080e7          	jalr	846(ra) # 80000c8c <panic>
  if(intr_get())
    80003946:	fffff097          	auipc	ra,0xfffff
    8000394a:	312080e7          	jalr	786(ra) # 80002c58 <intr_get>
    8000394e:	87aa                	mv	a5,a0
    80003950:	cb89                	beqz	a5,80003962 <sched+0x96>
    panic("sched interruptible");
    80003952:	00009517          	auipc	a0,0x9
    80003956:	91650513          	addi	a0,a0,-1770 # 8000c268 <etext+0x268>
    8000395a:	ffffd097          	auipc	ra,0xffffd
    8000395e:	332080e7          	jalr	818(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    80003962:	fffff097          	auipc	ra,0xfffff
    80003966:	4ea080e7          	jalr	1258(ra) # 80002e4c <mycpu>
    8000396a:	87aa                	mv	a5,a0
    8000396c:	5ffc                	lw	a5,124(a5)
    8000396e:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003972:	fd843783          	ld	a5,-40(s0)
    80003976:	06078493          	addi	s1,a5,96
    8000397a:	fffff097          	auipc	ra,0xfffff
    8000397e:	4d2080e7          	jalr	1234(ra) # 80002e4c <mycpu>
    80003982:	87aa                	mv	a5,a0
    80003984:	07a1                	addi	a5,a5,8
    80003986:	85be                	mv	a1,a5
    80003988:	8526                	mv	a0,s1
    8000398a:	00000097          	auipc	ra,0x0
    8000398e:	4d6080e7          	jalr	1238(ra) # 80003e60 <swtch>
  mycpu()->intena = intena;
    80003992:	fffff097          	auipc	ra,0xfffff
    80003996:	4ba080e7          	jalr	1210(ra) # 80002e4c <mycpu>
    8000399a:	872a                	mv	a4,a0
    8000399c:	fd442783          	lw	a5,-44(s0)
    800039a0:	df7c                	sw	a5,124(a4)
}
    800039a2:	0001                	nop
    800039a4:	70a2                	ld	ra,40(sp)
    800039a6:	7402                	ld	s0,32(sp)
    800039a8:	64e2                	ld	s1,24(sp)
    800039aa:	6145                	addi	sp,sp,48
    800039ac:	8082                	ret

00000000800039ae <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800039ae:	1101                	addi	sp,sp,-32
    800039b0:	ec06                	sd	ra,24(sp)
    800039b2:	e822                	sd	s0,16(sp)
    800039b4:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800039b6:	fffff097          	auipc	ra,0xfffff
    800039ba:	4d0080e7          	jalr	1232(ra) # 80002e86 <myproc>
    800039be:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800039c2:	fe843783          	ld	a5,-24(s0)
    800039c6:	853e                	mv	a0,a5
    800039c8:	ffffe097          	auipc	ra,0xffffe
    800039cc:	9a0080e7          	jalr	-1632(ra) # 80001368 <acquire>
  p->state = RUNNABLE;
    800039d0:	fe843783          	ld	a5,-24(s0)
    800039d4:	470d                	li	a4,3
    800039d6:	cf98                	sw	a4,24(a5)
  sched();
    800039d8:	00000097          	auipc	ra,0x0
    800039dc:	ef4080e7          	jalr	-268(ra) # 800038cc <sched>
  release(&p->lock);
    800039e0:	fe843783          	ld	a5,-24(s0)
    800039e4:	853e                	mv	a0,a5
    800039e6:	ffffe097          	auipc	ra,0xffffe
    800039ea:	9e6080e7          	jalr	-1562(ra) # 800013cc <release>
}
    800039ee:	0001                	nop
    800039f0:	60e2                	ld	ra,24(sp)
    800039f2:	6442                	ld	s0,16(sp)
    800039f4:	6105                	addi	sp,sp,32
    800039f6:	8082                	ret

00000000800039f8 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800039f8:	1141                	addi	sp,sp,-16
    800039fa:	e406                	sd	ra,8(sp)
    800039fc:	e022                	sd	s0,0(sp)
    800039fe:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003a00:	fffff097          	auipc	ra,0xfffff
    80003a04:	486080e7          	jalr	1158(ra) # 80002e86 <myproc>
    80003a08:	87aa                	mv	a5,a0
    80003a0a:	853e                	mv	a0,a5
    80003a0c:	ffffe097          	auipc	ra,0xffffe
    80003a10:	9c0080e7          	jalr	-1600(ra) # 800013cc <release>

  if (first) {
    80003a14:	00009797          	auipc	a5,0x9
    80003a18:	db078793          	addi	a5,a5,-592 # 8000c7c4 <first.1706>
    80003a1c:	439c                	lw	a5,0(a5)
    80003a1e:	cf81                	beqz	a5,80003a36 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003a20:	00009797          	auipc	a5,0x9
    80003a24:	da478793          	addi	a5,a5,-604 # 8000c7c4 <first.1706>
    80003a28:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003a2c:	4505                	li	a0,1
    80003a2e:	00001097          	auipc	ra,0x1
    80003a32:	582080e7          	jalr	1410(ra) # 80004fb0 <fsinit>
  }

  usertrapret();
    80003a36:	00001097          	auipc	ra,0x1
    80003a3a:	816080e7          	jalr	-2026(ra) # 8000424c <usertrapret>
}
    80003a3e:	0001                	nop
    80003a40:	60a2                	ld	ra,8(sp)
    80003a42:	6402                	ld	s0,0(sp)
    80003a44:	0141                	addi	sp,sp,16
    80003a46:	8082                	ret

0000000080003a48 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003a48:	7179                	addi	sp,sp,-48
    80003a4a:	f406                	sd	ra,40(sp)
    80003a4c:	f022                	sd	s0,32(sp)
    80003a4e:	1800                	addi	s0,sp,48
    80003a50:	fca43c23          	sd	a0,-40(s0)
    80003a54:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003a58:	fffff097          	auipc	ra,0xfffff
    80003a5c:	42e080e7          	jalr	1070(ra) # 80002e86 <myproc>
    80003a60:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003a64:	fe843783          	ld	a5,-24(s0)
    80003a68:	853e                	mv	a0,a5
    80003a6a:	ffffe097          	auipc	ra,0xffffe
    80003a6e:	8fe080e7          	jalr	-1794(ra) # 80001368 <acquire>
  release(lk);
    80003a72:	fd043503          	ld	a0,-48(s0)
    80003a76:	ffffe097          	auipc	ra,0xffffe
    80003a7a:	956080e7          	jalr	-1706(ra) # 800013cc <release>

  // Go to sleep.
  p->chan = chan;
    80003a7e:	fe843783          	ld	a5,-24(s0)
    80003a82:	fd843703          	ld	a4,-40(s0)
    80003a86:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003a88:	fe843783          	ld	a5,-24(s0)
    80003a8c:	4709                	li	a4,2
    80003a8e:	cf98                	sw	a4,24(a5)

  sched();
    80003a90:	00000097          	auipc	ra,0x0
    80003a94:	e3c080e7          	jalr	-452(ra) # 800038cc <sched>

  // Tidy up.
  p->chan = 0;
    80003a98:	fe843783          	ld	a5,-24(s0)
    80003a9c:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    80003aa0:	fe843783          	ld	a5,-24(s0)
    80003aa4:	853e                	mv	a0,a5
    80003aa6:	ffffe097          	auipc	ra,0xffffe
    80003aaa:	926080e7          	jalr	-1754(ra) # 800013cc <release>
  acquire(lk);
    80003aae:	fd043503          	ld	a0,-48(s0)
    80003ab2:	ffffe097          	auipc	ra,0xffffe
    80003ab6:	8b6080e7          	jalr	-1866(ra) # 80001368 <acquire>
}
    80003aba:	0001                	nop
    80003abc:	70a2                	ld	ra,40(sp)
    80003abe:	7402                	ld	s0,32(sp)
    80003ac0:	6145                	addi	sp,sp,48
    80003ac2:	8082                	ret

0000000080003ac4 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    80003ac4:	7179                	addi	sp,sp,-48
    80003ac6:	f406                	sd	ra,40(sp)
    80003ac8:	f022                	sd	s0,32(sp)
    80003aca:	1800                	addi	s0,sp,48
    80003acc:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80003ad0:	00041797          	auipc	a5,0x41
    80003ad4:	4e878793          	addi	a5,a5,1256 # 80044fb8 <proc>
    80003ad8:	fef43423          	sd	a5,-24(s0)
    80003adc:	a051                	j	80003b60 <wakeup+0x9c>
    if(p != myproc()){
    80003ade:	fffff097          	auipc	ra,0xfffff
    80003ae2:	3a8080e7          	jalr	936(ra) # 80002e86 <myproc>
    80003ae6:	872a                	mv	a4,a0
    80003ae8:	fe843783          	ld	a5,-24(s0)
    80003aec:	06e78463          	beq	a5,a4,80003b54 <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    80003af0:	fe843783          	ld	a5,-24(s0)
    80003af4:	853e                	mv	a0,a5
    80003af6:	ffffe097          	auipc	ra,0xffffe
    80003afa:	92c080e7          	jalr	-1748(ra) # 80001422 <holding>
    80003afe:	87aa                	mv	a5,a0
    80003b00:	cb81                	beqz	a5,80003b10 <wakeup+0x4c>
    80003b02:	fe843783          	ld	a5,-24(s0)
    80003b06:	4f9c                	lw	a5,24(a5)
    80003b08:	873e                	mv	a4,a5
    80003b0a:	4785                	li	a5,1
    80003b0c:	04f70363          	beq	a4,a5,80003b52 <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    80003b10:	fe843783          	ld	a5,-24(s0)
    80003b14:	853e                	mv	a0,a5
    80003b16:	ffffe097          	auipc	ra,0xffffe
    80003b1a:	852080e7          	jalr	-1966(ra) # 80001368 <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80003b1e:	fe843783          	ld	a5,-24(s0)
    80003b22:	4f9c                	lw	a5,24(a5)
    80003b24:	873e                	mv	a4,a5
    80003b26:	4789                	li	a5,2
    80003b28:	00f71d63          	bne	a4,a5,80003b42 <wakeup+0x7e>
    80003b2c:	fe843783          	ld	a5,-24(s0)
    80003b30:	739c                	ld	a5,32(a5)
    80003b32:	fd843703          	ld	a4,-40(s0)
    80003b36:	00f71663          	bne	a4,a5,80003b42 <wakeup+0x7e>
        p->state = RUNNABLE;
    80003b3a:	fe843783          	ld	a5,-24(s0)
    80003b3e:	470d                	li	a4,3
    80003b40:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003b42:	fe843783          	ld	a5,-24(s0)
    80003b46:	853e                	mv	a0,a5
    80003b48:	ffffe097          	auipc	ra,0xffffe
    80003b4c:	884080e7          	jalr	-1916(ra) # 800013cc <release>
    80003b50:	a011                	j	80003b54 <wakeup+0x90>
        continue;
    80003b52:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    80003b54:	fe843783          	ld	a5,-24(s0)
    80003b58:	16878793          	addi	a5,a5,360
    80003b5c:	fef43423          	sd	a5,-24(s0)
    80003b60:	fe843703          	ld	a4,-24(s0)
    80003b64:	00047797          	auipc	a5,0x47
    80003b68:	e5478793          	addi	a5,a5,-428 # 8004a9b8 <pid_lock>
    80003b6c:	f6f769e3          	bltu	a4,a5,80003ade <wakeup+0x1a>
    }
  }
}
    80003b70:	0001                	nop
    80003b72:	0001                	nop
    80003b74:	70a2                	ld	ra,40(sp)
    80003b76:	7402                	ld	s0,32(sp)
    80003b78:	6145                	addi	sp,sp,48
    80003b7a:	8082                	ret

0000000080003b7c <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003b7c:	7179                	addi	sp,sp,-48
    80003b7e:	f406                	sd	ra,40(sp)
    80003b80:	f022                	sd	s0,32(sp)
    80003b82:	1800                	addi	s0,sp,48
    80003b84:	87aa                	mv	a5,a0
    80003b86:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003b8a:	00041797          	auipc	a5,0x41
    80003b8e:	42e78793          	addi	a5,a5,1070 # 80044fb8 <proc>
    80003b92:	fef43423          	sd	a5,-24(s0)
    80003b96:	a0ad                	j	80003c00 <kill+0x84>
    acquire(&p->lock);
    80003b98:	fe843783          	ld	a5,-24(s0)
    80003b9c:	853e                	mv	a0,a5
    80003b9e:	ffffd097          	auipc	ra,0xffffd
    80003ba2:	7ca080e7          	jalr	1994(ra) # 80001368 <acquire>
    if(p->pid == pid){
    80003ba6:	fe843783          	ld	a5,-24(s0)
    80003baa:	5b98                	lw	a4,48(a5)
    80003bac:	fdc42783          	lw	a5,-36(s0)
    80003bb0:	2781                	sext.w	a5,a5
    80003bb2:	02e79a63          	bne	a5,a4,80003be6 <kill+0x6a>
      p->killed = 1;
    80003bb6:	fe843783          	ld	a5,-24(s0)
    80003bba:	4705                	li	a4,1
    80003bbc:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80003bbe:	fe843783          	ld	a5,-24(s0)
    80003bc2:	4f9c                	lw	a5,24(a5)
    80003bc4:	873e                	mv	a4,a5
    80003bc6:	4789                	li	a5,2
    80003bc8:	00f71663          	bne	a4,a5,80003bd4 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003bcc:	fe843783          	ld	a5,-24(s0)
    80003bd0:	470d                	li	a4,3
    80003bd2:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003bd4:	fe843783          	ld	a5,-24(s0)
    80003bd8:	853e                	mv	a0,a5
    80003bda:	ffffd097          	auipc	ra,0xffffd
    80003bde:	7f2080e7          	jalr	2034(ra) # 800013cc <release>
      return 0;
    80003be2:	4781                	li	a5,0
    80003be4:	a03d                	j	80003c12 <kill+0x96>
    }
    release(&p->lock);
    80003be6:	fe843783          	ld	a5,-24(s0)
    80003bea:	853e                	mv	a0,a5
    80003bec:	ffffd097          	auipc	ra,0xffffd
    80003bf0:	7e0080e7          	jalr	2016(ra) # 800013cc <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003bf4:	fe843783          	ld	a5,-24(s0)
    80003bf8:	16878793          	addi	a5,a5,360
    80003bfc:	fef43423          	sd	a5,-24(s0)
    80003c00:	fe843703          	ld	a4,-24(s0)
    80003c04:	00047797          	auipc	a5,0x47
    80003c08:	db478793          	addi	a5,a5,-588 # 8004a9b8 <pid_lock>
    80003c0c:	f8f766e3          	bltu	a4,a5,80003b98 <kill+0x1c>
  }
  return -1;
    80003c10:	57fd                	li	a5,-1
}
    80003c12:	853e                	mv	a0,a5
    80003c14:	70a2                	ld	ra,40(sp)
    80003c16:	7402                	ld	s0,32(sp)
    80003c18:	6145                	addi	sp,sp,48
    80003c1a:	8082                	ret

0000000080003c1c <setkilled>:

void
setkilled(struct proc *p)
{
    80003c1c:	1101                	addi	sp,sp,-32
    80003c1e:	ec06                	sd	ra,24(sp)
    80003c20:	e822                	sd	s0,16(sp)
    80003c22:	1000                	addi	s0,sp,32
    80003c24:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003c28:	fe843783          	ld	a5,-24(s0)
    80003c2c:	853e                	mv	a0,a5
    80003c2e:	ffffd097          	auipc	ra,0xffffd
    80003c32:	73a080e7          	jalr	1850(ra) # 80001368 <acquire>
  p->killed = 1;
    80003c36:	fe843783          	ld	a5,-24(s0)
    80003c3a:	4705                	li	a4,1
    80003c3c:	d798                	sw	a4,40(a5)
  release(&p->lock);
    80003c3e:	fe843783          	ld	a5,-24(s0)
    80003c42:	853e                	mv	a0,a5
    80003c44:	ffffd097          	auipc	ra,0xffffd
    80003c48:	788080e7          	jalr	1928(ra) # 800013cc <release>
}
    80003c4c:	0001                	nop
    80003c4e:	60e2                	ld	ra,24(sp)
    80003c50:	6442                	ld	s0,16(sp)
    80003c52:	6105                	addi	sp,sp,32
    80003c54:	8082                	ret

0000000080003c56 <killed>:

int
killed(struct proc *p)
{
    80003c56:	7179                	addi	sp,sp,-48
    80003c58:	f406                	sd	ra,40(sp)
    80003c5a:	f022                	sd	s0,32(sp)
    80003c5c:	1800                	addi	s0,sp,48
    80003c5e:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    80003c62:	fd843783          	ld	a5,-40(s0)
    80003c66:	853e                	mv	a0,a5
    80003c68:	ffffd097          	auipc	ra,0xffffd
    80003c6c:	700080e7          	jalr	1792(ra) # 80001368 <acquire>
  k = p->killed;
    80003c70:	fd843783          	ld	a5,-40(s0)
    80003c74:	579c                	lw	a5,40(a5)
    80003c76:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    80003c7a:	fd843783          	ld	a5,-40(s0)
    80003c7e:	853e                	mv	a0,a5
    80003c80:	ffffd097          	auipc	ra,0xffffd
    80003c84:	74c080e7          	jalr	1868(ra) # 800013cc <release>
  return k;
    80003c88:	fec42783          	lw	a5,-20(s0)
}
    80003c8c:	853e                	mv	a0,a5
    80003c8e:	70a2                	ld	ra,40(sp)
    80003c90:	7402                	ld	s0,32(sp)
    80003c92:	6145                	addi	sp,sp,48
    80003c94:	8082                	ret

0000000080003c96 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003c96:	7139                	addi	sp,sp,-64
    80003c98:	fc06                	sd	ra,56(sp)
    80003c9a:	f822                	sd	s0,48(sp)
    80003c9c:	0080                	addi	s0,sp,64
    80003c9e:	87aa                	mv	a5,a0
    80003ca0:	fcb43823          	sd	a1,-48(s0)
    80003ca4:	fcc43423          	sd	a2,-56(s0)
    80003ca8:	fcd43023          	sd	a3,-64(s0)
    80003cac:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003cb0:	fffff097          	auipc	ra,0xfffff
    80003cb4:	1d6080e7          	jalr	470(ra) # 80002e86 <myproc>
    80003cb8:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003cbc:	fdc42783          	lw	a5,-36(s0)
    80003cc0:	2781                	sext.w	a5,a5
    80003cc2:	c38d                	beqz	a5,80003ce4 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80003cc4:	fe843783          	ld	a5,-24(s0)
    80003cc8:	6bbc                	ld	a5,80(a5)
    80003cca:	fc043683          	ld	a3,-64(s0)
    80003cce:	fc843603          	ld	a2,-56(s0)
    80003cd2:	fd043583          	ld	a1,-48(s0)
    80003cd6:	853e                	mv	a0,a5
    80003cd8:	fffff097          	auipc	ra,0xfffff
    80003cdc:	c78080e7          	jalr	-904(ra) # 80002950 <copyout>
    80003ce0:	87aa                	mv	a5,a0
    80003ce2:	a839                	j	80003d00 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    80003ce4:	fd043783          	ld	a5,-48(s0)
    80003ce8:	fc043703          	ld	a4,-64(s0)
    80003cec:	2701                	sext.w	a4,a4
    80003cee:	863a                	mv	a2,a4
    80003cf0:	fc843583          	ld	a1,-56(s0)
    80003cf4:	853e                	mv	a0,a5
    80003cf6:	ffffe097          	auipc	ra,0xffffe
    80003cfa:	92a080e7          	jalr	-1750(ra) # 80001620 <memmove>
    return 0;
    80003cfe:	4781                	li	a5,0
  }
}
    80003d00:	853e                	mv	a0,a5
    80003d02:	70e2                	ld	ra,56(sp)
    80003d04:	7442                	ld	s0,48(sp)
    80003d06:	6121                	addi	sp,sp,64
    80003d08:	8082                	ret

0000000080003d0a <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003d0a:	7139                	addi	sp,sp,-64
    80003d0c:	fc06                	sd	ra,56(sp)
    80003d0e:	f822                	sd	s0,48(sp)
    80003d10:	0080                	addi	s0,sp,64
    80003d12:	fca43c23          	sd	a0,-40(s0)
    80003d16:	87ae                	mv	a5,a1
    80003d18:	fcc43423          	sd	a2,-56(s0)
    80003d1c:	fcd43023          	sd	a3,-64(s0)
    80003d20:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003d24:	fffff097          	auipc	ra,0xfffff
    80003d28:	162080e7          	jalr	354(ra) # 80002e86 <myproc>
    80003d2c:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003d30:	fd442783          	lw	a5,-44(s0)
    80003d34:	2781                	sext.w	a5,a5
    80003d36:	c38d                	beqz	a5,80003d58 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80003d38:	fe843783          	ld	a5,-24(s0)
    80003d3c:	6bbc                	ld	a5,80(a5)
    80003d3e:	fc043683          	ld	a3,-64(s0)
    80003d42:	fc843603          	ld	a2,-56(s0)
    80003d46:	fd843583          	ld	a1,-40(s0)
    80003d4a:	853e                	mv	a0,a5
    80003d4c:	fffff097          	auipc	ra,0xfffff
    80003d50:	cd2080e7          	jalr	-814(ra) # 80002a1e <copyin>
    80003d54:	87aa                	mv	a5,a0
    80003d56:	a839                	j	80003d74 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003d58:	fc843783          	ld	a5,-56(s0)
    80003d5c:	fc043703          	ld	a4,-64(s0)
    80003d60:	2701                	sext.w	a4,a4
    80003d62:	863a                	mv	a2,a4
    80003d64:	85be                	mv	a1,a5
    80003d66:	fd843503          	ld	a0,-40(s0)
    80003d6a:	ffffe097          	auipc	ra,0xffffe
    80003d6e:	8b6080e7          	jalr	-1866(ra) # 80001620 <memmove>
    return 0;
    80003d72:	4781                	li	a5,0
  }
}
    80003d74:	853e                	mv	a0,a5
    80003d76:	70e2                	ld	ra,56(sp)
    80003d78:	7442                	ld	s0,48(sp)
    80003d7a:	6121                	addi	sp,sp,64
    80003d7c:	8082                	ret

0000000080003d7e <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003d7e:	1101                	addi	sp,sp,-32
    80003d80:	ec06                	sd	ra,24(sp)
    80003d82:	e822                	sd	s0,16(sp)
    80003d84:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003d86:	00008517          	auipc	a0,0x8
    80003d8a:	4fa50513          	addi	a0,a0,1274 # 8000c280 <etext+0x280>
    80003d8e:	ffffd097          	auipc	ra,0xffffd
    80003d92:	ca8080e7          	jalr	-856(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003d96:	00041797          	auipc	a5,0x41
    80003d9a:	22278793          	addi	a5,a5,546 # 80044fb8 <proc>
    80003d9e:	fef43423          	sd	a5,-24(s0)
    80003da2:	a04d                	j	80003e44 <procdump+0xc6>
    if(p->state == UNUSED)
    80003da4:	fe843783          	ld	a5,-24(s0)
    80003da8:	4f9c                	lw	a5,24(a5)
    80003daa:	c7d1                	beqz	a5,80003e36 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003dac:	fe843783          	ld	a5,-24(s0)
    80003db0:	4f9c                	lw	a5,24(a5)
    80003db2:	873e                	mv	a4,a5
    80003db4:	4795                	li	a5,5
    80003db6:	02e7ee63          	bltu	a5,a4,80003df2 <procdump+0x74>
    80003dba:	fe843783          	ld	a5,-24(s0)
    80003dbe:	4f9c                	lw	a5,24(a5)
    80003dc0:	00009717          	auipc	a4,0x9
    80003dc4:	a6070713          	addi	a4,a4,-1440 # 8000c820 <states.1751>
    80003dc8:	1782                	slli	a5,a5,0x20
    80003dca:	9381                	srli	a5,a5,0x20
    80003dcc:	078e                	slli	a5,a5,0x3
    80003dce:	97ba                	add	a5,a5,a4
    80003dd0:	639c                	ld	a5,0(a5)
    80003dd2:	c385                	beqz	a5,80003df2 <procdump+0x74>
      state = states[p->state];
    80003dd4:	fe843783          	ld	a5,-24(s0)
    80003dd8:	4f9c                	lw	a5,24(a5)
    80003dda:	00009717          	auipc	a4,0x9
    80003dde:	a4670713          	addi	a4,a4,-1466 # 8000c820 <states.1751>
    80003de2:	1782                	slli	a5,a5,0x20
    80003de4:	9381                	srli	a5,a5,0x20
    80003de6:	078e                	slli	a5,a5,0x3
    80003de8:	97ba                	add	a5,a5,a4
    80003dea:	639c                	ld	a5,0(a5)
    80003dec:	fef43023          	sd	a5,-32(s0)
    80003df0:	a039                	j	80003dfe <procdump+0x80>
    else
      state = "???";
    80003df2:	00008797          	auipc	a5,0x8
    80003df6:	49678793          	addi	a5,a5,1174 # 8000c288 <etext+0x288>
    80003dfa:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003dfe:	fe843783          	ld	a5,-24(s0)
    80003e02:	5b98                	lw	a4,48(a5)
    80003e04:	fe843783          	ld	a5,-24(s0)
    80003e08:	15878793          	addi	a5,a5,344
    80003e0c:	86be                	mv	a3,a5
    80003e0e:	fe043603          	ld	a2,-32(s0)
    80003e12:	85ba                	mv	a1,a4
    80003e14:	00008517          	auipc	a0,0x8
    80003e18:	47c50513          	addi	a0,a0,1148 # 8000c290 <etext+0x290>
    80003e1c:	ffffd097          	auipc	ra,0xffffd
    80003e20:	c1a080e7          	jalr	-998(ra) # 80000a36 <printf>
    printf("\n");
    80003e24:	00008517          	auipc	a0,0x8
    80003e28:	45c50513          	addi	a0,a0,1116 # 8000c280 <etext+0x280>
    80003e2c:	ffffd097          	auipc	ra,0xffffd
    80003e30:	c0a080e7          	jalr	-1014(ra) # 80000a36 <printf>
    80003e34:	a011                	j	80003e38 <procdump+0xba>
      continue;
    80003e36:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003e38:	fe843783          	ld	a5,-24(s0)
    80003e3c:	16878793          	addi	a5,a5,360
    80003e40:	fef43423          	sd	a5,-24(s0)
    80003e44:	fe843703          	ld	a4,-24(s0)
    80003e48:	00047797          	auipc	a5,0x47
    80003e4c:	b7078793          	addi	a5,a5,-1168 # 8004a9b8 <pid_lock>
    80003e50:	f4f76ae3          	bltu	a4,a5,80003da4 <procdump+0x26>
  }
}
    80003e54:	0001                	nop
    80003e56:	0001                	nop
    80003e58:	60e2                	ld	ra,24(sp)
    80003e5a:	6442                	ld	s0,16(sp)
    80003e5c:	6105                	addi	sp,sp,32
    80003e5e:	8082                	ret

0000000080003e60 <swtch>:
    80003e60:	00153023          	sd	ra,0(a0)
    80003e64:	00253423          	sd	sp,8(a0)
    80003e68:	e900                	sd	s0,16(a0)
    80003e6a:	ed04                	sd	s1,24(a0)
    80003e6c:	03253023          	sd	s2,32(a0)
    80003e70:	03353423          	sd	s3,40(a0)
    80003e74:	03453823          	sd	s4,48(a0)
    80003e78:	03553c23          	sd	s5,56(a0)
    80003e7c:	05653023          	sd	s6,64(a0)
    80003e80:	05753423          	sd	s7,72(a0)
    80003e84:	05853823          	sd	s8,80(a0)
    80003e88:	05953c23          	sd	s9,88(a0)
    80003e8c:	07a53023          	sd	s10,96(a0)
    80003e90:	07b53423          	sd	s11,104(a0)
    80003e94:	0005b083          	ld	ra,0(a1)
    80003e98:	0085b103          	ld	sp,8(a1)
    80003e9c:	6980                	ld	s0,16(a1)
    80003e9e:	6d84                	ld	s1,24(a1)
    80003ea0:	0205b903          	ld	s2,32(a1)
    80003ea4:	0285b983          	ld	s3,40(a1)
    80003ea8:	0305ba03          	ld	s4,48(a1)
    80003eac:	0385ba83          	ld	s5,56(a1)
    80003eb0:	0405bb03          	ld	s6,64(a1)
    80003eb4:	0485bb83          	ld	s7,72(a1)
    80003eb8:	0505bc03          	ld	s8,80(a1)
    80003ebc:	0585bc83          	ld	s9,88(a1)
    80003ec0:	0605bd03          	ld	s10,96(a1)
    80003ec4:	0685bd83          	ld	s11,104(a1)
    80003ec8:	8082                	ret

0000000080003eca <r_sstatus>:
{
    80003eca:	1101                	addi	sp,sp,-32
    80003ecc:	ec22                	sd	s0,24(sp)
    80003ece:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003ed0:	100027f3          	csrr	a5,sstatus
    80003ed4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003ed8:	fe843783          	ld	a5,-24(s0)
}
    80003edc:	853e                	mv	a0,a5
    80003ede:	6462                	ld	s0,24(sp)
    80003ee0:	6105                	addi	sp,sp,32
    80003ee2:	8082                	ret

0000000080003ee4 <w_sstatus>:
{
    80003ee4:	1101                	addi	sp,sp,-32
    80003ee6:	ec22                	sd	s0,24(sp)
    80003ee8:	1000                	addi	s0,sp,32
    80003eea:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003eee:	fe843783          	ld	a5,-24(s0)
    80003ef2:	10079073          	csrw	sstatus,a5
}
    80003ef6:	0001                	nop
    80003ef8:	6462                	ld	s0,24(sp)
    80003efa:	6105                	addi	sp,sp,32
    80003efc:	8082                	ret

0000000080003efe <r_sip>:
{
    80003efe:	1101                	addi	sp,sp,-32
    80003f00:	ec22                	sd	s0,24(sp)
    80003f02:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003f04:	144027f3          	csrr	a5,sip
    80003f08:	fef43423          	sd	a5,-24(s0)
  return x;
    80003f0c:	fe843783          	ld	a5,-24(s0)
}
    80003f10:	853e                	mv	a0,a5
    80003f12:	6462                	ld	s0,24(sp)
    80003f14:	6105                	addi	sp,sp,32
    80003f16:	8082                	ret

0000000080003f18 <w_sip>:
{
    80003f18:	1101                	addi	sp,sp,-32
    80003f1a:	ec22                	sd	s0,24(sp)
    80003f1c:	1000                	addi	s0,sp,32
    80003f1e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003f22:	fe843783          	ld	a5,-24(s0)
    80003f26:	14479073          	csrw	sip,a5
}
    80003f2a:	0001                	nop
    80003f2c:	6462                	ld	s0,24(sp)
    80003f2e:	6105                	addi	sp,sp,32
    80003f30:	8082                	ret

0000000080003f32 <w_sepc>:
{
    80003f32:	1101                	addi	sp,sp,-32
    80003f34:	ec22                	sd	s0,24(sp)
    80003f36:	1000                	addi	s0,sp,32
    80003f38:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003f3c:	fe843783          	ld	a5,-24(s0)
    80003f40:	14179073          	csrw	sepc,a5
}
    80003f44:	0001                	nop
    80003f46:	6462                	ld	s0,24(sp)
    80003f48:	6105                	addi	sp,sp,32
    80003f4a:	8082                	ret

0000000080003f4c <r_sepc>:
{
    80003f4c:	1101                	addi	sp,sp,-32
    80003f4e:	ec22                	sd	s0,24(sp)
    80003f50:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003f52:	141027f3          	csrr	a5,sepc
    80003f56:	fef43423          	sd	a5,-24(s0)
  return x;
    80003f5a:	fe843783          	ld	a5,-24(s0)
}
    80003f5e:	853e                	mv	a0,a5
    80003f60:	6462                	ld	s0,24(sp)
    80003f62:	6105                	addi	sp,sp,32
    80003f64:	8082                	ret

0000000080003f66 <w_stvec>:
{
    80003f66:	1101                	addi	sp,sp,-32
    80003f68:	ec22                	sd	s0,24(sp)
    80003f6a:	1000                	addi	s0,sp,32
    80003f6c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003f70:	fe843783          	ld	a5,-24(s0)
    80003f74:	10579073          	csrw	stvec,a5
}
    80003f78:	0001                	nop
    80003f7a:	6462                	ld	s0,24(sp)
    80003f7c:	6105                	addi	sp,sp,32
    80003f7e:	8082                	ret

0000000080003f80 <r_satp>:
{
    80003f80:	1101                	addi	sp,sp,-32
    80003f82:	ec22                	sd	s0,24(sp)
    80003f84:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003f86:	180027f3          	csrr	a5,satp
    80003f8a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003f8e:	fe843783          	ld	a5,-24(s0)
}
    80003f92:	853e                	mv	a0,a5
    80003f94:	6462                	ld	s0,24(sp)
    80003f96:	6105                	addi	sp,sp,32
    80003f98:	8082                	ret

0000000080003f9a <r_scause>:
{
    80003f9a:	1101                	addi	sp,sp,-32
    80003f9c:	ec22                	sd	s0,24(sp)
    80003f9e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003fa0:	142027f3          	csrr	a5,scause
    80003fa4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003fa8:	fe843783          	ld	a5,-24(s0)
}
    80003fac:	853e                	mv	a0,a5
    80003fae:	6462                	ld	s0,24(sp)
    80003fb0:	6105                	addi	sp,sp,32
    80003fb2:	8082                	ret

0000000080003fb4 <r_stval>:
{
    80003fb4:	1101                	addi	sp,sp,-32
    80003fb6:	ec22                	sd	s0,24(sp)
    80003fb8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003fba:	143027f3          	csrr	a5,stval
    80003fbe:	fef43423          	sd	a5,-24(s0)
  return x;
    80003fc2:	fe843783          	ld	a5,-24(s0)
}
    80003fc6:	853e                	mv	a0,a5
    80003fc8:	6462                	ld	s0,24(sp)
    80003fca:	6105                	addi	sp,sp,32
    80003fcc:	8082                	ret

0000000080003fce <intr_on>:
{
    80003fce:	1141                	addi	sp,sp,-16
    80003fd0:	e406                	sd	ra,8(sp)
    80003fd2:	e022                	sd	s0,0(sp)
    80003fd4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003fd6:	00000097          	auipc	ra,0x0
    80003fda:	ef4080e7          	jalr	-268(ra) # 80003eca <r_sstatus>
    80003fde:	87aa                	mv	a5,a0
    80003fe0:	0027e793          	ori	a5,a5,2
    80003fe4:	853e                	mv	a0,a5
    80003fe6:	00000097          	auipc	ra,0x0
    80003fea:	efe080e7          	jalr	-258(ra) # 80003ee4 <w_sstatus>
}
    80003fee:	0001                	nop
    80003ff0:	60a2                	ld	ra,8(sp)
    80003ff2:	6402                	ld	s0,0(sp)
    80003ff4:	0141                	addi	sp,sp,16
    80003ff6:	8082                	ret

0000000080003ff8 <intr_off>:
{
    80003ff8:	1141                	addi	sp,sp,-16
    80003ffa:	e406                	sd	ra,8(sp)
    80003ffc:	e022                	sd	s0,0(sp)
    80003ffe:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80004000:	00000097          	auipc	ra,0x0
    80004004:	eca080e7          	jalr	-310(ra) # 80003eca <r_sstatus>
    80004008:	87aa                	mv	a5,a0
    8000400a:	9bf5                	andi	a5,a5,-3
    8000400c:	853e                	mv	a0,a5
    8000400e:	00000097          	auipc	ra,0x0
    80004012:	ed6080e7          	jalr	-298(ra) # 80003ee4 <w_sstatus>
}
    80004016:	0001                	nop
    80004018:	60a2                	ld	ra,8(sp)
    8000401a:	6402                	ld	s0,0(sp)
    8000401c:	0141                	addi	sp,sp,16
    8000401e:	8082                	ret

0000000080004020 <intr_get>:
{
    80004020:	1101                	addi	sp,sp,-32
    80004022:	ec06                	sd	ra,24(sp)
    80004024:	e822                	sd	s0,16(sp)
    80004026:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80004028:	00000097          	auipc	ra,0x0
    8000402c:	ea2080e7          	jalr	-350(ra) # 80003eca <r_sstatus>
    80004030:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80004034:	fe843783          	ld	a5,-24(s0)
    80004038:	8b89                	andi	a5,a5,2
    8000403a:	00f037b3          	snez	a5,a5
    8000403e:	0ff7f793          	andi	a5,a5,255
    80004042:	2781                	sext.w	a5,a5
}
    80004044:	853e                	mv	a0,a5
    80004046:	60e2                	ld	ra,24(sp)
    80004048:	6442                	ld	s0,16(sp)
    8000404a:	6105                	addi	sp,sp,32
    8000404c:	8082                	ret

000000008000404e <r_tp>:
{
    8000404e:	1101                	addi	sp,sp,-32
    80004050:	ec22                	sd	s0,24(sp)
    80004052:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80004054:	8792                	mv	a5,tp
    80004056:	fef43423          	sd	a5,-24(s0)
  return x;
    8000405a:	fe843783          	ld	a5,-24(s0)
}
    8000405e:	853e                	mv	a0,a5
    80004060:	6462                	ld	s0,24(sp)
    80004062:	6105                	addi	sp,sp,32
    80004064:	8082                	ret

0000000080004066 <trapinit>:

extern int swapin(uint64 va);

void
trapinit(void)
{
    80004066:	1141                	addi	sp,sp,-16
    80004068:	e406                	sd	ra,8(sp)
    8000406a:	e022                	sd	s0,0(sp)
    8000406c:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    8000406e:	00008597          	auipc	a1,0x8
    80004072:	26a58593          	addi	a1,a1,618 # 8000c2d8 <etext+0x2d8>
    80004076:	00047517          	auipc	a0,0x47
    8000407a:	97250513          	addi	a0,a0,-1678 # 8004a9e8 <tickslock>
    8000407e:	ffffd097          	auipc	ra,0xffffd
    80004082:	2ba080e7          	jalr	698(ra) # 80001338 <initlock>
}
    80004086:	0001                	nop
    80004088:	60a2                	ld	ra,8(sp)
    8000408a:	6402                	ld	s0,0(sp)
    8000408c:	0141                	addi	sp,sp,16
    8000408e:	8082                	ret

0000000080004090 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80004090:	1141                	addi	sp,sp,-16
    80004092:	e406                	sd	ra,8(sp)
    80004094:	e022                	sd	s0,0(sp)
    80004096:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80004098:	00005797          	auipc	a5,0x5
    8000409c:	e0878793          	addi	a5,a5,-504 # 80008ea0 <kernelvec>
    800040a0:	853e                	mv	a0,a5
    800040a2:	00000097          	auipc	ra,0x0
    800040a6:	ec4080e7          	jalr	-316(ra) # 80003f66 <w_stvec>
}
    800040aa:	0001                	nop
    800040ac:	60a2                	ld	ra,8(sp)
    800040ae:	6402                	ld	s0,0(sp)
    800040b0:	0141                	addi	sp,sp,16
    800040b2:	8082                	ret

00000000800040b4 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    800040b4:	7139                	addi	sp,sp,-64
    800040b6:	fc06                	sd	ra,56(sp)
    800040b8:	f822                	sd	s0,48(sp)
    800040ba:	f426                	sd	s1,40(sp)
    800040bc:	0080                	addi	s0,sp,64
  int which_dev = 0;
    800040be:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    800040c2:	00000097          	auipc	ra,0x0
    800040c6:	e08080e7          	jalr	-504(ra) # 80003eca <r_sstatus>
    800040ca:	87aa                	mv	a5,a0
    800040cc:	1007f793          	andi	a5,a5,256
    800040d0:	cb89                	beqz	a5,800040e2 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    800040d2:	00008517          	auipc	a0,0x8
    800040d6:	20e50513          	addi	a0,a0,526 # 8000c2e0 <etext+0x2e0>
    800040da:	ffffd097          	auipc	ra,0xffffd
    800040de:	bb2080e7          	jalr	-1102(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    800040e2:	00005797          	auipc	a5,0x5
    800040e6:	dbe78793          	addi	a5,a5,-578 # 80008ea0 <kernelvec>
    800040ea:	853e                	mv	a0,a5
    800040ec:	00000097          	auipc	ra,0x0
    800040f0:	e7a080e7          	jalr	-390(ra) # 80003f66 <w_stvec>

  struct proc *p = myproc();
    800040f4:	fffff097          	auipc	ra,0xfffff
    800040f8:	d92080e7          	jalr	-622(ra) # 80002e86 <myproc>
    800040fc:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80004100:	fd043783          	ld	a5,-48(s0)
    80004104:	6fa4                	ld	s1,88(a5)
    80004106:	00000097          	auipc	ra,0x0
    8000410a:	e46080e7          	jalr	-442(ra) # 80003f4c <r_sepc>
    8000410e:	87aa                	mv	a5,a0
    80004110:	ec9c                	sd	a5,24(s1)

  uint64 scause = r_scause();
    80004112:	00000097          	auipc	ra,0x0
    80004116:	e88080e7          	jalr	-376(ra) # 80003f9a <r_scause>
    8000411a:	fca43423          	sd	a0,-56(s0)

  int pfhandled = 0;
    8000411e:	fc042c23          	sw	zero,-40(s0)
  if(scause == 13) {
    80004122:	fc843703          	ld	a4,-56(s0)
    80004126:	47b5                	li	a5,13
    80004128:	02f71163          	bne	a4,a5,8000414a <usertrap+0x96>
    // page fault

    uint64 va = (uint64)r_stval();
    8000412c:	00000097          	auipc	ra,0x0
    80004130:	e88080e7          	jalr	-376(ra) # 80003fb4 <r_stval>
    80004134:	fca43023          	sd	a0,-64(s0)
    pfhandled = swapin(va);
    80004138:	fc043503          	ld	a0,-64(s0)
    8000413c:	ffffe097          	auipc	ra,0xffffe
    80004140:	cea080e7          	jalr	-790(ra) # 80001e26 <swapin>
    80004144:	87aa                	mv	a5,a0
    80004146:	fcf42c23          	sw	a5,-40(s0)
  }

  if(pfhandled == 0)
    8000414a:	fd842783          	lw	a5,-40(s0)
    8000414e:	2781                	sext.w	a5,a5
    80004150:	efc5                	bnez	a5,80004208 <usertrap+0x154>
  {
    if(scause == 8) {
    80004152:	fc843703          	ld	a4,-56(s0)
    80004156:	47a1                	li	a5,8
    80004158:	04f71163          	bne	a4,a5,8000419a <usertrap+0xe6>
      // system call

      if(killed(p))
    8000415c:	fd043503          	ld	a0,-48(s0)
    80004160:	00000097          	auipc	ra,0x0
    80004164:	af6080e7          	jalr	-1290(ra) # 80003c56 <killed>
    80004168:	87aa                	mv	a5,a0
    8000416a:	c791                	beqz	a5,80004176 <usertrap+0xc2>
        exit(-1);
    8000416c:	557d                	li	a0,-1
    8000416e:	fffff097          	auipc	ra,0xfffff
    80004172:	40a080e7          	jalr	1034(ra) # 80003578 <exit>

      // sepc points to the ecall instruction,
      // but we want to return to the next instruction.
      p->trapframe->epc += 4;
    80004176:	fd043783          	ld	a5,-48(s0)
    8000417a:	6fbc                	ld	a5,88(a5)
    8000417c:	6f98                	ld	a4,24(a5)
    8000417e:	fd043783          	ld	a5,-48(s0)
    80004182:	6fbc                	ld	a5,88(a5)
    80004184:	0711                	addi	a4,a4,4
    80004186:	ef98                	sd	a4,24(a5)

      // an interrupt will change sepc, scause, and sstatus,
      // so enable only now that we're done with those registers.
      intr_on();
    80004188:	00000097          	auipc	ra,0x0
    8000418c:	e46080e7          	jalr	-442(ra) # 80003fce <intr_on>

      syscall();
    80004190:	00000097          	auipc	ra,0x0
    80004194:	6a8080e7          	jalr	1704(ra) # 80004838 <syscall>
    80004198:	a885                	j	80004208 <usertrap+0x154>
    } else if((which_dev = devintr()) != 0){
    8000419a:	00000097          	auipc	ra,0x0
    8000419e:	36e080e7          	jalr	878(ra) # 80004508 <devintr>
    800041a2:	87aa                	mv	a5,a0
    800041a4:	fcf42e23          	sw	a5,-36(s0)
    800041a8:	fdc42783          	lw	a5,-36(s0)
    800041ac:	2781                	sext.w	a5,a5
    800041ae:	efa9                	bnez	a5,80004208 <usertrap+0x154>
      // ok
    } else {
      printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    800041b0:	00000097          	auipc	ra,0x0
    800041b4:	dea080e7          	jalr	-534(ra) # 80003f9a <r_scause>
    800041b8:	872a                	mv	a4,a0
    800041ba:	fd043783          	ld	a5,-48(s0)
    800041be:	5b9c                	lw	a5,48(a5)
    800041c0:	863e                	mv	a2,a5
    800041c2:	85ba                	mv	a1,a4
    800041c4:	00008517          	auipc	a0,0x8
    800041c8:	13c50513          	addi	a0,a0,316 # 8000c300 <etext+0x300>
    800041cc:	ffffd097          	auipc	ra,0xffffd
    800041d0:	86a080e7          	jalr	-1942(ra) # 80000a36 <printf>
      printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    800041d4:	00000097          	auipc	ra,0x0
    800041d8:	d78080e7          	jalr	-648(ra) # 80003f4c <r_sepc>
    800041dc:	84aa                	mv	s1,a0
    800041de:	00000097          	auipc	ra,0x0
    800041e2:	dd6080e7          	jalr	-554(ra) # 80003fb4 <r_stval>
    800041e6:	87aa                	mv	a5,a0
    800041e8:	863e                	mv	a2,a5
    800041ea:	85a6                	mv	a1,s1
    800041ec:	00008517          	auipc	a0,0x8
    800041f0:	14450513          	addi	a0,a0,324 # 8000c330 <etext+0x330>
    800041f4:	ffffd097          	auipc	ra,0xffffd
    800041f8:	842080e7          	jalr	-1982(ra) # 80000a36 <printf>
      setkilled(p);
    800041fc:	fd043503          	ld	a0,-48(s0)
    80004200:	00000097          	auipc	ra,0x0
    80004204:	a1c080e7          	jalr	-1508(ra) # 80003c1c <setkilled>
    }
  }

  if(killed(p))
    80004208:	fd043503          	ld	a0,-48(s0)
    8000420c:	00000097          	auipc	ra,0x0
    80004210:	a4a080e7          	jalr	-1462(ra) # 80003c56 <killed>
    80004214:	87aa                	mv	a5,a0
    80004216:	c791                	beqz	a5,80004222 <usertrap+0x16e>
    exit(-1);
    80004218:	557d                	li	a0,-1
    8000421a:	fffff097          	auipc	ra,0xfffff
    8000421e:	35e080e7          	jalr	862(ra) # 80003578 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80004222:	fdc42783          	lw	a5,-36(s0)
    80004226:	0007871b          	sext.w	a4,a5
    8000422a:	4789                	li	a5,2
    8000422c:	00f71663          	bne	a4,a5,80004238 <usertrap+0x184>
    yield();
    80004230:	fffff097          	auipc	ra,0xfffff
    80004234:	77e080e7          	jalr	1918(ra) # 800039ae <yield>

  usertrapret();
    80004238:	00000097          	auipc	ra,0x0
    8000423c:	014080e7          	jalr	20(ra) # 8000424c <usertrapret>
}
    80004240:	0001                	nop
    80004242:	70e2                	ld	ra,56(sp)
    80004244:	7442                	ld	s0,48(sp)
    80004246:	74a2                	ld	s1,40(sp)
    80004248:	6121                	addi	sp,sp,64
    8000424a:	8082                	ret

000000008000424c <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    8000424c:	715d                	addi	sp,sp,-80
    8000424e:	e486                	sd	ra,72(sp)
    80004250:	e0a2                	sd	s0,64(sp)
    80004252:	fc26                	sd	s1,56(sp)
    80004254:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80004256:	fffff097          	auipc	ra,0xfffff
    8000425a:	c30080e7          	jalr	-976(ra) # 80002e86 <myproc>
    8000425e:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80004262:	00000097          	auipc	ra,0x0
    80004266:	d96080e7          	jalr	-618(ra) # 80003ff8 <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    8000426a:	00007717          	auipc	a4,0x7
    8000426e:	d9670713          	addi	a4,a4,-618 # 8000b000 <_trampoline>
    80004272:	00007797          	auipc	a5,0x7
    80004276:	d8e78793          	addi	a5,a5,-626 # 8000b000 <_trampoline>
    8000427a:	8f1d                	sub	a4,a4,a5
    8000427c:	040007b7          	lui	a5,0x4000
    80004280:	17fd                	addi	a5,a5,-1
    80004282:	07b2                	slli	a5,a5,0xc
    80004284:	97ba                	add	a5,a5,a4
    80004286:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    8000428a:	fd043503          	ld	a0,-48(s0)
    8000428e:	00000097          	auipc	ra,0x0
    80004292:	cd8080e7          	jalr	-808(ra) # 80003f66 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80004296:	fd843783          	ld	a5,-40(s0)
    8000429a:	6fa4                	ld	s1,88(a5)
    8000429c:	00000097          	auipc	ra,0x0
    800042a0:	ce4080e7          	jalr	-796(ra) # 80003f80 <r_satp>
    800042a4:	87aa                	mv	a5,a0
    800042a6:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    800042a8:	fd843783          	ld	a5,-40(s0)
    800042ac:	63b4                	ld	a3,64(a5)
    800042ae:	fd843783          	ld	a5,-40(s0)
    800042b2:	6fbc                	ld	a5,88(a5)
    800042b4:	6705                	lui	a4,0x1
    800042b6:	9736                	add	a4,a4,a3
    800042b8:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    800042ba:	fd843783          	ld	a5,-40(s0)
    800042be:	6fbc                	ld	a5,88(a5)
    800042c0:	00000717          	auipc	a4,0x0
    800042c4:	df470713          	addi	a4,a4,-524 # 800040b4 <usertrap>
    800042c8:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    800042ca:	fd843783          	ld	a5,-40(s0)
    800042ce:	6fa4                	ld	s1,88(a5)
    800042d0:	00000097          	auipc	ra,0x0
    800042d4:	d7e080e7          	jalr	-642(ra) # 8000404e <r_tp>
    800042d8:	87aa                	mv	a5,a0
    800042da:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    800042dc:	00000097          	auipc	ra,0x0
    800042e0:	bee080e7          	jalr	-1042(ra) # 80003eca <r_sstatus>
    800042e4:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    800042e8:	fc843783          	ld	a5,-56(s0)
    800042ec:	eff7f793          	andi	a5,a5,-257
    800042f0:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    800042f4:	fc843783          	ld	a5,-56(s0)
    800042f8:	0207e793          	ori	a5,a5,32
    800042fc:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80004300:	fc843503          	ld	a0,-56(s0)
    80004304:	00000097          	auipc	ra,0x0
    80004308:	be0080e7          	jalr	-1056(ra) # 80003ee4 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    8000430c:	fd843783          	ld	a5,-40(s0)
    80004310:	6fbc                	ld	a5,88(a5)
    80004312:	6f9c                	ld	a5,24(a5)
    80004314:	853e                	mv	a0,a5
    80004316:	00000097          	auipc	ra,0x0
    8000431a:	c1c080e7          	jalr	-996(ra) # 80003f32 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    8000431e:	fd843783          	ld	a5,-40(s0)
    80004322:	6bbc                	ld	a5,80(a5)
    80004324:	00c7d713          	srli	a4,a5,0xc
    80004328:	57fd                	li	a5,-1
    8000432a:	17fe                	slli	a5,a5,0x3f
    8000432c:	8fd9                	or	a5,a5,a4
    8000432e:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80004332:	00007717          	auipc	a4,0x7
    80004336:	d6a70713          	addi	a4,a4,-662 # 8000b09c <userret>
    8000433a:	00007797          	auipc	a5,0x7
    8000433e:	cc678793          	addi	a5,a5,-826 # 8000b000 <_trampoline>
    80004342:	8f1d                	sub	a4,a4,a5
    80004344:	040007b7          	lui	a5,0x4000
    80004348:	17fd                	addi	a5,a5,-1
    8000434a:	07b2                	slli	a5,a5,0xc
    8000434c:	97ba                	add	a5,a5,a4
    8000434e:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80004352:	fb843783          	ld	a5,-72(s0)
    80004356:	fc043503          	ld	a0,-64(s0)
    8000435a:	9782                	jalr	a5
}
    8000435c:	0001                	nop
    8000435e:	60a6                	ld	ra,72(sp)
    80004360:	6406                	ld	s0,64(sp)
    80004362:	74e2                	ld	s1,56(sp)
    80004364:	6161                	addi	sp,sp,80
    80004366:	8082                	ret

0000000080004368 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80004368:	7139                	addi	sp,sp,-64
    8000436a:	fc06                	sd	ra,56(sp)
    8000436c:	f822                	sd	s0,48(sp)
    8000436e:	f426                	sd	s1,40(sp)
    80004370:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80004372:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80004376:	00000097          	auipc	ra,0x0
    8000437a:	bd6080e7          	jalr	-1066(ra) # 80003f4c <r_sepc>
    8000437e:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80004382:	00000097          	auipc	ra,0x0
    80004386:	b48080e7          	jalr	-1208(ra) # 80003eca <r_sstatus>
    8000438a:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    8000438e:	00000097          	auipc	ra,0x0
    80004392:	c0c080e7          	jalr	-1012(ra) # 80003f9a <r_scause>
    80004396:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    8000439a:	fc843783          	ld	a5,-56(s0)
    8000439e:	1007f793          	andi	a5,a5,256
    800043a2:	eb89                	bnez	a5,800043b4 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    800043a4:	00008517          	auipc	a0,0x8
    800043a8:	fac50513          	addi	a0,a0,-84 # 8000c350 <etext+0x350>
    800043ac:	ffffd097          	auipc	ra,0xffffd
    800043b0:	8e0080e7          	jalr	-1824(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    800043b4:	00000097          	auipc	ra,0x0
    800043b8:	c6c080e7          	jalr	-916(ra) # 80004020 <intr_get>
    800043bc:	87aa                	mv	a5,a0
    800043be:	cb89                	beqz	a5,800043d0 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    800043c0:	00008517          	auipc	a0,0x8
    800043c4:	fb850513          	addi	a0,a0,-72 # 8000c378 <etext+0x378>
    800043c8:	ffffd097          	auipc	ra,0xffffd
    800043cc:	8c4080e7          	jalr	-1852(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    800043d0:	00000097          	auipc	ra,0x0
    800043d4:	138080e7          	jalr	312(ra) # 80004508 <devintr>
    800043d8:	87aa                	mv	a5,a0
    800043da:	fcf42e23          	sw	a5,-36(s0)
    800043de:	fdc42783          	lw	a5,-36(s0)
    800043e2:	2781                	sext.w	a5,a5
    800043e4:	e7b9                	bnez	a5,80004432 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    800043e6:	fc043583          	ld	a1,-64(s0)
    800043ea:	00008517          	auipc	a0,0x8
    800043ee:	fae50513          	addi	a0,a0,-82 # 8000c398 <etext+0x398>
    800043f2:	ffffc097          	auipc	ra,0xffffc
    800043f6:	644080e7          	jalr	1604(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    800043fa:	00000097          	auipc	ra,0x0
    800043fe:	b52080e7          	jalr	-1198(ra) # 80003f4c <r_sepc>
    80004402:	84aa                	mv	s1,a0
    80004404:	00000097          	auipc	ra,0x0
    80004408:	bb0080e7          	jalr	-1104(ra) # 80003fb4 <r_stval>
    8000440c:	87aa                	mv	a5,a0
    8000440e:	863e                	mv	a2,a5
    80004410:	85a6                	mv	a1,s1
    80004412:	00008517          	auipc	a0,0x8
    80004416:	f9650513          	addi	a0,a0,-106 # 8000c3a8 <etext+0x3a8>
    8000441a:	ffffc097          	auipc	ra,0xffffc
    8000441e:	61c080e7          	jalr	1564(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80004422:	00008517          	auipc	a0,0x8
    80004426:	f9e50513          	addi	a0,a0,-98 # 8000c3c0 <etext+0x3c0>
    8000442a:	ffffd097          	auipc	ra,0xffffd
    8000442e:	862080e7          	jalr	-1950(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80004432:	fdc42783          	lw	a5,-36(s0)
    80004436:	0007871b          	sext.w	a4,a5
    8000443a:	4789                	li	a5,2
    8000443c:	02f71663          	bne	a4,a5,80004468 <kerneltrap+0x100>
    80004440:	fffff097          	auipc	ra,0xfffff
    80004444:	a46080e7          	jalr	-1466(ra) # 80002e86 <myproc>
    80004448:	87aa                	mv	a5,a0
    8000444a:	cf99                	beqz	a5,80004468 <kerneltrap+0x100>
    8000444c:	fffff097          	auipc	ra,0xfffff
    80004450:	a3a080e7          	jalr	-1478(ra) # 80002e86 <myproc>
    80004454:	87aa                	mv	a5,a0
    80004456:	4f9c                	lw	a5,24(a5)
    80004458:	873e                	mv	a4,a5
    8000445a:	4791                	li	a5,4
    8000445c:	00f71663          	bne	a4,a5,80004468 <kerneltrap+0x100>
    yield();
    80004460:	fffff097          	auipc	ra,0xfffff
    80004464:	54e080e7          	jalr	1358(ra) # 800039ae <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80004468:	fd043503          	ld	a0,-48(s0)
    8000446c:	00000097          	auipc	ra,0x0
    80004470:	ac6080e7          	jalr	-1338(ra) # 80003f32 <w_sepc>
  w_sstatus(sstatus);
    80004474:	fc843503          	ld	a0,-56(s0)
    80004478:	00000097          	auipc	ra,0x0
    8000447c:	a6c080e7          	jalr	-1428(ra) # 80003ee4 <w_sstatus>
}
    80004480:	0001                	nop
    80004482:	70e2                	ld	ra,56(sp)
    80004484:	7442                	ld	s0,48(sp)
    80004486:	74a2                	ld	s1,40(sp)
    80004488:	6121                	addi	sp,sp,64
    8000448a:	8082                	ret

000000008000448c <clockintr>:

void
clockintr()
{
    8000448c:	1141                	addi	sp,sp,-16
    8000448e:	e406                	sd	ra,8(sp)
    80004490:	e022                	sd	s0,0(sp)
    80004492:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004494:	00046517          	auipc	a0,0x46
    80004498:	55450513          	addi	a0,a0,1364 # 8004a9e8 <tickslock>
    8000449c:	ffffd097          	auipc	ra,0xffffd
    800044a0:	ecc080e7          	jalr	-308(ra) # 80001368 <acquire>
  ticks++;
    800044a4:	00008797          	auipc	a5,0x8
    800044a8:	4a478793          	addi	a5,a5,1188 # 8000c948 <ticks>
    800044ac:	439c                	lw	a5,0(a5)
    800044ae:	2785                	addiw	a5,a5,1
    800044b0:	0007871b          	sext.w	a4,a5
    800044b4:	00008797          	auipc	a5,0x8
    800044b8:	49478793          	addi	a5,a5,1172 # 8000c948 <ticks>
    800044bc:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    800044be:	00008797          	auipc	a5,0x8
    800044c2:	48a78793          	addi	a5,a5,1162 # 8000c948 <ticks>
    800044c6:	439c                	lw	a5,0(a5)
    800044c8:	873e                	mv	a4,a5
    800044ca:	06400793          	li	a5,100
    800044ce:	02f777bb          	remuw	a5,a4,a5
    800044d2:	2781                	sext.w	a5,a5
    800044d4:	e789                	bnez	a5,800044de <clockintr+0x52>
  {
    updaterefhistory();
    800044d6:	ffffd097          	auipc	ra,0xffffd
    800044da:	6d0080e7          	jalr	1744(ra) # 80001ba6 <updaterefhistory>
  }

  wakeup(&ticks);
    800044de:	00008517          	auipc	a0,0x8
    800044e2:	46a50513          	addi	a0,a0,1130 # 8000c948 <ticks>
    800044e6:	fffff097          	auipc	ra,0xfffff
    800044ea:	5de080e7          	jalr	1502(ra) # 80003ac4 <wakeup>
  release(&tickslock);
    800044ee:	00046517          	auipc	a0,0x46
    800044f2:	4fa50513          	addi	a0,a0,1274 # 8004a9e8 <tickslock>
    800044f6:	ffffd097          	auipc	ra,0xffffd
    800044fa:	ed6080e7          	jalr	-298(ra) # 800013cc <release>
}
    800044fe:	0001                	nop
    80004500:	60a2                	ld	ra,8(sp)
    80004502:	6402                	ld	s0,0(sp)
    80004504:	0141                	addi	sp,sp,16
    80004506:	8082                	ret

0000000080004508 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    80004508:	1101                	addi	sp,sp,-32
    8000450a:	ec06                	sd	ra,24(sp)
    8000450c:	e822                	sd	s0,16(sp)
    8000450e:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80004510:	00000097          	auipc	ra,0x0
    80004514:	a8a080e7          	jalr	-1398(ra) # 80003f9a <r_scause>
    80004518:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    8000451c:	fe843783          	ld	a5,-24(s0)
    80004520:	0a07d263          	bgez	a5,800045c4 <devintr+0xbc>
     (scause & 0xff) == 9){
    80004524:	fe843783          	ld	a5,-24(s0)
    80004528:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    8000452c:	47a5                	li	a5,9
    8000452e:	08f71b63          	bne	a4,a5,800045c4 <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004532:	00005097          	auipc	ra,0x5
    80004536:	aaa080e7          	jalr	-1366(ra) # 80008fdc <plic_claim>
    8000453a:	87aa                	mv	a5,a0
    8000453c:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004540:	fe442783          	lw	a5,-28(s0)
    80004544:	0007871b          	sext.w	a4,a5
    80004548:	47a9                	li	a5,10
    8000454a:	00f71763          	bne	a4,a5,80004558 <devintr+0x50>
      uartintr();
    8000454e:	ffffd097          	auipc	ra,0xffffd
    80004552:	ae0080e7          	jalr	-1312(ra) # 8000102e <uartintr>
    80004556:	a891                	j	800045aa <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    80004558:	fe442783          	lw	a5,-28(s0)
    8000455c:	0007871b          	sext.w	a4,a5
    80004560:	4785                	li	a5,1
    80004562:	00f71863          	bne	a4,a5,80004572 <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004566:	4501                	li	a0,0
    80004568:	00006097          	auipc	ra,0x6
    8000456c:	f12080e7          	jalr	-238(ra) # 8000a47a <virtio_disk_intr>
    80004570:	a82d                	j	800045aa <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    80004572:	fe442783          	lw	a5,-28(s0)
    80004576:	0007871b          	sext.w	a4,a5
    8000457a:	4789                	li	a5,2
    8000457c:	00f71863          	bne	a4,a5,8000458c <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    80004580:	4505                	li	a0,1
    80004582:	00006097          	auipc	ra,0x6
    80004586:	ef8080e7          	jalr	-264(ra) # 8000a47a <virtio_disk_intr>
    8000458a:	a005                	j	800045aa <devintr+0xa2>
    } else if(irq){
    8000458c:	fe442783          	lw	a5,-28(s0)
    80004590:	2781                	sext.w	a5,a5
    80004592:	cf81                	beqz	a5,800045aa <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    80004594:	fe442783          	lw	a5,-28(s0)
    80004598:	85be                	mv	a1,a5
    8000459a:	00008517          	auipc	a0,0x8
    8000459e:	e3650513          	addi	a0,a0,-458 # 8000c3d0 <etext+0x3d0>
    800045a2:	ffffc097          	auipc	ra,0xffffc
    800045a6:	494080e7          	jalr	1172(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800045aa:	fe442783          	lw	a5,-28(s0)
    800045ae:	2781                	sext.w	a5,a5
    800045b0:	cb81                	beqz	a5,800045c0 <devintr+0xb8>
      plic_complete(irq);
    800045b2:	fe442783          	lw	a5,-28(s0)
    800045b6:	853e                	mv	a0,a5
    800045b8:	00005097          	auipc	ra,0x5
    800045bc:	a62080e7          	jalr	-1438(ra) # 8000901a <plic_complete>

    return 1;
    800045c0:	4785                	li	a5,1
    800045c2:	a081                	j	80004602 <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    800045c4:	fe843703          	ld	a4,-24(s0)
    800045c8:	57fd                	li	a5,-1
    800045ca:	17fe                	slli	a5,a5,0x3f
    800045cc:	0785                	addi	a5,a5,1
    800045ce:	02f71963          	bne	a4,a5,80004600 <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800045d2:	fffff097          	auipc	ra,0xfffff
    800045d6:	856080e7          	jalr	-1962(ra) # 80002e28 <cpuid>
    800045da:	87aa                	mv	a5,a0
    800045dc:	e789                	bnez	a5,800045e6 <devintr+0xde>
      clockintr();
    800045de:	00000097          	auipc	ra,0x0
    800045e2:	eae080e7          	jalr	-338(ra) # 8000448c <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800045e6:	00000097          	auipc	ra,0x0
    800045ea:	918080e7          	jalr	-1768(ra) # 80003efe <r_sip>
    800045ee:	87aa                	mv	a5,a0
    800045f0:	9bf5                	andi	a5,a5,-3
    800045f2:	853e                	mv	a0,a5
    800045f4:	00000097          	auipc	ra,0x0
    800045f8:	924080e7          	jalr	-1756(ra) # 80003f18 <w_sip>

    return 2;
    800045fc:	4789                	li	a5,2
    800045fe:	a011                	j	80004602 <devintr+0xfa>
  } else {
    return 0;
    80004600:	4781                	li	a5,0
  }
}
    80004602:	853e                	mv	a0,a5
    80004604:	60e2                	ld	ra,24(sp)
    80004606:	6442                	ld	s0,16(sp)
    80004608:	6105                	addi	sp,sp,32
    8000460a:	8082                	ret

000000008000460c <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    8000460c:	7179                	addi	sp,sp,-48
    8000460e:	f406                	sd	ra,40(sp)
    80004610:	f022                	sd	s0,32(sp)
    80004612:	1800                	addi	s0,sp,48
    80004614:	fca43c23          	sd	a0,-40(s0)
    80004618:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000461c:	fffff097          	auipc	ra,0xfffff
    80004620:	86a080e7          	jalr	-1942(ra) # 80002e86 <myproc>
    80004624:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    80004628:	fe843783          	ld	a5,-24(s0)
    8000462c:	67bc                	ld	a5,72(a5)
    8000462e:	fd843703          	ld	a4,-40(s0)
    80004632:	00f77b63          	bgeu	a4,a5,80004648 <fetchaddr+0x3c>
    80004636:	fd843783          	ld	a5,-40(s0)
    8000463a:	00878713          	addi	a4,a5,8
    8000463e:	fe843783          	ld	a5,-24(s0)
    80004642:	67bc                	ld	a5,72(a5)
    80004644:	00e7f463          	bgeu	a5,a4,8000464c <fetchaddr+0x40>
    return -1;
    80004648:	57fd                	li	a5,-1
    8000464a:	a01d                	j	80004670 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    8000464c:	fe843783          	ld	a5,-24(s0)
    80004650:	6bbc                	ld	a5,80(a5)
    80004652:	46a1                	li	a3,8
    80004654:	fd843603          	ld	a2,-40(s0)
    80004658:	fd043583          	ld	a1,-48(s0)
    8000465c:	853e                	mv	a0,a5
    8000465e:	ffffe097          	auipc	ra,0xffffe
    80004662:	3c0080e7          	jalr	960(ra) # 80002a1e <copyin>
    80004666:	87aa                	mv	a5,a0
    80004668:	c399                	beqz	a5,8000466e <fetchaddr+0x62>
    return -1;
    8000466a:	57fd                	li	a5,-1
    8000466c:	a011                	j	80004670 <fetchaddr+0x64>
  return 0;
    8000466e:	4781                	li	a5,0
}
    80004670:	853e                	mv	a0,a5
    80004672:	70a2                	ld	ra,40(sp)
    80004674:	7402                	ld	s0,32(sp)
    80004676:	6145                	addi	sp,sp,48
    80004678:	8082                	ret

000000008000467a <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    8000467a:	7139                	addi	sp,sp,-64
    8000467c:	fc06                	sd	ra,56(sp)
    8000467e:	f822                	sd	s0,48(sp)
    80004680:	0080                	addi	s0,sp,64
    80004682:	fca43c23          	sd	a0,-40(s0)
    80004686:	fcb43823          	sd	a1,-48(s0)
    8000468a:	87b2                	mv	a5,a2
    8000468c:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004690:	ffffe097          	auipc	ra,0xffffe
    80004694:	7f6080e7          	jalr	2038(ra) # 80002e86 <myproc>
    80004698:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    8000469c:	fe843783          	ld	a5,-24(s0)
    800046a0:	6bbc                	ld	a5,80(a5)
    800046a2:	fcc42703          	lw	a4,-52(s0)
    800046a6:	86ba                	mv	a3,a4
    800046a8:	fd843603          	ld	a2,-40(s0)
    800046ac:	fd043583          	ld	a1,-48(s0)
    800046b0:	853e                	mv	a0,a5
    800046b2:	ffffe097          	auipc	ra,0xffffe
    800046b6:	43a080e7          	jalr	1082(ra) # 80002aec <copyinstr>
    800046ba:	87aa                	mv	a5,a0
    800046bc:	0007d463          	bgez	a5,800046c4 <fetchstr+0x4a>
    return -1;
    800046c0:	57fd                	li	a5,-1
    800046c2:	a801                	j	800046d2 <fetchstr+0x58>
  return strlen(buf);
    800046c4:	fd043503          	ld	a0,-48(s0)
    800046c8:	ffffd097          	auipc	ra,0xffffd
    800046cc:	1f2080e7          	jalr	498(ra) # 800018ba <strlen>
    800046d0:	87aa                	mv	a5,a0
}
    800046d2:	853e                	mv	a0,a5
    800046d4:	70e2                	ld	ra,56(sp)
    800046d6:	7442                	ld	s0,48(sp)
    800046d8:	6121                	addi	sp,sp,64
    800046da:	8082                	ret

00000000800046dc <argraw>:

static uint64
argraw(int n)
{
    800046dc:	7179                	addi	sp,sp,-48
    800046de:	f406                	sd	ra,40(sp)
    800046e0:	f022                	sd	s0,32(sp)
    800046e2:	1800                	addi	s0,sp,48
    800046e4:	87aa                	mv	a5,a0
    800046e6:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800046ea:	ffffe097          	auipc	ra,0xffffe
    800046ee:	79c080e7          	jalr	1948(ra) # 80002e86 <myproc>
    800046f2:	fea43423          	sd	a0,-24(s0)
    800046f6:	fdc42783          	lw	a5,-36(s0)
    800046fa:	0007871b          	sext.w	a4,a5
    800046fe:	4795                	li	a5,5
    80004700:	06e7e263          	bltu	a5,a4,80004764 <argraw+0x88>
    80004704:	fdc46783          	lwu	a5,-36(s0)
    80004708:	00279713          	slli	a4,a5,0x2
    8000470c:	00008797          	auipc	a5,0x8
    80004710:	cec78793          	addi	a5,a5,-788 # 8000c3f8 <etext+0x3f8>
    80004714:	97ba                	add	a5,a5,a4
    80004716:	439c                	lw	a5,0(a5)
    80004718:	0007871b          	sext.w	a4,a5
    8000471c:	00008797          	auipc	a5,0x8
    80004720:	cdc78793          	addi	a5,a5,-804 # 8000c3f8 <etext+0x3f8>
    80004724:	97ba                	add	a5,a5,a4
    80004726:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    80004728:	fe843783          	ld	a5,-24(s0)
    8000472c:	6fbc                	ld	a5,88(a5)
    8000472e:	7bbc                	ld	a5,112(a5)
    80004730:	a091                	j	80004774 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004732:	fe843783          	ld	a5,-24(s0)
    80004736:	6fbc                	ld	a5,88(a5)
    80004738:	7fbc                	ld	a5,120(a5)
    8000473a:	a82d                	j	80004774 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    8000473c:	fe843783          	ld	a5,-24(s0)
    80004740:	6fbc                	ld	a5,88(a5)
    80004742:	63dc                	ld	a5,128(a5)
    80004744:	a805                	j	80004774 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004746:	fe843783          	ld	a5,-24(s0)
    8000474a:	6fbc                	ld	a5,88(a5)
    8000474c:	67dc                	ld	a5,136(a5)
    8000474e:	a01d                	j	80004774 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004750:	fe843783          	ld	a5,-24(s0)
    80004754:	6fbc                	ld	a5,88(a5)
    80004756:	6bdc                	ld	a5,144(a5)
    80004758:	a831                	j	80004774 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000475a:	fe843783          	ld	a5,-24(s0)
    8000475e:	6fbc                	ld	a5,88(a5)
    80004760:	6fdc                	ld	a5,152(a5)
    80004762:	a809                	j	80004774 <argraw+0x98>
  }
  panic("argraw");
    80004764:	00008517          	auipc	a0,0x8
    80004768:	c8c50513          	addi	a0,a0,-884 # 8000c3f0 <etext+0x3f0>
    8000476c:	ffffc097          	auipc	ra,0xffffc
    80004770:	520080e7          	jalr	1312(ra) # 80000c8c <panic>
  return -1;
}
    80004774:	853e                	mv	a0,a5
    80004776:	70a2                	ld	ra,40(sp)
    80004778:	7402                	ld	s0,32(sp)
    8000477a:	6145                	addi	sp,sp,48
    8000477c:	8082                	ret

000000008000477e <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    8000477e:	1101                	addi	sp,sp,-32
    80004780:	ec06                	sd	ra,24(sp)
    80004782:	e822                	sd	s0,16(sp)
    80004784:	1000                	addi	s0,sp,32
    80004786:	87aa                	mv	a5,a0
    80004788:	feb43023          	sd	a1,-32(s0)
    8000478c:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004790:	fec42783          	lw	a5,-20(s0)
    80004794:	853e                	mv	a0,a5
    80004796:	00000097          	auipc	ra,0x0
    8000479a:	f46080e7          	jalr	-186(ra) # 800046dc <argraw>
    8000479e:	87aa                	mv	a5,a0
    800047a0:	0007871b          	sext.w	a4,a5
    800047a4:	fe043783          	ld	a5,-32(s0)
    800047a8:	c398                	sw	a4,0(a5)
}
    800047aa:	0001                	nop
    800047ac:	60e2                	ld	ra,24(sp)
    800047ae:	6442                	ld	s0,16(sp)
    800047b0:	6105                	addi	sp,sp,32
    800047b2:	8082                	ret

00000000800047b4 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    800047b4:	1101                	addi	sp,sp,-32
    800047b6:	ec06                	sd	ra,24(sp)
    800047b8:	e822                	sd	s0,16(sp)
    800047ba:	1000                	addi	s0,sp,32
    800047bc:	87aa                	mv	a5,a0
    800047be:	feb43023          	sd	a1,-32(s0)
    800047c2:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800047c6:	fec42783          	lw	a5,-20(s0)
    800047ca:	853e                	mv	a0,a5
    800047cc:	00000097          	auipc	ra,0x0
    800047d0:	f10080e7          	jalr	-240(ra) # 800046dc <argraw>
    800047d4:	872a                	mv	a4,a0
    800047d6:	fe043783          	ld	a5,-32(s0)
    800047da:	e398                	sd	a4,0(a5)
}
    800047dc:	0001                	nop
    800047de:	60e2                	ld	ra,24(sp)
    800047e0:	6442                	ld	s0,16(sp)
    800047e2:	6105                	addi	sp,sp,32
    800047e4:	8082                	ret

00000000800047e6 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800047e6:	7179                	addi	sp,sp,-48
    800047e8:	f406                	sd	ra,40(sp)
    800047ea:	f022                	sd	s0,32(sp)
    800047ec:	1800                	addi	s0,sp,48
    800047ee:	87aa                	mv	a5,a0
    800047f0:	fcb43823          	sd	a1,-48(s0)
    800047f4:	8732                	mv	a4,a2
    800047f6:	fcf42e23          	sw	a5,-36(s0)
    800047fa:	87ba                	mv	a5,a4
    800047fc:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    80004800:	fe840713          	addi	a4,s0,-24
    80004804:	fdc42783          	lw	a5,-36(s0)
    80004808:	85ba                	mv	a1,a4
    8000480a:	853e                	mv	a0,a5
    8000480c:	00000097          	auipc	ra,0x0
    80004810:	fa8080e7          	jalr	-88(ra) # 800047b4 <argaddr>
  return fetchstr(addr, buf, max);
    80004814:	fe843783          	ld	a5,-24(s0)
    80004818:	fd842703          	lw	a4,-40(s0)
    8000481c:	863a                	mv	a2,a4
    8000481e:	fd043583          	ld	a1,-48(s0)
    80004822:	853e                	mv	a0,a5
    80004824:	00000097          	auipc	ra,0x0
    80004828:	e56080e7          	jalr	-426(ra) # 8000467a <fetchstr>
    8000482c:	87aa                	mv	a5,a0
}
    8000482e:	853e                	mv	a0,a5
    80004830:	70a2                	ld	ra,40(sp)
    80004832:	7402                	ld	s0,32(sp)
    80004834:	6145                	addi	sp,sp,48
    80004836:	8082                	ret

0000000080004838 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    80004838:	7179                	addi	sp,sp,-48
    8000483a:	f406                	sd	ra,40(sp)
    8000483c:	f022                	sd	s0,32(sp)
    8000483e:	ec26                	sd	s1,24(sp)
    80004840:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004842:	ffffe097          	auipc	ra,0xffffe
    80004846:	644080e7          	jalr	1604(ra) # 80002e86 <myproc>
    8000484a:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    8000484e:	fd843783          	ld	a5,-40(s0)
    80004852:	6fbc                	ld	a5,88(a5)
    80004854:	77dc                	ld	a5,168(a5)
    80004856:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000485a:	fd442783          	lw	a5,-44(s0)
    8000485e:	2781                	sext.w	a5,a5
    80004860:	04f05263          	blez	a5,800048a4 <syscall+0x6c>
    80004864:	fd442783          	lw	a5,-44(s0)
    80004868:	873e                	mv	a4,a5
    8000486a:	47d5                	li	a5,21
    8000486c:	02e7ec63          	bltu	a5,a4,800048a4 <syscall+0x6c>
    80004870:	00008717          	auipc	a4,0x8
    80004874:	fe070713          	addi	a4,a4,-32 # 8000c850 <syscalls>
    80004878:	fd442783          	lw	a5,-44(s0)
    8000487c:	078e                	slli	a5,a5,0x3
    8000487e:	97ba                	add	a5,a5,a4
    80004880:	639c                	ld	a5,0(a5)
    80004882:	c38d                	beqz	a5,800048a4 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    80004884:	00008717          	auipc	a4,0x8
    80004888:	fcc70713          	addi	a4,a4,-52 # 8000c850 <syscalls>
    8000488c:	fd442783          	lw	a5,-44(s0)
    80004890:	078e                	slli	a5,a5,0x3
    80004892:	97ba                	add	a5,a5,a4
    80004894:	6398                	ld	a4,0(a5)
    80004896:	fd843783          	ld	a5,-40(s0)
    8000489a:	6fa4                	ld	s1,88(a5)
    8000489c:	9702                	jalr	a4
    8000489e:	87aa                	mv	a5,a0
    800048a0:	f8bc                	sd	a5,112(s1)
    800048a2:	a815                	j	800048d6 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800048a4:	fd843783          	ld	a5,-40(s0)
    800048a8:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800048aa:	fd843783          	ld	a5,-40(s0)
    800048ae:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800048b2:	fd442683          	lw	a3,-44(s0)
    800048b6:	863e                	mv	a2,a5
    800048b8:	85ba                	mv	a1,a4
    800048ba:	00008517          	auipc	a0,0x8
    800048be:	b5650513          	addi	a0,a0,-1194 # 8000c410 <etext+0x410>
    800048c2:	ffffc097          	auipc	ra,0xffffc
    800048c6:	174080e7          	jalr	372(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    800048ca:	fd843783          	ld	a5,-40(s0)
    800048ce:	6fbc                	ld	a5,88(a5)
    800048d0:	577d                	li	a4,-1
    800048d2:	fbb8                	sd	a4,112(a5)
  }
}
    800048d4:	0001                	nop
    800048d6:	0001                	nop
    800048d8:	70a2                	ld	ra,40(sp)
    800048da:	7402                	ld	s0,32(sp)
    800048dc:	64e2                	ld	s1,24(sp)
    800048de:	6145                	addi	sp,sp,48
    800048e0:	8082                	ret

00000000800048e2 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800048e2:	1101                	addi	sp,sp,-32
    800048e4:	ec06                	sd	ra,24(sp)
    800048e6:	e822                	sd	s0,16(sp)
    800048e8:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    800048ea:	fec40793          	addi	a5,s0,-20
    800048ee:	85be                	mv	a1,a5
    800048f0:	4501                	li	a0,0
    800048f2:	00000097          	auipc	ra,0x0
    800048f6:	e8c080e7          	jalr	-372(ra) # 8000477e <argint>
  exit(n);
    800048fa:	fec42783          	lw	a5,-20(s0)
    800048fe:	853e                	mv	a0,a5
    80004900:	fffff097          	auipc	ra,0xfffff
    80004904:	c78080e7          	jalr	-904(ra) # 80003578 <exit>
  return 0;  // not reached
    80004908:	4781                	li	a5,0
}
    8000490a:	853e                	mv	a0,a5
    8000490c:	60e2                	ld	ra,24(sp)
    8000490e:	6442                	ld	s0,16(sp)
    80004910:	6105                	addi	sp,sp,32
    80004912:	8082                	ret

0000000080004914 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004914:	1141                	addi	sp,sp,-16
    80004916:	e406                	sd	ra,8(sp)
    80004918:	e022                	sd	s0,0(sp)
    8000491a:	0800                	addi	s0,sp,16
  return myproc()->pid;
    8000491c:	ffffe097          	auipc	ra,0xffffe
    80004920:	56a080e7          	jalr	1386(ra) # 80002e86 <myproc>
    80004924:	87aa                	mv	a5,a0
    80004926:	5b9c                	lw	a5,48(a5)
}
    80004928:	853e                	mv	a0,a5
    8000492a:	60a2                	ld	ra,8(sp)
    8000492c:	6402                	ld	s0,0(sp)
    8000492e:	0141                	addi	sp,sp,16
    80004930:	8082                	ret

0000000080004932 <sys_fork>:

uint64
sys_fork(void)
{
    80004932:	1141                	addi	sp,sp,-16
    80004934:	e406                	sd	ra,8(sp)
    80004936:	e022                	sd	s0,0(sp)
    80004938:	0800                	addi	s0,sp,16
  return fork();
    8000493a:	fffff097          	auipc	ra,0xfffff
    8000493e:	a1c080e7          	jalr	-1508(ra) # 80003356 <fork>
    80004942:	87aa                	mv	a5,a0
}
    80004944:	853e                	mv	a0,a5
    80004946:	60a2                	ld	ra,8(sp)
    80004948:	6402                	ld	s0,0(sp)
    8000494a:	0141                	addi	sp,sp,16
    8000494c:	8082                	ret

000000008000494e <sys_wait>:

uint64
sys_wait(void)
{
    8000494e:	1101                	addi	sp,sp,-32
    80004950:	ec06                	sd	ra,24(sp)
    80004952:	e822                	sd	s0,16(sp)
    80004954:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    80004956:	fe840793          	addi	a5,s0,-24
    8000495a:	85be                	mv	a1,a5
    8000495c:	4501                	li	a0,0
    8000495e:	00000097          	auipc	ra,0x0
    80004962:	e56080e7          	jalr	-426(ra) # 800047b4 <argaddr>
  return wait(p);
    80004966:	fe843783          	ld	a5,-24(s0)
    8000496a:	853e                	mv	a0,a5
    8000496c:	fffff097          	auipc	ra,0xfffff
    80004970:	d48080e7          	jalr	-696(ra) # 800036b4 <wait>
    80004974:	87aa                	mv	a5,a0
}
    80004976:	853e                	mv	a0,a5
    80004978:	60e2                	ld	ra,24(sp)
    8000497a:	6442                	ld	s0,16(sp)
    8000497c:	6105                	addi	sp,sp,32
    8000497e:	8082                	ret

0000000080004980 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004980:	1101                	addi	sp,sp,-32
    80004982:	ec06                	sd	ra,24(sp)
    80004984:	e822                	sd	s0,16(sp)
    80004986:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    80004988:	fe440793          	addi	a5,s0,-28
    8000498c:	85be                	mv	a1,a5
    8000498e:	4501                	li	a0,0
    80004990:	00000097          	auipc	ra,0x0
    80004994:	dee080e7          	jalr	-530(ra) # 8000477e <argint>
  addr = myproc()->sz;
    80004998:	ffffe097          	auipc	ra,0xffffe
    8000499c:	4ee080e7          	jalr	1262(ra) # 80002e86 <myproc>
    800049a0:	87aa                	mv	a5,a0
    800049a2:	67bc                	ld	a5,72(a5)
    800049a4:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    800049a8:	fe442783          	lw	a5,-28(s0)
    800049ac:	853e                	mv	a0,a5
    800049ae:	fffff097          	auipc	ra,0xfffff
    800049b2:	908080e7          	jalr	-1784(ra) # 800032b6 <growproc>
    800049b6:	87aa                	mv	a5,a0
    800049b8:	0007d463          	bgez	a5,800049c0 <sys_sbrk+0x40>
    return -1;
    800049bc:	57fd                	li	a5,-1
    800049be:	a019                	j	800049c4 <sys_sbrk+0x44>
  return addr;
    800049c0:	fe843783          	ld	a5,-24(s0)
}
    800049c4:	853e                	mv	a0,a5
    800049c6:	60e2                	ld	ra,24(sp)
    800049c8:	6442                	ld	s0,16(sp)
    800049ca:	6105                	addi	sp,sp,32
    800049cc:	8082                	ret

00000000800049ce <sys_sleep>:

uint64
sys_sleep(void)
{
    800049ce:	1101                	addi	sp,sp,-32
    800049d0:	ec06                	sd	ra,24(sp)
    800049d2:	e822                	sd	s0,16(sp)
    800049d4:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    800049d6:	fe840793          	addi	a5,s0,-24
    800049da:	85be                	mv	a1,a5
    800049dc:	4501                	li	a0,0
    800049de:	00000097          	auipc	ra,0x0
    800049e2:	da0080e7          	jalr	-608(ra) # 8000477e <argint>
  acquire(&tickslock);
    800049e6:	00046517          	auipc	a0,0x46
    800049ea:	00250513          	addi	a0,a0,2 # 8004a9e8 <tickslock>
    800049ee:	ffffd097          	auipc	ra,0xffffd
    800049f2:	97a080e7          	jalr	-1670(ra) # 80001368 <acquire>
  ticks0 = ticks;
    800049f6:	00008797          	auipc	a5,0x8
    800049fa:	f5278793          	addi	a5,a5,-174 # 8000c948 <ticks>
    800049fe:	439c                	lw	a5,0(a5)
    80004a00:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    80004a04:	a099                	j	80004a4a <sys_sleep+0x7c>
    if(killed(myproc())){
    80004a06:	ffffe097          	auipc	ra,0xffffe
    80004a0a:	480080e7          	jalr	1152(ra) # 80002e86 <myproc>
    80004a0e:	87aa                	mv	a5,a0
    80004a10:	853e                	mv	a0,a5
    80004a12:	fffff097          	auipc	ra,0xfffff
    80004a16:	244080e7          	jalr	580(ra) # 80003c56 <killed>
    80004a1a:	87aa                	mv	a5,a0
    80004a1c:	cb99                	beqz	a5,80004a32 <sys_sleep+0x64>
      release(&tickslock);
    80004a1e:	00046517          	auipc	a0,0x46
    80004a22:	fca50513          	addi	a0,a0,-54 # 8004a9e8 <tickslock>
    80004a26:	ffffd097          	auipc	ra,0xffffd
    80004a2a:	9a6080e7          	jalr	-1626(ra) # 800013cc <release>
      return -1;
    80004a2e:	57fd                	li	a5,-1
    80004a30:	a0b1                	j	80004a7c <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004a32:	00046597          	auipc	a1,0x46
    80004a36:	fb658593          	addi	a1,a1,-74 # 8004a9e8 <tickslock>
    80004a3a:	00008517          	auipc	a0,0x8
    80004a3e:	f0e50513          	addi	a0,a0,-242 # 8000c948 <ticks>
    80004a42:	fffff097          	auipc	ra,0xfffff
    80004a46:	006080e7          	jalr	6(ra) # 80003a48 <sleep>
  while(ticks - ticks0 < n){
    80004a4a:	00008797          	auipc	a5,0x8
    80004a4e:	efe78793          	addi	a5,a5,-258 # 8000c948 <ticks>
    80004a52:	4398                	lw	a4,0(a5)
    80004a54:	fec42783          	lw	a5,-20(s0)
    80004a58:	40f707bb          	subw	a5,a4,a5
    80004a5c:	0007871b          	sext.w	a4,a5
    80004a60:	fe842783          	lw	a5,-24(s0)
    80004a64:	2781                	sext.w	a5,a5
    80004a66:	faf760e3          	bltu	a4,a5,80004a06 <sys_sleep+0x38>
  }
  release(&tickslock);
    80004a6a:	00046517          	auipc	a0,0x46
    80004a6e:	f7e50513          	addi	a0,a0,-130 # 8004a9e8 <tickslock>
    80004a72:	ffffd097          	auipc	ra,0xffffd
    80004a76:	95a080e7          	jalr	-1702(ra) # 800013cc <release>
  return 0;
    80004a7a:	4781                	li	a5,0
}
    80004a7c:	853e                	mv	a0,a5
    80004a7e:	60e2                	ld	ra,24(sp)
    80004a80:	6442                	ld	s0,16(sp)
    80004a82:	6105                	addi	sp,sp,32
    80004a84:	8082                	ret

0000000080004a86 <sys_kill>:

uint64
sys_kill(void)
{
    80004a86:	1101                	addi	sp,sp,-32
    80004a88:	ec06                	sd	ra,24(sp)
    80004a8a:	e822                	sd	s0,16(sp)
    80004a8c:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    80004a8e:	fec40793          	addi	a5,s0,-20
    80004a92:	85be                	mv	a1,a5
    80004a94:	4501                	li	a0,0
    80004a96:	00000097          	auipc	ra,0x0
    80004a9a:	ce8080e7          	jalr	-792(ra) # 8000477e <argint>
  return kill(pid);
    80004a9e:	fec42783          	lw	a5,-20(s0)
    80004aa2:	853e                	mv	a0,a5
    80004aa4:	fffff097          	auipc	ra,0xfffff
    80004aa8:	0d8080e7          	jalr	216(ra) # 80003b7c <kill>
    80004aac:	87aa                	mv	a5,a0
}
    80004aae:	853e                	mv	a0,a5
    80004ab0:	60e2                	ld	ra,24(sp)
    80004ab2:	6442                	ld	s0,16(sp)
    80004ab4:	6105                	addi	sp,sp,32
    80004ab6:	8082                	ret

0000000080004ab8 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004ab8:	1101                	addi	sp,sp,-32
    80004aba:	ec06                	sd	ra,24(sp)
    80004abc:	e822                	sd	s0,16(sp)
    80004abe:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004ac0:	00046517          	auipc	a0,0x46
    80004ac4:	f2850513          	addi	a0,a0,-216 # 8004a9e8 <tickslock>
    80004ac8:	ffffd097          	auipc	ra,0xffffd
    80004acc:	8a0080e7          	jalr	-1888(ra) # 80001368 <acquire>
  xticks = ticks;
    80004ad0:	00008797          	auipc	a5,0x8
    80004ad4:	e7878793          	addi	a5,a5,-392 # 8000c948 <ticks>
    80004ad8:	439c                	lw	a5,0(a5)
    80004ada:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004ade:	00046517          	auipc	a0,0x46
    80004ae2:	f0a50513          	addi	a0,a0,-246 # 8004a9e8 <tickslock>
    80004ae6:	ffffd097          	auipc	ra,0xffffd
    80004aea:	8e6080e7          	jalr	-1818(ra) # 800013cc <release>
  return xticks;
    80004aee:	fec46783          	lwu	a5,-20(s0)
}
    80004af2:	853e                	mv	a0,a5
    80004af4:	60e2                	ld	ra,24(sp)
    80004af6:	6442                	ld	s0,16(sp)
    80004af8:	6105                	addi	sp,sp,32
    80004afa:	8082                	ret

0000000080004afc <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004afc:	1101                	addi	sp,sp,-32
    80004afe:	ec06                	sd	ra,24(sp)
    80004b00:	e822                	sd	s0,16(sp)
    80004b02:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80004b04:	00008597          	auipc	a1,0x8
    80004b08:	92c58593          	addi	a1,a1,-1748 # 8000c430 <etext+0x430>
    80004b0c:	00046517          	auipc	a0,0x46
    80004b10:	ef450513          	addi	a0,a0,-268 # 8004aa00 <bcache>
    80004b14:	ffffd097          	auipc	ra,0xffffd
    80004b18:	824080e7          	jalr	-2012(ra) # 80001338 <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80004b1c:	00046717          	auipc	a4,0x46
    80004b20:	ee470713          	addi	a4,a4,-284 # 8004aa00 <bcache>
    80004b24:	67a1                	lui	a5,0x8
    80004b26:	97ba                	add	a5,a5,a4
    80004b28:	0004e717          	auipc	a4,0x4e
    80004b2c:	14070713          	addi	a4,a4,320 # 80052c68 <bcache+0x8268>
    80004b30:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80004b34:	00046717          	auipc	a4,0x46
    80004b38:	ecc70713          	addi	a4,a4,-308 # 8004aa00 <bcache>
    80004b3c:	67a1                	lui	a5,0x8
    80004b3e:	97ba                	add	a5,a5,a4
    80004b40:	0004e717          	auipc	a4,0x4e
    80004b44:	12870713          	addi	a4,a4,296 # 80052c68 <bcache+0x8268>
    80004b48:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004b4c:	00046797          	auipc	a5,0x46
    80004b50:	ecc78793          	addi	a5,a5,-308 # 8004aa18 <bcache+0x18>
    80004b54:	fef43423          	sd	a5,-24(s0)
    80004b58:	a895                	j	80004bcc <binit+0xd0>
    b->next = bcache.head.next;
    80004b5a:	00046717          	auipc	a4,0x46
    80004b5e:	ea670713          	addi	a4,a4,-346 # 8004aa00 <bcache>
    80004b62:	67a1                	lui	a5,0x8
    80004b64:	97ba                	add	a5,a5,a4
    80004b66:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b6a:	fe843783          	ld	a5,-24(s0)
    80004b6e:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004b70:	fe843783          	ld	a5,-24(s0)
    80004b74:	0004e717          	auipc	a4,0x4e
    80004b78:	0f470713          	addi	a4,a4,244 # 80052c68 <bcache+0x8268>
    80004b7c:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004b7e:	fe843783          	ld	a5,-24(s0)
    80004b82:	07c1                	addi	a5,a5,16
    80004b84:	00008597          	auipc	a1,0x8
    80004b88:	8b458593          	addi	a1,a1,-1868 # 8000c438 <etext+0x438>
    80004b8c:	853e                	mv	a0,a5
    80004b8e:	00002097          	auipc	ra,0x2
    80004b92:	034080e7          	jalr	52(ra) # 80006bc2 <initsleeplock>
    bcache.head.next->prev = b;
    80004b96:	00046717          	auipc	a4,0x46
    80004b9a:	e6a70713          	addi	a4,a4,-406 # 8004aa00 <bcache>
    80004b9e:	67a1                	lui	a5,0x8
    80004ba0:	97ba                	add	a5,a5,a4
    80004ba2:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004ba6:	fe843703          	ld	a4,-24(s0)
    80004baa:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004bac:	00046717          	auipc	a4,0x46
    80004bb0:	e5470713          	addi	a4,a4,-428 # 8004aa00 <bcache>
    80004bb4:	67a1                	lui	a5,0x8
    80004bb6:	97ba                	add	a5,a5,a4
    80004bb8:	fe843703          	ld	a4,-24(s0)
    80004bbc:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004bc0:	fe843783          	ld	a5,-24(s0)
    80004bc4:	45878793          	addi	a5,a5,1112
    80004bc8:	fef43423          	sd	a5,-24(s0)
    80004bcc:	0004e797          	auipc	a5,0x4e
    80004bd0:	09c78793          	addi	a5,a5,156 # 80052c68 <bcache+0x8268>
    80004bd4:	fe843703          	ld	a4,-24(s0)
    80004bd8:	f8f761e3          	bltu	a4,a5,80004b5a <binit+0x5e>
  }
}
    80004bdc:	0001                	nop
    80004bde:	0001                	nop
    80004be0:	60e2                	ld	ra,24(sp)
    80004be2:	6442                	ld	s0,16(sp)
    80004be4:	6105                	addi	sp,sp,32
    80004be6:	8082                	ret

0000000080004be8 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80004be8:	7179                	addi	sp,sp,-48
    80004bea:	f406                	sd	ra,40(sp)
    80004bec:	f022                	sd	s0,32(sp)
    80004bee:	1800                	addi	s0,sp,48
    80004bf0:	87aa                	mv	a5,a0
    80004bf2:	872e                	mv	a4,a1
    80004bf4:	fcf42e23          	sw	a5,-36(s0)
    80004bf8:	87ba                	mv	a5,a4
    80004bfa:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004bfe:	00046517          	auipc	a0,0x46
    80004c02:	e0250513          	addi	a0,a0,-510 # 8004aa00 <bcache>
    80004c06:	ffffc097          	auipc	ra,0xffffc
    80004c0a:	762080e7          	jalr	1890(ra) # 80001368 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004c0e:	00046717          	auipc	a4,0x46
    80004c12:	df270713          	addi	a4,a4,-526 # 8004aa00 <bcache>
    80004c16:	67a1                	lui	a5,0x8
    80004c18:	97ba                	add	a5,a5,a4
    80004c1a:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004c1e:	fef43423          	sd	a5,-24(s0)
    80004c22:	a095                	j	80004c86 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80004c24:	fe843783          	ld	a5,-24(s0)
    80004c28:	4798                	lw	a4,8(a5)
    80004c2a:	fdc42783          	lw	a5,-36(s0)
    80004c2e:	2781                	sext.w	a5,a5
    80004c30:	04e79663          	bne	a5,a4,80004c7c <bget+0x94>
    80004c34:	fe843783          	ld	a5,-24(s0)
    80004c38:	47d8                	lw	a4,12(a5)
    80004c3a:	fd842783          	lw	a5,-40(s0)
    80004c3e:	2781                	sext.w	a5,a5
    80004c40:	02e79e63          	bne	a5,a4,80004c7c <bget+0x94>
      b->refcnt++;
    80004c44:	fe843783          	ld	a5,-24(s0)
    80004c48:	43bc                	lw	a5,64(a5)
    80004c4a:	2785                	addiw	a5,a5,1
    80004c4c:	0007871b          	sext.w	a4,a5
    80004c50:	fe843783          	ld	a5,-24(s0)
    80004c54:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004c56:	00046517          	auipc	a0,0x46
    80004c5a:	daa50513          	addi	a0,a0,-598 # 8004aa00 <bcache>
    80004c5e:	ffffc097          	auipc	ra,0xffffc
    80004c62:	76e080e7          	jalr	1902(ra) # 800013cc <release>
      acquiresleep(&b->lock);
    80004c66:	fe843783          	ld	a5,-24(s0)
    80004c6a:	07c1                	addi	a5,a5,16
    80004c6c:	853e                	mv	a0,a5
    80004c6e:	00002097          	auipc	ra,0x2
    80004c72:	fa0080e7          	jalr	-96(ra) # 80006c0e <acquiresleep>
      return b;
    80004c76:	fe843783          	ld	a5,-24(s0)
    80004c7a:	a07d                	j	80004d28 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004c7c:	fe843783          	ld	a5,-24(s0)
    80004c80:	6bbc                	ld	a5,80(a5)
    80004c82:	fef43423          	sd	a5,-24(s0)
    80004c86:	fe843703          	ld	a4,-24(s0)
    80004c8a:	0004e797          	auipc	a5,0x4e
    80004c8e:	fde78793          	addi	a5,a5,-34 # 80052c68 <bcache+0x8268>
    80004c92:	f8f719e3          	bne	a4,a5,80004c24 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004c96:	00046717          	auipc	a4,0x46
    80004c9a:	d6a70713          	addi	a4,a4,-662 # 8004aa00 <bcache>
    80004c9e:	67a1                	lui	a5,0x8
    80004ca0:	97ba                	add	a5,a5,a4
    80004ca2:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004ca6:	fef43423          	sd	a5,-24(s0)
    80004caa:	a8b9                	j	80004d08 <bget+0x120>
    if(b->refcnt == 0) {
    80004cac:	fe843783          	ld	a5,-24(s0)
    80004cb0:	43bc                	lw	a5,64(a5)
    80004cb2:	e7b1                	bnez	a5,80004cfe <bget+0x116>
      b->dev = dev;
    80004cb4:	fe843783          	ld	a5,-24(s0)
    80004cb8:	fdc42703          	lw	a4,-36(s0)
    80004cbc:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004cbe:	fe843783          	ld	a5,-24(s0)
    80004cc2:	fd842703          	lw	a4,-40(s0)
    80004cc6:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004cc8:	fe843783          	ld	a5,-24(s0)
    80004ccc:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004cd0:	fe843783          	ld	a5,-24(s0)
    80004cd4:	4705                	li	a4,1
    80004cd6:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004cd8:	00046517          	auipc	a0,0x46
    80004cdc:	d2850513          	addi	a0,a0,-728 # 8004aa00 <bcache>
    80004ce0:	ffffc097          	auipc	ra,0xffffc
    80004ce4:	6ec080e7          	jalr	1772(ra) # 800013cc <release>
      acquiresleep(&b->lock);
    80004ce8:	fe843783          	ld	a5,-24(s0)
    80004cec:	07c1                	addi	a5,a5,16
    80004cee:	853e                	mv	a0,a5
    80004cf0:	00002097          	auipc	ra,0x2
    80004cf4:	f1e080e7          	jalr	-226(ra) # 80006c0e <acquiresleep>
      return b;
    80004cf8:	fe843783          	ld	a5,-24(s0)
    80004cfc:	a035                	j	80004d28 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004cfe:	fe843783          	ld	a5,-24(s0)
    80004d02:	67bc                	ld	a5,72(a5)
    80004d04:	fef43423          	sd	a5,-24(s0)
    80004d08:	fe843703          	ld	a4,-24(s0)
    80004d0c:	0004e797          	auipc	a5,0x4e
    80004d10:	f5c78793          	addi	a5,a5,-164 # 80052c68 <bcache+0x8268>
    80004d14:	f8f71ce3          	bne	a4,a5,80004cac <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    80004d18:	00007517          	auipc	a0,0x7
    80004d1c:	72850513          	addi	a0,a0,1832 # 8000c440 <etext+0x440>
    80004d20:	ffffc097          	auipc	ra,0xffffc
    80004d24:	f6c080e7          	jalr	-148(ra) # 80000c8c <panic>
}
    80004d28:	853e                	mv	a0,a5
    80004d2a:	70a2                	ld	ra,40(sp)
    80004d2c:	7402                	ld	s0,32(sp)
    80004d2e:	6145                	addi	sp,sp,48
    80004d30:	8082                	ret

0000000080004d32 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004d32:	7179                	addi	sp,sp,-48
    80004d34:	f406                	sd	ra,40(sp)
    80004d36:	f022                	sd	s0,32(sp)
    80004d38:	1800                	addi	s0,sp,48
    80004d3a:	87aa                	mv	a5,a0
    80004d3c:	872e                	mv	a4,a1
    80004d3e:	fcf42e23          	sw	a5,-36(s0)
    80004d42:	87ba                	mv	a5,a4
    80004d44:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004d48:	fd842703          	lw	a4,-40(s0)
    80004d4c:	fdc42783          	lw	a5,-36(s0)
    80004d50:	85ba                	mv	a1,a4
    80004d52:	853e                	mv	a0,a5
    80004d54:	00000097          	auipc	ra,0x0
    80004d58:	e94080e7          	jalr	-364(ra) # 80004be8 <bget>
    80004d5c:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004d60:	fe843783          	ld	a5,-24(s0)
    80004d64:	439c                	lw	a5,0(a5)
    80004d66:	ef91                	bnez	a5,80004d82 <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    80004d68:	4681                	li	a3,0
    80004d6a:	4601                	li	a2,0
    80004d6c:	fe843583          	ld	a1,-24(s0)
    80004d70:	4501                	li	a0,0
    80004d72:	00005097          	auipc	ra,0x5
    80004d76:	ebc080e7          	jalr	-324(ra) # 80009c2e <virtio_disk_rw>
    b->valid = 1;
    80004d7a:	fe843783          	ld	a5,-24(s0)
    80004d7e:	4705                	li	a4,1
    80004d80:	c398                	sw	a4,0(a5)
  }
  return b;
    80004d82:	fe843783          	ld	a5,-24(s0)
}
    80004d86:	853e                	mv	a0,a5
    80004d88:	70a2                	ld	ra,40(sp)
    80004d8a:	7402                	ld	s0,32(sp)
    80004d8c:	6145                	addi	sp,sp,48
    80004d8e:	8082                	ret

0000000080004d90 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004d90:	1101                	addi	sp,sp,-32
    80004d92:	ec06                	sd	ra,24(sp)
    80004d94:	e822                	sd	s0,16(sp)
    80004d96:	1000                	addi	s0,sp,32
    80004d98:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004d9c:	fe843783          	ld	a5,-24(s0)
    80004da0:	07c1                	addi	a5,a5,16
    80004da2:	853e                	mv	a0,a5
    80004da4:	00002097          	auipc	ra,0x2
    80004da8:	f2a080e7          	jalr	-214(ra) # 80006cce <holdingsleep>
    80004dac:	87aa                	mv	a5,a0
    80004dae:	eb89                	bnez	a5,80004dc0 <bwrite+0x30>
    panic("bwrite");
    80004db0:	00007517          	auipc	a0,0x7
    80004db4:	6a850513          	addi	a0,a0,1704 # 8000c458 <etext+0x458>
    80004db8:	ffffc097          	auipc	ra,0xffffc
    80004dbc:	ed4080e7          	jalr	-300(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    80004dc0:	4681                	li	a3,0
    80004dc2:	4605                	li	a2,1
    80004dc4:	fe843583          	ld	a1,-24(s0)
    80004dc8:	4501                	li	a0,0
    80004dca:	00005097          	auipc	ra,0x5
    80004dce:	e64080e7          	jalr	-412(ra) # 80009c2e <virtio_disk_rw>
}
    80004dd2:	0001                	nop
    80004dd4:	60e2                	ld	ra,24(sp)
    80004dd6:	6442                	ld	s0,16(sp)
    80004dd8:	6105                	addi	sp,sp,32
    80004dda:	8082                	ret

0000000080004ddc <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004ddc:	1101                	addi	sp,sp,-32
    80004dde:	ec06                	sd	ra,24(sp)
    80004de0:	e822                	sd	s0,16(sp)
    80004de2:	1000                	addi	s0,sp,32
    80004de4:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004de8:	fe843783          	ld	a5,-24(s0)
    80004dec:	07c1                	addi	a5,a5,16
    80004dee:	853e                	mv	a0,a5
    80004df0:	00002097          	auipc	ra,0x2
    80004df4:	ede080e7          	jalr	-290(ra) # 80006cce <holdingsleep>
    80004df8:	87aa                	mv	a5,a0
    80004dfa:	eb89                	bnez	a5,80004e0c <brelse+0x30>
    panic("brelse");
    80004dfc:	00007517          	auipc	a0,0x7
    80004e00:	66450513          	addi	a0,a0,1636 # 8000c460 <etext+0x460>
    80004e04:	ffffc097          	auipc	ra,0xffffc
    80004e08:	e88080e7          	jalr	-376(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    80004e0c:	fe843783          	ld	a5,-24(s0)
    80004e10:	07c1                	addi	a5,a5,16
    80004e12:	853e                	mv	a0,a5
    80004e14:	00002097          	auipc	ra,0x2
    80004e18:	e68080e7          	jalr	-408(ra) # 80006c7c <releasesleep>

  acquire(&bcache.lock);
    80004e1c:	00046517          	auipc	a0,0x46
    80004e20:	be450513          	addi	a0,a0,-1052 # 8004aa00 <bcache>
    80004e24:	ffffc097          	auipc	ra,0xffffc
    80004e28:	544080e7          	jalr	1348(ra) # 80001368 <acquire>
  b->refcnt--;
    80004e2c:	fe843783          	ld	a5,-24(s0)
    80004e30:	43bc                	lw	a5,64(a5)
    80004e32:	37fd                	addiw	a5,a5,-1
    80004e34:	0007871b          	sext.w	a4,a5
    80004e38:	fe843783          	ld	a5,-24(s0)
    80004e3c:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004e3e:	fe843783          	ld	a5,-24(s0)
    80004e42:	43bc                	lw	a5,64(a5)
    80004e44:	e7b5                	bnez	a5,80004eb0 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004e46:	fe843783          	ld	a5,-24(s0)
    80004e4a:	6bbc                	ld	a5,80(a5)
    80004e4c:	fe843703          	ld	a4,-24(s0)
    80004e50:	6738                	ld	a4,72(a4)
    80004e52:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004e54:	fe843783          	ld	a5,-24(s0)
    80004e58:	67bc                	ld	a5,72(a5)
    80004e5a:	fe843703          	ld	a4,-24(s0)
    80004e5e:	6b38                	ld	a4,80(a4)
    80004e60:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004e62:	00046717          	auipc	a4,0x46
    80004e66:	b9e70713          	addi	a4,a4,-1122 # 8004aa00 <bcache>
    80004e6a:	67a1                	lui	a5,0x8
    80004e6c:	97ba                	add	a5,a5,a4
    80004e6e:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004e72:	fe843783          	ld	a5,-24(s0)
    80004e76:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004e78:	fe843783          	ld	a5,-24(s0)
    80004e7c:	0004e717          	auipc	a4,0x4e
    80004e80:	dec70713          	addi	a4,a4,-532 # 80052c68 <bcache+0x8268>
    80004e84:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004e86:	00046717          	auipc	a4,0x46
    80004e8a:	b7a70713          	addi	a4,a4,-1158 # 8004aa00 <bcache>
    80004e8e:	67a1                	lui	a5,0x8
    80004e90:	97ba                	add	a5,a5,a4
    80004e92:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004e96:	fe843703          	ld	a4,-24(s0)
    80004e9a:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004e9c:	00046717          	auipc	a4,0x46
    80004ea0:	b6470713          	addi	a4,a4,-1180 # 8004aa00 <bcache>
    80004ea4:	67a1                	lui	a5,0x8
    80004ea6:	97ba                	add	a5,a5,a4
    80004ea8:	fe843703          	ld	a4,-24(s0)
    80004eac:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004eb0:	00046517          	auipc	a0,0x46
    80004eb4:	b5050513          	addi	a0,a0,-1200 # 8004aa00 <bcache>
    80004eb8:	ffffc097          	auipc	ra,0xffffc
    80004ebc:	514080e7          	jalr	1300(ra) # 800013cc <release>
}
    80004ec0:	0001                	nop
    80004ec2:	60e2                	ld	ra,24(sp)
    80004ec4:	6442                	ld	s0,16(sp)
    80004ec6:	6105                	addi	sp,sp,32
    80004ec8:	8082                	ret

0000000080004eca <bpin>:

void
bpin(struct buf *b) {
    80004eca:	1101                	addi	sp,sp,-32
    80004ecc:	ec06                	sd	ra,24(sp)
    80004ece:	e822                	sd	s0,16(sp)
    80004ed0:	1000                	addi	s0,sp,32
    80004ed2:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004ed6:	00046517          	auipc	a0,0x46
    80004eda:	b2a50513          	addi	a0,a0,-1238 # 8004aa00 <bcache>
    80004ede:	ffffc097          	auipc	ra,0xffffc
    80004ee2:	48a080e7          	jalr	1162(ra) # 80001368 <acquire>
  b->refcnt++;
    80004ee6:	fe843783          	ld	a5,-24(s0)
    80004eea:	43bc                	lw	a5,64(a5)
    80004eec:	2785                	addiw	a5,a5,1
    80004eee:	0007871b          	sext.w	a4,a5
    80004ef2:	fe843783          	ld	a5,-24(s0)
    80004ef6:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004ef8:	00046517          	auipc	a0,0x46
    80004efc:	b0850513          	addi	a0,a0,-1272 # 8004aa00 <bcache>
    80004f00:	ffffc097          	auipc	ra,0xffffc
    80004f04:	4cc080e7          	jalr	1228(ra) # 800013cc <release>
}
    80004f08:	0001                	nop
    80004f0a:	60e2                	ld	ra,24(sp)
    80004f0c:	6442                	ld	s0,16(sp)
    80004f0e:	6105                	addi	sp,sp,32
    80004f10:	8082                	ret

0000000080004f12 <bunpin>:

void
bunpin(struct buf *b) {
    80004f12:	1101                	addi	sp,sp,-32
    80004f14:	ec06                	sd	ra,24(sp)
    80004f16:	e822                	sd	s0,16(sp)
    80004f18:	1000                	addi	s0,sp,32
    80004f1a:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004f1e:	00046517          	auipc	a0,0x46
    80004f22:	ae250513          	addi	a0,a0,-1310 # 8004aa00 <bcache>
    80004f26:	ffffc097          	auipc	ra,0xffffc
    80004f2a:	442080e7          	jalr	1090(ra) # 80001368 <acquire>
  b->refcnt--;
    80004f2e:	fe843783          	ld	a5,-24(s0)
    80004f32:	43bc                	lw	a5,64(a5)
    80004f34:	37fd                	addiw	a5,a5,-1
    80004f36:	0007871b          	sext.w	a4,a5
    80004f3a:	fe843783          	ld	a5,-24(s0)
    80004f3e:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004f40:	00046517          	auipc	a0,0x46
    80004f44:	ac050513          	addi	a0,a0,-1344 # 8004aa00 <bcache>
    80004f48:	ffffc097          	auipc	ra,0xffffc
    80004f4c:	484080e7          	jalr	1156(ra) # 800013cc <release>
}
    80004f50:	0001                	nop
    80004f52:	60e2                	ld	ra,24(sp)
    80004f54:	6442                	ld	s0,16(sp)
    80004f56:	6105                	addi	sp,sp,32
    80004f58:	8082                	ret

0000000080004f5a <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004f5a:	7179                	addi	sp,sp,-48
    80004f5c:	f406                	sd	ra,40(sp)
    80004f5e:	f022                	sd	s0,32(sp)
    80004f60:	1800                	addi	s0,sp,48
    80004f62:	87aa                	mv	a5,a0
    80004f64:	fcb43823          	sd	a1,-48(s0)
    80004f68:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004f6c:	fdc42783          	lw	a5,-36(s0)
    80004f70:	4585                	li	a1,1
    80004f72:	853e                	mv	a0,a5
    80004f74:	00000097          	auipc	ra,0x0
    80004f78:	dbe080e7          	jalr	-578(ra) # 80004d32 <bread>
    80004f7c:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004f80:	fe843783          	ld	a5,-24(s0)
    80004f84:	05878793          	addi	a5,a5,88
    80004f88:	02000613          	li	a2,32
    80004f8c:	85be                	mv	a1,a5
    80004f8e:	fd043503          	ld	a0,-48(s0)
    80004f92:	ffffc097          	auipc	ra,0xffffc
    80004f96:	68e080e7          	jalr	1678(ra) # 80001620 <memmove>
  brelse(bp);
    80004f9a:	fe843503          	ld	a0,-24(s0)
    80004f9e:	00000097          	auipc	ra,0x0
    80004fa2:	e3e080e7          	jalr	-450(ra) # 80004ddc <brelse>
}
    80004fa6:	0001                	nop
    80004fa8:	70a2                	ld	ra,40(sp)
    80004faa:	7402                	ld	s0,32(sp)
    80004fac:	6145                	addi	sp,sp,48
    80004fae:	8082                	ret

0000000080004fb0 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004fb0:	1101                	addi	sp,sp,-32
    80004fb2:	ec06                	sd	ra,24(sp)
    80004fb4:	e822                	sd	s0,16(sp)
    80004fb6:	1000                	addi	s0,sp,32
    80004fb8:	87aa                	mv	a5,a0
    80004fba:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004fbe:	fec42783          	lw	a5,-20(s0)
    80004fc2:	0004e597          	auipc	a1,0x4e
    80004fc6:	0fe58593          	addi	a1,a1,254 # 800530c0 <sb>
    80004fca:	853e                	mv	a0,a5
    80004fcc:	00000097          	auipc	ra,0x0
    80004fd0:	f8e080e7          	jalr	-114(ra) # 80004f5a <readsb>
  if(sb.magic != FSMAGIC)
    80004fd4:	0004e797          	auipc	a5,0x4e
    80004fd8:	0ec78793          	addi	a5,a5,236 # 800530c0 <sb>
    80004fdc:	439c                	lw	a5,0(a5)
    80004fde:	873e                	mv	a4,a5
    80004fe0:	102037b7          	lui	a5,0x10203
    80004fe4:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004fe8:	00f70a63          	beq	a4,a5,80004ffc <fsinit+0x4c>
    panic("invalid file system");
    80004fec:	00007517          	auipc	a0,0x7
    80004ff0:	47c50513          	addi	a0,a0,1148 # 8000c468 <etext+0x468>
    80004ff4:	ffffc097          	auipc	ra,0xffffc
    80004ff8:	c98080e7          	jalr	-872(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004ffc:	fec42783          	lw	a5,-20(s0)
    80005000:	0004e597          	auipc	a1,0x4e
    80005004:	0c058593          	addi	a1,a1,192 # 800530c0 <sb>
    80005008:	853e                	mv	a0,a5
    8000500a:	00001097          	auipc	ra,0x1
    8000500e:	49c080e7          	jalr	1180(ra) # 800064a6 <initlog>
}
    80005012:	0001                	nop
    80005014:	60e2                	ld	ra,24(sp)
    80005016:	6442                	ld	s0,16(sp)
    80005018:	6105                	addi	sp,sp,32
    8000501a:	8082                	ret

000000008000501c <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    8000501c:	7179                	addi	sp,sp,-48
    8000501e:	f406                	sd	ra,40(sp)
    80005020:	f022                	sd	s0,32(sp)
    80005022:	1800                	addi	s0,sp,48
    80005024:	87aa                	mv	a5,a0
    80005026:	872e                	mv	a4,a1
    80005028:	fcf42e23          	sw	a5,-36(s0)
    8000502c:	87ba                	mv	a5,a4
    8000502e:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80005032:	fdc42783          	lw	a5,-36(s0)
    80005036:	fd842703          	lw	a4,-40(s0)
    8000503a:	85ba                	mv	a1,a4
    8000503c:	853e                	mv	a0,a5
    8000503e:	00000097          	auipc	ra,0x0
    80005042:	cf4080e7          	jalr	-780(ra) # 80004d32 <bread>
    80005046:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    8000504a:	fe843783          	ld	a5,-24(s0)
    8000504e:	05878793          	addi	a5,a5,88
    80005052:	40000613          	li	a2,1024
    80005056:	4581                	li	a1,0
    80005058:	853e                	mv	a0,a5
    8000505a:	ffffc097          	auipc	ra,0xffffc
    8000505e:	4e2080e7          	jalr	1250(ra) # 8000153c <memset>
  log_write(bp);
    80005062:	fe843503          	ld	a0,-24(s0)
    80005066:	00002097          	auipc	ra,0x2
    8000506a:	a28080e7          	jalr	-1496(ra) # 80006a8e <log_write>
  brelse(bp);
    8000506e:	fe843503          	ld	a0,-24(s0)
    80005072:	00000097          	auipc	ra,0x0
    80005076:	d6a080e7          	jalr	-662(ra) # 80004ddc <brelse>
}
    8000507a:	0001                	nop
    8000507c:	70a2                	ld	ra,40(sp)
    8000507e:	7402                	ld	s0,32(sp)
    80005080:	6145                	addi	sp,sp,48
    80005082:	8082                	ret

0000000080005084 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80005084:	7139                	addi	sp,sp,-64
    80005086:	fc06                	sd	ra,56(sp)
    80005088:	f822                	sd	s0,48(sp)
    8000508a:	0080                	addi	s0,sp,64
    8000508c:	87aa                	mv	a5,a0
    8000508e:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80005092:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80005096:	fe042623          	sw	zero,-20(s0)
    8000509a:	a2b5                	j	80005206 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    8000509c:	fec42783          	lw	a5,-20(s0)
    800050a0:	41f7d71b          	sraiw	a4,a5,0x1f
    800050a4:	0137571b          	srliw	a4,a4,0x13
    800050a8:	9fb9                	addw	a5,a5,a4
    800050aa:	40d7d79b          	sraiw	a5,a5,0xd
    800050ae:	2781                	sext.w	a5,a5
    800050b0:	0007871b          	sext.w	a4,a5
    800050b4:	0004e797          	auipc	a5,0x4e
    800050b8:	00c78793          	addi	a5,a5,12 # 800530c0 <sb>
    800050bc:	4fdc                	lw	a5,28(a5)
    800050be:	9fb9                	addw	a5,a5,a4
    800050c0:	0007871b          	sext.w	a4,a5
    800050c4:	fcc42783          	lw	a5,-52(s0)
    800050c8:	85ba                	mv	a1,a4
    800050ca:	853e                	mv	a0,a5
    800050cc:	00000097          	auipc	ra,0x0
    800050d0:	c66080e7          	jalr	-922(ra) # 80004d32 <bread>
    800050d4:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    800050d8:	fe042423          	sw	zero,-24(s0)
    800050dc:	a0dd                	j	800051c2 <balloc+0x13e>
      m = 1 << (bi % 8);
    800050de:	fe842703          	lw	a4,-24(s0)
    800050e2:	41f7579b          	sraiw	a5,a4,0x1f
    800050e6:	01d7d79b          	srliw	a5,a5,0x1d
    800050ea:	9f3d                	addw	a4,a4,a5
    800050ec:	8b1d                	andi	a4,a4,7
    800050ee:	40f707bb          	subw	a5,a4,a5
    800050f2:	2781                	sext.w	a5,a5
    800050f4:	4705                	li	a4,1
    800050f6:	00f717bb          	sllw	a5,a4,a5
    800050fa:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    800050fe:	fe842783          	lw	a5,-24(s0)
    80005102:	41f7d71b          	sraiw	a4,a5,0x1f
    80005106:	01d7571b          	srliw	a4,a4,0x1d
    8000510a:	9fb9                	addw	a5,a5,a4
    8000510c:	4037d79b          	sraiw	a5,a5,0x3
    80005110:	2781                	sext.w	a5,a5
    80005112:	fe043703          	ld	a4,-32(s0)
    80005116:	97ba                	add	a5,a5,a4
    80005118:	0587c783          	lbu	a5,88(a5)
    8000511c:	0007871b          	sext.w	a4,a5
    80005120:	fdc42783          	lw	a5,-36(s0)
    80005124:	8ff9                	and	a5,a5,a4
    80005126:	2781                	sext.w	a5,a5
    80005128:	ebc1                	bnez	a5,800051b8 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    8000512a:	fe842783          	lw	a5,-24(s0)
    8000512e:	41f7d71b          	sraiw	a4,a5,0x1f
    80005132:	01d7571b          	srliw	a4,a4,0x1d
    80005136:	9fb9                	addw	a5,a5,a4
    80005138:	4037d79b          	sraiw	a5,a5,0x3
    8000513c:	2781                	sext.w	a5,a5
    8000513e:	fe043703          	ld	a4,-32(s0)
    80005142:	973e                	add	a4,a4,a5
    80005144:	05874703          	lbu	a4,88(a4)
    80005148:	0187169b          	slliw	a3,a4,0x18
    8000514c:	4186d69b          	sraiw	a3,a3,0x18
    80005150:	fdc42703          	lw	a4,-36(s0)
    80005154:	0187171b          	slliw	a4,a4,0x18
    80005158:	4187571b          	sraiw	a4,a4,0x18
    8000515c:	8f55                	or	a4,a4,a3
    8000515e:	0187171b          	slliw	a4,a4,0x18
    80005162:	4187571b          	sraiw	a4,a4,0x18
    80005166:	0ff77713          	andi	a4,a4,255
    8000516a:	fe043683          	ld	a3,-32(s0)
    8000516e:	97b6                	add	a5,a5,a3
    80005170:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80005174:	fe043503          	ld	a0,-32(s0)
    80005178:	00002097          	auipc	ra,0x2
    8000517c:	916080e7          	jalr	-1770(ra) # 80006a8e <log_write>
        brelse(bp);
    80005180:	fe043503          	ld	a0,-32(s0)
    80005184:	00000097          	auipc	ra,0x0
    80005188:	c58080e7          	jalr	-936(ra) # 80004ddc <brelse>
        bzero(dev, b + bi);
    8000518c:	fcc42683          	lw	a3,-52(s0)
    80005190:	fec42703          	lw	a4,-20(s0)
    80005194:	fe842783          	lw	a5,-24(s0)
    80005198:	9fb9                	addw	a5,a5,a4
    8000519a:	2781                	sext.w	a5,a5
    8000519c:	85be                	mv	a1,a5
    8000519e:	8536                	mv	a0,a3
    800051a0:	00000097          	auipc	ra,0x0
    800051a4:	e7c080e7          	jalr	-388(ra) # 8000501c <bzero>
        return b + bi;
    800051a8:	fec42703          	lw	a4,-20(s0)
    800051ac:	fe842783          	lw	a5,-24(s0)
    800051b0:	9fb9                	addw	a5,a5,a4
    800051b2:	2781                	sext.w	a5,a5
    800051b4:	2781                	sext.w	a5,a5
    800051b6:	a895                	j	8000522a <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    800051b8:	fe842783          	lw	a5,-24(s0)
    800051bc:	2785                	addiw	a5,a5,1
    800051be:	fef42423          	sw	a5,-24(s0)
    800051c2:	fe842783          	lw	a5,-24(s0)
    800051c6:	0007871b          	sext.w	a4,a5
    800051ca:	6789                	lui	a5,0x2
    800051cc:	02f75163          	bge	a4,a5,800051ee <balloc+0x16a>
    800051d0:	fec42703          	lw	a4,-20(s0)
    800051d4:	fe842783          	lw	a5,-24(s0)
    800051d8:	9fb9                	addw	a5,a5,a4
    800051da:	2781                	sext.w	a5,a5
    800051dc:	0007871b          	sext.w	a4,a5
    800051e0:	0004e797          	auipc	a5,0x4e
    800051e4:	ee078793          	addi	a5,a5,-288 # 800530c0 <sb>
    800051e8:	43dc                	lw	a5,4(a5)
    800051ea:	eef76ae3          	bltu	a4,a5,800050de <balloc+0x5a>
      }
    }
    brelse(bp);
    800051ee:	fe043503          	ld	a0,-32(s0)
    800051f2:	00000097          	auipc	ra,0x0
    800051f6:	bea080e7          	jalr	-1046(ra) # 80004ddc <brelse>
  for(b = 0; b < sb.size; b += BPB){
    800051fa:	fec42703          	lw	a4,-20(s0)
    800051fe:	6789                	lui	a5,0x2
    80005200:	9fb9                	addw	a5,a5,a4
    80005202:	fef42623          	sw	a5,-20(s0)
    80005206:	0004e797          	auipc	a5,0x4e
    8000520a:	eba78793          	addi	a5,a5,-326 # 800530c0 <sb>
    8000520e:	43d8                	lw	a4,4(a5)
    80005210:	fec42783          	lw	a5,-20(s0)
    80005214:	e8e7e4e3          	bltu	a5,a4,8000509c <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80005218:	00007517          	auipc	a0,0x7
    8000521c:	26850513          	addi	a0,a0,616 # 8000c480 <etext+0x480>
    80005220:	ffffc097          	auipc	ra,0xffffc
    80005224:	816080e7          	jalr	-2026(ra) # 80000a36 <printf>
  return 0;
    80005228:	4781                	li	a5,0
}
    8000522a:	853e                	mv	a0,a5
    8000522c:	70e2                	ld	ra,56(sp)
    8000522e:	7442                	ld	s0,48(sp)
    80005230:	6121                	addi	sp,sp,64
    80005232:	8082                	ret

0000000080005234 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80005234:	7179                	addi	sp,sp,-48
    80005236:	f406                	sd	ra,40(sp)
    80005238:	f022                	sd	s0,32(sp)
    8000523a:	1800                	addi	s0,sp,48
    8000523c:	87aa                	mv	a5,a0
    8000523e:	872e                	mv	a4,a1
    80005240:	fcf42e23          	sw	a5,-36(s0)
    80005244:	87ba                	mv	a5,a4
    80005246:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    8000524a:	fdc42683          	lw	a3,-36(s0)
    8000524e:	fd842783          	lw	a5,-40(s0)
    80005252:	00d7d79b          	srliw	a5,a5,0xd
    80005256:	0007871b          	sext.w	a4,a5
    8000525a:	0004e797          	auipc	a5,0x4e
    8000525e:	e6678793          	addi	a5,a5,-410 # 800530c0 <sb>
    80005262:	4fdc                	lw	a5,28(a5)
    80005264:	9fb9                	addw	a5,a5,a4
    80005266:	2781                	sext.w	a5,a5
    80005268:	85be                	mv	a1,a5
    8000526a:	8536                	mv	a0,a3
    8000526c:	00000097          	auipc	ra,0x0
    80005270:	ac6080e7          	jalr	-1338(ra) # 80004d32 <bread>
    80005274:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80005278:	fd842703          	lw	a4,-40(s0)
    8000527c:	6789                	lui	a5,0x2
    8000527e:	17fd                	addi	a5,a5,-1
    80005280:	8ff9                	and	a5,a5,a4
    80005282:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80005286:	fe442703          	lw	a4,-28(s0)
    8000528a:	41f7579b          	sraiw	a5,a4,0x1f
    8000528e:	01d7d79b          	srliw	a5,a5,0x1d
    80005292:	9f3d                	addw	a4,a4,a5
    80005294:	8b1d                	andi	a4,a4,7
    80005296:	40f707bb          	subw	a5,a4,a5
    8000529a:	2781                	sext.w	a5,a5
    8000529c:	4705                	li	a4,1
    8000529e:	00f717bb          	sllw	a5,a4,a5
    800052a2:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    800052a6:	fe442783          	lw	a5,-28(s0)
    800052aa:	41f7d71b          	sraiw	a4,a5,0x1f
    800052ae:	01d7571b          	srliw	a4,a4,0x1d
    800052b2:	9fb9                	addw	a5,a5,a4
    800052b4:	4037d79b          	sraiw	a5,a5,0x3
    800052b8:	2781                	sext.w	a5,a5
    800052ba:	fe843703          	ld	a4,-24(s0)
    800052be:	97ba                	add	a5,a5,a4
    800052c0:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    800052c4:	0007871b          	sext.w	a4,a5
    800052c8:	fe042783          	lw	a5,-32(s0)
    800052cc:	8ff9                	and	a5,a5,a4
    800052ce:	2781                	sext.w	a5,a5
    800052d0:	eb89                	bnez	a5,800052e2 <bfree+0xae>
    panic("freeing free block");
    800052d2:	00007517          	auipc	a0,0x7
    800052d6:	1c650513          	addi	a0,a0,454 # 8000c498 <etext+0x498>
    800052da:	ffffc097          	auipc	ra,0xffffc
    800052de:	9b2080e7          	jalr	-1614(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    800052e2:	fe442783          	lw	a5,-28(s0)
    800052e6:	41f7d71b          	sraiw	a4,a5,0x1f
    800052ea:	01d7571b          	srliw	a4,a4,0x1d
    800052ee:	9fb9                	addw	a5,a5,a4
    800052f0:	4037d79b          	sraiw	a5,a5,0x3
    800052f4:	2781                	sext.w	a5,a5
    800052f6:	fe843703          	ld	a4,-24(s0)
    800052fa:	973e                	add	a4,a4,a5
    800052fc:	05874703          	lbu	a4,88(a4)
    80005300:	0187169b          	slliw	a3,a4,0x18
    80005304:	4186d69b          	sraiw	a3,a3,0x18
    80005308:	fe042703          	lw	a4,-32(s0)
    8000530c:	0187171b          	slliw	a4,a4,0x18
    80005310:	4187571b          	sraiw	a4,a4,0x18
    80005314:	fff74713          	not	a4,a4
    80005318:	0187171b          	slliw	a4,a4,0x18
    8000531c:	4187571b          	sraiw	a4,a4,0x18
    80005320:	8f75                	and	a4,a4,a3
    80005322:	0187171b          	slliw	a4,a4,0x18
    80005326:	4187571b          	sraiw	a4,a4,0x18
    8000532a:	0ff77713          	andi	a4,a4,255
    8000532e:	fe843683          	ld	a3,-24(s0)
    80005332:	97b6                	add	a5,a5,a3
    80005334:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80005338:	fe843503          	ld	a0,-24(s0)
    8000533c:	00001097          	auipc	ra,0x1
    80005340:	752080e7          	jalr	1874(ra) # 80006a8e <log_write>
  brelse(bp);
    80005344:	fe843503          	ld	a0,-24(s0)
    80005348:	00000097          	auipc	ra,0x0
    8000534c:	a94080e7          	jalr	-1388(ra) # 80004ddc <brelse>
}
    80005350:	0001                	nop
    80005352:	70a2                	ld	ra,40(sp)
    80005354:	7402                	ld	s0,32(sp)
    80005356:	6145                	addi	sp,sp,48
    80005358:	8082                	ret

000000008000535a <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    8000535a:	1101                	addi	sp,sp,-32
    8000535c:	ec06                	sd	ra,24(sp)
    8000535e:	e822                	sd	s0,16(sp)
    80005360:	1000                	addi	s0,sp,32
  int i = 0;
    80005362:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80005366:	00007597          	auipc	a1,0x7
    8000536a:	14a58593          	addi	a1,a1,330 # 8000c4b0 <etext+0x4b0>
    8000536e:	0004e517          	auipc	a0,0x4e
    80005372:	d7250513          	addi	a0,a0,-654 # 800530e0 <itable>
    80005376:	ffffc097          	auipc	ra,0xffffc
    8000537a:	fc2080e7          	jalr	-62(ra) # 80001338 <initlock>
  for(i = 0; i < NINODE; i++) {
    8000537e:	fe042623          	sw	zero,-20(s0)
    80005382:	a82d                	j	800053bc <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80005384:	fec42703          	lw	a4,-20(s0)
    80005388:	87ba                	mv	a5,a4
    8000538a:	0792                	slli	a5,a5,0x4
    8000538c:	97ba                	add	a5,a5,a4
    8000538e:	078e                	slli	a5,a5,0x3
    80005390:	02078713          	addi	a4,a5,32
    80005394:	0004e797          	auipc	a5,0x4e
    80005398:	d4c78793          	addi	a5,a5,-692 # 800530e0 <itable>
    8000539c:	97ba                	add	a5,a5,a4
    8000539e:	07a1                	addi	a5,a5,8
    800053a0:	00007597          	auipc	a1,0x7
    800053a4:	11858593          	addi	a1,a1,280 # 8000c4b8 <etext+0x4b8>
    800053a8:	853e                	mv	a0,a5
    800053aa:	00002097          	auipc	ra,0x2
    800053ae:	818080e7          	jalr	-2024(ra) # 80006bc2 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    800053b2:	fec42783          	lw	a5,-20(s0)
    800053b6:	2785                	addiw	a5,a5,1
    800053b8:	fef42623          	sw	a5,-20(s0)
    800053bc:	fec42783          	lw	a5,-20(s0)
    800053c0:	0007871b          	sext.w	a4,a5
    800053c4:	03100793          	li	a5,49
    800053c8:	fae7dee3          	bge	a5,a4,80005384 <iinit+0x2a>
  }
}
    800053cc:	0001                	nop
    800053ce:	0001                	nop
    800053d0:	60e2                	ld	ra,24(sp)
    800053d2:	6442                	ld	s0,16(sp)
    800053d4:	6105                	addi	sp,sp,32
    800053d6:	8082                	ret

00000000800053d8 <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    800053d8:	7139                	addi	sp,sp,-64
    800053da:	fc06                	sd	ra,56(sp)
    800053dc:	f822                	sd	s0,48(sp)
    800053de:	0080                	addi	s0,sp,64
    800053e0:	87aa                	mv	a5,a0
    800053e2:	872e                	mv	a4,a1
    800053e4:	fcf42623          	sw	a5,-52(s0)
    800053e8:	87ba                	mv	a5,a4
    800053ea:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    800053ee:	4785                	li	a5,1
    800053f0:	fef42623          	sw	a5,-20(s0)
    800053f4:	a855                	j	800054a8 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    800053f6:	fec42783          	lw	a5,-20(s0)
    800053fa:	8391                	srli	a5,a5,0x4
    800053fc:	0007871b          	sext.w	a4,a5
    80005400:	0004e797          	auipc	a5,0x4e
    80005404:	cc078793          	addi	a5,a5,-832 # 800530c0 <sb>
    80005408:	4f9c                	lw	a5,24(a5)
    8000540a:	9fb9                	addw	a5,a5,a4
    8000540c:	0007871b          	sext.w	a4,a5
    80005410:	fcc42783          	lw	a5,-52(s0)
    80005414:	85ba                	mv	a1,a4
    80005416:	853e                	mv	a0,a5
    80005418:	00000097          	auipc	ra,0x0
    8000541c:	91a080e7          	jalr	-1766(ra) # 80004d32 <bread>
    80005420:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80005424:	fe043783          	ld	a5,-32(s0)
    80005428:	05878713          	addi	a4,a5,88
    8000542c:	fec42783          	lw	a5,-20(s0)
    80005430:	8bbd                	andi	a5,a5,15
    80005432:	079a                	slli	a5,a5,0x6
    80005434:	97ba                	add	a5,a5,a4
    80005436:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    8000543a:	fd843783          	ld	a5,-40(s0)
    8000543e:	00079783          	lh	a5,0(a5)
    80005442:	eba1                	bnez	a5,80005492 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80005444:	04000613          	li	a2,64
    80005448:	4581                	li	a1,0
    8000544a:	fd843503          	ld	a0,-40(s0)
    8000544e:	ffffc097          	auipc	ra,0xffffc
    80005452:	0ee080e7          	jalr	238(ra) # 8000153c <memset>
      dip->type = type;
    80005456:	fd843783          	ld	a5,-40(s0)
    8000545a:	fca45703          	lhu	a4,-54(s0)
    8000545e:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005462:	fe043503          	ld	a0,-32(s0)
    80005466:	00001097          	auipc	ra,0x1
    8000546a:	628080e7          	jalr	1576(ra) # 80006a8e <log_write>
      brelse(bp);
    8000546e:	fe043503          	ld	a0,-32(s0)
    80005472:	00000097          	auipc	ra,0x0
    80005476:	96a080e7          	jalr	-1686(ra) # 80004ddc <brelse>
      return iget(dev, inum);
    8000547a:	fec42703          	lw	a4,-20(s0)
    8000547e:	fcc42783          	lw	a5,-52(s0)
    80005482:	85ba                	mv	a1,a4
    80005484:	853e                	mv	a0,a5
    80005486:	00000097          	auipc	ra,0x0
    8000548a:	138080e7          	jalr	312(ra) # 800055be <iget>
    8000548e:	87aa                	mv	a5,a0
    80005490:	a835                	j	800054cc <ialloc+0xf4>
    }
    brelse(bp);
    80005492:	fe043503          	ld	a0,-32(s0)
    80005496:	00000097          	auipc	ra,0x0
    8000549a:	946080e7          	jalr	-1722(ra) # 80004ddc <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    8000549e:	fec42783          	lw	a5,-20(s0)
    800054a2:	2785                	addiw	a5,a5,1
    800054a4:	fef42623          	sw	a5,-20(s0)
    800054a8:	0004e797          	auipc	a5,0x4e
    800054ac:	c1878793          	addi	a5,a5,-1000 # 800530c0 <sb>
    800054b0:	47d8                	lw	a4,12(a5)
    800054b2:	fec42783          	lw	a5,-20(s0)
    800054b6:	f4e7e0e3          	bltu	a5,a4,800053f6 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    800054ba:	00007517          	auipc	a0,0x7
    800054be:	00650513          	addi	a0,a0,6 # 8000c4c0 <etext+0x4c0>
    800054c2:	ffffb097          	auipc	ra,0xffffb
    800054c6:	574080e7          	jalr	1396(ra) # 80000a36 <printf>
  return 0;
    800054ca:	4781                	li	a5,0
}
    800054cc:	853e                	mv	a0,a5
    800054ce:	70e2                	ld	ra,56(sp)
    800054d0:	7442                	ld	s0,48(sp)
    800054d2:	6121                	addi	sp,sp,64
    800054d4:	8082                	ret

00000000800054d6 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    800054d6:	7179                	addi	sp,sp,-48
    800054d8:	f406                	sd	ra,40(sp)
    800054da:	f022                	sd	s0,32(sp)
    800054dc:	1800                	addi	s0,sp,48
    800054de:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800054e2:	fd843783          	ld	a5,-40(s0)
    800054e6:	4394                	lw	a3,0(a5)
    800054e8:	fd843783          	ld	a5,-40(s0)
    800054ec:	43dc                	lw	a5,4(a5)
    800054ee:	0047d79b          	srliw	a5,a5,0x4
    800054f2:	0007871b          	sext.w	a4,a5
    800054f6:	0004e797          	auipc	a5,0x4e
    800054fa:	bca78793          	addi	a5,a5,-1078 # 800530c0 <sb>
    800054fe:	4f9c                	lw	a5,24(a5)
    80005500:	9fb9                	addw	a5,a5,a4
    80005502:	2781                	sext.w	a5,a5
    80005504:	85be                	mv	a1,a5
    80005506:	8536                	mv	a0,a3
    80005508:	00000097          	auipc	ra,0x0
    8000550c:	82a080e7          	jalr	-2006(ra) # 80004d32 <bread>
    80005510:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005514:	fe843783          	ld	a5,-24(s0)
    80005518:	05878713          	addi	a4,a5,88
    8000551c:	fd843783          	ld	a5,-40(s0)
    80005520:	43dc                	lw	a5,4(a5)
    80005522:	1782                	slli	a5,a5,0x20
    80005524:	9381                	srli	a5,a5,0x20
    80005526:	8bbd                	andi	a5,a5,15
    80005528:	079a                	slli	a5,a5,0x6
    8000552a:	97ba                	add	a5,a5,a4
    8000552c:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80005530:	fd843783          	ld	a5,-40(s0)
    80005534:	04479703          	lh	a4,68(a5)
    80005538:	fe043783          	ld	a5,-32(s0)
    8000553c:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80005540:	fd843783          	ld	a5,-40(s0)
    80005544:	04679703          	lh	a4,70(a5)
    80005548:	fe043783          	ld	a5,-32(s0)
    8000554c:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80005550:	fd843783          	ld	a5,-40(s0)
    80005554:	04879703          	lh	a4,72(a5)
    80005558:	fe043783          	ld	a5,-32(s0)
    8000555c:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80005560:	fd843783          	ld	a5,-40(s0)
    80005564:	04a79703          	lh	a4,74(a5)
    80005568:	fe043783          	ld	a5,-32(s0)
    8000556c:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80005570:	fd843783          	ld	a5,-40(s0)
    80005574:	47f8                	lw	a4,76(a5)
    80005576:	fe043783          	ld	a5,-32(s0)
    8000557a:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    8000557c:	fe043783          	ld	a5,-32(s0)
    80005580:	00c78713          	addi	a4,a5,12
    80005584:	fd843783          	ld	a5,-40(s0)
    80005588:	05078793          	addi	a5,a5,80
    8000558c:	03400613          	li	a2,52
    80005590:	85be                	mv	a1,a5
    80005592:	853a                	mv	a0,a4
    80005594:	ffffc097          	auipc	ra,0xffffc
    80005598:	08c080e7          	jalr	140(ra) # 80001620 <memmove>
  log_write(bp);
    8000559c:	fe843503          	ld	a0,-24(s0)
    800055a0:	00001097          	auipc	ra,0x1
    800055a4:	4ee080e7          	jalr	1262(ra) # 80006a8e <log_write>
  brelse(bp);
    800055a8:	fe843503          	ld	a0,-24(s0)
    800055ac:	00000097          	auipc	ra,0x0
    800055b0:	830080e7          	jalr	-2000(ra) # 80004ddc <brelse>
}
    800055b4:	0001                	nop
    800055b6:	70a2                	ld	ra,40(sp)
    800055b8:	7402                	ld	s0,32(sp)
    800055ba:	6145                	addi	sp,sp,48
    800055bc:	8082                	ret

00000000800055be <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    800055be:	7179                	addi	sp,sp,-48
    800055c0:	f406                	sd	ra,40(sp)
    800055c2:	f022                	sd	s0,32(sp)
    800055c4:	1800                	addi	s0,sp,48
    800055c6:	87aa                	mv	a5,a0
    800055c8:	872e                	mv	a4,a1
    800055ca:	fcf42e23          	sw	a5,-36(s0)
    800055ce:	87ba                	mv	a5,a4
    800055d0:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    800055d4:	0004e517          	auipc	a0,0x4e
    800055d8:	b0c50513          	addi	a0,a0,-1268 # 800530e0 <itable>
    800055dc:	ffffc097          	auipc	ra,0xffffc
    800055e0:	d8c080e7          	jalr	-628(ra) # 80001368 <acquire>

  // Is the inode already in the table?
  empty = 0;
    800055e4:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800055e8:	0004e797          	auipc	a5,0x4e
    800055ec:	b1078793          	addi	a5,a5,-1264 # 800530f8 <itable+0x18>
    800055f0:	fef43423          	sd	a5,-24(s0)
    800055f4:	a89d                	j	8000566a <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800055f6:	fe843783          	ld	a5,-24(s0)
    800055fa:	479c                	lw	a5,8(a5)
    800055fc:	04f05663          	blez	a5,80005648 <iget+0x8a>
    80005600:	fe843783          	ld	a5,-24(s0)
    80005604:	4398                	lw	a4,0(a5)
    80005606:	fdc42783          	lw	a5,-36(s0)
    8000560a:	2781                	sext.w	a5,a5
    8000560c:	02e79e63          	bne	a5,a4,80005648 <iget+0x8a>
    80005610:	fe843783          	ld	a5,-24(s0)
    80005614:	43d8                	lw	a4,4(a5)
    80005616:	fd842783          	lw	a5,-40(s0)
    8000561a:	2781                	sext.w	a5,a5
    8000561c:	02e79663          	bne	a5,a4,80005648 <iget+0x8a>
      ip->ref++;
    80005620:	fe843783          	ld	a5,-24(s0)
    80005624:	479c                	lw	a5,8(a5)
    80005626:	2785                	addiw	a5,a5,1
    80005628:	0007871b          	sext.w	a4,a5
    8000562c:	fe843783          	ld	a5,-24(s0)
    80005630:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80005632:	0004e517          	auipc	a0,0x4e
    80005636:	aae50513          	addi	a0,a0,-1362 # 800530e0 <itable>
    8000563a:	ffffc097          	auipc	ra,0xffffc
    8000563e:	d92080e7          	jalr	-622(ra) # 800013cc <release>
      return ip;
    80005642:	fe843783          	ld	a5,-24(s0)
    80005646:	a069                	j	800056d0 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80005648:	fe043783          	ld	a5,-32(s0)
    8000564c:	eb89                	bnez	a5,8000565e <iget+0xa0>
    8000564e:	fe843783          	ld	a5,-24(s0)
    80005652:	479c                	lw	a5,8(a5)
    80005654:	e789                	bnez	a5,8000565e <iget+0xa0>
      empty = ip;
    80005656:	fe843783          	ld	a5,-24(s0)
    8000565a:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    8000565e:	fe843783          	ld	a5,-24(s0)
    80005662:	08878793          	addi	a5,a5,136
    80005666:	fef43423          	sd	a5,-24(s0)
    8000566a:	fe843703          	ld	a4,-24(s0)
    8000566e:	0004f797          	auipc	a5,0x4f
    80005672:	51a78793          	addi	a5,a5,1306 # 80054b88 <log>
    80005676:	f8f760e3          	bltu	a4,a5,800055f6 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    8000567a:	fe043783          	ld	a5,-32(s0)
    8000567e:	eb89                	bnez	a5,80005690 <iget+0xd2>
    panic("iget: no inodes");
    80005680:	00007517          	auipc	a0,0x7
    80005684:	e5850513          	addi	a0,a0,-424 # 8000c4d8 <etext+0x4d8>
    80005688:	ffffb097          	auipc	ra,0xffffb
    8000568c:	604080e7          	jalr	1540(ra) # 80000c8c <panic>

  ip = empty;
    80005690:	fe043783          	ld	a5,-32(s0)
    80005694:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005698:	fe843783          	ld	a5,-24(s0)
    8000569c:	fdc42703          	lw	a4,-36(s0)
    800056a0:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    800056a2:	fe843783          	ld	a5,-24(s0)
    800056a6:	fd842703          	lw	a4,-40(s0)
    800056aa:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    800056ac:	fe843783          	ld	a5,-24(s0)
    800056b0:	4705                	li	a4,1
    800056b2:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800056b4:	fe843783          	ld	a5,-24(s0)
    800056b8:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    800056bc:	0004e517          	auipc	a0,0x4e
    800056c0:	a2450513          	addi	a0,a0,-1500 # 800530e0 <itable>
    800056c4:	ffffc097          	auipc	ra,0xffffc
    800056c8:	d08080e7          	jalr	-760(ra) # 800013cc <release>

  return ip;
    800056cc:	fe843783          	ld	a5,-24(s0)
}
    800056d0:	853e                	mv	a0,a5
    800056d2:	70a2                	ld	ra,40(sp)
    800056d4:	7402                	ld	s0,32(sp)
    800056d6:	6145                	addi	sp,sp,48
    800056d8:	8082                	ret

00000000800056da <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800056da:	1101                	addi	sp,sp,-32
    800056dc:	ec06                	sd	ra,24(sp)
    800056de:	e822                	sd	s0,16(sp)
    800056e0:	1000                	addi	s0,sp,32
    800056e2:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800056e6:	0004e517          	auipc	a0,0x4e
    800056ea:	9fa50513          	addi	a0,a0,-1542 # 800530e0 <itable>
    800056ee:	ffffc097          	auipc	ra,0xffffc
    800056f2:	c7a080e7          	jalr	-902(ra) # 80001368 <acquire>
  ip->ref++;
    800056f6:	fe843783          	ld	a5,-24(s0)
    800056fa:	479c                	lw	a5,8(a5)
    800056fc:	2785                	addiw	a5,a5,1
    800056fe:	0007871b          	sext.w	a4,a5
    80005702:	fe843783          	ld	a5,-24(s0)
    80005706:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005708:	0004e517          	auipc	a0,0x4e
    8000570c:	9d850513          	addi	a0,a0,-1576 # 800530e0 <itable>
    80005710:	ffffc097          	auipc	ra,0xffffc
    80005714:	cbc080e7          	jalr	-836(ra) # 800013cc <release>
  return ip;
    80005718:	fe843783          	ld	a5,-24(s0)
}
    8000571c:	853e                	mv	a0,a5
    8000571e:	60e2                	ld	ra,24(sp)
    80005720:	6442                	ld	s0,16(sp)
    80005722:	6105                	addi	sp,sp,32
    80005724:	8082                	ret

0000000080005726 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005726:	7179                	addi	sp,sp,-48
    80005728:	f406                	sd	ra,40(sp)
    8000572a:	f022                	sd	s0,32(sp)
    8000572c:	1800                	addi	s0,sp,48
    8000572e:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    80005732:	fd843783          	ld	a5,-40(s0)
    80005736:	c791                	beqz	a5,80005742 <ilock+0x1c>
    80005738:	fd843783          	ld	a5,-40(s0)
    8000573c:	479c                	lw	a5,8(a5)
    8000573e:	00f04a63          	bgtz	a5,80005752 <ilock+0x2c>
    panic("ilock");
    80005742:	00007517          	auipc	a0,0x7
    80005746:	da650513          	addi	a0,a0,-602 # 8000c4e8 <etext+0x4e8>
    8000574a:	ffffb097          	auipc	ra,0xffffb
    8000574e:	542080e7          	jalr	1346(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    80005752:	fd843783          	ld	a5,-40(s0)
    80005756:	07c1                	addi	a5,a5,16
    80005758:	853e                	mv	a0,a5
    8000575a:	00001097          	auipc	ra,0x1
    8000575e:	4b4080e7          	jalr	1204(ra) # 80006c0e <acquiresleep>

  if(ip->valid == 0){
    80005762:	fd843783          	ld	a5,-40(s0)
    80005766:	43bc                	lw	a5,64(a5)
    80005768:	e7e5                	bnez	a5,80005850 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000576a:	fd843783          	ld	a5,-40(s0)
    8000576e:	4394                	lw	a3,0(a5)
    80005770:	fd843783          	ld	a5,-40(s0)
    80005774:	43dc                	lw	a5,4(a5)
    80005776:	0047d79b          	srliw	a5,a5,0x4
    8000577a:	0007871b          	sext.w	a4,a5
    8000577e:	0004e797          	auipc	a5,0x4e
    80005782:	94278793          	addi	a5,a5,-1726 # 800530c0 <sb>
    80005786:	4f9c                	lw	a5,24(a5)
    80005788:	9fb9                	addw	a5,a5,a4
    8000578a:	2781                	sext.w	a5,a5
    8000578c:	85be                	mv	a1,a5
    8000578e:	8536                	mv	a0,a3
    80005790:	fffff097          	auipc	ra,0xfffff
    80005794:	5a2080e7          	jalr	1442(ra) # 80004d32 <bread>
    80005798:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000579c:	fe843783          	ld	a5,-24(s0)
    800057a0:	05878713          	addi	a4,a5,88
    800057a4:	fd843783          	ld	a5,-40(s0)
    800057a8:	43dc                	lw	a5,4(a5)
    800057aa:	1782                	slli	a5,a5,0x20
    800057ac:	9381                	srli	a5,a5,0x20
    800057ae:	8bbd                	andi	a5,a5,15
    800057b0:	079a                	slli	a5,a5,0x6
    800057b2:	97ba                	add	a5,a5,a4
    800057b4:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800057b8:	fe043783          	ld	a5,-32(s0)
    800057bc:	00079703          	lh	a4,0(a5)
    800057c0:	fd843783          	ld	a5,-40(s0)
    800057c4:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800057c8:	fe043783          	ld	a5,-32(s0)
    800057cc:	00279703          	lh	a4,2(a5)
    800057d0:	fd843783          	ld	a5,-40(s0)
    800057d4:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800057d8:	fe043783          	ld	a5,-32(s0)
    800057dc:	00479703          	lh	a4,4(a5)
    800057e0:	fd843783          	ld	a5,-40(s0)
    800057e4:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800057e8:	fe043783          	ld	a5,-32(s0)
    800057ec:	00679703          	lh	a4,6(a5)
    800057f0:	fd843783          	ld	a5,-40(s0)
    800057f4:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800057f8:	fe043783          	ld	a5,-32(s0)
    800057fc:	4798                	lw	a4,8(a5)
    800057fe:	fd843783          	ld	a5,-40(s0)
    80005802:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    80005804:	fd843783          	ld	a5,-40(s0)
    80005808:	05078713          	addi	a4,a5,80
    8000580c:	fe043783          	ld	a5,-32(s0)
    80005810:	07b1                	addi	a5,a5,12
    80005812:	03400613          	li	a2,52
    80005816:	85be                	mv	a1,a5
    80005818:	853a                	mv	a0,a4
    8000581a:	ffffc097          	auipc	ra,0xffffc
    8000581e:	e06080e7          	jalr	-506(ra) # 80001620 <memmove>
    brelse(bp);
    80005822:	fe843503          	ld	a0,-24(s0)
    80005826:	fffff097          	auipc	ra,0xfffff
    8000582a:	5b6080e7          	jalr	1462(ra) # 80004ddc <brelse>
    ip->valid = 1;
    8000582e:	fd843783          	ld	a5,-40(s0)
    80005832:	4705                	li	a4,1
    80005834:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005836:	fd843783          	ld	a5,-40(s0)
    8000583a:	04479783          	lh	a5,68(a5)
    8000583e:	eb89                	bnez	a5,80005850 <ilock+0x12a>
      panic("ilock: no type");
    80005840:	00007517          	auipc	a0,0x7
    80005844:	cb050513          	addi	a0,a0,-848 # 8000c4f0 <etext+0x4f0>
    80005848:	ffffb097          	auipc	ra,0xffffb
    8000584c:	444080e7          	jalr	1092(ra) # 80000c8c <panic>
  }
}
    80005850:	0001                	nop
    80005852:	70a2                	ld	ra,40(sp)
    80005854:	7402                	ld	s0,32(sp)
    80005856:	6145                	addi	sp,sp,48
    80005858:	8082                	ret

000000008000585a <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    8000585a:	1101                	addi	sp,sp,-32
    8000585c:	ec06                	sd	ra,24(sp)
    8000585e:	e822                	sd	s0,16(sp)
    80005860:	1000                	addi	s0,sp,32
    80005862:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005866:	fe843783          	ld	a5,-24(s0)
    8000586a:	c385                	beqz	a5,8000588a <iunlock+0x30>
    8000586c:	fe843783          	ld	a5,-24(s0)
    80005870:	07c1                	addi	a5,a5,16
    80005872:	853e                	mv	a0,a5
    80005874:	00001097          	auipc	ra,0x1
    80005878:	45a080e7          	jalr	1114(ra) # 80006cce <holdingsleep>
    8000587c:	87aa                	mv	a5,a0
    8000587e:	c791                	beqz	a5,8000588a <iunlock+0x30>
    80005880:	fe843783          	ld	a5,-24(s0)
    80005884:	479c                	lw	a5,8(a5)
    80005886:	00f04a63          	bgtz	a5,8000589a <iunlock+0x40>
    panic("iunlock");
    8000588a:	00007517          	auipc	a0,0x7
    8000588e:	c7650513          	addi	a0,a0,-906 # 8000c500 <etext+0x500>
    80005892:	ffffb097          	auipc	ra,0xffffb
    80005896:	3fa080e7          	jalr	1018(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    8000589a:	fe843783          	ld	a5,-24(s0)
    8000589e:	07c1                	addi	a5,a5,16
    800058a0:	853e                	mv	a0,a5
    800058a2:	00001097          	auipc	ra,0x1
    800058a6:	3da080e7          	jalr	986(ra) # 80006c7c <releasesleep>
}
    800058aa:	0001                	nop
    800058ac:	60e2                	ld	ra,24(sp)
    800058ae:	6442                	ld	s0,16(sp)
    800058b0:	6105                	addi	sp,sp,32
    800058b2:	8082                	ret

00000000800058b4 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800058b4:	1101                	addi	sp,sp,-32
    800058b6:	ec06                	sd	ra,24(sp)
    800058b8:	e822                	sd	s0,16(sp)
    800058ba:	1000                	addi	s0,sp,32
    800058bc:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800058c0:	0004e517          	auipc	a0,0x4e
    800058c4:	82050513          	addi	a0,a0,-2016 # 800530e0 <itable>
    800058c8:	ffffc097          	auipc	ra,0xffffc
    800058cc:	aa0080e7          	jalr	-1376(ra) # 80001368 <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800058d0:	fe843783          	ld	a5,-24(s0)
    800058d4:	479c                	lw	a5,8(a5)
    800058d6:	873e                	mv	a4,a5
    800058d8:	4785                	li	a5,1
    800058da:	06f71f63          	bne	a4,a5,80005958 <iput+0xa4>
    800058de:	fe843783          	ld	a5,-24(s0)
    800058e2:	43bc                	lw	a5,64(a5)
    800058e4:	cbb5                	beqz	a5,80005958 <iput+0xa4>
    800058e6:	fe843783          	ld	a5,-24(s0)
    800058ea:	04a79783          	lh	a5,74(a5)
    800058ee:	e7ad                	bnez	a5,80005958 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800058f0:	fe843783          	ld	a5,-24(s0)
    800058f4:	07c1                	addi	a5,a5,16
    800058f6:	853e                	mv	a0,a5
    800058f8:	00001097          	auipc	ra,0x1
    800058fc:	316080e7          	jalr	790(ra) # 80006c0e <acquiresleep>

    release(&itable.lock);
    80005900:	0004d517          	auipc	a0,0x4d
    80005904:	7e050513          	addi	a0,a0,2016 # 800530e0 <itable>
    80005908:	ffffc097          	auipc	ra,0xffffc
    8000590c:	ac4080e7          	jalr	-1340(ra) # 800013cc <release>

    itrunc(ip);
    80005910:	fe843503          	ld	a0,-24(s0)
    80005914:	00000097          	auipc	ra,0x0
    80005918:	21a080e7          	jalr	538(ra) # 80005b2e <itrunc>
    ip->type = 0;
    8000591c:	fe843783          	ld	a5,-24(s0)
    80005920:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005924:	fe843503          	ld	a0,-24(s0)
    80005928:	00000097          	auipc	ra,0x0
    8000592c:	bae080e7          	jalr	-1106(ra) # 800054d6 <iupdate>
    ip->valid = 0;
    80005930:	fe843783          	ld	a5,-24(s0)
    80005934:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005938:	fe843783          	ld	a5,-24(s0)
    8000593c:	07c1                	addi	a5,a5,16
    8000593e:	853e                	mv	a0,a5
    80005940:	00001097          	auipc	ra,0x1
    80005944:	33c080e7          	jalr	828(ra) # 80006c7c <releasesleep>

    acquire(&itable.lock);
    80005948:	0004d517          	auipc	a0,0x4d
    8000594c:	79850513          	addi	a0,a0,1944 # 800530e0 <itable>
    80005950:	ffffc097          	auipc	ra,0xffffc
    80005954:	a18080e7          	jalr	-1512(ra) # 80001368 <acquire>
  }

  ip->ref--;
    80005958:	fe843783          	ld	a5,-24(s0)
    8000595c:	479c                	lw	a5,8(a5)
    8000595e:	37fd                	addiw	a5,a5,-1
    80005960:	0007871b          	sext.w	a4,a5
    80005964:	fe843783          	ld	a5,-24(s0)
    80005968:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000596a:	0004d517          	auipc	a0,0x4d
    8000596e:	77650513          	addi	a0,a0,1910 # 800530e0 <itable>
    80005972:	ffffc097          	auipc	ra,0xffffc
    80005976:	a5a080e7          	jalr	-1446(ra) # 800013cc <release>
}
    8000597a:	0001                	nop
    8000597c:	60e2                	ld	ra,24(sp)
    8000597e:	6442                	ld	s0,16(sp)
    80005980:	6105                	addi	sp,sp,32
    80005982:	8082                	ret

0000000080005984 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005984:	1101                	addi	sp,sp,-32
    80005986:	ec06                	sd	ra,24(sp)
    80005988:	e822                	sd	s0,16(sp)
    8000598a:	1000                	addi	s0,sp,32
    8000598c:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    80005990:	fe843503          	ld	a0,-24(s0)
    80005994:	00000097          	auipc	ra,0x0
    80005998:	ec6080e7          	jalr	-314(ra) # 8000585a <iunlock>
  iput(ip);
    8000599c:	fe843503          	ld	a0,-24(s0)
    800059a0:	00000097          	auipc	ra,0x0
    800059a4:	f14080e7          	jalr	-236(ra) # 800058b4 <iput>
}
    800059a8:	0001                	nop
    800059aa:	60e2                	ld	ra,24(sp)
    800059ac:	6442                	ld	s0,16(sp)
    800059ae:	6105                	addi	sp,sp,32
    800059b0:	8082                	ret

00000000800059b2 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    800059b2:	7139                	addi	sp,sp,-64
    800059b4:	fc06                	sd	ra,56(sp)
    800059b6:	f822                	sd	s0,48(sp)
    800059b8:	0080                	addi	s0,sp,64
    800059ba:	fca43423          	sd	a0,-56(s0)
    800059be:	87ae                	mv	a5,a1
    800059c0:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800059c4:	fc442783          	lw	a5,-60(s0)
    800059c8:	0007871b          	sext.w	a4,a5
    800059cc:	47ad                	li	a5,11
    800059ce:	04e7ee63          	bltu	a5,a4,80005a2a <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    800059d2:	fc843703          	ld	a4,-56(s0)
    800059d6:	fc446783          	lwu	a5,-60(s0)
    800059da:	07d1                	addi	a5,a5,20
    800059dc:	078a                	slli	a5,a5,0x2
    800059de:	97ba                	add	a5,a5,a4
    800059e0:	439c                	lw	a5,0(a5)
    800059e2:	fef42623          	sw	a5,-20(s0)
    800059e6:	fec42783          	lw	a5,-20(s0)
    800059ea:	2781                	sext.w	a5,a5
    800059ec:	ef85                	bnez	a5,80005a24 <bmap+0x72>
      addr = balloc(ip->dev);
    800059ee:	fc843783          	ld	a5,-56(s0)
    800059f2:	439c                	lw	a5,0(a5)
    800059f4:	853e                	mv	a0,a5
    800059f6:	fffff097          	auipc	ra,0xfffff
    800059fa:	68e080e7          	jalr	1678(ra) # 80005084 <balloc>
    800059fe:	87aa                	mv	a5,a0
    80005a00:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005a04:	fec42783          	lw	a5,-20(s0)
    80005a08:	2781                	sext.w	a5,a5
    80005a0a:	e399                	bnez	a5,80005a10 <bmap+0x5e>
        return 0;
    80005a0c:	4781                	li	a5,0
    80005a0e:	aa19                	j	80005b24 <bmap+0x172>
      ip->addrs[bn] = addr;
    80005a10:	fc843703          	ld	a4,-56(s0)
    80005a14:	fc446783          	lwu	a5,-60(s0)
    80005a18:	07d1                	addi	a5,a5,20
    80005a1a:	078a                	slli	a5,a5,0x2
    80005a1c:	97ba                	add	a5,a5,a4
    80005a1e:	fec42703          	lw	a4,-20(s0)
    80005a22:	c398                	sw	a4,0(a5)
    }
    return addr;
    80005a24:	fec42783          	lw	a5,-20(s0)
    80005a28:	a8f5                	j	80005b24 <bmap+0x172>
  }
  bn -= NDIRECT;
    80005a2a:	fc442783          	lw	a5,-60(s0)
    80005a2e:	37d1                	addiw	a5,a5,-12
    80005a30:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005a34:	fc442783          	lw	a5,-60(s0)
    80005a38:	0007871b          	sext.w	a4,a5
    80005a3c:	0ff00793          	li	a5,255
    80005a40:	0ce7ea63          	bltu	a5,a4,80005b14 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    80005a44:	fc843783          	ld	a5,-56(s0)
    80005a48:	0807a783          	lw	a5,128(a5)
    80005a4c:	fef42623          	sw	a5,-20(s0)
    80005a50:	fec42783          	lw	a5,-20(s0)
    80005a54:	2781                	sext.w	a5,a5
    80005a56:	eb85                	bnez	a5,80005a86 <bmap+0xd4>
      addr = balloc(ip->dev);
    80005a58:	fc843783          	ld	a5,-56(s0)
    80005a5c:	439c                	lw	a5,0(a5)
    80005a5e:	853e                	mv	a0,a5
    80005a60:	fffff097          	auipc	ra,0xfffff
    80005a64:	624080e7          	jalr	1572(ra) # 80005084 <balloc>
    80005a68:	87aa                	mv	a5,a0
    80005a6a:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005a6e:	fec42783          	lw	a5,-20(s0)
    80005a72:	2781                	sext.w	a5,a5
    80005a74:	e399                	bnez	a5,80005a7a <bmap+0xc8>
        return 0;
    80005a76:	4781                	li	a5,0
    80005a78:	a075                	j	80005b24 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    80005a7a:	fc843783          	ld	a5,-56(s0)
    80005a7e:	fec42703          	lw	a4,-20(s0)
    80005a82:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005a86:	fc843783          	ld	a5,-56(s0)
    80005a8a:	439c                	lw	a5,0(a5)
    80005a8c:	fec42703          	lw	a4,-20(s0)
    80005a90:	85ba                	mv	a1,a4
    80005a92:	853e                	mv	a0,a5
    80005a94:	fffff097          	auipc	ra,0xfffff
    80005a98:	29e080e7          	jalr	670(ra) # 80004d32 <bread>
    80005a9c:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005aa0:	fe043783          	ld	a5,-32(s0)
    80005aa4:	05878793          	addi	a5,a5,88
    80005aa8:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005aac:	fc446783          	lwu	a5,-60(s0)
    80005ab0:	078a                	slli	a5,a5,0x2
    80005ab2:	fd843703          	ld	a4,-40(s0)
    80005ab6:	97ba                	add	a5,a5,a4
    80005ab8:	439c                	lw	a5,0(a5)
    80005aba:	fef42623          	sw	a5,-20(s0)
    80005abe:	fec42783          	lw	a5,-20(s0)
    80005ac2:	2781                	sext.w	a5,a5
    80005ac4:	ef9d                	bnez	a5,80005b02 <bmap+0x150>
      addr = balloc(ip->dev);
    80005ac6:	fc843783          	ld	a5,-56(s0)
    80005aca:	439c                	lw	a5,0(a5)
    80005acc:	853e                	mv	a0,a5
    80005ace:	fffff097          	auipc	ra,0xfffff
    80005ad2:	5b6080e7          	jalr	1462(ra) # 80005084 <balloc>
    80005ad6:	87aa                	mv	a5,a0
    80005ad8:	fef42623          	sw	a5,-20(s0)
      if(addr){
    80005adc:	fec42783          	lw	a5,-20(s0)
    80005ae0:	2781                	sext.w	a5,a5
    80005ae2:	c385                	beqz	a5,80005b02 <bmap+0x150>
        a[bn] = addr;
    80005ae4:	fc446783          	lwu	a5,-60(s0)
    80005ae8:	078a                	slli	a5,a5,0x2
    80005aea:	fd843703          	ld	a4,-40(s0)
    80005aee:	97ba                	add	a5,a5,a4
    80005af0:	fec42703          	lw	a4,-20(s0)
    80005af4:	c398                	sw	a4,0(a5)
        log_write(bp);
    80005af6:	fe043503          	ld	a0,-32(s0)
    80005afa:	00001097          	auipc	ra,0x1
    80005afe:	f94080e7          	jalr	-108(ra) # 80006a8e <log_write>
      }
    }
    brelse(bp);
    80005b02:	fe043503          	ld	a0,-32(s0)
    80005b06:	fffff097          	auipc	ra,0xfffff
    80005b0a:	2d6080e7          	jalr	726(ra) # 80004ddc <brelse>
    return addr;
    80005b0e:	fec42783          	lw	a5,-20(s0)
    80005b12:	a809                	j	80005b24 <bmap+0x172>
  }

  panic("bmap: out of range");
    80005b14:	00007517          	auipc	a0,0x7
    80005b18:	9f450513          	addi	a0,a0,-1548 # 8000c508 <etext+0x508>
    80005b1c:	ffffb097          	auipc	ra,0xffffb
    80005b20:	170080e7          	jalr	368(ra) # 80000c8c <panic>
}
    80005b24:	853e                	mv	a0,a5
    80005b26:	70e2                	ld	ra,56(sp)
    80005b28:	7442                	ld	s0,48(sp)
    80005b2a:	6121                	addi	sp,sp,64
    80005b2c:	8082                	ret

0000000080005b2e <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005b2e:	7139                	addi	sp,sp,-64
    80005b30:	fc06                	sd	ra,56(sp)
    80005b32:	f822                	sd	s0,48(sp)
    80005b34:	0080                	addi	s0,sp,64
    80005b36:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005b3a:	fe042623          	sw	zero,-20(s0)
    80005b3e:	a899                	j	80005b94 <itrunc+0x66>
    if(ip->addrs[i]){
    80005b40:	fc843703          	ld	a4,-56(s0)
    80005b44:	fec42783          	lw	a5,-20(s0)
    80005b48:	07d1                	addi	a5,a5,20
    80005b4a:	078a                	slli	a5,a5,0x2
    80005b4c:	97ba                	add	a5,a5,a4
    80005b4e:	439c                	lw	a5,0(a5)
    80005b50:	cf8d                	beqz	a5,80005b8a <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005b52:	fc843783          	ld	a5,-56(s0)
    80005b56:	439c                	lw	a5,0(a5)
    80005b58:	0007869b          	sext.w	a3,a5
    80005b5c:	fc843703          	ld	a4,-56(s0)
    80005b60:	fec42783          	lw	a5,-20(s0)
    80005b64:	07d1                	addi	a5,a5,20
    80005b66:	078a                	slli	a5,a5,0x2
    80005b68:	97ba                	add	a5,a5,a4
    80005b6a:	439c                	lw	a5,0(a5)
    80005b6c:	85be                	mv	a1,a5
    80005b6e:	8536                	mv	a0,a3
    80005b70:	fffff097          	auipc	ra,0xfffff
    80005b74:	6c4080e7          	jalr	1732(ra) # 80005234 <bfree>
      ip->addrs[i] = 0;
    80005b78:	fc843703          	ld	a4,-56(s0)
    80005b7c:	fec42783          	lw	a5,-20(s0)
    80005b80:	07d1                	addi	a5,a5,20
    80005b82:	078a                	slli	a5,a5,0x2
    80005b84:	97ba                	add	a5,a5,a4
    80005b86:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005b8a:	fec42783          	lw	a5,-20(s0)
    80005b8e:	2785                	addiw	a5,a5,1
    80005b90:	fef42623          	sw	a5,-20(s0)
    80005b94:	fec42783          	lw	a5,-20(s0)
    80005b98:	0007871b          	sext.w	a4,a5
    80005b9c:	47ad                	li	a5,11
    80005b9e:	fae7d1e3          	bge	a5,a4,80005b40 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    80005ba2:	fc843783          	ld	a5,-56(s0)
    80005ba6:	0807a783          	lw	a5,128(a5)
    80005baa:	cbc5                	beqz	a5,80005c5a <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005bac:	fc843783          	ld	a5,-56(s0)
    80005bb0:	4398                	lw	a4,0(a5)
    80005bb2:	fc843783          	ld	a5,-56(s0)
    80005bb6:	0807a783          	lw	a5,128(a5)
    80005bba:	85be                	mv	a1,a5
    80005bbc:	853a                	mv	a0,a4
    80005bbe:	fffff097          	auipc	ra,0xfffff
    80005bc2:	174080e7          	jalr	372(ra) # 80004d32 <bread>
    80005bc6:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005bca:	fe043783          	ld	a5,-32(s0)
    80005bce:	05878793          	addi	a5,a5,88
    80005bd2:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005bd6:	fe042423          	sw	zero,-24(s0)
    80005bda:	a081                	j	80005c1a <itrunc+0xec>
      if(a[j])
    80005bdc:	fe842783          	lw	a5,-24(s0)
    80005be0:	078a                	slli	a5,a5,0x2
    80005be2:	fd843703          	ld	a4,-40(s0)
    80005be6:	97ba                	add	a5,a5,a4
    80005be8:	439c                	lw	a5,0(a5)
    80005bea:	c39d                	beqz	a5,80005c10 <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005bec:	fc843783          	ld	a5,-56(s0)
    80005bf0:	439c                	lw	a5,0(a5)
    80005bf2:	0007869b          	sext.w	a3,a5
    80005bf6:	fe842783          	lw	a5,-24(s0)
    80005bfa:	078a                	slli	a5,a5,0x2
    80005bfc:	fd843703          	ld	a4,-40(s0)
    80005c00:	97ba                	add	a5,a5,a4
    80005c02:	439c                	lw	a5,0(a5)
    80005c04:	85be                	mv	a1,a5
    80005c06:	8536                	mv	a0,a3
    80005c08:	fffff097          	auipc	ra,0xfffff
    80005c0c:	62c080e7          	jalr	1580(ra) # 80005234 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    80005c10:	fe842783          	lw	a5,-24(s0)
    80005c14:	2785                	addiw	a5,a5,1
    80005c16:	fef42423          	sw	a5,-24(s0)
    80005c1a:	fe842783          	lw	a5,-24(s0)
    80005c1e:	873e                	mv	a4,a5
    80005c20:	0ff00793          	li	a5,255
    80005c24:	fae7fce3          	bgeu	a5,a4,80005bdc <itrunc+0xae>
    }
    brelse(bp);
    80005c28:	fe043503          	ld	a0,-32(s0)
    80005c2c:	fffff097          	auipc	ra,0xfffff
    80005c30:	1b0080e7          	jalr	432(ra) # 80004ddc <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005c34:	fc843783          	ld	a5,-56(s0)
    80005c38:	439c                	lw	a5,0(a5)
    80005c3a:	0007871b          	sext.w	a4,a5
    80005c3e:	fc843783          	ld	a5,-56(s0)
    80005c42:	0807a783          	lw	a5,128(a5)
    80005c46:	85be                	mv	a1,a5
    80005c48:	853a                	mv	a0,a4
    80005c4a:	fffff097          	auipc	ra,0xfffff
    80005c4e:	5ea080e7          	jalr	1514(ra) # 80005234 <bfree>
    ip->addrs[NDIRECT] = 0;
    80005c52:	fc843783          	ld	a5,-56(s0)
    80005c56:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005c5a:	fc843783          	ld	a5,-56(s0)
    80005c5e:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005c62:	fc843503          	ld	a0,-56(s0)
    80005c66:	00000097          	auipc	ra,0x0
    80005c6a:	870080e7          	jalr	-1936(ra) # 800054d6 <iupdate>
}
    80005c6e:	0001                	nop
    80005c70:	70e2                	ld	ra,56(sp)
    80005c72:	7442                	ld	s0,48(sp)
    80005c74:	6121                	addi	sp,sp,64
    80005c76:	8082                	ret

0000000080005c78 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005c78:	1101                	addi	sp,sp,-32
    80005c7a:	ec22                	sd	s0,24(sp)
    80005c7c:	1000                	addi	s0,sp,32
    80005c7e:	fea43423          	sd	a0,-24(s0)
    80005c82:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005c86:	fe843783          	ld	a5,-24(s0)
    80005c8a:	439c                	lw	a5,0(a5)
    80005c8c:	0007871b          	sext.w	a4,a5
    80005c90:	fe043783          	ld	a5,-32(s0)
    80005c94:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005c96:	fe843783          	ld	a5,-24(s0)
    80005c9a:	43d8                	lw	a4,4(a5)
    80005c9c:	fe043783          	ld	a5,-32(s0)
    80005ca0:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    80005ca2:	fe843783          	ld	a5,-24(s0)
    80005ca6:	04479703          	lh	a4,68(a5)
    80005caa:	fe043783          	ld	a5,-32(s0)
    80005cae:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80005cb2:	fe843783          	ld	a5,-24(s0)
    80005cb6:	04a79703          	lh	a4,74(a5)
    80005cba:	fe043783          	ld	a5,-32(s0)
    80005cbe:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80005cc2:	fe843783          	ld	a5,-24(s0)
    80005cc6:	47fc                	lw	a5,76(a5)
    80005cc8:	02079713          	slli	a4,a5,0x20
    80005ccc:	9301                	srli	a4,a4,0x20
    80005cce:	fe043783          	ld	a5,-32(s0)
    80005cd2:	eb98                	sd	a4,16(a5)
}
    80005cd4:	0001                	nop
    80005cd6:	6462                	ld	s0,24(sp)
    80005cd8:	6105                	addi	sp,sp,32
    80005cda:	8082                	ret

0000000080005cdc <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005cdc:	715d                	addi	sp,sp,-80
    80005cde:	e486                	sd	ra,72(sp)
    80005ce0:	e0a2                	sd	s0,64(sp)
    80005ce2:	0880                	addi	s0,sp,80
    80005ce4:	fca43423          	sd	a0,-56(s0)
    80005ce8:	87ae                	mv	a5,a1
    80005cea:	fac43c23          	sd	a2,-72(s0)
    80005cee:	fcf42223          	sw	a5,-60(s0)
    80005cf2:	87b6                	mv	a5,a3
    80005cf4:	fcf42023          	sw	a5,-64(s0)
    80005cf8:	87ba                	mv	a5,a4
    80005cfa:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005cfe:	fc843783          	ld	a5,-56(s0)
    80005d02:	47f8                	lw	a4,76(a5)
    80005d04:	fc042783          	lw	a5,-64(s0)
    80005d08:	2781                	sext.w	a5,a5
    80005d0a:	00f76e63          	bltu	a4,a5,80005d26 <readi+0x4a>
    80005d0e:	fc042703          	lw	a4,-64(s0)
    80005d12:	fb442783          	lw	a5,-76(s0)
    80005d16:	9fb9                	addw	a5,a5,a4
    80005d18:	0007871b          	sext.w	a4,a5
    80005d1c:	fc042783          	lw	a5,-64(s0)
    80005d20:	2781                	sext.w	a5,a5
    80005d22:	00f77463          	bgeu	a4,a5,80005d2a <readi+0x4e>
    return 0;
    80005d26:	4781                	li	a5,0
    80005d28:	a289                	j	80005e6a <readi+0x18e>
  if(off + n > ip->size)
    80005d2a:	fc042703          	lw	a4,-64(s0)
    80005d2e:	fb442783          	lw	a5,-76(s0)
    80005d32:	9fb9                	addw	a5,a5,a4
    80005d34:	0007871b          	sext.w	a4,a5
    80005d38:	fc843783          	ld	a5,-56(s0)
    80005d3c:	47fc                	lw	a5,76(a5)
    80005d3e:	00e7fb63          	bgeu	a5,a4,80005d54 <readi+0x78>
    n = ip->size - off;
    80005d42:	fc843783          	ld	a5,-56(s0)
    80005d46:	47f8                	lw	a4,76(a5)
    80005d48:	fc042783          	lw	a5,-64(s0)
    80005d4c:	40f707bb          	subw	a5,a4,a5
    80005d50:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005d54:	fe042623          	sw	zero,-20(s0)
    80005d58:	a8ed                	j	80005e52 <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    80005d5a:	fc042783          	lw	a5,-64(s0)
    80005d5e:	00a7d79b          	srliw	a5,a5,0xa
    80005d62:	2781                	sext.w	a5,a5
    80005d64:	85be                	mv	a1,a5
    80005d66:	fc843503          	ld	a0,-56(s0)
    80005d6a:	00000097          	auipc	ra,0x0
    80005d6e:	c48080e7          	jalr	-952(ra) # 800059b2 <bmap>
    80005d72:	87aa                	mv	a5,a0
    80005d74:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005d78:	fe842783          	lw	a5,-24(s0)
    80005d7c:	2781                	sext.w	a5,a5
    80005d7e:	c3fd                	beqz	a5,80005e64 <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    80005d80:	fc843783          	ld	a5,-56(s0)
    80005d84:	439c                	lw	a5,0(a5)
    80005d86:	fe842703          	lw	a4,-24(s0)
    80005d8a:	85ba                	mv	a1,a4
    80005d8c:	853e                	mv	a0,a5
    80005d8e:	fffff097          	auipc	ra,0xfffff
    80005d92:	fa4080e7          	jalr	-92(ra) # 80004d32 <bread>
    80005d96:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005d9a:	fc042783          	lw	a5,-64(s0)
    80005d9e:	3ff7f793          	andi	a5,a5,1023
    80005da2:	2781                	sext.w	a5,a5
    80005da4:	40000713          	li	a4,1024
    80005da8:	40f707bb          	subw	a5,a4,a5
    80005dac:	0007869b          	sext.w	a3,a5
    80005db0:	fb442703          	lw	a4,-76(s0)
    80005db4:	fec42783          	lw	a5,-20(s0)
    80005db8:	40f707bb          	subw	a5,a4,a5
    80005dbc:	2781                	sext.w	a5,a5
    80005dbe:	863e                	mv	a2,a5
    80005dc0:	87b6                	mv	a5,a3
    80005dc2:	0007869b          	sext.w	a3,a5
    80005dc6:	0006071b          	sext.w	a4,a2
    80005dca:	00d77363          	bgeu	a4,a3,80005dd0 <readi+0xf4>
    80005dce:	87b2                	mv	a5,a2
    80005dd0:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005dd4:	fe043783          	ld	a5,-32(s0)
    80005dd8:	05878713          	addi	a4,a5,88
    80005ddc:	fc046783          	lwu	a5,-64(s0)
    80005de0:	3ff7f793          	andi	a5,a5,1023
    80005de4:	973e                	add	a4,a4,a5
    80005de6:	fdc46683          	lwu	a3,-36(s0)
    80005dea:	fc442783          	lw	a5,-60(s0)
    80005dee:	863a                	mv	a2,a4
    80005df0:	fb843583          	ld	a1,-72(s0)
    80005df4:	853e                	mv	a0,a5
    80005df6:	ffffe097          	auipc	ra,0xffffe
    80005dfa:	ea0080e7          	jalr	-352(ra) # 80003c96 <either_copyout>
    80005dfe:	87aa                	mv	a5,a0
    80005e00:	873e                	mv	a4,a5
    80005e02:	57fd                	li	a5,-1
    80005e04:	00f71c63          	bne	a4,a5,80005e1c <readi+0x140>
      brelse(bp);
    80005e08:	fe043503          	ld	a0,-32(s0)
    80005e0c:	fffff097          	auipc	ra,0xfffff
    80005e10:	fd0080e7          	jalr	-48(ra) # 80004ddc <brelse>
      tot = -1;
    80005e14:	57fd                	li	a5,-1
    80005e16:	fef42623          	sw	a5,-20(s0)
      break;
    80005e1a:	a0b1                	j	80005e66 <readi+0x18a>
    }
    brelse(bp);
    80005e1c:	fe043503          	ld	a0,-32(s0)
    80005e20:	fffff097          	auipc	ra,0xfffff
    80005e24:	fbc080e7          	jalr	-68(ra) # 80004ddc <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005e28:	fec42703          	lw	a4,-20(s0)
    80005e2c:	fdc42783          	lw	a5,-36(s0)
    80005e30:	9fb9                	addw	a5,a5,a4
    80005e32:	fef42623          	sw	a5,-20(s0)
    80005e36:	fc042703          	lw	a4,-64(s0)
    80005e3a:	fdc42783          	lw	a5,-36(s0)
    80005e3e:	9fb9                	addw	a5,a5,a4
    80005e40:	fcf42023          	sw	a5,-64(s0)
    80005e44:	fdc46783          	lwu	a5,-36(s0)
    80005e48:	fb843703          	ld	a4,-72(s0)
    80005e4c:	97ba                	add	a5,a5,a4
    80005e4e:	faf43c23          	sd	a5,-72(s0)
    80005e52:	fec42703          	lw	a4,-20(s0)
    80005e56:	fb442783          	lw	a5,-76(s0)
    80005e5a:	2701                	sext.w	a4,a4
    80005e5c:	2781                	sext.w	a5,a5
    80005e5e:	eef76ee3          	bltu	a4,a5,80005d5a <readi+0x7e>
    80005e62:	a011                	j	80005e66 <readi+0x18a>
      break;
    80005e64:	0001                	nop
  }
  return tot;
    80005e66:	fec42783          	lw	a5,-20(s0)
}
    80005e6a:	853e                	mv	a0,a5
    80005e6c:	60a6                	ld	ra,72(sp)
    80005e6e:	6406                	ld	s0,64(sp)
    80005e70:	6161                	addi	sp,sp,80
    80005e72:	8082                	ret

0000000080005e74 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005e74:	715d                	addi	sp,sp,-80
    80005e76:	e486                	sd	ra,72(sp)
    80005e78:	e0a2                	sd	s0,64(sp)
    80005e7a:	0880                	addi	s0,sp,80
    80005e7c:	fca43423          	sd	a0,-56(s0)
    80005e80:	87ae                	mv	a5,a1
    80005e82:	fac43c23          	sd	a2,-72(s0)
    80005e86:	fcf42223          	sw	a5,-60(s0)
    80005e8a:	87b6                	mv	a5,a3
    80005e8c:	fcf42023          	sw	a5,-64(s0)
    80005e90:	87ba                	mv	a5,a4
    80005e92:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005e96:	fc843783          	ld	a5,-56(s0)
    80005e9a:	47f8                	lw	a4,76(a5)
    80005e9c:	fc042783          	lw	a5,-64(s0)
    80005ea0:	2781                	sext.w	a5,a5
    80005ea2:	00f76e63          	bltu	a4,a5,80005ebe <writei+0x4a>
    80005ea6:	fc042703          	lw	a4,-64(s0)
    80005eaa:	fb442783          	lw	a5,-76(s0)
    80005eae:	9fb9                	addw	a5,a5,a4
    80005eb0:	0007871b          	sext.w	a4,a5
    80005eb4:	fc042783          	lw	a5,-64(s0)
    80005eb8:	2781                	sext.w	a5,a5
    80005eba:	00f77463          	bgeu	a4,a5,80005ec2 <writei+0x4e>
    return -1;
    80005ebe:	57fd                	li	a5,-1
    80005ec0:	aab9                	j	8000601e <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005ec2:	fc042703          	lw	a4,-64(s0)
    80005ec6:	fb442783          	lw	a5,-76(s0)
    80005eca:	9fb9                	addw	a5,a5,a4
    80005ecc:	2781                	sext.w	a5,a5
    80005ece:	873e                	mv	a4,a5
    80005ed0:	000437b7          	lui	a5,0x43
    80005ed4:	00e7f463          	bgeu	a5,a4,80005edc <writei+0x68>
    return -1;
    80005ed8:	57fd                	li	a5,-1
    80005eda:	a291                	j	8000601e <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005edc:	fe042623          	sw	zero,-20(s0)
    80005ee0:	a201                	j	80005fe0 <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005ee2:	fc042783          	lw	a5,-64(s0)
    80005ee6:	00a7d79b          	srliw	a5,a5,0xa
    80005eea:	2781                	sext.w	a5,a5
    80005eec:	85be                	mv	a1,a5
    80005eee:	fc843503          	ld	a0,-56(s0)
    80005ef2:	00000097          	auipc	ra,0x0
    80005ef6:	ac0080e7          	jalr	-1344(ra) # 800059b2 <bmap>
    80005efa:	87aa                	mv	a5,a0
    80005efc:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005f00:	fe842783          	lw	a5,-24(s0)
    80005f04:	2781                	sext.w	a5,a5
    80005f06:	c7f5                	beqz	a5,80005ff2 <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005f08:	fc843783          	ld	a5,-56(s0)
    80005f0c:	439c                	lw	a5,0(a5)
    80005f0e:	fe842703          	lw	a4,-24(s0)
    80005f12:	85ba                	mv	a1,a4
    80005f14:	853e                	mv	a0,a5
    80005f16:	fffff097          	auipc	ra,0xfffff
    80005f1a:	e1c080e7          	jalr	-484(ra) # 80004d32 <bread>
    80005f1e:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005f22:	fc042783          	lw	a5,-64(s0)
    80005f26:	3ff7f793          	andi	a5,a5,1023
    80005f2a:	2781                	sext.w	a5,a5
    80005f2c:	40000713          	li	a4,1024
    80005f30:	40f707bb          	subw	a5,a4,a5
    80005f34:	0007869b          	sext.w	a3,a5
    80005f38:	fb442703          	lw	a4,-76(s0)
    80005f3c:	fec42783          	lw	a5,-20(s0)
    80005f40:	40f707bb          	subw	a5,a4,a5
    80005f44:	2781                	sext.w	a5,a5
    80005f46:	863e                	mv	a2,a5
    80005f48:	87b6                	mv	a5,a3
    80005f4a:	0007869b          	sext.w	a3,a5
    80005f4e:	0006071b          	sext.w	a4,a2
    80005f52:	00d77363          	bgeu	a4,a3,80005f58 <writei+0xe4>
    80005f56:	87b2                	mv	a5,a2
    80005f58:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005f5c:	fe043783          	ld	a5,-32(s0)
    80005f60:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005f64:	fc046783          	lwu	a5,-64(s0)
    80005f68:	3ff7f793          	andi	a5,a5,1023
    80005f6c:	97ba                	add	a5,a5,a4
    80005f6e:	fdc46683          	lwu	a3,-36(s0)
    80005f72:	fc442703          	lw	a4,-60(s0)
    80005f76:	fb843603          	ld	a2,-72(s0)
    80005f7a:	85ba                	mv	a1,a4
    80005f7c:	853e                	mv	a0,a5
    80005f7e:	ffffe097          	auipc	ra,0xffffe
    80005f82:	d8c080e7          	jalr	-628(ra) # 80003d0a <either_copyin>
    80005f86:	87aa                	mv	a5,a0
    80005f88:	873e                	mv	a4,a5
    80005f8a:	57fd                	li	a5,-1
    80005f8c:	00f71963          	bne	a4,a5,80005f9e <writei+0x12a>
      brelse(bp);
    80005f90:	fe043503          	ld	a0,-32(s0)
    80005f94:	fffff097          	auipc	ra,0xfffff
    80005f98:	e48080e7          	jalr	-440(ra) # 80004ddc <brelse>
      break;
    80005f9c:	a8a1                	j	80005ff4 <writei+0x180>
    }
    log_write(bp);
    80005f9e:	fe043503          	ld	a0,-32(s0)
    80005fa2:	00001097          	auipc	ra,0x1
    80005fa6:	aec080e7          	jalr	-1300(ra) # 80006a8e <log_write>
    brelse(bp);
    80005faa:	fe043503          	ld	a0,-32(s0)
    80005fae:	fffff097          	auipc	ra,0xfffff
    80005fb2:	e2e080e7          	jalr	-466(ra) # 80004ddc <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005fb6:	fec42703          	lw	a4,-20(s0)
    80005fba:	fdc42783          	lw	a5,-36(s0)
    80005fbe:	9fb9                	addw	a5,a5,a4
    80005fc0:	fef42623          	sw	a5,-20(s0)
    80005fc4:	fc042703          	lw	a4,-64(s0)
    80005fc8:	fdc42783          	lw	a5,-36(s0)
    80005fcc:	9fb9                	addw	a5,a5,a4
    80005fce:	fcf42023          	sw	a5,-64(s0)
    80005fd2:	fdc46783          	lwu	a5,-36(s0)
    80005fd6:	fb843703          	ld	a4,-72(s0)
    80005fda:	97ba                	add	a5,a5,a4
    80005fdc:	faf43c23          	sd	a5,-72(s0)
    80005fe0:	fec42703          	lw	a4,-20(s0)
    80005fe4:	fb442783          	lw	a5,-76(s0)
    80005fe8:	2701                	sext.w	a4,a4
    80005fea:	2781                	sext.w	a5,a5
    80005fec:	eef76be3          	bltu	a4,a5,80005ee2 <writei+0x6e>
    80005ff0:	a011                	j	80005ff4 <writei+0x180>
      break;
    80005ff2:	0001                	nop
  }

  if(off > ip->size)
    80005ff4:	fc843783          	ld	a5,-56(s0)
    80005ff8:	47f8                	lw	a4,76(a5)
    80005ffa:	fc042783          	lw	a5,-64(s0)
    80005ffe:	2781                	sext.w	a5,a5
    80006000:	00f77763          	bgeu	a4,a5,8000600e <writei+0x19a>
    ip->size = off;
    80006004:	fc843783          	ld	a5,-56(s0)
    80006008:	fc042703          	lw	a4,-64(s0)
    8000600c:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    8000600e:	fc843503          	ld	a0,-56(s0)
    80006012:	fffff097          	auipc	ra,0xfffff
    80006016:	4c4080e7          	jalr	1220(ra) # 800054d6 <iupdate>

  return tot;
    8000601a:	fec42783          	lw	a5,-20(s0)
}
    8000601e:	853e                	mv	a0,a5
    80006020:	60a6                	ld	ra,72(sp)
    80006022:	6406                	ld	s0,64(sp)
    80006024:	6161                	addi	sp,sp,80
    80006026:	8082                	ret

0000000080006028 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80006028:	1101                	addi	sp,sp,-32
    8000602a:	ec06                	sd	ra,24(sp)
    8000602c:	e822                	sd	s0,16(sp)
    8000602e:	1000                	addi	s0,sp,32
    80006030:	fea43423          	sd	a0,-24(s0)
    80006034:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80006038:	4639                	li	a2,14
    8000603a:	fe043583          	ld	a1,-32(s0)
    8000603e:	fe843503          	ld	a0,-24(s0)
    80006042:	ffffb097          	auipc	ra,0xffffb
    80006046:	6f2080e7          	jalr	1778(ra) # 80001734 <strncmp>
    8000604a:	87aa                	mv	a5,a0
}
    8000604c:	853e                	mv	a0,a5
    8000604e:	60e2                	ld	ra,24(sp)
    80006050:	6442                	ld	s0,16(sp)
    80006052:	6105                	addi	sp,sp,32
    80006054:	8082                	ret

0000000080006056 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80006056:	715d                	addi	sp,sp,-80
    80006058:	e486                	sd	ra,72(sp)
    8000605a:	e0a2                	sd	s0,64(sp)
    8000605c:	0880                	addi	s0,sp,80
    8000605e:	fca43423          	sd	a0,-56(s0)
    80006062:	fcb43023          	sd	a1,-64(s0)
    80006066:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    8000606a:	fc843783          	ld	a5,-56(s0)
    8000606e:	04479783          	lh	a5,68(a5)
    80006072:	0007871b          	sext.w	a4,a5
    80006076:	4785                	li	a5,1
    80006078:	00f70a63          	beq	a4,a5,8000608c <dirlookup+0x36>
    panic("dirlookup not DIR");
    8000607c:	00006517          	auipc	a0,0x6
    80006080:	4a450513          	addi	a0,a0,1188 # 8000c520 <etext+0x520>
    80006084:	ffffb097          	auipc	ra,0xffffb
    80006088:	c08080e7          	jalr	-1016(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    8000608c:	fe042623          	sw	zero,-20(s0)
    80006090:	a849                	j	80006122 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80006092:	fd840793          	addi	a5,s0,-40
    80006096:	fec42683          	lw	a3,-20(s0)
    8000609a:	4741                	li	a4,16
    8000609c:	863e                	mv	a2,a5
    8000609e:	4581                	li	a1,0
    800060a0:	fc843503          	ld	a0,-56(s0)
    800060a4:	00000097          	auipc	ra,0x0
    800060a8:	c38080e7          	jalr	-968(ra) # 80005cdc <readi>
    800060ac:	87aa                	mv	a5,a0
    800060ae:	873e                	mv	a4,a5
    800060b0:	47c1                	li	a5,16
    800060b2:	00f70a63          	beq	a4,a5,800060c6 <dirlookup+0x70>
      panic("dirlookup read");
    800060b6:	00006517          	auipc	a0,0x6
    800060ba:	48250513          	addi	a0,a0,1154 # 8000c538 <etext+0x538>
    800060be:	ffffb097          	auipc	ra,0xffffb
    800060c2:	bce080e7          	jalr	-1074(ra) # 80000c8c <panic>
    if(de.inum == 0)
    800060c6:	fd845783          	lhu	a5,-40(s0)
    800060ca:	c7b1                	beqz	a5,80006116 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    800060cc:	fd840793          	addi	a5,s0,-40
    800060d0:	0789                	addi	a5,a5,2
    800060d2:	85be                	mv	a1,a5
    800060d4:	fc043503          	ld	a0,-64(s0)
    800060d8:	00000097          	auipc	ra,0x0
    800060dc:	f50080e7          	jalr	-176(ra) # 80006028 <namecmp>
    800060e0:	87aa                	mv	a5,a0
    800060e2:	eb9d                	bnez	a5,80006118 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    800060e4:	fb843783          	ld	a5,-72(s0)
    800060e8:	c791                	beqz	a5,800060f4 <dirlookup+0x9e>
        *poff = off;
    800060ea:	fb843783          	ld	a5,-72(s0)
    800060ee:	fec42703          	lw	a4,-20(s0)
    800060f2:	c398                	sw	a4,0(a5)
      inum = de.inum;
    800060f4:	fd845783          	lhu	a5,-40(s0)
    800060f8:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    800060fc:	fc843783          	ld	a5,-56(s0)
    80006100:	439c                	lw	a5,0(a5)
    80006102:	fe842703          	lw	a4,-24(s0)
    80006106:	85ba                	mv	a1,a4
    80006108:	853e                	mv	a0,a5
    8000610a:	fffff097          	auipc	ra,0xfffff
    8000610e:	4b4080e7          	jalr	1204(ra) # 800055be <iget>
    80006112:	87aa                	mv	a5,a0
    80006114:	a005                	j	80006134 <dirlookup+0xde>
      continue;
    80006116:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80006118:	fec42783          	lw	a5,-20(s0)
    8000611c:	27c1                	addiw	a5,a5,16
    8000611e:	fef42623          	sw	a5,-20(s0)
    80006122:	fc843783          	ld	a5,-56(s0)
    80006126:	47f8                	lw	a4,76(a5)
    80006128:	fec42783          	lw	a5,-20(s0)
    8000612c:	2781                	sext.w	a5,a5
    8000612e:	f6e7e2e3          	bltu	a5,a4,80006092 <dirlookup+0x3c>
    }
  }

  return 0;
    80006132:	4781                	li	a5,0
}
    80006134:	853e                	mv	a0,a5
    80006136:	60a6                	ld	ra,72(sp)
    80006138:	6406                	ld	s0,64(sp)
    8000613a:	6161                	addi	sp,sp,80
    8000613c:	8082                	ret

000000008000613e <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    8000613e:	715d                	addi	sp,sp,-80
    80006140:	e486                	sd	ra,72(sp)
    80006142:	e0a2                	sd	s0,64(sp)
    80006144:	0880                	addi	s0,sp,80
    80006146:	fca43423          	sd	a0,-56(s0)
    8000614a:	fcb43023          	sd	a1,-64(s0)
    8000614e:	87b2                	mv	a5,a2
    80006150:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80006154:	4601                	li	a2,0
    80006156:	fc043583          	ld	a1,-64(s0)
    8000615a:	fc843503          	ld	a0,-56(s0)
    8000615e:	00000097          	auipc	ra,0x0
    80006162:	ef8080e7          	jalr	-264(ra) # 80006056 <dirlookup>
    80006166:	fea43023          	sd	a0,-32(s0)
    8000616a:	fe043783          	ld	a5,-32(s0)
    8000616e:	cb89                	beqz	a5,80006180 <dirlink+0x42>
    iput(ip);
    80006170:	fe043503          	ld	a0,-32(s0)
    80006174:	fffff097          	auipc	ra,0xfffff
    80006178:	740080e7          	jalr	1856(ra) # 800058b4 <iput>
    return -1;
    8000617c:	57fd                	li	a5,-1
    8000617e:	a075                	j	8000622a <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80006180:	fe042623          	sw	zero,-20(s0)
    80006184:	a0a1                	j	800061cc <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80006186:	fd040793          	addi	a5,s0,-48
    8000618a:	fec42683          	lw	a3,-20(s0)
    8000618e:	4741                	li	a4,16
    80006190:	863e                	mv	a2,a5
    80006192:	4581                	li	a1,0
    80006194:	fc843503          	ld	a0,-56(s0)
    80006198:	00000097          	auipc	ra,0x0
    8000619c:	b44080e7          	jalr	-1212(ra) # 80005cdc <readi>
    800061a0:	87aa                	mv	a5,a0
    800061a2:	873e                	mv	a4,a5
    800061a4:	47c1                	li	a5,16
    800061a6:	00f70a63          	beq	a4,a5,800061ba <dirlink+0x7c>
      panic("dirlink read");
    800061aa:	00006517          	auipc	a0,0x6
    800061ae:	39e50513          	addi	a0,a0,926 # 8000c548 <etext+0x548>
    800061b2:	ffffb097          	auipc	ra,0xffffb
    800061b6:	ada080e7          	jalr	-1318(ra) # 80000c8c <panic>
    if(de.inum == 0)
    800061ba:	fd045783          	lhu	a5,-48(s0)
    800061be:	cf99                	beqz	a5,800061dc <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    800061c0:	fec42783          	lw	a5,-20(s0)
    800061c4:	27c1                	addiw	a5,a5,16
    800061c6:	2781                	sext.w	a5,a5
    800061c8:	fef42623          	sw	a5,-20(s0)
    800061cc:	fc843783          	ld	a5,-56(s0)
    800061d0:	47f8                	lw	a4,76(a5)
    800061d2:	fec42783          	lw	a5,-20(s0)
    800061d6:	fae7e8e3          	bltu	a5,a4,80006186 <dirlink+0x48>
    800061da:	a011                	j	800061de <dirlink+0xa0>
      break;
    800061dc:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    800061de:	fd040793          	addi	a5,s0,-48
    800061e2:	0789                	addi	a5,a5,2
    800061e4:	4639                	li	a2,14
    800061e6:	fc043583          	ld	a1,-64(s0)
    800061ea:	853e                	mv	a0,a5
    800061ec:	ffffb097          	auipc	ra,0xffffb
    800061f0:	5d2080e7          	jalr	1490(ra) # 800017be <strncpy>
  de.inum = inum;
    800061f4:	fbc42783          	lw	a5,-68(s0)
    800061f8:	17c2                	slli	a5,a5,0x30
    800061fa:	93c1                	srli	a5,a5,0x30
    800061fc:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80006200:	fd040793          	addi	a5,s0,-48
    80006204:	fec42683          	lw	a3,-20(s0)
    80006208:	4741                	li	a4,16
    8000620a:	863e                	mv	a2,a5
    8000620c:	4581                	li	a1,0
    8000620e:	fc843503          	ld	a0,-56(s0)
    80006212:	00000097          	auipc	ra,0x0
    80006216:	c62080e7          	jalr	-926(ra) # 80005e74 <writei>
    8000621a:	87aa                	mv	a5,a0
    8000621c:	873e                	mv	a4,a5
    8000621e:	47c1                	li	a5,16
    80006220:	00f70463          	beq	a4,a5,80006228 <dirlink+0xea>
    return -1;
    80006224:	57fd                	li	a5,-1
    80006226:	a011                	j	8000622a <dirlink+0xec>

  return 0;
    80006228:	4781                	li	a5,0
}
    8000622a:	853e                	mv	a0,a5
    8000622c:	60a6                	ld	ra,72(sp)
    8000622e:	6406                	ld	s0,64(sp)
    80006230:	6161                	addi	sp,sp,80
    80006232:	8082                	ret

0000000080006234 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80006234:	7179                	addi	sp,sp,-48
    80006236:	f406                	sd	ra,40(sp)
    80006238:	f022                	sd	s0,32(sp)
    8000623a:	1800                	addi	s0,sp,48
    8000623c:	fca43c23          	sd	a0,-40(s0)
    80006240:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80006244:	a031                	j	80006250 <skipelem+0x1c>
    path++;
    80006246:	fd843783          	ld	a5,-40(s0)
    8000624a:	0785                	addi	a5,a5,1
    8000624c:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80006250:	fd843783          	ld	a5,-40(s0)
    80006254:	0007c783          	lbu	a5,0(a5)
    80006258:	873e                	mv	a4,a5
    8000625a:	02f00793          	li	a5,47
    8000625e:	fef704e3          	beq	a4,a5,80006246 <skipelem+0x12>
  if(*path == 0)
    80006262:	fd843783          	ld	a5,-40(s0)
    80006266:	0007c783          	lbu	a5,0(a5)
    8000626a:	e399                	bnez	a5,80006270 <skipelem+0x3c>
    return 0;
    8000626c:	4781                	li	a5,0
    8000626e:	a06d                	j	80006318 <skipelem+0xe4>
  s = path;
    80006270:	fd843783          	ld	a5,-40(s0)
    80006274:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80006278:	a031                	j	80006284 <skipelem+0x50>
    path++;
    8000627a:	fd843783          	ld	a5,-40(s0)
    8000627e:	0785                	addi	a5,a5,1
    80006280:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80006284:	fd843783          	ld	a5,-40(s0)
    80006288:	0007c783          	lbu	a5,0(a5)
    8000628c:	873e                	mv	a4,a5
    8000628e:	02f00793          	li	a5,47
    80006292:	00f70763          	beq	a4,a5,800062a0 <skipelem+0x6c>
    80006296:	fd843783          	ld	a5,-40(s0)
    8000629a:	0007c783          	lbu	a5,0(a5)
    8000629e:	fff1                	bnez	a5,8000627a <skipelem+0x46>
  len = path - s;
    800062a0:	fd843703          	ld	a4,-40(s0)
    800062a4:	fe843783          	ld	a5,-24(s0)
    800062a8:	40f707b3          	sub	a5,a4,a5
    800062ac:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    800062b0:	fe442783          	lw	a5,-28(s0)
    800062b4:	0007871b          	sext.w	a4,a5
    800062b8:	47b5                	li	a5,13
    800062ba:	00e7dc63          	bge	a5,a4,800062d2 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    800062be:	4639                	li	a2,14
    800062c0:	fe843583          	ld	a1,-24(s0)
    800062c4:	fd043503          	ld	a0,-48(s0)
    800062c8:	ffffb097          	auipc	ra,0xffffb
    800062cc:	358080e7          	jalr	856(ra) # 80001620 <memmove>
    800062d0:	a80d                	j	80006302 <skipelem+0xce>
  else {
    memmove(name, s, len);
    800062d2:	fe442783          	lw	a5,-28(s0)
    800062d6:	863e                	mv	a2,a5
    800062d8:	fe843583          	ld	a1,-24(s0)
    800062dc:	fd043503          	ld	a0,-48(s0)
    800062e0:	ffffb097          	auipc	ra,0xffffb
    800062e4:	340080e7          	jalr	832(ra) # 80001620 <memmove>
    name[len] = 0;
    800062e8:	fe442783          	lw	a5,-28(s0)
    800062ec:	fd043703          	ld	a4,-48(s0)
    800062f0:	97ba                	add	a5,a5,a4
    800062f2:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    800062f6:	a031                	j	80006302 <skipelem+0xce>
    path++;
    800062f8:	fd843783          	ld	a5,-40(s0)
    800062fc:	0785                	addi	a5,a5,1
    800062fe:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80006302:	fd843783          	ld	a5,-40(s0)
    80006306:	0007c783          	lbu	a5,0(a5)
    8000630a:	873e                	mv	a4,a5
    8000630c:	02f00793          	li	a5,47
    80006310:	fef704e3          	beq	a4,a5,800062f8 <skipelem+0xc4>
  return path;
    80006314:	fd843783          	ld	a5,-40(s0)
}
    80006318:	853e                	mv	a0,a5
    8000631a:	70a2                	ld	ra,40(sp)
    8000631c:	7402                	ld	s0,32(sp)
    8000631e:	6145                	addi	sp,sp,48
    80006320:	8082                	ret

0000000080006322 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80006322:	7139                	addi	sp,sp,-64
    80006324:	fc06                	sd	ra,56(sp)
    80006326:	f822                	sd	s0,48(sp)
    80006328:	0080                	addi	s0,sp,64
    8000632a:	fca43c23          	sd	a0,-40(s0)
    8000632e:	87ae                	mv	a5,a1
    80006330:	fcc43423          	sd	a2,-56(s0)
    80006334:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80006338:	fd843783          	ld	a5,-40(s0)
    8000633c:	0007c783          	lbu	a5,0(a5)
    80006340:	873e                	mv	a4,a5
    80006342:	02f00793          	li	a5,47
    80006346:	00f71b63          	bne	a4,a5,8000635c <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    8000634a:	4585                	li	a1,1
    8000634c:	4505                	li	a0,1
    8000634e:	fffff097          	auipc	ra,0xfffff
    80006352:	270080e7          	jalr	624(ra) # 800055be <iget>
    80006356:	fea43423          	sd	a0,-24(s0)
    8000635a:	a84d                	j	8000640c <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    8000635c:	ffffd097          	auipc	ra,0xffffd
    80006360:	b2a080e7          	jalr	-1238(ra) # 80002e86 <myproc>
    80006364:	87aa                	mv	a5,a0
    80006366:	1507b783          	ld	a5,336(a5)
    8000636a:	853e                	mv	a0,a5
    8000636c:	fffff097          	auipc	ra,0xfffff
    80006370:	36e080e7          	jalr	878(ra) # 800056da <idup>
    80006374:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80006378:	a851                	j	8000640c <namex+0xea>
    ilock(ip);
    8000637a:	fe843503          	ld	a0,-24(s0)
    8000637e:	fffff097          	auipc	ra,0xfffff
    80006382:	3a8080e7          	jalr	936(ra) # 80005726 <ilock>
    if(ip->type != T_DIR){
    80006386:	fe843783          	ld	a5,-24(s0)
    8000638a:	04479783          	lh	a5,68(a5)
    8000638e:	0007871b          	sext.w	a4,a5
    80006392:	4785                	li	a5,1
    80006394:	00f70a63          	beq	a4,a5,800063a8 <namex+0x86>
      iunlockput(ip);
    80006398:	fe843503          	ld	a0,-24(s0)
    8000639c:	fffff097          	auipc	ra,0xfffff
    800063a0:	5e8080e7          	jalr	1512(ra) # 80005984 <iunlockput>
      return 0;
    800063a4:	4781                	li	a5,0
    800063a6:	a871                	j	80006442 <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    800063a8:	fd442783          	lw	a5,-44(s0)
    800063ac:	2781                	sext.w	a5,a5
    800063ae:	cf99                	beqz	a5,800063cc <namex+0xaa>
    800063b0:	fd843783          	ld	a5,-40(s0)
    800063b4:	0007c783          	lbu	a5,0(a5)
    800063b8:	eb91                	bnez	a5,800063cc <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    800063ba:	fe843503          	ld	a0,-24(s0)
    800063be:	fffff097          	auipc	ra,0xfffff
    800063c2:	49c080e7          	jalr	1180(ra) # 8000585a <iunlock>
      return ip;
    800063c6:	fe843783          	ld	a5,-24(s0)
    800063ca:	a8a5                	j	80006442 <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    800063cc:	4601                	li	a2,0
    800063ce:	fc843583          	ld	a1,-56(s0)
    800063d2:	fe843503          	ld	a0,-24(s0)
    800063d6:	00000097          	auipc	ra,0x0
    800063da:	c80080e7          	jalr	-896(ra) # 80006056 <dirlookup>
    800063de:	fea43023          	sd	a0,-32(s0)
    800063e2:	fe043783          	ld	a5,-32(s0)
    800063e6:	eb89                	bnez	a5,800063f8 <namex+0xd6>
      iunlockput(ip);
    800063e8:	fe843503          	ld	a0,-24(s0)
    800063ec:	fffff097          	auipc	ra,0xfffff
    800063f0:	598080e7          	jalr	1432(ra) # 80005984 <iunlockput>
      return 0;
    800063f4:	4781                	li	a5,0
    800063f6:	a0b1                	j	80006442 <namex+0x120>
    }
    iunlockput(ip);
    800063f8:	fe843503          	ld	a0,-24(s0)
    800063fc:	fffff097          	auipc	ra,0xfffff
    80006400:	588080e7          	jalr	1416(ra) # 80005984 <iunlockput>
    ip = next;
    80006404:	fe043783          	ld	a5,-32(s0)
    80006408:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    8000640c:	fc843583          	ld	a1,-56(s0)
    80006410:	fd843503          	ld	a0,-40(s0)
    80006414:	00000097          	auipc	ra,0x0
    80006418:	e20080e7          	jalr	-480(ra) # 80006234 <skipelem>
    8000641c:	fca43c23          	sd	a0,-40(s0)
    80006420:	fd843783          	ld	a5,-40(s0)
    80006424:	fbb9                	bnez	a5,8000637a <namex+0x58>
  }
  if(nameiparent){
    80006426:	fd442783          	lw	a5,-44(s0)
    8000642a:	2781                	sext.w	a5,a5
    8000642c:	cb89                	beqz	a5,8000643e <namex+0x11c>
    iput(ip);
    8000642e:	fe843503          	ld	a0,-24(s0)
    80006432:	fffff097          	auipc	ra,0xfffff
    80006436:	482080e7          	jalr	1154(ra) # 800058b4 <iput>
    return 0;
    8000643a:	4781                	li	a5,0
    8000643c:	a019                	j	80006442 <namex+0x120>
  }
  return ip;
    8000643e:	fe843783          	ld	a5,-24(s0)
}
    80006442:	853e                	mv	a0,a5
    80006444:	70e2                	ld	ra,56(sp)
    80006446:	7442                	ld	s0,48(sp)
    80006448:	6121                	addi	sp,sp,64
    8000644a:	8082                	ret

000000008000644c <namei>:

struct inode*
namei(char *path)
{
    8000644c:	7179                	addi	sp,sp,-48
    8000644e:	f406                	sd	ra,40(sp)
    80006450:	f022                	sd	s0,32(sp)
    80006452:	1800                	addi	s0,sp,48
    80006454:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80006458:	fe040793          	addi	a5,s0,-32
    8000645c:	863e                	mv	a2,a5
    8000645e:	4581                	li	a1,0
    80006460:	fd843503          	ld	a0,-40(s0)
    80006464:	00000097          	auipc	ra,0x0
    80006468:	ebe080e7          	jalr	-322(ra) # 80006322 <namex>
    8000646c:	87aa                	mv	a5,a0
}
    8000646e:	853e                	mv	a0,a5
    80006470:	70a2                	ld	ra,40(sp)
    80006472:	7402                	ld	s0,32(sp)
    80006474:	6145                	addi	sp,sp,48
    80006476:	8082                	ret

0000000080006478 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80006478:	1101                	addi	sp,sp,-32
    8000647a:	ec06                	sd	ra,24(sp)
    8000647c:	e822                	sd	s0,16(sp)
    8000647e:	1000                	addi	s0,sp,32
    80006480:	fea43423          	sd	a0,-24(s0)
    80006484:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80006488:	fe043603          	ld	a2,-32(s0)
    8000648c:	4585                	li	a1,1
    8000648e:	fe843503          	ld	a0,-24(s0)
    80006492:	00000097          	auipc	ra,0x0
    80006496:	e90080e7          	jalr	-368(ra) # 80006322 <namex>
    8000649a:	87aa                	mv	a5,a0
}
    8000649c:	853e                	mv	a0,a5
    8000649e:	60e2                	ld	ra,24(sp)
    800064a0:	6442                	ld	s0,16(sp)
    800064a2:	6105                	addi	sp,sp,32
    800064a4:	8082                	ret

00000000800064a6 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    800064a6:	1101                	addi	sp,sp,-32
    800064a8:	ec06                	sd	ra,24(sp)
    800064aa:	e822                	sd	s0,16(sp)
    800064ac:	1000                	addi	s0,sp,32
    800064ae:	87aa                	mv	a5,a0
    800064b0:	feb43023          	sd	a1,-32(s0)
    800064b4:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    800064b8:	00006597          	auipc	a1,0x6
    800064bc:	0a058593          	addi	a1,a1,160 # 8000c558 <etext+0x558>
    800064c0:	0004e517          	auipc	a0,0x4e
    800064c4:	6c850513          	addi	a0,a0,1736 # 80054b88 <log>
    800064c8:	ffffb097          	auipc	ra,0xffffb
    800064cc:	e70080e7          	jalr	-400(ra) # 80001338 <initlock>
  log.start = sb->logstart;
    800064d0:	fe043783          	ld	a5,-32(s0)
    800064d4:	4bdc                	lw	a5,20(a5)
    800064d6:	0007871b          	sext.w	a4,a5
    800064da:	0004e797          	auipc	a5,0x4e
    800064de:	6ae78793          	addi	a5,a5,1710 # 80054b88 <log>
    800064e2:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800064e4:	fe043783          	ld	a5,-32(s0)
    800064e8:	4b9c                	lw	a5,16(a5)
    800064ea:	0007871b          	sext.w	a4,a5
    800064ee:	0004e797          	auipc	a5,0x4e
    800064f2:	69a78793          	addi	a5,a5,1690 # 80054b88 <log>
    800064f6:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800064f8:	0004e797          	auipc	a5,0x4e
    800064fc:	69078793          	addi	a5,a5,1680 # 80054b88 <log>
    80006500:	fec42703          	lw	a4,-20(s0)
    80006504:	d798                	sw	a4,40(a5)
  recover_from_log();
    80006506:	00000097          	auipc	ra,0x0
    8000650a:	272080e7          	jalr	626(ra) # 80006778 <recover_from_log>
}
    8000650e:	0001                	nop
    80006510:	60e2                	ld	ra,24(sp)
    80006512:	6442                	ld	s0,16(sp)
    80006514:	6105                	addi	sp,sp,32
    80006516:	8082                	ret

0000000080006518 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    80006518:	7139                	addi	sp,sp,-64
    8000651a:	fc06                	sd	ra,56(sp)
    8000651c:	f822                	sd	s0,48(sp)
    8000651e:	0080                	addi	s0,sp,64
    80006520:	87aa                	mv	a5,a0
    80006522:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006526:	fe042623          	sw	zero,-20(s0)
    8000652a:	a0f9                	j	800065f8 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    8000652c:	0004e797          	auipc	a5,0x4e
    80006530:	65c78793          	addi	a5,a5,1628 # 80054b88 <log>
    80006534:	579c                	lw	a5,40(a5)
    80006536:	0007869b          	sext.w	a3,a5
    8000653a:	0004e797          	auipc	a5,0x4e
    8000653e:	64e78793          	addi	a5,a5,1614 # 80054b88 <log>
    80006542:	4f9c                	lw	a5,24(a5)
    80006544:	fec42703          	lw	a4,-20(s0)
    80006548:	9fb9                	addw	a5,a5,a4
    8000654a:	2781                	sext.w	a5,a5
    8000654c:	2785                	addiw	a5,a5,1
    8000654e:	2781                	sext.w	a5,a5
    80006550:	2781                	sext.w	a5,a5
    80006552:	85be                	mv	a1,a5
    80006554:	8536                	mv	a0,a3
    80006556:	ffffe097          	auipc	ra,0xffffe
    8000655a:	7dc080e7          	jalr	2012(ra) # 80004d32 <bread>
    8000655e:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80006562:	0004e797          	auipc	a5,0x4e
    80006566:	62678793          	addi	a5,a5,1574 # 80054b88 <log>
    8000656a:	579c                	lw	a5,40(a5)
    8000656c:	0007869b          	sext.w	a3,a5
    80006570:	0004e717          	auipc	a4,0x4e
    80006574:	61870713          	addi	a4,a4,1560 # 80054b88 <log>
    80006578:	fec42783          	lw	a5,-20(s0)
    8000657c:	07a1                	addi	a5,a5,8
    8000657e:	078a                	slli	a5,a5,0x2
    80006580:	97ba                	add	a5,a5,a4
    80006582:	4b9c                	lw	a5,16(a5)
    80006584:	2781                	sext.w	a5,a5
    80006586:	85be                	mv	a1,a5
    80006588:	8536                	mv	a0,a3
    8000658a:	ffffe097          	auipc	ra,0xffffe
    8000658e:	7a8080e7          	jalr	1960(ra) # 80004d32 <bread>
    80006592:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006596:	fd843783          	ld	a5,-40(s0)
    8000659a:	05878713          	addi	a4,a5,88
    8000659e:	fe043783          	ld	a5,-32(s0)
    800065a2:	05878793          	addi	a5,a5,88
    800065a6:	40000613          	li	a2,1024
    800065aa:	85be                	mv	a1,a5
    800065ac:	853a                	mv	a0,a4
    800065ae:	ffffb097          	auipc	ra,0xffffb
    800065b2:	072080e7          	jalr	114(ra) # 80001620 <memmove>
    bwrite(dbuf);  // write dst to disk
    800065b6:	fd843503          	ld	a0,-40(s0)
    800065ba:	ffffe097          	auipc	ra,0xffffe
    800065be:	7d6080e7          	jalr	2006(ra) # 80004d90 <bwrite>
    if(recovering == 0)
    800065c2:	fcc42783          	lw	a5,-52(s0)
    800065c6:	2781                	sext.w	a5,a5
    800065c8:	e799                	bnez	a5,800065d6 <install_trans+0xbe>
      bunpin(dbuf);
    800065ca:	fd843503          	ld	a0,-40(s0)
    800065ce:	fffff097          	auipc	ra,0xfffff
    800065d2:	944080e7          	jalr	-1724(ra) # 80004f12 <bunpin>
    brelse(lbuf);
    800065d6:	fe043503          	ld	a0,-32(s0)
    800065da:	fffff097          	auipc	ra,0xfffff
    800065de:	802080e7          	jalr	-2046(ra) # 80004ddc <brelse>
    brelse(dbuf);
    800065e2:	fd843503          	ld	a0,-40(s0)
    800065e6:	ffffe097          	auipc	ra,0xffffe
    800065ea:	7f6080e7          	jalr	2038(ra) # 80004ddc <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800065ee:	fec42783          	lw	a5,-20(s0)
    800065f2:	2785                	addiw	a5,a5,1
    800065f4:	fef42623          	sw	a5,-20(s0)
    800065f8:	0004e797          	auipc	a5,0x4e
    800065fc:	59078793          	addi	a5,a5,1424 # 80054b88 <log>
    80006600:	57d8                	lw	a4,44(a5)
    80006602:	fec42783          	lw	a5,-20(s0)
    80006606:	2781                	sext.w	a5,a5
    80006608:	f2e7c2e3          	blt	a5,a4,8000652c <install_trans+0x14>
  }
}
    8000660c:	0001                	nop
    8000660e:	0001                	nop
    80006610:	70e2                	ld	ra,56(sp)
    80006612:	7442                	ld	s0,48(sp)
    80006614:	6121                	addi	sp,sp,64
    80006616:	8082                	ret

0000000080006618 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    80006618:	7179                	addi	sp,sp,-48
    8000661a:	f406                	sd	ra,40(sp)
    8000661c:	f022                	sd	s0,32(sp)
    8000661e:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006620:	0004e797          	auipc	a5,0x4e
    80006624:	56878793          	addi	a5,a5,1384 # 80054b88 <log>
    80006628:	579c                	lw	a5,40(a5)
    8000662a:	0007871b          	sext.w	a4,a5
    8000662e:	0004e797          	auipc	a5,0x4e
    80006632:	55a78793          	addi	a5,a5,1370 # 80054b88 <log>
    80006636:	4f9c                	lw	a5,24(a5)
    80006638:	2781                	sext.w	a5,a5
    8000663a:	85be                	mv	a1,a5
    8000663c:	853a                	mv	a0,a4
    8000663e:	ffffe097          	auipc	ra,0xffffe
    80006642:	6f4080e7          	jalr	1780(ra) # 80004d32 <bread>
    80006646:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    8000664a:	fe043783          	ld	a5,-32(s0)
    8000664e:	05878793          	addi	a5,a5,88
    80006652:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006656:	fd843783          	ld	a5,-40(s0)
    8000665a:	4398                	lw	a4,0(a5)
    8000665c:	0004e797          	auipc	a5,0x4e
    80006660:	52c78793          	addi	a5,a5,1324 # 80054b88 <log>
    80006664:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006666:	fe042623          	sw	zero,-20(s0)
    8000666a:	a03d                	j	80006698 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    8000666c:	fd843703          	ld	a4,-40(s0)
    80006670:	fec42783          	lw	a5,-20(s0)
    80006674:	078a                	slli	a5,a5,0x2
    80006676:	97ba                	add	a5,a5,a4
    80006678:	43d8                	lw	a4,4(a5)
    8000667a:	0004e697          	auipc	a3,0x4e
    8000667e:	50e68693          	addi	a3,a3,1294 # 80054b88 <log>
    80006682:	fec42783          	lw	a5,-20(s0)
    80006686:	07a1                	addi	a5,a5,8
    80006688:	078a                	slli	a5,a5,0x2
    8000668a:	97b6                	add	a5,a5,a3
    8000668c:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000668e:	fec42783          	lw	a5,-20(s0)
    80006692:	2785                	addiw	a5,a5,1
    80006694:	fef42623          	sw	a5,-20(s0)
    80006698:	0004e797          	auipc	a5,0x4e
    8000669c:	4f078793          	addi	a5,a5,1264 # 80054b88 <log>
    800066a0:	57d8                	lw	a4,44(a5)
    800066a2:	fec42783          	lw	a5,-20(s0)
    800066a6:	2781                	sext.w	a5,a5
    800066a8:	fce7c2e3          	blt	a5,a4,8000666c <read_head+0x54>
  }
  brelse(buf);
    800066ac:	fe043503          	ld	a0,-32(s0)
    800066b0:	ffffe097          	auipc	ra,0xffffe
    800066b4:	72c080e7          	jalr	1836(ra) # 80004ddc <brelse>
}
    800066b8:	0001                	nop
    800066ba:	70a2                	ld	ra,40(sp)
    800066bc:	7402                	ld	s0,32(sp)
    800066be:	6145                	addi	sp,sp,48
    800066c0:	8082                	ret

00000000800066c2 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    800066c2:	7179                	addi	sp,sp,-48
    800066c4:	f406                	sd	ra,40(sp)
    800066c6:	f022                	sd	s0,32(sp)
    800066c8:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800066ca:	0004e797          	auipc	a5,0x4e
    800066ce:	4be78793          	addi	a5,a5,1214 # 80054b88 <log>
    800066d2:	579c                	lw	a5,40(a5)
    800066d4:	0007871b          	sext.w	a4,a5
    800066d8:	0004e797          	auipc	a5,0x4e
    800066dc:	4b078793          	addi	a5,a5,1200 # 80054b88 <log>
    800066e0:	4f9c                	lw	a5,24(a5)
    800066e2:	2781                	sext.w	a5,a5
    800066e4:	85be                	mv	a1,a5
    800066e6:	853a                	mv	a0,a4
    800066e8:	ffffe097          	auipc	ra,0xffffe
    800066ec:	64a080e7          	jalr	1610(ra) # 80004d32 <bread>
    800066f0:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800066f4:	fe043783          	ld	a5,-32(s0)
    800066f8:	05878793          	addi	a5,a5,88
    800066fc:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    80006700:	0004e797          	auipc	a5,0x4e
    80006704:	48878793          	addi	a5,a5,1160 # 80054b88 <log>
    80006708:	57d8                	lw	a4,44(a5)
    8000670a:	fd843783          	ld	a5,-40(s0)
    8000670e:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006710:	fe042623          	sw	zero,-20(s0)
    80006714:	a03d                	j	80006742 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006716:	0004e717          	auipc	a4,0x4e
    8000671a:	47270713          	addi	a4,a4,1138 # 80054b88 <log>
    8000671e:	fec42783          	lw	a5,-20(s0)
    80006722:	07a1                	addi	a5,a5,8
    80006724:	078a                	slli	a5,a5,0x2
    80006726:	97ba                	add	a5,a5,a4
    80006728:	4b98                	lw	a4,16(a5)
    8000672a:	fd843683          	ld	a3,-40(s0)
    8000672e:	fec42783          	lw	a5,-20(s0)
    80006732:	078a                	slli	a5,a5,0x2
    80006734:	97b6                	add	a5,a5,a3
    80006736:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006738:	fec42783          	lw	a5,-20(s0)
    8000673c:	2785                	addiw	a5,a5,1
    8000673e:	fef42623          	sw	a5,-20(s0)
    80006742:	0004e797          	auipc	a5,0x4e
    80006746:	44678793          	addi	a5,a5,1094 # 80054b88 <log>
    8000674a:	57d8                	lw	a4,44(a5)
    8000674c:	fec42783          	lw	a5,-20(s0)
    80006750:	2781                	sext.w	a5,a5
    80006752:	fce7c2e3          	blt	a5,a4,80006716 <write_head+0x54>
  }
  bwrite(buf);
    80006756:	fe043503          	ld	a0,-32(s0)
    8000675a:	ffffe097          	auipc	ra,0xffffe
    8000675e:	636080e7          	jalr	1590(ra) # 80004d90 <bwrite>
  brelse(buf);
    80006762:	fe043503          	ld	a0,-32(s0)
    80006766:	ffffe097          	auipc	ra,0xffffe
    8000676a:	676080e7          	jalr	1654(ra) # 80004ddc <brelse>
}
    8000676e:	0001                	nop
    80006770:	70a2                	ld	ra,40(sp)
    80006772:	7402                	ld	s0,32(sp)
    80006774:	6145                	addi	sp,sp,48
    80006776:	8082                	ret

0000000080006778 <recover_from_log>:

static void
recover_from_log(void)
{
    80006778:	1141                	addi	sp,sp,-16
    8000677a:	e406                	sd	ra,8(sp)
    8000677c:	e022                	sd	s0,0(sp)
    8000677e:	0800                	addi	s0,sp,16
  read_head();
    80006780:	00000097          	auipc	ra,0x0
    80006784:	e98080e7          	jalr	-360(ra) # 80006618 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006788:	4505                	li	a0,1
    8000678a:	00000097          	auipc	ra,0x0
    8000678e:	d8e080e7          	jalr	-626(ra) # 80006518 <install_trans>
  log.lh.n = 0;
    80006792:	0004e797          	auipc	a5,0x4e
    80006796:	3f678793          	addi	a5,a5,1014 # 80054b88 <log>
    8000679a:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    8000679e:	00000097          	auipc	ra,0x0
    800067a2:	f24080e7          	jalr	-220(ra) # 800066c2 <write_head>
}
    800067a6:	0001                	nop
    800067a8:	60a2                	ld	ra,8(sp)
    800067aa:	6402                	ld	s0,0(sp)
    800067ac:	0141                	addi	sp,sp,16
    800067ae:	8082                	ret

00000000800067b0 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800067b0:	1141                	addi	sp,sp,-16
    800067b2:	e406                	sd	ra,8(sp)
    800067b4:	e022                	sd	s0,0(sp)
    800067b6:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800067b8:	0004e517          	auipc	a0,0x4e
    800067bc:	3d050513          	addi	a0,a0,976 # 80054b88 <log>
    800067c0:	ffffb097          	auipc	ra,0xffffb
    800067c4:	ba8080e7          	jalr	-1112(ra) # 80001368 <acquire>
  while(1){
    if(log.committing){
    800067c8:	0004e797          	auipc	a5,0x4e
    800067cc:	3c078793          	addi	a5,a5,960 # 80054b88 <log>
    800067d0:	53dc                	lw	a5,36(a5)
    800067d2:	cf91                	beqz	a5,800067ee <begin_op+0x3e>
      sleep(&log, &log.lock);
    800067d4:	0004e597          	auipc	a1,0x4e
    800067d8:	3b458593          	addi	a1,a1,948 # 80054b88 <log>
    800067dc:	0004e517          	auipc	a0,0x4e
    800067e0:	3ac50513          	addi	a0,a0,940 # 80054b88 <log>
    800067e4:	ffffd097          	auipc	ra,0xffffd
    800067e8:	264080e7          	jalr	612(ra) # 80003a48 <sleep>
    800067ec:	bff1                	j	800067c8 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800067ee:	0004e797          	auipc	a5,0x4e
    800067f2:	39a78793          	addi	a5,a5,922 # 80054b88 <log>
    800067f6:	57d8                	lw	a4,44(a5)
    800067f8:	0004e797          	auipc	a5,0x4e
    800067fc:	39078793          	addi	a5,a5,912 # 80054b88 <log>
    80006800:	539c                	lw	a5,32(a5)
    80006802:	2785                	addiw	a5,a5,1
    80006804:	2781                	sext.w	a5,a5
    80006806:	86be                	mv	a3,a5
    80006808:	87b6                	mv	a5,a3
    8000680a:	0027979b          	slliw	a5,a5,0x2
    8000680e:	9fb5                	addw	a5,a5,a3
    80006810:	0017979b          	slliw	a5,a5,0x1
    80006814:	2781                	sext.w	a5,a5
    80006816:	9fb9                	addw	a5,a5,a4
    80006818:	2781                	sext.w	a5,a5
    8000681a:	873e                	mv	a4,a5
    8000681c:	47f9                	li	a5,30
    8000681e:	00e7df63          	bge	a5,a4,8000683c <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    80006822:	0004e597          	auipc	a1,0x4e
    80006826:	36658593          	addi	a1,a1,870 # 80054b88 <log>
    8000682a:	0004e517          	auipc	a0,0x4e
    8000682e:	35e50513          	addi	a0,a0,862 # 80054b88 <log>
    80006832:	ffffd097          	auipc	ra,0xffffd
    80006836:	216080e7          	jalr	534(ra) # 80003a48 <sleep>
    8000683a:	b779                	j	800067c8 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    8000683c:	0004e797          	auipc	a5,0x4e
    80006840:	34c78793          	addi	a5,a5,844 # 80054b88 <log>
    80006844:	539c                	lw	a5,32(a5)
    80006846:	2785                	addiw	a5,a5,1
    80006848:	0007871b          	sext.w	a4,a5
    8000684c:	0004e797          	auipc	a5,0x4e
    80006850:	33c78793          	addi	a5,a5,828 # 80054b88 <log>
    80006854:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006856:	0004e517          	auipc	a0,0x4e
    8000685a:	33250513          	addi	a0,a0,818 # 80054b88 <log>
    8000685e:	ffffb097          	auipc	ra,0xffffb
    80006862:	b6e080e7          	jalr	-1170(ra) # 800013cc <release>
      break;
    80006866:	0001                	nop
    }
  }
}
    80006868:	0001                	nop
    8000686a:	60a2                	ld	ra,8(sp)
    8000686c:	6402                	ld	s0,0(sp)
    8000686e:	0141                	addi	sp,sp,16
    80006870:	8082                	ret

0000000080006872 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80006872:	1101                	addi	sp,sp,-32
    80006874:	ec06                	sd	ra,24(sp)
    80006876:	e822                	sd	s0,16(sp)
    80006878:	1000                	addi	s0,sp,32
  int do_commit = 0;
    8000687a:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    8000687e:	0004e517          	auipc	a0,0x4e
    80006882:	30a50513          	addi	a0,a0,778 # 80054b88 <log>
    80006886:	ffffb097          	auipc	ra,0xffffb
    8000688a:	ae2080e7          	jalr	-1310(ra) # 80001368 <acquire>
  log.outstanding -= 1;
    8000688e:	0004e797          	auipc	a5,0x4e
    80006892:	2fa78793          	addi	a5,a5,762 # 80054b88 <log>
    80006896:	539c                	lw	a5,32(a5)
    80006898:	37fd                	addiw	a5,a5,-1
    8000689a:	0007871b          	sext.w	a4,a5
    8000689e:	0004e797          	auipc	a5,0x4e
    800068a2:	2ea78793          	addi	a5,a5,746 # 80054b88 <log>
    800068a6:	d398                	sw	a4,32(a5)
  if(log.committing)
    800068a8:	0004e797          	auipc	a5,0x4e
    800068ac:	2e078793          	addi	a5,a5,736 # 80054b88 <log>
    800068b0:	53dc                	lw	a5,36(a5)
    800068b2:	cb89                	beqz	a5,800068c4 <end_op+0x52>
    panic("log.committing");
    800068b4:	00006517          	auipc	a0,0x6
    800068b8:	cac50513          	addi	a0,a0,-852 # 8000c560 <etext+0x560>
    800068bc:	ffffa097          	auipc	ra,0xffffa
    800068c0:	3d0080e7          	jalr	976(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    800068c4:	0004e797          	auipc	a5,0x4e
    800068c8:	2c478793          	addi	a5,a5,708 # 80054b88 <log>
    800068cc:	539c                	lw	a5,32(a5)
    800068ce:	eb99                	bnez	a5,800068e4 <end_op+0x72>
    do_commit = 1;
    800068d0:	4785                	li	a5,1
    800068d2:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800068d6:	0004e797          	auipc	a5,0x4e
    800068da:	2b278793          	addi	a5,a5,690 # 80054b88 <log>
    800068de:	4705                	li	a4,1
    800068e0:	d3d8                	sw	a4,36(a5)
    800068e2:	a809                	j	800068f4 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800068e4:	0004e517          	auipc	a0,0x4e
    800068e8:	2a450513          	addi	a0,a0,676 # 80054b88 <log>
    800068ec:	ffffd097          	auipc	ra,0xffffd
    800068f0:	1d8080e7          	jalr	472(ra) # 80003ac4 <wakeup>
  }
  release(&log.lock);
    800068f4:	0004e517          	auipc	a0,0x4e
    800068f8:	29450513          	addi	a0,a0,660 # 80054b88 <log>
    800068fc:	ffffb097          	auipc	ra,0xffffb
    80006900:	ad0080e7          	jalr	-1328(ra) # 800013cc <release>

  if(do_commit){
    80006904:	fec42783          	lw	a5,-20(s0)
    80006908:	2781                	sext.w	a5,a5
    8000690a:	c3b9                	beqz	a5,80006950 <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    8000690c:	00000097          	auipc	ra,0x0
    80006910:	134080e7          	jalr	308(ra) # 80006a40 <commit>
    acquire(&log.lock);
    80006914:	0004e517          	auipc	a0,0x4e
    80006918:	27450513          	addi	a0,a0,628 # 80054b88 <log>
    8000691c:	ffffb097          	auipc	ra,0xffffb
    80006920:	a4c080e7          	jalr	-1460(ra) # 80001368 <acquire>
    log.committing = 0;
    80006924:	0004e797          	auipc	a5,0x4e
    80006928:	26478793          	addi	a5,a5,612 # 80054b88 <log>
    8000692c:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    80006930:	0004e517          	auipc	a0,0x4e
    80006934:	25850513          	addi	a0,a0,600 # 80054b88 <log>
    80006938:	ffffd097          	auipc	ra,0xffffd
    8000693c:	18c080e7          	jalr	396(ra) # 80003ac4 <wakeup>
    release(&log.lock);
    80006940:	0004e517          	auipc	a0,0x4e
    80006944:	24850513          	addi	a0,a0,584 # 80054b88 <log>
    80006948:	ffffb097          	auipc	ra,0xffffb
    8000694c:	a84080e7          	jalr	-1404(ra) # 800013cc <release>
  }
}
    80006950:	0001                	nop
    80006952:	60e2                	ld	ra,24(sp)
    80006954:	6442                	ld	s0,16(sp)
    80006956:	6105                	addi	sp,sp,32
    80006958:	8082                	ret

000000008000695a <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    8000695a:	7179                	addi	sp,sp,-48
    8000695c:	f406                	sd	ra,40(sp)
    8000695e:	f022                	sd	s0,32(sp)
    80006960:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006962:	fe042623          	sw	zero,-20(s0)
    80006966:	a86d                	j	80006a20 <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006968:	0004e797          	auipc	a5,0x4e
    8000696c:	22078793          	addi	a5,a5,544 # 80054b88 <log>
    80006970:	579c                	lw	a5,40(a5)
    80006972:	0007869b          	sext.w	a3,a5
    80006976:	0004e797          	auipc	a5,0x4e
    8000697a:	21278793          	addi	a5,a5,530 # 80054b88 <log>
    8000697e:	4f9c                	lw	a5,24(a5)
    80006980:	fec42703          	lw	a4,-20(s0)
    80006984:	9fb9                	addw	a5,a5,a4
    80006986:	2781                	sext.w	a5,a5
    80006988:	2785                	addiw	a5,a5,1
    8000698a:	2781                	sext.w	a5,a5
    8000698c:	2781                	sext.w	a5,a5
    8000698e:	85be                	mv	a1,a5
    80006990:	8536                	mv	a0,a3
    80006992:	ffffe097          	auipc	ra,0xffffe
    80006996:	3a0080e7          	jalr	928(ra) # 80004d32 <bread>
    8000699a:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    8000699e:	0004e797          	auipc	a5,0x4e
    800069a2:	1ea78793          	addi	a5,a5,490 # 80054b88 <log>
    800069a6:	579c                	lw	a5,40(a5)
    800069a8:	0007869b          	sext.w	a3,a5
    800069ac:	0004e717          	auipc	a4,0x4e
    800069b0:	1dc70713          	addi	a4,a4,476 # 80054b88 <log>
    800069b4:	fec42783          	lw	a5,-20(s0)
    800069b8:	07a1                	addi	a5,a5,8
    800069ba:	078a                	slli	a5,a5,0x2
    800069bc:	97ba                	add	a5,a5,a4
    800069be:	4b9c                	lw	a5,16(a5)
    800069c0:	2781                	sext.w	a5,a5
    800069c2:	85be                	mv	a1,a5
    800069c4:	8536                	mv	a0,a3
    800069c6:	ffffe097          	auipc	ra,0xffffe
    800069ca:	36c080e7          	jalr	876(ra) # 80004d32 <bread>
    800069ce:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800069d2:	fe043783          	ld	a5,-32(s0)
    800069d6:	05878713          	addi	a4,a5,88
    800069da:	fd843783          	ld	a5,-40(s0)
    800069de:	05878793          	addi	a5,a5,88
    800069e2:	40000613          	li	a2,1024
    800069e6:	85be                	mv	a1,a5
    800069e8:	853a                	mv	a0,a4
    800069ea:	ffffb097          	auipc	ra,0xffffb
    800069ee:	c36080e7          	jalr	-970(ra) # 80001620 <memmove>
    bwrite(to);  // write the log
    800069f2:	fe043503          	ld	a0,-32(s0)
    800069f6:	ffffe097          	auipc	ra,0xffffe
    800069fa:	39a080e7          	jalr	922(ra) # 80004d90 <bwrite>
    brelse(from);
    800069fe:	fd843503          	ld	a0,-40(s0)
    80006a02:	ffffe097          	auipc	ra,0xffffe
    80006a06:	3da080e7          	jalr	986(ra) # 80004ddc <brelse>
    brelse(to);
    80006a0a:	fe043503          	ld	a0,-32(s0)
    80006a0e:	ffffe097          	auipc	ra,0xffffe
    80006a12:	3ce080e7          	jalr	974(ra) # 80004ddc <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006a16:	fec42783          	lw	a5,-20(s0)
    80006a1a:	2785                	addiw	a5,a5,1
    80006a1c:	fef42623          	sw	a5,-20(s0)
    80006a20:	0004e797          	auipc	a5,0x4e
    80006a24:	16878793          	addi	a5,a5,360 # 80054b88 <log>
    80006a28:	57d8                	lw	a4,44(a5)
    80006a2a:	fec42783          	lw	a5,-20(s0)
    80006a2e:	2781                	sext.w	a5,a5
    80006a30:	f2e7cce3          	blt	a5,a4,80006968 <write_log+0xe>
  }
}
    80006a34:	0001                	nop
    80006a36:	0001                	nop
    80006a38:	70a2                	ld	ra,40(sp)
    80006a3a:	7402                	ld	s0,32(sp)
    80006a3c:	6145                	addi	sp,sp,48
    80006a3e:	8082                	ret

0000000080006a40 <commit>:

static void
commit()
{
    80006a40:	1141                	addi	sp,sp,-16
    80006a42:	e406                	sd	ra,8(sp)
    80006a44:	e022                	sd	s0,0(sp)
    80006a46:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006a48:	0004e797          	auipc	a5,0x4e
    80006a4c:	14078793          	addi	a5,a5,320 # 80054b88 <log>
    80006a50:	57dc                	lw	a5,44(a5)
    80006a52:	02f05963          	blez	a5,80006a84 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006a56:	00000097          	auipc	ra,0x0
    80006a5a:	f04080e7          	jalr	-252(ra) # 8000695a <write_log>
    write_head();    // Write header to disk -- the real commit
    80006a5e:	00000097          	auipc	ra,0x0
    80006a62:	c64080e7          	jalr	-924(ra) # 800066c2 <write_head>
    install_trans(0); // Now install writes to home locations
    80006a66:	4501                	li	a0,0
    80006a68:	00000097          	auipc	ra,0x0
    80006a6c:	ab0080e7          	jalr	-1360(ra) # 80006518 <install_trans>
    log.lh.n = 0;
    80006a70:	0004e797          	auipc	a5,0x4e
    80006a74:	11878793          	addi	a5,a5,280 # 80054b88 <log>
    80006a78:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006a7c:	00000097          	auipc	ra,0x0
    80006a80:	c46080e7          	jalr	-954(ra) # 800066c2 <write_head>
  }
}
    80006a84:	0001                	nop
    80006a86:	60a2                	ld	ra,8(sp)
    80006a88:	6402                	ld	s0,0(sp)
    80006a8a:	0141                	addi	sp,sp,16
    80006a8c:	8082                	ret

0000000080006a8e <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006a8e:	7179                	addi	sp,sp,-48
    80006a90:	f406                	sd	ra,40(sp)
    80006a92:	f022                	sd	s0,32(sp)
    80006a94:	1800                	addi	s0,sp,48
    80006a96:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006a9a:	0004e517          	auipc	a0,0x4e
    80006a9e:	0ee50513          	addi	a0,a0,238 # 80054b88 <log>
    80006aa2:	ffffb097          	auipc	ra,0xffffb
    80006aa6:	8c6080e7          	jalr	-1850(ra) # 80001368 <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006aaa:	0004e797          	auipc	a5,0x4e
    80006aae:	0de78793          	addi	a5,a5,222 # 80054b88 <log>
    80006ab2:	57dc                	lw	a5,44(a5)
    80006ab4:	873e                	mv	a4,a5
    80006ab6:	47f5                	li	a5,29
    80006ab8:	02e7c063          	blt	a5,a4,80006ad8 <log_write+0x4a>
    80006abc:	0004e797          	auipc	a5,0x4e
    80006ac0:	0cc78793          	addi	a5,a5,204 # 80054b88 <log>
    80006ac4:	57d8                	lw	a4,44(a5)
    80006ac6:	0004e797          	auipc	a5,0x4e
    80006aca:	0c278793          	addi	a5,a5,194 # 80054b88 <log>
    80006ace:	4fdc                	lw	a5,28(a5)
    80006ad0:	37fd                	addiw	a5,a5,-1
    80006ad2:	2781                	sext.w	a5,a5
    80006ad4:	00f74a63          	blt	a4,a5,80006ae8 <log_write+0x5a>
    panic("too big a transaction");
    80006ad8:	00006517          	auipc	a0,0x6
    80006adc:	a9850513          	addi	a0,a0,-1384 # 8000c570 <etext+0x570>
    80006ae0:	ffffa097          	auipc	ra,0xffffa
    80006ae4:	1ac080e7          	jalr	428(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    80006ae8:	0004e797          	auipc	a5,0x4e
    80006aec:	0a078793          	addi	a5,a5,160 # 80054b88 <log>
    80006af0:	539c                	lw	a5,32(a5)
    80006af2:	00f04a63          	bgtz	a5,80006b06 <log_write+0x78>
    panic("log_write outside of trans");
    80006af6:	00006517          	auipc	a0,0x6
    80006afa:	a9250513          	addi	a0,a0,-1390 # 8000c588 <etext+0x588>
    80006afe:	ffffa097          	auipc	ra,0xffffa
    80006b02:	18e080e7          	jalr	398(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006b06:	fe042623          	sw	zero,-20(s0)
    80006b0a:	a03d                	j	80006b38 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006b0c:	0004e717          	auipc	a4,0x4e
    80006b10:	07c70713          	addi	a4,a4,124 # 80054b88 <log>
    80006b14:	fec42783          	lw	a5,-20(s0)
    80006b18:	07a1                	addi	a5,a5,8
    80006b1a:	078a                	slli	a5,a5,0x2
    80006b1c:	97ba                	add	a5,a5,a4
    80006b1e:	4b9c                	lw	a5,16(a5)
    80006b20:	0007871b          	sext.w	a4,a5
    80006b24:	fd843783          	ld	a5,-40(s0)
    80006b28:	47dc                	lw	a5,12(a5)
    80006b2a:	02f70263          	beq	a4,a5,80006b4e <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    80006b2e:	fec42783          	lw	a5,-20(s0)
    80006b32:	2785                	addiw	a5,a5,1
    80006b34:	fef42623          	sw	a5,-20(s0)
    80006b38:	0004e797          	auipc	a5,0x4e
    80006b3c:	05078793          	addi	a5,a5,80 # 80054b88 <log>
    80006b40:	57d8                	lw	a4,44(a5)
    80006b42:	fec42783          	lw	a5,-20(s0)
    80006b46:	2781                	sext.w	a5,a5
    80006b48:	fce7c2e3          	blt	a5,a4,80006b0c <log_write+0x7e>
    80006b4c:	a011                	j	80006b50 <log_write+0xc2>
      break;
    80006b4e:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80006b50:	fd843783          	ld	a5,-40(s0)
    80006b54:	47dc                	lw	a5,12(a5)
    80006b56:	0007871b          	sext.w	a4,a5
    80006b5a:	0004e697          	auipc	a3,0x4e
    80006b5e:	02e68693          	addi	a3,a3,46 # 80054b88 <log>
    80006b62:	fec42783          	lw	a5,-20(s0)
    80006b66:	07a1                	addi	a5,a5,8
    80006b68:	078a                	slli	a5,a5,0x2
    80006b6a:	97b6                	add	a5,a5,a3
    80006b6c:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006b6e:	0004e797          	auipc	a5,0x4e
    80006b72:	01a78793          	addi	a5,a5,26 # 80054b88 <log>
    80006b76:	57d8                	lw	a4,44(a5)
    80006b78:	fec42783          	lw	a5,-20(s0)
    80006b7c:	2781                	sext.w	a5,a5
    80006b7e:	02e79563          	bne	a5,a4,80006ba8 <log_write+0x11a>
    bpin(b);
    80006b82:	fd843503          	ld	a0,-40(s0)
    80006b86:	ffffe097          	auipc	ra,0xffffe
    80006b8a:	344080e7          	jalr	836(ra) # 80004eca <bpin>
    log.lh.n++;
    80006b8e:	0004e797          	auipc	a5,0x4e
    80006b92:	ffa78793          	addi	a5,a5,-6 # 80054b88 <log>
    80006b96:	57dc                	lw	a5,44(a5)
    80006b98:	2785                	addiw	a5,a5,1
    80006b9a:	0007871b          	sext.w	a4,a5
    80006b9e:	0004e797          	auipc	a5,0x4e
    80006ba2:	fea78793          	addi	a5,a5,-22 # 80054b88 <log>
    80006ba6:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006ba8:	0004e517          	auipc	a0,0x4e
    80006bac:	fe050513          	addi	a0,a0,-32 # 80054b88 <log>
    80006bb0:	ffffb097          	auipc	ra,0xffffb
    80006bb4:	81c080e7          	jalr	-2020(ra) # 800013cc <release>
}
    80006bb8:	0001                	nop
    80006bba:	70a2                	ld	ra,40(sp)
    80006bbc:	7402                	ld	s0,32(sp)
    80006bbe:	6145                	addi	sp,sp,48
    80006bc0:	8082                	ret

0000000080006bc2 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80006bc2:	1101                	addi	sp,sp,-32
    80006bc4:	ec06                	sd	ra,24(sp)
    80006bc6:	e822                	sd	s0,16(sp)
    80006bc8:	1000                	addi	s0,sp,32
    80006bca:	fea43423          	sd	a0,-24(s0)
    80006bce:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    80006bd2:	fe843783          	ld	a5,-24(s0)
    80006bd6:	07a1                	addi	a5,a5,8
    80006bd8:	00006597          	auipc	a1,0x6
    80006bdc:	9d058593          	addi	a1,a1,-1584 # 8000c5a8 <etext+0x5a8>
    80006be0:	853e                	mv	a0,a5
    80006be2:	ffffa097          	auipc	ra,0xffffa
    80006be6:	756080e7          	jalr	1878(ra) # 80001338 <initlock>
  lk->name = name;
    80006bea:	fe843783          	ld	a5,-24(s0)
    80006bee:	fe043703          	ld	a4,-32(s0)
    80006bf2:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006bf4:	fe843783          	ld	a5,-24(s0)
    80006bf8:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006bfc:	fe843783          	ld	a5,-24(s0)
    80006c00:	0207a423          	sw	zero,40(a5)
}
    80006c04:	0001                	nop
    80006c06:	60e2                	ld	ra,24(sp)
    80006c08:	6442                	ld	s0,16(sp)
    80006c0a:	6105                	addi	sp,sp,32
    80006c0c:	8082                	ret

0000000080006c0e <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80006c0e:	1101                	addi	sp,sp,-32
    80006c10:	ec06                	sd	ra,24(sp)
    80006c12:	e822                	sd	s0,16(sp)
    80006c14:	1000                	addi	s0,sp,32
    80006c16:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006c1a:	fe843783          	ld	a5,-24(s0)
    80006c1e:	07a1                	addi	a5,a5,8
    80006c20:	853e                	mv	a0,a5
    80006c22:	ffffa097          	auipc	ra,0xffffa
    80006c26:	746080e7          	jalr	1862(ra) # 80001368 <acquire>
  while (lk->locked) {
    80006c2a:	a819                	j	80006c40 <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006c2c:	fe843783          	ld	a5,-24(s0)
    80006c30:	07a1                	addi	a5,a5,8
    80006c32:	85be                	mv	a1,a5
    80006c34:	fe843503          	ld	a0,-24(s0)
    80006c38:	ffffd097          	auipc	ra,0xffffd
    80006c3c:	e10080e7          	jalr	-496(ra) # 80003a48 <sleep>
  while (lk->locked) {
    80006c40:	fe843783          	ld	a5,-24(s0)
    80006c44:	439c                	lw	a5,0(a5)
    80006c46:	f3fd                	bnez	a5,80006c2c <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006c48:	fe843783          	ld	a5,-24(s0)
    80006c4c:	4705                	li	a4,1
    80006c4e:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80006c50:	ffffc097          	auipc	ra,0xffffc
    80006c54:	236080e7          	jalr	566(ra) # 80002e86 <myproc>
    80006c58:	87aa                	mv	a5,a0
    80006c5a:	5b98                	lw	a4,48(a5)
    80006c5c:	fe843783          	ld	a5,-24(s0)
    80006c60:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006c62:	fe843783          	ld	a5,-24(s0)
    80006c66:	07a1                	addi	a5,a5,8
    80006c68:	853e                	mv	a0,a5
    80006c6a:	ffffa097          	auipc	ra,0xffffa
    80006c6e:	762080e7          	jalr	1890(ra) # 800013cc <release>
}
    80006c72:	0001                	nop
    80006c74:	60e2                	ld	ra,24(sp)
    80006c76:	6442                	ld	s0,16(sp)
    80006c78:	6105                	addi	sp,sp,32
    80006c7a:	8082                	ret

0000000080006c7c <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006c7c:	1101                	addi	sp,sp,-32
    80006c7e:	ec06                	sd	ra,24(sp)
    80006c80:	e822                	sd	s0,16(sp)
    80006c82:	1000                	addi	s0,sp,32
    80006c84:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006c88:	fe843783          	ld	a5,-24(s0)
    80006c8c:	07a1                	addi	a5,a5,8
    80006c8e:	853e                	mv	a0,a5
    80006c90:	ffffa097          	auipc	ra,0xffffa
    80006c94:	6d8080e7          	jalr	1752(ra) # 80001368 <acquire>
  lk->locked = 0;
    80006c98:	fe843783          	ld	a5,-24(s0)
    80006c9c:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006ca0:	fe843783          	ld	a5,-24(s0)
    80006ca4:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006ca8:	fe843503          	ld	a0,-24(s0)
    80006cac:	ffffd097          	auipc	ra,0xffffd
    80006cb0:	e18080e7          	jalr	-488(ra) # 80003ac4 <wakeup>
  release(&lk->lk);
    80006cb4:	fe843783          	ld	a5,-24(s0)
    80006cb8:	07a1                	addi	a5,a5,8
    80006cba:	853e                	mv	a0,a5
    80006cbc:	ffffa097          	auipc	ra,0xffffa
    80006cc0:	710080e7          	jalr	1808(ra) # 800013cc <release>
}
    80006cc4:	0001                	nop
    80006cc6:	60e2                	ld	ra,24(sp)
    80006cc8:	6442                	ld	s0,16(sp)
    80006cca:	6105                	addi	sp,sp,32
    80006ccc:	8082                	ret

0000000080006cce <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006cce:	7139                	addi	sp,sp,-64
    80006cd0:	fc06                	sd	ra,56(sp)
    80006cd2:	f822                	sd	s0,48(sp)
    80006cd4:	f426                	sd	s1,40(sp)
    80006cd6:	0080                	addi	s0,sp,64
    80006cd8:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006cdc:	fc843783          	ld	a5,-56(s0)
    80006ce0:	07a1                	addi	a5,a5,8
    80006ce2:	853e                	mv	a0,a5
    80006ce4:	ffffa097          	auipc	ra,0xffffa
    80006ce8:	684080e7          	jalr	1668(ra) # 80001368 <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006cec:	fc843783          	ld	a5,-56(s0)
    80006cf0:	439c                	lw	a5,0(a5)
    80006cf2:	cf99                	beqz	a5,80006d10 <holdingsleep+0x42>
    80006cf4:	fc843783          	ld	a5,-56(s0)
    80006cf8:	5784                	lw	s1,40(a5)
    80006cfa:	ffffc097          	auipc	ra,0xffffc
    80006cfe:	18c080e7          	jalr	396(ra) # 80002e86 <myproc>
    80006d02:	87aa                	mv	a5,a0
    80006d04:	5b9c                	lw	a5,48(a5)
    80006d06:	8726                	mv	a4,s1
    80006d08:	00f71463          	bne	a4,a5,80006d10 <holdingsleep+0x42>
    80006d0c:	4785                	li	a5,1
    80006d0e:	a011                	j	80006d12 <holdingsleep+0x44>
    80006d10:	4781                	li	a5,0
    80006d12:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006d16:	fc843783          	ld	a5,-56(s0)
    80006d1a:	07a1                	addi	a5,a5,8
    80006d1c:	853e                	mv	a0,a5
    80006d1e:	ffffa097          	auipc	ra,0xffffa
    80006d22:	6ae080e7          	jalr	1710(ra) # 800013cc <release>
  return r;
    80006d26:	fdc42783          	lw	a5,-36(s0)
}
    80006d2a:	853e                	mv	a0,a5
    80006d2c:	70e2                	ld	ra,56(sp)
    80006d2e:	7442                	ld	s0,48(sp)
    80006d30:	74a2                	ld	s1,40(sp)
    80006d32:	6121                	addi	sp,sp,64
    80006d34:	8082                	ret

0000000080006d36 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006d36:	1141                	addi	sp,sp,-16
    80006d38:	e406                	sd	ra,8(sp)
    80006d3a:	e022                	sd	s0,0(sp)
    80006d3c:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006d3e:	00006597          	auipc	a1,0x6
    80006d42:	87a58593          	addi	a1,a1,-1926 # 8000c5b8 <etext+0x5b8>
    80006d46:	0004e517          	auipc	a0,0x4e
    80006d4a:	f8a50513          	addi	a0,a0,-118 # 80054cd0 <ftable>
    80006d4e:	ffffa097          	auipc	ra,0xffffa
    80006d52:	5ea080e7          	jalr	1514(ra) # 80001338 <initlock>
}
    80006d56:	0001                	nop
    80006d58:	60a2                	ld	ra,8(sp)
    80006d5a:	6402                	ld	s0,0(sp)
    80006d5c:	0141                	addi	sp,sp,16
    80006d5e:	8082                	ret

0000000080006d60 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006d60:	1101                	addi	sp,sp,-32
    80006d62:	ec06                	sd	ra,24(sp)
    80006d64:	e822                	sd	s0,16(sp)
    80006d66:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006d68:	0004e517          	auipc	a0,0x4e
    80006d6c:	f6850513          	addi	a0,a0,-152 # 80054cd0 <ftable>
    80006d70:	ffffa097          	auipc	ra,0xffffa
    80006d74:	5f8080e7          	jalr	1528(ra) # 80001368 <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006d78:	0004e797          	auipc	a5,0x4e
    80006d7c:	f7078793          	addi	a5,a5,-144 # 80054ce8 <ftable+0x18>
    80006d80:	fef43423          	sd	a5,-24(s0)
    80006d84:	a815                	j	80006db8 <filealloc+0x58>
    if(f->ref == 0){
    80006d86:	fe843783          	ld	a5,-24(s0)
    80006d8a:	43dc                	lw	a5,4(a5)
    80006d8c:	e385                	bnez	a5,80006dac <filealloc+0x4c>
      f->ref = 1;
    80006d8e:	fe843783          	ld	a5,-24(s0)
    80006d92:	4705                	li	a4,1
    80006d94:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006d96:	0004e517          	auipc	a0,0x4e
    80006d9a:	f3a50513          	addi	a0,a0,-198 # 80054cd0 <ftable>
    80006d9e:	ffffa097          	auipc	ra,0xffffa
    80006da2:	62e080e7          	jalr	1582(ra) # 800013cc <release>
      return f;
    80006da6:	fe843783          	ld	a5,-24(s0)
    80006daa:	a805                	j	80006dda <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006dac:	fe843783          	ld	a5,-24(s0)
    80006db0:	02878793          	addi	a5,a5,40
    80006db4:	fef43423          	sd	a5,-24(s0)
    80006db8:	0004f797          	auipc	a5,0x4f
    80006dbc:	ed078793          	addi	a5,a5,-304 # 80055c88 <diskbitset>
    80006dc0:	fe843703          	ld	a4,-24(s0)
    80006dc4:	fcf761e3          	bltu	a4,a5,80006d86 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006dc8:	0004e517          	auipc	a0,0x4e
    80006dcc:	f0850513          	addi	a0,a0,-248 # 80054cd0 <ftable>
    80006dd0:	ffffa097          	auipc	ra,0xffffa
    80006dd4:	5fc080e7          	jalr	1532(ra) # 800013cc <release>
  return 0;
    80006dd8:	4781                	li	a5,0
}
    80006dda:	853e                	mv	a0,a5
    80006ddc:	60e2                	ld	ra,24(sp)
    80006dde:	6442                	ld	s0,16(sp)
    80006de0:	6105                	addi	sp,sp,32
    80006de2:	8082                	ret

0000000080006de4 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006de4:	1101                	addi	sp,sp,-32
    80006de6:	ec06                	sd	ra,24(sp)
    80006de8:	e822                	sd	s0,16(sp)
    80006dea:	1000                	addi	s0,sp,32
    80006dec:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006df0:	0004e517          	auipc	a0,0x4e
    80006df4:	ee050513          	addi	a0,a0,-288 # 80054cd0 <ftable>
    80006df8:	ffffa097          	auipc	ra,0xffffa
    80006dfc:	570080e7          	jalr	1392(ra) # 80001368 <acquire>
  if(f->ref < 1)
    80006e00:	fe843783          	ld	a5,-24(s0)
    80006e04:	43dc                	lw	a5,4(a5)
    80006e06:	00f04a63          	bgtz	a5,80006e1a <filedup+0x36>
    panic("filedup");
    80006e0a:	00005517          	auipc	a0,0x5
    80006e0e:	7b650513          	addi	a0,a0,1974 # 8000c5c0 <etext+0x5c0>
    80006e12:	ffffa097          	auipc	ra,0xffffa
    80006e16:	e7a080e7          	jalr	-390(ra) # 80000c8c <panic>
  f->ref++;
    80006e1a:	fe843783          	ld	a5,-24(s0)
    80006e1e:	43dc                	lw	a5,4(a5)
    80006e20:	2785                	addiw	a5,a5,1
    80006e22:	0007871b          	sext.w	a4,a5
    80006e26:	fe843783          	ld	a5,-24(s0)
    80006e2a:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006e2c:	0004e517          	auipc	a0,0x4e
    80006e30:	ea450513          	addi	a0,a0,-348 # 80054cd0 <ftable>
    80006e34:	ffffa097          	auipc	ra,0xffffa
    80006e38:	598080e7          	jalr	1432(ra) # 800013cc <release>
  return f;
    80006e3c:	fe843783          	ld	a5,-24(s0)
}
    80006e40:	853e                	mv	a0,a5
    80006e42:	60e2                	ld	ra,24(sp)
    80006e44:	6442                	ld	s0,16(sp)
    80006e46:	6105                	addi	sp,sp,32
    80006e48:	8082                	ret

0000000080006e4a <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006e4a:	715d                	addi	sp,sp,-80
    80006e4c:	e486                	sd	ra,72(sp)
    80006e4e:	e0a2                	sd	s0,64(sp)
    80006e50:	0880                	addi	s0,sp,80
    80006e52:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006e56:	0004e517          	auipc	a0,0x4e
    80006e5a:	e7a50513          	addi	a0,a0,-390 # 80054cd0 <ftable>
    80006e5e:	ffffa097          	auipc	ra,0xffffa
    80006e62:	50a080e7          	jalr	1290(ra) # 80001368 <acquire>
  if(f->ref < 1)
    80006e66:	fb843783          	ld	a5,-72(s0)
    80006e6a:	43dc                	lw	a5,4(a5)
    80006e6c:	00f04a63          	bgtz	a5,80006e80 <fileclose+0x36>
    panic("fileclose");
    80006e70:	00005517          	auipc	a0,0x5
    80006e74:	75850513          	addi	a0,a0,1880 # 8000c5c8 <etext+0x5c8>
    80006e78:	ffffa097          	auipc	ra,0xffffa
    80006e7c:	e14080e7          	jalr	-492(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006e80:	fb843783          	ld	a5,-72(s0)
    80006e84:	43dc                	lw	a5,4(a5)
    80006e86:	37fd                	addiw	a5,a5,-1
    80006e88:	0007871b          	sext.w	a4,a5
    80006e8c:	fb843783          	ld	a5,-72(s0)
    80006e90:	c3d8                	sw	a4,4(a5)
    80006e92:	fb843783          	ld	a5,-72(s0)
    80006e96:	43dc                	lw	a5,4(a5)
    80006e98:	00f05b63          	blez	a5,80006eae <fileclose+0x64>
    release(&ftable.lock);
    80006e9c:	0004e517          	auipc	a0,0x4e
    80006ea0:	e3450513          	addi	a0,a0,-460 # 80054cd0 <ftable>
    80006ea4:	ffffa097          	auipc	ra,0xffffa
    80006ea8:	528080e7          	jalr	1320(ra) # 800013cc <release>
    80006eac:	a879                	j	80006f4a <fileclose+0x100>
    return;
  }
  ff = *f;
    80006eae:	fb843783          	ld	a5,-72(s0)
    80006eb2:	638c                	ld	a1,0(a5)
    80006eb4:	6790                	ld	a2,8(a5)
    80006eb6:	6b94                	ld	a3,16(a5)
    80006eb8:	6f98                	ld	a4,24(a5)
    80006eba:	739c                	ld	a5,32(a5)
    80006ebc:	fcb43423          	sd	a1,-56(s0)
    80006ec0:	fcc43823          	sd	a2,-48(s0)
    80006ec4:	fcd43c23          	sd	a3,-40(s0)
    80006ec8:	fee43023          	sd	a4,-32(s0)
    80006ecc:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006ed0:	fb843783          	ld	a5,-72(s0)
    80006ed4:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006ed8:	fb843783          	ld	a5,-72(s0)
    80006edc:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006ee0:	0004e517          	auipc	a0,0x4e
    80006ee4:	df050513          	addi	a0,a0,-528 # 80054cd0 <ftable>
    80006ee8:	ffffa097          	auipc	ra,0xffffa
    80006eec:	4e4080e7          	jalr	1252(ra) # 800013cc <release>

  if(ff.type == FD_PIPE){
    80006ef0:	fc842783          	lw	a5,-56(s0)
    80006ef4:	873e                	mv	a4,a5
    80006ef6:	4785                	li	a5,1
    80006ef8:	00f71e63          	bne	a4,a5,80006f14 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006efc:	fd843783          	ld	a5,-40(s0)
    80006f00:	fd144703          	lbu	a4,-47(s0)
    80006f04:	2701                	sext.w	a4,a4
    80006f06:	85ba                	mv	a1,a4
    80006f08:	853e                	mv	a0,a5
    80006f0a:	00000097          	auipc	ra,0x0
    80006f0e:	5aa080e7          	jalr	1450(ra) # 800074b4 <pipeclose>
    80006f12:	a825                	j	80006f4a <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006f14:	fc842783          	lw	a5,-56(s0)
    80006f18:	873e                	mv	a4,a5
    80006f1a:	4789                	li	a5,2
    80006f1c:	00f70863          	beq	a4,a5,80006f2c <fileclose+0xe2>
    80006f20:	fc842783          	lw	a5,-56(s0)
    80006f24:	873e                	mv	a4,a5
    80006f26:	478d                	li	a5,3
    80006f28:	02f71163          	bne	a4,a5,80006f4a <fileclose+0x100>
    begin_op();
    80006f2c:	00000097          	auipc	ra,0x0
    80006f30:	884080e7          	jalr	-1916(ra) # 800067b0 <begin_op>
    iput(ff.ip);
    80006f34:	fe043783          	ld	a5,-32(s0)
    80006f38:	853e                	mv	a0,a5
    80006f3a:	fffff097          	auipc	ra,0xfffff
    80006f3e:	97a080e7          	jalr	-1670(ra) # 800058b4 <iput>
    end_op();
    80006f42:	00000097          	auipc	ra,0x0
    80006f46:	930080e7          	jalr	-1744(ra) # 80006872 <end_op>
  }
}
    80006f4a:	60a6                	ld	ra,72(sp)
    80006f4c:	6406                	ld	s0,64(sp)
    80006f4e:	6161                	addi	sp,sp,80
    80006f50:	8082                	ret

0000000080006f52 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006f52:	7139                	addi	sp,sp,-64
    80006f54:	fc06                	sd	ra,56(sp)
    80006f56:	f822                	sd	s0,48(sp)
    80006f58:	0080                	addi	s0,sp,64
    80006f5a:	fca43423          	sd	a0,-56(s0)
    80006f5e:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006f62:	ffffc097          	auipc	ra,0xffffc
    80006f66:	f24080e7          	jalr	-220(ra) # 80002e86 <myproc>
    80006f6a:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006f6e:	fc843783          	ld	a5,-56(s0)
    80006f72:	439c                	lw	a5,0(a5)
    80006f74:	873e                	mv	a4,a5
    80006f76:	4789                	li	a5,2
    80006f78:	00f70963          	beq	a4,a5,80006f8a <filestat+0x38>
    80006f7c:	fc843783          	ld	a5,-56(s0)
    80006f80:	439c                	lw	a5,0(a5)
    80006f82:	873e                	mv	a4,a5
    80006f84:	478d                	li	a5,3
    80006f86:	06f71263          	bne	a4,a5,80006fea <filestat+0x98>
    ilock(f->ip);
    80006f8a:	fc843783          	ld	a5,-56(s0)
    80006f8e:	6f9c                	ld	a5,24(a5)
    80006f90:	853e                	mv	a0,a5
    80006f92:	ffffe097          	auipc	ra,0xffffe
    80006f96:	794080e7          	jalr	1940(ra) # 80005726 <ilock>
    stati(f->ip, &st);
    80006f9a:	fc843783          	ld	a5,-56(s0)
    80006f9e:	6f9c                	ld	a5,24(a5)
    80006fa0:	fd040713          	addi	a4,s0,-48
    80006fa4:	85ba                	mv	a1,a4
    80006fa6:	853e                	mv	a0,a5
    80006fa8:	fffff097          	auipc	ra,0xfffff
    80006fac:	cd0080e7          	jalr	-816(ra) # 80005c78 <stati>
    iunlock(f->ip);
    80006fb0:	fc843783          	ld	a5,-56(s0)
    80006fb4:	6f9c                	ld	a5,24(a5)
    80006fb6:	853e                	mv	a0,a5
    80006fb8:	fffff097          	auipc	ra,0xfffff
    80006fbc:	8a2080e7          	jalr	-1886(ra) # 8000585a <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006fc0:	fe843783          	ld	a5,-24(s0)
    80006fc4:	6bbc                	ld	a5,80(a5)
    80006fc6:	fd040713          	addi	a4,s0,-48
    80006fca:	46e1                	li	a3,24
    80006fcc:	863a                	mv	a2,a4
    80006fce:	fc043583          	ld	a1,-64(s0)
    80006fd2:	853e                	mv	a0,a5
    80006fd4:	ffffc097          	auipc	ra,0xffffc
    80006fd8:	97c080e7          	jalr	-1668(ra) # 80002950 <copyout>
    80006fdc:	87aa                	mv	a5,a0
    80006fde:	0007d463          	bgez	a5,80006fe6 <filestat+0x94>
      return -1;
    80006fe2:	57fd                	li	a5,-1
    80006fe4:	a021                	j	80006fec <filestat+0x9a>
    return 0;
    80006fe6:	4781                	li	a5,0
    80006fe8:	a011                	j	80006fec <filestat+0x9a>
  }
  return -1;
    80006fea:	57fd                	li	a5,-1
}
    80006fec:	853e                	mv	a0,a5
    80006fee:	70e2                	ld	ra,56(sp)
    80006ff0:	7442                	ld	s0,48(sp)
    80006ff2:	6121                	addi	sp,sp,64
    80006ff4:	8082                	ret

0000000080006ff6 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006ff6:	7139                	addi	sp,sp,-64
    80006ff8:	fc06                	sd	ra,56(sp)
    80006ffa:	f822                	sd	s0,48(sp)
    80006ffc:	0080                	addi	s0,sp,64
    80006ffe:	fca43c23          	sd	a0,-40(s0)
    80007002:	fcb43823          	sd	a1,-48(s0)
    80007006:	87b2                	mv	a5,a2
    80007008:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    8000700c:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80007010:	fd843783          	ld	a5,-40(s0)
    80007014:	0087c783          	lbu	a5,8(a5)
    80007018:	e399                	bnez	a5,8000701e <fileread+0x28>
    return -1;
    8000701a:	57fd                	li	a5,-1
    8000701c:	aa1d                	j	80007152 <fileread+0x15c>

  if(f->type == FD_PIPE){
    8000701e:	fd843783          	ld	a5,-40(s0)
    80007022:	439c                	lw	a5,0(a5)
    80007024:	873e                	mv	a4,a5
    80007026:	4785                	li	a5,1
    80007028:	02f71363          	bne	a4,a5,8000704e <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    8000702c:	fd843783          	ld	a5,-40(s0)
    80007030:	6b9c                	ld	a5,16(a5)
    80007032:	fcc42703          	lw	a4,-52(s0)
    80007036:	863a                	mv	a2,a4
    80007038:	fd043583          	ld	a1,-48(s0)
    8000703c:	853e                	mv	a0,a5
    8000703e:	00000097          	auipc	ra,0x0
    80007042:	670080e7          	jalr	1648(ra) # 800076ae <piperead>
    80007046:	87aa                	mv	a5,a0
    80007048:	fef42623          	sw	a5,-20(s0)
    8000704c:	a209                	j	8000714e <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    8000704e:	fd843783          	ld	a5,-40(s0)
    80007052:	439c                	lw	a5,0(a5)
    80007054:	873e                	mv	a4,a5
    80007056:	478d                	li	a5,3
    80007058:	06f71863          	bne	a4,a5,800070c8 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    8000705c:	fd843783          	ld	a5,-40(s0)
    80007060:	02479783          	lh	a5,36(a5)
    80007064:	2781                	sext.w	a5,a5
    80007066:	0207c863          	bltz	a5,80007096 <fileread+0xa0>
    8000706a:	fd843783          	ld	a5,-40(s0)
    8000706e:	02479783          	lh	a5,36(a5)
    80007072:	0007871b          	sext.w	a4,a5
    80007076:	47a5                	li	a5,9
    80007078:	00e7cf63          	blt	a5,a4,80007096 <fileread+0xa0>
    8000707c:	fd843783          	ld	a5,-40(s0)
    80007080:	02479783          	lh	a5,36(a5)
    80007084:	2781                	sext.w	a5,a5
    80007086:	0004e717          	auipc	a4,0x4e
    8000708a:	baa70713          	addi	a4,a4,-1110 # 80054c30 <devsw>
    8000708e:	0792                	slli	a5,a5,0x4
    80007090:	97ba                	add	a5,a5,a4
    80007092:	639c                	ld	a5,0(a5)
    80007094:	e399                	bnez	a5,8000709a <fileread+0xa4>
      return -1;
    80007096:	57fd                	li	a5,-1
    80007098:	a86d                	j	80007152 <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    8000709a:	fd843783          	ld	a5,-40(s0)
    8000709e:	02479783          	lh	a5,36(a5)
    800070a2:	2781                	sext.w	a5,a5
    800070a4:	0004e717          	auipc	a4,0x4e
    800070a8:	b8c70713          	addi	a4,a4,-1140 # 80054c30 <devsw>
    800070ac:	0792                	slli	a5,a5,0x4
    800070ae:	97ba                	add	a5,a5,a4
    800070b0:	6398                	ld	a4,0(a5)
    800070b2:	fcc42783          	lw	a5,-52(s0)
    800070b6:	863e                	mv	a2,a5
    800070b8:	fd043583          	ld	a1,-48(s0)
    800070bc:	4505                	li	a0,1
    800070be:	9702                	jalr	a4
    800070c0:	87aa                	mv	a5,a0
    800070c2:	fef42623          	sw	a5,-20(s0)
    800070c6:	a061                	j	8000714e <fileread+0x158>
  } else if(f->type == FD_INODE){
    800070c8:	fd843783          	ld	a5,-40(s0)
    800070cc:	439c                	lw	a5,0(a5)
    800070ce:	873e                	mv	a4,a5
    800070d0:	4789                	li	a5,2
    800070d2:	06f71663          	bne	a4,a5,8000713e <fileread+0x148>
    ilock(f->ip);
    800070d6:	fd843783          	ld	a5,-40(s0)
    800070da:	6f9c                	ld	a5,24(a5)
    800070dc:	853e                	mv	a0,a5
    800070de:	ffffe097          	auipc	ra,0xffffe
    800070e2:	648080e7          	jalr	1608(ra) # 80005726 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    800070e6:	fd843783          	ld	a5,-40(s0)
    800070ea:	6f88                	ld	a0,24(a5)
    800070ec:	fd843783          	ld	a5,-40(s0)
    800070f0:	539c                	lw	a5,32(a5)
    800070f2:	fcc42703          	lw	a4,-52(s0)
    800070f6:	86be                	mv	a3,a5
    800070f8:	fd043603          	ld	a2,-48(s0)
    800070fc:	4585                	li	a1,1
    800070fe:	fffff097          	auipc	ra,0xfffff
    80007102:	bde080e7          	jalr	-1058(ra) # 80005cdc <readi>
    80007106:	87aa                	mv	a5,a0
    80007108:	fef42623          	sw	a5,-20(s0)
    8000710c:	fec42783          	lw	a5,-20(s0)
    80007110:	2781                	sext.w	a5,a5
    80007112:	00f05d63          	blez	a5,8000712c <fileread+0x136>
      f->off += r;
    80007116:	fd843783          	ld	a5,-40(s0)
    8000711a:	5398                	lw	a4,32(a5)
    8000711c:	fec42783          	lw	a5,-20(s0)
    80007120:	9fb9                	addw	a5,a5,a4
    80007122:	0007871b          	sext.w	a4,a5
    80007126:	fd843783          	ld	a5,-40(s0)
    8000712a:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    8000712c:	fd843783          	ld	a5,-40(s0)
    80007130:	6f9c                	ld	a5,24(a5)
    80007132:	853e                	mv	a0,a5
    80007134:	ffffe097          	auipc	ra,0xffffe
    80007138:	726080e7          	jalr	1830(ra) # 8000585a <iunlock>
    8000713c:	a809                	j	8000714e <fileread+0x158>
  } else {
    panic("fileread");
    8000713e:	00005517          	auipc	a0,0x5
    80007142:	49a50513          	addi	a0,a0,1178 # 8000c5d8 <etext+0x5d8>
    80007146:	ffffa097          	auipc	ra,0xffffa
    8000714a:	b46080e7          	jalr	-1210(ra) # 80000c8c <panic>
  }

  return r;
    8000714e:	fec42783          	lw	a5,-20(s0)
}
    80007152:	853e                	mv	a0,a5
    80007154:	70e2                	ld	ra,56(sp)
    80007156:	7442                	ld	s0,48(sp)
    80007158:	6121                	addi	sp,sp,64
    8000715a:	8082                	ret

000000008000715c <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    8000715c:	715d                	addi	sp,sp,-80
    8000715e:	e486                	sd	ra,72(sp)
    80007160:	e0a2                	sd	s0,64(sp)
    80007162:	0880                	addi	s0,sp,80
    80007164:	fca43423          	sd	a0,-56(s0)
    80007168:	fcb43023          	sd	a1,-64(s0)
    8000716c:	87b2                	mv	a5,a2
    8000716e:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80007172:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80007176:	fc843783          	ld	a5,-56(s0)
    8000717a:	0097c783          	lbu	a5,9(a5)
    8000717e:	e399                	bnez	a5,80007184 <filewrite+0x28>
    return -1;
    80007180:	57fd                	li	a5,-1
    80007182:	aad1                	j	80007356 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80007184:	fc843783          	ld	a5,-56(s0)
    80007188:	439c                	lw	a5,0(a5)
    8000718a:	873e                	mv	a4,a5
    8000718c:	4785                	li	a5,1
    8000718e:	02f71363          	bne	a4,a5,800071b4 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80007192:	fc843783          	ld	a5,-56(s0)
    80007196:	6b9c                	ld	a5,16(a5)
    80007198:	fbc42703          	lw	a4,-68(s0)
    8000719c:	863a                	mv	a2,a4
    8000719e:	fc043583          	ld	a1,-64(s0)
    800071a2:	853e                	mv	a0,a5
    800071a4:	00000097          	auipc	ra,0x0
    800071a8:	3b8080e7          	jalr	952(ra) # 8000755c <pipewrite>
    800071ac:	87aa                	mv	a5,a0
    800071ae:	fef42623          	sw	a5,-20(s0)
    800071b2:	a245                	j	80007352 <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    800071b4:	fc843783          	ld	a5,-56(s0)
    800071b8:	439c                	lw	a5,0(a5)
    800071ba:	873e                	mv	a4,a5
    800071bc:	478d                	li	a5,3
    800071be:	06f71863          	bne	a4,a5,8000722e <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    800071c2:	fc843783          	ld	a5,-56(s0)
    800071c6:	02479783          	lh	a5,36(a5)
    800071ca:	2781                	sext.w	a5,a5
    800071cc:	0207c863          	bltz	a5,800071fc <filewrite+0xa0>
    800071d0:	fc843783          	ld	a5,-56(s0)
    800071d4:	02479783          	lh	a5,36(a5)
    800071d8:	0007871b          	sext.w	a4,a5
    800071dc:	47a5                	li	a5,9
    800071de:	00e7cf63          	blt	a5,a4,800071fc <filewrite+0xa0>
    800071e2:	fc843783          	ld	a5,-56(s0)
    800071e6:	02479783          	lh	a5,36(a5)
    800071ea:	2781                	sext.w	a5,a5
    800071ec:	0004e717          	auipc	a4,0x4e
    800071f0:	a4470713          	addi	a4,a4,-1468 # 80054c30 <devsw>
    800071f4:	0792                	slli	a5,a5,0x4
    800071f6:	97ba                	add	a5,a5,a4
    800071f8:	679c                	ld	a5,8(a5)
    800071fa:	e399                	bnez	a5,80007200 <filewrite+0xa4>
      return -1;
    800071fc:	57fd                	li	a5,-1
    800071fe:	aaa1                	j	80007356 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80007200:	fc843783          	ld	a5,-56(s0)
    80007204:	02479783          	lh	a5,36(a5)
    80007208:	2781                	sext.w	a5,a5
    8000720a:	0004e717          	auipc	a4,0x4e
    8000720e:	a2670713          	addi	a4,a4,-1498 # 80054c30 <devsw>
    80007212:	0792                	slli	a5,a5,0x4
    80007214:	97ba                	add	a5,a5,a4
    80007216:	6798                	ld	a4,8(a5)
    80007218:	fbc42783          	lw	a5,-68(s0)
    8000721c:	863e                	mv	a2,a5
    8000721e:	fc043583          	ld	a1,-64(s0)
    80007222:	4505                	li	a0,1
    80007224:	9702                	jalr	a4
    80007226:	87aa                	mv	a5,a0
    80007228:	fef42623          	sw	a5,-20(s0)
    8000722c:	a21d                	j	80007352 <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    8000722e:	fc843783          	ld	a5,-56(s0)
    80007232:	439c                	lw	a5,0(a5)
    80007234:	873e                	mv	a4,a5
    80007236:	4789                	li	a5,2
    80007238:	10f71563          	bne	a4,a5,80007342 <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    8000723c:	6785                	lui	a5,0x1
    8000723e:	c007879b          	addiw	a5,a5,-1024
    80007242:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80007246:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    8000724a:	a0d9                	j	80007310 <filewrite+0x1b4>
      int n1 = n - i;
    8000724c:	fbc42703          	lw	a4,-68(s0)
    80007250:	fe842783          	lw	a5,-24(s0)
    80007254:	40f707bb          	subw	a5,a4,a5
    80007258:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    8000725c:	fe442703          	lw	a4,-28(s0)
    80007260:	fe042783          	lw	a5,-32(s0)
    80007264:	2701                	sext.w	a4,a4
    80007266:	2781                	sext.w	a5,a5
    80007268:	00e7d663          	bge	a5,a4,80007274 <filewrite+0x118>
        n1 = max;
    8000726c:	fe042783          	lw	a5,-32(s0)
    80007270:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80007274:	fffff097          	auipc	ra,0xfffff
    80007278:	53c080e7          	jalr	1340(ra) # 800067b0 <begin_op>
      ilock(f->ip);
    8000727c:	fc843783          	ld	a5,-56(s0)
    80007280:	6f9c                	ld	a5,24(a5)
    80007282:	853e                	mv	a0,a5
    80007284:	ffffe097          	auipc	ra,0xffffe
    80007288:	4a2080e7          	jalr	1186(ra) # 80005726 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    8000728c:	fc843783          	ld	a5,-56(s0)
    80007290:	6f88                	ld	a0,24(a5)
    80007292:	fe842703          	lw	a4,-24(s0)
    80007296:	fc043783          	ld	a5,-64(s0)
    8000729a:	00f70633          	add	a2,a4,a5
    8000729e:	fc843783          	ld	a5,-56(s0)
    800072a2:	539c                	lw	a5,32(a5)
    800072a4:	fe442703          	lw	a4,-28(s0)
    800072a8:	86be                	mv	a3,a5
    800072aa:	4585                	li	a1,1
    800072ac:	fffff097          	auipc	ra,0xfffff
    800072b0:	bc8080e7          	jalr	-1080(ra) # 80005e74 <writei>
    800072b4:	87aa                	mv	a5,a0
    800072b6:	fcf42e23          	sw	a5,-36(s0)
    800072ba:	fdc42783          	lw	a5,-36(s0)
    800072be:	2781                	sext.w	a5,a5
    800072c0:	00f05d63          	blez	a5,800072da <filewrite+0x17e>
        f->off += r;
    800072c4:	fc843783          	ld	a5,-56(s0)
    800072c8:	5398                	lw	a4,32(a5)
    800072ca:	fdc42783          	lw	a5,-36(s0)
    800072ce:	9fb9                	addw	a5,a5,a4
    800072d0:	0007871b          	sext.w	a4,a5
    800072d4:	fc843783          	ld	a5,-56(s0)
    800072d8:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    800072da:	fc843783          	ld	a5,-56(s0)
    800072de:	6f9c                	ld	a5,24(a5)
    800072e0:	853e                	mv	a0,a5
    800072e2:	ffffe097          	auipc	ra,0xffffe
    800072e6:	578080e7          	jalr	1400(ra) # 8000585a <iunlock>
      end_op();
    800072ea:	fffff097          	auipc	ra,0xfffff
    800072ee:	588080e7          	jalr	1416(ra) # 80006872 <end_op>

      if(r != n1){
    800072f2:	fdc42703          	lw	a4,-36(s0)
    800072f6:	fe442783          	lw	a5,-28(s0)
    800072fa:	2701                	sext.w	a4,a4
    800072fc:	2781                	sext.w	a5,a5
    800072fe:	02f71263          	bne	a4,a5,80007322 <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80007302:	fe842703          	lw	a4,-24(s0)
    80007306:	fdc42783          	lw	a5,-36(s0)
    8000730a:	9fb9                	addw	a5,a5,a4
    8000730c:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80007310:	fe842703          	lw	a4,-24(s0)
    80007314:	fbc42783          	lw	a5,-68(s0)
    80007318:	2701                	sext.w	a4,a4
    8000731a:	2781                	sext.w	a5,a5
    8000731c:	f2f748e3          	blt	a4,a5,8000724c <filewrite+0xf0>
    80007320:	a011                	j	80007324 <filewrite+0x1c8>
        break;
    80007322:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80007324:	fe842703          	lw	a4,-24(s0)
    80007328:	fbc42783          	lw	a5,-68(s0)
    8000732c:	2701                	sext.w	a4,a4
    8000732e:	2781                	sext.w	a5,a5
    80007330:	00f71563          	bne	a4,a5,8000733a <filewrite+0x1de>
    80007334:	fbc42783          	lw	a5,-68(s0)
    80007338:	a011                	j	8000733c <filewrite+0x1e0>
    8000733a:	57fd                	li	a5,-1
    8000733c:	fef42623          	sw	a5,-20(s0)
    80007340:	a809                	j	80007352 <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80007342:	00005517          	auipc	a0,0x5
    80007346:	2a650513          	addi	a0,a0,678 # 8000c5e8 <etext+0x5e8>
    8000734a:	ffffa097          	auipc	ra,0xffffa
    8000734e:	942080e7          	jalr	-1726(ra) # 80000c8c <panic>
  }

  return ret;
    80007352:	fec42783          	lw	a5,-20(s0)
}
    80007356:	853e                	mv	a0,a5
    80007358:	60a6                	ld	ra,72(sp)
    8000735a:	6406                	ld	s0,64(sp)
    8000735c:	6161                	addi	sp,sp,80
    8000735e:	8082                	ret

0000000080007360 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80007360:	7179                	addi	sp,sp,-48
    80007362:	f406                	sd	ra,40(sp)
    80007364:	f022                	sd	s0,32(sp)
    80007366:	1800                	addi	s0,sp,48
    80007368:	fca43c23          	sd	a0,-40(s0)
    8000736c:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80007370:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80007374:	fd043783          	ld	a5,-48(s0)
    80007378:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    8000737c:	fd043783          	ld	a5,-48(s0)
    80007380:	6398                	ld	a4,0(a5)
    80007382:	fd843783          	ld	a5,-40(s0)
    80007386:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80007388:	00000097          	auipc	ra,0x0
    8000738c:	9d8080e7          	jalr	-1576(ra) # 80006d60 <filealloc>
    80007390:	872a                	mv	a4,a0
    80007392:	fd843783          	ld	a5,-40(s0)
    80007396:	e398                	sd	a4,0(a5)
    80007398:	fd843783          	ld	a5,-40(s0)
    8000739c:	639c                	ld	a5,0(a5)
    8000739e:	c3e9                	beqz	a5,80007460 <pipealloc+0x100>
    800073a0:	00000097          	auipc	ra,0x0
    800073a4:	9c0080e7          	jalr	-1600(ra) # 80006d60 <filealloc>
    800073a8:	872a                	mv	a4,a0
    800073aa:	fd043783          	ld	a5,-48(s0)
    800073ae:	e398                	sd	a4,0(a5)
    800073b0:	fd043783          	ld	a5,-48(s0)
    800073b4:	639c                	ld	a5,0(a5)
    800073b6:	c7cd                	beqz	a5,80007460 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    800073b8:	ffffa097          	auipc	ra,0xffffa
    800073bc:	e1e080e7          	jalr	-482(ra) # 800011d6 <kalloc>
    800073c0:	fea43423          	sd	a0,-24(s0)
    800073c4:	fe843783          	ld	a5,-24(s0)
    800073c8:	cfd1                	beqz	a5,80007464 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    800073ca:	fe843783          	ld	a5,-24(s0)
    800073ce:	4705                	li	a4,1
    800073d0:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    800073d4:	fe843783          	ld	a5,-24(s0)
    800073d8:	4705                	li	a4,1
    800073da:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    800073de:	fe843783          	ld	a5,-24(s0)
    800073e2:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    800073e6:	fe843783          	ld	a5,-24(s0)
    800073ea:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    800073ee:	fe843783          	ld	a5,-24(s0)
    800073f2:	00005597          	auipc	a1,0x5
    800073f6:	20658593          	addi	a1,a1,518 # 8000c5f8 <etext+0x5f8>
    800073fa:	853e                	mv	a0,a5
    800073fc:	ffffa097          	auipc	ra,0xffffa
    80007400:	f3c080e7          	jalr	-196(ra) # 80001338 <initlock>
  (*f0)->type = FD_PIPE;
    80007404:	fd843783          	ld	a5,-40(s0)
    80007408:	639c                	ld	a5,0(a5)
    8000740a:	4705                	li	a4,1
    8000740c:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    8000740e:	fd843783          	ld	a5,-40(s0)
    80007412:	639c                	ld	a5,0(a5)
    80007414:	4705                	li	a4,1
    80007416:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    8000741a:	fd843783          	ld	a5,-40(s0)
    8000741e:	639c                	ld	a5,0(a5)
    80007420:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80007424:	fd843783          	ld	a5,-40(s0)
    80007428:	639c                	ld	a5,0(a5)
    8000742a:	fe843703          	ld	a4,-24(s0)
    8000742e:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80007430:	fd043783          	ld	a5,-48(s0)
    80007434:	639c                	ld	a5,0(a5)
    80007436:	4705                	li	a4,1
    80007438:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    8000743a:	fd043783          	ld	a5,-48(s0)
    8000743e:	639c                	ld	a5,0(a5)
    80007440:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80007444:	fd043783          	ld	a5,-48(s0)
    80007448:	639c                	ld	a5,0(a5)
    8000744a:	4705                	li	a4,1
    8000744c:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80007450:	fd043783          	ld	a5,-48(s0)
    80007454:	639c                	ld	a5,0(a5)
    80007456:	fe843703          	ld	a4,-24(s0)
    8000745a:	eb98                	sd	a4,16(a5)
  return 0;
    8000745c:	4781                	li	a5,0
    8000745e:	a0b1                	j	800074aa <pipealloc+0x14a>
    goto bad;
    80007460:	0001                	nop
    80007462:	a011                	j	80007466 <pipealloc+0x106>
    goto bad;
    80007464:	0001                	nop

 bad:
  if(pi)
    80007466:	fe843783          	ld	a5,-24(s0)
    8000746a:	c799                	beqz	a5,80007478 <pipealloc+0x118>
    kfree((char*)pi);
    8000746c:	fe843503          	ld	a0,-24(s0)
    80007470:	ffffa097          	auipc	ra,0xffffa
    80007474:	cc0080e7          	jalr	-832(ra) # 80001130 <kfree>
  if(*f0)
    80007478:	fd843783          	ld	a5,-40(s0)
    8000747c:	639c                	ld	a5,0(a5)
    8000747e:	cb89                	beqz	a5,80007490 <pipealloc+0x130>
    fileclose(*f0);
    80007480:	fd843783          	ld	a5,-40(s0)
    80007484:	639c                	ld	a5,0(a5)
    80007486:	853e                	mv	a0,a5
    80007488:	00000097          	auipc	ra,0x0
    8000748c:	9c2080e7          	jalr	-1598(ra) # 80006e4a <fileclose>
  if(*f1)
    80007490:	fd043783          	ld	a5,-48(s0)
    80007494:	639c                	ld	a5,0(a5)
    80007496:	cb89                	beqz	a5,800074a8 <pipealloc+0x148>
    fileclose(*f1);
    80007498:	fd043783          	ld	a5,-48(s0)
    8000749c:	639c                	ld	a5,0(a5)
    8000749e:	853e                	mv	a0,a5
    800074a0:	00000097          	auipc	ra,0x0
    800074a4:	9aa080e7          	jalr	-1622(ra) # 80006e4a <fileclose>
  return -1;
    800074a8:	57fd                	li	a5,-1
}
    800074aa:	853e                	mv	a0,a5
    800074ac:	70a2                	ld	ra,40(sp)
    800074ae:	7402                	ld	s0,32(sp)
    800074b0:	6145                	addi	sp,sp,48
    800074b2:	8082                	ret

00000000800074b4 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    800074b4:	1101                	addi	sp,sp,-32
    800074b6:	ec06                	sd	ra,24(sp)
    800074b8:	e822                	sd	s0,16(sp)
    800074ba:	1000                	addi	s0,sp,32
    800074bc:	fea43423          	sd	a0,-24(s0)
    800074c0:	87ae                	mv	a5,a1
    800074c2:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    800074c6:	fe843783          	ld	a5,-24(s0)
    800074ca:	853e                	mv	a0,a5
    800074cc:	ffffa097          	auipc	ra,0xffffa
    800074d0:	e9c080e7          	jalr	-356(ra) # 80001368 <acquire>
  if(writable){
    800074d4:	fe442783          	lw	a5,-28(s0)
    800074d8:	2781                	sext.w	a5,a5
    800074da:	cf99                	beqz	a5,800074f8 <pipeclose+0x44>
    pi->writeopen = 0;
    800074dc:	fe843783          	ld	a5,-24(s0)
    800074e0:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800074e4:	fe843783          	ld	a5,-24(s0)
    800074e8:	21878793          	addi	a5,a5,536
    800074ec:	853e                	mv	a0,a5
    800074ee:	ffffc097          	auipc	ra,0xffffc
    800074f2:	5d6080e7          	jalr	1494(ra) # 80003ac4 <wakeup>
    800074f6:	a831                	j	80007512 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800074f8:	fe843783          	ld	a5,-24(s0)
    800074fc:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80007500:	fe843783          	ld	a5,-24(s0)
    80007504:	21c78793          	addi	a5,a5,540
    80007508:	853e                	mv	a0,a5
    8000750a:	ffffc097          	auipc	ra,0xffffc
    8000750e:	5ba080e7          	jalr	1466(ra) # 80003ac4 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80007512:	fe843783          	ld	a5,-24(s0)
    80007516:	2207a783          	lw	a5,544(a5)
    8000751a:	e785                	bnez	a5,80007542 <pipeclose+0x8e>
    8000751c:	fe843783          	ld	a5,-24(s0)
    80007520:	2247a783          	lw	a5,548(a5)
    80007524:	ef99                	bnez	a5,80007542 <pipeclose+0x8e>
    release(&pi->lock);
    80007526:	fe843783          	ld	a5,-24(s0)
    8000752a:	853e                	mv	a0,a5
    8000752c:	ffffa097          	auipc	ra,0xffffa
    80007530:	ea0080e7          	jalr	-352(ra) # 800013cc <release>
    kfree((char*)pi);
    80007534:	fe843503          	ld	a0,-24(s0)
    80007538:	ffffa097          	auipc	ra,0xffffa
    8000753c:	bf8080e7          	jalr	-1032(ra) # 80001130 <kfree>
    80007540:	a809                	j	80007552 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80007542:	fe843783          	ld	a5,-24(s0)
    80007546:	853e                	mv	a0,a5
    80007548:	ffffa097          	auipc	ra,0xffffa
    8000754c:	e84080e7          	jalr	-380(ra) # 800013cc <release>
}
    80007550:	0001                	nop
    80007552:	0001                	nop
    80007554:	60e2                	ld	ra,24(sp)
    80007556:	6442                	ld	s0,16(sp)
    80007558:	6105                	addi	sp,sp,32
    8000755a:	8082                	ret

000000008000755c <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8000755c:	715d                	addi	sp,sp,-80
    8000755e:	e486                	sd	ra,72(sp)
    80007560:	e0a2                	sd	s0,64(sp)
    80007562:	0880                	addi	s0,sp,80
    80007564:	fca43423          	sd	a0,-56(s0)
    80007568:	fcb43023          	sd	a1,-64(s0)
    8000756c:	87b2                	mv	a5,a2
    8000756e:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80007572:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007576:	ffffc097          	auipc	ra,0xffffc
    8000757a:	910080e7          	jalr	-1776(ra) # 80002e86 <myproc>
    8000757e:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80007582:	fc843783          	ld	a5,-56(s0)
    80007586:	853e                	mv	a0,a5
    80007588:	ffffa097          	auipc	ra,0xffffa
    8000758c:	de0080e7          	jalr	-544(ra) # 80001368 <acquire>
  while(i < n){
    80007590:	a8f1                	j	8000766c <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    80007592:	fc843783          	ld	a5,-56(s0)
    80007596:	2207a783          	lw	a5,544(a5)
    8000759a:	cb89                	beqz	a5,800075ac <pipewrite+0x50>
    8000759c:	fe043503          	ld	a0,-32(s0)
    800075a0:	ffffc097          	auipc	ra,0xffffc
    800075a4:	6b6080e7          	jalr	1718(ra) # 80003c56 <killed>
    800075a8:	87aa                	mv	a5,a0
    800075aa:	cb91                	beqz	a5,800075be <pipewrite+0x62>
      release(&pi->lock);
    800075ac:	fc843783          	ld	a5,-56(s0)
    800075b0:	853e                	mv	a0,a5
    800075b2:	ffffa097          	auipc	ra,0xffffa
    800075b6:	e1a080e7          	jalr	-486(ra) # 800013cc <release>
      return -1;
    800075ba:	57fd                	li	a5,-1
    800075bc:	a0e5                	j	800076a4 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    800075be:	fc843783          	ld	a5,-56(s0)
    800075c2:	21c7a703          	lw	a4,540(a5)
    800075c6:	fc843783          	ld	a5,-56(s0)
    800075ca:	2187a783          	lw	a5,536(a5)
    800075ce:	2007879b          	addiw	a5,a5,512
    800075d2:	2781                	sext.w	a5,a5
    800075d4:	02f71863          	bne	a4,a5,80007604 <pipewrite+0xa8>
      wakeup(&pi->nread);
    800075d8:	fc843783          	ld	a5,-56(s0)
    800075dc:	21878793          	addi	a5,a5,536
    800075e0:	853e                	mv	a0,a5
    800075e2:	ffffc097          	auipc	ra,0xffffc
    800075e6:	4e2080e7          	jalr	1250(ra) # 80003ac4 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800075ea:	fc843783          	ld	a5,-56(s0)
    800075ee:	21c78793          	addi	a5,a5,540
    800075f2:	fc843703          	ld	a4,-56(s0)
    800075f6:	85ba                	mv	a1,a4
    800075f8:	853e                	mv	a0,a5
    800075fa:	ffffc097          	auipc	ra,0xffffc
    800075fe:	44e080e7          	jalr	1102(ra) # 80003a48 <sleep>
    80007602:	a0ad                	j	8000766c <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007604:	fe043783          	ld	a5,-32(s0)
    80007608:	6ba8                	ld	a0,80(a5)
    8000760a:	fec42703          	lw	a4,-20(s0)
    8000760e:	fc043783          	ld	a5,-64(s0)
    80007612:	973e                	add	a4,a4,a5
    80007614:	fdf40793          	addi	a5,s0,-33
    80007618:	4685                	li	a3,1
    8000761a:	863a                	mv	a2,a4
    8000761c:	85be                	mv	a1,a5
    8000761e:	ffffb097          	auipc	ra,0xffffb
    80007622:	400080e7          	jalr	1024(ra) # 80002a1e <copyin>
    80007626:	87aa                	mv	a5,a0
    80007628:	873e                	mv	a4,a5
    8000762a:	57fd                	li	a5,-1
    8000762c:	04f70963          	beq	a4,a5,8000767e <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80007630:	fc843783          	ld	a5,-56(s0)
    80007634:	21c7a783          	lw	a5,540(a5)
    80007638:	2781                	sext.w	a5,a5
    8000763a:	0017871b          	addiw	a4,a5,1
    8000763e:	0007069b          	sext.w	a3,a4
    80007642:	fc843703          	ld	a4,-56(s0)
    80007646:	20d72e23          	sw	a3,540(a4)
    8000764a:	1ff7f793          	andi	a5,a5,511
    8000764e:	2781                	sext.w	a5,a5
    80007650:	fdf44703          	lbu	a4,-33(s0)
    80007654:	fc843683          	ld	a3,-56(s0)
    80007658:	1782                	slli	a5,a5,0x20
    8000765a:	9381                	srli	a5,a5,0x20
    8000765c:	97b6                	add	a5,a5,a3
    8000765e:	00e78c23          	sb	a4,24(a5)
      i++;
    80007662:	fec42783          	lw	a5,-20(s0)
    80007666:	2785                	addiw	a5,a5,1
    80007668:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    8000766c:	fec42703          	lw	a4,-20(s0)
    80007670:	fbc42783          	lw	a5,-68(s0)
    80007674:	2701                	sext.w	a4,a4
    80007676:	2781                	sext.w	a5,a5
    80007678:	f0f74de3          	blt	a4,a5,80007592 <pipewrite+0x36>
    8000767c:	a011                	j	80007680 <pipewrite+0x124>
        break;
    8000767e:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007680:	fc843783          	ld	a5,-56(s0)
    80007684:	21878793          	addi	a5,a5,536
    80007688:	853e                	mv	a0,a5
    8000768a:	ffffc097          	auipc	ra,0xffffc
    8000768e:	43a080e7          	jalr	1082(ra) # 80003ac4 <wakeup>
  release(&pi->lock);
    80007692:	fc843783          	ld	a5,-56(s0)
    80007696:	853e                	mv	a0,a5
    80007698:	ffffa097          	auipc	ra,0xffffa
    8000769c:	d34080e7          	jalr	-716(ra) # 800013cc <release>

  return i;
    800076a0:	fec42783          	lw	a5,-20(s0)
}
    800076a4:	853e                	mv	a0,a5
    800076a6:	60a6                	ld	ra,72(sp)
    800076a8:	6406                	ld	s0,64(sp)
    800076aa:	6161                	addi	sp,sp,80
    800076ac:	8082                	ret

00000000800076ae <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800076ae:	715d                	addi	sp,sp,-80
    800076b0:	e486                	sd	ra,72(sp)
    800076b2:	e0a2                	sd	s0,64(sp)
    800076b4:	0880                	addi	s0,sp,80
    800076b6:	fca43423          	sd	a0,-56(s0)
    800076ba:	fcb43023          	sd	a1,-64(s0)
    800076be:	87b2                	mv	a5,a2
    800076c0:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800076c4:	ffffb097          	auipc	ra,0xffffb
    800076c8:	7c2080e7          	jalr	1986(ra) # 80002e86 <myproc>
    800076cc:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800076d0:	fc843783          	ld	a5,-56(s0)
    800076d4:	853e                	mv	a0,a5
    800076d6:	ffffa097          	auipc	ra,0xffffa
    800076da:	c92080e7          	jalr	-878(ra) # 80001368 <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800076de:	a835                	j	8000771a <piperead+0x6c>
    if(killed(pr)){
    800076e0:	fe043503          	ld	a0,-32(s0)
    800076e4:	ffffc097          	auipc	ra,0xffffc
    800076e8:	572080e7          	jalr	1394(ra) # 80003c56 <killed>
    800076ec:	87aa                	mv	a5,a0
    800076ee:	cb91                	beqz	a5,80007702 <piperead+0x54>
      release(&pi->lock);
    800076f0:	fc843783          	ld	a5,-56(s0)
    800076f4:	853e                	mv	a0,a5
    800076f6:	ffffa097          	auipc	ra,0xffffa
    800076fa:	cd6080e7          	jalr	-810(ra) # 800013cc <release>
      return -1;
    800076fe:	57fd                	li	a5,-1
    80007700:	a8dd                	j	800077f6 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80007702:	fc843783          	ld	a5,-56(s0)
    80007706:	21878793          	addi	a5,a5,536
    8000770a:	fc843703          	ld	a4,-56(s0)
    8000770e:	85ba                	mv	a1,a4
    80007710:	853e                	mv	a0,a5
    80007712:	ffffc097          	auipc	ra,0xffffc
    80007716:	336080e7          	jalr	822(ra) # 80003a48 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000771a:	fc843783          	ld	a5,-56(s0)
    8000771e:	2187a703          	lw	a4,536(a5)
    80007722:	fc843783          	ld	a5,-56(s0)
    80007726:	21c7a783          	lw	a5,540(a5)
    8000772a:	00f71763          	bne	a4,a5,80007738 <piperead+0x8a>
    8000772e:	fc843783          	ld	a5,-56(s0)
    80007732:	2247a783          	lw	a5,548(a5)
    80007736:	f7cd                	bnez	a5,800076e0 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007738:	fe042623          	sw	zero,-20(s0)
    8000773c:	a8bd                	j	800077ba <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    8000773e:	fc843783          	ld	a5,-56(s0)
    80007742:	2187a703          	lw	a4,536(a5)
    80007746:	fc843783          	ld	a5,-56(s0)
    8000774a:	21c7a783          	lw	a5,540(a5)
    8000774e:	06f70f63          	beq	a4,a5,800077cc <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    80007752:	fc843783          	ld	a5,-56(s0)
    80007756:	2187a783          	lw	a5,536(a5)
    8000775a:	2781                	sext.w	a5,a5
    8000775c:	0017871b          	addiw	a4,a5,1
    80007760:	0007069b          	sext.w	a3,a4
    80007764:	fc843703          	ld	a4,-56(s0)
    80007768:	20d72c23          	sw	a3,536(a4)
    8000776c:	1ff7f793          	andi	a5,a5,511
    80007770:	2781                	sext.w	a5,a5
    80007772:	fc843703          	ld	a4,-56(s0)
    80007776:	1782                	slli	a5,a5,0x20
    80007778:	9381                	srli	a5,a5,0x20
    8000777a:	97ba                	add	a5,a5,a4
    8000777c:	0187c783          	lbu	a5,24(a5)
    80007780:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007784:	fe043783          	ld	a5,-32(s0)
    80007788:	6ba8                	ld	a0,80(a5)
    8000778a:	fec42703          	lw	a4,-20(s0)
    8000778e:	fc043783          	ld	a5,-64(s0)
    80007792:	97ba                	add	a5,a5,a4
    80007794:	fdf40713          	addi	a4,s0,-33
    80007798:	4685                	li	a3,1
    8000779a:	863a                	mv	a2,a4
    8000779c:	85be                	mv	a1,a5
    8000779e:	ffffb097          	auipc	ra,0xffffb
    800077a2:	1b2080e7          	jalr	434(ra) # 80002950 <copyout>
    800077a6:	87aa                	mv	a5,a0
    800077a8:	873e                	mv	a4,a5
    800077aa:	57fd                	li	a5,-1
    800077ac:	02f70263          	beq	a4,a5,800077d0 <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800077b0:	fec42783          	lw	a5,-20(s0)
    800077b4:	2785                	addiw	a5,a5,1
    800077b6:	fef42623          	sw	a5,-20(s0)
    800077ba:	fec42703          	lw	a4,-20(s0)
    800077be:	fbc42783          	lw	a5,-68(s0)
    800077c2:	2701                	sext.w	a4,a4
    800077c4:	2781                	sext.w	a5,a5
    800077c6:	f6f74ce3          	blt	a4,a5,8000773e <piperead+0x90>
    800077ca:	a021                	j	800077d2 <piperead+0x124>
      break;
    800077cc:	0001                	nop
    800077ce:	a011                	j	800077d2 <piperead+0x124>
      break;
    800077d0:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800077d2:	fc843783          	ld	a5,-56(s0)
    800077d6:	21c78793          	addi	a5,a5,540
    800077da:	853e                	mv	a0,a5
    800077dc:	ffffc097          	auipc	ra,0xffffc
    800077e0:	2e8080e7          	jalr	744(ra) # 80003ac4 <wakeup>
  release(&pi->lock);
    800077e4:	fc843783          	ld	a5,-56(s0)
    800077e8:	853e                	mv	a0,a5
    800077ea:	ffffa097          	auipc	ra,0xffffa
    800077ee:	be2080e7          	jalr	-1054(ra) # 800013cc <release>
  return i;
    800077f2:	fec42783          	lw	a5,-20(s0)
}
    800077f6:	853e                	mv	a0,a5
    800077f8:	60a6                	ld	ra,72(sp)
    800077fa:	6406                	ld	s0,64(sp)
    800077fc:	6161                	addi	sp,sp,80
    800077fe:	8082                	ret

0000000080007800 <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    80007800:	7179                	addi	sp,sp,-48
    80007802:	f422                	sd	s0,40(sp)
    80007804:	1800                	addi	s0,sp,48
    80007806:	87aa                	mv	a5,a0
    80007808:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    8000780c:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    80007810:	fdc42783          	lw	a5,-36(s0)
    80007814:	8b85                	andi	a5,a5,1
    80007816:	2781                	sext.w	a5,a5
    80007818:	c781                	beqz	a5,80007820 <flags2perm+0x20>
      perm = PTE_X;
    8000781a:	47a1                	li	a5,8
    8000781c:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    80007820:	fdc42783          	lw	a5,-36(s0)
    80007824:	8b89                	andi	a5,a5,2
    80007826:	2781                	sext.w	a5,a5
    80007828:	c799                	beqz	a5,80007836 <flags2perm+0x36>
      perm |= PTE_W;
    8000782a:	fec42783          	lw	a5,-20(s0)
    8000782e:	0047e793          	ori	a5,a5,4
    80007832:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007836:	fec42783          	lw	a5,-20(s0)
}
    8000783a:	853e                	mv	a0,a5
    8000783c:	7422                	ld	s0,40(sp)
    8000783e:	6145                	addi	sp,sp,48
    80007840:	8082                	ret

0000000080007842 <exec>:

int
exec(char *path, char **argv)
{
    80007842:	de010113          	addi	sp,sp,-544
    80007846:	20113c23          	sd	ra,536(sp)
    8000784a:	20813823          	sd	s0,528(sp)
    8000784e:	20913423          	sd	s1,520(sp)
    80007852:	1400                	addi	s0,sp,544
    80007854:	dea43423          	sd	a0,-536(s0)
    80007858:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    8000785c:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007860:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007864:	ffffb097          	auipc	ra,0xffffb
    80007868:	622080e7          	jalr	1570(ra) # 80002e86 <myproc>
    8000786c:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007870:	fffff097          	auipc	ra,0xfffff
    80007874:	f40080e7          	jalr	-192(ra) # 800067b0 <begin_op>

  if((ip = namei(path)) == 0){
    80007878:	de843503          	ld	a0,-536(s0)
    8000787c:	fffff097          	auipc	ra,0xfffff
    80007880:	bd0080e7          	jalr	-1072(ra) # 8000644c <namei>
    80007884:	faa43423          	sd	a0,-88(s0)
    80007888:	fa843783          	ld	a5,-88(s0)
    8000788c:	e799                	bnez	a5,8000789a <exec+0x58>
    end_op();
    8000788e:	fffff097          	auipc	ra,0xfffff
    80007892:	fe4080e7          	jalr	-28(ra) # 80006872 <end_op>
    return -1;
    80007896:	57fd                	li	a5,-1
    80007898:	a1a9                	j	80007ce2 <exec+0x4a0>
  }
  ilock(ip);
    8000789a:	fa843503          	ld	a0,-88(s0)
    8000789e:	ffffe097          	auipc	ra,0xffffe
    800078a2:	e88080e7          	jalr	-376(ra) # 80005726 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800078a6:	e3040793          	addi	a5,s0,-464
    800078aa:	04000713          	li	a4,64
    800078ae:	4681                	li	a3,0
    800078b0:	863e                	mv	a2,a5
    800078b2:	4581                	li	a1,0
    800078b4:	fa843503          	ld	a0,-88(s0)
    800078b8:	ffffe097          	auipc	ra,0xffffe
    800078bc:	424080e7          	jalr	1060(ra) # 80005cdc <readi>
    800078c0:	87aa                	mv	a5,a0
    800078c2:	873e                	mv	a4,a5
    800078c4:	04000793          	li	a5,64
    800078c8:	3af71763          	bne	a4,a5,80007c76 <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800078cc:	e3042783          	lw	a5,-464(s0)
    800078d0:	873e                	mv	a4,a5
    800078d2:	464c47b7          	lui	a5,0x464c4
    800078d6:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800078da:	3af71063          	bne	a4,a5,80007c7a <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800078de:	f9843503          	ld	a0,-104(s0)
    800078e2:	ffffc097          	auipc	ra,0xffffc
    800078e6:	806080e7          	jalr	-2042(ra) # 800030e8 <proc_pagetable>
    800078ea:	faa43023          	sd	a0,-96(s0)
    800078ee:	fa043783          	ld	a5,-96(s0)
    800078f2:	38078663          	beqz	a5,80007c7e <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800078f6:	fc042623          	sw	zero,-52(s0)
    800078fa:	e5043783          	ld	a5,-432(s0)
    800078fe:	fcf42423          	sw	a5,-56(s0)
    80007902:	a0fd                	j	800079f0 <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80007904:	df840793          	addi	a5,s0,-520
    80007908:	fc842683          	lw	a3,-56(s0)
    8000790c:	03800713          	li	a4,56
    80007910:	863e                	mv	a2,a5
    80007912:	4581                	li	a1,0
    80007914:	fa843503          	ld	a0,-88(s0)
    80007918:	ffffe097          	auipc	ra,0xffffe
    8000791c:	3c4080e7          	jalr	964(ra) # 80005cdc <readi>
    80007920:	87aa                	mv	a5,a0
    80007922:	873e                	mv	a4,a5
    80007924:	03800793          	li	a5,56
    80007928:	34f71d63          	bne	a4,a5,80007c82 <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    8000792c:	df842783          	lw	a5,-520(s0)
    80007930:	873e                	mv	a4,a5
    80007932:	4785                	li	a5,1
    80007934:	0af71163          	bne	a4,a5,800079d6 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    80007938:	e2043703          	ld	a4,-480(s0)
    8000793c:	e1843783          	ld	a5,-488(s0)
    80007940:	34f76363          	bltu	a4,a5,80007c86 <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007944:	e0843703          	ld	a4,-504(s0)
    80007948:	e2043783          	ld	a5,-480(s0)
    8000794c:	973e                	add	a4,a4,a5
    8000794e:	e0843783          	ld	a5,-504(s0)
    80007952:	32f76c63          	bltu	a4,a5,80007c8a <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007956:	e0843703          	ld	a4,-504(s0)
    8000795a:	6785                	lui	a5,0x1
    8000795c:	17fd                	addi	a5,a5,-1
    8000795e:	8ff9                	and	a5,a5,a4
    80007960:	32079763          	bnez	a5,80007c8e <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007964:	e0843703          	ld	a4,-504(s0)
    80007968:	e2043783          	ld	a5,-480(s0)
    8000796c:	00f704b3          	add	s1,a4,a5
    80007970:	dfc42783          	lw	a5,-516(s0)
    80007974:	2781                	sext.w	a5,a5
    80007976:	853e                	mv	a0,a5
    80007978:	00000097          	auipc	ra,0x0
    8000797c:	e88080e7          	jalr	-376(ra) # 80007800 <flags2perm>
    80007980:	87aa                	mv	a5,a0
    80007982:	86be                	mv	a3,a5
    80007984:	8626                	mv	a2,s1
    80007986:	fb843583          	ld	a1,-72(s0)
    8000798a:	fa043503          	ld	a0,-96(s0)
    8000798e:	ffffb097          	auipc	ra,0xffffb
    80007992:	bca080e7          	jalr	-1078(ra) # 80002558 <uvmalloc>
    80007996:	f6a43823          	sd	a0,-144(s0)
    8000799a:	f7043783          	ld	a5,-144(s0)
    8000799e:	2e078a63          	beqz	a5,80007c92 <exec+0x450>
      goto bad;
    sz = sz1;
    800079a2:	f7043783          	ld	a5,-144(s0)
    800079a6:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800079aa:	e0843783          	ld	a5,-504(s0)
    800079ae:	e0043703          	ld	a4,-512(s0)
    800079b2:	0007069b          	sext.w	a3,a4
    800079b6:	e1843703          	ld	a4,-488(s0)
    800079ba:	2701                	sext.w	a4,a4
    800079bc:	fa843603          	ld	a2,-88(s0)
    800079c0:	85be                	mv	a1,a5
    800079c2:	fa043503          	ld	a0,-96(s0)
    800079c6:	00000097          	auipc	ra,0x0
    800079ca:	330080e7          	jalr	816(ra) # 80007cf6 <loadseg>
    800079ce:	87aa                	mv	a5,a0
    800079d0:	2c07c363          	bltz	a5,80007c96 <exec+0x454>
    800079d4:	a011                	j	800079d8 <exec+0x196>
      continue;
    800079d6:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800079d8:	fcc42783          	lw	a5,-52(s0)
    800079dc:	2785                	addiw	a5,a5,1
    800079de:	fcf42623          	sw	a5,-52(s0)
    800079e2:	fc842783          	lw	a5,-56(s0)
    800079e6:	0387879b          	addiw	a5,a5,56
    800079ea:	2781                	sext.w	a5,a5
    800079ec:	fcf42423          	sw	a5,-56(s0)
    800079f0:	e6845783          	lhu	a5,-408(s0)
    800079f4:	0007871b          	sext.w	a4,a5
    800079f8:	fcc42783          	lw	a5,-52(s0)
    800079fc:	2781                	sext.w	a5,a5
    800079fe:	f0e7c3e3          	blt	a5,a4,80007904 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007a02:	fa843503          	ld	a0,-88(s0)
    80007a06:	ffffe097          	auipc	ra,0xffffe
    80007a0a:	f7e080e7          	jalr	-130(ra) # 80005984 <iunlockput>
  end_op();
    80007a0e:	fffff097          	auipc	ra,0xfffff
    80007a12:	e64080e7          	jalr	-412(ra) # 80006872 <end_op>
  ip = 0;
    80007a16:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    80007a1a:	ffffb097          	auipc	ra,0xffffb
    80007a1e:	46c080e7          	jalr	1132(ra) # 80002e86 <myproc>
    80007a22:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007a26:	f9843783          	ld	a5,-104(s0)
    80007a2a:	67bc                	ld	a5,72(a5)
    80007a2c:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007a30:	fb843703          	ld	a4,-72(s0)
    80007a34:	6785                	lui	a5,0x1
    80007a36:	17fd                	addi	a5,a5,-1
    80007a38:	973e                	add	a4,a4,a5
    80007a3a:	77fd                	lui	a5,0xfffff
    80007a3c:	8ff9                	and	a5,a5,a4
    80007a3e:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    80007a42:	fb843703          	ld	a4,-72(s0)
    80007a46:	6789                	lui	a5,0x2
    80007a48:	97ba                	add	a5,a5,a4
    80007a4a:	4691                	li	a3,4
    80007a4c:	863e                	mv	a2,a5
    80007a4e:	fb843583          	ld	a1,-72(s0)
    80007a52:	fa043503          	ld	a0,-96(s0)
    80007a56:	ffffb097          	auipc	ra,0xffffb
    80007a5a:	b02080e7          	jalr	-1278(ra) # 80002558 <uvmalloc>
    80007a5e:	f8a43423          	sd	a0,-120(s0)
    80007a62:	f8843783          	ld	a5,-120(s0)
    80007a66:	22078a63          	beqz	a5,80007c9a <exec+0x458>
    goto bad;
  sz = sz1;
    80007a6a:	f8843783          	ld	a5,-120(s0)
    80007a6e:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007a72:	fb843703          	ld	a4,-72(s0)
    80007a76:	77f9                	lui	a5,0xffffe
    80007a78:	97ba                	add	a5,a5,a4
    80007a7a:	85be                	mv	a1,a5
    80007a7c:	fa043503          	ld	a0,-96(s0)
    80007a80:	ffffb097          	auipc	ra,0xffffb
    80007a84:	e6e080e7          	jalr	-402(ra) # 800028ee <uvmclear>
  sp = sz;
    80007a88:	fb843783          	ld	a5,-72(s0)
    80007a8c:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007a90:	fb043703          	ld	a4,-80(s0)
    80007a94:	77fd                	lui	a5,0xfffff
    80007a96:	97ba                	add	a5,a5,a4
    80007a98:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007a9c:	fc043023          	sd	zero,-64(s0)
    80007aa0:	a845                	j	80007b50 <exec+0x30e>
    if(argc >= MAXARG)
    80007aa2:	fc043703          	ld	a4,-64(s0)
    80007aa6:	47fd                	li	a5,31
    80007aa8:	1ee7eb63          	bltu	a5,a4,80007c9e <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007aac:	fc043783          	ld	a5,-64(s0)
    80007ab0:	078e                	slli	a5,a5,0x3
    80007ab2:	de043703          	ld	a4,-544(s0)
    80007ab6:	97ba                	add	a5,a5,a4
    80007ab8:	639c                	ld	a5,0(a5)
    80007aba:	853e                	mv	a0,a5
    80007abc:	ffffa097          	auipc	ra,0xffffa
    80007ac0:	dfe080e7          	jalr	-514(ra) # 800018ba <strlen>
    80007ac4:	87aa                	mv	a5,a0
    80007ac6:	2785                	addiw	a5,a5,1
    80007ac8:	2781                	sext.w	a5,a5
    80007aca:	873e                	mv	a4,a5
    80007acc:	fb043783          	ld	a5,-80(s0)
    80007ad0:	8f99                	sub	a5,a5,a4
    80007ad2:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007ad6:	fb043783          	ld	a5,-80(s0)
    80007ada:	9bc1                	andi	a5,a5,-16
    80007adc:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007ae0:	fb043703          	ld	a4,-80(s0)
    80007ae4:	f8043783          	ld	a5,-128(s0)
    80007ae8:	1af76d63          	bltu	a4,a5,80007ca2 <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007aec:	fc043783          	ld	a5,-64(s0)
    80007af0:	078e                	slli	a5,a5,0x3
    80007af2:	de043703          	ld	a4,-544(s0)
    80007af6:	97ba                	add	a5,a5,a4
    80007af8:	6384                	ld	s1,0(a5)
    80007afa:	fc043783          	ld	a5,-64(s0)
    80007afe:	078e                	slli	a5,a5,0x3
    80007b00:	de043703          	ld	a4,-544(s0)
    80007b04:	97ba                	add	a5,a5,a4
    80007b06:	639c                	ld	a5,0(a5)
    80007b08:	853e                	mv	a0,a5
    80007b0a:	ffffa097          	auipc	ra,0xffffa
    80007b0e:	db0080e7          	jalr	-592(ra) # 800018ba <strlen>
    80007b12:	87aa                	mv	a5,a0
    80007b14:	2785                	addiw	a5,a5,1
    80007b16:	2781                	sext.w	a5,a5
    80007b18:	86be                	mv	a3,a5
    80007b1a:	8626                	mv	a2,s1
    80007b1c:	fb043583          	ld	a1,-80(s0)
    80007b20:	fa043503          	ld	a0,-96(s0)
    80007b24:	ffffb097          	auipc	ra,0xffffb
    80007b28:	e2c080e7          	jalr	-468(ra) # 80002950 <copyout>
    80007b2c:	87aa                	mv	a5,a0
    80007b2e:	1607cc63          	bltz	a5,80007ca6 <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    80007b32:	fc043783          	ld	a5,-64(s0)
    80007b36:	078e                	slli	a5,a5,0x3
    80007b38:	fe040713          	addi	a4,s0,-32
    80007b3c:	97ba                	add	a5,a5,a4
    80007b3e:	fb043703          	ld	a4,-80(s0)
    80007b42:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffa8b60>
  for(argc = 0; argv[argc]; argc++) {
    80007b46:	fc043783          	ld	a5,-64(s0)
    80007b4a:	0785                	addi	a5,a5,1
    80007b4c:	fcf43023          	sd	a5,-64(s0)
    80007b50:	fc043783          	ld	a5,-64(s0)
    80007b54:	078e                	slli	a5,a5,0x3
    80007b56:	de043703          	ld	a4,-544(s0)
    80007b5a:	97ba                	add	a5,a5,a4
    80007b5c:	639c                	ld	a5,0(a5)
    80007b5e:	f3b1                	bnez	a5,80007aa2 <exec+0x260>
  }
  ustack[argc] = 0;
    80007b60:	fc043783          	ld	a5,-64(s0)
    80007b64:	078e                	slli	a5,a5,0x3
    80007b66:	fe040713          	addi	a4,s0,-32
    80007b6a:	97ba                	add	a5,a5,a4
    80007b6c:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007b70:	fc043783          	ld	a5,-64(s0)
    80007b74:	0785                	addi	a5,a5,1
    80007b76:	078e                	slli	a5,a5,0x3
    80007b78:	fb043703          	ld	a4,-80(s0)
    80007b7c:	40f707b3          	sub	a5,a4,a5
    80007b80:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007b84:	fb043783          	ld	a5,-80(s0)
    80007b88:	9bc1                	andi	a5,a5,-16
    80007b8a:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007b8e:	fb043703          	ld	a4,-80(s0)
    80007b92:	f8043783          	ld	a5,-128(s0)
    80007b96:	10f76a63          	bltu	a4,a5,80007caa <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80007b9a:	fc043783          	ld	a5,-64(s0)
    80007b9e:	0785                	addi	a5,a5,1
    80007ba0:	00379713          	slli	a4,a5,0x3
    80007ba4:	e7040793          	addi	a5,s0,-400
    80007ba8:	86ba                	mv	a3,a4
    80007baa:	863e                	mv	a2,a5
    80007bac:	fb043583          	ld	a1,-80(s0)
    80007bb0:	fa043503          	ld	a0,-96(s0)
    80007bb4:	ffffb097          	auipc	ra,0xffffb
    80007bb8:	d9c080e7          	jalr	-612(ra) # 80002950 <copyout>
    80007bbc:	87aa                	mv	a5,a0
    80007bbe:	0e07c863          	bltz	a5,80007cae <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80007bc2:	f9843783          	ld	a5,-104(s0)
    80007bc6:	6fbc                	ld	a5,88(a5)
    80007bc8:	fb043703          	ld	a4,-80(s0)
    80007bcc:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    80007bce:	de843783          	ld	a5,-536(s0)
    80007bd2:	fcf43c23          	sd	a5,-40(s0)
    80007bd6:	fd843783          	ld	a5,-40(s0)
    80007bda:	fcf43823          	sd	a5,-48(s0)
    80007bde:	a025                	j	80007c06 <exec+0x3c4>
    if(*s == '/')
    80007be0:	fd843783          	ld	a5,-40(s0)
    80007be4:	0007c783          	lbu	a5,0(a5)
    80007be8:	873e                	mv	a4,a5
    80007bea:	02f00793          	li	a5,47
    80007bee:	00f71763          	bne	a4,a5,80007bfc <exec+0x3ba>
      last = s+1;
    80007bf2:	fd843783          	ld	a5,-40(s0)
    80007bf6:	0785                	addi	a5,a5,1
    80007bf8:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007bfc:	fd843783          	ld	a5,-40(s0)
    80007c00:	0785                	addi	a5,a5,1
    80007c02:	fcf43c23          	sd	a5,-40(s0)
    80007c06:	fd843783          	ld	a5,-40(s0)
    80007c0a:	0007c783          	lbu	a5,0(a5)
    80007c0e:	fbe9                	bnez	a5,80007be0 <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    80007c10:	f9843783          	ld	a5,-104(s0)
    80007c14:	15878793          	addi	a5,a5,344
    80007c18:	4641                	li	a2,16
    80007c1a:	fd043583          	ld	a1,-48(s0)
    80007c1e:	853e                	mv	a0,a5
    80007c20:	ffffa097          	auipc	ra,0xffffa
    80007c24:	c20080e7          	jalr	-992(ra) # 80001840 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007c28:	f9843783          	ld	a5,-104(s0)
    80007c2c:	6bbc                	ld	a5,80(a5)
    80007c2e:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007c32:	f9843783          	ld	a5,-104(s0)
    80007c36:	fa043703          	ld	a4,-96(s0)
    80007c3a:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007c3c:	f9843783          	ld	a5,-104(s0)
    80007c40:	fb843703          	ld	a4,-72(s0)
    80007c44:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007c46:	f9843783          	ld	a5,-104(s0)
    80007c4a:	6fbc                	ld	a5,88(a5)
    80007c4c:	e4843703          	ld	a4,-440(s0)
    80007c50:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007c52:	f9843783          	ld	a5,-104(s0)
    80007c56:	6fbc                	ld	a5,88(a5)
    80007c58:	fb043703          	ld	a4,-80(s0)
    80007c5c:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007c5e:	f9043583          	ld	a1,-112(s0)
    80007c62:	f7843503          	ld	a0,-136(s0)
    80007c66:	ffffb097          	auipc	ra,0xffffb
    80007c6a:	542080e7          	jalr	1346(ra) # 800031a8 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007c6e:	fc043783          	ld	a5,-64(s0)
    80007c72:	2781                	sext.w	a5,a5
    80007c74:	a0bd                	j	80007ce2 <exec+0x4a0>
    goto bad;
    80007c76:	0001                	nop
    80007c78:	a825                	j	80007cb0 <exec+0x46e>
    goto bad;
    80007c7a:	0001                	nop
    80007c7c:	a815                	j	80007cb0 <exec+0x46e>
    goto bad;
    80007c7e:	0001                	nop
    80007c80:	a805                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007c82:	0001                	nop
    80007c84:	a035                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007c86:	0001                	nop
    80007c88:	a025                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007c8a:	0001                	nop
    80007c8c:	a015                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007c8e:	0001                	nop
    80007c90:	a005                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007c92:	0001                	nop
    80007c94:	a831                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007c96:	0001                	nop
    80007c98:	a821                	j	80007cb0 <exec+0x46e>
    goto bad;
    80007c9a:	0001                	nop
    80007c9c:	a811                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007c9e:	0001                	nop
    80007ca0:	a801                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007ca2:	0001                	nop
    80007ca4:	a031                	j	80007cb0 <exec+0x46e>
      goto bad;
    80007ca6:	0001                	nop
    80007ca8:	a021                	j	80007cb0 <exec+0x46e>
    goto bad;
    80007caa:	0001                	nop
    80007cac:	a011                	j	80007cb0 <exec+0x46e>
    goto bad;
    80007cae:	0001                	nop

 bad:
  if(pagetable)
    80007cb0:	fa043783          	ld	a5,-96(s0)
    80007cb4:	cb89                	beqz	a5,80007cc6 <exec+0x484>
    proc_freepagetable(pagetable, sz);
    80007cb6:	fb843583          	ld	a1,-72(s0)
    80007cba:	fa043503          	ld	a0,-96(s0)
    80007cbe:	ffffb097          	auipc	ra,0xffffb
    80007cc2:	4ea080e7          	jalr	1258(ra) # 800031a8 <proc_freepagetable>
  if(ip){
    80007cc6:	fa843783          	ld	a5,-88(s0)
    80007cca:	cb99                	beqz	a5,80007ce0 <exec+0x49e>
    iunlockput(ip);
    80007ccc:	fa843503          	ld	a0,-88(s0)
    80007cd0:	ffffe097          	auipc	ra,0xffffe
    80007cd4:	cb4080e7          	jalr	-844(ra) # 80005984 <iunlockput>
    end_op();
    80007cd8:	fffff097          	auipc	ra,0xfffff
    80007cdc:	b9a080e7          	jalr	-1126(ra) # 80006872 <end_op>
  }
  return -1;
    80007ce0:	57fd                	li	a5,-1
}
    80007ce2:	853e                	mv	a0,a5
    80007ce4:	21813083          	ld	ra,536(sp)
    80007ce8:	21013403          	ld	s0,528(sp)
    80007cec:	20813483          	ld	s1,520(sp)
    80007cf0:	22010113          	addi	sp,sp,544
    80007cf4:	8082                	ret

0000000080007cf6 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007cf6:	7139                	addi	sp,sp,-64
    80007cf8:	fc06                	sd	ra,56(sp)
    80007cfa:	f822                	sd	s0,48(sp)
    80007cfc:	0080                	addi	s0,sp,64
    80007cfe:	fca43c23          	sd	a0,-40(s0)
    80007d02:	fcb43823          	sd	a1,-48(s0)
    80007d06:	fcc43423          	sd	a2,-56(s0)
    80007d0a:	87b6                	mv	a5,a3
    80007d0c:	fcf42223          	sw	a5,-60(s0)
    80007d10:	87ba                	mv	a5,a4
    80007d12:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007d16:	fe042623          	sw	zero,-20(s0)
    80007d1a:	a05d                	j	80007dc0 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    80007d1c:	fec46703          	lwu	a4,-20(s0)
    80007d20:	fd043783          	ld	a5,-48(s0)
    80007d24:	97ba                	add	a5,a5,a4
    80007d26:	85be                	mv	a1,a5
    80007d28:	fd843503          	ld	a0,-40(s0)
    80007d2c:	ffffa097          	auipc	ra,0xffffa
    80007d30:	43a080e7          	jalr	1082(ra) # 80002166 <walkaddr>
    80007d34:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007d38:	fe043783          	ld	a5,-32(s0)
    80007d3c:	eb89                	bnez	a5,80007d4e <loadseg+0x58>
      panic("loadseg: address should exist");
    80007d3e:	00005517          	auipc	a0,0x5
    80007d42:	8c250513          	addi	a0,a0,-1854 # 8000c600 <etext+0x600>
    80007d46:	ffff9097          	auipc	ra,0xffff9
    80007d4a:	f46080e7          	jalr	-186(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    80007d4e:	fc042703          	lw	a4,-64(s0)
    80007d52:	fec42783          	lw	a5,-20(s0)
    80007d56:	40f707bb          	subw	a5,a4,a5
    80007d5a:	2781                	sext.w	a5,a5
    80007d5c:	873e                	mv	a4,a5
    80007d5e:	6785                	lui	a5,0x1
    80007d60:	00f77b63          	bgeu	a4,a5,80007d76 <loadseg+0x80>
      n = sz - i;
    80007d64:	fc042703          	lw	a4,-64(s0)
    80007d68:	fec42783          	lw	a5,-20(s0)
    80007d6c:	40f707bb          	subw	a5,a4,a5
    80007d70:	fef42423          	sw	a5,-24(s0)
    80007d74:	a021                	j	80007d7c <loadseg+0x86>
    else
      n = PGSIZE;
    80007d76:	6785                	lui	a5,0x1
    80007d78:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007d7c:	fc442703          	lw	a4,-60(s0)
    80007d80:	fec42783          	lw	a5,-20(s0)
    80007d84:	9fb9                	addw	a5,a5,a4
    80007d86:	2781                	sext.w	a5,a5
    80007d88:	fe842703          	lw	a4,-24(s0)
    80007d8c:	86be                	mv	a3,a5
    80007d8e:	fe043603          	ld	a2,-32(s0)
    80007d92:	4581                	li	a1,0
    80007d94:	fc843503          	ld	a0,-56(s0)
    80007d98:	ffffe097          	auipc	ra,0xffffe
    80007d9c:	f44080e7          	jalr	-188(ra) # 80005cdc <readi>
    80007da0:	87aa                	mv	a5,a0
    80007da2:	0007871b          	sext.w	a4,a5
    80007da6:	fe842783          	lw	a5,-24(s0)
    80007daa:	2781                	sext.w	a5,a5
    80007dac:	00e78463          	beq	a5,a4,80007db4 <loadseg+0xbe>
      return -1;
    80007db0:	57fd                	li	a5,-1
    80007db2:	a005                	j	80007dd2 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007db4:	fec42703          	lw	a4,-20(s0)
    80007db8:	6785                	lui	a5,0x1
    80007dba:	9fb9                	addw	a5,a5,a4
    80007dbc:	fef42623          	sw	a5,-20(s0)
    80007dc0:	fec42703          	lw	a4,-20(s0)
    80007dc4:	fc042783          	lw	a5,-64(s0)
    80007dc8:	2701                	sext.w	a4,a4
    80007dca:	2781                	sext.w	a5,a5
    80007dcc:	f4f768e3          	bltu	a4,a5,80007d1c <loadseg+0x26>
  }
  
  return 0;
    80007dd0:	4781                	li	a5,0
}
    80007dd2:	853e                	mv	a0,a5
    80007dd4:	70e2                	ld	ra,56(sp)
    80007dd6:	7442                	ld	s0,48(sp)
    80007dd8:	6121                	addi	sp,sp,64
    80007dda:	8082                	ret

0000000080007ddc <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007ddc:	7139                	addi	sp,sp,-64
    80007dde:	fc06                	sd	ra,56(sp)
    80007de0:	f822                	sd	s0,48(sp)
    80007de2:	0080                	addi	s0,sp,64
    80007de4:	87aa                	mv	a5,a0
    80007de6:	fcb43823          	sd	a1,-48(s0)
    80007dea:	fcc43423          	sd	a2,-56(s0)
    80007dee:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    80007df2:	fe440713          	addi	a4,s0,-28
    80007df6:	fdc42783          	lw	a5,-36(s0)
    80007dfa:	85ba                	mv	a1,a4
    80007dfc:	853e                	mv	a0,a5
    80007dfe:	ffffd097          	auipc	ra,0xffffd
    80007e02:	980080e7          	jalr	-1664(ra) # 8000477e <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007e06:	fe442783          	lw	a5,-28(s0)
    80007e0a:	0207c863          	bltz	a5,80007e3a <argfd+0x5e>
    80007e0e:	fe442783          	lw	a5,-28(s0)
    80007e12:	873e                	mv	a4,a5
    80007e14:	47bd                	li	a5,15
    80007e16:	02e7c263          	blt	a5,a4,80007e3a <argfd+0x5e>
    80007e1a:	ffffb097          	auipc	ra,0xffffb
    80007e1e:	06c080e7          	jalr	108(ra) # 80002e86 <myproc>
    80007e22:	872a                	mv	a4,a0
    80007e24:	fe442783          	lw	a5,-28(s0)
    80007e28:	07e9                	addi	a5,a5,26
    80007e2a:	078e                	slli	a5,a5,0x3
    80007e2c:	97ba                	add	a5,a5,a4
    80007e2e:	639c                	ld	a5,0(a5)
    80007e30:	fef43423          	sd	a5,-24(s0)
    80007e34:	fe843783          	ld	a5,-24(s0)
    80007e38:	e399                	bnez	a5,80007e3e <argfd+0x62>
    return -1;
    80007e3a:	57fd                	li	a5,-1
    80007e3c:	a015                	j	80007e60 <argfd+0x84>
  if(pfd)
    80007e3e:	fd043783          	ld	a5,-48(s0)
    80007e42:	c791                	beqz	a5,80007e4e <argfd+0x72>
    *pfd = fd;
    80007e44:	fe442703          	lw	a4,-28(s0)
    80007e48:	fd043783          	ld	a5,-48(s0)
    80007e4c:	c398                	sw	a4,0(a5)
  if(pf)
    80007e4e:	fc843783          	ld	a5,-56(s0)
    80007e52:	c791                	beqz	a5,80007e5e <argfd+0x82>
    *pf = f;
    80007e54:	fc843783          	ld	a5,-56(s0)
    80007e58:	fe843703          	ld	a4,-24(s0)
    80007e5c:	e398                	sd	a4,0(a5)
  return 0;
    80007e5e:	4781                	li	a5,0
}
    80007e60:	853e                	mv	a0,a5
    80007e62:	70e2                	ld	ra,56(sp)
    80007e64:	7442                	ld	s0,48(sp)
    80007e66:	6121                	addi	sp,sp,64
    80007e68:	8082                	ret

0000000080007e6a <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007e6a:	7179                	addi	sp,sp,-48
    80007e6c:	f406                	sd	ra,40(sp)
    80007e6e:	f022                	sd	s0,32(sp)
    80007e70:	1800                	addi	s0,sp,48
    80007e72:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007e76:	ffffb097          	auipc	ra,0xffffb
    80007e7a:	010080e7          	jalr	16(ra) # 80002e86 <myproc>
    80007e7e:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007e82:	fe042623          	sw	zero,-20(s0)
    80007e86:	a825                	j	80007ebe <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007e88:	fe043703          	ld	a4,-32(s0)
    80007e8c:	fec42783          	lw	a5,-20(s0)
    80007e90:	07e9                	addi	a5,a5,26
    80007e92:	078e                	slli	a5,a5,0x3
    80007e94:	97ba                	add	a5,a5,a4
    80007e96:	639c                	ld	a5,0(a5)
    80007e98:	ef91                	bnez	a5,80007eb4 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007e9a:	fe043703          	ld	a4,-32(s0)
    80007e9e:	fec42783          	lw	a5,-20(s0)
    80007ea2:	07e9                	addi	a5,a5,26
    80007ea4:	078e                	slli	a5,a5,0x3
    80007ea6:	97ba                	add	a5,a5,a4
    80007ea8:	fd843703          	ld	a4,-40(s0)
    80007eac:	e398                	sd	a4,0(a5)
      return fd;
    80007eae:	fec42783          	lw	a5,-20(s0)
    80007eb2:	a831                	j	80007ece <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007eb4:	fec42783          	lw	a5,-20(s0)
    80007eb8:	2785                	addiw	a5,a5,1
    80007eba:	fef42623          	sw	a5,-20(s0)
    80007ebe:	fec42783          	lw	a5,-20(s0)
    80007ec2:	0007871b          	sext.w	a4,a5
    80007ec6:	47bd                	li	a5,15
    80007ec8:	fce7d0e3          	bge	a5,a4,80007e88 <fdalloc+0x1e>
    }
  }
  return -1;
    80007ecc:	57fd                	li	a5,-1
}
    80007ece:	853e                	mv	a0,a5
    80007ed0:	70a2                	ld	ra,40(sp)
    80007ed2:	7402                	ld	s0,32(sp)
    80007ed4:	6145                	addi	sp,sp,48
    80007ed6:	8082                	ret

0000000080007ed8 <sys_dup>:

uint64
sys_dup(void)
{
    80007ed8:	1101                	addi	sp,sp,-32
    80007eda:	ec06                	sd	ra,24(sp)
    80007edc:	e822                	sd	s0,16(sp)
    80007ede:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007ee0:	fe040793          	addi	a5,s0,-32
    80007ee4:	863e                	mv	a2,a5
    80007ee6:	4581                	li	a1,0
    80007ee8:	4501                	li	a0,0
    80007eea:	00000097          	auipc	ra,0x0
    80007eee:	ef2080e7          	jalr	-270(ra) # 80007ddc <argfd>
    80007ef2:	87aa                	mv	a5,a0
    80007ef4:	0007d463          	bgez	a5,80007efc <sys_dup+0x24>
    return -1;
    80007ef8:	57fd                	li	a5,-1
    80007efa:	a81d                	j	80007f30 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007efc:	fe043783          	ld	a5,-32(s0)
    80007f00:	853e                	mv	a0,a5
    80007f02:	00000097          	auipc	ra,0x0
    80007f06:	f68080e7          	jalr	-152(ra) # 80007e6a <fdalloc>
    80007f0a:	87aa                	mv	a5,a0
    80007f0c:	fef42623          	sw	a5,-20(s0)
    80007f10:	fec42783          	lw	a5,-20(s0)
    80007f14:	2781                	sext.w	a5,a5
    80007f16:	0007d463          	bgez	a5,80007f1e <sys_dup+0x46>
    return -1;
    80007f1a:	57fd                	li	a5,-1
    80007f1c:	a811                	j	80007f30 <sys_dup+0x58>
  filedup(f);
    80007f1e:	fe043783          	ld	a5,-32(s0)
    80007f22:	853e                	mv	a0,a5
    80007f24:	fffff097          	auipc	ra,0xfffff
    80007f28:	ec0080e7          	jalr	-320(ra) # 80006de4 <filedup>
  return fd;
    80007f2c:	fec42783          	lw	a5,-20(s0)
}
    80007f30:	853e                	mv	a0,a5
    80007f32:	60e2                	ld	ra,24(sp)
    80007f34:	6442                	ld	s0,16(sp)
    80007f36:	6105                	addi	sp,sp,32
    80007f38:	8082                	ret

0000000080007f3a <sys_read>:

uint64
sys_read(void)
{
    80007f3a:	7179                	addi	sp,sp,-48
    80007f3c:	f406                	sd	ra,40(sp)
    80007f3e:	f022                	sd	s0,32(sp)
    80007f40:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007f42:	fd840793          	addi	a5,s0,-40
    80007f46:	85be                	mv	a1,a5
    80007f48:	4505                	li	a0,1
    80007f4a:	ffffd097          	auipc	ra,0xffffd
    80007f4e:	86a080e7          	jalr	-1942(ra) # 800047b4 <argaddr>
  argint(2, &n);
    80007f52:	fe440793          	addi	a5,s0,-28
    80007f56:	85be                	mv	a1,a5
    80007f58:	4509                	li	a0,2
    80007f5a:	ffffd097          	auipc	ra,0xffffd
    80007f5e:	824080e7          	jalr	-2012(ra) # 8000477e <argint>
  if(argfd(0, 0, &f) < 0)
    80007f62:	fe840793          	addi	a5,s0,-24
    80007f66:	863e                	mv	a2,a5
    80007f68:	4581                	li	a1,0
    80007f6a:	4501                	li	a0,0
    80007f6c:	00000097          	auipc	ra,0x0
    80007f70:	e70080e7          	jalr	-400(ra) # 80007ddc <argfd>
    80007f74:	87aa                	mv	a5,a0
    80007f76:	0007d463          	bgez	a5,80007f7e <sys_read+0x44>
    return -1;
    80007f7a:	57fd                	li	a5,-1
    80007f7c:	a839                	j	80007f9a <sys_read+0x60>
  return fileread(f, p, n);
    80007f7e:	fe843783          	ld	a5,-24(s0)
    80007f82:	fd843703          	ld	a4,-40(s0)
    80007f86:	fe442683          	lw	a3,-28(s0)
    80007f8a:	8636                	mv	a2,a3
    80007f8c:	85ba                	mv	a1,a4
    80007f8e:	853e                	mv	a0,a5
    80007f90:	fffff097          	auipc	ra,0xfffff
    80007f94:	066080e7          	jalr	102(ra) # 80006ff6 <fileread>
    80007f98:	87aa                	mv	a5,a0
}
    80007f9a:	853e                	mv	a0,a5
    80007f9c:	70a2                	ld	ra,40(sp)
    80007f9e:	7402                	ld	s0,32(sp)
    80007fa0:	6145                	addi	sp,sp,48
    80007fa2:	8082                	ret

0000000080007fa4 <sys_write>:

uint64
sys_write(void)
{
    80007fa4:	7179                	addi	sp,sp,-48
    80007fa6:	f406                	sd	ra,40(sp)
    80007fa8:	f022                	sd	s0,32(sp)
    80007faa:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007fac:	fd840793          	addi	a5,s0,-40
    80007fb0:	85be                	mv	a1,a5
    80007fb2:	4505                	li	a0,1
    80007fb4:	ffffd097          	auipc	ra,0xffffd
    80007fb8:	800080e7          	jalr	-2048(ra) # 800047b4 <argaddr>
  argint(2, &n);
    80007fbc:	fe440793          	addi	a5,s0,-28
    80007fc0:	85be                	mv	a1,a5
    80007fc2:	4509                	li	a0,2
    80007fc4:	ffffc097          	auipc	ra,0xffffc
    80007fc8:	7ba080e7          	jalr	1978(ra) # 8000477e <argint>
  if(argfd(0, 0, &f) < 0)
    80007fcc:	fe840793          	addi	a5,s0,-24
    80007fd0:	863e                	mv	a2,a5
    80007fd2:	4581                	li	a1,0
    80007fd4:	4501                	li	a0,0
    80007fd6:	00000097          	auipc	ra,0x0
    80007fda:	e06080e7          	jalr	-506(ra) # 80007ddc <argfd>
    80007fde:	87aa                	mv	a5,a0
    80007fe0:	0007d463          	bgez	a5,80007fe8 <sys_write+0x44>
    return -1;
    80007fe4:	57fd                	li	a5,-1
    80007fe6:	a839                	j	80008004 <sys_write+0x60>

  return filewrite(f, p, n);
    80007fe8:	fe843783          	ld	a5,-24(s0)
    80007fec:	fd843703          	ld	a4,-40(s0)
    80007ff0:	fe442683          	lw	a3,-28(s0)
    80007ff4:	8636                	mv	a2,a3
    80007ff6:	85ba                	mv	a1,a4
    80007ff8:	853e                	mv	a0,a5
    80007ffa:	fffff097          	auipc	ra,0xfffff
    80007ffe:	162080e7          	jalr	354(ra) # 8000715c <filewrite>
    80008002:	87aa                	mv	a5,a0
}
    80008004:	853e                	mv	a0,a5
    80008006:	70a2                	ld	ra,40(sp)
    80008008:	7402                	ld	s0,32(sp)
    8000800a:	6145                	addi	sp,sp,48
    8000800c:	8082                	ret

000000008000800e <sys_close>:

uint64
sys_close(void)
{
    8000800e:	1101                	addi	sp,sp,-32
    80008010:	ec06                	sd	ra,24(sp)
    80008012:	e822                	sd	s0,16(sp)
    80008014:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80008016:	fe040713          	addi	a4,s0,-32
    8000801a:	fec40793          	addi	a5,s0,-20
    8000801e:	863a                	mv	a2,a4
    80008020:	85be                	mv	a1,a5
    80008022:	4501                	li	a0,0
    80008024:	00000097          	auipc	ra,0x0
    80008028:	db8080e7          	jalr	-584(ra) # 80007ddc <argfd>
    8000802c:	87aa                	mv	a5,a0
    8000802e:	0007d463          	bgez	a5,80008036 <sys_close+0x28>
    return -1;
    80008032:	57fd                	li	a5,-1
    80008034:	a02d                	j	8000805e <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80008036:	ffffb097          	auipc	ra,0xffffb
    8000803a:	e50080e7          	jalr	-432(ra) # 80002e86 <myproc>
    8000803e:	872a                	mv	a4,a0
    80008040:	fec42783          	lw	a5,-20(s0)
    80008044:	07e9                	addi	a5,a5,26
    80008046:	078e                	slli	a5,a5,0x3
    80008048:	97ba                	add	a5,a5,a4
    8000804a:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    8000804e:	fe043783          	ld	a5,-32(s0)
    80008052:	853e                	mv	a0,a5
    80008054:	fffff097          	auipc	ra,0xfffff
    80008058:	df6080e7          	jalr	-522(ra) # 80006e4a <fileclose>
  return 0;
    8000805c:	4781                	li	a5,0
}
    8000805e:	853e                	mv	a0,a5
    80008060:	60e2                	ld	ra,24(sp)
    80008062:	6442                	ld	s0,16(sp)
    80008064:	6105                	addi	sp,sp,32
    80008066:	8082                	ret

0000000080008068 <sys_fstat>:

uint64
sys_fstat(void)
{
    80008068:	1101                	addi	sp,sp,-32
    8000806a:	ec06                	sd	ra,24(sp)
    8000806c:	e822                	sd	s0,16(sp)
    8000806e:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80008070:	fe040793          	addi	a5,s0,-32
    80008074:	85be                	mv	a1,a5
    80008076:	4505                	li	a0,1
    80008078:	ffffc097          	auipc	ra,0xffffc
    8000807c:	73c080e7          	jalr	1852(ra) # 800047b4 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80008080:	fe840793          	addi	a5,s0,-24
    80008084:	863e                	mv	a2,a5
    80008086:	4581                	li	a1,0
    80008088:	4501                	li	a0,0
    8000808a:	00000097          	auipc	ra,0x0
    8000808e:	d52080e7          	jalr	-686(ra) # 80007ddc <argfd>
    80008092:	87aa                	mv	a5,a0
    80008094:	0007d463          	bgez	a5,8000809c <sys_fstat+0x34>
    return -1;
    80008098:	57fd                	li	a5,-1
    8000809a:	a821                	j	800080b2 <sys_fstat+0x4a>
  return filestat(f, st);
    8000809c:	fe843783          	ld	a5,-24(s0)
    800080a0:	fe043703          	ld	a4,-32(s0)
    800080a4:	85ba                	mv	a1,a4
    800080a6:	853e                	mv	a0,a5
    800080a8:	fffff097          	auipc	ra,0xfffff
    800080ac:	eaa080e7          	jalr	-342(ra) # 80006f52 <filestat>
    800080b0:	87aa                	mv	a5,a0
}
    800080b2:	853e                	mv	a0,a5
    800080b4:	60e2                	ld	ra,24(sp)
    800080b6:	6442                	ld	s0,16(sp)
    800080b8:	6105                	addi	sp,sp,32
    800080ba:	8082                	ret

00000000800080bc <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    800080bc:	7169                	addi	sp,sp,-304
    800080be:	f606                	sd	ra,296(sp)
    800080c0:	f222                	sd	s0,288(sp)
    800080c2:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    800080c4:	ed040793          	addi	a5,s0,-304
    800080c8:	08000613          	li	a2,128
    800080cc:	85be                	mv	a1,a5
    800080ce:	4501                	li	a0,0
    800080d0:	ffffc097          	auipc	ra,0xffffc
    800080d4:	716080e7          	jalr	1814(ra) # 800047e6 <argstr>
    800080d8:	87aa                	mv	a5,a0
    800080da:	0007cf63          	bltz	a5,800080f8 <sys_link+0x3c>
    800080de:	f5040793          	addi	a5,s0,-176
    800080e2:	08000613          	li	a2,128
    800080e6:	85be                	mv	a1,a5
    800080e8:	4505                	li	a0,1
    800080ea:	ffffc097          	auipc	ra,0xffffc
    800080ee:	6fc080e7          	jalr	1788(ra) # 800047e6 <argstr>
    800080f2:	87aa                	mv	a5,a0
    800080f4:	0007d463          	bgez	a5,800080fc <sys_link+0x40>
    return -1;
    800080f8:	57fd                	li	a5,-1
    800080fa:	aab5                	j	80008276 <sys_link+0x1ba>

  begin_op();
    800080fc:	ffffe097          	auipc	ra,0xffffe
    80008100:	6b4080e7          	jalr	1716(ra) # 800067b0 <begin_op>
  if((ip = namei(old)) == 0){
    80008104:	ed040793          	addi	a5,s0,-304
    80008108:	853e                	mv	a0,a5
    8000810a:	ffffe097          	auipc	ra,0xffffe
    8000810e:	342080e7          	jalr	834(ra) # 8000644c <namei>
    80008112:	fea43423          	sd	a0,-24(s0)
    80008116:	fe843783          	ld	a5,-24(s0)
    8000811a:	e799                	bnez	a5,80008128 <sys_link+0x6c>
    end_op();
    8000811c:	ffffe097          	auipc	ra,0xffffe
    80008120:	756080e7          	jalr	1878(ra) # 80006872 <end_op>
    return -1;
    80008124:	57fd                	li	a5,-1
    80008126:	aa81                	j	80008276 <sys_link+0x1ba>
  }

  ilock(ip);
    80008128:	fe843503          	ld	a0,-24(s0)
    8000812c:	ffffd097          	auipc	ra,0xffffd
    80008130:	5fa080e7          	jalr	1530(ra) # 80005726 <ilock>
  if(ip->type == T_DIR){
    80008134:	fe843783          	ld	a5,-24(s0)
    80008138:	04479783          	lh	a5,68(a5)
    8000813c:	0007871b          	sext.w	a4,a5
    80008140:	4785                	li	a5,1
    80008142:	00f71e63          	bne	a4,a5,8000815e <sys_link+0xa2>
    iunlockput(ip);
    80008146:	fe843503          	ld	a0,-24(s0)
    8000814a:	ffffe097          	auipc	ra,0xffffe
    8000814e:	83a080e7          	jalr	-1990(ra) # 80005984 <iunlockput>
    end_op();
    80008152:	ffffe097          	auipc	ra,0xffffe
    80008156:	720080e7          	jalr	1824(ra) # 80006872 <end_op>
    return -1;
    8000815a:	57fd                	li	a5,-1
    8000815c:	aa29                	j	80008276 <sys_link+0x1ba>
  }

  ip->nlink++;
    8000815e:	fe843783          	ld	a5,-24(s0)
    80008162:	04a79783          	lh	a5,74(a5)
    80008166:	17c2                	slli	a5,a5,0x30
    80008168:	93c1                	srli	a5,a5,0x30
    8000816a:	2785                	addiw	a5,a5,1
    8000816c:	17c2                	slli	a5,a5,0x30
    8000816e:	93c1                	srli	a5,a5,0x30
    80008170:	0107971b          	slliw	a4,a5,0x10
    80008174:	4107571b          	sraiw	a4,a4,0x10
    80008178:	fe843783          	ld	a5,-24(s0)
    8000817c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008180:	fe843503          	ld	a0,-24(s0)
    80008184:	ffffd097          	auipc	ra,0xffffd
    80008188:	352080e7          	jalr	850(ra) # 800054d6 <iupdate>
  iunlock(ip);
    8000818c:	fe843503          	ld	a0,-24(s0)
    80008190:	ffffd097          	auipc	ra,0xffffd
    80008194:	6ca080e7          	jalr	1738(ra) # 8000585a <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80008198:	fd040713          	addi	a4,s0,-48
    8000819c:	f5040793          	addi	a5,s0,-176
    800081a0:	85ba                	mv	a1,a4
    800081a2:	853e                	mv	a0,a5
    800081a4:	ffffe097          	auipc	ra,0xffffe
    800081a8:	2d4080e7          	jalr	724(ra) # 80006478 <nameiparent>
    800081ac:	fea43023          	sd	a0,-32(s0)
    800081b0:	fe043783          	ld	a5,-32(s0)
    800081b4:	cba5                	beqz	a5,80008224 <sys_link+0x168>
    goto bad;
  ilock(dp);
    800081b6:	fe043503          	ld	a0,-32(s0)
    800081ba:	ffffd097          	auipc	ra,0xffffd
    800081be:	56c080e7          	jalr	1388(ra) # 80005726 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    800081c2:	fe043783          	ld	a5,-32(s0)
    800081c6:	4398                	lw	a4,0(a5)
    800081c8:	fe843783          	ld	a5,-24(s0)
    800081cc:	439c                	lw	a5,0(a5)
    800081ce:	02f71263          	bne	a4,a5,800081f2 <sys_link+0x136>
    800081d2:	fe843783          	ld	a5,-24(s0)
    800081d6:	43d8                	lw	a4,4(a5)
    800081d8:	fd040793          	addi	a5,s0,-48
    800081dc:	863a                	mv	a2,a4
    800081de:	85be                	mv	a1,a5
    800081e0:	fe043503          	ld	a0,-32(s0)
    800081e4:	ffffe097          	auipc	ra,0xffffe
    800081e8:	f5a080e7          	jalr	-166(ra) # 8000613e <dirlink>
    800081ec:	87aa                	mv	a5,a0
    800081ee:	0007d963          	bgez	a5,80008200 <sys_link+0x144>
    iunlockput(dp);
    800081f2:	fe043503          	ld	a0,-32(s0)
    800081f6:	ffffd097          	auipc	ra,0xffffd
    800081fa:	78e080e7          	jalr	1934(ra) # 80005984 <iunlockput>
    goto bad;
    800081fe:	a025                	j	80008226 <sys_link+0x16a>
  }
  iunlockput(dp);
    80008200:	fe043503          	ld	a0,-32(s0)
    80008204:	ffffd097          	auipc	ra,0xffffd
    80008208:	780080e7          	jalr	1920(ra) # 80005984 <iunlockput>
  iput(ip);
    8000820c:	fe843503          	ld	a0,-24(s0)
    80008210:	ffffd097          	auipc	ra,0xffffd
    80008214:	6a4080e7          	jalr	1700(ra) # 800058b4 <iput>

  end_op();
    80008218:	ffffe097          	auipc	ra,0xffffe
    8000821c:	65a080e7          	jalr	1626(ra) # 80006872 <end_op>

  return 0;
    80008220:	4781                	li	a5,0
    80008222:	a891                	j	80008276 <sys_link+0x1ba>
    goto bad;
    80008224:	0001                	nop

bad:
  ilock(ip);
    80008226:	fe843503          	ld	a0,-24(s0)
    8000822a:	ffffd097          	auipc	ra,0xffffd
    8000822e:	4fc080e7          	jalr	1276(ra) # 80005726 <ilock>
  ip->nlink--;
    80008232:	fe843783          	ld	a5,-24(s0)
    80008236:	04a79783          	lh	a5,74(a5)
    8000823a:	17c2                	slli	a5,a5,0x30
    8000823c:	93c1                	srli	a5,a5,0x30
    8000823e:	37fd                	addiw	a5,a5,-1
    80008240:	17c2                	slli	a5,a5,0x30
    80008242:	93c1                	srli	a5,a5,0x30
    80008244:	0107971b          	slliw	a4,a5,0x10
    80008248:	4107571b          	sraiw	a4,a4,0x10
    8000824c:	fe843783          	ld	a5,-24(s0)
    80008250:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008254:	fe843503          	ld	a0,-24(s0)
    80008258:	ffffd097          	auipc	ra,0xffffd
    8000825c:	27e080e7          	jalr	638(ra) # 800054d6 <iupdate>
  iunlockput(ip);
    80008260:	fe843503          	ld	a0,-24(s0)
    80008264:	ffffd097          	auipc	ra,0xffffd
    80008268:	720080e7          	jalr	1824(ra) # 80005984 <iunlockput>
  end_op();
    8000826c:	ffffe097          	auipc	ra,0xffffe
    80008270:	606080e7          	jalr	1542(ra) # 80006872 <end_op>
  return -1;
    80008274:	57fd                	li	a5,-1
}
    80008276:	853e                	mv	a0,a5
    80008278:	70b2                	ld	ra,296(sp)
    8000827a:	7412                	ld	s0,288(sp)
    8000827c:	6155                	addi	sp,sp,304
    8000827e:	8082                	ret

0000000080008280 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80008280:	7139                	addi	sp,sp,-64
    80008282:	fc06                	sd	ra,56(sp)
    80008284:	f822                	sd	s0,48(sp)
    80008286:	0080                	addi	s0,sp,64
    80008288:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    8000828c:	02000793          	li	a5,32
    80008290:	fef42623          	sw	a5,-20(s0)
    80008294:	a0b1                	j	800082e0 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008296:	fd840793          	addi	a5,s0,-40
    8000829a:	fec42683          	lw	a3,-20(s0)
    8000829e:	4741                	li	a4,16
    800082a0:	863e                	mv	a2,a5
    800082a2:	4581                	li	a1,0
    800082a4:	fc843503          	ld	a0,-56(s0)
    800082a8:	ffffe097          	auipc	ra,0xffffe
    800082ac:	a34080e7          	jalr	-1484(ra) # 80005cdc <readi>
    800082b0:	87aa                	mv	a5,a0
    800082b2:	873e                	mv	a4,a5
    800082b4:	47c1                	li	a5,16
    800082b6:	00f70a63          	beq	a4,a5,800082ca <isdirempty+0x4a>
      panic("isdirempty: readi");
    800082ba:	00004517          	auipc	a0,0x4
    800082be:	36650513          	addi	a0,a0,870 # 8000c620 <etext+0x620>
    800082c2:	ffff9097          	auipc	ra,0xffff9
    800082c6:	9ca080e7          	jalr	-1590(ra) # 80000c8c <panic>
    if(de.inum != 0)
    800082ca:	fd845783          	lhu	a5,-40(s0)
    800082ce:	c399                	beqz	a5,800082d4 <isdirempty+0x54>
      return 0;
    800082d0:	4781                	li	a5,0
    800082d2:	a839                	j	800082f0 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    800082d4:	fec42783          	lw	a5,-20(s0)
    800082d8:	27c1                	addiw	a5,a5,16
    800082da:	2781                	sext.w	a5,a5
    800082dc:	fef42623          	sw	a5,-20(s0)
    800082e0:	fc843783          	ld	a5,-56(s0)
    800082e4:	47f8                	lw	a4,76(a5)
    800082e6:	fec42783          	lw	a5,-20(s0)
    800082ea:	fae7e6e3          	bltu	a5,a4,80008296 <isdirempty+0x16>
  }
  return 1;
    800082ee:	4785                	li	a5,1
}
    800082f0:	853e                	mv	a0,a5
    800082f2:	70e2                	ld	ra,56(sp)
    800082f4:	7442                	ld	s0,48(sp)
    800082f6:	6121                	addi	sp,sp,64
    800082f8:	8082                	ret

00000000800082fa <sys_unlink>:

uint64
sys_unlink(void)
{
    800082fa:	7155                	addi	sp,sp,-208
    800082fc:	e586                	sd	ra,200(sp)
    800082fe:	e1a2                	sd	s0,192(sp)
    80008300:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80008302:	f4040793          	addi	a5,s0,-192
    80008306:	08000613          	li	a2,128
    8000830a:	85be                	mv	a1,a5
    8000830c:	4501                	li	a0,0
    8000830e:	ffffc097          	auipc	ra,0xffffc
    80008312:	4d8080e7          	jalr	1240(ra) # 800047e6 <argstr>
    80008316:	87aa                	mv	a5,a0
    80008318:	0007d463          	bgez	a5,80008320 <sys_unlink+0x26>
    return -1;
    8000831c:	57fd                	li	a5,-1
    8000831e:	a2ed                	j	80008508 <sys_unlink+0x20e>

  begin_op();
    80008320:	ffffe097          	auipc	ra,0xffffe
    80008324:	490080e7          	jalr	1168(ra) # 800067b0 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80008328:	fc040713          	addi	a4,s0,-64
    8000832c:	f4040793          	addi	a5,s0,-192
    80008330:	85ba                	mv	a1,a4
    80008332:	853e                	mv	a0,a5
    80008334:	ffffe097          	auipc	ra,0xffffe
    80008338:	144080e7          	jalr	324(ra) # 80006478 <nameiparent>
    8000833c:	fea43423          	sd	a0,-24(s0)
    80008340:	fe843783          	ld	a5,-24(s0)
    80008344:	e799                	bnez	a5,80008352 <sys_unlink+0x58>
    end_op();
    80008346:	ffffe097          	auipc	ra,0xffffe
    8000834a:	52c080e7          	jalr	1324(ra) # 80006872 <end_op>
    return -1;
    8000834e:	57fd                	li	a5,-1
    80008350:	aa65                	j	80008508 <sys_unlink+0x20e>
  }

  ilock(dp);
    80008352:	fe843503          	ld	a0,-24(s0)
    80008356:	ffffd097          	auipc	ra,0xffffd
    8000835a:	3d0080e7          	jalr	976(ra) # 80005726 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    8000835e:	fc040793          	addi	a5,s0,-64
    80008362:	00004597          	auipc	a1,0x4
    80008366:	2d658593          	addi	a1,a1,726 # 8000c638 <etext+0x638>
    8000836a:	853e                	mv	a0,a5
    8000836c:	ffffe097          	auipc	ra,0xffffe
    80008370:	cbc080e7          	jalr	-836(ra) # 80006028 <namecmp>
    80008374:	87aa                	mv	a5,a0
    80008376:	16078b63          	beqz	a5,800084ec <sys_unlink+0x1f2>
    8000837a:	fc040793          	addi	a5,s0,-64
    8000837e:	00004597          	auipc	a1,0x4
    80008382:	2c258593          	addi	a1,a1,706 # 8000c640 <etext+0x640>
    80008386:	853e                	mv	a0,a5
    80008388:	ffffe097          	auipc	ra,0xffffe
    8000838c:	ca0080e7          	jalr	-864(ra) # 80006028 <namecmp>
    80008390:	87aa                	mv	a5,a0
    80008392:	14078d63          	beqz	a5,800084ec <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80008396:	f3c40713          	addi	a4,s0,-196
    8000839a:	fc040793          	addi	a5,s0,-64
    8000839e:	863a                	mv	a2,a4
    800083a0:	85be                	mv	a1,a5
    800083a2:	fe843503          	ld	a0,-24(s0)
    800083a6:	ffffe097          	auipc	ra,0xffffe
    800083aa:	cb0080e7          	jalr	-848(ra) # 80006056 <dirlookup>
    800083ae:	fea43023          	sd	a0,-32(s0)
    800083b2:	fe043783          	ld	a5,-32(s0)
    800083b6:	12078d63          	beqz	a5,800084f0 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    800083ba:	fe043503          	ld	a0,-32(s0)
    800083be:	ffffd097          	auipc	ra,0xffffd
    800083c2:	368080e7          	jalr	872(ra) # 80005726 <ilock>

  if(ip->nlink < 1)
    800083c6:	fe043783          	ld	a5,-32(s0)
    800083ca:	04a79783          	lh	a5,74(a5)
    800083ce:	2781                	sext.w	a5,a5
    800083d0:	00f04a63          	bgtz	a5,800083e4 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    800083d4:	00004517          	auipc	a0,0x4
    800083d8:	27450513          	addi	a0,a0,628 # 8000c648 <etext+0x648>
    800083dc:	ffff9097          	auipc	ra,0xffff9
    800083e0:	8b0080e7          	jalr	-1872(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    800083e4:	fe043783          	ld	a5,-32(s0)
    800083e8:	04479783          	lh	a5,68(a5)
    800083ec:	0007871b          	sext.w	a4,a5
    800083f0:	4785                	li	a5,1
    800083f2:	02f71163          	bne	a4,a5,80008414 <sys_unlink+0x11a>
    800083f6:	fe043503          	ld	a0,-32(s0)
    800083fa:	00000097          	auipc	ra,0x0
    800083fe:	e86080e7          	jalr	-378(ra) # 80008280 <isdirempty>
    80008402:	87aa                	mv	a5,a0
    80008404:	eb81                	bnez	a5,80008414 <sys_unlink+0x11a>
    iunlockput(ip);
    80008406:	fe043503          	ld	a0,-32(s0)
    8000840a:	ffffd097          	auipc	ra,0xffffd
    8000840e:	57a080e7          	jalr	1402(ra) # 80005984 <iunlockput>
    goto bad;
    80008412:	a0c5                	j	800084f2 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80008414:	fd040793          	addi	a5,s0,-48
    80008418:	4641                	li	a2,16
    8000841a:	4581                	li	a1,0
    8000841c:	853e                	mv	a0,a5
    8000841e:	ffff9097          	auipc	ra,0xffff9
    80008422:	11e080e7          	jalr	286(ra) # 8000153c <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008426:	fd040793          	addi	a5,s0,-48
    8000842a:	f3c42683          	lw	a3,-196(s0)
    8000842e:	4741                	li	a4,16
    80008430:	863e                	mv	a2,a5
    80008432:	4581                	li	a1,0
    80008434:	fe843503          	ld	a0,-24(s0)
    80008438:	ffffe097          	auipc	ra,0xffffe
    8000843c:	a3c080e7          	jalr	-1476(ra) # 80005e74 <writei>
    80008440:	87aa                	mv	a5,a0
    80008442:	873e                	mv	a4,a5
    80008444:	47c1                	li	a5,16
    80008446:	00f70a63          	beq	a4,a5,8000845a <sys_unlink+0x160>
    panic("unlink: writei");
    8000844a:	00004517          	auipc	a0,0x4
    8000844e:	21650513          	addi	a0,a0,534 # 8000c660 <etext+0x660>
    80008452:	ffff9097          	auipc	ra,0xffff9
    80008456:	83a080e7          	jalr	-1990(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    8000845a:	fe043783          	ld	a5,-32(s0)
    8000845e:	04479783          	lh	a5,68(a5)
    80008462:	0007871b          	sext.w	a4,a5
    80008466:	4785                	li	a5,1
    80008468:	02f71963          	bne	a4,a5,8000849a <sys_unlink+0x1a0>
    dp->nlink--;
    8000846c:	fe843783          	ld	a5,-24(s0)
    80008470:	04a79783          	lh	a5,74(a5)
    80008474:	17c2                	slli	a5,a5,0x30
    80008476:	93c1                	srli	a5,a5,0x30
    80008478:	37fd                	addiw	a5,a5,-1
    8000847a:	17c2                	slli	a5,a5,0x30
    8000847c:	93c1                	srli	a5,a5,0x30
    8000847e:	0107971b          	slliw	a4,a5,0x10
    80008482:	4107571b          	sraiw	a4,a4,0x10
    80008486:	fe843783          	ld	a5,-24(s0)
    8000848a:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    8000848e:	fe843503          	ld	a0,-24(s0)
    80008492:	ffffd097          	auipc	ra,0xffffd
    80008496:	044080e7          	jalr	68(ra) # 800054d6 <iupdate>
  }
  iunlockput(dp);
    8000849a:	fe843503          	ld	a0,-24(s0)
    8000849e:	ffffd097          	auipc	ra,0xffffd
    800084a2:	4e6080e7          	jalr	1254(ra) # 80005984 <iunlockput>

  ip->nlink--;
    800084a6:	fe043783          	ld	a5,-32(s0)
    800084aa:	04a79783          	lh	a5,74(a5)
    800084ae:	17c2                	slli	a5,a5,0x30
    800084b0:	93c1                	srli	a5,a5,0x30
    800084b2:	37fd                	addiw	a5,a5,-1
    800084b4:	17c2                	slli	a5,a5,0x30
    800084b6:	93c1                	srli	a5,a5,0x30
    800084b8:	0107971b          	slliw	a4,a5,0x10
    800084bc:	4107571b          	sraiw	a4,a4,0x10
    800084c0:	fe043783          	ld	a5,-32(s0)
    800084c4:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800084c8:	fe043503          	ld	a0,-32(s0)
    800084cc:	ffffd097          	auipc	ra,0xffffd
    800084d0:	00a080e7          	jalr	10(ra) # 800054d6 <iupdate>
  iunlockput(ip);
    800084d4:	fe043503          	ld	a0,-32(s0)
    800084d8:	ffffd097          	auipc	ra,0xffffd
    800084dc:	4ac080e7          	jalr	1196(ra) # 80005984 <iunlockput>

  end_op();
    800084e0:	ffffe097          	auipc	ra,0xffffe
    800084e4:	392080e7          	jalr	914(ra) # 80006872 <end_op>

  return 0;
    800084e8:	4781                	li	a5,0
    800084ea:	a839                	j	80008508 <sys_unlink+0x20e>
    goto bad;
    800084ec:	0001                	nop
    800084ee:	a011                	j	800084f2 <sys_unlink+0x1f8>
    goto bad;
    800084f0:	0001                	nop

bad:
  iunlockput(dp);
    800084f2:	fe843503          	ld	a0,-24(s0)
    800084f6:	ffffd097          	auipc	ra,0xffffd
    800084fa:	48e080e7          	jalr	1166(ra) # 80005984 <iunlockput>
  end_op();
    800084fe:	ffffe097          	auipc	ra,0xffffe
    80008502:	374080e7          	jalr	884(ra) # 80006872 <end_op>
  return -1;
    80008506:	57fd                	li	a5,-1
}
    80008508:	853e                	mv	a0,a5
    8000850a:	60ae                	ld	ra,200(sp)
    8000850c:	640e                	ld	s0,192(sp)
    8000850e:	6169                	addi	sp,sp,208
    80008510:	8082                	ret

0000000080008512 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80008512:	7139                	addi	sp,sp,-64
    80008514:	fc06                	sd	ra,56(sp)
    80008516:	f822                	sd	s0,48(sp)
    80008518:	0080                	addi	s0,sp,64
    8000851a:	fca43423          	sd	a0,-56(s0)
    8000851e:	87ae                	mv	a5,a1
    80008520:	8736                	mv	a4,a3
    80008522:	fcf41323          	sh	a5,-58(s0)
    80008526:	87b2                	mv	a5,a2
    80008528:	fcf41223          	sh	a5,-60(s0)
    8000852c:	87ba                	mv	a5,a4
    8000852e:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80008532:	fd040793          	addi	a5,s0,-48
    80008536:	85be                	mv	a1,a5
    80008538:	fc843503          	ld	a0,-56(s0)
    8000853c:	ffffe097          	auipc	ra,0xffffe
    80008540:	f3c080e7          	jalr	-196(ra) # 80006478 <nameiparent>
    80008544:	fea43423          	sd	a0,-24(s0)
    80008548:	fe843783          	ld	a5,-24(s0)
    8000854c:	e399                	bnez	a5,80008552 <create+0x40>
    return 0;
    8000854e:	4781                	li	a5,0
    80008550:	a2ed                	j	8000873a <create+0x228>

  ilock(dp);
    80008552:	fe843503          	ld	a0,-24(s0)
    80008556:	ffffd097          	auipc	ra,0xffffd
    8000855a:	1d0080e7          	jalr	464(ra) # 80005726 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    8000855e:	fd040793          	addi	a5,s0,-48
    80008562:	4601                	li	a2,0
    80008564:	85be                	mv	a1,a5
    80008566:	fe843503          	ld	a0,-24(s0)
    8000856a:	ffffe097          	auipc	ra,0xffffe
    8000856e:	aec080e7          	jalr	-1300(ra) # 80006056 <dirlookup>
    80008572:	fea43023          	sd	a0,-32(s0)
    80008576:	fe043783          	ld	a5,-32(s0)
    8000857a:	c3ad                	beqz	a5,800085dc <create+0xca>
    iunlockput(dp);
    8000857c:	fe843503          	ld	a0,-24(s0)
    80008580:	ffffd097          	auipc	ra,0xffffd
    80008584:	404080e7          	jalr	1028(ra) # 80005984 <iunlockput>
    ilock(ip);
    80008588:	fe043503          	ld	a0,-32(s0)
    8000858c:	ffffd097          	auipc	ra,0xffffd
    80008590:	19a080e7          	jalr	410(ra) # 80005726 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80008594:	fc641783          	lh	a5,-58(s0)
    80008598:	0007871b          	sext.w	a4,a5
    8000859c:	4789                	li	a5,2
    8000859e:	02f71763          	bne	a4,a5,800085cc <create+0xba>
    800085a2:	fe043783          	ld	a5,-32(s0)
    800085a6:	04479783          	lh	a5,68(a5)
    800085aa:	0007871b          	sext.w	a4,a5
    800085ae:	4789                	li	a5,2
    800085b0:	00f70b63          	beq	a4,a5,800085c6 <create+0xb4>
    800085b4:	fe043783          	ld	a5,-32(s0)
    800085b8:	04479783          	lh	a5,68(a5)
    800085bc:	0007871b          	sext.w	a4,a5
    800085c0:	478d                	li	a5,3
    800085c2:	00f71563          	bne	a4,a5,800085cc <create+0xba>
      return ip;
    800085c6:	fe043783          	ld	a5,-32(s0)
    800085ca:	aa85                	j	8000873a <create+0x228>
    iunlockput(ip);
    800085cc:	fe043503          	ld	a0,-32(s0)
    800085d0:	ffffd097          	auipc	ra,0xffffd
    800085d4:	3b4080e7          	jalr	948(ra) # 80005984 <iunlockput>
    return 0;
    800085d8:	4781                	li	a5,0
    800085da:	a285                	j	8000873a <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    800085dc:	fe843783          	ld	a5,-24(s0)
    800085e0:	439c                	lw	a5,0(a5)
    800085e2:	fc641703          	lh	a4,-58(s0)
    800085e6:	85ba                	mv	a1,a4
    800085e8:	853e                	mv	a0,a5
    800085ea:	ffffd097          	auipc	ra,0xffffd
    800085ee:	dee080e7          	jalr	-530(ra) # 800053d8 <ialloc>
    800085f2:	fea43023          	sd	a0,-32(s0)
    800085f6:	fe043783          	ld	a5,-32(s0)
    800085fa:	eb89                	bnez	a5,8000860c <create+0xfa>
    iunlockput(dp);
    800085fc:	fe843503          	ld	a0,-24(s0)
    80008600:	ffffd097          	auipc	ra,0xffffd
    80008604:	384080e7          	jalr	900(ra) # 80005984 <iunlockput>
    return 0;
    80008608:	4781                	li	a5,0
    8000860a:	aa05                	j	8000873a <create+0x228>
  }

  ilock(ip);
    8000860c:	fe043503          	ld	a0,-32(s0)
    80008610:	ffffd097          	auipc	ra,0xffffd
    80008614:	116080e7          	jalr	278(ra) # 80005726 <ilock>
  ip->major = major;
    80008618:	fe043783          	ld	a5,-32(s0)
    8000861c:	fc445703          	lhu	a4,-60(s0)
    80008620:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80008624:	fe043783          	ld	a5,-32(s0)
    80008628:	fc245703          	lhu	a4,-62(s0)
    8000862c:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008630:	fe043783          	ld	a5,-32(s0)
    80008634:	4705                	li	a4,1
    80008636:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    8000863a:	fe043503          	ld	a0,-32(s0)
    8000863e:	ffffd097          	auipc	ra,0xffffd
    80008642:	e98080e7          	jalr	-360(ra) # 800054d6 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008646:	fc641783          	lh	a5,-58(s0)
    8000864a:	0007871b          	sext.w	a4,a5
    8000864e:	4785                	li	a5,1
    80008650:	04f71463          	bne	a4,a5,80008698 <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80008654:	fe043783          	ld	a5,-32(s0)
    80008658:	43dc                	lw	a5,4(a5)
    8000865a:	863e                	mv	a2,a5
    8000865c:	00004597          	auipc	a1,0x4
    80008660:	fdc58593          	addi	a1,a1,-36 # 8000c638 <etext+0x638>
    80008664:	fe043503          	ld	a0,-32(s0)
    80008668:	ffffe097          	auipc	ra,0xffffe
    8000866c:	ad6080e7          	jalr	-1322(ra) # 8000613e <dirlink>
    80008670:	87aa                	mv	a5,a0
    80008672:	0807ca63          	bltz	a5,80008706 <create+0x1f4>
    80008676:	fe843783          	ld	a5,-24(s0)
    8000867a:	43dc                	lw	a5,4(a5)
    8000867c:	863e                	mv	a2,a5
    8000867e:	00004597          	auipc	a1,0x4
    80008682:	fc258593          	addi	a1,a1,-62 # 8000c640 <etext+0x640>
    80008686:	fe043503          	ld	a0,-32(s0)
    8000868a:	ffffe097          	auipc	ra,0xffffe
    8000868e:	ab4080e7          	jalr	-1356(ra) # 8000613e <dirlink>
    80008692:	87aa                	mv	a5,a0
    80008694:	0607c963          	bltz	a5,80008706 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80008698:	fe043783          	ld	a5,-32(s0)
    8000869c:	43d8                	lw	a4,4(a5)
    8000869e:	fd040793          	addi	a5,s0,-48
    800086a2:	863a                	mv	a2,a4
    800086a4:	85be                	mv	a1,a5
    800086a6:	fe843503          	ld	a0,-24(s0)
    800086aa:	ffffe097          	auipc	ra,0xffffe
    800086ae:	a94080e7          	jalr	-1388(ra) # 8000613e <dirlink>
    800086b2:	87aa                	mv	a5,a0
    800086b4:	0407cb63          	bltz	a5,8000870a <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    800086b8:	fc641783          	lh	a5,-58(s0)
    800086bc:	0007871b          	sext.w	a4,a5
    800086c0:	4785                	li	a5,1
    800086c2:	02f71963          	bne	a4,a5,800086f4 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    800086c6:	fe843783          	ld	a5,-24(s0)
    800086ca:	04a79783          	lh	a5,74(a5)
    800086ce:	17c2                	slli	a5,a5,0x30
    800086d0:	93c1                	srli	a5,a5,0x30
    800086d2:	2785                	addiw	a5,a5,1
    800086d4:	17c2                	slli	a5,a5,0x30
    800086d6:	93c1                	srli	a5,a5,0x30
    800086d8:	0107971b          	slliw	a4,a5,0x10
    800086dc:	4107571b          	sraiw	a4,a4,0x10
    800086e0:	fe843783          	ld	a5,-24(s0)
    800086e4:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800086e8:	fe843503          	ld	a0,-24(s0)
    800086ec:	ffffd097          	auipc	ra,0xffffd
    800086f0:	dea080e7          	jalr	-534(ra) # 800054d6 <iupdate>
  }

  iunlockput(dp);
    800086f4:	fe843503          	ld	a0,-24(s0)
    800086f8:	ffffd097          	auipc	ra,0xffffd
    800086fc:	28c080e7          	jalr	652(ra) # 80005984 <iunlockput>

  return ip;
    80008700:	fe043783          	ld	a5,-32(s0)
    80008704:	a81d                	j	8000873a <create+0x228>
      goto fail;
    80008706:	0001                	nop
    80008708:	a011                	j	8000870c <create+0x1fa>
    goto fail;
    8000870a:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    8000870c:	fe043783          	ld	a5,-32(s0)
    80008710:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    80008714:	fe043503          	ld	a0,-32(s0)
    80008718:	ffffd097          	auipc	ra,0xffffd
    8000871c:	dbe080e7          	jalr	-578(ra) # 800054d6 <iupdate>
  iunlockput(ip);
    80008720:	fe043503          	ld	a0,-32(s0)
    80008724:	ffffd097          	auipc	ra,0xffffd
    80008728:	260080e7          	jalr	608(ra) # 80005984 <iunlockput>
  iunlockput(dp);
    8000872c:	fe843503          	ld	a0,-24(s0)
    80008730:	ffffd097          	auipc	ra,0xffffd
    80008734:	254080e7          	jalr	596(ra) # 80005984 <iunlockput>
  return 0;
    80008738:	4781                	li	a5,0
}
    8000873a:	853e                	mv	a0,a5
    8000873c:	70e2                	ld	ra,56(sp)
    8000873e:	7442                	ld	s0,48(sp)
    80008740:	6121                	addi	sp,sp,64
    80008742:	8082                	ret

0000000080008744 <sys_open>:

uint64
sys_open(void)
{
    80008744:	7131                	addi	sp,sp,-192
    80008746:	fd06                	sd	ra,184(sp)
    80008748:	f922                	sd	s0,176(sp)
    8000874a:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    8000874c:	f4c40793          	addi	a5,s0,-180
    80008750:	85be                	mv	a1,a5
    80008752:	4505                	li	a0,1
    80008754:	ffffc097          	auipc	ra,0xffffc
    80008758:	02a080e7          	jalr	42(ra) # 8000477e <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    8000875c:	f5040793          	addi	a5,s0,-176
    80008760:	08000613          	li	a2,128
    80008764:	85be                	mv	a1,a5
    80008766:	4501                	li	a0,0
    80008768:	ffffc097          	auipc	ra,0xffffc
    8000876c:	07e080e7          	jalr	126(ra) # 800047e6 <argstr>
    80008770:	87aa                	mv	a5,a0
    80008772:	fef42223          	sw	a5,-28(s0)
    80008776:	fe442783          	lw	a5,-28(s0)
    8000877a:	2781                	sext.w	a5,a5
    8000877c:	0007d463          	bgez	a5,80008784 <sys_open+0x40>
    return -1;
    80008780:	57fd                	li	a5,-1
    80008782:	a429                	j	8000898c <sys_open+0x248>

  begin_op();
    80008784:	ffffe097          	auipc	ra,0xffffe
    80008788:	02c080e7          	jalr	44(ra) # 800067b0 <begin_op>

  if(omode & O_CREATE){
    8000878c:	f4c42783          	lw	a5,-180(s0)
    80008790:	2007f793          	andi	a5,a5,512
    80008794:	2781                	sext.w	a5,a5
    80008796:	c795                	beqz	a5,800087c2 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    80008798:	f5040793          	addi	a5,s0,-176
    8000879c:	4681                	li	a3,0
    8000879e:	4601                	li	a2,0
    800087a0:	4589                	li	a1,2
    800087a2:	853e                	mv	a0,a5
    800087a4:	00000097          	auipc	ra,0x0
    800087a8:	d6e080e7          	jalr	-658(ra) # 80008512 <create>
    800087ac:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800087b0:	fe843783          	ld	a5,-24(s0)
    800087b4:	e7bd                	bnez	a5,80008822 <sys_open+0xde>
      end_op();
    800087b6:	ffffe097          	auipc	ra,0xffffe
    800087ba:	0bc080e7          	jalr	188(ra) # 80006872 <end_op>
      return -1;
    800087be:	57fd                	li	a5,-1
    800087c0:	a2f1                	j	8000898c <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    800087c2:	f5040793          	addi	a5,s0,-176
    800087c6:	853e                	mv	a0,a5
    800087c8:	ffffe097          	auipc	ra,0xffffe
    800087cc:	c84080e7          	jalr	-892(ra) # 8000644c <namei>
    800087d0:	fea43423          	sd	a0,-24(s0)
    800087d4:	fe843783          	ld	a5,-24(s0)
    800087d8:	e799                	bnez	a5,800087e6 <sys_open+0xa2>
      end_op();
    800087da:	ffffe097          	auipc	ra,0xffffe
    800087de:	098080e7          	jalr	152(ra) # 80006872 <end_op>
      return -1;
    800087e2:	57fd                	li	a5,-1
    800087e4:	a265                	j	8000898c <sys_open+0x248>
    }
    ilock(ip);
    800087e6:	fe843503          	ld	a0,-24(s0)
    800087ea:	ffffd097          	auipc	ra,0xffffd
    800087ee:	f3c080e7          	jalr	-196(ra) # 80005726 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800087f2:	fe843783          	ld	a5,-24(s0)
    800087f6:	04479783          	lh	a5,68(a5)
    800087fa:	0007871b          	sext.w	a4,a5
    800087fe:	4785                	li	a5,1
    80008800:	02f71163          	bne	a4,a5,80008822 <sys_open+0xde>
    80008804:	f4c42783          	lw	a5,-180(s0)
    80008808:	cf89                	beqz	a5,80008822 <sys_open+0xde>
      iunlockput(ip);
    8000880a:	fe843503          	ld	a0,-24(s0)
    8000880e:	ffffd097          	auipc	ra,0xffffd
    80008812:	176080e7          	jalr	374(ra) # 80005984 <iunlockput>
      end_op();
    80008816:	ffffe097          	auipc	ra,0xffffe
    8000881a:	05c080e7          	jalr	92(ra) # 80006872 <end_op>
      return -1;
    8000881e:	57fd                	li	a5,-1
    80008820:	a2b5                	j	8000898c <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    80008822:	fe843783          	ld	a5,-24(s0)
    80008826:	04479783          	lh	a5,68(a5)
    8000882a:	0007871b          	sext.w	a4,a5
    8000882e:	478d                	li	a5,3
    80008830:	02f71e63          	bne	a4,a5,8000886c <sys_open+0x128>
    80008834:	fe843783          	ld	a5,-24(s0)
    80008838:	04679783          	lh	a5,70(a5)
    8000883c:	2781                	sext.w	a5,a5
    8000883e:	0007cb63          	bltz	a5,80008854 <sys_open+0x110>
    80008842:	fe843783          	ld	a5,-24(s0)
    80008846:	04679783          	lh	a5,70(a5)
    8000884a:	0007871b          	sext.w	a4,a5
    8000884e:	47a5                	li	a5,9
    80008850:	00e7de63          	bge	a5,a4,8000886c <sys_open+0x128>
    iunlockput(ip);
    80008854:	fe843503          	ld	a0,-24(s0)
    80008858:	ffffd097          	auipc	ra,0xffffd
    8000885c:	12c080e7          	jalr	300(ra) # 80005984 <iunlockput>
    end_op();
    80008860:	ffffe097          	auipc	ra,0xffffe
    80008864:	012080e7          	jalr	18(ra) # 80006872 <end_op>
    return -1;
    80008868:	57fd                	li	a5,-1
    8000886a:	a20d                	j	8000898c <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    8000886c:	ffffe097          	auipc	ra,0xffffe
    80008870:	4f4080e7          	jalr	1268(ra) # 80006d60 <filealloc>
    80008874:	fca43c23          	sd	a0,-40(s0)
    80008878:	fd843783          	ld	a5,-40(s0)
    8000887c:	cf99                	beqz	a5,8000889a <sys_open+0x156>
    8000887e:	fd843503          	ld	a0,-40(s0)
    80008882:	fffff097          	auipc	ra,0xfffff
    80008886:	5e8080e7          	jalr	1512(ra) # 80007e6a <fdalloc>
    8000888a:	87aa                	mv	a5,a0
    8000888c:	fcf42a23          	sw	a5,-44(s0)
    80008890:	fd442783          	lw	a5,-44(s0)
    80008894:	2781                	sext.w	a5,a5
    80008896:	0207d763          	bgez	a5,800088c4 <sys_open+0x180>
    if(f)
    8000889a:	fd843783          	ld	a5,-40(s0)
    8000889e:	c799                	beqz	a5,800088ac <sys_open+0x168>
      fileclose(f);
    800088a0:	fd843503          	ld	a0,-40(s0)
    800088a4:	ffffe097          	auipc	ra,0xffffe
    800088a8:	5a6080e7          	jalr	1446(ra) # 80006e4a <fileclose>
    iunlockput(ip);
    800088ac:	fe843503          	ld	a0,-24(s0)
    800088b0:	ffffd097          	auipc	ra,0xffffd
    800088b4:	0d4080e7          	jalr	212(ra) # 80005984 <iunlockput>
    end_op();
    800088b8:	ffffe097          	auipc	ra,0xffffe
    800088bc:	fba080e7          	jalr	-70(ra) # 80006872 <end_op>
    return -1;
    800088c0:	57fd                	li	a5,-1
    800088c2:	a0e9                	j	8000898c <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    800088c4:	fe843783          	ld	a5,-24(s0)
    800088c8:	04479783          	lh	a5,68(a5)
    800088cc:	0007871b          	sext.w	a4,a5
    800088d0:	478d                	li	a5,3
    800088d2:	00f71f63          	bne	a4,a5,800088f0 <sys_open+0x1ac>
    f->type = FD_DEVICE;
    800088d6:	fd843783          	ld	a5,-40(s0)
    800088da:	470d                	li	a4,3
    800088dc:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800088de:	fe843783          	ld	a5,-24(s0)
    800088e2:	04679703          	lh	a4,70(a5)
    800088e6:	fd843783          	ld	a5,-40(s0)
    800088ea:	02e79223          	sh	a4,36(a5)
    800088ee:	a809                	j	80008900 <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    800088f0:	fd843783          	ld	a5,-40(s0)
    800088f4:	4709                	li	a4,2
    800088f6:	c398                	sw	a4,0(a5)
    f->off = 0;
    800088f8:	fd843783          	ld	a5,-40(s0)
    800088fc:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    80008900:	fd843783          	ld	a5,-40(s0)
    80008904:	fe843703          	ld	a4,-24(s0)
    80008908:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    8000890a:	f4c42783          	lw	a5,-180(s0)
    8000890e:	8b85                	andi	a5,a5,1
    80008910:	2781                	sext.w	a5,a5
    80008912:	0017b793          	seqz	a5,a5
    80008916:	0ff7f793          	andi	a5,a5,255
    8000891a:	873e                	mv	a4,a5
    8000891c:	fd843783          	ld	a5,-40(s0)
    80008920:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008924:	f4c42783          	lw	a5,-180(s0)
    80008928:	8b85                	andi	a5,a5,1
    8000892a:	2781                	sext.w	a5,a5
    8000892c:	e791                	bnez	a5,80008938 <sys_open+0x1f4>
    8000892e:	f4c42783          	lw	a5,-180(s0)
    80008932:	8b89                	andi	a5,a5,2
    80008934:	2781                	sext.w	a5,a5
    80008936:	c399                	beqz	a5,8000893c <sys_open+0x1f8>
    80008938:	4785                	li	a5,1
    8000893a:	a011                	j	8000893e <sys_open+0x1fa>
    8000893c:	4781                	li	a5,0
    8000893e:	0ff7f713          	andi	a4,a5,255
    80008942:	fd843783          	ld	a5,-40(s0)
    80008946:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000894a:	f4c42783          	lw	a5,-180(s0)
    8000894e:	4007f793          	andi	a5,a5,1024
    80008952:	2781                	sext.w	a5,a5
    80008954:	c385                	beqz	a5,80008974 <sys_open+0x230>
    80008956:	fe843783          	ld	a5,-24(s0)
    8000895a:	04479783          	lh	a5,68(a5)
    8000895e:	0007871b          	sext.w	a4,a5
    80008962:	4789                	li	a5,2
    80008964:	00f71863          	bne	a4,a5,80008974 <sys_open+0x230>
    itrunc(ip);
    80008968:	fe843503          	ld	a0,-24(s0)
    8000896c:	ffffd097          	auipc	ra,0xffffd
    80008970:	1c2080e7          	jalr	450(ra) # 80005b2e <itrunc>
  }

  iunlock(ip);
    80008974:	fe843503          	ld	a0,-24(s0)
    80008978:	ffffd097          	auipc	ra,0xffffd
    8000897c:	ee2080e7          	jalr	-286(ra) # 8000585a <iunlock>
  end_op();
    80008980:	ffffe097          	auipc	ra,0xffffe
    80008984:	ef2080e7          	jalr	-270(ra) # 80006872 <end_op>

  return fd;
    80008988:	fd442783          	lw	a5,-44(s0)
}
    8000898c:	853e                	mv	a0,a5
    8000898e:	70ea                	ld	ra,184(sp)
    80008990:	744a                	ld	s0,176(sp)
    80008992:	6129                	addi	sp,sp,192
    80008994:	8082                	ret

0000000080008996 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008996:	7135                	addi	sp,sp,-160
    80008998:	ed06                	sd	ra,152(sp)
    8000899a:	e922                	sd	s0,144(sp)
    8000899c:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    8000899e:	ffffe097          	auipc	ra,0xffffe
    800089a2:	e12080e7          	jalr	-494(ra) # 800067b0 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800089a6:	f6840793          	addi	a5,s0,-152
    800089aa:	08000613          	li	a2,128
    800089ae:	85be                	mv	a1,a5
    800089b0:	4501                	li	a0,0
    800089b2:	ffffc097          	auipc	ra,0xffffc
    800089b6:	e34080e7          	jalr	-460(ra) # 800047e6 <argstr>
    800089ba:	87aa                	mv	a5,a0
    800089bc:	0207c163          	bltz	a5,800089de <sys_mkdir+0x48>
    800089c0:	f6840793          	addi	a5,s0,-152
    800089c4:	4681                	li	a3,0
    800089c6:	4601                	li	a2,0
    800089c8:	4585                	li	a1,1
    800089ca:	853e                	mv	a0,a5
    800089cc:	00000097          	auipc	ra,0x0
    800089d0:	b46080e7          	jalr	-1210(ra) # 80008512 <create>
    800089d4:	fea43423          	sd	a0,-24(s0)
    800089d8:	fe843783          	ld	a5,-24(s0)
    800089dc:	e799                	bnez	a5,800089ea <sys_mkdir+0x54>
    end_op();
    800089de:	ffffe097          	auipc	ra,0xffffe
    800089e2:	e94080e7          	jalr	-364(ra) # 80006872 <end_op>
    return -1;
    800089e6:	57fd                	li	a5,-1
    800089e8:	a821                	j	80008a00 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800089ea:	fe843503          	ld	a0,-24(s0)
    800089ee:	ffffd097          	auipc	ra,0xffffd
    800089f2:	f96080e7          	jalr	-106(ra) # 80005984 <iunlockput>
  end_op();
    800089f6:	ffffe097          	auipc	ra,0xffffe
    800089fa:	e7c080e7          	jalr	-388(ra) # 80006872 <end_op>
  return 0;
    800089fe:	4781                	li	a5,0
}
    80008a00:	853e                	mv	a0,a5
    80008a02:	60ea                	ld	ra,152(sp)
    80008a04:	644a                	ld	s0,144(sp)
    80008a06:	610d                	addi	sp,sp,160
    80008a08:	8082                	ret

0000000080008a0a <sys_mknod>:

uint64
sys_mknod(void)
{
    80008a0a:	7135                	addi	sp,sp,-160
    80008a0c:	ed06                	sd	ra,152(sp)
    80008a0e:	e922                	sd	s0,144(sp)
    80008a10:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008a12:	ffffe097          	auipc	ra,0xffffe
    80008a16:	d9e080e7          	jalr	-610(ra) # 800067b0 <begin_op>
  argint(1, &major);
    80008a1a:	f6440793          	addi	a5,s0,-156
    80008a1e:	85be                	mv	a1,a5
    80008a20:	4505                	li	a0,1
    80008a22:	ffffc097          	auipc	ra,0xffffc
    80008a26:	d5c080e7          	jalr	-676(ra) # 8000477e <argint>
  argint(2, &minor);
    80008a2a:	f6040793          	addi	a5,s0,-160
    80008a2e:	85be                	mv	a1,a5
    80008a30:	4509                	li	a0,2
    80008a32:	ffffc097          	auipc	ra,0xffffc
    80008a36:	d4c080e7          	jalr	-692(ra) # 8000477e <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008a3a:	f6840793          	addi	a5,s0,-152
    80008a3e:	08000613          	li	a2,128
    80008a42:	85be                	mv	a1,a5
    80008a44:	4501                	li	a0,0
    80008a46:	ffffc097          	auipc	ra,0xffffc
    80008a4a:	da0080e7          	jalr	-608(ra) # 800047e6 <argstr>
    80008a4e:	87aa                	mv	a5,a0
    80008a50:	0207cc63          	bltz	a5,80008a88 <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008a54:	f6442783          	lw	a5,-156(s0)
    80008a58:	0107971b          	slliw	a4,a5,0x10
    80008a5c:	4107571b          	sraiw	a4,a4,0x10
    80008a60:	f6042783          	lw	a5,-160(s0)
    80008a64:	0107969b          	slliw	a3,a5,0x10
    80008a68:	4106d69b          	sraiw	a3,a3,0x10
    80008a6c:	f6840793          	addi	a5,s0,-152
    80008a70:	863a                	mv	a2,a4
    80008a72:	458d                	li	a1,3
    80008a74:	853e                	mv	a0,a5
    80008a76:	00000097          	auipc	ra,0x0
    80008a7a:	a9c080e7          	jalr	-1380(ra) # 80008512 <create>
    80008a7e:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008a82:	fe843783          	ld	a5,-24(s0)
    80008a86:	e799                	bnez	a5,80008a94 <sys_mknod+0x8a>
    end_op();
    80008a88:	ffffe097          	auipc	ra,0xffffe
    80008a8c:	dea080e7          	jalr	-534(ra) # 80006872 <end_op>
    return -1;
    80008a90:	57fd                	li	a5,-1
    80008a92:	a821                	j	80008aaa <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008a94:	fe843503          	ld	a0,-24(s0)
    80008a98:	ffffd097          	auipc	ra,0xffffd
    80008a9c:	eec080e7          	jalr	-276(ra) # 80005984 <iunlockput>
  end_op();
    80008aa0:	ffffe097          	auipc	ra,0xffffe
    80008aa4:	dd2080e7          	jalr	-558(ra) # 80006872 <end_op>
  return 0;
    80008aa8:	4781                	li	a5,0
}
    80008aaa:	853e                	mv	a0,a5
    80008aac:	60ea                	ld	ra,152(sp)
    80008aae:	644a                	ld	s0,144(sp)
    80008ab0:	610d                	addi	sp,sp,160
    80008ab2:	8082                	ret

0000000080008ab4 <sys_chdir>:

uint64
sys_chdir(void)
{
    80008ab4:	7135                	addi	sp,sp,-160
    80008ab6:	ed06                	sd	ra,152(sp)
    80008ab8:	e922                	sd	s0,144(sp)
    80008aba:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008abc:	ffffa097          	auipc	ra,0xffffa
    80008ac0:	3ca080e7          	jalr	970(ra) # 80002e86 <myproc>
    80008ac4:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    80008ac8:	ffffe097          	auipc	ra,0xffffe
    80008acc:	ce8080e7          	jalr	-792(ra) # 800067b0 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008ad0:	f6040793          	addi	a5,s0,-160
    80008ad4:	08000613          	li	a2,128
    80008ad8:	85be                	mv	a1,a5
    80008ada:	4501                	li	a0,0
    80008adc:	ffffc097          	auipc	ra,0xffffc
    80008ae0:	d0a080e7          	jalr	-758(ra) # 800047e6 <argstr>
    80008ae4:	87aa                	mv	a5,a0
    80008ae6:	0007ce63          	bltz	a5,80008b02 <sys_chdir+0x4e>
    80008aea:	f6040793          	addi	a5,s0,-160
    80008aee:	853e                	mv	a0,a5
    80008af0:	ffffe097          	auipc	ra,0xffffe
    80008af4:	95c080e7          	jalr	-1700(ra) # 8000644c <namei>
    80008af8:	fea43023          	sd	a0,-32(s0)
    80008afc:	fe043783          	ld	a5,-32(s0)
    80008b00:	e799                	bnez	a5,80008b0e <sys_chdir+0x5a>
    end_op();
    80008b02:	ffffe097          	auipc	ra,0xffffe
    80008b06:	d70080e7          	jalr	-656(ra) # 80006872 <end_op>
    return -1;
    80008b0a:	57fd                	li	a5,-1
    80008b0c:	a0b5                	j	80008b78 <sys_chdir+0xc4>
  }
  ilock(ip);
    80008b0e:	fe043503          	ld	a0,-32(s0)
    80008b12:	ffffd097          	auipc	ra,0xffffd
    80008b16:	c14080e7          	jalr	-1004(ra) # 80005726 <ilock>
  if(ip->type != T_DIR){
    80008b1a:	fe043783          	ld	a5,-32(s0)
    80008b1e:	04479783          	lh	a5,68(a5)
    80008b22:	0007871b          	sext.w	a4,a5
    80008b26:	4785                	li	a5,1
    80008b28:	00f70e63          	beq	a4,a5,80008b44 <sys_chdir+0x90>
    iunlockput(ip);
    80008b2c:	fe043503          	ld	a0,-32(s0)
    80008b30:	ffffd097          	auipc	ra,0xffffd
    80008b34:	e54080e7          	jalr	-428(ra) # 80005984 <iunlockput>
    end_op();
    80008b38:	ffffe097          	auipc	ra,0xffffe
    80008b3c:	d3a080e7          	jalr	-710(ra) # 80006872 <end_op>
    return -1;
    80008b40:	57fd                	li	a5,-1
    80008b42:	a81d                	j	80008b78 <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008b44:	fe043503          	ld	a0,-32(s0)
    80008b48:	ffffd097          	auipc	ra,0xffffd
    80008b4c:	d12080e7          	jalr	-750(ra) # 8000585a <iunlock>
  iput(p->cwd);
    80008b50:	fe843783          	ld	a5,-24(s0)
    80008b54:	1507b783          	ld	a5,336(a5)
    80008b58:	853e                	mv	a0,a5
    80008b5a:	ffffd097          	auipc	ra,0xffffd
    80008b5e:	d5a080e7          	jalr	-678(ra) # 800058b4 <iput>
  end_op();
    80008b62:	ffffe097          	auipc	ra,0xffffe
    80008b66:	d10080e7          	jalr	-752(ra) # 80006872 <end_op>
  p->cwd = ip;
    80008b6a:	fe843783          	ld	a5,-24(s0)
    80008b6e:	fe043703          	ld	a4,-32(s0)
    80008b72:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008b76:	4781                	li	a5,0
}
    80008b78:	853e                	mv	a0,a5
    80008b7a:	60ea                	ld	ra,152(sp)
    80008b7c:	644a                	ld	s0,144(sp)
    80008b7e:	610d                	addi	sp,sp,160
    80008b80:	8082                	ret

0000000080008b82 <sys_exec>:

uint64
sys_exec(void)
{
    80008b82:	7161                	addi	sp,sp,-432
    80008b84:	f706                	sd	ra,424(sp)
    80008b86:	f322                	sd	s0,416(sp)
    80008b88:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    80008b8a:	e6040793          	addi	a5,s0,-416
    80008b8e:	85be                	mv	a1,a5
    80008b90:	4505                	li	a0,1
    80008b92:	ffffc097          	auipc	ra,0xffffc
    80008b96:	c22080e7          	jalr	-990(ra) # 800047b4 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    80008b9a:	f6840793          	addi	a5,s0,-152
    80008b9e:	08000613          	li	a2,128
    80008ba2:	85be                	mv	a1,a5
    80008ba4:	4501                	li	a0,0
    80008ba6:	ffffc097          	auipc	ra,0xffffc
    80008baa:	c40080e7          	jalr	-960(ra) # 800047e6 <argstr>
    80008bae:	87aa                	mv	a5,a0
    80008bb0:	0007d463          	bgez	a5,80008bb8 <sys_exec+0x36>
    return -1;
    80008bb4:	57fd                	li	a5,-1
    80008bb6:	a249                	j	80008d38 <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    80008bb8:	e6840793          	addi	a5,s0,-408
    80008bbc:	10000613          	li	a2,256
    80008bc0:	4581                	li	a1,0
    80008bc2:	853e                	mv	a0,a5
    80008bc4:	ffff9097          	auipc	ra,0xffff9
    80008bc8:	978080e7          	jalr	-1672(ra) # 8000153c <memset>
  for(i=0;; i++){
    80008bcc:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    80008bd0:	fec42783          	lw	a5,-20(s0)
    80008bd4:	873e                	mv	a4,a5
    80008bd6:	47fd                	li	a5,31
    80008bd8:	10e7e463          	bltu	a5,a4,80008ce0 <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008bdc:	fec42783          	lw	a5,-20(s0)
    80008be0:	00379713          	slli	a4,a5,0x3
    80008be4:	e6043783          	ld	a5,-416(s0)
    80008be8:	97ba                	add	a5,a5,a4
    80008bea:	e5840713          	addi	a4,s0,-424
    80008bee:	85ba                	mv	a1,a4
    80008bf0:	853e                	mv	a0,a5
    80008bf2:	ffffc097          	auipc	ra,0xffffc
    80008bf6:	a1a080e7          	jalr	-1510(ra) # 8000460c <fetchaddr>
    80008bfa:	87aa                	mv	a5,a0
    80008bfc:	0e07c463          	bltz	a5,80008ce4 <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    80008c00:	e5843783          	ld	a5,-424(s0)
    80008c04:	eb95                	bnez	a5,80008c38 <sys_exec+0xb6>
      argv[i] = 0;
    80008c06:	fec42783          	lw	a5,-20(s0)
    80008c0a:	078e                	slli	a5,a5,0x3
    80008c0c:	ff040713          	addi	a4,s0,-16
    80008c10:	97ba                	add	a5,a5,a4
    80008c12:	e607bc23          	sd	zero,-392(a5)
      break;
    80008c16:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    80008c18:	e6840713          	addi	a4,s0,-408
    80008c1c:	f6840793          	addi	a5,s0,-152
    80008c20:	85ba                	mv	a1,a4
    80008c22:	853e                	mv	a0,a5
    80008c24:	fffff097          	auipc	ra,0xfffff
    80008c28:	c1e080e7          	jalr	-994(ra) # 80007842 <exec>
    80008c2c:	87aa                	mv	a5,a0
    80008c2e:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008c32:	fe042623          	sw	zero,-20(s0)
    80008c36:	a059                	j	80008cbc <sys_exec+0x13a>
    argv[i] = kalloc();
    80008c38:	ffff8097          	auipc	ra,0xffff8
    80008c3c:	59e080e7          	jalr	1438(ra) # 800011d6 <kalloc>
    80008c40:	872a                	mv	a4,a0
    80008c42:	fec42783          	lw	a5,-20(s0)
    80008c46:	078e                	slli	a5,a5,0x3
    80008c48:	ff040693          	addi	a3,s0,-16
    80008c4c:	97b6                	add	a5,a5,a3
    80008c4e:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008c52:	fec42783          	lw	a5,-20(s0)
    80008c56:	078e                	slli	a5,a5,0x3
    80008c58:	ff040713          	addi	a4,s0,-16
    80008c5c:	97ba                	add	a5,a5,a4
    80008c5e:	e787b783          	ld	a5,-392(a5)
    80008c62:	c3d9                	beqz	a5,80008ce8 <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008c64:	e5843703          	ld	a4,-424(s0)
    80008c68:	fec42783          	lw	a5,-20(s0)
    80008c6c:	078e                	slli	a5,a5,0x3
    80008c6e:	ff040693          	addi	a3,s0,-16
    80008c72:	97b6                	add	a5,a5,a3
    80008c74:	e787b783          	ld	a5,-392(a5)
    80008c78:	6605                	lui	a2,0x1
    80008c7a:	85be                	mv	a1,a5
    80008c7c:	853a                	mv	a0,a4
    80008c7e:	ffffc097          	auipc	ra,0xffffc
    80008c82:	9fc080e7          	jalr	-1540(ra) # 8000467a <fetchstr>
    80008c86:	87aa                	mv	a5,a0
    80008c88:	0607c263          	bltz	a5,80008cec <sys_exec+0x16a>
  for(i=0;; i++){
    80008c8c:	fec42783          	lw	a5,-20(s0)
    80008c90:	2785                	addiw	a5,a5,1
    80008c92:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008c96:	bf2d                	j	80008bd0 <sys_exec+0x4e>
    kfree(argv[i]);
    80008c98:	fec42783          	lw	a5,-20(s0)
    80008c9c:	078e                	slli	a5,a5,0x3
    80008c9e:	ff040713          	addi	a4,s0,-16
    80008ca2:	97ba                	add	a5,a5,a4
    80008ca4:	e787b783          	ld	a5,-392(a5)
    80008ca8:	853e                	mv	a0,a5
    80008caa:	ffff8097          	auipc	ra,0xffff8
    80008cae:	486080e7          	jalr	1158(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008cb2:	fec42783          	lw	a5,-20(s0)
    80008cb6:	2785                	addiw	a5,a5,1
    80008cb8:	fef42623          	sw	a5,-20(s0)
    80008cbc:	fec42783          	lw	a5,-20(s0)
    80008cc0:	873e                	mv	a4,a5
    80008cc2:	47fd                	li	a5,31
    80008cc4:	00e7eb63          	bltu	a5,a4,80008cda <sys_exec+0x158>
    80008cc8:	fec42783          	lw	a5,-20(s0)
    80008ccc:	078e                	slli	a5,a5,0x3
    80008cce:	ff040713          	addi	a4,s0,-16
    80008cd2:	97ba                	add	a5,a5,a4
    80008cd4:	e787b783          	ld	a5,-392(a5)
    80008cd8:	f3e1                	bnez	a5,80008c98 <sys_exec+0x116>

  return ret;
    80008cda:	fe842783          	lw	a5,-24(s0)
    80008cde:	a8a9                	j	80008d38 <sys_exec+0x1b6>
      goto bad;
    80008ce0:	0001                	nop
    80008ce2:	a031                	j	80008cee <sys_exec+0x16c>
      goto bad;
    80008ce4:	0001                	nop
    80008ce6:	a021                	j	80008cee <sys_exec+0x16c>
      goto bad;
    80008ce8:	0001                	nop
    80008cea:	a011                	j	80008cee <sys_exec+0x16c>
      goto bad;
    80008cec:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008cee:	fe042623          	sw	zero,-20(s0)
    80008cf2:	a01d                	j	80008d18 <sys_exec+0x196>
    kfree(argv[i]);
    80008cf4:	fec42783          	lw	a5,-20(s0)
    80008cf8:	078e                	slli	a5,a5,0x3
    80008cfa:	ff040713          	addi	a4,s0,-16
    80008cfe:	97ba                	add	a5,a5,a4
    80008d00:	e787b783          	ld	a5,-392(a5)
    80008d04:	853e                	mv	a0,a5
    80008d06:	ffff8097          	auipc	ra,0xffff8
    80008d0a:	42a080e7          	jalr	1066(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008d0e:	fec42783          	lw	a5,-20(s0)
    80008d12:	2785                	addiw	a5,a5,1
    80008d14:	fef42623          	sw	a5,-20(s0)
    80008d18:	fec42783          	lw	a5,-20(s0)
    80008d1c:	873e                	mv	a4,a5
    80008d1e:	47fd                	li	a5,31
    80008d20:	00e7eb63          	bltu	a5,a4,80008d36 <sys_exec+0x1b4>
    80008d24:	fec42783          	lw	a5,-20(s0)
    80008d28:	078e                	slli	a5,a5,0x3
    80008d2a:	ff040713          	addi	a4,s0,-16
    80008d2e:	97ba                	add	a5,a5,a4
    80008d30:	e787b783          	ld	a5,-392(a5)
    80008d34:	f3e1                	bnez	a5,80008cf4 <sys_exec+0x172>
  return -1;
    80008d36:	57fd                	li	a5,-1
}
    80008d38:	853e                	mv	a0,a5
    80008d3a:	70ba                	ld	ra,424(sp)
    80008d3c:	741a                	ld	s0,416(sp)
    80008d3e:	615d                	addi	sp,sp,432
    80008d40:	8082                	ret

0000000080008d42 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008d42:	7139                	addi	sp,sp,-64
    80008d44:	fc06                	sd	ra,56(sp)
    80008d46:	f822                	sd	s0,48(sp)
    80008d48:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008d4a:	ffffa097          	auipc	ra,0xffffa
    80008d4e:	13c080e7          	jalr	316(ra) # 80002e86 <myproc>
    80008d52:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008d56:	fe040793          	addi	a5,s0,-32
    80008d5a:	85be                	mv	a1,a5
    80008d5c:	4501                	li	a0,0
    80008d5e:	ffffc097          	auipc	ra,0xffffc
    80008d62:	a56080e7          	jalr	-1450(ra) # 800047b4 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008d66:	fd040713          	addi	a4,s0,-48
    80008d6a:	fd840793          	addi	a5,s0,-40
    80008d6e:	85ba                	mv	a1,a4
    80008d70:	853e                	mv	a0,a5
    80008d72:	ffffe097          	auipc	ra,0xffffe
    80008d76:	5ee080e7          	jalr	1518(ra) # 80007360 <pipealloc>
    80008d7a:	87aa                	mv	a5,a0
    80008d7c:	0007d463          	bgez	a5,80008d84 <sys_pipe+0x42>
    return -1;
    80008d80:	57fd                	li	a5,-1
    80008d82:	a219                	j	80008e88 <sys_pipe+0x146>
  fd0 = -1;
    80008d84:	57fd                	li	a5,-1
    80008d86:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008d8a:	fd843783          	ld	a5,-40(s0)
    80008d8e:	853e                	mv	a0,a5
    80008d90:	fffff097          	auipc	ra,0xfffff
    80008d94:	0da080e7          	jalr	218(ra) # 80007e6a <fdalloc>
    80008d98:	87aa                	mv	a5,a0
    80008d9a:	fcf42623          	sw	a5,-52(s0)
    80008d9e:	fcc42783          	lw	a5,-52(s0)
    80008da2:	0207c063          	bltz	a5,80008dc2 <sys_pipe+0x80>
    80008da6:	fd043783          	ld	a5,-48(s0)
    80008daa:	853e                	mv	a0,a5
    80008dac:	fffff097          	auipc	ra,0xfffff
    80008db0:	0be080e7          	jalr	190(ra) # 80007e6a <fdalloc>
    80008db4:	87aa                	mv	a5,a0
    80008db6:	fcf42423          	sw	a5,-56(s0)
    80008dba:	fc842783          	lw	a5,-56(s0)
    80008dbe:	0207df63          	bgez	a5,80008dfc <sys_pipe+0xba>
    if(fd0 >= 0)
    80008dc2:	fcc42783          	lw	a5,-52(s0)
    80008dc6:	0007cb63          	bltz	a5,80008ddc <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    80008dca:	fcc42783          	lw	a5,-52(s0)
    80008dce:	fe843703          	ld	a4,-24(s0)
    80008dd2:	07e9                	addi	a5,a5,26
    80008dd4:	078e                	slli	a5,a5,0x3
    80008dd6:	97ba                	add	a5,a5,a4
    80008dd8:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008ddc:	fd843783          	ld	a5,-40(s0)
    80008de0:	853e                	mv	a0,a5
    80008de2:	ffffe097          	auipc	ra,0xffffe
    80008de6:	068080e7          	jalr	104(ra) # 80006e4a <fileclose>
    fileclose(wf);
    80008dea:	fd043783          	ld	a5,-48(s0)
    80008dee:	853e                	mv	a0,a5
    80008df0:	ffffe097          	auipc	ra,0xffffe
    80008df4:	05a080e7          	jalr	90(ra) # 80006e4a <fileclose>
    return -1;
    80008df8:	57fd                	li	a5,-1
    80008dfa:	a079                	j	80008e88 <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008dfc:	fe843783          	ld	a5,-24(s0)
    80008e00:	6bbc                	ld	a5,80(a5)
    80008e02:	fe043703          	ld	a4,-32(s0)
    80008e06:	fcc40613          	addi	a2,s0,-52
    80008e0a:	4691                	li	a3,4
    80008e0c:	85ba                	mv	a1,a4
    80008e0e:	853e                	mv	a0,a5
    80008e10:	ffffa097          	auipc	ra,0xffffa
    80008e14:	b40080e7          	jalr	-1216(ra) # 80002950 <copyout>
    80008e18:	87aa                	mv	a5,a0
    80008e1a:	0207c463          	bltz	a5,80008e42 <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008e1e:	fe843783          	ld	a5,-24(s0)
    80008e22:	6bb8                	ld	a4,80(a5)
    80008e24:	fe043783          	ld	a5,-32(s0)
    80008e28:	0791                	addi	a5,a5,4
    80008e2a:	fc840613          	addi	a2,s0,-56
    80008e2e:	4691                	li	a3,4
    80008e30:	85be                	mv	a1,a5
    80008e32:	853a                	mv	a0,a4
    80008e34:	ffffa097          	auipc	ra,0xffffa
    80008e38:	b1c080e7          	jalr	-1252(ra) # 80002950 <copyout>
    80008e3c:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008e3e:	0407d463          	bgez	a5,80008e86 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008e42:	fcc42783          	lw	a5,-52(s0)
    80008e46:	fe843703          	ld	a4,-24(s0)
    80008e4a:	07e9                	addi	a5,a5,26
    80008e4c:	078e                	slli	a5,a5,0x3
    80008e4e:	97ba                	add	a5,a5,a4
    80008e50:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008e54:	fc842783          	lw	a5,-56(s0)
    80008e58:	fe843703          	ld	a4,-24(s0)
    80008e5c:	07e9                	addi	a5,a5,26
    80008e5e:	078e                	slli	a5,a5,0x3
    80008e60:	97ba                	add	a5,a5,a4
    80008e62:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008e66:	fd843783          	ld	a5,-40(s0)
    80008e6a:	853e                	mv	a0,a5
    80008e6c:	ffffe097          	auipc	ra,0xffffe
    80008e70:	fde080e7          	jalr	-34(ra) # 80006e4a <fileclose>
    fileclose(wf);
    80008e74:	fd043783          	ld	a5,-48(s0)
    80008e78:	853e                	mv	a0,a5
    80008e7a:	ffffe097          	auipc	ra,0xffffe
    80008e7e:	fd0080e7          	jalr	-48(ra) # 80006e4a <fileclose>
    return -1;
    80008e82:	57fd                	li	a5,-1
    80008e84:	a011                	j	80008e88 <sys_pipe+0x146>
  }
  return 0;
    80008e86:	4781                	li	a5,0
}
    80008e88:	853e                	mv	a0,a5
    80008e8a:	70e2                	ld	ra,56(sp)
    80008e8c:	7442                	ld	s0,48(sp)
    80008e8e:	6121                	addi	sp,sp,64
    80008e90:	8082                	ret
	...

0000000080008ea0 <kernelvec>:
    80008ea0:	7111                	addi	sp,sp,-256
    80008ea2:	e006                	sd	ra,0(sp)
    80008ea4:	e40a                	sd	sp,8(sp)
    80008ea6:	e80e                	sd	gp,16(sp)
    80008ea8:	ec12                	sd	tp,24(sp)
    80008eaa:	f016                	sd	t0,32(sp)
    80008eac:	f41a                	sd	t1,40(sp)
    80008eae:	f81e                	sd	t2,48(sp)
    80008eb0:	fc22                	sd	s0,56(sp)
    80008eb2:	e0a6                	sd	s1,64(sp)
    80008eb4:	e4aa                	sd	a0,72(sp)
    80008eb6:	e8ae                	sd	a1,80(sp)
    80008eb8:	ecb2                	sd	a2,88(sp)
    80008eba:	f0b6                	sd	a3,96(sp)
    80008ebc:	f4ba                	sd	a4,104(sp)
    80008ebe:	f8be                	sd	a5,112(sp)
    80008ec0:	fcc2                	sd	a6,120(sp)
    80008ec2:	e146                	sd	a7,128(sp)
    80008ec4:	e54a                	sd	s2,136(sp)
    80008ec6:	e94e                	sd	s3,144(sp)
    80008ec8:	ed52                	sd	s4,152(sp)
    80008eca:	f156                	sd	s5,160(sp)
    80008ecc:	f55a                	sd	s6,168(sp)
    80008ece:	f95e                	sd	s7,176(sp)
    80008ed0:	fd62                	sd	s8,184(sp)
    80008ed2:	e1e6                	sd	s9,192(sp)
    80008ed4:	e5ea                	sd	s10,200(sp)
    80008ed6:	e9ee                	sd	s11,208(sp)
    80008ed8:	edf2                	sd	t3,216(sp)
    80008eda:	f1f6                	sd	t4,224(sp)
    80008edc:	f5fa                	sd	t5,232(sp)
    80008ede:	f9fe                	sd	t6,240(sp)
    80008ee0:	c88fb0ef          	jal	ra,80004368 <kerneltrap>
    80008ee4:	6082                	ld	ra,0(sp)
    80008ee6:	6122                	ld	sp,8(sp)
    80008ee8:	61c2                	ld	gp,16(sp)
    80008eea:	7282                	ld	t0,32(sp)
    80008eec:	7322                	ld	t1,40(sp)
    80008eee:	73c2                	ld	t2,48(sp)
    80008ef0:	7462                	ld	s0,56(sp)
    80008ef2:	6486                	ld	s1,64(sp)
    80008ef4:	6526                	ld	a0,72(sp)
    80008ef6:	65c6                	ld	a1,80(sp)
    80008ef8:	6666                	ld	a2,88(sp)
    80008efa:	7686                	ld	a3,96(sp)
    80008efc:	7726                	ld	a4,104(sp)
    80008efe:	77c6                	ld	a5,112(sp)
    80008f00:	7866                	ld	a6,120(sp)
    80008f02:	688a                	ld	a7,128(sp)
    80008f04:	692a                	ld	s2,136(sp)
    80008f06:	69ca                	ld	s3,144(sp)
    80008f08:	6a6a                	ld	s4,152(sp)
    80008f0a:	7a8a                	ld	s5,160(sp)
    80008f0c:	7b2a                	ld	s6,168(sp)
    80008f0e:	7bca                	ld	s7,176(sp)
    80008f10:	7c6a                	ld	s8,184(sp)
    80008f12:	6c8e                	ld	s9,192(sp)
    80008f14:	6d2e                	ld	s10,200(sp)
    80008f16:	6dce                	ld	s11,208(sp)
    80008f18:	6e6e                	ld	t3,216(sp)
    80008f1a:	7e8e                	ld	t4,224(sp)
    80008f1c:	7f2e                	ld	t5,232(sp)
    80008f1e:	7fce                	ld	t6,240(sp)
    80008f20:	6111                	addi	sp,sp,256
    80008f22:	10200073          	sret
    80008f26:	00000013          	nop
    80008f2a:	00000013          	nop
    80008f2e:	0001                	nop

0000000080008f30 <timervec>:
    80008f30:	34051573          	csrrw	a0,mscratch,a0
    80008f34:	e10c                	sd	a1,0(a0)
    80008f36:	e510                	sd	a2,8(a0)
    80008f38:	e914                	sd	a3,16(a0)
    80008f3a:	6d0c                	ld	a1,24(a0)
    80008f3c:	7110                	ld	a2,32(a0)
    80008f3e:	6194                	ld	a3,0(a1)
    80008f40:	96b2                	add	a3,a3,a2
    80008f42:	e194                	sd	a3,0(a1)
    80008f44:	4589                	li	a1,2
    80008f46:	14459073          	csrw	sip,a1
    80008f4a:	6914                	ld	a3,16(a0)
    80008f4c:	6510                	ld	a2,8(a0)
    80008f4e:	610c                	ld	a1,0(a0)
    80008f50:	34051573          	csrrw	a0,mscratch,a0
    80008f54:	30200073          	mret
	...

0000000080008f5a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008f5a:	1141                	addi	sp,sp,-16
    80008f5c:	e422                	sd	s0,8(sp)
    80008f5e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008f60:	0c0007b7          	lui	a5,0xc000
    80008f64:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008f68:	4705                	li	a4,1
    80008f6a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008f6c:	0c0007b7          	lui	a5,0xc000
    80008f70:	0791                	addi	a5,a5,4
    80008f72:	4705                	li	a4,1
    80008f74:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008f76:	0c0007b7          	lui	a5,0xc000
    80008f7a:	07a1                	addi	a5,a5,8
    80008f7c:	4705                	li	a4,1
    80008f7e:	c398                	sw	a4,0(a5)
}
    80008f80:	0001                	nop
    80008f82:	6422                	ld	s0,8(sp)
    80008f84:	0141                	addi	sp,sp,16
    80008f86:	8082                	ret

0000000080008f88 <plicinithart>:

void
plicinithart(void)
{
    80008f88:	1101                	addi	sp,sp,-32
    80008f8a:	ec06                	sd	ra,24(sp)
    80008f8c:	e822                	sd	s0,16(sp)
    80008f8e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008f90:	ffffa097          	auipc	ra,0xffffa
    80008f94:	e98080e7          	jalr	-360(ra) # 80002e28 <cpuid>
    80008f98:	87aa                	mv	a5,a0
    80008f9a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008f9e:	fec42783          	lw	a5,-20(s0)
    80008fa2:	0087979b          	slliw	a5,a5,0x8
    80008fa6:	2781                	sext.w	a5,a5
    80008fa8:	873e                	mv	a4,a5
    80008faa:	0c0027b7          	lui	a5,0xc002
    80008fae:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008fb2:	97ba                	add	a5,a5,a4
    80008fb4:	873e                	mv	a4,a5
    80008fb6:	40600793          	li	a5,1030
    80008fba:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008fbc:	fec42783          	lw	a5,-20(s0)
    80008fc0:	00d7979b          	slliw	a5,a5,0xd
    80008fc4:	2781                	sext.w	a5,a5
    80008fc6:	873e                	mv	a4,a5
    80008fc8:	0c2017b7          	lui	a5,0xc201
    80008fcc:	97ba                	add	a5,a5,a4
    80008fce:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008fd2:	0001                	nop
    80008fd4:	60e2                	ld	ra,24(sp)
    80008fd6:	6442                	ld	s0,16(sp)
    80008fd8:	6105                	addi	sp,sp,32
    80008fda:	8082                	ret

0000000080008fdc <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008fdc:	1101                	addi	sp,sp,-32
    80008fde:	ec06                	sd	ra,24(sp)
    80008fe0:	e822                	sd	s0,16(sp)
    80008fe2:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008fe4:	ffffa097          	auipc	ra,0xffffa
    80008fe8:	e44080e7          	jalr	-444(ra) # 80002e28 <cpuid>
    80008fec:	87aa                	mv	a5,a0
    80008fee:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008ff2:	fec42783          	lw	a5,-20(s0)
    80008ff6:	00d7979b          	slliw	a5,a5,0xd
    80008ffa:	2781                	sext.w	a5,a5
    80008ffc:	873e                	mv	a4,a5
    80008ffe:	0c2017b7          	lui	a5,0xc201
    80009002:	0791                	addi	a5,a5,4
    80009004:	97ba                	add	a5,a5,a4
    80009006:	439c                	lw	a5,0(a5)
    80009008:	fef42423          	sw	a5,-24(s0)
  return irq;
    8000900c:	fe842783          	lw	a5,-24(s0)
}
    80009010:	853e                	mv	a0,a5
    80009012:	60e2                	ld	ra,24(sp)
    80009014:	6442                	ld	s0,16(sp)
    80009016:	6105                	addi	sp,sp,32
    80009018:	8082                	ret

000000008000901a <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    8000901a:	7179                	addi	sp,sp,-48
    8000901c:	f406                	sd	ra,40(sp)
    8000901e:	f022                	sd	s0,32(sp)
    80009020:	1800                	addi	s0,sp,48
    80009022:	87aa                	mv	a5,a0
    80009024:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80009028:	ffffa097          	auipc	ra,0xffffa
    8000902c:	e00080e7          	jalr	-512(ra) # 80002e28 <cpuid>
    80009030:	87aa                	mv	a5,a0
    80009032:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80009036:	fec42783          	lw	a5,-20(s0)
    8000903a:	00d7979b          	slliw	a5,a5,0xd
    8000903e:	2781                	sext.w	a5,a5
    80009040:	873e                	mv	a4,a5
    80009042:	0c2017b7          	lui	a5,0xc201
    80009046:	0791                	addi	a5,a5,4
    80009048:	97ba                	add	a5,a5,a4
    8000904a:	873e                	mv	a4,a5
    8000904c:	fdc42783          	lw	a5,-36(s0)
    80009050:	c31c                	sw	a5,0(a4)
}
    80009052:	0001                	nop
    80009054:	70a2                	ld	ra,40(sp)
    80009056:	7402                	ld	s0,32(sp)
    80009058:	6145                	addi	sp,sp,48
    8000905a:	8082                	ret

000000008000905c <r_sstatus>:
{
    8000905c:	1101                	addi	sp,sp,-32
    8000905e:	ec22                	sd	s0,24(sp)
    80009060:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80009062:	100027f3          	csrr	a5,sstatus
    80009066:	fef43423          	sd	a5,-24(s0)
  return x;
    8000906a:	fe843783          	ld	a5,-24(s0)
}
    8000906e:	853e                	mv	a0,a5
    80009070:	6462                	ld	s0,24(sp)
    80009072:	6105                	addi	sp,sp,32
    80009074:	8082                	ret

0000000080009076 <w_sstatus>:
{
    80009076:	1101                	addi	sp,sp,-32
    80009078:	ec22                	sd	s0,24(sp)
    8000907a:	1000                	addi	s0,sp,32
    8000907c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80009080:	fe843783          	ld	a5,-24(s0)
    80009084:	10079073          	csrw	sstatus,a5
}
    80009088:	0001                	nop
    8000908a:	6462                	ld	s0,24(sp)
    8000908c:	6105                	addi	sp,sp,32
    8000908e:	8082                	ret

0000000080009090 <intr_on>:
{
    80009090:	1141                	addi	sp,sp,-16
    80009092:	e406                	sd	ra,8(sp)
    80009094:	e022                	sd	s0,0(sp)
    80009096:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80009098:	00000097          	auipc	ra,0x0
    8000909c:	fc4080e7          	jalr	-60(ra) # 8000905c <r_sstatus>
    800090a0:	87aa                	mv	a5,a0
    800090a2:	0027e793          	ori	a5,a5,2
    800090a6:	853e                	mv	a0,a5
    800090a8:	00000097          	auipc	ra,0x0
    800090ac:	fce080e7          	jalr	-50(ra) # 80009076 <w_sstatus>
}
    800090b0:	0001                	nop
    800090b2:	60a2                	ld	ra,8(sp)
    800090b4:	6402                	ld	s0,0(sp)
    800090b6:	0141                	addi	sp,sp,16
    800090b8:	8082                	ret

00000000800090ba <intr_off>:
{
    800090ba:	1141                	addi	sp,sp,-16
    800090bc:	e406                	sd	ra,8(sp)
    800090be:	e022                	sd	s0,0(sp)
    800090c0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800090c2:	00000097          	auipc	ra,0x0
    800090c6:	f9a080e7          	jalr	-102(ra) # 8000905c <r_sstatus>
    800090ca:	87aa                	mv	a5,a0
    800090cc:	9bf5                	andi	a5,a5,-3
    800090ce:	853e                	mv	a0,a5
    800090d0:	00000097          	auipc	ra,0x0
    800090d4:	fa6080e7          	jalr	-90(ra) # 80009076 <w_sstatus>
}
    800090d8:	0001                	nop
    800090da:	60a2                	ld	ra,8(sp)
    800090dc:	6402                	ld	s0,0(sp)
    800090de:	0141                	addi	sp,sp,16
    800090e0:	8082                	ret

00000000800090e2 <setBit>:

struct Bitset {
  uint32 bits[LRUPAGESSIZE / BITS_PER_UINT];
} diskbitset;

void setBit(struct Bitset *bitset, int index) {
    800090e2:	7179                	addi	sp,sp,-48
    800090e4:	f422                	sd	s0,40(sp)
    800090e6:	1800                	addi	s0,sp,48
    800090e8:	fca43c23          	sd	a0,-40(s0)
    800090ec:	87ae                	mv	a5,a1
    800090ee:	fcf42a23          	sw	a5,-44(s0)
  int arrayIndex = index / BITS_PER_UINT;
    800090f2:	fd442783          	lw	a5,-44(s0)
    800090f6:	8395                	srli	a5,a5,0x5
    800090f8:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    800090fc:	fd442783          	lw	a5,-44(s0)
    80009100:	8bfd                	andi	a5,a5,31
    80009102:	fef42423          	sw	a5,-24(s0)
  bitset->bits[arrayIndex] |= (1 << bitOffset);
    80009106:	fd843703          	ld	a4,-40(s0)
    8000910a:	fec42783          	lw	a5,-20(s0)
    8000910e:	078a                	slli	a5,a5,0x2
    80009110:	97ba                	add	a5,a5,a4
    80009112:	4394                	lw	a3,0(a5)
    80009114:	fe842783          	lw	a5,-24(s0)
    80009118:	4705                	li	a4,1
    8000911a:	00f717bb          	sllw	a5,a4,a5
    8000911e:	2781                	sext.w	a5,a5
    80009120:	2781                	sext.w	a5,a5
    80009122:	8736                	mv	a4,a3
    80009124:	8fd9                	or	a5,a5,a4
    80009126:	0007871b          	sext.w	a4,a5
    8000912a:	fd843683          	ld	a3,-40(s0)
    8000912e:	fec42783          	lw	a5,-20(s0)
    80009132:	078a                	slli	a5,a5,0x2
    80009134:	97b6                	add	a5,a5,a3
    80009136:	c398                	sw	a4,0(a5)
}
    80009138:	0001                	nop
    8000913a:	7422                	ld	s0,40(sp)
    8000913c:	6145                	addi	sp,sp,48
    8000913e:	8082                	ret

0000000080009140 <clearBit>:

void clearBit(struct Bitset *bitset, int index) {
    80009140:	7179                	addi	sp,sp,-48
    80009142:	f422                	sd	s0,40(sp)
    80009144:	1800                	addi	s0,sp,48
    80009146:	fca43c23          	sd	a0,-40(s0)
    8000914a:	87ae                	mv	a5,a1
    8000914c:	fcf42a23          	sw	a5,-44(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80009150:	fd442783          	lw	a5,-44(s0)
    80009154:	8395                	srli	a5,a5,0x5
    80009156:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    8000915a:	fd442783          	lw	a5,-44(s0)
    8000915e:	8bfd                	andi	a5,a5,31
    80009160:	fef42423          	sw	a5,-24(s0)
  bitset->bits[arrayIndex] &= ~(1 << bitOffset);
    80009164:	fd843703          	ld	a4,-40(s0)
    80009168:	fec42783          	lw	a5,-20(s0)
    8000916c:	078a                	slli	a5,a5,0x2
    8000916e:	97ba                	add	a5,a5,a4
    80009170:	4394                	lw	a3,0(a5)
    80009172:	fe842783          	lw	a5,-24(s0)
    80009176:	4705                	li	a4,1
    80009178:	00f717bb          	sllw	a5,a4,a5
    8000917c:	2781                	sext.w	a5,a5
    8000917e:	fff7c793          	not	a5,a5
    80009182:	2781                	sext.w	a5,a5
    80009184:	2781                	sext.w	a5,a5
    80009186:	8736                	mv	a4,a3
    80009188:	8ff9                	and	a5,a5,a4
    8000918a:	0007871b          	sext.w	a4,a5
    8000918e:	fd843683          	ld	a3,-40(s0)
    80009192:	fec42783          	lw	a5,-20(s0)
    80009196:	078a                	slli	a5,a5,0x2
    80009198:	97b6                	add	a5,a5,a3
    8000919a:	c398                	sw	a4,0(a5)
}
    8000919c:	0001                	nop
    8000919e:	7422                	ld	s0,40(sp)
    800091a0:	6145                	addi	sp,sp,48
    800091a2:	8082                	ret

00000000800091a4 <getBit>:

int getBit(struct Bitset *bitset, int index) {
    800091a4:	7179                	addi	sp,sp,-48
    800091a6:	f422                	sd	s0,40(sp)
    800091a8:	1800                	addi	s0,sp,48
    800091aa:	fca43c23          	sd	a0,-40(s0)
    800091ae:	87ae                	mv	a5,a1
    800091b0:	fcf42a23          	sw	a5,-44(s0)
  int arrayIndex = index / BITS_PER_UINT;
    800091b4:	fd442783          	lw	a5,-44(s0)
    800091b8:	8395                	srli	a5,a5,0x5
    800091ba:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    800091be:	fd442783          	lw	a5,-44(s0)
    800091c2:	8bfd                	andi	a5,a5,31
    800091c4:	fef42423          	sw	a5,-24(s0)
  return (bitset->bits[arrayIndex] >> bitOffset) & 1;
    800091c8:	fd843703          	ld	a4,-40(s0)
    800091cc:	fec42783          	lw	a5,-20(s0)
    800091d0:	078a                	slli	a5,a5,0x2
    800091d2:	97ba                	add	a5,a5,a4
    800091d4:	4398                	lw	a4,0(a5)
    800091d6:	fe842783          	lw	a5,-24(s0)
    800091da:	00f757bb          	srlw	a5,a4,a5
    800091de:	2781                	sext.w	a5,a5
    800091e0:	2781                	sext.w	a5,a5
    800091e2:	8b85                	andi	a5,a5,1
    800091e4:	2781                	sext.w	a5,a5
}
    800091e6:	853e                	mv	a0,a5
    800091e8:	7422                	ld	s0,40(sp)
    800091ea:	6145                	addi	sp,sp,48
    800091ec:	8082                	ret

00000000800091ee <findFirstClearBit>:

int findFirstClearBit(struct Bitset *bitset) {
    800091ee:	7179                	addi	sp,sp,-48
    800091f0:	f406                	sd	ra,40(sp)
    800091f2:	f022                	sd	s0,32(sp)
    800091f4:	1800                	addi	s0,sp,48
    800091f6:	fca43c23          	sd	a0,-40(s0)
  for (int i = 0; i < LRUPAGESSIZE; ++i) {
    800091fa:	fe042623          	sw	zero,-20(s0)
    800091fe:	a025                	j	80009226 <findFirstClearBit+0x38>
    if (getBit(bitset, i) == 0) {
    80009200:	fec42783          	lw	a5,-20(s0)
    80009204:	85be                	mv	a1,a5
    80009206:	fd843503          	ld	a0,-40(s0)
    8000920a:	00000097          	auipc	ra,0x0
    8000920e:	f9a080e7          	jalr	-102(ra) # 800091a4 <getBit>
    80009212:	87aa                	mv	a5,a0
    80009214:	e781                	bnez	a5,8000921c <findFirstClearBit+0x2e>
      return i;
    80009216:	fec42783          	lw	a5,-20(s0)
    8000921a:	a831                	j	80009236 <findFirstClearBit+0x48>
  for (int i = 0; i < LRUPAGESSIZE; ++i) {
    8000921c:	fec42783          	lw	a5,-20(s0)
    80009220:	2785                	addiw	a5,a5,1
    80009222:	fef42623          	sw	a5,-20(s0)
    80009226:	fec42783          	lw	a5,-20(s0)
    8000922a:	0007871b          	sext.w	a4,a5
    8000922e:	6789                	lui	a5,0x2
    80009230:	fcf748e3          	blt	a4,a5,80009200 <findFirstClearBit+0x12>
    }
  }
  return -1; // Return -1 if no clear bit is found
    80009234:	57fd                	li	a5,-1
}
    80009236:	853e                	mv	a0,a5
    80009238:	70a2                	ld	ra,40(sp)
    8000923a:	7402                	ld	s0,32(sp)
    8000923c:	6145                	addi	sp,sp,48
    8000923e:	8082                	ret

0000000080009240 <takeFirstClearBit>:

int takeFirstClearBit(struct Bitset *bitset) {
    80009240:	7179                	addi	sp,sp,-48
    80009242:	f406                	sd	ra,40(sp)
    80009244:	f022                	sd	s0,32(sp)
    80009246:	1800                	addi	s0,sp,48
    80009248:	fca43c23          	sd	a0,-40(s0)
  int index = findFirstClearBit(bitset);
    8000924c:	fd843503          	ld	a0,-40(s0)
    80009250:	00000097          	auipc	ra,0x0
    80009254:	f9e080e7          	jalr	-98(ra) # 800091ee <findFirstClearBit>
    80009258:	87aa                	mv	a5,a0
    8000925a:	fef42623          	sw	a5,-20(s0)
  setBit(bitset, index);
    8000925e:	fec42783          	lw	a5,-20(s0)
    80009262:	85be                	mv	a1,a5
    80009264:	fd843503          	ld	a0,-40(s0)
    80009268:	00000097          	auipc	ra,0x0
    8000926c:	e7a080e7          	jalr	-390(ra) # 800090e2 <setBit>
  return index;
    80009270:	fec42783          	lw	a5,-20(s0)
}
    80009274:	853e                	mv	a0,a5
    80009276:	70a2                	ld	ra,40(sp)
    80009278:	7402                	ld	s0,32(sp)
    8000927a:	6145                	addi	sp,sp,48
    8000927c:	8082                	ret

000000008000927e <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    8000927e:	7139                	addi	sp,sp,-64
    80009280:	fc06                	sd	ra,56(sp)
    80009282:	f822                	sd	s0,48(sp)
    80009284:	0080                	addi	s0,sp,64
    80009286:	87aa                	mv	a5,a0
    80009288:	fcb43023          	sd	a1,-64(s0)
    8000928c:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80009290:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80009294:	fcc42703          	lw	a4,-52(s0)
    80009298:	15000793          	li	a5,336
    8000929c:	02f707b3          	mul	a5,a4,a5
    800092a0:	13078713          	addi	a4,a5,304 # 2130 <_entry-0x7fffded0>
    800092a4:	0004d797          	auipc	a5,0x4d
    800092a8:	de478793          	addi	a5,a5,-540 # 80056088 <disk>
    800092ac:	97ba                	add	a5,a5,a4
    800092ae:	fc043583          	ld	a1,-64(s0)
    800092b2:	853e                	mv	a0,a5
    800092b4:	ffff8097          	auipc	ra,0xffff8
    800092b8:	084080e7          	jalr	132(ra) # 80001338 <initlock>
  disk[id].name = name;
    800092bc:	0004d717          	auipc	a4,0x4d
    800092c0:	dcc70713          	addi	a4,a4,-564 # 80056088 <disk>
    800092c4:	fcc42683          	lw	a3,-52(s0)
    800092c8:	15000793          	li	a5,336
    800092cc:	02f687b3          	mul	a5,a3,a5
    800092d0:	97ba                	add	a5,a5,a4
    800092d2:	fc043703          	ld	a4,-64(s0)
    800092d6:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    800092d8:	fcc42703          	lw	a4,-52(s0)
    800092dc:	67c1                	lui	a5,0x10
    800092de:	0785                	addi	a5,a5,1
    800092e0:	97ba                	add	a5,a5,a4
    800092e2:	07b2                	slli	a5,a5,0xc
    800092e4:	439c                	lw	a5,0(a5)
    800092e6:	2781                	sext.w	a5,a5
    800092e8:	873e                	mv	a4,a5
    800092ea:	747277b7          	lui	a5,0x74727
    800092ee:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    800092f2:	04f71c63          	bne	a4,a5,8000934a <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    800092f6:	fcc42703          	lw	a4,-52(s0)
    800092fa:	67c1                	lui	a5,0x10
    800092fc:	0785                	addi	a5,a5,1
    800092fe:	97ba                	add	a5,a5,a4
    80009300:	07b2                	slli	a5,a5,0xc
    80009302:	0791                	addi	a5,a5,4
    80009304:	439c                	lw	a5,0(a5)
    80009306:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80009308:	873e                	mv	a4,a5
    8000930a:	4789                	li	a5,2
    8000930c:	02f71f63          	bne	a4,a5,8000934a <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80009310:	fcc42703          	lw	a4,-52(s0)
    80009314:	67c1                	lui	a5,0x10
    80009316:	0785                	addi	a5,a5,1
    80009318:	97ba                	add	a5,a5,a4
    8000931a:	07b2                	slli	a5,a5,0xc
    8000931c:	07a1                	addi	a5,a5,8
    8000931e:	439c                	lw	a5,0(a5)
    80009320:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80009322:	873e                	mv	a4,a5
    80009324:	4789                	li	a5,2
    80009326:	02f71263          	bne	a4,a5,8000934a <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    8000932a:	fcc42703          	lw	a4,-52(s0)
    8000932e:	67c1                	lui	a5,0x10
    80009330:	0785                	addi	a5,a5,1
    80009332:	97ba                	add	a5,a5,a4
    80009334:	07b2                	slli	a5,a5,0xc
    80009336:	07b1                	addi	a5,a5,12
    80009338:	439c                	lw	a5,0(a5)
    8000933a:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    8000933c:	873e                	mv	a4,a5
    8000933e:	554d47b7          	lui	a5,0x554d4
    80009342:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80009346:	00f70d63          	beq	a4,a5,80009360 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    8000934a:	fc043603          	ld	a2,-64(s0)
    8000934e:	00003597          	auipc	a1,0x3
    80009352:	32258593          	addi	a1,a1,802 # 8000c670 <etext+0x670>
    80009356:	4509                	li	a0,2
    80009358:	ffff8097          	auipc	ra,0xffff8
    8000935c:	986080e7          	jalr	-1658(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009360:	fcc42703          	lw	a4,-52(s0)
    80009364:	67c1                	lui	a5,0x10
    80009366:	0785                	addi	a5,a5,1
    80009368:	97ba                	add	a5,a5,a4
    8000936a:	07b2                	slli	a5,a5,0xc
    8000936c:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009370:	873e                	mv	a4,a5
    80009372:	fe842783          	lw	a5,-24(s0)
    80009376:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80009378:	fe842783          	lw	a5,-24(s0)
    8000937c:	0017e793          	ori	a5,a5,1
    80009380:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009384:	fcc42703          	lw	a4,-52(s0)
    80009388:	67c1                	lui	a5,0x10
    8000938a:	0785                	addi	a5,a5,1
    8000938c:	97ba                	add	a5,a5,a4
    8000938e:	07b2                	slli	a5,a5,0xc
    80009390:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009394:	873e                	mv	a4,a5
    80009396:	fe842783          	lw	a5,-24(s0)
    8000939a:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    8000939c:	fe842783          	lw	a5,-24(s0)
    800093a0:	0027e793          	ori	a5,a5,2
    800093a4:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    800093a8:	fcc42703          	lw	a4,-52(s0)
    800093ac:	67c1                	lui	a5,0x10
    800093ae:	0785                	addi	a5,a5,1
    800093b0:	97ba                	add	a5,a5,a4
    800093b2:	07b2                	slli	a5,a5,0xc
    800093b4:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800093b8:	873e                	mv	a4,a5
    800093ba:	fe842783          	lw	a5,-24(s0)
    800093be:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    800093c0:	fcc42703          	lw	a4,-52(s0)
    800093c4:	67c1                	lui	a5,0x10
    800093c6:	0785                	addi	a5,a5,1
    800093c8:	97ba                	add	a5,a5,a4
    800093ca:	07b2                	slli	a5,a5,0xc
    800093cc:	07c1                	addi	a5,a5,16
    800093ce:	439c                	lw	a5,0(a5)
    800093d0:	2781                	sext.w	a5,a5
    800093d2:	1782                	slli	a5,a5,0x20
    800093d4:	9381                	srli	a5,a5,0x20
    800093d6:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    800093da:	fe043783          	ld	a5,-32(s0)
    800093de:	fdf7f793          	andi	a5,a5,-33
    800093e2:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    800093e6:	fe043783          	ld	a5,-32(s0)
    800093ea:	f7f7f793          	andi	a5,a5,-129
    800093ee:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    800093f2:	fe043703          	ld	a4,-32(s0)
    800093f6:	77fd                	lui	a5,0xfffff
    800093f8:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffa94cf>
    800093fc:	8ff9                	and	a5,a5,a4
    800093fe:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80009402:	fe043703          	ld	a4,-32(s0)
    80009406:	77fd                	lui	a5,0xfffff
    80009408:	17fd                	addi	a5,a5,-1
    8000940a:	8ff9                	and	a5,a5,a4
    8000940c:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80009410:	fe043703          	ld	a4,-32(s0)
    80009414:	f80007b7          	lui	a5,0xf8000
    80009418:	17fd                	addi	a5,a5,-1
    8000941a:	8ff9                	and	a5,a5,a4
    8000941c:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80009420:	fe043703          	ld	a4,-32(s0)
    80009424:	e00007b7          	lui	a5,0xe0000
    80009428:	17fd                	addi	a5,a5,-1
    8000942a:	8ff9                	and	a5,a5,a4
    8000942c:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80009430:	fe043703          	ld	a4,-32(s0)
    80009434:	f00007b7          	lui	a5,0xf0000
    80009438:	17fd                	addi	a5,a5,-1
    8000943a:	8ff9                	and	a5,a5,a4
    8000943c:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80009440:	fcc42703          	lw	a4,-52(s0)
    80009444:	67c1                	lui	a5,0x10
    80009446:	0785                	addi	a5,a5,1
    80009448:	97ba                	add	a5,a5,a4
    8000944a:	07b2                	slli	a5,a5,0xc
    8000944c:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80009450:	873e                	mv	a4,a5
    80009452:	fe043783          	ld	a5,-32(s0)
    80009456:	2781                	sext.w	a5,a5
    80009458:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    8000945a:	fe842783          	lw	a5,-24(s0)
    8000945e:	0087e793          	ori	a5,a5,8
    80009462:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009466:	fcc42703          	lw	a4,-52(s0)
    8000946a:	67c1                	lui	a5,0x10
    8000946c:	0785                	addi	a5,a5,1
    8000946e:	97ba                	add	a5,a5,a4
    80009470:	07b2                	slli	a5,a5,0xc
    80009472:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009476:	873e                	mv	a4,a5
    80009478:	fe842783          	lw	a5,-24(s0)
    8000947c:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    8000947e:	fcc42703          	lw	a4,-52(s0)
    80009482:	67c1                	lui	a5,0x10
    80009484:	0785                	addi	a5,a5,1
    80009486:	97ba                	add	a5,a5,a4
    80009488:	07b2                	slli	a5,a5,0xc
    8000948a:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    8000948e:	439c                	lw	a5,0(a5)
    80009490:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80009494:	fe842783          	lw	a5,-24(s0)
    80009498:	8ba1                	andi	a5,a5,8
    8000949a:	2781                	sext.w	a5,a5
    8000949c:	ef81                	bnez	a5,800094b4 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    8000949e:	00003617          	auipc	a2,0x3
    800094a2:	1f260613          	addi	a2,a2,498 # 8000c690 <etext+0x690>
    800094a6:	fc043583          	ld	a1,-64(s0)
    800094aa:	4509                	li	a0,2
    800094ac:	ffff8097          	auipc	ra,0xffff8
    800094b0:	832080e7          	jalr	-1998(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    800094b4:	fcc42703          	lw	a4,-52(s0)
    800094b8:	67c1                	lui	a5,0x10
    800094ba:	0785                	addi	a5,a5,1
    800094bc:	97ba                	add	a5,a5,a4
    800094be:	07b2                	slli	a5,a5,0xc
    800094c0:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    800094c4:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    800094c8:	fcc42703          	lw	a4,-52(s0)
    800094cc:	67c1                	lui	a5,0x10
    800094ce:	0785                	addi	a5,a5,1
    800094d0:	97ba                	add	a5,a5,a4
    800094d2:	07b2                	slli	a5,a5,0xc
    800094d4:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    800094d8:	439c                	lw	a5,0(a5)
    800094da:	2781                	sext.w	a5,a5
    800094dc:	cf81                	beqz	a5,800094f4 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    800094de:	00003617          	auipc	a2,0x3
    800094e2:	1d260613          	addi	a2,a2,466 # 8000c6b0 <etext+0x6b0>
    800094e6:	fc043583          	ld	a1,-64(s0)
    800094ea:	4509                	li	a0,2
    800094ec:	ffff7097          	auipc	ra,0xffff7
    800094f0:	7f2080e7          	jalr	2034(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    800094f4:	fcc42703          	lw	a4,-52(s0)
    800094f8:	67c1                	lui	a5,0x10
    800094fa:	0785                	addi	a5,a5,1
    800094fc:	97ba                	add	a5,a5,a4
    800094fe:	07b2                	slli	a5,a5,0xc
    80009500:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80009504:	439c                	lw	a5,0(a5)
    80009506:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    8000950a:	fdc42783          	lw	a5,-36(s0)
    8000950e:	2781                	sext.w	a5,a5
    80009510:	ef81                	bnez	a5,80009528 <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    80009512:	00003617          	auipc	a2,0x3
    80009516:	1c660613          	addi	a2,a2,454 # 8000c6d8 <etext+0x6d8>
    8000951a:	fc043583          	ld	a1,-64(s0)
    8000951e:	4509                	li	a0,2
    80009520:	ffff7097          	auipc	ra,0xffff7
    80009524:	7be080e7          	jalr	1982(ra) # 80000cde <panic_concat>
  if(max < NUM)
    80009528:	fdc42783          	lw	a5,-36(s0)
    8000952c:	0007871b          	sext.w	a4,a5
    80009530:	479d                	li	a5,7
    80009532:	00e7ed63          	bltu	a5,a4,8000954c <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    80009536:	00003617          	auipc	a2,0x3
    8000953a:	1c260613          	addi	a2,a2,450 # 8000c6f8 <etext+0x6f8>
    8000953e:	fc043583          	ld	a1,-64(s0)
    80009542:	4509                	li	a0,2
    80009544:	ffff7097          	auipc	ra,0xffff7
    80009548:	79a080e7          	jalr	1946(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    8000954c:	ffff8097          	auipc	ra,0xffff8
    80009550:	c8a080e7          	jalr	-886(ra) # 800011d6 <kalloc>
    80009554:	862a                	mv	a2,a0
    80009556:	0004d717          	auipc	a4,0x4d
    8000955a:	b3270713          	addi	a4,a4,-1230 # 80056088 <disk>
    8000955e:	fcc42683          	lw	a3,-52(s0)
    80009562:	15000793          	li	a5,336
    80009566:	02f687b3          	mul	a5,a3,a5
    8000956a:	97ba                	add	a5,a5,a4
    8000956c:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    8000956e:	ffff8097          	auipc	ra,0xffff8
    80009572:	c68080e7          	jalr	-920(ra) # 800011d6 <kalloc>
    80009576:	862a                	mv	a2,a0
    80009578:	0004d717          	auipc	a4,0x4d
    8000957c:	b1070713          	addi	a4,a4,-1264 # 80056088 <disk>
    80009580:	fcc42683          	lw	a3,-52(s0)
    80009584:	15000793          	li	a5,336
    80009588:	02f687b3          	mul	a5,a3,a5
    8000958c:	97ba                	add	a5,a5,a4
    8000958e:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    80009590:	ffff8097          	auipc	ra,0xffff8
    80009594:	c46080e7          	jalr	-954(ra) # 800011d6 <kalloc>
    80009598:	862a                	mv	a2,a0
    8000959a:	0004d717          	auipc	a4,0x4d
    8000959e:	aee70713          	addi	a4,a4,-1298 # 80056088 <disk>
    800095a2:	fcc42683          	lw	a3,-52(s0)
    800095a6:	15000793          	li	a5,336
    800095aa:	02f687b3          	mul	a5,a3,a5
    800095ae:	97ba                	add	a5,a5,a4
    800095b0:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    800095b2:	0004d717          	auipc	a4,0x4d
    800095b6:	ad670713          	addi	a4,a4,-1322 # 80056088 <disk>
    800095ba:	fcc42683          	lw	a3,-52(s0)
    800095be:	15000793          	li	a5,336
    800095c2:	02f687b3          	mul	a5,a3,a5
    800095c6:	97ba                	add	a5,a5,a4
    800095c8:	679c                	ld	a5,8(a5)
    800095ca:	cb9d                	beqz	a5,80009600 <virtio_disk_init+0x382>
    800095cc:	0004d717          	auipc	a4,0x4d
    800095d0:	abc70713          	addi	a4,a4,-1348 # 80056088 <disk>
    800095d4:	fcc42683          	lw	a3,-52(s0)
    800095d8:	15000793          	li	a5,336
    800095dc:	02f687b3          	mul	a5,a3,a5
    800095e0:	97ba                	add	a5,a5,a4
    800095e2:	6b9c                	ld	a5,16(a5)
    800095e4:	cf91                	beqz	a5,80009600 <virtio_disk_init+0x382>
    800095e6:	0004d717          	auipc	a4,0x4d
    800095ea:	aa270713          	addi	a4,a4,-1374 # 80056088 <disk>
    800095ee:	fcc42683          	lw	a3,-52(s0)
    800095f2:	15000793          	li	a5,336
    800095f6:	02f687b3          	mul	a5,a3,a5
    800095fa:	97ba                	add	a5,a5,a4
    800095fc:	6f9c                	ld	a5,24(a5)
    800095fe:	ef81                	bnez	a5,80009616 <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80009600:	00003617          	auipc	a2,0x3
    80009604:	12060613          	addi	a2,a2,288 # 8000c720 <etext+0x720>
    80009608:	fc043583          	ld	a1,-64(s0)
    8000960c:	4509                	li	a0,2
    8000960e:	ffff7097          	auipc	ra,0xffff7
    80009612:	6d0080e7          	jalr	1744(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    80009616:	0004d717          	auipc	a4,0x4d
    8000961a:	a7270713          	addi	a4,a4,-1422 # 80056088 <disk>
    8000961e:	fcc42683          	lw	a3,-52(s0)
    80009622:	15000793          	li	a5,336
    80009626:	02f687b3          	mul	a5,a3,a5
    8000962a:	97ba                	add	a5,a5,a4
    8000962c:	679c                	ld	a5,8(a5)
    8000962e:	6605                	lui	a2,0x1
    80009630:	4581                	li	a1,0
    80009632:	853e                	mv	a0,a5
    80009634:	ffff8097          	auipc	ra,0xffff8
    80009638:	f08080e7          	jalr	-248(ra) # 8000153c <memset>
  memset(disk[id].avail, 0, PGSIZE);
    8000963c:	0004d717          	auipc	a4,0x4d
    80009640:	a4c70713          	addi	a4,a4,-1460 # 80056088 <disk>
    80009644:	fcc42683          	lw	a3,-52(s0)
    80009648:	15000793          	li	a5,336
    8000964c:	02f687b3          	mul	a5,a3,a5
    80009650:	97ba                	add	a5,a5,a4
    80009652:	6b9c                	ld	a5,16(a5)
    80009654:	6605                	lui	a2,0x1
    80009656:	4581                	li	a1,0
    80009658:	853e                	mv	a0,a5
    8000965a:	ffff8097          	auipc	ra,0xffff8
    8000965e:	ee2080e7          	jalr	-286(ra) # 8000153c <memset>
  memset(disk[id].used, 0, PGSIZE);
    80009662:	0004d717          	auipc	a4,0x4d
    80009666:	a2670713          	addi	a4,a4,-1498 # 80056088 <disk>
    8000966a:	fcc42683          	lw	a3,-52(s0)
    8000966e:	15000793          	li	a5,336
    80009672:	02f687b3          	mul	a5,a3,a5
    80009676:	97ba                	add	a5,a5,a4
    80009678:	6f9c                	ld	a5,24(a5)
    8000967a:	6605                	lui	a2,0x1
    8000967c:	4581                	li	a1,0
    8000967e:	853e                	mv	a0,a5
    80009680:	ffff8097          	auipc	ra,0xffff8
    80009684:	ebc080e7          	jalr	-324(ra) # 8000153c <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    80009688:	fcc42703          	lw	a4,-52(s0)
    8000968c:	67c1                	lui	a5,0x10
    8000968e:	0785                	addi	a5,a5,1
    80009690:	97ba                	add	a5,a5,a4
    80009692:	07b2                	slli	a5,a5,0xc
    80009694:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    80009698:	873e                	mv	a4,a5
    8000969a:	47a1                	li	a5,8
    8000969c:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    8000969e:	0004d717          	auipc	a4,0x4d
    800096a2:	9ea70713          	addi	a4,a4,-1558 # 80056088 <disk>
    800096a6:	fcc42683          	lw	a3,-52(s0)
    800096aa:	15000793          	li	a5,336
    800096ae:	02f687b3          	mul	a5,a3,a5
    800096b2:	97ba                	add	a5,a5,a4
    800096b4:	679c                	ld	a5,8(a5)
    800096b6:	86be                	mv	a3,a5
    800096b8:	fcc42703          	lw	a4,-52(s0)
    800096bc:	67c1                	lui	a5,0x10
    800096be:	0785                	addi	a5,a5,1
    800096c0:	97ba                	add	a5,a5,a4
    800096c2:	07b2                	slli	a5,a5,0xc
    800096c4:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    800096c8:	873e                	mv	a4,a5
    800096ca:	0006879b          	sext.w	a5,a3
    800096ce:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    800096d0:	0004d717          	auipc	a4,0x4d
    800096d4:	9b870713          	addi	a4,a4,-1608 # 80056088 <disk>
    800096d8:	fcc42683          	lw	a3,-52(s0)
    800096dc:	15000793          	li	a5,336
    800096e0:	02f687b3          	mul	a5,a3,a5
    800096e4:	97ba                	add	a5,a5,a4
    800096e6:	679c                	ld	a5,8(a5)
    800096e8:	0207d693          	srli	a3,a5,0x20
    800096ec:	fcc42703          	lw	a4,-52(s0)
    800096f0:	67c1                	lui	a5,0x10
    800096f2:	0785                	addi	a5,a5,1
    800096f4:	97ba                	add	a5,a5,a4
    800096f6:	07b2                	slli	a5,a5,0xc
    800096f8:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    800096fc:	873e                	mv	a4,a5
    800096fe:	0006879b          	sext.w	a5,a3
    80009702:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009704:	0004d717          	auipc	a4,0x4d
    80009708:	98470713          	addi	a4,a4,-1660 # 80056088 <disk>
    8000970c:	fcc42683          	lw	a3,-52(s0)
    80009710:	15000793          	li	a5,336
    80009714:	02f687b3          	mul	a5,a3,a5
    80009718:	97ba                	add	a5,a5,a4
    8000971a:	6b9c                	ld	a5,16(a5)
    8000971c:	86be                	mv	a3,a5
    8000971e:	fcc42703          	lw	a4,-52(s0)
    80009722:	67c1                	lui	a5,0x10
    80009724:	0785                	addi	a5,a5,1
    80009726:	97ba                	add	a5,a5,a4
    80009728:	07b2                	slli	a5,a5,0xc
    8000972a:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    8000972e:	873e                	mv	a4,a5
    80009730:	0006879b          	sext.w	a5,a3
    80009734:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    80009736:	0004d717          	auipc	a4,0x4d
    8000973a:	95270713          	addi	a4,a4,-1710 # 80056088 <disk>
    8000973e:	fcc42683          	lw	a3,-52(s0)
    80009742:	15000793          	li	a5,336
    80009746:	02f687b3          	mul	a5,a3,a5
    8000974a:	97ba                	add	a5,a5,a4
    8000974c:	6b9c                	ld	a5,16(a5)
    8000974e:	0207d693          	srli	a3,a5,0x20
    80009752:	fcc42703          	lw	a4,-52(s0)
    80009756:	67c1                	lui	a5,0x10
    80009758:	0785                	addi	a5,a5,1
    8000975a:	97ba                	add	a5,a5,a4
    8000975c:	07b2                	slli	a5,a5,0xc
    8000975e:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    80009762:	873e                	mv	a4,a5
    80009764:	0006879b          	sext.w	a5,a3
    80009768:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    8000976a:	0004d717          	auipc	a4,0x4d
    8000976e:	91e70713          	addi	a4,a4,-1762 # 80056088 <disk>
    80009772:	fcc42683          	lw	a3,-52(s0)
    80009776:	15000793          	li	a5,336
    8000977a:	02f687b3          	mul	a5,a3,a5
    8000977e:	97ba                	add	a5,a5,a4
    80009780:	6f9c                	ld	a5,24(a5)
    80009782:	86be                	mv	a3,a5
    80009784:	fcc42703          	lw	a4,-52(s0)
    80009788:	67c1                	lui	a5,0x10
    8000978a:	0785                	addi	a5,a5,1
    8000978c:	97ba                	add	a5,a5,a4
    8000978e:	07b2                	slli	a5,a5,0xc
    80009790:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    80009794:	873e                	mv	a4,a5
    80009796:	0006879b          	sext.w	a5,a3
    8000979a:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    8000979c:	0004d717          	auipc	a4,0x4d
    800097a0:	8ec70713          	addi	a4,a4,-1812 # 80056088 <disk>
    800097a4:	fcc42683          	lw	a3,-52(s0)
    800097a8:	15000793          	li	a5,336
    800097ac:	02f687b3          	mul	a5,a3,a5
    800097b0:	97ba                	add	a5,a5,a4
    800097b2:	6f9c                	ld	a5,24(a5)
    800097b4:	0207d693          	srli	a3,a5,0x20
    800097b8:	fcc42703          	lw	a4,-52(s0)
    800097bc:	67c1                	lui	a5,0x10
    800097be:	0785                	addi	a5,a5,1
    800097c0:	97ba                	add	a5,a5,a4
    800097c2:	07b2                	slli	a5,a5,0xc
    800097c4:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    800097c8:	873e                	mv	a4,a5
    800097ca:	0006879b          	sext.w	a5,a3
    800097ce:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    800097d0:	fcc42703          	lw	a4,-52(s0)
    800097d4:	67c1                	lui	a5,0x10
    800097d6:	0785                	addi	a5,a5,1
    800097d8:	97ba                	add	a5,a5,a4
    800097da:	07b2                	slli	a5,a5,0xc
    800097dc:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    800097e0:	873e                	mv	a4,a5
    800097e2:	4785                	li	a5,1
    800097e4:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    800097e6:	fe042623          	sw	zero,-20(s0)
    800097ea:	a03d                	j	80009818 <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    800097ec:	0004d697          	auipc	a3,0x4d
    800097f0:	89c68693          	addi	a3,a3,-1892 # 80056088 <disk>
    800097f4:	fec42703          	lw	a4,-20(s0)
    800097f8:	fcc42603          	lw	a2,-52(s0)
    800097fc:	15000793          	li	a5,336
    80009800:	02f607b3          	mul	a5,a2,a5
    80009804:	97b6                	add	a5,a5,a3
    80009806:	97ba                	add	a5,a5,a4
    80009808:	4705                	li	a4,1
    8000980a:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    8000980e:	fec42783          	lw	a5,-20(s0)
    80009812:	2785                	addiw	a5,a5,1
    80009814:	fef42623          	sw	a5,-20(s0)
    80009818:	fec42783          	lw	a5,-20(s0)
    8000981c:	0007871b          	sext.w	a4,a5
    80009820:	479d                	li	a5,7
    80009822:	fce7d5e3          	bge	a5,a4,800097ec <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    80009826:	fe842783          	lw	a5,-24(s0)
    8000982a:	0047e793          	ori	a5,a5,4
    8000982e:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009832:	fcc42703          	lw	a4,-52(s0)
    80009836:	67c1                	lui	a5,0x10
    80009838:	0785                	addi	a5,a5,1
    8000983a:	97ba                	add	a5,a5,a4
    8000983c:	07b2                	slli	a5,a5,0xc
    8000983e:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009842:	873e                	mv	a4,a5
    80009844:	fe842783          	lw	a5,-24(s0)
    80009848:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    8000984a:	fcc42783          	lw	a5,-52(s0)
    8000984e:	0007871b          	sext.w	a4,a5
    80009852:	4785                	li	a5,1
    80009854:	06f71663          	bne	a4,a5,800098c0 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    80009858:	ffff8097          	auipc	ra,0xffff8
    8000985c:	97e080e7          	jalr	-1666(ra) # 800011d6 <kalloc>
    80009860:	872a                	mv	a4,a0
    80009862:	0004d797          	auipc	a5,0x4d
    80009866:	ac678793          	addi	a5,a5,-1338 # 80056328 <swap_buffer>
    8000986a:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    8000986c:	0004d797          	auipc	a5,0x4d
    80009870:	abc78793          	addi	a5,a5,-1348 # 80056328 <swap_buffer>
    80009874:	639c                	ld	a5,0(a5)
    80009876:	eb89                	bnez	a5,80009888 <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    80009878:	00003517          	auipc	a0,0x3
    8000987c:	ec050513          	addi	a0,a0,-320 # 8000c738 <etext+0x738>
    80009880:	ffff7097          	auipc	ra,0xffff7
    80009884:	40c080e7          	jalr	1036(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    80009888:	0004d797          	auipc	a5,0x4d
    8000988c:	aa078793          	addi	a5,a5,-1376 # 80056328 <swap_buffer>
    80009890:	639c                	ld	a5,0(a5)
    80009892:	40000613          	li	a2,1024
    80009896:	4581                	li	a1,0
    80009898:	853e                	mv	a0,a5
    8000989a:	ffff8097          	auipc	ra,0xffff8
    8000989e:	ca2080e7          	jalr	-862(ra) # 8000153c <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    800098a2:	0004d797          	auipc	a5,0x4d
    800098a6:	a8678793          	addi	a5,a5,-1402 # 80056328 <swap_buffer>
    800098aa:	639c                	ld	a5,0(a5)
    800098ac:	07c1                	addi	a5,a5,16
    800098ae:	00003597          	auipc	a1,0x3
    800098b2:	eba58593          	addi	a1,a1,-326 # 8000c768 <etext+0x768>
    800098b6:	853e                	mv	a0,a5
    800098b8:	ffffd097          	auipc	ra,0xffffd
    800098bc:	30a080e7          	jalr	778(ra) # 80006bc2 <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    800098c0:	0001                	nop
    800098c2:	70e2                	ld	ra,56(sp)
    800098c4:	7442                	ld	s0,48(sp)
    800098c6:	6121                	addi	sp,sp,64
    800098c8:	8082                	ret

00000000800098ca <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    800098ca:	7179                	addi	sp,sp,-48
    800098cc:	f422                	sd	s0,40(sp)
    800098ce:	1800                	addi	s0,sp,48
    800098d0:	87aa                	mv	a5,a0
    800098d2:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    800098d6:	fe042623          	sw	zero,-20(s0)
    800098da:	a891                	j	8000992e <alloc_desc+0x64>
    if(disk[id].free[i]){
    800098dc:	0004c697          	auipc	a3,0x4c
    800098e0:	7ac68693          	addi	a3,a3,1964 # 80056088 <disk>
    800098e4:	fec42703          	lw	a4,-20(s0)
    800098e8:	fdc42603          	lw	a2,-36(s0)
    800098ec:	15000793          	li	a5,336
    800098f0:	02f607b3          	mul	a5,a2,a5
    800098f4:	97b6                	add	a5,a5,a3
    800098f6:	97ba                	add	a5,a5,a4
    800098f8:	0207c783          	lbu	a5,32(a5)
    800098fc:	c785                	beqz	a5,80009924 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    800098fe:	0004c697          	auipc	a3,0x4c
    80009902:	78a68693          	addi	a3,a3,1930 # 80056088 <disk>
    80009906:	fec42703          	lw	a4,-20(s0)
    8000990a:	fdc42603          	lw	a2,-36(s0)
    8000990e:	15000793          	li	a5,336
    80009912:	02f607b3          	mul	a5,a2,a5
    80009916:	97b6                	add	a5,a5,a3
    80009918:	97ba                	add	a5,a5,a4
    8000991a:	02078023          	sb	zero,32(a5)
      return i;
    8000991e:	fec42783          	lw	a5,-20(s0)
    80009922:	a831                	j	8000993e <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    80009924:	fec42783          	lw	a5,-20(s0)
    80009928:	2785                	addiw	a5,a5,1
    8000992a:	fef42623          	sw	a5,-20(s0)
    8000992e:	fec42783          	lw	a5,-20(s0)
    80009932:	0007871b          	sext.w	a4,a5
    80009936:	479d                	li	a5,7
    80009938:	fae7d2e3          	bge	a5,a4,800098dc <alloc_desc+0x12>
    }
  }
  return -1;
    8000993c:	57fd                	li	a5,-1
}
    8000993e:	853e                	mv	a0,a5
    80009940:	7422                	ld	s0,40(sp)
    80009942:	6145                	addi	sp,sp,48
    80009944:	8082                	ret

0000000080009946 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    80009946:	1101                	addi	sp,sp,-32
    80009948:	ec06                	sd	ra,24(sp)
    8000994a:	e822                	sd	s0,16(sp)
    8000994c:	1000                	addi	s0,sp,32
    8000994e:	87aa                	mv	a5,a0
    80009950:	872e                	mv	a4,a1
    80009952:	fef42623          	sw	a5,-20(s0)
    80009956:	87ba                	mv	a5,a4
    80009958:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    8000995c:	fe842783          	lw	a5,-24(s0)
    80009960:	0007871b          	sext.w	a4,a5
    80009964:	479d                	li	a5,7
    80009966:	02e7d863          	bge	a5,a4,80009996 <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    8000996a:	0004c717          	auipc	a4,0x4c
    8000996e:	71e70713          	addi	a4,a4,1822 # 80056088 <disk>
    80009972:	fec42683          	lw	a3,-20(s0)
    80009976:	15000793          	li	a5,336
    8000997a:	02f687b3          	mul	a5,a3,a5
    8000997e:	97ba                	add	a5,a5,a4
    80009980:	639c                	ld	a5,0(a5)
    80009982:	00003617          	auipc	a2,0x3
    80009986:	df660613          	addi	a2,a2,-522 # 8000c778 <etext+0x778>
    8000998a:	85be                	mv	a1,a5
    8000998c:	4509                	li	a0,2
    8000998e:	ffff7097          	auipc	ra,0xffff7
    80009992:	350080e7          	jalr	848(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    80009996:	0004c697          	auipc	a3,0x4c
    8000999a:	6f268693          	addi	a3,a3,1778 # 80056088 <disk>
    8000999e:	fe842703          	lw	a4,-24(s0)
    800099a2:	fec42603          	lw	a2,-20(s0)
    800099a6:	15000793          	li	a5,336
    800099aa:	02f607b3          	mul	a5,a2,a5
    800099ae:	97b6                	add	a5,a5,a3
    800099b0:	97ba                	add	a5,a5,a4
    800099b2:	0207c783          	lbu	a5,32(a5)
    800099b6:	c79d                	beqz	a5,800099e4 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    800099b8:	0004c717          	auipc	a4,0x4c
    800099bc:	6d070713          	addi	a4,a4,1744 # 80056088 <disk>
    800099c0:	fec42683          	lw	a3,-20(s0)
    800099c4:	15000793          	li	a5,336
    800099c8:	02f687b3          	mul	a5,a3,a5
    800099cc:	97ba                	add	a5,a5,a4
    800099ce:	639c                	ld	a5,0(a5)
    800099d0:	00003617          	auipc	a2,0x3
    800099d4:	db860613          	addi	a2,a2,-584 # 8000c788 <etext+0x788>
    800099d8:	85be                	mv	a1,a5
    800099da:	4509                	li	a0,2
    800099dc:	ffff7097          	auipc	ra,0xffff7
    800099e0:	302080e7          	jalr	770(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    800099e4:	0004c717          	auipc	a4,0x4c
    800099e8:	6a470713          	addi	a4,a4,1700 # 80056088 <disk>
    800099ec:	fec42683          	lw	a3,-20(s0)
    800099f0:	15000793          	li	a5,336
    800099f4:	02f687b3          	mul	a5,a3,a5
    800099f8:	97ba                	add	a5,a5,a4
    800099fa:	6798                	ld	a4,8(a5)
    800099fc:	fe842783          	lw	a5,-24(s0)
    80009a00:	0792                	slli	a5,a5,0x4
    80009a02:	97ba                	add	a5,a5,a4
    80009a04:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    80009a08:	0004c717          	auipc	a4,0x4c
    80009a0c:	68070713          	addi	a4,a4,1664 # 80056088 <disk>
    80009a10:	fec42683          	lw	a3,-20(s0)
    80009a14:	15000793          	li	a5,336
    80009a18:	02f687b3          	mul	a5,a3,a5
    80009a1c:	97ba                	add	a5,a5,a4
    80009a1e:	6798                	ld	a4,8(a5)
    80009a20:	fe842783          	lw	a5,-24(s0)
    80009a24:	0792                	slli	a5,a5,0x4
    80009a26:	97ba                	add	a5,a5,a4
    80009a28:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    80009a2c:	0004c717          	auipc	a4,0x4c
    80009a30:	65c70713          	addi	a4,a4,1628 # 80056088 <disk>
    80009a34:	fec42683          	lw	a3,-20(s0)
    80009a38:	15000793          	li	a5,336
    80009a3c:	02f687b3          	mul	a5,a3,a5
    80009a40:	97ba                	add	a5,a5,a4
    80009a42:	6798                	ld	a4,8(a5)
    80009a44:	fe842783          	lw	a5,-24(s0)
    80009a48:	0792                	slli	a5,a5,0x4
    80009a4a:	97ba                	add	a5,a5,a4
    80009a4c:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    80009a50:	0004c717          	auipc	a4,0x4c
    80009a54:	63870713          	addi	a4,a4,1592 # 80056088 <disk>
    80009a58:	fec42683          	lw	a3,-20(s0)
    80009a5c:	15000793          	li	a5,336
    80009a60:	02f687b3          	mul	a5,a3,a5
    80009a64:	97ba                	add	a5,a5,a4
    80009a66:	6798                	ld	a4,8(a5)
    80009a68:	fe842783          	lw	a5,-24(s0)
    80009a6c:	0792                	slli	a5,a5,0x4
    80009a6e:	97ba                	add	a5,a5,a4
    80009a70:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    80009a74:	0004c697          	auipc	a3,0x4c
    80009a78:	61468693          	addi	a3,a3,1556 # 80056088 <disk>
    80009a7c:	fe842703          	lw	a4,-24(s0)
    80009a80:	fec42603          	lw	a2,-20(s0)
    80009a84:	15000793          	li	a5,336
    80009a88:	02f607b3          	mul	a5,a2,a5
    80009a8c:	97b6                	add	a5,a5,a3
    80009a8e:	97ba                	add	a5,a5,a4
    80009a90:	4705                	li	a4,1
    80009a92:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    80009a96:	0004c717          	auipc	a4,0x4c
    80009a9a:	5f270713          	addi	a4,a4,1522 # 80056088 <disk>
    80009a9e:	fec42683          	lw	a3,-20(s0)
    80009aa2:	15000793          	li	a5,336
    80009aa6:	02f687b3          	mul	a5,a3,a5
    80009aaa:	97ba                	add	a5,a5,a4
    80009aac:	1487a783          	lw	a5,328(a5)
    80009ab0:	e39d                	bnez	a5,80009ad6 <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    80009ab2:	fec42703          	lw	a4,-20(s0)
    80009ab6:	15000793          	li	a5,336
    80009aba:	02f707b3          	mul	a5,a4,a5
    80009abe:	02078713          	addi	a4,a5,32
    80009ac2:	0004c797          	auipc	a5,0x4c
    80009ac6:	5c678793          	addi	a5,a5,1478 # 80056088 <disk>
    80009aca:	97ba                	add	a5,a5,a4
    80009acc:	853e                	mv	a0,a5
    80009ace:	ffffa097          	auipc	ra,0xffffa
    80009ad2:	ff6080e7          	jalr	-10(ra) # 80003ac4 <wakeup>
  }
}
    80009ad6:	0001                	nop
    80009ad8:	60e2                	ld	ra,24(sp)
    80009ada:	6442                	ld	s0,16(sp)
    80009adc:	6105                	addi	sp,sp,32
    80009ade:	8082                	ret

0000000080009ae0 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009ae0:	7179                	addi	sp,sp,-48
    80009ae2:	f406                	sd	ra,40(sp)
    80009ae4:	f022                	sd	s0,32(sp)
    80009ae6:	1800                	addi	s0,sp,48
    80009ae8:	87aa                	mv	a5,a0
    80009aea:	872e                	mv	a4,a1
    80009aec:	fcf42e23          	sw	a5,-36(s0)
    80009af0:	87ba                	mv	a5,a4
    80009af2:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    80009af6:	0004c717          	auipc	a4,0x4c
    80009afa:	59270713          	addi	a4,a4,1426 # 80056088 <disk>
    80009afe:	fdc42683          	lw	a3,-36(s0)
    80009b02:	15000793          	li	a5,336
    80009b06:	02f687b3          	mul	a5,a3,a5
    80009b0a:	97ba                	add	a5,a5,a4
    80009b0c:	6798                	ld	a4,8(a5)
    80009b0e:	fd842783          	lw	a5,-40(s0)
    80009b12:	0792                	slli	a5,a5,0x4
    80009b14:	97ba                	add	a5,a5,a4
    80009b16:	00c7d783          	lhu	a5,12(a5)
    80009b1a:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009b1e:	0004c717          	auipc	a4,0x4c
    80009b22:	56a70713          	addi	a4,a4,1386 # 80056088 <disk>
    80009b26:	fdc42683          	lw	a3,-36(s0)
    80009b2a:	15000793          	li	a5,336
    80009b2e:	02f687b3          	mul	a5,a3,a5
    80009b32:	97ba                	add	a5,a5,a4
    80009b34:	6798                	ld	a4,8(a5)
    80009b36:	fd842783          	lw	a5,-40(s0)
    80009b3a:	0792                	slli	a5,a5,0x4
    80009b3c:	97ba                	add	a5,a5,a4
    80009b3e:	00e7d783          	lhu	a5,14(a5)
    80009b42:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    80009b46:	fd842703          	lw	a4,-40(s0)
    80009b4a:	fdc42783          	lw	a5,-36(s0)
    80009b4e:	85ba                	mv	a1,a4
    80009b50:	853e                	mv	a0,a5
    80009b52:	00000097          	auipc	ra,0x0
    80009b56:	df4080e7          	jalr	-524(ra) # 80009946 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    80009b5a:	fec42783          	lw	a5,-20(s0)
    80009b5e:	8b85                	andi	a5,a5,1
    80009b60:	2781                	sext.w	a5,a5
    80009b62:	c791                	beqz	a5,80009b6e <free_chain+0x8e>
      i = nxt;
    80009b64:	fe842783          	lw	a5,-24(s0)
    80009b68:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    80009b6c:	b769                	j	80009af6 <free_chain+0x16>
    else
      break;
    80009b6e:	0001                	nop
  }
}
    80009b70:	0001                	nop
    80009b72:	70a2                	ld	ra,40(sp)
    80009b74:	7402                	ld	s0,32(sp)
    80009b76:	6145                	addi	sp,sp,48
    80009b78:	8082                	ret

0000000080009b7a <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    80009b7a:	7139                	addi	sp,sp,-64
    80009b7c:	fc06                	sd	ra,56(sp)
    80009b7e:	f822                	sd	s0,48(sp)
    80009b80:	f426                	sd	s1,40(sp)
    80009b82:	0080                	addi	s0,sp,64
    80009b84:	87aa                	mv	a5,a0
    80009b86:	fcb43023          	sd	a1,-64(s0)
    80009b8a:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    80009b8e:	fc042e23          	sw	zero,-36(s0)
    80009b92:	a041                	j	80009c12 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    80009b94:	fdc42783          	lw	a5,-36(s0)
    80009b98:	078a                	slli	a5,a5,0x2
    80009b9a:	fc043703          	ld	a4,-64(s0)
    80009b9e:	00f704b3          	add	s1,a4,a5
    80009ba2:	fcc42783          	lw	a5,-52(s0)
    80009ba6:	853e                	mv	a0,a5
    80009ba8:	00000097          	auipc	ra,0x0
    80009bac:	d22080e7          	jalr	-734(ra) # 800098ca <alloc_desc>
    80009bb0:	87aa                	mv	a5,a0
    80009bb2:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009bb4:	fdc42783          	lw	a5,-36(s0)
    80009bb8:	078a                	slli	a5,a5,0x2
    80009bba:	fc043703          	ld	a4,-64(s0)
    80009bbe:	97ba                	add	a5,a5,a4
    80009bc0:	439c                	lw	a5,0(a5)
    80009bc2:	0407d363          	bgez	a5,80009c08 <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    80009bc6:	fc042c23          	sw	zero,-40(s0)
    80009bca:	a02d                	j	80009bf4 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    80009bcc:	fd842783          	lw	a5,-40(s0)
    80009bd0:	078a                	slli	a5,a5,0x2
    80009bd2:	fc043703          	ld	a4,-64(s0)
    80009bd6:	97ba                	add	a5,a5,a4
    80009bd8:	4398                	lw	a4,0(a5)
    80009bda:	fcc42783          	lw	a5,-52(s0)
    80009bde:	85ba                	mv	a1,a4
    80009be0:	853e                	mv	a0,a5
    80009be2:	00000097          	auipc	ra,0x0
    80009be6:	d64080e7          	jalr	-668(ra) # 80009946 <free_desc>
      for(int j = 0; j < i; j++)
    80009bea:	fd842783          	lw	a5,-40(s0)
    80009bee:	2785                	addiw	a5,a5,1
    80009bf0:	fcf42c23          	sw	a5,-40(s0)
    80009bf4:	fd842703          	lw	a4,-40(s0)
    80009bf8:	fdc42783          	lw	a5,-36(s0)
    80009bfc:	2701                	sext.w	a4,a4
    80009bfe:	2781                	sext.w	a5,a5
    80009c00:	fcf746e3          	blt	a4,a5,80009bcc <alloc3_desc+0x52>
      return -1;
    80009c04:	57fd                	li	a5,-1
    80009c06:	a831                	j	80009c22 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    80009c08:	fdc42783          	lw	a5,-36(s0)
    80009c0c:	2785                	addiw	a5,a5,1
    80009c0e:	fcf42e23          	sw	a5,-36(s0)
    80009c12:	fdc42783          	lw	a5,-36(s0)
    80009c16:	0007871b          	sext.w	a4,a5
    80009c1a:	4789                	li	a5,2
    80009c1c:	f6e7dce3          	bge	a5,a4,80009b94 <alloc3_desc+0x1a>
    }
  }
  return 0;
    80009c20:	4781                	li	a5,0
}
    80009c22:	853e                	mv	a0,a5
    80009c24:	70e2                	ld	ra,56(sp)
    80009c26:	7442                	ld	s0,48(sp)
    80009c28:	74a2                	ld	s1,40(sp)
    80009c2a:	6121                	addi	sp,sp,64
    80009c2c:	8082                	ret

0000000080009c2e <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    80009c2e:	715d                	addi	sp,sp,-80
    80009c30:	e486                	sd	ra,72(sp)
    80009c32:	e0a2                	sd	s0,64(sp)
    80009c34:	0880                	addi	s0,sp,80
    80009c36:	87aa                	mv	a5,a0
    80009c38:	fcb43023          	sd	a1,-64(s0)
    80009c3c:	8736                	mv	a4,a3
    80009c3e:	fcf42623          	sw	a5,-52(s0)
    80009c42:	87b2                	mv	a5,a2
    80009c44:	fcf42423          	sw	a5,-56(s0)
    80009c48:	87ba                	mv	a5,a4
    80009c4a:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80009c4e:	fc043783          	ld	a5,-64(s0)
    80009c52:	47dc                	lw	a5,12(a5)
    80009c54:	0017979b          	slliw	a5,a5,0x1
    80009c58:	2781                	sext.w	a5,a5
    80009c5a:	1782                	slli	a5,a5,0x20
    80009c5c:	9381                	srli	a5,a5,0x20
    80009c5e:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    80009c62:	fcc42703          	lw	a4,-52(s0)
    80009c66:	15000793          	li	a5,336
    80009c6a:	02f707b3          	mul	a5,a4,a5
    80009c6e:	13078713          	addi	a4,a5,304
    80009c72:	0004c797          	auipc	a5,0x4c
    80009c76:	41678793          	addi	a5,a5,1046 # 80056088 <disk>
    80009c7a:	97ba                	add	a5,a5,a4
    80009c7c:	853e                	mv	a0,a5
    80009c7e:	ffff7097          	auipc	ra,0xffff7
    80009c82:	6ea080e7          	jalr	1770(ra) # 80001368 <acquire>
  disk[id].bw_transfer = busy_wait;
    80009c86:	0004c717          	auipc	a4,0x4c
    80009c8a:	40270713          	addi	a4,a4,1026 # 80056088 <disk>
    80009c8e:	fcc42683          	lw	a3,-52(s0)
    80009c92:	15000793          	li	a5,336
    80009c96:	02f687b3          	mul	a5,a3,a5
    80009c9a:	97ba                	add	a5,a5,a4
    80009c9c:	fbc42703          	lw	a4,-68(s0)
    80009ca0:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    80009ca4:	fd040713          	addi	a4,s0,-48
    80009ca8:	fcc42783          	lw	a5,-52(s0)
    80009cac:	85ba                	mv	a1,a4
    80009cae:	853e                	mv	a0,a5
    80009cb0:	00000097          	auipc	ra,0x0
    80009cb4:	eca080e7          	jalr	-310(ra) # 80009b7a <alloc3_desc>
    80009cb8:	87aa                	mv	a5,a0
    80009cba:	c3e9                	beqz	a5,80009d7c <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    80009cbc:	fbc42783          	lw	a5,-68(s0)
    80009cc0:	2781                	sext.w	a5,a5
    80009cc2:	e3b9                	bnez	a5,80009d08 <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    80009cc4:	fcc42703          	lw	a4,-52(s0)
    80009cc8:	15000793          	li	a5,336
    80009ccc:	02f707b3          	mul	a5,a4,a5
    80009cd0:	02078713          	addi	a4,a5,32
    80009cd4:	0004c797          	auipc	a5,0x4c
    80009cd8:	3b478793          	addi	a5,a5,948 # 80056088 <disk>
    80009cdc:	00f706b3          	add	a3,a4,a5
    80009ce0:	fcc42703          	lw	a4,-52(s0)
    80009ce4:	15000793          	li	a5,336
    80009ce8:	02f707b3          	mul	a5,a4,a5
    80009cec:	13078713          	addi	a4,a5,304
    80009cf0:	0004c797          	auipc	a5,0x4c
    80009cf4:	39878793          	addi	a5,a5,920 # 80056088 <disk>
    80009cf8:	97ba                	add	a5,a5,a4
    80009cfa:	85be                	mv	a1,a5
    80009cfc:	8536                	mv	a0,a3
    80009cfe:	ffffa097          	auipc	ra,0xffffa
    80009d02:	d4a080e7          	jalr	-694(ra) # 80003a48 <sleep>
    80009d06:	bf79                	j	80009ca4 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    80009d08:	fcc42703          	lw	a4,-52(s0)
    80009d0c:	15000793          	li	a5,336
    80009d10:	02f707b3          	mul	a5,a4,a5
    80009d14:	13078713          	addi	a4,a5,304
    80009d18:	0004c797          	auipc	a5,0x4c
    80009d1c:	37078793          	addi	a5,a5,880 # 80056088 <disk>
    80009d20:	97ba                	add	a5,a5,a4
    80009d22:	853e                	mv	a0,a5
    80009d24:	ffff7097          	auipc	ra,0xffff7
    80009d28:	6a8080e7          	jalr	1704(ra) # 800013cc <release>
        intr_on();
    80009d2c:	fffff097          	auipc	ra,0xfffff
    80009d30:	364080e7          	jalr	868(ra) # 80009090 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    80009d34:	0001                	nop
    80009d36:	fd040713          	addi	a4,s0,-48
    80009d3a:	fcc42783          	lw	a5,-52(s0)
    80009d3e:	85ba                	mv	a1,a4
    80009d40:	853e                	mv	a0,a5
    80009d42:	00000097          	auipc	ra,0x0
    80009d46:	e38080e7          	jalr	-456(ra) # 80009b7a <alloc3_desc>
    80009d4a:	87aa                	mv	a5,a0
    80009d4c:	f7ed                	bnez	a5,80009d36 <virtio_disk_rw+0x108>
        intr_off();
    80009d4e:	fffff097          	auipc	ra,0xfffff
    80009d52:	36c080e7          	jalr	876(ra) # 800090ba <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009d56:	fcc42703          	lw	a4,-52(s0)
    80009d5a:	15000793          	li	a5,336
    80009d5e:	02f707b3          	mul	a5,a4,a5
    80009d62:	13078713          	addi	a4,a5,304
    80009d66:	0004c797          	auipc	a5,0x4c
    80009d6a:	32278793          	addi	a5,a5,802 # 80056088 <disk>
    80009d6e:	97ba                	add	a5,a5,a4
    80009d70:	853e                	mv	a0,a5
    80009d72:	ffff7097          	auipc	ra,0xffff7
    80009d76:	5f6080e7          	jalr	1526(ra) # 80001368 <acquire>
    if(alloc3_desc(id, idx) == 0) {
    80009d7a:	b72d                	j	80009ca4 <virtio_disk_rw+0x76>
      break;
    80009d7c:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    80009d7e:	fd042683          	lw	a3,-48(s0)
    80009d82:	fcc42703          	lw	a4,-52(s0)
    80009d86:	87ba                	mv	a5,a4
    80009d88:	078a                	slli	a5,a5,0x2
    80009d8a:	97ba                	add	a5,a5,a4
    80009d8c:	078a                	slli	a5,a5,0x2
    80009d8e:	97ba                	add	a5,a5,a4
    80009d90:	97b6                	add	a5,a5,a3
    80009d92:	07ad                	addi	a5,a5,11
    80009d94:	00479713          	slli	a4,a5,0x4
    80009d98:	0004c797          	auipc	a5,0x4c
    80009d9c:	2f078793          	addi	a5,a5,752 # 80056088 <disk>
    80009da0:	97ba                	add	a5,a5,a4
    80009da2:	fef43023          	sd	a5,-32(s0)

  if(write)
    80009da6:	fc842783          	lw	a5,-56(s0)
    80009daa:	2781                	sext.w	a5,a5
    80009dac:	c791                	beqz	a5,80009db8 <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009dae:	fe043783          	ld	a5,-32(s0)
    80009db2:	4705                	li	a4,1
    80009db4:	c398                	sw	a4,0(a5)
    80009db6:	a029                	j	80009dc0 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    80009db8:	fe043783          	ld	a5,-32(s0)
    80009dbc:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009dc0:	fe043783          	ld	a5,-32(s0)
    80009dc4:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    80009dc8:	fe043783          	ld	a5,-32(s0)
    80009dcc:	fe843703          	ld	a4,-24(s0)
    80009dd0:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    80009dd2:	0004c717          	auipc	a4,0x4c
    80009dd6:	2b670713          	addi	a4,a4,694 # 80056088 <disk>
    80009dda:	fcc42683          	lw	a3,-52(s0)
    80009dde:	15000793          	li	a5,336
    80009de2:	02f687b3          	mul	a5,a3,a5
    80009de6:	97ba                	add	a5,a5,a4
    80009de8:	6798                	ld	a4,8(a5)
    80009dea:	fd042783          	lw	a5,-48(s0)
    80009dee:	0792                	slli	a5,a5,0x4
    80009df0:	97ba                	add	a5,a5,a4
    80009df2:	fe043703          	ld	a4,-32(s0)
    80009df6:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    80009df8:	0004c717          	auipc	a4,0x4c
    80009dfc:	29070713          	addi	a4,a4,656 # 80056088 <disk>
    80009e00:	fcc42683          	lw	a3,-52(s0)
    80009e04:	15000793          	li	a5,336
    80009e08:	02f687b3          	mul	a5,a3,a5
    80009e0c:	97ba                	add	a5,a5,a4
    80009e0e:	6798                	ld	a4,8(a5)
    80009e10:	fd042783          	lw	a5,-48(s0)
    80009e14:	0792                	slli	a5,a5,0x4
    80009e16:	97ba                	add	a5,a5,a4
    80009e18:	4741                	li	a4,16
    80009e1a:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009e1c:	0004c717          	auipc	a4,0x4c
    80009e20:	26c70713          	addi	a4,a4,620 # 80056088 <disk>
    80009e24:	fcc42683          	lw	a3,-52(s0)
    80009e28:	15000793          	li	a5,336
    80009e2c:	02f687b3          	mul	a5,a3,a5
    80009e30:	97ba                	add	a5,a5,a4
    80009e32:	6798                	ld	a4,8(a5)
    80009e34:	fd042783          	lw	a5,-48(s0)
    80009e38:	0792                	slli	a5,a5,0x4
    80009e3a:	97ba                	add	a5,a5,a4
    80009e3c:	4705                	li	a4,1
    80009e3e:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    80009e42:	fd442603          	lw	a2,-44(s0)
    80009e46:	0004c717          	auipc	a4,0x4c
    80009e4a:	24270713          	addi	a4,a4,578 # 80056088 <disk>
    80009e4e:	fcc42683          	lw	a3,-52(s0)
    80009e52:	15000793          	li	a5,336
    80009e56:	02f687b3          	mul	a5,a3,a5
    80009e5a:	97ba                	add	a5,a5,a4
    80009e5c:	6798                	ld	a4,8(a5)
    80009e5e:	fd042783          	lw	a5,-48(s0)
    80009e62:	0792                	slli	a5,a5,0x4
    80009e64:	97ba                	add	a5,a5,a4
    80009e66:	03061713          	slli	a4,a2,0x30
    80009e6a:	9341                	srli	a4,a4,0x30
    80009e6c:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    80009e70:	fc043783          	ld	a5,-64(s0)
    80009e74:	05878613          	addi	a2,a5,88
    80009e78:	0004c717          	auipc	a4,0x4c
    80009e7c:	21070713          	addi	a4,a4,528 # 80056088 <disk>
    80009e80:	fcc42683          	lw	a3,-52(s0)
    80009e84:	15000793          	li	a5,336
    80009e88:	02f687b3          	mul	a5,a3,a5
    80009e8c:	97ba                	add	a5,a5,a4
    80009e8e:	6798                	ld	a4,8(a5)
    80009e90:	fd442783          	lw	a5,-44(s0)
    80009e94:	0792                	slli	a5,a5,0x4
    80009e96:	97ba                	add	a5,a5,a4
    80009e98:	8732                	mv	a4,a2
    80009e9a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    80009e9c:	0004c717          	auipc	a4,0x4c
    80009ea0:	1ec70713          	addi	a4,a4,492 # 80056088 <disk>
    80009ea4:	fcc42683          	lw	a3,-52(s0)
    80009ea8:	15000793          	li	a5,336
    80009eac:	02f687b3          	mul	a5,a3,a5
    80009eb0:	97ba                	add	a5,a5,a4
    80009eb2:	6798                	ld	a4,8(a5)
    80009eb4:	fd442783          	lw	a5,-44(s0)
    80009eb8:	0792                	slli	a5,a5,0x4
    80009eba:	97ba                	add	a5,a5,a4
    80009ebc:	40000713          	li	a4,1024
    80009ec0:	c798                	sw	a4,8(a5)
  if(write)
    80009ec2:	fc842783          	lw	a5,-56(s0)
    80009ec6:	2781                	sext.w	a5,a5
    80009ec8:	c785                	beqz	a5,80009ef0 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    80009eca:	0004c717          	auipc	a4,0x4c
    80009ece:	1be70713          	addi	a4,a4,446 # 80056088 <disk>
    80009ed2:	fcc42683          	lw	a3,-52(s0)
    80009ed6:	15000793          	li	a5,336
    80009eda:	02f687b3          	mul	a5,a3,a5
    80009ede:	97ba                	add	a5,a5,a4
    80009ee0:	6798                	ld	a4,8(a5)
    80009ee2:	fd442783          	lw	a5,-44(s0)
    80009ee6:	0792                	slli	a5,a5,0x4
    80009ee8:	97ba                	add	a5,a5,a4
    80009eea:	00079623          	sh	zero,12(a5)
    80009eee:	a025                	j	80009f16 <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009ef0:	0004c717          	auipc	a4,0x4c
    80009ef4:	19870713          	addi	a4,a4,408 # 80056088 <disk>
    80009ef8:	fcc42683          	lw	a3,-52(s0)
    80009efc:	15000793          	li	a5,336
    80009f00:	02f687b3          	mul	a5,a3,a5
    80009f04:	97ba                	add	a5,a5,a4
    80009f06:	6798                	ld	a4,8(a5)
    80009f08:	fd442783          	lw	a5,-44(s0)
    80009f0c:	0792                	slli	a5,a5,0x4
    80009f0e:	97ba                	add	a5,a5,a4
    80009f10:	4709                	li	a4,2
    80009f12:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80009f16:	0004c717          	auipc	a4,0x4c
    80009f1a:	17270713          	addi	a4,a4,370 # 80056088 <disk>
    80009f1e:	fcc42683          	lw	a3,-52(s0)
    80009f22:	15000793          	li	a5,336
    80009f26:	02f687b3          	mul	a5,a3,a5
    80009f2a:	97ba                	add	a5,a5,a4
    80009f2c:	6798                	ld	a4,8(a5)
    80009f2e:	fd442783          	lw	a5,-44(s0)
    80009f32:	0792                	slli	a5,a5,0x4
    80009f34:	97ba                	add	a5,a5,a4
    80009f36:	00c7d703          	lhu	a4,12(a5)
    80009f3a:	0004c697          	auipc	a3,0x4c
    80009f3e:	14e68693          	addi	a3,a3,334 # 80056088 <disk>
    80009f42:	fcc42603          	lw	a2,-52(s0)
    80009f46:	15000793          	li	a5,336
    80009f4a:	02f607b3          	mul	a5,a2,a5
    80009f4e:	97b6                	add	a5,a5,a3
    80009f50:	6794                	ld	a3,8(a5)
    80009f52:	fd442783          	lw	a5,-44(s0)
    80009f56:	0792                	slli	a5,a5,0x4
    80009f58:	97b6                	add	a5,a5,a3
    80009f5a:	00176713          	ori	a4,a4,1
    80009f5e:	1742                	slli	a4,a4,0x30
    80009f60:	9341                	srli	a4,a4,0x30
    80009f62:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    80009f66:	fd842603          	lw	a2,-40(s0)
    80009f6a:	0004c717          	auipc	a4,0x4c
    80009f6e:	11e70713          	addi	a4,a4,286 # 80056088 <disk>
    80009f72:	fcc42683          	lw	a3,-52(s0)
    80009f76:	15000793          	li	a5,336
    80009f7a:	02f687b3          	mul	a5,a3,a5
    80009f7e:	97ba                	add	a5,a5,a4
    80009f80:	6798                	ld	a4,8(a5)
    80009f82:	fd442783          	lw	a5,-44(s0)
    80009f86:	0792                	slli	a5,a5,0x4
    80009f88:	97ba                	add	a5,a5,a4
    80009f8a:	03061713          	slli	a4,a2,0x30
    80009f8e:	9341                	srli	a4,a4,0x30
    80009f90:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    80009f94:	fd042603          	lw	a2,-48(s0)
    80009f98:	0004c697          	auipc	a3,0x4c
    80009f9c:	0f068693          	addi	a3,a3,240 # 80056088 <disk>
    80009fa0:	fcc42703          	lw	a4,-52(s0)
    80009fa4:	87ba                	mv	a5,a4
    80009fa6:	078a                	slli	a5,a5,0x2
    80009fa8:	97ba                	add	a5,a5,a4
    80009faa:	078a                	slli	a5,a5,0x2
    80009fac:	97ba                	add	a5,a5,a4
    80009fae:	97b2                	add	a5,a5,a2
    80009fb0:	078d                	addi	a5,a5,3
    80009fb2:	0792                	slli	a5,a5,0x4
    80009fb4:	97b6                	add	a5,a5,a3
    80009fb6:	577d                	li	a4,-1
    80009fb8:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009fbc:	fd042683          	lw	a3,-48(s0)
    80009fc0:	fcc42703          	lw	a4,-52(s0)
    80009fc4:	87ba                	mv	a5,a4
    80009fc6:	078a                	slli	a5,a5,0x2
    80009fc8:	97ba                	add	a5,a5,a4
    80009fca:	078a                	slli	a5,a5,0x2
    80009fcc:	97ba                	add	a5,a5,a4
    80009fce:	97b6                	add	a5,a5,a3
    80009fd0:	078d                	addi	a5,a5,3
    80009fd2:	00479713          	slli	a4,a5,0x4
    80009fd6:	0004c797          	auipc	a5,0x4c
    80009fda:	0b278793          	addi	a5,a5,178 # 80056088 <disk>
    80009fde:	97ba                	add	a5,a5,a4
    80009fe0:	00878613          	addi	a2,a5,8
    80009fe4:	0004c717          	auipc	a4,0x4c
    80009fe8:	0a470713          	addi	a4,a4,164 # 80056088 <disk>
    80009fec:	fcc42683          	lw	a3,-52(s0)
    80009ff0:	15000793          	li	a5,336
    80009ff4:	02f687b3          	mul	a5,a3,a5
    80009ff8:	97ba                	add	a5,a5,a4
    80009ffa:	6798                	ld	a4,8(a5)
    80009ffc:	fd842783          	lw	a5,-40(s0)
    8000a000:	0792                	slli	a5,a5,0x4
    8000a002:	97ba                	add	a5,a5,a4
    8000a004:	8732                	mv	a4,a2
    8000a006:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    8000a008:	0004c717          	auipc	a4,0x4c
    8000a00c:	08070713          	addi	a4,a4,128 # 80056088 <disk>
    8000a010:	fcc42683          	lw	a3,-52(s0)
    8000a014:	15000793          	li	a5,336
    8000a018:	02f687b3          	mul	a5,a3,a5
    8000a01c:	97ba                	add	a5,a5,a4
    8000a01e:	6798                	ld	a4,8(a5)
    8000a020:	fd842783          	lw	a5,-40(s0)
    8000a024:	0792                	slli	a5,a5,0x4
    8000a026:	97ba                	add	a5,a5,a4
    8000a028:	4705                	li	a4,1
    8000a02a:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    8000a02c:	0004c717          	auipc	a4,0x4c
    8000a030:	05c70713          	addi	a4,a4,92 # 80056088 <disk>
    8000a034:	fcc42683          	lw	a3,-52(s0)
    8000a038:	15000793          	li	a5,336
    8000a03c:	02f687b3          	mul	a5,a3,a5
    8000a040:	97ba                	add	a5,a5,a4
    8000a042:	6798                	ld	a4,8(a5)
    8000a044:	fd842783          	lw	a5,-40(s0)
    8000a048:	0792                	slli	a5,a5,0x4
    8000a04a:	97ba                	add	a5,a5,a4
    8000a04c:	4709                	li	a4,2
    8000a04e:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    8000a052:	0004c717          	auipc	a4,0x4c
    8000a056:	03670713          	addi	a4,a4,54 # 80056088 <disk>
    8000a05a:	fcc42683          	lw	a3,-52(s0)
    8000a05e:	15000793          	li	a5,336
    8000a062:	02f687b3          	mul	a5,a3,a5
    8000a066:	97ba                	add	a5,a5,a4
    8000a068:	6798                	ld	a4,8(a5)
    8000a06a:	fd842783          	lw	a5,-40(s0)
    8000a06e:	0792                	slli	a5,a5,0x4
    8000a070:	97ba                	add	a5,a5,a4
    8000a072:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    8000a076:	fc043783          	ld	a5,-64(s0)
    8000a07a:	4705                	li	a4,1
    8000a07c:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    8000a07e:	fd042603          	lw	a2,-48(s0)
    8000a082:	0004c697          	auipc	a3,0x4c
    8000a086:	00668693          	addi	a3,a3,6 # 80056088 <disk>
    8000a08a:	fcc42703          	lw	a4,-52(s0)
    8000a08e:	87ba                	mv	a5,a4
    8000a090:	078a                	slli	a5,a5,0x2
    8000a092:	97ba                	add	a5,a5,a4
    8000a094:	078a                	slli	a5,a5,0x2
    8000a096:	97ba                	add	a5,a5,a4
    8000a098:	97b2                	add	a5,a5,a2
    8000a09a:	078d                	addi	a5,a5,3
    8000a09c:	0792                	slli	a5,a5,0x4
    8000a09e:	97b6                	add	a5,a5,a3
    8000a0a0:	fc043703          	ld	a4,-64(s0)
    8000a0a4:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    8000a0a6:	fd042583          	lw	a1,-48(s0)
    8000a0aa:	0004c717          	auipc	a4,0x4c
    8000a0ae:	fde70713          	addi	a4,a4,-34 # 80056088 <disk>
    8000a0b2:	fcc42683          	lw	a3,-52(s0)
    8000a0b6:	15000793          	li	a5,336
    8000a0ba:	02f687b3          	mul	a5,a3,a5
    8000a0be:	97ba                	add	a5,a5,a4
    8000a0c0:	6b94                	ld	a3,16(a5)
    8000a0c2:	0004c717          	auipc	a4,0x4c
    8000a0c6:	fc670713          	addi	a4,a4,-58 # 80056088 <disk>
    8000a0ca:	fcc42603          	lw	a2,-52(s0)
    8000a0ce:	15000793          	li	a5,336
    8000a0d2:	02f607b3          	mul	a5,a2,a5
    8000a0d6:	97ba                	add	a5,a5,a4
    8000a0d8:	6b9c                	ld	a5,16(a5)
    8000a0da:	0027d783          	lhu	a5,2(a5)
    8000a0de:	2781                	sext.w	a5,a5
    8000a0e0:	8b9d                	andi	a5,a5,7
    8000a0e2:	2781                	sext.w	a5,a5
    8000a0e4:	03059713          	slli	a4,a1,0x30
    8000a0e8:	9341                	srli	a4,a4,0x30
    8000a0ea:	0786                	slli	a5,a5,0x1
    8000a0ec:	97b6                	add	a5,a5,a3
    8000a0ee:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    8000a0f2:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    8000a0f6:	0004c717          	auipc	a4,0x4c
    8000a0fa:	f9270713          	addi	a4,a4,-110 # 80056088 <disk>
    8000a0fe:	fcc42683          	lw	a3,-52(s0)
    8000a102:	15000793          	li	a5,336
    8000a106:	02f687b3          	mul	a5,a3,a5
    8000a10a:	97ba                	add	a5,a5,a4
    8000a10c:	6b9c                	ld	a5,16(a5)
    8000a10e:	0027d703          	lhu	a4,2(a5)
    8000a112:	0004c697          	auipc	a3,0x4c
    8000a116:	f7668693          	addi	a3,a3,-138 # 80056088 <disk>
    8000a11a:	fcc42603          	lw	a2,-52(s0)
    8000a11e:	15000793          	li	a5,336
    8000a122:	02f607b3          	mul	a5,a2,a5
    8000a126:	97b6                	add	a5,a5,a3
    8000a128:	6b9c                	ld	a5,16(a5)
    8000a12a:	2705                	addiw	a4,a4,1
    8000a12c:	1742                	slli	a4,a4,0x30
    8000a12e:	9341                	srli	a4,a4,0x30
    8000a130:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    8000a134:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    8000a138:	fcc42703          	lw	a4,-52(s0)
    8000a13c:	67c1                	lui	a5,0x10
    8000a13e:	0785                	addi	a5,a5,1
    8000a140:	97ba                	add	a5,a5,a4
    8000a142:	07b2                	slli	a5,a5,0xc
    8000a144:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    8000a148:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    8000a14c:	a871                	j	8000a1e8 <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    8000a14e:	fbc42783          	lw	a5,-68(s0)
    8000a152:	2781                	sext.w	a5,a5
    8000a154:	e795                	bnez	a5,8000a180 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    8000a156:	fcc42703          	lw	a4,-52(s0)
    8000a15a:	15000793          	li	a5,336
    8000a15e:	02f707b3          	mul	a5,a4,a5
    8000a162:	13078713          	addi	a4,a5,304
    8000a166:	0004c797          	auipc	a5,0x4c
    8000a16a:	f2278793          	addi	a5,a5,-222 # 80056088 <disk>
    8000a16e:	97ba                	add	a5,a5,a4
    8000a170:	85be                	mv	a1,a5
    8000a172:	fc043503          	ld	a0,-64(s0)
    8000a176:	ffffa097          	auipc	ra,0xffffa
    8000a17a:	8d2080e7          	jalr	-1838(ra) # 80003a48 <sleep>
    8000a17e:	a0ad                	j	8000a1e8 <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    8000a180:	fcc42703          	lw	a4,-52(s0)
    8000a184:	15000793          	li	a5,336
    8000a188:	02f707b3          	mul	a5,a4,a5
    8000a18c:	13078713          	addi	a4,a5,304
    8000a190:	0004c797          	auipc	a5,0x4c
    8000a194:	ef878793          	addi	a5,a5,-264 # 80056088 <disk>
    8000a198:	97ba                	add	a5,a5,a4
    8000a19a:	853e                	mv	a0,a5
    8000a19c:	ffff7097          	auipc	ra,0xffff7
    8000a1a0:	230080e7          	jalr	560(ra) # 800013cc <release>
        intr_on();
    8000a1a4:	fffff097          	auipc	ra,0xfffff
    8000a1a8:	eec080e7          	jalr	-276(ra) # 80009090 <intr_on>
        while(b->disk == 1);
    8000a1ac:	0001                	nop
    8000a1ae:	fc043783          	ld	a5,-64(s0)
    8000a1b2:	43dc                	lw	a5,4(a5)
    8000a1b4:	873e                	mv	a4,a5
    8000a1b6:	4785                	li	a5,1
    8000a1b8:	fef70be3          	beq	a4,a5,8000a1ae <virtio_disk_rw+0x580>
        intr_off();
    8000a1bc:	fffff097          	auipc	ra,0xfffff
    8000a1c0:	efe080e7          	jalr	-258(ra) # 800090ba <intr_off>
        acquire(&disk[id].vdisk_lock);
    8000a1c4:	fcc42703          	lw	a4,-52(s0)
    8000a1c8:	15000793          	li	a5,336
    8000a1cc:	02f707b3          	mul	a5,a4,a5
    8000a1d0:	13078713          	addi	a4,a5,304
    8000a1d4:	0004c797          	auipc	a5,0x4c
    8000a1d8:	eb478793          	addi	a5,a5,-332 # 80056088 <disk>
    8000a1dc:	97ba                	add	a5,a5,a4
    8000a1de:	853e                	mv	a0,a5
    8000a1e0:	ffff7097          	auipc	ra,0xffff7
    8000a1e4:	188080e7          	jalr	392(ra) # 80001368 <acquire>
  while(b->disk == 1) {
    8000a1e8:	fc043783          	ld	a5,-64(s0)
    8000a1ec:	43dc                	lw	a5,4(a5)
    8000a1ee:	873e                	mv	a4,a5
    8000a1f0:	4785                	li	a5,1
    8000a1f2:	f4f70ee3          	beq	a4,a5,8000a14e <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    8000a1f6:	fd042603          	lw	a2,-48(s0)
    8000a1fa:	0004c697          	auipc	a3,0x4c
    8000a1fe:	e8e68693          	addi	a3,a3,-370 # 80056088 <disk>
    8000a202:	fcc42703          	lw	a4,-52(s0)
    8000a206:	87ba                	mv	a5,a4
    8000a208:	078a                	slli	a5,a5,0x2
    8000a20a:	97ba                	add	a5,a5,a4
    8000a20c:	078a                	slli	a5,a5,0x2
    8000a20e:	97ba                	add	a5,a5,a4
    8000a210:	97b2                	add	a5,a5,a2
    8000a212:	078d                	addi	a5,a5,3
    8000a214:	0792                	slli	a5,a5,0x4
    8000a216:	97b6                	add	a5,a5,a3
    8000a218:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    8000a21c:	fd042703          	lw	a4,-48(s0)
    8000a220:	fcc42783          	lw	a5,-52(s0)
    8000a224:	85ba                	mv	a1,a4
    8000a226:	853e                	mv	a0,a5
    8000a228:	00000097          	auipc	ra,0x0
    8000a22c:	8b8080e7          	jalr	-1864(ra) # 80009ae0 <free_chain>

  release(&disk[id].vdisk_lock);
    8000a230:	fcc42703          	lw	a4,-52(s0)
    8000a234:	15000793          	li	a5,336
    8000a238:	02f707b3          	mul	a5,a4,a5
    8000a23c:	13078713          	addi	a4,a5,304
    8000a240:	0004c797          	auipc	a5,0x4c
    8000a244:	e4878793          	addi	a5,a5,-440 # 80056088 <disk>
    8000a248:	97ba                	add	a5,a5,a4
    8000a24a:	853e                	mv	a0,a5
    8000a24c:	ffff7097          	auipc	ra,0xffff7
    8000a250:	180080e7          	jalr	384(ra) # 800013cc <release>
}
    8000a254:	0001                	nop
    8000a256:	60a6                	ld	ra,72(sp)
    8000a258:	6406                	ld	s0,64(sp)
    8000a25a:	6161                	addi	sp,sp,80
    8000a25c:	8082                	ret

000000008000a25e <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    8000a25e:	7179                	addi	sp,sp,-48
    8000a260:	f406                	sd	ra,40(sp)
    8000a262:	f022                	sd	s0,32(sp)
    8000a264:	1800                	addi	s0,sp,48
    8000a266:	87aa                	mv	a5,a0
    8000a268:	fcb43823          	sd	a1,-48(s0)
    8000a26c:	8732                	mv	a4,a2
    8000a26e:	fcf42e23          	sw	a5,-36(s0)
    8000a272:	87ba                	mv	a5,a4
    8000a274:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    8000a278:	0004c797          	auipc	a5,0x4c
    8000a27c:	0b078793          	addi	a5,a5,176 # 80056328 <swap_buffer>
    8000a280:	639c                	ld	a5,0(a5)
    8000a282:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    8000a286:	fdc42703          	lw	a4,-36(s0)
    8000a28a:	fe843783          	ld	a5,-24(s0)
    8000a28e:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    8000a290:	fe843783          	ld	a5,-24(s0)
    8000a294:	05878793          	addi	a5,a5,88
    8000a298:	40000613          	li	a2,1024
    8000a29c:	fd043583          	ld	a1,-48(s0)
    8000a2a0:	853e                	mv	a0,a5
    8000a2a2:	ffff7097          	auipc	ra,0xffff7
    8000a2a6:	37e080e7          	jalr	894(ra) # 80001620 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    8000a2aa:	fd842783          	lw	a5,-40(s0)
    8000a2ae:	86be                	mv	a3,a5
    8000a2b0:	4605                	li	a2,1
    8000a2b2:	fe843583          	ld	a1,-24(s0)
    8000a2b6:	4505                	li	a0,1
    8000a2b8:	00000097          	auipc	ra,0x0
    8000a2bc:	976080e7          	jalr	-1674(ra) # 80009c2e <virtio_disk_rw>
}
    8000a2c0:	0001                	nop
    8000a2c2:	70a2                	ld	ra,40(sp)
    8000a2c4:	7402                	ld	s0,32(sp)
    8000a2c6:	6145                	addi	sp,sp,48
    8000a2c8:	8082                	ret

000000008000a2ca <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    8000a2ca:	7179                	addi	sp,sp,-48
    8000a2cc:	f406                	sd	ra,40(sp)
    8000a2ce:	f022                	sd	s0,32(sp)
    8000a2d0:	1800                	addi	s0,sp,48
    8000a2d2:	87aa                	mv	a5,a0
    8000a2d4:	fcb43823          	sd	a1,-48(s0)
    8000a2d8:	8732                	mv	a4,a2
    8000a2da:	fcf42e23          	sw	a5,-36(s0)
    8000a2de:	87ba                	mv	a5,a4
    8000a2e0:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    8000a2e4:	0004c797          	auipc	a5,0x4c
    8000a2e8:	04478793          	addi	a5,a5,68 # 80056328 <swap_buffer>
    8000a2ec:	639c                	ld	a5,0(a5)
    8000a2ee:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    8000a2f2:	fdc42703          	lw	a4,-36(s0)
    8000a2f6:	fe843783          	ld	a5,-24(s0)
    8000a2fa:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    8000a2fc:	fd842783          	lw	a5,-40(s0)
    8000a300:	86be                	mv	a3,a5
    8000a302:	4601                	li	a2,0
    8000a304:	fe843583          	ld	a1,-24(s0)
    8000a308:	4505                	li	a0,1
    8000a30a:	00000097          	auipc	ra,0x0
    8000a30e:	924080e7          	jalr	-1756(ra) # 80009c2e <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    8000a312:	fe843783          	ld	a5,-24(s0)
    8000a316:	05878793          	addi	a5,a5,88
    8000a31a:	40000613          	li	a2,1024
    8000a31e:	85be                	mv	a1,a5
    8000a320:	fd043503          	ld	a0,-48(s0)
    8000a324:	ffff7097          	auipc	ra,0xffff7
    8000a328:	2fc080e7          	jalr	764(ra) # 80001620 <memmove>
}
    8000a32c:	0001                	nop
    8000a32e:	70a2                	ld	ra,40(sp)
    8000a330:	7402                	ld	s0,32(sp)
    8000a332:	6145                	addi	sp,sp,48
    8000a334:	8082                	ret

000000008000a336 <deallocate_page>:

void deallocate_page(int pageno)
{
    8000a336:	1101                	addi	sp,sp,-32
    8000a338:	ec06                	sd	ra,24(sp)
    8000a33a:	e822                	sd	s0,16(sp)
    8000a33c:	1000                	addi	s0,sp,32
    8000a33e:	87aa                	mv	a5,a0
    8000a340:	fef42623          	sw	a5,-20(s0)
  clearBit(&diskbitset, pageno);
    8000a344:	fec42783          	lw	a5,-20(s0)
    8000a348:	85be                	mv	a1,a5
    8000a34a:	0004c517          	auipc	a0,0x4c
    8000a34e:	93e50513          	addi	a0,a0,-1730 # 80055c88 <diskbitset>
    8000a352:	fffff097          	auipc	ra,0xfffff
    8000a356:	dee080e7          	jalr	-530(ra) # 80009140 <clearBit>
}
    8000a35a:	0001                	nop
    8000a35c:	60e2                	ld	ra,24(sp)
    8000a35e:	6442                	ld	s0,16(sp)
    8000a360:	6105                	addi	sp,sp,32
    8000a362:	8082                	ret

000000008000a364 <write_page>:

int write_page(uchar data[BSIZE*4]) {
    8000a364:	7179                	addi	sp,sp,-48
    8000a366:	f406                	sd	ra,40(sp)
    8000a368:	f022                	sd	s0,32(sp)
    8000a36a:	1800                	addi	s0,sp,48
    8000a36c:	fca43c23          	sd	a0,-40(s0)
  int pageno = takeFirstClearBit(&diskbitset);
    8000a370:	0004c517          	auipc	a0,0x4c
    8000a374:	91850513          	addi	a0,a0,-1768 # 80055c88 <diskbitset>
    8000a378:	fffff097          	auipc	ra,0xfffff
    8000a37c:	ec8080e7          	jalr	-312(ra) # 80009240 <takeFirstClearBit>
    8000a380:	87aa                	mv	a5,a0
    8000a382:	fef42423          	sw	a5,-24(s0)
  int blockno = pageno*4;
    8000a386:	fe842783          	lw	a5,-24(s0)
    8000a38a:	0027979b          	slliw	a5,a5,0x2
    8000a38e:	fef42223          	sw	a5,-28(s0)
  if(pageno >= LRUPAGESSIZE/2) return -1;
    8000a392:	fe842783          	lw	a5,-24(s0)
    8000a396:	0007871b          	sext.w	a4,a5
    8000a39a:	6785                	lui	a5,0x1
    8000a39c:	00f74463          	blt	a4,a5,8000a3a4 <write_page+0x40>
    8000a3a0:	57fd                	li	a5,-1
    8000a3a2:	a889                	j	8000a3f4 <write_page+0x90>

  for(int i = 0; i < 4; i++)
    8000a3a4:	fe042623          	sw	zero,-20(s0)
    8000a3a8:	a82d                	j	8000a3e2 <write_page+0x7e>
  {
    write_block(blockno + i, data + i*1024, 0);
    8000a3aa:	fe442703          	lw	a4,-28(s0)
    8000a3ae:	fec42783          	lw	a5,-20(s0)
    8000a3b2:	9fb9                	addw	a5,a5,a4
    8000a3b4:	0007871b          	sext.w	a4,a5
    8000a3b8:	fec42783          	lw	a5,-20(s0)
    8000a3bc:	00a7979b          	slliw	a5,a5,0xa
    8000a3c0:	2781                	sext.w	a5,a5
    8000a3c2:	86be                	mv	a3,a5
    8000a3c4:	fd843783          	ld	a5,-40(s0)
    8000a3c8:	97b6                	add	a5,a5,a3
    8000a3ca:	4601                	li	a2,0
    8000a3cc:	85be                	mv	a1,a5
    8000a3ce:	853a                	mv	a0,a4
    8000a3d0:	00000097          	auipc	ra,0x0
    8000a3d4:	e8e080e7          	jalr	-370(ra) # 8000a25e <write_block>
  for(int i = 0; i < 4; i++)
    8000a3d8:	fec42783          	lw	a5,-20(s0)
    8000a3dc:	2785                	addiw	a5,a5,1
    8000a3de:	fef42623          	sw	a5,-20(s0)
    8000a3e2:	fec42783          	lw	a5,-20(s0)
    8000a3e6:	0007871b          	sext.w	a4,a5
    8000a3ea:	478d                	li	a5,3
    8000a3ec:	fae7dfe3          	bge	a5,a4,8000a3aa <write_page+0x46>
  }

  return pageno;
    8000a3f0:	fe842783          	lw	a5,-24(s0)
}
    8000a3f4:	853e                	mv	a0,a5
    8000a3f6:	70a2                	ld	ra,40(sp)
    8000a3f8:	7402                	ld	s0,32(sp)
    8000a3fa:	6145                	addi	sp,sp,48
    8000a3fc:	8082                	ret

000000008000a3fe <read_page>:

void read_page(int pageno, uchar data[BSIZE*4]){
    8000a3fe:	7179                	addi	sp,sp,-48
    8000a400:	f406                	sd	ra,40(sp)
    8000a402:	f022                	sd	s0,32(sp)
    8000a404:	1800                	addi	s0,sp,48
    8000a406:	87aa                	mv	a5,a0
    8000a408:	fcb43823          	sd	a1,-48(s0)
    8000a40c:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < 4; i++)
    8000a410:	fe042623          	sw	zero,-20(s0)
    8000a414:	a081                	j	8000a454 <read_page+0x56>
  {
    read_block(pageno*4 + i, data + i*1024, 0);
    8000a416:	fdc42783          	lw	a5,-36(s0)
    8000a41a:	0027979b          	slliw	a5,a5,0x2
    8000a41e:	2781                	sext.w	a5,a5
    8000a420:	fec42703          	lw	a4,-20(s0)
    8000a424:	9fb9                	addw	a5,a5,a4
    8000a426:	0007871b          	sext.w	a4,a5
    8000a42a:	fec42783          	lw	a5,-20(s0)
    8000a42e:	00a7979b          	slliw	a5,a5,0xa
    8000a432:	2781                	sext.w	a5,a5
    8000a434:	86be                	mv	a3,a5
    8000a436:	fd043783          	ld	a5,-48(s0)
    8000a43a:	97b6                	add	a5,a5,a3
    8000a43c:	4601                	li	a2,0
    8000a43e:	85be                	mv	a1,a5
    8000a440:	853a                	mv	a0,a4
    8000a442:	00000097          	auipc	ra,0x0
    8000a446:	e88080e7          	jalr	-376(ra) # 8000a2ca <read_block>
  for(int i = 0; i < 4; i++)
    8000a44a:	fec42783          	lw	a5,-20(s0)
    8000a44e:	2785                	addiw	a5,a5,1
    8000a450:	fef42623          	sw	a5,-20(s0)
    8000a454:	fec42783          	lw	a5,-20(s0)
    8000a458:	0007871b          	sext.w	a4,a5
    8000a45c:	478d                	li	a5,3
    8000a45e:	fae7dce3          	bge	a5,a4,8000a416 <read_page+0x18>
  }
  deallocate_page(pageno);
    8000a462:	fdc42783          	lw	a5,-36(s0)
    8000a466:	853e                	mv	a0,a5
    8000a468:	00000097          	auipc	ra,0x0
    8000a46c:	ece080e7          	jalr	-306(ra) # 8000a336 <deallocate_page>
}
    8000a470:	0001                	nop
    8000a472:	70a2                	ld	ra,40(sp)
    8000a474:	7402                	ld	s0,32(sp)
    8000a476:	6145                	addi	sp,sp,48
    8000a478:	8082                	ret

000000008000a47a <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    8000a47a:	7179                	addi	sp,sp,-48
    8000a47c:	f406                	sd	ra,40(sp)
    8000a47e:	f022                	sd	s0,32(sp)
    8000a480:	1800                	addi	s0,sp,48
    8000a482:	87aa                	mv	a5,a0
    8000a484:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    8000a488:	fdc42703          	lw	a4,-36(s0)
    8000a48c:	15000793          	li	a5,336
    8000a490:	02f707b3          	mul	a5,a4,a5
    8000a494:	13078713          	addi	a4,a5,304 # 1130 <_entry-0x7fffeed0>
    8000a498:	0004c797          	auipc	a5,0x4c
    8000a49c:	bf078793          	addi	a5,a5,-1040 # 80056088 <disk>
    8000a4a0:	97ba                	add	a5,a5,a4
    8000a4a2:	853e                	mv	a0,a5
    8000a4a4:	ffff7097          	auipc	ra,0xffff7
    8000a4a8:	ec4080e7          	jalr	-316(ra) # 80001368 <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000a4ac:	fdc42703          	lw	a4,-36(s0)
    8000a4b0:	67c1                	lui	a5,0x10
    8000a4b2:	0785                	addi	a5,a5,1
    8000a4b4:	97ba                	add	a5,a5,a4
    8000a4b6:	07b2                	slli	a5,a5,0xc
    8000a4b8:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    8000a4bc:	439c                	lw	a5,0(a5)
    8000a4be:	0007869b          	sext.w	a3,a5
    8000a4c2:	fdc42703          	lw	a4,-36(s0)
    8000a4c6:	67c1                	lui	a5,0x10
    8000a4c8:	0785                	addi	a5,a5,1
    8000a4ca:	97ba                	add	a5,a5,a4
    8000a4cc:	07b2                	slli	a5,a5,0xc
    8000a4ce:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    8000a4d2:	873e                	mv	a4,a5
    8000a4d4:	87b6                	mv	a5,a3
    8000a4d6:	8b8d                	andi	a5,a5,3
    8000a4d8:	2781                	sext.w	a5,a5
    8000a4da:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    8000a4dc:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    8000a4e0:	aa05                	j	8000a610 <virtio_disk_intr+0x196>
    __sync_synchronize();
    8000a4e2:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    8000a4e6:	0004c717          	auipc	a4,0x4c
    8000a4ea:	ba270713          	addi	a4,a4,-1118 # 80056088 <disk>
    8000a4ee:	fdc42683          	lw	a3,-36(s0)
    8000a4f2:	15000793          	li	a5,336
    8000a4f6:	02f687b3          	mul	a5,a3,a5
    8000a4fa:	97ba                	add	a5,a5,a4
    8000a4fc:	6f98                	ld	a4,24(a5)
    8000a4fe:	0004c697          	auipc	a3,0x4c
    8000a502:	b8a68693          	addi	a3,a3,-1142 # 80056088 <disk>
    8000a506:	fdc42603          	lw	a2,-36(s0)
    8000a50a:	15000793          	li	a5,336
    8000a50e:	02f607b3          	mul	a5,a2,a5
    8000a512:	97b6                	add	a5,a5,a3
    8000a514:	0287d783          	lhu	a5,40(a5)
    8000a518:	2781                	sext.w	a5,a5
    8000a51a:	8b9d                	andi	a5,a5,7
    8000a51c:	2781                	sext.w	a5,a5
    8000a51e:	078e                	slli	a5,a5,0x3
    8000a520:	97ba                	add	a5,a5,a4
    8000a522:	43dc                	lw	a5,4(a5)
    8000a524:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    8000a528:	0004c697          	auipc	a3,0x4c
    8000a52c:	b6068693          	addi	a3,a3,-1184 # 80056088 <disk>
    8000a530:	fec42603          	lw	a2,-20(s0)
    8000a534:	fdc42703          	lw	a4,-36(s0)
    8000a538:	87ba                	mv	a5,a4
    8000a53a:	078a                	slli	a5,a5,0x2
    8000a53c:	97ba                	add	a5,a5,a4
    8000a53e:	078a                	slli	a5,a5,0x2
    8000a540:	97ba                	add	a5,a5,a4
    8000a542:	97b2                	add	a5,a5,a2
    8000a544:	078d                	addi	a5,a5,3
    8000a546:	0792                	slli	a5,a5,0x4
    8000a548:	97b6                	add	a5,a5,a3
    8000a54a:	0087c783          	lbu	a5,8(a5)
    8000a54e:	c79d                	beqz	a5,8000a57c <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    8000a550:	0004c717          	auipc	a4,0x4c
    8000a554:	b3870713          	addi	a4,a4,-1224 # 80056088 <disk>
    8000a558:	fdc42683          	lw	a3,-36(s0)
    8000a55c:	15000793          	li	a5,336
    8000a560:	02f687b3          	mul	a5,a3,a5
    8000a564:	97ba                	add	a5,a5,a4
    8000a566:	639c                	ld	a5,0(a5)
    8000a568:	00002617          	auipc	a2,0x2
    8000a56c:	23060613          	addi	a2,a2,560 # 8000c798 <etext+0x798>
    8000a570:	85be                	mv	a1,a5
    8000a572:	4509                	li	a0,2
    8000a574:	ffff6097          	auipc	ra,0xffff6
    8000a578:	76a080e7          	jalr	1898(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    8000a57c:	0004c697          	auipc	a3,0x4c
    8000a580:	b0c68693          	addi	a3,a3,-1268 # 80056088 <disk>
    8000a584:	fec42603          	lw	a2,-20(s0)
    8000a588:	fdc42703          	lw	a4,-36(s0)
    8000a58c:	87ba                	mv	a5,a4
    8000a58e:	078a                	slli	a5,a5,0x2
    8000a590:	97ba                	add	a5,a5,a4
    8000a592:	078a                	slli	a5,a5,0x2
    8000a594:	97ba                	add	a5,a5,a4
    8000a596:	97b2                	add	a5,a5,a2
    8000a598:	078d                	addi	a5,a5,3
    8000a59a:	0792                	slli	a5,a5,0x4
    8000a59c:	97b6                	add	a5,a5,a3
    8000a59e:	639c                	ld	a5,0(a5)
    8000a5a0:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    8000a5a4:	fe043783          	ld	a5,-32(s0)
    8000a5a8:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    8000a5ac:	0004c717          	auipc	a4,0x4c
    8000a5b0:	adc70713          	addi	a4,a4,-1316 # 80056088 <disk>
    8000a5b4:	fdc42683          	lw	a3,-36(s0)
    8000a5b8:	15000793          	li	a5,336
    8000a5bc:	02f687b3          	mul	a5,a3,a5
    8000a5c0:	97ba                	add	a5,a5,a4
    8000a5c2:	1487a783          	lw	a5,328(a5)
    8000a5c6:	e799                	bnez	a5,8000a5d4 <virtio_disk_intr+0x15a>
        wakeup(b);
    8000a5c8:	fe043503          	ld	a0,-32(s0)
    8000a5cc:	ffff9097          	auipc	ra,0xffff9
    8000a5d0:	4f8080e7          	jalr	1272(ra) # 80003ac4 <wakeup>
    }

    disk[id].used_idx += 1;
    8000a5d4:	0004c717          	auipc	a4,0x4c
    8000a5d8:	ab470713          	addi	a4,a4,-1356 # 80056088 <disk>
    8000a5dc:	fdc42683          	lw	a3,-36(s0)
    8000a5e0:	15000793          	li	a5,336
    8000a5e4:	02f687b3          	mul	a5,a3,a5
    8000a5e8:	97ba                	add	a5,a5,a4
    8000a5ea:	0287d783          	lhu	a5,40(a5)
    8000a5ee:	2785                	addiw	a5,a5,1
    8000a5f0:	03079713          	slli	a4,a5,0x30
    8000a5f4:	9341                	srli	a4,a4,0x30
    8000a5f6:	0004c697          	auipc	a3,0x4c
    8000a5fa:	a9268693          	addi	a3,a3,-1390 # 80056088 <disk>
    8000a5fe:	fdc42603          	lw	a2,-36(s0)
    8000a602:	15000793          	li	a5,336
    8000a606:	02f607b3          	mul	a5,a2,a5
    8000a60a:	97b6                	add	a5,a5,a3
    8000a60c:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    8000a610:	0004c717          	auipc	a4,0x4c
    8000a614:	a7870713          	addi	a4,a4,-1416 # 80056088 <disk>
    8000a618:	fdc42683          	lw	a3,-36(s0)
    8000a61c:	15000793          	li	a5,336
    8000a620:	02f687b3          	mul	a5,a3,a5
    8000a624:	97ba                	add	a5,a5,a4
    8000a626:	0287d603          	lhu	a2,40(a5)
    8000a62a:	0004c717          	auipc	a4,0x4c
    8000a62e:	a5e70713          	addi	a4,a4,-1442 # 80056088 <disk>
    8000a632:	fdc42683          	lw	a3,-36(s0)
    8000a636:	15000793          	li	a5,336
    8000a63a:	02f687b3          	mul	a5,a3,a5
    8000a63e:	97ba                	add	a5,a5,a4
    8000a640:	6f9c                	ld	a5,24(a5)
    8000a642:	0027d783          	lhu	a5,2(a5)
    8000a646:	0006071b          	sext.w	a4,a2
    8000a64a:	2781                	sext.w	a5,a5
    8000a64c:	e8f71be3          	bne	a4,a5,8000a4e2 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    8000a650:	fdc42703          	lw	a4,-36(s0)
    8000a654:	15000793          	li	a5,336
    8000a658:	02f707b3          	mul	a5,a4,a5
    8000a65c:	13078713          	addi	a4,a5,304
    8000a660:	0004c797          	auipc	a5,0x4c
    8000a664:	a2878793          	addi	a5,a5,-1496 # 80056088 <disk>
    8000a668:	97ba                	add	a5,a5,a4
    8000a66a:	853e                	mv	a0,a5
    8000a66c:	ffff7097          	auipc	ra,0xffff7
    8000a670:	d60080e7          	jalr	-672(ra) # 800013cc <release>
}
    8000a674:	0001                	nop
    8000a676:	70a2                	ld	ra,40(sp)
    8000a678:	7402                	ld	s0,32(sp)
    8000a67a:	6145                	addi	sp,sp,48
    8000a67c:	8082                	ret
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
