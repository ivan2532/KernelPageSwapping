
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	98813103          	ld	sp,-1656(sp) # 8000c988 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffd4817>
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
    800001fe:	6ca78793          	addi	a5,a5,1738 # 800018c4 <main>
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
    800002e6:	6ee70713          	addi	a4,a4,1774 # 800149d0 <timer_scratch>
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
    80000408:	4f6080e7          	jalr	1270(ra) # 800038fa <either_copyin>
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
    80000478:	69c50513          	addi	a0,a0,1692 # 80014b10 <cons>
    8000047c:	00001097          	auipc	ra,0x1
    80000480:	ec0080e7          	jalr	-320(ra) # 8000133c <acquire>
  while(n > 0){
    80000484:	a23d                	j	800005b2 <consoleread+0x160>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    80000486:	00002097          	auipc	ra,0x2
    8000048a:	5b0080e7          	jalr	1456(ra) # 80002a36 <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	3b4080e7          	jalr	948(ra) # 80003846 <killed>
    8000049a:	87aa                	mv	a5,a0
    8000049c:	cb99                	beqz	a5,800004b2 <consoleread+0x60>
        release(&cons.lock);
    8000049e:	00014517          	auipc	a0,0x14
    800004a2:	67250513          	addi	a0,a0,1650 # 80014b10 <cons>
    800004a6:	00001097          	auipc	ra,0x1
    800004aa:	efa080e7          	jalr	-262(ra) # 800013a0 <release>
        return -1;
    800004ae:	57fd                	li	a5,-1
    800004b0:	aa25                	j	800005e8 <consoleread+0x196>
      }
      sleep(&cons.r, &cons.lock);
    800004b2:	00014597          	auipc	a1,0x14
    800004b6:	65e58593          	addi	a1,a1,1630 # 80014b10 <cons>
    800004ba:	00014517          	auipc	a0,0x14
    800004be:	6ee50513          	addi	a0,a0,1774 # 80014ba8 <cons+0x98>
    800004c2:	00003097          	auipc	ra,0x3
    800004c6:	176080e7          	jalr	374(ra) # 80003638 <sleep>
    while(cons.r == cons.w){
    800004ca:	00014797          	auipc	a5,0x14
    800004ce:	64678793          	addi	a5,a5,1606 # 80014b10 <cons>
    800004d2:	0987a703          	lw	a4,152(a5)
    800004d6:	00014797          	auipc	a5,0x14
    800004da:	63a78793          	addi	a5,a5,1594 # 80014b10 <cons>
    800004de:	09c7a783          	lw	a5,156(a5)
    800004e2:	faf702e3          	beq	a4,a5,80000486 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
    800004e6:	00014797          	auipc	a5,0x14
    800004ea:	62a78793          	addi	a5,a5,1578 # 80014b10 <cons>
    800004ee:	0987a783          	lw	a5,152(a5)
    800004f2:	2781                	sext.w	a5,a5
    800004f4:	0017871b          	addiw	a4,a5,1
    800004f8:	0007069b          	sext.w	a3,a4
    800004fc:	00014717          	auipc	a4,0x14
    80000500:	61470713          	addi	a4,a4,1556 # 80014b10 <cons>
    80000504:	08d72c23          	sw	a3,152(a4)
    80000508:	07f7f793          	andi	a5,a5,127
    8000050c:	2781                	sext.w	a5,a5
    8000050e:	00014717          	auipc	a4,0x14
    80000512:	60270713          	addi	a4,a4,1538 # 80014b10 <cons>
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
    80000544:	5d078793          	addi	a5,a5,1488 # 80014b10 <cons>
    80000548:	0987a783          	lw	a5,152(a5)
    8000054c:	37fd                	addiw	a5,a5,-1
    8000054e:	0007871b          	sext.w	a4,a5
    80000552:	00014797          	auipc	a5,0x14
    80000556:	5be78793          	addi	a5,a5,1470 # 80014b10 <cons>
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
    80000582:	308080e7          	jalr	776(ra) # 80003886 <either_copyout>
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
    800005cc:	54850513          	addi	a0,a0,1352 # 80014b10 <cons>
    800005d0:	00001097          	auipc	ra,0x1
    800005d4:	dd0080e7          	jalr	-560(ra) # 800013a0 <release>

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
    80000604:	51050513          	addi	a0,a0,1296 # 80014b10 <cons>
    80000608:	00001097          	auipc	ra,0x1
    8000060c:	d34080e7          	jalr	-716(ra) # 8000133c <acquire>

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
    8000066c:	306080e7          	jalr	774(ra) # 8000396e <procdump>
    break;
    80000670:	aad9                	j	80000846 <consoleintr+0x254>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
      cons.e--;
    80000672:	00014797          	auipc	a5,0x14
    80000676:	49e78793          	addi	a5,a5,1182 # 80014b10 <cons>
    8000067a:	0a07a783          	lw	a5,160(a5)
    8000067e:	37fd                	addiw	a5,a5,-1
    80000680:	0007871b          	sext.w	a4,a5
    80000684:	00014797          	auipc	a5,0x14
    80000688:	48c78793          	addi	a5,a5,1164 # 80014b10 <cons>
    8000068c:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000690:	10000513          	li	a0,256
    80000694:	00000097          	auipc	ra,0x0
    80000698:	cde080e7          	jalr	-802(ra) # 80000372 <consputc>
    while(cons.e != cons.w &&
    8000069c:	00014797          	auipc	a5,0x14
    800006a0:	47478793          	addi	a5,a5,1140 # 80014b10 <cons>
    800006a4:	0a07a703          	lw	a4,160(a5)
    800006a8:	00014797          	auipc	a5,0x14
    800006ac:	46878793          	addi	a5,a5,1128 # 80014b10 <cons>
    800006b0:	09c7a783          	lw	a5,156(a5)
    800006b4:	18f70463          	beq	a4,a5,8000083c <consoleintr+0x24a>
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
    800006b8:	00014797          	auipc	a5,0x14
    800006bc:	45878793          	addi	a5,a5,1112 # 80014b10 <cons>
    800006c0:	0a07a783          	lw	a5,160(a5)
    800006c4:	37fd                	addiw	a5,a5,-1
    800006c6:	2781                	sext.w	a5,a5
    800006c8:	07f7f793          	andi	a5,a5,127
    800006cc:	2781                	sext.w	a5,a5
    800006ce:	00014717          	auipc	a4,0x14
    800006d2:	44270713          	addi	a4,a4,1090 # 80014b10 <cons>
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
    800006ee:	42678793          	addi	a5,a5,1062 # 80014b10 <cons>
    800006f2:	0a07a703          	lw	a4,160(a5)
    800006f6:	00014797          	auipc	a5,0x14
    800006fa:	41a78793          	addi	a5,a5,1050 # 80014b10 <cons>
    800006fe:	09c7a783          	lw	a5,156(a5)
    80000702:	12f70f63          	beq	a4,a5,80000840 <consoleintr+0x24e>
      cons.e--;
    80000706:	00014797          	auipc	a5,0x14
    8000070a:	40a78793          	addi	a5,a5,1034 # 80014b10 <cons>
    8000070e:	0a07a783          	lw	a5,160(a5)
    80000712:	37fd                	addiw	a5,a5,-1
    80000714:	0007871b          	sext.w	a4,a5
    80000718:	00014797          	auipc	a5,0x14
    8000071c:	3f878793          	addi	a5,a5,1016 # 80014b10 <cons>
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
    80000740:	3d478793          	addi	a5,a5,980 # 80014b10 <cons>
    80000744:	0a07a703          	lw	a4,160(a5)
    80000748:	00014797          	auipc	a5,0x14
    8000074c:	3c878793          	addi	a5,a5,968 # 80014b10 <cons>
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
    80000790:	38478793          	addi	a5,a5,900 # 80014b10 <cons>
    80000794:	0a07a783          	lw	a5,160(a5)
    80000798:	2781                	sext.w	a5,a5
    8000079a:	0017871b          	addiw	a4,a5,1
    8000079e:	0007069b          	sext.w	a3,a4
    800007a2:	00014717          	auipc	a4,0x14
    800007a6:	36e70713          	addi	a4,a4,878 # 80014b10 <cons>
    800007aa:	0ad72023          	sw	a3,160(a4)
    800007ae:	07f7f793          	andi	a5,a5,127
    800007b2:	2781                	sext.w	a5,a5
    800007b4:	fec42703          	lw	a4,-20(s0)
    800007b8:	0ff77713          	andi	a4,a4,255
    800007bc:	00014697          	auipc	a3,0x14
    800007c0:	35468693          	addi	a3,a3,852 # 80014b10 <cons>
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
    800007ee:	32678793          	addi	a5,a5,806 # 80014b10 <cons>
    800007f2:	0a07a703          	lw	a4,160(a5)
    800007f6:	00014797          	auipc	a5,0x14
    800007fa:	31a78793          	addi	a5,a5,794 # 80014b10 <cons>
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
    80000816:	2fe78793          	addi	a5,a5,766 # 80014b10 <cons>
    8000081a:	0a07a703          	lw	a4,160(a5)
    8000081e:	00014797          	auipc	a5,0x14
    80000822:	2f278793          	addi	a5,a5,754 # 80014b10 <cons>
    80000826:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000082a:	00014517          	auipc	a0,0x14
    8000082e:	37e50513          	addi	a0,a0,894 # 80014ba8 <cons+0x98>
    80000832:	00003097          	auipc	ra,0x3
    80000836:	e82080e7          	jalr	-382(ra) # 800036b4 <wakeup>
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
    8000084a:	2ca50513          	addi	a0,a0,714 # 80014b10 <cons>
    8000084e:	00001097          	auipc	ra,0x1
    80000852:	b52080e7          	jalr	-1198(ra) # 800013a0 <release>
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
    80000874:	2a050513          	addi	a0,a0,672 # 80014b10 <cons>
    80000878:	00001097          	auipc	ra,0x1
    8000087c:	a94080e7          	jalr	-1388(ra) # 8000130c <initlock>

  uartinit();
    80000880:	00000097          	auipc	ra,0x0
    80000884:	540080e7          	jalr	1344(ra) # 80000dc0 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80000888:	00024797          	auipc	a5,0x24
    8000088c:	42878793          	addi	a5,a5,1064 # 80024cb0 <devsw>
    80000890:	00000717          	auipc	a4,0x0
    80000894:	bc270713          	addi	a4,a4,-1086 # 80000452 <consoleread>
    80000898:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089a:	00024797          	auipc	a5,0x24
    8000089e:	41678793          	addi	a5,a5,1046 # 80024cb0 <devsw>
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
    80000930:	f2468693          	addi	a3,a3,-220 # 8000c850 <digits>
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
    800009f4:	e6070713          	addi	a4,a4,-416 # 8000c850 <digits>
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
    80000a58:	16478793          	addi	a5,a5,356 # 80014bb8 <pr>
    80000a5c:	4f9c                	lw	a5,24(a5)
    80000a5e:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a62:	fdc42783          	lw	a5,-36(s0)
    80000a66:	2781                	sext.w	a5,a5
    80000a68:	cb89                	beqz	a5,80000a7a <printf+0x44>
    acquire(&pr.lock);
    80000a6a:	00014517          	auipc	a0,0x14
    80000a6e:	14e50513          	addi	a0,a0,334 # 80014bb8 <pr>
    80000a72:	00001097          	auipc	ra,0x1
    80000a76:	8ca080e7          	jalr	-1846(ra) # 8000133c <acquire>

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
    80000c76:	f4650513          	addi	a0,a0,-186 # 80014bb8 <pr>
    80000c7a:	00000097          	auipc	ra,0x0
    80000c7e:	726080e7          	jalr	1830(ra) # 800013a0 <release>
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
    80000c9c:	f2078793          	addi	a5,a5,-224 # 80014bb8 <pr>
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
    80000cd4:	cd078793          	addi	a5,a5,-816 # 8000c9a0 <panicked>
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
    80000d02:	eba78793          	addi	a5,a5,-326 # 80014bb8 <pr>
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
    80000d80:	c2478793          	addi	a5,a5,-988 # 8000c9a0 <panicked>
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
    80000d9e:	e1e50513          	addi	a0,a0,-482 # 80014bb8 <pr>
    80000da2:	00000097          	auipc	ra,0x0
    80000da6:	56a080e7          	jalr	1386(ra) # 8000130c <initlock>
  pr.locking = 1;
    80000daa:	00014797          	auipc	a5,0x14
    80000dae:	e0e78793          	addi	a5,a5,-498 # 80014bb8 <pr>
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
    80000e24:	db850513          	addi	a0,a0,-584 # 80014bd8 <uart_tx_lock>
    80000e28:	00000097          	auipc	ra,0x0
    80000e2c:	4e4080e7          	jalr	1252(ra) # 8000130c <initlock>
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
    80000e4c:	d9050513          	addi	a0,a0,-624 # 80014bd8 <uart_tx_lock>
    80000e50:	00000097          	auipc	ra,0x0
    80000e54:	4ec080e7          	jalr	1260(ra) # 8000133c <acquire>

  if(panicked){
    80000e58:	0000c797          	auipc	a5,0xc
    80000e5c:	b4878793          	addi	a5,a5,-1208 # 8000c9a0 <panicked>
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
    80000e6c:	d7058593          	addi	a1,a1,-656 # 80014bd8 <uart_tx_lock>
    80000e70:	0000c517          	auipc	a0,0xc
    80000e74:	b4050513          	addi	a0,a0,-1216 # 8000c9b0 <uart_tx_r>
    80000e78:	00002097          	auipc	ra,0x2
    80000e7c:	7c0080e7          	jalr	1984(ra) # 80003638 <sleep>
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000e80:	0000c797          	auipc	a5,0xc
    80000e84:	b3078793          	addi	a5,a5,-1232 # 8000c9b0 <uart_tx_r>
    80000e88:	639c                	ld	a5,0(a5)
    80000e8a:	02078713          	addi	a4,a5,32
    80000e8e:	0000c797          	auipc	a5,0xc
    80000e92:	b1a78793          	addi	a5,a5,-1254 # 8000c9a8 <uart_tx_w>
    80000e96:	639c                	ld	a5,0(a5)
    80000e98:	fcf708e3          	beq	a4,a5,80000e68 <uartputc+0x2e>
  }
  uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000e9c:	0000c797          	auipc	a5,0xc
    80000ea0:	b0c78793          	addi	a5,a5,-1268 # 8000c9a8 <uart_tx_w>
    80000ea4:	639c                	ld	a5,0(a5)
    80000ea6:	8bfd                	andi	a5,a5,31
    80000ea8:	fec42703          	lw	a4,-20(s0)
    80000eac:	0ff77713          	andi	a4,a4,255
    80000eb0:	00014697          	auipc	a3,0x14
    80000eb4:	d4068693          	addi	a3,a3,-704 # 80014bf0 <uart_tx_buf>
    80000eb8:	97b6                	add	a5,a5,a3
    80000eba:	00e78023          	sb	a4,0(a5)
  uart_tx_w += 1;
    80000ebe:	0000c797          	auipc	a5,0xc
    80000ec2:	aea78793          	addi	a5,a5,-1302 # 8000c9a8 <uart_tx_w>
    80000ec6:	639c                	ld	a5,0(a5)
    80000ec8:	00178713          	addi	a4,a5,1
    80000ecc:	0000c797          	auipc	a5,0xc
    80000ed0:	adc78793          	addi	a5,a5,-1316 # 8000c9a8 <uart_tx_w>
    80000ed4:	e398                	sd	a4,0(a5)
  uartstart();
    80000ed6:	00000097          	auipc	ra,0x0
    80000eda:	084080e7          	jalr	132(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    80000ede:	00014517          	auipc	a0,0x14
    80000ee2:	cfa50513          	addi	a0,a0,-774 # 80014bd8 <uart_tx_lock>
    80000ee6:	00000097          	auipc	ra,0x0
    80000eea:	4ba080e7          	jalr	1210(ra) # 800013a0 <release>
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
    80000f0a:	534080e7          	jalr	1332(ra) # 8000143a <push_off>

  if(panicked){
    80000f0e:	0000c797          	auipc	a5,0xc
    80000f12:	a9278793          	addi	a5,a5,-1390 # 8000c9a0 <panicked>
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
    80000f4c:	54a080e7          	jalr	1354(ra) # 80001492 <pop_off>
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
    80000f66:	a4678793          	addi	a5,a5,-1466 # 8000c9a8 <uart_tx_w>
    80000f6a:	6398                	ld	a4,0(a5)
    80000f6c:	0000c797          	auipc	a5,0xc
    80000f70:	a4478793          	addi	a5,a5,-1468 # 8000c9b0 <uart_tx_r>
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
    80000f96:	a1e78793          	addi	a5,a5,-1506 # 8000c9b0 <uart_tx_r>
    80000f9a:	639c                	ld	a5,0(a5)
    80000f9c:	8bfd                	andi	a5,a5,31
    80000f9e:	00014717          	auipc	a4,0x14
    80000fa2:	c5270713          	addi	a4,a4,-942 # 80014bf0 <uart_tx_buf>
    80000fa6:	97ba                	add	a5,a5,a4
    80000fa8:	0007c783          	lbu	a5,0(a5)
    80000fac:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000fb0:	0000c797          	auipc	a5,0xc
    80000fb4:	a0078793          	addi	a5,a5,-1536 # 8000c9b0 <uart_tx_r>
    80000fb8:	639c                	ld	a5,0(a5)
    80000fba:	00178713          	addi	a4,a5,1
    80000fbe:	0000c797          	auipc	a5,0xc
    80000fc2:	9f278793          	addi	a5,a5,-1550 # 8000c9b0 <uart_tx_r>
    80000fc6:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000fc8:	0000c517          	auipc	a0,0xc
    80000fcc:	9e850513          	addi	a0,a0,-1560 # 8000c9b0 <uart_tx_r>
    80000fd0:	00002097          	auipc	ra,0x2
    80000fd4:	6e4080e7          	jalr	1764(ra) # 800036b4 <wakeup>
    
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
    80001068:	b7450513          	addi	a0,a0,-1164 # 80014bd8 <uart_tx_lock>
    8000106c:	00000097          	auipc	ra,0x0
    80001070:	2d0080e7          	jalr	720(ra) # 8000133c <acquire>
  uartstart();
    80001074:	00000097          	auipc	ra,0x0
    80001078:	ee6080e7          	jalr	-282(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    8000107c:	00014517          	auipc	a0,0x14
    80001080:	b5c50513          	addi	a0,a0,-1188 # 80014bd8 <uart_tx_lock>
    80001084:	00000097          	auipc	ra,0x0
    80001088:	31c080e7          	jalr	796(ra) # 800013a0 <release>
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
    800010aa:	b6a50513          	addi	a0,a0,-1174 # 80014c10 <kmem>
    800010ae:	00000097          	auipc	ra,0x0
    800010b2:	25e080e7          	jalr	606(ra) # 8000130c <initlock>
  freerange(end, (void*)PHYSTOP);
    800010b6:	008017b7          	lui	a5,0x801
    800010ba:	00879593          	slli	a1,a5,0x8
    800010be:	00029517          	auipc	a0,0x29
    800010c2:	f2a50513          	addi	a0,a0,-214 # 80029fe8 <end>
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
    8000114c:	00029797          	auipc	a5,0x29
    80001150:	e9c78793          	addi	a5,a5,-356 # 80029fe8 <end>
    80001154:	00f76963          	bltu	a4,a5,80001166 <kfree+0x36>
    80001158:	fd843703          	ld	a4,-40(s0)
    8000115c:	008017b7          	lui	a5,0x801
    80001160:	07a2                	slli	a5,a5,0x8
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
    80001182:	392080e7          	jalr	914(ra) # 80001510 <memset>

  r = (struct run*)pa;
    80001186:	fd843783          	ld	a5,-40(s0)
    8000118a:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    8000118e:	00014517          	auipc	a0,0x14
    80001192:	a8250513          	addi	a0,a0,-1406 # 80014c10 <kmem>
    80001196:	00000097          	auipc	ra,0x0
    8000119a:	1a6080e7          	jalr	422(ra) # 8000133c <acquire>
  r->next = kmem.freelist;
    8000119e:	00014797          	auipc	a5,0x14
    800011a2:	a7278793          	addi	a5,a5,-1422 # 80014c10 <kmem>
    800011a6:	6f98                	ld	a4,24(a5)
    800011a8:	fe843783          	ld	a5,-24(s0)
    800011ac:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800011ae:	00014797          	auipc	a5,0x14
    800011b2:	a6278793          	addi	a5,a5,-1438 # 80014c10 <kmem>
    800011b6:	fe843703          	ld	a4,-24(s0)
    800011ba:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    800011bc:	00014517          	auipc	a0,0x14
    800011c0:	a5450513          	addi	a0,a0,-1452 # 80014c10 <kmem>
    800011c4:	00000097          	auipc	ra,0x0
    800011c8:	1dc080e7          	jalr	476(ra) # 800013a0 <release>
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
    800011de:	00014517          	auipc	a0,0x14
    800011e2:	a3250513          	addi	a0,a0,-1486 # 80014c10 <kmem>
    800011e6:	00000097          	auipc	ra,0x0
    800011ea:	156080e7          	jalr	342(ra) # 8000133c <acquire>
  r = kmem.freelist;
    800011ee:	00014797          	auipc	a5,0x14
    800011f2:	a2278793          	addi	a5,a5,-1502 # 80014c10 <kmem>
    800011f6:	6f9c                	ld	a5,24(a5)
    800011f8:	fef43423          	sd	a5,-24(s0)
  if(r)
    800011fc:	fe843783          	ld	a5,-24(s0)
    80001200:	cb89                	beqz	a5,80001212 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001202:	fe843783          	ld	a5,-24(s0)
    80001206:	6398                	ld	a4,0(a5)
    80001208:	00014797          	auipc	a5,0x14
    8000120c:	a0878793          	addi	a5,a5,-1528 # 80014c10 <kmem>
    80001210:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001212:	00014517          	auipc	a0,0x14
    80001216:	9fe50513          	addi	a0,a0,-1538 # 80014c10 <kmem>
    8000121a:	00000097          	auipc	ra,0x0
    8000121e:	186080e7          	jalr	390(ra) # 800013a0 <release>

  if(!r)
    80001222:	fe843783          	ld	a5,-24(s0)
    80001226:	e799                	bnez	a5,80001234 <kalloc+0x5e>
    r = swapout();
    80001228:	00009097          	auipc	ra,0x9
    8000122c:	56e080e7          	jalr	1390(ra) # 8000a796 <swapout>
    80001230:	fea43423          	sd	a0,-24(s0)

  if(r)
    80001234:	fe843783          	ld	a5,-24(s0)
    80001238:	cb89                	beqz	a5,8000124a <kalloc+0x74>
    memset((char*)r, 5, PGSIZE); // fill with junk
    8000123a:	6605                	lui	a2,0x1
    8000123c:	4595                	li	a1,5
    8000123e:	fe843503          	ld	a0,-24(s0)
    80001242:	00000097          	auipc	ra,0x0
    80001246:	2ce080e7          	jalr	718(ra) # 80001510 <memset>
  return (void*)r;
    8000124a:	fe843783          	ld	a5,-24(s0)
}
    8000124e:	853e                	mv	a0,a5
    80001250:	60e2                	ld	ra,24(sp)
    80001252:	6442                	ld	s0,16(sp)
    80001254:	6105                	addi	sp,sp,32
    80001256:	8082                	ret

0000000080001258 <r_sstatus>:
{
    80001258:	1101                	addi	sp,sp,-32
    8000125a:	ec22                	sd	s0,24(sp)
    8000125c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000125e:	100027f3          	csrr	a5,sstatus
    80001262:	fef43423          	sd	a5,-24(s0)
  return x;
    80001266:	fe843783          	ld	a5,-24(s0)
}
    8000126a:	853e                	mv	a0,a5
    8000126c:	6462                	ld	s0,24(sp)
    8000126e:	6105                	addi	sp,sp,32
    80001270:	8082                	ret

0000000080001272 <w_sstatus>:
{
    80001272:	1101                	addi	sp,sp,-32
    80001274:	ec22                	sd	s0,24(sp)
    80001276:	1000                	addi	s0,sp,32
    80001278:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    8000127c:	fe843783          	ld	a5,-24(s0)
    80001280:	10079073          	csrw	sstatus,a5
}
    80001284:	0001                	nop
    80001286:	6462                	ld	s0,24(sp)
    80001288:	6105                	addi	sp,sp,32
    8000128a:	8082                	ret

000000008000128c <intr_on>:
{
    8000128c:	1141                	addi	sp,sp,-16
    8000128e:	e406                	sd	ra,8(sp)
    80001290:	e022                	sd	s0,0(sp)
    80001292:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80001294:	00000097          	auipc	ra,0x0
    80001298:	fc4080e7          	jalr	-60(ra) # 80001258 <r_sstatus>
    8000129c:	87aa                	mv	a5,a0
    8000129e:	0027e793          	ori	a5,a5,2
    800012a2:	853e                	mv	a0,a5
    800012a4:	00000097          	auipc	ra,0x0
    800012a8:	fce080e7          	jalr	-50(ra) # 80001272 <w_sstatus>
}
    800012ac:	0001                	nop
    800012ae:	60a2                	ld	ra,8(sp)
    800012b0:	6402                	ld	s0,0(sp)
    800012b2:	0141                	addi	sp,sp,16
    800012b4:	8082                	ret

00000000800012b6 <intr_off>:
{
    800012b6:	1141                	addi	sp,sp,-16
    800012b8:	e406                	sd	ra,8(sp)
    800012ba:	e022                	sd	s0,0(sp)
    800012bc:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    800012be:	00000097          	auipc	ra,0x0
    800012c2:	f9a080e7          	jalr	-102(ra) # 80001258 <r_sstatus>
    800012c6:	87aa                	mv	a5,a0
    800012c8:	9bf5                	andi	a5,a5,-3
    800012ca:	853e                	mv	a0,a5
    800012cc:	00000097          	auipc	ra,0x0
    800012d0:	fa6080e7          	jalr	-90(ra) # 80001272 <w_sstatus>
}
    800012d4:	0001                	nop
    800012d6:	60a2                	ld	ra,8(sp)
    800012d8:	6402                	ld	s0,0(sp)
    800012da:	0141                	addi	sp,sp,16
    800012dc:	8082                	ret

00000000800012de <intr_get>:
{
    800012de:	1101                	addi	sp,sp,-32
    800012e0:	ec06                	sd	ra,24(sp)
    800012e2:	e822                	sd	s0,16(sp)
    800012e4:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800012e6:	00000097          	auipc	ra,0x0
    800012ea:	f72080e7          	jalr	-142(ra) # 80001258 <r_sstatus>
    800012ee:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800012f2:	fe843783          	ld	a5,-24(s0)
    800012f6:	8b89                	andi	a5,a5,2
    800012f8:	00f037b3          	snez	a5,a5
    800012fc:	0ff7f793          	andi	a5,a5,255
    80001300:	2781                	sext.w	a5,a5
}
    80001302:	853e                	mv	a0,a5
    80001304:	60e2                	ld	ra,24(sp)
    80001306:	6442                	ld	s0,16(sp)
    80001308:	6105                	addi	sp,sp,32
    8000130a:	8082                	ret

000000008000130c <initlock>:
#include "proc.h"
#include "defs.h"

void
initlock(struct spinlock *lk, char *name)
{
    8000130c:	1101                	addi	sp,sp,-32
    8000130e:	ec22                	sd	s0,24(sp)
    80001310:	1000                	addi	s0,sp,32
    80001312:	fea43423          	sd	a0,-24(s0)
    80001316:	feb43023          	sd	a1,-32(s0)
  lk->name = name;
    8000131a:	fe843783          	ld	a5,-24(s0)
    8000131e:	fe043703          	ld	a4,-32(s0)
    80001322:	e798                	sd	a4,8(a5)
  lk->locked = 0;
    80001324:	fe843783          	ld	a5,-24(s0)
    80001328:	0007a023          	sw	zero,0(a5)
  lk->cpu = 0;
    8000132c:	fe843783          	ld	a5,-24(s0)
    80001330:	0007b823          	sd	zero,16(a5)
}
    80001334:	0001                	nop
    80001336:	6462                	ld	s0,24(sp)
    80001338:	6105                	addi	sp,sp,32
    8000133a:	8082                	ret

000000008000133c <acquire>:

// Acquire the lock.
// Loops (spins) until the lock is acquired.
void
acquire(struct spinlock *lk)
{
    8000133c:	1101                	addi	sp,sp,-32
    8000133e:	ec06                	sd	ra,24(sp)
    80001340:	e822                	sd	s0,16(sp)
    80001342:	1000                	addi	s0,sp,32
    80001344:	fea43423          	sd	a0,-24(s0)
  push_off(); // disable interrupts to avoid deadlock.
    80001348:	00000097          	auipc	ra,0x0
    8000134c:	0f2080e7          	jalr	242(ra) # 8000143a <push_off>
  if(holding(lk))
    80001350:	fe843503          	ld	a0,-24(s0)
    80001354:	00000097          	auipc	ra,0x0
    80001358:	0a2080e7          	jalr	162(ra) # 800013f6 <holding>
    8000135c:	87aa                	mv	a5,a0
    8000135e:	cb89                	beqz	a5,80001370 <acquire+0x34>
    panic("acquire");
    80001360:	0000b517          	auipc	a0,0xb
    80001364:	cf050513          	addi	a0,a0,-784 # 8000c050 <etext+0x50>
    80001368:	00000097          	auipc	ra,0x0
    8000136c:	924080e7          	jalr	-1756(ra) # 80000c8c <panic>

  // On RISC-V, sync_lock_test_and_set turns into an atomic swap:
  //   a5 = 1
  //   s1 = &lk->locked
  //   amoswap.w.aq a5, a5, (s1)
  while(__sync_lock_test_and_set(&lk->locked, 1) != 0)
    80001370:	0001                	nop
    80001372:	fe843783          	ld	a5,-24(s0)
    80001376:	4705                	li	a4,1
    80001378:	0ce7a72f          	amoswap.w.aq	a4,a4,(a5)
    8000137c:	0007079b          	sext.w	a5,a4
    80001380:	fbed                	bnez	a5,80001372 <acquire+0x36>

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen strictly after the lock is acquired.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    80001382:	0ff0000f          	fence

  // Record info about lock acquisition for holding() and debugging.
  lk->cpu = mycpu();
    80001386:	00001097          	auipc	ra,0x1
    8000138a:	676080e7          	jalr	1654(ra) # 800029fc <mycpu>
    8000138e:	872a                	mv	a4,a0
    80001390:	fe843783          	ld	a5,-24(s0)
    80001394:	eb98                	sd	a4,16(a5)
}
    80001396:	0001                	nop
    80001398:	60e2                	ld	ra,24(sp)
    8000139a:	6442                	ld	s0,16(sp)
    8000139c:	6105                	addi	sp,sp,32
    8000139e:	8082                	ret

00000000800013a0 <release>:

// Release the lock.
void
release(struct spinlock *lk)
{
    800013a0:	1101                	addi	sp,sp,-32
    800013a2:	ec06                	sd	ra,24(sp)
    800013a4:	e822                	sd	s0,16(sp)
    800013a6:	1000                	addi	s0,sp,32
    800013a8:	fea43423          	sd	a0,-24(s0)
  if(!holding(lk))
    800013ac:	fe843503          	ld	a0,-24(s0)
    800013b0:	00000097          	auipc	ra,0x0
    800013b4:	046080e7          	jalr	70(ra) # 800013f6 <holding>
    800013b8:	87aa                	mv	a5,a0
    800013ba:	eb89                	bnez	a5,800013cc <release+0x2c>
    panic("release");
    800013bc:	0000b517          	auipc	a0,0xb
    800013c0:	c9c50513          	addi	a0,a0,-868 # 8000c058 <etext+0x58>
    800013c4:	00000097          	auipc	ra,0x0
    800013c8:	8c8080e7          	jalr	-1848(ra) # 80000c8c <panic>

  lk->cpu = 0;
    800013cc:	fe843783          	ld	a5,-24(s0)
    800013d0:	0007b823          	sd	zero,16(a5)
  // past this point, to ensure that all the stores in the critical
  // section are visible to other CPUs before the lock is released,
  // and that loads in the critical section occur strictly before
  // the lock is released.
  // On RISC-V, this emits a fence instruction.
  __sync_synchronize();
    800013d4:	0ff0000f          	fence
  // implies that an assignment might be implemented with
  // multiple store instructions.
  // On RISC-V, sync_lock_release turns into an atomic swap:
  //   s1 = &lk->locked
  //   amoswap.w zero, zero, (s1)
  __sync_lock_release(&lk->locked);
    800013d8:	fe843783          	ld	a5,-24(s0)
    800013dc:	0f50000f          	fence	iorw,ow
    800013e0:	0807a02f          	amoswap.w	zero,zero,(a5)

  pop_off();
    800013e4:	00000097          	auipc	ra,0x0
    800013e8:	0ae080e7          	jalr	174(ra) # 80001492 <pop_off>
}
    800013ec:	0001                	nop
    800013ee:	60e2                	ld	ra,24(sp)
    800013f0:	6442                	ld	s0,16(sp)
    800013f2:	6105                	addi	sp,sp,32
    800013f4:	8082                	ret

00000000800013f6 <holding>:

// Check whether this cpu is holding the lock.
// Interrupts must be off.
int
holding(struct spinlock *lk)
{
    800013f6:	7139                	addi	sp,sp,-64
    800013f8:	fc06                	sd	ra,56(sp)
    800013fa:	f822                	sd	s0,48(sp)
    800013fc:	f426                	sd	s1,40(sp)
    800013fe:	0080                	addi	s0,sp,64
    80001400:	fca43423          	sd	a0,-56(s0)
  int r;
  r = (lk->locked && lk->cpu == mycpu());
    80001404:	fc843783          	ld	a5,-56(s0)
    80001408:	439c                	lw	a5,0(a5)
    8000140a:	cf89                	beqz	a5,80001424 <holding+0x2e>
    8000140c:	fc843783          	ld	a5,-56(s0)
    80001410:	6b84                	ld	s1,16(a5)
    80001412:	00001097          	auipc	ra,0x1
    80001416:	5ea080e7          	jalr	1514(ra) # 800029fc <mycpu>
    8000141a:	87aa                	mv	a5,a0
    8000141c:	00f49463          	bne	s1,a5,80001424 <holding+0x2e>
    80001420:	4785                	li	a5,1
    80001422:	a011                	j	80001426 <holding+0x30>
    80001424:	4781                	li	a5,0
    80001426:	fcf42e23          	sw	a5,-36(s0)
  return r;
    8000142a:	fdc42783          	lw	a5,-36(s0)
}
    8000142e:	853e                	mv	a0,a5
    80001430:	70e2                	ld	ra,56(sp)
    80001432:	7442                	ld	s0,48(sp)
    80001434:	74a2                	ld	s1,40(sp)
    80001436:	6121                	addi	sp,sp,64
    80001438:	8082                	ret

000000008000143a <push_off>:
// it takes two pop_off()s to undo two push_off()s.  Also, if interrupts
// are initially off, then push_off, pop_off leaves them off.

void
push_off(void)
{
    8000143a:	1101                	addi	sp,sp,-32
    8000143c:	ec06                	sd	ra,24(sp)
    8000143e:	e822                	sd	s0,16(sp)
    80001440:	1000                	addi	s0,sp,32
  int old = intr_get();
    80001442:	00000097          	auipc	ra,0x0
    80001446:	e9c080e7          	jalr	-356(ra) # 800012de <intr_get>
    8000144a:	87aa                	mv	a5,a0
    8000144c:	fef42623          	sw	a5,-20(s0)

  intr_off();
    80001450:	00000097          	auipc	ra,0x0
    80001454:	e66080e7          	jalr	-410(ra) # 800012b6 <intr_off>
  if(mycpu()->noff == 0)
    80001458:	00001097          	auipc	ra,0x1
    8000145c:	5a4080e7          	jalr	1444(ra) # 800029fc <mycpu>
    80001460:	87aa                	mv	a5,a0
    80001462:	5fbc                	lw	a5,120(a5)
    80001464:	eb89                	bnez	a5,80001476 <push_off+0x3c>
    mycpu()->intena = old;
    80001466:	00001097          	auipc	ra,0x1
    8000146a:	596080e7          	jalr	1430(ra) # 800029fc <mycpu>
    8000146e:	872a                	mv	a4,a0
    80001470:	fec42783          	lw	a5,-20(s0)
    80001474:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    80001476:	00001097          	auipc	ra,0x1
    8000147a:	586080e7          	jalr	1414(ra) # 800029fc <mycpu>
    8000147e:	87aa                	mv	a5,a0
    80001480:	5fb8                	lw	a4,120(a5)
    80001482:	2705                	addiw	a4,a4,1
    80001484:	2701                	sext.w	a4,a4
    80001486:	dfb8                	sw	a4,120(a5)
}
    80001488:	0001                	nop
    8000148a:	60e2                	ld	ra,24(sp)
    8000148c:	6442                	ld	s0,16(sp)
    8000148e:	6105                	addi	sp,sp,32
    80001490:	8082                	ret

0000000080001492 <pop_off>:

void
pop_off(void)
{
    80001492:	1101                	addi	sp,sp,-32
    80001494:	ec06                	sd	ra,24(sp)
    80001496:	e822                	sd	s0,16(sp)
    80001498:	1000                	addi	s0,sp,32
  struct cpu *c = mycpu();
    8000149a:	00001097          	auipc	ra,0x1
    8000149e:	562080e7          	jalr	1378(ra) # 800029fc <mycpu>
    800014a2:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    800014a6:	00000097          	auipc	ra,0x0
    800014aa:	e38080e7          	jalr	-456(ra) # 800012de <intr_get>
    800014ae:	87aa                	mv	a5,a0
    800014b0:	cb89                	beqz	a5,800014c2 <pop_off+0x30>
    panic("pop_off - interruptible");
    800014b2:	0000b517          	auipc	a0,0xb
    800014b6:	bae50513          	addi	a0,a0,-1106 # 8000c060 <etext+0x60>
    800014ba:	fffff097          	auipc	ra,0xfffff
    800014be:	7d2080e7          	jalr	2002(ra) # 80000c8c <panic>
  if(c->noff < 1)
    800014c2:	fe843783          	ld	a5,-24(s0)
    800014c6:	5fbc                	lw	a5,120(a5)
    800014c8:	00f04a63          	bgtz	a5,800014dc <pop_off+0x4a>
    panic("pop_off");
    800014cc:	0000b517          	auipc	a0,0xb
    800014d0:	bac50513          	addi	a0,a0,-1108 # 8000c078 <etext+0x78>
    800014d4:	fffff097          	auipc	ra,0xfffff
    800014d8:	7b8080e7          	jalr	1976(ra) # 80000c8c <panic>
  c->noff -= 1;
    800014dc:	fe843783          	ld	a5,-24(s0)
    800014e0:	5fbc                	lw	a5,120(a5)
    800014e2:	37fd                	addiw	a5,a5,-1
    800014e4:	0007871b          	sext.w	a4,a5
    800014e8:	fe843783          	ld	a5,-24(s0)
    800014ec:	dfb8                	sw	a4,120(a5)
  if(c->noff == 0 && c->intena)
    800014ee:	fe843783          	ld	a5,-24(s0)
    800014f2:	5fbc                	lw	a5,120(a5)
    800014f4:	eb89                	bnez	a5,80001506 <pop_off+0x74>
    800014f6:	fe843783          	ld	a5,-24(s0)
    800014fa:	5ffc                	lw	a5,124(a5)
    800014fc:	c789                	beqz	a5,80001506 <pop_off+0x74>
    intr_on();
    800014fe:	00000097          	auipc	ra,0x0
    80001502:	d8e080e7          	jalr	-626(ra) # 8000128c <intr_on>
}
    80001506:	0001                	nop
    80001508:	60e2                	ld	ra,24(sp)
    8000150a:	6442                	ld	s0,16(sp)
    8000150c:	6105                	addi	sp,sp,32
    8000150e:	8082                	ret

0000000080001510 <memset>:
#include "types.h"

void*
memset(void *dst, int c, uint n)
{
    80001510:	7179                	addi	sp,sp,-48
    80001512:	f422                	sd	s0,40(sp)
    80001514:	1800                	addi	s0,sp,48
    80001516:	fca43c23          	sd	a0,-40(s0)
    8000151a:	87ae                	mv	a5,a1
    8000151c:	8732                	mv	a4,a2
    8000151e:	fcf42a23          	sw	a5,-44(s0)
    80001522:	87ba                	mv	a5,a4
    80001524:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    80001528:	fd843783          	ld	a5,-40(s0)
    8000152c:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    80001530:	fe042623          	sw	zero,-20(s0)
    80001534:	a00d                	j	80001556 <memset+0x46>
    cdst[i] = c;
    80001536:	fec42783          	lw	a5,-20(s0)
    8000153a:	fe043703          	ld	a4,-32(s0)
    8000153e:	97ba                	add	a5,a5,a4
    80001540:	fd442703          	lw	a4,-44(s0)
    80001544:	0ff77713          	andi	a4,a4,255
    80001548:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    8000154c:	fec42783          	lw	a5,-20(s0)
    80001550:	2785                	addiw	a5,a5,1
    80001552:	fef42623          	sw	a5,-20(s0)
    80001556:	fec42703          	lw	a4,-20(s0)
    8000155a:	fd042783          	lw	a5,-48(s0)
    8000155e:	2781                	sext.w	a5,a5
    80001560:	fcf76be3          	bltu	a4,a5,80001536 <memset+0x26>
  }
  return dst;
    80001564:	fd843783          	ld	a5,-40(s0)
}
    80001568:	853e                	mv	a0,a5
    8000156a:	7422                	ld	s0,40(sp)
    8000156c:	6145                	addi	sp,sp,48
    8000156e:	8082                	ret

0000000080001570 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
    80001570:	7139                	addi	sp,sp,-64
    80001572:	fc22                	sd	s0,56(sp)
    80001574:	0080                	addi	s0,sp,64
    80001576:	fca43c23          	sd	a0,-40(s0)
    8000157a:	fcb43823          	sd	a1,-48(s0)
    8000157e:	87b2                	mv	a5,a2
    80001580:	fcf42623          	sw	a5,-52(s0)
  const uchar *s1, *s2;

  s1 = v1;
    80001584:	fd843783          	ld	a5,-40(s0)
    80001588:	fef43423          	sd	a5,-24(s0)
  s2 = v2;
    8000158c:	fd043783          	ld	a5,-48(s0)
    80001590:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    80001594:	a0a1                	j	800015dc <memcmp+0x6c>
    if(*s1 != *s2)
    80001596:	fe843783          	ld	a5,-24(s0)
    8000159a:	0007c703          	lbu	a4,0(a5)
    8000159e:	fe043783          	ld	a5,-32(s0)
    800015a2:	0007c783          	lbu	a5,0(a5)
    800015a6:	02f70163          	beq	a4,a5,800015c8 <memcmp+0x58>
      return *s1 - *s2;
    800015aa:	fe843783          	ld	a5,-24(s0)
    800015ae:	0007c783          	lbu	a5,0(a5)
    800015b2:	0007871b          	sext.w	a4,a5
    800015b6:	fe043783          	ld	a5,-32(s0)
    800015ba:	0007c783          	lbu	a5,0(a5)
    800015be:	2781                	sext.w	a5,a5
    800015c0:	40f707bb          	subw	a5,a4,a5
    800015c4:	2781                	sext.w	a5,a5
    800015c6:	a01d                	j	800015ec <memcmp+0x7c>
    s1++, s2++;
    800015c8:	fe843783          	ld	a5,-24(s0)
    800015cc:	0785                	addi	a5,a5,1
    800015ce:	fef43423          	sd	a5,-24(s0)
    800015d2:	fe043783          	ld	a5,-32(s0)
    800015d6:	0785                	addi	a5,a5,1
    800015d8:	fef43023          	sd	a5,-32(s0)
  while(n-- > 0){
    800015dc:	fcc42783          	lw	a5,-52(s0)
    800015e0:	fff7871b          	addiw	a4,a5,-1
    800015e4:	fce42623          	sw	a4,-52(s0)
    800015e8:	f7dd                	bnez	a5,80001596 <memcmp+0x26>
  }

  return 0;
    800015ea:	4781                	li	a5,0
}
    800015ec:	853e                	mv	a0,a5
    800015ee:	7462                	ld	s0,56(sp)
    800015f0:	6121                	addi	sp,sp,64
    800015f2:	8082                	ret

00000000800015f4 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
    800015f4:	7139                	addi	sp,sp,-64
    800015f6:	fc22                	sd	s0,56(sp)
    800015f8:	0080                	addi	s0,sp,64
    800015fa:	fca43c23          	sd	a0,-40(s0)
    800015fe:	fcb43823          	sd	a1,-48(s0)
    80001602:	87b2                	mv	a5,a2
    80001604:	fcf42623          	sw	a5,-52(s0)
  const char *s;
  char *d;

  if(n == 0)
    80001608:	fcc42783          	lw	a5,-52(s0)
    8000160c:	2781                	sext.w	a5,a5
    8000160e:	e781                	bnez	a5,80001616 <memmove+0x22>
    return dst;
    80001610:	fd843783          	ld	a5,-40(s0)
    80001614:	a855                	j	800016c8 <memmove+0xd4>
  
  s = src;
    80001616:	fd043783          	ld	a5,-48(s0)
    8000161a:	fef43423          	sd	a5,-24(s0)
  d = dst;
    8000161e:	fd843783          	ld	a5,-40(s0)
    80001622:	fef43023          	sd	a5,-32(s0)
  if(s < d && s + n > d){
    80001626:	fe843703          	ld	a4,-24(s0)
    8000162a:	fe043783          	ld	a5,-32(s0)
    8000162e:	08f77463          	bgeu	a4,a5,800016b6 <memmove+0xc2>
    80001632:	fcc46783          	lwu	a5,-52(s0)
    80001636:	fe843703          	ld	a4,-24(s0)
    8000163a:	97ba                	add	a5,a5,a4
    8000163c:	fe043703          	ld	a4,-32(s0)
    80001640:	06f77b63          	bgeu	a4,a5,800016b6 <memmove+0xc2>
    s += n;
    80001644:	fcc46783          	lwu	a5,-52(s0)
    80001648:	fe843703          	ld	a4,-24(s0)
    8000164c:	97ba                	add	a5,a5,a4
    8000164e:	fef43423          	sd	a5,-24(s0)
    d += n;
    80001652:	fcc46783          	lwu	a5,-52(s0)
    80001656:	fe043703          	ld	a4,-32(s0)
    8000165a:	97ba                	add	a5,a5,a4
    8000165c:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    80001660:	a01d                	j	80001686 <memmove+0x92>
      *--d = *--s;
    80001662:	fe843783          	ld	a5,-24(s0)
    80001666:	17fd                	addi	a5,a5,-1
    80001668:	fef43423          	sd	a5,-24(s0)
    8000166c:	fe043783          	ld	a5,-32(s0)
    80001670:	17fd                	addi	a5,a5,-1
    80001672:	fef43023          	sd	a5,-32(s0)
    80001676:	fe843783          	ld	a5,-24(s0)
    8000167a:	0007c703          	lbu	a4,0(a5)
    8000167e:	fe043783          	ld	a5,-32(s0)
    80001682:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    80001686:	fcc42783          	lw	a5,-52(s0)
    8000168a:	fff7871b          	addiw	a4,a5,-1
    8000168e:	fce42623          	sw	a4,-52(s0)
    80001692:	fbe1                	bnez	a5,80001662 <memmove+0x6e>
  if(s < d && s + n > d){
    80001694:	a805                	j	800016c4 <memmove+0xd0>
  } else
    while(n-- > 0)
      *d++ = *s++;
    80001696:	fe843703          	ld	a4,-24(s0)
    8000169a:	00170793          	addi	a5,a4,1
    8000169e:	fef43423          	sd	a5,-24(s0)
    800016a2:	fe043783          	ld	a5,-32(s0)
    800016a6:	00178693          	addi	a3,a5,1
    800016aa:	fed43023          	sd	a3,-32(s0)
    800016ae:	00074703          	lbu	a4,0(a4)
    800016b2:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    800016b6:	fcc42783          	lw	a5,-52(s0)
    800016ba:	fff7871b          	addiw	a4,a5,-1
    800016be:	fce42623          	sw	a4,-52(s0)
    800016c2:	fbf1                	bnez	a5,80001696 <memmove+0xa2>

  return dst;
    800016c4:	fd843783          	ld	a5,-40(s0)
}
    800016c8:	853e                	mv	a0,a5
    800016ca:	7462                	ld	s0,56(sp)
    800016cc:	6121                	addi	sp,sp,64
    800016ce:	8082                	ret

00000000800016d0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
    800016d0:	7179                	addi	sp,sp,-48
    800016d2:	f406                	sd	ra,40(sp)
    800016d4:	f022                	sd	s0,32(sp)
    800016d6:	1800                	addi	s0,sp,48
    800016d8:	fea43423          	sd	a0,-24(s0)
    800016dc:	feb43023          	sd	a1,-32(s0)
    800016e0:	87b2                	mv	a5,a2
    800016e2:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    800016e6:	fdc42783          	lw	a5,-36(s0)
    800016ea:	863e                	mv	a2,a5
    800016ec:	fe043583          	ld	a1,-32(s0)
    800016f0:	fe843503          	ld	a0,-24(s0)
    800016f4:	00000097          	auipc	ra,0x0
    800016f8:	f00080e7          	jalr	-256(ra) # 800015f4 <memmove>
    800016fc:	87aa                	mv	a5,a0
}
    800016fe:	853e                	mv	a0,a5
    80001700:	70a2                	ld	ra,40(sp)
    80001702:	7402                	ld	s0,32(sp)
    80001704:	6145                	addi	sp,sp,48
    80001706:	8082                	ret

0000000080001708 <strncmp>:

int
strncmp(const char *p, const char *q, uint n)
{
    80001708:	7179                	addi	sp,sp,-48
    8000170a:	f422                	sd	s0,40(sp)
    8000170c:	1800                	addi	s0,sp,48
    8000170e:	fea43423          	sd	a0,-24(s0)
    80001712:	feb43023          	sd	a1,-32(s0)
    80001716:	87b2                	mv	a5,a2
    80001718:	fcf42e23          	sw	a5,-36(s0)
  while(n > 0 && *p && *p == *q)
    8000171c:	a005                	j	8000173c <strncmp+0x34>
    n--, p++, q++;
    8000171e:	fdc42783          	lw	a5,-36(s0)
    80001722:	37fd                	addiw	a5,a5,-1
    80001724:	fcf42e23          	sw	a5,-36(s0)
    80001728:	fe843783          	ld	a5,-24(s0)
    8000172c:	0785                	addi	a5,a5,1
    8000172e:	fef43423          	sd	a5,-24(s0)
    80001732:	fe043783          	ld	a5,-32(s0)
    80001736:	0785                	addi	a5,a5,1
    80001738:	fef43023          	sd	a5,-32(s0)
  while(n > 0 && *p && *p == *q)
    8000173c:	fdc42783          	lw	a5,-36(s0)
    80001740:	2781                	sext.w	a5,a5
    80001742:	c385                	beqz	a5,80001762 <strncmp+0x5a>
    80001744:	fe843783          	ld	a5,-24(s0)
    80001748:	0007c783          	lbu	a5,0(a5)
    8000174c:	cb99                	beqz	a5,80001762 <strncmp+0x5a>
    8000174e:	fe843783          	ld	a5,-24(s0)
    80001752:	0007c703          	lbu	a4,0(a5)
    80001756:	fe043783          	ld	a5,-32(s0)
    8000175a:	0007c783          	lbu	a5,0(a5)
    8000175e:	fcf700e3          	beq	a4,a5,8000171e <strncmp+0x16>
  if(n == 0)
    80001762:	fdc42783          	lw	a5,-36(s0)
    80001766:	2781                	sext.w	a5,a5
    80001768:	e399                	bnez	a5,8000176e <strncmp+0x66>
    return 0;
    8000176a:	4781                	li	a5,0
    8000176c:	a839                	j	8000178a <strncmp+0x82>
  return (uchar)*p - (uchar)*q;
    8000176e:	fe843783          	ld	a5,-24(s0)
    80001772:	0007c783          	lbu	a5,0(a5)
    80001776:	0007871b          	sext.w	a4,a5
    8000177a:	fe043783          	ld	a5,-32(s0)
    8000177e:	0007c783          	lbu	a5,0(a5)
    80001782:	2781                	sext.w	a5,a5
    80001784:	40f707bb          	subw	a5,a4,a5
    80001788:	2781                	sext.w	a5,a5
}
    8000178a:	853e                	mv	a0,a5
    8000178c:	7422                	ld	s0,40(sp)
    8000178e:	6145                	addi	sp,sp,48
    80001790:	8082                	ret

0000000080001792 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
    80001792:	7139                	addi	sp,sp,-64
    80001794:	fc22                	sd	s0,56(sp)
    80001796:	0080                	addi	s0,sp,64
    80001798:	fca43c23          	sd	a0,-40(s0)
    8000179c:	fcb43823          	sd	a1,-48(s0)
    800017a0:	87b2                	mv	a5,a2
    800017a2:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    800017a6:	fd843783          	ld	a5,-40(s0)
    800017aa:	fef43423          	sd	a5,-24(s0)
  while(n-- > 0 && (*s++ = *t++) != 0)
    800017ae:	0001                	nop
    800017b0:	fcc42783          	lw	a5,-52(s0)
    800017b4:	fff7871b          	addiw	a4,a5,-1
    800017b8:	fce42623          	sw	a4,-52(s0)
    800017bc:	02f05e63          	blez	a5,800017f8 <strncpy+0x66>
    800017c0:	fd043703          	ld	a4,-48(s0)
    800017c4:	00170793          	addi	a5,a4,1
    800017c8:	fcf43823          	sd	a5,-48(s0)
    800017cc:	fd843783          	ld	a5,-40(s0)
    800017d0:	00178693          	addi	a3,a5,1
    800017d4:	fcd43c23          	sd	a3,-40(s0)
    800017d8:	00074703          	lbu	a4,0(a4)
    800017dc:	00e78023          	sb	a4,0(a5)
    800017e0:	0007c783          	lbu	a5,0(a5)
    800017e4:	f7f1                	bnez	a5,800017b0 <strncpy+0x1e>
    ;
  while(n-- > 0)
    800017e6:	a809                	j	800017f8 <strncpy+0x66>
    *s++ = 0;
    800017e8:	fd843783          	ld	a5,-40(s0)
    800017ec:	00178713          	addi	a4,a5,1
    800017f0:	fce43c23          	sd	a4,-40(s0)
    800017f4:	00078023          	sb	zero,0(a5)
  while(n-- > 0)
    800017f8:	fcc42783          	lw	a5,-52(s0)
    800017fc:	fff7871b          	addiw	a4,a5,-1
    80001800:	fce42623          	sw	a4,-52(s0)
    80001804:	fef042e3          	bgtz	a5,800017e8 <strncpy+0x56>
  return os;
    80001808:	fe843783          	ld	a5,-24(s0)
}
    8000180c:	853e                	mv	a0,a5
    8000180e:	7462                	ld	s0,56(sp)
    80001810:	6121                	addi	sp,sp,64
    80001812:	8082                	ret

0000000080001814 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
    80001814:	7139                	addi	sp,sp,-64
    80001816:	fc22                	sd	s0,56(sp)
    80001818:	0080                	addi	s0,sp,64
    8000181a:	fca43c23          	sd	a0,-40(s0)
    8000181e:	fcb43823          	sd	a1,-48(s0)
    80001822:	87b2                	mv	a5,a2
    80001824:	fcf42623          	sw	a5,-52(s0)
  char *os;

  os = s;
    80001828:	fd843783          	ld	a5,-40(s0)
    8000182c:	fef43423          	sd	a5,-24(s0)
  if(n <= 0)
    80001830:	fcc42783          	lw	a5,-52(s0)
    80001834:	2781                	sext.w	a5,a5
    80001836:	00f04563          	bgtz	a5,80001840 <safestrcpy+0x2c>
    return os;
    8000183a:	fe843783          	ld	a5,-24(s0)
    8000183e:	a0a1                	j	80001886 <safestrcpy+0x72>
  while(--n > 0 && (*s++ = *t++) != 0)
    80001840:	fcc42783          	lw	a5,-52(s0)
    80001844:	37fd                	addiw	a5,a5,-1
    80001846:	fcf42623          	sw	a5,-52(s0)
    8000184a:	fcc42783          	lw	a5,-52(s0)
    8000184e:	2781                	sext.w	a5,a5
    80001850:	02f05563          	blez	a5,8000187a <safestrcpy+0x66>
    80001854:	fd043703          	ld	a4,-48(s0)
    80001858:	00170793          	addi	a5,a4,1
    8000185c:	fcf43823          	sd	a5,-48(s0)
    80001860:	fd843783          	ld	a5,-40(s0)
    80001864:	00178693          	addi	a3,a5,1
    80001868:	fcd43c23          	sd	a3,-40(s0)
    8000186c:	00074703          	lbu	a4,0(a4)
    80001870:	00e78023          	sb	a4,0(a5)
    80001874:	0007c783          	lbu	a5,0(a5)
    80001878:	f7e1                	bnez	a5,80001840 <safestrcpy+0x2c>
    ;
  *s = 0;
    8000187a:	fd843783          	ld	a5,-40(s0)
    8000187e:	00078023          	sb	zero,0(a5)
  return os;
    80001882:	fe843783          	ld	a5,-24(s0)
}
    80001886:	853e                	mv	a0,a5
    80001888:	7462                	ld	s0,56(sp)
    8000188a:	6121                	addi	sp,sp,64
    8000188c:	8082                	ret

000000008000188e <strlen>:

int
strlen(const char *s)
{
    8000188e:	7179                	addi	sp,sp,-48
    80001890:	f422                	sd	s0,40(sp)
    80001892:	1800                	addi	s0,sp,48
    80001894:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    80001898:	fe042623          	sw	zero,-20(s0)
    8000189c:	a031                	j	800018a8 <strlen+0x1a>
    8000189e:	fec42783          	lw	a5,-20(s0)
    800018a2:	2785                	addiw	a5,a5,1
    800018a4:	fef42623          	sw	a5,-20(s0)
    800018a8:	fec42783          	lw	a5,-20(s0)
    800018ac:	fd843703          	ld	a4,-40(s0)
    800018b0:	97ba                	add	a5,a5,a4
    800018b2:	0007c783          	lbu	a5,0(a5)
    800018b6:	f7e5                	bnez	a5,8000189e <strlen+0x10>
    ;
  return n;
    800018b8:	fec42783          	lw	a5,-20(s0)
}
    800018bc:	853e                	mv	a0,a5
    800018be:	7422                	ld	s0,40(sp)
    800018c0:	6145                	addi	sp,sp,48
    800018c2:	8082                	ret

00000000800018c4 <main>:
volatile static int started = 0;

// start() jumps here in supervisor mode on all CPUs.
void
main()
{
    800018c4:	1141                	addi	sp,sp,-16
    800018c6:	e406                	sd	ra,8(sp)
    800018c8:	e022                	sd	s0,0(sp)
    800018ca:	0800                	addi	s0,sp,16
  if(cpuid() == 0){
    800018cc:	00001097          	auipc	ra,0x1
    800018d0:	10c080e7          	jalr	268(ra) # 800029d8 <cpuid>
    800018d4:	87aa                	mv	a5,a0
    800018d6:	efe1                	bnez	a5,800019ae <main+0xea>
    consoleinit();
    800018d8:	fffff097          	auipc	ra,0xfffff
    800018dc:	f88080e7          	jalr	-120(ra) # 80000860 <consoleinit>
    printfinit();
    800018e0:	fffff097          	auipc	ra,0xfffff
    800018e4:	4aa080e7          	jalr	1194(ra) # 80000d8a <printfinit>
    printf("\n");
    800018e8:	0000a517          	auipc	a0,0xa
    800018ec:	79850513          	addi	a0,a0,1944 # 8000c080 <etext+0x80>
    800018f0:	fffff097          	auipc	ra,0xfffff
    800018f4:	146080e7          	jalr	326(ra) # 80000a36 <printf>
    printf("xv6 kernel is booting\n");
    800018f8:	0000a517          	auipc	a0,0xa
    800018fc:	79050513          	addi	a0,a0,1936 # 8000c088 <etext+0x88>
    80001900:	fffff097          	auipc	ra,0xfffff
    80001904:	136080e7          	jalr	310(ra) # 80000a36 <printf>
    printf("\n");
    80001908:	0000a517          	auipc	a0,0xa
    8000190c:	77850513          	addi	a0,a0,1912 # 8000c080 <etext+0x80>
    80001910:	fffff097          	auipc	ra,0xfffff
    80001914:	126080e7          	jalr	294(ra) # 80000a36 <printf>
    kinit();         // physical page allocator
    80001918:	fffff097          	auipc	ra,0xfffff
    8000191c:	77e080e7          	jalr	1918(ra) # 80001096 <kinit>
    kvminit();       // create kernel page table
    80001920:	00000097          	auipc	ra,0x0
    80001924:	22a080e7          	jalr	554(ra) # 80001b4a <kvminit>
    kvminithart();   // turn on paging
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	250080e7          	jalr	592(ra) # 80001b78 <kvminithart>
    procinit();      // process table
    80001930:	00001097          	auipc	ra,0x1
    80001934:	fda080e7          	jalr	-38(ra) # 8000290a <procinit>
    trapinit();      // trap vectors
    80001938:	00002097          	auipc	ra,0x2
    8000193c:	31e080e7          	jalr	798(ra) # 80003c56 <trapinit>
    trapinithart();  // install kernel trap vector
    80001940:	00002097          	auipc	ra,0x2
    80001944:	340080e7          	jalr	832(ra) # 80003c80 <trapinithart>
    plicinit();      // set up interrupt controller
    80001948:	00007097          	auipc	ra,0x7
    8000194c:	212080e7          	jalr	530(ra) # 80008b5a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001950:	00007097          	auipc	ra,0x7
    80001954:	238080e7          	jalr	568(ra) # 80008b88 <plicinithart>
    binit();         // buffer cache
    80001958:	00003097          	auipc	ra,0x3
    8000195c:	da6080e7          	jalr	-602(ra) # 800046fe <binit>
    iinit();         // inode table
    80001960:	00003097          	auipc	ra,0x3
    80001964:	5fc080e7          	jalr	1532(ra) # 80004f5c <iinit>
    fileinit();      // file table
    80001968:	00005097          	auipc	ra,0x5
    8000196c:	fd0080e7          	jalr	-48(ra) # 80006938 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    80001970:	0000a597          	auipc	a1,0xa
    80001974:	73058593          	addi	a1,a1,1840 # 8000c0a0 <etext+0xa0>
    80001978:	4501                	li	a0,0
    8000197a:	00007097          	auipc	ra,0x7
    8000197e:	508080e7          	jalr	1288(ra) # 80008e82 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    80001982:	0000a597          	auipc	a1,0xa
    80001986:	72e58593          	addi	a1,a1,1838 # 8000c0b0 <etext+0xb0>
    8000198a:	4505                	li	a0,1
    8000198c:	00007097          	auipc	ra,0x7
    80001990:	4f6080e7          	jalr	1270(ra) # 80008e82 <virtio_disk_init>

    userinit();      // first user process
    80001994:	00001097          	auipc	ra,0x1
    80001998:	422080e7          	jalr	1058(ra) # 80002db6 <userinit>
    __sync_synchronize();
    8000199c:	0ff0000f          	fence
    started = 1;
    800019a0:	00013797          	auipc	a5,0x13
    800019a4:	29078793          	addi	a5,a5,656 # 80014c30 <started>
    800019a8:	4705                	li	a4,1
    800019aa:	c398                	sw	a4,0(a5)
    800019ac:	a0a9                	j	800019f6 <main+0x132>
  } else {
    while(started == 0)
    800019ae:	0001                	nop
    800019b0:	00013797          	auipc	a5,0x13
    800019b4:	28078793          	addi	a5,a5,640 # 80014c30 <started>
    800019b8:	439c                	lw	a5,0(a5)
    800019ba:	2781                	sext.w	a5,a5
    800019bc:	dbf5                	beqz	a5,800019b0 <main+0xec>
      ;
    __sync_synchronize();
    800019be:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800019c2:	00001097          	auipc	ra,0x1
    800019c6:	016080e7          	jalr	22(ra) # 800029d8 <cpuid>
    800019ca:	87aa                	mv	a5,a0
    800019cc:	85be                	mv	a1,a5
    800019ce:	0000a517          	auipc	a0,0xa
    800019d2:	6f250513          	addi	a0,a0,1778 # 8000c0c0 <etext+0xc0>
    800019d6:	fffff097          	auipc	ra,0xfffff
    800019da:	060080e7          	jalr	96(ra) # 80000a36 <printf>
    kvminithart();    // turn on paging
    800019de:	00000097          	auipc	ra,0x0
    800019e2:	19a080e7          	jalr	410(ra) # 80001b78 <kvminithart>
    trapinithart();   // install kernel trap vector
    800019e6:	00002097          	auipc	ra,0x2
    800019ea:	29a080e7          	jalr	666(ra) # 80003c80 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    800019ee:	00007097          	auipc	ra,0x7
    800019f2:	19a080e7          	jalr	410(ra) # 80008b88 <plicinithart>
  }

  scheduler();        
    800019f6:	00002097          	auipc	ra,0x2
    800019fa:	a08080e7          	jalr	-1528(ra) # 800033fe <scheduler>

00000000800019fe <w_satp>:
{
    800019fe:	1101                	addi	sp,sp,-32
    80001a00:	ec22                	sd	s0,24(sp)
    80001a02:	1000                	addi	s0,sp,32
    80001a04:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw satp, %0" : : "r" (x));
    80001a08:	fe843783          	ld	a5,-24(s0)
    80001a0c:	18079073          	csrw	satp,a5
}
    80001a10:	0001                	nop
    80001a12:	6462                	ld	s0,24(sp)
    80001a14:	6105                	addi	sp,sp,32
    80001a16:	8082                	ret

0000000080001a18 <sfence_vma>:
}

// flush the TLB.
static inline void
sfence_vma()
{
    80001a18:	1141                	addi	sp,sp,-16
    80001a1a:	e422                	sd	s0,8(sp)
    80001a1c:	0800                	addi	s0,sp,16
  // the zero, zero means flush all TLB entries.
  asm volatile("sfence.vma zero, zero");
    80001a1e:	12000073          	sfence.vma
}
    80001a22:	0001                	nop
    80001a24:	6422                	ld	s0,8(sp)
    80001a26:	0141                	addi	sp,sp,16
    80001a28:	8082                	ret

0000000080001a2a <kvmmake>:
extern char trampoline[]; // trampoline.S

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001a2a:	1101                	addi	sp,sp,-32
    80001a2c:	ec06                	sd	ra,24(sp)
    80001a2e:	e822                	sd	s0,16(sp)
    80001a30:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001a32:	fffff097          	auipc	ra,0xfffff
    80001a36:	7a4080e7          	jalr	1956(ra) # 800011d6 <kalloc>
    80001a3a:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001a3e:	6605                	lui	a2,0x1
    80001a40:	4581                	li	a1,0
    80001a42:	fe843503          	ld	a0,-24(s0)
    80001a46:	00000097          	auipc	ra,0x0
    80001a4a:	aca080e7          	jalr	-1334(ra) # 80001510 <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001a4e:	4719                	li	a4,6
    80001a50:	6685                	lui	a3,0x1
    80001a52:	10000637          	lui	a2,0x10000
    80001a56:	100005b7          	lui	a1,0x10000
    80001a5a:	fe843503          	ld	a0,-24(s0)
    80001a5e:	00000097          	auipc	ra,0x0
    80001a62:	2ec080e7          	jalr	748(ra) # 80001d4a <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001a66:	4719                	li	a4,6
    80001a68:	6685                	lui	a3,0x1
    80001a6a:	10001637          	lui	a2,0x10001
    80001a6e:	100015b7          	lui	a1,0x10001
    80001a72:	fe843503          	ld	a0,-24(s0)
    80001a76:	00000097          	auipc	ra,0x0
    80001a7a:	2d4080e7          	jalr	724(ra) # 80001d4a <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001a7e:	4719                	li	a4,6
    80001a80:	6685                	lui	a3,0x1
    80001a82:	10002637          	lui	a2,0x10002
    80001a86:	100025b7          	lui	a1,0x10002
    80001a8a:	fe843503          	ld	a0,-24(s0)
    80001a8e:	00000097          	auipc	ra,0x0
    80001a92:	2bc080e7          	jalr	700(ra) # 80001d4a <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001a96:	4719                	li	a4,6
    80001a98:	004006b7          	lui	a3,0x400
    80001a9c:	0c000637          	lui	a2,0xc000
    80001aa0:	0c0005b7          	lui	a1,0xc000
    80001aa4:	fe843503          	ld	a0,-24(s0)
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	2a2080e7          	jalr	674(ra) # 80001d4a <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001ab0:	0000a717          	auipc	a4,0xa
    80001ab4:	55070713          	addi	a4,a4,1360 # 8000c000 <etext>
    80001ab8:	800007b7          	lui	a5,0x80000
    80001abc:	97ba                	add	a5,a5,a4
    80001abe:	4729                	li	a4,10
    80001ac0:	86be                	mv	a3,a5
    80001ac2:	4785                	li	a5,1
    80001ac4:	01f79613          	slli	a2,a5,0x1f
    80001ac8:	4785                	li	a5,1
    80001aca:	01f79593          	slli	a1,a5,0x1f
    80001ace:	fe843503          	ld	a0,-24(s0)
    80001ad2:	00000097          	auipc	ra,0x0
    80001ad6:	278080e7          	jalr	632(ra) # 80001d4a <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001ada:	0000a597          	auipc	a1,0xa
    80001ade:	52658593          	addi	a1,a1,1318 # 8000c000 <etext>
    80001ae2:	0000a617          	auipc	a2,0xa
    80001ae6:	51e60613          	addi	a2,a2,1310 # 8000c000 <etext>
    80001aea:	0000a797          	auipc	a5,0xa
    80001aee:	51678793          	addi	a5,a5,1302 # 8000c000 <etext>
    80001af2:	00801737          	lui	a4,0x801
    80001af6:	0722                	slli	a4,a4,0x8
    80001af8:	40f707b3          	sub	a5,a4,a5
    80001afc:	4719                	li	a4,6
    80001afe:	86be                	mv	a3,a5
    80001b00:	fe843503          	ld	a0,-24(s0)
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	246080e7          	jalr	582(ra) # 80001d4a <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001b0c:	00009797          	auipc	a5,0x9
    80001b10:	4f478793          	addi	a5,a5,1268 # 8000b000 <_trampoline>
    80001b14:	4729                	li	a4,10
    80001b16:	6685                	lui	a3,0x1
    80001b18:	863e                	mv	a2,a5
    80001b1a:	040007b7          	lui	a5,0x4000
    80001b1e:	17fd                	addi	a5,a5,-1
    80001b20:	00c79593          	slli	a1,a5,0xc
    80001b24:	fe843503          	ld	a0,-24(s0)
    80001b28:	00000097          	auipc	ra,0x0
    80001b2c:	222080e7          	jalr	546(ra) # 80001d4a <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001b30:	fe843503          	ld	a0,-24(s0)
    80001b34:	00001097          	auipc	ra,0x1
    80001b38:	d1a080e7          	jalr	-742(ra) # 8000284e <proc_mapstacks>
  
  return kpgtbl;
    80001b3c:	fe843783          	ld	a5,-24(s0)
}
    80001b40:	853e                	mv	a0,a5
    80001b42:	60e2                	ld	ra,24(sp)
    80001b44:	6442                	ld	s0,16(sp)
    80001b46:	6105                	addi	sp,sp,32
    80001b48:	8082                	ret

0000000080001b4a <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001b4a:	1141                	addi	sp,sp,-16
    80001b4c:	e406                	sd	ra,8(sp)
    80001b4e:	e022                	sd	s0,0(sp)
    80001b50:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001b52:	00000097          	auipc	ra,0x0
    80001b56:	ed8080e7          	jalr	-296(ra) # 80001a2a <kvmmake>
    80001b5a:	872a                	mv	a4,a0
    80001b5c:	0000b797          	auipc	a5,0xb
    80001b60:	e5c78793          	addi	a5,a5,-420 # 8000c9b8 <kernel_pagetable>
    80001b64:	e398                	sd	a4,0(a5)
  updaterefhistory();
    80001b66:	00009097          	auipc	ra,0x9
    80001b6a:	a8c080e7          	jalr	-1396(ra) # 8000a5f2 <updaterefhistory>
}
    80001b6e:	0001                	nop
    80001b70:	60a2                	ld	ra,8(sp)
    80001b72:	6402                	ld	s0,0(sp)
    80001b74:	0141                	addi	sp,sp,16
    80001b76:	8082                	ret

0000000080001b78 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001b78:	1141                	addi	sp,sp,-16
    80001b7a:	e406                	sd	ra,8(sp)
    80001b7c:	e022                	sd	s0,0(sp)
    80001b7e:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	e98080e7          	jalr	-360(ra) # 80001a18 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001b88:	0000b797          	auipc	a5,0xb
    80001b8c:	e3078793          	addi	a5,a5,-464 # 8000c9b8 <kernel_pagetable>
    80001b90:	639c                	ld	a5,0(a5)
    80001b92:	00c7d713          	srli	a4,a5,0xc
    80001b96:	57fd                	li	a5,-1
    80001b98:	17fe                	slli	a5,a5,0x3f
    80001b9a:	8fd9                	or	a5,a5,a4
    80001b9c:	853e                	mv	a0,a5
    80001b9e:	00000097          	auipc	ra,0x0
    80001ba2:	e60080e7          	jalr	-416(ra) # 800019fe <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001ba6:	00000097          	auipc	ra,0x0
    80001baa:	e72080e7          	jalr	-398(ra) # 80001a18 <sfence_vma>
}
    80001bae:	0001                	nop
    80001bb0:	60a2                	ld	ra,8(sp)
    80001bb2:	6402                	ld	s0,0(sp)
    80001bb4:	0141                	addi	sp,sp,16
    80001bb6:	8082                	ret

0000000080001bb8 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001bb8:	7139                	addi	sp,sp,-64
    80001bba:	fc06                	sd	ra,56(sp)
    80001bbc:	f822                	sd	s0,48(sp)
    80001bbe:	0080                	addi	s0,sp,64
    80001bc0:	fca43c23          	sd	a0,-40(s0)
    80001bc4:	fcb43823          	sd	a1,-48(s0)
    80001bc8:	87b2                	mv	a5,a2
    80001bca:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001bce:	fd043703          	ld	a4,-48(s0)
    80001bd2:	57fd                	li	a5,-1
    80001bd4:	83e9                	srli	a5,a5,0x1a
    80001bd6:	00e7f463          	bgeu	a5,a4,80001bde <walk+0x26>
    return 0;
    80001bda:	4781                	li	a5,0
    80001bdc:	a85d                	j	80001c92 <walk+0xda>

  for(int level = 2; level > 0; level--) {
    80001bde:	4789                	li	a5,2
    80001be0:	fef42623          	sw	a5,-20(s0)
    80001be4:	a849                	j	80001c76 <walk+0xbe>
    pte_t *pte = &pagetable[PX(level, va)];
    80001be6:	fec42703          	lw	a4,-20(s0)
    80001bea:	87ba                	mv	a5,a4
    80001bec:	0037979b          	slliw	a5,a5,0x3
    80001bf0:	9fb9                	addw	a5,a5,a4
    80001bf2:	2781                	sext.w	a5,a5
    80001bf4:	27b1                	addiw	a5,a5,12
    80001bf6:	2781                	sext.w	a5,a5
    80001bf8:	873e                	mv	a4,a5
    80001bfa:	fd043783          	ld	a5,-48(s0)
    80001bfe:	00e7d7b3          	srl	a5,a5,a4
    80001c02:	1ff7f793          	andi	a5,a5,511
    80001c06:	078e                	slli	a5,a5,0x3
    80001c08:	fd843703          	ld	a4,-40(s0)
    80001c0c:	97ba                	add	a5,a5,a4
    80001c0e:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001c12:	fe043783          	ld	a5,-32(s0)
    80001c16:	639c                	ld	a5,0(a5)
    80001c18:	8b85                	andi	a5,a5,1
    80001c1a:	cb89                	beqz	a5,80001c2c <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001c1c:	fe043783          	ld	a5,-32(s0)
    80001c20:	639c                	ld	a5,0(a5)
    80001c22:	83a9                	srli	a5,a5,0xa
    80001c24:	07b2                	slli	a5,a5,0xc
    80001c26:	fcf43c23          	sd	a5,-40(s0)
    80001c2a:	a089                	j	80001c6c <walk+0xb4>
    }
    else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001c2c:	fcc42783          	lw	a5,-52(s0)
    80001c30:	2781                	sext.w	a5,a5
    80001c32:	cb91                	beqz	a5,80001c46 <walk+0x8e>
    80001c34:	fffff097          	auipc	ra,0xfffff
    80001c38:	5a2080e7          	jalr	1442(ra) # 800011d6 <kalloc>
    80001c3c:	fca43c23          	sd	a0,-40(s0)
    80001c40:	fd843783          	ld	a5,-40(s0)
    80001c44:	e399                	bnez	a5,80001c4a <walk+0x92>
        return 0;
    80001c46:	4781                	li	a5,0
    80001c48:	a0a9                	j	80001c92 <walk+0xda>
      memset(pagetable, 0, PGSIZE);
    80001c4a:	6605                	lui	a2,0x1
    80001c4c:	4581                	li	a1,0
    80001c4e:	fd843503          	ld	a0,-40(s0)
    80001c52:	00000097          	auipc	ra,0x0
    80001c56:	8be080e7          	jalr	-1858(ra) # 80001510 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001c5a:	fd843783          	ld	a5,-40(s0)
    80001c5e:	83b1                	srli	a5,a5,0xc
    80001c60:	07aa                	slli	a5,a5,0xa
    80001c62:	0017e713          	ori	a4,a5,1
    80001c66:	fe043783          	ld	a5,-32(s0)
    80001c6a:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001c6c:	fec42783          	lw	a5,-20(s0)
    80001c70:	37fd                	addiw	a5,a5,-1
    80001c72:	fef42623          	sw	a5,-20(s0)
    80001c76:	fec42783          	lw	a5,-20(s0)
    80001c7a:	2781                	sext.w	a5,a5
    80001c7c:	f6f045e3          	bgtz	a5,80001be6 <walk+0x2e>
    }
  }

  return &pagetable[PX(0, va)];
    80001c80:	fd043783          	ld	a5,-48(s0)
    80001c84:	83b1                	srli	a5,a5,0xc
    80001c86:	1ff7f793          	andi	a5,a5,511
    80001c8a:	078e                	slli	a5,a5,0x3
    80001c8c:	fd843703          	ld	a4,-40(s0)
    80001c90:	97ba                	add	a5,a5,a4
}
    80001c92:	853e                	mv	a0,a5
    80001c94:	70e2                	ld	ra,56(sp)
    80001c96:	7442                	ld	s0,48(sp)
    80001c98:	6121                	addi	sp,sp,64
    80001c9a:	8082                	ret

0000000080001c9c <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001c9c:	7179                	addi	sp,sp,-48
    80001c9e:	f406                	sd	ra,40(sp)
    80001ca0:	f022                	sd	s0,32(sp)
    80001ca2:	1800                	addi	s0,sp,48
    80001ca4:	fca43c23          	sd	a0,-40(s0)
    80001ca8:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001cac:	fd043703          	ld	a4,-48(s0)
    80001cb0:	57fd                	li	a5,-1
    80001cb2:	83e9                	srli	a5,a5,0x1a
    80001cb4:	00e7f463          	bgeu	a5,a4,80001cbc <walkaddr+0x20>
    return 0;
    80001cb8:	4781                	li	a5,0
    80001cba:	a059                	j	80001d40 <walkaddr+0xa4>

  pte = walk(pagetable, va, 0);
    80001cbc:	4601                	li	a2,0
    80001cbe:	fd043583          	ld	a1,-48(s0)
    80001cc2:	fd843503          	ld	a0,-40(s0)
    80001cc6:	00000097          	auipc	ra,0x0
    80001cca:	ef2080e7          	jalr	-270(ra) # 80001bb8 <walk>
    80001cce:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001cd2:	fe843783          	ld	a5,-24(s0)
    80001cd6:	e399                	bnez	a5,80001cdc <walkaddr+0x40>
    return 0;
    80001cd8:	4781                	li	a5,0
    80001cda:	a09d                	j	80001d40 <walkaddr+0xa4>
  if(*pte & PTE_PENDING_DISK_OPERATION)
    80001cdc:	fe843783          	ld	a5,-24(s0)
    80001ce0:	639c                	ld	a5,0(a5)
    80001ce2:	2007f793          	andi	a5,a5,512
    80001ce6:	c399                	beqz	a5,80001cec <walkaddr+0x50>
    return 0;
    80001ce8:	4781                	li	a5,0
    80001cea:	a899                	j	80001d40 <walkaddr+0xa4>
  if(!(*pte & PTE_V) && (*pte & PTE_ON_DISK))
    80001cec:	fe843783          	ld	a5,-24(s0)
    80001cf0:	639c                	ld	a5,0(a5)
    80001cf2:	8b85                	andi	a5,a5,1
    80001cf4:	ef99                	bnez	a5,80001d12 <walkaddr+0x76>
    80001cf6:	fe843783          	ld	a5,-24(s0)
    80001cfa:	639c                	ld	a5,0(a5)
    80001cfc:	1007f793          	andi	a5,a5,256
    80001d00:	cb89                	beqz	a5,80001d12 <walkaddr+0x76>
    swapin(va, pagetable);
    80001d02:	fd843583          	ld	a1,-40(s0)
    80001d06:	fd043503          	ld	a0,-48(s0)
    80001d0a:	00009097          	auipc	ra,0x9
    80001d0e:	ba2080e7          	jalr	-1118(ra) # 8000a8ac <swapin>
  if((*pte & PTE_V) == 0)
    80001d12:	fe843783          	ld	a5,-24(s0)
    80001d16:	639c                	ld	a5,0(a5)
    80001d18:	8b85                	andi	a5,a5,1
    80001d1a:	e399                	bnez	a5,80001d20 <walkaddr+0x84>
    return 0;
    80001d1c:	4781                	li	a5,0
    80001d1e:	a00d                	j	80001d40 <walkaddr+0xa4>
  if((*pte & PTE_U) == 0)
    80001d20:	fe843783          	ld	a5,-24(s0)
    80001d24:	639c                	ld	a5,0(a5)
    80001d26:	8bc1                	andi	a5,a5,16
    80001d28:	e399                	bnez	a5,80001d2e <walkaddr+0x92>
    return 0;
    80001d2a:	4781                	li	a5,0
    80001d2c:	a811                	j	80001d40 <walkaddr+0xa4>

  pa = PTE2PA(*pte);
    80001d2e:	fe843783          	ld	a5,-24(s0)
    80001d32:	639c                	ld	a5,0(a5)
    80001d34:	83a9                	srli	a5,a5,0xa
    80001d36:	07b2                	slli	a5,a5,0xc
    80001d38:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001d3c:	fe043783          	ld	a5,-32(s0)
}
    80001d40:	853e                	mv	a0,a5
    80001d42:	70a2                	ld	ra,40(sp)
    80001d44:	7402                	ld	s0,32(sp)
    80001d46:	6145                	addi	sp,sp,48
    80001d48:	8082                	ret

0000000080001d4a <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001d4a:	7139                	addi	sp,sp,-64
    80001d4c:	fc06                	sd	ra,56(sp)
    80001d4e:	f822                	sd	s0,48(sp)
    80001d50:	0080                	addi	s0,sp,64
    80001d52:	fea43423          	sd	a0,-24(s0)
    80001d56:	feb43023          	sd	a1,-32(s0)
    80001d5a:	fcc43c23          	sd	a2,-40(s0)
    80001d5e:	fcd43823          	sd	a3,-48(s0)
    80001d62:	87ba                	mv	a5,a4
    80001d64:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001d68:	fcc42783          	lw	a5,-52(s0)
    80001d6c:	873e                	mv	a4,a5
    80001d6e:	fd843683          	ld	a3,-40(s0)
    80001d72:	fd043603          	ld	a2,-48(s0)
    80001d76:	fe043583          	ld	a1,-32(s0)
    80001d7a:	fe843503          	ld	a0,-24(s0)
    80001d7e:	00000097          	auipc	ra,0x0
    80001d82:	026080e7          	jalr	38(ra) # 80001da4 <mappages>
    80001d86:	87aa                	mv	a5,a0
    80001d88:	cb89                	beqz	a5,80001d9a <kvmmap+0x50>
    panic("kvmmap");
    80001d8a:	0000a517          	auipc	a0,0xa
    80001d8e:	34e50513          	addi	a0,a0,846 # 8000c0d8 <etext+0xd8>
    80001d92:	fffff097          	auipc	ra,0xfffff
    80001d96:	efa080e7          	jalr	-262(ra) # 80000c8c <panic>
}
    80001d9a:	0001                	nop
    80001d9c:	70e2                	ld	ra,56(sp)
    80001d9e:	7442                	ld	s0,48(sp)
    80001da0:	6121                	addi	sp,sp,64
    80001da2:	8082                	ret

0000000080001da4 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001da4:	711d                	addi	sp,sp,-96
    80001da6:	ec86                	sd	ra,88(sp)
    80001da8:	e8a2                	sd	s0,80(sp)
    80001daa:	1080                	addi	s0,sp,96
    80001dac:	fca43423          	sd	a0,-56(s0)
    80001db0:	fcb43023          	sd	a1,-64(s0)
    80001db4:	fac43c23          	sd	a2,-72(s0)
    80001db8:	fad43823          	sd	a3,-80(s0)
    80001dbc:	87ba                	mv	a5,a4
    80001dbe:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001dc2:	fb843783          	ld	a5,-72(s0)
    80001dc6:	eb89                	bnez	a5,80001dd8 <mappages+0x34>
    panic("mappages: size");
    80001dc8:	0000a517          	auipc	a0,0xa
    80001dcc:	31850513          	addi	a0,a0,792 # 8000c0e0 <etext+0xe0>
    80001dd0:	fffff097          	auipc	ra,0xfffff
    80001dd4:	ebc080e7          	jalr	-324(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    80001dd8:	fc043703          	ld	a4,-64(s0)
    80001ddc:	77fd                	lui	a5,0xfffff
    80001dde:	8ff9                	and	a5,a5,a4
    80001de0:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001de4:	fc043703          	ld	a4,-64(s0)
    80001de8:	fb843783          	ld	a5,-72(s0)
    80001dec:	97ba                	add	a5,a5,a4
    80001dee:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffd5017>
    80001df2:	77fd                	lui	a5,0xfffff
    80001df4:	8ff9                	and	a5,a5,a4
    80001df6:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001dfa:	4605                	li	a2,1
    80001dfc:	fe843583          	ld	a1,-24(s0)
    80001e00:	fc843503          	ld	a0,-56(s0)
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	db4080e7          	jalr	-588(ra) # 80001bb8 <walk>
    80001e0c:	fca43c23          	sd	a0,-40(s0)
    80001e10:	fd843783          	ld	a5,-40(s0)
    80001e14:	e399                	bnez	a5,80001e1a <mappages+0x76>
      return -1;
    80001e16:	57fd                	li	a5,-1
    80001e18:	a071                	j	80001ea4 <mappages+0x100>
    if(*pte & PTE_V)
    80001e1a:	fd843783          	ld	a5,-40(s0)
    80001e1e:	639c                	ld	a5,0(a5)
    80001e20:	8b85                	andi	a5,a5,1
    80001e22:	cb89                	beqz	a5,80001e34 <mappages+0x90>
      panic("mappages: remap");
    80001e24:	0000a517          	auipc	a0,0xa
    80001e28:	2cc50513          	addi	a0,a0,716 # 8000c0f0 <etext+0xf0>
    80001e2c:	fffff097          	auipc	ra,0xfffff
    80001e30:	e60080e7          	jalr	-416(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001e34:	fb043783          	ld	a5,-80(s0)
    80001e38:	83b1                	srli	a5,a5,0xc
    80001e3a:	00a79713          	slli	a4,a5,0xa
    80001e3e:	fac42783          	lw	a5,-84(s0)
    80001e42:	8fd9                	or	a5,a5,a4
    80001e44:	0017e713          	ori	a4,a5,1
    80001e48:	fd843783          	ld	a5,-40(s0)
    80001e4c:	e398                	sd	a4,0(a5)
    if(ispteswappable(pagetable, a, pte))
    80001e4e:	fd843603          	ld	a2,-40(s0)
    80001e52:	fe843583          	ld	a1,-24(s0)
    80001e56:	fc843503          	ld	a0,-56(s0)
    80001e5a:	00008097          	auipc	ra,0x8
    80001e5e:	4d6080e7          	jalr	1238(ra) # 8000a330 <ispteswappable>
    80001e62:	87aa                	mv	a5,a0
    80001e64:	cb99                	beqz	a5,80001e7a <mappages+0xd6>
      reglrupage(pte, a, pagetable);
    80001e66:	fc843603          	ld	a2,-56(s0)
    80001e6a:	fe843583          	ld	a1,-24(s0)
    80001e6e:	fd843503          	ld	a0,-40(s0)
    80001e72:	00008097          	auipc	ra,0x8
    80001e76:	626080e7          	jalr	1574(ra) # 8000a498 <reglrupage>
    if(a == last)
    80001e7a:	fe843703          	ld	a4,-24(s0)
    80001e7e:	fe043783          	ld	a5,-32(s0)
    80001e82:	00f70f63          	beq	a4,a5,80001ea0 <mappages+0xfc>
      break;
    a += PGSIZE;
    80001e86:	fe843703          	ld	a4,-24(s0)
    80001e8a:	6785                	lui	a5,0x1
    80001e8c:	97ba                	add	a5,a5,a4
    80001e8e:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001e92:	fb043703          	ld	a4,-80(s0)
    80001e96:	6785                	lui	a5,0x1
    80001e98:	97ba                	add	a5,a5,a4
    80001e9a:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001e9e:	bfb1                	j	80001dfa <mappages+0x56>
      break;
    80001ea0:	0001                	nop
  }
  return 0;
    80001ea2:	4781                	li	a5,0
}
    80001ea4:	853e                	mv	a0,a5
    80001ea6:	60e6                	ld	ra,88(sp)
    80001ea8:	6446                	ld	s0,80(sp)
    80001eaa:	6125                	addi	sp,sp,96
    80001eac:	8082                	ret

0000000080001eae <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001eae:	715d                	addi	sp,sp,-80
    80001eb0:	e486                	sd	ra,72(sp)
    80001eb2:	e0a2                	sd	s0,64(sp)
    80001eb4:	0880                	addi	s0,sp,80
    80001eb6:	fca43423          	sd	a0,-56(s0)
    80001eba:	fcb43023          	sd	a1,-64(s0)
    80001ebe:	fac43c23          	sd	a2,-72(s0)
    80001ec2:	87b6                	mv	a5,a3
    80001ec4:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001ec8:	fc043703          	ld	a4,-64(s0)
    80001ecc:	6785                	lui	a5,0x1
    80001ece:	17fd                	addi	a5,a5,-1
    80001ed0:	8ff9                	and	a5,a5,a4
    80001ed2:	cb89                	beqz	a5,80001ee4 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001ed4:	0000a517          	auipc	a0,0xa
    80001ed8:	22c50513          	addi	a0,a0,556 # 8000c100 <etext+0x100>
    80001edc:	fffff097          	auipc	ra,0xfffff
    80001ee0:	db0080e7          	jalr	-592(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001ee4:	fc043783          	ld	a5,-64(s0)
    80001ee8:	fef43423          	sd	a5,-24(s0)
    80001eec:	a8cd                	j	80001fde <uvmunmap+0x130>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001eee:	4601                	li	a2,0
    80001ef0:	fe843583          	ld	a1,-24(s0)
    80001ef4:	fc843503          	ld	a0,-56(s0)
    80001ef8:	00000097          	auipc	ra,0x0
    80001efc:	cc0080e7          	jalr	-832(ra) # 80001bb8 <walk>
    80001f00:	fea43023          	sd	a0,-32(s0)
    80001f04:	fe043783          	ld	a5,-32(s0)
    80001f08:	eb89                	bnez	a5,80001f1a <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001f0a:	0000a517          	auipc	a0,0xa
    80001f0e:	20e50513          	addi	a0,a0,526 # 8000c118 <etext+0x118>
    80001f12:	fffff097          	auipc	ra,0xfffff
    80001f16:	d7a080e7          	jalr	-646(ra) # 80000c8c <panic>
    if(!(*pte & PTE_V) && !(*pte & PTE_ON_DISK))
    80001f1a:	fe043783          	ld	a5,-32(s0)
    80001f1e:	639c                	ld	a5,0(a5)
    80001f20:	8b85                	andi	a5,a5,1
    80001f22:	ef99                	bnez	a5,80001f40 <uvmunmap+0x92>
    80001f24:	fe043783          	ld	a5,-32(s0)
    80001f28:	639c                	ld	a5,0(a5)
    80001f2a:	1007f793          	andi	a5,a5,256
    80001f2e:	eb89                	bnez	a5,80001f40 <uvmunmap+0x92>
      panic("uvmunmap: not mapped");
    80001f30:	0000a517          	auipc	a0,0xa
    80001f34:	1f850513          	addi	a0,a0,504 # 8000c128 <etext+0x128>
    80001f38:	fffff097          	auipc	ra,0xfffff
    80001f3c:	d54080e7          	jalr	-684(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001f40:	fe043783          	ld	a5,-32(s0)
    80001f44:	639c                	ld	a5,0(a5)
    80001f46:	3ff7f713          	andi	a4,a5,1023
    80001f4a:	4785                	li	a5,1
    80001f4c:	00f71a63          	bne	a4,a5,80001f60 <uvmunmap+0xb2>
      panic("uvmunmap: not a leaf");
    80001f50:	0000a517          	auipc	a0,0xa
    80001f54:	1f050513          	addi	a0,a0,496 # 8000c140 <etext+0x140>
    80001f58:	fffff097          	auipc	ra,0xfffff
    80001f5c:	d34080e7          	jalr	-716(ra) # 80000c8c <panic>

    if(ispteswappable(pagetable, a, pte))
    80001f60:	fe043603          	ld	a2,-32(s0)
    80001f64:	fe843583          	ld	a1,-24(s0)
    80001f68:	fc843503          	ld	a0,-56(s0)
    80001f6c:	00008097          	auipc	ra,0x8
    80001f70:	3c4080e7          	jalr	964(ra) # 8000a330 <ispteswappable>
    80001f74:	87aa                	mv	a5,a0
    80001f76:	cb89                	beqz	a5,80001f88 <uvmunmap+0xda>
      unreglrupage(a, pagetable);
    80001f78:	fc843583          	ld	a1,-56(s0)
    80001f7c:	fe843503          	ld	a0,-24(s0)
    80001f80:	00008097          	auipc	ra,0x8
    80001f84:	5ea080e7          	jalr	1514(ra) # 8000a56a <unreglrupage>

    if(do_free){
    80001f88:	fb442783          	lw	a5,-76(s0)
    80001f8c:	2781                	sext.w	a5,a5
    80001f8e:	cf95                	beqz	a5,80001fca <uvmunmap+0x11c>
      uint64 pa = PTE2PA(*pte);
    80001f90:	fe043783          	ld	a5,-32(s0)
    80001f94:	639c                	ld	a5,0(a5)
    80001f96:	83a9                	srli	a5,a5,0xa
    80001f98:	07b2                	slli	a5,a5,0xc
    80001f9a:	fcf43c23          	sd	a5,-40(s0)
      if(*pte & PTE_ON_DISK)
    80001f9e:	fe043783          	ld	a5,-32(s0)
    80001fa2:	639c                	ld	a5,0(a5)
    80001fa4:	1007f793          	andi	a5,a5,256
    80001fa8:	cb91                	beqz	a5,80001fbc <uvmunmap+0x10e>
        deallocate_page((int)pa);
    80001faa:	fd843783          	ld	a5,-40(s0)
    80001fae:	2781                	sext.w	a5,a5
    80001fb0:	853e                	mv	a0,a5
    80001fb2:	00008097          	auipc	ra,0x8
    80001fb6:	f88080e7          	jalr	-120(ra) # 80009f3a <deallocate_page>
    80001fba:	a801                	j	80001fca <uvmunmap+0x11c>
      else
        kfree((void*)pa);
    80001fbc:	fd843783          	ld	a5,-40(s0)
    80001fc0:	853e                	mv	a0,a5
    80001fc2:	fffff097          	auipc	ra,0xfffff
    80001fc6:	16e080e7          	jalr	366(ra) # 80001130 <kfree>
    }
    *pte = 0;
    80001fca:	fe043783          	ld	a5,-32(s0)
    80001fce:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001fd2:	fe843703          	ld	a4,-24(s0)
    80001fd6:	6785                	lui	a5,0x1
    80001fd8:	97ba                	add	a5,a5,a4
    80001fda:	fef43423          	sd	a5,-24(s0)
    80001fde:	fb843783          	ld	a5,-72(s0)
    80001fe2:	00c79713          	slli	a4,a5,0xc
    80001fe6:	fc043783          	ld	a5,-64(s0)
    80001fea:	97ba                	add	a5,a5,a4
    80001fec:	fe843703          	ld	a4,-24(s0)
    80001ff0:	eef76fe3          	bltu	a4,a5,80001eee <uvmunmap+0x40>
  }
}
    80001ff4:	0001                	nop
    80001ff6:	0001                	nop
    80001ff8:	60a6                	ld	ra,72(sp)
    80001ffa:	6406                	ld	s0,64(sp)
    80001ffc:	6161                	addi	sp,sp,80
    80001ffe:	8082                	ret

0000000080002000 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80002000:	1101                	addi	sp,sp,-32
    80002002:	ec06                	sd	ra,24(sp)
    80002004:	e822                	sd	s0,16(sp)
    80002006:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80002008:	fffff097          	auipc	ra,0xfffff
    8000200c:	1ce080e7          	jalr	462(ra) # 800011d6 <kalloc>
    80002010:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002014:	fe843783          	ld	a5,-24(s0)
    80002018:	e399                	bnez	a5,8000201e <uvmcreate+0x1e>
    return 0;
    8000201a:	4781                	li	a5,0
    8000201c:	a819                	j	80002032 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    8000201e:	6605                	lui	a2,0x1
    80002020:	4581                	li	a1,0
    80002022:	fe843503          	ld	a0,-24(s0)
    80002026:	fffff097          	auipc	ra,0xfffff
    8000202a:	4ea080e7          	jalr	1258(ra) # 80001510 <memset>
  return pagetable;
    8000202e:	fe843783          	ld	a5,-24(s0)
}
    80002032:	853e                	mv	a0,a5
    80002034:	60e2                	ld	ra,24(sp)
    80002036:	6442                	ld	s0,16(sp)
    80002038:	6105                	addi	sp,sp,32
    8000203a:	8082                	ret

000000008000203c <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    8000203c:	7139                	addi	sp,sp,-64
    8000203e:	fc06                	sd	ra,56(sp)
    80002040:	f822                	sd	s0,48(sp)
    80002042:	0080                	addi	s0,sp,64
    80002044:	fca43c23          	sd	a0,-40(s0)
    80002048:	fcb43823          	sd	a1,-48(s0)
    8000204c:	87b2                	mv	a5,a2
    8000204e:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80002052:	fcc42783          	lw	a5,-52(s0)
    80002056:	0007871b          	sext.w	a4,a5
    8000205a:	6785                	lui	a5,0x1
    8000205c:	00f76a63          	bltu	a4,a5,80002070 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    80002060:	0000a517          	auipc	a0,0xa
    80002064:	0f850513          	addi	a0,a0,248 # 8000c158 <etext+0x158>
    80002068:	fffff097          	auipc	ra,0xfffff
    8000206c:	c24080e7          	jalr	-988(ra) # 80000c8c <panic>
  mem = kalloc();
    80002070:	fffff097          	auipc	ra,0xfffff
    80002074:	166080e7          	jalr	358(ra) # 800011d6 <kalloc>
    80002078:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    8000207c:	6605                	lui	a2,0x1
    8000207e:	4581                	li	a1,0
    80002080:	fe843503          	ld	a0,-24(s0)
    80002084:	fffff097          	auipc	ra,0xfffff
    80002088:	48c080e7          	jalr	1164(ra) # 80001510 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    8000208c:	fe843783          	ld	a5,-24(s0)
    80002090:	4779                	li	a4,30
    80002092:	86be                	mv	a3,a5
    80002094:	6605                	lui	a2,0x1
    80002096:	4581                	li	a1,0
    80002098:	fd843503          	ld	a0,-40(s0)
    8000209c:	00000097          	auipc	ra,0x0
    800020a0:	d08080e7          	jalr	-760(ra) # 80001da4 <mappages>
  memmove(mem, src, sz);
    800020a4:	fcc42783          	lw	a5,-52(s0)
    800020a8:	863e                	mv	a2,a5
    800020aa:	fd043583          	ld	a1,-48(s0)
    800020ae:	fe843503          	ld	a0,-24(s0)
    800020b2:	fffff097          	auipc	ra,0xfffff
    800020b6:	542080e7          	jalr	1346(ra) # 800015f4 <memmove>
}
    800020ba:	0001                	nop
    800020bc:	70e2                	ld	ra,56(sp)
    800020be:	7442                	ld	s0,48(sp)
    800020c0:	6121                	addi	sp,sp,64
    800020c2:	8082                	ret

00000000800020c4 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    800020c4:	7139                	addi	sp,sp,-64
    800020c6:	fc06                	sd	ra,56(sp)
    800020c8:	f822                	sd	s0,48(sp)
    800020ca:	0080                	addi	s0,sp,64
    800020cc:	fca43c23          	sd	a0,-40(s0)
    800020d0:	fcb43823          	sd	a1,-48(s0)
    800020d4:	fcc43423          	sd	a2,-56(s0)
    800020d8:	87b6                	mv	a5,a3
    800020da:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    800020de:	fc843703          	ld	a4,-56(s0)
    800020e2:	fd043783          	ld	a5,-48(s0)
    800020e6:	00f77563          	bgeu	a4,a5,800020f0 <uvmalloc+0x2c>
    return oldsz;
    800020ea:	fd043783          	ld	a5,-48(s0)
    800020ee:	a87d                	j	800021ac <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    800020f0:	fd043703          	ld	a4,-48(s0)
    800020f4:	6785                	lui	a5,0x1
    800020f6:	17fd                	addi	a5,a5,-1
    800020f8:	973e                	add	a4,a4,a5
    800020fa:	77fd                	lui	a5,0xfffff
    800020fc:	8ff9                	and	a5,a5,a4
    800020fe:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002102:	fd043783          	ld	a5,-48(s0)
    80002106:	fef43423          	sd	a5,-24(s0)
    8000210a:	a849                	j	8000219c <uvmalloc+0xd8>
    mem = kalloc();
    8000210c:	fffff097          	auipc	ra,0xfffff
    80002110:	0ca080e7          	jalr	202(ra) # 800011d6 <kalloc>
    80002114:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80002118:	fe043783          	ld	a5,-32(s0)
    8000211c:	ef89                	bnez	a5,80002136 <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    8000211e:	fd043603          	ld	a2,-48(s0)
    80002122:	fe843583          	ld	a1,-24(s0)
    80002126:	fd843503          	ld	a0,-40(s0)
    8000212a:	00000097          	auipc	ra,0x0
    8000212e:	08c080e7          	jalr	140(ra) # 800021b6 <uvmdealloc>
      return 0;
    80002132:	4781                	li	a5,0
    80002134:	a8a5                	j	800021ac <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    80002136:	6605                	lui	a2,0x1
    80002138:	4581                	li	a1,0
    8000213a:	fe043503          	ld	a0,-32(s0)
    8000213e:	fffff097          	auipc	ra,0xfffff
    80002142:	3d2080e7          	jalr	978(ra) # 80001510 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    80002146:	fe043683          	ld	a3,-32(s0)
    8000214a:	fc442783          	lw	a5,-60(s0)
    8000214e:	0127e793          	ori	a5,a5,18
    80002152:	2781                	sext.w	a5,a5
    80002154:	873e                	mv	a4,a5
    80002156:	6605                	lui	a2,0x1
    80002158:	fe843583          	ld	a1,-24(s0)
    8000215c:	fd843503          	ld	a0,-40(s0)
    80002160:	00000097          	auipc	ra,0x0
    80002164:	c44080e7          	jalr	-956(ra) # 80001da4 <mappages>
    80002168:	87aa                	mv	a5,a0
    8000216a:	c39d                	beqz	a5,80002190 <uvmalloc+0xcc>
      kfree(mem);
    8000216c:	fe043503          	ld	a0,-32(s0)
    80002170:	fffff097          	auipc	ra,0xfffff
    80002174:	fc0080e7          	jalr	-64(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80002178:	fd043603          	ld	a2,-48(s0)
    8000217c:	fe843583          	ld	a1,-24(s0)
    80002180:	fd843503          	ld	a0,-40(s0)
    80002184:	00000097          	auipc	ra,0x0
    80002188:	032080e7          	jalr	50(ra) # 800021b6 <uvmdealloc>
      return 0;
    8000218c:	4781                	li	a5,0
    8000218e:	a839                	j	800021ac <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002190:	fe843703          	ld	a4,-24(s0)
    80002194:	6785                	lui	a5,0x1
    80002196:	97ba                	add	a5,a5,a4
    80002198:	fef43423          	sd	a5,-24(s0)
    8000219c:	fe843703          	ld	a4,-24(s0)
    800021a0:	fc843783          	ld	a5,-56(s0)
    800021a4:	f6f764e3          	bltu	a4,a5,8000210c <uvmalloc+0x48>
    }
  }
  return newsz;
    800021a8:	fc843783          	ld	a5,-56(s0)
}
    800021ac:	853e                	mv	a0,a5
    800021ae:	70e2                	ld	ra,56(sp)
    800021b0:	7442                	ld	s0,48(sp)
    800021b2:	6121                	addi	sp,sp,64
    800021b4:	8082                	ret

00000000800021b6 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    800021b6:	7139                	addi	sp,sp,-64
    800021b8:	fc06                	sd	ra,56(sp)
    800021ba:	f822                	sd	s0,48(sp)
    800021bc:	0080                	addi	s0,sp,64
    800021be:	fca43c23          	sd	a0,-40(s0)
    800021c2:	fcb43823          	sd	a1,-48(s0)
    800021c6:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    800021ca:	fc843703          	ld	a4,-56(s0)
    800021ce:	fd043783          	ld	a5,-48(s0)
    800021d2:	00f76563          	bltu	a4,a5,800021dc <uvmdealloc+0x26>
    return oldsz;
    800021d6:	fd043783          	ld	a5,-48(s0)
    800021da:	a885                	j	8000224a <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800021dc:	fc843703          	ld	a4,-56(s0)
    800021e0:	6785                	lui	a5,0x1
    800021e2:	17fd                	addi	a5,a5,-1
    800021e4:	973e                	add	a4,a4,a5
    800021e6:	77fd                	lui	a5,0xfffff
    800021e8:	8f7d                	and	a4,a4,a5
    800021ea:	fd043683          	ld	a3,-48(s0)
    800021ee:	6785                	lui	a5,0x1
    800021f0:	17fd                	addi	a5,a5,-1
    800021f2:	96be                	add	a3,a3,a5
    800021f4:	77fd                	lui	a5,0xfffff
    800021f6:	8ff5                	and	a5,a5,a3
    800021f8:	04f77763          	bgeu	a4,a5,80002246 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    800021fc:	fd043703          	ld	a4,-48(s0)
    80002200:	6785                	lui	a5,0x1
    80002202:	17fd                	addi	a5,a5,-1
    80002204:	973e                	add	a4,a4,a5
    80002206:	77fd                	lui	a5,0xfffff
    80002208:	8f7d                	and	a4,a4,a5
    8000220a:	fc843683          	ld	a3,-56(s0)
    8000220e:	6785                	lui	a5,0x1
    80002210:	17fd                	addi	a5,a5,-1
    80002212:	96be                	add	a3,a3,a5
    80002214:	77fd                	lui	a5,0xfffff
    80002216:	8ff5                	and	a5,a5,a3
    80002218:	40f707b3          	sub	a5,a4,a5
    8000221c:	83b1                	srli	a5,a5,0xc
    8000221e:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002222:	fc843703          	ld	a4,-56(s0)
    80002226:	6785                	lui	a5,0x1
    80002228:	17fd                	addi	a5,a5,-1
    8000222a:	973e                	add	a4,a4,a5
    8000222c:	77fd                	lui	a5,0xfffff
    8000222e:	8ff9                	and	a5,a5,a4
    80002230:	fec42703          	lw	a4,-20(s0)
    80002234:	4685                	li	a3,1
    80002236:	863a                	mv	a2,a4
    80002238:	85be                	mv	a1,a5
    8000223a:	fd843503          	ld	a0,-40(s0)
    8000223e:	00000097          	auipc	ra,0x0
    80002242:	c70080e7          	jalr	-912(ra) # 80001eae <uvmunmap>
  }

  return newsz;
    80002246:	fc843783          	ld	a5,-56(s0)
}
    8000224a:	853e                	mv	a0,a5
    8000224c:	70e2                	ld	ra,56(sp)
    8000224e:	7442                	ld	s0,48(sp)
    80002250:	6121                	addi	sp,sp,64
    80002252:	8082                	ret

0000000080002254 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80002254:	7139                	addi	sp,sp,-64
    80002256:	fc06                	sd	ra,56(sp)
    80002258:	f822                	sd	s0,48(sp)
    8000225a:	0080                	addi	s0,sp,64
    8000225c:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002260:	fe042623          	sw	zero,-20(s0)
    80002264:	a88d                	j	800022d6 <freewalk+0x82>
    pte_t pte = pagetable[i];
    80002266:	fec42783          	lw	a5,-20(s0)
    8000226a:	078e                	slli	a5,a5,0x3
    8000226c:	fc843703          	ld	a4,-56(s0)
    80002270:	97ba                	add	a5,a5,a4
    80002272:	639c                	ld	a5,0(a5)
    80002274:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002278:	fe043783          	ld	a5,-32(s0)
    8000227c:	8b85                	andi	a5,a5,1
    8000227e:	cb9d                	beqz	a5,800022b4 <freewalk+0x60>
    80002280:	fe043783          	ld	a5,-32(s0)
    80002284:	8bb9                	andi	a5,a5,14
    80002286:	e79d                	bnez	a5,800022b4 <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    80002288:	fe043783          	ld	a5,-32(s0)
    8000228c:	83a9                	srli	a5,a5,0xa
    8000228e:	07b2                	slli	a5,a5,0xc
    80002290:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    80002294:	fd843783          	ld	a5,-40(s0)
    80002298:	853e                	mv	a0,a5
    8000229a:	00000097          	auipc	ra,0x0
    8000229e:	fba080e7          	jalr	-70(ra) # 80002254 <freewalk>
      pagetable[i] = 0;
    800022a2:	fec42783          	lw	a5,-20(s0)
    800022a6:	078e                	slli	a5,a5,0x3
    800022a8:	fc843703          	ld	a4,-56(s0)
    800022ac:	97ba                	add	a5,a5,a4
    800022ae:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffd5018>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800022b2:	a829                	j	800022cc <freewalk+0x78>
    } else if(pte & PTE_V){
    800022b4:	fe043783          	ld	a5,-32(s0)
    800022b8:	8b85                	andi	a5,a5,1
    800022ba:	cb89                	beqz	a5,800022cc <freewalk+0x78>
      panic("freewalk: leaf");
    800022bc:	0000a517          	auipc	a0,0xa
    800022c0:	ebc50513          	addi	a0,a0,-324 # 8000c178 <etext+0x178>
    800022c4:	fffff097          	auipc	ra,0xfffff
    800022c8:	9c8080e7          	jalr	-1592(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    800022cc:	fec42783          	lw	a5,-20(s0)
    800022d0:	2785                	addiw	a5,a5,1
    800022d2:	fef42623          	sw	a5,-20(s0)
    800022d6:	fec42783          	lw	a5,-20(s0)
    800022da:	0007871b          	sext.w	a4,a5
    800022de:	1ff00793          	li	a5,511
    800022e2:	f8e7d2e3          	bge	a5,a4,80002266 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    800022e6:	fc843503          	ld	a0,-56(s0)
    800022ea:	fffff097          	auipc	ra,0xfffff
    800022ee:	e46080e7          	jalr	-442(ra) # 80001130 <kfree>
}
    800022f2:	0001                	nop
    800022f4:	70e2                	ld	ra,56(sp)
    800022f6:	7442                	ld	s0,48(sp)
    800022f8:	6121                	addi	sp,sp,64
    800022fa:	8082                	ret

00000000800022fc <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    800022fc:	1101                	addi	sp,sp,-32
    800022fe:	ec06                	sd	ra,24(sp)
    80002300:	e822                	sd	s0,16(sp)
    80002302:	1000                	addi	s0,sp,32
    80002304:	fea43423          	sd	a0,-24(s0)
    80002308:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    8000230c:	fe043783          	ld	a5,-32(s0)
    80002310:	c385                	beqz	a5,80002330 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002312:	fe043703          	ld	a4,-32(s0)
    80002316:	6785                	lui	a5,0x1
    80002318:	17fd                	addi	a5,a5,-1
    8000231a:	97ba                	add	a5,a5,a4
    8000231c:	83b1                	srli	a5,a5,0xc
    8000231e:	4685                	li	a3,1
    80002320:	863e                	mv	a2,a5
    80002322:	4581                	li	a1,0
    80002324:	fe843503          	ld	a0,-24(s0)
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	b86080e7          	jalr	-1146(ra) # 80001eae <uvmunmap>
  freewalk(pagetable);
    80002330:	fe843503          	ld	a0,-24(s0)
    80002334:	00000097          	auipc	ra,0x0
    80002338:	f20080e7          	jalr	-224(ra) # 80002254 <freewalk>
}
    8000233c:	0001                	nop
    8000233e:	60e2                	ld	ra,24(sp)
    80002340:	6442                	ld	s0,16(sp)
    80002342:	6105                	addi	sp,sp,32
    80002344:	8082                	ret

0000000080002346 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    80002346:	711d                	addi	sp,sp,-96
    80002348:	ec86                	sd	ra,88(sp)
    8000234a:	e8a2                	sd	s0,80(sp)
    8000234c:	1080                	addi	s0,sp,96
    8000234e:	faa43c23          	sd	a0,-72(s0)
    80002352:	fab43823          	sd	a1,-80(s0)
    80002356:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    8000235a:	fe043423          	sd	zero,-24(s0)
    8000235e:	a0fd                	j	8000244c <uvmcopy+0x106>
    if((pte = walk(old, i, 0)) == 0)
    80002360:	4601                	li	a2,0
    80002362:	fe843583          	ld	a1,-24(s0)
    80002366:	fb843503          	ld	a0,-72(s0)
    8000236a:	00000097          	auipc	ra,0x0
    8000236e:	84e080e7          	jalr	-1970(ra) # 80001bb8 <walk>
    80002372:	fea43023          	sd	a0,-32(s0)
    80002376:	fe043783          	ld	a5,-32(s0)
    8000237a:	eb89                	bnez	a5,8000238c <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    8000237c:	0000a517          	auipc	a0,0xa
    80002380:	e0c50513          	addi	a0,a0,-500 # 8000c188 <etext+0x188>
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	908080e7          	jalr	-1784(ra) # 80000c8c <panic>
    if((*pte & PTE_ON_DISK) && !(*pte & PTE_PENDING_DISK_OPERATION))
    8000238c:	fe043783          	ld	a5,-32(s0)
    80002390:	639c                	ld	a5,0(a5)
    80002392:	1007f793          	andi	a5,a5,256
    80002396:	cf99                	beqz	a5,800023b4 <uvmcopy+0x6e>
    80002398:	fe043783          	ld	a5,-32(s0)
    8000239c:	639c                	ld	a5,0(a5)
    8000239e:	2007f793          	andi	a5,a5,512
    800023a2:	eb89                	bnez	a5,800023b4 <uvmcopy+0x6e>
      swapin(i, old);
    800023a4:	fb843583          	ld	a1,-72(s0)
    800023a8:	fe843503          	ld	a0,-24(s0)
    800023ac:	00008097          	auipc	ra,0x8
    800023b0:	500080e7          	jalr	1280(ra) # 8000a8ac <swapin>
    if((*pte & PTE_V) == 0)
    800023b4:	fe043783          	ld	a5,-32(s0)
    800023b8:	639c                	ld	a5,0(a5)
    800023ba:	8b85                	andi	a5,a5,1
    800023bc:	eb89                	bnez	a5,800023ce <uvmcopy+0x88>
      panic("uvmcopy: page not present");
    800023be:	0000a517          	auipc	a0,0xa
    800023c2:	dea50513          	addi	a0,a0,-534 # 8000c1a8 <etext+0x1a8>
    800023c6:	fffff097          	auipc	ra,0xfffff
    800023ca:	8c6080e7          	jalr	-1850(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    800023ce:	fe043783          	ld	a5,-32(s0)
    800023d2:	639c                	ld	a5,0(a5)
    800023d4:	83a9                	srli	a5,a5,0xa
    800023d6:	07b2                	slli	a5,a5,0xc
    800023d8:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800023dc:	fe043783          	ld	a5,-32(s0)
    800023e0:	639c                	ld	a5,0(a5)
    800023e2:	2781                	sext.w	a5,a5
    800023e4:	3ff7f793          	andi	a5,a5,1023
    800023e8:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800023ec:	fffff097          	auipc	ra,0xfffff
    800023f0:	dea080e7          	jalr	-534(ra) # 800011d6 <kalloc>
    800023f4:	fca43423          	sd	a0,-56(s0)
    800023f8:	fc843783          	ld	a5,-56(s0)
    800023fc:	c3a5                	beqz	a5,8000245c <uvmcopy+0x116>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800023fe:	fd843783          	ld	a5,-40(s0)
    80002402:	6605                	lui	a2,0x1
    80002404:	85be                	mv	a1,a5
    80002406:	fc843503          	ld	a0,-56(s0)
    8000240a:	fffff097          	auipc	ra,0xfffff
    8000240e:	1ea080e7          	jalr	490(ra) # 800015f4 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002412:	fc843783          	ld	a5,-56(s0)
    80002416:	fd442703          	lw	a4,-44(s0)
    8000241a:	86be                	mv	a3,a5
    8000241c:	6605                	lui	a2,0x1
    8000241e:	fe843583          	ld	a1,-24(s0)
    80002422:	fb043503          	ld	a0,-80(s0)
    80002426:	00000097          	auipc	ra,0x0
    8000242a:	97e080e7          	jalr	-1666(ra) # 80001da4 <mappages>
    8000242e:	87aa                	mv	a5,a0
    80002430:	cb81                	beqz	a5,80002440 <uvmcopy+0xfa>
      kfree(mem);
    80002432:	fc843503          	ld	a0,-56(s0)
    80002436:	fffff097          	auipc	ra,0xfffff
    8000243a:	cfa080e7          	jalr	-774(ra) # 80001130 <kfree>
      goto err;
    8000243e:	a005                	j	8000245e <uvmcopy+0x118>
  for(i = 0; i < sz; i += PGSIZE){
    80002440:	fe843703          	ld	a4,-24(s0)
    80002444:	6785                	lui	a5,0x1
    80002446:	97ba                	add	a5,a5,a4
    80002448:	fef43423          	sd	a5,-24(s0)
    8000244c:	fe843703          	ld	a4,-24(s0)
    80002450:	fa843783          	ld	a5,-88(s0)
    80002454:	f0f766e3          	bltu	a4,a5,80002360 <uvmcopy+0x1a>
    }
  }

  return 0;
    80002458:	4781                	li	a5,0
    8000245a:	a839                	j	80002478 <uvmcopy+0x132>
      goto err;
    8000245c:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    8000245e:	fe843783          	ld	a5,-24(s0)
    80002462:	83b1                	srli	a5,a5,0xc
    80002464:	4685                	li	a3,1
    80002466:	863e                	mv	a2,a5
    80002468:	4581                	li	a1,0
    8000246a:	fb043503          	ld	a0,-80(s0)
    8000246e:	00000097          	auipc	ra,0x0
    80002472:	a40080e7          	jalr	-1472(ra) # 80001eae <uvmunmap>
  return -1;
    80002476:	57fd                	li	a5,-1
}
    80002478:	853e                	mv	a0,a5
    8000247a:	60e6                	ld	ra,88(sp)
    8000247c:	6446                	ld	s0,80(sp)
    8000247e:	6125                	addi	sp,sp,96
    80002480:	8082                	ret

0000000080002482 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002482:	7179                	addi	sp,sp,-48
    80002484:	f406                	sd	ra,40(sp)
    80002486:	f022                	sd	s0,32(sp)
    80002488:	1800                	addi	s0,sp,48
    8000248a:	fca43c23          	sd	a0,-40(s0)
    8000248e:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    80002492:	4601                	li	a2,0
    80002494:	fd043583          	ld	a1,-48(s0)
    80002498:	fd843503          	ld	a0,-40(s0)
    8000249c:	fffff097          	auipc	ra,0xfffff
    800024a0:	71c080e7          	jalr	1820(ra) # 80001bb8 <walk>
    800024a4:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800024a8:	fe843783          	ld	a5,-24(s0)
    800024ac:	eb89                	bnez	a5,800024be <uvmclear+0x3c>
    panic("uvmclear");
    800024ae:	0000a517          	auipc	a0,0xa
    800024b2:	d1a50513          	addi	a0,a0,-742 # 8000c1c8 <etext+0x1c8>
    800024b6:	ffffe097          	auipc	ra,0xffffe
    800024ba:	7d6080e7          	jalr	2006(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    800024be:	fe843783          	ld	a5,-24(s0)
    800024c2:	639c                	ld	a5,0(a5)
    800024c4:	fef7f713          	andi	a4,a5,-17
    800024c8:	fe843783          	ld	a5,-24(s0)
    800024cc:	e398                	sd	a4,0(a5)

  if(ispteswappable(pagetable, va, pte))
    800024ce:	fe843603          	ld	a2,-24(s0)
    800024d2:	fd043583          	ld	a1,-48(s0)
    800024d6:	fd843503          	ld	a0,-40(s0)
    800024da:	00008097          	auipc	ra,0x8
    800024de:	e56080e7          	jalr	-426(ra) # 8000a330 <ispteswappable>
    800024e2:	87aa                	mv	a5,a0
    800024e4:	cb89                	beqz	a5,800024f6 <uvmclear+0x74>
    unreglrupage(va, pagetable);
    800024e6:	fd843583          	ld	a1,-40(s0)
    800024ea:	fd043503          	ld	a0,-48(s0)
    800024ee:	00008097          	auipc	ra,0x8
    800024f2:	07c080e7          	jalr	124(ra) # 8000a56a <unreglrupage>
}
    800024f6:	0001                	nop
    800024f8:	70a2                	ld	ra,40(sp)
    800024fa:	7402                	ld	s0,32(sp)
    800024fc:	6145                	addi	sp,sp,48
    800024fe:	8082                	ret

0000000080002500 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    80002500:	715d                	addi	sp,sp,-80
    80002502:	e486                	sd	ra,72(sp)
    80002504:	e0a2                	sd	s0,64(sp)
    80002506:	0880                	addi	s0,sp,80
    80002508:	fca43423          	sd	a0,-56(s0)
    8000250c:	fcb43023          	sd	a1,-64(s0)
    80002510:	fac43c23          	sd	a2,-72(s0)
    80002514:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002518:	a055                	j	800025bc <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    8000251a:	fc043703          	ld	a4,-64(s0)
    8000251e:	77fd                	lui	a5,0xfffff
    80002520:	8ff9                	and	a5,a5,a4
    80002522:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002526:	fe043583          	ld	a1,-32(s0)
    8000252a:	fc843503          	ld	a0,-56(s0)
    8000252e:	fffff097          	auipc	ra,0xfffff
    80002532:	76e080e7          	jalr	1902(ra) # 80001c9c <walkaddr>
    80002536:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000253a:	fd843783          	ld	a5,-40(s0)
    8000253e:	e399                	bnez	a5,80002544 <copyout+0x44>
      return -1;
    80002540:	57fd                	li	a5,-1
    80002542:	a049                	j	800025c4 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    80002544:	fe043703          	ld	a4,-32(s0)
    80002548:	fc043783          	ld	a5,-64(s0)
    8000254c:	8f1d                	sub	a4,a4,a5
    8000254e:	6785                	lui	a5,0x1
    80002550:	97ba                	add	a5,a5,a4
    80002552:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002556:	fe843703          	ld	a4,-24(s0)
    8000255a:	fb043783          	ld	a5,-80(s0)
    8000255e:	00e7f663          	bgeu	a5,a4,8000256a <copyout+0x6a>
      n = len;
    80002562:	fb043783          	ld	a5,-80(s0)
    80002566:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8000256a:	fc043703          	ld	a4,-64(s0)
    8000256e:	fe043783          	ld	a5,-32(s0)
    80002572:	8f1d                	sub	a4,a4,a5
    80002574:	fd843783          	ld	a5,-40(s0)
    80002578:	97ba                	add	a5,a5,a4
    8000257a:	873e                	mv	a4,a5
    8000257c:	fe843783          	ld	a5,-24(s0)
    80002580:	2781                	sext.w	a5,a5
    80002582:	863e                	mv	a2,a5
    80002584:	fb843583          	ld	a1,-72(s0)
    80002588:	853a                	mv	a0,a4
    8000258a:	fffff097          	auipc	ra,0xfffff
    8000258e:	06a080e7          	jalr	106(ra) # 800015f4 <memmove>

    len -= n;
    80002592:	fb043703          	ld	a4,-80(s0)
    80002596:	fe843783          	ld	a5,-24(s0)
    8000259a:	40f707b3          	sub	a5,a4,a5
    8000259e:	faf43823          	sd	a5,-80(s0)
    src += n;
    800025a2:	fb843703          	ld	a4,-72(s0)
    800025a6:	fe843783          	ld	a5,-24(s0)
    800025aa:	97ba                	add	a5,a5,a4
    800025ac:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    800025b0:	fe043703          	ld	a4,-32(s0)
    800025b4:	6785                	lui	a5,0x1
    800025b6:	97ba                	add	a5,a5,a4
    800025b8:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800025bc:	fb043783          	ld	a5,-80(s0)
    800025c0:	ffa9                	bnez	a5,8000251a <copyout+0x1a>
  }
  return 0;
    800025c2:	4781                	li	a5,0
}
    800025c4:	853e                	mv	a0,a5
    800025c6:	60a6                	ld	ra,72(sp)
    800025c8:	6406                	ld	s0,64(sp)
    800025ca:	6161                	addi	sp,sp,80
    800025cc:	8082                	ret

00000000800025ce <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800025ce:	715d                	addi	sp,sp,-80
    800025d0:	e486                	sd	ra,72(sp)
    800025d2:	e0a2                	sd	s0,64(sp)
    800025d4:	0880                	addi	s0,sp,80
    800025d6:	fca43423          	sd	a0,-56(s0)
    800025da:	fcb43023          	sd	a1,-64(s0)
    800025de:	fac43c23          	sd	a2,-72(s0)
    800025e2:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800025e6:	a055                	j	8000268a <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800025e8:	fb843703          	ld	a4,-72(s0)
    800025ec:	77fd                	lui	a5,0xfffff
    800025ee:	8ff9                	and	a5,a5,a4
    800025f0:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800025f4:	fe043583          	ld	a1,-32(s0)
    800025f8:	fc843503          	ld	a0,-56(s0)
    800025fc:	fffff097          	auipc	ra,0xfffff
    80002600:	6a0080e7          	jalr	1696(ra) # 80001c9c <walkaddr>
    80002604:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002608:	fd843783          	ld	a5,-40(s0)
    8000260c:	e399                	bnez	a5,80002612 <copyin+0x44>
      return -1;
    8000260e:	57fd                	li	a5,-1
    80002610:	a049                	j	80002692 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    80002612:	fe043703          	ld	a4,-32(s0)
    80002616:	fb843783          	ld	a5,-72(s0)
    8000261a:	8f1d                	sub	a4,a4,a5
    8000261c:	6785                	lui	a5,0x1
    8000261e:	97ba                	add	a5,a5,a4
    80002620:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002624:	fe843703          	ld	a4,-24(s0)
    80002628:	fb043783          	ld	a5,-80(s0)
    8000262c:	00e7f663          	bgeu	a5,a4,80002638 <copyin+0x6a>
      n = len;
    80002630:	fb043783          	ld	a5,-80(s0)
    80002634:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80002638:	fb843703          	ld	a4,-72(s0)
    8000263c:	fe043783          	ld	a5,-32(s0)
    80002640:	8f1d                	sub	a4,a4,a5
    80002642:	fd843783          	ld	a5,-40(s0)
    80002646:	97ba                	add	a5,a5,a4
    80002648:	873e                	mv	a4,a5
    8000264a:	fe843783          	ld	a5,-24(s0)
    8000264e:	2781                	sext.w	a5,a5
    80002650:	863e                	mv	a2,a5
    80002652:	85ba                	mv	a1,a4
    80002654:	fc043503          	ld	a0,-64(s0)
    80002658:	fffff097          	auipc	ra,0xfffff
    8000265c:	f9c080e7          	jalr	-100(ra) # 800015f4 <memmove>

    len -= n;
    80002660:	fb043703          	ld	a4,-80(s0)
    80002664:	fe843783          	ld	a5,-24(s0)
    80002668:	40f707b3          	sub	a5,a4,a5
    8000266c:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002670:	fc043703          	ld	a4,-64(s0)
    80002674:	fe843783          	ld	a5,-24(s0)
    80002678:	97ba                	add	a5,a5,a4
    8000267a:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    8000267e:	fe043703          	ld	a4,-32(s0)
    80002682:	6785                	lui	a5,0x1
    80002684:	97ba                	add	a5,a5,a4
    80002686:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    8000268a:	fb043783          	ld	a5,-80(s0)
    8000268e:	ffa9                	bnez	a5,800025e8 <copyin+0x1a>
  }
  return 0;
    80002690:	4781                	li	a5,0
}
    80002692:	853e                	mv	a0,a5
    80002694:	60a6                	ld	ra,72(sp)
    80002696:	6406                	ld	s0,64(sp)
    80002698:	6161                	addi	sp,sp,80
    8000269a:	8082                	ret

000000008000269c <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    8000269c:	711d                	addi	sp,sp,-96
    8000269e:	ec86                	sd	ra,88(sp)
    800026a0:	e8a2                	sd	s0,80(sp)
    800026a2:	1080                	addi	s0,sp,96
    800026a4:	faa43c23          	sd	a0,-72(s0)
    800026a8:	fab43823          	sd	a1,-80(s0)
    800026ac:	fac43423          	sd	a2,-88(s0)
    800026b0:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    800026b4:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    800026b8:	a0f1                	j	80002784 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800026ba:	fa843703          	ld	a4,-88(s0)
    800026be:	77fd                	lui	a5,0xfffff
    800026c0:	8ff9                	and	a5,a5,a4
    800026c2:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800026c6:	fd043583          	ld	a1,-48(s0)
    800026ca:	fb843503          	ld	a0,-72(s0)
    800026ce:	fffff097          	auipc	ra,0xfffff
    800026d2:	5ce080e7          	jalr	1486(ra) # 80001c9c <walkaddr>
    800026d6:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800026da:	fc843783          	ld	a5,-56(s0)
    800026de:	e399                	bnez	a5,800026e4 <copyinstr+0x48>
      return -1;
    800026e0:	57fd                	li	a5,-1
    800026e2:	a87d                	j	800027a0 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800026e4:	fd043703          	ld	a4,-48(s0)
    800026e8:	fa843783          	ld	a5,-88(s0)
    800026ec:	8f1d                	sub	a4,a4,a5
    800026ee:	6785                	lui	a5,0x1
    800026f0:	97ba                	add	a5,a5,a4
    800026f2:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800026f6:	fe843703          	ld	a4,-24(s0)
    800026fa:	fa043783          	ld	a5,-96(s0)
    800026fe:	00e7f663          	bgeu	a5,a4,8000270a <copyinstr+0x6e>
      n = max;
    80002702:	fa043783          	ld	a5,-96(s0)
    80002706:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    8000270a:	fa843703          	ld	a4,-88(s0)
    8000270e:	fd043783          	ld	a5,-48(s0)
    80002712:	8f1d                	sub	a4,a4,a5
    80002714:	fc843783          	ld	a5,-56(s0)
    80002718:	97ba                	add	a5,a5,a4
    8000271a:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    8000271e:	a891                	j	80002772 <copyinstr+0xd6>
      if(*p == '\0'){
    80002720:	fd843783          	ld	a5,-40(s0)
    80002724:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    80002728:	eb89                	bnez	a5,8000273a <copyinstr+0x9e>
        *dst = '\0';
    8000272a:	fb043783          	ld	a5,-80(s0)
    8000272e:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002732:	4785                	li	a5,1
    80002734:	fef42223          	sw	a5,-28(s0)
        break;
    80002738:	a081                	j	80002778 <copyinstr+0xdc>
      } else {
        *dst = *p;
    8000273a:	fd843783          	ld	a5,-40(s0)
    8000273e:	0007c703          	lbu	a4,0(a5)
    80002742:	fb043783          	ld	a5,-80(s0)
    80002746:	00e78023          	sb	a4,0(a5)
      }
      --n;
    8000274a:	fe843783          	ld	a5,-24(s0)
    8000274e:	17fd                	addi	a5,a5,-1
    80002750:	fef43423          	sd	a5,-24(s0)
      --max;
    80002754:	fa043783          	ld	a5,-96(s0)
    80002758:	17fd                	addi	a5,a5,-1
    8000275a:	faf43023          	sd	a5,-96(s0)
      p++;
    8000275e:	fd843783          	ld	a5,-40(s0)
    80002762:	0785                	addi	a5,a5,1
    80002764:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    80002768:	fb043783          	ld	a5,-80(s0)
    8000276c:	0785                	addi	a5,a5,1
    8000276e:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002772:	fe843783          	ld	a5,-24(s0)
    80002776:	f7cd                	bnez	a5,80002720 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    80002778:	fd043703          	ld	a4,-48(s0)
    8000277c:	6785                	lui	a5,0x1
    8000277e:	97ba                	add	a5,a5,a4
    80002780:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    80002784:	fe442783          	lw	a5,-28(s0)
    80002788:	2781                	sext.w	a5,a5
    8000278a:	e781                	bnez	a5,80002792 <copyinstr+0xf6>
    8000278c:	fa043783          	ld	a5,-96(s0)
    80002790:	f78d                	bnez	a5,800026ba <copyinstr+0x1e>
  }
  if(got_null){
    80002792:	fe442783          	lw	a5,-28(s0)
    80002796:	2781                	sext.w	a5,a5
    80002798:	c399                	beqz	a5,8000279e <copyinstr+0x102>
    return 0;
    8000279a:	4781                	li	a5,0
    8000279c:	a011                	j	800027a0 <copyinstr+0x104>
  } else {
    return -1;
    8000279e:	57fd                	li	a5,-1
  }
}
    800027a0:	853e                	mv	a0,a5
    800027a2:	60e6                	ld	ra,88(sp)
    800027a4:	6446                	ld	s0,80(sp)
    800027a6:	6125                	addi	sp,sp,96
    800027a8:	8082                	ret

00000000800027aa <r_sstatus>:
{
    800027aa:	1101                	addi	sp,sp,-32
    800027ac:	ec22                	sd	s0,24(sp)
    800027ae:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800027b0:	100027f3          	csrr	a5,sstatus
    800027b4:	fef43423          	sd	a5,-24(s0)
  return x;
    800027b8:	fe843783          	ld	a5,-24(s0)
}
    800027bc:	853e                	mv	a0,a5
    800027be:	6462                	ld	s0,24(sp)
    800027c0:	6105                	addi	sp,sp,32
    800027c2:	8082                	ret

00000000800027c4 <w_sstatus>:
{
    800027c4:	1101                	addi	sp,sp,-32
    800027c6:	ec22                	sd	s0,24(sp)
    800027c8:	1000                	addi	s0,sp,32
    800027ca:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800027ce:	fe843783          	ld	a5,-24(s0)
    800027d2:	10079073          	csrw	sstatus,a5
}
    800027d6:	0001                	nop
    800027d8:	6462                	ld	s0,24(sp)
    800027da:	6105                	addi	sp,sp,32
    800027dc:	8082                	ret

00000000800027de <intr_on>:
{
    800027de:	1141                	addi	sp,sp,-16
    800027e0:	e406                	sd	ra,8(sp)
    800027e2:	e022                	sd	s0,0(sp)
    800027e4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800027e6:	00000097          	auipc	ra,0x0
    800027ea:	fc4080e7          	jalr	-60(ra) # 800027aa <r_sstatus>
    800027ee:	87aa                	mv	a5,a0
    800027f0:	0027e793          	ori	a5,a5,2
    800027f4:	853e                	mv	a0,a5
    800027f6:	00000097          	auipc	ra,0x0
    800027fa:	fce080e7          	jalr	-50(ra) # 800027c4 <w_sstatus>
}
    800027fe:	0001                	nop
    80002800:	60a2                	ld	ra,8(sp)
    80002802:	6402                	ld	s0,0(sp)
    80002804:	0141                	addi	sp,sp,16
    80002806:	8082                	ret

0000000080002808 <intr_get>:
{
    80002808:	1101                	addi	sp,sp,-32
    8000280a:	ec06                	sd	ra,24(sp)
    8000280c:	e822                	sd	s0,16(sp)
    8000280e:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80002810:	00000097          	auipc	ra,0x0
    80002814:	f9a080e7          	jalr	-102(ra) # 800027aa <r_sstatus>
    80002818:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    8000281c:	fe843783          	ld	a5,-24(s0)
    80002820:	8b89                	andi	a5,a5,2
    80002822:	00f037b3          	snez	a5,a5
    80002826:	0ff7f793          	andi	a5,a5,255
    8000282a:	2781                	sext.w	a5,a5
}
    8000282c:	853e                	mv	a0,a5
    8000282e:	60e2                	ld	ra,24(sp)
    80002830:	6442                	ld	s0,16(sp)
    80002832:	6105                	addi	sp,sp,32
    80002834:	8082                	ret

0000000080002836 <r_tp>:
{
    80002836:	1101                	addi	sp,sp,-32
    80002838:	ec22                	sd	s0,24(sp)
    8000283a:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    8000283c:	8792                	mv	a5,tp
    8000283e:	fef43423          	sd	a5,-24(s0)
  return x;
    80002842:	fe843783          	ld	a5,-24(s0)
}
    80002846:	853e                	mv	a0,a5
    80002848:	6462                	ld	s0,24(sp)
    8000284a:	6105                	addi	sp,sp,32
    8000284c:	8082                	ret

000000008000284e <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    8000284e:	7139                	addi	sp,sp,-64
    80002850:	fc06                	sd	ra,56(sp)
    80002852:	f822                	sd	s0,48(sp)
    80002854:	0080                	addi	s0,sp,64
    80002856:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    8000285a:	00012797          	auipc	a5,0x12
    8000285e:	7de78793          	addi	a5,a5,2014 # 80015038 <proc>
    80002862:	fef43423          	sd	a5,-24(s0)
    80002866:	a061                	j	800028ee <proc_mapstacks+0xa0>
    char *pa = kalloc();
    80002868:	fffff097          	auipc	ra,0xfffff
    8000286c:	96e080e7          	jalr	-1682(ra) # 800011d6 <kalloc>
    80002870:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80002874:	fe043783          	ld	a5,-32(s0)
    80002878:	eb89                	bnez	a5,8000288a <proc_mapstacks+0x3c>
      panic("kalloc");
    8000287a:	0000a517          	auipc	a0,0xa
    8000287e:	95e50513          	addi	a0,a0,-1698 # 8000c1d8 <etext+0x1d8>
    80002882:	ffffe097          	auipc	ra,0xffffe
    80002886:	40a080e7          	jalr	1034(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    8000288a:	fe843703          	ld	a4,-24(s0)
    8000288e:	00012797          	auipc	a5,0x12
    80002892:	7aa78793          	addi	a5,a5,1962 # 80015038 <proc>
    80002896:	40f707b3          	sub	a5,a4,a5
    8000289a:	4037d713          	srai	a4,a5,0x3
    8000289e:	0000a797          	auipc	a5,0xa
    800028a2:	a3278793          	addi	a5,a5,-1486 # 8000c2d0 <etext+0x2d0>
    800028a6:	639c                	ld	a5,0(a5)
    800028a8:	02f707b3          	mul	a5,a4,a5
    800028ac:	2781                	sext.w	a5,a5
    800028ae:	2785                	addiw	a5,a5,1
    800028b0:	2781                	sext.w	a5,a5
    800028b2:	00d7979b          	slliw	a5,a5,0xd
    800028b6:	2781                	sext.w	a5,a5
    800028b8:	873e                	mv	a4,a5
    800028ba:	040007b7          	lui	a5,0x4000
    800028be:	17fd                	addi	a5,a5,-1
    800028c0:	07b2                	slli	a5,a5,0xc
    800028c2:	8f99                	sub	a5,a5,a4
    800028c4:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800028c8:	fe043783          	ld	a5,-32(s0)
    800028cc:	4719                	li	a4,6
    800028ce:	6685                	lui	a3,0x1
    800028d0:	863e                	mv	a2,a5
    800028d2:	fd843583          	ld	a1,-40(s0)
    800028d6:	fc843503          	ld	a0,-56(s0)
    800028da:	fffff097          	auipc	ra,0xfffff
    800028de:	470080e7          	jalr	1136(ra) # 80001d4a <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028e2:	fe843783          	ld	a5,-24(s0)
    800028e6:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    800028ea:	fef43423          	sd	a5,-24(s0)
    800028ee:	fe843703          	ld	a4,-24(s0)
    800028f2:	00018797          	auipc	a5,0x18
    800028f6:	14678793          	addi	a5,a5,326 # 8001aa38 <pid_lock>
    800028fa:	f6f767e3          	bltu	a4,a5,80002868 <proc_mapstacks+0x1a>
  }
}
    800028fe:	0001                	nop
    80002900:	0001                	nop
    80002902:	70e2                	ld	ra,56(sp)
    80002904:	7442                	ld	s0,48(sp)
    80002906:	6121                	addi	sp,sp,64
    80002908:	8082                	ret

000000008000290a <procinit>:

// initialize the proc table.
void
procinit(void)
{
    8000290a:	1101                	addi	sp,sp,-32
    8000290c:	ec06                	sd	ra,24(sp)
    8000290e:	e822                	sd	s0,16(sp)
    80002910:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    80002912:	0000a597          	auipc	a1,0xa
    80002916:	8ce58593          	addi	a1,a1,-1842 # 8000c1e0 <etext+0x1e0>
    8000291a:	00018517          	auipc	a0,0x18
    8000291e:	11e50513          	addi	a0,a0,286 # 8001aa38 <pid_lock>
    80002922:	fffff097          	auipc	ra,0xfffff
    80002926:	9ea080e7          	jalr	-1558(ra) # 8000130c <initlock>
  initlock(&wait_lock, "wait_lock");
    8000292a:	0000a597          	auipc	a1,0xa
    8000292e:	8be58593          	addi	a1,a1,-1858 # 8000c1e8 <etext+0x1e8>
    80002932:	00018517          	auipc	a0,0x18
    80002936:	11e50513          	addi	a0,a0,286 # 8001aa50 <wait_lock>
    8000293a:	fffff097          	auipc	ra,0xfffff
    8000293e:	9d2080e7          	jalr	-1582(ra) # 8000130c <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002942:	00012797          	auipc	a5,0x12
    80002946:	6f678793          	addi	a5,a5,1782 # 80015038 <proc>
    8000294a:	fef43423          	sd	a5,-24(s0)
    8000294e:	a0bd                	j	800029bc <procinit+0xb2>
      initlock(&p->lock, "proc");
    80002950:	fe843783          	ld	a5,-24(s0)
    80002954:	0000a597          	auipc	a1,0xa
    80002958:	8a458593          	addi	a1,a1,-1884 # 8000c1f8 <etext+0x1f8>
    8000295c:	853e                	mv	a0,a5
    8000295e:	fffff097          	auipc	ra,0xfffff
    80002962:	9ae080e7          	jalr	-1618(ra) # 8000130c <initlock>
      p->state = UNUSED;
    80002966:	fe843783          	ld	a5,-24(s0)
    8000296a:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    8000296e:	fe843703          	ld	a4,-24(s0)
    80002972:	00012797          	auipc	a5,0x12
    80002976:	6c678793          	addi	a5,a5,1734 # 80015038 <proc>
    8000297a:	40f707b3          	sub	a5,a4,a5
    8000297e:	4037d713          	srai	a4,a5,0x3
    80002982:	0000a797          	auipc	a5,0xa
    80002986:	94e78793          	addi	a5,a5,-1714 # 8000c2d0 <etext+0x2d0>
    8000298a:	639c                	ld	a5,0(a5)
    8000298c:	02f707b3          	mul	a5,a4,a5
    80002990:	2781                	sext.w	a5,a5
    80002992:	2785                	addiw	a5,a5,1
    80002994:	2781                	sext.w	a5,a5
    80002996:	00d7979b          	slliw	a5,a5,0xd
    8000299a:	2781                	sext.w	a5,a5
    8000299c:	873e                	mv	a4,a5
    8000299e:	040007b7          	lui	a5,0x4000
    800029a2:	17fd                	addi	a5,a5,-1
    800029a4:	07b2                	slli	a5,a5,0xc
    800029a6:	8f99                	sub	a5,a5,a4
    800029a8:	873e                	mv	a4,a5
    800029aa:	fe843783          	ld	a5,-24(s0)
    800029ae:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    800029b0:	fe843783          	ld	a5,-24(s0)
    800029b4:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    800029b8:	fef43423          	sd	a5,-24(s0)
    800029bc:	fe843703          	ld	a4,-24(s0)
    800029c0:	00018797          	auipc	a5,0x18
    800029c4:	07878793          	addi	a5,a5,120 # 8001aa38 <pid_lock>
    800029c8:	f8f764e3          	bltu	a4,a5,80002950 <procinit+0x46>
  }
}
    800029cc:	0001                	nop
    800029ce:	0001                	nop
    800029d0:	60e2                	ld	ra,24(sp)
    800029d2:	6442                	ld	s0,16(sp)
    800029d4:	6105                	addi	sp,sp,32
    800029d6:	8082                	ret

00000000800029d8 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800029d8:	1101                	addi	sp,sp,-32
    800029da:	ec06                	sd	ra,24(sp)
    800029dc:	e822                	sd	s0,16(sp)
    800029de:	1000                	addi	s0,sp,32
  int id = r_tp();
    800029e0:	00000097          	auipc	ra,0x0
    800029e4:	e56080e7          	jalr	-426(ra) # 80002836 <r_tp>
    800029e8:	87aa                	mv	a5,a0
    800029ea:	fef42623          	sw	a5,-20(s0)
  return id;
    800029ee:	fec42783          	lw	a5,-20(s0)
}
    800029f2:	853e                	mv	a0,a5
    800029f4:	60e2                	ld	ra,24(sp)
    800029f6:	6442                	ld	s0,16(sp)
    800029f8:	6105                	addi	sp,sp,32
    800029fa:	8082                	ret

00000000800029fc <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    800029fc:	1101                	addi	sp,sp,-32
    800029fe:	ec06                	sd	ra,24(sp)
    80002a00:	e822                	sd	s0,16(sp)
    80002a02:	1000                	addi	s0,sp,32
  int id = cpuid();
    80002a04:	00000097          	auipc	ra,0x0
    80002a08:	fd4080e7          	jalr	-44(ra) # 800029d8 <cpuid>
    80002a0c:	87aa                	mv	a5,a0
    80002a0e:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002a12:	fec42783          	lw	a5,-20(s0)
    80002a16:	00779713          	slli	a4,a5,0x7
    80002a1a:	00012797          	auipc	a5,0x12
    80002a1e:	21e78793          	addi	a5,a5,542 # 80014c38 <cpus>
    80002a22:	97ba                	add	a5,a5,a4
    80002a24:	fef43023          	sd	a5,-32(s0)
  return c;
    80002a28:	fe043783          	ld	a5,-32(s0)
}
    80002a2c:	853e                	mv	a0,a5
    80002a2e:	60e2                	ld	ra,24(sp)
    80002a30:	6442                	ld	s0,16(sp)
    80002a32:	6105                	addi	sp,sp,32
    80002a34:	8082                	ret

0000000080002a36 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002a36:	1101                	addi	sp,sp,-32
    80002a38:	ec06                	sd	ra,24(sp)
    80002a3a:	e822                	sd	s0,16(sp)
    80002a3c:	1000                	addi	s0,sp,32
  push_off();
    80002a3e:	fffff097          	auipc	ra,0xfffff
    80002a42:	9fc080e7          	jalr	-1540(ra) # 8000143a <push_off>
  struct cpu *c = mycpu();
    80002a46:	00000097          	auipc	ra,0x0
    80002a4a:	fb6080e7          	jalr	-74(ra) # 800029fc <mycpu>
    80002a4e:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002a52:	fe843783          	ld	a5,-24(s0)
    80002a56:	639c                	ld	a5,0(a5)
    80002a58:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	a36080e7          	jalr	-1482(ra) # 80001492 <pop_off>
  return p;
    80002a64:	fe043783          	ld	a5,-32(s0)
}
    80002a68:	853e                	mv	a0,a5
    80002a6a:	60e2                	ld	ra,24(sp)
    80002a6c:	6442                	ld	s0,16(sp)
    80002a6e:	6105                	addi	sp,sp,32
    80002a70:	8082                	ret

0000000080002a72 <allocpid>:

int
allocpid()
{
    80002a72:	1101                	addi	sp,sp,-32
    80002a74:	ec06                	sd	ra,24(sp)
    80002a76:	e822                	sd	s0,16(sp)
    80002a78:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002a7a:	00018517          	auipc	a0,0x18
    80002a7e:	fbe50513          	addi	a0,a0,-66 # 8001aa38 <pid_lock>
    80002a82:	fffff097          	auipc	ra,0xfffff
    80002a86:	8ba080e7          	jalr	-1862(ra) # 8000133c <acquire>
  pid = nextpid;
    80002a8a:	0000a797          	auipc	a5,0xa
    80002a8e:	db678793          	addi	a5,a5,-586 # 8000c840 <nextpid>
    80002a92:	439c                	lw	a5,0(a5)
    80002a94:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002a98:	0000a797          	auipc	a5,0xa
    80002a9c:	da878793          	addi	a5,a5,-600 # 8000c840 <nextpid>
    80002aa0:	439c                	lw	a5,0(a5)
    80002aa2:	2785                	addiw	a5,a5,1
    80002aa4:	0007871b          	sext.w	a4,a5
    80002aa8:	0000a797          	auipc	a5,0xa
    80002aac:	d9878793          	addi	a5,a5,-616 # 8000c840 <nextpid>
    80002ab0:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002ab2:	00018517          	auipc	a0,0x18
    80002ab6:	f8650513          	addi	a0,a0,-122 # 8001aa38 <pid_lock>
    80002aba:	fffff097          	auipc	ra,0xfffff
    80002abe:	8e6080e7          	jalr	-1818(ra) # 800013a0 <release>

  return pid;
    80002ac2:	fec42783          	lw	a5,-20(s0)
}
    80002ac6:	853e                	mv	a0,a5
    80002ac8:	60e2                	ld	ra,24(sp)
    80002aca:	6442                	ld	s0,16(sp)
    80002acc:	6105                	addi	sp,sp,32
    80002ace:	8082                	ret

0000000080002ad0 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002ad0:	1101                	addi	sp,sp,-32
    80002ad2:	ec06                	sd	ra,24(sp)
    80002ad4:	e822                	sd	s0,16(sp)
    80002ad6:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002ad8:	00012797          	auipc	a5,0x12
    80002adc:	56078793          	addi	a5,a5,1376 # 80015038 <proc>
    80002ae0:	fef43423          	sd	a5,-24(s0)
    80002ae4:	a80d                	j	80002b16 <allocproc+0x46>
    acquire(&p->lock);
    80002ae6:	fe843783          	ld	a5,-24(s0)
    80002aea:	853e                	mv	a0,a5
    80002aec:	fffff097          	auipc	ra,0xfffff
    80002af0:	850080e7          	jalr	-1968(ra) # 8000133c <acquire>
    if(p->state == UNUSED) {
    80002af4:	fe843783          	ld	a5,-24(s0)
    80002af8:	4f9c                	lw	a5,24(a5)
    80002afa:	cb85                	beqz	a5,80002b2a <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002afc:	fe843783          	ld	a5,-24(s0)
    80002b00:	853e                	mv	a0,a5
    80002b02:	fffff097          	auipc	ra,0xfffff
    80002b06:	89e080e7          	jalr	-1890(ra) # 800013a0 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002b0a:	fe843783          	ld	a5,-24(s0)
    80002b0e:	16878793          	addi	a5,a5,360
    80002b12:	fef43423          	sd	a5,-24(s0)
    80002b16:	fe843703          	ld	a4,-24(s0)
    80002b1a:	00018797          	auipc	a5,0x18
    80002b1e:	f1e78793          	addi	a5,a5,-226 # 8001aa38 <pid_lock>
    80002b22:	fcf762e3          	bltu	a4,a5,80002ae6 <allocproc+0x16>
    }
  }
  return 0;
    80002b26:	4781                	li	a5,0
    80002b28:	a0e1                	j	80002bf0 <allocproc+0x120>
      goto found;
    80002b2a:	0001                	nop

found:
  p->pid = allocpid();
    80002b2c:	00000097          	auipc	ra,0x0
    80002b30:	f46080e7          	jalr	-186(ra) # 80002a72 <allocpid>
    80002b34:	87aa                	mv	a5,a0
    80002b36:	873e                	mv	a4,a5
    80002b38:	fe843783          	ld	a5,-24(s0)
    80002b3c:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002b3e:	fe843783          	ld	a5,-24(s0)
    80002b42:	4705                	li	a4,1
    80002b44:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002b46:	ffffe097          	auipc	ra,0xffffe
    80002b4a:	690080e7          	jalr	1680(ra) # 800011d6 <kalloc>
    80002b4e:	872a                	mv	a4,a0
    80002b50:	fe843783          	ld	a5,-24(s0)
    80002b54:	efb8                	sd	a4,88(a5)
    80002b56:	fe843783          	ld	a5,-24(s0)
    80002b5a:	6fbc                	ld	a5,88(a5)
    80002b5c:	e385                	bnez	a5,80002b7c <allocproc+0xac>
    freeproc(p);
    80002b5e:	fe843503          	ld	a0,-24(s0)
    80002b62:	00000097          	auipc	ra,0x0
    80002b66:	098080e7          	jalr	152(ra) # 80002bfa <freeproc>
    release(&p->lock);
    80002b6a:	fe843783          	ld	a5,-24(s0)
    80002b6e:	853e                	mv	a0,a5
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	830080e7          	jalr	-2000(ra) # 800013a0 <release>
    return 0;
    80002b78:	4781                	li	a5,0
    80002b7a:	a89d                	j	80002bf0 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002b7c:	fe843503          	ld	a0,-24(s0)
    80002b80:	00000097          	auipc	ra,0x0
    80002b84:	118080e7          	jalr	280(ra) # 80002c98 <proc_pagetable>
    80002b88:	872a                	mv	a4,a0
    80002b8a:	fe843783          	ld	a5,-24(s0)
    80002b8e:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002b90:	fe843783          	ld	a5,-24(s0)
    80002b94:	6bbc                	ld	a5,80(a5)
    80002b96:	e385                	bnez	a5,80002bb6 <allocproc+0xe6>
    freeproc(p);
    80002b98:	fe843503          	ld	a0,-24(s0)
    80002b9c:	00000097          	auipc	ra,0x0
    80002ba0:	05e080e7          	jalr	94(ra) # 80002bfa <freeproc>
    release(&p->lock);
    80002ba4:	fe843783          	ld	a5,-24(s0)
    80002ba8:	853e                	mv	a0,a5
    80002baa:	ffffe097          	auipc	ra,0xffffe
    80002bae:	7f6080e7          	jalr	2038(ra) # 800013a0 <release>
    return 0;
    80002bb2:	4781                	li	a5,0
    80002bb4:	a835                	j	80002bf0 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002bb6:	fe843783          	ld	a5,-24(s0)
    80002bba:	06078793          	addi	a5,a5,96
    80002bbe:	07000613          	li	a2,112
    80002bc2:	4581                	li	a1,0
    80002bc4:	853e                	mv	a0,a5
    80002bc6:	fffff097          	auipc	ra,0xfffff
    80002bca:	94a080e7          	jalr	-1718(ra) # 80001510 <memset>
  p->context.ra = (uint64)forkret;
    80002bce:	00001717          	auipc	a4,0x1
    80002bd2:	a1a70713          	addi	a4,a4,-1510 # 800035e8 <forkret>
    80002bd6:	fe843783          	ld	a5,-24(s0)
    80002bda:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002bdc:	fe843783          	ld	a5,-24(s0)
    80002be0:	63b8                	ld	a4,64(a5)
    80002be2:	6785                	lui	a5,0x1
    80002be4:	973e                	add	a4,a4,a5
    80002be6:	fe843783          	ld	a5,-24(s0)
    80002bea:	f7b8                	sd	a4,104(a5)

  return p;
    80002bec:	fe843783          	ld	a5,-24(s0)
}
    80002bf0:	853e                	mv	a0,a5
    80002bf2:	60e2                	ld	ra,24(sp)
    80002bf4:	6442                	ld	s0,16(sp)
    80002bf6:	6105                	addi	sp,sp,32
    80002bf8:	8082                	ret

0000000080002bfa <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002bfa:	1101                	addi	sp,sp,-32
    80002bfc:	ec06                	sd	ra,24(sp)
    80002bfe:	e822                	sd	s0,16(sp)
    80002c00:	1000                	addi	s0,sp,32
    80002c02:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002c06:	fe843783          	ld	a5,-24(s0)
    80002c0a:	6fbc                	ld	a5,88(a5)
    80002c0c:	cb89                	beqz	a5,80002c1e <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002c0e:	fe843783          	ld	a5,-24(s0)
    80002c12:	6fbc                	ld	a5,88(a5)
    80002c14:	853e                	mv	a0,a5
    80002c16:	ffffe097          	auipc	ra,0xffffe
    80002c1a:	51a080e7          	jalr	1306(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80002c1e:	fe843783          	ld	a5,-24(s0)
    80002c22:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002c26:	fe843783          	ld	a5,-24(s0)
    80002c2a:	6bbc                	ld	a5,80(a5)
    80002c2c:	cf89                	beqz	a5,80002c46 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002c2e:	fe843783          	ld	a5,-24(s0)
    80002c32:	6bb8                	ld	a4,80(a5)
    80002c34:	fe843783          	ld	a5,-24(s0)
    80002c38:	67bc                	ld	a5,72(a5)
    80002c3a:	85be                	mv	a1,a5
    80002c3c:	853a                	mv	a0,a4
    80002c3e:	00000097          	auipc	ra,0x0
    80002c42:	11a080e7          	jalr	282(ra) # 80002d58 <proc_freepagetable>
  p->pagetable = 0;
    80002c46:	fe843783          	ld	a5,-24(s0)
    80002c4a:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002c4e:	fe843783          	ld	a5,-24(s0)
    80002c52:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002c56:	fe843783          	ld	a5,-24(s0)
    80002c5a:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002c5e:	fe843783          	ld	a5,-24(s0)
    80002c62:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002c66:	fe843783          	ld	a5,-24(s0)
    80002c6a:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002c6e:	fe843783          	ld	a5,-24(s0)
    80002c72:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002c76:	fe843783          	ld	a5,-24(s0)
    80002c7a:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002c7e:	fe843783          	ld	a5,-24(s0)
    80002c82:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002c86:	fe843783          	ld	a5,-24(s0)
    80002c8a:	0007ac23          	sw	zero,24(a5)
}
    80002c8e:	0001                	nop
    80002c90:	60e2                	ld	ra,24(sp)
    80002c92:	6442                	ld	s0,16(sp)
    80002c94:	6105                	addi	sp,sp,32
    80002c96:	8082                	ret

0000000080002c98 <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002c98:	7179                	addi	sp,sp,-48
    80002c9a:	f406                	sd	ra,40(sp)
    80002c9c:	f022                	sd	s0,32(sp)
    80002c9e:	1800                	addi	s0,sp,48
    80002ca0:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002ca4:	fffff097          	auipc	ra,0xfffff
    80002ca8:	35c080e7          	jalr	860(ra) # 80002000 <uvmcreate>
    80002cac:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002cb0:	fe843783          	ld	a5,-24(s0)
    80002cb4:	e399                	bnez	a5,80002cba <proc_pagetable+0x22>
    return 0;
    80002cb6:	4781                	li	a5,0
    80002cb8:	a859                	j	80002d4e <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002cba:	00008797          	auipc	a5,0x8
    80002cbe:	34678793          	addi	a5,a5,838 # 8000b000 <_trampoline>
    80002cc2:	4729                	li	a4,10
    80002cc4:	86be                	mv	a3,a5
    80002cc6:	6605                	lui	a2,0x1
    80002cc8:	040007b7          	lui	a5,0x4000
    80002ccc:	17fd                	addi	a5,a5,-1
    80002cce:	00c79593          	slli	a1,a5,0xc
    80002cd2:	fe843503          	ld	a0,-24(s0)
    80002cd6:	fffff097          	auipc	ra,0xfffff
    80002cda:	0ce080e7          	jalr	206(ra) # 80001da4 <mappages>
    80002cde:	87aa                	mv	a5,a0
    80002ce0:	0007db63          	bgez	a5,80002cf6 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002ce4:	4581                	li	a1,0
    80002ce6:	fe843503          	ld	a0,-24(s0)
    80002cea:	fffff097          	auipc	ra,0xfffff
    80002cee:	612080e7          	jalr	1554(ra) # 800022fc <uvmfree>
    return 0;
    80002cf2:	4781                	li	a5,0
    80002cf4:	a8a9                	j	80002d4e <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002cf6:	fd843783          	ld	a5,-40(s0)
    80002cfa:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002cfc:	4719                	li	a4,6
    80002cfe:	86be                	mv	a3,a5
    80002d00:	6605                	lui	a2,0x1
    80002d02:	020007b7          	lui	a5,0x2000
    80002d06:	17fd                	addi	a5,a5,-1
    80002d08:	00d79593          	slli	a1,a5,0xd
    80002d0c:	fe843503          	ld	a0,-24(s0)
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	094080e7          	jalr	148(ra) # 80001da4 <mappages>
    80002d18:	87aa                	mv	a5,a0
    80002d1a:	0207d863          	bgez	a5,80002d4a <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002d1e:	4681                	li	a3,0
    80002d20:	4605                	li	a2,1
    80002d22:	040007b7          	lui	a5,0x4000
    80002d26:	17fd                	addi	a5,a5,-1
    80002d28:	00c79593          	slli	a1,a5,0xc
    80002d2c:	fe843503          	ld	a0,-24(s0)
    80002d30:	fffff097          	auipc	ra,0xfffff
    80002d34:	17e080e7          	jalr	382(ra) # 80001eae <uvmunmap>
    uvmfree(pagetable, 0);
    80002d38:	4581                	li	a1,0
    80002d3a:	fe843503          	ld	a0,-24(s0)
    80002d3e:	fffff097          	auipc	ra,0xfffff
    80002d42:	5be080e7          	jalr	1470(ra) # 800022fc <uvmfree>
    return 0;
    80002d46:	4781                	li	a5,0
    80002d48:	a019                	j	80002d4e <proc_pagetable+0xb6>
  }

  return pagetable;
    80002d4a:	fe843783          	ld	a5,-24(s0)
}
    80002d4e:	853e                	mv	a0,a5
    80002d50:	70a2                	ld	ra,40(sp)
    80002d52:	7402                	ld	s0,32(sp)
    80002d54:	6145                	addi	sp,sp,48
    80002d56:	8082                	ret

0000000080002d58 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002d58:	1101                	addi	sp,sp,-32
    80002d5a:	ec06                	sd	ra,24(sp)
    80002d5c:	e822                	sd	s0,16(sp)
    80002d5e:	1000                	addi	s0,sp,32
    80002d60:	fea43423          	sd	a0,-24(s0)
    80002d64:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002d68:	4681                	li	a3,0
    80002d6a:	4605                	li	a2,1
    80002d6c:	040007b7          	lui	a5,0x4000
    80002d70:	17fd                	addi	a5,a5,-1
    80002d72:	00c79593          	slli	a1,a5,0xc
    80002d76:	fe843503          	ld	a0,-24(s0)
    80002d7a:	fffff097          	auipc	ra,0xfffff
    80002d7e:	134080e7          	jalr	308(ra) # 80001eae <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002d82:	4681                	li	a3,0
    80002d84:	4605                	li	a2,1
    80002d86:	020007b7          	lui	a5,0x2000
    80002d8a:	17fd                	addi	a5,a5,-1
    80002d8c:	00d79593          	slli	a1,a5,0xd
    80002d90:	fe843503          	ld	a0,-24(s0)
    80002d94:	fffff097          	auipc	ra,0xfffff
    80002d98:	11a080e7          	jalr	282(ra) # 80001eae <uvmunmap>
  uvmfree(pagetable, sz);
    80002d9c:	fe043583          	ld	a1,-32(s0)
    80002da0:	fe843503          	ld	a0,-24(s0)
    80002da4:	fffff097          	auipc	ra,0xfffff
    80002da8:	558080e7          	jalr	1368(ra) # 800022fc <uvmfree>
}
    80002dac:	0001                	nop
    80002dae:	60e2                	ld	ra,24(sp)
    80002db0:	6442                	ld	s0,16(sp)
    80002db2:	6105                	addi	sp,sp,32
    80002db4:	8082                	ret

0000000080002db6 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002db6:	1101                	addi	sp,sp,-32
    80002db8:	ec06                	sd	ra,24(sp)
    80002dba:	e822                	sd	s0,16(sp)
    80002dbc:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002dbe:	00000097          	auipc	ra,0x0
    80002dc2:	d12080e7          	jalr	-750(ra) # 80002ad0 <allocproc>
    80002dc6:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002dca:	0000a797          	auipc	a5,0xa
    80002dce:	bf678793          	addi	a5,a5,-1034 # 8000c9c0 <initproc>
    80002dd2:	fe843703          	ld	a4,-24(s0)
    80002dd6:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002dd8:	fe843783          	ld	a5,-24(s0)
    80002ddc:	6bbc                	ld	a5,80(a5)
    80002dde:	03400613          	li	a2,52
    80002de2:	0000a597          	auipc	a1,0xa
    80002de6:	a8658593          	addi	a1,a1,-1402 # 8000c868 <initcode>
    80002dea:	853e                	mv	a0,a5
    80002dec:	fffff097          	auipc	ra,0xfffff
    80002df0:	250080e7          	jalr	592(ra) # 8000203c <uvmfirst>
  p->sz = PGSIZE;
    80002df4:	fe843783          	ld	a5,-24(s0)
    80002df8:	6705                	lui	a4,0x1
    80002dfa:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002dfc:	fe843783          	ld	a5,-24(s0)
    80002e00:	6fbc                	ld	a5,88(a5)
    80002e02:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002e06:	fe843783          	ld	a5,-24(s0)
    80002e0a:	6fbc                	ld	a5,88(a5)
    80002e0c:	6705                	lui	a4,0x1
    80002e0e:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002e10:	fe843783          	ld	a5,-24(s0)
    80002e14:	15878793          	addi	a5,a5,344
    80002e18:	4641                	li	a2,16
    80002e1a:	00009597          	auipc	a1,0x9
    80002e1e:	3e658593          	addi	a1,a1,998 # 8000c200 <etext+0x200>
    80002e22:	853e                	mv	a0,a5
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	9f0080e7          	jalr	-1552(ra) # 80001814 <safestrcpy>
  p->cwd = namei("/");
    80002e2c:	00009517          	auipc	a0,0x9
    80002e30:	3e450513          	addi	a0,a0,996 # 8000c210 <etext+0x210>
    80002e34:	00003097          	auipc	ra,0x3
    80002e38:	21a080e7          	jalr	538(ra) # 8000604e <namei>
    80002e3c:	872a                	mv	a4,a0
    80002e3e:	fe843783          	ld	a5,-24(s0)
    80002e42:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002e46:	fe843783          	ld	a5,-24(s0)
    80002e4a:	470d                	li	a4,3
    80002e4c:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002e4e:	fe843783          	ld	a5,-24(s0)
    80002e52:	853e                	mv	a0,a5
    80002e54:	ffffe097          	auipc	ra,0xffffe
    80002e58:	54c080e7          	jalr	1356(ra) # 800013a0 <release>
}
    80002e5c:	0001                	nop
    80002e5e:	60e2                	ld	ra,24(sp)
    80002e60:	6442                	ld	s0,16(sp)
    80002e62:	6105                	addi	sp,sp,32
    80002e64:	8082                	ret

0000000080002e66 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002e66:	7179                	addi	sp,sp,-48
    80002e68:	f406                	sd	ra,40(sp)
    80002e6a:	f022                	sd	s0,32(sp)
    80002e6c:	1800                	addi	s0,sp,48
    80002e6e:	87aa                	mv	a5,a0
    80002e70:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002e74:	00000097          	auipc	ra,0x0
    80002e78:	bc2080e7          	jalr	-1086(ra) # 80002a36 <myproc>
    80002e7c:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002e80:	fe043783          	ld	a5,-32(s0)
    80002e84:	67bc                	ld	a5,72(a5)
    80002e86:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002e8a:	fdc42783          	lw	a5,-36(s0)
    80002e8e:	2781                	sext.w	a5,a5
    80002e90:	02f05963          	blez	a5,80002ec2 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002e94:	fe043783          	ld	a5,-32(s0)
    80002e98:	6ba8                	ld	a0,80(a5)
    80002e9a:	fdc42703          	lw	a4,-36(s0)
    80002e9e:	fe843783          	ld	a5,-24(s0)
    80002ea2:	97ba                	add	a5,a5,a4
    80002ea4:	4691                	li	a3,4
    80002ea6:	863e                	mv	a2,a5
    80002ea8:	fe843583          	ld	a1,-24(s0)
    80002eac:	fffff097          	auipc	ra,0xfffff
    80002eb0:	218080e7          	jalr	536(ra) # 800020c4 <uvmalloc>
    80002eb4:	fea43423          	sd	a0,-24(s0)
    80002eb8:	fe843783          	ld	a5,-24(s0)
    80002ebc:	eb95                	bnez	a5,80002ef0 <growproc+0x8a>
      return -1;
    80002ebe:	57fd                	li	a5,-1
    80002ec0:	a835                	j	80002efc <growproc+0x96>
    }
  } else if(n < 0){
    80002ec2:	fdc42783          	lw	a5,-36(s0)
    80002ec6:	2781                	sext.w	a5,a5
    80002ec8:	0207d463          	bgez	a5,80002ef0 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002ecc:	fe043783          	ld	a5,-32(s0)
    80002ed0:	6bb4                	ld	a3,80(a5)
    80002ed2:	fdc42703          	lw	a4,-36(s0)
    80002ed6:	fe843783          	ld	a5,-24(s0)
    80002eda:	97ba                	add	a5,a5,a4
    80002edc:	863e                	mv	a2,a5
    80002ede:	fe843583          	ld	a1,-24(s0)
    80002ee2:	8536                	mv	a0,a3
    80002ee4:	fffff097          	auipc	ra,0xfffff
    80002ee8:	2d2080e7          	jalr	722(ra) # 800021b6 <uvmdealloc>
    80002eec:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002ef0:	fe043783          	ld	a5,-32(s0)
    80002ef4:	fe843703          	ld	a4,-24(s0)
    80002ef8:	e7b8                	sd	a4,72(a5)
  return 0;
    80002efa:	4781                	li	a5,0
}
    80002efc:	853e                	mv	a0,a5
    80002efe:	70a2                	ld	ra,40(sp)
    80002f00:	7402                	ld	s0,32(sp)
    80002f02:	6145                	addi	sp,sp,48
    80002f04:	8082                	ret

0000000080002f06 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002f06:	7179                	addi	sp,sp,-48
    80002f08:	f406                	sd	ra,40(sp)
    80002f0a:	f022                	sd	s0,32(sp)
    80002f0c:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002f0e:	00000097          	auipc	ra,0x0
    80002f12:	b28080e7          	jalr	-1240(ra) # 80002a36 <myproc>
    80002f16:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002f1a:	00000097          	auipc	ra,0x0
    80002f1e:	bb6080e7          	jalr	-1098(ra) # 80002ad0 <allocproc>
    80002f22:	fca43c23          	sd	a0,-40(s0)
    80002f26:	fd843783          	ld	a5,-40(s0)
    80002f2a:	e399                	bnez	a5,80002f30 <fork+0x2a>
    return -1;
    80002f2c:	57fd                	li	a5,-1
    80002f2e:	a27d                	j	800030dc <fork+0x1d6>
  }

  yielddisabled = 1;
    80002f30:	0000a797          	auipc	a5,0xa
    80002f34:	a9c78793          	addi	a5,a5,-1380 # 8000c9cc <yielddisabled>
    80002f38:	4705                	li	a4,1
    80002f3a:	c398                	sw	a4,0(a5)
  release(&np->lock);
    80002f3c:	fd843783          	ld	a5,-40(s0)
    80002f40:	853e                	mv	a0,a5
    80002f42:	ffffe097          	auipc	ra,0xffffe
    80002f46:	45e080e7          	jalr	1118(ra) # 800013a0 <release>

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002f4a:	fe043783          	ld	a5,-32(s0)
    80002f4e:	6bb8                	ld	a4,80(a5)
    80002f50:	fd843783          	ld	a5,-40(s0)
    80002f54:	6bb4                	ld	a3,80(a5)
    80002f56:	fe043783          	ld	a5,-32(s0)
    80002f5a:	67bc                	ld	a5,72(a5)
    80002f5c:	863e                	mv	a2,a5
    80002f5e:	85b6                	mv	a1,a3
    80002f60:	853a                	mv	a0,a4
    80002f62:	fffff097          	auipc	ra,0xfffff
    80002f66:	3e4080e7          	jalr	996(ra) # 80002346 <uvmcopy>
    80002f6a:	87aa                	mv	a5,a0
    80002f6c:	0207d063          	bgez	a5,80002f8c <fork+0x86>
    freeproc(np);
    80002f70:	fd843503          	ld	a0,-40(s0)
    80002f74:	00000097          	auipc	ra,0x0
    80002f78:	c86080e7          	jalr	-890(ra) # 80002bfa <freeproc>
    yielddisabled = 0;
    80002f7c:	0000a797          	auipc	a5,0xa
    80002f80:	a5078793          	addi	a5,a5,-1456 # 8000c9cc <yielddisabled>
    80002f84:	0007a023          	sw	zero,0(a5)
    return -1;
    80002f88:	57fd                	li	a5,-1
    80002f8a:	aa89                	j	800030dc <fork+0x1d6>
  }

  acquire(&np->lock);
    80002f8c:	fd843783          	ld	a5,-40(s0)
    80002f90:	853e                	mv	a0,a5
    80002f92:	ffffe097          	auipc	ra,0xffffe
    80002f96:	3aa080e7          	jalr	938(ra) # 8000133c <acquire>
  yielddisabled = 0;
    80002f9a:	0000a797          	auipc	a5,0xa
    80002f9e:	a3278793          	addi	a5,a5,-1486 # 8000c9cc <yielddisabled>
    80002fa2:	0007a023          	sw	zero,0(a5)

  np->sz = p->sz;
    80002fa6:	fe043783          	ld	a5,-32(s0)
    80002faa:	67b8                	ld	a4,72(a5)
    80002fac:	fd843783          	ld	a5,-40(s0)
    80002fb0:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002fb2:	fe043783          	ld	a5,-32(s0)
    80002fb6:	6fb8                	ld	a4,88(a5)
    80002fb8:	fd843783          	ld	a5,-40(s0)
    80002fbc:	6fbc                	ld	a5,88(a5)
    80002fbe:	86be                	mv	a3,a5
    80002fc0:	12000793          	li	a5,288
    80002fc4:	863e                	mv	a2,a5
    80002fc6:	85ba                	mv	a1,a4
    80002fc8:	8536                	mv	a0,a3
    80002fca:	ffffe097          	auipc	ra,0xffffe
    80002fce:	706080e7          	jalr	1798(ra) # 800016d0 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002fd2:	fd843783          	ld	a5,-40(s0)
    80002fd6:	6fbc                	ld	a5,88(a5)
    80002fd8:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002fdc:	fe042623          	sw	zero,-20(s0)
    80002fe0:	a0a9                	j	8000302a <fork+0x124>
    if(p->ofile[i])
    80002fe2:	fe043703          	ld	a4,-32(s0)
    80002fe6:	fec42783          	lw	a5,-20(s0)
    80002fea:	07e9                	addi	a5,a5,26
    80002fec:	078e                	slli	a5,a5,0x3
    80002fee:	97ba                	add	a5,a5,a4
    80002ff0:	639c                	ld	a5,0(a5)
    80002ff2:	c79d                	beqz	a5,80003020 <fork+0x11a>
      np->ofile[i] = filedup(p->ofile[i]);
    80002ff4:	fe043703          	ld	a4,-32(s0)
    80002ff8:	fec42783          	lw	a5,-20(s0)
    80002ffc:	07e9                	addi	a5,a5,26
    80002ffe:	078e                	slli	a5,a5,0x3
    80003000:	97ba                	add	a5,a5,a4
    80003002:	639c                	ld	a5,0(a5)
    80003004:	853e                	mv	a0,a5
    80003006:	00004097          	auipc	ra,0x4
    8000300a:	9e0080e7          	jalr	-1568(ra) # 800069e6 <filedup>
    8000300e:	86aa                	mv	a3,a0
    80003010:	fd843703          	ld	a4,-40(s0)
    80003014:	fec42783          	lw	a5,-20(s0)
    80003018:	07e9                	addi	a5,a5,26
    8000301a:	078e                	slli	a5,a5,0x3
    8000301c:	97ba                	add	a5,a5,a4
    8000301e:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80003020:	fec42783          	lw	a5,-20(s0)
    80003024:	2785                	addiw	a5,a5,1
    80003026:	fef42623          	sw	a5,-20(s0)
    8000302a:	fec42783          	lw	a5,-20(s0)
    8000302e:	0007871b          	sext.w	a4,a5
    80003032:	47bd                	li	a5,15
    80003034:	fae7d7e3          	bge	a5,a4,80002fe2 <fork+0xdc>
  np->cwd = idup(p->cwd);
    80003038:	fe043783          	ld	a5,-32(s0)
    8000303c:	1507b783          	ld	a5,336(a5)
    80003040:	853e                	mv	a0,a5
    80003042:	00002097          	auipc	ra,0x2
    80003046:	29a080e7          	jalr	666(ra) # 800052dc <idup>
    8000304a:	872a                	mv	a4,a0
    8000304c:	fd843783          	ld	a5,-40(s0)
    80003050:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80003054:	fd843783          	ld	a5,-40(s0)
    80003058:	15878713          	addi	a4,a5,344
    8000305c:	fe043783          	ld	a5,-32(s0)
    80003060:	15878793          	addi	a5,a5,344
    80003064:	4641                	li	a2,16
    80003066:	85be                	mv	a1,a5
    80003068:	853a                	mv	a0,a4
    8000306a:	ffffe097          	auipc	ra,0xffffe
    8000306e:	7aa080e7          	jalr	1962(ra) # 80001814 <safestrcpy>

  pid = np->pid;
    80003072:	fd843783          	ld	a5,-40(s0)
    80003076:	5b9c                	lw	a5,48(a5)
    80003078:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    8000307c:	fd843783          	ld	a5,-40(s0)
    80003080:	853e                	mv	a0,a5
    80003082:	ffffe097          	auipc	ra,0xffffe
    80003086:	31e080e7          	jalr	798(ra) # 800013a0 <release>

  acquire(&wait_lock);
    8000308a:	00018517          	auipc	a0,0x18
    8000308e:	9c650513          	addi	a0,a0,-1594 # 8001aa50 <wait_lock>
    80003092:	ffffe097          	auipc	ra,0xffffe
    80003096:	2aa080e7          	jalr	682(ra) # 8000133c <acquire>
  np->parent = p;
    8000309a:	fd843783          	ld	a5,-40(s0)
    8000309e:	fe043703          	ld	a4,-32(s0)
    800030a2:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    800030a4:	00018517          	auipc	a0,0x18
    800030a8:	9ac50513          	addi	a0,a0,-1620 # 8001aa50 <wait_lock>
    800030ac:	ffffe097          	auipc	ra,0xffffe
    800030b0:	2f4080e7          	jalr	756(ra) # 800013a0 <release>

  acquire(&np->lock);
    800030b4:	fd843783          	ld	a5,-40(s0)
    800030b8:	853e                	mv	a0,a5
    800030ba:	ffffe097          	auipc	ra,0xffffe
    800030be:	282080e7          	jalr	642(ra) # 8000133c <acquire>
  np->state = RUNNABLE;
    800030c2:	fd843783          	ld	a5,-40(s0)
    800030c6:	470d                	li	a4,3
    800030c8:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    800030ca:	fd843783          	ld	a5,-40(s0)
    800030ce:	853e                	mv	a0,a5
    800030d0:	ffffe097          	auipc	ra,0xffffe
    800030d4:	2d0080e7          	jalr	720(ra) # 800013a0 <release>

  return pid;
    800030d8:	fd442783          	lw	a5,-44(s0)
}
    800030dc:	853e                	mv	a0,a5
    800030de:	70a2                	ld	ra,40(sp)
    800030e0:	7402                	ld	s0,32(sp)
    800030e2:	6145                	addi	sp,sp,48
    800030e4:	8082                	ret

00000000800030e6 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    800030e6:	7179                	addi	sp,sp,-48
    800030e8:	f406                	sd	ra,40(sp)
    800030ea:	f022                	sd	s0,32(sp)
    800030ec:	1800                	addi	s0,sp,48
    800030ee:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    800030f2:	00012797          	auipc	a5,0x12
    800030f6:	f4678793          	addi	a5,a5,-186 # 80015038 <proc>
    800030fa:	fef43423          	sd	a5,-24(s0)
    800030fe:	a081                	j	8000313e <reparent+0x58>
    if(pp->parent == p){
    80003100:	fe843783          	ld	a5,-24(s0)
    80003104:	7f9c                	ld	a5,56(a5)
    80003106:	fd843703          	ld	a4,-40(s0)
    8000310a:	02f71463          	bne	a4,a5,80003132 <reparent+0x4c>
      pp->parent = initproc;
    8000310e:	0000a797          	auipc	a5,0xa
    80003112:	8b278793          	addi	a5,a5,-1870 # 8000c9c0 <initproc>
    80003116:	6398                	ld	a4,0(a5)
    80003118:	fe843783          	ld	a5,-24(s0)
    8000311c:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    8000311e:	0000a797          	auipc	a5,0xa
    80003122:	8a278793          	addi	a5,a5,-1886 # 8000c9c0 <initproc>
    80003126:	639c                	ld	a5,0(a5)
    80003128:	853e                	mv	a0,a5
    8000312a:	00000097          	auipc	ra,0x0
    8000312e:	58a080e7          	jalr	1418(ra) # 800036b4 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003132:	fe843783          	ld	a5,-24(s0)
    80003136:	16878793          	addi	a5,a5,360
    8000313a:	fef43423          	sd	a5,-24(s0)
    8000313e:	fe843703          	ld	a4,-24(s0)
    80003142:	00018797          	auipc	a5,0x18
    80003146:	8f678793          	addi	a5,a5,-1802 # 8001aa38 <pid_lock>
    8000314a:	faf76be3          	bltu	a4,a5,80003100 <reparent+0x1a>
    }
  }
}
    8000314e:	0001                	nop
    80003150:	0001                	nop
    80003152:	70a2                	ld	ra,40(sp)
    80003154:	7402                	ld	s0,32(sp)
    80003156:	6145                	addi	sp,sp,48
    80003158:	8082                	ret

000000008000315a <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    8000315a:	7139                	addi	sp,sp,-64
    8000315c:	fc06                	sd	ra,56(sp)
    8000315e:	f822                	sd	s0,48(sp)
    80003160:	0080                	addi	s0,sp,64
    80003162:	87aa                	mv	a5,a0
    80003164:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003168:	00000097          	auipc	ra,0x0
    8000316c:	8ce080e7          	jalr	-1842(ra) # 80002a36 <myproc>
    80003170:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80003174:	0000a797          	auipc	a5,0xa
    80003178:	84c78793          	addi	a5,a5,-1972 # 8000c9c0 <initproc>
    8000317c:	639c                	ld	a5,0(a5)
    8000317e:	fe043703          	ld	a4,-32(s0)
    80003182:	00f71a63          	bne	a4,a5,80003196 <exit+0x3c>
    panic("init exiting");
    80003186:	00009517          	auipc	a0,0x9
    8000318a:	09250513          	addi	a0,a0,146 # 8000c218 <etext+0x218>
    8000318e:	ffffe097          	auipc	ra,0xffffe
    80003192:	afe080e7          	jalr	-1282(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80003196:	fe042623          	sw	zero,-20(s0)
    8000319a:	a881                	j	800031ea <exit+0x90>
    if(p->ofile[fd]){
    8000319c:	fe043703          	ld	a4,-32(s0)
    800031a0:	fec42783          	lw	a5,-20(s0)
    800031a4:	07e9                	addi	a5,a5,26
    800031a6:	078e                	slli	a5,a5,0x3
    800031a8:	97ba                	add	a5,a5,a4
    800031aa:	639c                	ld	a5,0(a5)
    800031ac:	cb95                	beqz	a5,800031e0 <exit+0x86>
      struct file *f = p->ofile[fd];
    800031ae:	fe043703          	ld	a4,-32(s0)
    800031b2:	fec42783          	lw	a5,-20(s0)
    800031b6:	07e9                	addi	a5,a5,26
    800031b8:	078e                	slli	a5,a5,0x3
    800031ba:	97ba                	add	a5,a5,a4
    800031bc:	639c                	ld	a5,0(a5)
    800031be:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    800031c2:	fd843503          	ld	a0,-40(s0)
    800031c6:	00004097          	auipc	ra,0x4
    800031ca:	886080e7          	jalr	-1914(ra) # 80006a4c <fileclose>
      p->ofile[fd] = 0;
    800031ce:	fe043703          	ld	a4,-32(s0)
    800031d2:	fec42783          	lw	a5,-20(s0)
    800031d6:	07e9                	addi	a5,a5,26
    800031d8:	078e                	slli	a5,a5,0x3
    800031da:	97ba                	add	a5,a5,a4
    800031dc:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    800031e0:	fec42783          	lw	a5,-20(s0)
    800031e4:	2785                	addiw	a5,a5,1
    800031e6:	fef42623          	sw	a5,-20(s0)
    800031ea:	fec42783          	lw	a5,-20(s0)
    800031ee:	0007871b          	sext.w	a4,a5
    800031f2:	47bd                	li	a5,15
    800031f4:	fae7d4e3          	bge	a5,a4,8000319c <exit+0x42>
    }
  }

  begin_op();
    800031f8:	00003097          	auipc	ra,0x3
    800031fc:	1ba080e7          	jalr	442(ra) # 800063b2 <begin_op>
  iput(p->cwd);
    80003200:	fe043783          	ld	a5,-32(s0)
    80003204:	1507b783          	ld	a5,336(a5)
    80003208:	853e                	mv	a0,a5
    8000320a:	00002097          	auipc	ra,0x2
    8000320e:	2ac080e7          	jalr	684(ra) # 800054b6 <iput>
  end_op();
    80003212:	00003097          	auipc	ra,0x3
    80003216:	262080e7          	jalr	610(ra) # 80006474 <end_op>
  p->cwd = 0;
    8000321a:	fe043783          	ld	a5,-32(s0)
    8000321e:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80003222:	00018517          	auipc	a0,0x18
    80003226:	82e50513          	addi	a0,a0,-2002 # 8001aa50 <wait_lock>
    8000322a:	ffffe097          	auipc	ra,0xffffe
    8000322e:	112080e7          	jalr	274(ra) # 8000133c <acquire>

  // Give any children to init.
  reparent(p);
    80003232:	fe043503          	ld	a0,-32(s0)
    80003236:	00000097          	auipc	ra,0x0
    8000323a:	eb0080e7          	jalr	-336(ra) # 800030e6 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    8000323e:	fe043783          	ld	a5,-32(s0)
    80003242:	7f9c                	ld	a5,56(a5)
    80003244:	853e                	mv	a0,a5
    80003246:	00000097          	auipc	ra,0x0
    8000324a:	46e080e7          	jalr	1134(ra) # 800036b4 <wakeup>
  
  acquire(&p->lock);
    8000324e:	fe043783          	ld	a5,-32(s0)
    80003252:	853e                	mv	a0,a5
    80003254:	ffffe097          	auipc	ra,0xffffe
    80003258:	0e8080e7          	jalr	232(ra) # 8000133c <acquire>

  p->xstate = status;
    8000325c:	fe043783          	ld	a5,-32(s0)
    80003260:	fcc42703          	lw	a4,-52(s0)
    80003264:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003266:	fe043783          	ld	a5,-32(s0)
    8000326a:	4715                	li	a4,5
    8000326c:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    8000326e:	00017517          	auipc	a0,0x17
    80003272:	7e250513          	addi	a0,a0,2018 # 8001aa50 <wait_lock>
    80003276:	ffffe097          	auipc	ra,0xffffe
    8000327a:	12a080e7          	jalr	298(ra) # 800013a0 <release>

  // Jump into the scheduler, never to return.
  sched();
    8000327e:	00000097          	auipc	ra,0x0
    80003282:	230080e7          	jalr	560(ra) # 800034ae <sched>
  panic("zombie exit");
    80003286:	00009517          	auipc	a0,0x9
    8000328a:	fa250513          	addi	a0,a0,-94 # 8000c228 <etext+0x228>
    8000328e:	ffffe097          	auipc	ra,0xffffe
    80003292:	9fe080e7          	jalr	-1538(ra) # 80000c8c <panic>

0000000080003296 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    80003296:	7139                	addi	sp,sp,-64
    80003298:	fc06                	sd	ra,56(sp)
    8000329a:	f822                	sd	s0,48(sp)
    8000329c:	0080                	addi	s0,sp,64
    8000329e:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    800032a2:	fffff097          	auipc	ra,0xfffff
    800032a6:	794080e7          	jalr	1940(ra) # 80002a36 <myproc>
    800032aa:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    800032ae:	00017517          	auipc	a0,0x17
    800032b2:	7a250513          	addi	a0,a0,1954 # 8001aa50 <wait_lock>
    800032b6:	ffffe097          	auipc	ra,0xffffe
    800032ba:	086080e7          	jalr	134(ra) # 8000133c <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800032be:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800032c2:	00012797          	auipc	a5,0x12
    800032c6:	d7678793          	addi	a5,a5,-650 # 80015038 <proc>
    800032ca:	fef43423          	sd	a5,-24(s0)
    800032ce:	a8d1                	j	800033a2 <wait+0x10c>
      if(pp->parent == p){
    800032d0:	fe843783          	ld	a5,-24(s0)
    800032d4:	7f9c                	ld	a5,56(a5)
    800032d6:	fd843703          	ld	a4,-40(s0)
    800032da:	0af71e63          	bne	a4,a5,80003396 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    800032de:	fe843783          	ld	a5,-24(s0)
    800032e2:	853e                	mv	a0,a5
    800032e4:	ffffe097          	auipc	ra,0xffffe
    800032e8:	058080e7          	jalr	88(ra) # 8000133c <acquire>

        havekids = 1;
    800032ec:	4785                	li	a5,1
    800032ee:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    800032f2:	fe843783          	ld	a5,-24(s0)
    800032f6:	4f9c                	lw	a5,24(a5)
    800032f8:	873e                	mv	a4,a5
    800032fa:	4795                	li	a5,5
    800032fc:	08f71663          	bne	a4,a5,80003388 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    80003300:	fe843783          	ld	a5,-24(s0)
    80003304:	5b9c                	lw	a5,48(a5)
    80003306:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    8000330a:	fc843783          	ld	a5,-56(s0)
    8000330e:	c7a9                	beqz	a5,80003358 <wait+0xc2>
    80003310:	fd843783          	ld	a5,-40(s0)
    80003314:	6bb8                	ld	a4,80(a5)
    80003316:	fe843783          	ld	a5,-24(s0)
    8000331a:	02c78793          	addi	a5,a5,44
    8000331e:	4691                	li	a3,4
    80003320:	863e                	mv	a2,a5
    80003322:	fc843583          	ld	a1,-56(s0)
    80003326:	853a                	mv	a0,a4
    80003328:	fffff097          	auipc	ra,0xfffff
    8000332c:	1d8080e7          	jalr	472(ra) # 80002500 <copyout>
    80003330:	87aa                	mv	a5,a0
    80003332:	0207d363          	bgez	a5,80003358 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    80003336:	fe843783          	ld	a5,-24(s0)
    8000333a:	853e                	mv	a0,a5
    8000333c:	ffffe097          	auipc	ra,0xffffe
    80003340:	064080e7          	jalr	100(ra) # 800013a0 <release>
            release(&wait_lock);
    80003344:	00017517          	auipc	a0,0x17
    80003348:	70c50513          	addi	a0,a0,1804 # 8001aa50 <wait_lock>
    8000334c:	ffffe097          	auipc	ra,0xffffe
    80003350:	054080e7          	jalr	84(ra) # 800013a0 <release>
            return -1;
    80003354:	57fd                	li	a5,-1
    80003356:	a879                	j	800033f4 <wait+0x15e>
          }
          freeproc(pp);
    80003358:	fe843503          	ld	a0,-24(s0)
    8000335c:	00000097          	auipc	ra,0x0
    80003360:	89e080e7          	jalr	-1890(ra) # 80002bfa <freeproc>
          release(&pp->lock);
    80003364:	fe843783          	ld	a5,-24(s0)
    80003368:	853e                	mv	a0,a5
    8000336a:	ffffe097          	auipc	ra,0xffffe
    8000336e:	036080e7          	jalr	54(ra) # 800013a0 <release>
          release(&wait_lock);
    80003372:	00017517          	auipc	a0,0x17
    80003376:	6de50513          	addi	a0,a0,1758 # 8001aa50 <wait_lock>
    8000337a:	ffffe097          	auipc	ra,0xffffe
    8000337e:	026080e7          	jalr	38(ra) # 800013a0 <release>
          return pid;
    80003382:	fd442783          	lw	a5,-44(s0)
    80003386:	a0bd                	j	800033f4 <wait+0x15e>
        }
        release(&pp->lock);
    80003388:	fe843783          	ld	a5,-24(s0)
    8000338c:	853e                	mv	a0,a5
    8000338e:	ffffe097          	auipc	ra,0xffffe
    80003392:	012080e7          	jalr	18(ra) # 800013a0 <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003396:	fe843783          	ld	a5,-24(s0)
    8000339a:	16878793          	addi	a5,a5,360
    8000339e:	fef43423          	sd	a5,-24(s0)
    800033a2:	fe843703          	ld	a4,-24(s0)
    800033a6:	00017797          	auipc	a5,0x17
    800033aa:	69278793          	addi	a5,a5,1682 # 8001aa38 <pid_lock>
    800033ae:	f2f761e3          	bltu	a4,a5,800032d0 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    800033b2:	fe442783          	lw	a5,-28(s0)
    800033b6:	2781                	sext.w	a5,a5
    800033b8:	cb89                	beqz	a5,800033ca <wait+0x134>
    800033ba:	fd843503          	ld	a0,-40(s0)
    800033be:	00000097          	auipc	ra,0x0
    800033c2:	488080e7          	jalr	1160(ra) # 80003846 <killed>
    800033c6:	87aa                	mv	a5,a0
    800033c8:	cb99                	beqz	a5,800033de <wait+0x148>
      release(&wait_lock);
    800033ca:	00017517          	auipc	a0,0x17
    800033ce:	68650513          	addi	a0,a0,1670 # 8001aa50 <wait_lock>
    800033d2:	ffffe097          	auipc	ra,0xffffe
    800033d6:	fce080e7          	jalr	-50(ra) # 800013a0 <release>
      return -1;
    800033da:	57fd                	li	a5,-1
    800033dc:	a821                	j	800033f4 <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800033de:	00017597          	auipc	a1,0x17
    800033e2:	67258593          	addi	a1,a1,1650 # 8001aa50 <wait_lock>
    800033e6:	fd843503          	ld	a0,-40(s0)
    800033ea:	00000097          	auipc	ra,0x0
    800033ee:	24e080e7          	jalr	590(ra) # 80003638 <sleep>
    havekids = 0;
    800033f2:	b5f1                	j	800032be <wait+0x28>
  }
}
    800033f4:	853e                	mv	a0,a5
    800033f6:	70e2                	ld	ra,56(sp)
    800033f8:	7442                	ld	s0,48(sp)
    800033fa:	6121                	addi	sp,sp,64
    800033fc:	8082                	ret

00000000800033fe <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    800033fe:	1101                	addi	sp,sp,-32
    80003400:	ec06                	sd	ra,24(sp)
    80003402:	e822                	sd	s0,16(sp)
    80003404:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003406:	fffff097          	auipc	ra,0xfffff
    8000340a:	5f6080e7          	jalr	1526(ra) # 800029fc <mycpu>
    8000340e:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    80003412:	fe043783          	ld	a5,-32(s0)
    80003416:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    8000341a:	fffff097          	auipc	ra,0xfffff
    8000341e:	3c4080e7          	jalr	964(ra) # 800027de <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    80003422:	00012797          	auipc	a5,0x12
    80003426:	c1678793          	addi	a5,a5,-1002 # 80015038 <proc>
    8000342a:	fef43423          	sd	a5,-24(s0)
    8000342e:	a0bd                	j	8000349c <scheduler+0x9e>
      acquire(&p->lock);
    80003430:	fe843783          	ld	a5,-24(s0)
    80003434:	853e                	mv	a0,a5
    80003436:	ffffe097          	auipc	ra,0xffffe
    8000343a:	f06080e7          	jalr	-250(ra) # 8000133c <acquire>
      if(p->state == RUNNABLE) {
    8000343e:	fe843783          	ld	a5,-24(s0)
    80003442:	4f9c                	lw	a5,24(a5)
    80003444:	873e                	mv	a4,a5
    80003446:	478d                	li	a5,3
    80003448:	02f71d63          	bne	a4,a5,80003482 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    8000344c:	fe843783          	ld	a5,-24(s0)
    80003450:	4711                	li	a4,4
    80003452:	cf98                	sw	a4,24(a5)
        c->proc = p;
    80003454:	fe043783          	ld	a5,-32(s0)
    80003458:	fe843703          	ld	a4,-24(s0)
    8000345c:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    8000345e:	fe043783          	ld	a5,-32(s0)
    80003462:	00878713          	addi	a4,a5,8
    80003466:	fe843783          	ld	a5,-24(s0)
    8000346a:	06078793          	addi	a5,a5,96
    8000346e:	85be                	mv	a1,a5
    80003470:	853a                	mv	a0,a4
    80003472:	00000097          	auipc	ra,0x0
    80003476:	5de080e7          	jalr	1502(ra) # 80003a50 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    8000347a:	fe043783          	ld	a5,-32(s0)
    8000347e:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    80003482:	fe843783          	ld	a5,-24(s0)
    80003486:	853e                	mv	a0,a5
    80003488:	ffffe097          	auipc	ra,0xffffe
    8000348c:	f18080e7          	jalr	-232(ra) # 800013a0 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    80003490:	fe843783          	ld	a5,-24(s0)
    80003494:	16878793          	addi	a5,a5,360
    80003498:	fef43423          	sd	a5,-24(s0)
    8000349c:	fe843703          	ld	a4,-24(s0)
    800034a0:	00017797          	auipc	a5,0x17
    800034a4:	59878793          	addi	a5,a5,1432 # 8001aa38 <pid_lock>
    800034a8:	f8f764e3          	bltu	a4,a5,80003430 <scheduler+0x32>
    intr_on();
    800034ac:	b7bd                	j	8000341a <scheduler+0x1c>

00000000800034ae <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800034ae:	7179                	addi	sp,sp,-48
    800034b0:	f406                	sd	ra,40(sp)
    800034b2:	f022                	sd	s0,32(sp)
    800034b4:	ec26                	sd	s1,24(sp)
    800034b6:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800034b8:	fffff097          	auipc	ra,0xfffff
    800034bc:	57e080e7          	jalr	1406(ra) # 80002a36 <myproc>
    800034c0:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800034c4:	fd843783          	ld	a5,-40(s0)
    800034c8:	853e                	mv	a0,a5
    800034ca:	ffffe097          	auipc	ra,0xffffe
    800034ce:	f2c080e7          	jalr	-212(ra) # 800013f6 <holding>
    800034d2:	87aa                	mv	a5,a0
    800034d4:	eb89                	bnez	a5,800034e6 <sched+0x38>
    panic("sched p->lock");
    800034d6:	00009517          	auipc	a0,0x9
    800034da:	d6250513          	addi	a0,a0,-670 # 8000c238 <etext+0x238>
    800034de:	ffffd097          	auipc	ra,0xffffd
    800034e2:	7ae080e7          	jalr	1966(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    800034e6:	fffff097          	auipc	ra,0xfffff
    800034ea:	516080e7          	jalr	1302(ra) # 800029fc <mycpu>
    800034ee:	87aa                	mv	a5,a0
    800034f0:	5fbc                	lw	a5,120(a5)
    800034f2:	873e                	mv	a4,a5
    800034f4:	4785                	li	a5,1
    800034f6:	00f70a63          	beq	a4,a5,8000350a <sched+0x5c>
    panic("sched locks");
    800034fa:	00009517          	auipc	a0,0x9
    800034fe:	d4e50513          	addi	a0,a0,-690 # 8000c248 <etext+0x248>
    80003502:	ffffd097          	auipc	ra,0xffffd
    80003506:	78a080e7          	jalr	1930(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    8000350a:	fd843783          	ld	a5,-40(s0)
    8000350e:	4f9c                	lw	a5,24(a5)
    80003510:	873e                	mv	a4,a5
    80003512:	4791                	li	a5,4
    80003514:	00f71a63          	bne	a4,a5,80003528 <sched+0x7a>
    panic("sched running");
    80003518:	00009517          	auipc	a0,0x9
    8000351c:	d4050513          	addi	a0,a0,-704 # 8000c258 <etext+0x258>
    80003520:	ffffd097          	auipc	ra,0xffffd
    80003524:	76c080e7          	jalr	1900(ra) # 80000c8c <panic>
  if(intr_get())
    80003528:	fffff097          	auipc	ra,0xfffff
    8000352c:	2e0080e7          	jalr	736(ra) # 80002808 <intr_get>
    80003530:	87aa                	mv	a5,a0
    80003532:	cb89                	beqz	a5,80003544 <sched+0x96>
    panic("sched interruptible");
    80003534:	00009517          	auipc	a0,0x9
    80003538:	d3450513          	addi	a0,a0,-716 # 8000c268 <etext+0x268>
    8000353c:	ffffd097          	auipc	ra,0xffffd
    80003540:	750080e7          	jalr	1872(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    80003544:	fffff097          	auipc	ra,0xfffff
    80003548:	4b8080e7          	jalr	1208(ra) # 800029fc <mycpu>
    8000354c:	87aa                	mv	a5,a0
    8000354e:	5ffc                	lw	a5,124(a5)
    80003550:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003554:	fd843783          	ld	a5,-40(s0)
    80003558:	06078493          	addi	s1,a5,96
    8000355c:	fffff097          	auipc	ra,0xfffff
    80003560:	4a0080e7          	jalr	1184(ra) # 800029fc <mycpu>
    80003564:	87aa                	mv	a5,a0
    80003566:	07a1                	addi	a5,a5,8
    80003568:	85be                	mv	a1,a5
    8000356a:	8526                	mv	a0,s1
    8000356c:	00000097          	auipc	ra,0x0
    80003570:	4e4080e7          	jalr	1252(ra) # 80003a50 <swtch>
  mycpu()->intena = intena;
    80003574:	fffff097          	auipc	ra,0xfffff
    80003578:	488080e7          	jalr	1160(ra) # 800029fc <mycpu>
    8000357c:	872a                	mv	a4,a0
    8000357e:	fd442783          	lw	a5,-44(s0)
    80003582:	df7c                	sw	a5,124(a4)
}
    80003584:	0001                	nop
    80003586:	70a2                	ld	ra,40(sp)
    80003588:	7402                	ld	s0,32(sp)
    8000358a:	64e2                	ld	s1,24(sp)
    8000358c:	6145                	addi	sp,sp,48
    8000358e:	8082                	ret

0000000080003590 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    80003590:	1101                	addi	sp,sp,-32
    80003592:	ec06                	sd	ra,24(sp)
    80003594:	e822                	sd	s0,16(sp)
    80003596:	1000                	addi	s0,sp,32
  if(yielddisabled)
    80003598:	00009797          	auipc	a5,0x9
    8000359c:	43478793          	addi	a5,a5,1076 # 8000c9cc <yielddisabled>
    800035a0:	439c                	lw	a5,0(a5)
    800035a2:	ef95                	bnez	a5,800035de <yield+0x4e>
    return;

  struct proc *p = myproc();
    800035a4:	fffff097          	auipc	ra,0xfffff
    800035a8:	492080e7          	jalr	1170(ra) # 80002a36 <myproc>
    800035ac:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800035b0:	fe843783          	ld	a5,-24(s0)
    800035b4:	853e                	mv	a0,a5
    800035b6:	ffffe097          	auipc	ra,0xffffe
    800035ba:	d86080e7          	jalr	-634(ra) # 8000133c <acquire>
  p->state = RUNNABLE;
    800035be:	fe843783          	ld	a5,-24(s0)
    800035c2:	470d                	li	a4,3
    800035c4:	cf98                	sw	a4,24(a5)
  sched();
    800035c6:	00000097          	auipc	ra,0x0
    800035ca:	ee8080e7          	jalr	-280(ra) # 800034ae <sched>
  release(&p->lock);
    800035ce:	fe843783          	ld	a5,-24(s0)
    800035d2:	853e                	mv	a0,a5
    800035d4:	ffffe097          	auipc	ra,0xffffe
    800035d8:	dcc080e7          	jalr	-564(ra) # 800013a0 <release>
    800035dc:	a011                	j	800035e0 <yield+0x50>
    return;
    800035de:	0001                	nop
}
    800035e0:	60e2                	ld	ra,24(sp)
    800035e2:	6442                	ld	s0,16(sp)
    800035e4:	6105                	addi	sp,sp,32
    800035e6:	8082                	ret

00000000800035e8 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800035e8:	1141                	addi	sp,sp,-16
    800035ea:	e406                	sd	ra,8(sp)
    800035ec:	e022                	sd	s0,0(sp)
    800035ee:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800035f0:	fffff097          	auipc	ra,0xfffff
    800035f4:	446080e7          	jalr	1094(ra) # 80002a36 <myproc>
    800035f8:	87aa                	mv	a5,a0
    800035fa:	853e                	mv	a0,a5
    800035fc:	ffffe097          	auipc	ra,0xffffe
    80003600:	da4080e7          	jalr	-604(ra) # 800013a0 <release>

  if (first) {
    80003604:	00009797          	auipc	a5,0x9
    80003608:	24078793          	addi	a5,a5,576 # 8000c844 <first.1725>
    8000360c:	439c                	lw	a5,0(a5)
    8000360e:	cf81                	beqz	a5,80003626 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003610:	00009797          	auipc	a5,0x9
    80003614:	23478793          	addi	a5,a5,564 # 8000c844 <first.1725>
    80003618:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    8000361c:	4505                	li	a0,1
    8000361e:	00001097          	auipc	ra,0x1
    80003622:	594080e7          	jalr	1428(ra) # 80004bb2 <fsinit>
  }

  usertrapret();
    80003626:	00001097          	auipc	ra,0x1
    8000362a:	828080e7          	jalr	-2008(ra) # 80003e4e <usertrapret>
}
    8000362e:	0001                	nop
    80003630:	60a2                	ld	ra,8(sp)
    80003632:	6402                	ld	s0,0(sp)
    80003634:	0141                	addi	sp,sp,16
    80003636:	8082                	ret

0000000080003638 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003638:	7179                	addi	sp,sp,-48
    8000363a:	f406                	sd	ra,40(sp)
    8000363c:	f022                	sd	s0,32(sp)
    8000363e:	1800                	addi	s0,sp,48
    80003640:	fca43c23          	sd	a0,-40(s0)
    80003644:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003648:	fffff097          	auipc	ra,0xfffff
    8000364c:	3ee080e7          	jalr	1006(ra) # 80002a36 <myproc>
    80003650:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003654:	fe843783          	ld	a5,-24(s0)
    80003658:	853e                	mv	a0,a5
    8000365a:	ffffe097          	auipc	ra,0xffffe
    8000365e:	ce2080e7          	jalr	-798(ra) # 8000133c <acquire>
  release(lk);
    80003662:	fd043503          	ld	a0,-48(s0)
    80003666:	ffffe097          	auipc	ra,0xffffe
    8000366a:	d3a080e7          	jalr	-710(ra) # 800013a0 <release>

  // Go to sleep.
  p->chan = chan;
    8000366e:	fe843783          	ld	a5,-24(s0)
    80003672:	fd843703          	ld	a4,-40(s0)
    80003676:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003678:	fe843783          	ld	a5,-24(s0)
    8000367c:	4709                	li	a4,2
    8000367e:	cf98                	sw	a4,24(a5)

  sched();
    80003680:	00000097          	auipc	ra,0x0
    80003684:	e2e080e7          	jalr	-466(ra) # 800034ae <sched>

  // Tidy up.
  p->chan = 0;
    80003688:	fe843783          	ld	a5,-24(s0)
    8000368c:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    80003690:	fe843783          	ld	a5,-24(s0)
    80003694:	853e                	mv	a0,a5
    80003696:	ffffe097          	auipc	ra,0xffffe
    8000369a:	d0a080e7          	jalr	-758(ra) # 800013a0 <release>
  acquire(lk);
    8000369e:	fd043503          	ld	a0,-48(s0)
    800036a2:	ffffe097          	auipc	ra,0xffffe
    800036a6:	c9a080e7          	jalr	-870(ra) # 8000133c <acquire>
}
    800036aa:	0001                	nop
    800036ac:	70a2                	ld	ra,40(sp)
    800036ae:	7402                	ld	s0,32(sp)
    800036b0:	6145                	addi	sp,sp,48
    800036b2:	8082                	ret

00000000800036b4 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800036b4:	7179                	addi	sp,sp,-48
    800036b6:	f406                	sd	ra,40(sp)
    800036b8:	f022                	sd	s0,32(sp)
    800036ba:	1800                	addi	s0,sp,48
    800036bc:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800036c0:	00012797          	auipc	a5,0x12
    800036c4:	97878793          	addi	a5,a5,-1672 # 80015038 <proc>
    800036c8:	fef43423          	sd	a5,-24(s0)
    800036cc:	a051                	j	80003750 <wakeup+0x9c>
    if(p != myproc()){
    800036ce:	fffff097          	auipc	ra,0xfffff
    800036d2:	368080e7          	jalr	872(ra) # 80002a36 <myproc>
    800036d6:	872a                	mv	a4,a0
    800036d8:	fe843783          	ld	a5,-24(s0)
    800036dc:	06e78463          	beq	a5,a4,80003744 <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    800036e0:	fe843783          	ld	a5,-24(s0)
    800036e4:	853e                	mv	a0,a5
    800036e6:	ffffe097          	auipc	ra,0xffffe
    800036ea:	d10080e7          	jalr	-752(ra) # 800013f6 <holding>
    800036ee:	87aa                	mv	a5,a0
    800036f0:	cb81                	beqz	a5,80003700 <wakeup+0x4c>
    800036f2:	fe843783          	ld	a5,-24(s0)
    800036f6:	4f9c                	lw	a5,24(a5)
    800036f8:	873e                	mv	a4,a5
    800036fa:	4785                	li	a5,1
    800036fc:	04f70363          	beq	a4,a5,80003742 <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    80003700:	fe843783          	ld	a5,-24(s0)
    80003704:	853e                	mv	a0,a5
    80003706:	ffffe097          	auipc	ra,0xffffe
    8000370a:	c36080e7          	jalr	-970(ra) # 8000133c <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    8000370e:	fe843783          	ld	a5,-24(s0)
    80003712:	4f9c                	lw	a5,24(a5)
    80003714:	873e                	mv	a4,a5
    80003716:	4789                	li	a5,2
    80003718:	00f71d63          	bne	a4,a5,80003732 <wakeup+0x7e>
    8000371c:	fe843783          	ld	a5,-24(s0)
    80003720:	739c                	ld	a5,32(a5)
    80003722:	fd843703          	ld	a4,-40(s0)
    80003726:	00f71663          	bne	a4,a5,80003732 <wakeup+0x7e>
        p->state = RUNNABLE;
    8000372a:	fe843783          	ld	a5,-24(s0)
    8000372e:	470d                	li	a4,3
    80003730:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003732:	fe843783          	ld	a5,-24(s0)
    80003736:	853e                	mv	a0,a5
    80003738:	ffffe097          	auipc	ra,0xffffe
    8000373c:	c68080e7          	jalr	-920(ra) # 800013a0 <release>
    80003740:	a011                	j	80003744 <wakeup+0x90>
        continue;
    80003742:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    80003744:	fe843783          	ld	a5,-24(s0)
    80003748:	16878793          	addi	a5,a5,360
    8000374c:	fef43423          	sd	a5,-24(s0)
    80003750:	fe843703          	ld	a4,-24(s0)
    80003754:	00017797          	auipc	a5,0x17
    80003758:	2e478793          	addi	a5,a5,740 # 8001aa38 <pid_lock>
    8000375c:	f6f769e3          	bltu	a4,a5,800036ce <wakeup+0x1a>
    }
  }
}
    80003760:	0001                	nop
    80003762:	0001                	nop
    80003764:	70a2                	ld	ra,40(sp)
    80003766:	7402                	ld	s0,32(sp)
    80003768:	6145                	addi	sp,sp,48
    8000376a:	8082                	ret

000000008000376c <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    8000376c:	7179                	addi	sp,sp,-48
    8000376e:	f406                	sd	ra,40(sp)
    80003770:	f022                	sd	s0,32(sp)
    80003772:	1800                	addi	s0,sp,48
    80003774:	87aa                	mv	a5,a0
    80003776:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8000377a:	00012797          	auipc	a5,0x12
    8000377e:	8be78793          	addi	a5,a5,-1858 # 80015038 <proc>
    80003782:	fef43423          	sd	a5,-24(s0)
    80003786:	a0ad                	j	800037f0 <kill+0x84>
    acquire(&p->lock);
    80003788:	fe843783          	ld	a5,-24(s0)
    8000378c:	853e                	mv	a0,a5
    8000378e:	ffffe097          	auipc	ra,0xffffe
    80003792:	bae080e7          	jalr	-1106(ra) # 8000133c <acquire>
    if(p->pid == pid){
    80003796:	fe843783          	ld	a5,-24(s0)
    8000379a:	5b98                	lw	a4,48(a5)
    8000379c:	fdc42783          	lw	a5,-36(s0)
    800037a0:	2781                	sext.w	a5,a5
    800037a2:	02e79a63          	bne	a5,a4,800037d6 <kill+0x6a>
      p->killed = 1;
    800037a6:	fe843783          	ld	a5,-24(s0)
    800037aa:	4705                	li	a4,1
    800037ac:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800037ae:	fe843783          	ld	a5,-24(s0)
    800037b2:	4f9c                	lw	a5,24(a5)
    800037b4:	873e                	mv	a4,a5
    800037b6:	4789                	li	a5,2
    800037b8:	00f71663          	bne	a4,a5,800037c4 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    800037bc:	fe843783          	ld	a5,-24(s0)
    800037c0:	470d                	li	a4,3
    800037c2:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800037c4:	fe843783          	ld	a5,-24(s0)
    800037c8:	853e                	mv	a0,a5
    800037ca:	ffffe097          	auipc	ra,0xffffe
    800037ce:	bd6080e7          	jalr	-1066(ra) # 800013a0 <release>
      return 0;
    800037d2:	4781                	li	a5,0
    800037d4:	a03d                	j	80003802 <kill+0x96>
    }
    release(&p->lock);
    800037d6:	fe843783          	ld	a5,-24(s0)
    800037da:	853e                	mv	a0,a5
    800037dc:	ffffe097          	auipc	ra,0xffffe
    800037e0:	bc4080e7          	jalr	-1084(ra) # 800013a0 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    800037e4:	fe843783          	ld	a5,-24(s0)
    800037e8:	16878793          	addi	a5,a5,360
    800037ec:	fef43423          	sd	a5,-24(s0)
    800037f0:	fe843703          	ld	a4,-24(s0)
    800037f4:	00017797          	auipc	a5,0x17
    800037f8:	24478793          	addi	a5,a5,580 # 8001aa38 <pid_lock>
    800037fc:	f8f766e3          	bltu	a4,a5,80003788 <kill+0x1c>
  }
  return -1;
    80003800:	57fd                	li	a5,-1
}
    80003802:	853e                	mv	a0,a5
    80003804:	70a2                	ld	ra,40(sp)
    80003806:	7402                	ld	s0,32(sp)
    80003808:	6145                	addi	sp,sp,48
    8000380a:	8082                	ret

000000008000380c <setkilled>:

void
setkilled(struct proc *p)
{
    8000380c:	1101                	addi	sp,sp,-32
    8000380e:	ec06                	sd	ra,24(sp)
    80003810:	e822                	sd	s0,16(sp)
    80003812:	1000                	addi	s0,sp,32
    80003814:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003818:	fe843783          	ld	a5,-24(s0)
    8000381c:	853e                	mv	a0,a5
    8000381e:	ffffe097          	auipc	ra,0xffffe
    80003822:	b1e080e7          	jalr	-1250(ra) # 8000133c <acquire>
  p->killed = 1;
    80003826:	fe843783          	ld	a5,-24(s0)
    8000382a:	4705                	li	a4,1
    8000382c:	d798                	sw	a4,40(a5)
  release(&p->lock);
    8000382e:	fe843783          	ld	a5,-24(s0)
    80003832:	853e                	mv	a0,a5
    80003834:	ffffe097          	auipc	ra,0xffffe
    80003838:	b6c080e7          	jalr	-1172(ra) # 800013a0 <release>
}
    8000383c:	0001                	nop
    8000383e:	60e2                	ld	ra,24(sp)
    80003840:	6442                	ld	s0,16(sp)
    80003842:	6105                	addi	sp,sp,32
    80003844:	8082                	ret

0000000080003846 <killed>:

int
killed(struct proc *p)
{
    80003846:	7179                	addi	sp,sp,-48
    80003848:	f406                	sd	ra,40(sp)
    8000384a:	f022                	sd	s0,32(sp)
    8000384c:	1800                	addi	s0,sp,48
    8000384e:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    80003852:	fd843783          	ld	a5,-40(s0)
    80003856:	853e                	mv	a0,a5
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	ae4080e7          	jalr	-1308(ra) # 8000133c <acquire>
  k = p->killed;
    80003860:	fd843783          	ld	a5,-40(s0)
    80003864:	579c                	lw	a5,40(a5)
    80003866:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    8000386a:	fd843783          	ld	a5,-40(s0)
    8000386e:	853e                	mv	a0,a5
    80003870:	ffffe097          	auipc	ra,0xffffe
    80003874:	b30080e7          	jalr	-1232(ra) # 800013a0 <release>
  return k;
    80003878:	fec42783          	lw	a5,-20(s0)
}
    8000387c:	853e                	mv	a0,a5
    8000387e:	70a2                	ld	ra,40(sp)
    80003880:	7402                	ld	s0,32(sp)
    80003882:	6145                	addi	sp,sp,48
    80003884:	8082                	ret

0000000080003886 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003886:	7139                	addi	sp,sp,-64
    80003888:	fc06                	sd	ra,56(sp)
    8000388a:	f822                	sd	s0,48(sp)
    8000388c:	0080                	addi	s0,sp,64
    8000388e:	87aa                	mv	a5,a0
    80003890:	fcb43823          	sd	a1,-48(s0)
    80003894:	fcc43423          	sd	a2,-56(s0)
    80003898:	fcd43023          	sd	a3,-64(s0)
    8000389c:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800038a0:	fffff097          	auipc	ra,0xfffff
    800038a4:	196080e7          	jalr	406(ra) # 80002a36 <myproc>
    800038a8:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    800038ac:	fdc42783          	lw	a5,-36(s0)
    800038b0:	2781                	sext.w	a5,a5
    800038b2:	c38d                	beqz	a5,800038d4 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    800038b4:	fe843783          	ld	a5,-24(s0)
    800038b8:	6bbc                	ld	a5,80(a5)
    800038ba:	fc043683          	ld	a3,-64(s0)
    800038be:	fc843603          	ld	a2,-56(s0)
    800038c2:	fd043583          	ld	a1,-48(s0)
    800038c6:	853e                	mv	a0,a5
    800038c8:	fffff097          	auipc	ra,0xfffff
    800038cc:	c38080e7          	jalr	-968(ra) # 80002500 <copyout>
    800038d0:	87aa                	mv	a5,a0
    800038d2:	a839                	j	800038f0 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    800038d4:	fd043783          	ld	a5,-48(s0)
    800038d8:	fc043703          	ld	a4,-64(s0)
    800038dc:	2701                	sext.w	a4,a4
    800038de:	863a                	mv	a2,a4
    800038e0:	fc843583          	ld	a1,-56(s0)
    800038e4:	853e                	mv	a0,a5
    800038e6:	ffffe097          	auipc	ra,0xffffe
    800038ea:	d0e080e7          	jalr	-754(ra) # 800015f4 <memmove>
    return 0;
    800038ee:	4781                	li	a5,0
  }
}
    800038f0:	853e                	mv	a0,a5
    800038f2:	70e2                	ld	ra,56(sp)
    800038f4:	7442                	ld	s0,48(sp)
    800038f6:	6121                	addi	sp,sp,64
    800038f8:	8082                	ret

00000000800038fa <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    800038fa:	7139                	addi	sp,sp,-64
    800038fc:	fc06                	sd	ra,56(sp)
    800038fe:	f822                	sd	s0,48(sp)
    80003900:	0080                	addi	s0,sp,64
    80003902:	fca43c23          	sd	a0,-40(s0)
    80003906:	87ae                	mv	a5,a1
    80003908:	fcc43423          	sd	a2,-56(s0)
    8000390c:	fcd43023          	sd	a3,-64(s0)
    80003910:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003914:	fffff097          	auipc	ra,0xfffff
    80003918:	122080e7          	jalr	290(ra) # 80002a36 <myproc>
    8000391c:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003920:	fd442783          	lw	a5,-44(s0)
    80003924:	2781                	sext.w	a5,a5
    80003926:	c38d                	beqz	a5,80003948 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80003928:	fe843783          	ld	a5,-24(s0)
    8000392c:	6bbc                	ld	a5,80(a5)
    8000392e:	fc043683          	ld	a3,-64(s0)
    80003932:	fc843603          	ld	a2,-56(s0)
    80003936:	fd843583          	ld	a1,-40(s0)
    8000393a:	853e                	mv	a0,a5
    8000393c:	fffff097          	auipc	ra,0xfffff
    80003940:	c92080e7          	jalr	-878(ra) # 800025ce <copyin>
    80003944:	87aa                	mv	a5,a0
    80003946:	a839                	j	80003964 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003948:	fc843783          	ld	a5,-56(s0)
    8000394c:	fc043703          	ld	a4,-64(s0)
    80003950:	2701                	sext.w	a4,a4
    80003952:	863a                	mv	a2,a4
    80003954:	85be                	mv	a1,a5
    80003956:	fd843503          	ld	a0,-40(s0)
    8000395a:	ffffe097          	auipc	ra,0xffffe
    8000395e:	c9a080e7          	jalr	-870(ra) # 800015f4 <memmove>
    return 0;
    80003962:	4781                	li	a5,0
  }
}
    80003964:	853e                	mv	a0,a5
    80003966:	70e2                	ld	ra,56(sp)
    80003968:	7442                	ld	s0,48(sp)
    8000396a:	6121                	addi	sp,sp,64
    8000396c:	8082                	ret

000000008000396e <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    8000396e:	1101                	addi	sp,sp,-32
    80003970:	ec06                	sd	ra,24(sp)
    80003972:	e822                	sd	s0,16(sp)
    80003974:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003976:	00009517          	auipc	a0,0x9
    8000397a:	90a50513          	addi	a0,a0,-1782 # 8000c280 <etext+0x280>
    8000397e:	ffffd097          	auipc	ra,0xffffd
    80003982:	0b8080e7          	jalr	184(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003986:	00011797          	auipc	a5,0x11
    8000398a:	6b278793          	addi	a5,a5,1714 # 80015038 <proc>
    8000398e:	fef43423          	sd	a5,-24(s0)
    80003992:	a04d                	j	80003a34 <procdump+0xc6>
    if(p->state == UNUSED)
    80003994:	fe843783          	ld	a5,-24(s0)
    80003998:	4f9c                	lw	a5,24(a5)
    8000399a:	c7d1                	beqz	a5,80003a26 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8000399c:	fe843783          	ld	a5,-24(s0)
    800039a0:	4f9c                	lw	a5,24(a5)
    800039a2:	873e                	mv	a4,a5
    800039a4:	4795                	li	a5,5
    800039a6:	02e7ee63          	bltu	a5,a4,800039e2 <procdump+0x74>
    800039aa:	fe843783          	ld	a5,-24(s0)
    800039ae:	4f9c                	lw	a5,24(a5)
    800039b0:	00009717          	auipc	a4,0x9
    800039b4:	ef070713          	addi	a4,a4,-272 # 8000c8a0 <states.1770>
    800039b8:	1782                	slli	a5,a5,0x20
    800039ba:	9381                	srli	a5,a5,0x20
    800039bc:	078e                	slli	a5,a5,0x3
    800039be:	97ba                	add	a5,a5,a4
    800039c0:	639c                	ld	a5,0(a5)
    800039c2:	c385                	beqz	a5,800039e2 <procdump+0x74>
      state = states[p->state];
    800039c4:	fe843783          	ld	a5,-24(s0)
    800039c8:	4f9c                	lw	a5,24(a5)
    800039ca:	00009717          	auipc	a4,0x9
    800039ce:	ed670713          	addi	a4,a4,-298 # 8000c8a0 <states.1770>
    800039d2:	1782                	slli	a5,a5,0x20
    800039d4:	9381                	srli	a5,a5,0x20
    800039d6:	078e                	slli	a5,a5,0x3
    800039d8:	97ba                	add	a5,a5,a4
    800039da:	639c                	ld	a5,0(a5)
    800039dc:	fef43023          	sd	a5,-32(s0)
    800039e0:	a039                	j	800039ee <procdump+0x80>
    else
      state = "???";
    800039e2:	00009797          	auipc	a5,0x9
    800039e6:	8a678793          	addi	a5,a5,-1882 # 8000c288 <etext+0x288>
    800039ea:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    800039ee:	fe843783          	ld	a5,-24(s0)
    800039f2:	5b98                	lw	a4,48(a5)
    800039f4:	fe843783          	ld	a5,-24(s0)
    800039f8:	15878793          	addi	a5,a5,344
    800039fc:	86be                	mv	a3,a5
    800039fe:	fe043603          	ld	a2,-32(s0)
    80003a02:	85ba                	mv	a1,a4
    80003a04:	00009517          	auipc	a0,0x9
    80003a08:	88c50513          	addi	a0,a0,-1908 # 8000c290 <etext+0x290>
    80003a0c:	ffffd097          	auipc	ra,0xffffd
    80003a10:	02a080e7          	jalr	42(ra) # 80000a36 <printf>
    printf("\n");
    80003a14:	00009517          	auipc	a0,0x9
    80003a18:	86c50513          	addi	a0,a0,-1940 # 8000c280 <etext+0x280>
    80003a1c:	ffffd097          	auipc	ra,0xffffd
    80003a20:	01a080e7          	jalr	26(ra) # 80000a36 <printf>
    80003a24:	a011                	j	80003a28 <procdump+0xba>
      continue;
    80003a26:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003a28:	fe843783          	ld	a5,-24(s0)
    80003a2c:	16878793          	addi	a5,a5,360
    80003a30:	fef43423          	sd	a5,-24(s0)
    80003a34:	fe843703          	ld	a4,-24(s0)
    80003a38:	00017797          	auipc	a5,0x17
    80003a3c:	00078793          	mv	a5,a5
    80003a40:	f4f76ae3          	bltu	a4,a5,80003994 <procdump+0x26>
  }
}
    80003a44:	0001                	nop
    80003a46:	0001                	nop
    80003a48:	60e2                	ld	ra,24(sp)
    80003a4a:	6442                	ld	s0,16(sp)
    80003a4c:	6105                	addi	sp,sp,32
    80003a4e:	8082                	ret

0000000080003a50 <swtch>:
    80003a50:	00153023          	sd	ra,0(a0)
    80003a54:	00253423          	sd	sp,8(a0)
    80003a58:	e900                	sd	s0,16(a0)
    80003a5a:	ed04                	sd	s1,24(a0)
    80003a5c:	03253023          	sd	s2,32(a0)
    80003a60:	03353423          	sd	s3,40(a0)
    80003a64:	03453823          	sd	s4,48(a0)
    80003a68:	03553c23          	sd	s5,56(a0)
    80003a6c:	05653023          	sd	s6,64(a0)
    80003a70:	05753423          	sd	s7,72(a0)
    80003a74:	05853823          	sd	s8,80(a0)
    80003a78:	05953c23          	sd	s9,88(a0)
    80003a7c:	07a53023          	sd	s10,96(a0)
    80003a80:	07b53423          	sd	s11,104(a0)
    80003a84:	0005b083          	ld	ra,0(a1)
    80003a88:	0085b103          	ld	sp,8(a1)
    80003a8c:	6980                	ld	s0,16(a1)
    80003a8e:	6d84                	ld	s1,24(a1)
    80003a90:	0205b903          	ld	s2,32(a1)
    80003a94:	0285b983          	ld	s3,40(a1)
    80003a98:	0305ba03          	ld	s4,48(a1)
    80003a9c:	0385ba83          	ld	s5,56(a1)
    80003aa0:	0405bb03          	ld	s6,64(a1)
    80003aa4:	0485bb83          	ld	s7,72(a1)
    80003aa8:	0505bc03          	ld	s8,80(a1)
    80003aac:	0585bc83          	ld	s9,88(a1)
    80003ab0:	0605bd03          	ld	s10,96(a1)
    80003ab4:	0685bd83          	ld	s11,104(a1)
    80003ab8:	8082                	ret

0000000080003aba <r_sstatus>:
{
    80003aba:	1101                	addi	sp,sp,-32
    80003abc:	ec22                	sd	s0,24(sp)
    80003abe:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003ac0:	100027f3          	csrr	a5,sstatus
    80003ac4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003ac8:	fe843783          	ld	a5,-24(s0)
}
    80003acc:	853e                	mv	a0,a5
    80003ace:	6462                	ld	s0,24(sp)
    80003ad0:	6105                	addi	sp,sp,32
    80003ad2:	8082                	ret

0000000080003ad4 <w_sstatus>:
{
    80003ad4:	1101                	addi	sp,sp,-32
    80003ad6:	ec22                	sd	s0,24(sp)
    80003ad8:	1000                	addi	s0,sp,32
    80003ada:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003ade:	fe843783          	ld	a5,-24(s0)
    80003ae2:	10079073          	csrw	sstatus,a5
}
    80003ae6:	0001                	nop
    80003ae8:	6462                	ld	s0,24(sp)
    80003aea:	6105                	addi	sp,sp,32
    80003aec:	8082                	ret

0000000080003aee <r_sip>:
{
    80003aee:	1101                	addi	sp,sp,-32
    80003af0:	ec22                	sd	s0,24(sp)
    80003af2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003af4:	144027f3          	csrr	a5,sip
    80003af8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003afc:	fe843783          	ld	a5,-24(s0)
}
    80003b00:	853e                	mv	a0,a5
    80003b02:	6462                	ld	s0,24(sp)
    80003b04:	6105                	addi	sp,sp,32
    80003b06:	8082                	ret

0000000080003b08 <w_sip>:
{
    80003b08:	1101                	addi	sp,sp,-32
    80003b0a:	ec22                	sd	s0,24(sp)
    80003b0c:	1000                	addi	s0,sp,32
    80003b0e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003b12:	fe843783          	ld	a5,-24(s0)
    80003b16:	14479073          	csrw	sip,a5
}
    80003b1a:	0001                	nop
    80003b1c:	6462                	ld	s0,24(sp)
    80003b1e:	6105                	addi	sp,sp,32
    80003b20:	8082                	ret

0000000080003b22 <w_sepc>:
{
    80003b22:	1101                	addi	sp,sp,-32
    80003b24:	ec22                	sd	s0,24(sp)
    80003b26:	1000                	addi	s0,sp,32
    80003b28:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003b2c:	fe843783          	ld	a5,-24(s0)
    80003b30:	14179073          	csrw	sepc,a5
}
    80003b34:	0001                	nop
    80003b36:	6462                	ld	s0,24(sp)
    80003b38:	6105                	addi	sp,sp,32
    80003b3a:	8082                	ret

0000000080003b3c <r_sepc>:
{
    80003b3c:	1101                	addi	sp,sp,-32
    80003b3e:	ec22                	sd	s0,24(sp)
    80003b40:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003b42:	141027f3          	csrr	a5,sepc
    80003b46:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b4a:	fe843783          	ld	a5,-24(s0)
}
    80003b4e:	853e                	mv	a0,a5
    80003b50:	6462                	ld	s0,24(sp)
    80003b52:	6105                	addi	sp,sp,32
    80003b54:	8082                	ret

0000000080003b56 <w_stvec>:
{
    80003b56:	1101                	addi	sp,sp,-32
    80003b58:	ec22                	sd	s0,24(sp)
    80003b5a:	1000                	addi	s0,sp,32
    80003b5c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003b60:	fe843783          	ld	a5,-24(s0)
    80003b64:	10579073          	csrw	stvec,a5
}
    80003b68:	0001                	nop
    80003b6a:	6462                	ld	s0,24(sp)
    80003b6c:	6105                	addi	sp,sp,32
    80003b6e:	8082                	ret

0000000080003b70 <r_satp>:
{
    80003b70:	1101                	addi	sp,sp,-32
    80003b72:	ec22                	sd	s0,24(sp)
    80003b74:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003b76:	180027f3          	csrr	a5,satp
    80003b7a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b7e:	fe843783          	ld	a5,-24(s0)
}
    80003b82:	853e                	mv	a0,a5
    80003b84:	6462                	ld	s0,24(sp)
    80003b86:	6105                	addi	sp,sp,32
    80003b88:	8082                	ret

0000000080003b8a <r_scause>:
{
    80003b8a:	1101                	addi	sp,sp,-32
    80003b8c:	ec22                	sd	s0,24(sp)
    80003b8e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003b90:	142027f3          	csrr	a5,scause
    80003b94:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b98:	fe843783          	ld	a5,-24(s0)
}
    80003b9c:	853e                	mv	a0,a5
    80003b9e:	6462                	ld	s0,24(sp)
    80003ba0:	6105                	addi	sp,sp,32
    80003ba2:	8082                	ret

0000000080003ba4 <r_stval>:
{
    80003ba4:	1101                	addi	sp,sp,-32
    80003ba6:	ec22                	sd	s0,24(sp)
    80003ba8:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003baa:	143027f3          	csrr	a5,stval
    80003bae:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bb2:	fe843783          	ld	a5,-24(s0)
}
    80003bb6:	853e                	mv	a0,a5
    80003bb8:	6462                	ld	s0,24(sp)
    80003bba:	6105                	addi	sp,sp,32
    80003bbc:	8082                	ret

0000000080003bbe <intr_on>:
{
    80003bbe:	1141                	addi	sp,sp,-16
    80003bc0:	e406                	sd	ra,8(sp)
    80003bc2:	e022                	sd	s0,0(sp)
    80003bc4:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003bc6:	00000097          	auipc	ra,0x0
    80003bca:	ef4080e7          	jalr	-268(ra) # 80003aba <r_sstatus>
    80003bce:	87aa                	mv	a5,a0
    80003bd0:	0027e793          	ori	a5,a5,2
    80003bd4:	853e                	mv	a0,a5
    80003bd6:	00000097          	auipc	ra,0x0
    80003bda:	efe080e7          	jalr	-258(ra) # 80003ad4 <w_sstatus>
}
    80003bde:	0001                	nop
    80003be0:	60a2                	ld	ra,8(sp)
    80003be2:	6402                	ld	s0,0(sp)
    80003be4:	0141                	addi	sp,sp,16
    80003be6:	8082                	ret

0000000080003be8 <intr_off>:
{
    80003be8:	1141                	addi	sp,sp,-16
    80003bea:	e406                	sd	ra,8(sp)
    80003bec:	e022                	sd	s0,0(sp)
    80003bee:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003bf0:	00000097          	auipc	ra,0x0
    80003bf4:	eca080e7          	jalr	-310(ra) # 80003aba <r_sstatus>
    80003bf8:	87aa                	mv	a5,a0
    80003bfa:	9bf5                	andi	a5,a5,-3
    80003bfc:	853e                	mv	a0,a5
    80003bfe:	00000097          	auipc	ra,0x0
    80003c02:	ed6080e7          	jalr	-298(ra) # 80003ad4 <w_sstatus>
}
    80003c06:	0001                	nop
    80003c08:	60a2                	ld	ra,8(sp)
    80003c0a:	6402                	ld	s0,0(sp)
    80003c0c:	0141                	addi	sp,sp,16
    80003c0e:	8082                	ret

0000000080003c10 <intr_get>:
{
    80003c10:	1101                	addi	sp,sp,-32
    80003c12:	ec06                	sd	ra,24(sp)
    80003c14:	e822                	sd	s0,16(sp)
    80003c16:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003c18:	00000097          	auipc	ra,0x0
    80003c1c:	ea2080e7          	jalr	-350(ra) # 80003aba <r_sstatus>
    80003c20:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003c24:	fe843783          	ld	a5,-24(s0)
    80003c28:	8b89                	andi	a5,a5,2
    80003c2a:	00f037b3          	snez	a5,a5
    80003c2e:	0ff7f793          	andi	a5,a5,255
    80003c32:	2781                	sext.w	a5,a5
}
    80003c34:	853e                	mv	a0,a5
    80003c36:	60e2                	ld	ra,24(sp)
    80003c38:	6442                	ld	s0,16(sp)
    80003c3a:	6105                	addi	sp,sp,32
    80003c3c:	8082                	ret

0000000080003c3e <r_tp>:
{
    80003c3e:	1101                	addi	sp,sp,-32
    80003c40:	ec22                	sd	s0,24(sp)
    80003c42:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003c44:	8792                	mv	a5,tp
    80003c46:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c4a:	fe843783          	ld	a5,-24(s0)
}
    80003c4e:	853e                	mv	a0,a5
    80003c50:	6462                	ld	s0,24(sp)
    80003c52:	6105                	addi	sp,sp,32
    80003c54:	8082                	ret

0000000080003c56 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003c56:	1141                	addi	sp,sp,-16
    80003c58:	e406                	sd	ra,8(sp)
    80003c5a:	e022                	sd	s0,0(sp)
    80003c5c:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003c5e:	00008597          	auipc	a1,0x8
    80003c62:	67a58593          	addi	a1,a1,1658 # 8000c2d8 <etext+0x2d8>
    80003c66:	00017517          	auipc	a0,0x17
    80003c6a:	e0250513          	addi	a0,a0,-510 # 8001aa68 <tickslock>
    80003c6e:	ffffd097          	auipc	ra,0xffffd
    80003c72:	69e080e7          	jalr	1694(ra) # 8000130c <initlock>
}
    80003c76:	0001                	nop
    80003c78:	60a2                	ld	ra,8(sp)
    80003c7a:	6402                	ld	s0,0(sp)
    80003c7c:	0141                	addi	sp,sp,16
    80003c7e:	8082                	ret

0000000080003c80 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003c80:	1141                	addi	sp,sp,-16
    80003c82:	e406                	sd	ra,8(sp)
    80003c84:	e022                	sd	s0,0(sp)
    80003c86:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003c88:	00005797          	auipc	a5,0x5
    80003c8c:	e1878793          	addi	a5,a5,-488 # 80008aa0 <kernelvec>
    80003c90:	853e                	mv	a0,a5
    80003c92:	00000097          	auipc	ra,0x0
    80003c96:	ec4080e7          	jalr	-316(ra) # 80003b56 <w_stvec>
}
    80003c9a:	0001                	nop
    80003c9c:	60a2                	ld	ra,8(sp)
    80003c9e:	6402                	ld	s0,0(sp)
    80003ca0:	0141                	addi	sp,sp,16
    80003ca2:	8082                	ret

0000000080003ca4 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003ca4:	715d                	addi	sp,sp,-80
    80003ca6:	e486                	sd	ra,72(sp)
    80003ca8:	e0a2                	sd	s0,64(sp)
    80003caa:	fc26                	sd	s1,56(sp)
    80003cac:	0880                	addi	s0,sp,80
  int which_dev = 0;
    80003cae:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003cb2:	00000097          	auipc	ra,0x0
    80003cb6:	e08080e7          	jalr	-504(ra) # 80003aba <r_sstatus>
    80003cba:	87aa                	mv	a5,a0
    80003cbc:	1007f793          	andi	a5,a5,256
    80003cc0:	cb89                	beqz	a5,80003cd2 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003cc2:	00008517          	auipc	a0,0x8
    80003cc6:	61e50513          	addi	a0,a0,1566 # 8000c2e0 <etext+0x2e0>
    80003cca:	ffffd097          	auipc	ra,0xffffd
    80003cce:	fc2080e7          	jalr	-62(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003cd2:	00005797          	auipc	a5,0x5
    80003cd6:	dce78793          	addi	a5,a5,-562 # 80008aa0 <kernelvec>
    80003cda:	853e                	mv	a0,a5
    80003cdc:	00000097          	auipc	ra,0x0
    80003ce0:	e7a080e7          	jalr	-390(ra) # 80003b56 <w_stvec>

  struct proc *p = myproc();
    80003ce4:	fffff097          	auipc	ra,0xfffff
    80003ce8:	d52080e7          	jalr	-686(ra) # 80002a36 <myproc>
    80003cec:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003cf0:	fd043783          	ld	a5,-48(s0)
    80003cf4:	6fa4                	ld	s1,88(a5)
    80003cf6:	00000097          	auipc	ra,0x0
    80003cfa:	e46080e7          	jalr	-442(ra) # 80003b3c <r_sepc>
    80003cfe:	87aa                	mv	a5,a0
    80003d00:	ec9c                	sd	a5,24(s1)

  uint64 scause = r_scause();
    80003d02:	00000097          	auipc	ra,0x0
    80003d06:	e88080e7          	jalr	-376(ra) # 80003b8a <r_scause>
    80003d0a:	fca43423          	sd	a0,-56(s0)

  if(scause == 13) {
    80003d0e:	fc843703          	ld	a4,-56(s0)
    80003d12:	47b5                	li	a5,13
    80003d14:	04f71063          	bne	a4,a5,80003d54 <usertrap+0xb0>
    // page fault

    uint64 va = (uint64)r_stval();
    80003d18:	00000097          	auipc	ra,0x0
    80003d1c:	e8c080e7          	jalr	-372(ra) # 80003ba4 <r_stval>
    80003d20:	fca43023          	sd	a0,-64(s0)
    int pfhandled = swapin(va, p->pagetable);
    80003d24:	fd043783          	ld	a5,-48(s0)
    80003d28:	6bbc                	ld	a5,80(a5)
    80003d2a:	85be                	mv	a1,a5
    80003d2c:	fc043503          	ld	a0,-64(s0)
    80003d30:	00007097          	auipc	ra,0x7
    80003d34:	b7c080e7          	jalr	-1156(ra) # 8000a8ac <swapin>
    80003d38:	87aa                	mv	a5,a0
    80003d3a:	faf42e23          	sw	a5,-68(s0)
    if(pfhandled == 0)
    80003d3e:	fbc42783          	lw	a5,-68(s0)
    80003d42:	2781                	sext.w	a5,a5
    80003d44:	e3f9                	bnez	a5,80003e0a <usertrap+0x166>
      setkilled(p);
    80003d46:	fd043503          	ld	a0,-48(s0)
    80003d4a:	00000097          	auipc	ra,0x0
    80003d4e:	ac2080e7          	jalr	-1342(ra) # 8000380c <setkilled>
    80003d52:	a865                	j	80003e0a <usertrap+0x166>
  } else if(scause == 8) {
    80003d54:	fc843703          	ld	a4,-56(s0)
    80003d58:	47a1                	li	a5,8
    80003d5a:	04f71163          	bne	a4,a5,80003d9c <usertrap+0xf8>
    // system call

    if(killed(p))
    80003d5e:	fd043503          	ld	a0,-48(s0)
    80003d62:	00000097          	auipc	ra,0x0
    80003d66:	ae4080e7          	jalr	-1308(ra) # 80003846 <killed>
    80003d6a:	87aa                	mv	a5,a0
    80003d6c:	c791                	beqz	a5,80003d78 <usertrap+0xd4>
      exit(-1);
    80003d6e:	557d                	li	a0,-1
    80003d70:	fffff097          	auipc	ra,0xfffff
    80003d74:	3ea080e7          	jalr	1002(ra) # 8000315a <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003d78:	fd043783          	ld	a5,-48(s0)
    80003d7c:	6fbc                	ld	a5,88(a5)
    80003d7e:	6f98                	ld	a4,24(a5)
    80003d80:	fd043783          	ld	a5,-48(s0)
    80003d84:	6fbc                	ld	a5,88(a5)
    80003d86:	0711                	addi	a4,a4,4
    80003d88:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003d8a:	00000097          	auipc	ra,0x0
    80003d8e:	e34080e7          	jalr	-460(ra) # 80003bbe <intr_on>

    syscall();
    80003d92:	00000097          	auipc	ra,0x0
    80003d96:	6a8080e7          	jalr	1704(ra) # 8000443a <syscall>
    80003d9a:	a885                	j	80003e0a <usertrap+0x166>
  } else if((which_dev = devintr()) != 0){
    80003d9c:	00000097          	auipc	ra,0x0
    80003da0:	36e080e7          	jalr	878(ra) # 8000410a <devintr>
    80003da4:	87aa                	mv	a5,a0
    80003da6:	fcf42e23          	sw	a5,-36(s0)
    80003daa:	fdc42783          	lw	a5,-36(s0)
    80003dae:	2781                	sext.w	a5,a5
    80003db0:	efa9                	bnez	a5,80003e0a <usertrap+0x166>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003db2:	00000097          	auipc	ra,0x0
    80003db6:	dd8080e7          	jalr	-552(ra) # 80003b8a <r_scause>
    80003dba:	872a                	mv	a4,a0
    80003dbc:	fd043783          	ld	a5,-48(s0)
    80003dc0:	5b9c                	lw	a5,48(a5)
    80003dc2:	863e                	mv	a2,a5
    80003dc4:	85ba                	mv	a1,a4
    80003dc6:	00008517          	auipc	a0,0x8
    80003dca:	53a50513          	addi	a0,a0,1338 # 8000c300 <etext+0x300>
    80003dce:	ffffd097          	auipc	ra,0xffffd
    80003dd2:	c68080e7          	jalr	-920(ra) # 80000a36 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003dd6:	00000097          	auipc	ra,0x0
    80003dda:	d66080e7          	jalr	-666(ra) # 80003b3c <r_sepc>
    80003dde:	84aa                	mv	s1,a0
    80003de0:	00000097          	auipc	ra,0x0
    80003de4:	dc4080e7          	jalr	-572(ra) # 80003ba4 <r_stval>
    80003de8:	87aa                	mv	a5,a0
    80003dea:	863e                	mv	a2,a5
    80003dec:	85a6                	mv	a1,s1
    80003dee:	00008517          	auipc	a0,0x8
    80003df2:	54250513          	addi	a0,a0,1346 # 8000c330 <etext+0x330>
    80003df6:	ffffd097          	auipc	ra,0xffffd
    80003dfa:	c40080e7          	jalr	-960(ra) # 80000a36 <printf>
    setkilled(p);
    80003dfe:	fd043503          	ld	a0,-48(s0)
    80003e02:	00000097          	auipc	ra,0x0
    80003e06:	a0a080e7          	jalr	-1526(ra) # 8000380c <setkilled>
  }

  if(killed(p))
    80003e0a:	fd043503          	ld	a0,-48(s0)
    80003e0e:	00000097          	auipc	ra,0x0
    80003e12:	a38080e7          	jalr	-1480(ra) # 80003846 <killed>
    80003e16:	87aa                	mv	a5,a0
    80003e18:	c791                	beqz	a5,80003e24 <usertrap+0x180>
    exit(-1);
    80003e1a:	557d                	li	a0,-1
    80003e1c:	fffff097          	auipc	ra,0xfffff
    80003e20:	33e080e7          	jalr	830(ra) # 8000315a <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003e24:	fdc42783          	lw	a5,-36(s0)
    80003e28:	0007871b          	sext.w	a4,a5
    80003e2c:	4789                	li	a5,2
    80003e2e:	00f71663          	bne	a4,a5,80003e3a <usertrap+0x196>
    yield();
    80003e32:	fffff097          	auipc	ra,0xfffff
    80003e36:	75e080e7          	jalr	1886(ra) # 80003590 <yield>

  usertrapret();
    80003e3a:	00000097          	auipc	ra,0x0
    80003e3e:	014080e7          	jalr	20(ra) # 80003e4e <usertrapret>
}
    80003e42:	0001                	nop
    80003e44:	60a6                	ld	ra,72(sp)
    80003e46:	6406                	ld	s0,64(sp)
    80003e48:	74e2                	ld	s1,56(sp)
    80003e4a:	6161                	addi	sp,sp,80
    80003e4c:	8082                	ret

0000000080003e4e <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003e4e:	715d                	addi	sp,sp,-80
    80003e50:	e486                	sd	ra,72(sp)
    80003e52:	e0a2                	sd	s0,64(sp)
    80003e54:	fc26                	sd	s1,56(sp)
    80003e56:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003e58:	fffff097          	auipc	ra,0xfffff
    80003e5c:	bde080e7          	jalr	-1058(ra) # 80002a36 <myproc>
    80003e60:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003e64:	00000097          	auipc	ra,0x0
    80003e68:	d84080e7          	jalr	-636(ra) # 80003be8 <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003e6c:	00007717          	auipc	a4,0x7
    80003e70:	19470713          	addi	a4,a4,404 # 8000b000 <_trampoline>
    80003e74:	00007797          	auipc	a5,0x7
    80003e78:	18c78793          	addi	a5,a5,396 # 8000b000 <_trampoline>
    80003e7c:	8f1d                	sub	a4,a4,a5
    80003e7e:	040007b7          	lui	a5,0x4000
    80003e82:	17fd                	addi	a5,a5,-1
    80003e84:	07b2                	slli	a5,a5,0xc
    80003e86:	97ba                	add	a5,a5,a4
    80003e88:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003e8c:	fd043503          	ld	a0,-48(s0)
    80003e90:	00000097          	auipc	ra,0x0
    80003e94:	cc6080e7          	jalr	-826(ra) # 80003b56 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003e98:	fd843783          	ld	a5,-40(s0)
    80003e9c:	6fa4                	ld	s1,88(a5)
    80003e9e:	00000097          	auipc	ra,0x0
    80003ea2:	cd2080e7          	jalr	-814(ra) # 80003b70 <r_satp>
    80003ea6:	87aa                	mv	a5,a0
    80003ea8:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003eaa:	fd843783          	ld	a5,-40(s0)
    80003eae:	63b4                	ld	a3,64(a5)
    80003eb0:	fd843783          	ld	a5,-40(s0)
    80003eb4:	6fbc                	ld	a5,88(a5)
    80003eb6:	6705                	lui	a4,0x1
    80003eb8:	9736                	add	a4,a4,a3
    80003eba:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003ebc:	fd843783          	ld	a5,-40(s0)
    80003ec0:	6fbc                	ld	a5,88(a5)
    80003ec2:	00000717          	auipc	a4,0x0
    80003ec6:	de270713          	addi	a4,a4,-542 # 80003ca4 <usertrap>
    80003eca:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003ecc:	fd843783          	ld	a5,-40(s0)
    80003ed0:	6fa4                	ld	s1,88(a5)
    80003ed2:	00000097          	auipc	ra,0x0
    80003ed6:	d6c080e7          	jalr	-660(ra) # 80003c3e <r_tp>
    80003eda:	87aa                	mv	a5,a0
    80003edc:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003ede:	00000097          	auipc	ra,0x0
    80003ee2:	bdc080e7          	jalr	-1060(ra) # 80003aba <r_sstatus>
    80003ee6:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003eea:	fc843783          	ld	a5,-56(s0)
    80003eee:	eff7f793          	andi	a5,a5,-257
    80003ef2:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003ef6:	fc843783          	ld	a5,-56(s0)
    80003efa:	0207e793          	ori	a5,a5,32
    80003efe:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003f02:	fc843503          	ld	a0,-56(s0)
    80003f06:	00000097          	auipc	ra,0x0
    80003f0a:	bce080e7          	jalr	-1074(ra) # 80003ad4 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003f0e:	fd843783          	ld	a5,-40(s0)
    80003f12:	6fbc                	ld	a5,88(a5)
    80003f14:	6f9c                	ld	a5,24(a5)
    80003f16:	853e                	mv	a0,a5
    80003f18:	00000097          	auipc	ra,0x0
    80003f1c:	c0a080e7          	jalr	-1014(ra) # 80003b22 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003f20:	fd843783          	ld	a5,-40(s0)
    80003f24:	6bbc                	ld	a5,80(a5)
    80003f26:	00c7d713          	srli	a4,a5,0xc
    80003f2a:	57fd                	li	a5,-1
    80003f2c:	17fe                	slli	a5,a5,0x3f
    80003f2e:	8fd9                	or	a5,a5,a4
    80003f30:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003f34:	00007717          	auipc	a4,0x7
    80003f38:	16870713          	addi	a4,a4,360 # 8000b09c <userret>
    80003f3c:	00007797          	auipc	a5,0x7
    80003f40:	0c478793          	addi	a5,a5,196 # 8000b000 <_trampoline>
    80003f44:	8f1d                	sub	a4,a4,a5
    80003f46:	040007b7          	lui	a5,0x4000
    80003f4a:	17fd                	addi	a5,a5,-1
    80003f4c:	07b2                	slli	a5,a5,0xc
    80003f4e:	97ba                	add	a5,a5,a4
    80003f50:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003f54:	fb843783          	ld	a5,-72(s0)
    80003f58:	fc043503          	ld	a0,-64(s0)
    80003f5c:	9782                	jalr	a5
}
    80003f5e:	0001                	nop
    80003f60:	60a6                	ld	ra,72(sp)
    80003f62:	6406                	ld	s0,64(sp)
    80003f64:	74e2                	ld	s1,56(sp)
    80003f66:	6161                	addi	sp,sp,80
    80003f68:	8082                	ret

0000000080003f6a <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003f6a:	7139                	addi	sp,sp,-64
    80003f6c:	fc06                	sd	ra,56(sp)
    80003f6e:	f822                	sd	s0,48(sp)
    80003f70:	f426                	sd	s1,40(sp)
    80003f72:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003f74:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003f78:	00000097          	auipc	ra,0x0
    80003f7c:	bc4080e7          	jalr	-1084(ra) # 80003b3c <r_sepc>
    80003f80:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003f84:	00000097          	auipc	ra,0x0
    80003f88:	b36080e7          	jalr	-1226(ra) # 80003aba <r_sstatus>
    80003f8c:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003f90:	00000097          	auipc	ra,0x0
    80003f94:	bfa080e7          	jalr	-1030(ra) # 80003b8a <r_scause>
    80003f98:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003f9c:	fc843783          	ld	a5,-56(s0)
    80003fa0:	1007f793          	andi	a5,a5,256
    80003fa4:	eb89                	bnez	a5,80003fb6 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003fa6:	00008517          	auipc	a0,0x8
    80003faa:	3aa50513          	addi	a0,a0,938 # 8000c350 <etext+0x350>
    80003fae:	ffffd097          	auipc	ra,0xffffd
    80003fb2:	cde080e7          	jalr	-802(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    80003fb6:	00000097          	auipc	ra,0x0
    80003fba:	c5a080e7          	jalr	-934(ra) # 80003c10 <intr_get>
    80003fbe:	87aa                	mv	a5,a0
    80003fc0:	cb89                	beqz	a5,80003fd2 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003fc2:	00008517          	auipc	a0,0x8
    80003fc6:	3b650513          	addi	a0,a0,950 # 8000c378 <etext+0x378>
    80003fca:	ffffd097          	auipc	ra,0xffffd
    80003fce:	cc2080e7          	jalr	-830(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    80003fd2:	00000097          	auipc	ra,0x0
    80003fd6:	138080e7          	jalr	312(ra) # 8000410a <devintr>
    80003fda:	87aa                	mv	a5,a0
    80003fdc:	fcf42e23          	sw	a5,-36(s0)
    80003fe0:	fdc42783          	lw	a5,-36(s0)
    80003fe4:	2781                	sext.w	a5,a5
    80003fe6:	e7b9                	bnez	a5,80004034 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003fe8:	fc043583          	ld	a1,-64(s0)
    80003fec:	00008517          	auipc	a0,0x8
    80003ff0:	3ac50513          	addi	a0,a0,940 # 8000c398 <etext+0x398>
    80003ff4:	ffffd097          	auipc	ra,0xffffd
    80003ff8:	a42080e7          	jalr	-1470(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003ffc:	00000097          	auipc	ra,0x0
    80004000:	b40080e7          	jalr	-1216(ra) # 80003b3c <r_sepc>
    80004004:	84aa                	mv	s1,a0
    80004006:	00000097          	auipc	ra,0x0
    8000400a:	b9e080e7          	jalr	-1122(ra) # 80003ba4 <r_stval>
    8000400e:	87aa                	mv	a5,a0
    80004010:	863e                	mv	a2,a5
    80004012:	85a6                	mv	a1,s1
    80004014:	00008517          	auipc	a0,0x8
    80004018:	39450513          	addi	a0,a0,916 # 8000c3a8 <etext+0x3a8>
    8000401c:	ffffd097          	auipc	ra,0xffffd
    80004020:	a1a080e7          	jalr	-1510(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80004024:	00008517          	auipc	a0,0x8
    80004028:	39c50513          	addi	a0,a0,924 # 8000c3c0 <etext+0x3c0>
    8000402c:	ffffd097          	auipc	ra,0xffffd
    80004030:	c60080e7          	jalr	-928(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80004034:	fdc42783          	lw	a5,-36(s0)
    80004038:	0007871b          	sext.w	a4,a5
    8000403c:	4789                	li	a5,2
    8000403e:	02f71663          	bne	a4,a5,8000406a <kerneltrap+0x100>
    80004042:	fffff097          	auipc	ra,0xfffff
    80004046:	9f4080e7          	jalr	-1548(ra) # 80002a36 <myproc>
    8000404a:	87aa                	mv	a5,a0
    8000404c:	cf99                	beqz	a5,8000406a <kerneltrap+0x100>
    8000404e:	fffff097          	auipc	ra,0xfffff
    80004052:	9e8080e7          	jalr	-1560(ra) # 80002a36 <myproc>
    80004056:	87aa                	mv	a5,a0
    80004058:	4f9c                	lw	a5,24(a5)
    8000405a:	873e                	mv	a4,a5
    8000405c:	4791                	li	a5,4
    8000405e:	00f71663          	bne	a4,a5,8000406a <kerneltrap+0x100>
    yield();
    80004062:	fffff097          	auipc	ra,0xfffff
    80004066:	52e080e7          	jalr	1326(ra) # 80003590 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    8000406a:	fd043503          	ld	a0,-48(s0)
    8000406e:	00000097          	auipc	ra,0x0
    80004072:	ab4080e7          	jalr	-1356(ra) # 80003b22 <w_sepc>
  w_sstatus(sstatus);
    80004076:	fc843503          	ld	a0,-56(s0)
    8000407a:	00000097          	auipc	ra,0x0
    8000407e:	a5a080e7          	jalr	-1446(ra) # 80003ad4 <w_sstatus>
}
    80004082:	0001                	nop
    80004084:	70e2                	ld	ra,56(sp)
    80004086:	7442                	ld	s0,48(sp)
    80004088:	74a2                	ld	s1,40(sp)
    8000408a:	6121                	addi	sp,sp,64
    8000408c:	8082                	ret

000000008000408e <clockintr>:

void
clockintr()
{
    8000408e:	1141                	addi	sp,sp,-16
    80004090:	e406                	sd	ra,8(sp)
    80004092:	e022                	sd	s0,0(sp)
    80004094:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004096:	00017517          	auipc	a0,0x17
    8000409a:	9d250513          	addi	a0,a0,-1582 # 8001aa68 <tickslock>
    8000409e:	ffffd097          	auipc	ra,0xffffd
    800040a2:	29e080e7          	jalr	670(ra) # 8000133c <acquire>
  ticks++;
    800040a6:	00009797          	auipc	a5,0x9
    800040aa:	92278793          	addi	a5,a5,-1758 # 8000c9c8 <ticks>
    800040ae:	439c                	lw	a5,0(a5)
    800040b0:	2785                	addiw	a5,a5,1
    800040b2:	0007871b          	sext.w	a4,a5
    800040b6:	00009797          	auipc	a5,0x9
    800040ba:	91278793          	addi	a5,a5,-1774 # 8000c9c8 <ticks>
    800040be:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    800040c0:	00009797          	auipc	a5,0x9
    800040c4:	90878793          	addi	a5,a5,-1784 # 8000c9c8 <ticks>
    800040c8:	439c                	lw	a5,0(a5)
    800040ca:	873e                	mv	a4,a5
    800040cc:	06400793          	li	a5,100
    800040d0:	02f777bb          	remuw	a5,a4,a5
    800040d4:	2781                	sext.w	a5,a5
    800040d6:	e789                	bnez	a5,800040e0 <clockintr+0x52>
  {
    updaterefhistory();
    800040d8:	00006097          	auipc	ra,0x6
    800040dc:	51a080e7          	jalr	1306(ra) # 8000a5f2 <updaterefhistory>
  }

  wakeup(&ticks);
    800040e0:	00009517          	auipc	a0,0x9
    800040e4:	8e850513          	addi	a0,a0,-1816 # 8000c9c8 <ticks>
    800040e8:	fffff097          	auipc	ra,0xfffff
    800040ec:	5cc080e7          	jalr	1484(ra) # 800036b4 <wakeup>
  release(&tickslock);
    800040f0:	00017517          	auipc	a0,0x17
    800040f4:	97850513          	addi	a0,a0,-1672 # 8001aa68 <tickslock>
    800040f8:	ffffd097          	auipc	ra,0xffffd
    800040fc:	2a8080e7          	jalr	680(ra) # 800013a0 <release>
}
    80004100:	0001                	nop
    80004102:	60a2                	ld	ra,8(sp)
    80004104:	6402                	ld	s0,0(sp)
    80004106:	0141                	addi	sp,sp,16
    80004108:	8082                	ret

000000008000410a <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    8000410a:	1101                	addi	sp,sp,-32
    8000410c:	ec06                	sd	ra,24(sp)
    8000410e:	e822                	sd	s0,16(sp)
    80004110:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    80004112:	00000097          	auipc	ra,0x0
    80004116:	a78080e7          	jalr	-1416(ra) # 80003b8a <r_scause>
    8000411a:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    8000411e:	fe843783          	ld	a5,-24(s0)
    80004122:	0a07d263          	bgez	a5,800041c6 <devintr+0xbc>
     (scause & 0xff) == 9){
    80004126:	fe843783          	ld	a5,-24(s0)
    8000412a:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    8000412e:	47a5                	li	a5,9
    80004130:	08f71b63          	bne	a4,a5,800041c6 <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    80004134:	00005097          	auipc	ra,0x5
    80004138:	aa8080e7          	jalr	-1368(ra) # 80008bdc <plic_claim>
    8000413c:	87aa                	mv	a5,a0
    8000413e:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004142:	fe442783          	lw	a5,-28(s0)
    80004146:	0007871b          	sext.w	a4,a5
    8000414a:	47a9                	li	a5,10
    8000414c:	00f71763          	bne	a4,a5,8000415a <devintr+0x50>
      uartintr();
    80004150:	ffffd097          	auipc	ra,0xffffd
    80004154:	ede080e7          	jalr	-290(ra) # 8000102e <uartintr>
    80004158:	a891                	j	800041ac <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    8000415a:	fe442783          	lw	a5,-28(s0)
    8000415e:	0007871b          	sext.w	a4,a5
    80004162:	4785                	li	a5,1
    80004164:	00f71863          	bne	a4,a5,80004174 <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004168:	4501                	li	a0,0
    8000416a:	00006097          	auipc	ra,0x6
    8000416e:	f06080e7          	jalr	-250(ra) # 8000a070 <virtio_disk_intr>
    80004172:	a82d                	j	800041ac <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    80004174:	fe442783          	lw	a5,-28(s0)
    80004178:	0007871b          	sext.w	a4,a5
    8000417c:	4789                	li	a5,2
    8000417e:	00f71863          	bne	a4,a5,8000418e <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    80004182:	4505                	li	a0,1
    80004184:	00006097          	auipc	ra,0x6
    80004188:	eec080e7          	jalr	-276(ra) # 8000a070 <virtio_disk_intr>
    8000418c:	a005                	j	800041ac <devintr+0xa2>
    } else if(irq){
    8000418e:	fe442783          	lw	a5,-28(s0)
    80004192:	2781                	sext.w	a5,a5
    80004194:	cf81                	beqz	a5,800041ac <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    80004196:	fe442783          	lw	a5,-28(s0)
    8000419a:	85be                	mv	a1,a5
    8000419c:	00008517          	auipc	a0,0x8
    800041a0:	23450513          	addi	a0,a0,564 # 8000c3d0 <etext+0x3d0>
    800041a4:	ffffd097          	auipc	ra,0xffffd
    800041a8:	892080e7          	jalr	-1902(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    800041ac:	fe442783          	lw	a5,-28(s0)
    800041b0:	2781                	sext.w	a5,a5
    800041b2:	cb81                	beqz	a5,800041c2 <devintr+0xb8>
      plic_complete(irq);
    800041b4:	fe442783          	lw	a5,-28(s0)
    800041b8:	853e                	mv	a0,a5
    800041ba:	00005097          	auipc	ra,0x5
    800041be:	a60080e7          	jalr	-1440(ra) # 80008c1a <plic_complete>

    return 1;
    800041c2:	4785                	li	a5,1
    800041c4:	a081                	j	80004204 <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    800041c6:	fe843703          	ld	a4,-24(s0)
    800041ca:	57fd                	li	a5,-1
    800041cc:	17fe                	slli	a5,a5,0x3f
    800041ce:	0785                	addi	a5,a5,1
    800041d0:	02f71963          	bne	a4,a5,80004202 <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800041d4:	fffff097          	auipc	ra,0xfffff
    800041d8:	804080e7          	jalr	-2044(ra) # 800029d8 <cpuid>
    800041dc:	87aa                	mv	a5,a0
    800041de:	e789                	bnez	a5,800041e8 <devintr+0xde>
      clockintr();
    800041e0:	00000097          	auipc	ra,0x0
    800041e4:	eae080e7          	jalr	-338(ra) # 8000408e <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800041e8:	00000097          	auipc	ra,0x0
    800041ec:	906080e7          	jalr	-1786(ra) # 80003aee <r_sip>
    800041f0:	87aa                	mv	a5,a0
    800041f2:	9bf5                	andi	a5,a5,-3
    800041f4:	853e                	mv	a0,a5
    800041f6:	00000097          	auipc	ra,0x0
    800041fa:	912080e7          	jalr	-1774(ra) # 80003b08 <w_sip>

    return 2;
    800041fe:	4789                	li	a5,2
    80004200:	a011                	j	80004204 <devintr+0xfa>
  } else {
    return 0;
    80004202:	4781                	li	a5,0
  }
}
    80004204:	853e                	mv	a0,a5
    80004206:	60e2                	ld	ra,24(sp)
    80004208:	6442                	ld	s0,16(sp)
    8000420a:	6105                	addi	sp,sp,32
    8000420c:	8082                	ret

000000008000420e <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    8000420e:	7179                	addi	sp,sp,-48
    80004210:	f406                	sd	ra,40(sp)
    80004212:	f022                	sd	s0,32(sp)
    80004214:	1800                	addi	s0,sp,48
    80004216:	fca43c23          	sd	a0,-40(s0)
    8000421a:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000421e:	fffff097          	auipc	ra,0xfffff
    80004222:	818080e7          	jalr	-2024(ra) # 80002a36 <myproc>
    80004226:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    8000422a:	fe843783          	ld	a5,-24(s0)
    8000422e:	67bc                	ld	a5,72(a5)
    80004230:	fd843703          	ld	a4,-40(s0)
    80004234:	00f77b63          	bgeu	a4,a5,8000424a <fetchaddr+0x3c>
    80004238:	fd843783          	ld	a5,-40(s0)
    8000423c:	00878713          	addi	a4,a5,8
    80004240:	fe843783          	ld	a5,-24(s0)
    80004244:	67bc                	ld	a5,72(a5)
    80004246:	00e7f463          	bgeu	a5,a4,8000424e <fetchaddr+0x40>
    return -1;
    8000424a:	57fd                	li	a5,-1
    8000424c:	a01d                	j	80004272 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    8000424e:	fe843783          	ld	a5,-24(s0)
    80004252:	6bbc                	ld	a5,80(a5)
    80004254:	46a1                	li	a3,8
    80004256:	fd843603          	ld	a2,-40(s0)
    8000425a:	fd043583          	ld	a1,-48(s0)
    8000425e:	853e                	mv	a0,a5
    80004260:	ffffe097          	auipc	ra,0xffffe
    80004264:	36e080e7          	jalr	878(ra) # 800025ce <copyin>
    80004268:	87aa                	mv	a5,a0
    8000426a:	c399                	beqz	a5,80004270 <fetchaddr+0x62>
    return -1;
    8000426c:	57fd                	li	a5,-1
    8000426e:	a011                	j	80004272 <fetchaddr+0x64>
  return 0;
    80004270:	4781                	li	a5,0
}
    80004272:	853e                	mv	a0,a5
    80004274:	70a2                	ld	ra,40(sp)
    80004276:	7402                	ld	s0,32(sp)
    80004278:	6145                	addi	sp,sp,48
    8000427a:	8082                	ret

000000008000427c <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    8000427c:	7139                	addi	sp,sp,-64
    8000427e:	fc06                	sd	ra,56(sp)
    80004280:	f822                	sd	s0,48(sp)
    80004282:	0080                	addi	s0,sp,64
    80004284:	fca43c23          	sd	a0,-40(s0)
    80004288:	fcb43823          	sd	a1,-48(s0)
    8000428c:	87b2                	mv	a5,a2
    8000428e:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004292:	ffffe097          	auipc	ra,0xffffe
    80004296:	7a4080e7          	jalr	1956(ra) # 80002a36 <myproc>
    8000429a:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    8000429e:	fe843783          	ld	a5,-24(s0)
    800042a2:	6bbc                	ld	a5,80(a5)
    800042a4:	fcc42703          	lw	a4,-52(s0)
    800042a8:	86ba                	mv	a3,a4
    800042aa:	fd843603          	ld	a2,-40(s0)
    800042ae:	fd043583          	ld	a1,-48(s0)
    800042b2:	853e                	mv	a0,a5
    800042b4:	ffffe097          	auipc	ra,0xffffe
    800042b8:	3e8080e7          	jalr	1000(ra) # 8000269c <copyinstr>
    800042bc:	87aa                	mv	a5,a0
    800042be:	0007d463          	bgez	a5,800042c6 <fetchstr+0x4a>
    return -1;
    800042c2:	57fd                	li	a5,-1
    800042c4:	a801                	j	800042d4 <fetchstr+0x58>
  return strlen(buf);
    800042c6:	fd043503          	ld	a0,-48(s0)
    800042ca:	ffffd097          	auipc	ra,0xffffd
    800042ce:	5c4080e7          	jalr	1476(ra) # 8000188e <strlen>
    800042d2:	87aa                	mv	a5,a0
}
    800042d4:	853e                	mv	a0,a5
    800042d6:	70e2                	ld	ra,56(sp)
    800042d8:	7442                	ld	s0,48(sp)
    800042da:	6121                	addi	sp,sp,64
    800042dc:	8082                	ret

00000000800042de <argraw>:

static uint64
argraw(int n)
{
    800042de:	7179                	addi	sp,sp,-48
    800042e0:	f406                	sd	ra,40(sp)
    800042e2:	f022                	sd	s0,32(sp)
    800042e4:	1800                	addi	s0,sp,48
    800042e6:	87aa                	mv	a5,a0
    800042e8:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800042ec:	ffffe097          	auipc	ra,0xffffe
    800042f0:	74a080e7          	jalr	1866(ra) # 80002a36 <myproc>
    800042f4:	fea43423          	sd	a0,-24(s0)
    800042f8:	fdc42783          	lw	a5,-36(s0)
    800042fc:	0007871b          	sext.w	a4,a5
    80004300:	4795                	li	a5,5
    80004302:	06e7e263          	bltu	a5,a4,80004366 <argraw+0x88>
    80004306:	fdc46783          	lwu	a5,-36(s0)
    8000430a:	00279713          	slli	a4,a5,0x2
    8000430e:	00008797          	auipc	a5,0x8
    80004312:	0ea78793          	addi	a5,a5,234 # 8000c3f8 <etext+0x3f8>
    80004316:	97ba                	add	a5,a5,a4
    80004318:	439c                	lw	a5,0(a5)
    8000431a:	0007871b          	sext.w	a4,a5
    8000431e:	00008797          	auipc	a5,0x8
    80004322:	0da78793          	addi	a5,a5,218 # 8000c3f8 <etext+0x3f8>
    80004326:	97ba                	add	a5,a5,a4
    80004328:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    8000432a:	fe843783          	ld	a5,-24(s0)
    8000432e:	6fbc                	ld	a5,88(a5)
    80004330:	7bbc                	ld	a5,112(a5)
    80004332:	a091                	j	80004376 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    80004334:	fe843783          	ld	a5,-24(s0)
    80004338:	6fbc                	ld	a5,88(a5)
    8000433a:	7fbc                	ld	a5,120(a5)
    8000433c:	a82d                	j	80004376 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    8000433e:	fe843783          	ld	a5,-24(s0)
    80004342:	6fbc                	ld	a5,88(a5)
    80004344:	63dc                	ld	a5,128(a5)
    80004346:	a805                	j	80004376 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004348:	fe843783          	ld	a5,-24(s0)
    8000434c:	6fbc                	ld	a5,88(a5)
    8000434e:	67dc                	ld	a5,136(a5)
    80004350:	a01d                	j	80004376 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004352:	fe843783          	ld	a5,-24(s0)
    80004356:	6fbc                	ld	a5,88(a5)
    80004358:	6bdc                	ld	a5,144(a5)
    8000435a:	a831                	j	80004376 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000435c:	fe843783          	ld	a5,-24(s0)
    80004360:	6fbc                	ld	a5,88(a5)
    80004362:	6fdc                	ld	a5,152(a5)
    80004364:	a809                	j	80004376 <argraw+0x98>
  }
  panic("argraw");
    80004366:	00008517          	auipc	a0,0x8
    8000436a:	08a50513          	addi	a0,a0,138 # 8000c3f0 <etext+0x3f0>
    8000436e:	ffffd097          	auipc	ra,0xffffd
    80004372:	91e080e7          	jalr	-1762(ra) # 80000c8c <panic>
  return -1;
}
    80004376:	853e                	mv	a0,a5
    80004378:	70a2                	ld	ra,40(sp)
    8000437a:	7402                	ld	s0,32(sp)
    8000437c:	6145                	addi	sp,sp,48
    8000437e:	8082                	ret

0000000080004380 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    80004380:	1101                	addi	sp,sp,-32
    80004382:	ec06                	sd	ra,24(sp)
    80004384:	e822                	sd	s0,16(sp)
    80004386:	1000                	addi	s0,sp,32
    80004388:	87aa                	mv	a5,a0
    8000438a:	feb43023          	sd	a1,-32(s0)
    8000438e:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004392:	fec42783          	lw	a5,-20(s0)
    80004396:	853e                	mv	a0,a5
    80004398:	00000097          	auipc	ra,0x0
    8000439c:	f46080e7          	jalr	-186(ra) # 800042de <argraw>
    800043a0:	87aa                	mv	a5,a0
    800043a2:	0007871b          	sext.w	a4,a5
    800043a6:	fe043783          	ld	a5,-32(s0)
    800043aa:	c398                	sw	a4,0(a5)
}
    800043ac:	0001                	nop
    800043ae:	60e2                	ld	ra,24(sp)
    800043b0:	6442                	ld	s0,16(sp)
    800043b2:	6105                	addi	sp,sp,32
    800043b4:	8082                	ret

00000000800043b6 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    800043b6:	1101                	addi	sp,sp,-32
    800043b8:	ec06                	sd	ra,24(sp)
    800043ba:	e822                	sd	s0,16(sp)
    800043bc:	1000                	addi	s0,sp,32
    800043be:	87aa                	mv	a5,a0
    800043c0:	feb43023          	sd	a1,-32(s0)
    800043c4:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800043c8:	fec42783          	lw	a5,-20(s0)
    800043cc:	853e                	mv	a0,a5
    800043ce:	00000097          	auipc	ra,0x0
    800043d2:	f10080e7          	jalr	-240(ra) # 800042de <argraw>
    800043d6:	872a                	mv	a4,a0
    800043d8:	fe043783          	ld	a5,-32(s0)
    800043dc:	e398                	sd	a4,0(a5)
}
    800043de:	0001                	nop
    800043e0:	60e2                	ld	ra,24(sp)
    800043e2:	6442                	ld	s0,16(sp)
    800043e4:	6105                	addi	sp,sp,32
    800043e6:	8082                	ret

00000000800043e8 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800043e8:	7179                	addi	sp,sp,-48
    800043ea:	f406                	sd	ra,40(sp)
    800043ec:	f022                	sd	s0,32(sp)
    800043ee:	1800                	addi	s0,sp,48
    800043f0:	87aa                	mv	a5,a0
    800043f2:	fcb43823          	sd	a1,-48(s0)
    800043f6:	8732                	mv	a4,a2
    800043f8:	fcf42e23          	sw	a5,-36(s0)
    800043fc:	87ba                	mv	a5,a4
    800043fe:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    80004402:	fe840713          	addi	a4,s0,-24
    80004406:	fdc42783          	lw	a5,-36(s0)
    8000440a:	85ba                	mv	a1,a4
    8000440c:	853e                	mv	a0,a5
    8000440e:	00000097          	auipc	ra,0x0
    80004412:	fa8080e7          	jalr	-88(ra) # 800043b6 <argaddr>
  return fetchstr(addr, buf, max);
    80004416:	fe843783          	ld	a5,-24(s0)
    8000441a:	fd842703          	lw	a4,-40(s0)
    8000441e:	863a                	mv	a2,a4
    80004420:	fd043583          	ld	a1,-48(s0)
    80004424:	853e                	mv	a0,a5
    80004426:	00000097          	auipc	ra,0x0
    8000442a:	e56080e7          	jalr	-426(ra) # 8000427c <fetchstr>
    8000442e:	87aa                	mv	a5,a0
}
    80004430:	853e                	mv	a0,a5
    80004432:	70a2                	ld	ra,40(sp)
    80004434:	7402                	ld	s0,32(sp)
    80004436:	6145                	addi	sp,sp,48
    80004438:	8082                	ret

000000008000443a <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    8000443a:	7179                	addi	sp,sp,-48
    8000443c:	f406                	sd	ra,40(sp)
    8000443e:	f022                	sd	s0,32(sp)
    80004440:	ec26                	sd	s1,24(sp)
    80004442:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004444:	ffffe097          	auipc	ra,0xffffe
    80004448:	5f2080e7          	jalr	1522(ra) # 80002a36 <myproc>
    8000444c:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004450:	fd843783          	ld	a5,-40(s0)
    80004454:	6fbc                	ld	a5,88(a5)
    80004456:	77dc                	ld	a5,168(a5)
    80004458:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000445c:	fd442783          	lw	a5,-44(s0)
    80004460:	2781                	sext.w	a5,a5
    80004462:	04f05263          	blez	a5,800044a6 <syscall+0x6c>
    80004466:	fd442783          	lw	a5,-44(s0)
    8000446a:	873e                	mv	a4,a5
    8000446c:	47d5                	li	a5,21
    8000446e:	02e7ec63          	bltu	a5,a4,800044a6 <syscall+0x6c>
    80004472:	00008717          	auipc	a4,0x8
    80004476:	45e70713          	addi	a4,a4,1118 # 8000c8d0 <syscalls>
    8000447a:	fd442783          	lw	a5,-44(s0)
    8000447e:	078e                	slli	a5,a5,0x3
    80004480:	97ba                	add	a5,a5,a4
    80004482:	639c                	ld	a5,0(a5)
    80004484:	c38d                	beqz	a5,800044a6 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    80004486:	00008717          	auipc	a4,0x8
    8000448a:	44a70713          	addi	a4,a4,1098 # 8000c8d0 <syscalls>
    8000448e:	fd442783          	lw	a5,-44(s0)
    80004492:	078e                	slli	a5,a5,0x3
    80004494:	97ba                	add	a5,a5,a4
    80004496:	6398                	ld	a4,0(a5)
    80004498:	fd843783          	ld	a5,-40(s0)
    8000449c:	6fa4                	ld	s1,88(a5)
    8000449e:	9702                	jalr	a4
    800044a0:	87aa                	mv	a5,a0
    800044a2:	f8bc                	sd	a5,112(s1)
    800044a4:	a815                	j	800044d8 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    800044a6:	fd843783          	ld	a5,-40(s0)
    800044aa:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    800044ac:	fd843783          	ld	a5,-40(s0)
    800044b0:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    800044b4:	fd442683          	lw	a3,-44(s0)
    800044b8:	863e                	mv	a2,a5
    800044ba:	85ba                	mv	a1,a4
    800044bc:	00008517          	auipc	a0,0x8
    800044c0:	f5450513          	addi	a0,a0,-172 # 8000c410 <etext+0x410>
    800044c4:	ffffc097          	auipc	ra,0xffffc
    800044c8:	572080e7          	jalr	1394(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    800044cc:	fd843783          	ld	a5,-40(s0)
    800044d0:	6fbc                	ld	a5,88(a5)
    800044d2:	577d                	li	a4,-1
    800044d4:	fbb8                	sd	a4,112(a5)
  }
}
    800044d6:	0001                	nop
    800044d8:	0001                	nop
    800044da:	70a2                	ld	ra,40(sp)
    800044dc:	7402                	ld	s0,32(sp)
    800044de:	64e2                	ld	s1,24(sp)
    800044e0:	6145                	addi	sp,sp,48
    800044e2:	8082                	ret

00000000800044e4 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800044e4:	1101                	addi	sp,sp,-32
    800044e6:	ec06                	sd	ra,24(sp)
    800044e8:	e822                	sd	s0,16(sp)
    800044ea:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    800044ec:	fec40793          	addi	a5,s0,-20
    800044f0:	85be                	mv	a1,a5
    800044f2:	4501                	li	a0,0
    800044f4:	00000097          	auipc	ra,0x0
    800044f8:	e8c080e7          	jalr	-372(ra) # 80004380 <argint>
  exit(n);
    800044fc:	fec42783          	lw	a5,-20(s0)
    80004500:	853e                	mv	a0,a5
    80004502:	fffff097          	auipc	ra,0xfffff
    80004506:	c58080e7          	jalr	-936(ra) # 8000315a <exit>
  return 0;  // not reached
    8000450a:	4781                	li	a5,0
}
    8000450c:	853e                	mv	a0,a5
    8000450e:	60e2                	ld	ra,24(sp)
    80004510:	6442                	ld	s0,16(sp)
    80004512:	6105                	addi	sp,sp,32
    80004514:	8082                	ret

0000000080004516 <sys_getpid>:

uint64
sys_getpid(void)
{
    80004516:	1141                	addi	sp,sp,-16
    80004518:	e406                	sd	ra,8(sp)
    8000451a:	e022                	sd	s0,0(sp)
    8000451c:	0800                	addi	s0,sp,16
  return myproc()->pid;
    8000451e:	ffffe097          	auipc	ra,0xffffe
    80004522:	518080e7          	jalr	1304(ra) # 80002a36 <myproc>
    80004526:	87aa                	mv	a5,a0
    80004528:	5b9c                	lw	a5,48(a5)
}
    8000452a:	853e                	mv	a0,a5
    8000452c:	60a2                	ld	ra,8(sp)
    8000452e:	6402                	ld	s0,0(sp)
    80004530:	0141                	addi	sp,sp,16
    80004532:	8082                	ret

0000000080004534 <sys_fork>:

uint64
sys_fork(void)
{
    80004534:	1141                	addi	sp,sp,-16
    80004536:	e406                	sd	ra,8(sp)
    80004538:	e022                	sd	s0,0(sp)
    8000453a:	0800                	addi	s0,sp,16
  return fork();
    8000453c:	fffff097          	auipc	ra,0xfffff
    80004540:	9ca080e7          	jalr	-1590(ra) # 80002f06 <fork>
    80004544:	87aa                	mv	a5,a0
}
    80004546:	853e                	mv	a0,a5
    80004548:	60a2                	ld	ra,8(sp)
    8000454a:	6402                	ld	s0,0(sp)
    8000454c:	0141                	addi	sp,sp,16
    8000454e:	8082                	ret

0000000080004550 <sys_wait>:

uint64
sys_wait(void)
{
    80004550:	1101                	addi	sp,sp,-32
    80004552:	ec06                	sd	ra,24(sp)
    80004554:	e822                	sd	s0,16(sp)
    80004556:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    80004558:	fe840793          	addi	a5,s0,-24
    8000455c:	85be                	mv	a1,a5
    8000455e:	4501                	li	a0,0
    80004560:	00000097          	auipc	ra,0x0
    80004564:	e56080e7          	jalr	-426(ra) # 800043b6 <argaddr>
  return wait(p);
    80004568:	fe843783          	ld	a5,-24(s0)
    8000456c:	853e                	mv	a0,a5
    8000456e:	fffff097          	auipc	ra,0xfffff
    80004572:	d28080e7          	jalr	-728(ra) # 80003296 <wait>
    80004576:	87aa                	mv	a5,a0
}
    80004578:	853e                	mv	a0,a5
    8000457a:	60e2                	ld	ra,24(sp)
    8000457c:	6442                	ld	s0,16(sp)
    8000457e:	6105                	addi	sp,sp,32
    80004580:	8082                	ret

0000000080004582 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004582:	1101                	addi	sp,sp,-32
    80004584:	ec06                	sd	ra,24(sp)
    80004586:	e822                	sd	s0,16(sp)
    80004588:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    8000458a:	fe440793          	addi	a5,s0,-28
    8000458e:	85be                	mv	a1,a5
    80004590:	4501                	li	a0,0
    80004592:	00000097          	auipc	ra,0x0
    80004596:	dee080e7          	jalr	-530(ra) # 80004380 <argint>
  addr = myproc()->sz;
    8000459a:	ffffe097          	auipc	ra,0xffffe
    8000459e:	49c080e7          	jalr	1180(ra) # 80002a36 <myproc>
    800045a2:	87aa                	mv	a5,a0
    800045a4:	67bc                	ld	a5,72(a5)
    800045a6:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    800045aa:	fe442783          	lw	a5,-28(s0)
    800045ae:	853e                	mv	a0,a5
    800045b0:	fffff097          	auipc	ra,0xfffff
    800045b4:	8b6080e7          	jalr	-1866(ra) # 80002e66 <growproc>
    800045b8:	87aa                	mv	a5,a0
    800045ba:	0007d463          	bgez	a5,800045c2 <sys_sbrk+0x40>
    return -1;
    800045be:	57fd                	li	a5,-1
    800045c0:	a019                	j	800045c6 <sys_sbrk+0x44>
  return addr;
    800045c2:	fe843783          	ld	a5,-24(s0)
}
    800045c6:	853e                	mv	a0,a5
    800045c8:	60e2                	ld	ra,24(sp)
    800045ca:	6442                	ld	s0,16(sp)
    800045cc:	6105                	addi	sp,sp,32
    800045ce:	8082                	ret

00000000800045d0 <sys_sleep>:

uint64
sys_sleep(void)
{
    800045d0:	1101                	addi	sp,sp,-32
    800045d2:	ec06                	sd	ra,24(sp)
    800045d4:	e822                	sd	s0,16(sp)
    800045d6:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    800045d8:	fe840793          	addi	a5,s0,-24
    800045dc:	85be                	mv	a1,a5
    800045de:	4501                	li	a0,0
    800045e0:	00000097          	auipc	ra,0x0
    800045e4:	da0080e7          	jalr	-608(ra) # 80004380 <argint>
  acquire(&tickslock);
    800045e8:	00016517          	auipc	a0,0x16
    800045ec:	48050513          	addi	a0,a0,1152 # 8001aa68 <tickslock>
    800045f0:	ffffd097          	auipc	ra,0xffffd
    800045f4:	d4c080e7          	jalr	-692(ra) # 8000133c <acquire>
  ticks0 = ticks;
    800045f8:	00008797          	auipc	a5,0x8
    800045fc:	3d078793          	addi	a5,a5,976 # 8000c9c8 <ticks>
    80004600:	439c                	lw	a5,0(a5)
    80004602:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    80004606:	a099                	j	8000464c <sys_sleep+0x7c>
    if(killed(myproc())){
    80004608:	ffffe097          	auipc	ra,0xffffe
    8000460c:	42e080e7          	jalr	1070(ra) # 80002a36 <myproc>
    80004610:	87aa                	mv	a5,a0
    80004612:	853e                	mv	a0,a5
    80004614:	fffff097          	auipc	ra,0xfffff
    80004618:	232080e7          	jalr	562(ra) # 80003846 <killed>
    8000461c:	87aa                	mv	a5,a0
    8000461e:	cb99                	beqz	a5,80004634 <sys_sleep+0x64>
      release(&tickslock);
    80004620:	00016517          	auipc	a0,0x16
    80004624:	44850513          	addi	a0,a0,1096 # 8001aa68 <tickslock>
    80004628:	ffffd097          	auipc	ra,0xffffd
    8000462c:	d78080e7          	jalr	-648(ra) # 800013a0 <release>
      return -1;
    80004630:	57fd                	li	a5,-1
    80004632:	a0b1                	j	8000467e <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    80004634:	00016597          	auipc	a1,0x16
    80004638:	43458593          	addi	a1,a1,1076 # 8001aa68 <tickslock>
    8000463c:	00008517          	auipc	a0,0x8
    80004640:	38c50513          	addi	a0,a0,908 # 8000c9c8 <ticks>
    80004644:	fffff097          	auipc	ra,0xfffff
    80004648:	ff4080e7          	jalr	-12(ra) # 80003638 <sleep>
  while(ticks - ticks0 < n){
    8000464c:	00008797          	auipc	a5,0x8
    80004650:	37c78793          	addi	a5,a5,892 # 8000c9c8 <ticks>
    80004654:	4398                	lw	a4,0(a5)
    80004656:	fec42783          	lw	a5,-20(s0)
    8000465a:	40f707bb          	subw	a5,a4,a5
    8000465e:	0007871b          	sext.w	a4,a5
    80004662:	fe842783          	lw	a5,-24(s0)
    80004666:	2781                	sext.w	a5,a5
    80004668:	faf760e3          	bltu	a4,a5,80004608 <sys_sleep+0x38>
  }
  release(&tickslock);
    8000466c:	00016517          	auipc	a0,0x16
    80004670:	3fc50513          	addi	a0,a0,1020 # 8001aa68 <tickslock>
    80004674:	ffffd097          	auipc	ra,0xffffd
    80004678:	d2c080e7          	jalr	-724(ra) # 800013a0 <release>
  return 0;
    8000467c:	4781                	li	a5,0
}
    8000467e:	853e                	mv	a0,a5
    80004680:	60e2                	ld	ra,24(sp)
    80004682:	6442                	ld	s0,16(sp)
    80004684:	6105                	addi	sp,sp,32
    80004686:	8082                	ret

0000000080004688 <sys_kill>:

uint64
sys_kill(void)
{
    80004688:	1101                	addi	sp,sp,-32
    8000468a:	ec06                	sd	ra,24(sp)
    8000468c:	e822                	sd	s0,16(sp)
    8000468e:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    80004690:	fec40793          	addi	a5,s0,-20
    80004694:	85be                	mv	a1,a5
    80004696:	4501                	li	a0,0
    80004698:	00000097          	auipc	ra,0x0
    8000469c:	ce8080e7          	jalr	-792(ra) # 80004380 <argint>
  return kill(pid);
    800046a0:	fec42783          	lw	a5,-20(s0)
    800046a4:	853e                	mv	a0,a5
    800046a6:	fffff097          	auipc	ra,0xfffff
    800046aa:	0c6080e7          	jalr	198(ra) # 8000376c <kill>
    800046ae:	87aa                	mv	a5,a0
}
    800046b0:	853e                	mv	a0,a5
    800046b2:	60e2                	ld	ra,24(sp)
    800046b4:	6442                	ld	s0,16(sp)
    800046b6:	6105                	addi	sp,sp,32
    800046b8:	8082                	ret

00000000800046ba <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    800046ba:	1101                	addi	sp,sp,-32
    800046bc:	ec06                	sd	ra,24(sp)
    800046be:	e822                	sd	s0,16(sp)
    800046c0:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    800046c2:	00016517          	auipc	a0,0x16
    800046c6:	3a650513          	addi	a0,a0,934 # 8001aa68 <tickslock>
    800046ca:	ffffd097          	auipc	ra,0xffffd
    800046ce:	c72080e7          	jalr	-910(ra) # 8000133c <acquire>
  xticks = ticks;
    800046d2:	00008797          	auipc	a5,0x8
    800046d6:	2f678793          	addi	a5,a5,758 # 8000c9c8 <ticks>
    800046da:	439c                	lw	a5,0(a5)
    800046dc:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    800046e0:	00016517          	auipc	a0,0x16
    800046e4:	38850513          	addi	a0,a0,904 # 8001aa68 <tickslock>
    800046e8:	ffffd097          	auipc	ra,0xffffd
    800046ec:	cb8080e7          	jalr	-840(ra) # 800013a0 <release>
  return xticks;
    800046f0:	fec46783          	lwu	a5,-20(s0)
}
    800046f4:	853e                	mv	a0,a5
    800046f6:	60e2                	ld	ra,24(sp)
    800046f8:	6442                	ld	s0,16(sp)
    800046fa:	6105                	addi	sp,sp,32
    800046fc:	8082                	ret

00000000800046fe <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800046fe:	1101                	addi	sp,sp,-32
    80004700:	ec06                	sd	ra,24(sp)
    80004702:	e822                	sd	s0,16(sp)
    80004704:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    80004706:	00008597          	auipc	a1,0x8
    8000470a:	d2a58593          	addi	a1,a1,-726 # 8000c430 <etext+0x430>
    8000470e:	00016517          	auipc	a0,0x16
    80004712:	37250513          	addi	a0,a0,882 # 8001aa80 <bcache>
    80004716:	ffffd097          	auipc	ra,0xffffd
    8000471a:	bf6080e7          	jalr	-1034(ra) # 8000130c <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    8000471e:	00016717          	auipc	a4,0x16
    80004722:	36270713          	addi	a4,a4,866 # 8001aa80 <bcache>
    80004726:	67a1                	lui	a5,0x8
    80004728:	97ba                	add	a5,a5,a4
    8000472a:	0001e717          	auipc	a4,0x1e
    8000472e:	5be70713          	addi	a4,a4,1470 # 80022ce8 <bcache+0x8268>
    80004732:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    80004736:	00016717          	auipc	a4,0x16
    8000473a:	34a70713          	addi	a4,a4,842 # 8001aa80 <bcache>
    8000473e:	67a1                	lui	a5,0x8
    80004740:	97ba                	add	a5,a5,a4
    80004742:	0001e717          	auipc	a4,0x1e
    80004746:	5a670713          	addi	a4,a4,1446 # 80022ce8 <bcache+0x8268>
    8000474a:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000474e:	00016797          	auipc	a5,0x16
    80004752:	34a78793          	addi	a5,a5,842 # 8001aa98 <bcache+0x18>
    80004756:	fef43423          	sd	a5,-24(s0)
    8000475a:	a895                	j	800047ce <binit+0xd0>
    b->next = bcache.head.next;
    8000475c:	00016717          	auipc	a4,0x16
    80004760:	32470713          	addi	a4,a4,804 # 8001aa80 <bcache>
    80004764:	67a1                	lui	a5,0x8
    80004766:	97ba                	add	a5,a5,a4
    80004768:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000476c:	fe843783          	ld	a5,-24(s0)
    80004770:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004772:	fe843783          	ld	a5,-24(s0)
    80004776:	0001e717          	auipc	a4,0x1e
    8000477a:	57270713          	addi	a4,a4,1394 # 80022ce8 <bcache+0x8268>
    8000477e:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004780:	fe843783          	ld	a5,-24(s0)
    80004784:	07c1                	addi	a5,a5,16
    80004786:	00008597          	auipc	a1,0x8
    8000478a:	cb258593          	addi	a1,a1,-846 # 8000c438 <etext+0x438>
    8000478e:	853e                	mv	a0,a5
    80004790:	00002097          	auipc	ra,0x2
    80004794:	034080e7          	jalr	52(ra) # 800067c4 <initsleeplock>
    bcache.head.next->prev = b;
    80004798:	00016717          	auipc	a4,0x16
    8000479c:	2e870713          	addi	a4,a4,744 # 8001aa80 <bcache>
    800047a0:	67a1                	lui	a5,0x8
    800047a2:	97ba                	add	a5,a5,a4
    800047a4:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047a8:	fe843703          	ld	a4,-24(s0)
    800047ac:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    800047ae:	00016717          	auipc	a4,0x16
    800047b2:	2d270713          	addi	a4,a4,722 # 8001aa80 <bcache>
    800047b6:	67a1                	lui	a5,0x8
    800047b8:	97ba                	add	a5,a5,a4
    800047ba:	fe843703          	ld	a4,-24(s0)
    800047be:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800047c2:	fe843783          	ld	a5,-24(s0)
    800047c6:	45878793          	addi	a5,a5,1112
    800047ca:	fef43423          	sd	a5,-24(s0)
    800047ce:	0001e797          	auipc	a5,0x1e
    800047d2:	51a78793          	addi	a5,a5,1306 # 80022ce8 <bcache+0x8268>
    800047d6:	fe843703          	ld	a4,-24(s0)
    800047da:	f8f761e3          	bltu	a4,a5,8000475c <binit+0x5e>
  }
}
    800047de:	0001                	nop
    800047e0:	0001                	nop
    800047e2:	60e2                	ld	ra,24(sp)
    800047e4:	6442                	ld	s0,16(sp)
    800047e6:	6105                	addi	sp,sp,32
    800047e8:	8082                	ret

00000000800047ea <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800047ea:	7179                	addi	sp,sp,-48
    800047ec:	f406                	sd	ra,40(sp)
    800047ee:	f022                	sd	s0,32(sp)
    800047f0:	1800                	addi	s0,sp,48
    800047f2:	87aa                	mv	a5,a0
    800047f4:	872e                	mv	a4,a1
    800047f6:	fcf42e23          	sw	a5,-36(s0)
    800047fa:	87ba                	mv	a5,a4
    800047fc:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    80004800:	00016517          	auipc	a0,0x16
    80004804:	28050513          	addi	a0,a0,640 # 8001aa80 <bcache>
    80004808:	ffffd097          	auipc	ra,0xffffd
    8000480c:	b34080e7          	jalr	-1228(ra) # 8000133c <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004810:	00016717          	auipc	a4,0x16
    80004814:	27070713          	addi	a4,a4,624 # 8001aa80 <bcache>
    80004818:	67a1                	lui	a5,0x8
    8000481a:	97ba                	add	a5,a5,a4
    8000481c:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004820:	fef43423          	sd	a5,-24(s0)
    80004824:	a095                	j	80004888 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    80004826:	fe843783          	ld	a5,-24(s0)
    8000482a:	4798                	lw	a4,8(a5)
    8000482c:	fdc42783          	lw	a5,-36(s0)
    80004830:	2781                	sext.w	a5,a5
    80004832:	04e79663          	bne	a5,a4,8000487e <bget+0x94>
    80004836:	fe843783          	ld	a5,-24(s0)
    8000483a:	47d8                	lw	a4,12(a5)
    8000483c:	fd842783          	lw	a5,-40(s0)
    80004840:	2781                	sext.w	a5,a5
    80004842:	02e79e63          	bne	a5,a4,8000487e <bget+0x94>
      b->refcnt++;
    80004846:	fe843783          	ld	a5,-24(s0)
    8000484a:	43bc                	lw	a5,64(a5)
    8000484c:	2785                	addiw	a5,a5,1
    8000484e:	0007871b          	sext.w	a4,a5
    80004852:	fe843783          	ld	a5,-24(s0)
    80004856:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004858:	00016517          	auipc	a0,0x16
    8000485c:	22850513          	addi	a0,a0,552 # 8001aa80 <bcache>
    80004860:	ffffd097          	auipc	ra,0xffffd
    80004864:	b40080e7          	jalr	-1216(ra) # 800013a0 <release>
      acquiresleep(&b->lock);
    80004868:	fe843783          	ld	a5,-24(s0)
    8000486c:	07c1                	addi	a5,a5,16
    8000486e:	853e                	mv	a0,a5
    80004870:	00002097          	auipc	ra,0x2
    80004874:	fa0080e7          	jalr	-96(ra) # 80006810 <acquiresleep>
      return b;
    80004878:	fe843783          	ld	a5,-24(s0)
    8000487c:	a07d                	j	8000492a <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8000487e:	fe843783          	ld	a5,-24(s0)
    80004882:	6bbc                	ld	a5,80(a5)
    80004884:	fef43423          	sd	a5,-24(s0)
    80004888:	fe843703          	ld	a4,-24(s0)
    8000488c:	0001e797          	auipc	a5,0x1e
    80004890:	45c78793          	addi	a5,a5,1116 # 80022ce8 <bcache+0x8268>
    80004894:	f8f719e3          	bne	a4,a5,80004826 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004898:	00016717          	auipc	a4,0x16
    8000489c:	1e870713          	addi	a4,a4,488 # 8001aa80 <bcache>
    800048a0:	67a1                	lui	a5,0x8
    800048a2:	97ba                	add	a5,a5,a4
    800048a4:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    800048a8:	fef43423          	sd	a5,-24(s0)
    800048ac:	a8b9                	j	8000490a <bget+0x120>
    if(b->refcnt == 0) {
    800048ae:	fe843783          	ld	a5,-24(s0)
    800048b2:	43bc                	lw	a5,64(a5)
    800048b4:	e7b1                	bnez	a5,80004900 <bget+0x116>
      b->dev = dev;
    800048b6:	fe843783          	ld	a5,-24(s0)
    800048ba:	fdc42703          	lw	a4,-36(s0)
    800048be:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    800048c0:	fe843783          	ld	a5,-24(s0)
    800048c4:	fd842703          	lw	a4,-40(s0)
    800048c8:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    800048ca:	fe843783          	ld	a5,-24(s0)
    800048ce:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    800048d2:	fe843783          	ld	a5,-24(s0)
    800048d6:	4705                	li	a4,1
    800048d8:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800048da:	00016517          	auipc	a0,0x16
    800048de:	1a650513          	addi	a0,a0,422 # 8001aa80 <bcache>
    800048e2:	ffffd097          	auipc	ra,0xffffd
    800048e6:	abe080e7          	jalr	-1346(ra) # 800013a0 <release>
      acquiresleep(&b->lock);
    800048ea:	fe843783          	ld	a5,-24(s0)
    800048ee:	07c1                	addi	a5,a5,16
    800048f0:	853e                	mv	a0,a5
    800048f2:	00002097          	auipc	ra,0x2
    800048f6:	f1e080e7          	jalr	-226(ra) # 80006810 <acquiresleep>
      return b;
    800048fa:	fe843783          	ld	a5,-24(s0)
    800048fe:	a035                	j	8000492a <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004900:	fe843783          	ld	a5,-24(s0)
    80004904:	67bc                	ld	a5,72(a5)
    80004906:	fef43423          	sd	a5,-24(s0)
    8000490a:	fe843703          	ld	a4,-24(s0)
    8000490e:	0001e797          	auipc	a5,0x1e
    80004912:	3da78793          	addi	a5,a5,986 # 80022ce8 <bcache+0x8268>
    80004916:	f8f71ce3          	bne	a4,a5,800048ae <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    8000491a:	00008517          	auipc	a0,0x8
    8000491e:	b2650513          	addi	a0,a0,-1242 # 8000c440 <etext+0x440>
    80004922:	ffffc097          	auipc	ra,0xffffc
    80004926:	36a080e7          	jalr	874(ra) # 80000c8c <panic>
}
    8000492a:	853e                	mv	a0,a5
    8000492c:	70a2                	ld	ra,40(sp)
    8000492e:	7402                	ld	s0,32(sp)
    80004930:	6145                	addi	sp,sp,48
    80004932:	8082                	ret

0000000080004934 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    80004934:	7179                	addi	sp,sp,-48
    80004936:	f406                	sd	ra,40(sp)
    80004938:	f022                	sd	s0,32(sp)
    8000493a:	1800                	addi	s0,sp,48
    8000493c:	87aa                	mv	a5,a0
    8000493e:	872e                	mv	a4,a1
    80004940:	fcf42e23          	sw	a5,-36(s0)
    80004944:	87ba                	mv	a5,a4
    80004946:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    8000494a:	fd842703          	lw	a4,-40(s0)
    8000494e:	fdc42783          	lw	a5,-36(s0)
    80004952:	85ba                	mv	a1,a4
    80004954:	853e                	mv	a0,a5
    80004956:	00000097          	auipc	ra,0x0
    8000495a:	e94080e7          	jalr	-364(ra) # 800047ea <bget>
    8000495e:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004962:	fe843783          	ld	a5,-24(s0)
    80004966:	439c                	lw	a5,0(a5)
    80004968:	ef91                	bnez	a5,80004984 <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    8000496a:	4681                	li	a3,0
    8000496c:	4601                	li	a2,0
    8000496e:	fe843583          	ld	a1,-24(s0)
    80004972:	4501                	li	a0,0
    80004974:	00005097          	auipc	ra,0x5
    80004978:	ebe080e7          	jalr	-322(ra) # 80009832 <virtio_disk_rw>
    b->valid = 1;
    8000497c:	fe843783          	ld	a5,-24(s0)
    80004980:	4705                	li	a4,1
    80004982:	c398                	sw	a4,0(a5)
  }
  return b;
    80004984:	fe843783          	ld	a5,-24(s0)
}
    80004988:	853e                	mv	a0,a5
    8000498a:	70a2                	ld	ra,40(sp)
    8000498c:	7402                	ld	s0,32(sp)
    8000498e:	6145                	addi	sp,sp,48
    80004990:	8082                	ret

0000000080004992 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004992:	1101                	addi	sp,sp,-32
    80004994:	ec06                	sd	ra,24(sp)
    80004996:	e822                	sd	s0,16(sp)
    80004998:	1000                	addi	s0,sp,32
    8000499a:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    8000499e:	fe843783          	ld	a5,-24(s0)
    800049a2:	07c1                	addi	a5,a5,16
    800049a4:	853e                	mv	a0,a5
    800049a6:	00002097          	auipc	ra,0x2
    800049aa:	f2a080e7          	jalr	-214(ra) # 800068d0 <holdingsleep>
    800049ae:	87aa                	mv	a5,a0
    800049b0:	eb89                	bnez	a5,800049c2 <bwrite+0x30>
    panic("bwrite");
    800049b2:	00008517          	auipc	a0,0x8
    800049b6:	aa650513          	addi	a0,a0,-1370 # 8000c458 <etext+0x458>
    800049ba:	ffffc097          	auipc	ra,0xffffc
    800049be:	2d2080e7          	jalr	722(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    800049c2:	4681                	li	a3,0
    800049c4:	4605                	li	a2,1
    800049c6:	fe843583          	ld	a1,-24(s0)
    800049ca:	4501                	li	a0,0
    800049cc:	00005097          	auipc	ra,0x5
    800049d0:	e66080e7          	jalr	-410(ra) # 80009832 <virtio_disk_rw>
}
    800049d4:	0001                	nop
    800049d6:	60e2                	ld	ra,24(sp)
    800049d8:	6442                	ld	s0,16(sp)
    800049da:	6105                	addi	sp,sp,32
    800049dc:	8082                	ret

00000000800049de <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    800049de:	1101                	addi	sp,sp,-32
    800049e0:	ec06                	sd	ra,24(sp)
    800049e2:	e822                	sd	s0,16(sp)
    800049e4:	1000                	addi	s0,sp,32
    800049e6:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800049ea:	fe843783          	ld	a5,-24(s0)
    800049ee:	07c1                	addi	a5,a5,16
    800049f0:	853e                	mv	a0,a5
    800049f2:	00002097          	auipc	ra,0x2
    800049f6:	ede080e7          	jalr	-290(ra) # 800068d0 <holdingsleep>
    800049fa:	87aa                	mv	a5,a0
    800049fc:	eb89                	bnez	a5,80004a0e <brelse+0x30>
    panic("brelse");
    800049fe:	00008517          	auipc	a0,0x8
    80004a02:	a6250513          	addi	a0,a0,-1438 # 8000c460 <etext+0x460>
    80004a06:	ffffc097          	auipc	ra,0xffffc
    80004a0a:	286080e7          	jalr	646(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    80004a0e:	fe843783          	ld	a5,-24(s0)
    80004a12:	07c1                	addi	a5,a5,16
    80004a14:	853e                	mv	a0,a5
    80004a16:	00002097          	auipc	ra,0x2
    80004a1a:	e68080e7          	jalr	-408(ra) # 8000687e <releasesleep>

  acquire(&bcache.lock);
    80004a1e:	00016517          	auipc	a0,0x16
    80004a22:	06250513          	addi	a0,a0,98 # 8001aa80 <bcache>
    80004a26:	ffffd097          	auipc	ra,0xffffd
    80004a2a:	916080e7          	jalr	-1770(ra) # 8000133c <acquire>
  b->refcnt--;
    80004a2e:	fe843783          	ld	a5,-24(s0)
    80004a32:	43bc                	lw	a5,64(a5)
    80004a34:	37fd                	addiw	a5,a5,-1
    80004a36:	0007871b          	sext.w	a4,a5
    80004a3a:	fe843783          	ld	a5,-24(s0)
    80004a3e:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004a40:	fe843783          	ld	a5,-24(s0)
    80004a44:	43bc                	lw	a5,64(a5)
    80004a46:	e7b5                	bnez	a5,80004ab2 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004a48:	fe843783          	ld	a5,-24(s0)
    80004a4c:	6bbc                	ld	a5,80(a5)
    80004a4e:	fe843703          	ld	a4,-24(s0)
    80004a52:	6738                	ld	a4,72(a4)
    80004a54:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004a56:	fe843783          	ld	a5,-24(s0)
    80004a5a:	67bc                	ld	a5,72(a5)
    80004a5c:	fe843703          	ld	a4,-24(s0)
    80004a60:	6b38                	ld	a4,80(a4)
    80004a62:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004a64:	00016717          	auipc	a4,0x16
    80004a68:	01c70713          	addi	a4,a4,28 # 8001aa80 <bcache>
    80004a6c:	67a1                	lui	a5,0x8
    80004a6e:	97ba                	add	a5,a5,a4
    80004a70:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a74:	fe843783          	ld	a5,-24(s0)
    80004a78:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004a7a:	fe843783          	ld	a5,-24(s0)
    80004a7e:	0001e717          	auipc	a4,0x1e
    80004a82:	26a70713          	addi	a4,a4,618 # 80022ce8 <bcache+0x8268>
    80004a86:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004a88:	00016717          	auipc	a4,0x16
    80004a8c:	ff870713          	addi	a4,a4,-8 # 8001aa80 <bcache>
    80004a90:	67a1                	lui	a5,0x8
    80004a92:	97ba                	add	a5,a5,a4
    80004a94:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a98:	fe843703          	ld	a4,-24(s0)
    80004a9c:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004a9e:	00016717          	auipc	a4,0x16
    80004aa2:	fe270713          	addi	a4,a4,-30 # 8001aa80 <bcache>
    80004aa6:	67a1                	lui	a5,0x8
    80004aa8:	97ba                	add	a5,a5,a4
    80004aaa:	fe843703          	ld	a4,-24(s0)
    80004aae:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004ab2:	00016517          	auipc	a0,0x16
    80004ab6:	fce50513          	addi	a0,a0,-50 # 8001aa80 <bcache>
    80004aba:	ffffd097          	auipc	ra,0xffffd
    80004abe:	8e6080e7          	jalr	-1818(ra) # 800013a0 <release>
}
    80004ac2:	0001                	nop
    80004ac4:	60e2                	ld	ra,24(sp)
    80004ac6:	6442                	ld	s0,16(sp)
    80004ac8:	6105                	addi	sp,sp,32
    80004aca:	8082                	ret

0000000080004acc <bpin>:

void
bpin(struct buf *b) {
    80004acc:	1101                	addi	sp,sp,-32
    80004ace:	ec06                	sd	ra,24(sp)
    80004ad0:	e822                	sd	s0,16(sp)
    80004ad2:	1000                	addi	s0,sp,32
    80004ad4:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004ad8:	00016517          	auipc	a0,0x16
    80004adc:	fa850513          	addi	a0,a0,-88 # 8001aa80 <bcache>
    80004ae0:	ffffd097          	auipc	ra,0xffffd
    80004ae4:	85c080e7          	jalr	-1956(ra) # 8000133c <acquire>
  b->refcnt++;
    80004ae8:	fe843783          	ld	a5,-24(s0)
    80004aec:	43bc                	lw	a5,64(a5)
    80004aee:	2785                	addiw	a5,a5,1
    80004af0:	0007871b          	sext.w	a4,a5
    80004af4:	fe843783          	ld	a5,-24(s0)
    80004af8:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004afa:	00016517          	auipc	a0,0x16
    80004afe:	f8650513          	addi	a0,a0,-122 # 8001aa80 <bcache>
    80004b02:	ffffd097          	auipc	ra,0xffffd
    80004b06:	89e080e7          	jalr	-1890(ra) # 800013a0 <release>
}
    80004b0a:	0001                	nop
    80004b0c:	60e2                	ld	ra,24(sp)
    80004b0e:	6442                	ld	s0,16(sp)
    80004b10:	6105                	addi	sp,sp,32
    80004b12:	8082                	ret

0000000080004b14 <bunpin>:

void
bunpin(struct buf *b) {
    80004b14:	1101                	addi	sp,sp,-32
    80004b16:	ec06                	sd	ra,24(sp)
    80004b18:	e822                	sd	s0,16(sp)
    80004b1a:	1000                	addi	s0,sp,32
    80004b1c:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004b20:	00016517          	auipc	a0,0x16
    80004b24:	f6050513          	addi	a0,a0,-160 # 8001aa80 <bcache>
    80004b28:	ffffd097          	auipc	ra,0xffffd
    80004b2c:	814080e7          	jalr	-2028(ra) # 8000133c <acquire>
  b->refcnt--;
    80004b30:	fe843783          	ld	a5,-24(s0)
    80004b34:	43bc                	lw	a5,64(a5)
    80004b36:	37fd                	addiw	a5,a5,-1
    80004b38:	0007871b          	sext.w	a4,a5
    80004b3c:	fe843783          	ld	a5,-24(s0)
    80004b40:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004b42:	00016517          	auipc	a0,0x16
    80004b46:	f3e50513          	addi	a0,a0,-194 # 8001aa80 <bcache>
    80004b4a:	ffffd097          	auipc	ra,0xffffd
    80004b4e:	856080e7          	jalr	-1962(ra) # 800013a0 <release>
}
    80004b52:	0001                	nop
    80004b54:	60e2                	ld	ra,24(sp)
    80004b56:	6442                	ld	s0,16(sp)
    80004b58:	6105                	addi	sp,sp,32
    80004b5a:	8082                	ret

0000000080004b5c <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004b5c:	7179                	addi	sp,sp,-48
    80004b5e:	f406                	sd	ra,40(sp)
    80004b60:	f022                	sd	s0,32(sp)
    80004b62:	1800                	addi	s0,sp,48
    80004b64:	87aa                	mv	a5,a0
    80004b66:	fcb43823          	sd	a1,-48(s0)
    80004b6a:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004b6e:	fdc42783          	lw	a5,-36(s0)
    80004b72:	4585                	li	a1,1
    80004b74:	853e                	mv	a0,a5
    80004b76:	00000097          	auipc	ra,0x0
    80004b7a:	dbe080e7          	jalr	-578(ra) # 80004934 <bread>
    80004b7e:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004b82:	fe843783          	ld	a5,-24(s0)
    80004b86:	05878793          	addi	a5,a5,88
    80004b8a:	02000613          	li	a2,32
    80004b8e:	85be                	mv	a1,a5
    80004b90:	fd043503          	ld	a0,-48(s0)
    80004b94:	ffffd097          	auipc	ra,0xffffd
    80004b98:	a60080e7          	jalr	-1440(ra) # 800015f4 <memmove>
  brelse(bp);
    80004b9c:	fe843503          	ld	a0,-24(s0)
    80004ba0:	00000097          	auipc	ra,0x0
    80004ba4:	e3e080e7          	jalr	-450(ra) # 800049de <brelse>
}
    80004ba8:	0001                	nop
    80004baa:	70a2                	ld	ra,40(sp)
    80004bac:	7402                	ld	s0,32(sp)
    80004bae:	6145                	addi	sp,sp,48
    80004bb0:	8082                	ret

0000000080004bb2 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004bb2:	1101                	addi	sp,sp,-32
    80004bb4:	ec06                	sd	ra,24(sp)
    80004bb6:	e822                	sd	s0,16(sp)
    80004bb8:	1000                	addi	s0,sp,32
    80004bba:	87aa                	mv	a5,a0
    80004bbc:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004bc0:	fec42783          	lw	a5,-20(s0)
    80004bc4:	0001e597          	auipc	a1,0x1e
    80004bc8:	57c58593          	addi	a1,a1,1404 # 80023140 <sb>
    80004bcc:	853e                	mv	a0,a5
    80004bce:	00000097          	auipc	ra,0x0
    80004bd2:	f8e080e7          	jalr	-114(ra) # 80004b5c <readsb>
  if(sb.magic != FSMAGIC)
    80004bd6:	0001e797          	auipc	a5,0x1e
    80004bda:	56a78793          	addi	a5,a5,1386 # 80023140 <sb>
    80004bde:	439c                	lw	a5,0(a5)
    80004be0:	873e                	mv	a4,a5
    80004be2:	102037b7          	lui	a5,0x10203
    80004be6:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004bea:	00f70a63          	beq	a4,a5,80004bfe <fsinit+0x4c>
    panic("invalid file system");
    80004bee:	00008517          	auipc	a0,0x8
    80004bf2:	87a50513          	addi	a0,a0,-1926 # 8000c468 <etext+0x468>
    80004bf6:	ffffc097          	auipc	ra,0xffffc
    80004bfa:	096080e7          	jalr	150(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004bfe:	fec42783          	lw	a5,-20(s0)
    80004c02:	0001e597          	auipc	a1,0x1e
    80004c06:	53e58593          	addi	a1,a1,1342 # 80023140 <sb>
    80004c0a:	853e                	mv	a0,a5
    80004c0c:	00001097          	auipc	ra,0x1
    80004c10:	49c080e7          	jalr	1180(ra) # 800060a8 <initlog>
}
    80004c14:	0001                	nop
    80004c16:	60e2                	ld	ra,24(sp)
    80004c18:	6442                	ld	s0,16(sp)
    80004c1a:	6105                	addi	sp,sp,32
    80004c1c:	8082                	ret

0000000080004c1e <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004c1e:	7179                	addi	sp,sp,-48
    80004c20:	f406                	sd	ra,40(sp)
    80004c22:	f022                	sd	s0,32(sp)
    80004c24:	1800                	addi	s0,sp,48
    80004c26:	87aa                	mv	a5,a0
    80004c28:	872e                	mv	a4,a1
    80004c2a:	fcf42e23          	sw	a5,-36(s0)
    80004c2e:	87ba                	mv	a5,a4
    80004c30:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004c34:	fdc42783          	lw	a5,-36(s0)
    80004c38:	fd842703          	lw	a4,-40(s0)
    80004c3c:	85ba                	mv	a1,a4
    80004c3e:	853e                	mv	a0,a5
    80004c40:	00000097          	auipc	ra,0x0
    80004c44:	cf4080e7          	jalr	-780(ra) # 80004934 <bread>
    80004c48:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004c4c:	fe843783          	ld	a5,-24(s0)
    80004c50:	05878793          	addi	a5,a5,88
    80004c54:	40000613          	li	a2,1024
    80004c58:	4581                	li	a1,0
    80004c5a:	853e                	mv	a0,a5
    80004c5c:	ffffd097          	auipc	ra,0xffffd
    80004c60:	8b4080e7          	jalr	-1868(ra) # 80001510 <memset>
  log_write(bp);
    80004c64:	fe843503          	ld	a0,-24(s0)
    80004c68:	00002097          	auipc	ra,0x2
    80004c6c:	a28080e7          	jalr	-1496(ra) # 80006690 <log_write>
  brelse(bp);
    80004c70:	fe843503          	ld	a0,-24(s0)
    80004c74:	00000097          	auipc	ra,0x0
    80004c78:	d6a080e7          	jalr	-662(ra) # 800049de <brelse>
}
    80004c7c:	0001                	nop
    80004c7e:	70a2                	ld	ra,40(sp)
    80004c80:	7402                	ld	s0,32(sp)
    80004c82:	6145                	addi	sp,sp,48
    80004c84:	8082                	ret

0000000080004c86 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004c86:	7139                	addi	sp,sp,-64
    80004c88:	fc06                	sd	ra,56(sp)
    80004c8a:	f822                	sd	s0,48(sp)
    80004c8c:	0080                	addi	s0,sp,64
    80004c8e:	87aa                	mv	a5,a0
    80004c90:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004c94:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004c98:	fe042623          	sw	zero,-20(s0)
    80004c9c:	a2b5                	j	80004e08 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004c9e:	fec42783          	lw	a5,-20(s0)
    80004ca2:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ca6:	0137571b          	srliw	a4,a4,0x13
    80004caa:	9fb9                	addw	a5,a5,a4
    80004cac:	40d7d79b          	sraiw	a5,a5,0xd
    80004cb0:	2781                	sext.w	a5,a5
    80004cb2:	0007871b          	sext.w	a4,a5
    80004cb6:	0001e797          	auipc	a5,0x1e
    80004cba:	48a78793          	addi	a5,a5,1162 # 80023140 <sb>
    80004cbe:	4fdc                	lw	a5,28(a5)
    80004cc0:	9fb9                	addw	a5,a5,a4
    80004cc2:	0007871b          	sext.w	a4,a5
    80004cc6:	fcc42783          	lw	a5,-52(s0)
    80004cca:	85ba                	mv	a1,a4
    80004ccc:	853e                	mv	a0,a5
    80004cce:	00000097          	auipc	ra,0x0
    80004cd2:	c66080e7          	jalr	-922(ra) # 80004934 <bread>
    80004cd6:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004cda:	fe042423          	sw	zero,-24(s0)
    80004cde:	a0dd                	j	80004dc4 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004ce0:	fe842703          	lw	a4,-24(s0)
    80004ce4:	41f7579b          	sraiw	a5,a4,0x1f
    80004ce8:	01d7d79b          	srliw	a5,a5,0x1d
    80004cec:	9f3d                	addw	a4,a4,a5
    80004cee:	8b1d                	andi	a4,a4,7
    80004cf0:	40f707bb          	subw	a5,a4,a5
    80004cf4:	2781                	sext.w	a5,a5
    80004cf6:	4705                	li	a4,1
    80004cf8:	00f717bb          	sllw	a5,a4,a5
    80004cfc:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004d00:	fe842783          	lw	a5,-24(s0)
    80004d04:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d08:	01d7571b          	srliw	a4,a4,0x1d
    80004d0c:	9fb9                	addw	a5,a5,a4
    80004d0e:	4037d79b          	sraiw	a5,a5,0x3
    80004d12:	2781                	sext.w	a5,a5
    80004d14:	fe043703          	ld	a4,-32(s0)
    80004d18:	97ba                	add	a5,a5,a4
    80004d1a:	0587c783          	lbu	a5,88(a5)
    80004d1e:	0007871b          	sext.w	a4,a5
    80004d22:	fdc42783          	lw	a5,-36(s0)
    80004d26:	8ff9                	and	a5,a5,a4
    80004d28:	2781                	sext.w	a5,a5
    80004d2a:	ebc1                	bnez	a5,80004dba <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004d2c:	fe842783          	lw	a5,-24(s0)
    80004d30:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d34:	01d7571b          	srliw	a4,a4,0x1d
    80004d38:	9fb9                	addw	a5,a5,a4
    80004d3a:	4037d79b          	sraiw	a5,a5,0x3
    80004d3e:	2781                	sext.w	a5,a5
    80004d40:	fe043703          	ld	a4,-32(s0)
    80004d44:	973e                	add	a4,a4,a5
    80004d46:	05874703          	lbu	a4,88(a4)
    80004d4a:	0187169b          	slliw	a3,a4,0x18
    80004d4e:	4186d69b          	sraiw	a3,a3,0x18
    80004d52:	fdc42703          	lw	a4,-36(s0)
    80004d56:	0187171b          	slliw	a4,a4,0x18
    80004d5a:	4187571b          	sraiw	a4,a4,0x18
    80004d5e:	8f55                	or	a4,a4,a3
    80004d60:	0187171b          	slliw	a4,a4,0x18
    80004d64:	4187571b          	sraiw	a4,a4,0x18
    80004d68:	0ff77713          	andi	a4,a4,255
    80004d6c:	fe043683          	ld	a3,-32(s0)
    80004d70:	97b6                	add	a5,a5,a3
    80004d72:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004d76:	fe043503          	ld	a0,-32(s0)
    80004d7a:	00002097          	auipc	ra,0x2
    80004d7e:	916080e7          	jalr	-1770(ra) # 80006690 <log_write>
        brelse(bp);
    80004d82:	fe043503          	ld	a0,-32(s0)
    80004d86:	00000097          	auipc	ra,0x0
    80004d8a:	c58080e7          	jalr	-936(ra) # 800049de <brelse>
        bzero(dev, b + bi);
    80004d8e:	fcc42683          	lw	a3,-52(s0)
    80004d92:	fec42703          	lw	a4,-20(s0)
    80004d96:	fe842783          	lw	a5,-24(s0)
    80004d9a:	9fb9                	addw	a5,a5,a4
    80004d9c:	2781                	sext.w	a5,a5
    80004d9e:	85be                	mv	a1,a5
    80004da0:	8536                	mv	a0,a3
    80004da2:	00000097          	auipc	ra,0x0
    80004da6:	e7c080e7          	jalr	-388(ra) # 80004c1e <bzero>
        return b + bi;
    80004daa:	fec42703          	lw	a4,-20(s0)
    80004dae:	fe842783          	lw	a5,-24(s0)
    80004db2:	9fb9                	addw	a5,a5,a4
    80004db4:	2781                	sext.w	a5,a5
    80004db6:	2781                	sext.w	a5,a5
    80004db8:	a895                	j	80004e2c <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004dba:	fe842783          	lw	a5,-24(s0)
    80004dbe:	2785                	addiw	a5,a5,1
    80004dc0:	fef42423          	sw	a5,-24(s0)
    80004dc4:	fe842783          	lw	a5,-24(s0)
    80004dc8:	0007871b          	sext.w	a4,a5
    80004dcc:	6789                	lui	a5,0x2
    80004dce:	02f75163          	bge	a4,a5,80004df0 <balloc+0x16a>
    80004dd2:	fec42703          	lw	a4,-20(s0)
    80004dd6:	fe842783          	lw	a5,-24(s0)
    80004dda:	9fb9                	addw	a5,a5,a4
    80004ddc:	2781                	sext.w	a5,a5
    80004dde:	0007871b          	sext.w	a4,a5
    80004de2:	0001e797          	auipc	a5,0x1e
    80004de6:	35e78793          	addi	a5,a5,862 # 80023140 <sb>
    80004dea:	43dc                	lw	a5,4(a5)
    80004dec:	eef76ae3          	bltu	a4,a5,80004ce0 <balloc+0x5a>
      }
    }
    brelse(bp);
    80004df0:	fe043503          	ld	a0,-32(s0)
    80004df4:	00000097          	auipc	ra,0x0
    80004df8:	bea080e7          	jalr	-1046(ra) # 800049de <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004dfc:	fec42703          	lw	a4,-20(s0)
    80004e00:	6789                	lui	a5,0x2
    80004e02:	9fb9                	addw	a5,a5,a4
    80004e04:	fef42623          	sw	a5,-20(s0)
    80004e08:	0001e797          	auipc	a5,0x1e
    80004e0c:	33878793          	addi	a5,a5,824 # 80023140 <sb>
    80004e10:	43d8                	lw	a4,4(a5)
    80004e12:	fec42783          	lw	a5,-20(s0)
    80004e16:	e8e7e4e3          	bltu	a5,a4,80004c9e <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004e1a:	00007517          	auipc	a0,0x7
    80004e1e:	66650513          	addi	a0,a0,1638 # 8000c480 <etext+0x480>
    80004e22:	ffffc097          	auipc	ra,0xffffc
    80004e26:	c14080e7          	jalr	-1004(ra) # 80000a36 <printf>
  return 0;
    80004e2a:	4781                	li	a5,0
}
    80004e2c:	853e                	mv	a0,a5
    80004e2e:	70e2                	ld	ra,56(sp)
    80004e30:	7442                	ld	s0,48(sp)
    80004e32:	6121                	addi	sp,sp,64
    80004e34:	8082                	ret

0000000080004e36 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004e36:	7179                	addi	sp,sp,-48
    80004e38:	f406                	sd	ra,40(sp)
    80004e3a:	f022                	sd	s0,32(sp)
    80004e3c:	1800                	addi	s0,sp,48
    80004e3e:	87aa                	mv	a5,a0
    80004e40:	872e                	mv	a4,a1
    80004e42:	fcf42e23          	sw	a5,-36(s0)
    80004e46:	87ba                	mv	a5,a4
    80004e48:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004e4c:	fdc42683          	lw	a3,-36(s0)
    80004e50:	fd842783          	lw	a5,-40(s0)
    80004e54:	00d7d79b          	srliw	a5,a5,0xd
    80004e58:	0007871b          	sext.w	a4,a5
    80004e5c:	0001e797          	auipc	a5,0x1e
    80004e60:	2e478793          	addi	a5,a5,740 # 80023140 <sb>
    80004e64:	4fdc                	lw	a5,28(a5)
    80004e66:	9fb9                	addw	a5,a5,a4
    80004e68:	2781                	sext.w	a5,a5
    80004e6a:	85be                	mv	a1,a5
    80004e6c:	8536                	mv	a0,a3
    80004e6e:	00000097          	auipc	ra,0x0
    80004e72:	ac6080e7          	jalr	-1338(ra) # 80004934 <bread>
    80004e76:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004e7a:	fd842703          	lw	a4,-40(s0)
    80004e7e:	6789                	lui	a5,0x2
    80004e80:	17fd                	addi	a5,a5,-1
    80004e82:	8ff9                	and	a5,a5,a4
    80004e84:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004e88:	fe442703          	lw	a4,-28(s0)
    80004e8c:	41f7579b          	sraiw	a5,a4,0x1f
    80004e90:	01d7d79b          	srliw	a5,a5,0x1d
    80004e94:	9f3d                	addw	a4,a4,a5
    80004e96:	8b1d                	andi	a4,a4,7
    80004e98:	40f707bb          	subw	a5,a4,a5
    80004e9c:	2781                	sext.w	a5,a5
    80004e9e:	4705                	li	a4,1
    80004ea0:	00f717bb          	sllw	a5,a4,a5
    80004ea4:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004ea8:	fe442783          	lw	a5,-28(s0)
    80004eac:	41f7d71b          	sraiw	a4,a5,0x1f
    80004eb0:	01d7571b          	srliw	a4,a4,0x1d
    80004eb4:	9fb9                	addw	a5,a5,a4
    80004eb6:	4037d79b          	sraiw	a5,a5,0x3
    80004eba:	2781                	sext.w	a5,a5
    80004ebc:	fe843703          	ld	a4,-24(s0)
    80004ec0:	97ba                	add	a5,a5,a4
    80004ec2:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004ec6:	0007871b          	sext.w	a4,a5
    80004eca:	fe042783          	lw	a5,-32(s0)
    80004ece:	8ff9                	and	a5,a5,a4
    80004ed0:	2781                	sext.w	a5,a5
    80004ed2:	eb89                	bnez	a5,80004ee4 <bfree+0xae>
    panic("freeing free block");
    80004ed4:	00007517          	auipc	a0,0x7
    80004ed8:	5c450513          	addi	a0,a0,1476 # 8000c498 <etext+0x498>
    80004edc:	ffffc097          	auipc	ra,0xffffc
    80004ee0:	db0080e7          	jalr	-592(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    80004ee4:	fe442783          	lw	a5,-28(s0)
    80004ee8:	41f7d71b          	sraiw	a4,a5,0x1f
    80004eec:	01d7571b          	srliw	a4,a4,0x1d
    80004ef0:	9fb9                	addw	a5,a5,a4
    80004ef2:	4037d79b          	sraiw	a5,a5,0x3
    80004ef6:	2781                	sext.w	a5,a5
    80004ef8:	fe843703          	ld	a4,-24(s0)
    80004efc:	973e                	add	a4,a4,a5
    80004efe:	05874703          	lbu	a4,88(a4)
    80004f02:	0187169b          	slliw	a3,a4,0x18
    80004f06:	4186d69b          	sraiw	a3,a3,0x18
    80004f0a:	fe042703          	lw	a4,-32(s0)
    80004f0e:	0187171b          	slliw	a4,a4,0x18
    80004f12:	4187571b          	sraiw	a4,a4,0x18
    80004f16:	fff74713          	not	a4,a4
    80004f1a:	0187171b          	slliw	a4,a4,0x18
    80004f1e:	4187571b          	sraiw	a4,a4,0x18
    80004f22:	8f75                	and	a4,a4,a3
    80004f24:	0187171b          	slliw	a4,a4,0x18
    80004f28:	4187571b          	sraiw	a4,a4,0x18
    80004f2c:	0ff77713          	andi	a4,a4,255
    80004f30:	fe843683          	ld	a3,-24(s0)
    80004f34:	97b6                	add	a5,a5,a3
    80004f36:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004f3a:	fe843503          	ld	a0,-24(s0)
    80004f3e:	00001097          	auipc	ra,0x1
    80004f42:	752080e7          	jalr	1874(ra) # 80006690 <log_write>
  brelse(bp);
    80004f46:	fe843503          	ld	a0,-24(s0)
    80004f4a:	00000097          	auipc	ra,0x0
    80004f4e:	a94080e7          	jalr	-1388(ra) # 800049de <brelse>
}
    80004f52:	0001                	nop
    80004f54:	70a2                	ld	ra,40(sp)
    80004f56:	7402                	ld	s0,32(sp)
    80004f58:	6145                	addi	sp,sp,48
    80004f5a:	8082                	ret

0000000080004f5c <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004f5c:	1101                	addi	sp,sp,-32
    80004f5e:	ec06                	sd	ra,24(sp)
    80004f60:	e822                	sd	s0,16(sp)
    80004f62:	1000                	addi	s0,sp,32
  int i = 0;
    80004f64:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004f68:	00007597          	auipc	a1,0x7
    80004f6c:	54858593          	addi	a1,a1,1352 # 8000c4b0 <etext+0x4b0>
    80004f70:	0001e517          	auipc	a0,0x1e
    80004f74:	1f050513          	addi	a0,a0,496 # 80023160 <itable>
    80004f78:	ffffc097          	auipc	ra,0xffffc
    80004f7c:	394080e7          	jalr	916(ra) # 8000130c <initlock>
  for(i = 0; i < NINODE; i++) {
    80004f80:	fe042623          	sw	zero,-20(s0)
    80004f84:	a82d                	j	80004fbe <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004f86:	fec42703          	lw	a4,-20(s0)
    80004f8a:	87ba                	mv	a5,a4
    80004f8c:	0792                	slli	a5,a5,0x4
    80004f8e:	97ba                	add	a5,a5,a4
    80004f90:	078e                	slli	a5,a5,0x3
    80004f92:	02078713          	addi	a4,a5,32
    80004f96:	0001e797          	auipc	a5,0x1e
    80004f9a:	1ca78793          	addi	a5,a5,458 # 80023160 <itable>
    80004f9e:	97ba                	add	a5,a5,a4
    80004fa0:	07a1                	addi	a5,a5,8
    80004fa2:	00007597          	auipc	a1,0x7
    80004fa6:	51658593          	addi	a1,a1,1302 # 8000c4b8 <etext+0x4b8>
    80004faa:	853e                	mv	a0,a5
    80004fac:	00002097          	auipc	ra,0x2
    80004fb0:	818080e7          	jalr	-2024(ra) # 800067c4 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004fb4:	fec42783          	lw	a5,-20(s0)
    80004fb8:	2785                	addiw	a5,a5,1
    80004fba:	fef42623          	sw	a5,-20(s0)
    80004fbe:	fec42783          	lw	a5,-20(s0)
    80004fc2:	0007871b          	sext.w	a4,a5
    80004fc6:	03100793          	li	a5,49
    80004fca:	fae7dee3          	bge	a5,a4,80004f86 <iinit+0x2a>
  }
}
    80004fce:	0001                	nop
    80004fd0:	0001                	nop
    80004fd2:	60e2                	ld	ra,24(sp)
    80004fd4:	6442                	ld	s0,16(sp)
    80004fd6:	6105                	addi	sp,sp,32
    80004fd8:	8082                	ret

0000000080004fda <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004fda:	7139                	addi	sp,sp,-64
    80004fdc:	fc06                	sd	ra,56(sp)
    80004fde:	f822                	sd	s0,48(sp)
    80004fe0:	0080                	addi	s0,sp,64
    80004fe2:	87aa                	mv	a5,a0
    80004fe4:	872e                	mv	a4,a1
    80004fe6:	fcf42623          	sw	a5,-52(s0)
    80004fea:	87ba                	mv	a5,a4
    80004fec:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004ff0:	4785                	li	a5,1
    80004ff2:	fef42623          	sw	a5,-20(s0)
    80004ff6:	a855                	j	800050aa <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004ff8:	fec42783          	lw	a5,-20(s0)
    80004ffc:	8391                	srli	a5,a5,0x4
    80004ffe:	0007871b          	sext.w	a4,a5
    80005002:	0001e797          	auipc	a5,0x1e
    80005006:	13e78793          	addi	a5,a5,318 # 80023140 <sb>
    8000500a:	4f9c                	lw	a5,24(a5)
    8000500c:	9fb9                	addw	a5,a5,a4
    8000500e:	0007871b          	sext.w	a4,a5
    80005012:	fcc42783          	lw	a5,-52(s0)
    80005016:	85ba                	mv	a1,a4
    80005018:	853e                	mv	a0,a5
    8000501a:	00000097          	auipc	ra,0x0
    8000501e:	91a080e7          	jalr	-1766(ra) # 80004934 <bread>
    80005022:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80005026:	fe043783          	ld	a5,-32(s0)
    8000502a:	05878713          	addi	a4,a5,88
    8000502e:	fec42783          	lw	a5,-20(s0)
    80005032:	8bbd                	andi	a5,a5,15
    80005034:	079a                	slli	a5,a5,0x6
    80005036:	97ba                	add	a5,a5,a4
    80005038:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    8000503c:	fd843783          	ld	a5,-40(s0)
    80005040:	00079783          	lh	a5,0(a5)
    80005044:	eba1                	bnez	a5,80005094 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80005046:	04000613          	li	a2,64
    8000504a:	4581                	li	a1,0
    8000504c:	fd843503          	ld	a0,-40(s0)
    80005050:	ffffc097          	auipc	ra,0xffffc
    80005054:	4c0080e7          	jalr	1216(ra) # 80001510 <memset>
      dip->type = type;
    80005058:	fd843783          	ld	a5,-40(s0)
    8000505c:	fca45703          	lhu	a4,-54(s0)
    80005060:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005064:	fe043503          	ld	a0,-32(s0)
    80005068:	00001097          	auipc	ra,0x1
    8000506c:	628080e7          	jalr	1576(ra) # 80006690 <log_write>
      brelse(bp);
    80005070:	fe043503          	ld	a0,-32(s0)
    80005074:	00000097          	auipc	ra,0x0
    80005078:	96a080e7          	jalr	-1686(ra) # 800049de <brelse>
      return iget(dev, inum);
    8000507c:	fec42703          	lw	a4,-20(s0)
    80005080:	fcc42783          	lw	a5,-52(s0)
    80005084:	85ba                	mv	a1,a4
    80005086:	853e                	mv	a0,a5
    80005088:	00000097          	auipc	ra,0x0
    8000508c:	138080e7          	jalr	312(ra) # 800051c0 <iget>
    80005090:	87aa                	mv	a5,a0
    80005092:	a835                	j	800050ce <ialloc+0xf4>
    }
    brelse(bp);
    80005094:	fe043503          	ld	a0,-32(s0)
    80005098:	00000097          	auipc	ra,0x0
    8000509c:	946080e7          	jalr	-1722(ra) # 800049de <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    800050a0:	fec42783          	lw	a5,-20(s0)
    800050a4:	2785                	addiw	a5,a5,1
    800050a6:	fef42623          	sw	a5,-20(s0)
    800050aa:	0001e797          	auipc	a5,0x1e
    800050ae:	09678793          	addi	a5,a5,150 # 80023140 <sb>
    800050b2:	47d8                	lw	a4,12(a5)
    800050b4:	fec42783          	lw	a5,-20(s0)
    800050b8:	f4e7e0e3          	bltu	a5,a4,80004ff8 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    800050bc:	00007517          	auipc	a0,0x7
    800050c0:	40450513          	addi	a0,a0,1028 # 8000c4c0 <etext+0x4c0>
    800050c4:	ffffc097          	auipc	ra,0xffffc
    800050c8:	972080e7          	jalr	-1678(ra) # 80000a36 <printf>
  return 0;
    800050cc:	4781                	li	a5,0
}
    800050ce:	853e                	mv	a0,a5
    800050d0:	70e2                	ld	ra,56(sp)
    800050d2:	7442                	ld	s0,48(sp)
    800050d4:	6121                	addi	sp,sp,64
    800050d6:	8082                	ret

00000000800050d8 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    800050d8:	7179                	addi	sp,sp,-48
    800050da:	f406                	sd	ra,40(sp)
    800050dc:	f022                	sd	s0,32(sp)
    800050de:	1800                	addi	s0,sp,48
    800050e0:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800050e4:	fd843783          	ld	a5,-40(s0)
    800050e8:	4394                	lw	a3,0(a5)
    800050ea:	fd843783          	ld	a5,-40(s0)
    800050ee:	43dc                	lw	a5,4(a5)
    800050f0:	0047d79b          	srliw	a5,a5,0x4
    800050f4:	0007871b          	sext.w	a4,a5
    800050f8:	0001e797          	auipc	a5,0x1e
    800050fc:	04878793          	addi	a5,a5,72 # 80023140 <sb>
    80005100:	4f9c                	lw	a5,24(a5)
    80005102:	9fb9                	addw	a5,a5,a4
    80005104:	2781                	sext.w	a5,a5
    80005106:	85be                	mv	a1,a5
    80005108:	8536                	mv	a0,a3
    8000510a:	00000097          	auipc	ra,0x0
    8000510e:	82a080e7          	jalr	-2006(ra) # 80004934 <bread>
    80005112:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005116:	fe843783          	ld	a5,-24(s0)
    8000511a:	05878713          	addi	a4,a5,88
    8000511e:	fd843783          	ld	a5,-40(s0)
    80005122:	43dc                	lw	a5,4(a5)
    80005124:	1782                	slli	a5,a5,0x20
    80005126:	9381                	srli	a5,a5,0x20
    80005128:	8bbd                	andi	a5,a5,15
    8000512a:	079a                	slli	a5,a5,0x6
    8000512c:	97ba                	add	a5,a5,a4
    8000512e:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    80005132:	fd843783          	ld	a5,-40(s0)
    80005136:	04479703          	lh	a4,68(a5)
    8000513a:	fe043783          	ld	a5,-32(s0)
    8000513e:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80005142:	fd843783          	ld	a5,-40(s0)
    80005146:	04679703          	lh	a4,70(a5)
    8000514a:	fe043783          	ld	a5,-32(s0)
    8000514e:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80005152:	fd843783          	ld	a5,-40(s0)
    80005156:	04879703          	lh	a4,72(a5)
    8000515a:	fe043783          	ld	a5,-32(s0)
    8000515e:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80005162:	fd843783          	ld	a5,-40(s0)
    80005166:	04a79703          	lh	a4,74(a5)
    8000516a:	fe043783          	ld	a5,-32(s0)
    8000516e:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80005172:	fd843783          	ld	a5,-40(s0)
    80005176:	47f8                	lw	a4,76(a5)
    80005178:	fe043783          	ld	a5,-32(s0)
    8000517c:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    8000517e:	fe043783          	ld	a5,-32(s0)
    80005182:	00c78713          	addi	a4,a5,12
    80005186:	fd843783          	ld	a5,-40(s0)
    8000518a:	05078793          	addi	a5,a5,80
    8000518e:	03400613          	li	a2,52
    80005192:	85be                	mv	a1,a5
    80005194:	853a                	mv	a0,a4
    80005196:	ffffc097          	auipc	ra,0xffffc
    8000519a:	45e080e7          	jalr	1118(ra) # 800015f4 <memmove>
  log_write(bp);
    8000519e:	fe843503          	ld	a0,-24(s0)
    800051a2:	00001097          	auipc	ra,0x1
    800051a6:	4ee080e7          	jalr	1262(ra) # 80006690 <log_write>
  brelse(bp);
    800051aa:	fe843503          	ld	a0,-24(s0)
    800051ae:	00000097          	auipc	ra,0x0
    800051b2:	830080e7          	jalr	-2000(ra) # 800049de <brelse>
}
    800051b6:	0001                	nop
    800051b8:	70a2                	ld	ra,40(sp)
    800051ba:	7402                	ld	s0,32(sp)
    800051bc:	6145                	addi	sp,sp,48
    800051be:	8082                	ret

00000000800051c0 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    800051c0:	7179                	addi	sp,sp,-48
    800051c2:	f406                	sd	ra,40(sp)
    800051c4:	f022                	sd	s0,32(sp)
    800051c6:	1800                	addi	s0,sp,48
    800051c8:	87aa                	mv	a5,a0
    800051ca:	872e                	mv	a4,a1
    800051cc:	fcf42e23          	sw	a5,-36(s0)
    800051d0:	87ba                	mv	a5,a4
    800051d2:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    800051d6:	0001e517          	auipc	a0,0x1e
    800051da:	f8a50513          	addi	a0,a0,-118 # 80023160 <itable>
    800051de:	ffffc097          	auipc	ra,0xffffc
    800051e2:	15e080e7          	jalr	350(ra) # 8000133c <acquire>

  // Is the inode already in the table?
  empty = 0;
    800051e6:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800051ea:	0001e797          	auipc	a5,0x1e
    800051ee:	f8e78793          	addi	a5,a5,-114 # 80023178 <itable+0x18>
    800051f2:	fef43423          	sd	a5,-24(s0)
    800051f6:	a89d                	j	8000526c <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800051f8:	fe843783          	ld	a5,-24(s0)
    800051fc:	479c                	lw	a5,8(a5)
    800051fe:	04f05663          	blez	a5,8000524a <iget+0x8a>
    80005202:	fe843783          	ld	a5,-24(s0)
    80005206:	4398                	lw	a4,0(a5)
    80005208:	fdc42783          	lw	a5,-36(s0)
    8000520c:	2781                	sext.w	a5,a5
    8000520e:	02e79e63          	bne	a5,a4,8000524a <iget+0x8a>
    80005212:	fe843783          	ld	a5,-24(s0)
    80005216:	43d8                	lw	a4,4(a5)
    80005218:	fd842783          	lw	a5,-40(s0)
    8000521c:	2781                	sext.w	a5,a5
    8000521e:	02e79663          	bne	a5,a4,8000524a <iget+0x8a>
      ip->ref++;
    80005222:	fe843783          	ld	a5,-24(s0)
    80005226:	479c                	lw	a5,8(a5)
    80005228:	2785                	addiw	a5,a5,1
    8000522a:	0007871b          	sext.w	a4,a5
    8000522e:	fe843783          	ld	a5,-24(s0)
    80005232:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    80005234:	0001e517          	auipc	a0,0x1e
    80005238:	f2c50513          	addi	a0,a0,-212 # 80023160 <itable>
    8000523c:	ffffc097          	auipc	ra,0xffffc
    80005240:	164080e7          	jalr	356(ra) # 800013a0 <release>
      return ip;
    80005244:	fe843783          	ld	a5,-24(s0)
    80005248:	a069                	j	800052d2 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    8000524a:	fe043783          	ld	a5,-32(s0)
    8000524e:	eb89                	bnez	a5,80005260 <iget+0xa0>
    80005250:	fe843783          	ld	a5,-24(s0)
    80005254:	479c                	lw	a5,8(a5)
    80005256:	e789                	bnez	a5,80005260 <iget+0xa0>
      empty = ip;
    80005258:	fe843783          	ld	a5,-24(s0)
    8000525c:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005260:	fe843783          	ld	a5,-24(s0)
    80005264:	08878793          	addi	a5,a5,136
    80005268:	fef43423          	sd	a5,-24(s0)
    8000526c:	fe843703          	ld	a4,-24(s0)
    80005270:	00020797          	auipc	a5,0x20
    80005274:	99878793          	addi	a5,a5,-1640 # 80024c08 <log>
    80005278:	f8f760e3          	bltu	a4,a5,800051f8 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    8000527c:	fe043783          	ld	a5,-32(s0)
    80005280:	eb89                	bnez	a5,80005292 <iget+0xd2>
    panic("iget: no inodes");
    80005282:	00007517          	auipc	a0,0x7
    80005286:	25650513          	addi	a0,a0,598 # 8000c4d8 <etext+0x4d8>
    8000528a:	ffffc097          	auipc	ra,0xffffc
    8000528e:	a02080e7          	jalr	-1534(ra) # 80000c8c <panic>

  ip = empty;
    80005292:	fe043783          	ld	a5,-32(s0)
    80005296:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    8000529a:	fe843783          	ld	a5,-24(s0)
    8000529e:	fdc42703          	lw	a4,-36(s0)
    800052a2:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    800052a4:	fe843783          	ld	a5,-24(s0)
    800052a8:	fd842703          	lw	a4,-40(s0)
    800052ac:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    800052ae:	fe843783          	ld	a5,-24(s0)
    800052b2:	4705                	li	a4,1
    800052b4:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    800052b6:	fe843783          	ld	a5,-24(s0)
    800052ba:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    800052be:	0001e517          	auipc	a0,0x1e
    800052c2:	ea250513          	addi	a0,a0,-350 # 80023160 <itable>
    800052c6:	ffffc097          	auipc	ra,0xffffc
    800052ca:	0da080e7          	jalr	218(ra) # 800013a0 <release>

  return ip;
    800052ce:	fe843783          	ld	a5,-24(s0)
}
    800052d2:	853e                	mv	a0,a5
    800052d4:	70a2                	ld	ra,40(sp)
    800052d6:	7402                	ld	s0,32(sp)
    800052d8:	6145                	addi	sp,sp,48
    800052da:	8082                	ret

00000000800052dc <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800052dc:	1101                	addi	sp,sp,-32
    800052de:	ec06                	sd	ra,24(sp)
    800052e0:	e822                	sd	s0,16(sp)
    800052e2:	1000                	addi	s0,sp,32
    800052e4:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800052e8:	0001e517          	auipc	a0,0x1e
    800052ec:	e7850513          	addi	a0,a0,-392 # 80023160 <itable>
    800052f0:	ffffc097          	auipc	ra,0xffffc
    800052f4:	04c080e7          	jalr	76(ra) # 8000133c <acquire>
  ip->ref++;
    800052f8:	fe843783          	ld	a5,-24(s0)
    800052fc:	479c                	lw	a5,8(a5)
    800052fe:	2785                	addiw	a5,a5,1
    80005300:	0007871b          	sext.w	a4,a5
    80005304:	fe843783          	ld	a5,-24(s0)
    80005308:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000530a:	0001e517          	auipc	a0,0x1e
    8000530e:	e5650513          	addi	a0,a0,-426 # 80023160 <itable>
    80005312:	ffffc097          	auipc	ra,0xffffc
    80005316:	08e080e7          	jalr	142(ra) # 800013a0 <release>
  return ip;
    8000531a:	fe843783          	ld	a5,-24(s0)
}
    8000531e:	853e                	mv	a0,a5
    80005320:	60e2                	ld	ra,24(sp)
    80005322:	6442                	ld	s0,16(sp)
    80005324:	6105                	addi	sp,sp,32
    80005326:	8082                	ret

0000000080005328 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005328:	7179                	addi	sp,sp,-48
    8000532a:	f406                	sd	ra,40(sp)
    8000532c:	f022                	sd	s0,32(sp)
    8000532e:	1800                	addi	s0,sp,48
    80005330:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    80005334:	fd843783          	ld	a5,-40(s0)
    80005338:	c791                	beqz	a5,80005344 <ilock+0x1c>
    8000533a:	fd843783          	ld	a5,-40(s0)
    8000533e:	479c                	lw	a5,8(a5)
    80005340:	00f04a63          	bgtz	a5,80005354 <ilock+0x2c>
    panic("ilock");
    80005344:	00007517          	auipc	a0,0x7
    80005348:	1a450513          	addi	a0,a0,420 # 8000c4e8 <etext+0x4e8>
    8000534c:	ffffc097          	auipc	ra,0xffffc
    80005350:	940080e7          	jalr	-1728(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    80005354:	fd843783          	ld	a5,-40(s0)
    80005358:	07c1                	addi	a5,a5,16
    8000535a:	853e                	mv	a0,a5
    8000535c:	00001097          	auipc	ra,0x1
    80005360:	4b4080e7          	jalr	1204(ra) # 80006810 <acquiresleep>

  if(ip->valid == 0){
    80005364:	fd843783          	ld	a5,-40(s0)
    80005368:	43bc                	lw	a5,64(a5)
    8000536a:	e7e5                	bnez	a5,80005452 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000536c:	fd843783          	ld	a5,-40(s0)
    80005370:	4394                	lw	a3,0(a5)
    80005372:	fd843783          	ld	a5,-40(s0)
    80005376:	43dc                	lw	a5,4(a5)
    80005378:	0047d79b          	srliw	a5,a5,0x4
    8000537c:	0007871b          	sext.w	a4,a5
    80005380:	0001e797          	auipc	a5,0x1e
    80005384:	dc078793          	addi	a5,a5,-576 # 80023140 <sb>
    80005388:	4f9c                	lw	a5,24(a5)
    8000538a:	9fb9                	addw	a5,a5,a4
    8000538c:	2781                	sext.w	a5,a5
    8000538e:	85be                	mv	a1,a5
    80005390:	8536                	mv	a0,a3
    80005392:	fffff097          	auipc	ra,0xfffff
    80005396:	5a2080e7          	jalr	1442(ra) # 80004934 <bread>
    8000539a:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000539e:	fe843783          	ld	a5,-24(s0)
    800053a2:	05878713          	addi	a4,a5,88
    800053a6:	fd843783          	ld	a5,-40(s0)
    800053aa:	43dc                	lw	a5,4(a5)
    800053ac:	1782                	slli	a5,a5,0x20
    800053ae:	9381                	srli	a5,a5,0x20
    800053b0:	8bbd                	andi	a5,a5,15
    800053b2:	079a                	slli	a5,a5,0x6
    800053b4:	97ba                	add	a5,a5,a4
    800053b6:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    800053ba:	fe043783          	ld	a5,-32(s0)
    800053be:	00079703          	lh	a4,0(a5)
    800053c2:	fd843783          	ld	a5,-40(s0)
    800053c6:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800053ca:	fe043783          	ld	a5,-32(s0)
    800053ce:	00279703          	lh	a4,2(a5)
    800053d2:	fd843783          	ld	a5,-40(s0)
    800053d6:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800053da:	fe043783          	ld	a5,-32(s0)
    800053de:	00479703          	lh	a4,4(a5)
    800053e2:	fd843783          	ld	a5,-40(s0)
    800053e6:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800053ea:	fe043783          	ld	a5,-32(s0)
    800053ee:	00679703          	lh	a4,6(a5)
    800053f2:	fd843783          	ld	a5,-40(s0)
    800053f6:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800053fa:	fe043783          	ld	a5,-32(s0)
    800053fe:	4798                	lw	a4,8(a5)
    80005400:	fd843783          	ld	a5,-40(s0)
    80005404:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    80005406:	fd843783          	ld	a5,-40(s0)
    8000540a:	05078713          	addi	a4,a5,80
    8000540e:	fe043783          	ld	a5,-32(s0)
    80005412:	07b1                	addi	a5,a5,12
    80005414:	03400613          	li	a2,52
    80005418:	85be                	mv	a1,a5
    8000541a:	853a                	mv	a0,a4
    8000541c:	ffffc097          	auipc	ra,0xffffc
    80005420:	1d8080e7          	jalr	472(ra) # 800015f4 <memmove>
    brelse(bp);
    80005424:	fe843503          	ld	a0,-24(s0)
    80005428:	fffff097          	auipc	ra,0xfffff
    8000542c:	5b6080e7          	jalr	1462(ra) # 800049de <brelse>
    ip->valid = 1;
    80005430:	fd843783          	ld	a5,-40(s0)
    80005434:	4705                	li	a4,1
    80005436:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005438:	fd843783          	ld	a5,-40(s0)
    8000543c:	04479783          	lh	a5,68(a5)
    80005440:	eb89                	bnez	a5,80005452 <ilock+0x12a>
      panic("ilock: no type");
    80005442:	00007517          	auipc	a0,0x7
    80005446:	0ae50513          	addi	a0,a0,174 # 8000c4f0 <etext+0x4f0>
    8000544a:	ffffc097          	auipc	ra,0xffffc
    8000544e:	842080e7          	jalr	-1982(ra) # 80000c8c <panic>
  }
}
    80005452:	0001                	nop
    80005454:	70a2                	ld	ra,40(sp)
    80005456:	7402                	ld	s0,32(sp)
    80005458:	6145                	addi	sp,sp,48
    8000545a:	8082                	ret

000000008000545c <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    8000545c:	1101                	addi	sp,sp,-32
    8000545e:	ec06                	sd	ra,24(sp)
    80005460:	e822                	sd	s0,16(sp)
    80005462:	1000                	addi	s0,sp,32
    80005464:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005468:	fe843783          	ld	a5,-24(s0)
    8000546c:	c385                	beqz	a5,8000548c <iunlock+0x30>
    8000546e:	fe843783          	ld	a5,-24(s0)
    80005472:	07c1                	addi	a5,a5,16
    80005474:	853e                	mv	a0,a5
    80005476:	00001097          	auipc	ra,0x1
    8000547a:	45a080e7          	jalr	1114(ra) # 800068d0 <holdingsleep>
    8000547e:	87aa                	mv	a5,a0
    80005480:	c791                	beqz	a5,8000548c <iunlock+0x30>
    80005482:	fe843783          	ld	a5,-24(s0)
    80005486:	479c                	lw	a5,8(a5)
    80005488:	00f04a63          	bgtz	a5,8000549c <iunlock+0x40>
    panic("iunlock");
    8000548c:	00007517          	auipc	a0,0x7
    80005490:	07450513          	addi	a0,a0,116 # 8000c500 <etext+0x500>
    80005494:	ffffb097          	auipc	ra,0xffffb
    80005498:	7f8080e7          	jalr	2040(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    8000549c:	fe843783          	ld	a5,-24(s0)
    800054a0:	07c1                	addi	a5,a5,16
    800054a2:	853e                	mv	a0,a5
    800054a4:	00001097          	auipc	ra,0x1
    800054a8:	3da080e7          	jalr	986(ra) # 8000687e <releasesleep>
}
    800054ac:	0001                	nop
    800054ae:	60e2                	ld	ra,24(sp)
    800054b0:	6442                	ld	s0,16(sp)
    800054b2:	6105                	addi	sp,sp,32
    800054b4:	8082                	ret

00000000800054b6 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    800054b6:	1101                	addi	sp,sp,-32
    800054b8:	ec06                	sd	ra,24(sp)
    800054ba:	e822                	sd	s0,16(sp)
    800054bc:	1000                	addi	s0,sp,32
    800054be:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800054c2:	0001e517          	auipc	a0,0x1e
    800054c6:	c9e50513          	addi	a0,a0,-866 # 80023160 <itable>
    800054ca:	ffffc097          	auipc	ra,0xffffc
    800054ce:	e72080e7          	jalr	-398(ra) # 8000133c <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800054d2:	fe843783          	ld	a5,-24(s0)
    800054d6:	479c                	lw	a5,8(a5)
    800054d8:	873e                	mv	a4,a5
    800054da:	4785                	li	a5,1
    800054dc:	06f71f63          	bne	a4,a5,8000555a <iput+0xa4>
    800054e0:	fe843783          	ld	a5,-24(s0)
    800054e4:	43bc                	lw	a5,64(a5)
    800054e6:	cbb5                	beqz	a5,8000555a <iput+0xa4>
    800054e8:	fe843783          	ld	a5,-24(s0)
    800054ec:	04a79783          	lh	a5,74(a5)
    800054f0:	e7ad                	bnez	a5,8000555a <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800054f2:	fe843783          	ld	a5,-24(s0)
    800054f6:	07c1                	addi	a5,a5,16
    800054f8:	853e                	mv	a0,a5
    800054fa:	00001097          	auipc	ra,0x1
    800054fe:	316080e7          	jalr	790(ra) # 80006810 <acquiresleep>

    release(&itable.lock);
    80005502:	0001e517          	auipc	a0,0x1e
    80005506:	c5e50513          	addi	a0,a0,-930 # 80023160 <itable>
    8000550a:	ffffc097          	auipc	ra,0xffffc
    8000550e:	e96080e7          	jalr	-362(ra) # 800013a0 <release>

    itrunc(ip);
    80005512:	fe843503          	ld	a0,-24(s0)
    80005516:	00000097          	auipc	ra,0x0
    8000551a:	21a080e7          	jalr	538(ra) # 80005730 <itrunc>
    ip->type = 0;
    8000551e:	fe843783          	ld	a5,-24(s0)
    80005522:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    80005526:	fe843503          	ld	a0,-24(s0)
    8000552a:	00000097          	auipc	ra,0x0
    8000552e:	bae080e7          	jalr	-1106(ra) # 800050d8 <iupdate>
    ip->valid = 0;
    80005532:	fe843783          	ld	a5,-24(s0)
    80005536:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    8000553a:	fe843783          	ld	a5,-24(s0)
    8000553e:	07c1                	addi	a5,a5,16
    80005540:	853e                	mv	a0,a5
    80005542:	00001097          	auipc	ra,0x1
    80005546:	33c080e7          	jalr	828(ra) # 8000687e <releasesleep>

    acquire(&itable.lock);
    8000554a:	0001e517          	auipc	a0,0x1e
    8000554e:	c1650513          	addi	a0,a0,-1002 # 80023160 <itable>
    80005552:	ffffc097          	auipc	ra,0xffffc
    80005556:	dea080e7          	jalr	-534(ra) # 8000133c <acquire>
  }

  ip->ref--;
    8000555a:	fe843783          	ld	a5,-24(s0)
    8000555e:	479c                	lw	a5,8(a5)
    80005560:	37fd                	addiw	a5,a5,-1
    80005562:	0007871b          	sext.w	a4,a5
    80005566:	fe843783          	ld	a5,-24(s0)
    8000556a:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000556c:	0001e517          	auipc	a0,0x1e
    80005570:	bf450513          	addi	a0,a0,-1036 # 80023160 <itable>
    80005574:	ffffc097          	auipc	ra,0xffffc
    80005578:	e2c080e7          	jalr	-468(ra) # 800013a0 <release>
}
    8000557c:	0001                	nop
    8000557e:	60e2                	ld	ra,24(sp)
    80005580:	6442                	ld	s0,16(sp)
    80005582:	6105                	addi	sp,sp,32
    80005584:	8082                	ret

0000000080005586 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005586:	1101                	addi	sp,sp,-32
    80005588:	ec06                	sd	ra,24(sp)
    8000558a:	e822                	sd	s0,16(sp)
    8000558c:	1000                	addi	s0,sp,32
    8000558e:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    80005592:	fe843503          	ld	a0,-24(s0)
    80005596:	00000097          	auipc	ra,0x0
    8000559a:	ec6080e7          	jalr	-314(ra) # 8000545c <iunlock>
  iput(ip);
    8000559e:	fe843503          	ld	a0,-24(s0)
    800055a2:	00000097          	auipc	ra,0x0
    800055a6:	f14080e7          	jalr	-236(ra) # 800054b6 <iput>
}
    800055aa:	0001                	nop
    800055ac:	60e2                	ld	ra,24(sp)
    800055ae:	6442                	ld	s0,16(sp)
    800055b0:	6105                	addi	sp,sp,32
    800055b2:	8082                	ret

00000000800055b4 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    800055b4:	7139                	addi	sp,sp,-64
    800055b6:	fc06                	sd	ra,56(sp)
    800055b8:	f822                	sd	s0,48(sp)
    800055ba:	0080                	addi	s0,sp,64
    800055bc:	fca43423          	sd	a0,-56(s0)
    800055c0:	87ae                	mv	a5,a1
    800055c2:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    800055c6:	fc442783          	lw	a5,-60(s0)
    800055ca:	0007871b          	sext.w	a4,a5
    800055ce:	47ad                	li	a5,11
    800055d0:	04e7ee63          	bltu	a5,a4,8000562c <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    800055d4:	fc843703          	ld	a4,-56(s0)
    800055d8:	fc446783          	lwu	a5,-60(s0)
    800055dc:	07d1                	addi	a5,a5,20
    800055de:	078a                	slli	a5,a5,0x2
    800055e0:	97ba                	add	a5,a5,a4
    800055e2:	439c                	lw	a5,0(a5)
    800055e4:	fef42623          	sw	a5,-20(s0)
    800055e8:	fec42783          	lw	a5,-20(s0)
    800055ec:	2781                	sext.w	a5,a5
    800055ee:	ef85                	bnez	a5,80005626 <bmap+0x72>
      addr = balloc(ip->dev);
    800055f0:	fc843783          	ld	a5,-56(s0)
    800055f4:	439c                	lw	a5,0(a5)
    800055f6:	853e                	mv	a0,a5
    800055f8:	fffff097          	auipc	ra,0xfffff
    800055fc:	68e080e7          	jalr	1678(ra) # 80004c86 <balloc>
    80005600:	87aa                	mv	a5,a0
    80005602:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005606:	fec42783          	lw	a5,-20(s0)
    8000560a:	2781                	sext.w	a5,a5
    8000560c:	e399                	bnez	a5,80005612 <bmap+0x5e>
        return 0;
    8000560e:	4781                	li	a5,0
    80005610:	aa19                	j	80005726 <bmap+0x172>
      ip->addrs[bn] = addr;
    80005612:	fc843703          	ld	a4,-56(s0)
    80005616:	fc446783          	lwu	a5,-60(s0)
    8000561a:	07d1                	addi	a5,a5,20
    8000561c:	078a                	slli	a5,a5,0x2
    8000561e:	97ba                	add	a5,a5,a4
    80005620:	fec42703          	lw	a4,-20(s0)
    80005624:	c398                	sw	a4,0(a5)
    }
    return addr;
    80005626:	fec42783          	lw	a5,-20(s0)
    8000562a:	a8f5                	j	80005726 <bmap+0x172>
  }
  bn -= NDIRECT;
    8000562c:	fc442783          	lw	a5,-60(s0)
    80005630:	37d1                	addiw	a5,a5,-12
    80005632:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    80005636:	fc442783          	lw	a5,-60(s0)
    8000563a:	0007871b          	sext.w	a4,a5
    8000563e:	0ff00793          	li	a5,255
    80005642:	0ce7ea63          	bltu	a5,a4,80005716 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    80005646:	fc843783          	ld	a5,-56(s0)
    8000564a:	0807a783          	lw	a5,128(a5)
    8000564e:	fef42623          	sw	a5,-20(s0)
    80005652:	fec42783          	lw	a5,-20(s0)
    80005656:	2781                	sext.w	a5,a5
    80005658:	eb85                	bnez	a5,80005688 <bmap+0xd4>
      addr = balloc(ip->dev);
    8000565a:	fc843783          	ld	a5,-56(s0)
    8000565e:	439c                	lw	a5,0(a5)
    80005660:	853e                	mv	a0,a5
    80005662:	fffff097          	auipc	ra,0xfffff
    80005666:	624080e7          	jalr	1572(ra) # 80004c86 <balloc>
    8000566a:	87aa                	mv	a5,a0
    8000566c:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005670:	fec42783          	lw	a5,-20(s0)
    80005674:	2781                	sext.w	a5,a5
    80005676:	e399                	bnez	a5,8000567c <bmap+0xc8>
        return 0;
    80005678:	4781                	li	a5,0
    8000567a:	a075                	j	80005726 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    8000567c:	fc843783          	ld	a5,-56(s0)
    80005680:	fec42703          	lw	a4,-20(s0)
    80005684:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005688:	fc843783          	ld	a5,-56(s0)
    8000568c:	439c                	lw	a5,0(a5)
    8000568e:	fec42703          	lw	a4,-20(s0)
    80005692:	85ba                	mv	a1,a4
    80005694:	853e                	mv	a0,a5
    80005696:	fffff097          	auipc	ra,0xfffff
    8000569a:	29e080e7          	jalr	670(ra) # 80004934 <bread>
    8000569e:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800056a2:	fe043783          	ld	a5,-32(s0)
    800056a6:	05878793          	addi	a5,a5,88
    800056aa:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    800056ae:	fc446783          	lwu	a5,-60(s0)
    800056b2:	078a                	slli	a5,a5,0x2
    800056b4:	fd843703          	ld	a4,-40(s0)
    800056b8:	97ba                	add	a5,a5,a4
    800056ba:	439c                	lw	a5,0(a5)
    800056bc:	fef42623          	sw	a5,-20(s0)
    800056c0:	fec42783          	lw	a5,-20(s0)
    800056c4:	2781                	sext.w	a5,a5
    800056c6:	ef9d                	bnez	a5,80005704 <bmap+0x150>
      addr = balloc(ip->dev);
    800056c8:	fc843783          	ld	a5,-56(s0)
    800056cc:	439c                	lw	a5,0(a5)
    800056ce:	853e                	mv	a0,a5
    800056d0:	fffff097          	auipc	ra,0xfffff
    800056d4:	5b6080e7          	jalr	1462(ra) # 80004c86 <balloc>
    800056d8:	87aa                	mv	a5,a0
    800056da:	fef42623          	sw	a5,-20(s0)
      if(addr){
    800056de:	fec42783          	lw	a5,-20(s0)
    800056e2:	2781                	sext.w	a5,a5
    800056e4:	c385                	beqz	a5,80005704 <bmap+0x150>
        a[bn] = addr;
    800056e6:	fc446783          	lwu	a5,-60(s0)
    800056ea:	078a                	slli	a5,a5,0x2
    800056ec:	fd843703          	ld	a4,-40(s0)
    800056f0:	97ba                	add	a5,a5,a4
    800056f2:	fec42703          	lw	a4,-20(s0)
    800056f6:	c398                	sw	a4,0(a5)
        log_write(bp);
    800056f8:	fe043503          	ld	a0,-32(s0)
    800056fc:	00001097          	auipc	ra,0x1
    80005700:	f94080e7          	jalr	-108(ra) # 80006690 <log_write>
      }
    }
    brelse(bp);
    80005704:	fe043503          	ld	a0,-32(s0)
    80005708:	fffff097          	auipc	ra,0xfffff
    8000570c:	2d6080e7          	jalr	726(ra) # 800049de <brelse>
    return addr;
    80005710:	fec42783          	lw	a5,-20(s0)
    80005714:	a809                	j	80005726 <bmap+0x172>
  }

  panic("bmap: out of range");
    80005716:	00007517          	auipc	a0,0x7
    8000571a:	df250513          	addi	a0,a0,-526 # 8000c508 <etext+0x508>
    8000571e:	ffffb097          	auipc	ra,0xffffb
    80005722:	56e080e7          	jalr	1390(ra) # 80000c8c <panic>
}
    80005726:	853e                	mv	a0,a5
    80005728:	70e2                	ld	ra,56(sp)
    8000572a:	7442                	ld	s0,48(sp)
    8000572c:	6121                	addi	sp,sp,64
    8000572e:	8082                	ret

0000000080005730 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005730:	7139                	addi	sp,sp,-64
    80005732:	fc06                	sd	ra,56(sp)
    80005734:	f822                	sd	s0,48(sp)
    80005736:	0080                	addi	s0,sp,64
    80005738:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    8000573c:	fe042623          	sw	zero,-20(s0)
    80005740:	a899                	j	80005796 <itrunc+0x66>
    if(ip->addrs[i]){
    80005742:	fc843703          	ld	a4,-56(s0)
    80005746:	fec42783          	lw	a5,-20(s0)
    8000574a:	07d1                	addi	a5,a5,20
    8000574c:	078a                	slli	a5,a5,0x2
    8000574e:	97ba                	add	a5,a5,a4
    80005750:	439c                	lw	a5,0(a5)
    80005752:	cf8d                	beqz	a5,8000578c <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005754:	fc843783          	ld	a5,-56(s0)
    80005758:	439c                	lw	a5,0(a5)
    8000575a:	0007869b          	sext.w	a3,a5
    8000575e:	fc843703          	ld	a4,-56(s0)
    80005762:	fec42783          	lw	a5,-20(s0)
    80005766:	07d1                	addi	a5,a5,20
    80005768:	078a                	slli	a5,a5,0x2
    8000576a:	97ba                	add	a5,a5,a4
    8000576c:	439c                	lw	a5,0(a5)
    8000576e:	85be                	mv	a1,a5
    80005770:	8536                	mv	a0,a3
    80005772:	fffff097          	auipc	ra,0xfffff
    80005776:	6c4080e7          	jalr	1732(ra) # 80004e36 <bfree>
      ip->addrs[i] = 0;
    8000577a:	fc843703          	ld	a4,-56(s0)
    8000577e:	fec42783          	lw	a5,-20(s0)
    80005782:	07d1                	addi	a5,a5,20
    80005784:	078a                	slli	a5,a5,0x2
    80005786:	97ba                	add	a5,a5,a4
    80005788:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    8000578c:	fec42783          	lw	a5,-20(s0)
    80005790:	2785                	addiw	a5,a5,1
    80005792:	fef42623          	sw	a5,-20(s0)
    80005796:	fec42783          	lw	a5,-20(s0)
    8000579a:	0007871b          	sext.w	a4,a5
    8000579e:	47ad                	li	a5,11
    800057a0:	fae7d1e3          	bge	a5,a4,80005742 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    800057a4:	fc843783          	ld	a5,-56(s0)
    800057a8:	0807a783          	lw	a5,128(a5)
    800057ac:	cbc5                	beqz	a5,8000585c <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    800057ae:	fc843783          	ld	a5,-56(s0)
    800057b2:	4398                	lw	a4,0(a5)
    800057b4:	fc843783          	ld	a5,-56(s0)
    800057b8:	0807a783          	lw	a5,128(a5)
    800057bc:	85be                	mv	a1,a5
    800057be:	853a                	mv	a0,a4
    800057c0:	fffff097          	auipc	ra,0xfffff
    800057c4:	174080e7          	jalr	372(ra) # 80004934 <bread>
    800057c8:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800057cc:	fe043783          	ld	a5,-32(s0)
    800057d0:	05878793          	addi	a5,a5,88
    800057d4:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    800057d8:	fe042423          	sw	zero,-24(s0)
    800057dc:	a081                	j	8000581c <itrunc+0xec>
      if(a[j])
    800057de:	fe842783          	lw	a5,-24(s0)
    800057e2:	078a                	slli	a5,a5,0x2
    800057e4:	fd843703          	ld	a4,-40(s0)
    800057e8:	97ba                	add	a5,a5,a4
    800057ea:	439c                	lw	a5,0(a5)
    800057ec:	c39d                	beqz	a5,80005812 <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800057ee:	fc843783          	ld	a5,-56(s0)
    800057f2:	439c                	lw	a5,0(a5)
    800057f4:	0007869b          	sext.w	a3,a5
    800057f8:	fe842783          	lw	a5,-24(s0)
    800057fc:	078a                	slli	a5,a5,0x2
    800057fe:	fd843703          	ld	a4,-40(s0)
    80005802:	97ba                	add	a5,a5,a4
    80005804:	439c                	lw	a5,0(a5)
    80005806:	85be                	mv	a1,a5
    80005808:	8536                	mv	a0,a3
    8000580a:	fffff097          	auipc	ra,0xfffff
    8000580e:	62c080e7          	jalr	1580(ra) # 80004e36 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    80005812:	fe842783          	lw	a5,-24(s0)
    80005816:	2785                	addiw	a5,a5,1
    80005818:	fef42423          	sw	a5,-24(s0)
    8000581c:	fe842783          	lw	a5,-24(s0)
    80005820:	873e                	mv	a4,a5
    80005822:	0ff00793          	li	a5,255
    80005826:	fae7fce3          	bgeu	a5,a4,800057de <itrunc+0xae>
    }
    brelse(bp);
    8000582a:	fe043503          	ld	a0,-32(s0)
    8000582e:	fffff097          	auipc	ra,0xfffff
    80005832:	1b0080e7          	jalr	432(ra) # 800049de <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    80005836:	fc843783          	ld	a5,-56(s0)
    8000583a:	439c                	lw	a5,0(a5)
    8000583c:	0007871b          	sext.w	a4,a5
    80005840:	fc843783          	ld	a5,-56(s0)
    80005844:	0807a783          	lw	a5,128(a5)
    80005848:	85be                	mv	a1,a5
    8000584a:	853a                	mv	a0,a4
    8000584c:	fffff097          	auipc	ra,0xfffff
    80005850:	5ea080e7          	jalr	1514(ra) # 80004e36 <bfree>
    ip->addrs[NDIRECT] = 0;
    80005854:	fc843783          	ld	a5,-56(s0)
    80005858:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    8000585c:	fc843783          	ld	a5,-56(s0)
    80005860:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005864:	fc843503          	ld	a0,-56(s0)
    80005868:	00000097          	auipc	ra,0x0
    8000586c:	870080e7          	jalr	-1936(ra) # 800050d8 <iupdate>
}
    80005870:	0001                	nop
    80005872:	70e2                	ld	ra,56(sp)
    80005874:	7442                	ld	s0,48(sp)
    80005876:	6121                	addi	sp,sp,64
    80005878:	8082                	ret

000000008000587a <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    8000587a:	1101                	addi	sp,sp,-32
    8000587c:	ec22                	sd	s0,24(sp)
    8000587e:	1000                	addi	s0,sp,32
    80005880:	fea43423          	sd	a0,-24(s0)
    80005884:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005888:	fe843783          	ld	a5,-24(s0)
    8000588c:	439c                	lw	a5,0(a5)
    8000588e:	0007871b          	sext.w	a4,a5
    80005892:	fe043783          	ld	a5,-32(s0)
    80005896:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005898:	fe843783          	ld	a5,-24(s0)
    8000589c:	43d8                	lw	a4,4(a5)
    8000589e:	fe043783          	ld	a5,-32(s0)
    800058a2:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    800058a4:	fe843783          	ld	a5,-24(s0)
    800058a8:	04479703          	lh	a4,68(a5)
    800058ac:	fe043783          	ld	a5,-32(s0)
    800058b0:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    800058b4:	fe843783          	ld	a5,-24(s0)
    800058b8:	04a79703          	lh	a4,74(a5)
    800058bc:	fe043783          	ld	a5,-32(s0)
    800058c0:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    800058c4:	fe843783          	ld	a5,-24(s0)
    800058c8:	47fc                	lw	a5,76(a5)
    800058ca:	02079713          	slli	a4,a5,0x20
    800058ce:	9301                	srli	a4,a4,0x20
    800058d0:	fe043783          	ld	a5,-32(s0)
    800058d4:	eb98                	sd	a4,16(a5)
}
    800058d6:	0001                	nop
    800058d8:	6462                	ld	s0,24(sp)
    800058da:	6105                	addi	sp,sp,32
    800058dc:	8082                	ret

00000000800058de <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    800058de:	715d                	addi	sp,sp,-80
    800058e0:	e486                	sd	ra,72(sp)
    800058e2:	e0a2                	sd	s0,64(sp)
    800058e4:	0880                	addi	s0,sp,80
    800058e6:	fca43423          	sd	a0,-56(s0)
    800058ea:	87ae                	mv	a5,a1
    800058ec:	fac43c23          	sd	a2,-72(s0)
    800058f0:	fcf42223          	sw	a5,-60(s0)
    800058f4:	87b6                	mv	a5,a3
    800058f6:	fcf42023          	sw	a5,-64(s0)
    800058fa:	87ba                	mv	a5,a4
    800058fc:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005900:	fc843783          	ld	a5,-56(s0)
    80005904:	47f8                	lw	a4,76(a5)
    80005906:	fc042783          	lw	a5,-64(s0)
    8000590a:	2781                	sext.w	a5,a5
    8000590c:	00f76e63          	bltu	a4,a5,80005928 <readi+0x4a>
    80005910:	fc042703          	lw	a4,-64(s0)
    80005914:	fb442783          	lw	a5,-76(s0)
    80005918:	9fb9                	addw	a5,a5,a4
    8000591a:	0007871b          	sext.w	a4,a5
    8000591e:	fc042783          	lw	a5,-64(s0)
    80005922:	2781                	sext.w	a5,a5
    80005924:	00f77463          	bgeu	a4,a5,8000592c <readi+0x4e>
    return 0;
    80005928:	4781                	li	a5,0
    8000592a:	a289                	j	80005a6c <readi+0x18e>
  if(off + n > ip->size)
    8000592c:	fc042703          	lw	a4,-64(s0)
    80005930:	fb442783          	lw	a5,-76(s0)
    80005934:	9fb9                	addw	a5,a5,a4
    80005936:	0007871b          	sext.w	a4,a5
    8000593a:	fc843783          	ld	a5,-56(s0)
    8000593e:	47fc                	lw	a5,76(a5)
    80005940:	00e7fb63          	bgeu	a5,a4,80005956 <readi+0x78>
    n = ip->size - off;
    80005944:	fc843783          	ld	a5,-56(s0)
    80005948:	47f8                	lw	a4,76(a5)
    8000594a:	fc042783          	lw	a5,-64(s0)
    8000594e:	40f707bb          	subw	a5,a4,a5
    80005952:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005956:	fe042623          	sw	zero,-20(s0)
    8000595a:	a8ed                	j	80005a54 <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    8000595c:	fc042783          	lw	a5,-64(s0)
    80005960:	00a7d79b          	srliw	a5,a5,0xa
    80005964:	2781                	sext.w	a5,a5
    80005966:	85be                	mv	a1,a5
    80005968:	fc843503          	ld	a0,-56(s0)
    8000596c:	00000097          	auipc	ra,0x0
    80005970:	c48080e7          	jalr	-952(ra) # 800055b4 <bmap>
    80005974:	87aa                	mv	a5,a0
    80005976:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    8000597a:	fe842783          	lw	a5,-24(s0)
    8000597e:	2781                	sext.w	a5,a5
    80005980:	c3fd                	beqz	a5,80005a66 <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    80005982:	fc843783          	ld	a5,-56(s0)
    80005986:	439c                	lw	a5,0(a5)
    80005988:	fe842703          	lw	a4,-24(s0)
    8000598c:	85ba                	mv	a1,a4
    8000598e:	853e                	mv	a0,a5
    80005990:	fffff097          	auipc	ra,0xfffff
    80005994:	fa4080e7          	jalr	-92(ra) # 80004934 <bread>
    80005998:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    8000599c:	fc042783          	lw	a5,-64(s0)
    800059a0:	3ff7f793          	andi	a5,a5,1023
    800059a4:	2781                	sext.w	a5,a5
    800059a6:	40000713          	li	a4,1024
    800059aa:	40f707bb          	subw	a5,a4,a5
    800059ae:	0007869b          	sext.w	a3,a5
    800059b2:	fb442703          	lw	a4,-76(s0)
    800059b6:	fec42783          	lw	a5,-20(s0)
    800059ba:	40f707bb          	subw	a5,a4,a5
    800059be:	2781                	sext.w	a5,a5
    800059c0:	863e                	mv	a2,a5
    800059c2:	87b6                	mv	a5,a3
    800059c4:	0007869b          	sext.w	a3,a5
    800059c8:	0006071b          	sext.w	a4,a2
    800059cc:	00d77363          	bgeu	a4,a3,800059d2 <readi+0xf4>
    800059d0:	87b2                	mv	a5,a2
    800059d2:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    800059d6:	fe043783          	ld	a5,-32(s0)
    800059da:	05878713          	addi	a4,a5,88
    800059de:	fc046783          	lwu	a5,-64(s0)
    800059e2:	3ff7f793          	andi	a5,a5,1023
    800059e6:	973e                	add	a4,a4,a5
    800059e8:	fdc46683          	lwu	a3,-36(s0)
    800059ec:	fc442783          	lw	a5,-60(s0)
    800059f0:	863a                	mv	a2,a4
    800059f2:	fb843583          	ld	a1,-72(s0)
    800059f6:	853e                	mv	a0,a5
    800059f8:	ffffe097          	auipc	ra,0xffffe
    800059fc:	e8e080e7          	jalr	-370(ra) # 80003886 <either_copyout>
    80005a00:	87aa                	mv	a5,a0
    80005a02:	873e                	mv	a4,a5
    80005a04:	57fd                	li	a5,-1
    80005a06:	00f71c63          	bne	a4,a5,80005a1e <readi+0x140>
      brelse(bp);
    80005a0a:	fe043503          	ld	a0,-32(s0)
    80005a0e:	fffff097          	auipc	ra,0xfffff
    80005a12:	fd0080e7          	jalr	-48(ra) # 800049de <brelse>
      tot = -1;
    80005a16:	57fd                	li	a5,-1
    80005a18:	fef42623          	sw	a5,-20(s0)
      break;
    80005a1c:	a0b1                	j	80005a68 <readi+0x18a>
    }
    brelse(bp);
    80005a1e:	fe043503          	ld	a0,-32(s0)
    80005a22:	fffff097          	auipc	ra,0xfffff
    80005a26:	fbc080e7          	jalr	-68(ra) # 800049de <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005a2a:	fec42703          	lw	a4,-20(s0)
    80005a2e:	fdc42783          	lw	a5,-36(s0)
    80005a32:	9fb9                	addw	a5,a5,a4
    80005a34:	fef42623          	sw	a5,-20(s0)
    80005a38:	fc042703          	lw	a4,-64(s0)
    80005a3c:	fdc42783          	lw	a5,-36(s0)
    80005a40:	9fb9                	addw	a5,a5,a4
    80005a42:	fcf42023          	sw	a5,-64(s0)
    80005a46:	fdc46783          	lwu	a5,-36(s0)
    80005a4a:	fb843703          	ld	a4,-72(s0)
    80005a4e:	97ba                	add	a5,a5,a4
    80005a50:	faf43c23          	sd	a5,-72(s0)
    80005a54:	fec42703          	lw	a4,-20(s0)
    80005a58:	fb442783          	lw	a5,-76(s0)
    80005a5c:	2701                	sext.w	a4,a4
    80005a5e:	2781                	sext.w	a5,a5
    80005a60:	eef76ee3          	bltu	a4,a5,8000595c <readi+0x7e>
    80005a64:	a011                	j	80005a68 <readi+0x18a>
      break;
    80005a66:	0001                	nop
  }
  return tot;
    80005a68:	fec42783          	lw	a5,-20(s0)
}
    80005a6c:	853e                	mv	a0,a5
    80005a6e:	60a6                	ld	ra,72(sp)
    80005a70:	6406                	ld	s0,64(sp)
    80005a72:	6161                	addi	sp,sp,80
    80005a74:	8082                	ret

0000000080005a76 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005a76:	715d                	addi	sp,sp,-80
    80005a78:	e486                	sd	ra,72(sp)
    80005a7a:	e0a2                	sd	s0,64(sp)
    80005a7c:	0880                	addi	s0,sp,80
    80005a7e:	fca43423          	sd	a0,-56(s0)
    80005a82:	87ae                	mv	a5,a1
    80005a84:	fac43c23          	sd	a2,-72(s0)
    80005a88:	fcf42223          	sw	a5,-60(s0)
    80005a8c:	87b6                	mv	a5,a3
    80005a8e:	fcf42023          	sw	a5,-64(s0)
    80005a92:	87ba                	mv	a5,a4
    80005a94:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005a98:	fc843783          	ld	a5,-56(s0)
    80005a9c:	47f8                	lw	a4,76(a5)
    80005a9e:	fc042783          	lw	a5,-64(s0)
    80005aa2:	2781                	sext.w	a5,a5
    80005aa4:	00f76e63          	bltu	a4,a5,80005ac0 <writei+0x4a>
    80005aa8:	fc042703          	lw	a4,-64(s0)
    80005aac:	fb442783          	lw	a5,-76(s0)
    80005ab0:	9fb9                	addw	a5,a5,a4
    80005ab2:	0007871b          	sext.w	a4,a5
    80005ab6:	fc042783          	lw	a5,-64(s0)
    80005aba:	2781                	sext.w	a5,a5
    80005abc:	00f77463          	bgeu	a4,a5,80005ac4 <writei+0x4e>
    return -1;
    80005ac0:	57fd                	li	a5,-1
    80005ac2:	aab9                	j	80005c20 <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005ac4:	fc042703          	lw	a4,-64(s0)
    80005ac8:	fb442783          	lw	a5,-76(s0)
    80005acc:	9fb9                	addw	a5,a5,a4
    80005ace:	2781                	sext.w	a5,a5
    80005ad0:	873e                	mv	a4,a5
    80005ad2:	000437b7          	lui	a5,0x43
    80005ad6:	00e7f463          	bgeu	a5,a4,80005ade <writei+0x68>
    return -1;
    80005ada:	57fd                	li	a5,-1
    80005adc:	a291                	j	80005c20 <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005ade:	fe042623          	sw	zero,-20(s0)
    80005ae2:	a201                	j	80005be2 <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005ae4:	fc042783          	lw	a5,-64(s0)
    80005ae8:	00a7d79b          	srliw	a5,a5,0xa
    80005aec:	2781                	sext.w	a5,a5
    80005aee:	85be                	mv	a1,a5
    80005af0:	fc843503          	ld	a0,-56(s0)
    80005af4:	00000097          	auipc	ra,0x0
    80005af8:	ac0080e7          	jalr	-1344(ra) # 800055b4 <bmap>
    80005afc:	87aa                	mv	a5,a0
    80005afe:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005b02:	fe842783          	lw	a5,-24(s0)
    80005b06:	2781                	sext.w	a5,a5
    80005b08:	c7f5                	beqz	a5,80005bf4 <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005b0a:	fc843783          	ld	a5,-56(s0)
    80005b0e:	439c                	lw	a5,0(a5)
    80005b10:	fe842703          	lw	a4,-24(s0)
    80005b14:	85ba                	mv	a1,a4
    80005b16:	853e                	mv	a0,a5
    80005b18:	fffff097          	auipc	ra,0xfffff
    80005b1c:	e1c080e7          	jalr	-484(ra) # 80004934 <bread>
    80005b20:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005b24:	fc042783          	lw	a5,-64(s0)
    80005b28:	3ff7f793          	andi	a5,a5,1023
    80005b2c:	2781                	sext.w	a5,a5
    80005b2e:	40000713          	li	a4,1024
    80005b32:	40f707bb          	subw	a5,a4,a5
    80005b36:	0007869b          	sext.w	a3,a5
    80005b3a:	fb442703          	lw	a4,-76(s0)
    80005b3e:	fec42783          	lw	a5,-20(s0)
    80005b42:	40f707bb          	subw	a5,a4,a5
    80005b46:	2781                	sext.w	a5,a5
    80005b48:	863e                	mv	a2,a5
    80005b4a:	87b6                	mv	a5,a3
    80005b4c:	0007869b          	sext.w	a3,a5
    80005b50:	0006071b          	sext.w	a4,a2
    80005b54:	00d77363          	bgeu	a4,a3,80005b5a <writei+0xe4>
    80005b58:	87b2                	mv	a5,a2
    80005b5a:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005b5e:	fe043783          	ld	a5,-32(s0)
    80005b62:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005b66:	fc046783          	lwu	a5,-64(s0)
    80005b6a:	3ff7f793          	andi	a5,a5,1023
    80005b6e:	97ba                	add	a5,a5,a4
    80005b70:	fdc46683          	lwu	a3,-36(s0)
    80005b74:	fc442703          	lw	a4,-60(s0)
    80005b78:	fb843603          	ld	a2,-72(s0)
    80005b7c:	85ba                	mv	a1,a4
    80005b7e:	853e                	mv	a0,a5
    80005b80:	ffffe097          	auipc	ra,0xffffe
    80005b84:	d7a080e7          	jalr	-646(ra) # 800038fa <either_copyin>
    80005b88:	87aa                	mv	a5,a0
    80005b8a:	873e                	mv	a4,a5
    80005b8c:	57fd                	li	a5,-1
    80005b8e:	00f71963          	bne	a4,a5,80005ba0 <writei+0x12a>
      brelse(bp);
    80005b92:	fe043503          	ld	a0,-32(s0)
    80005b96:	fffff097          	auipc	ra,0xfffff
    80005b9a:	e48080e7          	jalr	-440(ra) # 800049de <brelse>
      break;
    80005b9e:	a8a1                	j	80005bf6 <writei+0x180>
    }
    log_write(bp);
    80005ba0:	fe043503          	ld	a0,-32(s0)
    80005ba4:	00001097          	auipc	ra,0x1
    80005ba8:	aec080e7          	jalr	-1300(ra) # 80006690 <log_write>
    brelse(bp);
    80005bac:	fe043503          	ld	a0,-32(s0)
    80005bb0:	fffff097          	auipc	ra,0xfffff
    80005bb4:	e2e080e7          	jalr	-466(ra) # 800049de <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005bb8:	fec42703          	lw	a4,-20(s0)
    80005bbc:	fdc42783          	lw	a5,-36(s0)
    80005bc0:	9fb9                	addw	a5,a5,a4
    80005bc2:	fef42623          	sw	a5,-20(s0)
    80005bc6:	fc042703          	lw	a4,-64(s0)
    80005bca:	fdc42783          	lw	a5,-36(s0)
    80005bce:	9fb9                	addw	a5,a5,a4
    80005bd0:	fcf42023          	sw	a5,-64(s0)
    80005bd4:	fdc46783          	lwu	a5,-36(s0)
    80005bd8:	fb843703          	ld	a4,-72(s0)
    80005bdc:	97ba                	add	a5,a5,a4
    80005bde:	faf43c23          	sd	a5,-72(s0)
    80005be2:	fec42703          	lw	a4,-20(s0)
    80005be6:	fb442783          	lw	a5,-76(s0)
    80005bea:	2701                	sext.w	a4,a4
    80005bec:	2781                	sext.w	a5,a5
    80005bee:	eef76be3          	bltu	a4,a5,80005ae4 <writei+0x6e>
    80005bf2:	a011                	j	80005bf6 <writei+0x180>
      break;
    80005bf4:	0001                	nop
  }

  if(off > ip->size)
    80005bf6:	fc843783          	ld	a5,-56(s0)
    80005bfa:	47f8                	lw	a4,76(a5)
    80005bfc:	fc042783          	lw	a5,-64(s0)
    80005c00:	2781                	sext.w	a5,a5
    80005c02:	00f77763          	bgeu	a4,a5,80005c10 <writei+0x19a>
    ip->size = off;
    80005c06:	fc843783          	ld	a5,-56(s0)
    80005c0a:	fc042703          	lw	a4,-64(s0)
    80005c0e:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005c10:	fc843503          	ld	a0,-56(s0)
    80005c14:	fffff097          	auipc	ra,0xfffff
    80005c18:	4c4080e7          	jalr	1220(ra) # 800050d8 <iupdate>

  return tot;
    80005c1c:	fec42783          	lw	a5,-20(s0)
}
    80005c20:	853e                	mv	a0,a5
    80005c22:	60a6                	ld	ra,72(sp)
    80005c24:	6406                	ld	s0,64(sp)
    80005c26:	6161                	addi	sp,sp,80
    80005c28:	8082                	ret

0000000080005c2a <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005c2a:	1101                	addi	sp,sp,-32
    80005c2c:	ec06                	sd	ra,24(sp)
    80005c2e:	e822                	sd	s0,16(sp)
    80005c30:	1000                	addi	s0,sp,32
    80005c32:	fea43423          	sd	a0,-24(s0)
    80005c36:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005c3a:	4639                	li	a2,14
    80005c3c:	fe043583          	ld	a1,-32(s0)
    80005c40:	fe843503          	ld	a0,-24(s0)
    80005c44:	ffffc097          	auipc	ra,0xffffc
    80005c48:	ac4080e7          	jalr	-1340(ra) # 80001708 <strncmp>
    80005c4c:	87aa                	mv	a5,a0
}
    80005c4e:	853e                	mv	a0,a5
    80005c50:	60e2                	ld	ra,24(sp)
    80005c52:	6442                	ld	s0,16(sp)
    80005c54:	6105                	addi	sp,sp,32
    80005c56:	8082                	ret

0000000080005c58 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005c58:	715d                	addi	sp,sp,-80
    80005c5a:	e486                	sd	ra,72(sp)
    80005c5c:	e0a2                	sd	s0,64(sp)
    80005c5e:	0880                	addi	s0,sp,80
    80005c60:	fca43423          	sd	a0,-56(s0)
    80005c64:	fcb43023          	sd	a1,-64(s0)
    80005c68:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005c6c:	fc843783          	ld	a5,-56(s0)
    80005c70:	04479783          	lh	a5,68(a5)
    80005c74:	0007871b          	sext.w	a4,a5
    80005c78:	4785                	li	a5,1
    80005c7a:	00f70a63          	beq	a4,a5,80005c8e <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005c7e:	00007517          	auipc	a0,0x7
    80005c82:	8a250513          	addi	a0,a0,-1886 # 8000c520 <etext+0x520>
    80005c86:	ffffb097          	auipc	ra,0xffffb
    80005c8a:	006080e7          	jalr	6(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c8e:	fe042623          	sw	zero,-20(s0)
    80005c92:	a849                	j	80005d24 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005c94:	fd840793          	addi	a5,s0,-40
    80005c98:	fec42683          	lw	a3,-20(s0)
    80005c9c:	4741                	li	a4,16
    80005c9e:	863e                	mv	a2,a5
    80005ca0:	4581                	li	a1,0
    80005ca2:	fc843503          	ld	a0,-56(s0)
    80005ca6:	00000097          	auipc	ra,0x0
    80005caa:	c38080e7          	jalr	-968(ra) # 800058de <readi>
    80005cae:	87aa                	mv	a5,a0
    80005cb0:	873e                	mv	a4,a5
    80005cb2:	47c1                	li	a5,16
    80005cb4:	00f70a63          	beq	a4,a5,80005cc8 <dirlookup+0x70>
      panic("dirlookup read");
    80005cb8:	00007517          	auipc	a0,0x7
    80005cbc:	88050513          	addi	a0,a0,-1920 # 8000c538 <etext+0x538>
    80005cc0:	ffffb097          	auipc	ra,0xffffb
    80005cc4:	fcc080e7          	jalr	-52(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005cc8:	fd845783          	lhu	a5,-40(s0)
    80005ccc:	c7b1                	beqz	a5,80005d18 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005cce:	fd840793          	addi	a5,s0,-40
    80005cd2:	0789                	addi	a5,a5,2
    80005cd4:	85be                	mv	a1,a5
    80005cd6:	fc043503          	ld	a0,-64(s0)
    80005cda:	00000097          	auipc	ra,0x0
    80005cde:	f50080e7          	jalr	-176(ra) # 80005c2a <namecmp>
    80005ce2:	87aa                	mv	a5,a0
    80005ce4:	eb9d                	bnez	a5,80005d1a <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005ce6:	fb843783          	ld	a5,-72(s0)
    80005cea:	c791                	beqz	a5,80005cf6 <dirlookup+0x9e>
        *poff = off;
    80005cec:	fb843783          	ld	a5,-72(s0)
    80005cf0:	fec42703          	lw	a4,-20(s0)
    80005cf4:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005cf6:	fd845783          	lhu	a5,-40(s0)
    80005cfa:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005cfe:	fc843783          	ld	a5,-56(s0)
    80005d02:	439c                	lw	a5,0(a5)
    80005d04:	fe842703          	lw	a4,-24(s0)
    80005d08:	85ba                	mv	a1,a4
    80005d0a:	853e                	mv	a0,a5
    80005d0c:	fffff097          	auipc	ra,0xfffff
    80005d10:	4b4080e7          	jalr	1204(ra) # 800051c0 <iget>
    80005d14:	87aa                	mv	a5,a0
    80005d16:	a005                	j	80005d36 <dirlookup+0xde>
      continue;
    80005d18:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d1a:	fec42783          	lw	a5,-20(s0)
    80005d1e:	27c1                	addiw	a5,a5,16
    80005d20:	fef42623          	sw	a5,-20(s0)
    80005d24:	fc843783          	ld	a5,-56(s0)
    80005d28:	47f8                	lw	a4,76(a5)
    80005d2a:	fec42783          	lw	a5,-20(s0)
    80005d2e:	2781                	sext.w	a5,a5
    80005d30:	f6e7e2e3          	bltu	a5,a4,80005c94 <dirlookup+0x3c>
    }
  }

  return 0;
    80005d34:	4781                	li	a5,0
}
    80005d36:	853e                	mv	a0,a5
    80005d38:	60a6                	ld	ra,72(sp)
    80005d3a:	6406                	ld	s0,64(sp)
    80005d3c:	6161                	addi	sp,sp,80
    80005d3e:	8082                	ret

0000000080005d40 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005d40:	715d                	addi	sp,sp,-80
    80005d42:	e486                	sd	ra,72(sp)
    80005d44:	e0a2                	sd	s0,64(sp)
    80005d46:	0880                	addi	s0,sp,80
    80005d48:	fca43423          	sd	a0,-56(s0)
    80005d4c:	fcb43023          	sd	a1,-64(s0)
    80005d50:	87b2                	mv	a5,a2
    80005d52:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005d56:	4601                	li	a2,0
    80005d58:	fc043583          	ld	a1,-64(s0)
    80005d5c:	fc843503          	ld	a0,-56(s0)
    80005d60:	00000097          	auipc	ra,0x0
    80005d64:	ef8080e7          	jalr	-264(ra) # 80005c58 <dirlookup>
    80005d68:	fea43023          	sd	a0,-32(s0)
    80005d6c:	fe043783          	ld	a5,-32(s0)
    80005d70:	cb89                	beqz	a5,80005d82 <dirlink+0x42>
    iput(ip);
    80005d72:	fe043503          	ld	a0,-32(s0)
    80005d76:	fffff097          	auipc	ra,0xfffff
    80005d7a:	740080e7          	jalr	1856(ra) # 800054b6 <iput>
    return -1;
    80005d7e:	57fd                	li	a5,-1
    80005d80:	a075                	j	80005e2c <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d82:	fe042623          	sw	zero,-20(s0)
    80005d86:	a0a1                	j	80005dce <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d88:	fd040793          	addi	a5,s0,-48
    80005d8c:	fec42683          	lw	a3,-20(s0)
    80005d90:	4741                	li	a4,16
    80005d92:	863e                	mv	a2,a5
    80005d94:	4581                	li	a1,0
    80005d96:	fc843503          	ld	a0,-56(s0)
    80005d9a:	00000097          	auipc	ra,0x0
    80005d9e:	b44080e7          	jalr	-1212(ra) # 800058de <readi>
    80005da2:	87aa                	mv	a5,a0
    80005da4:	873e                	mv	a4,a5
    80005da6:	47c1                	li	a5,16
    80005da8:	00f70a63          	beq	a4,a5,80005dbc <dirlink+0x7c>
      panic("dirlink read");
    80005dac:	00006517          	auipc	a0,0x6
    80005db0:	79c50513          	addi	a0,a0,1948 # 8000c548 <etext+0x548>
    80005db4:	ffffb097          	auipc	ra,0xffffb
    80005db8:	ed8080e7          	jalr	-296(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005dbc:	fd045783          	lhu	a5,-48(s0)
    80005dc0:	cf99                	beqz	a5,80005dde <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005dc2:	fec42783          	lw	a5,-20(s0)
    80005dc6:	27c1                	addiw	a5,a5,16
    80005dc8:	2781                	sext.w	a5,a5
    80005dca:	fef42623          	sw	a5,-20(s0)
    80005dce:	fc843783          	ld	a5,-56(s0)
    80005dd2:	47f8                	lw	a4,76(a5)
    80005dd4:	fec42783          	lw	a5,-20(s0)
    80005dd8:	fae7e8e3          	bltu	a5,a4,80005d88 <dirlink+0x48>
    80005ddc:	a011                	j	80005de0 <dirlink+0xa0>
      break;
    80005dde:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005de0:	fd040793          	addi	a5,s0,-48
    80005de4:	0789                	addi	a5,a5,2
    80005de6:	4639                	li	a2,14
    80005de8:	fc043583          	ld	a1,-64(s0)
    80005dec:	853e                	mv	a0,a5
    80005dee:	ffffc097          	auipc	ra,0xffffc
    80005df2:	9a4080e7          	jalr	-1628(ra) # 80001792 <strncpy>
  de.inum = inum;
    80005df6:	fbc42783          	lw	a5,-68(s0)
    80005dfa:	17c2                	slli	a5,a5,0x30
    80005dfc:	93c1                	srli	a5,a5,0x30
    80005dfe:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005e02:	fd040793          	addi	a5,s0,-48
    80005e06:	fec42683          	lw	a3,-20(s0)
    80005e0a:	4741                	li	a4,16
    80005e0c:	863e                	mv	a2,a5
    80005e0e:	4581                	li	a1,0
    80005e10:	fc843503          	ld	a0,-56(s0)
    80005e14:	00000097          	auipc	ra,0x0
    80005e18:	c62080e7          	jalr	-926(ra) # 80005a76 <writei>
    80005e1c:	87aa                	mv	a5,a0
    80005e1e:	873e                	mv	a4,a5
    80005e20:	47c1                	li	a5,16
    80005e22:	00f70463          	beq	a4,a5,80005e2a <dirlink+0xea>
    return -1;
    80005e26:	57fd                	li	a5,-1
    80005e28:	a011                	j	80005e2c <dirlink+0xec>

  return 0;
    80005e2a:	4781                	li	a5,0
}
    80005e2c:	853e                	mv	a0,a5
    80005e2e:	60a6                	ld	ra,72(sp)
    80005e30:	6406                	ld	s0,64(sp)
    80005e32:	6161                	addi	sp,sp,80
    80005e34:	8082                	ret

0000000080005e36 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005e36:	7179                	addi	sp,sp,-48
    80005e38:	f406                	sd	ra,40(sp)
    80005e3a:	f022                	sd	s0,32(sp)
    80005e3c:	1800                	addi	s0,sp,48
    80005e3e:	fca43c23          	sd	a0,-40(s0)
    80005e42:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005e46:	a031                	j	80005e52 <skipelem+0x1c>
    path++;
    80005e48:	fd843783          	ld	a5,-40(s0)
    80005e4c:	0785                	addi	a5,a5,1
    80005e4e:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005e52:	fd843783          	ld	a5,-40(s0)
    80005e56:	0007c783          	lbu	a5,0(a5)
    80005e5a:	873e                	mv	a4,a5
    80005e5c:	02f00793          	li	a5,47
    80005e60:	fef704e3          	beq	a4,a5,80005e48 <skipelem+0x12>
  if(*path == 0)
    80005e64:	fd843783          	ld	a5,-40(s0)
    80005e68:	0007c783          	lbu	a5,0(a5)
    80005e6c:	e399                	bnez	a5,80005e72 <skipelem+0x3c>
    return 0;
    80005e6e:	4781                	li	a5,0
    80005e70:	a06d                	j	80005f1a <skipelem+0xe4>
  s = path;
    80005e72:	fd843783          	ld	a5,-40(s0)
    80005e76:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005e7a:	a031                	j	80005e86 <skipelem+0x50>
    path++;
    80005e7c:	fd843783          	ld	a5,-40(s0)
    80005e80:	0785                	addi	a5,a5,1
    80005e82:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005e86:	fd843783          	ld	a5,-40(s0)
    80005e8a:	0007c783          	lbu	a5,0(a5)
    80005e8e:	873e                	mv	a4,a5
    80005e90:	02f00793          	li	a5,47
    80005e94:	00f70763          	beq	a4,a5,80005ea2 <skipelem+0x6c>
    80005e98:	fd843783          	ld	a5,-40(s0)
    80005e9c:	0007c783          	lbu	a5,0(a5)
    80005ea0:	fff1                	bnez	a5,80005e7c <skipelem+0x46>
  len = path - s;
    80005ea2:	fd843703          	ld	a4,-40(s0)
    80005ea6:	fe843783          	ld	a5,-24(s0)
    80005eaa:	40f707b3          	sub	a5,a4,a5
    80005eae:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005eb2:	fe442783          	lw	a5,-28(s0)
    80005eb6:	0007871b          	sext.w	a4,a5
    80005eba:	47b5                	li	a5,13
    80005ebc:	00e7dc63          	bge	a5,a4,80005ed4 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005ec0:	4639                	li	a2,14
    80005ec2:	fe843583          	ld	a1,-24(s0)
    80005ec6:	fd043503          	ld	a0,-48(s0)
    80005eca:	ffffb097          	auipc	ra,0xffffb
    80005ece:	72a080e7          	jalr	1834(ra) # 800015f4 <memmove>
    80005ed2:	a80d                	j	80005f04 <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005ed4:	fe442783          	lw	a5,-28(s0)
    80005ed8:	863e                	mv	a2,a5
    80005eda:	fe843583          	ld	a1,-24(s0)
    80005ede:	fd043503          	ld	a0,-48(s0)
    80005ee2:	ffffb097          	auipc	ra,0xffffb
    80005ee6:	712080e7          	jalr	1810(ra) # 800015f4 <memmove>
    name[len] = 0;
    80005eea:	fe442783          	lw	a5,-28(s0)
    80005eee:	fd043703          	ld	a4,-48(s0)
    80005ef2:	97ba                	add	a5,a5,a4
    80005ef4:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005ef8:	a031                	j	80005f04 <skipelem+0xce>
    path++;
    80005efa:	fd843783          	ld	a5,-40(s0)
    80005efe:	0785                	addi	a5,a5,1
    80005f00:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005f04:	fd843783          	ld	a5,-40(s0)
    80005f08:	0007c783          	lbu	a5,0(a5)
    80005f0c:	873e                	mv	a4,a5
    80005f0e:	02f00793          	li	a5,47
    80005f12:	fef704e3          	beq	a4,a5,80005efa <skipelem+0xc4>
  return path;
    80005f16:	fd843783          	ld	a5,-40(s0)
}
    80005f1a:	853e                	mv	a0,a5
    80005f1c:	70a2                	ld	ra,40(sp)
    80005f1e:	7402                	ld	s0,32(sp)
    80005f20:	6145                	addi	sp,sp,48
    80005f22:	8082                	ret

0000000080005f24 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005f24:	7139                	addi	sp,sp,-64
    80005f26:	fc06                	sd	ra,56(sp)
    80005f28:	f822                	sd	s0,48(sp)
    80005f2a:	0080                	addi	s0,sp,64
    80005f2c:	fca43c23          	sd	a0,-40(s0)
    80005f30:	87ae                	mv	a5,a1
    80005f32:	fcc43423          	sd	a2,-56(s0)
    80005f36:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005f3a:	fd843783          	ld	a5,-40(s0)
    80005f3e:	0007c783          	lbu	a5,0(a5)
    80005f42:	873e                	mv	a4,a5
    80005f44:	02f00793          	li	a5,47
    80005f48:	00f71b63          	bne	a4,a5,80005f5e <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005f4c:	4585                	li	a1,1
    80005f4e:	4505                	li	a0,1
    80005f50:	fffff097          	auipc	ra,0xfffff
    80005f54:	270080e7          	jalr	624(ra) # 800051c0 <iget>
    80005f58:	fea43423          	sd	a0,-24(s0)
    80005f5c:	a84d                	j	8000600e <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005f5e:	ffffd097          	auipc	ra,0xffffd
    80005f62:	ad8080e7          	jalr	-1320(ra) # 80002a36 <myproc>
    80005f66:	87aa                	mv	a5,a0
    80005f68:	1507b783          	ld	a5,336(a5)
    80005f6c:	853e                	mv	a0,a5
    80005f6e:	fffff097          	auipc	ra,0xfffff
    80005f72:	36e080e7          	jalr	878(ra) # 800052dc <idup>
    80005f76:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005f7a:	a851                	j	8000600e <namex+0xea>
    ilock(ip);
    80005f7c:	fe843503          	ld	a0,-24(s0)
    80005f80:	fffff097          	auipc	ra,0xfffff
    80005f84:	3a8080e7          	jalr	936(ra) # 80005328 <ilock>
    if(ip->type != T_DIR){
    80005f88:	fe843783          	ld	a5,-24(s0)
    80005f8c:	04479783          	lh	a5,68(a5)
    80005f90:	0007871b          	sext.w	a4,a5
    80005f94:	4785                	li	a5,1
    80005f96:	00f70a63          	beq	a4,a5,80005faa <namex+0x86>
      iunlockput(ip);
    80005f9a:	fe843503          	ld	a0,-24(s0)
    80005f9e:	fffff097          	auipc	ra,0xfffff
    80005fa2:	5e8080e7          	jalr	1512(ra) # 80005586 <iunlockput>
      return 0;
    80005fa6:	4781                	li	a5,0
    80005fa8:	a871                	j	80006044 <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005faa:	fd442783          	lw	a5,-44(s0)
    80005fae:	2781                	sext.w	a5,a5
    80005fb0:	cf99                	beqz	a5,80005fce <namex+0xaa>
    80005fb2:	fd843783          	ld	a5,-40(s0)
    80005fb6:	0007c783          	lbu	a5,0(a5)
    80005fba:	eb91                	bnez	a5,80005fce <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005fbc:	fe843503          	ld	a0,-24(s0)
    80005fc0:	fffff097          	auipc	ra,0xfffff
    80005fc4:	49c080e7          	jalr	1180(ra) # 8000545c <iunlock>
      return ip;
    80005fc8:	fe843783          	ld	a5,-24(s0)
    80005fcc:	a8a5                	j	80006044 <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005fce:	4601                	li	a2,0
    80005fd0:	fc843583          	ld	a1,-56(s0)
    80005fd4:	fe843503          	ld	a0,-24(s0)
    80005fd8:	00000097          	auipc	ra,0x0
    80005fdc:	c80080e7          	jalr	-896(ra) # 80005c58 <dirlookup>
    80005fe0:	fea43023          	sd	a0,-32(s0)
    80005fe4:	fe043783          	ld	a5,-32(s0)
    80005fe8:	eb89                	bnez	a5,80005ffa <namex+0xd6>
      iunlockput(ip);
    80005fea:	fe843503          	ld	a0,-24(s0)
    80005fee:	fffff097          	auipc	ra,0xfffff
    80005ff2:	598080e7          	jalr	1432(ra) # 80005586 <iunlockput>
      return 0;
    80005ff6:	4781                	li	a5,0
    80005ff8:	a0b1                	j	80006044 <namex+0x120>
    }
    iunlockput(ip);
    80005ffa:	fe843503          	ld	a0,-24(s0)
    80005ffe:	fffff097          	auipc	ra,0xfffff
    80006002:	588080e7          	jalr	1416(ra) # 80005586 <iunlockput>
    ip = next;
    80006006:	fe043783          	ld	a5,-32(s0)
    8000600a:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    8000600e:	fc843583          	ld	a1,-56(s0)
    80006012:	fd843503          	ld	a0,-40(s0)
    80006016:	00000097          	auipc	ra,0x0
    8000601a:	e20080e7          	jalr	-480(ra) # 80005e36 <skipelem>
    8000601e:	fca43c23          	sd	a0,-40(s0)
    80006022:	fd843783          	ld	a5,-40(s0)
    80006026:	fbb9                	bnez	a5,80005f7c <namex+0x58>
  }
  if(nameiparent){
    80006028:	fd442783          	lw	a5,-44(s0)
    8000602c:	2781                	sext.w	a5,a5
    8000602e:	cb89                	beqz	a5,80006040 <namex+0x11c>
    iput(ip);
    80006030:	fe843503          	ld	a0,-24(s0)
    80006034:	fffff097          	auipc	ra,0xfffff
    80006038:	482080e7          	jalr	1154(ra) # 800054b6 <iput>
    return 0;
    8000603c:	4781                	li	a5,0
    8000603e:	a019                	j	80006044 <namex+0x120>
  }
  return ip;
    80006040:	fe843783          	ld	a5,-24(s0)
}
    80006044:	853e                	mv	a0,a5
    80006046:	70e2                	ld	ra,56(sp)
    80006048:	7442                	ld	s0,48(sp)
    8000604a:	6121                	addi	sp,sp,64
    8000604c:	8082                	ret

000000008000604e <namei>:

struct inode*
namei(char *path)
{
    8000604e:	7179                	addi	sp,sp,-48
    80006050:	f406                	sd	ra,40(sp)
    80006052:	f022                	sd	s0,32(sp)
    80006054:	1800                	addi	s0,sp,48
    80006056:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    8000605a:	fe040793          	addi	a5,s0,-32
    8000605e:	863e                	mv	a2,a5
    80006060:	4581                	li	a1,0
    80006062:	fd843503          	ld	a0,-40(s0)
    80006066:	00000097          	auipc	ra,0x0
    8000606a:	ebe080e7          	jalr	-322(ra) # 80005f24 <namex>
    8000606e:	87aa                	mv	a5,a0
}
    80006070:	853e                	mv	a0,a5
    80006072:	70a2                	ld	ra,40(sp)
    80006074:	7402                	ld	s0,32(sp)
    80006076:	6145                	addi	sp,sp,48
    80006078:	8082                	ret

000000008000607a <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    8000607a:	1101                	addi	sp,sp,-32
    8000607c:	ec06                	sd	ra,24(sp)
    8000607e:	e822                	sd	s0,16(sp)
    80006080:	1000                	addi	s0,sp,32
    80006082:	fea43423          	sd	a0,-24(s0)
    80006086:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    8000608a:	fe043603          	ld	a2,-32(s0)
    8000608e:	4585                	li	a1,1
    80006090:	fe843503          	ld	a0,-24(s0)
    80006094:	00000097          	auipc	ra,0x0
    80006098:	e90080e7          	jalr	-368(ra) # 80005f24 <namex>
    8000609c:	87aa                	mv	a5,a0
}
    8000609e:	853e                	mv	a0,a5
    800060a0:	60e2                	ld	ra,24(sp)
    800060a2:	6442                	ld	s0,16(sp)
    800060a4:	6105                	addi	sp,sp,32
    800060a6:	8082                	ret

00000000800060a8 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    800060a8:	1101                	addi	sp,sp,-32
    800060aa:	ec06                	sd	ra,24(sp)
    800060ac:	e822                	sd	s0,16(sp)
    800060ae:	1000                	addi	s0,sp,32
    800060b0:	87aa                	mv	a5,a0
    800060b2:	feb43023          	sd	a1,-32(s0)
    800060b6:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    800060ba:	00006597          	auipc	a1,0x6
    800060be:	49e58593          	addi	a1,a1,1182 # 8000c558 <etext+0x558>
    800060c2:	0001f517          	auipc	a0,0x1f
    800060c6:	b4650513          	addi	a0,a0,-1210 # 80024c08 <log>
    800060ca:	ffffb097          	auipc	ra,0xffffb
    800060ce:	242080e7          	jalr	578(ra) # 8000130c <initlock>
  log.start = sb->logstart;
    800060d2:	fe043783          	ld	a5,-32(s0)
    800060d6:	4bdc                	lw	a5,20(a5)
    800060d8:	0007871b          	sext.w	a4,a5
    800060dc:	0001f797          	auipc	a5,0x1f
    800060e0:	b2c78793          	addi	a5,a5,-1236 # 80024c08 <log>
    800060e4:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800060e6:	fe043783          	ld	a5,-32(s0)
    800060ea:	4b9c                	lw	a5,16(a5)
    800060ec:	0007871b          	sext.w	a4,a5
    800060f0:	0001f797          	auipc	a5,0x1f
    800060f4:	b1878793          	addi	a5,a5,-1256 # 80024c08 <log>
    800060f8:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800060fa:	0001f797          	auipc	a5,0x1f
    800060fe:	b0e78793          	addi	a5,a5,-1266 # 80024c08 <log>
    80006102:	fec42703          	lw	a4,-20(s0)
    80006106:	d798                	sw	a4,40(a5)
  recover_from_log();
    80006108:	00000097          	auipc	ra,0x0
    8000610c:	272080e7          	jalr	626(ra) # 8000637a <recover_from_log>
}
    80006110:	0001                	nop
    80006112:	60e2                	ld	ra,24(sp)
    80006114:	6442                	ld	s0,16(sp)
    80006116:	6105                	addi	sp,sp,32
    80006118:	8082                	ret

000000008000611a <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    8000611a:	7139                	addi	sp,sp,-64
    8000611c:	fc06                	sd	ra,56(sp)
    8000611e:	f822                	sd	s0,48(sp)
    80006120:	0080                	addi	s0,sp,64
    80006122:	87aa                	mv	a5,a0
    80006124:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006128:	fe042623          	sw	zero,-20(s0)
    8000612c:	a0f9                	j	800061fa <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    8000612e:	0001f797          	auipc	a5,0x1f
    80006132:	ada78793          	addi	a5,a5,-1318 # 80024c08 <log>
    80006136:	579c                	lw	a5,40(a5)
    80006138:	0007869b          	sext.w	a3,a5
    8000613c:	0001f797          	auipc	a5,0x1f
    80006140:	acc78793          	addi	a5,a5,-1332 # 80024c08 <log>
    80006144:	4f9c                	lw	a5,24(a5)
    80006146:	fec42703          	lw	a4,-20(s0)
    8000614a:	9fb9                	addw	a5,a5,a4
    8000614c:	2781                	sext.w	a5,a5
    8000614e:	2785                	addiw	a5,a5,1
    80006150:	2781                	sext.w	a5,a5
    80006152:	2781                	sext.w	a5,a5
    80006154:	85be                	mv	a1,a5
    80006156:	8536                	mv	a0,a3
    80006158:	ffffe097          	auipc	ra,0xffffe
    8000615c:	7dc080e7          	jalr	2012(ra) # 80004934 <bread>
    80006160:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80006164:	0001f797          	auipc	a5,0x1f
    80006168:	aa478793          	addi	a5,a5,-1372 # 80024c08 <log>
    8000616c:	579c                	lw	a5,40(a5)
    8000616e:	0007869b          	sext.w	a3,a5
    80006172:	0001f717          	auipc	a4,0x1f
    80006176:	a9670713          	addi	a4,a4,-1386 # 80024c08 <log>
    8000617a:	fec42783          	lw	a5,-20(s0)
    8000617e:	07a1                	addi	a5,a5,8
    80006180:	078a                	slli	a5,a5,0x2
    80006182:	97ba                	add	a5,a5,a4
    80006184:	4b9c                	lw	a5,16(a5)
    80006186:	2781                	sext.w	a5,a5
    80006188:	85be                	mv	a1,a5
    8000618a:	8536                	mv	a0,a3
    8000618c:	ffffe097          	auipc	ra,0xffffe
    80006190:	7a8080e7          	jalr	1960(ra) # 80004934 <bread>
    80006194:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006198:	fd843783          	ld	a5,-40(s0)
    8000619c:	05878713          	addi	a4,a5,88
    800061a0:	fe043783          	ld	a5,-32(s0)
    800061a4:	05878793          	addi	a5,a5,88
    800061a8:	40000613          	li	a2,1024
    800061ac:	85be                	mv	a1,a5
    800061ae:	853a                	mv	a0,a4
    800061b0:	ffffb097          	auipc	ra,0xffffb
    800061b4:	444080e7          	jalr	1092(ra) # 800015f4 <memmove>
    bwrite(dbuf);  // write dst to disk
    800061b8:	fd843503          	ld	a0,-40(s0)
    800061bc:	ffffe097          	auipc	ra,0xffffe
    800061c0:	7d6080e7          	jalr	2006(ra) # 80004992 <bwrite>
    if(recovering == 0)
    800061c4:	fcc42783          	lw	a5,-52(s0)
    800061c8:	2781                	sext.w	a5,a5
    800061ca:	e799                	bnez	a5,800061d8 <install_trans+0xbe>
      bunpin(dbuf);
    800061cc:	fd843503          	ld	a0,-40(s0)
    800061d0:	fffff097          	auipc	ra,0xfffff
    800061d4:	944080e7          	jalr	-1724(ra) # 80004b14 <bunpin>
    brelse(lbuf);
    800061d8:	fe043503          	ld	a0,-32(s0)
    800061dc:	fffff097          	auipc	ra,0xfffff
    800061e0:	802080e7          	jalr	-2046(ra) # 800049de <brelse>
    brelse(dbuf);
    800061e4:	fd843503          	ld	a0,-40(s0)
    800061e8:	ffffe097          	auipc	ra,0xffffe
    800061ec:	7f6080e7          	jalr	2038(ra) # 800049de <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800061f0:	fec42783          	lw	a5,-20(s0)
    800061f4:	2785                	addiw	a5,a5,1
    800061f6:	fef42623          	sw	a5,-20(s0)
    800061fa:	0001f797          	auipc	a5,0x1f
    800061fe:	a0e78793          	addi	a5,a5,-1522 # 80024c08 <log>
    80006202:	57d8                	lw	a4,44(a5)
    80006204:	fec42783          	lw	a5,-20(s0)
    80006208:	2781                	sext.w	a5,a5
    8000620a:	f2e7c2e3          	blt	a5,a4,8000612e <install_trans+0x14>
  }
}
    8000620e:	0001                	nop
    80006210:	0001                	nop
    80006212:	70e2                	ld	ra,56(sp)
    80006214:	7442                	ld	s0,48(sp)
    80006216:	6121                	addi	sp,sp,64
    80006218:	8082                	ret

000000008000621a <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    8000621a:	7179                	addi	sp,sp,-48
    8000621c:	f406                	sd	ra,40(sp)
    8000621e:	f022                	sd	s0,32(sp)
    80006220:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006222:	0001f797          	auipc	a5,0x1f
    80006226:	9e678793          	addi	a5,a5,-1562 # 80024c08 <log>
    8000622a:	579c                	lw	a5,40(a5)
    8000622c:	0007871b          	sext.w	a4,a5
    80006230:	0001f797          	auipc	a5,0x1f
    80006234:	9d878793          	addi	a5,a5,-1576 # 80024c08 <log>
    80006238:	4f9c                	lw	a5,24(a5)
    8000623a:	2781                	sext.w	a5,a5
    8000623c:	85be                	mv	a1,a5
    8000623e:	853a                	mv	a0,a4
    80006240:	ffffe097          	auipc	ra,0xffffe
    80006244:	6f4080e7          	jalr	1780(ra) # 80004934 <bread>
    80006248:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    8000624c:	fe043783          	ld	a5,-32(s0)
    80006250:	05878793          	addi	a5,a5,88
    80006254:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006258:	fd843783          	ld	a5,-40(s0)
    8000625c:	4398                	lw	a4,0(a5)
    8000625e:	0001f797          	auipc	a5,0x1f
    80006262:	9aa78793          	addi	a5,a5,-1622 # 80024c08 <log>
    80006266:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006268:	fe042623          	sw	zero,-20(s0)
    8000626c:	a03d                	j	8000629a <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    8000626e:	fd843703          	ld	a4,-40(s0)
    80006272:	fec42783          	lw	a5,-20(s0)
    80006276:	078a                	slli	a5,a5,0x2
    80006278:	97ba                	add	a5,a5,a4
    8000627a:	43d8                	lw	a4,4(a5)
    8000627c:	0001f697          	auipc	a3,0x1f
    80006280:	98c68693          	addi	a3,a3,-1652 # 80024c08 <log>
    80006284:	fec42783          	lw	a5,-20(s0)
    80006288:	07a1                	addi	a5,a5,8
    8000628a:	078a                	slli	a5,a5,0x2
    8000628c:	97b6                	add	a5,a5,a3
    8000628e:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006290:	fec42783          	lw	a5,-20(s0)
    80006294:	2785                	addiw	a5,a5,1
    80006296:	fef42623          	sw	a5,-20(s0)
    8000629a:	0001f797          	auipc	a5,0x1f
    8000629e:	96e78793          	addi	a5,a5,-1682 # 80024c08 <log>
    800062a2:	57d8                	lw	a4,44(a5)
    800062a4:	fec42783          	lw	a5,-20(s0)
    800062a8:	2781                	sext.w	a5,a5
    800062aa:	fce7c2e3          	blt	a5,a4,8000626e <read_head+0x54>
  }
  brelse(buf);
    800062ae:	fe043503          	ld	a0,-32(s0)
    800062b2:	ffffe097          	auipc	ra,0xffffe
    800062b6:	72c080e7          	jalr	1836(ra) # 800049de <brelse>
}
    800062ba:	0001                	nop
    800062bc:	70a2                	ld	ra,40(sp)
    800062be:	7402                	ld	s0,32(sp)
    800062c0:	6145                	addi	sp,sp,48
    800062c2:	8082                	ret

00000000800062c4 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    800062c4:	7179                	addi	sp,sp,-48
    800062c6:	f406                	sd	ra,40(sp)
    800062c8:	f022                	sd	s0,32(sp)
    800062ca:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800062cc:	0001f797          	auipc	a5,0x1f
    800062d0:	93c78793          	addi	a5,a5,-1732 # 80024c08 <log>
    800062d4:	579c                	lw	a5,40(a5)
    800062d6:	0007871b          	sext.w	a4,a5
    800062da:	0001f797          	auipc	a5,0x1f
    800062de:	92e78793          	addi	a5,a5,-1746 # 80024c08 <log>
    800062e2:	4f9c                	lw	a5,24(a5)
    800062e4:	2781                	sext.w	a5,a5
    800062e6:	85be                	mv	a1,a5
    800062e8:	853a                	mv	a0,a4
    800062ea:	ffffe097          	auipc	ra,0xffffe
    800062ee:	64a080e7          	jalr	1610(ra) # 80004934 <bread>
    800062f2:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800062f6:	fe043783          	ld	a5,-32(s0)
    800062fa:	05878793          	addi	a5,a5,88
    800062fe:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    80006302:	0001f797          	auipc	a5,0x1f
    80006306:	90678793          	addi	a5,a5,-1786 # 80024c08 <log>
    8000630a:	57d8                	lw	a4,44(a5)
    8000630c:	fd843783          	ld	a5,-40(s0)
    80006310:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006312:	fe042623          	sw	zero,-20(s0)
    80006316:	a03d                	j	80006344 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    80006318:	0001f717          	auipc	a4,0x1f
    8000631c:	8f070713          	addi	a4,a4,-1808 # 80024c08 <log>
    80006320:	fec42783          	lw	a5,-20(s0)
    80006324:	07a1                	addi	a5,a5,8
    80006326:	078a                	slli	a5,a5,0x2
    80006328:	97ba                	add	a5,a5,a4
    8000632a:	4b98                	lw	a4,16(a5)
    8000632c:	fd843683          	ld	a3,-40(s0)
    80006330:	fec42783          	lw	a5,-20(s0)
    80006334:	078a                	slli	a5,a5,0x2
    80006336:	97b6                	add	a5,a5,a3
    80006338:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000633a:	fec42783          	lw	a5,-20(s0)
    8000633e:	2785                	addiw	a5,a5,1
    80006340:	fef42623          	sw	a5,-20(s0)
    80006344:	0001f797          	auipc	a5,0x1f
    80006348:	8c478793          	addi	a5,a5,-1852 # 80024c08 <log>
    8000634c:	57d8                	lw	a4,44(a5)
    8000634e:	fec42783          	lw	a5,-20(s0)
    80006352:	2781                	sext.w	a5,a5
    80006354:	fce7c2e3          	blt	a5,a4,80006318 <write_head+0x54>
  }
  bwrite(buf);
    80006358:	fe043503          	ld	a0,-32(s0)
    8000635c:	ffffe097          	auipc	ra,0xffffe
    80006360:	636080e7          	jalr	1590(ra) # 80004992 <bwrite>
  brelse(buf);
    80006364:	fe043503          	ld	a0,-32(s0)
    80006368:	ffffe097          	auipc	ra,0xffffe
    8000636c:	676080e7          	jalr	1654(ra) # 800049de <brelse>
}
    80006370:	0001                	nop
    80006372:	70a2                	ld	ra,40(sp)
    80006374:	7402                	ld	s0,32(sp)
    80006376:	6145                	addi	sp,sp,48
    80006378:	8082                	ret

000000008000637a <recover_from_log>:

static void
recover_from_log(void)
{
    8000637a:	1141                	addi	sp,sp,-16
    8000637c:	e406                	sd	ra,8(sp)
    8000637e:	e022                	sd	s0,0(sp)
    80006380:	0800                	addi	s0,sp,16
  read_head();
    80006382:	00000097          	auipc	ra,0x0
    80006386:	e98080e7          	jalr	-360(ra) # 8000621a <read_head>
  install_trans(1); // if committed, copy from log to disk
    8000638a:	4505                	li	a0,1
    8000638c:	00000097          	auipc	ra,0x0
    80006390:	d8e080e7          	jalr	-626(ra) # 8000611a <install_trans>
  log.lh.n = 0;
    80006394:	0001f797          	auipc	a5,0x1f
    80006398:	87478793          	addi	a5,a5,-1932 # 80024c08 <log>
    8000639c:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    800063a0:	00000097          	auipc	ra,0x0
    800063a4:	f24080e7          	jalr	-220(ra) # 800062c4 <write_head>
}
    800063a8:	0001                	nop
    800063aa:	60a2                	ld	ra,8(sp)
    800063ac:	6402                	ld	s0,0(sp)
    800063ae:	0141                	addi	sp,sp,16
    800063b0:	8082                	ret

00000000800063b2 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    800063b2:	1141                	addi	sp,sp,-16
    800063b4:	e406                	sd	ra,8(sp)
    800063b6:	e022                	sd	s0,0(sp)
    800063b8:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    800063ba:	0001f517          	auipc	a0,0x1f
    800063be:	84e50513          	addi	a0,a0,-1970 # 80024c08 <log>
    800063c2:	ffffb097          	auipc	ra,0xffffb
    800063c6:	f7a080e7          	jalr	-134(ra) # 8000133c <acquire>
  while(1){
    if(log.committing){
    800063ca:	0001f797          	auipc	a5,0x1f
    800063ce:	83e78793          	addi	a5,a5,-1986 # 80024c08 <log>
    800063d2:	53dc                	lw	a5,36(a5)
    800063d4:	cf91                	beqz	a5,800063f0 <begin_op+0x3e>
      sleep(&log, &log.lock);
    800063d6:	0001f597          	auipc	a1,0x1f
    800063da:	83258593          	addi	a1,a1,-1998 # 80024c08 <log>
    800063de:	0001f517          	auipc	a0,0x1f
    800063e2:	82a50513          	addi	a0,a0,-2006 # 80024c08 <log>
    800063e6:	ffffd097          	auipc	ra,0xffffd
    800063ea:	252080e7          	jalr	594(ra) # 80003638 <sleep>
    800063ee:	bff1                	j	800063ca <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800063f0:	0001f797          	auipc	a5,0x1f
    800063f4:	81878793          	addi	a5,a5,-2024 # 80024c08 <log>
    800063f8:	57d8                	lw	a4,44(a5)
    800063fa:	0001f797          	auipc	a5,0x1f
    800063fe:	80e78793          	addi	a5,a5,-2034 # 80024c08 <log>
    80006402:	539c                	lw	a5,32(a5)
    80006404:	2785                	addiw	a5,a5,1
    80006406:	2781                	sext.w	a5,a5
    80006408:	86be                	mv	a3,a5
    8000640a:	87b6                	mv	a5,a3
    8000640c:	0027979b          	slliw	a5,a5,0x2
    80006410:	9fb5                	addw	a5,a5,a3
    80006412:	0017979b          	slliw	a5,a5,0x1
    80006416:	2781                	sext.w	a5,a5
    80006418:	9fb9                	addw	a5,a5,a4
    8000641a:	2781                	sext.w	a5,a5
    8000641c:	873e                	mv	a4,a5
    8000641e:	47f9                	li	a5,30
    80006420:	00e7df63          	bge	a5,a4,8000643e <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    80006424:	0001e597          	auipc	a1,0x1e
    80006428:	7e458593          	addi	a1,a1,2020 # 80024c08 <log>
    8000642c:	0001e517          	auipc	a0,0x1e
    80006430:	7dc50513          	addi	a0,a0,2012 # 80024c08 <log>
    80006434:	ffffd097          	auipc	ra,0xffffd
    80006438:	204080e7          	jalr	516(ra) # 80003638 <sleep>
    8000643c:	b779                	j	800063ca <begin_op+0x18>
    } else {
      log.outstanding += 1;
    8000643e:	0001e797          	auipc	a5,0x1e
    80006442:	7ca78793          	addi	a5,a5,1994 # 80024c08 <log>
    80006446:	539c                	lw	a5,32(a5)
    80006448:	2785                	addiw	a5,a5,1
    8000644a:	0007871b          	sext.w	a4,a5
    8000644e:	0001e797          	auipc	a5,0x1e
    80006452:	7ba78793          	addi	a5,a5,1978 # 80024c08 <log>
    80006456:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006458:	0001e517          	auipc	a0,0x1e
    8000645c:	7b050513          	addi	a0,a0,1968 # 80024c08 <log>
    80006460:	ffffb097          	auipc	ra,0xffffb
    80006464:	f40080e7          	jalr	-192(ra) # 800013a0 <release>
      break;
    80006468:	0001                	nop
    }
  }
}
    8000646a:	0001                	nop
    8000646c:	60a2                	ld	ra,8(sp)
    8000646e:	6402                	ld	s0,0(sp)
    80006470:	0141                	addi	sp,sp,16
    80006472:	8082                	ret

0000000080006474 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80006474:	1101                	addi	sp,sp,-32
    80006476:	ec06                	sd	ra,24(sp)
    80006478:	e822                	sd	s0,16(sp)
    8000647a:	1000                	addi	s0,sp,32
  int do_commit = 0;
    8000647c:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006480:	0001e517          	auipc	a0,0x1e
    80006484:	78850513          	addi	a0,a0,1928 # 80024c08 <log>
    80006488:	ffffb097          	auipc	ra,0xffffb
    8000648c:	eb4080e7          	jalr	-332(ra) # 8000133c <acquire>
  log.outstanding -= 1;
    80006490:	0001e797          	auipc	a5,0x1e
    80006494:	77878793          	addi	a5,a5,1912 # 80024c08 <log>
    80006498:	539c                	lw	a5,32(a5)
    8000649a:	37fd                	addiw	a5,a5,-1
    8000649c:	0007871b          	sext.w	a4,a5
    800064a0:	0001e797          	auipc	a5,0x1e
    800064a4:	76878793          	addi	a5,a5,1896 # 80024c08 <log>
    800064a8:	d398                	sw	a4,32(a5)
  if(log.committing)
    800064aa:	0001e797          	auipc	a5,0x1e
    800064ae:	75e78793          	addi	a5,a5,1886 # 80024c08 <log>
    800064b2:	53dc                	lw	a5,36(a5)
    800064b4:	cb89                	beqz	a5,800064c6 <end_op+0x52>
    panic("log.committing");
    800064b6:	00006517          	auipc	a0,0x6
    800064ba:	0aa50513          	addi	a0,a0,170 # 8000c560 <etext+0x560>
    800064be:	ffffa097          	auipc	ra,0xffffa
    800064c2:	7ce080e7          	jalr	1998(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    800064c6:	0001e797          	auipc	a5,0x1e
    800064ca:	74278793          	addi	a5,a5,1858 # 80024c08 <log>
    800064ce:	539c                	lw	a5,32(a5)
    800064d0:	eb99                	bnez	a5,800064e6 <end_op+0x72>
    do_commit = 1;
    800064d2:	4785                	li	a5,1
    800064d4:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800064d8:	0001e797          	auipc	a5,0x1e
    800064dc:	73078793          	addi	a5,a5,1840 # 80024c08 <log>
    800064e0:	4705                	li	a4,1
    800064e2:	d3d8                	sw	a4,36(a5)
    800064e4:	a809                	j	800064f6 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800064e6:	0001e517          	auipc	a0,0x1e
    800064ea:	72250513          	addi	a0,a0,1826 # 80024c08 <log>
    800064ee:	ffffd097          	auipc	ra,0xffffd
    800064f2:	1c6080e7          	jalr	454(ra) # 800036b4 <wakeup>
  }
  release(&log.lock);
    800064f6:	0001e517          	auipc	a0,0x1e
    800064fa:	71250513          	addi	a0,a0,1810 # 80024c08 <log>
    800064fe:	ffffb097          	auipc	ra,0xffffb
    80006502:	ea2080e7          	jalr	-350(ra) # 800013a0 <release>

  if(do_commit){
    80006506:	fec42783          	lw	a5,-20(s0)
    8000650a:	2781                	sext.w	a5,a5
    8000650c:	c3b9                	beqz	a5,80006552 <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    8000650e:	00000097          	auipc	ra,0x0
    80006512:	134080e7          	jalr	308(ra) # 80006642 <commit>
    acquire(&log.lock);
    80006516:	0001e517          	auipc	a0,0x1e
    8000651a:	6f250513          	addi	a0,a0,1778 # 80024c08 <log>
    8000651e:	ffffb097          	auipc	ra,0xffffb
    80006522:	e1e080e7          	jalr	-482(ra) # 8000133c <acquire>
    log.committing = 0;
    80006526:	0001e797          	auipc	a5,0x1e
    8000652a:	6e278793          	addi	a5,a5,1762 # 80024c08 <log>
    8000652e:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    80006532:	0001e517          	auipc	a0,0x1e
    80006536:	6d650513          	addi	a0,a0,1750 # 80024c08 <log>
    8000653a:	ffffd097          	auipc	ra,0xffffd
    8000653e:	17a080e7          	jalr	378(ra) # 800036b4 <wakeup>
    release(&log.lock);
    80006542:	0001e517          	auipc	a0,0x1e
    80006546:	6c650513          	addi	a0,a0,1734 # 80024c08 <log>
    8000654a:	ffffb097          	auipc	ra,0xffffb
    8000654e:	e56080e7          	jalr	-426(ra) # 800013a0 <release>
  }
}
    80006552:	0001                	nop
    80006554:	60e2                	ld	ra,24(sp)
    80006556:	6442                	ld	s0,16(sp)
    80006558:	6105                	addi	sp,sp,32
    8000655a:	8082                	ret

000000008000655c <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    8000655c:	7179                	addi	sp,sp,-48
    8000655e:	f406                	sd	ra,40(sp)
    80006560:	f022                	sd	s0,32(sp)
    80006562:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006564:	fe042623          	sw	zero,-20(s0)
    80006568:	a86d                	j	80006622 <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    8000656a:	0001e797          	auipc	a5,0x1e
    8000656e:	69e78793          	addi	a5,a5,1694 # 80024c08 <log>
    80006572:	579c                	lw	a5,40(a5)
    80006574:	0007869b          	sext.w	a3,a5
    80006578:	0001e797          	auipc	a5,0x1e
    8000657c:	69078793          	addi	a5,a5,1680 # 80024c08 <log>
    80006580:	4f9c                	lw	a5,24(a5)
    80006582:	fec42703          	lw	a4,-20(s0)
    80006586:	9fb9                	addw	a5,a5,a4
    80006588:	2781                	sext.w	a5,a5
    8000658a:	2785                	addiw	a5,a5,1
    8000658c:	2781                	sext.w	a5,a5
    8000658e:	2781                	sext.w	a5,a5
    80006590:	85be                	mv	a1,a5
    80006592:	8536                	mv	a0,a3
    80006594:	ffffe097          	auipc	ra,0xffffe
    80006598:	3a0080e7          	jalr	928(ra) # 80004934 <bread>
    8000659c:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    800065a0:	0001e797          	auipc	a5,0x1e
    800065a4:	66878793          	addi	a5,a5,1640 # 80024c08 <log>
    800065a8:	579c                	lw	a5,40(a5)
    800065aa:	0007869b          	sext.w	a3,a5
    800065ae:	0001e717          	auipc	a4,0x1e
    800065b2:	65a70713          	addi	a4,a4,1626 # 80024c08 <log>
    800065b6:	fec42783          	lw	a5,-20(s0)
    800065ba:	07a1                	addi	a5,a5,8
    800065bc:	078a                	slli	a5,a5,0x2
    800065be:	97ba                	add	a5,a5,a4
    800065c0:	4b9c                	lw	a5,16(a5)
    800065c2:	2781                	sext.w	a5,a5
    800065c4:	85be                	mv	a1,a5
    800065c6:	8536                	mv	a0,a3
    800065c8:	ffffe097          	auipc	ra,0xffffe
    800065cc:	36c080e7          	jalr	876(ra) # 80004934 <bread>
    800065d0:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800065d4:	fe043783          	ld	a5,-32(s0)
    800065d8:	05878713          	addi	a4,a5,88
    800065dc:	fd843783          	ld	a5,-40(s0)
    800065e0:	05878793          	addi	a5,a5,88
    800065e4:	40000613          	li	a2,1024
    800065e8:	85be                	mv	a1,a5
    800065ea:	853a                	mv	a0,a4
    800065ec:	ffffb097          	auipc	ra,0xffffb
    800065f0:	008080e7          	jalr	8(ra) # 800015f4 <memmove>
    bwrite(to);  // write the log
    800065f4:	fe043503          	ld	a0,-32(s0)
    800065f8:	ffffe097          	auipc	ra,0xffffe
    800065fc:	39a080e7          	jalr	922(ra) # 80004992 <bwrite>
    brelse(from);
    80006600:	fd843503          	ld	a0,-40(s0)
    80006604:	ffffe097          	auipc	ra,0xffffe
    80006608:	3da080e7          	jalr	986(ra) # 800049de <brelse>
    brelse(to);
    8000660c:	fe043503          	ld	a0,-32(s0)
    80006610:	ffffe097          	auipc	ra,0xffffe
    80006614:	3ce080e7          	jalr	974(ra) # 800049de <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006618:	fec42783          	lw	a5,-20(s0)
    8000661c:	2785                	addiw	a5,a5,1
    8000661e:	fef42623          	sw	a5,-20(s0)
    80006622:	0001e797          	auipc	a5,0x1e
    80006626:	5e678793          	addi	a5,a5,1510 # 80024c08 <log>
    8000662a:	57d8                	lw	a4,44(a5)
    8000662c:	fec42783          	lw	a5,-20(s0)
    80006630:	2781                	sext.w	a5,a5
    80006632:	f2e7cce3          	blt	a5,a4,8000656a <write_log+0xe>
  }
}
    80006636:	0001                	nop
    80006638:	0001                	nop
    8000663a:	70a2                	ld	ra,40(sp)
    8000663c:	7402                	ld	s0,32(sp)
    8000663e:	6145                	addi	sp,sp,48
    80006640:	8082                	ret

0000000080006642 <commit>:

static void
commit()
{
    80006642:	1141                	addi	sp,sp,-16
    80006644:	e406                	sd	ra,8(sp)
    80006646:	e022                	sd	s0,0(sp)
    80006648:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    8000664a:	0001e797          	auipc	a5,0x1e
    8000664e:	5be78793          	addi	a5,a5,1470 # 80024c08 <log>
    80006652:	57dc                	lw	a5,44(a5)
    80006654:	02f05963          	blez	a5,80006686 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006658:	00000097          	auipc	ra,0x0
    8000665c:	f04080e7          	jalr	-252(ra) # 8000655c <write_log>
    write_head();    // Write header to disk -- the real commit
    80006660:	00000097          	auipc	ra,0x0
    80006664:	c64080e7          	jalr	-924(ra) # 800062c4 <write_head>
    install_trans(0); // Now install writes to home locations
    80006668:	4501                	li	a0,0
    8000666a:	00000097          	auipc	ra,0x0
    8000666e:	ab0080e7          	jalr	-1360(ra) # 8000611a <install_trans>
    log.lh.n = 0;
    80006672:	0001e797          	auipc	a5,0x1e
    80006676:	59678793          	addi	a5,a5,1430 # 80024c08 <log>
    8000667a:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    8000667e:	00000097          	auipc	ra,0x0
    80006682:	c46080e7          	jalr	-954(ra) # 800062c4 <write_head>
  }
}
    80006686:	0001                	nop
    80006688:	60a2                	ld	ra,8(sp)
    8000668a:	6402                	ld	s0,0(sp)
    8000668c:	0141                	addi	sp,sp,16
    8000668e:	8082                	ret

0000000080006690 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006690:	7179                	addi	sp,sp,-48
    80006692:	f406                	sd	ra,40(sp)
    80006694:	f022                	sd	s0,32(sp)
    80006696:	1800                	addi	s0,sp,48
    80006698:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    8000669c:	0001e517          	auipc	a0,0x1e
    800066a0:	56c50513          	addi	a0,a0,1388 # 80024c08 <log>
    800066a4:	ffffb097          	auipc	ra,0xffffb
    800066a8:	c98080e7          	jalr	-872(ra) # 8000133c <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    800066ac:	0001e797          	auipc	a5,0x1e
    800066b0:	55c78793          	addi	a5,a5,1372 # 80024c08 <log>
    800066b4:	57dc                	lw	a5,44(a5)
    800066b6:	873e                	mv	a4,a5
    800066b8:	47f5                	li	a5,29
    800066ba:	02e7c063          	blt	a5,a4,800066da <log_write+0x4a>
    800066be:	0001e797          	auipc	a5,0x1e
    800066c2:	54a78793          	addi	a5,a5,1354 # 80024c08 <log>
    800066c6:	57d8                	lw	a4,44(a5)
    800066c8:	0001e797          	auipc	a5,0x1e
    800066cc:	54078793          	addi	a5,a5,1344 # 80024c08 <log>
    800066d0:	4fdc                	lw	a5,28(a5)
    800066d2:	37fd                	addiw	a5,a5,-1
    800066d4:	2781                	sext.w	a5,a5
    800066d6:	00f74a63          	blt	a4,a5,800066ea <log_write+0x5a>
    panic("too big a transaction");
    800066da:	00006517          	auipc	a0,0x6
    800066de:	e9650513          	addi	a0,a0,-362 # 8000c570 <etext+0x570>
    800066e2:	ffffa097          	auipc	ra,0xffffa
    800066e6:	5aa080e7          	jalr	1450(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    800066ea:	0001e797          	auipc	a5,0x1e
    800066ee:	51e78793          	addi	a5,a5,1310 # 80024c08 <log>
    800066f2:	539c                	lw	a5,32(a5)
    800066f4:	00f04a63          	bgtz	a5,80006708 <log_write+0x78>
    panic("log_write outside of trans");
    800066f8:	00006517          	auipc	a0,0x6
    800066fc:	e9050513          	addi	a0,a0,-368 # 8000c588 <etext+0x588>
    80006700:	ffffa097          	auipc	ra,0xffffa
    80006704:	58c080e7          	jalr	1420(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    80006708:	fe042623          	sw	zero,-20(s0)
    8000670c:	a03d                	j	8000673a <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    8000670e:	0001e717          	auipc	a4,0x1e
    80006712:	4fa70713          	addi	a4,a4,1274 # 80024c08 <log>
    80006716:	fec42783          	lw	a5,-20(s0)
    8000671a:	07a1                	addi	a5,a5,8
    8000671c:	078a                	slli	a5,a5,0x2
    8000671e:	97ba                	add	a5,a5,a4
    80006720:	4b9c                	lw	a5,16(a5)
    80006722:	0007871b          	sext.w	a4,a5
    80006726:	fd843783          	ld	a5,-40(s0)
    8000672a:	47dc                	lw	a5,12(a5)
    8000672c:	02f70263          	beq	a4,a5,80006750 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    80006730:	fec42783          	lw	a5,-20(s0)
    80006734:	2785                	addiw	a5,a5,1
    80006736:	fef42623          	sw	a5,-20(s0)
    8000673a:	0001e797          	auipc	a5,0x1e
    8000673e:	4ce78793          	addi	a5,a5,1230 # 80024c08 <log>
    80006742:	57d8                	lw	a4,44(a5)
    80006744:	fec42783          	lw	a5,-20(s0)
    80006748:	2781                	sext.w	a5,a5
    8000674a:	fce7c2e3          	blt	a5,a4,8000670e <log_write+0x7e>
    8000674e:	a011                	j	80006752 <log_write+0xc2>
      break;
    80006750:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80006752:	fd843783          	ld	a5,-40(s0)
    80006756:	47dc                	lw	a5,12(a5)
    80006758:	0007871b          	sext.w	a4,a5
    8000675c:	0001e697          	auipc	a3,0x1e
    80006760:	4ac68693          	addi	a3,a3,1196 # 80024c08 <log>
    80006764:	fec42783          	lw	a5,-20(s0)
    80006768:	07a1                	addi	a5,a5,8
    8000676a:	078a                	slli	a5,a5,0x2
    8000676c:	97b6                	add	a5,a5,a3
    8000676e:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006770:	0001e797          	auipc	a5,0x1e
    80006774:	49878793          	addi	a5,a5,1176 # 80024c08 <log>
    80006778:	57d8                	lw	a4,44(a5)
    8000677a:	fec42783          	lw	a5,-20(s0)
    8000677e:	2781                	sext.w	a5,a5
    80006780:	02e79563          	bne	a5,a4,800067aa <log_write+0x11a>
    bpin(b);
    80006784:	fd843503          	ld	a0,-40(s0)
    80006788:	ffffe097          	auipc	ra,0xffffe
    8000678c:	344080e7          	jalr	836(ra) # 80004acc <bpin>
    log.lh.n++;
    80006790:	0001e797          	auipc	a5,0x1e
    80006794:	47878793          	addi	a5,a5,1144 # 80024c08 <log>
    80006798:	57dc                	lw	a5,44(a5)
    8000679a:	2785                	addiw	a5,a5,1
    8000679c:	0007871b          	sext.w	a4,a5
    800067a0:	0001e797          	auipc	a5,0x1e
    800067a4:	46878793          	addi	a5,a5,1128 # 80024c08 <log>
    800067a8:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    800067aa:	0001e517          	auipc	a0,0x1e
    800067ae:	45e50513          	addi	a0,a0,1118 # 80024c08 <log>
    800067b2:	ffffb097          	auipc	ra,0xffffb
    800067b6:	bee080e7          	jalr	-1042(ra) # 800013a0 <release>
}
    800067ba:	0001                	nop
    800067bc:	70a2                	ld	ra,40(sp)
    800067be:	7402                	ld	s0,32(sp)
    800067c0:	6145                	addi	sp,sp,48
    800067c2:	8082                	ret

00000000800067c4 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    800067c4:	1101                	addi	sp,sp,-32
    800067c6:	ec06                	sd	ra,24(sp)
    800067c8:	e822                	sd	s0,16(sp)
    800067ca:	1000                	addi	s0,sp,32
    800067cc:	fea43423          	sd	a0,-24(s0)
    800067d0:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    800067d4:	fe843783          	ld	a5,-24(s0)
    800067d8:	07a1                	addi	a5,a5,8
    800067da:	00006597          	auipc	a1,0x6
    800067de:	dce58593          	addi	a1,a1,-562 # 8000c5a8 <etext+0x5a8>
    800067e2:	853e                	mv	a0,a5
    800067e4:	ffffb097          	auipc	ra,0xffffb
    800067e8:	b28080e7          	jalr	-1240(ra) # 8000130c <initlock>
  lk->name = name;
    800067ec:	fe843783          	ld	a5,-24(s0)
    800067f0:	fe043703          	ld	a4,-32(s0)
    800067f4:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    800067f6:	fe843783          	ld	a5,-24(s0)
    800067fa:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800067fe:	fe843783          	ld	a5,-24(s0)
    80006802:	0207a423          	sw	zero,40(a5)
}
    80006806:	0001                	nop
    80006808:	60e2                	ld	ra,24(sp)
    8000680a:	6442                	ld	s0,16(sp)
    8000680c:	6105                	addi	sp,sp,32
    8000680e:	8082                	ret

0000000080006810 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    80006810:	1101                	addi	sp,sp,-32
    80006812:	ec06                	sd	ra,24(sp)
    80006814:	e822                	sd	s0,16(sp)
    80006816:	1000                	addi	s0,sp,32
    80006818:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    8000681c:	fe843783          	ld	a5,-24(s0)
    80006820:	07a1                	addi	a5,a5,8
    80006822:	853e                	mv	a0,a5
    80006824:	ffffb097          	auipc	ra,0xffffb
    80006828:	b18080e7          	jalr	-1256(ra) # 8000133c <acquire>
  while (lk->locked) {
    8000682c:	a819                	j	80006842 <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    8000682e:	fe843783          	ld	a5,-24(s0)
    80006832:	07a1                	addi	a5,a5,8
    80006834:	85be                	mv	a1,a5
    80006836:	fe843503          	ld	a0,-24(s0)
    8000683a:	ffffd097          	auipc	ra,0xffffd
    8000683e:	dfe080e7          	jalr	-514(ra) # 80003638 <sleep>
  while (lk->locked) {
    80006842:	fe843783          	ld	a5,-24(s0)
    80006846:	439c                	lw	a5,0(a5)
    80006848:	f3fd                	bnez	a5,8000682e <acquiresleep+0x1e>
  }
  lk->locked = 1;
    8000684a:	fe843783          	ld	a5,-24(s0)
    8000684e:	4705                	li	a4,1
    80006850:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80006852:	ffffc097          	auipc	ra,0xffffc
    80006856:	1e4080e7          	jalr	484(ra) # 80002a36 <myproc>
    8000685a:	87aa                	mv	a5,a0
    8000685c:	5b98                	lw	a4,48(a5)
    8000685e:	fe843783          	ld	a5,-24(s0)
    80006862:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006864:	fe843783          	ld	a5,-24(s0)
    80006868:	07a1                	addi	a5,a5,8
    8000686a:	853e                	mv	a0,a5
    8000686c:	ffffb097          	auipc	ra,0xffffb
    80006870:	b34080e7          	jalr	-1228(ra) # 800013a0 <release>
}
    80006874:	0001                	nop
    80006876:	60e2                	ld	ra,24(sp)
    80006878:	6442                	ld	s0,16(sp)
    8000687a:	6105                	addi	sp,sp,32
    8000687c:	8082                	ret

000000008000687e <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    8000687e:	1101                	addi	sp,sp,-32
    80006880:	ec06                	sd	ra,24(sp)
    80006882:	e822                	sd	s0,16(sp)
    80006884:	1000                	addi	s0,sp,32
    80006886:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    8000688a:	fe843783          	ld	a5,-24(s0)
    8000688e:	07a1                	addi	a5,a5,8
    80006890:	853e                	mv	a0,a5
    80006892:	ffffb097          	auipc	ra,0xffffb
    80006896:	aaa080e7          	jalr	-1366(ra) # 8000133c <acquire>
  lk->locked = 0;
    8000689a:	fe843783          	ld	a5,-24(s0)
    8000689e:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800068a2:	fe843783          	ld	a5,-24(s0)
    800068a6:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    800068aa:	fe843503          	ld	a0,-24(s0)
    800068ae:	ffffd097          	auipc	ra,0xffffd
    800068b2:	e06080e7          	jalr	-506(ra) # 800036b4 <wakeup>
  release(&lk->lk);
    800068b6:	fe843783          	ld	a5,-24(s0)
    800068ba:	07a1                	addi	a5,a5,8
    800068bc:	853e                	mv	a0,a5
    800068be:	ffffb097          	auipc	ra,0xffffb
    800068c2:	ae2080e7          	jalr	-1310(ra) # 800013a0 <release>
}
    800068c6:	0001                	nop
    800068c8:	60e2                	ld	ra,24(sp)
    800068ca:	6442                	ld	s0,16(sp)
    800068cc:	6105                	addi	sp,sp,32
    800068ce:	8082                	ret

00000000800068d0 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    800068d0:	7139                	addi	sp,sp,-64
    800068d2:	fc06                	sd	ra,56(sp)
    800068d4:	f822                	sd	s0,48(sp)
    800068d6:	f426                	sd	s1,40(sp)
    800068d8:	0080                	addi	s0,sp,64
    800068da:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    800068de:	fc843783          	ld	a5,-56(s0)
    800068e2:	07a1                	addi	a5,a5,8
    800068e4:	853e                	mv	a0,a5
    800068e6:	ffffb097          	auipc	ra,0xffffb
    800068ea:	a56080e7          	jalr	-1450(ra) # 8000133c <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800068ee:	fc843783          	ld	a5,-56(s0)
    800068f2:	439c                	lw	a5,0(a5)
    800068f4:	cf99                	beqz	a5,80006912 <holdingsleep+0x42>
    800068f6:	fc843783          	ld	a5,-56(s0)
    800068fa:	5784                	lw	s1,40(a5)
    800068fc:	ffffc097          	auipc	ra,0xffffc
    80006900:	13a080e7          	jalr	314(ra) # 80002a36 <myproc>
    80006904:	87aa                	mv	a5,a0
    80006906:	5b9c                	lw	a5,48(a5)
    80006908:	8726                	mv	a4,s1
    8000690a:	00f71463          	bne	a4,a5,80006912 <holdingsleep+0x42>
    8000690e:	4785                	li	a5,1
    80006910:	a011                	j	80006914 <holdingsleep+0x44>
    80006912:	4781                	li	a5,0
    80006914:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    80006918:	fc843783          	ld	a5,-56(s0)
    8000691c:	07a1                	addi	a5,a5,8
    8000691e:	853e                	mv	a0,a5
    80006920:	ffffb097          	auipc	ra,0xffffb
    80006924:	a80080e7          	jalr	-1408(ra) # 800013a0 <release>
  return r;
    80006928:	fdc42783          	lw	a5,-36(s0)
}
    8000692c:	853e                	mv	a0,a5
    8000692e:	70e2                	ld	ra,56(sp)
    80006930:	7442                	ld	s0,48(sp)
    80006932:	74a2                	ld	s1,40(sp)
    80006934:	6121                	addi	sp,sp,64
    80006936:	8082                	ret

0000000080006938 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006938:	1141                	addi	sp,sp,-16
    8000693a:	e406                	sd	ra,8(sp)
    8000693c:	e022                	sd	s0,0(sp)
    8000693e:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006940:	00006597          	auipc	a1,0x6
    80006944:	c7858593          	addi	a1,a1,-904 # 8000c5b8 <etext+0x5b8>
    80006948:	0001e517          	auipc	a0,0x1e
    8000694c:	40850513          	addi	a0,a0,1032 # 80024d50 <ftable>
    80006950:	ffffb097          	auipc	ra,0xffffb
    80006954:	9bc080e7          	jalr	-1604(ra) # 8000130c <initlock>
}
    80006958:	0001                	nop
    8000695a:	60a2                	ld	ra,8(sp)
    8000695c:	6402                	ld	s0,0(sp)
    8000695e:	0141                	addi	sp,sp,16
    80006960:	8082                	ret

0000000080006962 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006962:	1101                	addi	sp,sp,-32
    80006964:	ec06                	sd	ra,24(sp)
    80006966:	e822                	sd	s0,16(sp)
    80006968:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    8000696a:	0001e517          	auipc	a0,0x1e
    8000696e:	3e650513          	addi	a0,a0,998 # 80024d50 <ftable>
    80006972:	ffffb097          	auipc	ra,0xffffb
    80006976:	9ca080e7          	jalr	-1590(ra) # 8000133c <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    8000697a:	0001e797          	auipc	a5,0x1e
    8000697e:	3ee78793          	addi	a5,a5,1006 # 80024d68 <ftable+0x18>
    80006982:	fef43423          	sd	a5,-24(s0)
    80006986:	a815                	j	800069ba <filealloc+0x58>
    if(f->ref == 0){
    80006988:	fe843783          	ld	a5,-24(s0)
    8000698c:	43dc                	lw	a5,4(a5)
    8000698e:	e385                	bnez	a5,800069ae <filealloc+0x4c>
      f->ref = 1;
    80006990:	fe843783          	ld	a5,-24(s0)
    80006994:	4705                	li	a4,1
    80006996:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006998:	0001e517          	auipc	a0,0x1e
    8000699c:	3b850513          	addi	a0,a0,952 # 80024d50 <ftable>
    800069a0:	ffffb097          	auipc	ra,0xffffb
    800069a4:	a00080e7          	jalr	-1536(ra) # 800013a0 <release>
      return f;
    800069a8:	fe843783          	ld	a5,-24(s0)
    800069ac:	a805                	j	800069dc <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    800069ae:	fe843783          	ld	a5,-24(s0)
    800069b2:	02878793          	addi	a5,a5,40
    800069b6:	fef43423          	sd	a5,-24(s0)
    800069ba:	0001f797          	auipc	a5,0x1f
    800069be:	34e78793          	addi	a5,a5,846 # 80025d08 <diskpagesallocated>
    800069c2:	fe843703          	ld	a4,-24(s0)
    800069c6:	fcf761e3          	bltu	a4,a5,80006988 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    800069ca:	0001e517          	auipc	a0,0x1e
    800069ce:	38650513          	addi	a0,a0,902 # 80024d50 <ftable>
    800069d2:	ffffb097          	auipc	ra,0xffffb
    800069d6:	9ce080e7          	jalr	-1586(ra) # 800013a0 <release>
  return 0;
    800069da:	4781                	li	a5,0
}
    800069dc:	853e                	mv	a0,a5
    800069de:	60e2                	ld	ra,24(sp)
    800069e0:	6442                	ld	s0,16(sp)
    800069e2:	6105                	addi	sp,sp,32
    800069e4:	8082                	ret

00000000800069e6 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    800069e6:	1101                	addi	sp,sp,-32
    800069e8:	ec06                	sd	ra,24(sp)
    800069ea:	e822                	sd	s0,16(sp)
    800069ec:	1000                	addi	s0,sp,32
    800069ee:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    800069f2:	0001e517          	auipc	a0,0x1e
    800069f6:	35e50513          	addi	a0,a0,862 # 80024d50 <ftable>
    800069fa:	ffffb097          	auipc	ra,0xffffb
    800069fe:	942080e7          	jalr	-1726(ra) # 8000133c <acquire>
  if(f->ref < 1)
    80006a02:	fe843783          	ld	a5,-24(s0)
    80006a06:	43dc                	lw	a5,4(a5)
    80006a08:	00f04a63          	bgtz	a5,80006a1c <filedup+0x36>
    panic("filedup");
    80006a0c:	00006517          	auipc	a0,0x6
    80006a10:	bb450513          	addi	a0,a0,-1100 # 8000c5c0 <etext+0x5c0>
    80006a14:	ffffa097          	auipc	ra,0xffffa
    80006a18:	278080e7          	jalr	632(ra) # 80000c8c <panic>
  f->ref++;
    80006a1c:	fe843783          	ld	a5,-24(s0)
    80006a20:	43dc                	lw	a5,4(a5)
    80006a22:	2785                	addiw	a5,a5,1
    80006a24:	0007871b          	sext.w	a4,a5
    80006a28:	fe843783          	ld	a5,-24(s0)
    80006a2c:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006a2e:	0001e517          	auipc	a0,0x1e
    80006a32:	32250513          	addi	a0,a0,802 # 80024d50 <ftable>
    80006a36:	ffffb097          	auipc	ra,0xffffb
    80006a3a:	96a080e7          	jalr	-1686(ra) # 800013a0 <release>
  return f;
    80006a3e:	fe843783          	ld	a5,-24(s0)
}
    80006a42:	853e                	mv	a0,a5
    80006a44:	60e2                	ld	ra,24(sp)
    80006a46:	6442                	ld	s0,16(sp)
    80006a48:	6105                	addi	sp,sp,32
    80006a4a:	8082                	ret

0000000080006a4c <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006a4c:	715d                	addi	sp,sp,-80
    80006a4e:	e486                	sd	ra,72(sp)
    80006a50:	e0a2                	sd	s0,64(sp)
    80006a52:	0880                	addi	s0,sp,80
    80006a54:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006a58:	0001e517          	auipc	a0,0x1e
    80006a5c:	2f850513          	addi	a0,a0,760 # 80024d50 <ftable>
    80006a60:	ffffb097          	auipc	ra,0xffffb
    80006a64:	8dc080e7          	jalr	-1828(ra) # 8000133c <acquire>
  if(f->ref < 1)
    80006a68:	fb843783          	ld	a5,-72(s0)
    80006a6c:	43dc                	lw	a5,4(a5)
    80006a6e:	00f04a63          	bgtz	a5,80006a82 <fileclose+0x36>
    panic("fileclose");
    80006a72:	00006517          	auipc	a0,0x6
    80006a76:	b5650513          	addi	a0,a0,-1194 # 8000c5c8 <etext+0x5c8>
    80006a7a:	ffffa097          	auipc	ra,0xffffa
    80006a7e:	212080e7          	jalr	530(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006a82:	fb843783          	ld	a5,-72(s0)
    80006a86:	43dc                	lw	a5,4(a5)
    80006a88:	37fd                	addiw	a5,a5,-1
    80006a8a:	0007871b          	sext.w	a4,a5
    80006a8e:	fb843783          	ld	a5,-72(s0)
    80006a92:	c3d8                	sw	a4,4(a5)
    80006a94:	fb843783          	ld	a5,-72(s0)
    80006a98:	43dc                	lw	a5,4(a5)
    80006a9a:	00f05b63          	blez	a5,80006ab0 <fileclose+0x64>
    release(&ftable.lock);
    80006a9e:	0001e517          	auipc	a0,0x1e
    80006aa2:	2b250513          	addi	a0,a0,690 # 80024d50 <ftable>
    80006aa6:	ffffb097          	auipc	ra,0xffffb
    80006aaa:	8fa080e7          	jalr	-1798(ra) # 800013a0 <release>
    80006aae:	a879                	j	80006b4c <fileclose+0x100>
    return;
  }
  ff = *f;
    80006ab0:	fb843783          	ld	a5,-72(s0)
    80006ab4:	638c                	ld	a1,0(a5)
    80006ab6:	6790                	ld	a2,8(a5)
    80006ab8:	6b94                	ld	a3,16(a5)
    80006aba:	6f98                	ld	a4,24(a5)
    80006abc:	739c                	ld	a5,32(a5)
    80006abe:	fcb43423          	sd	a1,-56(s0)
    80006ac2:	fcc43823          	sd	a2,-48(s0)
    80006ac6:	fcd43c23          	sd	a3,-40(s0)
    80006aca:	fee43023          	sd	a4,-32(s0)
    80006ace:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006ad2:	fb843783          	ld	a5,-72(s0)
    80006ad6:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006ada:	fb843783          	ld	a5,-72(s0)
    80006ade:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006ae2:	0001e517          	auipc	a0,0x1e
    80006ae6:	26e50513          	addi	a0,a0,622 # 80024d50 <ftable>
    80006aea:	ffffb097          	auipc	ra,0xffffb
    80006aee:	8b6080e7          	jalr	-1866(ra) # 800013a0 <release>

  if(ff.type == FD_PIPE){
    80006af2:	fc842783          	lw	a5,-56(s0)
    80006af6:	873e                	mv	a4,a5
    80006af8:	4785                	li	a5,1
    80006afa:	00f71e63          	bne	a4,a5,80006b16 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006afe:	fd843783          	ld	a5,-40(s0)
    80006b02:	fd144703          	lbu	a4,-47(s0)
    80006b06:	2701                	sext.w	a4,a4
    80006b08:	85ba                	mv	a1,a4
    80006b0a:	853e                	mv	a0,a5
    80006b0c:	00000097          	auipc	ra,0x0
    80006b10:	5aa080e7          	jalr	1450(ra) # 800070b6 <pipeclose>
    80006b14:	a825                	j	80006b4c <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006b16:	fc842783          	lw	a5,-56(s0)
    80006b1a:	873e                	mv	a4,a5
    80006b1c:	4789                	li	a5,2
    80006b1e:	00f70863          	beq	a4,a5,80006b2e <fileclose+0xe2>
    80006b22:	fc842783          	lw	a5,-56(s0)
    80006b26:	873e                	mv	a4,a5
    80006b28:	478d                	li	a5,3
    80006b2a:	02f71163          	bne	a4,a5,80006b4c <fileclose+0x100>
    begin_op();
    80006b2e:	00000097          	auipc	ra,0x0
    80006b32:	884080e7          	jalr	-1916(ra) # 800063b2 <begin_op>
    iput(ff.ip);
    80006b36:	fe043783          	ld	a5,-32(s0)
    80006b3a:	853e                	mv	a0,a5
    80006b3c:	fffff097          	auipc	ra,0xfffff
    80006b40:	97a080e7          	jalr	-1670(ra) # 800054b6 <iput>
    end_op();
    80006b44:	00000097          	auipc	ra,0x0
    80006b48:	930080e7          	jalr	-1744(ra) # 80006474 <end_op>
  }
}
    80006b4c:	60a6                	ld	ra,72(sp)
    80006b4e:	6406                	ld	s0,64(sp)
    80006b50:	6161                	addi	sp,sp,80
    80006b52:	8082                	ret

0000000080006b54 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006b54:	7139                	addi	sp,sp,-64
    80006b56:	fc06                	sd	ra,56(sp)
    80006b58:	f822                	sd	s0,48(sp)
    80006b5a:	0080                	addi	s0,sp,64
    80006b5c:	fca43423          	sd	a0,-56(s0)
    80006b60:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006b64:	ffffc097          	auipc	ra,0xffffc
    80006b68:	ed2080e7          	jalr	-302(ra) # 80002a36 <myproc>
    80006b6c:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006b70:	fc843783          	ld	a5,-56(s0)
    80006b74:	439c                	lw	a5,0(a5)
    80006b76:	873e                	mv	a4,a5
    80006b78:	4789                	li	a5,2
    80006b7a:	00f70963          	beq	a4,a5,80006b8c <filestat+0x38>
    80006b7e:	fc843783          	ld	a5,-56(s0)
    80006b82:	439c                	lw	a5,0(a5)
    80006b84:	873e                	mv	a4,a5
    80006b86:	478d                	li	a5,3
    80006b88:	06f71263          	bne	a4,a5,80006bec <filestat+0x98>
    ilock(f->ip);
    80006b8c:	fc843783          	ld	a5,-56(s0)
    80006b90:	6f9c                	ld	a5,24(a5)
    80006b92:	853e                	mv	a0,a5
    80006b94:	ffffe097          	auipc	ra,0xffffe
    80006b98:	794080e7          	jalr	1940(ra) # 80005328 <ilock>
    stati(f->ip, &st);
    80006b9c:	fc843783          	ld	a5,-56(s0)
    80006ba0:	6f9c                	ld	a5,24(a5)
    80006ba2:	fd040713          	addi	a4,s0,-48
    80006ba6:	85ba                	mv	a1,a4
    80006ba8:	853e                	mv	a0,a5
    80006baa:	fffff097          	auipc	ra,0xfffff
    80006bae:	cd0080e7          	jalr	-816(ra) # 8000587a <stati>
    iunlock(f->ip);
    80006bb2:	fc843783          	ld	a5,-56(s0)
    80006bb6:	6f9c                	ld	a5,24(a5)
    80006bb8:	853e                	mv	a0,a5
    80006bba:	fffff097          	auipc	ra,0xfffff
    80006bbe:	8a2080e7          	jalr	-1886(ra) # 8000545c <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006bc2:	fe843783          	ld	a5,-24(s0)
    80006bc6:	6bbc                	ld	a5,80(a5)
    80006bc8:	fd040713          	addi	a4,s0,-48
    80006bcc:	46e1                	li	a3,24
    80006bce:	863a                	mv	a2,a4
    80006bd0:	fc043583          	ld	a1,-64(s0)
    80006bd4:	853e                	mv	a0,a5
    80006bd6:	ffffc097          	auipc	ra,0xffffc
    80006bda:	92a080e7          	jalr	-1750(ra) # 80002500 <copyout>
    80006bde:	87aa                	mv	a5,a0
    80006be0:	0007d463          	bgez	a5,80006be8 <filestat+0x94>
      return -1;
    80006be4:	57fd                	li	a5,-1
    80006be6:	a021                	j	80006bee <filestat+0x9a>
    return 0;
    80006be8:	4781                	li	a5,0
    80006bea:	a011                	j	80006bee <filestat+0x9a>
  }
  return -1;
    80006bec:	57fd                	li	a5,-1
}
    80006bee:	853e                	mv	a0,a5
    80006bf0:	70e2                	ld	ra,56(sp)
    80006bf2:	7442                	ld	s0,48(sp)
    80006bf4:	6121                	addi	sp,sp,64
    80006bf6:	8082                	ret

0000000080006bf8 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006bf8:	7139                	addi	sp,sp,-64
    80006bfa:	fc06                	sd	ra,56(sp)
    80006bfc:	f822                	sd	s0,48(sp)
    80006bfe:	0080                	addi	s0,sp,64
    80006c00:	fca43c23          	sd	a0,-40(s0)
    80006c04:	fcb43823          	sd	a1,-48(s0)
    80006c08:	87b2                	mv	a5,a2
    80006c0a:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006c0e:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006c12:	fd843783          	ld	a5,-40(s0)
    80006c16:	0087c783          	lbu	a5,8(a5)
    80006c1a:	e399                	bnez	a5,80006c20 <fileread+0x28>
    return -1;
    80006c1c:	57fd                	li	a5,-1
    80006c1e:	aa1d                	j	80006d54 <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006c20:	fd843783          	ld	a5,-40(s0)
    80006c24:	439c                	lw	a5,0(a5)
    80006c26:	873e                	mv	a4,a5
    80006c28:	4785                	li	a5,1
    80006c2a:	02f71363          	bne	a4,a5,80006c50 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006c2e:	fd843783          	ld	a5,-40(s0)
    80006c32:	6b9c                	ld	a5,16(a5)
    80006c34:	fcc42703          	lw	a4,-52(s0)
    80006c38:	863a                	mv	a2,a4
    80006c3a:	fd043583          	ld	a1,-48(s0)
    80006c3e:	853e                	mv	a0,a5
    80006c40:	00000097          	auipc	ra,0x0
    80006c44:	670080e7          	jalr	1648(ra) # 800072b0 <piperead>
    80006c48:	87aa                	mv	a5,a0
    80006c4a:	fef42623          	sw	a5,-20(s0)
    80006c4e:	a209                	j	80006d50 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006c50:	fd843783          	ld	a5,-40(s0)
    80006c54:	439c                	lw	a5,0(a5)
    80006c56:	873e                	mv	a4,a5
    80006c58:	478d                	li	a5,3
    80006c5a:	06f71863          	bne	a4,a5,80006cca <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006c5e:	fd843783          	ld	a5,-40(s0)
    80006c62:	02479783          	lh	a5,36(a5)
    80006c66:	2781                	sext.w	a5,a5
    80006c68:	0207c863          	bltz	a5,80006c98 <fileread+0xa0>
    80006c6c:	fd843783          	ld	a5,-40(s0)
    80006c70:	02479783          	lh	a5,36(a5)
    80006c74:	0007871b          	sext.w	a4,a5
    80006c78:	47a5                	li	a5,9
    80006c7a:	00e7cf63          	blt	a5,a4,80006c98 <fileread+0xa0>
    80006c7e:	fd843783          	ld	a5,-40(s0)
    80006c82:	02479783          	lh	a5,36(a5)
    80006c86:	2781                	sext.w	a5,a5
    80006c88:	0001e717          	auipc	a4,0x1e
    80006c8c:	02870713          	addi	a4,a4,40 # 80024cb0 <devsw>
    80006c90:	0792                	slli	a5,a5,0x4
    80006c92:	97ba                	add	a5,a5,a4
    80006c94:	639c                	ld	a5,0(a5)
    80006c96:	e399                	bnez	a5,80006c9c <fileread+0xa4>
      return -1;
    80006c98:	57fd                	li	a5,-1
    80006c9a:	a86d                	j	80006d54 <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006c9c:	fd843783          	ld	a5,-40(s0)
    80006ca0:	02479783          	lh	a5,36(a5)
    80006ca4:	2781                	sext.w	a5,a5
    80006ca6:	0001e717          	auipc	a4,0x1e
    80006caa:	00a70713          	addi	a4,a4,10 # 80024cb0 <devsw>
    80006cae:	0792                	slli	a5,a5,0x4
    80006cb0:	97ba                	add	a5,a5,a4
    80006cb2:	6398                	ld	a4,0(a5)
    80006cb4:	fcc42783          	lw	a5,-52(s0)
    80006cb8:	863e                	mv	a2,a5
    80006cba:	fd043583          	ld	a1,-48(s0)
    80006cbe:	4505                	li	a0,1
    80006cc0:	9702                	jalr	a4
    80006cc2:	87aa                	mv	a5,a0
    80006cc4:	fef42623          	sw	a5,-20(s0)
    80006cc8:	a061                	j	80006d50 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006cca:	fd843783          	ld	a5,-40(s0)
    80006cce:	439c                	lw	a5,0(a5)
    80006cd0:	873e                	mv	a4,a5
    80006cd2:	4789                	li	a5,2
    80006cd4:	06f71663          	bne	a4,a5,80006d40 <fileread+0x148>
    ilock(f->ip);
    80006cd8:	fd843783          	ld	a5,-40(s0)
    80006cdc:	6f9c                	ld	a5,24(a5)
    80006cde:	853e                	mv	a0,a5
    80006ce0:	ffffe097          	auipc	ra,0xffffe
    80006ce4:	648080e7          	jalr	1608(ra) # 80005328 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006ce8:	fd843783          	ld	a5,-40(s0)
    80006cec:	6f88                	ld	a0,24(a5)
    80006cee:	fd843783          	ld	a5,-40(s0)
    80006cf2:	539c                	lw	a5,32(a5)
    80006cf4:	fcc42703          	lw	a4,-52(s0)
    80006cf8:	86be                	mv	a3,a5
    80006cfa:	fd043603          	ld	a2,-48(s0)
    80006cfe:	4585                	li	a1,1
    80006d00:	fffff097          	auipc	ra,0xfffff
    80006d04:	bde080e7          	jalr	-1058(ra) # 800058de <readi>
    80006d08:	87aa                	mv	a5,a0
    80006d0a:	fef42623          	sw	a5,-20(s0)
    80006d0e:	fec42783          	lw	a5,-20(s0)
    80006d12:	2781                	sext.w	a5,a5
    80006d14:	00f05d63          	blez	a5,80006d2e <fileread+0x136>
      f->off += r;
    80006d18:	fd843783          	ld	a5,-40(s0)
    80006d1c:	5398                	lw	a4,32(a5)
    80006d1e:	fec42783          	lw	a5,-20(s0)
    80006d22:	9fb9                	addw	a5,a5,a4
    80006d24:	0007871b          	sext.w	a4,a5
    80006d28:	fd843783          	ld	a5,-40(s0)
    80006d2c:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006d2e:	fd843783          	ld	a5,-40(s0)
    80006d32:	6f9c                	ld	a5,24(a5)
    80006d34:	853e                	mv	a0,a5
    80006d36:	ffffe097          	auipc	ra,0xffffe
    80006d3a:	726080e7          	jalr	1830(ra) # 8000545c <iunlock>
    80006d3e:	a809                	j	80006d50 <fileread+0x158>
  } else {
    panic("fileread");
    80006d40:	00006517          	auipc	a0,0x6
    80006d44:	89850513          	addi	a0,a0,-1896 # 8000c5d8 <etext+0x5d8>
    80006d48:	ffffa097          	auipc	ra,0xffffa
    80006d4c:	f44080e7          	jalr	-188(ra) # 80000c8c <panic>
  }

  return r;
    80006d50:	fec42783          	lw	a5,-20(s0)
}
    80006d54:	853e                	mv	a0,a5
    80006d56:	70e2                	ld	ra,56(sp)
    80006d58:	7442                	ld	s0,48(sp)
    80006d5a:	6121                	addi	sp,sp,64
    80006d5c:	8082                	ret

0000000080006d5e <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006d5e:	715d                	addi	sp,sp,-80
    80006d60:	e486                	sd	ra,72(sp)
    80006d62:	e0a2                	sd	s0,64(sp)
    80006d64:	0880                	addi	s0,sp,80
    80006d66:	fca43423          	sd	a0,-56(s0)
    80006d6a:	fcb43023          	sd	a1,-64(s0)
    80006d6e:	87b2                	mv	a5,a2
    80006d70:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006d74:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006d78:	fc843783          	ld	a5,-56(s0)
    80006d7c:	0097c783          	lbu	a5,9(a5)
    80006d80:	e399                	bnez	a5,80006d86 <filewrite+0x28>
    return -1;
    80006d82:	57fd                	li	a5,-1
    80006d84:	aad1                	j	80006f58 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006d86:	fc843783          	ld	a5,-56(s0)
    80006d8a:	439c                	lw	a5,0(a5)
    80006d8c:	873e                	mv	a4,a5
    80006d8e:	4785                	li	a5,1
    80006d90:	02f71363          	bne	a4,a5,80006db6 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006d94:	fc843783          	ld	a5,-56(s0)
    80006d98:	6b9c                	ld	a5,16(a5)
    80006d9a:	fbc42703          	lw	a4,-68(s0)
    80006d9e:	863a                	mv	a2,a4
    80006da0:	fc043583          	ld	a1,-64(s0)
    80006da4:	853e                	mv	a0,a5
    80006da6:	00000097          	auipc	ra,0x0
    80006daa:	3b8080e7          	jalr	952(ra) # 8000715e <pipewrite>
    80006dae:	87aa                	mv	a5,a0
    80006db0:	fef42623          	sw	a5,-20(s0)
    80006db4:	a245                	j	80006f54 <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006db6:	fc843783          	ld	a5,-56(s0)
    80006dba:	439c                	lw	a5,0(a5)
    80006dbc:	873e                	mv	a4,a5
    80006dbe:	478d                	li	a5,3
    80006dc0:	06f71863          	bne	a4,a5,80006e30 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006dc4:	fc843783          	ld	a5,-56(s0)
    80006dc8:	02479783          	lh	a5,36(a5)
    80006dcc:	2781                	sext.w	a5,a5
    80006dce:	0207c863          	bltz	a5,80006dfe <filewrite+0xa0>
    80006dd2:	fc843783          	ld	a5,-56(s0)
    80006dd6:	02479783          	lh	a5,36(a5)
    80006dda:	0007871b          	sext.w	a4,a5
    80006dde:	47a5                	li	a5,9
    80006de0:	00e7cf63          	blt	a5,a4,80006dfe <filewrite+0xa0>
    80006de4:	fc843783          	ld	a5,-56(s0)
    80006de8:	02479783          	lh	a5,36(a5)
    80006dec:	2781                	sext.w	a5,a5
    80006dee:	0001e717          	auipc	a4,0x1e
    80006df2:	ec270713          	addi	a4,a4,-318 # 80024cb0 <devsw>
    80006df6:	0792                	slli	a5,a5,0x4
    80006df8:	97ba                	add	a5,a5,a4
    80006dfa:	679c                	ld	a5,8(a5)
    80006dfc:	e399                	bnez	a5,80006e02 <filewrite+0xa4>
      return -1;
    80006dfe:	57fd                	li	a5,-1
    80006e00:	aaa1                	j	80006f58 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006e02:	fc843783          	ld	a5,-56(s0)
    80006e06:	02479783          	lh	a5,36(a5)
    80006e0a:	2781                	sext.w	a5,a5
    80006e0c:	0001e717          	auipc	a4,0x1e
    80006e10:	ea470713          	addi	a4,a4,-348 # 80024cb0 <devsw>
    80006e14:	0792                	slli	a5,a5,0x4
    80006e16:	97ba                	add	a5,a5,a4
    80006e18:	6798                	ld	a4,8(a5)
    80006e1a:	fbc42783          	lw	a5,-68(s0)
    80006e1e:	863e                	mv	a2,a5
    80006e20:	fc043583          	ld	a1,-64(s0)
    80006e24:	4505                	li	a0,1
    80006e26:	9702                	jalr	a4
    80006e28:	87aa                	mv	a5,a0
    80006e2a:	fef42623          	sw	a5,-20(s0)
    80006e2e:	a21d                	j	80006f54 <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006e30:	fc843783          	ld	a5,-56(s0)
    80006e34:	439c                	lw	a5,0(a5)
    80006e36:	873e                	mv	a4,a5
    80006e38:	4789                	li	a5,2
    80006e3a:	10f71563          	bne	a4,a5,80006f44 <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006e3e:	6785                	lui	a5,0x1
    80006e40:	c007879b          	addiw	a5,a5,-1024
    80006e44:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006e48:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006e4c:	a0d9                	j	80006f12 <filewrite+0x1b4>
      int n1 = n - i;
    80006e4e:	fbc42703          	lw	a4,-68(s0)
    80006e52:	fe842783          	lw	a5,-24(s0)
    80006e56:	40f707bb          	subw	a5,a4,a5
    80006e5a:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006e5e:	fe442703          	lw	a4,-28(s0)
    80006e62:	fe042783          	lw	a5,-32(s0)
    80006e66:	2701                	sext.w	a4,a4
    80006e68:	2781                	sext.w	a5,a5
    80006e6a:	00e7d663          	bge	a5,a4,80006e76 <filewrite+0x118>
        n1 = max;
    80006e6e:	fe042783          	lw	a5,-32(s0)
    80006e72:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006e76:	fffff097          	auipc	ra,0xfffff
    80006e7a:	53c080e7          	jalr	1340(ra) # 800063b2 <begin_op>
      ilock(f->ip);
    80006e7e:	fc843783          	ld	a5,-56(s0)
    80006e82:	6f9c                	ld	a5,24(a5)
    80006e84:	853e                	mv	a0,a5
    80006e86:	ffffe097          	auipc	ra,0xffffe
    80006e8a:	4a2080e7          	jalr	1186(ra) # 80005328 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006e8e:	fc843783          	ld	a5,-56(s0)
    80006e92:	6f88                	ld	a0,24(a5)
    80006e94:	fe842703          	lw	a4,-24(s0)
    80006e98:	fc043783          	ld	a5,-64(s0)
    80006e9c:	00f70633          	add	a2,a4,a5
    80006ea0:	fc843783          	ld	a5,-56(s0)
    80006ea4:	539c                	lw	a5,32(a5)
    80006ea6:	fe442703          	lw	a4,-28(s0)
    80006eaa:	86be                	mv	a3,a5
    80006eac:	4585                	li	a1,1
    80006eae:	fffff097          	auipc	ra,0xfffff
    80006eb2:	bc8080e7          	jalr	-1080(ra) # 80005a76 <writei>
    80006eb6:	87aa                	mv	a5,a0
    80006eb8:	fcf42e23          	sw	a5,-36(s0)
    80006ebc:	fdc42783          	lw	a5,-36(s0)
    80006ec0:	2781                	sext.w	a5,a5
    80006ec2:	00f05d63          	blez	a5,80006edc <filewrite+0x17e>
        f->off += r;
    80006ec6:	fc843783          	ld	a5,-56(s0)
    80006eca:	5398                	lw	a4,32(a5)
    80006ecc:	fdc42783          	lw	a5,-36(s0)
    80006ed0:	9fb9                	addw	a5,a5,a4
    80006ed2:	0007871b          	sext.w	a4,a5
    80006ed6:	fc843783          	ld	a5,-56(s0)
    80006eda:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006edc:	fc843783          	ld	a5,-56(s0)
    80006ee0:	6f9c                	ld	a5,24(a5)
    80006ee2:	853e                	mv	a0,a5
    80006ee4:	ffffe097          	auipc	ra,0xffffe
    80006ee8:	578080e7          	jalr	1400(ra) # 8000545c <iunlock>
      end_op();
    80006eec:	fffff097          	auipc	ra,0xfffff
    80006ef0:	588080e7          	jalr	1416(ra) # 80006474 <end_op>

      if(r != n1){
    80006ef4:	fdc42703          	lw	a4,-36(s0)
    80006ef8:	fe442783          	lw	a5,-28(s0)
    80006efc:	2701                	sext.w	a4,a4
    80006efe:	2781                	sext.w	a5,a5
    80006f00:	02f71263          	bne	a4,a5,80006f24 <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006f04:	fe842703          	lw	a4,-24(s0)
    80006f08:	fdc42783          	lw	a5,-36(s0)
    80006f0c:	9fb9                	addw	a5,a5,a4
    80006f0e:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006f12:	fe842703          	lw	a4,-24(s0)
    80006f16:	fbc42783          	lw	a5,-68(s0)
    80006f1a:	2701                	sext.w	a4,a4
    80006f1c:	2781                	sext.w	a5,a5
    80006f1e:	f2f748e3          	blt	a4,a5,80006e4e <filewrite+0xf0>
    80006f22:	a011                	j	80006f26 <filewrite+0x1c8>
        break;
    80006f24:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006f26:	fe842703          	lw	a4,-24(s0)
    80006f2a:	fbc42783          	lw	a5,-68(s0)
    80006f2e:	2701                	sext.w	a4,a4
    80006f30:	2781                	sext.w	a5,a5
    80006f32:	00f71563          	bne	a4,a5,80006f3c <filewrite+0x1de>
    80006f36:	fbc42783          	lw	a5,-68(s0)
    80006f3a:	a011                	j	80006f3e <filewrite+0x1e0>
    80006f3c:	57fd                	li	a5,-1
    80006f3e:	fef42623          	sw	a5,-20(s0)
    80006f42:	a809                	j	80006f54 <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006f44:	00005517          	auipc	a0,0x5
    80006f48:	6a450513          	addi	a0,a0,1700 # 8000c5e8 <etext+0x5e8>
    80006f4c:	ffffa097          	auipc	ra,0xffffa
    80006f50:	d40080e7          	jalr	-704(ra) # 80000c8c <panic>
  }

  return ret;
    80006f54:	fec42783          	lw	a5,-20(s0)
}
    80006f58:	853e                	mv	a0,a5
    80006f5a:	60a6                	ld	ra,72(sp)
    80006f5c:	6406                	ld	s0,64(sp)
    80006f5e:	6161                	addi	sp,sp,80
    80006f60:	8082                	ret

0000000080006f62 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006f62:	7179                	addi	sp,sp,-48
    80006f64:	f406                	sd	ra,40(sp)
    80006f66:	f022                	sd	s0,32(sp)
    80006f68:	1800                	addi	s0,sp,48
    80006f6a:	fca43c23          	sd	a0,-40(s0)
    80006f6e:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006f72:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006f76:	fd043783          	ld	a5,-48(s0)
    80006f7a:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006f7e:	fd043783          	ld	a5,-48(s0)
    80006f82:	6398                	ld	a4,0(a5)
    80006f84:	fd843783          	ld	a5,-40(s0)
    80006f88:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006f8a:	00000097          	auipc	ra,0x0
    80006f8e:	9d8080e7          	jalr	-1576(ra) # 80006962 <filealloc>
    80006f92:	872a                	mv	a4,a0
    80006f94:	fd843783          	ld	a5,-40(s0)
    80006f98:	e398                	sd	a4,0(a5)
    80006f9a:	fd843783          	ld	a5,-40(s0)
    80006f9e:	639c                	ld	a5,0(a5)
    80006fa0:	c3e9                	beqz	a5,80007062 <pipealloc+0x100>
    80006fa2:	00000097          	auipc	ra,0x0
    80006fa6:	9c0080e7          	jalr	-1600(ra) # 80006962 <filealloc>
    80006faa:	872a                	mv	a4,a0
    80006fac:	fd043783          	ld	a5,-48(s0)
    80006fb0:	e398                	sd	a4,0(a5)
    80006fb2:	fd043783          	ld	a5,-48(s0)
    80006fb6:	639c                	ld	a5,0(a5)
    80006fb8:	c7cd                	beqz	a5,80007062 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006fba:	ffffa097          	auipc	ra,0xffffa
    80006fbe:	21c080e7          	jalr	540(ra) # 800011d6 <kalloc>
    80006fc2:	fea43423          	sd	a0,-24(s0)
    80006fc6:	fe843783          	ld	a5,-24(s0)
    80006fca:	cfd1                	beqz	a5,80007066 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006fcc:	fe843783          	ld	a5,-24(s0)
    80006fd0:	4705                	li	a4,1
    80006fd2:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006fd6:	fe843783          	ld	a5,-24(s0)
    80006fda:	4705                	li	a4,1
    80006fdc:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006fe0:	fe843783          	ld	a5,-24(s0)
    80006fe4:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006fe8:	fe843783          	ld	a5,-24(s0)
    80006fec:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006ff0:	fe843783          	ld	a5,-24(s0)
    80006ff4:	00005597          	auipc	a1,0x5
    80006ff8:	60458593          	addi	a1,a1,1540 # 8000c5f8 <etext+0x5f8>
    80006ffc:	853e                	mv	a0,a5
    80006ffe:	ffffa097          	auipc	ra,0xffffa
    80007002:	30e080e7          	jalr	782(ra) # 8000130c <initlock>
  (*f0)->type = FD_PIPE;
    80007006:	fd843783          	ld	a5,-40(s0)
    8000700a:	639c                	ld	a5,0(a5)
    8000700c:	4705                	li	a4,1
    8000700e:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80007010:	fd843783          	ld	a5,-40(s0)
    80007014:	639c                	ld	a5,0(a5)
    80007016:	4705                	li	a4,1
    80007018:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    8000701c:	fd843783          	ld	a5,-40(s0)
    80007020:	639c                	ld	a5,0(a5)
    80007022:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80007026:	fd843783          	ld	a5,-40(s0)
    8000702a:	639c                	ld	a5,0(a5)
    8000702c:	fe843703          	ld	a4,-24(s0)
    80007030:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80007032:	fd043783          	ld	a5,-48(s0)
    80007036:	639c                	ld	a5,0(a5)
    80007038:	4705                	li	a4,1
    8000703a:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    8000703c:	fd043783          	ld	a5,-48(s0)
    80007040:	639c                	ld	a5,0(a5)
    80007042:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80007046:	fd043783          	ld	a5,-48(s0)
    8000704a:	639c                	ld	a5,0(a5)
    8000704c:	4705                	li	a4,1
    8000704e:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80007052:	fd043783          	ld	a5,-48(s0)
    80007056:	639c                	ld	a5,0(a5)
    80007058:	fe843703          	ld	a4,-24(s0)
    8000705c:	eb98                	sd	a4,16(a5)
  return 0;
    8000705e:	4781                	li	a5,0
    80007060:	a0b1                	j	800070ac <pipealloc+0x14a>
    goto bad;
    80007062:	0001                	nop
    80007064:	a011                	j	80007068 <pipealloc+0x106>
    goto bad;
    80007066:	0001                	nop

 bad:
  if(pi)
    80007068:	fe843783          	ld	a5,-24(s0)
    8000706c:	c799                	beqz	a5,8000707a <pipealloc+0x118>
    kfree((char*)pi);
    8000706e:	fe843503          	ld	a0,-24(s0)
    80007072:	ffffa097          	auipc	ra,0xffffa
    80007076:	0be080e7          	jalr	190(ra) # 80001130 <kfree>
  if(*f0)
    8000707a:	fd843783          	ld	a5,-40(s0)
    8000707e:	639c                	ld	a5,0(a5)
    80007080:	cb89                	beqz	a5,80007092 <pipealloc+0x130>
    fileclose(*f0);
    80007082:	fd843783          	ld	a5,-40(s0)
    80007086:	639c                	ld	a5,0(a5)
    80007088:	853e                	mv	a0,a5
    8000708a:	00000097          	auipc	ra,0x0
    8000708e:	9c2080e7          	jalr	-1598(ra) # 80006a4c <fileclose>
  if(*f1)
    80007092:	fd043783          	ld	a5,-48(s0)
    80007096:	639c                	ld	a5,0(a5)
    80007098:	cb89                	beqz	a5,800070aa <pipealloc+0x148>
    fileclose(*f1);
    8000709a:	fd043783          	ld	a5,-48(s0)
    8000709e:	639c                	ld	a5,0(a5)
    800070a0:	853e                	mv	a0,a5
    800070a2:	00000097          	auipc	ra,0x0
    800070a6:	9aa080e7          	jalr	-1622(ra) # 80006a4c <fileclose>
  return -1;
    800070aa:	57fd                	li	a5,-1
}
    800070ac:	853e                	mv	a0,a5
    800070ae:	70a2                	ld	ra,40(sp)
    800070b0:	7402                	ld	s0,32(sp)
    800070b2:	6145                	addi	sp,sp,48
    800070b4:	8082                	ret

00000000800070b6 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    800070b6:	1101                	addi	sp,sp,-32
    800070b8:	ec06                	sd	ra,24(sp)
    800070ba:	e822                	sd	s0,16(sp)
    800070bc:	1000                	addi	s0,sp,32
    800070be:	fea43423          	sd	a0,-24(s0)
    800070c2:	87ae                	mv	a5,a1
    800070c4:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    800070c8:	fe843783          	ld	a5,-24(s0)
    800070cc:	853e                	mv	a0,a5
    800070ce:	ffffa097          	auipc	ra,0xffffa
    800070d2:	26e080e7          	jalr	622(ra) # 8000133c <acquire>
  if(writable){
    800070d6:	fe442783          	lw	a5,-28(s0)
    800070da:	2781                	sext.w	a5,a5
    800070dc:	cf99                	beqz	a5,800070fa <pipeclose+0x44>
    pi->writeopen = 0;
    800070de:	fe843783          	ld	a5,-24(s0)
    800070e2:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800070e6:	fe843783          	ld	a5,-24(s0)
    800070ea:	21878793          	addi	a5,a5,536
    800070ee:	853e                	mv	a0,a5
    800070f0:	ffffc097          	auipc	ra,0xffffc
    800070f4:	5c4080e7          	jalr	1476(ra) # 800036b4 <wakeup>
    800070f8:	a831                	j	80007114 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800070fa:	fe843783          	ld	a5,-24(s0)
    800070fe:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    80007102:	fe843783          	ld	a5,-24(s0)
    80007106:	21c78793          	addi	a5,a5,540
    8000710a:	853e                	mv	a0,a5
    8000710c:	ffffc097          	auipc	ra,0xffffc
    80007110:	5a8080e7          	jalr	1448(ra) # 800036b4 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    80007114:	fe843783          	ld	a5,-24(s0)
    80007118:	2207a783          	lw	a5,544(a5)
    8000711c:	e785                	bnez	a5,80007144 <pipeclose+0x8e>
    8000711e:	fe843783          	ld	a5,-24(s0)
    80007122:	2247a783          	lw	a5,548(a5)
    80007126:	ef99                	bnez	a5,80007144 <pipeclose+0x8e>
    release(&pi->lock);
    80007128:	fe843783          	ld	a5,-24(s0)
    8000712c:	853e                	mv	a0,a5
    8000712e:	ffffa097          	auipc	ra,0xffffa
    80007132:	272080e7          	jalr	626(ra) # 800013a0 <release>
    kfree((char*)pi);
    80007136:	fe843503          	ld	a0,-24(s0)
    8000713a:	ffffa097          	auipc	ra,0xffffa
    8000713e:	ff6080e7          	jalr	-10(ra) # 80001130 <kfree>
    80007142:	a809                	j	80007154 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80007144:	fe843783          	ld	a5,-24(s0)
    80007148:	853e                	mv	a0,a5
    8000714a:	ffffa097          	auipc	ra,0xffffa
    8000714e:	256080e7          	jalr	598(ra) # 800013a0 <release>
}
    80007152:	0001                	nop
    80007154:	0001                	nop
    80007156:	60e2                	ld	ra,24(sp)
    80007158:	6442                	ld	s0,16(sp)
    8000715a:	6105                	addi	sp,sp,32
    8000715c:	8082                	ret

000000008000715e <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8000715e:	715d                	addi	sp,sp,-80
    80007160:	e486                	sd	ra,72(sp)
    80007162:	e0a2                	sd	s0,64(sp)
    80007164:	0880                	addi	s0,sp,80
    80007166:	fca43423          	sd	a0,-56(s0)
    8000716a:	fcb43023          	sd	a1,-64(s0)
    8000716e:	87b2                	mv	a5,a2
    80007170:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80007174:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007178:	ffffc097          	auipc	ra,0xffffc
    8000717c:	8be080e7          	jalr	-1858(ra) # 80002a36 <myproc>
    80007180:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80007184:	fc843783          	ld	a5,-56(s0)
    80007188:	853e                	mv	a0,a5
    8000718a:	ffffa097          	auipc	ra,0xffffa
    8000718e:	1b2080e7          	jalr	434(ra) # 8000133c <acquire>
  while(i < n){
    80007192:	a8f1                	j	8000726e <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    80007194:	fc843783          	ld	a5,-56(s0)
    80007198:	2207a783          	lw	a5,544(a5)
    8000719c:	cb89                	beqz	a5,800071ae <pipewrite+0x50>
    8000719e:	fe043503          	ld	a0,-32(s0)
    800071a2:	ffffc097          	auipc	ra,0xffffc
    800071a6:	6a4080e7          	jalr	1700(ra) # 80003846 <killed>
    800071aa:	87aa                	mv	a5,a0
    800071ac:	cb91                	beqz	a5,800071c0 <pipewrite+0x62>
      release(&pi->lock);
    800071ae:	fc843783          	ld	a5,-56(s0)
    800071b2:	853e                	mv	a0,a5
    800071b4:	ffffa097          	auipc	ra,0xffffa
    800071b8:	1ec080e7          	jalr	492(ra) # 800013a0 <release>
      return -1;
    800071bc:	57fd                	li	a5,-1
    800071be:	a0e5                	j	800072a6 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    800071c0:	fc843783          	ld	a5,-56(s0)
    800071c4:	21c7a703          	lw	a4,540(a5)
    800071c8:	fc843783          	ld	a5,-56(s0)
    800071cc:	2187a783          	lw	a5,536(a5)
    800071d0:	2007879b          	addiw	a5,a5,512
    800071d4:	2781                	sext.w	a5,a5
    800071d6:	02f71863          	bne	a4,a5,80007206 <pipewrite+0xa8>
      wakeup(&pi->nread);
    800071da:	fc843783          	ld	a5,-56(s0)
    800071de:	21878793          	addi	a5,a5,536
    800071e2:	853e                	mv	a0,a5
    800071e4:	ffffc097          	auipc	ra,0xffffc
    800071e8:	4d0080e7          	jalr	1232(ra) # 800036b4 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800071ec:	fc843783          	ld	a5,-56(s0)
    800071f0:	21c78793          	addi	a5,a5,540
    800071f4:	fc843703          	ld	a4,-56(s0)
    800071f8:	85ba                	mv	a1,a4
    800071fa:	853e                	mv	a0,a5
    800071fc:	ffffc097          	auipc	ra,0xffffc
    80007200:	43c080e7          	jalr	1084(ra) # 80003638 <sleep>
    80007204:	a0ad                	j	8000726e <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    80007206:	fe043783          	ld	a5,-32(s0)
    8000720a:	6ba8                	ld	a0,80(a5)
    8000720c:	fec42703          	lw	a4,-20(s0)
    80007210:	fc043783          	ld	a5,-64(s0)
    80007214:	973e                	add	a4,a4,a5
    80007216:	fdf40793          	addi	a5,s0,-33
    8000721a:	4685                	li	a3,1
    8000721c:	863a                	mv	a2,a4
    8000721e:	85be                	mv	a1,a5
    80007220:	ffffb097          	auipc	ra,0xffffb
    80007224:	3ae080e7          	jalr	942(ra) # 800025ce <copyin>
    80007228:	87aa                	mv	a5,a0
    8000722a:	873e                	mv	a4,a5
    8000722c:	57fd                	li	a5,-1
    8000722e:	04f70963          	beq	a4,a5,80007280 <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    80007232:	fc843783          	ld	a5,-56(s0)
    80007236:	21c7a783          	lw	a5,540(a5)
    8000723a:	2781                	sext.w	a5,a5
    8000723c:	0017871b          	addiw	a4,a5,1
    80007240:	0007069b          	sext.w	a3,a4
    80007244:	fc843703          	ld	a4,-56(s0)
    80007248:	20d72e23          	sw	a3,540(a4)
    8000724c:	1ff7f793          	andi	a5,a5,511
    80007250:	2781                	sext.w	a5,a5
    80007252:	fdf44703          	lbu	a4,-33(s0)
    80007256:	fc843683          	ld	a3,-56(s0)
    8000725a:	1782                	slli	a5,a5,0x20
    8000725c:	9381                	srli	a5,a5,0x20
    8000725e:	97b6                	add	a5,a5,a3
    80007260:	00e78c23          	sb	a4,24(a5)
      i++;
    80007264:	fec42783          	lw	a5,-20(s0)
    80007268:	2785                	addiw	a5,a5,1
    8000726a:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    8000726e:	fec42703          	lw	a4,-20(s0)
    80007272:	fbc42783          	lw	a5,-68(s0)
    80007276:	2701                	sext.w	a4,a4
    80007278:	2781                	sext.w	a5,a5
    8000727a:	f0f74de3          	blt	a4,a5,80007194 <pipewrite+0x36>
    8000727e:	a011                	j	80007282 <pipewrite+0x124>
        break;
    80007280:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007282:	fc843783          	ld	a5,-56(s0)
    80007286:	21878793          	addi	a5,a5,536
    8000728a:	853e                	mv	a0,a5
    8000728c:	ffffc097          	auipc	ra,0xffffc
    80007290:	428080e7          	jalr	1064(ra) # 800036b4 <wakeup>
  release(&pi->lock);
    80007294:	fc843783          	ld	a5,-56(s0)
    80007298:	853e                	mv	a0,a5
    8000729a:	ffffa097          	auipc	ra,0xffffa
    8000729e:	106080e7          	jalr	262(ra) # 800013a0 <release>

  return i;
    800072a2:	fec42783          	lw	a5,-20(s0)
}
    800072a6:	853e                	mv	a0,a5
    800072a8:	60a6                	ld	ra,72(sp)
    800072aa:	6406                	ld	s0,64(sp)
    800072ac:	6161                	addi	sp,sp,80
    800072ae:	8082                	ret

00000000800072b0 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    800072b0:	715d                	addi	sp,sp,-80
    800072b2:	e486                	sd	ra,72(sp)
    800072b4:	e0a2                	sd	s0,64(sp)
    800072b6:	0880                	addi	s0,sp,80
    800072b8:	fca43423          	sd	a0,-56(s0)
    800072bc:	fcb43023          	sd	a1,-64(s0)
    800072c0:	87b2                	mv	a5,a2
    800072c2:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    800072c6:	ffffb097          	auipc	ra,0xffffb
    800072ca:	770080e7          	jalr	1904(ra) # 80002a36 <myproc>
    800072ce:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800072d2:	fc843783          	ld	a5,-56(s0)
    800072d6:	853e                	mv	a0,a5
    800072d8:	ffffa097          	auipc	ra,0xffffa
    800072dc:	064080e7          	jalr	100(ra) # 8000133c <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800072e0:	a835                	j	8000731c <piperead+0x6c>
    if(killed(pr)){
    800072e2:	fe043503          	ld	a0,-32(s0)
    800072e6:	ffffc097          	auipc	ra,0xffffc
    800072ea:	560080e7          	jalr	1376(ra) # 80003846 <killed>
    800072ee:	87aa                	mv	a5,a0
    800072f0:	cb91                	beqz	a5,80007304 <piperead+0x54>
      release(&pi->lock);
    800072f2:	fc843783          	ld	a5,-56(s0)
    800072f6:	853e                	mv	a0,a5
    800072f8:	ffffa097          	auipc	ra,0xffffa
    800072fc:	0a8080e7          	jalr	168(ra) # 800013a0 <release>
      return -1;
    80007300:	57fd                	li	a5,-1
    80007302:	a8dd                	j	800073f8 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    80007304:	fc843783          	ld	a5,-56(s0)
    80007308:	21878793          	addi	a5,a5,536
    8000730c:	fc843703          	ld	a4,-56(s0)
    80007310:	85ba                	mv	a1,a4
    80007312:	853e                	mv	a0,a5
    80007314:	ffffc097          	auipc	ra,0xffffc
    80007318:	324080e7          	jalr	804(ra) # 80003638 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000731c:	fc843783          	ld	a5,-56(s0)
    80007320:	2187a703          	lw	a4,536(a5)
    80007324:	fc843783          	ld	a5,-56(s0)
    80007328:	21c7a783          	lw	a5,540(a5)
    8000732c:	00f71763          	bne	a4,a5,8000733a <piperead+0x8a>
    80007330:	fc843783          	ld	a5,-56(s0)
    80007334:	2247a783          	lw	a5,548(a5)
    80007338:	f7cd                	bnez	a5,800072e2 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000733a:	fe042623          	sw	zero,-20(s0)
    8000733e:	a8bd                	j	800073bc <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    80007340:	fc843783          	ld	a5,-56(s0)
    80007344:	2187a703          	lw	a4,536(a5)
    80007348:	fc843783          	ld	a5,-56(s0)
    8000734c:	21c7a783          	lw	a5,540(a5)
    80007350:	06f70f63          	beq	a4,a5,800073ce <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    80007354:	fc843783          	ld	a5,-56(s0)
    80007358:	2187a783          	lw	a5,536(a5)
    8000735c:	2781                	sext.w	a5,a5
    8000735e:	0017871b          	addiw	a4,a5,1
    80007362:	0007069b          	sext.w	a3,a4
    80007366:	fc843703          	ld	a4,-56(s0)
    8000736a:	20d72c23          	sw	a3,536(a4)
    8000736e:	1ff7f793          	andi	a5,a5,511
    80007372:	2781                	sext.w	a5,a5
    80007374:	fc843703          	ld	a4,-56(s0)
    80007378:	1782                	slli	a5,a5,0x20
    8000737a:	9381                	srli	a5,a5,0x20
    8000737c:	97ba                	add	a5,a5,a4
    8000737e:	0187c783          	lbu	a5,24(a5)
    80007382:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007386:	fe043783          	ld	a5,-32(s0)
    8000738a:	6ba8                	ld	a0,80(a5)
    8000738c:	fec42703          	lw	a4,-20(s0)
    80007390:	fc043783          	ld	a5,-64(s0)
    80007394:	97ba                	add	a5,a5,a4
    80007396:	fdf40713          	addi	a4,s0,-33
    8000739a:	4685                	li	a3,1
    8000739c:	863a                	mv	a2,a4
    8000739e:	85be                	mv	a1,a5
    800073a0:	ffffb097          	auipc	ra,0xffffb
    800073a4:	160080e7          	jalr	352(ra) # 80002500 <copyout>
    800073a8:	87aa                	mv	a5,a0
    800073aa:	873e                	mv	a4,a5
    800073ac:	57fd                	li	a5,-1
    800073ae:	02f70263          	beq	a4,a5,800073d2 <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800073b2:	fec42783          	lw	a5,-20(s0)
    800073b6:	2785                	addiw	a5,a5,1
    800073b8:	fef42623          	sw	a5,-20(s0)
    800073bc:	fec42703          	lw	a4,-20(s0)
    800073c0:	fbc42783          	lw	a5,-68(s0)
    800073c4:	2701                	sext.w	a4,a4
    800073c6:	2781                	sext.w	a5,a5
    800073c8:	f6f74ce3          	blt	a4,a5,80007340 <piperead+0x90>
    800073cc:	a021                	j	800073d4 <piperead+0x124>
      break;
    800073ce:	0001                	nop
    800073d0:	a011                	j	800073d4 <piperead+0x124>
      break;
    800073d2:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800073d4:	fc843783          	ld	a5,-56(s0)
    800073d8:	21c78793          	addi	a5,a5,540
    800073dc:	853e                	mv	a0,a5
    800073de:	ffffc097          	auipc	ra,0xffffc
    800073e2:	2d6080e7          	jalr	726(ra) # 800036b4 <wakeup>
  release(&pi->lock);
    800073e6:	fc843783          	ld	a5,-56(s0)
    800073ea:	853e                	mv	a0,a5
    800073ec:	ffffa097          	auipc	ra,0xffffa
    800073f0:	fb4080e7          	jalr	-76(ra) # 800013a0 <release>
  return i;
    800073f4:	fec42783          	lw	a5,-20(s0)
}
    800073f8:	853e                	mv	a0,a5
    800073fa:	60a6                	ld	ra,72(sp)
    800073fc:	6406                	ld	s0,64(sp)
    800073fe:	6161                	addi	sp,sp,80
    80007400:	8082                	ret

0000000080007402 <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    80007402:	7179                	addi	sp,sp,-48
    80007404:	f422                	sd	s0,40(sp)
    80007406:	1800                	addi	s0,sp,48
    80007408:	87aa                	mv	a5,a0
    8000740a:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    8000740e:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    80007412:	fdc42783          	lw	a5,-36(s0)
    80007416:	8b85                	andi	a5,a5,1
    80007418:	2781                	sext.w	a5,a5
    8000741a:	c781                	beqz	a5,80007422 <flags2perm+0x20>
      perm = PTE_X;
    8000741c:	47a1                	li	a5,8
    8000741e:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    80007422:	fdc42783          	lw	a5,-36(s0)
    80007426:	8b89                	andi	a5,a5,2
    80007428:	2781                	sext.w	a5,a5
    8000742a:	c799                	beqz	a5,80007438 <flags2perm+0x36>
      perm |= PTE_W;
    8000742c:	fec42783          	lw	a5,-20(s0)
    80007430:	0047e793          	ori	a5,a5,4
    80007434:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007438:	fec42783          	lw	a5,-20(s0)
}
    8000743c:	853e                	mv	a0,a5
    8000743e:	7422                	ld	s0,40(sp)
    80007440:	6145                	addi	sp,sp,48
    80007442:	8082                	ret

0000000080007444 <exec>:

int
exec(char *path, char **argv)
{
    80007444:	de010113          	addi	sp,sp,-544
    80007448:	20113c23          	sd	ra,536(sp)
    8000744c:	20813823          	sd	s0,528(sp)
    80007450:	20913423          	sd	s1,520(sp)
    80007454:	1400                	addi	s0,sp,544
    80007456:	dea43423          	sd	a0,-536(s0)
    8000745a:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    8000745e:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007462:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007466:	ffffb097          	auipc	ra,0xffffb
    8000746a:	5d0080e7          	jalr	1488(ra) # 80002a36 <myproc>
    8000746e:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007472:	fffff097          	auipc	ra,0xfffff
    80007476:	f40080e7          	jalr	-192(ra) # 800063b2 <begin_op>

  if((ip = namei(path)) == 0){
    8000747a:	de843503          	ld	a0,-536(s0)
    8000747e:	fffff097          	auipc	ra,0xfffff
    80007482:	bd0080e7          	jalr	-1072(ra) # 8000604e <namei>
    80007486:	faa43423          	sd	a0,-88(s0)
    8000748a:	fa843783          	ld	a5,-88(s0)
    8000748e:	e799                	bnez	a5,8000749c <exec+0x58>
    end_op();
    80007490:	fffff097          	auipc	ra,0xfffff
    80007494:	fe4080e7          	jalr	-28(ra) # 80006474 <end_op>
    return -1;
    80007498:	57fd                	li	a5,-1
    8000749a:	a1a9                	j	800078e4 <exec+0x4a0>
  }
  ilock(ip);
    8000749c:	fa843503          	ld	a0,-88(s0)
    800074a0:	ffffe097          	auipc	ra,0xffffe
    800074a4:	e88080e7          	jalr	-376(ra) # 80005328 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    800074a8:	e3040793          	addi	a5,s0,-464
    800074ac:	04000713          	li	a4,64
    800074b0:	4681                	li	a3,0
    800074b2:	863e                	mv	a2,a5
    800074b4:	4581                	li	a1,0
    800074b6:	fa843503          	ld	a0,-88(s0)
    800074ba:	ffffe097          	auipc	ra,0xffffe
    800074be:	424080e7          	jalr	1060(ra) # 800058de <readi>
    800074c2:	87aa                	mv	a5,a0
    800074c4:	873e                	mv	a4,a5
    800074c6:	04000793          	li	a5,64
    800074ca:	3af71763          	bne	a4,a5,80007878 <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800074ce:	e3042783          	lw	a5,-464(s0)
    800074d2:	873e                	mv	a4,a5
    800074d4:	464c47b7          	lui	a5,0x464c4
    800074d8:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800074dc:	3af71063          	bne	a4,a5,8000787c <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800074e0:	f9843503          	ld	a0,-104(s0)
    800074e4:	ffffb097          	auipc	ra,0xffffb
    800074e8:	7b4080e7          	jalr	1972(ra) # 80002c98 <proc_pagetable>
    800074ec:	faa43023          	sd	a0,-96(s0)
    800074f0:	fa043783          	ld	a5,-96(s0)
    800074f4:	38078663          	beqz	a5,80007880 <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800074f8:	fc042623          	sw	zero,-52(s0)
    800074fc:	e5043783          	ld	a5,-432(s0)
    80007500:	fcf42423          	sw	a5,-56(s0)
    80007504:	a0fd                	j	800075f2 <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    80007506:	df840793          	addi	a5,s0,-520
    8000750a:	fc842683          	lw	a3,-56(s0)
    8000750e:	03800713          	li	a4,56
    80007512:	863e                	mv	a2,a5
    80007514:	4581                	li	a1,0
    80007516:	fa843503          	ld	a0,-88(s0)
    8000751a:	ffffe097          	auipc	ra,0xffffe
    8000751e:	3c4080e7          	jalr	964(ra) # 800058de <readi>
    80007522:	87aa                	mv	a5,a0
    80007524:	873e                	mv	a4,a5
    80007526:	03800793          	li	a5,56
    8000752a:	34f71d63          	bne	a4,a5,80007884 <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    8000752e:	df842783          	lw	a5,-520(s0)
    80007532:	873e                	mv	a4,a5
    80007534:	4785                	li	a5,1
    80007536:	0af71163          	bne	a4,a5,800075d8 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    8000753a:	e2043703          	ld	a4,-480(s0)
    8000753e:	e1843783          	ld	a5,-488(s0)
    80007542:	34f76363          	bltu	a4,a5,80007888 <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007546:	e0843703          	ld	a4,-504(s0)
    8000754a:	e2043783          	ld	a5,-480(s0)
    8000754e:	973e                	add	a4,a4,a5
    80007550:	e0843783          	ld	a5,-504(s0)
    80007554:	32f76c63          	bltu	a4,a5,8000788c <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007558:	e0843703          	ld	a4,-504(s0)
    8000755c:	6785                	lui	a5,0x1
    8000755e:	17fd                	addi	a5,a5,-1
    80007560:	8ff9                	and	a5,a5,a4
    80007562:	32079763          	bnez	a5,80007890 <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007566:	e0843703          	ld	a4,-504(s0)
    8000756a:	e2043783          	ld	a5,-480(s0)
    8000756e:	00f704b3          	add	s1,a4,a5
    80007572:	dfc42783          	lw	a5,-516(s0)
    80007576:	2781                	sext.w	a5,a5
    80007578:	853e                	mv	a0,a5
    8000757a:	00000097          	auipc	ra,0x0
    8000757e:	e88080e7          	jalr	-376(ra) # 80007402 <flags2perm>
    80007582:	87aa                	mv	a5,a0
    80007584:	86be                	mv	a3,a5
    80007586:	8626                	mv	a2,s1
    80007588:	fb843583          	ld	a1,-72(s0)
    8000758c:	fa043503          	ld	a0,-96(s0)
    80007590:	ffffb097          	auipc	ra,0xffffb
    80007594:	b34080e7          	jalr	-1228(ra) # 800020c4 <uvmalloc>
    80007598:	f6a43823          	sd	a0,-144(s0)
    8000759c:	f7043783          	ld	a5,-144(s0)
    800075a0:	2e078a63          	beqz	a5,80007894 <exec+0x450>
      goto bad;
    sz = sz1;
    800075a4:	f7043783          	ld	a5,-144(s0)
    800075a8:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    800075ac:	e0843783          	ld	a5,-504(s0)
    800075b0:	e0043703          	ld	a4,-512(s0)
    800075b4:	0007069b          	sext.w	a3,a4
    800075b8:	e1843703          	ld	a4,-488(s0)
    800075bc:	2701                	sext.w	a4,a4
    800075be:	fa843603          	ld	a2,-88(s0)
    800075c2:	85be                	mv	a1,a5
    800075c4:	fa043503          	ld	a0,-96(s0)
    800075c8:	00000097          	auipc	ra,0x0
    800075cc:	330080e7          	jalr	816(ra) # 800078f8 <loadseg>
    800075d0:	87aa                	mv	a5,a0
    800075d2:	2c07c363          	bltz	a5,80007898 <exec+0x454>
    800075d6:	a011                	j	800075da <exec+0x196>
      continue;
    800075d8:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800075da:	fcc42783          	lw	a5,-52(s0)
    800075de:	2785                	addiw	a5,a5,1
    800075e0:	fcf42623          	sw	a5,-52(s0)
    800075e4:	fc842783          	lw	a5,-56(s0)
    800075e8:	0387879b          	addiw	a5,a5,56
    800075ec:	2781                	sext.w	a5,a5
    800075ee:	fcf42423          	sw	a5,-56(s0)
    800075f2:	e6845783          	lhu	a5,-408(s0)
    800075f6:	0007871b          	sext.w	a4,a5
    800075fa:	fcc42783          	lw	a5,-52(s0)
    800075fe:	2781                	sext.w	a5,a5
    80007600:	f0e7c3e3          	blt	a5,a4,80007506 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    80007604:	fa843503          	ld	a0,-88(s0)
    80007608:	ffffe097          	auipc	ra,0xffffe
    8000760c:	f7e080e7          	jalr	-130(ra) # 80005586 <iunlockput>
  end_op();
    80007610:	fffff097          	auipc	ra,0xfffff
    80007614:	e64080e7          	jalr	-412(ra) # 80006474 <end_op>
  ip = 0;
    80007618:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    8000761c:	ffffb097          	auipc	ra,0xffffb
    80007620:	41a080e7          	jalr	1050(ra) # 80002a36 <myproc>
    80007624:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007628:	f9843783          	ld	a5,-104(s0)
    8000762c:	67bc                	ld	a5,72(a5)
    8000762e:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    80007632:	fb843703          	ld	a4,-72(s0)
    80007636:	6785                	lui	a5,0x1
    80007638:	17fd                	addi	a5,a5,-1
    8000763a:	973e                	add	a4,a4,a5
    8000763c:	77fd                	lui	a5,0xfffff
    8000763e:	8ff9                	and	a5,a5,a4
    80007640:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    80007644:	fb843703          	ld	a4,-72(s0)
    80007648:	6789                	lui	a5,0x2
    8000764a:	97ba                	add	a5,a5,a4
    8000764c:	4691                	li	a3,4
    8000764e:	863e                	mv	a2,a5
    80007650:	fb843583          	ld	a1,-72(s0)
    80007654:	fa043503          	ld	a0,-96(s0)
    80007658:	ffffb097          	auipc	ra,0xffffb
    8000765c:	a6c080e7          	jalr	-1428(ra) # 800020c4 <uvmalloc>
    80007660:	f8a43423          	sd	a0,-120(s0)
    80007664:	f8843783          	ld	a5,-120(s0)
    80007668:	22078a63          	beqz	a5,8000789c <exec+0x458>
    goto bad;
  sz = sz1;
    8000766c:	f8843783          	ld	a5,-120(s0)
    80007670:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007674:	fb843703          	ld	a4,-72(s0)
    80007678:	77f9                	lui	a5,0xffffe
    8000767a:	97ba                	add	a5,a5,a4
    8000767c:	85be                	mv	a1,a5
    8000767e:	fa043503          	ld	a0,-96(s0)
    80007682:	ffffb097          	auipc	ra,0xffffb
    80007686:	e00080e7          	jalr	-512(ra) # 80002482 <uvmclear>
  sp = sz;
    8000768a:	fb843783          	ld	a5,-72(s0)
    8000768e:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007692:	fb043703          	ld	a4,-80(s0)
    80007696:	77fd                	lui	a5,0xfffff
    80007698:	97ba                	add	a5,a5,a4
    8000769a:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    8000769e:	fc043023          	sd	zero,-64(s0)
    800076a2:	a845                	j	80007752 <exec+0x30e>
    if(argc >= MAXARG)
    800076a4:	fc043703          	ld	a4,-64(s0)
    800076a8:	47fd                	li	a5,31
    800076aa:	1ee7eb63          	bltu	a5,a4,800078a0 <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    800076ae:	fc043783          	ld	a5,-64(s0)
    800076b2:	078e                	slli	a5,a5,0x3
    800076b4:	de043703          	ld	a4,-544(s0)
    800076b8:	97ba                	add	a5,a5,a4
    800076ba:	639c                	ld	a5,0(a5)
    800076bc:	853e                	mv	a0,a5
    800076be:	ffffa097          	auipc	ra,0xffffa
    800076c2:	1d0080e7          	jalr	464(ra) # 8000188e <strlen>
    800076c6:	87aa                	mv	a5,a0
    800076c8:	2785                	addiw	a5,a5,1
    800076ca:	2781                	sext.w	a5,a5
    800076cc:	873e                	mv	a4,a5
    800076ce:	fb043783          	ld	a5,-80(s0)
    800076d2:	8f99                	sub	a5,a5,a4
    800076d4:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800076d8:	fb043783          	ld	a5,-80(s0)
    800076dc:	9bc1                	andi	a5,a5,-16
    800076de:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800076e2:	fb043703          	ld	a4,-80(s0)
    800076e6:	f8043783          	ld	a5,-128(s0)
    800076ea:	1af76d63          	bltu	a4,a5,800078a4 <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800076ee:	fc043783          	ld	a5,-64(s0)
    800076f2:	078e                	slli	a5,a5,0x3
    800076f4:	de043703          	ld	a4,-544(s0)
    800076f8:	97ba                	add	a5,a5,a4
    800076fa:	6384                	ld	s1,0(a5)
    800076fc:	fc043783          	ld	a5,-64(s0)
    80007700:	078e                	slli	a5,a5,0x3
    80007702:	de043703          	ld	a4,-544(s0)
    80007706:	97ba                	add	a5,a5,a4
    80007708:	639c                	ld	a5,0(a5)
    8000770a:	853e                	mv	a0,a5
    8000770c:	ffffa097          	auipc	ra,0xffffa
    80007710:	182080e7          	jalr	386(ra) # 8000188e <strlen>
    80007714:	87aa                	mv	a5,a0
    80007716:	2785                	addiw	a5,a5,1
    80007718:	2781                	sext.w	a5,a5
    8000771a:	86be                	mv	a3,a5
    8000771c:	8626                	mv	a2,s1
    8000771e:	fb043583          	ld	a1,-80(s0)
    80007722:	fa043503          	ld	a0,-96(s0)
    80007726:	ffffb097          	auipc	ra,0xffffb
    8000772a:	dda080e7          	jalr	-550(ra) # 80002500 <copyout>
    8000772e:	87aa                	mv	a5,a0
    80007730:	1607cc63          	bltz	a5,800078a8 <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    80007734:	fc043783          	ld	a5,-64(s0)
    80007738:	078e                	slli	a5,a5,0x3
    8000773a:	fe040713          	addi	a4,s0,-32
    8000773e:	97ba                	add	a5,a5,a4
    80007740:	fb043703          	ld	a4,-80(s0)
    80007744:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffd4ea8>
  for(argc = 0; argv[argc]; argc++) {
    80007748:	fc043783          	ld	a5,-64(s0)
    8000774c:	0785                	addi	a5,a5,1
    8000774e:	fcf43023          	sd	a5,-64(s0)
    80007752:	fc043783          	ld	a5,-64(s0)
    80007756:	078e                	slli	a5,a5,0x3
    80007758:	de043703          	ld	a4,-544(s0)
    8000775c:	97ba                	add	a5,a5,a4
    8000775e:	639c                	ld	a5,0(a5)
    80007760:	f3b1                	bnez	a5,800076a4 <exec+0x260>
  }
  ustack[argc] = 0;
    80007762:	fc043783          	ld	a5,-64(s0)
    80007766:	078e                	slli	a5,a5,0x3
    80007768:	fe040713          	addi	a4,s0,-32
    8000776c:	97ba                	add	a5,a5,a4
    8000776e:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007772:	fc043783          	ld	a5,-64(s0)
    80007776:	0785                	addi	a5,a5,1
    80007778:	078e                	slli	a5,a5,0x3
    8000777a:	fb043703          	ld	a4,-80(s0)
    8000777e:	40f707b3          	sub	a5,a4,a5
    80007782:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007786:	fb043783          	ld	a5,-80(s0)
    8000778a:	9bc1                	andi	a5,a5,-16
    8000778c:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007790:	fb043703          	ld	a4,-80(s0)
    80007794:	f8043783          	ld	a5,-128(s0)
    80007798:	10f76a63          	bltu	a4,a5,800078ac <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8000779c:	fc043783          	ld	a5,-64(s0)
    800077a0:	0785                	addi	a5,a5,1
    800077a2:	00379713          	slli	a4,a5,0x3
    800077a6:	e7040793          	addi	a5,s0,-400
    800077aa:	86ba                	mv	a3,a4
    800077ac:	863e                	mv	a2,a5
    800077ae:	fb043583          	ld	a1,-80(s0)
    800077b2:	fa043503          	ld	a0,-96(s0)
    800077b6:	ffffb097          	auipc	ra,0xffffb
    800077ba:	d4a080e7          	jalr	-694(ra) # 80002500 <copyout>
    800077be:	87aa                	mv	a5,a0
    800077c0:	0e07c863          	bltz	a5,800078b0 <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    800077c4:	f9843783          	ld	a5,-104(s0)
    800077c8:	6fbc                	ld	a5,88(a5)
    800077ca:	fb043703          	ld	a4,-80(s0)
    800077ce:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800077d0:	de843783          	ld	a5,-536(s0)
    800077d4:	fcf43c23          	sd	a5,-40(s0)
    800077d8:	fd843783          	ld	a5,-40(s0)
    800077dc:	fcf43823          	sd	a5,-48(s0)
    800077e0:	a025                	j	80007808 <exec+0x3c4>
    if(*s == '/')
    800077e2:	fd843783          	ld	a5,-40(s0)
    800077e6:	0007c783          	lbu	a5,0(a5)
    800077ea:	873e                	mv	a4,a5
    800077ec:	02f00793          	li	a5,47
    800077f0:	00f71763          	bne	a4,a5,800077fe <exec+0x3ba>
      last = s+1;
    800077f4:	fd843783          	ld	a5,-40(s0)
    800077f8:	0785                	addi	a5,a5,1
    800077fa:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    800077fe:	fd843783          	ld	a5,-40(s0)
    80007802:	0785                	addi	a5,a5,1
    80007804:	fcf43c23          	sd	a5,-40(s0)
    80007808:	fd843783          	ld	a5,-40(s0)
    8000780c:	0007c783          	lbu	a5,0(a5)
    80007810:	fbe9                	bnez	a5,800077e2 <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    80007812:	f9843783          	ld	a5,-104(s0)
    80007816:	15878793          	addi	a5,a5,344
    8000781a:	4641                	li	a2,16
    8000781c:	fd043583          	ld	a1,-48(s0)
    80007820:	853e                	mv	a0,a5
    80007822:	ffffa097          	auipc	ra,0xffffa
    80007826:	ff2080e7          	jalr	-14(ra) # 80001814 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    8000782a:	f9843783          	ld	a5,-104(s0)
    8000782e:	6bbc                	ld	a5,80(a5)
    80007830:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    80007834:	f9843783          	ld	a5,-104(s0)
    80007838:	fa043703          	ld	a4,-96(s0)
    8000783c:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    8000783e:	f9843783          	ld	a5,-104(s0)
    80007842:	fb843703          	ld	a4,-72(s0)
    80007846:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007848:	f9843783          	ld	a5,-104(s0)
    8000784c:	6fbc                	ld	a5,88(a5)
    8000784e:	e4843703          	ld	a4,-440(s0)
    80007852:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007854:	f9843783          	ld	a5,-104(s0)
    80007858:	6fbc                	ld	a5,88(a5)
    8000785a:	fb043703          	ld	a4,-80(s0)
    8000785e:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007860:	f9043583          	ld	a1,-112(s0)
    80007864:	f7843503          	ld	a0,-136(s0)
    80007868:	ffffb097          	auipc	ra,0xffffb
    8000786c:	4f0080e7          	jalr	1264(ra) # 80002d58 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007870:	fc043783          	ld	a5,-64(s0)
    80007874:	2781                	sext.w	a5,a5
    80007876:	a0bd                	j	800078e4 <exec+0x4a0>
    goto bad;
    80007878:	0001                	nop
    8000787a:	a825                	j	800078b2 <exec+0x46e>
    goto bad;
    8000787c:	0001                	nop
    8000787e:	a815                	j	800078b2 <exec+0x46e>
    goto bad;
    80007880:	0001                	nop
    80007882:	a805                	j	800078b2 <exec+0x46e>
      goto bad;
    80007884:	0001                	nop
    80007886:	a035                	j	800078b2 <exec+0x46e>
      goto bad;
    80007888:	0001                	nop
    8000788a:	a025                	j	800078b2 <exec+0x46e>
      goto bad;
    8000788c:	0001                	nop
    8000788e:	a015                	j	800078b2 <exec+0x46e>
      goto bad;
    80007890:	0001                	nop
    80007892:	a005                	j	800078b2 <exec+0x46e>
      goto bad;
    80007894:	0001                	nop
    80007896:	a831                	j	800078b2 <exec+0x46e>
      goto bad;
    80007898:	0001                	nop
    8000789a:	a821                	j	800078b2 <exec+0x46e>
    goto bad;
    8000789c:	0001                	nop
    8000789e:	a811                	j	800078b2 <exec+0x46e>
      goto bad;
    800078a0:	0001                	nop
    800078a2:	a801                	j	800078b2 <exec+0x46e>
      goto bad;
    800078a4:	0001                	nop
    800078a6:	a031                	j	800078b2 <exec+0x46e>
      goto bad;
    800078a8:	0001                	nop
    800078aa:	a021                	j	800078b2 <exec+0x46e>
    goto bad;
    800078ac:	0001                	nop
    800078ae:	a011                	j	800078b2 <exec+0x46e>
    goto bad;
    800078b0:	0001                	nop

 bad:
  if(pagetable)
    800078b2:	fa043783          	ld	a5,-96(s0)
    800078b6:	cb89                	beqz	a5,800078c8 <exec+0x484>
    proc_freepagetable(pagetable, sz);
    800078b8:	fb843583          	ld	a1,-72(s0)
    800078bc:	fa043503          	ld	a0,-96(s0)
    800078c0:	ffffb097          	auipc	ra,0xffffb
    800078c4:	498080e7          	jalr	1176(ra) # 80002d58 <proc_freepagetable>
  if(ip){
    800078c8:	fa843783          	ld	a5,-88(s0)
    800078cc:	cb99                	beqz	a5,800078e2 <exec+0x49e>
    iunlockput(ip);
    800078ce:	fa843503          	ld	a0,-88(s0)
    800078d2:	ffffe097          	auipc	ra,0xffffe
    800078d6:	cb4080e7          	jalr	-844(ra) # 80005586 <iunlockput>
    end_op();
    800078da:	fffff097          	auipc	ra,0xfffff
    800078de:	b9a080e7          	jalr	-1126(ra) # 80006474 <end_op>
  }
  return -1;
    800078e2:	57fd                	li	a5,-1
}
    800078e4:	853e                	mv	a0,a5
    800078e6:	21813083          	ld	ra,536(sp)
    800078ea:	21013403          	ld	s0,528(sp)
    800078ee:	20813483          	ld	s1,520(sp)
    800078f2:	22010113          	addi	sp,sp,544
    800078f6:	8082                	ret

00000000800078f8 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    800078f8:	7139                	addi	sp,sp,-64
    800078fa:	fc06                	sd	ra,56(sp)
    800078fc:	f822                	sd	s0,48(sp)
    800078fe:	0080                	addi	s0,sp,64
    80007900:	fca43c23          	sd	a0,-40(s0)
    80007904:	fcb43823          	sd	a1,-48(s0)
    80007908:	fcc43423          	sd	a2,-56(s0)
    8000790c:	87b6                	mv	a5,a3
    8000790e:	fcf42223          	sw	a5,-60(s0)
    80007912:	87ba                	mv	a5,a4
    80007914:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    80007918:	fe042623          	sw	zero,-20(s0)
    8000791c:	a05d                	j	800079c2 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    8000791e:	fec46703          	lwu	a4,-20(s0)
    80007922:	fd043783          	ld	a5,-48(s0)
    80007926:	97ba                	add	a5,a5,a4
    80007928:	85be                	mv	a1,a5
    8000792a:	fd843503          	ld	a0,-40(s0)
    8000792e:	ffffa097          	auipc	ra,0xffffa
    80007932:	36e080e7          	jalr	878(ra) # 80001c9c <walkaddr>
    80007936:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000793a:	fe043783          	ld	a5,-32(s0)
    8000793e:	eb89                	bnez	a5,80007950 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007940:	00005517          	auipc	a0,0x5
    80007944:	cc050513          	addi	a0,a0,-832 # 8000c600 <etext+0x600>
    80007948:	ffff9097          	auipc	ra,0xffff9
    8000794c:	344080e7          	jalr	836(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    80007950:	fc042703          	lw	a4,-64(s0)
    80007954:	fec42783          	lw	a5,-20(s0)
    80007958:	40f707bb          	subw	a5,a4,a5
    8000795c:	2781                	sext.w	a5,a5
    8000795e:	873e                	mv	a4,a5
    80007960:	6785                	lui	a5,0x1
    80007962:	00f77b63          	bgeu	a4,a5,80007978 <loadseg+0x80>
      n = sz - i;
    80007966:	fc042703          	lw	a4,-64(s0)
    8000796a:	fec42783          	lw	a5,-20(s0)
    8000796e:	40f707bb          	subw	a5,a4,a5
    80007972:	fef42423          	sw	a5,-24(s0)
    80007976:	a021                	j	8000797e <loadseg+0x86>
    else
      n = PGSIZE;
    80007978:	6785                	lui	a5,0x1
    8000797a:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    8000797e:	fc442703          	lw	a4,-60(s0)
    80007982:	fec42783          	lw	a5,-20(s0)
    80007986:	9fb9                	addw	a5,a5,a4
    80007988:	2781                	sext.w	a5,a5
    8000798a:	fe842703          	lw	a4,-24(s0)
    8000798e:	86be                	mv	a3,a5
    80007990:	fe043603          	ld	a2,-32(s0)
    80007994:	4581                	li	a1,0
    80007996:	fc843503          	ld	a0,-56(s0)
    8000799a:	ffffe097          	auipc	ra,0xffffe
    8000799e:	f44080e7          	jalr	-188(ra) # 800058de <readi>
    800079a2:	87aa                	mv	a5,a0
    800079a4:	0007871b          	sext.w	a4,a5
    800079a8:	fe842783          	lw	a5,-24(s0)
    800079ac:	2781                	sext.w	a5,a5
    800079ae:	00e78463          	beq	a5,a4,800079b6 <loadseg+0xbe>
      return -1;
    800079b2:	57fd                	li	a5,-1
    800079b4:	a005                	j	800079d4 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    800079b6:	fec42703          	lw	a4,-20(s0)
    800079ba:	6785                	lui	a5,0x1
    800079bc:	9fb9                	addw	a5,a5,a4
    800079be:	fef42623          	sw	a5,-20(s0)
    800079c2:	fec42703          	lw	a4,-20(s0)
    800079c6:	fc042783          	lw	a5,-64(s0)
    800079ca:	2701                	sext.w	a4,a4
    800079cc:	2781                	sext.w	a5,a5
    800079ce:	f4f768e3          	bltu	a4,a5,8000791e <loadseg+0x26>
  }
  
  return 0;
    800079d2:	4781                	li	a5,0
}
    800079d4:	853e                	mv	a0,a5
    800079d6:	70e2                	ld	ra,56(sp)
    800079d8:	7442                	ld	s0,48(sp)
    800079da:	6121                	addi	sp,sp,64
    800079dc:	8082                	ret

00000000800079de <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    800079de:	7139                	addi	sp,sp,-64
    800079e0:	fc06                	sd	ra,56(sp)
    800079e2:	f822                	sd	s0,48(sp)
    800079e4:	0080                	addi	s0,sp,64
    800079e6:	87aa                	mv	a5,a0
    800079e8:	fcb43823          	sd	a1,-48(s0)
    800079ec:	fcc43423          	sd	a2,-56(s0)
    800079f0:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    800079f4:	fe440713          	addi	a4,s0,-28
    800079f8:	fdc42783          	lw	a5,-36(s0)
    800079fc:	85ba                	mv	a1,a4
    800079fe:	853e                	mv	a0,a5
    80007a00:	ffffd097          	auipc	ra,0xffffd
    80007a04:	980080e7          	jalr	-1664(ra) # 80004380 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007a08:	fe442783          	lw	a5,-28(s0)
    80007a0c:	0207c863          	bltz	a5,80007a3c <argfd+0x5e>
    80007a10:	fe442783          	lw	a5,-28(s0)
    80007a14:	873e                	mv	a4,a5
    80007a16:	47bd                	li	a5,15
    80007a18:	02e7c263          	blt	a5,a4,80007a3c <argfd+0x5e>
    80007a1c:	ffffb097          	auipc	ra,0xffffb
    80007a20:	01a080e7          	jalr	26(ra) # 80002a36 <myproc>
    80007a24:	872a                	mv	a4,a0
    80007a26:	fe442783          	lw	a5,-28(s0)
    80007a2a:	07e9                	addi	a5,a5,26
    80007a2c:	078e                	slli	a5,a5,0x3
    80007a2e:	97ba                	add	a5,a5,a4
    80007a30:	639c                	ld	a5,0(a5)
    80007a32:	fef43423          	sd	a5,-24(s0)
    80007a36:	fe843783          	ld	a5,-24(s0)
    80007a3a:	e399                	bnez	a5,80007a40 <argfd+0x62>
    return -1;
    80007a3c:	57fd                	li	a5,-1
    80007a3e:	a015                	j	80007a62 <argfd+0x84>
  if(pfd)
    80007a40:	fd043783          	ld	a5,-48(s0)
    80007a44:	c791                	beqz	a5,80007a50 <argfd+0x72>
    *pfd = fd;
    80007a46:	fe442703          	lw	a4,-28(s0)
    80007a4a:	fd043783          	ld	a5,-48(s0)
    80007a4e:	c398                	sw	a4,0(a5)
  if(pf)
    80007a50:	fc843783          	ld	a5,-56(s0)
    80007a54:	c791                	beqz	a5,80007a60 <argfd+0x82>
    *pf = f;
    80007a56:	fc843783          	ld	a5,-56(s0)
    80007a5a:	fe843703          	ld	a4,-24(s0)
    80007a5e:	e398                	sd	a4,0(a5)
  return 0;
    80007a60:	4781                	li	a5,0
}
    80007a62:	853e                	mv	a0,a5
    80007a64:	70e2                	ld	ra,56(sp)
    80007a66:	7442                	ld	s0,48(sp)
    80007a68:	6121                	addi	sp,sp,64
    80007a6a:	8082                	ret

0000000080007a6c <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007a6c:	7179                	addi	sp,sp,-48
    80007a6e:	f406                	sd	ra,40(sp)
    80007a70:	f022                	sd	s0,32(sp)
    80007a72:	1800                	addi	s0,sp,48
    80007a74:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007a78:	ffffb097          	auipc	ra,0xffffb
    80007a7c:	fbe080e7          	jalr	-66(ra) # 80002a36 <myproc>
    80007a80:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007a84:	fe042623          	sw	zero,-20(s0)
    80007a88:	a825                	j	80007ac0 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007a8a:	fe043703          	ld	a4,-32(s0)
    80007a8e:	fec42783          	lw	a5,-20(s0)
    80007a92:	07e9                	addi	a5,a5,26
    80007a94:	078e                	slli	a5,a5,0x3
    80007a96:	97ba                	add	a5,a5,a4
    80007a98:	639c                	ld	a5,0(a5)
    80007a9a:	ef91                	bnez	a5,80007ab6 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007a9c:	fe043703          	ld	a4,-32(s0)
    80007aa0:	fec42783          	lw	a5,-20(s0)
    80007aa4:	07e9                	addi	a5,a5,26
    80007aa6:	078e                	slli	a5,a5,0x3
    80007aa8:	97ba                	add	a5,a5,a4
    80007aaa:	fd843703          	ld	a4,-40(s0)
    80007aae:	e398                	sd	a4,0(a5)
      return fd;
    80007ab0:	fec42783          	lw	a5,-20(s0)
    80007ab4:	a831                	j	80007ad0 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007ab6:	fec42783          	lw	a5,-20(s0)
    80007aba:	2785                	addiw	a5,a5,1
    80007abc:	fef42623          	sw	a5,-20(s0)
    80007ac0:	fec42783          	lw	a5,-20(s0)
    80007ac4:	0007871b          	sext.w	a4,a5
    80007ac8:	47bd                	li	a5,15
    80007aca:	fce7d0e3          	bge	a5,a4,80007a8a <fdalloc+0x1e>
    }
  }
  return -1;
    80007ace:	57fd                	li	a5,-1
}
    80007ad0:	853e                	mv	a0,a5
    80007ad2:	70a2                	ld	ra,40(sp)
    80007ad4:	7402                	ld	s0,32(sp)
    80007ad6:	6145                	addi	sp,sp,48
    80007ad8:	8082                	ret

0000000080007ada <sys_dup>:

uint64
sys_dup(void)
{
    80007ada:	1101                	addi	sp,sp,-32
    80007adc:	ec06                	sd	ra,24(sp)
    80007ade:	e822                	sd	s0,16(sp)
    80007ae0:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007ae2:	fe040793          	addi	a5,s0,-32
    80007ae6:	863e                	mv	a2,a5
    80007ae8:	4581                	li	a1,0
    80007aea:	4501                	li	a0,0
    80007aec:	00000097          	auipc	ra,0x0
    80007af0:	ef2080e7          	jalr	-270(ra) # 800079de <argfd>
    80007af4:	87aa                	mv	a5,a0
    80007af6:	0007d463          	bgez	a5,80007afe <sys_dup+0x24>
    return -1;
    80007afa:	57fd                	li	a5,-1
    80007afc:	a81d                	j	80007b32 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007afe:	fe043783          	ld	a5,-32(s0)
    80007b02:	853e                	mv	a0,a5
    80007b04:	00000097          	auipc	ra,0x0
    80007b08:	f68080e7          	jalr	-152(ra) # 80007a6c <fdalloc>
    80007b0c:	87aa                	mv	a5,a0
    80007b0e:	fef42623          	sw	a5,-20(s0)
    80007b12:	fec42783          	lw	a5,-20(s0)
    80007b16:	2781                	sext.w	a5,a5
    80007b18:	0007d463          	bgez	a5,80007b20 <sys_dup+0x46>
    return -1;
    80007b1c:	57fd                	li	a5,-1
    80007b1e:	a811                	j	80007b32 <sys_dup+0x58>
  filedup(f);
    80007b20:	fe043783          	ld	a5,-32(s0)
    80007b24:	853e                	mv	a0,a5
    80007b26:	fffff097          	auipc	ra,0xfffff
    80007b2a:	ec0080e7          	jalr	-320(ra) # 800069e6 <filedup>
  return fd;
    80007b2e:	fec42783          	lw	a5,-20(s0)
}
    80007b32:	853e                	mv	a0,a5
    80007b34:	60e2                	ld	ra,24(sp)
    80007b36:	6442                	ld	s0,16(sp)
    80007b38:	6105                	addi	sp,sp,32
    80007b3a:	8082                	ret

0000000080007b3c <sys_read>:

uint64
sys_read(void)
{
    80007b3c:	7179                	addi	sp,sp,-48
    80007b3e:	f406                	sd	ra,40(sp)
    80007b40:	f022                	sd	s0,32(sp)
    80007b42:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007b44:	fd840793          	addi	a5,s0,-40
    80007b48:	85be                	mv	a1,a5
    80007b4a:	4505                	li	a0,1
    80007b4c:	ffffd097          	auipc	ra,0xffffd
    80007b50:	86a080e7          	jalr	-1942(ra) # 800043b6 <argaddr>
  argint(2, &n);
    80007b54:	fe440793          	addi	a5,s0,-28
    80007b58:	85be                	mv	a1,a5
    80007b5a:	4509                	li	a0,2
    80007b5c:	ffffd097          	auipc	ra,0xffffd
    80007b60:	824080e7          	jalr	-2012(ra) # 80004380 <argint>
  if(argfd(0, 0, &f) < 0)
    80007b64:	fe840793          	addi	a5,s0,-24
    80007b68:	863e                	mv	a2,a5
    80007b6a:	4581                	li	a1,0
    80007b6c:	4501                	li	a0,0
    80007b6e:	00000097          	auipc	ra,0x0
    80007b72:	e70080e7          	jalr	-400(ra) # 800079de <argfd>
    80007b76:	87aa                	mv	a5,a0
    80007b78:	0007d463          	bgez	a5,80007b80 <sys_read+0x44>
    return -1;
    80007b7c:	57fd                	li	a5,-1
    80007b7e:	a839                	j	80007b9c <sys_read+0x60>
  return fileread(f, p, n);
    80007b80:	fe843783          	ld	a5,-24(s0)
    80007b84:	fd843703          	ld	a4,-40(s0)
    80007b88:	fe442683          	lw	a3,-28(s0)
    80007b8c:	8636                	mv	a2,a3
    80007b8e:	85ba                	mv	a1,a4
    80007b90:	853e                	mv	a0,a5
    80007b92:	fffff097          	auipc	ra,0xfffff
    80007b96:	066080e7          	jalr	102(ra) # 80006bf8 <fileread>
    80007b9a:	87aa                	mv	a5,a0
}
    80007b9c:	853e                	mv	a0,a5
    80007b9e:	70a2                	ld	ra,40(sp)
    80007ba0:	7402                	ld	s0,32(sp)
    80007ba2:	6145                	addi	sp,sp,48
    80007ba4:	8082                	ret

0000000080007ba6 <sys_write>:

uint64
sys_write(void)
{
    80007ba6:	7179                	addi	sp,sp,-48
    80007ba8:	f406                	sd	ra,40(sp)
    80007baa:	f022                	sd	s0,32(sp)
    80007bac:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007bae:	fd840793          	addi	a5,s0,-40
    80007bb2:	85be                	mv	a1,a5
    80007bb4:	4505                	li	a0,1
    80007bb6:	ffffd097          	auipc	ra,0xffffd
    80007bba:	800080e7          	jalr	-2048(ra) # 800043b6 <argaddr>
  argint(2, &n);
    80007bbe:	fe440793          	addi	a5,s0,-28
    80007bc2:	85be                	mv	a1,a5
    80007bc4:	4509                	li	a0,2
    80007bc6:	ffffc097          	auipc	ra,0xffffc
    80007bca:	7ba080e7          	jalr	1978(ra) # 80004380 <argint>
  if(argfd(0, 0, &f) < 0)
    80007bce:	fe840793          	addi	a5,s0,-24
    80007bd2:	863e                	mv	a2,a5
    80007bd4:	4581                	li	a1,0
    80007bd6:	4501                	li	a0,0
    80007bd8:	00000097          	auipc	ra,0x0
    80007bdc:	e06080e7          	jalr	-506(ra) # 800079de <argfd>
    80007be0:	87aa                	mv	a5,a0
    80007be2:	0007d463          	bgez	a5,80007bea <sys_write+0x44>
    return -1;
    80007be6:	57fd                	li	a5,-1
    80007be8:	a839                	j	80007c06 <sys_write+0x60>

  return filewrite(f, p, n);
    80007bea:	fe843783          	ld	a5,-24(s0)
    80007bee:	fd843703          	ld	a4,-40(s0)
    80007bf2:	fe442683          	lw	a3,-28(s0)
    80007bf6:	8636                	mv	a2,a3
    80007bf8:	85ba                	mv	a1,a4
    80007bfa:	853e                	mv	a0,a5
    80007bfc:	fffff097          	auipc	ra,0xfffff
    80007c00:	162080e7          	jalr	354(ra) # 80006d5e <filewrite>
    80007c04:	87aa                	mv	a5,a0
}
    80007c06:	853e                	mv	a0,a5
    80007c08:	70a2                	ld	ra,40(sp)
    80007c0a:	7402                	ld	s0,32(sp)
    80007c0c:	6145                	addi	sp,sp,48
    80007c0e:	8082                	ret

0000000080007c10 <sys_close>:

uint64
sys_close(void)
{
    80007c10:	1101                	addi	sp,sp,-32
    80007c12:	ec06                	sd	ra,24(sp)
    80007c14:	e822                	sd	s0,16(sp)
    80007c16:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007c18:	fe040713          	addi	a4,s0,-32
    80007c1c:	fec40793          	addi	a5,s0,-20
    80007c20:	863a                	mv	a2,a4
    80007c22:	85be                	mv	a1,a5
    80007c24:	4501                	li	a0,0
    80007c26:	00000097          	auipc	ra,0x0
    80007c2a:	db8080e7          	jalr	-584(ra) # 800079de <argfd>
    80007c2e:	87aa                	mv	a5,a0
    80007c30:	0007d463          	bgez	a5,80007c38 <sys_close+0x28>
    return -1;
    80007c34:	57fd                	li	a5,-1
    80007c36:	a02d                	j	80007c60 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007c38:	ffffb097          	auipc	ra,0xffffb
    80007c3c:	dfe080e7          	jalr	-514(ra) # 80002a36 <myproc>
    80007c40:	872a                	mv	a4,a0
    80007c42:	fec42783          	lw	a5,-20(s0)
    80007c46:	07e9                	addi	a5,a5,26
    80007c48:	078e                	slli	a5,a5,0x3
    80007c4a:	97ba                	add	a5,a5,a4
    80007c4c:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007c50:	fe043783          	ld	a5,-32(s0)
    80007c54:	853e                	mv	a0,a5
    80007c56:	fffff097          	auipc	ra,0xfffff
    80007c5a:	df6080e7          	jalr	-522(ra) # 80006a4c <fileclose>
  return 0;
    80007c5e:	4781                	li	a5,0
}
    80007c60:	853e                	mv	a0,a5
    80007c62:	60e2                	ld	ra,24(sp)
    80007c64:	6442                	ld	s0,16(sp)
    80007c66:	6105                	addi	sp,sp,32
    80007c68:	8082                	ret

0000000080007c6a <sys_fstat>:

uint64
sys_fstat(void)
{
    80007c6a:	1101                	addi	sp,sp,-32
    80007c6c:	ec06                	sd	ra,24(sp)
    80007c6e:	e822                	sd	s0,16(sp)
    80007c70:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007c72:	fe040793          	addi	a5,s0,-32
    80007c76:	85be                	mv	a1,a5
    80007c78:	4505                	li	a0,1
    80007c7a:	ffffc097          	auipc	ra,0xffffc
    80007c7e:	73c080e7          	jalr	1852(ra) # 800043b6 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007c82:	fe840793          	addi	a5,s0,-24
    80007c86:	863e                	mv	a2,a5
    80007c88:	4581                	li	a1,0
    80007c8a:	4501                	li	a0,0
    80007c8c:	00000097          	auipc	ra,0x0
    80007c90:	d52080e7          	jalr	-686(ra) # 800079de <argfd>
    80007c94:	87aa                	mv	a5,a0
    80007c96:	0007d463          	bgez	a5,80007c9e <sys_fstat+0x34>
    return -1;
    80007c9a:	57fd                	li	a5,-1
    80007c9c:	a821                	j	80007cb4 <sys_fstat+0x4a>
  return filestat(f, st);
    80007c9e:	fe843783          	ld	a5,-24(s0)
    80007ca2:	fe043703          	ld	a4,-32(s0)
    80007ca6:	85ba                	mv	a1,a4
    80007ca8:	853e                	mv	a0,a5
    80007caa:	fffff097          	auipc	ra,0xfffff
    80007cae:	eaa080e7          	jalr	-342(ra) # 80006b54 <filestat>
    80007cb2:	87aa                	mv	a5,a0
}
    80007cb4:	853e                	mv	a0,a5
    80007cb6:	60e2                	ld	ra,24(sp)
    80007cb8:	6442                	ld	s0,16(sp)
    80007cba:	6105                	addi	sp,sp,32
    80007cbc:	8082                	ret

0000000080007cbe <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007cbe:	7169                	addi	sp,sp,-304
    80007cc0:	f606                	sd	ra,296(sp)
    80007cc2:	f222                	sd	s0,288(sp)
    80007cc4:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007cc6:	ed040793          	addi	a5,s0,-304
    80007cca:	08000613          	li	a2,128
    80007cce:	85be                	mv	a1,a5
    80007cd0:	4501                	li	a0,0
    80007cd2:	ffffc097          	auipc	ra,0xffffc
    80007cd6:	716080e7          	jalr	1814(ra) # 800043e8 <argstr>
    80007cda:	87aa                	mv	a5,a0
    80007cdc:	0007cf63          	bltz	a5,80007cfa <sys_link+0x3c>
    80007ce0:	f5040793          	addi	a5,s0,-176
    80007ce4:	08000613          	li	a2,128
    80007ce8:	85be                	mv	a1,a5
    80007cea:	4505                	li	a0,1
    80007cec:	ffffc097          	auipc	ra,0xffffc
    80007cf0:	6fc080e7          	jalr	1788(ra) # 800043e8 <argstr>
    80007cf4:	87aa                	mv	a5,a0
    80007cf6:	0007d463          	bgez	a5,80007cfe <sys_link+0x40>
    return -1;
    80007cfa:	57fd                	li	a5,-1
    80007cfc:	aab5                	j	80007e78 <sys_link+0x1ba>

  begin_op();
    80007cfe:	ffffe097          	auipc	ra,0xffffe
    80007d02:	6b4080e7          	jalr	1716(ra) # 800063b2 <begin_op>
  if((ip = namei(old)) == 0){
    80007d06:	ed040793          	addi	a5,s0,-304
    80007d0a:	853e                	mv	a0,a5
    80007d0c:	ffffe097          	auipc	ra,0xffffe
    80007d10:	342080e7          	jalr	834(ra) # 8000604e <namei>
    80007d14:	fea43423          	sd	a0,-24(s0)
    80007d18:	fe843783          	ld	a5,-24(s0)
    80007d1c:	e799                	bnez	a5,80007d2a <sys_link+0x6c>
    end_op();
    80007d1e:	ffffe097          	auipc	ra,0xffffe
    80007d22:	756080e7          	jalr	1878(ra) # 80006474 <end_op>
    return -1;
    80007d26:	57fd                	li	a5,-1
    80007d28:	aa81                	j	80007e78 <sys_link+0x1ba>
  }

  ilock(ip);
    80007d2a:	fe843503          	ld	a0,-24(s0)
    80007d2e:	ffffd097          	auipc	ra,0xffffd
    80007d32:	5fa080e7          	jalr	1530(ra) # 80005328 <ilock>
  if(ip->type == T_DIR){
    80007d36:	fe843783          	ld	a5,-24(s0)
    80007d3a:	04479783          	lh	a5,68(a5)
    80007d3e:	0007871b          	sext.w	a4,a5
    80007d42:	4785                	li	a5,1
    80007d44:	00f71e63          	bne	a4,a5,80007d60 <sys_link+0xa2>
    iunlockput(ip);
    80007d48:	fe843503          	ld	a0,-24(s0)
    80007d4c:	ffffe097          	auipc	ra,0xffffe
    80007d50:	83a080e7          	jalr	-1990(ra) # 80005586 <iunlockput>
    end_op();
    80007d54:	ffffe097          	auipc	ra,0xffffe
    80007d58:	720080e7          	jalr	1824(ra) # 80006474 <end_op>
    return -1;
    80007d5c:	57fd                	li	a5,-1
    80007d5e:	aa29                	j	80007e78 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007d60:	fe843783          	ld	a5,-24(s0)
    80007d64:	04a79783          	lh	a5,74(a5)
    80007d68:	17c2                	slli	a5,a5,0x30
    80007d6a:	93c1                	srli	a5,a5,0x30
    80007d6c:	2785                	addiw	a5,a5,1
    80007d6e:	17c2                	slli	a5,a5,0x30
    80007d70:	93c1                	srli	a5,a5,0x30
    80007d72:	0107971b          	slliw	a4,a5,0x10
    80007d76:	4107571b          	sraiw	a4,a4,0x10
    80007d7a:	fe843783          	ld	a5,-24(s0)
    80007d7e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d82:	fe843503          	ld	a0,-24(s0)
    80007d86:	ffffd097          	auipc	ra,0xffffd
    80007d8a:	352080e7          	jalr	850(ra) # 800050d8 <iupdate>
  iunlock(ip);
    80007d8e:	fe843503          	ld	a0,-24(s0)
    80007d92:	ffffd097          	auipc	ra,0xffffd
    80007d96:	6ca080e7          	jalr	1738(ra) # 8000545c <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007d9a:	fd040713          	addi	a4,s0,-48
    80007d9e:	f5040793          	addi	a5,s0,-176
    80007da2:	85ba                	mv	a1,a4
    80007da4:	853e                	mv	a0,a5
    80007da6:	ffffe097          	auipc	ra,0xffffe
    80007daa:	2d4080e7          	jalr	724(ra) # 8000607a <nameiparent>
    80007dae:	fea43023          	sd	a0,-32(s0)
    80007db2:	fe043783          	ld	a5,-32(s0)
    80007db6:	cba5                	beqz	a5,80007e26 <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007db8:	fe043503          	ld	a0,-32(s0)
    80007dbc:	ffffd097          	auipc	ra,0xffffd
    80007dc0:	56c080e7          	jalr	1388(ra) # 80005328 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007dc4:	fe043783          	ld	a5,-32(s0)
    80007dc8:	4398                	lw	a4,0(a5)
    80007dca:	fe843783          	ld	a5,-24(s0)
    80007dce:	439c                	lw	a5,0(a5)
    80007dd0:	02f71263          	bne	a4,a5,80007df4 <sys_link+0x136>
    80007dd4:	fe843783          	ld	a5,-24(s0)
    80007dd8:	43d8                	lw	a4,4(a5)
    80007dda:	fd040793          	addi	a5,s0,-48
    80007dde:	863a                	mv	a2,a4
    80007de0:	85be                	mv	a1,a5
    80007de2:	fe043503          	ld	a0,-32(s0)
    80007de6:	ffffe097          	auipc	ra,0xffffe
    80007dea:	f5a080e7          	jalr	-166(ra) # 80005d40 <dirlink>
    80007dee:	87aa                	mv	a5,a0
    80007df0:	0007d963          	bgez	a5,80007e02 <sys_link+0x144>
    iunlockput(dp);
    80007df4:	fe043503          	ld	a0,-32(s0)
    80007df8:	ffffd097          	auipc	ra,0xffffd
    80007dfc:	78e080e7          	jalr	1934(ra) # 80005586 <iunlockput>
    goto bad;
    80007e00:	a025                	j	80007e28 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007e02:	fe043503          	ld	a0,-32(s0)
    80007e06:	ffffd097          	auipc	ra,0xffffd
    80007e0a:	780080e7          	jalr	1920(ra) # 80005586 <iunlockput>
  iput(ip);
    80007e0e:	fe843503          	ld	a0,-24(s0)
    80007e12:	ffffd097          	auipc	ra,0xffffd
    80007e16:	6a4080e7          	jalr	1700(ra) # 800054b6 <iput>

  end_op();
    80007e1a:	ffffe097          	auipc	ra,0xffffe
    80007e1e:	65a080e7          	jalr	1626(ra) # 80006474 <end_op>

  return 0;
    80007e22:	4781                	li	a5,0
    80007e24:	a891                	j	80007e78 <sys_link+0x1ba>
    goto bad;
    80007e26:	0001                	nop

bad:
  ilock(ip);
    80007e28:	fe843503          	ld	a0,-24(s0)
    80007e2c:	ffffd097          	auipc	ra,0xffffd
    80007e30:	4fc080e7          	jalr	1276(ra) # 80005328 <ilock>
  ip->nlink--;
    80007e34:	fe843783          	ld	a5,-24(s0)
    80007e38:	04a79783          	lh	a5,74(a5)
    80007e3c:	17c2                	slli	a5,a5,0x30
    80007e3e:	93c1                	srli	a5,a5,0x30
    80007e40:	37fd                	addiw	a5,a5,-1
    80007e42:	17c2                	slli	a5,a5,0x30
    80007e44:	93c1                	srli	a5,a5,0x30
    80007e46:	0107971b          	slliw	a4,a5,0x10
    80007e4a:	4107571b          	sraiw	a4,a4,0x10
    80007e4e:	fe843783          	ld	a5,-24(s0)
    80007e52:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007e56:	fe843503          	ld	a0,-24(s0)
    80007e5a:	ffffd097          	auipc	ra,0xffffd
    80007e5e:	27e080e7          	jalr	638(ra) # 800050d8 <iupdate>
  iunlockput(ip);
    80007e62:	fe843503          	ld	a0,-24(s0)
    80007e66:	ffffd097          	auipc	ra,0xffffd
    80007e6a:	720080e7          	jalr	1824(ra) # 80005586 <iunlockput>
  end_op();
    80007e6e:	ffffe097          	auipc	ra,0xffffe
    80007e72:	606080e7          	jalr	1542(ra) # 80006474 <end_op>
  return -1;
    80007e76:	57fd                	li	a5,-1
}
    80007e78:	853e                	mv	a0,a5
    80007e7a:	70b2                	ld	ra,296(sp)
    80007e7c:	7412                	ld	s0,288(sp)
    80007e7e:	6155                	addi	sp,sp,304
    80007e80:	8082                	ret

0000000080007e82 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007e82:	7139                	addi	sp,sp,-64
    80007e84:	fc06                	sd	ra,56(sp)
    80007e86:	f822                	sd	s0,48(sp)
    80007e88:	0080                	addi	s0,sp,64
    80007e8a:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e8e:	02000793          	li	a5,32
    80007e92:	fef42623          	sw	a5,-20(s0)
    80007e96:	a0b1                	j	80007ee2 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007e98:	fd840793          	addi	a5,s0,-40
    80007e9c:	fec42683          	lw	a3,-20(s0)
    80007ea0:	4741                	li	a4,16
    80007ea2:	863e                	mv	a2,a5
    80007ea4:	4581                	li	a1,0
    80007ea6:	fc843503          	ld	a0,-56(s0)
    80007eaa:	ffffe097          	auipc	ra,0xffffe
    80007eae:	a34080e7          	jalr	-1484(ra) # 800058de <readi>
    80007eb2:	87aa                	mv	a5,a0
    80007eb4:	873e                	mv	a4,a5
    80007eb6:	47c1                	li	a5,16
    80007eb8:	00f70a63          	beq	a4,a5,80007ecc <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007ebc:	00004517          	auipc	a0,0x4
    80007ec0:	76450513          	addi	a0,a0,1892 # 8000c620 <etext+0x620>
    80007ec4:	ffff9097          	auipc	ra,0xffff9
    80007ec8:	dc8080e7          	jalr	-568(ra) # 80000c8c <panic>
    if(de.inum != 0)
    80007ecc:	fd845783          	lhu	a5,-40(s0)
    80007ed0:	c399                	beqz	a5,80007ed6 <isdirempty+0x54>
      return 0;
    80007ed2:	4781                	li	a5,0
    80007ed4:	a839                	j	80007ef2 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007ed6:	fec42783          	lw	a5,-20(s0)
    80007eda:	27c1                	addiw	a5,a5,16
    80007edc:	2781                	sext.w	a5,a5
    80007ede:	fef42623          	sw	a5,-20(s0)
    80007ee2:	fc843783          	ld	a5,-56(s0)
    80007ee6:	47f8                	lw	a4,76(a5)
    80007ee8:	fec42783          	lw	a5,-20(s0)
    80007eec:	fae7e6e3          	bltu	a5,a4,80007e98 <isdirempty+0x16>
  }
  return 1;
    80007ef0:	4785                	li	a5,1
}
    80007ef2:	853e                	mv	a0,a5
    80007ef4:	70e2                	ld	ra,56(sp)
    80007ef6:	7442                	ld	s0,48(sp)
    80007ef8:	6121                	addi	sp,sp,64
    80007efa:	8082                	ret

0000000080007efc <sys_unlink>:

uint64
sys_unlink(void)
{
    80007efc:	7155                	addi	sp,sp,-208
    80007efe:	e586                	sd	ra,200(sp)
    80007f00:	e1a2                	sd	s0,192(sp)
    80007f02:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007f04:	f4040793          	addi	a5,s0,-192
    80007f08:	08000613          	li	a2,128
    80007f0c:	85be                	mv	a1,a5
    80007f0e:	4501                	li	a0,0
    80007f10:	ffffc097          	auipc	ra,0xffffc
    80007f14:	4d8080e7          	jalr	1240(ra) # 800043e8 <argstr>
    80007f18:	87aa                	mv	a5,a0
    80007f1a:	0007d463          	bgez	a5,80007f22 <sys_unlink+0x26>
    return -1;
    80007f1e:	57fd                	li	a5,-1
    80007f20:	a2ed                	j	8000810a <sys_unlink+0x20e>

  begin_op();
    80007f22:	ffffe097          	auipc	ra,0xffffe
    80007f26:	490080e7          	jalr	1168(ra) # 800063b2 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007f2a:	fc040713          	addi	a4,s0,-64
    80007f2e:	f4040793          	addi	a5,s0,-192
    80007f32:	85ba                	mv	a1,a4
    80007f34:	853e                	mv	a0,a5
    80007f36:	ffffe097          	auipc	ra,0xffffe
    80007f3a:	144080e7          	jalr	324(ra) # 8000607a <nameiparent>
    80007f3e:	fea43423          	sd	a0,-24(s0)
    80007f42:	fe843783          	ld	a5,-24(s0)
    80007f46:	e799                	bnez	a5,80007f54 <sys_unlink+0x58>
    end_op();
    80007f48:	ffffe097          	auipc	ra,0xffffe
    80007f4c:	52c080e7          	jalr	1324(ra) # 80006474 <end_op>
    return -1;
    80007f50:	57fd                	li	a5,-1
    80007f52:	aa65                	j	8000810a <sys_unlink+0x20e>
  }

  ilock(dp);
    80007f54:	fe843503          	ld	a0,-24(s0)
    80007f58:	ffffd097          	auipc	ra,0xffffd
    80007f5c:	3d0080e7          	jalr	976(ra) # 80005328 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007f60:	fc040793          	addi	a5,s0,-64
    80007f64:	00004597          	auipc	a1,0x4
    80007f68:	6d458593          	addi	a1,a1,1748 # 8000c638 <etext+0x638>
    80007f6c:	853e                	mv	a0,a5
    80007f6e:	ffffe097          	auipc	ra,0xffffe
    80007f72:	cbc080e7          	jalr	-836(ra) # 80005c2a <namecmp>
    80007f76:	87aa                	mv	a5,a0
    80007f78:	16078b63          	beqz	a5,800080ee <sys_unlink+0x1f2>
    80007f7c:	fc040793          	addi	a5,s0,-64
    80007f80:	00004597          	auipc	a1,0x4
    80007f84:	6c058593          	addi	a1,a1,1728 # 8000c640 <etext+0x640>
    80007f88:	853e                	mv	a0,a5
    80007f8a:	ffffe097          	auipc	ra,0xffffe
    80007f8e:	ca0080e7          	jalr	-864(ra) # 80005c2a <namecmp>
    80007f92:	87aa                	mv	a5,a0
    80007f94:	14078d63          	beqz	a5,800080ee <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007f98:	f3c40713          	addi	a4,s0,-196
    80007f9c:	fc040793          	addi	a5,s0,-64
    80007fa0:	863a                	mv	a2,a4
    80007fa2:	85be                	mv	a1,a5
    80007fa4:	fe843503          	ld	a0,-24(s0)
    80007fa8:	ffffe097          	auipc	ra,0xffffe
    80007fac:	cb0080e7          	jalr	-848(ra) # 80005c58 <dirlookup>
    80007fb0:	fea43023          	sd	a0,-32(s0)
    80007fb4:	fe043783          	ld	a5,-32(s0)
    80007fb8:	12078d63          	beqz	a5,800080f2 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007fbc:	fe043503          	ld	a0,-32(s0)
    80007fc0:	ffffd097          	auipc	ra,0xffffd
    80007fc4:	368080e7          	jalr	872(ra) # 80005328 <ilock>

  if(ip->nlink < 1)
    80007fc8:	fe043783          	ld	a5,-32(s0)
    80007fcc:	04a79783          	lh	a5,74(a5)
    80007fd0:	2781                	sext.w	a5,a5
    80007fd2:	00f04a63          	bgtz	a5,80007fe6 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007fd6:	00004517          	auipc	a0,0x4
    80007fda:	67250513          	addi	a0,a0,1650 # 8000c648 <etext+0x648>
    80007fde:	ffff9097          	auipc	ra,0xffff9
    80007fe2:	cae080e7          	jalr	-850(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007fe6:	fe043783          	ld	a5,-32(s0)
    80007fea:	04479783          	lh	a5,68(a5)
    80007fee:	0007871b          	sext.w	a4,a5
    80007ff2:	4785                	li	a5,1
    80007ff4:	02f71163          	bne	a4,a5,80008016 <sys_unlink+0x11a>
    80007ff8:	fe043503          	ld	a0,-32(s0)
    80007ffc:	00000097          	auipc	ra,0x0
    80008000:	e86080e7          	jalr	-378(ra) # 80007e82 <isdirempty>
    80008004:	87aa                	mv	a5,a0
    80008006:	eb81                	bnez	a5,80008016 <sys_unlink+0x11a>
    iunlockput(ip);
    80008008:	fe043503          	ld	a0,-32(s0)
    8000800c:	ffffd097          	auipc	ra,0xffffd
    80008010:	57a080e7          	jalr	1402(ra) # 80005586 <iunlockput>
    goto bad;
    80008014:	a0c5                	j	800080f4 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80008016:	fd040793          	addi	a5,s0,-48
    8000801a:	4641                	li	a2,16
    8000801c:	4581                	li	a1,0
    8000801e:	853e                	mv	a0,a5
    80008020:	ffff9097          	auipc	ra,0xffff9
    80008024:	4f0080e7          	jalr	1264(ra) # 80001510 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008028:	fd040793          	addi	a5,s0,-48
    8000802c:	f3c42683          	lw	a3,-196(s0)
    80008030:	4741                	li	a4,16
    80008032:	863e                	mv	a2,a5
    80008034:	4581                	li	a1,0
    80008036:	fe843503          	ld	a0,-24(s0)
    8000803a:	ffffe097          	auipc	ra,0xffffe
    8000803e:	a3c080e7          	jalr	-1476(ra) # 80005a76 <writei>
    80008042:	87aa                	mv	a5,a0
    80008044:	873e                	mv	a4,a5
    80008046:	47c1                	li	a5,16
    80008048:	00f70a63          	beq	a4,a5,8000805c <sys_unlink+0x160>
    panic("unlink: writei");
    8000804c:	00004517          	auipc	a0,0x4
    80008050:	61450513          	addi	a0,a0,1556 # 8000c660 <etext+0x660>
    80008054:	ffff9097          	auipc	ra,0xffff9
    80008058:	c38080e7          	jalr	-968(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    8000805c:	fe043783          	ld	a5,-32(s0)
    80008060:	04479783          	lh	a5,68(a5)
    80008064:	0007871b          	sext.w	a4,a5
    80008068:	4785                	li	a5,1
    8000806a:	02f71963          	bne	a4,a5,8000809c <sys_unlink+0x1a0>
    dp->nlink--;
    8000806e:	fe843783          	ld	a5,-24(s0)
    80008072:	04a79783          	lh	a5,74(a5)
    80008076:	17c2                	slli	a5,a5,0x30
    80008078:	93c1                	srli	a5,a5,0x30
    8000807a:	37fd                	addiw	a5,a5,-1
    8000807c:	17c2                	slli	a5,a5,0x30
    8000807e:	93c1                	srli	a5,a5,0x30
    80008080:	0107971b          	slliw	a4,a5,0x10
    80008084:	4107571b          	sraiw	a4,a4,0x10
    80008088:	fe843783          	ld	a5,-24(s0)
    8000808c:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008090:	fe843503          	ld	a0,-24(s0)
    80008094:	ffffd097          	auipc	ra,0xffffd
    80008098:	044080e7          	jalr	68(ra) # 800050d8 <iupdate>
  }
  iunlockput(dp);
    8000809c:	fe843503          	ld	a0,-24(s0)
    800080a0:	ffffd097          	auipc	ra,0xffffd
    800080a4:	4e6080e7          	jalr	1254(ra) # 80005586 <iunlockput>

  ip->nlink--;
    800080a8:	fe043783          	ld	a5,-32(s0)
    800080ac:	04a79783          	lh	a5,74(a5)
    800080b0:	17c2                	slli	a5,a5,0x30
    800080b2:	93c1                	srli	a5,a5,0x30
    800080b4:	37fd                	addiw	a5,a5,-1
    800080b6:	17c2                	slli	a5,a5,0x30
    800080b8:	93c1                	srli	a5,a5,0x30
    800080ba:	0107971b          	slliw	a4,a5,0x10
    800080be:	4107571b          	sraiw	a4,a4,0x10
    800080c2:	fe043783          	ld	a5,-32(s0)
    800080c6:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800080ca:	fe043503          	ld	a0,-32(s0)
    800080ce:	ffffd097          	auipc	ra,0xffffd
    800080d2:	00a080e7          	jalr	10(ra) # 800050d8 <iupdate>
  iunlockput(ip);
    800080d6:	fe043503          	ld	a0,-32(s0)
    800080da:	ffffd097          	auipc	ra,0xffffd
    800080de:	4ac080e7          	jalr	1196(ra) # 80005586 <iunlockput>

  end_op();
    800080e2:	ffffe097          	auipc	ra,0xffffe
    800080e6:	392080e7          	jalr	914(ra) # 80006474 <end_op>

  return 0;
    800080ea:	4781                	li	a5,0
    800080ec:	a839                	j	8000810a <sys_unlink+0x20e>
    goto bad;
    800080ee:	0001                	nop
    800080f0:	a011                	j	800080f4 <sys_unlink+0x1f8>
    goto bad;
    800080f2:	0001                	nop

bad:
  iunlockput(dp);
    800080f4:	fe843503          	ld	a0,-24(s0)
    800080f8:	ffffd097          	auipc	ra,0xffffd
    800080fc:	48e080e7          	jalr	1166(ra) # 80005586 <iunlockput>
  end_op();
    80008100:	ffffe097          	auipc	ra,0xffffe
    80008104:	374080e7          	jalr	884(ra) # 80006474 <end_op>
  return -1;
    80008108:	57fd                	li	a5,-1
}
    8000810a:	853e                	mv	a0,a5
    8000810c:	60ae                	ld	ra,200(sp)
    8000810e:	640e                	ld	s0,192(sp)
    80008110:	6169                	addi	sp,sp,208
    80008112:	8082                	ret

0000000080008114 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    80008114:	7139                	addi	sp,sp,-64
    80008116:	fc06                	sd	ra,56(sp)
    80008118:	f822                	sd	s0,48(sp)
    8000811a:	0080                	addi	s0,sp,64
    8000811c:	fca43423          	sd	a0,-56(s0)
    80008120:	87ae                	mv	a5,a1
    80008122:	8736                	mv	a4,a3
    80008124:	fcf41323          	sh	a5,-58(s0)
    80008128:	87b2                	mv	a5,a2
    8000812a:	fcf41223          	sh	a5,-60(s0)
    8000812e:	87ba                	mv	a5,a4
    80008130:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    80008134:	fd040793          	addi	a5,s0,-48
    80008138:	85be                	mv	a1,a5
    8000813a:	fc843503          	ld	a0,-56(s0)
    8000813e:	ffffe097          	auipc	ra,0xffffe
    80008142:	f3c080e7          	jalr	-196(ra) # 8000607a <nameiparent>
    80008146:	fea43423          	sd	a0,-24(s0)
    8000814a:	fe843783          	ld	a5,-24(s0)
    8000814e:	e399                	bnez	a5,80008154 <create+0x40>
    return 0;
    80008150:	4781                	li	a5,0
    80008152:	a2ed                	j	8000833c <create+0x228>

  ilock(dp);
    80008154:	fe843503          	ld	a0,-24(s0)
    80008158:	ffffd097          	auipc	ra,0xffffd
    8000815c:	1d0080e7          	jalr	464(ra) # 80005328 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008160:	fd040793          	addi	a5,s0,-48
    80008164:	4601                	li	a2,0
    80008166:	85be                	mv	a1,a5
    80008168:	fe843503          	ld	a0,-24(s0)
    8000816c:	ffffe097          	auipc	ra,0xffffe
    80008170:	aec080e7          	jalr	-1300(ra) # 80005c58 <dirlookup>
    80008174:	fea43023          	sd	a0,-32(s0)
    80008178:	fe043783          	ld	a5,-32(s0)
    8000817c:	c3ad                	beqz	a5,800081de <create+0xca>
    iunlockput(dp);
    8000817e:	fe843503          	ld	a0,-24(s0)
    80008182:	ffffd097          	auipc	ra,0xffffd
    80008186:	404080e7          	jalr	1028(ra) # 80005586 <iunlockput>
    ilock(ip);
    8000818a:	fe043503          	ld	a0,-32(s0)
    8000818e:	ffffd097          	auipc	ra,0xffffd
    80008192:	19a080e7          	jalr	410(ra) # 80005328 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80008196:	fc641783          	lh	a5,-58(s0)
    8000819a:	0007871b          	sext.w	a4,a5
    8000819e:	4789                	li	a5,2
    800081a0:	02f71763          	bne	a4,a5,800081ce <create+0xba>
    800081a4:	fe043783          	ld	a5,-32(s0)
    800081a8:	04479783          	lh	a5,68(a5)
    800081ac:	0007871b          	sext.w	a4,a5
    800081b0:	4789                	li	a5,2
    800081b2:	00f70b63          	beq	a4,a5,800081c8 <create+0xb4>
    800081b6:	fe043783          	ld	a5,-32(s0)
    800081ba:	04479783          	lh	a5,68(a5)
    800081be:	0007871b          	sext.w	a4,a5
    800081c2:	478d                	li	a5,3
    800081c4:	00f71563          	bne	a4,a5,800081ce <create+0xba>
      return ip;
    800081c8:	fe043783          	ld	a5,-32(s0)
    800081cc:	aa85                	j	8000833c <create+0x228>
    iunlockput(ip);
    800081ce:	fe043503          	ld	a0,-32(s0)
    800081d2:	ffffd097          	auipc	ra,0xffffd
    800081d6:	3b4080e7          	jalr	948(ra) # 80005586 <iunlockput>
    return 0;
    800081da:	4781                	li	a5,0
    800081dc:	a285                	j	8000833c <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    800081de:	fe843783          	ld	a5,-24(s0)
    800081e2:	439c                	lw	a5,0(a5)
    800081e4:	fc641703          	lh	a4,-58(s0)
    800081e8:	85ba                	mv	a1,a4
    800081ea:	853e                	mv	a0,a5
    800081ec:	ffffd097          	auipc	ra,0xffffd
    800081f0:	dee080e7          	jalr	-530(ra) # 80004fda <ialloc>
    800081f4:	fea43023          	sd	a0,-32(s0)
    800081f8:	fe043783          	ld	a5,-32(s0)
    800081fc:	eb89                	bnez	a5,8000820e <create+0xfa>
    iunlockput(dp);
    800081fe:	fe843503          	ld	a0,-24(s0)
    80008202:	ffffd097          	auipc	ra,0xffffd
    80008206:	384080e7          	jalr	900(ra) # 80005586 <iunlockput>
    return 0;
    8000820a:	4781                	li	a5,0
    8000820c:	aa05                	j	8000833c <create+0x228>
  }

  ilock(ip);
    8000820e:	fe043503          	ld	a0,-32(s0)
    80008212:	ffffd097          	auipc	ra,0xffffd
    80008216:	116080e7          	jalr	278(ra) # 80005328 <ilock>
  ip->major = major;
    8000821a:	fe043783          	ld	a5,-32(s0)
    8000821e:	fc445703          	lhu	a4,-60(s0)
    80008222:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    80008226:	fe043783          	ld	a5,-32(s0)
    8000822a:	fc245703          	lhu	a4,-62(s0)
    8000822e:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    80008232:	fe043783          	ld	a5,-32(s0)
    80008236:	4705                	li	a4,1
    80008238:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    8000823c:	fe043503          	ld	a0,-32(s0)
    80008240:	ffffd097          	auipc	ra,0xffffd
    80008244:	e98080e7          	jalr	-360(ra) # 800050d8 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008248:	fc641783          	lh	a5,-58(s0)
    8000824c:	0007871b          	sext.w	a4,a5
    80008250:	4785                	li	a5,1
    80008252:	04f71463          	bne	a4,a5,8000829a <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80008256:	fe043783          	ld	a5,-32(s0)
    8000825a:	43dc                	lw	a5,4(a5)
    8000825c:	863e                	mv	a2,a5
    8000825e:	00004597          	auipc	a1,0x4
    80008262:	3da58593          	addi	a1,a1,986 # 8000c638 <etext+0x638>
    80008266:	fe043503          	ld	a0,-32(s0)
    8000826a:	ffffe097          	auipc	ra,0xffffe
    8000826e:	ad6080e7          	jalr	-1322(ra) # 80005d40 <dirlink>
    80008272:	87aa                	mv	a5,a0
    80008274:	0807ca63          	bltz	a5,80008308 <create+0x1f4>
    80008278:	fe843783          	ld	a5,-24(s0)
    8000827c:	43dc                	lw	a5,4(a5)
    8000827e:	863e                	mv	a2,a5
    80008280:	00004597          	auipc	a1,0x4
    80008284:	3c058593          	addi	a1,a1,960 # 8000c640 <etext+0x640>
    80008288:	fe043503          	ld	a0,-32(s0)
    8000828c:	ffffe097          	auipc	ra,0xffffe
    80008290:	ab4080e7          	jalr	-1356(ra) # 80005d40 <dirlink>
    80008294:	87aa                	mv	a5,a0
    80008296:	0607c963          	bltz	a5,80008308 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    8000829a:	fe043783          	ld	a5,-32(s0)
    8000829e:	43d8                	lw	a4,4(a5)
    800082a0:	fd040793          	addi	a5,s0,-48
    800082a4:	863a                	mv	a2,a4
    800082a6:	85be                	mv	a1,a5
    800082a8:	fe843503          	ld	a0,-24(s0)
    800082ac:	ffffe097          	auipc	ra,0xffffe
    800082b0:	a94080e7          	jalr	-1388(ra) # 80005d40 <dirlink>
    800082b4:	87aa                	mv	a5,a0
    800082b6:	0407cb63          	bltz	a5,8000830c <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    800082ba:	fc641783          	lh	a5,-58(s0)
    800082be:	0007871b          	sext.w	a4,a5
    800082c2:	4785                	li	a5,1
    800082c4:	02f71963          	bne	a4,a5,800082f6 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    800082c8:	fe843783          	ld	a5,-24(s0)
    800082cc:	04a79783          	lh	a5,74(a5)
    800082d0:	17c2                	slli	a5,a5,0x30
    800082d2:	93c1                	srli	a5,a5,0x30
    800082d4:	2785                	addiw	a5,a5,1
    800082d6:	17c2                	slli	a5,a5,0x30
    800082d8:	93c1                	srli	a5,a5,0x30
    800082da:	0107971b          	slliw	a4,a5,0x10
    800082de:	4107571b          	sraiw	a4,a4,0x10
    800082e2:	fe843783          	ld	a5,-24(s0)
    800082e6:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800082ea:	fe843503          	ld	a0,-24(s0)
    800082ee:	ffffd097          	auipc	ra,0xffffd
    800082f2:	dea080e7          	jalr	-534(ra) # 800050d8 <iupdate>
  }

  iunlockput(dp);
    800082f6:	fe843503          	ld	a0,-24(s0)
    800082fa:	ffffd097          	auipc	ra,0xffffd
    800082fe:	28c080e7          	jalr	652(ra) # 80005586 <iunlockput>

  return ip;
    80008302:	fe043783          	ld	a5,-32(s0)
    80008306:	a81d                	j	8000833c <create+0x228>
      goto fail;
    80008308:	0001                	nop
    8000830a:	a011                	j	8000830e <create+0x1fa>
    goto fail;
    8000830c:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    8000830e:	fe043783          	ld	a5,-32(s0)
    80008312:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    80008316:	fe043503          	ld	a0,-32(s0)
    8000831a:	ffffd097          	auipc	ra,0xffffd
    8000831e:	dbe080e7          	jalr	-578(ra) # 800050d8 <iupdate>
  iunlockput(ip);
    80008322:	fe043503          	ld	a0,-32(s0)
    80008326:	ffffd097          	auipc	ra,0xffffd
    8000832a:	260080e7          	jalr	608(ra) # 80005586 <iunlockput>
  iunlockput(dp);
    8000832e:	fe843503          	ld	a0,-24(s0)
    80008332:	ffffd097          	auipc	ra,0xffffd
    80008336:	254080e7          	jalr	596(ra) # 80005586 <iunlockput>
  return 0;
    8000833a:	4781                	li	a5,0
}
    8000833c:	853e                	mv	a0,a5
    8000833e:	70e2                	ld	ra,56(sp)
    80008340:	7442                	ld	s0,48(sp)
    80008342:	6121                	addi	sp,sp,64
    80008344:	8082                	ret

0000000080008346 <sys_open>:

uint64
sys_open(void)
{
    80008346:	7131                	addi	sp,sp,-192
    80008348:	fd06                	sd	ra,184(sp)
    8000834a:	f922                	sd	s0,176(sp)
    8000834c:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    8000834e:	f4c40793          	addi	a5,s0,-180
    80008352:	85be                	mv	a1,a5
    80008354:	4505                	li	a0,1
    80008356:	ffffc097          	auipc	ra,0xffffc
    8000835a:	02a080e7          	jalr	42(ra) # 80004380 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    8000835e:	f5040793          	addi	a5,s0,-176
    80008362:	08000613          	li	a2,128
    80008366:	85be                	mv	a1,a5
    80008368:	4501                	li	a0,0
    8000836a:	ffffc097          	auipc	ra,0xffffc
    8000836e:	07e080e7          	jalr	126(ra) # 800043e8 <argstr>
    80008372:	87aa                	mv	a5,a0
    80008374:	fef42223          	sw	a5,-28(s0)
    80008378:	fe442783          	lw	a5,-28(s0)
    8000837c:	2781                	sext.w	a5,a5
    8000837e:	0007d463          	bgez	a5,80008386 <sys_open+0x40>
    return -1;
    80008382:	57fd                	li	a5,-1
    80008384:	a429                	j	8000858e <sys_open+0x248>

  begin_op();
    80008386:	ffffe097          	auipc	ra,0xffffe
    8000838a:	02c080e7          	jalr	44(ra) # 800063b2 <begin_op>

  if(omode & O_CREATE){
    8000838e:	f4c42783          	lw	a5,-180(s0)
    80008392:	2007f793          	andi	a5,a5,512
    80008396:	2781                	sext.w	a5,a5
    80008398:	c795                	beqz	a5,800083c4 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    8000839a:	f5040793          	addi	a5,s0,-176
    8000839e:	4681                	li	a3,0
    800083a0:	4601                	li	a2,0
    800083a2:	4589                	li	a1,2
    800083a4:	853e                	mv	a0,a5
    800083a6:	00000097          	auipc	ra,0x0
    800083aa:	d6e080e7          	jalr	-658(ra) # 80008114 <create>
    800083ae:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    800083b2:	fe843783          	ld	a5,-24(s0)
    800083b6:	e7bd                	bnez	a5,80008424 <sys_open+0xde>
      end_op();
    800083b8:	ffffe097          	auipc	ra,0xffffe
    800083bc:	0bc080e7          	jalr	188(ra) # 80006474 <end_op>
      return -1;
    800083c0:	57fd                	li	a5,-1
    800083c2:	a2f1                	j	8000858e <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    800083c4:	f5040793          	addi	a5,s0,-176
    800083c8:	853e                	mv	a0,a5
    800083ca:	ffffe097          	auipc	ra,0xffffe
    800083ce:	c84080e7          	jalr	-892(ra) # 8000604e <namei>
    800083d2:	fea43423          	sd	a0,-24(s0)
    800083d6:	fe843783          	ld	a5,-24(s0)
    800083da:	e799                	bnez	a5,800083e8 <sys_open+0xa2>
      end_op();
    800083dc:	ffffe097          	auipc	ra,0xffffe
    800083e0:	098080e7          	jalr	152(ra) # 80006474 <end_op>
      return -1;
    800083e4:	57fd                	li	a5,-1
    800083e6:	a265                	j	8000858e <sys_open+0x248>
    }
    ilock(ip);
    800083e8:	fe843503          	ld	a0,-24(s0)
    800083ec:	ffffd097          	auipc	ra,0xffffd
    800083f0:	f3c080e7          	jalr	-196(ra) # 80005328 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800083f4:	fe843783          	ld	a5,-24(s0)
    800083f8:	04479783          	lh	a5,68(a5)
    800083fc:	0007871b          	sext.w	a4,a5
    80008400:	4785                	li	a5,1
    80008402:	02f71163          	bne	a4,a5,80008424 <sys_open+0xde>
    80008406:	f4c42783          	lw	a5,-180(s0)
    8000840a:	cf89                	beqz	a5,80008424 <sys_open+0xde>
      iunlockput(ip);
    8000840c:	fe843503          	ld	a0,-24(s0)
    80008410:	ffffd097          	auipc	ra,0xffffd
    80008414:	176080e7          	jalr	374(ra) # 80005586 <iunlockput>
      end_op();
    80008418:	ffffe097          	auipc	ra,0xffffe
    8000841c:	05c080e7          	jalr	92(ra) # 80006474 <end_op>
      return -1;
    80008420:	57fd                	li	a5,-1
    80008422:	a2b5                	j	8000858e <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    80008424:	fe843783          	ld	a5,-24(s0)
    80008428:	04479783          	lh	a5,68(a5)
    8000842c:	0007871b          	sext.w	a4,a5
    80008430:	478d                	li	a5,3
    80008432:	02f71e63          	bne	a4,a5,8000846e <sys_open+0x128>
    80008436:	fe843783          	ld	a5,-24(s0)
    8000843a:	04679783          	lh	a5,70(a5)
    8000843e:	2781                	sext.w	a5,a5
    80008440:	0007cb63          	bltz	a5,80008456 <sys_open+0x110>
    80008444:	fe843783          	ld	a5,-24(s0)
    80008448:	04679783          	lh	a5,70(a5)
    8000844c:	0007871b          	sext.w	a4,a5
    80008450:	47a5                	li	a5,9
    80008452:	00e7de63          	bge	a5,a4,8000846e <sys_open+0x128>
    iunlockput(ip);
    80008456:	fe843503          	ld	a0,-24(s0)
    8000845a:	ffffd097          	auipc	ra,0xffffd
    8000845e:	12c080e7          	jalr	300(ra) # 80005586 <iunlockput>
    end_op();
    80008462:	ffffe097          	auipc	ra,0xffffe
    80008466:	012080e7          	jalr	18(ra) # 80006474 <end_op>
    return -1;
    8000846a:	57fd                	li	a5,-1
    8000846c:	a20d                	j	8000858e <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    8000846e:	ffffe097          	auipc	ra,0xffffe
    80008472:	4f4080e7          	jalr	1268(ra) # 80006962 <filealloc>
    80008476:	fca43c23          	sd	a0,-40(s0)
    8000847a:	fd843783          	ld	a5,-40(s0)
    8000847e:	cf99                	beqz	a5,8000849c <sys_open+0x156>
    80008480:	fd843503          	ld	a0,-40(s0)
    80008484:	fffff097          	auipc	ra,0xfffff
    80008488:	5e8080e7          	jalr	1512(ra) # 80007a6c <fdalloc>
    8000848c:	87aa                	mv	a5,a0
    8000848e:	fcf42a23          	sw	a5,-44(s0)
    80008492:	fd442783          	lw	a5,-44(s0)
    80008496:	2781                	sext.w	a5,a5
    80008498:	0207d763          	bgez	a5,800084c6 <sys_open+0x180>
    if(f)
    8000849c:	fd843783          	ld	a5,-40(s0)
    800084a0:	c799                	beqz	a5,800084ae <sys_open+0x168>
      fileclose(f);
    800084a2:	fd843503          	ld	a0,-40(s0)
    800084a6:	ffffe097          	auipc	ra,0xffffe
    800084aa:	5a6080e7          	jalr	1446(ra) # 80006a4c <fileclose>
    iunlockput(ip);
    800084ae:	fe843503          	ld	a0,-24(s0)
    800084b2:	ffffd097          	auipc	ra,0xffffd
    800084b6:	0d4080e7          	jalr	212(ra) # 80005586 <iunlockput>
    end_op();
    800084ba:	ffffe097          	auipc	ra,0xffffe
    800084be:	fba080e7          	jalr	-70(ra) # 80006474 <end_op>
    return -1;
    800084c2:	57fd                	li	a5,-1
    800084c4:	a0e9                	j	8000858e <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    800084c6:	fe843783          	ld	a5,-24(s0)
    800084ca:	04479783          	lh	a5,68(a5)
    800084ce:	0007871b          	sext.w	a4,a5
    800084d2:	478d                	li	a5,3
    800084d4:	00f71f63          	bne	a4,a5,800084f2 <sys_open+0x1ac>
    f->type = FD_DEVICE;
    800084d8:	fd843783          	ld	a5,-40(s0)
    800084dc:	470d                	li	a4,3
    800084de:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800084e0:	fe843783          	ld	a5,-24(s0)
    800084e4:	04679703          	lh	a4,70(a5)
    800084e8:	fd843783          	ld	a5,-40(s0)
    800084ec:	02e79223          	sh	a4,36(a5)
    800084f0:	a809                	j	80008502 <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    800084f2:	fd843783          	ld	a5,-40(s0)
    800084f6:	4709                	li	a4,2
    800084f8:	c398                	sw	a4,0(a5)
    f->off = 0;
    800084fa:	fd843783          	ld	a5,-40(s0)
    800084fe:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    80008502:	fd843783          	ld	a5,-40(s0)
    80008506:	fe843703          	ld	a4,-24(s0)
    8000850a:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    8000850c:	f4c42783          	lw	a5,-180(s0)
    80008510:	8b85                	andi	a5,a5,1
    80008512:	2781                	sext.w	a5,a5
    80008514:	0017b793          	seqz	a5,a5
    80008518:	0ff7f793          	andi	a5,a5,255
    8000851c:	873e                	mv	a4,a5
    8000851e:	fd843783          	ld	a5,-40(s0)
    80008522:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    80008526:	f4c42783          	lw	a5,-180(s0)
    8000852a:	8b85                	andi	a5,a5,1
    8000852c:	2781                	sext.w	a5,a5
    8000852e:	e791                	bnez	a5,8000853a <sys_open+0x1f4>
    80008530:	f4c42783          	lw	a5,-180(s0)
    80008534:	8b89                	andi	a5,a5,2
    80008536:	2781                	sext.w	a5,a5
    80008538:	c399                	beqz	a5,8000853e <sys_open+0x1f8>
    8000853a:	4785                	li	a5,1
    8000853c:	a011                	j	80008540 <sys_open+0x1fa>
    8000853e:	4781                	li	a5,0
    80008540:	0ff7f713          	andi	a4,a5,255
    80008544:	fd843783          	ld	a5,-40(s0)
    80008548:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000854c:	f4c42783          	lw	a5,-180(s0)
    80008550:	4007f793          	andi	a5,a5,1024
    80008554:	2781                	sext.w	a5,a5
    80008556:	c385                	beqz	a5,80008576 <sys_open+0x230>
    80008558:	fe843783          	ld	a5,-24(s0)
    8000855c:	04479783          	lh	a5,68(a5)
    80008560:	0007871b          	sext.w	a4,a5
    80008564:	4789                	li	a5,2
    80008566:	00f71863          	bne	a4,a5,80008576 <sys_open+0x230>
    itrunc(ip);
    8000856a:	fe843503          	ld	a0,-24(s0)
    8000856e:	ffffd097          	auipc	ra,0xffffd
    80008572:	1c2080e7          	jalr	450(ra) # 80005730 <itrunc>
  }

  iunlock(ip);
    80008576:	fe843503          	ld	a0,-24(s0)
    8000857a:	ffffd097          	auipc	ra,0xffffd
    8000857e:	ee2080e7          	jalr	-286(ra) # 8000545c <iunlock>
  end_op();
    80008582:	ffffe097          	auipc	ra,0xffffe
    80008586:	ef2080e7          	jalr	-270(ra) # 80006474 <end_op>

  return fd;
    8000858a:	fd442783          	lw	a5,-44(s0)
}
    8000858e:	853e                	mv	a0,a5
    80008590:	70ea                	ld	ra,184(sp)
    80008592:	744a                	ld	s0,176(sp)
    80008594:	6129                	addi	sp,sp,192
    80008596:	8082                	ret

0000000080008598 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008598:	7135                	addi	sp,sp,-160
    8000859a:	ed06                	sd	ra,152(sp)
    8000859c:	e922                	sd	s0,144(sp)
    8000859e:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    800085a0:	ffffe097          	auipc	ra,0xffffe
    800085a4:	e12080e7          	jalr	-494(ra) # 800063b2 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    800085a8:	f6840793          	addi	a5,s0,-152
    800085ac:	08000613          	li	a2,128
    800085b0:	85be                	mv	a1,a5
    800085b2:	4501                	li	a0,0
    800085b4:	ffffc097          	auipc	ra,0xffffc
    800085b8:	e34080e7          	jalr	-460(ra) # 800043e8 <argstr>
    800085bc:	87aa                	mv	a5,a0
    800085be:	0207c163          	bltz	a5,800085e0 <sys_mkdir+0x48>
    800085c2:	f6840793          	addi	a5,s0,-152
    800085c6:	4681                	li	a3,0
    800085c8:	4601                	li	a2,0
    800085ca:	4585                	li	a1,1
    800085cc:	853e                	mv	a0,a5
    800085ce:	00000097          	auipc	ra,0x0
    800085d2:	b46080e7          	jalr	-1210(ra) # 80008114 <create>
    800085d6:	fea43423          	sd	a0,-24(s0)
    800085da:	fe843783          	ld	a5,-24(s0)
    800085de:	e799                	bnez	a5,800085ec <sys_mkdir+0x54>
    end_op();
    800085e0:	ffffe097          	auipc	ra,0xffffe
    800085e4:	e94080e7          	jalr	-364(ra) # 80006474 <end_op>
    return -1;
    800085e8:	57fd                	li	a5,-1
    800085ea:	a821                	j	80008602 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800085ec:	fe843503          	ld	a0,-24(s0)
    800085f0:	ffffd097          	auipc	ra,0xffffd
    800085f4:	f96080e7          	jalr	-106(ra) # 80005586 <iunlockput>
  end_op();
    800085f8:	ffffe097          	auipc	ra,0xffffe
    800085fc:	e7c080e7          	jalr	-388(ra) # 80006474 <end_op>
  return 0;
    80008600:	4781                	li	a5,0
}
    80008602:	853e                	mv	a0,a5
    80008604:	60ea                	ld	ra,152(sp)
    80008606:	644a                	ld	s0,144(sp)
    80008608:	610d                	addi	sp,sp,160
    8000860a:	8082                	ret

000000008000860c <sys_mknod>:

uint64
sys_mknod(void)
{
    8000860c:	7135                	addi	sp,sp,-160
    8000860e:	ed06                	sd	ra,152(sp)
    80008610:	e922                	sd	s0,144(sp)
    80008612:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    80008614:	ffffe097          	auipc	ra,0xffffe
    80008618:	d9e080e7          	jalr	-610(ra) # 800063b2 <begin_op>
  argint(1, &major);
    8000861c:	f6440793          	addi	a5,s0,-156
    80008620:	85be                	mv	a1,a5
    80008622:	4505                	li	a0,1
    80008624:	ffffc097          	auipc	ra,0xffffc
    80008628:	d5c080e7          	jalr	-676(ra) # 80004380 <argint>
  argint(2, &minor);
    8000862c:	f6040793          	addi	a5,s0,-160
    80008630:	85be                	mv	a1,a5
    80008632:	4509                	li	a0,2
    80008634:	ffffc097          	auipc	ra,0xffffc
    80008638:	d4c080e7          	jalr	-692(ra) # 80004380 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    8000863c:	f6840793          	addi	a5,s0,-152
    80008640:	08000613          	li	a2,128
    80008644:	85be                	mv	a1,a5
    80008646:	4501                	li	a0,0
    80008648:	ffffc097          	auipc	ra,0xffffc
    8000864c:	da0080e7          	jalr	-608(ra) # 800043e8 <argstr>
    80008650:	87aa                	mv	a5,a0
    80008652:	0207cc63          	bltz	a5,8000868a <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008656:	f6442783          	lw	a5,-156(s0)
    8000865a:	0107971b          	slliw	a4,a5,0x10
    8000865e:	4107571b          	sraiw	a4,a4,0x10
    80008662:	f6042783          	lw	a5,-160(s0)
    80008666:	0107969b          	slliw	a3,a5,0x10
    8000866a:	4106d69b          	sraiw	a3,a3,0x10
    8000866e:	f6840793          	addi	a5,s0,-152
    80008672:	863a                	mv	a2,a4
    80008674:	458d                	li	a1,3
    80008676:	853e                	mv	a0,a5
    80008678:	00000097          	auipc	ra,0x0
    8000867c:	a9c080e7          	jalr	-1380(ra) # 80008114 <create>
    80008680:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008684:	fe843783          	ld	a5,-24(s0)
    80008688:	e799                	bnez	a5,80008696 <sys_mknod+0x8a>
    end_op();
    8000868a:	ffffe097          	auipc	ra,0xffffe
    8000868e:	dea080e7          	jalr	-534(ra) # 80006474 <end_op>
    return -1;
    80008692:	57fd                	li	a5,-1
    80008694:	a821                	j	800086ac <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008696:	fe843503          	ld	a0,-24(s0)
    8000869a:	ffffd097          	auipc	ra,0xffffd
    8000869e:	eec080e7          	jalr	-276(ra) # 80005586 <iunlockput>
  end_op();
    800086a2:	ffffe097          	auipc	ra,0xffffe
    800086a6:	dd2080e7          	jalr	-558(ra) # 80006474 <end_op>
  return 0;
    800086aa:	4781                	li	a5,0
}
    800086ac:	853e                	mv	a0,a5
    800086ae:	60ea                	ld	ra,152(sp)
    800086b0:	644a                	ld	s0,144(sp)
    800086b2:	610d                	addi	sp,sp,160
    800086b4:	8082                	ret

00000000800086b6 <sys_chdir>:

uint64
sys_chdir(void)
{
    800086b6:	7135                	addi	sp,sp,-160
    800086b8:	ed06                	sd	ra,152(sp)
    800086ba:	e922                	sd	s0,144(sp)
    800086bc:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    800086be:	ffffa097          	auipc	ra,0xffffa
    800086c2:	378080e7          	jalr	888(ra) # 80002a36 <myproc>
    800086c6:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800086ca:	ffffe097          	auipc	ra,0xffffe
    800086ce:	ce8080e7          	jalr	-792(ra) # 800063b2 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800086d2:	f6040793          	addi	a5,s0,-160
    800086d6:	08000613          	li	a2,128
    800086da:	85be                	mv	a1,a5
    800086dc:	4501                	li	a0,0
    800086de:	ffffc097          	auipc	ra,0xffffc
    800086e2:	d0a080e7          	jalr	-758(ra) # 800043e8 <argstr>
    800086e6:	87aa                	mv	a5,a0
    800086e8:	0007ce63          	bltz	a5,80008704 <sys_chdir+0x4e>
    800086ec:	f6040793          	addi	a5,s0,-160
    800086f0:	853e                	mv	a0,a5
    800086f2:	ffffe097          	auipc	ra,0xffffe
    800086f6:	95c080e7          	jalr	-1700(ra) # 8000604e <namei>
    800086fa:	fea43023          	sd	a0,-32(s0)
    800086fe:	fe043783          	ld	a5,-32(s0)
    80008702:	e799                	bnez	a5,80008710 <sys_chdir+0x5a>
    end_op();
    80008704:	ffffe097          	auipc	ra,0xffffe
    80008708:	d70080e7          	jalr	-656(ra) # 80006474 <end_op>
    return -1;
    8000870c:	57fd                	li	a5,-1
    8000870e:	a0b5                	j	8000877a <sys_chdir+0xc4>
  }
  ilock(ip);
    80008710:	fe043503          	ld	a0,-32(s0)
    80008714:	ffffd097          	auipc	ra,0xffffd
    80008718:	c14080e7          	jalr	-1004(ra) # 80005328 <ilock>
  if(ip->type != T_DIR){
    8000871c:	fe043783          	ld	a5,-32(s0)
    80008720:	04479783          	lh	a5,68(a5)
    80008724:	0007871b          	sext.w	a4,a5
    80008728:	4785                	li	a5,1
    8000872a:	00f70e63          	beq	a4,a5,80008746 <sys_chdir+0x90>
    iunlockput(ip);
    8000872e:	fe043503          	ld	a0,-32(s0)
    80008732:	ffffd097          	auipc	ra,0xffffd
    80008736:	e54080e7          	jalr	-428(ra) # 80005586 <iunlockput>
    end_op();
    8000873a:	ffffe097          	auipc	ra,0xffffe
    8000873e:	d3a080e7          	jalr	-710(ra) # 80006474 <end_op>
    return -1;
    80008742:	57fd                	li	a5,-1
    80008744:	a81d                	j	8000877a <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008746:	fe043503          	ld	a0,-32(s0)
    8000874a:	ffffd097          	auipc	ra,0xffffd
    8000874e:	d12080e7          	jalr	-750(ra) # 8000545c <iunlock>
  iput(p->cwd);
    80008752:	fe843783          	ld	a5,-24(s0)
    80008756:	1507b783          	ld	a5,336(a5)
    8000875a:	853e                	mv	a0,a5
    8000875c:	ffffd097          	auipc	ra,0xffffd
    80008760:	d5a080e7          	jalr	-678(ra) # 800054b6 <iput>
  end_op();
    80008764:	ffffe097          	auipc	ra,0xffffe
    80008768:	d10080e7          	jalr	-752(ra) # 80006474 <end_op>
  p->cwd = ip;
    8000876c:	fe843783          	ld	a5,-24(s0)
    80008770:	fe043703          	ld	a4,-32(s0)
    80008774:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008778:	4781                	li	a5,0
}
    8000877a:	853e                	mv	a0,a5
    8000877c:	60ea                	ld	ra,152(sp)
    8000877e:	644a                	ld	s0,144(sp)
    80008780:	610d                	addi	sp,sp,160
    80008782:	8082                	ret

0000000080008784 <sys_exec>:

uint64
sys_exec(void)
{
    80008784:	7161                	addi	sp,sp,-432
    80008786:	f706                	sd	ra,424(sp)
    80008788:	f322                	sd	s0,416(sp)
    8000878a:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    8000878c:	e6040793          	addi	a5,s0,-416
    80008790:	85be                	mv	a1,a5
    80008792:	4505                	li	a0,1
    80008794:	ffffc097          	auipc	ra,0xffffc
    80008798:	c22080e7          	jalr	-990(ra) # 800043b6 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    8000879c:	f6840793          	addi	a5,s0,-152
    800087a0:	08000613          	li	a2,128
    800087a4:	85be                	mv	a1,a5
    800087a6:	4501                	li	a0,0
    800087a8:	ffffc097          	auipc	ra,0xffffc
    800087ac:	c40080e7          	jalr	-960(ra) # 800043e8 <argstr>
    800087b0:	87aa                	mv	a5,a0
    800087b2:	0007d463          	bgez	a5,800087ba <sys_exec+0x36>
    return -1;
    800087b6:	57fd                	li	a5,-1
    800087b8:	a249                	j	8000893a <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    800087ba:	e6840793          	addi	a5,s0,-408
    800087be:	10000613          	li	a2,256
    800087c2:	4581                	li	a1,0
    800087c4:	853e                	mv	a0,a5
    800087c6:	ffff9097          	auipc	ra,0xffff9
    800087ca:	d4a080e7          	jalr	-694(ra) # 80001510 <memset>
  for(i=0;; i++){
    800087ce:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800087d2:	fec42783          	lw	a5,-20(s0)
    800087d6:	873e                	mv	a4,a5
    800087d8:	47fd                	li	a5,31
    800087da:	10e7e463          	bltu	a5,a4,800088e2 <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800087de:	fec42783          	lw	a5,-20(s0)
    800087e2:	00379713          	slli	a4,a5,0x3
    800087e6:	e6043783          	ld	a5,-416(s0)
    800087ea:	97ba                	add	a5,a5,a4
    800087ec:	e5840713          	addi	a4,s0,-424
    800087f0:	85ba                	mv	a1,a4
    800087f2:	853e                	mv	a0,a5
    800087f4:	ffffc097          	auipc	ra,0xffffc
    800087f8:	a1a080e7          	jalr	-1510(ra) # 8000420e <fetchaddr>
    800087fc:	87aa                	mv	a5,a0
    800087fe:	0e07c463          	bltz	a5,800088e6 <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    80008802:	e5843783          	ld	a5,-424(s0)
    80008806:	eb95                	bnez	a5,8000883a <sys_exec+0xb6>
      argv[i] = 0;
    80008808:	fec42783          	lw	a5,-20(s0)
    8000880c:	078e                	slli	a5,a5,0x3
    8000880e:	ff040713          	addi	a4,s0,-16
    80008812:	97ba                	add	a5,a5,a4
    80008814:	e607bc23          	sd	zero,-392(a5)
      break;
    80008818:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    8000881a:	e6840713          	addi	a4,s0,-408
    8000881e:	f6840793          	addi	a5,s0,-152
    80008822:	85ba                	mv	a1,a4
    80008824:	853e                	mv	a0,a5
    80008826:	fffff097          	auipc	ra,0xfffff
    8000882a:	c1e080e7          	jalr	-994(ra) # 80007444 <exec>
    8000882e:	87aa                	mv	a5,a0
    80008830:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008834:	fe042623          	sw	zero,-20(s0)
    80008838:	a059                	j	800088be <sys_exec+0x13a>
    argv[i] = kalloc();
    8000883a:	ffff9097          	auipc	ra,0xffff9
    8000883e:	99c080e7          	jalr	-1636(ra) # 800011d6 <kalloc>
    80008842:	872a                	mv	a4,a0
    80008844:	fec42783          	lw	a5,-20(s0)
    80008848:	078e                	slli	a5,a5,0x3
    8000884a:	ff040693          	addi	a3,s0,-16
    8000884e:	97b6                	add	a5,a5,a3
    80008850:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008854:	fec42783          	lw	a5,-20(s0)
    80008858:	078e                	slli	a5,a5,0x3
    8000885a:	ff040713          	addi	a4,s0,-16
    8000885e:	97ba                	add	a5,a5,a4
    80008860:	e787b783          	ld	a5,-392(a5)
    80008864:	c3d9                	beqz	a5,800088ea <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008866:	e5843703          	ld	a4,-424(s0)
    8000886a:	fec42783          	lw	a5,-20(s0)
    8000886e:	078e                	slli	a5,a5,0x3
    80008870:	ff040693          	addi	a3,s0,-16
    80008874:	97b6                	add	a5,a5,a3
    80008876:	e787b783          	ld	a5,-392(a5)
    8000887a:	6605                	lui	a2,0x1
    8000887c:	85be                	mv	a1,a5
    8000887e:	853a                	mv	a0,a4
    80008880:	ffffc097          	auipc	ra,0xffffc
    80008884:	9fc080e7          	jalr	-1540(ra) # 8000427c <fetchstr>
    80008888:	87aa                	mv	a5,a0
    8000888a:	0607c263          	bltz	a5,800088ee <sys_exec+0x16a>
  for(i=0;; i++){
    8000888e:	fec42783          	lw	a5,-20(s0)
    80008892:	2785                	addiw	a5,a5,1
    80008894:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008898:	bf2d                	j	800087d2 <sys_exec+0x4e>
    kfree(argv[i]);
    8000889a:	fec42783          	lw	a5,-20(s0)
    8000889e:	078e                	slli	a5,a5,0x3
    800088a0:	ff040713          	addi	a4,s0,-16
    800088a4:	97ba                	add	a5,a5,a4
    800088a6:	e787b783          	ld	a5,-392(a5)
    800088aa:	853e                	mv	a0,a5
    800088ac:	ffff9097          	auipc	ra,0xffff9
    800088b0:	884080e7          	jalr	-1916(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088b4:	fec42783          	lw	a5,-20(s0)
    800088b8:	2785                	addiw	a5,a5,1
    800088ba:	fef42623          	sw	a5,-20(s0)
    800088be:	fec42783          	lw	a5,-20(s0)
    800088c2:	873e                	mv	a4,a5
    800088c4:	47fd                	li	a5,31
    800088c6:	00e7eb63          	bltu	a5,a4,800088dc <sys_exec+0x158>
    800088ca:	fec42783          	lw	a5,-20(s0)
    800088ce:	078e                	slli	a5,a5,0x3
    800088d0:	ff040713          	addi	a4,s0,-16
    800088d4:	97ba                	add	a5,a5,a4
    800088d6:	e787b783          	ld	a5,-392(a5)
    800088da:	f3e1                	bnez	a5,8000889a <sys_exec+0x116>

  return ret;
    800088dc:	fe842783          	lw	a5,-24(s0)
    800088e0:	a8a9                	j	8000893a <sys_exec+0x1b6>
      goto bad;
    800088e2:	0001                	nop
    800088e4:	a031                	j	800088f0 <sys_exec+0x16c>
      goto bad;
    800088e6:	0001                	nop
    800088e8:	a021                	j	800088f0 <sys_exec+0x16c>
      goto bad;
    800088ea:	0001                	nop
    800088ec:	a011                	j	800088f0 <sys_exec+0x16c>
      goto bad;
    800088ee:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088f0:	fe042623          	sw	zero,-20(s0)
    800088f4:	a01d                	j	8000891a <sys_exec+0x196>
    kfree(argv[i]);
    800088f6:	fec42783          	lw	a5,-20(s0)
    800088fa:	078e                	slli	a5,a5,0x3
    800088fc:	ff040713          	addi	a4,s0,-16
    80008900:	97ba                	add	a5,a5,a4
    80008902:	e787b783          	ld	a5,-392(a5)
    80008906:	853e                	mv	a0,a5
    80008908:	ffff9097          	auipc	ra,0xffff9
    8000890c:	828080e7          	jalr	-2008(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008910:	fec42783          	lw	a5,-20(s0)
    80008914:	2785                	addiw	a5,a5,1
    80008916:	fef42623          	sw	a5,-20(s0)
    8000891a:	fec42783          	lw	a5,-20(s0)
    8000891e:	873e                	mv	a4,a5
    80008920:	47fd                	li	a5,31
    80008922:	00e7eb63          	bltu	a5,a4,80008938 <sys_exec+0x1b4>
    80008926:	fec42783          	lw	a5,-20(s0)
    8000892a:	078e                	slli	a5,a5,0x3
    8000892c:	ff040713          	addi	a4,s0,-16
    80008930:	97ba                	add	a5,a5,a4
    80008932:	e787b783          	ld	a5,-392(a5)
    80008936:	f3e1                	bnez	a5,800088f6 <sys_exec+0x172>
  return -1;
    80008938:	57fd                	li	a5,-1
}
    8000893a:	853e                	mv	a0,a5
    8000893c:	70ba                	ld	ra,424(sp)
    8000893e:	741a                	ld	s0,416(sp)
    80008940:	615d                	addi	sp,sp,432
    80008942:	8082                	ret

0000000080008944 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008944:	7139                	addi	sp,sp,-64
    80008946:	fc06                	sd	ra,56(sp)
    80008948:	f822                	sd	s0,48(sp)
    8000894a:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    8000894c:	ffffa097          	auipc	ra,0xffffa
    80008950:	0ea080e7          	jalr	234(ra) # 80002a36 <myproc>
    80008954:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008958:	fe040793          	addi	a5,s0,-32
    8000895c:	85be                	mv	a1,a5
    8000895e:	4501                	li	a0,0
    80008960:	ffffc097          	auipc	ra,0xffffc
    80008964:	a56080e7          	jalr	-1450(ra) # 800043b6 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008968:	fd040713          	addi	a4,s0,-48
    8000896c:	fd840793          	addi	a5,s0,-40
    80008970:	85ba                	mv	a1,a4
    80008972:	853e                	mv	a0,a5
    80008974:	ffffe097          	auipc	ra,0xffffe
    80008978:	5ee080e7          	jalr	1518(ra) # 80006f62 <pipealloc>
    8000897c:	87aa                	mv	a5,a0
    8000897e:	0007d463          	bgez	a5,80008986 <sys_pipe+0x42>
    return -1;
    80008982:	57fd                	li	a5,-1
    80008984:	a219                	j	80008a8a <sys_pipe+0x146>
  fd0 = -1;
    80008986:	57fd                	li	a5,-1
    80008988:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    8000898c:	fd843783          	ld	a5,-40(s0)
    80008990:	853e                	mv	a0,a5
    80008992:	fffff097          	auipc	ra,0xfffff
    80008996:	0da080e7          	jalr	218(ra) # 80007a6c <fdalloc>
    8000899a:	87aa                	mv	a5,a0
    8000899c:	fcf42623          	sw	a5,-52(s0)
    800089a0:	fcc42783          	lw	a5,-52(s0)
    800089a4:	0207c063          	bltz	a5,800089c4 <sys_pipe+0x80>
    800089a8:	fd043783          	ld	a5,-48(s0)
    800089ac:	853e                	mv	a0,a5
    800089ae:	fffff097          	auipc	ra,0xfffff
    800089b2:	0be080e7          	jalr	190(ra) # 80007a6c <fdalloc>
    800089b6:	87aa                	mv	a5,a0
    800089b8:	fcf42423          	sw	a5,-56(s0)
    800089bc:	fc842783          	lw	a5,-56(s0)
    800089c0:	0207df63          	bgez	a5,800089fe <sys_pipe+0xba>
    if(fd0 >= 0)
    800089c4:	fcc42783          	lw	a5,-52(s0)
    800089c8:	0007cb63          	bltz	a5,800089de <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    800089cc:	fcc42783          	lw	a5,-52(s0)
    800089d0:	fe843703          	ld	a4,-24(s0)
    800089d4:	07e9                	addi	a5,a5,26
    800089d6:	078e                	slli	a5,a5,0x3
    800089d8:	97ba                	add	a5,a5,a4
    800089da:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800089de:	fd843783          	ld	a5,-40(s0)
    800089e2:	853e                	mv	a0,a5
    800089e4:	ffffe097          	auipc	ra,0xffffe
    800089e8:	068080e7          	jalr	104(ra) # 80006a4c <fileclose>
    fileclose(wf);
    800089ec:	fd043783          	ld	a5,-48(s0)
    800089f0:	853e                	mv	a0,a5
    800089f2:	ffffe097          	auipc	ra,0xffffe
    800089f6:	05a080e7          	jalr	90(ra) # 80006a4c <fileclose>
    return -1;
    800089fa:	57fd                	li	a5,-1
    800089fc:	a079                	j	80008a8a <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800089fe:	fe843783          	ld	a5,-24(s0)
    80008a02:	6bbc                	ld	a5,80(a5)
    80008a04:	fe043703          	ld	a4,-32(s0)
    80008a08:	fcc40613          	addi	a2,s0,-52
    80008a0c:	4691                	li	a3,4
    80008a0e:	85ba                	mv	a1,a4
    80008a10:	853e                	mv	a0,a5
    80008a12:	ffffa097          	auipc	ra,0xffffa
    80008a16:	aee080e7          	jalr	-1298(ra) # 80002500 <copyout>
    80008a1a:	87aa                	mv	a5,a0
    80008a1c:	0207c463          	bltz	a5,80008a44 <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008a20:	fe843783          	ld	a5,-24(s0)
    80008a24:	6bb8                	ld	a4,80(a5)
    80008a26:	fe043783          	ld	a5,-32(s0)
    80008a2a:	0791                	addi	a5,a5,4
    80008a2c:	fc840613          	addi	a2,s0,-56
    80008a30:	4691                	li	a3,4
    80008a32:	85be                	mv	a1,a5
    80008a34:	853a                	mv	a0,a4
    80008a36:	ffffa097          	auipc	ra,0xffffa
    80008a3a:	aca080e7          	jalr	-1334(ra) # 80002500 <copyout>
    80008a3e:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008a40:	0407d463          	bgez	a5,80008a88 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008a44:	fcc42783          	lw	a5,-52(s0)
    80008a48:	fe843703          	ld	a4,-24(s0)
    80008a4c:	07e9                	addi	a5,a5,26
    80008a4e:	078e                	slli	a5,a5,0x3
    80008a50:	97ba                	add	a5,a5,a4
    80008a52:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008a56:	fc842783          	lw	a5,-56(s0)
    80008a5a:	fe843703          	ld	a4,-24(s0)
    80008a5e:	07e9                	addi	a5,a5,26
    80008a60:	078e                	slli	a5,a5,0x3
    80008a62:	97ba                	add	a5,a5,a4
    80008a64:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a68:	fd843783          	ld	a5,-40(s0)
    80008a6c:	853e                	mv	a0,a5
    80008a6e:	ffffe097          	auipc	ra,0xffffe
    80008a72:	fde080e7          	jalr	-34(ra) # 80006a4c <fileclose>
    fileclose(wf);
    80008a76:	fd043783          	ld	a5,-48(s0)
    80008a7a:	853e                	mv	a0,a5
    80008a7c:	ffffe097          	auipc	ra,0xffffe
    80008a80:	fd0080e7          	jalr	-48(ra) # 80006a4c <fileclose>
    return -1;
    80008a84:	57fd                	li	a5,-1
    80008a86:	a011                	j	80008a8a <sys_pipe+0x146>
  }
  return 0;
    80008a88:	4781                	li	a5,0
}
    80008a8a:	853e                	mv	a0,a5
    80008a8c:	70e2                	ld	ra,56(sp)
    80008a8e:	7442                	ld	s0,48(sp)
    80008a90:	6121                	addi	sp,sp,64
    80008a92:	8082                	ret
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
    80008ae0:	c8afb0ef          	jal	ra,80003f6a <kerneltrap>
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
    80008b94:	e48080e7          	jalr	-440(ra) # 800029d8 <cpuid>
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
    80008be8:	df4080e7          	jalr	-524(ra) # 800029d8 <cpuid>
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
    80008c2c:	db0080e7          	jalr	-592(ra) # 800029d8 <cpuid>
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

0000000080008ce2 <setBit>:

static struct Bitset {
  uint32 bits[DISK_PAGES_COUNT / BITS_PER_UINT];
} diskpagesallocated = {{0} };

void setBit(int index) {
    80008ce2:	7179                	addi	sp,sp,-48
    80008ce4:	f422                	sd	s0,40(sp)
    80008ce6:	1800                	addi	s0,sp,48
    80008ce8:	87aa                	mv	a5,a0
    80008cea:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008cee:	fdc42783          	lw	a5,-36(s0)
    80008cf2:	8395                	srli	a5,a5,0x5
    80008cf4:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008cf8:	fdc42783          	lw	a5,-36(s0)
    80008cfc:	8bfd                	andi	a5,a5,31
    80008cfe:	fef42423          	sw	a5,-24(s0)
  diskpagesallocated.bits[arrayIndex] |= (1 << bitOffset);
    80008d02:	0001d717          	auipc	a4,0x1d
    80008d06:	00670713          	addi	a4,a4,6 # 80025d08 <diskpagesallocated>
    80008d0a:	fec42783          	lw	a5,-20(s0)
    80008d0e:	078a                	slli	a5,a5,0x2
    80008d10:	97ba                	add	a5,a5,a4
    80008d12:	4394                	lw	a3,0(a5)
    80008d14:	fe842783          	lw	a5,-24(s0)
    80008d18:	4705                	li	a4,1
    80008d1a:	00f717bb          	sllw	a5,a4,a5
    80008d1e:	2781                	sext.w	a5,a5
    80008d20:	2781                	sext.w	a5,a5
    80008d22:	8736                	mv	a4,a3
    80008d24:	8fd9                	or	a5,a5,a4
    80008d26:	0007871b          	sext.w	a4,a5
    80008d2a:	0001d697          	auipc	a3,0x1d
    80008d2e:	fde68693          	addi	a3,a3,-34 # 80025d08 <diskpagesallocated>
    80008d32:	fec42783          	lw	a5,-20(s0)
    80008d36:	078a                	slli	a5,a5,0x2
    80008d38:	97b6                	add	a5,a5,a3
    80008d3a:	c398                	sw	a4,0(a5)
}
    80008d3c:	0001                	nop
    80008d3e:	7422                	ld	s0,40(sp)
    80008d40:	6145                	addi	sp,sp,48
    80008d42:	8082                	ret

0000000080008d44 <clearBit>:

void clearBit(int index) {
    80008d44:	7179                	addi	sp,sp,-48
    80008d46:	f422                	sd	s0,40(sp)
    80008d48:	1800                	addi	s0,sp,48
    80008d4a:	87aa                	mv	a5,a0
    80008d4c:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008d50:	fdc42783          	lw	a5,-36(s0)
    80008d54:	8395                	srli	a5,a5,0x5
    80008d56:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008d5a:	fdc42783          	lw	a5,-36(s0)
    80008d5e:	8bfd                	andi	a5,a5,31
    80008d60:	fef42423          	sw	a5,-24(s0)
  diskpagesallocated.bits[arrayIndex] &= ~(1 << bitOffset);
    80008d64:	0001d717          	auipc	a4,0x1d
    80008d68:	fa470713          	addi	a4,a4,-92 # 80025d08 <diskpagesallocated>
    80008d6c:	fec42783          	lw	a5,-20(s0)
    80008d70:	078a                	slli	a5,a5,0x2
    80008d72:	97ba                	add	a5,a5,a4
    80008d74:	4394                	lw	a3,0(a5)
    80008d76:	fe842783          	lw	a5,-24(s0)
    80008d7a:	4705                	li	a4,1
    80008d7c:	00f717bb          	sllw	a5,a4,a5
    80008d80:	2781                	sext.w	a5,a5
    80008d82:	fff7c793          	not	a5,a5
    80008d86:	2781                	sext.w	a5,a5
    80008d88:	2781                	sext.w	a5,a5
    80008d8a:	8736                	mv	a4,a3
    80008d8c:	8ff9                	and	a5,a5,a4
    80008d8e:	0007871b          	sext.w	a4,a5
    80008d92:	0001d697          	auipc	a3,0x1d
    80008d96:	f7668693          	addi	a3,a3,-138 # 80025d08 <diskpagesallocated>
    80008d9a:	fec42783          	lw	a5,-20(s0)
    80008d9e:	078a                	slli	a5,a5,0x2
    80008da0:	97b6                	add	a5,a5,a3
    80008da2:	c398                	sw	a4,0(a5)
}
    80008da4:	0001                	nop
    80008da6:	7422                	ld	s0,40(sp)
    80008da8:	6145                	addi	sp,sp,48
    80008daa:	8082                	ret

0000000080008dac <getBit>:

int getBit(int index) {
    80008dac:	7179                	addi	sp,sp,-48
    80008dae:	f422                	sd	s0,40(sp)
    80008db0:	1800                	addi	s0,sp,48
    80008db2:	87aa                	mv	a5,a0
    80008db4:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008db8:	fdc42783          	lw	a5,-36(s0)
    80008dbc:	8395                	srli	a5,a5,0x5
    80008dbe:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008dc2:	fdc42783          	lw	a5,-36(s0)
    80008dc6:	8bfd                	andi	a5,a5,31
    80008dc8:	fef42423          	sw	a5,-24(s0)
  return (diskpagesallocated.bits[arrayIndex] >> bitOffset) & 1;
    80008dcc:	0001d717          	auipc	a4,0x1d
    80008dd0:	f3c70713          	addi	a4,a4,-196 # 80025d08 <diskpagesallocated>
    80008dd4:	fec42783          	lw	a5,-20(s0)
    80008dd8:	078a                	slli	a5,a5,0x2
    80008dda:	97ba                	add	a5,a5,a4
    80008ddc:	4398                	lw	a4,0(a5)
    80008dde:	fe842783          	lw	a5,-24(s0)
    80008de2:	00f757bb          	srlw	a5,a4,a5
    80008de6:	2781                	sext.w	a5,a5
    80008de8:	2781                	sext.w	a5,a5
    80008dea:	8b85                	andi	a5,a5,1
    80008dec:	2781                	sext.w	a5,a5
}
    80008dee:	853e                	mv	a0,a5
    80008df0:	7422                	ld	s0,40(sp)
    80008df2:	6145                	addi	sp,sp,48
    80008df4:	8082                	ret

0000000080008df6 <findFirstFreePage>:

int findFirstFreePage() {
    80008df6:	1101                	addi	sp,sp,-32
    80008df8:	ec06                	sd	ra,24(sp)
    80008dfa:	e822                	sd	s0,16(sp)
    80008dfc:	1000                	addi	s0,sp,32
  for (int i = 0; i < DISK_PAGES_COUNT; ++i) {
    80008dfe:	fe042623          	sw	zero,-20(s0)
    80008e02:	a015                	j	80008e26 <findFirstFreePage+0x30>
    if (getBit(i) == 0) {
    80008e04:	fec42783          	lw	a5,-20(s0)
    80008e08:	853e                	mv	a0,a5
    80008e0a:	00000097          	auipc	ra,0x0
    80008e0e:	fa2080e7          	jalr	-94(ra) # 80008dac <getBit>
    80008e12:	87aa                	mv	a5,a0
    80008e14:	e781                	bnez	a5,80008e1c <findFirstFreePage+0x26>
      return i;
    80008e16:	fec42783          	lw	a5,-20(s0)
    80008e1a:	a839                	j	80008e38 <findFirstFreePage+0x42>
  for (int i = 0; i < DISK_PAGES_COUNT; ++i) {
    80008e1c:	fec42783          	lw	a5,-20(s0)
    80008e20:	2785                	addiw	a5,a5,1
    80008e22:	fef42623          	sw	a5,-20(s0)
    80008e26:	fec42783          	lw	a5,-20(s0)
    80008e2a:	0007871b          	sext.w	a4,a5
    80008e2e:	0ff00793          	li	a5,255
    80008e32:	fce7d9e3          	bge	a5,a4,80008e04 <findFirstFreePage+0xe>
    }
  }
  return -1; // Return -1 if no clear bit is found
    80008e36:	57fd                	li	a5,-1
}
    80008e38:	853e                	mv	a0,a5
    80008e3a:	60e2                	ld	ra,24(sp)
    80008e3c:	6442                	ld	s0,16(sp)
    80008e3e:	6105                	addi	sp,sp,32
    80008e40:	8082                	ret

0000000080008e42 <takeFirstFreePage>:

int takeFirstFreePage() {
    80008e42:	1101                	addi	sp,sp,-32
    80008e44:	ec06                	sd	ra,24(sp)
    80008e46:	e822                	sd	s0,16(sp)
    80008e48:	1000                	addi	s0,sp,32
  int index = findFirstFreePage();
    80008e4a:	00000097          	auipc	ra,0x0
    80008e4e:	fac080e7          	jalr	-84(ra) # 80008df6 <findFirstFreePage>
    80008e52:	87aa                	mv	a5,a0
    80008e54:	fef42623          	sw	a5,-20(s0)
  if(index < 0) return -1;
    80008e58:	fec42783          	lw	a5,-20(s0)
    80008e5c:	2781                	sext.w	a5,a5
    80008e5e:	0007d463          	bgez	a5,80008e66 <takeFirstFreePage+0x24>
    80008e62:	57fd                	li	a5,-1
    80008e64:	a811                	j	80008e78 <takeFirstFreePage+0x36>
  setBit(index);
    80008e66:	fec42783          	lw	a5,-20(s0)
    80008e6a:	853e                	mv	a0,a5
    80008e6c:	00000097          	auipc	ra,0x0
    80008e70:	e76080e7          	jalr	-394(ra) # 80008ce2 <setBit>
  return index;
    80008e74:	fec42783          	lw	a5,-20(s0)
}
    80008e78:	853e                	mv	a0,a5
    80008e7a:	60e2                	ld	ra,24(sp)
    80008e7c:	6442                	ld	s0,16(sp)
    80008e7e:	6105                	addi	sp,sp,32
    80008e80:	8082                	ret

0000000080008e82 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    80008e82:	7139                	addi	sp,sp,-64
    80008e84:	fc06                	sd	ra,56(sp)
    80008e86:	f822                	sd	s0,48(sp)
    80008e88:	0080                	addi	s0,sp,64
    80008e8a:	87aa                	mv	a5,a0
    80008e8c:	fcb43023          	sd	a1,-64(s0)
    80008e90:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80008e94:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008e98:	fcc42703          	lw	a4,-52(s0)
    80008e9c:	15000793          	li	a5,336
    80008ea0:	02f707b3          	mul	a5,a4,a5
    80008ea4:	13078713          	addi	a4,a5,304 # c201130 <_entry-0x73dfeed0>
    80008ea8:	0001d797          	auipc	a5,0x1d
    80008eac:	e8078793          	addi	a5,a5,-384 # 80025d28 <disk>
    80008eb0:	97ba                	add	a5,a5,a4
    80008eb2:	fc043583          	ld	a1,-64(s0)
    80008eb6:	853e                	mv	a0,a5
    80008eb8:	ffff8097          	auipc	ra,0xffff8
    80008ebc:	454080e7          	jalr	1108(ra) # 8000130c <initlock>
  disk[id].name = name;
    80008ec0:	0001d717          	auipc	a4,0x1d
    80008ec4:	e6870713          	addi	a4,a4,-408 # 80025d28 <disk>
    80008ec8:	fcc42683          	lw	a3,-52(s0)
    80008ecc:	15000793          	li	a5,336
    80008ed0:	02f687b3          	mul	a5,a3,a5
    80008ed4:	97ba                	add	a5,a5,a4
    80008ed6:	fc043703          	ld	a4,-64(s0)
    80008eda:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008edc:	fcc42703          	lw	a4,-52(s0)
    80008ee0:	67c1                	lui	a5,0x10
    80008ee2:	0785                	addi	a5,a5,1
    80008ee4:	97ba                	add	a5,a5,a4
    80008ee6:	07b2                	slli	a5,a5,0xc
    80008ee8:	439c                	lw	a5,0(a5)
    80008eea:	2781                	sext.w	a5,a5
    80008eec:	873e                	mv	a4,a5
    80008eee:	747277b7          	lui	a5,0x74727
    80008ef2:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008ef6:	04f71c63          	bne	a4,a5,80008f4e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008efa:	fcc42703          	lw	a4,-52(s0)
    80008efe:	67c1                	lui	a5,0x10
    80008f00:	0785                	addi	a5,a5,1
    80008f02:	97ba                	add	a5,a5,a4
    80008f04:	07b2                	slli	a5,a5,0xc
    80008f06:	0791                	addi	a5,a5,4
    80008f08:	439c                	lw	a5,0(a5)
    80008f0a:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008f0c:	873e                	mv	a4,a5
    80008f0e:	4789                	li	a5,2
    80008f10:	02f71f63          	bne	a4,a5,80008f4e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008f14:	fcc42703          	lw	a4,-52(s0)
    80008f18:	67c1                	lui	a5,0x10
    80008f1a:	0785                	addi	a5,a5,1
    80008f1c:	97ba                	add	a5,a5,a4
    80008f1e:	07b2                	slli	a5,a5,0xc
    80008f20:	07a1                	addi	a5,a5,8
    80008f22:	439c                	lw	a5,0(a5)
    80008f24:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008f26:	873e                	mv	a4,a5
    80008f28:	4789                	li	a5,2
    80008f2a:	02f71263          	bne	a4,a5,80008f4e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008f2e:	fcc42703          	lw	a4,-52(s0)
    80008f32:	67c1                	lui	a5,0x10
    80008f34:	0785                	addi	a5,a5,1
    80008f36:	97ba                	add	a5,a5,a4
    80008f38:	07b2                	slli	a5,a5,0xc
    80008f3a:	07b1                	addi	a5,a5,12
    80008f3c:	439c                	lw	a5,0(a5)
    80008f3e:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008f40:	873e                	mv	a4,a5
    80008f42:	554d47b7          	lui	a5,0x554d4
    80008f46:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008f4a:	00f70d63          	beq	a4,a5,80008f64 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    80008f4e:	fc043603          	ld	a2,-64(s0)
    80008f52:	00003597          	auipc	a1,0x3
    80008f56:	71e58593          	addi	a1,a1,1822 # 8000c670 <etext+0x670>
    80008f5a:	4509                	li	a0,2
    80008f5c:	ffff8097          	auipc	ra,0xffff8
    80008f60:	d82080e7          	jalr	-638(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f64:	fcc42703          	lw	a4,-52(s0)
    80008f68:	67c1                	lui	a5,0x10
    80008f6a:	0785                	addi	a5,a5,1
    80008f6c:	97ba                	add	a5,a5,a4
    80008f6e:	07b2                	slli	a5,a5,0xc
    80008f70:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f74:	873e                	mv	a4,a5
    80008f76:	fe842783          	lw	a5,-24(s0)
    80008f7a:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008f7c:	fe842783          	lw	a5,-24(s0)
    80008f80:	0017e793          	ori	a5,a5,1
    80008f84:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f88:	fcc42703          	lw	a4,-52(s0)
    80008f8c:	67c1                	lui	a5,0x10
    80008f8e:	0785                	addi	a5,a5,1
    80008f90:	97ba                	add	a5,a5,a4
    80008f92:	07b2                	slli	a5,a5,0xc
    80008f94:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f98:	873e                	mv	a4,a5
    80008f9a:	fe842783          	lw	a5,-24(s0)
    80008f9e:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008fa0:	fe842783          	lw	a5,-24(s0)
    80008fa4:	0027e793          	ori	a5,a5,2
    80008fa8:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008fac:	fcc42703          	lw	a4,-52(s0)
    80008fb0:	67c1                	lui	a5,0x10
    80008fb2:	0785                	addi	a5,a5,1
    80008fb4:	97ba                	add	a5,a5,a4
    80008fb6:	07b2                	slli	a5,a5,0xc
    80008fb8:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008fbc:	873e                	mv	a4,a5
    80008fbe:	fe842783          	lw	a5,-24(s0)
    80008fc2:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008fc4:	fcc42703          	lw	a4,-52(s0)
    80008fc8:	67c1                	lui	a5,0x10
    80008fca:	0785                	addi	a5,a5,1
    80008fcc:	97ba                	add	a5,a5,a4
    80008fce:	07b2                	slli	a5,a5,0xc
    80008fd0:	07c1                	addi	a5,a5,16
    80008fd2:	439c                	lw	a5,0(a5)
    80008fd4:	2781                	sext.w	a5,a5
    80008fd6:	1782                	slli	a5,a5,0x20
    80008fd8:	9381                	srli	a5,a5,0x20
    80008fda:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008fde:	fe043783          	ld	a5,-32(s0)
    80008fe2:	fdf7f793          	andi	a5,a5,-33
    80008fe6:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008fea:	fe043783          	ld	a5,-32(s0)
    80008fee:	f7f7f793          	andi	a5,a5,-129
    80008ff2:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008ff6:	fe043703          	ld	a4,-32(s0)
    80008ffa:	77fd                	lui	a5,0xfffff
    80008ffc:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffd5817>
    80009000:	8ff9                	and	a5,a5,a4
    80009002:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80009006:	fe043703          	ld	a4,-32(s0)
    8000900a:	77fd                	lui	a5,0xfffff
    8000900c:	17fd                	addi	a5,a5,-1
    8000900e:	8ff9                	and	a5,a5,a4
    80009010:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80009014:	fe043703          	ld	a4,-32(s0)
    80009018:	f80007b7          	lui	a5,0xf8000
    8000901c:	17fd                	addi	a5,a5,-1
    8000901e:	8ff9                	and	a5,a5,a4
    80009020:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80009024:	fe043703          	ld	a4,-32(s0)
    80009028:	e00007b7          	lui	a5,0xe0000
    8000902c:	17fd                	addi	a5,a5,-1
    8000902e:	8ff9                	and	a5,a5,a4
    80009030:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80009034:	fe043703          	ld	a4,-32(s0)
    80009038:	f00007b7          	lui	a5,0xf0000
    8000903c:	17fd                	addi	a5,a5,-1
    8000903e:	8ff9                	and	a5,a5,a4
    80009040:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80009044:	fcc42703          	lw	a4,-52(s0)
    80009048:	67c1                	lui	a5,0x10
    8000904a:	0785                	addi	a5,a5,1
    8000904c:	97ba                	add	a5,a5,a4
    8000904e:	07b2                	slli	a5,a5,0xc
    80009050:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80009054:	873e                	mv	a4,a5
    80009056:	fe043783          	ld	a5,-32(s0)
    8000905a:	2781                	sext.w	a5,a5
    8000905c:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    8000905e:	fe842783          	lw	a5,-24(s0)
    80009062:	0087e793          	ori	a5,a5,8
    80009066:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    8000906a:	fcc42703          	lw	a4,-52(s0)
    8000906e:	67c1                	lui	a5,0x10
    80009070:	0785                	addi	a5,a5,1
    80009072:	97ba                	add	a5,a5,a4
    80009074:	07b2                	slli	a5,a5,0xc
    80009076:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    8000907a:	873e                	mv	a4,a5
    8000907c:	fe842783          	lw	a5,-24(s0)
    80009080:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80009082:	fcc42703          	lw	a4,-52(s0)
    80009086:	67c1                	lui	a5,0x10
    80009088:	0785                	addi	a5,a5,1
    8000908a:	97ba                	add	a5,a5,a4
    8000908c:	07b2                	slli	a5,a5,0xc
    8000908e:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009092:	439c                	lw	a5,0(a5)
    80009094:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80009098:	fe842783          	lw	a5,-24(s0)
    8000909c:	8ba1                	andi	a5,a5,8
    8000909e:	2781                	sext.w	a5,a5
    800090a0:	ef81                	bnez	a5,800090b8 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    800090a2:	00003617          	auipc	a2,0x3
    800090a6:	5ee60613          	addi	a2,a2,1518 # 8000c690 <etext+0x690>
    800090aa:	fc043583          	ld	a1,-64(s0)
    800090ae:	4509                	li	a0,2
    800090b0:	ffff8097          	auipc	ra,0xffff8
    800090b4:	c2e080e7          	jalr	-978(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    800090b8:	fcc42703          	lw	a4,-52(s0)
    800090bc:	67c1                	lui	a5,0x10
    800090be:	0785                	addi	a5,a5,1
    800090c0:	97ba                	add	a5,a5,a4
    800090c2:	07b2                	slli	a5,a5,0xc
    800090c4:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    800090c8:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    800090cc:	fcc42703          	lw	a4,-52(s0)
    800090d0:	67c1                	lui	a5,0x10
    800090d2:	0785                	addi	a5,a5,1
    800090d4:	97ba                	add	a5,a5,a4
    800090d6:	07b2                	slli	a5,a5,0xc
    800090d8:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    800090dc:	439c                	lw	a5,0(a5)
    800090de:	2781                	sext.w	a5,a5
    800090e0:	cf81                	beqz	a5,800090f8 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    800090e2:	00003617          	auipc	a2,0x3
    800090e6:	5ce60613          	addi	a2,a2,1486 # 8000c6b0 <etext+0x6b0>
    800090ea:	fc043583          	ld	a1,-64(s0)
    800090ee:	4509                	li	a0,2
    800090f0:	ffff8097          	auipc	ra,0xffff8
    800090f4:	bee080e7          	jalr	-1042(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    800090f8:	fcc42703          	lw	a4,-52(s0)
    800090fc:	67c1                	lui	a5,0x10
    800090fe:	0785                	addi	a5,a5,1
    80009100:	97ba                	add	a5,a5,a4
    80009102:	07b2                	slli	a5,a5,0xc
    80009104:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80009108:	439c                	lw	a5,0(a5)
    8000910a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    8000910e:	fdc42783          	lw	a5,-36(s0)
    80009112:	2781                	sext.w	a5,a5
    80009114:	ef81                	bnez	a5,8000912c <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    80009116:	00003617          	auipc	a2,0x3
    8000911a:	5c260613          	addi	a2,a2,1474 # 8000c6d8 <etext+0x6d8>
    8000911e:	fc043583          	ld	a1,-64(s0)
    80009122:	4509                	li	a0,2
    80009124:	ffff8097          	auipc	ra,0xffff8
    80009128:	bba080e7          	jalr	-1094(ra) # 80000cde <panic_concat>
  if(max < NUM)
    8000912c:	fdc42783          	lw	a5,-36(s0)
    80009130:	0007871b          	sext.w	a4,a5
    80009134:	479d                	li	a5,7
    80009136:	00e7ed63          	bltu	a5,a4,80009150 <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    8000913a:	00003617          	auipc	a2,0x3
    8000913e:	5be60613          	addi	a2,a2,1470 # 8000c6f8 <etext+0x6f8>
    80009142:	fc043583          	ld	a1,-64(s0)
    80009146:	4509                	li	a0,2
    80009148:	ffff8097          	auipc	ra,0xffff8
    8000914c:	b96080e7          	jalr	-1130(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    80009150:	ffff8097          	auipc	ra,0xffff8
    80009154:	086080e7          	jalr	134(ra) # 800011d6 <kalloc>
    80009158:	862a                	mv	a2,a0
    8000915a:	0001d717          	auipc	a4,0x1d
    8000915e:	bce70713          	addi	a4,a4,-1074 # 80025d28 <disk>
    80009162:	fcc42683          	lw	a3,-52(s0)
    80009166:	15000793          	li	a5,336
    8000916a:	02f687b3          	mul	a5,a3,a5
    8000916e:	97ba                	add	a5,a5,a4
    80009170:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    80009172:	ffff8097          	auipc	ra,0xffff8
    80009176:	064080e7          	jalr	100(ra) # 800011d6 <kalloc>
    8000917a:	862a                	mv	a2,a0
    8000917c:	0001d717          	auipc	a4,0x1d
    80009180:	bac70713          	addi	a4,a4,-1108 # 80025d28 <disk>
    80009184:	fcc42683          	lw	a3,-52(s0)
    80009188:	15000793          	li	a5,336
    8000918c:	02f687b3          	mul	a5,a3,a5
    80009190:	97ba                	add	a5,a5,a4
    80009192:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    80009194:	ffff8097          	auipc	ra,0xffff8
    80009198:	042080e7          	jalr	66(ra) # 800011d6 <kalloc>
    8000919c:	862a                	mv	a2,a0
    8000919e:	0001d717          	auipc	a4,0x1d
    800091a2:	b8a70713          	addi	a4,a4,-1142 # 80025d28 <disk>
    800091a6:	fcc42683          	lw	a3,-52(s0)
    800091aa:	15000793          	li	a5,336
    800091ae:	02f687b3          	mul	a5,a3,a5
    800091b2:	97ba                	add	a5,a5,a4
    800091b4:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    800091b6:	0001d717          	auipc	a4,0x1d
    800091ba:	b7270713          	addi	a4,a4,-1166 # 80025d28 <disk>
    800091be:	fcc42683          	lw	a3,-52(s0)
    800091c2:	15000793          	li	a5,336
    800091c6:	02f687b3          	mul	a5,a3,a5
    800091ca:	97ba                	add	a5,a5,a4
    800091cc:	679c                	ld	a5,8(a5)
    800091ce:	cb9d                	beqz	a5,80009204 <virtio_disk_init+0x382>
    800091d0:	0001d717          	auipc	a4,0x1d
    800091d4:	b5870713          	addi	a4,a4,-1192 # 80025d28 <disk>
    800091d8:	fcc42683          	lw	a3,-52(s0)
    800091dc:	15000793          	li	a5,336
    800091e0:	02f687b3          	mul	a5,a3,a5
    800091e4:	97ba                	add	a5,a5,a4
    800091e6:	6b9c                	ld	a5,16(a5)
    800091e8:	cf91                	beqz	a5,80009204 <virtio_disk_init+0x382>
    800091ea:	0001d717          	auipc	a4,0x1d
    800091ee:	b3e70713          	addi	a4,a4,-1218 # 80025d28 <disk>
    800091f2:	fcc42683          	lw	a3,-52(s0)
    800091f6:	15000793          	li	a5,336
    800091fa:	02f687b3          	mul	a5,a3,a5
    800091fe:	97ba                	add	a5,a5,a4
    80009200:	6f9c                	ld	a5,24(a5)
    80009202:	ef81                	bnez	a5,8000921a <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80009204:	00003617          	auipc	a2,0x3
    80009208:	51c60613          	addi	a2,a2,1308 # 8000c720 <etext+0x720>
    8000920c:	fc043583          	ld	a1,-64(s0)
    80009210:	4509                	li	a0,2
    80009212:	ffff8097          	auipc	ra,0xffff8
    80009216:	acc080e7          	jalr	-1332(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    8000921a:	0001d717          	auipc	a4,0x1d
    8000921e:	b0e70713          	addi	a4,a4,-1266 # 80025d28 <disk>
    80009222:	fcc42683          	lw	a3,-52(s0)
    80009226:	15000793          	li	a5,336
    8000922a:	02f687b3          	mul	a5,a3,a5
    8000922e:	97ba                	add	a5,a5,a4
    80009230:	679c                	ld	a5,8(a5)
    80009232:	6605                	lui	a2,0x1
    80009234:	4581                	li	a1,0
    80009236:	853e                	mv	a0,a5
    80009238:	ffff8097          	auipc	ra,0xffff8
    8000923c:	2d8080e7          	jalr	728(ra) # 80001510 <memset>
  memset(disk[id].avail, 0, PGSIZE);
    80009240:	0001d717          	auipc	a4,0x1d
    80009244:	ae870713          	addi	a4,a4,-1304 # 80025d28 <disk>
    80009248:	fcc42683          	lw	a3,-52(s0)
    8000924c:	15000793          	li	a5,336
    80009250:	02f687b3          	mul	a5,a3,a5
    80009254:	97ba                	add	a5,a5,a4
    80009256:	6b9c                	ld	a5,16(a5)
    80009258:	6605                	lui	a2,0x1
    8000925a:	4581                	li	a1,0
    8000925c:	853e                	mv	a0,a5
    8000925e:	ffff8097          	auipc	ra,0xffff8
    80009262:	2b2080e7          	jalr	690(ra) # 80001510 <memset>
  memset(disk[id].used, 0, PGSIZE);
    80009266:	0001d717          	auipc	a4,0x1d
    8000926a:	ac270713          	addi	a4,a4,-1342 # 80025d28 <disk>
    8000926e:	fcc42683          	lw	a3,-52(s0)
    80009272:	15000793          	li	a5,336
    80009276:	02f687b3          	mul	a5,a3,a5
    8000927a:	97ba                	add	a5,a5,a4
    8000927c:	6f9c                	ld	a5,24(a5)
    8000927e:	6605                	lui	a2,0x1
    80009280:	4581                	li	a1,0
    80009282:	853e                	mv	a0,a5
    80009284:	ffff8097          	auipc	ra,0xffff8
    80009288:	28c080e7          	jalr	652(ra) # 80001510 <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    8000928c:	fcc42703          	lw	a4,-52(s0)
    80009290:	67c1                	lui	a5,0x10
    80009292:	0785                	addi	a5,a5,1
    80009294:	97ba                	add	a5,a5,a4
    80009296:	07b2                	slli	a5,a5,0xc
    80009298:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    8000929c:	873e                	mv	a4,a5
    8000929e:	47a1                	li	a5,8
    800092a0:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    800092a2:	0001d717          	auipc	a4,0x1d
    800092a6:	a8670713          	addi	a4,a4,-1402 # 80025d28 <disk>
    800092aa:	fcc42683          	lw	a3,-52(s0)
    800092ae:	15000793          	li	a5,336
    800092b2:	02f687b3          	mul	a5,a3,a5
    800092b6:	97ba                	add	a5,a5,a4
    800092b8:	679c                	ld	a5,8(a5)
    800092ba:	86be                	mv	a3,a5
    800092bc:	fcc42703          	lw	a4,-52(s0)
    800092c0:	67c1                	lui	a5,0x10
    800092c2:	0785                	addi	a5,a5,1
    800092c4:	97ba                	add	a5,a5,a4
    800092c6:	07b2                	slli	a5,a5,0xc
    800092c8:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    800092cc:	873e                	mv	a4,a5
    800092ce:	0006879b          	sext.w	a5,a3
    800092d2:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    800092d4:	0001d717          	auipc	a4,0x1d
    800092d8:	a5470713          	addi	a4,a4,-1452 # 80025d28 <disk>
    800092dc:	fcc42683          	lw	a3,-52(s0)
    800092e0:	15000793          	li	a5,336
    800092e4:	02f687b3          	mul	a5,a3,a5
    800092e8:	97ba                	add	a5,a5,a4
    800092ea:	679c                	ld	a5,8(a5)
    800092ec:	0207d693          	srli	a3,a5,0x20
    800092f0:	fcc42703          	lw	a4,-52(s0)
    800092f4:	67c1                	lui	a5,0x10
    800092f6:	0785                	addi	a5,a5,1
    800092f8:	97ba                	add	a5,a5,a4
    800092fa:	07b2                	slli	a5,a5,0xc
    800092fc:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    80009300:	873e                	mv	a4,a5
    80009302:	0006879b          	sext.w	a5,a3
    80009306:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009308:	0001d717          	auipc	a4,0x1d
    8000930c:	a2070713          	addi	a4,a4,-1504 # 80025d28 <disk>
    80009310:	fcc42683          	lw	a3,-52(s0)
    80009314:	15000793          	li	a5,336
    80009318:	02f687b3          	mul	a5,a3,a5
    8000931c:	97ba                	add	a5,a5,a4
    8000931e:	6b9c                	ld	a5,16(a5)
    80009320:	86be                	mv	a3,a5
    80009322:	fcc42703          	lw	a4,-52(s0)
    80009326:	67c1                	lui	a5,0x10
    80009328:	0785                	addi	a5,a5,1
    8000932a:	97ba                	add	a5,a5,a4
    8000932c:	07b2                	slli	a5,a5,0xc
    8000932e:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    80009332:	873e                	mv	a4,a5
    80009334:	0006879b          	sext.w	a5,a3
    80009338:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    8000933a:	0001d717          	auipc	a4,0x1d
    8000933e:	9ee70713          	addi	a4,a4,-1554 # 80025d28 <disk>
    80009342:	fcc42683          	lw	a3,-52(s0)
    80009346:	15000793          	li	a5,336
    8000934a:	02f687b3          	mul	a5,a3,a5
    8000934e:	97ba                	add	a5,a5,a4
    80009350:	6b9c                	ld	a5,16(a5)
    80009352:	0207d693          	srli	a3,a5,0x20
    80009356:	fcc42703          	lw	a4,-52(s0)
    8000935a:	67c1                	lui	a5,0x10
    8000935c:	0785                	addi	a5,a5,1
    8000935e:	97ba                	add	a5,a5,a4
    80009360:	07b2                	slli	a5,a5,0xc
    80009362:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    80009366:	873e                	mv	a4,a5
    80009368:	0006879b          	sext.w	a5,a3
    8000936c:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    8000936e:	0001d717          	auipc	a4,0x1d
    80009372:	9ba70713          	addi	a4,a4,-1606 # 80025d28 <disk>
    80009376:	fcc42683          	lw	a3,-52(s0)
    8000937a:	15000793          	li	a5,336
    8000937e:	02f687b3          	mul	a5,a3,a5
    80009382:	97ba                	add	a5,a5,a4
    80009384:	6f9c                	ld	a5,24(a5)
    80009386:	86be                	mv	a3,a5
    80009388:	fcc42703          	lw	a4,-52(s0)
    8000938c:	67c1                	lui	a5,0x10
    8000938e:	0785                	addi	a5,a5,1
    80009390:	97ba                	add	a5,a5,a4
    80009392:	07b2                	slli	a5,a5,0xc
    80009394:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    80009398:	873e                	mv	a4,a5
    8000939a:	0006879b          	sext.w	a5,a3
    8000939e:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    800093a0:	0001d717          	auipc	a4,0x1d
    800093a4:	98870713          	addi	a4,a4,-1656 # 80025d28 <disk>
    800093a8:	fcc42683          	lw	a3,-52(s0)
    800093ac:	15000793          	li	a5,336
    800093b0:	02f687b3          	mul	a5,a3,a5
    800093b4:	97ba                	add	a5,a5,a4
    800093b6:	6f9c                	ld	a5,24(a5)
    800093b8:	0207d693          	srli	a3,a5,0x20
    800093bc:	fcc42703          	lw	a4,-52(s0)
    800093c0:	67c1                	lui	a5,0x10
    800093c2:	0785                	addi	a5,a5,1
    800093c4:	97ba                	add	a5,a5,a4
    800093c6:	07b2                	slli	a5,a5,0xc
    800093c8:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    800093cc:	873e                	mv	a4,a5
    800093ce:	0006879b          	sext.w	a5,a3
    800093d2:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    800093d4:	fcc42703          	lw	a4,-52(s0)
    800093d8:	67c1                	lui	a5,0x10
    800093da:	0785                	addi	a5,a5,1
    800093dc:	97ba                	add	a5,a5,a4
    800093de:	07b2                	slli	a5,a5,0xc
    800093e0:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    800093e4:	873e                	mv	a4,a5
    800093e6:	4785                	li	a5,1
    800093e8:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    800093ea:	fe042623          	sw	zero,-20(s0)
    800093ee:	a03d                	j	8000941c <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    800093f0:	0001d697          	auipc	a3,0x1d
    800093f4:	93868693          	addi	a3,a3,-1736 # 80025d28 <disk>
    800093f8:	fec42703          	lw	a4,-20(s0)
    800093fc:	fcc42603          	lw	a2,-52(s0)
    80009400:	15000793          	li	a5,336
    80009404:	02f607b3          	mul	a5,a2,a5
    80009408:	97b6                	add	a5,a5,a3
    8000940a:	97ba                	add	a5,a5,a4
    8000940c:	4705                	li	a4,1
    8000940e:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    80009412:	fec42783          	lw	a5,-20(s0)
    80009416:	2785                	addiw	a5,a5,1
    80009418:	fef42623          	sw	a5,-20(s0)
    8000941c:	fec42783          	lw	a5,-20(s0)
    80009420:	0007871b          	sext.w	a4,a5
    80009424:	479d                	li	a5,7
    80009426:	fce7d5e3          	bge	a5,a4,800093f0 <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000942a:	fe842783          	lw	a5,-24(s0)
    8000942e:	0047e793          	ori	a5,a5,4
    80009432:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009436:	fcc42703          	lw	a4,-52(s0)
    8000943a:	67c1                	lui	a5,0x10
    8000943c:	0785                	addi	a5,a5,1
    8000943e:	97ba                	add	a5,a5,a4
    80009440:	07b2                	slli	a5,a5,0xc
    80009442:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009446:	873e                	mv	a4,a5
    80009448:	fe842783          	lw	a5,-24(s0)
    8000944c:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    8000944e:	fcc42783          	lw	a5,-52(s0)
    80009452:	0007871b          	sext.w	a4,a5
    80009456:	4785                	li	a5,1
    80009458:	06f71663          	bne	a4,a5,800094c4 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    8000945c:	ffff8097          	auipc	ra,0xffff8
    80009460:	d7a080e7          	jalr	-646(ra) # 800011d6 <kalloc>
    80009464:	872a                	mv	a4,a0
    80009466:	0001d797          	auipc	a5,0x1d
    8000946a:	b6278793          	addi	a5,a5,-1182 # 80025fc8 <swap_buffer>
    8000946e:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    80009470:	0001d797          	auipc	a5,0x1d
    80009474:	b5878793          	addi	a5,a5,-1192 # 80025fc8 <swap_buffer>
    80009478:	639c                	ld	a5,0(a5)
    8000947a:	eb89                	bnez	a5,8000948c <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    8000947c:	00003517          	auipc	a0,0x3
    80009480:	2bc50513          	addi	a0,a0,700 # 8000c738 <etext+0x738>
    80009484:	ffff8097          	auipc	ra,0xffff8
    80009488:	808080e7          	jalr	-2040(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    8000948c:	0001d797          	auipc	a5,0x1d
    80009490:	b3c78793          	addi	a5,a5,-1220 # 80025fc8 <swap_buffer>
    80009494:	639c                	ld	a5,0(a5)
    80009496:	40000613          	li	a2,1024
    8000949a:	4581                	li	a1,0
    8000949c:	853e                	mv	a0,a5
    8000949e:	ffff8097          	auipc	ra,0xffff8
    800094a2:	072080e7          	jalr	114(ra) # 80001510 <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    800094a6:	0001d797          	auipc	a5,0x1d
    800094aa:	b2278793          	addi	a5,a5,-1246 # 80025fc8 <swap_buffer>
    800094ae:	639c                	ld	a5,0(a5)
    800094b0:	07c1                	addi	a5,a5,16
    800094b2:	00003597          	auipc	a1,0x3
    800094b6:	2b658593          	addi	a1,a1,694 # 8000c768 <etext+0x768>
    800094ba:	853e                	mv	a0,a5
    800094bc:	ffffd097          	auipc	ra,0xffffd
    800094c0:	308080e7          	jalr	776(ra) # 800067c4 <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    800094c4:	0001                	nop
    800094c6:	70e2                	ld	ra,56(sp)
    800094c8:	7442                	ld	s0,48(sp)
    800094ca:	6121                	addi	sp,sp,64
    800094cc:	8082                	ret

00000000800094ce <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    800094ce:	7179                	addi	sp,sp,-48
    800094d0:	f422                	sd	s0,40(sp)
    800094d2:	1800                	addi	s0,sp,48
    800094d4:	87aa                	mv	a5,a0
    800094d6:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    800094da:	fe042623          	sw	zero,-20(s0)
    800094de:	a891                	j	80009532 <alloc_desc+0x64>
    if(disk[id].free[i]){
    800094e0:	0001d697          	auipc	a3,0x1d
    800094e4:	84868693          	addi	a3,a3,-1976 # 80025d28 <disk>
    800094e8:	fec42703          	lw	a4,-20(s0)
    800094ec:	fdc42603          	lw	a2,-36(s0)
    800094f0:	15000793          	li	a5,336
    800094f4:	02f607b3          	mul	a5,a2,a5
    800094f8:	97b6                	add	a5,a5,a3
    800094fa:	97ba                	add	a5,a5,a4
    800094fc:	0207c783          	lbu	a5,32(a5)
    80009500:	c785                	beqz	a5,80009528 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009502:	0001d697          	auipc	a3,0x1d
    80009506:	82668693          	addi	a3,a3,-2010 # 80025d28 <disk>
    8000950a:	fec42703          	lw	a4,-20(s0)
    8000950e:	fdc42603          	lw	a2,-36(s0)
    80009512:	15000793          	li	a5,336
    80009516:	02f607b3          	mul	a5,a2,a5
    8000951a:	97b6                	add	a5,a5,a3
    8000951c:	97ba                	add	a5,a5,a4
    8000951e:	02078023          	sb	zero,32(a5)
      return i;
    80009522:	fec42783          	lw	a5,-20(s0)
    80009526:	a831                	j	80009542 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    80009528:	fec42783          	lw	a5,-20(s0)
    8000952c:	2785                	addiw	a5,a5,1
    8000952e:	fef42623          	sw	a5,-20(s0)
    80009532:	fec42783          	lw	a5,-20(s0)
    80009536:	0007871b          	sext.w	a4,a5
    8000953a:	479d                	li	a5,7
    8000953c:	fae7d2e3          	bge	a5,a4,800094e0 <alloc_desc+0x12>
    }
  }
  return -1;
    80009540:	57fd                	li	a5,-1
}
    80009542:	853e                	mv	a0,a5
    80009544:	7422                	ld	s0,40(sp)
    80009546:	6145                	addi	sp,sp,48
    80009548:	8082                	ret

000000008000954a <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    8000954a:	1101                	addi	sp,sp,-32
    8000954c:	ec06                	sd	ra,24(sp)
    8000954e:	e822                	sd	s0,16(sp)
    80009550:	1000                	addi	s0,sp,32
    80009552:	87aa                	mv	a5,a0
    80009554:	872e                	mv	a4,a1
    80009556:	fef42623          	sw	a5,-20(s0)
    8000955a:	87ba                	mv	a5,a4
    8000955c:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    80009560:	fe842783          	lw	a5,-24(s0)
    80009564:	0007871b          	sext.w	a4,a5
    80009568:	479d                	li	a5,7
    8000956a:	02e7d863          	bge	a5,a4,8000959a <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    8000956e:	0001c717          	auipc	a4,0x1c
    80009572:	7ba70713          	addi	a4,a4,1978 # 80025d28 <disk>
    80009576:	fec42683          	lw	a3,-20(s0)
    8000957a:	15000793          	li	a5,336
    8000957e:	02f687b3          	mul	a5,a3,a5
    80009582:	97ba                	add	a5,a5,a4
    80009584:	639c                	ld	a5,0(a5)
    80009586:	00003617          	auipc	a2,0x3
    8000958a:	1f260613          	addi	a2,a2,498 # 8000c778 <etext+0x778>
    8000958e:	85be                	mv	a1,a5
    80009590:	4509                	li	a0,2
    80009592:	ffff7097          	auipc	ra,0xffff7
    80009596:	74c080e7          	jalr	1868(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    8000959a:	0001c697          	auipc	a3,0x1c
    8000959e:	78e68693          	addi	a3,a3,1934 # 80025d28 <disk>
    800095a2:	fe842703          	lw	a4,-24(s0)
    800095a6:	fec42603          	lw	a2,-20(s0)
    800095aa:	15000793          	li	a5,336
    800095ae:	02f607b3          	mul	a5,a2,a5
    800095b2:	97b6                	add	a5,a5,a3
    800095b4:	97ba                	add	a5,a5,a4
    800095b6:	0207c783          	lbu	a5,32(a5)
    800095ba:	c79d                	beqz	a5,800095e8 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    800095bc:	0001c717          	auipc	a4,0x1c
    800095c0:	76c70713          	addi	a4,a4,1900 # 80025d28 <disk>
    800095c4:	fec42683          	lw	a3,-20(s0)
    800095c8:	15000793          	li	a5,336
    800095cc:	02f687b3          	mul	a5,a3,a5
    800095d0:	97ba                	add	a5,a5,a4
    800095d2:	639c                	ld	a5,0(a5)
    800095d4:	00003617          	auipc	a2,0x3
    800095d8:	1b460613          	addi	a2,a2,436 # 8000c788 <etext+0x788>
    800095dc:	85be                	mv	a1,a5
    800095de:	4509                	li	a0,2
    800095e0:	ffff7097          	auipc	ra,0xffff7
    800095e4:	6fe080e7          	jalr	1790(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    800095e8:	0001c717          	auipc	a4,0x1c
    800095ec:	74070713          	addi	a4,a4,1856 # 80025d28 <disk>
    800095f0:	fec42683          	lw	a3,-20(s0)
    800095f4:	15000793          	li	a5,336
    800095f8:	02f687b3          	mul	a5,a3,a5
    800095fc:	97ba                	add	a5,a5,a4
    800095fe:	6798                	ld	a4,8(a5)
    80009600:	fe842783          	lw	a5,-24(s0)
    80009604:	0792                	slli	a5,a5,0x4
    80009606:	97ba                	add	a5,a5,a4
    80009608:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000960c:	0001c717          	auipc	a4,0x1c
    80009610:	71c70713          	addi	a4,a4,1820 # 80025d28 <disk>
    80009614:	fec42683          	lw	a3,-20(s0)
    80009618:	15000793          	li	a5,336
    8000961c:	02f687b3          	mul	a5,a3,a5
    80009620:	97ba                	add	a5,a5,a4
    80009622:	6798                	ld	a4,8(a5)
    80009624:	fe842783          	lw	a5,-24(s0)
    80009628:	0792                	slli	a5,a5,0x4
    8000962a:	97ba                	add	a5,a5,a4
    8000962c:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    80009630:	0001c717          	auipc	a4,0x1c
    80009634:	6f870713          	addi	a4,a4,1784 # 80025d28 <disk>
    80009638:	fec42683          	lw	a3,-20(s0)
    8000963c:	15000793          	li	a5,336
    80009640:	02f687b3          	mul	a5,a3,a5
    80009644:	97ba                	add	a5,a5,a4
    80009646:	6798                	ld	a4,8(a5)
    80009648:	fe842783          	lw	a5,-24(s0)
    8000964c:	0792                	slli	a5,a5,0x4
    8000964e:	97ba                	add	a5,a5,a4
    80009650:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    80009654:	0001c717          	auipc	a4,0x1c
    80009658:	6d470713          	addi	a4,a4,1748 # 80025d28 <disk>
    8000965c:	fec42683          	lw	a3,-20(s0)
    80009660:	15000793          	li	a5,336
    80009664:	02f687b3          	mul	a5,a3,a5
    80009668:	97ba                	add	a5,a5,a4
    8000966a:	6798                	ld	a4,8(a5)
    8000966c:	fe842783          	lw	a5,-24(s0)
    80009670:	0792                	slli	a5,a5,0x4
    80009672:	97ba                	add	a5,a5,a4
    80009674:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    80009678:	0001c697          	auipc	a3,0x1c
    8000967c:	6b068693          	addi	a3,a3,1712 # 80025d28 <disk>
    80009680:	fe842703          	lw	a4,-24(s0)
    80009684:	fec42603          	lw	a2,-20(s0)
    80009688:	15000793          	li	a5,336
    8000968c:	02f607b3          	mul	a5,a2,a5
    80009690:	97b6                	add	a5,a5,a3
    80009692:	97ba                	add	a5,a5,a4
    80009694:	4705                	li	a4,1
    80009696:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    8000969a:	0001c717          	auipc	a4,0x1c
    8000969e:	68e70713          	addi	a4,a4,1678 # 80025d28 <disk>
    800096a2:	fec42683          	lw	a3,-20(s0)
    800096a6:	15000793          	li	a5,336
    800096aa:	02f687b3          	mul	a5,a3,a5
    800096ae:	97ba                	add	a5,a5,a4
    800096b0:	1487a783          	lw	a5,328(a5)
    800096b4:	e39d                	bnez	a5,800096da <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    800096b6:	fec42703          	lw	a4,-20(s0)
    800096ba:	15000793          	li	a5,336
    800096be:	02f707b3          	mul	a5,a4,a5
    800096c2:	02078713          	addi	a4,a5,32
    800096c6:	0001c797          	auipc	a5,0x1c
    800096ca:	66278793          	addi	a5,a5,1634 # 80025d28 <disk>
    800096ce:	97ba                	add	a5,a5,a4
    800096d0:	853e                	mv	a0,a5
    800096d2:	ffffa097          	auipc	ra,0xffffa
    800096d6:	fe2080e7          	jalr	-30(ra) # 800036b4 <wakeup>
  }
}
    800096da:	0001                	nop
    800096dc:	60e2                	ld	ra,24(sp)
    800096de:	6442                	ld	s0,16(sp)
    800096e0:	6105                	addi	sp,sp,32
    800096e2:	8082                	ret

00000000800096e4 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    800096e4:	7179                	addi	sp,sp,-48
    800096e6:	f406                	sd	ra,40(sp)
    800096e8:	f022                	sd	s0,32(sp)
    800096ea:	1800                	addi	s0,sp,48
    800096ec:	87aa                	mv	a5,a0
    800096ee:	872e                	mv	a4,a1
    800096f0:	fcf42e23          	sw	a5,-36(s0)
    800096f4:	87ba                	mv	a5,a4
    800096f6:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    800096fa:	0001c717          	auipc	a4,0x1c
    800096fe:	62e70713          	addi	a4,a4,1582 # 80025d28 <disk>
    80009702:	fdc42683          	lw	a3,-36(s0)
    80009706:	15000793          	li	a5,336
    8000970a:	02f687b3          	mul	a5,a3,a5
    8000970e:	97ba                	add	a5,a5,a4
    80009710:	6798                	ld	a4,8(a5)
    80009712:	fd842783          	lw	a5,-40(s0)
    80009716:	0792                	slli	a5,a5,0x4
    80009718:	97ba                	add	a5,a5,a4
    8000971a:	00c7d783          	lhu	a5,12(a5)
    8000971e:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009722:	0001c717          	auipc	a4,0x1c
    80009726:	60670713          	addi	a4,a4,1542 # 80025d28 <disk>
    8000972a:	fdc42683          	lw	a3,-36(s0)
    8000972e:	15000793          	li	a5,336
    80009732:	02f687b3          	mul	a5,a3,a5
    80009736:	97ba                	add	a5,a5,a4
    80009738:	6798                	ld	a4,8(a5)
    8000973a:	fd842783          	lw	a5,-40(s0)
    8000973e:	0792                	slli	a5,a5,0x4
    80009740:	97ba                	add	a5,a5,a4
    80009742:	00e7d783          	lhu	a5,14(a5)
    80009746:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    8000974a:	fd842703          	lw	a4,-40(s0)
    8000974e:	fdc42783          	lw	a5,-36(s0)
    80009752:	85ba                	mv	a1,a4
    80009754:	853e                	mv	a0,a5
    80009756:	00000097          	auipc	ra,0x0
    8000975a:	df4080e7          	jalr	-524(ra) # 8000954a <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    8000975e:	fec42783          	lw	a5,-20(s0)
    80009762:	8b85                	andi	a5,a5,1
    80009764:	2781                	sext.w	a5,a5
    80009766:	c791                	beqz	a5,80009772 <free_chain+0x8e>
      i = nxt;
    80009768:	fe842783          	lw	a5,-24(s0)
    8000976c:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    80009770:	b769                	j	800096fa <free_chain+0x16>
    else
      break;
    80009772:	0001                	nop
  }
}
    80009774:	0001                	nop
    80009776:	70a2                	ld	ra,40(sp)
    80009778:	7402                	ld	s0,32(sp)
    8000977a:	6145                	addi	sp,sp,48
    8000977c:	8082                	ret

000000008000977e <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    8000977e:	7139                	addi	sp,sp,-64
    80009780:	fc06                	sd	ra,56(sp)
    80009782:	f822                	sd	s0,48(sp)
    80009784:	f426                	sd	s1,40(sp)
    80009786:	0080                	addi	s0,sp,64
    80009788:	87aa                	mv	a5,a0
    8000978a:	fcb43023          	sd	a1,-64(s0)
    8000978e:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    80009792:	fc042e23          	sw	zero,-36(s0)
    80009796:	a041                	j	80009816 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    80009798:	fdc42783          	lw	a5,-36(s0)
    8000979c:	078a                	slli	a5,a5,0x2
    8000979e:	fc043703          	ld	a4,-64(s0)
    800097a2:	00f704b3          	add	s1,a4,a5
    800097a6:	fcc42783          	lw	a5,-52(s0)
    800097aa:	853e                	mv	a0,a5
    800097ac:	00000097          	auipc	ra,0x0
    800097b0:	d22080e7          	jalr	-734(ra) # 800094ce <alloc_desc>
    800097b4:	87aa                	mv	a5,a0
    800097b6:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    800097b8:	fdc42783          	lw	a5,-36(s0)
    800097bc:	078a                	slli	a5,a5,0x2
    800097be:	fc043703          	ld	a4,-64(s0)
    800097c2:	97ba                	add	a5,a5,a4
    800097c4:	439c                	lw	a5,0(a5)
    800097c6:	0407d363          	bgez	a5,8000980c <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    800097ca:	fc042c23          	sw	zero,-40(s0)
    800097ce:	a02d                	j	800097f8 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    800097d0:	fd842783          	lw	a5,-40(s0)
    800097d4:	078a                	slli	a5,a5,0x2
    800097d6:	fc043703          	ld	a4,-64(s0)
    800097da:	97ba                	add	a5,a5,a4
    800097dc:	4398                	lw	a4,0(a5)
    800097de:	fcc42783          	lw	a5,-52(s0)
    800097e2:	85ba                	mv	a1,a4
    800097e4:	853e                	mv	a0,a5
    800097e6:	00000097          	auipc	ra,0x0
    800097ea:	d64080e7          	jalr	-668(ra) # 8000954a <free_desc>
      for(int j = 0; j < i; j++)
    800097ee:	fd842783          	lw	a5,-40(s0)
    800097f2:	2785                	addiw	a5,a5,1
    800097f4:	fcf42c23          	sw	a5,-40(s0)
    800097f8:	fd842703          	lw	a4,-40(s0)
    800097fc:	fdc42783          	lw	a5,-36(s0)
    80009800:	2701                	sext.w	a4,a4
    80009802:	2781                	sext.w	a5,a5
    80009804:	fcf746e3          	blt	a4,a5,800097d0 <alloc3_desc+0x52>
      return -1;
    80009808:	57fd                	li	a5,-1
    8000980a:	a831                	j	80009826 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    8000980c:	fdc42783          	lw	a5,-36(s0)
    80009810:	2785                	addiw	a5,a5,1
    80009812:	fcf42e23          	sw	a5,-36(s0)
    80009816:	fdc42783          	lw	a5,-36(s0)
    8000981a:	0007871b          	sext.w	a4,a5
    8000981e:	4789                	li	a5,2
    80009820:	f6e7dce3          	bge	a5,a4,80009798 <alloc3_desc+0x1a>
    }
  }
  return 0;
    80009824:	4781                	li	a5,0
}
    80009826:	853e                	mv	a0,a5
    80009828:	70e2                	ld	ra,56(sp)
    8000982a:	7442                	ld	s0,48(sp)
    8000982c:	74a2                	ld	s1,40(sp)
    8000982e:	6121                	addi	sp,sp,64
    80009830:	8082                	ret

0000000080009832 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    80009832:	715d                	addi	sp,sp,-80
    80009834:	e486                	sd	ra,72(sp)
    80009836:	e0a2                	sd	s0,64(sp)
    80009838:	0880                	addi	s0,sp,80
    8000983a:	87aa                	mv	a5,a0
    8000983c:	fcb43023          	sd	a1,-64(s0)
    80009840:	8736                	mv	a4,a3
    80009842:	fcf42623          	sw	a5,-52(s0)
    80009846:	87b2                	mv	a5,a2
    80009848:	fcf42423          	sw	a5,-56(s0)
    8000984c:	87ba                	mv	a5,a4
    8000984e:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80009852:	fc043783          	ld	a5,-64(s0)
    80009856:	47dc                	lw	a5,12(a5)
    80009858:	0017979b          	slliw	a5,a5,0x1
    8000985c:	2781                	sext.w	a5,a5
    8000985e:	1782                	slli	a5,a5,0x20
    80009860:	9381                	srli	a5,a5,0x20
    80009862:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    80009866:	fcc42703          	lw	a4,-52(s0)
    8000986a:	15000793          	li	a5,336
    8000986e:	02f707b3          	mul	a5,a4,a5
    80009872:	13078713          	addi	a4,a5,304
    80009876:	0001c797          	auipc	a5,0x1c
    8000987a:	4b278793          	addi	a5,a5,1202 # 80025d28 <disk>
    8000987e:	97ba                	add	a5,a5,a4
    80009880:	853e                	mv	a0,a5
    80009882:	ffff8097          	auipc	ra,0xffff8
    80009886:	aba080e7          	jalr	-1350(ra) # 8000133c <acquire>
  disk[id].bw_transfer = busy_wait;
    8000988a:	0001c717          	auipc	a4,0x1c
    8000988e:	49e70713          	addi	a4,a4,1182 # 80025d28 <disk>
    80009892:	fcc42683          	lw	a3,-52(s0)
    80009896:	15000793          	li	a5,336
    8000989a:	02f687b3          	mul	a5,a3,a5
    8000989e:	97ba                	add	a5,a5,a4
    800098a0:	fbc42703          	lw	a4,-68(s0)
    800098a4:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    800098a8:	fd040713          	addi	a4,s0,-48
    800098ac:	fcc42783          	lw	a5,-52(s0)
    800098b0:	85ba                	mv	a1,a4
    800098b2:	853e                	mv	a0,a5
    800098b4:	00000097          	auipc	ra,0x0
    800098b8:	eca080e7          	jalr	-310(ra) # 8000977e <alloc3_desc>
    800098bc:	87aa                	mv	a5,a0
    800098be:	c3e9                	beqz	a5,80009980 <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    800098c0:	fbc42783          	lw	a5,-68(s0)
    800098c4:	2781                	sext.w	a5,a5
    800098c6:	e3b9                	bnez	a5,8000990c <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    800098c8:	fcc42703          	lw	a4,-52(s0)
    800098cc:	15000793          	li	a5,336
    800098d0:	02f707b3          	mul	a5,a4,a5
    800098d4:	02078713          	addi	a4,a5,32
    800098d8:	0001c797          	auipc	a5,0x1c
    800098dc:	45078793          	addi	a5,a5,1104 # 80025d28 <disk>
    800098e0:	00f706b3          	add	a3,a4,a5
    800098e4:	fcc42703          	lw	a4,-52(s0)
    800098e8:	15000793          	li	a5,336
    800098ec:	02f707b3          	mul	a5,a4,a5
    800098f0:	13078713          	addi	a4,a5,304
    800098f4:	0001c797          	auipc	a5,0x1c
    800098f8:	43478793          	addi	a5,a5,1076 # 80025d28 <disk>
    800098fc:	97ba                	add	a5,a5,a4
    800098fe:	85be                	mv	a1,a5
    80009900:	8536                	mv	a0,a3
    80009902:	ffffa097          	auipc	ra,0xffffa
    80009906:	d36080e7          	jalr	-714(ra) # 80003638 <sleep>
    8000990a:	bf79                	j	800098a8 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    8000990c:	fcc42703          	lw	a4,-52(s0)
    80009910:	15000793          	li	a5,336
    80009914:	02f707b3          	mul	a5,a4,a5
    80009918:	13078713          	addi	a4,a5,304
    8000991c:	0001c797          	auipc	a5,0x1c
    80009920:	40c78793          	addi	a5,a5,1036 # 80025d28 <disk>
    80009924:	97ba                	add	a5,a5,a4
    80009926:	853e                	mv	a0,a5
    80009928:	ffff8097          	auipc	ra,0xffff8
    8000992c:	a78080e7          	jalr	-1416(ra) # 800013a0 <release>
        intr_on();
    80009930:	fffff097          	auipc	ra,0xfffff
    80009934:	360080e7          	jalr	864(ra) # 80008c90 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    80009938:	0001                	nop
    8000993a:	fd040713          	addi	a4,s0,-48
    8000993e:	fcc42783          	lw	a5,-52(s0)
    80009942:	85ba                	mv	a1,a4
    80009944:	853e                	mv	a0,a5
    80009946:	00000097          	auipc	ra,0x0
    8000994a:	e38080e7          	jalr	-456(ra) # 8000977e <alloc3_desc>
    8000994e:	87aa                	mv	a5,a0
    80009950:	f7ed                	bnez	a5,8000993a <virtio_disk_rw+0x108>
        intr_off();
    80009952:	fffff097          	auipc	ra,0xfffff
    80009956:	368080e7          	jalr	872(ra) # 80008cba <intr_off>
        acquire(&disk[id].vdisk_lock);
    8000995a:	fcc42703          	lw	a4,-52(s0)
    8000995e:	15000793          	li	a5,336
    80009962:	02f707b3          	mul	a5,a4,a5
    80009966:	13078713          	addi	a4,a5,304
    8000996a:	0001c797          	auipc	a5,0x1c
    8000996e:	3be78793          	addi	a5,a5,958 # 80025d28 <disk>
    80009972:	97ba                	add	a5,a5,a4
    80009974:	853e                	mv	a0,a5
    80009976:	ffff8097          	auipc	ra,0xffff8
    8000997a:	9c6080e7          	jalr	-1594(ra) # 8000133c <acquire>
    if(alloc3_desc(id, idx) == 0) {
    8000997e:	b72d                	j	800098a8 <virtio_disk_rw+0x76>
      break;
    80009980:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    80009982:	fd042683          	lw	a3,-48(s0)
    80009986:	fcc42703          	lw	a4,-52(s0)
    8000998a:	87ba                	mv	a5,a4
    8000998c:	078a                	slli	a5,a5,0x2
    8000998e:	97ba                	add	a5,a5,a4
    80009990:	078a                	slli	a5,a5,0x2
    80009992:	97ba                	add	a5,a5,a4
    80009994:	97b6                	add	a5,a5,a3
    80009996:	07ad                	addi	a5,a5,11
    80009998:	00479713          	slli	a4,a5,0x4
    8000999c:	0001c797          	auipc	a5,0x1c
    800099a0:	38c78793          	addi	a5,a5,908 # 80025d28 <disk>
    800099a4:	97ba                	add	a5,a5,a4
    800099a6:	fef43023          	sd	a5,-32(s0)

  if(write)
    800099aa:	fc842783          	lw	a5,-56(s0)
    800099ae:	2781                	sext.w	a5,a5
    800099b0:	c791                	beqz	a5,800099bc <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    800099b2:	fe043783          	ld	a5,-32(s0)
    800099b6:	4705                	li	a4,1
    800099b8:	c398                	sw	a4,0(a5)
    800099ba:	a029                	j	800099c4 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    800099bc:	fe043783          	ld	a5,-32(s0)
    800099c0:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    800099c4:	fe043783          	ld	a5,-32(s0)
    800099c8:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    800099cc:	fe043783          	ld	a5,-32(s0)
    800099d0:	fe843703          	ld	a4,-24(s0)
    800099d4:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    800099d6:	0001c717          	auipc	a4,0x1c
    800099da:	35270713          	addi	a4,a4,850 # 80025d28 <disk>
    800099de:	fcc42683          	lw	a3,-52(s0)
    800099e2:	15000793          	li	a5,336
    800099e6:	02f687b3          	mul	a5,a3,a5
    800099ea:	97ba                	add	a5,a5,a4
    800099ec:	6798                	ld	a4,8(a5)
    800099ee:	fd042783          	lw	a5,-48(s0)
    800099f2:	0792                	slli	a5,a5,0x4
    800099f4:	97ba                	add	a5,a5,a4
    800099f6:	fe043703          	ld	a4,-32(s0)
    800099fa:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    800099fc:	0001c717          	auipc	a4,0x1c
    80009a00:	32c70713          	addi	a4,a4,812 # 80025d28 <disk>
    80009a04:	fcc42683          	lw	a3,-52(s0)
    80009a08:	15000793          	li	a5,336
    80009a0c:	02f687b3          	mul	a5,a3,a5
    80009a10:	97ba                	add	a5,a5,a4
    80009a12:	6798                	ld	a4,8(a5)
    80009a14:	fd042783          	lw	a5,-48(s0)
    80009a18:	0792                	slli	a5,a5,0x4
    80009a1a:	97ba                	add	a5,a5,a4
    80009a1c:	4741                	li	a4,16
    80009a1e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009a20:	0001c717          	auipc	a4,0x1c
    80009a24:	30870713          	addi	a4,a4,776 # 80025d28 <disk>
    80009a28:	fcc42683          	lw	a3,-52(s0)
    80009a2c:	15000793          	li	a5,336
    80009a30:	02f687b3          	mul	a5,a3,a5
    80009a34:	97ba                	add	a5,a5,a4
    80009a36:	6798                	ld	a4,8(a5)
    80009a38:	fd042783          	lw	a5,-48(s0)
    80009a3c:	0792                	slli	a5,a5,0x4
    80009a3e:	97ba                	add	a5,a5,a4
    80009a40:	4705                	li	a4,1
    80009a42:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    80009a46:	fd442603          	lw	a2,-44(s0)
    80009a4a:	0001c717          	auipc	a4,0x1c
    80009a4e:	2de70713          	addi	a4,a4,734 # 80025d28 <disk>
    80009a52:	fcc42683          	lw	a3,-52(s0)
    80009a56:	15000793          	li	a5,336
    80009a5a:	02f687b3          	mul	a5,a3,a5
    80009a5e:	97ba                	add	a5,a5,a4
    80009a60:	6798                	ld	a4,8(a5)
    80009a62:	fd042783          	lw	a5,-48(s0)
    80009a66:	0792                	slli	a5,a5,0x4
    80009a68:	97ba                	add	a5,a5,a4
    80009a6a:	03061713          	slli	a4,a2,0x30
    80009a6e:	9341                	srli	a4,a4,0x30
    80009a70:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    80009a74:	fc043783          	ld	a5,-64(s0)
    80009a78:	05878613          	addi	a2,a5,88
    80009a7c:	0001c717          	auipc	a4,0x1c
    80009a80:	2ac70713          	addi	a4,a4,684 # 80025d28 <disk>
    80009a84:	fcc42683          	lw	a3,-52(s0)
    80009a88:	15000793          	li	a5,336
    80009a8c:	02f687b3          	mul	a5,a3,a5
    80009a90:	97ba                	add	a5,a5,a4
    80009a92:	6798                	ld	a4,8(a5)
    80009a94:	fd442783          	lw	a5,-44(s0)
    80009a98:	0792                	slli	a5,a5,0x4
    80009a9a:	97ba                	add	a5,a5,a4
    80009a9c:	8732                	mv	a4,a2
    80009a9e:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    80009aa0:	0001c717          	auipc	a4,0x1c
    80009aa4:	28870713          	addi	a4,a4,648 # 80025d28 <disk>
    80009aa8:	fcc42683          	lw	a3,-52(s0)
    80009aac:	15000793          	li	a5,336
    80009ab0:	02f687b3          	mul	a5,a3,a5
    80009ab4:	97ba                	add	a5,a5,a4
    80009ab6:	6798                	ld	a4,8(a5)
    80009ab8:	fd442783          	lw	a5,-44(s0)
    80009abc:	0792                	slli	a5,a5,0x4
    80009abe:	97ba                	add	a5,a5,a4
    80009ac0:	40000713          	li	a4,1024
    80009ac4:	c798                	sw	a4,8(a5)
  if(write)
    80009ac6:	fc842783          	lw	a5,-56(s0)
    80009aca:	2781                	sext.w	a5,a5
    80009acc:	c785                	beqz	a5,80009af4 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    80009ace:	0001c717          	auipc	a4,0x1c
    80009ad2:	25a70713          	addi	a4,a4,602 # 80025d28 <disk>
    80009ad6:	fcc42683          	lw	a3,-52(s0)
    80009ada:	15000793          	li	a5,336
    80009ade:	02f687b3          	mul	a5,a3,a5
    80009ae2:	97ba                	add	a5,a5,a4
    80009ae4:	6798                	ld	a4,8(a5)
    80009ae6:	fd442783          	lw	a5,-44(s0)
    80009aea:	0792                	slli	a5,a5,0x4
    80009aec:	97ba                	add	a5,a5,a4
    80009aee:	00079623          	sh	zero,12(a5)
    80009af2:	a025                	j	80009b1a <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009af4:	0001c717          	auipc	a4,0x1c
    80009af8:	23470713          	addi	a4,a4,564 # 80025d28 <disk>
    80009afc:	fcc42683          	lw	a3,-52(s0)
    80009b00:	15000793          	li	a5,336
    80009b04:	02f687b3          	mul	a5,a3,a5
    80009b08:	97ba                	add	a5,a5,a4
    80009b0a:	6798                	ld	a4,8(a5)
    80009b0c:	fd442783          	lw	a5,-44(s0)
    80009b10:	0792                	slli	a5,a5,0x4
    80009b12:	97ba                	add	a5,a5,a4
    80009b14:	4709                	li	a4,2
    80009b16:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80009b1a:	0001c717          	auipc	a4,0x1c
    80009b1e:	20e70713          	addi	a4,a4,526 # 80025d28 <disk>
    80009b22:	fcc42683          	lw	a3,-52(s0)
    80009b26:	15000793          	li	a5,336
    80009b2a:	02f687b3          	mul	a5,a3,a5
    80009b2e:	97ba                	add	a5,a5,a4
    80009b30:	6798                	ld	a4,8(a5)
    80009b32:	fd442783          	lw	a5,-44(s0)
    80009b36:	0792                	slli	a5,a5,0x4
    80009b38:	97ba                	add	a5,a5,a4
    80009b3a:	00c7d703          	lhu	a4,12(a5)
    80009b3e:	0001c697          	auipc	a3,0x1c
    80009b42:	1ea68693          	addi	a3,a3,490 # 80025d28 <disk>
    80009b46:	fcc42603          	lw	a2,-52(s0)
    80009b4a:	15000793          	li	a5,336
    80009b4e:	02f607b3          	mul	a5,a2,a5
    80009b52:	97b6                	add	a5,a5,a3
    80009b54:	6794                	ld	a3,8(a5)
    80009b56:	fd442783          	lw	a5,-44(s0)
    80009b5a:	0792                	slli	a5,a5,0x4
    80009b5c:	97b6                	add	a5,a5,a3
    80009b5e:	00176713          	ori	a4,a4,1
    80009b62:	1742                	slli	a4,a4,0x30
    80009b64:	9341                	srli	a4,a4,0x30
    80009b66:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    80009b6a:	fd842603          	lw	a2,-40(s0)
    80009b6e:	0001c717          	auipc	a4,0x1c
    80009b72:	1ba70713          	addi	a4,a4,442 # 80025d28 <disk>
    80009b76:	fcc42683          	lw	a3,-52(s0)
    80009b7a:	15000793          	li	a5,336
    80009b7e:	02f687b3          	mul	a5,a3,a5
    80009b82:	97ba                	add	a5,a5,a4
    80009b84:	6798                	ld	a4,8(a5)
    80009b86:	fd442783          	lw	a5,-44(s0)
    80009b8a:	0792                	slli	a5,a5,0x4
    80009b8c:	97ba                	add	a5,a5,a4
    80009b8e:	03061713          	slli	a4,a2,0x30
    80009b92:	9341                	srli	a4,a4,0x30
    80009b94:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    80009b98:	fd042603          	lw	a2,-48(s0)
    80009b9c:	0001c697          	auipc	a3,0x1c
    80009ba0:	18c68693          	addi	a3,a3,396 # 80025d28 <disk>
    80009ba4:	fcc42703          	lw	a4,-52(s0)
    80009ba8:	87ba                	mv	a5,a4
    80009baa:	078a                	slli	a5,a5,0x2
    80009bac:	97ba                	add	a5,a5,a4
    80009bae:	078a                	slli	a5,a5,0x2
    80009bb0:	97ba                	add	a5,a5,a4
    80009bb2:	97b2                	add	a5,a5,a2
    80009bb4:	078d                	addi	a5,a5,3
    80009bb6:	0792                	slli	a5,a5,0x4
    80009bb8:	97b6                	add	a5,a5,a3
    80009bba:	577d                	li	a4,-1
    80009bbc:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009bc0:	fd042683          	lw	a3,-48(s0)
    80009bc4:	fcc42703          	lw	a4,-52(s0)
    80009bc8:	87ba                	mv	a5,a4
    80009bca:	078a                	slli	a5,a5,0x2
    80009bcc:	97ba                	add	a5,a5,a4
    80009bce:	078a                	slli	a5,a5,0x2
    80009bd0:	97ba                	add	a5,a5,a4
    80009bd2:	97b6                	add	a5,a5,a3
    80009bd4:	078d                	addi	a5,a5,3
    80009bd6:	00479713          	slli	a4,a5,0x4
    80009bda:	0001c797          	auipc	a5,0x1c
    80009bde:	14e78793          	addi	a5,a5,334 # 80025d28 <disk>
    80009be2:	97ba                	add	a5,a5,a4
    80009be4:	00878613          	addi	a2,a5,8
    80009be8:	0001c717          	auipc	a4,0x1c
    80009bec:	14070713          	addi	a4,a4,320 # 80025d28 <disk>
    80009bf0:	fcc42683          	lw	a3,-52(s0)
    80009bf4:	15000793          	li	a5,336
    80009bf8:	02f687b3          	mul	a5,a3,a5
    80009bfc:	97ba                	add	a5,a5,a4
    80009bfe:	6798                	ld	a4,8(a5)
    80009c00:	fd842783          	lw	a5,-40(s0)
    80009c04:	0792                	slli	a5,a5,0x4
    80009c06:	97ba                	add	a5,a5,a4
    80009c08:	8732                	mv	a4,a2
    80009c0a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    80009c0c:	0001c717          	auipc	a4,0x1c
    80009c10:	11c70713          	addi	a4,a4,284 # 80025d28 <disk>
    80009c14:	fcc42683          	lw	a3,-52(s0)
    80009c18:	15000793          	li	a5,336
    80009c1c:	02f687b3          	mul	a5,a3,a5
    80009c20:	97ba                	add	a5,a5,a4
    80009c22:	6798                	ld	a4,8(a5)
    80009c24:	fd842783          	lw	a5,-40(s0)
    80009c28:	0792                	slli	a5,a5,0x4
    80009c2a:	97ba                	add	a5,a5,a4
    80009c2c:	4705                	li	a4,1
    80009c2e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009c30:	0001c717          	auipc	a4,0x1c
    80009c34:	0f870713          	addi	a4,a4,248 # 80025d28 <disk>
    80009c38:	fcc42683          	lw	a3,-52(s0)
    80009c3c:	15000793          	li	a5,336
    80009c40:	02f687b3          	mul	a5,a3,a5
    80009c44:	97ba                	add	a5,a5,a4
    80009c46:	6798                	ld	a4,8(a5)
    80009c48:	fd842783          	lw	a5,-40(s0)
    80009c4c:	0792                	slli	a5,a5,0x4
    80009c4e:	97ba                	add	a5,a5,a4
    80009c50:	4709                	li	a4,2
    80009c52:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009c56:	0001c717          	auipc	a4,0x1c
    80009c5a:	0d270713          	addi	a4,a4,210 # 80025d28 <disk>
    80009c5e:	fcc42683          	lw	a3,-52(s0)
    80009c62:	15000793          	li	a5,336
    80009c66:	02f687b3          	mul	a5,a3,a5
    80009c6a:	97ba                	add	a5,a5,a4
    80009c6c:	6798                	ld	a4,8(a5)
    80009c6e:	fd842783          	lw	a5,-40(s0)
    80009c72:	0792                	slli	a5,a5,0x4
    80009c74:	97ba                	add	a5,a5,a4
    80009c76:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009c7a:	fc043783          	ld	a5,-64(s0)
    80009c7e:	4705                	li	a4,1
    80009c80:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    80009c82:	fd042603          	lw	a2,-48(s0)
    80009c86:	0001c697          	auipc	a3,0x1c
    80009c8a:	0a268693          	addi	a3,a3,162 # 80025d28 <disk>
    80009c8e:	fcc42703          	lw	a4,-52(s0)
    80009c92:	87ba                	mv	a5,a4
    80009c94:	078a                	slli	a5,a5,0x2
    80009c96:	97ba                	add	a5,a5,a4
    80009c98:	078a                	slli	a5,a5,0x2
    80009c9a:	97ba                	add	a5,a5,a4
    80009c9c:	97b2                	add	a5,a5,a2
    80009c9e:	078d                	addi	a5,a5,3
    80009ca0:	0792                	slli	a5,a5,0x4
    80009ca2:	97b6                	add	a5,a5,a3
    80009ca4:	fc043703          	ld	a4,-64(s0)
    80009ca8:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009caa:	fd042583          	lw	a1,-48(s0)
    80009cae:	0001c717          	auipc	a4,0x1c
    80009cb2:	07a70713          	addi	a4,a4,122 # 80025d28 <disk>
    80009cb6:	fcc42683          	lw	a3,-52(s0)
    80009cba:	15000793          	li	a5,336
    80009cbe:	02f687b3          	mul	a5,a3,a5
    80009cc2:	97ba                	add	a5,a5,a4
    80009cc4:	6b94                	ld	a3,16(a5)
    80009cc6:	0001c717          	auipc	a4,0x1c
    80009cca:	06270713          	addi	a4,a4,98 # 80025d28 <disk>
    80009cce:	fcc42603          	lw	a2,-52(s0)
    80009cd2:	15000793          	li	a5,336
    80009cd6:	02f607b3          	mul	a5,a2,a5
    80009cda:	97ba                	add	a5,a5,a4
    80009cdc:	6b9c                	ld	a5,16(a5)
    80009cde:	0027d783          	lhu	a5,2(a5)
    80009ce2:	2781                	sext.w	a5,a5
    80009ce4:	8b9d                	andi	a5,a5,7
    80009ce6:	2781                	sext.w	a5,a5
    80009ce8:	03059713          	slli	a4,a1,0x30
    80009cec:	9341                	srli	a4,a4,0x30
    80009cee:	0786                	slli	a5,a5,0x1
    80009cf0:	97b6                	add	a5,a5,a3
    80009cf2:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009cf6:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009cfa:	0001c717          	auipc	a4,0x1c
    80009cfe:	02e70713          	addi	a4,a4,46 # 80025d28 <disk>
    80009d02:	fcc42683          	lw	a3,-52(s0)
    80009d06:	15000793          	li	a5,336
    80009d0a:	02f687b3          	mul	a5,a3,a5
    80009d0e:	97ba                	add	a5,a5,a4
    80009d10:	6b9c                	ld	a5,16(a5)
    80009d12:	0027d703          	lhu	a4,2(a5)
    80009d16:	0001c697          	auipc	a3,0x1c
    80009d1a:	01268693          	addi	a3,a3,18 # 80025d28 <disk>
    80009d1e:	fcc42603          	lw	a2,-52(s0)
    80009d22:	15000793          	li	a5,336
    80009d26:	02f607b3          	mul	a5,a2,a5
    80009d2a:	97b6                	add	a5,a5,a3
    80009d2c:	6b9c                	ld	a5,16(a5)
    80009d2e:	2705                	addiw	a4,a4,1
    80009d30:	1742                	slli	a4,a4,0x30
    80009d32:	9341                	srli	a4,a4,0x30
    80009d34:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009d38:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009d3c:	fcc42703          	lw	a4,-52(s0)
    80009d40:	67c1                	lui	a5,0x10
    80009d42:	0785                	addi	a5,a5,1
    80009d44:	97ba                	add	a5,a5,a4
    80009d46:	07b2                	slli	a5,a5,0xc
    80009d48:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009d4c:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009d50:	a871                	j	80009dec <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009d52:	fbc42783          	lw	a5,-68(s0)
    80009d56:	2781                	sext.w	a5,a5
    80009d58:	e795                	bnez	a5,80009d84 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009d5a:	fcc42703          	lw	a4,-52(s0)
    80009d5e:	15000793          	li	a5,336
    80009d62:	02f707b3          	mul	a5,a4,a5
    80009d66:	13078713          	addi	a4,a5,304
    80009d6a:	0001c797          	auipc	a5,0x1c
    80009d6e:	fbe78793          	addi	a5,a5,-66 # 80025d28 <disk>
    80009d72:	97ba                	add	a5,a5,a4
    80009d74:	85be                	mv	a1,a5
    80009d76:	fc043503          	ld	a0,-64(s0)
    80009d7a:	ffffa097          	auipc	ra,0xffffa
    80009d7e:	8be080e7          	jalr	-1858(ra) # 80003638 <sleep>
    80009d82:	a0ad                	j	80009dec <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009d84:	fcc42703          	lw	a4,-52(s0)
    80009d88:	15000793          	li	a5,336
    80009d8c:	02f707b3          	mul	a5,a4,a5
    80009d90:	13078713          	addi	a4,a5,304
    80009d94:	0001c797          	auipc	a5,0x1c
    80009d98:	f9478793          	addi	a5,a5,-108 # 80025d28 <disk>
    80009d9c:	97ba                	add	a5,a5,a4
    80009d9e:	853e                	mv	a0,a5
    80009da0:	ffff7097          	auipc	ra,0xffff7
    80009da4:	600080e7          	jalr	1536(ra) # 800013a0 <release>
        intr_on();
    80009da8:	fffff097          	auipc	ra,0xfffff
    80009dac:	ee8080e7          	jalr	-280(ra) # 80008c90 <intr_on>
        while(b->disk == 1);
    80009db0:	0001                	nop
    80009db2:	fc043783          	ld	a5,-64(s0)
    80009db6:	43dc                	lw	a5,4(a5)
    80009db8:	873e                	mv	a4,a5
    80009dba:	4785                	li	a5,1
    80009dbc:	fef70be3          	beq	a4,a5,80009db2 <virtio_disk_rw+0x580>
        intr_off();
    80009dc0:	fffff097          	auipc	ra,0xfffff
    80009dc4:	efa080e7          	jalr	-262(ra) # 80008cba <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009dc8:	fcc42703          	lw	a4,-52(s0)
    80009dcc:	15000793          	li	a5,336
    80009dd0:	02f707b3          	mul	a5,a4,a5
    80009dd4:	13078713          	addi	a4,a5,304
    80009dd8:	0001c797          	auipc	a5,0x1c
    80009ddc:	f5078793          	addi	a5,a5,-176 # 80025d28 <disk>
    80009de0:	97ba                	add	a5,a5,a4
    80009de2:	853e                	mv	a0,a5
    80009de4:	ffff7097          	auipc	ra,0xffff7
    80009de8:	558080e7          	jalr	1368(ra) # 8000133c <acquire>
  while(b->disk == 1) {
    80009dec:	fc043783          	ld	a5,-64(s0)
    80009df0:	43dc                	lw	a5,4(a5)
    80009df2:	873e                	mv	a4,a5
    80009df4:	4785                	li	a5,1
    80009df6:	f4f70ee3          	beq	a4,a5,80009d52 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    80009dfa:	fd042603          	lw	a2,-48(s0)
    80009dfe:	0001c697          	auipc	a3,0x1c
    80009e02:	f2a68693          	addi	a3,a3,-214 # 80025d28 <disk>
    80009e06:	fcc42703          	lw	a4,-52(s0)
    80009e0a:	87ba                	mv	a5,a4
    80009e0c:	078a                	slli	a5,a5,0x2
    80009e0e:	97ba                	add	a5,a5,a4
    80009e10:	078a                	slli	a5,a5,0x2
    80009e12:	97ba                	add	a5,a5,a4
    80009e14:	97b2                	add	a5,a5,a2
    80009e16:	078d                	addi	a5,a5,3
    80009e18:	0792                	slli	a5,a5,0x4
    80009e1a:	97b6                	add	a5,a5,a3
    80009e1c:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    80009e20:	fd042703          	lw	a4,-48(s0)
    80009e24:	fcc42783          	lw	a5,-52(s0)
    80009e28:	85ba                	mv	a1,a4
    80009e2a:	853e                	mv	a0,a5
    80009e2c:	00000097          	auipc	ra,0x0
    80009e30:	8b8080e7          	jalr	-1864(ra) # 800096e4 <free_chain>

  release(&disk[id].vdisk_lock);
    80009e34:	fcc42703          	lw	a4,-52(s0)
    80009e38:	15000793          	li	a5,336
    80009e3c:	02f707b3          	mul	a5,a4,a5
    80009e40:	13078713          	addi	a4,a5,304
    80009e44:	0001c797          	auipc	a5,0x1c
    80009e48:	ee478793          	addi	a5,a5,-284 # 80025d28 <disk>
    80009e4c:	97ba                	add	a5,a5,a4
    80009e4e:	853e                	mv	a0,a5
    80009e50:	ffff7097          	auipc	ra,0xffff7
    80009e54:	550080e7          	jalr	1360(ra) # 800013a0 <release>
}
    80009e58:	0001                	nop
    80009e5a:	60a6                	ld	ra,72(sp)
    80009e5c:	6406                	ld	s0,64(sp)
    80009e5e:	6161                	addi	sp,sp,80
    80009e60:	8082                	ret

0000000080009e62 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009e62:	7179                	addi	sp,sp,-48
    80009e64:	f406                	sd	ra,40(sp)
    80009e66:	f022                	sd	s0,32(sp)
    80009e68:	1800                	addi	s0,sp,48
    80009e6a:	87aa                	mv	a5,a0
    80009e6c:	fcb43823          	sd	a1,-48(s0)
    80009e70:	8732                	mv	a4,a2
    80009e72:	fcf42e23          	sw	a5,-36(s0)
    80009e76:	87ba                	mv	a5,a4
    80009e78:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009e7c:	0001c797          	auipc	a5,0x1c
    80009e80:	14c78793          	addi	a5,a5,332 # 80025fc8 <swap_buffer>
    80009e84:	639c                	ld	a5,0(a5)
    80009e86:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009e8a:	fdc42703          	lw	a4,-36(s0)
    80009e8e:	fe843783          	ld	a5,-24(s0)
    80009e92:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    80009e94:	fe843783          	ld	a5,-24(s0)
    80009e98:	05878793          	addi	a5,a5,88
    80009e9c:	40000613          	li	a2,1024
    80009ea0:	fd043583          	ld	a1,-48(s0)
    80009ea4:	853e                	mv	a0,a5
    80009ea6:	ffff7097          	auipc	ra,0xffff7
    80009eaa:	74e080e7          	jalr	1870(ra) # 800015f4 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    80009eae:	fd842783          	lw	a5,-40(s0)
    80009eb2:	86be                	mv	a3,a5
    80009eb4:	4605                	li	a2,1
    80009eb6:	fe843583          	ld	a1,-24(s0)
    80009eba:	4505                	li	a0,1
    80009ebc:	00000097          	auipc	ra,0x0
    80009ec0:	976080e7          	jalr	-1674(ra) # 80009832 <virtio_disk_rw>
}
    80009ec4:	0001                	nop
    80009ec6:	70a2                	ld	ra,40(sp)
    80009ec8:	7402                	ld	s0,32(sp)
    80009eca:	6145                	addi	sp,sp,48
    80009ecc:	8082                	ret

0000000080009ece <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009ece:	7179                	addi	sp,sp,-48
    80009ed0:	f406                	sd	ra,40(sp)
    80009ed2:	f022                	sd	s0,32(sp)
    80009ed4:	1800                	addi	s0,sp,48
    80009ed6:	87aa                	mv	a5,a0
    80009ed8:	fcb43823          	sd	a1,-48(s0)
    80009edc:	8732                	mv	a4,a2
    80009ede:	fcf42e23          	sw	a5,-36(s0)
    80009ee2:	87ba                	mv	a5,a4
    80009ee4:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009ee8:	0001c797          	auipc	a5,0x1c
    80009eec:	0e078793          	addi	a5,a5,224 # 80025fc8 <swap_buffer>
    80009ef0:	639c                	ld	a5,0(a5)
    80009ef2:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009ef6:	fdc42703          	lw	a4,-36(s0)
    80009efa:	fe843783          	ld	a5,-24(s0)
    80009efe:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    80009f00:	fd842783          	lw	a5,-40(s0)
    80009f04:	86be                	mv	a3,a5
    80009f06:	4601                	li	a2,0
    80009f08:	fe843583          	ld	a1,-24(s0)
    80009f0c:	4505                	li	a0,1
    80009f0e:	00000097          	auipc	ra,0x0
    80009f12:	924080e7          	jalr	-1756(ra) # 80009832 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009f16:	fe843783          	ld	a5,-24(s0)
    80009f1a:	05878793          	addi	a5,a5,88
    80009f1e:	40000613          	li	a2,1024
    80009f22:	85be                	mv	a1,a5
    80009f24:	fd043503          	ld	a0,-48(s0)
    80009f28:	ffff7097          	auipc	ra,0xffff7
    80009f2c:	6cc080e7          	jalr	1740(ra) # 800015f4 <memmove>
}
    80009f30:	0001                	nop
    80009f32:	70a2                	ld	ra,40(sp)
    80009f34:	7402                	ld	s0,32(sp)
    80009f36:	6145                	addi	sp,sp,48
    80009f38:	8082                	ret

0000000080009f3a <deallocate_page>:

void deallocate_page(int pageno)
{
    80009f3a:	1101                	addi	sp,sp,-32
    80009f3c:	ec06                	sd	ra,24(sp)
    80009f3e:	e822                	sd	s0,16(sp)
    80009f40:	1000                	addi	s0,sp,32
    80009f42:	87aa                	mv	a5,a0
    80009f44:	fef42623          	sw	a5,-20(s0)
  clearBit(pageno);
    80009f48:	fec42783          	lw	a5,-20(s0)
    80009f4c:	853e                	mv	a0,a5
    80009f4e:	fffff097          	auipc	ra,0xfffff
    80009f52:	df6080e7          	jalr	-522(ra) # 80008d44 <clearBit>
}
    80009f56:	0001                	nop
    80009f58:	60e2                	ld	ra,24(sp)
    80009f5a:	6442                	ld	s0,16(sp)
    80009f5c:	6105                	addi	sp,sp,32
    80009f5e:	8082                	ret

0000000080009f60 <write_page_to_disk>:

int write_page_to_disk(uchar data[4096]) {
    80009f60:	7179                	addi	sp,sp,-48
    80009f62:	f406                	sd	ra,40(sp)
    80009f64:	f022                	sd	s0,32(sp)
    80009f66:	1800                	addi	s0,sp,48
    80009f68:	fca43c23          	sd	a0,-40(s0)
  int pageno = takeFirstFreePage();
    80009f6c:	fffff097          	auipc	ra,0xfffff
    80009f70:	ed6080e7          	jalr	-298(ra) # 80008e42 <takeFirstFreePage>
    80009f74:	87aa                	mv	a5,a0
    80009f76:	fef42423          	sw	a5,-24(s0)
  if(pageno < 0) return -1;
    80009f7a:	fe842783          	lw	a5,-24(s0)
    80009f7e:	2781                	sext.w	a5,a5
    80009f80:	0007d463          	bgez	a5,80009f88 <write_page_to_disk+0x28>
    80009f84:	57fd                	li	a5,-1
    80009f86:	a8b9                	j	80009fe4 <write_page_to_disk+0x84>

  int blockno = pageno*4;
    80009f88:	fe842783          	lw	a5,-24(s0)
    80009f8c:	0027979b          	slliw	a5,a5,0x2
    80009f90:	fef42223          	sw	a5,-28(s0)
  for(int i = 0; i < 4; i++)
    80009f94:	fe042623          	sw	zero,-20(s0)
    80009f98:	a82d                	j	80009fd2 <write_page_to_disk+0x72>
  {
    write_block(blockno + i, data + i*1024, 0);
    80009f9a:	fe442703          	lw	a4,-28(s0)
    80009f9e:	fec42783          	lw	a5,-20(s0)
    80009fa2:	9fb9                	addw	a5,a5,a4
    80009fa4:	0007871b          	sext.w	a4,a5
    80009fa8:	fec42783          	lw	a5,-20(s0)
    80009fac:	00a7979b          	slliw	a5,a5,0xa
    80009fb0:	2781                	sext.w	a5,a5
    80009fb2:	86be                	mv	a3,a5
    80009fb4:	fd843783          	ld	a5,-40(s0)
    80009fb8:	97b6                	add	a5,a5,a3
    80009fba:	4601                	li	a2,0
    80009fbc:	85be                	mv	a1,a5
    80009fbe:	853a                	mv	a0,a4
    80009fc0:	00000097          	auipc	ra,0x0
    80009fc4:	ea2080e7          	jalr	-350(ra) # 80009e62 <write_block>
  for(int i = 0; i < 4; i++)
    80009fc8:	fec42783          	lw	a5,-20(s0)
    80009fcc:	2785                	addiw	a5,a5,1
    80009fce:	fef42623          	sw	a5,-20(s0)
    80009fd2:	fec42783          	lw	a5,-20(s0)
    80009fd6:	0007871b          	sext.w	a4,a5
    80009fda:	478d                	li	a5,3
    80009fdc:	fae7dfe3          	bge	a5,a4,80009f9a <write_page_to_disk+0x3a>
  }

  return pageno;
    80009fe0:	fe842783          	lw	a5,-24(s0)
}
    80009fe4:	853e                	mv	a0,a5
    80009fe6:	70a2                	ld	ra,40(sp)
    80009fe8:	7402                	ld	s0,32(sp)
    80009fea:	6145                	addi	sp,sp,48
    80009fec:	8082                	ret

0000000080009fee <take_page_from_disk>:

void take_page_from_disk(int diskpageno, uchar dest[4096]){
    80009fee:	7179                	addi	sp,sp,-48
    80009ff0:	f406                	sd	ra,40(sp)
    80009ff2:	f022                	sd	s0,32(sp)
    80009ff4:	1800                	addi	s0,sp,48
    80009ff6:	87aa                	mv	a5,a0
    80009ff8:	fcb43823          	sd	a1,-48(s0)
    80009ffc:	fcf42e23          	sw	a5,-36(s0)
  int blockno = diskpageno * 4;
    8000a000:	fdc42783          	lw	a5,-36(s0)
    8000a004:	0027979b          	slliw	a5,a5,0x2
    8000a008:	fef42423          	sw	a5,-24(s0)
  for(int i = 0; i < 4; i++)
    8000a00c:	fe042623          	sw	zero,-20(s0)
    8000a010:	a82d                	j	8000a04a <take_page_from_disk+0x5c>
  {
    read_block(blockno + i, dest + i * 1024, 0);
    8000a012:	fe842703          	lw	a4,-24(s0)
    8000a016:	fec42783          	lw	a5,-20(s0)
    8000a01a:	9fb9                	addw	a5,a5,a4
    8000a01c:	0007871b          	sext.w	a4,a5
    8000a020:	fec42783          	lw	a5,-20(s0)
    8000a024:	00a7979b          	slliw	a5,a5,0xa
    8000a028:	2781                	sext.w	a5,a5
    8000a02a:	86be                	mv	a3,a5
    8000a02c:	fd043783          	ld	a5,-48(s0)
    8000a030:	97b6                	add	a5,a5,a3
    8000a032:	4601                	li	a2,0
    8000a034:	85be                	mv	a1,a5
    8000a036:	853a                	mv	a0,a4
    8000a038:	00000097          	auipc	ra,0x0
    8000a03c:	e96080e7          	jalr	-362(ra) # 80009ece <read_block>
  for(int i = 0; i < 4; i++)
    8000a040:	fec42783          	lw	a5,-20(s0)
    8000a044:	2785                	addiw	a5,a5,1
    8000a046:	fef42623          	sw	a5,-20(s0)
    8000a04a:	fec42783          	lw	a5,-20(s0)
    8000a04e:	0007871b          	sext.w	a4,a5
    8000a052:	478d                	li	a5,3
    8000a054:	fae7dfe3          	bge	a5,a4,8000a012 <take_page_from_disk+0x24>
  }
  deallocate_page(diskpageno);
    8000a058:	fdc42783          	lw	a5,-36(s0)
    8000a05c:	853e                	mv	a0,a5
    8000a05e:	00000097          	auipc	ra,0x0
    8000a062:	edc080e7          	jalr	-292(ra) # 80009f3a <deallocate_page>
}
    8000a066:	0001                	nop
    8000a068:	70a2                	ld	ra,40(sp)
    8000a06a:	7402                	ld	s0,32(sp)
    8000a06c:	6145                	addi	sp,sp,48
    8000a06e:	8082                	ret

000000008000a070 <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    8000a070:	7179                	addi	sp,sp,-48
    8000a072:	f406                	sd	ra,40(sp)
    8000a074:	f022                	sd	s0,32(sp)
    8000a076:	1800                	addi	s0,sp,48
    8000a078:	87aa                	mv	a5,a0
    8000a07a:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    8000a07e:	fdc42703          	lw	a4,-36(s0)
    8000a082:	15000793          	li	a5,336
    8000a086:	02f707b3          	mul	a5,a4,a5
    8000a08a:	13078713          	addi	a4,a5,304
    8000a08e:	0001c797          	auipc	a5,0x1c
    8000a092:	c9a78793          	addi	a5,a5,-870 # 80025d28 <disk>
    8000a096:	97ba                	add	a5,a5,a4
    8000a098:	853e                	mv	a0,a5
    8000a09a:	ffff7097          	auipc	ra,0xffff7
    8000a09e:	2a2080e7          	jalr	674(ra) # 8000133c <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000a0a2:	fdc42703          	lw	a4,-36(s0)
    8000a0a6:	67c1                	lui	a5,0x10
    8000a0a8:	0785                	addi	a5,a5,1
    8000a0aa:	97ba                	add	a5,a5,a4
    8000a0ac:	07b2                	slli	a5,a5,0xc
    8000a0ae:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    8000a0b2:	439c                	lw	a5,0(a5)
    8000a0b4:	0007869b          	sext.w	a3,a5
    8000a0b8:	fdc42703          	lw	a4,-36(s0)
    8000a0bc:	67c1                	lui	a5,0x10
    8000a0be:	0785                	addi	a5,a5,1
    8000a0c0:	97ba                	add	a5,a5,a4
    8000a0c2:	07b2                	slli	a5,a5,0xc
    8000a0c4:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    8000a0c8:	873e                	mv	a4,a5
    8000a0ca:	87b6                	mv	a5,a3
    8000a0cc:	8b8d                	andi	a5,a5,3
    8000a0ce:	2781                	sext.w	a5,a5
    8000a0d0:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    8000a0d2:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    8000a0d6:	aa05                	j	8000a206 <virtio_disk_intr+0x196>
    __sync_synchronize();
    8000a0d8:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    8000a0dc:	0001c717          	auipc	a4,0x1c
    8000a0e0:	c4c70713          	addi	a4,a4,-948 # 80025d28 <disk>
    8000a0e4:	fdc42683          	lw	a3,-36(s0)
    8000a0e8:	15000793          	li	a5,336
    8000a0ec:	02f687b3          	mul	a5,a3,a5
    8000a0f0:	97ba                	add	a5,a5,a4
    8000a0f2:	6f98                	ld	a4,24(a5)
    8000a0f4:	0001c697          	auipc	a3,0x1c
    8000a0f8:	c3468693          	addi	a3,a3,-972 # 80025d28 <disk>
    8000a0fc:	fdc42603          	lw	a2,-36(s0)
    8000a100:	15000793          	li	a5,336
    8000a104:	02f607b3          	mul	a5,a2,a5
    8000a108:	97b6                	add	a5,a5,a3
    8000a10a:	0287d783          	lhu	a5,40(a5)
    8000a10e:	2781                	sext.w	a5,a5
    8000a110:	8b9d                	andi	a5,a5,7
    8000a112:	2781                	sext.w	a5,a5
    8000a114:	078e                	slli	a5,a5,0x3
    8000a116:	97ba                	add	a5,a5,a4
    8000a118:	43dc                	lw	a5,4(a5)
    8000a11a:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    8000a11e:	0001c697          	auipc	a3,0x1c
    8000a122:	c0a68693          	addi	a3,a3,-1014 # 80025d28 <disk>
    8000a126:	fec42603          	lw	a2,-20(s0)
    8000a12a:	fdc42703          	lw	a4,-36(s0)
    8000a12e:	87ba                	mv	a5,a4
    8000a130:	078a                	slli	a5,a5,0x2
    8000a132:	97ba                	add	a5,a5,a4
    8000a134:	078a                	slli	a5,a5,0x2
    8000a136:	97ba                	add	a5,a5,a4
    8000a138:	97b2                	add	a5,a5,a2
    8000a13a:	078d                	addi	a5,a5,3
    8000a13c:	0792                	slli	a5,a5,0x4
    8000a13e:	97b6                	add	a5,a5,a3
    8000a140:	0087c783          	lbu	a5,8(a5)
    8000a144:	c79d                	beqz	a5,8000a172 <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    8000a146:	0001c717          	auipc	a4,0x1c
    8000a14a:	be270713          	addi	a4,a4,-1054 # 80025d28 <disk>
    8000a14e:	fdc42683          	lw	a3,-36(s0)
    8000a152:	15000793          	li	a5,336
    8000a156:	02f687b3          	mul	a5,a3,a5
    8000a15a:	97ba                	add	a5,a5,a4
    8000a15c:	639c                	ld	a5,0(a5)
    8000a15e:	00002617          	auipc	a2,0x2
    8000a162:	63a60613          	addi	a2,a2,1594 # 8000c798 <etext+0x798>
    8000a166:	85be                	mv	a1,a5
    8000a168:	4509                	li	a0,2
    8000a16a:	ffff7097          	auipc	ra,0xffff7
    8000a16e:	b74080e7          	jalr	-1164(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    8000a172:	0001c697          	auipc	a3,0x1c
    8000a176:	bb668693          	addi	a3,a3,-1098 # 80025d28 <disk>
    8000a17a:	fec42603          	lw	a2,-20(s0)
    8000a17e:	fdc42703          	lw	a4,-36(s0)
    8000a182:	87ba                	mv	a5,a4
    8000a184:	078a                	slli	a5,a5,0x2
    8000a186:	97ba                	add	a5,a5,a4
    8000a188:	078a                	slli	a5,a5,0x2
    8000a18a:	97ba                	add	a5,a5,a4
    8000a18c:	97b2                	add	a5,a5,a2
    8000a18e:	078d                	addi	a5,a5,3
    8000a190:	0792                	slli	a5,a5,0x4
    8000a192:	97b6                	add	a5,a5,a3
    8000a194:	639c                	ld	a5,0(a5)
    8000a196:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    8000a19a:	fe043783          	ld	a5,-32(s0)
    8000a19e:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    8000a1a2:	0001c717          	auipc	a4,0x1c
    8000a1a6:	b8670713          	addi	a4,a4,-1146 # 80025d28 <disk>
    8000a1aa:	fdc42683          	lw	a3,-36(s0)
    8000a1ae:	15000793          	li	a5,336
    8000a1b2:	02f687b3          	mul	a5,a3,a5
    8000a1b6:	97ba                	add	a5,a5,a4
    8000a1b8:	1487a783          	lw	a5,328(a5)
    8000a1bc:	e799                	bnez	a5,8000a1ca <virtio_disk_intr+0x15a>
        wakeup(b);
    8000a1be:	fe043503          	ld	a0,-32(s0)
    8000a1c2:	ffff9097          	auipc	ra,0xffff9
    8000a1c6:	4f2080e7          	jalr	1266(ra) # 800036b4 <wakeup>
    }

    disk[id].used_idx += 1;
    8000a1ca:	0001c717          	auipc	a4,0x1c
    8000a1ce:	b5e70713          	addi	a4,a4,-1186 # 80025d28 <disk>
    8000a1d2:	fdc42683          	lw	a3,-36(s0)
    8000a1d6:	15000793          	li	a5,336
    8000a1da:	02f687b3          	mul	a5,a3,a5
    8000a1de:	97ba                	add	a5,a5,a4
    8000a1e0:	0287d783          	lhu	a5,40(a5)
    8000a1e4:	2785                	addiw	a5,a5,1
    8000a1e6:	03079713          	slli	a4,a5,0x30
    8000a1ea:	9341                	srli	a4,a4,0x30
    8000a1ec:	0001c697          	auipc	a3,0x1c
    8000a1f0:	b3c68693          	addi	a3,a3,-1220 # 80025d28 <disk>
    8000a1f4:	fdc42603          	lw	a2,-36(s0)
    8000a1f8:	15000793          	li	a5,336
    8000a1fc:	02f607b3          	mul	a5,a2,a5
    8000a200:	97b6                	add	a5,a5,a3
    8000a202:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    8000a206:	0001c717          	auipc	a4,0x1c
    8000a20a:	b2270713          	addi	a4,a4,-1246 # 80025d28 <disk>
    8000a20e:	fdc42683          	lw	a3,-36(s0)
    8000a212:	15000793          	li	a5,336
    8000a216:	02f687b3          	mul	a5,a3,a5
    8000a21a:	97ba                	add	a5,a5,a4
    8000a21c:	0287d603          	lhu	a2,40(a5)
    8000a220:	0001c717          	auipc	a4,0x1c
    8000a224:	b0870713          	addi	a4,a4,-1272 # 80025d28 <disk>
    8000a228:	fdc42683          	lw	a3,-36(s0)
    8000a22c:	15000793          	li	a5,336
    8000a230:	02f687b3          	mul	a5,a3,a5
    8000a234:	97ba                	add	a5,a5,a4
    8000a236:	6f9c                	ld	a5,24(a5)
    8000a238:	0027d783          	lhu	a5,2(a5)
    8000a23c:	0006071b          	sext.w	a4,a2
    8000a240:	2781                	sext.w	a5,a5
    8000a242:	e8f71be3          	bne	a4,a5,8000a0d8 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    8000a246:	fdc42703          	lw	a4,-36(s0)
    8000a24a:	15000793          	li	a5,336
    8000a24e:	02f707b3          	mul	a5,a4,a5
    8000a252:	13078713          	addi	a4,a5,304
    8000a256:	0001c797          	auipc	a5,0x1c
    8000a25a:	ad278793          	addi	a5,a5,-1326 # 80025d28 <disk>
    8000a25e:	97ba                	add	a5,a5,a4
    8000a260:	853e                	mv	a0,a5
    8000a262:	ffff7097          	auipc	ra,0xffff7
    8000a266:	13e080e7          	jalr	318(ra) # 800013a0 <release>
}
    8000a26a:	0001                	nop
    8000a26c:	70a2                	ld	ra,40(sp)
    8000a26e:	7402                	ld	s0,32(sp)
    8000a270:	6145                	addi	sp,sp,48
    8000a272:	8082                	ret

000000008000a274 <sfence_vma>:
{
    8000a274:	1141                	addi	sp,sp,-16
    8000a276:	e422                	sd	s0,8(sp)
    8000a278:	0800                	addi	s0,sp,16
  asm volatile("sfence.vma zero, zero");
    8000a27a:	12000073          	sfence.vma
}
    8000a27e:	0001                	nop
    8000a280:	6422                	ld	s0,8(sp)
    8000a282:	0141                	addi	sp,sp,16
    8000a284:	8082                	ret

000000008000a286 <getpaddress>:
static struct lrupinfo lrupages[RAM_PAGES_COUNT] = {{0} };
struct spinlock lrupageslock;

uint64
getpaddress(pte_t *pte)
{
    8000a286:	7179                	addi	sp,sp,-48
    8000a288:	f422                	sd	s0,40(sp)
    8000a28a:	1800                	addi	s0,sp,48
    8000a28c:	fca43c23          	sd	a0,-40(s0)
  uint64 ppn = ( (*pte) & 0x3FFFFFFFFFFFFL ) >> 10; // Extract bits 53-10 and shift to the right place
    8000a290:	fd843783          	ld	a5,-40(s0)
    8000a294:	639c                	ld	a5,0(a5)
    8000a296:	00a7d713          	srli	a4,a5,0xa
    8000a29a:	57fd                	li	a5,-1
    8000a29c:	83e1                	srli	a5,a5,0x18
    8000a29e:	8ff9                	and	a5,a5,a4
    8000a2a0:	fef43423          	sd	a5,-24(s0)
  uint64 physical_address = ppn << 12; // Shift left by 12 bits to accommodate for the page offset
    8000a2a4:	fe843783          	ld	a5,-24(s0)
    8000a2a8:	07b2                	slli	a5,a5,0xc
    8000a2aa:	fef43023          	sd	a5,-32(s0)
  return physical_address;
    8000a2ae:	fe043783          	ld	a5,-32(s0)
}
    8000a2b2:	853e                	mv	a0,a5
    8000a2b4:	7422                	ld	s0,40(sp)
    8000a2b6:	6145                	addi	sp,sp,48
    8000a2b8:	8082                	ret

000000008000a2ba <setpaddress>:

void
setpaddress(pte_t *pte, uint64 new_ppn)
{
    8000a2ba:	7179                	addi	sp,sp,-48
    8000a2bc:	f422                	sd	s0,40(sp)
    8000a2be:	1800                	addi	s0,sp,48
    8000a2c0:	fca43c23          	sd	a0,-40(s0)
    8000a2c4:	fcb43823          	sd	a1,-48(s0)
  uint64 masked_pte = *pte & ~0x3FFFFFFFFFFFFL;
    8000a2c8:	fd843783          	ld	a5,-40(s0)
    8000a2cc:	6398                	ld	a4,0(a5)
    8000a2ce:	57fd                	li	a5,-1
    8000a2d0:	17ca                	slli	a5,a5,0x32
    8000a2d2:	8ff9                	and	a5,a5,a4
    8000a2d4:	fef43423          	sd	a5,-24(s0)
  uint64 new_ppn_shifted = (new_ppn << 10) & 0x3FFFFFFFFFFFFL;
    8000a2d8:	fd043783          	ld	a5,-48(s0)
    8000a2dc:	00a79713          	slli	a4,a5,0xa
    8000a2e0:	57fd                	li	a5,-1
    8000a2e2:	83b9                	srli	a5,a5,0xe
    8000a2e4:	8ff9                	and	a5,a5,a4
    8000a2e6:	fef43023          	sd	a5,-32(s0)
  *pte = masked_pte | new_ppn_shifted;
    8000a2ea:	fe843703          	ld	a4,-24(s0)
    8000a2ee:	fe043783          	ld	a5,-32(s0)
    8000a2f2:	8f5d                	or	a4,a4,a5
    8000a2f4:	fd843783          	ld	a5,-40(s0)
    8000a2f8:	e398                	sd	a4,0(a5)
}
    8000a2fa:	0001                	nop
    8000a2fc:	7422                	ld	s0,40(sp)
    8000a2fe:	6145                	addi	sp,sp,48
    8000a300:	8082                	ret

000000008000a302 <ispteready>:

int
ispteready(pte_t *pte)
{
    8000a302:	1101                	addi	sp,sp,-32
    8000a304:	ec22                	sd	s0,24(sp)
    8000a306:	1000                	addi	s0,sp,32
    8000a308:	fea43423          	sd	a0,-24(s0)
  return (*pte & PTE_V) && !(*pte & PTE_PENDING_DISK_OPERATION);
    8000a30c:	fe843783          	ld	a5,-24(s0)
    8000a310:	639c                	ld	a5,0(a5)
    8000a312:	8b85                	andi	a5,a5,1
    8000a314:	cb89                	beqz	a5,8000a326 <ispteready+0x24>
    8000a316:	fe843783          	ld	a5,-24(s0)
    8000a31a:	639c                	ld	a5,0(a5)
    8000a31c:	2007f793          	andi	a5,a5,512
    8000a320:	e399                	bnez	a5,8000a326 <ispteready+0x24>
    8000a322:	4785                	li	a5,1
    8000a324:	a011                	j	8000a328 <ispteready+0x26>
    8000a326:	4781                	li	a5,0
}
    8000a328:	853e                	mv	a0,a5
    8000a32a:	6462                	ld	s0,24(sp)
    8000a32c:	6105                	addi	sp,sp,32
    8000a32e:	8082                	ret

000000008000a330 <ispteswappable>:

int
ispteswappable(pagetable_t pagetable, uint64 va, pte_t *pte)
{
    8000a330:	7179                	addi	sp,sp,-48
    8000a332:	f406                	sd	ra,40(sp)
    8000a334:	f022                	sd	s0,32(sp)
    8000a336:	1800                	addi	s0,sp,48
    8000a338:	fea43423          	sd	a0,-24(s0)
    8000a33c:	feb43023          	sd	a1,-32(s0)
    8000a340:	fcc43c23          	sd	a2,-40(s0)
  return  pagetable != kernel_pagetable
    8000a344:	00002797          	auipc	a5,0x2
    8000a348:	67478793          	addi	a5,a5,1652 # 8000c9b8 <kernel_pagetable>
    8000a34c:	639c                	ld	a5,0(a5)
          && (uint64*)getpaddress(pte) != pagetable
          && *pte & PTE_U
          && !(*pte & PTE_X)
          && va != TRAMPOLINE
          && va != TRAPFRAME;
    8000a34e:	fe843703          	ld	a4,-24(s0)
    8000a352:	04f70a63          	beq	a4,a5,8000a3a6 <ispteswappable+0x76>
          && (uint64*)getpaddress(pte) != pagetable
    8000a356:	fd843503          	ld	a0,-40(s0)
    8000a35a:	00000097          	auipc	ra,0x0
    8000a35e:	f2c080e7          	jalr	-212(ra) # 8000a286 <getpaddress>
    8000a362:	87aa                	mv	a5,a0
    8000a364:	873e                	mv	a4,a5
    8000a366:	fe843783          	ld	a5,-24(s0)
    8000a36a:	02e78e63          	beq	a5,a4,8000a3a6 <ispteswappable+0x76>
          && *pte & PTE_U
    8000a36e:	fd843783          	ld	a5,-40(s0)
    8000a372:	639c                	ld	a5,0(a5)
    8000a374:	8bc1                	andi	a5,a5,16
    8000a376:	cb85                	beqz	a5,8000a3a6 <ispteswappable+0x76>
          && !(*pte & PTE_X)
    8000a378:	fd843783          	ld	a5,-40(s0)
    8000a37c:	639c                	ld	a5,0(a5)
    8000a37e:	8ba1                	andi	a5,a5,8
    8000a380:	e39d                	bnez	a5,8000a3a6 <ispteswappable+0x76>
          && va != TRAMPOLINE
    8000a382:	fe043703          	ld	a4,-32(s0)
    8000a386:	040007b7          	lui	a5,0x4000
    8000a38a:	17fd                	addi	a5,a5,-1
    8000a38c:	07b2                	slli	a5,a5,0xc
    8000a38e:	00f70c63          	beq	a4,a5,8000a3a6 <ispteswappable+0x76>
          && va != TRAPFRAME;
    8000a392:	fe043703          	ld	a4,-32(s0)
    8000a396:	020007b7          	lui	a5,0x2000
    8000a39a:	17fd                	addi	a5,a5,-1
    8000a39c:	07b6                	slli	a5,a5,0xd
    8000a39e:	00f70463          	beq	a4,a5,8000a3a6 <ispteswappable+0x76>
    8000a3a2:	4785                	li	a5,1
    8000a3a4:	a011                	j	8000a3a8 <ispteswappable+0x78>
    8000a3a6:	4781                	li	a5,0
}
    8000a3a8:	853e                	mv	a0,a5
    8000a3aa:	70a2                	ld	ra,40(sp)
    8000a3ac:	7402                	ld	s0,32(sp)
    8000a3ae:	6145                	addi	sp,sp,48
    8000a3b0:	8082                	ret

000000008000a3b2 <getfirstfreelrupage>:

struct lrupinfo*
getfirstfreelrupage()
{
    8000a3b2:	1101                	addi	sp,sp,-32
    8000a3b4:	ec22                	sd	s0,24(sp)
    8000a3b6:	1000                	addi	s0,sp,32
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a3b8:	fe043423          	sd	zero,-24(s0)
    8000a3bc:	a815                	j	8000a3f0 <getfirstfreelrupage+0x3e>
  {
    if(lrupages[i].pte == 0)
    8000a3be:	0001c717          	auipc	a4,0x1c
    8000a3c2:	c2a70713          	addi	a4,a4,-982 # 80025fe8 <lrupages>
    8000a3c6:	fe843783          	ld	a5,-24(s0)
    8000a3ca:	0796                	slli	a5,a5,0x5
    8000a3cc:	97ba                	add	a5,a5,a4
    8000a3ce:	679c                	ld	a5,8(a5)
    8000a3d0:	eb99                	bnez	a5,8000a3e6 <getfirstfreelrupage+0x34>
    {
      return &(lrupages[i]);
    8000a3d2:	fe843783          	ld	a5,-24(s0)
    8000a3d6:	00579713          	slli	a4,a5,0x5
    8000a3da:	0001c797          	auipc	a5,0x1c
    8000a3de:	c0e78793          	addi	a5,a5,-1010 # 80025fe8 <lrupages>
    8000a3e2:	97ba                	add	a5,a5,a4
    8000a3e4:	a829                	j	8000a3fe <getfirstfreelrupage+0x4c>
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a3e6:	fe843783          	ld	a5,-24(s0)
    8000a3ea:	0785                	addi	a5,a5,1
    8000a3ec:	fef43423          	sd	a5,-24(s0)
    8000a3f0:	fe843703          	ld	a4,-24(s0)
    8000a3f4:	1ff00793          	li	a5,511
    8000a3f8:	fce7f3e3          	bgeu	a5,a4,8000a3be <getfirstfreelrupage+0xc>
    }
  }

  return 0;
    8000a3fc:	4781                	li	a5,0
}
    8000a3fe:	853e                	mv	a0,a5
    8000a400:	6462                	ld	s0,24(sp)
    8000a402:	6105                	addi	sp,sp,32
    8000a404:	8082                	ret

000000008000a406 <getpinfo>:

struct lrupinfo*
getpinfo(uint64 va, pagetable_t pagetable)
{
    8000a406:	7179                	addi	sp,sp,-48
    8000a408:	f422                	sd	s0,40(sp)
    8000a40a:	1800                	addi	s0,sp,48
    8000a40c:	fca43c23          	sd	a0,-40(s0)
    8000a410:	fcb43823          	sd	a1,-48(s0)
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a414:	fe043423          	sd	zero,-24(s0)
    8000a418:	a0ad                	j	8000a482 <getpinfo+0x7c>
  {
    if(lrupages[i].pte == 0) continue;
    8000a41a:	0001c717          	auipc	a4,0x1c
    8000a41e:	bce70713          	addi	a4,a4,-1074 # 80025fe8 <lrupages>
    8000a422:	fe843783          	ld	a5,-24(s0)
    8000a426:	0796                	slli	a5,a5,0x5
    8000a428:	97ba                	add	a5,a5,a4
    8000a42a:	679c                	ld	a5,8(a5)
    8000a42c:	c7a9                	beqz	a5,8000a476 <getpinfo+0x70>
    if(lrupages[i].pagetable == pagetable && lrupages[i].va == va)
    8000a42e:	0001c717          	auipc	a4,0x1c
    8000a432:	bba70713          	addi	a4,a4,-1094 # 80025fe8 <lrupages>
    8000a436:	fe843783          	ld	a5,-24(s0)
    8000a43a:	0796                	slli	a5,a5,0x5
    8000a43c:	97ba                	add	a5,a5,a4
    8000a43e:	6f9c                	ld	a5,24(a5)
    8000a440:	fd043703          	ld	a4,-48(s0)
    8000a444:	02f71a63          	bne	a4,a5,8000a478 <getpinfo+0x72>
    8000a448:	0001c717          	auipc	a4,0x1c
    8000a44c:	ba070713          	addi	a4,a4,-1120 # 80025fe8 <lrupages>
    8000a450:	fe843783          	ld	a5,-24(s0)
    8000a454:	0796                	slli	a5,a5,0x5
    8000a456:	97ba                	add	a5,a5,a4
    8000a458:	6b9c                	ld	a5,16(a5)
    8000a45a:	fd843703          	ld	a4,-40(s0)
    8000a45e:	00f71d63          	bne	a4,a5,8000a478 <getpinfo+0x72>
    {
      return &(lrupages[i]);
    8000a462:	fe843783          	ld	a5,-24(s0)
    8000a466:	00579713          	slli	a4,a5,0x5
    8000a46a:	0001c797          	auipc	a5,0x1c
    8000a46e:	b7e78793          	addi	a5,a5,-1154 # 80025fe8 <lrupages>
    8000a472:	97ba                	add	a5,a5,a4
    8000a474:	a831                	j	8000a490 <getpinfo+0x8a>
    if(lrupages[i].pte == 0) continue;
    8000a476:	0001                	nop
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a478:	fe843783          	ld	a5,-24(s0)
    8000a47c:	0785                	addi	a5,a5,1
    8000a47e:	fef43423          	sd	a5,-24(s0)
    8000a482:	fe843703          	ld	a4,-24(s0)
    8000a486:	1ff00793          	li	a5,511
    8000a48a:	f8e7f8e3          	bgeu	a5,a4,8000a41a <getpinfo+0x14>
    }
  }

  return 0;
    8000a48e:	4781                	li	a5,0
}
    8000a490:	853e                	mv	a0,a5
    8000a492:	7422                	ld	s0,40(sp)
    8000a494:	6145                	addi	sp,sp,48
    8000a496:	8082                	ret

000000008000a498 <reglrupage>:

void
reglrupage(pte_t *pte, uint64 va, pagetable_t pagetable)
{
    8000a498:	7139                	addi	sp,sp,-64
    8000a49a:	fc06                	sd	ra,56(sp)
    8000a49c:	f822                	sd	s0,48(sp)
    8000a49e:	0080                	addi	s0,sp,64
    8000a4a0:	fca43c23          	sd	a0,-40(s0)
    8000a4a4:	fcb43823          	sd	a1,-48(s0)
    8000a4a8:	fcc43423          	sd	a2,-56(s0)
  acquire(&lrupageslock);
    8000a4ac:	0001c517          	auipc	a0,0x1c
    8000a4b0:	b2450513          	addi	a0,a0,-1244 # 80025fd0 <lrupageslock>
    8000a4b4:	ffff7097          	auipc	ra,0xffff7
    8000a4b8:	e88080e7          	jalr	-376(ra) # 8000133c <acquire>

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
    8000a4bc:	fc843583          	ld	a1,-56(s0)
    8000a4c0:	fd043503          	ld	a0,-48(s0)
    8000a4c4:	00000097          	auipc	ra,0x0
    8000a4c8:	f42080e7          	jalr	-190(ra) # 8000a406 <getpinfo>
    8000a4cc:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a4d0:	fe843783          	ld	a5,-24(s0)
    8000a4d4:	e7a9                	bnez	a5,8000a51e <reglrupage+0x86>
  {
    pinfo = getfirstfreelrupage();
    8000a4d6:	00000097          	auipc	ra,0x0
    8000a4da:	edc080e7          	jalr	-292(ra) # 8000a3b2 <getfirstfreelrupage>
    8000a4de:	fea43423          	sd	a0,-24(s0)
    if(pinfo == 0)
    8000a4e2:	fe843783          	ld	a5,-24(s0)
    8000a4e6:	e38d                	bnez	a5,8000a508 <reglrupage+0x70>
    {
      release(&lrupageslock);
    8000a4e8:	0001c517          	auipc	a0,0x1c
    8000a4ec:	ae850513          	addi	a0,a0,-1304 # 80025fd0 <lrupageslock>
    8000a4f0:	ffff7097          	auipc	ra,0xffff7
    8000a4f4:	eb0080e7          	jalr	-336(ra) # 800013a0 <release>
      panic("reglrupage: no more space in lrupages");
    8000a4f8:	00002517          	auipc	a0,0x2
    8000a4fc:	2c050513          	addi	a0,a0,704 # 8000c7b8 <etext+0x7b8>
    8000a500:	ffff6097          	auipc	ra,0xffff6
    8000a504:	78c080e7          	jalr	1932(ra) # 80000c8c <panic>
    }

    pinfo->va = va;
    8000a508:	fe843783          	ld	a5,-24(s0)
    8000a50c:	fd043703          	ld	a4,-48(s0)
    8000a510:	eb98                	sd	a4,16(a5)
    pinfo->pagetable = pagetable;
    8000a512:	fe843783          	ld	a5,-24(s0)
    8000a516:	fc843703          	ld	a4,-56(s0)
    8000a51a:	ef98                	sd	a4,24(a5)
    8000a51c:	a00d                	j	8000a53e <reglrupage+0xa6>
  }
  else // TODO: Does this ever happen?
  {
    release(&lrupageslock);
    8000a51e:	0001c517          	auipc	a0,0x1c
    8000a522:	ab250513          	addi	a0,a0,-1358 # 80025fd0 <lrupageslock>
    8000a526:	ffff7097          	auipc	ra,0xffff7
    8000a52a:	e7a080e7          	jalr	-390(ra) # 800013a0 <release>
    panic("getpinfo: edge case isreal");
    8000a52e:	00002517          	auipc	a0,0x2
    8000a532:	2b250513          	addi	a0,a0,690 # 8000c7e0 <etext+0x7e0>
    8000a536:	ffff6097          	auipc	ra,0xffff6
    8000a53a:	756080e7          	jalr	1878(ra) # 80000c8c <panic>
  }

  pinfo->refhistory = 0;
    8000a53e:	fe843783          	ld	a5,-24(s0)
    8000a542:	00078023          	sb	zero,0(a5)
  pinfo->pte = pte;
    8000a546:	fe843783          	ld	a5,-24(s0)
    8000a54a:	fd843703          	ld	a4,-40(s0)
    8000a54e:	e798                	sd	a4,8(a5)

  release(&lrupageslock);
    8000a550:	0001c517          	auipc	a0,0x1c
    8000a554:	a8050513          	addi	a0,a0,-1408 # 80025fd0 <lrupageslock>
    8000a558:	ffff7097          	auipc	ra,0xffff7
    8000a55c:	e48080e7          	jalr	-440(ra) # 800013a0 <release>
}
    8000a560:	0001                	nop
    8000a562:	70e2                	ld	ra,56(sp)
    8000a564:	7442                	ld	s0,48(sp)
    8000a566:	6121                	addi	sp,sp,64
    8000a568:	8082                	ret

000000008000a56a <unreglrupage>:

void
unreglrupage(uint64 va, pagetable_t pagetable)
{
    8000a56a:	715d                	addi	sp,sp,-80
    8000a56c:	e486                	sd	ra,72(sp)
    8000a56e:	e0a2                	sd	s0,64(sp)
    8000a570:	0880                	addi	s0,sp,80
    8000a572:	faa43c23          	sd	a0,-72(s0)
    8000a576:	fab43823          	sd	a1,-80(s0)
  acquire(&lrupageslock);
    8000a57a:	0001c517          	auipc	a0,0x1c
    8000a57e:	a5650513          	addi	a0,a0,-1450 # 80025fd0 <lrupageslock>
    8000a582:	ffff7097          	auipc	ra,0xffff7
    8000a586:	dba080e7          	jalr	-582(ra) # 8000133c <acquire>

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
    8000a58a:	fb043583          	ld	a1,-80(s0)
    8000a58e:	fb843503          	ld	a0,-72(s0)
    8000a592:	00000097          	auipc	ra,0x0
    8000a596:	e74080e7          	jalr	-396(ra) # 8000a406 <getpinfo>
    8000a59a:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a59e:	fe843783          	ld	a5,-24(s0)
    8000a5a2:	e38d                	bnez	a5,8000a5c4 <unreglrupage+0x5a>
  {
    release(&lrupageslock);
    8000a5a4:	0001c517          	auipc	a0,0x1c
    8000a5a8:	a2c50513          	addi	a0,a0,-1492 # 80025fd0 <lrupageslock>
    8000a5ac:	ffff7097          	auipc	ra,0xffff7
    8000a5b0:	df4080e7          	jalr	-524(ra) # 800013a0 <release>
    panic("unreglrupage: not mapped");
    8000a5b4:	00002517          	auipc	a0,0x2
    8000a5b8:	24c50513          	addi	a0,a0,588 # 8000c800 <etext+0x800>
    8000a5bc:	ffff6097          	auipc	ra,0xffff6
    8000a5c0:	6d0080e7          	jalr	1744(ra) # 80000c8c <panic>
  }

  *pinfo = (struct lrupinfo){0};
    8000a5c4:	fe843783          	ld	a5,-24(s0)
    8000a5c8:	0007b023          	sd	zero,0(a5)
    8000a5cc:	0007b423          	sd	zero,8(a5)
    8000a5d0:	0007b823          	sd	zero,16(a5)
    8000a5d4:	0007bc23          	sd	zero,24(a5)

  release(&lrupageslock);
    8000a5d8:	0001c517          	auipc	a0,0x1c
    8000a5dc:	9f850513          	addi	a0,a0,-1544 # 80025fd0 <lrupageslock>
    8000a5e0:	ffff7097          	auipc	ra,0xffff7
    8000a5e4:	dc0080e7          	jalr	-576(ra) # 800013a0 <release>
}
    8000a5e8:	0001                	nop
    8000a5ea:	60a6                	ld	ra,72(sp)
    8000a5ec:	6406                	ld	s0,64(sp)
    8000a5ee:	6161                	addi	sp,sp,80
    8000a5f0:	8082                	ret

000000008000a5f2 <updaterefhistory>:

void
updaterefhistory()
{
    8000a5f2:	7179                	addi	sp,sp,-48
    8000a5f4:	f406                	sd	ra,40(sp)
    8000a5f6:	f022                	sd	s0,32(sp)
    8000a5f8:	1800                	addi	s0,sp,48
  acquire(&lrupageslock);
    8000a5fa:	0001c517          	auipc	a0,0x1c
    8000a5fe:	9d650513          	addi	a0,a0,-1578 # 80025fd0 <lrupageslock>
    8000a602:	ffff7097          	auipc	ra,0xffff7
    8000a606:	d3a080e7          	jalr	-710(ra) # 8000133c <acquire>

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a60a:	fe043423          	sd	zero,-24(s0)
    8000a60e:	a065                	j	8000a6b6 <updaterefhistory+0xc4>
  {
    pte_t *pte = lrupages[i].pte;
    8000a610:	0001c717          	auipc	a4,0x1c
    8000a614:	9d870713          	addi	a4,a4,-1576 # 80025fe8 <lrupages>
    8000a618:	fe843783          	ld	a5,-24(s0)
    8000a61c:	0796                	slli	a5,a5,0x5
    8000a61e:	97ba                	add	a5,a5,a4
    8000a620:	679c                	ld	a5,8(a5)
    8000a622:	fef43023          	sd	a5,-32(s0)
    if(pte == 0) continue;
    8000a626:	fe043783          	ld	a5,-32(s0)
    8000a62a:	cfb5                	beqz	a5,8000a6a6 <updaterefhistory+0xb4>
    if(*pte & PTE_ON_DISK) continue;
    8000a62c:	fe043783          	ld	a5,-32(s0)
    8000a630:	639c                	ld	a5,0(a5)
    8000a632:	1007f793          	andi	a5,a5,256
    8000a636:	ebb5                	bnez	a5,8000a6aa <updaterefhistory+0xb8>

    uchar a = ( *pte & PTE_A ) == 0 ? 0 : 1;
    8000a638:	fe043783          	ld	a5,-32(s0)
    8000a63c:	639c                	ld	a5,0(a5)
    8000a63e:	0407f793          	andi	a5,a5,64
    8000a642:	00f037b3          	snez	a5,a5
    8000a646:	0ff7f793          	andi	a5,a5,255
    8000a64a:	fcf40fa3          	sb	a5,-33(s0)
    *pte &= ~PTE_A; // A = 0
    8000a64e:	fe043783          	ld	a5,-32(s0)
    8000a652:	639c                	ld	a5,0(a5)
    8000a654:	fbf7f713          	andi	a4,a5,-65
    8000a658:	fe043783          	ld	a5,-32(s0)
    8000a65c:	e398                	sd	a4,0(a5)

    uchar mask = a << ( sizeof(uchar) * 8 - 1 );
    8000a65e:	fdf44783          	lbu	a5,-33(s0)
    8000a662:	0077979b          	slliw	a5,a5,0x7
    8000a666:	fcf40f23          	sb	a5,-34(s0)
    lrupages[i].refhistory = (lrupages[i].refhistory >> 1) | mask;
    8000a66a:	0001c717          	auipc	a4,0x1c
    8000a66e:	97e70713          	addi	a4,a4,-1666 # 80025fe8 <lrupages>
    8000a672:	fe843783          	ld	a5,-24(s0)
    8000a676:	0796                	slli	a5,a5,0x5
    8000a678:	97ba                	add	a5,a5,a4
    8000a67a:	0007c783          	lbu	a5,0(a5)
    8000a67e:	0017d79b          	srliw	a5,a5,0x1
    8000a682:	0ff7f713          	andi	a4,a5,255
    8000a686:	fde44783          	lbu	a5,-34(s0)
    8000a68a:	8fd9                	or	a5,a5,a4
    8000a68c:	0ff7f713          	andi	a4,a5,255
    8000a690:	0001c697          	auipc	a3,0x1c
    8000a694:	95868693          	addi	a3,a3,-1704 # 80025fe8 <lrupages>
    8000a698:	fe843783          	ld	a5,-24(s0)
    8000a69c:	0796                	slli	a5,a5,0x5
    8000a69e:	97b6                	add	a5,a5,a3
    8000a6a0:	00e78023          	sb	a4,0(a5)
    8000a6a4:	a021                	j	8000a6ac <updaterefhistory+0xba>
    if(pte == 0) continue;
    8000a6a6:	0001                	nop
    8000a6a8:	a011                	j	8000a6ac <updaterefhistory+0xba>
    if(*pte & PTE_ON_DISK) continue;
    8000a6aa:	0001                	nop
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a6ac:	fe843783          	ld	a5,-24(s0)
    8000a6b0:	0785                	addi	a5,a5,1
    8000a6b2:	fef43423          	sd	a5,-24(s0)
    8000a6b6:	fe843703          	ld	a4,-24(s0)
    8000a6ba:	1ff00793          	li	a5,511
    8000a6be:	f4e7f9e3          	bgeu	a5,a4,8000a610 <updaterefhistory+0x1e>
  }

  release(&lrupageslock);
    8000a6c2:	0001c517          	auipc	a0,0x1c
    8000a6c6:	90e50513          	addi	a0,a0,-1778 # 80025fd0 <lrupageslock>
    8000a6ca:	ffff7097          	auipc	ra,0xffff7
    8000a6ce:	cd6080e7          	jalr	-810(ra) # 800013a0 <release>
}
    8000a6d2:	0001                	nop
    8000a6d4:	70a2                	ld	ra,40(sp)
    8000a6d6:	7402                	ld	s0,32(sp)
    8000a6d8:	6145                	addi	sp,sp,48
    8000a6da:	8082                	ret

000000008000a6dc <getvictim>:

struct lrupinfo*
getvictim()
{
    8000a6dc:	7179                	addi	sp,sp,-48
    8000a6de:	f406                	sd	ra,40(sp)
    8000a6e0:	f022                	sd	s0,32(sp)
    8000a6e2:	1800                	addi	s0,sp,48
  uchar minhistory = ~0;
    8000a6e4:	57fd                	li	a5,-1
    8000a6e6:	fef407a3          	sb	a5,-17(s0)
  struct lrupinfo *result = 0;
    8000a6ea:	fe043023          	sd	zero,-32(s0)

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a6ee:	fc043c23          	sd	zero,-40(s0)
    8000a6f2:	a069                	j	8000a77c <getvictim+0xa0>
  {
    pte_t *pte = lrupages[i].pte;
    8000a6f4:	0001c717          	auipc	a4,0x1c
    8000a6f8:	8f470713          	addi	a4,a4,-1804 # 80025fe8 <lrupages>
    8000a6fc:	fd843783          	ld	a5,-40(s0)
    8000a700:	0796                	slli	a5,a5,0x5
    8000a702:	97ba                	add	a5,a5,a4
    8000a704:	679c                	ld	a5,8(a5)
    8000a706:	fcf43823          	sd	a5,-48(s0)
    if(pte == 0) continue;
    8000a70a:	fd043783          	ld	a5,-48(s0)
    8000a70e:	c3ad                	beqz	a5,8000a770 <getvictim+0x94>

    if(ispteready(pte) && lrupages[i].refhistory < minhistory)
    8000a710:	fd043503          	ld	a0,-48(s0)
    8000a714:	00000097          	auipc	ra,0x0
    8000a718:	bee080e7          	jalr	-1042(ra) # 8000a302 <ispteready>
    8000a71c:	87aa                	mv	a5,a0
    8000a71e:	cbb1                	beqz	a5,8000a772 <getvictim+0x96>
    8000a720:	0001c717          	auipc	a4,0x1c
    8000a724:	8c870713          	addi	a4,a4,-1848 # 80025fe8 <lrupages>
    8000a728:	fd843783          	ld	a5,-40(s0)
    8000a72c:	0796                	slli	a5,a5,0x5
    8000a72e:	97ba                	add	a5,a5,a4
    8000a730:	0007c703          	lbu	a4,0(a5)
    8000a734:	fef44783          	lbu	a5,-17(s0)
    8000a738:	0ff7f793          	andi	a5,a5,255
    8000a73c:	02f77b63          	bgeu	a4,a5,8000a772 <getvictim+0x96>
    {
      result = &(lrupages[i]);
    8000a740:	fd843783          	ld	a5,-40(s0)
    8000a744:	00579713          	slli	a4,a5,0x5
    8000a748:	0001c797          	auipc	a5,0x1c
    8000a74c:	8a078793          	addi	a5,a5,-1888 # 80025fe8 <lrupages>
    8000a750:	97ba                	add	a5,a5,a4
    8000a752:	fef43023          	sd	a5,-32(s0)
      minhistory = lrupages[i].refhistory;
    8000a756:	0001c717          	auipc	a4,0x1c
    8000a75a:	89270713          	addi	a4,a4,-1902 # 80025fe8 <lrupages>
    8000a75e:	fd843783          	ld	a5,-40(s0)
    8000a762:	0796                	slli	a5,a5,0x5
    8000a764:	97ba                	add	a5,a5,a4
    8000a766:	0007c783          	lbu	a5,0(a5)
    8000a76a:	fef407a3          	sb	a5,-17(s0)
    8000a76e:	a011                	j	8000a772 <getvictim+0x96>
    if(pte == 0) continue;
    8000a770:	0001                	nop
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a772:	fd843783          	ld	a5,-40(s0)
    8000a776:	0785                	addi	a5,a5,1
    8000a778:	fcf43c23          	sd	a5,-40(s0)
    8000a77c:	fd843703          	ld	a4,-40(s0)
    8000a780:	1ff00793          	li	a5,511
    8000a784:	f6e7f8e3          	bgeu	a5,a4,8000a6f4 <getvictim+0x18>
    }
  }

  return result;
    8000a788:	fe043783          	ld	a5,-32(s0)
}
    8000a78c:	853e                	mv	a0,a5
    8000a78e:	70a2                	ld	ra,40(sp)
    8000a790:	7402                	ld	s0,32(sp)
    8000a792:	6145                	addi	sp,sp,48
    8000a794:	8082                	ret

000000008000a796 <swapout>:

// Returns free page, 0 if there is none
void*
swapout()
{
    8000a796:	7179                	addi	sp,sp,-48
    8000a798:	f406                	sd	ra,40(sp)
    8000a79a:	f022                	sd	s0,32(sp)
    8000a79c:	1800                	addi	s0,sp,48
  acquire(&lrupageslock);
    8000a79e:	0001c517          	auipc	a0,0x1c
    8000a7a2:	83250513          	addi	a0,a0,-1998 # 80025fd0 <lrupageslock>
    8000a7a6:	ffff7097          	auipc	ra,0xffff7
    8000a7aa:	b96080e7          	jalr	-1130(ra) # 8000133c <acquire>

  struct lrupinfo *pinfo = getvictim();
    8000a7ae:	00000097          	auipc	ra,0x0
    8000a7b2:	f2e080e7          	jalr	-210(ra) # 8000a6dc <getvictim>
    8000a7b6:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a7ba:	fe843783          	ld	a5,-24(s0)
    8000a7be:	eb89                	bnez	a5,8000a7d0 <swapout+0x3a>
    panic("swapout: no victim!");
    8000a7c0:	00002517          	auipc	a0,0x2
    8000a7c4:	06050513          	addi	a0,a0,96 # 8000c820 <etext+0x820>
    8000a7c8:	ffff6097          	auipc	ra,0xffff6
    8000a7cc:	4c4080e7          	jalr	1220(ra) # 80000c8c <panic>

  pte_t *pte = pinfo->pte;
    8000a7d0:	fe843783          	ld	a5,-24(s0)
    8000a7d4:	679c                	ld	a5,8(a5)
    8000a7d6:	fef43023          	sd	a5,-32(s0)
  uchar *data = (uchar*)getpaddress(pte);
    8000a7da:	fe043503          	ld	a0,-32(s0)
    8000a7de:	00000097          	auipc	ra,0x0
    8000a7e2:	aa8080e7          	jalr	-1368(ra) # 8000a286 <getpaddress>
    8000a7e6:	87aa                	mv	a5,a0
    8000a7e8:	fcf43c23          	sd	a5,-40(s0)
  *pte |= PTE_PENDING_DISK_OPERATION; // PTE_PENDING_DISK_OPERATION = 1
    8000a7ec:	fe043783          	ld	a5,-32(s0)
    8000a7f0:	639c                	ld	a5,0(a5)
    8000a7f2:	2007e713          	ori	a4,a5,512
    8000a7f6:	fe043783          	ld	a5,-32(s0)
    8000a7fa:	e398                	sd	a4,0(a5)
  release(&lrupageslock);
    8000a7fc:	0001b517          	auipc	a0,0x1b
    8000a800:	7d450513          	addi	a0,a0,2004 # 80025fd0 <lrupageslock>
    8000a804:	ffff7097          	auipc	ra,0xffff7
    8000a808:	b9c080e7          	jalr	-1124(ra) # 800013a0 <release>

  int diskpageno = write_page_to_disk(data);
    8000a80c:	fd843503          	ld	a0,-40(s0)
    8000a810:	fffff097          	auipc	ra,0xfffff
    8000a814:	750080e7          	jalr	1872(ra) # 80009f60 <write_page_to_disk>
    8000a818:	87aa                	mv	a5,a0
    8000a81a:	fcf42a23          	sw	a5,-44(s0)
  if(diskpageno < 0)
    8000a81e:	fd442783          	lw	a5,-44(s0)
    8000a822:	2781                	sext.w	a5,a5
    8000a824:	0007d463          	bgez	a5,8000a82c <swapout+0x96>
    return 0;
    8000a828:	4781                	li	a5,0
    8000a82a:	a8a5                	j	8000a8a2 <swapout+0x10c>

  acquire(&lrupageslock);
    8000a82c:	0001b517          	auipc	a0,0x1b
    8000a830:	7a450513          	addi	a0,a0,1956 # 80025fd0 <lrupageslock>
    8000a834:	ffff7097          	auipc	ra,0xffff7
    8000a838:	b08080e7          	jalr	-1272(ra) # 8000133c <acquire>

  setpaddress(pte, (uint64)diskpageno);
    8000a83c:	fd442783          	lw	a5,-44(s0)
    8000a840:	85be                	mv	a1,a5
    8000a842:	fe043503          	ld	a0,-32(s0)
    8000a846:	00000097          	auipc	ra,0x0
    8000a84a:	a74080e7          	jalr	-1420(ra) # 8000a2ba <setpaddress>
  *pte &= ~PTE_V; // V = 0
    8000a84e:	fe043783          	ld	a5,-32(s0)
    8000a852:	639c                	ld	a5,0(a5)
    8000a854:	ffe7f713          	andi	a4,a5,-2
    8000a858:	fe043783          	ld	a5,-32(s0)
    8000a85c:	e398                	sd	a4,0(a5)
  *pte |= PTE_ON_DISK; // ON_DISK = 1
    8000a85e:	fe043783          	ld	a5,-32(s0)
    8000a862:	639c                	ld	a5,0(a5)
    8000a864:	1007e713          	ori	a4,a5,256
    8000a868:	fe043783          	ld	a5,-32(s0)
    8000a86c:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_PENDING_DISK_OPERATION; // PTE_PENDING_DISK_OPERATION = 0
    8000a86e:	fe043783          	ld	a5,-32(s0)
    8000a872:	639c                	ld	a5,0(a5)
    8000a874:	dff7f713          	andi	a4,a5,-513
    8000a878:	fe043783          	ld	a5,-32(s0)
    8000a87c:	e398                	sd	a4,0(a5)
  pinfo->refhistory = 0;
    8000a87e:	fe843783          	ld	a5,-24(s0)
    8000a882:	00078023          	sb	zero,0(a5)
  sfence_vma(); // Flush TLB
    8000a886:	00000097          	auipc	ra,0x0
    8000a88a:	9ee080e7          	jalr	-1554(ra) # 8000a274 <sfence_vma>

  release(&lrupageslock);
    8000a88e:	0001b517          	auipc	a0,0x1b
    8000a892:	74250513          	addi	a0,a0,1858 # 80025fd0 <lrupageslock>
    8000a896:	ffff7097          	auipc	ra,0xffff7
    8000a89a:	b0a080e7          	jalr	-1270(ra) # 800013a0 <release>
  return (void*)data;
    8000a89e:	fd843783          	ld	a5,-40(s0)
}
    8000a8a2:	853e                	mv	a0,a5
    8000a8a4:	70a2                	ld	ra,40(sp)
    8000a8a6:	7402                	ld	s0,32(sp)
    8000a8a8:	6145                	addi	sp,sp,48
    8000a8aa:	8082                	ret

000000008000a8ac <swapin>:

int
swapin(uint64 va, pagetable_t pagetable)
{
    8000a8ac:	7139                	addi	sp,sp,-64
    8000a8ae:	fc06                	sd	ra,56(sp)
    8000a8b0:	f822                	sd	s0,48(sp)
    8000a8b2:	0080                	addi	s0,sp,64
    8000a8b4:	fca43423          	sd	a0,-56(s0)
    8000a8b8:	fcb43023          	sd	a1,-64(s0)
  acquire(&lrupageslock);
    8000a8bc:	0001b517          	auipc	a0,0x1b
    8000a8c0:	71450513          	addi	a0,a0,1812 # 80025fd0 <lrupageslock>
    8000a8c4:	ffff7097          	auipc	ra,0xffff7
    8000a8c8:	a78080e7          	jalr	-1416(ra) # 8000133c <acquire>

  pte_t *pte = getpinfo(va, pagetable)->pte;
    8000a8cc:	fc043583          	ld	a1,-64(s0)
    8000a8d0:	fc843503          	ld	a0,-56(s0)
    8000a8d4:	00000097          	auipc	ra,0x0
    8000a8d8:	b32080e7          	jalr	-1230(ra) # 8000a406 <getpinfo>
    8000a8dc:	87aa                	mv	a5,a0
    8000a8de:	679c                	ld	a5,8(a5)
    8000a8e0:	fef43423          	sd	a5,-24(s0)
  if((*pte & PTE_ON_DISK) == 0)
    8000a8e4:	fe843783          	ld	a5,-24(s0)
    8000a8e8:	639c                	ld	a5,0(a5)
    8000a8ea:	1007f793          	andi	a5,a5,256
    8000a8ee:	e399                	bnez	a5,8000a8f4 <swapin+0x48>
    return 0;
    8000a8f0:	4781                	li	a5,0
    8000a8f2:	a0e1                	j	8000a9ba <swapin+0x10e>
  *pte |= PTE_PENDING_DISK_OPERATION; // PENDING_DISK_OPERATION = 1
    8000a8f4:	fe843783          	ld	a5,-24(s0)
    8000a8f8:	639c                	ld	a5,0(a5)
    8000a8fa:	2007e713          	ori	a4,a5,512
    8000a8fe:	fe843783          	ld	a5,-24(s0)
    8000a902:	e398                	sd	a4,0(a5)

  release(&lrupageslock);
    8000a904:	0001b517          	auipc	a0,0x1b
    8000a908:	6cc50513          	addi	a0,a0,1740 # 80025fd0 <lrupageslock>
    8000a90c:	ffff7097          	auipc	ra,0xffff7
    8000a910:	a94080e7          	jalr	-1388(ra) # 800013a0 <release>

  uchar *rampage = kalloc();
    8000a914:	ffff7097          	auipc	ra,0xffff7
    8000a918:	8c2080e7          	jalr	-1854(ra) # 800011d6 <kalloc>
    8000a91c:	fea43023          	sd	a0,-32(s0)
  if(rampage == 0)
    8000a920:	fe043783          	ld	a5,-32(s0)
    8000a924:	e399                	bnez	a5,8000a92a <swapin+0x7e>
    return 0;
    8000a926:	4781                	li	a5,0
    8000a928:	a849                	j	8000a9ba <swapin+0x10e>

  int diskpageno = (int) getpaddress(pte);
    8000a92a:	fe843503          	ld	a0,-24(s0)
    8000a92e:	00000097          	auipc	ra,0x0
    8000a932:	958080e7          	jalr	-1704(ra) # 8000a286 <getpaddress>
    8000a936:	87aa                	mv	a5,a0
    8000a938:	fcf42e23          	sw	a5,-36(s0)
  take_page_from_disk(diskpageno, rampage);
    8000a93c:	fdc42783          	lw	a5,-36(s0)
    8000a940:	fe043583          	ld	a1,-32(s0)
    8000a944:	853e                	mv	a0,a5
    8000a946:	fffff097          	auipc	ra,0xfffff
    8000a94a:	6a8080e7          	jalr	1704(ra) # 80009fee <take_page_from_disk>

  acquire(&lrupageslock);
    8000a94e:	0001b517          	auipc	a0,0x1b
    8000a952:	68250513          	addi	a0,a0,1666 # 80025fd0 <lrupageslock>
    8000a956:	ffff7097          	auipc	ra,0xffff7
    8000a95a:	9e6080e7          	jalr	-1562(ra) # 8000133c <acquire>

  setpaddress(pte, (uint64)rampage);
    8000a95e:	fe043783          	ld	a5,-32(s0)
    8000a962:	85be                	mv	a1,a5
    8000a964:	fe843503          	ld	a0,-24(s0)
    8000a968:	00000097          	auipc	ra,0x0
    8000a96c:	952080e7          	jalr	-1710(ra) # 8000a2ba <setpaddress>
  *pte |= PTE_V; // V = 1
    8000a970:	fe843783          	ld	a5,-24(s0)
    8000a974:	639c                	ld	a5,0(a5)
    8000a976:	0017e713          	ori	a4,a5,1
    8000a97a:	fe843783          	ld	a5,-24(s0)
    8000a97e:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_ON_DISK; // ON_DISK = 0
    8000a980:	fe843783          	ld	a5,-24(s0)
    8000a984:	639c                	ld	a5,0(a5)
    8000a986:	eff7f713          	andi	a4,a5,-257
    8000a98a:	fe843783          	ld	a5,-24(s0)
    8000a98e:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_PENDING_DISK_OPERATION; // PENDING_DISK_OPERATION = 0
    8000a990:	fe843783          	ld	a5,-24(s0)
    8000a994:	639c                	ld	a5,0(a5)
    8000a996:	dff7f713          	andi	a4,a5,-513
    8000a99a:	fe843783          	ld	a5,-24(s0)
    8000a99e:	e398                	sd	a4,0(a5)
  sfence_vma(); // Flush TLB
    8000a9a0:	00000097          	auipc	ra,0x0
    8000a9a4:	8d4080e7          	jalr	-1836(ra) # 8000a274 <sfence_vma>

  release(&lrupageslock);
    8000a9a8:	0001b517          	auipc	a0,0x1b
    8000a9ac:	62850513          	addi	a0,a0,1576 # 80025fd0 <lrupageslock>
    8000a9b0:	ffff7097          	auipc	ra,0xffff7
    8000a9b4:	9f0080e7          	jalr	-1552(ra) # 800013a0 <release>
  return 1;
    8000a9b8:	4785                	li	a5,1
    8000a9ba:	853e                	mv	a0,a5
    8000a9bc:	70e2                	ld	ra,56(sp)
    8000a9be:	7442                	ld	s0,48(sp)
    8000a9c0:	6121                	addi	sp,sp,64
    8000a9c2:	8082                	ret
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
