
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
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ff98637>
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
    80000326:	00008797          	auipc	a5,0x8
    8000032a:	7aa78793          	addi	a5,a5,1962 # 80008ad0 <timervec>
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
    80000408:	498080e7          	jalr	1176(ra) # 8000389c <either_copyin>
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
    8000048a:	592080e7          	jalr	1426(ra) # 80002a18 <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	356080e7          	jalr	854(ra) # 800037e8 <killed>
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
    800004c6:	118080e7          	jalr	280(ra) # 800035da <sleep>
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
    80000582:	2aa080e7          	jalr	682(ra) # 80003828 <either_copyout>
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
    8000066c:	2a8080e7          	jalr	680(ra) # 80003910 <procdump>
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
    80000836:	e24080e7          	jalr	-476(ra) # 80003656 <wakeup>
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
    80000e7c:	762080e7          	jalr	1890(ra) # 800035da <sleep>
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
    80000fd4:	686080e7          	jalr	1670(ra) # 80003656 <wakeup>
    
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
    800010b6:	08100793          	li	a5,129
    800010ba:	01879593          	slli	a1,a5,0x18
    800010be:	00065517          	auipc	a0,0x65
    800010c2:	10a50513          	addi	a0,a0,266 # 800661c8 <end>
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
    8000114c:	00065797          	auipc	a5,0x65
    80001150:	07c78793          	addi	a5,a5,124 # 800661c8 <end>
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
    8000122c:	456080e7          	jalr	1110(ra) # 8000a67e <swapout>
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
    8000138a:	658080e7          	jalr	1624(ra) # 800029de <mycpu>
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
    80001416:	5cc080e7          	jalr	1484(ra) # 800029de <mycpu>
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
    8000145c:	586080e7          	jalr	1414(ra) # 800029de <mycpu>
    80001460:	87aa                	mv	a5,a0
    80001462:	5fbc                	lw	a5,120(a5)
    80001464:	eb89                	bnez	a5,80001476 <push_off+0x3c>
    mycpu()->intena = old;
    80001466:	00001097          	auipc	ra,0x1
    8000146a:	578080e7          	jalr	1400(ra) # 800029de <mycpu>
    8000146e:	872a                	mv	a4,a0
    80001470:	fec42783          	lw	a5,-20(s0)
    80001474:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    80001476:	00001097          	auipc	ra,0x1
    8000147a:	568080e7          	jalr	1384(ra) # 800029de <mycpu>
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
    8000149e:	544080e7          	jalr	1348(ra) # 800029de <mycpu>
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
    800018d0:	0ee080e7          	jalr	238(ra) # 800029ba <cpuid>
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
    80001934:	fbc080e7          	jalr	-68(ra) # 800028ec <procinit>
    trapinit();      // trap vectors
    80001938:	00002097          	auipc	ra,0x2
    8000193c:	2c0080e7          	jalr	704(ra) # 80003bf8 <trapinit>
    trapinithart();  // install kernel trap vector
    80001940:	00002097          	auipc	ra,0x2
    80001944:	2e2080e7          	jalr	738(ra) # 80003c22 <trapinithart>
    plicinit();      // set up interrupt controller
    80001948:	00007097          	auipc	ra,0x7
    8000194c:	1b2080e7          	jalr	434(ra) # 80008afa <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001950:	00007097          	auipc	ra,0x7
    80001954:	1d8080e7          	jalr	472(ra) # 80008b28 <plicinithart>
    binit();         // buffer cache
    80001958:	00003097          	auipc	ra,0x3
    8000195c:	d48080e7          	jalr	-696(ra) # 800046a0 <binit>
    iinit();         // inode table
    80001960:	00003097          	auipc	ra,0x3
    80001964:	59e080e7          	jalr	1438(ra) # 80004efe <iinit>
    fileinit();      // file table
    80001968:	00005097          	auipc	ra,0x5
    8000196c:	f72080e7          	jalr	-142(ra) # 800068da <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    80001970:	0000a597          	auipc	a1,0xa
    80001974:	73058593          	addi	a1,a1,1840 # 8000c0a0 <etext+0xa0>
    80001978:	4501                	li	a0,0
    8000197a:	00007097          	auipc	ra,0x7
    8000197e:	4a6080e7          	jalr	1190(ra) # 80008e20 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    80001982:	0000a597          	auipc	a1,0xa
    80001986:	72e58593          	addi	a1,a1,1838 # 8000c0b0 <etext+0xb0>
    8000198a:	4505                	li	a0,1
    8000198c:	00007097          	auipc	ra,0x7
    80001990:	494080e7          	jalr	1172(ra) # 80008e20 <virtio_disk_init>

    userinit();      // first user process
    80001994:	00001097          	auipc	ra,0x1
    80001998:	404080e7          	jalr	1028(ra) # 80002d98 <userinit>
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
    800019c6:	ff8080e7          	jalr	-8(ra) # 800029ba <cpuid>
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
    800019ea:	23c080e7          	jalr	572(ra) # 80003c22 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    800019ee:	00007097          	auipc	ra,0x7
    800019f2:	13a080e7          	jalr	314(ra) # 80008b28 <plicinithart>
  }

  scheduler();        
    800019f6:	00002097          	auipc	ra,0x2
    800019fa:	9b8080e7          	jalr	-1608(ra) # 800033ae <scheduler>

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
    80001a62:	308080e7          	jalr	776(ra) # 80001d66 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001a66:	4719                	li	a4,6
    80001a68:	6685                	lui	a3,0x1
    80001a6a:	10001637          	lui	a2,0x10001
    80001a6e:	100015b7          	lui	a1,0x10001
    80001a72:	fe843503          	ld	a0,-24(s0)
    80001a76:	00000097          	auipc	ra,0x0
    80001a7a:	2f0080e7          	jalr	752(ra) # 80001d66 <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001a7e:	4719                	li	a4,6
    80001a80:	6685                	lui	a3,0x1
    80001a82:	10002637          	lui	a2,0x10002
    80001a86:	100025b7          	lui	a1,0x10002
    80001a8a:	fe843503          	ld	a0,-24(s0)
    80001a8e:	00000097          	auipc	ra,0x0
    80001a92:	2d8080e7          	jalr	728(ra) # 80001d66 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001a96:	4719                	li	a4,6
    80001a98:	004006b7          	lui	a3,0x400
    80001a9c:	0c000637          	lui	a2,0xc000
    80001aa0:	0c0005b7          	lui	a1,0xc000
    80001aa4:	fe843503          	ld	a0,-24(s0)
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	2be080e7          	jalr	702(ra) # 80001d66 <kvmmap>

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
    80001ad6:	294080e7          	jalr	660(ra) # 80001d66 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001ada:	0000a597          	auipc	a1,0xa
    80001ade:	52658593          	addi	a1,a1,1318 # 8000c000 <etext>
    80001ae2:	0000a617          	auipc	a2,0xa
    80001ae6:	51e60613          	addi	a2,a2,1310 # 8000c000 <etext>
    80001aea:	0000a797          	auipc	a5,0xa
    80001aee:	51678793          	addi	a5,a5,1302 # 8000c000 <etext>
    80001af2:	08100713          	li	a4,129
    80001af6:	0762                	slli	a4,a4,0x18
    80001af8:	40f707b3          	sub	a5,a4,a5
    80001afc:	4719                	li	a4,6
    80001afe:	86be                	mv	a3,a5
    80001b00:	fe843503          	ld	a0,-24(s0)
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	262080e7          	jalr	610(ra) # 80001d66 <kvmmap>

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
    80001b2c:	23e080e7          	jalr	574(ra) # 80001d66 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001b30:	fe843503          	ld	a0,-24(s0)
    80001b34:	00001097          	auipc	ra,0x1
    80001b38:	cfc080e7          	jalr	-772(ra) # 80002830 <proc_mapstacks>
  
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
    80001b6a:	976080e7          	jalr	-1674(ra) # 8000a4dc <updaterefhistory>
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
    80001bdc:	a0cd                	j	80001cbe <walk+0x106>

  for(int level = 2; level > 0; level--) {
    80001bde:	4789                	li	a5,2
    80001be0:	fef42623          	sw	a5,-20(s0)
    80001be4:	a87d                	j	80001ca2 <walk+0xea>
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
    80001c2a:	a0bd                	j	80001c98 <walk+0xe0>
    }
    else if(*pte & PTE_ON_DISK) {
    80001c2c:	fe043783          	ld	a5,-32(s0)
    80001c30:	639c                	ld	a5,0(a5)
    80001c32:	1007f793          	andi	a5,a5,256
    80001c36:	c38d                	beqz	a5,80001c58 <walk+0xa0>
      swapin(va, pagetable);
    80001c38:	fd843583          	ld	a1,-40(s0)
    80001c3c:	fd043503          	ld	a0,-48(s0)
    80001c40:	00009097          	auipc	ra,0x9
    80001c44:	b54080e7          	jalr	-1196(ra) # 8000a794 <swapin>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001c48:	fe043783          	ld	a5,-32(s0)
    80001c4c:	639c                	ld	a5,0(a5)
    80001c4e:	83a9                	srli	a5,a5,0xa
    80001c50:	07b2                	slli	a5,a5,0xc
    80001c52:	fcf43c23          	sd	a5,-40(s0)
    80001c56:	a089                	j	80001c98 <walk+0xe0>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001c58:	fcc42783          	lw	a5,-52(s0)
    80001c5c:	2781                	sext.w	a5,a5
    80001c5e:	cb91                	beqz	a5,80001c72 <walk+0xba>
    80001c60:	fffff097          	auipc	ra,0xfffff
    80001c64:	576080e7          	jalr	1398(ra) # 800011d6 <kalloc>
    80001c68:	fca43c23          	sd	a0,-40(s0)
    80001c6c:	fd843783          	ld	a5,-40(s0)
    80001c70:	e399                	bnez	a5,80001c76 <walk+0xbe>
        return 0;
    80001c72:	4781                	li	a5,0
    80001c74:	a0a9                	j	80001cbe <walk+0x106>
      memset(pagetable, 0, PGSIZE);
    80001c76:	6605                	lui	a2,0x1
    80001c78:	4581                	li	a1,0
    80001c7a:	fd843503          	ld	a0,-40(s0)
    80001c7e:	00000097          	auipc	ra,0x0
    80001c82:	892080e7          	jalr	-1902(ra) # 80001510 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001c86:	fd843783          	ld	a5,-40(s0)
    80001c8a:	83b1                	srli	a5,a5,0xc
    80001c8c:	07aa                	slli	a5,a5,0xa
    80001c8e:	0017e713          	ori	a4,a5,1
    80001c92:	fe043783          	ld	a5,-32(s0)
    80001c96:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001c98:	fec42783          	lw	a5,-20(s0)
    80001c9c:	37fd                	addiw	a5,a5,-1
    80001c9e:	fef42623          	sw	a5,-20(s0)
    80001ca2:	fec42783          	lw	a5,-20(s0)
    80001ca6:	2781                	sext.w	a5,a5
    80001ca8:	f2f04fe3          	bgtz	a5,80001be6 <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    80001cac:	fd043783          	ld	a5,-48(s0)
    80001cb0:	83b1                	srli	a5,a5,0xc
    80001cb2:	1ff7f793          	andi	a5,a5,511
    80001cb6:	078e                	slli	a5,a5,0x3
    80001cb8:	fd843703          	ld	a4,-40(s0)
    80001cbc:	97ba                	add	a5,a5,a4
}
    80001cbe:	853e                	mv	a0,a5
    80001cc0:	70e2                	ld	ra,56(sp)
    80001cc2:	7442                	ld	s0,48(sp)
    80001cc4:	6121                	addi	sp,sp,64
    80001cc6:	8082                	ret

0000000080001cc8 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001cc8:	7179                	addi	sp,sp,-48
    80001cca:	f406                	sd	ra,40(sp)
    80001ccc:	f022                	sd	s0,32(sp)
    80001cce:	1800                	addi	s0,sp,48
    80001cd0:	fca43c23          	sd	a0,-40(s0)
    80001cd4:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001cd8:	fd043703          	ld	a4,-48(s0)
    80001cdc:	57fd                	li	a5,-1
    80001cde:	83e9                	srli	a5,a5,0x1a
    80001ce0:	00e7f463          	bgeu	a5,a4,80001ce8 <walkaddr+0x20>
    return 0;
    80001ce4:	4781                	li	a5,0
    80001ce6:	a89d                	j	80001d5c <walkaddr+0x94>

  pte = walk(pagetable, va, 0);
    80001ce8:	4601                	li	a2,0
    80001cea:	fd043583          	ld	a1,-48(s0)
    80001cee:	fd843503          	ld	a0,-40(s0)
    80001cf2:	00000097          	auipc	ra,0x0
    80001cf6:	ec6080e7          	jalr	-314(ra) # 80001bb8 <walk>
    80001cfa:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001cfe:	fe843783          	ld	a5,-24(s0)
    80001d02:	e399                	bnez	a5,80001d08 <walkaddr+0x40>
    return 0;
    80001d04:	4781                	li	a5,0
    80001d06:	a899                	j	80001d5c <walkaddr+0x94>
  if((*pte & PTE_V) == 0 && (*pte & PTE_ON_DISK) != 0)
    80001d08:	fe843783          	ld	a5,-24(s0)
    80001d0c:	639c                	ld	a5,0(a5)
    80001d0e:	8b85                	andi	a5,a5,1
    80001d10:	ef99                	bnez	a5,80001d2e <walkaddr+0x66>
    80001d12:	fe843783          	ld	a5,-24(s0)
    80001d16:	639c                	ld	a5,0(a5)
    80001d18:	1007f793          	andi	a5,a5,256
    80001d1c:	cb89                	beqz	a5,80001d2e <walkaddr+0x66>
    swapin(va, pagetable);
    80001d1e:	fd843583          	ld	a1,-40(s0)
    80001d22:	fd043503          	ld	a0,-48(s0)
    80001d26:	00009097          	auipc	ra,0x9
    80001d2a:	a6e080e7          	jalr	-1426(ra) # 8000a794 <swapin>
  if((*pte & PTE_V) == 0)
    80001d2e:	fe843783          	ld	a5,-24(s0)
    80001d32:	639c                	ld	a5,0(a5)
    80001d34:	8b85                	andi	a5,a5,1
    80001d36:	e399                	bnez	a5,80001d3c <walkaddr+0x74>
    return 0;
    80001d38:	4781                	li	a5,0
    80001d3a:	a00d                	j	80001d5c <walkaddr+0x94>
  if((*pte & PTE_U) == 0)
    80001d3c:	fe843783          	ld	a5,-24(s0)
    80001d40:	639c                	ld	a5,0(a5)
    80001d42:	8bc1                	andi	a5,a5,16
    80001d44:	e399                	bnez	a5,80001d4a <walkaddr+0x82>
    return 0;
    80001d46:	4781                	li	a5,0
    80001d48:	a811                	j	80001d5c <walkaddr+0x94>

  pa = PTE2PA(*pte);
    80001d4a:	fe843783          	ld	a5,-24(s0)
    80001d4e:	639c                	ld	a5,0(a5)
    80001d50:	83a9                	srli	a5,a5,0xa
    80001d52:	07b2                	slli	a5,a5,0xc
    80001d54:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001d58:	fe043783          	ld	a5,-32(s0)
}
    80001d5c:	853e                	mv	a0,a5
    80001d5e:	70a2                	ld	ra,40(sp)
    80001d60:	7402                	ld	s0,32(sp)
    80001d62:	6145                	addi	sp,sp,48
    80001d64:	8082                	ret

0000000080001d66 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001d66:	7139                	addi	sp,sp,-64
    80001d68:	fc06                	sd	ra,56(sp)
    80001d6a:	f822                	sd	s0,48(sp)
    80001d6c:	0080                	addi	s0,sp,64
    80001d6e:	fea43423          	sd	a0,-24(s0)
    80001d72:	feb43023          	sd	a1,-32(s0)
    80001d76:	fcc43c23          	sd	a2,-40(s0)
    80001d7a:	fcd43823          	sd	a3,-48(s0)
    80001d7e:	87ba                	mv	a5,a4
    80001d80:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001d84:	fcc42783          	lw	a5,-52(s0)
    80001d88:	873e                	mv	a4,a5
    80001d8a:	fd843683          	ld	a3,-40(s0)
    80001d8e:	fd043603          	ld	a2,-48(s0)
    80001d92:	fe043583          	ld	a1,-32(s0)
    80001d96:	fe843503          	ld	a0,-24(s0)
    80001d9a:	00000097          	auipc	ra,0x0
    80001d9e:	026080e7          	jalr	38(ra) # 80001dc0 <mappages>
    80001da2:	87aa                	mv	a5,a0
    80001da4:	cb89                	beqz	a5,80001db6 <kvmmap+0x50>
    panic("kvmmap");
    80001da6:	0000a517          	auipc	a0,0xa
    80001daa:	33250513          	addi	a0,a0,818 # 8000c0d8 <etext+0xd8>
    80001dae:	fffff097          	auipc	ra,0xfffff
    80001db2:	ede080e7          	jalr	-290(ra) # 80000c8c <panic>
}
    80001db6:	0001                	nop
    80001db8:	70e2                	ld	ra,56(sp)
    80001dba:	7442                	ld	s0,48(sp)
    80001dbc:	6121                	addi	sp,sp,64
    80001dbe:	8082                	ret

0000000080001dc0 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001dc0:	711d                	addi	sp,sp,-96
    80001dc2:	ec86                	sd	ra,88(sp)
    80001dc4:	e8a2                	sd	s0,80(sp)
    80001dc6:	1080                	addi	s0,sp,96
    80001dc8:	fca43423          	sd	a0,-56(s0)
    80001dcc:	fcb43023          	sd	a1,-64(s0)
    80001dd0:	fac43c23          	sd	a2,-72(s0)
    80001dd4:	fad43823          	sd	a3,-80(s0)
    80001dd8:	87ba                	mv	a5,a4
    80001dda:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001dde:	fb843783          	ld	a5,-72(s0)
    80001de2:	eb89                	bnez	a5,80001df4 <mappages+0x34>
    panic("mappages: size");
    80001de4:	0000a517          	auipc	a0,0xa
    80001de8:	2fc50513          	addi	a0,a0,764 # 8000c0e0 <etext+0xe0>
    80001dec:	fffff097          	auipc	ra,0xfffff
    80001df0:	ea0080e7          	jalr	-352(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    80001df4:	fc043703          	ld	a4,-64(s0)
    80001df8:	77fd                	lui	a5,0xfffff
    80001dfa:	8ff9                	and	a5,a5,a4
    80001dfc:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001e00:	fc043703          	ld	a4,-64(s0)
    80001e04:	fb843783          	ld	a5,-72(s0)
    80001e08:	97ba                	add	a5,a5,a4
    80001e0a:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ff98e37>
    80001e0e:	77fd                	lui	a5,0xfffff
    80001e10:	8ff9                	and	a5,a5,a4
    80001e12:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001e16:	4605                	li	a2,1
    80001e18:	fe843583          	ld	a1,-24(s0)
    80001e1c:	fc843503          	ld	a0,-56(s0)
    80001e20:	00000097          	auipc	ra,0x0
    80001e24:	d98080e7          	jalr	-616(ra) # 80001bb8 <walk>
    80001e28:	fca43c23          	sd	a0,-40(s0)
    80001e2c:	fd843783          	ld	a5,-40(s0)
    80001e30:	e399                	bnez	a5,80001e36 <mappages+0x76>
      return -1;
    80001e32:	57fd                	li	a5,-1
    80001e34:	a069                	j	80001ebe <mappages+0xfe>
    if(*pte & PTE_V || *pte & PTE_ON_DISK)
    80001e36:	fd843783          	ld	a5,-40(s0)
    80001e3a:	639c                	ld	a5,0(a5)
    80001e3c:	8b85                	andi	a5,a5,1
    80001e3e:	e799                	bnez	a5,80001e4c <mappages+0x8c>
    80001e40:	fd843783          	ld	a5,-40(s0)
    80001e44:	639c                	ld	a5,0(a5)
    80001e46:	1007f793          	andi	a5,a5,256
    80001e4a:	cb89                	beqz	a5,80001e5c <mappages+0x9c>
      panic("mappages: remap");
    80001e4c:	0000a517          	auipc	a0,0xa
    80001e50:	2a450513          	addi	a0,a0,676 # 8000c0f0 <etext+0xf0>
    80001e54:	fffff097          	auipc	ra,0xfffff
    80001e58:	e38080e7          	jalr	-456(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001e5c:	fb043783          	ld	a5,-80(s0)
    80001e60:	83b1                	srli	a5,a5,0xc
    80001e62:	00a79713          	slli	a4,a5,0xa
    80001e66:	fac42783          	lw	a5,-84(s0)
    80001e6a:	8fd9                	or	a5,a5,a4
    80001e6c:	0017e713          	ori	a4,a5,1
    80001e70:	fd843783          	ld	a5,-40(s0)
    80001e74:	e398                	sd	a4,0(a5)
    if(*pte & PTE_U)
    80001e76:	fd843783          	ld	a5,-40(s0)
    80001e7a:	639c                	ld	a5,0(a5)
    80001e7c:	8bc1                	andi	a5,a5,16
    80001e7e:	cb99                	beqz	a5,80001e94 <mappages+0xd4>
      reglrupage(pte, a, pagetable);
    80001e80:	fc843603          	ld	a2,-56(s0)
    80001e84:	fe843583          	ld	a1,-24(s0)
    80001e88:	fd843503          	ld	a0,-40(s0)
    80001e8c:	00008097          	auipc	ra,0x8
    80001e90:	4f6080e7          	jalr	1270(ra) # 8000a382 <reglrupage>
    if(a == last)
    80001e94:	fe843703          	ld	a4,-24(s0)
    80001e98:	fe043783          	ld	a5,-32(s0)
    80001e9c:	00f70f63          	beq	a4,a5,80001eba <mappages+0xfa>
      break;
    a += PGSIZE;
    80001ea0:	fe843703          	ld	a4,-24(s0)
    80001ea4:	6785                	lui	a5,0x1
    80001ea6:	97ba                	add	a5,a5,a4
    80001ea8:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001eac:	fb043703          	ld	a4,-80(s0)
    80001eb0:	6785                	lui	a5,0x1
    80001eb2:	97ba                	add	a5,a5,a4
    80001eb4:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001eb8:	bfb9                	j	80001e16 <mappages+0x56>
      break;
    80001eba:	0001                	nop
  }
  return 0;
    80001ebc:	4781                	li	a5,0
}
    80001ebe:	853e                	mv	a0,a5
    80001ec0:	60e6                	ld	ra,88(sp)
    80001ec2:	6446                	ld	s0,80(sp)
    80001ec4:	6125                	addi	sp,sp,96
    80001ec6:	8082                	ret

0000000080001ec8 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001ec8:	715d                	addi	sp,sp,-80
    80001eca:	e486                	sd	ra,72(sp)
    80001ecc:	e0a2                	sd	s0,64(sp)
    80001ece:	0880                	addi	s0,sp,80
    80001ed0:	fca43423          	sd	a0,-56(s0)
    80001ed4:	fcb43023          	sd	a1,-64(s0)
    80001ed8:	fac43c23          	sd	a2,-72(s0)
    80001edc:	87b6                	mv	a5,a3
    80001ede:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001ee2:	fc043703          	ld	a4,-64(s0)
    80001ee6:	6785                	lui	a5,0x1
    80001ee8:	17fd                	addi	a5,a5,-1
    80001eea:	8ff9                	and	a5,a5,a4
    80001eec:	cb89                	beqz	a5,80001efe <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001eee:	0000a517          	auipc	a0,0xa
    80001ef2:	21250513          	addi	a0,a0,530 # 8000c100 <etext+0x100>
    80001ef6:	fffff097          	auipc	ra,0xfffff
    80001efa:	d96080e7          	jalr	-618(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001efe:	fc043783          	ld	a5,-64(s0)
    80001f02:	fef43423          	sd	a5,-24(s0)
    80001f06:	a8ed                	j	80002000 <uvmunmap+0x138>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001f08:	4601                	li	a2,0
    80001f0a:	fe843583          	ld	a1,-24(s0)
    80001f0e:	fc843503          	ld	a0,-56(s0)
    80001f12:	00000097          	auipc	ra,0x0
    80001f16:	ca6080e7          	jalr	-858(ra) # 80001bb8 <walk>
    80001f1a:	fea43023          	sd	a0,-32(s0)
    80001f1e:	fe043783          	ld	a5,-32(s0)
    80001f22:	eb89                	bnez	a5,80001f34 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001f24:	0000a517          	auipc	a0,0xa
    80001f28:	1f450513          	addi	a0,a0,500 # 8000c118 <etext+0x118>
    80001f2c:	fffff097          	auipc	ra,0xfffff
    80001f30:	d60080e7          	jalr	-672(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0 && (*pte & PTE_ON_DISK) == 0)
    80001f34:	fe043783          	ld	a5,-32(s0)
    80001f38:	639c                	ld	a5,0(a5)
    80001f3a:	8b85                	andi	a5,a5,1
    80001f3c:	ef99                	bnez	a5,80001f5a <uvmunmap+0x92>
    80001f3e:	fe043783          	ld	a5,-32(s0)
    80001f42:	639c                	ld	a5,0(a5)
    80001f44:	1007f793          	andi	a5,a5,256
    80001f48:	eb89                	bnez	a5,80001f5a <uvmunmap+0x92>
      panic("uvmunmap: not mapped");
    80001f4a:	0000a517          	auipc	a0,0xa
    80001f4e:	1de50513          	addi	a0,a0,478 # 8000c128 <etext+0x128>
    80001f52:	fffff097          	auipc	ra,0xfffff
    80001f56:	d3a080e7          	jalr	-710(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001f5a:	fe043783          	ld	a5,-32(s0)
    80001f5e:	639c                	ld	a5,0(a5)
    80001f60:	3ff7f713          	andi	a4,a5,1023
    80001f64:	4785                	li	a5,1
    80001f66:	00f71a63          	bne	a4,a5,80001f7a <uvmunmap+0xb2>
      panic("uvmunmap: not a leaf");
    80001f6a:	0000a517          	auipc	a0,0xa
    80001f6e:	1d650513          	addi	a0,a0,470 # 8000c140 <etext+0x140>
    80001f72:	fffff097          	auipc	ra,0xfffff
    80001f76:	d1a080e7          	jalr	-742(ra) # 80000c8c <panic>

    if(va != TRAMPOLINE && va != TRAPFRAME)
    80001f7a:	fc043703          	ld	a4,-64(s0)
    80001f7e:	040007b7          	lui	a5,0x4000
    80001f82:	17fd                	addi	a5,a5,-1
    80001f84:	07b2                	slli	a5,a5,0xc
    80001f86:	02f70263          	beq	a4,a5,80001faa <uvmunmap+0xe2>
    80001f8a:	fc043703          	ld	a4,-64(s0)
    80001f8e:	020007b7          	lui	a5,0x2000
    80001f92:	17fd                	addi	a5,a5,-1
    80001f94:	07b6                	slli	a5,a5,0xd
    80001f96:	00f70a63          	beq	a4,a5,80001faa <uvmunmap+0xe2>
      unreglrupage(a, pagetable);
    80001f9a:	fc843583          	ld	a1,-56(s0)
    80001f9e:	fe843503          	ld	a0,-24(s0)
    80001fa2:	00008097          	auipc	ra,0x8
    80001fa6:	4b2080e7          	jalr	1202(ra) # 8000a454 <unreglrupage>

    if(do_free){
    80001faa:	fb442783          	lw	a5,-76(s0)
    80001fae:	2781                	sext.w	a5,a5
    80001fb0:	cf95                	beqz	a5,80001fec <uvmunmap+0x124>
      uint64 pa = PTE2PA(*pte);
    80001fb2:	fe043783          	ld	a5,-32(s0)
    80001fb6:	639c                	ld	a5,0(a5)
    80001fb8:	83a9                	srli	a5,a5,0xa
    80001fba:	07b2                	slli	a5,a5,0xc
    80001fbc:	fcf43c23          	sd	a5,-40(s0)
      if(*pte & PTE_ON_DISK)
    80001fc0:	fe043783          	ld	a5,-32(s0)
    80001fc4:	639c                	ld	a5,0(a5)
    80001fc6:	1007f793          	andi	a5,a5,256
    80001fca:	cb91                	beqz	a5,80001fde <uvmunmap+0x116>
        deallocate_page((int)pa);
    80001fcc:	fd843783          	ld	a5,-40(s0)
    80001fd0:	2781                	sext.w	a5,a5
    80001fd2:	853e                	mv	a0,a5
    80001fd4:	00008097          	auipc	ra,0x8
    80001fd8:	f04080e7          	jalr	-252(ra) # 80009ed8 <deallocate_page>
    80001fdc:	a801                	j	80001fec <uvmunmap+0x124>
      else
        kfree((void*)pa);
    80001fde:	fd843783          	ld	a5,-40(s0)
    80001fe2:	853e                	mv	a0,a5
    80001fe4:	fffff097          	auipc	ra,0xfffff
    80001fe8:	14c080e7          	jalr	332(ra) # 80001130 <kfree>
    }
    *pte = 0;
    80001fec:	fe043783          	ld	a5,-32(s0)
    80001ff0:	0007b023          	sd	zero,0(a5) # 2000000 <_entry-0x7e000000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001ff4:	fe843703          	ld	a4,-24(s0)
    80001ff8:	6785                	lui	a5,0x1
    80001ffa:	97ba                	add	a5,a5,a4
    80001ffc:	fef43423          	sd	a5,-24(s0)
    80002000:	fb843783          	ld	a5,-72(s0)
    80002004:	00c79713          	slli	a4,a5,0xc
    80002008:	fc043783          	ld	a5,-64(s0)
    8000200c:	97ba                	add	a5,a5,a4
    8000200e:	fe843703          	ld	a4,-24(s0)
    80002012:	eef76be3          	bltu	a4,a5,80001f08 <uvmunmap+0x40>
  }
}
    80002016:	0001                	nop
    80002018:	0001                	nop
    8000201a:	60a6                	ld	ra,72(sp)
    8000201c:	6406                	ld	s0,64(sp)
    8000201e:	6161                	addi	sp,sp,80
    80002020:	8082                	ret

0000000080002022 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80002022:	1101                	addi	sp,sp,-32
    80002024:	ec06                	sd	ra,24(sp)
    80002026:	e822                	sd	s0,16(sp)
    80002028:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    8000202a:	fffff097          	auipc	ra,0xfffff
    8000202e:	1ac080e7          	jalr	428(ra) # 800011d6 <kalloc>
    80002032:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002036:	fe843783          	ld	a5,-24(s0)
    8000203a:	e399                	bnez	a5,80002040 <uvmcreate+0x1e>
    return 0;
    8000203c:	4781                	li	a5,0
    8000203e:	a819                	j	80002054 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80002040:	6605                	lui	a2,0x1
    80002042:	4581                	li	a1,0
    80002044:	fe843503          	ld	a0,-24(s0)
    80002048:	fffff097          	auipc	ra,0xfffff
    8000204c:	4c8080e7          	jalr	1224(ra) # 80001510 <memset>
  return pagetable;
    80002050:	fe843783          	ld	a5,-24(s0)
}
    80002054:	853e                	mv	a0,a5
    80002056:	60e2                	ld	ra,24(sp)
    80002058:	6442                	ld	s0,16(sp)
    8000205a:	6105                	addi	sp,sp,32
    8000205c:	8082                	ret

000000008000205e <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    8000205e:	7139                	addi	sp,sp,-64
    80002060:	fc06                	sd	ra,56(sp)
    80002062:	f822                	sd	s0,48(sp)
    80002064:	0080                	addi	s0,sp,64
    80002066:	fca43c23          	sd	a0,-40(s0)
    8000206a:	fcb43823          	sd	a1,-48(s0)
    8000206e:	87b2                	mv	a5,a2
    80002070:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    80002074:	fcc42783          	lw	a5,-52(s0)
    80002078:	0007871b          	sext.w	a4,a5
    8000207c:	6785                	lui	a5,0x1
    8000207e:	00f76a63          	bltu	a4,a5,80002092 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    80002082:	0000a517          	auipc	a0,0xa
    80002086:	0d650513          	addi	a0,a0,214 # 8000c158 <etext+0x158>
    8000208a:	fffff097          	auipc	ra,0xfffff
    8000208e:	c02080e7          	jalr	-1022(ra) # 80000c8c <panic>
  mem = kalloc();
    80002092:	fffff097          	auipc	ra,0xfffff
    80002096:	144080e7          	jalr	324(ra) # 800011d6 <kalloc>
    8000209a:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    8000209e:	6605                	lui	a2,0x1
    800020a0:	4581                	li	a1,0
    800020a2:	fe843503          	ld	a0,-24(s0)
    800020a6:	fffff097          	auipc	ra,0xfffff
    800020aa:	46a080e7          	jalr	1130(ra) # 80001510 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    800020ae:	fe843783          	ld	a5,-24(s0)
    800020b2:	4779                	li	a4,30
    800020b4:	86be                	mv	a3,a5
    800020b6:	6605                	lui	a2,0x1
    800020b8:	4581                	li	a1,0
    800020ba:	fd843503          	ld	a0,-40(s0)
    800020be:	00000097          	auipc	ra,0x0
    800020c2:	d02080e7          	jalr	-766(ra) # 80001dc0 <mappages>
  memmove(mem, src, sz);
    800020c6:	fcc42783          	lw	a5,-52(s0)
    800020ca:	863e                	mv	a2,a5
    800020cc:	fd043583          	ld	a1,-48(s0)
    800020d0:	fe843503          	ld	a0,-24(s0)
    800020d4:	fffff097          	auipc	ra,0xfffff
    800020d8:	520080e7          	jalr	1312(ra) # 800015f4 <memmove>
}
    800020dc:	0001                	nop
    800020de:	70e2                	ld	ra,56(sp)
    800020e0:	7442                	ld	s0,48(sp)
    800020e2:	6121                	addi	sp,sp,64
    800020e4:	8082                	ret

00000000800020e6 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    800020e6:	7139                	addi	sp,sp,-64
    800020e8:	fc06                	sd	ra,56(sp)
    800020ea:	f822                	sd	s0,48(sp)
    800020ec:	0080                	addi	s0,sp,64
    800020ee:	fca43c23          	sd	a0,-40(s0)
    800020f2:	fcb43823          	sd	a1,-48(s0)
    800020f6:	fcc43423          	sd	a2,-56(s0)
    800020fa:	87b6                	mv	a5,a3
    800020fc:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80002100:	fc843703          	ld	a4,-56(s0)
    80002104:	fd043783          	ld	a5,-48(s0)
    80002108:	00f77563          	bgeu	a4,a5,80002112 <uvmalloc+0x2c>
    return oldsz;
    8000210c:	fd043783          	ld	a5,-48(s0)
    80002110:	a87d                	j	800021ce <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80002112:	fd043703          	ld	a4,-48(s0)
    80002116:	6785                	lui	a5,0x1
    80002118:	17fd                	addi	a5,a5,-1
    8000211a:	973e                	add	a4,a4,a5
    8000211c:	77fd                	lui	a5,0xfffff
    8000211e:	8ff9                	and	a5,a5,a4
    80002120:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002124:	fd043783          	ld	a5,-48(s0)
    80002128:	fef43423          	sd	a5,-24(s0)
    8000212c:	a849                	j	800021be <uvmalloc+0xd8>
    mem = kalloc();
    8000212e:	fffff097          	auipc	ra,0xfffff
    80002132:	0a8080e7          	jalr	168(ra) # 800011d6 <kalloc>
    80002136:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    8000213a:	fe043783          	ld	a5,-32(s0)
    8000213e:	ef89                	bnez	a5,80002158 <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    80002140:	fd043603          	ld	a2,-48(s0)
    80002144:	fe843583          	ld	a1,-24(s0)
    80002148:	fd843503          	ld	a0,-40(s0)
    8000214c:	00000097          	auipc	ra,0x0
    80002150:	08c080e7          	jalr	140(ra) # 800021d8 <uvmdealloc>
      return 0;
    80002154:	4781                	li	a5,0
    80002156:	a8a5                	j	800021ce <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    80002158:	6605                	lui	a2,0x1
    8000215a:	4581                	li	a1,0
    8000215c:	fe043503          	ld	a0,-32(s0)
    80002160:	fffff097          	auipc	ra,0xfffff
    80002164:	3b0080e7          	jalr	944(ra) # 80001510 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    80002168:	fe043683          	ld	a3,-32(s0)
    8000216c:	fc442783          	lw	a5,-60(s0)
    80002170:	0127e793          	ori	a5,a5,18
    80002174:	2781                	sext.w	a5,a5
    80002176:	873e                	mv	a4,a5
    80002178:	6605                	lui	a2,0x1
    8000217a:	fe843583          	ld	a1,-24(s0)
    8000217e:	fd843503          	ld	a0,-40(s0)
    80002182:	00000097          	auipc	ra,0x0
    80002186:	c3e080e7          	jalr	-962(ra) # 80001dc0 <mappages>
    8000218a:	87aa                	mv	a5,a0
    8000218c:	c39d                	beqz	a5,800021b2 <uvmalloc+0xcc>
      kfree(mem);
    8000218e:	fe043503          	ld	a0,-32(s0)
    80002192:	fffff097          	auipc	ra,0xfffff
    80002196:	f9e080e7          	jalr	-98(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    8000219a:	fd043603          	ld	a2,-48(s0)
    8000219e:	fe843583          	ld	a1,-24(s0)
    800021a2:	fd843503          	ld	a0,-40(s0)
    800021a6:	00000097          	auipc	ra,0x0
    800021aa:	032080e7          	jalr	50(ra) # 800021d8 <uvmdealloc>
      return 0;
    800021ae:	4781                	li	a5,0
    800021b0:	a839                	j	800021ce <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    800021b2:	fe843703          	ld	a4,-24(s0)
    800021b6:	6785                	lui	a5,0x1
    800021b8:	97ba                	add	a5,a5,a4
    800021ba:	fef43423          	sd	a5,-24(s0)
    800021be:	fe843703          	ld	a4,-24(s0)
    800021c2:	fc843783          	ld	a5,-56(s0)
    800021c6:	f6f764e3          	bltu	a4,a5,8000212e <uvmalloc+0x48>
    }
  }
  return newsz;
    800021ca:	fc843783          	ld	a5,-56(s0)
}
    800021ce:	853e                	mv	a0,a5
    800021d0:	70e2                	ld	ra,56(sp)
    800021d2:	7442                	ld	s0,48(sp)
    800021d4:	6121                	addi	sp,sp,64
    800021d6:	8082                	ret

00000000800021d8 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    800021d8:	7139                	addi	sp,sp,-64
    800021da:	fc06                	sd	ra,56(sp)
    800021dc:	f822                	sd	s0,48(sp)
    800021de:	0080                	addi	s0,sp,64
    800021e0:	fca43c23          	sd	a0,-40(s0)
    800021e4:	fcb43823          	sd	a1,-48(s0)
    800021e8:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    800021ec:	fc843703          	ld	a4,-56(s0)
    800021f0:	fd043783          	ld	a5,-48(s0)
    800021f4:	00f76563          	bltu	a4,a5,800021fe <uvmdealloc+0x26>
    return oldsz;
    800021f8:	fd043783          	ld	a5,-48(s0)
    800021fc:	a885                	j	8000226c <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800021fe:	fc843703          	ld	a4,-56(s0)
    80002202:	6785                	lui	a5,0x1
    80002204:	17fd                	addi	a5,a5,-1
    80002206:	973e                	add	a4,a4,a5
    80002208:	77fd                	lui	a5,0xfffff
    8000220a:	8f7d                	and	a4,a4,a5
    8000220c:	fd043683          	ld	a3,-48(s0)
    80002210:	6785                	lui	a5,0x1
    80002212:	17fd                	addi	a5,a5,-1
    80002214:	96be                	add	a3,a3,a5
    80002216:	77fd                	lui	a5,0xfffff
    80002218:	8ff5                	and	a5,a5,a3
    8000221a:	04f77763          	bgeu	a4,a5,80002268 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    8000221e:	fd043703          	ld	a4,-48(s0)
    80002222:	6785                	lui	a5,0x1
    80002224:	17fd                	addi	a5,a5,-1
    80002226:	973e                	add	a4,a4,a5
    80002228:	77fd                	lui	a5,0xfffff
    8000222a:	8f7d                	and	a4,a4,a5
    8000222c:	fc843683          	ld	a3,-56(s0)
    80002230:	6785                	lui	a5,0x1
    80002232:	17fd                	addi	a5,a5,-1
    80002234:	96be                	add	a3,a3,a5
    80002236:	77fd                	lui	a5,0xfffff
    80002238:	8ff5                	and	a5,a5,a3
    8000223a:	40f707b3          	sub	a5,a4,a5
    8000223e:	83b1                	srli	a5,a5,0xc
    80002240:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002244:	fc843703          	ld	a4,-56(s0)
    80002248:	6785                	lui	a5,0x1
    8000224a:	17fd                	addi	a5,a5,-1
    8000224c:	973e                	add	a4,a4,a5
    8000224e:	77fd                	lui	a5,0xfffff
    80002250:	8ff9                	and	a5,a5,a4
    80002252:	fec42703          	lw	a4,-20(s0)
    80002256:	4685                	li	a3,1
    80002258:	863a                	mv	a2,a4
    8000225a:	85be                	mv	a1,a5
    8000225c:	fd843503          	ld	a0,-40(s0)
    80002260:	00000097          	auipc	ra,0x0
    80002264:	c68080e7          	jalr	-920(ra) # 80001ec8 <uvmunmap>
  }

  return newsz;
    80002268:	fc843783          	ld	a5,-56(s0)
}
    8000226c:	853e                	mv	a0,a5
    8000226e:	70e2                	ld	ra,56(sp)
    80002270:	7442                	ld	s0,48(sp)
    80002272:	6121                	addi	sp,sp,64
    80002274:	8082                	ret

0000000080002276 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    80002276:	7139                	addi	sp,sp,-64
    80002278:	fc06                	sd	ra,56(sp)
    8000227a:	f822                	sd	s0,48(sp)
    8000227c:	0080                	addi	s0,sp,64
    8000227e:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002282:	fe042623          	sw	zero,-20(s0)
    80002286:	a88d                	j	800022f8 <freewalk+0x82>
    pte_t pte = pagetable[i];
    80002288:	fec42783          	lw	a5,-20(s0)
    8000228c:	078e                	slli	a5,a5,0x3
    8000228e:	fc843703          	ld	a4,-56(s0)
    80002292:	97ba                	add	a5,a5,a4
    80002294:	639c                	ld	a5,0(a5)
    80002296:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000229a:	fe043783          	ld	a5,-32(s0)
    8000229e:	8b85                	andi	a5,a5,1
    800022a0:	cb9d                	beqz	a5,800022d6 <freewalk+0x60>
    800022a2:	fe043783          	ld	a5,-32(s0)
    800022a6:	8bb9                	andi	a5,a5,14
    800022a8:	e79d                	bnez	a5,800022d6 <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800022aa:	fe043783          	ld	a5,-32(s0)
    800022ae:	83a9                	srli	a5,a5,0xa
    800022b0:	07b2                	slli	a5,a5,0xc
    800022b2:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800022b6:	fd843783          	ld	a5,-40(s0)
    800022ba:	853e                	mv	a0,a5
    800022bc:	00000097          	auipc	ra,0x0
    800022c0:	fba080e7          	jalr	-70(ra) # 80002276 <freewalk>
      pagetable[i] = 0;
    800022c4:	fec42783          	lw	a5,-20(s0)
    800022c8:	078e                	slli	a5,a5,0x3
    800022ca:	fc843703          	ld	a4,-56(s0)
    800022ce:	97ba                	add	a5,a5,a4
    800022d0:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ff98e38>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800022d4:	a829                	j	800022ee <freewalk+0x78>
    } else if(pte & PTE_V){
    800022d6:	fe043783          	ld	a5,-32(s0)
    800022da:	8b85                	andi	a5,a5,1
    800022dc:	cb89                	beqz	a5,800022ee <freewalk+0x78>
      panic("freewalk: leaf");
    800022de:	0000a517          	auipc	a0,0xa
    800022e2:	e9a50513          	addi	a0,a0,-358 # 8000c178 <etext+0x178>
    800022e6:	fffff097          	auipc	ra,0xfffff
    800022ea:	9a6080e7          	jalr	-1626(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    800022ee:	fec42783          	lw	a5,-20(s0)
    800022f2:	2785                	addiw	a5,a5,1
    800022f4:	fef42623          	sw	a5,-20(s0)
    800022f8:	fec42783          	lw	a5,-20(s0)
    800022fc:	0007871b          	sext.w	a4,a5
    80002300:	1ff00793          	li	a5,511
    80002304:	f8e7d2e3          	bge	a5,a4,80002288 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    80002308:	fc843503          	ld	a0,-56(s0)
    8000230c:	fffff097          	auipc	ra,0xfffff
    80002310:	e24080e7          	jalr	-476(ra) # 80001130 <kfree>
}
    80002314:	0001                	nop
    80002316:	70e2                	ld	ra,56(sp)
    80002318:	7442                	ld	s0,48(sp)
    8000231a:	6121                	addi	sp,sp,64
    8000231c:	8082                	ret

000000008000231e <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    8000231e:	1101                	addi	sp,sp,-32
    80002320:	ec06                	sd	ra,24(sp)
    80002322:	e822                	sd	s0,16(sp)
    80002324:	1000                	addi	s0,sp,32
    80002326:	fea43423          	sd	a0,-24(s0)
    8000232a:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    8000232e:	fe043783          	ld	a5,-32(s0)
    80002332:	c385                	beqz	a5,80002352 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002334:	fe043703          	ld	a4,-32(s0)
    80002338:	6785                	lui	a5,0x1
    8000233a:	17fd                	addi	a5,a5,-1
    8000233c:	97ba                	add	a5,a5,a4
    8000233e:	83b1                	srli	a5,a5,0xc
    80002340:	4685                	li	a3,1
    80002342:	863e                	mv	a2,a5
    80002344:	4581                	li	a1,0
    80002346:	fe843503          	ld	a0,-24(s0)
    8000234a:	00000097          	auipc	ra,0x0
    8000234e:	b7e080e7          	jalr	-1154(ra) # 80001ec8 <uvmunmap>
  freewalk(pagetable);
    80002352:	fe843503          	ld	a0,-24(s0)
    80002356:	00000097          	auipc	ra,0x0
    8000235a:	f20080e7          	jalr	-224(ra) # 80002276 <freewalk>
}
    8000235e:	0001                	nop
    80002360:	60e2                	ld	ra,24(sp)
    80002362:	6442                	ld	s0,16(sp)
    80002364:	6105                	addi	sp,sp,32
    80002366:	8082                	ret

0000000080002368 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    80002368:	711d                	addi	sp,sp,-96
    8000236a:	ec86                	sd	ra,88(sp)
    8000236c:	e8a2                	sd	s0,80(sp)
    8000236e:	1080                	addi	s0,sp,96
    80002370:	faa43c23          	sd	a0,-72(s0)
    80002374:	fab43823          	sd	a1,-80(s0)
    80002378:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    8000237c:	fe043423          	sd	zero,-24(s0)
    80002380:	a0d9                	j	80002446 <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002382:	4601                	li	a2,0
    80002384:	fe843583          	ld	a1,-24(s0)
    80002388:	fb843503          	ld	a0,-72(s0)
    8000238c:	00000097          	auipc	ra,0x0
    80002390:	82c080e7          	jalr	-2004(ra) # 80001bb8 <walk>
    80002394:	fea43023          	sd	a0,-32(s0)
    80002398:	fe043783          	ld	a5,-32(s0)
    8000239c:	eb89                	bnez	a5,800023ae <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    8000239e:	0000a517          	auipc	a0,0xa
    800023a2:	dea50513          	addi	a0,a0,-534 # 8000c188 <etext+0x188>
    800023a6:	fffff097          	auipc	ra,0xfffff
    800023aa:	8e6080e7          	jalr	-1818(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    800023ae:	fe043783          	ld	a5,-32(s0)
    800023b2:	639c                	ld	a5,0(a5)
    800023b4:	8b85                	andi	a5,a5,1
    800023b6:	eb89                	bnez	a5,800023c8 <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800023b8:	0000a517          	auipc	a0,0xa
    800023bc:	df050513          	addi	a0,a0,-528 # 8000c1a8 <etext+0x1a8>
    800023c0:	fffff097          	auipc	ra,0xfffff
    800023c4:	8cc080e7          	jalr	-1844(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    800023c8:	fe043783          	ld	a5,-32(s0)
    800023cc:	639c                	ld	a5,0(a5)
    800023ce:	83a9                	srli	a5,a5,0xa
    800023d0:	07b2                	slli	a5,a5,0xc
    800023d2:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800023d6:	fe043783          	ld	a5,-32(s0)
    800023da:	639c                	ld	a5,0(a5)
    800023dc:	2781                	sext.w	a5,a5
    800023de:	3ff7f793          	andi	a5,a5,1023
    800023e2:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800023e6:	fffff097          	auipc	ra,0xfffff
    800023ea:	df0080e7          	jalr	-528(ra) # 800011d6 <kalloc>
    800023ee:	fca43423          	sd	a0,-56(s0)
    800023f2:	fc843783          	ld	a5,-56(s0)
    800023f6:	c3a5                	beqz	a5,80002456 <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800023f8:	fd843783          	ld	a5,-40(s0)
    800023fc:	6605                	lui	a2,0x1
    800023fe:	85be                	mv	a1,a5
    80002400:	fc843503          	ld	a0,-56(s0)
    80002404:	fffff097          	auipc	ra,0xfffff
    80002408:	1f0080e7          	jalr	496(ra) # 800015f4 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    8000240c:	fc843783          	ld	a5,-56(s0)
    80002410:	fd442703          	lw	a4,-44(s0)
    80002414:	86be                	mv	a3,a5
    80002416:	6605                	lui	a2,0x1
    80002418:	fe843583          	ld	a1,-24(s0)
    8000241c:	fb043503          	ld	a0,-80(s0)
    80002420:	00000097          	auipc	ra,0x0
    80002424:	9a0080e7          	jalr	-1632(ra) # 80001dc0 <mappages>
    80002428:	87aa                	mv	a5,a0
    8000242a:	cb81                	beqz	a5,8000243a <uvmcopy+0xd2>
      kfree(mem);
    8000242c:	fc843503          	ld	a0,-56(s0)
    80002430:	fffff097          	auipc	ra,0xfffff
    80002434:	d00080e7          	jalr	-768(ra) # 80001130 <kfree>
      goto err;
    80002438:	a005                	j	80002458 <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    8000243a:	fe843703          	ld	a4,-24(s0)
    8000243e:	6785                	lui	a5,0x1
    80002440:	97ba                	add	a5,a5,a4
    80002442:	fef43423          	sd	a5,-24(s0)
    80002446:	fe843703          	ld	a4,-24(s0)
    8000244a:	fa843783          	ld	a5,-88(s0)
    8000244e:	f2f76ae3          	bltu	a4,a5,80002382 <uvmcopy+0x1a>
    }
  }
  return 0;
    80002452:	4781                	li	a5,0
    80002454:	a839                	j	80002472 <uvmcopy+0x10a>
      goto err;
    80002456:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    80002458:	fe843783          	ld	a5,-24(s0)
    8000245c:	83b1                	srli	a5,a5,0xc
    8000245e:	4685                	li	a3,1
    80002460:	863e                	mv	a2,a5
    80002462:	4581                	li	a1,0
    80002464:	fb043503          	ld	a0,-80(s0)
    80002468:	00000097          	auipc	ra,0x0
    8000246c:	a60080e7          	jalr	-1440(ra) # 80001ec8 <uvmunmap>
  return -1;
    80002470:	57fd                	li	a5,-1
}
    80002472:	853e                	mv	a0,a5
    80002474:	60e6                	ld	ra,88(sp)
    80002476:	6446                	ld	s0,80(sp)
    80002478:	6125                	addi	sp,sp,96
    8000247a:	8082                	ret

000000008000247c <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    8000247c:	7179                	addi	sp,sp,-48
    8000247e:	f406                	sd	ra,40(sp)
    80002480:	f022                	sd	s0,32(sp)
    80002482:	1800                	addi	s0,sp,48
    80002484:	fca43c23          	sd	a0,-40(s0)
    80002488:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    8000248c:	4601                	li	a2,0
    8000248e:	fd043583          	ld	a1,-48(s0)
    80002492:	fd843503          	ld	a0,-40(s0)
    80002496:	fffff097          	auipc	ra,0xfffff
    8000249a:	722080e7          	jalr	1826(ra) # 80001bb8 <walk>
    8000249e:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800024a2:	fe843783          	ld	a5,-24(s0)
    800024a6:	eb89                	bnez	a5,800024b8 <uvmclear+0x3c>
    panic("uvmclear");
    800024a8:	0000a517          	auipc	a0,0xa
    800024ac:	d2050513          	addi	a0,a0,-736 # 8000c1c8 <etext+0x1c8>
    800024b0:	ffffe097          	auipc	ra,0xffffe
    800024b4:	7dc080e7          	jalr	2012(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    800024b8:	fe843783          	ld	a5,-24(s0)
    800024bc:	639c                	ld	a5,0(a5)
    800024be:	fef7f713          	andi	a4,a5,-17
    800024c2:	fe843783          	ld	a5,-24(s0)
    800024c6:	e398                	sd	a4,0(a5)
  unreglrupage(va, pagetable);
    800024c8:	fd843583          	ld	a1,-40(s0)
    800024cc:	fd043503          	ld	a0,-48(s0)
    800024d0:	00008097          	auipc	ra,0x8
    800024d4:	f84080e7          	jalr	-124(ra) # 8000a454 <unreglrupage>
}
    800024d8:	0001                	nop
    800024da:	70a2                	ld	ra,40(sp)
    800024dc:	7402                	ld	s0,32(sp)
    800024de:	6145                	addi	sp,sp,48
    800024e0:	8082                	ret

00000000800024e2 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800024e2:	715d                	addi	sp,sp,-80
    800024e4:	e486                	sd	ra,72(sp)
    800024e6:	e0a2                	sd	s0,64(sp)
    800024e8:	0880                	addi	s0,sp,80
    800024ea:	fca43423          	sd	a0,-56(s0)
    800024ee:	fcb43023          	sd	a1,-64(s0)
    800024f2:	fac43c23          	sd	a2,-72(s0)
    800024f6:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800024fa:	a055                	j	8000259e <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    800024fc:	fc043703          	ld	a4,-64(s0)
    80002500:	77fd                	lui	a5,0xfffff
    80002502:	8ff9                	and	a5,a5,a4
    80002504:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002508:	fe043583          	ld	a1,-32(s0)
    8000250c:	fc843503          	ld	a0,-56(s0)
    80002510:	fffff097          	auipc	ra,0xfffff
    80002514:	7b8080e7          	jalr	1976(ra) # 80001cc8 <walkaddr>
    80002518:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000251c:	fd843783          	ld	a5,-40(s0)
    80002520:	e399                	bnez	a5,80002526 <copyout+0x44>
      return -1;
    80002522:	57fd                	li	a5,-1
    80002524:	a049                	j	800025a6 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    80002526:	fe043703          	ld	a4,-32(s0)
    8000252a:	fc043783          	ld	a5,-64(s0)
    8000252e:	8f1d                	sub	a4,a4,a5
    80002530:	6785                	lui	a5,0x1
    80002532:	97ba                	add	a5,a5,a4
    80002534:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002538:	fe843703          	ld	a4,-24(s0)
    8000253c:	fb043783          	ld	a5,-80(s0)
    80002540:	00e7f663          	bgeu	a5,a4,8000254c <copyout+0x6a>
      n = len;
    80002544:	fb043783          	ld	a5,-80(s0)
    80002548:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    8000254c:	fc043703          	ld	a4,-64(s0)
    80002550:	fe043783          	ld	a5,-32(s0)
    80002554:	8f1d                	sub	a4,a4,a5
    80002556:	fd843783          	ld	a5,-40(s0)
    8000255a:	97ba                	add	a5,a5,a4
    8000255c:	873e                	mv	a4,a5
    8000255e:	fe843783          	ld	a5,-24(s0)
    80002562:	2781                	sext.w	a5,a5
    80002564:	863e                	mv	a2,a5
    80002566:	fb843583          	ld	a1,-72(s0)
    8000256a:	853a                	mv	a0,a4
    8000256c:	fffff097          	auipc	ra,0xfffff
    80002570:	088080e7          	jalr	136(ra) # 800015f4 <memmove>

    len -= n;
    80002574:	fb043703          	ld	a4,-80(s0)
    80002578:	fe843783          	ld	a5,-24(s0)
    8000257c:	40f707b3          	sub	a5,a4,a5
    80002580:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002584:	fb843703          	ld	a4,-72(s0)
    80002588:	fe843783          	ld	a5,-24(s0)
    8000258c:	97ba                	add	a5,a5,a4
    8000258e:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002592:	fe043703          	ld	a4,-32(s0)
    80002596:	6785                	lui	a5,0x1
    80002598:	97ba                	add	a5,a5,a4
    8000259a:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    8000259e:	fb043783          	ld	a5,-80(s0)
    800025a2:	ffa9                	bnez	a5,800024fc <copyout+0x1a>
  }
  return 0;
    800025a4:	4781                	li	a5,0
}
    800025a6:	853e                	mv	a0,a5
    800025a8:	60a6                	ld	ra,72(sp)
    800025aa:	6406                	ld	s0,64(sp)
    800025ac:	6161                	addi	sp,sp,80
    800025ae:	8082                	ret

00000000800025b0 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800025b0:	715d                	addi	sp,sp,-80
    800025b2:	e486                	sd	ra,72(sp)
    800025b4:	e0a2                	sd	s0,64(sp)
    800025b6:	0880                	addi	s0,sp,80
    800025b8:	fca43423          	sd	a0,-56(s0)
    800025bc:	fcb43023          	sd	a1,-64(s0)
    800025c0:	fac43c23          	sd	a2,-72(s0)
    800025c4:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800025c8:	a055                	j	8000266c <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800025ca:	fb843703          	ld	a4,-72(s0)
    800025ce:	77fd                	lui	a5,0xfffff
    800025d0:	8ff9                	and	a5,a5,a4
    800025d2:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800025d6:	fe043583          	ld	a1,-32(s0)
    800025da:	fc843503          	ld	a0,-56(s0)
    800025de:	fffff097          	auipc	ra,0xfffff
    800025e2:	6ea080e7          	jalr	1770(ra) # 80001cc8 <walkaddr>
    800025e6:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800025ea:	fd843783          	ld	a5,-40(s0)
    800025ee:	e399                	bnez	a5,800025f4 <copyin+0x44>
      return -1;
    800025f0:	57fd                	li	a5,-1
    800025f2:	a049                	j	80002674 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800025f4:	fe043703          	ld	a4,-32(s0)
    800025f8:	fb843783          	ld	a5,-72(s0)
    800025fc:	8f1d                	sub	a4,a4,a5
    800025fe:	6785                	lui	a5,0x1
    80002600:	97ba                	add	a5,a5,a4
    80002602:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002606:	fe843703          	ld	a4,-24(s0)
    8000260a:	fb043783          	ld	a5,-80(s0)
    8000260e:	00e7f663          	bgeu	a5,a4,8000261a <copyin+0x6a>
      n = len;
    80002612:	fb043783          	ld	a5,-80(s0)
    80002616:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000261a:	fb843703          	ld	a4,-72(s0)
    8000261e:	fe043783          	ld	a5,-32(s0)
    80002622:	8f1d                	sub	a4,a4,a5
    80002624:	fd843783          	ld	a5,-40(s0)
    80002628:	97ba                	add	a5,a5,a4
    8000262a:	873e                	mv	a4,a5
    8000262c:	fe843783          	ld	a5,-24(s0)
    80002630:	2781                	sext.w	a5,a5
    80002632:	863e                	mv	a2,a5
    80002634:	85ba                	mv	a1,a4
    80002636:	fc043503          	ld	a0,-64(s0)
    8000263a:	fffff097          	auipc	ra,0xfffff
    8000263e:	fba080e7          	jalr	-70(ra) # 800015f4 <memmove>

    len -= n;
    80002642:	fb043703          	ld	a4,-80(s0)
    80002646:	fe843783          	ld	a5,-24(s0)
    8000264a:	40f707b3          	sub	a5,a4,a5
    8000264e:	faf43823          	sd	a5,-80(s0)
    dst += n;
    80002652:	fc043703          	ld	a4,-64(s0)
    80002656:	fe843783          	ld	a5,-24(s0)
    8000265a:	97ba                	add	a5,a5,a4
    8000265c:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002660:	fe043703          	ld	a4,-32(s0)
    80002664:	6785                	lui	a5,0x1
    80002666:	97ba                	add	a5,a5,a4
    80002668:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    8000266c:	fb043783          	ld	a5,-80(s0)
    80002670:	ffa9                	bnez	a5,800025ca <copyin+0x1a>
  }
  return 0;
    80002672:	4781                	li	a5,0
}
    80002674:	853e                	mv	a0,a5
    80002676:	60a6                	ld	ra,72(sp)
    80002678:	6406                	ld	s0,64(sp)
    8000267a:	6161                	addi	sp,sp,80
    8000267c:	8082                	ret

000000008000267e <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    8000267e:	711d                	addi	sp,sp,-96
    80002680:	ec86                	sd	ra,88(sp)
    80002682:	e8a2                	sd	s0,80(sp)
    80002684:	1080                	addi	s0,sp,96
    80002686:	faa43c23          	sd	a0,-72(s0)
    8000268a:	fab43823          	sd	a1,-80(s0)
    8000268e:	fac43423          	sd	a2,-88(s0)
    80002692:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    80002696:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000269a:	a0f1                	j	80002766 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    8000269c:	fa843703          	ld	a4,-88(s0)
    800026a0:	77fd                	lui	a5,0xfffff
    800026a2:	8ff9                	and	a5,a5,a4
    800026a4:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800026a8:	fd043583          	ld	a1,-48(s0)
    800026ac:	fb843503          	ld	a0,-72(s0)
    800026b0:	fffff097          	auipc	ra,0xfffff
    800026b4:	618080e7          	jalr	1560(ra) # 80001cc8 <walkaddr>
    800026b8:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800026bc:	fc843783          	ld	a5,-56(s0)
    800026c0:	e399                	bnez	a5,800026c6 <copyinstr+0x48>
      return -1;
    800026c2:	57fd                	li	a5,-1
    800026c4:	a87d                	j	80002782 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800026c6:	fd043703          	ld	a4,-48(s0)
    800026ca:	fa843783          	ld	a5,-88(s0)
    800026ce:	8f1d                	sub	a4,a4,a5
    800026d0:	6785                	lui	a5,0x1
    800026d2:	97ba                	add	a5,a5,a4
    800026d4:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800026d8:	fe843703          	ld	a4,-24(s0)
    800026dc:	fa043783          	ld	a5,-96(s0)
    800026e0:	00e7f663          	bgeu	a5,a4,800026ec <copyinstr+0x6e>
      n = max;
    800026e4:	fa043783          	ld	a5,-96(s0)
    800026e8:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800026ec:	fa843703          	ld	a4,-88(s0)
    800026f0:	fd043783          	ld	a5,-48(s0)
    800026f4:	8f1d                	sub	a4,a4,a5
    800026f6:	fc843783          	ld	a5,-56(s0)
    800026fa:	97ba                	add	a5,a5,a4
    800026fc:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002700:	a891                	j	80002754 <copyinstr+0xd6>
      if(*p == '\0'){
    80002702:	fd843783          	ld	a5,-40(s0)
    80002706:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000270a:	eb89                	bnez	a5,8000271c <copyinstr+0x9e>
        *dst = '\0';
    8000270c:	fb043783          	ld	a5,-80(s0)
    80002710:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002714:	4785                	li	a5,1
    80002716:	fef42223          	sw	a5,-28(s0)
        break;
    8000271a:	a081                	j	8000275a <copyinstr+0xdc>
      } else {
        *dst = *p;
    8000271c:	fd843783          	ld	a5,-40(s0)
    80002720:	0007c703          	lbu	a4,0(a5)
    80002724:	fb043783          	ld	a5,-80(s0)
    80002728:	00e78023          	sb	a4,0(a5)
      }
      --n;
    8000272c:	fe843783          	ld	a5,-24(s0)
    80002730:	17fd                	addi	a5,a5,-1
    80002732:	fef43423          	sd	a5,-24(s0)
      --max;
    80002736:	fa043783          	ld	a5,-96(s0)
    8000273a:	17fd                	addi	a5,a5,-1
    8000273c:	faf43023          	sd	a5,-96(s0)
      p++;
    80002740:	fd843783          	ld	a5,-40(s0)
    80002744:	0785                	addi	a5,a5,1
    80002746:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    8000274a:	fb043783          	ld	a5,-80(s0)
    8000274e:	0785                	addi	a5,a5,1
    80002750:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    80002754:	fe843783          	ld	a5,-24(s0)
    80002758:	f7cd                	bnez	a5,80002702 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    8000275a:	fd043703          	ld	a4,-48(s0)
    8000275e:	6785                	lui	a5,0x1
    80002760:	97ba                	add	a5,a5,a4
    80002762:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    80002766:	fe442783          	lw	a5,-28(s0)
    8000276a:	2781                	sext.w	a5,a5
    8000276c:	e781                	bnez	a5,80002774 <copyinstr+0xf6>
    8000276e:	fa043783          	ld	a5,-96(s0)
    80002772:	f78d                	bnez	a5,8000269c <copyinstr+0x1e>
  }
  if(got_null){
    80002774:	fe442783          	lw	a5,-28(s0)
    80002778:	2781                	sext.w	a5,a5
    8000277a:	c399                	beqz	a5,80002780 <copyinstr+0x102>
    return 0;
    8000277c:	4781                	li	a5,0
    8000277e:	a011                	j	80002782 <copyinstr+0x104>
  } else {
    return -1;
    80002780:	57fd                	li	a5,-1
  }
}
    80002782:	853e                	mv	a0,a5
    80002784:	60e6                	ld	ra,88(sp)
    80002786:	6446                	ld	s0,80(sp)
    80002788:	6125                	addi	sp,sp,96
    8000278a:	8082                	ret

000000008000278c <r_sstatus>:
{
    8000278c:	1101                	addi	sp,sp,-32
    8000278e:	ec22                	sd	s0,24(sp)
    80002790:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002792:	100027f3          	csrr	a5,sstatus
    80002796:	fef43423          	sd	a5,-24(s0)
  return x;
    8000279a:	fe843783          	ld	a5,-24(s0)
}
    8000279e:	853e                	mv	a0,a5
    800027a0:	6462                	ld	s0,24(sp)
    800027a2:	6105                	addi	sp,sp,32
    800027a4:	8082                	ret

00000000800027a6 <w_sstatus>:
{
    800027a6:	1101                	addi	sp,sp,-32
    800027a8:	ec22                	sd	s0,24(sp)
    800027aa:	1000                	addi	s0,sp,32
    800027ac:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800027b0:	fe843783          	ld	a5,-24(s0)
    800027b4:	10079073          	csrw	sstatus,a5
}
    800027b8:	0001                	nop
    800027ba:	6462                	ld	s0,24(sp)
    800027bc:	6105                	addi	sp,sp,32
    800027be:	8082                	ret

00000000800027c0 <intr_on>:
{
    800027c0:	1141                	addi	sp,sp,-16
    800027c2:	e406                	sd	ra,8(sp)
    800027c4:	e022                	sd	s0,0(sp)
    800027c6:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800027c8:	00000097          	auipc	ra,0x0
    800027cc:	fc4080e7          	jalr	-60(ra) # 8000278c <r_sstatus>
    800027d0:	87aa                	mv	a5,a0
    800027d2:	0027e793          	ori	a5,a5,2
    800027d6:	853e                	mv	a0,a5
    800027d8:	00000097          	auipc	ra,0x0
    800027dc:	fce080e7          	jalr	-50(ra) # 800027a6 <w_sstatus>
}
    800027e0:	0001                	nop
    800027e2:	60a2                	ld	ra,8(sp)
    800027e4:	6402                	ld	s0,0(sp)
    800027e6:	0141                	addi	sp,sp,16
    800027e8:	8082                	ret

00000000800027ea <intr_get>:
{
    800027ea:	1101                	addi	sp,sp,-32
    800027ec:	ec06                	sd	ra,24(sp)
    800027ee:	e822                	sd	s0,16(sp)
    800027f0:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800027f2:	00000097          	auipc	ra,0x0
    800027f6:	f9a080e7          	jalr	-102(ra) # 8000278c <r_sstatus>
    800027fa:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800027fe:	fe843783          	ld	a5,-24(s0)
    80002802:	8b89                	andi	a5,a5,2
    80002804:	00f037b3          	snez	a5,a5
    80002808:	0ff7f793          	andi	a5,a5,255
    8000280c:	2781                	sext.w	a5,a5
}
    8000280e:	853e                	mv	a0,a5
    80002810:	60e2                	ld	ra,24(sp)
    80002812:	6442                	ld	s0,16(sp)
    80002814:	6105                	addi	sp,sp,32
    80002816:	8082                	ret

0000000080002818 <r_tp>:
{
    80002818:	1101                	addi	sp,sp,-32
    8000281a:	ec22                	sd	s0,24(sp)
    8000281c:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    8000281e:	8792                	mv	a5,tp
    80002820:	fef43423          	sd	a5,-24(s0)
  return x;
    80002824:	fe843783          	ld	a5,-24(s0)
}
    80002828:	853e                	mv	a0,a5
    8000282a:	6462                	ld	s0,24(sp)
    8000282c:	6105                	addi	sp,sp,32
    8000282e:	8082                	ret

0000000080002830 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    80002830:	7139                	addi	sp,sp,-64
    80002832:	fc06                	sd	ra,56(sp)
    80002834:	f822                	sd	s0,48(sp)
    80002836:	0080                	addi	s0,sp,64
    80002838:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    8000283c:	00012797          	auipc	a5,0x12
    80002840:	7fc78793          	addi	a5,a5,2044 # 80015038 <proc>
    80002844:	fef43423          	sd	a5,-24(s0)
    80002848:	a061                	j	800028d0 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    8000284a:	fffff097          	auipc	ra,0xfffff
    8000284e:	98c080e7          	jalr	-1652(ra) # 800011d6 <kalloc>
    80002852:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80002856:	fe043783          	ld	a5,-32(s0)
    8000285a:	eb89                	bnez	a5,8000286c <proc_mapstacks+0x3c>
      panic("kalloc");
    8000285c:	0000a517          	auipc	a0,0xa
    80002860:	97c50513          	addi	a0,a0,-1668 # 8000c1d8 <etext+0x1d8>
    80002864:	ffffe097          	auipc	ra,0xffffe
    80002868:	428080e7          	jalr	1064(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    8000286c:	fe843703          	ld	a4,-24(s0)
    80002870:	00012797          	auipc	a5,0x12
    80002874:	7c878793          	addi	a5,a5,1992 # 80015038 <proc>
    80002878:	40f707b3          	sub	a5,a4,a5
    8000287c:	4037d713          	srai	a4,a5,0x3
    80002880:	0000a797          	auipc	a5,0xa
    80002884:	a5078793          	addi	a5,a5,-1456 # 8000c2d0 <etext+0x2d0>
    80002888:	639c                	ld	a5,0(a5)
    8000288a:	02f707b3          	mul	a5,a4,a5
    8000288e:	2781                	sext.w	a5,a5
    80002890:	2785                	addiw	a5,a5,1
    80002892:	2781                	sext.w	a5,a5
    80002894:	00d7979b          	slliw	a5,a5,0xd
    80002898:	2781                	sext.w	a5,a5
    8000289a:	873e                	mv	a4,a5
    8000289c:	040007b7          	lui	a5,0x4000
    800028a0:	17fd                	addi	a5,a5,-1
    800028a2:	07b2                	slli	a5,a5,0xc
    800028a4:	8f99                	sub	a5,a5,a4
    800028a6:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800028aa:	fe043783          	ld	a5,-32(s0)
    800028ae:	4719                	li	a4,6
    800028b0:	6685                	lui	a3,0x1
    800028b2:	863e                	mv	a2,a5
    800028b4:	fd843583          	ld	a1,-40(s0)
    800028b8:	fc843503          	ld	a0,-56(s0)
    800028bc:	fffff097          	auipc	ra,0xfffff
    800028c0:	4aa080e7          	jalr	1194(ra) # 80001d66 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028c4:	fe843783          	ld	a5,-24(s0)
    800028c8:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    800028cc:	fef43423          	sd	a5,-24(s0)
    800028d0:	fe843703          	ld	a4,-24(s0)
    800028d4:	00018797          	auipc	a5,0x18
    800028d8:	16478793          	addi	a5,a5,356 # 8001aa38 <pid_lock>
    800028dc:	f6f767e3          	bltu	a4,a5,8000284a <proc_mapstacks+0x1a>
  }
}
    800028e0:	0001                	nop
    800028e2:	0001                	nop
    800028e4:	70e2                	ld	ra,56(sp)
    800028e6:	7442                	ld	s0,48(sp)
    800028e8:	6121                	addi	sp,sp,64
    800028ea:	8082                	ret

00000000800028ec <procinit>:

// initialize the proc table.
void
procinit(void)
{
    800028ec:	1101                	addi	sp,sp,-32
    800028ee:	ec06                	sd	ra,24(sp)
    800028f0:	e822                	sd	s0,16(sp)
    800028f2:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800028f4:	0000a597          	auipc	a1,0xa
    800028f8:	8ec58593          	addi	a1,a1,-1812 # 8000c1e0 <etext+0x1e0>
    800028fc:	00018517          	auipc	a0,0x18
    80002900:	13c50513          	addi	a0,a0,316 # 8001aa38 <pid_lock>
    80002904:	fffff097          	auipc	ra,0xfffff
    80002908:	a08080e7          	jalr	-1528(ra) # 8000130c <initlock>
  initlock(&wait_lock, "wait_lock");
    8000290c:	0000a597          	auipc	a1,0xa
    80002910:	8dc58593          	addi	a1,a1,-1828 # 8000c1e8 <etext+0x1e8>
    80002914:	00018517          	auipc	a0,0x18
    80002918:	13c50513          	addi	a0,a0,316 # 8001aa50 <wait_lock>
    8000291c:	fffff097          	auipc	ra,0xfffff
    80002920:	9f0080e7          	jalr	-1552(ra) # 8000130c <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002924:	00012797          	auipc	a5,0x12
    80002928:	71478793          	addi	a5,a5,1812 # 80015038 <proc>
    8000292c:	fef43423          	sd	a5,-24(s0)
    80002930:	a0bd                	j	8000299e <procinit+0xb2>
      initlock(&p->lock, "proc");
    80002932:	fe843783          	ld	a5,-24(s0)
    80002936:	0000a597          	auipc	a1,0xa
    8000293a:	8c258593          	addi	a1,a1,-1854 # 8000c1f8 <etext+0x1f8>
    8000293e:	853e                	mv	a0,a5
    80002940:	fffff097          	auipc	ra,0xfffff
    80002944:	9cc080e7          	jalr	-1588(ra) # 8000130c <initlock>
      p->state = UNUSED;
    80002948:	fe843783          	ld	a5,-24(s0)
    8000294c:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    80002950:	fe843703          	ld	a4,-24(s0)
    80002954:	00012797          	auipc	a5,0x12
    80002958:	6e478793          	addi	a5,a5,1764 # 80015038 <proc>
    8000295c:	40f707b3          	sub	a5,a4,a5
    80002960:	4037d713          	srai	a4,a5,0x3
    80002964:	0000a797          	auipc	a5,0xa
    80002968:	96c78793          	addi	a5,a5,-1684 # 8000c2d0 <etext+0x2d0>
    8000296c:	639c                	ld	a5,0(a5)
    8000296e:	02f707b3          	mul	a5,a4,a5
    80002972:	2781                	sext.w	a5,a5
    80002974:	2785                	addiw	a5,a5,1
    80002976:	2781                	sext.w	a5,a5
    80002978:	00d7979b          	slliw	a5,a5,0xd
    8000297c:	2781                	sext.w	a5,a5
    8000297e:	873e                	mv	a4,a5
    80002980:	040007b7          	lui	a5,0x4000
    80002984:	17fd                	addi	a5,a5,-1
    80002986:	07b2                	slli	a5,a5,0xc
    80002988:	8f99                	sub	a5,a5,a4
    8000298a:	873e                	mv	a4,a5
    8000298c:	fe843783          	ld	a5,-24(s0)
    80002990:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002992:	fe843783          	ld	a5,-24(s0)
    80002996:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    8000299a:	fef43423          	sd	a5,-24(s0)
    8000299e:	fe843703          	ld	a4,-24(s0)
    800029a2:	00018797          	auipc	a5,0x18
    800029a6:	09678793          	addi	a5,a5,150 # 8001aa38 <pid_lock>
    800029aa:	f8f764e3          	bltu	a4,a5,80002932 <procinit+0x46>
  }
}
    800029ae:	0001                	nop
    800029b0:	0001                	nop
    800029b2:	60e2                	ld	ra,24(sp)
    800029b4:	6442                	ld	s0,16(sp)
    800029b6:	6105                	addi	sp,sp,32
    800029b8:	8082                	ret

00000000800029ba <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800029ba:	1101                	addi	sp,sp,-32
    800029bc:	ec06                	sd	ra,24(sp)
    800029be:	e822                	sd	s0,16(sp)
    800029c0:	1000                	addi	s0,sp,32
  int id = r_tp();
    800029c2:	00000097          	auipc	ra,0x0
    800029c6:	e56080e7          	jalr	-426(ra) # 80002818 <r_tp>
    800029ca:	87aa                	mv	a5,a0
    800029cc:	fef42623          	sw	a5,-20(s0)
  return id;
    800029d0:	fec42783          	lw	a5,-20(s0)
}
    800029d4:	853e                	mv	a0,a5
    800029d6:	60e2                	ld	ra,24(sp)
    800029d8:	6442                	ld	s0,16(sp)
    800029da:	6105                	addi	sp,sp,32
    800029dc:	8082                	ret

00000000800029de <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    800029de:	1101                	addi	sp,sp,-32
    800029e0:	ec06                	sd	ra,24(sp)
    800029e2:	e822                	sd	s0,16(sp)
    800029e4:	1000                	addi	s0,sp,32
  int id = cpuid();
    800029e6:	00000097          	auipc	ra,0x0
    800029ea:	fd4080e7          	jalr	-44(ra) # 800029ba <cpuid>
    800029ee:	87aa                	mv	a5,a0
    800029f0:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800029f4:	fec42783          	lw	a5,-20(s0)
    800029f8:	00779713          	slli	a4,a5,0x7
    800029fc:	00012797          	auipc	a5,0x12
    80002a00:	23c78793          	addi	a5,a5,572 # 80014c38 <cpus>
    80002a04:	97ba                	add	a5,a5,a4
    80002a06:	fef43023          	sd	a5,-32(s0)
  return c;
    80002a0a:	fe043783          	ld	a5,-32(s0)
}
    80002a0e:	853e                	mv	a0,a5
    80002a10:	60e2                	ld	ra,24(sp)
    80002a12:	6442                	ld	s0,16(sp)
    80002a14:	6105                	addi	sp,sp,32
    80002a16:	8082                	ret

0000000080002a18 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002a18:	1101                	addi	sp,sp,-32
    80002a1a:	ec06                	sd	ra,24(sp)
    80002a1c:	e822                	sd	s0,16(sp)
    80002a1e:	1000                	addi	s0,sp,32
  push_off();
    80002a20:	fffff097          	auipc	ra,0xfffff
    80002a24:	a1a080e7          	jalr	-1510(ra) # 8000143a <push_off>
  struct cpu *c = mycpu();
    80002a28:	00000097          	auipc	ra,0x0
    80002a2c:	fb6080e7          	jalr	-74(ra) # 800029de <mycpu>
    80002a30:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002a34:	fe843783          	ld	a5,-24(s0)
    80002a38:	639c                	ld	a5,0(a5)
    80002a3a:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002a3e:	fffff097          	auipc	ra,0xfffff
    80002a42:	a54080e7          	jalr	-1452(ra) # 80001492 <pop_off>
  return p;
    80002a46:	fe043783          	ld	a5,-32(s0)
}
    80002a4a:	853e                	mv	a0,a5
    80002a4c:	60e2                	ld	ra,24(sp)
    80002a4e:	6442                	ld	s0,16(sp)
    80002a50:	6105                	addi	sp,sp,32
    80002a52:	8082                	ret

0000000080002a54 <allocpid>:

int
allocpid()
{
    80002a54:	1101                	addi	sp,sp,-32
    80002a56:	ec06                	sd	ra,24(sp)
    80002a58:	e822                	sd	s0,16(sp)
    80002a5a:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002a5c:	00018517          	auipc	a0,0x18
    80002a60:	fdc50513          	addi	a0,a0,-36 # 8001aa38 <pid_lock>
    80002a64:	fffff097          	auipc	ra,0xfffff
    80002a68:	8d8080e7          	jalr	-1832(ra) # 8000133c <acquire>
  pid = nextpid;
    80002a6c:	0000a797          	auipc	a5,0xa
    80002a70:	dd478793          	addi	a5,a5,-556 # 8000c840 <nextpid>
    80002a74:	439c                	lw	a5,0(a5)
    80002a76:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002a7a:	0000a797          	auipc	a5,0xa
    80002a7e:	dc678793          	addi	a5,a5,-570 # 8000c840 <nextpid>
    80002a82:	439c                	lw	a5,0(a5)
    80002a84:	2785                	addiw	a5,a5,1
    80002a86:	0007871b          	sext.w	a4,a5
    80002a8a:	0000a797          	auipc	a5,0xa
    80002a8e:	db678793          	addi	a5,a5,-586 # 8000c840 <nextpid>
    80002a92:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002a94:	00018517          	auipc	a0,0x18
    80002a98:	fa450513          	addi	a0,a0,-92 # 8001aa38 <pid_lock>
    80002a9c:	fffff097          	auipc	ra,0xfffff
    80002aa0:	904080e7          	jalr	-1788(ra) # 800013a0 <release>

  return pid;
    80002aa4:	fec42783          	lw	a5,-20(s0)
}
    80002aa8:	853e                	mv	a0,a5
    80002aaa:	60e2                	ld	ra,24(sp)
    80002aac:	6442                	ld	s0,16(sp)
    80002aae:	6105                	addi	sp,sp,32
    80002ab0:	8082                	ret

0000000080002ab2 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002ab2:	1101                	addi	sp,sp,-32
    80002ab4:	ec06                	sd	ra,24(sp)
    80002ab6:	e822                	sd	s0,16(sp)
    80002ab8:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002aba:	00012797          	auipc	a5,0x12
    80002abe:	57e78793          	addi	a5,a5,1406 # 80015038 <proc>
    80002ac2:	fef43423          	sd	a5,-24(s0)
    80002ac6:	a80d                	j	80002af8 <allocproc+0x46>
    acquire(&p->lock);
    80002ac8:	fe843783          	ld	a5,-24(s0)
    80002acc:	853e                	mv	a0,a5
    80002ace:	fffff097          	auipc	ra,0xfffff
    80002ad2:	86e080e7          	jalr	-1938(ra) # 8000133c <acquire>
    if(p->state == UNUSED) {
    80002ad6:	fe843783          	ld	a5,-24(s0)
    80002ada:	4f9c                	lw	a5,24(a5)
    80002adc:	cb85                	beqz	a5,80002b0c <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002ade:	fe843783          	ld	a5,-24(s0)
    80002ae2:	853e                	mv	a0,a5
    80002ae4:	fffff097          	auipc	ra,0xfffff
    80002ae8:	8bc080e7          	jalr	-1860(ra) # 800013a0 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002aec:	fe843783          	ld	a5,-24(s0)
    80002af0:	16878793          	addi	a5,a5,360
    80002af4:	fef43423          	sd	a5,-24(s0)
    80002af8:	fe843703          	ld	a4,-24(s0)
    80002afc:	00018797          	auipc	a5,0x18
    80002b00:	f3c78793          	addi	a5,a5,-196 # 8001aa38 <pid_lock>
    80002b04:	fcf762e3          	bltu	a4,a5,80002ac8 <allocproc+0x16>
    }
  }
  return 0;
    80002b08:	4781                	li	a5,0
    80002b0a:	a0e1                	j	80002bd2 <allocproc+0x120>
      goto found;
    80002b0c:	0001                	nop

found:
  p->pid = allocpid();
    80002b0e:	00000097          	auipc	ra,0x0
    80002b12:	f46080e7          	jalr	-186(ra) # 80002a54 <allocpid>
    80002b16:	87aa                	mv	a5,a0
    80002b18:	873e                	mv	a4,a5
    80002b1a:	fe843783          	ld	a5,-24(s0)
    80002b1e:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002b20:	fe843783          	ld	a5,-24(s0)
    80002b24:	4705                	li	a4,1
    80002b26:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002b28:	ffffe097          	auipc	ra,0xffffe
    80002b2c:	6ae080e7          	jalr	1710(ra) # 800011d6 <kalloc>
    80002b30:	872a                	mv	a4,a0
    80002b32:	fe843783          	ld	a5,-24(s0)
    80002b36:	efb8                	sd	a4,88(a5)
    80002b38:	fe843783          	ld	a5,-24(s0)
    80002b3c:	6fbc                	ld	a5,88(a5)
    80002b3e:	e385                	bnez	a5,80002b5e <allocproc+0xac>
    freeproc(p);
    80002b40:	fe843503          	ld	a0,-24(s0)
    80002b44:	00000097          	auipc	ra,0x0
    80002b48:	098080e7          	jalr	152(ra) # 80002bdc <freeproc>
    release(&p->lock);
    80002b4c:	fe843783          	ld	a5,-24(s0)
    80002b50:	853e                	mv	a0,a5
    80002b52:	fffff097          	auipc	ra,0xfffff
    80002b56:	84e080e7          	jalr	-1970(ra) # 800013a0 <release>
    return 0;
    80002b5a:	4781                	li	a5,0
    80002b5c:	a89d                	j	80002bd2 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002b5e:	fe843503          	ld	a0,-24(s0)
    80002b62:	00000097          	auipc	ra,0x0
    80002b66:	118080e7          	jalr	280(ra) # 80002c7a <proc_pagetable>
    80002b6a:	872a                	mv	a4,a0
    80002b6c:	fe843783          	ld	a5,-24(s0)
    80002b70:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002b72:	fe843783          	ld	a5,-24(s0)
    80002b76:	6bbc                	ld	a5,80(a5)
    80002b78:	e385                	bnez	a5,80002b98 <allocproc+0xe6>
    freeproc(p);
    80002b7a:	fe843503          	ld	a0,-24(s0)
    80002b7e:	00000097          	auipc	ra,0x0
    80002b82:	05e080e7          	jalr	94(ra) # 80002bdc <freeproc>
    release(&p->lock);
    80002b86:	fe843783          	ld	a5,-24(s0)
    80002b8a:	853e                	mv	a0,a5
    80002b8c:	fffff097          	auipc	ra,0xfffff
    80002b90:	814080e7          	jalr	-2028(ra) # 800013a0 <release>
    return 0;
    80002b94:	4781                	li	a5,0
    80002b96:	a835                	j	80002bd2 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002b98:	fe843783          	ld	a5,-24(s0)
    80002b9c:	06078793          	addi	a5,a5,96
    80002ba0:	07000613          	li	a2,112
    80002ba4:	4581                	li	a1,0
    80002ba6:	853e                	mv	a0,a5
    80002ba8:	fffff097          	auipc	ra,0xfffff
    80002bac:	968080e7          	jalr	-1688(ra) # 80001510 <memset>
  p->context.ra = (uint64)forkret;
    80002bb0:	00001717          	auipc	a4,0x1
    80002bb4:	9da70713          	addi	a4,a4,-1574 # 8000358a <forkret>
    80002bb8:	fe843783          	ld	a5,-24(s0)
    80002bbc:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002bbe:	fe843783          	ld	a5,-24(s0)
    80002bc2:	63b8                	ld	a4,64(a5)
    80002bc4:	6785                	lui	a5,0x1
    80002bc6:	973e                	add	a4,a4,a5
    80002bc8:	fe843783          	ld	a5,-24(s0)
    80002bcc:	f7b8                	sd	a4,104(a5)

  return p;
    80002bce:	fe843783          	ld	a5,-24(s0)
}
    80002bd2:	853e                	mv	a0,a5
    80002bd4:	60e2                	ld	ra,24(sp)
    80002bd6:	6442                	ld	s0,16(sp)
    80002bd8:	6105                	addi	sp,sp,32
    80002bda:	8082                	ret

0000000080002bdc <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002bdc:	1101                	addi	sp,sp,-32
    80002bde:	ec06                	sd	ra,24(sp)
    80002be0:	e822                	sd	s0,16(sp)
    80002be2:	1000                	addi	s0,sp,32
    80002be4:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002be8:	fe843783          	ld	a5,-24(s0)
    80002bec:	6fbc                	ld	a5,88(a5)
    80002bee:	cb89                	beqz	a5,80002c00 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002bf0:	fe843783          	ld	a5,-24(s0)
    80002bf4:	6fbc                	ld	a5,88(a5)
    80002bf6:	853e                	mv	a0,a5
    80002bf8:	ffffe097          	auipc	ra,0xffffe
    80002bfc:	538080e7          	jalr	1336(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80002c00:	fe843783          	ld	a5,-24(s0)
    80002c04:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002c08:	fe843783          	ld	a5,-24(s0)
    80002c0c:	6bbc                	ld	a5,80(a5)
    80002c0e:	cf89                	beqz	a5,80002c28 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002c10:	fe843783          	ld	a5,-24(s0)
    80002c14:	6bb8                	ld	a4,80(a5)
    80002c16:	fe843783          	ld	a5,-24(s0)
    80002c1a:	67bc                	ld	a5,72(a5)
    80002c1c:	85be                	mv	a1,a5
    80002c1e:	853a                	mv	a0,a4
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	11a080e7          	jalr	282(ra) # 80002d3a <proc_freepagetable>
  p->pagetable = 0;
    80002c28:	fe843783          	ld	a5,-24(s0)
    80002c2c:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002c30:	fe843783          	ld	a5,-24(s0)
    80002c34:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002c38:	fe843783          	ld	a5,-24(s0)
    80002c3c:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002c40:	fe843783          	ld	a5,-24(s0)
    80002c44:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002c48:	fe843783          	ld	a5,-24(s0)
    80002c4c:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002c50:	fe843783          	ld	a5,-24(s0)
    80002c54:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002c58:	fe843783          	ld	a5,-24(s0)
    80002c5c:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002c60:	fe843783          	ld	a5,-24(s0)
    80002c64:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002c68:	fe843783          	ld	a5,-24(s0)
    80002c6c:	0007ac23          	sw	zero,24(a5)
}
    80002c70:	0001                	nop
    80002c72:	60e2                	ld	ra,24(sp)
    80002c74:	6442                	ld	s0,16(sp)
    80002c76:	6105                	addi	sp,sp,32
    80002c78:	8082                	ret

0000000080002c7a <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002c7a:	7179                	addi	sp,sp,-48
    80002c7c:	f406                	sd	ra,40(sp)
    80002c7e:	f022                	sd	s0,32(sp)
    80002c80:	1800                	addi	s0,sp,48
    80002c82:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002c86:	fffff097          	auipc	ra,0xfffff
    80002c8a:	39c080e7          	jalr	924(ra) # 80002022 <uvmcreate>
    80002c8e:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002c92:	fe843783          	ld	a5,-24(s0)
    80002c96:	e399                	bnez	a5,80002c9c <proc_pagetable+0x22>
    return 0;
    80002c98:	4781                	li	a5,0
    80002c9a:	a859                	j	80002d30 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002c9c:	00008797          	auipc	a5,0x8
    80002ca0:	36478793          	addi	a5,a5,868 # 8000b000 <_trampoline>
    80002ca4:	4729                	li	a4,10
    80002ca6:	86be                	mv	a3,a5
    80002ca8:	6605                	lui	a2,0x1
    80002caa:	040007b7          	lui	a5,0x4000
    80002cae:	17fd                	addi	a5,a5,-1
    80002cb0:	00c79593          	slli	a1,a5,0xc
    80002cb4:	fe843503          	ld	a0,-24(s0)
    80002cb8:	fffff097          	auipc	ra,0xfffff
    80002cbc:	108080e7          	jalr	264(ra) # 80001dc0 <mappages>
    80002cc0:	87aa                	mv	a5,a0
    80002cc2:	0007db63          	bgez	a5,80002cd8 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002cc6:	4581                	li	a1,0
    80002cc8:	fe843503          	ld	a0,-24(s0)
    80002ccc:	fffff097          	auipc	ra,0xfffff
    80002cd0:	652080e7          	jalr	1618(ra) # 8000231e <uvmfree>
    return 0;
    80002cd4:	4781                	li	a5,0
    80002cd6:	a8a9                	j	80002d30 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002cd8:	fd843783          	ld	a5,-40(s0)
    80002cdc:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002cde:	4719                	li	a4,6
    80002ce0:	86be                	mv	a3,a5
    80002ce2:	6605                	lui	a2,0x1
    80002ce4:	020007b7          	lui	a5,0x2000
    80002ce8:	17fd                	addi	a5,a5,-1
    80002cea:	00d79593          	slli	a1,a5,0xd
    80002cee:	fe843503          	ld	a0,-24(s0)
    80002cf2:	fffff097          	auipc	ra,0xfffff
    80002cf6:	0ce080e7          	jalr	206(ra) # 80001dc0 <mappages>
    80002cfa:	87aa                	mv	a5,a0
    80002cfc:	0207d863          	bgez	a5,80002d2c <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002d00:	4681                	li	a3,0
    80002d02:	4605                	li	a2,1
    80002d04:	040007b7          	lui	a5,0x4000
    80002d08:	17fd                	addi	a5,a5,-1
    80002d0a:	00c79593          	slli	a1,a5,0xc
    80002d0e:	fe843503          	ld	a0,-24(s0)
    80002d12:	fffff097          	auipc	ra,0xfffff
    80002d16:	1b6080e7          	jalr	438(ra) # 80001ec8 <uvmunmap>
    uvmfree(pagetable, 0);
    80002d1a:	4581                	li	a1,0
    80002d1c:	fe843503          	ld	a0,-24(s0)
    80002d20:	fffff097          	auipc	ra,0xfffff
    80002d24:	5fe080e7          	jalr	1534(ra) # 8000231e <uvmfree>
    return 0;
    80002d28:	4781                	li	a5,0
    80002d2a:	a019                	j	80002d30 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002d2c:	fe843783          	ld	a5,-24(s0)
}
    80002d30:	853e                	mv	a0,a5
    80002d32:	70a2                	ld	ra,40(sp)
    80002d34:	7402                	ld	s0,32(sp)
    80002d36:	6145                	addi	sp,sp,48
    80002d38:	8082                	ret

0000000080002d3a <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002d3a:	1101                	addi	sp,sp,-32
    80002d3c:	ec06                	sd	ra,24(sp)
    80002d3e:	e822                	sd	s0,16(sp)
    80002d40:	1000                	addi	s0,sp,32
    80002d42:	fea43423          	sd	a0,-24(s0)
    80002d46:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002d4a:	4681                	li	a3,0
    80002d4c:	4605                	li	a2,1
    80002d4e:	040007b7          	lui	a5,0x4000
    80002d52:	17fd                	addi	a5,a5,-1
    80002d54:	00c79593          	slli	a1,a5,0xc
    80002d58:	fe843503          	ld	a0,-24(s0)
    80002d5c:	fffff097          	auipc	ra,0xfffff
    80002d60:	16c080e7          	jalr	364(ra) # 80001ec8 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002d64:	4681                	li	a3,0
    80002d66:	4605                	li	a2,1
    80002d68:	020007b7          	lui	a5,0x2000
    80002d6c:	17fd                	addi	a5,a5,-1
    80002d6e:	00d79593          	slli	a1,a5,0xd
    80002d72:	fe843503          	ld	a0,-24(s0)
    80002d76:	fffff097          	auipc	ra,0xfffff
    80002d7a:	152080e7          	jalr	338(ra) # 80001ec8 <uvmunmap>
  uvmfree(pagetable, sz);
    80002d7e:	fe043583          	ld	a1,-32(s0)
    80002d82:	fe843503          	ld	a0,-24(s0)
    80002d86:	fffff097          	auipc	ra,0xfffff
    80002d8a:	598080e7          	jalr	1432(ra) # 8000231e <uvmfree>
}
    80002d8e:	0001                	nop
    80002d90:	60e2                	ld	ra,24(sp)
    80002d92:	6442                	ld	s0,16(sp)
    80002d94:	6105                	addi	sp,sp,32
    80002d96:	8082                	ret

0000000080002d98 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002d98:	1101                	addi	sp,sp,-32
    80002d9a:	ec06                	sd	ra,24(sp)
    80002d9c:	e822                	sd	s0,16(sp)
    80002d9e:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002da0:	00000097          	auipc	ra,0x0
    80002da4:	d12080e7          	jalr	-750(ra) # 80002ab2 <allocproc>
    80002da8:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002dac:	0000a797          	auipc	a5,0xa
    80002db0:	c1478793          	addi	a5,a5,-1004 # 8000c9c0 <initproc>
    80002db4:	fe843703          	ld	a4,-24(s0)
    80002db8:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002dba:	fe843783          	ld	a5,-24(s0)
    80002dbe:	6bbc                	ld	a5,80(a5)
    80002dc0:	03400613          	li	a2,52
    80002dc4:	0000a597          	auipc	a1,0xa
    80002dc8:	aa458593          	addi	a1,a1,-1372 # 8000c868 <initcode>
    80002dcc:	853e                	mv	a0,a5
    80002dce:	fffff097          	auipc	ra,0xfffff
    80002dd2:	290080e7          	jalr	656(ra) # 8000205e <uvmfirst>
  p->sz = PGSIZE;
    80002dd6:	fe843783          	ld	a5,-24(s0)
    80002dda:	6705                	lui	a4,0x1
    80002ddc:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002dde:	fe843783          	ld	a5,-24(s0)
    80002de2:	6fbc                	ld	a5,88(a5)
    80002de4:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002de8:	fe843783          	ld	a5,-24(s0)
    80002dec:	6fbc                	ld	a5,88(a5)
    80002dee:	6705                	lui	a4,0x1
    80002df0:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002df2:	fe843783          	ld	a5,-24(s0)
    80002df6:	15878793          	addi	a5,a5,344
    80002dfa:	4641                	li	a2,16
    80002dfc:	00009597          	auipc	a1,0x9
    80002e00:	40458593          	addi	a1,a1,1028 # 8000c200 <etext+0x200>
    80002e04:	853e                	mv	a0,a5
    80002e06:	fffff097          	auipc	ra,0xfffff
    80002e0a:	a0e080e7          	jalr	-1522(ra) # 80001814 <safestrcpy>
  p->cwd = namei("/");
    80002e0e:	00009517          	auipc	a0,0x9
    80002e12:	40250513          	addi	a0,a0,1026 # 8000c210 <etext+0x210>
    80002e16:	00003097          	auipc	ra,0x3
    80002e1a:	1da080e7          	jalr	474(ra) # 80005ff0 <namei>
    80002e1e:	872a                	mv	a4,a0
    80002e20:	fe843783          	ld	a5,-24(s0)
    80002e24:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002e28:	fe843783          	ld	a5,-24(s0)
    80002e2c:	470d                	li	a4,3
    80002e2e:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002e30:	fe843783          	ld	a5,-24(s0)
    80002e34:	853e                	mv	a0,a5
    80002e36:	ffffe097          	auipc	ra,0xffffe
    80002e3a:	56a080e7          	jalr	1386(ra) # 800013a0 <release>
}
    80002e3e:	0001                	nop
    80002e40:	60e2                	ld	ra,24(sp)
    80002e42:	6442                	ld	s0,16(sp)
    80002e44:	6105                	addi	sp,sp,32
    80002e46:	8082                	ret

0000000080002e48 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002e48:	7179                	addi	sp,sp,-48
    80002e4a:	f406                	sd	ra,40(sp)
    80002e4c:	f022                	sd	s0,32(sp)
    80002e4e:	1800                	addi	s0,sp,48
    80002e50:	87aa                	mv	a5,a0
    80002e52:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002e56:	00000097          	auipc	ra,0x0
    80002e5a:	bc2080e7          	jalr	-1086(ra) # 80002a18 <myproc>
    80002e5e:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002e62:	fe043783          	ld	a5,-32(s0)
    80002e66:	67bc                	ld	a5,72(a5)
    80002e68:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002e6c:	fdc42783          	lw	a5,-36(s0)
    80002e70:	2781                	sext.w	a5,a5
    80002e72:	02f05963          	blez	a5,80002ea4 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002e76:	fe043783          	ld	a5,-32(s0)
    80002e7a:	6ba8                	ld	a0,80(a5)
    80002e7c:	fdc42703          	lw	a4,-36(s0)
    80002e80:	fe843783          	ld	a5,-24(s0)
    80002e84:	97ba                	add	a5,a5,a4
    80002e86:	4691                	li	a3,4
    80002e88:	863e                	mv	a2,a5
    80002e8a:	fe843583          	ld	a1,-24(s0)
    80002e8e:	fffff097          	auipc	ra,0xfffff
    80002e92:	258080e7          	jalr	600(ra) # 800020e6 <uvmalloc>
    80002e96:	fea43423          	sd	a0,-24(s0)
    80002e9a:	fe843783          	ld	a5,-24(s0)
    80002e9e:	eb95                	bnez	a5,80002ed2 <growproc+0x8a>
      return -1;
    80002ea0:	57fd                	li	a5,-1
    80002ea2:	a835                	j	80002ede <growproc+0x96>
    }
  } else if(n < 0){
    80002ea4:	fdc42783          	lw	a5,-36(s0)
    80002ea8:	2781                	sext.w	a5,a5
    80002eaa:	0207d463          	bgez	a5,80002ed2 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002eae:	fe043783          	ld	a5,-32(s0)
    80002eb2:	6bb4                	ld	a3,80(a5)
    80002eb4:	fdc42703          	lw	a4,-36(s0)
    80002eb8:	fe843783          	ld	a5,-24(s0)
    80002ebc:	97ba                	add	a5,a5,a4
    80002ebe:	863e                	mv	a2,a5
    80002ec0:	fe843583          	ld	a1,-24(s0)
    80002ec4:	8536                	mv	a0,a3
    80002ec6:	fffff097          	auipc	ra,0xfffff
    80002eca:	312080e7          	jalr	786(ra) # 800021d8 <uvmdealloc>
    80002ece:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002ed2:	fe043783          	ld	a5,-32(s0)
    80002ed6:	fe843703          	ld	a4,-24(s0)
    80002eda:	e7b8                	sd	a4,72(a5)
  return 0;
    80002edc:	4781                	li	a5,0
}
    80002ede:	853e                	mv	a0,a5
    80002ee0:	70a2                	ld	ra,40(sp)
    80002ee2:	7402                	ld	s0,32(sp)
    80002ee4:	6145                	addi	sp,sp,48
    80002ee6:	8082                	ret

0000000080002ee8 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002ee8:	7179                	addi	sp,sp,-48
    80002eea:	f406                	sd	ra,40(sp)
    80002eec:	f022                	sd	s0,32(sp)
    80002eee:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002ef0:	00000097          	auipc	ra,0x0
    80002ef4:	b28080e7          	jalr	-1240(ra) # 80002a18 <myproc>
    80002ef8:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002efc:	00000097          	auipc	ra,0x0
    80002f00:	bb6080e7          	jalr	-1098(ra) # 80002ab2 <allocproc>
    80002f04:	fca43c23          	sd	a0,-40(s0)
    80002f08:	fd843783          	ld	a5,-40(s0)
    80002f0c:	e399                	bnez	a5,80002f12 <fork+0x2a>
    return -1;
    80002f0e:	57fd                	li	a5,-1
    80002f10:	aab5                	j	8000308c <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002f12:	fe043783          	ld	a5,-32(s0)
    80002f16:	6bb8                	ld	a4,80(a5)
    80002f18:	fd843783          	ld	a5,-40(s0)
    80002f1c:	6bb4                	ld	a3,80(a5)
    80002f1e:	fe043783          	ld	a5,-32(s0)
    80002f22:	67bc                	ld	a5,72(a5)
    80002f24:	863e                	mv	a2,a5
    80002f26:	85b6                	mv	a1,a3
    80002f28:	853a                	mv	a0,a4
    80002f2a:	fffff097          	auipc	ra,0xfffff
    80002f2e:	43e080e7          	jalr	1086(ra) # 80002368 <uvmcopy>
    80002f32:	87aa                	mv	a5,a0
    80002f34:	0207d163          	bgez	a5,80002f56 <fork+0x6e>
    freeproc(np);
    80002f38:	fd843503          	ld	a0,-40(s0)
    80002f3c:	00000097          	auipc	ra,0x0
    80002f40:	ca0080e7          	jalr	-864(ra) # 80002bdc <freeproc>
    release(&np->lock);
    80002f44:	fd843783          	ld	a5,-40(s0)
    80002f48:	853e                	mv	a0,a5
    80002f4a:	ffffe097          	auipc	ra,0xffffe
    80002f4e:	456080e7          	jalr	1110(ra) # 800013a0 <release>
    return -1;
    80002f52:	57fd                	li	a5,-1
    80002f54:	aa25                	j	8000308c <fork+0x1a4>
  }
  np->sz = p->sz;
    80002f56:	fe043783          	ld	a5,-32(s0)
    80002f5a:	67b8                	ld	a4,72(a5)
    80002f5c:	fd843783          	ld	a5,-40(s0)
    80002f60:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002f62:	fe043783          	ld	a5,-32(s0)
    80002f66:	6fb8                	ld	a4,88(a5)
    80002f68:	fd843783          	ld	a5,-40(s0)
    80002f6c:	6fbc                	ld	a5,88(a5)
    80002f6e:	86be                	mv	a3,a5
    80002f70:	12000793          	li	a5,288
    80002f74:	863e                	mv	a2,a5
    80002f76:	85ba                	mv	a1,a4
    80002f78:	8536                	mv	a0,a3
    80002f7a:	ffffe097          	auipc	ra,0xffffe
    80002f7e:	756080e7          	jalr	1878(ra) # 800016d0 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002f82:	fd843783          	ld	a5,-40(s0)
    80002f86:	6fbc                	ld	a5,88(a5)
    80002f88:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002f8c:	fe042623          	sw	zero,-20(s0)
    80002f90:	a0a9                	j	80002fda <fork+0xf2>
    if(p->ofile[i])
    80002f92:	fe043703          	ld	a4,-32(s0)
    80002f96:	fec42783          	lw	a5,-20(s0)
    80002f9a:	07e9                	addi	a5,a5,26
    80002f9c:	078e                	slli	a5,a5,0x3
    80002f9e:	97ba                	add	a5,a5,a4
    80002fa0:	639c                	ld	a5,0(a5)
    80002fa2:	c79d                	beqz	a5,80002fd0 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002fa4:	fe043703          	ld	a4,-32(s0)
    80002fa8:	fec42783          	lw	a5,-20(s0)
    80002fac:	07e9                	addi	a5,a5,26
    80002fae:	078e                	slli	a5,a5,0x3
    80002fb0:	97ba                	add	a5,a5,a4
    80002fb2:	639c                	ld	a5,0(a5)
    80002fb4:	853e                	mv	a0,a5
    80002fb6:	00004097          	auipc	ra,0x4
    80002fba:	9d2080e7          	jalr	-1582(ra) # 80006988 <filedup>
    80002fbe:	86aa                	mv	a3,a0
    80002fc0:	fd843703          	ld	a4,-40(s0)
    80002fc4:	fec42783          	lw	a5,-20(s0)
    80002fc8:	07e9                	addi	a5,a5,26
    80002fca:	078e                	slli	a5,a5,0x3
    80002fcc:	97ba                	add	a5,a5,a4
    80002fce:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002fd0:	fec42783          	lw	a5,-20(s0)
    80002fd4:	2785                	addiw	a5,a5,1
    80002fd6:	fef42623          	sw	a5,-20(s0)
    80002fda:	fec42783          	lw	a5,-20(s0)
    80002fde:	0007871b          	sext.w	a4,a5
    80002fe2:	47bd                	li	a5,15
    80002fe4:	fae7d7e3          	bge	a5,a4,80002f92 <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002fe8:	fe043783          	ld	a5,-32(s0)
    80002fec:	1507b783          	ld	a5,336(a5)
    80002ff0:	853e                	mv	a0,a5
    80002ff2:	00002097          	auipc	ra,0x2
    80002ff6:	28c080e7          	jalr	652(ra) # 8000527e <idup>
    80002ffa:	872a                	mv	a4,a0
    80002ffc:	fd843783          	ld	a5,-40(s0)
    80003000:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80003004:	fd843783          	ld	a5,-40(s0)
    80003008:	15878713          	addi	a4,a5,344
    8000300c:	fe043783          	ld	a5,-32(s0)
    80003010:	15878793          	addi	a5,a5,344
    80003014:	4641                	li	a2,16
    80003016:	85be                	mv	a1,a5
    80003018:	853a                	mv	a0,a4
    8000301a:	ffffe097          	auipc	ra,0xffffe
    8000301e:	7fa080e7          	jalr	2042(ra) # 80001814 <safestrcpy>

  pid = np->pid;
    80003022:	fd843783          	ld	a5,-40(s0)
    80003026:	5b9c                	lw	a5,48(a5)
    80003028:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    8000302c:	fd843783          	ld	a5,-40(s0)
    80003030:	853e                	mv	a0,a5
    80003032:	ffffe097          	auipc	ra,0xffffe
    80003036:	36e080e7          	jalr	878(ra) # 800013a0 <release>

  acquire(&wait_lock);
    8000303a:	00018517          	auipc	a0,0x18
    8000303e:	a1650513          	addi	a0,a0,-1514 # 8001aa50 <wait_lock>
    80003042:	ffffe097          	auipc	ra,0xffffe
    80003046:	2fa080e7          	jalr	762(ra) # 8000133c <acquire>
  np->parent = p;
    8000304a:	fd843783          	ld	a5,-40(s0)
    8000304e:	fe043703          	ld	a4,-32(s0)
    80003052:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    80003054:	00018517          	auipc	a0,0x18
    80003058:	9fc50513          	addi	a0,a0,-1540 # 8001aa50 <wait_lock>
    8000305c:	ffffe097          	auipc	ra,0xffffe
    80003060:	344080e7          	jalr	836(ra) # 800013a0 <release>

  acquire(&np->lock);
    80003064:	fd843783          	ld	a5,-40(s0)
    80003068:	853e                	mv	a0,a5
    8000306a:	ffffe097          	auipc	ra,0xffffe
    8000306e:	2d2080e7          	jalr	722(ra) # 8000133c <acquire>
  np->state = RUNNABLE;
    80003072:	fd843783          	ld	a5,-40(s0)
    80003076:	470d                	li	a4,3
    80003078:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    8000307a:	fd843783          	ld	a5,-40(s0)
    8000307e:	853e                	mv	a0,a5
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	320080e7          	jalr	800(ra) # 800013a0 <release>

  return pid;
    80003088:	fd442783          	lw	a5,-44(s0)
}
    8000308c:	853e                	mv	a0,a5
    8000308e:	70a2                	ld	ra,40(sp)
    80003090:	7402                	ld	s0,32(sp)
    80003092:	6145                	addi	sp,sp,48
    80003094:	8082                	ret

0000000080003096 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80003096:	7179                	addi	sp,sp,-48
    80003098:	f406                	sd	ra,40(sp)
    8000309a:	f022                	sd	s0,32(sp)
    8000309c:	1800                	addi	s0,sp,48
    8000309e:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    800030a2:	00012797          	auipc	a5,0x12
    800030a6:	f9678793          	addi	a5,a5,-106 # 80015038 <proc>
    800030aa:	fef43423          	sd	a5,-24(s0)
    800030ae:	a081                	j	800030ee <reparent+0x58>
    if(pp->parent == p){
    800030b0:	fe843783          	ld	a5,-24(s0)
    800030b4:	7f9c                	ld	a5,56(a5)
    800030b6:	fd843703          	ld	a4,-40(s0)
    800030ba:	02f71463          	bne	a4,a5,800030e2 <reparent+0x4c>
      pp->parent = initproc;
    800030be:	0000a797          	auipc	a5,0xa
    800030c2:	90278793          	addi	a5,a5,-1790 # 8000c9c0 <initproc>
    800030c6:	6398                	ld	a4,0(a5)
    800030c8:	fe843783          	ld	a5,-24(s0)
    800030cc:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    800030ce:	0000a797          	auipc	a5,0xa
    800030d2:	8f278793          	addi	a5,a5,-1806 # 8000c9c0 <initproc>
    800030d6:	639c                	ld	a5,0(a5)
    800030d8:	853e                	mv	a0,a5
    800030da:	00000097          	auipc	ra,0x0
    800030de:	57c080e7          	jalr	1404(ra) # 80003656 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    800030e2:	fe843783          	ld	a5,-24(s0)
    800030e6:	16878793          	addi	a5,a5,360
    800030ea:	fef43423          	sd	a5,-24(s0)
    800030ee:	fe843703          	ld	a4,-24(s0)
    800030f2:	00018797          	auipc	a5,0x18
    800030f6:	94678793          	addi	a5,a5,-1722 # 8001aa38 <pid_lock>
    800030fa:	faf76be3          	bltu	a4,a5,800030b0 <reparent+0x1a>
    }
  }
}
    800030fe:	0001                	nop
    80003100:	0001                	nop
    80003102:	70a2                	ld	ra,40(sp)
    80003104:	7402                	ld	s0,32(sp)
    80003106:	6145                	addi	sp,sp,48
    80003108:	8082                	ret

000000008000310a <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    8000310a:	7139                	addi	sp,sp,-64
    8000310c:	fc06                	sd	ra,56(sp)
    8000310e:	f822                	sd	s0,48(sp)
    80003110:	0080                	addi	s0,sp,64
    80003112:	87aa                	mv	a5,a0
    80003114:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003118:	00000097          	auipc	ra,0x0
    8000311c:	900080e7          	jalr	-1792(ra) # 80002a18 <myproc>
    80003120:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    80003124:	0000a797          	auipc	a5,0xa
    80003128:	89c78793          	addi	a5,a5,-1892 # 8000c9c0 <initproc>
    8000312c:	639c                	ld	a5,0(a5)
    8000312e:	fe043703          	ld	a4,-32(s0)
    80003132:	00f71a63          	bne	a4,a5,80003146 <exit+0x3c>
    panic("init exiting");
    80003136:	00009517          	auipc	a0,0x9
    8000313a:	0e250513          	addi	a0,a0,226 # 8000c218 <etext+0x218>
    8000313e:	ffffe097          	auipc	ra,0xffffe
    80003142:	b4e080e7          	jalr	-1202(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80003146:	fe042623          	sw	zero,-20(s0)
    8000314a:	a881                	j	8000319a <exit+0x90>
    if(p->ofile[fd]){
    8000314c:	fe043703          	ld	a4,-32(s0)
    80003150:	fec42783          	lw	a5,-20(s0)
    80003154:	07e9                	addi	a5,a5,26
    80003156:	078e                	slli	a5,a5,0x3
    80003158:	97ba                	add	a5,a5,a4
    8000315a:	639c                	ld	a5,0(a5)
    8000315c:	cb95                	beqz	a5,80003190 <exit+0x86>
      struct file *f = p->ofile[fd];
    8000315e:	fe043703          	ld	a4,-32(s0)
    80003162:	fec42783          	lw	a5,-20(s0)
    80003166:	07e9                	addi	a5,a5,26
    80003168:	078e                	slli	a5,a5,0x3
    8000316a:	97ba                	add	a5,a5,a4
    8000316c:	639c                	ld	a5,0(a5)
    8000316e:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    80003172:	fd843503          	ld	a0,-40(s0)
    80003176:	00004097          	auipc	ra,0x4
    8000317a:	878080e7          	jalr	-1928(ra) # 800069ee <fileclose>
      p->ofile[fd] = 0;
    8000317e:	fe043703          	ld	a4,-32(s0)
    80003182:	fec42783          	lw	a5,-20(s0)
    80003186:	07e9                	addi	a5,a5,26
    80003188:	078e                	slli	a5,a5,0x3
    8000318a:	97ba                	add	a5,a5,a4
    8000318c:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80003190:	fec42783          	lw	a5,-20(s0)
    80003194:	2785                	addiw	a5,a5,1
    80003196:	fef42623          	sw	a5,-20(s0)
    8000319a:	fec42783          	lw	a5,-20(s0)
    8000319e:	0007871b          	sext.w	a4,a5
    800031a2:	47bd                	li	a5,15
    800031a4:	fae7d4e3          	bge	a5,a4,8000314c <exit+0x42>
    }
  }

  begin_op();
    800031a8:	00003097          	auipc	ra,0x3
    800031ac:	1ac080e7          	jalr	428(ra) # 80006354 <begin_op>
  iput(p->cwd);
    800031b0:	fe043783          	ld	a5,-32(s0)
    800031b4:	1507b783          	ld	a5,336(a5)
    800031b8:	853e                	mv	a0,a5
    800031ba:	00002097          	auipc	ra,0x2
    800031be:	29e080e7          	jalr	670(ra) # 80005458 <iput>
  end_op();
    800031c2:	00003097          	auipc	ra,0x3
    800031c6:	254080e7          	jalr	596(ra) # 80006416 <end_op>
  p->cwd = 0;
    800031ca:	fe043783          	ld	a5,-32(s0)
    800031ce:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    800031d2:	00018517          	auipc	a0,0x18
    800031d6:	87e50513          	addi	a0,a0,-1922 # 8001aa50 <wait_lock>
    800031da:	ffffe097          	auipc	ra,0xffffe
    800031de:	162080e7          	jalr	354(ra) # 8000133c <acquire>

  // Give any children to init.
  reparent(p);
    800031e2:	fe043503          	ld	a0,-32(s0)
    800031e6:	00000097          	auipc	ra,0x0
    800031ea:	eb0080e7          	jalr	-336(ra) # 80003096 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    800031ee:	fe043783          	ld	a5,-32(s0)
    800031f2:	7f9c                	ld	a5,56(a5)
    800031f4:	853e                	mv	a0,a5
    800031f6:	00000097          	auipc	ra,0x0
    800031fa:	460080e7          	jalr	1120(ra) # 80003656 <wakeup>
  
  acquire(&p->lock);
    800031fe:	fe043783          	ld	a5,-32(s0)
    80003202:	853e                	mv	a0,a5
    80003204:	ffffe097          	auipc	ra,0xffffe
    80003208:	138080e7          	jalr	312(ra) # 8000133c <acquire>

  p->xstate = status;
    8000320c:	fe043783          	ld	a5,-32(s0)
    80003210:	fcc42703          	lw	a4,-52(s0)
    80003214:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003216:	fe043783          	ld	a5,-32(s0)
    8000321a:	4715                	li	a4,5
    8000321c:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    8000321e:	00018517          	auipc	a0,0x18
    80003222:	83250513          	addi	a0,a0,-1998 # 8001aa50 <wait_lock>
    80003226:	ffffe097          	auipc	ra,0xffffe
    8000322a:	17a080e7          	jalr	378(ra) # 800013a0 <release>

  // Jump into the scheduler, never to return.
  sched();
    8000322e:	00000097          	auipc	ra,0x0
    80003232:	230080e7          	jalr	560(ra) # 8000345e <sched>
  panic("zombie exit");
    80003236:	00009517          	auipc	a0,0x9
    8000323a:	ff250513          	addi	a0,a0,-14 # 8000c228 <etext+0x228>
    8000323e:	ffffe097          	auipc	ra,0xffffe
    80003242:	a4e080e7          	jalr	-1458(ra) # 80000c8c <panic>

0000000080003246 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    80003246:	7139                	addi	sp,sp,-64
    80003248:	fc06                	sd	ra,56(sp)
    8000324a:	f822                	sd	s0,48(sp)
    8000324c:	0080                	addi	s0,sp,64
    8000324e:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    80003252:	fffff097          	auipc	ra,0xfffff
    80003256:	7c6080e7          	jalr	1990(ra) # 80002a18 <myproc>
    8000325a:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    8000325e:	00017517          	auipc	a0,0x17
    80003262:	7f250513          	addi	a0,a0,2034 # 8001aa50 <wait_lock>
    80003266:	ffffe097          	auipc	ra,0xffffe
    8000326a:	0d6080e7          	jalr	214(ra) # 8000133c <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    8000326e:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003272:	00012797          	auipc	a5,0x12
    80003276:	dc678793          	addi	a5,a5,-570 # 80015038 <proc>
    8000327a:	fef43423          	sd	a5,-24(s0)
    8000327e:	a8d1                	j	80003352 <wait+0x10c>
      if(pp->parent == p){
    80003280:	fe843783          	ld	a5,-24(s0)
    80003284:	7f9c                	ld	a5,56(a5)
    80003286:	fd843703          	ld	a4,-40(s0)
    8000328a:	0af71e63          	bne	a4,a5,80003346 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    8000328e:	fe843783          	ld	a5,-24(s0)
    80003292:	853e                	mv	a0,a5
    80003294:	ffffe097          	auipc	ra,0xffffe
    80003298:	0a8080e7          	jalr	168(ra) # 8000133c <acquire>

        havekids = 1;
    8000329c:	4785                	li	a5,1
    8000329e:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    800032a2:	fe843783          	ld	a5,-24(s0)
    800032a6:	4f9c                	lw	a5,24(a5)
    800032a8:	873e                	mv	a4,a5
    800032aa:	4795                	li	a5,5
    800032ac:	08f71663          	bne	a4,a5,80003338 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    800032b0:	fe843783          	ld	a5,-24(s0)
    800032b4:	5b9c                	lw	a5,48(a5)
    800032b6:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    800032ba:	fc843783          	ld	a5,-56(s0)
    800032be:	c7a9                	beqz	a5,80003308 <wait+0xc2>
    800032c0:	fd843783          	ld	a5,-40(s0)
    800032c4:	6bb8                	ld	a4,80(a5)
    800032c6:	fe843783          	ld	a5,-24(s0)
    800032ca:	02c78793          	addi	a5,a5,44
    800032ce:	4691                	li	a3,4
    800032d0:	863e                	mv	a2,a5
    800032d2:	fc843583          	ld	a1,-56(s0)
    800032d6:	853a                	mv	a0,a4
    800032d8:	fffff097          	auipc	ra,0xfffff
    800032dc:	20a080e7          	jalr	522(ra) # 800024e2 <copyout>
    800032e0:	87aa                	mv	a5,a0
    800032e2:	0207d363          	bgez	a5,80003308 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    800032e6:	fe843783          	ld	a5,-24(s0)
    800032ea:	853e                	mv	a0,a5
    800032ec:	ffffe097          	auipc	ra,0xffffe
    800032f0:	0b4080e7          	jalr	180(ra) # 800013a0 <release>
            release(&wait_lock);
    800032f4:	00017517          	auipc	a0,0x17
    800032f8:	75c50513          	addi	a0,a0,1884 # 8001aa50 <wait_lock>
    800032fc:	ffffe097          	auipc	ra,0xffffe
    80003300:	0a4080e7          	jalr	164(ra) # 800013a0 <release>
            return -1;
    80003304:	57fd                	li	a5,-1
    80003306:	a879                	j	800033a4 <wait+0x15e>
          }
          freeproc(pp);
    80003308:	fe843503          	ld	a0,-24(s0)
    8000330c:	00000097          	auipc	ra,0x0
    80003310:	8d0080e7          	jalr	-1840(ra) # 80002bdc <freeproc>
          release(&pp->lock);
    80003314:	fe843783          	ld	a5,-24(s0)
    80003318:	853e                	mv	a0,a5
    8000331a:	ffffe097          	auipc	ra,0xffffe
    8000331e:	086080e7          	jalr	134(ra) # 800013a0 <release>
          release(&wait_lock);
    80003322:	00017517          	auipc	a0,0x17
    80003326:	72e50513          	addi	a0,a0,1838 # 8001aa50 <wait_lock>
    8000332a:	ffffe097          	auipc	ra,0xffffe
    8000332e:	076080e7          	jalr	118(ra) # 800013a0 <release>
          return pid;
    80003332:	fd442783          	lw	a5,-44(s0)
    80003336:	a0bd                	j	800033a4 <wait+0x15e>
        }
        release(&pp->lock);
    80003338:	fe843783          	ld	a5,-24(s0)
    8000333c:	853e                	mv	a0,a5
    8000333e:	ffffe097          	auipc	ra,0xffffe
    80003342:	062080e7          	jalr	98(ra) # 800013a0 <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003346:	fe843783          	ld	a5,-24(s0)
    8000334a:	16878793          	addi	a5,a5,360
    8000334e:	fef43423          	sd	a5,-24(s0)
    80003352:	fe843703          	ld	a4,-24(s0)
    80003356:	00017797          	auipc	a5,0x17
    8000335a:	6e278793          	addi	a5,a5,1762 # 8001aa38 <pid_lock>
    8000335e:	f2f761e3          	bltu	a4,a5,80003280 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    80003362:	fe442783          	lw	a5,-28(s0)
    80003366:	2781                	sext.w	a5,a5
    80003368:	cb89                	beqz	a5,8000337a <wait+0x134>
    8000336a:	fd843503          	ld	a0,-40(s0)
    8000336e:	00000097          	auipc	ra,0x0
    80003372:	47a080e7          	jalr	1146(ra) # 800037e8 <killed>
    80003376:	87aa                	mv	a5,a0
    80003378:	cb99                	beqz	a5,8000338e <wait+0x148>
      release(&wait_lock);
    8000337a:	00017517          	auipc	a0,0x17
    8000337e:	6d650513          	addi	a0,a0,1750 # 8001aa50 <wait_lock>
    80003382:	ffffe097          	auipc	ra,0xffffe
    80003386:	01e080e7          	jalr	30(ra) # 800013a0 <release>
      return -1;
    8000338a:	57fd                	li	a5,-1
    8000338c:	a821                	j	800033a4 <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    8000338e:	00017597          	auipc	a1,0x17
    80003392:	6c258593          	addi	a1,a1,1730 # 8001aa50 <wait_lock>
    80003396:	fd843503          	ld	a0,-40(s0)
    8000339a:	00000097          	auipc	ra,0x0
    8000339e:	240080e7          	jalr	576(ra) # 800035da <sleep>
    havekids = 0;
    800033a2:	b5f1                	j	8000326e <wait+0x28>
  }
}
    800033a4:	853e                	mv	a0,a5
    800033a6:	70e2                	ld	ra,56(sp)
    800033a8:	7442                	ld	s0,48(sp)
    800033aa:	6121                	addi	sp,sp,64
    800033ac:	8082                	ret

00000000800033ae <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    800033ae:	1101                	addi	sp,sp,-32
    800033b0:	ec06                	sd	ra,24(sp)
    800033b2:	e822                	sd	s0,16(sp)
    800033b4:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    800033b6:	fffff097          	auipc	ra,0xfffff
    800033ba:	628080e7          	jalr	1576(ra) # 800029de <mycpu>
    800033be:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    800033c2:	fe043783          	ld	a5,-32(s0)
    800033c6:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    800033ca:	fffff097          	auipc	ra,0xfffff
    800033ce:	3f6080e7          	jalr	1014(ra) # 800027c0 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    800033d2:	00012797          	auipc	a5,0x12
    800033d6:	c6678793          	addi	a5,a5,-922 # 80015038 <proc>
    800033da:	fef43423          	sd	a5,-24(s0)
    800033de:	a0bd                	j	8000344c <scheduler+0x9e>
      acquire(&p->lock);
    800033e0:	fe843783          	ld	a5,-24(s0)
    800033e4:	853e                	mv	a0,a5
    800033e6:	ffffe097          	auipc	ra,0xffffe
    800033ea:	f56080e7          	jalr	-170(ra) # 8000133c <acquire>
      if(p->state == RUNNABLE) {
    800033ee:	fe843783          	ld	a5,-24(s0)
    800033f2:	4f9c                	lw	a5,24(a5)
    800033f4:	873e                	mv	a4,a5
    800033f6:	478d                	li	a5,3
    800033f8:	02f71d63          	bne	a4,a5,80003432 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    800033fc:	fe843783          	ld	a5,-24(s0)
    80003400:	4711                	li	a4,4
    80003402:	cf98                	sw	a4,24(a5)
        c->proc = p;
    80003404:	fe043783          	ld	a5,-32(s0)
    80003408:	fe843703          	ld	a4,-24(s0)
    8000340c:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    8000340e:	fe043783          	ld	a5,-32(s0)
    80003412:	00878713          	addi	a4,a5,8
    80003416:	fe843783          	ld	a5,-24(s0)
    8000341a:	06078793          	addi	a5,a5,96
    8000341e:	85be                	mv	a1,a5
    80003420:	853a                	mv	a0,a4
    80003422:	00000097          	auipc	ra,0x0
    80003426:	5d0080e7          	jalr	1488(ra) # 800039f2 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    8000342a:	fe043783          	ld	a5,-32(s0)
    8000342e:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    80003432:	fe843783          	ld	a5,-24(s0)
    80003436:	853e                	mv	a0,a5
    80003438:	ffffe097          	auipc	ra,0xffffe
    8000343c:	f68080e7          	jalr	-152(ra) # 800013a0 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    80003440:	fe843783          	ld	a5,-24(s0)
    80003444:	16878793          	addi	a5,a5,360
    80003448:	fef43423          	sd	a5,-24(s0)
    8000344c:	fe843703          	ld	a4,-24(s0)
    80003450:	00017797          	auipc	a5,0x17
    80003454:	5e878793          	addi	a5,a5,1512 # 8001aa38 <pid_lock>
    80003458:	f8f764e3          	bltu	a4,a5,800033e0 <scheduler+0x32>
    intr_on();
    8000345c:	b7bd                	j	800033ca <scheduler+0x1c>

000000008000345e <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    8000345e:	7179                	addi	sp,sp,-48
    80003460:	f406                	sd	ra,40(sp)
    80003462:	f022                	sd	s0,32(sp)
    80003464:	ec26                	sd	s1,24(sp)
    80003466:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    80003468:	fffff097          	auipc	ra,0xfffff
    8000346c:	5b0080e7          	jalr	1456(ra) # 80002a18 <myproc>
    80003470:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    80003474:	fd843783          	ld	a5,-40(s0)
    80003478:	853e                	mv	a0,a5
    8000347a:	ffffe097          	auipc	ra,0xffffe
    8000347e:	f7c080e7          	jalr	-132(ra) # 800013f6 <holding>
    80003482:	87aa                	mv	a5,a0
    80003484:	eb89                	bnez	a5,80003496 <sched+0x38>
    panic("sched p->lock");
    80003486:	00009517          	auipc	a0,0x9
    8000348a:	db250513          	addi	a0,a0,-590 # 8000c238 <etext+0x238>
    8000348e:	ffffd097          	auipc	ra,0xffffd
    80003492:	7fe080e7          	jalr	2046(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    80003496:	fffff097          	auipc	ra,0xfffff
    8000349a:	548080e7          	jalr	1352(ra) # 800029de <mycpu>
    8000349e:	87aa                	mv	a5,a0
    800034a0:	5fbc                	lw	a5,120(a5)
    800034a2:	873e                	mv	a4,a5
    800034a4:	4785                	li	a5,1
    800034a6:	00f70a63          	beq	a4,a5,800034ba <sched+0x5c>
    panic("sched locks");
    800034aa:	00009517          	auipc	a0,0x9
    800034ae:	d9e50513          	addi	a0,a0,-610 # 8000c248 <etext+0x248>
    800034b2:	ffffd097          	auipc	ra,0xffffd
    800034b6:	7da080e7          	jalr	2010(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    800034ba:	fd843783          	ld	a5,-40(s0)
    800034be:	4f9c                	lw	a5,24(a5)
    800034c0:	873e                	mv	a4,a5
    800034c2:	4791                	li	a5,4
    800034c4:	00f71a63          	bne	a4,a5,800034d8 <sched+0x7a>
    panic("sched running");
    800034c8:	00009517          	auipc	a0,0x9
    800034cc:	d9050513          	addi	a0,a0,-624 # 8000c258 <etext+0x258>
    800034d0:	ffffd097          	auipc	ra,0xffffd
    800034d4:	7bc080e7          	jalr	1980(ra) # 80000c8c <panic>
  if(intr_get())
    800034d8:	fffff097          	auipc	ra,0xfffff
    800034dc:	312080e7          	jalr	786(ra) # 800027ea <intr_get>
    800034e0:	87aa                	mv	a5,a0
    800034e2:	cb89                	beqz	a5,800034f4 <sched+0x96>
    panic("sched interruptible");
    800034e4:	00009517          	auipc	a0,0x9
    800034e8:	d8450513          	addi	a0,a0,-636 # 8000c268 <etext+0x268>
    800034ec:	ffffd097          	auipc	ra,0xffffd
    800034f0:	7a0080e7          	jalr	1952(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    800034f4:	fffff097          	auipc	ra,0xfffff
    800034f8:	4ea080e7          	jalr	1258(ra) # 800029de <mycpu>
    800034fc:	87aa                	mv	a5,a0
    800034fe:	5ffc                	lw	a5,124(a5)
    80003500:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003504:	fd843783          	ld	a5,-40(s0)
    80003508:	06078493          	addi	s1,a5,96
    8000350c:	fffff097          	auipc	ra,0xfffff
    80003510:	4d2080e7          	jalr	1234(ra) # 800029de <mycpu>
    80003514:	87aa                	mv	a5,a0
    80003516:	07a1                	addi	a5,a5,8
    80003518:	85be                	mv	a1,a5
    8000351a:	8526                	mv	a0,s1
    8000351c:	00000097          	auipc	ra,0x0
    80003520:	4d6080e7          	jalr	1238(ra) # 800039f2 <swtch>
  mycpu()->intena = intena;
    80003524:	fffff097          	auipc	ra,0xfffff
    80003528:	4ba080e7          	jalr	1210(ra) # 800029de <mycpu>
    8000352c:	872a                	mv	a4,a0
    8000352e:	fd442783          	lw	a5,-44(s0)
    80003532:	df7c                	sw	a5,124(a4)
}
    80003534:	0001                	nop
    80003536:	70a2                	ld	ra,40(sp)
    80003538:	7402                	ld	s0,32(sp)
    8000353a:	64e2                	ld	s1,24(sp)
    8000353c:	6145                	addi	sp,sp,48
    8000353e:	8082                	ret

0000000080003540 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    80003540:	1101                	addi	sp,sp,-32
    80003542:	ec06                	sd	ra,24(sp)
    80003544:	e822                	sd	s0,16(sp)
    80003546:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80003548:	fffff097          	auipc	ra,0xfffff
    8000354c:	4d0080e7          	jalr	1232(ra) # 80002a18 <myproc>
    80003550:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003554:	fe843783          	ld	a5,-24(s0)
    80003558:	853e                	mv	a0,a5
    8000355a:	ffffe097          	auipc	ra,0xffffe
    8000355e:	de2080e7          	jalr	-542(ra) # 8000133c <acquire>
  p->state = RUNNABLE;
    80003562:	fe843783          	ld	a5,-24(s0)
    80003566:	470d                	li	a4,3
    80003568:	cf98                	sw	a4,24(a5)
  sched();
    8000356a:	00000097          	auipc	ra,0x0
    8000356e:	ef4080e7          	jalr	-268(ra) # 8000345e <sched>
  release(&p->lock);
    80003572:	fe843783          	ld	a5,-24(s0)
    80003576:	853e                	mv	a0,a5
    80003578:	ffffe097          	auipc	ra,0xffffe
    8000357c:	e28080e7          	jalr	-472(ra) # 800013a0 <release>
}
    80003580:	0001                	nop
    80003582:	60e2                	ld	ra,24(sp)
    80003584:	6442                	ld	s0,16(sp)
    80003586:	6105                	addi	sp,sp,32
    80003588:	8082                	ret

000000008000358a <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    8000358a:	1141                	addi	sp,sp,-16
    8000358c:	e406                	sd	ra,8(sp)
    8000358e:	e022                	sd	s0,0(sp)
    80003590:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003592:	fffff097          	auipc	ra,0xfffff
    80003596:	486080e7          	jalr	1158(ra) # 80002a18 <myproc>
    8000359a:	87aa                	mv	a5,a0
    8000359c:	853e                	mv	a0,a5
    8000359e:	ffffe097          	auipc	ra,0xffffe
    800035a2:	e02080e7          	jalr	-510(ra) # 800013a0 <release>

  if (first) {
    800035a6:	00009797          	auipc	a5,0x9
    800035aa:	29e78793          	addi	a5,a5,670 # 8000c844 <first.1718>
    800035ae:	439c                	lw	a5,0(a5)
    800035b0:	cf81                	beqz	a5,800035c8 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    800035b2:	00009797          	auipc	a5,0x9
    800035b6:	29278793          	addi	a5,a5,658 # 8000c844 <first.1718>
    800035ba:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    800035be:	4505                	li	a0,1
    800035c0:	00001097          	auipc	ra,0x1
    800035c4:	594080e7          	jalr	1428(ra) # 80004b54 <fsinit>
  }

  usertrapret();
    800035c8:	00001097          	auipc	ra,0x1
    800035cc:	828080e7          	jalr	-2008(ra) # 80003df0 <usertrapret>
}
    800035d0:	0001                	nop
    800035d2:	60a2                	ld	ra,8(sp)
    800035d4:	6402                	ld	s0,0(sp)
    800035d6:	0141                	addi	sp,sp,16
    800035d8:	8082                	ret

00000000800035da <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    800035da:	7179                	addi	sp,sp,-48
    800035dc:	f406                	sd	ra,40(sp)
    800035de:	f022                	sd	s0,32(sp)
    800035e0:	1800                	addi	s0,sp,48
    800035e2:	fca43c23          	sd	a0,-40(s0)
    800035e6:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800035ea:	fffff097          	auipc	ra,0xfffff
    800035ee:	42e080e7          	jalr	1070(ra) # 80002a18 <myproc>
    800035f2:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    800035f6:	fe843783          	ld	a5,-24(s0)
    800035fa:	853e                	mv	a0,a5
    800035fc:	ffffe097          	auipc	ra,0xffffe
    80003600:	d40080e7          	jalr	-704(ra) # 8000133c <acquire>
  release(lk);
    80003604:	fd043503          	ld	a0,-48(s0)
    80003608:	ffffe097          	auipc	ra,0xffffe
    8000360c:	d98080e7          	jalr	-616(ra) # 800013a0 <release>

  // Go to sleep.
  p->chan = chan;
    80003610:	fe843783          	ld	a5,-24(s0)
    80003614:	fd843703          	ld	a4,-40(s0)
    80003618:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    8000361a:	fe843783          	ld	a5,-24(s0)
    8000361e:	4709                	li	a4,2
    80003620:	cf98                	sw	a4,24(a5)

  sched();
    80003622:	00000097          	auipc	ra,0x0
    80003626:	e3c080e7          	jalr	-452(ra) # 8000345e <sched>

  // Tidy up.
  p->chan = 0;
    8000362a:	fe843783          	ld	a5,-24(s0)
    8000362e:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    80003632:	fe843783          	ld	a5,-24(s0)
    80003636:	853e                	mv	a0,a5
    80003638:	ffffe097          	auipc	ra,0xffffe
    8000363c:	d68080e7          	jalr	-664(ra) # 800013a0 <release>
  acquire(lk);
    80003640:	fd043503          	ld	a0,-48(s0)
    80003644:	ffffe097          	auipc	ra,0xffffe
    80003648:	cf8080e7          	jalr	-776(ra) # 8000133c <acquire>
}
    8000364c:	0001                	nop
    8000364e:	70a2                	ld	ra,40(sp)
    80003650:	7402                	ld	s0,32(sp)
    80003652:	6145                	addi	sp,sp,48
    80003654:	8082                	ret

0000000080003656 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    80003656:	7179                	addi	sp,sp,-48
    80003658:	f406                	sd	ra,40(sp)
    8000365a:	f022                	sd	s0,32(sp)
    8000365c:	1800                	addi	s0,sp,48
    8000365e:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80003662:	00012797          	auipc	a5,0x12
    80003666:	9d678793          	addi	a5,a5,-1578 # 80015038 <proc>
    8000366a:	fef43423          	sd	a5,-24(s0)
    8000366e:	a051                	j	800036f2 <wakeup+0x9c>
    if(p != myproc()){
    80003670:	fffff097          	auipc	ra,0xfffff
    80003674:	3a8080e7          	jalr	936(ra) # 80002a18 <myproc>
    80003678:	872a                	mv	a4,a0
    8000367a:	fe843783          	ld	a5,-24(s0)
    8000367e:	06e78463          	beq	a5,a4,800036e6 <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    80003682:	fe843783          	ld	a5,-24(s0)
    80003686:	853e                	mv	a0,a5
    80003688:	ffffe097          	auipc	ra,0xffffe
    8000368c:	d6e080e7          	jalr	-658(ra) # 800013f6 <holding>
    80003690:	87aa                	mv	a5,a0
    80003692:	cb81                	beqz	a5,800036a2 <wakeup+0x4c>
    80003694:	fe843783          	ld	a5,-24(s0)
    80003698:	4f9c                	lw	a5,24(a5)
    8000369a:	873e                	mv	a4,a5
    8000369c:	4785                	li	a5,1
    8000369e:	04f70363          	beq	a4,a5,800036e4 <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    800036a2:	fe843783          	ld	a5,-24(s0)
    800036a6:	853e                	mv	a0,a5
    800036a8:	ffffe097          	auipc	ra,0xffffe
    800036ac:	c94080e7          	jalr	-876(ra) # 8000133c <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    800036b0:	fe843783          	ld	a5,-24(s0)
    800036b4:	4f9c                	lw	a5,24(a5)
    800036b6:	873e                	mv	a4,a5
    800036b8:	4789                	li	a5,2
    800036ba:	00f71d63          	bne	a4,a5,800036d4 <wakeup+0x7e>
    800036be:	fe843783          	ld	a5,-24(s0)
    800036c2:	739c                	ld	a5,32(a5)
    800036c4:	fd843703          	ld	a4,-40(s0)
    800036c8:	00f71663          	bne	a4,a5,800036d4 <wakeup+0x7e>
        p->state = RUNNABLE;
    800036cc:	fe843783          	ld	a5,-24(s0)
    800036d0:	470d                	li	a4,3
    800036d2:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800036d4:	fe843783          	ld	a5,-24(s0)
    800036d8:	853e                	mv	a0,a5
    800036da:	ffffe097          	auipc	ra,0xffffe
    800036de:	cc6080e7          	jalr	-826(ra) # 800013a0 <release>
    800036e2:	a011                	j	800036e6 <wakeup+0x90>
        continue;
    800036e4:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    800036e6:	fe843783          	ld	a5,-24(s0)
    800036ea:	16878793          	addi	a5,a5,360
    800036ee:	fef43423          	sd	a5,-24(s0)
    800036f2:	fe843703          	ld	a4,-24(s0)
    800036f6:	00017797          	auipc	a5,0x17
    800036fa:	34278793          	addi	a5,a5,834 # 8001aa38 <pid_lock>
    800036fe:	f6f769e3          	bltu	a4,a5,80003670 <wakeup+0x1a>
    }
  }
}
    80003702:	0001                	nop
    80003704:	0001                	nop
    80003706:	70a2                	ld	ra,40(sp)
    80003708:	7402                	ld	s0,32(sp)
    8000370a:	6145                	addi	sp,sp,48
    8000370c:	8082                	ret

000000008000370e <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    8000370e:	7179                	addi	sp,sp,-48
    80003710:	f406                	sd	ra,40(sp)
    80003712:	f022                	sd	s0,32(sp)
    80003714:	1800                	addi	s0,sp,48
    80003716:	87aa                	mv	a5,a0
    80003718:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8000371c:	00012797          	auipc	a5,0x12
    80003720:	91c78793          	addi	a5,a5,-1764 # 80015038 <proc>
    80003724:	fef43423          	sd	a5,-24(s0)
    80003728:	a0ad                	j	80003792 <kill+0x84>
    acquire(&p->lock);
    8000372a:	fe843783          	ld	a5,-24(s0)
    8000372e:	853e                	mv	a0,a5
    80003730:	ffffe097          	auipc	ra,0xffffe
    80003734:	c0c080e7          	jalr	-1012(ra) # 8000133c <acquire>
    if(p->pid == pid){
    80003738:	fe843783          	ld	a5,-24(s0)
    8000373c:	5b98                	lw	a4,48(a5)
    8000373e:	fdc42783          	lw	a5,-36(s0)
    80003742:	2781                	sext.w	a5,a5
    80003744:	02e79a63          	bne	a5,a4,80003778 <kill+0x6a>
      p->killed = 1;
    80003748:	fe843783          	ld	a5,-24(s0)
    8000374c:	4705                	li	a4,1
    8000374e:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80003750:	fe843783          	ld	a5,-24(s0)
    80003754:	4f9c                	lw	a5,24(a5)
    80003756:	873e                	mv	a4,a5
    80003758:	4789                	li	a5,2
    8000375a:	00f71663          	bne	a4,a5,80003766 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    8000375e:	fe843783          	ld	a5,-24(s0)
    80003762:	470d                	li	a4,3
    80003764:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003766:	fe843783          	ld	a5,-24(s0)
    8000376a:	853e                	mv	a0,a5
    8000376c:	ffffe097          	auipc	ra,0xffffe
    80003770:	c34080e7          	jalr	-972(ra) # 800013a0 <release>
      return 0;
    80003774:	4781                	li	a5,0
    80003776:	a03d                	j	800037a4 <kill+0x96>
    }
    release(&p->lock);
    80003778:	fe843783          	ld	a5,-24(s0)
    8000377c:	853e                	mv	a0,a5
    8000377e:	ffffe097          	auipc	ra,0xffffe
    80003782:	c22080e7          	jalr	-990(ra) # 800013a0 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003786:	fe843783          	ld	a5,-24(s0)
    8000378a:	16878793          	addi	a5,a5,360
    8000378e:	fef43423          	sd	a5,-24(s0)
    80003792:	fe843703          	ld	a4,-24(s0)
    80003796:	00017797          	auipc	a5,0x17
    8000379a:	2a278793          	addi	a5,a5,674 # 8001aa38 <pid_lock>
    8000379e:	f8f766e3          	bltu	a4,a5,8000372a <kill+0x1c>
  }
  return -1;
    800037a2:	57fd                	li	a5,-1
}
    800037a4:	853e                	mv	a0,a5
    800037a6:	70a2                	ld	ra,40(sp)
    800037a8:	7402                	ld	s0,32(sp)
    800037aa:	6145                	addi	sp,sp,48
    800037ac:	8082                	ret

00000000800037ae <setkilled>:

void
setkilled(struct proc *p)
{
    800037ae:	1101                	addi	sp,sp,-32
    800037b0:	ec06                	sd	ra,24(sp)
    800037b2:	e822                	sd	s0,16(sp)
    800037b4:	1000                	addi	s0,sp,32
    800037b6:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800037ba:	fe843783          	ld	a5,-24(s0)
    800037be:	853e                	mv	a0,a5
    800037c0:	ffffe097          	auipc	ra,0xffffe
    800037c4:	b7c080e7          	jalr	-1156(ra) # 8000133c <acquire>
  p->killed = 1;
    800037c8:	fe843783          	ld	a5,-24(s0)
    800037cc:	4705                	li	a4,1
    800037ce:	d798                	sw	a4,40(a5)
  release(&p->lock);
    800037d0:	fe843783          	ld	a5,-24(s0)
    800037d4:	853e                	mv	a0,a5
    800037d6:	ffffe097          	auipc	ra,0xffffe
    800037da:	bca080e7          	jalr	-1078(ra) # 800013a0 <release>
}
    800037de:	0001                	nop
    800037e0:	60e2                	ld	ra,24(sp)
    800037e2:	6442                	ld	s0,16(sp)
    800037e4:	6105                	addi	sp,sp,32
    800037e6:	8082                	ret

00000000800037e8 <killed>:

int
killed(struct proc *p)
{
    800037e8:	7179                	addi	sp,sp,-48
    800037ea:	f406                	sd	ra,40(sp)
    800037ec:	f022                	sd	s0,32(sp)
    800037ee:	1800                	addi	s0,sp,48
    800037f0:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    800037f4:	fd843783          	ld	a5,-40(s0)
    800037f8:	853e                	mv	a0,a5
    800037fa:	ffffe097          	auipc	ra,0xffffe
    800037fe:	b42080e7          	jalr	-1214(ra) # 8000133c <acquire>
  k = p->killed;
    80003802:	fd843783          	ld	a5,-40(s0)
    80003806:	579c                	lw	a5,40(a5)
    80003808:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    8000380c:	fd843783          	ld	a5,-40(s0)
    80003810:	853e                	mv	a0,a5
    80003812:	ffffe097          	auipc	ra,0xffffe
    80003816:	b8e080e7          	jalr	-1138(ra) # 800013a0 <release>
  return k;
    8000381a:	fec42783          	lw	a5,-20(s0)
}
    8000381e:	853e                	mv	a0,a5
    80003820:	70a2                	ld	ra,40(sp)
    80003822:	7402                	ld	s0,32(sp)
    80003824:	6145                	addi	sp,sp,48
    80003826:	8082                	ret

0000000080003828 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003828:	7139                	addi	sp,sp,-64
    8000382a:	fc06                	sd	ra,56(sp)
    8000382c:	f822                	sd	s0,48(sp)
    8000382e:	0080                	addi	s0,sp,64
    80003830:	87aa                	mv	a5,a0
    80003832:	fcb43823          	sd	a1,-48(s0)
    80003836:	fcc43423          	sd	a2,-56(s0)
    8000383a:	fcd43023          	sd	a3,-64(s0)
    8000383e:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80003842:	fffff097          	auipc	ra,0xfffff
    80003846:	1d6080e7          	jalr	470(ra) # 80002a18 <myproc>
    8000384a:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    8000384e:	fdc42783          	lw	a5,-36(s0)
    80003852:	2781                	sext.w	a5,a5
    80003854:	c38d                	beqz	a5,80003876 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    80003856:	fe843783          	ld	a5,-24(s0)
    8000385a:	6bbc                	ld	a5,80(a5)
    8000385c:	fc043683          	ld	a3,-64(s0)
    80003860:	fc843603          	ld	a2,-56(s0)
    80003864:	fd043583          	ld	a1,-48(s0)
    80003868:	853e                	mv	a0,a5
    8000386a:	fffff097          	auipc	ra,0xfffff
    8000386e:	c78080e7          	jalr	-904(ra) # 800024e2 <copyout>
    80003872:	87aa                	mv	a5,a0
    80003874:	a839                	j	80003892 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    80003876:	fd043783          	ld	a5,-48(s0)
    8000387a:	fc043703          	ld	a4,-64(s0)
    8000387e:	2701                	sext.w	a4,a4
    80003880:	863a                	mv	a2,a4
    80003882:	fc843583          	ld	a1,-56(s0)
    80003886:	853e                	mv	a0,a5
    80003888:	ffffe097          	auipc	ra,0xffffe
    8000388c:	d6c080e7          	jalr	-660(ra) # 800015f4 <memmove>
    return 0;
    80003890:	4781                	li	a5,0
  }
}
    80003892:	853e                	mv	a0,a5
    80003894:	70e2                	ld	ra,56(sp)
    80003896:	7442                	ld	s0,48(sp)
    80003898:	6121                	addi	sp,sp,64
    8000389a:	8082                	ret

000000008000389c <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    8000389c:	7139                	addi	sp,sp,-64
    8000389e:	fc06                	sd	ra,56(sp)
    800038a0:	f822                	sd	s0,48(sp)
    800038a2:	0080                	addi	s0,sp,64
    800038a4:	fca43c23          	sd	a0,-40(s0)
    800038a8:	87ae                	mv	a5,a1
    800038aa:	fcc43423          	sd	a2,-56(s0)
    800038ae:	fcd43023          	sd	a3,-64(s0)
    800038b2:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    800038b6:	fffff097          	auipc	ra,0xfffff
    800038ba:	162080e7          	jalr	354(ra) # 80002a18 <myproc>
    800038be:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800038c2:	fd442783          	lw	a5,-44(s0)
    800038c6:	2781                	sext.w	a5,a5
    800038c8:	c38d                	beqz	a5,800038ea <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800038ca:	fe843783          	ld	a5,-24(s0)
    800038ce:	6bbc                	ld	a5,80(a5)
    800038d0:	fc043683          	ld	a3,-64(s0)
    800038d4:	fc843603          	ld	a2,-56(s0)
    800038d8:	fd843583          	ld	a1,-40(s0)
    800038dc:	853e                	mv	a0,a5
    800038de:	fffff097          	auipc	ra,0xfffff
    800038e2:	cd2080e7          	jalr	-814(ra) # 800025b0 <copyin>
    800038e6:	87aa                	mv	a5,a0
    800038e8:	a839                	j	80003906 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    800038ea:	fc843783          	ld	a5,-56(s0)
    800038ee:	fc043703          	ld	a4,-64(s0)
    800038f2:	2701                	sext.w	a4,a4
    800038f4:	863a                	mv	a2,a4
    800038f6:	85be                	mv	a1,a5
    800038f8:	fd843503          	ld	a0,-40(s0)
    800038fc:	ffffe097          	auipc	ra,0xffffe
    80003900:	cf8080e7          	jalr	-776(ra) # 800015f4 <memmove>
    return 0;
    80003904:	4781                	li	a5,0
  }
}
    80003906:	853e                	mv	a0,a5
    80003908:	70e2                	ld	ra,56(sp)
    8000390a:	7442                	ld	s0,48(sp)
    8000390c:	6121                	addi	sp,sp,64
    8000390e:	8082                	ret

0000000080003910 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003910:	1101                	addi	sp,sp,-32
    80003912:	ec06                	sd	ra,24(sp)
    80003914:	e822                	sd	s0,16(sp)
    80003916:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003918:	00009517          	auipc	a0,0x9
    8000391c:	96850513          	addi	a0,a0,-1688 # 8000c280 <etext+0x280>
    80003920:	ffffd097          	auipc	ra,0xffffd
    80003924:	116080e7          	jalr	278(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003928:	00011797          	auipc	a5,0x11
    8000392c:	71078793          	addi	a5,a5,1808 # 80015038 <proc>
    80003930:	fef43423          	sd	a5,-24(s0)
    80003934:	a04d                	j	800039d6 <procdump+0xc6>
    if(p->state == UNUSED)
    80003936:	fe843783          	ld	a5,-24(s0)
    8000393a:	4f9c                	lw	a5,24(a5)
    8000393c:	c7d1                	beqz	a5,800039c8 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    8000393e:	fe843783          	ld	a5,-24(s0)
    80003942:	4f9c                	lw	a5,24(a5)
    80003944:	873e                	mv	a4,a5
    80003946:	4795                	li	a5,5
    80003948:	02e7ee63          	bltu	a5,a4,80003984 <procdump+0x74>
    8000394c:	fe843783          	ld	a5,-24(s0)
    80003950:	4f9c                	lw	a5,24(a5)
    80003952:	00009717          	auipc	a4,0x9
    80003956:	f4e70713          	addi	a4,a4,-178 # 8000c8a0 <states.1763>
    8000395a:	1782                	slli	a5,a5,0x20
    8000395c:	9381                	srli	a5,a5,0x20
    8000395e:	078e                	slli	a5,a5,0x3
    80003960:	97ba                	add	a5,a5,a4
    80003962:	639c                	ld	a5,0(a5)
    80003964:	c385                	beqz	a5,80003984 <procdump+0x74>
      state = states[p->state];
    80003966:	fe843783          	ld	a5,-24(s0)
    8000396a:	4f9c                	lw	a5,24(a5)
    8000396c:	00009717          	auipc	a4,0x9
    80003970:	f3470713          	addi	a4,a4,-204 # 8000c8a0 <states.1763>
    80003974:	1782                	slli	a5,a5,0x20
    80003976:	9381                	srli	a5,a5,0x20
    80003978:	078e                	slli	a5,a5,0x3
    8000397a:	97ba                	add	a5,a5,a4
    8000397c:	639c                	ld	a5,0(a5)
    8000397e:	fef43023          	sd	a5,-32(s0)
    80003982:	a039                	j	80003990 <procdump+0x80>
    else
      state = "???";
    80003984:	00009797          	auipc	a5,0x9
    80003988:	90478793          	addi	a5,a5,-1788 # 8000c288 <etext+0x288>
    8000398c:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003990:	fe843783          	ld	a5,-24(s0)
    80003994:	5b98                	lw	a4,48(a5)
    80003996:	fe843783          	ld	a5,-24(s0)
    8000399a:	15878793          	addi	a5,a5,344
    8000399e:	86be                	mv	a3,a5
    800039a0:	fe043603          	ld	a2,-32(s0)
    800039a4:	85ba                	mv	a1,a4
    800039a6:	00009517          	auipc	a0,0x9
    800039aa:	8ea50513          	addi	a0,a0,-1814 # 8000c290 <etext+0x290>
    800039ae:	ffffd097          	auipc	ra,0xffffd
    800039b2:	088080e7          	jalr	136(ra) # 80000a36 <printf>
    printf("\n");
    800039b6:	00009517          	auipc	a0,0x9
    800039ba:	8ca50513          	addi	a0,a0,-1846 # 8000c280 <etext+0x280>
    800039be:	ffffd097          	auipc	ra,0xffffd
    800039c2:	078080e7          	jalr	120(ra) # 80000a36 <printf>
    800039c6:	a011                	j	800039ca <procdump+0xba>
      continue;
    800039c8:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    800039ca:	fe843783          	ld	a5,-24(s0)
    800039ce:	16878793          	addi	a5,a5,360
    800039d2:	fef43423          	sd	a5,-24(s0)
    800039d6:	fe843703          	ld	a4,-24(s0)
    800039da:	00017797          	auipc	a5,0x17
    800039de:	05e78793          	addi	a5,a5,94 # 8001aa38 <pid_lock>
    800039e2:	f4f76ae3          	bltu	a4,a5,80003936 <procdump+0x26>
  }
}
    800039e6:	0001                	nop
    800039e8:	0001                	nop
    800039ea:	60e2                	ld	ra,24(sp)
    800039ec:	6442                	ld	s0,16(sp)
    800039ee:	6105                	addi	sp,sp,32
    800039f0:	8082                	ret

00000000800039f2 <swtch>:
    800039f2:	00153023          	sd	ra,0(a0)
    800039f6:	00253423          	sd	sp,8(a0)
    800039fa:	e900                	sd	s0,16(a0)
    800039fc:	ed04                	sd	s1,24(a0)
    800039fe:	03253023          	sd	s2,32(a0)
    80003a02:	03353423          	sd	s3,40(a0)
    80003a06:	03453823          	sd	s4,48(a0)
    80003a0a:	03553c23          	sd	s5,56(a0)
    80003a0e:	05653023          	sd	s6,64(a0)
    80003a12:	05753423          	sd	s7,72(a0)
    80003a16:	05853823          	sd	s8,80(a0)
    80003a1a:	05953c23          	sd	s9,88(a0)
    80003a1e:	07a53023          	sd	s10,96(a0)
    80003a22:	07b53423          	sd	s11,104(a0)
    80003a26:	0005b083          	ld	ra,0(a1)
    80003a2a:	0085b103          	ld	sp,8(a1)
    80003a2e:	6980                	ld	s0,16(a1)
    80003a30:	6d84                	ld	s1,24(a1)
    80003a32:	0205b903          	ld	s2,32(a1)
    80003a36:	0285b983          	ld	s3,40(a1)
    80003a3a:	0305ba03          	ld	s4,48(a1)
    80003a3e:	0385ba83          	ld	s5,56(a1)
    80003a42:	0405bb03          	ld	s6,64(a1)
    80003a46:	0485bb83          	ld	s7,72(a1)
    80003a4a:	0505bc03          	ld	s8,80(a1)
    80003a4e:	0585bc83          	ld	s9,88(a1)
    80003a52:	0605bd03          	ld	s10,96(a1)
    80003a56:	0685bd83          	ld	s11,104(a1)
    80003a5a:	8082                	ret

0000000080003a5c <r_sstatus>:
{
    80003a5c:	1101                	addi	sp,sp,-32
    80003a5e:	ec22                	sd	s0,24(sp)
    80003a60:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003a62:	100027f3          	csrr	a5,sstatus
    80003a66:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a6a:	fe843783          	ld	a5,-24(s0)
}
    80003a6e:	853e                	mv	a0,a5
    80003a70:	6462                	ld	s0,24(sp)
    80003a72:	6105                	addi	sp,sp,32
    80003a74:	8082                	ret

0000000080003a76 <w_sstatus>:
{
    80003a76:	1101                	addi	sp,sp,-32
    80003a78:	ec22                	sd	s0,24(sp)
    80003a7a:	1000                	addi	s0,sp,32
    80003a7c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003a80:	fe843783          	ld	a5,-24(s0)
    80003a84:	10079073          	csrw	sstatus,a5
}
    80003a88:	0001                	nop
    80003a8a:	6462                	ld	s0,24(sp)
    80003a8c:	6105                	addi	sp,sp,32
    80003a8e:	8082                	ret

0000000080003a90 <r_sip>:
{
    80003a90:	1101                	addi	sp,sp,-32
    80003a92:	ec22                	sd	s0,24(sp)
    80003a94:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003a96:	144027f3          	csrr	a5,sip
    80003a9a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a9e:	fe843783          	ld	a5,-24(s0)
}
    80003aa2:	853e                	mv	a0,a5
    80003aa4:	6462                	ld	s0,24(sp)
    80003aa6:	6105                	addi	sp,sp,32
    80003aa8:	8082                	ret

0000000080003aaa <w_sip>:
{
    80003aaa:	1101                	addi	sp,sp,-32
    80003aac:	ec22                	sd	s0,24(sp)
    80003aae:	1000                	addi	s0,sp,32
    80003ab0:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003ab4:	fe843783          	ld	a5,-24(s0)
    80003ab8:	14479073          	csrw	sip,a5
}
    80003abc:	0001                	nop
    80003abe:	6462                	ld	s0,24(sp)
    80003ac0:	6105                	addi	sp,sp,32
    80003ac2:	8082                	ret

0000000080003ac4 <w_sepc>:
{
    80003ac4:	1101                	addi	sp,sp,-32
    80003ac6:	ec22                	sd	s0,24(sp)
    80003ac8:	1000                	addi	s0,sp,32
    80003aca:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003ace:	fe843783          	ld	a5,-24(s0)
    80003ad2:	14179073          	csrw	sepc,a5
}
    80003ad6:	0001                	nop
    80003ad8:	6462                	ld	s0,24(sp)
    80003ada:	6105                	addi	sp,sp,32
    80003adc:	8082                	ret

0000000080003ade <r_sepc>:
{
    80003ade:	1101                	addi	sp,sp,-32
    80003ae0:	ec22                	sd	s0,24(sp)
    80003ae2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003ae4:	141027f3          	csrr	a5,sepc
    80003ae8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003aec:	fe843783          	ld	a5,-24(s0)
}
    80003af0:	853e                	mv	a0,a5
    80003af2:	6462                	ld	s0,24(sp)
    80003af4:	6105                	addi	sp,sp,32
    80003af6:	8082                	ret

0000000080003af8 <w_stvec>:
{
    80003af8:	1101                	addi	sp,sp,-32
    80003afa:	ec22                	sd	s0,24(sp)
    80003afc:	1000                	addi	s0,sp,32
    80003afe:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003b02:	fe843783          	ld	a5,-24(s0)
    80003b06:	10579073          	csrw	stvec,a5
}
    80003b0a:	0001                	nop
    80003b0c:	6462                	ld	s0,24(sp)
    80003b0e:	6105                	addi	sp,sp,32
    80003b10:	8082                	ret

0000000080003b12 <r_satp>:
{
    80003b12:	1101                	addi	sp,sp,-32
    80003b14:	ec22                	sd	s0,24(sp)
    80003b16:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003b18:	180027f3          	csrr	a5,satp
    80003b1c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b20:	fe843783          	ld	a5,-24(s0)
}
    80003b24:	853e                	mv	a0,a5
    80003b26:	6462                	ld	s0,24(sp)
    80003b28:	6105                	addi	sp,sp,32
    80003b2a:	8082                	ret

0000000080003b2c <r_scause>:
{
    80003b2c:	1101                	addi	sp,sp,-32
    80003b2e:	ec22                	sd	s0,24(sp)
    80003b30:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003b32:	142027f3          	csrr	a5,scause
    80003b36:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b3a:	fe843783          	ld	a5,-24(s0)
}
    80003b3e:	853e                	mv	a0,a5
    80003b40:	6462                	ld	s0,24(sp)
    80003b42:	6105                	addi	sp,sp,32
    80003b44:	8082                	ret

0000000080003b46 <r_stval>:
{
    80003b46:	1101                	addi	sp,sp,-32
    80003b48:	ec22                	sd	s0,24(sp)
    80003b4a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003b4c:	143027f3          	csrr	a5,stval
    80003b50:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b54:	fe843783          	ld	a5,-24(s0)
}
    80003b58:	853e                	mv	a0,a5
    80003b5a:	6462                	ld	s0,24(sp)
    80003b5c:	6105                	addi	sp,sp,32
    80003b5e:	8082                	ret

0000000080003b60 <intr_on>:
{
    80003b60:	1141                	addi	sp,sp,-16
    80003b62:	e406                	sd	ra,8(sp)
    80003b64:	e022                	sd	s0,0(sp)
    80003b66:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003b68:	00000097          	auipc	ra,0x0
    80003b6c:	ef4080e7          	jalr	-268(ra) # 80003a5c <r_sstatus>
    80003b70:	87aa                	mv	a5,a0
    80003b72:	0027e793          	ori	a5,a5,2
    80003b76:	853e                	mv	a0,a5
    80003b78:	00000097          	auipc	ra,0x0
    80003b7c:	efe080e7          	jalr	-258(ra) # 80003a76 <w_sstatus>
}
    80003b80:	0001                	nop
    80003b82:	60a2                	ld	ra,8(sp)
    80003b84:	6402                	ld	s0,0(sp)
    80003b86:	0141                	addi	sp,sp,16
    80003b88:	8082                	ret

0000000080003b8a <intr_off>:
{
    80003b8a:	1141                	addi	sp,sp,-16
    80003b8c:	e406                	sd	ra,8(sp)
    80003b8e:	e022                	sd	s0,0(sp)
    80003b90:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003b92:	00000097          	auipc	ra,0x0
    80003b96:	eca080e7          	jalr	-310(ra) # 80003a5c <r_sstatus>
    80003b9a:	87aa                	mv	a5,a0
    80003b9c:	9bf5                	andi	a5,a5,-3
    80003b9e:	853e                	mv	a0,a5
    80003ba0:	00000097          	auipc	ra,0x0
    80003ba4:	ed6080e7          	jalr	-298(ra) # 80003a76 <w_sstatus>
}
    80003ba8:	0001                	nop
    80003baa:	60a2                	ld	ra,8(sp)
    80003bac:	6402                	ld	s0,0(sp)
    80003bae:	0141                	addi	sp,sp,16
    80003bb0:	8082                	ret

0000000080003bb2 <intr_get>:
{
    80003bb2:	1101                	addi	sp,sp,-32
    80003bb4:	ec06                	sd	ra,24(sp)
    80003bb6:	e822                	sd	s0,16(sp)
    80003bb8:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003bba:	00000097          	auipc	ra,0x0
    80003bbe:	ea2080e7          	jalr	-350(ra) # 80003a5c <r_sstatus>
    80003bc2:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003bc6:	fe843783          	ld	a5,-24(s0)
    80003bca:	8b89                	andi	a5,a5,2
    80003bcc:	00f037b3          	snez	a5,a5
    80003bd0:	0ff7f793          	andi	a5,a5,255
    80003bd4:	2781                	sext.w	a5,a5
}
    80003bd6:	853e                	mv	a0,a5
    80003bd8:	60e2                	ld	ra,24(sp)
    80003bda:	6442                	ld	s0,16(sp)
    80003bdc:	6105                	addi	sp,sp,32
    80003bde:	8082                	ret

0000000080003be0 <r_tp>:
{
    80003be0:	1101                	addi	sp,sp,-32
    80003be2:	ec22                	sd	s0,24(sp)
    80003be4:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003be6:	8792                	mv	a5,tp
    80003be8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bec:	fe843783          	ld	a5,-24(s0)
}
    80003bf0:	853e                	mv	a0,a5
    80003bf2:	6462                	ld	s0,24(sp)
    80003bf4:	6105                	addi	sp,sp,32
    80003bf6:	8082                	ret

0000000080003bf8 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003bf8:	1141                	addi	sp,sp,-16
    80003bfa:	e406                	sd	ra,8(sp)
    80003bfc:	e022                	sd	s0,0(sp)
    80003bfe:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003c00:	00008597          	auipc	a1,0x8
    80003c04:	6d858593          	addi	a1,a1,1752 # 8000c2d8 <etext+0x2d8>
    80003c08:	00017517          	auipc	a0,0x17
    80003c0c:	e6050513          	addi	a0,a0,-416 # 8001aa68 <tickslock>
    80003c10:	ffffd097          	auipc	ra,0xffffd
    80003c14:	6fc080e7          	jalr	1788(ra) # 8000130c <initlock>
}
    80003c18:	0001                	nop
    80003c1a:	60a2                	ld	ra,8(sp)
    80003c1c:	6402                	ld	s0,0(sp)
    80003c1e:	0141                	addi	sp,sp,16
    80003c20:	8082                	ret

0000000080003c22 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003c22:	1141                	addi	sp,sp,-16
    80003c24:	e406                	sd	ra,8(sp)
    80003c26:	e022                	sd	s0,0(sp)
    80003c28:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003c2a:	00005797          	auipc	a5,0x5
    80003c2e:	e1678793          	addi	a5,a5,-490 # 80008a40 <kernelvec>
    80003c32:	853e                	mv	a0,a5
    80003c34:	00000097          	auipc	ra,0x0
    80003c38:	ec4080e7          	jalr	-316(ra) # 80003af8 <w_stvec>
}
    80003c3c:	0001                	nop
    80003c3e:	60a2                	ld	ra,8(sp)
    80003c40:	6402                	ld	s0,0(sp)
    80003c42:	0141                	addi	sp,sp,16
    80003c44:	8082                	ret

0000000080003c46 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003c46:	715d                	addi	sp,sp,-80
    80003c48:	e486                	sd	ra,72(sp)
    80003c4a:	e0a2                	sd	s0,64(sp)
    80003c4c:	fc26                	sd	s1,56(sp)
    80003c4e:	0880                	addi	s0,sp,80
  int which_dev = 0;
    80003c50:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003c54:	00000097          	auipc	ra,0x0
    80003c58:	e08080e7          	jalr	-504(ra) # 80003a5c <r_sstatus>
    80003c5c:	87aa                	mv	a5,a0
    80003c5e:	1007f793          	andi	a5,a5,256
    80003c62:	cb89                	beqz	a5,80003c74 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003c64:	00008517          	auipc	a0,0x8
    80003c68:	67c50513          	addi	a0,a0,1660 # 8000c2e0 <etext+0x2e0>
    80003c6c:	ffffd097          	auipc	ra,0xffffd
    80003c70:	020080e7          	jalr	32(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003c74:	00005797          	auipc	a5,0x5
    80003c78:	dcc78793          	addi	a5,a5,-564 # 80008a40 <kernelvec>
    80003c7c:	853e                	mv	a0,a5
    80003c7e:	00000097          	auipc	ra,0x0
    80003c82:	e7a080e7          	jalr	-390(ra) # 80003af8 <w_stvec>

  struct proc *p = myproc();
    80003c86:	fffff097          	auipc	ra,0xfffff
    80003c8a:	d92080e7          	jalr	-622(ra) # 80002a18 <myproc>
    80003c8e:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003c92:	fd043783          	ld	a5,-48(s0)
    80003c96:	6fa4                	ld	s1,88(a5)
    80003c98:	00000097          	auipc	ra,0x0
    80003c9c:	e46080e7          	jalr	-442(ra) # 80003ade <r_sepc>
    80003ca0:	87aa                	mv	a5,a0
    80003ca2:	ec9c                	sd	a5,24(s1)

  uint64 scause = r_scause();
    80003ca4:	00000097          	auipc	ra,0x0
    80003ca8:	e88080e7          	jalr	-376(ra) # 80003b2c <r_scause>
    80003cac:	fca43423          	sd	a0,-56(s0)

  if(scause == 13) {
    80003cb0:	fc843703          	ld	a4,-56(s0)
    80003cb4:	47b5                	li	a5,13
    80003cb6:	04f71063          	bne	a4,a5,80003cf6 <usertrap+0xb0>
    // page fault

    uint64 va = (uint64)r_stval();
    80003cba:	00000097          	auipc	ra,0x0
    80003cbe:	e8c080e7          	jalr	-372(ra) # 80003b46 <r_stval>
    80003cc2:	fca43023          	sd	a0,-64(s0)
    int pfhandled = swapin(va, p->pagetable);
    80003cc6:	fd043783          	ld	a5,-48(s0)
    80003cca:	6bbc                	ld	a5,80(a5)
    80003ccc:	85be                	mv	a1,a5
    80003cce:	fc043503          	ld	a0,-64(s0)
    80003cd2:	00007097          	auipc	ra,0x7
    80003cd6:	ac2080e7          	jalr	-1342(ra) # 8000a794 <swapin>
    80003cda:	87aa                	mv	a5,a0
    80003cdc:	faf42e23          	sw	a5,-68(s0)
    if(pfhandled == 0)
    80003ce0:	fbc42783          	lw	a5,-68(s0)
    80003ce4:	2781                	sext.w	a5,a5
    80003ce6:	e3f9                	bnez	a5,80003dac <usertrap+0x166>
      setkilled(p);
    80003ce8:	fd043503          	ld	a0,-48(s0)
    80003cec:	00000097          	auipc	ra,0x0
    80003cf0:	ac2080e7          	jalr	-1342(ra) # 800037ae <setkilled>
    80003cf4:	a865                	j	80003dac <usertrap+0x166>
  } else if(scause == 8) {
    80003cf6:	fc843703          	ld	a4,-56(s0)
    80003cfa:	47a1                	li	a5,8
    80003cfc:	04f71163          	bne	a4,a5,80003d3e <usertrap+0xf8>
    // system call

    if(killed(p))
    80003d00:	fd043503          	ld	a0,-48(s0)
    80003d04:	00000097          	auipc	ra,0x0
    80003d08:	ae4080e7          	jalr	-1308(ra) # 800037e8 <killed>
    80003d0c:	87aa                	mv	a5,a0
    80003d0e:	c791                	beqz	a5,80003d1a <usertrap+0xd4>
      exit(-1);
    80003d10:	557d                	li	a0,-1
    80003d12:	fffff097          	auipc	ra,0xfffff
    80003d16:	3f8080e7          	jalr	1016(ra) # 8000310a <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003d1a:	fd043783          	ld	a5,-48(s0)
    80003d1e:	6fbc                	ld	a5,88(a5)
    80003d20:	6f98                	ld	a4,24(a5)
    80003d22:	fd043783          	ld	a5,-48(s0)
    80003d26:	6fbc                	ld	a5,88(a5)
    80003d28:	0711                	addi	a4,a4,4
    80003d2a:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003d2c:	00000097          	auipc	ra,0x0
    80003d30:	e34080e7          	jalr	-460(ra) # 80003b60 <intr_on>

    syscall();
    80003d34:	00000097          	auipc	ra,0x0
    80003d38:	6a8080e7          	jalr	1704(ra) # 800043dc <syscall>
    80003d3c:	a885                	j	80003dac <usertrap+0x166>
  } else if((which_dev = devintr()) != 0){
    80003d3e:	00000097          	auipc	ra,0x0
    80003d42:	36e080e7          	jalr	878(ra) # 800040ac <devintr>
    80003d46:	87aa                	mv	a5,a0
    80003d48:	fcf42e23          	sw	a5,-36(s0)
    80003d4c:	fdc42783          	lw	a5,-36(s0)
    80003d50:	2781                	sext.w	a5,a5
    80003d52:	efa9                	bnez	a5,80003dac <usertrap+0x166>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003d54:	00000097          	auipc	ra,0x0
    80003d58:	dd8080e7          	jalr	-552(ra) # 80003b2c <r_scause>
    80003d5c:	872a                	mv	a4,a0
    80003d5e:	fd043783          	ld	a5,-48(s0)
    80003d62:	5b9c                	lw	a5,48(a5)
    80003d64:	863e                	mv	a2,a5
    80003d66:	85ba                	mv	a1,a4
    80003d68:	00008517          	auipc	a0,0x8
    80003d6c:	59850513          	addi	a0,a0,1432 # 8000c300 <etext+0x300>
    80003d70:	ffffd097          	auipc	ra,0xffffd
    80003d74:	cc6080e7          	jalr	-826(ra) # 80000a36 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003d78:	00000097          	auipc	ra,0x0
    80003d7c:	d66080e7          	jalr	-666(ra) # 80003ade <r_sepc>
    80003d80:	84aa                	mv	s1,a0
    80003d82:	00000097          	auipc	ra,0x0
    80003d86:	dc4080e7          	jalr	-572(ra) # 80003b46 <r_stval>
    80003d8a:	87aa                	mv	a5,a0
    80003d8c:	863e                	mv	a2,a5
    80003d8e:	85a6                	mv	a1,s1
    80003d90:	00008517          	auipc	a0,0x8
    80003d94:	5a050513          	addi	a0,a0,1440 # 8000c330 <etext+0x330>
    80003d98:	ffffd097          	auipc	ra,0xffffd
    80003d9c:	c9e080e7          	jalr	-866(ra) # 80000a36 <printf>
    setkilled(p);
    80003da0:	fd043503          	ld	a0,-48(s0)
    80003da4:	00000097          	auipc	ra,0x0
    80003da8:	a0a080e7          	jalr	-1526(ra) # 800037ae <setkilled>
  }

  if(killed(p))
    80003dac:	fd043503          	ld	a0,-48(s0)
    80003db0:	00000097          	auipc	ra,0x0
    80003db4:	a38080e7          	jalr	-1480(ra) # 800037e8 <killed>
    80003db8:	87aa                	mv	a5,a0
    80003dba:	c791                	beqz	a5,80003dc6 <usertrap+0x180>
    exit(-1);
    80003dbc:	557d                	li	a0,-1
    80003dbe:	fffff097          	auipc	ra,0xfffff
    80003dc2:	34c080e7          	jalr	844(ra) # 8000310a <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003dc6:	fdc42783          	lw	a5,-36(s0)
    80003dca:	0007871b          	sext.w	a4,a5
    80003dce:	4789                	li	a5,2
    80003dd0:	00f71663          	bne	a4,a5,80003ddc <usertrap+0x196>
    yield();
    80003dd4:	fffff097          	auipc	ra,0xfffff
    80003dd8:	76c080e7          	jalr	1900(ra) # 80003540 <yield>

  usertrapret();
    80003ddc:	00000097          	auipc	ra,0x0
    80003de0:	014080e7          	jalr	20(ra) # 80003df0 <usertrapret>
}
    80003de4:	0001                	nop
    80003de6:	60a6                	ld	ra,72(sp)
    80003de8:	6406                	ld	s0,64(sp)
    80003dea:	74e2                	ld	s1,56(sp)
    80003dec:	6161                	addi	sp,sp,80
    80003dee:	8082                	ret

0000000080003df0 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003df0:	715d                	addi	sp,sp,-80
    80003df2:	e486                	sd	ra,72(sp)
    80003df4:	e0a2                	sd	s0,64(sp)
    80003df6:	fc26                	sd	s1,56(sp)
    80003df8:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003dfa:	fffff097          	auipc	ra,0xfffff
    80003dfe:	c1e080e7          	jalr	-994(ra) # 80002a18 <myproc>
    80003e02:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003e06:	00000097          	auipc	ra,0x0
    80003e0a:	d84080e7          	jalr	-636(ra) # 80003b8a <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003e0e:	00007717          	auipc	a4,0x7
    80003e12:	1f270713          	addi	a4,a4,498 # 8000b000 <_trampoline>
    80003e16:	00007797          	auipc	a5,0x7
    80003e1a:	1ea78793          	addi	a5,a5,490 # 8000b000 <_trampoline>
    80003e1e:	8f1d                	sub	a4,a4,a5
    80003e20:	040007b7          	lui	a5,0x4000
    80003e24:	17fd                	addi	a5,a5,-1
    80003e26:	07b2                	slli	a5,a5,0xc
    80003e28:	97ba                	add	a5,a5,a4
    80003e2a:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003e2e:	fd043503          	ld	a0,-48(s0)
    80003e32:	00000097          	auipc	ra,0x0
    80003e36:	cc6080e7          	jalr	-826(ra) # 80003af8 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003e3a:	fd843783          	ld	a5,-40(s0)
    80003e3e:	6fa4                	ld	s1,88(a5)
    80003e40:	00000097          	auipc	ra,0x0
    80003e44:	cd2080e7          	jalr	-814(ra) # 80003b12 <r_satp>
    80003e48:	87aa                	mv	a5,a0
    80003e4a:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003e4c:	fd843783          	ld	a5,-40(s0)
    80003e50:	63b4                	ld	a3,64(a5)
    80003e52:	fd843783          	ld	a5,-40(s0)
    80003e56:	6fbc                	ld	a5,88(a5)
    80003e58:	6705                	lui	a4,0x1
    80003e5a:	9736                	add	a4,a4,a3
    80003e5c:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003e5e:	fd843783          	ld	a5,-40(s0)
    80003e62:	6fbc                	ld	a5,88(a5)
    80003e64:	00000717          	auipc	a4,0x0
    80003e68:	de270713          	addi	a4,a4,-542 # 80003c46 <usertrap>
    80003e6c:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003e6e:	fd843783          	ld	a5,-40(s0)
    80003e72:	6fa4                	ld	s1,88(a5)
    80003e74:	00000097          	auipc	ra,0x0
    80003e78:	d6c080e7          	jalr	-660(ra) # 80003be0 <r_tp>
    80003e7c:	87aa                	mv	a5,a0
    80003e7e:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003e80:	00000097          	auipc	ra,0x0
    80003e84:	bdc080e7          	jalr	-1060(ra) # 80003a5c <r_sstatus>
    80003e88:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003e8c:	fc843783          	ld	a5,-56(s0)
    80003e90:	eff7f793          	andi	a5,a5,-257
    80003e94:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003e98:	fc843783          	ld	a5,-56(s0)
    80003e9c:	0207e793          	ori	a5,a5,32
    80003ea0:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003ea4:	fc843503          	ld	a0,-56(s0)
    80003ea8:	00000097          	auipc	ra,0x0
    80003eac:	bce080e7          	jalr	-1074(ra) # 80003a76 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003eb0:	fd843783          	ld	a5,-40(s0)
    80003eb4:	6fbc                	ld	a5,88(a5)
    80003eb6:	6f9c                	ld	a5,24(a5)
    80003eb8:	853e                	mv	a0,a5
    80003eba:	00000097          	auipc	ra,0x0
    80003ebe:	c0a080e7          	jalr	-1014(ra) # 80003ac4 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003ec2:	fd843783          	ld	a5,-40(s0)
    80003ec6:	6bbc                	ld	a5,80(a5)
    80003ec8:	00c7d713          	srli	a4,a5,0xc
    80003ecc:	57fd                	li	a5,-1
    80003ece:	17fe                	slli	a5,a5,0x3f
    80003ed0:	8fd9                	or	a5,a5,a4
    80003ed2:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003ed6:	00007717          	auipc	a4,0x7
    80003eda:	1c670713          	addi	a4,a4,454 # 8000b09c <userret>
    80003ede:	00007797          	auipc	a5,0x7
    80003ee2:	12278793          	addi	a5,a5,290 # 8000b000 <_trampoline>
    80003ee6:	8f1d                	sub	a4,a4,a5
    80003ee8:	040007b7          	lui	a5,0x4000
    80003eec:	17fd                	addi	a5,a5,-1
    80003eee:	07b2                	slli	a5,a5,0xc
    80003ef0:	97ba                	add	a5,a5,a4
    80003ef2:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003ef6:	fb843783          	ld	a5,-72(s0)
    80003efa:	fc043503          	ld	a0,-64(s0)
    80003efe:	9782                	jalr	a5
}
    80003f00:	0001                	nop
    80003f02:	60a6                	ld	ra,72(sp)
    80003f04:	6406                	ld	s0,64(sp)
    80003f06:	74e2                	ld	s1,56(sp)
    80003f08:	6161                	addi	sp,sp,80
    80003f0a:	8082                	ret

0000000080003f0c <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003f0c:	7139                	addi	sp,sp,-64
    80003f0e:	fc06                	sd	ra,56(sp)
    80003f10:	f822                	sd	s0,48(sp)
    80003f12:	f426                	sd	s1,40(sp)
    80003f14:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003f16:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003f1a:	00000097          	auipc	ra,0x0
    80003f1e:	bc4080e7          	jalr	-1084(ra) # 80003ade <r_sepc>
    80003f22:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003f26:	00000097          	auipc	ra,0x0
    80003f2a:	b36080e7          	jalr	-1226(ra) # 80003a5c <r_sstatus>
    80003f2e:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003f32:	00000097          	auipc	ra,0x0
    80003f36:	bfa080e7          	jalr	-1030(ra) # 80003b2c <r_scause>
    80003f3a:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003f3e:	fc843783          	ld	a5,-56(s0)
    80003f42:	1007f793          	andi	a5,a5,256
    80003f46:	eb89                	bnez	a5,80003f58 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003f48:	00008517          	auipc	a0,0x8
    80003f4c:	40850513          	addi	a0,a0,1032 # 8000c350 <etext+0x350>
    80003f50:	ffffd097          	auipc	ra,0xffffd
    80003f54:	d3c080e7          	jalr	-708(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    80003f58:	00000097          	auipc	ra,0x0
    80003f5c:	c5a080e7          	jalr	-934(ra) # 80003bb2 <intr_get>
    80003f60:	87aa                	mv	a5,a0
    80003f62:	cb89                	beqz	a5,80003f74 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003f64:	00008517          	auipc	a0,0x8
    80003f68:	41450513          	addi	a0,a0,1044 # 8000c378 <etext+0x378>
    80003f6c:	ffffd097          	auipc	ra,0xffffd
    80003f70:	d20080e7          	jalr	-736(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    80003f74:	00000097          	auipc	ra,0x0
    80003f78:	138080e7          	jalr	312(ra) # 800040ac <devintr>
    80003f7c:	87aa                	mv	a5,a0
    80003f7e:	fcf42e23          	sw	a5,-36(s0)
    80003f82:	fdc42783          	lw	a5,-36(s0)
    80003f86:	2781                	sext.w	a5,a5
    80003f88:	e7b9                	bnez	a5,80003fd6 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003f8a:	fc043583          	ld	a1,-64(s0)
    80003f8e:	00008517          	auipc	a0,0x8
    80003f92:	40a50513          	addi	a0,a0,1034 # 8000c398 <etext+0x398>
    80003f96:	ffffd097          	auipc	ra,0xffffd
    80003f9a:	aa0080e7          	jalr	-1376(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003f9e:	00000097          	auipc	ra,0x0
    80003fa2:	b40080e7          	jalr	-1216(ra) # 80003ade <r_sepc>
    80003fa6:	84aa                	mv	s1,a0
    80003fa8:	00000097          	auipc	ra,0x0
    80003fac:	b9e080e7          	jalr	-1122(ra) # 80003b46 <r_stval>
    80003fb0:	87aa                	mv	a5,a0
    80003fb2:	863e                	mv	a2,a5
    80003fb4:	85a6                	mv	a1,s1
    80003fb6:	00008517          	auipc	a0,0x8
    80003fba:	3f250513          	addi	a0,a0,1010 # 8000c3a8 <etext+0x3a8>
    80003fbe:	ffffd097          	auipc	ra,0xffffd
    80003fc2:	a78080e7          	jalr	-1416(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80003fc6:	00008517          	auipc	a0,0x8
    80003fca:	3fa50513          	addi	a0,a0,1018 # 8000c3c0 <etext+0x3c0>
    80003fce:	ffffd097          	auipc	ra,0xffffd
    80003fd2:	cbe080e7          	jalr	-834(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80003fd6:	fdc42783          	lw	a5,-36(s0)
    80003fda:	0007871b          	sext.w	a4,a5
    80003fde:	4789                	li	a5,2
    80003fe0:	02f71663          	bne	a4,a5,8000400c <kerneltrap+0x100>
    80003fe4:	fffff097          	auipc	ra,0xfffff
    80003fe8:	a34080e7          	jalr	-1484(ra) # 80002a18 <myproc>
    80003fec:	87aa                	mv	a5,a0
    80003fee:	cf99                	beqz	a5,8000400c <kerneltrap+0x100>
    80003ff0:	fffff097          	auipc	ra,0xfffff
    80003ff4:	a28080e7          	jalr	-1496(ra) # 80002a18 <myproc>
    80003ff8:	87aa                	mv	a5,a0
    80003ffa:	4f9c                	lw	a5,24(a5)
    80003ffc:	873e                	mv	a4,a5
    80003ffe:	4791                	li	a5,4
    80004000:	00f71663          	bne	a4,a5,8000400c <kerneltrap+0x100>
    yield();
    80004004:	fffff097          	auipc	ra,0xfffff
    80004008:	53c080e7          	jalr	1340(ra) # 80003540 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    8000400c:	fd043503          	ld	a0,-48(s0)
    80004010:	00000097          	auipc	ra,0x0
    80004014:	ab4080e7          	jalr	-1356(ra) # 80003ac4 <w_sepc>
  w_sstatus(sstatus);
    80004018:	fc843503          	ld	a0,-56(s0)
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	a5a080e7          	jalr	-1446(ra) # 80003a76 <w_sstatus>
}
    80004024:	0001                	nop
    80004026:	70e2                	ld	ra,56(sp)
    80004028:	7442                	ld	s0,48(sp)
    8000402a:	74a2                	ld	s1,40(sp)
    8000402c:	6121                	addi	sp,sp,64
    8000402e:	8082                	ret

0000000080004030 <clockintr>:

void
clockintr()
{
    80004030:	1141                	addi	sp,sp,-16
    80004032:	e406                	sd	ra,8(sp)
    80004034:	e022                	sd	s0,0(sp)
    80004036:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004038:	00017517          	auipc	a0,0x17
    8000403c:	a3050513          	addi	a0,a0,-1488 # 8001aa68 <tickslock>
    80004040:	ffffd097          	auipc	ra,0xffffd
    80004044:	2fc080e7          	jalr	764(ra) # 8000133c <acquire>
  ticks++;
    80004048:	00009797          	auipc	a5,0x9
    8000404c:	98078793          	addi	a5,a5,-1664 # 8000c9c8 <ticks>
    80004050:	439c                	lw	a5,0(a5)
    80004052:	2785                	addiw	a5,a5,1
    80004054:	0007871b          	sext.w	a4,a5
    80004058:	00009797          	auipc	a5,0x9
    8000405c:	97078793          	addi	a5,a5,-1680 # 8000c9c8 <ticks>
    80004060:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    80004062:	00009797          	auipc	a5,0x9
    80004066:	96678793          	addi	a5,a5,-1690 # 8000c9c8 <ticks>
    8000406a:	439c                	lw	a5,0(a5)
    8000406c:	873e                	mv	a4,a5
    8000406e:	06400793          	li	a5,100
    80004072:	02f777bb          	remuw	a5,a4,a5
    80004076:	2781                	sext.w	a5,a5
    80004078:	e789                	bnez	a5,80004082 <clockintr+0x52>
  {
    updaterefhistory();
    8000407a:	00006097          	auipc	ra,0x6
    8000407e:	462080e7          	jalr	1122(ra) # 8000a4dc <updaterefhistory>
  }

  wakeup(&ticks);
    80004082:	00009517          	auipc	a0,0x9
    80004086:	94650513          	addi	a0,a0,-1722 # 8000c9c8 <ticks>
    8000408a:	fffff097          	auipc	ra,0xfffff
    8000408e:	5cc080e7          	jalr	1484(ra) # 80003656 <wakeup>
  release(&tickslock);
    80004092:	00017517          	auipc	a0,0x17
    80004096:	9d650513          	addi	a0,a0,-1578 # 8001aa68 <tickslock>
    8000409a:	ffffd097          	auipc	ra,0xffffd
    8000409e:	306080e7          	jalr	774(ra) # 800013a0 <release>
}
    800040a2:	0001                	nop
    800040a4:	60a2                	ld	ra,8(sp)
    800040a6:	6402                	ld	s0,0(sp)
    800040a8:	0141                	addi	sp,sp,16
    800040aa:	8082                	ret

00000000800040ac <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    800040ac:	1101                	addi	sp,sp,-32
    800040ae:	ec06                	sd	ra,24(sp)
    800040b0:	e822                	sd	s0,16(sp)
    800040b2:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    800040b4:	00000097          	auipc	ra,0x0
    800040b8:	a78080e7          	jalr	-1416(ra) # 80003b2c <r_scause>
    800040bc:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    800040c0:	fe843783          	ld	a5,-24(s0)
    800040c4:	0a07d263          	bgez	a5,80004168 <devintr+0xbc>
     (scause & 0xff) == 9){
    800040c8:	fe843783          	ld	a5,-24(s0)
    800040cc:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    800040d0:	47a5                	li	a5,9
    800040d2:	08f71b63          	bne	a4,a5,80004168 <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    800040d6:	00005097          	auipc	ra,0x5
    800040da:	aa6080e7          	jalr	-1370(ra) # 80008b7c <plic_claim>
    800040de:	87aa                	mv	a5,a0
    800040e0:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    800040e4:	fe442783          	lw	a5,-28(s0)
    800040e8:	0007871b          	sext.w	a4,a5
    800040ec:	47a9                	li	a5,10
    800040ee:	00f71763          	bne	a4,a5,800040fc <devintr+0x50>
      uartintr();
    800040f2:	ffffd097          	auipc	ra,0xffffd
    800040f6:	f3c080e7          	jalr	-196(ra) # 8000102e <uartintr>
    800040fa:	a891                	j	8000414e <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    800040fc:	fe442783          	lw	a5,-28(s0)
    80004100:	0007871b          	sext.w	a4,a5
    80004104:	4785                	li	a5,1
    80004106:	00f71863          	bne	a4,a5,80004116 <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    8000410a:	4501                	li	a0,0
    8000410c:	00006097          	auipc	ra,0x6
    80004110:	f02080e7          	jalr	-254(ra) # 8000a00e <virtio_disk_intr>
    80004114:	a82d                	j	8000414e <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    80004116:	fe442783          	lw	a5,-28(s0)
    8000411a:	0007871b          	sext.w	a4,a5
    8000411e:	4789                	li	a5,2
    80004120:	00f71863          	bne	a4,a5,80004130 <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    80004124:	4505                	li	a0,1
    80004126:	00006097          	auipc	ra,0x6
    8000412a:	ee8080e7          	jalr	-280(ra) # 8000a00e <virtio_disk_intr>
    8000412e:	a005                	j	8000414e <devintr+0xa2>
    } else if(irq){
    80004130:	fe442783          	lw	a5,-28(s0)
    80004134:	2781                	sext.w	a5,a5
    80004136:	cf81                	beqz	a5,8000414e <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    80004138:	fe442783          	lw	a5,-28(s0)
    8000413c:	85be                	mv	a1,a5
    8000413e:	00008517          	auipc	a0,0x8
    80004142:	29250513          	addi	a0,a0,658 # 8000c3d0 <etext+0x3d0>
    80004146:	ffffd097          	auipc	ra,0xffffd
    8000414a:	8f0080e7          	jalr	-1808(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    8000414e:	fe442783          	lw	a5,-28(s0)
    80004152:	2781                	sext.w	a5,a5
    80004154:	cb81                	beqz	a5,80004164 <devintr+0xb8>
      plic_complete(irq);
    80004156:	fe442783          	lw	a5,-28(s0)
    8000415a:	853e                	mv	a0,a5
    8000415c:	00005097          	auipc	ra,0x5
    80004160:	a5e080e7          	jalr	-1442(ra) # 80008bba <plic_complete>

    return 1;
    80004164:	4785                	li	a5,1
    80004166:	a081                	j	800041a6 <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    80004168:	fe843703          	ld	a4,-24(s0)
    8000416c:	57fd                	li	a5,-1
    8000416e:	17fe                	slli	a5,a5,0x3f
    80004170:	0785                	addi	a5,a5,1
    80004172:	02f71963          	bne	a4,a5,800041a4 <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    80004176:	fffff097          	auipc	ra,0xfffff
    8000417a:	844080e7          	jalr	-1980(ra) # 800029ba <cpuid>
    8000417e:	87aa                	mv	a5,a0
    80004180:	e789                	bnez	a5,8000418a <devintr+0xde>
      clockintr();
    80004182:	00000097          	auipc	ra,0x0
    80004186:	eae080e7          	jalr	-338(ra) # 80004030 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    8000418a:	00000097          	auipc	ra,0x0
    8000418e:	906080e7          	jalr	-1786(ra) # 80003a90 <r_sip>
    80004192:	87aa                	mv	a5,a0
    80004194:	9bf5                	andi	a5,a5,-3
    80004196:	853e                	mv	a0,a5
    80004198:	00000097          	auipc	ra,0x0
    8000419c:	912080e7          	jalr	-1774(ra) # 80003aaa <w_sip>

    return 2;
    800041a0:	4789                	li	a5,2
    800041a2:	a011                	j	800041a6 <devintr+0xfa>
  } else {
    return 0;
    800041a4:	4781                	li	a5,0
  }
}
    800041a6:	853e                	mv	a0,a5
    800041a8:	60e2                	ld	ra,24(sp)
    800041aa:	6442                	ld	s0,16(sp)
    800041ac:	6105                	addi	sp,sp,32
    800041ae:	8082                	ret

00000000800041b0 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    800041b0:	7179                	addi	sp,sp,-48
    800041b2:	f406                	sd	ra,40(sp)
    800041b4:	f022                	sd	s0,32(sp)
    800041b6:	1800                	addi	s0,sp,48
    800041b8:	fca43c23          	sd	a0,-40(s0)
    800041bc:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800041c0:	fffff097          	auipc	ra,0xfffff
    800041c4:	858080e7          	jalr	-1960(ra) # 80002a18 <myproc>
    800041c8:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    800041cc:	fe843783          	ld	a5,-24(s0)
    800041d0:	67bc                	ld	a5,72(a5)
    800041d2:	fd843703          	ld	a4,-40(s0)
    800041d6:	00f77b63          	bgeu	a4,a5,800041ec <fetchaddr+0x3c>
    800041da:	fd843783          	ld	a5,-40(s0)
    800041de:	00878713          	addi	a4,a5,8
    800041e2:	fe843783          	ld	a5,-24(s0)
    800041e6:	67bc                	ld	a5,72(a5)
    800041e8:	00e7f463          	bgeu	a5,a4,800041f0 <fetchaddr+0x40>
    return -1;
    800041ec:	57fd                	li	a5,-1
    800041ee:	a01d                	j	80004214 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    800041f0:	fe843783          	ld	a5,-24(s0)
    800041f4:	6bbc                	ld	a5,80(a5)
    800041f6:	46a1                	li	a3,8
    800041f8:	fd843603          	ld	a2,-40(s0)
    800041fc:	fd043583          	ld	a1,-48(s0)
    80004200:	853e                	mv	a0,a5
    80004202:	ffffe097          	auipc	ra,0xffffe
    80004206:	3ae080e7          	jalr	942(ra) # 800025b0 <copyin>
    8000420a:	87aa                	mv	a5,a0
    8000420c:	c399                	beqz	a5,80004212 <fetchaddr+0x62>
    return -1;
    8000420e:	57fd                	li	a5,-1
    80004210:	a011                	j	80004214 <fetchaddr+0x64>
  return 0;
    80004212:	4781                	li	a5,0
}
    80004214:	853e                	mv	a0,a5
    80004216:	70a2                	ld	ra,40(sp)
    80004218:	7402                	ld	s0,32(sp)
    8000421a:	6145                	addi	sp,sp,48
    8000421c:	8082                	ret

000000008000421e <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    8000421e:	7139                	addi	sp,sp,-64
    80004220:	fc06                	sd	ra,56(sp)
    80004222:	f822                	sd	s0,48(sp)
    80004224:	0080                	addi	s0,sp,64
    80004226:	fca43c23          	sd	a0,-40(s0)
    8000422a:	fcb43823          	sd	a1,-48(s0)
    8000422e:	87b2                	mv	a5,a2
    80004230:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004234:	ffffe097          	auipc	ra,0xffffe
    80004238:	7e4080e7          	jalr	2020(ra) # 80002a18 <myproc>
    8000423c:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    80004240:	fe843783          	ld	a5,-24(s0)
    80004244:	6bbc                	ld	a5,80(a5)
    80004246:	fcc42703          	lw	a4,-52(s0)
    8000424a:	86ba                	mv	a3,a4
    8000424c:	fd843603          	ld	a2,-40(s0)
    80004250:	fd043583          	ld	a1,-48(s0)
    80004254:	853e                	mv	a0,a5
    80004256:	ffffe097          	auipc	ra,0xffffe
    8000425a:	428080e7          	jalr	1064(ra) # 8000267e <copyinstr>
    8000425e:	87aa                	mv	a5,a0
    80004260:	0007d463          	bgez	a5,80004268 <fetchstr+0x4a>
    return -1;
    80004264:	57fd                	li	a5,-1
    80004266:	a801                	j	80004276 <fetchstr+0x58>
  return strlen(buf);
    80004268:	fd043503          	ld	a0,-48(s0)
    8000426c:	ffffd097          	auipc	ra,0xffffd
    80004270:	622080e7          	jalr	1570(ra) # 8000188e <strlen>
    80004274:	87aa                	mv	a5,a0
}
    80004276:	853e                	mv	a0,a5
    80004278:	70e2                	ld	ra,56(sp)
    8000427a:	7442                	ld	s0,48(sp)
    8000427c:	6121                	addi	sp,sp,64
    8000427e:	8082                	ret

0000000080004280 <argraw>:

static uint64
argraw(int n)
{
    80004280:	7179                	addi	sp,sp,-48
    80004282:	f406                	sd	ra,40(sp)
    80004284:	f022                	sd	s0,32(sp)
    80004286:	1800                	addi	s0,sp,48
    80004288:	87aa                	mv	a5,a0
    8000428a:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000428e:	ffffe097          	auipc	ra,0xffffe
    80004292:	78a080e7          	jalr	1930(ra) # 80002a18 <myproc>
    80004296:	fea43423          	sd	a0,-24(s0)
    8000429a:	fdc42783          	lw	a5,-36(s0)
    8000429e:	0007871b          	sext.w	a4,a5
    800042a2:	4795                	li	a5,5
    800042a4:	06e7e263          	bltu	a5,a4,80004308 <argraw+0x88>
    800042a8:	fdc46783          	lwu	a5,-36(s0)
    800042ac:	00279713          	slli	a4,a5,0x2
    800042b0:	00008797          	auipc	a5,0x8
    800042b4:	14878793          	addi	a5,a5,328 # 8000c3f8 <etext+0x3f8>
    800042b8:	97ba                	add	a5,a5,a4
    800042ba:	439c                	lw	a5,0(a5)
    800042bc:	0007871b          	sext.w	a4,a5
    800042c0:	00008797          	auipc	a5,0x8
    800042c4:	13878793          	addi	a5,a5,312 # 8000c3f8 <etext+0x3f8>
    800042c8:	97ba                	add	a5,a5,a4
    800042ca:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    800042cc:	fe843783          	ld	a5,-24(s0)
    800042d0:	6fbc                	ld	a5,88(a5)
    800042d2:	7bbc                	ld	a5,112(a5)
    800042d4:	a091                	j	80004318 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    800042d6:	fe843783          	ld	a5,-24(s0)
    800042da:	6fbc                	ld	a5,88(a5)
    800042dc:	7fbc                	ld	a5,120(a5)
    800042de:	a82d                	j	80004318 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    800042e0:	fe843783          	ld	a5,-24(s0)
    800042e4:	6fbc                	ld	a5,88(a5)
    800042e6:	63dc                	ld	a5,128(a5)
    800042e8:	a805                	j	80004318 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    800042ea:	fe843783          	ld	a5,-24(s0)
    800042ee:	6fbc                	ld	a5,88(a5)
    800042f0:	67dc                	ld	a5,136(a5)
    800042f2:	a01d                	j	80004318 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    800042f4:	fe843783          	ld	a5,-24(s0)
    800042f8:	6fbc                	ld	a5,88(a5)
    800042fa:	6bdc                	ld	a5,144(a5)
    800042fc:	a831                	j	80004318 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    800042fe:	fe843783          	ld	a5,-24(s0)
    80004302:	6fbc                	ld	a5,88(a5)
    80004304:	6fdc                	ld	a5,152(a5)
    80004306:	a809                	j	80004318 <argraw+0x98>
  }
  panic("argraw");
    80004308:	00008517          	auipc	a0,0x8
    8000430c:	0e850513          	addi	a0,a0,232 # 8000c3f0 <etext+0x3f0>
    80004310:	ffffd097          	auipc	ra,0xffffd
    80004314:	97c080e7          	jalr	-1668(ra) # 80000c8c <panic>
  return -1;
}
    80004318:	853e                	mv	a0,a5
    8000431a:	70a2                	ld	ra,40(sp)
    8000431c:	7402                	ld	s0,32(sp)
    8000431e:	6145                	addi	sp,sp,48
    80004320:	8082                	ret

0000000080004322 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    80004322:	1101                	addi	sp,sp,-32
    80004324:	ec06                	sd	ra,24(sp)
    80004326:	e822                	sd	s0,16(sp)
    80004328:	1000                	addi	s0,sp,32
    8000432a:	87aa                	mv	a5,a0
    8000432c:	feb43023          	sd	a1,-32(s0)
    80004330:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004334:	fec42783          	lw	a5,-20(s0)
    80004338:	853e                	mv	a0,a5
    8000433a:	00000097          	auipc	ra,0x0
    8000433e:	f46080e7          	jalr	-186(ra) # 80004280 <argraw>
    80004342:	87aa                	mv	a5,a0
    80004344:	0007871b          	sext.w	a4,a5
    80004348:	fe043783          	ld	a5,-32(s0)
    8000434c:	c398                	sw	a4,0(a5)
}
    8000434e:	0001                	nop
    80004350:	60e2                	ld	ra,24(sp)
    80004352:	6442                	ld	s0,16(sp)
    80004354:	6105                	addi	sp,sp,32
    80004356:	8082                	ret

0000000080004358 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    80004358:	1101                	addi	sp,sp,-32
    8000435a:	ec06                	sd	ra,24(sp)
    8000435c:	e822                	sd	s0,16(sp)
    8000435e:	1000                	addi	s0,sp,32
    80004360:	87aa                	mv	a5,a0
    80004362:	feb43023          	sd	a1,-32(s0)
    80004366:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    8000436a:	fec42783          	lw	a5,-20(s0)
    8000436e:	853e                	mv	a0,a5
    80004370:	00000097          	auipc	ra,0x0
    80004374:	f10080e7          	jalr	-240(ra) # 80004280 <argraw>
    80004378:	872a                	mv	a4,a0
    8000437a:	fe043783          	ld	a5,-32(s0)
    8000437e:	e398                	sd	a4,0(a5)
}
    80004380:	0001                	nop
    80004382:	60e2                	ld	ra,24(sp)
    80004384:	6442                	ld	s0,16(sp)
    80004386:	6105                	addi	sp,sp,32
    80004388:	8082                	ret

000000008000438a <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    8000438a:	7179                	addi	sp,sp,-48
    8000438c:	f406                	sd	ra,40(sp)
    8000438e:	f022                	sd	s0,32(sp)
    80004390:	1800                	addi	s0,sp,48
    80004392:	87aa                	mv	a5,a0
    80004394:	fcb43823          	sd	a1,-48(s0)
    80004398:	8732                	mv	a4,a2
    8000439a:	fcf42e23          	sw	a5,-36(s0)
    8000439e:	87ba                	mv	a5,a4
    800043a0:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    800043a4:	fe840713          	addi	a4,s0,-24
    800043a8:	fdc42783          	lw	a5,-36(s0)
    800043ac:	85ba                	mv	a1,a4
    800043ae:	853e                	mv	a0,a5
    800043b0:	00000097          	auipc	ra,0x0
    800043b4:	fa8080e7          	jalr	-88(ra) # 80004358 <argaddr>
  return fetchstr(addr, buf, max);
    800043b8:	fe843783          	ld	a5,-24(s0)
    800043bc:	fd842703          	lw	a4,-40(s0)
    800043c0:	863a                	mv	a2,a4
    800043c2:	fd043583          	ld	a1,-48(s0)
    800043c6:	853e                	mv	a0,a5
    800043c8:	00000097          	auipc	ra,0x0
    800043cc:	e56080e7          	jalr	-426(ra) # 8000421e <fetchstr>
    800043d0:	87aa                	mv	a5,a0
}
    800043d2:	853e                	mv	a0,a5
    800043d4:	70a2                	ld	ra,40(sp)
    800043d6:	7402                	ld	s0,32(sp)
    800043d8:	6145                	addi	sp,sp,48
    800043da:	8082                	ret

00000000800043dc <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    800043dc:	7179                	addi	sp,sp,-48
    800043de:	f406                	sd	ra,40(sp)
    800043e0:	f022                	sd	s0,32(sp)
    800043e2:	ec26                	sd	s1,24(sp)
    800043e4:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    800043e6:	ffffe097          	auipc	ra,0xffffe
    800043ea:	632080e7          	jalr	1586(ra) # 80002a18 <myproc>
    800043ee:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    800043f2:	fd843783          	ld	a5,-40(s0)
    800043f6:	6fbc                	ld	a5,88(a5)
    800043f8:	77dc                	ld	a5,168(a5)
    800043fa:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    800043fe:	fd442783          	lw	a5,-44(s0)
    80004402:	2781                	sext.w	a5,a5
    80004404:	04f05263          	blez	a5,80004448 <syscall+0x6c>
    80004408:	fd442783          	lw	a5,-44(s0)
    8000440c:	873e                	mv	a4,a5
    8000440e:	47d5                	li	a5,21
    80004410:	02e7ec63          	bltu	a5,a4,80004448 <syscall+0x6c>
    80004414:	00008717          	auipc	a4,0x8
    80004418:	4bc70713          	addi	a4,a4,1212 # 8000c8d0 <syscalls>
    8000441c:	fd442783          	lw	a5,-44(s0)
    80004420:	078e                	slli	a5,a5,0x3
    80004422:	97ba                	add	a5,a5,a4
    80004424:	639c                	ld	a5,0(a5)
    80004426:	c38d                	beqz	a5,80004448 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    80004428:	00008717          	auipc	a4,0x8
    8000442c:	4a870713          	addi	a4,a4,1192 # 8000c8d0 <syscalls>
    80004430:	fd442783          	lw	a5,-44(s0)
    80004434:	078e                	slli	a5,a5,0x3
    80004436:	97ba                	add	a5,a5,a4
    80004438:	6398                	ld	a4,0(a5)
    8000443a:	fd843783          	ld	a5,-40(s0)
    8000443e:	6fa4                	ld	s1,88(a5)
    80004440:	9702                	jalr	a4
    80004442:	87aa                	mv	a5,a0
    80004444:	f8bc                	sd	a5,112(s1)
    80004446:	a815                	j	8000447a <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    80004448:	fd843783          	ld	a5,-40(s0)
    8000444c:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    8000444e:	fd843783          	ld	a5,-40(s0)
    80004452:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    80004456:	fd442683          	lw	a3,-44(s0)
    8000445a:	863e                	mv	a2,a5
    8000445c:	85ba                	mv	a1,a4
    8000445e:	00008517          	auipc	a0,0x8
    80004462:	fb250513          	addi	a0,a0,-78 # 8000c410 <etext+0x410>
    80004466:	ffffc097          	auipc	ra,0xffffc
    8000446a:	5d0080e7          	jalr	1488(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    8000446e:	fd843783          	ld	a5,-40(s0)
    80004472:	6fbc                	ld	a5,88(a5)
    80004474:	577d                	li	a4,-1
    80004476:	fbb8                	sd	a4,112(a5)
  }
}
    80004478:	0001                	nop
    8000447a:	0001                	nop
    8000447c:	70a2                	ld	ra,40(sp)
    8000447e:	7402                	ld	s0,32(sp)
    80004480:	64e2                	ld	s1,24(sp)
    80004482:	6145                	addi	sp,sp,48
    80004484:	8082                	ret

0000000080004486 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    80004486:	1101                	addi	sp,sp,-32
    80004488:	ec06                	sd	ra,24(sp)
    8000448a:	e822                	sd	s0,16(sp)
    8000448c:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    8000448e:	fec40793          	addi	a5,s0,-20
    80004492:	85be                	mv	a1,a5
    80004494:	4501                	li	a0,0
    80004496:	00000097          	auipc	ra,0x0
    8000449a:	e8c080e7          	jalr	-372(ra) # 80004322 <argint>
  exit(n);
    8000449e:	fec42783          	lw	a5,-20(s0)
    800044a2:	853e                	mv	a0,a5
    800044a4:	fffff097          	auipc	ra,0xfffff
    800044a8:	c66080e7          	jalr	-922(ra) # 8000310a <exit>
  return 0;  // not reached
    800044ac:	4781                	li	a5,0
}
    800044ae:	853e                	mv	a0,a5
    800044b0:	60e2                	ld	ra,24(sp)
    800044b2:	6442                	ld	s0,16(sp)
    800044b4:	6105                	addi	sp,sp,32
    800044b6:	8082                	ret

00000000800044b8 <sys_getpid>:

uint64
sys_getpid(void)
{
    800044b8:	1141                	addi	sp,sp,-16
    800044ba:	e406                	sd	ra,8(sp)
    800044bc:	e022                	sd	s0,0(sp)
    800044be:	0800                	addi	s0,sp,16
  return myproc()->pid;
    800044c0:	ffffe097          	auipc	ra,0xffffe
    800044c4:	558080e7          	jalr	1368(ra) # 80002a18 <myproc>
    800044c8:	87aa                	mv	a5,a0
    800044ca:	5b9c                	lw	a5,48(a5)
}
    800044cc:	853e                	mv	a0,a5
    800044ce:	60a2                	ld	ra,8(sp)
    800044d0:	6402                	ld	s0,0(sp)
    800044d2:	0141                	addi	sp,sp,16
    800044d4:	8082                	ret

00000000800044d6 <sys_fork>:

uint64
sys_fork(void)
{
    800044d6:	1141                	addi	sp,sp,-16
    800044d8:	e406                	sd	ra,8(sp)
    800044da:	e022                	sd	s0,0(sp)
    800044dc:	0800                	addi	s0,sp,16
  return fork();
    800044de:	fffff097          	auipc	ra,0xfffff
    800044e2:	a0a080e7          	jalr	-1526(ra) # 80002ee8 <fork>
    800044e6:	87aa                	mv	a5,a0
}
    800044e8:	853e                	mv	a0,a5
    800044ea:	60a2                	ld	ra,8(sp)
    800044ec:	6402                	ld	s0,0(sp)
    800044ee:	0141                	addi	sp,sp,16
    800044f0:	8082                	ret

00000000800044f2 <sys_wait>:

uint64
sys_wait(void)
{
    800044f2:	1101                	addi	sp,sp,-32
    800044f4:	ec06                	sd	ra,24(sp)
    800044f6:	e822                	sd	s0,16(sp)
    800044f8:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    800044fa:	fe840793          	addi	a5,s0,-24
    800044fe:	85be                	mv	a1,a5
    80004500:	4501                	li	a0,0
    80004502:	00000097          	auipc	ra,0x0
    80004506:	e56080e7          	jalr	-426(ra) # 80004358 <argaddr>
  return wait(p);
    8000450a:	fe843783          	ld	a5,-24(s0)
    8000450e:	853e                	mv	a0,a5
    80004510:	fffff097          	auipc	ra,0xfffff
    80004514:	d36080e7          	jalr	-714(ra) # 80003246 <wait>
    80004518:	87aa                	mv	a5,a0
}
    8000451a:	853e                	mv	a0,a5
    8000451c:	60e2                	ld	ra,24(sp)
    8000451e:	6442                	ld	s0,16(sp)
    80004520:	6105                	addi	sp,sp,32
    80004522:	8082                	ret

0000000080004524 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004524:	1101                	addi	sp,sp,-32
    80004526:	ec06                	sd	ra,24(sp)
    80004528:	e822                	sd	s0,16(sp)
    8000452a:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    8000452c:	fe440793          	addi	a5,s0,-28
    80004530:	85be                	mv	a1,a5
    80004532:	4501                	li	a0,0
    80004534:	00000097          	auipc	ra,0x0
    80004538:	dee080e7          	jalr	-530(ra) # 80004322 <argint>
  addr = myproc()->sz;
    8000453c:	ffffe097          	auipc	ra,0xffffe
    80004540:	4dc080e7          	jalr	1244(ra) # 80002a18 <myproc>
    80004544:	87aa                	mv	a5,a0
    80004546:	67bc                	ld	a5,72(a5)
    80004548:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    8000454c:	fe442783          	lw	a5,-28(s0)
    80004550:	853e                	mv	a0,a5
    80004552:	fffff097          	auipc	ra,0xfffff
    80004556:	8f6080e7          	jalr	-1802(ra) # 80002e48 <growproc>
    8000455a:	87aa                	mv	a5,a0
    8000455c:	0007d463          	bgez	a5,80004564 <sys_sbrk+0x40>
    return -1;
    80004560:	57fd                	li	a5,-1
    80004562:	a019                	j	80004568 <sys_sbrk+0x44>
  return addr;
    80004564:	fe843783          	ld	a5,-24(s0)
}
    80004568:	853e                	mv	a0,a5
    8000456a:	60e2                	ld	ra,24(sp)
    8000456c:	6442                	ld	s0,16(sp)
    8000456e:	6105                	addi	sp,sp,32
    80004570:	8082                	ret

0000000080004572 <sys_sleep>:

uint64
sys_sleep(void)
{
    80004572:	1101                	addi	sp,sp,-32
    80004574:	ec06                	sd	ra,24(sp)
    80004576:	e822                	sd	s0,16(sp)
    80004578:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    8000457a:	fe840793          	addi	a5,s0,-24
    8000457e:	85be                	mv	a1,a5
    80004580:	4501                	li	a0,0
    80004582:	00000097          	auipc	ra,0x0
    80004586:	da0080e7          	jalr	-608(ra) # 80004322 <argint>
  acquire(&tickslock);
    8000458a:	00016517          	auipc	a0,0x16
    8000458e:	4de50513          	addi	a0,a0,1246 # 8001aa68 <tickslock>
    80004592:	ffffd097          	auipc	ra,0xffffd
    80004596:	daa080e7          	jalr	-598(ra) # 8000133c <acquire>
  ticks0 = ticks;
    8000459a:	00008797          	auipc	a5,0x8
    8000459e:	42e78793          	addi	a5,a5,1070 # 8000c9c8 <ticks>
    800045a2:	439c                	lw	a5,0(a5)
    800045a4:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    800045a8:	a099                	j	800045ee <sys_sleep+0x7c>
    if(killed(myproc())){
    800045aa:	ffffe097          	auipc	ra,0xffffe
    800045ae:	46e080e7          	jalr	1134(ra) # 80002a18 <myproc>
    800045b2:	87aa                	mv	a5,a0
    800045b4:	853e                	mv	a0,a5
    800045b6:	fffff097          	auipc	ra,0xfffff
    800045ba:	232080e7          	jalr	562(ra) # 800037e8 <killed>
    800045be:	87aa                	mv	a5,a0
    800045c0:	cb99                	beqz	a5,800045d6 <sys_sleep+0x64>
      release(&tickslock);
    800045c2:	00016517          	auipc	a0,0x16
    800045c6:	4a650513          	addi	a0,a0,1190 # 8001aa68 <tickslock>
    800045ca:	ffffd097          	auipc	ra,0xffffd
    800045ce:	dd6080e7          	jalr	-554(ra) # 800013a0 <release>
      return -1;
    800045d2:	57fd                	li	a5,-1
    800045d4:	a0b1                	j	80004620 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    800045d6:	00016597          	auipc	a1,0x16
    800045da:	49258593          	addi	a1,a1,1170 # 8001aa68 <tickslock>
    800045de:	00008517          	auipc	a0,0x8
    800045e2:	3ea50513          	addi	a0,a0,1002 # 8000c9c8 <ticks>
    800045e6:	fffff097          	auipc	ra,0xfffff
    800045ea:	ff4080e7          	jalr	-12(ra) # 800035da <sleep>
  while(ticks - ticks0 < n){
    800045ee:	00008797          	auipc	a5,0x8
    800045f2:	3da78793          	addi	a5,a5,986 # 8000c9c8 <ticks>
    800045f6:	4398                	lw	a4,0(a5)
    800045f8:	fec42783          	lw	a5,-20(s0)
    800045fc:	40f707bb          	subw	a5,a4,a5
    80004600:	0007871b          	sext.w	a4,a5
    80004604:	fe842783          	lw	a5,-24(s0)
    80004608:	2781                	sext.w	a5,a5
    8000460a:	faf760e3          	bltu	a4,a5,800045aa <sys_sleep+0x38>
  }
  release(&tickslock);
    8000460e:	00016517          	auipc	a0,0x16
    80004612:	45a50513          	addi	a0,a0,1114 # 8001aa68 <tickslock>
    80004616:	ffffd097          	auipc	ra,0xffffd
    8000461a:	d8a080e7          	jalr	-630(ra) # 800013a0 <release>
  return 0;
    8000461e:	4781                	li	a5,0
}
    80004620:	853e                	mv	a0,a5
    80004622:	60e2                	ld	ra,24(sp)
    80004624:	6442                	ld	s0,16(sp)
    80004626:	6105                	addi	sp,sp,32
    80004628:	8082                	ret

000000008000462a <sys_kill>:

uint64
sys_kill(void)
{
    8000462a:	1101                	addi	sp,sp,-32
    8000462c:	ec06                	sd	ra,24(sp)
    8000462e:	e822                	sd	s0,16(sp)
    80004630:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    80004632:	fec40793          	addi	a5,s0,-20
    80004636:	85be                	mv	a1,a5
    80004638:	4501                	li	a0,0
    8000463a:	00000097          	auipc	ra,0x0
    8000463e:	ce8080e7          	jalr	-792(ra) # 80004322 <argint>
  return kill(pid);
    80004642:	fec42783          	lw	a5,-20(s0)
    80004646:	853e                	mv	a0,a5
    80004648:	fffff097          	auipc	ra,0xfffff
    8000464c:	0c6080e7          	jalr	198(ra) # 8000370e <kill>
    80004650:	87aa                	mv	a5,a0
}
    80004652:	853e                	mv	a0,a5
    80004654:	60e2                	ld	ra,24(sp)
    80004656:	6442                	ld	s0,16(sp)
    80004658:	6105                	addi	sp,sp,32
    8000465a:	8082                	ret

000000008000465c <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8000465c:	1101                	addi	sp,sp,-32
    8000465e:	ec06                	sd	ra,24(sp)
    80004660:	e822                	sd	s0,16(sp)
    80004662:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004664:	00016517          	auipc	a0,0x16
    80004668:	40450513          	addi	a0,a0,1028 # 8001aa68 <tickslock>
    8000466c:	ffffd097          	auipc	ra,0xffffd
    80004670:	cd0080e7          	jalr	-816(ra) # 8000133c <acquire>
  xticks = ticks;
    80004674:	00008797          	auipc	a5,0x8
    80004678:	35478793          	addi	a5,a5,852 # 8000c9c8 <ticks>
    8000467c:	439c                	lw	a5,0(a5)
    8000467e:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    80004682:	00016517          	auipc	a0,0x16
    80004686:	3e650513          	addi	a0,a0,998 # 8001aa68 <tickslock>
    8000468a:	ffffd097          	auipc	ra,0xffffd
    8000468e:	d16080e7          	jalr	-746(ra) # 800013a0 <release>
  return xticks;
    80004692:	fec46783          	lwu	a5,-20(s0)
}
    80004696:	853e                	mv	a0,a5
    80004698:	60e2                	ld	ra,24(sp)
    8000469a:	6442                	ld	s0,16(sp)
    8000469c:	6105                	addi	sp,sp,32
    8000469e:	8082                	ret

00000000800046a0 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800046a0:	1101                	addi	sp,sp,-32
    800046a2:	ec06                	sd	ra,24(sp)
    800046a4:	e822                	sd	s0,16(sp)
    800046a6:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800046a8:	00008597          	auipc	a1,0x8
    800046ac:	d8858593          	addi	a1,a1,-632 # 8000c430 <etext+0x430>
    800046b0:	00016517          	auipc	a0,0x16
    800046b4:	3d050513          	addi	a0,a0,976 # 8001aa80 <bcache>
    800046b8:	ffffd097          	auipc	ra,0xffffd
    800046bc:	c54080e7          	jalr	-940(ra) # 8000130c <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800046c0:	00016717          	auipc	a4,0x16
    800046c4:	3c070713          	addi	a4,a4,960 # 8001aa80 <bcache>
    800046c8:	67a1                	lui	a5,0x8
    800046ca:	97ba                	add	a5,a5,a4
    800046cc:	0001e717          	auipc	a4,0x1e
    800046d0:	61c70713          	addi	a4,a4,1564 # 80022ce8 <bcache+0x8268>
    800046d4:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    800046d8:	00016717          	auipc	a4,0x16
    800046dc:	3a870713          	addi	a4,a4,936 # 8001aa80 <bcache>
    800046e0:	67a1                	lui	a5,0x8
    800046e2:	97ba                	add	a5,a5,a4
    800046e4:	0001e717          	auipc	a4,0x1e
    800046e8:	60470713          	addi	a4,a4,1540 # 80022ce8 <bcache+0x8268>
    800046ec:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800046f0:	00016797          	auipc	a5,0x16
    800046f4:	3a878793          	addi	a5,a5,936 # 8001aa98 <bcache+0x18>
    800046f8:	fef43423          	sd	a5,-24(s0)
    800046fc:	a895                	j	80004770 <binit+0xd0>
    b->next = bcache.head.next;
    800046fe:	00016717          	auipc	a4,0x16
    80004702:	38270713          	addi	a4,a4,898 # 8001aa80 <bcache>
    80004706:	67a1                	lui	a5,0x8
    80004708:	97ba                	add	a5,a5,a4
    8000470a:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000470e:	fe843783          	ld	a5,-24(s0)
    80004712:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004714:	fe843783          	ld	a5,-24(s0)
    80004718:	0001e717          	auipc	a4,0x1e
    8000471c:	5d070713          	addi	a4,a4,1488 # 80022ce8 <bcache+0x8268>
    80004720:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004722:	fe843783          	ld	a5,-24(s0)
    80004726:	07c1                	addi	a5,a5,16
    80004728:	00008597          	auipc	a1,0x8
    8000472c:	d1058593          	addi	a1,a1,-752 # 8000c438 <etext+0x438>
    80004730:	853e                	mv	a0,a5
    80004732:	00002097          	auipc	ra,0x2
    80004736:	034080e7          	jalr	52(ra) # 80006766 <initsleeplock>
    bcache.head.next->prev = b;
    8000473a:	00016717          	auipc	a4,0x16
    8000473e:	34670713          	addi	a4,a4,838 # 8001aa80 <bcache>
    80004742:	67a1                	lui	a5,0x8
    80004744:	97ba                	add	a5,a5,a4
    80004746:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000474a:	fe843703          	ld	a4,-24(s0)
    8000474e:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004750:	00016717          	auipc	a4,0x16
    80004754:	33070713          	addi	a4,a4,816 # 8001aa80 <bcache>
    80004758:	67a1                	lui	a5,0x8
    8000475a:	97ba                	add	a5,a5,a4
    8000475c:	fe843703          	ld	a4,-24(s0)
    80004760:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004764:	fe843783          	ld	a5,-24(s0)
    80004768:	45878793          	addi	a5,a5,1112
    8000476c:	fef43423          	sd	a5,-24(s0)
    80004770:	0001e797          	auipc	a5,0x1e
    80004774:	57878793          	addi	a5,a5,1400 # 80022ce8 <bcache+0x8268>
    80004778:	fe843703          	ld	a4,-24(s0)
    8000477c:	f8f761e3          	bltu	a4,a5,800046fe <binit+0x5e>
  }
}
    80004780:	0001                	nop
    80004782:	0001                	nop
    80004784:	60e2                	ld	ra,24(sp)
    80004786:	6442                	ld	s0,16(sp)
    80004788:	6105                	addi	sp,sp,32
    8000478a:	8082                	ret

000000008000478c <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    8000478c:	7179                	addi	sp,sp,-48
    8000478e:	f406                	sd	ra,40(sp)
    80004790:	f022                	sd	s0,32(sp)
    80004792:	1800                	addi	s0,sp,48
    80004794:	87aa                	mv	a5,a0
    80004796:	872e                	mv	a4,a1
    80004798:	fcf42e23          	sw	a5,-36(s0)
    8000479c:	87ba                	mv	a5,a4
    8000479e:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    800047a2:	00016517          	auipc	a0,0x16
    800047a6:	2de50513          	addi	a0,a0,734 # 8001aa80 <bcache>
    800047aa:	ffffd097          	auipc	ra,0xffffd
    800047ae:	b92080e7          	jalr	-1134(ra) # 8000133c <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800047b2:	00016717          	auipc	a4,0x16
    800047b6:	2ce70713          	addi	a4,a4,718 # 8001aa80 <bcache>
    800047ba:	67a1                	lui	a5,0x8
    800047bc:	97ba                	add	a5,a5,a4
    800047be:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047c2:	fef43423          	sd	a5,-24(s0)
    800047c6:	a095                	j	8000482a <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800047c8:	fe843783          	ld	a5,-24(s0)
    800047cc:	4798                	lw	a4,8(a5)
    800047ce:	fdc42783          	lw	a5,-36(s0)
    800047d2:	2781                	sext.w	a5,a5
    800047d4:	04e79663          	bne	a5,a4,80004820 <bget+0x94>
    800047d8:	fe843783          	ld	a5,-24(s0)
    800047dc:	47d8                	lw	a4,12(a5)
    800047de:	fd842783          	lw	a5,-40(s0)
    800047e2:	2781                	sext.w	a5,a5
    800047e4:	02e79e63          	bne	a5,a4,80004820 <bget+0x94>
      b->refcnt++;
    800047e8:	fe843783          	ld	a5,-24(s0)
    800047ec:	43bc                	lw	a5,64(a5)
    800047ee:	2785                	addiw	a5,a5,1
    800047f0:	0007871b          	sext.w	a4,a5
    800047f4:	fe843783          	ld	a5,-24(s0)
    800047f8:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800047fa:	00016517          	auipc	a0,0x16
    800047fe:	28650513          	addi	a0,a0,646 # 8001aa80 <bcache>
    80004802:	ffffd097          	auipc	ra,0xffffd
    80004806:	b9e080e7          	jalr	-1122(ra) # 800013a0 <release>
      acquiresleep(&b->lock);
    8000480a:	fe843783          	ld	a5,-24(s0)
    8000480e:	07c1                	addi	a5,a5,16
    80004810:	853e                	mv	a0,a5
    80004812:	00002097          	auipc	ra,0x2
    80004816:	fa0080e7          	jalr	-96(ra) # 800067b2 <acquiresleep>
      return b;
    8000481a:	fe843783          	ld	a5,-24(s0)
    8000481e:	a07d                	j	800048cc <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004820:	fe843783          	ld	a5,-24(s0)
    80004824:	6bbc                	ld	a5,80(a5)
    80004826:	fef43423          	sd	a5,-24(s0)
    8000482a:	fe843703          	ld	a4,-24(s0)
    8000482e:	0001e797          	auipc	a5,0x1e
    80004832:	4ba78793          	addi	a5,a5,1210 # 80022ce8 <bcache+0x8268>
    80004836:	f8f719e3          	bne	a4,a5,800047c8 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000483a:	00016717          	auipc	a4,0x16
    8000483e:	24670713          	addi	a4,a4,582 # 8001aa80 <bcache>
    80004842:	67a1                	lui	a5,0x8
    80004844:	97ba                	add	a5,a5,a4
    80004846:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    8000484a:	fef43423          	sd	a5,-24(s0)
    8000484e:	a8b9                	j	800048ac <bget+0x120>
    if(b->refcnt == 0) {
    80004850:	fe843783          	ld	a5,-24(s0)
    80004854:	43bc                	lw	a5,64(a5)
    80004856:	e7b1                	bnez	a5,800048a2 <bget+0x116>
      b->dev = dev;
    80004858:	fe843783          	ld	a5,-24(s0)
    8000485c:	fdc42703          	lw	a4,-36(s0)
    80004860:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004862:	fe843783          	ld	a5,-24(s0)
    80004866:	fd842703          	lw	a4,-40(s0)
    8000486a:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    8000486c:	fe843783          	ld	a5,-24(s0)
    80004870:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004874:	fe843783          	ld	a5,-24(s0)
    80004878:	4705                	li	a4,1
    8000487a:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000487c:	00016517          	auipc	a0,0x16
    80004880:	20450513          	addi	a0,a0,516 # 8001aa80 <bcache>
    80004884:	ffffd097          	auipc	ra,0xffffd
    80004888:	b1c080e7          	jalr	-1252(ra) # 800013a0 <release>
      acquiresleep(&b->lock);
    8000488c:	fe843783          	ld	a5,-24(s0)
    80004890:	07c1                	addi	a5,a5,16
    80004892:	853e                	mv	a0,a5
    80004894:	00002097          	auipc	ra,0x2
    80004898:	f1e080e7          	jalr	-226(ra) # 800067b2 <acquiresleep>
      return b;
    8000489c:	fe843783          	ld	a5,-24(s0)
    800048a0:	a035                	j	800048cc <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800048a2:	fe843783          	ld	a5,-24(s0)
    800048a6:	67bc                	ld	a5,72(a5)
    800048a8:	fef43423          	sd	a5,-24(s0)
    800048ac:	fe843703          	ld	a4,-24(s0)
    800048b0:	0001e797          	auipc	a5,0x1e
    800048b4:	43878793          	addi	a5,a5,1080 # 80022ce8 <bcache+0x8268>
    800048b8:	f8f71ce3          	bne	a4,a5,80004850 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800048bc:	00008517          	auipc	a0,0x8
    800048c0:	b8450513          	addi	a0,a0,-1148 # 8000c440 <etext+0x440>
    800048c4:	ffffc097          	auipc	ra,0xffffc
    800048c8:	3c8080e7          	jalr	968(ra) # 80000c8c <panic>
}
    800048cc:	853e                	mv	a0,a5
    800048ce:	70a2                	ld	ra,40(sp)
    800048d0:	7402                	ld	s0,32(sp)
    800048d2:	6145                	addi	sp,sp,48
    800048d4:	8082                	ret

00000000800048d6 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    800048d6:	7179                	addi	sp,sp,-48
    800048d8:	f406                	sd	ra,40(sp)
    800048da:	f022                	sd	s0,32(sp)
    800048dc:	1800                	addi	s0,sp,48
    800048de:	87aa                	mv	a5,a0
    800048e0:	872e                	mv	a4,a1
    800048e2:	fcf42e23          	sw	a5,-36(s0)
    800048e6:	87ba                	mv	a5,a4
    800048e8:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    800048ec:	fd842703          	lw	a4,-40(s0)
    800048f0:	fdc42783          	lw	a5,-36(s0)
    800048f4:	85ba                	mv	a1,a4
    800048f6:	853e                	mv	a0,a5
    800048f8:	00000097          	auipc	ra,0x0
    800048fc:	e94080e7          	jalr	-364(ra) # 8000478c <bget>
    80004900:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004904:	fe843783          	ld	a5,-24(s0)
    80004908:	439c                	lw	a5,0(a5)
    8000490a:	ef91                	bnez	a5,80004926 <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    8000490c:	4681                	li	a3,0
    8000490e:	4601                	li	a2,0
    80004910:	fe843583          	ld	a1,-24(s0)
    80004914:	4501                	li	a0,0
    80004916:	00005097          	auipc	ra,0x5
    8000491a:	eba080e7          	jalr	-326(ra) # 800097d0 <virtio_disk_rw>
    b->valid = 1;
    8000491e:	fe843783          	ld	a5,-24(s0)
    80004922:	4705                	li	a4,1
    80004924:	c398                	sw	a4,0(a5)
  }
  return b;
    80004926:	fe843783          	ld	a5,-24(s0)
}
    8000492a:	853e                	mv	a0,a5
    8000492c:	70a2                	ld	ra,40(sp)
    8000492e:	7402                	ld	s0,32(sp)
    80004930:	6145                	addi	sp,sp,48
    80004932:	8082                	ret

0000000080004934 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004934:	1101                	addi	sp,sp,-32
    80004936:	ec06                	sd	ra,24(sp)
    80004938:	e822                	sd	s0,16(sp)
    8000493a:	1000                	addi	s0,sp,32
    8000493c:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004940:	fe843783          	ld	a5,-24(s0)
    80004944:	07c1                	addi	a5,a5,16
    80004946:	853e                	mv	a0,a5
    80004948:	00002097          	auipc	ra,0x2
    8000494c:	f2a080e7          	jalr	-214(ra) # 80006872 <holdingsleep>
    80004950:	87aa                	mv	a5,a0
    80004952:	eb89                	bnez	a5,80004964 <bwrite+0x30>
    panic("bwrite");
    80004954:	00008517          	auipc	a0,0x8
    80004958:	b0450513          	addi	a0,a0,-1276 # 8000c458 <etext+0x458>
    8000495c:	ffffc097          	auipc	ra,0xffffc
    80004960:	330080e7          	jalr	816(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    80004964:	4681                	li	a3,0
    80004966:	4605                	li	a2,1
    80004968:	fe843583          	ld	a1,-24(s0)
    8000496c:	4501                	li	a0,0
    8000496e:	00005097          	auipc	ra,0x5
    80004972:	e62080e7          	jalr	-414(ra) # 800097d0 <virtio_disk_rw>
}
    80004976:	0001                	nop
    80004978:	60e2                	ld	ra,24(sp)
    8000497a:	6442                	ld	s0,16(sp)
    8000497c:	6105                	addi	sp,sp,32
    8000497e:	8082                	ret

0000000080004980 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004980:	1101                	addi	sp,sp,-32
    80004982:	ec06                	sd	ra,24(sp)
    80004984:	e822                	sd	s0,16(sp)
    80004986:	1000                	addi	s0,sp,32
    80004988:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    8000498c:	fe843783          	ld	a5,-24(s0)
    80004990:	07c1                	addi	a5,a5,16
    80004992:	853e                	mv	a0,a5
    80004994:	00002097          	auipc	ra,0x2
    80004998:	ede080e7          	jalr	-290(ra) # 80006872 <holdingsleep>
    8000499c:	87aa                	mv	a5,a0
    8000499e:	eb89                	bnez	a5,800049b0 <brelse+0x30>
    panic("brelse");
    800049a0:	00008517          	auipc	a0,0x8
    800049a4:	ac050513          	addi	a0,a0,-1344 # 8000c460 <etext+0x460>
    800049a8:	ffffc097          	auipc	ra,0xffffc
    800049ac:	2e4080e7          	jalr	740(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    800049b0:	fe843783          	ld	a5,-24(s0)
    800049b4:	07c1                	addi	a5,a5,16
    800049b6:	853e                	mv	a0,a5
    800049b8:	00002097          	auipc	ra,0x2
    800049bc:	e68080e7          	jalr	-408(ra) # 80006820 <releasesleep>

  acquire(&bcache.lock);
    800049c0:	00016517          	auipc	a0,0x16
    800049c4:	0c050513          	addi	a0,a0,192 # 8001aa80 <bcache>
    800049c8:	ffffd097          	auipc	ra,0xffffd
    800049cc:	974080e7          	jalr	-1676(ra) # 8000133c <acquire>
  b->refcnt--;
    800049d0:	fe843783          	ld	a5,-24(s0)
    800049d4:	43bc                	lw	a5,64(a5)
    800049d6:	37fd                	addiw	a5,a5,-1
    800049d8:	0007871b          	sext.w	a4,a5
    800049dc:	fe843783          	ld	a5,-24(s0)
    800049e0:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    800049e2:	fe843783          	ld	a5,-24(s0)
    800049e6:	43bc                	lw	a5,64(a5)
    800049e8:	e7b5                	bnez	a5,80004a54 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    800049ea:	fe843783          	ld	a5,-24(s0)
    800049ee:	6bbc                	ld	a5,80(a5)
    800049f0:	fe843703          	ld	a4,-24(s0)
    800049f4:	6738                	ld	a4,72(a4)
    800049f6:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    800049f8:	fe843783          	ld	a5,-24(s0)
    800049fc:	67bc                	ld	a5,72(a5)
    800049fe:	fe843703          	ld	a4,-24(s0)
    80004a02:	6b38                	ld	a4,80(a4)
    80004a04:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004a06:	00016717          	auipc	a4,0x16
    80004a0a:	07a70713          	addi	a4,a4,122 # 8001aa80 <bcache>
    80004a0e:	67a1                	lui	a5,0x8
    80004a10:	97ba                	add	a5,a5,a4
    80004a12:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a16:	fe843783          	ld	a5,-24(s0)
    80004a1a:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004a1c:	fe843783          	ld	a5,-24(s0)
    80004a20:	0001e717          	auipc	a4,0x1e
    80004a24:	2c870713          	addi	a4,a4,712 # 80022ce8 <bcache+0x8268>
    80004a28:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004a2a:	00016717          	auipc	a4,0x16
    80004a2e:	05670713          	addi	a4,a4,86 # 8001aa80 <bcache>
    80004a32:	67a1                	lui	a5,0x8
    80004a34:	97ba                	add	a5,a5,a4
    80004a36:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a3a:	fe843703          	ld	a4,-24(s0)
    80004a3e:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004a40:	00016717          	auipc	a4,0x16
    80004a44:	04070713          	addi	a4,a4,64 # 8001aa80 <bcache>
    80004a48:	67a1                	lui	a5,0x8
    80004a4a:	97ba                	add	a5,a5,a4
    80004a4c:	fe843703          	ld	a4,-24(s0)
    80004a50:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004a54:	00016517          	auipc	a0,0x16
    80004a58:	02c50513          	addi	a0,a0,44 # 8001aa80 <bcache>
    80004a5c:	ffffd097          	auipc	ra,0xffffd
    80004a60:	944080e7          	jalr	-1724(ra) # 800013a0 <release>
}
    80004a64:	0001                	nop
    80004a66:	60e2                	ld	ra,24(sp)
    80004a68:	6442                	ld	s0,16(sp)
    80004a6a:	6105                	addi	sp,sp,32
    80004a6c:	8082                	ret

0000000080004a6e <bpin>:

void
bpin(struct buf *b) {
    80004a6e:	1101                	addi	sp,sp,-32
    80004a70:	ec06                	sd	ra,24(sp)
    80004a72:	e822                	sd	s0,16(sp)
    80004a74:	1000                	addi	s0,sp,32
    80004a76:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004a7a:	00016517          	auipc	a0,0x16
    80004a7e:	00650513          	addi	a0,a0,6 # 8001aa80 <bcache>
    80004a82:	ffffd097          	auipc	ra,0xffffd
    80004a86:	8ba080e7          	jalr	-1862(ra) # 8000133c <acquire>
  b->refcnt++;
    80004a8a:	fe843783          	ld	a5,-24(s0)
    80004a8e:	43bc                	lw	a5,64(a5)
    80004a90:	2785                	addiw	a5,a5,1
    80004a92:	0007871b          	sext.w	a4,a5
    80004a96:	fe843783          	ld	a5,-24(s0)
    80004a9a:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004a9c:	00016517          	auipc	a0,0x16
    80004aa0:	fe450513          	addi	a0,a0,-28 # 8001aa80 <bcache>
    80004aa4:	ffffd097          	auipc	ra,0xffffd
    80004aa8:	8fc080e7          	jalr	-1796(ra) # 800013a0 <release>
}
    80004aac:	0001                	nop
    80004aae:	60e2                	ld	ra,24(sp)
    80004ab0:	6442                	ld	s0,16(sp)
    80004ab2:	6105                	addi	sp,sp,32
    80004ab4:	8082                	ret

0000000080004ab6 <bunpin>:

void
bunpin(struct buf *b) {
    80004ab6:	1101                	addi	sp,sp,-32
    80004ab8:	ec06                	sd	ra,24(sp)
    80004aba:	e822                	sd	s0,16(sp)
    80004abc:	1000                	addi	s0,sp,32
    80004abe:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004ac2:	00016517          	auipc	a0,0x16
    80004ac6:	fbe50513          	addi	a0,a0,-66 # 8001aa80 <bcache>
    80004aca:	ffffd097          	auipc	ra,0xffffd
    80004ace:	872080e7          	jalr	-1934(ra) # 8000133c <acquire>
  b->refcnt--;
    80004ad2:	fe843783          	ld	a5,-24(s0)
    80004ad6:	43bc                	lw	a5,64(a5)
    80004ad8:	37fd                	addiw	a5,a5,-1
    80004ada:	0007871b          	sext.w	a4,a5
    80004ade:	fe843783          	ld	a5,-24(s0)
    80004ae2:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004ae4:	00016517          	auipc	a0,0x16
    80004ae8:	f9c50513          	addi	a0,a0,-100 # 8001aa80 <bcache>
    80004aec:	ffffd097          	auipc	ra,0xffffd
    80004af0:	8b4080e7          	jalr	-1868(ra) # 800013a0 <release>
}
    80004af4:	0001                	nop
    80004af6:	60e2                	ld	ra,24(sp)
    80004af8:	6442                	ld	s0,16(sp)
    80004afa:	6105                	addi	sp,sp,32
    80004afc:	8082                	ret

0000000080004afe <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004afe:	7179                	addi	sp,sp,-48
    80004b00:	f406                	sd	ra,40(sp)
    80004b02:	f022                	sd	s0,32(sp)
    80004b04:	1800                	addi	s0,sp,48
    80004b06:	87aa                	mv	a5,a0
    80004b08:	fcb43823          	sd	a1,-48(s0)
    80004b0c:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004b10:	fdc42783          	lw	a5,-36(s0)
    80004b14:	4585                	li	a1,1
    80004b16:	853e                	mv	a0,a5
    80004b18:	00000097          	auipc	ra,0x0
    80004b1c:	dbe080e7          	jalr	-578(ra) # 800048d6 <bread>
    80004b20:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004b24:	fe843783          	ld	a5,-24(s0)
    80004b28:	05878793          	addi	a5,a5,88
    80004b2c:	02000613          	li	a2,32
    80004b30:	85be                	mv	a1,a5
    80004b32:	fd043503          	ld	a0,-48(s0)
    80004b36:	ffffd097          	auipc	ra,0xffffd
    80004b3a:	abe080e7          	jalr	-1346(ra) # 800015f4 <memmove>
  brelse(bp);
    80004b3e:	fe843503          	ld	a0,-24(s0)
    80004b42:	00000097          	auipc	ra,0x0
    80004b46:	e3e080e7          	jalr	-450(ra) # 80004980 <brelse>
}
    80004b4a:	0001                	nop
    80004b4c:	70a2                	ld	ra,40(sp)
    80004b4e:	7402                	ld	s0,32(sp)
    80004b50:	6145                	addi	sp,sp,48
    80004b52:	8082                	ret

0000000080004b54 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004b54:	1101                	addi	sp,sp,-32
    80004b56:	ec06                	sd	ra,24(sp)
    80004b58:	e822                	sd	s0,16(sp)
    80004b5a:	1000                	addi	s0,sp,32
    80004b5c:	87aa                	mv	a5,a0
    80004b5e:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004b62:	fec42783          	lw	a5,-20(s0)
    80004b66:	0001e597          	auipc	a1,0x1e
    80004b6a:	5da58593          	addi	a1,a1,1498 # 80023140 <sb>
    80004b6e:	853e                	mv	a0,a5
    80004b70:	00000097          	auipc	ra,0x0
    80004b74:	f8e080e7          	jalr	-114(ra) # 80004afe <readsb>
  if(sb.magic != FSMAGIC)
    80004b78:	0001e797          	auipc	a5,0x1e
    80004b7c:	5c878793          	addi	a5,a5,1480 # 80023140 <sb>
    80004b80:	439c                	lw	a5,0(a5)
    80004b82:	873e                	mv	a4,a5
    80004b84:	102037b7          	lui	a5,0x10203
    80004b88:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004b8c:	00f70a63          	beq	a4,a5,80004ba0 <fsinit+0x4c>
    panic("invalid file system");
    80004b90:	00008517          	auipc	a0,0x8
    80004b94:	8d850513          	addi	a0,a0,-1832 # 8000c468 <etext+0x468>
    80004b98:	ffffc097          	auipc	ra,0xffffc
    80004b9c:	0f4080e7          	jalr	244(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004ba0:	fec42783          	lw	a5,-20(s0)
    80004ba4:	0001e597          	auipc	a1,0x1e
    80004ba8:	59c58593          	addi	a1,a1,1436 # 80023140 <sb>
    80004bac:	853e                	mv	a0,a5
    80004bae:	00001097          	auipc	ra,0x1
    80004bb2:	49c080e7          	jalr	1180(ra) # 8000604a <initlog>
}
    80004bb6:	0001                	nop
    80004bb8:	60e2                	ld	ra,24(sp)
    80004bba:	6442                	ld	s0,16(sp)
    80004bbc:	6105                	addi	sp,sp,32
    80004bbe:	8082                	ret

0000000080004bc0 <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004bc0:	7179                	addi	sp,sp,-48
    80004bc2:	f406                	sd	ra,40(sp)
    80004bc4:	f022                	sd	s0,32(sp)
    80004bc6:	1800                	addi	s0,sp,48
    80004bc8:	87aa                	mv	a5,a0
    80004bca:	872e                	mv	a4,a1
    80004bcc:	fcf42e23          	sw	a5,-36(s0)
    80004bd0:	87ba                	mv	a5,a4
    80004bd2:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004bd6:	fdc42783          	lw	a5,-36(s0)
    80004bda:	fd842703          	lw	a4,-40(s0)
    80004bde:	85ba                	mv	a1,a4
    80004be0:	853e                	mv	a0,a5
    80004be2:	00000097          	auipc	ra,0x0
    80004be6:	cf4080e7          	jalr	-780(ra) # 800048d6 <bread>
    80004bea:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004bee:	fe843783          	ld	a5,-24(s0)
    80004bf2:	05878793          	addi	a5,a5,88
    80004bf6:	40000613          	li	a2,1024
    80004bfa:	4581                	li	a1,0
    80004bfc:	853e                	mv	a0,a5
    80004bfe:	ffffd097          	auipc	ra,0xffffd
    80004c02:	912080e7          	jalr	-1774(ra) # 80001510 <memset>
  log_write(bp);
    80004c06:	fe843503          	ld	a0,-24(s0)
    80004c0a:	00002097          	auipc	ra,0x2
    80004c0e:	a28080e7          	jalr	-1496(ra) # 80006632 <log_write>
  brelse(bp);
    80004c12:	fe843503          	ld	a0,-24(s0)
    80004c16:	00000097          	auipc	ra,0x0
    80004c1a:	d6a080e7          	jalr	-662(ra) # 80004980 <brelse>
}
    80004c1e:	0001                	nop
    80004c20:	70a2                	ld	ra,40(sp)
    80004c22:	7402                	ld	s0,32(sp)
    80004c24:	6145                	addi	sp,sp,48
    80004c26:	8082                	ret

0000000080004c28 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004c28:	7139                	addi	sp,sp,-64
    80004c2a:	fc06                	sd	ra,56(sp)
    80004c2c:	f822                	sd	s0,48(sp)
    80004c2e:	0080                	addi	s0,sp,64
    80004c30:	87aa                	mv	a5,a0
    80004c32:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004c36:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004c3a:	fe042623          	sw	zero,-20(s0)
    80004c3e:	a2b5                	j	80004daa <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004c40:	fec42783          	lw	a5,-20(s0)
    80004c44:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c48:	0137571b          	srliw	a4,a4,0x13
    80004c4c:	9fb9                	addw	a5,a5,a4
    80004c4e:	40d7d79b          	sraiw	a5,a5,0xd
    80004c52:	2781                	sext.w	a5,a5
    80004c54:	0007871b          	sext.w	a4,a5
    80004c58:	0001e797          	auipc	a5,0x1e
    80004c5c:	4e878793          	addi	a5,a5,1256 # 80023140 <sb>
    80004c60:	4fdc                	lw	a5,28(a5)
    80004c62:	9fb9                	addw	a5,a5,a4
    80004c64:	0007871b          	sext.w	a4,a5
    80004c68:	fcc42783          	lw	a5,-52(s0)
    80004c6c:	85ba                	mv	a1,a4
    80004c6e:	853e                	mv	a0,a5
    80004c70:	00000097          	auipc	ra,0x0
    80004c74:	c66080e7          	jalr	-922(ra) # 800048d6 <bread>
    80004c78:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004c7c:	fe042423          	sw	zero,-24(s0)
    80004c80:	a0dd                	j	80004d66 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004c82:	fe842703          	lw	a4,-24(s0)
    80004c86:	41f7579b          	sraiw	a5,a4,0x1f
    80004c8a:	01d7d79b          	srliw	a5,a5,0x1d
    80004c8e:	9f3d                	addw	a4,a4,a5
    80004c90:	8b1d                	andi	a4,a4,7
    80004c92:	40f707bb          	subw	a5,a4,a5
    80004c96:	2781                	sext.w	a5,a5
    80004c98:	4705                	li	a4,1
    80004c9a:	00f717bb          	sllw	a5,a4,a5
    80004c9e:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004ca2:	fe842783          	lw	a5,-24(s0)
    80004ca6:	41f7d71b          	sraiw	a4,a5,0x1f
    80004caa:	01d7571b          	srliw	a4,a4,0x1d
    80004cae:	9fb9                	addw	a5,a5,a4
    80004cb0:	4037d79b          	sraiw	a5,a5,0x3
    80004cb4:	2781                	sext.w	a5,a5
    80004cb6:	fe043703          	ld	a4,-32(s0)
    80004cba:	97ba                	add	a5,a5,a4
    80004cbc:	0587c783          	lbu	a5,88(a5)
    80004cc0:	0007871b          	sext.w	a4,a5
    80004cc4:	fdc42783          	lw	a5,-36(s0)
    80004cc8:	8ff9                	and	a5,a5,a4
    80004cca:	2781                	sext.w	a5,a5
    80004ccc:	ebc1                	bnez	a5,80004d5c <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004cce:	fe842783          	lw	a5,-24(s0)
    80004cd2:	41f7d71b          	sraiw	a4,a5,0x1f
    80004cd6:	01d7571b          	srliw	a4,a4,0x1d
    80004cda:	9fb9                	addw	a5,a5,a4
    80004cdc:	4037d79b          	sraiw	a5,a5,0x3
    80004ce0:	2781                	sext.w	a5,a5
    80004ce2:	fe043703          	ld	a4,-32(s0)
    80004ce6:	973e                	add	a4,a4,a5
    80004ce8:	05874703          	lbu	a4,88(a4)
    80004cec:	0187169b          	slliw	a3,a4,0x18
    80004cf0:	4186d69b          	sraiw	a3,a3,0x18
    80004cf4:	fdc42703          	lw	a4,-36(s0)
    80004cf8:	0187171b          	slliw	a4,a4,0x18
    80004cfc:	4187571b          	sraiw	a4,a4,0x18
    80004d00:	8f55                	or	a4,a4,a3
    80004d02:	0187171b          	slliw	a4,a4,0x18
    80004d06:	4187571b          	sraiw	a4,a4,0x18
    80004d0a:	0ff77713          	andi	a4,a4,255
    80004d0e:	fe043683          	ld	a3,-32(s0)
    80004d12:	97b6                	add	a5,a5,a3
    80004d14:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004d18:	fe043503          	ld	a0,-32(s0)
    80004d1c:	00002097          	auipc	ra,0x2
    80004d20:	916080e7          	jalr	-1770(ra) # 80006632 <log_write>
        brelse(bp);
    80004d24:	fe043503          	ld	a0,-32(s0)
    80004d28:	00000097          	auipc	ra,0x0
    80004d2c:	c58080e7          	jalr	-936(ra) # 80004980 <brelse>
        bzero(dev, b + bi);
    80004d30:	fcc42683          	lw	a3,-52(s0)
    80004d34:	fec42703          	lw	a4,-20(s0)
    80004d38:	fe842783          	lw	a5,-24(s0)
    80004d3c:	9fb9                	addw	a5,a5,a4
    80004d3e:	2781                	sext.w	a5,a5
    80004d40:	85be                	mv	a1,a5
    80004d42:	8536                	mv	a0,a3
    80004d44:	00000097          	auipc	ra,0x0
    80004d48:	e7c080e7          	jalr	-388(ra) # 80004bc0 <bzero>
        return b + bi;
    80004d4c:	fec42703          	lw	a4,-20(s0)
    80004d50:	fe842783          	lw	a5,-24(s0)
    80004d54:	9fb9                	addw	a5,a5,a4
    80004d56:	2781                	sext.w	a5,a5
    80004d58:	2781                	sext.w	a5,a5
    80004d5a:	a895                	j	80004dce <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004d5c:	fe842783          	lw	a5,-24(s0)
    80004d60:	2785                	addiw	a5,a5,1
    80004d62:	fef42423          	sw	a5,-24(s0)
    80004d66:	fe842783          	lw	a5,-24(s0)
    80004d6a:	0007871b          	sext.w	a4,a5
    80004d6e:	6789                	lui	a5,0x2
    80004d70:	02f75163          	bge	a4,a5,80004d92 <balloc+0x16a>
    80004d74:	fec42703          	lw	a4,-20(s0)
    80004d78:	fe842783          	lw	a5,-24(s0)
    80004d7c:	9fb9                	addw	a5,a5,a4
    80004d7e:	2781                	sext.w	a5,a5
    80004d80:	0007871b          	sext.w	a4,a5
    80004d84:	0001e797          	auipc	a5,0x1e
    80004d88:	3bc78793          	addi	a5,a5,956 # 80023140 <sb>
    80004d8c:	43dc                	lw	a5,4(a5)
    80004d8e:	eef76ae3          	bltu	a4,a5,80004c82 <balloc+0x5a>
      }
    }
    brelse(bp);
    80004d92:	fe043503          	ld	a0,-32(s0)
    80004d96:	00000097          	auipc	ra,0x0
    80004d9a:	bea080e7          	jalr	-1046(ra) # 80004980 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004d9e:	fec42703          	lw	a4,-20(s0)
    80004da2:	6789                	lui	a5,0x2
    80004da4:	9fb9                	addw	a5,a5,a4
    80004da6:	fef42623          	sw	a5,-20(s0)
    80004daa:	0001e797          	auipc	a5,0x1e
    80004dae:	39678793          	addi	a5,a5,918 # 80023140 <sb>
    80004db2:	43d8                	lw	a4,4(a5)
    80004db4:	fec42783          	lw	a5,-20(s0)
    80004db8:	e8e7e4e3          	bltu	a5,a4,80004c40 <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004dbc:	00007517          	auipc	a0,0x7
    80004dc0:	6c450513          	addi	a0,a0,1732 # 8000c480 <etext+0x480>
    80004dc4:	ffffc097          	auipc	ra,0xffffc
    80004dc8:	c72080e7          	jalr	-910(ra) # 80000a36 <printf>
  return 0;
    80004dcc:	4781                	li	a5,0
}
    80004dce:	853e                	mv	a0,a5
    80004dd0:	70e2                	ld	ra,56(sp)
    80004dd2:	7442                	ld	s0,48(sp)
    80004dd4:	6121                	addi	sp,sp,64
    80004dd6:	8082                	ret

0000000080004dd8 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004dd8:	7179                	addi	sp,sp,-48
    80004dda:	f406                	sd	ra,40(sp)
    80004ddc:	f022                	sd	s0,32(sp)
    80004dde:	1800                	addi	s0,sp,48
    80004de0:	87aa                	mv	a5,a0
    80004de2:	872e                	mv	a4,a1
    80004de4:	fcf42e23          	sw	a5,-36(s0)
    80004de8:	87ba                	mv	a5,a4
    80004dea:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004dee:	fdc42683          	lw	a3,-36(s0)
    80004df2:	fd842783          	lw	a5,-40(s0)
    80004df6:	00d7d79b          	srliw	a5,a5,0xd
    80004dfa:	0007871b          	sext.w	a4,a5
    80004dfe:	0001e797          	auipc	a5,0x1e
    80004e02:	34278793          	addi	a5,a5,834 # 80023140 <sb>
    80004e06:	4fdc                	lw	a5,28(a5)
    80004e08:	9fb9                	addw	a5,a5,a4
    80004e0a:	2781                	sext.w	a5,a5
    80004e0c:	85be                	mv	a1,a5
    80004e0e:	8536                	mv	a0,a3
    80004e10:	00000097          	auipc	ra,0x0
    80004e14:	ac6080e7          	jalr	-1338(ra) # 800048d6 <bread>
    80004e18:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004e1c:	fd842703          	lw	a4,-40(s0)
    80004e20:	6789                	lui	a5,0x2
    80004e22:	17fd                	addi	a5,a5,-1
    80004e24:	8ff9                	and	a5,a5,a4
    80004e26:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004e2a:	fe442703          	lw	a4,-28(s0)
    80004e2e:	41f7579b          	sraiw	a5,a4,0x1f
    80004e32:	01d7d79b          	srliw	a5,a5,0x1d
    80004e36:	9f3d                	addw	a4,a4,a5
    80004e38:	8b1d                	andi	a4,a4,7
    80004e3a:	40f707bb          	subw	a5,a4,a5
    80004e3e:	2781                	sext.w	a5,a5
    80004e40:	4705                	li	a4,1
    80004e42:	00f717bb          	sllw	a5,a4,a5
    80004e46:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004e4a:	fe442783          	lw	a5,-28(s0)
    80004e4e:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e52:	01d7571b          	srliw	a4,a4,0x1d
    80004e56:	9fb9                	addw	a5,a5,a4
    80004e58:	4037d79b          	sraiw	a5,a5,0x3
    80004e5c:	2781                	sext.w	a5,a5
    80004e5e:	fe843703          	ld	a4,-24(s0)
    80004e62:	97ba                	add	a5,a5,a4
    80004e64:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004e68:	0007871b          	sext.w	a4,a5
    80004e6c:	fe042783          	lw	a5,-32(s0)
    80004e70:	8ff9                	and	a5,a5,a4
    80004e72:	2781                	sext.w	a5,a5
    80004e74:	eb89                	bnez	a5,80004e86 <bfree+0xae>
    panic("freeing free block");
    80004e76:	00007517          	auipc	a0,0x7
    80004e7a:	62250513          	addi	a0,a0,1570 # 8000c498 <etext+0x498>
    80004e7e:	ffffc097          	auipc	ra,0xffffc
    80004e82:	e0e080e7          	jalr	-498(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    80004e86:	fe442783          	lw	a5,-28(s0)
    80004e8a:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e8e:	01d7571b          	srliw	a4,a4,0x1d
    80004e92:	9fb9                	addw	a5,a5,a4
    80004e94:	4037d79b          	sraiw	a5,a5,0x3
    80004e98:	2781                	sext.w	a5,a5
    80004e9a:	fe843703          	ld	a4,-24(s0)
    80004e9e:	973e                	add	a4,a4,a5
    80004ea0:	05874703          	lbu	a4,88(a4)
    80004ea4:	0187169b          	slliw	a3,a4,0x18
    80004ea8:	4186d69b          	sraiw	a3,a3,0x18
    80004eac:	fe042703          	lw	a4,-32(s0)
    80004eb0:	0187171b          	slliw	a4,a4,0x18
    80004eb4:	4187571b          	sraiw	a4,a4,0x18
    80004eb8:	fff74713          	not	a4,a4
    80004ebc:	0187171b          	slliw	a4,a4,0x18
    80004ec0:	4187571b          	sraiw	a4,a4,0x18
    80004ec4:	8f75                	and	a4,a4,a3
    80004ec6:	0187171b          	slliw	a4,a4,0x18
    80004eca:	4187571b          	sraiw	a4,a4,0x18
    80004ece:	0ff77713          	andi	a4,a4,255
    80004ed2:	fe843683          	ld	a3,-24(s0)
    80004ed6:	97b6                	add	a5,a5,a3
    80004ed8:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004edc:	fe843503          	ld	a0,-24(s0)
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	752080e7          	jalr	1874(ra) # 80006632 <log_write>
  brelse(bp);
    80004ee8:	fe843503          	ld	a0,-24(s0)
    80004eec:	00000097          	auipc	ra,0x0
    80004ef0:	a94080e7          	jalr	-1388(ra) # 80004980 <brelse>
}
    80004ef4:	0001                	nop
    80004ef6:	70a2                	ld	ra,40(sp)
    80004ef8:	7402                	ld	s0,32(sp)
    80004efa:	6145                	addi	sp,sp,48
    80004efc:	8082                	ret

0000000080004efe <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004efe:	1101                	addi	sp,sp,-32
    80004f00:	ec06                	sd	ra,24(sp)
    80004f02:	e822                	sd	s0,16(sp)
    80004f04:	1000                	addi	s0,sp,32
  int i = 0;
    80004f06:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004f0a:	00007597          	auipc	a1,0x7
    80004f0e:	5a658593          	addi	a1,a1,1446 # 8000c4b0 <etext+0x4b0>
    80004f12:	0001e517          	auipc	a0,0x1e
    80004f16:	24e50513          	addi	a0,a0,590 # 80023160 <itable>
    80004f1a:	ffffc097          	auipc	ra,0xffffc
    80004f1e:	3f2080e7          	jalr	1010(ra) # 8000130c <initlock>
  for(i = 0; i < NINODE; i++) {
    80004f22:	fe042623          	sw	zero,-20(s0)
    80004f26:	a82d                	j	80004f60 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004f28:	fec42703          	lw	a4,-20(s0)
    80004f2c:	87ba                	mv	a5,a4
    80004f2e:	0792                	slli	a5,a5,0x4
    80004f30:	97ba                	add	a5,a5,a4
    80004f32:	078e                	slli	a5,a5,0x3
    80004f34:	02078713          	addi	a4,a5,32
    80004f38:	0001e797          	auipc	a5,0x1e
    80004f3c:	22878793          	addi	a5,a5,552 # 80023160 <itable>
    80004f40:	97ba                	add	a5,a5,a4
    80004f42:	07a1                	addi	a5,a5,8
    80004f44:	00007597          	auipc	a1,0x7
    80004f48:	57458593          	addi	a1,a1,1396 # 8000c4b8 <etext+0x4b8>
    80004f4c:	853e                	mv	a0,a5
    80004f4e:	00002097          	auipc	ra,0x2
    80004f52:	818080e7          	jalr	-2024(ra) # 80006766 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004f56:	fec42783          	lw	a5,-20(s0)
    80004f5a:	2785                	addiw	a5,a5,1
    80004f5c:	fef42623          	sw	a5,-20(s0)
    80004f60:	fec42783          	lw	a5,-20(s0)
    80004f64:	0007871b          	sext.w	a4,a5
    80004f68:	03100793          	li	a5,49
    80004f6c:	fae7dee3          	bge	a5,a4,80004f28 <iinit+0x2a>
  }
}
    80004f70:	0001                	nop
    80004f72:	0001                	nop
    80004f74:	60e2                	ld	ra,24(sp)
    80004f76:	6442                	ld	s0,16(sp)
    80004f78:	6105                	addi	sp,sp,32
    80004f7a:	8082                	ret

0000000080004f7c <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004f7c:	7139                	addi	sp,sp,-64
    80004f7e:	fc06                	sd	ra,56(sp)
    80004f80:	f822                	sd	s0,48(sp)
    80004f82:	0080                	addi	s0,sp,64
    80004f84:	87aa                	mv	a5,a0
    80004f86:	872e                	mv	a4,a1
    80004f88:	fcf42623          	sw	a5,-52(s0)
    80004f8c:	87ba                	mv	a5,a4
    80004f8e:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004f92:	4785                	li	a5,1
    80004f94:	fef42623          	sw	a5,-20(s0)
    80004f98:	a855                	j	8000504c <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004f9a:	fec42783          	lw	a5,-20(s0)
    80004f9e:	8391                	srli	a5,a5,0x4
    80004fa0:	0007871b          	sext.w	a4,a5
    80004fa4:	0001e797          	auipc	a5,0x1e
    80004fa8:	19c78793          	addi	a5,a5,412 # 80023140 <sb>
    80004fac:	4f9c                	lw	a5,24(a5)
    80004fae:	9fb9                	addw	a5,a5,a4
    80004fb0:	0007871b          	sext.w	a4,a5
    80004fb4:	fcc42783          	lw	a5,-52(s0)
    80004fb8:	85ba                	mv	a1,a4
    80004fba:	853e                	mv	a0,a5
    80004fbc:	00000097          	auipc	ra,0x0
    80004fc0:	91a080e7          	jalr	-1766(ra) # 800048d6 <bread>
    80004fc4:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004fc8:	fe043783          	ld	a5,-32(s0)
    80004fcc:	05878713          	addi	a4,a5,88
    80004fd0:	fec42783          	lw	a5,-20(s0)
    80004fd4:	8bbd                	andi	a5,a5,15
    80004fd6:	079a                	slli	a5,a5,0x6
    80004fd8:	97ba                	add	a5,a5,a4
    80004fda:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004fde:	fd843783          	ld	a5,-40(s0)
    80004fe2:	00079783          	lh	a5,0(a5)
    80004fe6:	eba1                	bnez	a5,80005036 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004fe8:	04000613          	li	a2,64
    80004fec:	4581                	li	a1,0
    80004fee:	fd843503          	ld	a0,-40(s0)
    80004ff2:	ffffc097          	auipc	ra,0xffffc
    80004ff6:	51e080e7          	jalr	1310(ra) # 80001510 <memset>
      dip->type = type;
    80004ffa:	fd843783          	ld	a5,-40(s0)
    80004ffe:	fca45703          	lhu	a4,-54(s0)
    80005002:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005006:	fe043503          	ld	a0,-32(s0)
    8000500a:	00001097          	auipc	ra,0x1
    8000500e:	628080e7          	jalr	1576(ra) # 80006632 <log_write>
      brelse(bp);
    80005012:	fe043503          	ld	a0,-32(s0)
    80005016:	00000097          	auipc	ra,0x0
    8000501a:	96a080e7          	jalr	-1686(ra) # 80004980 <brelse>
      return iget(dev, inum);
    8000501e:	fec42703          	lw	a4,-20(s0)
    80005022:	fcc42783          	lw	a5,-52(s0)
    80005026:	85ba                	mv	a1,a4
    80005028:	853e                	mv	a0,a5
    8000502a:	00000097          	auipc	ra,0x0
    8000502e:	138080e7          	jalr	312(ra) # 80005162 <iget>
    80005032:	87aa                	mv	a5,a0
    80005034:	a835                	j	80005070 <ialloc+0xf4>
    }
    brelse(bp);
    80005036:	fe043503          	ld	a0,-32(s0)
    8000503a:	00000097          	auipc	ra,0x0
    8000503e:	946080e7          	jalr	-1722(ra) # 80004980 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80005042:	fec42783          	lw	a5,-20(s0)
    80005046:	2785                	addiw	a5,a5,1
    80005048:	fef42623          	sw	a5,-20(s0)
    8000504c:	0001e797          	auipc	a5,0x1e
    80005050:	0f478793          	addi	a5,a5,244 # 80023140 <sb>
    80005054:	47d8                	lw	a4,12(a5)
    80005056:	fec42783          	lw	a5,-20(s0)
    8000505a:	f4e7e0e3          	bltu	a5,a4,80004f9a <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    8000505e:	00007517          	auipc	a0,0x7
    80005062:	46250513          	addi	a0,a0,1122 # 8000c4c0 <etext+0x4c0>
    80005066:	ffffc097          	auipc	ra,0xffffc
    8000506a:	9d0080e7          	jalr	-1584(ra) # 80000a36 <printf>
  return 0;
    8000506e:	4781                	li	a5,0
}
    80005070:	853e                	mv	a0,a5
    80005072:	70e2                	ld	ra,56(sp)
    80005074:	7442                	ld	s0,48(sp)
    80005076:	6121                	addi	sp,sp,64
    80005078:	8082                	ret

000000008000507a <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    8000507a:	7179                	addi	sp,sp,-48
    8000507c:	f406                	sd	ra,40(sp)
    8000507e:	f022                	sd	s0,32(sp)
    80005080:	1800                	addi	s0,sp,48
    80005082:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005086:	fd843783          	ld	a5,-40(s0)
    8000508a:	4394                	lw	a3,0(a5)
    8000508c:	fd843783          	ld	a5,-40(s0)
    80005090:	43dc                	lw	a5,4(a5)
    80005092:	0047d79b          	srliw	a5,a5,0x4
    80005096:	0007871b          	sext.w	a4,a5
    8000509a:	0001e797          	auipc	a5,0x1e
    8000509e:	0a678793          	addi	a5,a5,166 # 80023140 <sb>
    800050a2:	4f9c                	lw	a5,24(a5)
    800050a4:	9fb9                	addw	a5,a5,a4
    800050a6:	2781                	sext.w	a5,a5
    800050a8:	85be                	mv	a1,a5
    800050aa:	8536                	mv	a0,a3
    800050ac:	00000097          	auipc	ra,0x0
    800050b0:	82a080e7          	jalr	-2006(ra) # 800048d6 <bread>
    800050b4:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    800050b8:	fe843783          	ld	a5,-24(s0)
    800050bc:	05878713          	addi	a4,a5,88
    800050c0:	fd843783          	ld	a5,-40(s0)
    800050c4:	43dc                	lw	a5,4(a5)
    800050c6:	1782                	slli	a5,a5,0x20
    800050c8:	9381                	srli	a5,a5,0x20
    800050ca:	8bbd                	andi	a5,a5,15
    800050cc:	079a                	slli	a5,a5,0x6
    800050ce:	97ba                	add	a5,a5,a4
    800050d0:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    800050d4:	fd843783          	ld	a5,-40(s0)
    800050d8:	04479703          	lh	a4,68(a5)
    800050dc:	fe043783          	ld	a5,-32(s0)
    800050e0:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    800050e4:	fd843783          	ld	a5,-40(s0)
    800050e8:	04679703          	lh	a4,70(a5)
    800050ec:	fe043783          	ld	a5,-32(s0)
    800050f0:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    800050f4:	fd843783          	ld	a5,-40(s0)
    800050f8:	04879703          	lh	a4,72(a5)
    800050fc:	fe043783          	ld	a5,-32(s0)
    80005100:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80005104:	fd843783          	ld	a5,-40(s0)
    80005108:	04a79703          	lh	a4,74(a5)
    8000510c:	fe043783          	ld	a5,-32(s0)
    80005110:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80005114:	fd843783          	ld	a5,-40(s0)
    80005118:	47f8                	lw	a4,76(a5)
    8000511a:	fe043783          	ld	a5,-32(s0)
    8000511e:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005120:	fe043783          	ld	a5,-32(s0)
    80005124:	00c78713          	addi	a4,a5,12
    80005128:	fd843783          	ld	a5,-40(s0)
    8000512c:	05078793          	addi	a5,a5,80
    80005130:	03400613          	li	a2,52
    80005134:	85be                	mv	a1,a5
    80005136:	853a                	mv	a0,a4
    80005138:	ffffc097          	auipc	ra,0xffffc
    8000513c:	4bc080e7          	jalr	1212(ra) # 800015f4 <memmove>
  log_write(bp);
    80005140:	fe843503          	ld	a0,-24(s0)
    80005144:	00001097          	auipc	ra,0x1
    80005148:	4ee080e7          	jalr	1262(ra) # 80006632 <log_write>
  brelse(bp);
    8000514c:	fe843503          	ld	a0,-24(s0)
    80005150:	00000097          	auipc	ra,0x0
    80005154:	830080e7          	jalr	-2000(ra) # 80004980 <brelse>
}
    80005158:	0001                	nop
    8000515a:	70a2                	ld	ra,40(sp)
    8000515c:	7402                	ld	s0,32(sp)
    8000515e:	6145                	addi	sp,sp,48
    80005160:	8082                	ret

0000000080005162 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80005162:	7179                	addi	sp,sp,-48
    80005164:	f406                	sd	ra,40(sp)
    80005166:	f022                	sd	s0,32(sp)
    80005168:	1800                	addi	s0,sp,48
    8000516a:	87aa                	mv	a5,a0
    8000516c:	872e                	mv	a4,a1
    8000516e:	fcf42e23          	sw	a5,-36(s0)
    80005172:	87ba                	mv	a5,a4
    80005174:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80005178:	0001e517          	auipc	a0,0x1e
    8000517c:	fe850513          	addi	a0,a0,-24 # 80023160 <itable>
    80005180:	ffffc097          	auipc	ra,0xffffc
    80005184:	1bc080e7          	jalr	444(ra) # 8000133c <acquire>

  // Is the inode already in the table?
  empty = 0;
    80005188:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    8000518c:	0001e797          	auipc	a5,0x1e
    80005190:	fec78793          	addi	a5,a5,-20 # 80023178 <itable+0x18>
    80005194:	fef43423          	sd	a5,-24(s0)
    80005198:	a89d                	j	8000520e <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    8000519a:	fe843783          	ld	a5,-24(s0)
    8000519e:	479c                	lw	a5,8(a5)
    800051a0:	04f05663          	blez	a5,800051ec <iget+0x8a>
    800051a4:	fe843783          	ld	a5,-24(s0)
    800051a8:	4398                	lw	a4,0(a5)
    800051aa:	fdc42783          	lw	a5,-36(s0)
    800051ae:	2781                	sext.w	a5,a5
    800051b0:	02e79e63          	bne	a5,a4,800051ec <iget+0x8a>
    800051b4:	fe843783          	ld	a5,-24(s0)
    800051b8:	43d8                	lw	a4,4(a5)
    800051ba:	fd842783          	lw	a5,-40(s0)
    800051be:	2781                	sext.w	a5,a5
    800051c0:	02e79663          	bne	a5,a4,800051ec <iget+0x8a>
      ip->ref++;
    800051c4:	fe843783          	ld	a5,-24(s0)
    800051c8:	479c                	lw	a5,8(a5)
    800051ca:	2785                	addiw	a5,a5,1
    800051cc:	0007871b          	sext.w	a4,a5
    800051d0:	fe843783          	ld	a5,-24(s0)
    800051d4:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    800051d6:	0001e517          	auipc	a0,0x1e
    800051da:	f8a50513          	addi	a0,a0,-118 # 80023160 <itable>
    800051de:	ffffc097          	auipc	ra,0xffffc
    800051e2:	1c2080e7          	jalr	450(ra) # 800013a0 <release>
      return ip;
    800051e6:	fe843783          	ld	a5,-24(s0)
    800051ea:	a069                	j	80005274 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    800051ec:	fe043783          	ld	a5,-32(s0)
    800051f0:	eb89                	bnez	a5,80005202 <iget+0xa0>
    800051f2:	fe843783          	ld	a5,-24(s0)
    800051f6:	479c                	lw	a5,8(a5)
    800051f8:	e789                	bnez	a5,80005202 <iget+0xa0>
      empty = ip;
    800051fa:	fe843783          	ld	a5,-24(s0)
    800051fe:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005202:	fe843783          	ld	a5,-24(s0)
    80005206:	08878793          	addi	a5,a5,136
    8000520a:	fef43423          	sd	a5,-24(s0)
    8000520e:	fe843703          	ld	a4,-24(s0)
    80005212:	00020797          	auipc	a5,0x20
    80005216:	9f678793          	addi	a5,a5,-1546 # 80024c08 <log>
    8000521a:	f8f760e3          	bltu	a4,a5,8000519a <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    8000521e:	fe043783          	ld	a5,-32(s0)
    80005222:	eb89                	bnez	a5,80005234 <iget+0xd2>
    panic("iget: no inodes");
    80005224:	00007517          	auipc	a0,0x7
    80005228:	2b450513          	addi	a0,a0,692 # 8000c4d8 <etext+0x4d8>
    8000522c:	ffffc097          	auipc	ra,0xffffc
    80005230:	a60080e7          	jalr	-1440(ra) # 80000c8c <panic>

  ip = empty;
    80005234:	fe043783          	ld	a5,-32(s0)
    80005238:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    8000523c:	fe843783          	ld	a5,-24(s0)
    80005240:	fdc42703          	lw	a4,-36(s0)
    80005244:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    80005246:	fe843783          	ld	a5,-24(s0)
    8000524a:	fd842703          	lw	a4,-40(s0)
    8000524e:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005250:	fe843783          	ld	a5,-24(s0)
    80005254:	4705                	li	a4,1
    80005256:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80005258:	fe843783          	ld	a5,-24(s0)
    8000525c:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005260:	0001e517          	auipc	a0,0x1e
    80005264:	f0050513          	addi	a0,a0,-256 # 80023160 <itable>
    80005268:	ffffc097          	auipc	ra,0xffffc
    8000526c:	138080e7          	jalr	312(ra) # 800013a0 <release>

  return ip;
    80005270:	fe843783          	ld	a5,-24(s0)
}
    80005274:	853e                	mv	a0,a5
    80005276:	70a2                	ld	ra,40(sp)
    80005278:	7402                	ld	s0,32(sp)
    8000527a:	6145                	addi	sp,sp,48
    8000527c:	8082                	ret

000000008000527e <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    8000527e:	1101                	addi	sp,sp,-32
    80005280:	ec06                	sd	ra,24(sp)
    80005282:	e822                	sd	s0,16(sp)
    80005284:	1000                	addi	s0,sp,32
    80005286:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000528a:	0001e517          	auipc	a0,0x1e
    8000528e:	ed650513          	addi	a0,a0,-298 # 80023160 <itable>
    80005292:	ffffc097          	auipc	ra,0xffffc
    80005296:	0aa080e7          	jalr	170(ra) # 8000133c <acquire>
  ip->ref++;
    8000529a:	fe843783          	ld	a5,-24(s0)
    8000529e:	479c                	lw	a5,8(a5)
    800052a0:	2785                	addiw	a5,a5,1
    800052a2:	0007871b          	sext.w	a4,a5
    800052a6:	fe843783          	ld	a5,-24(s0)
    800052aa:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800052ac:	0001e517          	auipc	a0,0x1e
    800052b0:	eb450513          	addi	a0,a0,-332 # 80023160 <itable>
    800052b4:	ffffc097          	auipc	ra,0xffffc
    800052b8:	0ec080e7          	jalr	236(ra) # 800013a0 <release>
  return ip;
    800052bc:	fe843783          	ld	a5,-24(s0)
}
    800052c0:	853e                	mv	a0,a5
    800052c2:	60e2                	ld	ra,24(sp)
    800052c4:	6442                	ld	s0,16(sp)
    800052c6:	6105                	addi	sp,sp,32
    800052c8:	8082                	ret

00000000800052ca <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    800052ca:	7179                	addi	sp,sp,-48
    800052cc:	f406                	sd	ra,40(sp)
    800052ce:	f022                	sd	s0,32(sp)
    800052d0:	1800                	addi	s0,sp,48
    800052d2:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800052d6:	fd843783          	ld	a5,-40(s0)
    800052da:	c791                	beqz	a5,800052e6 <ilock+0x1c>
    800052dc:	fd843783          	ld	a5,-40(s0)
    800052e0:	479c                	lw	a5,8(a5)
    800052e2:	00f04a63          	bgtz	a5,800052f6 <ilock+0x2c>
    panic("ilock");
    800052e6:	00007517          	auipc	a0,0x7
    800052ea:	20250513          	addi	a0,a0,514 # 8000c4e8 <etext+0x4e8>
    800052ee:	ffffc097          	auipc	ra,0xffffc
    800052f2:	99e080e7          	jalr	-1634(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    800052f6:	fd843783          	ld	a5,-40(s0)
    800052fa:	07c1                	addi	a5,a5,16
    800052fc:	853e                	mv	a0,a5
    800052fe:	00001097          	auipc	ra,0x1
    80005302:	4b4080e7          	jalr	1204(ra) # 800067b2 <acquiresleep>

  if(ip->valid == 0){
    80005306:	fd843783          	ld	a5,-40(s0)
    8000530a:	43bc                	lw	a5,64(a5)
    8000530c:	e7e5                	bnez	a5,800053f4 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000530e:	fd843783          	ld	a5,-40(s0)
    80005312:	4394                	lw	a3,0(a5)
    80005314:	fd843783          	ld	a5,-40(s0)
    80005318:	43dc                	lw	a5,4(a5)
    8000531a:	0047d79b          	srliw	a5,a5,0x4
    8000531e:	0007871b          	sext.w	a4,a5
    80005322:	0001e797          	auipc	a5,0x1e
    80005326:	e1e78793          	addi	a5,a5,-482 # 80023140 <sb>
    8000532a:	4f9c                	lw	a5,24(a5)
    8000532c:	9fb9                	addw	a5,a5,a4
    8000532e:	2781                	sext.w	a5,a5
    80005330:	85be                	mv	a1,a5
    80005332:	8536                	mv	a0,a3
    80005334:	fffff097          	auipc	ra,0xfffff
    80005338:	5a2080e7          	jalr	1442(ra) # 800048d6 <bread>
    8000533c:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005340:	fe843783          	ld	a5,-24(s0)
    80005344:	05878713          	addi	a4,a5,88
    80005348:	fd843783          	ld	a5,-40(s0)
    8000534c:	43dc                	lw	a5,4(a5)
    8000534e:	1782                	slli	a5,a5,0x20
    80005350:	9381                	srli	a5,a5,0x20
    80005352:	8bbd                	andi	a5,a5,15
    80005354:	079a                	slli	a5,a5,0x6
    80005356:	97ba                	add	a5,a5,a4
    80005358:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    8000535c:	fe043783          	ld	a5,-32(s0)
    80005360:	00079703          	lh	a4,0(a5)
    80005364:	fd843783          	ld	a5,-40(s0)
    80005368:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    8000536c:	fe043783          	ld	a5,-32(s0)
    80005370:	00279703          	lh	a4,2(a5)
    80005374:	fd843783          	ld	a5,-40(s0)
    80005378:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    8000537c:	fe043783          	ld	a5,-32(s0)
    80005380:	00479703          	lh	a4,4(a5)
    80005384:	fd843783          	ld	a5,-40(s0)
    80005388:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    8000538c:	fe043783          	ld	a5,-32(s0)
    80005390:	00679703          	lh	a4,6(a5)
    80005394:	fd843783          	ld	a5,-40(s0)
    80005398:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    8000539c:	fe043783          	ld	a5,-32(s0)
    800053a0:	4798                	lw	a4,8(a5)
    800053a2:	fd843783          	ld	a5,-40(s0)
    800053a6:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800053a8:	fd843783          	ld	a5,-40(s0)
    800053ac:	05078713          	addi	a4,a5,80
    800053b0:	fe043783          	ld	a5,-32(s0)
    800053b4:	07b1                	addi	a5,a5,12
    800053b6:	03400613          	li	a2,52
    800053ba:	85be                	mv	a1,a5
    800053bc:	853a                	mv	a0,a4
    800053be:	ffffc097          	auipc	ra,0xffffc
    800053c2:	236080e7          	jalr	566(ra) # 800015f4 <memmove>
    brelse(bp);
    800053c6:	fe843503          	ld	a0,-24(s0)
    800053ca:	fffff097          	auipc	ra,0xfffff
    800053ce:	5b6080e7          	jalr	1462(ra) # 80004980 <brelse>
    ip->valid = 1;
    800053d2:	fd843783          	ld	a5,-40(s0)
    800053d6:	4705                	li	a4,1
    800053d8:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    800053da:	fd843783          	ld	a5,-40(s0)
    800053de:	04479783          	lh	a5,68(a5)
    800053e2:	eb89                	bnez	a5,800053f4 <ilock+0x12a>
      panic("ilock: no type");
    800053e4:	00007517          	auipc	a0,0x7
    800053e8:	10c50513          	addi	a0,a0,268 # 8000c4f0 <etext+0x4f0>
    800053ec:	ffffc097          	auipc	ra,0xffffc
    800053f0:	8a0080e7          	jalr	-1888(ra) # 80000c8c <panic>
  }
}
    800053f4:	0001                	nop
    800053f6:	70a2                	ld	ra,40(sp)
    800053f8:	7402                	ld	s0,32(sp)
    800053fa:	6145                	addi	sp,sp,48
    800053fc:	8082                	ret

00000000800053fe <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    800053fe:	1101                	addi	sp,sp,-32
    80005400:	ec06                	sd	ra,24(sp)
    80005402:	e822                	sd	s0,16(sp)
    80005404:	1000                	addi	s0,sp,32
    80005406:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    8000540a:	fe843783          	ld	a5,-24(s0)
    8000540e:	c385                	beqz	a5,8000542e <iunlock+0x30>
    80005410:	fe843783          	ld	a5,-24(s0)
    80005414:	07c1                	addi	a5,a5,16
    80005416:	853e                	mv	a0,a5
    80005418:	00001097          	auipc	ra,0x1
    8000541c:	45a080e7          	jalr	1114(ra) # 80006872 <holdingsleep>
    80005420:	87aa                	mv	a5,a0
    80005422:	c791                	beqz	a5,8000542e <iunlock+0x30>
    80005424:	fe843783          	ld	a5,-24(s0)
    80005428:	479c                	lw	a5,8(a5)
    8000542a:	00f04a63          	bgtz	a5,8000543e <iunlock+0x40>
    panic("iunlock");
    8000542e:	00007517          	auipc	a0,0x7
    80005432:	0d250513          	addi	a0,a0,210 # 8000c500 <etext+0x500>
    80005436:	ffffc097          	auipc	ra,0xffffc
    8000543a:	856080e7          	jalr	-1962(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    8000543e:	fe843783          	ld	a5,-24(s0)
    80005442:	07c1                	addi	a5,a5,16
    80005444:	853e                	mv	a0,a5
    80005446:	00001097          	auipc	ra,0x1
    8000544a:	3da080e7          	jalr	986(ra) # 80006820 <releasesleep>
}
    8000544e:	0001                	nop
    80005450:	60e2                	ld	ra,24(sp)
    80005452:	6442                	ld	s0,16(sp)
    80005454:	6105                	addi	sp,sp,32
    80005456:	8082                	ret

0000000080005458 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    80005458:	1101                	addi	sp,sp,-32
    8000545a:	ec06                	sd	ra,24(sp)
    8000545c:	e822                	sd	s0,16(sp)
    8000545e:	1000                	addi	s0,sp,32
    80005460:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80005464:	0001e517          	auipc	a0,0x1e
    80005468:	cfc50513          	addi	a0,a0,-772 # 80023160 <itable>
    8000546c:	ffffc097          	auipc	ra,0xffffc
    80005470:	ed0080e7          	jalr	-304(ra) # 8000133c <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    80005474:	fe843783          	ld	a5,-24(s0)
    80005478:	479c                	lw	a5,8(a5)
    8000547a:	873e                	mv	a4,a5
    8000547c:	4785                	li	a5,1
    8000547e:	06f71f63          	bne	a4,a5,800054fc <iput+0xa4>
    80005482:	fe843783          	ld	a5,-24(s0)
    80005486:	43bc                	lw	a5,64(a5)
    80005488:	cbb5                	beqz	a5,800054fc <iput+0xa4>
    8000548a:	fe843783          	ld	a5,-24(s0)
    8000548e:	04a79783          	lh	a5,74(a5)
    80005492:	e7ad                	bnez	a5,800054fc <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    80005494:	fe843783          	ld	a5,-24(s0)
    80005498:	07c1                	addi	a5,a5,16
    8000549a:	853e                	mv	a0,a5
    8000549c:	00001097          	auipc	ra,0x1
    800054a0:	316080e7          	jalr	790(ra) # 800067b2 <acquiresleep>

    release(&itable.lock);
    800054a4:	0001e517          	auipc	a0,0x1e
    800054a8:	cbc50513          	addi	a0,a0,-836 # 80023160 <itable>
    800054ac:	ffffc097          	auipc	ra,0xffffc
    800054b0:	ef4080e7          	jalr	-268(ra) # 800013a0 <release>

    itrunc(ip);
    800054b4:	fe843503          	ld	a0,-24(s0)
    800054b8:	00000097          	auipc	ra,0x0
    800054bc:	21a080e7          	jalr	538(ra) # 800056d2 <itrunc>
    ip->type = 0;
    800054c0:	fe843783          	ld	a5,-24(s0)
    800054c4:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    800054c8:	fe843503          	ld	a0,-24(s0)
    800054cc:	00000097          	auipc	ra,0x0
    800054d0:	bae080e7          	jalr	-1106(ra) # 8000507a <iupdate>
    ip->valid = 0;
    800054d4:	fe843783          	ld	a5,-24(s0)
    800054d8:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    800054dc:	fe843783          	ld	a5,-24(s0)
    800054e0:	07c1                	addi	a5,a5,16
    800054e2:	853e                	mv	a0,a5
    800054e4:	00001097          	auipc	ra,0x1
    800054e8:	33c080e7          	jalr	828(ra) # 80006820 <releasesleep>

    acquire(&itable.lock);
    800054ec:	0001e517          	auipc	a0,0x1e
    800054f0:	c7450513          	addi	a0,a0,-908 # 80023160 <itable>
    800054f4:	ffffc097          	auipc	ra,0xffffc
    800054f8:	e48080e7          	jalr	-440(ra) # 8000133c <acquire>
  }

  ip->ref--;
    800054fc:	fe843783          	ld	a5,-24(s0)
    80005500:	479c                	lw	a5,8(a5)
    80005502:	37fd                	addiw	a5,a5,-1
    80005504:	0007871b          	sext.w	a4,a5
    80005508:	fe843783          	ld	a5,-24(s0)
    8000550c:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000550e:	0001e517          	auipc	a0,0x1e
    80005512:	c5250513          	addi	a0,a0,-942 # 80023160 <itable>
    80005516:	ffffc097          	auipc	ra,0xffffc
    8000551a:	e8a080e7          	jalr	-374(ra) # 800013a0 <release>
}
    8000551e:	0001                	nop
    80005520:	60e2                	ld	ra,24(sp)
    80005522:	6442                	ld	s0,16(sp)
    80005524:	6105                	addi	sp,sp,32
    80005526:	8082                	ret

0000000080005528 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005528:	1101                	addi	sp,sp,-32
    8000552a:	ec06                	sd	ra,24(sp)
    8000552c:	e822                	sd	s0,16(sp)
    8000552e:	1000                	addi	s0,sp,32
    80005530:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    80005534:	fe843503          	ld	a0,-24(s0)
    80005538:	00000097          	auipc	ra,0x0
    8000553c:	ec6080e7          	jalr	-314(ra) # 800053fe <iunlock>
  iput(ip);
    80005540:	fe843503          	ld	a0,-24(s0)
    80005544:	00000097          	auipc	ra,0x0
    80005548:	f14080e7          	jalr	-236(ra) # 80005458 <iput>
}
    8000554c:	0001                	nop
    8000554e:	60e2                	ld	ra,24(sp)
    80005550:	6442                	ld	s0,16(sp)
    80005552:	6105                	addi	sp,sp,32
    80005554:	8082                	ret

0000000080005556 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    80005556:	7139                	addi	sp,sp,-64
    80005558:	fc06                	sd	ra,56(sp)
    8000555a:	f822                	sd	s0,48(sp)
    8000555c:	0080                	addi	s0,sp,64
    8000555e:	fca43423          	sd	a0,-56(s0)
    80005562:	87ae                	mv	a5,a1
    80005564:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80005568:	fc442783          	lw	a5,-60(s0)
    8000556c:	0007871b          	sext.w	a4,a5
    80005570:	47ad                	li	a5,11
    80005572:	04e7ee63          	bltu	a5,a4,800055ce <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    80005576:	fc843703          	ld	a4,-56(s0)
    8000557a:	fc446783          	lwu	a5,-60(s0)
    8000557e:	07d1                	addi	a5,a5,20
    80005580:	078a                	slli	a5,a5,0x2
    80005582:	97ba                	add	a5,a5,a4
    80005584:	439c                	lw	a5,0(a5)
    80005586:	fef42623          	sw	a5,-20(s0)
    8000558a:	fec42783          	lw	a5,-20(s0)
    8000558e:	2781                	sext.w	a5,a5
    80005590:	ef85                	bnez	a5,800055c8 <bmap+0x72>
      addr = balloc(ip->dev);
    80005592:	fc843783          	ld	a5,-56(s0)
    80005596:	439c                	lw	a5,0(a5)
    80005598:	853e                	mv	a0,a5
    8000559a:	fffff097          	auipc	ra,0xfffff
    8000559e:	68e080e7          	jalr	1678(ra) # 80004c28 <balloc>
    800055a2:	87aa                	mv	a5,a0
    800055a4:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800055a8:	fec42783          	lw	a5,-20(s0)
    800055ac:	2781                	sext.w	a5,a5
    800055ae:	e399                	bnez	a5,800055b4 <bmap+0x5e>
        return 0;
    800055b0:	4781                	li	a5,0
    800055b2:	aa19                	j	800056c8 <bmap+0x172>
      ip->addrs[bn] = addr;
    800055b4:	fc843703          	ld	a4,-56(s0)
    800055b8:	fc446783          	lwu	a5,-60(s0)
    800055bc:	07d1                	addi	a5,a5,20
    800055be:	078a                	slli	a5,a5,0x2
    800055c0:	97ba                	add	a5,a5,a4
    800055c2:	fec42703          	lw	a4,-20(s0)
    800055c6:	c398                	sw	a4,0(a5)
    }
    return addr;
    800055c8:	fec42783          	lw	a5,-20(s0)
    800055cc:	a8f5                	j	800056c8 <bmap+0x172>
  }
  bn -= NDIRECT;
    800055ce:	fc442783          	lw	a5,-60(s0)
    800055d2:	37d1                	addiw	a5,a5,-12
    800055d4:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    800055d8:	fc442783          	lw	a5,-60(s0)
    800055dc:	0007871b          	sext.w	a4,a5
    800055e0:	0ff00793          	li	a5,255
    800055e4:	0ce7ea63          	bltu	a5,a4,800056b8 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    800055e8:	fc843783          	ld	a5,-56(s0)
    800055ec:	0807a783          	lw	a5,128(a5)
    800055f0:	fef42623          	sw	a5,-20(s0)
    800055f4:	fec42783          	lw	a5,-20(s0)
    800055f8:	2781                	sext.w	a5,a5
    800055fa:	eb85                	bnez	a5,8000562a <bmap+0xd4>
      addr = balloc(ip->dev);
    800055fc:	fc843783          	ld	a5,-56(s0)
    80005600:	439c                	lw	a5,0(a5)
    80005602:	853e                	mv	a0,a5
    80005604:	fffff097          	auipc	ra,0xfffff
    80005608:	624080e7          	jalr	1572(ra) # 80004c28 <balloc>
    8000560c:	87aa                	mv	a5,a0
    8000560e:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005612:	fec42783          	lw	a5,-20(s0)
    80005616:	2781                	sext.w	a5,a5
    80005618:	e399                	bnez	a5,8000561e <bmap+0xc8>
        return 0;
    8000561a:	4781                	li	a5,0
    8000561c:	a075                	j	800056c8 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    8000561e:	fc843783          	ld	a5,-56(s0)
    80005622:	fec42703          	lw	a4,-20(s0)
    80005626:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    8000562a:	fc843783          	ld	a5,-56(s0)
    8000562e:	439c                	lw	a5,0(a5)
    80005630:	fec42703          	lw	a4,-20(s0)
    80005634:	85ba                	mv	a1,a4
    80005636:	853e                	mv	a0,a5
    80005638:	fffff097          	auipc	ra,0xfffff
    8000563c:	29e080e7          	jalr	670(ra) # 800048d6 <bread>
    80005640:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005644:	fe043783          	ld	a5,-32(s0)
    80005648:	05878793          	addi	a5,a5,88
    8000564c:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005650:	fc446783          	lwu	a5,-60(s0)
    80005654:	078a                	slli	a5,a5,0x2
    80005656:	fd843703          	ld	a4,-40(s0)
    8000565a:	97ba                	add	a5,a5,a4
    8000565c:	439c                	lw	a5,0(a5)
    8000565e:	fef42623          	sw	a5,-20(s0)
    80005662:	fec42783          	lw	a5,-20(s0)
    80005666:	2781                	sext.w	a5,a5
    80005668:	ef9d                	bnez	a5,800056a6 <bmap+0x150>
      addr = balloc(ip->dev);
    8000566a:	fc843783          	ld	a5,-56(s0)
    8000566e:	439c                	lw	a5,0(a5)
    80005670:	853e                	mv	a0,a5
    80005672:	fffff097          	auipc	ra,0xfffff
    80005676:	5b6080e7          	jalr	1462(ra) # 80004c28 <balloc>
    8000567a:	87aa                	mv	a5,a0
    8000567c:	fef42623          	sw	a5,-20(s0)
      if(addr){
    80005680:	fec42783          	lw	a5,-20(s0)
    80005684:	2781                	sext.w	a5,a5
    80005686:	c385                	beqz	a5,800056a6 <bmap+0x150>
        a[bn] = addr;
    80005688:	fc446783          	lwu	a5,-60(s0)
    8000568c:	078a                	slli	a5,a5,0x2
    8000568e:	fd843703          	ld	a4,-40(s0)
    80005692:	97ba                	add	a5,a5,a4
    80005694:	fec42703          	lw	a4,-20(s0)
    80005698:	c398                	sw	a4,0(a5)
        log_write(bp);
    8000569a:	fe043503          	ld	a0,-32(s0)
    8000569e:	00001097          	auipc	ra,0x1
    800056a2:	f94080e7          	jalr	-108(ra) # 80006632 <log_write>
      }
    }
    brelse(bp);
    800056a6:	fe043503          	ld	a0,-32(s0)
    800056aa:	fffff097          	auipc	ra,0xfffff
    800056ae:	2d6080e7          	jalr	726(ra) # 80004980 <brelse>
    return addr;
    800056b2:	fec42783          	lw	a5,-20(s0)
    800056b6:	a809                	j	800056c8 <bmap+0x172>
  }

  panic("bmap: out of range");
    800056b8:	00007517          	auipc	a0,0x7
    800056bc:	e5050513          	addi	a0,a0,-432 # 8000c508 <etext+0x508>
    800056c0:	ffffb097          	auipc	ra,0xffffb
    800056c4:	5cc080e7          	jalr	1484(ra) # 80000c8c <panic>
}
    800056c8:	853e                	mv	a0,a5
    800056ca:	70e2                	ld	ra,56(sp)
    800056cc:	7442                	ld	s0,48(sp)
    800056ce:	6121                	addi	sp,sp,64
    800056d0:	8082                	ret

00000000800056d2 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800056d2:	7139                	addi	sp,sp,-64
    800056d4:	fc06                	sd	ra,56(sp)
    800056d6:	f822                	sd	s0,48(sp)
    800056d8:	0080                	addi	s0,sp,64
    800056da:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    800056de:	fe042623          	sw	zero,-20(s0)
    800056e2:	a899                	j	80005738 <itrunc+0x66>
    if(ip->addrs[i]){
    800056e4:	fc843703          	ld	a4,-56(s0)
    800056e8:	fec42783          	lw	a5,-20(s0)
    800056ec:	07d1                	addi	a5,a5,20
    800056ee:	078a                	slli	a5,a5,0x2
    800056f0:	97ba                	add	a5,a5,a4
    800056f2:	439c                	lw	a5,0(a5)
    800056f4:	cf8d                	beqz	a5,8000572e <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    800056f6:	fc843783          	ld	a5,-56(s0)
    800056fa:	439c                	lw	a5,0(a5)
    800056fc:	0007869b          	sext.w	a3,a5
    80005700:	fc843703          	ld	a4,-56(s0)
    80005704:	fec42783          	lw	a5,-20(s0)
    80005708:	07d1                	addi	a5,a5,20
    8000570a:	078a                	slli	a5,a5,0x2
    8000570c:	97ba                	add	a5,a5,a4
    8000570e:	439c                	lw	a5,0(a5)
    80005710:	85be                	mv	a1,a5
    80005712:	8536                	mv	a0,a3
    80005714:	fffff097          	auipc	ra,0xfffff
    80005718:	6c4080e7          	jalr	1732(ra) # 80004dd8 <bfree>
      ip->addrs[i] = 0;
    8000571c:	fc843703          	ld	a4,-56(s0)
    80005720:	fec42783          	lw	a5,-20(s0)
    80005724:	07d1                	addi	a5,a5,20
    80005726:	078a                	slli	a5,a5,0x2
    80005728:	97ba                	add	a5,a5,a4
    8000572a:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    8000572e:	fec42783          	lw	a5,-20(s0)
    80005732:	2785                	addiw	a5,a5,1
    80005734:	fef42623          	sw	a5,-20(s0)
    80005738:	fec42783          	lw	a5,-20(s0)
    8000573c:	0007871b          	sext.w	a4,a5
    80005740:	47ad                	li	a5,11
    80005742:	fae7d1e3          	bge	a5,a4,800056e4 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    80005746:	fc843783          	ld	a5,-56(s0)
    8000574a:	0807a783          	lw	a5,128(a5)
    8000574e:	cbc5                	beqz	a5,800057fe <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005750:	fc843783          	ld	a5,-56(s0)
    80005754:	4398                	lw	a4,0(a5)
    80005756:	fc843783          	ld	a5,-56(s0)
    8000575a:	0807a783          	lw	a5,128(a5)
    8000575e:	85be                	mv	a1,a5
    80005760:	853a                	mv	a0,a4
    80005762:	fffff097          	auipc	ra,0xfffff
    80005766:	174080e7          	jalr	372(ra) # 800048d6 <bread>
    8000576a:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    8000576e:	fe043783          	ld	a5,-32(s0)
    80005772:	05878793          	addi	a5,a5,88
    80005776:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    8000577a:	fe042423          	sw	zero,-24(s0)
    8000577e:	a081                	j	800057be <itrunc+0xec>
      if(a[j])
    80005780:	fe842783          	lw	a5,-24(s0)
    80005784:	078a                	slli	a5,a5,0x2
    80005786:	fd843703          	ld	a4,-40(s0)
    8000578a:	97ba                	add	a5,a5,a4
    8000578c:	439c                	lw	a5,0(a5)
    8000578e:	c39d                	beqz	a5,800057b4 <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005790:	fc843783          	ld	a5,-56(s0)
    80005794:	439c                	lw	a5,0(a5)
    80005796:	0007869b          	sext.w	a3,a5
    8000579a:	fe842783          	lw	a5,-24(s0)
    8000579e:	078a                	slli	a5,a5,0x2
    800057a0:	fd843703          	ld	a4,-40(s0)
    800057a4:	97ba                	add	a5,a5,a4
    800057a6:	439c                	lw	a5,0(a5)
    800057a8:	85be                	mv	a1,a5
    800057aa:	8536                	mv	a0,a3
    800057ac:	fffff097          	auipc	ra,0xfffff
    800057b0:	62c080e7          	jalr	1580(ra) # 80004dd8 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800057b4:	fe842783          	lw	a5,-24(s0)
    800057b8:	2785                	addiw	a5,a5,1
    800057ba:	fef42423          	sw	a5,-24(s0)
    800057be:	fe842783          	lw	a5,-24(s0)
    800057c2:	873e                	mv	a4,a5
    800057c4:	0ff00793          	li	a5,255
    800057c8:	fae7fce3          	bgeu	a5,a4,80005780 <itrunc+0xae>
    }
    brelse(bp);
    800057cc:	fe043503          	ld	a0,-32(s0)
    800057d0:	fffff097          	auipc	ra,0xfffff
    800057d4:	1b0080e7          	jalr	432(ra) # 80004980 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    800057d8:	fc843783          	ld	a5,-56(s0)
    800057dc:	439c                	lw	a5,0(a5)
    800057de:	0007871b          	sext.w	a4,a5
    800057e2:	fc843783          	ld	a5,-56(s0)
    800057e6:	0807a783          	lw	a5,128(a5)
    800057ea:	85be                	mv	a1,a5
    800057ec:	853a                	mv	a0,a4
    800057ee:	fffff097          	auipc	ra,0xfffff
    800057f2:	5ea080e7          	jalr	1514(ra) # 80004dd8 <bfree>
    ip->addrs[NDIRECT] = 0;
    800057f6:	fc843783          	ld	a5,-56(s0)
    800057fa:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    800057fe:	fc843783          	ld	a5,-56(s0)
    80005802:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005806:	fc843503          	ld	a0,-56(s0)
    8000580a:	00000097          	auipc	ra,0x0
    8000580e:	870080e7          	jalr	-1936(ra) # 8000507a <iupdate>
}
    80005812:	0001                	nop
    80005814:	70e2                	ld	ra,56(sp)
    80005816:	7442                	ld	s0,48(sp)
    80005818:	6121                	addi	sp,sp,64
    8000581a:	8082                	ret

000000008000581c <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    8000581c:	1101                	addi	sp,sp,-32
    8000581e:	ec22                	sd	s0,24(sp)
    80005820:	1000                	addi	s0,sp,32
    80005822:	fea43423          	sd	a0,-24(s0)
    80005826:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    8000582a:	fe843783          	ld	a5,-24(s0)
    8000582e:	439c                	lw	a5,0(a5)
    80005830:	0007871b          	sext.w	a4,a5
    80005834:	fe043783          	ld	a5,-32(s0)
    80005838:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    8000583a:	fe843783          	ld	a5,-24(s0)
    8000583e:	43d8                	lw	a4,4(a5)
    80005840:	fe043783          	ld	a5,-32(s0)
    80005844:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    80005846:	fe843783          	ld	a5,-24(s0)
    8000584a:	04479703          	lh	a4,68(a5)
    8000584e:	fe043783          	ld	a5,-32(s0)
    80005852:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80005856:	fe843783          	ld	a5,-24(s0)
    8000585a:	04a79703          	lh	a4,74(a5)
    8000585e:	fe043783          	ld	a5,-32(s0)
    80005862:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80005866:	fe843783          	ld	a5,-24(s0)
    8000586a:	47fc                	lw	a5,76(a5)
    8000586c:	02079713          	slli	a4,a5,0x20
    80005870:	9301                	srli	a4,a4,0x20
    80005872:	fe043783          	ld	a5,-32(s0)
    80005876:	eb98                	sd	a4,16(a5)
}
    80005878:	0001                	nop
    8000587a:	6462                	ld	s0,24(sp)
    8000587c:	6105                	addi	sp,sp,32
    8000587e:	8082                	ret

0000000080005880 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005880:	715d                	addi	sp,sp,-80
    80005882:	e486                	sd	ra,72(sp)
    80005884:	e0a2                	sd	s0,64(sp)
    80005886:	0880                	addi	s0,sp,80
    80005888:	fca43423          	sd	a0,-56(s0)
    8000588c:	87ae                	mv	a5,a1
    8000588e:	fac43c23          	sd	a2,-72(s0)
    80005892:	fcf42223          	sw	a5,-60(s0)
    80005896:	87b6                	mv	a5,a3
    80005898:	fcf42023          	sw	a5,-64(s0)
    8000589c:	87ba                	mv	a5,a4
    8000589e:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800058a2:	fc843783          	ld	a5,-56(s0)
    800058a6:	47f8                	lw	a4,76(a5)
    800058a8:	fc042783          	lw	a5,-64(s0)
    800058ac:	2781                	sext.w	a5,a5
    800058ae:	00f76e63          	bltu	a4,a5,800058ca <readi+0x4a>
    800058b2:	fc042703          	lw	a4,-64(s0)
    800058b6:	fb442783          	lw	a5,-76(s0)
    800058ba:	9fb9                	addw	a5,a5,a4
    800058bc:	0007871b          	sext.w	a4,a5
    800058c0:	fc042783          	lw	a5,-64(s0)
    800058c4:	2781                	sext.w	a5,a5
    800058c6:	00f77463          	bgeu	a4,a5,800058ce <readi+0x4e>
    return 0;
    800058ca:	4781                	li	a5,0
    800058cc:	a289                	j	80005a0e <readi+0x18e>
  if(off + n > ip->size)
    800058ce:	fc042703          	lw	a4,-64(s0)
    800058d2:	fb442783          	lw	a5,-76(s0)
    800058d6:	9fb9                	addw	a5,a5,a4
    800058d8:	0007871b          	sext.w	a4,a5
    800058dc:	fc843783          	ld	a5,-56(s0)
    800058e0:	47fc                	lw	a5,76(a5)
    800058e2:	00e7fb63          	bgeu	a5,a4,800058f8 <readi+0x78>
    n = ip->size - off;
    800058e6:	fc843783          	ld	a5,-56(s0)
    800058ea:	47f8                	lw	a4,76(a5)
    800058ec:	fc042783          	lw	a5,-64(s0)
    800058f0:	40f707bb          	subw	a5,a4,a5
    800058f4:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800058f8:	fe042623          	sw	zero,-20(s0)
    800058fc:	a8ed                	j	800059f6 <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    800058fe:	fc042783          	lw	a5,-64(s0)
    80005902:	00a7d79b          	srliw	a5,a5,0xa
    80005906:	2781                	sext.w	a5,a5
    80005908:	85be                	mv	a1,a5
    8000590a:	fc843503          	ld	a0,-56(s0)
    8000590e:	00000097          	auipc	ra,0x0
    80005912:	c48080e7          	jalr	-952(ra) # 80005556 <bmap>
    80005916:	87aa                	mv	a5,a0
    80005918:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    8000591c:	fe842783          	lw	a5,-24(s0)
    80005920:	2781                	sext.w	a5,a5
    80005922:	c3fd                	beqz	a5,80005a08 <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    80005924:	fc843783          	ld	a5,-56(s0)
    80005928:	439c                	lw	a5,0(a5)
    8000592a:	fe842703          	lw	a4,-24(s0)
    8000592e:	85ba                	mv	a1,a4
    80005930:	853e                	mv	a0,a5
    80005932:	fffff097          	auipc	ra,0xfffff
    80005936:	fa4080e7          	jalr	-92(ra) # 800048d6 <bread>
    8000593a:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    8000593e:	fc042783          	lw	a5,-64(s0)
    80005942:	3ff7f793          	andi	a5,a5,1023
    80005946:	2781                	sext.w	a5,a5
    80005948:	40000713          	li	a4,1024
    8000594c:	40f707bb          	subw	a5,a4,a5
    80005950:	0007869b          	sext.w	a3,a5
    80005954:	fb442703          	lw	a4,-76(s0)
    80005958:	fec42783          	lw	a5,-20(s0)
    8000595c:	40f707bb          	subw	a5,a4,a5
    80005960:	2781                	sext.w	a5,a5
    80005962:	863e                	mv	a2,a5
    80005964:	87b6                	mv	a5,a3
    80005966:	0007869b          	sext.w	a3,a5
    8000596a:	0006071b          	sext.w	a4,a2
    8000596e:	00d77363          	bgeu	a4,a3,80005974 <readi+0xf4>
    80005972:	87b2                	mv	a5,a2
    80005974:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005978:	fe043783          	ld	a5,-32(s0)
    8000597c:	05878713          	addi	a4,a5,88
    80005980:	fc046783          	lwu	a5,-64(s0)
    80005984:	3ff7f793          	andi	a5,a5,1023
    80005988:	973e                	add	a4,a4,a5
    8000598a:	fdc46683          	lwu	a3,-36(s0)
    8000598e:	fc442783          	lw	a5,-60(s0)
    80005992:	863a                	mv	a2,a4
    80005994:	fb843583          	ld	a1,-72(s0)
    80005998:	853e                	mv	a0,a5
    8000599a:	ffffe097          	auipc	ra,0xffffe
    8000599e:	e8e080e7          	jalr	-370(ra) # 80003828 <either_copyout>
    800059a2:	87aa                	mv	a5,a0
    800059a4:	873e                	mv	a4,a5
    800059a6:	57fd                	li	a5,-1
    800059a8:	00f71c63          	bne	a4,a5,800059c0 <readi+0x140>
      brelse(bp);
    800059ac:	fe043503          	ld	a0,-32(s0)
    800059b0:	fffff097          	auipc	ra,0xfffff
    800059b4:	fd0080e7          	jalr	-48(ra) # 80004980 <brelse>
      tot = -1;
    800059b8:	57fd                	li	a5,-1
    800059ba:	fef42623          	sw	a5,-20(s0)
      break;
    800059be:	a0b1                	j	80005a0a <readi+0x18a>
    }
    brelse(bp);
    800059c0:	fe043503          	ld	a0,-32(s0)
    800059c4:	fffff097          	auipc	ra,0xfffff
    800059c8:	fbc080e7          	jalr	-68(ra) # 80004980 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800059cc:	fec42703          	lw	a4,-20(s0)
    800059d0:	fdc42783          	lw	a5,-36(s0)
    800059d4:	9fb9                	addw	a5,a5,a4
    800059d6:	fef42623          	sw	a5,-20(s0)
    800059da:	fc042703          	lw	a4,-64(s0)
    800059de:	fdc42783          	lw	a5,-36(s0)
    800059e2:	9fb9                	addw	a5,a5,a4
    800059e4:	fcf42023          	sw	a5,-64(s0)
    800059e8:	fdc46783          	lwu	a5,-36(s0)
    800059ec:	fb843703          	ld	a4,-72(s0)
    800059f0:	97ba                	add	a5,a5,a4
    800059f2:	faf43c23          	sd	a5,-72(s0)
    800059f6:	fec42703          	lw	a4,-20(s0)
    800059fa:	fb442783          	lw	a5,-76(s0)
    800059fe:	2701                	sext.w	a4,a4
    80005a00:	2781                	sext.w	a5,a5
    80005a02:	eef76ee3          	bltu	a4,a5,800058fe <readi+0x7e>
    80005a06:	a011                	j	80005a0a <readi+0x18a>
      break;
    80005a08:	0001                	nop
  }
  return tot;
    80005a0a:	fec42783          	lw	a5,-20(s0)
}
    80005a0e:	853e                	mv	a0,a5
    80005a10:	60a6                	ld	ra,72(sp)
    80005a12:	6406                	ld	s0,64(sp)
    80005a14:	6161                	addi	sp,sp,80
    80005a16:	8082                	ret

0000000080005a18 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005a18:	715d                	addi	sp,sp,-80
    80005a1a:	e486                	sd	ra,72(sp)
    80005a1c:	e0a2                	sd	s0,64(sp)
    80005a1e:	0880                	addi	s0,sp,80
    80005a20:	fca43423          	sd	a0,-56(s0)
    80005a24:	87ae                	mv	a5,a1
    80005a26:	fac43c23          	sd	a2,-72(s0)
    80005a2a:	fcf42223          	sw	a5,-60(s0)
    80005a2e:	87b6                	mv	a5,a3
    80005a30:	fcf42023          	sw	a5,-64(s0)
    80005a34:	87ba                	mv	a5,a4
    80005a36:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005a3a:	fc843783          	ld	a5,-56(s0)
    80005a3e:	47f8                	lw	a4,76(a5)
    80005a40:	fc042783          	lw	a5,-64(s0)
    80005a44:	2781                	sext.w	a5,a5
    80005a46:	00f76e63          	bltu	a4,a5,80005a62 <writei+0x4a>
    80005a4a:	fc042703          	lw	a4,-64(s0)
    80005a4e:	fb442783          	lw	a5,-76(s0)
    80005a52:	9fb9                	addw	a5,a5,a4
    80005a54:	0007871b          	sext.w	a4,a5
    80005a58:	fc042783          	lw	a5,-64(s0)
    80005a5c:	2781                	sext.w	a5,a5
    80005a5e:	00f77463          	bgeu	a4,a5,80005a66 <writei+0x4e>
    return -1;
    80005a62:	57fd                	li	a5,-1
    80005a64:	aab9                	j	80005bc2 <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005a66:	fc042703          	lw	a4,-64(s0)
    80005a6a:	fb442783          	lw	a5,-76(s0)
    80005a6e:	9fb9                	addw	a5,a5,a4
    80005a70:	2781                	sext.w	a5,a5
    80005a72:	873e                	mv	a4,a5
    80005a74:	000437b7          	lui	a5,0x43
    80005a78:	00e7f463          	bgeu	a5,a4,80005a80 <writei+0x68>
    return -1;
    80005a7c:	57fd                	li	a5,-1
    80005a7e:	a291                	j	80005bc2 <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005a80:	fe042623          	sw	zero,-20(s0)
    80005a84:	a201                	j	80005b84 <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005a86:	fc042783          	lw	a5,-64(s0)
    80005a8a:	00a7d79b          	srliw	a5,a5,0xa
    80005a8e:	2781                	sext.w	a5,a5
    80005a90:	85be                	mv	a1,a5
    80005a92:	fc843503          	ld	a0,-56(s0)
    80005a96:	00000097          	auipc	ra,0x0
    80005a9a:	ac0080e7          	jalr	-1344(ra) # 80005556 <bmap>
    80005a9e:	87aa                	mv	a5,a0
    80005aa0:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005aa4:	fe842783          	lw	a5,-24(s0)
    80005aa8:	2781                	sext.w	a5,a5
    80005aaa:	c7f5                	beqz	a5,80005b96 <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005aac:	fc843783          	ld	a5,-56(s0)
    80005ab0:	439c                	lw	a5,0(a5)
    80005ab2:	fe842703          	lw	a4,-24(s0)
    80005ab6:	85ba                	mv	a1,a4
    80005ab8:	853e                	mv	a0,a5
    80005aba:	fffff097          	auipc	ra,0xfffff
    80005abe:	e1c080e7          	jalr	-484(ra) # 800048d6 <bread>
    80005ac2:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005ac6:	fc042783          	lw	a5,-64(s0)
    80005aca:	3ff7f793          	andi	a5,a5,1023
    80005ace:	2781                	sext.w	a5,a5
    80005ad0:	40000713          	li	a4,1024
    80005ad4:	40f707bb          	subw	a5,a4,a5
    80005ad8:	0007869b          	sext.w	a3,a5
    80005adc:	fb442703          	lw	a4,-76(s0)
    80005ae0:	fec42783          	lw	a5,-20(s0)
    80005ae4:	40f707bb          	subw	a5,a4,a5
    80005ae8:	2781                	sext.w	a5,a5
    80005aea:	863e                	mv	a2,a5
    80005aec:	87b6                	mv	a5,a3
    80005aee:	0007869b          	sext.w	a3,a5
    80005af2:	0006071b          	sext.w	a4,a2
    80005af6:	00d77363          	bgeu	a4,a3,80005afc <writei+0xe4>
    80005afa:	87b2                	mv	a5,a2
    80005afc:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005b00:	fe043783          	ld	a5,-32(s0)
    80005b04:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005b08:	fc046783          	lwu	a5,-64(s0)
    80005b0c:	3ff7f793          	andi	a5,a5,1023
    80005b10:	97ba                	add	a5,a5,a4
    80005b12:	fdc46683          	lwu	a3,-36(s0)
    80005b16:	fc442703          	lw	a4,-60(s0)
    80005b1a:	fb843603          	ld	a2,-72(s0)
    80005b1e:	85ba                	mv	a1,a4
    80005b20:	853e                	mv	a0,a5
    80005b22:	ffffe097          	auipc	ra,0xffffe
    80005b26:	d7a080e7          	jalr	-646(ra) # 8000389c <either_copyin>
    80005b2a:	87aa                	mv	a5,a0
    80005b2c:	873e                	mv	a4,a5
    80005b2e:	57fd                	li	a5,-1
    80005b30:	00f71963          	bne	a4,a5,80005b42 <writei+0x12a>
      brelse(bp);
    80005b34:	fe043503          	ld	a0,-32(s0)
    80005b38:	fffff097          	auipc	ra,0xfffff
    80005b3c:	e48080e7          	jalr	-440(ra) # 80004980 <brelse>
      break;
    80005b40:	a8a1                	j	80005b98 <writei+0x180>
    }
    log_write(bp);
    80005b42:	fe043503          	ld	a0,-32(s0)
    80005b46:	00001097          	auipc	ra,0x1
    80005b4a:	aec080e7          	jalr	-1300(ra) # 80006632 <log_write>
    brelse(bp);
    80005b4e:	fe043503          	ld	a0,-32(s0)
    80005b52:	fffff097          	auipc	ra,0xfffff
    80005b56:	e2e080e7          	jalr	-466(ra) # 80004980 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005b5a:	fec42703          	lw	a4,-20(s0)
    80005b5e:	fdc42783          	lw	a5,-36(s0)
    80005b62:	9fb9                	addw	a5,a5,a4
    80005b64:	fef42623          	sw	a5,-20(s0)
    80005b68:	fc042703          	lw	a4,-64(s0)
    80005b6c:	fdc42783          	lw	a5,-36(s0)
    80005b70:	9fb9                	addw	a5,a5,a4
    80005b72:	fcf42023          	sw	a5,-64(s0)
    80005b76:	fdc46783          	lwu	a5,-36(s0)
    80005b7a:	fb843703          	ld	a4,-72(s0)
    80005b7e:	97ba                	add	a5,a5,a4
    80005b80:	faf43c23          	sd	a5,-72(s0)
    80005b84:	fec42703          	lw	a4,-20(s0)
    80005b88:	fb442783          	lw	a5,-76(s0)
    80005b8c:	2701                	sext.w	a4,a4
    80005b8e:	2781                	sext.w	a5,a5
    80005b90:	eef76be3          	bltu	a4,a5,80005a86 <writei+0x6e>
    80005b94:	a011                	j	80005b98 <writei+0x180>
      break;
    80005b96:	0001                	nop
  }

  if(off > ip->size)
    80005b98:	fc843783          	ld	a5,-56(s0)
    80005b9c:	47f8                	lw	a4,76(a5)
    80005b9e:	fc042783          	lw	a5,-64(s0)
    80005ba2:	2781                	sext.w	a5,a5
    80005ba4:	00f77763          	bgeu	a4,a5,80005bb2 <writei+0x19a>
    ip->size = off;
    80005ba8:	fc843783          	ld	a5,-56(s0)
    80005bac:	fc042703          	lw	a4,-64(s0)
    80005bb0:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005bb2:	fc843503          	ld	a0,-56(s0)
    80005bb6:	fffff097          	auipc	ra,0xfffff
    80005bba:	4c4080e7          	jalr	1220(ra) # 8000507a <iupdate>

  return tot;
    80005bbe:	fec42783          	lw	a5,-20(s0)
}
    80005bc2:	853e                	mv	a0,a5
    80005bc4:	60a6                	ld	ra,72(sp)
    80005bc6:	6406                	ld	s0,64(sp)
    80005bc8:	6161                	addi	sp,sp,80
    80005bca:	8082                	ret

0000000080005bcc <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005bcc:	1101                	addi	sp,sp,-32
    80005bce:	ec06                	sd	ra,24(sp)
    80005bd0:	e822                	sd	s0,16(sp)
    80005bd2:	1000                	addi	s0,sp,32
    80005bd4:	fea43423          	sd	a0,-24(s0)
    80005bd8:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005bdc:	4639                	li	a2,14
    80005bde:	fe043583          	ld	a1,-32(s0)
    80005be2:	fe843503          	ld	a0,-24(s0)
    80005be6:	ffffc097          	auipc	ra,0xffffc
    80005bea:	b22080e7          	jalr	-1246(ra) # 80001708 <strncmp>
    80005bee:	87aa                	mv	a5,a0
}
    80005bf0:	853e                	mv	a0,a5
    80005bf2:	60e2                	ld	ra,24(sp)
    80005bf4:	6442                	ld	s0,16(sp)
    80005bf6:	6105                	addi	sp,sp,32
    80005bf8:	8082                	ret

0000000080005bfa <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005bfa:	715d                	addi	sp,sp,-80
    80005bfc:	e486                	sd	ra,72(sp)
    80005bfe:	e0a2                	sd	s0,64(sp)
    80005c00:	0880                	addi	s0,sp,80
    80005c02:	fca43423          	sd	a0,-56(s0)
    80005c06:	fcb43023          	sd	a1,-64(s0)
    80005c0a:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005c0e:	fc843783          	ld	a5,-56(s0)
    80005c12:	04479783          	lh	a5,68(a5)
    80005c16:	0007871b          	sext.w	a4,a5
    80005c1a:	4785                	li	a5,1
    80005c1c:	00f70a63          	beq	a4,a5,80005c30 <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005c20:	00007517          	auipc	a0,0x7
    80005c24:	90050513          	addi	a0,a0,-1792 # 8000c520 <etext+0x520>
    80005c28:	ffffb097          	auipc	ra,0xffffb
    80005c2c:	064080e7          	jalr	100(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c30:	fe042623          	sw	zero,-20(s0)
    80005c34:	a849                	j	80005cc6 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005c36:	fd840793          	addi	a5,s0,-40
    80005c3a:	fec42683          	lw	a3,-20(s0)
    80005c3e:	4741                	li	a4,16
    80005c40:	863e                	mv	a2,a5
    80005c42:	4581                	li	a1,0
    80005c44:	fc843503          	ld	a0,-56(s0)
    80005c48:	00000097          	auipc	ra,0x0
    80005c4c:	c38080e7          	jalr	-968(ra) # 80005880 <readi>
    80005c50:	87aa                	mv	a5,a0
    80005c52:	873e                	mv	a4,a5
    80005c54:	47c1                	li	a5,16
    80005c56:	00f70a63          	beq	a4,a5,80005c6a <dirlookup+0x70>
      panic("dirlookup read");
    80005c5a:	00007517          	auipc	a0,0x7
    80005c5e:	8de50513          	addi	a0,a0,-1826 # 8000c538 <etext+0x538>
    80005c62:	ffffb097          	auipc	ra,0xffffb
    80005c66:	02a080e7          	jalr	42(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005c6a:	fd845783          	lhu	a5,-40(s0)
    80005c6e:	c7b1                	beqz	a5,80005cba <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005c70:	fd840793          	addi	a5,s0,-40
    80005c74:	0789                	addi	a5,a5,2
    80005c76:	85be                	mv	a1,a5
    80005c78:	fc043503          	ld	a0,-64(s0)
    80005c7c:	00000097          	auipc	ra,0x0
    80005c80:	f50080e7          	jalr	-176(ra) # 80005bcc <namecmp>
    80005c84:	87aa                	mv	a5,a0
    80005c86:	eb9d                	bnez	a5,80005cbc <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005c88:	fb843783          	ld	a5,-72(s0)
    80005c8c:	c791                	beqz	a5,80005c98 <dirlookup+0x9e>
        *poff = off;
    80005c8e:	fb843783          	ld	a5,-72(s0)
    80005c92:	fec42703          	lw	a4,-20(s0)
    80005c96:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005c98:	fd845783          	lhu	a5,-40(s0)
    80005c9c:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005ca0:	fc843783          	ld	a5,-56(s0)
    80005ca4:	439c                	lw	a5,0(a5)
    80005ca6:	fe842703          	lw	a4,-24(s0)
    80005caa:	85ba                	mv	a1,a4
    80005cac:	853e                	mv	a0,a5
    80005cae:	fffff097          	auipc	ra,0xfffff
    80005cb2:	4b4080e7          	jalr	1204(ra) # 80005162 <iget>
    80005cb6:	87aa                	mv	a5,a0
    80005cb8:	a005                	j	80005cd8 <dirlookup+0xde>
      continue;
    80005cba:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005cbc:	fec42783          	lw	a5,-20(s0)
    80005cc0:	27c1                	addiw	a5,a5,16
    80005cc2:	fef42623          	sw	a5,-20(s0)
    80005cc6:	fc843783          	ld	a5,-56(s0)
    80005cca:	47f8                	lw	a4,76(a5)
    80005ccc:	fec42783          	lw	a5,-20(s0)
    80005cd0:	2781                	sext.w	a5,a5
    80005cd2:	f6e7e2e3          	bltu	a5,a4,80005c36 <dirlookup+0x3c>
    }
  }

  return 0;
    80005cd6:	4781                	li	a5,0
}
    80005cd8:	853e                	mv	a0,a5
    80005cda:	60a6                	ld	ra,72(sp)
    80005cdc:	6406                	ld	s0,64(sp)
    80005cde:	6161                	addi	sp,sp,80
    80005ce0:	8082                	ret

0000000080005ce2 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005ce2:	715d                	addi	sp,sp,-80
    80005ce4:	e486                	sd	ra,72(sp)
    80005ce6:	e0a2                	sd	s0,64(sp)
    80005ce8:	0880                	addi	s0,sp,80
    80005cea:	fca43423          	sd	a0,-56(s0)
    80005cee:	fcb43023          	sd	a1,-64(s0)
    80005cf2:	87b2                	mv	a5,a2
    80005cf4:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005cf8:	4601                	li	a2,0
    80005cfa:	fc043583          	ld	a1,-64(s0)
    80005cfe:	fc843503          	ld	a0,-56(s0)
    80005d02:	00000097          	auipc	ra,0x0
    80005d06:	ef8080e7          	jalr	-264(ra) # 80005bfa <dirlookup>
    80005d0a:	fea43023          	sd	a0,-32(s0)
    80005d0e:	fe043783          	ld	a5,-32(s0)
    80005d12:	cb89                	beqz	a5,80005d24 <dirlink+0x42>
    iput(ip);
    80005d14:	fe043503          	ld	a0,-32(s0)
    80005d18:	fffff097          	auipc	ra,0xfffff
    80005d1c:	740080e7          	jalr	1856(ra) # 80005458 <iput>
    return -1;
    80005d20:	57fd                	li	a5,-1
    80005d22:	a075                	j	80005dce <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d24:	fe042623          	sw	zero,-20(s0)
    80005d28:	a0a1                	j	80005d70 <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d2a:	fd040793          	addi	a5,s0,-48
    80005d2e:	fec42683          	lw	a3,-20(s0)
    80005d32:	4741                	li	a4,16
    80005d34:	863e                	mv	a2,a5
    80005d36:	4581                	li	a1,0
    80005d38:	fc843503          	ld	a0,-56(s0)
    80005d3c:	00000097          	auipc	ra,0x0
    80005d40:	b44080e7          	jalr	-1212(ra) # 80005880 <readi>
    80005d44:	87aa                	mv	a5,a0
    80005d46:	873e                	mv	a4,a5
    80005d48:	47c1                	li	a5,16
    80005d4a:	00f70a63          	beq	a4,a5,80005d5e <dirlink+0x7c>
      panic("dirlink read");
    80005d4e:	00006517          	auipc	a0,0x6
    80005d52:	7fa50513          	addi	a0,a0,2042 # 8000c548 <etext+0x548>
    80005d56:	ffffb097          	auipc	ra,0xffffb
    80005d5a:	f36080e7          	jalr	-202(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005d5e:	fd045783          	lhu	a5,-48(s0)
    80005d62:	cf99                	beqz	a5,80005d80 <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d64:	fec42783          	lw	a5,-20(s0)
    80005d68:	27c1                	addiw	a5,a5,16
    80005d6a:	2781                	sext.w	a5,a5
    80005d6c:	fef42623          	sw	a5,-20(s0)
    80005d70:	fc843783          	ld	a5,-56(s0)
    80005d74:	47f8                	lw	a4,76(a5)
    80005d76:	fec42783          	lw	a5,-20(s0)
    80005d7a:	fae7e8e3          	bltu	a5,a4,80005d2a <dirlink+0x48>
    80005d7e:	a011                	j	80005d82 <dirlink+0xa0>
      break;
    80005d80:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005d82:	fd040793          	addi	a5,s0,-48
    80005d86:	0789                	addi	a5,a5,2
    80005d88:	4639                	li	a2,14
    80005d8a:	fc043583          	ld	a1,-64(s0)
    80005d8e:	853e                	mv	a0,a5
    80005d90:	ffffc097          	auipc	ra,0xffffc
    80005d94:	a02080e7          	jalr	-1534(ra) # 80001792 <strncpy>
  de.inum = inum;
    80005d98:	fbc42783          	lw	a5,-68(s0)
    80005d9c:	17c2                	slli	a5,a5,0x30
    80005d9e:	93c1                	srli	a5,a5,0x30
    80005da0:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005da4:	fd040793          	addi	a5,s0,-48
    80005da8:	fec42683          	lw	a3,-20(s0)
    80005dac:	4741                	li	a4,16
    80005dae:	863e                	mv	a2,a5
    80005db0:	4581                	li	a1,0
    80005db2:	fc843503          	ld	a0,-56(s0)
    80005db6:	00000097          	auipc	ra,0x0
    80005dba:	c62080e7          	jalr	-926(ra) # 80005a18 <writei>
    80005dbe:	87aa                	mv	a5,a0
    80005dc0:	873e                	mv	a4,a5
    80005dc2:	47c1                	li	a5,16
    80005dc4:	00f70463          	beq	a4,a5,80005dcc <dirlink+0xea>
    return -1;
    80005dc8:	57fd                	li	a5,-1
    80005dca:	a011                	j	80005dce <dirlink+0xec>

  return 0;
    80005dcc:	4781                	li	a5,0
}
    80005dce:	853e                	mv	a0,a5
    80005dd0:	60a6                	ld	ra,72(sp)
    80005dd2:	6406                	ld	s0,64(sp)
    80005dd4:	6161                	addi	sp,sp,80
    80005dd6:	8082                	ret

0000000080005dd8 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005dd8:	7179                	addi	sp,sp,-48
    80005dda:	f406                	sd	ra,40(sp)
    80005ddc:	f022                	sd	s0,32(sp)
    80005dde:	1800                	addi	s0,sp,48
    80005de0:	fca43c23          	sd	a0,-40(s0)
    80005de4:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005de8:	a031                	j	80005df4 <skipelem+0x1c>
    path++;
    80005dea:	fd843783          	ld	a5,-40(s0)
    80005dee:	0785                	addi	a5,a5,1
    80005df0:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005df4:	fd843783          	ld	a5,-40(s0)
    80005df8:	0007c783          	lbu	a5,0(a5)
    80005dfc:	873e                	mv	a4,a5
    80005dfe:	02f00793          	li	a5,47
    80005e02:	fef704e3          	beq	a4,a5,80005dea <skipelem+0x12>
  if(*path == 0)
    80005e06:	fd843783          	ld	a5,-40(s0)
    80005e0a:	0007c783          	lbu	a5,0(a5)
    80005e0e:	e399                	bnez	a5,80005e14 <skipelem+0x3c>
    return 0;
    80005e10:	4781                	li	a5,0
    80005e12:	a06d                	j	80005ebc <skipelem+0xe4>
  s = path;
    80005e14:	fd843783          	ld	a5,-40(s0)
    80005e18:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005e1c:	a031                	j	80005e28 <skipelem+0x50>
    path++;
    80005e1e:	fd843783          	ld	a5,-40(s0)
    80005e22:	0785                	addi	a5,a5,1
    80005e24:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005e28:	fd843783          	ld	a5,-40(s0)
    80005e2c:	0007c783          	lbu	a5,0(a5)
    80005e30:	873e                	mv	a4,a5
    80005e32:	02f00793          	li	a5,47
    80005e36:	00f70763          	beq	a4,a5,80005e44 <skipelem+0x6c>
    80005e3a:	fd843783          	ld	a5,-40(s0)
    80005e3e:	0007c783          	lbu	a5,0(a5)
    80005e42:	fff1                	bnez	a5,80005e1e <skipelem+0x46>
  len = path - s;
    80005e44:	fd843703          	ld	a4,-40(s0)
    80005e48:	fe843783          	ld	a5,-24(s0)
    80005e4c:	40f707b3          	sub	a5,a4,a5
    80005e50:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005e54:	fe442783          	lw	a5,-28(s0)
    80005e58:	0007871b          	sext.w	a4,a5
    80005e5c:	47b5                	li	a5,13
    80005e5e:	00e7dc63          	bge	a5,a4,80005e76 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005e62:	4639                	li	a2,14
    80005e64:	fe843583          	ld	a1,-24(s0)
    80005e68:	fd043503          	ld	a0,-48(s0)
    80005e6c:	ffffb097          	auipc	ra,0xffffb
    80005e70:	788080e7          	jalr	1928(ra) # 800015f4 <memmove>
    80005e74:	a80d                	j	80005ea6 <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005e76:	fe442783          	lw	a5,-28(s0)
    80005e7a:	863e                	mv	a2,a5
    80005e7c:	fe843583          	ld	a1,-24(s0)
    80005e80:	fd043503          	ld	a0,-48(s0)
    80005e84:	ffffb097          	auipc	ra,0xffffb
    80005e88:	770080e7          	jalr	1904(ra) # 800015f4 <memmove>
    name[len] = 0;
    80005e8c:	fe442783          	lw	a5,-28(s0)
    80005e90:	fd043703          	ld	a4,-48(s0)
    80005e94:	97ba                	add	a5,a5,a4
    80005e96:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005e9a:	a031                	j	80005ea6 <skipelem+0xce>
    path++;
    80005e9c:	fd843783          	ld	a5,-40(s0)
    80005ea0:	0785                	addi	a5,a5,1
    80005ea2:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005ea6:	fd843783          	ld	a5,-40(s0)
    80005eaa:	0007c783          	lbu	a5,0(a5)
    80005eae:	873e                	mv	a4,a5
    80005eb0:	02f00793          	li	a5,47
    80005eb4:	fef704e3          	beq	a4,a5,80005e9c <skipelem+0xc4>
  return path;
    80005eb8:	fd843783          	ld	a5,-40(s0)
}
    80005ebc:	853e                	mv	a0,a5
    80005ebe:	70a2                	ld	ra,40(sp)
    80005ec0:	7402                	ld	s0,32(sp)
    80005ec2:	6145                	addi	sp,sp,48
    80005ec4:	8082                	ret

0000000080005ec6 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005ec6:	7139                	addi	sp,sp,-64
    80005ec8:	fc06                	sd	ra,56(sp)
    80005eca:	f822                	sd	s0,48(sp)
    80005ecc:	0080                	addi	s0,sp,64
    80005ece:	fca43c23          	sd	a0,-40(s0)
    80005ed2:	87ae                	mv	a5,a1
    80005ed4:	fcc43423          	sd	a2,-56(s0)
    80005ed8:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005edc:	fd843783          	ld	a5,-40(s0)
    80005ee0:	0007c783          	lbu	a5,0(a5)
    80005ee4:	873e                	mv	a4,a5
    80005ee6:	02f00793          	li	a5,47
    80005eea:	00f71b63          	bne	a4,a5,80005f00 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005eee:	4585                	li	a1,1
    80005ef0:	4505                	li	a0,1
    80005ef2:	fffff097          	auipc	ra,0xfffff
    80005ef6:	270080e7          	jalr	624(ra) # 80005162 <iget>
    80005efa:	fea43423          	sd	a0,-24(s0)
    80005efe:	a84d                	j	80005fb0 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005f00:	ffffd097          	auipc	ra,0xffffd
    80005f04:	b18080e7          	jalr	-1256(ra) # 80002a18 <myproc>
    80005f08:	87aa                	mv	a5,a0
    80005f0a:	1507b783          	ld	a5,336(a5)
    80005f0e:	853e                	mv	a0,a5
    80005f10:	fffff097          	auipc	ra,0xfffff
    80005f14:	36e080e7          	jalr	878(ra) # 8000527e <idup>
    80005f18:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005f1c:	a851                	j	80005fb0 <namex+0xea>
    ilock(ip);
    80005f1e:	fe843503          	ld	a0,-24(s0)
    80005f22:	fffff097          	auipc	ra,0xfffff
    80005f26:	3a8080e7          	jalr	936(ra) # 800052ca <ilock>
    if(ip->type != T_DIR){
    80005f2a:	fe843783          	ld	a5,-24(s0)
    80005f2e:	04479783          	lh	a5,68(a5)
    80005f32:	0007871b          	sext.w	a4,a5
    80005f36:	4785                	li	a5,1
    80005f38:	00f70a63          	beq	a4,a5,80005f4c <namex+0x86>
      iunlockput(ip);
    80005f3c:	fe843503          	ld	a0,-24(s0)
    80005f40:	fffff097          	auipc	ra,0xfffff
    80005f44:	5e8080e7          	jalr	1512(ra) # 80005528 <iunlockput>
      return 0;
    80005f48:	4781                	li	a5,0
    80005f4a:	a871                	j	80005fe6 <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005f4c:	fd442783          	lw	a5,-44(s0)
    80005f50:	2781                	sext.w	a5,a5
    80005f52:	cf99                	beqz	a5,80005f70 <namex+0xaa>
    80005f54:	fd843783          	ld	a5,-40(s0)
    80005f58:	0007c783          	lbu	a5,0(a5)
    80005f5c:	eb91                	bnez	a5,80005f70 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005f5e:	fe843503          	ld	a0,-24(s0)
    80005f62:	fffff097          	auipc	ra,0xfffff
    80005f66:	49c080e7          	jalr	1180(ra) # 800053fe <iunlock>
      return ip;
    80005f6a:	fe843783          	ld	a5,-24(s0)
    80005f6e:	a8a5                	j	80005fe6 <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005f70:	4601                	li	a2,0
    80005f72:	fc843583          	ld	a1,-56(s0)
    80005f76:	fe843503          	ld	a0,-24(s0)
    80005f7a:	00000097          	auipc	ra,0x0
    80005f7e:	c80080e7          	jalr	-896(ra) # 80005bfa <dirlookup>
    80005f82:	fea43023          	sd	a0,-32(s0)
    80005f86:	fe043783          	ld	a5,-32(s0)
    80005f8a:	eb89                	bnez	a5,80005f9c <namex+0xd6>
      iunlockput(ip);
    80005f8c:	fe843503          	ld	a0,-24(s0)
    80005f90:	fffff097          	auipc	ra,0xfffff
    80005f94:	598080e7          	jalr	1432(ra) # 80005528 <iunlockput>
      return 0;
    80005f98:	4781                	li	a5,0
    80005f9a:	a0b1                	j	80005fe6 <namex+0x120>
    }
    iunlockput(ip);
    80005f9c:	fe843503          	ld	a0,-24(s0)
    80005fa0:	fffff097          	auipc	ra,0xfffff
    80005fa4:	588080e7          	jalr	1416(ra) # 80005528 <iunlockput>
    ip = next;
    80005fa8:	fe043783          	ld	a5,-32(s0)
    80005fac:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005fb0:	fc843583          	ld	a1,-56(s0)
    80005fb4:	fd843503          	ld	a0,-40(s0)
    80005fb8:	00000097          	auipc	ra,0x0
    80005fbc:	e20080e7          	jalr	-480(ra) # 80005dd8 <skipelem>
    80005fc0:	fca43c23          	sd	a0,-40(s0)
    80005fc4:	fd843783          	ld	a5,-40(s0)
    80005fc8:	fbb9                	bnez	a5,80005f1e <namex+0x58>
  }
  if(nameiparent){
    80005fca:	fd442783          	lw	a5,-44(s0)
    80005fce:	2781                	sext.w	a5,a5
    80005fd0:	cb89                	beqz	a5,80005fe2 <namex+0x11c>
    iput(ip);
    80005fd2:	fe843503          	ld	a0,-24(s0)
    80005fd6:	fffff097          	auipc	ra,0xfffff
    80005fda:	482080e7          	jalr	1154(ra) # 80005458 <iput>
    return 0;
    80005fde:	4781                	li	a5,0
    80005fe0:	a019                	j	80005fe6 <namex+0x120>
  }
  return ip;
    80005fe2:	fe843783          	ld	a5,-24(s0)
}
    80005fe6:	853e                	mv	a0,a5
    80005fe8:	70e2                	ld	ra,56(sp)
    80005fea:	7442                	ld	s0,48(sp)
    80005fec:	6121                	addi	sp,sp,64
    80005fee:	8082                	ret

0000000080005ff0 <namei>:

struct inode*
namei(char *path)
{
    80005ff0:	7179                	addi	sp,sp,-48
    80005ff2:	f406                	sd	ra,40(sp)
    80005ff4:	f022                	sd	s0,32(sp)
    80005ff6:	1800                	addi	s0,sp,48
    80005ff8:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005ffc:	fe040793          	addi	a5,s0,-32
    80006000:	863e                	mv	a2,a5
    80006002:	4581                	li	a1,0
    80006004:	fd843503          	ld	a0,-40(s0)
    80006008:	00000097          	auipc	ra,0x0
    8000600c:	ebe080e7          	jalr	-322(ra) # 80005ec6 <namex>
    80006010:	87aa                	mv	a5,a0
}
    80006012:	853e                	mv	a0,a5
    80006014:	70a2                	ld	ra,40(sp)
    80006016:	7402                	ld	s0,32(sp)
    80006018:	6145                	addi	sp,sp,48
    8000601a:	8082                	ret

000000008000601c <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    8000601c:	1101                	addi	sp,sp,-32
    8000601e:	ec06                	sd	ra,24(sp)
    80006020:	e822                	sd	s0,16(sp)
    80006022:	1000                	addi	s0,sp,32
    80006024:	fea43423          	sd	a0,-24(s0)
    80006028:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    8000602c:	fe043603          	ld	a2,-32(s0)
    80006030:	4585                	li	a1,1
    80006032:	fe843503          	ld	a0,-24(s0)
    80006036:	00000097          	auipc	ra,0x0
    8000603a:	e90080e7          	jalr	-368(ra) # 80005ec6 <namex>
    8000603e:	87aa                	mv	a5,a0
}
    80006040:	853e                	mv	a0,a5
    80006042:	60e2                	ld	ra,24(sp)
    80006044:	6442                	ld	s0,16(sp)
    80006046:	6105                	addi	sp,sp,32
    80006048:	8082                	ret

000000008000604a <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    8000604a:	1101                	addi	sp,sp,-32
    8000604c:	ec06                	sd	ra,24(sp)
    8000604e:	e822                	sd	s0,16(sp)
    80006050:	1000                	addi	s0,sp,32
    80006052:	87aa                	mv	a5,a0
    80006054:	feb43023          	sd	a1,-32(s0)
    80006058:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    8000605c:	00006597          	auipc	a1,0x6
    80006060:	4fc58593          	addi	a1,a1,1276 # 8000c558 <etext+0x558>
    80006064:	0001f517          	auipc	a0,0x1f
    80006068:	ba450513          	addi	a0,a0,-1116 # 80024c08 <log>
    8000606c:	ffffb097          	auipc	ra,0xffffb
    80006070:	2a0080e7          	jalr	672(ra) # 8000130c <initlock>
  log.start = sb->logstart;
    80006074:	fe043783          	ld	a5,-32(s0)
    80006078:	4bdc                	lw	a5,20(a5)
    8000607a:	0007871b          	sext.w	a4,a5
    8000607e:	0001f797          	auipc	a5,0x1f
    80006082:	b8a78793          	addi	a5,a5,-1142 # 80024c08 <log>
    80006086:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80006088:	fe043783          	ld	a5,-32(s0)
    8000608c:	4b9c                	lw	a5,16(a5)
    8000608e:	0007871b          	sext.w	a4,a5
    80006092:	0001f797          	auipc	a5,0x1f
    80006096:	b7678793          	addi	a5,a5,-1162 # 80024c08 <log>
    8000609a:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    8000609c:	0001f797          	auipc	a5,0x1f
    800060a0:	b6c78793          	addi	a5,a5,-1172 # 80024c08 <log>
    800060a4:	fec42703          	lw	a4,-20(s0)
    800060a8:	d798                	sw	a4,40(a5)
  recover_from_log();
    800060aa:	00000097          	auipc	ra,0x0
    800060ae:	272080e7          	jalr	626(ra) # 8000631c <recover_from_log>
}
    800060b2:	0001                	nop
    800060b4:	60e2                	ld	ra,24(sp)
    800060b6:	6442                	ld	s0,16(sp)
    800060b8:	6105                	addi	sp,sp,32
    800060ba:	8082                	ret

00000000800060bc <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    800060bc:	7139                	addi	sp,sp,-64
    800060be:	fc06                	sd	ra,56(sp)
    800060c0:	f822                	sd	s0,48(sp)
    800060c2:	0080                	addi	s0,sp,64
    800060c4:	87aa                	mv	a5,a0
    800060c6:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800060ca:	fe042623          	sw	zero,-20(s0)
    800060ce:	a0f9                	j	8000619c <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    800060d0:	0001f797          	auipc	a5,0x1f
    800060d4:	b3878793          	addi	a5,a5,-1224 # 80024c08 <log>
    800060d8:	579c                	lw	a5,40(a5)
    800060da:	0007869b          	sext.w	a3,a5
    800060de:	0001f797          	auipc	a5,0x1f
    800060e2:	b2a78793          	addi	a5,a5,-1238 # 80024c08 <log>
    800060e6:	4f9c                	lw	a5,24(a5)
    800060e8:	fec42703          	lw	a4,-20(s0)
    800060ec:	9fb9                	addw	a5,a5,a4
    800060ee:	2781                	sext.w	a5,a5
    800060f0:	2785                	addiw	a5,a5,1
    800060f2:	2781                	sext.w	a5,a5
    800060f4:	2781                	sext.w	a5,a5
    800060f6:	85be                	mv	a1,a5
    800060f8:	8536                	mv	a0,a3
    800060fa:	ffffe097          	auipc	ra,0xffffe
    800060fe:	7dc080e7          	jalr	2012(ra) # 800048d6 <bread>
    80006102:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80006106:	0001f797          	auipc	a5,0x1f
    8000610a:	b0278793          	addi	a5,a5,-1278 # 80024c08 <log>
    8000610e:	579c                	lw	a5,40(a5)
    80006110:	0007869b          	sext.w	a3,a5
    80006114:	0001f717          	auipc	a4,0x1f
    80006118:	af470713          	addi	a4,a4,-1292 # 80024c08 <log>
    8000611c:	fec42783          	lw	a5,-20(s0)
    80006120:	07a1                	addi	a5,a5,8
    80006122:	078a                	slli	a5,a5,0x2
    80006124:	97ba                	add	a5,a5,a4
    80006126:	4b9c                	lw	a5,16(a5)
    80006128:	2781                	sext.w	a5,a5
    8000612a:	85be                	mv	a1,a5
    8000612c:	8536                	mv	a0,a3
    8000612e:	ffffe097          	auipc	ra,0xffffe
    80006132:	7a8080e7          	jalr	1960(ra) # 800048d6 <bread>
    80006136:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    8000613a:	fd843783          	ld	a5,-40(s0)
    8000613e:	05878713          	addi	a4,a5,88
    80006142:	fe043783          	ld	a5,-32(s0)
    80006146:	05878793          	addi	a5,a5,88
    8000614a:	40000613          	li	a2,1024
    8000614e:	85be                	mv	a1,a5
    80006150:	853a                	mv	a0,a4
    80006152:	ffffb097          	auipc	ra,0xffffb
    80006156:	4a2080e7          	jalr	1186(ra) # 800015f4 <memmove>
    bwrite(dbuf);  // write dst to disk
    8000615a:	fd843503          	ld	a0,-40(s0)
    8000615e:	ffffe097          	auipc	ra,0xffffe
    80006162:	7d6080e7          	jalr	2006(ra) # 80004934 <bwrite>
    if(recovering == 0)
    80006166:	fcc42783          	lw	a5,-52(s0)
    8000616a:	2781                	sext.w	a5,a5
    8000616c:	e799                	bnez	a5,8000617a <install_trans+0xbe>
      bunpin(dbuf);
    8000616e:	fd843503          	ld	a0,-40(s0)
    80006172:	fffff097          	auipc	ra,0xfffff
    80006176:	944080e7          	jalr	-1724(ra) # 80004ab6 <bunpin>
    brelse(lbuf);
    8000617a:	fe043503          	ld	a0,-32(s0)
    8000617e:	fffff097          	auipc	ra,0xfffff
    80006182:	802080e7          	jalr	-2046(ra) # 80004980 <brelse>
    brelse(dbuf);
    80006186:	fd843503          	ld	a0,-40(s0)
    8000618a:	ffffe097          	auipc	ra,0xffffe
    8000618e:	7f6080e7          	jalr	2038(ra) # 80004980 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    80006192:	fec42783          	lw	a5,-20(s0)
    80006196:	2785                	addiw	a5,a5,1
    80006198:	fef42623          	sw	a5,-20(s0)
    8000619c:	0001f797          	auipc	a5,0x1f
    800061a0:	a6c78793          	addi	a5,a5,-1428 # 80024c08 <log>
    800061a4:	57d8                	lw	a4,44(a5)
    800061a6:	fec42783          	lw	a5,-20(s0)
    800061aa:	2781                	sext.w	a5,a5
    800061ac:	f2e7c2e3          	blt	a5,a4,800060d0 <install_trans+0x14>
  }
}
    800061b0:	0001                	nop
    800061b2:	0001                	nop
    800061b4:	70e2                	ld	ra,56(sp)
    800061b6:	7442                	ld	s0,48(sp)
    800061b8:	6121                	addi	sp,sp,64
    800061ba:	8082                	ret

00000000800061bc <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800061bc:	7179                	addi	sp,sp,-48
    800061be:	f406                	sd	ra,40(sp)
    800061c0:	f022                	sd	s0,32(sp)
    800061c2:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800061c4:	0001f797          	auipc	a5,0x1f
    800061c8:	a4478793          	addi	a5,a5,-1468 # 80024c08 <log>
    800061cc:	579c                	lw	a5,40(a5)
    800061ce:	0007871b          	sext.w	a4,a5
    800061d2:	0001f797          	auipc	a5,0x1f
    800061d6:	a3678793          	addi	a5,a5,-1482 # 80024c08 <log>
    800061da:	4f9c                	lw	a5,24(a5)
    800061dc:	2781                	sext.w	a5,a5
    800061de:	85be                	mv	a1,a5
    800061e0:	853a                	mv	a0,a4
    800061e2:	ffffe097          	auipc	ra,0xffffe
    800061e6:	6f4080e7          	jalr	1780(ra) # 800048d6 <bread>
    800061ea:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    800061ee:	fe043783          	ld	a5,-32(s0)
    800061f2:	05878793          	addi	a5,a5,88
    800061f6:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    800061fa:	fd843783          	ld	a5,-40(s0)
    800061fe:	4398                	lw	a4,0(a5)
    80006200:	0001f797          	auipc	a5,0x1f
    80006204:	a0878793          	addi	a5,a5,-1528 # 80024c08 <log>
    80006208:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000620a:	fe042623          	sw	zero,-20(s0)
    8000620e:	a03d                	j	8000623c <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80006210:	fd843703          	ld	a4,-40(s0)
    80006214:	fec42783          	lw	a5,-20(s0)
    80006218:	078a                	slli	a5,a5,0x2
    8000621a:	97ba                	add	a5,a5,a4
    8000621c:	43d8                	lw	a4,4(a5)
    8000621e:	0001f697          	auipc	a3,0x1f
    80006222:	9ea68693          	addi	a3,a3,-1558 # 80024c08 <log>
    80006226:	fec42783          	lw	a5,-20(s0)
    8000622a:	07a1                	addi	a5,a5,8
    8000622c:	078a                	slli	a5,a5,0x2
    8000622e:	97b6                	add	a5,a5,a3
    80006230:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006232:	fec42783          	lw	a5,-20(s0)
    80006236:	2785                	addiw	a5,a5,1
    80006238:	fef42623          	sw	a5,-20(s0)
    8000623c:	0001f797          	auipc	a5,0x1f
    80006240:	9cc78793          	addi	a5,a5,-1588 # 80024c08 <log>
    80006244:	57d8                	lw	a4,44(a5)
    80006246:	fec42783          	lw	a5,-20(s0)
    8000624a:	2781                	sext.w	a5,a5
    8000624c:	fce7c2e3          	blt	a5,a4,80006210 <read_head+0x54>
  }
  brelse(buf);
    80006250:	fe043503          	ld	a0,-32(s0)
    80006254:	ffffe097          	auipc	ra,0xffffe
    80006258:	72c080e7          	jalr	1836(ra) # 80004980 <brelse>
}
    8000625c:	0001                	nop
    8000625e:	70a2                	ld	ra,40(sp)
    80006260:	7402                	ld	s0,32(sp)
    80006262:	6145                	addi	sp,sp,48
    80006264:	8082                	ret

0000000080006266 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    80006266:	7179                	addi	sp,sp,-48
    80006268:	f406                	sd	ra,40(sp)
    8000626a:	f022                	sd	s0,32(sp)
    8000626c:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    8000626e:	0001f797          	auipc	a5,0x1f
    80006272:	99a78793          	addi	a5,a5,-1638 # 80024c08 <log>
    80006276:	579c                	lw	a5,40(a5)
    80006278:	0007871b          	sext.w	a4,a5
    8000627c:	0001f797          	auipc	a5,0x1f
    80006280:	98c78793          	addi	a5,a5,-1652 # 80024c08 <log>
    80006284:	4f9c                	lw	a5,24(a5)
    80006286:	2781                	sext.w	a5,a5
    80006288:	85be                	mv	a1,a5
    8000628a:	853a                	mv	a0,a4
    8000628c:	ffffe097          	auipc	ra,0xffffe
    80006290:	64a080e7          	jalr	1610(ra) # 800048d6 <bread>
    80006294:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    80006298:	fe043783          	ld	a5,-32(s0)
    8000629c:	05878793          	addi	a5,a5,88
    800062a0:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    800062a4:	0001f797          	auipc	a5,0x1f
    800062a8:	96478793          	addi	a5,a5,-1692 # 80024c08 <log>
    800062ac:	57d8                	lw	a4,44(a5)
    800062ae:	fd843783          	ld	a5,-40(s0)
    800062b2:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800062b4:	fe042623          	sw	zero,-20(s0)
    800062b8:	a03d                	j	800062e6 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800062ba:	0001f717          	auipc	a4,0x1f
    800062be:	94e70713          	addi	a4,a4,-1714 # 80024c08 <log>
    800062c2:	fec42783          	lw	a5,-20(s0)
    800062c6:	07a1                	addi	a5,a5,8
    800062c8:	078a                	slli	a5,a5,0x2
    800062ca:	97ba                	add	a5,a5,a4
    800062cc:	4b98                	lw	a4,16(a5)
    800062ce:	fd843683          	ld	a3,-40(s0)
    800062d2:	fec42783          	lw	a5,-20(s0)
    800062d6:	078a                	slli	a5,a5,0x2
    800062d8:	97b6                	add	a5,a5,a3
    800062da:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    800062dc:	fec42783          	lw	a5,-20(s0)
    800062e0:	2785                	addiw	a5,a5,1
    800062e2:	fef42623          	sw	a5,-20(s0)
    800062e6:	0001f797          	auipc	a5,0x1f
    800062ea:	92278793          	addi	a5,a5,-1758 # 80024c08 <log>
    800062ee:	57d8                	lw	a4,44(a5)
    800062f0:	fec42783          	lw	a5,-20(s0)
    800062f4:	2781                	sext.w	a5,a5
    800062f6:	fce7c2e3          	blt	a5,a4,800062ba <write_head+0x54>
  }
  bwrite(buf);
    800062fa:	fe043503          	ld	a0,-32(s0)
    800062fe:	ffffe097          	auipc	ra,0xffffe
    80006302:	636080e7          	jalr	1590(ra) # 80004934 <bwrite>
  brelse(buf);
    80006306:	fe043503          	ld	a0,-32(s0)
    8000630a:	ffffe097          	auipc	ra,0xffffe
    8000630e:	676080e7          	jalr	1654(ra) # 80004980 <brelse>
}
    80006312:	0001                	nop
    80006314:	70a2                	ld	ra,40(sp)
    80006316:	7402                	ld	s0,32(sp)
    80006318:	6145                	addi	sp,sp,48
    8000631a:	8082                	ret

000000008000631c <recover_from_log>:

static void
recover_from_log(void)
{
    8000631c:	1141                	addi	sp,sp,-16
    8000631e:	e406                	sd	ra,8(sp)
    80006320:	e022                	sd	s0,0(sp)
    80006322:	0800                	addi	s0,sp,16
  read_head();
    80006324:	00000097          	auipc	ra,0x0
    80006328:	e98080e7          	jalr	-360(ra) # 800061bc <read_head>
  install_trans(1); // if committed, copy from log to disk
    8000632c:	4505                	li	a0,1
    8000632e:	00000097          	auipc	ra,0x0
    80006332:	d8e080e7          	jalr	-626(ra) # 800060bc <install_trans>
  log.lh.n = 0;
    80006336:	0001f797          	auipc	a5,0x1f
    8000633a:	8d278793          	addi	a5,a5,-1838 # 80024c08 <log>
    8000633e:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    80006342:	00000097          	auipc	ra,0x0
    80006346:	f24080e7          	jalr	-220(ra) # 80006266 <write_head>
}
    8000634a:	0001                	nop
    8000634c:	60a2                	ld	ra,8(sp)
    8000634e:	6402                	ld	s0,0(sp)
    80006350:	0141                	addi	sp,sp,16
    80006352:	8082                	ret

0000000080006354 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    80006354:	1141                	addi	sp,sp,-16
    80006356:	e406                	sd	ra,8(sp)
    80006358:	e022                	sd	s0,0(sp)
    8000635a:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    8000635c:	0001f517          	auipc	a0,0x1f
    80006360:	8ac50513          	addi	a0,a0,-1876 # 80024c08 <log>
    80006364:	ffffb097          	auipc	ra,0xffffb
    80006368:	fd8080e7          	jalr	-40(ra) # 8000133c <acquire>
  while(1){
    if(log.committing){
    8000636c:	0001f797          	auipc	a5,0x1f
    80006370:	89c78793          	addi	a5,a5,-1892 # 80024c08 <log>
    80006374:	53dc                	lw	a5,36(a5)
    80006376:	cf91                	beqz	a5,80006392 <begin_op+0x3e>
      sleep(&log, &log.lock);
    80006378:	0001f597          	auipc	a1,0x1f
    8000637c:	89058593          	addi	a1,a1,-1904 # 80024c08 <log>
    80006380:	0001f517          	auipc	a0,0x1f
    80006384:	88850513          	addi	a0,a0,-1912 # 80024c08 <log>
    80006388:	ffffd097          	auipc	ra,0xffffd
    8000638c:	252080e7          	jalr	594(ra) # 800035da <sleep>
    80006390:	bff1                	j	8000636c <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    80006392:	0001f797          	auipc	a5,0x1f
    80006396:	87678793          	addi	a5,a5,-1930 # 80024c08 <log>
    8000639a:	57d8                	lw	a4,44(a5)
    8000639c:	0001f797          	auipc	a5,0x1f
    800063a0:	86c78793          	addi	a5,a5,-1940 # 80024c08 <log>
    800063a4:	539c                	lw	a5,32(a5)
    800063a6:	2785                	addiw	a5,a5,1
    800063a8:	2781                	sext.w	a5,a5
    800063aa:	86be                	mv	a3,a5
    800063ac:	87b6                	mv	a5,a3
    800063ae:	0027979b          	slliw	a5,a5,0x2
    800063b2:	9fb5                	addw	a5,a5,a3
    800063b4:	0017979b          	slliw	a5,a5,0x1
    800063b8:	2781                	sext.w	a5,a5
    800063ba:	9fb9                	addw	a5,a5,a4
    800063bc:	2781                	sext.w	a5,a5
    800063be:	873e                	mv	a4,a5
    800063c0:	47f9                	li	a5,30
    800063c2:	00e7df63          	bge	a5,a4,800063e0 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800063c6:	0001f597          	auipc	a1,0x1f
    800063ca:	84258593          	addi	a1,a1,-1982 # 80024c08 <log>
    800063ce:	0001f517          	auipc	a0,0x1f
    800063d2:	83a50513          	addi	a0,a0,-1990 # 80024c08 <log>
    800063d6:	ffffd097          	auipc	ra,0xffffd
    800063da:	204080e7          	jalr	516(ra) # 800035da <sleep>
    800063de:	b779                	j	8000636c <begin_op+0x18>
    } else {
      log.outstanding += 1;
    800063e0:	0001f797          	auipc	a5,0x1f
    800063e4:	82878793          	addi	a5,a5,-2008 # 80024c08 <log>
    800063e8:	539c                	lw	a5,32(a5)
    800063ea:	2785                	addiw	a5,a5,1
    800063ec:	0007871b          	sext.w	a4,a5
    800063f0:	0001f797          	auipc	a5,0x1f
    800063f4:	81878793          	addi	a5,a5,-2024 # 80024c08 <log>
    800063f8:	d398                	sw	a4,32(a5)
      release(&log.lock);
    800063fa:	0001f517          	auipc	a0,0x1f
    800063fe:	80e50513          	addi	a0,a0,-2034 # 80024c08 <log>
    80006402:	ffffb097          	auipc	ra,0xffffb
    80006406:	f9e080e7          	jalr	-98(ra) # 800013a0 <release>
      break;
    8000640a:	0001                	nop
    }
  }
}
    8000640c:	0001                	nop
    8000640e:	60a2                	ld	ra,8(sp)
    80006410:	6402                	ld	s0,0(sp)
    80006412:	0141                	addi	sp,sp,16
    80006414:	8082                	ret

0000000080006416 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80006416:	1101                	addi	sp,sp,-32
    80006418:	ec06                	sd	ra,24(sp)
    8000641a:	e822                	sd	s0,16(sp)
    8000641c:	1000                	addi	s0,sp,32
  int do_commit = 0;
    8000641e:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006422:	0001e517          	auipc	a0,0x1e
    80006426:	7e650513          	addi	a0,a0,2022 # 80024c08 <log>
    8000642a:	ffffb097          	auipc	ra,0xffffb
    8000642e:	f12080e7          	jalr	-238(ra) # 8000133c <acquire>
  log.outstanding -= 1;
    80006432:	0001e797          	auipc	a5,0x1e
    80006436:	7d678793          	addi	a5,a5,2006 # 80024c08 <log>
    8000643a:	539c                	lw	a5,32(a5)
    8000643c:	37fd                	addiw	a5,a5,-1
    8000643e:	0007871b          	sext.w	a4,a5
    80006442:	0001e797          	auipc	a5,0x1e
    80006446:	7c678793          	addi	a5,a5,1990 # 80024c08 <log>
    8000644a:	d398                	sw	a4,32(a5)
  if(log.committing)
    8000644c:	0001e797          	auipc	a5,0x1e
    80006450:	7bc78793          	addi	a5,a5,1980 # 80024c08 <log>
    80006454:	53dc                	lw	a5,36(a5)
    80006456:	cb89                	beqz	a5,80006468 <end_op+0x52>
    panic("log.committing");
    80006458:	00006517          	auipc	a0,0x6
    8000645c:	10850513          	addi	a0,a0,264 # 8000c560 <etext+0x560>
    80006460:	ffffb097          	auipc	ra,0xffffb
    80006464:	82c080e7          	jalr	-2004(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    80006468:	0001e797          	auipc	a5,0x1e
    8000646c:	7a078793          	addi	a5,a5,1952 # 80024c08 <log>
    80006470:	539c                	lw	a5,32(a5)
    80006472:	eb99                	bnez	a5,80006488 <end_op+0x72>
    do_commit = 1;
    80006474:	4785                	li	a5,1
    80006476:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    8000647a:	0001e797          	auipc	a5,0x1e
    8000647e:	78e78793          	addi	a5,a5,1934 # 80024c08 <log>
    80006482:	4705                	li	a4,1
    80006484:	d3d8                	sw	a4,36(a5)
    80006486:	a809                	j	80006498 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    80006488:	0001e517          	auipc	a0,0x1e
    8000648c:	78050513          	addi	a0,a0,1920 # 80024c08 <log>
    80006490:	ffffd097          	auipc	ra,0xffffd
    80006494:	1c6080e7          	jalr	454(ra) # 80003656 <wakeup>
  }
  release(&log.lock);
    80006498:	0001e517          	auipc	a0,0x1e
    8000649c:	77050513          	addi	a0,a0,1904 # 80024c08 <log>
    800064a0:	ffffb097          	auipc	ra,0xffffb
    800064a4:	f00080e7          	jalr	-256(ra) # 800013a0 <release>

  if(do_commit){
    800064a8:	fec42783          	lw	a5,-20(s0)
    800064ac:	2781                	sext.w	a5,a5
    800064ae:	c3b9                	beqz	a5,800064f4 <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800064b0:	00000097          	auipc	ra,0x0
    800064b4:	134080e7          	jalr	308(ra) # 800065e4 <commit>
    acquire(&log.lock);
    800064b8:	0001e517          	auipc	a0,0x1e
    800064bc:	75050513          	addi	a0,a0,1872 # 80024c08 <log>
    800064c0:	ffffb097          	auipc	ra,0xffffb
    800064c4:	e7c080e7          	jalr	-388(ra) # 8000133c <acquire>
    log.committing = 0;
    800064c8:	0001e797          	auipc	a5,0x1e
    800064cc:	74078793          	addi	a5,a5,1856 # 80024c08 <log>
    800064d0:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    800064d4:	0001e517          	auipc	a0,0x1e
    800064d8:	73450513          	addi	a0,a0,1844 # 80024c08 <log>
    800064dc:	ffffd097          	auipc	ra,0xffffd
    800064e0:	17a080e7          	jalr	378(ra) # 80003656 <wakeup>
    release(&log.lock);
    800064e4:	0001e517          	auipc	a0,0x1e
    800064e8:	72450513          	addi	a0,a0,1828 # 80024c08 <log>
    800064ec:	ffffb097          	auipc	ra,0xffffb
    800064f0:	eb4080e7          	jalr	-332(ra) # 800013a0 <release>
  }
}
    800064f4:	0001                	nop
    800064f6:	60e2                	ld	ra,24(sp)
    800064f8:	6442                	ld	s0,16(sp)
    800064fa:	6105                	addi	sp,sp,32
    800064fc:	8082                	ret

00000000800064fe <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    800064fe:	7179                	addi	sp,sp,-48
    80006500:	f406                	sd	ra,40(sp)
    80006502:	f022                	sd	s0,32(sp)
    80006504:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006506:	fe042623          	sw	zero,-20(s0)
    8000650a:	a86d                	j	800065c4 <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    8000650c:	0001e797          	auipc	a5,0x1e
    80006510:	6fc78793          	addi	a5,a5,1788 # 80024c08 <log>
    80006514:	579c                	lw	a5,40(a5)
    80006516:	0007869b          	sext.w	a3,a5
    8000651a:	0001e797          	auipc	a5,0x1e
    8000651e:	6ee78793          	addi	a5,a5,1774 # 80024c08 <log>
    80006522:	4f9c                	lw	a5,24(a5)
    80006524:	fec42703          	lw	a4,-20(s0)
    80006528:	9fb9                	addw	a5,a5,a4
    8000652a:	2781                	sext.w	a5,a5
    8000652c:	2785                	addiw	a5,a5,1
    8000652e:	2781                	sext.w	a5,a5
    80006530:	2781                	sext.w	a5,a5
    80006532:	85be                	mv	a1,a5
    80006534:	8536                	mv	a0,a3
    80006536:	ffffe097          	auipc	ra,0xffffe
    8000653a:	3a0080e7          	jalr	928(ra) # 800048d6 <bread>
    8000653e:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80006542:	0001e797          	auipc	a5,0x1e
    80006546:	6c678793          	addi	a5,a5,1734 # 80024c08 <log>
    8000654a:	579c                	lw	a5,40(a5)
    8000654c:	0007869b          	sext.w	a3,a5
    80006550:	0001e717          	auipc	a4,0x1e
    80006554:	6b870713          	addi	a4,a4,1720 # 80024c08 <log>
    80006558:	fec42783          	lw	a5,-20(s0)
    8000655c:	07a1                	addi	a5,a5,8
    8000655e:	078a                	slli	a5,a5,0x2
    80006560:	97ba                	add	a5,a5,a4
    80006562:	4b9c                	lw	a5,16(a5)
    80006564:	2781                	sext.w	a5,a5
    80006566:	85be                	mv	a1,a5
    80006568:	8536                	mv	a0,a3
    8000656a:	ffffe097          	auipc	ra,0xffffe
    8000656e:	36c080e7          	jalr	876(ra) # 800048d6 <bread>
    80006572:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    80006576:	fe043783          	ld	a5,-32(s0)
    8000657a:	05878713          	addi	a4,a5,88
    8000657e:	fd843783          	ld	a5,-40(s0)
    80006582:	05878793          	addi	a5,a5,88
    80006586:	40000613          	li	a2,1024
    8000658a:	85be                	mv	a1,a5
    8000658c:	853a                	mv	a0,a4
    8000658e:	ffffb097          	auipc	ra,0xffffb
    80006592:	066080e7          	jalr	102(ra) # 800015f4 <memmove>
    bwrite(to);  // write the log
    80006596:	fe043503          	ld	a0,-32(s0)
    8000659a:	ffffe097          	auipc	ra,0xffffe
    8000659e:	39a080e7          	jalr	922(ra) # 80004934 <bwrite>
    brelse(from);
    800065a2:	fd843503          	ld	a0,-40(s0)
    800065a6:	ffffe097          	auipc	ra,0xffffe
    800065aa:	3da080e7          	jalr	986(ra) # 80004980 <brelse>
    brelse(to);
    800065ae:	fe043503          	ld	a0,-32(s0)
    800065b2:	ffffe097          	auipc	ra,0xffffe
    800065b6:	3ce080e7          	jalr	974(ra) # 80004980 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800065ba:	fec42783          	lw	a5,-20(s0)
    800065be:	2785                	addiw	a5,a5,1
    800065c0:	fef42623          	sw	a5,-20(s0)
    800065c4:	0001e797          	auipc	a5,0x1e
    800065c8:	64478793          	addi	a5,a5,1604 # 80024c08 <log>
    800065cc:	57d8                	lw	a4,44(a5)
    800065ce:	fec42783          	lw	a5,-20(s0)
    800065d2:	2781                	sext.w	a5,a5
    800065d4:	f2e7cce3          	blt	a5,a4,8000650c <write_log+0xe>
  }
}
    800065d8:	0001                	nop
    800065da:	0001                	nop
    800065dc:	70a2                	ld	ra,40(sp)
    800065de:	7402                	ld	s0,32(sp)
    800065e0:	6145                	addi	sp,sp,48
    800065e2:	8082                	ret

00000000800065e4 <commit>:

static void
commit()
{
    800065e4:	1141                	addi	sp,sp,-16
    800065e6:	e406                	sd	ra,8(sp)
    800065e8:	e022                	sd	s0,0(sp)
    800065ea:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    800065ec:	0001e797          	auipc	a5,0x1e
    800065f0:	61c78793          	addi	a5,a5,1564 # 80024c08 <log>
    800065f4:	57dc                	lw	a5,44(a5)
    800065f6:	02f05963          	blez	a5,80006628 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    800065fa:	00000097          	auipc	ra,0x0
    800065fe:	f04080e7          	jalr	-252(ra) # 800064fe <write_log>
    write_head();    // Write header to disk -- the real commit
    80006602:	00000097          	auipc	ra,0x0
    80006606:	c64080e7          	jalr	-924(ra) # 80006266 <write_head>
    install_trans(0); // Now install writes to home locations
    8000660a:	4501                	li	a0,0
    8000660c:	00000097          	auipc	ra,0x0
    80006610:	ab0080e7          	jalr	-1360(ra) # 800060bc <install_trans>
    log.lh.n = 0;
    80006614:	0001e797          	auipc	a5,0x1e
    80006618:	5f478793          	addi	a5,a5,1524 # 80024c08 <log>
    8000661c:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006620:	00000097          	auipc	ra,0x0
    80006624:	c46080e7          	jalr	-954(ra) # 80006266 <write_head>
  }
}
    80006628:	0001                	nop
    8000662a:	60a2                	ld	ra,8(sp)
    8000662c:	6402                	ld	s0,0(sp)
    8000662e:	0141                	addi	sp,sp,16
    80006630:	8082                	ret

0000000080006632 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006632:	7179                	addi	sp,sp,-48
    80006634:	f406                	sd	ra,40(sp)
    80006636:	f022                	sd	s0,32(sp)
    80006638:	1800                	addi	s0,sp,48
    8000663a:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    8000663e:	0001e517          	auipc	a0,0x1e
    80006642:	5ca50513          	addi	a0,a0,1482 # 80024c08 <log>
    80006646:	ffffb097          	auipc	ra,0xffffb
    8000664a:	cf6080e7          	jalr	-778(ra) # 8000133c <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    8000664e:	0001e797          	auipc	a5,0x1e
    80006652:	5ba78793          	addi	a5,a5,1466 # 80024c08 <log>
    80006656:	57dc                	lw	a5,44(a5)
    80006658:	873e                	mv	a4,a5
    8000665a:	47f5                	li	a5,29
    8000665c:	02e7c063          	blt	a5,a4,8000667c <log_write+0x4a>
    80006660:	0001e797          	auipc	a5,0x1e
    80006664:	5a878793          	addi	a5,a5,1448 # 80024c08 <log>
    80006668:	57d8                	lw	a4,44(a5)
    8000666a:	0001e797          	auipc	a5,0x1e
    8000666e:	59e78793          	addi	a5,a5,1438 # 80024c08 <log>
    80006672:	4fdc                	lw	a5,28(a5)
    80006674:	37fd                	addiw	a5,a5,-1
    80006676:	2781                	sext.w	a5,a5
    80006678:	00f74a63          	blt	a4,a5,8000668c <log_write+0x5a>
    panic("too big a transaction");
    8000667c:	00006517          	auipc	a0,0x6
    80006680:	ef450513          	addi	a0,a0,-268 # 8000c570 <etext+0x570>
    80006684:	ffffa097          	auipc	ra,0xffffa
    80006688:	608080e7          	jalr	1544(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    8000668c:	0001e797          	auipc	a5,0x1e
    80006690:	57c78793          	addi	a5,a5,1404 # 80024c08 <log>
    80006694:	539c                	lw	a5,32(a5)
    80006696:	00f04a63          	bgtz	a5,800066aa <log_write+0x78>
    panic("log_write outside of trans");
    8000669a:	00006517          	auipc	a0,0x6
    8000669e:	eee50513          	addi	a0,a0,-274 # 8000c588 <etext+0x588>
    800066a2:	ffffa097          	auipc	ra,0xffffa
    800066a6:	5ea080e7          	jalr	1514(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    800066aa:	fe042623          	sw	zero,-20(s0)
    800066ae:	a03d                	j	800066dc <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    800066b0:	0001e717          	auipc	a4,0x1e
    800066b4:	55870713          	addi	a4,a4,1368 # 80024c08 <log>
    800066b8:	fec42783          	lw	a5,-20(s0)
    800066bc:	07a1                	addi	a5,a5,8
    800066be:	078a                	slli	a5,a5,0x2
    800066c0:	97ba                	add	a5,a5,a4
    800066c2:	4b9c                	lw	a5,16(a5)
    800066c4:	0007871b          	sext.w	a4,a5
    800066c8:	fd843783          	ld	a5,-40(s0)
    800066cc:	47dc                	lw	a5,12(a5)
    800066ce:	02f70263          	beq	a4,a5,800066f2 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    800066d2:	fec42783          	lw	a5,-20(s0)
    800066d6:	2785                	addiw	a5,a5,1
    800066d8:	fef42623          	sw	a5,-20(s0)
    800066dc:	0001e797          	auipc	a5,0x1e
    800066e0:	52c78793          	addi	a5,a5,1324 # 80024c08 <log>
    800066e4:	57d8                	lw	a4,44(a5)
    800066e6:	fec42783          	lw	a5,-20(s0)
    800066ea:	2781                	sext.w	a5,a5
    800066ec:	fce7c2e3          	blt	a5,a4,800066b0 <log_write+0x7e>
    800066f0:	a011                	j	800066f4 <log_write+0xc2>
      break;
    800066f2:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    800066f4:	fd843783          	ld	a5,-40(s0)
    800066f8:	47dc                	lw	a5,12(a5)
    800066fa:	0007871b          	sext.w	a4,a5
    800066fe:	0001e697          	auipc	a3,0x1e
    80006702:	50a68693          	addi	a3,a3,1290 # 80024c08 <log>
    80006706:	fec42783          	lw	a5,-20(s0)
    8000670a:	07a1                	addi	a5,a5,8
    8000670c:	078a                	slli	a5,a5,0x2
    8000670e:	97b6                	add	a5,a5,a3
    80006710:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006712:	0001e797          	auipc	a5,0x1e
    80006716:	4f678793          	addi	a5,a5,1270 # 80024c08 <log>
    8000671a:	57d8                	lw	a4,44(a5)
    8000671c:	fec42783          	lw	a5,-20(s0)
    80006720:	2781                	sext.w	a5,a5
    80006722:	02e79563          	bne	a5,a4,8000674c <log_write+0x11a>
    bpin(b);
    80006726:	fd843503          	ld	a0,-40(s0)
    8000672a:	ffffe097          	auipc	ra,0xffffe
    8000672e:	344080e7          	jalr	836(ra) # 80004a6e <bpin>
    log.lh.n++;
    80006732:	0001e797          	auipc	a5,0x1e
    80006736:	4d678793          	addi	a5,a5,1238 # 80024c08 <log>
    8000673a:	57dc                	lw	a5,44(a5)
    8000673c:	2785                	addiw	a5,a5,1
    8000673e:	0007871b          	sext.w	a4,a5
    80006742:	0001e797          	auipc	a5,0x1e
    80006746:	4c678793          	addi	a5,a5,1222 # 80024c08 <log>
    8000674a:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    8000674c:	0001e517          	auipc	a0,0x1e
    80006750:	4bc50513          	addi	a0,a0,1212 # 80024c08 <log>
    80006754:	ffffb097          	auipc	ra,0xffffb
    80006758:	c4c080e7          	jalr	-948(ra) # 800013a0 <release>
}
    8000675c:	0001                	nop
    8000675e:	70a2                	ld	ra,40(sp)
    80006760:	7402                	ld	s0,32(sp)
    80006762:	6145                	addi	sp,sp,48
    80006764:	8082                	ret

0000000080006766 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80006766:	1101                	addi	sp,sp,-32
    80006768:	ec06                	sd	ra,24(sp)
    8000676a:	e822                	sd	s0,16(sp)
    8000676c:	1000                	addi	s0,sp,32
    8000676e:	fea43423          	sd	a0,-24(s0)
    80006772:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    80006776:	fe843783          	ld	a5,-24(s0)
    8000677a:	07a1                	addi	a5,a5,8
    8000677c:	00006597          	auipc	a1,0x6
    80006780:	e2c58593          	addi	a1,a1,-468 # 8000c5a8 <etext+0x5a8>
    80006784:	853e                	mv	a0,a5
    80006786:	ffffb097          	auipc	ra,0xffffb
    8000678a:	b86080e7          	jalr	-1146(ra) # 8000130c <initlock>
  lk->name = name;
    8000678e:	fe843783          	ld	a5,-24(s0)
    80006792:	fe043703          	ld	a4,-32(s0)
    80006796:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006798:	fe843783          	ld	a5,-24(s0)
    8000679c:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800067a0:	fe843783          	ld	a5,-24(s0)
    800067a4:	0207a423          	sw	zero,40(a5)
}
    800067a8:	0001                	nop
    800067aa:	60e2                	ld	ra,24(sp)
    800067ac:	6442                	ld	s0,16(sp)
    800067ae:	6105                	addi	sp,sp,32
    800067b0:	8082                	ret

00000000800067b2 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    800067b2:	1101                	addi	sp,sp,-32
    800067b4:	ec06                	sd	ra,24(sp)
    800067b6:	e822                	sd	s0,16(sp)
    800067b8:	1000                	addi	s0,sp,32
    800067ba:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800067be:	fe843783          	ld	a5,-24(s0)
    800067c2:	07a1                	addi	a5,a5,8
    800067c4:	853e                	mv	a0,a5
    800067c6:	ffffb097          	auipc	ra,0xffffb
    800067ca:	b76080e7          	jalr	-1162(ra) # 8000133c <acquire>
  while (lk->locked) {
    800067ce:	a819                	j	800067e4 <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    800067d0:	fe843783          	ld	a5,-24(s0)
    800067d4:	07a1                	addi	a5,a5,8
    800067d6:	85be                	mv	a1,a5
    800067d8:	fe843503          	ld	a0,-24(s0)
    800067dc:	ffffd097          	auipc	ra,0xffffd
    800067e0:	dfe080e7          	jalr	-514(ra) # 800035da <sleep>
  while (lk->locked) {
    800067e4:	fe843783          	ld	a5,-24(s0)
    800067e8:	439c                	lw	a5,0(a5)
    800067ea:	f3fd                	bnez	a5,800067d0 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    800067ec:	fe843783          	ld	a5,-24(s0)
    800067f0:	4705                	li	a4,1
    800067f2:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    800067f4:	ffffc097          	auipc	ra,0xffffc
    800067f8:	224080e7          	jalr	548(ra) # 80002a18 <myproc>
    800067fc:	87aa                	mv	a5,a0
    800067fe:	5b98                	lw	a4,48(a5)
    80006800:	fe843783          	ld	a5,-24(s0)
    80006804:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006806:	fe843783          	ld	a5,-24(s0)
    8000680a:	07a1                	addi	a5,a5,8
    8000680c:	853e                	mv	a0,a5
    8000680e:	ffffb097          	auipc	ra,0xffffb
    80006812:	b92080e7          	jalr	-1134(ra) # 800013a0 <release>
}
    80006816:	0001                	nop
    80006818:	60e2                	ld	ra,24(sp)
    8000681a:	6442                	ld	s0,16(sp)
    8000681c:	6105                	addi	sp,sp,32
    8000681e:	8082                	ret

0000000080006820 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006820:	1101                	addi	sp,sp,-32
    80006822:	ec06                	sd	ra,24(sp)
    80006824:	e822                	sd	s0,16(sp)
    80006826:	1000                	addi	s0,sp,32
    80006828:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    8000682c:	fe843783          	ld	a5,-24(s0)
    80006830:	07a1                	addi	a5,a5,8
    80006832:	853e                	mv	a0,a5
    80006834:	ffffb097          	auipc	ra,0xffffb
    80006838:	b08080e7          	jalr	-1272(ra) # 8000133c <acquire>
  lk->locked = 0;
    8000683c:	fe843783          	ld	a5,-24(s0)
    80006840:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006844:	fe843783          	ld	a5,-24(s0)
    80006848:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    8000684c:	fe843503          	ld	a0,-24(s0)
    80006850:	ffffd097          	auipc	ra,0xffffd
    80006854:	e06080e7          	jalr	-506(ra) # 80003656 <wakeup>
  release(&lk->lk);
    80006858:	fe843783          	ld	a5,-24(s0)
    8000685c:	07a1                	addi	a5,a5,8
    8000685e:	853e                	mv	a0,a5
    80006860:	ffffb097          	auipc	ra,0xffffb
    80006864:	b40080e7          	jalr	-1216(ra) # 800013a0 <release>
}
    80006868:	0001                	nop
    8000686a:	60e2                	ld	ra,24(sp)
    8000686c:	6442                	ld	s0,16(sp)
    8000686e:	6105                	addi	sp,sp,32
    80006870:	8082                	ret

0000000080006872 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006872:	7139                	addi	sp,sp,-64
    80006874:	fc06                	sd	ra,56(sp)
    80006876:	f822                	sd	s0,48(sp)
    80006878:	f426                	sd	s1,40(sp)
    8000687a:	0080                	addi	s0,sp,64
    8000687c:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006880:	fc843783          	ld	a5,-56(s0)
    80006884:	07a1                	addi	a5,a5,8
    80006886:	853e                	mv	a0,a5
    80006888:	ffffb097          	auipc	ra,0xffffb
    8000688c:	ab4080e7          	jalr	-1356(ra) # 8000133c <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006890:	fc843783          	ld	a5,-56(s0)
    80006894:	439c                	lw	a5,0(a5)
    80006896:	cf99                	beqz	a5,800068b4 <holdingsleep+0x42>
    80006898:	fc843783          	ld	a5,-56(s0)
    8000689c:	5784                	lw	s1,40(a5)
    8000689e:	ffffc097          	auipc	ra,0xffffc
    800068a2:	17a080e7          	jalr	378(ra) # 80002a18 <myproc>
    800068a6:	87aa                	mv	a5,a0
    800068a8:	5b9c                	lw	a5,48(a5)
    800068aa:	8726                	mv	a4,s1
    800068ac:	00f71463          	bne	a4,a5,800068b4 <holdingsleep+0x42>
    800068b0:	4785                	li	a5,1
    800068b2:	a011                	j	800068b6 <holdingsleep+0x44>
    800068b4:	4781                	li	a5,0
    800068b6:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    800068ba:	fc843783          	ld	a5,-56(s0)
    800068be:	07a1                	addi	a5,a5,8
    800068c0:	853e                	mv	a0,a5
    800068c2:	ffffb097          	auipc	ra,0xffffb
    800068c6:	ade080e7          	jalr	-1314(ra) # 800013a0 <release>
  return r;
    800068ca:	fdc42783          	lw	a5,-36(s0)
}
    800068ce:	853e                	mv	a0,a5
    800068d0:	70e2                	ld	ra,56(sp)
    800068d2:	7442                	ld	s0,48(sp)
    800068d4:	74a2                	ld	s1,40(sp)
    800068d6:	6121                	addi	sp,sp,64
    800068d8:	8082                	ret

00000000800068da <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    800068da:	1141                	addi	sp,sp,-16
    800068dc:	e406                	sd	ra,8(sp)
    800068de:	e022                	sd	s0,0(sp)
    800068e0:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    800068e2:	00006597          	auipc	a1,0x6
    800068e6:	cd658593          	addi	a1,a1,-810 # 8000c5b8 <etext+0x5b8>
    800068ea:	0001e517          	auipc	a0,0x1e
    800068ee:	46650513          	addi	a0,a0,1126 # 80024d50 <ftable>
    800068f2:	ffffb097          	auipc	ra,0xffffb
    800068f6:	a1a080e7          	jalr	-1510(ra) # 8000130c <initlock>
}
    800068fa:	0001                	nop
    800068fc:	60a2                	ld	ra,8(sp)
    800068fe:	6402                	ld	s0,0(sp)
    80006900:	0141                	addi	sp,sp,16
    80006902:	8082                	ret

0000000080006904 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006904:	1101                	addi	sp,sp,-32
    80006906:	ec06                	sd	ra,24(sp)
    80006908:	e822                	sd	s0,16(sp)
    8000690a:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    8000690c:	0001e517          	auipc	a0,0x1e
    80006910:	44450513          	addi	a0,a0,1092 # 80024d50 <ftable>
    80006914:	ffffb097          	auipc	ra,0xffffb
    80006918:	a28080e7          	jalr	-1496(ra) # 8000133c <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    8000691c:	0001e797          	auipc	a5,0x1e
    80006920:	44c78793          	addi	a5,a5,1100 # 80024d68 <ftable+0x18>
    80006924:	fef43423          	sd	a5,-24(s0)
    80006928:	a815                	j	8000695c <filealloc+0x58>
    if(f->ref == 0){
    8000692a:	fe843783          	ld	a5,-24(s0)
    8000692e:	43dc                	lw	a5,4(a5)
    80006930:	e385                	bnez	a5,80006950 <filealloc+0x4c>
      f->ref = 1;
    80006932:	fe843783          	ld	a5,-24(s0)
    80006936:	4705                	li	a4,1
    80006938:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    8000693a:	0001e517          	auipc	a0,0x1e
    8000693e:	41650513          	addi	a0,a0,1046 # 80024d50 <ftable>
    80006942:	ffffb097          	auipc	ra,0xffffb
    80006946:	a5e080e7          	jalr	-1442(ra) # 800013a0 <release>
      return f;
    8000694a:	fe843783          	ld	a5,-24(s0)
    8000694e:	a805                	j	8000697e <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006950:	fe843783          	ld	a5,-24(s0)
    80006954:	02878793          	addi	a5,a5,40
    80006958:	fef43423          	sd	a5,-24(s0)
    8000695c:	0001f797          	auipc	a5,0x1f
    80006960:	3ac78793          	addi	a5,a5,940 # 80025d08 <diskpagesallocated>
    80006964:	fe843703          	ld	a4,-24(s0)
    80006968:	fcf761e3          	bltu	a4,a5,8000692a <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    8000696c:	0001e517          	auipc	a0,0x1e
    80006970:	3e450513          	addi	a0,a0,996 # 80024d50 <ftable>
    80006974:	ffffb097          	auipc	ra,0xffffb
    80006978:	a2c080e7          	jalr	-1492(ra) # 800013a0 <release>
  return 0;
    8000697c:	4781                	li	a5,0
}
    8000697e:	853e                	mv	a0,a5
    80006980:	60e2                	ld	ra,24(sp)
    80006982:	6442                	ld	s0,16(sp)
    80006984:	6105                	addi	sp,sp,32
    80006986:	8082                	ret

0000000080006988 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006988:	1101                	addi	sp,sp,-32
    8000698a:	ec06                	sd	ra,24(sp)
    8000698c:	e822                	sd	s0,16(sp)
    8000698e:	1000                	addi	s0,sp,32
    80006990:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006994:	0001e517          	auipc	a0,0x1e
    80006998:	3bc50513          	addi	a0,a0,956 # 80024d50 <ftable>
    8000699c:	ffffb097          	auipc	ra,0xffffb
    800069a0:	9a0080e7          	jalr	-1632(ra) # 8000133c <acquire>
  if(f->ref < 1)
    800069a4:	fe843783          	ld	a5,-24(s0)
    800069a8:	43dc                	lw	a5,4(a5)
    800069aa:	00f04a63          	bgtz	a5,800069be <filedup+0x36>
    panic("filedup");
    800069ae:	00006517          	auipc	a0,0x6
    800069b2:	c1250513          	addi	a0,a0,-1006 # 8000c5c0 <etext+0x5c0>
    800069b6:	ffffa097          	auipc	ra,0xffffa
    800069ba:	2d6080e7          	jalr	726(ra) # 80000c8c <panic>
  f->ref++;
    800069be:	fe843783          	ld	a5,-24(s0)
    800069c2:	43dc                	lw	a5,4(a5)
    800069c4:	2785                	addiw	a5,a5,1
    800069c6:	0007871b          	sext.w	a4,a5
    800069ca:	fe843783          	ld	a5,-24(s0)
    800069ce:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    800069d0:	0001e517          	auipc	a0,0x1e
    800069d4:	38050513          	addi	a0,a0,896 # 80024d50 <ftable>
    800069d8:	ffffb097          	auipc	ra,0xffffb
    800069dc:	9c8080e7          	jalr	-1592(ra) # 800013a0 <release>
  return f;
    800069e0:	fe843783          	ld	a5,-24(s0)
}
    800069e4:	853e                	mv	a0,a5
    800069e6:	60e2                	ld	ra,24(sp)
    800069e8:	6442                	ld	s0,16(sp)
    800069ea:	6105                	addi	sp,sp,32
    800069ec:	8082                	ret

00000000800069ee <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    800069ee:	715d                	addi	sp,sp,-80
    800069f0:	e486                	sd	ra,72(sp)
    800069f2:	e0a2                	sd	s0,64(sp)
    800069f4:	0880                	addi	s0,sp,80
    800069f6:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    800069fa:	0001e517          	auipc	a0,0x1e
    800069fe:	35650513          	addi	a0,a0,854 # 80024d50 <ftable>
    80006a02:	ffffb097          	auipc	ra,0xffffb
    80006a06:	93a080e7          	jalr	-1734(ra) # 8000133c <acquire>
  if(f->ref < 1)
    80006a0a:	fb843783          	ld	a5,-72(s0)
    80006a0e:	43dc                	lw	a5,4(a5)
    80006a10:	00f04a63          	bgtz	a5,80006a24 <fileclose+0x36>
    panic("fileclose");
    80006a14:	00006517          	auipc	a0,0x6
    80006a18:	bb450513          	addi	a0,a0,-1100 # 8000c5c8 <etext+0x5c8>
    80006a1c:	ffffa097          	auipc	ra,0xffffa
    80006a20:	270080e7          	jalr	624(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006a24:	fb843783          	ld	a5,-72(s0)
    80006a28:	43dc                	lw	a5,4(a5)
    80006a2a:	37fd                	addiw	a5,a5,-1
    80006a2c:	0007871b          	sext.w	a4,a5
    80006a30:	fb843783          	ld	a5,-72(s0)
    80006a34:	c3d8                	sw	a4,4(a5)
    80006a36:	fb843783          	ld	a5,-72(s0)
    80006a3a:	43dc                	lw	a5,4(a5)
    80006a3c:	00f05b63          	blez	a5,80006a52 <fileclose+0x64>
    release(&ftable.lock);
    80006a40:	0001e517          	auipc	a0,0x1e
    80006a44:	31050513          	addi	a0,a0,784 # 80024d50 <ftable>
    80006a48:	ffffb097          	auipc	ra,0xffffb
    80006a4c:	958080e7          	jalr	-1704(ra) # 800013a0 <release>
    80006a50:	a879                	j	80006aee <fileclose+0x100>
    return;
  }
  ff = *f;
    80006a52:	fb843783          	ld	a5,-72(s0)
    80006a56:	638c                	ld	a1,0(a5)
    80006a58:	6790                	ld	a2,8(a5)
    80006a5a:	6b94                	ld	a3,16(a5)
    80006a5c:	6f98                	ld	a4,24(a5)
    80006a5e:	739c                	ld	a5,32(a5)
    80006a60:	fcb43423          	sd	a1,-56(s0)
    80006a64:	fcc43823          	sd	a2,-48(s0)
    80006a68:	fcd43c23          	sd	a3,-40(s0)
    80006a6c:	fee43023          	sd	a4,-32(s0)
    80006a70:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006a74:	fb843783          	ld	a5,-72(s0)
    80006a78:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006a7c:	fb843783          	ld	a5,-72(s0)
    80006a80:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006a84:	0001e517          	auipc	a0,0x1e
    80006a88:	2cc50513          	addi	a0,a0,716 # 80024d50 <ftable>
    80006a8c:	ffffb097          	auipc	ra,0xffffb
    80006a90:	914080e7          	jalr	-1772(ra) # 800013a0 <release>

  if(ff.type == FD_PIPE){
    80006a94:	fc842783          	lw	a5,-56(s0)
    80006a98:	873e                	mv	a4,a5
    80006a9a:	4785                	li	a5,1
    80006a9c:	00f71e63          	bne	a4,a5,80006ab8 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006aa0:	fd843783          	ld	a5,-40(s0)
    80006aa4:	fd144703          	lbu	a4,-47(s0)
    80006aa8:	2701                	sext.w	a4,a4
    80006aaa:	85ba                	mv	a1,a4
    80006aac:	853e                	mv	a0,a5
    80006aae:	00000097          	auipc	ra,0x0
    80006ab2:	5aa080e7          	jalr	1450(ra) # 80007058 <pipeclose>
    80006ab6:	a825                	j	80006aee <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006ab8:	fc842783          	lw	a5,-56(s0)
    80006abc:	873e                	mv	a4,a5
    80006abe:	4789                	li	a5,2
    80006ac0:	00f70863          	beq	a4,a5,80006ad0 <fileclose+0xe2>
    80006ac4:	fc842783          	lw	a5,-56(s0)
    80006ac8:	873e                	mv	a4,a5
    80006aca:	478d                	li	a5,3
    80006acc:	02f71163          	bne	a4,a5,80006aee <fileclose+0x100>
    begin_op();
    80006ad0:	00000097          	auipc	ra,0x0
    80006ad4:	884080e7          	jalr	-1916(ra) # 80006354 <begin_op>
    iput(ff.ip);
    80006ad8:	fe043783          	ld	a5,-32(s0)
    80006adc:	853e                	mv	a0,a5
    80006ade:	fffff097          	auipc	ra,0xfffff
    80006ae2:	97a080e7          	jalr	-1670(ra) # 80005458 <iput>
    end_op();
    80006ae6:	00000097          	auipc	ra,0x0
    80006aea:	930080e7          	jalr	-1744(ra) # 80006416 <end_op>
  }
}
    80006aee:	60a6                	ld	ra,72(sp)
    80006af0:	6406                	ld	s0,64(sp)
    80006af2:	6161                	addi	sp,sp,80
    80006af4:	8082                	ret

0000000080006af6 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006af6:	7139                	addi	sp,sp,-64
    80006af8:	fc06                	sd	ra,56(sp)
    80006afa:	f822                	sd	s0,48(sp)
    80006afc:	0080                	addi	s0,sp,64
    80006afe:	fca43423          	sd	a0,-56(s0)
    80006b02:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006b06:	ffffc097          	auipc	ra,0xffffc
    80006b0a:	f12080e7          	jalr	-238(ra) # 80002a18 <myproc>
    80006b0e:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006b12:	fc843783          	ld	a5,-56(s0)
    80006b16:	439c                	lw	a5,0(a5)
    80006b18:	873e                	mv	a4,a5
    80006b1a:	4789                	li	a5,2
    80006b1c:	00f70963          	beq	a4,a5,80006b2e <filestat+0x38>
    80006b20:	fc843783          	ld	a5,-56(s0)
    80006b24:	439c                	lw	a5,0(a5)
    80006b26:	873e                	mv	a4,a5
    80006b28:	478d                	li	a5,3
    80006b2a:	06f71263          	bne	a4,a5,80006b8e <filestat+0x98>
    ilock(f->ip);
    80006b2e:	fc843783          	ld	a5,-56(s0)
    80006b32:	6f9c                	ld	a5,24(a5)
    80006b34:	853e                	mv	a0,a5
    80006b36:	ffffe097          	auipc	ra,0xffffe
    80006b3a:	794080e7          	jalr	1940(ra) # 800052ca <ilock>
    stati(f->ip, &st);
    80006b3e:	fc843783          	ld	a5,-56(s0)
    80006b42:	6f9c                	ld	a5,24(a5)
    80006b44:	fd040713          	addi	a4,s0,-48
    80006b48:	85ba                	mv	a1,a4
    80006b4a:	853e                	mv	a0,a5
    80006b4c:	fffff097          	auipc	ra,0xfffff
    80006b50:	cd0080e7          	jalr	-816(ra) # 8000581c <stati>
    iunlock(f->ip);
    80006b54:	fc843783          	ld	a5,-56(s0)
    80006b58:	6f9c                	ld	a5,24(a5)
    80006b5a:	853e                	mv	a0,a5
    80006b5c:	fffff097          	auipc	ra,0xfffff
    80006b60:	8a2080e7          	jalr	-1886(ra) # 800053fe <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006b64:	fe843783          	ld	a5,-24(s0)
    80006b68:	6bbc                	ld	a5,80(a5)
    80006b6a:	fd040713          	addi	a4,s0,-48
    80006b6e:	46e1                	li	a3,24
    80006b70:	863a                	mv	a2,a4
    80006b72:	fc043583          	ld	a1,-64(s0)
    80006b76:	853e                	mv	a0,a5
    80006b78:	ffffc097          	auipc	ra,0xffffc
    80006b7c:	96a080e7          	jalr	-1686(ra) # 800024e2 <copyout>
    80006b80:	87aa                	mv	a5,a0
    80006b82:	0007d463          	bgez	a5,80006b8a <filestat+0x94>
      return -1;
    80006b86:	57fd                	li	a5,-1
    80006b88:	a021                	j	80006b90 <filestat+0x9a>
    return 0;
    80006b8a:	4781                	li	a5,0
    80006b8c:	a011                	j	80006b90 <filestat+0x9a>
  }
  return -1;
    80006b8e:	57fd                	li	a5,-1
}
    80006b90:	853e                	mv	a0,a5
    80006b92:	70e2                	ld	ra,56(sp)
    80006b94:	7442                	ld	s0,48(sp)
    80006b96:	6121                	addi	sp,sp,64
    80006b98:	8082                	ret

0000000080006b9a <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006b9a:	7139                	addi	sp,sp,-64
    80006b9c:	fc06                	sd	ra,56(sp)
    80006b9e:	f822                	sd	s0,48(sp)
    80006ba0:	0080                	addi	s0,sp,64
    80006ba2:	fca43c23          	sd	a0,-40(s0)
    80006ba6:	fcb43823          	sd	a1,-48(s0)
    80006baa:	87b2                	mv	a5,a2
    80006bac:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006bb0:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006bb4:	fd843783          	ld	a5,-40(s0)
    80006bb8:	0087c783          	lbu	a5,8(a5)
    80006bbc:	e399                	bnez	a5,80006bc2 <fileread+0x28>
    return -1;
    80006bbe:	57fd                	li	a5,-1
    80006bc0:	aa1d                	j	80006cf6 <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006bc2:	fd843783          	ld	a5,-40(s0)
    80006bc6:	439c                	lw	a5,0(a5)
    80006bc8:	873e                	mv	a4,a5
    80006bca:	4785                	li	a5,1
    80006bcc:	02f71363          	bne	a4,a5,80006bf2 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006bd0:	fd843783          	ld	a5,-40(s0)
    80006bd4:	6b9c                	ld	a5,16(a5)
    80006bd6:	fcc42703          	lw	a4,-52(s0)
    80006bda:	863a                	mv	a2,a4
    80006bdc:	fd043583          	ld	a1,-48(s0)
    80006be0:	853e                	mv	a0,a5
    80006be2:	00000097          	auipc	ra,0x0
    80006be6:	670080e7          	jalr	1648(ra) # 80007252 <piperead>
    80006bea:	87aa                	mv	a5,a0
    80006bec:	fef42623          	sw	a5,-20(s0)
    80006bf0:	a209                	j	80006cf2 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006bf2:	fd843783          	ld	a5,-40(s0)
    80006bf6:	439c                	lw	a5,0(a5)
    80006bf8:	873e                	mv	a4,a5
    80006bfa:	478d                	li	a5,3
    80006bfc:	06f71863          	bne	a4,a5,80006c6c <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006c00:	fd843783          	ld	a5,-40(s0)
    80006c04:	02479783          	lh	a5,36(a5)
    80006c08:	2781                	sext.w	a5,a5
    80006c0a:	0207c863          	bltz	a5,80006c3a <fileread+0xa0>
    80006c0e:	fd843783          	ld	a5,-40(s0)
    80006c12:	02479783          	lh	a5,36(a5)
    80006c16:	0007871b          	sext.w	a4,a5
    80006c1a:	47a5                	li	a5,9
    80006c1c:	00e7cf63          	blt	a5,a4,80006c3a <fileread+0xa0>
    80006c20:	fd843783          	ld	a5,-40(s0)
    80006c24:	02479783          	lh	a5,36(a5)
    80006c28:	2781                	sext.w	a5,a5
    80006c2a:	0001e717          	auipc	a4,0x1e
    80006c2e:	08670713          	addi	a4,a4,134 # 80024cb0 <devsw>
    80006c32:	0792                	slli	a5,a5,0x4
    80006c34:	97ba                	add	a5,a5,a4
    80006c36:	639c                	ld	a5,0(a5)
    80006c38:	e399                	bnez	a5,80006c3e <fileread+0xa4>
      return -1;
    80006c3a:	57fd                	li	a5,-1
    80006c3c:	a86d                	j	80006cf6 <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006c3e:	fd843783          	ld	a5,-40(s0)
    80006c42:	02479783          	lh	a5,36(a5)
    80006c46:	2781                	sext.w	a5,a5
    80006c48:	0001e717          	auipc	a4,0x1e
    80006c4c:	06870713          	addi	a4,a4,104 # 80024cb0 <devsw>
    80006c50:	0792                	slli	a5,a5,0x4
    80006c52:	97ba                	add	a5,a5,a4
    80006c54:	6398                	ld	a4,0(a5)
    80006c56:	fcc42783          	lw	a5,-52(s0)
    80006c5a:	863e                	mv	a2,a5
    80006c5c:	fd043583          	ld	a1,-48(s0)
    80006c60:	4505                	li	a0,1
    80006c62:	9702                	jalr	a4
    80006c64:	87aa                	mv	a5,a0
    80006c66:	fef42623          	sw	a5,-20(s0)
    80006c6a:	a061                	j	80006cf2 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006c6c:	fd843783          	ld	a5,-40(s0)
    80006c70:	439c                	lw	a5,0(a5)
    80006c72:	873e                	mv	a4,a5
    80006c74:	4789                	li	a5,2
    80006c76:	06f71663          	bne	a4,a5,80006ce2 <fileread+0x148>
    ilock(f->ip);
    80006c7a:	fd843783          	ld	a5,-40(s0)
    80006c7e:	6f9c                	ld	a5,24(a5)
    80006c80:	853e                	mv	a0,a5
    80006c82:	ffffe097          	auipc	ra,0xffffe
    80006c86:	648080e7          	jalr	1608(ra) # 800052ca <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006c8a:	fd843783          	ld	a5,-40(s0)
    80006c8e:	6f88                	ld	a0,24(a5)
    80006c90:	fd843783          	ld	a5,-40(s0)
    80006c94:	539c                	lw	a5,32(a5)
    80006c96:	fcc42703          	lw	a4,-52(s0)
    80006c9a:	86be                	mv	a3,a5
    80006c9c:	fd043603          	ld	a2,-48(s0)
    80006ca0:	4585                	li	a1,1
    80006ca2:	fffff097          	auipc	ra,0xfffff
    80006ca6:	bde080e7          	jalr	-1058(ra) # 80005880 <readi>
    80006caa:	87aa                	mv	a5,a0
    80006cac:	fef42623          	sw	a5,-20(s0)
    80006cb0:	fec42783          	lw	a5,-20(s0)
    80006cb4:	2781                	sext.w	a5,a5
    80006cb6:	00f05d63          	blez	a5,80006cd0 <fileread+0x136>
      f->off += r;
    80006cba:	fd843783          	ld	a5,-40(s0)
    80006cbe:	5398                	lw	a4,32(a5)
    80006cc0:	fec42783          	lw	a5,-20(s0)
    80006cc4:	9fb9                	addw	a5,a5,a4
    80006cc6:	0007871b          	sext.w	a4,a5
    80006cca:	fd843783          	ld	a5,-40(s0)
    80006cce:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006cd0:	fd843783          	ld	a5,-40(s0)
    80006cd4:	6f9c                	ld	a5,24(a5)
    80006cd6:	853e                	mv	a0,a5
    80006cd8:	ffffe097          	auipc	ra,0xffffe
    80006cdc:	726080e7          	jalr	1830(ra) # 800053fe <iunlock>
    80006ce0:	a809                	j	80006cf2 <fileread+0x158>
  } else {
    panic("fileread");
    80006ce2:	00006517          	auipc	a0,0x6
    80006ce6:	8f650513          	addi	a0,a0,-1802 # 8000c5d8 <etext+0x5d8>
    80006cea:	ffffa097          	auipc	ra,0xffffa
    80006cee:	fa2080e7          	jalr	-94(ra) # 80000c8c <panic>
  }

  return r;
    80006cf2:	fec42783          	lw	a5,-20(s0)
}
    80006cf6:	853e                	mv	a0,a5
    80006cf8:	70e2                	ld	ra,56(sp)
    80006cfa:	7442                	ld	s0,48(sp)
    80006cfc:	6121                	addi	sp,sp,64
    80006cfe:	8082                	ret

0000000080006d00 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006d00:	715d                	addi	sp,sp,-80
    80006d02:	e486                	sd	ra,72(sp)
    80006d04:	e0a2                	sd	s0,64(sp)
    80006d06:	0880                	addi	s0,sp,80
    80006d08:	fca43423          	sd	a0,-56(s0)
    80006d0c:	fcb43023          	sd	a1,-64(s0)
    80006d10:	87b2                	mv	a5,a2
    80006d12:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006d16:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006d1a:	fc843783          	ld	a5,-56(s0)
    80006d1e:	0097c783          	lbu	a5,9(a5)
    80006d22:	e399                	bnez	a5,80006d28 <filewrite+0x28>
    return -1;
    80006d24:	57fd                	li	a5,-1
    80006d26:	aad1                	j	80006efa <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006d28:	fc843783          	ld	a5,-56(s0)
    80006d2c:	439c                	lw	a5,0(a5)
    80006d2e:	873e                	mv	a4,a5
    80006d30:	4785                	li	a5,1
    80006d32:	02f71363          	bne	a4,a5,80006d58 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006d36:	fc843783          	ld	a5,-56(s0)
    80006d3a:	6b9c                	ld	a5,16(a5)
    80006d3c:	fbc42703          	lw	a4,-68(s0)
    80006d40:	863a                	mv	a2,a4
    80006d42:	fc043583          	ld	a1,-64(s0)
    80006d46:	853e                	mv	a0,a5
    80006d48:	00000097          	auipc	ra,0x0
    80006d4c:	3b8080e7          	jalr	952(ra) # 80007100 <pipewrite>
    80006d50:	87aa                	mv	a5,a0
    80006d52:	fef42623          	sw	a5,-20(s0)
    80006d56:	a245                	j	80006ef6 <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006d58:	fc843783          	ld	a5,-56(s0)
    80006d5c:	439c                	lw	a5,0(a5)
    80006d5e:	873e                	mv	a4,a5
    80006d60:	478d                	li	a5,3
    80006d62:	06f71863          	bne	a4,a5,80006dd2 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006d66:	fc843783          	ld	a5,-56(s0)
    80006d6a:	02479783          	lh	a5,36(a5)
    80006d6e:	2781                	sext.w	a5,a5
    80006d70:	0207c863          	bltz	a5,80006da0 <filewrite+0xa0>
    80006d74:	fc843783          	ld	a5,-56(s0)
    80006d78:	02479783          	lh	a5,36(a5)
    80006d7c:	0007871b          	sext.w	a4,a5
    80006d80:	47a5                	li	a5,9
    80006d82:	00e7cf63          	blt	a5,a4,80006da0 <filewrite+0xa0>
    80006d86:	fc843783          	ld	a5,-56(s0)
    80006d8a:	02479783          	lh	a5,36(a5)
    80006d8e:	2781                	sext.w	a5,a5
    80006d90:	0001e717          	auipc	a4,0x1e
    80006d94:	f2070713          	addi	a4,a4,-224 # 80024cb0 <devsw>
    80006d98:	0792                	slli	a5,a5,0x4
    80006d9a:	97ba                	add	a5,a5,a4
    80006d9c:	679c                	ld	a5,8(a5)
    80006d9e:	e399                	bnez	a5,80006da4 <filewrite+0xa4>
      return -1;
    80006da0:	57fd                	li	a5,-1
    80006da2:	aaa1                	j	80006efa <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006da4:	fc843783          	ld	a5,-56(s0)
    80006da8:	02479783          	lh	a5,36(a5)
    80006dac:	2781                	sext.w	a5,a5
    80006dae:	0001e717          	auipc	a4,0x1e
    80006db2:	f0270713          	addi	a4,a4,-254 # 80024cb0 <devsw>
    80006db6:	0792                	slli	a5,a5,0x4
    80006db8:	97ba                	add	a5,a5,a4
    80006dba:	6798                	ld	a4,8(a5)
    80006dbc:	fbc42783          	lw	a5,-68(s0)
    80006dc0:	863e                	mv	a2,a5
    80006dc2:	fc043583          	ld	a1,-64(s0)
    80006dc6:	4505                	li	a0,1
    80006dc8:	9702                	jalr	a4
    80006dca:	87aa                	mv	a5,a0
    80006dcc:	fef42623          	sw	a5,-20(s0)
    80006dd0:	a21d                	j	80006ef6 <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006dd2:	fc843783          	ld	a5,-56(s0)
    80006dd6:	439c                	lw	a5,0(a5)
    80006dd8:	873e                	mv	a4,a5
    80006dda:	4789                	li	a5,2
    80006ddc:	10f71563          	bne	a4,a5,80006ee6 <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006de0:	6785                	lui	a5,0x1
    80006de2:	c007879b          	addiw	a5,a5,-1024
    80006de6:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006dea:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006dee:	a0d9                	j	80006eb4 <filewrite+0x1b4>
      int n1 = n - i;
    80006df0:	fbc42703          	lw	a4,-68(s0)
    80006df4:	fe842783          	lw	a5,-24(s0)
    80006df8:	40f707bb          	subw	a5,a4,a5
    80006dfc:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006e00:	fe442703          	lw	a4,-28(s0)
    80006e04:	fe042783          	lw	a5,-32(s0)
    80006e08:	2701                	sext.w	a4,a4
    80006e0a:	2781                	sext.w	a5,a5
    80006e0c:	00e7d663          	bge	a5,a4,80006e18 <filewrite+0x118>
        n1 = max;
    80006e10:	fe042783          	lw	a5,-32(s0)
    80006e14:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006e18:	fffff097          	auipc	ra,0xfffff
    80006e1c:	53c080e7          	jalr	1340(ra) # 80006354 <begin_op>
      ilock(f->ip);
    80006e20:	fc843783          	ld	a5,-56(s0)
    80006e24:	6f9c                	ld	a5,24(a5)
    80006e26:	853e                	mv	a0,a5
    80006e28:	ffffe097          	auipc	ra,0xffffe
    80006e2c:	4a2080e7          	jalr	1186(ra) # 800052ca <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006e30:	fc843783          	ld	a5,-56(s0)
    80006e34:	6f88                	ld	a0,24(a5)
    80006e36:	fe842703          	lw	a4,-24(s0)
    80006e3a:	fc043783          	ld	a5,-64(s0)
    80006e3e:	00f70633          	add	a2,a4,a5
    80006e42:	fc843783          	ld	a5,-56(s0)
    80006e46:	539c                	lw	a5,32(a5)
    80006e48:	fe442703          	lw	a4,-28(s0)
    80006e4c:	86be                	mv	a3,a5
    80006e4e:	4585                	li	a1,1
    80006e50:	fffff097          	auipc	ra,0xfffff
    80006e54:	bc8080e7          	jalr	-1080(ra) # 80005a18 <writei>
    80006e58:	87aa                	mv	a5,a0
    80006e5a:	fcf42e23          	sw	a5,-36(s0)
    80006e5e:	fdc42783          	lw	a5,-36(s0)
    80006e62:	2781                	sext.w	a5,a5
    80006e64:	00f05d63          	blez	a5,80006e7e <filewrite+0x17e>
        f->off += r;
    80006e68:	fc843783          	ld	a5,-56(s0)
    80006e6c:	5398                	lw	a4,32(a5)
    80006e6e:	fdc42783          	lw	a5,-36(s0)
    80006e72:	9fb9                	addw	a5,a5,a4
    80006e74:	0007871b          	sext.w	a4,a5
    80006e78:	fc843783          	ld	a5,-56(s0)
    80006e7c:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006e7e:	fc843783          	ld	a5,-56(s0)
    80006e82:	6f9c                	ld	a5,24(a5)
    80006e84:	853e                	mv	a0,a5
    80006e86:	ffffe097          	auipc	ra,0xffffe
    80006e8a:	578080e7          	jalr	1400(ra) # 800053fe <iunlock>
      end_op();
    80006e8e:	fffff097          	auipc	ra,0xfffff
    80006e92:	588080e7          	jalr	1416(ra) # 80006416 <end_op>

      if(r != n1){
    80006e96:	fdc42703          	lw	a4,-36(s0)
    80006e9a:	fe442783          	lw	a5,-28(s0)
    80006e9e:	2701                	sext.w	a4,a4
    80006ea0:	2781                	sext.w	a5,a5
    80006ea2:	02f71263          	bne	a4,a5,80006ec6 <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006ea6:	fe842703          	lw	a4,-24(s0)
    80006eaa:	fdc42783          	lw	a5,-36(s0)
    80006eae:	9fb9                	addw	a5,a5,a4
    80006eb0:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006eb4:	fe842703          	lw	a4,-24(s0)
    80006eb8:	fbc42783          	lw	a5,-68(s0)
    80006ebc:	2701                	sext.w	a4,a4
    80006ebe:	2781                	sext.w	a5,a5
    80006ec0:	f2f748e3          	blt	a4,a5,80006df0 <filewrite+0xf0>
    80006ec4:	a011                	j	80006ec8 <filewrite+0x1c8>
        break;
    80006ec6:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006ec8:	fe842703          	lw	a4,-24(s0)
    80006ecc:	fbc42783          	lw	a5,-68(s0)
    80006ed0:	2701                	sext.w	a4,a4
    80006ed2:	2781                	sext.w	a5,a5
    80006ed4:	00f71563          	bne	a4,a5,80006ede <filewrite+0x1de>
    80006ed8:	fbc42783          	lw	a5,-68(s0)
    80006edc:	a011                	j	80006ee0 <filewrite+0x1e0>
    80006ede:	57fd                	li	a5,-1
    80006ee0:	fef42623          	sw	a5,-20(s0)
    80006ee4:	a809                	j	80006ef6 <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006ee6:	00005517          	auipc	a0,0x5
    80006eea:	70250513          	addi	a0,a0,1794 # 8000c5e8 <etext+0x5e8>
    80006eee:	ffffa097          	auipc	ra,0xffffa
    80006ef2:	d9e080e7          	jalr	-610(ra) # 80000c8c <panic>
  }

  return ret;
    80006ef6:	fec42783          	lw	a5,-20(s0)
}
    80006efa:	853e                	mv	a0,a5
    80006efc:	60a6                	ld	ra,72(sp)
    80006efe:	6406                	ld	s0,64(sp)
    80006f00:	6161                	addi	sp,sp,80
    80006f02:	8082                	ret

0000000080006f04 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006f04:	7179                	addi	sp,sp,-48
    80006f06:	f406                	sd	ra,40(sp)
    80006f08:	f022                	sd	s0,32(sp)
    80006f0a:	1800                	addi	s0,sp,48
    80006f0c:	fca43c23          	sd	a0,-40(s0)
    80006f10:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006f14:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006f18:	fd043783          	ld	a5,-48(s0)
    80006f1c:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006f20:	fd043783          	ld	a5,-48(s0)
    80006f24:	6398                	ld	a4,0(a5)
    80006f26:	fd843783          	ld	a5,-40(s0)
    80006f2a:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006f2c:	00000097          	auipc	ra,0x0
    80006f30:	9d8080e7          	jalr	-1576(ra) # 80006904 <filealloc>
    80006f34:	872a                	mv	a4,a0
    80006f36:	fd843783          	ld	a5,-40(s0)
    80006f3a:	e398                	sd	a4,0(a5)
    80006f3c:	fd843783          	ld	a5,-40(s0)
    80006f40:	639c                	ld	a5,0(a5)
    80006f42:	c3e9                	beqz	a5,80007004 <pipealloc+0x100>
    80006f44:	00000097          	auipc	ra,0x0
    80006f48:	9c0080e7          	jalr	-1600(ra) # 80006904 <filealloc>
    80006f4c:	872a                	mv	a4,a0
    80006f4e:	fd043783          	ld	a5,-48(s0)
    80006f52:	e398                	sd	a4,0(a5)
    80006f54:	fd043783          	ld	a5,-48(s0)
    80006f58:	639c                	ld	a5,0(a5)
    80006f5a:	c7cd                	beqz	a5,80007004 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006f5c:	ffffa097          	auipc	ra,0xffffa
    80006f60:	27a080e7          	jalr	634(ra) # 800011d6 <kalloc>
    80006f64:	fea43423          	sd	a0,-24(s0)
    80006f68:	fe843783          	ld	a5,-24(s0)
    80006f6c:	cfd1                	beqz	a5,80007008 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006f6e:	fe843783          	ld	a5,-24(s0)
    80006f72:	4705                	li	a4,1
    80006f74:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006f78:	fe843783          	ld	a5,-24(s0)
    80006f7c:	4705                	li	a4,1
    80006f7e:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006f82:	fe843783          	ld	a5,-24(s0)
    80006f86:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006f8a:	fe843783          	ld	a5,-24(s0)
    80006f8e:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006f92:	fe843783          	ld	a5,-24(s0)
    80006f96:	00005597          	auipc	a1,0x5
    80006f9a:	66258593          	addi	a1,a1,1634 # 8000c5f8 <etext+0x5f8>
    80006f9e:	853e                	mv	a0,a5
    80006fa0:	ffffa097          	auipc	ra,0xffffa
    80006fa4:	36c080e7          	jalr	876(ra) # 8000130c <initlock>
  (*f0)->type = FD_PIPE;
    80006fa8:	fd843783          	ld	a5,-40(s0)
    80006fac:	639c                	ld	a5,0(a5)
    80006fae:	4705                	li	a4,1
    80006fb0:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006fb2:	fd843783          	ld	a5,-40(s0)
    80006fb6:	639c                	ld	a5,0(a5)
    80006fb8:	4705                	li	a4,1
    80006fba:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006fbe:	fd843783          	ld	a5,-40(s0)
    80006fc2:	639c                	ld	a5,0(a5)
    80006fc4:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006fc8:	fd843783          	ld	a5,-40(s0)
    80006fcc:	639c                	ld	a5,0(a5)
    80006fce:	fe843703          	ld	a4,-24(s0)
    80006fd2:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006fd4:	fd043783          	ld	a5,-48(s0)
    80006fd8:	639c                	ld	a5,0(a5)
    80006fda:	4705                	li	a4,1
    80006fdc:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006fde:	fd043783          	ld	a5,-48(s0)
    80006fe2:	639c                	ld	a5,0(a5)
    80006fe4:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006fe8:	fd043783          	ld	a5,-48(s0)
    80006fec:	639c                	ld	a5,0(a5)
    80006fee:	4705                	li	a4,1
    80006ff0:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006ff4:	fd043783          	ld	a5,-48(s0)
    80006ff8:	639c                	ld	a5,0(a5)
    80006ffa:	fe843703          	ld	a4,-24(s0)
    80006ffe:	eb98                	sd	a4,16(a5)
  return 0;
    80007000:	4781                	li	a5,0
    80007002:	a0b1                	j	8000704e <pipealloc+0x14a>
    goto bad;
    80007004:	0001                	nop
    80007006:	a011                	j	8000700a <pipealloc+0x106>
    goto bad;
    80007008:	0001                	nop

 bad:
  if(pi)
    8000700a:	fe843783          	ld	a5,-24(s0)
    8000700e:	c799                	beqz	a5,8000701c <pipealloc+0x118>
    kfree((char*)pi);
    80007010:	fe843503          	ld	a0,-24(s0)
    80007014:	ffffa097          	auipc	ra,0xffffa
    80007018:	11c080e7          	jalr	284(ra) # 80001130 <kfree>
  if(*f0)
    8000701c:	fd843783          	ld	a5,-40(s0)
    80007020:	639c                	ld	a5,0(a5)
    80007022:	cb89                	beqz	a5,80007034 <pipealloc+0x130>
    fileclose(*f0);
    80007024:	fd843783          	ld	a5,-40(s0)
    80007028:	639c                	ld	a5,0(a5)
    8000702a:	853e                	mv	a0,a5
    8000702c:	00000097          	auipc	ra,0x0
    80007030:	9c2080e7          	jalr	-1598(ra) # 800069ee <fileclose>
  if(*f1)
    80007034:	fd043783          	ld	a5,-48(s0)
    80007038:	639c                	ld	a5,0(a5)
    8000703a:	cb89                	beqz	a5,8000704c <pipealloc+0x148>
    fileclose(*f1);
    8000703c:	fd043783          	ld	a5,-48(s0)
    80007040:	639c                	ld	a5,0(a5)
    80007042:	853e                	mv	a0,a5
    80007044:	00000097          	auipc	ra,0x0
    80007048:	9aa080e7          	jalr	-1622(ra) # 800069ee <fileclose>
  return -1;
    8000704c:	57fd                	li	a5,-1
}
    8000704e:	853e                	mv	a0,a5
    80007050:	70a2                	ld	ra,40(sp)
    80007052:	7402                	ld	s0,32(sp)
    80007054:	6145                	addi	sp,sp,48
    80007056:	8082                	ret

0000000080007058 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80007058:	1101                	addi	sp,sp,-32
    8000705a:	ec06                	sd	ra,24(sp)
    8000705c:	e822                	sd	s0,16(sp)
    8000705e:	1000                	addi	s0,sp,32
    80007060:	fea43423          	sd	a0,-24(s0)
    80007064:	87ae                	mv	a5,a1
    80007066:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    8000706a:	fe843783          	ld	a5,-24(s0)
    8000706e:	853e                	mv	a0,a5
    80007070:	ffffa097          	auipc	ra,0xffffa
    80007074:	2cc080e7          	jalr	716(ra) # 8000133c <acquire>
  if(writable){
    80007078:	fe442783          	lw	a5,-28(s0)
    8000707c:	2781                	sext.w	a5,a5
    8000707e:	cf99                	beqz	a5,8000709c <pipeclose+0x44>
    pi->writeopen = 0;
    80007080:	fe843783          	ld	a5,-24(s0)
    80007084:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80007088:	fe843783          	ld	a5,-24(s0)
    8000708c:	21878793          	addi	a5,a5,536
    80007090:	853e                	mv	a0,a5
    80007092:	ffffc097          	auipc	ra,0xffffc
    80007096:	5c4080e7          	jalr	1476(ra) # 80003656 <wakeup>
    8000709a:	a831                	j	800070b6 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    8000709c:	fe843783          	ld	a5,-24(s0)
    800070a0:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    800070a4:	fe843783          	ld	a5,-24(s0)
    800070a8:	21c78793          	addi	a5,a5,540
    800070ac:	853e                	mv	a0,a5
    800070ae:	ffffc097          	auipc	ra,0xffffc
    800070b2:	5a8080e7          	jalr	1448(ra) # 80003656 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    800070b6:	fe843783          	ld	a5,-24(s0)
    800070ba:	2207a783          	lw	a5,544(a5)
    800070be:	e785                	bnez	a5,800070e6 <pipeclose+0x8e>
    800070c0:	fe843783          	ld	a5,-24(s0)
    800070c4:	2247a783          	lw	a5,548(a5)
    800070c8:	ef99                	bnez	a5,800070e6 <pipeclose+0x8e>
    release(&pi->lock);
    800070ca:	fe843783          	ld	a5,-24(s0)
    800070ce:	853e                	mv	a0,a5
    800070d0:	ffffa097          	auipc	ra,0xffffa
    800070d4:	2d0080e7          	jalr	720(ra) # 800013a0 <release>
    kfree((char*)pi);
    800070d8:	fe843503          	ld	a0,-24(s0)
    800070dc:	ffffa097          	auipc	ra,0xffffa
    800070e0:	054080e7          	jalr	84(ra) # 80001130 <kfree>
    800070e4:	a809                	j	800070f6 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    800070e6:	fe843783          	ld	a5,-24(s0)
    800070ea:	853e                	mv	a0,a5
    800070ec:	ffffa097          	auipc	ra,0xffffa
    800070f0:	2b4080e7          	jalr	692(ra) # 800013a0 <release>
}
    800070f4:	0001                	nop
    800070f6:	0001                	nop
    800070f8:	60e2                	ld	ra,24(sp)
    800070fa:	6442                	ld	s0,16(sp)
    800070fc:	6105                	addi	sp,sp,32
    800070fe:	8082                	ret

0000000080007100 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80007100:	715d                	addi	sp,sp,-80
    80007102:	e486                	sd	ra,72(sp)
    80007104:	e0a2                	sd	s0,64(sp)
    80007106:	0880                	addi	s0,sp,80
    80007108:	fca43423          	sd	a0,-56(s0)
    8000710c:	fcb43023          	sd	a1,-64(s0)
    80007110:	87b2                	mv	a5,a2
    80007112:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80007116:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    8000711a:	ffffc097          	auipc	ra,0xffffc
    8000711e:	8fe080e7          	jalr	-1794(ra) # 80002a18 <myproc>
    80007122:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80007126:	fc843783          	ld	a5,-56(s0)
    8000712a:	853e                	mv	a0,a5
    8000712c:	ffffa097          	auipc	ra,0xffffa
    80007130:	210080e7          	jalr	528(ra) # 8000133c <acquire>
  while(i < n){
    80007134:	a8f1                	j	80007210 <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    80007136:	fc843783          	ld	a5,-56(s0)
    8000713a:	2207a783          	lw	a5,544(a5)
    8000713e:	cb89                	beqz	a5,80007150 <pipewrite+0x50>
    80007140:	fe043503          	ld	a0,-32(s0)
    80007144:	ffffc097          	auipc	ra,0xffffc
    80007148:	6a4080e7          	jalr	1700(ra) # 800037e8 <killed>
    8000714c:	87aa                	mv	a5,a0
    8000714e:	cb91                	beqz	a5,80007162 <pipewrite+0x62>
      release(&pi->lock);
    80007150:	fc843783          	ld	a5,-56(s0)
    80007154:	853e                	mv	a0,a5
    80007156:	ffffa097          	auipc	ra,0xffffa
    8000715a:	24a080e7          	jalr	586(ra) # 800013a0 <release>
      return -1;
    8000715e:	57fd                	li	a5,-1
    80007160:	a0e5                	j	80007248 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80007162:	fc843783          	ld	a5,-56(s0)
    80007166:	21c7a703          	lw	a4,540(a5)
    8000716a:	fc843783          	ld	a5,-56(s0)
    8000716e:	2187a783          	lw	a5,536(a5)
    80007172:	2007879b          	addiw	a5,a5,512
    80007176:	2781                	sext.w	a5,a5
    80007178:	02f71863          	bne	a4,a5,800071a8 <pipewrite+0xa8>
      wakeup(&pi->nread);
    8000717c:	fc843783          	ld	a5,-56(s0)
    80007180:	21878793          	addi	a5,a5,536
    80007184:	853e                	mv	a0,a5
    80007186:	ffffc097          	auipc	ra,0xffffc
    8000718a:	4d0080e7          	jalr	1232(ra) # 80003656 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    8000718e:	fc843783          	ld	a5,-56(s0)
    80007192:	21c78793          	addi	a5,a5,540
    80007196:	fc843703          	ld	a4,-56(s0)
    8000719a:	85ba                	mv	a1,a4
    8000719c:	853e                	mv	a0,a5
    8000719e:	ffffc097          	auipc	ra,0xffffc
    800071a2:	43c080e7          	jalr	1084(ra) # 800035da <sleep>
    800071a6:	a0ad                	j	80007210 <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800071a8:	fe043783          	ld	a5,-32(s0)
    800071ac:	6ba8                	ld	a0,80(a5)
    800071ae:	fec42703          	lw	a4,-20(s0)
    800071b2:	fc043783          	ld	a5,-64(s0)
    800071b6:	973e                	add	a4,a4,a5
    800071b8:	fdf40793          	addi	a5,s0,-33
    800071bc:	4685                	li	a3,1
    800071be:	863a                	mv	a2,a4
    800071c0:	85be                	mv	a1,a5
    800071c2:	ffffb097          	auipc	ra,0xffffb
    800071c6:	3ee080e7          	jalr	1006(ra) # 800025b0 <copyin>
    800071ca:	87aa                	mv	a5,a0
    800071cc:	873e                	mv	a4,a5
    800071ce:	57fd                	li	a5,-1
    800071d0:	04f70963          	beq	a4,a5,80007222 <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    800071d4:	fc843783          	ld	a5,-56(s0)
    800071d8:	21c7a783          	lw	a5,540(a5)
    800071dc:	2781                	sext.w	a5,a5
    800071de:	0017871b          	addiw	a4,a5,1
    800071e2:	0007069b          	sext.w	a3,a4
    800071e6:	fc843703          	ld	a4,-56(s0)
    800071ea:	20d72e23          	sw	a3,540(a4)
    800071ee:	1ff7f793          	andi	a5,a5,511
    800071f2:	2781                	sext.w	a5,a5
    800071f4:	fdf44703          	lbu	a4,-33(s0)
    800071f8:	fc843683          	ld	a3,-56(s0)
    800071fc:	1782                	slli	a5,a5,0x20
    800071fe:	9381                	srli	a5,a5,0x20
    80007200:	97b6                	add	a5,a5,a3
    80007202:	00e78c23          	sb	a4,24(a5)
      i++;
    80007206:	fec42783          	lw	a5,-20(s0)
    8000720a:	2785                	addiw	a5,a5,1
    8000720c:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80007210:	fec42703          	lw	a4,-20(s0)
    80007214:	fbc42783          	lw	a5,-68(s0)
    80007218:	2701                	sext.w	a4,a4
    8000721a:	2781                	sext.w	a5,a5
    8000721c:	f0f74de3          	blt	a4,a5,80007136 <pipewrite+0x36>
    80007220:	a011                	j	80007224 <pipewrite+0x124>
        break;
    80007222:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007224:	fc843783          	ld	a5,-56(s0)
    80007228:	21878793          	addi	a5,a5,536
    8000722c:	853e                	mv	a0,a5
    8000722e:	ffffc097          	auipc	ra,0xffffc
    80007232:	428080e7          	jalr	1064(ra) # 80003656 <wakeup>
  release(&pi->lock);
    80007236:	fc843783          	ld	a5,-56(s0)
    8000723a:	853e                	mv	a0,a5
    8000723c:	ffffa097          	auipc	ra,0xffffa
    80007240:	164080e7          	jalr	356(ra) # 800013a0 <release>

  return i;
    80007244:	fec42783          	lw	a5,-20(s0)
}
    80007248:	853e                	mv	a0,a5
    8000724a:	60a6                	ld	ra,72(sp)
    8000724c:	6406                	ld	s0,64(sp)
    8000724e:	6161                	addi	sp,sp,80
    80007250:	8082                	ret

0000000080007252 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80007252:	715d                	addi	sp,sp,-80
    80007254:	e486                	sd	ra,72(sp)
    80007256:	e0a2                	sd	s0,64(sp)
    80007258:	0880                	addi	s0,sp,80
    8000725a:	fca43423          	sd	a0,-56(s0)
    8000725e:	fcb43023          	sd	a1,-64(s0)
    80007262:	87b2                	mv	a5,a2
    80007264:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007268:	ffffb097          	auipc	ra,0xffffb
    8000726c:	7b0080e7          	jalr	1968(ra) # 80002a18 <myproc>
    80007270:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80007274:	fc843783          	ld	a5,-56(s0)
    80007278:	853e                	mv	a0,a5
    8000727a:	ffffa097          	auipc	ra,0xffffa
    8000727e:	0c2080e7          	jalr	194(ra) # 8000133c <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    80007282:	a835                	j	800072be <piperead+0x6c>
    if(killed(pr)){
    80007284:	fe043503          	ld	a0,-32(s0)
    80007288:	ffffc097          	auipc	ra,0xffffc
    8000728c:	560080e7          	jalr	1376(ra) # 800037e8 <killed>
    80007290:	87aa                	mv	a5,a0
    80007292:	cb91                	beqz	a5,800072a6 <piperead+0x54>
      release(&pi->lock);
    80007294:	fc843783          	ld	a5,-56(s0)
    80007298:	853e                	mv	a0,a5
    8000729a:	ffffa097          	auipc	ra,0xffffa
    8000729e:	106080e7          	jalr	262(ra) # 800013a0 <release>
      return -1;
    800072a2:	57fd                	li	a5,-1
    800072a4:	a8dd                	j	8000739a <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    800072a6:	fc843783          	ld	a5,-56(s0)
    800072aa:	21878793          	addi	a5,a5,536
    800072ae:	fc843703          	ld	a4,-56(s0)
    800072b2:	85ba                	mv	a1,a4
    800072b4:	853e                	mv	a0,a5
    800072b6:	ffffc097          	auipc	ra,0xffffc
    800072ba:	324080e7          	jalr	804(ra) # 800035da <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800072be:	fc843783          	ld	a5,-56(s0)
    800072c2:	2187a703          	lw	a4,536(a5)
    800072c6:	fc843783          	ld	a5,-56(s0)
    800072ca:	21c7a783          	lw	a5,540(a5)
    800072ce:	00f71763          	bne	a4,a5,800072dc <piperead+0x8a>
    800072d2:	fc843783          	ld	a5,-56(s0)
    800072d6:	2247a783          	lw	a5,548(a5)
    800072da:	f7cd                	bnez	a5,80007284 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800072dc:	fe042623          	sw	zero,-20(s0)
    800072e0:	a8bd                	j	8000735e <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    800072e2:	fc843783          	ld	a5,-56(s0)
    800072e6:	2187a703          	lw	a4,536(a5)
    800072ea:	fc843783          	ld	a5,-56(s0)
    800072ee:	21c7a783          	lw	a5,540(a5)
    800072f2:	06f70f63          	beq	a4,a5,80007370 <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    800072f6:	fc843783          	ld	a5,-56(s0)
    800072fa:	2187a783          	lw	a5,536(a5)
    800072fe:	2781                	sext.w	a5,a5
    80007300:	0017871b          	addiw	a4,a5,1
    80007304:	0007069b          	sext.w	a3,a4
    80007308:	fc843703          	ld	a4,-56(s0)
    8000730c:	20d72c23          	sw	a3,536(a4)
    80007310:	1ff7f793          	andi	a5,a5,511
    80007314:	2781                	sext.w	a5,a5
    80007316:	fc843703          	ld	a4,-56(s0)
    8000731a:	1782                	slli	a5,a5,0x20
    8000731c:	9381                	srli	a5,a5,0x20
    8000731e:	97ba                	add	a5,a5,a4
    80007320:	0187c783          	lbu	a5,24(a5)
    80007324:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007328:	fe043783          	ld	a5,-32(s0)
    8000732c:	6ba8                	ld	a0,80(a5)
    8000732e:	fec42703          	lw	a4,-20(s0)
    80007332:	fc043783          	ld	a5,-64(s0)
    80007336:	97ba                	add	a5,a5,a4
    80007338:	fdf40713          	addi	a4,s0,-33
    8000733c:	4685                	li	a3,1
    8000733e:	863a                	mv	a2,a4
    80007340:	85be                	mv	a1,a5
    80007342:	ffffb097          	auipc	ra,0xffffb
    80007346:	1a0080e7          	jalr	416(ra) # 800024e2 <copyout>
    8000734a:	87aa                	mv	a5,a0
    8000734c:	873e                	mv	a4,a5
    8000734e:	57fd                	li	a5,-1
    80007350:	02f70263          	beq	a4,a5,80007374 <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007354:	fec42783          	lw	a5,-20(s0)
    80007358:	2785                	addiw	a5,a5,1
    8000735a:	fef42623          	sw	a5,-20(s0)
    8000735e:	fec42703          	lw	a4,-20(s0)
    80007362:	fbc42783          	lw	a5,-68(s0)
    80007366:	2701                	sext.w	a4,a4
    80007368:	2781                	sext.w	a5,a5
    8000736a:	f6f74ce3          	blt	a4,a5,800072e2 <piperead+0x90>
    8000736e:	a021                	j	80007376 <piperead+0x124>
      break;
    80007370:	0001                	nop
    80007372:	a011                	j	80007376 <piperead+0x124>
      break;
    80007374:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80007376:	fc843783          	ld	a5,-56(s0)
    8000737a:	21c78793          	addi	a5,a5,540
    8000737e:	853e                	mv	a0,a5
    80007380:	ffffc097          	auipc	ra,0xffffc
    80007384:	2d6080e7          	jalr	726(ra) # 80003656 <wakeup>
  release(&pi->lock);
    80007388:	fc843783          	ld	a5,-56(s0)
    8000738c:	853e                	mv	a0,a5
    8000738e:	ffffa097          	auipc	ra,0xffffa
    80007392:	012080e7          	jalr	18(ra) # 800013a0 <release>
  return i;
    80007396:	fec42783          	lw	a5,-20(s0)
}
    8000739a:	853e                	mv	a0,a5
    8000739c:	60a6                	ld	ra,72(sp)
    8000739e:	6406                	ld	s0,64(sp)
    800073a0:	6161                	addi	sp,sp,80
    800073a2:	8082                	ret

00000000800073a4 <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    800073a4:	7179                	addi	sp,sp,-48
    800073a6:	f422                	sd	s0,40(sp)
    800073a8:	1800                	addi	s0,sp,48
    800073aa:	87aa                	mv	a5,a0
    800073ac:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    800073b0:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    800073b4:	fdc42783          	lw	a5,-36(s0)
    800073b8:	8b85                	andi	a5,a5,1
    800073ba:	2781                	sext.w	a5,a5
    800073bc:	c781                	beqz	a5,800073c4 <flags2perm+0x20>
      perm = PTE_X;
    800073be:	47a1                	li	a5,8
    800073c0:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    800073c4:	fdc42783          	lw	a5,-36(s0)
    800073c8:	8b89                	andi	a5,a5,2
    800073ca:	2781                	sext.w	a5,a5
    800073cc:	c799                	beqz	a5,800073da <flags2perm+0x36>
      perm |= PTE_W;
    800073ce:	fec42783          	lw	a5,-20(s0)
    800073d2:	0047e793          	ori	a5,a5,4
    800073d6:	fef42623          	sw	a5,-20(s0)
    return perm;
    800073da:	fec42783          	lw	a5,-20(s0)
}
    800073de:	853e                	mv	a0,a5
    800073e0:	7422                	ld	s0,40(sp)
    800073e2:	6145                	addi	sp,sp,48
    800073e4:	8082                	ret

00000000800073e6 <exec>:

int
exec(char *path, char **argv)
{
    800073e6:	de010113          	addi	sp,sp,-544
    800073ea:	20113c23          	sd	ra,536(sp)
    800073ee:	20813823          	sd	s0,528(sp)
    800073f2:	20913423          	sd	s1,520(sp)
    800073f6:	1400                	addi	s0,sp,544
    800073f8:	dea43423          	sd	a0,-536(s0)
    800073fc:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007400:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007404:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007408:	ffffb097          	auipc	ra,0xffffb
    8000740c:	610080e7          	jalr	1552(ra) # 80002a18 <myproc>
    80007410:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007414:	fffff097          	auipc	ra,0xfffff
    80007418:	f40080e7          	jalr	-192(ra) # 80006354 <begin_op>

  if((ip = namei(path)) == 0){
    8000741c:	de843503          	ld	a0,-536(s0)
    80007420:	fffff097          	auipc	ra,0xfffff
    80007424:	bd0080e7          	jalr	-1072(ra) # 80005ff0 <namei>
    80007428:	faa43423          	sd	a0,-88(s0)
    8000742c:	fa843783          	ld	a5,-88(s0)
    80007430:	e799                	bnez	a5,8000743e <exec+0x58>
    end_op();
    80007432:	fffff097          	auipc	ra,0xfffff
    80007436:	fe4080e7          	jalr	-28(ra) # 80006416 <end_op>
    return -1;
    8000743a:	57fd                	li	a5,-1
    8000743c:	a1a9                	j	80007886 <exec+0x4a0>
  }
  ilock(ip);
    8000743e:	fa843503          	ld	a0,-88(s0)
    80007442:	ffffe097          	auipc	ra,0xffffe
    80007446:	e88080e7          	jalr	-376(ra) # 800052ca <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    8000744a:	e3040793          	addi	a5,s0,-464
    8000744e:	04000713          	li	a4,64
    80007452:	4681                	li	a3,0
    80007454:	863e                	mv	a2,a5
    80007456:	4581                	li	a1,0
    80007458:	fa843503          	ld	a0,-88(s0)
    8000745c:	ffffe097          	auipc	ra,0xffffe
    80007460:	424080e7          	jalr	1060(ra) # 80005880 <readi>
    80007464:	87aa                	mv	a5,a0
    80007466:	873e                	mv	a4,a5
    80007468:	04000793          	li	a5,64
    8000746c:	3af71763          	bne	a4,a5,8000781a <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    80007470:	e3042783          	lw	a5,-464(s0)
    80007474:	873e                	mv	a4,a5
    80007476:	464c47b7          	lui	a5,0x464c4
    8000747a:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    8000747e:	3af71063          	bne	a4,a5,8000781e <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    80007482:	f9843503          	ld	a0,-104(s0)
    80007486:	ffffb097          	auipc	ra,0xffffb
    8000748a:	7f4080e7          	jalr	2036(ra) # 80002c7a <proc_pagetable>
    8000748e:	faa43023          	sd	a0,-96(s0)
    80007492:	fa043783          	ld	a5,-96(s0)
    80007496:	38078663          	beqz	a5,80007822 <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000749a:	fc042623          	sw	zero,-52(s0)
    8000749e:	e5043783          	ld	a5,-432(s0)
    800074a2:	fcf42423          	sw	a5,-56(s0)
    800074a6:	a0fd                	j	80007594 <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800074a8:	df840793          	addi	a5,s0,-520
    800074ac:	fc842683          	lw	a3,-56(s0)
    800074b0:	03800713          	li	a4,56
    800074b4:	863e                	mv	a2,a5
    800074b6:	4581                	li	a1,0
    800074b8:	fa843503          	ld	a0,-88(s0)
    800074bc:	ffffe097          	auipc	ra,0xffffe
    800074c0:	3c4080e7          	jalr	964(ra) # 80005880 <readi>
    800074c4:	87aa                	mv	a5,a0
    800074c6:	873e                	mv	a4,a5
    800074c8:	03800793          	li	a5,56
    800074cc:	34f71d63          	bne	a4,a5,80007826 <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    800074d0:	df842783          	lw	a5,-520(s0)
    800074d4:	873e                	mv	a4,a5
    800074d6:	4785                	li	a5,1
    800074d8:	0af71163          	bne	a4,a5,8000757a <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    800074dc:	e2043703          	ld	a4,-480(s0)
    800074e0:	e1843783          	ld	a5,-488(s0)
    800074e4:	34f76363          	bltu	a4,a5,8000782a <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    800074e8:	e0843703          	ld	a4,-504(s0)
    800074ec:	e2043783          	ld	a5,-480(s0)
    800074f0:	973e                	add	a4,a4,a5
    800074f2:	e0843783          	ld	a5,-504(s0)
    800074f6:	32f76c63          	bltu	a4,a5,8000782e <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    800074fa:	e0843703          	ld	a4,-504(s0)
    800074fe:	6785                	lui	a5,0x1
    80007500:	17fd                	addi	a5,a5,-1
    80007502:	8ff9                	and	a5,a5,a4
    80007504:	32079763          	bnez	a5,80007832 <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007508:	e0843703          	ld	a4,-504(s0)
    8000750c:	e2043783          	ld	a5,-480(s0)
    80007510:	00f704b3          	add	s1,a4,a5
    80007514:	dfc42783          	lw	a5,-516(s0)
    80007518:	2781                	sext.w	a5,a5
    8000751a:	853e                	mv	a0,a5
    8000751c:	00000097          	auipc	ra,0x0
    80007520:	e88080e7          	jalr	-376(ra) # 800073a4 <flags2perm>
    80007524:	87aa                	mv	a5,a0
    80007526:	86be                	mv	a3,a5
    80007528:	8626                	mv	a2,s1
    8000752a:	fb843583          	ld	a1,-72(s0)
    8000752e:	fa043503          	ld	a0,-96(s0)
    80007532:	ffffb097          	auipc	ra,0xffffb
    80007536:	bb4080e7          	jalr	-1100(ra) # 800020e6 <uvmalloc>
    8000753a:	f6a43823          	sd	a0,-144(s0)
    8000753e:	f7043783          	ld	a5,-144(s0)
    80007542:	2e078a63          	beqz	a5,80007836 <exec+0x450>
      goto bad;
    sz = sz1;
    80007546:	f7043783          	ld	a5,-144(s0)
    8000754a:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    8000754e:	e0843783          	ld	a5,-504(s0)
    80007552:	e0043703          	ld	a4,-512(s0)
    80007556:	0007069b          	sext.w	a3,a4
    8000755a:	e1843703          	ld	a4,-488(s0)
    8000755e:	2701                	sext.w	a4,a4
    80007560:	fa843603          	ld	a2,-88(s0)
    80007564:	85be                	mv	a1,a5
    80007566:	fa043503          	ld	a0,-96(s0)
    8000756a:	00000097          	auipc	ra,0x0
    8000756e:	330080e7          	jalr	816(ra) # 8000789a <loadseg>
    80007572:	87aa                	mv	a5,a0
    80007574:	2c07c363          	bltz	a5,8000783a <exec+0x454>
    80007578:	a011                	j	8000757c <exec+0x196>
      continue;
    8000757a:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000757c:	fcc42783          	lw	a5,-52(s0)
    80007580:	2785                	addiw	a5,a5,1
    80007582:	fcf42623          	sw	a5,-52(s0)
    80007586:	fc842783          	lw	a5,-56(s0)
    8000758a:	0387879b          	addiw	a5,a5,56
    8000758e:	2781                	sext.w	a5,a5
    80007590:	fcf42423          	sw	a5,-56(s0)
    80007594:	e6845783          	lhu	a5,-408(s0)
    80007598:	0007871b          	sext.w	a4,a5
    8000759c:	fcc42783          	lw	a5,-52(s0)
    800075a0:	2781                	sext.w	a5,a5
    800075a2:	f0e7c3e3          	blt	a5,a4,800074a8 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800075a6:	fa843503          	ld	a0,-88(s0)
    800075aa:	ffffe097          	auipc	ra,0xffffe
    800075ae:	f7e080e7          	jalr	-130(ra) # 80005528 <iunlockput>
  end_op();
    800075b2:	fffff097          	auipc	ra,0xfffff
    800075b6:	e64080e7          	jalr	-412(ra) # 80006416 <end_op>
  ip = 0;
    800075ba:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800075be:	ffffb097          	auipc	ra,0xffffb
    800075c2:	45a080e7          	jalr	1114(ra) # 80002a18 <myproc>
    800075c6:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    800075ca:	f9843783          	ld	a5,-104(s0)
    800075ce:	67bc                	ld	a5,72(a5)
    800075d0:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    800075d4:	fb843703          	ld	a4,-72(s0)
    800075d8:	6785                	lui	a5,0x1
    800075da:	17fd                	addi	a5,a5,-1
    800075dc:	973e                	add	a4,a4,a5
    800075de:	77fd                	lui	a5,0xfffff
    800075e0:	8ff9                	and	a5,a5,a4
    800075e2:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    800075e6:	fb843703          	ld	a4,-72(s0)
    800075ea:	6789                	lui	a5,0x2
    800075ec:	97ba                	add	a5,a5,a4
    800075ee:	4691                	li	a3,4
    800075f0:	863e                	mv	a2,a5
    800075f2:	fb843583          	ld	a1,-72(s0)
    800075f6:	fa043503          	ld	a0,-96(s0)
    800075fa:	ffffb097          	auipc	ra,0xffffb
    800075fe:	aec080e7          	jalr	-1300(ra) # 800020e6 <uvmalloc>
    80007602:	f8a43423          	sd	a0,-120(s0)
    80007606:	f8843783          	ld	a5,-120(s0)
    8000760a:	22078a63          	beqz	a5,8000783e <exec+0x458>
    goto bad;
  sz = sz1;
    8000760e:	f8843783          	ld	a5,-120(s0)
    80007612:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007616:	fb843703          	ld	a4,-72(s0)
    8000761a:	77f9                	lui	a5,0xffffe
    8000761c:	97ba                	add	a5,a5,a4
    8000761e:	85be                	mv	a1,a5
    80007620:	fa043503          	ld	a0,-96(s0)
    80007624:	ffffb097          	auipc	ra,0xffffb
    80007628:	e58080e7          	jalr	-424(ra) # 8000247c <uvmclear>
  sp = sz;
    8000762c:	fb843783          	ld	a5,-72(s0)
    80007630:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007634:	fb043703          	ld	a4,-80(s0)
    80007638:	77fd                	lui	a5,0xfffff
    8000763a:	97ba                	add	a5,a5,a4
    8000763c:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007640:	fc043023          	sd	zero,-64(s0)
    80007644:	a845                	j	800076f4 <exec+0x30e>
    if(argc >= MAXARG)
    80007646:	fc043703          	ld	a4,-64(s0)
    8000764a:	47fd                	li	a5,31
    8000764c:	1ee7eb63          	bltu	a5,a4,80007842 <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007650:	fc043783          	ld	a5,-64(s0)
    80007654:	078e                	slli	a5,a5,0x3
    80007656:	de043703          	ld	a4,-544(s0)
    8000765a:	97ba                	add	a5,a5,a4
    8000765c:	639c                	ld	a5,0(a5)
    8000765e:	853e                	mv	a0,a5
    80007660:	ffffa097          	auipc	ra,0xffffa
    80007664:	22e080e7          	jalr	558(ra) # 8000188e <strlen>
    80007668:	87aa                	mv	a5,a0
    8000766a:	2785                	addiw	a5,a5,1
    8000766c:	2781                	sext.w	a5,a5
    8000766e:	873e                	mv	a4,a5
    80007670:	fb043783          	ld	a5,-80(s0)
    80007674:	8f99                	sub	a5,a5,a4
    80007676:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    8000767a:	fb043783          	ld	a5,-80(s0)
    8000767e:	9bc1                	andi	a5,a5,-16
    80007680:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    80007684:	fb043703          	ld	a4,-80(s0)
    80007688:	f8043783          	ld	a5,-128(s0)
    8000768c:	1af76d63          	bltu	a4,a5,80007846 <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007690:	fc043783          	ld	a5,-64(s0)
    80007694:	078e                	slli	a5,a5,0x3
    80007696:	de043703          	ld	a4,-544(s0)
    8000769a:	97ba                	add	a5,a5,a4
    8000769c:	6384                	ld	s1,0(a5)
    8000769e:	fc043783          	ld	a5,-64(s0)
    800076a2:	078e                	slli	a5,a5,0x3
    800076a4:	de043703          	ld	a4,-544(s0)
    800076a8:	97ba                	add	a5,a5,a4
    800076aa:	639c                	ld	a5,0(a5)
    800076ac:	853e                	mv	a0,a5
    800076ae:	ffffa097          	auipc	ra,0xffffa
    800076b2:	1e0080e7          	jalr	480(ra) # 8000188e <strlen>
    800076b6:	87aa                	mv	a5,a0
    800076b8:	2785                	addiw	a5,a5,1
    800076ba:	2781                	sext.w	a5,a5
    800076bc:	86be                	mv	a3,a5
    800076be:	8626                	mv	a2,s1
    800076c0:	fb043583          	ld	a1,-80(s0)
    800076c4:	fa043503          	ld	a0,-96(s0)
    800076c8:	ffffb097          	auipc	ra,0xffffb
    800076cc:	e1a080e7          	jalr	-486(ra) # 800024e2 <copyout>
    800076d0:	87aa                	mv	a5,a0
    800076d2:	1607cc63          	bltz	a5,8000784a <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    800076d6:	fc043783          	ld	a5,-64(s0)
    800076da:	078e                	slli	a5,a5,0x3
    800076dc:	fe040713          	addi	a4,s0,-32
    800076e0:	97ba                	add	a5,a5,a4
    800076e2:	fb043703          	ld	a4,-80(s0)
    800076e6:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ff98cc8>
  for(argc = 0; argv[argc]; argc++) {
    800076ea:	fc043783          	ld	a5,-64(s0)
    800076ee:	0785                	addi	a5,a5,1
    800076f0:	fcf43023          	sd	a5,-64(s0)
    800076f4:	fc043783          	ld	a5,-64(s0)
    800076f8:	078e                	slli	a5,a5,0x3
    800076fa:	de043703          	ld	a4,-544(s0)
    800076fe:	97ba                	add	a5,a5,a4
    80007700:	639c                	ld	a5,0(a5)
    80007702:	f3b1                	bnez	a5,80007646 <exec+0x260>
  }
  ustack[argc] = 0;
    80007704:	fc043783          	ld	a5,-64(s0)
    80007708:	078e                	slli	a5,a5,0x3
    8000770a:	fe040713          	addi	a4,s0,-32
    8000770e:	97ba                	add	a5,a5,a4
    80007710:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007714:	fc043783          	ld	a5,-64(s0)
    80007718:	0785                	addi	a5,a5,1
    8000771a:	078e                	slli	a5,a5,0x3
    8000771c:	fb043703          	ld	a4,-80(s0)
    80007720:	40f707b3          	sub	a5,a4,a5
    80007724:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007728:	fb043783          	ld	a5,-80(s0)
    8000772c:	9bc1                	andi	a5,a5,-16
    8000772e:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007732:	fb043703          	ld	a4,-80(s0)
    80007736:	f8043783          	ld	a5,-128(s0)
    8000773a:	10f76a63          	bltu	a4,a5,8000784e <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8000773e:	fc043783          	ld	a5,-64(s0)
    80007742:	0785                	addi	a5,a5,1
    80007744:	00379713          	slli	a4,a5,0x3
    80007748:	e7040793          	addi	a5,s0,-400
    8000774c:	86ba                	mv	a3,a4
    8000774e:	863e                	mv	a2,a5
    80007750:	fb043583          	ld	a1,-80(s0)
    80007754:	fa043503          	ld	a0,-96(s0)
    80007758:	ffffb097          	auipc	ra,0xffffb
    8000775c:	d8a080e7          	jalr	-630(ra) # 800024e2 <copyout>
    80007760:	87aa                	mv	a5,a0
    80007762:	0e07c863          	bltz	a5,80007852 <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80007766:	f9843783          	ld	a5,-104(s0)
    8000776a:	6fbc                	ld	a5,88(a5)
    8000776c:	fb043703          	ld	a4,-80(s0)
    80007770:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    80007772:	de843783          	ld	a5,-536(s0)
    80007776:	fcf43c23          	sd	a5,-40(s0)
    8000777a:	fd843783          	ld	a5,-40(s0)
    8000777e:	fcf43823          	sd	a5,-48(s0)
    80007782:	a025                	j	800077aa <exec+0x3c4>
    if(*s == '/')
    80007784:	fd843783          	ld	a5,-40(s0)
    80007788:	0007c783          	lbu	a5,0(a5)
    8000778c:	873e                	mv	a4,a5
    8000778e:	02f00793          	li	a5,47
    80007792:	00f71763          	bne	a4,a5,800077a0 <exec+0x3ba>
      last = s+1;
    80007796:	fd843783          	ld	a5,-40(s0)
    8000779a:	0785                	addi	a5,a5,1
    8000779c:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    800077a0:	fd843783          	ld	a5,-40(s0)
    800077a4:	0785                	addi	a5,a5,1
    800077a6:	fcf43c23          	sd	a5,-40(s0)
    800077aa:	fd843783          	ld	a5,-40(s0)
    800077ae:	0007c783          	lbu	a5,0(a5)
    800077b2:	fbe9                	bnez	a5,80007784 <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    800077b4:	f9843783          	ld	a5,-104(s0)
    800077b8:	15878793          	addi	a5,a5,344
    800077bc:	4641                	li	a2,16
    800077be:	fd043583          	ld	a1,-48(s0)
    800077c2:	853e                	mv	a0,a5
    800077c4:	ffffa097          	auipc	ra,0xffffa
    800077c8:	050080e7          	jalr	80(ra) # 80001814 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    800077cc:	f9843783          	ld	a5,-104(s0)
    800077d0:	6bbc                	ld	a5,80(a5)
    800077d2:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    800077d6:	f9843783          	ld	a5,-104(s0)
    800077da:	fa043703          	ld	a4,-96(s0)
    800077de:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    800077e0:	f9843783          	ld	a5,-104(s0)
    800077e4:	fb843703          	ld	a4,-72(s0)
    800077e8:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    800077ea:	f9843783          	ld	a5,-104(s0)
    800077ee:	6fbc                	ld	a5,88(a5)
    800077f0:	e4843703          	ld	a4,-440(s0)
    800077f4:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    800077f6:	f9843783          	ld	a5,-104(s0)
    800077fa:	6fbc                	ld	a5,88(a5)
    800077fc:	fb043703          	ld	a4,-80(s0)
    80007800:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007802:	f9043583          	ld	a1,-112(s0)
    80007806:	f7843503          	ld	a0,-136(s0)
    8000780a:	ffffb097          	auipc	ra,0xffffb
    8000780e:	530080e7          	jalr	1328(ra) # 80002d3a <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007812:	fc043783          	ld	a5,-64(s0)
    80007816:	2781                	sext.w	a5,a5
    80007818:	a0bd                	j	80007886 <exec+0x4a0>
    goto bad;
    8000781a:	0001                	nop
    8000781c:	a825                	j	80007854 <exec+0x46e>
    goto bad;
    8000781e:	0001                	nop
    80007820:	a815                	j	80007854 <exec+0x46e>
    goto bad;
    80007822:	0001                	nop
    80007824:	a805                	j	80007854 <exec+0x46e>
      goto bad;
    80007826:	0001                	nop
    80007828:	a035                	j	80007854 <exec+0x46e>
      goto bad;
    8000782a:	0001                	nop
    8000782c:	a025                	j	80007854 <exec+0x46e>
      goto bad;
    8000782e:	0001                	nop
    80007830:	a015                	j	80007854 <exec+0x46e>
      goto bad;
    80007832:	0001                	nop
    80007834:	a005                	j	80007854 <exec+0x46e>
      goto bad;
    80007836:	0001                	nop
    80007838:	a831                	j	80007854 <exec+0x46e>
      goto bad;
    8000783a:	0001                	nop
    8000783c:	a821                	j	80007854 <exec+0x46e>
    goto bad;
    8000783e:	0001                	nop
    80007840:	a811                	j	80007854 <exec+0x46e>
      goto bad;
    80007842:	0001                	nop
    80007844:	a801                	j	80007854 <exec+0x46e>
      goto bad;
    80007846:	0001                	nop
    80007848:	a031                	j	80007854 <exec+0x46e>
      goto bad;
    8000784a:	0001                	nop
    8000784c:	a021                	j	80007854 <exec+0x46e>
    goto bad;
    8000784e:	0001                	nop
    80007850:	a011                	j	80007854 <exec+0x46e>
    goto bad;
    80007852:	0001                	nop

 bad:
  if(pagetable)
    80007854:	fa043783          	ld	a5,-96(s0)
    80007858:	cb89                	beqz	a5,8000786a <exec+0x484>
    proc_freepagetable(pagetable, sz);
    8000785a:	fb843583          	ld	a1,-72(s0)
    8000785e:	fa043503          	ld	a0,-96(s0)
    80007862:	ffffb097          	auipc	ra,0xffffb
    80007866:	4d8080e7          	jalr	1240(ra) # 80002d3a <proc_freepagetable>
  if(ip){
    8000786a:	fa843783          	ld	a5,-88(s0)
    8000786e:	cb99                	beqz	a5,80007884 <exec+0x49e>
    iunlockput(ip);
    80007870:	fa843503          	ld	a0,-88(s0)
    80007874:	ffffe097          	auipc	ra,0xffffe
    80007878:	cb4080e7          	jalr	-844(ra) # 80005528 <iunlockput>
    end_op();
    8000787c:	fffff097          	auipc	ra,0xfffff
    80007880:	b9a080e7          	jalr	-1126(ra) # 80006416 <end_op>
  }
  return -1;
    80007884:	57fd                	li	a5,-1
}
    80007886:	853e                	mv	a0,a5
    80007888:	21813083          	ld	ra,536(sp)
    8000788c:	21013403          	ld	s0,528(sp)
    80007890:	20813483          	ld	s1,520(sp)
    80007894:	22010113          	addi	sp,sp,544
    80007898:	8082                	ret

000000008000789a <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    8000789a:	7139                	addi	sp,sp,-64
    8000789c:	fc06                	sd	ra,56(sp)
    8000789e:	f822                	sd	s0,48(sp)
    800078a0:	0080                	addi	s0,sp,64
    800078a2:	fca43c23          	sd	a0,-40(s0)
    800078a6:	fcb43823          	sd	a1,-48(s0)
    800078aa:	fcc43423          	sd	a2,-56(s0)
    800078ae:	87b6                	mv	a5,a3
    800078b0:	fcf42223          	sw	a5,-60(s0)
    800078b4:	87ba                	mv	a5,a4
    800078b6:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    800078ba:	fe042623          	sw	zero,-20(s0)
    800078be:	a05d                	j	80007964 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    800078c0:	fec46703          	lwu	a4,-20(s0)
    800078c4:	fd043783          	ld	a5,-48(s0)
    800078c8:	97ba                	add	a5,a5,a4
    800078ca:	85be                	mv	a1,a5
    800078cc:	fd843503          	ld	a0,-40(s0)
    800078d0:	ffffa097          	auipc	ra,0xffffa
    800078d4:	3f8080e7          	jalr	1016(ra) # 80001cc8 <walkaddr>
    800078d8:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800078dc:	fe043783          	ld	a5,-32(s0)
    800078e0:	eb89                	bnez	a5,800078f2 <loadseg+0x58>
      panic("loadseg: address should exist");
    800078e2:	00005517          	auipc	a0,0x5
    800078e6:	d1e50513          	addi	a0,a0,-738 # 8000c600 <etext+0x600>
    800078ea:	ffff9097          	auipc	ra,0xffff9
    800078ee:	3a2080e7          	jalr	930(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    800078f2:	fc042703          	lw	a4,-64(s0)
    800078f6:	fec42783          	lw	a5,-20(s0)
    800078fa:	40f707bb          	subw	a5,a4,a5
    800078fe:	2781                	sext.w	a5,a5
    80007900:	873e                	mv	a4,a5
    80007902:	6785                	lui	a5,0x1
    80007904:	00f77b63          	bgeu	a4,a5,8000791a <loadseg+0x80>
      n = sz - i;
    80007908:	fc042703          	lw	a4,-64(s0)
    8000790c:	fec42783          	lw	a5,-20(s0)
    80007910:	40f707bb          	subw	a5,a4,a5
    80007914:	fef42423          	sw	a5,-24(s0)
    80007918:	a021                	j	80007920 <loadseg+0x86>
    else
      n = PGSIZE;
    8000791a:	6785                	lui	a5,0x1
    8000791c:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007920:	fc442703          	lw	a4,-60(s0)
    80007924:	fec42783          	lw	a5,-20(s0)
    80007928:	9fb9                	addw	a5,a5,a4
    8000792a:	2781                	sext.w	a5,a5
    8000792c:	fe842703          	lw	a4,-24(s0)
    80007930:	86be                	mv	a3,a5
    80007932:	fe043603          	ld	a2,-32(s0)
    80007936:	4581                	li	a1,0
    80007938:	fc843503          	ld	a0,-56(s0)
    8000793c:	ffffe097          	auipc	ra,0xffffe
    80007940:	f44080e7          	jalr	-188(ra) # 80005880 <readi>
    80007944:	87aa                	mv	a5,a0
    80007946:	0007871b          	sext.w	a4,a5
    8000794a:	fe842783          	lw	a5,-24(s0)
    8000794e:	2781                	sext.w	a5,a5
    80007950:	00e78463          	beq	a5,a4,80007958 <loadseg+0xbe>
      return -1;
    80007954:	57fd                	li	a5,-1
    80007956:	a005                	j	80007976 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007958:	fec42703          	lw	a4,-20(s0)
    8000795c:	6785                	lui	a5,0x1
    8000795e:	9fb9                	addw	a5,a5,a4
    80007960:	fef42623          	sw	a5,-20(s0)
    80007964:	fec42703          	lw	a4,-20(s0)
    80007968:	fc042783          	lw	a5,-64(s0)
    8000796c:	2701                	sext.w	a4,a4
    8000796e:	2781                	sext.w	a5,a5
    80007970:	f4f768e3          	bltu	a4,a5,800078c0 <loadseg+0x26>
  }
  
  return 0;
    80007974:	4781                	li	a5,0
}
    80007976:	853e                	mv	a0,a5
    80007978:	70e2                	ld	ra,56(sp)
    8000797a:	7442                	ld	s0,48(sp)
    8000797c:	6121                	addi	sp,sp,64
    8000797e:	8082                	ret

0000000080007980 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007980:	7139                	addi	sp,sp,-64
    80007982:	fc06                	sd	ra,56(sp)
    80007984:	f822                	sd	s0,48(sp)
    80007986:	0080                	addi	s0,sp,64
    80007988:	87aa                	mv	a5,a0
    8000798a:	fcb43823          	sd	a1,-48(s0)
    8000798e:	fcc43423          	sd	a2,-56(s0)
    80007992:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    80007996:	fe440713          	addi	a4,s0,-28
    8000799a:	fdc42783          	lw	a5,-36(s0)
    8000799e:	85ba                	mv	a1,a4
    800079a0:	853e                	mv	a0,a5
    800079a2:	ffffd097          	auipc	ra,0xffffd
    800079a6:	980080e7          	jalr	-1664(ra) # 80004322 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    800079aa:	fe442783          	lw	a5,-28(s0)
    800079ae:	0207c863          	bltz	a5,800079de <argfd+0x5e>
    800079b2:	fe442783          	lw	a5,-28(s0)
    800079b6:	873e                	mv	a4,a5
    800079b8:	47bd                	li	a5,15
    800079ba:	02e7c263          	blt	a5,a4,800079de <argfd+0x5e>
    800079be:	ffffb097          	auipc	ra,0xffffb
    800079c2:	05a080e7          	jalr	90(ra) # 80002a18 <myproc>
    800079c6:	872a                	mv	a4,a0
    800079c8:	fe442783          	lw	a5,-28(s0)
    800079cc:	07e9                	addi	a5,a5,26
    800079ce:	078e                	slli	a5,a5,0x3
    800079d0:	97ba                	add	a5,a5,a4
    800079d2:	639c                	ld	a5,0(a5)
    800079d4:	fef43423          	sd	a5,-24(s0)
    800079d8:	fe843783          	ld	a5,-24(s0)
    800079dc:	e399                	bnez	a5,800079e2 <argfd+0x62>
    return -1;
    800079de:	57fd                	li	a5,-1
    800079e0:	a015                	j	80007a04 <argfd+0x84>
  if(pfd)
    800079e2:	fd043783          	ld	a5,-48(s0)
    800079e6:	c791                	beqz	a5,800079f2 <argfd+0x72>
    *pfd = fd;
    800079e8:	fe442703          	lw	a4,-28(s0)
    800079ec:	fd043783          	ld	a5,-48(s0)
    800079f0:	c398                	sw	a4,0(a5)
  if(pf)
    800079f2:	fc843783          	ld	a5,-56(s0)
    800079f6:	c791                	beqz	a5,80007a02 <argfd+0x82>
    *pf = f;
    800079f8:	fc843783          	ld	a5,-56(s0)
    800079fc:	fe843703          	ld	a4,-24(s0)
    80007a00:	e398                	sd	a4,0(a5)
  return 0;
    80007a02:	4781                	li	a5,0
}
    80007a04:	853e                	mv	a0,a5
    80007a06:	70e2                	ld	ra,56(sp)
    80007a08:	7442                	ld	s0,48(sp)
    80007a0a:	6121                	addi	sp,sp,64
    80007a0c:	8082                	ret

0000000080007a0e <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007a0e:	7179                	addi	sp,sp,-48
    80007a10:	f406                	sd	ra,40(sp)
    80007a12:	f022                	sd	s0,32(sp)
    80007a14:	1800                	addi	s0,sp,48
    80007a16:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007a1a:	ffffb097          	auipc	ra,0xffffb
    80007a1e:	ffe080e7          	jalr	-2(ra) # 80002a18 <myproc>
    80007a22:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007a26:	fe042623          	sw	zero,-20(s0)
    80007a2a:	a825                	j	80007a62 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007a2c:	fe043703          	ld	a4,-32(s0)
    80007a30:	fec42783          	lw	a5,-20(s0)
    80007a34:	07e9                	addi	a5,a5,26
    80007a36:	078e                	slli	a5,a5,0x3
    80007a38:	97ba                	add	a5,a5,a4
    80007a3a:	639c                	ld	a5,0(a5)
    80007a3c:	ef91                	bnez	a5,80007a58 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007a3e:	fe043703          	ld	a4,-32(s0)
    80007a42:	fec42783          	lw	a5,-20(s0)
    80007a46:	07e9                	addi	a5,a5,26
    80007a48:	078e                	slli	a5,a5,0x3
    80007a4a:	97ba                	add	a5,a5,a4
    80007a4c:	fd843703          	ld	a4,-40(s0)
    80007a50:	e398                	sd	a4,0(a5)
      return fd;
    80007a52:	fec42783          	lw	a5,-20(s0)
    80007a56:	a831                	j	80007a72 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007a58:	fec42783          	lw	a5,-20(s0)
    80007a5c:	2785                	addiw	a5,a5,1
    80007a5e:	fef42623          	sw	a5,-20(s0)
    80007a62:	fec42783          	lw	a5,-20(s0)
    80007a66:	0007871b          	sext.w	a4,a5
    80007a6a:	47bd                	li	a5,15
    80007a6c:	fce7d0e3          	bge	a5,a4,80007a2c <fdalloc+0x1e>
    }
  }
  return -1;
    80007a70:	57fd                	li	a5,-1
}
    80007a72:	853e                	mv	a0,a5
    80007a74:	70a2                	ld	ra,40(sp)
    80007a76:	7402                	ld	s0,32(sp)
    80007a78:	6145                	addi	sp,sp,48
    80007a7a:	8082                	ret

0000000080007a7c <sys_dup>:

uint64
sys_dup(void)
{
    80007a7c:	1101                	addi	sp,sp,-32
    80007a7e:	ec06                	sd	ra,24(sp)
    80007a80:	e822                	sd	s0,16(sp)
    80007a82:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007a84:	fe040793          	addi	a5,s0,-32
    80007a88:	863e                	mv	a2,a5
    80007a8a:	4581                	li	a1,0
    80007a8c:	4501                	li	a0,0
    80007a8e:	00000097          	auipc	ra,0x0
    80007a92:	ef2080e7          	jalr	-270(ra) # 80007980 <argfd>
    80007a96:	87aa                	mv	a5,a0
    80007a98:	0007d463          	bgez	a5,80007aa0 <sys_dup+0x24>
    return -1;
    80007a9c:	57fd                	li	a5,-1
    80007a9e:	a81d                	j	80007ad4 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007aa0:	fe043783          	ld	a5,-32(s0)
    80007aa4:	853e                	mv	a0,a5
    80007aa6:	00000097          	auipc	ra,0x0
    80007aaa:	f68080e7          	jalr	-152(ra) # 80007a0e <fdalloc>
    80007aae:	87aa                	mv	a5,a0
    80007ab0:	fef42623          	sw	a5,-20(s0)
    80007ab4:	fec42783          	lw	a5,-20(s0)
    80007ab8:	2781                	sext.w	a5,a5
    80007aba:	0007d463          	bgez	a5,80007ac2 <sys_dup+0x46>
    return -1;
    80007abe:	57fd                	li	a5,-1
    80007ac0:	a811                	j	80007ad4 <sys_dup+0x58>
  filedup(f);
    80007ac2:	fe043783          	ld	a5,-32(s0)
    80007ac6:	853e                	mv	a0,a5
    80007ac8:	fffff097          	auipc	ra,0xfffff
    80007acc:	ec0080e7          	jalr	-320(ra) # 80006988 <filedup>
  return fd;
    80007ad0:	fec42783          	lw	a5,-20(s0)
}
    80007ad4:	853e                	mv	a0,a5
    80007ad6:	60e2                	ld	ra,24(sp)
    80007ad8:	6442                	ld	s0,16(sp)
    80007ada:	6105                	addi	sp,sp,32
    80007adc:	8082                	ret

0000000080007ade <sys_read>:

uint64
sys_read(void)
{
    80007ade:	7179                	addi	sp,sp,-48
    80007ae0:	f406                	sd	ra,40(sp)
    80007ae2:	f022                	sd	s0,32(sp)
    80007ae4:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007ae6:	fd840793          	addi	a5,s0,-40
    80007aea:	85be                	mv	a1,a5
    80007aec:	4505                	li	a0,1
    80007aee:	ffffd097          	auipc	ra,0xffffd
    80007af2:	86a080e7          	jalr	-1942(ra) # 80004358 <argaddr>
  argint(2, &n);
    80007af6:	fe440793          	addi	a5,s0,-28
    80007afa:	85be                	mv	a1,a5
    80007afc:	4509                	li	a0,2
    80007afe:	ffffd097          	auipc	ra,0xffffd
    80007b02:	824080e7          	jalr	-2012(ra) # 80004322 <argint>
  if(argfd(0, 0, &f) < 0)
    80007b06:	fe840793          	addi	a5,s0,-24
    80007b0a:	863e                	mv	a2,a5
    80007b0c:	4581                	li	a1,0
    80007b0e:	4501                	li	a0,0
    80007b10:	00000097          	auipc	ra,0x0
    80007b14:	e70080e7          	jalr	-400(ra) # 80007980 <argfd>
    80007b18:	87aa                	mv	a5,a0
    80007b1a:	0007d463          	bgez	a5,80007b22 <sys_read+0x44>
    return -1;
    80007b1e:	57fd                	li	a5,-1
    80007b20:	a839                	j	80007b3e <sys_read+0x60>
  return fileread(f, p, n);
    80007b22:	fe843783          	ld	a5,-24(s0)
    80007b26:	fd843703          	ld	a4,-40(s0)
    80007b2a:	fe442683          	lw	a3,-28(s0)
    80007b2e:	8636                	mv	a2,a3
    80007b30:	85ba                	mv	a1,a4
    80007b32:	853e                	mv	a0,a5
    80007b34:	fffff097          	auipc	ra,0xfffff
    80007b38:	066080e7          	jalr	102(ra) # 80006b9a <fileread>
    80007b3c:	87aa                	mv	a5,a0
}
    80007b3e:	853e                	mv	a0,a5
    80007b40:	70a2                	ld	ra,40(sp)
    80007b42:	7402                	ld	s0,32(sp)
    80007b44:	6145                	addi	sp,sp,48
    80007b46:	8082                	ret

0000000080007b48 <sys_write>:

uint64
sys_write(void)
{
    80007b48:	7179                	addi	sp,sp,-48
    80007b4a:	f406                	sd	ra,40(sp)
    80007b4c:	f022                	sd	s0,32(sp)
    80007b4e:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007b50:	fd840793          	addi	a5,s0,-40
    80007b54:	85be                	mv	a1,a5
    80007b56:	4505                	li	a0,1
    80007b58:	ffffd097          	auipc	ra,0xffffd
    80007b5c:	800080e7          	jalr	-2048(ra) # 80004358 <argaddr>
  argint(2, &n);
    80007b60:	fe440793          	addi	a5,s0,-28
    80007b64:	85be                	mv	a1,a5
    80007b66:	4509                	li	a0,2
    80007b68:	ffffc097          	auipc	ra,0xffffc
    80007b6c:	7ba080e7          	jalr	1978(ra) # 80004322 <argint>
  if(argfd(0, 0, &f) < 0)
    80007b70:	fe840793          	addi	a5,s0,-24
    80007b74:	863e                	mv	a2,a5
    80007b76:	4581                	li	a1,0
    80007b78:	4501                	li	a0,0
    80007b7a:	00000097          	auipc	ra,0x0
    80007b7e:	e06080e7          	jalr	-506(ra) # 80007980 <argfd>
    80007b82:	87aa                	mv	a5,a0
    80007b84:	0007d463          	bgez	a5,80007b8c <sys_write+0x44>
    return -1;
    80007b88:	57fd                	li	a5,-1
    80007b8a:	a839                	j	80007ba8 <sys_write+0x60>

  return filewrite(f, p, n);
    80007b8c:	fe843783          	ld	a5,-24(s0)
    80007b90:	fd843703          	ld	a4,-40(s0)
    80007b94:	fe442683          	lw	a3,-28(s0)
    80007b98:	8636                	mv	a2,a3
    80007b9a:	85ba                	mv	a1,a4
    80007b9c:	853e                	mv	a0,a5
    80007b9e:	fffff097          	auipc	ra,0xfffff
    80007ba2:	162080e7          	jalr	354(ra) # 80006d00 <filewrite>
    80007ba6:	87aa                	mv	a5,a0
}
    80007ba8:	853e                	mv	a0,a5
    80007baa:	70a2                	ld	ra,40(sp)
    80007bac:	7402                	ld	s0,32(sp)
    80007bae:	6145                	addi	sp,sp,48
    80007bb0:	8082                	ret

0000000080007bb2 <sys_close>:

uint64
sys_close(void)
{
    80007bb2:	1101                	addi	sp,sp,-32
    80007bb4:	ec06                	sd	ra,24(sp)
    80007bb6:	e822                	sd	s0,16(sp)
    80007bb8:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007bba:	fe040713          	addi	a4,s0,-32
    80007bbe:	fec40793          	addi	a5,s0,-20
    80007bc2:	863a                	mv	a2,a4
    80007bc4:	85be                	mv	a1,a5
    80007bc6:	4501                	li	a0,0
    80007bc8:	00000097          	auipc	ra,0x0
    80007bcc:	db8080e7          	jalr	-584(ra) # 80007980 <argfd>
    80007bd0:	87aa                	mv	a5,a0
    80007bd2:	0007d463          	bgez	a5,80007bda <sys_close+0x28>
    return -1;
    80007bd6:	57fd                	li	a5,-1
    80007bd8:	a02d                	j	80007c02 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007bda:	ffffb097          	auipc	ra,0xffffb
    80007bde:	e3e080e7          	jalr	-450(ra) # 80002a18 <myproc>
    80007be2:	872a                	mv	a4,a0
    80007be4:	fec42783          	lw	a5,-20(s0)
    80007be8:	07e9                	addi	a5,a5,26
    80007bea:	078e                	slli	a5,a5,0x3
    80007bec:	97ba                	add	a5,a5,a4
    80007bee:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007bf2:	fe043783          	ld	a5,-32(s0)
    80007bf6:	853e                	mv	a0,a5
    80007bf8:	fffff097          	auipc	ra,0xfffff
    80007bfc:	df6080e7          	jalr	-522(ra) # 800069ee <fileclose>
  return 0;
    80007c00:	4781                	li	a5,0
}
    80007c02:	853e                	mv	a0,a5
    80007c04:	60e2                	ld	ra,24(sp)
    80007c06:	6442                	ld	s0,16(sp)
    80007c08:	6105                	addi	sp,sp,32
    80007c0a:	8082                	ret

0000000080007c0c <sys_fstat>:

uint64
sys_fstat(void)
{
    80007c0c:	1101                	addi	sp,sp,-32
    80007c0e:	ec06                	sd	ra,24(sp)
    80007c10:	e822                	sd	s0,16(sp)
    80007c12:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007c14:	fe040793          	addi	a5,s0,-32
    80007c18:	85be                	mv	a1,a5
    80007c1a:	4505                	li	a0,1
    80007c1c:	ffffc097          	auipc	ra,0xffffc
    80007c20:	73c080e7          	jalr	1852(ra) # 80004358 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007c24:	fe840793          	addi	a5,s0,-24
    80007c28:	863e                	mv	a2,a5
    80007c2a:	4581                	li	a1,0
    80007c2c:	4501                	li	a0,0
    80007c2e:	00000097          	auipc	ra,0x0
    80007c32:	d52080e7          	jalr	-686(ra) # 80007980 <argfd>
    80007c36:	87aa                	mv	a5,a0
    80007c38:	0007d463          	bgez	a5,80007c40 <sys_fstat+0x34>
    return -1;
    80007c3c:	57fd                	li	a5,-1
    80007c3e:	a821                	j	80007c56 <sys_fstat+0x4a>
  return filestat(f, st);
    80007c40:	fe843783          	ld	a5,-24(s0)
    80007c44:	fe043703          	ld	a4,-32(s0)
    80007c48:	85ba                	mv	a1,a4
    80007c4a:	853e                	mv	a0,a5
    80007c4c:	fffff097          	auipc	ra,0xfffff
    80007c50:	eaa080e7          	jalr	-342(ra) # 80006af6 <filestat>
    80007c54:	87aa                	mv	a5,a0
}
    80007c56:	853e                	mv	a0,a5
    80007c58:	60e2                	ld	ra,24(sp)
    80007c5a:	6442                	ld	s0,16(sp)
    80007c5c:	6105                	addi	sp,sp,32
    80007c5e:	8082                	ret

0000000080007c60 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007c60:	7169                	addi	sp,sp,-304
    80007c62:	f606                	sd	ra,296(sp)
    80007c64:	f222                	sd	s0,288(sp)
    80007c66:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007c68:	ed040793          	addi	a5,s0,-304
    80007c6c:	08000613          	li	a2,128
    80007c70:	85be                	mv	a1,a5
    80007c72:	4501                	li	a0,0
    80007c74:	ffffc097          	auipc	ra,0xffffc
    80007c78:	716080e7          	jalr	1814(ra) # 8000438a <argstr>
    80007c7c:	87aa                	mv	a5,a0
    80007c7e:	0007cf63          	bltz	a5,80007c9c <sys_link+0x3c>
    80007c82:	f5040793          	addi	a5,s0,-176
    80007c86:	08000613          	li	a2,128
    80007c8a:	85be                	mv	a1,a5
    80007c8c:	4505                	li	a0,1
    80007c8e:	ffffc097          	auipc	ra,0xffffc
    80007c92:	6fc080e7          	jalr	1788(ra) # 8000438a <argstr>
    80007c96:	87aa                	mv	a5,a0
    80007c98:	0007d463          	bgez	a5,80007ca0 <sys_link+0x40>
    return -1;
    80007c9c:	57fd                	li	a5,-1
    80007c9e:	aab5                	j	80007e1a <sys_link+0x1ba>

  begin_op();
    80007ca0:	ffffe097          	auipc	ra,0xffffe
    80007ca4:	6b4080e7          	jalr	1716(ra) # 80006354 <begin_op>
  if((ip = namei(old)) == 0){
    80007ca8:	ed040793          	addi	a5,s0,-304
    80007cac:	853e                	mv	a0,a5
    80007cae:	ffffe097          	auipc	ra,0xffffe
    80007cb2:	342080e7          	jalr	834(ra) # 80005ff0 <namei>
    80007cb6:	fea43423          	sd	a0,-24(s0)
    80007cba:	fe843783          	ld	a5,-24(s0)
    80007cbe:	e799                	bnez	a5,80007ccc <sys_link+0x6c>
    end_op();
    80007cc0:	ffffe097          	auipc	ra,0xffffe
    80007cc4:	756080e7          	jalr	1878(ra) # 80006416 <end_op>
    return -1;
    80007cc8:	57fd                	li	a5,-1
    80007cca:	aa81                	j	80007e1a <sys_link+0x1ba>
  }

  ilock(ip);
    80007ccc:	fe843503          	ld	a0,-24(s0)
    80007cd0:	ffffd097          	auipc	ra,0xffffd
    80007cd4:	5fa080e7          	jalr	1530(ra) # 800052ca <ilock>
  if(ip->type == T_DIR){
    80007cd8:	fe843783          	ld	a5,-24(s0)
    80007cdc:	04479783          	lh	a5,68(a5)
    80007ce0:	0007871b          	sext.w	a4,a5
    80007ce4:	4785                	li	a5,1
    80007ce6:	00f71e63          	bne	a4,a5,80007d02 <sys_link+0xa2>
    iunlockput(ip);
    80007cea:	fe843503          	ld	a0,-24(s0)
    80007cee:	ffffe097          	auipc	ra,0xffffe
    80007cf2:	83a080e7          	jalr	-1990(ra) # 80005528 <iunlockput>
    end_op();
    80007cf6:	ffffe097          	auipc	ra,0xffffe
    80007cfa:	720080e7          	jalr	1824(ra) # 80006416 <end_op>
    return -1;
    80007cfe:	57fd                	li	a5,-1
    80007d00:	aa29                	j	80007e1a <sys_link+0x1ba>
  }

  ip->nlink++;
    80007d02:	fe843783          	ld	a5,-24(s0)
    80007d06:	04a79783          	lh	a5,74(a5)
    80007d0a:	17c2                	slli	a5,a5,0x30
    80007d0c:	93c1                	srli	a5,a5,0x30
    80007d0e:	2785                	addiw	a5,a5,1
    80007d10:	17c2                	slli	a5,a5,0x30
    80007d12:	93c1                	srli	a5,a5,0x30
    80007d14:	0107971b          	slliw	a4,a5,0x10
    80007d18:	4107571b          	sraiw	a4,a4,0x10
    80007d1c:	fe843783          	ld	a5,-24(s0)
    80007d20:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d24:	fe843503          	ld	a0,-24(s0)
    80007d28:	ffffd097          	auipc	ra,0xffffd
    80007d2c:	352080e7          	jalr	850(ra) # 8000507a <iupdate>
  iunlock(ip);
    80007d30:	fe843503          	ld	a0,-24(s0)
    80007d34:	ffffd097          	auipc	ra,0xffffd
    80007d38:	6ca080e7          	jalr	1738(ra) # 800053fe <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007d3c:	fd040713          	addi	a4,s0,-48
    80007d40:	f5040793          	addi	a5,s0,-176
    80007d44:	85ba                	mv	a1,a4
    80007d46:	853e                	mv	a0,a5
    80007d48:	ffffe097          	auipc	ra,0xffffe
    80007d4c:	2d4080e7          	jalr	724(ra) # 8000601c <nameiparent>
    80007d50:	fea43023          	sd	a0,-32(s0)
    80007d54:	fe043783          	ld	a5,-32(s0)
    80007d58:	cba5                	beqz	a5,80007dc8 <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007d5a:	fe043503          	ld	a0,-32(s0)
    80007d5e:	ffffd097          	auipc	ra,0xffffd
    80007d62:	56c080e7          	jalr	1388(ra) # 800052ca <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007d66:	fe043783          	ld	a5,-32(s0)
    80007d6a:	4398                	lw	a4,0(a5)
    80007d6c:	fe843783          	ld	a5,-24(s0)
    80007d70:	439c                	lw	a5,0(a5)
    80007d72:	02f71263          	bne	a4,a5,80007d96 <sys_link+0x136>
    80007d76:	fe843783          	ld	a5,-24(s0)
    80007d7a:	43d8                	lw	a4,4(a5)
    80007d7c:	fd040793          	addi	a5,s0,-48
    80007d80:	863a                	mv	a2,a4
    80007d82:	85be                	mv	a1,a5
    80007d84:	fe043503          	ld	a0,-32(s0)
    80007d88:	ffffe097          	auipc	ra,0xffffe
    80007d8c:	f5a080e7          	jalr	-166(ra) # 80005ce2 <dirlink>
    80007d90:	87aa                	mv	a5,a0
    80007d92:	0007d963          	bgez	a5,80007da4 <sys_link+0x144>
    iunlockput(dp);
    80007d96:	fe043503          	ld	a0,-32(s0)
    80007d9a:	ffffd097          	auipc	ra,0xffffd
    80007d9e:	78e080e7          	jalr	1934(ra) # 80005528 <iunlockput>
    goto bad;
    80007da2:	a025                	j	80007dca <sys_link+0x16a>
  }
  iunlockput(dp);
    80007da4:	fe043503          	ld	a0,-32(s0)
    80007da8:	ffffd097          	auipc	ra,0xffffd
    80007dac:	780080e7          	jalr	1920(ra) # 80005528 <iunlockput>
  iput(ip);
    80007db0:	fe843503          	ld	a0,-24(s0)
    80007db4:	ffffd097          	auipc	ra,0xffffd
    80007db8:	6a4080e7          	jalr	1700(ra) # 80005458 <iput>

  end_op();
    80007dbc:	ffffe097          	auipc	ra,0xffffe
    80007dc0:	65a080e7          	jalr	1626(ra) # 80006416 <end_op>

  return 0;
    80007dc4:	4781                	li	a5,0
    80007dc6:	a891                	j	80007e1a <sys_link+0x1ba>
    goto bad;
    80007dc8:	0001                	nop

bad:
  ilock(ip);
    80007dca:	fe843503          	ld	a0,-24(s0)
    80007dce:	ffffd097          	auipc	ra,0xffffd
    80007dd2:	4fc080e7          	jalr	1276(ra) # 800052ca <ilock>
  ip->nlink--;
    80007dd6:	fe843783          	ld	a5,-24(s0)
    80007dda:	04a79783          	lh	a5,74(a5)
    80007dde:	17c2                	slli	a5,a5,0x30
    80007de0:	93c1                	srli	a5,a5,0x30
    80007de2:	37fd                	addiw	a5,a5,-1
    80007de4:	17c2                	slli	a5,a5,0x30
    80007de6:	93c1                	srli	a5,a5,0x30
    80007de8:	0107971b          	slliw	a4,a5,0x10
    80007dec:	4107571b          	sraiw	a4,a4,0x10
    80007df0:	fe843783          	ld	a5,-24(s0)
    80007df4:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007df8:	fe843503          	ld	a0,-24(s0)
    80007dfc:	ffffd097          	auipc	ra,0xffffd
    80007e00:	27e080e7          	jalr	638(ra) # 8000507a <iupdate>
  iunlockput(ip);
    80007e04:	fe843503          	ld	a0,-24(s0)
    80007e08:	ffffd097          	auipc	ra,0xffffd
    80007e0c:	720080e7          	jalr	1824(ra) # 80005528 <iunlockput>
  end_op();
    80007e10:	ffffe097          	auipc	ra,0xffffe
    80007e14:	606080e7          	jalr	1542(ra) # 80006416 <end_op>
  return -1;
    80007e18:	57fd                	li	a5,-1
}
    80007e1a:	853e                	mv	a0,a5
    80007e1c:	70b2                	ld	ra,296(sp)
    80007e1e:	7412                	ld	s0,288(sp)
    80007e20:	6155                	addi	sp,sp,304
    80007e22:	8082                	ret

0000000080007e24 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007e24:	7139                	addi	sp,sp,-64
    80007e26:	fc06                	sd	ra,56(sp)
    80007e28:	f822                	sd	s0,48(sp)
    80007e2a:	0080                	addi	s0,sp,64
    80007e2c:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e30:	02000793          	li	a5,32
    80007e34:	fef42623          	sw	a5,-20(s0)
    80007e38:	a0b1                	j	80007e84 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007e3a:	fd840793          	addi	a5,s0,-40
    80007e3e:	fec42683          	lw	a3,-20(s0)
    80007e42:	4741                	li	a4,16
    80007e44:	863e                	mv	a2,a5
    80007e46:	4581                	li	a1,0
    80007e48:	fc843503          	ld	a0,-56(s0)
    80007e4c:	ffffe097          	auipc	ra,0xffffe
    80007e50:	a34080e7          	jalr	-1484(ra) # 80005880 <readi>
    80007e54:	87aa                	mv	a5,a0
    80007e56:	873e                	mv	a4,a5
    80007e58:	47c1                	li	a5,16
    80007e5a:	00f70a63          	beq	a4,a5,80007e6e <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007e5e:	00004517          	auipc	a0,0x4
    80007e62:	7c250513          	addi	a0,a0,1986 # 8000c620 <etext+0x620>
    80007e66:	ffff9097          	auipc	ra,0xffff9
    80007e6a:	e26080e7          	jalr	-474(ra) # 80000c8c <panic>
    if(de.inum != 0)
    80007e6e:	fd845783          	lhu	a5,-40(s0)
    80007e72:	c399                	beqz	a5,80007e78 <isdirempty+0x54>
      return 0;
    80007e74:	4781                	li	a5,0
    80007e76:	a839                	j	80007e94 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e78:	fec42783          	lw	a5,-20(s0)
    80007e7c:	27c1                	addiw	a5,a5,16
    80007e7e:	2781                	sext.w	a5,a5
    80007e80:	fef42623          	sw	a5,-20(s0)
    80007e84:	fc843783          	ld	a5,-56(s0)
    80007e88:	47f8                	lw	a4,76(a5)
    80007e8a:	fec42783          	lw	a5,-20(s0)
    80007e8e:	fae7e6e3          	bltu	a5,a4,80007e3a <isdirempty+0x16>
  }
  return 1;
    80007e92:	4785                	li	a5,1
}
    80007e94:	853e                	mv	a0,a5
    80007e96:	70e2                	ld	ra,56(sp)
    80007e98:	7442                	ld	s0,48(sp)
    80007e9a:	6121                	addi	sp,sp,64
    80007e9c:	8082                	ret

0000000080007e9e <sys_unlink>:

uint64
sys_unlink(void)
{
    80007e9e:	7155                	addi	sp,sp,-208
    80007ea0:	e586                	sd	ra,200(sp)
    80007ea2:	e1a2                	sd	s0,192(sp)
    80007ea4:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007ea6:	f4040793          	addi	a5,s0,-192
    80007eaa:	08000613          	li	a2,128
    80007eae:	85be                	mv	a1,a5
    80007eb0:	4501                	li	a0,0
    80007eb2:	ffffc097          	auipc	ra,0xffffc
    80007eb6:	4d8080e7          	jalr	1240(ra) # 8000438a <argstr>
    80007eba:	87aa                	mv	a5,a0
    80007ebc:	0007d463          	bgez	a5,80007ec4 <sys_unlink+0x26>
    return -1;
    80007ec0:	57fd                	li	a5,-1
    80007ec2:	a2ed                	j	800080ac <sys_unlink+0x20e>

  begin_op();
    80007ec4:	ffffe097          	auipc	ra,0xffffe
    80007ec8:	490080e7          	jalr	1168(ra) # 80006354 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007ecc:	fc040713          	addi	a4,s0,-64
    80007ed0:	f4040793          	addi	a5,s0,-192
    80007ed4:	85ba                	mv	a1,a4
    80007ed6:	853e                	mv	a0,a5
    80007ed8:	ffffe097          	auipc	ra,0xffffe
    80007edc:	144080e7          	jalr	324(ra) # 8000601c <nameiparent>
    80007ee0:	fea43423          	sd	a0,-24(s0)
    80007ee4:	fe843783          	ld	a5,-24(s0)
    80007ee8:	e799                	bnez	a5,80007ef6 <sys_unlink+0x58>
    end_op();
    80007eea:	ffffe097          	auipc	ra,0xffffe
    80007eee:	52c080e7          	jalr	1324(ra) # 80006416 <end_op>
    return -1;
    80007ef2:	57fd                	li	a5,-1
    80007ef4:	aa65                	j	800080ac <sys_unlink+0x20e>
  }

  ilock(dp);
    80007ef6:	fe843503          	ld	a0,-24(s0)
    80007efa:	ffffd097          	auipc	ra,0xffffd
    80007efe:	3d0080e7          	jalr	976(ra) # 800052ca <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007f02:	fc040793          	addi	a5,s0,-64
    80007f06:	00004597          	auipc	a1,0x4
    80007f0a:	73258593          	addi	a1,a1,1842 # 8000c638 <etext+0x638>
    80007f0e:	853e                	mv	a0,a5
    80007f10:	ffffe097          	auipc	ra,0xffffe
    80007f14:	cbc080e7          	jalr	-836(ra) # 80005bcc <namecmp>
    80007f18:	87aa                	mv	a5,a0
    80007f1a:	16078b63          	beqz	a5,80008090 <sys_unlink+0x1f2>
    80007f1e:	fc040793          	addi	a5,s0,-64
    80007f22:	00004597          	auipc	a1,0x4
    80007f26:	71e58593          	addi	a1,a1,1822 # 8000c640 <etext+0x640>
    80007f2a:	853e                	mv	a0,a5
    80007f2c:	ffffe097          	auipc	ra,0xffffe
    80007f30:	ca0080e7          	jalr	-864(ra) # 80005bcc <namecmp>
    80007f34:	87aa                	mv	a5,a0
    80007f36:	14078d63          	beqz	a5,80008090 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007f3a:	f3c40713          	addi	a4,s0,-196
    80007f3e:	fc040793          	addi	a5,s0,-64
    80007f42:	863a                	mv	a2,a4
    80007f44:	85be                	mv	a1,a5
    80007f46:	fe843503          	ld	a0,-24(s0)
    80007f4a:	ffffe097          	auipc	ra,0xffffe
    80007f4e:	cb0080e7          	jalr	-848(ra) # 80005bfa <dirlookup>
    80007f52:	fea43023          	sd	a0,-32(s0)
    80007f56:	fe043783          	ld	a5,-32(s0)
    80007f5a:	12078d63          	beqz	a5,80008094 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007f5e:	fe043503          	ld	a0,-32(s0)
    80007f62:	ffffd097          	auipc	ra,0xffffd
    80007f66:	368080e7          	jalr	872(ra) # 800052ca <ilock>

  if(ip->nlink < 1)
    80007f6a:	fe043783          	ld	a5,-32(s0)
    80007f6e:	04a79783          	lh	a5,74(a5)
    80007f72:	2781                	sext.w	a5,a5
    80007f74:	00f04a63          	bgtz	a5,80007f88 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007f78:	00004517          	auipc	a0,0x4
    80007f7c:	6d050513          	addi	a0,a0,1744 # 8000c648 <etext+0x648>
    80007f80:	ffff9097          	auipc	ra,0xffff9
    80007f84:	d0c080e7          	jalr	-756(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007f88:	fe043783          	ld	a5,-32(s0)
    80007f8c:	04479783          	lh	a5,68(a5)
    80007f90:	0007871b          	sext.w	a4,a5
    80007f94:	4785                	li	a5,1
    80007f96:	02f71163          	bne	a4,a5,80007fb8 <sys_unlink+0x11a>
    80007f9a:	fe043503          	ld	a0,-32(s0)
    80007f9e:	00000097          	auipc	ra,0x0
    80007fa2:	e86080e7          	jalr	-378(ra) # 80007e24 <isdirempty>
    80007fa6:	87aa                	mv	a5,a0
    80007fa8:	eb81                	bnez	a5,80007fb8 <sys_unlink+0x11a>
    iunlockput(ip);
    80007faa:	fe043503          	ld	a0,-32(s0)
    80007fae:	ffffd097          	auipc	ra,0xffffd
    80007fb2:	57a080e7          	jalr	1402(ra) # 80005528 <iunlockput>
    goto bad;
    80007fb6:	a0c5                	j	80008096 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007fb8:	fd040793          	addi	a5,s0,-48
    80007fbc:	4641                	li	a2,16
    80007fbe:	4581                	li	a1,0
    80007fc0:	853e                	mv	a0,a5
    80007fc2:	ffff9097          	auipc	ra,0xffff9
    80007fc6:	54e080e7          	jalr	1358(ra) # 80001510 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007fca:	fd040793          	addi	a5,s0,-48
    80007fce:	f3c42683          	lw	a3,-196(s0)
    80007fd2:	4741                	li	a4,16
    80007fd4:	863e                	mv	a2,a5
    80007fd6:	4581                	li	a1,0
    80007fd8:	fe843503          	ld	a0,-24(s0)
    80007fdc:	ffffe097          	auipc	ra,0xffffe
    80007fe0:	a3c080e7          	jalr	-1476(ra) # 80005a18 <writei>
    80007fe4:	87aa                	mv	a5,a0
    80007fe6:	873e                	mv	a4,a5
    80007fe8:	47c1                	li	a5,16
    80007fea:	00f70a63          	beq	a4,a5,80007ffe <sys_unlink+0x160>
    panic("unlink: writei");
    80007fee:	00004517          	auipc	a0,0x4
    80007ff2:	67250513          	addi	a0,a0,1650 # 8000c660 <etext+0x660>
    80007ff6:	ffff9097          	auipc	ra,0xffff9
    80007ffa:	c96080e7          	jalr	-874(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    80007ffe:	fe043783          	ld	a5,-32(s0)
    80008002:	04479783          	lh	a5,68(a5)
    80008006:	0007871b          	sext.w	a4,a5
    8000800a:	4785                	li	a5,1
    8000800c:	02f71963          	bne	a4,a5,8000803e <sys_unlink+0x1a0>
    dp->nlink--;
    80008010:	fe843783          	ld	a5,-24(s0)
    80008014:	04a79783          	lh	a5,74(a5)
    80008018:	17c2                	slli	a5,a5,0x30
    8000801a:	93c1                	srli	a5,a5,0x30
    8000801c:	37fd                	addiw	a5,a5,-1
    8000801e:	17c2                	slli	a5,a5,0x30
    80008020:	93c1                	srli	a5,a5,0x30
    80008022:	0107971b          	slliw	a4,a5,0x10
    80008026:	4107571b          	sraiw	a4,a4,0x10
    8000802a:	fe843783          	ld	a5,-24(s0)
    8000802e:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008032:	fe843503          	ld	a0,-24(s0)
    80008036:	ffffd097          	auipc	ra,0xffffd
    8000803a:	044080e7          	jalr	68(ra) # 8000507a <iupdate>
  }
  iunlockput(dp);
    8000803e:	fe843503          	ld	a0,-24(s0)
    80008042:	ffffd097          	auipc	ra,0xffffd
    80008046:	4e6080e7          	jalr	1254(ra) # 80005528 <iunlockput>

  ip->nlink--;
    8000804a:	fe043783          	ld	a5,-32(s0)
    8000804e:	04a79783          	lh	a5,74(a5)
    80008052:	17c2                	slli	a5,a5,0x30
    80008054:	93c1                	srli	a5,a5,0x30
    80008056:	37fd                	addiw	a5,a5,-1
    80008058:	17c2                	slli	a5,a5,0x30
    8000805a:	93c1                	srli	a5,a5,0x30
    8000805c:	0107971b          	slliw	a4,a5,0x10
    80008060:	4107571b          	sraiw	a4,a4,0x10
    80008064:	fe043783          	ld	a5,-32(s0)
    80008068:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    8000806c:	fe043503          	ld	a0,-32(s0)
    80008070:	ffffd097          	auipc	ra,0xffffd
    80008074:	00a080e7          	jalr	10(ra) # 8000507a <iupdate>
  iunlockput(ip);
    80008078:	fe043503          	ld	a0,-32(s0)
    8000807c:	ffffd097          	auipc	ra,0xffffd
    80008080:	4ac080e7          	jalr	1196(ra) # 80005528 <iunlockput>

  end_op();
    80008084:	ffffe097          	auipc	ra,0xffffe
    80008088:	392080e7          	jalr	914(ra) # 80006416 <end_op>

  return 0;
    8000808c:	4781                	li	a5,0
    8000808e:	a839                	j	800080ac <sys_unlink+0x20e>
    goto bad;
    80008090:	0001                	nop
    80008092:	a011                	j	80008096 <sys_unlink+0x1f8>
    goto bad;
    80008094:	0001                	nop

bad:
  iunlockput(dp);
    80008096:	fe843503          	ld	a0,-24(s0)
    8000809a:	ffffd097          	auipc	ra,0xffffd
    8000809e:	48e080e7          	jalr	1166(ra) # 80005528 <iunlockput>
  end_op();
    800080a2:	ffffe097          	auipc	ra,0xffffe
    800080a6:	374080e7          	jalr	884(ra) # 80006416 <end_op>
  return -1;
    800080aa:	57fd                	li	a5,-1
}
    800080ac:	853e                	mv	a0,a5
    800080ae:	60ae                	ld	ra,200(sp)
    800080b0:	640e                	ld	s0,192(sp)
    800080b2:	6169                	addi	sp,sp,208
    800080b4:	8082                	ret

00000000800080b6 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    800080b6:	7139                	addi	sp,sp,-64
    800080b8:	fc06                	sd	ra,56(sp)
    800080ba:	f822                	sd	s0,48(sp)
    800080bc:	0080                	addi	s0,sp,64
    800080be:	fca43423          	sd	a0,-56(s0)
    800080c2:	87ae                	mv	a5,a1
    800080c4:	8736                	mv	a4,a3
    800080c6:	fcf41323          	sh	a5,-58(s0)
    800080ca:	87b2                	mv	a5,a2
    800080cc:	fcf41223          	sh	a5,-60(s0)
    800080d0:	87ba                	mv	a5,a4
    800080d2:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    800080d6:	fd040793          	addi	a5,s0,-48
    800080da:	85be                	mv	a1,a5
    800080dc:	fc843503          	ld	a0,-56(s0)
    800080e0:	ffffe097          	auipc	ra,0xffffe
    800080e4:	f3c080e7          	jalr	-196(ra) # 8000601c <nameiparent>
    800080e8:	fea43423          	sd	a0,-24(s0)
    800080ec:	fe843783          	ld	a5,-24(s0)
    800080f0:	e399                	bnez	a5,800080f6 <create+0x40>
    return 0;
    800080f2:	4781                	li	a5,0
    800080f4:	a2ed                	j	800082de <create+0x228>

  ilock(dp);
    800080f6:	fe843503          	ld	a0,-24(s0)
    800080fa:	ffffd097          	auipc	ra,0xffffd
    800080fe:	1d0080e7          	jalr	464(ra) # 800052ca <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008102:	fd040793          	addi	a5,s0,-48
    80008106:	4601                	li	a2,0
    80008108:	85be                	mv	a1,a5
    8000810a:	fe843503          	ld	a0,-24(s0)
    8000810e:	ffffe097          	auipc	ra,0xffffe
    80008112:	aec080e7          	jalr	-1300(ra) # 80005bfa <dirlookup>
    80008116:	fea43023          	sd	a0,-32(s0)
    8000811a:	fe043783          	ld	a5,-32(s0)
    8000811e:	c3ad                	beqz	a5,80008180 <create+0xca>
    iunlockput(dp);
    80008120:	fe843503          	ld	a0,-24(s0)
    80008124:	ffffd097          	auipc	ra,0xffffd
    80008128:	404080e7          	jalr	1028(ra) # 80005528 <iunlockput>
    ilock(ip);
    8000812c:	fe043503          	ld	a0,-32(s0)
    80008130:	ffffd097          	auipc	ra,0xffffd
    80008134:	19a080e7          	jalr	410(ra) # 800052ca <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80008138:	fc641783          	lh	a5,-58(s0)
    8000813c:	0007871b          	sext.w	a4,a5
    80008140:	4789                	li	a5,2
    80008142:	02f71763          	bne	a4,a5,80008170 <create+0xba>
    80008146:	fe043783          	ld	a5,-32(s0)
    8000814a:	04479783          	lh	a5,68(a5)
    8000814e:	0007871b          	sext.w	a4,a5
    80008152:	4789                	li	a5,2
    80008154:	00f70b63          	beq	a4,a5,8000816a <create+0xb4>
    80008158:	fe043783          	ld	a5,-32(s0)
    8000815c:	04479783          	lh	a5,68(a5)
    80008160:	0007871b          	sext.w	a4,a5
    80008164:	478d                	li	a5,3
    80008166:	00f71563          	bne	a4,a5,80008170 <create+0xba>
      return ip;
    8000816a:	fe043783          	ld	a5,-32(s0)
    8000816e:	aa85                	j	800082de <create+0x228>
    iunlockput(ip);
    80008170:	fe043503          	ld	a0,-32(s0)
    80008174:	ffffd097          	auipc	ra,0xffffd
    80008178:	3b4080e7          	jalr	948(ra) # 80005528 <iunlockput>
    return 0;
    8000817c:	4781                	li	a5,0
    8000817e:	a285                	j	800082de <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    80008180:	fe843783          	ld	a5,-24(s0)
    80008184:	439c                	lw	a5,0(a5)
    80008186:	fc641703          	lh	a4,-58(s0)
    8000818a:	85ba                	mv	a1,a4
    8000818c:	853e                	mv	a0,a5
    8000818e:	ffffd097          	auipc	ra,0xffffd
    80008192:	dee080e7          	jalr	-530(ra) # 80004f7c <ialloc>
    80008196:	fea43023          	sd	a0,-32(s0)
    8000819a:	fe043783          	ld	a5,-32(s0)
    8000819e:	eb89                	bnez	a5,800081b0 <create+0xfa>
    iunlockput(dp);
    800081a0:	fe843503          	ld	a0,-24(s0)
    800081a4:	ffffd097          	auipc	ra,0xffffd
    800081a8:	384080e7          	jalr	900(ra) # 80005528 <iunlockput>
    return 0;
    800081ac:	4781                	li	a5,0
    800081ae:	aa05                	j	800082de <create+0x228>
  }

  ilock(ip);
    800081b0:	fe043503          	ld	a0,-32(s0)
    800081b4:	ffffd097          	auipc	ra,0xffffd
    800081b8:	116080e7          	jalr	278(ra) # 800052ca <ilock>
  ip->major = major;
    800081bc:	fe043783          	ld	a5,-32(s0)
    800081c0:	fc445703          	lhu	a4,-60(s0)
    800081c4:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    800081c8:	fe043783          	ld	a5,-32(s0)
    800081cc:	fc245703          	lhu	a4,-62(s0)
    800081d0:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    800081d4:	fe043783          	ld	a5,-32(s0)
    800081d8:	4705                	li	a4,1
    800081da:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800081de:	fe043503          	ld	a0,-32(s0)
    800081e2:	ffffd097          	auipc	ra,0xffffd
    800081e6:	e98080e7          	jalr	-360(ra) # 8000507a <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    800081ea:	fc641783          	lh	a5,-58(s0)
    800081ee:	0007871b          	sext.w	a4,a5
    800081f2:	4785                	li	a5,1
    800081f4:	04f71463          	bne	a4,a5,8000823c <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    800081f8:	fe043783          	ld	a5,-32(s0)
    800081fc:	43dc                	lw	a5,4(a5)
    800081fe:	863e                	mv	a2,a5
    80008200:	00004597          	auipc	a1,0x4
    80008204:	43858593          	addi	a1,a1,1080 # 8000c638 <etext+0x638>
    80008208:	fe043503          	ld	a0,-32(s0)
    8000820c:	ffffe097          	auipc	ra,0xffffe
    80008210:	ad6080e7          	jalr	-1322(ra) # 80005ce2 <dirlink>
    80008214:	87aa                	mv	a5,a0
    80008216:	0807ca63          	bltz	a5,800082aa <create+0x1f4>
    8000821a:	fe843783          	ld	a5,-24(s0)
    8000821e:	43dc                	lw	a5,4(a5)
    80008220:	863e                	mv	a2,a5
    80008222:	00004597          	auipc	a1,0x4
    80008226:	41e58593          	addi	a1,a1,1054 # 8000c640 <etext+0x640>
    8000822a:	fe043503          	ld	a0,-32(s0)
    8000822e:	ffffe097          	auipc	ra,0xffffe
    80008232:	ab4080e7          	jalr	-1356(ra) # 80005ce2 <dirlink>
    80008236:	87aa                	mv	a5,a0
    80008238:	0607c963          	bltz	a5,800082aa <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    8000823c:	fe043783          	ld	a5,-32(s0)
    80008240:	43d8                	lw	a4,4(a5)
    80008242:	fd040793          	addi	a5,s0,-48
    80008246:	863a                	mv	a2,a4
    80008248:	85be                	mv	a1,a5
    8000824a:	fe843503          	ld	a0,-24(s0)
    8000824e:	ffffe097          	auipc	ra,0xffffe
    80008252:	a94080e7          	jalr	-1388(ra) # 80005ce2 <dirlink>
    80008256:	87aa                	mv	a5,a0
    80008258:	0407cb63          	bltz	a5,800082ae <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    8000825c:	fc641783          	lh	a5,-58(s0)
    80008260:	0007871b          	sext.w	a4,a5
    80008264:	4785                	li	a5,1
    80008266:	02f71963          	bne	a4,a5,80008298 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    8000826a:	fe843783          	ld	a5,-24(s0)
    8000826e:	04a79783          	lh	a5,74(a5)
    80008272:	17c2                	slli	a5,a5,0x30
    80008274:	93c1                	srli	a5,a5,0x30
    80008276:	2785                	addiw	a5,a5,1
    80008278:	17c2                	slli	a5,a5,0x30
    8000827a:	93c1                	srli	a5,a5,0x30
    8000827c:	0107971b          	slliw	a4,a5,0x10
    80008280:	4107571b          	sraiw	a4,a4,0x10
    80008284:	fe843783          	ld	a5,-24(s0)
    80008288:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    8000828c:	fe843503          	ld	a0,-24(s0)
    80008290:	ffffd097          	auipc	ra,0xffffd
    80008294:	dea080e7          	jalr	-534(ra) # 8000507a <iupdate>
  }

  iunlockput(dp);
    80008298:	fe843503          	ld	a0,-24(s0)
    8000829c:	ffffd097          	auipc	ra,0xffffd
    800082a0:	28c080e7          	jalr	652(ra) # 80005528 <iunlockput>

  return ip;
    800082a4:	fe043783          	ld	a5,-32(s0)
    800082a8:	a81d                	j	800082de <create+0x228>
      goto fail;
    800082aa:	0001                	nop
    800082ac:	a011                	j	800082b0 <create+0x1fa>
    goto fail;
    800082ae:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    800082b0:	fe043783          	ld	a5,-32(s0)
    800082b4:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    800082b8:	fe043503          	ld	a0,-32(s0)
    800082bc:	ffffd097          	auipc	ra,0xffffd
    800082c0:	dbe080e7          	jalr	-578(ra) # 8000507a <iupdate>
  iunlockput(ip);
    800082c4:	fe043503          	ld	a0,-32(s0)
    800082c8:	ffffd097          	auipc	ra,0xffffd
    800082cc:	260080e7          	jalr	608(ra) # 80005528 <iunlockput>
  iunlockput(dp);
    800082d0:	fe843503          	ld	a0,-24(s0)
    800082d4:	ffffd097          	auipc	ra,0xffffd
    800082d8:	254080e7          	jalr	596(ra) # 80005528 <iunlockput>
  return 0;
    800082dc:	4781                	li	a5,0
}
    800082de:	853e                	mv	a0,a5
    800082e0:	70e2                	ld	ra,56(sp)
    800082e2:	7442                	ld	s0,48(sp)
    800082e4:	6121                	addi	sp,sp,64
    800082e6:	8082                	ret

00000000800082e8 <sys_open>:

uint64
sys_open(void)
{
    800082e8:	7131                	addi	sp,sp,-192
    800082ea:	fd06                	sd	ra,184(sp)
    800082ec:	f922                	sd	s0,176(sp)
    800082ee:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    800082f0:	f4c40793          	addi	a5,s0,-180
    800082f4:	85be                	mv	a1,a5
    800082f6:	4505                	li	a0,1
    800082f8:	ffffc097          	auipc	ra,0xffffc
    800082fc:	02a080e7          	jalr	42(ra) # 80004322 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    80008300:	f5040793          	addi	a5,s0,-176
    80008304:	08000613          	li	a2,128
    80008308:	85be                	mv	a1,a5
    8000830a:	4501                	li	a0,0
    8000830c:	ffffc097          	auipc	ra,0xffffc
    80008310:	07e080e7          	jalr	126(ra) # 8000438a <argstr>
    80008314:	87aa                	mv	a5,a0
    80008316:	fef42223          	sw	a5,-28(s0)
    8000831a:	fe442783          	lw	a5,-28(s0)
    8000831e:	2781                	sext.w	a5,a5
    80008320:	0007d463          	bgez	a5,80008328 <sys_open+0x40>
    return -1;
    80008324:	57fd                	li	a5,-1
    80008326:	a429                	j	80008530 <sys_open+0x248>

  begin_op();
    80008328:	ffffe097          	auipc	ra,0xffffe
    8000832c:	02c080e7          	jalr	44(ra) # 80006354 <begin_op>

  if(omode & O_CREATE){
    80008330:	f4c42783          	lw	a5,-180(s0)
    80008334:	2007f793          	andi	a5,a5,512
    80008338:	2781                	sext.w	a5,a5
    8000833a:	c795                	beqz	a5,80008366 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    8000833c:	f5040793          	addi	a5,s0,-176
    80008340:	4681                	li	a3,0
    80008342:	4601                	li	a2,0
    80008344:	4589                	li	a1,2
    80008346:	853e                	mv	a0,a5
    80008348:	00000097          	auipc	ra,0x0
    8000834c:	d6e080e7          	jalr	-658(ra) # 800080b6 <create>
    80008350:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    80008354:	fe843783          	ld	a5,-24(s0)
    80008358:	e7bd                	bnez	a5,800083c6 <sys_open+0xde>
      end_op();
    8000835a:	ffffe097          	auipc	ra,0xffffe
    8000835e:	0bc080e7          	jalr	188(ra) # 80006416 <end_op>
      return -1;
    80008362:	57fd                	li	a5,-1
    80008364:	a2f1                	j	80008530 <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    80008366:	f5040793          	addi	a5,s0,-176
    8000836a:	853e                	mv	a0,a5
    8000836c:	ffffe097          	auipc	ra,0xffffe
    80008370:	c84080e7          	jalr	-892(ra) # 80005ff0 <namei>
    80008374:	fea43423          	sd	a0,-24(s0)
    80008378:	fe843783          	ld	a5,-24(s0)
    8000837c:	e799                	bnez	a5,8000838a <sys_open+0xa2>
      end_op();
    8000837e:	ffffe097          	auipc	ra,0xffffe
    80008382:	098080e7          	jalr	152(ra) # 80006416 <end_op>
      return -1;
    80008386:	57fd                	li	a5,-1
    80008388:	a265                	j	80008530 <sys_open+0x248>
    }
    ilock(ip);
    8000838a:	fe843503          	ld	a0,-24(s0)
    8000838e:	ffffd097          	auipc	ra,0xffffd
    80008392:	f3c080e7          	jalr	-196(ra) # 800052ca <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    80008396:	fe843783          	ld	a5,-24(s0)
    8000839a:	04479783          	lh	a5,68(a5)
    8000839e:	0007871b          	sext.w	a4,a5
    800083a2:	4785                	li	a5,1
    800083a4:	02f71163          	bne	a4,a5,800083c6 <sys_open+0xde>
    800083a8:	f4c42783          	lw	a5,-180(s0)
    800083ac:	cf89                	beqz	a5,800083c6 <sys_open+0xde>
      iunlockput(ip);
    800083ae:	fe843503          	ld	a0,-24(s0)
    800083b2:	ffffd097          	auipc	ra,0xffffd
    800083b6:	176080e7          	jalr	374(ra) # 80005528 <iunlockput>
      end_op();
    800083ba:	ffffe097          	auipc	ra,0xffffe
    800083be:	05c080e7          	jalr	92(ra) # 80006416 <end_op>
      return -1;
    800083c2:	57fd                	li	a5,-1
    800083c4:	a2b5                	j	80008530 <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800083c6:	fe843783          	ld	a5,-24(s0)
    800083ca:	04479783          	lh	a5,68(a5)
    800083ce:	0007871b          	sext.w	a4,a5
    800083d2:	478d                	li	a5,3
    800083d4:	02f71e63          	bne	a4,a5,80008410 <sys_open+0x128>
    800083d8:	fe843783          	ld	a5,-24(s0)
    800083dc:	04679783          	lh	a5,70(a5)
    800083e0:	2781                	sext.w	a5,a5
    800083e2:	0007cb63          	bltz	a5,800083f8 <sys_open+0x110>
    800083e6:	fe843783          	ld	a5,-24(s0)
    800083ea:	04679783          	lh	a5,70(a5)
    800083ee:	0007871b          	sext.w	a4,a5
    800083f2:	47a5                	li	a5,9
    800083f4:	00e7de63          	bge	a5,a4,80008410 <sys_open+0x128>
    iunlockput(ip);
    800083f8:	fe843503          	ld	a0,-24(s0)
    800083fc:	ffffd097          	auipc	ra,0xffffd
    80008400:	12c080e7          	jalr	300(ra) # 80005528 <iunlockput>
    end_op();
    80008404:	ffffe097          	auipc	ra,0xffffe
    80008408:	012080e7          	jalr	18(ra) # 80006416 <end_op>
    return -1;
    8000840c:	57fd                	li	a5,-1
    8000840e:	a20d                	j	80008530 <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008410:	ffffe097          	auipc	ra,0xffffe
    80008414:	4f4080e7          	jalr	1268(ra) # 80006904 <filealloc>
    80008418:	fca43c23          	sd	a0,-40(s0)
    8000841c:	fd843783          	ld	a5,-40(s0)
    80008420:	cf99                	beqz	a5,8000843e <sys_open+0x156>
    80008422:	fd843503          	ld	a0,-40(s0)
    80008426:	fffff097          	auipc	ra,0xfffff
    8000842a:	5e8080e7          	jalr	1512(ra) # 80007a0e <fdalloc>
    8000842e:	87aa                	mv	a5,a0
    80008430:	fcf42a23          	sw	a5,-44(s0)
    80008434:	fd442783          	lw	a5,-44(s0)
    80008438:	2781                	sext.w	a5,a5
    8000843a:	0207d763          	bgez	a5,80008468 <sys_open+0x180>
    if(f)
    8000843e:	fd843783          	ld	a5,-40(s0)
    80008442:	c799                	beqz	a5,80008450 <sys_open+0x168>
      fileclose(f);
    80008444:	fd843503          	ld	a0,-40(s0)
    80008448:	ffffe097          	auipc	ra,0xffffe
    8000844c:	5a6080e7          	jalr	1446(ra) # 800069ee <fileclose>
    iunlockput(ip);
    80008450:	fe843503          	ld	a0,-24(s0)
    80008454:	ffffd097          	auipc	ra,0xffffd
    80008458:	0d4080e7          	jalr	212(ra) # 80005528 <iunlockput>
    end_op();
    8000845c:	ffffe097          	auipc	ra,0xffffe
    80008460:	fba080e7          	jalr	-70(ra) # 80006416 <end_op>
    return -1;
    80008464:	57fd                	li	a5,-1
    80008466:	a0e9                	j	80008530 <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    80008468:	fe843783          	ld	a5,-24(s0)
    8000846c:	04479783          	lh	a5,68(a5)
    80008470:	0007871b          	sext.w	a4,a5
    80008474:	478d                	li	a5,3
    80008476:	00f71f63          	bne	a4,a5,80008494 <sys_open+0x1ac>
    f->type = FD_DEVICE;
    8000847a:	fd843783          	ld	a5,-40(s0)
    8000847e:	470d                	li	a4,3
    80008480:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    80008482:	fe843783          	ld	a5,-24(s0)
    80008486:	04679703          	lh	a4,70(a5)
    8000848a:	fd843783          	ld	a5,-40(s0)
    8000848e:	02e79223          	sh	a4,36(a5)
    80008492:	a809                	j	800084a4 <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    80008494:	fd843783          	ld	a5,-40(s0)
    80008498:	4709                	li	a4,2
    8000849a:	c398                	sw	a4,0(a5)
    f->off = 0;
    8000849c:	fd843783          	ld	a5,-40(s0)
    800084a0:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    800084a4:	fd843783          	ld	a5,-40(s0)
    800084a8:	fe843703          	ld	a4,-24(s0)
    800084ac:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800084ae:	f4c42783          	lw	a5,-180(s0)
    800084b2:	8b85                	andi	a5,a5,1
    800084b4:	2781                	sext.w	a5,a5
    800084b6:	0017b793          	seqz	a5,a5
    800084ba:	0ff7f793          	andi	a5,a5,255
    800084be:	873e                	mv	a4,a5
    800084c0:	fd843783          	ld	a5,-40(s0)
    800084c4:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    800084c8:	f4c42783          	lw	a5,-180(s0)
    800084cc:	8b85                	andi	a5,a5,1
    800084ce:	2781                	sext.w	a5,a5
    800084d0:	e791                	bnez	a5,800084dc <sys_open+0x1f4>
    800084d2:	f4c42783          	lw	a5,-180(s0)
    800084d6:	8b89                	andi	a5,a5,2
    800084d8:	2781                	sext.w	a5,a5
    800084da:	c399                	beqz	a5,800084e0 <sys_open+0x1f8>
    800084dc:	4785                	li	a5,1
    800084de:	a011                	j	800084e2 <sys_open+0x1fa>
    800084e0:	4781                	li	a5,0
    800084e2:	0ff7f713          	andi	a4,a5,255
    800084e6:	fd843783          	ld	a5,-40(s0)
    800084ea:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    800084ee:	f4c42783          	lw	a5,-180(s0)
    800084f2:	4007f793          	andi	a5,a5,1024
    800084f6:	2781                	sext.w	a5,a5
    800084f8:	c385                	beqz	a5,80008518 <sys_open+0x230>
    800084fa:	fe843783          	ld	a5,-24(s0)
    800084fe:	04479783          	lh	a5,68(a5)
    80008502:	0007871b          	sext.w	a4,a5
    80008506:	4789                	li	a5,2
    80008508:	00f71863          	bne	a4,a5,80008518 <sys_open+0x230>
    itrunc(ip);
    8000850c:	fe843503          	ld	a0,-24(s0)
    80008510:	ffffd097          	auipc	ra,0xffffd
    80008514:	1c2080e7          	jalr	450(ra) # 800056d2 <itrunc>
  }

  iunlock(ip);
    80008518:	fe843503          	ld	a0,-24(s0)
    8000851c:	ffffd097          	auipc	ra,0xffffd
    80008520:	ee2080e7          	jalr	-286(ra) # 800053fe <iunlock>
  end_op();
    80008524:	ffffe097          	auipc	ra,0xffffe
    80008528:	ef2080e7          	jalr	-270(ra) # 80006416 <end_op>

  return fd;
    8000852c:	fd442783          	lw	a5,-44(s0)
}
    80008530:	853e                	mv	a0,a5
    80008532:	70ea                	ld	ra,184(sp)
    80008534:	744a                	ld	s0,176(sp)
    80008536:	6129                	addi	sp,sp,192
    80008538:	8082                	ret

000000008000853a <sys_mkdir>:

uint64
sys_mkdir(void)
{
    8000853a:	7135                	addi	sp,sp,-160
    8000853c:	ed06                	sd	ra,152(sp)
    8000853e:	e922                	sd	s0,144(sp)
    80008540:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    80008542:	ffffe097          	auipc	ra,0xffffe
    80008546:	e12080e7          	jalr	-494(ra) # 80006354 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    8000854a:	f6840793          	addi	a5,s0,-152
    8000854e:	08000613          	li	a2,128
    80008552:	85be                	mv	a1,a5
    80008554:	4501                	li	a0,0
    80008556:	ffffc097          	auipc	ra,0xffffc
    8000855a:	e34080e7          	jalr	-460(ra) # 8000438a <argstr>
    8000855e:	87aa                	mv	a5,a0
    80008560:	0207c163          	bltz	a5,80008582 <sys_mkdir+0x48>
    80008564:	f6840793          	addi	a5,s0,-152
    80008568:	4681                	li	a3,0
    8000856a:	4601                	li	a2,0
    8000856c:	4585                	li	a1,1
    8000856e:	853e                	mv	a0,a5
    80008570:	00000097          	auipc	ra,0x0
    80008574:	b46080e7          	jalr	-1210(ra) # 800080b6 <create>
    80008578:	fea43423          	sd	a0,-24(s0)
    8000857c:	fe843783          	ld	a5,-24(s0)
    80008580:	e799                	bnez	a5,8000858e <sys_mkdir+0x54>
    end_op();
    80008582:	ffffe097          	auipc	ra,0xffffe
    80008586:	e94080e7          	jalr	-364(ra) # 80006416 <end_op>
    return -1;
    8000858a:	57fd                	li	a5,-1
    8000858c:	a821                	j	800085a4 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    8000858e:	fe843503          	ld	a0,-24(s0)
    80008592:	ffffd097          	auipc	ra,0xffffd
    80008596:	f96080e7          	jalr	-106(ra) # 80005528 <iunlockput>
  end_op();
    8000859a:	ffffe097          	auipc	ra,0xffffe
    8000859e:	e7c080e7          	jalr	-388(ra) # 80006416 <end_op>
  return 0;
    800085a2:	4781                	li	a5,0
}
    800085a4:	853e                	mv	a0,a5
    800085a6:	60ea                	ld	ra,152(sp)
    800085a8:	644a                	ld	s0,144(sp)
    800085aa:	610d                	addi	sp,sp,160
    800085ac:	8082                	ret

00000000800085ae <sys_mknod>:

uint64
sys_mknod(void)
{
    800085ae:	7135                	addi	sp,sp,-160
    800085b0:	ed06                	sd	ra,152(sp)
    800085b2:	e922                	sd	s0,144(sp)
    800085b4:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    800085b6:	ffffe097          	auipc	ra,0xffffe
    800085ba:	d9e080e7          	jalr	-610(ra) # 80006354 <begin_op>
  argint(1, &major);
    800085be:	f6440793          	addi	a5,s0,-156
    800085c2:	85be                	mv	a1,a5
    800085c4:	4505                	li	a0,1
    800085c6:	ffffc097          	auipc	ra,0xffffc
    800085ca:	d5c080e7          	jalr	-676(ra) # 80004322 <argint>
  argint(2, &minor);
    800085ce:	f6040793          	addi	a5,s0,-160
    800085d2:	85be                	mv	a1,a5
    800085d4:	4509                	li	a0,2
    800085d6:	ffffc097          	auipc	ra,0xffffc
    800085da:	d4c080e7          	jalr	-692(ra) # 80004322 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    800085de:	f6840793          	addi	a5,s0,-152
    800085e2:	08000613          	li	a2,128
    800085e6:	85be                	mv	a1,a5
    800085e8:	4501                	li	a0,0
    800085ea:	ffffc097          	auipc	ra,0xffffc
    800085ee:	da0080e7          	jalr	-608(ra) # 8000438a <argstr>
    800085f2:	87aa                	mv	a5,a0
    800085f4:	0207cc63          	bltz	a5,8000862c <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    800085f8:	f6442783          	lw	a5,-156(s0)
    800085fc:	0107971b          	slliw	a4,a5,0x10
    80008600:	4107571b          	sraiw	a4,a4,0x10
    80008604:	f6042783          	lw	a5,-160(s0)
    80008608:	0107969b          	slliw	a3,a5,0x10
    8000860c:	4106d69b          	sraiw	a3,a3,0x10
    80008610:	f6840793          	addi	a5,s0,-152
    80008614:	863a                	mv	a2,a4
    80008616:	458d                	li	a1,3
    80008618:	853e                	mv	a0,a5
    8000861a:	00000097          	auipc	ra,0x0
    8000861e:	a9c080e7          	jalr	-1380(ra) # 800080b6 <create>
    80008622:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008626:	fe843783          	ld	a5,-24(s0)
    8000862a:	e799                	bnez	a5,80008638 <sys_mknod+0x8a>
    end_op();
    8000862c:	ffffe097          	auipc	ra,0xffffe
    80008630:	dea080e7          	jalr	-534(ra) # 80006416 <end_op>
    return -1;
    80008634:	57fd                	li	a5,-1
    80008636:	a821                	j	8000864e <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008638:	fe843503          	ld	a0,-24(s0)
    8000863c:	ffffd097          	auipc	ra,0xffffd
    80008640:	eec080e7          	jalr	-276(ra) # 80005528 <iunlockput>
  end_op();
    80008644:	ffffe097          	auipc	ra,0xffffe
    80008648:	dd2080e7          	jalr	-558(ra) # 80006416 <end_op>
  return 0;
    8000864c:	4781                	li	a5,0
}
    8000864e:	853e                	mv	a0,a5
    80008650:	60ea                	ld	ra,152(sp)
    80008652:	644a                	ld	s0,144(sp)
    80008654:	610d                	addi	sp,sp,160
    80008656:	8082                	ret

0000000080008658 <sys_chdir>:

uint64
sys_chdir(void)
{
    80008658:	7135                	addi	sp,sp,-160
    8000865a:	ed06                	sd	ra,152(sp)
    8000865c:	e922                	sd	s0,144(sp)
    8000865e:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008660:	ffffa097          	auipc	ra,0xffffa
    80008664:	3b8080e7          	jalr	952(ra) # 80002a18 <myproc>
    80008668:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    8000866c:	ffffe097          	auipc	ra,0xffffe
    80008670:	ce8080e7          	jalr	-792(ra) # 80006354 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008674:	f6040793          	addi	a5,s0,-160
    80008678:	08000613          	li	a2,128
    8000867c:	85be                	mv	a1,a5
    8000867e:	4501                	li	a0,0
    80008680:	ffffc097          	auipc	ra,0xffffc
    80008684:	d0a080e7          	jalr	-758(ra) # 8000438a <argstr>
    80008688:	87aa                	mv	a5,a0
    8000868a:	0007ce63          	bltz	a5,800086a6 <sys_chdir+0x4e>
    8000868e:	f6040793          	addi	a5,s0,-160
    80008692:	853e                	mv	a0,a5
    80008694:	ffffe097          	auipc	ra,0xffffe
    80008698:	95c080e7          	jalr	-1700(ra) # 80005ff0 <namei>
    8000869c:	fea43023          	sd	a0,-32(s0)
    800086a0:	fe043783          	ld	a5,-32(s0)
    800086a4:	e799                	bnez	a5,800086b2 <sys_chdir+0x5a>
    end_op();
    800086a6:	ffffe097          	auipc	ra,0xffffe
    800086aa:	d70080e7          	jalr	-656(ra) # 80006416 <end_op>
    return -1;
    800086ae:	57fd                	li	a5,-1
    800086b0:	a0b5                	j	8000871c <sys_chdir+0xc4>
  }
  ilock(ip);
    800086b2:	fe043503          	ld	a0,-32(s0)
    800086b6:	ffffd097          	auipc	ra,0xffffd
    800086ba:	c14080e7          	jalr	-1004(ra) # 800052ca <ilock>
  if(ip->type != T_DIR){
    800086be:	fe043783          	ld	a5,-32(s0)
    800086c2:	04479783          	lh	a5,68(a5)
    800086c6:	0007871b          	sext.w	a4,a5
    800086ca:	4785                	li	a5,1
    800086cc:	00f70e63          	beq	a4,a5,800086e8 <sys_chdir+0x90>
    iunlockput(ip);
    800086d0:	fe043503          	ld	a0,-32(s0)
    800086d4:	ffffd097          	auipc	ra,0xffffd
    800086d8:	e54080e7          	jalr	-428(ra) # 80005528 <iunlockput>
    end_op();
    800086dc:	ffffe097          	auipc	ra,0xffffe
    800086e0:	d3a080e7          	jalr	-710(ra) # 80006416 <end_op>
    return -1;
    800086e4:	57fd                	li	a5,-1
    800086e6:	a81d                	j	8000871c <sys_chdir+0xc4>
  }
  iunlock(ip);
    800086e8:	fe043503          	ld	a0,-32(s0)
    800086ec:	ffffd097          	auipc	ra,0xffffd
    800086f0:	d12080e7          	jalr	-750(ra) # 800053fe <iunlock>
  iput(p->cwd);
    800086f4:	fe843783          	ld	a5,-24(s0)
    800086f8:	1507b783          	ld	a5,336(a5)
    800086fc:	853e                	mv	a0,a5
    800086fe:	ffffd097          	auipc	ra,0xffffd
    80008702:	d5a080e7          	jalr	-678(ra) # 80005458 <iput>
  end_op();
    80008706:	ffffe097          	auipc	ra,0xffffe
    8000870a:	d10080e7          	jalr	-752(ra) # 80006416 <end_op>
  p->cwd = ip;
    8000870e:	fe843783          	ld	a5,-24(s0)
    80008712:	fe043703          	ld	a4,-32(s0)
    80008716:	14e7b823          	sd	a4,336(a5)
  return 0;
    8000871a:	4781                	li	a5,0
}
    8000871c:	853e                	mv	a0,a5
    8000871e:	60ea                	ld	ra,152(sp)
    80008720:	644a                	ld	s0,144(sp)
    80008722:	610d                	addi	sp,sp,160
    80008724:	8082                	ret

0000000080008726 <sys_exec>:

uint64
sys_exec(void)
{
    80008726:	7161                	addi	sp,sp,-432
    80008728:	f706                	sd	ra,424(sp)
    8000872a:	f322                	sd	s0,416(sp)
    8000872c:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    8000872e:	e6040793          	addi	a5,s0,-416
    80008732:	85be                	mv	a1,a5
    80008734:	4505                	li	a0,1
    80008736:	ffffc097          	auipc	ra,0xffffc
    8000873a:	c22080e7          	jalr	-990(ra) # 80004358 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    8000873e:	f6840793          	addi	a5,s0,-152
    80008742:	08000613          	li	a2,128
    80008746:	85be                	mv	a1,a5
    80008748:	4501                	li	a0,0
    8000874a:	ffffc097          	auipc	ra,0xffffc
    8000874e:	c40080e7          	jalr	-960(ra) # 8000438a <argstr>
    80008752:	87aa                	mv	a5,a0
    80008754:	0007d463          	bgez	a5,8000875c <sys_exec+0x36>
    return -1;
    80008758:	57fd                	li	a5,-1
    8000875a:	a249                	j	800088dc <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    8000875c:	e6840793          	addi	a5,s0,-408
    80008760:	10000613          	li	a2,256
    80008764:	4581                	li	a1,0
    80008766:	853e                	mv	a0,a5
    80008768:	ffff9097          	auipc	ra,0xffff9
    8000876c:	da8080e7          	jalr	-600(ra) # 80001510 <memset>
  for(i=0;; i++){
    80008770:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    80008774:	fec42783          	lw	a5,-20(s0)
    80008778:	873e                	mv	a4,a5
    8000877a:	47fd                	li	a5,31
    8000877c:	10e7e463          	bltu	a5,a4,80008884 <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008780:	fec42783          	lw	a5,-20(s0)
    80008784:	00379713          	slli	a4,a5,0x3
    80008788:	e6043783          	ld	a5,-416(s0)
    8000878c:	97ba                	add	a5,a5,a4
    8000878e:	e5840713          	addi	a4,s0,-424
    80008792:	85ba                	mv	a1,a4
    80008794:	853e                	mv	a0,a5
    80008796:	ffffc097          	auipc	ra,0xffffc
    8000879a:	a1a080e7          	jalr	-1510(ra) # 800041b0 <fetchaddr>
    8000879e:	87aa                	mv	a5,a0
    800087a0:	0e07c463          	bltz	a5,80008888 <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    800087a4:	e5843783          	ld	a5,-424(s0)
    800087a8:	eb95                	bnez	a5,800087dc <sys_exec+0xb6>
      argv[i] = 0;
    800087aa:	fec42783          	lw	a5,-20(s0)
    800087ae:	078e                	slli	a5,a5,0x3
    800087b0:	ff040713          	addi	a4,s0,-16
    800087b4:	97ba                	add	a5,a5,a4
    800087b6:	e607bc23          	sd	zero,-392(a5)
      break;
    800087ba:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    800087bc:	e6840713          	addi	a4,s0,-408
    800087c0:	f6840793          	addi	a5,s0,-152
    800087c4:	85ba                	mv	a1,a4
    800087c6:	853e                	mv	a0,a5
    800087c8:	fffff097          	auipc	ra,0xfffff
    800087cc:	c1e080e7          	jalr	-994(ra) # 800073e6 <exec>
    800087d0:	87aa                	mv	a5,a0
    800087d2:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800087d6:	fe042623          	sw	zero,-20(s0)
    800087da:	a059                	j	80008860 <sys_exec+0x13a>
    argv[i] = kalloc();
    800087dc:	ffff9097          	auipc	ra,0xffff9
    800087e0:	9fa080e7          	jalr	-1542(ra) # 800011d6 <kalloc>
    800087e4:	872a                	mv	a4,a0
    800087e6:	fec42783          	lw	a5,-20(s0)
    800087ea:	078e                	slli	a5,a5,0x3
    800087ec:	ff040693          	addi	a3,s0,-16
    800087f0:	97b6                	add	a5,a5,a3
    800087f2:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    800087f6:	fec42783          	lw	a5,-20(s0)
    800087fa:	078e                	slli	a5,a5,0x3
    800087fc:	ff040713          	addi	a4,s0,-16
    80008800:	97ba                	add	a5,a5,a4
    80008802:	e787b783          	ld	a5,-392(a5)
    80008806:	c3d9                	beqz	a5,8000888c <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008808:	e5843703          	ld	a4,-424(s0)
    8000880c:	fec42783          	lw	a5,-20(s0)
    80008810:	078e                	slli	a5,a5,0x3
    80008812:	ff040693          	addi	a3,s0,-16
    80008816:	97b6                	add	a5,a5,a3
    80008818:	e787b783          	ld	a5,-392(a5)
    8000881c:	6605                	lui	a2,0x1
    8000881e:	85be                	mv	a1,a5
    80008820:	853a                	mv	a0,a4
    80008822:	ffffc097          	auipc	ra,0xffffc
    80008826:	9fc080e7          	jalr	-1540(ra) # 8000421e <fetchstr>
    8000882a:	87aa                	mv	a5,a0
    8000882c:	0607c263          	bltz	a5,80008890 <sys_exec+0x16a>
  for(i=0;; i++){
    80008830:	fec42783          	lw	a5,-20(s0)
    80008834:	2785                	addiw	a5,a5,1
    80008836:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    8000883a:	bf2d                	j	80008774 <sys_exec+0x4e>
    kfree(argv[i]);
    8000883c:	fec42783          	lw	a5,-20(s0)
    80008840:	078e                	slli	a5,a5,0x3
    80008842:	ff040713          	addi	a4,s0,-16
    80008846:	97ba                	add	a5,a5,a4
    80008848:	e787b783          	ld	a5,-392(a5)
    8000884c:	853e                	mv	a0,a5
    8000884e:	ffff9097          	auipc	ra,0xffff9
    80008852:	8e2080e7          	jalr	-1822(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008856:	fec42783          	lw	a5,-20(s0)
    8000885a:	2785                	addiw	a5,a5,1
    8000885c:	fef42623          	sw	a5,-20(s0)
    80008860:	fec42783          	lw	a5,-20(s0)
    80008864:	873e                	mv	a4,a5
    80008866:	47fd                	li	a5,31
    80008868:	00e7eb63          	bltu	a5,a4,8000887e <sys_exec+0x158>
    8000886c:	fec42783          	lw	a5,-20(s0)
    80008870:	078e                	slli	a5,a5,0x3
    80008872:	ff040713          	addi	a4,s0,-16
    80008876:	97ba                	add	a5,a5,a4
    80008878:	e787b783          	ld	a5,-392(a5)
    8000887c:	f3e1                	bnez	a5,8000883c <sys_exec+0x116>

  return ret;
    8000887e:	fe842783          	lw	a5,-24(s0)
    80008882:	a8a9                	j	800088dc <sys_exec+0x1b6>
      goto bad;
    80008884:	0001                	nop
    80008886:	a031                	j	80008892 <sys_exec+0x16c>
      goto bad;
    80008888:	0001                	nop
    8000888a:	a021                	j	80008892 <sys_exec+0x16c>
      goto bad;
    8000888c:	0001                	nop
    8000888e:	a011                	j	80008892 <sys_exec+0x16c>
      goto bad;
    80008890:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008892:	fe042623          	sw	zero,-20(s0)
    80008896:	a01d                	j	800088bc <sys_exec+0x196>
    kfree(argv[i]);
    80008898:	fec42783          	lw	a5,-20(s0)
    8000889c:	078e                	slli	a5,a5,0x3
    8000889e:	ff040713          	addi	a4,s0,-16
    800088a2:	97ba                	add	a5,a5,a4
    800088a4:	e787b783          	ld	a5,-392(a5)
    800088a8:	853e                	mv	a0,a5
    800088aa:	ffff9097          	auipc	ra,0xffff9
    800088ae:	886080e7          	jalr	-1914(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088b2:	fec42783          	lw	a5,-20(s0)
    800088b6:	2785                	addiw	a5,a5,1
    800088b8:	fef42623          	sw	a5,-20(s0)
    800088bc:	fec42783          	lw	a5,-20(s0)
    800088c0:	873e                	mv	a4,a5
    800088c2:	47fd                	li	a5,31
    800088c4:	00e7eb63          	bltu	a5,a4,800088da <sys_exec+0x1b4>
    800088c8:	fec42783          	lw	a5,-20(s0)
    800088cc:	078e                	slli	a5,a5,0x3
    800088ce:	ff040713          	addi	a4,s0,-16
    800088d2:	97ba                	add	a5,a5,a4
    800088d4:	e787b783          	ld	a5,-392(a5)
    800088d8:	f3e1                	bnez	a5,80008898 <sys_exec+0x172>
  return -1;
    800088da:	57fd                	li	a5,-1
}
    800088dc:	853e                	mv	a0,a5
    800088de:	70ba                	ld	ra,424(sp)
    800088e0:	741a                	ld	s0,416(sp)
    800088e2:	615d                	addi	sp,sp,432
    800088e4:	8082                	ret

00000000800088e6 <sys_pipe>:

uint64
sys_pipe(void)
{
    800088e6:	7139                	addi	sp,sp,-64
    800088e8:	fc06                	sd	ra,56(sp)
    800088ea:	f822                	sd	s0,48(sp)
    800088ec:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    800088ee:	ffffa097          	auipc	ra,0xffffa
    800088f2:	12a080e7          	jalr	298(ra) # 80002a18 <myproc>
    800088f6:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    800088fa:	fe040793          	addi	a5,s0,-32
    800088fe:	85be                	mv	a1,a5
    80008900:	4501                	li	a0,0
    80008902:	ffffc097          	auipc	ra,0xffffc
    80008906:	a56080e7          	jalr	-1450(ra) # 80004358 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    8000890a:	fd040713          	addi	a4,s0,-48
    8000890e:	fd840793          	addi	a5,s0,-40
    80008912:	85ba                	mv	a1,a4
    80008914:	853e                	mv	a0,a5
    80008916:	ffffe097          	auipc	ra,0xffffe
    8000891a:	5ee080e7          	jalr	1518(ra) # 80006f04 <pipealloc>
    8000891e:	87aa                	mv	a5,a0
    80008920:	0007d463          	bgez	a5,80008928 <sys_pipe+0x42>
    return -1;
    80008924:	57fd                	li	a5,-1
    80008926:	a219                	j	80008a2c <sys_pipe+0x146>
  fd0 = -1;
    80008928:	57fd                	li	a5,-1
    8000892a:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    8000892e:	fd843783          	ld	a5,-40(s0)
    80008932:	853e                	mv	a0,a5
    80008934:	fffff097          	auipc	ra,0xfffff
    80008938:	0da080e7          	jalr	218(ra) # 80007a0e <fdalloc>
    8000893c:	87aa                	mv	a5,a0
    8000893e:	fcf42623          	sw	a5,-52(s0)
    80008942:	fcc42783          	lw	a5,-52(s0)
    80008946:	0207c063          	bltz	a5,80008966 <sys_pipe+0x80>
    8000894a:	fd043783          	ld	a5,-48(s0)
    8000894e:	853e                	mv	a0,a5
    80008950:	fffff097          	auipc	ra,0xfffff
    80008954:	0be080e7          	jalr	190(ra) # 80007a0e <fdalloc>
    80008958:	87aa                	mv	a5,a0
    8000895a:	fcf42423          	sw	a5,-56(s0)
    8000895e:	fc842783          	lw	a5,-56(s0)
    80008962:	0207df63          	bgez	a5,800089a0 <sys_pipe+0xba>
    if(fd0 >= 0)
    80008966:	fcc42783          	lw	a5,-52(s0)
    8000896a:	0007cb63          	bltz	a5,80008980 <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    8000896e:	fcc42783          	lw	a5,-52(s0)
    80008972:	fe843703          	ld	a4,-24(s0)
    80008976:	07e9                	addi	a5,a5,26
    80008978:	078e                	slli	a5,a5,0x3
    8000897a:	97ba                	add	a5,a5,a4
    8000897c:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008980:	fd843783          	ld	a5,-40(s0)
    80008984:	853e                	mv	a0,a5
    80008986:	ffffe097          	auipc	ra,0xffffe
    8000898a:	068080e7          	jalr	104(ra) # 800069ee <fileclose>
    fileclose(wf);
    8000898e:	fd043783          	ld	a5,-48(s0)
    80008992:	853e                	mv	a0,a5
    80008994:	ffffe097          	auipc	ra,0xffffe
    80008998:	05a080e7          	jalr	90(ra) # 800069ee <fileclose>
    return -1;
    8000899c:	57fd                	li	a5,-1
    8000899e:	a079                	j	80008a2c <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800089a0:	fe843783          	ld	a5,-24(s0)
    800089a4:	6bbc                	ld	a5,80(a5)
    800089a6:	fe043703          	ld	a4,-32(s0)
    800089aa:	fcc40613          	addi	a2,s0,-52
    800089ae:	4691                	li	a3,4
    800089b0:	85ba                	mv	a1,a4
    800089b2:	853e                	mv	a0,a5
    800089b4:	ffffa097          	auipc	ra,0xffffa
    800089b8:	b2e080e7          	jalr	-1234(ra) # 800024e2 <copyout>
    800089bc:	87aa                	mv	a5,a0
    800089be:	0207c463          	bltz	a5,800089e6 <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    800089c2:	fe843783          	ld	a5,-24(s0)
    800089c6:	6bb8                	ld	a4,80(a5)
    800089c8:	fe043783          	ld	a5,-32(s0)
    800089cc:	0791                	addi	a5,a5,4
    800089ce:	fc840613          	addi	a2,s0,-56
    800089d2:	4691                	li	a3,4
    800089d4:	85be                	mv	a1,a5
    800089d6:	853a                	mv	a0,a4
    800089d8:	ffffa097          	auipc	ra,0xffffa
    800089dc:	b0a080e7          	jalr	-1270(ra) # 800024e2 <copyout>
    800089e0:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800089e2:	0407d463          	bgez	a5,80008a2a <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    800089e6:	fcc42783          	lw	a5,-52(s0)
    800089ea:	fe843703          	ld	a4,-24(s0)
    800089ee:	07e9                	addi	a5,a5,26
    800089f0:	078e                	slli	a5,a5,0x3
    800089f2:	97ba                	add	a5,a5,a4
    800089f4:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    800089f8:	fc842783          	lw	a5,-56(s0)
    800089fc:	fe843703          	ld	a4,-24(s0)
    80008a00:	07e9                	addi	a5,a5,26
    80008a02:	078e                	slli	a5,a5,0x3
    80008a04:	97ba                	add	a5,a5,a4
    80008a06:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a0a:	fd843783          	ld	a5,-40(s0)
    80008a0e:	853e                	mv	a0,a5
    80008a10:	ffffe097          	auipc	ra,0xffffe
    80008a14:	fde080e7          	jalr	-34(ra) # 800069ee <fileclose>
    fileclose(wf);
    80008a18:	fd043783          	ld	a5,-48(s0)
    80008a1c:	853e                	mv	a0,a5
    80008a1e:	ffffe097          	auipc	ra,0xffffe
    80008a22:	fd0080e7          	jalr	-48(ra) # 800069ee <fileclose>
    return -1;
    80008a26:	57fd                	li	a5,-1
    80008a28:	a011                	j	80008a2c <sys_pipe+0x146>
  }
  return 0;
    80008a2a:	4781                	li	a5,0
}
    80008a2c:	853e                	mv	a0,a5
    80008a2e:	70e2                	ld	ra,56(sp)
    80008a30:	7442                	ld	s0,48(sp)
    80008a32:	6121                	addi	sp,sp,64
    80008a34:	8082                	ret
	...

0000000080008a40 <kernelvec>:
    80008a40:	7111                	addi	sp,sp,-256
    80008a42:	e006                	sd	ra,0(sp)
    80008a44:	e40a                	sd	sp,8(sp)
    80008a46:	e80e                	sd	gp,16(sp)
    80008a48:	ec12                	sd	tp,24(sp)
    80008a4a:	f016                	sd	t0,32(sp)
    80008a4c:	f41a                	sd	t1,40(sp)
    80008a4e:	f81e                	sd	t2,48(sp)
    80008a50:	fc22                	sd	s0,56(sp)
    80008a52:	e0a6                	sd	s1,64(sp)
    80008a54:	e4aa                	sd	a0,72(sp)
    80008a56:	e8ae                	sd	a1,80(sp)
    80008a58:	ecb2                	sd	a2,88(sp)
    80008a5a:	f0b6                	sd	a3,96(sp)
    80008a5c:	f4ba                	sd	a4,104(sp)
    80008a5e:	f8be                	sd	a5,112(sp)
    80008a60:	fcc2                	sd	a6,120(sp)
    80008a62:	e146                	sd	a7,128(sp)
    80008a64:	e54a                	sd	s2,136(sp)
    80008a66:	e94e                	sd	s3,144(sp)
    80008a68:	ed52                	sd	s4,152(sp)
    80008a6a:	f156                	sd	s5,160(sp)
    80008a6c:	f55a                	sd	s6,168(sp)
    80008a6e:	f95e                	sd	s7,176(sp)
    80008a70:	fd62                	sd	s8,184(sp)
    80008a72:	e1e6                	sd	s9,192(sp)
    80008a74:	e5ea                	sd	s10,200(sp)
    80008a76:	e9ee                	sd	s11,208(sp)
    80008a78:	edf2                	sd	t3,216(sp)
    80008a7a:	f1f6                	sd	t4,224(sp)
    80008a7c:	f5fa                	sd	t5,232(sp)
    80008a7e:	f9fe                	sd	t6,240(sp)
    80008a80:	c8cfb0ef          	jal	ra,80003f0c <kerneltrap>
    80008a84:	6082                	ld	ra,0(sp)
    80008a86:	6122                	ld	sp,8(sp)
    80008a88:	61c2                	ld	gp,16(sp)
    80008a8a:	7282                	ld	t0,32(sp)
    80008a8c:	7322                	ld	t1,40(sp)
    80008a8e:	73c2                	ld	t2,48(sp)
    80008a90:	7462                	ld	s0,56(sp)
    80008a92:	6486                	ld	s1,64(sp)
    80008a94:	6526                	ld	a0,72(sp)
    80008a96:	65c6                	ld	a1,80(sp)
    80008a98:	6666                	ld	a2,88(sp)
    80008a9a:	7686                	ld	a3,96(sp)
    80008a9c:	7726                	ld	a4,104(sp)
    80008a9e:	77c6                	ld	a5,112(sp)
    80008aa0:	7866                	ld	a6,120(sp)
    80008aa2:	688a                	ld	a7,128(sp)
    80008aa4:	692a                	ld	s2,136(sp)
    80008aa6:	69ca                	ld	s3,144(sp)
    80008aa8:	6a6a                	ld	s4,152(sp)
    80008aaa:	7a8a                	ld	s5,160(sp)
    80008aac:	7b2a                	ld	s6,168(sp)
    80008aae:	7bca                	ld	s7,176(sp)
    80008ab0:	7c6a                	ld	s8,184(sp)
    80008ab2:	6c8e                	ld	s9,192(sp)
    80008ab4:	6d2e                	ld	s10,200(sp)
    80008ab6:	6dce                	ld	s11,208(sp)
    80008ab8:	6e6e                	ld	t3,216(sp)
    80008aba:	7e8e                	ld	t4,224(sp)
    80008abc:	7f2e                	ld	t5,232(sp)
    80008abe:	7fce                	ld	t6,240(sp)
    80008ac0:	6111                	addi	sp,sp,256
    80008ac2:	10200073          	sret
    80008ac6:	00000013          	nop
    80008aca:	00000013          	nop
    80008ace:	0001                	nop

0000000080008ad0 <timervec>:
    80008ad0:	34051573          	csrrw	a0,mscratch,a0
    80008ad4:	e10c                	sd	a1,0(a0)
    80008ad6:	e510                	sd	a2,8(a0)
    80008ad8:	e914                	sd	a3,16(a0)
    80008ada:	6d0c                	ld	a1,24(a0)
    80008adc:	7110                	ld	a2,32(a0)
    80008ade:	6194                	ld	a3,0(a1)
    80008ae0:	96b2                	add	a3,a3,a2
    80008ae2:	e194                	sd	a3,0(a1)
    80008ae4:	4589                	li	a1,2
    80008ae6:	14459073          	csrw	sip,a1
    80008aea:	6914                	ld	a3,16(a0)
    80008aec:	6510                	ld	a2,8(a0)
    80008aee:	610c                	ld	a1,0(a0)
    80008af0:	34051573          	csrrw	a0,mscratch,a0
    80008af4:	30200073          	mret
	...

0000000080008afa <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008afa:	1141                	addi	sp,sp,-16
    80008afc:	e422                	sd	s0,8(sp)
    80008afe:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008b00:	0c0007b7          	lui	a5,0xc000
    80008b04:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008b08:	4705                	li	a4,1
    80008b0a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008b0c:	0c0007b7          	lui	a5,0xc000
    80008b10:	0791                	addi	a5,a5,4
    80008b12:	4705                	li	a4,1
    80008b14:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008b16:	0c0007b7          	lui	a5,0xc000
    80008b1a:	07a1                	addi	a5,a5,8
    80008b1c:	4705                	li	a4,1
    80008b1e:	c398                	sw	a4,0(a5)
}
    80008b20:	0001                	nop
    80008b22:	6422                	ld	s0,8(sp)
    80008b24:	0141                	addi	sp,sp,16
    80008b26:	8082                	ret

0000000080008b28 <plicinithart>:

void
plicinithart(void)
{
    80008b28:	1101                	addi	sp,sp,-32
    80008b2a:	ec06                	sd	ra,24(sp)
    80008b2c:	e822                	sd	s0,16(sp)
    80008b2e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008b30:	ffffa097          	auipc	ra,0xffffa
    80008b34:	e8a080e7          	jalr	-374(ra) # 800029ba <cpuid>
    80008b38:	87aa                	mv	a5,a0
    80008b3a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008b3e:	fec42783          	lw	a5,-20(s0)
    80008b42:	0087979b          	slliw	a5,a5,0x8
    80008b46:	2781                	sext.w	a5,a5
    80008b48:	873e                	mv	a4,a5
    80008b4a:	0c0027b7          	lui	a5,0xc002
    80008b4e:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008b52:	97ba                	add	a5,a5,a4
    80008b54:	873e                	mv	a4,a5
    80008b56:	40600793          	li	a5,1030
    80008b5a:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008b5c:	fec42783          	lw	a5,-20(s0)
    80008b60:	00d7979b          	slliw	a5,a5,0xd
    80008b64:	2781                	sext.w	a5,a5
    80008b66:	873e                	mv	a4,a5
    80008b68:	0c2017b7          	lui	a5,0xc201
    80008b6c:	97ba                	add	a5,a5,a4
    80008b6e:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008b72:	0001                	nop
    80008b74:	60e2                	ld	ra,24(sp)
    80008b76:	6442                	ld	s0,16(sp)
    80008b78:	6105                	addi	sp,sp,32
    80008b7a:	8082                	ret

0000000080008b7c <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008b7c:	1101                	addi	sp,sp,-32
    80008b7e:	ec06                	sd	ra,24(sp)
    80008b80:	e822                	sd	s0,16(sp)
    80008b82:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008b84:	ffffa097          	auipc	ra,0xffffa
    80008b88:	e36080e7          	jalr	-458(ra) # 800029ba <cpuid>
    80008b8c:	87aa                	mv	a5,a0
    80008b8e:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008b92:	fec42783          	lw	a5,-20(s0)
    80008b96:	00d7979b          	slliw	a5,a5,0xd
    80008b9a:	2781                	sext.w	a5,a5
    80008b9c:	873e                	mv	a4,a5
    80008b9e:	0c2017b7          	lui	a5,0xc201
    80008ba2:	0791                	addi	a5,a5,4
    80008ba4:	97ba                	add	a5,a5,a4
    80008ba6:	439c                	lw	a5,0(a5)
    80008ba8:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008bac:	fe842783          	lw	a5,-24(s0)
}
    80008bb0:	853e                	mv	a0,a5
    80008bb2:	60e2                	ld	ra,24(sp)
    80008bb4:	6442                	ld	s0,16(sp)
    80008bb6:	6105                	addi	sp,sp,32
    80008bb8:	8082                	ret

0000000080008bba <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008bba:	7179                	addi	sp,sp,-48
    80008bbc:	f406                	sd	ra,40(sp)
    80008bbe:	f022                	sd	s0,32(sp)
    80008bc0:	1800                	addi	s0,sp,48
    80008bc2:	87aa                	mv	a5,a0
    80008bc4:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008bc8:	ffffa097          	auipc	ra,0xffffa
    80008bcc:	df2080e7          	jalr	-526(ra) # 800029ba <cpuid>
    80008bd0:	87aa                	mv	a5,a0
    80008bd2:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008bd6:	fec42783          	lw	a5,-20(s0)
    80008bda:	00d7979b          	slliw	a5,a5,0xd
    80008bde:	2781                	sext.w	a5,a5
    80008be0:	873e                	mv	a4,a5
    80008be2:	0c2017b7          	lui	a5,0xc201
    80008be6:	0791                	addi	a5,a5,4
    80008be8:	97ba                	add	a5,a5,a4
    80008bea:	873e                	mv	a4,a5
    80008bec:	fdc42783          	lw	a5,-36(s0)
    80008bf0:	c31c                	sw	a5,0(a4)
}
    80008bf2:	0001                	nop
    80008bf4:	70a2                	ld	ra,40(sp)
    80008bf6:	7402                	ld	s0,32(sp)
    80008bf8:	6145                	addi	sp,sp,48
    80008bfa:	8082                	ret

0000000080008bfc <r_sstatus>:
{
    80008bfc:	1101                	addi	sp,sp,-32
    80008bfe:	ec22                	sd	s0,24(sp)
    80008c00:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80008c02:	100027f3          	csrr	a5,sstatus
    80008c06:	fef43423          	sd	a5,-24(s0)
  return x;
    80008c0a:	fe843783          	ld	a5,-24(s0)
}
    80008c0e:	853e                	mv	a0,a5
    80008c10:	6462                	ld	s0,24(sp)
    80008c12:	6105                	addi	sp,sp,32
    80008c14:	8082                	ret

0000000080008c16 <w_sstatus>:
{
    80008c16:	1101                	addi	sp,sp,-32
    80008c18:	ec22                	sd	s0,24(sp)
    80008c1a:	1000                	addi	s0,sp,32
    80008c1c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80008c20:	fe843783          	ld	a5,-24(s0)
    80008c24:	10079073          	csrw	sstatus,a5
}
    80008c28:	0001                	nop
    80008c2a:	6462                	ld	s0,24(sp)
    80008c2c:	6105                	addi	sp,sp,32
    80008c2e:	8082                	ret

0000000080008c30 <intr_on>:
{
    80008c30:	1141                	addi	sp,sp,-16
    80008c32:	e406                	sd	ra,8(sp)
    80008c34:	e022                	sd	s0,0(sp)
    80008c36:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80008c38:	00000097          	auipc	ra,0x0
    80008c3c:	fc4080e7          	jalr	-60(ra) # 80008bfc <r_sstatus>
    80008c40:	87aa                	mv	a5,a0
    80008c42:	0027e793          	ori	a5,a5,2
    80008c46:	853e                	mv	a0,a5
    80008c48:	00000097          	auipc	ra,0x0
    80008c4c:	fce080e7          	jalr	-50(ra) # 80008c16 <w_sstatus>
}
    80008c50:	0001                	nop
    80008c52:	60a2                	ld	ra,8(sp)
    80008c54:	6402                	ld	s0,0(sp)
    80008c56:	0141                	addi	sp,sp,16
    80008c58:	8082                	ret

0000000080008c5a <intr_off>:
{
    80008c5a:	1141                	addi	sp,sp,-16
    80008c5c:	e406                	sd	ra,8(sp)
    80008c5e:	e022                	sd	s0,0(sp)
    80008c60:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80008c62:	00000097          	auipc	ra,0x0
    80008c66:	f9a080e7          	jalr	-102(ra) # 80008bfc <r_sstatus>
    80008c6a:	87aa                	mv	a5,a0
    80008c6c:	9bf5                	andi	a5,a5,-3
    80008c6e:	853e                	mv	a0,a5
    80008c70:	00000097          	auipc	ra,0x0
    80008c74:	fa6080e7          	jalr	-90(ra) # 80008c16 <w_sstatus>
}
    80008c78:	0001                	nop
    80008c7a:	60a2                	ld	ra,8(sp)
    80008c7c:	6402                	ld	s0,0(sp)
    80008c7e:	0141                	addi	sp,sp,16
    80008c80:	8082                	ret

0000000080008c82 <setBit>:

static struct Bitset {
  uint32 bits[DISK_PAGES_COUNT / BITS_PER_UINT];
} diskpagesallocated = {{0} };

void setBit(int index) {
    80008c82:	7179                	addi	sp,sp,-48
    80008c84:	f422                	sd	s0,40(sp)
    80008c86:	1800                	addi	s0,sp,48
    80008c88:	87aa                	mv	a5,a0
    80008c8a:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008c8e:	fdc42783          	lw	a5,-36(s0)
    80008c92:	8395                	srli	a5,a5,0x5
    80008c94:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008c98:	fdc42783          	lw	a5,-36(s0)
    80008c9c:	8bfd                	andi	a5,a5,31
    80008c9e:	fef42423          	sw	a5,-24(s0)
  diskpagesallocated.bits[arrayIndex] |= (1 << bitOffset);
    80008ca2:	0001d717          	auipc	a4,0x1d
    80008ca6:	06670713          	addi	a4,a4,102 # 80025d08 <diskpagesallocated>
    80008caa:	fec42783          	lw	a5,-20(s0)
    80008cae:	078a                	slli	a5,a5,0x2
    80008cb0:	97ba                	add	a5,a5,a4
    80008cb2:	4394                	lw	a3,0(a5)
    80008cb4:	fe842783          	lw	a5,-24(s0)
    80008cb8:	4705                	li	a4,1
    80008cba:	00f717bb          	sllw	a5,a4,a5
    80008cbe:	2781                	sext.w	a5,a5
    80008cc0:	2781                	sext.w	a5,a5
    80008cc2:	8736                	mv	a4,a3
    80008cc4:	8fd9                	or	a5,a5,a4
    80008cc6:	0007871b          	sext.w	a4,a5
    80008cca:	0001d697          	auipc	a3,0x1d
    80008cce:	03e68693          	addi	a3,a3,62 # 80025d08 <diskpagesallocated>
    80008cd2:	fec42783          	lw	a5,-20(s0)
    80008cd6:	078a                	slli	a5,a5,0x2
    80008cd8:	97b6                	add	a5,a5,a3
    80008cda:	c398                	sw	a4,0(a5)
}
    80008cdc:	0001                	nop
    80008cde:	7422                	ld	s0,40(sp)
    80008ce0:	6145                	addi	sp,sp,48
    80008ce2:	8082                	ret

0000000080008ce4 <clearBit>:

void clearBit(int index) {
    80008ce4:	7179                	addi	sp,sp,-48
    80008ce6:	f422                	sd	s0,40(sp)
    80008ce8:	1800                	addi	s0,sp,48
    80008cea:	87aa                	mv	a5,a0
    80008cec:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008cf0:	fdc42783          	lw	a5,-36(s0)
    80008cf4:	8395                	srli	a5,a5,0x5
    80008cf6:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008cfa:	fdc42783          	lw	a5,-36(s0)
    80008cfe:	8bfd                	andi	a5,a5,31
    80008d00:	fef42423          	sw	a5,-24(s0)
  diskpagesallocated.bits[arrayIndex] &= ~(1 << bitOffset);
    80008d04:	0001d717          	auipc	a4,0x1d
    80008d08:	00470713          	addi	a4,a4,4 # 80025d08 <diskpagesallocated>
    80008d0c:	fec42783          	lw	a5,-20(s0)
    80008d10:	078a                	slli	a5,a5,0x2
    80008d12:	97ba                	add	a5,a5,a4
    80008d14:	4394                	lw	a3,0(a5)
    80008d16:	fe842783          	lw	a5,-24(s0)
    80008d1a:	4705                	li	a4,1
    80008d1c:	00f717bb          	sllw	a5,a4,a5
    80008d20:	2781                	sext.w	a5,a5
    80008d22:	fff7c793          	not	a5,a5
    80008d26:	2781                	sext.w	a5,a5
    80008d28:	2781                	sext.w	a5,a5
    80008d2a:	8736                	mv	a4,a3
    80008d2c:	8ff9                	and	a5,a5,a4
    80008d2e:	0007871b          	sext.w	a4,a5
    80008d32:	0001d697          	auipc	a3,0x1d
    80008d36:	fd668693          	addi	a3,a3,-42 # 80025d08 <diskpagesallocated>
    80008d3a:	fec42783          	lw	a5,-20(s0)
    80008d3e:	078a                	slli	a5,a5,0x2
    80008d40:	97b6                	add	a5,a5,a3
    80008d42:	c398                	sw	a4,0(a5)
}
    80008d44:	0001                	nop
    80008d46:	7422                	ld	s0,40(sp)
    80008d48:	6145                	addi	sp,sp,48
    80008d4a:	8082                	ret

0000000080008d4c <getBit>:

int getBit(int index) {
    80008d4c:	7179                	addi	sp,sp,-48
    80008d4e:	f422                	sd	s0,40(sp)
    80008d50:	1800                	addi	s0,sp,48
    80008d52:	87aa                	mv	a5,a0
    80008d54:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008d58:	fdc42783          	lw	a5,-36(s0)
    80008d5c:	8395                	srli	a5,a5,0x5
    80008d5e:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008d62:	fdc42783          	lw	a5,-36(s0)
    80008d66:	8bfd                	andi	a5,a5,31
    80008d68:	fef42423          	sw	a5,-24(s0)
  return (diskpagesallocated.bits[arrayIndex] >> bitOffset) & 1;
    80008d6c:	0001d717          	auipc	a4,0x1d
    80008d70:	f9c70713          	addi	a4,a4,-100 # 80025d08 <diskpagesallocated>
    80008d74:	fec42783          	lw	a5,-20(s0)
    80008d78:	078a                	slli	a5,a5,0x2
    80008d7a:	97ba                	add	a5,a5,a4
    80008d7c:	4398                	lw	a4,0(a5)
    80008d7e:	fe842783          	lw	a5,-24(s0)
    80008d82:	00f757bb          	srlw	a5,a4,a5
    80008d86:	2781                	sext.w	a5,a5
    80008d88:	2781                	sext.w	a5,a5
    80008d8a:	8b85                	andi	a5,a5,1
    80008d8c:	2781                	sext.w	a5,a5
}
    80008d8e:	853e                	mv	a0,a5
    80008d90:	7422                	ld	s0,40(sp)
    80008d92:	6145                	addi	sp,sp,48
    80008d94:	8082                	ret

0000000080008d96 <findFirstFreePage>:

int findFirstFreePage() {
    80008d96:	1101                	addi	sp,sp,-32
    80008d98:	ec06                	sd	ra,24(sp)
    80008d9a:	e822                	sd	s0,16(sp)
    80008d9c:	1000                	addi	s0,sp,32
  for (int i = 0; i < DISK_PAGES_COUNT; ++i) {
    80008d9e:	fe042623          	sw	zero,-20(s0)
    80008da2:	a015                	j	80008dc6 <findFirstFreePage+0x30>
    if (getBit(i) == 0) {
    80008da4:	fec42783          	lw	a5,-20(s0)
    80008da8:	853e                	mv	a0,a5
    80008daa:	00000097          	auipc	ra,0x0
    80008dae:	fa2080e7          	jalr	-94(ra) # 80008d4c <getBit>
    80008db2:	87aa                	mv	a5,a0
    80008db4:	e781                	bnez	a5,80008dbc <findFirstFreePage+0x26>
      return i;
    80008db6:	fec42783          	lw	a5,-20(s0)
    80008dba:	a831                	j	80008dd6 <findFirstFreePage+0x40>
  for (int i = 0; i < DISK_PAGES_COUNT; ++i) {
    80008dbc:	fec42783          	lw	a5,-20(s0)
    80008dc0:	2785                	addiw	a5,a5,1
    80008dc2:	fef42623          	sw	a5,-20(s0)
    80008dc6:	fec42783          	lw	a5,-20(s0)
    80008dca:	0007871b          	sext.w	a4,a5
    80008dce:	6785                	lui	a5,0x1
    80008dd0:	fcf74ae3          	blt	a4,a5,80008da4 <findFirstFreePage+0xe>
    }
  }
  return -1; // Return -1 if no clear bit is found
    80008dd4:	57fd                	li	a5,-1
}
    80008dd6:	853e                	mv	a0,a5
    80008dd8:	60e2                	ld	ra,24(sp)
    80008dda:	6442                	ld	s0,16(sp)
    80008ddc:	6105                	addi	sp,sp,32
    80008dde:	8082                	ret

0000000080008de0 <takeFirstFreePage>:

int takeFirstFreePage() {
    80008de0:	1101                	addi	sp,sp,-32
    80008de2:	ec06                	sd	ra,24(sp)
    80008de4:	e822                	sd	s0,16(sp)
    80008de6:	1000                	addi	s0,sp,32
  int index = findFirstFreePage();
    80008de8:	00000097          	auipc	ra,0x0
    80008dec:	fae080e7          	jalr	-82(ra) # 80008d96 <findFirstFreePage>
    80008df0:	87aa                	mv	a5,a0
    80008df2:	fef42623          	sw	a5,-20(s0)
  if(index < 0) return -1;
    80008df6:	fec42783          	lw	a5,-20(s0)
    80008dfa:	2781                	sext.w	a5,a5
    80008dfc:	0007d463          	bgez	a5,80008e04 <takeFirstFreePage+0x24>
    80008e00:	57fd                	li	a5,-1
    80008e02:	a811                	j	80008e16 <takeFirstFreePage+0x36>
  setBit(index);
    80008e04:	fec42783          	lw	a5,-20(s0)
    80008e08:	853e                	mv	a0,a5
    80008e0a:	00000097          	auipc	ra,0x0
    80008e0e:	e78080e7          	jalr	-392(ra) # 80008c82 <setBit>
  return index;
    80008e12:	fec42783          	lw	a5,-20(s0)
}
    80008e16:	853e                	mv	a0,a5
    80008e18:	60e2                	ld	ra,24(sp)
    80008e1a:	6442                	ld	s0,16(sp)
    80008e1c:	6105                	addi	sp,sp,32
    80008e1e:	8082                	ret

0000000080008e20 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    80008e20:	7139                	addi	sp,sp,-64
    80008e22:	fc06                	sd	ra,56(sp)
    80008e24:	f822                	sd	s0,48(sp)
    80008e26:	0080                	addi	s0,sp,64
    80008e28:	87aa                	mv	a5,a0
    80008e2a:	fcb43023          	sd	a1,-64(s0)
    80008e2e:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80008e32:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008e36:	fcc42703          	lw	a4,-52(s0)
    80008e3a:	15000793          	li	a5,336
    80008e3e:	02f707b3          	mul	a5,a4,a5
    80008e42:	13078713          	addi	a4,a5,304 # 1130 <_entry-0x7fffeed0>
    80008e46:	0001d797          	auipc	a5,0x1d
    80008e4a:	0c278793          	addi	a5,a5,194 # 80025f08 <disk>
    80008e4e:	97ba                	add	a5,a5,a4
    80008e50:	fc043583          	ld	a1,-64(s0)
    80008e54:	853e                	mv	a0,a5
    80008e56:	ffff8097          	auipc	ra,0xffff8
    80008e5a:	4b6080e7          	jalr	1206(ra) # 8000130c <initlock>
  disk[id].name = name;
    80008e5e:	0001d717          	auipc	a4,0x1d
    80008e62:	0aa70713          	addi	a4,a4,170 # 80025f08 <disk>
    80008e66:	fcc42683          	lw	a3,-52(s0)
    80008e6a:	15000793          	li	a5,336
    80008e6e:	02f687b3          	mul	a5,a3,a5
    80008e72:	97ba                	add	a5,a5,a4
    80008e74:	fc043703          	ld	a4,-64(s0)
    80008e78:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008e7a:	fcc42703          	lw	a4,-52(s0)
    80008e7e:	67c1                	lui	a5,0x10
    80008e80:	0785                	addi	a5,a5,1
    80008e82:	97ba                	add	a5,a5,a4
    80008e84:	07b2                	slli	a5,a5,0xc
    80008e86:	439c                	lw	a5,0(a5)
    80008e88:	2781                	sext.w	a5,a5
    80008e8a:	873e                	mv	a4,a5
    80008e8c:	747277b7          	lui	a5,0x74727
    80008e90:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008e94:	04f71c63          	bne	a4,a5,80008eec <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008e98:	fcc42703          	lw	a4,-52(s0)
    80008e9c:	67c1                	lui	a5,0x10
    80008e9e:	0785                	addi	a5,a5,1
    80008ea0:	97ba                	add	a5,a5,a4
    80008ea2:	07b2                	slli	a5,a5,0xc
    80008ea4:	0791                	addi	a5,a5,4
    80008ea6:	439c                	lw	a5,0(a5)
    80008ea8:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008eaa:	873e                	mv	a4,a5
    80008eac:	4789                	li	a5,2
    80008eae:	02f71f63          	bne	a4,a5,80008eec <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008eb2:	fcc42703          	lw	a4,-52(s0)
    80008eb6:	67c1                	lui	a5,0x10
    80008eb8:	0785                	addi	a5,a5,1
    80008eba:	97ba                	add	a5,a5,a4
    80008ebc:	07b2                	slli	a5,a5,0xc
    80008ebe:	07a1                	addi	a5,a5,8
    80008ec0:	439c                	lw	a5,0(a5)
    80008ec2:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008ec4:	873e                	mv	a4,a5
    80008ec6:	4789                	li	a5,2
    80008ec8:	02f71263          	bne	a4,a5,80008eec <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008ecc:	fcc42703          	lw	a4,-52(s0)
    80008ed0:	67c1                	lui	a5,0x10
    80008ed2:	0785                	addi	a5,a5,1
    80008ed4:	97ba                	add	a5,a5,a4
    80008ed6:	07b2                	slli	a5,a5,0xc
    80008ed8:	07b1                	addi	a5,a5,12
    80008eda:	439c                	lw	a5,0(a5)
    80008edc:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008ede:	873e                	mv	a4,a5
    80008ee0:	554d47b7          	lui	a5,0x554d4
    80008ee4:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008ee8:	00f70d63          	beq	a4,a5,80008f02 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    80008eec:	fc043603          	ld	a2,-64(s0)
    80008ef0:	00003597          	auipc	a1,0x3
    80008ef4:	78058593          	addi	a1,a1,1920 # 8000c670 <etext+0x670>
    80008ef8:	4509                	li	a0,2
    80008efa:	ffff8097          	auipc	ra,0xffff8
    80008efe:	de4080e7          	jalr	-540(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f02:	fcc42703          	lw	a4,-52(s0)
    80008f06:	67c1                	lui	a5,0x10
    80008f08:	0785                	addi	a5,a5,1
    80008f0a:	97ba                	add	a5,a5,a4
    80008f0c:	07b2                	slli	a5,a5,0xc
    80008f0e:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f12:	873e                	mv	a4,a5
    80008f14:	fe842783          	lw	a5,-24(s0)
    80008f18:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008f1a:	fe842783          	lw	a5,-24(s0)
    80008f1e:	0017e793          	ori	a5,a5,1
    80008f22:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f26:	fcc42703          	lw	a4,-52(s0)
    80008f2a:	67c1                	lui	a5,0x10
    80008f2c:	0785                	addi	a5,a5,1
    80008f2e:	97ba                	add	a5,a5,a4
    80008f30:	07b2                	slli	a5,a5,0xc
    80008f32:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f36:	873e                	mv	a4,a5
    80008f38:	fe842783          	lw	a5,-24(s0)
    80008f3c:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008f3e:	fe842783          	lw	a5,-24(s0)
    80008f42:	0027e793          	ori	a5,a5,2
    80008f46:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f4a:	fcc42703          	lw	a4,-52(s0)
    80008f4e:	67c1                	lui	a5,0x10
    80008f50:	0785                	addi	a5,a5,1
    80008f52:	97ba                	add	a5,a5,a4
    80008f54:	07b2                	slli	a5,a5,0xc
    80008f56:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f5a:	873e                	mv	a4,a5
    80008f5c:	fe842783          	lw	a5,-24(s0)
    80008f60:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008f62:	fcc42703          	lw	a4,-52(s0)
    80008f66:	67c1                	lui	a5,0x10
    80008f68:	0785                	addi	a5,a5,1
    80008f6a:	97ba                	add	a5,a5,a4
    80008f6c:	07b2                	slli	a5,a5,0xc
    80008f6e:	07c1                	addi	a5,a5,16
    80008f70:	439c                	lw	a5,0(a5)
    80008f72:	2781                	sext.w	a5,a5
    80008f74:	1782                	slli	a5,a5,0x20
    80008f76:	9381                	srli	a5,a5,0x20
    80008f78:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008f7c:	fe043783          	ld	a5,-32(s0)
    80008f80:	fdf7f793          	andi	a5,a5,-33
    80008f84:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008f88:	fe043783          	ld	a5,-32(s0)
    80008f8c:	f7f7f793          	andi	a5,a5,-129
    80008f90:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008f94:	fe043703          	ld	a4,-32(s0)
    80008f98:	77fd                	lui	a5,0xfffff
    80008f9a:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ff99637>
    80008f9e:	8ff9                	and	a5,a5,a4
    80008fa0:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008fa4:	fe043703          	ld	a4,-32(s0)
    80008fa8:	77fd                	lui	a5,0xfffff
    80008faa:	17fd                	addi	a5,a5,-1
    80008fac:	8ff9                	and	a5,a5,a4
    80008fae:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008fb2:	fe043703          	ld	a4,-32(s0)
    80008fb6:	f80007b7          	lui	a5,0xf8000
    80008fba:	17fd                	addi	a5,a5,-1
    80008fbc:	8ff9                	and	a5,a5,a4
    80008fbe:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008fc2:	fe043703          	ld	a4,-32(s0)
    80008fc6:	e00007b7          	lui	a5,0xe0000
    80008fca:	17fd                	addi	a5,a5,-1
    80008fcc:	8ff9                	and	a5,a5,a4
    80008fce:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008fd2:	fe043703          	ld	a4,-32(s0)
    80008fd6:	f00007b7          	lui	a5,0xf0000
    80008fda:	17fd                	addi	a5,a5,-1
    80008fdc:	8ff9                	and	a5,a5,a4
    80008fde:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008fe2:	fcc42703          	lw	a4,-52(s0)
    80008fe6:	67c1                	lui	a5,0x10
    80008fe8:	0785                	addi	a5,a5,1
    80008fea:	97ba                	add	a5,a5,a4
    80008fec:	07b2                	slli	a5,a5,0xc
    80008fee:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80008ff2:	873e                	mv	a4,a5
    80008ff4:	fe043783          	ld	a5,-32(s0)
    80008ff8:	2781                	sext.w	a5,a5
    80008ffa:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008ffc:	fe842783          	lw	a5,-24(s0)
    80009000:	0087e793          	ori	a5,a5,8
    80009004:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009008:	fcc42703          	lw	a4,-52(s0)
    8000900c:	67c1                	lui	a5,0x10
    8000900e:	0785                	addi	a5,a5,1
    80009010:	97ba                	add	a5,a5,a4
    80009012:	07b2                	slli	a5,a5,0xc
    80009014:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009018:	873e                	mv	a4,a5
    8000901a:	fe842783          	lw	a5,-24(s0)
    8000901e:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80009020:	fcc42703          	lw	a4,-52(s0)
    80009024:	67c1                	lui	a5,0x10
    80009026:	0785                	addi	a5,a5,1
    80009028:	97ba                	add	a5,a5,a4
    8000902a:	07b2                	slli	a5,a5,0xc
    8000902c:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009030:	439c                	lw	a5,0(a5)
    80009032:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80009036:	fe842783          	lw	a5,-24(s0)
    8000903a:	8ba1                	andi	a5,a5,8
    8000903c:	2781                	sext.w	a5,a5
    8000903e:	ef81                	bnez	a5,80009056 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    80009040:	00003617          	auipc	a2,0x3
    80009044:	65060613          	addi	a2,a2,1616 # 8000c690 <etext+0x690>
    80009048:	fc043583          	ld	a1,-64(s0)
    8000904c:	4509                	li	a0,2
    8000904e:	ffff8097          	auipc	ra,0xffff8
    80009052:	c90080e7          	jalr	-880(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    80009056:	fcc42703          	lw	a4,-52(s0)
    8000905a:	67c1                	lui	a5,0x10
    8000905c:	0785                	addi	a5,a5,1
    8000905e:	97ba                	add	a5,a5,a4
    80009060:	07b2                	slli	a5,a5,0xc
    80009062:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    80009066:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    8000906a:	fcc42703          	lw	a4,-52(s0)
    8000906e:	67c1                	lui	a5,0x10
    80009070:	0785                	addi	a5,a5,1
    80009072:	97ba                	add	a5,a5,a4
    80009074:	07b2                	slli	a5,a5,0xc
    80009076:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    8000907a:	439c                	lw	a5,0(a5)
    8000907c:	2781                	sext.w	a5,a5
    8000907e:	cf81                	beqz	a5,80009096 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    80009080:	00003617          	auipc	a2,0x3
    80009084:	63060613          	addi	a2,a2,1584 # 8000c6b0 <etext+0x6b0>
    80009088:	fc043583          	ld	a1,-64(s0)
    8000908c:	4509                	li	a0,2
    8000908e:	ffff8097          	auipc	ra,0xffff8
    80009092:	c50080e7          	jalr	-944(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    80009096:	fcc42703          	lw	a4,-52(s0)
    8000909a:	67c1                	lui	a5,0x10
    8000909c:	0785                	addi	a5,a5,1
    8000909e:	97ba                	add	a5,a5,a4
    800090a0:	07b2                	slli	a5,a5,0xc
    800090a2:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    800090a6:	439c                	lw	a5,0(a5)
    800090a8:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    800090ac:	fdc42783          	lw	a5,-36(s0)
    800090b0:	2781                	sext.w	a5,a5
    800090b2:	ef81                	bnez	a5,800090ca <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    800090b4:	00003617          	auipc	a2,0x3
    800090b8:	62460613          	addi	a2,a2,1572 # 8000c6d8 <etext+0x6d8>
    800090bc:	fc043583          	ld	a1,-64(s0)
    800090c0:	4509                	li	a0,2
    800090c2:	ffff8097          	auipc	ra,0xffff8
    800090c6:	c1c080e7          	jalr	-996(ra) # 80000cde <panic_concat>
  if(max < NUM)
    800090ca:	fdc42783          	lw	a5,-36(s0)
    800090ce:	0007871b          	sext.w	a4,a5
    800090d2:	479d                	li	a5,7
    800090d4:	00e7ed63          	bltu	a5,a4,800090ee <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    800090d8:	00003617          	auipc	a2,0x3
    800090dc:	62060613          	addi	a2,a2,1568 # 8000c6f8 <etext+0x6f8>
    800090e0:	fc043583          	ld	a1,-64(s0)
    800090e4:	4509                	li	a0,2
    800090e6:	ffff8097          	auipc	ra,0xffff8
    800090ea:	bf8080e7          	jalr	-1032(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    800090ee:	ffff8097          	auipc	ra,0xffff8
    800090f2:	0e8080e7          	jalr	232(ra) # 800011d6 <kalloc>
    800090f6:	862a                	mv	a2,a0
    800090f8:	0001d717          	auipc	a4,0x1d
    800090fc:	e1070713          	addi	a4,a4,-496 # 80025f08 <disk>
    80009100:	fcc42683          	lw	a3,-52(s0)
    80009104:	15000793          	li	a5,336
    80009108:	02f687b3          	mul	a5,a3,a5
    8000910c:	97ba                	add	a5,a5,a4
    8000910e:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    80009110:	ffff8097          	auipc	ra,0xffff8
    80009114:	0c6080e7          	jalr	198(ra) # 800011d6 <kalloc>
    80009118:	862a                	mv	a2,a0
    8000911a:	0001d717          	auipc	a4,0x1d
    8000911e:	dee70713          	addi	a4,a4,-530 # 80025f08 <disk>
    80009122:	fcc42683          	lw	a3,-52(s0)
    80009126:	15000793          	li	a5,336
    8000912a:	02f687b3          	mul	a5,a3,a5
    8000912e:	97ba                	add	a5,a5,a4
    80009130:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    80009132:	ffff8097          	auipc	ra,0xffff8
    80009136:	0a4080e7          	jalr	164(ra) # 800011d6 <kalloc>
    8000913a:	862a                	mv	a2,a0
    8000913c:	0001d717          	auipc	a4,0x1d
    80009140:	dcc70713          	addi	a4,a4,-564 # 80025f08 <disk>
    80009144:	fcc42683          	lw	a3,-52(s0)
    80009148:	15000793          	li	a5,336
    8000914c:	02f687b3          	mul	a5,a3,a5
    80009150:	97ba                	add	a5,a5,a4
    80009152:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    80009154:	0001d717          	auipc	a4,0x1d
    80009158:	db470713          	addi	a4,a4,-588 # 80025f08 <disk>
    8000915c:	fcc42683          	lw	a3,-52(s0)
    80009160:	15000793          	li	a5,336
    80009164:	02f687b3          	mul	a5,a3,a5
    80009168:	97ba                	add	a5,a5,a4
    8000916a:	679c                	ld	a5,8(a5)
    8000916c:	cb9d                	beqz	a5,800091a2 <virtio_disk_init+0x382>
    8000916e:	0001d717          	auipc	a4,0x1d
    80009172:	d9a70713          	addi	a4,a4,-614 # 80025f08 <disk>
    80009176:	fcc42683          	lw	a3,-52(s0)
    8000917a:	15000793          	li	a5,336
    8000917e:	02f687b3          	mul	a5,a3,a5
    80009182:	97ba                	add	a5,a5,a4
    80009184:	6b9c                	ld	a5,16(a5)
    80009186:	cf91                	beqz	a5,800091a2 <virtio_disk_init+0x382>
    80009188:	0001d717          	auipc	a4,0x1d
    8000918c:	d8070713          	addi	a4,a4,-640 # 80025f08 <disk>
    80009190:	fcc42683          	lw	a3,-52(s0)
    80009194:	15000793          	li	a5,336
    80009198:	02f687b3          	mul	a5,a3,a5
    8000919c:	97ba                	add	a5,a5,a4
    8000919e:	6f9c                	ld	a5,24(a5)
    800091a0:	ef81                	bnez	a5,800091b8 <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    800091a2:	00003617          	auipc	a2,0x3
    800091a6:	57e60613          	addi	a2,a2,1406 # 8000c720 <etext+0x720>
    800091aa:	fc043583          	ld	a1,-64(s0)
    800091ae:	4509                	li	a0,2
    800091b0:	ffff8097          	auipc	ra,0xffff8
    800091b4:	b2e080e7          	jalr	-1234(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    800091b8:	0001d717          	auipc	a4,0x1d
    800091bc:	d5070713          	addi	a4,a4,-688 # 80025f08 <disk>
    800091c0:	fcc42683          	lw	a3,-52(s0)
    800091c4:	15000793          	li	a5,336
    800091c8:	02f687b3          	mul	a5,a3,a5
    800091cc:	97ba                	add	a5,a5,a4
    800091ce:	679c                	ld	a5,8(a5)
    800091d0:	6605                	lui	a2,0x1
    800091d2:	4581                	li	a1,0
    800091d4:	853e                	mv	a0,a5
    800091d6:	ffff8097          	auipc	ra,0xffff8
    800091da:	33a080e7          	jalr	826(ra) # 80001510 <memset>
  memset(disk[id].avail, 0, PGSIZE);
    800091de:	0001d717          	auipc	a4,0x1d
    800091e2:	d2a70713          	addi	a4,a4,-726 # 80025f08 <disk>
    800091e6:	fcc42683          	lw	a3,-52(s0)
    800091ea:	15000793          	li	a5,336
    800091ee:	02f687b3          	mul	a5,a3,a5
    800091f2:	97ba                	add	a5,a5,a4
    800091f4:	6b9c                	ld	a5,16(a5)
    800091f6:	6605                	lui	a2,0x1
    800091f8:	4581                	li	a1,0
    800091fa:	853e                	mv	a0,a5
    800091fc:	ffff8097          	auipc	ra,0xffff8
    80009200:	314080e7          	jalr	788(ra) # 80001510 <memset>
  memset(disk[id].used, 0, PGSIZE);
    80009204:	0001d717          	auipc	a4,0x1d
    80009208:	d0470713          	addi	a4,a4,-764 # 80025f08 <disk>
    8000920c:	fcc42683          	lw	a3,-52(s0)
    80009210:	15000793          	li	a5,336
    80009214:	02f687b3          	mul	a5,a3,a5
    80009218:	97ba                	add	a5,a5,a4
    8000921a:	6f9c                	ld	a5,24(a5)
    8000921c:	6605                	lui	a2,0x1
    8000921e:	4581                	li	a1,0
    80009220:	853e                	mv	a0,a5
    80009222:	ffff8097          	auipc	ra,0xffff8
    80009226:	2ee080e7          	jalr	750(ra) # 80001510 <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    8000922a:	fcc42703          	lw	a4,-52(s0)
    8000922e:	67c1                	lui	a5,0x10
    80009230:	0785                	addi	a5,a5,1
    80009232:	97ba                	add	a5,a5,a4
    80009234:	07b2                	slli	a5,a5,0xc
    80009236:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    8000923a:	873e                	mv	a4,a5
    8000923c:	47a1                	li	a5,8
    8000923e:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    80009240:	0001d717          	auipc	a4,0x1d
    80009244:	cc870713          	addi	a4,a4,-824 # 80025f08 <disk>
    80009248:	fcc42683          	lw	a3,-52(s0)
    8000924c:	15000793          	li	a5,336
    80009250:	02f687b3          	mul	a5,a3,a5
    80009254:	97ba                	add	a5,a5,a4
    80009256:	679c                	ld	a5,8(a5)
    80009258:	86be                	mv	a3,a5
    8000925a:	fcc42703          	lw	a4,-52(s0)
    8000925e:	67c1                	lui	a5,0x10
    80009260:	0785                	addi	a5,a5,1
    80009262:	97ba                	add	a5,a5,a4
    80009264:	07b2                	slli	a5,a5,0xc
    80009266:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    8000926a:	873e                	mv	a4,a5
    8000926c:	0006879b          	sext.w	a5,a3
    80009270:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    80009272:	0001d717          	auipc	a4,0x1d
    80009276:	c9670713          	addi	a4,a4,-874 # 80025f08 <disk>
    8000927a:	fcc42683          	lw	a3,-52(s0)
    8000927e:	15000793          	li	a5,336
    80009282:	02f687b3          	mul	a5,a3,a5
    80009286:	97ba                	add	a5,a5,a4
    80009288:	679c                	ld	a5,8(a5)
    8000928a:	0207d693          	srli	a3,a5,0x20
    8000928e:	fcc42703          	lw	a4,-52(s0)
    80009292:	67c1                	lui	a5,0x10
    80009294:	0785                	addi	a5,a5,1
    80009296:	97ba                	add	a5,a5,a4
    80009298:	07b2                	slli	a5,a5,0xc
    8000929a:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    8000929e:	873e                	mv	a4,a5
    800092a0:	0006879b          	sext.w	a5,a3
    800092a4:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    800092a6:	0001d717          	auipc	a4,0x1d
    800092aa:	c6270713          	addi	a4,a4,-926 # 80025f08 <disk>
    800092ae:	fcc42683          	lw	a3,-52(s0)
    800092b2:	15000793          	li	a5,336
    800092b6:	02f687b3          	mul	a5,a3,a5
    800092ba:	97ba                	add	a5,a5,a4
    800092bc:	6b9c                	ld	a5,16(a5)
    800092be:	86be                	mv	a3,a5
    800092c0:	fcc42703          	lw	a4,-52(s0)
    800092c4:	67c1                	lui	a5,0x10
    800092c6:	0785                	addi	a5,a5,1
    800092c8:	97ba                	add	a5,a5,a4
    800092ca:	07b2                	slli	a5,a5,0xc
    800092cc:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    800092d0:	873e                	mv	a4,a5
    800092d2:	0006879b          	sext.w	a5,a3
    800092d6:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    800092d8:	0001d717          	auipc	a4,0x1d
    800092dc:	c3070713          	addi	a4,a4,-976 # 80025f08 <disk>
    800092e0:	fcc42683          	lw	a3,-52(s0)
    800092e4:	15000793          	li	a5,336
    800092e8:	02f687b3          	mul	a5,a3,a5
    800092ec:	97ba                	add	a5,a5,a4
    800092ee:	6b9c                	ld	a5,16(a5)
    800092f0:	0207d693          	srli	a3,a5,0x20
    800092f4:	fcc42703          	lw	a4,-52(s0)
    800092f8:	67c1                	lui	a5,0x10
    800092fa:	0785                	addi	a5,a5,1
    800092fc:	97ba                	add	a5,a5,a4
    800092fe:	07b2                	slli	a5,a5,0xc
    80009300:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    80009304:	873e                	mv	a4,a5
    80009306:	0006879b          	sext.w	a5,a3
    8000930a:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    8000930c:	0001d717          	auipc	a4,0x1d
    80009310:	bfc70713          	addi	a4,a4,-1028 # 80025f08 <disk>
    80009314:	fcc42683          	lw	a3,-52(s0)
    80009318:	15000793          	li	a5,336
    8000931c:	02f687b3          	mul	a5,a3,a5
    80009320:	97ba                	add	a5,a5,a4
    80009322:	6f9c                	ld	a5,24(a5)
    80009324:	86be                	mv	a3,a5
    80009326:	fcc42703          	lw	a4,-52(s0)
    8000932a:	67c1                	lui	a5,0x10
    8000932c:	0785                	addi	a5,a5,1
    8000932e:	97ba                	add	a5,a5,a4
    80009330:	07b2                	slli	a5,a5,0xc
    80009332:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    80009336:	873e                	mv	a4,a5
    80009338:	0006879b          	sext.w	a5,a3
    8000933c:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    8000933e:	0001d717          	auipc	a4,0x1d
    80009342:	bca70713          	addi	a4,a4,-1078 # 80025f08 <disk>
    80009346:	fcc42683          	lw	a3,-52(s0)
    8000934a:	15000793          	li	a5,336
    8000934e:	02f687b3          	mul	a5,a3,a5
    80009352:	97ba                	add	a5,a5,a4
    80009354:	6f9c                	ld	a5,24(a5)
    80009356:	0207d693          	srli	a3,a5,0x20
    8000935a:	fcc42703          	lw	a4,-52(s0)
    8000935e:	67c1                	lui	a5,0x10
    80009360:	0785                	addi	a5,a5,1
    80009362:	97ba                	add	a5,a5,a4
    80009364:	07b2                	slli	a5,a5,0xc
    80009366:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    8000936a:	873e                	mv	a4,a5
    8000936c:	0006879b          	sext.w	a5,a3
    80009370:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80009372:	fcc42703          	lw	a4,-52(s0)
    80009376:	67c1                	lui	a5,0x10
    80009378:	0785                	addi	a5,a5,1
    8000937a:	97ba                	add	a5,a5,a4
    8000937c:	07b2                	slli	a5,a5,0xc
    8000937e:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80009382:	873e                	mv	a4,a5
    80009384:	4785                	li	a5,1
    80009386:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80009388:	fe042623          	sw	zero,-20(s0)
    8000938c:	a03d                	j	800093ba <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    8000938e:	0001d697          	auipc	a3,0x1d
    80009392:	b7a68693          	addi	a3,a3,-1158 # 80025f08 <disk>
    80009396:	fec42703          	lw	a4,-20(s0)
    8000939a:	fcc42603          	lw	a2,-52(s0)
    8000939e:	15000793          	li	a5,336
    800093a2:	02f607b3          	mul	a5,a2,a5
    800093a6:	97b6                	add	a5,a5,a3
    800093a8:	97ba                	add	a5,a5,a4
    800093aa:	4705                	li	a4,1
    800093ac:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    800093b0:	fec42783          	lw	a5,-20(s0)
    800093b4:	2785                	addiw	a5,a5,1
    800093b6:	fef42623          	sw	a5,-20(s0)
    800093ba:	fec42783          	lw	a5,-20(s0)
    800093be:	0007871b          	sext.w	a4,a5
    800093c2:	479d                	li	a5,7
    800093c4:	fce7d5e3          	bge	a5,a4,8000938e <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    800093c8:	fe842783          	lw	a5,-24(s0)
    800093cc:	0047e793          	ori	a5,a5,4
    800093d0:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    800093d4:	fcc42703          	lw	a4,-52(s0)
    800093d8:	67c1                	lui	a5,0x10
    800093da:	0785                	addi	a5,a5,1
    800093dc:	97ba                	add	a5,a5,a4
    800093de:	07b2                	slli	a5,a5,0xc
    800093e0:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800093e4:	873e                	mv	a4,a5
    800093e6:	fe842783          	lw	a5,-24(s0)
    800093ea:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    800093ec:	fcc42783          	lw	a5,-52(s0)
    800093f0:	0007871b          	sext.w	a4,a5
    800093f4:	4785                	li	a5,1
    800093f6:	06f71663          	bne	a4,a5,80009462 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    800093fa:	ffff8097          	auipc	ra,0xffff8
    800093fe:	ddc080e7          	jalr	-548(ra) # 800011d6 <kalloc>
    80009402:	872a                	mv	a4,a0
    80009404:	0001d797          	auipc	a5,0x1d
    80009408:	da478793          	addi	a5,a5,-604 # 800261a8 <swap_buffer>
    8000940c:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    8000940e:	0001d797          	auipc	a5,0x1d
    80009412:	d9a78793          	addi	a5,a5,-614 # 800261a8 <swap_buffer>
    80009416:	639c                	ld	a5,0(a5)
    80009418:	eb89                	bnez	a5,8000942a <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    8000941a:	00003517          	auipc	a0,0x3
    8000941e:	31e50513          	addi	a0,a0,798 # 8000c738 <etext+0x738>
    80009422:	ffff8097          	auipc	ra,0xffff8
    80009426:	86a080e7          	jalr	-1942(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    8000942a:	0001d797          	auipc	a5,0x1d
    8000942e:	d7e78793          	addi	a5,a5,-642 # 800261a8 <swap_buffer>
    80009432:	639c                	ld	a5,0(a5)
    80009434:	40000613          	li	a2,1024
    80009438:	4581                	li	a1,0
    8000943a:	853e                	mv	a0,a5
    8000943c:	ffff8097          	auipc	ra,0xffff8
    80009440:	0d4080e7          	jalr	212(ra) # 80001510 <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    80009444:	0001d797          	auipc	a5,0x1d
    80009448:	d6478793          	addi	a5,a5,-668 # 800261a8 <swap_buffer>
    8000944c:	639c                	ld	a5,0(a5)
    8000944e:	07c1                	addi	a5,a5,16
    80009450:	00003597          	auipc	a1,0x3
    80009454:	31858593          	addi	a1,a1,792 # 8000c768 <etext+0x768>
    80009458:	853e                	mv	a0,a5
    8000945a:	ffffd097          	auipc	ra,0xffffd
    8000945e:	30c080e7          	jalr	780(ra) # 80006766 <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    80009462:	0001                	nop
    80009464:	70e2                	ld	ra,56(sp)
    80009466:	7442                	ld	s0,48(sp)
    80009468:	6121                	addi	sp,sp,64
    8000946a:	8082                	ret

000000008000946c <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    8000946c:	7179                	addi	sp,sp,-48
    8000946e:	f422                	sd	s0,40(sp)
    80009470:	1800                	addi	s0,sp,48
    80009472:	87aa                	mv	a5,a0
    80009474:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    80009478:	fe042623          	sw	zero,-20(s0)
    8000947c:	a891                	j	800094d0 <alloc_desc+0x64>
    if(disk[id].free[i]){
    8000947e:	0001d697          	auipc	a3,0x1d
    80009482:	a8a68693          	addi	a3,a3,-1398 # 80025f08 <disk>
    80009486:	fec42703          	lw	a4,-20(s0)
    8000948a:	fdc42603          	lw	a2,-36(s0)
    8000948e:	15000793          	li	a5,336
    80009492:	02f607b3          	mul	a5,a2,a5
    80009496:	97b6                	add	a5,a5,a3
    80009498:	97ba                	add	a5,a5,a4
    8000949a:	0207c783          	lbu	a5,32(a5)
    8000949e:	c785                	beqz	a5,800094c6 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    800094a0:	0001d697          	auipc	a3,0x1d
    800094a4:	a6868693          	addi	a3,a3,-1432 # 80025f08 <disk>
    800094a8:	fec42703          	lw	a4,-20(s0)
    800094ac:	fdc42603          	lw	a2,-36(s0)
    800094b0:	15000793          	li	a5,336
    800094b4:	02f607b3          	mul	a5,a2,a5
    800094b8:	97b6                	add	a5,a5,a3
    800094ba:	97ba                	add	a5,a5,a4
    800094bc:	02078023          	sb	zero,32(a5)
      return i;
    800094c0:	fec42783          	lw	a5,-20(s0)
    800094c4:	a831                	j	800094e0 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    800094c6:	fec42783          	lw	a5,-20(s0)
    800094ca:	2785                	addiw	a5,a5,1
    800094cc:	fef42623          	sw	a5,-20(s0)
    800094d0:	fec42783          	lw	a5,-20(s0)
    800094d4:	0007871b          	sext.w	a4,a5
    800094d8:	479d                	li	a5,7
    800094da:	fae7d2e3          	bge	a5,a4,8000947e <alloc_desc+0x12>
    }
  }
  return -1;
    800094de:	57fd                	li	a5,-1
}
    800094e0:	853e                	mv	a0,a5
    800094e2:	7422                	ld	s0,40(sp)
    800094e4:	6145                	addi	sp,sp,48
    800094e6:	8082                	ret

00000000800094e8 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    800094e8:	1101                	addi	sp,sp,-32
    800094ea:	ec06                	sd	ra,24(sp)
    800094ec:	e822                	sd	s0,16(sp)
    800094ee:	1000                	addi	s0,sp,32
    800094f0:	87aa                	mv	a5,a0
    800094f2:	872e                	mv	a4,a1
    800094f4:	fef42623          	sw	a5,-20(s0)
    800094f8:	87ba                	mv	a5,a4
    800094fa:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    800094fe:	fe842783          	lw	a5,-24(s0)
    80009502:	0007871b          	sext.w	a4,a5
    80009506:	479d                	li	a5,7
    80009508:	02e7d863          	bge	a5,a4,80009538 <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    8000950c:	0001d717          	auipc	a4,0x1d
    80009510:	9fc70713          	addi	a4,a4,-1540 # 80025f08 <disk>
    80009514:	fec42683          	lw	a3,-20(s0)
    80009518:	15000793          	li	a5,336
    8000951c:	02f687b3          	mul	a5,a3,a5
    80009520:	97ba                	add	a5,a5,a4
    80009522:	639c                	ld	a5,0(a5)
    80009524:	00003617          	auipc	a2,0x3
    80009528:	25460613          	addi	a2,a2,596 # 8000c778 <etext+0x778>
    8000952c:	85be                	mv	a1,a5
    8000952e:	4509                	li	a0,2
    80009530:	ffff7097          	auipc	ra,0xffff7
    80009534:	7ae080e7          	jalr	1966(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    80009538:	0001d697          	auipc	a3,0x1d
    8000953c:	9d068693          	addi	a3,a3,-1584 # 80025f08 <disk>
    80009540:	fe842703          	lw	a4,-24(s0)
    80009544:	fec42603          	lw	a2,-20(s0)
    80009548:	15000793          	li	a5,336
    8000954c:	02f607b3          	mul	a5,a2,a5
    80009550:	97b6                	add	a5,a5,a3
    80009552:	97ba                	add	a5,a5,a4
    80009554:	0207c783          	lbu	a5,32(a5)
    80009558:	c79d                	beqz	a5,80009586 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    8000955a:	0001d717          	auipc	a4,0x1d
    8000955e:	9ae70713          	addi	a4,a4,-1618 # 80025f08 <disk>
    80009562:	fec42683          	lw	a3,-20(s0)
    80009566:	15000793          	li	a5,336
    8000956a:	02f687b3          	mul	a5,a3,a5
    8000956e:	97ba                	add	a5,a5,a4
    80009570:	639c                	ld	a5,0(a5)
    80009572:	00003617          	auipc	a2,0x3
    80009576:	21660613          	addi	a2,a2,534 # 8000c788 <etext+0x788>
    8000957a:	85be                	mv	a1,a5
    8000957c:	4509                	li	a0,2
    8000957e:	ffff7097          	auipc	ra,0xffff7
    80009582:	760080e7          	jalr	1888(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    80009586:	0001d717          	auipc	a4,0x1d
    8000958a:	98270713          	addi	a4,a4,-1662 # 80025f08 <disk>
    8000958e:	fec42683          	lw	a3,-20(s0)
    80009592:	15000793          	li	a5,336
    80009596:	02f687b3          	mul	a5,a3,a5
    8000959a:	97ba                	add	a5,a5,a4
    8000959c:	6798                	ld	a4,8(a5)
    8000959e:	fe842783          	lw	a5,-24(s0)
    800095a2:	0792                	slli	a5,a5,0x4
    800095a4:	97ba                	add	a5,a5,a4
    800095a6:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    800095aa:	0001d717          	auipc	a4,0x1d
    800095ae:	95e70713          	addi	a4,a4,-1698 # 80025f08 <disk>
    800095b2:	fec42683          	lw	a3,-20(s0)
    800095b6:	15000793          	li	a5,336
    800095ba:	02f687b3          	mul	a5,a3,a5
    800095be:	97ba                	add	a5,a5,a4
    800095c0:	6798                	ld	a4,8(a5)
    800095c2:	fe842783          	lw	a5,-24(s0)
    800095c6:	0792                	slli	a5,a5,0x4
    800095c8:	97ba                	add	a5,a5,a4
    800095ca:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    800095ce:	0001d717          	auipc	a4,0x1d
    800095d2:	93a70713          	addi	a4,a4,-1734 # 80025f08 <disk>
    800095d6:	fec42683          	lw	a3,-20(s0)
    800095da:	15000793          	li	a5,336
    800095de:	02f687b3          	mul	a5,a3,a5
    800095e2:	97ba                	add	a5,a5,a4
    800095e4:	6798                	ld	a4,8(a5)
    800095e6:	fe842783          	lw	a5,-24(s0)
    800095ea:	0792                	slli	a5,a5,0x4
    800095ec:	97ba                	add	a5,a5,a4
    800095ee:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    800095f2:	0001d717          	auipc	a4,0x1d
    800095f6:	91670713          	addi	a4,a4,-1770 # 80025f08 <disk>
    800095fa:	fec42683          	lw	a3,-20(s0)
    800095fe:	15000793          	li	a5,336
    80009602:	02f687b3          	mul	a5,a3,a5
    80009606:	97ba                	add	a5,a5,a4
    80009608:	6798                	ld	a4,8(a5)
    8000960a:	fe842783          	lw	a5,-24(s0)
    8000960e:	0792                	slli	a5,a5,0x4
    80009610:	97ba                	add	a5,a5,a4
    80009612:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    80009616:	0001d697          	auipc	a3,0x1d
    8000961a:	8f268693          	addi	a3,a3,-1806 # 80025f08 <disk>
    8000961e:	fe842703          	lw	a4,-24(s0)
    80009622:	fec42603          	lw	a2,-20(s0)
    80009626:	15000793          	li	a5,336
    8000962a:	02f607b3          	mul	a5,a2,a5
    8000962e:	97b6                	add	a5,a5,a3
    80009630:	97ba                	add	a5,a5,a4
    80009632:	4705                	li	a4,1
    80009634:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    80009638:	0001d717          	auipc	a4,0x1d
    8000963c:	8d070713          	addi	a4,a4,-1840 # 80025f08 <disk>
    80009640:	fec42683          	lw	a3,-20(s0)
    80009644:	15000793          	li	a5,336
    80009648:	02f687b3          	mul	a5,a3,a5
    8000964c:	97ba                	add	a5,a5,a4
    8000964e:	1487a783          	lw	a5,328(a5)
    80009652:	e39d                	bnez	a5,80009678 <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    80009654:	fec42703          	lw	a4,-20(s0)
    80009658:	15000793          	li	a5,336
    8000965c:	02f707b3          	mul	a5,a4,a5
    80009660:	02078713          	addi	a4,a5,32
    80009664:	0001d797          	auipc	a5,0x1d
    80009668:	8a478793          	addi	a5,a5,-1884 # 80025f08 <disk>
    8000966c:	97ba                	add	a5,a5,a4
    8000966e:	853e                	mv	a0,a5
    80009670:	ffffa097          	auipc	ra,0xffffa
    80009674:	fe6080e7          	jalr	-26(ra) # 80003656 <wakeup>
  }
}
    80009678:	0001                	nop
    8000967a:	60e2                	ld	ra,24(sp)
    8000967c:	6442                	ld	s0,16(sp)
    8000967e:	6105                	addi	sp,sp,32
    80009680:	8082                	ret

0000000080009682 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009682:	7179                	addi	sp,sp,-48
    80009684:	f406                	sd	ra,40(sp)
    80009686:	f022                	sd	s0,32(sp)
    80009688:	1800                	addi	s0,sp,48
    8000968a:	87aa                	mv	a5,a0
    8000968c:	872e                	mv	a4,a1
    8000968e:	fcf42e23          	sw	a5,-36(s0)
    80009692:	87ba                	mv	a5,a4
    80009694:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    80009698:	0001d717          	auipc	a4,0x1d
    8000969c:	87070713          	addi	a4,a4,-1936 # 80025f08 <disk>
    800096a0:	fdc42683          	lw	a3,-36(s0)
    800096a4:	15000793          	li	a5,336
    800096a8:	02f687b3          	mul	a5,a3,a5
    800096ac:	97ba                	add	a5,a5,a4
    800096ae:	6798                	ld	a4,8(a5)
    800096b0:	fd842783          	lw	a5,-40(s0)
    800096b4:	0792                	slli	a5,a5,0x4
    800096b6:	97ba                	add	a5,a5,a4
    800096b8:	00c7d783          	lhu	a5,12(a5)
    800096bc:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    800096c0:	0001d717          	auipc	a4,0x1d
    800096c4:	84870713          	addi	a4,a4,-1976 # 80025f08 <disk>
    800096c8:	fdc42683          	lw	a3,-36(s0)
    800096cc:	15000793          	li	a5,336
    800096d0:	02f687b3          	mul	a5,a3,a5
    800096d4:	97ba                	add	a5,a5,a4
    800096d6:	6798                	ld	a4,8(a5)
    800096d8:	fd842783          	lw	a5,-40(s0)
    800096dc:	0792                	slli	a5,a5,0x4
    800096de:	97ba                	add	a5,a5,a4
    800096e0:	00e7d783          	lhu	a5,14(a5)
    800096e4:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    800096e8:	fd842703          	lw	a4,-40(s0)
    800096ec:	fdc42783          	lw	a5,-36(s0)
    800096f0:	85ba                	mv	a1,a4
    800096f2:	853e                	mv	a0,a5
    800096f4:	00000097          	auipc	ra,0x0
    800096f8:	df4080e7          	jalr	-524(ra) # 800094e8 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800096fc:	fec42783          	lw	a5,-20(s0)
    80009700:	8b85                	andi	a5,a5,1
    80009702:	2781                	sext.w	a5,a5
    80009704:	c791                	beqz	a5,80009710 <free_chain+0x8e>
      i = nxt;
    80009706:	fe842783          	lw	a5,-24(s0)
    8000970a:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    8000970e:	b769                	j	80009698 <free_chain+0x16>
    else
      break;
    80009710:	0001                	nop
  }
}
    80009712:	0001                	nop
    80009714:	70a2                	ld	ra,40(sp)
    80009716:	7402                	ld	s0,32(sp)
    80009718:	6145                	addi	sp,sp,48
    8000971a:	8082                	ret

000000008000971c <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    8000971c:	7139                	addi	sp,sp,-64
    8000971e:	fc06                	sd	ra,56(sp)
    80009720:	f822                	sd	s0,48(sp)
    80009722:	f426                	sd	s1,40(sp)
    80009724:	0080                	addi	s0,sp,64
    80009726:	87aa                	mv	a5,a0
    80009728:	fcb43023          	sd	a1,-64(s0)
    8000972c:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    80009730:	fc042e23          	sw	zero,-36(s0)
    80009734:	a041                	j	800097b4 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    80009736:	fdc42783          	lw	a5,-36(s0)
    8000973a:	078a                	slli	a5,a5,0x2
    8000973c:	fc043703          	ld	a4,-64(s0)
    80009740:	00f704b3          	add	s1,a4,a5
    80009744:	fcc42783          	lw	a5,-52(s0)
    80009748:	853e                	mv	a0,a5
    8000974a:	00000097          	auipc	ra,0x0
    8000974e:	d22080e7          	jalr	-734(ra) # 8000946c <alloc_desc>
    80009752:	87aa                	mv	a5,a0
    80009754:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009756:	fdc42783          	lw	a5,-36(s0)
    8000975a:	078a                	slli	a5,a5,0x2
    8000975c:	fc043703          	ld	a4,-64(s0)
    80009760:	97ba                	add	a5,a5,a4
    80009762:	439c                	lw	a5,0(a5)
    80009764:	0407d363          	bgez	a5,800097aa <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    80009768:	fc042c23          	sw	zero,-40(s0)
    8000976c:	a02d                	j	80009796 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    8000976e:	fd842783          	lw	a5,-40(s0)
    80009772:	078a                	slli	a5,a5,0x2
    80009774:	fc043703          	ld	a4,-64(s0)
    80009778:	97ba                	add	a5,a5,a4
    8000977a:	4398                	lw	a4,0(a5)
    8000977c:	fcc42783          	lw	a5,-52(s0)
    80009780:	85ba                	mv	a1,a4
    80009782:	853e                	mv	a0,a5
    80009784:	00000097          	auipc	ra,0x0
    80009788:	d64080e7          	jalr	-668(ra) # 800094e8 <free_desc>
      for(int j = 0; j < i; j++)
    8000978c:	fd842783          	lw	a5,-40(s0)
    80009790:	2785                	addiw	a5,a5,1
    80009792:	fcf42c23          	sw	a5,-40(s0)
    80009796:	fd842703          	lw	a4,-40(s0)
    8000979a:	fdc42783          	lw	a5,-36(s0)
    8000979e:	2701                	sext.w	a4,a4
    800097a0:	2781                	sext.w	a5,a5
    800097a2:	fcf746e3          	blt	a4,a5,8000976e <alloc3_desc+0x52>
      return -1;
    800097a6:	57fd                	li	a5,-1
    800097a8:	a831                	j	800097c4 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    800097aa:	fdc42783          	lw	a5,-36(s0)
    800097ae:	2785                	addiw	a5,a5,1
    800097b0:	fcf42e23          	sw	a5,-36(s0)
    800097b4:	fdc42783          	lw	a5,-36(s0)
    800097b8:	0007871b          	sext.w	a4,a5
    800097bc:	4789                	li	a5,2
    800097be:	f6e7dce3          	bge	a5,a4,80009736 <alloc3_desc+0x1a>
    }
  }
  return 0;
    800097c2:	4781                	li	a5,0
}
    800097c4:	853e                	mv	a0,a5
    800097c6:	70e2                	ld	ra,56(sp)
    800097c8:	7442                	ld	s0,48(sp)
    800097ca:	74a2                	ld	s1,40(sp)
    800097cc:	6121                	addi	sp,sp,64
    800097ce:	8082                	ret

00000000800097d0 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    800097d0:	715d                	addi	sp,sp,-80
    800097d2:	e486                	sd	ra,72(sp)
    800097d4:	e0a2                	sd	s0,64(sp)
    800097d6:	0880                	addi	s0,sp,80
    800097d8:	87aa                	mv	a5,a0
    800097da:	fcb43023          	sd	a1,-64(s0)
    800097de:	8736                	mv	a4,a3
    800097e0:	fcf42623          	sw	a5,-52(s0)
    800097e4:	87b2                	mv	a5,a2
    800097e6:	fcf42423          	sw	a5,-56(s0)
    800097ea:	87ba                	mv	a5,a4
    800097ec:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    800097f0:	fc043783          	ld	a5,-64(s0)
    800097f4:	47dc                	lw	a5,12(a5)
    800097f6:	0017979b          	slliw	a5,a5,0x1
    800097fa:	2781                	sext.w	a5,a5
    800097fc:	1782                	slli	a5,a5,0x20
    800097fe:	9381                	srli	a5,a5,0x20
    80009800:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    80009804:	fcc42703          	lw	a4,-52(s0)
    80009808:	15000793          	li	a5,336
    8000980c:	02f707b3          	mul	a5,a4,a5
    80009810:	13078713          	addi	a4,a5,304
    80009814:	0001c797          	auipc	a5,0x1c
    80009818:	6f478793          	addi	a5,a5,1780 # 80025f08 <disk>
    8000981c:	97ba                	add	a5,a5,a4
    8000981e:	853e                	mv	a0,a5
    80009820:	ffff8097          	auipc	ra,0xffff8
    80009824:	b1c080e7          	jalr	-1252(ra) # 8000133c <acquire>
  disk[id].bw_transfer = busy_wait;
    80009828:	0001c717          	auipc	a4,0x1c
    8000982c:	6e070713          	addi	a4,a4,1760 # 80025f08 <disk>
    80009830:	fcc42683          	lw	a3,-52(s0)
    80009834:	15000793          	li	a5,336
    80009838:	02f687b3          	mul	a5,a3,a5
    8000983c:	97ba                	add	a5,a5,a4
    8000983e:	fbc42703          	lw	a4,-68(s0)
    80009842:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    80009846:	fd040713          	addi	a4,s0,-48
    8000984a:	fcc42783          	lw	a5,-52(s0)
    8000984e:	85ba                	mv	a1,a4
    80009850:	853e                	mv	a0,a5
    80009852:	00000097          	auipc	ra,0x0
    80009856:	eca080e7          	jalr	-310(ra) # 8000971c <alloc3_desc>
    8000985a:	87aa                	mv	a5,a0
    8000985c:	c3e9                	beqz	a5,8000991e <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    8000985e:	fbc42783          	lw	a5,-68(s0)
    80009862:	2781                	sext.w	a5,a5
    80009864:	e3b9                	bnez	a5,800098aa <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    80009866:	fcc42703          	lw	a4,-52(s0)
    8000986a:	15000793          	li	a5,336
    8000986e:	02f707b3          	mul	a5,a4,a5
    80009872:	02078713          	addi	a4,a5,32
    80009876:	0001c797          	auipc	a5,0x1c
    8000987a:	69278793          	addi	a5,a5,1682 # 80025f08 <disk>
    8000987e:	00f706b3          	add	a3,a4,a5
    80009882:	fcc42703          	lw	a4,-52(s0)
    80009886:	15000793          	li	a5,336
    8000988a:	02f707b3          	mul	a5,a4,a5
    8000988e:	13078713          	addi	a4,a5,304
    80009892:	0001c797          	auipc	a5,0x1c
    80009896:	67678793          	addi	a5,a5,1654 # 80025f08 <disk>
    8000989a:	97ba                	add	a5,a5,a4
    8000989c:	85be                	mv	a1,a5
    8000989e:	8536                	mv	a0,a3
    800098a0:	ffffa097          	auipc	ra,0xffffa
    800098a4:	d3a080e7          	jalr	-710(ra) # 800035da <sleep>
    800098a8:	bf79                	j	80009846 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    800098aa:	fcc42703          	lw	a4,-52(s0)
    800098ae:	15000793          	li	a5,336
    800098b2:	02f707b3          	mul	a5,a4,a5
    800098b6:	13078713          	addi	a4,a5,304
    800098ba:	0001c797          	auipc	a5,0x1c
    800098be:	64e78793          	addi	a5,a5,1614 # 80025f08 <disk>
    800098c2:	97ba                	add	a5,a5,a4
    800098c4:	853e                	mv	a0,a5
    800098c6:	ffff8097          	auipc	ra,0xffff8
    800098ca:	ada080e7          	jalr	-1318(ra) # 800013a0 <release>
        intr_on();
    800098ce:	fffff097          	auipc	ra,0xfffff
    800098d2:	362080e7          	jalr	866(ra) # 80008c30 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    800098d6:	0001                	nop
    800098d8:	fd040713          	addi	a4,s0,-48
    800098dc:	fcc42783          	lw	a5,-52(s0)
    800098e0:	85ba                	mv	a1,a4
    800098e2:	853e                	mv	a0,a5
    800098e4:	00000097          	auipc	ra,0x0
    800098e8:	e38080e7          	jalr	-456(ra) # 8000971c <alloc3_desc>
    800098ec:	87aa                	mv	a5,a0
    800098ee:	f7ed                	bnez	a5,800098d8 <virtio_disk_rw+0x108>
        intr_off();
    800098f0:	fffff097          	auipc	ra,0xfffff
    800098f4:	36a080e7          	jalr	874(ra) # 80008c5a <intr_off>
        acquire(&disk[id].vdisk_lock);
    800098f8:	fcc42703          	lw	a4,-52(s0)
    800098fc:	15000793          	li	a5,336
    80009900:	02f707b3          	mul	a5,a4,a5
    80009904:	13078713          	addi	a4,a5,304
    80009908:	0001c797          	auipc	a5,0x1c
    8000990c:	60078793          	addi	a5,a5,1536 # 80025f08 <disk>
    80009910:	97ba                	add	a5,a5,a4
    80009912:	853e                	mv	a0,a5
    80009914:	ffff8097          	auipc	ra,0xffff8
    80009918:	a28080e7          	jalr	-1496(ra) # 8000133c <acquire>
    if(alloc3_desc(id, idx) == 0) {
    8000991c:	b72d                	j	80009846 <virtio_disk_rw+0x76>
      break;
    8000991e:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    80009920:	fd042683          	lw	a3,-48(s0)
    80009924:	fcc42703          	lw	a4,-52(s0)
    80009928:	87ba                	mv	a5,a4
    8000992a:	078a                	slli	a5,a5,0x2
    8000992c:	97ba                	add	a5,a5,a4
    8000992e:	078a                	slli	a5,a5,0x2
    80009930:	97ba                	add	a5,a5,a4
    80009932:	97b6                	add	a5,a5,a3
    80009934:	07ad                	addi	a5,a5,11
    80009936:	00479713          	slli	a4,a5,0x4
    8000993a:	0001c797          	auipc	a5,0x1c
    8000993e:	5ce78793          	addi	a5,a5,1486 # 80025f08 <disk>
    80009942:	97ba                	add	a5,a5,a4
    80009944:	fef43023          	sd	a5,-32(s0)

  if(write)
    80009948:	fc842783          	lw	a5,-56(s0)
    8000994c:	2781                	sext.w	a5,a5
    8000994e:	c791                	beqz	a5,8000995a <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009950:	fe043783          	ld	a5,-32(s0)
    80009954:	4705                	li	a4,1
    80009956:	c398                	sw	a4,0(a5)
    80009958:	a029                	j	80009962 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000995a:	fe043783          	ld	a5,-32(s0)
    8000995e:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009962:	fe043783          	ld	a5,-32(s0)
    80009966:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000996a:	fe043783          	ld	a5,-32(s0)
    8000996e:	fe843703          	ld	a4,-24(s0)
    80009972:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    80009974:	0001c717          	auipc	a4,0x1c
    80009978:	59470713          	addi	a4,a4,1428 # 80025f08 <disk>
    8000997c:	fcc42683          	lw	a3,-52(s0)
    80009980:	15000793          	li	a5,336
    80009984:	02f687b3          	mul	a5,a3,a5
    80009988:	97ba                	add	a5,a5,a4
    8000998a:	6798                	ld	a4,8(a5)
    8000998c:	fd042783          	lw	a5,-48(s0)
    80009990:	0792                	slli	a5,a5,0x4
    80009992:	97ba                	add	a5,a5,a4
    80009994:	fe043703          	ld	a4,-32(s0)
    80009998:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    8000999a:	0001c717          	auipc	a4,0x1c
    8000999e:	56e70713          	addi	a4,a4,1390 # 80025f08 <disk>
    800099a2:	fcc42683          	lw	a3,-52(s0)
    800099a6:	15000793          	li	a5,336
    800099aa:	02f687b3          	mul	a5,a3,a5
    800099ae:	97ba                	add	a5,a5,a4
    800099b0:	6798                	ld	a4,8(a5)
    800099b2:	fd042783          	lw	a5,-48(s0)
    800099b6:	0792                	slli	a5,a5,0x4
    800099b8:	97ba                	add	a5,a5,a4
    800099ba:	4741                	li	a4,16
    800099bc:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    800099be:	0001c717          	auipc	a4,0x1c
    800099c2:	54a70713          	addi	a4,a4,1354 # 80025f08 <disk>
    800099c6:	fcc42683          	lw	a3,-52(s0)
    800099ca:	15000793          	li	a5,336
    800099ce:	02f687b3          	mul	a5,a3,a5
    800099d2:	97ba                	add	a5,a5,a4
    800099d4:	6798                	ld	a4,8(a5)
    800099d6:	fd042783          	lw	a5,-48(s0)
    800099da:	0792                	slli	a5,a5,0x4
    800099dc:	97ba                	add	a5,a5,a4
    800099de:	4705                	li	a4,1
    800099e0:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    800099e4:	fd442603          	lw	a2,-44(s0)
    800099e8:	0001c717          	auipc	a4,0x1c
    800099ec:	52070713          	addi	a4,a4,1312 # 80025f08 <disk>
    800099f0:	fcc42683          	lw	a3,-52(s0)
    800099f4:	15000793          	li	a5,336
    800099f8:	02f687b3          	mul	a5,a3,a5
    800099fc:	97ba                	add	a5,a5,a4
    800099fe:	6798                	ld	a4,8(a5)
    80009a00:	fd042783          	lw	a5,-48(s0)
    80009a04:	0792                	slli	a5,a5,0x4
    80009a06:	97ba                	add	a5,a5,a4
    80009a08:	03061713          	slli	a4,a2,0x30
    80009a0c:	9341                	srli	a4,a4,0x30
    80009a0e:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    80009a12:	fc043783          	ld	a5,-64(s0)
    80009a16:	05878613          	addi	a2,a5,88
    80009a1a:	0001c717          	auipc	a4,0x1c
    80009a1e:	4ee70713          	addi	a4,a4,1262 # 80025f08 <disk>
    80009a22:	fcc42683          	lw	a3,-52(s0)
    80009a26:	15000793          	li	a5,336
    80009a2a:	02f687b3          	mul	a5,a3,a5
    80009a2e:	97ba                	add	a5,a5,a4
    80009a30:	6798                	ld	a4,8(a5)
    80009a32:	fd442783          	lw	a5,-44(s0)
    80009a36:	0792                	slli	a5,a5,0x4
    80009a38:	97ba                	add	a5,a5,a4
    80009a3a:	8732                	mv	a4,a2
    80009a3c:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    80009a3e:	0001c717          	auipc	a4,0x1c
    80009a42:	4ca70713          	addi	a4,a4,1226 # 80025f08 <disk>
    80009a46:	fcc42683          	lw	a3,-52(s0)
    80009a4a:	15000793          	li	a5,336
    80009a4e:	02f687b3          	mul	a5,a3,a5
    80009a52:	97ba                	add	a5,a5,a4
    80009a54:	6798                	ld	a4,8(a5)
    80009a56:	fd442783          	lw	a5,-44(s0)
    80009a5a:	0792                	slli	a5,a5,0x4
    80009a5c:	97ba                	add	a5,a5,a4
    80009a5e:	40000713          	li	a4,1024
    80009a62:	c798                	sw	a4,8(a5)
  if(write)
    80009a64:	fc842783          	lw	a5,-56(s0)
    80009a68:	2781                	sext.w	a5,a5
    80009a6a:	c785                	beqz	a5,80009a92 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    80009a6c:	0001c717          	auipc	a4,0x1c
    80009a70:	49c70713          	addi	a4,a4,1180 # 80025f08 <disk>
    80009a74:	fcc42683          	lw	a3,-52(s0)
    80009a78:	15000793          	li	a5,336
    80009a7c:	02f687b3          	mul	a5,a3,a5
    80009a80:	97ba                	add	a5,a5,a4
    80009a82:	6798                	ld	a4,8(a5)
    80009a84:	fd442783          	lw	a5,-44(s0)
    80009a88:	0792                	slli	a5,a5,0x4
    80009a8a:	97ba                	add	a5,a5,a4
    80009a8c:	00079623          	sh	zero,12(a5)
    80009a90:	a025                	j	80009ab8 <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009a92:	0001c717          	auipc	a4,0x1c
    80009a96:	47670713          	addi	a4,a4,1142 # 80025f08 <disk>
    80009a9a:	fcc42683          	lw	a3,-52(s0)
    80009a9e:	15000793          	li	a5,336
    80009aa2:	02f687b3          	mul	a5,a3,a5
    80009aa6:	97ba                	add	a5,a5,a4
    80009aa8:	6798                	ld	a4,8(a5)
    80009aaa:	fd442783          	lw	a5,-44(s0)
    80009aae:	0792                	slli	a5,a5,0x4
    80009ab0:	97ba                	add	a5,a5,a4
    80009ab2:	4709                	li	a4,2
    80009ab4:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80009ab8:	0001c717          	auipc	a4,0x1c
    80009abc:	45070713          	addi	a4,a4,1104 # 80025f08 <disk>
    80009ac0:	fcc42683          	lw	a3,-52(s0)
    80009ac4:	15000793          	li	a5,336
    80009ac8:	02f687b3          	mul	a5,a3,a5
    80009acc:	97ba                	add	a5,a5,a4
    80009ace:	6798                	ld	a4,8(a5)
    80009ad0:	fd442783          	lw	a5,-44(s0)
    80009ad4:	0792                	slli	a5,a5,0x4
    80009ad6:	97ba                	add	a5,a5,a4
    80009ad8:	00c7d703          	lhu	a4,12(a5)
    80009adc:	0001c697          	auipc	a3,0x1c
    80009ae0:	42c68693          	addi	a3,a3,1068 # 80025f08 <disk>
    80009ae4:	fcc42603          	lw	a2,-52(s0)
    80009ae8:	15000793          	li	a5,336
    80009aec:	02f607b3          	mul	a5,a2,a5
    80009af0:	97b6                	add	a5,a5,a3
    80009af2:	6794                	ld	a3,8(a5)
    80009af4:	fd442783          	lw	a5,-44(s0)
    80009af8:	0792                	slli	a5,a5,0x4
    80009afa:	97b6                	add	a5,a5,a3
    80009afc:	00176713          	ori	a4,a4,1
    80009b00:	1742                	slli	a4,a4,0x30
    80009b02:	9341                	srli	a4,a4,0x30
    80009b04:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    80009b08:	fd842603          	lw	a2,-40(s0)
    80009b0c:	0001c717          	auipc	a4,0x1c
    80009b10:	3fc70713          	addi	a4,a4,1020 # 80025f08 <disk>
    80009b14:	fcc42683          	lw	a3,-52(s0)
    80009b18:	15000793          	li	a5,336
    80009b1c:	02f687b3          	mul	a5,a3,a5
    80009b20:	97ba                	add	a5,a5,a4
    80009b22:	6798                	ld	a4,8(a5)
    80009b24:	fd442783          	lw	a5,-44(s0)
    80009b28:	0792                	slli	a5,a5,0x4
    80009b2a:	97ba                	add	a5,a5,a4
    80009b2c:	03061713          	slli	a4,a2,0x30
    80009b30:	9341                	srli	a4,a4,0x30
    80009b32:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    80009b36:	fd042603          	lw	a2,-48(s0)
    80009b3a:	0001c697          	auipc	a3,0x1c
    80009b3e:	3ce68693          	addi	a3,a3,974 # 80025f08 <disk>
    80009b42:	fcc42703          	lw	a4,-52(s0)
    80009b46:	87ba                	mv	a5,a4
    80009b48:	078a                	slli	a5,a5,0x2
    80009b4a:	97ba                	add	a5,a5,a4
    80009b4c:	078a                	slli	a5,a5,0x2
    80009b4e:	97ba                	add	a5,a5,a4
    80009b50:	97b2                	add	a5,a5,a2
    80009b52:	078d                	addi	a5,a5,3
    80009b54:	0792                	slli	a5,a5,0x4
    80009b56:	97b6                	add	a5,a5,a3
    80009b58:	577d                	li	a4,-1
    80009b5a:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009b5e:	fd042683          	lw	a3,-48(s0)
    80009b62:	fcc42703          	lw	a4,-52(s0)
    80009b66:	87ba                	mv	a5,a4
    80009b68:	078a                	slli	a5,a5,0x2
    80009b6a:	97ba                	add	a5,a5,a4
    80009b6c:	078a                	slli	a5,a5,0x2
    80009b6e:	97ba                	add	a5,a5,a4
    80009b70:	97b6                	add	a5,a5,a3
    80009b72:	078d                	addi	a5,a5,3
    80009b74:	00479713          	slli	a4,a5,0x4
    80009b78:	0001c797          	auipc	a5,0x1c
    80009b7c:	39078793          	addi	a5,a5,912 # 80025f08 <disk>
    80009b80:	97ba                	add	a5,a5,a4
    80009b82:	00878613          	addi	a2,a5,8
    80009b86:	0001c717          	auipc	a4,0x1c
    80009b8a:	38270713          	addi	a4,a4,898 # 80025f08 <disk>
    80009b8e:	fcc42683          	lw	a3,-52(s0)
    80009b92:	15000793          	li	a5,336
    80009b96:	02f687b3          	mul	a5,a3,a5
    80009b9a:	97ba                	add	a5,a5,a4
    80009b9c:	6798                	ld	a4,8(a5)
    80009b9e:	fd842783          	lw	a5,-40(s0)
    80009ba2:	0792                	slli	a5,a5,0x4
    80009ba4:	97ba                	add	a5,a5,a4
    80009ba6:	8732                	mv	a4,a2
    80009ba8:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    80009baa:	0001c717          	auipc	a4,0x1c
    80009bae:	35e70713          	addi	a4,a4,862 # 80025f08 <disk>
    80009bb2:	fcc42683          	lw	a3,-52(s0)
    80009bb6:	15000793          	li	a5,336
    80009bba:	02f687b3          	mul	a5,a3,a5
    80009bbe:	97ba                	add	a5,a5,a4
    80009bc0:	6798                	ld	a4,8(a5)
    80009bc2:	fd842783          	lw	a5,-40(s0)
    80009bc6:	0792                	slli	a5,a5,0x4
    80009bc8:	97ba                	add	a5,a5,a4
    80009bca:	4705                	li	a4,1
    80009bcc:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009bce:	0001c717          	auipc	a4,0x1c
    80009bd2:	33a70713          	addi	a4,a4,826 # 80025f08 <disk>
    80009bd6:	fcc42683          	lw	a3,-52(s0)
    80009bda:	15000793          	li	a5,336
    80009bde:	02f687b3          	mul	a5,a3,a5
    80009be2:	97ba                	add	a5,a5,a4
    80009be4:	6798                	ld	a4,8(a5)
    80009be6:	fd842783          	lw	a5,-40(s0)
    80009bea:	0792                	slli	a5,a5,0x4
    80009bec:	97ba                	add	a5,a5,a4
    80009bee:	4709                	li	a4,2
    80009bf0:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009bf4:	0001c717          	auipc	a4,0x1c
    80009bf8:	31470713          	addi	a4,a4,788 # 80025f08 <disk>
    80009bfc:	fcc42683          	lw	a3,-52(s0)
    80009c00:	15000793          	li	a5,336
    80009c04:	02f687b3          	mul	a5,a3,a5
    80009c08:	97ba                	add	a5,a5,a4
    80009c0a:	6798                	ld	a4,8(a5)
    80009c0c:	fd842783          	lw	a5,-40(s0)
    80009c10:	0792                	slli	a5,a5,0x4
    80009c12:	97ba                	add	a5,a5,a4
    80009c14:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009c18:	fc043783          	ld	a5,-64(s0)
    80009c1c:	4705                	li	a4,1
    80009c1e:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    80009c20:	fd042603          	lw	a2,-48(s0)
    80009c24:	0001c697          	auipc	a3,0x1c
    80009c28:	2e468693          	addi	a3,a3,740 # 80025f08 <disk>
    80009c2c:	fcc42703          	lw	a4,-52(s0)
    80009c30:	87ba                	mv	a5,a4
    80009c32:	078a                	slli	a5,a5,0x2
    80009c34:	97ba                	add	a5,a5,a4
    80009c36:	078a                	slli	a5,a5,0x2
    80009c38:	97ba                	add	a5,a5,a4
    80009c3a:	97b2                	add	a5,a5,a2
    80009c3c:	078d                	addi	a5,a5,3
    80009c3e:	0792                	slli	a5,a5,0x4
    80009c40:	97b6                	add	a5,a5,a3
    80009c42:	fc043703          	ld	a4,-64(s0)
    80009c46:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009c48:	fd042583          	lw	a1,-48(s0)
    80009c4c:	0001c717          	auipc	a4,0x1c
    80009c50:	2bc70713          	addi	a4,a4,700 # 80025f08 <disk>
    80009c54:	fcc42683          	lw	a3,-52(s0)
    80009c58:	15000793          	li	a5,336
    80009c5c:	02f687b3          	mul	a5,a3,a5
    80009c60:	97ba                	add	a5,a5,a4
    80009c62:	6b94                	ld	a3,16(a5)
    80009c64:	0001c717          	auipc	a4,0x1c
    80009c68:	2a470713          	addi	a4,a4,676 # 80025f08 <disk>
    80009c6c:	fcc42603          	lw	a2,-52(s0)
    80009c70:	15000793          	li	a5,336
    80009c74:	02f607b3          	mul	a5,a2,a5
    80009c78:	97ba                	add	a5,a5,a4
    80009c7a:	6b9c                	ld	a5,16(a5)
    80009c7c:	0027d783          	lhu	a5,2(a5)
    80009c80:	2781                	sext.w	a5,a5
    80009c82:	8b9d                	andi	a5,a5,7
    80009c84:	2781                	sext.w	a5,a5
    80009c86:	03059713          	slli	a4,a1,0x30
    80009c8a:	9341                	srli	a4,a4,0x30
    80009c8c:	0786                	slli	a5,a5,0x1
    80009c8e:	97b6                	add	a5,a5,a3
    80009c90:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009c94:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009c98:	0001c717          	auipc	a4,0x1c
    80009c9c:	27070713          	addi	a4,a4,624 # 80025f08 <disk>
    80009ca0:	fcc42683          	lw	a3,-52(s0)
    80009ca4:	15000793          	li	a5,336
    80009ca8:	02f687b3          	mul	a5,a3,a5
    80009cac:	97ba                	add	a5,a5,a4
    80009cae:	6b9c                	ld	a5,16(a5)
    80009cb0:	0027d703          	lhu	a4,2(a5)
    80009cb4:	0001c697          	auipc	a3,0x1c
    80009cb8:	25468693          	addi	a3,a3,596 # 80025f08 <disk>
    80009cbc:	fcc42603          	lw	a2,-52(s0)
    80009cc0:	15000793          	li	a5,336
    80009cc4:	02f607b3          	mul	a5,a2,a5
    80009cc8:	97b6                	add	a5,a5,a3
    80009cca:	6b9c                	ld	a5,16(a5)
    80009ccc:	2705                	addiw	a4,a4,1
    80009cce:	1742                	slli	a4,a4,0x30
    80009cd0:	9341                	srli	a4,a4,0x30
    80009cd2:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009cd6:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009cda:	fcc42703          	lw	a4,-52(s0)
    80009cde:	67c1                	lui	a5,0x10
    80009ce0:	0785                	addi	a5,a5,1
    80009ce2:	97ba                	add	a5,a5,a4
    80009ce4:	07b2                	slli	a5,a5,0xc
    80009ce6:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009cea:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009cee:	a871                	j	80009d8a <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009cf0:	fbc42783          	lw	a5,-68(s0)
    80009cf4:	2781                	sext.w	a5,a5
    80009cf6:	e795                	bnez	a5,80009d22 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009cf8:	fcc42703          	lw	a4,-52(s0)
    80009cfc:	15000793          	li	a5,336
    80009d00:	02f707b3          	mul	a5,a4,a5
    80009d04:	13078713          	addi	a4,a5,304
    80009d08:	0001c797          	auipc	a5,0x1c
    80009d0c:	20078793          	addi	a5,a5,512 # 80025f08 <disk>
    80009d10:	97ba                	add	a5,a5,a4
    80009d12:	85be                	mv	a1,a5
    80009d14:	fc043503          	ld	a0,-64(s0)
    80009d18:	ffffa097          	auipc	ra,0xffffa
    80009d1c:	8c2080e7          	jalr	-1854(ra) # 800035da <sleep>
    80009d20:	a0ad                	j	80009d8a <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009d22:	fcc42703          	lw	a4,-52(s0)
    80009d26:	15000793          	li	a5,336
    80009d2a:	02f707b3          	mul	a5,a4,a5
    80009d2e:	13078713          	addi	a4,a5,304
    80009d32:	0001c797          	auipc	a5,0x1c
    80009d36:	1d678793          	addi	a5,a5,470 # 80025f08 <disk>
    80009d3a:	97ba                	add	a5,a5,a4
    80009d3c:	853e                	mv	a0,a5
    80009d3e:	ffff7097          	auipc	ra,0xffff7
    80009d42:	662080e7          	jalr	1634(ra) # 800013a0 <release>
        intr_on();
    80009d46:	fffff097          	auipc	ra,0xfffff
    80009d4a:	eea080e7          	jalr	-278(ra) # 80008c30 <intr_on>
        while(b->disk == 1);
    80009d4e:	0001                	nop
    80009d50:	fc043783          	ld	a5,-64(s0)
    80009d54:	43dc                	lw	a5,4(a5)
    80009d56:	873e                	mv	a4,a5
    80009d58:	4785                	li	a5,1
    80009d5a:	fef70be3          	beq	a4,a5,80009d50 <virtio_disk_rw+0x580>
        intr_off();
    80009d5e:	fffff097          	auipc	ra,0xfffff
    80009d62:	efc080e7          	jalr	-260(ra) # 80008c5a <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009d66:	fcc42703          	lw	a4,-52(s0)
    80009d6a:	15000793          	li	a5,336
    80009d6e:	02f707b3          	mul	a5,a4,a5
    80009d72:	13078713          	addi	a4,a5,304
    80009d76:	0001c797          	auipc	a5,0x1c
    80009d7a:	19278793          	addi	a5,a5,402 # 80025f08 <disk>
    80009d7e:	97ba                	add	a5,a5,a4
    80009d80:	853e                	mv	a0,a5
    80009d82:	ffff7097          	auipc	ra,0xffff7
    80009d86:	5ba080e7          	jalr	1466(ra) # 8000133c <acquire>
  while(b->disk == 1) {
    80009d8a:	fc043783          	ld	a5,-64(s0)
    80009d8e:	43dc                	lw	a5,4(a5)
    80009d90:	873e                	mv	a4,a5
    80009d92:	4785                	li	a5,1
    80009d94:	f4f70ee3          	beq	a4,a5,80009cf0 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    80009d98:	fd042603          	lw	a2,-48(s0)
    80009d9c:	0001c697          	auipc	a3,0x1c
    80009da0:	16c68693          	addi	a3,a3,364 # 80025f08 <disk>
    80009da4:	fcc42703          	lw	a4,-52(s0)
    80009da8:	87ba                	mv	a5,a4
    80009daa:	078a                	slli	a5,a5,0x2
    80009dac:	97ba                	add	a5,a5,a4
    80009dae:	078a                	slli	a5,a5,0x2
    80009db0:	97ba                	add	a5,a5,a4
    80009db2:	97b2                	add	a5,a5,a2
    80009db4:	078d                	addi	a5,a5,3
    80009db6:	0792                	slli	a5,a5,0x4
    80009db8:	97b6                	add	a5,a5,a3
    80009dba:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    80009dbe:	fd042703          	lw	a4,-48(s0)
    80009dc2:	fcc42783          	lw	a5,-52(s0)
    80009dc6:	85ba                	mv	a1,a4
    80009dc8:	853e                	mv	a0,a5
    80009dca:	00000097          	auipc	ra,0x0
    80009dce:	8b8080e7          	jalr	-1864(ra) # 80009682 <free_chain>

  release(&disk[id].vdisk_lock);
    80009dd2:	fcc42703          	lw	a4,-52(s0)
    80009dd6:	15000793          	li	a5,336
    80009dda:	02f707b3          	mul	a5,a4,a5
    80009dde:	13078713          	addi	a4,a5,304
    80009de2:	0001c797          	auipc	a5,0x1c
    80009de6:	12678793          	addi	a5,a5,294 # 80025f08 <disk>
    80009dea:	97ba                	add	a5,a5,a4
    80009dec:	853e                	mv	a0,a5
    80009dee:	ffff7097          	auipc	ra,0xffff7
    80009df2:	5b2080e7          	jalr	1458(ra) # 800013a0 <release>
}
    80009df6:	0001                	nop
    80009df8:	60a6                	ld	ra,72(sp)
    80009dfa:	6406                	ld	s0,64(sp)
    80009dfc:	6161                	addi	sp,sp,80
    80009dfe:	8082                	ret

0000000080009e00 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009e00:	7179                	addi	sp,sp,-48
    80009e02:	f406                	sd	ra,40(sp)
    80009e04:	f022                	sd	s0,32(sp)
    80009e06:	1800                	addi	s0,sp,48
    80009e08:	87aa                	mv	a5,a0
    80009e0a:	fcb43823          	sd	a1,-48(s0)
    80009e0e:	8732                	mv	a4,a2
    80009e10:	fcf42e23          	sw	a5,-36(s0)
    80009e14:	87ba                	mv	a5,a4
    80009e16:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009e1a:	0001c797          	auipc	a5,0x1c
    80009e1e:	38e78793          	addi	a5,a5,910 # 800261a8 <swap_buffer>
    80009e22:	639c                	ld	a5,0(a5)
    80009e24:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009e28:	fdc42703          	lw	a4,-36(s0)
    80009e2c:	fe843783          	ld	a5,-24(s0)
    80009e30:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    80009e32:	fe843783          	ld	a5,-24(s0)
    80009e36:	05878793          	addi	a5,a5,88
    80009e3a:	40000613          	li	a2,1024
    80009e3e:	fd043583          	ld	a1,-48(s0)
    80009e42:	853e                	mv	a0,a5
    80009e44:	ffff7097          	auipc	ra,0xffff7
    80009e48:	7b0080e7          	jalr	1968(ra) # 800015f4 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    80009e4c:	fd842783          	lw	a5,-40(s0)
    80009e50:	86be                	mv	a3,a5
    80009e52:	4605                	li	a2,1
    80009e54:	fe843583          	ld	a1,-24(s0)
    80009e58:	4505                	li	a0,1
    80009e5a:	00000097          	auipc	ra,0x0
    80009e5e:	976080e7          	jalr	-1674(ra) # 800097d0 <virtio_disk_rw>
}
    80009e62:	0001                	nop
    80009e64:	70a2                	ld	ra,40(sp)
    80009e66:	7402                	ld	s0,32(sp)
    80009e68:	6145                	addi	sp,sp,48
    80009e6a:	8082                	ret

0000000080009e6c <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009e6c:	7179                	addi	sp,sp,-48
    80009e6e:	f406                	sd	ra,40(sp)
    80009e70:	f022                	sd	s0,32(sp)
    80009e72:	1800                	addi	s0,sp,48
    80009e74:	87aa                	mv	a5,a0
    80009e76:	fcb43823          	sd	a1,-48(s0)
    80009e7a:	8732                	mv	a4,a2
    80009e7c:	fcf42e23          	sw	a5,-36(s0)
    80009e80:	87ba                	mv	a5,a4
    80009e82:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009e86:	0001c797          	auipc	a5,0x1c
    80009e8a:	32278793          	addi	a5,a5,802 # 800261a8 <swap_buffer>
    80009e8e:	639c                	ld	a5,0(a5)
    80009e90:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009e94:	fdc42703          	lw	a4,-36(s0)
    80009e98:	fe843783          	ld	a5,-24(s0)
    80009e9c:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    80009e9e:	fd842783          	lw	a5,-40(s0)
    80009ea2:	86be                	mv	a3,a5
    80009ea4:	4601                	li	a2,0
    80009ea6:	fe843583          	ld	a1,-24(s0)
    80009eaa:	4505                	li	a0,1
    80009eac:	00000097          	auipc	ra,0x0
    80009eb0:	924080e7          	jalr	-1756(ra) # 800097d0 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009eb4:	fe843783          	ld	a5,-24(s0)
    80009eb8:	05878793          	addi	a5,a5,88
    80009ebc:	40000613          	li	a2,1024
    80009ec0:	85be                	mv	a1,a5
    80009ec2:	fd043503          	ld	a0,-48(s0)
    80009ec6:	ffff7097          	auipc	ra,0xffff7
    80009eca:	72e080e7          	jalr	1838(ra) # 800015f4 <memmove>
}
    80009ece:	0001                	nop
    80009ed0:	70a2                	ld	ra,40(sp)
    80009ed2:	7402                	ld	s0,32(sp)
    80009ed4:	6145                	addi	sp,sp,48
    80009ed6:	8082                	ret

0000000080009ed8 <deallocate_page>:

void deallocate_page(int pageno)
{
    80009ed8:	1101                	addi	sp,sp,-32
    80009eda:	ec06                	sd	ra,24(sp)
    80009edc:	e822                	sd	s0,16(sp)
    80009ede:	1000                	addi	s0,sp,32
    80009ee0:	87aa                	mv	a5,a0
    80009ee2:	fef42623          	sw	a5,-20(s0)
  clearBit(pageno);
    80009ee6:	fec42783          	lw	a5,-20(s0)
    80009eea:	853e                	mv	a0,a5
    80009eec:	fffff097          	auipc	ra,0xfffff
    80009ef0:	df8080e7          	jalr	-520(ra) # 80008ce4 <clearBit>
}
    80009ef4:	0001                	nop
    80009ef6:	60e2                	ld	ra,24(sp)
    80009ef8:	6442                	ld	s0,16(sp)
    80009efa:	6105                	addi	sp,sp,32
    80009efc:	8082                	ret

0000000080009efe <write_page_to_disk>:

int write_page_to_disk(uchar data[4096]) {
    80009efe:	7179                	addi	sp,sp,-48
    80009f00:	f406                	sd	ra,40(sp)
    80009f02:	f022                	sd	s0,32(sp)
    80009f04:	1800                	addi	s0,sp,48
    80009f06:	fca43c23          	sd	a0,-40(s0)
  int pageno = takeFirstFreePage();
    80009f0a:	fffff097          	auipc	ra,0xfffff
    80009f0e:	ed6080e7          	jalr	-298(ra) # 80008de0 <takeFirstFreePage>
    80009f12:	87aa                	mv	a5,a0
    80009f14:	fef42423          	sw	a5,-24(s0)
  if(pageno < 0) return -1;
    80009f18:	fe842783          	lw	a5,-24(s0)
    80009f1c:	2781                	sext.w	a5,a5
    80009f1e:	0007d463          	bgez	a5,80009f26 <write_page_to_disk+0x28>
    80009f22:	57fd                	li	a5,-1
    80009f24:	a8b9                	j	80009f82 <write_page_to_disk+0x84>

  int blockno = pageno*4;
    80009f26:	fe842783          	lw	a5,-24(s0)
    80009f2a:	0027979b          	slliw	a5,a5,0x2
    80009f2e:	fef42223          	sw	a5,-28(s0)
  for(int i = 0; i < 4; i++)
    80009f32:	fe042623          	sw	zero,-20(s0)
    80009f36:	a82d                	j	80009f70 <write_page_to_disk+0x72>
  {
    write_block(blockno + i, data + i*1024, 0);
    80009f38:	fe442703          	lw	a4,-28(s0)
    80009f3c:	fec42783          	lw	a5,-20(s0)
    80009f40:	9fb9                	addw	a5,a5,a4
    80009f42:	0007871b          	sext.w	a4,a5
    80009f46:	fec42783          	lw	a5,-20(s0)
    80009f4a:	00a7979b          	slliw	a5,a5,0xa
    80009f4e:	2781                	sext.w	a5,a5
    80009f50:	86be                	mv	a3,a5
    80009f52:	fd843783          	ld	a5,-40(s0)
    80009f56:	97b6                	add	a5,a5,a3
    80009f58:	4601                	li	a2,0
    80009f5a:	85be                	mv	a1,a5
    80009f5c:	853a                	mv	a0,a4
    80009f5e:	00000097          	auipc	ra,0x0
    80009f62:	ea2080e7          	jalr	-350(ra) # 80009e00 <write_block>
  for(int i = 0; i < 4; i++)
    80009f66:	fec42783          	lw	a5,-20(s0)
    80009f6a:	2785                	addiw	a5,a5,1
    80009f6c:	fef42623          	sw	a5,-20(s0)
    80009f70:	fec42783          	lw	a5,-20(s0)
    80009f74:	0007871b          	sext.w	a4,a5
    80009f78:	478d                	li	a5,3
    80009f7a:	fae7dfe3          	bge	a5,a4,80009f38 <write_page_to_disk+0x3a>
  }

  return pageno;
    80009f7e:	fe842783          	lw	a5,-24(s0)
}
    80009f82:	853e                	mv	a0,a5
    80009f84:	70a2                	ld	ra,40(sp)
    80009f86:	7402                	ld	s0,32(sp)
    80009f88:	6145                	addi	sp,sp,48
    80009f8a:	8082                	ret

0000000080009f8c <take_page_from_disk>:

void take_page_from_disk(int diskpageno, uchar dest[4096]){
    80009f8c:	7179                	addi	sp,sp,-48
    80009f8e:	f406                	sd	ra,40(sp)
    80009f90:	f022                	sd	s0,32(sp)
    80009f92:	1800                	addi	s0,sp,48
    80009f94:	87aa                	mv	a5,a0
    80009f96:	fcb43823          	sd	a1,-48(s0)
    80009f9a:	fcf42e23          	sw	a5,-36(s0)
  int blockno = diskpageno * 4;
    80009f9e:	fdc42783          	lw	a5,-36(s0)
    80009fa2:	0027979b          	slliw	a5,a5,0x2
    80009fa6:	fef42423          	sw	a5,-24(s0)
  for(int i = 0; i < 4; i++)
    80009faa:	fe042623          	sw	zero,-20(s0)
    80009fae:	a82d                	j	80009fe8 <take_page_from_disk+0x5c>
  {
    read_block(blockno + i, dest + i * 1024, 0);
    80009fb0:	fe842703          	lw	a4,-24(s0)
    80009fb4:	fec42783          	lw	a5,-20(s0)
    80009fb8:	9fb9                	addw	a5,a5,a4
    80009fba:	0007871b          	sext.w	a4,a5
    80009fbe:	fec42783          	lw	a5,-20(s0)
    80009fc2:	00a7979b          	slliw	a5,a5,0xa
    80009fc6:	2781                	sext.w	a5,a5
    80009fc8:	86be                	mv	a3,a5
    80009fca:	fd043783          	ld	a5,-48(s0)
    80009fce:	97b6                	add	a5,a5,a3
    80009fd0:	4601                	li	a2,0
    80009fd2:	85be                	mv	a1,a5
    80009fd4:	853a                	mv	a0,a4
    80009fd6:	00000097          	auipc	ra,0x0
    80009fda:	e96080e7          	jalr	-362(ra) # 80009e6c <read_block>
  for(int i = 0; i < 4; i++)
    80009fde:	fec42783          	lw	a5,-20(s0)
    80009fe2:	2785                	addiw	a5,a5,1
    80009fe4:	fef42623          	sw	a5,-20(s0)
    80009fe8:	fec42783          	lw	a5,-20(s0)
    80009fec:	0007871b          	sext.w	a4,a5
    80009ff0:	478d                	li	a5,3
    80009ff2:	fae7dfe3          	bge	a5,a4,80009fb0 <take_page_from_disk+0x24>
  }
  deallocate_page(diskpageno);
    80009ff6:	fdc42783          	lw	a5,-36(s0)
    80009ffa:	853e                	mv	a0,a5
    80009ffc:	00000097          	auipc	ra,0x0
    8000a000:	edc080e7          	jalr	-292(ra) # 80009ed8 <deallocate_page>
}
    8000a004:	0001                	nop
    8000a006:	70a2                	ld	ra,40(sp)
    8000a008:	7402                	ld	s0,32(sp)
    8000a00a:	6145                	addi	sp,sp,48
    8000a00c:	8082                	ret

000000008000a00e <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    8000a00e:	7179                	addi	sp,sp,-48
    8000a010:	f406                	sd	ra,40(sp)
    8000a012:	f022                	sd	s0,32(sp)
    8000a014:	1800                	addi	s0,sp,48
    8000a016:	87aa                	mv	a5,a0
    8000a018:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    8000a01c:	fdc42703          	lw	a4,-36(s0)
    8000a020:	15000793          	li	a5,336
    8000a024:	02f707b3          	mul	a5,a4,a5
    8000a028:	13078713          	addi	a4,a5,304
    8000a02c:	0001c797          	auipc	a5,0x1c
    8000a030:	edc78793          	addi	a5,a5,-292 # 80025f08 <disk>
    8000a034:	97ba                	add	a5,a5,a4
    8000a036:	853e                	mv	a0,a5
    8000a038:	ffff7097          	auipc	ra,0xffff7
    8000a03c:	304080e7          	jalr	772(ra) # 8000133c <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000a040:	fdc42703          	lw	a4,-36(s0)
    8000a044:	67c1                	lui	a5,0x10
    8000a046:	0785                	addi	a5,a5,1
    8000a048:	97ba                	add	a5,a5,a4
    8000a04a:	07b2                	slli	a5,a5,0xc
    8000a04c:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    8000a050:	439c                	lw	a5,0(a5)
    8000a052:	0007869b          	sext.w	a3,a5
    8000a056:	fdc42703          	lw	a4,-36(s0)
    8000a05a:	67c1                	lui	a5,0x10
    8000a05c:	0785                	addi	a5,a5,1
    8000a05e:	97ba                	add	a5,a5,a4
    8000a060:	07b2                	slli	a5,a5,0xc
    8000a062:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    8000a066:	873e                	mv	a4,a5
    8000a068:	87b6                	mv	a5,a3
    8000a06a:	8b8d                	andi	a5,a5,3
    8000a06c:	2781                	sext.w	a5,a5
    8000a06e:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    8000a070:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    8000a074:	aa05                	j	8000a1a4 <virtio_disk_intr+0x196>
    __sync_synchronize();
    8000a076:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    8000a07a:	0001c717          	auipc	a4,0x1c
    8000a07e:	e8e70713          	addi	a4,a4,-370 # 80025f08 <disk>
    8000a082:	fdc42683          	lw	a3,-36(s0)
    8000a086:	15000793          	li	a5,336
    8000a08a:	02f687b3          	mul	a5,a3,a5
    8000a08e:	97ba                	add	a5,a5,a4
    8000a090:	6f98                	ld	a4,24(a5)
    8000a092:	0001c697          	auipc	a3,0x1c
    8000a096:	e7668693          	addi	a3,a3,-394 # 80025f08 <disk>
    8000a09a:	fdc42603          	lw	a2,-36(s0)
    8000a09e:	15000793          	li	a5,336
    8000a0a2:	02f607b3          	mul	a5,a2,a5
    8000a0a6:	97b6                	add	a5,a5,a3
    8000a0a8:	0287d783          	lhu	a5,40(a5)
    8000a0ac:	2781                	sext.w	a5,a5
    8000a0ae:	8b9d                	andi	a5,a5,7
    8000a0b0:	2781                	sext.w	a5,a5
    8000a0b2:	078e                	slli	a5,a5,0x3
    8000a0b4:	97ba                	add	a5,a5,a4
    8000a0b6:	43dc                	lw	a5,4(a5)
    8000a0b8:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    8000a0bc:	0001c697          	auipc	a3,0x1c
    8000a0c0:	e4c68693          	addi	a3,a3,-436 # 80025f08 <disk>
    8000a0c4:	fec42603          	lw	a2,-20(s0)
    8000a0c8:	fdc42703          	lw	a4,-36(s0)
    8000a0cc:	87ba                	mv	a5,a4
    8000a0ce:	078a                	slli	a5,a5,0x2
    8000a0d0:	97ba                	add	a5,a5,a4
    8000a0d2:	078a                	slli	a5,a5,0x2
    8000a0d4:	97ba                	add	a5,a5,a4
    8000a0d6:	97b2                	add	a5,a5,a2
    8000a0d8:	078d                	addi	a5,a5,3
    8000a0da:	0792                	slli	a5,a5,0x4
    8000a0dc:	97b6                	add	a5,a5,a3
    8000a0de:	0087c783          	lbu	a5,8(a5)
    8000a0e2:	c79d                	beqz	a5,8000a110 <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    8000a0e4:	0001c717          	auipc	a4,0x1c
    8000a0e8:	e2470713          	addi	a4,a4,-476 # 80025f08 <disk>
    8000a0ec:	fdc42683          	lw	a3,-36(s0)
    8000a0f0:	15000793          	li	a5,336
    8000a0f4:	02f687b3          	mul	a5,a3,a5
    8000a0f8:	97ba                	add	a5,a5,a4
    8000a0fa:	639c                	ld	a5,0(a5)
    8000a0fc:	00002617          	auipc	a2,0x2
    8000a100:	69c60613          	addi	a2,a2,1692 # 8000c798 <etext+0x798>
    8000a104:	85be                	mv	a1,a5
    8000a106:	4509                	li	a0,2
    8000a108:	ffff7097          	auipc	ra,0xffff7
    8000a10c:	bd6080e7          	jalr	-1066(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    8000a110:	0001c697          	auipc	a3,0x1c
    8000a114:	df868693          	addi	a3,a3,-520 # 80025f08 <disk>
    8000a118:	fec42603          	lw	a2,-20(s0)
    8000a11c:	fdc42703          	lw	a4,-36(s0)
    8000a120:	87ba                	mv	a5,a4
    8000a122:	078a                	slli	a5,a5,0x2
    8000a124:	97ba                	add	a5,a5,a4
    8000a126:	078a                	slli	a5,a5,0x2
    8000a128:	97ba                	add	a5,a5,a4
    8000a12a:	97b2                	add	a5,a5,a2
    8000a12c:	078d                	addi	a5,a5,3
    8000a12e:	0792                	slli	a5,a5,0x4
    8000a130:	97b6                	add	a5,a5,a3
    8000a132:	639c                	ld	a5,0(a5)
    8000a134:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    8000a138:	fe043783          	ld	a5,-32(s0)
    8000a13c:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    8000a140:	0001c717          	auipc	a4,0x1c
    8000a144:	dc870713          	addi	a4,a4,-568 # 80025f08 <disk>
    8000a148:	fdc42683          	lw	a3,-36(s0)
    8000a14c:	15000793          	li	a5,336
    8000a150:	02f687b3          	mul	a5,a3,a5
    8000a154:	97ba                	add	a5,a5,a4
    8000a156:	1487a783          	lw	a5,328(a5)
    8000a15a:	e799                	bnez	a5,8000a168 <virtio_disk_intr+0x15a>
        wakeup(b);
    8000a15c:	fe043503          	ld	a0,-32(s0)
    8000a160:	ffff9097          	auipc	ra,0xffff9
    8000a164:	4f6080e7          	jalr	1270(ra) # 80003656 <wakeup>
    }

    disk[id].used_idx += 1;
    8000a168:	0001c717          	auipc	a4,0x1c
    8000a16c:	da070713          	addi	a4,a4,-608 # 80025f08 <disk>
    8000a170:	fdc42683          	lw	a3,-36(s0)
    8000a174:	15000793          	li	a5,336
    8000a178:	02f687b3          	mul	a5,a3,a5
    8000a17c:	97ba                	add	a5,a5,a4
    8000a17e:	0287d783          	lhu	a5,40(a5)
    8000a182:	2785                	addiw	a5,a5,1
    8000a184:	03079713          	slli	a4,a5,0x30
    8000a188:	9341                	srli	a4,a4,0x30
    8000a18a:	0001c697          	auipc	a3,0x1c
    8000a18e:	d7e68693          	addi	a3,a3,-642 # 80025f08 <disk>
    8000a192:	fdc42603          	lw	a2,-36(s0)
    8000a196:	15000793          	li	a5,336
    8000a19a:	02f607b3          	mul	a5,a2,a5
    8000a19e:	97b6                	add	a5,a5,a3
    8000a1a0:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    8000a1a4:	0001c717          	auipc	a4,0x1c
    8000a1a8:	d6470713          	addi	a4,a4,-668 # 80025f08 <disk>
    8000a1ac:	fdc42683          	lw	a3,-36(s0)
    8000a1b0:	15000793          	li	a5,336
    8000a1b4:	02f687b3          	mul	a5,a3,a5
    8000a1b8:	97ba                	add	a5,a5,a4
    8000a1ba:	0287d603          	lhu	a2,40(a5)
    8000a1be:	0001c717          	auipc	a4,0x1c
    8000a1c2:	d4a70713          	addi	a4,a4,-694 # 80025f08 <disk>
    8000a1c6:	fdc42683          	lw	a3,-36(s0)
    8000a1ca:	15000793          	li	a5,336
    8000a1ce:	02f687b3          	mul	a5,a3,a5
    8000a1d2:	97ba                	add	a5,a5,a4
    8000a1d4:	6f9c                	ld	a5,24(a5)
    8000a1d6:	0027d783          	lhu	a5,2(a5)
    8000a1da:	0006071b          	sext.w	a4,a2
    8000a1de:	2781                	sext.w	a5,a5
    8000a1e0:	e8f71be3          	bne	a4,a5,8000a076 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    8000a1e4:	fdc42703          	lw	a4,-36(s0)
    8000a1e8:	15000793          	li	a5,336
    8000a1ec:	02f707b3          	mul	a5,a4,a5
    8000a1f0:	13078713          	addi	a4,a5,304
    8000a1f4:	0001c797          	auipc	a5,0x1c
    8000a1f8:	d1478793          	addi	a5,a5,-748 # 80025f08 <disk>
    8000a1fc:	97ba                	add	a5,a5,a4
    8000a1fe:	853e                	mv	a0,a5
    8000a200:	ffff7097          	auipc	ra,0xffff7
    8000a204:	1a0080e7          	jalr	416(ra) # 800013a0 <release>
}
    8000a208:	0001                	nop
    8000a20a:	70a2                	ld	ra,40(sp)
    8000a20c:	7402                	ld	s0,32(sp)
    8000a20e:	6145                	addi	sp,sp,48
    8000a210:	8082                	ret

000000008000a212 <sfence_vma>:
{
    8000a212:	1141                	addi	sp,sp,-16
    8000a214:	e422                	sd	s0,8(sp)
    8000a216:	0800                	addi	s0,sp,16
  asm volatile("sfence.vma zero, zero");
    8000a218:	12000073          	sfence.vma
}
    8000a21c:	0001                	nop
    8000a21e:	6422                	ld	s0,8(sp)
    8000a220:	0141                	addi	sp,sp,16
    8000a222:	8082                	ret

000000008000a224 <getfirstfreelrupage>:
static struct lrupinfo lrupages[RAM_PAGES_COUNT] = {{0} };
struct spinlock lrupageslock;

struct lrupinfo*
getfirstfreelrupage()
{
    8000a224:	1101                	addi	sp,sp,-32
    8000a226:	ec22                	sd	s0,24(sp)
    8000a228:	1000                	addi	s0,sp,32
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a22a:	fe043423          	sd	zero,-24(s0)
    8000a22e:	a815                	j	8000a262 <getfirstfreelrupage+0x3e>
  {
    if(lrupages[i].pte == 0)
    8000a230:	0001c717          	auipc	a4,0x1c
    8000a234:	f9870713          	addi	a4,a4,-104 # 800261c8 <lrupages>
    8000a238:	fe843783          	ld	a5,-24(s0)
    8000a23c:	0796                	slli	a5,a5,0x5
    8000a23e:	97ba                	add	a5,a5,a4
    8000a240:	679c                	ld	a5,8(a5)
    8000a242:	eb99                	bnez	a5,8000a258 <getfirstfreelrupage+0x34>
    {
      return &(lrupages[i]);
    8000a244:	fe843783          	ld	a5,-24(s0)
    8000a248:	00579713          	slli	a4,a5,0x5
    8000a24c:	0001c797          	auipc	a5,0x1c
    8000a250:	f7c78793          	addi	a5,a5,-132 # 800261c8 <lrupages>
    8000a254:	97ba                	add	a5,a5,a4
    8000a256:	a821                	j	8000a26e <getfirstfreelrupage+0x4a>
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a258:	fe843783          	ld	a5,-24(s0)
    8000a25c:	0785                	addi	a5,a5,1
    8000a25e:	fef43423          	sd	a5,-24(s0)
    8000a262:	fe843703          	ld	a4,-24(s0)
    8000a266:	6789                	lui	a5,0x2
    8000a268:	fcf764e3          	bltu	a4,a5,8000a230 <getfirstfreelrupage+0xc>
    }
  }

  return 0;
    8000a26c:	4781                	li	a5,0
}
    8000a26e:	853e                	mv	a0,a5
    8000a270:	6462                	ld	s0,24(sp)
    8000a272:	6105                	addi	sp,sp,32
    8000a274:	8082                	ret

000000008000a276 <getpinfo>:

struct lrupinfo*
getpinfo(uint64 va, pagetable_t pagetable)
{
    8000a276:	7179                	addi	sp,sp,-48
    8000a278:	f422                	sd	s0,40(sp)
    8000a27a:	1800                	addi	s0,sp,48
    8000a27c:	fca43c23          	sd	a0,-40(s0)
    8000a280:	fcb43823          	sd	a1,-48(s0)
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a284:	fe043423          	sd	zero,-24(s0)
    8000a288:	a0ad                	j	8000a2f2 <getpinfo+0x7c>
  {
    if(lrupages[i].pte == 0) continue;
    8000a28a:	0001c717          	auipc	a4,0x1c
    8000a28e:	f3e70713          	addi	a4,a4,-194 # 800261c8 <lrupages>
    8000a292:	fe843783          	ld	a5,-24(s0)
    8000a296:	0796                	slli	a5,a5,0x5
    8000a298:	97ba                	add	a5,a5,a4
    8000a29a:	679c                	ld	a5,8(a5)
    8000a29c:	c7a9                	beqz	a5,8000a2e6 <getpinfo+0x70>
    if(lrupages[i].pagetable == pagetable && lrupages[i].va == va)
    8000a29e:	0001c717          	auipc	a4,0x1c
    8000a2a2:	f2a70713          	addi	a4,a4,-214 # 800261c8 <lrupages>
    8000a2a6:	fe843783          	ld	a5,-24(s0)
    8000a2aa:	0796                	slli	a5,a5,0x5
    8000a2ac:	97ba                	add	a5,a5,a4
    8000a2ae:	6f9c                	ld	a5,24(a5)
    8000a2b0:	fd043703          	ld	a4,-48(s0)
    8000a2b4:	02f71a63          	bne	a4,a5,8000a2e8 <getpinfo+0x72>
    8000a2b8:	0001c717          	auipc	a4,0x1c
    8000a2bc:	f1070713          	addi	a4,a4,-240 # 800261c8 <lrupages>
    8000a2c0:	fe843783          	ld	a5,-24(s0)
    8000a2c4:	0796                	slli	a5,a5,0x5
    8000a2c6:	97ba                	add	a5,a5,a4
    8000a2c8:	6b9c                	ld	a5,16(a5)
    8000a2ca:	fd843703          	ld	a4,-40(s0)
    8000a2ce:	00f71d63          	bne	a4,a5,8000a2e8 <getpinfo+0x72>
    {
      return &(lrupages[i]);
    8000a2d2:	fe843783          	ld	a5,-24(s0)
    8000a2d6:	00579713          	slli	a4,a5,0x5
    8000a2da:	0001c797          	auipc	a5,0x1c
    8000a2de:	eee78793          	addi	a5,a5,-274 # 800261c8 <lrupages>
    8000a2e2:	97ba                	add	a5,a5,a4
    8000a2e4:	a829                	j	8000a2fe <getpinfo+0x88>
    if(lrupages[i].pte == 0) continue;
    8000a2e6:	0001                	nop
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a2e8:	fe843783          	ld	a5,-24(s0)
    8000a2ec:	0785                	addi	a5,a5,1
    8000a2ee:	fef43423          	sd	a5,-24(s0)
    8000a2f2:	fe843703          	ld	a4,-24(s0)
    8000a2f6:	6789                	lui	a5,0x2
    8000a2f8:	f8f769e3          	bltu	a4,a5,8000a28a <getpinfo+0x14>
    }
  }

  return 0;
    8000a2fc:	4781                	li	a5,0
}
    8000a2fe:	853e                	mv	a0,a5
    8000a300:	7422                	ld	s0,40(sp)
    8000a302:	6145                	addi	sp,sp,48
    8000a304:	8082                	ret

000000008000a306 <getpaddress>:

uint64
getpaddress(pte_t *pte)
{
    8000a306:	7179                	addi	sp,sp,-48
    8000a308:	f422                	sd	s0,40(sp)
    8000a30a:	1800                	addi	s0,sp,48
    8000a30c:	fca43c23          	sd	a0,-40(s0)
  uint64 ppn = ( (*pte) & 0x3FFFFFFFFFFFFL ) >> 10; // Extract bits 53-10 and shift to the right place
    8000a310:	fd843783          	ld	a5,-40(s0)
    8000a314:	639c                	ld	a5,0(a5)
    8000a316:	00a7d713          	srli	a4,a5,0xa
    8000a31a:	57fd                	li	a5,-1
    8000a31c:	83e1                	srli	a5,a5,0x18
    8000a31e:	8ff9                	and	a5,a5,a4
    8000a320:	fef43423          	sd	a5,-24(s0)
  uint64 physical_address = ppn << 12; // Shift left by 12 bits to accommodate for the page offset
    8000a324:	fe843783          	ld	a5,-24(s0)
    8000a328:	07b2                	slli	a5,a5,0xc
    8000a32a:	fef43023          	sd	a5,-32(s0)
  return physical_address;
    8000a32e:	fe043783          	ld	a5,-32(s0)
}
    8000a332:	853e                	mv	a0,a5
    8000a334:	7422                	ld	s0,40(sp)
    8000a336:	6145                	addi	sp,sp,48
    8000a338:	8082                	ret

000000008000a33a <setpaddress>:

void
setpaddress(pte_t *pte, uint64 new_ppn)
{
    8000a33a:	7179                	addi	sp,sp,-48
    8000a33c:	f422                	sd	s0,40(sp)
    8000a33e:	1800                	addi	s0,sp,48
    8000a340:	fca43c23          	sd	a0,-40(s0)
    8000a344:	fcb43823          	sd	a1,-48(s0)
  uint64 masked_pte = *pte & ~0x3FFFFFFFFFFFFL;
    8000a348:	fd843783          	ld	a5,-40(s0)
    8000a34c:	6398                	ld	a4,0(a5)
    8000a34e:	57fd                	li	a5,-1
    8000a350:	17ca                	slli	a5,a5,0x32
    8000a352:	8ff9                	and	a5,a5,a4
    8000a354:	fef43423          	sd	a5,-24(s0)
  uint64 new_ppn_shifted = (new_ppn << 10) & 0x3FFFFFFFFFFFFL;
    8000a358:	fd043783          	ld	a5,-48(s0)
    8000a35c:	00a79713          	slli	a4,a5,0xa
    8000a360:	57fd                	li	a5,-1
    8000a362:	83b9                	srli	a5,a5,0xe
    8000a364:	8ff9                	and	a5,a5,a4
    8000a366:	fef43023          	sd	a5,-32(s0)
  *pte = masked_pte | new_ppn_shifted;
    8000a36a:	fe843703          	ld	a4,-24(s0)
    8000a36e:	fe043783          	ld	a5,-32(s0)
    8000a372:	8f5d                	or	a4,a4,a5
    8000a374:	fd843783          	ld	a5,-40(s0)
    8000a378:	e398                	sd	a4,0(a5)
}
    8000a37a:	0001                	nop
    8000a37c:	7422                	ld	s0,40(sp)
    8000a37e:	6145                	addi	sp,sp,48
    8000a380:	8082                	ret

000000008000a382 <reglrupage>:

void
reglrupage(pte_t *pte, uint64 va, pagetable_t pagetable)
{
    8000a382:	7139                	addi	sp,sp,-64
    8000a384:	fc06                	sd	ra,56(sp)
    8000a386:	f822                	sd	s0,48(sp)
    8000a388:	0080                	addi	s0,sp,64
    8000a38a:	fca43c23          	sd	a0,-40(s0)
    8000a38e:	fcb43823          	sd	a1,-48(s0)
    8000a392:	fcc43423          	sd	a2,-56(s0)
  acquire(&lrupageslock);
    8000a396:	0001c517          	auipc	a0,0x1c
    8000a39a:	e1a50513          	addi	a0,a0,-486 # 800261b0 <lrupageslock>
    8000a39e:	ffff7097          	auipc	ra,0xffff7
    8000a3a2:	f9e080e7          	jalr	-98(ra) # 8000133c <acquire>

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
    8000a3a6:	fc843583          	ld	a1,-56(s0)
    8000a3aa:	fd043503          	ld	a0,-48(s0)
    8000a3ae:	00000097          	auipc	ra,0x0
    8000a3b2:	ec8080e7          	jalr	-312(ra) # 8000a276 <getpinfo>
    8000a3b6:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a3ba:	fe843783          	ld	a5,-24(s0)
    8000a3be:	e7a9                	bnez	a5,8000a408 <reglrupage+0x86>
  {
    pinfo = getfirstfreelrupage();
    8000a3c0:	00000097          	auipc	ra,0x0
    8000a3c4:	e64080e7          	jalr	-412(ra) # 8000a224 <getfirstfreelrupage>
    8000a3c8:	fea43423          	sd	a0,-24(s0)
    if(pinfo == 0)
    8000a3cc:	fe843783          	ld	a5,-24(s0)
    8000a3d0:	e38d                	bnez	a5,8000a3f2 <reglrupage+0x70>
    {
      release(&lrupageslock);
    8000a3d2:	0001c517          	auipc	a0,0x1c
    8000a3d6:	dde50513          	addi	a0,a0,-546 # 800261b0 <lrupageslock>
    8000a3da:	ffff7097          	auipc	ra,0xffff7
    8000a3de:	fc6080e7          	jalr	-58(ra) # 800013a0 <release>
      panic("reglrupage: no more space in lrupages");
    8000a3e2:	00002517          	auipc	a0,0x2
    8000a3e6:	3d650513          	addi	a0,a0,982 # 8000c7b8 <etext+0x7b8>
    8000a3ea:	ffff7097          	auipc	ra,0xffff7
    8000a3ee:	8a2080e7          	jalr	-1886(ra) # 80000c8c <panic>
    }

    pinfo->va = va;
    8000a3f2:	fe843783          	ld	a5,-24(s0)
    8000a3f6:	fd043703          	ld	a4,-48(s0)
    8000a3fa:	eb98                	sd	a4,16(a5)
    pinfo->pagetable = pagetable;
    8000a3fc:	fe843783          	ld	a5,-24(s0)
    8000a400:	fc843703          	ld	a4,-56(s0)
    8000a404:	ef98                	sd	a4,24(a5)
    8000a406:	a00d                	j	8000a428 <reglrupage+0xa6>
  }
  else // TODO: Does this ever happen?
  {
    release(&lrupageslock);
    8000a408:	0001c517          	auipc	a0,0x1c
    8000a40c:	da850513          	addi	a0,a0,-600 # 800261b0 <lrupageslock>
    8000a410:	ffff7097          	auipc	ra,0xffff7
    8000a414:	f90080e7          	jalr	-112(ra) # 800013a0 <release>
    panic("getpinfo: edge case isreal");
    8000a418:	00002517          	auipc	a0,0x2
    8000a41c:	3c850513          	addi	a0,a0,968 # 8000c7e0 <etext+0x7e0>
    8000a420:	ffff7097          	auipc	ra,0xffff7
    8000a424:	86c080e7          	jalr	-1940(ra) # 80000c8c <panic>
  }

  pinfo->refhistory = 0;
    8000a428:	fe843783          	ld	a5,-24(s0)
    8000a42c:	00078023          	sb	zero,0(a5) # 2000 <_entry-0x7fffe000>
  pinfo->pte = pte;
    8000a430:	fe843783          	ld	a5,-24(s0)
    8000a434:	fd843703          	ld	a4,-40(s0)
    8000a438:	e798                	sd	a4,8(a5)

  release(&lrupageslock);
    8000a43a:	0001c517          	auipc	a0,0x1c
    8000a43e:	d7650513          	addi	a0,a0,-650 # 800261b0 <lrupageslock>
    8000a442:	ffff7097          	auipc	ra,0xffff7
    8000a446:	f5e080e7          	jalr	-162(ra) # 800013a0 <release>
}
    8000a44a:	0001                	nop
    8000a44c:	70e2                	ld	ra,56(sp)
    8000a44e:	7442                	ld	s0,48(sp)
    8000a450:	6121                	addi	sp,sp,64
    8000a452:	8082                	ret

000000008000a454 <unreglrupage>:

void
unreglrupage(uint64 va, pagetable_t pagetable)
{
    8000a454:	715d                	addi	sp,sp,-80
    8000a456:	e486                	sd	ra,72(sp)
    8000a458:	e0a2                	sd	s0,64(sp)
    8000a45a:	0880                	addi	s0,sp,80
    8000a45c:	faa43c23          	sd	a0,-72(s0)
    8000a460:	fab43823          	sd	a1,-80(s0)
  acquire(&lrupageslock);
    8000a464:	0001c517          	auipc	a0,0x1c
    8000a468:	d4c50513          	addi	a0,a0,-692 # 800261b0 <lrupageslock>
    8000a46c:	ffff7097          	auipc	ra,0xffff7
    8000a470:	ed0080e7          	jalr	-304(ra) # 8000133c <acquire>

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
    8000a474:	fb043583          	ld	a1,-80(s0)
    8000a478:	fb843503          	ld	a0,-72(s0)
    8000a47c:	00000097          	auipc	ra,0x0
    8000a480:	dfa080e7          	jalr	-518(ra) # 8000a276 <getpinfo>
    8000a484:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a488:	fe843783          	ld	a5,-24(s0)
    8000a48c:	e38d                	bnez	a5,8000a4ae <unreglrupage+0x5a>
  {
    release(&lrupageslock);
    8000a48e:	0001c517          	auipc	a0,0x1c
    8000a492:	d2250513          	addi	a0,a0,-734 # 800261b0 <lrupageslock>
    8000a496:	ffff7097          	auipc	ra,0xffff7
    8000a49a:	f0a080e7          	jalr	-246(ra) # 800013a0 <release>
    panic("unreglrupage: not mapped");
    8000a49e:	00002517          	auipc	a0,0x2
    8000a4a2:	36250513          	addi	a0,a0,866 # 8000c800 <etext+0x800>
    8000a4a6:	ffff6097          	auipc	ra,0xffff6
    8000a4aa:	7e6080e7          	jalr	2022(ra) # 80000c8c <panic>
  }

  *pinfo = (struct lrupinfo){0};
    8000a4ae:	fe843783          	ld	a5,-24(s0)
    8000a4b2:	0007b023          	sd	zero,0(a5)
    8000a4b6:	0007b423          	sd	zero,8(a5)
    8000a4ba:	0007b823          	sd	zero,16(a5)
    8000a4be:	0007bc23          	sd	zero,24(a5)

  release(&lrupageslock);
    8000a4c2:	0001c517          	auipc	a0,0x1c
    8000a4c6:	cee50513          	addi	a0,a0,-786 # 800261b0 <lrupageslock>
    8000a4ca:	ffff7097          	auipc	ra,0xffff7
    8000a4ce:	ed6080e7          	jalr	-298(ra) # 800013a0 <release>
}
    8000a4d2:	0001                	nop
    8000a4d4:	60a6                	ld	ra,72(sp)
    8000a4d6:	6406                	ld	s0,64(sp)
    8000a4d8:	6161                	addi	sp,sp,80
    8000a4da:	8082                	ret

000000008000a4dc <updaterefhistory>:

void
updaterefhistory()
{
    8000a4dc:	7179                	addi	sp,sp,-48
    8000a4de:	f406                	sd	ra,40(sp)
    8000a4e0:	f022                	sd	s0,32(sp)
    8000a4e2:	1800                	addi	s0,sp,48
  acquire(&lrupageslock);
    8000a4e4:	0001c517          	auipc	a0,0x1c
    8000a4e8:	ccc50513          	addi	a0,a0,-820 # 800261b0 <lrupageslock>
    8000a4ec:	ffff7097          	auipc	ra,0xffff7
    8000a4f0:	e50080e7          	jalr	-432(ra) # 8000133c <acquire>

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a4f4:	fe043423          	sd	zero,-24(s0)
    8000a4f8:	a065                	j	8000a5a0 <updaterefhistory+0xc4>
  {
    pte_t *pte = lrupages[i].pte;
    8000a4fa:	0001c717          	auipc	a4,0x1c
    8000a4fe:	cce70713          	addi	a4,a4,-818 # 800261c8 <lrupages>
    8000a502:	fe843783          	ld	a5,-24(s0)
    8000a506:	0796                	slli	a5,a5,0x5
    8000a508:	97ba                	add	a5,a5,a4
    8000a50a:	679c                	ld	a5,8(a5)
    8000a50c:	fef43023          	sd	a5,-32(s0)
    if(pte == 0) continue;
    8000a510:	fe043783          	ld	a5,-32(s0)
    8000a514:	cfb5                	beqz	a5,8000a590 <updaterefhistory+0xb4>
    if(*pte & PTE_ON_DISK) continue;
    8000a516:	fe043783          	ld	a5,-32(s0)
    8000a51a:	639c                	ld	a5,0(a5)
    8000a51c:	1007f793          	andi	a5,a5,256
    8000a520:	ebb5                	bnez	a5,8000a594 <updaterefhistory+0xb8>

    uchar a = ( *pte & PTE_A ) == 0 ? 0 : 1;
    8000a522:	fe043783          	ld	a5,-32(s0)
    8000a526:	639c                	ld	a5,0(a5)
    8000a528:	0407f793          	andi	a5,a5,64
    8000a52c:	00f037b3          	snez	a5,a5
    8000a530:	0ff7f793          	andi	a5,a5,255
    8000a534:	fcf40fa3          	sb	a5,-33(s0)
    *pte &= ~PTE_A; // A = 0
    8000a538:	fe043783          	ld	a5,-32(s0)
    8000a53c:	639c                	ld	a5,0(a5)
    8000a53e:	fbf7f713          	andi	a4,a5,-65
    8000a542:	fe043783          	ld	a5,-32(s0)
    8000a546:	e398                	sd	a4,0(a5)

    uchar mask = a << ( sizeof(uchar) * 8 - 1 );
    8000a548:	fdf44783          	lbu	a5,-33(s0)
    8000a54c:	0077979b          	slliw	a5,a5,0x7
    8000a550:	fcf40f23          	sb	a5,-34(s0)
    lrupages[i].refhistory = (lrupages[i].refhistory >> 1) | mask;
    8000a554:	0001c717          	auipc	a4,0x1c
    8000a558:	c7470713          	addi	a4,a4,-908 # 800261c8 <lrupages>
    8000a55c:	fe843783          	ld	a5,-24(s0)
    8000a560:	0796                	slli	a5,a5,0x5
    8000a562:	97ba                	add	a5,a5,a4
    8000a564:	0007c783          	lbu	a5,0(a5)
    8000a568:	0017d79b          	srliw	a5,a5,0x1
    8000a56c:	0ff7f713          	andi	a4,a5,255
    8000a570:	fde44783          	lbu	a5,-34(s0)
    8000a574:	8fd9                	or	a5,a5,a4
    8000a576:	0ff7f713          	andi	a4,a5,255
    8000a57a:	0001c697          	auipc	a3,0x1c
    8000a57e:	c4e68693          	addi	a3,a3,-946 # 800261c8 <lrupages>
    8000a582:	fe843783          	ld	a5,-24(s0)
    8000a586:	0796                	slli	a5,a5,0x5
    8000a588:	97b6                	add	a5,a5,a3
    8000a58a:	00e78023          	sb	a4,0(a5)
    8000a58e:	a021                	j	8000a596 <updaterefhistory+0xba>
    if(pte == 0) continue;
    8000a590:	0001                	nop
    8000a592:	a011                	j	8000a596 <updaterefhistory+0xba>
    if(*pte & PTE_ON_DISK) continue;
    8000a594:	0001                	nop
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a596:	fe843783          	ld	a5,-24(s0)
    8000a59a:	0785                	addi	a5,a5,1
    8000a59c:	fef43423          	sd	a5,-24(s0)
    8000a5a0:	fe843703          	ld	a4,-24(s0)
    8000a5a4:	6789                	lui	a5,0x2
    8000a5a6:	f4f76ae3          	bltu	a4,a5,8000a4fa <updaterefhistory+0x1e>
  }

  release(&lrupageslock);
    8000a5aa:	0001c517          	auipc	a0,0x1c
    8000a5ae:	c0650513          	addi	a0,a0,-1018 # 800261b0 <lrupageslock>
    8000a5b2:	ffff7097          	auipc	ra,0xffff7
    8000a5b6:	dee080e7          	jalr	-530(ra) # 800013a0 <release>
}
    8000a5ba:	0001                	nop
    8000a5bc:	70a2                	ld	ra,40(sp)
    8000a5be:	7402                	ld	s0,32(sp)
    8000a5c0:	6145                	addi	sp,sp,48
    8000a5c2:	8082                	ret

000000008000a5c4 <getvictim>:

struct lrupinfo*
getvictim()
{
    8000a5c4:	7179                	addi	sp,sp,-48
    8000a5c6:	f422                	sd	s0,40(sp)
    8000a5c8:	1800                	addi	s0,sp,48
  uchar minhistory = ~0;
    8000a5ca:	57fd                	li	a5,-1
    8000a5cc:	fef407a3          	sb	a5,-17(s0)
  struct lrupinfo *result = 0;
    8000a5d0:	fe043023          	sd	zero,-32(s0)

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a5d4:	fc043c23          	sd	zero,-40(s0)
    8000a5d8:	a841                	j	8000a668 <getvictim+0xa4>
  {
    pte_t *pte = lrupages[i].pte;
    8000a5da:	0001c717          	auipc	a4,0x1c
    8000a5de:	bee70713          	addi	a4,a4,-1042 # 800261c8 <lrupages>
    8000a5e2:	fd843783          	ld	a5,-40(s0)
    8000a5e6:	0796                	slli	a5,a5,0x5
    8000a5e8:	97ba                	add	a5,a5,a4
    8000a5ea:	679c                	ld	a5,8(a5)
    8000a5ec:	fcf43823          	sd	a5,-48(s0)
    if(pte == 0 || *pte & PTE_PENDING_DISK_OPERATION)
    8000a5f0:	fd043783          	ld	a5,-48(s0)
    8000a5f4:	c7a5                	beqz	a5,8000a65c <getvictim+0x98>
    8000a5f6:	fd043783          	ld	a5,-48(s0)
    8000a5fa:	639c                	ld	a5,0(a5)
    8000a5fc:	2007f793          	andi	a5,a5,512
    8000a600:	efb1                	bnez	a5,8000a65c <getvictim+0x98>
      continue;

    if((*pte & PTE_V) && lrupages[i].refhistory < minhistory)
    8000a602:	fd043783          	ld	a5,-48(s0)
    8000a606:	639c                	ld	a5,0(a5)
    8000a608:	8b85                	andi	a5,a5,1
    8000a60a:	cbb1                	beqz	a5,8000a65e <getvictim+0x9a>
    8000a60c:	0001c717          	auipc	a4,0x1c
    8000a610:	bbc70713          	addi	a4,a4,-1092 # 800261c8 <lrupages>
    8000a614:	fd843783          	ld	a5,-40(s0)
    8000a618:	0796                	slli	a5,a5,0x5
    8000a61a:	97ba                	add	a5,a5,a4
    8000a61c:	0007c703          	lbu	a4,0(a5) # 2000 <_entry-0x7fffe000>
    8000a620:	fef44783          	lbu	a5,-17(s0)
    8000a624:	0ff7f793          	andi	a5,a5,255
    8000a628:	02f77b63          	bgeu	a4,a5,8000a65e <getvictim+0x9a>
    {
      result = &(lrupages[i]);
    8000a62c:	fd843783          	ld	a5,-40(s0)
    8000a630:	00579713          	slli	a4,a5,0x5
    8000a634:	0001c797          	auipc	a5,0x1c
    8000a638:	b9478793          	addi	a5,a5,-1132 # 800261c8 <lrupages>
    8000a63c:	97ba                	add	a5,a5,a4
    8000a63e:	fef43023          	sd	a5,-32(s0)
      minhistory = lrupages[i].refhistory;
    8000a642:	0001c717          	auipc	a4,0x1c
    8000a646:	b8670713          	addi	a4,a4,-1146 # 800261c8 <lrupages>
    8000a64a:	fd843783          	ld	a5,-40(s0)
    8000a64e:	0796                	slli	a5,a5,0x5
    8000a650:	97ba                	add	a5,a5,a4
    8000a652:	0007c783          	lbu	a5,0(a5)
    8000a656:	fef407a3          	sb	a5,-17(s0)
    8000a65a:	a011                	j	8000a65e <getvictim+0x9a>
      continue;
    8000a65c:	0001                	nop
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a65e:	fd843783          	ld	a5,-40(s0)
    8000a662:	0785                	addi	a5,a5,1
    8000a664:	fcf43c23          	sd	a5,-40(s0)
    8000a668:	fd843703          	ld	a4,-40(s0)
    8000a66c:	6789                	lui	a5,0x2
    8000a66e:	f6f766e3          	bltu	a4,a5,8000a5da <getvictim+0x16>
    }
  }

  return result;
    8000a672:	fe043783          	ld	a5,-32(s0)
}
    8000a676:	853e                	mv	a0,a5
    8000a678:	7422                	ld	s0,40(sp)
    8000a67a:	6145                	addi	sp,sp,48
    8000a67c:	8082                	ret

000000008000a67e <swapout>:

// Returns free page, 0 if there is none
void*
swapout()
{
    8000a67e:	7179                	addi	sp,sp,-48
    8000a680:	f406                	sd	ra,40(sp)
    8000a682:	f022                	sd	s0,32(sp)
    8000a684:	1800                	addi	s0,sp,48
  acquire(&lrupageslock);
    8000a686:	0001c517          	auipc	a0,0x1c
    8000a68a:	b2a50513          	addi	a0,a0,-1238 # 800261b0 <lrupageslock>
    8000a68e:	ffff7097          	auipc	ra,0xffff7
    8000a692:	cae080e7          	jalr	-850(ra) # 8000133c <acquire>

  struct lrupinfo *pinfo = getvictim();
    8000a696:	00000097          	auipc	ra,0x0
    8000a69a:	f2e080e7          	jalr	-210(ra) # 8000a5c4 <getvictim>
    8000a69e:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a6a2:	fe843783          	ld	a5,-24(s0)
    8000a6a6:	eb89                	bnez	a5,8000a6b8 <swapout+0x3a>
    panic("swapout: no victim!");
    8000a6a8:	00002517          	auipc	a0,0x2
    8000a6ac:	17850513          	addi	a0,a0,376 # 8000c820 <etext+0x820>
    8000a6b0:	ffff6097          	auipc	ra,0xffff6
    8000a6b4:	5dc080e7          	jalr	1500(ra) # 80000c8c <panic>

  pte_t *pte = pinfo->pte;
    8000a6b8:	fe843783          	ld	a5,-24(s0)
    8000a6bc:	679c                	ld	a5,8(a5)
    8000a6be:	fef43023          	sd	a5,-32(s0)
  uchar *data = (uchar*)getpaddress(pte);
    8000a6c2:	fe043503          	ld	a0,-32(s0)
    8000a6c6:	00000097          	auipc	ra,0x0
    8000a6ca:	c40080e7          	jalr	-960(ra) # 8000a306 <getpaddress>
    8000a6ce:	87aa                	mv	a5,a0
    8000a6d0:	fcf43c23          	sd	a5,-40(s0)
  *pte |= PTE_PENDING_DISK_OPERATION; // PTE_PENDING_DISK_OPERATION = 1
    8000a6d4:	fe043783          	ld	a5,-32(s0)
    8000a6d8:	639c                	ld	a5,0(a5)
    8000a6da:	2007e713          	ori	a4,a5,512
    8000a6de:	fe043783          	ld	a5,-32(s0)
    8000a6e2:	e398                	sd	a4,0(a5)
  release(&lrupageslock);
    8000a6e4:	0001c517          	auipc	a0,0x1c
    8000a6e8:	acc50513          	addi	a0,a0,-1332 # 800261b0 <lrupageslock>
    8000a6ec:	ffff7097          	auipc	ra,0xffff7
    8000a6f0:	cb4080e7          	jalr	-844(ra) # 800013a0 <release>

  int diskpageno = write_page_to_disk(data);
    8000a6f4:	fd843503          	ld	a0,-40(s0)
    8000a6f8:	00000097          	auipc	ra,0x0
    8000a6fc:	806080e7          	jalr	-2042(ra) # 80009efe <write_page_to_disk>
    8000a700:	87aa                	mv	a5,a0
    8000a702:	fcf42a23          	sw	a5,-44(s0)
  if(diskpageno < 0)
    8000a706:	fd442783          	lw	a5,-44(s0)
    8000a70a:	2781                	sext.w	a5,a5
    8000a70c:	0007d463          	bgez	a5,8000a714 <swapout+0x96>
    return 0;
    8000a710:	4781                	li	a5,0
    8000a712:	a8a5                	j	8000a78a <swapout+0x10c>

  acquire(&lrupageslock);
    8000a714:	0001c517          	auipc	a0,0x1c
    8000a718:	a9c50513          	addi	a0,a0,-1380 # 800261b0 <lrupageslock>
    8000a71c:	ffff7097          	auipc	ra,0xffff7
    8000a720:	c20080e7          	jalr	-992(ra) # 8000133c <acquire>

  setpaddress(pte, (uint64)diskpageno);
    8000a724:	fd442783          	lw	a5,-44(s0)
    8000a728:	85be                	mv	a1,a5
    8000a72a:	fe043503          	ld	a0,-32(s0)
    8000a72e:	00000097          	auipc	ra,0x0
    8000a732:	c0c080e7          	jalr	-1012(ra) # 8000a33a <setpaddress>
  *pte &= ~PTE_V; // V = 0
    8000a736:	fe043783          	ld	a5,-32(s0)
    8000a73a:	639c                	ld	a5,0(a5)
    8000a73c:	ffe7f713          	andi	a4,a5,-2
    8000a740:	fe043783          	ld	a5,-32(s0)
    8000a744:	e398                	sd	a4,0(a5)
  *pte |= PTE_ON_DISK; // ON_DISK = 1
    8000a746:	fe043783          	ld	a5,-32(s0)
    8000a74a:	639c                	ld	a5,0(a5)
    8000a74c:	1007e713          	ori	a4,a5,256
    8000a750:	fe043783          	ld	a5,-32(s0)
    8000a754:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_PENDING_DISK_OPERATION; // PTE_PENDING_DISK_OPERATION = 0
    8000a756:	fe043783          	ld	a5,-32(s0)
    8000a75a:	639c                	ld	a5,0(a5)
    8000a75c:	dff7f713          	andi	a4,a5,-513
    8000a760:	fe043783          	ld	a5,-32(s0)
    8000a764:	e398                	sd	a4,0(a5)
  pinfo->refhistory = 0;
    8000a766:	fe843783          	ld	a5,-24(s0)
    8000a76a:	00078023          	sb	zero,0(a5) # 2000 <_entry-0x7fffe000>
  sfence_vma(); // Flush TLB
    8000a76e:	00000097          	auipc	ra,0x0
    8000a772:	aa4080e7          	jalr	-1372(ra) # 8000a212 <sfence_vma>

  release(&lrupageslock);
    8000a776:	0001c517          	auipc	a0,0x1c
    8000a77a:	a3a50513          	addi	a0,a0,-1478 # 800261b0 <lrupageslock>
    8000a77e:	ffff7097          	auipc	ra,0xffff7
    8000a782:	c22080e7          	jalr	-990(ra) # 800013a0 <release>
  return (void*)data;
    8000a786:	fd843783          	ld	a5,-40(s0)
}
    8000a78a:	853e                	mv	a0,a5
    8000a78c:	70a2                	ld	ra,40(sp)
    8000a78e:	7402                	ld	s0,32(sp)
    8000a790:	6145                	addi	sp,sp,48
    8000a792:	8082                	ret

000000008000a794 <swapin>:

int
swapin(uint64 va, pagetable_t pagetable)
{
    8000a794:	7139                	addi	sp,sp,-64
    8000a796:	fc06                	sd	ra,56(sp)
    8000a798:	f822                	sd	s0,48(sp)
    8000a79a:	0080                	addi	s0,sp,64
    8000a79c:	fca43423          	sd	a0,-56(s0)
    8000a7a0:	fcb43023          	sd	a1,-64(s0)
  acquire(&lrupageslock);
    8000a7a4:	0001c517          	auipc	a0,0x1c
    8000a7a8:	a0c50513          	addi	a0,a0,-1524 # 800261b0 <lrupageslock>
    8000a7ac:	ffff7097          	auipc	ra,0xffff7
    8000a7b0:	b90080e7          	jalr	-1136(ra) # 8000133c <acquire>

  pte_t *pte = getpinfo(va, pagetable)->pte;
    8000a7b4:	fc043583          	ld	a1,-64(s0)
    8000a7b8:	fc843503          	ld	a0,-56(s0)
    8000a7bc:	00000097          	auipc	ra,0x0
    8000a7c0:	aba080e7          	jalr	-1350(ra) # 8000a276 <getpinfo>
    8000a7c4:	87aa                	mv	a5,a0
    8000a7c6:	679c                	ld	a5,8(a5)
    8000a7c8:	fef43423          	sd	a5,-24(s0)
  if((*pte & PTE_ON_DISK) == 0)
    8000a7cc:	fe843783          	ld	a5,-24(s0)
    8000a7d0:	639c                	ld	a5,0(a5)
    8000a7d2:	1007f793          	andi	a5,a5,256
    8000a7d6:	e399                	bnez	a5,8000a7dc <swapin+0x48>
    return 0;
    8000a7d8:	4781                	li	a5,0
    8000a7da:	a0e1                	j	8000a8a2 <swapin+0x10e>
  *pte |= PTE_PENDING_DISK_OPERATION; // PENDING_DISK_OPERATION = 1
    8000a7dc:	fe843783          	ld	a5,-24(s0)
    8000a7e0:	639c                	ld	a5,0(a5)
    8000a7e2:	2007e713          	ori	a4,a5,512
    8000a7e6:	fe843783          	ld	a5,-24(s0)
    8000a7ea:	e398                	sd	a4,0(a5)

  release(&lrupageslock);
    8000a7ec:	0001c517          	auipc	a0,0x1c
    8000a7f0:	9c450513          	addi	a0,a0,-1596 # 800261b0 <lrupageslock>
    8000a7f4:	ffff7097          	auipc	ra,0xffff7
    8000a7f8:	bac080e7          	jalr	-1108(ra) # 800013a0 <release>

  uchar *rampage = kalloc();
    8000a7fc:	ffff7097          	auipc	ra,0xffff7
    8000a800:	9da080e7          	jalr	-1574(ra) # 800011d6 <kalloc>
    8000a804:	fea43023          	sd	a0,-32(s0)
  if(rampage == 0)
    8000a808:	fe043783          	ld	a5,-32(s0)
    8000a80c:	e399                	bnez	a5,8000a812 <swapin+0x7e>
    return 0;
    8000a80e:	4781                	li	a5,0
    8000a810:	a849                	j	8000a8a2 <swapin+0x10e>

  int diskpageno = (int) getpaddress(pte);
    8000a812:	fe843503          	ld	a0,-24(s0)
    8000a816:	00000097          	auipc	ra,0x0
    8000a81a:	af0080e7          	jalr	-1296(ra) # 8000a306 <getpaddress>
    8000a81e:	87aa                	mv	a5,a0
    8000a820:	fcf42e23          	sw	a5,-36(s0)
  take_page_from_disk(diskpageno, rampage);
    8000a824:	fdc42783          	lw	a5,-36(s0)
    8000a828:	fe043583          	ld	a1,-32(s0)
    8000a82c:	853e                	mv	a0,a5
    8000a82e:	fffff097          	auipc	ra,0xfffff
    8000a832:	75e080e7          	jalr	1886(ra) # 80009f8c <take_page_from_disk>

  acquire(&lrupageslock);
    8000a836:	0001c517          	auipc	a0,0x1c
    8000a83a:	97a50513          	addi	a0,a0,-1670 # 800261b0 <lrupageslock>
    8000a83e:	ffff7097          	auipc	ra,0xffff7
    8000a842:	afe080e7          	jalr	-1282(ra) # 8000133c <acquire>

  setpaddress(pte, (uint64)rampage);
    8000a846:	fe043783          	ld	a5,-32(s0)
    8000a84a:	85be                	mv	a1,a5
    8000a84c:	fe843503          	ld	a0,-24(s0)
    8000a850:	00000097          	auipc	ra,0x0
    8000a854:	aea080e7          	jalr	-1302(ra) # 8000a33a <setpaddress>
  *pte |= PTE_V; // V = 1
    8000a858:	fe843783          	ld	a5,-24(s0)
    8000a85c:	639c                	ld	a5,0(a5)
    8000a85e:	0017e713          	ori	a4,a5,1
    8000a862:	fe843783          	ld	a5,-24(s0)
    8000a866:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_ON_DISK; // ON_DISK = 0
    8000a868:	fe843783          	ld	a5,-24(s0)
    8000a86c:	639c                	ld	a5,0(a5)
    8000a86e:	eff7f713          	andi	a4,a5,-257
    8000a872:	fe843783          	ld	a5,-24(s0)
    8000a876:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_PENDING_DISK_OPERATION; // PENDING_DISK_OPERATION = 0
    8000a878:	fe843783          	ld	a5,-24(s0)
    8000a87c:	639c                	ld	a5,0(a5)
    8000a87e:	dff7f713          	andi	a4,a5,-513
    8000a882:	fe843783          	ld	a5,-24(s0)
    8000a886:	e398                	sd	a4,0(a5)
  sfence_vma(); // Flush TLB
    8000a888:	00000097          	auipc	ra,0x0
    8000a88c:	98a080e7          	jalr	-1654(ra) # 8000a212 <sfence_vma>

  release(&lrupageslock);
    8000a890:	0001c517          	auipc	a0,0x1c
    8000a894:	92050513          	addi	a0,a0,-1760 # 800261b0 <lrupageslock>
    8000a898:	ffff7097          	auipc	ra,0xffff7
    8000a89c:	b08080e7          	jalr	-1272(ra) # 800013a0 <release>
  return 1;
    8000a8a0:	4785                	li	a5,1
    8000a8a2:	853e                	mv	a0,a5
    8000a8a4:	70e2                	ld	ra,56(sp)
    8000a8a6:	7442                	ld	s0,48(sp)
    8000a8a8:	6121                	addi	sp,sp,64
    8000a8aa:	8082                	ret
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
