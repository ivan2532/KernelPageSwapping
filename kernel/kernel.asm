
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
    80000326:	00009797          	auipc	a5,0x9
    8000032a:	80a78793          	addi	a5,a5,-2038 # 80008b30 <timervec>
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
    80000408:	546080e7          	jalr	1350(ra) # 8000394a <either_copyin>
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
    8000048a:	640080e7          	jalr	1600(ra) # 80002ac6 <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	404080e7          	jalr	1028(ra) # 80003896 <killed>
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
    800004c6:	1c6080e7          	jalr	454(ra) # 80003688 <sleep>
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
    80000582:	358080e7          	jalr	856(ra) # 800038d6 <either_copyout>
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
    8000066c:	356080e7          	jalr	854(ra) # 800039be <procdump>
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
    80000836:	ed2080e7          	jalr	-302(ra) # 80003704 <wakeup>
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
    80000e78:	00003097          	auipc	ra,0x3
    80000e7c:	810080e7          	jalr	-2032(ra) # 80003688 <sleep>
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
    80000fd4:	734080e7          	jalr	1844(ra) # 80003704 <wakeup>
    
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
    80001378:	718080e7          	jalr	1816(ra) # 80002a8c <mycpu>
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
    80001404:	68c080e7          	jalr	1676(ra) # 80002a8c <mycpu>
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
    8000144a:	646080e7          	jalr	1606(ra) # 80002a8c <mycpu>
    8000144e:	87aa                	mv	a5,a0
    80001450:	5fbc                	lw	a5,120(a5)
    80001452:	eb89                	bnez	a5,80001464 <push_off+0x3c>
    mycpu()->intena = old;
    80001454:	00001097          	auipc	ra,0x1
    80001458:	638080e7          	jalr	1592(ra) # 80002a8c <mycpu>
    8000145c:	872a                	mv	a4,a0
    8000145e:	fec42783          	lw	a5,-20(s0)
    80001462:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    80001464:	00001097          	auipc	ra,0x1
    80001468:	628080e7          	jalr	1576(ra) # 80002a8c <mycpu>
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
    8000148c:	604080e7          	jalr	1540(ra) # 80002a8c <mycpu>
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
    800018be:	1ae080e7          	jalr	430(ra) # 80002a68 <cpuid>
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
    80001912:	3ac080e7          	jalr	940(ra) # 80001cba <kvminit>
    kvminithart();   // turn on paging
    80001916:	00000097          	auipc	ra,0x0
    8000191a:	3d2080e7          	jalr	978(ra) # 80001ce8 <kvminithart>
    procinit();      // process table
    8000191e:	00001097          	auipc	ra,0x1
    80001922:	07c080e7          	jalr	124(ra) # 8000299a <procinit>
    trapinit();      // trap vectors
    80001926:	00002097          	auipc	ra,0x2
    8000192a:	380080e7          	jalr	896(ra) # 80003ca6 <trapinit>
    trapinithart();  // install kernel trap vector
    8000192e:	00002097          	auipc	ra,0x2
    80001932:	3a2080e7          	jalr	930(ra) # 80003cd0 <trapinithart>
    plicinit();      // set up interrupt controller
    80001936:	00007097          	auipc	ra,0x7
    8000193a:	224080e7          	jalr	548(ra) # 80008b5a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    8000193e:	00007097          	auipc	ra,0x7
    80001942:	24a080e7          	jalr	586(ra) # 80008b88 <plicinithart>
    binit();         // buffer cache
    80001946:	00003097          	auipc	ra,0x3
    8000194a:	dbc080e7          	jalr	-580(ra) # 80004702 <binit>
    iinit();         // inode table
    8000194e:	00003097          	auipc	ra,0x3
    80001952:	612080e7          	jalr	1554(ra) # 80004f60 <iinit>
    fileinit();      // file table
    80001956:	00005097          	auipc	ra,0x5
    8000195a:	fe6080e7          	jalr	-26(ra) # 8000693c <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    8000195e:	00009597          	auipc	a1,0x9
    80001962:	74258593          	addi	a1,a1,1858 # 8000b0a0 <etext+0xa0>
    80001966:	4501                	li	a0,0
    80001968:	00007097          	auipc	ra,0x7
    8000196c:	37a080e7          	jalr	890(ra) # 80008ce2 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    80001970:	00009597          	auipc	a1,0x9
    80001974:	74058593          	addi	a1,a1,1856 # 8000b0b0 <etext+0xb0>
    80001978:	4505                	li	a0,1
    8000197a:	00007097          	auipc	ra,0x7
    8000197e:	368080e7          	jalr	872(ra) # 80008ce2 <virtio_disk_init>

    userinit();      // first user process
    80001982:	00001097          	auipc	ra,0x1
    80001986:	4c4080e7          	jalr	1220(ra) # 80002e46 <userinit>
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
    800019b4:	0b8080e7          	jalr	184(ra) # 80002a68 <cpuid>
    800019b8:	87aa                	mv	a5,a0
    800019ba:	85be                	mv	a1,a5
    800019bc:	00009517          	auipc	a0,0x9
    800019c0:	70450513          	addi	a0,a0,1796 # 8000b0c0 <etext+0xc0>
    800019c4:	fffff097          	auipc	ra,0xfffff
    800019c8:	072080e7          	jalr	114(ra) # 80000a36 <printf>
    kvminithart();    // turn on paging
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	31c080e7          	jalr	796(ra) # 80001ce8 <kvminithart>
    trapinithart();   // install kernel trap vector
    800019d4:	00002097          	auipc	ra,0x2
    800019d8:	2fc080e7          	jalr	764(ra) # 80003cd0 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    800019dc:	00007097          	auipc	ra,0x7
    800019e0:	1ac080e7          	jalr	428(ra) # 80008b88 <plicinithart>
  }

  scheduler();        
    800019e4:	00002097          	auipc	ra,0x2
    800019e8:	a78080e7          	jalr	-1416(ra) # 8000345c <scheduler>

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

0000000080001a18 <getlruindex>:
#define LRUPAGESSIZE ((PHYSTOP - KERNBASE) / PGSIZE)
static struct lrupinfo lrupages[LRUPAGESSIZE] = {{0}};

uint64
getlruindex(pte_t *pte)
{
    80001a18:	1101                	addi	sp,sp,-32
    80001a1a:	ec22                	sd	s0,24(sp)
    80001a1c:	1000                	addi	s0,sp,32
    80001a1e:	fea43423          	sd	a0,-24(s0)
  return ( ((uint64)pte) >> 12 ) - ( KERNBASE >> 12 );
    80001a22:	fe843783          	ld	a5,-24(s0)
    80001a26:	00c7d713          	srli	a4,a5,0xc
    80001a2a:	fff807b7          	lui	a5,0xfff80
    80001a2e:	97ba                	add	a5,a5,a4
}
    80001a30:	853e                	mv	a0,a5
    80001a32:	6462                	ld	s0,24(sp)
    80001a34:	6105                	addi	sp,sp,32
    80001a36:	8082                	ret

0000000080001a38 <reglrupage>:

void
reglrupage(pte_t *pte)
{
    80001a38:	7179                	addi	sp,sp,-48
    80001a3a:	f406                	sd	ra,40(sp)
    80001a3c:	f022                	sd	s0,32(sp)
    80001a3e:	1800                	addi	s0,sp,48
    80001a40:	fca43c23          	sd	a0,-40(s0)
  uint64 i = getlruindex(pte);
    80001a44:	fd843503          	ld	a0,-40(s0)
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	fd0080e7          	jalr	-48(ra) # 80001a18 <getlruindex>
    80001a50:	fea43423          	sd	a0,-24(s0)
  lrupages[i].refbits = (uchar)0;
    80001a54:	00012717          	auipc	a4,0x12
    80001a58:	16470713          	addi	a4,a4,356 # 80013bb8 <lrupages>
    80001a5c:	fe843783          	ld	a5,-24(s0)
    80001a60:	0792                	slli	a5,a5,0x4
    80001a62:	97ba                	add	a5,a5,a4
    80001a64:	00078023          	sb	zero,0(a5) # fffffffffff80000 <end+0xffffffff7ff4b0d0>
  lrupages[i].pte = pte;
    80001a68:	00012717          	auipc	a4,0x12
    80001a6c:	15070713          	addi	a4,a4,336 # 80013bb8 <lrupages>
    80001a70:	fe843783          	ld	a5,-24(s0)
    80001a74:	0792                	slli	a5,a5,0x4
    80001a76:	97ba                	add	a5,a5,a4
    80001a78:	fd843703          	ld	a4,-40(s0)
    80001a7c:	e798                	sd	a4,8(a5)
}
    80001a7e:	0001                	nop
    80001a80:	70a2                	ld	ra,40(sp)
    80001a82:	7402                	ld	s0,32(sp)
    80001a84:	6145                	addi	sp,sp,48
    80001a86:	8082                	ret

0000000080001a88 <unreglrupage>:

void
unreglrupage(pte_t *pte)
{
    80001a88:	7179                	addi	sp,sp,-48
    80001a8a:	f406                	sd	ra,40(sp)
    80001a8c:	f022                	sd	s0,32(sp)
    80001a8e:	1800                	addi	s0,sp,48
    80001a90:	fca43c23          	sd	a0,-40(s0)
  uint64 i = getlruindex(pte);
    80001a94:	fd843503          	ld	a0,-40(s0)
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	f80080e7          	jalr	-128(ra) # 80001a18 <getlruindex>
    80001aa0:	fea43423          	sd	a0,-24(s0)
  lrupages[i].pte = 0;
    80001aa4:	00012717          	auipc	a4,0x12
    80001aa8:	11470713          	addi	a4,a4,276 # 80013bb8 <lrupages>
    80001aac:	fe843783          	ld	a5,-24(s0)
    80001ab0:	0792                	slli	a5,a5,0x4
    80001ab2:	97ba                	add	a5,a5,a4
    80001ab4:	0007b423          	sd	zero,8(a5)
}
    80001ab8:	0001                	nop
    80001aba:	70a2                	ld	ra,40(sp)
    80001abc:	7402                	ld	s0,32(sp)
    80001abe:	6145                	addi	sp,sp,48
    80001ac0:	8082                	ret

0000000080001ac2 <updaterefhistory>:

void
updaterefhistory()
{
    80001ac2:	1101                	addi	sp,sp,-32
    80001ac4:	ec22                	sd	s0,24(sp)
    80001ac6:	1000                	addi	s0,sp,32
  uint64 i;
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001ac8:	fe043423          	sd	zero,-24(s0)
    80001acc:	a86d                	j	80001b86 <updaterefhistory+0xc4>
  {
    if(lrupages[i].pte == 0) continue;
    80001ace:	00012717          	auipc	a4,0x12
    80001ad2:	0ea70713          	addi	a4,a4,234 # 80013bb8 <lrupages>
    80001ad6:	fe843783          	ld	a5,-24(s0)
    80001ada:	0792                	slli	a5,a5,0x4
    80001adc:	97ba                	add	a5,a5,a4
    80001ade:	679c                	ld	a5,8(a5)
    80001ae0:	cfc9                	beqz	a5,80001b7a <updaterefhistory+0xb8>
    uchar a = ( *(lrupages[i].pte) & PTE_A ) == 0 ? 0 : 1;
    80001ae2:	00012717          	auipc	a4,0x12
    80001ae6:	0d670713          	addi	a4,a4,214 # 80013bb8 <lrupages>
    80001aea:	fe843783          	ld	a5,-24(s0)
    80001aee:	0792                	slli	a5,a5,0x4
    80001af0:	97ba                	add	a5,a5,a4
    80001af2:	679c                	ld	a5,8(a5)
    80001af4:	639c                	ld	a5,0(a5)
    80001af6:	0407f793          	andi	a5,a5,64
    80001afa:	00f037b3          	snez	a5,a5
    80001afe:	0ff7f793          	andi	a5,a5,255
    80001b02:	fef403a3          	sb	a5,-25(s0)

    // Clear A bit
    *(lrupages[i].pte) = (*lrupages[i].pte) & (~PTE_A);
    80001b06:	00012717          	auipc	a4,0x12
    80001b0a:	0b270713          	addi	a4,a4,178 # 80013bb8 <lrupages>
    80001b0e:	fe843783          	ld	a5,-24(s0)
    80001b12:	0792                	slli	a5,a5,0x4
    80001b14:	97ba                	add	a5,a5,a4
    80001b16:	679c                	ld	a5,8(a5)
    80001b18:	6398                	ld	a4,0(a5)
    80001b1a:	00012697          	auipc	a3,0x12
    80001b1e:	09e68693          	addi	a3,a3,158 # 80013bb8 <lrupages>
    80001b22:	fe843783          	ld	a5,-24(s0)
    80001b26:	0792                	slli	a5,a5,0x4
    80001b28:	97b6                	add	a5,a5,a3
    80001b2a:	679c                	ld	a5,8(a5)
    80001b2c:	fbf77713          	andi	a4,a4,-65
    80001b30:	e398                	sd	a4,0(a5)

    uchar mask = a << (sizeof(uchar) * 8 - 1);
    80001b32:	fe744783          	lbu	a5,-25(s0)
    80001b36:	0077979b          	slliw	a5,a5,0x7
    80001b3a:	fef40323          	sb	a5,-26(s0)
    lrupages[i].refbits = (lrupages[i].refbits >> 1) | mask;
    80001b3e:	00012717          	auipc	a4,0x12
    80001b42:	07a70713          	addi	a4,a4,122 # 80013bb8 <lrupages>
    80001b46:	fe843783          	ld	a5,-24(s0)
    80001b4a:	0792                	slli	a5,a5,0x4
    80001b4c:	97ba                	add	a5,a5,a4
    80001b4e:	0007c783          	lbu	a5,0(a5)
    80001b52:	0017d79b          	srliw	a5,a5,0x1
    80001b56:	0ff7f713          	andi	a4,a5,255
    80001b5a:	fe644783          	lbu	a5,-26(s0)
    80001b5e:	8fd9                	or	a5,a5,a4
    80001b60:	0ff7f713          	andi	a4,a5,255
    80001b64:	00012697          	auipc	a3,0x12
    80001b68:	05468693          	addi	a3,a3,84 # 80013bb8 <lrupages>
    80001b6c:	fe843783          	ld	a5,-24(s0)
    80001b70:	0792                	slli	a5,a5,0x4
    80001b72:	97b6                	add	a5,a5,a3
    80001b74:	00e78023          	sb	a4,0(a5)
    80001b78:	a011                	j	80001b7c <updaterefhistory+0xba>
    if(lrupages[i].pte == 0) continue;
    80001b7a:	0001                	nop
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001b7c:	fe843783          	ld	a5,-24(s0)
    80001b80:	0785                	addi	a5,a5,1
    80001b82:	fef43423          	sd	a5,-24(s0)
    80001b86:	fe843703          	ld	a4,-24(s0)
    80001b8a:	6785                	lui	a5,0x1
    80001b8c:	f4f761e3          	bltu	a4,a5,80001ace <updaterefhistory+0xc>
  }
}
    80001b90:	0001                	nop
    80001b92:	0001                	nop
    80001b94:	6462                	ld	s0,24(sp)
    80001b96:	6105                	addi	sp,sp,32
    80001b98:	8082                	ret

0000000080001b9a <kvmmake>:

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001b9a:	1101                	addi	sp,sp,-32
    80001b9c:	ec06                	sd	ra,24(sp)
    80001b9e:	e822                	sd	s0,16(sp)
    80001ba0:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001ba2:	fffff097          	auipc	ra,0xfffff
    80001ba6:	634080e7          	jalr	1588(ra) # 800011d6 <kalloc>
    80001baa:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001bae:	6605                	lui	a2,0x1
    80001bb0:	4581                	li	a1,0
    80001bb2:	fe843503          	ld	a0,-24(s0)
    80001bb6:	00000097          	auipc	ra,0x0
    80001bba:	948080e7          	jalr	-1720(ra) # 800014fe <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001bbe:	4719                	li	a4,6
    80001bc0:	6685                	lui	a3,0x1
    80001bc2:	10000637          	lui	a2,0x10000
    80001bc6:	100005b7          	lui	a1,0x10000
    80001bca:	fe843503          	ld	a0,-24(s0)
    80001bce:	00000097          	auipc	ra,0x0
    80001bd2:	2b6080e7          	jalr	694(ra) # 80001e84 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001bd6:	4719                	li	a4,6
    80001bd8:	6685                	lui	a3,0x1
    80001bda:	10001637          	lui	a2,0x10001
    80001bde:	100015b7          	lui	a1,0x10001
    80001be2:	fe843503          	ld	a0,-24(s0)
    80001be6:	00000097          	auipc	ra,0x0
    80001bea:	29e080e7          	jalr	670(ra) # 80001e84 <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001bee:	4719                	li	a4,6
    80001bf0:	6685                	lui	a3,0x1
    80001bf2:	10002637          	lui	a2,0x10002
    80001bf6:	100025b7          	lui	a1,0x10002
    80001bfa:	fe843503          	ld	a0,-24(s0)
    80001bfe:	00000097          	auipc	ra,0x0
    80001c02:	286080e7          	jalr	646(ra) # 80001e84 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001c06:	4719                	li	a4,6
    80001c08:	004006b7          	lui	a3,0x400
    80001c0c:	0c000637          	lui	a2,0xc000
    80001c10:	0c0005b7          	lui	a1,0xc000
    80001c14:	fe843503          	ld	a0,-24(s0)
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	26c080e7          	jalr	620(ra) # 80001e84 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001c20:	00009717          	auipc	a4,0x9
    80001c24:	3e070713          	addi	a4,a4,992 # 8000b000 <etext>
    80001c28:	800007b7          	lui	a5,0x80000
    80001c2c:	97ba                	add	a5,a5,a4
    80001c2e:	4729                	li	a4,10
    80001c30:	86be                	mv	a3,a5
    80001c32:	4785                	li	a5,1
    80001c34:	01f79613          	slli	a2,a5,0x1f
    80001c38:	4785                	li	a5,1
    80001c3a:	01f79593          	slli	a1,a5,0x1f
    80001c3e:	fe843503          	ld	a0,-24(s0)
    80001c42:	00000097          	auipc	ra,0x0
    80001c46:	242080e7          	jalr	578(ra) # 80001e84 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001c4a:	00009597          	auipc	a1,0x9
    80001c4e:	3b658593          	addi	a1,a1,950 # 8000b000 <etext>
    80001c52:	00009617          	auipc	a2,0x9
    80001c56:	3ae60613          	addi	a2,a2,942 # 8000b000 <etext>
    80001c5a:	00009797          	auipc	a5,0x9
    80001c5e:	3a678793          	addi	a5,a5,934 # 8000b000 <etext>
    80001c62:	08100713          	li	a4,129
    80001c66:	0762                	slli	a4,a4,0x18
    80001c68:	40f707b3          	sub	a5,a4,a5
    80001c6c:	4719                	li	a4,6
    80001c6e:	86be                	mv	a3,a5
    80001c70:	fe843503          	ld	a0,-24(s0)
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	210080e7          	jalr	528(ra) # 80001e84 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001c7c:	00008797          	auipc	a5,0x8
    80001c80:	38478793          	addi	a5,a5,900 # 8000a000 <_trampoline>
    80001c84:	4729                	li	a4,10
    80001c86:	6685                	lui	a3,0x1
    80001c88:	863e                	mv	a2,a5
    80001c8a:	040007b7          	lui	a5,0x4000
    80001c8e:	17fd                	addi	a5,a5,-1
    80001c90:	00c79593          	slli	a1,a5,0xc
    80001c94:	fe843503          	ld	a0,-24(s0)
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	1ec080e7          	jalr	492(ra) # 80001e84 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001ca0:	fe843503          	ld	a0,-24(s0)
    80001ca4:	00001097          	auipc	ra,0x1
    80001ca8:	c3a080e7          	jalr	-966(ra) # 800028de <proc_mapstacks>
  
  return kpgtbl;
    80001cac:	fe843783          	ld	a5,-24(s0)
}
    80001cb0:	853e                	mv	a0,a5
    80001cb2:	60e2                	ld	ra,24(sp)
    80001cb4:	6442                	ld	s0,16(sp)
    80001cb6:	6105                	addi	sp,sp,32
    80001cb8:	8082                	ret

0000000080001cba <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001cba:	1141                	addi	sp,sp,-16
    80001cbc:	e406                	sd	ra,8(sp)
    80001cbe:	e022                	sd	s0,0(sp)
    80001cc0:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001cc2:	00000097          	auipc	ra,0x0
    80001cc6:	ed8080e7          	jalr	-296(ra) # 80001b9a <kvmmake>
    80001cca:	872a                	mv	a4,a0
    80001ccc:	0000a797          	auipc	a5,0xa
    80001cd0:	c6c78793          	addi	a5,a5,-916 # 8000b938 <kernel_pagetable>
    80001cd4:	e398                	sd	a4,0(a5)
  updaterefhistory();
    80001cd6:	00000097          	auipc	ra,0x0
    80001cda:	dec080e7          	jalr	-532(ra) # 80001ac2 <updaterefhistory>
}
    80001cde:	0001                	nop
    80001ce0:	60a2                	ld	ra,8(sp)
    80001ce2:	6402                	ld	s0,0(sp)
    80001ce4:	0141                	addi	sp,sp,16
    80001ce6:	8082                	ret

0000000080001ce8 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001ce8:	1141                	addi	sp,sp,-16
    80001cea:	e406                	sd	ra,8(sp)
    80001cec:	e022                	sd	s0,0(sp)
    80001cee:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001cf0:	00000097          	auipc	ra,0x0
    80001cf4:	d16080e7          	jalr	-746(ra) # 80001a06 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001cf8:	0000a797          	auipc	a5,0xa
    80001cfc:	c4078793          	addi	a5,a5,-960 # 8000b938 <kernel_pagetable>
    80001d00:	639c                	ld	a5,0(a5)
    80001d02:	00c7d713          	srli	a4,a5,0xc
    80001d06:	57fd                	li	a5,-1
    80001d08:	17fe                	slli	a5,a5,0x3f
    80001d0a:	8fd9                	or	a5,a5,a4
    80001d0c:	853e                	mv	a0,a5
    80001d0e:	00000097          	auipc	ra,0x0
    80001d12:	cde080e7          	jalr	-802(ra) # 800019ec <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001d16:	00000097          	auipc	ra,0x0
    80001d1a:	cf0080e7          	jalr	-784(ra) # 80001a06 <sfence_vma>
}
    80001d1e:	0001                	nop
    80001d20:	60a2                	ld	ra,8(sp)
    80001d22:	6402                	ld	s0,0(sp)
    80001d24:	0141                	addi	sp,sp,16
    80001d26:	8082                	ret

0000000080001d28 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001d28:	7139                	addi	sp,sp,-64
    80001d2a:	fc06                	sd	ra,56(sp)
    80001d2c:	f822                	sd	s0,48(sp)
    80001d2e:	0080                	addi	s0,sp,64
    80001d30:	fca43c23          	sd	a0,-40(s0)
    80001d34:	fcb43823          	sd	a1,-48(s0)
    80001d38:	87b2                	mv	a5,a2
    80001d3a:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001d3e:	fd043703          	ld	a4,-48(s0)
    80001d42:	57fd                	li	a5,-1
    80001d44:	83e9                	srli	a5,a5,0x1a
    80001d46:	00e7f463          	bgeu	a5,a4,80001d4e <walk+0x26>
    return 0;
    80001d4a:	4781                	li	a5,0
    80001d4c:	a85d                	j	80001e02 <walk+0xda>

  for(int level = 2; level > 0; level--) {
    80001d4e:	4789                	li	a5,2
    80001d50:	fef42623          	sw	a5,-20(s0)
    80001d54:	a849                	j	80001de6 <walk+0xbe>
    pte_t *pte = &pagetable[PX(level, va)];
    80001d56:	fec42703          	lw	a4,-20(s0)
    80001d5a:	87ba                	mv	a5,a4
    80001d5c:	0037979b          	slliw	a5,a5,0x3
    80001d60:	9fb9                	addw	a5,a5,a4
    80001d62:	2781                	sext.w	a5,a5
    80001d64:	27b1                	addiw	a5,a5,12
    80001d66:	2781                	sext.w	a5,a5
    80001d68:	873e                	mv	a4,a5
    80001d6a:	fd043783          	ld	a5,-48(s0)
    80001d6e:	00e7d7b3          	srl	a5,a5,a4
    80001d72:	1ff7f793          	andi	a5,a5,511
    80001d76:	078e                	slli	a5,a5,0x3
    80001d78:	fd843703          	ld	a4,-40(s0)
    80001d7c:	97ba                	add	a5,a5,a4
    80001d7e:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001d82:	fe043783          	ld	a5,-32(s0)
    80001d86:	639c                	ld	a5,0(a5)
    80001d88:	8b85                	andi	a5,a5,1
    80001d8a:	cb89                	beqz	a5,80001d9c <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001d8c:	fe043783          	ld	a5,-32(s0)
    80001d90:	639c                	ld	a5,0(a5)
    80001d92:	83a9                	srli	a5,a5,0xa
    80001d94:	07b2                	slli	a5,a5,0xc
    80001d96:	fcf43c23          	sd	a5,-40(s0)
    80001d9a:	a089                	j	80001ddc <walk+0xb4>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001d9c:	fcc42783          	lw	a5,-52(s0)
    80001da0:	2781                	sext.w	a5,a5
    80001da2:	cb91                	beqz	a5,80001db6 <walk+0x8e>
    80001da4:	fffff097          	auipc	ra,0xfffff
    80001da8:	432080e7          	jalr	1074(ra) # 800011d6 <kalloc>
    80001dac:	fca43c23          	sd	a0,-40(s0)
    80001db0:	fd843783          	ld	a5,-40(s0)
    80001db4:	e399                	bnez	a5,80001dba <walk+0x92>
        return 0;
    80001db6:	4781                	li	a5,0
    80001db8:	a0a9                	j	80001e02 <walk+0xda>
      memset(pagetable, 0, PGSIZE);
    80001dba:	6605                	lui	a2,0x1
    80001dbc:	4581                	li	a1,0
    80001dbe:	fd843503          	ld	a0,-40(s0)
    80001dc2:	fffff097          	auipc	ra,0xfffff
    80001dc6:	73c080e7          	jalr	1852(ra) # 800014fe <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001dca:	fd843783          	ld	a5,-40(s0)
    80001dce:	83b1                	srli	a5,a5,0xc
    80001dd0:	07aa                	slli	a5,a5,0xa
    80001dd2:	0017e713          	ori	a4,a5,1
    80001dd6:	fe043783          	ld	a5,-32(s0)
    80001dda:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001ddc:	fec42783          	lw	a5,-20(s0)
    80001de0:	37fd                	addiw	a5,a5,-1
    80001de2:	fef42623          	sw	a5,-20(s0)
    80001de6:	fec42783          	lw	a5,-20(s0)
    80001dea:	2781                	sext.w	a5,a5
    80001dec:	f6f045e3          	bgtz	a5,80001d56 <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    80001df0:	fd043783          	ld	a5,-48(s0)
    80001df4:	83b1                	srli	a5,a5,0xc
    80001df6:	1ff7f793          	andi	a5,a5,511
    80001dfa:	078e                	slli	a5,a5,0x3
    80001dfc:	fd843703          	ld	a4,-40(s0)
    80001e00:	97ba                	add	a5,a5,a4
}
    80001e02:	853e                	mv	a0,a5
    80001e04:	70e2                	ld	ra,56(sp)
    80001e06:	7442                	ld	s0,48(sp)
    80001e08:	6121                	addi	sp,sp,64
    80001e0a:	8082                	ret

0000000080001e0c <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001e0c:	7179                	addi	sp,sp,-48
    80001e0e:	f406                	sd	ra,40(sp)
    80001e10:	f022                	sd	s0,32(sp)
    80001e12:	1800                	addi	s0,sp,48
    80001e14:	fca43c23          	sd	a0,-40(s0)
    80001e18:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001e1c:	fd043703          	ld	a4,-48(s0)
    80001e20:	57fd                	li	a5,-1
    80001e22:	83e9                	srli	a5,a5,0x1a
    80001e24:	00e7f463          	bgeu	a5,a4,80001e2c <walkaddr+0x20>
    return 0;
    80001e28:	4781                	li	a5,0
    80001e2a:	a881                	j	80001e7a <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001e2c:	4601                	li	a2,0
    80001e2e:	fd043583          	ld	a1,-48(s0)
    80001e32:	fd843503          	ld	a0,-40(s0)
    80001e36:	00000097          	auipc	ra,0x0
    80001e3a:	ef2080e7          	jalr	-270(ra) # 80001d28 <walk>
    80001e3e:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001e42:	fe843783          	ld	a5,-24(s0)
    80001e46:	e399                	bnez	a5,80001e4c <walkaddr+0x40>
    return 0;
    80001e48:	4781                	li	a5,0
    80001e4a:	a805                	j	80001e7a <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001e4c:	fe843783          	ld	a5,-24(s0)
    80001e50:	639c                	ld	a5,0(a5)
    80001e52:	8b85                	andi	a5,a5,1
    80001e54:	e399                	bnez	a5,80001e5a <walkaddr+0x4e>
    return 0;
    80001e56:	4781                	li	a5,0
    80001e58:	a00d                	j	80001e7a <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001e5a:	fe843783          	ld	a5,-24(s0)
    80001e5e:	639c                	ld	a5,0(a5)
    80001e60:	8bc1                	andi	a5,a5,16
    80001e62:	e399                	bnez	a5,80001e68 <walkaddr+0x5c>
    return 0;
    80001e64:	4781                	li	a5,0
    80001e66:	a811                	j	80001e7a <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001e68:	fe843783          	ld	a5,-24(s0)
    80001e6c:	639c                	ld	a5,0(a5)
    80001e6e:	83a9                	srli	a5,a5,0xa
    80001e70:	07b2                	slli	a5,a5,0xc
    80001e72:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001e76:	fe043783          	ld	a5,-32(s0)
}
    80001e7a:	853e                	mv	a0,a5
    80001e7c:	70a2                	ld	ra,40(sp)
    80001e7e:	7402                	ld	s0,32(sp)
    80001e80:	6145                	addi	sp,sp,48
    80001e82:	8082                	ret

0000000080001e84 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001e84:	7139                	addi	sp,sp,-64
    80001e86:	fc06                	sd	ra,56(sp)
    80001e88:	f822                	sd	s0,48(sp)
    80001e8a:	0080                	addi	s0,sp,64
    80001e8c:	fea43423          	sd	a0,-24(s0)
    80001e90:	feb43023          	sd	a1,-32(s0)
    80001e94:	fcc43c23          	sd	a2,-40(s0)
    80001e98:	fcd43823          	sd	a3,-48(s0)
    80001e9c:	87ba                	mv	a5,a4
    80001e9e:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001ea2:	fcc42783          	lw	a5,-52(s0)
    80001ea6:	873e                	mv	a4,a5
    80001ea8:	fd843683          	ld	a3,-40(s0)
    80001eac:	fd043603          	ld	a2,-48(s0)
    80001eb0:	fe043583          	ld	a1,-32(s0)
    80001eb4:	fe843503          	ld	a0,-24(s0)
    80001eb8:	00000097          	auipc	ra,0x0
    80001ebc:	026080e7          	jalr	38(ra) # 80001ede <mappages>
    80001ec0:	87aa                	mv	a5,a0
    80001ec2:	cb89                	beqz	a5,80001ed4 <kvmmap+0x50>
    panic("kvmmap");
    80001ec4:	00009517          	auipc	a0,0x9
    80001ec8:	21450513          	addi	a0,a0,532 # 8000b0d8 <etext+0xd8>
    80001ecc:	fffff097          	auipc	ra,0xfffff
    80001ed0:	dc0080e7          	jalr	-576(ra) # 80000c8c <panic>
}
    80001ed4:	0001                	nop
    80001ed6:	70e2                	ld	ra,56(sp)
    80001ed8:	7442                	ld	s0,48(sp)
    80001eda:	6121                	addi	sp,sp,64
    80001edc:	8082                	ret

0000000080001ede <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001ede:	711d                	addi	sp,sp,-96
    80001ee0:	ec86                	sd	ra,88(sp)
    80001ee2:	e8a2                	sd	s0,80(sp)
    80001ee4:	1080                	addi	s0,sp,96
    80001ee6:	fca43423          	sd	a0,-56(s0)
    80001eea:	fcb43023          	sd	a1,-64(s0)
    80001eee:	fac43c23          	sd	a2,-72(s0)
    80001ef2:	fad43823          	sd	a3,-80(s0)
    80001ef6:	87ba                	mv	a5,a4
    80001ef8:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001efc:	fb843783          	ld	a5,-72(s0)
    80001f00:	eb89                	bnez	a5,80001f12 <mappages+0x34>
    panic("mappages: size");
    80001f02:	00009517          	auipc	a0,0x9
    80001f06:	1de50513          	addi	a0,a0,478 # 8000b0e0 <etext+0xe0>
    80001f0a:	fffff097          	auipc	ra,0xfffff
    80001f0e:	d82080e7          	jalr	-638(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    80001f12:	fc043703          	ld	a4,-64(s0)
    80001f16:	77fd                	lui	a5,0xfffff
    80001f18:	8ff9                	and	a5,a5,a4
    80001f1a:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001f1e:	fc043703          	ld	a4,-64(s0)
    80001f22:	fb843783          	ld	a5,-72(s0)
    80001f26:	97ba                	add	a5,a5,a4
    80001f28:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffca0cf>
    80001f2c:	77fd                	lui	a5,0xfffff
    80001f2e:	8ff9                	and	a5,a5,a4
    80001f30:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001f34:	4605                	li	a2,1
    80001f36:	fe843583          	ld	a1,-24(s0)
    80001f3a:	fc843503          	ld	a0,-56(s0)
    80001f3e:	00000097          	auipc	ra,0x0
    80001f42:	dea080e7          	jalr	-534(ra) # 80001d28 <walk>
    80001f46:	fca43c23          	sd	a0,-40(s0)
    80001f4a:	fd843783          	ld	a5,-40(s0)
    80001f4e:	e399                	bnez	a5,80001f54 <mappages+0x76>
      return -1;
    80001f50:	57fd                	li	a5,-1
    80001f52:	a0b5                	j	80001fbe <mappages+0xe0>
    if(*pte & PTE_V)
    80001f54:	fd843783          	ld	a5,-40(s0)
    80001f58:	639c                	ld	a5,0(a5)
    80001f5a:	8b85                	andi	a5,a5,1
    80001f5c:	cb89                	beqz	a5,80001f6e <mappages+0x90>
      panic("mappages: remap");
    80001f5e:	00009517          	auipc	a0,0x9
    80001f62:	19250513          	addi	a0,a0,402 # 8000b0f0 <etext+0xf0>
    80001f66:	fffff097          	auipc	ra,0xfffff
    80001f6a:	d26080e7          	jalr	-730(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001f6e:	fb043783          	ld	a5,-80(s0)
    80001f72:	83b1                	srli	a5,a5,0xc
    80001f74:	00a79713          	slli	a4,a5,0xa
    80001f78:	fac42783          	lw	a5,-84(s0)
    80001f7c:	8fd9                	or	a5,a5,a4
    80001f7e:	0017e713          	ori	a4,a5,1
    80001f82:	fd843783          	ld	a5,-40(s0)
    80001f86:	e398                	sd	a4,0(a5)
    reglrupage(pte);
    80001f88:	fd843503          	ld	a0,-40(s0)
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	aac080e7          	jalr	-1364(ra) # 80001a38 <reglrupage>
    if(a == last)
    80001f94:	fe843703          	ld	a4,-24(s0)
    80001f98:	fe043783          	ld	a5,-32(s0)
    80001f9c:	00f70f63          	beq	a4,a5,80001fba <mappages+0xdc>
      break;
    a += PGSIZE;
    80001fa0:	fe843703          	ld	a4,-24(s0)
    80001fa4:	6785                	lui	a5,0x1
    80001fa6:	97ba                	add	a5,a5,a4
    80001fa8:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001fac:	fb043703          	ld	a4,-80(s0)
    80001fb0:	6785                	lui	a5,0x1
    80001fb2:	97ba                	add	a5,a5,a4
    80001fb4:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001fb8:	bfb5                	j	80001f34 <mappages+0x56>
      break;
    80001fba:	0001                	nop
  }
  return 0;
    80001fbc:	4781                	li	a5,0
}
    80001fbe:	853e                	mv	a0,a5
    80001fc0:	60e6                	ld	ra,88(sp)
    80001fc2:	6446                	ld	s0,80(sp)
    80001fc4:	6125                	addi	sp,sp,96
    80001fc6:	8082                	ret

0000000080001fc8 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001fc8:	715d                	addi	sp,sp,-80
    80001fca:	e486                	sd	ra,72(sp)
    80001fcc:	e0a2                	sd	s0,64(sp)
    80001fce:	0880                	addi	s0,sp,80
    80001fd0:	fca43423          	sd	a0,-56(s0)
    80001fd4:	fcb43023          	sd	a1,-64(s0)
    80001fd8:	fac43c23          	sd	a2,-72(s0)
    80001fdc:	87b6                	mv	a5,a3
    80001fde:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001fe2:	fc043703          	ld	a4,-64(s0)
    80001fe6:	6785                	lui	a5,0x1
    80001fe8:	17fd                	addi	a5,a5,-1
    80001fea:	8ff9                	and	a5,a5,a4
    80001fec:	cb89                	beqz	a5,80001ffe <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001fee:	00009517          	auipc	a0,0x9
    80001ff2:	11250513          	addi	a0,a0,274 # 8000b100 <etext+0x100>
    80001ff6:	fffff097          	auipc	ra,0xfffff
    80001ffa:	c96080e7          	jalr	-874(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001ffe:	fc043783          	ld	a5,-64(s0)
    80002002:	fef43423          	sd	a5,-24(s0)
    80002006:	a075                	j	800020b2 <uvmunmap+0xea>
    if((pte = walk(pagetable, a, 0)) == 0)
    80002008:	4601                	li	a2,0
    8000200a:	fe843583          	ld	a1,-24(s0)
    8000200e:	fc843503          	ld	a0,-56(s0)
    80002012:	00000097          	auipc	ra,0x0
    80002016:	d16080e7          	jalr	-746(ra) # 80001d28 <walk>
    8000201a:	fea43023          	sd	a0,-32(s0)
    8000201e:	fe043783          	ld	a5,-32(s0)
    80002022:	eb89                	bnez	a5,80002034 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80002024:	00009517          	auipc	a0,0x9
    80002028:	0f450513          	addi	a0,a0,244 # 8000b118 <etext+0x118>
    8000202c:	fffff097          	auipc	ra,0xfffff
    80002030:	c60080e7          	jalr	-928(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80002034:	fe043783          	ld	a5,-32(s0)
    80002038:	639c                	ld	a5,0(a5)
    8000203a:	8b85                	andi	a5,a5,1
    8000203c:	eb89                	bnez	a5,8000204e <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    8000203e:	00009517          	auipc	a0,0x9
    80002042:	0ea50513          	addi	a0,a0,234 # 8000b128 <etext+0x128>
    80002046:	fffff097          	auipc	ra,0xfffff
    8000204a:	c46080e7          	jalr	-954(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    8000204e:	fe043783          	ld	a5,-32(s0)
    80002052:	639c                	ld	a5,0(a5)
    80002054:	3ff7f713          	andi	a4,a5,1023
    80002058:	4785                	li	a5,1
    8000205a:	00f71a63          	bne	a4,a5,8000206e <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    8000205e:	00009517          	auipc	a0,0x9
    80002062:	0e250513          	addi	a0,a0,226 # 8000b140 <etext+0x140>
    80002066:	fffff097          	auipc	ra,0xfffff
    8000206a:	c26080e7          	jalr	-986(ra) # 80000c8c <panic>
    if(do_free){
    8000206e:	fb442783          	lw	a5,-76(s0)
    80002072:	2781                	sext.w	a5,a5
    80002074:	c78d                	beqz	a5,8000209e <uvmunmap+0xd6>
      unreglrupage(pte);
    80002076:	fe043503          	ld	a0,-32(s0)
    8000207a:	00000097          	auipc	ra,0x0
    8000207e:	a0e080e7          	jalr	-1522(ra) # 80001a88 <unreglrupage>
      uint64 pa = PTE2PA(*pte);
    80002082:	fe043783          	ld	a5,-32(s0)
    80002086:	639c                	ld	a5,0(a5)
    80002088:	83a9                	srli	a5,a5,0xa
    8000208a:	07b2                	slli	a5,a5,0xc
    8000208c:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80002090:	fd843783          	ld	a5,-40(s0)
    80002094:	853e                	mv	a0,a5
    80002096:	fffff097          	auipc	ra,0xfffff
    8000209a:	09a080e7          	jalr	154(ra) # 80001130 <kfree>
    }
    *pte = 0;
    8000209e:	fe043783          	ld	a5,-32(s0)
    800020a2:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    800020a6:	fe843703          	ld	a4,-24(s0)
    800020aa:	6785                	lui	a5,0x1
    800020ac:	97ba                	add	a5,a5,a4
    800020ae:	fef43423          	sd	a5,-24(s0)
    800020b2:	fb843783          	ld	a5,-72(s0)
    800020b6:	00c79713          	slli	a4,a5,0xc
    800020ba:	fc043783          	ld	a5,-64(s0)
    800020be:	97ba                	add	a5,a5,a4
    800020c0:	fe843703          	ld	a4,-24(s0)
    800020c4:	f4f762e3          	bltu	a4,a5,80002008 <uvmunmap+0x40>
  }
}
    800020c8:	0001                	nop
    800020ca:	0001                	nop
    800020cc:	60a6                	ld	ra,72(sp)
    800020ce:	6406                	ld	s0,64(sp)
    800020d0:	6161                	addi	sp,sp,80
    800020d2:	8082                	ret

00000000800020d4 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    800020d4:	1101                	addi	sp,sp,-32
    800020d6:	ec06                	sd	ra,24(sp)
    800020d8:	e822                	sd	s0,16(sp)
    800020da:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    800020dc:	fffff097          	auipc	ra,0xfffff
    800020e0:	0fa080e7          	jalr	250(ra) # 800011d6 <kalloc>
    800020e4:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    800020e8:	fe843783          	ld	a5,-24(s0)
    800020ec:	e399                	bnez	a5,800020f2 <uvmcreate+0x1e>
    return 0;
    800020ee:	4781                	li	a5,0
    800020f0:	a819                	j	80002106 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    800020f2:	6605                	lui	a2,0x1
    800020f4:	4581                	li	a1,0
    800020f6:	fe843503          	ld	a0,-24(s0)
    800020fa:	fffff097          	auipc	ra,0xfffff
    800020fe:	404080e7          	jalr	1028(ra) # 800014fe <memset>
  return pagetable;
    80002102:	fe843783          	ld	a5,-24(s0)
}
    80002106:	853e                	mv	a0,a5
    80002108:	60e2                	ld	ra,24(sp)
    8000210a:	6442                	ld	s0,16(sp)
    8000210c:	6105                	addi	sp,sp,32
    8000210e:	8082                	ret

0000000080002110 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    80002110:	7139                	addi	sp,sp,-64
    80002112:	fc06                	sd	ra,56(sp)
    80002114:	f822                	sd	s0,48(sp)
    80002116:	0080                	addi	s0,sp,64
    80002118:	fca43c23          	sd	a0,-40(s0)
    8000211c:	fcb43823          	sd	a1,-48(s0)
    80002120:	87b2                	mv	a5,a2
    80002122:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80002126:	fcc42783          	lw	a5,-52(s0)
    8000212a:	0007871b          	sext.w	a4,a5
    8000212e:	6785                	lui	a5,0x1
    80002130:	00f76a63          	bltu	a4,a5,80002144 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    80002134:	00009517          	auipc	a0,0x9
    80002138:	02450513          	addi	a0,a0,36 # 8000b158 <etext+0x158>
    8000213c:	fffff097          	auipc	ra,0xfffff
    80002140:	b50080e7          	jalr	-1200(ra) # 80000c8c <panic>
  mem = kalloc();
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	092080e7          	jalr	146(ra) # 800011d6 <kalloc>
    8000214c:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80002150:	6605                	lui	a2,0x1
    80002152:	4581                	li	a1,0
    80002154:	fe843503          	ld	a0,-24(s0)
    80002158:	fffff097          	auipc	ra,0xfffff
    8000215c:	3a6080e7          	jalr	934(ra) # 800014fe <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80002160:	fe843783          	ld	a5,-24(s0)
    80002164:	4779                	li	a4,30
    80002166:	86be                	mv	a3,a5
    80002168:	6605                	lui	a2,0x1
    8000216a:	4581                	li	a1,0
    8000216c:	fd843503          	ld	a0,-40(s0)
    80002170:	00000097          	auipc	ra,0x0
    80002174:	d6e080e7          	jalr	-658(ra) # 80001ede <mappages>
  memmove(mem, src, sz);
    80002178:	fcc42783          	lw	a5,-52(s0)
    8000217c:	863e                	mv	a2,a5
    8000217e:	fd043583          	ld	a1,-48(s0)
    80002182:	fe843503          	ld	a0,-24(s0)
    80002186:	fffff097          	auipc	ra,0xfffff
    8000218a:	45c080e7          	jalr	1116(ra) # 800015e2 <memmove>
}
    8000218e:	0001                	nop
    80002190:	70e2                	ld	ra,56(sp)
    80002192:	7442                	ld	s0,48(sp)
    80002194:	6121                	addi	sp,sp,64
    80002196:	8082                	ret

0000000080002198 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    80002198:	7139                	addi	sp,sp,-64
    8000219a:	fc06                	sd	ra,56(sp)
    8000219c:	f822                	sd	s0,48(sp)
    8000219e:	0080                	addi	s0,sp,64
    800021a0:	fca43c23          	sd	a0,-40(s0)
    800021a4:	fcb43823          	sd	a1,-48(s0)
    800021a8:	fcc43423          	sd	a2,-56(s0)
    800021ac:	87b6                	mv	a5,a3
    800021ae:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    800021b2:	fc843703          	ld	a4,-56(s0)
    800021b6:	fd043783          	ld	a5,-48(s0)
    800021ba:	00f77563          	bgeu	a4,a5,800021c4 <uvmalloc+0x2c>
    return oldsz;
    800021be:	fd043783          	ld	a5,-48(s0)
    800021c2:	a87d                	j	80002280 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    800021c4:	fd043703          	ld	a4,-48(s0)
    800021c8:	6785                	lui	a5,0x1
    800021ca:	17fd                	addi	a5,a5,-1
    800021cc:	973e                	add	a4,a4,a5
    800021ce:	77fd                	lui	a5,0xfffff
    800021d0:	8ff9                	and	a5,a5,a4
    800021d2:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    800021d6:	fd043783          	ld	a5,-48(s0)
    800021da:	fef43423          	sd	a5,-24(s0)
    800021de:	a849                	j	80002270 <uvmalloc+0xd8>
    mem = kalloc();
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	ff6080e7          	jalr	-10(ra) # 800011d6 <kalloc>
    800021e8:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    800021ec:	fe043783          	ld	a5,-32(s0)
    800021f0:	ef89                	bnez	a5,8000220a <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    800021f2:	fd043603          	ld	a2,-48(s0)
    800021f6:	fe843583          	ld	a1,-24(s0)
    800021fa:	fd843503          	ld	a0,-40(s0)
    800021fe:	00000097          	auipc	ra,0x0
    80002202:	08c080e7          	jalr	140(ra) # 8000228a <uvmdealloc>
      return 0;
    80002206:	4781                	li	a5,0
    80002208:	a8a5                	j	80002280 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    8000220a:	6605                	lui	a2,0x1
    8000220c:	4581                	li	a1,0
    8000220e:	fe043503          	ld	a0,-32(s0)
    80002212:	fffff097          	auipc	ra,0xfffff
    80002216:	2ec080e7          	jalr	748(ra) # 800014fe <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    8000221a:	fe043683          	ld	a3,-32(s0)
    8000221e:	fc442783          	lw	a5,-60(s0)
    80002222:	0127e793          	ori	a5,a5,18
    80002226:	2781                	sext.w	a5,a5
    80002228:	873e                	mv	a4,a5
    8000222a:	6605                	lui	a2,0x1
    8000222c:	fe843583          	ld	a1,-24(s0)
    80002230:	fd843503          	ld	a0,-40(s0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	caa080e7          	jalr	-854(ra) # 80001ede <mappages>
    8000223c:	87aa                	mv	a5,a0
    8000223e:	c39d                	beqz	a5,80002264 <uvmalloc+0xcc>
      kfree(mem);
    80002240:	fe043503          	ld	a0,-32(s0)
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	eec080e7          	jalr	-276(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    8000224c:	fd043603          	ld	a2,-48(s0)
    80002250:	fe843583          	ld	a1,-24(s0)
    80002254:	fd843503          	ld	a0,-40(s0)
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	032080e7          	jalr	50(ra) # 8000228a <uvmdealloc>
      return 0;
    80002260:	4781                	li	a5,0
    80002262:	a839                	j	80002280 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002264:	fe843703          	ld	a4,-24(s0)
    80002268:	6785                	lui	a5,0x1
    8000226a:	97ba                	add	a5,a5,a4
    8000226c:	fef43423          	sd	a5,-24(s0)
    80002270:	fe843703          	ld	a4,-24(s0)
    80002274:	fc843783          	ld	a5,-56(s0)
    80002278:	f6f764e3          	bltu	a4,a5,800021e0 <uvmalloc+0x48>
    }
  }
  return newsz;
    8000227c:	fc843783          	ld	a5,-56(s0)
}
    80002280:	853e                	mv	a0,a5
    80002282:	70e2                	ld	ra,56(sp)
    80002284:	7442                	ld	s0,48(sp)
    80002286:	6121                	addi	sp,sp,64
    80002288:	8082                	ret

000000008000228a <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    8000228a:	7139                	addi	sp,sp,-64
    8000228c:	fc06                	sd	ra,56(sp)
    8000228e:	f822                	sd	s0,48(sp)
    80002290:	0080                	addi	s0,sp,64
    80002292:	fca43c23          	sd	a0,-40(s0)
    80002296:	fcb43823          	sd	a1,-48(s0)
    8000229a:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    8000229e:	fc843703          	ld	a4,-56(s0)
    800022a2:	fd043783          	ld	a5,-48(s0)
    800022a6:	00f76563          	bltu	a4,a5,800022b0 <uvmdealloc+0x26>
    return oldsz;
    800022aa:	fd043783          	ld	a5,-48(s0)
    800022ae:	a885                	j	8000231e <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800022b0:	fc843703          	ld	a4,-56(s0)
    800022b4:	6785                	lui	a5,0x1
    800022b6:	17fd                	addi	a5,a5,-1
    800022b8:	973e                	add	a4,a4,a5
    800022ba:	77fd                	lui	a5,0xfffff
    800022bc:	8f7d                	and	a4,a4,a5
    800022be:	fd043683          	ld	a3,-48(s0)
    800022c2:	6785                	lui	a5,0x1
    800022c4:	17fd                	addi	a5,a5,-1
    800022c6:	96be                	add	a3,a3,a5
    800022c8:	77fd                	lui	a5,0xfffff
    800022ca:	8ff5                	and	a5,a5,a3
    800022cc:	04f77763          	bgeu	a4,a5,8000231a <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    800022d0:	fd043703          	ld	a4,-48(s0)
    800022d4:	6785                	lui	a5,0x1
    800022d6:	17fd                	addi	a5,a5,-1
    800022d8:	973e                	add	a4,a4,a5
    800022da:	77fd                	lui	a5,0xfffff
    800022dc:	8f7d                	and	a4,a4,a5
    800022de:	fc843683          	ld	a3,-56(s0)
    800022e2:	6785                	lui	a5,0x1
    800022e4:	17fd                	addi	a5,a5,-1
    800022e6:	96be                	add	a3,a3,a5
    800022e8:	77fd                	lui	a5,0xfffff
    800022ea:	8ff5                	and	a5,a5,a3
    800022ec:	40f707b3          	sub	a5,a4,a5
    800022f0:	83b1                	srli	a5,a5,0xc
    800022f2:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    800022f6:	fc843703          	ld	a4,-56(s0)
    800022fa:	6785                	lui	a5,0x1
    800022fc:	17fd                	addi	a5,a5,-1
    800022fe:	973e                	add	a4,a4,a5
    80002300:	77fd                	lui	a5,0xfffff
    80002302:	8ff9                	and	a5,a5,a4
    80002304:	fec42703          	lw	a4,-20(s0)
    80002308:	4685                	li	a3,1
    8000230a:	863a                	mv	a2,a4
    8000230c:	85be                	mv	a1,a5
    8000230e:	fd843503          	ld	a0,-40(s0)
    80002312:	00000097          	auipc	ra,0x0
    80002316:	cb6080e7          	jalr	-842(ra) # 80001fc8 <uvmunmap>
  }

  return newsz;
    8000231a:	fc843783          	ld	a5,-56(s0)
}
    8000231e:	853e                	mv	a0,a5
    80002320:	70e2                	ld	ra,56(sp)
    80002322:	7442                	ld	s0,48(sp)
    80002324:	6121                	addi	sp,sp,64
    80002326:	8082                	ret

0000000080002328 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80002328:	7139                	addi	sp,sp,-64
    8000232a:	fc06                	sd	ra,56(sp)
    8000232c:	f822                	sd	s0,48(sp)
    8000232e:	0080                	addi	s0,sp,64
    80002330:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002334:	fe042623          	sw	zero,-20(s0)
    80002338:	a88d                	j	800023aa <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000233a:	fec42783          	lw	a5,-20(s0)
    8000233e:	078e                	slli	a5,a5,0x3
    80002340:	fc843703          	ld	a4,-56(s0)
    80002344:	97ba                	add	a5,a5,a4
    80002346:	639c                	ld	a5,0(a5)
    80002348:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000234c:	fe043783          	ld	a5,-32(s0)
    80002350:	8b85                	andi	a5,a5,1
    80002352:	cb9d                	beqz	a5,80002388 <freewalk+0x60>
    80002354:	fe043783          	ld	a5,-32(s0)
    80002358:	8bb9                	andi	a5,a5,14
    8000235a:	e79d                	bnez	a5,80002388 <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    8000235c:	fe043783          	ld	a5,-32(s0)
    80002360:	83a9                	srli	a5,a5,0xa
    80002362:	07b2                	slli	a5,a5,0xc
    80002364:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    80002368:	fd843783          	ld	a5,-40(s0)
    8000236c:	853e                	mv	a0,a5
    8000236e:	00000097          	auipc	ra,0x0
    80002372:	fba080e7          	jalr	-70(ra) # 80002328 <freewalk>
      pagetable[i] = 0;
    80002376:	fec42783          	lw	a5,-20(s0)
    8000237a:	078e                	slli	a5,a5,0x3
    8000237c:	fc843703          	ld	a4,-56(s0)
    80002380:	97ba                	add	a5,a5,a4
    80002382:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffca0d0>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002386:	a829                	j	800023a0 <freewalk+0x78>
    } else if(pte & PTE_V){
    80002388:	fe043783          	ld	a5,-32(s0)
    8000238c:	8b85                	andi	a5,a5,1
    8000238e:	cb89                	beqz	a5,800023a0 <freewalk+0x78>
      panic("freewalk: leaf");
    80002390:	00009517          	auipc	a0,0x9
    80002394:	de850513          	addi	a0,a0,-536 # 8000b178 <etext+0x178>
    80002398:	fffff097          	auipc	ra,0xfffff
    8000239c:	8f4080e7          	jalr	-1804(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    800023a0:	fec42783          	lw	a5,-20(s0)
    800023a4:	2785                	addiw	a5,a5,1
    800023a6:	fef42623          	sw	a5,-20(s0)
    800023aa:	fec42783          	lw	a5,-20(s0)
    800023ae:	0007871b          	sext.w	a4,a5
    800023b2:	1ff00793          	li	a5,511
    800023b6:	f8e7d2e3          	bge	a5,a4,8000233a <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    800023ba:	fc843503          	ld	a0,-56(s0)
    800023be:	fffff097          	auipc	ra,0xfffff
    800023c2:	d72080e7          	jalr	-654(ra) # 80001130 <kfree>
}
    800023c6:	0001                	nop
    800023c8:	70e2                	ld	ra,56(sp)
    800023ca:	7442                	ld	s0,48(sp)
    800023cc:	6121                	addi	sp,sp,64
    800023ce:	8082                	ret

00000000800023d0 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    800023d0:	1101                	addi	sp,sp,-32
    800023d2:	ec06                	sd	ra,24(sp)
    800023d4:	e822                	sd	s0,16(sp)
    800023d6:	1000                	addi	s0,sp,32
    800023d8:	fea43423          	sd	a0,-24(s0)
    800023dc:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    800023e0:	fe043783          	ld	a5,-32(s0)
    800023e4:	c385                	beqz	a5,80002404 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    800023e6:	fe043703          	ld	a4,-32(s0)
    800023ea:	6785                	lui	a5,0x1
    800023ec:	17fd                	addi	a5,a5,-1
    800023ee:	97ba                	add	a5,a5,a4
    800023f0:	83b1                	srli	a5,a5,0xc
    800023f2:	4685                	li	a3,1
    800023f4:	863e                	mv	a2,a5
    800023f6:	4581                	li	a1,0
    800023f8:	fe843503          	ld	a0,-24(s0)
    800023fc:	00000097          	auipc	ra,0x0
    80002400:	bcc080e7          	jalr	-1076(ra) # 80001fc8 <uvmunmap>
  freewalk(pagetable);
    80002404:	fe843503          	ld	a0,-24(s0)
    80002408:	00000097          	auipc	ra,0x0
    8000240c:	f20080e7          	jalr	-224(ra) # 80002328 <freewalk>
}
    80002410:	0001                	nop
    80002412:	60e2                	ld	ra,24(sp)
    80002414:	6442                	ld	s0,16(sp)
    80002416:	6105                	addi	sp,sp,32
    80002418:	8082                	ret

000000008000241a <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    8000241a:	711d                	addi	sp,sp,-96
    8000241c:	ec86                	sd	ra,88(sp)
    8000241e:	e8a2                	sd	s0,80(sp)
    80002420:	1080                	addi	s0,sp,96
    80002422:	faa43c23          	sd	a0,-72(s0)
    80002426:	fab43823          	sd	a1,-80(s0)
    8000242a:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    8000242e:	fe043423          	sd	zero,-24(s0)
    80002432:	a0d9                	j	800024f8 <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002434:	4601                	li	a2,0
    80002436:	fe843583          	ld	a1,-24(s0)
    8000243a:	fb843503          	ld	a0,-72(s0)
    8000243e:	00000097          	auipc	ra,0x0
    80002442:	8ea080e7          	jalr	-1814(ra) # 80001d28 <walk>
    80002446:	fea43023          	sd	a0,-32(s0)
    8000244a:	fe043783          	ld	a5,-32(s0)
    8000244e:	eb89                	bnez	a5,80002460 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002450:	00009517          	auipc	a0,0x9
    80002454:	d3850513          	addi	a0,a0,-712 # 8000b188 <etext+0x188>
    80002458:	fffff097          	auipc	ra,0xfffff
    8000245c:	834080e7          	jalr	-1996(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80002460:	fe043783          	ld	a5,-32(s0)
    80002464:	639c                	ld	a5,0(a5)
    80002466:	8b85                	andi	a5,a5,1
    80002468:	eb89                	bnez	a5,8000247a <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    8000246a:	00009517          	auipc	a0,0x9
    8000246e:	d3e50513          	addi	a0,a0,-706 # 8000b1a8 <etext+0x1a8>
    80002472:	fffff097          	auipc	ra,0xfffff
    80002476:	81a080e7          	jalr	-2022(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    8000247a:	fe043783          	ld	a5,-32(s0)
    8000247e:	639c                	ld	a5,0(a5)
    80002480:	83a9                	srli	a5,a5,0xa
    80002482:	07b2                	slli	a5,a5,0xc
    80002484:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    80002488:	fe043783          	ld	a5,-32(s0)
    8000248c:	639c                	ld	a5,0(a5)
    8000248e:	2781                	sext.w	a5,a5
    80002490:	3ff7f793          	andi	a5,a5,1023
    80002494:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    80002498:	fffff097          	auipc	ra,0xfffff
    8000249c:	d3e080e7          	jalr	-706(ra) # 800011d6 <kalloc>
    800024a0:	fca43423          	sd	a0,-56(s0)
    800024a4:	fc843783          	ld	a5,-56(s0)
    800024a8:	c3a5                	beqz	a5,80002508 <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800024aa:	fd843783          	ld	a5,-40(s0)
    800024ae:	6605                	lui	a2,0x1
    800024b0:	85be                	mv	a1,a5
    800024b2:	fc843503          	ld	a0,-56(s0)
    800024b6:	fffff097          	auipc	ra,0xfffff
    800024ba:	12c080e7          	jalr	300(ra) # 800015e2 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    800024be:	fc843783          	ld	a5,-56(s0)
    800024c2:	fd442703          	lw	a4,-44(s0)
    800024c6:	86be                	mv	a3,a5
    800024c8:	6605                	lui	a2,0x1
    800024ca:	fe843583          	ld	a1,-24(s0)
    800024ce:	fb043503          	ld	a0,-80(s0)
    800024d2:	00000097          	auipc	ra,0x0
    800024d6:	a0c080e7          	jalr	-1524(ra) # 80001ede <mappages>
    800024da:	87aa                	mv	a5,a0
    800024dc:	cb81                	beqz	a5,800024ec <uvmcopy+0xd2>
      kfree(mem);
    800024de:	fc843503          	ld	a0,-56(s0)
    800024e2:	fffff097          	auipc	ra,0xfffff
    800024e6:	c4e080e7          	jalr	-946(ra) # 80001130 <kfree>
      goto err;
    800024ea:	a005                	j	8000250a <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    800024ec:	fe843703          	ld	a4,-24(s0)
    800024f0:	6785                	lui	a5,0x1
    800024f2:	97ba                	add	a5,a5,a4
    800024f4:	fef43423          	sd	a5,-24(s0)
    800024f8:	fe843703          	ld	a4,-24(s0)
    800024fc:	fa843783          	ld	a5,-88(s0)
    80002500:	f2f76ae3          	bltu	a4,a5,80002434 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002504:	4781                	li	a5,0
    80002506:	a839                	j	80002524 <uvmcopy+0x10a>
      goto err;
    80002508:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000250a:	fe843783          	ld	a5,-24(s0)
    8000250e:	83b1                	srli	a5,a5,0xc
    80002510:	4685                	li	a3,1
    80002512:	863e                	mv	a2,a5
    80002514:	4581                	li	a1,0
    80002516:	fb043503          	ld	a0,-80(s0)
    8000251a:	00000097          	auipc	ra,0x0
    8000251e:	aae080e7          	jalr	-1362(ra) # 80001fc8 <uvmunmap>
  return -1;
    80002522:	57fd                	li	a5,-1
}
    80002524:	853e                	mv	a0,a5
    80002526:	60e6                	ld	ra,88(sp)
    80002528:	6446                	ld	s0,80(sp)
    8000252a:	6125                	addi	sp,sp,96
    8000252c:	8082                	ret

000000008000252e <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    8000252e:	7179                	addi	sp,sp,-48
    80002530:	f406                	sd	ra,40(sp)
    80002532:	f022                	sd	s0,32(sp)
    80002534:	1800                	addi	s0,sp,48
    80002536:	fca43c23          	sd	a0,-40(s0)
    8000253a:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    8000253e:	4601                	li	a2,0
    80002540:	fd043583          	ld	a1,-48(s0)
    80002544:	fd843503          	ld	a0,-40(s0)
    80002548:	fffff097          	auipc	ra,0xfffff
    8000254c:	7e0080e7          	jalr	2016(ra) # 80001d28 <walk>
    80002550:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80002554:	fe843783          	ld	a5,-24(s0)
    80002558:	eb89                	bnez	a5,8000256a <uvmclear+0x3c>
    panic("uvmclear");
    8000255a:	00009517          	auipc	a0,0x9
    8000255e:	c6e50513          	addi	a0,a0,-914 # 8000b1c8 <etext+0x1c8>
    80002562:	ffffe097          	auipc	ra,0xffffe
    80002566:	72a080e7          	jalr	1834(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    8000256a:	fe843783          	ld	a5,-24(s0)
    8000256e:	639c                	ld	a5,0(a5)
    80002570:	fef7f713          	andi	a4,a5,-17
    80002574:	fe843783          	ld	a5,-24(s0)
    80002578:	e398                	sd	a4,0(a5)
  unreglrupage(pte);
    8000257a:	fe843503          	ld	a0,-24(s0)
    8000257e:	fffff097          	auipc	ra,0xfffff
    80002582:	50a080e7          	jalr	1290(ra) # 80001a88 <unreglrupage>
}
    80002586:	0001                	nop
    80002588:	70a2                	ld	ra,40(sp)
    8000258a:	7402                	ld	s0,32(sp)
    8000258c:	6145                	addi	sp,sp,48
    8000258e:	8082                	ret

0000000080002590 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    80002590:	715d                	addi	sp,sp,-80
    80002592:	e486                	sd	ra,72(sp)
    80002594:	e0a2                	sd	s0,64(sp)
    80002596:	0880                	addi	s0,sp,80
    80002598:	fca43423          	sd	a0,-56(s0)
    8000259c:	fcb43023          	sd	a1,-64(s0)
    800025a0:	fac43c23          	sd	a2,-72(s0)
    800025a4:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800025a8:	a055                	j	8000264c <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    800025aa:	fc043703          	ld	a4,-64(s0)
    800025ae:	77fd                	lui	a5,0xfffff
    800025b0:	8ff9                	and	a5,a5,a4
    800025b2:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800025b6:	fe043583          	ld	a1,-32(s0)
    800025ba:	fc843503          	ld	a0,-56(s0)
    800025be:	00000097          	auipc	ra,0x0
    800025c2:	84e080e7          	jalr	-1970(ra) # 80001e0c <walkaddr>
    800025c6:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800025ca:	fd843783          	ld	a5,-40(s0)
    800025ce:	e399                	bnez	a5,800025d4 <copyout+0x44>
      return -1;
    800025d0:	57fd                	li	a5,-1
    800025d2:	a049                	j	80002654 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    800025d4:	fe043703          	ld	a4,-32(s0)
    800025d8:	fc043783          	ld	a5,-64(s0)
    800025dc:	8f1d                	sub	a4,a4,a5
    800025de:	6785                	lui	a5,0x1
    800025e0:	97ba                	add	a5,a5,a4
    800025e2:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800025e6:	fe843703          	ld	a4,-24(s0)
    800025ea:	fb043783          	ld	a5,-80(s0)
    800025ee:	00e7f663          	bgeu	a5,a4,800025fa <copyout+0x6a>
      n = len;
    800025f2:	fb043783          	ld	a5,-80(s0)
    800025f6:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    800025fa:	fc043703          	ld	a4,-64(s0)
    800025fe:	fe043783          	ld	a5,-32(s0)
    80002602:	8f1d                	sub	a4,a4,a5
    80002604:	fd843783          	ld	a5,-40(s0)
    80002608:	97ba                	add	a5,a5,a4
    8000260a:	873e                	mv	a4,a5
    8000260c:	fe843783          	ld	a5,-24(s0)
    80002610:	2781                	sext.w	a5,a5
    80002612:	863e                	mv	a2,a5
    80002614:	fb843583          	ld	a1,-72(s0)
    80002618:	853a                	mv	a0,a4
    8000261a:	fffff097          	auipc	ra,0xfffff
    8000261e:	fc8080e7          	jalr	-56(ra) # 800015e2 <memmove>

    len -= n;
    80002622:	fb043703          	ld	a4,-80(s0)
    80002626:	fe843783          	ld	a5,-24(s0)
    8000262a:	40f707b3          	sub	a5,a4,a5
    8000262e:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002632:	fb843703          	ld	a4,-72(s0)
    80002636:	fe843783          	ld	a5,-24(s0)
    8000263a:	97ba                	add	a5,a5,a4
    8000263c:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002640:	fe043703          	ld	a4,-32(s0)
    80002644:	6785                	lui	a5,0x1
    80002646:	97ba                	add	a5,a5,a4
    80002648:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    8000264c:	fb043783          	ld	a5,-80(s0)
    80002650:	ffa9                	bnez	a5,800025aa <copyout+0x1a>
  }
  return 0;
    80002652:	4781                	li	a5,0
}
    80002654:	853e                	mv	a0,a5
    80002656:	60a6                	ld	ra,72(sp)
    80002658:	6406                	ld	s0,64(sp)
    8000265a:	6161                	addi	sp,sp,80
    8000265c:	8082                	ret

000000008000265e <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    8000265e:	715d                	addi	sp,sp,-80
    80002660:	e486                	sd	ra,72(sp)
    80002662:	e0a2                	sd	s0,64(sp)
    80002664:	0880                	addi	s0,sp,80
    80002666:	fca43423          	sd	a0,-56(s0)
    8000266a:	fcb43023          	sd	a1,-64(s0)
    8000266e:	fac43c23          	sd	a2,-72(s0)
    80002672:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002676:	a055                	j	8000271a <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    80002678:	fb843703          	ld	a4,-72(s0)
    8000267c:	77fd                	lui	a5,0xfffff
    8000267e:	8ff9                	and	a5,a5,a4
    80002680:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002684:	fe043583          	ld	a1,-32(s0)
    80002688:	fc843503          	ld	a0,-56(s0)
    8000268c:	fffff097          	auipc	ra,0xfffff
    80002690:	780080e7          	jalr	1920(ra) # 80001e0c <walkaddr>
    80002694:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002698:	fd843783          	ld	a5,-40(s0)
    8000269c:	e399                	bnez	a5,800026a2 <copyin+0x44>
      return -1;
    8000269e:	57fd                	li	a5,-1
    800026a0:	a049                	j	80002722 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800026a2:	fe043703          	ld	a4,-32(s0)
    800026a6:	fb843783          	ld	a5,-72(s0)
    800026aa:	8f1d                	sub	a4,a4,a5
    800026ac:	6785                	lui	a5,0x1
    800026ae:	97ba                	add	a5,a5,a4
    800026b0:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800026b4:	fe843703          	ld	a4,-24(s0)
    800026b8:	fb043783          	ld	a5,-80(s0)
    800026bc:	00e7f663          	bgeu	a5,a4,800026c8 <copyin+0x6a>
      n = len;
    800026c0:	fb043783          	ld	a5,-80(s0)
    800026c4:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    800026c8:	fb843703          	ld	a4,-72(s0)
    800026cc:	fe043783          	ld	a5,-32(s0)
    800026d0:	8f1d                	sub	a4,a4,a5
    800026d2:	fd843783          	ld	a5,-40(s0)
    800026d6:	97ba                	add	a5,a5,a4
    800026d8:	873e                	mv	a4,a5
    800026da:	fe843783          	ld	a5,-24(s0)
    800026de:	2781                	sext.w	a5,a5
    800026e0:	863e                	mv	a2,a5
    800026e2:	85ba                	mv	a1,a4
    800026e4:	fc043503          	ld	a0,-64(s0)
    800026e8:	fffff097          	auipc	ra,0xfffff
    800026ec:	efa080e7          	jalr	-262(ra) # 800015e2 <memmove>

    len -= n;
    800026f0:	fb043703          	ld	a4,-80(s0)
    800026f4:	fe843783          	ld	a5,-24(s0)
    800026f8:	40f707b3          	sub	a5,a4,a5
    800026fc:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002700:	fc043703          	ld	a4,-64(s0)
    80002704:	fe843783          	ld	a5,-24(s0)
    80002708:	97ba                	add	a5,a5,a4
    8000270a:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    8000270e:	fe043703          	ld	a4,-32(s0)
    80002712:	6785                	lui	a5,0x1
    80002714:	97ba                	add	a5,a5,a4
    80002716:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    8000271a:	fb043783          	ld	a5,-80(s0)
    8000271e:	ffa9                	bnez	a5,80002678 <copyin+0x1a>
  }
  return 0;
    80002720:	4781                	li	a5,0
}
    80002722:	853e                	mv	a0,a5
    80002724:	60a6                	ld	ra,72(sp)
    80002726:	6406                	ld	s0,64(sp)
    80002728:	6161                	addi	sp,sp,80
    8000272a:	8082                	ret

000000008000272c <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    8000272c:	711d                	addi	sp,sp,-96
    8000272e:	ec86                	sd	ra,88(sp)
    80002730:	e8a2                	sd	s0,80(sp)
    80002732:	1080                	addi	s0,sp,96
    80002734:	faa43c23          	sd	a0,-72(s0)
    80002738:	fab43823          	sd	a1,-80(s0)
    8000273c:	fac43423          	sd	a2,-88(s0)
    80002740:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    80002744:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    80002748:	a0f1                	j	80002814 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    8000274a:	fa843703          	ld	a4,-88(s0)
    8000274e:	77fd                	lui	a5,0xfffff
    80002750:	8ff9                	and	a5,a5,a4
    80002752:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    80002756:	fd043583          	ld	a1,-48(s0)
    8000275a:	fb843503          	ld	a0,-72(s0)
    8000275e:	fffff097          	auipc	ra,0xfffff
    80002762:	6ae080e7          	jalr	1710(ra) # 80001e0c <walkaddr>
    80002766:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    8000276a:	fc843783          	ld	a5,-56(s0)
    8000276e:	e399                	bnez	a5,80002774 <copyinstr+0x48>
      return -1;
    80002770:	57fd                	li	a5,-1
    80002772:	a87d                	j	80002830 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    80002774:	fd043703          	ld	a4,-48(s0)
    80002778:	fa843783          	ld	a5,-88(s0)
    8000277c:	8f1d                	sub	a4,a4,a5
    8000277e:	6785                	lui	a5,0x1
    80002780:	97ba                	add	a5,a5,a4
    80002782:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    80002786:	fe843703          	ld	a4,-24(s0)
    8000278a:	fa043783          	ld	a5,-96(s0)
    8000278e:	00e7f663          	bgeu	a5,a4,8000279a <copyinstr+0x6e>
      n = max;
    80002792:	fa043783          	ld	a5,-96(s0)
    80002796:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    8000279a:	fa843703          	ld	a4,-88(s0)
    8000279e:	fd043783          	ld	a5,-48(s0)
    800027a2:	8f1d                	sub	a4,a4,a5
    800027a4:	fc843783          	ld	a5,-56(s0)
    800027a8:	97ba                	add	a5,a5,a4
    800027aa:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    800027ae:	a891                	j	80002802 <copyinstr+0xd6>
      if(*p == '\0'){
    800027b0:	fd843783          	ld	a5,-40(s0)
    800027b4:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    800027b8:	eb89                	bnez	a5,800027ca <copyinstr+0x9e>
        *dst = '\0';
    800027ba:	fb043783          	ld	a5,-80(s0)
    800027be:	00078023          	sb	zero,0(a5)
        got_null = 1;
    800027c2:	4785                	li	a5,1
    800027c4:	fef42223          	sw	a5,-28(s0)
        break;
    800027c8:	a081                	j	80002808 <copyinstr+0xdc>
      } else {
        *dst = *p;
    800027ca:	fd843783          	ld	a5,-40(s0)
    800027ce:	0007c703          	lbu	a4,0(a5)
    800027d2:	fb043783          	ld	a5,-80(s0)
    800027d6:	00e78023          	sb	a4,0(a5)
      }
      --n;
    800027da:	fe843783          	ld	a5,-24(s0)
    800027de:	17fd                	addi	a5,a5,-1
    800027e0:	fef43423          	sd	a5,-24(s0)
      --max;
    800027e4:	fa043783          	ld	a5,-96(s0)
    800027e8:	17fd                	addi	a5,a5,-1
    800027ea:	faf43023          	sd	a5,-96(s0)
      p++;
    800027ee:	fd843783          	ld	a5,-40(s0)
    800027f2:	0785                	addi	a5,a5,1
    800027f4:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    800027f8:	fb043783          	ld	a5,-80(s0)
    800027fc:	0785                	addi	a5,a5,1
    800027fe:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002802:	fe843783          	ld	a5,-24(s0)
    80002806:	f7cd                	bnez	a5,800027b0 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    80002808:	fd043703          	ld	a4,-48(s0)
    8000280c:	6785                	lui	a5,0x1
    8000280e:	97ba                	add	a5,a5,a4
    80002810:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    80002814:	fe442783          	lw	a5,-28(s0)
    80002818:	2781                	sext.w	a5,a5
    8000281a:	e781                	bnez	a5,80002822 <copyinstr+0xf6>
    8000281c:	fa043783          	ld	a5,-96(s0)
    80002820:	f78d                	bnez	a5,8000274a <copyinstr+0x1e>
  }
  if(got_null){
    80002822:	fe442783          	lw	a5,-28(s0)
    80002826:	2781                	sext.w	a5,a5
    80002828:	c399                	beqz	a5,8000282e <copyinstr+0x102>
    return 0;
    8000282a:	4781                	li	a5,0
    8000282c:	a011                	j	80002830 <copyinstr+0x104>
  } else {
    return -1;
    8000282e:	57fd                	li	a5,-1
  }
}
    80002830:	853e                	mv	a0,a5
    80002832:	60e6                	ld	ra,88(sp)
    80002834:	6446                	ld	s0,80(sp)
    80002836:	6125                	addi	sp,sp,96
    80002838:	8082                	ret

000000008000283a <r_sstatus>:
{
    8000283a:	1101                	addi	sp,sp,-32
    8000283c:	ec22                	sd	s0,24(sp)
    8000283e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002840:	100027f3          	csrr	a5,sstatus
    80002844:	fef43423          	sd	a5,-24(s0)
  return x;
    80002848:	fe843783          	ld	a5,-24(s0)
}
    8000284c:	853e                	mv	a0,a5
    8000284e:	6462                	ld	s0,24(sp)
    80002850:	6105                	addi	sp,sp,32
    80002852:	8082                	ret

0000000080002854 <w_sstatus>:
{
    80002854:	1101                	addi	sp,sp,-32
    80002856:	ec22                	sd	s0,24(sp)
    80002858:	1000                	addi	s0,sp,32
    8000285a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8000285e:	fe843783          	ld	a5,-24(s0)
    80002862:	10079073          	csrw	sstatus,a5
}
    80002866:	0001                	nop
    80002868:	6462                	ld	s0,24(sp)
    8000286a:	6105                	addi	sp,sp,32
    8000286c:	8082                	ret

000000008000286e <intr_on>:
{
    8000286e:	1141                	addi	sp,sp,-16
    80002870:	e406                	sd	ra,8(sp)
    80002872:	e022                	sd	s0,0(sp)
    80002874:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80002876:	00000097          	auipc	ra,0x0
    8000287a:	fc4080e7          	jalr	-60(ra) # 8000283a <r_sstatus>
    8000287e:	87aa                	mv	a5,a0
    80002880:	0027e793          	ori	a5,a5,2
    80002884:	853e                	mv	a0,a5
    80002886:	00000097          	auipc	ra,0x0
    8000288a:	fce080e7          	jalr	-50(ra) # 80002854 <w_sstatus>
}
    8000288e:	0001                	nop
    80002890:	60a2                	ld	ra,8(sp)
    80002892:	6402                	ld	s0,0(sp)
    80002894:	0141                	addi	sp,sp,16
    80002896:	8082                	ret

0000000080002898 <intr_get>:
{
    80002898:	1101                	addi	sp,sp,-32
    8000289a:	ec06                	sd	ra,24(sp)
    8000289c:	e822                	sd	s0,16(sp)
    8000289e:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800028a0:	00000097          	auipc	ra,0x0
    800028a4:	f9a080e7          	jalr	-102(ra) # 8000283a <r_sstatus>
    800028a8:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800028ac:	fe843783          	ld	a5,-24(s0)
    800028b0:	8b89                	andi	a5,a5,2
    800028b2:	00f037b3          	snez	a5,a5
    800028b6:	0ff7f793          	andi	a5,a5,255
    800028ba:	2781                	sext.w	a5,a5
}
    800028bc:	853e                	mv	a0,a5
    800028be:	60e2                	ld	ra,24(sp)
    800028c0:	6442                	ld	s0,16(sp)
    800028c2:	6105                	addi	sp,sp,32
    800028c4:	8082                	ret

00000000800028c6 <r_tp>:
{
    800028c6:	1101                	addi	sp,sp,-32
    800028c8:	ec22                	sd	s0,24(sp)
    800028ca:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    800028cc:	8792                	mv	a5,tp
    800028ce:	fef43423          	sd	a5,-24(s0)
  return x;
    800028d2:	fe843783          	ld	a5,-24(s0)
}
    800028d6:	853e                	mv	a0,a5
    800028d8:	6462                	ld	s0,24(sp)
    800028da:	6105                	addi	sp,sp,32
    800028dc:	8082                	ret

00000000800028de <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    800028de:	7139                	addi	sp,sp,-64
    800028e0:	fc06                	sd	ra,56(sp)
    800028e2:	f822                	sd	s0,48(sp)
    800028e4:	0080                	addi	s0,sp,64
    800028e6:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    800028ea:	00021797          	auipc	a5,0x21
    800028ee:	6ce78793          	addi	a5,a5,1742 # 80023fb8 <proc>
    800028f2:	fef43423          	sd	a5,-24(s0)
    800028f6:	a061                	j	8000297e <proc_mapstacks+0xa0>
    char *pa = kalloc();
    800028f8:	fffff097          	auipc	ra,0xfffff
    800028fc:	8de080e7          	jalr	-1826(ra) # 800011d6 <kalloc>
    80002900:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80002904:	fe043783          	ld	a5,-32(s0)
    80002908:	eb89                	bnez	a5,8000291a <proc_mapstacks+0x3c>
      panic("kalloc");
    8000290a:	00009517          	auipc	a0,0x9
    8000290e:	8ce50513          	addi	a0,a0,-1842 # 8000b1d8 <etext+0x1d8>
    80002912:	ffffe097          	auipc	ra,0xffffe
    80002916:	37a080e7          	jalr	890(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    8000291a:	fe843703          	ld	a4,-24(s0)
    8000291e:	00021797          	auipc	a5,0x21
    80002922:	69a78793          	addi	a5,a5,1690 # 80023fb8 <proc>
    80002926:	40f707b3          	sub	a5,a4,a5
    8000292a:	4037d713          	srai	a4,a5,0x3
    8000292e:	00009797          	auipc	a5,0x9
    80002932:	9a278793          	addi	a5,a5,-1630 # 8000b2d0 <etext+0x2d0>
    80002936:	639c                	ld	a5,0(a5)
    80002938:	02f707b3          	mul	a5,a4,a5
    8000293c:	2781                	sext.w	a5,a5
    8000293e:	2785                	addiw	a5,a5,1
    80002940:	2781                	sext.w	a5,a5
    80002942:	00d7979b          	slliw	a5,a5,0xd
    80002946:	2781                	sext.w	a5,a5
    80002948:	873e                	mv	a4,a5
    8000294a:	040007b7          	lui	a5,0x4000
    8000294e:	17fd                	addi	a5,a5,-1
    80002950:	07b2                	slli	a5,a5,0xc
    80002952:	8f99                	sub	a5,a5,a4
    80002954:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    80002958:	fe043783          	ld	a5,-32(s0)
    8000295c:	4719                	li	a4,6
    8000295e:	6685                	lui	a3,0x1
    80002960:	863e                	mv	a2,a5
    80002962:	fd843583          	ld	a1,-40(s0)
    80002966:	fc843503          	ld	a0,-56(s0)
    8000296a:	fffff097          	auipc	ra,0xfffff
    8000296e:	51a080e7          	jalr	1306(ra) # 80001e84 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002972:	fe843783          	ld	a5,-24(s0)
    80002976:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    8000297a:	fef43423          	sd	a5,-24(s0)
    8000297e:	fe843703          	ld	a4,-24(s0)
    80002982:	00027797          	auipc	a5,0x27
    80002986:	03678793          	addi	a5,a5,54 # 800299b8 <pid_lock>
    8000298a:	f6f767e3          	bltu	a4,a5,800028f8 <proc_mapstacks+0x1a>
  }
}
    8000298e:	0001                	nop
    80002990:	0001                	nop
    80002992:	70e2                	ld	ra,56(sp)
    80002994:	7442                	ld	s0,48(sp)
    80002996:	6121                	addi	sp,sp,64
    80002998:	8082                	ret

000000008000299a <procinit>:

// initialize the proc table.
void
procinit(void)
{
    8000299a:	1101                	addi	sp,sp,-32
    8000299c:	ec06                	sd	ra,24(sp)
    8000299e:	e822                	sd	s0,16(sp)
    800029a0:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800029a2:	00009597          	auipc	a1,0x9
    800029a6:	83e58593          	addi	a1,a1,-1986 # 8000b1e0 <etext+0x1e0>
    800029aa:	00027517          	auipc	a0,0x27
    800029ae:	00e50513          	addi	a0,a0,14 # 800299b8 <pid_lock>
    800029b2:	fffff097          	auipc	ra,0xfffff
    800029b6:	948080e7          	jalr	-1720(ra) # 800012fa <initlock>
  initlock(&wait_lock, "wait_lock");
    800029ba:	00009597          	auipc	a1,0x9
    800029be:	82e58593          	addi	a1,a1,-2002 # 8000b1e8 <etext+0x1e8>
    800029c2:	00027517          	auipc	a0,0x27
    800029c6:	00e50513          	addi	a0,a0,14 # 800299d0 <wait_lock>
    800029ca:	fffff097          	auipc	ra,0xfffff
    800029ce:	930080e7          	jalr	-1744(ra) # 800012fa <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    800029d2:	00021797          	auipc	a5,0x21
    800029d6:	5e678793          	addi	a5,a5,1510 # 80023fb8 <proc>
    800029da:	fef43423          	sd	a5,-24(s0)
    800029de:	a0bd                	j	80002a4c <procinit+0xb2>
      initlock(&p->lock, "proc");
    800029e0:	fe843783          	ld	a5,-24(s0)
    800029e4:	00009597          	auipc	a1,0x9
    800029e8:	81458593          	addi	a1,a1,-2028 # 8000b1f8 <etext+0x1f8>
    800029ec:	853e                	mv	a0,a5
    800029ee:	fffff097          	auipc	ra,0xfffff
    800029f2:	90c080e7          	jalr	-1780(ra) # 800012fa <initlock>
      p->state = UNUSED;
    800029f6:	fe843783          	ld	a5,-24(s0)
    800029fa:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    800029fe:	fe843703          	ld	a4,-24(s0)
    80002a02:	00021797          	auipc	a5,0x21
    80002a06:	5b678793          	addi	a5,a5,1462 # 80023fb8 <proc>
    80002a0a:	40f707b3          	sub	a5,a4,a5
    80002a0e:	4037d713          	srai	a4,a5,0x3
    80002a12:	00009797          	auipc	a5,0x9
    80002a16:	8be78793          	addi	a5,a5,-1858 # 8000b2d0 <etext+0x2d0>
    80002a1a:	639c                	ld	a5,0(a5)
    80002a1c:	02f707b3          	mul	a5,a4,a5
    80002a20:	2781                	sext.w	a5,a5
    80002a22:	2785                	addiw	a5,a5,1
    80002a24:	2781                	sext.w	a5,a5
    80002a26:	00d7979b          	slliw	a5,a5,0xd
    80002a2a:	2781                	sext.w	a5,a5
    80002a2c:	873e                	mv	a4,a5
    80002a2e:	040007b7          	lui	a5,0x4000
    80002a32:	17fd                	addi	a5,a5,-1
    80002a34:	07b2                	slli	a5,a5,0xc
    80002a36:	8f99                	sub	a5,a5,a4
    80002a38:	873e                	mv	a4,a5
    80002a3a:	fe843783          	ld	a5,-24(s0)
    80002a3e:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002a40:	fe843783          	ld	a5,-24(s0)
    80002a44:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002a48:	fef43423          	sd	a5,-24(s0)
    80002a4c:	fe843703          	ld	a4,-24(s0)
    80002a50:	00027797          	auipc	a5,0x27
    80002a54:	f6878793          	addi	a5,a5,-152 # 800299b8 <pid_lock>
    80002a58:	f8f764e3          	bltu	a4,a5,800029e0 <procinit+0x46>
  }
}
    80002a5c:	0001                	nop
    80002a5e:	0001                	nop
    80002a60:	60e2                	ld	ra,24(sp)
    80002a62:	6442                	ld	s0,16(sp)
    80002a64:	6105                	addi	sp,sp,32
    80002a66:	8082                	ret

0000000080002a68 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002a68:	1101                	addi	sp,sp,-32
    80002a6a:	ec06                	sd	ra,24(sp)
    80002a6c:	e822                	sd	s0,16(sp)
    80002a6e:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002a70:	00000097          	auipc	ra,0x0
    80002a74:	e56080e7          	jalr	-426(ra) # 800028c6 <r_tp>
    80002a78:	87aa                	mv	a5,a0
    80002a7a:	fef42623          	sw	a5,-20(s0)
  return id;
    80002a7e:	fec42783          	lw	a5,-20(s0)
}
    80002a82:	853e                	mv	a0,a5
    80002a84:	60e2                	ld	ra,24(sp)
    80002a86:	6442                	ld	s0,16(sp)
    80002a88:	6105                	addi	sp,sp,32
    80002a8a:	8082                	ret

0000000080002a8c <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002a8c:	1101                	addi	sp,sp,-32
    80002a8e:	ec06                	sd	ra,24(sp)
    80002a90:	e822                	sd	s0,16(sp)
    80002a92:	1000                	addi	s0,sp,32
  int id = cpuid();
    80002a94:	00000097          	auipc	ra,0x0
    80002a98:	fd4080e7          	jalr	-44(ra) # 80002a68 <cpuid>
    80002a9c:	87aa                	mv	a5,a0
    80002a9e:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002aa2:	fec42783          	lw	a5,-20(s0)
    80002aa6:	00779713          	slli	a4,a5,0x7
    80002aaa:	00021797          	auipc	a5,0x21
    80002aae:	10e78793          	addi	a5,a5,270 # 80023bb8 <cpus>
    80002ab2:	97ba                	add	a5,a5,a4
    80002ab4:	fef43023          	sd	a5,-32(s0)
  return c;
    80002ab8:	fe043783          	ld	a5,-32(s0)
}
    80002abc:	853e                	mv	a0,a5
    80002abe:	60e2                	ld	ra,24(sp)
    80002ac0:	6442                	ld	s0,16(sp)
    80002ac2:	6105                	addi	sp,sp,32
    80002ac4:	8082                	ret

0000000080002ac6 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002ac6:	1101                	addi	sp,sp,-32
    80002ac8:	ec06                	sd	ra,24(sp)
    80002aca:	e822                	sd	s0,16(sp)
    80002acc:	1000                	addi	s0,sp,32
  push_off();
    80002ace:	fffff097          	auipc	ra,0xfffff
    80002ad2:	95a080e7          	jalr	-1702(ra) # 80001428 <push_off>
  struct cpu *c = mycpu();
    80002ad6:	00000097          	auipc	ra,0x0
    80002ada:	fb6080e7          	jalr	-74(ra) # 80002a8c <mycpu>
    80002ade:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002ae2:	fe843783          	ld	a5,-24(s0)
    80002ae6:	639c                	ld	a5,0(a5)
    80002ae8:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	994080e7          	jalr	-1644(ra) # 80001480 <pop_off>
  return p;
    80002af4:	fe043783          	ld	a5,-32(s0)
}
    80002af8:	853e                	mv	a0,a5
    80002afa:	60e2                	ld	ra,24(sp)
    80002afc:	6442                	ld	s0,16(sp)
    80002afe:	6105                	addi	sp,sp,32
    80002b00:	8082                	ret

0000000080002b02 <allocpid>:

int
allocpid()
{
    80002b02:	1101                	addi	sp,sp,-32
    80002b04:	ec06                	sd	ra,24(sp)
    80002b06:	e822                	sd	s0,16(sp)
    80002b08:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002b0a:	00027517          	auipc	a0,0x27
    80002b0e:	eae50513          	addi	a0,a0,-338 # 800299b8 <pid_lock>
    80002b12:	fffff097          	auipc	ra,0xfffff
    80002b16:	818080e7          	jalr	-2024(ra) # 8000132a <acquire>
  pid = nextpid;
    80002b1a:	00009797          	auipc	a5,0x9
    80002b1e:	ca678793          	addi	a5,a5,-858 # 8000b7c0 <nextpid>
    80002b22:	439c                	lw	a5,0(a5)
    80002b24:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002b28:	00009797          	auipc	a5,0x9
    80002b2c:	c9878793          	addi	a5,a5,-872 # 8000b7c0 <nextpid>
    80002b30:	439c                	lw	a5,0(a5)
    80002b32:	2785                	addiw	a5,a5,1
    80002b34:	0007871b          	sext.w	a4,a5
    80002b38:	00009797          	auipc	a5,0x9
    80002b3c:	c8878793          	addi	a5,a5,-888 # 8000b7c0 <nextpid>
    80002b40:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002b42:	00027517          	auipc	a0,0x27
    80002b46:	e7650513          	addi	a0,a0,-394 # 800299b8 <pid_lock>
    80002b4a:	fffff097          	auipc	ra,0xfffff
    80002b4e:	844080e7          	jalr	-1980(ra) # 8000138e <release>

  return pid;
    80002b52:	fec42783          	lw	a5,-20(s0)
}
    80002b56:	853e                	mv	a0,a5
    80002b58:	60e2                	ld	ra,24(sp)
    80002b5a:	6442                	ld	s0,16(sp)
    80002b5c:	6105                	addi	sp,sp,32
    80002b5e:	8082                	ret

0000000080002b60 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002b60:	1101                	addi	sp,sp,-32
    80002b62:	ec06                	sd	ra,24(sp)
    80002b64:	e822                	sd	s0,16(sp)
    80002b66:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002b68:	00021797          	auipc	a5,0x21
    80002b6c:	45078793          	addi	a5,a5,1104 # 80023fb8 <proc>
    80002b70:	fef43423          	sd	a5,-24(s0)
    80002b74:	a80d                	j	80002ba6 <allocproc+0x46>
    acquire(&p->lock);
    80002b76:	fe843783          	ld	a5,-24(s0)
    80002b7a:	853e                	mv	a0,a5
    80002b7c:	ffffe097          	auipc	ra,0xffffe
    80002b80:	7ae080e7          	jalr	1966(ra) # 8000132a <acquire>
    if(p->state == UNUSED) {
    80002b84:	fe843783          	ld	a5,-24(s0)
    80002b88:	4f9c                	lw	a5,24(a5)
    80002b8a:	cb85                	beqz	a5,80002bba <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002b8c:	fe843783          	ld	a5,-24(s0)
    80002b90:	853e                	mv	a0,a5
    80002b92:	ffffe097          	auipc	ra,0xffffe
    80002b96:	7fc080e7          	jalr	2044(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002b9a:	fe843783          	ld	a5,-24(s0)
    80002b9e:	16878793          	addi	a5,a5,360
    80002ba2:	fef43423          	sd	a5,-24(s0)
    80002ba6:	fe843703          	ld	a4,-24(s0)
    80002baa:	00027797          	auipc	a5,0x27
    80002bae:	e0e78793          	addi	a5,a5,-498 # 800299b8 <pid_lock>
    80002bb2:	fcf762e3          	bltu	a4,a5,80002b76 <allocproc+0x16>
    }
  }
  return 0;
    80002bb6:	4781                	li	a5,0
    80002bb8:	a0e1                	j	80002c80 <allocproc+0x120>
      goto found;
    80002bba:	0001                	nop

found:
  p->pid = allocpid();
    80002bbc:	00000097          	auipc	ra,0x0
    80002bc0:	f46080e7          	jalr	-186(ra) # 80002b02 <allocpid>
    80002bc4:	87aa                	mv	a5,a0
    80002bc6:	873e                	mv	a4,a5
    80002bc8:	fe843783          	ld	a5,-24(s0)
    80002bcc:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002bce:	fe843783          	ld	a5,-24(s0)
    80002bd2:	4705                	li	a4,1
    80002bd4:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002bd6:	ffffe097          	auipc	ra,0xffffe
    80002bda:	600080e7          	jalr	1536(ra) # 800011d6 <kalloc>
    80002bde:	872a                	mv	a4,a0
    80002be0:	fe843783          	ld	a5,-24(s0)
    80002be4:	efb8                	sd	a4,88(a5)
    80002be6:	fe843783          	ld	a5,-24(s0)
    80002bea:	6fbc                	ld	a5,88(a5)
    80002bec:	e385                	bnez	a5,80002c0c <allocproc+0xac>
    freeproc(p);
    80002bee:	fe843503          	ld	a0,-24(s0)
    80002bf2:	00000097          	auipc	ra,0x0
    80002bf6:	098080e7          	jalr	152(ra) # 80002c8a <freeproc>
    release(&p->lock);
    80002bfa:	fe843783          	ld	a5,-24(s0)
    80002bfe:	853e                	mv	a0,a5
    80002c00:	ffffe097          	auipc	ra,0xffffe
    80002c04:	78e080e7          	jalr	1934(ra) # 8000138e <release>
    return 0;
    80002c08:	4781                	li	a5,0
    80002c0a:	a89d                	j	80002c80 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002c0c:	fe843503          	ld	a0,-24(s0)
    80002c10:	00000097          	auipc	ra,0x0
    80002c14:	118080e7          	jalr	280(ra) # 80002d28 <proc_pagetable>
    80002c18:	872a                	mv	a4,a0
    80002c1a:	fe843783          	ld	a5,-24(s0)
    80002c1e:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002c20:	fe843783          	ld	a5,-24(s0)
    80002c24:	6bbc                	ld	a5,80(a5)
    80002c26:	e385                	bnez	a5,80002c46 <allocproc+0xe6>
    freeproc(p);
    80002c28:	fe843503          	ld	a0,-24(s0)
    80002c2c:	00000097          	auipc	ra,0x0
    80002c30:	05e080e7          	jalr	94(ra) # 80002c8a <freeproc>
    release(&p->lock);
    80002c34:	fe843783          	ld	a5,-24(s0)
    80002c38:	853e                	mv	a0,a5
    80002c3a:	ffffe097          	auipc	ra,0xffffe
    80002c3e:	754080e7          	jalr	1876(ra) # 8000138e <release>
    return 0;
    80002c42:	4781                	li	a5,0
    80002c44:	a835                	j	80002c80 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002c46:	fe843783          	ld	a5,-24(s0)
    80002c4a:	06078793          	addi	a5,a5,96
    80002c4e:	07000613          	li	a2,112
    80002c52:	4581                	li	a1,0
    80002c54:	853e                	mv	a0,a5
    80002c56:	fffff097          	auipc	ra,0xfffff
    80002c5a:	8a8080e7          	jalr	-1880(ra) # 800014fe <memset>
  p->context.ra = (uint64)forkret;
    80002c5e:	00001717          	auipc	a4,0x1
    80002c62:	9da70713          	addi	a4,a4,-1574 # 80003638 <forkret>
    80002c66:	fe843783          	ld	a5,-24(s0)
    80002c6a:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002c6c:	fe843783          	ld	a5,-24(s0)
    80002c70:	63b8                	ld	a4,64(a5)
    80002c72:	6785                	lui	a5,0x1
    80002c74:	973e                	add	a4,a4,a5
    80002c76:	fe843783          	ld	a5,-24(s0)
    80002c7a:	f7b8                	sd	a4,104(a5)

  return p;
    80002c7c:	fe843783          	ld	a5,-24(s0)
}
    80002c80:	853e                	mv	a0,a5
    80002c82:	60e2                	ld	ra,24(sp)
    80002c84:	6442                	ld	s0,16(sp)
    80002c86:	6105                	addi	sp,sp,32
    80002c88:	8082                	ret

0000000080002c8a <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002c8a:	1101                	addi	sp,sp,-32
    80002c8c:	ec06                	sd	ra,24(sp)
    80002c8e:	e822                	sd	s0,16(sp)
    80002c90:	1000                	addi	s0,sp,32
    80002c92:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002c96:	fe843783          	ld	a5,-24(s0)
    80002c9a:	6fbc                	ld	a5,88(a5)
    80002c9c:	cb89                	beqz	a5,80002cae <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002c9e:	fe843783          	ld	a5,-24(s0)
    80002ca2:	6fbc                	ld	a5,88(a5)
    80002ca4:	853e                	mv	a0,a5
    80002ca6:	ffffe097          	auipc	ra,0xffffe
    80002caa:	48a080e7          	jalr	1162(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80002cae:	fe843783          	ld	a5,-24(s0)
    80002cb2:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002cb6:	fe843783          	ld	a5,-24(s0)
    80002cba:	6bbc                	ld	a5,80(a5)
    80002cbc:	cf89                	beqz	a5,80002cd6 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002cbe:	fe843783          	ld	a5,-24(s0)
    80002cc2:	6bb8                	ld	a4,80(a5)
    80002cc4:	fe843783          	ld	a5,-24(s0)
    80002cc8:	67bc                	ld	a5,72(a5)
    80002cca:	85be                	mv	a1,a5
    80002ccc:	853a                	mv	a0,a4
    80002cce:	00000097          	auipc	ra,0x0
    80002cd2:	11a080e7          	jalr	282(ra) # 80002de8 <proc_freepagetable>
  p->pagetable = 0;
    80002cd6:	fe843783          	ld	a5,-24(s0)
    80002cda:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002cde:	fe843783          	ld	a5,-24(s0)
    80002ce2:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002ce6:	fe843783          	ld	a5,-24(s0)
    80002cea:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002cee:	fe843783          	ld	a5,-24(s0)
    80002cf2:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002cf6:	fe843783          	ld	a5,-24(s0)
    80002cfa:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002cfe:	fe843783          	ld	a5,-24(s0)
    80002d02:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002d06:	fe843783          	ld	a5,-24(s0)
    80002d0a:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002d0e:	fe843783          	ld	a5,-24(s0)
    80002d12:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002d16:	fe843783          	ld	a5,-24(s0)
    80002d1a:	0007ac23          	sw	zero,24(a5)
}
    80002d1e:	0001                	nop
    80002d20:	60e2                	ld	ra,24(sp)
    80002d22:	6442                	ld	s0,16(sp)
    80002d24:	6105                	addi	sp,sp,32
    80002d26:	8082                	ret

0000000080002d28 <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002d28:	7179                	addi	sp,sp,-48
    80002d2a:	f406                	sd	ra,40(sp)
    80002d2c:	f022                	sd	s0,32(sp)
    80002d2e:	1800                	addi	s0,sp,48
    80002d30:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002d34:	fffff097          	auipc	ra,0xfffff
    80002d38:	3a0080e7          	jalr	928(ra) # 800020d4 <uvmcreate>
    80002d3c:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002d40:	fe843783          	ld	a5,-24(s0)
    80002d44:	e399                	bnez	a5,80002d4a <proc_pagetable+0x22>
    return 0;
    80002d46:	4781                	li	a5,0
    80002d48:	a859                	j	80002dde <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002d4a:	00007797          	auipc	a5,0x7
    80002d4e:	2b678793          	addi	a5,a5,694 # 8000a000 <_trampoline>
    80002d52:	4729                	li	a4,10
    80002d54:	86be                	mv	a3,a5
    80002d56:	6605                	lui	a2,0x1
    80002d58:	040007b7          	lui	a5,0x4000
    80002d5c:	17fd                	addi	a5,a5,-1
    80002d5e:	00c79593          	slli	a1,a5,0xc
    80002d62:	fe843503          	ld	a0,-24(s0)
    80002d66:	fffff097          	auipc	ra,0xfffff
    80002d6a:	178080e7          	jalr	376(ra) # 80001ede <mappages>
    80002d6e:	87aa                	mv	a5,a0
    80002d70:	0007db63          	bgez	a5,80002d86 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002d74:	4581                	li	a1,0
    80002d76:	fe843503          	ld	a0,-24(s0)
    80002d7a:	fffff097          	auipc	ra,0xfffff
    80002d7e:	656080e7          	jalr	1622(ra) # 800023d0 <uvmfree>
    return 0;
    80002d82:	4781                	li	a5,0
    80002d84:	a8a9                	j	80002dde <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002d86:	fd843783          	ld	a5,-40(s0)
    80002d8a:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002d8c:	4719                	li	a4,6
    80002d8e:	86be                	mv	a3,a5
    80002d90:	6605                	lui	a2,0x1
    80002d92:	020007b7          	lui	a5,0x2000
    80002d96:	17fd                	addi	a5,a5,-1
    80002d98:	00d79593          	slli	a1,a5,0xd
    80002d9c:	fe843503          	ld	a0,-24(s0)
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	13e080e7          	jalr	318(ra) # 80001ede <mappages>
    80002da8:	87aa                	mv	a5,a0
    80002daa:	0207d863          	bgez	a5,80002dda <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002dae:	4681                	li	a3,0
    80002db0:	4605                	li	a2,1
    80002db2:	040007b7          	lui	a5,0x4000
    80002db6:	17fd                	addi	a5,a5,-1
    80002db8:	00c79593          	slli	a1,a5,0xc
    80002dbc:	fe843503          	ld	a0,-24(s0)
    80002dc0:	fffff097          	auipc	ra,0xfffff
    80002dc4:	208080e7          	jalr	520(ra) # 80001fc8 <uvmunmap>
    uvmfree(pagetable, 0);
    80002dc8:	4581                	li	a1,0
    80002dca:	fe843503          	ld	a0,-24(s0)
    80002dce:	fffff097          	auipc	ra,0xfffff
    80002dd2:	602080e7          	jalr	1538(ra) # 800023d0 <uvmfree>
    return 0;
    80002dd6:	4781                	li	a5,0
    80002dd8:	a019                	j	80002dde <proc_pagetable+0xb6>
  }

  return pagetable;
    80002dda:	fe843783          	ld	a5,-24(s0)
}
    80002dde:	853e                	mv	a0,a5
    80002de0:	70a2                	ld	ra,40(sp)
    80002de2:	7402                	ld	s0,32(sp)
    80002de4:	6145                	addi	sp,sp,48
    80002de6:	8082                	ret

0000000080002de8 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002de8:	1101                	addi	sp,sp,-32
    80002dea:	ec06                	sd	ra,24(sp)
    80002dec:	e822                	sd	s0,16(sp)
    80002dee:	1000                	addi	s0,sp,32
    80002df0:	fea43423          	sd	a0,-24(s0)
    80002df4:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002df8:	4681                	li	a3,0
    80002dfa:	4605                	li	a2,1
    80002dfc:	040007b7          	lui	a5,0x4000
    80002e00:	17fd                	addi	a5,a5,-1
    80002e02:	00c79593          	slli	a1,a5,0xc
    80002e06:	fe843503          	ld	a0,-24(s0)
    80002e0a:	fffff097          	auipc	ra,0xfffff
    80002e0e:	1be080e7          	jalr	446(ra) # 80001fc8 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002e12:	4681                	li	a3,0
    80002e14:	4605                	li	a2,1
    80002e16:	020007b7          	lui	a5,0x2000
    80002e1a:	17fd                	addi	a5,a5,-1
    80002e1c:	00d79593          	slli	a1,a5,0xd
    80002e20:	fe843503          	ld	a0,-24(s0)
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	1a4080e7          	jalr	420(ra) # 80001fc8 <uvmunmap>
  uvmfree(pagetable, sz);
    80002e2c:	fe043583          	ld	a1,-32(s0)
    80002e30:	fe843503          	ld	a0,-24(s0)
    80002e34:	fffff097          	auipc	ra,0xfffff
    80002e38:	59c080e7          	jalr	1436(ra) # 800023d0 <uvmfree>
}
    80002e3c:	0001                	nop
    80002e3e:	60e2                	ld	ra,24(sp)
    80002e40:	6442                	ld	s0,16(sp)
    80002e42:	6105                	addi	sp,sp,32
    80002e44:	8082                	ret

0000000080002e46 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002e46:	1101                	addi	sp,sp,-32
    80002e48:	ec06                	sd	ra,24(sp)
    80002e4a:	e822                	sd	s0,16(sp)
    80002e4c:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002e4e:	00000097          	auipc	ra,0x0
    80002e52:	d12080e7          	jalr	-750(ra) # 80002b60 <allocproc>
    80002e56:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002e5a:	00009797          	auipc	a5,0x9
    80002e5e:	ae678793          	addi	a5,a5,-1306 # 8000b940 <initproc>
    80002e62:	fe843703          	ld	a4,-24(s0)
    80002e66:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002e68:	fe843783          	ld	a5,-24(s0)
    80002e6c:	6bbc                	ld	a5,80(a5)
    80002e6e:	03400613          	li	a2,52
    80002e72:	00009597          	auipc	a1,0x9
    80002e76:	97658593          	addi	a1,a1,-1674 # 8000b7e8 <initcode>
    80002e7a:	853e                	mv	a0,a5
    80002e7c:	fffff097          	auipc	ra,0xfffff
    80002e80:	294080e7          	jalr	660(ra) # 80002110 <uvmfirst>
  p->sz = PGSIZE;
    80002e84:	fe843783          	ld	a5,-24(s0)
    80002e88:	6705                	lui	a4,0x1
    80002e8a:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002e8c:	fe843783          	ld	a5,-24(s0)
    80002e90:	6fbc                	ld	a5,88(a5)
    80002e92:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002e96:	fe843783          	ld	a5,-24(s0)
    80002e9a:	6fbc                	ld	a5,88(a5)
    80002e9c:	6705                	lui	a4,0x1
    80002e9e:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002ea0:	fe843783          	ld	a5,-24(s0)
    80002ea4:	15878793          	addi	a5,a5,344
    80002ea8:	4641                	li	a2,16
    80002eaa:	00008597          	auipc	a1,0x8
    80002eae:	35658593          	addi	a1,a1,854 # 8000b200 <etext+0x200>
    80002eb2:	853e                	mv	a0,a5
    80002eb4:	fffff097          	auipc	ra,0xfffff
    80002eb8:	94e080e7          	jalr	-1714(ra) # 80001802 <safestrcpy>
  p->cwd = namei("/");
    80002ebc:	00008517          	auipc	a0,0x8
    80002ec0:	35450513          	addi	a0,a0,852 # 8000b210 <etext+0x210>
    80002ec4:	00003097          	auipc	ra,0x3
    80002ec8:	18e080e7          	jalr	398(ra) # 80006052 <namei>
    80002ecc:	872a                	mv	a4,a0
    80002ece:	fe843783          	ld	a5,-24(s0)
    80002ed2:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002ed6:	fe843783          	ld	a5,-24(s0)
    80002eda:	470d                	li	a4,3
    80002edc:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002ede:	fe843783          	ld	a5,-24(s0)
    80002ee2:	853e                	mv	a0,a5
    80002ee4:	ffffe097          	auipc	ra,0xffffe
    80002ee8:	4aa080e7          	jalr	1194(ra) # 8000138e <release>
}
    80002eec:	0001                	nop
    80002eee:	60e2                	ld	ra,24(sp)
    80002ef0:	6442                	ld	s0,16(sp)
    80002ef2:	6105                	addi	sp,sp,32
    80002ef4:	8082                	ret

0000000080002ef6 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002ef6:	7179                	addi	sp,sp,-48
    80002ef8:	f406                	sd	ra,40(sp)
    80002efa:	f022                	sd	s0,32(sp)
    80002efc:	1800                	addi	s0,sp,48
    80002efe:	87aa                	mv	a5,a0
    80002f00:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002f04:	00000097          	auipc	ra,0x0
    80002f08:	bc2080e7          	jalr	-1086(ra) # 80002ac6 <myproc>
    80002f0c:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002f10:	fe043783          	ld	a5,-32(s0)
    80002f14:	67bc                	ld	a5,72(a5)
    80002f16:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002f1a:	fdc42783          	lw	a5,-36(s0)
    80002f1e:	2781                	sext.w	a5,a5
    80002f20:	02f05963          	blez	a5,80002f52 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002f24:	fe043783          	ld	a5,-32(s0)
    80002f28:	6ba8                	ld	a0,80(a5)
    80002f2a:	fdc42703          	lw	a4,-36(s0)
    80002f2e:	fe843783          	ld	a5,-24(s0)
    80002f32:	97ba                	add	a5,a5,a4
    80002f34:	4691                	li	a3,4
    80002f36:	863e                	mv	a2,a5
    80002f38:	fe843583          	ld	a1,-24(s0)
    80002f3c:	fffff097          	auipc	ra,0xfffff
    80002f40:	25c080e7          	jalr	604(ra) # 80002198 <uvmalloc>
    80002f44:	fea43423          	sd	a0,-24(s0)
    80002f48:	fe843783          	ld	a5,-24(s0)
    80002f4c:	eb95                	bnez	a5,80002f80 <growproc+0x8a>
      return -1;
    80002f4e:	57fd                	li	a5,-1
    80002f50:	a835                	j	80002f8c <growproc+0x96>
    }
  } else if(n < 0){
    80002f52:	fdc42783          	lw	a5,-36(s0)
    80002f56:	2781                	sext.w	a5,a5
    80002f58:	0207d463          	bgez	a5,80002f80 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002f5c:	fe043783          	ld	a5,-32(s0)
    80002f60:	6bb4                	ld	a3,80(a5)
    80002f62:	fdc42703          	lw	a4,-36(s0)
    80002f66:	fe843783          	ld	a5,-24(s0)
    80002f6a:	97ba                	add	a5,a5,a4
    80002f6c:	863e                	mv	a2,a5
    80002f6e:	fe843583          	ld	a1,-24(s0)
    80002f72:	8536                	mv	a0,a3
    80002f74:	fffff097          	auipc	ra,0xfffff
    80002f78:	316080e7          	jalr	790(ra) # 8000228a <uvmdealloc>
    80002f7c:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002f80:	fe043783          	ld	a5,-32(s0)
    80002f84:	fe843703          	ld	a4,-24(s0)
    80002f88:	e7b8                	sd	a4,72(a5)
  return 0;
    80002f8a:	4781                	li	a5,0
}
    80002f8c:	853e                	mv	a0,a5
    80002f8e:	70a2                	ld	ra,40(sp)
    80002f90:	7402                	ld	s0,32(sp)
    80002f92:	6145                	addi	sp,sp,48
    80002f94:	8082                	ret

0000000080002f96 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002f96:	7179                	addi	sp,sp,-48
    80002f98:	f406                	sd	ra,40(sp)
    80002f9a:	f022                	sd	s0,32(sp)
    80002f9c:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002f9e:	00000097          	auipc	ra,0x0
    80002fa2:	b28080e7          	jalr	-1240(ra) # 80002ac6 <myproc>
    80002fa6:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002faa:	00000097          	auipc	ra,0x0
    80002fae:	bb6080e7          	jalr	-1098(ra) # 80002b60 <allocproc>
    80002fb2:	fca43c23          	sd	a0,-40(s0)
    80002fb6:	fd843783          	ld	a5,-40(s0)
    80002fba:	e399                	bnez	a5,80002fc0 <fork+0x2a>
    return -1;
    80002fbc:	57fd                	li	a5,-1
    80002fbe:	aab5                	j	8000313a <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002fc0:	fe043783          	ld	a5,-32(s0)
    80002fc4:	6bb8                	ld	a4,80(a5)
    80002fc6:	fd843783          	ld	a5,-40(s0)
    80002fca:	6bb4                	ld	a3,80(a5)
    80002fcc:	fe043783          	ld	a5,-32(s0)
    80002fd0:	67bc                	ld	a5,72(a5)
    80002fd2:	863e                	mv	a2,a5
    80002fd4:	85b6                	mv	a1,a3
    80002fd6:	853a                	mv	a0,a4
    80002fd8:	fffff097          	auipc	ra,0xfffff
    80002fdc:	442080e7          	jalr	1090(ra) # 8000241a <uvmcopy>
    80002fe0:	87aa                	mv	a5,a0
    80002fe2:	0207d163          	bgez	a5,80003004 <fork+0x6e>
    freeproc(np);
    80002fe6:	fd843503          	ld	a0,-40(s0)
    80002fea:	00000097          	auipc	ra,0x0
    80002fee:	ca0080e7          	jalr	-864(ra) # 80002c8a <freeproc>
    release(&np->lock);
    80002ff2:	fd843783          	ld	a5,-40(s0)
    80002ff6:	853e                	mv	a0,a5
    80002ff8:	ffffe097          	auipc	ra,0xffffe
    80002ffc:	396080e7          	jalr	918(ra) # 8000138e <release>
    return -1;
    80003000:	57fd                	li	a5,-1
    80003002:	aa25                	j	8000313a <fork+0x1a4>
  }
  np->sz = p->sz;
    80003004:	fe043783          	ld	a5,-32(s0)
    80003008:	67b8                	ld	a4,72(a5)
    8000300a:	fd843783          	ld	a5,-40(s0)
    8000300e:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80003010:	fe043783          	ld	a5,-32(s0)
    80003014:	6fb8                	ld	a4,88(a5)
    80003016:	fd843783          	ld	a5,-40(s0)
    8000301a:	6fbc                	ld	a5,88(a5)
    8000301c:	86be                	mv	a3,a5
    8000301e:	12000793          	li	a5,288
    80003022:	863e                	mv	a2,a5
    80003024:	85ba                	mv	a1,a4
    80003026:	8536                	mv	a0,a3
    80003028:	ffffe097          	auipc	ra,0xffffe
    8000302c:	696080e7          	jalr	1686(ra) # 800016be <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80003030:	fd843783          	ld	a5,-40(s0)
    80003034:	6fbc                	ld	a5,88(a5)
    80003036:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    8000303a:	fe042623          	sw	zero,-20(s0)
    8000303e:	a0a9                	j	80003088 <fork+0xf2>
    if(p->ofile[i])
    80003040:	fe043703          	ld	a4,-32(s0)
    80003044:	fec42783          	lw	a5,-20(s0)
    80003048:	07e9                	addi	a5,a5,26
    8000304a:	078e                	slli	a5,a5,0x3
    8000304c:	97ba                	add	a5,a5,a4
    8000304e:	639c                	ld	a5,0(a5)
    80003050:	c79d                	beqz	a5,8000307e <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80003052:	fe043703          	ld	a4,-32(s0)
    80003056:	fec42783          	lw	a5,-20(s0)
    8000305a:	07e9                	addi	a5,a5,26
    8000305c:	078e                	slli	a5,a5,0x3
    8000305e:	97ba                	add	a5,a5,a4
    80003060:	639c                	ld	a5,0(a5)
    80003062:	853e                	mv	a0,a5
    80003064:	00004097          	auipc	ra,0x4
    80003068:	986080e7          	jalr	-1658(ra) # 800069ea <filedup>
    8000306c:	86aa                	mv	a3,a0
    8000306e:	fd843703          	ld	a4,-40(s0)
    80003072:	fec42783          	lw	a5,-20(s0)
    80003076:	07e9                	addi	a5,a5,26
    80003078:	078e                	slli	a5,a5,0x3
    8000307a:	97ba                	add	a5,a5,a4
    8000307c:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    8000307e:	fec42783          	lw	a5,-20(s0)
    80003082:	2785                	addiw	a5,a5,1
    80003084:	fef42623          	sw	a5,-20(s0)
    80003088:	fec42783          	lw	a5,-20(s0)
    8000308c:	0007871b          	sext.w	a4,a5
    80003090:	47bd                	li	a5,15
    80003092:	fae7d7e3          	bge	a5,a4,80003040 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80003096:	fe043783          	ld	a5,-32(s0)
    8000309a:	1507b783          	ld	a5,336(a5)
    8000309e:	853e                	mv	a0,a5
    800030a0:	00002097          	auipc	ra,0x2
    800030a4:	240080e7          	jalr	576(ra) # 800052e0 <idup>
    800030a8:	872a                	mv	a4,a0
    800030aa:	fd843783          	ld	a5,-40(s0)
    800030ae:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    800030b2:	fd843783          	ld	a5,-40(s0)
    800030b6:	15878713          	addi	a4,a5,344
    800030ba:	fe043783          	ld	a5,-32(s0)
    800030be:	15878793          	addi	a5,a5,344
    800030c2:	4641                	li	a2,16
    800030c4:	85be                	mv	a1,a5
    800030c6:	853a                	mv	a0,a4
    800030c8:	ffffe097          	auipc	ra,0xffffe
    800030cc:	73a080e7          	jalr	1850(ra) # 80001802 <safestrcpy>

  pid = np->pid;
    800030d0:	fd843783          	ld	a5,-40(s0)
    800030d4:	5b9c                	lw	a5,48(a5)
    800030d6:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    800030da:	fd843783          	ld	a5,-40(s0)
    800030de:	853e                	mv	a0,a5
    800030e0:	ffffe097          	auipc	ra,0xffffe
    800030e4:	2ae080e7          	jalr	686(ra) # 8000138e <release>

  acquire(&wait_lock);
    800030e8:	00027517          	auipc	a0,0x27
    800030ec:	8e850513          	addi	a0,a0,-1816 # 800299d0 <wait_lock>
    800030f0:	ffffe097          	auipc	ra,0xffffe
    800030f4:	23a080e7          	jalr	570(ra) # 8000132a <acquire>
  np->parent = p;
    800030f8:	fd843783          	ld	a5,-40(s0)
    800030fc:	fe043703          	ld	a4,-32(s0)
    80003100:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80003102:	00027517          	auipc	a0,0x27
    80003106:	8ce50513          	addi	a0,a0,-1842 # 800299d0 <wait_lock>
    8000310a:	ffffe097          	auipc	ra,0xffffe
    8000310e:	284080e7          	jalr	644(ra) # 8000138e <release>

  acquire(&np->lock);
    80003112:	fd843783          	ld	a5,-40(s0)
    80003116:	853e                	mv	a0,a5
    80003118:	ffffe097          	auipc	ra,0xffffe
    8000311c:	212080e7          	jalr	530(ra) # 8000132a <acquire>
  np->state = RUNNABLE;
    80003120:	fd843783          	ld	a5,-40(s0)
    80003124:	470d                	li	a4,3
    80003126:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    80003128:	fd843783          	ld	a5,-40(s0)
    8000312c:	853e                	mv	a0,a5
    8000312e:	ffffe097          	auipc	ra,0xffffe
    80003132:	260080e7          	jalr	608(ra) # 8000138e <release>

  return pid;
    80003136:	fd442783          	lw	a5,-44(s0)
}
    8000313a:	853e                	mv	a0,a5
    8000313c:	70a2                	ld	ra,40(sp)
    8000313e:	7402                	ld	s0,32(sp)
    80003140:	6145                	addi	sp,sp,48
    80003142:	8082                	ret

0000000080003144 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80003144:	7179                	addi	sp,sp,-48
    80003146:	f406                	sd	ra,40(sp)
    80003148:	f022                	sd	s0,32(sp)
    8000314a:	1800                	addi	s0,sp,48
    8000314c:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003150:	00021797          	auipc	a5,0x21
    80003154:	e6878793          	addi	a5,a5,-408 # 80023fb8 <proc>
    80003158:	fef43423          	sd	a5,-24(s0)
    8000315c:	a081                	j	8000319c <reparent+0x58>
    if(pp->parent == p){
    8000315e:	fe843783          	ld	a5,-24(s0)
    80003162:	7f9c                	ld	a5,56(a5)
    80003164:	fd843703          	ld	a4,-40(s0)
    80003168:	02f71463          	bne	a4,a5,80003190 <reparent+0x4c>
      pp->parent = initproc;
    8000316c:	00008797          	auipc	a5,0x8
    80003170:	7d478793          	addi	a5,a5,2004 # 8000b940 <initproc>
    80003174:	6398                	ld	a4,0(a5)
    80003176:	fe843783          	ld	a5,-24(s0)
    8000317a:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    8000317c:	00008797          	auipc	a5,0x8
    80003180:	7c478793          	addi	a5,a5,1988 # 8000b940 <initproc>
    80003184:	639c                	ld	a5,0(a5)
    80003186:	853e                	mv	a0,a5
    80003188:	00000097          	auipc	ra,0x0
    8000318c:	57c080e7          	jalr	1404(ra) # 80003704 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003190:	fe843783          	ld	a5,-24(s0)
    80003194:	16878793          	addi	a5,a5,360
    80003198:	fef43423          	sd	a5,-24(s0)
    8000319c:	fe843703          	ld	a4,-24(s0)
    800031a0:	00027797          	auipc	a5,0x27
    800031a4:	81878793          	addi	a5,a5,-2024 # 800299b8 <pid_lock>
    800031a8:	faf76be3          	bltu	a4,a5,8000315e <reparent+0x1a>
    }
  }
}
    800031ac:	0001                	nop
    800031ae:	0001                	nop
    800031b0:	70a2                	ld	ra,40(sp)
    800031b2:	7402                	ld	s0,32(sp)
    800031b4:	6145                	addi	sp,sp,48
    800031b6:	8082                	ret

00000000800031b8 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    800031b8:	7139                	addi	sp,sp,-64
    800031ba:	fc06                	sd	ra,56(sp)
    800031bc:	f822                	sd	s0,48(sp)
    800031be:	0080                	addi	s0,sp,64
    800031c0:	87aa                	mv	a5,a0
    800031c2:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    800031c6:	00000097          	auipc	ra,0x0
    800031ca:	900080e7          	jalr	-1792(ra) # 80002ac6 <myproc>
    800031ce:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    800031d2:	00008797          	auipc	a5,0x8
    800031d6:	76e78793          	addi	a5,a5,1902 # 8000b940 <initproc>
    800031da:	639c                	ld	a5,0(a5)
    800031dc:	fe043703          	ld	a4,-32(s0)
    800031e0:	00f71a63          	bne	a4,a5,800031f4 <exit+0x3c>
    panic("init exiting");
    800031e4:	00008517          	auipc	a0,0x8
    800031e8:	03450513          	addi	a0,a0,52 # 8000b218 <etext+0x218>
    800031ec:	ffffe097          	auipc	ra,0xffffe
    800031f0:	aa0080e7          	jalr	-1376(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    800031f4:	fe042623          	sw	zero,-20(s0)
    800031f8:	a881                	j	80003248 <exit+0x90>
    if(p->ofile[fd]){
    800031fa:	fe043703          	ld	a4,-32(s0)
    800031fe:	fec42783          	lw	a5,-20(s0)
    80003202:	07e9                	addi	a5,a5,26
    80003204:	078e                	slli	a5,a5,0x3
    80003206:	97ba                	add	a5,a5,a4
    80003208:	639c                	ld	a5,0(a5)
    8000320a:	cb95                	beqz	a5,8000323e <exit+0x86>
      struct file *f = p->ofile[fd];
    8000320c:	fe043703          	ld	a4,-32(s0)
    80003210:	fec42783          	lw	a5,-20(s0)
    80003214:	07e9                	addi	a5,a5,26
    80003216:	078e                	slli	a5,a5,0x3
    80003218:	97ba                	add	a5,a5,a4
    8000321a:	639c                	ld	a5,0(a5)
    8000321c:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80003220:	fd843503          	ld	a0,-40(s0)
    80003224:	00004097          	auipc	ra,0x4
    80003228:	82c080e7          	jalr	-2004(ra) # 80006a50 <fileclose>
      p->ofile[fd] = 0;
    8000322c:	fe043703          	ld	a4,-32(s0)
    80003230:	fec42783          	lw	a5,-20(s0)
    80003234:	07e9                	addi	a5,a5,26
    80003236:	078e                	slli	a5,a5,0x3
    80003238:	97ba                	add	a5,a5,a4
    8000323a:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    8000323e:	fec42783          	lw	a5,-20(s0)
    80003242:	2785                	addiw	a5,a5,1
    80003244:	fef42623          	sw	a5,-20(s0)
    80003248:	fec42783          	lw	a5,-20(s0)
    8000324c:	0007871b          	sext.w	a4,a5
    80003250:	47bd                	li	a5,15
    80003252:	fae7d4e3          	bge	a5,a4,800031fa <exit+0x42>
    }
  }

  begin_op();
    80003256:	00003097          	auipc	ra,0x3
    8000325a:	160080e7          	jalr	352(ra) # 800063b6 <begin_op>
  iput(p->cwd);
    8000325e:	fe043783          	ld	a5,-32(s0)
    80003262:	1507b783          	ld	a5,336(a5)
    80003266:	853e                	mv	a0,a5
    80003268:	00002097          	auipc	ra,0x2
    8000326c:	252080e7          	jalr	594(ra) # 800054ba <iput>
  end_op();
    80003270:	00003097          	auipc	ra,0x3
    80003274:	208080e7          	jalr	520(ra) # 80006478 <end_op>
  p->cwd = 0;
    80003278:	fe043783          	ld	a5,-32(s0)
    8000327c:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80003280:	00026517          	auipc	a0,0x26
    80003284:	75050513          	addi	a0,a0,1872 # 800299d0 <wait_lock>
    80003288:	ffffe097          	auipc	ra,0xffffe
    8000328c:	0a2080e7          	jalr	162(ra) # 8000132a <acquire>

  // Give any children to init.
  reparent(p);
    80003290:	fe043503          	ld	a0,-32(s0)
    80003294:	00000097          	auipc	ra,0x0
    80003298:	eb0080e7          	jalr	-336(ra) # 80003144 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    8000329c:	fe043783          	ld	a5,-32(s0)
    800032a0:	7f9c                	ld	a5,56(a5)
    800032a2:	853e                	mv	a0,a5
    800032a4:	00000097          	auipc	ra,0x0
    800032a8:	460080e7          	jalr	1120(ra) # 80003704 <wakeup>
  
  acquire(&p->lock);
    800032ac:	fe043783          	ld	a5,-32(s0)
    800032b0:	853e                	mv	a0,a5
    800032b2:	ffffe097          	auipc	ra,0xffffe
    800032b6:	078080e7          	jalr	120(ra) # 8000132a <acquire>

  p->xstate = status;
    800032ba:	fe043783          	ld	a5,-32(s0)
    800032be:	fcc42703          	lw	a4,-52(s0)
    800032c2:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    800032c4:	fe043783          	ld	a5,-32(s0)
    800032c8:	4715                	li	a4,5
    800032ca:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    800032cc:	00026517          	auipc	a0,0x26
    800032d0:	70450513          	addi	a0,a0,1796 # 800299d0 <wait_lock>
    800032d4:	ffffe097          	auipc	ra,0xffffe
    800032d8:	0ba080e7          	jalr	186(ra) # 8000138e <release>

  // Jump into the scheduler, never to return.
  sched();
    800032dc:	00000097          	auipc	ra,0x0
    800032e0:	230080e7          	jalr	560(ra) # 8000350c <sched>
  panic("zombie exit");
    800032e4:	00008517          	auipc	a0,0x8
    800032e8:	f4450513          	addi	a0,a0,-188 # 8000b228 <etext+0x228>
    800032ec:	ffffe097          	auipc	ra,0xffffe
    800032f0:	9a0080e7          	jalr	-1632(ra) # 80000c8c <panic>

00000000800032f4 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800032f4:	7139                	addi	sp,sp,-64
    800032f6:	fc06                	sd	ra,56(sp)
    800032f8:	f822                	sd	s0,48(sp)
    800032fa:	0080                	addi	s0,sp,64
    800032fc:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    80003300:	fffff097          	auipc	ra,0xfffff
    80003304:	7c6080e7          	jalr	1990(ra) # 80002ac6 <myproc>
    80003308:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    8000330c:	00026517          	auipc	a0,0x26
    80003310:	6c450513          	addi	a0,a0,1732 # 800299d0 <wait_lock>
    80003314:	ffffe097          	auipc	ra,0xffffe
    80003318:	016080e7          	jalr	22(ra) # 8000132a <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    8000331c:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003320:	00021797          	auipc	a5,0x21
    80003324:	c9878793          	addi	a5,a5,-872 # 80023fb8 <proc>
    80003328:	fef43423          	sd	a5,-24(s0)
    8000332c:	a8d1                	j	80003400 <wait+0x10c>
      if(pp->parent == p){
    8000332e:	fe843783          	ld	a5,-24(s0)
    80003332:	7f9c                	ld	a5,56(a5)
    80003334:	fd843703          	ld	a4,-40(s0)
    80003338:	0af71e63          	bne	a4,a5,800033f4 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    8000333c:	fe843783          	ld	a5,-24(s0)
    80003340:	853e                	mv	a0,a5
    80003342:	ffffe097          	auipc	ra,0xffffe
    80003346:	fe8080e7          	jalr	-24(ra) # 8000132a <acquire>

        havekids = 1;
    8000334a:	4785                	li	a5,1
    8000334c:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    80003350:	fe843783          	ld	a5,-24(s0)
    80003354:	4f9c                	lw	a5,24(a5)
    80003356:	873e                	mv	a4,a5
    80003358:	4795                	li	a5,5
    8000335a:	08f71663          	bne	a4,a5,800033e6 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    8000335e:	fe843783          	ld	a5,-24(s0)
    80003362:	5b9c                	lw	a5,48(a5)
    80003364:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    80003368:	fc843783          	ld	a5,-56(s0)
    8000336c:	c7a9                	beqz	a5,800033b6 <wait+0xc2>
    8000336e:	fd843783          	ld	a5,-40(s0)
    80003372:	6bb8                	ld	a4,80(a5)
    80003374:	fe843783          	ld	a5,-24(s0)
    80003378:	02c78793          	addi	a5,a5,44
    8000337c:	4691                	li	a3,4
    8000337e:	863e                	mv	a2,a5
    80003380:	fc843583          	ld	a1,-56(s0)
    80003384:	853a                	mv	a0,a4
    80003386:	fffff097          	auipc	ra,0xfffff
    8000338a:	20a080e7          	jalr	522(ra) # 80002590 <copyout>
    8000338e:	87aa                	mv	a5,a0
    80003390:	0207d363          	bgez	a5,800033b6 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    80003394:	fe843783          	ld	a5,-24(s0)
    80003398:	853e                	mv	a0,a5
    8000339a:	ffffe097          	auipc	ra,0xffffe
    8000339e:	ff4080e7          	jalr	-12(ra) # 8000138e <release>
            release(&wait_lock);
    800033a2:	00026517          	auipc	a0,0x26
    800033a6:	62e50513          	addi	a0,a0,1582 # 800299d0 <wait_lock>
    800033aa:	ffffe097          	auipc	ra,0xffffe
    800033ae:	fe4080e7          	jalr	-28(ra) # 8000138e <release>
            return -1;
    800033b2:	57fd                	li	a5,-1
    800033b4:	a879                	j	80003452 <wait+0x15e>
          }
          freeproc(pp);
    800033b6:	fe843503          	ld	a0,-24(s0)
    800033ba:	00000097          	auipc	ra,0x0
    800033be:	8d0080e7          	jalr	-1840(ra) # 80002c8a <freeproc>
          release(&pp->lock);
    800033c2:	fe843783          	ld	a5,-24(s0)
    800033c6:	853e                	mv	a0,a5
    800033c8:	ffffe097          	auipc	ra,0xffffe
    800033cc:	fc6080e7          	jalr	-58(ra) # 8000138e <release>
          release(&wait_lock);
    800033d0:	00026517          	auipc	a0,0x26
    800033d4:	60050513          	addi	a0,a0,1536 # 800299d0 <wait_lock>
    800033d8:	ffffe097          	auipc	ra,0xffffe
    800033dc:	fb6080e7          	jalr	-74(ra) # 8000138e <release>
          return pid;
    800033e0:	fd442783          	lw	a5,-44(s0)
    800033e4:	a0bd                	j	80003452 <wait+0x15e>
        }
        release(&pp->lock);
    800033e6:	fe843783          	ld	a5,-24(s0)
    800033ea:	853e                	mv	a0,a5
    800033ec:	ffffe097          	auipc	ra,0xffffe
    800033f0:	fa2080e7          	jalr	-94(ra) # 8000138e <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800033f4:	fe843783          	ld	a5,-24(s0)
    800033f8:	16878793          	addi	a5,a5,360
    800033fc:	fef43423          	sd	a5,-24(s0)
    80003400:	fe843703          	ld	a4,-24(s0)
    80003404:	00026797          	auipc	a5,0x26
    80003408:	5b478793          	addi	a5,a5,1460 # 800299b8 <pid_lock>
    8000340c:	f2f761e3          	bltu	a4,a5,8000332e <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    80003410:	fe442783          	lw	a5,-28(s0)
    80003414:	2781                	sext.w	a5,a5
    80003416:	cb89                	beqz	a5,80003428 <wait+0x134>
    80003418:	fd843503          	ld	a0,-40(s0)
    8000341c:	00000097          	auipc	ra,0x0
    80003420:	47a080e7          	jalr	1146(ra) # 80003896 <killed>
    80003424:	87aa                	mv	a5,a0
    80003426:	cb99                	beqz	a5,8000343c <wait+0x148>
      release(&wait_lock);
    80003428:	00026517          	auipc	a0,0x26
    8000342c:	5a850513          	addi	a0,a0,1448 # 800299d0 <wait_lock>
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	f5e080e7          	jalr	-162(ra) # 8000138e <release>
      return -1;
    80003438:	57fd                	li	a5,-1
    8000343a:	a821                	j	80003452 <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    8000343c:	00026597          	auipc	a1,0x26
    80003440:	59458593          	addi	a1,a1,1428 # 800299d0 <wait_lock>
    80003444:	fd843503          	ld	a0,-40(s0)
    80003448:	00000097          	auipc	ra,0x0
    8000344c:	240080e7          	jalr	576(ra) # 80003688 <sleep>
    havekids = 0;
    80003450:	b5f1                	j	8000331c <wait+0x28>
  }
}
    80003452:	853e                	mv	a0,a5
    80003454:	70e2                	ld	ra,56(sp)
    80003456:	7442                	ld	s0,48(sp)
    80003458:	6121                	addi	sp,sp,64
    8000345a:	8082                	ret

000000008000345c <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    8000345c:	1101                	addi	sp,sp,-32
    8000345e:	ec06                	sd	ra,24(sp)
    80003460:	e822                	sd	s0,16(sp)
    80003462:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003464:	fffff097          	auipc	ra,0xfffff
    80003468:	628080e7          	jalr	1576(ra) # 80002a8c <mycpu>
    8000346c:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    80003470:	fe043783          	ld	a5,-32(s0)
    80003474:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    80003478:	fffff097          	auipc	ra,0xfffff
    8000347c:	3f6080e7          	jalr	1014(ra) # 8000286e <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    80003480:	00021797          	auipc	a5,0x21
    80003484:	b3878793          	addi	a5,a5,-1224 # 80023fb8 <proc>
    80003488:	fef43423          	sd	a5,-24(s0)
    8000348c:	a0bd                	j	800034fa <scheduler+0x9e>
      acquire(&p->lock);
    8000348e:	fe843783          	ld	a5,-24(s0)
    80003492:	853e                	mv	a0,a5
    80003494:	ffffe097          	auipc	ra,0xffffe
    80003498:	e96080e7          	jalr	-362(ra) # 8000132a <acquire>
      if(p->state == RUNNABLE) {
    8000349c:	fe843783          	ld	a5,-24(s0)
    800034a0:	4f9c                	lw	a5,24(a5)
    800034a2:	873e                	mv	a4,a5
    800034a4:	478d                	li	a5,3
    800034a6:	02f71d63          	bne	a4,a5,800034e0 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    800034aa:	fe843783          	ld	a5,-24(s0)
    800034ae:	4711                	li	a4,4
    800034b0:	cf98                	sw	a4,24(a5)
        c->proc = p;
    800034b2:	fe043783          	ld	a5,-32(s0)
    800034b6:	fe843703          	ld	a4,-24(s0)
    800034ba:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    800034bc:	fe043783          	ld	a5,-32(s0)
    800034c0:	00878713          	addi	a4,a5,8
    800034c4:	fe843783          	ld	a5,-24(s0)
    800034c8:	06078793          	addi	a5,a5,96
    800034cc:	85be                	mv	a1,a5
    800034ce:	853a                	mv	a0,a4
    800034d0:	00000097          	auipc	ra,0x0
    800034d4:	5d0080e7          	jalr	1488(ra) # 80003aa0 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800034d8:	fe043783          	ld	a5,-32(s0)
    800034dc:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    800034e0:	fe843783          	ld	a5,-24(s0)
    800034e4:	853e                	mv	a0,a5
    800034e6:	ffffe097          	auipc	ra,0xffffe
    800034ea:	ea8080e7          	jalr	-344(ra) # 8000138e <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    800034ee:	fe843783          	ld	a5,-24(s0)
    800034f2:	16878793          	addi	a5,a5,360
    800034f6:	fef43423          	sd	a5,-24(s0)
    800034fa:	fe843703          	ld	a4,-24(s0)
    800034fe:	00026797          	auipc	a5,0x26
    80003502:	4ba78793          	addi	a5,a5,1210 # 800299b8 <pid_lock>
    80003506:	f8f764e3          	bltu	a4,a5,8000348e <scheduler+0x32>
    intr_on();
    8000350a:	b7bd                	j	80003478 <scheduler+0x1c>

000000008000350c <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    8000350c:	7179                	addi	sp,sp,-48
    8000350e:	f406                	sd	ra,40(sp)
    80003510:	f022                	sd	s0,32(sp)
    80003512:	ec26                	sd	s1,24(sp)
    80003514:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    80003516:	fffff097          	auipc	ra,0xfffff
    8000351a:	5b0080e7          	jalr	1456(ra) # 80002ac6 <myproc>
    8000351e:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    80003522:	fd843783          	ld	a5,-40(s0)
    80003526:	853e                	mv	a0,a5
    80003528:	ffffe097          	auipc	ra,0xffffe
    8000352c:	ebc080e7          	jalr	-324(ra) # 800013e4 <holding>
    80003530:	87aa                	mv	a5,a0
    80003532:	eb89                	bnez	a5,80003544 <sched+0x38>
    panic("sched p->lock");
    80003534:	00008517          	auipc	a0,0x8
    80003538:	d0450513          	addi	a0,a0,-764 # 8000b238 <etext+0x238>
    8000353c:	ffffd097          	auipc	ra,0xffffd
    80003540:	750080e7          	jalr	1872(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    80003544:	fffff097          	auipc	ra,0xfffff
    80003548:	548080e7          	jalr	1352(ra) # 80002a8c <mycpu>
    8000354c:	87aa                	mv	a5,a0
    8000354e:	5fbc                	lw	a5,120(a5)
    80003550:	873e                	mv	a4,a5
    80003552:	4785                	li	a5,1
    80003554:	00f70a63          	beq	a4,a5,80003568 <sched+0x5c>
    panic("sched locks");
    80003558:	00008517          	auipc	a0,0x8
    8000355c:	cf050513          	addi	a0,a0,-784 # 8000b248 <etext+0x248>
    80003560:	ffffd097          	auipc	ra,0xffffd
    80003564:	72c080e7          	jalr	1836(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    80003568:	fd843783          	ld	a5,-40(s0)
    8000356c:	4f9c                	lw	a5,24(a5)
    8000356e:	873e                	mv	a4,a5
    80003570:	4791                	li	a5,4
    80003572:	00f71a63          	bne	a4,a5,80003586 <sched+0x7a>
    panic("sched running");
    80003576:	00008517          	auipc	a0,0x8
    8000357a:	ce250513          	addi	a0,a0,-798 # 8000b258 <etext+0x258>
    8000357e:	ffffd097          	auipc	ra,0xffffd
    80003582:	70e080e7          	jalr	1806(ra) # 80000c8c <panic>
  if(intr_get())
    80003586:	fffff097          	auipc	ra,0xfffff
    8000358a:	312080e7          	jalr	786(ra) # 80002898 <intr_get>
    8000358e:	87aa                	mv	a5,a0
    80003590:	cb89                	beqz	a5,800035a2 <sched+0x96>
    panic("sched interruptible");
    80003592:	00008517          	auipc	a0,0x8
    80003596:	cd650513          	addi	a0,a0,-810 # 8000b268 <etext+0x268>
    8000359a:	ffffd097          	auipc	ra,0xffffd
    8000359e:	6f2080e7          	jalr	1778(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    800035a2:	fffff097          	auipc	ra,0xfffff
    800035a6:	4ea080e7          	jalr	1258(ra) # 80002a8c <mycpu>
    800035aa:	87aa                	mv	a5,a0
    800035ac:	5ffc                	lw	a5,124(a5)
    800035ae:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800035b2:	fd843783          	ld	a5,-40(s0)
    800035b6:	06078493          	addi	s1,a5,96
    800035ba:	fffff097          	auipc	ra,0xfffff
    800035be:	4d2080e7          	jalr	1234(ra) # 80002a8c <mycpu>
    800035c2:	87aa                	mv	a5,a0
    800035c4:	07a1                	addi	a5,a5,8
    800035c6:	85be                	mv	a1,a5
    800035c8:	8526                	mv	a0,s1
    800035ca:	00000097          	auipc	ra,0x0
    800035ce:	4d6080e7          	jalr	1238(ra) # 80003aa0 <swtch>
  mycpu()->intena = intena;
    800035d2:	fffff097          	auipc	ra,0xfffff
    800035d6:	4ba080e7          	jalr	1210(ra) # 80002a8c <mycpu>
    800035da:	872a                	mv	a4,a0
    800035dc:	fd442783          	lw	a5,-44(s0)
    800035e0:	df7c                	sw	a5,124(a4)
}
    800035e2:	0001                	nop
    800035e4:	70a2                	ld	ra,40(sp)
    800035e6:	7402                	ld	s0,32(sp)
    800035e8:	64e2                	ld	s1,24(sp)
    800035ea:	6145                	addi	sp,sp,48
    800035ec:	8082                	ret

00000000800035ee <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800035ee:	1101                	addi	sp,sp,-32
    800035f0:	ec06                	sd	ra,24(sp)
    800035f2:	e822                	sd	s0,16(sp)
    800035f4:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800035f6:	fffff097          	auipc	ra,0xfffff
    800035fa:	4d0080e7          	jalr	1232(ra) # 80002ac6 <myproc>
    800035fe:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003602:	fe843783          	ld	a5,-24(s0)
    80003606:	853e                	mv	a0,a5
    80003608:	ffffe097          	auipc	ra,0xffffe
    8000360c:	d22080e7          	jalr	-734(ra) # 8000132a <acquire>
  p->state = RUNNABLE;
    80003610:	fe843783          	ld	a5,-24(s0)
    80003614:	470d                	li	a4,3
    80003616:	cf98                	sw	a4,24(a5)
  sched();
    80003618:	00000097          	auipc	ra,0x0
    8000361c:	ef4080e7          	jalr	-268(ra) # 8000350c <sched>
  release(&p->lock);
    80003620:	fe843783          	ld	a5,-24(s0)
    80003624:	853e                	mv	a0,a5
    80003626:	ffffe097          	auipc	ra,0xffffe
    8000362a:	d68080e7          	jalr	-664(ra) # 8000138e <release>
}
    8000362e:	0001                	nop
    80003630:	60e2                	ld	ra,24(sp)
    80003632:	6442                	ld	s0,16(sp)
    80003634:	6105                	addi	sp,sp,32
    80003636:	8082                	ret

0000000080003638 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80003638:	1141                	addi	sp,sp,-16
    8000363a:	e406                	sd	ra,8(sp)
    8000363c:	e022                	sd	s0,0(sp)
    8000363e:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003640:	fffff097          	auipc	ra,0xfffff
    80003644:	486080e7          	jalr	1158(ra) # 80002ac6 <myproc>
    80003648:	87aa                	mv	a5,a0
    8000364a:	853e                	mv	a0,a5
    8000364c:	ffffe097          	auipc	ra,0xffffe
    80003650:	d42080e7          	jalr	-702(ra) # 8000138e <release>

  if (first) {
    80003654:	00008797          	auipc	a5,0x8
    80003658:	17078793          	addi	a5,a5,368 # 8000b7c4 <first.1699>
    8000365c:	439c                	lw	a5,0(a5)
    8000365e:	cf81                	beqz	a5,80003676 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003660:	00008797          	auipc	a5,0x8
    80003664:	16478793          	addi	a5,a5,356 # 8000b7c4 <first.1699>
    80003668:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    8000366c:	4505                	li	a0,1
    8000366e:	00001097          	auipc	ra,0x1
    80003672:	548080e7          	jalr	1352(ra) # 80004bb6 <fsinit>
  }

  usertrapret();
    80003676:	00000097          	auipc	ra,0x0
    8000367a:	7dc080e7          	jalr	2012(ra) # 80003e52 <usertrapret>
}
    8000367e:	0001                	nop
    80003680:	60a2                	ld	ra,8(sp)
    80003682:	6402                	ld	s0,0(sp)
    80003684:	0141                	addi	sp,sp,16
    80003686:	8082                	ret

0000000080003688 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003688:	7179                	addi	sp,sp,-48
    8000368a:	f406                	sd	ra,40(sp)
    8000368c:	f022                	sd	s0,32(sp)
    8000368e:	1800                	addi	s0,sp,48
    80003690:	fca43c23          	sd	a0,-40(s0)
    80003694:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003698:	fffff097          	auipc	ra,0xfffff
    8000369c:	42e080e7          	jalr	1070(ra) # 80002ac6 <myproc>
    800036a0:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    800036a4:	fe843783          	ld	a5,-24(s0)
    800036a8:	853e                	mv	a0,a5
    800036aa:	ffffe097          	auipc	ra,0xffffe
    800036ae:	c80080e7          	jalr	-896(ra) # 8000132a <acquire>
  release(lk);
    800036b2:	fd043503          	ld	a0,-48(s0)
    800036b6:	ffffe097          	auipc	ra,0xffffe
    800036ba:	cd8080e7          	jalr	-808(ra) # 8000138e <release>

  // Go to sleep.
  p->chan = chan;
    800036be:	fe843783          	ld	a5,-24(s0)
    800036c2:	fd843703          	ld	a4,-40(s0)
    800036c6:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    800036c8:	fe843783          	ld	a5,-24(s0)
    800036cc:	4709                	li	a4,2
    800036ce:	cf98                	sw	a4,24(a5)

  sched();
    800036d0:	00000097          	auipc	ra,0x0
    800036d4:	e3c080e7          	jalr	-452(ra) # 8000350c <sched>

  // Tidy up.
  p->chan = 0;
    800036d8:	fe843783          	ld	a5,-24(s0)
    800036dc:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800036e0:	fe843783          	ld	a5,-24(s0)
    800036e4:	853e                	mv	a0,a5
    800036e6:	ffffe097          	auipc	ra,0xffffe
    800036ea:	ca8080e7          	jalr	-856(ra) # 8000138e <release>
  acquire(lk);
    800036ee:	fd043503          	ld	a0,-48(s0)
    800036f2:	ffffe097          	auipc	ra,0xffffe
    800036f6:	c38080e7          	jalr	-968(ra) # 8000132a <acquire>
}
    800036fa:	0001                	nop
    800036fc:	70a2                	ld	ra,40(sp)
    800036fe:	7402                	ld	s0,32(sp)
    80003700:	6145                	addi	sp,sp,48
    80003702:	8082                	ret

0000000080003704 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    80003704:	7179                	addi	sp,sp,-48
    80003706:	f406                	sd	ra,40(sp)
    80003708:	f022                	sd	s0,32(sp)
    8000370a:	1800                	addi	s0,sp,48
    8000370c:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80003710:	00021797          	auipc	a5,0x21
    80003714:	8a878793          	addi	a5,a5,-1880 # 80023fb8 <proc>
    80003718:	fef43423          	sd	a5,-24(s0)
    8000371c:	a051                	j	800037a0 <wakeup+0x9c>
    if(p != myproc()){
    8000371e:	fffff097          	auipc	ra,0xfffff
    80003722:	3a8080e7          	jalr	936(ra) # 80002ac6 <myproc>
    80003726:	872a                	mv	a4,a0
    80003728:	fe843783          	ld	a5,-24(s0)
    8000372c:	06e78463          	beq	a5,a4,80003794 <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    80003730:	fe843783          	ld	a5,-24(s0)
    80003734:	853e                	mv	a0,a5
    80003736:	ffffe097          	auipc	ra,0xffffe
    8000373a:	cae080e7          	jalr	-850(ra) # 800013e4 <holding>
    8000373e:	87aa                	mv	a5,a0
    80003740:	cb81                	beqz	a5,80003750 <wakeup+0x4c>
    80003742:	fe843783          	ld	a5,-24(s0)
    80003746:	4f9c                	lw	a5,24(a5)
    80003748:	873e                	mv	a4,a5
    8000374a:	4785                	li	a5,1
    8000374c:	04f70363          	beq	a4,a5,80003792 <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    80003750:	fe843783          	ld	a5,-24(s0)
    80003754:	853e                	mv	a0,a5
    80003756:	ffffe097          	auipc	ra,0xffffe
    8000375a:	bd4080e7          	jalr	-1068(ra) # 8000132a <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    8000375e:	fe843783          	ld	a5,-24(s0)
    80003762:	4f9c                	lw	a5,24(a5)
    80003764:	873e                	mv	a4,a5
    80003766:	4789                	li	a5,2
    80003768:	00f71d63          	bne	a4,a5,80003782 <wakeup+0x7e>
    8000376c:	fe843783          	ld	a5,-24(s0)
    80003770:	739c                	ld	a5,32(a5)
    80003772:	fd843703          	ld	a4,-40(s0)
    80003776:	00f71663          	bne	a4,a5,80003782 <wakeup+0x7e>
        p->state = RUNNABLE;
    8000377a:	fe843783          	ld	a5,-24(s0)
    8000377e:	470d                	li	a4,3
    80003780:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003782:	fe843783          	ld	a5,-24(s0)
    80003786:	853e                	mv	a0,a5
    80003788:	ffffe097          	auipc	ra,0xffffe
    8000378c:	c06080e7          	jalr	-1018(ra) # 8000138e <release>
    80003790:	a011                	j	80003794 <wakeup+0x90>
        continue;
    80003792:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    80003794:	fe843783          	ld	a5,-24(s0)
    80003798:	16878793          	addi	a5,a5,360
    8000379c:	fef43423          	sd	a5,-24(s0)
    800037a0:	fe843703          	ld	a4,-24(s0)
    800037a4:	00026797          	auipc	a5,0x26
    800037a8:	21478793          	addi	a5,a5,532 # 800299b8 <pid_lock>
    800037ac:	f6f769e3          	bltu	a4,a5,8000371e <wakeup+0x1a>
    }
  }
}
    800037b0:	0001                	nop
    800037b2:	0001                	nop
    800037b4:	70a2                	ld	ra,40(sp)
    800037b6:	7402                	ld	s0,32(sp)
    800037b8:	6145                	addi	sp,sp,48
    800037ba:	8082                	ret

00000000800037bc <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    800037bc:	7179                	addi	sp,sp,-48
    800037be:	f406                	sd	ra,40(sp)
    800037c0:	f022                	sd	s0,32(sp)
    800037c2:	1800                	addi	s0,sp,48
    800037c4:	87aa                	mv	a5,a0
    800037c6:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    800037ca:	00020797          	auipc	a5,0x20
    800037ce:	7ee78793          	addi	a5,a5,2030 # 80023fb8 <proc>
    800037d2:	fef43423          	sd	a5,-24(s0)
    800037d6:	a0ad                	j	80003840 <kill+0x84>
    acquire(&p->lock);
    800037d8:	fe843783          	ld	a5,-24(s0)
    800037dc:	853e                	mv	a0,a5
    800037de:	ffffe097          	auipc	ra,0xffffe
    800037e2:	b4c080e7          	jalr	-1204(ra) # 8000132a <acquire>
    if(p->pid == pid){
    800037e6:	fe843783          	ld	a5,-24(s0)
    800037ea:	5b98                	lw	a4,48(a5)
    800037ec:	fdc42783          	lw	a5,-36(s0)
    800037f0:	2781                	sext.w	a5,a5
    800037f2:	02e79a63          	bne	a5,a4,80003826 <kill+0x6a>
      p->killed = 1;
    800037f6:	fe843783          	ld	a5,-24(s0)
    800037fa:	4705                	li	a4,1
    800037fc:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800037fe:	fe843783          	ld	a5,-24(s0)
    80003802:	4f9c                	lw	a5,24(a5)
    80003804:	873e                	mv	a4,a5
    80003806:	4789                	li	a5,2
    80003808:	00f71663          	bne	a4,a5,80003814 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    8000380c:	fe843783          	ld	a5,-24(s0)
    80003810:	470d                	li	a4,3
    80003812:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003814:	fe843783          	ld	a5,-24(s0)
    80003818:	853e                	mv	a0,a5
    8000381a:	ffffe097          	auipc	ra,0xffffe
    8000381e:	b74080e7          	jalr	-1164(ra) # 8000138e <release>
      return 0;
    80003822:	4781                	li	a5,0
    80003824:	a03d                	j	80003852 <kill+0x96>
    }
    release(&p->lock);
    80003826:	fe843783          	ld	a5,-24(s0)
    8000382a:	853e                	mv	a0,a5
    8000382c:	ffffe097          	auipc	ra,0xffffe
    80003830:	b62080e7          	jalr	-1182(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003834:	fe843783          	ld	a5,-24(s0)
    80003838:	16878793          	addi	a5,a5,360
    8000383c:	fef43423          	sd	a5,-24(s0)
    80003840:	fe843703          	ld	a4,-24(s0)
    80003844:	00026797          	auipc	a5,0x26
    80003848:	17478793          	addi	a5,a5,372 # 800299b8 <pid_lock>
    8000384c:	f8f766e3          	bltu	a4,a5,800037d8 <kill+0x1c>
  }
  return -1;
    80003850:	57fd                	li	a5,-1
}
    80003852:	853e                	mv	a0,a5
    80003854:	70a2                	ld	ra,40(sp)
    80003856:	7402                	ld	s0,32(sp)
    80003858:	6145                	addi	sp,sp,48
    8000385a:	8082                	ret

000000008000385c <setkilled>:

void
setkilled(struct proc *p)
{
    8000385c:	1101                	addi	sp,sp,-32
    8000385e:	ec06                	sd	ra,24(sp)
    80003860:	e822                	sd	s0,16(sp)
    80003862:	1000                	addi	s0,sp,32
    80003864:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003868:	fe843783          	ld	a5,-24(s0)
    8000386c:	853e                	mv	a0,a5
    8000386e:	ffffe097          	auipc	ra,0xffffe
    80003872:	abc080e7          	jalr	-1348(ra) # 8000132a <acquire>
  p->killed = 1;
    80003876:	fe843783          	ld	a5,-24(s0)
    8000387a:	4705                	li	a4,1
    8000387c:	d798                	sw	a4,40(a5)
  release(&p->lock);
    8000387e:	fe843783          	ld	a5,-24(s0)
    80003882:	853e                	mv	a0,a5
    80003884:	ffffe097          	auipc	ra,0xffffe
    80003888:	b0a080e7          	jalr	-1270(ra) # 8000138e <release>
}
    8000388c:	0001                	nop
    8000388e:	60e2                	ld	ra,24(sp)
    80003890:	6442                	ld	s0,16(sp)
    80003892:	6105                	addi	sp,sp,32
    80003894:	8082                	ret

0000000080003896 <killed>:

int
killed(struct proc *p)
{
    80003896:	7179                	addi	sp,sp,-48
    80003898:	f406                	sd	ra,40(sp)
    8000389a:	f022                	sd	s0,32(sp)
    8000389c:	1800                	addi	s0,sp,48
    8000389e:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    800038a2:	fd843783          	ld	a5,-40(s0)
    800038a6:	853e                	mv	a0,a5
    800038a8:	ffffe097          	auipc	ra,0xffffe
    800038ac:	a82080e7          	jalr	-1406(ra) # 8000132a <acquire>
  k = p->killed;
    800038b0:	fd843783          	ld	a5,-40(s0)
    800038b4:	579c                	lw	a5,40(a5)
    800038b6:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    800038ba:	fd843783          	ld	a5,-40(s0)
    800038be:	853e                	mv	a0,a5
    800038c0:	ffffe097          	auipc	ra,0xffffe
    800038c4:	ace080e7          	jalr	-1330(ra) # 8000138e <release>
  return k;
    800038c8:	fec42783          	lw	a5,-20(s0)
}
    800038cc:	853e                	mv	a0,a5
    800038ce:	70a2                	ld	ra,40(sp)
    800038d0:	7402                	ld	s0,32(sp)
    800038d2:	6145                	addi	sp,sp,48
    800038d4:	8082                	ret

00000000800038d6 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    800038d6:	7139                	addi	sp,sp,-64
    800038d8:	fc06                	sd	ra,56(sp)
    800038da:	f822                	sd	s0,48(sp)
    800038dc:	0080                	addi	s0,sp,64
    800038de:	87aa                	mv	a5,a0
    800038e0:	fcb43823          	sd	a1,-48(s0)
    800038e4:	fcc43423          	sd	a2,-56(s0)
    800038e8:	fcd43023          	sd	a3,-64(s0)
    800038ec:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800038f0:	fffff097          	auipc	ra,0xfffff
    800038f4:	1d6080e7          	jalr	470(ra) # 80002ac6 <myproc>
    800038f8:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    800038fc:	fdc42783          	lw	a5,-36(s0)
    80003900:	2781                	sext.w	a5,a5
    80003902:	c38d                	beqz	a5,80003924 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80003904:	fe843783          	ld	a5,-24(s0)
    80003908:	6bbc                	ld	a5,80(a5)
    8000390a:	fc043683          	ld	a3,-64(s0)
    8000390e:	fc843603          	ld	a2,-56(s0)
    80003912:	fd043583          	ld	a1,-48(s0)
    80003916:	853e                	mv	a0,a5
    80003918:	fffff097          	auipc	ra,0xfffff
    8000391c:	c78080e7          	jalr	-904(ra) # 80002590 <copyout>
    80003920:	87aa                	mv	a5,a0
    80003922:	a839                	j	80003940 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    80003924:	fd043783          	ld	a5,-48(s0)
    80003928:	fc043703          	ld	a4,-64(s0)
    8000392c:	2701                	sext.w	a4,a4
    8000392e:	863a                	mv	a2,a4
    80003930:	fc843583          	ld	a1,-56(s0)
    80003934:	853e                	mv	a0,a5
    80003936:	ffffe097          	auipc	ra,0xffffe
    8000393a:	cac080e7          	jalr	-852(ra) # 800015e2 <memmove>
    return 0;
    8000393e:	4781                	li	a5,0
  }
}
    80003940:	853e                	mv	a0,a5
    80003942:	70e2                	ld	ra,56(sp)
    80003944:	7442                	ld	s0,48(sp)
    80003946:	6121                	addi	sp,sp,64
    80003948:	8082                	ret

000000008000394a <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    8000394a:	7139                	addi	sp,sp,-64
    8000394c:	fc06                	sd	ra,56(sp)
    8000394e:	f822                	sd	s0,48(sp)
    80003950:	0080                	addi	s0,sp,64
    80003952:	fca43c23          	sd	a0,-40(s0)
    80003956:	87ae                	mv	a5,a1
    80003958:	fcc43423          	sd	a2,-56(s0)
    8000395c:	fcd43023          	sd	a3,-64(s0)
    80003960:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003964:	fffff097          	auipc	ra,0xfffff
    80003968:	162080e7          	jalr	354(ra) # 80002ac6 <myproc>
    8000396c:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003970:	fd442783          	lw	a5,-44(s0)
    80003974:	2781                	sext.w	a5,a5
    80003976:	c38d                	beqz	a5,80003998 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80003978:	fe843783          	ld	a5,-24(s0)
    8000397c:	6bbc                	ld	a5,80(a5)
    8000397e:	fc043683          	ld	a3,-64(s0)
    80003982:	fc843603          	ld	a2,-56(s0)
    80003986:	fd843583          	ld	a1,-40(s0)
    8000398a:	853e                	mv	a0,a5
    8000398c:	fffff097          	auipc	ra,0xfffff
    80003990:	cd2080e7          	jalr	-814(ra) # 8000265e <copyin>
    80003994:	87aa                	mv	a5,a0
    80003996:	a839                	j	800039b4 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003998:	fc843783          	ld	a5,-56(s0)
    8000399c:	fc043703          	ld	a4,-64(s0)
    800039a0:	2701                	sext.w	a4,a4
    800039a2:	863a                	mv	a2,a4
    800039a4:	85be                	mv	a1,a5
    800039a6:	fd843503          	ld	a0,-40(s0)
    800039aa:	ffffe097          	auipc	ra,0xffffe
    800039ae:	c38080e7          	jalr	-968(ra) # 800015e2 <memmove>
    return 0;
    800039b2:	4781                	li	a5,0
  }
}
    800039b4:	853e                	mv	a0,a5
    800039b6:	70e2                	ld	ra,56(sp)
    800039b8:	7442                	ld	s0,48(sp)
    800039ba:	6121                	addi	sp,sp,64
    800039bc:	8082                	ret

00000000800039be <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    800039be:	1101                	addi	sp,sp,-32
    800039c0:	ec06                	sd	ra,24(sp)
    800039c2:	e822                	sd	s0,16(sp)
    800039c4:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    800039c6:	00008517          	auipc	a0,0x8
    800039ca:	8ba50513          	addi	a0,a0,-1862 # 8000b280 <etext+0x280>
    800039ce:	ffffd097          	auipc	ra,0xffffd
    800039d2:	068080e7          	jalr	104(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    800039d6:	00020797          	auipc	a5,0x20
    800039da:	5e278793          	addi	a5,a5,1506 # 80023fb8 <proc>
    800039de:	fef43423          	sd	a5,-24(s0)
    800039e2:	a04d                	j	80003a84 <procdump+0xc6>
    if(p->state == UNUSED)
    800039e4:	fe843783          	ld	a5,-24(s0)
    800039e8:	4f9c                	lw	a5,24(a5)
    800039ea:	c7d1                	beqz	a5,80003a76 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    800039ec:	fe843783          	ld	a5,-24(s0)
    800039f0:	4f9c                	lw	a5,24(a5)
    800039f2:	873e                	mv	a4,a5
    800039f4:	4795                	li	a5,5
    800039f6:	02e7ee63          	bltu	a5,a4,80003a32 <procdump+0x74>
    800039fa:	fe843783          	ld	a5,-24(s0)
    800039fe:	4f9c                	lw	a5,24(a5)
    80003a00:	00008717          	auipc	a4,0x8
    80003a04:	e2070713          	addi	a4,a4,-480 # 8000b820 <states.1744>
    80003a08:	1782                	slli	a5,a5,0x20
    80003a0a:	9381                	srli	a5,a5,0x20
    80003a0c:	078e                	slli	a5,a5,0x3
    80003a0e:	97ba                	add	a5,a5,a4
    80003a10:	639c                	ld	a5,0(a5)
    80003a12:	c385                	beqz	a5,80003a32 <procdump+0x74>
      state = states[p->state];
    80003a14:	fe843783          	ld	a5,-24(s0)
    80003a18:	4f9c                	lw	a5,24(a5)
    80003a1a:	00008717          	auipc	a4,0x8
    80003a1e:	e0670713          	addi	a4,a4,-506 # 8000b820 <states.1744>
    80003a22:	1782                	slli	a5,a5,0x20
    80003a24:	9381                	srli	a5,a5,0x20
    80003a26:	078e                	slli	a5,a5,0x3
    80003a28:	97ba                	add	a5,a5,a4
    80003a2a:	639c                	ld	a5,0(a5)
    80003a2c:	fef43023          	sd	a5,-32(s0)
    80003a30:	a039                	j	80003a3e <procdump+0x80>
    else
      state = "???";
    80003a32:	00008797          	auipc	a5,0x8
    80003a36:	85678793          	addi	a5,a5,-1962 # 8000b288 <etext+0x288>
    80003a3a:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003a3e:	fe843783          	ld	a5,-24(s0)
    80003a42:	5b98                	lw	a4,48(a5)
    80003a44:	fe843783          	ld	a5,-24(s0)
    80003a48:	15878793          	addi	a5,a5,344
    80003a4c:	86be                	mv	a3,a5
    80003a4e:	fe043603          	ld	a2,-32(s0)
    80003a52:	85ba                	mv	a1,a4
    80003a54:	00008517          	auipc	a0,0x8
    80003a58:	83c50513          	addi	a0,a0,-1988 # 8000b290 <etext+0x290>
    80003a5c:	ffffd097          	auipc	ra,0xffffd
    80003a60:	fda080e7          	jalr	-38(ra) # 80000a36 <printf>
    printf("\n");
    80003a64:	00008517          	auipc	a0,0x8
    80003a68:	81c50513          	addi	a0,a0,-2020 # 8000b280 <etext+0x280>
    80003a6c:	ffffd097          	auipc	ra,0xffffd
    80003a70:	fca080e7          	jalr	-54(ra) # 80000a36 <printf>
    80003a74:	a011                	j	80003a78 <procdump+0xba>
      continue;
    80003a76:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003a78:	fe843783          	ld	a5,-24(s0)
    80003a7c:	16878793          	addi	a5,a5,360
    80003a80:	fef43423          	sd	a5,-24(s0)
    80003a84:	fe843703          	ld	a4,-24(s0)
    80003a88:	00026797          	auipc	a5,0x26
    80003a8c:	f3078793          	addi	a5,a5,-208 # 800299b8 <pid_lock>
    80003a90:	f4f76ae3          	bltu	a4,a5,800039e4 <procdump+0x26>
  }
}
    80003a94:	0001                	nop
    80003a96:	0001                	nop
    80003a98:	60e2                	ld	ra,24(sp)
    80003a9a:	6442                	ld	s0,16(sp)
    80003a9c:	6105                	addi	sp,sp,32
    80003a9e:	8082                	ret

0000000080003aa0 <swtch>:
    80003aa0:	00153023          	sd	ra,0(a0)
    80003aa4:	00253423          	sd	sp,8(a0)
    80003aa8:	e900                	sd	s0,16(a0)
    80003aaa:	ed04                	sd	s1,24(a0)
    80003aac:	03253023          	sd	s2,32(a0)
    80003ab0:	03353423          	sd	s3,40(a0)
    80003ab4:	03453823          	sd	s4,48(a0)
    80003ab8:	03553c23          	sd	s5,56(a0)
    80003abc:	05653023          	sd	s6,64(a0)
    80003ac0:	05753423          	sd	s7,72(a0)
    80003ac4:	05853823          	sd	s8,80(a0)
    80003ac8:	05953c23          	sd	s9,88(a0)
    80003acc:	07a53023          	sd	s10,96(a0)
    80003ad0:	07b53423          	sd	s11,104(a0)
    80003ad4:	0005b083          	ld	ra,0(a1)
    80003ad8:	0085b103          	ld	sp,8(a1)
    80003adc:	6980                	ld	s0,16(a1)
    80003ade:	6d84                	ld	s1,24(a1)
    80003ae0:	0205b903          	ld	s2,32(a1)
    80003ae4:	0285b983          	ld	s3,40(a1)
    80003ae8:	0305ba03          	ld	s4,48(a1)
    80003aec:	0385ba83          	ld	s5,56(a1)
    80003af0:	0405bb03          	ld	s6,64(a1)
    80003af4:	0485bb83          	ld	s7,72(a1)
    80003af8:	0505bc03          	ld	s8,80(a1)
    80003afc:	0585bc83          	ld	s9,88(a1)
    80003b00:	0605bd03          	ld	s10,96(a1)
    80003b04:	0685bd83          	ld	s11,104(a1)
    80003b08:	8082                	ret

0000000080003b0a <r_sstatus>:
{
    80003b0a:	1101                	addi	sp,sp,-32
    80003b0c:	ec22                	sd	s0,24(sp)
    80003b0e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003b10:	100027f3          	csrr	a5,sstatus
    80003b14:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b18:	fe843783          	ld	a5,-24(s0)
}
    80003b1c:	853e                	mv	a0,a5
    80003b1e:	6462                	ld	s0,24(sp)
    80003b20:	6105                	addi	sp,sp,32
    80003b22:	8082                	ret

0000000080003b24 <w_sstatus>:
{
    80003b24:	1101                	addi	sp,sp,-32
    80003b26:	ec22                	sd	s0,24(sp)
    80003b28:	1000                	addi	s0,sp,32
    80003b2a:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003b2e:	fe843783          	ld	a5,-24(s0)
    80003b32:	10079073          	csrw	sstatus,a5
}
    80003b36:	0001                	nop
    80003b38:	6462                	ld	s0,24(sp)
    80003b3a:	6105                	addi	sp,sp,32
    80003b3c:	8082                	ret

0000000080003b3e <r_sip>:
{
    80003b3e:	1101                	addi	sp,sp,-32
    80003b40:	ec22                	sd	s0,24(sp)
    80003b42:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003b44:	144027f3          	csrr	a5,sip
    80003b48:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b4c:	fe843783          	ld	a5,-24(s0)
}
    80003b50:	853e                	mv	a0,a5
    80003b52:	6462                	ld	s0,24(sp)
    80003b54:	6105                	addi	sp,sp,32
    80003b56:	8082                	ret

0000000080003b58 <w_sip>:
{
    80003b58:	1101                	addi	sp,sp,-32
    80003b5a:	ec22                	sd	s0,24(sp)
    80003b5c:	1000                	addi	s0,sp,32
    80003b5e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003b62:	fe843783          	ld	a5,-24(s0)
    80003b66:	14479073          	csrw	sip,a5
}
    80003b6a:	0001                	nop
    80003b6c:	6462                	ld	s0,24(sp)
    80003b6e:	6105                	addi	sp,sp,32
    80003b70:	8082                	ret

0000000080003b72 <w_sepc>:
{
    80003b72:	1101                	addi	sp,sp,-32
    80003b74:	ec22                	sd	s0,24(sp)
    80003b76:	1000                	addi	s0,sp,32
    80003b78:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003b7c:	fe843783          	ld	a5,-24(s0)
    80003b80:	14179073          	csrw	sepc,a5
}
    80003b84:	0001                	nop
    80003b86:	6462                	ld	s0,24(sp)
    80003b88:	6105                	addi	sp,sp,32
    80003b8a:	8082                	ret

0000000080003b8c <r_sepc>:
{
    80003b8c:	1101                	addi	sp,sp,-32
    80003b8e:	ec22                	sd	s0,24(sp)
    80003b90:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003b92:	141027f3          	csrr	a5,sepc
    80003b96:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b9a:	fe843783          	ld	a5,-24(s0)
}
    80003b9e:	853e                	mv	a0,a5
    80003ba0:	6462                	ld	s0,24(sp)
    80003ba2:	6105                	addi	sp,sp,32
    80003ba4:	8082                	ret

0000000080003ba6 <w_stvec>:
{
    80003ba6:	1101                	addi	sp,sp,-32
    80003ba8:	ec22                	sd	s0,24(sp)
    80003baa:	1000                	addi	s0,sp,32
    80003bac:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003bb0:	fe843783          	ld	a5,-24(s0)
    80003bb4:	10579073          	csrw	stvec,a5
}
    80003bb8:	0001                	nop
    80003bba:	6462                	ld	s0,24(sp)
    80003bbc:	6105                	addi	sp,sp,32
    80003bbe:	8082                	ret

0000000080003bc0 <r_satp>:
{
    80003bc0:	1101                	addi	sp,sp,-32
    80003bc2:	ec22                	sd	s0,24(sp)
    80003bc4:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003bc6:	180027f3          	csrr	a5,satp
    80003bca:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bce:	fe843783          	ld	a5,-24(s0)
}
    80003bd2:	853e                	mv	a0,a5
    80003bd4:	6462                	ld	s0,24(sp)
    80003bd6:	6105                	addi	sp,sp,32
    80003bd8:	8082                	ret

0000000080003bda <r_scause>:
{
    80003bda:	1101                	addi	sp,sp,-32
    80003bdc:	ec22                	sd	s0,24(sp)
    80003bde:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003be0:	142027f3          	csrr	a5,scause
    80003be4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003be8:	fe843783          	ld	a5,-24(s0)
}
    80003bec:	853e                	mv	a0,a5
    80003bee:	6462                	ld	s0,24(sp)
    80003bf0:	6105                	addi	sp,sp,32
    80003bf2:	8082                	ret

0000000080003bf4 <r_stval>:
{
    80003bf4:	1101                	addi	sp,sp,-32
    80003bf6:	ec22                	sd	s0,24(sp)
    80003bf8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003bfa:	143027f3          	csrr	a5,stval
    80003bfe:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c02:	fe843783          	ld	a5,-24(s0)
}
    80003c06:	853e                	mv	a0,a5
    80003c08:	6462                	ld	s0,24(sp)
    80003c0a:	6105                	addi	sp,sp,32
    80003c0c:	8082                	ret

0000000080003c0e <intr_on>:
{
    80003c0e:	1141                	addi	sp,sp,-16
    80003c10:	e406                	sd	ra,8(sp)
    80003c12:	e022                	sd	s0,0(sp)
    80003c14:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003c16:	00000097          	auipc	ra,0x0
    80003c1a:	ef4080e7          	jalr	-268(ra) # 80003b0a <r_sstatus>
    80003c1e:	87aa                	mv	a5,a0
    80003c20:	0027e793          	ori	a5,a5,2
    80003c24:	853e                	mv	a0,a5
    80003c26:	00000097          	auipc	ra,0x0
    80003c2a:	efe080e7          	jalr	-258(ra) # 80003b24 <w_sstatus>
}
    80003c2e:	0001                	nop
    80003c30:	60a2                	ld	ra,8(sp)
    80003c32:	6402                	ld	s0,0(sp)
    80003c34:	0141                	addi	sp,sp,16
    80003c36:	8082                	ret

0000000080003c38 <intr_off>:
{
    80003c38:	1141                	addi	sp,sp,-16
    80003c3a:	e406                	sd	ra,8(sp)
    80003c3c:	e022                	sd	s0,0(sp)
    80003c3e:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003c40:	00000097          	auipc	ra,0x0
    80003c44:	eca080e7          	jalr	-310(ra) # 80003b0a <r_sstatus>
    80003c48:	87aa                	mv	a5,a0
    80003c4a:	9bf5                	andi	a5,a5,-3
    80003c4c:	853e                	mv	a0,a5
    80003c4e:	00000097          	auipc	ra,0x0
    80003c52:	ed6080e7          	jalr	-298(ra) # 80003b24 <w_sstatus>
}
    80003c56:	0001                	nop
    80003c58:	60a2                	ld	ra,8(sp)
    80003c5a:	6402                	ld	s0,0(sp)
    80003c5c:	0141                	addi	sp,sp,16
    80003c5e:	8082                	ret

0000000080003c60 <intr_get>:
{
    80003c60:	1101                	addi	sp,sp,-32
    80003c62:	ec06                	sd	ra,24(sp)
    80003c64:	e822                	sd	s0,16(sp)
    80003c66:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003c68:	00000097          	auipc	ra,0x0
    80003c6c:	ea2080e7          	jalr	-350(ra) # 80003b0a <r_sstatus>
    80003c70:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003c74:	fe843783          	ld	a5,-24(s0)
    80003c78:	8b89                	andi	a5,a5,2
    80003c7a:	00f037b3          	snez	a5,a5
    80003c7e:	0ff7f793          	andi	a5,a5,255
    80003c82:	2781                	sext.w	a5,a5
}
    80003c84:	853e                	mv	a0,a5
    80003c86:	60e2                	ld	ra,24(sp)
    80003c88:	6442                	ld	s0,16(sp)
    80003c8a:	6105                	addi	sp,sp,32
    80003c8c:	8082                	ret

0000000080003c8e <r_tp>:
{
    80003c8e:	1101                	addi	sp,sp,-32
    80003c90:	ec22                	sd	s0,24(sp)
    80003c92:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003c94:	8792                	mv	a5,tp
    80003c96:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c9a:	fe843783          	ld	a5,-24(s0)
}
    80003c9e:	853e                	mv	a0,a5
    80003ca0:	6462                	ld	s0,24(sp)
    80003ca2:	6105                	addi	sp,sp,32
    80003ca4:	8082                	ret

0000000080003ca6 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003ca6:	1141                	addi	sp,sp,-16
    80003ca8:	e406                	sd	ra,8(sp)
    80003caa:	e022                	sd	s0,0(sp)
    80003cac:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003cae:	00007597          	auipc	a1,0x7
    80003cb2:	62a58593          	addi	a1,a1,1578 # 8000b2d8 <etext+0x2d8>
    80003cb6:	00026517          	auipc	a0,0x26
    80003cba:	d3250513          	addi	a0,a0,-718 # 800299e8 <tickslock>
    80003cbe:	ffffd097          	auipc	ra,0xffffd
    80003cc2:	63c080e7          	jalr	1596(ra) # 800012fa <initlock>
}
    80003cc6:	0001                	nop
    80003cc8:	60a2                	ld	ra,8(sp)
    80003cca:	6402                	ld	s0,0(sp)
    80003ccc:	0141                	addi	sp,sp,16
    80003cce:	8082                	ret

0000000080003cd0 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003cd0:	1141                	addi	sp,sp,-16
    80003cd2:	e406                	sd	ra,8(sp)
    80003cd4:	e022                	sd	s0,0(sp)
    80003cd6:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003cd8:	00005797          	auipc	a5,0x5
    80003cdc:	dc878793          	addi	a5,a5,-568 # 80008aa0 <kernelvec>
    80003ce0:	853e                	mv	a0,a5
    80003ce2:	00000097          	auipc	ra,0x0
    80003ce6:	ec4080e7          	jalr	-316(ra) # 80003ba6 <w_stvec>
}
    80003cea:	0001                	nop
    80003cec:	60a2                	ld	ra,8(sp)
    80003cee:	6402                	ld	s0,0(sp)
    80003cf0:	0141                	addi	sp,sp,16
    80003cf2:	8082                	ret

0000000080003cf4 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003cf4:	7179                	addi	sp,sp,-48
    80003cf6:	f406                	sd	ra,40(sp)
    80003cf8:	f022                	sd	s0,32(sp)
    80003cfa:	ec26                	sd	s1,24(sp)
    80003cfc:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003cfe:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003d02:	00000097          	auipc	ra,0x0
    80003d06:	e08080e7          	jalr	-504(ra) # 80003b0a <r_sstatus>
    80003d0a:	87aa                	mv	a5,a0
    80003d0c:	1007f793          	andi	a5,a5,256
    80003d10:	cb89                	beqz	a5,80003d22 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003d12:	00007517          	auipc	a0,0x7
    80003d16:	5ce50513          	addi	a0,a0,1486 # 8000b2e0 <etext+0x2e0>
    80003d1a:	ffffd097          	auipc	ra,0xffffd
    80003d1e:	f72080e7          	jalr	-142(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003d22:	00005797          	auipc	a5,0x5
    80003d26:	d7e78793          	addi	a5,a5,-642 # 80008aa0 <kernelvec>
    80003d2a:	853e                	mv	a0,a5
    80003d2c:	00000097          	auipc	ra,0x0
    80003d30:	e7a080e7          	jalr	-390(ra) # 80003ba6 <w_stvec>

  struct proc *p = myproc();
    80003d34:	fffff097          	auipc	ra,0xfffff
    80003d38:	d92080e7          	jalr	-622(ra) # 80002ac6 <myproc>
    80003d3c:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003d40:	fd043783          	ld	a5,-48(s0)
    80003d44:	6fa4                	ld	s1,88(a5)
    80003d46:	00000097          	auipc	ra,0x0
    80003d4a:	e46080e7          	jalr	-442(ra) # 80003b8c <r_sepc>
    80003d4e:	87aa                	mv	a5,a0
    80003d50:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003d52:	00000097          	auipc	ra,0x0
    80003d56:	e88080e7          	jalr	-376(ra) # 80003bda <r_scause>
    80003d5a:	872a                	mv	a4,a0
    80003d5c:	47a1                	li	a5,8
    80003d5e:	04f71163          	bne	a4,a5,80003da0 <usertrap+0xac>
    // system call

    if(killed(p))
    80003d62:	fd043503          	ld	a0,-48(s0)
    80003d66:	00000097          	auipc	ra,0x0
    80003d6a:	b30080e7          	jalr	-1232(ra) # 80003896 <killed>
    80003d6e:	87aa                	mv	a5,a0
    80003d70:	c791                	beqz	a5,80003d7c <usertrap+0x88>
      exit(-1);
    80003d72:	557d                	li	a0,-1
    80003d74:	fffff097          	auipc	ra,0xfffff
    80003d78:	444080e7          	jalr	1092(ra) # 800031b8 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003d7c:	fd043783          	ld	a5,-48(s0)
    80003d80:	6fbc                	ld	a5,88(a5)
    80003d82:	6f98                	ld	a4,24(a5)
    80003d84:	fd043783          	ld	a5,-48(s0)
    80003d88:	6fbc                	ld	a5,88(a5)
    80003d8a:	0711                	addi	a4,a4,4
    80003d8c:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003d8e:	00000097          	auipc	ra,0x0
    80003d92:	e80080e7          	jalr	-384(ra) # 80003c0e <intr_on>

    syscall();
    80003d96:	00000097          	auipc	ra,0x0
    80003d9a:	6a8080e7          	jalr	1704(ra) # 8000443e <syscall>
    80003d9e:	a885                	j	80003e0e <usertrap+0x11a>
  } else if((which_dev = devintr()) != 0){
    80003da0:	00000097          	auipc	ra,0x0
    80003da4:	36e080e7          	jalr	878(ra) # 8000410e <devintr>
    80003da8:	87aa                	mv	a5,a0
    80003daa:	fcf42e23          	sw	a5,-36(s0)
    80003dae:	fdc42783          	lw	a5,-36(s0)
    80003db2:	2781                	sext.w	a5,a5
    80003db4:	efa9                	bnez	a5,80003e0e <usertrap+0x11a>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003db6:	00000097          	auipc	ra,0x0
    80003dba:	e24080e7          	jalr	-476(ra) # 80003bda <r_scause>
    80003dbe:	872a                	mv	a4,a0
    80003dc0:	fd043783          	ld	a5,-48(s0)
    80003dc4:	5b9c                	lw	a5,48(a5)
    80003dc6:	863e                	mv	a2,a5
    80003dc8:	85ba                	mv	a1,a4
    80003dca:	00007517          	auipc	a0,0x7
    80003dce:	53650513          	addi	a0,a0,1334 # 8000b300 <etext+0x300>
    80003dd2:	ffffd097          	auipc	ra,0xffffd
    80003dd6:	c64080e7          	jalr	-924(ra) # 80000a36 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003dda:	00000097          	auipc	ra,0x0
    80003dde:	db2080e7          	jalr	-590(ra) # 80003b8c <r_sepc>
    80003de2:	84aa                	mv	s1,a0
    80003de4:	00000097          	auipc	ra,0x0
    80003de8:	e10080e7          	jalr	-496(ra) # 80003bf4 <r_stval>
    80003dec:	87aa                	mv	a5,a0
    80003dee:	863e                	mv	a2,a5
    80003df0:	85a6                	mv	a1,s1
    80003df2:	00007517          	auipc	a0,0x7
    80003df6:	53e50513          	addi	a0,a0,1342 # 8000b330 <etext+0x330>
    80003dfa:	ffffd097          	auipc	ra,0xffffd
    80003dfe:	c3c080e7          	jalr	-964(ra) # 80000a36 <printf>
    setkilled(p);
    80003e02:	fd043503          	ld	a0,-48(s0)
    80003e06:	00000097          	auipc	ra,0x0
    80003e0a:	a56080e7          	jalr	-1450(ra) # 8000385c <setkilled>
  }

  if(killed(p))
    80003e0e:	fd043503          	ld	a0,-48(s0)
    80003e12:	00000097          	auipc	ra,0x0
    80003e16:	a84080e7          	jalr	-1404(ra) # 80003896 <killed>
    80003e1a:	87aa                	mv	a5,a0
    80003e1c:	c791                	beqz	a5,80003e28 <usertrap+0x134>
    exit(-1);
    80003e1e:	557d                	li	a0,-1
    80003e20:	fffff097          	auipc	ra,0xfffff
    80003e24:	398080e7          	jalr	920(ra) # 800031b8 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003e28:	fdc42783          	lw	a5,-36(s0)
    80003e2c:	0007871b          	sext.w	a4,a5
    80003e30:	4789                	li	a5,2
    80003e32:	00f71663          	bne	a4,a5,80003e3e <usertrap+0x14a>
    yield();
    80003e36:	fffff097          	auipc	ra,0xfffff
    80003e3a:	7b8080e7          	jalr	1976(ra) # 800035ee <yield>

  usertrapret();
    80003e3e:	00000097          	auipc	ra,0x0
    80003e42:	014080e7          	jalr	20(ra) # 80003e52 <usertrapret>
}
    80003e46:	0001                	nop
    80003e48:	70a2                	ld	ra,40(sp)
    80003e4a:	7402                	ld	s0,32(sp)
    80003e4c:	64e2                	ld	s1,24(sp)
    80003e4e:	6145                	addi	sp,sp,48
    80003e50:	8082                	ret

0000000080003e52 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003e52:	715d                	addi	sp,sp,-80
    80003e54:	e486                	sd	ra,72(sp)
    80003e56:	e0a2                	sd	s0,64(sp)
    80003e58:	fc26                	sd	s1,56(sp)
    80003e5a:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003e5c:	fffff097          	auipc	ra,0xfffff
    80003e60:	c6a080e7          	jalr	-918(ra) # 80002ac6 <myproc>
    80003e64:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003e68:	00000097          	auipc	ra,0x0
    80003e6c:	dd0080e7          	jalr	-560(ra) # 80003c38 <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003e70:	00006717          	auipc	a4,0x6
    80003e74:	19070713          	addi	a4,a4,400 # 8000a000 <_trampoline>
    80003e78:	00006797          	auipc	a5,0x6
    80003e7c:	18878793          	addi	a5,a5,392 # 8000a000 <_trampoline>
    80003e80:	8f1d                	sub	a4,a4,a5
    80003e82:	040007b7          	lui	a5,0x4000
    80003e86:	17fd                	addi	a5,a5,-1
    80003e88:	07b2                	slli	a5,a5,0xc
    80003e8a:	97ba                	add	a5,a5,a4
    80003e8c:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003e90:	fd043503          	ld	a0,-48(s0)
    80003e94:	00000097          	auipc	ra,0x0
    80003e98:	d12080e7          	jalr	-750(ra) # 80003ba6 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003e9c:	fd843783          	ld	a5,-40(s0)
    80003ea0:	6fa4                	ld	s1,88(a5)
    80003ea2:	00000097          	auipc	ra,0x0
    80003ea6:	d1e080e7          	jalr	-738(ra) # 80003bc0 <r_satp>
    80003eaa:	87aa                	mv	a5,a0
    80003eac:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003eae:	fd843783          	ld	a5,-40(s0)
    80003eb2:	63b4                	ld	a3,64(a5)
    80003eb4:	fd843783          	ld	a5,-40(s0)
    80003eb8:	6fbc                	ld	a5,88(a5)
    80003eba:	6705                	lui	a4,0x1
    80003ebc:	9736                	add	a4,a4,a3
    80003ebe:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003ec0:	fd843783          	ld	a5,-40(s0)
    80003ec4:	6fbc                	ld	a5,88(a5)
    80003ec6:	00000717          	auipc	a4,0x0
    80003eca:	e2e70713          	addi	a4,a4,-466 # 80003cf4 <usertrap>
    80003ece:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003ed0:	fd843783          	ld	a5,-40(s0)
    80003ed4:	6fa4                	ld	s1,88(a5)
    80003ed6:	00000097          	auipc	ra,0x0
    80003eda:	db8080e7          	jalr	-584(ra) # 80003c8e <r_tp>
    80003ede:	87aa                	mv	a5,a0
    80003ee0:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003ee2:	00000097          	auipc	ra,0x0
    80003ee6:	c28080e7          	jalr	-984(ra) # 80003b0a <r_sstatus>
    80003eea:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003eee:	fc843783          	ld	a5,-56(s0)
    80003ef2:	eff7f793          	andi	a5,a5,-257
    80003ef6:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003efa:	fc843783          	ld	a5,-56(s0)
    80003efe:	0207e793          	ori	a5,a5,32
    80003f02:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003f06:	fc843503          	ld	a0,-56(s0)
    80003f0a:	00000097          	auipc	ra,0x0
    80003f0e:	c1a080e7          	jalr	-998(ra) # 80003b24 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003f12:	fd843783          	ld	a5,-40(s0)
    80003f16:	6fbc                	ld	a5,88(a5)
    80003f18:	6f9c                	ld	a5,24(a5)
    80003f1a:	853e                	mv	a0,a5
    80003f1c:	00000097          	auipc	ra,0x0
    80003f20:	c56080e7          	jalr	-938(ra) # 80003b72 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003f24:	fd843783          	ld	a5,-40(s0)
    80003f28:	6bbc                	ld	a5,80(a5)
    80003f2a:	00c7d713          	srli	a4,a5,0xc
    80003f2e:	57fd                	li	a5,-1
    80003f30:	17fe                	slli	a5,a5,0x3f
    80003f32:	8fd9                	or	a5,a5,a4
    80003f34:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003f38:	00006717          	auipc	a4,0x6
    80003f3c:	16470713          	addi	a4,a4,356 # 8000a09c <userret>
    80003f40:	00006797          	auipc	a5,0x6
    80003f44:	0c078793          	addi	a5,a5,192 # 8000a000 <_trampoline>
    80003f48:	8f1d                	sub	a4,a4,a5
    80003f4a:	040007b7          	lui	a5,0x4000
    80003f4e:	17fd                	addi	a5,a5,-1
    80003f50:	07b2                	slli	a5,a5,0xc
    80003f52:	97ba                	add	a5,a5,a4
    80003f54:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003f58:	fb843783          	ld	a5,-72(s0)
    80003f5c:	fc043503          	ld	a0,-64(s0)
    80003f60:	9782                	jalr	a5
}
    80003f62:	0001                	nop
    80003f64:	60a6                	ld	ra,72(sp)
    80003f66:	6406                	ld	s0,64(sp)
    80003f68:	74e2                	ld	s1,56(sp)
    80003f6a:	6161                	addi	sp,sp,80
    80003f6c:	8082                	ret

0000000080003f6e <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003f6e:	7139                	addi	sp,sp,-64
    80003f70:	fc06                	sd	ra,56(sp)
    80003f72:	f822                	sd	s0,48(sp)
    80003f74:	f426                	sd	s1,40(sp)
    80003f76:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003f78:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003f7c:	00000097          	auipc	ra,0x0
    80003f80:	c10080e7          	jalr	-1008(ra) # 80003b8c <r_sepc>
    80003f84:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003f88:	00000097          	auipc	ra,0x0
    80003f8c:	b82080e7          	jalr	-1150(ra) # 80003b0a <r_sstatus>
    80003f90:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003f94:	00000097          	auipc	ra,0x0
    80003f98:	c46080e7          	jalr	-954(ra) # 80003bda <r_scause>
    80003f9c:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003fa0:	fc843783          	ld	a5,-56(s0)
    80003fa4:	1007f793          	andi	a5,a5,256
    80003fa8:	eb89                	bnez	a5,80003fba <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003faa:	00007517          	auipc	a0,0x7
    80003fae:	3a650513          	addi	a0,a0,934 # 8000b350 <etext+0x350>
    80003fb2:	ffffd097          	auipc	ra,0xffffd
    80003fb6:	cda080e7          	jalr	-806(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    80003fba:	00000097          	auipc	ra,0x0
    80003fbe:	ca6080e7          	jalr	-858(ra) # 80003c60 <intr_get>
    80003fc2:	87aa                	mv	a5,a0
    80003fc4:	cb89                	beqz	a5,80003fd6 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003fc6:	00007517          	auipc	a0,0x7
    80003fca:	3b250513          	addi	a0,a0,946 # 8000b378 <etext+0x378>
    80003fce:	ffffd097          	auipc	ra,0xffffd
    80003fd2:	cbe080e7          	jalr	-834(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    80003fd6:	00000097          	auipc	ra,0x0
    80003fda:	138080e7          	jalr	312(ra) # 8000410e <devintr>
    80003fde:	87aa                	mv	a5,a0
    80003fe0:	fcf42e23          	sw	a5,-36(s0)
    80003fe4:	fdc42783          	lw	a5,-36(s0)
    80003fe8:	2781                	sext.w	a5,a5
    80003fea:	e7b9                	bnez	a5,80004038 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003fec:	fc043583          	ld	a1,-64(s0)
    80003ff0:	00007517          	auipc	a0,0x7
    80003ff4:	3a850513          	addi	a0,a0,936 # 8000b398 <etext+0x398>
    80003ff8:	ffffd097          	auipc	ra,0xffffd
    80003ffc:	a3e080e7          	jalr	-1474(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80004000:	00000097          	auipc	ra,0x0
    80004004:	b8c080e7          	jalr	-1140(ra) # 80003b8c <r_sepc>
    80004008:	84aa                	mv	s1,a0
    8000400a:	00000097          	auipc	ra,0x0
    8000400e:	bea080e7          	jalr	-1046(ra) # 80003bf4 <r_stval>
    80004012:	87aa                	mv	a5,a0
    80004014:	863e                	mv	a2,a5
    80004016:	85a6                	mv	a1,s1
    80004018:	00007517          	auipc	a0,0x7
    8000401c:	39050513          	addi	a0,a0,912 # 8000b3a8 <etext+0x3a8>
    80004020:	ffffd097          	auipc	ra,0xffffd
    80004024:	a16080e7          	jalr	-1514(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80004028:	00007517          	auipc	a0,0x7
    8000402c:	39850513          	addi	a0,a0,920 # 8000b3c0 <etext+0x3c0>
    80004030:	ffffd097          	auipc	ra,0xffffd
    80004034:	c5c080e7          	jalr	-932(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80004038:	fdc42783          	lw	a5,-36(s0)
    8000403c:	0007871b          	sext.w	a4,a5
    80004040:	4789                	li	a5,2
    80004042:	02f71663          	bne	a4,a5,8000406e <kerneltrap+0x100>
    80004046:	fffff097          	auipc	ra,0xfffff
    8000404a:	a80080e7          	jalr	-1408(ra) # 80002ac6 <myproc>
    8000404e:	87aa                	mv	a5,a0
    80004050:	cf99                	beqz	a5,8000406e <kerneltrap+0x100>
    80004052:	fffff097          	auipc	ra,0xfffff
    80004056:	a74080e7          	jalr	-1420(ra) # 80002ac6 <myproc>
    8000405a:	87aa                	mv	a5,a0
    8000405c:	4f9c                	lw	a5,24(a5)
    8000405e:	873e                	mv	a4,a5
    80004060:	4791                	li	a5,4
    80004062:	00f71663          	bne	a4,a5,8000406e <kerneltrap+0x100>
    yield();
    80004066:	fffff097          	auipc	ra,0xfffff
    8000406a:	588080e7          	jalr	1416(ra) # 800035ee <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    8000406e:	fd043503          	ld	a0,-48(s0)
    80004072:	00000097          	auipc	ra,0x0
    80004076:	b00080e7          	jalr	-1280(ra) # 80003b72 <w_sepc>
  w_sstatus(sstatus);
    8000407a:	fc843503          	ld	a0,-56(s0)
    8000407e:	00000097          	auipc	ra,0x0
    80004082:	aa6080e7          	jalr	-1370(ra) # 80003b24 <w_sstatus>
}
    80004086:	0001                	nop
    80004088:	70e2                	ld	ra,56(sp)
    8000408a:	7442                	ld	s0,48(sp)
    8000408c:	74a2                	ld	s1,40(sp)
    8000408e:	6121                	addi	sp,sp,64
    80004090:	8082                	ret

0000000080004092 <clockintr>:

void
clockintr()
{
    80004092:	1141                	addi	sp,sp,-16
    80004094:	e406                	sd	ra,8(sp)
    80004096:	e022                	sd	s0,0(sp)
    80004098:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    8000409a:	00026517          	auipc	a0,0x26
    8000409e:	94e50513          	addi	a0,a0,-1714 # 800299e8 <tickslock>
    800040a2:	ffffd097          	auipc	ra,0xffffd
    800040a6:	288080e7          	jalr	648(ra) # 8000132a <acquire>
  ticks++;
    800040aa:	00008797          	auipc	a5,0x8
    800040ae:	89e78793          	addi	a5,a5,-1890 # 8000b948 <ticks>
    800040b2:	439c                	lw	a5,0(a5)
    800040b4:	2785                	addiw	a5,a5,1
    800040b6:	0007871b          	sext.w	a4,a5
    800040ba:	00008797          	auipc	a5,0x8
    800040be:	88e78793          	addi	a5,a5,-1906 # 8000b948 <ticks>
    800040c2:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    800040c4:	00008797          	auipc	a5,0x8
    800040c8:	88478793          	addi	a5,a5,-1916 # 8000b948 <ticks>
    800040cc:	439c                	lw	a5,0(a5)
    800040ce:	873e                	mv	a4,a5
    800040d0:	06400793          	li	a5,100
    800040d4:	02f777bb          	remuw	a5,a4,a5
    800040d8:	2781                	sext.w	a5,a5
    800040da:	e789                	bnez	a5,800040e4 <clockintr+0x52>
  {
    updaterefhistory();
    800040dc:	ffffe097          	auipc	ra,0xffffe
    800040e0:	9e6080e7          	jalr	-1562(ra) # 80001ac2 <updaterefhistory>
  }

  wakeup(&ticks);
    800040e4:	00008517          	auipc	a0,0x8
    800040e8:	86450513          	addi	a0,a0,-1948 # 8000b948 <ticks>
    800040ec:	fffff097          	auipc	ra,0xfffff
    800040f0:	618080e7          	jalr	1560(ra) # 80003704 <wakeup>
  release(&tickslock);
    800040f4:	00026517          	auipc	a0,0x26
    800040f8:	8f450513          	addi	a0,a0,-1804 # 800299e8 <tickslock>
    800040fc:	ffffd097          	auipc	ra,0xffffd
    80004100:	292080e7          	jalr	658(ra) # 8000138e <release>
}
    80004104:	0001                	nop
    80004106:	60a2                	ld	ra,8(sp)
    80004108:	6402                	ld	s0,0(sp)
    8000410a:	0141                	addi	sp,sp,16
    8000410c:	8082                	ret

000000008000410e <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    8000410e:	1101                	addi	sp,sp,-32
    80004110:	ec06                	sd	ra,24(sp)
    80004112:	e822                	sd	s0,16(sp)
    80004114:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80004116:	00000097          	auipc	ra,0x0
    8000411a:	ac4080e7          	jalr	-1340(ra) # 80003bda <r_scause>
    8000411e:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    80004122:	fe843783          	ld	a5,-24(s0)
    80004126:	0a07d263          	bgez	a5,800041ca <devintr+0xbc>
     (scause & 0xff) == 9){
    8000412a:	fe843783          	ld	a5,-24(s0)
    8000412e:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80004132:	47a5                	li	a5,9
    80004134:	08f71b63          	bne	a4,a5,800041ca <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004138:	00005097          	auipc	ra,0x5
    8000413c:	aa4080e7          	jalr	-1372(ra) # 80008bdc <plic_claim>
    80004140:	87aa                	mv	a5,a0
    80004142:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004146:	fe442783          	lw	a5,-28(s0)
    8000414a:	0007871b          	sext.w	a4,a5
    8000414e:	47a9                	li	a5,10
    80004150:	00f71763          	bne	a4,a5,8000415e <devintr+0x50>
      uartintr();
    80004154:	ffffd097          	auipc	ra,0xffffd
    80004158:	eda080e7          	jalr	-294(ra) # 8000102e <uartintr>
    8000415c:	a891                	j	800041b0 <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    8000415e:	fe442783          	lw	a5,-28(s0)
    80004162:	0007871b          	sext.w	a4,a5
    80004166:	4785                	li	a5,1
    80004168:	00f71863          	bne	a4,a5,80004178 <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    8000416c:	4501                	li	a0,0
    8000416e:	00006097          	auipc	ra,0x6
    80004172:	c2c080e7          	jalr	-980(ra) # 80009d9a <virtio_disk_intr>
    80004176:	a82d                	j	800041b0 <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    80004178:	fe442783          	lw	a5,-28(s0)
    8000417c:	0007871b          	sext.w	a4,a5
    80004180:	4789                	li	a5,2
    80004182:	00f71863          	bne	a4,a5,80004192 <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    80004186:	4505                	li	a0,1
    80004188:	00006097          	auipc	ra,0x6
    8000418c:	c12080e7          	jalr	-1006(ra) # 80009d9a <virtio_disk_intr>
    80004190:	a005                	j	800041b0 <devintr+0xa2>
    } else if(irq){
    80004192:	fe442783          	lw	a5,-28(s0)
    80004196:	2781                	sext.w	a5,a5
    80004198:	cf81                	beqz	a5,800041b0 <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    8000419a:	fe442783          	lw	a5,-28(s0)
    8000419e:	85be                	mv	a1,a5
    800041a0:	00007517          	auipc	a0,0x7
    800041a4:	23050513          	addi	a0,a0,560 # 8000b3d0 <etext+0x3d0>
    800041a8:	ffffd097          	auipc	ra,0xffffd
    800041ac:	88e080e7          	jalr	-1906(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800041b0:	fe442783          	lw	a5,-28(s0)
    800041b4:	2781                	sext.w	a5,a5
    800041b6:	cb81                	beqz	a5,800041c6 <devintr+0xb8>
      plic_complete(irq);
    800041b8:	fe442783          	lw	a5,-28(s0)
    800041bc:	853e                	mv	a0,a5
    800041be:	00005097          	auipc	ra,0x5
    800041c2:	a5c080e7          	jalr	-1444(ra) # 80008c1a <plic_complete>

    return 1;
    800041c6:	4785                	li	a5,1
    800041c8:	a081                	j	80004208 <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    800041ca:	fe843703          	ld	a4,-24(s0)
    800041ce:	57fd                	li	a5,-1
    800041d0:	17fe                	slli	a5,a5,0x3f
    800041d2:	0785                	addi	a5,a5,1
    800041d4:	02f71963          	bne	a4,a5,80004206 <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800041d8:	fffff097          	auipc	ra,0xfffff
    800041dc:	890080e7          	jalr	-1904(ra) # 80002a68 <cpuid>
    800041e0:	87aa                	mv	a5,a0
    800041e2:	e789                	bnez	a5,800041ec <devintr+0xde>
      clockintr();
    800041e4:	00000097          	auipc	ra,0x0
    800041e8:	eae080e7          	jalr	-338(ra) # 80004092 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800041ec:	00000097          	auipc	ra,0x0
    800041f0:	952080e7          	jalr	-1710(ra) # 80003b3e <r_sip>
    800041f4:	87aa                	mv	a5,a0
    800041f6:	9bf5                	andi	a5,a5,-3
    800041f8:	853e                	mv	a0,a5
    800041fa:	00000097          	auipc	ra,0x0
    800041fe:	95e080e7          	jalr	-1698(ra) # 80003b58 <w_sip>

    return 2;
    80004202:	4789                	li	a5,2
    80004204:	a011                	j	80004208 <devintr+0xfa>
  } else {
    return 0;
    80004206:	4781                	li	a5,0
  }
}
    80004208:	853e                	mv	a0,a5
    8000420a:	60e2                	ld	ra,24(sp)
    8000420c:	6442                	ld	s0,16(sp)
    8000420e:	6105                	addi	sp,sp,32
    80004210:	8082                	ret

0000000080004212 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    80004212:	7179                	addi	sp,sp,-48
    80004214:	f406                	sd	ra,40(sp)
    80004216:	f022                	sd	s0,32(sp)
    80004218:	1800                	addi	s0,sp,48
    8000421a:	fca43c23          	sd	a0,-40(s0)
    8000421e:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80004222:	fffff097          	auipc	ra,0xfffff
    80004226:	8a4080e7          	jalr	-1884(ra) # 80002ac6 <myproc>
    8000422a:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    8000422e:	fe843783          	ld	a5,-24(s0)
    80004232:	67bc                	ld	a5,72(a5)
    80004234:	fd843703          	ld	a4,-40(s0)
    80004238:	00f77b63          	bgeu	a4,a5,8000424e <fetchaddr+0x3c>
    8000423c:	fd843783          	ld	a5,-40(s0)
    80004240:	00878713          	addi	a4,a5,8
    80004244:	fe843783          	ld	a5,-24(s0)
    80004248:	67bc                	ld	a5,72(a5)
    8000424a:	00e7f463          	bgeu	a5,a4,80004252 <fetchaddr+0x40>
    return -1;
    8000424e:	57fd                	li	a5,-1
    80004250:	a01d                	j	80004276 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004252:	fe843783          	ld	a5,-24(s0)
    80004256:	6bbc                	ld	a5,80(a5)
    80004258:	46a1                	li	a3,8
    8000425a:	fd843603          	ld	a2,-40(s0)
    8000425e:	fd043583          	ld	a1,-48(s0)
    80004262:	853e                	mv	a0,a5
    80004264:	ffffe097          	auipc	ra,0xffffe
    80004268:	3fa080e7          	jalr	1018(ra) # 8000265e <copyin>
    8000426c:	87aa                	mv	a5,a0
    8000426e:	c399                	beqz	a5,80004274 <fetchaddr+0x62>
    return -1;
    80004270:	57fd                	li	a5,-1
    80004272:	a011                	j	80004276 <fetchaddr+0x64>
  return 0;
    80004274:	4781                	li	a5,0
}
    80004276:	853e                	mv	a0,a5
    80004278:	70a2                	ld	ra,40(sp)
    8000427a:	7402                	ld	s0,32(sp)
    8000427c:	6145                	addi	sp,sp,48
    8000427e:	8082                	ret

0000000080004280 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004280:	7139                	addi	sp,sp,-64
    80004282:	fc06                	sd	ra,56(sp)
    80004284:	f822                	sd	s0,48(sp)
    80004286:	0080                	addi	s0,sp,64
    80004288:	fca43c23          	sd	a0,-40(s0)
    8000428c:	fcb43823          	sd	a1,-48(s0)
    80004290:	87b2                	mv	a5,a2
    80004292:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004296:	fffff097          	auipc	ra,0xfffff
    8000429a:	830080e7          	jalr	-2000(ra) # 80002ac6 <myproc>
    8000429e:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    800042a2:	fe843783          	ld	a5,-24(s0)
    800042a6:	6bbc                	ld	a5,80(a5)
    800042a8:	fcc42703          	lw	a4,-52(s0)
    800042ac:	86ba                	mv	a3,a4
    800042ae:	fd843603          	ld	a2,-40(s0)
    800042b2:	fd043583          	ld	a1,-48(s0)
    800042b6:	853e                	mv	a0,a5
    800042b8:	ffffe097          	auipc	ra,0xffffe
    800042bc:	474080e7          	jalr	1140(ra) # 8000272c <copyinstr>
    800042c0:	87aa                	mv	a5,a0
    800042c2:	0007d463          	bgez	a5,800042ca <fetchstr+0x4a>
    return -1;
    800042c6:	57fd                	li	a5,-1
    800042c8:	a801                	j	800042d8 <fetchstr+0x58>
  return strlen(buf);
    800042ca:	fd043503          	ld	a0,-48(s0)
    800042ce:	ffffd097          	auipc	ra,0xffffd
    800042d2:	5ae080e7          	jalr	1454(ra) # 8000187c <strlen>
    800042d6:	87aa                	mv	a5,a0
}
    800042d8:	853e                	mv	a0,a5
    800042da:	70e2                	ld	ra,56(sp)
    800042dc:	7442                	ld	s0,48(sp)
    800042de:	6121                	addi	sp,sp,64
    800042e0:	8082                	ret

00000000800042e2 <argraw>:

static uint64
argraw(int n)
{
    800042e2:	7179                	addi	sp,sp,-48
    800042e4:	f406                	sd	ra,40(sp)
    800042e6:	f022                	sd	s0,32(sp)
    800042e8:	1800                	addi	s0,sp,48
    800042ea:	87aa                	mv	a5,a0
    800042ec:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800042f0:	ffffe097          	auipc	ra,0xffffe
    800042f4:	7d6080e7          	jalr	2006(ra) # 80002ac6 <myproc>
    800042f8:	fea43423          	sd	a0,-24(s0)
    800042fc:	fdc42783          	lw	a5,-36(s0)
    80004300:	0007871b          	sext.w	a4,a5
    80004304:	4795                	li	a5,5
    80004306:	06e7e263          	bltu	a5,a4,8000436a <argraw+0x88>
    8000430a:	fdc46783          	lwu	a5,-36(s0)
    8000430e:	00279713          	slli	a4,a5,0x2
    80004312:	00007797          	auipc	a5,0x7
    80004316:	0e678793          	addi	a5,a5,230 # 8000b3f8 <etext+0x3f8>
    8000431a:	97ba                	add	a5,a5,a4
    8000431c:	439c                	lw	a5,0(a5)
    8000431e:	0007871b          	sext.w	a4,a5
    80004322:	00007797          	auipc	a5,0x7
    80004326:	0d678793          	addi	a5,a5,214 # 8000b3f8 <etext+0x3f8>
    8000432a:	97ba                	add	a5,a5,a4
    8000432c:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    8000432e:	fe843783          	ld	a5,-24(s0)
    80004332:	6fbc                	ld	a5,88(a5)
    80004334:	7bbc                	ld	a5,112(a5)
    80004336:	a091                	j	8000437a <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004338:	fe843783          	ld	a5,-24(s0)
    8000433c:	6fbc                	ld	a5,88(a5)
    8000433e:	7fbc                	ld	a5,120(a5)
    80004340:	a82d                	j	8000437a <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004342:	fe843783          	ld	a5,-24(s0)
    80004346:	6fbc                	ld	a5,88(a5)
    80004348:	63dc                	ld	a5,128(a5)
    8000434a:	a805                	j	8000437a <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    8000434c:	fe843783          	ld	a5,-24(s0)
    80004350:	6fbc                	ld	a5,88(a5)
    80004352:	67dc                	ld	a5,136(a5)
    80004354:	a01d                	j	8000437a <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004356:	fe843783          	ld	a5,-24(s0)
    8000435a:	6fbc                	ld	a5,88(a5)
    8000435c:	6bdc                	ld	a5,144(a5)
    8000435e:	a831                	j	8000437a <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    80004360:	fe843783          	ld	a5,-24(s0)
    80004364:	6fbc                	ld	a5,88(a5)
    80004366:	6fdc                	ld	a5,152(a5)
    80004368:	a809                	j	8000437a <argraw+0x98>
  }
  panic("argraw");
    8000436a:	00007517          	auipc	a0,0x7
    8000436e:	08650513          	addi	a0,a0,134 # 8000b3f0 <etext+0x3f0>
    80004372:	ffffd097          	auipc	ra,0xffffd
    80004376:	91a080e7          	jalr	-1766(ra) # 80000c8c <panic>
  return -1;
}
    8000437a:	853e                	mv	a0,a5
    8000437c:	70a2                	ld	ra,40(sp)
    8000437e:	7402                	ld	s0,32(sp)
    80004380:	6145                	addi	sp,sp,48
    80004382:	8082                	ret

0000000080004384 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    80004384:	1101                	addi	sp,sp,-32
    80004386:	ec06                	sd	ra,24(sp)
    80004388:	e822                	sd	s0,16(sp)
    8000438a:	1000                	addi	s0,sp,32
    8000438c:	87aa                	mv	a5,a0
    8000438e:	feb43023          	sd	a1,-32(s0)
    80004392:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004396:	fec42783          	lw	a5,-20(s0)
    8000439a:	853e                	mv	a0,a5
    8000439c:	00000097          	auipc	ra,0x0
    800043a0:	f46080e7          	jalr	-186(ra) # 800042e2 <argraw>
    800043a4:	87aa                	mv	a5,a0
    800043a6:	0007871b          	sext.w	a4,a5
    800043aa:	fe043783          	ld	a5,-32(s0)
    800043ae:	c398                	sw	a4,0(a5)
}
    800043b0:	0001                	nop
    800043b2:	60e2                	ld	ra,24(sp)
    800043b4:	6442                	ld	s0,16(sp)
    800043b6:	6105                	addi	sp,sp,32
    800043b8:	8082                	ret

00000000800043ba <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    800043ba:	1101                	addi	sp,sp,-32
    800043bc:	ec06                	sd	ra,24(sp)
    800043be:	e822                	sd	s0,16(sp)
    800043c0:	1000                	addi	s0,sp,32
    800043c2:	87aa                	mv	a5,a0
    800043c4:	feb43023          	sd	a1,-32(s0)
    800043c8:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800043cc:	fec42783          	lw	a5,-20(s0)
    800043d0:	853e                	mv	a0,a5
    800043d2:	00000097          	auipc	ra,0x0
    800043d6:	f10080e7          	jalr	-240(ra) # 800042e2 <argraw>
    800043da:	872a                	mv	a4,a0
    800043dc:	fe043783          	ld	a5,-32(s0)
    800043e0:	e398                	sd	a4,0(a5)
}
    800043e2:	0001                	nop
    800043e4:	60e2                	ld	ra,24(sp)
    800043e6:	6442                	ld	s0,16(sp)
    800043e8:	6105                	addi	sp,sp,32
    800043ea:	8082                	ret

00000000800043ec <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800043ec:	7179                	addi	sp,sp,-48
    800043ee:	f406                	sd	ra,40(sp)
    800043f0:	f022                	sd	s0,32(sp)
    800043f2:	1800                	addi	s0,sp,48
    800043f4:	87aa                	mv	a5,a0
    800043f6:	fcb43823          	sd	a1,-48(s0)
    800043fa:	8732                	mv	a4,a2
    800043fc:	fcf42e23          	sw	a5,-36(s0)
    80004400:	87ba                	mv	a5,a4
    80004402:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    80004406:	fe840713          	addi	a4,s0,-24
    8000440a:	fdc42783          	lw	a5,-36(s0)
    8000440e:	85ba                	mv	a1,a4
    80004410:	853e                	mv	a0,a5
    80004412:	00000097          	auipc	ra,0x0
    80004416:	fa8080e7          	jalr	-88(ra) # 800043ba <argaddr>
  return fetchstr(addr, buf, max);
    8000441a:	fe843783          	ld	a5,-24(s0)
    8000441e:	fd842703          	lw	a4,-40(s0)
    80004422:	863a                	mv	a2,a4
    80004424:	fd043583          	ld	a1,-48(s0)
    80004428:	853e                	mv	a0,a5
    8000442a:	00000097          	auipc	ra,0x0
    8000442e:	e56080e7          	jalr	-426(ra) # 80004280 <fetchstr>
    80004432:	87aa                	mv	a5,a0
}
    80004434:	853e                	mv	a0,a5
    80004436:	70a2                	ld	ra,40(sp)
    80004438:	7402                	ld	s0,32(sp)
    8000443a:	6145                	addi	sp,sp,48
    8000443c:	8082                	ret

000000008000443e <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    8000443e:	7179                	addi	sp,sp,-48
    80004440:	f406                	sd	ra,40(sp)
    80004442:	f022                	sd	s0,32(sp)
    80004444:	ec26                	sd	s1,24(sp)
    80004446:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004448:	ffffe097          	auipc	ra,0xffffe
    8000444c:	67e080e7          	jalr	1662(ra) # 80002ac6 <myproc>
    80004450:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004454:	fd843783          	ld	a5,-40(s0)
    80004458:	6fbc                	ld	a5,88(a5)
    8000445a:	77dc                	ld	a5,168(a5)
    8000445c:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80004460:	fd442783          	lw	a5,-44(s0)
    80004464:	2781                	sext.w	a5,a5
    80004466:	04f05263          	blez	a5,800044aa <syscall+0x6c>
    8000446a:	fd442783          	lw	a5,-44(s0)
    8000446e:	873e                	mv	a4,a5
    80004470:	47d5                	li	a5,21
    80004472:	02e7ec63          	bltu	a5,a4,800044aa <syscall+0x6c>
    80004476:	00007717          	auipc	a4,0x7
    8000447a:	3da70713          	addi	a4,a4,986 # 8000b850 <syscalls>
    8000447e:	fd442783          	lw	a5,-44(s0)
    80004482:	078e                	slli	a5,a5,0x3
    80004484:	97ba                	add	a5,a5,a4
    80004486:	639c                	ld	a5,0(a5)
    80004488:	c38d                	beqz	a5,800044aa <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    8000448a:	00007717          	auipc	a4,0x7
    8000448e:	3c670713          	addi	a4,a4,966 # 8000b850 <syscalls>
    80004492:	fd442783          	lw	a5,-44(s0)
    80004496:	078e                	slli	a5,a5,0x3
    80004498:	97ba                	add	a5,a5,a4
    8000449a:	6398                	ld	a4,0(a5)
    8000449c:	fd843783          	ld	a5,-40(s0)
    800044a0:	6fa4                	ld	s1,88(a5)
    800044a2:	9702                	jalr	a4
    800044a4:	87aa                	mv	a5,a0
    800044a6:	f8bc                	sd	a5,112(s1)
    800044a8:	a815                	j	800044dc <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800044aa:	fd843783          	ld	a5,-40(s0)
    800044ae:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800044b0:	fd843783          	ld	a5,-40(s0)
    800044b4:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800044b8:	fd442683          	lw	a3,-44(s0)
    800044bc:	863e                	mv	a2,a5
    800044be:	85ba                	mv	a1,a4
    800044c0:	00007517          	auipc	a0,0x7
    800044c4:	f5050513          	addi	a0,a0,-176 # 8000b410 <etext+0x410>
    800044c8:	ffffc097          	auipc	ra,0xffffc
    800044cc:	56e080e7          	jalr	1390(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    800044d0:	fd843783          	ld	a5,-40(s0)
    800044d4:	6fbc                	ld	a5,88(a5)
    800044d6:	577d                	li	a4,-1
    800044d8:	fbb8                	sd	a4,112(a5)
  }
}
    800044da:	0001                	nop
    800044dc:	0001                	nop
    800044de:	70a2                	ld	ra,40(sp)
    800044e0:	7402                	ld	s0,32(sp)
    800044e2:	64e2                	ld	s1,24(sp)
    800044e4:	6145                	addi	sp,sp,48
    800044e6:	8082                	ret

00000000800044e8 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800044e8:	1101                	addi	sp,sp,-32
    800044ea:	ec06                	sd	ra,24(sp)
    800044ec:	e822                	sd	s0,16(sp)
    800044ee:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    800044f0:	fec40793          	addi	a5,s0,-20
    800044f4:	85be                	mv	a1,a5
    800044f6:	4501                	li	a0,0
    800044f8:	00000097          	auipc	ra,0x0
    800044fc:	e8c080e7          	jalr	-372(ra) # 80004384 <argint>
  exit(n);
    80004500:	fec42783          	lw	a5,-20(s0)
    80004504:	853e                	mv	a0,a5
    80004506:	fffff097          	auipc	ra,0xfffff
    8000450a:	cb2080e7          	jalr	-846(ra) # 800031b8 <exit>
  return 0;  // not reached
    8000450e:	4781                	li	a5,0
}
    80004510:	853e                	mv	a0,a5
    80004512:	60e2                	ld	ra,24(sp)
    80004514:	6442                	ld	s0,16(sp)
    80004516:	6105                	addi	sp,sp,32
    80004518:	8082                	ret

000000008000451a <sys_getpid>:

uint64
sys_getpid(void)
{
    8000451a:	1141                	addi	sp,sp,-16
    8000451c:	e406                	sd	ra,8(sp)
    8000451e:	e022                	sd	s0,0(sp)
    80004520:	0800                	addi	s0,sp,16
  return myproc()->pid;
    80004522:	ffffe097          	auipc	ra,0xffffe
    80004526:	5a4080e7          	jalr	1444(ra) # 80002ac6 <myproc>
    8000452a:	87aa                	mv	a5,a0
    8000452c:	5b9c                	lw	a5,48(a5)
}
    8000452e:	853e                	mv	a0,a5
    80004530:	60a2                	ld	ra,8(sp)
    80004532:	6402                	ld	s0,0(sp)
    80004534:	0141                	addi	sp,sp,16
    80004536:	8082                	ret

0000000080004538 <sys_fork>:

uint64
sys_fork(void)
{
    80004538:	1141                	addi	sp,sp,-16
    8000453a:	e406                	sd	ra,8(sp)
    8000453c:	e022                	sd	s0,0(sp)
    8000453e:	0800                	addi	s0,sp,16
  return fork();
    80004540:	fffff097          	auipc	ra,0xfffff
    80004544:	a56080e7          	jalr	-1450(ra) # 80002f96 <fork>
    80004548:	87aa                	mv	a5,a0
}
    8000454a:	853e                	mv	a0,a5
    8000454c:	60a2                	ld	ra,8(sp)
    8000454e:	6402                	ld	s0,0(sp)
    80004550:	0141                	addi	sp,sp,16
    80004552:	8082                	ret

0000000080004554 <sys_wait>:

uint64
sys_wait(void)
{
    80004554:	1101                	addi	sp,sp,-32
    80004556:	ec06                	sd	ra,24(sp)
    80004558:	e822                	sd	s0,16(sp)
    8000455a:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    8000455c:	fe840793          	addi	a5,s0,-24
    80004560:	85be                	mv	a1,a5
    80004562:	4501                	li	a0,0
    80004564:	00000097          	auipc	ra,0x0
    80004568:	e56080e7          	jalr	-426(ra) # 800043ba <argaddr>
  return wait(p);
    8000456c:	fe843783          	ld	a5,-24(s0)
    80004570:	853e                	mv	a0,a5
    80004572:	fffff097          	auipc	ra,0xfffff
    80004576:	d82080e7          	jalr	-638(ra) # 800032f4 <wait>
    8000457a:	87aa                	mv	a5,a0
}
    8000457c:	853e                	mv	a0,a5
    8000457e:	60e2                	ld	ra,24(sp)
    80004580:	6442                	ld	s0,16(sp)
    80004582:	6105                	addi	sp,sp,32
    80004584:	8082                	ret

0000000080004586 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004586:	1101                	addi	sp,sp,-32
    80004588:	ec06                	sd	ra,24(sp)
    8000458a:	e822                	sd	s0,16(sp)
    8000458c:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    8000458e:	fe440793          	addi	a5,s0,-28
    80004592:	85be                	mv	a1,a5
    80004594:	4501                	li	a0,0
    80004596:	00000097          	auipc	ra,0x0
    8000459a:	dee080e7          	jalr	-530(ra) # 80004384 <argint>
  addr = myproc()->sz;
    8000459e:	ffffe097          	auipc	ra,0xffffe
    800045a2:	528080e7          	jalr	1320(ra) # 80002ac6 <myproc>
    800045a6:	87aa                	mv	a5,a0
    800045a8:	67bc                	ld	a5,72(a5)
    800045aa:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    800045ae:	fe442783          	lw	a5,-28(s0)
    800045b2:	853e                	mv	a0,a5
    800045b4:	fffff097          	auipc	ra,0xfffff
    800045b8:	942080e7          	jalr	-1726(ra) # 80002ef6 <growproc>
    800045bc:	87aa                	mv	a5,a0
    800045be:	0007d463          	bgez	a5,800045c6 <sys_sbrk+0x40>
    return -1;
    800045c2:	57fd                	li	a5,-1
    800045c4:	a019                	j	800045ca <sys_sbrk+0x44>
  return addr;
    800045c6:	fe843783          	ld	a5,-24(s0)
}
    800045ca:	853e                	mv	a0,a5
    800045cc:	60e2                	ld	ra,24(sp)
    800045ce:	6442                	ld	s0,16(sp)
    800045d0:	6105                	addi	sp,sp,32
    800045d2:	8082                	ret

00000000800045d4 <sys_sleep>:

uint64
sys_sleep(void)
{
    800045d4:	1101                	addi	sp,sp,-32
    800045d6:	ec06                	sd	ra,24(sp)
    800045d8:	e822                	sd	s0,16(sp)
    800045da:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    800045dc:	fe840793          	addi	a5,s0,-24
    800045e0:	85be                	mv	a1,a5
    800045e2:	4501                	li	a0,0
    800045e4:	00000097          	auipc	ra,0x0
    800045e8:	da0080e7          	jalr	-608(ra) # 80004384 <argint>
  acquire(&tickslock);
    800045ec:	00025517          	auipc	a0,0x25
    800045f0:	3fc50513          	addi	a0,a0,1020 # 800299e8 <tickslock>
    800045f4:	ffffd097          	auipc	ra,0xffffd
    800045f8:	d36080e7          	jalr	-714(ra) # 8000132a <acquire>
  ticks0 = ticks;
    800045fc:	00007797          	auipc	a5,0x7
    80004600:	34c78793          	addi	a5,a5,844 # 8000b948 <ticks>
    80004604:	439c                	lw	a5,0(a5)
    80004606:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    8000460a:	a099                	j	80004650 <sys_sleep+0x7c>
    if(killed(myproc())){
    8000460c:	ffffe097          	auipc	ra,0xffffe
    80004610:	4ba080e7          	jalr	1210(ra) # 80002ac6 <myproc>
    80004614:	87aa                	mv	a5,a0
    80004616:	853e                	mv	a0,a5
    80004618:	fffff097          	auipc	ra,0xfffff
    8000461c:	27e080e7          	jalr	638(ra) # 80003896 <killed>
    80004620:	87aa                	mv	a5,a0
    80004622:	cb99                	beqz	a5,80004638 <sys_sleep+0x64>
      release(&tickslock);
    80004624:	00025517          	auipc	a0,0x25
    80004628:	3c450513          	addi	a0,a0,964 # 800299e8 <tickslock>
    8000462c:	ffffd097          	auipc	ra,0xffffd
    80004630:	d62080e7          	jalr	-670(ra) # 8000138e <release>
      return -1;
    80004634:	57fd                	li	a5,-1
    80004636:	a0b1                	j	80004682 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004638:	00025597          	auipc	a1,0x25
    8000463c:	3b058593          	addi	a1,a1,944 # 800299e8 <tickslock>
    80004640:	00007517          	auipc	a0,0x7
    80004644:	30850513          	addi	a0,a0,776 # 8000b948 <ticks>
    80004648:	fffff097          	auipc	ra,0xfffff
    8000464c:	040080e7          	jalr	64(ra) # 80003688 <sleep>
  while(ticks - ticks0 < n){
    80004650:	00007797          	auipc	a5,0x7
    80004654:	2f878793          	addi	a5,a5,760 # 8000b948 <ticks>
    80004658:	4398                	lw	a4,0(a5)
    8000465a:	fec42783          	lw	a5,-20(s0)
    8000465e:	40f707bb          	subw	a5,a4,a5
    80004662:	0007871b          	sext.w	a4,a5
    80004666:	fe842783          	lw	a5,-24(s0)
    8000466a:	2781                	sext.w	a5,a5
    8000466c:	faf760e3          	bltu	a4,a5,8000460c <sys_sleep+0x38>
  }
  release(&tickslock);
    80004670:	00025517          	auipc	a0,0x25
    80004674:	37850513          	addi	a0,a0,888 # 800299e8 <tickslock>
    80004678:	ffffd097          	auipc	ra,0xffffd
    8000467c:	d16080e7          	jalr	-746(ra) # 8000138e <release>
  return 0;
    80004680:	4781                	li	a5,0
}
    80004682:	853e                	mv	a0,a5
    80004684:	60e2                	ld	ra,24(sp)
    80004686:	6442                	ld	s0,16(sp)
    80004688:	6105                	addi	sp,sp,32
    8000468a:	8082                	ret

000000008000468c <sys_kill>:

uint64
sys_kill(void)
{
    8000468c:	1101                	addi	sp,sp,-32
    8000468e:	ec06                	sd	ra,24(sp)
    80004690:	e822                	sd	s0,16(sp)
    80004692:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    80004694:	fec40793          	addi	a5,s0,-20
    80004698:	85be                	mv	a1,a5
    8000469a:	4501                	li	a0,0
    8000469c:	00000097          	auipc	ra,0x0
    800046a0:	ce8080e7          	jalr	-792(ra) # 80004384 <argint>
  return kill(pid);
    800046a4:	fec42783          	lw	a5,-20(s0)
    800046a8:	853e                	mv	a0,a5
    800046aa:	fffff097          	auipc	ra,0xfffff
    800046ae:	112080e7          	jalr	274(ra) # 800037bc <kill>
    800046b2:	87aa                	mv	a5,a0
}
    800046b4:	853e                	mv	a0,a5
    800046b6:	60e2                	ld	ra,24(sp)
    800046b8:	6442                	ld	s0,16(sp)
    800046ba:	6105                	addi	sp,sp,32
    800046bc:	8082                	ret

00000000800046be <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800046be:	1101                	addi	sp,sp,-32
    800046c0:	ec06                	sd	ra,24(sp)
    800046c2:	e822                	sd	s0,16(sp)
    800046c4:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800046c6:	00025517          	auipc	a0,0x25
    800046ca:	32250513          	addi	a0,a0,802 # 800299e8 <tickslock>
    800046ce:	ffffd097          	auipc	ra,0xffffd
    800046d2:	c5c080e7          	jalr	-932(ra) # 8000132a <acquire>
  xticks = ticks;
    800046d6:	00007797          	auipc	a5,0x7
    800046da:	27278793          	addi	a5,a5,626 # 8000b948 <ticks>
    800046de:	439c                	lw	a5,0(a5)
    800046e0:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    800046e4:	00025517          	auipc	a0,0x25
    800046e8:	30450513          	addi	a0,a0,772 # 800299e8 <tickslock>
    800046ec:	ffffd097          	auipc	ra,0xffffd
    800046f0:	ca2080e7          	jalr	-862(ra) # 8000138e <release>
  return xticks;
    800046f4:	fec46783          	lwu	a5,-20(s0)
}
    800046f8:	853e                	mv	a0,a5
    800046fa:	60e2                	ld	ra,24(sp)
    800046fc:	6442                	ld	s0,16(sp)
    800046fe:	6105                	addi	sp,sp,32
    80004700:	8082                	ret

0000000080004702 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004702:	1101                	addi	sp,sp,-32
    80004704:	ec06                	sd	ra,24(sp)
    80004706:	e822                	sd	s0,16(sp)
    80004708:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    8000470a:	00007597          	auipc	a1,0x7
    8000470e:	d2658593          	addi	a1,a1,-730 # 8000b430 <etext+0x430>
    80004712:	00025517          	auipc	a0,0x25
    80004716:	2ee50513          	addi	a0,a0,750 # 80029a00 <bcache>
    8000471a:	ffffd097          	auipc	ra,0xffffd
    8000471e:	be0080e7          	jalr	-1056(ra) # 800012fa <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    80004722:	00025717          	auipc	a4,0x25
    80004726:	2de70713          	addi	a4,a4,734 # 80029a00 <bcache>
    8000472a:	67a1                	lui	a5,0x8
    8000472c:	97ba                	add	a5,a5,a4
    8000472e:	0002d717          	auipc	a4,0x2d
    80004732:	53a70713          	addi	a4,a4,1338 # 80031c68 <bcache+0x8268>
    80004736:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    8000473a:	00025717          	auipc	a4,0x25
    8000473e:	2c670713          	addi	a4,a4,710 # 80029a00 <bcache>
    80004742:	67a1                	lui	a5,0x8
    80004744:	97ba                	add	a5,a5,a4
    80004746:	0002d717          	auipc	a4,0x2d
    8000474a:	52270713          	addi	a4,a4,1314 # 80031c68 <bcache+0x8268>
    8000474e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004752:	00025797          	auipc	a5,0x25
    80004756:	2c678793          	addi	a5,a5,710 # 80029a18 <bcache+0x18>
    8000475a:	fef43423          	sd	a5,-24(s0)
    8000475e:	a895                	j	800047d2 <binit+0xd0>
    b->next = bcache.head.next;
    80004760:	00025717          	auipc	a4,0x25
    80004764:	2a070713          	addi	a4,a4,672 # 80029a00 <bcache>
    80004768:	67a1                	lui	a5,0x8
    8000476a:	97ba                	add	a5,a5,a4
    8000476c:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004770:	fe843783          	ld	a5,-24(s0)
    80004774:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004776:	fe843783          	ld	a5,-24(s0)
    8000477a:	0002d717          	auipc	a4,0x2d
    8000477e:	4ee70713          	addi	a4,a4,1262 # 80031c68 <bcache+0x8268>
    80004782:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004784:	fe843783          	ld	a5,-24(s0)
    80004788:	07c1                	addi	a5,a5,16
    8000478a:	00007597          	auipc	a1,0x7
    8000478e:	cae58593          	addi	a1,a1,-850 # 8000b438 <etext+0x438>
    80004792:	853e                	mv	a0,a5
    80004794:	00002097          	auipc	ra,0x2
    80004798:	034080e7          	jalr	52(ra) # 800067c8 <initsleeplock>
    bcache.head.next->prev = b;
    8000479c:	00025717          	auipc	a4,0x25
    800047a0:	26470713          	addi	a4,a4,612 # 80029a00 <bcache>
    800047a4:	67a1                	lui	a5,0x8
    800047a6:	97ba                	add	a5,a5,a4
    800047a8:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047ac:	fe843703          	ld	a4,-24(s0)
    800047b0:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800047b2:	00025717          	auipc	a4,0x25
    800047b6:	24e70713          	addi	a4,a4,590 # 80029a00 <bcache>
    800047ba:	67a1                	lui	a5,0x8
    800047bc:	97ba                	add	a5,a5,a4
    800047be:	fe843703          	ld	a4,-24(s0)
    800047c2:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800047c6:	fe843783          	ld	a5,-24(s0)
    800047ca:	45878793          	addi	a5,a5,1112
    800047ce:	fef43423          	sd	a5,-24(s0)
    800047d2:	0002d797          	auipc	a5,0x2d
    800047d6:	49678793          	addi	a5,a5,1174 # 80031c68 <bcache+0x8268>
    800047da:	fe843703          	ld	a4,-24(s0)
    800047de:	f8f761e3          	bltu	a4,a5,80004760 <binit+0x5e>
  }
}
    800047e2:	0001                	nop
    800047e4:	0001                	nop
    800047e6:	60e2                	ld	ra,24(sp)
    800047e8:	6442                	ld	s0,16(sp)
    800047ea:	6105                	addi	sp,sp,32
    800047ec:	8082                	ret

00000000800047ee <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800047ee:	7179                	addi	sp,sp,-48
    800047f0:	f406                	sd	ra,40(sp)
    800047f2:	f022                	sd	s0,32(sp)
    800047f4:	1800                	addi	s0,sp,48
    800047f6:	87aa                	mv	a5,a0
    800047f8:	872e                	mv	a4,a1
    800047fa:	fcf42e23          	sw	a5,-36(s0)
    800047fe:	87ba                	mv	a5,a4
    80004800:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004804:	00025517          	auipc	a0,0x25
    80004808:	1fc50513          	addi	a0,a0,508 # 80029a00 <bcache>
    8000480c:	ffffd097          	auipc	ra,0xffffd
    80004810:	b1e080e7          	jalr	-1250(ra) # 8000132a <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004814:	00025717          	auipc	a4,0x25
    80004818:	1ec70713          	addi	a4,a4,492 # 80029a00 <bcache>
    8000481c:	67a1                	lui	a5,0x8
    8000481e:	97ba                	add	a5,a5,a4
    80004820:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004824:	fef43423          	sd	a5,-24(s0)
    80004828:	a095                	j	8000488c <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    8000482a:	fe843783          	ld	a5,-24(s0)
    8000482e:	4798                	lw	a4,8(a5)
    80004830:	fdc42783          	lw	a5,-36(s0)
    80004834:	2781                	sext.w	a5,a5
    80004836:	04e79663          	bne	a5,a4,80004882 <bget+0x94>
    8000483a:	fe843783          	ld	a5,-24(s0)
    8000483e:	47d8                	lw	a4,12(a5)
    80004840:	fd842783          	lw	a5,-40(s0)
    80004844:	2781                	sext.w	a5,a5
    80004846:	02e79e63          	bne	a5,a4,80004882 <bget+0x94>
      b->refcnt++;
    8000484a:	fe843783          	ld	a5,-24(s0)
    8000484e:	43bc                	lw	a5,64(a5)
    80004850:	2785                	addiw	a5,a5,1
    80004852:	0007871b          	sext.w	a4,a5
    80004856:	fe843783          	ld	a5,-24(s0)
    8000485a:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000485c:	00025517          	auipc	a0,0x25
    80004860:	1a450513          	addi	a0,a0,420 # 80029a00 <bcache>
    80004864:	ffffd097          	auipc	ra,0xffffd
    80004868:	b2a080e7          	jalr	-1238(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    8000486c:	fe843783          	ld	a5,-24(s0)
    80004870:	07c1                	addi	a5,a5,16
    80004872:	853e                	mv	a0,a5
    80004874:	00002097          	auipc	ra,0x2
    80004878:	fa0080e7          	jalr	-96(ra) # 80006814 <acquiresleep>
      return b;
    8000487c:	fe843783          	ld	a5,-24(s0)
    80004880:	a07d                	j	8000492e <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004882:	fe843783          	ld	a5,-24(s0)
    80004886:	6bbc                	ld	a5,80(a5)
    80004888:	fef43423          	sd	a5,-24(s0)
    8000488c:	fe843703          	ld	a4,-24(s0)
    80004890:	0002d797          	auipc	a5,0x2d
    80004894:	3d878793          	addi	a5,a5,984 # 80031c68 <bcache+0x8268>
    80004898:	f8f719e3          	bne	a4,a5,8000482a <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000489c:	00025717          	auipc	a4,0x25
    800048a0:	16470713          	addi	a4,a4,356 # 80029a00 <bcache>
    800048a4:	67a1                	lui	a5,0x8
    800048a6:	97ba                	add	a5,a5,a4
    800048a8:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    800048ac:	fef43423          	sd	a5,-24(s0)
    800048b0:	a8b9                	j	8000490e <bget+0x120>
    if(b->refcnt == 0) {
    800048b2:	fe843783          	ld	a5,-24(s0)
    800048b6:	43bc                	lw	a5,64(a5)
    800048b8:	e7b1                	bnez	a5,80004904 <bget+0x116>
      b->dev = dev;
    800048ba:	fe843783          	ld	a5,-24(s0)
    800048be:	fdc42703          	lw	a4,-36(s0)
    800048c2:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    800048c4:	fe843783          	ld	a5,-24(s0)
    800048c8:	fd842703          	lw	a4,-40(s0)
    800048cc:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    800048ce:	fe843783          	ld	a5,-24(s0)
    800048d2:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    800048d6:	fe843783          	ld	a5,-24(s0)
    800048da:	4705                	li	a4,1
    800048dc:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800048de:	00025517          	auipc	a0,0x25
    800048e2:	12250513          	addi	a0,a0,290 # 80029a00 <bcache>
    800048e6:	ffffd097          	auipc	ra,0xffffd
    800048ea:	aa8080e7          	jalr	-1368(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    800048ee:	fe843783          	ld	a5,-24(s0)
    800048f2:	07c1                	addi	a5,a5,16
    800048f4:	853e                	mv	a0,a5
    800048f6:	00002097          	auipc	ra,0x2
    800048fa:	f1e080e7          	jalr	-226(ra) # 80006814 <acquiresleep>
      return b;
    800048fe:	fe843783          	ld	a5,-24(s0)
    80004902:	a035                	j	8000492e <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004904:	fe843783          	ld	a5,-24(s0)
    80004908:	67bc                	ld	a5,72(a5)
    8000490a:	fef43423          	sd	a5,-24(s0)
    8000490e:	fe843703          	ld	a4,-24(s0)
    80004912:	0002d797          	auipc	a5,0x2d
    80004916:	35678793          	addi	a5,a5,854 # 80031c68 <bcache+0x8268>
    8000491a:	f8f71ce3          	bne	a4,a5,800048b2 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    8000491e:	00007517          	auipc	a0,0x7
    80004922:	b2250513          	addi	a0,a0,-1246 # 8000b440 <etext+0x440>
    80004926:	ffffc097          	auipc	ra,0xffffc
    8000492a:	366080e7          	jalr	870(ra) # 80000c8c <panic>
}
    8000492e:	853e                	mv	a0,a5
    80004930:	70a2                	ld	ra,40(sp)
    80004932:	7402                	ld	s0,32(sp)
    80004934:	6145                	addi	sp,sp,48
    80004936:	8082                	ret

0000000080004938 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004938:	7179                	addi	sp,sp,-48
    8000493a:	f406                	sd	ra,40(sp)
    8000493c:	f022                	sd	s0,32(sp)
    8000493e:	1800                	addi	s0,sp,48
    80004940:	87aa                	mv	a5,a0
    80004942:	872e                	mv	a4,a1
    80004944:	fcf42e23          	sw	a5,-36(s0)
    80004948:	87ba                	mv	a5,a4
    8000494a:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    8000494e:	fd842703          	lw	a4,-40(s0)
    80004952:	fdc42783          	lw	a5,-36(s0)
    80004956:	85ba                	mv	a1,a4
    80004958:	853e                	mv	a0,a5
    8000495a:	00000097          	auipc	ra,0x0
    8000495e:	e94080e7          	jalr	-364(ra) # 800047ee <bget>
    80004962:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004966:	fe843783          	ld	a5,-24(s0)
    8000496a:	439c                	lw	a5,0(a5)
    8000496c:	ef91                	bnez	a5,80004988 <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    8000496e:	4681                	li	a3,0
    80004970:	4601                	li	a2,0
    80004972:	fe843583          	ld	a1,-24(s0)
    80004976:	4501                	li	a0,0
    80004978:	00005097          	auipc	ra,0x5
    8000497c:	d1a080e7          	jalr	-742(ra) # 80009692 <virtio_disk_rw>
    b->valid = 1;
    80004980:	fe843783          	ld	a5,-24(s0)
    80004984:	4705                	li	a4,1
    80004986:	c398                	sw	a4,0(a5)
  }
  return b;
    80004988:	fe843783          	ld	a5,-24(s0)
}
    8000498c:	853e                	mv	a0,a5
    8000498e:	70a2                	ld	ra,40(sp)
    80004990:	7402                	ld	s0,32(sp)
    80004992:	6145                	addi	sp,sp,48
    80004994:	8082                	ret

0000000080004996 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004996:	1101                	addi	sp,sp,-32
    80004998:	ec06                	sd	ra,24(sp)
    8000499a:	e822                	sd	s0,16(sp)
    8000499c:	1000                	addi	s0,sp,32
    8000499e:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800049a2:	fe843783          	ld	a5,-24(s0)
    800049a6:	07c1                	addi	a5,a5,16
    800049a8:	853e                	mv	a0,a5
    800049aa:	00002097          	auipc	ra,0x2
    800049ae:	f2a080e7          	jalr	-214(ra) # 800068d4 <holdingsleep>
    800049b2:	87aa                	mv	a5,a0
    800049b4:	eb89                	bnez	a5,800049c6 <bwrite+0x30>
    panic("bwrite");
    800049b6:	00007517          	auipc	a0,0x7
    800049ba:	aa250513          	addi	a0,a0,-1374 # 8000b458 <etext+0x458>
    800049be:	ffffc097          	auipc	ra,0xffffc
    800049c2:	2ce080e7          	jalr	718(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    800049c6:	4681                	li	a3,0
    800049c8:	4605                	li	a2,1
    800049ca:	fe843583          	ld	a1,-24(s0)
    800049ce:	4501                	li	a0,0
    800049d0:	00005097          	auipc	ra,0x5
    800049d4:	cc2080e7          	jalr	-830(ra) # 80009692 <virtio_disk_rw>
}
    800049d8:	0001                	nop
    800049da:	60e2                	ld	ra,24(sp)
    800049dc:	6442                	ld	s0,16(sp)
    800049de:	6105                	addi	sp,sp,32
    800049e0:	8082                	ret

00000000800049e2 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    800049e2:	1101                	addi	sp,sp,-32
    800049e4:	ec06                	sd	ra,24(sp)
    800049e6:	e822                	sd	s0,16(sp)
    800049e8:	1000                	addi	s0,sp,32
    800049ea:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800049ee:	fe843783          	ld	a5,-24(s0)
    800049f2:	07c1                	addi	a5,a5,16
    800049f4:	853e                	mv	a0,a5
    800049f6:	00002097          	auipc	ra,0x2
    800049fa:	ede080e7          	jalr	-290(ra) # 800068d4 <holdingsleep>
    800049fe:	87aa                	mv	a5,a0
    80004a00:	eb89                	bnez	a5,80004a12 <brelse+0x30>
    panic("brelse");
    80004a02:	00007517          	auipc	a0,0x7
    80004a06:	a5e50513          	addi	a0,a0,-1442 # 8000b460 <etext+0x460>
    80004a0a:	ffffc097          	auipc	ra,0xffffc
    80004a0e:	282080e7          	jalr	642(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    80004a12:	fe843783          	ld	a5,-24(s0)
    80004a16:	07c1                	addi	a5,a5,16
    80004a18:	853e                	mv	a0,a5
    80004a1a:	00002097          	auipc	ra,0x2
    80004a1e:	e68080e7          	jalr	-408(ra) # 80006882 <releasesleep>

  acquire(&bcache.lock);
    80004a22:	00025517          	auipc	a0,0x25
    80004a26:	fde50513          	addi	a0,a0,-34 # 80029a00 <bcache>
    80004a2a:	ffffd097          	auipc	ra,0xffffd
    80004a2e:	900080e7          	jalr	-1792(ra) # 8000132a <acquire>
  b->refcnt--;
    80004a32:	fe843783          	ld	a5,-24(s0)
    80004a36:	43bc                	lw	a5,64(a5)
    80004a38:	37fd                	addiw	a5,a5,-1
    80004a3a:	0007871b          	sext.w	a4,a5
    80004a3e:	fe843783          	ld	a5,-24(s0)
    80004a42:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004a44:	fe843783          	ld	a5,-24(s0)
    80004a48:	43bc                	lw	a5,64(a5)
    80004a4a:	e7b5                	bnez	a5,80004ab6 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004a4c:	fe843783          	ld	a5,-24(s0)
    80004a50:	6bbc                	ld	a5,80(a5)
    80004a52:	fe843703          	ld	a4,-24(s0)
    80004a56:	6738                	ld	a4,72(a4)
    80004a58:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004a5a:	fe843783          	ld	a5,-24(s0)
    80004a5e:	67bc                	ld	a5,72(a5)
    80004a60:	fe843703          	ld	a4,-24(s0)
    80004a64:	6b38                	ld	a4,80(a4)
    80004a66:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004a68:	00025717          	auipc	a4,0x25
    80004a6c:	f9870713          	addi	a4,a4,-104 # 80029a00 <bcache>
    80004a70:	67a1                	lui	a5,0x8
    80004a72:	97ba                	add	a5,a5,a4
    80004a74:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a78:	fe843783          	ld	a5,-24(s0)
    80004a7c:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004a7e:	fe843783          	ld	a5,-24(s0)
    80004a82:	0002d717          	auipc	a4,0x2d
    80004a86:	1e670713          	addi	a4,a4,486 # 80031c68 <bcache+0x8268>
    80004a8a:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004a8c:	00025717          	auipc	a4,0x25
    80004a90:	f7470713          	addi	a4,a4,-140 # 80029a00 <bcache>
    80004a94:	67a1                	lui	a5,0x8
    80004a96:	97ba                	add	a5,a5,a4
    80004a98:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a9c:	fe843703          	ld	a4,-24(s0)
    80004aa0:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004aa2:	00025717          	auipc	a4,0x25
    80004aa6:	f5e70713          	addi	a4,a4,-162 # 80029a00 <bcache>
    80004aaa:	67a1                	lui	a5,0x8
    80004aac:	97ba                	add	a5,a5,a4
    80004aae:	fe843703          	ld	a4,-24(s0)
    80004ab2:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004ab6:	00025517          	auipc	a0,0x25
    80004aba:	f4a50513          	addi	a0,a0,-182 # 80029a00 <bcache>
    80004abe:	ffffd097          	auipc	ra,0xffffd
    80004ac2:	8d0080e7          	jalr	-1840(ra) # 8000138e <release>
}
    80004ac6:	0001                	nop
    80004ac8:	60e2                	ld	ra,24(sp)
    80004aca:	6442                	ld	s0,16(sp)
    80004acc:	6105                	addi	sp,sp,32
    80004ace:	8082                	ret

0000000080004ad0 <bpin>:

void
bpin(struct buf *b) {
    80004ad0:	1101                	addi	sp,sp,-32
    80004ad2:	ec06                	sd	ra,24(sp)
    80004ad4:	e822                	sd	s0,16(sp)
    80004ad6:	1000                	addi	s0,sp,32
    80004ad8:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004adc:	00025517          	auipc	a0,0x25
    80004ae0:	f2450513          	addi	a0,a0,-220 # 80029a00 <bcache>
    80004ae4:	ffffd097          	auipc	ra,0xffffd
    80004ae8:	846080e7          	jalr	-1978(ra) # 8000132a <acquire>
  b->refcnt++;
    80004aec:	fe843783          	ld	a5,-24(s0)
    80004af0:	43bc                	lw	a5,64(a5)
    80004af2:	2785                	addiw	a5,a5,1
    80004af4:	0007871b          	sext.w	a4,a5
    80004af8:	fe843783          	ld	a5,-24(s0)
    80004afc:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004afe:	00025517          	auipc	a0,0x25
    80004b02:	f0250513          	addi	a0,a0,-254 # 80029a00 <bcache>
    80004b06:	ffffd097          	auipc	ra,0xffffd
    80004b0a:	888080e7          	jalr	-1912(ra) # 8000138e <release>
}
    80004b0e:	0001                	nop
    80004b10:	60e2                	ld	ra,24(sp)
    80004b12:	6442                	ld	s0,16(sp)
    80004b14:	6105                	addi	sp,sp,32
    80004b16:	8082                	ret

0000000080004b18 <bunpin>:

void
bunpin(struct buf *b) {
    80004b18:	1101                	addi	sp,sp,-32
    80004b1a:	ec06                	sd	ra,24(sp)
    80004b1c:	e822                	sd	s0,16(sp)
    80004b1e:	1000                	addi	s0,sp,32
    80004b20:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004b24:	00025517          	auipc	a0,0x25
    80004b28:	edc50513          	addi	a0,a0,-292 # 80029a00 <bcache>
    80004b2c:	ffffc097          	auipc	ra,0xffffc
    80004b30:	7fe080e7          	jalr	2046(ra) # 8000132a <acquire>
  b->refcnt--;
    80004b34:	fe843783          	ld	a5,-24(s0)
    80004b38:	43bc                	lw	a5,64(a5)
    80004b3a:	37fd                	addiw	a5,a5,-1
    80004b3c:	0007871b          	sext.w	a4,a5
    80004b40:	fe843783          	ld	a5,-24(s0)
    80004b44:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004b46:	00025517          	auipc	a0,0x25
    80004b4a:	eba50513          	addi	a0,a0,-326 # 80029a00 <bcache>
    80004b4e:	ffffd097          	auipc	ra,0xffffd
    80004b52:	840080e7          	jalr	-1984(ra) # 8000138e <release>
}
    80004b56:	0001                	nop
    80004b58:	60e2                	ld	ra,24(sp)
    80004b5a:	6442                	ld	s0,16(sp)
    80004b5c:	6105                	addi	sp,sp,32
    80004b5e:	8082                	ret

0000000080004b60 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004b60:	7179                	addi	sp,sp,-48
    80004b62:	f406                	sd	ra,40(sp)
    80004b64:	f022                	sd	s0,32(sp)
    80004b66:	1800                	addi	s0,sp,48
    80004b68:	87aa                	mv	a5,a0
    80004b6a:	fcb43823          	sd	a1,-48(s0)
    80004b6e:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004b72:	fdc42783          	lw	a5,-36(s0)
    80004b76:	4585                	li	a1,1
    80004b78:	853e                	mv	a0,a5
    80004b7a:	00000097          	auipc	ra,0x0
    80004b7e:	dbe080e7          	jalr	-578(ra) # 80004938 <bread>
    80004b82:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004b86:	fe843783          	ld	a5,-24(s0)
    80004b8a:	05878793          	addi	a5,a5,88
    80004b8e:	02000613          	li	a2,32
    80004b92:	85be                	mv	a1,a5
    80004b94:	fd043503          	ld	a0,-48(s0)
    80004b98:	ffffd097          	auipc	ra,0xffffd
    80004b9c:	a4a080e7          	jalr	-1462(ra) # 800015e2 <memmove>
  brelse(bp);
    80004ba0:	fe843503          	ld	a0,-24(s0)
    80004ba4:	00000097          	auipc	ra,0x0
    80004ba8:	e3e080e7          	jalr	-450(ra) # 800049e2 <brelse>
}
    80004bac:	0001                	nop
    80004bae:	70a2                	ld	ra,40(sp)
    80004bb0:	7402                	ld	s0,32(sp)
    80004bb2:	6145                	addi	sp,sp,48
    80004bb4:	8082                	ret

0000000080004bb6 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004bb6:	1101                	addi	sp,sp,-32
    80004bb8:	ec06                	sd	ra,24(sp)
    80004bba:	e822                	sd	s0,16(sp)
    80004bbc:	1000                	addi	s0,sp,32
    80004bbe:	87aa                	mv	a5,a0
    80004bc0:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004bc4:	fec42783          	lw	a5,-20(s0)
    80004bc8:	0002d597          	auipc	a1,0x2d
    80004bcc:	4f858593          	addi	a1,a1,1272 # 800320c0 <sb>
    80004bd0:	853e                	mv	a0,a5
    80004bd2:	00000097          	auipc	ra,0x0
    80004bd6:	f8e080e7          	jalr	-114(ra) # 80004b60 <readsb>
  if(sb.magic != FSMAGIC)
    80004bda:	0002d797          	auipc	a5,0x2d
    80004bde:	4e678793          	addi	a5,a5,1254 # 800320c0 <sb>
    80004be2:	439c                	lw	a5,0(a5)
    80004be4:	873e                	mv	a4,a5
    80004be6:	102037b7          	lui	a5,0x10203
    80004bea:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004bee:	00f70a63          	beq	a4,a5,80004c02 <fsinit+0x4c>
    panic("invalid file system");
    80004bf2:	00007517          	auipc	a0,0x7
    80004bf6:	87650513          	addi	a0,a0,-1930 # 8000b468 <etext+0x468>
    80004bfa:	ffffc097          	auipc	ra,0xffffc
    80004bfe:	092080e7          	jalr	146(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004c02:	fec42783          	lw	a5,-20(s0)
    80004c06:	0002d597          	auipc	a1,0x2d
    80004c0a:	4ba58593          	addi	a1,a1,1210 # 800320c0 <sb>
    80004c0e:	853e                	mv	a0,a5
    80004c10:	00001097          	auipc	ra,0x1
    80004c14:	49c080e7          	jalr	1180(ra) # 800060ac <initlog>
}
    80004c18:	0001                	nop
    80004c1a:	60e2                	ld	ra,24(sp)
    80004c1c:	6442                	ld	s0,16(sp)
    80004c1e:	6105                	addi	sp,sp,32
    80004c20:	8082                	ret

0000000080004c22 <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004c22:	7179                	addi	sp,sp,-48
    80004c24:	f406                	sd	ra,40(sp)
    80004c26:	f022                	sd	s0,32(sp)
    80004c28:	1800                	addi	s0,sp,48
    80004c2a:	87aa                	mv	a5,a0
    80004c2c:	872e                	mv	a4,a1
    80004c2e:	fcf42e23          	sw	a5,-36(s0)
    80004c32:	87ba                	mv	a5,a4
    80004c34:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004c38:	fdc42783          	lw	a5,-36(s0)
    80004c3c:	fd842703          	lw	a4,-40(s0)
    80004c40:	85ba                	mv	a1,a4
    80004c42:	853e                	mv	a0,a5
    80004c44:	00000097          	auipc	ra,0x0
    80004c48:	cf4080e7          	jalr	-780(ra) # 80004938 <bread>
    80004c4c:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004c50:	fe843783          	ld	a5,-24(s0)
    80004c54:	05878793          	addi	a5,a5,88
    80004c58:	40000613          	li	a2,1024
    80004c5c:	4581                	li	a1,0
    80004c5e:	853e                	mv	a0,a5
    80004c60:	ffffd097          	auipc	ra,0xffffd
    80004c64:	89e080e7          	jalr	-1890(ra) # 800014fe <memset>
  log_write(bp);
    80004c68:	fe843503          	ld	a0,-24(s0)
    80004c6c:	00002097          	auipc	ra,0x2
    80004c70:	a28080e7          	jalr	-1496(ra) # 80006694 <log_write>
  brelse(bp);
    80004c74:	fe843503          	ld	a0,-24(s0)
    80004c78:	00000097          	auipc	ra,0x0
    80004c7c:	d6a080e7          	jalr	-662(ra) # 800049e2 <brelse>
}
    80004c80:	0001                	nop
    80004c82:	70a2                	ld	ra,40(sp)
    80004c84:	7402                	ld	s0,32(sp)
    80004c86:	6145                	addi	sp,sp,48
    80004c88:	8082                	ret

0000000080004c8a <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004c8a:	7139                	addi	sp,sp,-64
    80004c8c:	fc06                	sd	ra,56(sp)
    80004c8e:	f822                	sd	s0,48(sp)
    80004c90:	0080                	addi	s0,sp,64
    80004c92:	87aa                	mv	a5,a0
    80004c94:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004c98:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004c9c:	fe042623          	sw	zero,-20(s0)
    80004ca0:	a2b5                	j	80004e0c <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004ca2:	fec42783          	lw	a5,-20(s0)
    80004ca6:	41f7d71b          	sraiw	a4,a5,0x1f
    80004caa:	0137571b          	srliw	a4,a4,0x13
    80004cae:	9fb9                	addw	a5,a5,a4
    80004cb0:	40d7d79b          	sraiw	a5,a5,0xd
    80004cb4:	2781                	sext.w	a5,a5
    80004cb6:	0007871b          	sext.w	a4,a5
    80004cba:	0002d797          	auipc	a5,0x2d
    80004cbe:	40678793          	addi	a5,a5,1030 # 800320c0 <sb>
    80004cc2:	4fdc                	lw	a5,28(a5)
    80004cc4:	9fb9                	addw	a5,a5,a4
    80004cc6:	0007871b          	sext.w	a4,a5
    80004cca:	fcc42783          	lw	a5,-52(s0)
    80004cce:	85ba                	mv	a1,a4
    80004cd0:	853e                	mv	a0,a5
    80004cd2:	00000097          	auipc	ra,0x0
    80004cd6:	c66080e7          	jalr	-922(ra) # 80004938 <bread>
    80004cda:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004cde:	fe042423          	sw	zero,-24(s0)
    80004ce2:	a0dd                	j	80004dc8 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004ce4:	fe842703          	lw	a4,-24(s0)
    80004ce8:	41f7579b          	sraiw	a5,a4,0x1f
    80004cec:	01d7d79b          	srliw	a5,a5,0x1d
    80004cf0:	9f3d                	addw	a4,a4,a5
    80004cf2:	8b1d                	andi	a4,a4,7
    80004cf4:	40f707bb          	subw	a5,a4,a5
    80004cf8:	2781                	sext.w	a5,a5
    80004cfa:	4705                	li	a4,1
    80004cfc:	00f717bb          	sllw	a5,a4,a5
    80004d00:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004d04:	fe842783          	lw	a5,-24(s0)
    80004d08:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d0c:	01d7571b          	srliw	a4,a4,0x1d
    80004d10:	9fb9                	addw	a5,a5,a4
    80004d12:	4037d79b          	sraiw	a5,a5,0x3
    80004d16:	2781                	sext.w	a5,a5
    80004d18:	fe043703          	ld	a4,-32(s0)
    80004d1c:	97ba                	add	a5,a5,a4
    80004d1e:	0587c783          	lbu	a5,88(a5)
    80004d22:	0007871b          	sext.w	a4,a5
    80004d26:	fdc42783          	lw	a5,-36(s0)
    80004d2a:	8ff9                	and	a5,a5,a4
    80004d2c:	2781                	sext.w	a5,a5
    80004d2e:	ebc1                	bnez	a5,80004dbe <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004d30:	fe842783          	lw	a5,-24(s0)
    80004d34:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d38:	01d7571b          	srliw	a4,a4,0x1d
    80004d3c:	9fb9                	addw	a5,a5,a4
    80004d3e:	4037d79b          	sraiw	a5,a5,0x3
    80004d42:	2781                	sext.w	a5,a5
    80004d44:	fe043703          	ld	a4,-32(s0)
    80004d48:	973e                	add	a4,a4,a5
    80004d4a:	05874703          	lbu	a4,88(a4)
    80004d4e:	0187169b          	slliw	a3,a4,0x18
    80004d52:	4186d69b          	sraiw	a3,a3,0x18
    80004d56:	fdc42703          	lw	a4,-36(s0)
    80004d5a:	0187171b          	slliw	a4,a4,0x18
    80004d5e:	4187571b          	sraiw	a4,a4,0x18
    80004d62:	8f55                	or	a4,a4,a3
    80004d64:	0187171b          	slliw	a4,a4,0x18
    80004d68:	4187571b          	sraiw	a4,a4,0x18
    80004d6c:	0ff77713          	andi	a4,a4,255
    80004d70:	fe043683          	ld	a3,-32(s0)
    80004d74:	97b6                	add	a5,a5,a3
    80004d76:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004d7a:	fe043503          	ld	a0,-32(s0)
    80004d7e:	00002097          	auipc	ra,0x2
    80004d82:	916080e7          	jalr	-1770(ra) # 80006694 <log_write>
        brelse(bp);
    80004d86:	fe043503          	ld	a0,-32(s0)
    80004d8a:	00000097          	auipc	ra,0x0
    80004d8e:	c58080e7          	jalr	-936(ra) # 800049e2 <brelse>
        bzero(dev, b + bi);
    80004d92:	fcc42683          	lw	a3,-52(s0)
    80004d96:	fec42703          	lw	a4,-20(s0)
    80004d9a:	fe842783          	lw	a5,-24(s0)
    80004d9e:	9fb9                	addw	a5,a5,a4
    80004da0:	2781                	sext.w	a5,a5
    80004da2:	85be                	mv	a1,a5
    80004da4:	8536                	mv	a0,a3
    80004da6:	00000097          	auipc	ra,0x0
    80004daa:	e7c080e7          	jalr	-388(ra) # 80004c22 <bzero>
        return b + bi;
    80004dae:	fec42703          	lw	a4,-20(s0)
    80004db2:	fe842783          	lw	a5,-24(s0)
    80004db6:	9fb9                	addw	a5,a5,a4
    80004db8:	2781                	sext.w	a5,a5
    80004dba:	2781                	sext.w	a5,a5
    80004dbc:	a895                	j	80004e30 <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004dbe:	fe842783          	lw	a5,-24(s0)
    80004dc2:	2785                	addiw	a5,a5,1
    80004dc4:	fef42423          	sw	a5,-24(s0)
    80004dc8:	fe842783          	lw	a5,-24(s0)
    80004dcc:	0007871b          	sext.w	a4,a5
    80004dd0:	6789                	lui	a5,0x2
    80004dd2:	02f75163          	bge	a4,a5,80004df4 <balloc+0x16a>
    80004dd6:	fec42703          	lw	a4,-20(s0)
    80004dda:	fe842783          	lw	a5,-24(s0)
    80004dde:	9fb9                	addw	a5,a5,a4
    80004de0:	2781                	sext.w	a5,a5
    80004de2:	0007871b          	sext.w	a4,a5
    80004de6:	0002d797          	auipc	a5,0x2d
    80004dea:	2da78793          	addi	a5,a5,730 # 800320c0 <sb>
    80004dee:	43dc                	lw	a5,4(a5)
    80004df0:	eef76ae3          	bltu	a4,a5,80004ce4 <balloc+0x5a>
      }
    }
    brelse(bp);
    80004df4:	fe043503          	ld	a0,-32(s0)
    80004df8:	00000097          	auipc	ra,0x0
    80004dfc:	bea080e7          	jalr	-1046(ra) # 800049e2 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004e00:	fec42703          	lw	a4,-20(s0)
    80004e04:	6789                	lui	a5,0x2
    80004e06:	9fb9                	addw	a5,a5,a4
    80004e08:	fef42623          	sw	a5,-20(s0)
    80004e0c:	0002d797          	auipc	a5,0x2d
    80004e10:	2b478793          	addi	a5,a5,692 # 800320c0 <sb>
    80004e14:	43d8                	lw	a4,4(a5)
    80004e16:	fec42783          	lw	a5,-20(s0)
    80004e1a:	e8e7e4e3          	bltu	a5,a4,80004ca2 <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004e1e:	00006517          	auipc	a0,0x6
    80004e22:	66250513          	addi	a0,a0,1634 # 8000b480 <etext+0x480>
    80004e26:	ffffc097          	auipc	ra,0xffffc
    80004e2a:	c10080e7          	jalr	-1008(ra) # 80000a36 <printf>
  return 0;
    80004e2e:	4781                	li	a5,0
}
    80004e30:	853e                	mv	a0,a5
    80004e32:	70e2                	ld	ra,56(sp)
    80004e34:	7442                	ld	s0,48(sp)
    80004e36:	6121                	addi	sp,sp,64
    80004e38:	8082                	ret

0000000080004e3a <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004e3a:	7179                	addi	sp,sp,-48
    80004e3c:	f406                	sd	ra,40(sp)
    80004e3e:	f022                	sd	s0,32(sp)
    80004e40:	1800                	addi	s0,sp,48
    80004e42:	87aa                	mv	a5,a0
    80004e44:	872e                	mv	a4,a1
    80004e46:	fcf42e23          	sw	a5,-36(s0)
    80004e4a:	87ba                	mv	a5,a4
    80004e4c:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004e50:	fdc42683          	lw	a3,-36(s0)
    80004e54:	fd842783          	lw	a5,-40(s0)
    80004e58:	00d7d79b          	srliw	a5,a5,0xd
    80004e5c:	0007871b          	sext.w	a4,a5
    80004e60:	0002d797          	auipc	a5,0x2d
    80004e64:	26078793          	addi	a5,a5,608 # 800320c0 <sb>
    80004e68:	4fdc                	lw	a5,28(a5)
    80004e6a:	9fb9                	addw	a5,a5,a4
    80004e6c:	2781                	sext.w	a5,a5
    80004e6e:	85be                	mv	a1,a5
    80004e70:	8536                	mv	a0,a3
    80004e72:	00000097          	auipc	ra,0x0
    80004e76:	ac6080e7          	jalr	-1338(ra) # 80004938 <bread>
    80004e7a:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004e7e:	fd842703          	lw	a4,-40(s0)
    80004e82:	6789                	lui	a5,0x2
    80004e84:	17fd                	addi	a5,a5,-1
    80004e86:	8ff9                	and	a5,a5,a4
    80004e88:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004e8c:	fe442703          	lw	a4,-28(s0)
    80004e90:	41f7579b          	sraiw	a5,a4,0x1f
    80004e94:	01d7d79b          	srliw	a5,a5,0x1d
    80004e98:	9f3d                	addw	a4,a4,a5
    80004e9a:	8b1d                	andi	a4,a4,7
    80004e9c:	40f707bb          	subw	a5,a4,a5
    80004ea0:	2781                	sext.w	a5,a5
    80004ea2:	4705                	li	a4,1
    80004ea4:	00f717bb          	sllw	a5,a4,a5
    80004ea8:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004eac:	fe442783          	lw	a5,-28(s0)
    80004eb0:	41f7d71b          	sraiw	a4,a5,0x1f
    80004eb4:	01d7571b          	srliw	a4,a4,0x1d
    80004eb8:	9fb9                	addw	a5,a5,a4
    80004eba:	4037d79b          	sraiw	a5,a5,0x3
    80004ebe:	2781                	sext.w	a5,a5
    80004ec0:	fe843703          	ld	a4,-24(s0)
    80004ec4:	97ba                	add	a5,a5,a4
    80004ec6:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004eca:	0007871b          	sext.w	a4,a5
    80004ece:	fe042783          	lw	a5,-32(s0)
    80004ed2:	8ff9                	and	a5,a5,a4
    80004ed4:	2781                	sext.w	a5,a5
    80004ed6:	eb89                	bnez	a5,80004ee8 <bfree+0xae>
    panic("freeing free block");
    80004ed8:	00006517          	auipc	a0,0x6
    80004edc:	5c050513          	addi	a0,a0,1472 # 8000b498 <etext+0x498>
    80004ee0:	ffffc097          	auipc	ra,0xffffc
    80004ee4:	dac080e7          	jalr	-596(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    80004ee8:	fe442783          	lw	a5,-28(s0)
    80004eec:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ef0:	01d7571b          	srliw	a4,a4,0x1d
    80004ef4:	9fb9                	addw	a5,a5,a4
    80004ef6:	4037d79b          	sraiw	a5,a5,0x3
    80004efa:	2781                	sext.w	a5,a5
    80004efc:	fe843703          	ld	a4,-24(s0)
    80004f00:	973e                	add	a4,a4,a5
    80004f02:	05874703          	lbu	a4,88(a4)
    80004f06:	0187169b          	slliw	a3,a4,0x18
    80004f0a:	4186d69b          	sraiw	a3,a3,0x18
    80004f0e:	fe042703          	lw	a4,-32(s0)
    80004f12:	0187171b          	slliw	a4,a4,0x18
    80004f16:	4187571b          	sraiw	a4,a4,0x18
    80004f1a:	fff74713          	not	a4,a4
    80004f1e:	0187171b          	slliw	a4,a4,0x18
    80004f22:	4187571b          	sraiw	a4,a4,0x18
    80004f26:	8f75                	and	a4,a4,a3
    80004f28:	0187171b          	slliw	a4,a4,0x18
    80004f2c:	4187571b          	sraiw	a4,a4,0x18
    80004f30:	0ff77713          	andi	a4,a4,255
    80004f34:	fe843683          	ld	a3,-24(s0)
    80004f38:	97b6                	add	a5,a5,a3
    80004f3a:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004f3e:	fe843503          	ld	a0,-24(s0)
    80004f42:	00001097          	auipc	ra,0x1
    80004f46:	752080e7          	jalr	1874(ra) # 80006694 <log_write>
  brelse(bp);
    80004f4a:	fe843503          	ld	a0,-24(s0)
    80004f4e:	00000097          	auipc	ra,0x0
    80004f52:	a94080e7          	jalr	-1388(ra) # 800049e2 <brelse>
}
    80004f56:	0001                	nop
    80004f58:	70a2                	ld	ra,40(sp)
    80004f5a:	7402                	ld	s0,32(sp)
    80004f5c:	6145                	addi	sp,sp,48
    80004f5e:	8082                	ret

0000000080004f60 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004f60:	1101                	addi	sp,sp,-32
    80004f62:	ec06                	sd	ra,24(sp)
    80004f64:	e822                	sd	s0,16(sp)
    80004f66:	1000                	addi	s0,sp,32
  int i = 0;
    80004f68:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004f6c:	00006597          	auipc	a1,0x6
    80004f70:	54458593          	addi	a1,a1,1348 # 8000b4b0 <etext+0x4b0>
    80004f74:	0002d517          	auipc	a0,0x2d
    80004f78:	16c50513          	addi	a0,a0,364 # 800320e0 <itable>
    80004f7c:	ffffc097          	auipc	ra,0xffffc
    80004f80:	37e080e7          	jalr	894(ra) # 800012fa <initlock>
  for(i = 0; i < NINODE; i++) {
    80004f84:	fe042623          	sw	zero,-20(s0)
    80004f88:	a82d                	j	80004fc2 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004f8a:	fec42703          	lw	a4,-20(s0)
    80004f8e:	87ba                	mv	a5,a4
    80004f90:	0792                	slli	a5,a5,0x4
    80004f92:	97ba                	add	a5,a5,a4
    80004f94:	078e                	slli	a5,a5,0x3
    80004f96:	02078713          	addi	a4,a5,32
    80004f9a:	0002d797          	auipc	a5,0x2d
    80004f9e:	14678793          	addi	a5,a5,326 # 800320e0 <itable>
    80004fa2:	97ba                	add	a5,a5,a4
    80004fa4:	07a1                	addi	a5,a5,8
    80004fa6:	00006597          	auipc	a1,0x6
    80004faa:	51258593          	addi	a1,a1,1298 # 8000b4b8 <etext+0x4b8>
    80004fae:	853e                	mv	a0,a5
    80004fb0:	00002097          	auipc	ra,0x2
    80004fb4:	818080e7          	jalr	-2024(ra) # 800067c8 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004fb8:	fec42783          	lw	a5,-20(s0)
    80004fbc:	2785                	addiw	a5,a5,1
    80004fbe:	fef42623          	sw	a5,-20(s0)
    80004fc2:	fec42783          	lw	a5,-20(s0)
    80004fc6:	0007871b          	sext.w	a4,a5
    80004fca:	03100793          	li	a5,49
    80004fce:	fae7dee3          	bge	a5,a4,80004f8a <iinit+0x2a>
  }
}
    80004fd2:	0001                	nop
    80004fd4:	0001                	nop
    80004fd6:	60e2                	ld	ra,24(sp)
    80004fd8:	6442                	ld	s0,16(sp)
    80004fda:	6105                	addi	sp,sp,32
    80004fdc:	8082                	ret

0000000080004fde <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004fde:	7139                	addi	sp,sp,-64
    80004fe0:	fc06                	sd	ra,56(sp)
    80004fe2:	f822                	sd	s0,48(sp)
    80004fe4:	0080                	addi	s0,sp,64
    80004fe6:	87aa                	mv	a5,a0
    80004fe8:	872e                	mv	a4,a1
    80004fea:	fcf42623          	sw	a5,-52(s0)
    80004fee:	87ba                	mv	a5,a4
    80004ff0:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004ff4:	4785                	li	a5,1
    80004ff6:	fef42623          	sw	a5,-20(s0)
    80004ffa:	a855                	j	800050ae <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004ffc:	fec42783          	lw	a5,-20(s0)
    80005000:	8391                	srli	a5,a5,0x4
    80005002:	0007871b          	sext.w	a4,a5
    80005006:	0002d797          	auipc	a5,0x2d
    8000500a:	0ba78793          	addi	a5,a5,186 # 800320c0 <sb>
    8000500e:	4f9c                	lw	a5,24(a5)
    80005010:	9fb9                	addw	a5,a5,a4
    80005012:	0007871b          	sext.w	a4,a5
    80005016:	fcc42783          	lw	a5,-52(s0)
    8000501a:	85ba                	mv	a1,a4
    8000501c:	853e                	mv	a0,a5
    8000501e:	00000097          	auipc	ra,0x0
    80005022:	91a080e7          	jalr	-1766(ra) # 80004938 <bread>
    80005026:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    8000502a:	fe043783          	ld	a5,-32(s0)
    8000502e:	05878713          	addi	a4,a5,88
    80005032:	fec42783          	lw	a5,-20(s0)
    80005036:	8bbd                	andi	a5,a5,15
    80005038:	079a                	slli	a5,a5,0x6
    8000503a:	97ba                	add	a5,a5,a4
    8000503c:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80005040:	fd843783          	ld	a5,-40(s0)
    80005044:	00079783          	lh	a5,0(a5)
    80005048:	eba1                	bnez	a5,80005098 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    8000504a:	04000613          	li	a2,64
    8000504e:	4581                	li	a1,0
    80005050:	fd843503          	ld	a0,-40(s0)
    80005054:	ffffc097          	auipc	ra,0xffffc
    80005058:	4aa080e7          	jalr	1194(ra) # 800014fe <memset>
      dip->type = type;
    8000505c:	fd843783          	ld	a5,-40(s0)
    80005060:	fca45703          	lhu	a4,-54(s0)
    80005064:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005068:	fe043503          	ld	a0,-32(s0)
    8000506c:	00001097          	auipc	ra,0x1
    80005070:	628080e7          	jalr	1576(ra) # 80006694 <log_write>
      brelse(bp);
    80005074:	fe043503          	ld	a0,-32(s0)
    80005078:	00000097          	auipc	ra,0x0
    8000507c:	96a080e7          	jalr	-1686(ra) # 800049e2 <brelse>
      return iget(dev, inum);
    80005080:	fec42703          	lw	a4,-20(s0)
    80005084:	fcc42783          	lw	a5,-52(s0)
    80005088:	85ba                	mv	a1,a4
    8000508a:	853e                	mv	a0,a5
    8000508c:	00000097          	auipc	ra,0x0
    80005090:	138080e7          	jalr	312(ra) # 800051c4 <iget>
    80005094:	87aa                	mv	a5,a0
    80005096:	a835                	j	800050d2 <ialloc+0xf4>
    }
    brelse(bp);
    80005098:	fe043503          	ld	a0,-32(s0)
    8000509c:	00000097          	auipc	ra,0x0
    800050a0:	946080e7          	jalr	-1722(ra) # 800049e2 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    800050a4:	fec42783          	lw	a5,-20(s0)
    800050a8:	2785                	addiw	a5,a5,1
    800050aa:	fef42623          	sw	a5,-20(s0)
    800050ae:	0002d797          	auipc	a5,0x2d
    800050b2:	01278793          	addi	a5,a5,18 # 800320c0 <sb>
    800050b6:	47d8                	lw	a4,12(a5)
    800050b8:	fec42783          	lw	a5,-20(s0)
    800050bc:	f4e7e0e3          	bltu	a5,a4,80004ffc <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    800050c0:	00006517          	auipc	a0,0x6
    800050c4:	40050513          	addi	a0,a0,1024 # 8000b4c0 <etext+0x4c0>
    800050c8:	ffffc097          	auipc	ra,0xffffc
    800050cc:	96e080e7          	jalr	-1682(ra) # 80000a36 <printf>
  return 0;
    800050d0:	4781                	li	a5,0
}
    800050d2:	853e                	mv	a0,a5
    800050d4:	70e2                	ld	ra,56(sp)
    800050d6:	7442                	ld	s0,48(sp)
    800050d8:	6121                	addi	sp,sp,64
    800050da:	8082                	ret

00000000800050dc <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    800050dc:	7179                	addi	sp,sp,-48
    800050de:	f406                	sd	ra,40(sp)
    800050e0:	f022                	sd	s0,32(sp)
    800050e2:	1800                	addi	s0,sp,48
    800050e4:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800050e8:	fd843783          	ld	a5,-40(s0)
    800050ec:	4394                	lw	a3,0(a5)
    800050ee:	fd843783          	ld	a5,-40(s0)
    800050f2:	43dc                	lw	a5,4(a5)
    800050f4:	0047d79b          	srliw	a5,a5,0x4
    800050f8:	0007871b          	sext.w	a4,a5
    800050fc:	0002d797          	auipc	a5,0x2d
    80005100:	fc478793          	addi	a5,a5,-60 # 800320c0 <sb>
    80005104:	4f9c                	lw	a5,24(a5)
    80005106:	9fb9                	addw	a5,a5,a4
    80005108:	2781                	sext.w	a5,a5
    8000510a:	85be                	mv	a1,a5
    8000510c:	8536                	mv	a0,a3
    8000510e:	00000097          	auipc	ra,0x0
    80005112:	82a080e7          	jalr	-2006(ra) # 80004938 <bread>
    80005116:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000511a:	fe843783          	ld	a5,-24(s0)
    8000511e:	05878713          	addi	a4,a5,88
    80005122:	fd843783          	ld	a5,-40(s0)
    80005126:	43dc                	lw	a5,4(a5)
    80005128:	1782                	slli	a5,a5,0x20
    8000512a:	9381                	srli	a5,a5,0x20
    8000512c:	8bbd                	andi	a5,a5,15
    8000512e:	079a                	slli	a5,a5,0x6
    80005130:	97ba                	add	a5,a5,a4
    80005132:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80005136:	fd843783          	ld	a5,-40(s0)
    8000513a:	04479703          	lh	a4,68(a5)
    8000513e:	fe043783          	ld	a5,-32(s0)
    80005142:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80005146:	fd843783          	ld	a5,-40(s0)
    8000514a:	04679703          	lh	a4,70(a5)
    8000514e:	fe043783          	ld	a5,-32(s0)
    80005152:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80005156:	fd843783          	ld	a5,-40(s0)
    8000515a:	04879703          	lh	a4,72(a5)
    8000515e:	fe043783          	ld	a5,-32(s0)
    80005162:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80005166:	fd843783          	ld	a5,-40(s0)
    8000516a:	04a79703          	lh	a4,74(a5)
    8000516e:	fe043783          	ld	a5,-32(s0)
    80005172:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80005176:	fd843783          	ld	a5,-40(s0)
    8000517a:	47f8                	lw	a4,76(a5)
    8000517c:	fe043783          	ld	a5,-32(s0)
    80005180:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005182:	fe043783          	ld	a5,-32(s0)
    80005186:	00c78713          	addi	a4,a5,12
    8000518a:	fd843783          	ld	a5,-40(s0)
    8000518e:	05078793          	addi	a5,a5,80
    80005192:	03400613          	li	a2,52
    80005196:	85be                	mv	a1,a5
    80005198:	853a                	mv	a0,a4
    8000519a:	ffffc097          	auipc	ra,0xffffc
    8000519e:	448080e7          	jalr	1096(ra) # 800015e2 <memmove>
  log_write(bp);
    800051a2:	fe843503          	ld	a0,-24(s0)
    800051a6:	00001097          	auipc	ra,0x1
    800051aa:	4ee080e7          	jalr	1262(ra) # 80006694 <log_write>
  brelse(bp);
    800051ae:	fe843503          	ld	a0,-24(s0)
    800051b2:	00000097          	auipc	ra,0x0
    800051b6:	830080e7          	jalr	-2000(ra) # 800049e2 <brelse>
}
    800051ba:	0001                	nop
    800051bc:	70a2                	ld	ra,40(sp)
    800051be:	7402                	ld	s0,32(sp)
    800051c0:	6145                	addi	sp,sp,48
    800051c2:	8082                	ret

00000000800051c4 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    800051c4:	7179                	addi	sp,sp,-48
    800051c6:	f406                	sd	ra,40(sp)
    800051c8:	f022                	sd	s0,32(sp)
    800051ca:	1800                	addi	s0,sp,48
    800051cc:	87aa                	mv	a5,a0
    800051ce:	872e                	mv	a4,a1
    800051d0:	fcf42e23          	sw	a5,-36(s0)
    800051d4:	87ba                	mv	a5,a4
    800051d6:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    800051da:	0002d517          	auipc	a0,0x2d
    800051de:	f0650513          	addi	a0,a0,-250 # 800320e0 <itable>
    800051e2:	ffffc097          	auipc	ra,0xffffc
    800051e6:	148080e7          	jalr	328(ra) # 8000132a <acquire>

  // Is the inode already in the table?
  empty = 0;
    800051ea:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800051ee:	0002d797          	auipc	a5,0x2d
    800051f2:	f0a78793          	addi	a5,a5,-246 # 800320f8 <itable+0x18>
    800051f6:	fef43423          	sd	a5,-24(s0)
    800051fa:	a89d                	j	80005270 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800051fc:	fe843783          	ld	a5,-24(s0)
    80005200:	479c                	lw	a5,8(a5)
    80005202:	04f05663          	blez	a5,8000524e <iget+0x8a>
    80005206:	fe843783          	ld	a5,-24(s0)
    8000520a:	4398                	lw	a4,0(a5)
    8000520c:	fdc42783          	lw	a5,-36(s0)
    80005210:	2781                	sext.w	a5,a5
    80005212:	02e79e63          	bne	a5,a4,8000524e <iget+0x8a>
    80005216:	fe843783          	ld	a5,-24(s0)
    8000521a:	43d8                	lw	a4,4(a5)
    8000521c:	fd842783          	lw	a5,-40(s0)
    80005220:	2781                	sext.w	a5,a5
    80005222:	02e79663          	bne	a5,a4,8000524e <iget+0x8a>
      ip->ref++;
    80005226:	fe843783          	ld	a5,-24(s0)
    8000522a:	479c                	lw	a5,8(a5)
    8000522c:	2785                	addiw	a5,a5,1
    8000522e:	0007871b          	sext.w	a4,a5
    80005232:	fe843783          	ld	a5,-24(s0)
    80005236:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80005238:	0002d517          	auipc	a0,0x2d
    8000523c:	ea850513          	addi	a0,a0,-344 # 800320e0 <itable>
    80005240:	ffffc097          	auipc	ra,0xffffc
    80005244:	14e080e7          	jalr	334(ra) # 8000138e <release>
      return ip;
    80005248:	fe843783          	ld	a5,-24(s0)
    8000524c:	a069                	j	800052d6 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    8000524e:	fe043783          	ld	a5,-32(s0)
    80005252:	eb89                	bnez	a5,80005264 <iget+0xa0>
    80005254:	fe843783          	ld	a5,-24(s0)
    80005258:	479c                	lw	a5,8(a5)
    8000525a:	e789                	bnez	a5,80005264 <iget+0xa0>
      empty = ip;
    8000525c:	fe843783          	ld	a5,-24(s0)
    80005260:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005264:	fe843783          	ld	a5,-24(s0)
    80005268:	08878793          	addi	a5,a5,136
    8000526c:	fef43423          	sd	a5,-24(s0)
    80005270:	fe843703          	ld	a4,-24(s0)
    80005274:	0002f797          	auipc	a5,0x2f
    80005278:	91478793          	addi	a5,a5,-1772 # 80033b88 <log>
    8000527c:	f8f760e3          	bltu	a4,a5,800051fc <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80005280:	fe043783          	ld	a5,-32(s0)
    80005284:	eb89                	bnez	a5,80005296 <iget+0xd2>
    panic("iget: no inodes");
    80005286:	00006517          	auipc	a0,0x6
    8000528a:	25250513          	addi	a0,a0,594 # 8000b4d8 <etext+0x4d8>
    8000528e:	ffffc097          	auipc	ra,0xffffc
    80005292:	9fe080e7          	jalr	-1538(ra) # 80000c8c <panic>

  ip = empty;
    80005296:	fe043783          	ld	a5,-32(s0)
    8000529a:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    8000529e:	fe843783          	ld	a5,-24(s0)
    800052a2:	fdc42703          	lw	a4,-36(s0)
    800052a6:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    800052a8:	fe843783          	ld	a5,-24(s0)
    800052ac:	fd842703          	lw	a4,-40(s0)
    800052b0:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    800052b2:	fe843783          	ld	a5,-24(s0)
    800052b6:	4705                	li	a4,1
    800052b8:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800052ba:	fe843783          	ld	a5,-24(s0)
    800052be:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    800052c2:	0002d517          	auipc	a0,0x2d
    800052c6:	e1e50513          	addi	a0,a0,-482 # 800320e0 <itable>
    800052ca:	ffffc097          	auipc	ra,0xffffc
    800052ce:	0c4080e7          	jalr	196(ra) # 8000138e <release>

  return ip;
    800052d2:	fe843783          	ld	a5,-24(s0)
}
    800052d6:	853e                	mv	a0,a5
    800052d8:	70a2                	ld	ra,40(sp)
    800052da:	7402                	ld	s0,32(sp)
    800052dc:	6145                	addi	sp,sp,48
    800052de:	8082                	ret

00000000800052e0 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800052e0:	1101                	addi	sp,sp,-32
    800052e2:	ec06                	sd	ra,24(sp)
    800052e4:	e822                	sd	s0,16(sp)
    800052e6:	1000                	addi	s0,sp,32
    800052e8:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800052ec:	0002d517          	auipc	a0,0x2d
    800052f0:	df450513          	addi	a0,a0,-524 # 800320e0 <itable>
    800052f4:	ffffc097          	auipc	ra,0xffffc
    800052f8:	036080e7          	jalr	54(ra) # 8000132a <acquire>
  ip->ref++;
    800052fc:	fe843783          	ld	a5,-24(s0)
    80005300:	479c                	lw	a5,8(a5)
    80005302:	2785                	addiw	a5,a5,1
    80005304:	0007871b          	sext.w	a4,a5
    80005308:	fe843783          	ld	a5,-24(s0)
    8000530c:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000530e:	0002d517          	auipc	a0,0x2d
    80005312:	dd250513          	addi	a0,a0,-558 # 800320e0 <itable>
    80005316:	ffffc097          	auipc	ra,0xffffc
    8000531a:	078080e7          	jalr	120(ra) # 8000138e <release>
  return ip;
    8000531e:	fe843783          	ld	a5,-24(s0)
}
    80005322:	853e                	mv	a0,a5
    80005324:	60e2                	ld	ra,24(sp)
    80005326:	6442                	ld	s0,16(sp)
    80005328:	6105                	addi	sp,sp,32
    8000532a:	8082                	ret

000000008000532c <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    8000532c:	7179                	addi	sp,sp,-48
    8000532e:	f406                	sd	ra,40(sp)
    80005330:	f022                	sd	s0,32(sp)
    80005332:	1800                	addi	s0,sp,48
    80005334:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    80005338:	fd843783          	ld	a5,-40(s0)
    8000533c:	c791                	beqz	a5,80005348 <ilock+0x1c>
    8000533e:	fd843783          	ld	a5,-40(s0)
    80005342:	479c                	lw	a5,8(a5)
    80005344:	00f04a63          	bgtz	a5,80005358 <ilock+0x2c>
    panic("ilock");
    80005348:	00006517          	auipc	a0,0x6
    8000534c:	1a050513          	addi	a0,a0,416 # 8000b4e8 <etext+0x4e8>
    80005350:	ffffc097          	auipc	ra,0xffffc
    80005354:	93c080e7          	jalr	-1732(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    80005358:	fd843783          	ld	a5,-40(s0)
    8000535c:	07c1                	addi	a5,a5,16
    8000535e:	853e                	mv	a0,a5
    80005360:	00001097          	auipc	ra,0x1
    80005364:	4b4080e7          	jalr	1204(ra) # 80006814 <acquiresleep>

  if(ip->valid == 0){
    80005368:	fd843783          	ld	a5,-40(s0)
    8000536c:	43bc                	lw	a5,64(a5)
    8000536e:	e7e5                	bnez	a5,80005456 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005370:	fd843783          	ld	a5,-40(s0)
    80005374:	4394                	lw	a3,0(a5)
    80005376:	fd843783          	ld	a5,-40(s0)
    8000537a:	43dc                	lw	a5,4(a5)
    8000537c:	0047d79b          	srliw	a5,a5,0x4
    80005380:	0007871b          	sext.w	a4,a5
    80005384:	0002d797          	auipc	a5,0x2d
    80005388:	d3c78793          	addi	a5,a5,-708 # 800320c0 <sb>
    8000538c:	4f9c                	lw	a5,24(a5)
    8000538e:	9fb9                	addw	a5,a5,a4
    80005390:	2781                	sext.w	a5,a5
    80005392:	85be                	mv	a1,a5
    80005394:	8536                	mv	a0,a3
    80005396:	fffff097          	auipc	ra,0xfffff
    8000539a:	5a2080e7          	jalr	1442(ra) # 80004938 <bread>
    8000539e:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    800053a2:	fe843783          	ld	a5,-24(s0)
    800053a6:	05878713          	addi	a4,a5,88
    800053aa:	fd843783          	ld	a5,-40(s0)
    800053ae:	43dc                	lw	a5,4(a5)
    800053b0:	1782                	slli	a5,a5,0x20
    800053b2:	9381                	srli	a5,a5,0x20
    800053b4:	8bbd                	andi	a5,a5,15
    800053b6:	079a                	slli	a5,a5,0x6
    800053b8:	97ba                	add	a5,a5,a4
    800053ba:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800053be:	fe043783          	ld	a5,-32(s0)
    800053c2:	00079703          	lh	a4,0(a5)
    800053c6:	fd843783          	ld	a5,-40(s0)
    800053ca:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800053ce:	fe043783          	ld	a5,-32(s0)
    800053d2:	00279703          	lh	a4,2(a5)
    800053d6:	fd843783          	ld	a5,-40(s0)
    800053da:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800053de:	fe043783          	ld	a5,-32(s0)
    800053e2:	00479703          	lh	a4,4(a5)
    800053e6:	fd843783          	ld	a5,-40(s0)
    800053ea:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800053ee:	fe043783          	ld	a5,-32(s0)
    800053f2:	00679703          	lh	a4,6(a5)
    800053f6:	fd843783          	ld	a5,-40(s0)
    800053fa:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800053fe:	fe043783          	ld	a5,-32(s0)
    80005402:	4798                	lw	a4,8(a5)
    80005404:	fd843783          	ld	a5,-40(s0)
    80005408:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    8000540a:	fd843783          	ld	a5,-40(s0)
    8000540e:	05078713          	addi	a4,a5,80
    80005412:	fe043783          	ld	a5,-32(s0)
    80005416:	07b1                	addi	a5,a5,12
    80005418:	03400613          	li	a2,52
    8000541c:	85be                	mv	a1,a5
    8000541e:	853a                	mv	a0,a4
    80005420:	ffffc097          	auipc	ra,0xffffc
    80005424:	1c2080e7          	jalr	450(ra) # 800015e2 <memmove>
    brelse(bp);
    80005428:	fe843503          	ld	a0,-24(s0)
    8000542c:	fffff097          	auipc	ra,0xfffff
    80005430:	5b6080e7          	jalr	1462(ra) # 800049e2 <brelse>
    ip->valid = 1;
    80005434:	fd843783          	ld	a5,-40(s0)
    80005438:	4705                	li	a4,1
    8000543a:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    8000543c:	fd843783          	ld	a5,-40(s0)
    80005440:	04479783          	lh	a5,68(a5)
    80005444:	eb89                	bnez	a5,80005456 <ilock+0x12a>
      panic("ilock: no type");
    80005446:	00006517          	auipc	a0,0x6
    8000544a:	0aa50513          	addi	a0,a0,170 # 8000b4f0 <etext+0x4f0>
    8000544e:	ffffc097          	auipc	ra,0xffffc
    80005452:	83e080e7          	jalr	-1986(ra) # 80000c8c <panic>
  }
}
    80005456:	0001                	nop
    80005458:	70a2                	ld	ra,40(sp)
    8000545a:	7402                	ld	s0,32(sp)
    8000545c:	6145                	addi	sp,sp,48
    8000545e:	8082                	ret

0000000080005460 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005460:	1101                	addi	sp,sp,-32
    80005462:	ec06                	sd	ra,24(sp)
    80005464:	e822                	sd	s0,16(sp)
    80005466:	1000                	addi	s0,sp,32
    80005468:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    8000546c:	fe843783          	ld	a5,-24(s0)
    80005470:	c385                	beqz	a5,80005490 <iunlock+0x30>
    80005472:	fe843783          	ld	a5,-24(s0)
    80005476:	07c1                	addi	a5,a5,16
    80005478:	853e                	mv	a0,a5
    8000547a:	00001097          	auipc	ra,0x1
    8000547e:	45a080e7          	jalr	1114(ra) # 800068d4 <holdingsleep>
    80005482:	87aa                	mv	a5,a0
    80005484:	c791                	beqz	a5,80005490 <iunlock+0x30>
    80005486:	fe843783          	ld	a5,-24(s0)
    8000548a:	479c                	lw	a5,8(a5)
    8000548c:	00f04a63          	bgtz	a5,800054a0 <iunlock+0x40>
    panic("iunlock");
    80005490:	00006517          	auipc	a0,0x6
    80005494:	07050513          	addi	a0,a0,112 # 8000b500 <etext+0x500>
    80005498:	ffffb097          	auipc	ra,0xffffb
    8000549c:	7f4080e7          	jalr	2036(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    800054a0:	fe843783          	ld	a5,-24(s0)
    800054a4:	07c1                	addi	a5,a5,16
    800054a6:	853e                	mv	a0,a5
    800054a8:	00001097          	auipc	ra,0x1
    800054ac:	3da080e7          	jalr	986(ra) # 80006882 <releasesleep>
}
    800054b0:	0001                	nop
    800054b2:	60e2                	ld	ra,24(sp)
    800054b4:	6442                	ld	s0,16(sp)
    800054b6:	6105                	addi	sp,sp,32
    800054b8:	8082                	ret

00000000800054ba <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800054ba:	1101                	addi	sp,sp,-32
    800054bc:	ec06                	sd	ra,24(sp)
    800054be:	e822                	sd	s0,16(sp)
    800054c0:	1000                	addi	s0,sp,32
    800054c2:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800054c6:	0002d517          	auipc	a0,0x2d
    800054ca:	c1a50513          	addi	a0,a0,-998 # 800320e0 <itable>
    800054ce:	ffffc097          	auipc	ra,0xffffc
    800054d2:	e5c080e7          	jalr	-420(ra) # 8000132a <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800054d6:	fe843783          	ld	a5,-24(s0)
    800054da:	479c                	lw	a5,8(a5)
    800054dc:	873e                	mv	a4,a5
    800054de:	4785                	li	a5,1
    800054e0:	06f71f63          	bne	a4,a5,8000555e <iput+0xa4>
    800054e4:	fe843783          	ld	a5,-24(s0)
    800054e8:	43bc                	lw	a5,64(a5)
    800054ea:	cbb5                	beqz	a5,8000555e <iput+0xa4>
    800054ec:	fe843783          	ld	a5,-24(s0)
    800054f0:	04a79783          	lh	a5,74(a5)
    800054f4:	e7ad                	bnez	a5,8000555e <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800054f6:	fe843783          	ld	a5,-24(s0)
    800054fa:	07c1                	addi	a5,a5,16
    800054fc:	853e                	mv	a0,a5
    800054fe:	00001097          	auipc	ra,0x1
    80005502:	316080e7          	jalr	790(ra) # 80006814 <acquiresleep>

    release(&itable.lock);
    80005506:	0002d517          	auipc	a0,0x2d
    8000550a:	bda50513          	addi	a0,a0,-1062 # 800320e0 <itable>
    8000550e:	ffffc097          	auipc	ra,0xffffc
    80005512:	e80080e7          	jalr	-384(ra) # 8000138e <release>

    itrunc(ip);
    80005516:	fe843503          	ld	a0,-24(s0)
    8000551a:	00000097          	auipc	ra,0x0
    8000551e:	21a080e7          	jalr	538(ra) # 80005734 <itrunc>
    ip->type = 0;
    80005522:	fe843783          	ld	a5,-24(s0)
    80005526:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    8000552a:	fe843503          	ld	a0,-24(s0)
    8000552e:	00000097          	auipc	ra,0x0
    80005532:	bae080e7          	jalr	-1106(ra) # 800050dc <iupdate>
    ip->valid = 0;
    80005536:	fe843783          	ld	a5,-24(s0)
    8000553a:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    8000553e:	fe843783          	ld	a5,-24(s0)
    80005542:	07c1                	addi	a5,a5,16
    80005544:	853e                	mv	a0,a5
    80005546:	00001097          	auipc	ra,0x1
    8000554a:	33c080e7          	jalr	828(ra) # 80006882 <releasesleep>

    acquire(&itable.lock);
    8000554e:	0002d517          	auipc	a0,0x2d
    80005552:	b9250513          	addi	a0,a0,-1134 # 800320e0 <itable>
    80005556:	ffffc097          	auipc	ra,0xffffc
    8000555a:	dd4080e7          	jalr	-556(ra) # 8000132a <acquire>
  }

  ip->ref--;
    8000555e:	fe843783          	ld	a5,-24(s0)
    80005562:	479c                	lw	a5,8(a5)
    80005564:	37fd                	addiw	a5,a5,-1
    80005566:	0007871b          	sext.w	a4,a5
    8000556a:	fe843783          	ld	a5,-24(s0)
    8000556e:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005570:	0002d517          	auipc	a0,0x2d
    80005574:	b7050513          	addi	a0,a0,-1168 # 800320e0 <itable>
    80005578:	ffffc097          	auipc	ra,0xffffc
    8000557c:	e16080e7          	jalr	-490(ra) # 8000138e <release>
}
    80005580:	0001                	nop
    80005582:	60e2                	ld	ra,24(sp)
    80005584:	6442                	ld	s0,16(sp)
    80005586:	6105                	addi	sp,sp,32
    80005588:	8082                	ret

000000008000558a <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    8000558a:	1101                	addi	sp,sp,-32
    8000558c:	ec06                	sd	ra,24(sp)
    8000558e:	e822                	sd	s0,16(sp)
    80005590:	1000                	addi	s0,sp,32
    80005592:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    80005596:	fe843503          	ld	a0,-24(s0)
    8000559a:	00000097          	auipc	ra,0x0
    8000559e:	ec6080e7          	jalr	-314(ra) # 80005460 <iunlock>
  iput(ip);
    800055a2:	fe843503          	ld	a0,-24(s0)
    800055a6:	00000097          	auipc	ra,0x0
    800055aa:	f14080e7          	jalr	-236(ra) # 800054ba <iput>
}
    800055ae:	0001                	nop
    800055b0:	60e2                	ld	ra,24(sp)
    800055b2:	6442                	ld	s0,16(sp)
    800055b4:	6105                	addi	sp,sp,32
    800055b6:	8082                	ret

00000000800055b8 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    800055b8:	7139                	addi	sp,sp,-64
    800055ba:	fc06                	sd	ra,56(sp)
    800055bc:	f822                	sd	s0,48(sp)
    800055be:	0080                	addi	s0,sp,64
    800055c0:	fca43423          	sd	a0,-56(s0)
    800055c4:	87ae                	mv	a5,a1
    800055c6:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800055ca:	fc442783          	lw	a5,-60(s0)
    800055ce:	0007871b          	sext.w	a4,a5
    800055d2:	47ad                	li	a5,11
    800055d4:	04e7ee63          	bltu	a5,a4,80005630 <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    800055d8:	fc843703          	ld	a4,-56(s0)
    800055dc:	fc446783          	lwu	a5,-60(s0)
    800055e0:	07d1                	addi	a5,a5,20
    800055e2:	078a                	slli	a5,a5,0x2
    800055e4:	97ba                	add	a5,a5,a4
    800055e6:	439c                	lw	a5,0(a5)
    800055e8:	fef42623          	sw	a5,-20(s0)
    800055ec:	fec42783          	lw	a5,-20(s0)
    800055f0:	2781                	sext.w	a5,a5
    800055f2:	ef85                	bnez	a5,8000562a <bmap+0x72>
      addr = balloc(ip->dev);
    800055f4:	fc843783          	ld	a5,-56(s0)
    800055f8:	439c                	lw	a5,0(a5)
    800055fa:	853e                	mv	a0,a5
    800055fc:	fffff097          	auipc	ra,0xfffff
    80005600:	68e080e7          	jalr	1678(ra) # 80004c8a <balloc>
    80005604:	87aa                	mv	a5,a0
    80005606:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    8000560a:	fec42783          	lw	a5,-20(s0)
    8000560e:	2781                	sext.w	a5,a5
    80005610:	e399                	bnez	a5,80005616 <bmap+0x5e>
        return 0;
    80005612:	4781                	li	a5,0
    80005614:	aa19                	j	8000572a <bmap+0x172>
      ip->addrs[bn] = addr;
    80005616:	fc843703          	ld	a4,-56(s0)
    8000561a:	fc446783          	lwu	a5,-60(s0)
    8000561e:	07d1                	addi	a5,a5,20
    80005620:	078a                	slli	a5,a5,0x2
    80005622:	97ba                	add	a5,a5,a4
    80005624:	fec42703          	lw	a4,-20(s0)
    80005628:	c398                	sw	a4,0(a5)
    }
    return addr;
    8000562a:	fec42783          	lw	a5,-20(s0)
    8000562e:	a8f5                	j	8000572a <bmap+0x172>
  }
  bn -= NDIRECT;
    80005630:	fc442783          	lw	a5,-60(s0)
    80005634:	37d1                	addiw	a5,a5,-12
    80005636:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    8000563a:	fc442783          	lw	a5,-60(s0)
    8000563e:	0007871b          	sext.w	a4,a5
    80005642:	0ff00793          	li	a5,255
    80005646:	0ce7ea63          	bltu	a5,a4,8000571a <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    8000564a:	fc843783          	ld	a5,-56(s0)
    8000564e:	0807a783          	lw	a5,128(a5)
    80005652:	fef42623          	sw	a5,-20(s0)
    80005656:	fec42783          	lw	a5,-20(s0)
    8000565a:	2781                	sext.w	a5,a5
    8000565c:	eb85                	bnez	a5,8000568c <bmap+0xd4>
      addr = balloc(ip->dev);
    8000565e:	fc843783          	ld	a5,-56(s0)
    80005662:	439c                	lw	a5,0(a5)
    80005664:	853e                	mv	a0,a5
    80005666:	fffff097          	auipc	ra,0xfffff
    8000566a:	624080e7          	jalr	1572(ra) # 80004c8a <balloc>
    8000566e:	87aa                	mv	a5,a0
    80005670:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005674:	fec42783          	lw	a5,-20(s0)
    80005678:	2781                	sext.w	a5,a5
    8000567a:	e399                	bnez	a5,80005680 <bmap+0xc8>
        return 0;
    8000567c:	4781                	li	a5,0
    8000567e:	a075                	j	8000572a <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    80005680:	fc843783          	ld	a5,-56(s0)
    80005684:	fec42703          	lw	a4,-20(s0)
    80005688:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    8000568c:	fc843783          	ld	a5,-56(s0)
    80005690:	439c                	lw	a5,0(a5)
    80005692:	fec42703          	lw	a4,-20(s0)
    80005696:	85ba                	mv	a1,a4
    80005698:	853e                	mv	a0,a5
    8000569a:	fffff097          	auipc	ra,0xfffff
    8000569e:	29e080e7          	jalr	670(ra) # 80004938 <bread>
    800056a2:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800056a6:	fe043783          	ld	a5,-32(s0)
    800056aa:	05878793          	addi	a5,a5,88
    800056ae:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    800056b2:	fc446783          	lwu	a5,-60(s0)
    800056b6:	078a                	slli	a5,a5,0x2
    800056b8:	fd843703          	ld	a4,-40(s0)
    800056bc:	97ba                	add	a5,a5,a4
    800056be:	439c                	lw	a5,0(a5)
    800056c0:	fef42623          	sw	a5,-20(s0)
    800056c4:	fec42783          	lw	a5,-20(s0)
    800056c8:	2781                	sext.w	a5,a5
    800056ca:	ef9d                	bnez	a5,80005708 <bmap+0x150>
      addr = balloc(ip->dev);
    800056cc:	fc843783          	ld	a5,-56(s0)
    800056d0:	439c                	lw	a5,0(a5)
    800056d2:	853e                	mv	a0,a5
    800056d4:	fffff097          	auipc	ra,0xfffff
    800056d8:	5b6080e7          	jalr	1462(ra) # 80004c8a <balloc>
    800056dc:	87aa                	mv	a5,a0
    800056de:	fef42623          	sw	a5,-20(s0)
      if(addr){
    800056e2:	fec42783          	lw	a5,-20(s0)
    800056e6:	2781                	sext.w	a5,a5
    800056e8:	c385                	beqz	a5,80005708 <bmap+0x150>
        a[bn] = addr;
    800056ea:	fc446783          	lwu	a5,-60(s0)
    800056ee:	078a                	slli	a5,a5,0x2
    800056f0:	fd843703          	ld	a4,-40(s0)
    800056f4:	97ba                	add	a5,a5,a4
    800056f6:	fec42703          	lw	a4,-20(s0)
    800056fa:	c398                	sw	a4,0(a5)
        log_write(bp);
    800056fc:	fe043503          	ld	a0,-32(s0)
    80005700:	00001097          	auipc	ra,0x1
    80005704:	f94080e7          	jalr	-108(ra) # 80006694 <log_write>
      }
    }
    brelse(bp);
    80005708:	fe043503          	ld	a0,-32(s0)
    8000570c:	fffff097          	auipc	ra,0xfffff
    80005710:	2d6080e7          	jalr	726(ra) # 800049e2 <brelse>
    return addr;
    80005714:	fec42783          	lw	a5,-20(s0)
    80005718:	a809                	j	8000572a <bmap+0x172>
  }

  panic("bmap: out of range");
    8000571a:	00006517          	auipc	a0,0x6
    8000571e:	dee50513          	addi	a0,a0,-530 # 8000b508 <etext+0x508>
    80005722:	ffffb097          	auipc	ra,0xffffb
    80005726:	56a080e7          	jalr	1386(ra) # 80000c8c <panic>
}
    8000572a:	853e                	mv	a0,a5
    8000572c:	70e2                	ld	ra,56(sp)
    8000572e:	7442                	ld	s0,48(sp)
    80005730:	6121                	addi	sp,sp,64
    80005732:	8082                	ret

0000000080005734 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005734:	7139                	addi	sp,sp,-64
    80005736:	fc06                	sd	ra,56(sp)
    80005738:	f822                	sd	s0,48(sp)
    8000573a:	0080                	addi	s0,sp,64
    8000573c:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005740:	fe042623          	sw	zero,-20(s0)
    80005744:	a899                	j	8000579a <itrunc+0x66>
    if(ip->addrs[i]){
    80005746:	fc843703          	ld	a4,-56(s0)
    8000574a:	fec42783          	lw	a5,-20(s0)
    8000574e:	07d1                	addi	a5,a5,20
    80005750:	078a                	slli	a5,a5,0x2
    80005752:	97ba                	add	a5,a5,a4
    80005754:	439c                	lw	a5,0(a5)
    80005756:	cf8d                	beqz	a5,80005790 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005758:	fc843783          	ld	a5,-56(s0)
    8000575c:	439c                	lw	a5,0(a5)
    8000575e:	0007869b          	sext.w	a3,a5
    80005762:	fc843703          	ld	a4,-56(s0)
    80005766:	fec42783          	lw	a5,-20(s0)
    8000576a:	07d1                	addi	a5,a5,20
    8000576c:	078a                	slli	a5,a5,0x2
    8000576e:	97ba                	add	a5,a5,a4
    80005770:	439c                	lw	a5,0(a5)
    80005772:	85be                	mv	a1,a5
    80005774:	8536                	mv	a0,a3
    80005776:	fffff097          	auipc	ra,0xfffff
    8000577a:	6c4080e7          	jalr	1732(ra) # 80004e3a <bfree>
      ip->addrs[i] = 0;
    8000577e:	fc843703          	ld	a4,-56(s0)
    80005782:	fec42783          	lw	a5,-20(s0)
    80005786:	07d1                	addi	a5,a5,20
    80005788:	078a                	slli	a5,a5,0x2
    8000578a:	97ba                	add	a5,a5,a4
    8000578c:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005790:	fec42783          	lw	a5,-20(s0)
    80005794:	2785                	addiw	a5,a5,1
    80005796:	fef42623          	sw	a5,-20(s0)
    8000579a:	fec42783          	lw	a5,-20(s0)
    8000579e:	0007871b          	sext.w	a4,a5
    800057a2:	47ad                	li	a5,11
    800057a4:	fae7d1e3          	bge	a5,a4,80005746 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    800057a8:	fc843783          	ld	a5,-56(s0)
    800057ac:	0807a783          	lw	a5,128(a5)
    800057b0:	cbc5                	beqz	a5,80005860 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    800057b2:	fc843783          	ld	a5,-56(s0)
    800057b6:	4398                	lw	a4,0(a5)
    800057b8:	fc843783          	ld	a5,-56(s0)
    800057bc:	0807a783          	lw	a5,128(a5)
    800057c0:	85be                	mv	a1,a5
    800057c2:	853a                	mv	a0,a4
    800057c4:	fffff097          	auipc	ra,0xfffff
    800057c8:	174080e7          	jalr	372(ra) # 80004938 <bread>
    800057cc:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800057d0:	fe043783          	ld	a5,-32(s0)
    800057d4:	05878793          	addi	a5,a5,88
    800057d8:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    800057dc:	fe042423          	sw	zero,-24(s0)
    800057e0:	a081                	j	80005820 <itrunc+0xec>
      if(a[j])
    800057e2:	fe842783          	lw	a5,-24(s0)
    800057e6:	078a                	slli	a5,a5,0x2
    800057e8:	fd843703          	ld	a4,-40(s0)
    800057ec:	97ba                	add	a5,a5,a4
    800057ee:	439c                	lw	a5,0(a5)
    800057f0:	c39d                	beqz	a5,80005816 <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800057f2:	fc843783          	ld	a5,-56(s0)
    800057f6:	439c                	lw	a5,0(a5)
    800057f8:	0007869b          	sext.w	a3,a5
    800057fc:	fe842783          	lw	a5,-24(s0)
    80005800:	078a                	slli	a5,a5,0x2
    80005802:	fd843703          	ld	a4,-40(s0)
    80005806:	97ba                	add	a5,a5,a4
    80005808:	439c                	lw	a5,0(a5)
    8000580a:	85be                	mv	a1,a5
    8000580c:	8536                	mv	a0,a3
    8000580e:	fffff097          	auipc	ra,0xfffff
    80005812:	62c080e7          	jalr	1580(ra) # 80004e3a <bfree>
    for(j = 0; j < NINDIRECT; j++){
    80005816:	fe842783          	lw	a5,-24(s0)
    8000581a:	2785                	addiw	a5,a5,1
    8000581c:	fef42423          	sw	a5,-24(s0)
    80005820:	fe842783          	lw	a5,-24(s0)
    80005824:	873e                	mv	a4,a5
    80005826:	0ff00793          	li	a5,255
    8000582a:	fae7fce3          	bgeu	a5,a4,800057e2 <itrunc+0xae>
    }
    brelse(bp);
    8000582e:	fe043503          	ld	a0,-32(s0)
    80005832:	fffff097          	auipc	ra,0xfffff
    80005836:	1b0080e7          	jalr	432(ra) # 800049e2 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    8000583a:	fc843783          	ld	a5,-56(s0)
    8000583e:	439c                	lw	a5,0(a5)
    80005840:	0007871b          	sext.w	a4,a5
    80005844:	fc843783          	ld	a5,-56(s0)
    80005848:	0807a783          	lw	a5,128(a5)
    8000584c:	85be                	mv	a1,a5
    8000584e:	853a                	mv	a0,a4
    80005850:	fffff097          	auipc	ra,0xfffff
    80005854:	5ea080e7          	jalr	1514(ra) # 80004e3a <bfree>
    ip->addrs[NDIRECT] = 0;
    80005858:	fc843783          	ld	a5,-56(s0)
    8000585c:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005860:	fc843783          	ld	a5,-56(s0)
    80005864:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005868:	fc843503          	ld	a0,-56(s0)
    8000586c:	00000097          	auipc	ra,0x0
    80005870:	870080e7          	jalr	-1936(ra) # 800050dc <iupdate>
}
    80005874:	0001                	nop
    80005876:	70e2                	ld	ra,56(sp)
    80005878:	7442                	ld	s0,48(sp)
    8000587a:	6121                	addi	sp,sp,64
    8000587c:	8082                	ret

000000008000587e <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    8000587e:	1101                	addi	sp,sp,-32
    80005880:	ec22                	sd	s0,24(sp)
    80005882:	1000                	addi	s0,sp,32
    80005884:	fea43423          	sd	a0,-24(s0)
    80005888:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    8000588c:	fe843783          	ld	a5,-24(s0)
    80005890:	439c                	lw	a5,0(a5)
    80005892:	0007871b          	sext.w	a4,a5
    80005896:	fe043783          	ld	a5,-32(s0)
    8000589a:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    8000589c:	fe843783          	ld	a5,-24(s0)
    800058a0:	43d8                	lw	a4,4(a5)
    800058a2:	fe043783          	ld	a5,-32(s0)
    800058a6:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    800058a8:	fe843783          	ld	a5,-24(s0)
    800058ac:	04479703          	lh	a4,68(a5)
    800058b0:	fe043783          	ld	a5,-32(s0)
    800058b4:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    800058b8:	fe843783          	ld	a5,-24(s0)
    800058bc:	04a79703          	lh	a4,74(a5)
    800058c0:	fe043783          	ld	a5,-32(s0)
    800058c4:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    800058c8:	fe843783          	ld	a5,-24(s0)
    800058cc:	47fc                	lw	a5,76(a5)
    800058ce:	02079713          	slli	a4,a5,0x20
    800058d2:	9301                	srli	a4,a4,0x20
    800058d4:	fe043783          	ld	a5,-32(s0)
    800058d8:	eb98                	sd	a4,16(a5)
}
    800058da:	0001                	nop
    800058dc:	6462                	ld	s0,24(sp)
    800058de:	6105                	addi	sp,sp,32
    800058e0:	8082                	ret

00000000800058e2 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    800058e2:	715d                	addi	sp,sp,-80
    800058e4:	e486                	sd	ra,72(sp)
    800058e6:	e0a2                	sd	s0,64(sp)
    800058e8:	0880                	addi	s0,sp,80
    800058ea:	fca43423          	sd	a0,-56(s0)
    800058ee:	87ae                	mv	a5,a1
    800058f0:	fac43c23          	sd	a2,-72(s0)
    800058f4:	fcf42223          	sw	a5,-60(s0)
    800058f8:	87b6                	mv	a5,a3
    800058fa:	fcf42023          	sw	a5,-64(s0)
    800058fe:	87ba                	mv	a5,a4
    80005900:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005904:	fc843783          	ld	a5,-56(s0)
    80005908:	47f8                	lw	a4,76(a5)
    8000590a:	fc042783          	lw	a5,-64(s0)
    8000590e:	2781                	sext.w	a5,a5
    80005910:	00f76e63          	bltu	a4,a5,8000592c <readi+0x4a>
    80005914:	fc042703          	lw	a4,-64(s0)
    80005918:	fb442783          	lw	a5,-76(s0)
    8000591c:	9fb9                	addw	a5,a5,a4
    8000591e:	0007871b          	sext.w	a4,a5
    80005922:	fc042783          	lw	a5,-64(s0)
    80005926:	2781                	sext.w	a5,a5
    80005928:	00f77463          	bgeu	a4,a5,80005930 <readi+0x4e>
    return 0;
    8000592c:	4781                	li	a5,0
    8000592e:	a289                	j	80005a70 <readi+0x18e>
  if(off + n > ip->size)
    80005930:	fc042703          	lw	a4,-64(s0)
    80005934:	fb442783          	lw	a5,-76(s0)
    80005938:	9fb9                	addw	a5,a5,a4
    8000593a:	0007871b          	sext.w	a4,a5
    8000593e:	fc843783          	ld	a5,-56(s0)
    80005942:	47fc                	lw	a5,76(a5)
    80005944:	00e7fb63          	bgeu	a5,a4,8000595a <readi+0x78>
    n = ip->size - off;
    80005948:	fc843783          	ld	a5,-56(s0)
    8000594c:	47f8                	lw	a4,76(a5)
    8000594e:	fc042783          	lw	a5,-64(s0)
    80005952:	40f707bb          	subw	a5,a4,a5
    80005956:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    8000595a:	fe042623          	sw	zero,-20(s0)
    8000595e:	a8ed                	j	80005a58 <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    80005960:	fc042783          	lw	a5,-64(s0)
    80005964:	00a7d79b          	srliw	a5,a5,0xa
    80005968:	2781                	sext.w	a5,a5
    8000596a:	85be                	mv	a1,a5
    8000596c:	fc843503          	ld	a0,-56(s0)
    80005970:	00000097          	auipc	ra,0x0
    80005974:	c48080e7          	jalr	-952(ra) # 800055b8 <bmap>
    80005978:	87aa                	mv	a5,a0
    8000597a:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    8000597e:	fe842783          	lw	a5,-24(s0)
    80005982:	2781                	sext.w	a5,a5
    80005984:	c3fd                	beqz	a5,80005a6a <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    80005986:	fc843783          	ld	a5,-56(s0)
    8000598a:	439c                	lw	a5,0(a5)
    8000598c:	fe842703          	lw	a4,-24(s0)
    80005990:	85ba                	mv	a1,a4
    80005992:	853e                	mv	a0,a5
    80005994:	fffff097          	auipc	ra,0xfffff
    80005998:	fa4080e7          	jalr	-92(ra) # 80004938 <bread>
    8000599c:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    800059a0:	fc042783          	lw	a5,-64(s0)
    800059a4:	3ff7f793          	andi	a5,a5,1023
    800059a8:	2781                	sext.w	a5,a5
    800059aa:	40000713          	li	a4,1024
    800059ae:	40f707bb          	subw	a5,a4,a5
    800059b2:	0007869b          	sext.w	a3,a5
    800059b6:	fb442703          	lw	a4,-76(s0)
    800059ba:	fec42783          	lw	a5,-20(s0)
    800059be:	40f707bb          	subw	a5,a4,a5
    800059c2:	2781                	sext.w	a5,a5
    800059c4:	863e                	mv	a2,a5
    800059c6:	87b6                	mv	a5,a3
    800059c8:	0007869b          	sext.w	a3,a5
    800059cc:	0006071b          	sext.w	a4,a2
    800059d0:	00d77363          	bgeu	a4,a3,800059d6 <readi+0xf4>
    800059d4:	87b2                	mv	a5,a2
    800059d6:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    800059da:	fe043783          	ld	a5,-32(s0)
    800059de:	05878713          	addi	a4,a5,88
    800059e2:	fc046783          	lwu	a5,-64(s0)
    800059e6:	3ff7f793          	andi	a5,a5,1023
    800059ea:	973e                	add	a4,a4,a5
    800059ec:	fdc46683          	lwu	a3,-36(s0)
    800059f0:	fc442783          	lw	a5,-60(s0)
    800059f4:	863a                	mv	a2,a4
    800059f6:	fb843583          	ld	a1,-72(s0)
    800059fa:	853e                	mv	a0,a5
    800059fc:	ffffe097          	auipc	ra,0xffffe
    80005a00:	eda080e7          	jalr	-294(ra) # 800038d6 <either_copyout>
    80005a04:	87aa                	mv	a5,a0
    80005a06:	873e                	mv	a4,a5
    80005a08:	57fd                	li	a5,-1
    80005a0a:	00f71c63          	bne	a4,a5,80005a22 <readi+0x140>
      brelse(bp);
    80005a0e:	fe043503          	ld	a0,-32(s0)
    80005a12:	fffff097          	auipc	ra,0xfffff
    80005a16:	fd0080e7          	jalr	-48(ra) # 800049e2 <brelse>
      tot = -1;
    80005a1a:	57fd                	li	a5,-1
    80005a1c:	fef42623          	sw	a5,-20(s0)
      break;
    80005a20:	a0b1                	j	80005a6c <readi+0x18a>
    }
    brelse(bp);
    80005a22:	fe043503          	ld	a0,-32(s0)
    80005a26:	fffff097          	auipc	ra,0xfffff
    80005a2a:	fbc080e7          	jalr	-68(ra) # 800049e2 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005a2e:	fec42703          	lw	a4,-20(s0)
    80005a32:	fdc42783          	lw	a5,-36(s0)
    80005a36:	9fb9                	addw	a5,a5,a4
    80005a38:	fef42623          	sw	a5,-20(s0)
    80005a3c:	fc042703          	lw	a4,-64(s0)
    80005a40:	fdc42783          	lw	a5,-36(s0)
    80005a44:	9fb9                	addw	a5,a5,a4
    80005a46:	fcf42023          	sw	a5,-64(s0)
    80005a4a:	fdc46783          	lwu	a5,-36(s0)
    80005a4e:	fb843703          	ld	a4,-72(s0)
    80005a52:	97ba                	add	a5,a5,a4
    80005a54:	faf43c23          	sd	a5,-72(s0)
    80005a58:	fec42703          	lw	a4,-20(s0)
    80005a5c:	fb442783          	lw	a5,-76(s0)
    80005a60:	2701                	sext.w	a4,a4
    80005a62:	2781                	sext.w	a5,a5
    80005a64:	eef76ee3          	bltu	a4,a5,80005960 <readi+0x7e>
    80005a68:	a011                	j	80005a6c <readi+0x18a>
      break;
    80005a6a:	0001                	nop
  }
  return tot;
    80005a6c:	fec42783          	lw	a5,-20(s0)
}
    80005a70:	853e                	mv	a0,a5
    80005a72:	60a6                	ld	ra,72(sp)
    80005a74:	6406                	ld	s0,64(sp)
    80005a76:	6161                	addi	sp,sp,80
    80005a78:	8082                	ret

0000000080005a7a <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005a7a:	715d                	addi	sp,sp,-80
    80005a7c:	e486                	sd	ra,72(sp)
    80005a7e:	e0a2                	sd	s0,64(sp)
    80005a80:	0880                	addi	s0,sp,80
    80005a82:	fca43423          	sd	a0,-56(s0)
    80005a86:	87ae                	mv	a5,a1
    80005a88:	fac43c23          	sd	a2,-72(s0)
    80005a8c:	fcf42223          	sw	a5,-60(s0)
    80005a90:	87b6                	mv	a5,a3
    80005a92:	fcf42023          	sw	a5,-64(s0)
    80005a96:	87ba                	mv	a5,a4
    80005a98:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005a9c:	fc843783          	ld	a5,-56(s0)
    80005aa0:	47f8                	lw	a4,76(a5)
    80005aa2:	fc042783          	lw	a5,-64(s0)
    80005aa6:	2781                	sext.w	a5,a5
    80005aa8:	00f76e63          	bltu	a4,a5,80005ac4 <writei+0x4a>
    80005aac:	fc042703          	lw	a4,-64(s0)
    80005ab0:	fb442783          	lw	a5,-76(s0)
    80005ab4:	9fb9                	addw	a5,a5,a4
    80005ab6:	0007871b          	sext.w	a4,a5
    80005aba:	fc042783          	lw	a5,-64(s0)
    80005abe:	2781                	sext.w	a5,a5
    80005ac0:	00f77463          	bgeu	a4,a5,80005ac8 <writei+0x4e>
    return -1;
    80005ac4:	57fd                	li	a5,-1
    80005ac6:	aab9                	j	80005c24 <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005ac8:	fc042703          	lw	a4,-64(s0)
    80005acc:	fb442783          	lw	a5,-76(s0)
    80005ad0:	9fb9                	addw	a5,a5,a4
    80005ad2:	2781                	sext.w	a5,a5
    80005ad4:	873e                	mv	a4,a5
    80005ad6:	000437b7          	lui	a5,0x43
    80005ada:	00e7f463          	bgeu	a5,a4,80005ae2 <writei+0x68>
    return -1;
    80005ade:	57fd                	li	a5,-1
    80005ae0:	a291                	j	80005c24 <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005ae2:	fe042623          	sw	zero,-20(s0)
    80005ae6:	a201                	j	80005be6 <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005ae8:	fc042783          	lw	a5,-64(s0)
    80005aec:	00a7d79b          	srliw	a5,a5,0xa
    80005af0:	2781                	sext.w	a5,a5
    80005af2:	85be                	mv	a1,a5
    80005af4:	fc843503          	ld	a0,-56(s0)
    80005af8:	00000097          	auipc	ra,0x0
    80005afc:	ac0080e7          	jalr	-1344(ra) # 800055b8 <bmap>
    80005b00:	87aa                	mv	a5,a0
    80005b02:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005b06:	fe842783          	lw	a5,-24(s0)
    80005b0a:	2781                	sext.w	a5,a5
    80005b0c:	c7f5                	beqz	a5,80005bf8 <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005b0e:	fc843783          	ld	a5,-56(s0)
    80005b12:	439c                	lw	a5,0(a5)
    80005b14:	fe842703          	lw	a4,-24(s0)
    80005b18:	85ba                	mv	a1,a4
    80005b1a:	853e                	mv	a0,a5
    80005b1c:	fffff097          	auipc	ra,0xfffff
    80005b20:	e1c080e7          	jalr	-484(ra) # 80004938 <bread>
    80005b24:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005b28:	fc042783          	lw	a5,-64(s0)
    80005b2c:	3ff7f793          	andi	a5,a5,1023
    80005b30:	2781                	sext.w	a5,a5
    80005b32:	40000713          	li	a4,1024
    80005b36:	40f707bb          	subw	a5,a4,a5
    80005b3a:	0007869b          	sext.w	a3,a5
    80005b3e:	fb442703          	lw	a4,-76(s0)
    80005b42:	fec42783          	lw	a5,-20(s0)
    80005b46:	40f707bb          	subw	a5,a4,a5
    80005b4a:	2781                	sext.w	a5,a5
    80005b4c:	863e                	mv	a2,a5
    80005b4e:	87b6                	mv	a5,a3
    80005b50:	0007869b          	sext.w	a3,a5
    80005b54:	0006071b          	sext.w	a4,a2
    80005b58:	00d77363          	bgeu	a4,a3,80005b5e <writei+0xe4>
    80005b5c:	87b2                	mv	a5,a2
    80005b5e:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005b62:	fe043783          	ld	a5,-32(s0)
    80005b66:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005b6a:	fc046783          	lwu	a5,-64(s0)
    80005b6e:	3ff7f793          	andi	a5,a5,1023
    80005b72:	97ba                	add	a5,a5,a4
    80005b74:	fdc46683          	lwu	a3,-36(s0)
    80005b78:	fc442703          	lw	a4,-60(s0)
    80005b7c:	fb843603          	ld	a2,-72(s0)
    80005b80:	85ba                	mv	a1,a4
    80005b82:	853e                	mv	a0,a5
    80005b84:	ffffe097          	auipc	ra,0xffffe
    80005b88:	dc6080e7          	jalr	-570(ra) # 8000394a <either_copyin>
    80005b8c:	87aa                	mv	a5,a0
    80005b8e:	873e                	mv	a4,a5
    80005b90:	57fd                	li	a5,-1
    80005b92:	00f71963          	bne	a4,a5,80005ba4 <writei+0x12a>
      brelse(bp);
    80005b96:	fe043503          	ld	a0,-32(s0)
    80005b9a:	fffff097          	auipc	ra,0xfffff
    80005b9e:	e48080e7          	jalr	-440(ra) # 800049e2 <brelse>
      break;
    80005ba2:	a8a1                	j	80005bfa <writei+0x180>
    }
    log_write(bp);
    80005ba4:	fe043503          	ld	a0,-32(s0)
    80005ba8:	00001097          	auipc	ra,0x1
    80005bac:	aec080e7          	jalr	-1300(ra) # 80006694 <log_write>
    brelse(bp);
    80005bb0:	fe043503          	ld	a0,-32(s0)
    80005bb4:	fffff097          	auipc	ra,0xfffff
    80005bb8:	e2e080e7          	jalr	-466(ra) # 800049e2 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005bbc:	fec42703          	lw	a4,-20(s0)
    80005bc0:	fdc42783          	lw	a5,-36(s0)
    80005bc4:	9fb9                	addw	a5,a5,a4
    80005bc6:	fef42623          	sw	a5,-20(s0)
    80005bca:	fc042703          	lw	a4,-64(s0)
    80005bce:	fdc42783          	lw	a5,-36(s0)
    80005bd2:	9fb9                	addw	a5,a5,a4
    80005bd4:	fcf42023          	sw	a5,-64(s0)
    80005bd8:	fdc46783          	lwu	a5,-36(s0)
    80005bdc:	fb843703          	ld	a4,-72(s0)
    80005be0:	97ba                	add	a5,a5,a4
    80005be2:	faf43c23          	sd	a5,-72(s0)
    80005be6:	fec42703          	lw	a4,-20(s0)
    80005bea:	fb442783          	lw	a5,-76(s0)
    80005bee:	2701                	sext.w	a4,a4
    80005bf0:	2781                	sext.w	a5,a5
    80005bf2:	eef76be3          	bltu	a4,a5,80005ae8 <writei+0x6e>
    80005bf6:	a011                	j	80005bfa <writei+0x180>
      break;
    80005bf8:	0001                	nop
  }

  if(off > ip->size)
    80005bfa:	fc843783          	ld	a5,-56(s0)
    80005bfe:	47f8                	lw	a4,76(a5)
    80005c00:	fc042783          	lw	a5,-64(s0)
    80005c04:	2781                	sext.w	a5,a5
    80005c06:	00f77763          	bgeu	a4,a5,80005c14 <writei+0x19a>
    ip->size = off;
    80005c0a:	fc843783          	ld	a5,-56(s0)
    80005c0e:	fc042703          	lw	a4,-64(s0)
    80005c12:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005c14:	fc843503          	ld	a0,-56(s0)
    80005c18:	fffff097          	auipc	ra,0xfffff
    80005c1c:	4c4080e7          	jalr	1220(ra) # 800050dc <iupdate>

  return tot;
    80005c20:	fec42783          	lw	a5,-20(s0)
}
    80005c24:	853e                	mv	a0,a5
    80005c26:	60a6                	ld	ra,72(sp)
    80005c28:	6406                	ld	s0,64(sp)
    80005c2a:	6161                	addi	sp,sp,80
    80005c2c:	8082                	ret

0000000080005c2e <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005c2e:	1101                	addi	sp,sp,-32
    80005c30:	ec06                	sd	ra,24(sp)
    80005c32:	e822                	sd	s0,16(sp)
    80005c34:	1000                	addi	s0,sp,32
    80005c36:	fea43423          	sd	a0,-24(s0)
    80005c3a:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005c3e:	4639                	li	a2,14
    80005c40:	fe043583          	ld	a1,-32(s0)
    80005c44:	fe843503          	ld	a0,-24(s0)
    80005c48:	ffffc097          	auipc	ra,0xffffc
    80005c4c:	aae080e7          	jalr	-1362(ra) # 800016f6 <strncmp>
    80005c50:	87aa                	mv	a5,a0
}
    80005c52:	853e                	mv	a0,a5
    80005c54:	60e2                	ld	ra,24(sp)
    80005c56:	6442                	ld	s0,16(sp)
    80005c58:	6105                	addi	sp,sp,32
    80005c5a:	8082                	ret

0000000080005c5c <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005c5c:	715d                	addi	sp,sp,-80
    80005c5e:	e486                	sd	ra,72(sp)
    80005c60:	e0a2                	sd	s0,64(sp)
    80005c62:	0880                	addi	s0,sp,80
    80005c64:	fca43423          	sd	a0,-56(s0)
    80005c68:	fcb43023          	sd	a1,-64(s0)
    80005c6c:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005c70:	fc843783          	ld	a5,-56(s0)
    80005c74:	04479783          	lh	a5,68(a5)
    80005c78:	0007871b          	sext.w	a4,a5
    80005c7c:	4785                	li	a5,1
    80005c7e:	00f70a63          	beq	a4,a5,80005c92 <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005c82:	00006517          	auipc	a0,0x6
    80005c86:	89e50513          	addi	a0,a0,-1890 # 8000b520 <etext+0x520>
    80005c8a:	ffffb097          	auipc	ra,0xffffb
    80005c8e:	002080e7          	jalr	2(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c92:	fe042623          	sw	zero,-20(s0)
    80005c96:	a849                	j	80005d28 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005c98:	fd840793          	addi	a5,s0,-40
    80005c9c:	fec42683          	lw	a3,-20(s0)
    80005ca0:	4741                	li	a4,16
    80005ca2:	863e                	mv	a2,a5
    80005ca4:	4581                	li	a1,0
    80005ca6:	fc843503          	ld	a0,-56(s0)
    80005caa:	00000097          	auipc	ra,0x0
    80005cae:	c38080e7          	jalr	-968(ra) # 800058e2 <readi>
    80005cb2:	87aa                	mv	a5,a0
    80005cb4:	873e                	mv	a4,a5
    80005cb6:	47c1                	li	a5,16
    80005cb8:	00f70a63          	beq	a4,a5,80005ccc <dirlookup+0x70>
      panic("dirlookup read");
    80005cbc:	00006517          	auipc	a0,0x6
    80005cc0:	87c50513          	addi	a0,a0,-1924 # 8000b538 <etext+0x538>
    80005cc4:	ffffb097          	auipc	ra,0xffffb
    80005cc8:	fc8080e7          	jalr	-56(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005ccc:	fd845783          	lhu	a5,-40(s0)
    80005cd0:	c7b1                	beqz	a5,80005d1c <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005cd2:	fd840793          	addi	a5,s0,-40
    80005cd6:	0789                	addi	a5,a5,2
    80005cd8:	85be                	mv	a1,a5
    80005cda:	fc043503          	ld	a0,-64(s0)
    80005cde:	00000097          	auipc	ra,0x0
    80005ce2:	f50080e7          	jalr	-176(ra) # 80005c2e <namecmp>
    80005ce6:	87aa                	mv	a5,a0
    80005ce8:	eb9d                	bnez	a5,80005d1e <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005cea:	fb843783          	ld	a5,-72(s0)
    80005cee:	c791                	beqz	a5,80005cfa <dirlookup+0x9e>
        *poff = off;
    80005cf0:	fb843783          	ld	a5,-72(s0)
    80005cf4:	fec42703          	lw	a4,-20(s0)
    80005cf8:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005cfa:	fd845783          	lhu	a5,-40(s0)
    80005cfe:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005d02:	fc843783          	ld	a5,-56(s0)
    80005d06:	439c                	lw	a5,0(a5)
    80005d08:	fe842703          	lw	a4,-24(s0)
    80005d0c:	85ba                	mv	a1,a4
    80005d0e:	853e                	mv	a0,a5
    80005d10:	fffff097          	auipc	ra,0xfffff
    80005d14:	4b4080e7          	jalr	1204(ra) # 800051c4 <iget>
    80005d18:	87aa                	mv	a5,a0
    80005d1a:	a005                	j	80005d3a <dirlookup+0xde>
      continue;
    80005d1c:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d1e:	fec42783          	lw	a5,-20(s0)
    80005d22:	27c1                	addiw	a5,a5,16
    80005d24:	fef42623          	sw	a5,-20(s0)
    80005d28:	fc843783          	ld	a5,-56(s0)
    80005d2c:	47f8                	lw	a4,76(a5)
    80005d2e:	fec42783          	lw	a5,-20(s0)
    80005d32:	2781                	sext.w	a5,a5
    80005d34:	f6e7e2e3          	bltu	a5,a4,80005c98 <dirlookup+0x3c>
    }
  }

  return 0;
    80005d38:	4781                	li	a5,0
}
    80005d3a:	853e                	mv	a0,a5
    80005d3c:	60a6                	ld	ra,72(sp)
    80005d3e:	6406                	ld	s0,64(sp)
    80005d40:	6161                	addi	sp,sp,80
    80005d42:	8082                	ret

0000000080005d44 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005d44:	715d                	addi	sp,sp,-80
    80005d46:	e486                	sd	ra,72(sp)
    80005d48:	e0a2                	sd	s0,64(sp)
    80005d4a:	0880                	addi	s0,sp,80
    80005d4c:	fca43423          	sd	a0,-56(s0)
    80005d50:	fcb43023          	sd	a1,-64(s0)
    80005d54:	87b2                	mv	a5,a2
    80005d56:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005d5a:	4601                	li	a2,0
    80005d5c:	fc043583          	ld	a1,-64(s0)
    80005d60:	fc843503          	ld	a0,-56(s0)
    80005d64:	00000097          	auipc	ra,0x0
    80005d68:	ef8080e7          	jalr	-264(ra) # 80005c5c <dirlookup>
    80005d6c:	fea43023          	sd	a0,-32(s0)
    80005d70:	fe043783          	ld	a5,-32(s0)
    80005d74:	cb89                	beqz	a5,80005d86 <dirlink+0x42>
    iput(ip);
    80005d76:	fe043503          	ld	a0,-32(s0)
    80005d7a:	fffff097          	auipc	ra,0xfffff
    80005d7e:	740080e7          	jalr	1856(ra) # 800054ba <iput>
    return -1;
    80005d82:	57fd                	li	a5,-1
    80005d84:	a075                	j	80005e30 <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d86:	fe042623          	sw	zero,-20(s0)
    80005d8a:	a0a1                	j	80005dd2 <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d8c:	fd040793          	addi	a5,s0,-48
    80005d90:	fec42683          	lw	a3,-20(s0)
    80005d94:	4741                	li	a4,16
    80005d96:	863e                	mv	a2,a5
    80005d98:	4581                	li	a1,0
    80005d9a:	fc843503          	ld	a0,-56(s0)
    80005d9e:	00000097          	auipc	ra,0x0
    80005da2:	b44080e7          	jalr	-1212(ra) # 800058e2 <readi>
    80005da6:	87aa                	mv	a5,a0
    80005da8:	873e                	mv	a4,a5
    80005daa:	47c1                	li	a5,16
    80005dac:	00f70a63          	beq	a4,a5,80005dc0 <dirlink+0x7c>
      panic("dirlink read");
    80005db0:	00005517          	auipc	a0,0x5
    80005db4:	79850513          	addi	a0,a0,1944 # 8000b548 <etext+0x548>
    80005db8:	ffffb097          	auipc	ra,0xffffb
    80005dbc:	ed4080e7          	jalr	-300(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005dc0:	fd045783          	lhu	a5,-48(s0)
    80005dc4:	cf99                	beqz	a5,80005de2 <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005dc6:	fec42783          	lw	a5,-20(s0)
    80005dca:	27c1                	addiw	a5,a5,16
    80005dcc:	2781                	sext.w	a5,a5
    80005dce:	fef42623          	sw	a5,-20(s0)
    80005dd2:	fc843783          	ld	a5,-56(s0)
    80005dd6:	47f8                	lw	a4,76(a5)
    80005dd8:	fec42783          	lw	a5,-20(s0)
    80005ddc:	fae7e8e3          	bltu	a5,a4,80005d8c <dirlink+0x48>
    80005de0:	a011                	j	80005de4 <dirlink+0xa0>
      break;
    80005de2:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005de4:	fd040793          	addi	a5,s0,-48
    80005de8:	0789                	addi	a5,a5,2
    80005dea:	4639                	li	a2,14
    80005dec:	fc043583          	ld	a1,-64(s0)
    80005df0:	853e                	mv	a0,a5
    80005df2:	ffffc097          	auipc	ra,0xffffc
    80005df6:	98e080e7          	jalr	-1650(ra) # 80001780 <strncpy>
  de.inum = inum;
    80005dfa:	fbc42783          	lw	a5,-68(s0)
    80005dfe:	17c2                	slli	a5,a5,0x30
    80005e00:	93c1                	srli	a5,a5,0x30
    80005e02:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005e06:	fd040793          	addi	a5,s0,-48
    80005e0a:	fec42683          	lw	a3,-20(s0)
    80005e0e:	4741                	li	a4,16
    80005e10:	863e                	mv	a2,a5
    80005e12:	4581                	li	a1,0
    80005e14:	fc843503          	ld	a0,-56(s0)
    80005e18:	00000097          	auipc	ra,0x0
    80005e1c:	c62080e7          	jalr	-926(ra) # 80005a7a <writei>
    80005e20:	87aa                	mv	a5,a0
    80005e22:	873e                	mv	a4,a5
    80005e24:	47c1                	li	a5,16
    80005e26:	00f70463          	beq	a4,a5,80005e2e <dirlink+0xea>
    return -1;
    80005e2a:	57fd                	li	a5,-1
    80005e2c:	a011                	j	80005e30 <dirlink+0xec>

  return 0;
    80005e2e:	4781                	li	a5,0
}
    80005e30:	853e                	mv	a0,a5
    80005e32:	60a6                	ld	ra,72(sp)
    80005e34:	6406                	ld	s0,64(sp)
    80005e36:	6161                	addi	sp,sp,80
    80005e38:	8082                	ret

0000000080005e3a <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005e3a:	7179                	addi	sp,sp,-48
    80005e3c:	f406                	sd	ra,40(sp)
    80005e3e:	f022                	sd	s0,32(sp)
    80005e40:	1800                	addi	s0,sp,48
    80005e42:	fca43c23          	sd	a0,-40(s0)
    80005e46:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005e4a:	a031                	j	80005e56 <skipelem+0x1c>
    path++;
    80005e4c:	fd843783          	ld	a5,-40(s0)
    80005e50:	0785                	addi	a5,a5,1
    80005e52:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005e56:	fd843783          	ld	a5,-40(s0)
    80005e5a:	0007c783          	lbu	a5,0(a5)
    80005e5e:	873e                	mv	a4,a5
    80005e60:	02f00793          	li	a5,47
    80005e64:	fef704e3          	beq	a4,a5,80005e4c <skipelem+0x12>
  if(*path == 0)
    80005e68:	fd843783          	ld	a5,-40(s0)
    80005e6c:	0007c783          	lbu	a5,0(a5)
    80005e70:	e399                	bnez	a5,80005e76 <skipelem+0x3c>
    return 0;
    80005e72:	4781                	li	a5,0
    80005e74:	a06d                	j	80005f1e <skipelem+0xe4>
  s = path;
    80005e76:	fd843783          	ld	a5,-40(s0)
    80005e7a:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005e7e:	a031                	j	80005e8a <skipelem+0x50>
    path++;
    80005e80:	fd843783          	ld	a5,-40(s0)
    80005e84:	0785                	addi	a5,a5,1
    80005e86:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005e8a:	fd843783          	ld	a5,-40(s0)
    80005e8e:	0007c783          	lbu	a5,0(a5)
    80005e92:	873e                	mv	a4,a5
    80005e94:	02f00793          	li	a5,47
    80005e98:	00f70763          	beq	a4,a5,80005ea6 <skipelem+0x6c>
    80005e9c:	fd843783          	ld	a5,-40(s0)
    80005ea0:	0007c783          	lbu	a5,0(a5)
    80005ea4:	fff1                	bnez	a5,80005e80 <skipelem+0x46>
  len = path - s;
    80005ea6:	fd843703          	ld	a4,-40(s0)
    80005eaa:	fe843783          	ld	a5,-24(s0)
    80005eae:	40f707b3          	sub	a5,a4,a5
    80005eb2:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005eb6:	fe442783          	lw	a5,-28(s0)
    80005eba:	0007871b          	sext.w	a4,a5
    80005ebe:	47b5                	li	a5,13
    80005ec0:	00e7dc63          	bge	a5,a4,80005ed8 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005ec4:	4639                	li	a2,14
    80005ec6:	fe843583          	ld	a1,-24(s0)
    80005eca:	fd043503          	ld	a0,-48(s0)
    80005ece:	ffffb097          	auipc	ra,0xffffb
    80005ed2:	714080e7          	jalr	1812(ra) # 800015e2 <memmove>
    80005ed6:	a80d                	j	80005f08 <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005ed8:	fe442783          	lw	a5,-28(s0)
    80005edc:	863e                	mv	a2,a5
    80005ede:	fe843583          	ld	a1,-24(s0)
    80005ee2:	fd043503          	ld	a0,-48(s0)
    80005ee6:	ffffb097          	auipc	ra,0xffffb
    80005eea:	6fc080e7          	jalr	1788(ra) # 800015e2 <memmove>
    name[len] = 0;
    80005eee:	fe442783          	lw	a5,-28(s0)
    80005ef2:	fd043703          	ld	a4,-48(s0)
    80005ef6:	97ba                	add	a5,a5,a4
    80005ef8:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005efc:	a031                	j	80005f08 <skipelem+0xce>
    path++;
    80005efe:	fd843783          	ld	a5,-40(s0)
    80005f02:	0785                	addi	a5,a5,1
    80005f04:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005f08:	fd843783          	ld	a5,-40(s0)
    80005f0c:	0007c783          	lbu	a5,0(a5)
    80005f10:	873e                	mv	a4,a5
    80005f12:	02f00793          	li	a5,47
    80005f16:	fef704e3          	beq	a4,a5,80005efe <skipelem+0xc4>
  return path;
    80005f1a:	fd843783          	ld	a5,-40(s0)
}
    80005f1e:	853e                	mv	a0,a5
    80005f20:	70a2                	ld	ra,40(sp)
    80005f22:	7402                	ld	s0,32(sp)
    80005f24:	6145                	addi	sp,sp,48
    80005f26:	8082                	ret

0000000080005f28 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005f28:	7139                	addi	sp,sp,-64
    80005f2a:	fc06                	sd	ra,56(sp)
    80005f2c:	f822                	sd	s0,48(sp)
    80005f2e:	0080                	addi	s0,sp,64
    80005f30:	fca43c23          	sd	a0,-40(s0)
    80005f34:	87ae                	mv	a5,a1
    80005f36:	fcc43423          	sd	a2,-56(s0)
    80005f3a:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005f3e:	fd843783          	ld	a5,-40(s0)
    80005f42:	0007c783          	lbu	a5,0(a5)
    80005f46:	873e                	mv	a4,a5
    80005f48:	02f00793          	li	a5,47
    80005f4c:	00f71b63          	bne	a4,a5,80005f62 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005f50:	4585                	li	a1,1
    80005f52:	4505                	li	a0,1
    80005f54:	fffff097          	auipc	ra,0xfffff
    80005f58:	270080e7          	jalr	624(ra) # 800051c4 <iget>
    80005f5c:	fea43423          	sd	a0,-24(s0)
    80005f60:	a84d                	j	80006012 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005f62:	ffffd097          	auipc	ra,0xffffd
    80005f66:	b64080e7          	jalr	-1180(ra) # 80002ac6 <myproc>
    80005f6a:	87aa                	mv	a5,a0
    80005f6c:	1507b783          	ld	a5,336(a5)
    80005f70:	853e                	mv	a0,a5
    80005f72:	fffff097          	auipc	ra,0xfffff
    80005f76:	36e080e7          	jalr	878(ra) # 800052e0 <idup>
    80005f7a:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005f7e:	a851                	j	80006012 <namex+0xea>
    ilock(ip);
    80005f80:	fe843503          	ld	a0,-24(s0)
    80005f84:	fffff097          	auipc	ra,0xfffff
    80005f88:	3a8080e7          	jalr	936(ra) # 8000532c <ilock>
    if(ip->type != T_DIR){
    80005f8c:	fe843783          	ld	a5,-24(s0)
    80005f90:	04479783          	lh	a5,68(a5)
    80005f94:	0007871b          	sext.w	a4,a5
    80005f98:	4785                	li	a5,1
    80005f9a:	00f70a63          	beq	a4,a5,80005fae <namex+0x86>
      iunlockput(ip);
    80005f9e:	fe843503          	ld	a0,-24(s0)
    80005fa2:	fffff097          	auipc	ra,0xfffff
    80005fa6:	5e8080e7          	jalr	1512(ra) # 8000558a <iunlockput>
      return 0;
    80005faa:	4781                	li	a5,0
    80005fac:	a871                	j	80006048 <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005fae:	fd442783          	lw	a5,-44(s0)
    80005fb2:	2781                	sext.w	a5,a5
    80005fb4:	cf99                	beqz	a5,80005fd2 <namex+0xaa>
    80005fb6:	fd843783          	ld	a5,-40(s0)
    80005fba:	0007c783          	lbu	a5,0(a5)
    80005fbe:	eb91                	bnez	a5,80005fd2 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005fc0:	fe843503          	ld	a0,-24(s0)
    80005fc4:	fffff097          	auipc	ra,0xfffff
    80005fc8:	49c080e7          	jalr	1180(ra) # 80005460 <iunlock>
      return ip;
    80005fcc:	fe843783          	ld	a5,-24(s0)
    80005fd0:	a8a5                	j	80006048 <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005fd2:	4601                	li	a2,0
    80005fd4:	fc843583          	ld	a1,-56(s0)
    80005fd8:	fe843503          	ld	a0,-24(s0)
    80005fdc:	00000097          	auipc	ra,0x0
    80005fe0:	c80080e7          	jalr	-896(ra) # 80005c5c <dirlookup>
    80005fe4:	fea43023          	sd	a0,-32(s0)
    80005fe8:	fe043783          	ld	a5,-32(s0)
    80005fec:	eb89                	bnez	a5,80005ffe <namex+0xd6>
      iunlockput(ip);
    80005fee:	fe843503          	ld	a0,-24(s0)
    80005ff2:	fffff097          	auipc	ra,0xfffff
    80005ff6:	598080e7          	jalr	1432(ra) # 8000558a <iunlockput>
      return 0;
    80005ffa:	4781                	li	a5,0
    80005ffc:	a0b1                	j	80006048 <namex+0x120>
    }
    iunlockput(ip);
    80005ffe:	fe843503          	ld	a0,-24(s0)
    80006002:	fffff097          	auipc	ra,0xfffff
    80006006:	588080e7          	jalr	1416(ra) # 8000558a <iunlockput>
    ip = next;
    8000600a:	fe043783          	ld	a5,-32(s0)
    8000600e:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80006012:	fc843583          	ld	a1,-56(s0)
    80006016:	fd843503          	ld	a0,-40(s0)
    8000601a:	00000097          	auipc	ra,0x0
    8000601e:	e20080e7          	jalr	-480(ra) # 80005e3a <skipelem>
    80006022:	fca43c23          	sd	a0,-40(s0)
    80006026:	fd843783          	ld	a5,-40(s0)
    8000602a:	fbb9                	bnez	a5,80005f80 <namex+0x58>
  }
  if(nameiparent){
    8000602c:	fd442783          	lw	a5,-44(s0)
    80006030:	2781                	sext.w	a5,a5
    80006032:	cb89                	beqz	a5,80006044 <namex+0x11c>
    iput(ip);
    80006034:	fe843503          	ld	a0,-24(s0)
    80006038:	fffff097          	auipc	ra,0xfffff
    8000603c:	482080e7          	jalr	1154(ra) # 800054ba <iput>
    return 0;
    80006040:	4781                	li	a5,0
    80006042:	a019                	j	80006048 <namex+0x120>
  }
  return ip;
    80006044:	fe843783          	ld	a5,-24(s0)
}
    80006048:	853e                	mv	a0,a5
    8000604a:	70e2                	ld	ra,56(sp)
    8000604c:	7442                	ld	s0,48(sp)
    8000604e:	6121                	addi	sp,sp,64
    80006050:	8082                	ret

0000000080006052 <namei>:

struct inode*
namei(char *path)
{
    80006052:	7179                	addi	sp,sp,-48
    80006054:	f406                	sd	ra,40(sp)
    80006056:	f022                	sd	s0,32(sp)
    80006058:	1800                	addi	s0,sp,48
    8000605a:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    8000605e:	fe040793          	addi	a5,s0,-32
    80006062:	863e                	mv	a2,a5
    80006064:	4581                	li	a1,0
    80006066:	fd843503          	ld	a0,-40(s0)
    8000606a:	00000097          	auipc	ra,0x0
    8000606e:	ebe080e7          	jalr	-322(ra) # 80005f28 <namex>
    80006072:	87aa                	mv	a5,a0
}
    80006074:	853e                	mv	a0,a5
    80006076:	70a2                	ld	ra,40(sp)
    80006078:	7402                	ld	s0,32(sp)
    8000607a:	6145                	addi	sp,sp,48
    8000607c:	8082                	ret

000000008000607e <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    8000607e:	1101                	addi	sp,sp,-32
    80006080:	ec06                	sd	ra,24(sp)
    80006082:	e822                	sd	s0,16(sp)
    80006084:	1000                	addi	s0,sp,32
    80006086:	fea43423          	sd	a0,-24(s0)
    8000608a:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    8000608e:	fe043603          	ld	a2,-32(s0)
    80006092:	4585                	li	a1,1
    80006094:	fe843503          	ld	a0,-24(s0)
    80006098:	00000097          	auipc	ra,0x0
    8000609c:	e90080e7          	jalr	-368(ra) # 80005f28 <namex>
    800060a0:	87aa                	mv	a5,a0
}
    800060a2:	853e                	mv	a0,a5
    800060a4:	60e2                	ld	ra,24(sp)
    800060a6:	6442                	ld	s0,16(sp)
    800060a8:	6105                	addi	sp,sp,32
    800060aa:	8082                	ret

00000000800060ac <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    800060ac:	1101                	addi	sp,sp,-32
    800060ae:	ec06                	sd	ra,24(sp)
    800060b0:	e822                	sd	s0,16(sp)
    800060b2:	1000                	addi	s0,sp,32
    800060b4:	87aa                	mv	a5,a0
    800060b6:	feb43023          	sd	a1,-32(s0)
    800060ba:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    800060be:	00005597          	auipc	a1,0x5
    800060c2:	49a58593          	addi	a1,a1,1178 # 8000b558 <etext+0x558>
    800060c6:	0002e517          	auipc	a0,0x2e
    800060ca:	ac250513          	addi	a0,a0,-1342 # 80033b88 <log>
    800060ce:	ffffb097          	auipc	ra,0xffffb
    800060d2:	22c080e7          	jalr	556(ra) # 800012fa <initlock>
  log.start = sb->logstart;
    800060d6:	fe043783          	ld	a5,-32(s0)
    800060da:	4bdc                	lw	a5,20(a5)
    800060dc:	0007871b          	sext.w	a4,a5
    800060e0:	0002e797          	auipc	a5,0x2e
    800060e4:	aa878793          	addi	a5,a5,-1368 # 80033b88 <log>
    800060e8:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800060ea:	fe043783          	ld	a5,-32(s0)
    800060ee:	4b9c                	lw	a5,16(a5)
    800060f0:	0007871b          	sext.w	a4,a5
    800060f4:	0002e797          	auipc	a5,0x2e
    800060f8:	a9478793          	addi	a5,a5,-1388 # 80033b88 <log>
    800060fc:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800060fe:	0002e797          	auipc	a5,0x2e
    80006102:	a8a78793          	addi	a5,a5,-1398 # 80033b88 <log>
    80006106:	fec42703          	lw	a4,-20(s0)
    8000610a:	d798                	sw	a4,40(a5)
  recover_from_log();
    8000610c:	00000097          	auipc	ra,0x0
    80006110:	272080e7          	jalr	626(ra) # 8000637e <recover_from_log>
}
    80006114:	0001                	nop
    80006116:	60e2                	ld	ra,24(sp)
    80006118:	6442                	ld	s0,16(sp)
    8000611a:	6105                	addi	sp,sp,32
    8000611c:	8082                	ret

000000008000611e <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    8000611e:	7139                	addi	sp,sp,-64
    80006120:	fc06                	sd	ra,56(sp)
    80006122:	f822                	sd	s0,48(sp)
    80006124:	0080                	addi	s0,sp,64
    80006126:	87aa                	mv	a5,a0
    80006128:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    8000612c:	fe042623          	sw	zero,-20(s0)
    80006130:	a0f9                	j	800061fe <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80006132:	0002e797          	auipc	a5,0x2e
    80006136:	a5678793          	addi	a5,a5,-1450 # 80033b88 <log>
    8000613a:	579c                	lw	a5,40(a5)
    8000613c:	0007869b          	sext.w	a3,a5
    80006140:	0002e797          	auipc	a5,0x2e
    80006144:	a4878793          	addi	a5,a5,-1464 # 80033b88 <log>
    80006148:	4f9c                	lw	a5,24(a5)
    8000614a:	fec42703          	lw	a4,-20(s0)
    8000614e:	9fb9                	addw	a5,a5,a4
    80006150:	2781                	sext.w	a5,a5
    80006152:	2785                	addiw	a5,a5,1
    80006154:	2781                	sext.w	a5,a5
    80006156:	2781                	sext.w	a5,a5
    80006158:	85be                	mv	a1,a5
    8000615a:	8536                	mv	a0,a3
    8000615c:	ffffe097          	auipc	ra,0xffffe
    80006160:	7dc080e7          	jalr	2012(ra) # 80004938 <bread>
    80006164:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80006168:	0002e797          	auipc	a5,0x2e
    8000616c:	a2078793          	addi	a5,a5,-1504 # 80033b88 <log>
    80006170:	579c                	lw	a5,40(a5)
    80006172:	0007869b          	sext.w	a3,a5
    80006176:	0002e717          	auipc	a4,0x2e
    8000617a:	a1270713          	addi	a4,a4,-1518 # 80033b88 <log>
    8000617e:	fec42783          	lw	a5,-20(s0)
    80006182:	07a1                	addi	a5,a5,8
    80006184:	078a                	slli	a5,a5,0x2
    80006186:	97ba                	add	a5,a5,a4
    80006188:	4b9c                	lw	a5,16(a5)
    8000618a:	2781                	sext.w	a5,a5
    8000618c:	85be                	mv	a1,a5
    8000618e:	8536                	mv	a0,a3
    80006190:	ffffe097          	auipc	ra,0xffffe
    80006194:	7a8080e7          	jalr	1960(ra) # 80004938 <bread>
    80006198:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    8000619c:	fd843783          	ld	a5,-40(s0)
    800061a0:	05878713          	addi	a4,a5,88
    800061a4:	fe043783          	ld	a5,-32(s0)
    800061a8:	05878793          	addi	a5,a5,88
    800061ac:	40000613          	li	a2,1024
    800061b0:	85be                	mv	a1,a5
    800061b2:	853a                	mv	a0,a4
    800061b4:	ffffb097          	auipc	ra,0xffffb
    800061b8:	42e080e7          	jalr	1070(ra) # 800015e2 <memmove>
    bwrite(dbuf);  // write dst to disk
    800061bc:	fd843503          	ld	a0,-40(s0)
    800061c0:	ffffe097          	auipc	ra,0xffffe
    800061c4:	7d6080e7          	jalr	2006(ra) # 80004996 <bwrite>
    if(recovering == 0)
    800061c8:	fcc42783          	lw	a5,-52(s0)
    800061cc:	2781                	sext.w	a5,a5
    800061ce:	e799                	bnez	a5,800061dc <install_trans+0xbe>
      bunpin(dbuf);
    800061d0:	fd843503          	ld	a0,-40(s0)
    800061d4:	fffff097          	auipc	ra,0xfffff
    800061d8:	944080e7          	jalr	-1724(ra) # 80004b18 <bunpin>
    brelse(lbuf);
    800061dc:	fe043503          	ld	a0,-32(s0)
    800061e0:	fffff097          	auipc	ra,0xfffff
    800061e4:	802080e7          	jalr	-2046(ra) # 800049e2 <brelse>
    brelse(dbuf);
    800061e8:	fd843503          	ld	a0,-40(s0)
    800061ec:	ffffe097          	auipc	ra,0xffffe
    800061f0:	7f6080e7          	jalr	2038(ra) # 800049e2 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800061f4:	fec42783          	lw	a5,-20(s0)
    800061f8:	2785                	addiw	a5,a5,1
    800061fa:	fef42623          	sw	a5,-20(s0)
    800061fe:	0002e797          	auipc	a5,0x2e
    80006202:	98a78793          	addi	a5,a5,-1654 # 80033b88 <log>
    80006206:	57d8                	lw	a4,44(a5)
    80006208:	fec42783          	lw	a5,-20(s0)
    8000620c:	2781                	sext.w	a5,a5
    8000620e:	f2e7c2e3          	blt	a5,a4,80006132 <install_trans+0x14>
  }
}
    80006212:	0001                	nop
    80006214:	0001                	nop
    80006216:	70e2                	ld	ra,56(sp)
    80006218:	7442                	ld	s0,48(sp)
    8000621a:	6121                	addi	sp,sp,64
    8000621c:	8082                	ret

000000008000621e <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    8000621e:	7179                	addi	sp,sp,-48
    80006220:	f406                	sd	ra,40(sp)
    80006222:	f022                	sd	s0,32(sp)
    80006224:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006226:	0002e797          	auipc	a5,0x2e
    8000622a:	96278793          	addi	a5,a5,-1694 # 80033b88 <log>
    8000622e:	579c                	lw	a5,40(a5)
    80006230:	0007871b          	sext.w	a4,a5
    80006234:	0002e797          	auipc	a5,0x2e
    80006238:	95478793          	addi	a5,a5,-1708 # 80033b88 <log>
    8000623c:	4f9c                	lw	a5,24(a5)
    8000623e:	2781                	sext.w	a5,a5
    80006240:	85be                	mv	a1,a5
    80006242:	853a                	mv	a0,a4
    80006244:	ffffe097          	auipc	ra,0xffffe
    80006248:	6f4080e7          	jalr	1780(ra) # 80004938 <bread>
    8000624c:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80006250:	fe043783          	ld	a5,-32(s0)
    80006254:	05878793          	addi	a5,a5,88
    80006258:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    8000625c:	fd843783          	ld	a5,-40(s0)
    80006260:	4398                	lw	a4,0(a5)
    80006262:	0002e797          	auipc	a5,0x2e
    80006266:	92678793          	addi	a5,a5,-1754 # 80033b88 <log>
    8000626a:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000626c:	fe042623          	sw	zero,-20(s0)
    80006270:	a03d                	j	8000629e <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80006272:	fd843703          	ld	a4,-40(s0)
    80006276:	fec42783          	lw	a5,-20(s0)
    8000627a:	078a                	slli	a5,a5,0x2
    8000627c:	97ba                	add	a5,a5,a4
    8000627e:	43d8                	lw	a4,4(a5)
    80006280:	0002e697          	auipc	a3,0x2e
    80006284:	90868693          	addi	a3,a3,-1784 # 80033b88 <log>
    80006288:	fec42783          	lw	a5,-20(s0)
    8000628c:	07a1                	addi	a5,a5,8
    8000628e:	078a                	slli	a5,a5,0x2
    80006290:	97b6                	add	a5,a5,a3
    80006292:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006294:	fec42783          	lw	a5,-20(s0)
    80006298:	2785                	addiw	a5,a5,1
    8000629a:	fef42623          	sw	a5,-20(s0)
    8000629e:	0002e797          	auipc	a5,0x2e
    800062a2:	8ea78793          	addi	a5,a5,-1814 # 80033b88 <log>
    800062a6:	57d8                	lw	a4,44(a5)
    800062a8:	fec42783          	lw	a5,-20(s0)
    800062ac:	2781                	sext.w	a5,a5
    800062ae:	fce7c2e3          	blt	a5,a4,80006272 <read_head+0x54>
  }
  brelse(buf);
    800062b2:	fe043503          	ld	a0,-32(s0)
    800062b6:	ffffe097          	auipc	ra,0xffffe
    800062ba:	72c080e7          	jalr	1836(ra) # 800049e2 <brelse>
}
    800062be:	0001                	nop
    800062c0:	70a2                	ld	ra,40(sp)
    800062c2:	7402                	ld	s0,32(sp)
    800062c4:	6145                	addi	sp,sp,48
    800062c6:	8082                	ret

00000000800062c8 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    800062c8:	7179                	addi	sp,sp,-48
    800062ca:	f406                	sd	ra,40(sp)
    800062cc:	f022                	sd	s0,32(sp)
    800062ce:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800062d0:	0002e797          	auipc	a5,0x2e
    800062d4:	8b878793          	addi	a5,a5,-1864 # 80033b88 <log>
    800062d8:	579c                	lw	a5,40(a5)
    800062da:	0007871b          	sext.w	a4,a5
    800062de:	0002e797          	auipc	a5,0x2e
    800062e2:	8aa78793          	addi	a5,a5,-1878 # 80033b88 <log>
    800062e6:	4f9c                	lw	a5,24(a5)
    800062e8:	2781                	sext.w	a5,a5
    800062ea:	85be                	mv	a1,a5
    800062ec:	853a                	mv	a0,a4
    800062ee:	ffffe097          	auipc	ra,0xffffe
    800062f2:	64a080e7          	jalr	1610(ra) # 80004938 <bread>
    800062f6:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800062fa:	fe043783          	ld	a5,-32(s0)
    800062fe:	05878793          	addi	a5,a5,88
    80006302:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    80006306:	0002e797          	auipc	a5,0x2e
    8000630a:	88278793          	addi	a5,a5,-1918 # 80033b88 <log>
    8000630e:	57d8                	lw	a4,44(a5)
    80006310:	fd843783          	ld	a5,-40(s0)
    80006314:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006316:	fe042623          	sw	zero,-20(s0)
    8000631a:	a03d                	j	80006348 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    8000631c:	0002e717          	auipc	a4,0x2e
    80006320:	86c70713          	addi	a4,a4,-1940 # 80033b88 <log>
    80006324:	fec42783          	lw	a5,-20(s0)
    80006328:	07a1                	addi	a5,a5,8
    8000632a:	078a                	slli	a5,a5,0x2
    8000632c:	97ba                	add	a5,a5,a4
    8000632e:	4b98                	lw	a4,16(a5)
    80006330:	fd843683          	ld	a3,-40(s0)
    80006334:	fec42783          	lw	a5,-20(s0)
    80006338:	078a                	slli	a5,a5,0x2
    8000633a:	97b6                	add	a5,a5,a3
    8000633c:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000633e:	fec42783          	lw	a5,-20(s0)
    80006342:	2785                	addiw	a5,a5,1
    80006344:	fef42623          	sw	a5,-20(s0)
    80006348:	0002e797          	auipc	a5,0x2e
    8000634c:	84078793          	addi	a5,a5,-1984 # 80033b88 <log>
    80006350:	57d8                	lw	a4,44(a5)
    80006352:	fec42783          	lw	a5,-20(s0)
    80006356:	2781                	sext.w	a5,a5
    80006358:	fce7c2e3          	blt	a5,a4,8000631c <write_head+0x54>
  }
  bwrite(buf);
    8000635c:	fe043503          	ld	a0,-32(s0)
    80006360:	ffffe097          	auipc	ra,0xffffe
    80006364:	636080e7          	jalr	1590(ra) # 80004996 <bwrite>
  brelse(buf);
    80006368:	fe043503          	ld	a0,-32(s0)
    8000636c:	ffffe097          	auipc	ra,0xffffe
    80006370:	676080e7          	jalr	1654(ra) # 800049e2 <brelse>
}
    80006374:	0001                	nop
    80006376:	70a2                	ld	ra,40(sp)
    80006378:	7402                	ld	s0,32(sp)
    8000637a:	6145                	addi	sp,sp,48
    8000637c:	8082                	ret

000000008000637e <recover_from_log>:

static void
recover_from_log(void)
{
    8000637e:	1141                	addi	sp,sp,-16
    80006380:	e406                	sd	ra,8(sp)
    80006382:	e022                	sd	s0,0(sp)
    80006384:	0800                	addi	s0,sp,16
  read_head();
    80006386:	00000097          	auipc	ra,0x0
    8000638a:	e98080e7          	jalr	-360(ra) # 8000621e <read_head>
  install_trans(1); // if committed, copy from log to disk
    8000638e:	4505                	li	a0,1
    80006390:	00000097          	auipc	ra,0x0
    80006394:	d8e080e7          	jalr	-626(ra) # 8000611e <install_trans>
  log.lh.n = 0;
    80006398:	0002d797          	auipc	a5,0x2d
    8000639c:	7f078793          	addi	a5,a5,2032 # 80033b88 <log>
    800063a0:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    800063a4:	00000097          	auipc	ra,0x0
    800063a8:	f24080e7          	jalr	-220(ra) # 800062c8 <write_head>
}
    800063ac:	0001                	nop
    800063ae:	60a2                	ld	ra,8(sp)
    800063b0:	6402                	ld	s0,0(sp)
    800063b2:	0141                	addi	sp,sp,16
    800063b4:	8082                	ret

00000000800063b6 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800063b6:	1141                	addi	sp,sp,-16
    800063b8:	e406                	sd	ra,8(sp)
    800063ba:	e022                	sd	s0,0(sp)
    800063bc:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800063be:	0002d517          	auipc	a0,0x2d
    800063c2:	7ca50513          	addi	a0,a0,1994 # 80033b88 <log>
    800063c6:	ffffb097          	auipc	ra,0xffffb
    800063ca:	f64080e7          	jalr	-156(ra) # 8000132a <acquire>
  while(1){
    if(log.committing){
    800063ce:	0002d797          	auipc	a5,0x2d
    800063d2:	7ba78793          	addi	a5,a5,1978 # 80033b88 <log>
    800063d6:	53dc                	lw	a5,36(a5)
    800063d8:	cf91                	beqz	a5,800063f4 <begin_op+0x3e>
      sleep(&log, &log.lock);
    800063da:	0002d597          	auipc	a1,0x2d
    800063de:	7ae58593          	addi	a1,a1,1966 # 80033b88 <log>
    800063e2:	0002d517          	auipc	a0,0x2d
    800063e6:	7a650513          	addi	a0,a0,1958 # 80033b88 <log>
    800063ea:	ffffd097          	auipc	ra,0xffffd
    800063ee:	29e080e7          	jalr	670(ra) # 80003688 <sleep>
    800063f2:	bff1                	j	800063ce <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800063f4:	0002d797          	auipc	a5,0x2d
    800063f8:	79478793          	addi	a5,a5,1940 # 80033b88 <log>
    800063fc:	57d8                	lw	a4,44(a5)
    800063fe:	0002d797          	auipc	a5,0x2d
    80006402:	78a78793          	addi	a5,a5,1930 # 80033b88 <log>
    80006406:	539c                	lw	a5,32(a5)
    80006408:	2785                	addiw	a5,a5,1
    8000640a:	2781                	sext.w	a5,a5
    8000640c:	86be                	mv	a3,a5
    8000640e:	87b6                	mv	a5,a3
    80006410:	0027979b          	slliw	a5,a5,0x2
    80006414:	9fb5                	addw	a5,a5,a3
    80006416:	0017979b          	slliw	a5,a5,0x1
    8000641a:	2781                	sext.w	a5,a5
    8000641c:	9fb9                	addw	a5,a5,a4
    8000641e:	2781                	sext.w	a5,a5
    80006420:	873e                	mv	a4,a5
    80006422:	47f9                	li	a5,30
    80006424:	00e7df63          	bge	a5,a4,80006442 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    80006428:	0002d597          	auipc	a1,0x2d
    8000642c:	76058593          	addi	a1,a1,1888 # 80033b88 <log>
    80006430:	0002d517          	auipc	a0,0x2d
    80006434:	75850513          	addi	a0,a0,1880 # 80033b88 <log>
    80006438:	ffffd097          	auipc	ra,0xffffd
    8000643c:	250080e7          	jalr	592(ra) # 80003688 <sleep>
    80006440:	b779                	j	800063ce <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006442:	0002d797          	auipc	a5,0x2d
    80006446:	74678793          	addi	a5,a5,1862 # 80033b88 <log>
    8000644a:	539c                	lw	a5,32(a5)
    8000644c:	2785                	addiw	a5,a5,1
    8000644e:	0007871b          	sext.w	a4,a5
    80006452:	0002d797          	auipc	a5,0x2d
    80006456:	73678793          	addi	a5,a5,1846 # 80033b88 <log>
    8000645a:	d398                	sw	a4,32(a5)
      release(&log.lock);
    8000645c:	0002d517          	auipc	a0,0x2d
    80006460:	72c50513          	addi	a0,a0,1836 # 80033b88 <log>
    80006464:	ffffb097          	auipc	ra,0xffffb
    80006468:	f2a080e7          	jalr	-214(ra) # 8000138e <release>
      break;
    8000646c:	0001                	nop
    }
  }
}
    8000646e:	0001                	nop
    80006470:	60a2                	ld	ra,8(sp)
    80006472:	6402                	ld	s0,0(sp)
    80006474:	0141                	addi	sp,sp,16
    80006476:	8082                	ret

0000000080006478 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80006478:	1101                	addi	sp,sp,-32
    8000647a:	ec06                	sd	ra,24(sp)
    8000647c:	e822                	sd	s0,16(sp)
    8000647e:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006480:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006484:	0002d517          	auipc	a0,0x2d
    80006488:	70450513          	addi	a0,a0,1796 # 80033b88 <log>
    8000648c:	ffffb097          	auipc	ra,0xffffb
    80006490:	e9e080e7          	jalr	-354(ra) # 8000132a <acquire>
  log.outstanding -= 1;
    80006494:	0002d797          	auipc	a5,0x2d
    80006498:	6f478793          	addi	a5,a5,1780 # 80033b88 <log>
    8000649c:	539c                	lw	a5,32(a5)
    8000649e:	37fd                	addiw	a5,a5,-1
    800064a0:	0007871b          	sext.w	a4,a5
    800064a4:	0002d797          	auipc	a5,0x2d
    800064a8:	6e478793          	addi	a5,a5,1764 # 80033b88 <log>
    800064ac:	d398                	sw	a4,32(a5)
  if(log.committing)
    800064ae:	0002d797          	auipc	a5,0x2d
    800064b2:	6da78793          	addi	a5,a5,1754 # 80033b88 <log>
    800064b6:	53dc                	lw	a5,36(a5)
    800064b8:	cb89                	beqz	a5,800064ca <end_op+0x52>
    panic("log.committing");
    800064ba:	00005517          	auipc	a0,0x5
    800064be:	0a650513          	addi	a0,a0,166 # 8000b560 <etext+0x560>
    800064c2:	ffffa097          	auipc	ra,0xffffa
    800064c6:	7ca080e7          	jalr	1994(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    800064ca:	0002d797          	auipc	a5,0x2d
    800064ce:	6be78793          	addi	a5,a5,1726 # 80033b88 <log>
    800064d2:	539c                	lw	a5,32(a5)
    800064d4:	eb99                	bnez	a5,800064ea <end_op+0x72>
    do_commit = 1;
    800064d6:	4785                	li	a5,1
    800064d8:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800064dc:	0002d797          	auipc	a5,0x2d
    800064e0:	6ac78793          	addi	a5,a5,1708 # 80033b88 <log>
    800064e4:	4705                	li	a4,1
    800064e6:	d3d8                	sw	a4,36(a5)
    800064e8:	a809                	j	800064fa <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800064ea:	0002d517          	auipc	a0,0x2d
    800064ee:	69e50513          	addi	a0,a0,1694 # 80033b88 <log>
    800064f2:	ffffd097          	auipc	ra,0xffffd
    800064f6:	212080e7          	jalr	530(ra) # 80003704 <wakeup>
  }
  release(&log.lock);
    800064fa:	0002d517          	auipc	a0,0x2d
    800064fe:	68e50513          	addi	a0,a0,1678 # 80033b88 <log>
    80006502:	ffffb097          	auipc	ra,0xffffb
    80006506:	e8c080e7          	jalr	-372(ra) # 8000138e <release>

  if(do_commit){
    8000650a:	fec42783          	lw	a5,-20(s0)
    8000650e:	2781                	sext.w	a5,a5
    80006510:	c3b9                	beqz	a5,80006556 <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    80006512:	00000097          	auipc	ra,0x0
    80006516:	134080e7          	jalr	308(ra) # 80006646 <commit>
    acquire(&log.lock);
    8000651a:	0002d517          	auipc	a0,0x2d
    8000651e:	66e50513          	addi	a0,a0,1646 # 80033b88 <log>
    80006522:	ffffb097          	auipc	ra,0xffffb
    80006526:	e08080e7          	jalr	-504(ra) # 8000132a <acquire>
    log.committing = 0;
    8000652a:	0002d797          	auipc	a5,0x2d
    8000652e:	65e78793          	addi	a5,a5,1630 # 80033b88 <log>
    80006532:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    80006536:	0002d517          	auipc	a0,0x2d
    8000653a:	65250513          	addi	a0,a0,1618 # 80033b88 <log>
    8000653e:	ffffd097          	auipc	ra,0xffffd
    80006542:	1c6080e7          	jalr	454(ra) # 80003704 <wakeup>
    release(&log.lock);
    80006546:	0002d517          	auipc	a0,0x2d
    8000654a:	64250513          	addi	a0,a0,1602 # 80033b88 <log>
    8000654e:	ffffb097          	auipc	ra,0xffffb
    80006552:	e40080e7          	jalr	-448(ra) # 8000138e <release>
  }
}
    80006556:	0001                	nop
    80006558:	60e2                	ld	ra,24(sp)
    8000655a:	6442                	ld	s0,16(sp)
    8000655c:	6105                	addi	sp,sp,32
    8000655e:	8082                	ret

0000000080006560 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80006560:	7179                	addi	sp,sp,-48
    80006562:	f406                	sd	ra,40(sp)
    80006564:	f022                	sd	s0,32(sp)
    80006566:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006568:	fe042623          	sw	zero,-20(s0)
    8000656c:	a86d                	j	80006626 <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    8000656e:	0002d797          	auipc	a5,0x2d
    80006572:	61a78793          	addi	a5,a5,1562 # 80033b88 <log>
    80006576:	579c                	lw	a5,40(a5)
    80006578:	0007869b          	sext.w	a3,a5
    8000657c:	0002d797          	auipc	a5,0x2d
    80006580:	60c78793          	addi	a5,a5,1548 # 80033b88 <log>
    80006584:	4f9c                	lw	a5,24(a5)
    80006586:	fec42703          	lw	a4,-20(s0)
    8000658a:	9fb9                	addw	a5,a5,a4
    8000658c:	2781                	sext.w	a5,a5
    8000658e:	2785                	addiw	a5,a5,1
    80006590:	2781                	sext.w	a5,a5
    80006592:	2781                	sext.w	a5,a5
    80006594:	85be                	mv	a1,a5
    80006596:	8536                	mv	a0,a3
    80006598:	ffffe097          	auipc	ra,0xffffe
    8000659c:	3a0080e7          	jalr	928(ra) # 80004938 <bread>
    800065a0:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    800065a4:	0002d797          	auipc	a5,0x2d
    800065a8:	5e478793          	addi	a5,a5,1508 # 80033b88 <log>
    800065ac:	579c                	lw	a5,40(a5)
    800065ae:	0007869b          	sext.w	a3,a5
    800065b2:	0002d717          	auipc	a4,0x2d
    800065b6:	5d670713          	addi	a4,a4,1494 # 80033b88 <log>
    800065ba:	fec42783          	lw	a5,-20(s0)
    800065be:	07a1                	addi	a5,a5,8
    800065c0:	078a                	slli	a5,a5,0x2
    800065c2:	97ba                	add	a5,a5,a4
    800065c4:	4b9c                	lw	a5,16(a5)
    800065c6:	2781                	sext.w	a5,a5
    800065c8:	85be                	mv	a1,a5
    800065ca:	8536                	mv	a0,a3
    800065cc:	ffffe097          	auipc	ra,0xffffe
    800065d0:	36c080e7          	jalr	876(ra) # 80004938 <bread>
    800065d4:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800065d8:	fe043783          	ld	a5,-32(s0)
    800065dc:	05878713          	addi	a4,a5,88
    800065e0:	fd843783          	ld	a5,-40(s0)
    800065e4:	05878793          	addi	a5,a5,88
    800065e8:	40000613          	li	a2,1024
    800065ec:	85be                	mv	a1,a5
    800065ee:	853a                	mv	a0,a4
    800065f0:	ffffb097          	auipc	ra,0xffffb
    800065f4:	ff2080e7          	jalr	-14(ra) # 800015e2 <memmove>
    bwrite(to);  // write the log
    800065f8:	fe043503          	ld	a0,-32(s0)
    800065fc:	ffffe097          	auipc	ra,0xffffe
    80006600:	39a080e7          	jalr	922(ra) # 80004996 <bwrite>
    brelse(from);
    80006604:	fd843503          	ld	a0,-40(s0)
    80006608:	ffffe097          	auipc	ra,0xffffe
    8000660c:	3da080e7          	jalr	986(ra) # 800049e2 <brelse>
    brelse(to);
    80006610:	fe043503          	ld	a0,-32(s0)
    80006614:	ffffe097          	auipc	ra,0xffffe
    80006618:	3ce080e7          	jalr	974(ra) # 800049e2 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    8000661c:	fec42783          	lw	a5,-20(s0)
    80006620:	2785                	addiw	a5,a5,1
    80006622:	fef42623          	sw	a5,-20(s0)
    80006626:	0002d797          	auipc	a5,0x2d
    8000662a:	56278793          	addi	a5,a5,1378 # 80033b88 <log>
    8000662e:	57d8                	lw	a4,44(a5)
    80006630:	fec42783          	lw	a5,-20(s0)
    80006634:	2781                	sext.w	a5,a5
    80006636:	f2e7cce3          	blt	a5,a4,8000656e <write_log+0xe>
  }
}
    8000663a:	0001                	nop
    8000663c:	0001                	nop
    8000663e:	70a2                	ld	ra,40(sp)
    80006640:	7402                	ld	s0,32(sp)
    80006642:	6145                	addi	sp,sp,48
    80006644:	8082                	ret

0000000080006646 <commit>:

static void
commit()
{
    80006646:	1141                	addi	sp,sp,-16
    80006648:	e406                	sd	ra,8(sp)
    8000664a:	e022                	sd	s0,0(sp)
    8000664c:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    8000664e:	0002d797          	auipc	a5,0x2d
    80006652:	53a78793          	addi	a5,a5,1338 # 80033b88 <log>
    80006656:	57dc                	lw	a5,44(a5)
    80006658:	02f05963          	blez	a5,8000668a <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    8000665c:	00000097          	auipc	ra,0x0
    80006660:	f04080e7          	jalr	-252(ra) # 80006560 <write_log>
    write_head();    // Write header to disk -- the real commit
    80006664:	00000097          	auipc	ra,0x0
    80006668:	c64080e7          	jalr	-924(ra) # 800062c8 <write_head>
    install_trans(0); // Now install writes to home locations
    8000666c:	4501                	li	a0,0
    8000666e:	00000097          	auipc	ra,0x0
    80006672:	ab0080e7          	jalr	-1360(ra) # 8000611e <install_trans>
    log.lh.n = 0;
    80006676:	0002d797          	auipc	a5,0x2d
    8000667a:	51278793          	addi	a5,a5,1298 # 80033b88 <log>
    8000667e:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006682:	00000097          	auipc	ra,0x0
    80006686:	c46080e7          	jalr	-954(ra) # 800062c8 <write_head>
  }
}
    8000668a:	0001                	nop
    8000668c:	60a2                	ld	ra,8(sp)
    8000668e:	6402                	ld	s0,0(sp)
    80006690:	0141                	addi	sp,sp,16
    80006692:	8082                	ret

0000000080006694 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006694:	7179                	addi	sp,sp,-48
    80006696:	f406                	sd	ra,40(sp)
    80006698:	f022                	sd	s0,32(sp)
    8000669a:	1800                	addi	s0,sp,48
    8000669c:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    800066a0:	0002d517          	auipc	a0,0x2d
    800066a4:	4e850513          	addi	a0,a0,1256 # 80033b88 <log>
    800066a8:	ffffb097          	auipc	ra,0xffffb
    800066ac:	c82080e7          	jalr	-894(ra) # 8000132a <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    800066b0:	0002d797          	auipc	a5,0x2d
    800066b4:	4d878793          	addi	a5,a5,1240 # 80033b88 <log>
    800066b8:	57dc                	lw	a5,44(a5)
    800066ba:	873e                	mv	a4,a5
    800066bc:	47f5                	li	a5,29
    800066be:	02e7c063          	blt	a5,a4,800066de <log_write+0x4a>
    800066c2:	0002d797          	auipc	a5,0x2d
    800066c6:	4c678793          	addi	a5,a5,1222 # 80033b88 <log>
    800066ca:	57d8                	lw	a4,44(a5)
    800066cc:	0002d797          	auipc	a5,0x2d
    800066d0:	4bc78793          	addi	a5,a5,1212 # 80033b88 <log>
    800066d4:	4fdc                	lw	a5,28(a5)
    800066d6:	37fd                	addiw	a5,a5,-1
    800066d8:	2781                	sext.w	a5,a5
    800066da:	00f74a63          	blt	a4,a5,800066ee <log_write+0x5a>
    panic("too big a transaction");
    800066de:	00005517          	auipc	a0,0x5
    800066e2:	e9250513          	addi	a0,a0,-366 # 8000b570 <etext+0x570>
    800066e6:	ffffa097          	auipc	ra,0xffffa
    800066ea:	5a6080e7          	jalr	1446(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    800066ee:	0002d797          	auipc	a5,0x2d
    800066f2:	49a78793          	addi	a5,a5,1178 # 80033b88 <log>
    800066f6:	539c                	lw	a5,32(a5)
    800066f8:	00f04a63          	bgtz	a5,8000670c <log_write+0x78>
    panic("log_write outside of trans");
    800066fc:	00005517          	auipc	a0,0x5
    80006700:	e8c50513          	addi	a0,a0,-372 # 8000b588 <etext+0x588>
    80006704:	ffffa097          	auipc	ra,0xffffa
    80006708:	588080e7          	jalr	1416(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    8000670c:	fe042623          	sw	zero,-20(s0)
    80006710:	a03d                	j	8000673e <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    80006712:	0002d717          	auipc	a4,0x2d
    80006716:	47670713          	addi	a4,a4,1142 # 80033b88 <log>
    8000671a:	fec42783          	lw	a5,-20(s0)
    8000671e:	07a1                	addi	a5,a5,8
    80006720:	078a                	slli	a5,a5,0x2
    80006722:	97ba                	add	a5,a5,a4
    80006724:	4b9c                	lw	a5,16(a5)
    80006726:	0007871b          	sext.w	a4,a5
    8000672a:	fd843783          	ld	a5,-40(s0)
    8000672e:	47dc                	lw	a5,12(a5)
    80006730:	02f70263          	beq	a4,a5,80006754 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    80006734:	fec42783          	lw	a5,-20(s0)
    80006738:	2785                	addiw	a5,a5,1
    8000673a:	fef42623          	sw	a5,-20(s0)
    8000673e:	0002d797          	auipc	a5,0x2d
    80006742:	44a78793          	addi	a5,a5,1098 # 80033b88 <log>
    80006746:	57d8                	lw	a4,44(a5)
    80006748:	fec42783          	lw	a5,-20(s0)
    8000674c:	2781                	sext.w	a5,a5
    8000674e:	fce7c2e3          	blt	a5,a4,80006712 <log_write+0x7e>
    80006752:	a011                	j	80006756 <log_write+0xc2>
      break;
    80006754:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80006756:	fd843783          	ld	a5,-40(s0)
    8000675a:	47dc                	lw	a5,12(a5)
    8000675c:	0007871b          	sext.w	a4,a5
    80006760:	0002d697          	auipc	a3,0x2d
    80006764:	42868693          	addi	a3,a3,1064 # 80033b88 <log>
    80006768:	fec42783          	lw	a5,-20(s0)
    8000676c:	07a1                	addi	a5,a5,8
    8000676e:	078a                	slli	a5,a5,0x2
    80006770:	97b6                	add	a5,a5,a3
    80006772:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006774:	0002d797          	auipc	a5,0x2d
    80006778:	41478793          	addi	a5,a5,1044 # 80033b88 <log>
    8000677c:	57d8                	lw	a4,44(a5)
    8000677e:	fec42783          	lw	a5,-20(s0)
    80006782:	2781                	sext.w	a5,a5
    80006784:	02e79563          	bne	a5,a4,800067ae <log_write+0x11a>
    bpin(b);
    80006788:	fd843503          	ld	a0,-40(s0)
    8000678c:	ffffe097          	auipc	ra,0xffffe
    80006790:	344080e7          	jalr	836(ra) # 80004ad0 <bpin>
    log.lh.n++;
    80006794:	0002d797          	auipc	a5,0x2d
    80006798:	3f478793          	addi	a5,a5,1012 # 80033b88 <log>
    8000679c:	57dc                	lw	a5,44(a5)
    8000679e:	2785                	addiw	a5,a5,1
    800067a0:	0007871b          	sext.w	a4,a5
    800067a4:	0002d797          	auipc	a5,0x2d
    800067a8:	3e478793          	addi	a5,a5,996 # 80033b88 <log>
    800067ac:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    800067ae:	0002d517          	auipc	a0,0x2d
    800067b2:	3da50513          	addi	a0,a0,986 # 80033b88 <log>
    800067b6:	ffffb097          	auipc	ra,0xffffb
    800067ba:	bd8080e7          	jalr	-1064(ra) # 8000138e <release>
}
    800067be:	0001                	nop
    800067c0:	70a2                	ld	ra,40(sp)
    800067c2:	7402                	ld	s0,32(sp)
    800067c4:	6145                	addi	sp,sp,48
    800067c6:	8082                	ret

00000000800067c8 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    800067c8:	1101                	addi	sp,sp,-32
    800067ca:	ec06                	sd	ra,24(sp)
    800067cc:	e822                	sd	s0,16(sp)
    800067ce:	1000                	addi	s0,sp,32
    800067d0:	fea43423          	sd	a0,-24(s0)
    800067d4:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    800067d8:	fe843783          	ld	a5,-24(s0)
    800067dc:	07a1                	addi	a5,a5,8
    800067de:	00005597          	auipc	a1,0x5
    800067e2:	dca58593          	addi	a1,a1,-566 # 8000b5a8 <etext+0x5a8>
    800067e6:	853e                	mv	a0,a5
    800067e8:	ffffb097          	auipc	ra,0xffffb
    800067ec:	b12080e7          	jalr	-1262(ra) # 800012fa <initlock>
  lk->name = name;
    800067f0:	fe843783          	ld	a5,-24(s0)
    800067f4:	fe043703          	ld	a4,-32(s0)
    800067f8:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    800067fa:	fe843783          	ld	a5,-24(s0)
    800067fe:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006802:	fe843783          	ld	a5,-24(s0)
    80006806:	0207a423          	sw	zero,40(a5)
}
    8000680a:	0001                	nop
    8000680c:	60e2                	ld	ra,24(sp)
    8000680e:	6442                	ld	s0,16(sp)
    80006810:	6105                	addi	sp,sp,32
    80006812:	8082                	ret

0000000080006814 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80006814:	1101                	addi	sp,sp,-32
    80006816:	ec06                	sd	ra,24(sp)
    80006818:	e822                	sd	s0,16(sp)
    8000681a:	1000                	addi	s0,sp,32
    8000681c:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006820:	fe843783          	ld	a5,-24(s0)
    80006824:	07a1                	addi	a5,a5,8
    80006826:	853e                	mv	a0,a5
    80006828:	ffffb097          	auipc	ra,0xffffb
    8000682c:	b02080e7          	jalr	-1278(ra) # 8000132a <acquire>
  while (lk->locked) {
    80006830:	a819                	j	80006846 <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006832:	fe843783          	ld	a5,-24(s0)
    80006836:	07a1                	addi	a5,a5,8
    80006838:	85be                	mv	a1,a5
    8000683a:	fe843503          	ld	a0,-24(s0)
    8000683e:	ffffd097          	auipc	ra,0xffffd
    80006842:	e4a080e7          	jalr	-438(ra) # 80003688 <sleep>
  while (lk->locked) {
    80006846:	fe843783          	ld	a5,-24(s0)
    8000684a:	439c                	lw	a5,0(a5)
    8000684c:	f3fd                	bnez	a5,80006832 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    8000684e:	fe843783          	ld	a5,-24(s0)
    80006852:	4705                	li	a4,1
    80006854:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80006856:	ffffc097          	auipc	ra,0xffffc
    8000685a:	270080e7          	jalr	624(ra) # 80002ac6 <myproc>
    8000685e:	87aa                	mv	a5,a0
    80006860:	5b98                	lw	a4,48(a5)
    80006862:	fe843783          	ld	a5,-24(s0)
    80006866:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006868:	fe843783          	ld	a5,-24(s0)
    8000686c:	07a1                	addi	a5,a5,8
    8000686e:	853e                	mv	a0,a5
    80006870:	ffffb097          	auipc	ra,0xffffb
    80006874:	b1e080e7          	jalr	-1250(ra) # 8000138e <release>
}
    80006878:	0001                	nop
    8000687a:	60e2                	ld	ra,24(sp)
    8000687c:	6442                	ld	s0,16(sp)
    8000687e:	6105                	addi	sp,sp,32
    80006880:	8082                	ret

0000000080006882 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006882:	1101                	addi	sp,sp,-32
    80006884:	ec06                	sd	ra,24(sp)
    80006886:	e822                	sd	s0,16(sp)
    80006888:	1000                	addi	s0,sp,32
    8000688a:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    8000688e:	fe843783          	ld	a5,-24(s0)
    80006892:	07a1                	addi	a5,a5,8
    80006894:	853e                	mv	a0,a5
    80006896:	ffffb097          	auipc	ra,0xffffb
    8000689a:	a94080e7          	jalr	-1388(ra) # 8000132a <acquire>
  lk->locked = 0;
    8000689e:	fe843783          	ld	a5,-24(s0)
    800068a2:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800068a6:	fe843783          	ld	a5,-24(s0)
    800068aa:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    800068ae:	fe843503          	ld	a0,-24(s0)
    800068b2:	ffffd097          	auipc	ra,0xffffd
    800068b6:	e52080e7          	jalr	-430(ra) # 80003704 <wakeup>
  release(&lk->lk);
    800068ba:	fe843783          	ld	a5,-24(s0)
    800068be:	07a1                	addi	a5,a5,8
    800068c0:	853e                	mv	a0,a5
    800068c2:	ffffb097          	auipc	ra,0xffffb
    800068c6:	acc080e7          	jalr	-1332(ra) # 8000138e <release>
}
    800068ca:	0001                	nop
    800068cc:	60e2                	ld	ra,24(sp)
    800068ce:	6442                	ld	s0,16(sp)
    800068d0:	6105                	addi	sp,sp,32
    800068d2:	8082                	ret

00000000800068d4 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    800068d4:	7139                	addi	sp,sp,-64
    800068d6:	fc06                	sd	ra,56(sp)
    800068d8:	f822                	sd	s0,48(sp)
    800068da:	f426                	sd	s1,40(sp)
    800068dc:	0080                	addi	s0,sp,64
    800068de:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    800068e2:	fc843783          	ld	a5,-56(s0)
    800068e6:	07a1                	addi	a5,a5,8
    800068e8:	853e                	mv	a0,a5
    800068ea:	ffffb097          	auipc	ra,0xffffb
    800068ee:	a40080e7          	jalr	-1472(ra) # 8000132a <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800068f2:	fc843783          	ld	a5,-56(s0)
    800068f6:	439c                	lw	a5,0(a5)
    800068f8:	cf99                	beqz	a5,80006916 <holdingsleep+0x42>
    800068fa:	fc843783          	ld	a5,-56(s0)
    800068fe:	5784                	lw	s1,40(a5)
    80006900:	ffffc097          	auipc	ra,0xffffc
    80006904:	1c6080e7          	jalr	454(ra) # 80002ac6 <myproc>
    80006908:	87aa                	mv	a5,a0
    8000690a:	5b9c                	lw	a5,48(a5)
    8000690c:	8726                	mv	a4,s1
    8000690e:	00f71463          	bne	a4,a5,80006916 <holdingsleep+0x42>
    80006912:	4785                	li	a5,1
    80006914:	a011                	j	80006918 <holdingsleep+0x44>
    80006916:	4781                	li	a5,0
    80006918:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    8000691c:	fc843783          	ld	a5,-56(s0)
    80006920:	07a1                	addi	a5,a5,8
    80006922:	853e                	mv	a0,a5
    80006924:	ffffb097          	auipc	ra,0xffffb
    80006928:	a6a080e7          	jalr	-1430(ra) # 8000138e <release>
  return r;
    8000692c:	fdc42783          	lw	a5,-36(s0)
}
    80006930:	853e                	mv	a0,a5
    80006932:	70e2                	ld	ra,56(sp)
    80006934:	7442                	ld	s0,48(sp)
    80006936:	74a2                	ld	s1,40(sp)
    80006938:	6121                	addi	sp,sp,64
    8000693a:	8082                	ret

000000008000693c <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    8000693c:	1141                	addi	sp,sp,-16
    8000693e:	e406                	sd	ra,8(sp)
    80006940:	e022                	sd	s0,0(sp)
    80006942:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006944:	00005597          	auipc	a1,0x5
    80006948:	c7458593          	addi	a1,a1,-908 # 8000b5b8 <etext+0x5b8>
    8000694c:	0002d517          	auipc	a0,0x2d
    80006950:	38450513          	addi	a0,a0,900 # 80033cd0 <ftable>
    80006954:	ffffb097          	auipc	ra,0xffffb
    80006958:	9a6080e7          	jalr	-1626(ra) # 800012fa <initlock>
}
    8000695c:	0001                	nop
    8000695e:	60a2                	ld	ra,8(sp)
    80006960:	6402                	ld	s0,0(sp)
    80006962:	0141                	addi	sp,sp,16
    80006964:	8082                	ret

0000000080006966 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006966:	1101                	addi	sp,sp,-32
    80006968:	ec06                	sd	ra,24(sp)
    8000696a:	e822                	sd	s0,16(sp)
    8000696c:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    8000696e:	0002d517          	auipc	a0,0x2d
    80006972:	36250513          	addi	a0,a0,866 # 80033cd0 <ftable>
    80006976:	ffffb097          	auipc	ra,0xffffb
    8000697a:	9b4080e7          	jalr	-1612(ra) # 8000132a <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    8000697e:	0002d797          	auipc	a5,0x2d
    80006982:	36a78793          	addi	a5,a5,874 # 80033ce8 <ftable+0x18>
    80006986:	fef43423          	sd	a5,-24(s0)
    8000698a:	a815                	j	800069be <filealloc+0x58>
    if(f->ref == 0){
    8000698c:	fe843783          	ld	a5,-24(s0)
    80006990:	43dc                	lw	a5,4(a5)
    80006992:	e385                	bnez	a5,800069b2 <filealloc+0x4c>
      f->ref = 1;
    80006994:	fe843783          	ld	a5,-24(s0)
    80006998:	4705                	li	a4,1
    8000699a:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    8000699c:	0002d517          	auipc	a0,0x2d
    800069a0:	33450513          	addi	a0,a0,820 # 80033cd0 <ftable>
    800069a4:	ffffb097          	auipc	ra,0xffffb
    800069a8:	9ea080e7          	jalr	-1558(ra) # 8000138e <release>
      return f;
    800069ac:	fe843783          	ld	a5,-24(s0)
    800069b0:	a805                	j	800069e0 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800069b2:	fe843783          	ld	a5,-24(s0)
    800069b6:	02878793          	addi	a5,a5,40
    800069ba:	fef43423          	sd	a5,-24(s0)
    800069be:	0002e797          	auipc	a5,0x2e
    800069c2:	2ca78793          	addi	a5,a5,714 # 80034c88 <disk>
    800069c6:	fe843703          	ld	a4,-24(s0)
    800069ca:	fcf761e3          	bltu	a4,a5,8000698c <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    800069ce:	0002d517          	auipc	a0,0x2d
    800069d2:	30250513          	addi	a0,a0,770 # 80033cd0 <ftable>
    800069d6:	ffffb097          	auipc	ra,0xffffb
    800069da:	9b8080e7          	jalr	-1608(ra) # 8000138e <release>
  return 0;
    800069de:	4781                	li	a5,0
}
    800069e0:	853e                	mv	a0,a5
    800069e2:	60e2                	ld	ra,24(sp)
    800069e4:	6442                	ld	s0,16(sp)
    800069e6:	6105                	addi	sp,sp,32
    800069e8:	8082                	ret

00000000800069ea <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    800069ea:	1101                	addi	sp,sp,-32
    800069ec:	ec06                	sd	ra,24(sp)
    800069ee:	e822                	sd	s0,16(sp)
    800069f0:	1000                	addi	s0,sp,32
    800069f2:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    800069f6:	0002d517          	auipc	a0,0x2d
    800069fa:	2da50513          	addi	a0,a0,730 # 80033cd0 <ftable>
    800069fe:	ffffb097          	auipc	ra,0xffffb
    80006a02:	92c080e7          	jalr	-1748(ra) # 8000132a <acquire>
  if(f->ref < 1)
    80006a06:	fe843783          	ld	a5,-24(s0)
    80006a0a:	43dc                	lw	a5,4(a5)
    80006a0c:	00f04a63          	bgtz	a5,80006a20 <filedup+0x36>
    panic("filedup");
    80006a10:	00005517          	auipc	a0,0x5
    80006a14:	bb050513          	addi	a0,a0,-1104 # 8000b5c0 <etext+0x5c0>
    80006a18:	ffffa097          	auipc	ra,0xffffa
    80006a1c:	274080e7          	jalr	628(ra) # 80000c8c <panic>
  f->ref++;
    80006a20:	fe843783          	ld	a5,-24(s0)
    80006a24:	43dc                	lw	a5,4(a5)
    80006a26:	2785                	addiw	a5,a5,1
    80006a28:	0007871b          	sext.w	a4,a5
    80006a2c:	fe843783          	ld	a5,-24(s0)
    80006a30:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006a32:	0002d517          	auipc	a0,0x2d
    80006a36:	29e50513          	addi	a0,a0,670 # 80033cd0 <ftable>
    80006a3a:	ffffb097          	auipc	ra,0xffffb
    80006a3e:	954080e7          	jalr	-1708(ra) # 8000138e <release>
  return f;
    80006a42:	fe843783          	ld	a5,-24(s0)
}
    80006a46:	853e                	mv	a0,a5
    80006a48:	60e2                	ld	ra,24(sp)
    80006a4a:	6442                	ld	s0,16(sp)
    80006a4c:	6105                	addi	sp,sp,32
    80006a4e:	8082                	ret

0000000080006a50 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006a50:	715d                	addi	sp,sp,-80
    80006a52:	e486                	sd	ra,72(sp)
    80006a54:	e0a2                	sd	s0,64(sp)
    80006a56:	0880                	addi	s0,sp,80
    80006a58:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006a5c:	0002d517          	auipc	a0,0x2d
    80006a60:	27450513          	addi	a0,a0,628 # 80033cd0 <ftable>
    80006a64:	ffffb097          	auipc	ra,0xffffb
    80006a68:	8c6080e7          	jalr	-1850(ra) # 8000132a <acquire>
  if(f->ref < 1)
    80006a6c:	fb843783          	ld	a5,-72(s0)
    80006a70:	43dc                	lw	a5,4(a5)
    80006a72:	00f04a63          	bgtz	a5,80006a86 <fileclose+0x36>
    panic("fileclose");
    80006a76:	00005517          	auipc	a0,0x5
    80006a7a:	b5250513          	addi	a0,a0,-1198 # 8000b5c8 <etext+0x5c8>
    80006a7e:	ffffa097          	auipc	ra,0xffffa
    80006a82:	20e080e7          	jalr	526(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006a86:	fb843783          	ld	a5,-72(s0)
    80006a8a:	43dc                	lw	a5,4(a5)
    80006a8c:	37fd                	addiw	a5,a5,-1
    80006a8e:	0007871b          	sext.w	a4,a5
    80006a92:	fb843783          	ld	a5,-72(s0)
    80006a96:	c3d8                	sw	a4,4(a5)
    80006a98:	fb843783          	ld	a5,-72(s0)
    80006a9c:	43dc                	lw	a5,4(a5)
    80006a9e:	00f05b63          	blez	a5,80006ab4 <fileclose+0x64>
    release(&ftable.lock);
    80006aa2:	0002d517          	auipc	a0,0x2d
    80006aa6:	22e50513          	addi	a0,a0,558 # 80033cd0 <ftable>
    80006aaa:	ffffb097          	auipc	ra,0xffffb
    80006aae:	8e4080e7          	jalr	-1820(ra) # 8000138e <release>
    80006ab2:	a879                	j	80006b50 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006ab4:	fb843783          	ld	a5,-72(s0)
    80006ab8:	638c                	ld	a1,0(a5)
    80006aba:	6790                	ld	a2,8(a5)
    80006abc:	6b94                	ld	a3,16(a5)
    80006abe:	6f98                	ld	a4,24(a5)
    80006ac0:	739c                	ld	a5,32(a5)
    80006ac2:	fcb43423          	sd	a1,-56(s0)
    80006ac6:	fcc43823          	sd	a2,-48(s0)
    80006aca:	fcd43c23          	sd	a3,-40(s0)
    80006ace:	fee43023          	sd	a4,-32(s0)
    80006ad2:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006ad6:	fb843783          	ld	a5,-72(s0)
    80006ada:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006ade:	fb843783          	ld	a5,-72(s0)
    80006ae2:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006ae6:	0002d517          	auipc	a0,0x2d
    80006aea:	1ea50513          	addi	a0,a0,490 # 80033cd0 <ftable>
    80006aee:	ffffb097          	auipc	ra,0xffffb
    80006af2:	8a0080e7          	jalr	-1888(ra) # 8000138e <release>

  if(ff.type == FD_PIPE){
    80006af6:	fc842783          	lw	a5,-56(s0)
    80006afa:	873e                	mv	a4,a5
    80006afc:	4785                	li	a5,1
    80006afe:	00f71e63          	bne	a4,a5,80006b1a <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006b02:	fd843783          	ld	a5,-40(s0)
    80006b06:	fd144703          	lbu	a4,-47(s0)
    80006b0a:	2701                	sext.w	a4,a4
    80006b0c:	85ba                	mv	a1,a4
    80006b0e:	853e                	mv	a0,a5
    80006b10:	00000097          	auipc	ra,0x0
    80006b14:	5aa080e7          	jalr	1450(ra) # 800070ba <pipeclose>
    80006b18:	a825                	j	80006b50 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006b1a:	fc842783          	lw	a5,-56(s0)
    80006b1e:	873e                	mv	a4,a5
    80006b20:	4789                	li	a5,2
    80006b22:	00f70863          	beq	a4,a5,80006b32 <fileclose+0xe2>
    80006b26:	fc842783          	lw	a5,-56(s0)
    80006b2a:	873e                	mv	a4,a5
    80006b2c:	478d                	li	a5,3
    80006b2e:	02f71163          	bne	a4,a5,80006b50 <fileclose+0x100>
    begin_op();
    80006b32:	00000097          	auipc	ra,0x0
    80006b36:	884080e7          	jalr	-1916(ra) # 800063b6 <begin_op>
    iput(ff.ip);
    80006b3a:	fe043783          	ld	a5,-32(s0)
    80006b3e:	853e                	mv	a0,a5
    80006b40:	fffff097          	auipc	ra,0xfffff
    80006b44:	97a080e7          	jalr	-1670(ra) # 800054ba <iput>
    end_op();
    80006b48:	00000097          	auipc	ra,0x0
    80006b4c:	930080e7          	jalr	-1744(ra) # 80006478 <end_op>
  }
}
    80006b50:	60a6                	ld	ra,72(sp)
    80006b52:	6406                	ld	s0,64(sp)
    80006b54:	6161                	addi	sp,sp,80
    80006b56:	8082                	ret

0000000080006b58 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006b58:	7139                	addi	sp,sp,-64
    80006b5a:	fc06                	sd	ra,56(sp)
    80006b5c:	f822                	sd	s0,48(sp)
    80006b5e:	0080                	addi	s0,sp,64
    80006b60:	fca43423          	sd	a0,-56(s0)
    80006b64:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006b68:	ffffc097          	auipc	ra,0xffffc
    80006b6c:	f5e080e7          	jalr	-162(ra) # 80002ac6 <myproc>
    80006b70:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006b74:	fc843783          	ld	a5,-56(s0)
    80006b78:	439c                	lw	a5,0(a5)
    80006b7a:	873e                	mv	a4,a5
    80006b7c:	4789                	li	a5,2
    80006b7e:	00f70963          	beq	a4,a5,80006b90 <filestat+0x38>
    80006b82:	fc843783          	ld	a5,-56(s0)
    80006b86:	439c                	lw	a5,0(a5)
    80006b88:	873e                	mv	a4,a5
    80006b8a:	478d                	li	a5,3
    80006b8c:	06f71263          	bne	a4,a5,80006bf0 <filestat+0x98>
    ilock(f->ip);
    80006b90:	fc843783          	ld	a5,-56(s0)
    80006b94:	6f9c                	ld	a5,24(a5)
    80006b96:	853e                	mv	a0,a5
    80006b98:	ffffe097          	auipc	ra,0xffffe
    80006b9c:	794080e7          	jalr	1940(ra) # 8000532c <ilock>
    stati(f->ip, &st);
    80006ba0:	fc843783          	ld	a5,-56(s0)
    80006ba4:	6f9c                	ld	a5,24(a5)
    80006ba6:	fd040713          	addi	a4,s0,-48
    80006baa:	85ba                	mv	a1,a4
    80006bac:	853e                	mv	a0,a5
    80006bae:	fffff097          	auipc	ra,0xfffff
    80006bb2:	cd0080e7          	jalr	-816(ra) # 8000587e <stati>
    iunlock(f->ip);
    80006bb6:	fc843783          	ld	a5,-56(s0)
    80006bba:	6f9c                	ld	a5,24(a5)
    80006bbc:	853e                	mv	a0,a5
    80006bbe:	fffff097          	auipc	ra,0xfffff
    80006bc2:	8a2080e7          	jalr	-1886(ra) # 80005460 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006bc6:	fe843783          	ld	a5,-24(s0)
    80006bca:	6bbc                	ld	a5,80(a5)
    80006bcc:	fd040713          	addi	a4,s0,-48
    80006bd0:	46e1                	li	a3,24
    80006bd2:	863a                	mv	a2,a4
    80006bd4:	fc043583          	ld	a1,-64(s0)
    80006bd8:	853e                	mv	a0,a5
    80006bda:	ffffc097          	auipc	ra,0xffffc
    80006bde:	9b6080e7          	jalr	-1610(ra) # 80002590 <copyout>
    80006be2:	87aa                	mv	a5,a0
    80006be4:	0007d463          	bgez	a5,80006bec <filestat+0x94>
      return -1;
    80006be8:	57fd                	li	a5,-1
    80006bea:	a021                	j	80006bf2 <filestat+0x9a>
    return 0;
    80006bec:	4781                	li	a5,0
    80006bee:	a011                	j	80006bf2 <filestat+0x9a>
  }
  return -1;
    80006bf0:	57fd                	li	a5,-1
}
    80006bf2:	853e                	mv	a0,a5
    80006bf4:	70e2                	ld	ra,56(sp)
    80006bf6:	7442                	ld	s0,48(sp)
    80006bf8:	6121                	addi	sp,sp,64
    80006bfa:	8082                	ret

0000000080006bfc <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006bfc:	7139                	addi	sp,sp,-64
    80006bfe:	fc06                	sd	ra,56(sp)
    80006c00:	f822                	sd	s0,48(sp)
    80006c02:	0080                	addi	s0,sp,64
    80006c04:	fca43c23          	sd	a0,-40(s0)
    80006c08:	fcb43823          	sd	a1,-48(s0)
    80006c0c:	87b2                	mv	a5,a2
    80006c0e:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006c12:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006c16:	fd843783          	ld	a5,-40(s0)
    80006c1a:	0087c783          	lbu	a5,8(a5)
    80006c1e:	e399                	bnez	a5,80006c24 <fileread+0x28>
    return -1;
    80006c20:	57fd                	li	a5,-1
    80006c22:	aa1d                	j	80006d58 <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006c24:	fd843783          	ld	a5,-40(s0)
    80006c28:	439c                	lw	a5,0(a5)
    80006c2a:	873e                	mv	a4,a5
    80006c2c:	4785                	li	a5,1
    80006c2e:	02f71363          	bne	a4,a5,80006c54 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006c32:	fd843783          	ld	a5,-40(s0)
    80006c36:	6b9c                	ld	a5,16(a5)
    80006c38:	fcc42703          	lw	a4,-52(s0)
    80006c3c:	863a                	mv	a2,a4
    80006c3e:	fd043583          	ld	a1,-48(s0)
    80006c42:	853e                	mv	a0,a5
    80006c44:	00000097          	auipc	ra,0x0
    80006c48:	670080e7          	jalr	1648(ra) # 800072b4 <piperead>
    80006c4c:	87aa                	mv	a5,a0
    80006c4e:	fef42623          	sw	a5,-20(s0)
    80006c52:	a209                	j	80006d54 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006c54:	fd843783          	ld	a5,-40(s0)
    80006c58:	439c                	lw	a5,0(a5)
    80006c5a:	873e                	mv	a4,a5
    80006c5c:	478d                	li	a5,3
    80006c5e:	06f71863          	bne	a4,a5,80006cce <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006c62:	fd843783          	ld	a5,-40(s0)
    80006c66:	02479783          	lh	a5,36(a5)
    80006c6a:	2781                	sext.w	a5,a5
    80006c6c:	0207c863          	bltz	a5,80006c9c <fileread+0xa0>
    80006c70:	fd843783          	ld	a5,-40(s0)
    80006c74:	02479783          	lh	a5,36(a5)
    80006c78:	0007871b          	sext.w	a4,a5
    80006c7c:	47a5                	li	a5,9
    80006c7e:	00e7cf63          	blt	a5,a4,80006c9c <fileread+0xa0>
    80006c82:	fd843783          	ld	a5,-40(s0)
    80006c86:	02479783          	lh	a5,36(a5)
    80006c8a:	2781                	sext.w	a5,a5
    80006c8c:	0002d717          	auipc	a4,0x2d
    80006c90:	fa470713          	addi	a4,a4,-92 # 80033c30 <devsw>
    80006c94:	0792                	slli	a5,a5,0x4
    80006c96:	97ba                	add	a5,a5,a4
    80006c98:	639c                	ld	a5,0(a5)
    80006c9a:	e399                	bnez	a5,80006ca0 <fileread+0xa4>
      return -1;
    80006c9c:	57fd                	li	a5,-1
    80006c9e:	a86d                	j	80006d58 <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006ca0:	fd843783          	ld	a5,-40(s0)
    80006ca4:	02479783          	lh	a5,36(a5)
    80006ca8:	2781                	sext.w	a5,a5
    80006caa:	0002d717          	auipc	a4,0x2d
    80006cae:	f8670713          	addi	a4,a4,-122 # 80033c30 <devsw>
    80006cb2:	0792                	slli	a5,a5,0x4
    80006cb4:	97ba                	add	a5,a5,a4
    80006cb6:	6398                	ld	a4,0(a5)
    80006cb8:	fcc42783          	lw	a5,-52(s0)
    80006cbc:	863e                	mv	a2,a5
    80006cbe:	fd043583          	ld	a1,-48(s0)
    80006cc2:	4505                	li	a0,1
    80006cc4:	9702                	jalr	a4
    80006cc6:	87aa                	mv	a5,a0
    80006cc8:	fef42623          	sw	a5,-20(s0)
    80006ccc:	a061                	j	80006d54 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006cce:	fd843783          	ld	a5,-40(s0)
    80006cd2:	439c                	lw	a5,0(a5)
    80006cd4:	873e                	mv	a4,a5
    80006cd6:	4789                	li	a5,2
    80006cd8:	06f71663          	bne	a4,a5,80006d44 <fileread+0x148>
    ilock(f->ip);
    80006cdc:	fd843783          	ld	a5,-40(s0)
    80006ce0:	6f9c                	ld	a5,24(a5)
    80006ce2:	853e                	mv	a0,a5
    80006ce4:	ffffe097          	auipc	ra,0xffffe
    80006ce8:	648080e7          	jalr	1608(ra) # 8000532c <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006cec:	fd843783          	ld	a5,-40(s0)
    80006cf0:	6f88                	ld	a0,24(a5)
    80006cf2:	fd843783          	ld	a5,-40(s0)
    80006cf6:	539c                	lw	a5,32(a5)
    80006cf8:	fcc42703          	lw	a4,-52(s0)
    80006cfc:	86be                	mv	a3,a5
    80006cfe:	fd043603          	ld	a2,-48(s0)
    80006d02:	4585                	li	a1,1
    80006d04:	fffff097          	auipc	ra,0xfffff
    80006d08:	bde080e7          	jalr	-1058(ra) # 800058e2 <readi>
    80006d0c:	87aa                	mv	a5,a0
    80006d0e:	fef42623          	sw	a5,-20(s0)
    80006d12:	fec42783          	lw	a5,-20(s0)
    80006d16:	2781                	sext.w	a5,a5
    80006d18:	00f05d63          	blez	a5,80006d32 <fileread+0x136>
      f->off += r;
    80006d1c:	fd843783          	ld	a5,-40(s0)
    80006d20:	5398                	lw	a4,32(a5)
    80006d22:	fec42783          	lw	a5,-20(s0)
    80006d26:	9fb9                	addw	a5,a5,a4
    80006d28:	0007871b          	sext.w	a4,a5
    80006d2c:	fd843783          	ld	a5,-40(s0)
    80006d30:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006d32:	fd843783          	ld	a5,-40(s0)
    80006d36:	6f9c                	ld	a5,24(a5)
    80006d38:	853e                	mv	a0,a5
    80006d3a:	ffffe097          	auipc	ra,0xffffe
    80006d3e:	726080e7          	jalr	1830(ra) # 80005460 <iunlock>
    80006d42:	a809                	j	80006d54 <fileread+0x158>
  } else {
    panic("fileread");
    80006d44:	00005517          	auipc	a0,0x5
    80006d48:	89450513          	addi	a0,a0,-1900 # 8000b5d8 <etext+0x5d8>
    80006d4c:	ffffa097          	auipc	ra,0xffffa
    80006d50:	f40080e7          	jalr	-192(ra) # 80000c8c <panic>
  }

  return r;
    80006d54:	fec42783          	lw	a5,-20(s0)
}
    80006d58:	853e                	mv	a0,a5
    80006d5a:	70e2                	ld	ra,56(sp)
    80006d5c:	7442                	ld	s0,48(sp)
    80006d5e:	6121                	addi	sp,sp,64
    80006d60:	8082                	ret

0000000080006d62 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006d62:	715d                	addi	sp,sp,-80
    80006d64:	e486                	sd	ra,72(sp)
    80006d66:	e0a2                	sd	s0,64(sp)
    80006d68:	0880                	addi	s0,sp,80
    80006d6a:	fca43423          	sd	a0,-56(s0)
    80006d6e:	fcb43023          	sd	a1,-64(s0)
    80006d72:	87b2                	mv	a5,a2
    80006d74:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006d78:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006d7c:	fc843783          	ld	a5,-56(s0)
    80006d80:	0097c783          	lbu	a5,9(a5)
    80006d84:	e399                	bnez	a5,80006d8a <filewrite+0x28>
    return -1;
    80006d86:	57fd                	li	a5,-1
    80006d88:	aad1                	j	80006f5c <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006d8a:	fc843783          	ld	a5,-56(s0)
    80006d8e:	439c                	lw	a5,0(a5)
    80006d90:	873e                	mv	a4,a5
    80006d92:	4785                	li	a5,1
    80006d94:	02f71363          	bne	a4,a5,80006dba <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006d98:	fc843783          	ld	a5,-56(s0)
    80006d9c:	6b9c                	ld	a5,16(a5)
    80006d9e:	fbc42703          	lw	a4,-68(s0)
    80006da2:	863a                	mv	a2,a4
    80006da4:	fc043583          	ld	a1,-64(s0)
    80006da8:	853e                	mv	a0,a5
    80006daa:	00000097          	auipc	ra,0x0
    80006dae:	3b8080e7          	jalr	952(ra) # 80007162 <pipewrite>
    80006db2:	87aa                	mv	a5,a0
    80006db4:	fef42623          	sw	a5,-20(s0)
    80006db8:	a245                	j	80006f58 <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006dba:	fc843783          	ld	a5,-56(s0)
    80006dbe:	439c                	lw	a5,0(a5)
    80006dc0:	873e                	mv	a4,a5
    80006dc2:	478d                	li	a5,3
    80006dc4:	06f71863          	bne	a4,a5,80006e34 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006dc8:	fc843783          	ld	a5,-56(s0)
    80006dcc:	02479783          	lh	a5,36(a5)
    80006dd0:	2781                	sext.w	a5,a5
    80006dd2:	0207c863          	bltz	a5,80006e02 <filewrite+0xa0>
    80006dd6:	fc843783          	ld	a5,-56(s0)
    80006dda:	02479783          	lh	a5,36(a5)
    80006dde:	0007871b          	sext.w	a4,a5
    80006de2:	47a5                	li	a5,9
    80006de4:	00e7cf63          	blt	a5,a4,80006e02 <filewrite+0xa0>
    80006de8:	fc843783          	ld	a5,-56(s0)
    80006dec:	02479783          	lh	a5,36(a5)
    80006df0:	2781                	sext.w	a5,a5
    80006df2:	0002d717          	auipc	a4,0x2d
    80006df6:	e3e70713          	addi	a4,a4,-450 # 80033c30 <devsw>
    80006dfa:	0792                	slli	a5,a5,0x4
    80006dfc:	97ba                	add	a5,a5,a4
    80006dfe:	679c                	ld	a5,8(a5)
    80006e00:	e399                	bnez	a5,80006e06 <filewrite+0xa4>
      return -1;
    80006e02:	57fd                	li	a5,-1
    80006e04:	aaa1                	j	80006f5c <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006e06:	fc843783          	ld	a5,-56(s0)
    80006e0a:	02479783          	lh	a5,36(a5)
    80006e0e:	2781                	sext.w	a5,a5
    80006e10:	0002d717          	auipc	a4,0x2d
    80006e14:	e2070713          	addi	a4,a4,-480 # 80033c30 <devsw>
    80006e18:	0792                	slli	a5,a5,0x4
    80006e1a:	97ba                	add	a5,a5,a4
    80006e1c:	6798                	ld	a4,8(a5)
    80006e1e:	fbc42783          	lw	a5,-68(s0)
    80006e22:	863e                	mv	a2,a5
    80006e24:	fc043583          	ld	a1,-64(s0)
    80006e28:	4505                	li	a0,1
    80006e2a:	9702                	jalr	a4
    80006e2c:	87aa                	mv	a5,a0
    80006e2e:	fef42623          	sw	a5,-20(s0)
    80006e32:	a21d                	j	80006f58 <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006e34:	fc843783          	ld	a5,-56(s0)
    80006e38:	439c                	lw	a5,0(a5)
    80006e3a:	873e                	mv	a4,a5
    80006e3c:	4789                	li	a5,2
    80006e3e:	10f71563          	bne	a4,a5,80006f48 <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006e42:	6785                	lui	a5,0x1
    80006e44:	c007879b          	addiw	a5,a5,-1024
    80006e48:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006e4c:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006e50:	a0d9                	j	80006f16 <filewrite+0x1b4>
      int n1 = n - i;
    80006e52:	fbc42703          	lw	a4,-68(s0)
    80006e56:	fe842783          	lw	a5,-24(s0)
    80006e5a:	40f707bb          	subw	a5,a4,a5
    80006e5e:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006e62:	fe442703          	lw	a4,-28(s0)
    80006e66:	fe042783          	lw	a5,-32(s0)
    80006e6a:	2701                	sext.w	a4,a4
    80006e6c:	2781                	sext.w	a5,a5
    80006e6e:	00e7d663          	bge	a5,a4,80006e7a <filewrite+0x118>
        n1 = max;
    80006e72:	fe042783          	lw	a5,-32(s0)
    80006e76:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006e7a:	fffff097          	auipc	ra,0xfffff
    80006e7e:	53c080e7          	jalr	1340(ra) # 800063b6 <begin_op>
      ilock(f->ip);
    80006e82:	fc843783          	ld	a5,-56(s0)
    80006e86:	6f9c                	ld	a5,24(a5)
    80006e88:	853e                	mv	a0,a5
    80006e8a:	ffffe097          	auipc	ra,0xffffe
    80006e8e:	4a2080e7          	jalr	1186(ra) # 8000532c <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006e92:	fc843783          	ld	a5,-56(s0)
    80006e96:	6f88                	ld	a0,24(a5)
    80006e98:	fe842703          	lw	a4,-24(s0)
    80006e9c:	fc043783          	ld	a5,-64(s0)
    80006ea0:	00f70633          	add	a2,a4,a5
    80006ea4:	fc843783          	ld	a5,-56(s0)
    80006ea8:	539c                	lw	a5,32(a5)
    80006eaa:	fe442703          	lw	a4,-28(s0)
    80006eae:	86be                	mv	a3,a5
    80006eb0:	4585                	li	a1,1
    80006eb2:	fffff097          	auipc	ra,0xfffff
    80006eb6:	bc8080e7          	jalr	-1080(ra) # 80005a7a <writei>
    80006eba:	87aa                	mv	a5,a0
    80006ebc:	fcf42e23          	sw	a5,-36(s0)
    80006ec0:	fdc42783          	lw	a5,-36(s0)
    80006ec4:	2781                	sext.w	a5,a5
    80006ec6:	00f05d63          	blez	a5,80006ee0 <filewrite+0x17e>
        f->off += r;
    80006eca:	fc843783          	ld	a5,-56(s0)
    80006ece:	5398                	lw	a4,32(a5)
    80006ed0:	fdc42783          	lw	a5,-36(s0)
    80006ed4:	9fb9                	addw	a5,a5,a4
    80006ed6:	0007871b          	sext.w	a4,a5
    80006eda:	fc843783          	ld	a5,-56(s0)
    80006ede:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006ee0:	fc843783          	ld	a5,-56(s0)
    80006ee4:	6f9c                	ld	a5,24(a5)
    80006ee6:	853e                	mv	a0,a5
    80006ee8:	ffffe097          	auipc	ra,0xffffe
    80006eec:	578080e7          	jalr	1400(ra) # 80005460 <iunlock>
      end_op();
    80006ef0:	fffff097          	auipc	ra,0xfffff
    80006ef4:	588080e7          	jalr	1416(ra) # 80006478 <end_op>

      if(r != n1){
    80006ef8:	fdc42703          	lw	a4,-36(s0)
    80006efc:	fe442783          	lw	a5,-28(s0)
    80006f00:	2701                	sext.w	a4,a4
    80006f02:	2781                	sext.w	a5,a5
    80006f04:	02f71263          	bne	a4,a5,80006f28 <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006f08:	fe842703          	lw	a4,-24(s0)
    80006f0c:	fdc42783          	lw	a5,-36(s0)
    80006f10:	9fb9                	addw	a5,a5,a4
    80006f12:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006f16:	fe842703          	lw	a4,-24(s0)
    80006f1a:	fbc42783          	lw	a5,-68(s0)
    80006f1e:	2701                	sext.w	a4,a4
    80006f20:	2781                	sext.w	a5,a5
    80006f22:	f2f748e3          	blt	a4,a5,80006e52 <filewrite+0xf0>
    80006f26:	a011                	j	80006f2a <filewrite+0x1c8>
        break;
    80006f28:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006f2a:	fe842703          	lw	a4,-24(s0)
    80006f2e:	fbc42783          	lw	a5,-68(s0)
    80006f32:	2701                	sext.w	a4,a4
    80006f34:	2781                	sext.w	a5,a5
    80006f36:	00f71563          	bne	a4,a5,80006f40 <filewrite+0x1de>
    80006f3a:	fbc42783          	lw	a5,-68(s0)
    80006f3e:	a011                	j	80006f42 <filewrite+0x1e0>
    80006f40:	57fd                	li	a5,-1
    80006f42:	fef42623          	sw	a5,-20(s0)
    80006f46:	a809                	j	80006f58 <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006f48:	00004517          	auipc	a0,0x4
    80006f4c:	6a050513          	addi	a0,a0,1696 # 8000b5e8 <etext+0x5e8>
    80006f50:	ffffa097          	auipc	ra,0xffffa
    80006f54:	d3c080e7          	jalr	-708(ra) # 80000c8c <panic>
  }

  return ret;
    80006f58:	fec42783          	lw	a5,-20(s0)
}
    80006f5c:	853e                	mv	a0,a5
    80006f5e:	60a6                	ld	ra,72(sp)
    80006f60:	6406                	ld	s0,64(sp)
    80006f62:	6161                	addi	sp,sp,80
    80006f64:	8082                	ret

0000000080006f66 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006f66:	7179                	addi	sp,sp,-48
    80006f68:	f406                	sd	ra,40(sp)
    80006f6a:	f022                	sd	s0,32(sp)
    80006f6c:	1800                	addi	s0,sp,48
    80006f6e:	fca43c23          	sd	a0,-40(s0)
    80006f72:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006f76:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006f7a:	fd043783          	ld	a5,-48(s0)
    80006f7e:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006f82:	fd043783          	ld	a5,-48(s0)
    80006f86:	6398                	ld	a4,0(a5)
    80006f88:	fd843783          	ld	a5,-40(s0)
    80006f8c:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006f8e:	00000097          	auipc	ra,0x0
    80006f92:	9d8080e7          	jalr	-1576(ra) # 80006966 <filealloc>
    80006f96:	872a                	mv	a4,a0
    80006f98:	fd843783          	ld	a5,-40(s0)
    80006f9c:	e398                	sd	a4,0(a5)
    80006f9e:	fd843783          	ld	a5,-40(s0)
    80006fa2:	639c                	ld	a5,0(a5)
    80006fa4:	c3e9                	beqz	a5,80007066 <pipealloc+0x100>
    80006fa6:	00000097          	auipc	ra,0x0
    80006faa:	9c0080e7          	jalr	-1600(ra) # 80006966 <filealloc>
    80006fae:	872a                	mv	a4,a0
    80006fb0:	fd043783          	ld	a5,-48(s0)
    80006fb4:	e398                	sd	a4,0(a5)
    80006fb6:	fd043783          	ld	a5,-48(s0)
    80006fba:	639c                	ld	a5,0(a5)
    80006fbc:	c7cd                	beqz	a5,80007066 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006fbe:	ffffa097          	auipc	ra,0xffffa
    80006fc2:	218080e7          	jalr	536(ra) # 800011d6 <kalloc>
    80006fc6:	fea43423          	sd	a0,-24(s0)
    80006fca:	fe843783          	ld	a5,-24(s0)
    80006fce:	cfd1                	beqz	a5,8000706a <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006fd0:	fe843783          	ld	a5,-24(s0)
    80006fd4:	4705                	li	a4,1
    80006fd6:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006fda:	fe843783          	ld	a5,-24(s0)
    80006fde:	4705                	li	a4,1
    80006fe0:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006fe4:	fe843783          	ld	a5,-24(s0)
    80006fe8:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006fec:	fe843783          	ld	a5,-24(s0)
    80006ff0:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006ff4:	fe843783          	ld	a5,-24(s0)
    80006ff8:	00004597          	auipc	a1,0x4
    80006ffc:	60058593          	addi	a1,a1,1536 # 8000b5f8 <etext+0x5f8>
    80007000:	853e                	mv	a0,a5
    80007002:	ffffa097          	auipc	ra,0xffffa
    80007006:	2f8080e7          	jalr	760(ra) # 800012fa <initlock>
  (*f0)->type = FD_PIPE;
    8000700a:	fd843783          	ld	a5,-40(s0)
    8000700e:	639c                	ld	a5,0(a5)
    80007010:	4705                	li	a4,1
    80007012:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80007014:	fd843783          	ld	a5,-40(s0)
    80007018:	639c                	ld	a5,0(a5)
    8000701a:	4705                	li	a4,1
    8000701c:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80007020:	fd843783          	ld	a5,-40(s0)
    80007024:	639c                	ld	a5,0(a5)
    80007026:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    8000702a:	fd843783          	ld	a5,-40(s0)
    8000702e:	639c                	ld	a5,0(a5)
    80007030:	fe843703          	ld	a4,-24(s0)
    80007034:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80007036:	fd043783          	ld	a5,-48(s0)
    8000703a:	639c                	ld	a5,0(a5)
    8000703c:	4705                	li	a4,1
    8000703e:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80007040:	fd043783          	ld	a5,-48(s0)
    80007044:	639c                	ld	a5,0(a5)
    80007046:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    8000704a:	fd043783          	ld	a5,-48(s0)
    8000704e:	639c                	ld	a5,0(a5)
    80007050:	4705                	li	a4,1
    80007052:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80007056:	fd043783          	ld	a5,-48(s0)
    8000705a:	639c                	ld	a5,0(a5)
    8000705c:	fe843703          	ld	a4,-24(s0)
    80007060:	eb98                	sd	a4,16(a5)
  return 0;
    80007062:	4781                	li	a5,0
    80007064:	a0b1                	j	800070b0 <pipealloc+0x14a>
    goto bad;
    80007066:	0001                	nop
    80007068:	a011                	j	8000706c <pipealloc+0x106>
    goto bad;
    8000706a:	0001                	nop

 bad:
  if(pi)
    8000706c:	fe843783          	ld	a5,-24(s0)
    80007070:	c799                	beqz	a5,8000707e <pipealloc+0x118>
    kfree((char*)pi);
    80007072:	fe843503          	ld	a0,-24(s0)
    80007076:	ffffa097          	auipc	ra,0xffffa
    8000707a:	0ba080e7          	jalr	186(ra) # 80001130 <kfree>
  if(*f0)
    8000707e:	fd843783          	ld	a5,-40(s0)
    80007082:	639c                	ld	a5,0(a5)
    80007084:	cb89                	beqz	a5,80007096 <pipealloc+0x130>
    fileclose(*f0);
    80007086:	fd843783          	ld	a5,-40(s0)
    8000708a:	639c                	ld	a5,0(a5)
    8000708c:	853e                	mv	a0,a5
    8000708e:	00000097          	auipc	ra,0x0
    80007092:	9c2080e7          	jalr	-1598(ra) # 80006a50 <fileclose>
  if(*f1)
    80007096:	fd043783          	ld	a5,-48(s0)
    8000709a:	639c                	ld	a5,0(a5)
    8000709c:	cb89                	beqz	a5,800070ae <pipealloc+0x148>
    fileclose(*f1);
    8000709e:	fd043783          	ld	a5,-48(s0)
    800070a2:	639c                	ld	a5,0(a5)
    800070a4:	853e                	mv	a0,a5
    800070a6:	00000097          	auipc	ra,0x0
    800070aa:	9aa080e7          	jalr	-1622(ra) # 80006a50 <fileclose>
  return -1;
    800070ae:	57fd                	li	a5,-1
}
    800070b0:	853e                	mv	a0,a5
    800070b2:	70a2                	ld	ra,40(sp)
    800070b4:	7402                	ld	s0,32(sp)
    800070b6:	6145                	addi	sp,sp,48
    800070b8:	8082                	ret

00000000800070ba <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    800070ba:	1101                	addi	sp,sp,-32
    800070bc:	ec06                	sd	ra,24(sp)
    800070be:	e822                	sd	s0,16(sp)
    800070c0:	1000                	addi	s0,sp,32
    800070c2:	fea43423          	sd	a0,-24(s0)
    800070c6:	87ae                	mv	a5,a1
    800070c8:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    800070cc:	fe843783          	ld	a5,-24(s0)
    800070d0:	853e                	mv	a0,a5
    800070d2:	ffffa097          	auipc	ra,0xffffa
    800070d6:	258080e7          	jalr	600(ra) # 8000132a <acquire>
  if(writable){
    800070da:	fe442783          	lw	a5,-28(s0)
    800070de:	2781                	sext.w	a5,a5
    800070e0:	cf99                	beqz	a5,800070fe <pipeclose+0x44>
    pi->writeopen = 0;
    800070e2:	fe843783          	ld	a5,-24(s0)
    800070e6:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800070ea:	fe843783          	ld	a5,-24(s0)
    800070ee:	21878793          	addi	a5,a5,536
    800070f2:	853e                	mv	a0,a5
    800070f4:	ffffc097          	auipc	ra,0xffffc
    800070f8:	610080e7          	jalr	1552(ra) # 80003704 <wakeup>
    800070fc:	a831                	j	80007118 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800070fe:	fe843783          	ld	a5,-24(s0)
    80007102:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80007106:	fe843783          	ld	a5,-24(s0)
    8000710a:	21c78793          	addi	a5,a5,540
    8000710e:	853e                	mv	a0,a5
    80007110:	ffffc097          	auipc	ra,0xffffc
    80007114:	5f4080e7          	jalr	1524(ra) # 80003704 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80007118:	fe843783          	ld	a5,-24(s0)
    8000711c:	2207a783          	lw	a5,544(a5)
    80007120:	e785                	bnez	a5,80007148 <pipeclose+0x8e>
    80007122:	fe843783          	ld	a5,-24(s0)
    80007126:	2247a783          	lw	a5,548(a5)
    8000712a:	ef99                	bnez	a5,80007148 <pipeclose+0x8e>
    release(&pi->lock);
    8000712c:	fe843783          	ld	a5,-24(s0)
    80007130:	853e                	mv	a0,a5
    80007132:	ffffa097          	auipc	ra,0xffffa
    80007136:	25c080e7          	jalr	604(ra) # 8000138e <release>
    kfree((char*)pi);
    8000713a:	fe843503          	ld	a0,-24(s0)
    8000713e:	ffffa097          	auipc	ra,0xffffa
    80007142:	ff2080e7          	jalr	-14(ra) # 80001130 <kfree>
    80007146:	a809                	j	80007158 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80007148:	fe843783          	ld	a5,-24(s0)
    8000714c:	853e                	mv	a0,a5
    8000714e:	ffffa097          	auipc	ra,0xffffa
    80007152:	240080e7          	jalr	576(ra) # 8000138e <release>
}
    80007156:	0001                	nop
    80007158:	0001                	nop
    8000715a:	60e2                	ld	ra,24(sp)
    8000715c:	6442                	ld	s0,16(sp)
    8000715e:	6105                	addi	sp,sp,32
    80007160:	8082                	ret

0000000080007162 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80007162:	715d                	addi	sp,sp,-80
    80007164:	e486                	sd	ra,72(sp)
    80007166:	e0a2                	sd	s0,64(sp)
    80007168:	0880                	addi	s0,sp,80
    8000716a:	fca43423          	sd	a0,-56(s0)
    8000716e:	fcb43023          	sd	a1,-64(s0)
    80007172:	87b2                	mv	a5,a2
    80007174:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80007178:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    8000717c:	ffffc097          	auipc	ra,0xffffc
    80007180:	94a080e7          	jalr	-1718(ra) # 80002ac6 <myproc>
    80007184:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80007188:	fc843783          	ld	a5,-56(s0)
    8000718c:	853e                	mv	a0,a5
    8000718e:	ffffa097          	auipc	ra,0xffffa
    80007192:	19c080e7          	jalr	412(ra) # 8000132a <acquire>
  while(i < n){
    80007196:	a8f1                	j	80007272 <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    80007198:	fc843783          	ld	a5,-56(s0)
    8000719c:	2207a783          	lw	a5,544(a5)
    800071a0:	cb89                	beqz	a5,800071b2 <pipewrite+0x50>
    800071a2:	fe043503          	ld	a0,-32(s0)
    800071a6:	ffffc097          	auipc	ra,0xffffc
    800071aa:	6f0080e7          	jalr	1776(ra) # 80003896 <killed>
    800071ae:	87aa                	mv	a5,a0
    800071b0:	cb91                	beqz	a5,800071c4 <pipewrite+0x62>
      release(&pi->lock);
    800071b2:	fc843783          	ld	a5,-56(s0)
    800071b6:	853e                	mv	a0,a5
    800071b8:	ffffa097          	auipc	ra,0xffffa
    800071bc:	1d6080e7          	jalr	470(ra) # 8000138e <release>
      return -1;
    800071c0:	57fd                	li	a5,-1
    800071c2:	a0e5                	j	800072aa <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    800071c4:	fc843783          	ld	a5,-56(s0)
    800071c8:	21c7a703          	lw	a4,540(a5)
    800071cc:	fc843783          	ld	a5,-56(s0)
    800071d0:	2187a783          	lw	a5,536(a5)
    800071d4:	2007879b          	addiw	a5,a5,512
    800071d8:	2781                	sext.w	a5,a5
    800071da:	02f71863          	bne	a4,a5,8000720a <pipewrite+0xa8>
      wakeup(&pi->nread);
    800071de:	fc843783          	ld	a5,-56(s0)
    800071e2:	21878793          	addi	a5,a5,536
    800071e6:	853e                	mv	a0,a5
    800071e8:	ffffc097          	auipc	ra,0xffffc
    800071ec:	51c080e7          	jalr	1308(ra) # 80003704 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800071f0:	fc843783          	ld	a5,-56(s0)
    800071f4:	21c78793          	addi	a5,a5,540
    800071f8:	fc843703          	ld	a4,-56(s0)
    800071fc:	85ba                	mv	a1,a4
    800071fe:	853e                	mv	a0,a5
    80007200:	ffffc097          	auipc	ra,0xffffc
    80007204:	488080e7          	jalr	1160(ra) # 80003688 <sleep>
    80007208:	a0ad                	j	80007272 <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    8000720a:	fe043783          	ld	a5,-32(s0)
    8000720e:	6ba8                	ld	a0,80(a5)
    80007210:	fec42703          	lw	a4,-20(s0)
    80007214:	fc043783          	ld	a5,-64(s0)
    80007218:	973e                	add	a4,a4,a5
    8000721a:	fdf40793          	addi	a5,s0,-33
    8000721e:	4685                	li	a3,1
    80007220:	863a                	mv	a2,a4
    80007222:	85be                	mv	a1,a5
    80007224:	ffffb097          	auipc	ra,0xffffb
    80007228:	43a080e7          	jalr	1082(ra) # 8000265e <copyin>
    8000722c:	87aa                	mv	a5,a0
    8000722e:	873e                	mv	a4,a5
    80007230:	57fd                	li	a5,-1
    80007232:	04f70963          	beq	a4,a5,80007284 <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80007236:	fc843783          	ld	a5,-56(s0)
    8000723a:	21c7a783          	lw	a5,540(a5)
    8000723e:	2781                	sext.w	a5,a5
    80007240:	0017871b          	addiw	a4,a5,1
    80007244:	0007069b          	sext.w	a3,a4
    80007248:	fc843703          	ld	a4,-56(s0)
    8000724c:	20d72e23          	sw	a3,540(a4)
    80007250:	1ff7f793          	andi	a5,a5,511
    80007254:	2781                	sext.w	a5,a5
    80007256:	fdf44703          	lbu	a4,-33(s0)
    8000725a:	fc843683          	ld	a3,-56(s0)
    8000725e:	1782                	slli	a5,a5,0x20
    80007260:	9381                	srli	a5,a5,0x20
    80007262:	97b6                	add	a5,a5,a3
    80007264:	00e78c23          	sb	a4,24(a5)
      i++;
    80007268:	fec42783          	lw	a5,-20(s0)
    8000726c:	2785                	addiw	a5,a5,1
    8000726e:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80007272:	fec42703          	lw	a4,-20(s0)
    80007276:	fbc42783          	lw	a5,-68(s0)
    8000727a:	2701                	sext.w	a4,a4
    8000727c:	2781                	sext.w	a5,a5
    8000727e:	f0f74de3          	blt	a4,a5,80007198 <pipewrite+0x36>
    80007282:	a011                	j	80007286 <pipewrite+0x124>
        break;
    80007284:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007286:	fc843783          	ld	a5,-56(s0)
    8000728a:	21878793          	addi	a5,a5,536
    8000728e:	853e                	mv	a0,a5
    80007290:	ffffc097          	auipc	ra,0xffffc
    80007294:	474080e7          	jalr	1140(ra) # 80003704 <wakeup>
  release(&pi->lock);
    80007298:	fc843783          	ld	a5,-56(s0)
    8000729c:	853e                	mv	a0,a5
    8000729e:	ffffa097          	auipc	ra,0xffffa
    800072a2:	0f0080e7          	jalr	240(ra) # 8000138e <release>

  return i;
    800072a6:	fec42783          	lw	a5,-20(s0)
}
    800072aa:	853e                	mv	a0,a5
    800072ac:	60a6                	ld	ra,72(sp)
    800072ae:	6406                	ld	s0,64(sp)
    800072b0:	6161                	addi	sp,sp,80
    800072b2:	8082                	ret

00000000800072b4 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800072b4:	715d                	addi	sp,sp,-80
    800072b6:	e486                	sd	ra,72(sp)
    800072b8:	e0a2                	sd	s0,64(sp)
    800072ba:	0880                	addi	s0,sp,80
    800072bc:	fca43423          	sd	a0,-56(s0)
    800072c0:	fcb43023          	sd	a1,-64(s0)
    800072c4:	87b2                	mv	a5,a2
    800072c6:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800072ca:	ffffb097          	auipc	ra,0xffffb
    800072ce:	7fc080e7          	jalr	2044(ra) # 80002ac6 <myproc>
    800072d2:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800072d6:	fc843783          	ld	a5,-56(s0)
    800072da:	853e                	mv	a0,a5
    800072dc:	ffffa097          	auipc	ra,0xffffa
    800072e0:	04e080e7          	jalr	78(ra) # 8000132a <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800072e4:	a835                	j	80007320 <piperead+0x6c>
    if(killed(pr)){
    800072e6:	fe043503          	ld	a0,-32(s0)
    800072ea:	ffffc097          	auipc	ra,0xffffc
    800072ee:	5ac080e7          	jalr	1452(ra) # 80003896 <killed>
    800072f2:	87aa                	mv	a5,a0
    800072f4:	cb91                	beqz	a5,80007308 <piperead+0x54>
      release(&pi->lock);
    800072f6:	fc843783          	ld	a5,-56(s0)
    800072fa:	853e                	mv	a0,a5
    800072fc:	ffffa097          	auipc	ra,0xffffa
    80007300:	092080e7          	jalr	146(ra) # 8000138e <release>
      return -1;
    80007304:	57fd                	li	a5,-1
    80007306:	a8dd                	j	800073fc <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80007308:	fc843783          	ld	a5,-56(s0)
    8000730c:	21878793          	addi	a5,a5,536
    80007310:	fc843703          	ld	a4,-56(s0)
    80007314:	85ba                	mv	a1,a4
    80007316:	853e                	mv	a0,a5
    80007318:	ffffc097          	auipc	ra,0xffffc
    8000731c:	370080e7          	jalr	880(ra) # 80003688 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007320:	fc843783          	ld	a5,-56(s0)
    80007324:	2187a703          	lw	a4,536(a5)
    80007328:	fc843783          	ld	a5,-56(s0)
    8000732c:	21c7a783          	lw	a5,540(a5)
    80007330:	00f71763          	bne	a4,a5,8000733e <piperead+0x8a>
    80007334:	fc843783          	ld	a5,-56(s0)
    80007338:	2247a783          	lw	a5,548(a5)
    8000733c:	f7cd                	bnez	a5,800072e6 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000733e:	fe042623          	sw	zero,-20(s0)
    80007342:	a8bd                	j	800073c0 <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    80007344:	fc843783          	ld	a5,-56(s0)
    80007348:	2187a703          	lw	a4,536(a5)
    8000734c:	fc843783          	ld	a5,-56(s0)
    80007350:	21c7a783          	lw	a5,540(a5)
    80007354:	06f70f63          	beq	a4,a5,800073d2 <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    80007358:	fc843783          	ld	a5,-56(s0)
    8000735c:	2187a783          	lw	a5,536(a5)
    80007360:	2781                	sext.w	a5,a5
    80007362:	0017871b          	addiw	a4,a5,1
    80007366:	0007069b          	sext.w	a3,a4
    8000736a:	fc843703          	ld	a4,-56(s0)
    8000736e:	20d72c23          	sw	a3,536(a4)
    80007372:	1ff7f793          	andi	a5,a5,511
    80007376:	2781                	sext.w	a5,a5
    80007378:	fc843703          	ld	a4,-56(s0)
    8000737c:	1782                	slli	a5,a5,0x20
    8000737e:	9381                	srli	a5,a5,0x20
    80007380:	97ba                	add	a5,a5,a4
    80007382:	0187c783          	lbu	a5,24(a5)
    80007386:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000738a:	fe043783          	ld	a5,-32(s0)
    8000738e:	6ba8                	ld	a0,80(a5)
    80007390:	fec42703          	lw	a4,-20(s0)
    80007394:	fc043783          	ld	a5,-64(s0)
    80007398:	97ba                	add	a5,a5,a4
    8000739a:	fdf40713          	addi	a4,s0,-33
    8000739e:	4685                	li	a3,1
    800073a0:	863a                	mv	a2,a4
    800073a2:	85be                	mv	a1,a5
    800073a4:	ffffb097          	auipc	ra,0xffffb
    800073a8:	1ec080e7          	jalr	492(ra) # 80002590 <copyout>
    800073ac:	87aa                	mv	a5,a0
    800073ae:	873e                	mv	a4,a5
    800073b0:	57fd                	li	a5,-1
    800073b2:	02f70263          	beq	a4,a5,800073d6 <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800073b6:	fec42783          	lw	a5,-20(s0)
    800073ba:	2785                	addiw	a5,a5,1
    800073bc:	fef42623          	sw	a5,-20(s0)
    800073c0:	fec42703          	lw	a4,-20(s0)
    800073c4:	fbc42783          	lw	a5,-68(s0)
    800073c8:	2701                	sext.w	a4,a4
    800073ca:	2781                	sext.w	a5,a5
    800073cc:	f6f74ce3          	blt	a4,a5,80007344 <piperead+0x90>
    800073d0:	a021                	j	800073d8 <piperead+0x124>
      break;
    800073d2:	0001                	nop
    800073d4:	a011                	j	800073d8 <piperead+0x124>
      break;
    800073d6:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800073d8:	fc843783          	ld	a5,-56(s0)
    800073dc:	21c78793          	addi	a5,a5,540
    800073e0:	853e                	mv	a0,a5
    800073e2:	ffffc097          	auipc	ra,0xffffc
    800073e6:	322080e7          	jalr	802(ra) # 80003704 <wakeup>
  release(&pi->lock);
    800073ea:	fc843783          	ld	a5,-56(s0)
    800073ee:	853e                	mv	a0,a5
    800073f0:	ffffa097          	auipc	ra,0xffffa
    800073f4:	f9e080e7          	jalr	-98(ra) # 8000138e <release>
  return i;
    800073f8:	fec42783          	lw	a5,-20(s0)
}
    800073fc:	853e                	mv	a0,a5
    800073fe:	60a6                	ld	ra,72(sp)
    80007400:	6406                	ld	s0,64(sp)
    80007402:	6161                	addi	sp,sp,80
    80007404:	8082                	ret

0000000080007406 <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    80007406:	7179                	addi	sp,sp,-48
    80007408:	f422                	sd	s0,40(sp)
    8000740a:	1800                	addi	s0,sp,48
    8000740c:	87aa                	mv	a5,a0
    8000740e:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    80007412:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    80007416:	fdc42783          	lw	a5,-36(s0)
    8000741a:	8b85                	andi	a5,a5,1
    8000741c:	2781                	sext.w	a5,a5
    8000741e:	c781                	beqz	a5,80007426 <flags2perm+0x20>
      perm = PTE_X;
    80007420:	47a1                	li	a5,8
    80007422:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    80007426:	fdc42783          	lw	a5,-36(s0)
    8000742a:	8b89                	andi	a5,a5,2
    8000742c:	2781                	sext.w	a5,a5
    8000742e:	c799                	beqz	a5,8000743c <flags2perm+0x36>
      perm |= PTE_W;
    80007430:	fec42783          	lw	a5,-20(s0)
    80007434:	0047e793          	ori	a5,a5,4
    80007438:	fef42623          	sw	a5,-20(s0)
    return perm;
    8000743c:	fec42783          	lw	a5,-20(s0)
}
    80007440:	853e                	mv	a0,a5
    80007442:	7422                	ld	s0,40(sp)
    80007444:	6145                	addi	sp,sp,48
    80007446:	8082                	ret

0000000080007448 <exec>:

int
exec(char *path, char **argv)
{
    80007448:	de010113          	addi	sp,sp,-544
    8000744c:	20113c23          	sd	ra,536(sp)
    80007450:	20813823          	sd	s0,528(sp)
    80007454:	20913423          	sd	s1,520(sp)
    80007458:	1400                	addi	s0,sp,544
    8000745a:	dea43423          	sd	a0,-536(s0)
    8000745e:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007462:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007466:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    8000746a:	ffffb097          	auipc	ra,0xffffb
    8000746e:	65c080e7          	jalr	1628(ra) # 80002ac6 <myproc>
    80007472:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007476:	fffff097          	auipc	ra,0xfffff
    8000747a:	f40080e7          	jalr	-192(ra) # 800063b6 <begin_op>

  if((ip = namei(path)) == 0){
    8000747e:	de843503          	ld	a0,-536(s0)
    80007482:	fffff097          	auipc	ra,0xfffff
    80007486:	bd0080e7          	jalr	-1072(ra) # 80006052 <namei>
    8000748a:	faa43423          	sd	a0,-88(s0)
    8000748e:	fa843783          	ld	a5,-88(s0)
    80007492:	e799                	bnez	a5,800074a0 <exec+0x58>
    end_op();
    80007494:	fffff097          	auipc	ra,0xfffff
    80007498:	fe4080e7          	jalr	-28(ra) # 80006478 <end_op>
    return -1;
    8000749c:	57fd                	li	a5,-1
    8000749e:	a1a9                	j	800078e8 <exec+0x4a0>
  }
  ilock(ip);
    800074a0:	fa843503          	ld	a0,-88(s0)
    800074a4:	ffffe097          	auipc	ra,0xffffe
    800074a8:	e88080e7          	jalr	-376(ra) # 8000532c <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800074ac:	e3040793          	addi	a5,s0,-464
    800074b0:	04000713          	li	a4,64
    800074b4:	4681                	li	a3,0
    800074b6:	863e                	mv	a2,a5
    800074b8:	4581                	li	a1,0
    800074ba:	fa843503          	ld	a0,-88(s0)
    800074be:	ffffe097          	auipc	ra,0xffffe
    800074c2:	424080e7          	jalr	1060(ra) # 800058e2 <readi>
    800074c6:	87aa                	mv	a5,a0
    800074c8:	873e                	mv	a4,a5
    800074ca:	04000793          	li	a5,64
    800074ce:	3af71763          	bne	a4,a5,8000787c <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800074d2:	e3042783          	lw	a5,-464(s0)
    800074d6:	873e                	mv	a4,a5
    800074d8:	464c47b7          	lui	a5,0x464c4
    800074dc:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800074e0:	3af71063          	bne	a4,a5,80007880 <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800074e4:	f9843503          	ld	a0,-104(s0)
    800074e8:	ffffc097          	auipc	ra,0xffffc
    800074ec:	840080e7          	jalr	-1984(ra) # 80002d28 <proc_pagetable>
    800074f0:	faa43023          	sd	a0,-96(s0)
    800074f4:	fa043783          	ld	a5,-96(s0)
    800074f8:	38078663          	beqz	a5,80007884 <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800074fc:	fc042623          	sw	zero,-52(s0)
    80007500:	e5043783          	ld	a5,-432(s0)
    80007504:	fcf42423          	sw	a5,-56(s0)
    80007508:	a0fd                	j	800075f6 <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    8000750a:	df840793          	addi	a5,s0,-520
    8000750e:	fc842683          	lw	a3,-56(s0)
    80007512:	03800713          	li	a4,56
    80007516:	863e                	mv	a2,a5
    80007518:	4581                	li	a1,0
    8000751a:	fa843503          	ld	a0,-88(s0)
    8000751e:	ffffe097          	auipc	ra,0xffffe
    80007522:	3c4080e7          	jalr	964(ra) # 800058e2 <readi>
    80007526:	87aa                	mv	a5,a0
    80007528:	873e                	mv	a4,a5
    8000752a:	03800793          	li	a5,56
    8000752e:	34f71d63          	bne	a4,a5,80007888 <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80007532:	df842783          	lw	a5,-520(s0)
    80007536:	873e                	mv	a4,a5
    80007538:	4785                	li	a5,1
    8000753a:	0af71163          	bne	a4,a5,800075dc <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    8000753e:	e2043703          	ld	a4,-480(s0)
    80007542:	e1843783          	ld	a5,-488(s0)
    80007546:	34f76363          	bltu	a4,a5,8000788c <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    8000754a:	e0843703          	ld	a4,-504(s0)
    8000754e:	e2043783          	ld	a5,-480(s0)
    80007552:	973e                	add	a4,a4,a5
    80007554:	e0843783          	ld	a5,-504(s0)
    80007558:	32f76c63          	bltu	a4,a5,80007890 <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    8000755c:	e0843703          	ld	a4,-504(s0)
    80007560:	6785                	lui	a5,0x1
    80007562:	17fd                	addi	a5,a5,-1
    80007564:	8ff9                	and	a5,a5,a4
    80007566:	32079763          	bnez	a5,80007894 <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    8000756a:	e0843703          	ld	a4,-504(s0)
    8000756e:	e2043783          	ld	a5,-480(s0)
    80007572:	00f704b3          	add	s1,a4,a5
    80007576:	dfc42783          	lw	a5,-516(s0)
    8000757a:	2781                	sext.w	a5,a5
    8000757c:	853e                	mv	a0,a5
    8000757e:	00000097          	auipc	ra,0x0
    80007582:	e88080e7          	jalr	-376(ra) # 80007406 <flags2perm>
    80007586:	87aa                	mv	a5,a0
    80007588:	86be                	mv	a3,a5
    8000758a:	8626                	mv	a2,s1
    8000758c:	fb843583          	ld	a1,-72(s0)
    80007590:	fa043503          	ld	a0,-96(s0)
    80007594:	ffffb097          	auipc	ra,0xffffb
    80007598:	c04080e7          	jalr	-1020(ra) # 80002198 <uvmalloc>
    8000759c:	f6a43823          	sd	a0,-144(s0)
    800075a0:	f7043783          	ld	a5,-144(s0)
    800075a4:	2e078a63          	beqz	a5,80007898 <exec+0x450>
      goto bad;
    sz = sz1;
    800075a8:	f7043783          	ld	a5,-144(s0)
    800075ac:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800075b0:	e0843783          	ld	a5,-504(s0)
    800075b4:	e0043703          	ld	a4,-512(s0)
    800075b8:	0007069b          	sext.w	a3,a4
    800075bc:	e1843703          	ld	a4,-488(s0)
    800075c0:	2701                	sext.w	a4,a4
    800075c2:	fa843603          	ld	a2,-88(s0)
    800075c6:	85be                	mv	a1,a5
    800075c8:	fa043503          	ld	a0,-96(s0)
    800075cc:	00000097          	auipc	ra,0x0
    800075d0:	330080e7          	jalr	816(ra) # 800078fc <loadseg>
    800075d4:	87aa                	mv	a5,a0
    800075d6:	2c07c363          	bltz	a5,8000789c <exec+0x454>
    800075da:	a011                	j	800075de <exec+0x196>
      continue;
    800075dc:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800075de:	fcc42783          	lw	a5,-52(s0)
    800075e2:	2785                	addiw	a5,a5,1
    800075e4:	fcf42623          	sw	a5,-52(s0)
    800075e8:	fc842783          	lw	a5,-56(s0)
    800075ec:	0387879b          	addiw	a5,a5,56
    800075f0:	2781                	sext.w	a5,a5
    800075f2:	fcf42423          	sw	a5,-56(s0)
    800075f6:	e6845783          	lhu	a5,-408(s0)
    800075fa:	0007871b          	sext.w	a4,a5
    800075fe:	fcc42783          	lw	a5,-52(s0)
    80007602:	2781                	sext.w	a5,a5
    80007604:	f0e7c3e3          	blt	a5,a4,8000750a <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007608:	fa843503          	ld	a0,-88(s0)
    8000760c:	ffffe097          	auipc	ra,0xffffe
    80007610:	f7e080e7          	jalr	-130(ra) # 8000558a <iunlockput>
  end_op();
    80007614:	fffff097          	auipc	ra,0xfffff
    80007618:	e64080e7          	jalr	-412(ra) # 80006478 <end_op>
  ip = 0;
    8000761c:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    80007620:	ffffb097          	auipc	ra,0xffffb
    80007624:	4a6080e7          	jalr	1190(ra) # 80002ac6 <myproc>
    80007628:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    8000762c:	f9843783          	ld	a5,-104(s0)
    80007630:	67bc                	ld	a5,72(a5)
    80007632:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007636:	fb843703          	ld	a4,-72(s0)
    8000763a:	6785                	lui	a5,0x1
    8000763c:	17fd                	addi	a5,a5,-1
    8000763e:	973e                	add	a4,a4,a5
    80007640:	77fd                	lui	a5,0xfffff
    80007642:	8ff9                	and	a5,a5,a4
    80007644:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    80007648:	fb843703          	ld	a4,-72(s0)
    8000764c:	6789                	lui	a5,0x2
    8000764e:	97ba                	add	a5,a5,a4
    80007650:	4691                	li	a3,4
    80007652:	863e                	mv	a2,a5
    80007654:	fb843583          	ld	a1,-72(s0)
    80007658:	fa043503          	ld	a0,-96(s0)
    8000765c:	ffffb097          	auipc	ra,0xffffb
    80007660:	b3c080e7          	jalr	-1220(ra) # 80002198 <uvmalloc>
    80007664:	f8a43423          	sd	a0,-120(s0)
    80007668:	f8843783          	ld	a5,-120(s0)
    8000766c:	22078a63          	beqz	a5,800078a0 <exec+0x458>
    goto bad;
  sz = sz1;
    80007670:	f8843783          	ld	a5,-120(s0)
    80007674:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007678:	fb843703          	ld	a4,-72(s0)
    8000767c:	77f9                	lui	a5,0xffffe
    8000767e:	97ba                	add	a5,a5,a4
    80007680:	85be                	mv	a1,a5
    80007682:	fa043503          	ld	a0,-96(s0)
    80007686:	ffffb097          	auipc	ra,0xffffb
    8000768a:	ea8080e7          	jalr	-344(ra) # 8000252e <uvmclear>
  sp = sz;
    8000768e:	fb843783          	ld	a5,-72(s0)
    80007692:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007696:	fb043703          	ld	a4,-80(s0)
    8000769a:	77fd                	lui	a5,0xfffff
    8000769c:	97ba                	add	a5,a5,a4
    8000769e:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    800076a2:	fc043023          	sd	zero,-64(s0)
    800076a6:	a845                	j	80007756 <exec+0x30e>
    if(argc >= MAXARG)
    800076a8:	fc043703          	ld	a4,-64(s0)
    800076ac:	47fd                	li	a5,31
    800076ae:	1ee7eb63          	bltu	a5,a4,800078a4 <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800076b2:	fc043783          	ld	a5,-64(s0)
    800076b6:	078e                	slli	a5,a5,0x3
    800076b8:	de043703          	ld	a4,-544(s0)
    800076bc:	97ba                	add	a5,a5,a4
    800076be:	639c                	ld	a5,0(a5)
    800076c0:	853e                	mv	a0,a5
    800076c2:	ffffa097          	auipc	ra,0xffffa
    800076c6:	1ba080e7          	jalr	442(ra) # 8000187c <strlen>
    800076ca:	87aa                	mv	a5,a0
    800076cc:	2785                	addiw	a5,a5,1
    800076ce:	2781                	sext.w	a5,a5
    800076d0:	873e                	mv	a4,a5
    800076d2:	fb043783          	ld	a5,-80(s0)
    800076d6:	8f99                	sub	a5,a5,a4
    800076d8:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800076dc:	fb043783          	ld	a5,-80(s0)
    800076e0:	9bc1                	andi	a5,a5,-16
    800076e2:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800076e6:	fb043703          	ld	a4,-80(s0)
    800076ea:	f8043783          	ld	a5,-128(s0)
    800076ee:	1af76d63          	bltu	a4,a5,800078a8 <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800076f2:	fc043783          	ld	a5,-64(s0)
    800076f6:	078e                	slli	a5,a5,0x3
    800076f8:	de043703          	ld	a4,-544(s0)
    800076fc:	97ba                	add	a5,a5,a4
    800076fe:	6384                	ld	s1,0(a5)
    80007700:	fc043783          	ld	a5,-64(s0)
    80007704:	078e                	slli	a5,a5,0x3
    80007706:	de043703          	ld	a4,-544(s0)
    8000770a:	97ba                	add	a5,a5,a4
    8000770c:	639c                	ld	a5,0(a5)
    8000770e:	853e                	mv	a0,a5
    80007710:	ffffa097          	auipc	ra,0xffffa
    80007714:	16c080e7          	jalr	364(ra) # 8000187c <strlen>
    80007718:	87aa                	mv	a5,a0
    8000771a:	2785                	addiw	a5,a5,1
    8000771c:	2781                	sext.w	a5,a5
    8000771e:	86be                	mv	a3,a5
    80007720:	8626                	mv	a2,s1
    80007722:	fb043583          	ld	a1,-80(s0)
    80007726:	fa043503          	ld	a0,-96(s0)
    8000772a:	ffffb097          	auipc	ra,0xffffb
    8000772e:	e66080e7          	jalr	-410(ra) # 80002590 <copyout>
    80007732:	87aa                	mv	a5,a0
    80007734:	1607cc63          	bltz	a5,800078ac <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    80007738:	fc043783          	ld	a5,-64(s0)
    8000773c:	078e                	slli	a5,a5,0x3
    8000773e:	fe040713          	addi	a4,s0,-32
    80007742:	97ba                	add	a5,a5,a4
    80007744:	fb043703          	ld	a4,-80(s0)
    80007748:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffc9f60>
  for(argc = 0; argv[argc]; argc++) {
    8000774c:	fc043783          	ld	a5,-64(s0)
    80007750:	0785                	addi	a5,a5,1
    80007752:	fcf43023          	sd	a5,-64(s0)
    80007756:	fc043783          	ld	a5,-64(s0)
    8000775a:	078e                	slli	a5,a5,0x3
    8000775c:	de043703          	ld	a4,-544(s0)
    80007760:	97ba                	add	a5,a5,a4
    80007762:	639c                	ld	a5,0(a5)
    80007764:	f3b1                	bnez	a5,800076a8 <exec+0x260>
  }
  ustack[argc] = 0;
    80007766:	fc043783          	ld	a5,-64(s0)
    8000776a:	078e                	slli	a5,a5,0x3
    8000776c:	fe040713          	addi	a4,s0,-32
    80007770:	97ba                	add	a5,a5,a4
    80007772:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007776:	fc043783          	ld	a5,-64(s0)
    8000777a:	0785                	addi	a5,a5,1
    8000777c:	078e                	slli	a5,a5,0x3
    8000777e:	fb043703          	ld	a4,-80(s0)
    80007782:	40f707b3          	sub	a5,a4,a5
    80007786:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    8000778a:	fb043783          	ld	a5,-80(s0)
    8000778e:	9bc1                	andi	a5,a5,-16
    80007790:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007794:	fb043703          	ld	a4,-80(s0)
    80007798:	f8043783          	ld	a5,-128(s0)
    8000779c:	10f76a63          	bltu	a4,a5,800078b0 <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    800077a0:	fc043783          	ld	a5,-64(s0)
    800077a4:	0785                	addi	a5,a5,1
    800077a6:	00379713          	slli	a4,a5,0x3
    800077aa:	e7040793          	addi	a5,s0,-400
    800077ae:	86ba                	mv	a3,a4
    800077b0:	863e                	mv	a2,a5
    800077b2:	fb043583          	ld	a1,-80(s0)
    800077b6:	fa043503          	ld	a0,-96(s0)
    800077ba:	ffffb097          	auipc	ra,0xffffb
    800077be:	dd6080e7          	jalr	-554(ra) # 80002590 <copyout>
    800077c2:	87aa                	mv	a5,a0
    800077c4:	0e07c863          	bltz	a5,800078b4 <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800077c8:	f9843783          	ld	a5,-104(s0)
    800077cc:	6fbc                	ld	a5,88(a5)
    800077ce:	fb043703          	ld	a4,-80(s0)
    800077d2:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800077d4:	de843783          	ld	a5,-536(s0)
    800077d8:	fcf43c23          	sd	a5,-40(s0)
    800077dc:	fd843783          	ld	a5,-40(s0)
    800077e0:	fcf43823          	sd	a5,-48(s0)
    800077e4:	a025                	j	8000780c <exec+0x3c4>
    if(*s == '/')
    800077e6:	fd843783          	ld	a5,-40(s0)
    800077ea:	0007c783          	lbu	a5,0(a5)
    800077ee:	873e                	mv	a4,a5
    800077f0:	02f00793          	li	a5,47
    800077f4:	00f71763          	bne	a4,a5,80007802 <exec+0x3ba>
      last = s+1;
    800077f8:	fd843783          	ld	a5,-40(s0)
    800077fc:	0785                	addi	a5,a5,1
    800077fe:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007802:	fd843783          	ld	a5,-40(s0)
    80007806:	0785                	addi	a5,a5,1
    80007808:	fcf43c23          	sd	a5,-40(s0)
    8000780c:	fd843783          	ld	a5,-40(s0)
    80007810:	0007c783          	lbu	a5,0(a5)
    80007814:	fbe9                	bnez	a5,800077e6 <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    80007816:	f9843783          	ld	a5,-104(s0)
    8000781a:	15878793          	addi	a5,a5,344
    8000781e:	4641                	li	a2,16
    80007820:	fd043583          	ld	a1,-48(s0)
    80007824:	853e                	mv	a0,a5
    80007826:	ffffa097          	auipc	ra,0xffffa
    8000782a:	fdc080e7          	jalr	-36(ra) # 80001802 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    8000782e:	f9843783          	ld	a5,-104(s0)
    80007832:	6bbc                	ld	a5,80(a5)
    80007834:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007838:	f9843783          	ld	a5,-104(s0)
    8000783c:	fa043703          	ld	a4,-96(s0)
    80007840:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007842:	f9843783          	ld	a5,-104(s0)
    80007846:	fb843703          	ld	a4,-72(s0)
    8000784a:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    8000784c:	f9843783          	ld	a5,-104(s0)
    80007850:	6fbc                	ld	a5,88(a5)
    80007852:	e4843703          	ld	a4,-440(s0)
    80007856:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007858:	f9843783          	ld	a5,-104(s0)
    8000785c:	6fbc                	ld	a5,88(a5)
    8000785e:	fb043703          	ld	a4,-80(s0)
    80007862:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007864:	f9043583          	ld	a1,-112(s0)
    80007868:	f7843503          	ld	a0,-136(s0)
    8000786c:	ffffb097          	auipc	ra,0xffffb
    80007870:	57c080e7          	jalr	1404(ra) # 80002de8 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007874:	fc043783          	ld	a5,-64(s0)
    80007878:	2781                	sext.w	a5,a5
    8000787a:	a0bd                	j	800078e8 <exec+0x4a0>
    goto bad;
    8000787c:	0001                	nop
    8000787e:	a825                	j	800078b6 <exec+0x46e>
    goto bad;
    80007880:	0001                	nop
    80007882:	a815                	j	800078b6 <exec+0x46e>
    goto bad;
    80007884:	0001                	nop
    80007886:	a805                	j	800078b6 <exec+0x46e>
      goto bad;
    80007888:	0001                	nop
    8000788a:	a035                	j	800078b6 <exec+0x46e>
      goto bad;
    8000788c:	0001                	nop
    8000788e:	a025                	j	800078b6 <exec+0x46e>
      goto bad;
    80007890:	0001                	nop
    80007892:	a015                	j	800078b6 <exec+0x46e>
      goto bad;
    80007894:	0001                	nop
    80007896:	a005                	j	800078b6 <exec+0x46e>
      goto bad;
    80007898:	0001                	nop
    8000789a:	a831                	j	800078b6 <exec+0x46e>
      goto bad;
    8000789c:	0001                	nop
    8000789e:	a821                	j	800078b6 <exec+0x46e>
    goto bad;
    800078a0:	0001                	nop
    800078a2:	a811                	j	800078b6 <exec+0x46e>
      goto bad;
    800078a4:	0001                	nop
    800078a6:	a801                	j	800078b6 <exec+0x46e>
      goto bad;
    800078a8:	0001                	nop
    800078aa:	a031                	j	800078b6 <exec+0x46e>
      goto bad;
    800078ac:	0001                	nop
    800078ae:	a021                	j	800078b6 <exec+0x46e>
    goto bad;
    800078b0:	0001                	nop
    800078b2:	a011                	j	800078b6 <exec+0x46e>
    goto bad;
    800078b4:	0001                	nop

 bad:
  if(pagetable)
    800078b6:	fa043783          	ld	a5,-96(s0)
    800078ba:	cb89                	beqz	a5,800078cc <exec+0x484>
    proc_freepagetable(pagetable, sz);
    800078bc:	fb843583          	ld	a1,-72(s0)
    800078c0:	fa043503          	ld	a0,-96(s0)
    800078c4:	ffffb097          	auipc	ra,0xffffb
    800078c8:	524080e7          	jalr	1316(ra) # 80002de8 <proc_freepagetable>
  if(ip){
    800078cc:	fa843783          	ld	a5,-88(s0)
    800078d0:	cb99                	beqz	a5,800078e6 <exec+0x49e>
    iunlockput(ip);
    800078d2:	fa843503          	ld	a0,-88(s0)
    800078d6:	ffffe097          	auipc	ra,0xffffe
    800078da:	cb4080e7          	jalr	-844(ra) # 8000558a <iunlockput>
    end_op();
    800078de:	fffff097          	auipc	ra,0xfffff
    800078e2:	b9a080e7          	jalr	-1126(ra) # 80006478 <end_op>
  }
  return -1;
    800078e6:	57fd                	li	a5,-1
}
    800078e8:	853e                	mv	a0,a5
    800078ea:	21813083          	ld	ra,536(sp)
    800078ee:	21013403          	ld	s0,528(sp)
    800078f2:	20813483          	ld	s1,520(sp)
    800078f6:	22010113          	addi	sp,sp,544
    800078fa:	8082                	ret

00000000800078fc <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    800078fc:	7139                	addi	sp,sp,-64
    800078fe:	fc06                	sd	ra,56(sp)
    80007900:	f822                	sd	s0,48(sp)
    80007902:	0080                	addi	s0,sp,64
    80007904:	fca43c23          	sd	a0,-40(s0)
    80007908:	fcb43823          	sd	a1,-48(s0)
    8000790c:	fcc43423          	sd	a2,-56(s0)
    80007910:	87b6                	mv	a5,a3
    80007912:	fcf42223          	sw	a5,-60(s0)
    80007916:	87ba                	mv	a5,a4
    80007918:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    8000791c:	fe042623          	sw	zero,-20(s0)
    80007920:	a05d                	j	800079c6 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    80007922:	fec46703          	lwu	a4,-20(s0)
    80007926:	fd043783          	ld	a5,-48(s0)
    8000792a:	97ba                	add	a5,a5,a4
    8000792c:	85be                	mv	a1,a5
    8000792e:	fd843503          	ld	a0,-40(s0)
    80007932:	ffffa097          	auipc	ra,0xffffa
    80007936:	4da080e7          	jalr	1242(ra) # 80001e0c <walkaddr>
    8000793a:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000793e:	fe043783          	ld	a5,-32(s0)
    80007942:	eb89                	bnez	a5,80007954 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007944:	00004517          	auipc	a0,0x4
    80007948:	cbc50513          	addi	a0,a0,-836 # 8000b600 <etext+0x600>
    8000794c:	ffff9097          	auipc	ra,0xffff9
    80007950:	340080e7          	jalr	832(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    80007954:	fc042703          	lw	a4,-64(s0)
    80007958:	fec42783          	lw	a5,-20(s0)
    8000795c:	40f707bb          	subw	a5,a4,a5
    80007960:	2781                	sext.w	a5,a5
    80007962:	873e                	mv	a4,a5
    80007964:	6785                	lui	a5,0x1
    80007966:	00f77b63          	bgeu	a4,a5,8000797c <loadseg+0x80>
      n = sz - i;
    8000796a:	fc042703          	lw	a4,-64(s0)
    8000796e:	fec42783          	lw	a5,-20(s0)
    80007972:	40f707bb          	subw	a5,a4,a5
    80007976:	fef42423          	sw	a5,-24(s0)
    8000797a:	a021                	j	80007982 <loadseg+0x86>
    else
      n = PGSIZE;
    8000797c:	6785                	lui	a5,0x1
    8000797e:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007982:	fc442703          	lw	a4,-60(s0)
    80007986:	fec42783          	lw	a5,-20(s0)
    8000798a:	9fb9                	addw	a5,a5,a4
    8000798c:	2781                	sext.w	a5,a5
    8000798e:	fe842703          	lw	a4,-24(s0)
    80007992:	86be                	mv	a3,a5
    80007994:	fe043603          	ld	a2,-32(s0)
    80007998:	4581                	li	a1,0
    8000799a:	fc843503          	ld	a0,-56(s0)
    8000799e:	ffffe097          	auipc	ra,0xffffe
    800079a2:	f44080e7          	jalr	-188(ra) # 800058e2 <readi>
    800079a6:	87aa                	mv	a5,a0
    800079a8:	0007871b          	sext.w	a4,a5
    800079ac:	fe842783          	lw	a5,-24(s0)
    800079b0:	2781                	sext.w	a5,a5
    800079b2:	00e78463          	beq	a5,a4,800079ba <loadseg+0xbe>
      return -1;
    800079b6:	57fd                	li	a5,-1
    800079b8:	a005                	j	800079d8 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    800079ba:	fec42703          	lw	a4,-20(s0)
    800079be:	6785                	lui	a5,0x1
    800079c0:	9fb9                	addw	a5,a5,a4
    800079c2:	fef42623          	sw	a5,-20(s0)
    800079c6:	fec42703          	lw	a4,-20(s0)
    800079ca:	fc042783          	lw	a5,-64(s0)
    800079ce:	2701                	sext.w	a4,a4
    800079d0:	2781                	sext.w	a5,a5
    800079d2:	f4f768e3          	bltu	a4,a5,80007922 <loadseg+0x26>
  }
  
  return 0;
    800079d6:	4781                	li	a5,0
}
    800079d8:	853e                	mv	a0,a5
    800079da:	70e2                	ld	ra,56(sp)
    800079dc:	7442                	ld	s0,48(sp)
    800079de:	6121                	addi	sp,sp,64
    800079e0:	8082                	ret

00000000800079e2 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    800079e2:	7139                	addi	sp,sp,-64
    800079e4:	fc06                	sd	ra,56(sp)
    800079e6:	f822                	sd	s0,48(sp)
    800079e8:	0080                	addi	s0,sp,64
    800079ea:	87aa                	mv	a5,a0
    800079ec:	fcb43823          	sd	a1,-48(s0)
    800079f0:	fcc43423          	sd	a2,-56(s0)
    800079f4:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    800079f8:	fe440713          	addi	a4,s0,-28
    800079fc:	fdc42783          	lw	a5,-36(s0)
    80007a00:	85ba                	mv	a1,a4
    80007a02:	853e                	mv	a0,a5
    80007a04:	ffffd097          	auipc	ra,0xffffd
    80007a08:	980080e7          	jalr	-1664(ra) # 80004384 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007a0c:	fe442783          	lw	a5,-28(s0)
    80007a10:	0207c863          	bltz	a5,80007a40 <argfd+0x5e>
    80007a14:	fe442783          	lw	a5,-28(s0)
    80007a18:	873e                	mv	a4,a5
    80007a1a:	47bd                	li	a5,15
    80007a1c:	02e7c263          	blt	a5,a4,80007a40 <argfd+0x5e>
    80007a20:	ffffb097          	auipc	ra,0xffffb
    80007a24:	0a6080e7          	jalr	166(ra) # 80002ac6 <myproc>
    80007a28:	872a                	mv	a4,a0
    80007a2a:	fe442783          	lw	a5,-28(s0)
    80007a2e:	07e9                	addi	a5,a5,26
    80007a30:	078e                	slli	a5,a5,0x3
    80007a32:	97ba                	add	a5,a5,a4
    80007a34:	639c                	ld	a5,0(a5)
    80007a36:	fef43423          	sd	a5,-24(s0)
    80007a3a:	fe843783          	ld	a5,-24(s0)
    80007a3e:	e399                	bnez	a5,80007a44 <argfd+0x62>
    return -1;
    80007a40:	57fd                	li	a5,-1
    80007a42:	a015                	j	80007a66 <argfd+0x84>
  if(pfd)
    80007a44:	fd043783          	ld	a5,-48(s0)
    80007a48:	c791                	beqz	a5,80007a54 <argfd+0x72>
    *pfd = fd;
    80007a4a:	fe442703          	lw	a4,-28(s0)
    80007a4e:	fd043783          	ld	a5,-48(s0)
    80007a52:	c398                	sw	a4,0(a5)
  if(pf)
    80007a54:	fc843783          	ld	a5,-56(s0)
    80007a58:	c791                	beqz	a5,80007a64 <argfd+0x82>
    *pf = f;
    80007a5a:	fc843783          	ld	a5,-56(s0)
    80007a5e:	fe843703          	ld	a4,-24(s0)
    80007a62:	e398                	sd	a4,0(a5)
  return 0;
    80007a64:	4781                	li	a5,0
}
    80007a66:	853e                	mv	a0,a5
    80007a68:	70e2                	ld	ra,56(sp)
    80007a6a:	7442                	ld	s0,48(sp)
    80007a6c:	6121                	addi	sp,sp,64
    80007a6e:	8082                	ret

0000000080007a70 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007a70:	7179                	addi	sp,sp,-48
    80007a72:	f406                	sd	ra,40(sp)
    80007a74:	f022                	sd	s0,32(sp)
    80007a76:	1800                	addi	s0,sp,48
    80007a78:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007a7c:	ffffb097          	auipc	ra,0xffffb
    80007a80:	04a080e7          	jalr	74(ra) # 80002ac6 <myproc>
    80007a84:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007a88:	fe042623          	sw	zero,-20(s0)
    80007a8c:	a825                	j	80007ac4 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007a8e:	fe043703          	ld	a4,-32(s0)
    80007a92:	fec42783          	lw	a5,-20(s0)
    80007a96:	07e9                	addi	a5,a5,26
    80007a98:	078e                	slli	a5,a5,0x3
    80007a9a:	97ba                	add	a5,a5,a4
    80007a9c:	639c                	ld	a5,0(a5)
    80007a9e:	ef91                	bnez	a5,80007aba <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007aa0:	fe043703          	ld	a4,-32(s0)
    80007aa4:	fec42783          	lw	a5,-20(s0)
    80007aa8:	07e9                	addi	a5,a5,26
    80007aaa:	078e                	slli	a5,a5,0x3
    80007aac:	97ba                	add	a5,a5,a4
    80007aae:	fd843703          	ld	a4,-40(s0)
    80007ab2:	e398                	sd	a4,0(a5)
      return fd;
    80007ab4:	fec42783          	lw	a5,-20(s0)
    80007ab8:	a831                	j	80007ad4 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007aba:	fec42783          	lw	a5,-20(s0)
    80007abe:	2785                	addiw	a5,a5,1
    80007ac0:	fef42623          	sw	a5,-20(s0)
    80007ac4:	fec42783          	lw	a5,-20(s0)
    80007ac8:	0007871b          	sext.w	a4,a5
    80007acc:	47bd                	li	a5,15
    80007ace:	fce7d0e3          	bge	a5,a4,80007a8e <fdalloc+0x1e>
    }
  }
  return -1;
    80007ad2:	57fd                	li	a5,-1
}
    80007ad4:	853e                	mv	a0,a5
    80007ad6:	70a2                	ld	ra,40(sp)
    80007ad8:	7402                	ld	s0,32(sp)
    80007ada:	6145                	addi	sp,sp,48
    80007adc:	8082                	ret

0000000080007ade <sys_dup>:

uint64
sys_dup(void)
{
    80007ade:	1101                	addi	sp,sp,-32
    80007ae0:	ec06                	sd	ra,24(sp)
    80007ae2:	e822                	sd	s0,16(sp)
    80007ae4:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007ae6:	fe040793          	addi	a5,s0,-32
    80007aea:	863e                	mv	a2,a5
    80007aec:	4581                	li	a1,0
    80007aee:	4501                	li	a0,0
    80007af0:	00000097          	auipc	ra,0x0
    80007af4:	ef2080e7          	jalr	-270(ra) # 800079e2 <argfd>
    80007af8:	87aa                	mv	a5,a0
    80007afa:	0007d463          	bgez	a5,80007b02 <sys_dup+0x24>
    return -1;
    80007afe:	57fd                	li	a5,-1
    80007b00:	a81d                	j	80007b36 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007b02:	fe043783          	ld	a5,-32(s0)
    80007b06:	853e                	mv	a0,a5
    80007b08:	00000097          	auipc	ra,0x0
    80007b0c:	f68080e7          	jalr	-152(ra) # 80007a70 <fdalloc>
    80007b10:	87aa                	mv	a5,a0
    80007b12:	fef42623          	sw	a5,-20(s0)
    80007b16:	fec42783          	lw	a5,-20(s0)
    80007b1a:	2781                	sext.w	a5,a5
    80007b1c:	0007d463          	bgez	a5,80007b24 <sys_dup+0x46>
    return -1;
    80007b20:	57fd                	li	a5,-1
    80007b22:	a811                	j	80007b36 <sys_dup+0x58>
  filedup(f);
    80007b24:	fe043783          	ld	a5,-32(s0)
    80007b28:	853e                	mv	a0,a5
    80007b2a:	fffff097          	auipc	ra,0xfffff
    80007b2e:	ec0080e7          	jalr	-320(ra) # 800069ea <filedup>
  return fd;
    80007b32:	fec42783          	lw	a5,-20(s0)
}
    80007b36:	853e                	mv	a0,a5
    80007b38:	60e2                	ld	ra,24(sp)
    80007b3a:	6442                	ld	s0,16(sp)
    80007b3c:	6105                	addi	sp,sp,32
    80007b3e:	8082                	ret

0000000080007b40 <sys_read>:

uint64
sys_read(void)
{
    80007b40:	7179                	addi	sp,sp,-48
    80007b42:	f406                	sd	ra,40(sp)
    80007b44:	f022                	sd	s0,32(sp)
    80007b46:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007b48:	fd840793          	addi	a5,s0,-40
    80007b4c:	85be                	mv	a1,a5
    80007b4e:	4505                	li	a0,1
    80007b50:	ffffd097          	auipc	ra,0xffffd
    80007b54:	86a080e7          	jalr	-1942(ra) # 800043ba <argaddr>
  argint(2, &n);
    80007b58:	fe440793          	addi	a5,s0,-28
    80007b5c:	85be                	mv	a1,a5
    80007b5e:	4509                	li	a0,2
    80007b60:	ffffd097          	auipc	ra,0xffffd
    80007b64:	824080e7          	jalr	-2012(ra) # 80004384 <argint>
  if(argfd(0, 0, &f) < 0)
    80007b68:	fe840793          	addi	a5,s0,-24
    80007b6c:	863e                	mv	a2,a5
    80007b6e:	4581                	li	a1,0
    80007b70:	4501                	li	a0,0
    80007b72:	00000097          	auipc	ra,0x0
    80007b76:	e70080e7          	jalr	-400(ra) # 800079e2 <argfd>
    80007b7a:	87aa                	mv	a5,a0
    80007b7c:	0007d463          	bgez	a5,80007b84 <sys_read+0x44>
    return -1;
    80007b80:	57fd                	li	a5,-1
    80007b82:	a839                	j	80007ba0 <sys_read+0x60>
  return fileread(f, p, n);
    80007b84:	fe843783          	ld	a5,-24(s0)
    80007b88:	fd843703          	ld	a4,-40(s0)
    80007b8c:	fe442683          	lw	a3,-28(s0)
    80007b90:	8636                	mv	a2,a3
    80007b92:	85ba                	mv	a1,a4
    80007b94:	853e                	mv	a0,a5
    80007b96:	fffff097          	auipc	ra,0xfffff
    80007b9a:	066080e7          	jalr	102(ra) # 80006bfc <fileread>
    80007b9e:	87aa                	mv	a5,a0
}
    80007ba0:	853e                	mv	a0,a5
    80007ba2:	70a2                	ld	ra,40(sp)
    80007ba4:	7402                	ld	s0,32(sp)
    80007ba6:	6145                	addi	sp,sp,48
    80007ba8:	8082                	ret

0000000080007baa <sys_write>:

uint64
sys_write(void)
{
    80007baa:	7179                	addi	sp,sp,-48
    80007bac:	f406                	sd	ra,40(sp)
    80007bae:	f022                	sd	s0,32(sp)
    80007bb0:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007bb2:	fd840793          	addi	a5,s0,-40
    80007bb6:	85be                	mv	a1,a5
    80007bb8:	4505                	li	a0,1
    80007bba:	ffffd097          	auipc	ra,0xffffd
    80007bbe:	800080e7          	jalr	-2048(ra) # 800043ba <argaddr>
  argint(2, &n);
    80007bc2:	fe440793          	addi	a5,s0,-28
    80007bc6:	85be                	mv	a1,a5
    80007bc8:	4509                	li	a0,2
    80007bca:	ffffc097          	auipc	ra,0xffffc
    80007bce:	7ba080e7          	jalr	1978(ra) # 80004384 <argint>
  if(argfd(0, 0, &f) < 0)
    80007bd2:	fe840793          	addi	a5,s0,-24
    80007bd6:	863e                	mv	a2,a5
    80007bd8:	4581                	li	a1,0
    80007bda:	4501                	li	a0,0
    80007bdc:	00000097          	auipc	ra,0x0
    80007be0:	e06080e7          	jalr	-506(ra) # 800079e2 <argfd>
    80007be4:	87aa                	mv	a5,a0
    80007be6:	0007d463          	bgez	a5,80007bee <sys_write+0x44>
    return -1;
    80007bea:	57fd                	li	a5,-1
    80007bec:	a839                	j	80007c0a <sys_write+0x60>

  return filewrite(f, p, n);
    80007bee:	fe843783          	ld	a5,-24(s0)
    80007bf2:	fd843703          	ld	a4,-40(s0)
    80007bf6:	fe442683          	lw	a3,-28(s0)
    80007bfa:	8636                	mv	a2,a3
    80007bfc:	85ba                	mv	a1,a4
    80007bfe:	853e                	mv	a0,a5
    80007c00:	fffff097          	auipc	ra,0xfffff
    80007c04:	162080e7          	jalr	354(ra) # 80006d62 <filewrite>
    80007c08:	87aa                	mv	a5,a0
}
    80007c0a:	853e                	mv	a0,a5
    80007c0c:	70a2                	ld	ra,40(sp)
    80007c0e:	7402                	ld	s0,32(sp)
    80007c10:	6145                	addi	sp,sp,48
    80007c12:	8082                	ret

0000000080007c14 <sys_close>:

uint64
sys_close(void)
{
    80007c14:	1101                	addi	sp,sp,-32
    80007c16:	ec06                	sd	ra,24(sp)
    80007c18:	e822                	sd	s0,16(sp)
    80007c1a:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007c1c:	fe040713          	addi	a4,s0,-32
    80007c20:	fec40793          	addi	a5,s0,-20
    80007c24:	863a                	mv	a2,a4
    80007c26:	85be                	mv	a1,a5
    80007c28:	4501                	li	a0,0
    80007c2a:	00000097          	auipc	ra,0x0
    80007c2e:	db8080e7          	jalr	-584(ra) # 800079e2 <argfd>
    80007c32:	87aa                	mv	a5,a0
    80007c34:	0007d463          	bgez	a5,80007c3c <sys_close+0x28>
    return -1;
    80007c38:	57fd                	li	a5,-1
    80007c3a:	a02d                	j	80007c64 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007c3c:	ffffb097          	auipc	ra,0xffffb
    80007c40:	e8a080e7          	jalr	-374(ra) # 80002ac6 <myproc>
    80007c44:	872a                	mv	a4,a0
    80007c46:	fec42783          	lw	a5,-20(s0)
    80007c4a:	07e9                	addi	a5,a5,26
    80007c4c:	078e                	slli	a5,a5,0x3
    80007c4e:	97ba                	add	a5,a5,a4
    80007c50:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007c54:	fe043783          	ld	a5,-32(s0)
    80007c58:	853e                	mv	a0,a5
    80007c5a:	fffff097          	auipc	ra,0xfffff
    80007c5e:	df6080e7          	jalr	-522(ra) # 80006a50 <fileclose>
  return 0;
    80007c62:	4781                	li	a5,0
}
    80007c64:	853e                	mv	a0,a5
    80007c66:	60e2                	ld	ra,24(sp)
    80007c68:	6442                	ld	s0,16(sp)
    80007c6a:	6105                	addi	sp,sp,32
    80007c6c:	8082                	ret

0000000080007c6e <sys_fstat>:

uint64
sys_fstat(void)
{
    80007c6e:	1101                	addi	sp,sp,-32
    80007c70:	ec06                	sd	ra,24(sp)
    80007c72:	e822                	sd	s0,16(sp)
    80007c74:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007c76:	fe040793          	addi	a5,s0,-32
    80007c7a:	85be                	mv	a1,a5
    80007c7c:	4505                	li	a0,1
    80007c7e:	ffffc097          	auipc	ra,0xffffc
    80007c82:	73c080e7          	jalr	1852(ra) # 800043ba <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007c86:	fe840793          	addi	a5,s0,-24
    80007c8a:	863e                	mv	a2,a5
    80007c8c:	4581                	li	a1,0
    80007c8e:	4501                	li	a0,0
    80007c90:	00000097          	auipc	ra,0x0
    80007c94:	d52080e7          	jalr	-686(ra) # 800079e2 <argfd>
    80007c98:	87aa                	mv	a5,a0
    80007c9a:	0007d463          	bgez	a5,80007ca2 <sys_fstat+0x34>
    return -1;
    80007c9e:	57fd                	li	a5,-1
    80007ca0:	a821                	j	80007cb8 <sys_fstat+0x4a>
  return filestat(f, st);
    80007ca2:	fe843783          	ld	a5,-24(s0)
    80007ca6:	fe043703          	ld	a4,-32(s0)
    80007caa:	85ba                	mv	a1,a4
    80007cac:	853e                	mv	a0,a5
    80007cae:	fffff097          	auipc	ra,0xfffff
    80007cb2:	eaa080e7          	jalr	-342(ra) # 80006b58 <filestat>
    80007cb6:	87aa                	mv	a5,a0
}
    80007cb8:	853e                	mv	a0,a5
    80007cba:	60e2                	ld	ra,24(sp)
    80007cbc:	6442                	ld	s0,16(sp)
    80007cbe:	6105                	addi	sp,sp,32
    80007cc0:	8082                	ret

0000000080007cc2 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007cc2:	7169                	addi	sp,sp,-304
    80007cc4:	f606                	sd	ra,296(sp)
    80007cc6:	f222                	sd	s0,288(sp)
    80007cc8:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007cca:	ed040793          	addi	a5,s0,-304
    80007cce:	08000613          	li	a2,128
    80007cd2:	85be                	mv	a1,a5
    80007cd4:	4501                	li	a0,0
    80007cd6:	ffffc097          	auipc	ra,0xffffc
    80007cda:	716080e7          	jalr	1814(ra) # 800043ec <argstr>
    80007cde:	87aa                	mv	a5,a0
    80007ce0:	0007cf63          	bltz	a5,80007cfe <sys_link+0x3c>
    80007ce4:	f5040793          	addi	a5,s0,-176
    80007ce8:	08000613          	li	a2,128
    80007cec:	85be                	mv	a1,a5
    80007cee:	4505                	li	a0,1
    80007cf0:	ffffc097          	auipc	ra,0xffffc
    80007cf4:	6fc080e7          	jalr	1788(ra) # 800043ec <argstr>
    80007cf8:	87aa                	mv	a5,a0
    80007cfa:	0007d463          	bgez	a5,80007d02 <sys_link+0x40>
    return -1;
    80007cfe:	57fd                	li	a5,-1
    80007d00:	aab5                	j	80007e7c <sys_link+0x1ba>

  begin_op();
    80007d02:	ffffe097          	auipc	ra,0xffffe
    80007d06:	6b4080e7          	jalr	1716(ra) # 800063b6 <begin_op>
  if((ip = namei(old)) == 0){
    80007d0a:	ed040793          	addi	a5,s0,-304
    80007d0e:	853e                	mv	a0,a5
    80007d10:	ffffe097          	auipc	ra,0xffffe
    80007d14:	342080e7          	jalr	834(ra) # 80006052 <namei>
    80007d18:	fea43423          	sd	a0,-24(s0)
    80007d1c:	fe843783          	ld	a5,-24(s0)
    80007d20:	e799                	bnez	a5,80007d2e <sys_link+0x6c>
    end_op();
    80007d22:	ffffe097          	auipc	ra,0xffffe
    80007d26:	756080e7          	jalr	1878(ra) # 80006478 <end_op>
    return -1;
    80007d2a:	57fd                	li	a5,-1
    80007d2c:	aa81                	j	80007e7c <sys_link+0x1ba>
  }

  ilock(ip);
    80007d2e:	fe843503          	ld	a0,-24(s0)
    80007d32:	ffffd097          	auipc	ra,0xffffd
    80007d36:	5fa080e7          	jalr	1530(ra) # 8000532c <ilock>
  if(ip->type == T_DIR){
    80007d3a:	fe843783          	ld	a5,-24(s0)
    80007d3e:	04479783          	lh	a5,68(a5)
    80007d42:	0007871b          	sext.w	a4,a5
    80007d46:	4785                	li	a5,1
    80007d48:	00f71e63          	bne	a4,a5,80007d64 <sys_link+0xa2>
    iunlockput(ip);
    80007d4c:	fe843503          	ld	a0,-24(s0)
    80007d50:	ffffe097          	auipc	ra,0xffffe
    80007d54:	83a080e7          	jalr	-1990(ra) # 8000558a <iunlockput>
    end_op();
    80007d58:	ffffe097          	auipc	ra,0xffffe
    80007d5c:	720080e7          	jalr	1824(ra) # 80006478 <end_op>
    return -1;
    80007d60:	57fd                	li	a5,-1
    80007d62:	aa29                	j	80007e7c <sys_link+0x1ba>
  }

  ip->nlink++;
    80007d64:	fe843783          	ld	a5,-24(s0)
    80007d68:	04a79783          	lh	a5,74(a5)
    80007d6c:	17c2                	slli	a5,a5,0x30
    80007d6e:	93c1                	srli	a5,a5,0x30
    80007d70:	2785                	addiw	a5,a5,1
    80007d72:	17c2                	slli	a5,a5,0x30
    80007d74:	93c1                	srli	a5,a5,0x30
    80007d76:	0107971b          	slliw	a4,a5,0x10
    80007d7a:	4107571b          	sraiw	a4,a4,0x10
    80007d7e:	fe843783          	ld	a5,-24(s0)
    80007d82:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d86:	fe843503          	ld	a0,-24(s0)
    80007d8a:	ffffd097          	auipc	ra,0xffffd
    80007d8e:	352080e7          	jalr	850(ra) # 800050dc <iupdate>
  iunlock(ip);
    80007d92:	fe843503          	ld	a0,-24(s0)
    80007d96:	ffffd097          	auipc	ra,0xffffd
    80007d9a:	6ca080e7          	jalr	1738(ra) # 80005460 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007d9e:	fd040713          	addi	a4,s0,-48
    80007da2:	f5040793          	addi	a5,s0,-176
    80007da6:	85ba                	mv	a1,a4
    80007da8:	853e                	mv	a0,a5
    80007daa:	ffffe097          	auipc	ra,0xffffe
    80007dae:	2d4080e7          	jalr	724(ra) # 8000607e <nameiparent>
    80007db2:	fea43023          	sd	a0,-32(s0)
    80007db6:	fe043783          	ld	a5,-32(s0)
    80007dba:	cba5                	beqz	a5,80007e2a <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007dbc:	fe043503          	ld	a0,-32(s0)
    80007dc0:	ffffd097          	auipc	ra,0xffffd
    80007dc4:	56c080e7          	jalr	1388(ra) # 8000532c <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007dc8:	fe043783          	ld	a5,-32(s0)
    80007dcc:	4398                	lw	a4,0(a5)
    80007dce:	fe843783          	ld	a5,-24(s0)
    80007dd2:	439c                	lw	a5,0(a5)
    80007dd4:	02f71263          	bne	a4,a5,80007df8 <sys_link+0x136>
    80007dd8:	fe843783          	ld	a5,-24(s0)
    80007ddc:	43d8                	lw	a4,4(a5)
    80007dde:	fd040793          	addi	a5,s0,-48
    80007de2:	863a                	mv	a2,a4
    80007de4:	85be                	mv	a1,a5
    80007de6:	fe043503          	ld	a0,-32(s0)
    80007dea:	ffffe097          	auipc	ra,0xffffe
    80007dee:	f5a080e7          	jalr	-166(ra) # 80005d44 <dirlink>
    80007df2:	87aa                	mv	a5,a0
    80007df4:	0007d963          	bgez	a5,80007e06 <sys_link+0x144>
    iunlockput(dp);
    80007df8:	fe043503          	ld	a0,-32(s0)
    80007dfc:	ffffd097          	auipc	ra,0xffffd
    80007e00:	78e080e7          	jalr	1934(ra) # 8000558a <iunlockput>
    goto bad;
    80007e04:	a025                	j	80007e2c <sys_link+0x16a>
  }
  iunlockput(dp);
    80007e06:	fe043503          	ld	a0,-32(s0)
    80007e0a:	ffffd097          	auipc	ra,0xffffd
    80007e0e:	780080e7          	jalr	1920(ra) # 8000558a <iunlockput>
  iput(ip);
    80007e12:	fe843503          	ld	a0,-24(s0)
    80007e16:	ffffd097          	auipc	ra,0xffffd
    80007e1a:	6a4080e7          	jalr	1700(ra) # 800054ba <iput>

  end_op();
    80007e1e:	ffffe097          	auipc	ra,0xffffe
    80007e22:	65a080e7          	jalr	1626(ra) # 80006478 <end_op>

  return 0;
    80007e26:	4781                	li	a5,0
    80007e28:	a891                	j	80007e7c <sys_link+0x1ba>
    goto bad;
    80007e2a:	0001                	nop

bad:
  ilock(ip);
    80007e2c:	fe843503          	ld	a0,-24(s0)
    80007e30:	ffffd097          	auipc	ra,0xffffd
    80007e34:	4fc080e7          	jalr	1276(ra) # 8000532c <ilock>
  ip->nlink--;
    80007e38:	fe843783          	ld	a5,-24(s0)
    80007e3c:	04a79783          	lh	a5,74(a5)
    80007e40:	17c2                	slli	a5,a5,0x30
    80007e42:	93c1                	srli	a5,a5,0x30
    80007e44:	37fd                	addiw	a5,a5,-1
    80007e46:	17c2                	slli	a5,a5,0x30
    80007e48:	93c1                	srli	a5,a5,0x30
    80007e4a:	0107971b          	slliw	a4,a5,0x10
    80007e4e:	4107571b          	sraiw	a4,a4,0x10
    80007e52:	fe843783          	ld	a5,-24(s0)
    80007e56:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007e5a:	fe843503          	ld	a0,-24(s0)
    80007e5e:	ffffd097          	auipc	ra,0xffffd
    80007e62:	27e080e7          	jalr	638(ra) # 800050dc <iupdate>
  iunlockput(ip);
    80007e66:	fe843503          	ld	a0,-24(s0)
    80007e6a:	ffffd097          	auipc	ra,0xffffd
    80007e6e:	720080e7          	jalr	1824(ra) # 8000558a <iunlockput>
  end_op();
    80007e72:	ffffe097          	auipc	ra,0xffffe
    80007e76:	606080e7          	jalr	1542(ra) # 80006478 <end_op>
  return -1;
    80007e7a:	57fd                	li	a5,-1
}
    80007e7c:	853e                	mv	a0,a5
    80007e7e:	70b2                	ld	ra,296(sp)
    80007e80:	7412                	ld	s0,288(sp)
    80007e82:	6155                	addi	sp,sp,304
    80007e84:	8082                	ret

0000000080007e86 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007e86:	7139                	addi	sp,sp,-64
    80007e88:	fc06                	sd	ra,56(sp)
    80007e8a:	f822                	sd	s0,48(sp)
    80007e8c:	0080                	addi	s0,sp,64
    80007e8e:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e92:	02000793          	li	a5,32
    80007e96:	fef42623          	sw	a5,-20(s0)
    80007e9a:	a0b1                	j	80007ee6 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007e9c:	fd840793          	addi	a5,s0,-40
    80007ea0:	fec42683          	lw	a3,-20(s0)
    80007ea4:	4741                	li	a4,16
    80007ea6:	863e                	mv	a2,a5
    80007ea8:	4581                	li	a1,0
    80007eaa:	fc843503          	ld	a0,-56(s0)
    80007eae:	ffffe097          	auipc	ra,0xffffe
    80007eb2:	a34080e7          	jalr	-1484(ra) # 800058e2 <readi>
    80007eb6:	87aa                	mv	a5,a0
    80007eb8:	873e                	mv	a4,a5
    80007eba:	47c1                	li	a5,16
    80007ebc:	00f70a63          	beq	a4,a5,80007ed0 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007ec0:	00003517          	auipc	a0,0x3
    80007ec4:	76050513          	addi	a0,a0,1888 # 8000b620 <etext+0x620>
    80007ec8:	ffff9097          	auipc	ra,0xffff9
    80007ecc:	dc4080e7          	jalr	-572(ra) # 80000c8c <panic>
    if(de.inum != 0)
    80007ed0:	fd845783          	lhu	a5,-40(s0)
    80007ed4:	c399                	beqz	a5,80007eda <isdirempty+0x54>
      return 0;
    80007ed6:	4781                	li	a5,0
    80007ed8:	a839                	j	80007ef6 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007eda:	fec42783          	lw	a5,-20(s0)
    80007ede:	27c1                	addiw	a5,a5,16
    80007ee0:	2781                	sext.w	a5,a5
    80007ee2:	fef42623          	sw	a5,-20(s0)
    80007ee6:	fc843783          	ld	a5,-56(s0)
    80007eea:	47f8                	lw	a4,76(a5)
    80007eec:	fec42783          	lw	a5,-20(s0)
    80007ef0:	fae7e6e3          	bltu	a5,a4,80007e9c <isdirempty+0x16>
  }
  return 1;
    80007ef4:	4785                	li	a5,1
}
    80007ef6:	853e                	mv	a0,a5
    80007ef8:	70e2                	ld	ra,56(sp)
    80007efa:	7442                	ld	s0,48(sp)
    80007efc:	6121                	addi	sp,sp,64
    80007efe:	8082                	ret

0000000080007f00 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007f00:	7155                	addi	sp,sp,-208
    80007f02:	e586                	sd	ra,200(sp)
    80007f04:	e1a2                	sd	s0,192(sp)
    80007f06:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007f08:	f4040793          	addi	a5,s0,-192
    80007f0c:	08000613          	li	a2,128
    80007f10:	85be                	mv	a1,a5
    80007f12:	4501                	li	a0,0
    80007f14:	ffffc097          	auipc	ra,0xffffc
    80007f18:	4d8080e7          	jalr	1240(ra) # 800043ec <argstr>
    80007f1c:	87aa                	mv	a5,a0
    80007f1e:	0007d463          	bgez	a5,80007f26 <sys_unlink+0x26>
    return -1;
    80007f22:	57fd                	li	a5,-1
    80007f24:	a2ed                	j	8000810e <sys_unlink+0x20e>

  begin_op();
    80007f26:	ffffe097          	auipc	ra,0xffffe
    80007f2a:	490080e7          	jalr	1168(ra) # 800063b6 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007f2e:	fc040713          	addi	a4,s0,-64
    80007f32:	f4040793          	addi	a5,s0,-192
    80007f36:	85ba                	mv	a1,a4
    80007f38:	853e                	mv	a0,a5
    80007f3a:	ffffe097          	auipc	ra,0xffffe
    80007f3e:	144080e7          	jalr	324(ra) # 8000607e <nameiparent>
    80007f42:	fea43423          	sd	a0,-24(s0)
    80007f46:	fe843783          	ld	a5,-24(s0)
    80007f4a:	e799                	bnez	a5,80007f58 <sys_unlink+0x58>
    end_op();
    80007f4c:	ffffe097          	auipc	ra,0xffffe
    80007f50:	52c080e7          	jalr	1324(ra) # 80006478 <end_op>
    return -1;
    80007f54:	57fd                	li	a5,-1
    80007f56:	aa65                	j	8000810e <sys_unlink+0x20e>
  }

  ilock(dp);
    80007f58:	fe843503          	ld	a0,-24(s0)
    80007f5c:	ffffd097          	auipc	ra,0xffffd
    80007f60:	3d0080e7          	jalr	976(ra) # 8000532c <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007f64:	fc040793          	addi	a5,s0,-64
    80007f68:	00003597          	auipc	a1,0x3
    80007f6c:	6d058593          	addi	a1,a1,1744 # 8000b638 <etext+0x638>
    80007f70:	853e                	mv	a0,a5
    80007f72:	ffffe097          	auipc	ra,0xffffe
    80007f76:	cbc080e7          	jalr	-836(ra) # 80005c2e <namecmp>
    80007f7a:	87aa                	mv	a5,a0
    80007f7c:	16078b63          	beqz	a5,800080f2 <sys_unlink+0x1f2>
    80007f80:	fc040793          	addi	a5,s0,-64
    80007f84:	00003597          	auipc	a1,0x3
    80007f88:	6bc58593          	addi	a1,a1,1724 # 8000b640 <etext+0x640>
    80007f8c:	853e                	mv	a0,a5
    80007f8e:	ffffe097          	auipc	ra,0xffffe
    80007f92:	ca0080e7          	jalr	-864(ra) # 80005c2e <namecmp>
    80007f96:	87aa                	mv	a5,a0
    80007f98:	14078d63          	beqz	a5,800080f2 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007f9c:	f3c40713          	addi	a4,s0,-196
    80007fa0:	fc040793          	addi	a5,s0,-64
    80007fa4:	863a                	mv	a2,a4
    80007fa6:	85be                	mv	a1,a5
    80007fa8:	fe843503          	ld	a0,-24(s0)
    80007fac:	ffffe097          	auipc	ra,0xffffe
    80007fb0:	cb0080e7          	jalr	-848(ra) # 80005c5c <dirlookup>
    80007fb4:	fea43023          	sd	a0,-32(s0)
    80007fb8:	fe043783          	ld	a5,-32(s0)
    80007fbc:	12078d63          	beqz	a5,800080f6 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007fc0:	fe043503          	ld	a0,-32(s0)
    80007fc4:	ffffd097          	auipc	ra,0xffffd
    80007fc8:	368080e7          	jalr	872(ra) # 8000532c <ilock>

  if(ip->nlink < 1)
    80007fcc:	fe043783          	ld	a5,-32(s0)
    80007fd0:	04a79783          	lh	a5,74(a5)
    80007fd4:	2781                	sext.w	a5,a5
    80007fd6:	00f04a63          	bgtz	a5,80007fea <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007fda:	00003517          	auipc	a0,0x3
    80007fde:	66e50513          	addi	a0,a0,1646 # 8000b648 <etext+0x648>
    80007fe2:	ffff9097          	auipc	ra,0xffff9
    80007fe6:	caa080e7          	jalr	-854(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007fea:	fe043783          	ld	a5,-32(s0)
    80007fee:	04479783          	lh	a5,68(a5)
    80007ff2:	0007871b          	sext.w	a4,a5
    80007ff6:	4785                	li	a5,1
    80007ff8:	02f71163          	bne	a4,a5,8000801a <sys_unlink+0x11a>
    80007ffc:	fe043503          	ld	a0,-32(s0)
    80008000:	00000097          	auipc	ra,0x0
    80008004:	e86080e7          	jalr	-378(ra) # 80007e86 <isdirempty>
    80008008:	87aa                	mv	a5,a0
    8000800a:	eb81                	bnez	a5,8000801a <sys_unlink+0x11a>
    iunlockput(ip);
    8000800c:	fe043503          	ld	a0,-32(s0)
    80008010:	ffffd097          	auipc	ra,0xffffd
    80008014:	57a080e7          	jalr	1402(ra) # 8000558a <iunlockput>
    goto bad;
    80008018:	a0c5                	j	800080f8 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    8000801a:	fd040793          	addi	a5,s0,-48
    8000801e:	4641                	li	a2,16
    80008020:	4581                	li	a1,0
    80008022:	853e                	mv	a0,a5
    80008024:	ffff9097          	auipc	ra,0xffff9
    80008028:	4da080e7          	jalr	1242(ra) # 800014fe <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    8000802c:	fd040793          	addi	a5,s0,-48
    80008030:	f3c42683          	lw	a3,-196(s0)
    80008034:	4741                	li	a4,16
    80008036:	863e                	mv	a2,a5
    80008038:	4581                	li	a1,0
    8000803a:	fe843503          	ld	a0,-24(s0)
    8000803e:	ffffe097          	auipc	ra,0xffffe
    80008042:	a3c080e7          	jalr	-1476(ra) # 80005a7a <writei>
    80008046:	87aa                	mv	a5,a0
    80008048:	873e                	mv	a4,a5
    8000804a:	47c1                	li	a5,16
    8000804c:	00f70a63          	beq	a4,a5,80008060 <sys_unlink+0x160>
    panic("unlink: writei");
    80008050:	00003517          	auipc	a0,0x3
    80008054:	61050513          	addi	a0,a0,1552 # 8000b660 <etext+0x660>
    80008058:	ffff9097          	auipc	ra,0xffff9
    8000805c:	c34080e7          	jalr	-972(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    80008060:	fe043783          	ld	a5,-32(s0)
    80008064:	04479783          	lh	a5,68(a5)
    80008068:	0007871b          	sext.w	a4,a5
    8000806c:	4785                	li	a5,1
    8000806e:	02f71963          	bne	a4,a5,800080a0 <sys_unlink+0x1a0>
    dp->nlink--;
    80008072:	fe843783          	ld	a5,-24(s0)
    80008076:	04a79783          	lh	a5,74(a5)
    8000807a:	17c2                	slli	a5,a5,0x30
    8000807c:	93c1                	srli	a5,a5,0x30
    8000807e:	37fd                	addiw	a5,a5,-1
    80008080:	17c2                	slli	a5,a5,0x30
    80008082:	93c1                	srli	a5,a5,0x30
    80008084:	0107971b          	slliw	a4,a5,0x10
    80008088:	4107571b          	sraiw	a4,a4,0x10
    8000808c:	fe843783          	ld	a5,-24(s0)
    80008090:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008094:	fe843503          	ld	a0,-24(s0)
    80008098:	ffffd097          	auipc	ra,0xffffd
    8000809c:	044080e7          	jalr	68(ra) # 800050dc <iupdate>
  }
  iunlockput(dp);
    800080a0:	fe843503          	ld	a0,-24(s0)
    800080a4:	ffffd097          	auipc	ra,0xffffd
    800080a8:	4e6080e7          	jalr	1254(ra) # 8000558a <iunlockput>

  ip->nlink--;
    800080ac:	fe043783          	ld	a5,-32(s0)
    800080b0:	04a79783          	lh	a5,74(a5)
    800080b4:	17c2                	slli	a5,a5,0x30
    800080b6:	93c1                	srli	a5,a5,0x30
    800080b8:	37fd                	addiw	a5,a5,-1
    800080ba:	17c2                	slli	a5,a5,0x30
    800080bc:	93c1                	srli	a5,a5,0x30
    800080be:	0107971b          	slliw	a4,a5,0x10
    800080c2:	4107571b          	sraiw	a4,a4,0x10
    800080c6:	fe043783          	ld	a5,-32(s0)
    800080ca:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800080ce:	fe043503          	ld	a0,-32(s0)
    800080d2:	ffffd097          	auipc	ra,0xffffd
    800080d6:	00a080e7          	jalr	10(ra) # 800050dc <iupdate>
  iunlockput(ip);
    800080da:	fe043503          	ld	a0,-32(s0)
    800080de:	ffffd097          	auipc	ra,0xffffd
    800080e2:	4ac080e7          	jalr	1196(ra) # 8000558a <iunlockput>

  end_op();
    800080e6:	ffffe097          	auipc	ra,0xffffe
    800080ea:	392080e7          	jalr	914(ra) # 80006478 <end_op>

  return 0;
    800080ee:	4781                	li	a5,0
    800080f0:	a839                	j	8000810e <sys_unlink+0x20e>
    goto bad;
    800080f2:	0001                	nop
    800080f4:	a011                	j	800080f8 <sys_unlink+0x1f8>
    goto bad;
    800080f6:	0001                	nop

bad:
  iunlockput(dp);
    800080f8:	fe843503          	ld	a0,-24(s0)
    800080fc:	ffffd097          	auipc	ra,0xffffd
    80008100:	48e080e7          	jalr	1166(ra) # 8000558a <iunlockput>
  end_op();
    80008104:	ffffe097          	auipc	ra,0xffffe
    80008108:	374080e7          	jalr	884(ra) # 80006478 <end_op>
  return -1;
    8000810c:	57fd                	li	a5,-1
}
    8000810e:	853e                	mv	a0,a5
    80008110:	60ae                	ld	ra,200(sp)
    80008112:	640e                	ld	s0,192(sp)
    80008114:	6169                	addi	sp,sp,208
    80008116:	8082                	ret

0000000080008118 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80008118:	7139                	addi	sp,sp,-64
    8000811a:	fc06                	sd	ra,56(sp)
    8000811c:	f822                	sd	s0,48(sp)
    8000811e:	0080                	addi	s0,sp,64
    80008120:	fca43423          	sd	a0,-56(s0)
    80008124:	87ae                	mv	a5,a1
    80008126:	8736                	mv	a4,a3
    80008128:	fcf41323          	sh	a5,-58(s0)
    8000812c:	87b2                	mv	a5,a2
    8000812e:	fcf41223          	sh	a5,-60(s0)
    80008132:	87ba                	mv	a5,a4
    80008134:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80008138:	fd040793          	addi	a5,s0,-48
    8000813c:	85be                	mv	a1,a5
    8000813e:	fc843503          	ld	a0,-56(s0)
    80008142:	ffffe097          	auipc	ra,0xffffe
    80008146:	f3c080e7          	jalr	-196(ra) # 8000607e <nameiparent>
    8000814a:	fea43423          	sd	a0,-24(s0)
    8000814e:	fe843783          	ld	a5,-24(s0)
    80008152:	e399                	bnez	a5,80008158 <create+0x40>
    return 0;
    80008154:	4781                	li	a5,0
    80008156:	a2ed                	j	80008340 <create+0x228>

  ilock(dp);
    80008158:	fe843503          	ld	a0,-24(s0)
    8000815c:	ffffd097          	auipc	ra,0xffffd
    80008160:	1d0080e7          	jalr	464(ra) # 8000532c <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008164:	fd040793          	addi	a5,s0,-48
    80008168:	4601                	li	a2,0
    8000816a:	85be                	mv	a1,a5
    8000816c:	fe843503          	ld	a0,-24(s0)
    80008170:	ffffe097          	auipc	ra,0xffffe
    80008174:	aec080e7          	jalr	-1300(ra) # 80005c5c <dirlookup>
    80008178:	fea43023          	sd	a0,-32(s0)
    8000817c:	fe043783          	ld	a5,-32(s0)
    80008180:	c3ad                	beqz	a5,800081e2 <create+0xca>
    iunlockput(dp);
    80008182:	fe843503          	ld	a0,-24(s0)
    80008186:	ffffd097          	auipc	ra,0xffffd
    8000818a:	404080e7          	jalr	1028(ra) # 8000558a <iunlockput>
    ilock(ip);
    8000818e:	fe043503          	ld	a0,-32(s0)
    80008192:	ffffd097          	auipc	ra,0xffffd
    80008196:	19a080e7          	jalr	410(ra) # 8000532c <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    8000819a:	fc641783          	lh	a5,-58(s0)
    8000819e:	0007871b          	sext.w	a4,a5
    800081a2:	4789                	li	a5,2
    800081a4:	02f71763          	bne	a4,a5,800081d2 <create+0xba>
    800081a8:	fe043783          	ld	a5,-32(s0)
    800081ac:	04479783          	lh	a5,68(a5)
    800081b0:	0007871b          	sext.w	a4,a5
    800081b4:	4789                	li	a5,2
    800081b6:	00f70b63          	beq	a4,a5,800081cc <create+0xb4>
    800081ba:	fe043783          	ld	a5,-32(s0)
    800081be:	04479783          	lh	a5,68(a5)
    800081c2:	0007871b          	sext.w	a4,a5
    800081c6:	478d                	li	a5,3
    800081c8:	00f71563          	bne	a4,a5,800081d2 <create+0xba>
      return ip;
    800081cc:	fe043783          	ld	a5,-32(s0)
    800081d0:	aa85                	j	80008340 <create+0x228>
    iunlockput(ip);
    800081d2:	fe043503          	ld	a0,-32(s0)
    800081d6:	ffffd097          	auipc	ra,0xffffd
    800081da:	3b4080e7          	jalr	948(ra) # 8000558a <iunlockput>
    return 0;
    800081de:	4781                	li	a5,0
    800081e0:	a285                	j	80008340 <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    800081e2:	fe843783          	ld	a5,-24(s0)
    800081e6:	439c                	lw	a5,0(a5)
    800081e8:	fc641703          	lh	a4,-58(s0)
    800081ec:	85ba                	mv	a1,a4
    800081ee:	853e                	mv	a0,a5
    800081f0:	ffffd097          	auipc	ra,0xffffd
    800081f4:	dee080e7          	jalr	-530(ra) # 80004fde <ialloc>
    800081f8:	fea43023          	sd	a0,-32(s0)
    800081fc:	fe043783          	ld	a5,-32(s0)
    80008200:	eb89                	bnez	a5,80008212 <create+0xfa>
    iunlockput(dp);
    80008202:	fe843503          	ld	a0,-24(s0)
    80008206:	ffffd097          	auipc	ra,0xffffd
    8000820a:	384080e7          	jalr	900(ra) # 8000558a <iunlockput>
    return 0;
    8000820e:	4781                	li	a5,0
    80008210:	aa05                	j	80008340 <create+0x228>
  }

  ilock(ip);
    80008212:	fe043503          	ld	a0,-32(s0)
    80008216:	ffffd097          	auipc	ra,0xffffd
    8000821a:	116080e7          	jalr	278(ra) # 8000532c <ilock>
  ip->major = major;
    8000821e:	fe043783          	ld	a5,-32(s0)
    80008222:	fc445703          	lhu	a4,-60(s0)
    80008226:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    8000822a:	fe043783          	ld	a5,-32(s0)
    8000822e:	fc245703          	lhu	a4,-62(s0)
    80008232:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008236:	fe043783          	ld	a5,-32(s0)
    8000823a:	4705                	li	a4,1
    8000823c:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008240:	fe043503          	ld	a0,-32(s0)
    80008244:	ffffd097          	auipc	ra,0xffffd
    80008248:	e98080e7          	jalr	-360(ra) # 800050dc <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    8000824c:	fc641783          	lh	a5,-58(s0)
    80008250:	0007871b          	sext.w	a4,a5
    80008254:	4785                	li	a5,1
    80008256:	04f71463          	bne	a4,a5,8000829e <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    8000825a:	fe043783          	ld	a5,-32(s0)
    8000825e:	43dc                	lw	a5,4(a5)
    80008260:	863e                	mv	a2,a5
    80008262:	00003597          	auipc	a1,0x3
    80008266:	3d658593          	addi	a1,a1,982 # 8000b638 <etext+0x638>
    8000826a:	fe043503          	ld	a0,-32(s0)
    8000826e:	ffffe097          	auipc	ra,0xffffe
    80008272:	ad6080e7          	jalr	-1322(ra) # 80005d44 <dirlink>
    80008276:	87aa                	mv	a5,a0
    80008278:	0807ca63          	bltz	a5,8000830c <create+0x1f4>
    8000827c:	fe843783          	ld	a5,-24(s0)
    80008280:	43dc                	lw	a5,4(a5)
    80008282:	863e                	mv	a2,a5
    80008284:	00003597          	auipc	a1,0x3
    80008288:	3bc58593          	addi	a1,a1,956 # 8000b640 <etext+0x640>
    8000828c:	fe043503          	ld	a0,-32(s0)
    80008290:	ffffe097          	auipc	ra,0xffffe
    80008294:	ab4080e7          	jalr	-1356(ra) # 80005d44 <dirlink>
    80008298:	87aa                	mv	a5,a0
    8000829a:	0607c963          	bltz	a5,8000830c <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    8000829e:	fe043783          	ld	a5,-32(s0)
    800082a2:	43d8                	lw	a4,4(a5)
    800082a4:	fd040793          	addi	a5,s0,-48
    800082a8:	863a                	mv	a2,a4
    800082aa:	85be                	mv	a1,a5
    800082ac:	fe843503          	ld	a0,-24(s0)
    800082b0:	ffffe097          	auipc	ra,0xffffe
    800082b4:	a94080e7          	jalr	-1388(ra) # 80005d44 <dirlink>
    800082b8:	87aa                	mv	a5,a0
    800082ba:	0407cb63          	bltz	a5,80008310 <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    800082be:	fc641783          	lh	a5,-58(s0)
    800082c2:	0007871b          	sext.w	a4,a5
    800082c6:	4785                	li	a5,1
    800082c8:	02f71963          	bne	a4,a5,800082fa <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    800082cc:	fe843783          	ld	a5,-24(s0)
    800082d0:	04a79783          	lh	a5,74(a5)
    800082d4:	17c2                	slli	a5,a5,0x30
    800082d6:	93c1                	srli	a5,a5,0x30
    800082d8:	2785                	addiw	a5,a5,1
    800082da:	17c2                	slli	a5,a5,0x30
    800082dc:	93c1                	srli	a5,a5,0x30
    800082de:	0107971b          	slliw	a4,a5,0x10
    800082e2:	4107571b          	sraiw	a4,a4,0x10
    800082e6:	fe843783          	ld	a5,-24(s0)
    800082ea:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800082ee:	fe843503          	ld	a0,-24(s0)
    800082f2:	ffffd097          	auipc	ra,0xffffd
    800082f6:	dea080e7          	jalr	-534(ra) # 800050dc <iupdate>
  }

  iunlockput(dp);
    800082fa:	fe843503          	ld	a0,-24(s0)
    800082fe:	ffffd097          	auipc	ra,0xffffd
    80008302:	28c080e7          	jalr	652(ra) # 8000558a <iunlockput>

  return ip;
    80008306:	fe043783          	ld	a5,-32(s0)
    8000830a:	a81d                	j	80008340 <create+0x228>
      goto fail;
    8000830c:	0001                	nop
    8000830e:	a011                	j	80008312 <create+0x1fa>
    goto fail;
    80008310:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    80008312:	fe043783          	ld	a5,-32(s0)
    80008316:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    8000831a:	fe043503          	ld	a0,-32(s0)
    8000831e:	ffffd097          	auipc	ra,0xffffd
    80008322:	dbe080e7          	jalr	-578(ra) # 800050dc <iupdate>
  iunlockput(ip);
    80008326:	fe043503          	ld	a0,-32(s0)
    8000832a:	ffffd097          	auipc	ra,0xffffd
    8000832e:	260080e7          	jalr	608(ra) # 8000558a <iunlockput>
  iunlockput(dp);
    80008332:	fe843503          	ld	a0,-24(s0)
    80008336:	ffffd097          	auipc	ra,0xffffd
    8000833a:	254080e7          	jalr	596(ra) # 8000558a <iunlockput>
  return 0;
    8000833e:	4781                	li	a5,0
}
    80008340:	853e                	mv	a0,a5
    80008342:	70e2                	ld	ra,56(sp)
    80008344:	7442                	ld	s0,48(sp)
    80008346:	6121                	addi	sp,sp,64
    80008348:	8082                	ret

000000008000834a <sys_open>:

uint64
sys_open(void)
{
    8000834a:	7131                	addi	sp,sp,-192
    8000834c:	fd06                	sd	ra,184(sp)
    8000834e:	f922                	sd	s0,176(sp)
    80008350:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    80008352:	f4c40793          	addi	a5,s0,-180
    80008356:	85be                	mv	a1,a5
    80008358:	4505                	li	a0,1
    8000835a:	ffffc097          	auipc	ra,0xffffc
    8000835e:	02a080e7          	jalr	42(ra) # 80004384 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    80008362:	f5040793          	addi	a5,s0,-176
    80008366:	08000613          	li	a2,128
    8000836a:	85be                	mv	a1,a5
    8000836c:	4501                	li	a0,0
    8000836e:	ffffc097          	auipc	ra,0xffffc
    80008372:	07e080e7          	jalr	126(ra) # 800043ec <argstr>
    80008376:	87aa                	mv	a5,a0
    80008378:	fef42223          	sw	a5,-28(s0)
    8000837c:	fe442783          	lw	a5,-28(s0)
    80008380:	2781                	sext.w	a5,a5
    80008382:	0007d463          	bgez	a5,8000838a <sys_open+0x40>
    return -1;
    80008386:	57fd                	li	a5,-1
    80008388:	a429                	j	80008592 <sys_open+0x248>

  begin_op();
    8000838a:	ffffe097          	auipc	ra,0xffffe
    8000838e:	02c080e7          	jalr	44(ra) # 800063b6 <begin_op>

  if(omode & O_CREATE){
    80008392:	f4c42783          	lw	a5,-180(s0)
    80008396:	2007f793          	andi	a5,a5,512
    8000839a:	2781                	sext.w	a5,a5
    8000839c:	c795                	beqz	a5,800083c8 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    8000839e:	f5040793          	addi	a5,s0,-176
    800083a2:	4681                	li	a3,0
    800083a4:	4601                	li	a2,0
    800083a6:	4589                	li	a1,2
    800083a8:	853e                	mv	a0,a5
    800083aa:	00000097          	auipc	ra,0x0
    800083ae:	d6e080e7          	jalr	-658(ra) # 80008118 <create>
    800083b2:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800083b6:	fe843783          	ld	a5,-24(s0)
    800083ba:	e7bd                	bnez	a5,80008428 <sys_open+0xde>
      end_op();
    800083bc:	ffffe097          	auipc	ra,0xffffe
    800083c0:	0bc080e7          	jalr	188(ra) # 80006478 <end_op>
      return -1;
    800083c4:	57fd                	li	a5,-1
    800083c6:	a2f1                	j	80008592 <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    800083c8:	f5040793          	addi	a5,s0,-176
    800083cc:	853e                	mv	a0,a5
    800083ce:	ffffe097          	auipc	ra,0xffffe
    800083d2:	c84080e7          	jalr	-892(ra) # 80006052 <namei>
    800083d6:	fea43423          	sd	a0,-24(s0)
    800083da:	fe843783          	ld	a5,-24(s0)
    800083de:	e799                	bnez	a5,800083ec <sys_open+0xa2>
      end_op();
    800083e0:	ffffe097          	auipc	ra,0xffffe
    800083e4:	098080e7          	jalr	152(ra) # 80006478 <end_op>
      return -1;
    800083e8:	57fd                	li	a5,-1
    800083ea:	a265                	j	80008592 <sys_open+0x248>
    }
    ilock(ip);
    800083ec:	fe843503          	ld	a0,-24(s0)
    800083f0:	ffffd097          	auipc	ra,0xffffd
    800083f4:	f3c080e7          	jalr	-196(ra) # 8000532c <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800083f8:	fe843783          	ld	a5,-24(s0)
    800083fc:	04479783          	lh	a5,68(a5)
    80008400:	0007871b          	sext.w	a4,a5
    80008404:	4785                	li	a5,1
    80008406:	02f71163          	bne	a4,a5,80008428 <sys_open+0xde>
    8000840a:	f4c42783          	lw	a5,-180(s0)
    8000840e:	cf89                	beqz	a5,80008428 <sys_open+0xde>
      iunlockput(ip);
    80008410:	fe843503          	ld	a0,-24(s0)
    80008414:	ffffd097          	auipc	ra,0xffffd
    80008418:	176080e7          	jalr	374(ra) # 8000558a <iunlockput>
      end_op();
    8000841c:	ffffe097          	auipc	ra,0xffffe
    80008420:	05c080e7          	jalr	92(ra) # 80006478 <end_op>
      return -1;
    80008424:	57fd                	li	a5,-1
    80008426:	a2b5                	j	80008592 <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    80008428:	fe843783          	ld	a5,-24(s0)
    8000842c:	04479783          	lh	a5,68(a5)
    80008430:	0007871b          	sext.w	a4,a5
    80008434:	478d                	li	a5,3
    80008436:	02f71e63          	bne	a4,a5,80008472 <sys_open+0x128>
    8000843a:	fe843783          	ld	a5,-24(s0)
    8000843e:	04679783          	lh	a5,70(a5)
    80008442:	2781                	sext.w	a5,a5
    80008444:	0007cb63          	bltz	a5,8000845a <sys_open+0x110>
    80008448:	fe843783          	ld	a5,-24(s0)
    8000844c:	04679783          	lh	a5,70(a5)
    80008450:	0007871b          	sext.w	a4,a5
    80008454:	47a5                	li	a5,9
    80008456:	00e7de63          	bge	a5,a4,80008472 <sys_open+0x128>
    iunlockput(ip);
    8000845a:	fe843503          	ld	a0,-24(s0)
    8000845e:	ffffd097          	auipc	ra,0xffffd
    80008462:	12c080e7          	jalr	300(ra) # 8000558a <iunlockput>
    end_op();
    80008466:	ffffe097          	auipc	ra,0xffffe
    8000846a:	012080e7          	jalr	18(ra) # 80006478 <end_op>
    return -1;
    8000846e:	57fd                	li	a5,-1
    80008470:	a20d                	j	80008592 <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008472:	ffffe097          	auipc	ra,0xffffe
    80008476:	4f4080e7          	jalr	1268(ra) # 80006966 <filealloc>
    8000847a:	fca43c23          	sd	a0,-40(s0)
    8000847e:	fd843783          	ld	a5,-40(s0)
    80008482:	cf99                	beqz	a5,800084a0 <sys_open+0x156>
    80008484:	fd843503          	ld	a0,-40(s0)
    80008488:	fffff097          	auipc	ra,0xfffff
    8000848c:	5e8080e7          	jalr	1512(ra) # 80007a70 <fdalloc>
    80008490:	87aa                	mv	a5,a0
    80008492:	fcf42a23          	sw	a5,-44(s0)
    80008496:	fd442783          	lw	a5,-44(s0)
    8000849a:	2781                	sext.w	a5,a5
    8000849c:	0207d763          	bgez	a5,800084ca <sys_open+0x180>
    if(f)
    800084a0:	fd843783          	ld	a5,-40(s0)
    800084a4:	c799                	beqz	a5,800084b2 <sys_open+0x168>
      fileclose(f);
    800084a6:	fd843503          	ld	a0,-40(s0)
    800084aa:	ffffe097          	auipc	ra,0xffffe
    800084ae:	5a6080e7          	jalr	1446(ra) # 80006a50 <fileclose>
    iunlockput(ip);
    800084b2:	fe843503          	ld	a0,-24(s0)
    800084b6:	ffffd097          	auipc	ra,0xffffd
    800084ba:	0d4080e7          	jalr	212(ra) # 8000558a <iunlockput>
    end_op();
    800084be:	ffffe097          	auipc	ra,0xffffe
    800084c2:	fba080e7          	jalr	-70(ra) # 80006478 <end_op>
    return -1;
    800084c6:	57fd                	li	a5,-1
    800084c8:	a0e9                	j	80008592 <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    800084ca:	fe843783          	ld	a5,-24(s0)
    800084ce:	04479783          	lh	a5,68(a5)
    800084d2:	0007871b          	sext.w	a4,a5
    800084d6:	478d                	li	a5,3
    800084d8:	00f71f63          	bne	a4,a5,800084f6 <sys_open+0x1ac>
    f->type = FD_DEVICE;
    800084dc:	fd843783          	ld	a5,-40(s0)
    800084e0:	470d                	li	a4,3
    800084e2:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800084e4:	fe843783          	ld	a5,-24(s0)
    800084e8:	04679703          	lh	a4,70(a5)
    800084ec:	fd843783          	ld	a5,-40(s0)
    800084f0:	02e79223          	sh	a4,36(a5)
    800084f4:	a809                	j	80008506 <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    800084f6:	fd843783          	ld	a5,-40(s0)
    800084fa:	4709                	li	a4,2
    800084fc:	c398                	sw	a4,0(a5)
    f->off = 0;
    800084fe:	fd843783          	ld	a5,-40(s0)
    80008502:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    80008506:	fd843783          	ld	a5,-40(s0)
    8000850a:	fe843703          	ld	a4,-24(s0)
    8000850e:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    80008510:	f4c42783          	lw	a5,-180(s0)
    80008514:	8b85                	andi	a5,a5,1
    80008516:	2781                	sext.w	a5,a5
    80008518:	0017b793          	seqz	a5,a5
    8000851c:	0ff7f793          	andi	a5,a5,255
    80008520:	873e                	mv	a4,a5
    80008522:	fd843783          	ld	a5,-40(s0)
    80008526:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    8000852a:	f4c42783          	lw	a5,-180(s0)
    8000852e:	8b85                	andi	a5,a5,1
    80008530:	2781                	sext.w	a5,a5
    80008532:	e791                	bnez	a5,8000853e <sys_open+0x1f4>
    80008534:	f4c42783          	lw	a5,-180(s0)
    80008538:	8b89                	andi	a5,a5,2
    8000853a:	2781                	sext.w	a5,a5
    8000853c:	c399                	beqz	a5,80008542 <sys_open+0x1f8>
    8000853e:	4785                	li	a5,1
    80008540:	a011                	j	80008544 <sys_open+0x1fa>
    80008542:	4781                	li	a5,0
    80008544:	0ff7f713          	andi	a4,a5,255
    80008548:	fd843783          	ld	a5,-40(s0)
    8000854c:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008550:	f4c42783          	lw	a5,-180(s0)
    80008554:	4007f793          	andi	a5,a5,1024
    80008558:	2781                	sext.w	a5,a5
    8000855a:	c385                	beqz	a5,8000857a <sys_open+0x230>
    8000855c:	fe843783          	ld	a5,-24(s0)
    80008560:	04479783          	lh	a5,68(a5)
    80008564:	0007871b          	sext.w	a4,a5
    80008568:	4789                	li	a5,2
    8000856a:	00f71863          	bne	a4,a5,8000857a <sys_open+0x230>
    itrunc(ip);
    8000856e:	fe843503          	ld	a0,-24(s0)
    80008572:	ffffd097          	auipc	ra,0xffffd
    80008576:	1c2080e7          	jalr	450(ra) # 80005734 <itrunc>
  }

  iunlock(ip);
    8000857a:	fe843503          	ld	a0,-24(s0)
    8000857e:	ffffd097          	auipc	ra,0xffffd
    80008582:	ee2080e7          	jalr	-286(ra) # 80005460 <iunlock>
  end_op();
    80008586:	ffffe097          	auipc	ra,0xffffe
    8000858a:	ef2080e7          	jalr	-270(ra) # 80006478 <end_op>

  return fd;
    8000858e:	fd442783          	lw	a5,-44(s0)
}
    80008592:	853e                	mv	a0,a5
    80008594:	70ea                	ld	ra,184(sp)
    80008596:	744a                	ld	s0,176(sp)
    80008598:	6129                	addi	sp,sp,192
    8000859a:	8082                	ret

000000008000859c <sys_mkdir>:

uint64
sys_mkdir(void)
{
    8000859c:	7135                	addi	sp,sp,-160
    8000859e:	ed06                	sd	ra,152(sp)
    800085a0:	e922                	sd	s0,144(sp)
    800085a2:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800085a4:	ffffe097          	auipc	ra,0xffffe
    800085a8:	e12080e7          	jalr	-494(ra) # 800063b6 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800085ac:	f6840793          	addi	a5,s0,-152
    800085b0:	08000613          	li	a2,128
    800085b4:	85be                	mv	a1,a5
    800085b6:	4501                	li	a0,0
    800085b8:	ffffc097          	auipc	ra,0xffffc
    800085bc:	e34080e7          	jalr	-460(ra) # 800043ec <argstr>
    800085c0:	87aa                	mv	a5,a0
    800085c2:	0207c163          	bltz	a5,800085e4 <sys_mkdir+0x48>
    800085c6:	f6840793          	addi	a5,s0,-152
    800085ca:	4681                	li	a3,0
    800085cc:	4601                	li	a2,0
    800085ce:	4585                	li	a1,1
    800085d0:	853e                	mv	a0,a5
    800085d2:	00000097          	auipc	ra,0x0
    800085d6:	b46080e7          	jalr	-1210(ra) # 80008118 <create>
    800085da:	fea43423          	sd	a0,-24(s0)
    800085de:	fe843783          	ld	a5,-24(s0)
    800085e2:	e799                	bnez	a5,800085f0 <sys_mkdir+0x54>
    end_op();
    800085e4:	ffffe097          	auipc	ra,0xffffe
    800085e8:	e94080e7          	jalr	-364(ra) # 80006478 <end_op>
    return -1;
    800085ec:	57fd                	li	a5,-1
    800085ee:	a821                	j	80008606 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800085f0:	fe843503          	ld	a0,-24(s0)
    800085f4:	ffffd097          	auipc	ra,0xffffd
    800085f8:	f96080e7          	jalr	-106(ra) # 8000558a <iunlockput>
  end_op();
    800085fc:	ffffe097          	auipc	ra,0xffffe
    80008600:	e7c080e7          	jalr	-388(ra) # 80006478 <end_op>
  return 0;
    80008604:	4781                	li	a5,0
}
    80008606:	853e                	mv	a0,a5
    80008608:	60ea                	ld	ra,152(sp)
    8000860a:	644a                	ld	s0,144(sp)
    8000860c:	610d                	addi	sp,sp,160
    8000860e:	8082                	ret

0000000080008610 <sys_mknod>:

uint64
sys_mknod(void)
{
    80008610:	7135                	addi	sp,sp,-160
    80008612:	ed06                	sd	ra,152(sp)
    80008614:	e922                	sd	s0,144(sp)
    80008616:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008618:	ffffe097          	auipc	ra,0xffffe
    8000861c:	d9e080e7          	jalr	-610(ra) # 800063b6 <begin_op>
  argint(1, &major);
    80008620:	f6440793          	addi	a5,s0,-156
    80008624:	85be                	mv	a1,a5
    80008626:	4505                	li	a0,1
    80008628:	ffffc097          	auipc	ra,0xffffc
    8000862c:	d5c080e7          	jalr	-676(ra) # 80004384 <argint>
  argint(2, &minor);
    80008630:	f6040793          	addi	a5,s0,-160
    80008634:	85be                	mv	a1,a5
    80008636:	4509                	li	a0,2
    80008638:	ffffc097          	auipc	ra,0xffffc
    8000863c:	d4c080e7          	jalr	-692(ra) # 80004384 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008640:	f6840793          	addi	a5,s0,-152
    80008644:	08000613          	li	a2,128
    80008648:	85be                	mv	a1,a5
    8000864a:	4501                	li	a0,0
    8000864c:	ffffc097          	auipc	ra,0xffffc
    80008650:	da0080e7          	jalr	-608(ra) # 800043ec <argstr>
    80008654:	87aa                	mv	a5,a0
    80008656:	0207cc63          	bltz	a5,8000868e <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    8000865a:	f6442783          	lw	a5,-156(s0)
    8000865e:	0107971b          	slliw	a4,a5,0x10
    80008662:	4107571b          	sraiw	a4,a4,0x10
    80008666:	f6042783          	lw	a5,-160(s0)
    8000866a:	0107969b          	slliw	a3,a5,0x10
    8000866e:	4106d69b          	sraiw	a3,a3,0x10
    80008672:	f6840793          	addi	a5,s0,-152
    80008676:	863a                	mv	a2,a4
    80008678:	458d                	li	a1,3
    8000867a:	853e                	mv	a0,a5
    8000867c:	00000097          	auipc	ra,0x0
    80008680:	a9c080e7          	jalr	-1380(ra) # 80008118 <create>
    80008684:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008688:	fe843783          	ld	a5,-24(s0)
    8000868c:	e799                	bnez	a5,8000869a <sys_mknod+0x8a>
    end_op();
    8000868e:	ffffe097          	auipc	ra,0xffffe
    80008692:	dea080e7          	jalr	-534(ra) # 80006478 <end_op>
    return -1;
    80008696:	57fd                	li	a5,-1
    80008698:	a821                	j	800086b0 <sys_mknod+0xa0>
  }
  iunlockput(ip);
    8000869a:	fe843503          	ld	a0,-24(s0)
    8000869e:	ffffd097          	auipc	ra,0xffffd
    800086a2:	eec080e7          	jalr	-276(ra) # 8000558a <iunlockput>
  end_op();
    800086a6:	ffffe097          	auipc	ra,0xffffe
    800086aa:	dd2080e7          	jalr	-558(ra) # 80006478 <end_op>
  return 0;
    800086ae:	4781                	li	a5,0
}
    800086b0:	853e                	mv	a0,a5
    800086b2:	60ea                	ld	ra,152(sp)
    800086b4:	644a                	ld	s0,144(sp)
    800086b6:	610d                	addi	sp,sp,160
    800086b8:	8082                	ret

00000000800086ba <sys_chdir>:

uint64
sys_chdir(void)
{
    800086ba:	7135                	addi	sp,sp,-160
    800086bc:	ed06                	sd	ra,152(sp)
    800086be:	e922                	sd	s0,144(sp)
    800086c0:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800086c2:	ffffa097          	auipc	ra,0xffffa
    800086c6:	404080e7          	jalr	1028(ra) # 80002ac6 <myproc>
    800086ca:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800086ce:	ffffe097          	auipc	ra,0xffffe
    800086d2:	ce8080e7          	jalr	-792(ra) # 800063b6 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800086d6:	f6040793          	addi	a5,s0,-160
    800086da:	08000613          	li	a2,128
    800086de:	85be                	mv	a1,a5
    800086e0:	4501                	li	a0,0
    800086e2:	ffffc097          	auipc	ra,0xffffc
    800086e6:	d0a080e7          	jalr	-758(ra) # 800043ec <argstr>
    800086ea:	87aa                	mv	a5,a0
    800086ec:	0007ce63          	bltz	a5,80008708 <sys_chdir+0x4e>
    800086f0:	f6040793          	addi	a5,s0,-160
    800086f4:	853e                	mv	a0,a5
    800086f6:	ffffe097          	auipc	ra,0xffffe
    800086fa:	95c080e7          	jalr	-1700(ra) # 80006052 <namei>
    800086fe:	fea43023          	sd	a0,-32(s0)
    80008702:	fe043783          	ld	a5,-32(s0)
    80008706:	e799                	bnez	a5,80008714 <sys_chdir+0x5a>
    end_op();
    80008708:	ffffe097          	auipc	ra,0xffffe
    8000870c:	d70080e7          	jalr	-656(ra) # 80006478 <end_op>
    return -1;
    80008710:	57fd                	li	a5,-1
    80008712:	a0b5                	j	8000877e <sys_chdir+0xc4>
  }
  ilock(ip);
    80008714:	fe043503          	ld	a0,-32(s0)
    80008718:	ffffd097          	auipc	ra,0xffffd
    8000871c:	c14080e7          	jalr	-1004(ra) # 8000532c <ilock>
  if(ip->type != T_DIR){
    80008720:	fe043783          	ld	a5,-32(s0)
    80008724:	04479783          	lh	a5,68(a5)
    80008728:	0007871b          	sext.w	a4,a5
    8000872c:	4785                	li	a5,1
    8000872e:	00f70e63          	beq	a4,a5,8000874a <sys_chdir+0x90>
    iunlockput(ip);
    80008732:	fe043503          	ld	a0,-32(s0)
    80008736:	ffffd097          	auipc	ra,0xffffd
    8000873a:	e54080e7          	jalr	-428(ra) # 8000558a <iunlockput>
    end_op();
    8000873e:	ffffe097          	auipc	ra,0xffffe
    80008742:	d3a080e7          	jalr	-710(ra) # 80006478 <end_op>
    return -1;
    80008746:	57fd                	li	a5,-1
    80008748:	a81d                	j	8000877e <sys_chdir+0xc4>
  }
  iunlock(ip);
    8000874a:	fe043503          	ld	a0,-32(s0)
    8000874e:	ffffd097          	auipc	ra,0xffffd
    80008752:	d12080e7          	jalr	-750(ra) # 80005460 <iunlock>
  iput(p->cwd);
    80008756:	fe843783          	ld	a5,-24(s0)
    8000875a:	1507b783          	ld	a5,336(a5)
    8000875e:	853e                	mv	a0,a5
    80008760:	ffffd097          	auipc	ra,0xffffd
    80008764:	d5a080e7          	jalr	-678(ra) # 800054ba <iput>
  end_op();
    80008768:	ffffe097          	auipc	ra,0xffffe
    8000876c:	d10080e7          	jalr	-752(ra) # 80006478 <end_op>
  p->cwd = ip;
    80008770:	fe843783          	ld	a5,-24(s0)
    80008774:	fe043703          	ld	a4,-32(s0)
    80008778:	14e7b823          	sd	a4,336(a5)
  return 0;
    8000877c:	4781                	li	a5,0
}
    8000877e:	853e                	mv	a0,a5
    80008780:	60ea                	ld	ra,152(sp)
    80008782:	644a                	ld	s0,144(sp)
    80008784:	610d                	addi	sp,sp,160
    80008786:	8082                	ret

0000000080008788 <sys_exec>:

uint64
sys_exec(void)
{
    80008788:	7161                	addi	sp,sp,-432
    8000878a:	f706                	sd	ra,424(sp)
    8000878c:	f322                	sd	s0,416(sp)
    8000878e:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    80008790:	e6040793          	addi	a5,s0,-416
    80008794:	85be                	mv	a1,a5
    80008796:	4505                	li	a0,1
    80008798:	ffffc097          	auipc	ra,0xffffc
    8000879c:	c22080e7          	jalr	-990(ra) # 800043ba <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    800087a0:	f6840793          	addi	a5,s0,-152
    800087a4:	08000613          	li	a2,128
    800087a8:	85be                	mv	a1,a5
    800087aa:	4501                	li	a0,0
    800087ac:	ffffc097          	auipc	ra,0xffffc
    800087b0:	c40080e7          	jalr	-960(ra) # 800043ec <argstr>
    800087b4:	87aa                	mv	a5,a0
    800087b6:	0007d463          	bgez	a5,800087be <sys_exec+0x36>
    return -1;
    800087ba:	57fd                	li	a5,-1
    800087bc:	a249                	j	8000893e <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    800087be:	e6840793          	addi	a5,s0,-408
    800087c2:	10000613          	li	a2,256
    800087c6:	4581                	li	a1,0
    800087c8:	853e                	mv	a0,a5
    800087ca:	ffff9097          	auipc	ra,0xffff9
    800087ce:	d34080e7          	jalr	-716(ra) # 800014fe <memset>
  for(i=0;; i++){
    800087d2:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800087d6:	fec42783          	lw	a5,-20(s0)
    800087da:	873e                	mv	a4,a5
    800087dc:	47fd                	li	a5,31
    800087de:	10e7e463          	bltu	a5,a4,800088e6 <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800087e2:	fec42783          	lw	a5,-20(s0)
    800087e6:	00379713          	slli	a4,a5,0x3
    800087ea:	e6043783          	ld	a5,-416(s0)
    800087ee:	97ba                	add	a5,a5,a4
    800087f0:	e5840713          	addi	a4,s0,-424
    800087f4:	85ba                	mv	a1,a4
    800087f6:	853e                	mv	a0,a5
    800087f8:	ffffc097          	auipc	ra,0xffffc
    800087fc:	a1a080e7          	jalr	-1510(ra) # 80004212 <fetchaddr>
    80008800:	87aa                	mv	a5,a0
    80008802:	0e07c463          	bltz	a5,800088ea <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    80008806:	e5843783          	ld	a5,-424(s0)
    8000880a:	eb95                	bnez	a5,8000883e <sys_exec+0xb6>
      argv[i] = 0;
    8000880c:	fec42783          	lw	a5,-20(s0)
    80008810:	078e                	slli	a5,a5,0x3
    80008812:	ff040713          	addi	a4,s0,-16
    80008816:	97ba                	add	a5,a5,a4
    80008818:	e607bc23          	sd	zero,-392(a5)
      break;
    8000881c:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    8000881e:	e6840713          	addi	a4,s0,-408
    80008822:	f6840793          	addi	a5,s0,-152
    80008826:	85ba                	mv	a1,a4
    80008828:	853e                	mv	a0,a5
    8000882a:	fffff097          	auipc	ra,0xfffff
    8000882e:	c1e080e7          	jalr	-994(ra) # 80007448 <exec>
    80008832:	87aa                	mv	a5,a0
    80008834:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008838:	fe042623          	sw	zero,-20(s0)
    8000883c:	a059                	j	800088c2 <sys_exec+0x13a>
    argv[i] = kalloc();
    8000883e:	ffff9097          	auipc	ra,0xffff9
    80008842:	998080e7          	jalr	-1640(ra) # 800011d6 <kalloc>
    80008846:	872a                	mv	a4,a0
    80008848:	fec42783          	lw	a5,-20(s0)
    8000884c:	078e                	slli	a5,a5,0x3
    8000884e:	ff040693          	addi	a3,s0,-16
    80008852:	97b6                	add	a5,a5,a3
    80008854:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008858:	fec42783          	lw	a5,-20(s0)
    8000885c:	078e                	slli	a5,a5,0x3
    8000885e:	ff040713          	addi	a4,s0,-16
    80008862:	97ba                	add	a5,a5,a4
    80008864:	e787b783          	ld	a5,-392(a5)
    80008868:	c3d9                	beqz	a5,800088ee <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8000886a:	e5843703          	ld	a4,-424(s0)
    8000886e:	fec42783          	lw	a5,-20(s0)
    80008872:	078e                	slli	a5,a5,0x3
    80008874:	ff040693          	addi	a3,s0,-16
    80008878:	97b6                	add	a5,a5,a3
    8000887a:	e787b783          	ld	a5,-392(a5)
    8000887e:	6605                	lui	a2,0x1
    80008880:	85be                	mv	a1,a5
    80008882:	853a                	mv	a0,a4
    80008884:	ffffc097          	auipc	ra,0xffffc
    80008888:	9fc080e7          	jalr	-1540(ra) # 80004280 <fetchstr>
    8000888c:	87aa                	mv	a5,a0
    8000888e:	0607c263          	bltz	a5,800088f2 <sys_exec+0x16a>
  for(i=0;; i++){
    80008892:	fec42783          	lw	a5,-20(s0)
    80008896:	2785                	addiw	a5,a5,1
    80008898:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    8000889c:	bf2d                	j	800087d6 <sys_exec+0x4e>
    kfree(argv[i]);
    8000889e:	fec42783          	lw	a5,-20(s0)
    800088a2:	078e                	slli	a5,a5,0x3
    800088a4:	ff040713          	addi	a4,s0,-16
    800088a8:	97ba                	add	a5,a5,a4
    800088aa:	e787b783          	ld	a5,-392(a5)
    800088ae:	853e                	mv	a0,a5
    800088b0:	ffff9097          	auipc	ra,0xffff9
    800088b4:	880080e7          	jalr	-1920(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088b8:	fec42783          	lw	a5,-20(s0)
    800088bc:	2785                	addiw	a5,a5,1
    800088be:	fef42623          	sw	a5,-20(s0)
    800088c2:	fec42783          	lw	a5,-20(s0)
    800088c6:	873e                	mv	a4,a5
    800088c8:	47fd                	li	a5,31
    800088ca:	00e7eb63          	bltu	a5,a4,800088e0 <sys_exec+0x158>
    800088ce:	fec42783          	lw	a5,-20(s0)
    800088d2:	078e                	slli	a5,a5,0x3
    800088d4:	ff040713          	addi	a4,s0,-16
    800088d8:	97ba                	add	a5,a5,a4
    800088da:	e787b783          	ld	a5,-392(a5)
    800088de:	f3e1                	bnez	a5,8000889e <sys_exec+0x116>

  return ret;
    800088e0:	fe842783          	lw	a5,-24(s0)
    800088e4:	a8a9                	j	8000893e <sys_exec+0x1b6>
      goto bad;
    800088e6:	0001                	nop
    800088e8:	a031                	j	800088f4 <sys_exec+0x16c>
      goto bad;
    800088ea:	0001                	nop
    800088ec:	a021                	j	800088f4 <sys_exec+0x16c>
      goto bad;
    800088ee:	0001                	nop
    800088f0:	a011                	j	800088f4 <sys_exec+0x16c>
      goto bad;
    800088f2:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088f4:	fe042623          	sw	zero,-20(s0)
    800088f8:	a01d                	j	8000891e <sys_exec+0x196>
    kfree(argv[i]);
    800088fa:	fec42783          	lw	a5,-20(s0)
    800088fe:	078e                	slli	a5,a5,0x3
    80008900:	ff040713          	addi	a4,s0,-16
    80008904:	97ba                	add	a5,a5,a4
    80008906:	e787b783          	ld	a5,-392(a5)
    8000890a:	853e                	mv	a0,a5
    8000890c:	ffff9097          	auipc	ra,0xffff9
    80008910:	824080e7          	jalr	-2012(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008914:	fec42783          	lw	a5,-20(s0)
    80008918:	2785                	addiw	a5,a5,1
    8000891a:	fef42623          	sw	a5,-20(s0)
    8000891e:	fec42783          	lw	a5,-20(s0)
    80008922:	873e                	mv	a4,a5
    80008924:	47fd                	li	a5,31
    80008926:	00e7eb63          	bltu	a5,a4,8000893c <sys_exec+0x1b4>
    8000892a:	fec42783          	lw	a5,-20(s0)
    8000892e:	078e                	slli	a5,a5,0x3
    80008930:	ff040713          	addi	a4,s0,-16
    80008934:	97ba                	add	a5,a5,a4
    80008936:	e787b783          	ld	a5,-392(a5)
    8000893a:	f3e1                	bnez	a5,800088fa <sys_exec+0x172>
  return -1;
    8000893c:	57fd                	li	a5,-1
}
    8000893e:	853e                	mv	a0,a5
    80008940:	70ba                	ld	ra,424(sp)
    80008942:	741a                	ld	s0,416(sp)
    80008944:	615d                	addi	sp,sp,432
    80008946:	8082                	ret

0000000080008948 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008948:	7139                	addi	sp,sp,-64
    8000894a:	fc06                	sd	ra,56(sp)
    8000894c:	f822                	sd	s0,48(sp)
    8000894e:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008950:	ffffa097          	auipc	ra,0xffffa
    80008954:	176080e7          	jalr	374(ra) # 80002ac6 <myproc>
    80008958:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    8000895c:	fe040793          	addi	a5,s0,-32
    80008960:	85be                	mv	a1,a5
    80008962:	4501                	li	a0,0
    80008964:	ffffc097          	auipc	ra,0xffffc
    80008968:	a56080e7          	jalr	-1450(ra) # 800043ba <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    8000896c:	fd040713          	addi	a4,s0,-48
    80008970:	fd840793          	addi	a5,s0,-40
    80008974:	85ba                	mv	a1,a4
    80008976:	853e                	mv	a0,a5
    80008978:	ffffe097          	auipc	ra,0xffffe
    8000897c:	5ee080e7          	jalr	1518(ra) # 80006f66 <pipealloc>
    80008980:	87aa                	mv	a5,a0
    80008982:	0007d463          	bgez	a5,8000898a <sys_pipe+0x42>
    return -1;
    80008986:	57fd                	li	a5,-1
    80008988:	a219                	j	80008a8e <sys_pipe+0x146>
  fd0 = -1;
    8000898a:	57fd                	li	a5,-1
    8000898c:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008990:	fd843783          	ld	a5,-40(s0)
    80008994:	853e                	mv	a0,a5
    80008996:	fffff097          	auipc	ra,0xfffff
    8000899a:	0da080e7          	jalr	218(ra) # 80007a70 <fdalloc>
    8000899e:	87aa                	mv	a5,a0
    800089a0:	fcf42623          	sw	a5,-52(s0)
    800089a4:	fcc42783          	lw	a5,-52(s0)
    800089a8:	0207c063          	bltz	a5,800089c8 <sys_pipe+0x80>
    800089ac:	fd043783          	ld	a5,-48(s0)
    800089b0:	853e                	mv	a0,a5
    800089b2:	fffff097          	auipc	ra,0xfffff
    800089b6:	0be080e7          	jalr	190(ra) # 80007a70 <fdalloc>
    800089ba:	87aa                	mv	a5,a0
    800089bc:	fcf42423          	sw	a5,-56(s0)
    800089c0:	fc842783          	lw	a5,-56(s0)
    800089c4:	0207df63          	bgez	a5,80008a02 <sys_pipe+0xba>
    if(fd0 >= 0)
    800089c8:	fcc42783          	lw	a5,-52(s0)
    800089cc:	0007cb63          	bltz	a5,800089e2 <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    800089d0:	fcc42783          	lw	a5,-52(s0)
    800089d4:	fe843703          	ld	a4,-24(s0)
    800089d8:	07e9                	addi	a5,a5,26
    800089da:	078e                	slli	a5,a5,0x3
    800089dc:	97ba                	add	a5,a5,a4
    800089de:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800089e2:	fd843783          	ld	a5,-40(s0)
    800089e6:	853e                	mv	a0,a5
    800089e8:	ffffe097          	auipc	ra,0xffffe
    800089ec:	068080e7          	jalr	104(ra) # 80006a50 <fileclose>
    fileclose(wf);
    800089f0:	fd043783          	ld	a5,-48(s0)
    800089f4:	853e                	mv	a0,a5
    800089f6:	ffffe097          	auipc	ra,0xffffe
    800089fa:	05a080e7          	jalr	90(ra) # 80006a50 <fileclose>
    return -1;
    800089fe:	57fd                	li	a5,-1
    80008a00:	a079                	j	80008a8e <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008a02:	fe843783          	ld	a5,-24(s0)
    80008a06:	6bbc                	ld	a5,80(a5)
    80008a08:	fe043703          	ld	a4,-32(s0)
    80008a0c:	fcc40613          	addi	a2,s0,-52
    80008a10:	4691                	li	a3,4
    80008a12:	85ba                	mv	a1,a4
    80008a14:	853e                	mv	a0,a5
    80008a16:	ffffa097          	auipc	ra,0xffffa
    80008a1a:	b7a080e7          	jalr	-1158(ra) # 80002590 <copyout>
    80008a1e:	87aa                	mv	a5,a0
    80008a20:	0207c463          	bltz	a5,80008a48 <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008a24:	fe843783          	ld	a5,-24(s0)
    80008a28:	6bb8                	ld	a4,80(a5)
    80008a2a:	fe043783          	ld	a5,-32(s0)
    80008a2e:	0791                	addi	a5,a5,4
    80008a30:	fc840613          	addi	a2,s0,-56
    80008a34:	4691                	li	a3,4
    80008a36:	85be                	mv	a1,a5
    80008a38:	853a                	mv	a0,a4
    80008a3a:	ffffa097          	auipc	ra,0xffffa
    80008a3e:	b56080e7          	jalr	-1194(ra) # 80002590 <copyout>
    80008a42:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008a44:	0407d463          	bgez	a5,80008a8c <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008a48:	fcc42783          	lw	a5,-52(s0)
    80008a4c:	fe843703          	ld	a4,-24(s0)
    80008a50:	07e9                	addi	a5,a5,26
    80008a52:	078e                	slli	a5,a5,0x3
    80008a54:	97ba                	add	a5,a5,a4
    80008a56:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008a5a:	fc842783          	lw	a5,-56(s0)
    80008a5e:	fe843703          	ld	a4,-24(s0)
    80008a62:	07e9                	addi	a5,a5,26
    80008a64:	078e                	slli	a5,a5,0x3
    80008a66:	97ba                	add	a5,a5,a4
    80008a68:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a6c:	fd843783          	ld	a5,-40(s0)
    80008a70:	853e                	mv	a0,a5
    80008a72:	ffffe097          	auipc	ra,0xffffe
    80008a76:	fde080e7          	jalr	-34(ra) # 80006a50 <fileclose>
    fileclose(wf);
    80008a7a:	fd043783          	ld	a5,-48(s0)
    80008a7e:	853e                	mv	a0,a5
    80008a80:	ffffe097          	auipc	ra,0xffffe
    80008a84:	fd0080e7          	jalr	-48(ra) # 80006a50 <fileclose>
    return -1;
    80008a88:	57fd                	li	a5,-1
    80008a8a:	a011                	j	80008a8e <sys_pipe+0x146>
  }
  return 0;
    80008a8c:	4781                	li	a5,0
}
    80008a8e:	853e                	mv	a0,a5
    80008a90:	70e2                	ld	ra,56(sp)
    80008a92:	7442                	ld	s0,48(sp)
    80008a94:	6121                	addi	sp,sp,64
    80008a96:	8082                	ret
	...

0000000080008aa0 <kernelvec>:
    80008aa0:	7111                	addi	sp,sp,-256
    80008aa2:	e006                	sd	ra,0(sp)
    80008aa4:	e40a                	sd	sp,8(sp)
    80008aa6:	e80e                	sd	gp,16(sp)
    80008aa8:	ec12                	sd	tp,24(sp)
    80008aaa:	f016                	sd	t0,32(sp)
    80008aac:	f41a                	sd	t1,40(sp)
    80008aae:	f81e                	sd	t2,48(sp)
    80008ab0:	fc22                	sd	s0,56(sp)
    80008ab2:	e0a6                	sd	s1,64(sp)
    80008ab4:	e4aa                	sd	a0,72(sp)
    80008ab6:	e8ae                	sd	a1,80(sp)
    80008ab8:	ecb2                	sd	a2,88(sp)
    80008aba:	f0b6                	sd	a3,96(sp)
    80008abc:	f4ba                	sd	a4,104(sp)
    80008abe:	f8be                	sd	a5,112(sp)
    80008ac0:	fcc2                	sd	a6,120(sp)
    80008ac2:	e146                	sd	a7,128(sp)
    80008ac4:	e54a                	sd	s2,136(sp)
    80008ac6:	e94e                	sd	s3,144(sp)
    80008ac8:	ed52                	sd	s4,152(sp)
    80008aca:	f156                	sd	s5,160(sp)
    80008acc:	f55a                	sd	s6,168(sp)
    80008ace:	f95e                	sd	s7,176(sp)
    80008ad0:	fd62                	sd	s8,184(sp)
    80008ad2:	e1e6                	sd	s9,192(sp)
    80008ad4:	e5ea                	sd	s10,200(sp)
    80008ad6:	e9ee                	sd	s11,208(sp)
    80008ad8:	edf2                	sd	t3,216(sp)
    80008ada:	f1f6                	sd	t4,224(sp)
    80008adc:	f5fa                	sd	t5,232(sp)
    80008ade:	f9fe                	sd	t6,240(sp)
    80008ae0:	c8efb0ef          	jal	ra,80003f6e <kerneltrap>
    80008ae4:	6082                	ld	ra,0(sp)
    80008ae6:	6122                	ld	sp,8(sp)
    80008ae8:	61c2                	ld	gp,16(sp)
    80008aea:	7282                	ld	t0,32(sp)
    80008aec:	7322                	ld	t1,40(sp)
    80008aee:	73c2                	ld	t2,48(sp)
    80008af0:	7462                	ld	s0,56(sp)
    80008af2:	6486                	ld	s1,64(sp)
    80008af4:	6526                	ld	a0,72(sp)
    80008af6:	65c6                	ld	a1,80(sp)
    80008af8:	6666                	ld	a2,88(sp)
    80008afa:	7686                	ld	a3,96(sp)
    80008afc:	7726                	ld	a4,104(sp)
    80008afe:	77c6                	ld	a5,112(sp)
    80008b00:	7866                	ld	a6,120(sp)
    80008b02:	688a                	ld	a7,128(sp)
    80008b04:	692a                	ld	s2,136(sp)
    80008b06:	69ca                	ld	s3,144(sp)
    80008b08:	6a6a                	ld	s4,152(sp)
    80008b0a:	7a8a                	ld	s5,160(sp)
    80008b0c:	7b2a                	ld	s6,168(sp)
    80008b0e:	7bca                	ld	s7,176(sp)
    80008b10:	7c6a                	ld	s8,184(sp)
    80008b12:	6c8e                	ld	s9,192(sp)
    80008b14:	6d2e                	ld	s10,200(sp)
    80008b16:	6dce                	ld	s11,208(sp)
    80008b18:	6e6e                	ld	t3,216(sp)
    80008b1a:	7e8e                	ld	t4,224(sp)
    80008b1c:	7f2e                	ld	t5,232(sp)
    80008b1e:	7fce                	ld	t6,240(sp)
    80008b20:	6111                	addi	sp,sp,256
    80008b22:	10200073          	sret
    80008b26:	00000013          	nop
    80008b2a:	00000013          	nop
    80008b2e:	0001                	nop

0000000080008b30 <timervec>:
    80008b30:	34051573          	csrrw	a0,mscratch,a0
    80008b34:	e10c                	sd	a1,0(a0)
    80008b36:	e510                	sd	a2,8(a0)
    80008b38:	e914                	sd	a3,16(a0)
    80008b3a:	6d0c                	ld	a1,24(a0)
    80008b3c:	7110                	ld	a2,32(a0)
    80008b3e:	6194                	ld	a3,0(a1)
    80008b40:	96b2                	add	a3,a3,a2
    80008b42:	e194                	sd	a3,0(a1)
    80008b44:	4589                	li	a1,2
    80008b46:	14459073          	csrw	sip,a1
    80008b4a:	6914                	ld	a3,16(a0)
    80008b4c:	6510                	ld	a2,8(a0)
    80008b4e:	610c                	ld	a1,0(a0)
    80008b50:	34051573          	csrrw	a0,mscratch,a0
    80008b54:	30200073          	mret
	...

0000000080008b5a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008b5a:	1141                	addi	sp,sp,-16
    80008b5c:	e422                	sd	s0,8(sp)
    80008b5e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008b60:	0c0007b7          	lui	a5,0xc000
    80008b64:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008b68:	4705                	li	a4,1
    80008b6a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008b6c:	0c0007b7          	lui	a5,0xc000
    80008b70:	0791                	addi	a5,a5,4
    80008b72:	4705                	li	a4,1
    80008b74:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008b76:	0c0007b7          	lui	a5,0xc000
    80008b7a:	07a1                	addi	a5,a5,8
    80008b7c:	4705                	li	a4,1
    80008b7e:	c398                	sw	a4,0(a5)
}
    80008b80:	0001                	nop
    80008b82:	6422                	ld	s0,8(sp)
    80008b84:	0141                	addi	sp,sp,16
    80008b86:	8082                	ret

0000000080008b88 <plicinithart>:

void
plicinithart(void)
{
    80008b88:	1101                	addi	sp,sp,-32
    80008b8a:	ec06                	sd	ra,24(sp)
    80008b8c:	e822                	sd	s0,16(sp)
    80008b8e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008b90:	ffffa097          	auipc	ra,0xffffa
    80008b94:	ed8080e7          	jalr	-296(ra) # 80002a68 <cpuid>
    80008b98:	87aa                	mv	a5,a0
    80008b9a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008b9e:	fec42783          	lw	a5,-20(s0)
    80008ba2:	0087979b          	slliw	a5,a5,0x8
    80008ba6:	2781                	sext.w	a5,a5
    80008ba8:	873e                	mv	a4,a5
    80008baa:	0c0027b7          	lui	a5,0xc002
    80008bae:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008bb2:	97ba                	add	a5,a5,a4
    80008bb4:	873e                	mv	a4,a5
    80008bb6:	40600793          	li	a5,1030
    80008bba:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008bbc:	fec42783          	lw	a5,-20(s0)
    80008bc0:	00d7979b          	slliw	a5,a5,0xd
    80008bc4:	2781                	sext.w	a5,a5
    80008bc6:	873e                	mv	a4,a5
    80008bc8:	0c2017b7          	lui	a5,0xc201
    80008bcc:	97ba                	add	a5,a5,a4
    80008bce:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008bd2:	0001                	nop
    80008bd4:	60e2                	ld	ra,24(sp)
    80008bd6:	6442                	ld	s0,16(sp)
    80008bd8:	6105                	addi	sp,sp,32
    80008bda:	8082                	ret

0000000080008bdc <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008bdc:	1101                	addi	sp,sp,-32
    80008bde:	ec06                	sd	ra,24(sp)
    80008be0:	e822                	sd	s0,16(sp)
    80008be2:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008be4:	ffffa097          	auipc	ra,0xffffa
    80008be8:	e84080e7          	jalr	-380(ra) # 80002a68 <cpuid>
    80008bec:	87aa                	mv	a5,a0
    80008bee:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008bf2:	fec42783          	lw	a5,-20(s0)
    80008bf6:	00d7979b          	slliw	a5,a5,0xd
    80008bfa:	2781                	sext.w	a5,a5
    80008bfc:	873e                	mv	a4,a5
    80008bfe:	0c2017b7          	lui	a5,0xc201
    80008c02:	0791                	addi	a5,a5,4
    80008c04:	97ba                	add	a5,a5,a4
    80008c06:	439c                	lw	a5,0(a5)
    80008c08:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008c0c:	fe842783          	lw	a5,-24(s0)
}
    80008c10:	853e                	mv	a0,a5
    80008c12:	60e2                	ld	ra,24(sp)
    80008c14:	6442                	ld	s0,16(sp)
    80008c16:	6105                	addi	sp,sp,32
    80008c18:	8082                	ret

0000000080008c1a <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008c1a:	7179                	addi	sp,sp,-48
    80008c1c:	f406                	sd	ra,40(sp)
    80008c1e:	f022                	sd	s0,32(sp)
    80008c20:	1800                	addi	s0,sp,48
    80008c22:	87aa                	mv	a5,a0
    80008c24:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008c28:	ffffa097          	auipc	ra,0xffffa
    80008c2c:	e40080e7          	jalr	-448(ra) # 80002a68 <cpuid>
    80008c30:	87aa                	mv	a5,a0
    80008c32:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008c36:	fec42783          	lw	a5,-20(s0)
    80008c3a:	00d7979b          	slliw	a5,a5,0xd
    80008c3e:	2781                	sext.w	a5,a5
    80008c40:	873e                	mv	a4,a5
    80008c42:	0c2017b7          	lui	a5,0xc201
    80008c46:	0791                	addi	a5,a5,4
    80008c48:	97ba                	add	a5,a5,a4
    80008c4a:	873e                	mv	a4,a5
    80008c4c:	fdc42783          	lw	a5,-36(s0)
    80008c50:	c31c                	sw	a5,0(a4)
}
    80008c52:	0001                	nop
    80008c54:	70a2                	ld	ra,40(sp)
    80008c56:	7402                	ld	s0,32(sp)
    80008c58:	6145                	addi	sp,sp,48
    80008c5a:	8082                	ret

0000000080008c5c <r_sstatus>:
{
    80008c5c:	1101                	addi	sp,sp,-32
    80008c5e:	ec22                	sd	s0,24(sp)
    80008c60:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80008c62:	100027f3          	csrr	a5,sstatus
    80008c66:	fef43423          	sd	a5,-24(s0)
  return x;
    80008c6a:	fe843783          	ld	a5,-24(s0)
}
    80008c6e:	853e                	mv	a0,a5
    80008c70:	6462                	ld	s0,24(sp)
    80008c72:	6105                	addi	sp,sp,32
    80008c74:	8082                	ret

0000000080008c76 <w_sstatus>:
{
    80008c76:	1101                	addi	sp,sp,-32
    80008c78:	ec22                	sd	s0,24(sp)
    80008c7a:	1000                	addi	s0,sp,32
    80008c7c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80008c80:	fe843783          	ld	a5,-24(s0)
    80008c84:	10079073          	csrw	sstatus,a5
}
    80008c88:	0001                	nop
    80008c8a:	6462                	ld	s0,24(sp)
    80008c8c:	6105                	addi	sp,sp,32
    80008c8e:	8082                	ret

0000000080008c90 <intr_on>:
{
    80008c90:	1141                	addi	sp,sp,-16
    80008c92:	e406                	sd	ra,8(sp)
    80008c94:	e022                	sd	s0,0(sp)
    80008c96:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80008c98:	00000097          	auipc	ra,0x0
    80008c9c:	fc4080e7          	jalr	-60(ra) # 80008c5c <r_sstatus>
    80008ca0:	87aa                	mv	a5,a0
    80008ca2:	0027e793          	ori	a5,a5,2
    80008ca6:	853e                	mv	a0,a5
    80008ca8:	00000097          	auipc	ra,0x0
    80008cac:	fce080e7          	jalr	-50(ra) # 80008c76 <w_sstatus>
}
    80008cb0:	0001                	nop
    80008cb2:	60a2                	ld	ra,8(sp)
    80008cb4:	6402                	ld	s0,0(sp)
    80008cb6:	0141                	addi	sp,sp,16
    80008cb8:	8082                	ret

0000000080008cba <intr_off>:
{
    80008cba:	1141                	addi	sp,sp,-16
    80008cbc:	e406                	sd	ra,8(sp)
    80008cbe:	e022                	sd	s0,0(sp)
    80008cc0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80008cc2:	00000097          	auipc	ra,0x0
    80008cc6:	f9a080e7          	jalr	-102(ra) # 80008c5c <r_sstatus>
    80008cca:	87aa                	mv	a5,a0
    80008ccc:	9bf5                	andi	a5,a5,-3
    80008cce:	853e                	mv	a0,a5
    80008cd0:	00000097          	auipc	ra,0x0
    80008cd4:	fa6080e7          	jalr	-90(ra) # 80008c76 <w_sstatus>
}
    80008cd8:	0001                	nop
    80008cda:	60a2                	ld	ra,8(sp)
    80008cdc:	6402                	ld	s0,0(sp)
    80008cde:	0141                	addi	sp,sp,16
    80008ce0:	8082                	ret

0000000080008ce2 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    80008ce2:	7139                	addi	sp,sp,-64
    80008ce4:	fc06                	sd	ra,56(sp)
    80008ce6:	f822                	sd	s0,48(sp)
    80008ce8:	0080                	addi	s0,sp,64
    80008cea:	87aa                	mv	a5,a0
    80008cec:	fcb43023          	sd	a1,-64(s0)
    80008cf0:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80008cf4:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008cf8:	fcc42703          	lw	a4,-52(s0)
    80008cfc:	15000793          	li	a5,336
    80008d00:	02f707b3          	mul	a5,a4,a5
    80008d04:	13078713          	addi	a4,a5,304 # c201130 <_entry-0x73dfeed0>
    80008d08:	0002c797          	auipc	a5,0x2c
    80008d0c:	f8078793          	addi	a5,a5,-128 # 80034c88 <disk>
    80008d10:	97ba                	add	a5,a5,a4
    80008d12:	fc043583          	ld	a1,-64(s0)
    80008d16:	853e                	mv	a0,a5
    80008d18:	ffff8097          	auipc	ra,0xffff8
    80008d1c:	5e2080e7          	jalr	1506(ra) # 800012fa <initlock>
  disk[id].name = name;
    80008d20:	0002c717          	auipc	a4,0x2c
    80008d24:	f6870713          	addi	a4,a4,-152 # 80034c88 <disk>
    80008d28:	fcc42683          	lw	a3,-52(s0)
    80008d2c:	15000793          	li	a5,336
    80008d30:	02f687b3          	mul	a5,a3,a5
    80008d34:	97ba                	add	a5,a5,a4
    80008d36:	fc043703          	ld	a4,-64(s0)
    80008d3a:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008d3c:	fcc42703          	lw	a4,-52(s0)
    80008d40:	67c1                	lui	a5,0x10
    80008d42:	0785                	addi	a5,a5,1
    80008d44:	97ba                	add	a5,a5,a4
    80008d46:	07b2                	slli	a5,a5,0xc
    80008d48:	439c                	lw	a5,0(a5)
    80008d4a:	2781                	sext.w	a5,a5
    80008d4c:	873e                	mv	a4,a5
    80008d4e:	747277b7          	lui	a5,0x74727
    80008d52:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008d56:	04f71c63          	bne	a4,a5,80008dae <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008d5a:	fcc42703          	lw	a4,-52(s0)
    80008d5e:	67c1                	lui	a5,0x10
    80008d60:	0785                	addi	a5,a5,1
    80008d62:	97ba                	add	a5,a5,a4
    80008d64:	07b2                	slli	a5,a5,0xc
    80008d66:	0791                	addi	a5,a5,4
    80008d68:	439c                	lw	a5,0(a5)
    80008d6a:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008d6c:	873e                	mv	a4,a5
    80008d6e:	4789                	li	a5,2
    80008d70:	02f71f63          	bne	a4,a5,80008dae <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008d74:	fcc42703          	lw	a4,-52(s0)
    80008d78:	67c1                	lui	a5,0x10
    80008d7a:	0785                	addi	a5,a5,1
    80008d7c:	97ba                	add	a5,a5,a4
    80008d7e:	07b2                	slli	a5,a5,0xc
    80008d80:	07a1                	addi	a5,a5,8
    80008d82:	439c                	lw	a5,0(a5)
    80008d84:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008d86:	873e                	mv	a4,a5
    80008d88:	4789                	li	a5,2
    80008d8a:	02f71263          	bne	a4,a5,80008dae <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008d8e:	fcc42703          	lw	a4,-52(s0)
    80008d92:	67c1                	lui	a5,0x10
    80008d94:	0785                	addi	a5,a5,1
    80008d96:	97ba                	add	a5,a5,a4
    80008d98:	07b2                	slli	a5,a5,0xc
    80008d9a:	07b1                	addi	a5,a5,12
    80008d9c:	439c                	lw	a5,0(a5)
    80008d9e:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008da0:	873e                	mv	a4,a5
    80008da2:	554d47b7          	lui	a5,0x554d4
    80008da6:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008daa:	00f70d63          	beq	a4,a5,80008dc4 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    80008dae:	fc043603          	ld	a2,-64(s0)
    80008db2:	00003597          	auipc	a1,0x3
    80008db6:	8be58593          	addi	a1,a1,-1858 # 8000b670 <etext+0x670>
    80008dba:	4509                	li	a0,2
    80008dbc:	ffff8097          	auipc	ra,0xffff8
    80008dc0:	f22080e7          	jalr	-222(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008dc4:	fcc42703          	lw	a4,-52(s0)
    80008dc8:	67c1                	lui	a5,0x10
    80008dca:	0785                	addi	a5,a5,1
    80008dcc:	97ba                	add	a5,a5,a4
    80008dce:	07b2                	slli	a5,a5,0xc
    80008dd0:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008dd4:	873e                	mv	a4,a5
    80008dd6:	fe842783          	lw	a5,-24(s0)
    80008dda:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008ddc:	fe842783          	lw	a5,-24(s0)
    80008de0:	0017e793          	ori	a5,a5,1
    80008de4:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008de8:	fcc42703          	lw	a4,-52(s0)
    80008dec:	67c1                	lui	a5,0x10
    80008dee:	0785                	addi	a5,a5,1
    80008df0:	97ba                	add	a5,a5,a4
    80008df2:	07b2                	slli	a5,a5,0xc
    80008df4:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008df8:	873e                	mv	a4,a5
    80008dfa:	fe842783          	lw	a5,-24(s0)
    80008dfe:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008e00:	fe842783          	lw	a5,-24(s0)
    80008e04:	0027e793          	ori	a5,a5,2
    80008e08:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008e0c:	fcc42703          	lw	a4,-52(s0)
    80008e10:	67c1                	lui	a5,0x10
    80008e12:	0785                	addi	a5,a5,1
    80008e14:	97ba                	add	a5,a5,a4
    80008e16:	07b2                	slli	a5,a5,0xc
    80008e18:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008e1c:	873e                	mv	a4,a5
    80008e1e:	fe842783          	lw	a5,-24(s0)
    80008e22:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008e24:	fcc42703          	lw	a4,-52(s0)
    80008e28:	67c1                	lui	a5,0x10
    80008e2a:	0785                	addi	a5,a5,1
    80008e2c:	97ba                	add	a5,a5,a4
    80008e2e:	07b2                	slli	a5,a5,0xc
    80008e30:	07c1                	addi	a5,a5,16
    80008e32:	439c                	lw	a5,0(a5)
    80008e34:	2781                	sext.w	a5,a5
    80008e36:	1782                	slli	a5,a5,0x20
    80008e38:	9381                	srli	a5,a5,0x20
    80008e3a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008e3e:	fe043783          	ld	a5,-32(s0)
    80008e42:	fdf7f793          	andi	a5,a5,-33
    80008e46:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008e4a:	fe043783          	ld	a5,-32(s0)
    80008e4e:	f7f7f793          	andi	a5,a5,-129
    80008e52:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008e56:	fe043703          	ld	a4,-32(s0)
    80008e5a:	77fd                	lui	a5,0xfffff
    80008e5c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffca8cf>
    80008e60:	8ff9                	and	a5,a5,a4
    80008e62:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008e66:	fe043703          	ld	a4,-32(s0)
    80008e6a:	77fd                	lui	a5,0xfffff
    80008e6c:	17fd                	addi	a5,a5,-1
    80008e6e:	8ff9                	and	a5,a5,a4
    80008e70:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008e74:	fe043703          	ld	a4,-32(s0)
    80008e78:	f80007b7          	lui	a5,0xf8000
    80008e7c:	17fd                	addi	a5,a5,-1
    80008e7e:	8ff9                	and	a5,a5,a4
    80008e80:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008e84:	fe043703          	ld	a4,-32(s0)
    80008e88:	e00007b7          	lui	a5,0xe0000
    80008e8c:	17fd                	addi	a5,a5,-1
    80008e8e:	8ff9                	and	a5,a5,a4
    80008e90:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008e94:	fe043703          	ld	a4,-32(s0)
    80008e98:	f00007b7          	lui	a5,0xf0000
    80008e9c:	17fd                	addi	a5,a5,-1
    80008e9e:	8ff9                	and	a5,a5,a4
    80008ea0:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008ea4:	fcc42703          	lw	a4,-52(s0)
    80008ea8:	67c1                	lui	a5,0x10
    80008eaa:	0785                	addi	a5,a5,1
    80008eac:	97ba                	add	a5,a5,a4
    80008eae:	07b2                	slli	a5,a5,0xc
    80008eb0:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80008eb4:	873e                	mv	a4,a5
    80008eb6:	fe043783          	ld	a5,-32(s0)
    80008eba:	2781                	sext.w	a5,a5
    80008ebc:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008ebe:	fe842783          	lw	a5,-24(s0)
    80008ec2:	0087e793          	ori	a5,a5,8
    80008ec6:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008eca:	fcc42703          	lw	a4,-52(s0)
    80008ece:	67c1                	lui	a5,0x10
    80008ed0:	0785                	addi	a5,a5,1
    80008ed2:	97ba                	add	a5,a5,a4
    80008ed4:	07b2                	slli	a5,a5,0xc
    80008ed6:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008eda:	873e                	mv	a4,a5
    80008edc:	fe842783          	lw	a5,-24(s0)
    80008ee0:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80008ee2:	fcc42703          	lw	a4,-52(s0)
    80008ee6:	67c1                	lui	a5,0x10
    80008ee8:	0785                	addi	a5,a5,1
    80008eea:	97ba                	add	a5,a5,a4
    80008eec:	07b2                	slli	a5,a5,0xc
    80008eee:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008ef2:	439c                	lw	a5,0(a5)
    80008ef4:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80008ef8:	fe842783          	lw	a5,-24(s0)
    80008efc:	8ba1                	andi	a5,a5,8
    80008efe:	2781                	sext.w	a5,a5
    80008f00:	ef81                	bnez	a5,80008f18 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    80008f02:	00002617          	auipc	a2,0x2
    80008f06:	78e60613          	addi	a2,a2,1934 # 8000b690 <etext+0x690>
    80008f0a:	fc043583          	ld	a1,-64(s0)
    80008f0e:	4509                	li	a0,2
    80008f10:	ffff8097          	auipc	ra,0xffff8
    80008f14:	dce080e7          	jalr	-562(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008f18:	fcc42703          	lw	a4,-52(s0)
    80008f1c:	67c1                	lui	a5,0x10
    80008f1e:	0785                	addi	a5,a5,1
    80008f20:	97ba                	add	a5,a5,a4
    80008f22:	07b2                	slli	a5,a5,0xc
    80008f24:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    80008f28:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    80008f2c:	fcc42703          	lw	a4,-52(s0)
    80008f30:	67c1                	lui	a5,0x10
    80008f32:	0785                	addi	a5,a5,1
    80008f34:	97ba                	add	a5,a5,a4
    80008f36:	07b2                	slli	a5,a5,0xc
    80008f38:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80008f3c:	439c                	lw	a5,0(a5)
    80008f3e:	2781                	sext.w	a5,a5
    80008f40:	cf81                	beqz	a5,80008f58 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    80008f42:	00002617          	auipc	a2,0x2
    80008f46:	76e60613          	addi	a2,a2,1902 # 8000b6b0 <etext+0x6b0>
    80008f4a:	fc043583          	ld	a1,-64(s0)
    80008f4e:	4509                	li	a0,2
    80008f50:	ffff8097          	auipc	ra,0xffff8
    80008f54:	d8e080e7          	jalr	-626(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008f58:	fcc42703          	lw	a4,-52(s0)
    80008f5c:	67c1                	lui	a5,0x10
    80008f5e:	0785                	addi	a5,a5,1
    80008f60:	97ba                	add	a5,a5,a4
    80008f62:	07b2                	slli	a5,a5,0xc
    80008f64:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80008f68:	439c                	lw	a5,0(a5)
    80008f6a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008f6e:	fdc42783          	lw	a5,-36(s0)
    80008f72:	2781                	sext.w	a5,a5
    80008f74:	ef81                	bnez	a5,80008f8c <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    80008f76:	00002617          	auipc	a2,0x2
    80008f7a:	76260613          	addi	a2,a2,1890 # 8000b6d8 <etext+0x6d8>
    80008f7e:	fc043583          	ld	a1,-64(s0)
    80008f82:	4509                	li	a0,2
    80008f84:	ffff8097          	auipc	ra,0xffff8
    80008f88:	d5a080e7          	jalr	-678(ra) # 80000cde <panic_concat>
  if(max < NUM)
    80008f8c:	fdc42783          	lw	a5,-36(s0)
    80008f90:	0007871b          	sext.w	a4,a5
    80008f94:	479d                	li	a5,7
    80008f96:	00e7ed63          	bltu	a5,a4,80008fb0 <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    80008f9a:	00002617          	auipc	a2,0x2
    80008f9e:	75e60613          	addi	a2,a2,1886 # 8000b6f8 <etext+0x6f8>
    80008fa2:	fc043583          	ld	a1,-64(s0)
    80008fa6:	4509                	li	a0,2
    80008fa8:	ffff8097          	auipc	ra,0xffff8
    80008fac:	d36080e7          	jalr	-714(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    80008fb0:	ffff8097          	auipc	ra,0xffff8
    80008fb4:	226080e7          	jalr	550(ra) # 800011d6 <kalloc>
    80008fb8:	862a                	mv	a2,a0
    80008fba:	0002c717          	auipc	a4,0x2c
    80008fbe:	cce70713          	addi	a4,a4,-818 # 80034c88 <disk>
    80008fc2:	fcc42683          	lw	a3,-52(s0)
    80008fc6:	15000793          	li	a5,336
    80008fca:	02f687b3          	mul	a5,a3,a5
    80008fce:	97ba                	add	a5,a5,a4
    80008fd0:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    80008fd2:	ffff8097          	auipc	ra,0xffff8
    80008fd6:	204080e7          	jalr	516(ra) # 800011d6 <kalloc>
    80008fda:	862a                	mv	a2,a0
    80008fdc:	0002c717          	auipc	a4,0x2c
    80008fe0:	cac70713          	addi	a4,a4,-852 # 80034c88 <disk>
    80008fe4:	fcc42683          	lw	a3,-52(s0)
    80008fe8:	15000793          	li	a5,336
    80008fec:	02f687b3          	mul	a5,a3,a5
    80008ff0:	97ba                	add	a5,a5,a4
    80008ff2:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    80008ff4:	ffff8097          	auipc	ra,0xffff8
    80008ff8:	1e2080e7          	jalr	482(ra) # 800011d6 <kalloc>
    80008ffc:	862a                	mv	a2,a0
    80008ffe:	0002c717          	auipc	a4,0x2c
    80009002:	c8a70713          	addi	a4,a4,-886 # 80034c88 <disk>
    80009006:	fcc42683          	lw	a3,-52(s0)
    8000900a:	15000793          	li	a5,336
    8000900e:	02f687b3          	mul	a5,a3,a5
    80009012:	97ba                	add	a5,a5,a4
    80009014:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    80009016:	0002c717          	auipc	a4,0x2c
    8000901a:	c7270713          	addi	a4,a4,-910 # 80034c88 <disk>
    8000901e:	fcc42683          	lw	a3,-52(s0)
    80009022:	15000793          	li	a5,336
    80009026:	02f687b3          	mul	a5,a3,a5
    8000902a:	97ba                	add	a5,a5,a4
    8000902c:	679c                	ld	a5,8(a5)
    8000902e:	cb9d                	beqz	a5,80009064 <virtio_disk_init+0x382>
    80009030:	0002c717          	auipc	a4,0x2c
    80009034:	c5870713          	addi	a4,a4,-936 # 80034c88 <disk>
    80009038:	fcc42683          	lw	a3,-52(s0)
    8000903c:	15000793          	li	a5,336
    80009040:	02f687b3          	mul	a5,a3,a5
    80009044:	97ba                	add	a5,a5,a4
    80009046:	6b9c                	ld	a5,16(a5)
    80009048:	cf91                	beqz	a5,80009064 <virtio_disk_init+0x382>
    8000904a:	0002c717          	auipc	a4,0x2c
    8000904e:	c3e70713          	addi	a4,a4,-962 # 80034c88 <disk>
    80009052:	fcc42683          	lw	a3,-52(s0)
    80009056:	15000793          	li	a5,336
    8000905a:	02f687b3          	mul	a5,a3,a5
    8000905e:	97ba                	add	a5,a5,a4
    80009060:	6f9c                	ld	a5,24(a5)
    80009062:	ef81                	bnez	a5,8000907a <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80009064:	00002617          	auipc	a2,0x2
    80009068:	6bc60613          	addi	a2,a2,1724 # 8000b720 <etext+0x720>
    8000906c:	fc043583          	ld	a1,-64(s0)
    80009070:	4509                	li	a0,2
    80009072:	ffff8097          	auipc	ra,0xffff8
    80009076:	c6c080e7          	jalr	-916(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    8000907a:	0002c717          	auipc	a4,0x2c
    8000907e:	c0e70713          	addi	a4,a4,-1010 # 80034c88 <disk>
    80009082:	fcc42683          	lw	a3,-52(s0)
    80009086:	15000793          	li	a5,336
    8000908a:	02f687b3          	mul	a5,a3,a5
    8000908e:	97ba                	add	a5,a5,a4
    80009090:	679c                	ld	a5,8(a5)
    80009092:	6605                	lui	a2,0x1
    80009094:	4581                	li	a1,0
    80009096:	853e                	mv	a0,a5
    80009098:	ffff8097          	auipc	ra,0xffff8
    8000909c:	466080e7          	jalr	1126(ra) # 800014fe <memset>
  memset(disk[id].avail, 0, PGSIZE);
    800090a0:	0002c717          	auipc	a4,0x2c
    800090a4:	be870713          	addi	a4,a4,-1048 # 80034c88 <disk>
    800090a8:	fcc42683          	lw	a3,-52(s0)
    800090ac:	15000793          	li	a5,336
    800090b0:	02f687b3          	mul	a5,a3,a5
    800090b4:	97ba                	add	a5,a5,a4
    800090b6:	6b9c                	ld	a5,16(a5)
    800090b8:	6605                	lui	a2,0x1
    800090ba:	4581                	li	a1,0
    800090bc:	853e                	mv	a0,a5
    800090be:	ffff8097          	auipc	ra,0xffff8
    800090c2:	440080e7          	jalr	1088(ra) # 800014fe <memset>
  memset(disk[id].used, 0, PGSIZE);
    800090c6:	0002c717          	auipc	a4,0x2c
    800090ca:	bc270713          	addi	a4,a4,-1086 # 80034c88 <disk>
    800090ce:	fcc42683          	lw	a3,-52(s0)
    800090d2:	15000793          	li	a5,336
    800090d6:	02f687b3          	mul	a5,a3,a5
    800090da:	97ba                	add	a5,a5,a4
    800090dc:	6f9c                	ld	a5,24(a5)
    800090de:	6605                	lui	a2,0x1
    800090e0:	4581                	li	a1,0
    800090e2:	853e                	mv	a0,a5
    800090e4:	ffff8097          	auipc	ra,0xffff8
    800090e8:	41a080e7          	jalr	1050(ra) # 800014fe <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    800090ec:	fcc42703          	lw	a4,-52(s0)
    800090f0:	67c1                	lui	a5,0x10
    800090f2:	0785                	addi	a5,a5,1
    800090f4:	97ba                	add	a5,a5,a4
    800090f6:	07b2                	slli	a5,a5,0xc
    800090f8:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    800090fc:	873e                	mv	a4,a5
    800090fe:	47a1                	li	a5,8
    80009100:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    80009102:	0002c717          	auipc	a4,0x2c
    80009106:	b8670713          	addi	a4,a4,-1146 # 80034c88 <disk>
    8000910a:	fcc42683          	lw	a3,-52(s0)
    8000910e:	15000793          	li	a5,336
    80009112:	02f687b3          	mul	a5,a3,a5
    80009116:	97ba                	add	a5,a5,a4
    80009118:	679c                	ld	a5,8(a5)
    8000911a:	86be                	mv	a3,a5
    8000911c:	fcc42703          	lw	a4,-52(s0)
    80009120:	67c1                	lui	a5,0x10
    80009122:	0785                	addi	a5,a5,1
    80009124:	97ba                	add	a5,a5,a4
    80009126:	07b2                	slli	a5,a5,0xc
    80009128:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    8000912c:	873e                	mv	a4,a5
    8000912e:	0006879b          	sext.w	a5,a3
    80009132:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    80009134:	0002c717          	auipc	a4,0x2c
    80009138:	b5470713          	addi	a4,a4,-1196 # 80034c88 <disk>
    8000913c:	fcc42683          	lw	a3,-52(s0)
    80009140:	15000793          	li	a5,336
    80009144:	02f687b3          	mul	a5,a3,a5
    80009148:	97ba                	add	a5,a5,a4
    8000914a:	679c                	ld	a5,8(a5)
    8000914c:	0207d693          	srli	a3,a5,0x20
    80009150:	fcc42703          	lw	a4,-52(s0)
    80009154:	67c1                	lui	a5,0x10
    80009156:	0785                	addi	a5,a5,1
    80009158:	97ba                	add	a5,a5,a4
    8000915a:	07b2                	slli	a5,a5,0xc
    8000915c:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    80009160:	873e                	mv	a4,a5
    80009162:	0006879b          	sext.w	a5,a3
    80009166:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009168:	0002c717          	auipc	a4,0x2c
    8000916c:	b2070713          	addi	a4,a4,-1248 # 80034c88 <disk>
    80009170:	fcc42683          	lw	a3,-52(s0)
    80009174:	15000793          	li	a5,336
    80009178:	02f687b3          	mul	a5,a3,a5
    8000917c:	97ba                	add	a5,a5,a4
    8000917e:	6b9c                	ld	a5,16(a5)
    80009180:	86be                	mv	a3,a5
    80009182:	fcc42703          	lw	a4,-52(s0)
    80009186:	67c1                	lui	a5,0x10
    80009188:	0785                	addi	a5,a5,1
    8000918a:	97ba                	add	a5,a5,a4
    8000918c:	07b2                	slli	a5,a5,0xc
    8000918e:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    80009192:	873e                	mv	a4,a5
    80009194:	0006879b          	sext.w	a5,a3
    80009198:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    8000919a:	0002c717          	auipc	a4,0x2c
    8000919e:	aee70713          	addi	a4,a4,-1298 # 80034c88 <disk>
    800091a2:	fcc42683          	lw	a3,-52(s0)
    800091a6:	15000793          	li	a5,336
    800091aa:	02f687b3          	mul	a5,a3,a5
    800091ae:	97ba                	add	a5,a5,a4
    800091b0:	6b9c                	ld	a5,16(a5)
    800091b2:	0207d693          	srli	a3,a5,0x20
    800091b6:	fcc42703          	lw	a4,-52(s0)
    800091ba:	67c1                	lui	a5,0x10
    800091bc:	0785                	addi	a5,a5,1
    800091be:	97ba                	add	a5,a5,a4
    800091c0:	07b2                	slli	a5,a5,0xc
    800091c2:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    800091c6:	873e                	mv	a4,a5
    800091c8:	0006879b          	sext.w	a5,a3
    800091cc:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    800091ce:	0002c717          	auipc	a4,0x2c
    800091d2:	aba70713          	addi	a4,a4,-1350 # 80034c88 <disk>
    800091d6:	fcc42683          	lw	a3,-52(s0)
    800091da:	15000793          	li	a5,336
    800091de:	02f687b3          	mul	a5,a3,a5
    800091e2:	97ba                	add	a5,a5,a4
    800091e4:	6f9c                	ld	a5,24(a5)
    800091e6:	86be                	mv	a3,a5
    800091e8:	fcc42703          	lw	a4,-52(s0)
    800091ec:	67c1                	lui	a5,0x10
    800091ee:	0785                	addi	a5,a5,1
    800091f0:	97ba                	add	a5,a5,a4
    800091f2:	07b2                	slli	a5,a5,0xc
    800091f4:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    800091f8:	873e                	mv	a4,a5
    800091fa:	0006879b          	sext.w	a5,a3
    800091fe:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    80009200:	0002c717          	auipc	a4,0x2c
    80009204:	a8870713          	addi	a4,a4,-1400 # 80034c88 <disk>
    80009208:	fcc42683          	lw	a3,-52(s0)
    8000920c:	15000793          	li	a5,336
    80009210:	02f687b3          	mul	a5,a3,a5
    80009214:	97ba                	add	a5,a5,a4
    80009216:	6f9c                	ld	a5,24(a5)
    80009218:	0207d693          	srli	a3,a5,0x20
    8000921c:	fcc42703          	lw	a4,-52(s0)
    80009220:	67c1                	lui	a5,0x10
    80009222:	0785                	addi	a5,a5,1
    80009224:	97ba                	add	a5,a5,a4
    80009226:	07b2                	slli	a5,a5,0xc
    80009228:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    8000922c:	873e                	mv	a4,a5
    8000922e:	0006879b          	sext.w	a5,a3
    80009232:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80009234:	fcc42703          	lw	a4,-52(s0)
    80009238:	67c1                	lui	a5,0x10
    8000923a:	0785                	addi	a5,a5,1
    8000923c:	97ba                	add	a5,a5,a4
    8000923e:	07b2                	slli	a5,a5,0xc
    80009240:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80009244:	873e                	mv	a4,a5
    80009246:	4785                	li	a5,1
    80009248:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000924a:	fe042623          	sw	zero,-20(s0)
    8000924e:	a03d                	j	8000927c <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    80009250:	0002c697          	auipc	a3,0x2c
    80009254:	a3868693          	addi	a3,a3,-1480 # 80034c88 <disk>
    80009258:	fec42703          	lw	a4,-20(s0)
    8000925c:	fcc42603          	lw	a2,-52(s0)
    80009260:	15000793          	li	a5,336
    80009264:	02f607b3          	mul	a5,a2,a5
    80009268:	97b6                	add	a5,a5,a3
    8000926a:	97ba                	add	a5,a5,a4
    8000926c:	4705                	li	a4,1
    8000926e:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    80009272:	fec42783          	lw	a5,-20(s0)
    80009276:	2785                	addiw	a5,a5,1
    80009278:	fef42623          	sw	a5,-20(s0)
    8000927c:	fec42783          	lw	a5,-20(s0)
    80009280:	0007871b          	sext.w	a4,a5
    80009284:	479d                	li	a5,7
    80009286:	fce7d5e3          	bge	a5,a4,80009250 <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000928a:	fe842783          	lw	a5,-24(s0)
    8000928e:	0047e793          	ori	a5,a5,4
    80009292:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009296:	fcc42703          	lw	a4,-52(s0)
    8000929a:	67c1                	lui	a5,0x10
    8000929c:	0785                	addi	a5,a5,1
    8000929e:	97ba                	add	a5,a5,a4
    800092a0:	07b2                	slli	a5,a5,0xc
    800092a2:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800092a6:	873e                	mv	a4,a5
    800092a8:	fe842783          	lw	a5,-24(s0)
    800092ac:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    800092ae:	fcc42783          	lw	a5,-52(s0)
    800092b2:	0007871b          	sext.w	a4,a5
    800092b6:	4785                	li	a5,1
    800092b8:	06f71663          	bne	a4,a5,80009324 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    800092bc:	ffff8097          	auipc	ra,0xffff8
    800092c0:	f1a080e7          	jalr	-230(ra) # 800011d6 <kalloc>
    800092c4:	872a                	mv	a4,a0
    800092c6:	0002c797          	auipc	a5,0x2c
    800092ca:	c6278793          	addi	a5,a5,-926 # 80034f28 <swap_buffer>
    800092ce:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    800092d0:	0002c797          	auipc	a5,0x2c
    800092d4:	c5878793          	addi	a5,a5,-936 # 80034f28 <swap_buffer>
    800092d8:	639c                	ld	a5,0(a5)
    800092da:	eb89                	bnez	a5,800092ec <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    800092dc:	00002517          	auipc	a0,0x2
    800092e0:	45c50513          	addi	a0,a0,1116 # 8000b738 <etext+0x738>
    800092e4:	ffff8097          	auipc	ra,0xffff8
    800092e8:	9a8080e7          	jalr	-1624(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    800092ec:	0002c797          	auipc	a5,0x2c
    800092f0:	c3c78793          	addi	a5,a5,-964 # 80034f28 <swap_buffer>
    800092f4:	639c                	ld	a5,0(a5)
    800092f6:	40000613          	li	a2,1024
    800092fa:	4581                	li	a1,0
    800092fc:	853e                	mv	a0,a5
    800092fe:	ffff8097          	auipc	ra,0xffff8
    80009302:	200080e7          	jalr	512(ra) # 800014fe <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    80009306:	0002c797          	auipc	a5,0x2c
    8000930a:	c2278793          	addi	a5,a5,-990 # 80034f28 <swap_buffer>
    8000930e:	639c                	ld	a5,0(a5)
    80009310:	07c1                	addi	a5,a5,16
    80009312:	00002597          	auipc	a1,0x2
    80009316:	45658593          	addi	a1,a1,1110 # 8000b768 <etext+0x768>
    8000931a:	853e                	mv	a0,a5
    8000931c:	ffffd097          	auipc	ra,0xffffd
    80009320:	4ac080e7          	jalr	1196(ra) # 800067c8 <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    80009324:	0001                	nop
    80009326:	70e2                	ld	ra,56(sp)
    80009328:	7442                	ld	s0,48(sp)
    8000932a:	6121                	addi	sp,sp,64
    8000932c:	8082                	ret

000000008000932e <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    8000932e:	7179                	addi	sp,sp,-48
    80009330:	f422                	sd	s0,40(sp)
    80009332:	1800                	addi	s0,sp,48
    80009334:	87aa                	mv	a5,a0
    80009336:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    8000933a:	fe042623          	sw	zero,-20(s0)
    8000933e:	a891                	j	80009392 <alloc_desc+0x64>
    if(disk[id].free[i]){
    80009340:	0002c697          	auipc	a3,0x2c
    80009344:	94868693          	addi	a3,a3,-1720 # 80034c88 <disk>
    80009348:	fec42703          	lw	a4,-20(s0)
    8000934c:	fdc42603          	lw	a2,-36(s0)
    80009350:	15000793          	li	a5,336
    80009354:	02f607b3          	mul	a5,a2,a5
    80009358:	97b6                	add	a5,a5,a3
    8000935a:	97ba                	add	a5,a5,a4
    8000935c:	0207c783          	lbu	a5,32(a5)
    80009360:	c785                	beqz	a5,80009388 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009362:	0002c697          	auipc	a3,0x2c
    80009366:	92668693          	addi	a3,a3,-1754 # 80034c88 <disk>
    8000936a:	fec42703          	lw	a4,-20(s0)
    8000936e:	fdc42603          	lw	a2,-36(s0)
    80009372:	15000793          	li	a5,336
    80009376:	02f607b3          	mul	a5,a2,a5
    8000937a:	97b6                	add	a5,a5,a3
    8000937c:	97ba                	add	a5,a5,a4
    8000937e:	02078023          	sb	zero,32(a5)
      return i;
    80009382:	fec42783          	lw	a5,-20(s0)
    80009386:	a831                	j	800093a2 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    80009388:	fec42783          	lw	a5,-20(s0)
    8000938c:	2785                	addiw	a5,a5,1
    8000938e:	fef42623          	sw	a5,-20(s0)
    80009392:	fec42783          	lw	a5,-20(s0)
    80009396:	0007871b          	sext.w	a4,a5
    8000939a:	479d                	li	a5,7
    8000939c:	fae7d2e3          	bge	a5,a4,80009340 <alloc_desc+0x12>
    }
  }
  return -1;
    800093a0:	57fd                	li	a5,-1
}
    800093a2:	853e                	mv	a0,a5
    800093a4:	7422                	ld	s0,40(sp)
    800093a6:	6145                	addi	sp,sp,48
    800093a8:	8082                	ret

00000000800093aa <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    800093aa:	1101                	addi	sp,sp,-32
    800093ac:	ec06                	sd	ra,24(sp)
    800093ae:	e822                	sd	s0,16(sp)
    800093b0:	1000                	addi	s0,sp,32
    800093b2:	87aa                	mv	a5,a0
    800093b4:	872e                	mv	a4,a1
    800093b6:	fef42623          	sw	a5,-20(s0)
    800093ba:	87ba                	mv	a5,a4
    800093bc:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    800093c0:	fe842783          	lw	a5,-24(s0)
    800093c4:	0007871b          	sext.w	a4,a5
    800093c8:	479d                	li	a5,7
    800093ca:	02e7d863          	bge	a5,a4,800093fa <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    800093ce:	0002c717          	auipc	a4,0x2c
    800093d2:	8ba70713          	addi	a4,a4,-1862 # 80034c88 <disk>
    800093d6:	fec42683          	lw	a3,-20(s0)
    800093da:	15000793          	li	a5,336
    800093de:	02f687b3          	mul	a5,a3,a5
    800093e2:	97ba                	add	a5,a5,a4
    800093e4:	639c                	ld	a5,0(a5)
    800093e6:	00002617          	auipc	a2,0x2
    800093ea:	39260613          	addi	a2,a2,914 # 8000b778 <etext+0x778>
    800093ee:	85be                	mv	a1,a5
    800093f0:	4509                	li	a0,2
    800093f2:	ffff8097          	auipc	ra,0xffff8
    800093f6:	8ec080e7          	jalr	-1812(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    800093fa:	0002c697          	auipc	a3,0x2c
    800093fe:	88e68693          	addi	a3,a3,-1906 # 80034c88 <disk>
    80009402:	fe842703          	lw	a4,-24(s0)
    80009406:	fec42603          	lw	a2,-20(s0)
    8000940a:	15000793          	li	a5,336
    8000940e:	02f607b3          	mul	a5,a2,a5
    80009412:	97b6                	add	a5,a5,a3
    80009414:	97ba                	add	a5,a5,a4
    80009416:	0207c783          	lbu	a5,32(a5)
    8000941a:	c79d                	beqz	a5,80009448 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    8000941c:	0002c717          	auipc	a4,0x2c
    80009420:	86c70713          	addi	a4,a4,-1940 # 80034c88 <disk>
    80009424:	fec42683          	lw	a3,-20(s0)
    80009428:	15000793          	li	a5,336
    8000942c:	02f687b3          	mul	a5,a3,a5
    80009430:	97ba                	add	a5,a5,a4
    80009432:	639c                	ld	a5,0(a5)
    80009434:	00002617          	auipc	a2,0x2
    80009438:	35460613          	addi	a2,a2,852 # 8000b788 <etext+0x788>
    8000943c:	85be                	mv	a1,a5
    8000943e:	4509                	li	a0,2
    80009440:	ffff8097          	auipc	ra,0xffff8
    80009444:	89e080e7          	jalr	-1890(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    80009448:	0002c717          	auipc	a4,0x2c
    8000944c:	84070713          	addi	a4,a4,-1984 # 80034c88 <disk>
    80009450:	fec42683          	lw	a3,-20(s0)
    80009454:	15000793          	li	a5,336
    80009458:	02f687b3          	mul	a5,a3,a5
    8000945c:	97ba                	add	a5,a5,a4
    8000945e:	6798                	ld	a4,8(a5)
    80009460:	fe842783          	lw	a5,-24(s0)
    80009464:	0792                	slli	a5,a5,0x4
    80009466:	97ba                	add	a5,a5,a4
    80009468:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000946c:	0002c717          	auipc	a4,0x2c
    80009470:	81c70713          	addi	a4,a4,-2020 # 80034c88 <disk>
    80009474:	fec42683          	lw	a3,-20(s0)
    80009478:	15000793          	li	a5,336
    8000947c:	02f687b3          	mul	a5,a3,a5
    80009480:	97ba                	add	a5,a5,a4
    80009482:	6798                	ld	a4,8(a5)
    80009484:	fe842783          	lw	a5,-24(s0)
    80009488:	0792                	slli	a5,a5,0x4
    8000948a:	97ba                	add	a5,a5,a4
    8000948c:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    80009490:	0002b717          	auipc	a4,0x2b
    80009494:	7f870713          	addi	a4,a4,2040 # 80034c88 <disk>
    80009498:	fec42683          	lw	a3,-20(s0)
    8000949c:	15000793          	li	a5,336
    800094a0:	02f687b3          	mul	a5,a3,a5
    800094a4:	97ba                	add	a5,a5,a4
    800094a6:	6798                	ld	a4,8(a5)
    800094a8:	fe842783          	lw	a5,-24(s0)
    800094ac:	0792                	slli	a5,a5,0x4
    800094ae:	97ba                	add	a5,a5,a4
    800094b0:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    800094b4:	0002b717          	auipc	a4,0x2b
    800094b8:	7d470713          	addi	a4,a4,2004 # 80034c88 <disk>
    800094bc:	fec42683          	lw	a3,-20(s0)
    800094c0:	15000793          	li	a5,336
    800094c4:	02f687b3          	mul	a5,a3,a5
    800094c8:	97ba                	add	a5,a5,a4
    800094ca:	6798                	ld	a4,8(a5)
    800094cc:	fe842783          	lw	a5,-24(s0)
    800094d0:	0792                	slli	a5,a5,0x4
    800094d2:	97ba                	add	a5,a5,a4
    800094d4:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    800094d8:	0002b697          	auipc	a3,0x2b
    800094dc:	7b068693          	addi	a3,a3,1968 # 80034c88 <disk>
    800094e0:	fe842703          	lw	a4,-24(s0)
    800094e4:	fec42603          	lw	a2,-20(s0)
    800094e8:	15000793          	li	a5,336
    800094ec:	02f607b3          	mul	a5,a2,a5
    800094f0:	97b6                	add	a5,a5,a3
    800094f2:	97ba                	add	a5,a5,a4
    800094f4:	4705                	li	a4,1
    800094f6:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    800094fa:	0002b717          	auipc	a4,0x2b
    800094fe:	78e70713          	addi	a4,a4,1934 # 80034c88 <disk>
    80009502:	fec42683          	lw	a3,-20(s0)
    80009506:	15000793          	li	a5,336
    8000950a:	02f687b3          	mul	a5,a3,a5
    8000950e:	97ba                	add	a5,a5,a4
    80009510:	1487a783          	lw	a5,328(a5)
    80009514:	e39d                	bnez	a5,8000953a <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    80009516:	fec42703          	lw	a4,-20(s0)
    8000951a:	15000793          	li	a5,336
    8000951e:	02f707b3          	mul	a5,a4,a5
    80009522:	02078713          	addi	a4,a5,32
    80009526:	0002b797          	auipc	a5,0x2b
    8000952a:	76278793          	addi	a5,a5,1890 # 80034c88 <disk>
    8000952e:	97ba                	add	a5,a5,a4
    80009530:	853e                	mv	a0,a5
    80009532:	ffffa097          	auipc	ra,0xffffa
    80009536:	1d2080e7          	jalr	466(ra) # 80003704 <wakeup>
  }
}
    8000953a:	0001                	nop
    8000953c:	60e2                	ld	ra,24(sp)
    8000953e:	6442                	ld	s0,16(sp)
    80009540:	6105                	addi	sp,sp,32
    80009542:	8082                	ret

0000000080009544 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009544:	7179                	addi	sp,sp,-48
    80009546:	f406                	sd	ra,40(sp)
    80009548:	f022                	sd	s0,32(sp)
    8000954a:	1800                	addi	s0,sp,48
    8000954c:	87aa                	mv	a5,a0
    8000954e:	872e                	mv	a4,a1
    80009550:	fcf42e23          	sw	a5,-36(s0)
    80009554:	87ba                	mv	a5,a4
    80009556:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    8000955a:	0002b717          	auipc	a4,0x2b
    8000955e:	72e70713          	addi	a4,a4,1838 # 80034c88 <disk>
    80009562:	fdc42683          	lw	a3,-36(s0)
    80009566:	15000793          	li	a5,336
    8000956a:	02f687b3          	mul	a5,a3,a5
    8000956e:	97ba                	add	a5,a5,a4
    80009570:	6798                	ld	a4,8(a5)
    80009572:	fd842783          	lw	a5,-40(s0)
    80009576:	0792                	slli	a5,a5,0x4
    80009578:	97ba                	add	a5,a5,a4
    8000957a:	00c7d783          	lhu	a5,12(a5)
    8000957e:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009582:	0002b717          	auipc	a4,0x2b
    80009586:	70670713          	addi	a4,a4,1798 # 80034c88 <disk>
    8000958a:	fdc42683          	lw	a3,-36(s0)
    8000958e:	15000793          	li	a5,336
    80009592:	02f687b3          	mul	a5,a3,a5
    80009596:	97ba                	add	a5,a5,a4
    80009598:	6798                	ld	a4,8(a5)
    8000959a:	fd842783          	lw	a5,-40(s0)
    8000959e:	0792                	slli	a5,a5,0x4
    800095a0:	97ba                	add	a5,a5,a4
    800095a2:	00e7d783          	lhu	a5,14(a5)
    800095a6:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    800095aa:	fd842703          	lw	a4,-40(s0)
    800095ae:	fdc42783          	lw	a5,-36(s0)
    800095b2:	85ba                	mv	a1,a4
    800095b4:	853e                	mv	a0,a5
    800095b6:	00000097          	auipc	ra,0x0
    800095ba:	df4080e7          	jalr	-524(ra) # 800093aa <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800095be:	fec42783          	lw	a5,-20(s0)
    800095c2:	8b85                	andi	a5,a5,1
    800095c4:	2781                	sext.w	a5,a5
    800095c6:	c791                	beqz	a5,800095d2 <free_chain+0x8e>
      i = nxt;
    800095c8:	fe842783          	lw	a5,-24(s0)
    800095cc:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    800095d0:	b769                	j	8000955a <free_chain+0x16>
    else
      break;
    800095d2:	0001                	nop
  }
}
    800095d4:	0001                	nop
    800095d6:	70a2                	ld	ra,40(sp)
    800095d8:	7402                	ld	s0,32(sp)
    800095da:	6145                	addi	sp,sp,48
    800095dc:	8082                	ret

00000000800095de <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    800095de:	7139                	addi	sp,sp,-64
    800095e0:	fc06                	sd	ra,56(sp)
    800095e2:	f822                	sd	s0,48(sp)
    800095e4:	f426                	sd	s1,40(sp)
    800095e6:	0080                	addi	s0,sp,64
    800095e8:	87aa                	mv	a5,a0
    800095ea:	fcb43023          	sd	a1,-64(s0)
    800095ee:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    800095f2:	fc042e23          	sw	zero,-36(s0)
    800095f6:	a041                	j	80009676 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    800095f8:	fdc42783          	lw	a5,-36(s0)
    800095fc:	078a                	slli	a5,a5,0x2
    800095fe:	fc043703          	ld	a4,-64(s0)
    80009602:	00f704b3          	add	s1,a4,a5
    80009606:	fcc42783          	lw	a5,-52(s0)
    8000960a:	853e                	mv	a0,a5
    8000960c:	00000097          	auipc	ra,0x0
    80009610:	d22080e7          	jalr	-734(ra) # 8000932e <alloc_desc>
    80009614:	87aa                	mv	a5,a0
    80009616:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009618:	fdc42783          	lw	a5,-36(s0)
    8000961c:	078a                	slli	a5,a5,0x2
    8000961e:	fc043703          	ld	a4,-64(s0)
    80009622:	97ba                	add	a5,a5,a4
    80009624:	439c                	lw	a5,0(a5)
    80009626:	0407d363          	bgez	a5,8000966c <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    8000962a:	fc042c23          	sw	zero,-40(s0)
    8000962e:	a02d                	j	80009658 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    80009630:	fd842783          	lw	a5,-40(s0)
    80009634:	078a                	slli	a5,a5,0x2
    80009636:	fc043703          	ld	a4,-64(s0)
    8000963a:	97ba                	add	a5,a5,a4
    8000963c:	4398                	lw	a4,0(a5)
    8000963e:	fcc42783          	lw	a5,-52(s0)
    80009642:	85ba                	mv	a1,a4
    80009644:	853e                	mv	a0,a5
    80009646:	00000097          	auipc	ra,0x0
    8000964a:	d64080e7          	jalr	-668(ra) # 800093aa <free_desc>
      for(int j = 0; j < i; j++)
    8000964e:	fd842783          	lw	a5,-40(s0)
    80009652:	2785                	addiw	a5,a5,1
    80009654:	fcf42c23          	sw	a5,-40(s0)
    80009658:	fd842703          	lw	a4,-40(s0)
    8000965c:	fdc42783          	lw	a5,-36(s0)
    80009660:	2701                	sext.w	a4,a4
    80009662:	2781                	sext.w	a5,a5
    80009664:	fcf746e3          	blt	a4,a5,80009630 <alloc3_desc+0x52>
      return -1;
    80009668:	57fd                	li	a5,-1
    8000966a:	a831                	j	80009686 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    8000966c:	fdc42783          	lw	a5,-36(s0)
    80009670:	2785                	addiw	a5,a5,1
    80009672:	fcf42e23          	sw	a5,-36(s0)
    80009676:	fdc42783          	lw	a5,-36(s0)
    8000967a:	0007871b          	sext.w	a4,a5
    8000967e:	4789                	li	a5,2
    80009680:	f6e7dce3          	bge	a5,a4,800095f8 <alloc3_desc+0x1a>
    }
  }
  return 0;
    80009684:	4781                	li	a5,0
}
    80009686:	853e                	mv	a0,a5
    80009688:	70e2                	ld	ra,56(sp)
    8000968a:	7442                	ld	s0,48(sp)
    8000968c:	74a2                	ld	s1,40(sp)
    8000968e:	6121                	addi	sp,sp,64
    80009690:	8082                	ret

0000000080009692 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    80009692:	715d                	addi	sp,sp,-80
    80009694:	e486                	sd	ra,72(sp)
    80009696:	e0a2                	sd	s0,64(sp)
    80009698:	0880                	addi	s0,sp,80
    8000969a:	87aa                	mv	a5,a0
    8000969c:	fcb43023          	sd	a1,-64(s0)
    800096a0:	8736                	mv	a4,a3
    800096a2:	fcf42623          	sw	a5,-52(s0)
    800096a6:	87b2                	mv	a5,a2
    800096a8:	fcf42423          	sw	a5,-56(s0)
    800096ac:	87ba                	mv	a5,a4
    800096ae:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    800096b2:	fc043783          	ld	a5,-64(s0)
    800096b6:	47dc                	lw	a5,12(a5)
    800096b8:	0017979b          	slliw	a5,a5,0x1
    800096bc:	2781                	sext.w	a5,a5
    800096be:	1782                	slli	a5,a5,0x20
    800096c0:	9381                	srli	a5,a5,0x20
    800096c2:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    800096c6:	fcc42703          	lw	a4,-52(s0)
    800096ca:	15000793          	li	a5,336
    800096ce:	02f707b3          	mul	a5,a4,a5
    800096d2:	13078713          	addi	a4,a5,304
    800096d6:	0002b797          	auipc	a5,0x2b
    800096da:	5b278793          	addi	a5,a5,1458 # 80034c88 <disk>
    800096de:	97ba                	add	a5,a5,a4
    800096e0:	853e                	mv	a0,a5
    800096e2:	ffff8097          	auipc	ra,0xffff8
    800096e6:	c48080e7          	jalr	-952(ra) # 8000132a <acquire>
  disk[id].bw_transfer = busy_wait;
    800096ea:	0002b717          	auipc	a4,0x2b
    800096ee:	59e70713          	addi	a4,a4,1438 # 80034c88 <disk>
    800096f2:	fcc42683          	lw	a3,-52(s0)
    800096f6:	15000793          	li	a5,336
    800096fa:	02f687b3          	mul	a5,a3,a5
    800096fe:	97ba                	add	a5,a5,a4
    80009700:	fbc42703          	lw	a4,-68(s0)
    80009704:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    80009708:	fd040713          	addi	a4,s0,-48
    8000970c:	fcc42783          	lw	a5,-52(s0)
    80009710:	85ba                	mv	a1,a4
    80009712:	853e                	mv	a0,a5
    80009714:	00000097          	auipc	ra,0x0
    80009718:	eca080e7          	jalr	-310(ra) # 800095de <alloc3_desc>
    8000971c:	87aa                	mv	a5,a0
    8000971e:	c3e9                	beqz	a5,800097e0 <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    80009720:	fbc42783          	lw	a5,-68(s0)
    80009724:	2781                	sext.w	a5,a5
    80009726:	e3b9                	bnez	a5,8000976c <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    80009728:	fcc42703          	lw	a4,-52(s0)
    8000972c:	15000793          	li	a5,336
    80009730:	02f707b3          	mul	a5,a4,a5
    80009734:	02078713          	addi	a4,a5,32
    80009738:	0002b797          	auipc	a5,0x2b
    8000973c:	55078793          	addi	a5,a5,1360 # 80034c88 <disk>
    80009740:	00f706b3          	add	a3,a4,a5
    80009744:	fcc42703          	lw	a4,-52(s0)
    80009748:	15000793          	li	a5,336
    8000974c:	02f707b3          	mul	a5,a4,a5
    80009750:	13078713          	addi	a4,a5,304
    80009754:	0002b797          	auipc	a5,0x2b
    80009758:	53478793          	addi	a5,a5,1332 # 80034c88 <disk>
    8000975c:	97ba                	add	a5,a5,a4
    8000975e:	85be                	mv	a1,a5
    80009760:	8536                	mv	a0,a3
    80009762:	ffffa097          	auipc	ra,0xffffa
    80009766:	f26080e7          	jalr	-218(ra) # 80003688 <sleep>
    8000976a:	bf79                	j	80009708 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    8000976c:	fcc42703          	lw	a4,-52(s0)
    80009770:	15000793          	li	a5,336
    80009774:	02f707b3          	mul	a5,a4,a5
    80009778:	13078713          	addi	a4,a5,304
    8000977c:	0002b797          	auipc	a5,0x2b
    80009780:	50c78793          	addi	a5,a5,1292 # 80034c88 <disk>
    80009784:	97ba                	add	a5,a5,a4
    80009786:	853e                	mv	a0,a5
    80009788:	ffff8097          	auipc	ra,0xffff8
    8000978c:	c06080e7          	jalr	-1018(ra) # 8000138e <release>
        intr_on();
    80009790:	fffff097          	auipc	ra,0xfffff
    80009794:	500080e7          	jalr	1280(ra) # 80008c90 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    80009798:	0001                	nop
    8000979a:	fd040713          	addi	a4,s0,-48
    8000979e:	fcc42783          	lw	a5,-52(s0)
    800097a2:	85ba                	mv	a1,a4
    800097a4:	853e                	mv	a0,a5
    800097a6:	00000097          	auipc	ra,0x0
    800097aa:	e38080e7          	jalr	-456(ra) # 800095de <alloc3_desc>
    800097ae:	87aa                	mv	a5,a0
    800097b0:	f7ed                	bnez	a5,8000979a <virtio_disk_rw+0x108>
        intr_off();
    800097b2:	fffff097          	auipc	ra,0xfffff
    800097b6:	508080e7          	jalr	1288(ra) # 80008cba <intr_off>
        acquire(&disk[id].vdisk_lock);
    800097ba:	fcc42703          	lw	a4,-52(s0)
    800097be:	15000793          	li	a5,336
    800097c2:	02f707b3          	mul	a5,a4,a5
    800097c6:	13078713          	addi	a4,a5,304
    800097ca:	0002b797          	auipc	a5,0x2b
    800097ce:	4be78793          	addi	a5,a5,1214 # 80034c88 <disk>
    800097d2:	97ba                	add	a5,a5,a4
    800097d4:	853e                	mv	a0,a5
    800097d6:	ffff8097          	auipc	ra,0xffff8
    800097da:	b54080e7          	jalr	-1196(ra) # 8000132a <acquire>
    if(alloc3_desc(id, idx) == 0) {
    800097de:	b72d                	j	80009708 <virtio_disk_rw+0x76>
      break;
    800097e0:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    800097e2:	fd042683          	lw	a3,-48(s0)
    800097e6:	fcc42703          	lw	a4,-52(s0)
    800097ea:	87ba                	mv	a5,a4
    800097ec:	078a                	slli	a5,a5,0x2
    800097ee:	97ba                	add	a5,a5,a4
    800097f0:	078a                	slli	a5,a5,0x2
    800097f2:	97ba                	add	a5,a5,a4
    800097f4:	97b6                	add	a5,a5,a3
    800097f6:	07ad                	addi	a5,a5,11
    800097f8:	00479713          	slli	a4,a5,0x4
    800097fc:	0002b797          	auipc	a5,0x2b
    80009800:	48c78793          	addi	a5,a5,1164 # 80034c88 <disk>
    80009804:	97ba                	add	a5,a5,a4
    80009806:	fef43023          	sd	a5,-32(s0)

  if(write)
    8000980a:	fc842783          	lw	a5,-56(s0)
    8000980e:	2781                	sext.w	a5,a5
    80009810:	c791                	beqz	a5,8000981c <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009812:	fe043783          	ld	a5,-32(s0)
    80009816:	4705                	li	a4,1
    80009818:	c398                	sw	a4,0(a5)
    8000981a:	a029                	j	80009824 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000981c:	fe043783          	ld	a5,-32(s0)
    80009820:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009824:	fe043783          	ld	a5,-32(s0)
    80009828:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000982c:	fe043783          	ld	a5,-32(s0)
    80009830:	fe843703          	ld	a4,-24(s0)
    80009834:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    80009836:	0002b717          	auipc	a4,0x2b
    8000983a:	45270713          	addi	a4,a4,1106 # 80034c88 <disk>
    8000983e:	fcc42683          	lw	a3,-52(s0)
    80009842:	15000793          	li	a5,336
    80009846:	02f687b3          	mul	a5,a3,a5
    8000984a:	97ba                	add	a5,a5,a4
    8000984c:	6798                	ld	a4,8(a5)
    8000984e:	fd042783          	lw	a5,-48(s0)
    80009852:	0792                	slli	a5,a5,0x4
    80009854:	97ba                	add	a5,a5,a4
    80009856:	fe043703          	ld	a4,-32(s0)
    8000985a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    8000985c:	0002b717          	auipc	a4,0x2b
    80009860:	42c70713          	addi	a4,a4,1068 # 80034c88 <disk>
    80009864:	fcc42683          	lw	a3,-52(s0)
    80009868:	15000793          	li	a5,336
    8000986c:	02f687b3          	mul	a5,a3,a5
    80009870:	97ba                	add	a5,a5,a4
    80009872:	6798                	ld	a4,8(a5)
    80009874:	fd042783          	lw	a5,-48(s0)
    80009878:	0792                	slli	a5,a5,0x4
    8000987a:	97ba                	add	a5,a5,a4
    8000987c:	4741                	li	a4,16
    8000987e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009880:	0002b717          	auipc	a4,0x2b
    80009884:	40870713          	addi	a4,a4,1032 # 80034c88 <disk>
    80009888:	fcc42683          	lw	a3,-52(s0)
    8000988c:	15000793          	li	a5,336
    80009890:	02f687b3          	mul	a5,a3,a5
    80009894:	97ba                	add	a5,a5,a4
    80009896:	6798                	ld	a4,8(a5)
    80009898:	fd042783          	lw	a5,-48(s0)
    8000989c:	0792                	slli	a5,a5,0x4
    8000989e:	97ba                	add	a5,a5,a4
    800098a0:	4705                	li	a4,1
    800098a2:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    800098a6:	fd442603          	lw	a2,-44(s0)
    800098aa:	0002b717          	auipc	a4,0x2b
    800098ae:	3de70713          	addi	a4,a4,990 # 80034c88 <disk>
    800098b2:	fcc42683          	lw	a3,-52(s0)
    800098b6:	15000793          	li	a5,336
    800098ba:	02f687b3          	mul	a5,a3,a5
    800098be:	97ba                	add	a5,a5,a4
    800098c0:	6798                	ld	a4,8(a5)
    800098c2:	fd042783          	lw	a5,-48(s0)
    800098c6:	0792                	slli	a5,a5,0x4
    800098c8:	97ba                	add	a5,a5,a4
    800098ca:	03061713          	slli	a4,a2,0x30
    800098ce:	9341                	srli	a4,a4,0x30
    800098d0:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    800098d4:	fc043783          	ld	a5,-64(s0)
    800098d8:	05878613          	addi	a2,a5,88
    800098dc:	0002b717          	auipc	a4,0x2b
    800098e0:	3ac70713          	addi	a4,a4,940 # 80034c88 <disk>
    800098e4:	fcc42683          	lw	a3,-52(s0)
    800098e8:	15000793          	li	a5,336
    800098ec:	02f687b3          	mul	a5,a3,a5
    800098f0:	97ba                	add	a5,a5,a4
    800098f2:	6798                	ld	a4,8(a5)
    800098f4:	fd442783          	lw	a5,-44(s0)
    800098f8:	0792                	slli	a5,a5,0x4
    800098fa:	97ba                	add	a5,a5,a4
    800098fc:	8732                	mv	a4,a2
    800098fe:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    80009900:	0002b717          	auipc	a4,0x2b
    80009904:	38870713          	addi	a4,a4,904 # 80034c88 <disk>
    80009908:	fcc42683          	lw	a3,-52(s0)
    8000990c:	15000793          	li	a5,336
    80009910:	02f687b3          	mul	a5,a3,a5
    80009914:	97ba                	add	a5,a5,a4
    80009916:	6798                	ld	a4,8(a5)
    80009918:	fd442783          	lw	a5,-44(s0)
    8000991c:	0792                	slli	a5,a5,0x4
    8000991e:	97ba                	add	a5,a5,a4
    80009920:	40000713          	li	a4,1024
    80009924:	c798                	sw	a4,8(a5)
  if(write)
    80009926:	fc842783          	lw	a5,-56(s0)
    8000992a:	2781                	sext.w	a5,a5
    8000992c:	c785                	beqz	a5,80009954 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    8000992e:	0002b717          	auipc	a4,0x2b
    80009932:	35a70713          	addi	a4,a4,858 # 80034c88 <disk>
    80009936:	fcc42683          	lw	a3,-52(s0)
    8000993a:	15000793          	li	a5,336
    8000993e:	02f687b3          	mul	a5,a3,a5
    80009942:	97ba                	add	a5,a5,a4
    80009944:	6798                	ld	a4,8(a5)
    80009946:	fd442783          	lw	a5,-44(s0)
    8000994a:	0792                	slli	a5,a5,0x4
    8000994c:	97ba                	add	a5,a5,a4
    8000994e:	00079623          	sh	zero,12(a5)
    80009952:	a025                	j	8000997a <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009954:	0002b717          	auipc	a4,0x2b
    80009958:	33470713          	addi	a4,a4,820 # 80034c88 <disk>
    8000995c:	fcc42683          	lw	a3,-52(s0)
    80009960:	15000793          	li	a5,336
    80009964:	02f687b3          	mul	a5,a3,a5
    80009968:	97ba                	add	a5,a5,a4
    8000996a:	6798                	ld	a4,8(a5)
    8000996c:	fd442783          	lw	a5,-44(s0)
    80009970:	0792                	slli	a5,a5,0x4
    80009972:	97ba                	add	a5,a5,a4
    80009974:	4709                	li	a4,2
    80009976:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000997a:	0002b717          	auipc	a4,0x2b
    8000997e:	30e70713          	addi	a4,a4,782 # 80034c88 <disk>
    80009982:	fcc42683          	lw	a3,-52(s0)
    80009986:	15000793          	li	a5,336
    8000998a:	02f687b3          	mul	a5,a3,a5
    8000998e:	97ba                	add	a5,a5,a4
    80009990:	6798                	ld	a4,8(a5)
    80009992:	fd442783          	lw	a5,-44(s0)
    80009996:	0792                	slli	a5,a5,0x4
    80009998:	97ba                	add	a5,a5,a4
    8000999a:	00c7d703          	lhu	a4,12(a5)
    8000999e:	0002b697          	auipc	a3,0x2b
    800099a2:	2ea68693          	addi	a3,a3,746 # 80034c88 <disk>
    800099a6:	fcc42603          	lw	a2,-52(s0)
    800099aa:	15000793          	li	a5,336
    800099ae:	02f607b3          	mul	a5,a2,a5
    800099b2:	97b6                	add	a5,a5,a3
    800099b4:	6794                	ld	a3,8(a5)
    800099b6:	fd442783          	lw	a5,-44(s0)
    800099ba:	0792                	slli	a5,a5,0x4
    800099bc:	97b6                	add	a5,a5,a3
    800099be:	00176713          	ori	a4,a4,1
    800099c2:	1742                	slli	a4,a4,0x30
    800099c4:	9341                	srli	a4,a4,0x30
    800099c6:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    800099ca:	fd842603          	lw	a2,-40(s0)
    800099ce:	0002b717          	auipc	a4,0x2b
    800099d2:	2ba70713          	addi	a4,a4,698 # 80034c88 <disk>
    800099d6:	fcc42683          	lw	a3,-52(s0)
    800099da:	15000793          	li	a5,336
    800099de:	02f687b3          	mul	a5,a3,a5
    800099e2:	97ba                	add	a5,a5,a4
    800099e4:	6798                	ld	a4,8(a5)
    800099e6:	fd442783          	lw	a5,-44(s0)
    800099ea:	0792                	slli	a5,a5,0x4
    800099ec:	97ba                	add	a5,a5,a4
    800099ee:	03061713          	slli	a4,a2,0x30
    800099f2:	9341                	srli	a4,a4,0x30
    800099f4:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    800099f8:	fd042603          	lw	a2,-48(s0)
    800099fc:	0002b697          	auipc	a3,0x2b
    80009a00:	28c68693          	addi	a3,a3,652 # 80034c88 <disk>
    80009a04:	fcc42703          	lw	a4,-52(s0)
    80009a08:	87ba                	mv	a5,a4
    80009a0a:	078a                	slli	a5,a5,0x2
    80009a0c:	97ba                	add	a5,a5,a4
    80009a0e:	078a                	slli	a5,a5,0x2
    80009a10:	97ba                	add	a5,a5,a4
    80009a12:	97b2                	add	a5,a5,a2
    80009a14:	078d                	addi	a5,a5,3
    80009a16:	0792                	slli	a5,a5,0x4
    80009a18:	97b6                	add	a5,a5,a3
    80009a1a:	577d                	li	a4,-1
    80009a1c:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009a20:	fd042683          	lw	a3,-48(s0)
    80009a24:	fcc42703          	lw	a4,-52(s0)
    80009a28:	87ba                	mv	a5,a4
    80009a2a:	078a                	slli	a5,a5,0x2
    80009a2c:	97ba                	add	a5,a5,a4
    80009a2e:	078a                	slli	a5,a5,0x2
    80009a30:	97ba                	add	a5,a5,a4
    80009a32:	97b6                	add	a5,a5,a3
    80009a34:	078d                	addi	a5,a5,3
    80009a36:	00479713          	slli	a4,a5,0x4
    80009a3a:	0002b797          	auipc	a5,0x2b
    80009a3e:	24e78793          	addi	a5,a5,590 # 80034c88 <disk>
    80009a42:	97ba                	add	a5,a5,a4
    80009a44:	00878613          	addi	a2,a5,8
    80009a48:	0002b717          	auipc	a4,0x2b
    80009a4c:	24070713          	addi	a4,a4,576 # 80034c88 <disk>
    80009a50:	fcc42683          	lw	a3,-52(s0)
    80009a54:	15000793          	li	a5,336
    80009a58:	02f687b3          	mul	a5,a3,a5
    80009a5c:	97ba                	add	a5,a5,a4
    80009a5e:	6798                	ld	a4,8(a5)
    80009a60:	fd842783          	lw	a5,-40(s0)
    80009a64:	0792                	slli	a5,a5,0x4
    80009a66:	97ba                	add	a5,a5,a4
    80009a68:	8732                	mv	a4,a2
    80009a6a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    80009a6c:	0002b717          	auipc	a4,0x2b
    80009a70:	21c70713          	addi	a4,a4,540 # 80034c88 <disk>
    80009a74:	fcc42683          	lw	a3,-52(s0)
    80009a78:	15000793          	li	a5,336
    80009a7c:	02f687b3          	mul	a5,a3,a5
    80009a80:	97ba                	add	a5,a5,a4
    80009a82:	6798                	ld	a4,8(a5)
    80009a84:	fd842783          	lw	a5,-40(s0)
    80009a88:	0792                	slli	a5,a5,0x4
    80009a8a:	97ba                	add	a5,a5,a4
    80009a8c:	4705                	li	a4,1
    80009a8e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009a90:	0002b717          	auipc	a4,0x2b
    80009a94:	1f870713          	addi	a4,a4,504 # 80034c88 <disk>
    80009a98:	fcc42683          	lw	a3,-52(s0)
    80009a9c:	15000793          	li	a5,336
    80009aa0:	02f687b3          	mul	a5,a3,a5
    80009aa4:	97ba                	add	a5,a5,a4
    80009aa6:	6798                	ld	a4,8(a5)
    80009aa8:	fd842783          	lw	a5,-40(s0)
    80009aac:	0792                	slli	a5,a5,0x4
    80009aae:	97ba                	add	a5,a5,a4
    80009ab0:	4709                	li	a4,2
    80009ab2:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009ab6:	0002b717          	auipc	a4,0x2b
    80009aba:	1d270713          	addi	a4,a4,466 # 80034c88 <disk>
    80009abe:	fcc42683          	lw	a3,-52(s0)
    80009ac2:	15000793          	li	a5,336
    80009ac6:	02f687b3          	mul	a5,a3,a5
    80009aca:	97ba                	add	a5,a5,a4
    80009acc:	6798                	ld	a4,8(a5)
    80009ace:	fd842783          	lw	a5,-40(s0)
    80009ad2:	0792                	slli	a5,a5,0x4
    80009ad4:	97ba                	add	a5,a5,a4
    80009ad6:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009ada:	fc043783          	ld	a5,-64(s0)
    80009ade:	4705                	li	a4,1
    80009ae0:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    80009ae2:	fd042603          	lw	a2,-48(s0)
    80009ae6:	0002b697          	auipc	a3,0x2b
    80009aea:	1a268693          	addi	a3,a3,418 # 80034c88 <disk>
    80009aee:	fcc42703          	lw	a4,-52(s0)
    80009af2:	87ba                	mv	a5,a4
    80009af4:	078a                	slli	a5,a5,0x2
    80009af6:	97ba                	add	a5,a5,a4
    80009af8:	078a                	slli	a5,a5,0x2
    80009afa:	97ba                	add	a5,a5,a4
    80009afc:	97b2                	add	a5,a5,a2
    80009afe:	078d                	addi	a5,a5,3
    80009b00:	0792                	slli	a5,a5,0x4
    80009b02:	97b6                	add	a5,a5,a3
    80009b04:	fc043703          	ld	a4,-64(s0)
    80009b08:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009b0a:	fd042583          	lw	a1,-48(s0)
    80009b0e:	0002b717          	auipc	a4,0x2b
    80009b12:	17a70713          	addi	a4,a4,378 # 80034c88 <disk>
    80009b16:	fcc42683          	lw	a3,-52(s0)
    80009b1a:	15000793          	li	a5,336
    80009b1e:	02f687b3          	mul	a5,a3,a5
    80009b22:	97ba                	add	a5,a5,a4
    80009b24:	6b94                	ld	a3,16(a5)
    80009b26:	0002b717          	auipc	a4,0x2b
    80009b2a:	16270713          	addi	a4,a4,354 # 80034c88 <disk>
    80009b2e:	fcc42603          	lw	a2,-52(s0)
    80009b32:	15000793          	li	a5,336
    80009b36:	02f607b3          	mul	a5,a2,a5
    80009b3a:	97ba                	add	a5,a5,a4
    80009b3c:	6b9c                	ld	a5,16(a5)
    80009b3e:	0027d783          	lhu	a5,2(a5)
    80009b42:	2781                	sext.w	a5,a5
    80009b44:	8b9d                	andi	a5,a5,7
    80009b46:	2781                	sext.w	a5,a5
    80009b48:	03059713          	slli	a4,a1,0x30
    80009b4c:	9341                	srli	a4,a4,0x30
    80009b4e:	0786                	slli	a5,a5,0x1
    80009b50:	97b6                	add	a5,a5,a3
    80009b52:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009b56:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009b5a:	0002b717          	auipc	a4,0x2b
    80009b5e:	12e70713          	addi	a4,a4,302 # 80034c88 <disk>
    80009b62:	fcc42683          	lw	a3,-52(s0)
    80009b66:	15000793          	li	a5,336
    80009b6a:	02f687b3          	mul	a5,a3,a5
    80009b6e:	97ba                	add	a5,a5,a4
    80009b70:	6b9c                	ld	a5,16(a5)
    80009b72:	0027d703          	lhu	a4,2(a5)
    80009b76:	0002b697          	auipc	a3,0x2b
    80009b7a:	11268693          	addi	a3,a3,274 # 80034c88 <disk>
    80009b7e:	fcc42603          	lw	a2,-52(s0)
    80009b82:	15000793          	li	a5,336
    80009b86:	02f607b3          	mul	a5,a2,a5
    80009b8a:	97b6                	add	a5,a5,a3
    80009b8c:	6b9c                	ld	a5,16(a5)
    80009b8e:	2705                	addiw	a4,a4,1
    80009b90:	1742                	slli	a4,a4,0x30
    80009b92:	9341                	srli	a4,a4,0x30
    80009b94:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009b98:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009b9c:	fcc42703          	lw	a4,-52(s0)
    80009ba0:	67c1                	lui	a5,0x10
    80009ba2:	0785                	addi	a5,a5,1
    80009ba4:	97ba                	add	a5,a5,a4
    80009ba6:	07b2                	slli	a5,a5,0xc
    80009ba8:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009bac:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009bb0:	a871                	j	80009c4c <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009bb2:	fbc42783          	lw	a5,-68(s0)
    80009bb6:	2781                	sext.w	a5,a5
    80009bb8:	e795                	bnez	a5,80009be4 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009bba:	fcc42703          	lw	a4,-52(s0)
    80009bbe:	15000793          	li	a5,336
    80009bc2:	02f707b3          	mul	a5,a4,a5
    80009bc6:	13078713          	addi	a4,a5,304
    80009bca:	0002b797          	auipc	a5,0x2b
    80009bce:	0be78793          	addi	a5,a5,190 # 80034c88 <disk>
    80009bd2:	97ba                	add	a5,a5,a4
    80009bd4:	85be                	mv	a1,a5
    80009bd6:	fc043503          	ld	a0,-64(s0)
    80009bda:	ffffa097          	auipc	ra,0xffffa
    80009bde:	aae080e7          	jalr	-1362(ra) # 80003688 <sleep>
    80009be2:	a0ad                	j	80009c4c <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009be4:	fcc42703          	lw	a4,-52(s0)
    80009be8:	15000793          	li	a5,336
    80009bec:	02f707b3          	mul	a5,a4,a5
    80009bf0:	13078713          	addi	a4,a5,304
    80009bf4:	0002b797          	auipc	a5,0x2b
    80009bf8:	09478793          	addi	a5,a5,148 # 80034c88 <disk>
    80009bfc:	97ba                	add	a5,a5,a4
    80009bfe:	853e                	mv	a0,a5
    80009c00:	ffff7097          	auipc	ra,0xffff7
    80009c04:	78e080e7          	jalr	1934(ra) # 8000138e <release>
        intr_on();
    80009c08:	fffff097          	auipc	ra,0xfffff
    80009c0c:	088080e7          	jalr	136(ra) # 80008c90 <intr_on>
        while(b->disk == 1);
    80009c10:	0001                	nop
    80009c12:	fc043783          	ld	a5,-64(s0)
    80009c16:	43dc                	lw	a5,4(a5)
    80009c18:	873e                	mv	a4,a5
    80009c1a:	4785                	li	a5,1
    80009c1c:	fef70be3          	beq	a4,a5,80009c12 <virtio_disk_rw+0x580>
        intr_off();
    80009c20:	fffff097          	auipc	ra,0xfffff
    80009c24:	09a080e7          	jalr	154(ra) # 80008cba <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009c28:	fcc42703          	lw	a4,-52(s0)
    80009c2c:	15000793          	li	a5,336
    80009c30:	02f707b3          	mul	a5,a4,a5
    80009c34:	13078713          	addi	a4,a5,304
    80009c38:	0002b797          	auipc	a5,0x2b
    80009c3c:	05078793          	addi	a5,a5,80 # 80034c88 <disk>
    80009c40:	97ba                	add	a5,a5,a4
    80009c42:	853e                	mv	a0,a5
    80009c44:	ffff7097          	auipc	ra,0xffff7
    80009c48:	6e6080e7          	jalr	1766(ra) # 8000132a <acquire>
  while(b->disk == 1) {
    80009c4c:	fc043783          	ld	a5,-64(s0)
    80009c50:	43dc                	lw	a5,4(a5)
    80009c52:	873e                	mv	a4,a5
    80009c54:	4785                	li	a5,1
    80009c56:	f4f70ee3          	beq	a4,a5,80009bb2 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    80009c5a:	fd042603          	lw	a2,-48(s0)
    80009c5e:	0002b697          	auipc	a3,0x2b
    80009c62:	02a68693          	addi	a3,a3,42 # 80034c88 <disk>
    80009c66:	fcc42703          	lw	a4,-52(s0)
    80009c6a:	87ba                	mv	a5,a4
    80009c6c:	078a                	slli	a5,a5,0x2
    80009c6e:	97ba                	add	a5,a5,a4
    80009c70:	078a                	slli	a5,a5,0x2
    80009c72:	97ba                	add	a5,a5,a4
    80009c74:	97b2                	add	a5,a5,a2
    80009c76:	078d                	addi	a5,a5,3
    80009c78:	0792                	slli	a5,a5,0x4
    80009c7a:	97b6                	add	a5,a5,a3
    80009c7c:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    80009c80:	fd042703          	lw	a4,-48(s0)
    80009c84:	fcc42783          	lw	a5,-52(s0)
    80009c88:	85ba                	mv	a1,a4
    80009c8a:	853e                	mv	a0,a5
    80009c8c:	00000097          	auipc	ra,0x0
    80009c90:	8b8080e7          	jalr	-1864(ra) # 80009544 <free_chain>

  release(&disk[id].vdisk_lock);
    80009c94:	fcc42703          	lw	a4,-52(s0)
    80009c98:	15000793          	li	a5,336
    80009c9c:	02f707b3          	mul	a5,a4,a5
    80009ca0:	13078713          	addi	a4,a5,304
    80009ca4:	0002b797          	auipc	a5,0x2b
    80009ca8:	fe478793          	addi	a5,a5,-28 # 80034c88 <disk>
    80009cac:	97ba                	add	a5,a5,a4
    80009cae:	853e                	mv	a0,a5
    80009cb0:	ffff7097          	auipc	ra,0xffff7
    80009cb4:	6de080e7          	jalr	1758(ra) # 8000138e <release>
}
    80009cb8:	0001                	nop
    80009cba:	60a6                	ld	ra,72(sp)
    80009cbc:	6406                	ld	s0,64(sp)
    80009cbe:	6161                	addi	sp,sp,80
    80009cc0:	8082                	ret

0000000080009cc2 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009cc2:	7179                	addi	sp,sp,-48
    80009cc4:	f406                	sd	ra,40(sp)
    80009cc6:	f022                	sd	s0,32(sp)
    80009cc8:	1800                	addi	s0,sp,48
    80009cca:	87aa                	mv	a5,a0
    80009ccc:	fcb43823          	sd	a1,-48(s0)
    80009cd0:	8732                	mv	a4,a2
    80009cd2:	fcf42e23          	sw	a5,-36(s0)
    80009cd6:	87ba                	mv	a5,a4
    80009cd8:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009cdc:	0002b797          	auipc	a5,0x2b
    80009ce0:	24c78793          	addi	a5,a5,588 # 80034f28 <swap_buffer>
    80009ce4:	639c                	ld	a5,0(a5)
    80009ce6:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009cea:	fdc42703          	lw	a4,-36(s0)
    80009cee:	fe843783          	ld	a5,-24(s0)
    80009cf2:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    80009cf4:	fe843783          	ld	a5,-24(s0)
    80009cf8:	05878793          	addi	a5,a5,88
    80009cfc:	40000613          	li	a2,1024
    80009d00:	fd043583          	ld	a1,-48(s0)
    80009d04:	853e                	mv	a0,a5
    80009d06:	ffff8097          	auipc	ra,0xffff8
    80009d0a:	8dc080e7          	jalr	-1828(ra) # 800015e2 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    80009d0e:	fd842783          	lw	a5,-40(s0)
    80009d12:	86be                	mv	a3,a5
    80009d14:	4605                	li	a2,1
    80009d16:	fe843583          	ld	a1,-24(s0)
    80009d1a:	4505                	li	a0,1
    80009d1c:	00000097          	auipc	ra,0x0
    80009d20:	976080e7          	jalr	-1674(ra) # 80009692 <virtio_disk_rw>
}
    80009d24:	0001                	nop
    80009d26:	70a2                	ld	ra,40(sp)
    80009d28:	7402                	ld	s0,32(sp)
    80009d2a:	6145                	addi	sp,sp,48
    80009d2c:	8082                	ret

0000000080009d2e <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009d2e:	7179                	addi	sp,sp,-48
    80009d30:	f406                	sd	ra,40(sp)
    80009d32:	f022                	sd	s0,32(sp)
    80009d34:	1800                	addi	s0,sp,48
    80009d36:	87aa                	mv	a5,a0
    80009d38:	fcb43823          	sd	a1,-48(s0)
    80009d3c:	8732                	mv	a4,a2
    80009d3e:	fcf42e23          	sw	a5,-36(s0)
    80009d42:	87ba                	mv	a5,a4
    80009d44:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009d48:	0002b797          	auipc	a5,0x2b
    80009d4c:	1e078793          	addi	a5,a5,480 # 80034f28 <swap_buffer>
    80009d50:	639c                	ld	a5,0(a5)
    80009d52:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009d56:	fdc42703          	lw	a4,-36(s0)
    80009d5a:	fe843783          	ld	a5,-24(s0)
    80009d5e:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    80009d60:	fd842783          	lw	a5,-40(s0)
    80009d64:	86be                	mv	a3,a5
    80009d66:	4601                	li	a2,0
    80009d68:	fe843583          	ld	a1,-24(s0)
    80009d6c:	4505                	li	a0,1
    80009d6e:	00000097          	auipc	ra,0x0
    80009d72:	924080e7          	jalr	-1756(ra) # 80009692 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009d76:	fe843783          	ld	a5,-24(s0)
    80009d7a:	05878793          	addi	a5,a5,88
    80009d7e:	40000613          	li	a2,1024
    80009d82:	85be                	mv	a1,a5
    80009d84:	fd043503          	ld	a0,-48(s0)
    80009d88:	ffff8097          	auipc	ra,0xffff8
    80009d8c:	85a080e7          	jalr	-1958(ra) # 800015e2 <memmove>
}
    80009d90:	0001                	nop
    80009d92:	70a2                	ld	ra,40(sp)
    80009d94:	7402                	ld	s0,32(sp)
    80009d96:	6145                	addi	sp,sp,48
    80009d98:	8082                	ret

0000000080009d9a <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    80009d9a:	7179                	addi	sp,sp,-48
    80009d9c:	f406                	sd	ra,40(sp)
    80009d9e:	f022                	sd	s0,32(sp)
    80009da0:	1800                	addi	s0,sp,48
    80009da2:	87aa                	mv	a5,a0
    80009da4:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    80009da8:	fdc42703          	lw	a4,-36(s0)
    80009dac:	15000793          	li	a5,336
    80009db0:	02f707b3          	mul	a5,a4,a5
    80009db4:	13078713          	addi	a4,a5,304
    80009db8:	0002b797          	auipc	a5,0x2b
    80009dbc:	ed078793          	addi	a5,a5,-304 # 80034c88 <disk>
    80009dc0:	97ba                	add	a5,a5,a4
    80009dc2:	853e                	mv	a0,a5
    80009dc4:	ffff7097          	auipc	ra,0xffff7
    80009dc8:	566080e7          	jalr	1382(ra) # 8000132a <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80009dcc:	fdc42703          	lw	a4,-36(s0)
    80009dd0:	67c1                	lui	a5,0x10
    80009dd2:	0785                	addi	a5,a5,1
    80009dd4:	97ba                	add	a5,a5,a4
    80009dd6:	07b2                	slli	a5,a5,0xc
    80009dd8:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    80009ddc:	439c                	lw	a5,0(a5)
    80009dde:	0007869b          	sext.w	a3,a5
    80009de2:	fdc42703          	lw	a4,-36(s0)
    80009de6:	67c1                	lui	a5,0x10
    80009de8:	0785                	addi	a5,a5,1
    80009dea:	97ba                	add	a5,a5,a4
    80009dec:	07b2                	slli	a5,a5,0xc
    80009dee:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    80009df2:	873e                	mv	a4,a5
    80009df4:	87b6                	mv	a5,a3
    80009df6:	8b8d                	andi	a5,a5,3
    80009df8:	2781                	sext.w	a5,a5
    80009dfa:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    80009dfc:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    80009e00:	aa05                	j	80009f30 <virtio_disk_intr+0x196>
    __sync_synchronize();
    80009e02:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    80009e06:	0002b717          	auipc	a4,0x2b
    80009e0a:	e8270713          	addi	a4,a4,-382 # 80034c88 <disk>
    80009e0e:	fdc42683          	lw	a3,-36(s0)
    80009e12:	15000793          	li	a5,336
    80009e16:	02f687b3          	mul	a5,a3,a5
    80009e1a:	97ba                	add	a5,a5,a4
    80009e1c:	6f98                	ld	a4,24(a5)
    80009e1e:	0002b697          	auipc	a3,0x2b
    80009e22:	e6a68693          	addi	a3,a3,-406 # 80034c88 <disk>
    80009e26:	fdc42603          	lw	a2,-36(s0)
    80009e2a:	15000793          	li	a5,336
    80009e2e:	02f607b3          	mul	a5,a2,a5
    80009e32:	97b6                	add	a5,a5,a3
    80009e34:	0287d783          	lhu	a5,40(a5)
    80009e38:	2781                	sext.w	a5,a5
    80009e3a:	8b9d                	andi	a5,a5,7
    80009e3c:	2781                	sext.w	a5,a5
    80009e3e:	078e                	slli	a5,a5,0x3
    80009e40:	97ba                	add	a5,a5,a4
    80009e42:	43dc                	lw	a5,4(a5)
    80009e44:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    80009e48:	0002b697          	auipc	a3,0x2b
    80009e4c:	e4068693          	addi	a3,a3,-448 # 80034c88 <disk>
    80009e50:	fec42603          	lw	a2,-20(s0)
    80009e54:	fdc42703          	lw	a4,-36(s0)
    80009e58:	87ba                	mv	a5,a4
    80009e5a:	078a                	slli	a5,a5,0x2
    80009e5c:	97ba                	add	a5,a5,a4
    80009e5e:	078a                	slli	a5,a5,0x2
    80009e60:	97ba                	add	a5,a5,a4
    80009e62:	97b2                	add	a5,a5,a2
    80009e64:	078d                	addi	a5,a5,3
    80009e66:	0792                	slli	a5,a5,0x4
    80009e68:	97b6                	add	a5,a5,a3
    80009e6a:	0087c783          	lbu	a5,8(a5)
    80009e6e:	c79d                	beqz	a5,80009e9c <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    80009e70:	0002b717          	auipc	a4,0x2b
    80009e74:	e1870713          	addi	a4,a4,-488 # 80034c88 <disk>
    80009e78:	fdc42683          	lw	a3,-36(s0)
    80009e7c:	15000793          	li	a5,336
    80009e80:	02f687b3          	mul	a5,a3,a5
    80009e84:	97ba                	add	a5,a5,a4
    80009e86:	639c                	ld	a5,0(a5)
    80009e88:	00002617          	auipc	a2,0x2
    80009e8c:	91060613          	addi	a2,a2,-1776 # 8000b798 <etext+0x798>
    80009e90:	85be                	mv	a1,a5
    80009e92:	4509                	li	a0,2
    80009e94:	ffff7097          	auipc	ra,0xffff7
    80009e98:	e4a080e7          	jalr	-438(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    80009e9c:	0002b697          	auipc	a3,0x2b
    80009ea0:	dec68693          	addi	a3,a3,-532 # 80034c88 <disk>
    80009ea4:	fec42603          	lw	a2,-20(s0)
    80009ea8:	fdc42703          	lw	a4,-36(s0)
    80009eac:	87ba                	mv	a5,a4
    80009eae:	078a                	slli	a5,a5,0x2
    80009eb0:	97ba                	add	a5,a5,a4
    80009eb2:	078a                	slli	a5,a5,0x2
    80009eb4:	97ba                	add	a5,a5,a4
    80009eb6:	97b2                	add	a5,a5,a2
    80009eb8:	078d                	addi	a5,a5,3
    80009eba:	0792                	slli	a5,a5,0x4
    80009ebc:	97b6                	add	a5,a5,a3
    80009ebe:	639c                	ld	a5,0(a5)
    80009ec0:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009ec4:	fe043783          	ld	a5,-32(s0)
    80009ec8:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    80009ecc:	0002b717          	auipc	a4,0x2b
    80009ed0:	dbc70713          	addi	a4,a4,-580 # 80034c88 <disk>
    80009ed4:	fdc42683          	lw	a3,-36(s0)
    80009ed8:	15000793          	li	a5,336
    80009edc:	02f687b3          	mul	a5,a3,a5
    80009ee0:	97ba                	add	a5,a5,a4
    80009ee2:	1487a783          	lw	a5,328(a5)
    80009ee6:	e799                	bnez	a5,80009ef4 <virtio_disk_intr+0x15a>
        wakeup(b);
    80009ee8:	fe043503          	ld	a0,-32(s0)
    80009eec:	ffffa097          	auipc	ra,0xffffa
    80009ef0:	818080e7          	jalr	-2024(ra) # 80003704 <wakeup>
    }

    disk[id].used_idx += 1;
    80009ef4:	0002b717          	auipc	a4,0x2b
    80009ef8:	d9470713          	addi	a4,a4,-620 # 80034c88 <disk>
    80009efc:	fdc42683          	lw	a3,-36(s0)
    80009f00:	15000793          	li	a5,336
    80009f04:	02f687b3          	mul	a5,a3,a5
    80009f08:	97ba                	add	a5,a5,a4
    80009f0a:	0287d783          	lhu	a5,40(a5)
    80009f0e:	2785                	addiw	a5,a5,1
    80009f10:	03079713          	slli	a4,a5,0x30
    80009f14:	9341                	srli	a4,a4,0x30
    80009f16:	0002b697          	auipc	a3,0x2b
    80009f1a:	d7268693          	addi	a3,a3,-654 # 80034c88 <disk>
    80009f1e:	fdc42603          	lw	a2,-36(s0)
    80009f22:	15000793          	li	a5,336
    80009f26:	02f607b3          	mul	a5,a2,a5
    80009f2a:	97b6                	add	a5,a5,a3
    80009f2c:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    80009f30:	0002b717          	auipc	a4,0x2b
    80009f34:	d5870713          	addi	a4,a4,-680 # 80034c88 <disk>
    80009f38:	fdc42683          	lw	a3,-36(s0)
    80009f3c:	15000793          	li	a5,336
    80009f40:	02f687b3          	mul	a5,a3,a5
    80009f44:	97ba                	add	a5,a5,a4
    80009f46:	0287d603          	lhu	a2,40(a5)
    80009f4a:	0002b717          	auipc	a4,0x2b
    80009f4e:	d3e70713          	addi	a4,a4,-706 # 80034c88 <disk>
    80009f52:	fdc42683          	lw	a3,-36(s0)
    80009f56:	15000793          	li	a5,336
    80009f5a:	02f687b3          	mul	a5,a3,a5
    80009f5e:	97ba                	add	a5,a5,a4
    80009f60:	6f9c                	ld	a5,24(a5)
    80009f62:	0027d783          	lhu	a5,2(a5)
    80009f66:	0006071b          	sext.w	a4,a2
    80009f6a:	2781                	sext.w	a5,a5
    80009f6c:	e8f71be3          	bne	a4,a5,80009e02 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    80009f70:	fdc42703          	lw	a4,-36(s0)
    80009f74:	15000793          	li	a5,336
    80009f78:	02f707b3          	mul	a5,a4,a5
    80009f7c:	13078713          	addi	a4,a5,304
    80009f80:	0002b797          	auipc	a5,0x2b
    80009f84:	d0878793          	addi	a5,a5,-760 # 80034c88 <disk>
    80009f88:	97ba                	add	a5,a5,a4
    80009f8a:	853e                	mv	a0,a5
    80009f8c:	ffff7097          	auipc	ra,0xffff7
    80009f90:	402080e7          	jalr	1026(ra) # 8000138e <release>
}
    80009f94:	0001                	nop
    80009f96:	70a2                	ld	ra,40(sp)
    80009f98:	7402                	ld	s0,32(sp)
    80009f9a:	6145                	addi	sp,sp,48
    80009f9c:	8082                	ret
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
