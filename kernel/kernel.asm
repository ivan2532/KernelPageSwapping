
kernel/kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000d117          	auipc	sp,0xd
    80000004:	9a813103          	ld	sp,-1624(sp) # 8000c9a8 <_GLOBAL_OFFSET_TABLE_+0x8>
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
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ff98617>
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
    800002e6:	70e70713          	addi	a4,a4,1806 # 800149f0 <timer_scratch>
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
    8000032a:	79a78793          	addi	a5,a5,1946 # 80008ac0 <timervec>
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
    80000408:	490080e7          	jalr	1168(ra) # 80003894 <either_copyin>
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
    80000478:	6bc50513          	addi	a0,a0,1724 # 80014b30 <cons>
    8000047c:	00001097          	auipc	ra,0x1
    80000480:	ec0080e7          	jalr	-320(ra) # 8000133c <acquire>
  while(n > 0){
    80000484:	a23d                	j	800005b2 <consoleread+0x160>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    80000486:	00002097          	auipc	ra,0x2
    8000048a:	58a080e7          	jalr	1418(ra) # 80002a10 <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	34e080e7          	jalr	846(ra) # 800037e0 <killed>
    8000049a:	87aa                	mv	a5,a0
    8000049c:	cb99                	beqz	a5,800004b2 <consoleread+0x60>
        release(&cons.lock);
    8000049e:	00014517          	auipc	a0,0x14
    800004a2:	69250513          	addi	a0,a0,1682 # 80014b30 <cons>
    800004a6:	00001097          	auipc	ra,0x1
    800004aa:	efa080e7          	jalr	-262(ra) # 800013a0 <release>
        return -1;
    800004ae:	57fd                	li	a5,-1
    800004b0:	aa25                	j	800005e8 <consoleread+0x196>
      }
      sleep(&cons.r, &cons.lock);
    800004b2:	00014597          	auipc	a1,0x14
    800004b6:	67e58593          	addi	a1,a1,1662 # 80014b30 <cons>
    800004ba:	00014517          	auipc	a0,0x14
    800004be:	70e50513          	addi	a0,a0,1806 # 80014bc8 <cons+0x98>
    800004c2:	00003097          	auipc	ra,0x3
    800004c6:	110080e7          	jalr	272(ra) # 800035d2 <sleep>
    while(cons.r == cons.w){
    800004ca:	00014797          	auipc	a5,0x14
    800004ce:	66678793          	addi	a5,a5,1638 # 80014b30 <cons>
    800004d2:	0987a703          	lw	a4,152(a5)
    800004d6:	00014797          	auipc	a5,0x14
    800004da:	65a78793          	addi	a5,a5,1626 # 80014b30 <cons>
    800004de:	09c7a783          	lw	a5,156(a5)
    800004e2:	faf702e3          	beq	a4,a5,80000486 <consoleread+0x34>
    }

    c = cons.buf[cons.r++ % INPUT_BUF_SIZE];
    800004e6:	00014797          	auipc	a5,0x14
    800004ea:	64a78793          	addi	a5,a5,1610 # 80014b30 <cons>
    800004ee:	0987a783          	lw	a5,152(a5)
    800004f2:	2781                	sext.w	a5,a5
    800004f4:	0017871b          	addiw	a4,a5,1
    800004f8:	0007069b          	sext.w	a3,a4
    800004fc:	00014717          	auipc	a4,0x14
    80000500:	63470713          	addi	a4,a4,1588 # 80014b30 <cons>
    80000504:	08d72c23          	sw	a3,152(a4)
    80000508:	07f7f793          	andi	a5,a5,127
    8000050c:	2781                	sext.w	a5,a5
    8000050e:	00014717          	auipc	a4,0x14
    80000512:	62270713          	addi	a4,a4,1570 # 80014b30 <cons>
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
    80000544:	5f078793          	addi	a5,a5,1520 # 80014b30 <cons>
    80000548:	0987a783          	lw	a5,152(a5)
    8000054c:	37fd                	addiw	a5,a5,-1
    8000054e:	0007871b          	sext.w	a4,a5
    80000552:	00014797          	auipc	a5,0x14
    80000556:	5de78793          	addi	a5,a5,1502 # 80014b30 <cons>
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
    80000582:	2a2080e7          	jalr	674(ra) # 80003820 <either_copyout>
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
    800005cc:	56850513          	addi	a0,a0,1384 # 80014b30 <cons>
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
    80000604:	53050513          	addi	a0,a0,1328 # 80014b30 <cons>
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
    8000066c:	2a0080e7          	jalr	672(ra) # 80003908 <procdump>
    break;
    80000670:	aad9                	j	80000846 <consoleintr+0x254>
  case C('U'):  // Kill line.
    while(cons.e != cons.w &&
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
      cons.e--;
    80000672:	00014797          	auipc	a5,0x14
    80000676:	4be78793          	addi	a5,a5,1214 # 80014b30 <cons>
    8000067a:	0a07a783          	lw	a5,160(a5)
    8000067e:	37fd                	addiw	a5,a5,-1
    80000680:	0007871b          	sext.w	a4,a5
    80000684:	00014797          	auipc	a5,0x14
    80000688:	4ac78793          	addi	a5,a5,1196 # 80014b30 <cons>
    8000068c:	0ae7a023          	sw	a4,160(a5)
      consputc(BACKSPACE);
    80000690:	10000513          	li	a0,256
    80000694:	00000097          	auipc	ra,0x0
    80000698:	cde080e7          	jalr	-802(ra) # 80000372 <consputc>
    while(cons.e != cons.w &&
    8000069c:	00014797          	auipc	a5,0x14
    800006a0:	49478793          	addi	a5,a5,1172 # 80014b30 <cons>
    800006a4:	0a07a703          	lw	a4,160(a5)
    800006a8:	00014797          	auipc	a5,0x14
    800006ac:	48878793          	addi	a5,a5,1160 # 80014b30 <cons>
    800006b0:	09c7a783          	lw	a5,156(a5)
    800006b4:	18f70463          	beq	a4,a5,8000083c <consoleintr+0x24a>
          cons.buf[(cons.e-1) % INPUT_BUF_SIZE] != '\n'){
    800006b8:	00014797          	auipc	a5,0x14
    800006bc:	47878793          	addi	a5,a5,1144 # 80014b30 <cons>
    800006c0:	0a07a783          	lw	a5,160(a5)
    800006c4:	37fd                	addiw	a5,a5,-1
    800006c6:	2781                	sext.w	a5,a5
    800006c8:	07f7f793          	andi	a5,a5,127
    800006cc:	2781                	sext.w	a5,a5
    800006ce:	00014717          	auipc	a4,0x14
    800006d2:	46270713          	addi	a4,a4,1122 # 80014b30 <cons>
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
    800006ee:	44678793          	addi	a5,a5,1094 # 80014b30 <cons>
    800006f2:	0a07a703          	lw	a4,160(a5)
    800006f6:	00014797          	auipc	a5,0x14
    800006fa:	43a78793          	addi	a5,a5,1082 # 80014b30 <cons>
    800006fe:	09c7a783          	lw	a5,156(a5)
    80000702:	12f70f63          	beq	a4,a5,80000840 <consoleintr+0x24e>
      cons.e--;
    80000706:	00014797          	auipc	a5,0x14
    8000070a:	42a78793          	addi	a5,a5,1066 # 80014b30 <cons>
    8000070e:	0a07a783          	lw	a5,160(a5)
    80000712:	37fd                	addiw	a5,a5,-1
    80000714:	0007871b          	sext.w	a4,a5
    80000718:	00014797          	auipc	a5,0x14
    8000071c:	41878793          	addi	a5,a5,1048 # 80014b30 <cons>
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
    80000740:	3f478793          	addi	a5,a5,1012 # 80014b30 <cons>
    80000744:	0a07a703          	lw	a4,160(a5)
    80000748:	00014797          	auipc	a5,0x14
    8000074c:	3e878793          	addi	a5,a5,1000 # 80014b30 <cons>
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
    80000790:	3a478793          	addi	a5,a5,932 # 80014b30 <cons>
    80000794:	0a07a783          	lw	a5,160(a5)
    80000798:	2781                	sext.w	a5,a5
    8000079a:	0017871b          	addiw	a4,a5,1
    8000079e:	0007069b          	sext.w	a3,a4
    800007a2:	00014717          	auipc	a4,0x14
    800007a6:	38e70713          	addi	a4,a4,910 # 80014b30 <cons>
    800007aa:	0ad72023          	sw	a3,160(a4)
    800007ae:	07f7f793          	andi	a5,a5,127
    800007b2:	2781                	sext.w	a5,a5
    800007b4:	fec42703          	lw	a4,-20(s0)
    800007b8:	0ff77713          	andi	a4,a4,255
    800007bc:	00014697          	auipc	a3,0x14
    800007c0:	37468693          	addi	a3,a3,884 # 80014b30 <cons>
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
    800007ee:	34678793          	addi	a5,a5,838 # 80014b30 <cons>
    800007f2:	0a07a703          	lw	a4,160(a5)
    800007f6:	00014797          	auipc	a5,0x14
    800007fa:	33a78793          	addi	a5,a5,826 # 80014b30 <cons>
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
    80000816:	31e78793          	addi	a5,a5,798 # 80014b30 <cons>
    8000081a:	0a07a703          	lw	a4,160(a5)
    8000081e:	00014797          	auipc	a5,0x14
    80000822:	31278793          	addi	a5,a5,786 # 80014b30 <cons>
    80000826:	08e7ae23          	sw	a4,156(a5)
        wakeup(&cons.r);
    8000082a:	00014517          	auipc	a0,0x14
    8000082e:	39e50513          	addi	a0,a0,926 # 80014bc8 <cons+0x98>
    80000832:	00003097          	auipc	ra,0x3
    80000836:	e1c080e7          	jalr	-484(ra) # 8000364e <wakeup>
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
    8000084a:	2ea50513          	addi	a0,a0,746 # 80014b30 <cons>
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
    80000874:	2c050513          	addi	a0,a0,704 # 80014b30 <cons>
    80000878:	00001097          	auipc	ra,0x1
    8000087c:	a94080e7          	jalr	-1388(ra) # 8000130c <initlock>

  uartinit();
    80000880:	00000097          	auipc	ra,0x0
    80000884:	540080e7          	jalr	1344(ra) # 80000dc0 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80000888:	00024797          	auipc	a5,0x24
    8000088c:	44878793          	addi	a5,a5,1096 # 80024cd0 <devsw>
    80000890:	00000717          	auipc	a4,0x0
    80000894:	bc270713          	addi	a4,a4,-1086 # 80000452 <consoleread>
    80000898:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089a:	00024797          	auipc	a5,0x24
    8000089e:	43678793          	addi	a5,a5,1078 # 80024cd0 <devsw>
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
    80000930:	f4468693          	addi	a3,a3,-188 # 8000c870 <digits>
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
    800009f4:	e8070713          	addi	a4,a4,-384 # 8000c870 <digits>
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
    80000a58:	18478793          	addi	a5,a5,388 # 80014bd8 <pr>
    80000a5c:	4f9c                	lw	a5,24(a5)
    80000a5e:	fcf42e23          	sw	a5,-36(s0)
  if(locking)
    80000a62:	fdc42783          	lw	a5,-36(s0)
    80000a66:	2781                	sext.w	a5,a5
    80000a68:	cb89                	beqz	a5,80000a7a <printf+0x44>
    acquire(&pr.lock);
    80000a6a:	00014517          	auipc	a0,0x14
    80000a6e:	16e50513          	addi	a0,a0,366 # 80014bd8 <pr>
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
    80000c76:	f6650513          	addi	a0,a0,-154 # 80014bd8 <pr>
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
    80000c9c:	f4078793          	addi	a5,a5,-192 # 80014bd8 <pr>
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
    80000cd4:	cf078793          	addi	a5,a5,-784 # 8000c9c0 <panicked>
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
    80000d02:	eda78793          	addi	a5,a5,-294 # 80014bd8 <pr>
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
    80000d80:	c4478793          	addi	a5,a5,-956 # 8000c9c0 <panicked>
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
    80000d9e:	e3e50513          	addi	a0,a0,-450 # 80014bd8 <pr>
    80000da2:	00000097          	auipc	ra,0x0
    80000da6:	56a080e7          	jalr	1386(ra) # 8000130c <initlock>
  pr.locking = 1;
    80000daa:	00014797          	auipc	a5,0x14
    80000dae:	e2e78793          	addi	a5,a5,-466 # 80014bd8 <pr>
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
    80000e24:	dd850513          	addi	a0,a0,-552 # 80014bf8 <uart_tx_lock>
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
    80000e4c:	db050513          	addi	a0,a0,-592 # 80014bf8 <uart_tx_lock>
    80000e50:	00000097          	auipc	ra,0x0
    80000e54:	4ec080e7          	jalr	1260(ra) # 8000133c <acquire>

  if(panicked){
    80000e58:	0000c797          	auipc	a5,0xc
    80000e5c:	b6878793          	addi	a5,a5,-1176 # 8000c9c0 <panicked>
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
    80000e6c:	d9058593          	addi	a1,a1,-624 # 80014bf8 <uart_tx_lock>
    80000e70:	0000c517          	auipc	a0,0xc
    80000e74:	b6050513          	addi	a0,a0,-1184 # 8000c9d0 <uart_tx_r>
    80000e78:	00002097          	auipc	ra,0x2
    80000e7c:	75a080e7          	jalr	1882(ra) # 800035d2 <sleep>
  while(uart_tx_w == uart_tx_r + UART_TX_BUF_SIZE){
    80000e80:	0000c797          	auipc	a5,0xc
    80000e84:	b5078793          	addi	a5,a5,-1200 # 8000c9d0 <uart_tx_r>
    80000e88:	639c                	ld	a5,0(a5)
    80000e8a:	02078713          	addi	a4,a5,32
    80000e8e:	0000c797          	auipc	a5,0xc
    80000e92:	b3a78793          	addi	a5,a5,-1222 # 8000c9c8 <uart_tx_w>
    80000e96:	639c                	ld	a5,0(a5)
    80000e98:	fcf708e3          	beq	a4,a5,80000e68 <uartputc+0x2e>
  }
  uart_tx_buf[uart_tx_w % UART_TX_BUF_SIZE] = c;
    80000e9c:	0000c797          	auipc	a5,0xc
    80000ea0:	b2c78793          	addi	a5,a5,-1236 # 8000c9c8 <uart_tx_w>
    80000ea4:	639c                	ld	a5,0(a5)
    80000ea6:	8bfd                	andi	a5,a5,31
    80000ea8:	fec42703          	lw	a4,-20(s0)
    80000eac:	0ff77713          	andi	a4,a4,255
    80000eb0:	00014697          	auipc	a3,0x14
    80000eb4:	d6068693          	addi	a3,a3,-672 # 80014c10 <uart_tx_buf>
    80000eb8:	97b6                	add	a5,a5,a3
    80000eba:	00e78023          	sb	a4,0(a5)
  uart_tx_w += 1;
    80000ebe:	0000c797          	auipc	a5,0xc
    80000ec2:	b0a78793          	addi	a5,a5,-1270 # 8000c9c8 <uart_tx_w>
    80000ec6:	639c                	ld	a5,0(a5)
    80000ec8:	00178713          	addi	a4,a5,1
    80000ecc:	0000c797          	auipc	a5,0xc
    80000ed0:	afc78793          	addi	a5,a5,-1284 # 8000c9c8 <uart_tx_w>
    80000ed4:	e398                	sd	a4,0(a5)
  uartstart();
    80000ed6:	00000097          	auipc	ra,0x0
    80000eda:	084080e7          	jalr	132(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    80000ede:	00014517          	auipc	a0,0x14
    80000ee2:	d1a50513          	addi	a0,a0,-742 # 80014bf8 <uart_tx_lock>
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
    80000f12:	ab278793          	addi	a5,a5,-1358 # 8000c9c0 <panicked>
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
    80000f66:	a6678793          	addi	a5,a5,-1434 # 8000c9c8 <uart_tx_w>
    80000f6a:	6398                	ld	a4,0(a5)
    80000f6c:	0000c797          	auipc	a5,0xc
    80000f70:	a6478793          	addi	a5,a5,-1436 # 8000c9d0 <uart_tx_r>
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
    80000f96:	a3e78793          	addi	a5,a5,-1474 # 8000c9d0 <uart_tx_r>
    80000f9a:	639c                	ld	a5,0(a5)
    80000f9c:	8bfd                	andi	a5,a5,31
    80000f9e:	00014717          	auipc	a4,0x14
    80000fa2:	c7270713          	addi	a4,a4,-910 # 80014c10 <uart_tx_buf>
    80000fa6:	97ba                	add	a5,a5,a4
    80000fa8:	0007c783          	lbu	a5,0(a5)
    80000fac:	fef42623          	sw	a5,-20(s0)
    uart_tx_r += 1;
    80000fb0:	0000c797          	auipc	a5,0xc
    80000fb4:	a2078793          	addi	a5,a5,-1504 # 8000c9d0 <uart_tx_r>
    80000fb8:	639c                	ld	a5,0(a5)
    80000fba:	00178713          	addi	a4,a5,1
    80000fbe:	0000c797          	auipc	a5,0xc
    80000fc2:	a1278793          	addi	a5,a5,-1518 # 8000c9d0 <uart_tx_r>
    80000fc6:	e398                	sd	a4,0(a5)
    
    // maybe uartputc() is waiting for space in the buffer.
    wakeup(&uart_tx_r);
    80000fc8:	0000c517          	auipc	a0,0xc
    80000fcc:	a0850513          	addi	a0,a0,-1528 # 8000c9d0 <uart_tx_r>
    80000fd0:	00002097          	auipc	ra,0x2
    80000fd4:	67e080e7          	jalr	1662(ra) # 8000364e <wakeup>
    
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
    80001068:	b9450513          	addi	a0,a0,-1132 # 80014bf8 <uart_tx_lock>
    8000106c:	00000097          	auipc	ra,0x0
    80001070:	2d0080e7          	jalr	720(ra) # 8000133c <acquire>
  uartstart();
    80001074:	00000097          	auipc	ra,0x0
    80001078:	ee6080e7          	jalr	-282(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    8000107c:	00014517          	auipc	a0,0x14
    80001080:	b7c50513          	addi	a0,a0,-1156 # 80014bf8 <uart_tx_lock>
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
    800010aa:	b8a50513          	addi	a0,a0,-1142 # 80014c30 <kmem>
    800010ae:	00000097          	auipc	ra,0x0
    800010b2:	25e080e7          	jalr	606(ra) # 8000130c <initlock>
  freerange(end, (void*)PHYSTOP);
    800010b6:	08100793          	li	a5,129
    800010ba:	01879593          	slli	a1,a5,0x18
    800010be:	00065517          	auipc	a0,0x65
    800010c2:	12a50513          	addi	a0,a0,298 # 800661e8 <end>
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
    80001150:	09c78793          	addi	a5,a5,156 # 800661e8 <end>
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
    80001192:	aa250513          	addi	a0,a0,-1374 # 80014c30 <kmem>
    80001196:	00000097          	auipc	ra,0x0
    8000119a:	1a6080e7          	jalr	422(ra) # 8000133c <acquire>
  r->next = kmem.freelist;
    8000119e:	00014797          	auipc	a5,0x14
    800011a2:	a9278793          	addi	a5,a5,-1390 # 80014c30 <kmem>
    800011a6:	6f98                	ld	a4,24(a5)
    800011a8:	fe843783          	ld	a5,-24(s0)
    800011ac:	e398                	sd	a4,0(a5)
  kmem.freelist = r;
    800011ae:	00014797          	auipc	a5,0x14
    800011b2:	a8278793          	addi	a5,a5,-1406 # 80014c30 <kmem>
    800011b6:	fe843703          	ld	a4,-24(s0)
    800011ba:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    800011bc:	00014517          	auipc	a0,0x14
    800011c0:	a7450513          	addi	a0,a0,-1420 # 80014c30 <kmem>
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
    800011e2:	a5250513          	addi	a0,a0,-1454 # 80014c30 <kmem>
    800011e6:	00000097          	auipc	ra,0x0
    800011ea:	156080e7          	jalr	342(ra) # 8000133c <acquire>
  r = kmem.freelist;
    800011ee:	00014797          	auipc	a5,0x14
    800011f2:	a4278793          	addi	a5,a5,-1470 # 80014c30 <kmem>
    800011f6:	6f9c                	ld	a5,24(a5)
    800011f8:	fef43423          	sd	a5,-24(s0)
  if(r)
    800011fc:	fe843783          	ld	a5,-24(s0)
    80001200:	cb89                	beqz	a5,80001212 <kalloc+0x3c>
    kmem.freelist = r->next;
    80001202:	fe843783          	ld	a5,-24(s0)
    80001206:	6398                	ld	a4,0(a5)
    80001208:	00014797          	auipc	a5,0x14
    8000120c:	a2878793          	addi	a5,a5,-1496 # 80014c30 <kmem>
    80001210:	ef98                	sd	a4,24(a5)
  release(&kmem.lock);
    80001212:	00014517          	auipc	a0,0x14
    80001216:	a1e50513          	addi	a0,a0,-1506 # 80014c30 <kmem>
    8000121a:	00000097          	auipc	ra,0x0
    8000121e:	186080e7          	jalr	390(ra) # 800013a0 <release>

  if(!r)
    80001222:	fe843783          	ld	a5,-24(s0)
    80001226:	e799                	bnez	a5,80001234 <kalloc+0x5e>
    r = swapout();
    80001228:	00009097          	auipc	ra,0x9
    8000122c:	472080e7          	jalr	1138(ra) # 8000a69a <swapout>
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
    8000138a:	650080e7          	jalr	1616(ra) # 800029d6 <mycpu>
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
    80001416:	5c4080e7          	jalr	1476(ra) # 800029d6 <mycpu>
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
    8000145c:	57e080e7          	jalr	1406(ra) # 800029d6 <mycpu>
    80001460:	87aa                	mv	a5,a0
    80001462:	5fbc                	lw	a5,120(a5)
    80001464:	eb89                	bnez	a5,80001476 <push_off+0x3c>
    mycpu()->intena = old;
    80001466:	00001097          	auipc	ra,0x1
    8000146a:	570080e7          	jalr	1392(ra) # 800029d6 <mycpu>
    8000146e:	872a                	mv	a4,a0
    80001470:	fec42783          	lw	a5,-20(s0)
    80001474:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    80001476:	00001097          	auipc	ra,0x1
    8000147a:	560080e7          	jalr	1376(ra) # 800029d6 <mycpu>
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
    8000149e:	53c080e7          	jalr	1340(ra) # 800029d6 <mycpu>
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
    800018d0:	0e6080e7          	jalr	230(ra) # 800029b2 <cpuid>
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
    80001934:	fb4080e7          	jalr	-76(ra) # 800028e4 <procinit>
    trapinit();      // trap vectors
    80001938:	00002097          	auipc	ra,0x2
    8000193c:	2b8080e7          	jalr	696(ra) # 80003bf0 <trapinit>
    trapinithart();  // install kernel trap vector
    80001940:	00002097          	auipc	ra,0x2
    80001944:	2da080e7          	jalr	730(ra) # 80003c1a <trapinithart>
    plicinit();      // set up interrupt controller
    80001948:	00007097          	auipc	ra,0x7
    8000194c:	1a2080e7          	jalr	418(ra) # 80008aea <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    80001950:	00007097          	auipc	ra,0x7
    80001954:	1c8080e7          	jalr	456(ra) # 80008b18 <plicinithart>
    binit();         // buffer cache
    80001958:	00003097          	auipc	ra,0x3
    8000195c:	d40080e7          	jalr	-704(ra) # 80004698 <binit>
    iinit();         // inode table
    80001960:	00003097          	auipc	ra,0x3
    80001964:	596080e7          	jalr	1430(ra) # 80004ef6 <iinit>
    fileinit();      // file table
    80001968:	00005097          	auipc	ra,0x5
    8000196c:	f6a080e7          	jalr	-150(ra) # 800068d2 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    80001970:	0000a597          	auipc	a1,0xa
    80001974:	73058593          	addi	a1,a1,1840 # 8000c0a0 <etext+0xa0>
    80001978:	4501                	li	a0,0
    8000197a:	00007097          	auipc	ra,0x7
    8000197e:	496080e7          	jalr	1174(ra) # 80008e10 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    80001982:	0000a597          	auipc	a1,0xa
    80001986:	72e58593          	addi	a1,a1,1838 # 8000c0b0 <etext+0xb0>
    8000198a:	4505                	li	a0,1
    8000198c:	00007097          	auipc	ra,0x7
    80001990:	484080e7          	jalr	1156(ra) # 80008e10 <virtio_disk_init>

    userinit();      // first user process
    80001994:	00001097          	auipc	ra,0x1
    80001998:	3fc080e7          	jalr	1020(ra) # 80002d90 <userinit>
    __sync_synchronize();
    8000199c:	0ff0000f          	fence
    started = 1;
    800019a0:	00013797          	auipc	a5,0x13
    800019a4:	2b078793          	addi	a5,a5,688 # 80014c50 <started>
    800019a8:	4705                	li	a4,1
    800019aa:	c398                	sw	a4,0(a5)
    800019ac:	a0a9                	j	800019f6 <main+0x132>
  } else {
    while(started == 0)
    800019ae:	0001                	nop
    800019b0:	00013797          	auipc	a5,0x13
    800019b4:	2a078793          	addi	a5,a5,672 # 80014c50 <started>
    800019b8:	439c                	lw	a5,0(a5)
    800019ba:	2781                	sext.w	a5,a5
    800019bc:	dbf5                	beqz	a5,800019b0 <main+0xec>
      ;
    __sync_synchronize();
    800019be:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800019c2:	00001097          	auipc	ra,0x1
    800019c6:	ff0080e7          	jalr	-16(ra) # 800029b2 <cpuid>
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
    800019ea:	234080e7          	jalr	564(ra) # 80003c1a <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    800019ee:	00007097          	auipc	ra,0x7
    800019f2:	12a080e7          	jalr	298(ra) # 80008b18 <plicinithart>
  }

  scheduler();        
    800019f6:	00002097          	auipc	ra,0x2
    800019fa:	9b0080e7          	jalr	-1616(ra) # 800033a6 <scheduler>

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
    80001a62:	302080e7          	jalr	770(ra) # 80001d60 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001a66:	4719                	li	a4,6
    80001a68:	6685                	lui	a3,0x1
    80001a6a:	10001637          	lui	a2,0x10001
    80001a6e:	100015b7          	lui	a1,0x10001
    80001a72:	fe843503          	ld	a0,-24(s0)
    80001a76:	00000097          	auipc	ra,0x0
    80001a7a:	2ea080e7          	jalr	746(ra) # 80001d60 <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001a7e:	4719                	li	a4,6
    80001a80:	6685                	lui	a3,0x1
    80001a82:	10002637          	lui	a2,0x10002
    80001a86:	100025b7          	lui	a1,0x10002
    80001a8a:	fe843503          	ld	a0,-24(s0)
    80001a8e:	00000097          	auipc	ra,0x0
    80001a92:	2d2080e7          	jalr	722(ra) # 80001d60 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001a96:	4719                	li	a4,6
    80001a98:	004006b7          	lui	a3,0x400
    80001a9c:	0c000637          	lui	a2,0xc000
    80001aa0:	0c0005b7          	lui	a1,0xc000
    80001aa4:	fe843503          	ld	a0,-24(s0)
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	2b8080e7          	jalr	696(ra) # 80001d60 <kvmmap>

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
    80001ad6:	28e080e7          	jalr	654(ra) # 80001d60 <kvmmap>

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
    80001b08:	25c080e7          	jalr	604(ra) # 80001d60 <kvmmap>

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
    80001b2c:	238080e7          	jalr	568(ra) # 80001d60 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001b30:	fe843503          	ld	a0,-24(s0)
    80001b34:	00001097          	auipc	ra,0x1
    80001b38:	cf4080e7          	jalr	-780(ra) # 80002828 <proc_mapstacks>
  
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
    80001b60:	e7c78793          	addi	a5,a5,-388 # 8000c9d8 <kernel_pagetable>
    80001b64:	e398                	sd	a4,0(a5)
  updaterefhistory();
    80001b66:	00009097          	auipc	ra,0x9
    80001b6a:	994080e7          	jalr	-1644(ra) # 8000a4fa <updaterefhistory>
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
    80001b8c:	e5078793          	addi	a5,a5,-432 # 8000c9d8 <kernel_pagetable>
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
    80001bb8:	715d                	addi	sp,sp,-80
    80001bba:	e486                	sd	ra,72(sp)
    80001bbc:	e0a2                	sd	s0,64(sp)
    80001bbe:	0880                	addi	s0,sp,80
    80001bc0:	fca43423          	sd	a0,-56(s0)
    80001bc4:	fcb43023          	sd	a1,-64(s0)
    80001bc8:	87b2                	mv	a5,a2
    80001bca:	faf42e23          	sw	a5,-68(s0)
  if(va >= MAXVA)
    80001bce:	fc043703          	ld	a4,-64(s0)
    80001bd2:	57fd                	li	a5,-1
    80001bd4:	83e9                	srli	a5,a5,0x1a
    80001bd6:	00e7f463          	bgeu	a5,a4,80001bde <walk+0x26>
    return 0;
    80001bda:	4781                	li	a5,0
    80001bdc:	a8dd                	j	80001cd2 <walk+0x11a>

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
    80001bfa:	fc043783          	ld	a5,-64(s0)
    80001bfe:	00e7d7b3          	srl	a5,a5,a4
    80001c02:	1ff7f793          	andi	a5,a5,511
    80001c06:	078e                	slli	a5,a5,0x3
    80001c08:	fc843703          	ld	a4,-56(s0)
    80001c0c:	97ba                	add	a5,a5,a4
    80001c0e:	fcf43c23          	sd	a5,-40(s0)
    if(*pte & PTE_V) {
    80001c12:	fd843783          	ld	a5,-40(s0)
    80001c16:	639c                	ld	a5,0(a5)
    80001c18:	8b85                	andi	a5,a5,1
    80001c1a:	cb89                	beqz	a5,80001c2c <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001c1c:	fd843783          	ld	a5,-40(s0)
    80001c20:	639c                	ld	a5,0(a5)
    80001c22:	83a9                	srli	a5,a5,0xa
    80001c24:	07b2                	slli	a5,a5,0xc
    80001c26:	fcf43423          	sd	a5,-56(s0)
    80001c2a:	a089                	j	80001c6c <walk+0xb4>
    }
    else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001c2c:	fbc42783          	lw	a5,-68(s0)
    80001c30:	2781                	sext.w	a5,a5
    80001c32:	cb91                	beqz	a5,80001c46 <walk+0x8e>
    80001c34:	fffff097          	auipc	ra,0xfffff
    80001c38:	5a2080e7          	jalr	1442(ra) # 800011d6 <kalloc>
    80001c3c:	fca43423          	sd	a0,-56(s0)
    80001c40:	fc843783          	ld	a5,-56(s0)
    80001c44:	e399                	bnez	a5,80001c4a <walk+0x92>
        return 0;
    80001c46:	4781                	li	a5,0
    80001c48:	a069                	j	80001cd2 <walk+0x11a>
      memset(pagetable, 0, PGSIZE);
    80001c4a:	6605                	lui	a2,0x1
    80001c4c:	4581                	li	a1,0
    80001c4e:	fc843503          	ld	a0,-56(s0)
    80001c52:	00000097          	auipc	ra,0x0
    80001c56:	8be080e7          	jalr	-1858(ra) # 80001510 <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001c5a:	fc843783          	ld	a5,-56(s0)
    80001c5e:	83b1                	srli	a5,a5,0xc
    80001c60:	07aa                	slli	a5,a5,0xa
    80001c62:	0017e713          	ori	a4,a5,1
    80001c66:	fd843783          	ld	a5,-40(s0)
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

  pte_t *result = &pagetable[PX(0, va)];
    80001c80:	fc043783          	ld	a5,-64(s0)
    80001c84:	83b1                	srli	a5,a5,0xc
    80001c86:	1ff7f793          	andi	a5,a5,511
    80001c8a:	078e                	slli	a5,a5,0x3
    80001c8c:	fc843703          	ld	a4,-56(s0)
    80001c90:	97ba                	add	a5,a5,a4
    80001c92:	fef43023          	sd	a5,-32(s0)

  if(*result & PTE_ON_DISK)
    80001c96:	fe043783          	ld	a5,-32(s0)
    80001c9a:	639c                	ld	a5,0(a5)
    80001c9c:	1007f793          	andi	a5,a5,256
    80001ca0:	c79d                	beqz	a5,80001cce <walk+0x116>
  {
    if(*result & PTE_PENDING_DISK_OPERATION) // TODO: Help @ZikaBG
    80001ca2:	fe043783          	ld	a5,-32(s0)
    80001ca6:	639c                	ld	a5,0(a5)
    80001ca8:	2007f793          	andi	a5,a5,512
    80001cac:	cb89                	beqz	a5,80001cbe <walk+0x106>
      panic("walk: PENDING_DISK_OPERATION");
    80001cae:	0000a517          	auipc	a0,0xa
    80001cb2:	42a50513          	addi	a0,a0,1066 # 8000c0d8 <etext+0xd8>
    80001cb6:	fffff097          	auipc	ra,0xfffff
    80001cba:	fd6080e7          	jalr	-42(ra) # 80000c8c <panic>

    swapin(va, pagetable);
    80001cbe:	fc843583          	ld	a1,-56(s0)
    80001cc2:	fc043503          	ld	a0,-64(s0)
    80001cc6:	00009097          	auipc	ra,0x9
    80001cca:	aea080e7          	jalr	-1302(ra) # 8000a7b0 <swapin>
  }

  return result;
    80001cce:	fe043783          	ld	a5,-32(s0)
}
    80001cd2:	853e                	mv	a0,a5
    80001cd4:	60a6                	ld	ra,72(sp)
    80001cd6:	6406                	ld	s0,64(sp)
    80001cd8:	6161                	addi	sp,sp,80
    80001cda:	8082                	ret

0000000080001cdc <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001cdc:	7179                	addi	sp,sp,-48
    80001cde:	f406                	sd	ra,40(sp)
    80001ce0:	f022                	sd	s0,32(sp)
    80001ce2:	1800                	addi	s0,sp,48
    80001ce4:	fca43c23          	sd	a0,-40(s0)
    80001ce8:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001cec:	fd043703          	ld	a4,-48(s0)
    80001cf0:	57fd                	li	a5,-1
    80001cf2:	83e9                	srli	a5,a5,0x1a
    80001cf4:	00e7f463          	bgeu	a5,a4,80001cfc <walkaddr+0x20>
    return 0;
    80001cf8:	4781                	li	a5,0
    80001cfa:	a8b1                	j	80001d56 <walkaddr+0x7a>

  pte = walk(pagetable, va, 0);
    80001cfc:	4601                	li	a2,0
    80001cfe:	fd043583          	ld	a1,-48(s0)
    80001d02:	fd843503          	ld	a0,-40(s0)
    80001d06:	00000097          	auipc	ra,0x0
    80001d0a:	eb2080e7          	jalr	-334(ra) # 80001bb8 <walk>
    80001d0e:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001d12:	fe843783          	ld	a5,-24(s0)
    80001d16:	e399                	bnez	a5,80001d1c <walkaddr+0x40>
    return 0;
    80001d18:	4781                	li	a5,0
    80001d1a:	a835                	j	80001d56 <walkaddr+0x7a>
  if((*pte & PTE_V) == 0 && (*pte & PTE_ON_DISK) == 0)
    80001d1c:	fe843783          	ld	a5,-24(s0)
    80001d20:	639c                	ld	a5,0(a5)
    80001d22:	8b85                	andi	a5,a5,1
    80001d24:	eb89                	bnez	a5,80001d36 <walkaddr+0x5a>
    80001d26:	fe843783          	ld	a5,-24(s0)
    80001d2a:	639c                	ld	a5,0(a5)
    80001d2c:	1007f793          	andi	a5,a5,256
    80001d30:	e399                	bnez	a5,80001d36 <walkaddr+0x5a>
    return 0;
    80001d32:	4781                	li	a5,0
    80001d34:	a00d                	j	80001d56 <walkaddr+0x7a>
  if((*pte & PTE_U) == 0)
    80001d36:	fe843783          	ld	a5,-24(s0)
    80001d3a:	639c                	ld	a5,0(a5)
    80001d3c:	8bc1                	andi	a5,a5,16
    80001d3e:	e399                	bnez	a5,80001d44 <walkaddr+0x68>
    return 0;
    80001d40:	4781                	li	a5,0
    80001d42:	a811                	j	80001d56 <walkaddr+0x7a>

  pa = PTE2PA(*pte);
    80001d44:	fe843783          	ld	a5,-24(s0)
    80001d48:	639c                	ld	a5,0(a5)
    80001d4a:	83a9                	srli	a5,a5,0xa
    80001d4c:	07b2                	slli	a5,a5,0xc
    80001d4e:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001d52:	fe043783          	ld	a5,-32(s0)
}
    80001d56:	853e                	mv	a0,a5
    80001d58:	70a2                	ld	ra,40(sp)
    80001d5a:	7402                	ld	s0,32(sp)
    80001d5c:	6145                	addi	sp,sp,48
    80001d5e:	8082                	ret

0000000080001d60 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001d60:	7139                	addi	sp,sp,-64
    80001d62:	fc06                	sd	ra,56(sp)
    80001d64:	f822                	sd	s0,48(sp)
    80001d66:	0080                	addi	s0,sp,64
    80001d68:	fea43423          	sd	a0,-24(s0)
    80001d6c:	feb43023          	sd	a1,-32(s0)
    80001d70:	fcc43c23          	sd	a2,-40(s0)
    80001d74:	fcd43823          	sd	a3,-48(s0)
    80001d78:	87ba                	mv	a5,a4
    80001d7a:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001d7e:	fcc42783          	lw	a5,-52(s0)
    80001d82:	873e                	mv	a4,a5
    80001d84:	fd843683          	ld	a3,-40(s0)
    80001d88:	fd043603          	ld	a2,-48(s0)
    80001d8c:	fe043583          	ld	a1,-32(s0)
    80001d90:	fe843503          	ld	a0,-24(s0)
    80001d94:	00000097          	auipc	ra,0x0
    80001d98:	026080e7          	jalr	38(ra) # 80001dba <mappages>
    80001d9c:	87aa                	mv	a5,a0
    80001d9e:	cb89                	beqz	a5,80001db0 <kvmmap+0x50>
    panic("kvmmap");
    80001da0:	0000a517          	auipc	a0,0xa
    80001da4:	35850513          	addi	a0,a0,856 # 8000c0f8 <etext+0xf8>
    80001da8:	fffff097          	auipc	ra,0xfffff
    80001dac:	ee4080e7          	jalr	-284(ra) # 80000c8c <panic>
}
    80001db0:	0001                	nop
    80001db2:	70e2                	ld	ra,56(sp)
    80001db4:	7442                	ld	s0,48(sp)
    80001db6:	6121                	addi	sp,sp,64
    80001db8:	8082                	ret

0000000080001dba <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001dba:	711d                	addi	sp,sp,-96
    80001dbc:	ec86                	sd	ra,88(sp)
    80001dbe:	e8a2                	sd	s0,80(sp)
    80001dc0:	1080                	addi	s0,sp,96
    80001dc2:	fca43423          	sd	a0,-56(s0)
    80001dc6:	fcb43023          	sd	a1,-64(s0)
    80001dca:	fac43c23          	sd	a2,-72(s0)
    80001dce:	fad43823          	sd	a3,-80(s0)
    80001dd2:	87ba                	mv	a5,a4
    80001dd4:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001dd8:	fb843783          	ld	a5,-72(s0)
    80001ddc:	eb89                	bnez	a5,80001dee <mappages+0x34>
    panic("mappages: size");
    80001dde:	0000a517          	auipc	a0,0xa
    80001de2:	32250513          	addi	a0,a0,802 # 8000c100 <etext+0x100>
    80001de6:	fffff097          	auipc	ra,0xfffff
    80001dea:	ea6080e7          	jalr	-346(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    80001dee:	fc043703          	ld	a4,-64(s0)
    80001df2:	77fd                	lui	a5,0xfffff
    80001df4:	8ff9                	and	a5,a5,a4
    80001df6:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001dfa:	fc043703          	ld	a4,-64(s0)
    80001dfe:	fb843783          	ld	a5,-72(s0)
    80001e02:	97ba                	add	a5,a5,a4
    80001e04:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ff98e17>
    80001e08:	77fd                	lui	a5,0xfffff
    80001e0a:	8ff9                	and	a5,a5,a4
    80001e0c:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001e10:	4605                	li	a2,1
    80001e12:	fe843583          	ld	a1,-24(s0)
    80001e16:	fc843503          	ld	a0,-56(s0)
    80001e1a:	00000097          	auipc	ra,0x0
    80001e1e:	d9e080e7          	jalr	-610(ra) # 80001bb8 <walk>
    80001e22:	fca43c23          	sd	a0,-40(s0)
    80001e26:	fd843783          	ld	a5,-40(s0)
    80001e2a:	e399                	bnez	a5,80001e30 <mappages+0x76>
      return -1;
    80001e2c:	57fd                	li	a5,-1
    80001e2e:	a8bd                	j	80001eac <mappages+0xf2>
    if(*pte & PTE_V)
    80001e30:	fd843783          	ld	a5,-40(s0)
    80001e34:	639c                	ld	a5,0(a5)
    80001e36:	8b85                	andi	a5,a5,1
    80001e38:	cb89                	beqz	a5,80001e4a <mappages+0x90>
      panic("mappages: remap");
    80001e3a:	0000a517          	auipc	a0,0xa
    80001e3e:	2d650513          	addi	a0,a0,726 # 8000c110 <etext+0x110>
    80001e42:	fffff097          	auipc	ra,0xfffff
    80001e46:	e4a080e7          	jalr	-438(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001e4a:	fb043783          	ld	a5,-80(s0)
    80001e4e:	83b1                	srli	a5,a5,0xc
    80001e50:	00a79713          	slli	a4,a5,0xa
    80001e54:	fac42783          	lw	a5,-84(s0)
    80001e58:	8fd9                	or	a5,a5,a4
    80001e5a:	0017e713          	ori	a4,a5,1
    80001e5e:	fd843783          	ld	a5,-40(s0)
    80001e62:	e398                	sd	a4,0(a5)
    if(*pte & PTE_U)
    80001e64:	fd843783          	ld	a5,-40(s0)
    80001e68:	639c                	ld	a5,0(a5)
    80001e6a:	8bc1                	andi	a5,a5,16
    80001e6c:	cb99                	beqz	a5,80001e82 <mappages+0xc8>
      reglrupage(pte, a, pagetable);
    80001e6e:	fc843603          	ld	a2,-56(s0)
    80001e72:	fe843583          	ld	a1,-24(s0)
    80001e76:	fd843503          	ld	a0,-40(s0)
    80001e7a:	00008097          	auipc	ra,0x8
    80001e7e:	526080e7          	jalr	1318(ra) # 8000a3a0 <reglrupage>
    if(a == last)
    80001e82:	fe843703          	ld	a4,-24(s0)
    80001e86:	fe043783          	ld	a5,-32(s0)
    80001e8a:	00f70f63          	beq	a4,a5,80001ea8 <mappages+0xee>
      break;
    a += PGSIZE;
    80001e8e:	fe843703          	ld	a4,-24(s0)
    80001e92:	6785                	lui	a5,0x1
    80001e94:	97ba                	add	a5,a5,a4
    80001e96:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001e9a:	fb043703          	ld	a4,-80(s0)
    80001e9e:	6785                	lui	a5,0x1
    80001ea0:	97ba                	add	a5,a5,a4
    80001ea2:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001ea6:	b7ad                	j	80001e10 <mappages+0x56>
      break;
    80001ea8:	0001                	nop
  }
  return 0;
    80001eaa:	4781                	li	a5,0
}
    80001eac:	853e                	mv	a0,a5
    80001eae:	60e6                	ld	ra,88(sp)
    80001eb0:	6446                	ld	s0,80(sp)
    80001eb2:	6125                	addi	sp,sp,96
    80001eb4:	8082                	ret

0000000080001eb6 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001eb6:	715d                	addi	sp,sp,-80
    80001eb8:	e486                	sd	ra,72(sp)
    80001eba:	e0a2                	sd	s0,64(sp)
    80001ebc:	0880                	addi	s0,sp,80
    80001ebe:	fca43423          	sd	a0,-56(s0)
    80001ec2:	fcb43023          	sd	a1,-64(s0)
    80001ec6:	fac43c23          	sd	a2,-72(s0)
    80001eca:	87b6                	mv	a5,a3
    80001ecc:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001ed0:	fc043703          	ld	a4,-64(s0)
    80001ed4:	6785                	lui	a5,0x1
    80001ed6:	17fd                	addi	a5,a5,-1
    80001ed8:	8ff9                	and	a5,a5,a4
    80001eda:	cb89                	beqz	a5,80001eec <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001edc:	0000a517          	auipc	a0,0xa
    80001ee0:	24450513          	addi	a0,a0,580 # 8000c120 <etext+0x120>
    80001ee4:	fffff097          	auipc	ra,0xfffff
    80001ee8:	da8080e7          	jalr	-600(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001eec:	fc043783          	ld	a5,-64(s0)
    80001ef0:	fef43423          	sd	a5,-24(s0)
    80001ef4:	a211                	j	80001ff8 <uvmunmap+0x142>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001ef6:	4601                	li	a2,0
    80001ef8:	fe843583          	ld	a1,-24(s0)
    80001efc:	fc843503          	ld	a0,-56(s0)
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	cb8080e7          	jalr	-840(ra) # 80001bb8 <walk>
    80001f08:	fea43023          	sd	a0,-32(s0)
    80001f0c:	fe043783          	ld	a5,-32(s0)
    80001f10:	eb89                	bnez	a5,80001f22 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001f12:	0000a517          	auipc	a0,0xa
    80001f16:	22650513          	addi	a0,a0,550 # 8000c138 <etext+0x138>
    80001f1a:	fffff097          	auipc	ra,0xfffff
    80001f1e:	d72080e7          	jalr	-654(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0 && (*pte & PTE_ON_DISK) == 0)
    80001f22:	fe043783          	ld	a5,-32(s0)
    80001f26:	639c                	ld	a5,0(a5)
    80001f28:	8b85                	andi	a5,a5,1
    80001f2a:	ef99                	bnez	a5,80001f48 <uvmunmap+0x92>
    80001f2c:	fe043783          	ld	a5,-32(s0)
    80001f30:	639c                	ld	a5,0(a5)
    80001f32:	1007f793          	andi	a5,a5,256
    80001f36:	eb89                	bnez	a5,80001f48 <uvmunmap+0x92>
      panic("uvmunmap: not mapped");
    80001f38:	0000a517          	auipc	a0,0xa
    80001f3c:	21050513          	addi	a0,a0,528 # 8000c148 <etext+0x148>
    80001f40:	fffff097          	auipc	ra,0xfffff
    80001f44:	d4c080e7          	jalr	-692(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80001f48:	fe043783          	ld	a5,-32(s0)
    80001f4c:	639c                	ld	a5,0(a5)
    80001f4e:	3ff7f713          	andi	a4,a5,1023
    80001f52:	4785                	li	a5,1
    80001f54:	00f71a63          	bne	a4,a5,80001f68 <uvmunmap+0xb2>
      panic("uvmunmap: not a leaf");
    80001f58:	0000a517          	auipc	a0,0xa
    80001f5c:	20850513          	addi	a0,a0,520 # 8000c160 <etext+0x160>
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	d2c080e7          	jalr	-724(ra) # 80000c8c <panic>

    if((*pte & PTE_U) && va != TRAMPOLINE && va != TRAPFRAME)
    80001f68:	fe043783          	ld	a5,-32(s0)
    80001f6c:	639c                	ld	a5,0(a5)
    80001f6e:	8bc1                	andi	a5,a5,16
    80001f70:	cb8d                	beqz	a5,80001fa2 <uvmunmap+0xec>
    80001f72:	fc043703          	ld	a4,-64(s0)
    80001f76:	040007b7          	lui	a5,0x4000
    80001f7a:	17fd                	addi	a5,a5,-1
    80001f7c:	07b2                	slli	a5,a5,0xc
    80001f7e:	02f70263          	beq	a4,a5,80001fa2 <uvmunmap+0xec>
    80001f82:	fc043703          	ld	a4,-64(s0)
    80001f86:	020007b7          	lui	a5,0x2000
    80001f8a:	17fd                	addi	a5,a5,-1
    80001f8c:	07b6                	slli	a5,a5,0xd
    80001f8e:	00f70a63          	beq	a4,a5,80001fa2 <uvmunmap+0xec>
      unreglrupage(a, pagetable);
    80001f92:	fc843583          	ld	a1,-56(s0)
    80001f96:	fe843503          	ld	a0,-24(s0)
    80001f9a:	00008097          	auipc	ra,0x8
    80001f9e:	4d8080e7          	jalr	1240(ra) # 8000a472 <unreglrupage>

    if(do_free){
    80001fa2:	fb442783          	lw	a5,-76(s0)
    80001fa6:	2781                	sext.w	a5,a5
    80001fa8:	cf95                	beqz	a5,80001fe4 <uvmunmap+0x12e>
      uint64 pa = PTE2PA(*pte);
    80001faa:	fe043783          	ld	a5,-32(s0)
    80001fae:	639c                	ld	a5,0(a5)
    80001fb0:	83a9                	srli	a5,a5,0xa
    80001fb2:	07b2                	slli	a5,a5,0xc
    80001fb4:	fcf43c23          	sd	a5,-40(s0)
      if(*pte & PTE_ON_DISK)
    80001fb8:	fe043783          	ld	a5,-32(s0)
    80001fbc:	639c                	ld	a5,0(a5)
    80001fbe:	1007f793          	andi	a5,a5,256
    80001fc2:	cb91                	beqz	a5,80001fd6 <uvmunmap+0x120>
        deallocate_page((int)pa);
    80001fc4:	fd843783          	ld	a5,-40(s0)
    80001fc8:	2781                	sext.w	a5,a5
    80001fca:	853e                	mv	a0,a5
    80001fcc:	00008097          	auipc	ra,0x8
    80001fd0:	efc080e7          	jalr	-260(ra) # 80009ec8 <deallocate_page>
    80001fd4:	a801                	j	80001fe4 <uvmunmap+0x12e>
      else
        kfree((void*)pa);
    80001fd6:	fd843783          	ld	a5,-40(s0)
    80001fda:	853e                	mv	a0,a5
    80001fdc:	fffff097          	auipc	ra,0xfffff
    80001fe0:	154080e7          	jalr	340(ra) # 80001130 <kfree>
    }
    *pte = 0;
    80001fe4:	fe043783          	ld	a5,-32(s0)
    80001fe8:	0007b023          	sd	zero,0(a5) # 2000000 <_entry-0x7e000000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001fec:	fe843703          	ld	a4,-24(s0)
    80001ff0:	6785                	lui	a5,0x1
    80001ff2:	97ba                	add	a5,a5,a4
    80001ff4:	fef43423          	sd	a5,-24(s0)
    80001ff8:	fb843783          	ld	a5,-72(s0)
    80001ffc:	00c79713          	slli	a4,a5,0xc
    80002000:	fc043783          	ld	a5,-64(s0)
    80002004:	97ba                	add	a5,a5,a4
    80002006:	fe843703          	ld	a4,-24(s0)
    8000200a:	eef766e3          	bltu	a4,a5,80001ef6 <uvmunmap+0x40>
  }
}
    8000200e:	0001                	nop
    80002010:	0001                	nop
    80002012:	60a6                	ld	ra,72(sp)
    80002014:	6406                	ld	s0,64(sp)
    80002016:	6161                	addi	sp,sp,80
    80002018:	8082                	ret

000000008000201a <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    8000201a:	1101                	addi	sp,sp,-32
    8000201c:	ec06                	sd	ra,24(sp)
    8000201e:	e822                	sd	s0,16(sp)
    80002020:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80002022:	fffff097          	auipc	ra,0xfffff
    80002026:	1b4080e7          	jalr	436(ra) # 800011d6 <kalloc>
    8000202a:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    8000202e:	fe843783          	ld	a5,-24(s0)
    80002032:	e399                	bnez	a5,80002038 <uvmcreate+0x1e>
    return 0;
    80002034:	4781                	li	a5,0
    80002036:	a819                	j	8000204c <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    80002038:	6605                	lui	a2,0x1
    8000203a:	4581                	li	a1,0
    8000203c:	fe843503          	ld	a0,-24(s0)
    80002040:	fffff097          	auipc	ra,0xfffff
    80002044:	4d0080e7          	jalr	1232(ra) # 80001510 <memset>
  return pagetable;
    80002048:	fe843783          	ld	a5,-24(s0)
}
    8000204c:	853e                	mv	a0,a5
    8000204e:	60e2                	ld	ra,24(sp)
    80002050:	6442                	ld	s0,16(sp)
    80002052:	6105                	addi	sp,sp,32
    80002054:	8082                	ret

0000000080002056 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    80002056:	7139                	addi	sp,sp,-64
    80002058:	fc06                	sd	ra,56(sp)
    8000205a:	f822                	sd	s0,48(sp)
    8000205c:	0080                	addi	s0,sp,64
    8000205e:	fca43c23          	sd	a0,-40(s0)
    80002062:	fcb43823          	sd	a1,-48(s0)
    80002066:	87b2                	mv	a5,a2
    80002068:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    8000206c:	fcc42783          	lw	a5,-52(s0)
    80002070:	0007871b          	sext.w	a4,a5
    80002074:	6785                	lui	a5,0x1
    80002076:	00f76a63          	bltu	a4,a5,8000208a <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    8000207a:	0000a517          	auipc	a0,0xa
    8000207e:	0fe50513          	addi	a0,a0,254 # 8000c178 <etext+0x178>
    80002082:	fffff097          	auipc	ra,0xfffff
    80002086:	c0a080e7          	jalr	-1014(ra) # 80000c8c <panic>
  mem = kalloc();
    8000208a:	fffff097          	auipc	ra,0xfffff
    8000208e:	14c080e7          	jalr	332(ra) # 800011d6 <kalloc>
    80002092:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80002096:	6605                	lui	a2,0x1
    80002098:	4581                	li	a1,0
    8000209a:	fe843503          	ld	a0,-24(s0)
    8000209e:	fffff097          	auipc	ra,0xfffff
    800020a2:	472080e7          	jalr	1138(ra) # 80001510 <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    800020a6:	fe843783          	ld	a5,-24(s0)
    800020aa:	4779                	li	a4,30
    800020ac:	86be                	mv	a3,a5
    800020ae:	6605                	lui	a2,0x1
    800020b0:	4581                	li	a1,0
    800020b2:	fd843503          	ld	a0,-40(s0)
    800020b6:	00000097          	auipc	ra,0x0
    800020ba:	d04080e7          	jalr	-764(ra) # 80001dba <mappages>
  memmove(mem, src, sz);
    800020be:	fcc42783          	lw	a5,-52(s0)
    800020c2:	863e                	mv	a2,a5
    800020c4:	fd043583          	ld	a1,-48(s0)
    800020c8:	fe843503          	ld	a0,-24(s0)
    800020cc:	fffff097          	auipc	ra,0xfffff
    800020d0:	528080e7          	jalr	1320(ra) # 800015f4 <memmove>
}
    800020d4:	0001                	nop
    800020d6:	70e2                	ld	ra,56(sp)
    800020d8:	7442                	ld	s0,48(sp)
    800020da:	6121                	addi	sp,sp,64
    800020dc:	8082                	ret

00000000800020de <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    800020de:	7139                	addi	sp,sp,-64
    800020e0:	fc06                	sd	ra,56(sp)
    800020e2:	f822                	sd	s0,48(sp)
    800020e4:	0080                	addi	s0,sp,64
    800020e6:	fca43c23          	sd	a0,-40(s0)
    800020ea:	fcb43823          	sd	a1,-48(s0)
    800020ee:	fcc43423          	sd	a2,-56(s0)
    800020f2:	87b6                	mv	a5,a3
    800020f4:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    800020f8:	fc843703          	ld	a4,-56(s0)
    800020fc:	fd043783          	ld	a5,-48(s0)
    80002100:	00f77563          	bgeu	a4,a5,8000210a <uvmalloc+0x2c>
    return oldsz;
    80002104:	fd043783          	ld	a5,-48(s0)
    80002108:	a87d                	j	800021c6 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    8000210a:	fd043703          	ld	a4,-48(s0)
    8000210e:	6785                	lui	a5,0x1
    80002110:	17fd                	addi	a5,a5,-1
    80002112:	973e                	add	a4,a4,a5
    80002114:	77fd                	lui	a5,0xfffff
    80002116:	8ff9                	and	a5,a5,a4
    80002118:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    8000211c:	fd043783          	ld	a5,-48(s0)
    80002120:	fef43423          	sd	a5,-24(s0)
    80002124:	a849                	j	800021b6 <uvmalloc+0xd8>
    mem = kalloc();
    80002126:	fffff097          	auipc	ra,0xfffff
    8000212a:	0b0080e7          	jalr	176(ra) # 800011d6 <kalloc>
    8000212e:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80002132:	fe043783          	ld	a5,-32(s0)
    80002136:	ef89                	bnez	a5,80002150 <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    80002138:	fd043603          	ld	a2,-48(s0)
    8000213c:	fe843583          	ld	a1,-24(s0)
    80002140:	fd843503          	ld	a0,-40(s0)
    80002144:	00000097          	auipc	ra,0x0
    80002148:	08c080e7          	jalr	140(ra) # 800021d0 <uvmdealloc>
      return 0;
    8000214c:	4781                	li	a5,0
    8000214e:	a8a5                	j	800021c6 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    80002150:	6605                	lui	a2,0x1
    80002152:	4581                	li	a1,0
    80002154:	fe043503          	ld	a0,-32(s0)
    80002158:	fffff097          	auipc	ra,0xfffff
    8000215c:	3b8080e7          	jalr	952(ra) # 80001510 <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    80002160:	fe043683          	ld	a3,-32(s0)
    80002164:	fc442783          	lw	a5,-60(s0)
    80002168:	0127e793          	ori	a5,a5,18
    8000216c:	2781                	sext.w	a5,a5
    8000216e:	873e                	mv	a4,a5
    80002170:	6605                	lui	a2,0x1
    80002172:	fe843583          	ld	a1,-24(s0)
    80002176:	fd843503          	ld	a0,-40(s0)
    8000217a:	00000097          	auipc	ra,0x0
    8000217e:	c40080e7          	jalr	-960(ra) # 80001dba <mappages>
    80002182:	87aa                	mv	a5,a0
    80002184:	c39d                	beqz	a5,800021aa <uvmalloc+0xcc>
      kfree(mem);
    80002186:	fe043503          	ld	a0,-32(s0)
    8000218a:	fffff097          	auipc	ra,0xfffff
    8000218e:	fa6080e7          	jalr	-90(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80002192:	fd043603          	ld	a2,-48(s0)
    80002196:	fe843583          	ld	a1,-24(s0)
    8000219a:	fd843503          	ld	a0,-40(s0)
    8000219e:	00000097          	auipc	ra,0x0
    800021a2:	032080e7          	jalr	50(ra) # 800021d0 <uvmdealloc>
      return 0;
    800021a6:	4781                	li	a5,0
    800021a8:	a839                	j	800021c6 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    800021aa:	fe843703          	ld	a4,-24(s0)
    800021ae:	6785                	lui	a5,0x1
    800021b0:	97ba                	add	a5,a5,a4
    800021b2:	fef43423          	sd	a5,-24(s0)
    800021b6:	fe843703          	ld	a4,-24(s0)
    800021ba:	fc843783          	ld	a5,-56(s0)
    800021be:	f6f764e3          	bltu	a4,a5,80002126 <uvmalloc+0x48>
    }
  }
  return newsz;
    800021c2:	fc843783          	ld	a5,-56(s0)
}
    800021c6:	853e                	mv	a0,a5
    800021c8:	70e2                	ld	ra,56(sp)
    800021ca:	7442                	ld	s0,48(sp)
    800021cc:	6121                	addi	sp,sp,64
    800021ce:	8082                	ret

00000000800021d0 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    800021d0:	7139                	addi	sp,sp,-64
    800021d2:	fc06                	sd	ra,56(sp)
    800021d4:	f822                	sd	s0,48(sp)
    800021d6:	0080                	addi	s0,sp,64
    800021d8:	fca43c23          	sd	a0,-40(s0)
    800021dc:	fcb43823          	sd	a1,-48(s0)
    800021e0:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    800021e4:	fc843703          	ld	a4,-56(s0)
    800021e8:	fd043783          	ld	a5,-48(s0)
    800021ec:	00f76563          	bltu	a4,a5,800021f6 <uvmdealloc+0x26>
    return oldsz;
    800021f0:	fd043783          	ld	a5,-48(s0)
    800021f4:	a885                	j	80002264 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    800021f6:	fc843703          	ld	a4,-56(s0)
    800021fa:	6785                	lui	a5,0x1
    800021fc:	17fd                	addi	a5,a5,-1
    800021fe:	973e                	add	a4,a4,a5
    80002200:	77fd                	lui	a5,0xfffff
    80002202:	8f7d                	and	a4,a4,a5
    80002204:	fd043683          	ld	a3,-48(s0)
    80002208:	6785                	lui	a5,0x1
    8000220a:	17fd                	addi	a5,a5,-1
    8000220c:	96be                	add	a3,a3,a5
    8000220e:	77fd                	lui	a5,0xfffff
    80002210:	8ff5                	and	a5,a5,a3
    80002212:	04f77763          	bgeu	a4,a5,80002260 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    80002216:	fd043703          	ld	a4,-48(s0)
    8000221a:	6785                	lui	a5,0x1
    8000221c:	17fd                	addi	a5,a5,-1
    8000221e:	973e                	add	a4,a4,a5
    80002220:	77fd                	lui	a5,0xfffff
    80002222:	8f7d                	and	a4,a4,a5
    80002224:	fc843683          	ld	a3,-56(s0)
    80002228:	6785                	lui	a5,0x1
    8000222a:	17fd                	addi	a5,a5,-1
    8000222c:	96be                	add	a3,a3,a5
    8000222e:	77fd                	lui	a5,0xfffff
    80002230:	8ff5                	and	a5,a5,a3
    80002232:	40f707b3          	sub	a5,a4,a5
    80002236:	83b1                	srli	a5,a5,0xc
    80002238:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    8000223c:	fc843703          	ld	a4,-56(s0)
    80002240:	6785                	lui	a5,0x1
    80002242:	17fd                	addi	a5,a5,-1
    80002244:	973e                	add	a4,a4,a5
    80002246:	77fd                	lui	a5,0xfffff
    80002248:	8ff9                	and	a5,a5,a4
    8000224a:	fec42703          	lw	a4,-20(s0)
    8000224e:	4685                	li	a3,1
    80002250:	863a                	mv	a2,a4
    80002252:	85be                	mv	a1,a5
    80002254:	fd843503          	ld	a0,-40(s0)
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	c5e080e7          	jalr	-930(ra) # 80001eb6 <uvmunmap>
  }

  return newsz;
    80002260:	fc843783          	ld	a5,-56(s0)
}
    80002264:	853e                	mv	a0,a5
    80002266:	70e2                	ld	ra,56(sp)
    80002268:	7442                	ld	s0,48(sp)
    8000226a:	6121                	addi	sp,sp,64
    8000226c:	8082                	ret

000000008000226e <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    8000226e:	7139                	addi	sp,sp,-64
    80002270:	fc06                	sd	ra,56(sp)
    80002272:	f822                	sd	s0,48(sp)
    80002274:	0080                	addi	s0,sp,64
    80002276:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    8000227a:	fe042623          	sw	zero,-20(s0)
    8000227e:	a88d                	j	800022f0 <freewalk+0x82>
    pte_t pte = pagetable[i];
    80002280:	fec42783          	lw	a5,-20(s0)
    80002284:	078e                	slli	a5,a5,0x3
    80002286:	fc843703          	ld	a4,-56(s0)
    8000228a:	97ba                	add	a5,a5,a4
    8000228c:	639c                	ld	a5,0(a5)
    8000228e:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002292:	fe043783          	ld	a5,-32(s0)
    80002296:	8b85                	andi	a5,a5,1
    80002298:	cb9d                	beqz	a5,800022ce <freewalk+0x60>
    8000229a:	fe043783          	ld	a5,-32(s0)
    8000229e:	8bb9                	andi	a5,a5,14
    800022a0:	e79d                	bnez	a5,800022ce <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800022a2:	fe043783          	ld	a5,-32(s0)
    800022a6:	83a9                	srli	a5,a5,0xa
    800022a8:	07b2                	slli	a5,a5,0xc
    800022aa:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    800022ae:	fd843783          	ld	a5,-40(s0)
    800022b2:	853e                	mv	a0,a5
    800022b4:	00000097          	auipc	ra,0x0
    800022b8:	fba080e7          	jalr	-70(ra) # 8000226e <freewalk>
      pagetable[i] = 0;
    800022bc:	fec42783          	lw	a5,-20(s0)
    800022c0:	078e                	slli	a5,a5,0x3
    800022c2:	fc843703          	ld	a4,-56(s0)
    800022c6:	97ba                	add	a5,a5,a4
    800022c8:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ff98e18>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800022cc:	a829                	j	800022e6 <freewalk+0x78>
    } else if(pte & PTE_V){
    800022ce:	fe043783          	ld	a5,-32(s0)
    800022d2:	8b85                	andi	a5,a5,1
    800022d4:	cb89                	beqz	a5,800022e6 <freewalk+0x78>
      panic("freewalk: leaf");
    800022d6:	0000a517          	auipc	a0,0xa
    800022da:	ec250513          	addi	a0,a0,-318 # 8000c198 <etext+0x198>
    800022de:	fffff097          	auipc	ra,0xfffff
    800022e2:	9ae080e7          	jalr	-1618(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    800022e6:	fec42783          	lw	a5,-20(s0)
    800022ea:	2785                	addiw	a5,a5,1
    800022ec:	fef42623          	sw	a5,-20(s0)
    800022f0:	fec42783          	lw	a5,-20(s0)
    800022f4:	0007871b          	sext.w	a4,a5
    800022f8:	1ff00793          	li	a5,511
    800022fc:	f8e7d2e3          	bge	a5,a4,80002280 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    80002300:	fc843503          	ld	a0,-56(s0)
    80002304:	fffff097          	auipc	ra,0xfffff
    80002308:	e2c080e7          	jalr	-468(ra) # 80001130 <kfree>
}
    8000230c:	0001                	nop
    8000230e:	70e2                	ld	ra,56(sp)
    80002310:	7442                	ld	s0,48(sp)
    80002312:	6121                	addi	sp,sp,64
    80002314:	8082                	ret

0000000080002316 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    80002316:	1101                	addi	sp,sp,-32
    80002318:	ec06                	sd	ra,24(sp)
    8000231a:	e822                	sd	s0,16(sp)
    8000231c:	1000                	addi	s0,sp,32
    8000231e:	fea43423          	sd	a0,-24(s0)
    80002322:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    80002326:	fe043783          	ld	a5,-32(s0)
    8000232a:	c385                	beqz	a5,8000234a <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    8000232c:	fe043703          	ld	a4,-32(s0)
    80002330:	6785                	lui	a5,0x1
    80002332:	17fd                	addi	a5,a5,-1
    80002334:	97ba                	add	a5,a5,a4
    80002336:	83b1                	srli	a5,a5,0xc
    80002338:	4685                	li	a3,1
    8000233a:	863e                	mv	a2,a5
    8000233c:	4581                	li	a1,0
    8000233e:	fe843503          	ld	a0,-24(s0)
    80002342:	00000097          	auipc	ra,0x0
    80002346:	b74080e7          	jalr	-1164(ra) # 80001eb6 <uvmunmap>
  freewalk(pagetable);
    8000234a:	fe843503          	ld	a0,-24(s0)
    8000234e:	00000097          	auipc	ra,0x0
    80002352:	f20080e7          	jalr	-224(ra) # 8000226e <freewalk>
}
    80002356:	0001                	nop
    80002358:	60e2                	ld	ra,24(sp)
    8000235a:	6442                	ld	s0,16(sp)
    8000235c:	6105                	addi	sp,sp,32
    8000235e:	8082                	ret

0000000080002360 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    80002360:	711d                	addi	sp,sp,-96
    80002362:	ec86                	sd	ra,88(sp)
    80002364:	e8a2                	sd	s0,80(sp)
    80002366:	1080                	addi	s0,sp,96
    80002368:	faa43c23          	sd	a0,-72(s0)
    8000236c:	fab43823          	sd	a1,-80(s0)
    80002370:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002374:	fe043423          	sd	zero,-24(s0)
    80002378:	a0d9                	j	8000243e <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    8000237a:	4601                	li	a2,0
    8000237c:	fe843583          	ld	a1,-24(s0)
    80002380:	fb843503          	ld	a0,-72(s0)
    80002384:	00000097          	auipc	ra,0x0
    80002388:	834080e7          	jalr	-1996(ra) # 80001bb8 <walk>
    8000238c:	fea43023          	sd	a0,-32(s0)
    80002390:	fe043783          	ld	a5,-32(s0)
    80002394:	eb89                	bnez	a5,800023a6 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002396:	0000a517          	auipc	a0,0xa
    8000239a:	e1250513          	addi	a0,a0,-494 # 8000c1a8 <etext+0x1a8>
    8000239e:	fffff097          	auipc	ra,0xfffff
    800023a2:	8ee080e7          	jalr	-1810(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    800023a6:	fe043783          	ld	a5,-32(s0)
    800023aa:	639c                	ld	a5,0(a5)
    800023ac:	8b85                	andi	a5,a5,1
    800023ae:	eb89                	bnez	a5,800023c0 <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    800023b0:	0000a517          	auipc	a0,0xa
    800023b4:	e1850513          	addi	a0,a0,-488 # 8000c1c8 <etext+0x1c8>
    800023b8:	fffff097          	auipc	ra,0xfffff
    800023bc:	8d4080e7          	jalr	-1836(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    800023c0:	fe043783          	ld	a5,-32(s0)
    800023c4:	639c                	ld	a5,0(a5)
    800023c6:	83a9                	srli	a5,a5,0xa
    800023c8:	07b2                	slli	a5,a5,0xc
    800023ca:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    800023ce:	fe043783          	ld	a5,-32(s0)
    800023d2:	639c                	ld	a5,0(a5)
    800023d4:	2781                	sext.w	a5,a5
    800023d6:	3ff7f793          	andi	a5,a5,1023
    800023da:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    800023de:	fffff097          	auipc	ra,0xfffff
    800023e2:	df8080e7          	jalr	-520(ra) # 800011d6 <kalloc>
    800023e6:	fca43423          	sd	a0,-56(s0)
    800023ea:	fc843783          	ld	a5,-56(s0)
    800023ee:	c3a5                	beqz	a5,8000244e <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    800023f0:	fd843783          	ld	a5,-40(s0)
    800023f4:	6605                	lui	a2,0x1
    800023f6:	85be                	mv	a1,a5
    800023f8:	fc843503          	ld	a0,-56(s0)
    800023fc:	fffff097          	auipc	ra,0xfffff
    80002400:	1f8080e7          	jalr	504(ra) # 800015f4 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002404:	fc843783          	ld	a5,-56(s0)
    80002408:	fd442703          	lw	a4,-44(s0)
    8000240c:	86be                	mv	a3,a5
    8000240e:	6605                	lui	a2,0x1
    80002410:	fe843583          	ld	a1,-24(s0)
    80002414:	fb043503          	ld	a0,-80(s0)
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	9a2080e7          	jalr	-1630(ra) # 80001dba <mappages>
    80002420:	87aa                	mv	a5,a0
    80002422:	cb81                	beqz	a5,80002432 <uvmcopy+0xd2>
      kfree(mem);
    80002424:	fc843503          	ld	a0,-56(s0)
    80002428:	fffff097          	auipc	ra,0xfffff
    8000242c:	d08080e7          	jalr	-760(ra) # 80001130 <kfree>
      goto err;
    80002430:	a005                	j	80002450 <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    80002432:	fe843703          	ld	a4,-24(s0)
    80002436:	6785                	lui	a5,0x1
    80002438:	97ba                	add	a5,a5,a4
    8000243a:	fef43423          	sd	a5,-24(s0)
    8000243e:	fe843703          	ld	a4,-24(s0)
    80002442:	fa843783          	ld	a5,-88(s0)
    80002446:	f2f76ae3          	bltu	a4,a5,8000237a <uvmcopy+0x1a>
    }
  }
  return 0;
    8000244a:	4781                	li	a5,0
    8000244c:	a839                	j	8000246a <uvmcopy+0x10a>
      goto err;
    8000244e:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    80002450:	fe843783          	ld	a5,-24(s0)
    80002454:	83b1                	srli	a5,a5,0xc
    80002456:	4685                	li	a3,1
    80002458:	863e                	mv	a2,a5
    8000245a:	4581                	li	a1,0
    8000245c:	fb043503          	ld	a0,-80(s0)
    80002460:	00000097          	auipc	ra,0x0
    80002464:	a56080e7          	jalr	-1450(ra) # 80001eb6 <uvmunmap>
  return -1;
    80002468:	57fd                	li	a5,-1
}
    8000246a:	853e                	mv	a0,a5
    8000246c:	60e6                	ld	ra,88(sp)
    8000246e:	6446                	ld	s0,80(sp)
    80002470:	6125                	addi	sp,sp,96
    80002472:	8082                	ret

0000000080002474 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002474:	7179                	addi	sp,sp,-48
    80002476:	f406                	sd	ra,40(sp)
    80002478:	f022                	sd	s0,32(sp)
    8000247a:	1800                	addi	s0,sp,48
    8000247c:	fca43c23          	sd	a0,-40(s0)
    80002480:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    80002484:	4601                	li	a2,0
    80002486:	fd043583          	ld	a1,-48(s0)
    8000248a:	fd843503          	ld	a0,-40(s0)
    8000248e:	fffff097          	auipc	ra,0xfffff
    80002492:	72a080e7          	jalr	1834(ra) # 80001bb8 <walk>
    80002496:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    8000249a:	fe843783          	ld	a5,-24(s0)
    8000249e:	eb89                	bnez	a5,800024b0 <uvmclear+0x3c>
    panic("uvmclear");
    800024a0:	0000a517          	auipc	a0,0xa
    800024a4:	d4850513          	addi	a0,a0,-696 # 8000c1e8 <etext+0x1e8>
    800024a8:	ffffe097          	auipc	ra,0xffffe
    800024ac:	7e4080e7          	jalr	2020(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    800024b0:	fe843783          	ld	a5,-24(s0)
    800024b4:	639c                	ld	a5,0(a5)
    800024b6:	fef7f713          	andi	a4,a5,-17
    800024ba:	fe843783          	ld	a5,-24(s0)
    800024be:	e398                	sd	a4,0(a5)
  unreglrupage(va, pagetable);
    800024c0:	fd843583          	ld	a1,-40(s0)
    800024c4:	fd043503          	ld	a0,-48(s0)
    800024c8:	00008097          	auipc	ra,0x8
    800024cc:	faa080e7          	jalr	-86(ra) # 8000a472 <unreglrupage>
}
    800024d0:	0001                	nop
    800024d2:	70a2                	ld	ra,40(sp)
    800024d4:	7402                	ld	s0,32(sp)
    800024d6:	6145                	addi	sp,sp,48
    800024d8:	8082                	ret

00000000800024da <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    800024da:	715d                	addi	sp,sp,-80
    800024dc:	e486                	sd	ra,72(sp)
    800024de:	e0a2                	sd	s0,64(sp)
    800024e0:	0880                	addi	s0,sp,80
    800024e2:	fca43423          	sd	a0,-56(s0)
    800024e6:	fcb43023          	sd	a1,-64(s0)
    800024ea:	fac43c23          	sd	a2,-72(s0)
    800024ee:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800024f2:	a055                	j	80002596 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    800024f4:	fc043703          	ld	a4,-64(s0)
    800024f8:	77fd                	lui	a5,0xfffff
    800024fa:	8ff9                	and	a5,a5,a4
    800024fc:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002500:	fe043583          	ld	a1,-32(s0)
    80002504:	fc843503          	ld	a0,-56(s0)
    80002508:	fffff097          	auipc	ra,0xfffff
    8000250c:	7d4080e7          	jalr	2004(ra) # 80001cdc <walkaddr>
    80002510:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002514:	fd843783          	ld	a5,-40(s0)
    80002518:	e399                	bnez	a5,8000251e <copyout+0x44>
      return -1;
    8000251a:	57fd                	li	a5,-1
    8000251c:	a049                	j	8000259e <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    8000251e:	fe043703          	ld	a4,-32(s0)
    80002522:	fc043783          	ld	a5,-64(s0)
    80002526:	8f1d                	sub	a4,a4,a5
    80002528:	6785                	lui	a5,0x1
    8000252a:	97ba                	add	a5,a5,a4
    8000252c:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002530:	fe843703          	ld	a4,-24(s0)
    80002534:	fb043783          	ld	a5,-80(s0)
    80002538:	00e7f663          	bgeu	a5,a4,80002544 <copyout+0x6a>
      n = len;
    8000253c:	fb043783          	ld	a5,-80(s0)
    80002540:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002544:	fc043703          	ld	a4,-64(s0)
    80002548:	fe043783          	ld	a5,-32(s0)
    8000254c:	8f1d                	sub	a4,a4,a5
    8000254e:	fd843783          	ld	a5,-40(s0)
    80002552:	97ba                	add	a5,a5,a4
    80002554:	873e                	mv	a4,a5
    80002556:	fe843783          	ld	a5,-24(s0)
    8000255a:	2781                	sext.w	a5,a5
    8000255c:	863e                	mv	a2,a5
    8000255e:	fb843583          	ld	a1,-72(s0)
    80002562:	853a                	mv	a0,a4
    80002564:	fffff097          	auipc	ra,0xfffff
    80002568:	090080e7          	jalr	144(ra) # 800015f4 <memmove>

    len -= n;
    8000256c:	fb043703          	ld	a4,-80(s0)
    80002570:	fe843783          	ld	a5,-24(s0)
    80002574:	40f707b3          	sub	a5,a4,a5
    80002578:	faf43823          	sd	a5,-80(s0)
    src += n;
    8000257c:	fb843703          	ld	a4,-72(s0)
    80002580:	fe843783          	ld	a5,-24(s0)
    80002584:	97ba                	add	a5,a5,a4
    80002586:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    8000258a:	fe043703          	ld	a4,-32(s0)
    8000258e:	6785                	lui	a5,0x1
    80002590:	97ba                	add	a5,a5,a4
    80002592:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    80002596:	fb043783          	ld	a5,-80(s0)
    8000259a:	ffa9                	bnez	a5,800024f4 <copyout+0x1a>
  }
  return 0;
    8000259c:	4781                	li	a5,0
}
    8000259e:	853e                	mv	a0,a5
    800025a0:	60a6                	ld	ra,72(sp)
    800025a2:	6406                	ld	s0,64(sp)
    800025a4:	6161                	addi	sp,sp,80
    800025a6:	8082                	ret

00000000800025a8 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800025a8:	715d                	addi	sp,sp,-80
    800025aa:	e486                	sd	ra,72(sp)
    800025ac:	e0a2                	sd	s0,64(sp)
    800025ae:	0880                	addi	s0,sp,80
    800025b0:	fca43423          	sd	a0,-56(s0)
    800025b4:	fcb43023          	sd	a1,-64(s0)
    800025b8:	fac43c23          	sd	a2,-72(s0)
    800025bc:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    800025c0:	a055                	j	80002664 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    800025c2:	fb843703          	ld	a4,-72(s0)
    800025c6:	77fd                	lui	a5,0xfffff
    800025c8:	8ff9                	and	a5,a5,a4
    800025ca:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    800025ce:	fe043583          	ld	a1,-32(s0)
    800025d2:	fc843503          	ld	a0,-56(s0)
    800025d6:	fffff097          	auipc	ra,0xfffff
    800025da:	706080e7          	jalr	1798(ra) # 80001cdc <walkaddr>
    800025de:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    800025e2:	fd843783          	ld	a5,-40(s0)
    800025e6:	e399                	bnez	a5,800025ec <copyin+0x44>
      return -1;
    800025e8:	57fd                	li	a5,-1
    800025ea:	a049                	j	8000266c <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    800025ec:	fe043703          	ld	a4,-32(s0)
    800025f0:	fb843783          	ld	a5,-72(s0)
    800025f4:	8f1d                	sub	a4,a4,a5
    800025f6:	6785                	lui	a5,0x1
    800025f8:	97ba                	add	a5,a5,a4
    800025fa:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800025fe:	fe843703          	ld	a4,-24(s0)
    80002602:	fb043783          	ld	a5,-80(s0)
    80002606:	00e7f663          	bgeu	a5,a4,80002612 <copyin+0x6a>
      n = len;
    8000260a:	fb043783          	ld	a5,-80(s0)
    8000260e:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80002612:	fb843703          	ld	a4,-72(s0)
    80002616:	fe043783          	ld	a5,-32(s0)
    8000261a:	8f1d                	sub	a4,a4,a5
    8000261c:	fd843783          	ld	a5,-40(s0)
    80002620:	97ba                	add	a5,a5,a4
    80002622:	873e                	mv	a4,a5
    80002624:	fe843783          	ld	a5,-24(s0)
    80002628:	2781                	sext.w	a5,a5
    8000262a:	863e                	mv	a2,a5
    8000262c:	85ba                	mv	a1,a4
    8000262e:	fc043503          	ld	a0,-64(s0)
    80002632:	fffff097          	auipc	ra,0xfffff
    80002636:	fc2080e7          	jalr	-62(ra) # 800015f4 <memmove>

    len -= n;
    8000263a:	fb043703          	ld	a4,-80(s0)
    8000263e:	fe843783          	ld	a5,-24(s0)
    80002642:	40f707b3          	sub	a5,a4,a5
    80002646:	faf43823          	sd	a5,-80(s0)
    dst += n;
    8000264a:	fc043703          	ld	a4,-64(s0)
    8000264e:	fe843783          	ld	a5,-24(s0)
    80002652:	97ba                	add	a5,a5,a4
    80002654:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    80002658:	fe043703          	ld	a4,-32(s0)
    8000265c:	6785                	lui	a5,0x1
    8000265e:	97ba                	add	a5,a5,a4
    80002660:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    80002664:	fb043783          	ld	a5,-80(s0)
    80002668:	ffa9                	bnez	a5,800025c2 <copyin+0x1a>
  }
  return 0;
    8000266a:	4781                	li	a5,0
}
    8000266c:	853e                	mv	a0,a5
    8000266e:	60a6                	ld	ra,72(sp)
    80002670:	6406                	ld	s0,64(sp)
    80002672:	6161                	addi	sp,sp,80
    80002674:	8082                	ret

0000000080002676 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002676:	711d                	addi	sp,sp,-96
    80002678:	ec86                	sd	ra,88(sp)
    8000267a:	e8a2                	sd	s0,80(sp)
    8000267c:	1080                	addi	s0,sp,96
    8000267e:	faa43c23          	sd	a0,-72(s0)
    80002682:	fab43823          	sd	a1,-80(s0)
    80002686:	fac43423          	sd	a2,-88(s0)
    8000268a:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    8000268e:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    80002692:	a0f1                	j	8000275e <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    80002694:	fa843703          	ld	a4,-88(s0)
    80002698:	77fd                	lui	a5,0xfffff
    8000269a:	8ff9                	and	a5,a5,a4
    8000269c:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800026a0:	fd043583          	ld	a1,-48(s0)
    800026a4:	fb843503          	ld	a0,-72(s0)
    800026a8:	fffff097          	auipc	ra,0xfffff
    800026ac:	634080e7          	jalr	1588(ra) # 80001cdc <walkaddr>
    800026b0:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    800026b4:	fc843783          	ld	a5,-56(s0)
    800026b8:	e399                	bnez	a5,800026be <copyinstr+0x48>
      return -1;
    800026ba:	57fd                	li	a5,-1
    800026bc:	a87d                	j	8000277a <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    800026be:	fd043703          	ld	a4,-48(s0)
    800026c2:	fa843783          	ld	a5,-88(s0)
    800026c6:	8f1d                	sub	a4,a4,a5
    800026c8:	6785                	lui	a5,0x1
    800026ca:	97ba                	add	a5,a5,a4
    800026cc:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    800026d0:	fe843703          	ld	a4,-24(s0)
    800026d4:	fa043783          	ld	a5,-96(s0)
    800026d8:	00e7f663          	bgeu	a5,a4,800026e4 <copyinstr+0x6e>
      n = max;
    800026dc:	fa043783          	ld	a5,-96(s0)
    800026e0:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    800026e4:	fa843703          	ld	a4,-88(s0)
    800026e8:	fd043783          	ld	a5,-48(s0)
    800026ec:	8f1d                	sub	a4,a4,a5
    800026ee:	fc843783          	ld	a5,-56(s0)
    800026f2:	97ba                	add	a5,a5,a4
    800026f4:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    800026f8:	a891                	j	8000274c <copyinstr+0xd6>
      if(*p == '\0'){
    800026fa:	fd843783          	ld	a5,-40(s0)
    800026fe:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    80002702:	eb89                	bnez	a5,80002714 <copyinstr+0x9e>
        *dst = '\0';
    80002704:	fb043783          	ld	a5,-80(s0)
    80002708:	00078023          	sb	zero,0(a5)
        got_null = 1;
    8000270c:	4785                	li	a5,1
    8000270e:	fef42223          	sw	a5,-28(s0)
        break;
    80002712:	a081                	j	80002752 <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002714:	fd843783          	ld	a5,-40(s0)
    80002718:	0007c703          	lbu	a4,0(a5)
    8000271c:	fb043783          	ld	a5,-80(s0)
    80002720:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002724:	fe843783          	ld	a5,-24(s0)
    80002728:	17fd                	addi	a5,a5,-1
    8000272a:	fef43423          	sd	a5,-24(s0)
      --max;
    8000272e:	fa043783          	ld	a5,-96(s0)
    80002732:	17fd                	addi	a5,a5,-1
    80002734:	faf43023          	sd	a5,-96(s0)
      p++;
    80002738:	fd843783          	ld	a5,-40(s0)
    8000273c:	0785                	addi	a5,a5,1
    8000273e:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    80002742:	fb043783          	ld	a5,-80(s0)
    80002746:	0785                	addi	a5,a5,1
    80002748:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    8000274c:	fe843783          	ld	a5,-24(s0)
    80002750:	f7cd                	bnez	a5,800026fa <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    80002752:	fd043703          	ld	a4,-48(s0)
    80002756:	6785                	lui	a5,0x1
    80002758:	97ba                	add	a5,a5,a4
    8000275a:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    8000275e:	fe442783          	lw	a5,-28(s0)
    80002762:	2781                	sext.w	a5,a5
    80002764:	e781                	bnez	a5,8000276c <copyinstr+0xf6>
    80002766:	fa043783          	ld	a5,-96(s0)
    8000276a:	f78d                	bnez	a5,80002694 <copyinstr+0x1e>
  }
  if(got_null){
    8000276c:	fe442783          	lw	a5,-28(s0)
    80002770:	2781                	sext.w	a5,a5
    80002772:	c399                	beqz	a5,80002778 <copyinstr+0x102>
    return 0;
    80002774:	4781                	li	a5,0
    80002776:	a011                	j	8000277a <copyinstr+0x104>
  } else {
    return -1;
    80002778:	57fd                	li	a5,-1
  }
}
    8000277a:	853e                	mv	a0,a5
    8000277c:	60e6                	ld	ra,88(sp)
    8000277e:	6446                	ld	s0,80(sp)
    80002780:	6125                	addi	sp,sp,96
    80002782:	8082                	ret

0000000080002784 <r_sstatus>:
{
    80002784:	1101                	addi	sp,sp,-32
    80002786:	ec22                	sd	s0,24(sp)
    80002788:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    8000278a:	100027f3          	csrr	a5,sstatus
    8000278e:	fef43423          	sd	a5,-24(s0)
  return x;
    80002792:	fe843783          	ld	a5,-24(s0)
}
    80002796:	853e                	mv	a0,a5
    80002798:	6462                	ld	s0,24(sp)
    8000279a:	6105                	addi	sp,sp,32
    8000279c:	8082                	ret

000000008000279e <w_sstatus>:
{
    8000279e:	1101                	addi	sp,sp,-32
    800027a0:	ec22                	sd	s0,24(sp)
    800027a2:	1000                	addi	s0,sp,32
    800027a4:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800027a8:	fe843783          	ld	a5,-24(s0)
    800027ac:	10079073          	csrw	sstatus,a5
}
    800027b0:	0001                	nop
    800027b2:	6462                	ld	s0,24(sp)
    800027b4:	6105                	addi	sp,sp,32
    800027b6:	8082                	ret

00000000800027b8 <intr_on>:
{
    800027b8:	1141                	addi	sp,sp,-16
    800027ba:	e406                	sd	ra,8(sp)
    800027bc:	e022                	sd	s0,0(sp)
    800027be:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    800027c0:	00000097          	auipc	ra,0x0
    800027c4:	fc4080e7          	jalr	-60(ra) # 80002784 <r_sstatus>
    800027c8:	87aa                	mv	a5,a0
    800027ca:	0027e793          	ori	a5,a5,2
    800027ce:	853e                	mv	a0,a5
    800027d0:	00000097          	auipc	ra,0x0
    800027d4:	fce080e7          	jalr	-50(ra) # 8000279e <w_sstatus>
}
    800027d8:	0001                	nop
    800027da:	60a2                	ld	ra,8(sp)
    800027dc:	6402                	ld	s0,0(sp)
    800027de:	0141                	addi	sp,sp,16
    800027e0:	8082                	ret

00000000800027e2 <intr_get>:
{
    800027e2:	1101                	addi	sp,sp,-32
    800027e4:	ec06                	sd	ra,24(sp)
    800027e6:	e822                	sd	s0,16(sp)
    800027e8:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    800027ea:	00000097          	auipc	ra,0x0
    800027ee:	f9a080e7          	jalr	-102(ra) # 80002784 <r_sstatus>
    800027f2:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    800027f6:	fe843783          	ld	a5,-24(s0)
    800027fa:	8b89                	andi	a5,a5,2
    800027fc:	00f037b3          	snez	a5,a5
    80002800:	0ff7f793          	andi	a5,a5,255
    80002804:	2781                	sext.w	a5,a5
}
    80002806:	853e                	mv	a0,a5
    80002808:	60e2                	ld	ra,24(sp)
    8000280a:	6442                	ld	s0,16(sp)
    8000280c:	6105                	addi	sp,sp,32
    8000280e:	8082                	ret

0000000080002810 <r_tp>:
{
    80002810:	1101                	addi	sp,sp,-32
    80002812:	ec22                	sd	s0,24(sp)
    80002814:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002816:	8792                	mv	a5,tp
    80002818:	fef43423          	sd	a5,-24(s0)
  return x;
    8000281c:	fe843783          	ld	a5,-24(s0)
}
    80002820:	853e                	mv	a0,a5
    80002822:	6462                	ld	s0,24(sp)
    80002824:	6105                	addi	sp,sp,32
    80002826:	8082                	ret

0000000080002828 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    80002828:	7139                	addi	sp,sp,-64
    8000282a:	fc06                	sd	ra,56(sp)
    8000282c:	f822                	sd	s0,48(sp)
    8000282e:	0080                	addi	s0,sp,64
    80002830:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002834:	00013797          	auipc	a5,0x13
    80002838:	82478793          	addi	a5,a5,-2012 # 80015058 <proc>
    8000283c:	fef43423          	sd	a5,-24(s0)
    80002840:	a061                	j	800028c8 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    80002842:	fffff097          	auipc	ra,0xfffff
    80002846:	994080e7          	jalr	-1644(ra) # 800011d6 <kalloc>
    8000284a:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    8000284e:	fe043783          	ld	a5,-32(s0)
    80002852:	eb89                	bnez	a5,80002864 <proc_mapstacks+0x3c>
      panic("kalloc");
    80002854:	0000a517          	auipc	a0,0xa
    80002858:	9a450513          	addi	a0,a0,-1628 # 8000c1f8 <etext+0x1f8>
    8000285c:	ffffe097          	auipc	ra,0xffffe
    80002860:	430080e7          	jalr	1072(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    80002864:	fe843703          	ld	a4,-24(s0)
    80002868:	00012797          	auipc	a5,0x12
    8000286c:	7f078793          	addi	a5,a5,2032 # 80015058 <proc>
    80002870:	40f707b3          	sub	a5,a4,a5
    80002874:	4037d713          	srai	a4,a5,0x3
    80002878:	0000a797          	auipc	a5,0xa
    8000287c:	a7878793          	addi	a5,a5,-1416 # 8000c2f0 <etext+0x2f0>
    80002880:	639c                	ld	a5,0(a5)
    80002882:	02f707b3          	mul	a5,a4,a5
    80002886:	2781                	sext.w	a5,a5
    80002888:	2785                	addiw	a5,a5,1
    8000288a:	2781                	sext.w	a5,a5
    8000288c:	00d7979b          	slliw	a5,a5,0xd
    80002890:	2781                	sext.w	a5,a5
    80002892:	873e                	mv	a4,a5
    80002894:	040007b7          	lui	a5,0x4000
    80002898:	17fd                	addi	a5,a5,-1
    8000289a:	07b2                	slli	a5,a5,0xc
    8000289c:	8f99                	sub	a5,a5,a4
    8000289e:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800028a2:	fe043783          	ld	a5,-32(s0)
    800028a6:	4719                	li	a4,6
    800028a8:	6685                	lui	a3,0x1
    800028aa:	863e                	mv	a2,a5
    800028ac:	fd843583          	ld	a1,-40(s0)
    800028b0:	fc843503          	ld	a0,-56(s0)
    800028b4:	fffff097          	auipc	ra,0xfffff
    800028b8:	4ac080e7          	jalr	1196(ra) # 80001d60 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    800028bc:	fe843783          	ld	a5,-24(s0)
    800028c0:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    800028c4:	fef43423          	sd	a5,-24(s0)
    800028c8:	fe843703          	ld	a4,-24(s0)
    800028cc:	00018797          	auipc	a5,0x18
    800028d0:	18c78793          	addi	a5,a5,396 # 8001aa58 <pid_lock>
    800028d4:	f6f767e3          	bltu	a4,a5,80002842 <proc_mapstacks+0x1a>
  }
}
    800028d8:	0001                	nop
    800028da:	0001                	nop
    800028dc:	70e2                	ld	ra,56(sp)
    800028de:	7442                	ld	s0,48(sp)
    800028e0:	6121                	addi	sp,sp,64
    800028e2:	8082                	ret

00000000800028e4 <procinit>:

// initialize the proc table.
void
procinit(void)
{
    800028e4:	1101                	addi	sp,sp,-32
    800028e6:	ec06                	sd	ra,24(sp)
    800028e8:	e822                	sd	s0,16(sp)
    800028ea:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    800028ec:	0000a597          	auipc	a1,0xa
    800028f0:	91458593          	addi	a1,a1,-1772 # 8000c200 <etext+0x200>
    800028f4:	00018517          	auipc	a0,0x18
    800028f8:	16450513          	addi	a0,a0,356 # 8001aa58 <pid_lock>
    800028fc:	fffff097          	auipc	ra,0xfffff
    80002900:	a10080e7          	jalr	-1520(ra) # 8000130c <initlock>
  initlock(&wait_lock, "wait_lock");
    80002904:	0000a597          	auipc	a1,0xa
    80002908:	90458593          	addi	a1,a1,-1788 # 8000c208 <etext+0x208>
    8000290c:	00018517          	auipc	a0,0x18
    80002910:	16450513          	addi	a0,a0,356 # 8001aa70 <wait_lock>
    80002914:	fffff097          	auipc	ra,0xfffff
    80002918:	9f8080e7          	jalr	-1544(ra) # 8000130c <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    8000291c:	00012797          	auipc	a5,0x12
    80002920:	73c78793          	addi	a5,a5,1852 # 80015058 <proc>
    80002924:	fef43423          	sd	a5,-24(s0)
    80002928:	a0bd                	j	80002996 <procinit+0xb2>
      initlock(&p->lock, "proc");
    8000292a:	fe843783          	ld	a5,-24(s0)
    8000292e:	0000a597          	auipc	a1,0xa
    80002932:	8ea58593          	addi	a1,a1,-1814 # 8000c218 <etext+0x218>
    80002936:	853e                	mv	a0,a5
    80002938:	fffff097          	auipc	ra,0xfffff
    8000293c:	9d4080e7          	jalr	-1580(ra) # 8000130c <initlock>
      p->state = UNUSED;
    80002940:	fe843783          	ld	a5,-24(s0)
    80002944:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    80002948:	fe843703          	ld	a4,-24(s0)
    8000294c:	00012797          	auipc	a5,0x12
    80002950:	70c78793          	addi	a5,a5,1804 # 80015058 <proc>
    80002954:	40f707b3          	sub	a5,a4,a5
    80002958:	4037d713          	srai	a4,a5,0x3
    8000295c:	0000a797          	auipc	a5,0xa
    80002960:	99478793          	addi	a5,a5,-1644 # 8000c2f0 <etext+0x2f0>
    80002964:	639c                	ld	a5,0(a5)
    80002966:	02f707b3          	mul	a5,a4,a5
    8000296a:	2781                	sext.w	a5,a5
    8000296c:	2785                	addiw	a5,a5,1
    8000296e:	2781                	sext.w	a5,a5
    80002970:	00d7979b          	slliw	a5,a5,0xd
    80002974:	2781                	sext.w	a5,a5
    80002976:	873e                	mv	a4,a5
    80002978:	040007b7          	lui	a5,0x4000
    8000297c:	17fd                	addi	a5,a5,-1
    8000297e:	07b2                	slli	a5,a5,0xc
    80002980:	8f99                	sub	a5,a5,a4
    80002982:	873e                	mv	a4,a5
    80002984:	fe843783          	ld	a5,-24(s0)
    80002988:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    8000298a:	fe843783          	ld	a5,-24(s0)
    8000298e:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002992:	fef43423          	sd	a5,-24(s0)
    80002996:	fe843703          	ld	a4,-24(s0)
    8000299a:	00018797          	auipc	a5,0x18
    8000299e:	0be78793          	addi	a5,a5,190 # 8001aa58 <pid_lock>
    800029a2:	f8f764e3          	bltu	a4,a5,8000292a <procinit+0x46>
  }
}
    800029a6:	0001                	nop
    800029a8:	0001                	nop
    800029aa:	60e2                	ld	ra,24(sp)
    800029ac:	6442                	ld	s0,16(sp)
    800029ae:	6105                	addi	sp,sp,32
    800029b0:	8082                	ret

00000000800029b2 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    800029b2:	1101                	addi	sp,sp,-32
    800029b4:	ec06                	sd	ra,24(sp)
    800029b6:	e822                	sd	s0,16(sp)
    800029b8:	1000                	addi	s0,sp,32
  int id = r_tp();
    800029ba:	00000097          	auipc	ra,0x0
    800029be:	e56080e7          	jalr	-426(ra) # 80002810 <r_tp>
    800029c2:	87aa                	mv	a5,a0
    800029c4:	fef42623          	sw	a5,-20(s0)
  return id;
    800029c8:	fec42783          	lw	a5,-20(s0)
}
    800029cc:	853e                	mv	a0,a5
    800029ce:	60e2                	ld	ra,24(sp)
    800029d0:	6442                	ld	s0,16(sp)
    800029d2:	6105                	addi	sp,sp,32
    800029d4:	8082                	ret

00000000800029d6 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    800029d6:	1101                	addi	sp,sp,-32
    800029d8:	ec06                	sd	ra,24(sp)
    800029da:	e822                	sd	s0,16(sp)
    800029dc:	1000                	addi	s0,sp,32
  int id = cpuid();
    800029de:	00000097          	auipc	ra,0x0
    800029e2:	fd4080e7          	jalr	-44(ra) # 800029b2 <cpuid>
    800029e6:	87aa                	mv	a5,a0
    800029e8:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    800029ec:	fec42783          	lw	a5,-20(s0)
    800029f0:	00779713          	slli	a4,a5,0x7
    800029f4:	00012797          	auipc	a5,0x12
    800029f8:	26478793          	addi	a5,a5,612 # 80014c58 <cpus>
    800029fc:	97ba                	add	a5,a5,a4
    800029fe:	fef43023          	sd	a5,-32(s0)
  return c;
    80002a02:	fe043783          	ld	a5,-32(s0)
}
    80002a06:	853e                	mv	a0,a5
    80002a08:	60e2                	ld	ra,24(sp)
    80002a0a:	6442                	ld	s0,16(sp)
    80002a0c:	6105                	addi	sp,sp,32
    80002a0e:	8082                	ret

0000000080002a10 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002a10:	1101                	addi	sp,sp,-32
    80002a12:	ec06                	sd	ra,24(sp)
    80002a14:	e822                	sd	s0,16(sp)
    80002a16:	1000                	addi	s0,sp,32
  push_off();
    80002a18:	fffff097          	auipc	ra,0xfffff
    80002a1c:	a22080e7          	jalr	-1502(ra) # 8000143a <push_off>
  struct cpu *c = mycpu();
    80002a20:	00000097          	auipc	ra,0x0
    80002a24:	fb6080e7          	jalr	-74(ra) # 800029d6 <mycpu>
    80002a28:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002a2c:	fe843783          	ld	a5,-24(s0)
    80002a30:	639c                	ld	a5,0(a5)
    80002a32:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002a36:	fffff097          	auipc	ra,0xfffff
    80002a3a:	a5c080e7          	jalr	-1444(ra) # 80001492 <pop_off>
  return p;
    80002a3e:	fe043783          	ld	a5,-32(s0)
}
    80002a42:	853e                	mv	a0,a5
    80002a44:	60e2                	ld	ra,24(sp)
    80002a46:	6442                	ld	s0,16(sp)
    80002a48:	6105                	addi	sp,sp,32
    80002a4a:	8082                	ret

0000000080002a4c <allocpid>:

int
allocpid()
{
    80002a4c:	1101                	addi	sp,sp,-32
    80002a4e:	ec06                	sd	ra,24(sp)
    80002a50:	e822                	sd	s0,16(sp)
    80002a52:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002a54:	00018517          	auipc	a0,0x18
    80002a58:	00450513          	addi	a0,a0,4 # 8001aa58 <pid_lock>
    80002a5c:	fffff097          	auipc	ra,0xfffff
    80002a60:	8e0080e7          	jalr	-1824(ra) # 8000133c <acquire>
  pid = nextpid;
    80002a64:	0000a797          	auipc	a5,0xa
    80002a68:	dfc78793          	addi	a5,a5,-516 # 8000c860 <nextpid>
    80002a6c:	439c                	lw	a5,0(a5)
    80002a6e:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002a72:	0000a797          	auipc	a5,0xa
    80002a76:	dee78793          	addi	a5,a5,-530 # 8000c860 <nextpid>
    80002a7a:	439c                	lw	a5,0(a5)
    80002a7c:	2785                	addiw	a5,a5,1
    80002a7e:	0007871b          	sext.w	a4,a5
    80002a82:	0000a797          	auipc	a5,0xa
    80002a86:	dde78793          	addi	a5,a5,-546 # 8000c860 <nextpid>
    80002a8a:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002a8c:	00018517          	auipc	a0,0x18
    80002a90:	fcc50513          	addi	a0,a0,-52 # 8001aa58 <pid_lock>
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	90c080e7          	jalr	-1780(ra) # 800013a0 <release>

  return pid;
    80002a9c:	fec42783          	lw	a5,-20(s0)
}
    80002aa0:	853e                	mv	a0,a5
    80002aa2:	60e2                	ld	ra,24(sp)
    80002aa4:	6442                	ld	s0,16(sp)
    80002aa6:	6105                	addi	sp,sp,32
    80002aa8:	8082                	ret

0000000080002aaa <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002aaa:	1101                	addi	sp,sp,-32
    80002aac:	ec06                	sd	ra,24(sp)
    80002aae:	e822                	sd	s0,16(sp)
    80002ab0:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002ab2:	00012797          	auipc	a5,0x12
    80002ab6:	5a678793          	addi	a5,a5,1446 # 80015058 <proc>
    80002aba:	fef43423          	sd	a5,-24(s0)
    80002abe:	a80d                	j	80002af0 <allocproc+0x46>
    acquire(&p->lock);
    80002ac0:	fe843783          	ld	a5,-24(s0)
    80002ac4:	853e                	mv	a0,a5
    80002ac6:	fffff097          	auipc	ra,0xfffff
    80002aca:	876080e7          	jalr	-1930(ra) # 8000133c <acquire>
    if(p->state == UNUSED) {
    80002ace:	fe843783          	ld	a5,-24(s0)
    80002ad2:	4f9c                	lw	a5,24(a5)
    80002ad4:	cb85                	beqz	a5,80002b04 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002ad6:	fe843783          	ld	a5,-24(s0)
    80002ada:	853e                	mv	a0,a5
    80002adc:	fffff097          	auipc	ra,0xfffff
    80002ae0:	8c4080e7          	jalr	-1852(ra) # 800013a0 <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002ae4:	fe843783          	ld	a5,-24(s0)
    80002ae8:	16878793          	addi	a5,a5,360
    80002aec:	fef43423          	sd	a5,-24(s0)
    80002af0:	fe843703          	ld	a4,-24(s0)
    80002af4:	00018797          	auipc	a5,0x18
    80002af8:	f6478793          	addi	a5,a5,-156 # 8001aa58 <pid_lock>
    80002afc:	fcf762e3          	bltu	a4,a5,80002ac0 <allocproc+0x16>
    }
  }
  return 0;
    80002b00:	4781                	li	a5,0
    80002b02:	a0e1                	j	80002bca <allocproc+0x120>
      goto found;
    80002b04:	0001                	nop

found:
  p->pid = allocpid();
    80002b06:	00000097          	auipc	ra,0x0
    80002b0a:	f46080e7          	jalr	-186(ra) # 80002a4c <allocpid>
    80002b0e:	87aa                	mv	a5,a0
    80002b10:	873e                	mv	a4,a5
    80002b12:	fe843783          	ld	a5,-24(s0)
    80002b16:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002b18:	fe843783          	ld	a5,-24(s0)
    80002b1c:	4705                	li	a4,1
    80002b1e:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002b20:	ffffe097          	auipc	ra,0xffffe
    80002b24:	6b6080e7          	jalr	1718(ra) # 800011d6 <kalloc>
    80002b28:	872a                	mv	a4,a0
    80002b2a:	fe843783          	ld	a5,-24(s0)
    80002b2e:	efb8                	sd	a4,88(a5)
    80002b30:	fe843783          	ld	a5,-24(s0)
    80002b34:	6fbc                	ld	a5,88(a5)
    80002b36:	e385                	bnez	a5,80002b56 <allocproc+0xac>
    freeproc(p);
    80002b38:	fe843503          	ld	a0,-24(s0)
    80002b3c:	00000097          	auipc	ra,0x0
    80002b40:	098080e7          	jalr	152(ra) # 80002bd4 <freeproc>
    release(&p->lock);
    80002b44:	fe843783          	ld	a5,-24(s0)
    80002b48:	853e                	mv	a0,a5
    80002b4a:	fffff097          	auipc	ra,0xfffff
    80002b4e:	856080e7          	jalr	-1962(ra) # 800013a0 <release>
    return 0;
    80002b52:	4781                	li	a5,0
    80002b54:	a89d                	j	80002bca <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002b56:	fe843503          	ld	a0,-24(s0)
    80002b5a:	00000097          	auipc	ra,0x0
    80002b5e:	118080e7          	jalr	280(ra) # 80002c72 <proc_pagetable>
    80002b62:	872a                	mv	a4,a0
    80002b64:	fe843783          	ld	a5,-24(s0)
    80002b68:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002b6a:	fe843783          	ld	a5,-24(s0)
    80002b6e:	6bbc                	ld	a5,80(a5)
    80002b70:	e385                	bnez	a5,80002b90 <allocproc+0xe6>
    freeproc(p);
    80002b72:	fe843503          	ld	a0,-24(s0)
    80002b76:	00000097          	auipc	ra,0x0
    80002b7a:	05e080e7          	jalr	94(ra) # 80002bd4 <freeproc>
    release(&p->lock);
    80002b7e:	fe843783          	ld	a5,-24(s0)
    80002b82:	853e                	mv	a0,a5
    80002b84:	fffff097          	auipc	ra,0xfffff
    80002b88:	81c080e7          	jalr	-2020(ra) # 800013a0 <release>
    return 0;
    80002b8c:	4781                	li	a5,0
    80002b8e:	a835                	j	80002bca <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002b90:	fe843783          	ld	a5,-24(s0)
    80002b94:	06078793          	addi	a5,a5,96
    80002b98:	07000613          	li	a2,112
    80002b9c:	4581                	li	a1,0
    80002b9e:	853e                	mv	a0,a5
    80002ba0:	fffff097          	auipc	ra,0xfffff
    80002ba4:	970080e7          	jalr	-1680(ra) # 80001510 <memset>
  p->context.ra = (uint64)forkret;
    80002ba8:	00001717          	auipc	a4,0x1
    80002bac:	9da70713          	addi	a4,a4,-1574 # 80003582 <forkret>
    80002bb0:	fe843783          	ld	a5,-24(s0)
    80002bb4:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002bb6:	fe843783          	ld	a5,-24(s0)
    80002bba:	63b8                	ld	a4,64(a5)
    80002bbc:	6785                	lui	a5,0x1
    80002bbe:	973e                	add	a4,a4,a5
    80002bc0:	fe843783          	ld	a5,-24(s0)
    80002bc4:	f7b8                	sd	a4,104(a5)

  return p;
    80002bc6:	fe843783          	ld	a5,-24(s0)
}
    80002bca:	853e                	mv	a0,a5
    80002bcc:	60e2                	ld	ra,24(sp)
    80002bce:	6442                	ld	s0,16(sp)
    80002bd0:	6105                	addi	sp,sp,32
    80002bd2:	8082                	ret

0000000080002bd4 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002bd4:	1101                	addi	sp,sp,-32
    80002bd6:	ec06                	sd	ra,24(sp)
    80002bd8:	e822                	sd	s0,16(sp)
    80002bda:	1000                	addi	s0,sp,32
    80002bdc:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002be0:	fe843783          	ld	a5,-24(s0)
    80002be4:	6fbc                	ld	a5,88(a5)
    80002be6:	cb89                	beqz	a5,80002bf8 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002be8:	fe843783          	ld	a5,-24(s0)
    80002bec:	6fbc                	ld	a5,88(a5)
    80002bee:	853e                	mv	a0,a5
    80002bf0:	ffffe097          	auipc	ra,0xffffe
    80002bf4:	540080e7          	jalr	1344(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80002bf8:	fe843783          	ld	a5,-24(s0)
    80002bfc:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002c00:	fe843783          	ld	a5,-24(s0)
    80002c04:	6bbc                	ld	a5,80(a5)
    80002c06:	cf89                	beqz	a5,80002c20 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002c08:	fe843783          	ld	a5,-24(s0)
    80002c0c:	6bb8                	ld	a4,80(a5)
    80002c0e:	fe843783          	ld	a5,-24(s0)
    80002c12:	67bc                	ld	a5,72(a5)
    80002c14:	85be                	mv	a1,a5
    80002c16:	853a                	mv	a0,a4
    80002c18:	00000097          	auipc	ra,0x0
    80002c1c:	11a080e7          	jalr	282(ra) # 80002d32 <proc_freepagetable>
  p->pagetable = 0;
    80002c20:	fe843783          	ld	a5,-24(s0)
    80002c24:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002c28:	fe843783          	ld	a5,-24(s0)
    80002c2c:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002c30:	fe843783          	ld	a5,-24(s0)
    80002c34:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002c38:	fe843783          	ld	a5,-24(s0)
    80002c3c:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002c40:	fe843783          	ld	a5,-24(s0)
    80002c44:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002c48:	fe843783          	ld	a5,-24(s0)
    80002c4c:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002c50:	fe843783          	ld	a5,-24(s0)
    80002c54:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002c58:	fe843783          	ld	a5,-24(s0)
    80002c5c:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002c60:	fe843783          	ld	a5,-24(s0)
    80002c64:	0007ac23          	sw	zero,24(a5)
}
    80002c68:	0001                	nop
    80002c6a:	60e2                	ld	ra,24(sp)
    80002c6c:	6442                	ld	s0,16(sp)
    80002c6e:	6105                	addi	sp,sp,32
    80002c70:	8082                	ret

0000000080002c72 <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002c72:	7179                	addi	sp,sp,-48
    80002c74:	f406                	sd	ra,40(sp)
    80002c76:	f022                	sd	s0,32(sp)
    80002c78:	1800                	addi	s0,sp,48
    80002c7a:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002c7e:	fffff097          	auipc	ra,0xfffff
    80002c82:	39c080e7          	jalr	924(ra) # 8000201a <uvmcreate>
    80002c86:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002c8a:	fe843783          	ld	a5,-24(s0)
    80002c8e:	e399                	bnez	a5,80002c94 <proc_pagetable+0x22>
    return 0;
    80002c90:	4781                	li	a5,0
    80002c92:	a859                	j	80002d28 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002c94:	00008797          	auipc	a5,0x8
    80002c98:	36c78793          	addi	a5,a5,876 # 8000b000 <_trampoline>
    80002c9c:	4729                	li	a4,10
    80002c9e:	86be                	mv	a3,a5
    80002ca0:	6605                	lui	a2,0x1
    80002ca2:	040007b7          	lui	a5,0x4000
    80002ca6:	17fd                	addi	a5,a5,-1
    80002ca8:	00c79593          	slli	a1,a5,0xc
    80002cac:	fe843503          	ld	a0,-24(s0)
    80002cb0:	fffff097          	auipc	ra,0xfffff
    80002cb4:	10a080e7          	jalr	266(ra) # 80001dba <mappages>
    80002cb8:	87aa                	mv	a5,a0
    80002cba:	0007db63          	bgez	a5,80002cd0 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002cbe:	4581                	li	a1,0
    80002cc0:	fe843503          	ld	a0,-24(s0)
    80002cc4:	fffff097          	auipc	ra,0xfffff
    80002cc8:	652080e7          	jalr	1618(ra) # 80002316 <uvmfree>
    return 0;
    80002ccc:	4781                	li	a5,0
    80002cce:	a8a9                	j	80002d28 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002cd0:	fd843783          	ld	a5,-40(s0)
    80002cd4:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002cd6:	4719                	li	a4,6
    80002cd8:	86be                	mv	a3,a5
    80002cda:	6605                	lui	a2,0x1
    80002cdc:	020007b7          	lui	a5,0x2000
    80002ce0:	17fd                	addi	a5,a5,-1
    80002ce2:	00d79593          	slli	a1,a5,0xd
    80002ce6:	fe843503          	ld	a0,-24(s0)
    80002cea:	fffff097          	auipc	ra,0xfffff
    80002cee:	0d0080e7          	jalr	208(ra) # 80001dba <mappages>
    80002cf2:	87aa                	mv	a5,a0
    80002cf4:	0207d863          	bgez	a5,80002d24 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002cf8:	4681                	li	a3,0
    80002cfa:	4605                	li	a2,1
    80002cfc:	040007b7          	lui	a5,0x4000
    80002d00:	17fd                	addi	a5,a5,-1
    80002d02:	00c79593          	slli	a1,a5,0xc
    80002d06:	fe843503          	ld	a0,-24(s0)
    80002d0a:	fffff097          	auipc	ra,0xfffff
    80002d0e:	1ac080e7          	jalr	428(ra) # 80001eb6 <uvmunmap>
    uvmfree(pagetable, 0);
    80002d12:	4581                	li	a1,0
    80002d14:	fe843503          	ld	a0,-24(s0)
    80002d18:	fffff097          	auipc	ra,0xfffff
    80002d1c:	5fe080e7          	jalr	1534(ra) # 80002316 <uvmfree>
    return 0;
    80002d20:	4781                	li	a5,0
    80002d22:	a019                	j	80002d28 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002d24:	fe843783          	ld	a5,-24(s0)
}
    80002d28:	853e                	mv	a0,a5
    80002d2a:	70a2                	ld	ra,40(sp)
    80002d2c:	7402                	ld	s0,32(sp)
    80002d2e:	6145                	addi	sp,sp,48
    80002d30:	8082                	ret

0000000080002d32 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002d32:	1101                	addi	sp,sp,-32
    80002d34:	ec06                	sd	ra,24(sp)
    80002d36:	e822                	sd	s0,16(sp)
    80002d38:	1000                	addi	s0,sp,32
    80002d3a:	fea43423          	sd	a0,-24(s0)
    80002d3e:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002d42:	4681                	li	a3,0
    80002d44:	4605                	li	a2,1
    80002d46:	040007b7          	lui	a5,0x4000
    80002d4a:	17fd                	addi	a5,a5,-1
    80002d4c:	00c79593          	slli	a1,a5,0xc
    80002d50:	fe843503          	ld	a0,-24(s0)
    80002d54:	fffff097          	auipc	ra,0xfffff
    80002d58:	162080e7          	jalr	354(ra) # 80001eb6 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002d5c:	4681                	li	a3,0
    80002d5e:	4605                	li	a2,1
    80002d60:	020007b7          	lui	a5,0x2000
    80002d64:	17fd                	addi	a5,a5,-1
    80002d66:	00d79593          	slli	a1,a5,0xd
    80002d6a:	fe843503          	ld	a0,-24(s0)
    80002d6e:	fffff097          	auipc	ra,0xfffff
    80002d72:	148080e7          	jalr	328(ra) # 80001eb6 <uvmunmap>
  uvmfree(pagetable, sz);
    80002d76:	fe043583          	ld	a1,-32(s0)
    80002d7a:	fe843503          	ld	a0,-24(s0)
    80002d7e:	fffff097          	auipc	ra,0xfffff
    80002d82:	598080e7          	jalr	1432(ra) # 80002316 <uvmfree>
}
    80002d86:	0001                	nop
    80002d88:	60e2                	ld	ra,24(sp)
    80002d8a:	6442                	ld	s0,16(sp)
    80002d8c:	6105                	addi	sp,sp,32
    80002d8e:	8082                	ret

0000000080002d90 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002d90:	1101                	addi	sp,sp,-32
    80002d92:	ec06                	sd	ra,24(sp)
    80002d94:	e822                	sd	s0,16(sp)
    80002d96:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002d98:	00000097          	auipc	ra,0x0
    80002d9c:	d12080e7          	jalr	-750(ra) # 80002aaa <allocproc>
    80002da0:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002da4:	0000a797          	auipc	a5,0xa
    80002da8:	c3c78793          	addi	a5,a5,-964 # 8000c9e0 <initproc>
    80002dac:	fe843703          	ld	a4,-24(s0)
    80002db0:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002db2:	fe843783          	ld	a5,-24(s0)
    80002db6:	6bbc                	ld	a5,80(a5)
    80002db8:	03400613          	li	a2,52
    80002dbc:	0000a597          	auipc	a1,0xa
    80002dc0:	acc58593          	addi	a1,a1,-1332 # 8000c888 <initcode>
    80002dc4:	853e                	mv	a0,a5
    80002dc6:	fffff097          	auipc	ra,0xfffff
    80002dca:	290080e7          	jalr	656(ra) # 80002056 <uvmfirst>
  p->sz = PGSIZE;
    80002dce:	fe843783          	ld	a5,-24(s0)
    80002dd2:	6705                	lui	a4,0x1
    80002dd4:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002dd6:	fe843783          	ld	a5,-24(s0)
    80002dda:	6fbc                	ld	a5,88(a5)
    80002ddc:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002de0:	fe843783          	ld	a5,-24(s0)
    80002de4:	6fbc                	ld	a5,88(a5)
    80002de6:	6705                	lui	a4,0x1
    80002de8:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002dea:	fe843783          	ld	a5,-24(s0)
    80002dee:	15878793          	addi	a5,a5,344
    80002df2:	4641                	li	a2,16
    80002df4:	00009597          	auipc	a1,0x9
    80002df8:	42c58593          	addi	a1,a1,1068 # 8000c220 <etext+0x220>
    80002dfc:	853e                	mv	a0,a5
    80002dfe:	fffff097          	auipc	ra,0xfffff
    80002e02:	a16080e7          	jalr	-1514(ra) # 80001814 <safestrcpy>
  p->cwd = namei("/");
    80002e06:	00009517          	auipc	a0,0x9
    80002e0a:	42a50513          	addi	a0,a0,1066 # 8000c230 <etext+0x230>
    80002e0e:	00003097          	auipc	ra,0x3
    80002e12:	1da080e7          	jalr	474(ra) # 80005fe8 <namei>
    80002e16:	872a                	mv	a4,a0
    80002e18:	fe843783          	ld	a5,-24(s0)
    80002e1c:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002e20:	fe843783          	ld	a5,-24(s0)
    80002e24:	470d                	li	a4,3
    80002e26:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002e28:	fe843783          	ld	a5,-24(s0)
    80002e2c:	853e                	mv	a0,a5
    80002e2e:	ffffe097          	auipc	ra,0xffffe
    80002e32:	572080e7          	jalr	1394(ra) # 800013a0 <release>
}
    80002e36:	0001                	nop
    80002e38:	60e2                	ld	ra,24(sp)
    80002e3a:	6442                	ld	s0,16(sp)
    80002e3c:	6105                	addi	sp,sp,32
    80002e3e:	8082                	ret

0000000080002e40 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002e40:	7179                	addi	sp,sp,-48
    80002e42:	f406                	sd	ra,40(sp)
    80002e44:	f022                	sd	s0,32(sp)
    80002e46:	1800                	addi	s0,sp,48
    80002e48:	87aa                	mv	a5,a0
    80002e4a:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002e4e:	00000097          	auipc	ra,0x0
    80002e52:	bc2080e7          	jalr	-1086(ra) # 80002a10 <myproc>
    80002e56:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002e5a:	fe043783          	ld	a5,-32(s0)
    80002e5e:	67bc                	ld	a5,72(a5)
    80002e60:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002e64:	fdc42783          	lw	a5,-36(s0)
    80002e68:	2781                	sext.w	a5,a5
    80002e6a:	02f05963          	blez	a5,80002e9c <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002e6e:	fe043783          	ld	a5,-32(s0)
    80002e72:	6ba8                	ld	a0,80(a5)
    80002e74:	fdc42703          	lw	a4,-36(s0)
    80002e78:	fe843783          	ld	a5,-24(s0)
    80002e7c:	97ba                	add	a5,a5,a4
    80002e7e:	4691                	li	a3,4
    80002e80:	863e                	mv	a2,a5
    80002e82:	fe843583          	ld	a1,-24(s0)
    80002e86:	fffff097          	auipc	ra,0xfffff
    80002e8a:	258080e7          	jalr	600(ra) # 800020de <uvmalloc>
    80002e8e:	fea43423          	sd	a0,-24(s0)
    80002e92:	fe843783          	ld	a5,-24(s0)
    80002e96:	eb95                	bnez	a5,80002eca <growproc+0x8a>
      return -1;
    80002e98:	57fd                	li	a5,-1
    80002e9a:	a835                	j	80002ed6 <growproc+0x96>
    }
  } else if(n < 0){
    80002e9c:	fdc42783          	lw	a5,-36(s0)
    80002ea0:	2781                	sext.w	a5,a5
    80002ea2:	0207d463          	bgez	a5,80002eca <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002ea6:	fe043783          	ld	a5,-32(s0)
    80002eaa:	6bb4                	ld	a3,80(a5)
    80002eac:	fdc42703          	lw	a4,-36(s0)
    80002eb0:	fe843783          	ld	a5,-24(s0)
    80002eb4:	97ba                	add	a5,a5,a4
    80002eb6:	863e                	mv	a2,a5
    80002eb8:	fe843583          	ld	a1,-24(s0)
    80002ebc:	8536                	mv	a0,a3
    80002ebe:	fffff097          	auipc	ra,0xfffff
    80002ec2:	312080e7          	jalr	786(ra) # 800021d0 <uvmdealloc>
    80002ec6:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002eca:	fe043783          	ld	a5,-32(s0)
    80002ece:	fe843703          	ld	a4,-24(s0)
    80002ed2:	e7b8                	sd	a4,72(a5)
  return 0;
    80002ed4:	4781                	li	a5,0
}
    80002ed6:	853e                	mv	a0,a5
    80002ed8:	70a2                	ld	ra,40(sp)
    80002eda:	7402                	ld	s0,32(sp)
    80002edc:	6145                	addi	sp,sp,48
    80002ede:	8082                	ret

0000000080002ee0 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002ee0:	7179                	addi	sp,sp,-48
    80002ee2:	f406                	sd	ra,40(sp)
    80002ee4:	f022                	sd	s0,32(sp)
    80002ee6:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002ee8:	00000097          	auipc	ra,0x0
    80002eec:	b28080e7          	jalr	-1240(ra) # 80002a10 <myproc>
    80002ef0:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002ef4:	00000097          	auipc	ra,0x0
    80002ef8:	bb6080e7          	jalr	-1098(ra) # 80002aaa <allocproc>
    80002efc:	fca43c23          	sd	a0,-40(s0)
    80002f00:	fd843783          	ld	a5,-40(s0)
    80002f04:	e399                	bnez	a5,80002f0a <fork+0x2a>
    return -1;
    80002f06:	57fd                	li	a5,-1
    80002f08:	aab5                	j	80003084 <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002f0a:	fe043783          	ld	a5,-32(s0)
    80002f0e:	6bb8                	ld	a4,80(a5)
    80002f10:	fd843783          	ld	a5,-40(s0)
    80002f14:	6bb4                	ld	a3,80(a5)
    80002f16:	fe043783          	ld	a5,-32(s0)
    80002f1a:	67bc                	ld	a5,72(a5)
    80002f1c:	863e                	mv	a2,a5
    80002f1e:	85b6                	mv	a1,a3
    80002f20:	853a                	mv	a0,a4
    80002f22:	fffff097          	auipc	ra,0xfffff
    80002f26:	43e080e7          	jalr	1086(ra) # 80002360 <uvmcopy>
    80002f2a:	87aa                	mv	a5,a0
    80002f2c:	0207d163          	bgez	a5,80002f4e <fork+0x6e>
    freeproc(np);
    80002f30:	fd843503          	ld	a0,-40(s0)
    80002f34:	00000097          	auipc	ra,0x0
    80002f38:	ca0080e7          	jalr	-864(ra) # 80002bd4 <freeproc>
    release(&np->lock);
    80002f3c:	fd843783          	ld	a5,-40(s0)
    80002f40:	853e                	mv	a0,a5
    80002f42:	ffffe097          	auipc	ra,0xffffe
    80002f46:	45e080e7          	jalr	1118(ra) # 800013a0 <release>
    return -1;
    80002f4a:	57fd                	li	a5,-1
    80002f4c:	aa25                	j	80003084 <fork+0x1a4>
  }
  np->sz = p->sz;
    80002f4e:	fe043783          	ld	a5,-32(s0)
    80002f52:	67b8                	ld	a4,72(a5)
    80002f54:	fd843783          	ld	a5,-40(s0)
    80002f58:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002f5a:	fe043783          	ld	a5,-32(s0)
    80002f5e:	6fb8                	ld	a4,88(a5)
    80002f60:	fd843783          	ld	a5,-40(s0)
    80002f64:	6fbc                	ld	a5,88(a5)
    80002f66:	86be                	mv	a3,a5
    80002f68:	12000793          	li	a5,288
    80002f6c:	863e                	mv	a2,a5
    80002f6e:	85ba                	mv	a1,a4
    80002f70:	8536                	mv	a0,a3
    80002f72:	ffffe097          	auipc	ra,0xffffe
    80002f76:	75e080e7          	jalr	1886(ra) # 800016d0 <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80002f7a:	fd843783          	ld	a5,-40(s0)
    80002f7e:	6fbc                	ld	a5,88(a5)
    80002f80:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    80002f84:	fe042623          	sw	zero,-20(s0)
    80002f88:	a0a9                	j	80002fd2 <fork+0xf2>
    if(p->ofile[i])
    80002f8a:	fe043703          	ld	a4,-32(s0)
    80002f8e:	fec42783          	lw	a5,-20(s0)
    80002f92:	07e9                	addi	a5,a5,26
    80002f94:	078e                	slli	a5,a5,0x3
    80002f96:	97ba                	add	a5,a5,a4
    80002f98:	639c                	ld	a5,0(a5)
    80002f9a:	c79d                	beqz	a5,80002fc8 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80002f9c:	fe043703          	ld	a4,-32(s0)
    80002fa0:	fec42783          	lw	a5,-20(s0)
    80002fa4:	07e9                	addi	a5,a5,26
    80002fa6:	078e                	slli	a5,a5,0x3
    80002fa8:	97ba                	add	a5,a5,a4
    80002faa:	639c                	ld	a5,0(a5)
    80002fac:	853e                	mv	a0,a5
    80002fae:	00004097          	auipc	ra,0x4
    80002fb2:	9d2080e7          	jalr	-1582(ra) # 80006980 <filedup>
    80002fb6:	86aa                	mv	a3,a0
    80002fb8:	fd843703          	ld	a4,-40(s0)
    80002fbc:	fec42783          	lw	a5,-20(s0)
    80002fc0:	07e9                	addi	a5,a5,26
    80002fc2:	078e                	slli	a5,a5,0x3
    80002fc4:	97ba                	add	a5,a5,a4
    80002fc6:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80002fc8:	fec42783          	lw	a5,-20(s0)
    80002fcc:	2785                	addiw	a5,a5,1
    80002fce:	fef42623          	sw	a5,-20(s0)
    80002fd2:	fec42783          	lw	a5,-20(s0)
    80002fd6:	0007871b          	sext.w	a4,a5
    80002fda:	47bd                	li	a5,15
    80002fdc:	fae7d7e3          	bge	a5,a4,80002f8a <fork+0xaa>
  np->cwd = idup(p->cwd);
    80002fe0:	fe043783          	ld	a5,-32(s0)
    80002fe4:	1507b783          	ld	a5,336(a5)
    80002fe8:	853e                	mv	a0,a5
    80002fea:	00002097          	auipc	ra,0x2
    80002fee:	28c080e7          	jalr	652(ra) # 80005276 <idup>
    80002ff2:	872a                	mv	a4,a0
    80002ff4:	fd843783          	ld	a5,-40(s0)
    80002ff8:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80002ffc:	fd843783          	ld	a5,-40(s0)
    80003000:	15878713          	addi	a4,a5,344
    80003004:	fe043783          	ld	a5,-32(s0)
    80003008:	15878793          	addi	a5,a5,344
    8000300c:	4641                	li	a2,16
    8000300e:	85be                	mv	a1,a5
    80003010:	853a                	mv	a0,a4
    80003012:	fffff097          	auipc	ra,0xfffff
    80003016:	802080e7          	jalr	-2046(ra) # 80001814 <safestrcpy>

  pid = np->pid;
    8000301a:	fd843783          	ld	a5,-40(s0)
    8000301e:	5b9c                	lw	a5,48(a5)
    80003020:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80003024:	fd843783          	ld	a5,-40(s0)
    80003028:	853e                	mv	a0,a5
    8000302a:	ffffe097          	auipc	ra,0xffffe
    8000302e:	376080e7          	jalr	886(ra) # 800013a0 <release>

  acquire(&wait_lock);
    80003032:	00018517          	auipc	a0,0x18
    80003036:	a3e50513          	addi	a0,a0,-1474 # 8001aa70 <wait_lock>
    8000303a:	ffffe097          	auipc	ra,0xffffe
    8000303e:	302080e7          	jalr	770(ra) # 8000133c <acquire>
  np->parent = p;
    80003042:	fd843783          	ld	a5,-40(s0)
    80003046:	fe043703          	ld	a4,-32(s0)
    8000304a:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    8000304c:	00018517          	auipc	a0,0x18
    80003050:	a2450513          	addi	a0,a0,-1500 # 8001aa70 <wait_lock>
    80003054:	ffffe097          	auipc	ra,0xffffe
    80003058:	34c080e7          	jalr	844(ra) # 800013a0 <release>

  acquire(&np->lock);
    8000305c:	fd843783          	ld	a5,-40(s0)
    80003060:	853e                	mv	a0,a5
    80003062:	ffffe097          	auipc	ra,0xffffe
    80003066:	2da080e7          	jalr	730(ra) # 8000133c <acquire>
  np->state = RUNNABLE;
    8000306a:	fd843783          	ld	a5,-40(s0)
    8000306e:	470d                	li	a4,3
    80003070:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    80003072:	fd843783          	ld	a5,-40(s0)
    80003076:	853e                	mv	a0,a5
    80003078:	ffffe097          	auipc	ra,0xffffe
    8000307c:	328080e7          	jalr	808(ra) # 800013a0 <release>

  return pid;
    80003080:	fd442783          	lw	a5,-44(s0)
}
    80003084:	853e                	mv	a0,a5
    80003086:	70a2                	ld	ra,40(sp)
    80003088:	7402                	ld	s0,32(sp)
    8000308a:	6145                	addi	sp,sp,48
    8000308c:	8082                	ret

000000008000308e <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    8000308e:	7179                	addi	sp,sp,-48
    80003090:	f406                	sd	ra,40(sp)
    80003092:	f022                	sd	s0,32(sp)
    80003094:	1800                	addi	s0,sp,48
    80003096:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    8000309a:	00012797          	auipc	a5,0x12
    8000309e:	fbe78793          	addi	a5,a5,-66 # 80015058 <proc>
    800030a2:	fef43423          	sd	a5,-24(s0)
    800030a6:	a081                	j	800030e6 <reparent+0x58>
    if(pp->parent == p){
    800030a8:	fe843783          	ld	a5,-24(s0)
    800030ac:	7f9c                	ld	a5,56(a5)
    800030ae:	fd843703          	ld	a4,-40(s0)
    800030b2:	02f71463          	bne	a4,a5,800030da <reparent+0x4c>
      pp->parent = initproc;
    800030b6:	0000a797          	auipc	a5,0xa
    800030ba:	92a78793          	addi	a5,a5,-1750 # 8000c9e0 <initproc>
    800030be:	6398                	ld	a4,0(a5)
    800030c0:	fe843783          	ld	a5,-24(s0)
    800030c4:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    800030c6:	0000a797          	auipc	a5,0xa
    800030ca:	91a78793          	addi	a5,a5,-1766 # 8000c9e0 <initproc>
    800030ce:	639c                	ld	a5,0(a5)
    800030d0:	853e                	mv	a0,a5
    800030d2:	00000097          	auipc	ra,0x0
    800030d6:	57c080e7          	jalr	1404(ra) # 8000364e <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    800030da:	fe843783          	ld	a5,-24(s0)
    800030de:	16878793          	addi	a5,a5,360
    800030e2:	fef43423          	sd	a5,-24(s0)
    800030e6:	fe843703          	ld	a4,-24(s0)
    800030ea:	00018797          	auipc	a5,0x18
    800030ee:	96e78793          	addi	a5,a5,-1682 # 8001aa58 <pid_lock>
    800030f2:	faf76be3          	bltu	a4,a5,800030a8 <reparent+0x1a>
    }
  }
}
    800030f6:	0001                	nop
    800030f8:	0001                	nop
    800030fa:	70a2                	ld	ra,40(sp)
    800030fc:	7402                	ld	s0,32(sp)
    800030fe:	6145                	addi	sp,sp,48
    80003100:	8082                	ret

0000000080003102 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80003102:	7139                	addi	sp,sp,-64
    80003104:	fc06                	sd	ra,56(sp)
    80003106:	f822                	sd	s0,48(sp)
    80003108:	0080                	addi	s0,sp,64
    8000310a:	87aa                	mv	a5,a0
    8000310c:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003110:	00000097          	auipc	ra,0x0
    80003114:	900080e7          	jalr	-1792(ra) # 80002a10 <myproc>
    80003118:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    8000311c:	0000a797          	auipc	a5,0xa
    80003120:	8c478793          	addi	a5,a5,-1852 # 8000c9e0 <initproc>
    80003124:	639c                	ld	a5,0(a5)
    80003126:	fe043703          	ld	a4,-32(s0)
    8000312a:	00f71a63          	bne	a4,a5,8000313e <exit+0x3c>
    panic("init exiting");
    8000312e:	00009517          	auipc	a0,0x9
    80003132:	10a50513          	addi	a0,a0,266 # 8000c238 <etext+0x238>
    80003136:	ffffe097          	auipc	ra,0xffffe
    8000313a:	b56080e7          	jalr	-1194(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    8000313e:	fe042623          	sw	zero,-20(s0)
    80003142:	a881                	j	80003192 <exit+0x90>
    if(p->ofile[fd]){
    80003144:	fe043703          	ld	a4,-32(s0)
    80003148:	fec42783          	lw	a5,-20(s0)
    8000314c:	07e9                	addi	a5,a5,26
    8000314e:	078e                	slli	a5,a5,0x3
    80003150:	97ba                	add	a5,a5,a4
    80003152:	639c                	ld	a5,0(a5)
    80003154:	cb95                	beqz	a5,80003188 <exit+0x86>
      struct file *f = p->ofile[fd];
    80003156:	fe043703          	ld	a4,-32(s0)
    8000315a:	fec42783          	lw	a5,-20(s0)
    8000315e:	07e9                	addi	a5,a5,26
    80003160:	078e                	slli	a5,a5,0x3
    80003162:	97ba                	add	a5,a5,a4
    80003164:	639c                	ld	a5,0(a5)
    80003166:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    8000316a:	fd843503          	ld	a0,-40(s0)
    8000316e:	00004097          	auipc	ra,0x4
    80003172:	878080e7          	jalr	-1928(ra) # 800069e6 <fileclose>
      p->ofile[fd] = 0;
    80003176:	fe043703          	ld	a4,-32(s0)
    8000317a:	fec42783          	lw	a5,-20(s0)
    8000317e:	07e9                	addi	a5,a5,26
    80003180:	078e                	slli	a5,a5,0x3
    80003182:	97ba                	add	a5,a5,a4
    80003184:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80003188:	fec42783          	lw	a5,-20(s0)
    8000318c:	2785                	addiw	a5,a5,1
    8000318e:	fef42623          	sw	a5,-20(s0)
    80003192:	fec42783          	lw	a5,-20(s0)
    80003196:	0007871b          	sext.w	a4,a5
    8000319a:	47bd                	li	a5,15
    8000319c:	fae7d4e3          	bge	a5,a4,80003144 <exit+0x42>
    }
  }

  begin_op();
    800031a0:	00003097          	auipc	ra,0x3
    800031a4:	1ac080e7          	jalr	428(ra) # 8000634c <begin_op>
  iput(p->cwd);
    800031a8:	fe043783          	ld	a5,-32(s0)
    800031ac:	1507b783          	ld	a5,336(a5)
    800031b0:	853e                	mv	a0,a5
    800031b2:	00002097          	auipc	ra,0x2
    800031b6:	29e080e7          	jalr	670(ra) # 80005450 <iput>
  end_op();
    800031ba:	00003097          	auipc	ra,0x3
    800031be:	254080e7          	jalr	596(ra) # 8000640e <end_op>
  p->cwd = 0;
    800031c2:	fe043783          	ld	a5,-32(s0)
    800031c6:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    800031ca:	00018517          	auipc	a0,0x18
    800031ce:	8a650513          	addi	a0,a0,-1882 # 8001aa70 <wait_lock>
    800031d2:	ffffe097          	auipc	ra,0xffffe
    800031d6:	16a080e7          	jalr	362(ra) # 8000133c <acquire>

  // Give any children to init.
  reparent(p);
    800031da:	fe043503          	ld	a0,-32(s0)
    800031de:	00000097          	auipc	ra,0x0
    800031e2:	eb0080e7          	jalr	-336(ra) # 8000308e <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    800031e6:	fe043783          	ld	a5,-32(s0)
    800031ea:	7f9c                	ld	a5,56(a5)
    800031ec:	853e                	mv	a0,a5
    800031ee:	00000097          	auipc	ra,0x0
    800031f2:	460080e7          	jalr	1120(ra) # 8000364e <wakeup>
  
  acquire(&p->lock);
    800031f6:	fe043783          	ld	a5,-32(s0)
    800031fa:	853e                	mv	a0,a5
    800031fc:	ffffe097          	auipc	ra,0xffffe
    80003200:	140080e7          	jalr	320(ra) # 8000133c <acquire>

  p->xstate = status;
    80003204:	fe043783          	ld	a5,-32(s0)
    80003208:	fcc42703          	lw	a4,-52(s0)
    8000320c:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    8000320e:	fe043783          	ld	a5,-32(s0)
    80003212:	4715                	li	a4,5
    80003214:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    80003216:	00018517          	auipc	a0,0x18
    8000321a:	85a50513          	addi	a0,a0,-1958 # 8001aa70 <wait_lock>
    8000321e:	ffffe097          	auipc	ra,0xffffe
    80003222:	182080e7          	jalr	386(ra) # 800013a0 <release>

  // Jump into the scheduler, never to return.
  sched();
    80003226:	00000097          	auipc	ra,0x0
    8000322a:	230080e7          	jalr	560(ra) # 80003456 <sched>
  panic("zombie exit");
    8000322e:	00009517          	auipc	a0,0x9
    80003232:	01a50513          	addi	a0,a0,26 # 8000c248 <etext+0x248>
    80003236:	ffffe097          	auipc	ra,0xffffe
    8000323a:	a56080e7          	jalr	-1450(ra) # 80000c8c <panic>

000000008000323e <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    8000323e:	7139                	addi	sp,sp,-64
    80003240:	fc06                	sd	ra,56(sp)
    80003242:	f822                	sd	s0,48(sp)
    80003244:	0080                	addi	s0,sp,64
    80003246:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    8000324a:	fffff097          	auipc	ra,0xfffff
    8000324e:	7c6080e7          	jalr	1990(ra) # 80002a10 <myproc>
    80003252:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    80003256:	00018517          	auipc	a0,0x18
    8000325a:	81a50513          	addi	a0,a0,-2022 # 8001aa70 <wait_lock>
    8000325e:	ffffe097          	auipc	ra,0xffffe
    80003262:	0de080e7          	jalr	222(ra) # 8000133c <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    80003266:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    8000326a:	00012797          	auipc	a5,0x12
    8000326e:	dee78793          	addi	a5,a5,-530 # 80015058 <proc>
    80003272:	fef43423          	sd	a5,-24(s0)
    80003276:	a8d1                	j	8000334a <wait+0x10c>
      if(pp->parent == p){
    80003278:	fe843783          	ld	a5,-24(s0)
    8000327c:	7f9c                	ld	a5,56(a5)
    8000327e:	fd843703          	ld	a4,-40(s0)
    80003282:	0af71e63          	bne	a4,a5,8000333e <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    80003286:	fe843783          	ld	a5,-24(s0)
    8000328a:	853e                	mv	a0,a5
    8000328c:	ffffe097          	auipc	ra,0xffffe
    80003290:	0b0080e7          	jalr	176(ra) # 8000133c <acquire>

        havekids = 1;
    80003294:	4785                	li	a5,1
    80003296:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    8000329a:	fe843783          	ld	a5,-24(s0)
    8000329e:	4f9c                	lw	a5,24(a5)
    800032a0:	873e                	mv	a4,a5
    800032a2:	4795                	li	a5,5
    800032a4:	08f71663          	bne	a4,a5,80003330 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    800032a8:	fe843783          	ld	a5,-24(s0)
    800032ac:	5b9c                	lw	a5,48(a5)
    800032ae:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    800032b2:	fc843783          	ld	a5,-56(s0)
    800032b6:	c7a9                	beqz	a5,80003300 <wait+0xc2>
    800032b8:	fd843783          	ld	a5,-40(s0)
    800032bc:	6bb8                	ld	a4,80(a5)
    800032be:	fe843783          	ld	a5,-24(s0)
    800032c2:	02c78793          	addi	a5,a5,44
    800032c6:	4691                	li	a3,4
    800032c8:	863e                	mv	a2,a5
    800032ca:	fc843583          	ld	a1,-56(s0)
    800032ce:	853a                	mv	a0,a4
    800032d0:	fffff097          	auipc	ra,0xfffff
    800032d4:	20a080e7          	jalr	522(ra) # 800024da <copyout>
    800032d8:	87aa                	mv	a5,a0
    800032da:	0207d363          	bgez	a5,80003300 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    800032de:	fe843783          	ld	a5,-24(s0)
    800032e2:	853e                	mv	a0,a5
    800032e4:	ffffe097          	auipc	ra,0xffffe
    800032e8:	0bc080e7          	jalr	188(ra) # 800013a0 <release>
            release(&wait_lock);
    800032ec:	00017517          	auipc	a0,0x17
    800032f0:	78450513          	addi	a0,a0,1924 # 8001aa70 <wait_lock>
    800032f4:	ffffe097          	auipc	ra,0xffffe
    800032f8:	0ac080e7          	jalr	172(ra) # 800013a0 <release>
            return -1;
    800032fc:	57fd                	li	a5,-1
    800032fe:	a879                	j	8000339c <wait+0x15e>
          }
          freeproc(pp);
    80003300:	fe843503          	ld	a0,-24(s0)
    80003304:	00000097          	auipc	ra,0x0
    80003308:	8d0080e7          	jalr	-1840(ra) # 80002bd4 <freeproc>
          release(&pp->lock);
    8000330c:	fe843783          	ld	a5,-24(s0)
    80003310:	853e                	mv	a0,a5
    80003312:	ffffe097          	auipc	ra,0xffffe
    80003316:	08e080e7          	jalr	142(ra) # 800013a0 <release>
          release(&wait_lock);
    8000331a:	00017517          	auipc	a0,0x17
    8000331e:	75650513          	addi	a0,a0,1878 # 8001aa70 <wait_lock>
    80003322:	ffffe097          	auipc	ra,0xffffe
    80003326:	07e080e7          	jalr	126(ra) # 800013a0 <release>
          return pid;
    8000332a:	fd442783          	lw	a5,-44(s0)
    8000332e:	a0bd                	j	8000339c <wait+0x15e>
        }
        release(&pp->lock);
    80003330:	fe843783          	ld	a5,-24(s0)
    80003334:	853e                	mv	a0,a5
    80003336:	ffffe097          	auipc	ra,0xffffe
    8000333a:	06a080e7          	jalr	106(ra) # 800013a0 <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    8000333e:	fe843783          	ld	a5,-24(s0)
    80003342:	16878793          	addi	a5,a5,360
    80003346:	fef43423          	sd	a5,-24(s0)
    8000334a:	fe843703          	ld	a4,-24(s0)
    8000334e:	00017797          	auipc	a5,0x17
    80003352:	70a78793          	addi	a5,a5,1802 # 8001aa58 <pid_lock>
    80003356:	f2f761e3          	bltu	a4,a5,80003278 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    8000335a:	fe442783          	lw	a5,-28(s0)
    8000335e:	2781                	sext.w	a5,a5
    80003360:	cb89                	beqz	a5,80003372 <wait+0x134>
    80003362:	fd843503          	ld	a0,-40(s0)
    80003366:	00000097          	auipc	ra,0x0
    8000336a:	47a080e7          	jalr	1146(ra) # 800037e0 <killed>
    8000336e:	87aa                	mv	a5,a0
    80003370:	cb99                	beqz	a5,80003386 <wait+0x148>
      release(&wait_lock);
    80003372:	00017517          	auipc	a0,0x17
    80003376:	6fe50513          	addi	a0,a0,1790 # 8001aa70 <wait_lock>
    8000337a:	ffffe097          	auipc	ra,0xffffe
    8000337e:	026080e7          	jalr	38(ra) # 800013a0 <release>
      return -1;
    80003382:	57fd                	li	a5,-1
    80003384:	a821                	j	8000339c <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    80003386:	00017597          	auipc	a1,0x17
    8000338a:	6ea58593          	addi	a1,a1,1770 # 8001aa70 <wait_lock>
    8000338e:	fd843503          	ld	a0,-40(s0)
    80003392:	00000097          	auipc	ra,0x0
    80003396:	240080e7          	jalr	576(ra) # 800035d2 <sleep>
    havekids = 0;
    8000339a:	b5f1                	j	80003266 <wait+0x28>
  }
}
    8000339c:	853e                	mv	a0,a5
    8000339e:	70e2                	ld	ra,56(sp)
    800033a0:	7442                	ld	s0,48(sp)
    800033a2:	6121                	addi	sp,sp,64
    800033a4:	8082                	ret

00000000800033a6 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    800033a6:	1101                	addi	sp,sp,-32
    800033a8:	ec06                	sd	ra,24(sp)
    800033aa:	e822                	sd	s0,16(sp)
    800033ac:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    800033ae:	fffff097          	auipc	ra,0xfffff
    800033b2:	628080e7          	jalr	1576(ra) # 800029d6 <mycpu>
    800033b6:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    800033ba:	fe043783          	ld	a5,-32(s0)
    800033be:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    800033c2:	fffff097          	auipc	ra,0xfffff
    800033c6:	3f6080e7          	jalr	1014(ra) # 800027b8 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    800033ca:	00012797          	auipc	a5,0x12
    800033ce:	c8e78793          	addi	a5,a5,-882 # 80015058 <proc>
    800033d2:	fef43423          	sd	a5,-24(s0)
    800033d6:	a0bd                	j	80003444 <scheduler+0x9e>
      acquire(&p->lock);
    800033d8:	fe843783          	ld	a5,-24(s0)
    800033dc:	853e                	mv	a0,a5
    800033de:	ffffe097          	auipc	ra,0xffffe
    800033e2:	f5e080e7          	jalr	-162(ra) # 8000133c <acquire>
      if(p->state == RUNNABLE) {
    800033e6:	fe843783          	ld	a5,-24(s0)
    800033ea:	4f9c                	lw	a5,24(a5)
    800033ec:	873e                	mv	a4,a5
    800033ee:	478d                	li	a5,3
    800033f0:	02f71d63          	bne	a4,a5,8000342a <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    800033f4:	fe843783          	ld	a5,-24(s0)
    800033f8:	4711                	li	a4,4
    800033fa:	cf98                	sw	a4,24(a5)
        c->proc = p;
    800033fc:	fe043783          	ld	a5,-32(s0)
    80003400:	fe843703          	ld	a4,-24(s0)
    80003404:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    80003406:	fe043783          	ld	a5,-32(s0)
    8000340a:	00878713          	addi	a4,a5,8
    8000340e:	fe843783          	ld	a5,-24(s0)
    80003412:	06078793          	addi	a5,a5,96
    80003416:	85be                	mv	a1,a5
    80003418:	853a                	mv	a0,a4
    8000341a:	00000097          	auipc	ra,0x0
    8000341e:	5d0080e7          	jalr	1488(ra) # 800039ea <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    80003422:	fe043783          	ld	a5,-32(s0)
    80003426:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    8000342a:	fe843783          	ld	a5,-24(s0)
    8000342e:	853e                	mv	a0,a5
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	f70080e7          	jalr	-144(ra) # 800013a0 <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    80003438:	fe843783          	ld	a5,-24(s0)
    8000343c:	16878793          	addi	a5,a5,360
    80003440:	fef43423          	sd	a5,-24(s0)
    80003444:	fe843703          	ld	a4,-24(s0)
    80003448:	00017797          	auipc	a5,0x17
    8000344c:	61078793          	addi	a5,a5,1552 # 8001aa58 <pid_lock>
    80003450:	f8f764e3          	bltu	a4,a5,800033d8 <scheduler+0x32>
    intr_on();
    80003454:	b7bd                	j	800033c2 <scheduler+0x1c>

0000000080003456 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    80003456:	7179                	addi	sp,sp,-48
    80003458:	f406                	sd	ra,40(sp)
    8000345a:	f022                	sd	s0,32(sp)
    8000345c:	ec26                	sd	s1,24(sp)
    8000345e:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    80003460:	fffff097          	auipc	ra,0xfffff
    80003464:	5b0080e7          	jalr	1456(ra) # 80002a10 <myproc>
    80003468:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    8000346c:	fd843783          	ld	a5,-40(s0)
    80003470:	853e                	mv	a0,a5
    80003472:	ffffe097          	auipc	ra,0xffffe
    80003476:	f84080e7          	jalr	-124(ra) # 800013f6 <holding>
    8000347a:	87aa                	mv	a5,a0
    8000347c:	eb89                	bnez	a5,8000348e <sched+0x38>
    panic("sched p->lock");
    8000347e:	00009517          	auipc	a0,0x9
    80003482:	dda50513          	addi	a0,a0,-550 # 8000c258 <etext+0x258>
    80003486:	ffffe097          	auipc	ra,0xffffe
    8000348a:	806080e7          	jalr	-2042(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    8000348e:	fffff097          	auipc	ra,0xfffff
    80003492:	548080e7          	jalr	1352(ra) # 800029d6 <mycpu>
    80003496:	87aa                	mv	a5,a0
    80003498:	5fbc                	lw	a5,120(a5)
    8000349a:	873e                	mv	a4,a5
    8000349c:	4785                	li	a5,1
    8000349e:	00f70a63          	beq	a4,a5,800034b2 <sched+0x5c>
    panic("sched locks");
    800034a2:	00009517          	auipc	a0,0x9
    800034a6:	dc650513          	addi	a0,a0,-570 # 8000c268 <etext+0x268>
    800034aa:	ffffd097          	auipc	ra,0xffffd
    800034ae:	7e2080e7          	jalr	2018(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    800034b2:	fd843783          	ld	a5,-40(s0)
    800034b6:	4f9c                	lw	a5,24(a5)
    800034b8:	873e                	mv	a4,a5
    800034ba:	4791                	li	a5,4
    800034bc:	00f71a63          	bne	a4,a5,800034d0 <sched+0x7a>
    panic("sched running");
    800034c0:	00009517          	auipc	a0,0x9
    800034c4:	db850513          	addi	a0,a0,-584 # 8000c278 <etext+0x278>
    800034c8:	ffffd097          	auipc	ra,0xffffd
    800034cc:	7c4080e7          	jalr	1988(ra) # 80000c8c <panic>
  if(intr_get())
    800034d0:	fffff097          	auipc	ra,0xfffff
    800034d4:	312080e7          	jalr	786(ra) # 800027e2 <intr_get>
    800034d8:	87aa                	mv	a5,a0
    800034da:	cb89                	beqz	a5,800034ec <sched+0x96>
    panic("sched interruptible");
    800034dc:	00009517          	auipc	a0,0x9
    800034e0:	dac50513          	addi	a0,a0,-596 # 8000c288 <etext+0x288>
    800034e4:	ffffd097          	auipc	ra,0xffffd
    800034e8:	7a8080e7          	jalr	1960(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    800034ec:	fffff097          	auipc	ra,0xfffff
    800034f0:	4ea080e7          	jalr	1258(ra) # 800029d6 <mycpu>
    800034f4:	87aa                	mv	a5,a0
    800034f6:	5ffc                	lw	a5,124(a5)
    800034f8:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    800034fc:	fd843783          	ld	a5,-40(s0)
    80003500:	06078493          	addi	s1,a5,96
    80003504:	fffff097          	auipc	ra,0xfffff
    80003508:	4d2080e7          	jalr	1234(ra) # 800029d6 <mycpu>
    8000350c:	87aa                	mv	a5,a0
    8000350e:	07a1                	addi	a5,a5,8
    80003510:	85be                	mv	a1,a5
    80003512:	8526                	mv	a0,s1
    80003514:	00000097          	auipc	ra,0x0
    80003518:	4d6080e7          	jalr	1238(ra) # 800039ea <swtch>
  mycpu()->intena = intena;
    8000351c:	fffff097          	auipc	ra,0xfffff
    80003520:	4ba080e7          	jalr	1210(ra) # 800029d6 <mycpu>
    80003524:	872a                	mv	a4,a0
    80003526:	fd442783          	lw	a5,-44(s0)
    8000352a:	df7c                	sw	a5,124(a4)
}
    8000352c:	0001                	nop
    8000352e:	70a2                	ld	ra,40(sp)
    80003530:	7402                	ld	s0,32(sp)
    80003532:	64e2                	ld	s1,24(sp)
    80003534:	6145                	addi	sp,sp,48
    80003536:	8082                	ret

0000000080003538 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    80003538:	1101                	addi	sp,sp,-32
    8000353a:	ec06                	sd	ra,24(sp)
    8000353c:	e822                	sd	s0,16(sp)
    8000353e:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80003540:	fffff097          	auipc	ra,0xfffff
    80003544:	4d0080e7          	jalr	1232(ra) # 80002a10 <myproc>
    80003548:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000354c:	fe843783          	ld	a5,-24(s0)
    80003550:	853e                	mv	a0,a5
    80003552:	ffffe097          	auipc	ra,0xffffe
    80003556:	dea080e7          	jalr	-534(ra) # 8000133c <acquire>
  p->state = RUNNABLE;
    8000355a:	fe843783          	ld	a5,-24(s0)
    8000355e:	470d                	li	a4,3
    80003560:	cf98                	sw	a4,24(a5)
  sched();
    80003562:	00000097          	auipc	ra,0x0
    80003566:	ef4080e7          	jalr	-268(ra) # 80003456 <sched>
  release(&p->lock);
    8000356a:	fe843783          	ld	a5,-24(s0)
    8000356e:	853e                	mv	a0,a5
    80003570:	ffffe097          	auipc	ra,0xffffe
    80003574:	e30080e7          	jalr	-464(ra) # 800013a0 <release>
}
    80003578:	0001                	nop
    8000357a:	60e2                	ld	ra,24(sp)
    8000357c:	6442                	ld	s0,16(sp)
    8000357e:	6105                	addi	sp,sp,32
    80003580:	8082                	ret

0000000080003582 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    80003582:	1141                	addi	sp,sp,-16
    80003584:	e406                	sd	ra,8(sp)
    80003586:	e022                	sd	s0,0(sp)
    80003588:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    8000358a:	fffff097          	auipc	ra,0xfffff
    8000358e:	486080e7          	jalr	1158(ra) # 80002a10 <myproc>
    80003592:	87aa                	mv	a5,a0
    80003594:	853e                	mv	a0,a5
    80003596:	ffffe097          	auipc	ra,0xffffe
    8000359a:	e0a080e7          	jalr	-502(ra) # 800013a0 <release>

  if (first) {
    8000359e:	00009797          	auipc	a5,0x9
    800035a2:	2c678793          	addi	a5,a5,710 # 8000c864 <first.1720>
    800035a6:	439c                	lw	a5,0(a5)
    800035a8:	cf81                	beqz	a5,800035c0 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    800035aa:	00009797          	auipc	a5,0x9
    800035ae:	2ba78793          	addi	a5,a5,698 # 8000c864 <first.1720>
    800035b2:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    800035b6:	4505                	li	a0,1
    800035b8:	00001097          	auipc	ra,0x1
    800035bc:	594080e7          	jalr	1428(ra) # 80004b4c <fsinit>
  }

  usertrapret();
    800035c0:	00001097          	auipc	ra,0x1
    800035c4:	828080e7          	jalr	-2008(ra) # 80003de8 <usertrapret>
}
    800035c8:	0001                	nop
    800035ca:	60a2                	ld	ra,8(sp)
    800035cc:	6402                	ld	s0,0(sp)
    800035ce:	0141                	addi	sp,sp,16
    800035d0:	8082                	ret

00000000800035d2 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    800035d2:	7179                	addi	sp,sp,-48
    800035d4:	f406                	sd	ra,40(sp)
    800035d6:	f022                	sd	s0,32(sp)
    800035d8:	1800                	addi	s0,sp,48
    800035da:	fca43c23          	sd	a0,-40(s0)
    800035de:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800035e2:	fffff097          	auipc	ra,0xfffff
    800035e6:	42e080e7          	jalr	1070(ra) # 80002a10 <myproc>
    800035ea:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    800035ee:	fe843783          	ld	a5,-24(s0)
    800035f2:	853e                	mv	a0,a5
    800035f4:	ffffe097          	auipc	ra,0xffffe
    800035f8:	d48080e7          	jalr	-696(ra) # 8000133c <acquire>
  release(lk);
    800035fc:	fd043503          	ld	a0,-48(s0)
    80003600:	ffffe097          	auipc	ra,0xffffe
    80003604:	da0080e7          	jalr	-608(ra) # 800013a0 <release>

  // Go to sleep.
  p->chan = chan;
    80003608:	fe843783          	ld	a5,-24(s0)
    8000360c:	fd843703          	ld	a4,-40(s0)
    80003610:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003612:	fe843783          	ld	a5,-24(s0)
    80003616:	4709                	li	a4,2
    80003618:	cf98                	sw	a4,24(a5)

  sched();
    8000361a:	00000097          	auipc	ra,0x0
    8000361e:	e3c080e7          	jalr	-452(ra) # 80003456 <sched>

  // Tidy up.
  p->chan = 0;
    80003622:	fe843783          	ld	a5,-24(s0)
    80003626:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    8000362a:	fe843783          	ld	a5,-24(s0)
    8000362e:	853e                	mv	a0,a5
    80003630:	ffffe097          	auipc	ra,0xffffe
    80003634:	d70080e7          	jalr	-656(ra) # 800013a0 <release>
  acquire(lk);
    80003638:	fd043503          	ld	a0,-48(s0)
    8000363c:	ffffe097          	auipc	ra,0xffffe
    80003640:	d00080e7          	jalr	-768(ra) # 8000133c <acquire>
}
    80003644:	0001                	nop
    80003646:	70a2                	ld	ra,40(sp)
    80003648:	7402                	ld	s0,32(sp)
    8000364a:	6145                	addi	sp,sp,48
    8000364c:	8082                	ret

000000008000364e <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    8000364e:	7179                	addi	sp,sp,-48
    80003650:	f406                	sd	ra,40(sp)
    80003652:	f022                	sd	s0,32(sp)
    80003654:	1800                	addi	s0,sp,48
    80003656:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    8000365a:	00012797          	auipc	a5,0x12
    8000365e:	9fe78793          	addi	a5,a5,-1538 # 80015058 <proc>
    80003662:	fef43423          	sd	a5,-24(s0)
    80003666:	a051                	j	800036ea <wakeup+0x9c>
    if(p != myproc()){
    80003668:	fffff097          	auipc	ra,0xfffff
    8000366c:	3a8080e7          	jalr	936(ra) # 80002a10 <myproc>
    80003670:	872a                	mv	a4,a0
    80003672:	fe843783          	ld	a5,-24(s0)
    80003676:	06e78463          	beq	a5,a4,800036de <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    8000367a:	fe843783          	ld	a5,-24(s0)
    8000367e:	853e                	mv	a0,a5
    80003680:	ffffe097          	auipc	ra,0xffffe
    80003684:	d76080e7          	jalr	-650(ra) # 800013f6 <holding>
    80003688:	87aa                	mv	a5,a0
    8000368a:	cb81                	beqz	a5,8000369a <wakeup+0x4c>
    8000368c:	fe843783          	ld	a5,-24(s0)
    80003690:	4f9c                	lw	a5,24(a5)
    80003692:	873e                	mv	a4,a5
    80003694:	4785                	li	a5,1
    80003696:	04f70363          	beq	a4,a5,800036dc <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    8000369a:	fe843783          	ld	a5,-24(s0)
    8000369e:	853e                	mv	a0,a5
    800036a0:	ffffe097          	auipc	ra,0xffffe
    800036a4:	c9c080e7          	jalr	-868(ra) # 8000133c <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    800036a8:	fe843783          	ld	a5,-24(s0)
    800036ac:	4f9c                	lw	a5,24(a5)
    800036ae:	873e                	mv	a4,a5
    800036b0:	4789                	li	a5,2
    800036b2:	00f71d63          	bne	a4,a5,800036cc <wakeup+0x7e>
    800036b6:	fe843783          	ld	a5,-24(s0)
    800036ba:	739c                	ld	a5,32(a5)
    800036bc:	fd843703          	ld	a4,-40(s0)
    800036c0:	00f71663          	bne	a4,a5,800036cc <wakeup+0x7e>
        p->state = RUNNABLE;
    800036c4:	fe843783          	ld	a5,-24(s0)
    800036c8:	470d                	li	a4,3
    800036ca:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800036cc:	fe843783          	ld	a5,-24(s0)
    800036d0:	853e                	mv	a0,a5
    800036d2:	ffffe097          	auipc	ra,0xffffe
    800036d6:	cce080e7          	jalr	-818(ra) # 800013a0 <release>
    800036da:	a011                	j	800036de <wakeup+0x90>
        continue;
    800036dc:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    800036de:	fe843783          	ld	a5,-24(s0)
    800036e2:	16878793          	addi	a5,a5,360
    800036e6:	fef43423          	sd	a5,-24(s0)
    800036ea:	fe843703          	ld	a4,-24(s0)
    800036ee:	00017797          	auipc	a5,0x17
    800036f2:	36a78793          	addi	a5,a5,874 # 8001aa58 <pid_lock>
    800036f6:	f6f769e3          	bltu	a4,a5,80003668 <wakeup+0x1a>
    }
  }
}
    800036fa:	0001                	nop
    800036fc:	0001                	nop
    800036fe:	70a2                	ld	ra,40(sp)
    80003700:	7402                	ld	s0,32(sp)
    80003702:	6145                	addi	sp,sp,48
    80003704:	8082                	ret

0000000080003706 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003706:	7179                	addi	sp,sp,-48
    80003708:	f406                	sd	ra,40(sp)
    8000370a:	f022                	sd	s0,32(sp)
    8000370c:	1800                	addi	s0,sp,48
    8000370e:	87aa                	mv	a5,a0
    80003710:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003714:	00012797          	auipc	a5,0x12
    80003718:	94478793          	addi	a5,a5,-1724 # 80015058 <proc>
    8000371c:	fef43423          	sd	a5,-24(s0)
    80003720:	a0ad                	j	8000378a <kill+0x84>
    acquire(&p->lock);
    80003722:	fe843783          	ld	a5,-24(s0)
    80003726:	853e                	mv	a0,a5
    80003728:	ffffe097          	auipc	ra,0xffffe
    8000372c:	c14080e7          	jalr	-1004(ra) # 8000133c <acquire>
    if(p->pid == pid){
    80003730:	fe843783          	ld	a5,-24(s0)
    80003734:	5b98                	lw	a4,48(a5)
    80003736:	fdc42783          	lw	a5,-36(s0)
    8000373a:	2781                	sext.w	a5,a5
    8000373c:	02e79a63          	bne	a5,a4,80003770 <kill+0x6a>
      p->killed = 1;
    80003740:	fe843783          	ld	a5,-24(s0)
    80003744:	4705                	li	a4,1
    80003746:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    80003748:	fe843783          	ld	a5,-24(s0)
    8000374c:	4f9c                	lw	a5,24(a5)
    8000374e:	873e                	mv	a4,a5
    80003750:	4789                	li	a5,2
    80003752:	00f71663          	bne	a4,a5,8000375e <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    80003756:	fe843783          	ld	a5,-24(s0)
    8000375a:	470d                	li	a4,3
    8000375c:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    8000375e:	fe843783          	ld	a5,-24(s0)
    80003762:	853e                	mv	a0,a5
    80003764:	ffffe097          	auipc	ra,0xffffe
    80003768:	c3c080e7          	jalr	-964(ra) # 800013a0 <release>
      return 0;
    8000376c:	4781                	li	a5,0
    8000376e:	a03d                	j	8000379c <kill+0x96>
    }
    release(&p->lock);
    80003770:	fe843783          	ld	a5,-24(s0)
    80003774:	853e                	mv	a0,a5
    80003776:	ffffe097          	auipc	ra,0xffffe
    8000377a:	c2a080e7          	jalr	-982(ra) # 800013a0 <release>
  for(p = proc; p < &proc[NPROC]; p++){
    8000377e:	fe843783          	ld	a5,-24(s0)
    80003782:	16878793          	addi	a5,a5,360
    80003786:	fef43423          	sd	a5,-24(s0)
    8000378a:	fe843703          	ld	a4,-24(s0)
    8000378e:	00017797          	auipc	a5,0x17
    80003792:	2ca78793          	addi	a5,a5,714 # 8001aa58 <pid_lock>
    80003796:	f8f766e3          	bltu	a4,a5,80003722 <kill+0x1c>
  }
  return -1;
    8000379a:	57fd                	li	a5,-1
}
    8000379c:	853e                	mv	a0,a5
    8000379e:	70a2                	ld	ra,40(sp)
    800037a0:	7402                	ld	s0,32(sp)
    800037a2:	6145                	addi	sp,sp,48
    800037a4:	8082                	ret

00000000800037a6 <setkilled>:

void
setkilled(struct proc *p)
{
    800037a6:	1101                	addi	sp,sp,-32
    800037a8:	ec06                	sd	ra,24(sp)
    800037aa:	e822                	sd	s0,16(sp)
    800037ac:	1000                	addi	s0,sp,32
    800037ae:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800037b2:	fe843783          	ld	a5,-24(s0)
    800037b6:	853e                	mv	a0,a5
    800037b8:	ffffe097          	auipc	ra,0xffffe
    800037bc:	b84080e7          	jalr	-1148(ra) # 8000133c <acquire>
  p->killed = 1;
    800037c0:	fe843783          	ld	a5,-24(s0)
    800037c4:	4705                	li	a4,1
    800037c6:	d798                	sw	a4,40(a5)
  release(&p->lock);
    800037c8:	fe843783          	ld	a5,-24(s0)
    800037cc:	853e                	mv	a0,a5
    800037ce:	ffffe097          	auipc	ra,0xffffe
    800037d2:	bd2080e7          	jalr	-1070(ra) # 800013a0 <release>
}
    800037d6:	0001                	nop
    800037d8:	60e2                	ld	ra,24(sp)
    800037da:	6442                	ld	s0,16(sp)
    800037dc:	6105                	addi	sp,sp,32
    800037de:	8082                	ret

00000000800037e0 <killed>:

int
killed(struct proc *p)
{
    800037e0:	7179                	addi	sp,sp,-48
    800037e2:	f406                	sd	ra,40(sp)
    800037e4:	f022                	sd	s0,32(sp)
    800037e6:	1800                	addi	s0,sp,48
    800037e8:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    800037ec:	fd843783          	ld	a5,-40(s0)
    800037f0:	853e                	mv	a0,a5
    800037f2:	ffffe097          	auipc	ra,0xffffe
    800037f6:	b4a080e7          	jalr	-1206(ra) # 8000133c <acquire>
  k = p->killed;
    800037fa:	fd843783          	ld	a5,-40(s0)
    800037fe:	579c                	lw	a5,40(a5)
    80003800:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    80003804:	fd843783          	ld	a5,-40(s0)
    80003808:	853e                	mv	a0,a5
    8000380a:	ffffe097          	auipc	ra,0xffffe
    8000380e:	b96080e7          	jalr	-1130(ra) # 800013a0 <release>
  return k;
    80003812:	fec42783          	lw	a5,-20(s0)
}
    80003816:	853e                	mv	a0,a5
    80003818:	70a2                	ld	ra,40(sp)
    8000381a:	7402                	ld	s0,32(sp)
    8000381c:	6145                	addi	sp,sp,48
    8000381e:	8082                	ret

0000000080003820 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003820:	7139                	addi	sp,sp,-64
    80003822:	fc06                	sd	ra,56(sp)
    80003824:	f822                	sd	s0,48(sp)
    80003826:	0080                	addi	s0,sp,64
    80003828:	87aa                	mv	a5,a0
    8000382a:	fcb43823          	sd	a1,-48(s0)
    8000382e:	fcc43423          	sd	a2,-56(s0)
    80003832:	fcd43023          	sd	a3,-64(s0)
    80003836:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000383a:	fffff097          	auipc	ra,0xfffff
    8000383e:	1d6080e7          	jalr	470(ra) # 80002a10 <myproc>
    80003842:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003846:	fdc42783          	lw	a5,-36(s0)
    8000384a:	2781                	sext.w	a5,a5
    8000384c:	c38d                	beqz	a5,8000386e <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    8000384e:	fe843783          	ld	a5,-24(s0)
    80003852:	6bbc                	ld	a5,80(a5)
    80003854:	fc043683          	ld	a3,-64(s0)
    80003858:	fc843603          	ld	a2,-56(s0)
    8000385c:	fd043583          	ld	a1,-48(s0)
    80003860:	853e                	mv	a0,a5
    80003862:	fffff097          	auipc	ra,0xfffff
    80003866:	c78080e7          	jalr	-904(ra) # 800024da <copyout>
    8000386a:	87aa                	mv	a5,a0
    8000386c:	a839                	j	8000388a <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    8000386e:	fd043783          	ld	a5,-48(s0)
    80003872:	fc043703          	ld	a4,-64(s0)
    80003876:	2701                	sext.w	a4,a4
    80003878:	863a                	mv	a2,a4
    8000387a:	fc843583          	ld	a1,-56(s0)
    8000387e:	853e                	mv	a0,a5
    80003880:	ffffe097          	auipc	ra,0xffffe
    80003884:	d74080e7          	jalr	-652(ra) # 800015f4 <memmove>
    return 0;
    80003888:	4781                	li	a5,0
  }
}
    8000388a:	853e                	mv	a0,a5
    8000388c:	70e2                	ld	ra,56(sp)
    8000388e:	7442                	ld	s0,48(sp)
    80003890:	6121                	addi	sp,sp,64
    80003892:	8082                	ret

0000000080003894 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    80003894:	7139                	addi	sp,sp,-64
    80003896:	fc06                	sd	ra,56(sp)
    80003898:	f822                	sd	s0,48(sp)
    8000389a:	0080                	addi	s0,sp,64
    8000389c:	fca43c23          	sd	a0,-40(s0)
    800038a0:	87ae                	mv	a5,a1
    800038a2:	fcc43423          	sd	a2,-56(s0)
    800038a6:	fcd43023          	sd	a3,-64(s0)
    800038aa:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    800038ae:	fffff097          	auipc	ra,0xfffff
    800038b2:	162080e7          	jalr	354(ra) # 80002a10 <myproc>
    800038b6:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    800038ba:	fd442783          	lw	a5,-44(s0)
    800038be:	2781                	sext.w	a5,a5
    800038c0:	c38d                	beqz	a5,800038e2 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    800038c2:	fe843783          	ld	a5,-24(s0)
    800038c6:	6bbc                	ld	a5,80(a5)
    800038c8:	fc043683          	ld	a3,-64(s0)
    800038cc:	fc843603          	ld	a2,-56(s0)
    800038d0:	fd843583          	ld	a1,-40(s0)
    800038d4:	853e                	mv	a0,a5
    800038d6:	fffff097          	auipc	ra,0xfffff
    800038da:	cd2080e7          	jalr	-814(ra) # 800025a8 <copyin>
    800038de:	87aa                	mv	a5,a0
    800038e0:	a839                	j	800038fe <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    800038e2:	fc843783          	ld	a5,-56(s0)
    800038e6:	fc043703          	ld	a4,-64(s0)
    800038ea:	2701                	sext.w	a4,a4
    800038ec:	863a                	mv	a2,a4
    800038ee:	85be                	mv	a1,a5
    800038f0:	fd843503          	ld	a0,-40(s0)
    800038f4:	ffffe097          	auipc	ra,0xffffe
    800038f8:	d00080e7          	jalr	-768(ra) # 800015f4 <memmove>
    return 0;
    800038fc:	4781                	li	a5,0
  }
}
    800038fe:	853e                	mv	a0,a5
    80003900:	70e2                	ld	ra,56(sp)
    80003902:	7442                	ld	s0,48(sp)
    80003904:	6121                	addi	sp,sp,64
    80003906:	8082                	ret

0000000080003908 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003908:	1101                	addi	sp,sp,-32
    8000390a:	ec06                	sd	ra,24(sp)
    8000390c:	e822                	sd	s0,16(sp)
    8000390e:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003910:	00009517          	auipc	a0,0x9
    80003914:	99050513          	addi	a0,a0,-1648 # 8000c2a0 <etext+0x2a0>
    80003918:	ffffd097          	auipc	ra,0xffffd
    8000391c:	11e080e7          	jalr	286(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003920:	00011797          	auipc	a5,0x11
    80003924:	73878793          	addi	a5,a5,1848 # 80015058 <proc>
    80003928:	fef43423          	sd	a5,-24(s0)
    8000392c:	a04d                	j	800039ce <procdump+0xc6>
    if(p->state == UNUSED)
    8000392e:	fe843783          	ld	a5,-24(s0)
    80003932:	4f9c                	lw	a5,24(a5)
    80003934:	c7d1                	beqz	a5,800039c0 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003936:	fe843783          	ld	a5,-24(s0)
    8000393a:	4f9c                	lw	a5,24(a5)
    8000393c:	873e                	mv	a4,a5
    8000393e:	4795                	li	a5,5
    80003940:	02e7ee63          	bltu	a5,a4,8000397c <procdump+0x74>
    80003944:	fe843783          	ld	a5,-24(s0)
    80003948:	4f9c                	lw	a5,24(a5)
    8000394a:	00009717          	auipc	a4,0x9
    8000394e:	f7670713          	addi	a4,a4,-138 # 8000c8c0 <states.1765>
    80003952:	1782                	slli	a5,a5,0x20
    80003954:	9381                	srli	a5,a5,0x20
    80003956:	078e                	slli	a5,a5,0x3
    80003958:	97ba                	add	a5,a5,a4
    8000395a:	639c                	ld	a5,0(a5)
    8000395c:	c385                	beqz	a5,8000397c <procdump+0x74>
      state = states[p->state];
    8000395e:	fe843783          	ld	a5,-24(s0)
    80003962:	4f9c                	lw	a5,24(a5)
    80003964:	00009717          	auipc	a4,0x9
    80003968:	f5c70713          	addi	a4,a4,-164 # 8000c8c0 <states.1765>
    8000396c:	1782                	slli	a5,a5,0x20
    8000396e:	9381                	srli	a5,a5,0x20
    80003970:	078e                	slli	a5,a5,0x3
    80003972:	97ba                	add	a5,a5,a4
    80003974:	639c                	ld	a5,0(a5)
    80003976:	fef43023          	sd	a5,-32(s0)
    8000397a:	a039                	j	80003988 <procdump+0x80>
    else
      state = "???";
    8000397c:	00009797          	auipc	a5,0x9
    80003980:	92c78793          	addi	a5,a5,-1748 # 8000c2a8 <etext+0x2a8>
    80003984:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003988:	fe843783          	ld	a5,-24(s0)
    8000398c:	5b98                	lw	a4,48(a5)
    8000398e:	fe843783          	ld	a5,-24(s0)
    80003992:	15878793          	addi	a5,a5,344
    80003996:	86be                	mv	a3,a5
    80003998:	fe043603          	ld	a2,-32(s0)
    8000399c:	85ba                	mv	a1,a4
    8000399e:	00009517          	auipc	a0,0x9
    800039a2:	91250513          	addi	a0,a0,-1774 # 8000c2b0 <etext+0x2b0>
    800039a6:	ffffd097          	auipc	ra,0xffffd
    800039aa:	090080e7          	jalr	144(ra) # 80000a36 <printf>
    printf("\n");
    800039ae:	00009517          	auipc	a0,0x9
    800039b2:	8f250513          	addi	a0,a0,-1806 # 8000c2a0 <etext+0x2a0>
    800039b6:	ffffd097          	auipc	ra,0xffffd
    800039ba:	080080e7          	jalr	128(ra) # 80000a36 <printf>
    800039be:	a011                	j	800039c2 <procdump+0xba>
      continue;
    800039c0:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    800039c2:	fe843783          	ld	a5,-24(s0)
    800039c6:	16878793          	addi	a5,a5,360
    800039ca:	fef43423          	sd	a5,-24(s0)
    800039ce:	fe843703          	ld	a4,-24(s0)
    800039d2:	00017797          	auipc	a5,0x17
    800039d6:	08678793          	addi	a5,a5,134 # 8001aa58 <pid_lock>
    800039da:	f4f76ae3          	bltu	a4,a5,8000392e <procdump+0x26>
  }
}
    800039de:	0001                	nop
    800039e0:	0001                	nop
    800039e2:	60e2                	ld	ra,24(sp)
    800039e4:	6442                	ld	s0,16(sp)
    800039e6:	6105                	addi	sp,sp,32
    800039e8:	8082                	ret

00000000800039ea <swtch>:
    800039ea:	00153023          	sd	ra,0(a0)
    800039ee:	00253423          	sd	sp,8(a0)
    800039f2:	e900                	sd	s0,16(a0)
    800039f4:	ed04                	sd	s1,24(a0)
    800039f6:	03253023          	sd	s2,32(a0)
    800039fa:	03353423          	sd	s3,40(a0)
    800039fe:	03453823          	sd	s4,48(a0)
    80003a02:	03553c23          	sd	s5,56(a0)
    80003a06:	05653023          	sd	s6,64(a0)
    80003a0a:	05753423          	sd	s7,72(a0)
    80003a0e:	05853823          	sd	s8,80(a0)
    80003a12:	05953c23          	sd	s9,88(a0)
    80003a16:	07a53023          	sd	s10,96(a0)
    80003a1a:	07b53423          	sd	s11,104(a0)
    80003a1e:	0005b083          	ld	ra,0(a1)
    80003a22:	0085b103          	ld	sp,8(a1)
    80003a26:	6980                	ld	s0,16(a1)
    80003a28:	6d84                	ld	s1,24(a1)
    80003a2a:	0205b903          	ld	s2,32(a1)
    80003a2e:	0285b983          	ld	s3,40(a1)
    80003a32:	0305ba03          	ld	s4,48(a1)
    80003a36:	0385ba83          	ld	s5,56(a1)
    80003a3a:	0405bb03          	ld	s6,64(a1)
    80003a3e:	0485bb83          	ld	s7,72(a1)
    80003a42:	0505bc03          	ld	s8,80(a1)
    80003a46:	0585bc83          	ld	s9,88(a1)
    80003a4a:	0605bd03          	ld	s10,96(a1)
    80003a4e:	0685bd83          	ld	s11,104(a1)
    80003a52:	8082                	ret

0000000080003a54 <r_sstatus>:
{
    80003a54:	1101                	addi	sp,sp,-32
    80003a56:	ec22                	sd	s0,24(sp)
    80003a58:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003a5a:	100027f3          	csrr	a5,sstatus
    80003a5e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a62:	fe843783          	ld	a5,-24(s0)
}
    80003a66:	853e                	mv	a0,a5
    80003a68:	6462                	ld	s0,24(sp)
    80003a6a:	6105                	addi	sp,sp,32
    80003a6c:	8082                	ret

0000000080003a6e <w_sstatus>:
{
    80003a6e:	1101                	addi	sp,sp,-32
    80003a70:	ec22                	sd	s0,24(sp)
    80003a72:	1000                	addi	s0,sp,32
    80003a74:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003a78:	fe843783          	ld	a5,-24(s0)
    80003a7c:	10079073          	csrw	sstatus,a5
}
    80003a80:	0001                	nop
    80003a82:	6462                	ld	s0,24(sp)
    80003a84:	6105                	addi	sp,sp,32
    80003a86:	8082                	ret

0000000080003a88 <r_sip>:
{
    80003a88:	1101                	addi	sp,sp,-32
    80003a8a:	ec22                	sd	s0,24(sp)
    80003a8c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003a8e:	144027f3          	csrr	a5,sip
    80003a92:	fef43423          	sd	a5,-24(s0)
  return x;
    80003a96:	fe843783          	ld	a5,-24(s0)
}
    80003a9a:	853e                	mv	a0,a5
    80003a9c:	6462                	ld	s0,24(sp)
    80003a9e:	6105                	addi	sp,sp,32
    80003aa0:	8082                	ret

0000000080003aa2 <w_sip>:
{
    80003aa2:	1101                	addi	sp,sp,-32
    80003aa4:	ec22                	sd	s0,24(sp)
    80003aa6:	1000                	addi	s0,sp,32
    80003aa8:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003aac:	fe843783          	ld	a5,-24(s0)
    80003ab0:	14479073          	csrw	sip,a5
}
    80003ab4:	0001                	nop
    80003ab6:	6462                	ld	s0,24(sp)
    80003ab8:	6105                	addi	sp,sp,32
    80003aba:	8082                	ret

0000000080003abc <w_sepc>:
{
    80003abc:	1101                	addi	sp,sp,-32
    80003abe:	ec22                	sd	s0,24(sp)
    80003ac0:	1000                	addi	s0,sp,32
    80003ac2:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003ac6:	fe843783          	ld	a5,-24(s0)
    80003aca:	14179073          	csrw	sepc,a5
}
    80003ace:	0001                	nop
    80003ad0:	6462                	ld	s0,24(sp)
    80003ad2:	6105                	addi	sp,sp,32
    80003ad4:	8082                	ret

0000000080003ad6 <r_sepc>:
{
    80003ad6:	1101                	addi	sp,sp,-32
    80003ad8:	ec22                	sd	s0,24(sp)
    80003ada:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003adc:	141027f3          	csrr	a5,sepc
    80003ae0:	fef43423          	sd	a5,-24(s0)
  return x;
    80003ae4:	fe843783          	ld	a5,-24(s0)
}
    80003ae8:	853e                	mv	a0,a5
    80003aea:	6462                	ld	s0,24(sp)
    80003aec:	6105                	addi	sp,sp,32
    80003aee:	8082                	ret

0000000080003af0 <w_stvec>:
{
    80003af0:	1101                	addi	sp,sp,-32
    80003af2:	ec22                	sd	s0,24(sp)
    80003af4:	1000                	addi	s0,sp,32
    80003af6:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003afa:	fe843783          	ld	a5,-24(s0)
    80003afe:	10579073          	csrw	stvec,a5
}
    80003b02:	0001                	nop
    80003b04:	6462                	ld	s0,24(sp)
    80003b06:	6105                	addi	sp,sp,32
    80003b08:	8082                	ret

0000000080003b0a <r_satp>:
{
    80003b0a:	1101                	addi	sp,sp,-32
    80003b0c:	ec22                	sd	s0,24(sp)
    80003b0e:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003b10:	180027f3          	csrr	a5,satp
    80003b14:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b18:	fe843783          	ld	a5,-24(s0)
}
    80003b1c:	853e                	mv	a0,a5
    80003b1e:	6462                	ld	s0,24(sp)
    80003b20:	6105                	addi	sp,sp,32
    80003b22:	8082                	ret

0000000080003b24 <r_scause>:
{
    80003b24:	1101                	addi	sp,sp,-32
    80003b26:	ec22                	sd	s0,24(sp)
    80003b28:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003b2a:	142027f3          	csrr	a5,scause
    80003b2e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b32:	fe843783          	ld	a5,-24(s0)
}
    80003b36:	853e                	mv	a0,a5
    80003b38:	6462                	ld	s0,24(sp)
    80003b3a:	6105                	addi	sp,sp,32
    80003b3c:	8082                	ret

0000000080003b3e <r_stval>:
{
    80003b3e:	1101                	addi	sp,sp,-32
    80003b40:	ec22                	sd	s0,24(sp)
    80003b42:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003b44:	143027f3          	csrr	a5,stval
    80003b48:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b4c:	fe843783          	ld	a5,-24(s0)
}
    80003b50:	853e                	mv	a0,a5
    80003b52:	6462                	ld	s0,24(sp)
    80003b54:	6105                	addi	sp,sp,32
    80003b56:	8082                	ret

0000000080003b58 <intr_on>:
{
    80003b58:	1141                	addi	sp,sp,-16
    80003b5a:	e406                	sd	ra,8(sp)
    80003b5c:	e022                	sd	s0,0(sp)
    80003b5e:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003b60:	00000097          	auipc	ra,0x0
    80003b64:	ef4080e7          	jalr	-268(ra) # 80003a54 <r_sstatus>
    80003b68:	87aa                	mv	a5,a0
    80003b6a:	0027e793          	ori	a5,a5,2
    80003b6e:	853e                	mv	a0,a5
    80003b70:	00000097          	auipc	ra,0x0
    80003b74:	efe080e7          	jalr	-258(ra) # 80003a6e <w_sstatus>
}
    80003b78:	0001                	nop
    80003b7a:	60a2                	ld	ra,8(sp)
    80003b7c:	6402                	ld	s0,0(sp)
    80003b7e:	0141                	addi	sp,sp,16
    80003b80:	8082                	ret

0000000080003b82 <intr_off>:
{
    80003b82:	1141                	addi	sp,sp,-16
    80003b84:	e406                	sd	ra,8(sp)
    80003b86:	e022                	sd	s0,0(sp)
    80003b88:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003b8a:	00000097          	auipc	ra,0x0
    80003b8e:	eca080e7          	jalr	-310(ra) # 80003a54 <r_sstatus>
    80003b92:	87aa                	mv	a5,a0
    80003b94:	9bf5                	andi	a5,a5,-3
    80003b96:	853e                	mv	a0,a5
    80003b98:	00000097          	auipc	ra,0x0
    80003b9c:	ed6080e7          	jalr	-298(ra) # 80003a6e <w_sstatus>
}
    80003ba0:	0001                	nop
    80003ba2:	60a2                	ld	ra,8(sp)
    80003ba4:	6402                	ld	s0,0(sp)
    80003ba6:	0141                	addi	sp,sp,16
    80003ba8:	8082                	ret

0000000080003baa <intr_get>:
{
    80003baa:	1101                	addi	sp,sp,-32
    80003bac:	ec06                	sd	ra,24(sp)
    80003bae:	e822                	sd	s0,16(sp)
    80003bb0:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003bb2:	00000097          	auipc	ra,0x0
    80003bb6:	ea2080e7          	jalr	-350(ra) # 80003a54 <r_sstatus>
    80003bba:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003bbe:	fe843783          	ld	a5,-24(s0)
    80003bc2:	8b89                	andi	a5,a5,2
    80003bc4:	00f037b3          	snez	a5,a5
    80003bc8:	0ff7f793          	andi	a5,a5,255
    80003bcc:	2781                	sext.w	a5,a5
}
    80003bce:	853e                	mv	a0,a5
    80003bd0:	60e2                	ld	ra,24(sp)
    80003bd2:	6442                	ld	s0,16(sp)
    80003bd4:	6105                	addi	sp,sp,32
    80003bd6:	8082                	ret

0000000080003bd8 <r_tp>:
{
    80003bd8:	1101                	addi	sp,sp,-32
    80003bda:	ec22                	sd	s0,24(sp)
    80003bdc:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003bde:	8792                	mv	a5,tp
    80003be0:	fef43423          	sd	a5,-24(s0)
  return x;
    80003be4:	fe843783          	ld	a5,-24(s0)
}
    80003be8:	853e                	mv	a0,a5
    80003bea:	6462                	ld	s0,24(sp)
    80003bec:	6105                	addi	sp,sp,32
    80003bee:	8082                	ret

0000000080003bf0 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003bf0:	1141                	addi	sp,sp,-16
    80003bf2:	e406                	sd	ra,8(sp)
    80003bf4:	e022                	sd	s0,0(sp)
    80003bf6:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003bf8:	00008597          	auipc	a1,0x8
    80003bfc:	70058593          	addi	a1,a1,1792 # 8000c2f8 <etext+0x2f8>
    80003c00:	00017517          	auipc	a0,0x17
    80003c04:	e8850513          	addi	a0,a0,-376 # 8001aa88 <tickslock>
    80003c08:	ffffd097          	auipc	ra,0xffffd
    80003c0c:	704080e7          	jalr	1796(ra) # 8000130c <initlock>
}
    80003c10:	0001                	nop
    80003c12:	60a2                	ld	ra,8(sp)
    80003c14:	6402                	ld	s0,0(sp)
    80003c16:	0141                	addi	sp,sp,16
    80003c18:	8082                	ret

0000000080003c1a <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003c1a:	1141                	addi	sp,sp,-16
    80003c1c:	e406                	sd	ra,8(sp)
    80003c1e:	e022                	sd	s0,0(sp)
    80003c20:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003c22:	00005797          	auipc	a5,0x5
    80003c26:	e0e78793          	addi	a5,a5,-498 # 80008a30 <kernelvec>
    80003c2a:	853e                	mv	a0,a5
    80003c2c:	00000097          	auipc	ra,0x0
    80003c30:	ec4080e7          	jalr	-316(ra) # 80003af0 <w_stvec>
}
    80003c34:	0001                	nop
    80003c36:	60a2                	ld	ra,8(sp)
    80003c38:	6402                	ld	s0,0(sp)
    80003c3a:	0141                	addi	sp,sp,16
    80003c3c:	8082                	ret

0000000080003c3e <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003c3e:	715d                	addi	sp,sp,-80
    80003c40:	e486                	sd	ra,72(sp)
    80003c42:	e0a2                	sd	s0,64(sp)
    80003c44:	fc26                	sd	s1,56(sp)
    80003c46:	0880                	addi	s0,sp,80
  int which_dev = 0;
    80003c48:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003c4c:	00000097          	auipc	ra,0x0
    80003c50:	e08080e7          	jalr	-504(ra) # 80003a54 <r_sstatus>
    80003c54:	87aa                	mv	a5,a0
    80003c56:	1007f793          	andi	a5,a5,256
    80003c5a:	cb89                	beqz	a5,80003c6c <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003c5c:	00008517          	auipc	a0,0x8
    80003c60:	6a450513          	addi	a0,a0,1700 # 8000c300 <etext+0x300>
    80003c64:	ffffd097          	auipc	ra,0xffffd
    80003c68:	028080e7          	jalr	40(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003c6c:	00005797          	auipc	a5,0x5
    80003c70:	dc478793          	addi	a5,a5,-572 # 80008a30 <kernelvec>
    80003c74:	853e                	mv	a0,a5
    80003c76:	00000097          	auipc	ra,0x0
    80003c7a:	e7a080e7          	jalr	-390(ra) # 80003af0 <w_stvec>

  struct proc *p = myproc();
    80003c7e:	fffff097          	auipc	ra,0xfffff
    80003c82:	d92080e7          	jalr	-622(ra) # 80002a10 <myproc>
    80003c86:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003c8a:	fd043783          	ld	a5,-48(s0)
    80003c8e:	6fa4                	ld	s1,88(a5)
    80003c90:	00000097          	auipc	ra,0x0
    80003c94:	e46080e7          	jalr	-442(ra) # 80003ad6 <r_sepc>
    80003c98:	87aa                	mv	a5,a0
    80003c9a:	ec9c                	sd	a5,24(s1)

  uint64 scause = r_scause();
    80003c9c:	00000097          	auipc	ra,0x0
    80003ca0:	e88080e7          	jalr	-376(ra) # 80003b24 <r_scause>
    80003ca4:	fca43423          	sd	a0,-56(s0)

  if(scause == 13) {
    80003ca8:	fc843703          	ld	a4,-56(s0)
    80003cac:	47b5                	li	a5,13
    80003cae:	04f71063          	bne	a4,a5,80003cee <usertrap+0xb0>
    // page fault

    uint64 va = (uint64)r_stval();
    80003cb2:	00000097          	auipc	ra,0x0
    80003cb6:	e8c080e7          	jalr	-372(ra) # 80003b3e <r_stval>
    80003cba:	fca43023          	sd	a0,-64(s0)
    int pfhandled = swapin(va, p->pagetable);
    80003cbe:	fd043783          	ld	a5,-48(s0)
    80003cc2:	6bbc                	ld	a5,80(a5)
    80003cc4:	85be                	mv	a1,a5
    80003cc6:	fc043503          	ld	a0,-64(s0)
    80003cca:	00007097          	auipc	ra,0x7
    80003cce:	ae6080e7          	jalr	-1306(ra) # 8000a7b0 <swapin>
    80003cd2:	87aa                	mv	a5,a0
    80003cd4:	faf42e23          	sw	a5,-68(s0)
    if(pfhandled == 0)
    80003cd8:	fbc42783          	lw	a5,-68(s0)
    80003cdc:	2781                	sext.w	a5,a5
    80003cde:	e3f9                	bnez	a5,80003da4 <usertrap+0x166>
      setkilled(p);
    80003ce0:	fd043503          	ld	a0,-48(s0)
    80003ce4:	00000097          	auipc	ra,0x0
    80003ce8:	ac2080e7          	jalr	-1342(ra) # 800037a6 <setkilled>
    80003cec:	a865                	j	80003da4 <usertrap+0x166>
  } else if(scause == 8) {
    80003cee:	fc843703          	ld	a4,-56(s0)
    80003cf2:	47a1                	li	a5,8
    80003cf4:	04f71163          	bne	a4,a5,80003d36 <usertrap+0xf8>
    // system call

    if(killed(p))
    80003cf8:	fd043503          	ld	a0,-48(s0)
    80003cfc:	00000097          	auipc	ra,0x0
    80003d00:	ae4080e7          	jalr	-1308(ra) # 800037e0 <killed>
    80003d04:	87aa                	mv	a5,a0
    80003d06:	c791                	beqz	a5,80003d12 <usertrap+0xd4>
      exit(-1);
    80003d08:	557d                	li	a0,-1
    80003d0a:	fffff097          	auipc	ra,0xfffff
    80003d0e:	3f8080e7          	jalr	1016(ra) # 80003102 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003d12:	fd043783          	ld	a5,-48(s0)
    80003d16:	6fbc                	ld	a5,88(a5)
    80003d18:	6f98                	ld	a4,24(a5)
    80003d1a:	fd043783          	ld	a5,-48(s0)
    80003d1e:	6fbc                	ld	a5,88(a5)
    80003d20:	0711                	addi	a4,a4,4
    80003d22:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003d24:	00000097          	auipc	ra,0x0
    80003d28:	e34080e7          	jalr	-460(ra) # 80003b58 <intr_on>

    syscall();
    80003d2c:	00000097          	auipc	ra,0x0
    80003d30:	6a8080e7          	jalr	1704(ra) # 800043d4 <syscall>
    80003d34:	a885                	j	80003da4 <usertrap+0x166>
  } else if((which_dev = devintr()) != 0){
    80003d36:	00000097          	auipc	ra,0x0
    80003d3a:	36e080e7          	jalr	878(ra) # 800040a4 <devintr>
    80003d3e:	87aa                	mv	a5,a0
    80003d40:	fcf42e23          	sw	a5,-36(s0)
    80003d44:	fdc42783          	lw	a5,-36(s0)
    80003d48:	2781                	sext.w	a5,a5
    80003d4a:	efa9                	bnez	a5,80003da4 <usertrap+0x166>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003d4c:	00000097          	auipc	ra,0x0
    80003d50:	dd8080e7          	jalr	-552(ra) # 80003b24 <r_scause>
    80003d54:	872a                	mv	a4,a0
    80003d56:	fd043783          	ld	a5,-48(s0)
    80003d5a:	5b9c                	lw	a5,48(a5)
    80003d5c:	863e                	mv	a2,a5
    80003d5e:	85ba                	mv	a1,a4
    80003d60:	00008517          	auipc	a0,0x8
    80003d64:	5c050513          	addi	a0,a0,1472 # 8000c320 <etext+0x320>
    80003d68:	ffffd097          	auipc	ra,0xffffd
    80003d6c:	cce080e7          	jalr	-818(ra) # 80000a36 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	d66080e7          	jalr	-666(ra) # 80003ad6 <r_sepc>
    80003d78:	84aa                	mv	s1,a0
    80003d7a:	00000097          	auipc	ra,0x0
    80003d7e:	dc4080e7          	jalr	-572(ra) # 80003b3e <r_stval>
    80003d82:	87aa                	mv	a5,a0
    80003d84:	863e                	mv	a2,a5
    80003d86:	85a6                	mv	a1,s1
    80003d88:	00008517          	auipc	a0,0x8
    80003d8c:	5c850513          	addi	a0,a0,1480 # 8000c350 <etext+0x350>
    80003d90:	ffffd097          	auipc	ra,0xffffd
    80003d94:	ca6080e7          	jalr	-858(ra) # 80000a36 <printf>
    setkilled(p);
    80003d98:	fd043503          	ld	a0,-48(s0)
    80003d9c:	00000097          	auipc	ra,0x0
    80003da0:	a0a080e7          	jalr	-1526(ra) # 800037a6 <setkilled>
  }

  if(killed(p))
    80003da4:	fd043503          	ld	a0,-48(s0)
    80003da8:	00000097          	auipc	ra,0x0
    80003dac:	a38080e7          	jalr	-1480(ra) # 800037e0 <killed>
    80003db0:	87aa                	mv	a5,a0
    80003db2:	c791                	beqz	a5,80003dbe <usertrap+0x180>
    exit(-1);
    80003db4:	557d                	li	a0,-1
    80003db6:	fffff097          	auipc	ra,0xfffff
    80003dba:	34c080e7          	jalr	844(ra) # 80003102 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003dbe:	fdc42783          	lw	a5,-36(s0)
    80003dc2:	0007871b          	sext.w	a4,a5
    80003dc6:	4789                	li	a5,2
    80003dc8:	00f71663          	bne	a4,a5,80003dd4 <usertrap+0x196>
    yield();
    80003dcc:	fffff097          	auipc	ra,0xfffff
    80003dd0:	76c080e7          	jalr	1900(ra) # 80003538 <yield>

  usertrapret();
    80003dd4:	00000097          	auipc	ra,0x0
    80003dd8:	014080e7          	jalr	20(ra) # 80003de8 <usertrapret>
}
    80003ddc:	0001                	nop
    80003dde:	60a6                	ld	ra,72(sp)
    80003de0:	6406                	ld	s0,64(sp)
    80003de2:	74e2                	ld	s1,56(sp)
    80003de4:	6161                	addi	sp,sp,80
    80003de6:	8082                	ret

0000000080003de8 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003de8:	715d                	addi	sp,sp,-80
    80003dea:	e486                	sd	ra,72(sp)
    80003dec:	e0a2                	sd	s0,64(sp)
    80003dee:	fc26                	sd	s1,56(sp)
    80003df0:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003df2:	fffff097          	auipc	ra,0xfffff
    80003df6:	c1e080e7          	jalr	-994(ra) # 80002a10 <myproc>
    80003dfa:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003dfe:	00000097          	auipc	ra,0x0
    80003e02:	d84080e7          	jalr	-636(ra) # 80003b82 <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003e06:	00007717          	auipc	a4,0x7
    80003e0a:	1fa70713          	addi	a4,a4,506 # 8000b000 <_trampoline>
    80003e0e:	00007797          	auipc	a5,0x7
    80003e12:	1f278793          	addi	a5,a5,498 # 8000b000 <_trampoline>
    80003e16:	8f1d                	sub	a4,a4,a5
    80003e18:	040007b7          	lui	a5,0x4000
    80003e1c:	17fd                	addi	a5,a5,-1
    80003e1e:	07b2                	slli	a5,a5,0xc
    80003e20:	97ba                	add	a5,a5,a4
    80003e22:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003e26:	fd043503          	ld	a0,-48(s0)
    80003e2a:	00000097          	auipc	ra,0x0
    80003e2e:	cc6080e7          	jalr	-826(ra) # 80003af0 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003e32:	fd843783          	ld	a5,-40(s0)
    80003e36:	6fa4                	ld	s1,88(a5)
    80003e38:	00000097          	auipc	ra,0x0
    80003e3c:	cd2080e7          	jalr	-814(ra) # 80003b0a <r_satp>
    80003e40:	87aa                	mv	a5,a0
    80003e42:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003e44:	fd843783          	ld	a5,-40(s0)
    80003e48:	63b4                	ld	a3,64(a5)
    80003e4a:	fd843783          	ld	a5,-40(s0)
    80003e4e:	6fbc                	ld	a5,88(a5)
    80003e50:	6705                	lui	a4,0x1
    80003e52:	9736                	add	a4,a4,a3
    80003e54:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003e56:	fd843783          	ld	a5,-40(s0)
    80003e5a:	6fbc                	ld	a5,88(a5)
    80003e5c:	00000717          	auipc	a4,0x0
    80003e60:	de270713          	addi	a4,a4,-542 # 80003c3e <usertrap>
    80003e64:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003e66:	fd843783          	ld	a5,-40(s0)
    80003e6a:	6fa4                	ld	s1,88(a5)
    80003e6c:	00000097          	auipc	ra,0x0
    80003e70:	d6c080e7          	jalr	-660(ra) # 80003bd8 <r_tp>
    80003e74:	87aa                	mv	a5,a0
    80003e76:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003e78:	00000097          	auipc	ra,0x0
    80003e7c:	bdc080e7          	jalr	-1060(ra) # 80003a54 <r_sstatus>
    80003e80:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003e84:	fc843783          	ld	a5,-56(s0)
    80003e88:	eff7f793          	andi	a5,a5,-257
    80003e8c:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003e90:	fc843783          	ld	a5,-56(s0)
    80003e94:	0207e793          	ori	a5,a5,32
    80003e98:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003e9c:	fc843503          	ld	a0,-56(s0)
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	bce080e7          	jalr	-1074(ra) # 80003a6e <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003ea8:	fd843783          	ld	a5,-40(s0)
    80003eac:	6fbc                	ld	a5,88(a5)
    80003eae:	6f9c                	ld	a5,24(a5)
    80003eb0:	853e                	mv	a0,a5
    80003eb2:	00000097          	auipc	ra,0x0
    80003eb6:	c0a080e7          	jalr	-1014(ra) # 80003abc <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003eba:	fd843783          	ld	a5,-40(s0)
    80003ebe:	6bbc                	ld	a5,80(a5)
    80003ec0:	00c7d713          	srli	a4,a5,0xc
    80003ec4:	57fd                	li	a5,-1
    80003ec6:	17fe                	slli	a5,a5,0x3f
    80003ec8:	8fd9                	or	a5,a5,a4
    80003eca:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003ece:	00007717          	auipc	a4,0x7
    80003ed2:	1ce70713          	addi	a4,a4,462 # 8000b09c <userret>
    80003ed6:	00007797          	auipc	a5,0x7
    80003eda:	12a78793          	addi	a5,a5,298 # 8000b000 <_trampoline>
    80003ede:	8f1d                	sub	a4,a4,a5
    80003ee0:	040007b7          	lui	a5,0x4000
    80003ee4:	17fd                	addi	a5,a5,-1
    80003ee6:	07b2                	slli	a5,a5,0xc
    80003ee8:	97ba                	add	a5,a5,a4
    80003eea:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003eee:	fb843783          	ld	a5,-72(s0)
    80003ef2:	fc043503          	ld	a0,-64(s0)
    80003ef6:	9782                	jalr	a5
}
    80003ef8:	0001                	nop
    80003efa:	60a6                	ld	ra,72(sp)
    80003efc:	6406                	ld	s0,64(sp)
    80003efe:	74e2                	ld	s1,56(sp)
    80003f00:	6161                	addi	sp,sp,80
    80003f02:	8082                	ret

0000000080003f04 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003f04:	7139                	addi	sp,sp,-64
    80003f06:	fc06                	sd	ra,56(sp)
    80003f08:	f822                	sd	s0,48(sp)
    80003f0a:	f426                	sd	s1,40(sp)
    80003f0c:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003f0e:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003f12:	00000097          	auipc	ra,0x0
    80003f16:	bc4080e7          	jalr	-1084(ra) # 80003ad6 <r_sepc>
    80003f1a:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003f1e:	00000097          	auipc	ra,0x0
    80003f22:	b36080e7          	jalr	-1226(ra) # 80003a54 <r_sstatus>
    80003f26:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003f2a:	00000097          	auipc	ra,0x0
    80003f2e:	bfa080e7          	jalr	-1030(ra) # 80003b24 <r_scause>
    80003f32:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003f36:	fc843783          	ld	a5,-56(s0)
    80003f3a:	1007f793          	andi	a5,a5,256
    80003f3e:	eb89                	bnez	a5,80003f50 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003f40:	00008517          	auipc	a0,0x8
    80003f44:	43050513          	addi	a0,a0,1072 # 8000c370 <etext+0x370>
    80003f48:	ffffd097          	auipc	ra,0xffffd
    80003f4c:	d44080e7          	jalr	-700(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    80003f50:	00000097          	auipc	ra,0x0
    80003f54:	c5a080e7          	jalr	-934(ra) # 80003baa <intr_get>
    80003f58:	87aa                	mv	a5,a0
    80003f5a:	cb89                	beqz	a5,80003f6c <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003f5c:	00008517          	auipc	a0,0x8
    80003f60:	43c50513          	addi	a0,a0,1084 # 8000c398 <etext+0x398>
    80003f64:	ffffd097          	auipc	ra,0xffffd
    80003f68:	d28080e7          	jalr	-728(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    80003f6c:	00000097          	auipc	ra,0x0
    80003f70:	138080e7          	jalr	312(ra) # 800040a4 <devintr>
    80003f74:	87aa                	mv	a5,a0
    80003f76:	fcf42e23          	sw	a5,-36(s0)
    80003f7a:	fdc42783          	lw	a5,-36(s0)
    80003f7e:	2781                	sext.w	a5,a5
    80003f80:	e7b9                	bnez	a5,80003fce <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003f82:	fc043583          	ld	a1,-64(s0)
    80003f86:	00008517          	auipc	a0,0x8
    80003f8a:	43250513          	addi	a0,a0,1074 # 8000c3b8 <etext+0x3b8>
    80003f8e:	ffffd097          	auipc	ra,0xffffd
    80003f92:	aa8080e7          	jalr	-1368(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003f96:	00000097          	auipc	ra,0x0
    80003f9a:	b40080e7          	jalr	-1216(ra) # 80003ad6 <r_sepc>
    80003f9e:	84aa                	mv	s1,a0
    80003fa0:	00000097          	auipc	ra,0x0
    80003fa4:	b9e080e7          	jalr	-1122(ra) # 80003b3e <r_stval>
    80003fa8:	87aa                	mv	a5,a0
    80003faa:	863e                	mv	a2,a5
    80003fac:	85a6                	mv	a1,s1
    80003fae:	00008517          	auipc	a0,0x8
    80003fb2:	41a50513          	addi	a0,a0,1050 # 8000c3c8 <etext+0x3c8>
    80003fb6:	ffffd097          	auipc	ra,0xffffd
    80003fba:	a80080e7          	jalr	-1408(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80003fbe:	00008517          	auipc	a0,0x8
    80003fc2:	42250513          	addi	a0,a0,1058 # 8000c3e0 <etext+0x3e0>
    80003fc6:	ffffd097          	auipc	ra,0xffffd
    80003fca:	cc6080e7          	jalr	-826(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    80003fce:	fdc42783          	lw	a5,-36(s0)
    80003fd2:	0007871b          	sext.w	a4,a5
    80003fd6:	4789                	li	a5,2
    80003fd8:	02f71663          	bne	a4,a5,80004004 <kerneltrap+0x100>
    80003fdc:	fffff097          	auipc	ra,0xfffff
    80003fe0:	a34080e7          	jalr	-1484(ra) # 80002a10 <myproc>
    80003fe4:	87aa                	mv	a5,a0
    80003fe6:	cf99                	beqz	a5,80004004 <kerneltrap+0x100>
    80003fe8:	fffff097          	auipc	ra,0xfffff
    80003fec:	a28080e7          	jalr	-1496(ra) # 80002a10 <myproc>
    80003ff0:	87aa                	mv	a5,a0
    80003ff2:	4f9c                	lw	a5,24(a5)
    80003ff4:	873e                	mv	a4,a5
    80003ff6:	4791                	li	a5,4
    80003ff8:	00f71663          	bne	a4,a5,80004004 <kerneltrap+0x100>
    yield();
    80003ffc:	fffff097          	auipc	ra,0xfffff
    80004000:	53c080e7          	jalr	1340(ra) # 80003538 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80004004:	fd043503          	ld	a0,-48(s0)
    80004008:	00000097          	auipc	ra,0x0
    8000400c:	ab4080e7          	jalr	-1356(ra) # 80003abc <w_sepc>
  w_sstatus(sstatus);
    80004010:	fc843503          	ld	a0,-56(s0)
    80004014:	00000097          	auipc	ra,0x0
    80004018:	a5a080e7          	jalr	-1446(ra) # 80003a6e <w_sstatus>
}
    8000401c:	0001                	nop
    8000401e:	70e2                	ld	ra,56(sp)
    80004020:	7442                	ld	s0,48(sp)
    80004022:	74a2                	ld	s1,40(sp)
    80004024:	6121                	addi	sp,sp,64
    80004026:	8082                	ret

0000000080004028 <clockintr>:

void
clockintr()
{
    80004028:	1141                	addi	sp,sp,-16
    8000402a:	e406                	sd	ra,8(sp)
    8000402c:	e022                	sd	s0,0(sp)
    8000402e:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004030:	00017517          	auipc	a0,0x17
    80004034:	a5850513          	addi	a0,a0,-1448 # 8001aa88 <tickslock>
    80004038:	ffffd097          	auipc	ra,0xffffd
    8000403c:	304080e7          	jalr	772(ra) # 8000133c <acquire>
  ticks++;
    80004040:	00009797          	auipc	a5,0x9
    80004044:	9a878793          	addi	a5,a5,-1624 # 8000c9e8 <ticks>
    80004048:	439c                	lw	a5,0(a5)
    8000404a:	2785                	addiw	a5,a5,1
    8000404c:	0007871b          	sext.w	a4,a5
    80004050:	00009797          	auipc	a5,0x9
    80004054:	99878793          	addi	a5,a5,-1640 # 8000c9e8 <ticks>
    80004058:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    8000405a:	00009797          	auipc	a5,0x9
    8000405e:	98e78793          	addi	a5,a5,-1650 # 8000c9e8 <ticks>
    80004062:	439c                	lw	a5,0(a5)
    80004064:	873e                	mv	a4,a5
    80004066:	06400793          	li	a5,100
    8000406a:	02f777bb          	remuw	a5,a4,a5
    8000406e:	2781                	sext.w	a5,a5
    80004070:	e789                	bnez	a5,8000407a <clockintr+0x52>
  {
    updaterefhistory();
    80004072:	00006097          	auipc	ra,0x6
    80004076:	488080e7          	jalr	1160(ra) # 8000a4fa <updaterefhistory>
  }

  wakeup(&ticks);
    8000407a:	00009517          	auipc	a0,0x9
    8000407e:	96e50513          	addi	a0,a0,-1682 # 8000c9e8 <ticks>
    80004082:	fffff097          	auipc	ra,0xfffff
    80004086:	5cc080e7          	jalr	1484(ra) # 8000364e <wakeup>
  release(&tickslock);
    8000408a:	00017517          	auipc	a0,0x17
    8000408e:	9fe50513          	addi	a0,a0,-1538 # 8001aa88 <tickslock>
    80004092:	ffffd097          	auipc	ra,0xffffd
    80004096:	30e080e7          	jalr	782(ra) # 800013a0 <release>
}
    8000409a:	0001                	nop
    8000409c:	60a2                	ld	ra,8(sp)
    8000409e:	6402                	ld	s0,0(sp)
    800040a0:	0141                	addi	sp,sp,16
    800040a2:	8082                	ret

00000000800040a4 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    800040a4:	1101                	addi	sp,sp,-32
    800040a6:	ec06                	sd	ra,24(sp)
    800040a8:	e822                	sd	s0,16(sp)
    800040aa:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    800040ac:	00000097          	auipc	ra,0x0
    800040b0:	a78080e7          	jalr	-1416(ra) # 80003b24 <r_scause>
    800040b4:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    800040b8:	fe843783          	ld	a5,-24(s0)
    800040bc:	0a07d263          	bgez	a5,80004160 <devintr+0xbc>
     (scause & 0xff) == 9){
    800040c0:	fe843783          	ld	a5,-24(s0)
    800040c4:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    800040c8:	47a5                	li	a5,9
    800040ca:	08f71b63          	bne	a4,a5,80004160 <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    800040ce:	00005097          	auipc	ra,0x5
    800040d2:	a9e080e7          	jalr	-1378(ra) # 80008b6c <plic_claim>
    800040d6:	87aa                	mv	a5,a0
    800040d8:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    800040dc:	fe442783          	lw	a5,-28(s0)
    800040e0:	0007871b          	sext.w	a4,a5
    800040e4:	47a9                	li	a5,10
    800040e6:	00f71763          	bne	a4,a5,800040f4 <devintr+0x50>
      uartintr();
    800040ea:	ffffd097          	auipc	ra,0xffffd
    800040ee:	f44080e7          	jalr	-188(ra) # 8000102e <uartintr>
    800040f2:	a891                	j	80004146 <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    800040f4:	fe442783          	lw	a5,-28(s0)
    800040f8:	0007871b          	sext.w	a4,a5
    800040fc:	4785                	li	a5,1
    800040fe:	00f71863          	bne	a4,a5,8000410e <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004102:	4501                	li	a0,0
    80004104:	00006097          	auipc	ra,0x6
    80004108:	efa080e7          	jalr	-262(ra) # 80009ffe <virtio_disk_intr>
    8000410c:	a82d                	j	80004146 <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    8000410e:	fe442783          	lw	a5,-28(s0)
    80004112:	0007871b          	sext.w	a4,a5
    80004116:	4789                	li	a5,2
    80004118:	00f71863          	bne	a4,a5,80004128 <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    8000411c:	4505                	li	a0,1
    8000411e:	00006097          	auipc	ra,0x6
    80004122:	ee0080e7          	jalr	-288(ra) # 80009ffe <virtio_disk_intr>
    80004126:	a005                	j	80004146 <devintr+0xa2>
    } else if(irq){
    80004128:	fe442783          	lw	a5,-28(s0)
    8000412c:	2781                	sext.w	a5,a5
    8000412e:	cf81                	beqz	a5,80004146 <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    80004130:	fe442783          	lw	a5,-28(s0)
    80004134:	85be                	mv	a1,a5
    80004136:	00008517          	auipc	a0,0x8
    8000413a:	2ba50513          	addi	a0,a0,698 # 8000c3f0 <etext+0x3f0>
    8000413e:	ffffd097          	auipc	ra,0xffffd
    80004142:	8f8080e7          	jalr	-1800(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80004146:	fe442783          	lw	a5,-28(s0)
    8000414a:	2781                	sext.w	a5,a5
    8000414c:	cb81                	beqz	a5,8000415c <devintr+0xb8>
      plic_complete(irq);
    8000414e:	fe442783          	lw	a5,-28(s0)
    80004152:	853e                	mv	a0,a5
    80004154:	00005097          	auipc	ra,0x5
    80004158:	a56080e7          	jalr	-1450(ra) # 80008baa <plic_complete>

    return 1;
    8000415c:	4785                	li	a5,1
    8000415e:	a081                	j	8000419e <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    80004160:	fe843703          	ld	a4,-24(s0)
    80004164:	57fd                	li	a5,-1
    80004166:	17fe                	slli	a5,a5,0x3f
    80004168:	0785                	addi	a5,a5,1
    8000416a:	02f71963          	bne	a4,a5,8000419c <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    8000416e:	fffff097          	auipc	ra,0xfffff
    80004172:	844080e7          	jalr	-1980(ra) # 800029b2 <cpuid>
    80004176:	87aa                	mv	a5,a0
    80004178:	e789                	bnez	a5,80004182 <devintr+0xde>
      clockintr();
    8000417a:	00000097          	auipc	ra,0x0
    8000417e:	eae080e7          	jalr	-338(ra) # 80004028 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    80004182:	00000097          	auipc	ra,0x0
    80004186:	906080e7          	jalr	-1786(ra) # 80003a88 <r_sip>
    8000418a:	87aa                	mv	a5,a0
    8000418c:	9bf5                	andi	a5,a5,-3
    8000418e:	853e                	mv	a0,a5
    80004190:	00000097          	auipc	ra,0x0
    80004194:	912080e7          	jalr	-1774(ra) # 80003aa2 <w_sip>

    return 2;
    80004198:	4789                	li	a5,2
    8000419a:	a011                	j	8000419e <devintr+0xfa>
  } else {
    return 0;
    8000419c:	4781                	li	a5,0
  }
}
    8000419e:	853e                	mv	a0,a5
    800041a0:	60e2                	ld	ra,24(sp)
    800041a2:	6442                	ld	s0,16(sp)
    800041a4:	6105                	addi	sp,sp,32
    800041a6:	8082                	ret

00000000800041a8 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    800041a8:	7179                	addi	sp,sp,-48
    800041aa:	f406                	sd	ra,40(sp)
    800041ac:	f022                	sd	s0,32(sp)
    800041ae:	1800                	addi	s0,sp,48
    800041b0:	fca43c23          	sd	a0,-40(s0)
    800041b4:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800041b8:	fffff097          	auipc	ra,0xfffff
    800041bc:	858080e7          	jalr	-1960(ra) # 80002a10 <myproc>
    800041c0:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    800041c4:	fe843783          	ld	a5,-24(s0)
    800041c8:	67bc                	ld	a5,72(a5)
    800041ca:	fd843703          	ld	a4,-40(s0)
    800041ce:	00f77b63          	bgeu	a4,a5,800041e4 <fetchaddr+0x3c>
    800041d2:	fd843783          	ld	a5,-40(s0)
    800041d6:	00878713          	addi	a4,a5,8
    800041da:	fe843783          	ld	a5,-24(s0)
    800041de:	67bc                	ld	a5,72(a5)
    800041e0:	00e7f463          	bgeu	a5,a4,800041e8 <fetchaddr+0x40>
    return -1;
    800041e4:	57fd                	li	a5,-1
    800041e6:	a01d                	j	8000420c <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    800041e8:	fe843783          	ld	a5,-24(s0)
    800041ec:	6bbc                	ld	a5,80(a5)
    800041ee:	46a1                	li	a3,8
    800041f0:	fd843603          	ld	a2,-40(s0)
    800041f4:	fd043583          	ld	a1,-48(s0)
    800041f8:	853e                	mv	a0,a5
    800041fa:	ffffe097          	auipc	ra,0xffffe
    800041fe:	3ae080e7          	jalr	942(ra) # 800025a8 <copyin>
    80004202:	87aa                	mv	a5,a0
    80004204:	c399                	beqz	a5,8000420a <fetchaddr+0x62>
    return -1;
    80004206:	57fd                	li	a5,-1
    80004208:	a011                	j	8000420c <fetchaddr+0x64>
  return 0;
    8000420a:	4781                	li	a5,0
}
    8000420c:	853e                	mv	a0,a5
    8000420e:	70a2                	ld	ra,40(sp)
    80004210:	7402                	ld	s0,32(sp)
    80004212:	6145                	addi	sp,sp,48
    80004214:	8082                	ret

0000000080004216 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004216:	7139                	addi	sp,sp,-64
    80004218:	fc06                	sd	ra,56(sp)
    8000421a:	f822                	sd	s0,48(sp)
    8000421c:	0080                	addi	s0,sp,64
    8000421e:	fca43c23          	sd	a0,-40(s0)
    80004222:	fcb43823          	sd	a1,-48(s0)
    80004226:	87b2                	mv	a5,a2
    80004228:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    8000422c:	ffffe097          	auipc	ra,0xffffe
    80004230:	7e4080e7          	jalr	2020(ra) # 80002a10 <myproc>
    80004234:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    80004238:	fe843783          	ld	a5,-24(s0)
    8000423c:	6bbc                	ld	a5,80(a5)
    8000423e:	fcc42703          	lw	a4,-52(s0)
    80004242:	86ba                	mv	a3,a4
    80004244:	fd843603          	ld	a2,-40(s0)
    80004248:	fd043583          	ld	a1,-48(s0)
    8000424c:	853e                	mv	a0,a5
    8000424e:	ffffe097          	auipc	ra,0xffffe
    80004252:	428080e7          	jalr	1064(ra) # 80002676 <copyinstr>
    80004256:	87aa                	mv	a5,a0
    80004258:	0007d463          	bgez	a5,80004260 <fetchstr+0x4a>
    return -1;
    8000425c:	57fd                	li	a5,-1
    8000425e:	a801                	j	8000426e <fetchstr+0x58>
  return strlen(buf);
    80004260:	fd043503          	ld	a0,-48(s0)
    80004264:	ffffd097          	auipc	ra,0xffffd
    80004268:	62a080e7          	jalr	1578(ra) # 8000188e <strlen>
    8000426c:	87aa                	mv	a5,a0
}
    8000426e:	853e                	mv	a0,a5
    80004270:	70e2                	ld	ra,56(sp)
    80004272:	7442                	ld	s0,48(sp)
    80004274:	6121                	addi	sp,sp,64
    80004276:	8082                	ret

0000000080004278 <argraw>:

static uint64
argraw(int n)
{
    80004278:	7179                	addi	sp,sp,-48
    8000427a:	f406                	sd	ra,40(sp)
    8000427c:	f022                	sd	s0,32(sp)
    8000427e:	1800                	addi	s0,sp,48
    80004280:	87aa                	mv	a5,a0
    80004282:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    80004286:	ffffe097          	auipc	ra,0xffffe
    8000428a:	78a080e7          	jalr	1930(ra) # 80002a10 <myproc>
    8000428e:	fea43423          	sd	a0,-24(s0)
    80004292:	fdc42783          	lw	a5,-36(s0)
    80004296:	0007871b          	sext.w	a4,a5
    8000429a:	4795                	li	a5,5
    8000429c:	06e7e263          	bltu	a5,a4,80004300 <argraw+0x88>
    800042a0:	fdc46783          	lwu	a5,-36(s0)
    800042a4:	00279713          	slli	a4,a5,0x2
    800042a8:	00008797          	auipc	a5,0x8
    800042ac:	17078793          	addi	a5,a5,368 # 8000c418 <etext+0x418>
    800042b0:	97ba                	add	a5,a5,a4
    800042b2:	439c                	lw	a5,0(a5)
    800042b4:	0007871b          	sext.w	a4,a5
    800042b8:	00008797          	auipc	a5,0x8
    800042bc:	16078793          	addi	a5,a5,352 # 8000c418 <etext+0x418>
    800042c0:	97ba                	add	a5,a5,a4
    800042c2:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    800042c4:	fe843783          	ld	a5,-24(s0)
    800042c8:	6fbc                	ld	a5,88(a5)
    800042ca:	7bbc                	ld	a5,112(a5)
    800042cc:	a091                	j	80004310 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    800042ce:	fe843783          	ld	a5,-24(s0)
    800042d2:	6fbc                	ld	a5,88(a5)
    800042d4:	7fbc                	ld	a5,120(a5)
    800042d6:	a82d                	j	80004310 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    800042d8:	fe843783          	ld	a5,-24(s0)
    800042dc:	6fbc                	ld	a5,88(a5)
    800042de:	63dc                	ld	a5,128(a5)
    800042e0:	a805                	j	80004310 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    800042e2:	fe843783          	ld	a5,-24(s0)
    800042e6:	6fbc                	ld	a5,88(a5)
    800042e8:	67dc                	ld	a5,136(a5)
    800042ea:	a01d                	j	80004310 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    800042ec:	fe843783          	ld	a5,-24(s0)
    800042f0:	6fbc                	ld	a5,88(a5)
    800042f2:	6bdc                	ld	a5,144(a5)
    800042f4:	a831                	j	80004310 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    800042f6:	fe843783          	ld	a5,-24(s0)
    800042fa:	6fbc                	ld	a5,88(a5)
    800042fc:	6fdc                	ld	a5,152(a5)
    800042fe:	a809                	j	80004310 <argraw+0x98>
  }
  panic("argraw");
    80004300:	00008517          	auipc	a0,0x8
    80004304:	11050513          	addi	a0,a0,272 # 8000c410 <etext+0x410>
    80004308:	ffffd097          	auipc	ra,0xffffd
    8000430c:	984080e7          	jalr	-1660(ra) # 80000c8c <panic>
  return -1;
}
    80004310:	853e                	mv	a0,a5
    80004312:	70a2                	ld	ra,40(sp)
    80004314:	7402                	ld	s0,32(sp)
    80004316:	6145                	addi	sp,sp,48
    80004318:	8082                	ret

000000008000431a <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    8000431a:	1101                	addi	sp,sp,-32
    8000431c:	ec06                	sd	ra,24(sp)
    8000431e:	e822                	sd	s0,16(sp)
    80004320:	1000                	addi	s0,sp,32
    80004322:	87aa                	mv	a5,a0
    80004324:	feb43023          	sd	a1,-32(s0)
    80004328:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    8000432c:	fec42783          	lw	a5,-20(s0)
    80004330:	853e                	mv	a0,a5
    80004332:	00000097          	auipc	ra,0x0
    80004336:	f46080e7          	jalr	-186(ra) # 80004278 <argraw>
    8000433a:	87aa                	mv	a5,a0
    8000433c:	0007871b          	sext.w	a4,a5
    80004340:	fe043783          	ld	a5,-32(s0)
    80004344:	c398                	sw	a4,0(a5)
}
    80004346:	0001                	nop
    80004348:	60e2                	ld	ra,24(sp)
    8000434a:	6442                	ld	s0,16(sp)
    8000434c:	6105                	addi	sp,sp,32
    8000434e:	8082                	ret

0000000080004350 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    80004350:	1101                	addi	sp,sp,-32
    80004352:	ec06                	sd	ra,24(sp)
    80004354:	e822                	sd	s0,16(sp)
    80004356:	1000                	addi	s0,sp,32
    80004358:	87aa                	mv	a5,a0
    8000435a:	feb43023          	sd	a1,-32(s0)
    8000435e:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004362:	fec42783          	lw	a5,-20(s0)
    80004366:	853e                	mv	a0,a5
    80004368:	00000097          	auipc	ra,0x0
    8000436c:	f10080e7          	jalr	-240(ra) # 80004278 <argraw>
    80004370:	872a                	mv	a4,a0
    80004372:	fe043783          	ld	a5,-32(s0)
    80004376:	e398                	sd	a4,0(a5)
}
    80004378:	0001                	nop
    8000437a:	60e2                	ld	ra,24(sp)
    8000437c:	6442                	ld	s0,16(sp)
    8000437e:	6105                	addi	sp,sp,32
    80004380:	8082                	ret

0000000080004382 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    80004382:	7179                	addi	sp,sp,-48
    80004384:	f406                	sd	ra,40(sp)
    80004386:	f022                	sd	s0,32(sp)
    80004388:	1800                	addi	s0,sp,48
    8000438a:	87aa                	mv	a5,a0
    8000438c:	fcb43823          	sd	a1,-48(s0)
    80004390:	8732                	mv	a4,a2
    80004392:	fcf42e23          	sw	a5,-36(s0)
    80004396:	87ba                	mv	a5,a4
    80004398:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    8000439c:	fe840713          	addi	a4,s0,-24
    800043a0:	fdc42783          	lw	a5,-36(s0)
    800043a4:	85ba                	mv	a1,a4
    800043a6:	853e                	mv	a0,a5
    800043a8:	00000097          	auipc	ra,0x0
    800043ac:	fa8080e7          	jalr	-88(ra) # 80004350 <argaddr>
  return fetchstr(addr, buf, max);
    800043b0:	fe843783          	ld	a5,-24(s0)
    800043b4:	fd842703          	lw	a4,-40(s0)
    800043b8:	863a                	mv	a2,a4
    800043ba:	fd043583          	ld	a1,-48(s0)
    800043be:	853e                	mv	a0,a5
    800043c0:	00000097          	auipc	ra,0x0
    800043c4:	e56080e7          	jalr	-426(ra) # 80004216 <fetchstr>
    800043c8:	87aa                	mv	a5,a0
}
    800043ca:	853e                	mv	a0,a5
    800043cc:	70a2                	ld	ra,40(sp)
    800043ce:	7402                	ld	s0,32(sp)
    800043d0:	6145                	addi	sp,sp,48
    800043d2:	8082                	ret

00000000800043d4 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    800043d4:	7179                	addi	sp,sp,-48
    800043d6:	f406                	sd	ra,40(sp)
    800043d8:	f022                	sd	s0,32(sp)
    800043da:	ec26                	sd	s1,24(sp)
    800043dc:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    800043de:	ffffe097          	auipc	ra,0xffffe
    800043e2:	632080e7          	jalr	1586(ra) # 80002a10 <myproc>
    800043e6:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    800043ea:	fd843783          	ld	a5,-40(s0)
    800043ee:	6fbc                	ld	a5,88(a5)
    800043f0:	77dc                	ld	a5,168(a5)
    800043f2:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    800043f6:	fd442783          	lw	a5,-44(s0)
    800043fa:	2781                	sext.w	a5,a5
    800043fc:	04f05263          	blez	a5,80004440 <syscall+0x6c>
    80004400:	fd442783          	lw	a5,-44(s0)
    80004404:	873e                	mv	a4,a5
    80004406:	47d5                	li	a5,21
    80004408:	02e7ec63          	bltu	a5,a4,80004440 <syscall+0x6c>
    8000440c:	00008717          	auipc	a4,0x8
    80004410:	4e470713          	addi	a4,a4,1252 # 8000c8f0 <syscalls>
    80004414:	fd442783          	lw	a5,-44(s0)
    80004418:	078e                	slli	a5,a5,0x3
    8000441a:	97ba                	add	a5,a5,a4
    8000441c:	639c                	ld	a5,0(a5)
    8000441e:	c38d                	beqz	a5,80004440 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    80004420:	00008717          	auipc	a4,0x8
    80004424:	4d070713          	addi	a4,a4,1232 # 8000c8f0 <syscalls>
    80004428:	fd442783          	lw	a5,-44(s0)
    8000442c:	078e                	slli	a5,a5,0x3
    8000442e:	97ba                	add	a5,a5,a4
    80004430:	6398                	ld	a4,0(a5)
    80004432:	fd843783          	ld	a5,-40(s0)
    80004436:	6fa4                	ld	s1,88(a5)
    80004438:	9702                	jalr	a4
    8000443a:	87aa                	mv	a5,a0
    8000443c:	f8bc                	sd	a5,112(s1)
    8000443e:	a815                	j	80004472 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    80004440:	fd843783          	ld	a5,-40(s0)
    80004444:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    80004446:	fd843783          	ld	a5,-40(s0)
    8000444a:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    8000444e:	fd442683          	lw	a3,-44(s0)
    80004452:	863e                	mv	a2,a5
    80004454:	85ba                	mv	a1,a4
    80004456:	00008517          	auipc	a0,0x8
    8000445a:	fda50513          	addi	a0,a0,-38 # 8000c430 <etext+0x430>
    8000445e:	ffffc097          	auipc	ra,0xffffc
    80004462:	5d8080e7          	jalr	1496(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    80004466:	fd843783          	ld	a5,-40(s0)
    8000446a:	6fbc                	ld	a5,88(a5)
    8000446c:	577d                	li	a4,-1
    8000446e:	fbb8                	sd	a4,112(a5)
  }
}
    80004470:	0001                	nop
    80004472:	0001                	nop
    80004474:	70a2                	ld	ra,40(sp)
    80004476:	7402                	ld	s0,32(sp)
    80004478:	64e2                	ld	s1,24(sp)
    8000447a:	6145                	addi	sp,sp,48
    8000447c:	8082                	ret

000000008000447e <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    8000447e:	1101                	addi	sp,sp,-32
    80004480:	ec06                	sd	ra,24(sp)
    80004482:	e822                	sd	s0,16(sp)
    80004484:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    80004486:	fec40793          	addi	a5,s0,-20
    8000448a:	85be                	mv	a1,a5
    8000448c:	4501                	li	a0,0
    8000448e:	00000097          	auipc	ra,0x0
    80004492:	e8c080e7          	jalr	-372(ra) # 8000431a <argint>
  exit(n);
    80004496:	fec42783          	lw	a5,-20(s0)
    8000449a:	853e                	mv	a0,a5
    8000449c:	fffff097          	auipc	ra,0xfffff
    800044a0:	c66080e7          	jalr	-922(ra) # 80003102 <exit>
  return 0;  // not reached
    800044a4:	4781                	li	a5,0
}
    800044a6:	853e                	mv	a0,a5
    800044a8:	60e2                	ld	ra,24(sp)
    800044aa:	6442                	ld	s0,16(sp)
    800044ac:	6105                	addi	sp,sp,32
    800044ae:	8082                	ret

00000000800044b0 <sys_getpid>:

uint64
sys_getpid(void)
{
    800044b0:	1141                	addi	sp,sp,-16
    800044b2:	e406                	sd	ra,8(sp)
    800044b4:	e022                	sd	s0,0(sp)
    800044b6:	0800                	addi	s0,sp,16
  return myproc()->pid;
    800044b8:	ffffe097          	auipc	ra,0xffffe
    800044bc:	558080e7          	jalr	1368(ra) # 80002a10 <myproc>
    800044c0:	87aa                	mv	a5,a0
    800044c2:	5b9c                	lw	a5,48(a5)
}
    800044c4:	853e                	mv	a0,a5
    800044c6:	60a2                	ld	ra,8(sp)
    800044c8:	6402                	ld	s0,0(sp)
    800044ca:	0141                	addi	sp,sp,16
    800044cc:	8082                	ret

00000000800044ce <sys_fork>:

uint64
sys_fork(void)
{
    800044ce:	1141                	addi	sp,sp,-16
    800044d0:	e406                	sd	ra,8(sp)
    800044d2:	e022                	sd	s0,0(sp)
    800044d4:	0800                	addi	s0,sp,16
  return fork();
    800044d6:	fffff097          	auipc	ra,0xfffff
    800044da:	a0a080e7          	jalr	-1526(ra) # 80002ee0 <fork>
    800044de:	87aa                	mv	a5,a0
}
    800044e0:	853e                	mv	a0,a5
    800044e2:	60a2                	ld	ra,8(sp)
    800044e4:	6402                	ld	s0,0(sp)
    800044e6:	0141                	addi	sp,sp,16
    800044e8:	8082                	ret

00000000800044ea <sys_wait>:

uint64
sys_wait(void)
{
    800044ea:	1101                	addi	sp,sp,-32
    800044ec:	ec06                	sd	ra,24(sp)
    800044ee:	e822                	sd	s0,16(sp)
    800044f0:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    800044f2:	fe840793          	addi	a5,s0,-24
    800044f6:	85be                	mv	a1,a5
    800044f8:	4501                	li	a0,0
    800044fa:	00000097          	auipc	ra,0x0
    800044fe:	e56080e7          	jalr	-426(ra) # 80004350 <argaddr>
  return wait(p);
    80004502:	fe843783          	ld	a5,-24(s0)
    80004506:	853e                	mv	a0,a5
    80004508:	fffff097          	auipc	ra,0xfffff
    8000450c:	d36080e7          	jalr	-714(ra) # 8000323e <wait>
    80004510:	87aa                	mv	a5,a0
}
    80004512:	853e                	mv	a0,a5
    80004514:	60e2                	ld	ra,24(sp)
    80004516:	6442                	ld	s0,16(sp)
    80004518:	6105                	addi	sp,sp,32
    8000451a:	8082                	ret

000000008000451c <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8000451c:	1101                	addi	sp,sp,-32
    8000451e:	ec06                	sd	ra,24(sp)
    80004520:	e822                	sd	s0,16(sp)
    80004522:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    80004524:	fe440793          	addi	a5,s0,-28
    80004528:	85be                	mv	a1,a5
    8000452a:	4501                	li	a0,0
    8000452c:	00000097          	auipc	ra,0x0
    80004530:	dee080e7          	jalr	-530(ra) # 8000431a <argint>
  addr = myproc()->sz;
    80004534:	ffffe097          	auipc	ra,0xffffe
    80004538:	4dc080e7          	jalr	1244(ra) # 80002a10 <myproc>
    8000453c:	87aa                	mv	a5,a0
    8000453e:	67bc                	ld	a5,72(a5)
    80004540:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    80004544:	fe442783          	lw	a5,-28(s0)
    80004548:	853e                	mv	a0,a5
    8000454a:	fffff097          	auipc	ra,0xfffff
    8000454e:	8f6080e7          	jalr	-1802(ra) # 80002e40 <growproc>
    80004552:	87aa                	mv	a5,a0
    80004554:	0007d463          	bgez	a5,8000455c <sys_sbrk+0x40>
    return -1;
    80004558:	57fd                	li	a5,-1
    8000455a:	a019                	j	80004560 <sys_sbrk+0x44>
  return addr;
    8000455c:	fe843783          	ld	a5,-24(s0)
}
    80004560:	853e                	mv	a0,a5
    80004562:	60e2                	ld	ra,24(sp)
    80004564:	6442                	ld	s0,16(sp)
    80004566:	6105                	addi	sp,sp,32
    80004568:	8082                	ret

000000008000456a <sys_sleep>:

uint64
sys_sleep(void)
{
    8000456a:	1101                	addi	sp,sp,-32
    8000456c:	ec06                	sd	ra,24(sp)
    8000456e:	e822                	sd	s0,16(sp)
    80004570:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    80004572:	fe840793          	addi	a5,s0,-24
    80004576:	85be                	mv	a1,a5
    80004578:	4501                	li	a0,0
    8000457a:	00000097          	auipc	ra,0x0
    8000457e:	da0080e7          	jalr	-608(ra) # 8000431a <argint>
  acquire(&tickslock);
    80004582:	00016517          	auipc	a0,0x16
    80004586:	50650513          	addi	a0,a0,1286 # 8001aa88 <tickslock>
    8000458a:	ffffd097          	auipc	ra,0xffffd
    8000458e:	db2080e7          	jalr	-590(ra) # 8000133c <acquire>
  ticks0 = ticks;
    80004592:	00008797          	auipc	a5,0x8
    80004596:	45678793          	addi	a5,a5,1110 # 8000c9e8 <ticks>
    8000459a:	439c                	lw	a5,0(a5)
    8000459c:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    800045a0:	a099                	j	800045e6 <sys_sleep+0x7c>
    if(killed(myproc())){
    800045a2:	ffffe097          	auipc	ra,0xffffe
    800045a6:	46e080e7          	jalr	1134(ra) # 80002a10 <myproc>
    800045aa:	87aa                	mv	a5,a0
    800045ac:	853e                	mv	a0,a5
    800045ae:	fffff097          	auipc	ra,0xfffff
    800045b2:	232080e7          	jalr	562(ra) # 800037e0 <killed>
    800045b6:	87aa                	mv	a5,a0
    800045b8:	cb99                	beqz	a5,800045ce <sys_sleep+0x64>
      release(&tickslock);
    800045ba:	00016517          	auipc	a0,0x16
    800045be:	4ce50513          	addi	a0,a0,1230 # 8001aa88 <tickslock>
    800045c2:	ffffd097          	auipc	ra,0xffffd
    800045c6:	dde080e7          	jalr	-546(ra) # 800013a0 <release>
      return -1;
    800045ca:	57fd                	li	a5,-1
    800045cc:	a0b1                	j	80004618 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    800045ce:	00016597          	auipc	a1,0x16
    800045d2:	4ba58593          	addi	a1,a1,1210 # 8001aa88 <tickslock>
    800045d6:	00008517          	auipc	a0,0x8
    800045da:	41250513          	addi	a0,a0,1042 # 8000c9e8 <ticks>
    800045de:	fffff097          	auipc	ra,0xfffff
    800045e2:	ff4080e7          	jalr	-12(ra) # 800035d2 <sleep>
  while(ticks - ticks0 < n){
    800045e6:	00008797          	auipc	a5,0x8
    800045ea:	40278793          	addi	a5,a5,1026 # 8000c9e8 <ticks>
    800045ee:	4398                	lw	a4,0(a5)
    800045f0:	fec42783          	lw	a5,-20(s0)
    800045f4:	40f707bb          	subw	a5,a4,a5
    800045f8:	0007871b          	sext.w	a4,a5
    800045fc:	fe842783          	lw	a5,-24(s0)
    80004600:	2781                	sext.w	a5,a5
    80004602:	faf760e3          	bltu	a4,a5,800045a2 <sys_sleep+0x38>
  }
  release(&tickslock);
    80004606:	00016517          	auipc	a0,0x16
    8000460a:	48250513          	addi	a0,a0,1154 # 8001aa88 <tickslock>
    8000460e:	ffffd097          	auipc	ra,0xffffd
    80004612:	d92080e7          	jalr	-622(ra) # 800013a0 <release>
  return 0;
    80004616:	4781                	li	a5,0
}
    80004618:	853e                	mv	a0,a5
    8000461a:	60e2                	ld	ra,24(sp)
    8000461c:	6442                	ld	s0,16(sp)
    8000461e:	6105                	addi	sp,sp,32
    80004620:	8082                	ret

0000000080004622 <sys_kill>:

uint64
sys_kill(void)
{
    80004622:	1101                	addi	sp,sp,-32
    80004624:	ec06                	sd	ra,24(sp)
    80004626:	e822                	sd	s0,16(sp)
    80004628:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    8000462a:	fec40793          	addi	a5,s0,-20
    8000462e:	85be                	mv	a1,a5
    80004630:	4501                	li	a0,0
    80004632:	00000097          	auipc	ra,0x0
    80004636:	ce8080e7          	jalr	-792(ra) # 8000431a <argint>
  return kill(pid);
    8000463a:	fec42783          	lw	a5,-20(s0)
    8000463e:	853e                	mv	a0,a5
    80004640:	fffff097          	auipc	ra,0xfffff
    80004644:	0c6080e7          	jalr	198(ra) # 80003706 <kill>
    80004648:	87aa                	mv	a5,a0
}
    8000464a:	853e                	mv	a0,a5
    8000464c:	60e2                	ld	ra,24(sp)
    8000464e:	6442                	ld	s0,16(sp)
    80004650:	6105                	addi	sp,sp,32
    80004652:	8082                	ret

0000000080004654 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004654:	1101                	addi	sp,sp,-32
    80004656:	ec06                	sd	ra,24(sp)
    80004658:	e822                	sd	s0,16(sp)
    8000465a:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8000465c:	00016517          	auipc	a0,0x16
    80004660:	42c50513          	addi	a0,a0,1068 # 8001aa88 <tickslock>
    80004664:	ffffd097          	auipc	ra,0xffffd
    80004668:	cd8080e7          	jalr	-808(ra) # 8000133c <acquire>
  xticks = ticks;
    8000466c:	00008797          	auipc	a5,0x8
    80004670:	37c78793          	addi	a5,a5,892 # 8000c9e8 <ticks>
    80004674:	439c                	lw	a5,0(a5)
    80004676:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    8000467a:	00016517          	auipc	a0,0x16
    8000467e:	40e50513          	addi	a0,a0,1038 # 8001aa88 <tickslock>
    80004682:	ffffd097          	auipc	ra,0xffffd
    80004686:	d1e080e7          	jalr	-738(ra) # 800013a0 <release>
  return xticks;
    8000468a:	fec46783          	lwu	a5,-20(s0)
}
    8000468e:	853e                	mv	a0,a5
    80004690:	60e2                	ld	ra,24(sp)
    80004692:	6442                	ld	s0,16(sp)
    80004694:	6105                	addi	sp,sp,32
    80004696:	8082                	ret

0000000080004698 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    80004698:	1101                	addi	sp,sp,-32
    8000469a:	ec06                	sd	ra,24(sp)
    8000469c:	e822                	sd	s0,16(sp)
    8000469e:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800046a0:	00008597          	auipc	a1,0x8
    800046a4:	db058593          	addi	a1,a1,-592 # 8000c450 <etext+0x450>
    800046a8:	00016517          	auipc	a0,0x16
    800046ac:	3f850513          	addi	a0,a0,1016 # 8001aaa0 <bcache>
    800046b0:	ffffd097          	auipc	ra,0xffffd
    800046b4:	c5c080e7          	jalr	-932(ra) # 8000130c <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800046b8:	00016717          	auipc	a4,0x16
    800046bc:	3e870713          	addi	a4,a4,1000 # 8001aaa0 <bcache>
    800046c0:	67a1                	lui	a5,0x8
    800046c2:	97ba                	add	a5,a5,a4
    800046c4:	0001e717          	auipc	a4,0x1e
    800046c8:	64470713          	addi	a4,a4,1604 # 80022d08 <bcache+0x8268>
    800046cc:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    800046d0:	00016717          	auipc	a4,0x16
    800046d4:	3d070713          	addi	a4,a4,976 # 8001aaa0 <bcache>
    800046d8:	67a1                	lui	a5,0x8
    800046da:	97ba                	add	a5,a5,a4
    800046dc:	0001e717          	auipc	a4,0x1e
    800046e0:	62c70713          	addi	a4,a4,1580 # 80022d08 <bcache+0x8268>
    800046e4:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    800046e8:	00016797          	auipc	a5,0x16
    800046ec:	3d078793          	addi	a5,a5,976 # 8001aab8 <bcache+0x18>
    800046f0:	fef43423          	sd	a5,-24(s0)
    800046f4:	a895                	j	80004768 <binit+0xd0>
    b->next = bcache.head.next;
    800046f6:	00016717          	auipc	a4,0x16
    800046fa:	3aa70713          	addi	a4,a4,938 # 8001aaa0 <bcache>
    800046fe:	67a1                	lui	a5,0x8
    80004700:	97ba                	add	a5,a5,a4
    80004702:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004706:	fe843783          	ld	a5,-24(s0)
    8000470a:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    8000470c:	fe843783          	ld	a5,-24(s0)
    80004710:	0001e717          	auipc	a4,0x1e
    80004714:	5f870713          	addi	a4,a4,1528 # 80022d08 <bcache+0x8268>
    80004718:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    8000471a:	fe843783          	ld	a5,-24(s0)
    8000471e:	07c1                	addi	a5,a5,16
    80004720:	00008597          	auipc	a1,0x8
    80004724:	d3858593          	addi	a1,a1,-712 # 8000c458 <etext+0x458>
    80004728:	853e                	mv	a0,a5
    8000472a:	00002097          	auipc	ra,0x2
    8000472e:	034080e7          	jalr	52(ra) # 8000675e <initsleeplock>
    bcache.head.next->prev = b;
    80004732:	00016717          	auipc	a4,0x16
    80004736:	36e70713          	addi	a4,a4,878 # 8001aaa0 <bcache>
    8000473a:	67a1                	lui	a5,0x8
    8000473c:	97ba                	add	a5,a5,a4
    8000473e:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004742:	fe843703          	ld	a4,-24(s0)
    80004746:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004748:	00016717          	auipc	a4,0x16
    8000474c:	35870713          	addi	a4,a4,856 # 8001aaa0 <bcache>
    80004750:	67a1                	lui	a5,0x8
    80004752:	97ba                	add	a5,a5,a4
    80004754:	fe843703          	ld	a4,-24(s0)
    80004758:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000475c:	fe843783          	ld	a5,-24(s0)
    80004760:	45878793          	addi	a5,a5,1112
    80004764:	fef43423          	sd	a5,-24(s0)
    80004768:	0001e797          	auipc	a5,0x1e
    8000476c:	5a078793          	addi	a5,a5,1440 # 80022d08 <bcache+0x8268>
    80004770:	fe843703          	ld	a4,-24(s0)
    80004774:	f8f761e3          	bltu	a4,a5,800046f6 <binit+0x5e>
  }
}
    80004778:	0001                	nop
    8000477a:	0001                	nop
    8000477c:	60e2                	ld	ra,24(sp)
    8000477e:	6442                	ld	s0,16(sp)
    80004780:	6105                	addi	sp,sp,32
    80004782:	8082                	ret

0000000080004784 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    80004784:	7179                	addi	sp,sp,-48
    80004786:	f406                	sd	ra,40(sp)
    80004788:	f022                	sd	s0,32(sp)
    8000478a:	1800                	addi	s0,sp,48
    8000478c:	87aa                	mv	a5,a0
    8000478e:	872e                	mv	a4,a1
    80004790:	fcf42e23          	sw	a5,-36(s0)
    80004794:	87ba                	mv	a5,a4
    80004796:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    8000479a:	00016517          	auipc	a0,0x16
    8000479e:	30650513          	addi	a0,a0,774 # 8001aaa0 <bcache>
    800047a2:	ffffd097          	auipc	ra,0xffffd
    800047a6:	b9a080e7          	jalr	-1126(ra) # 8000133c <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800047aa:	00016717          	auipc	a4,0x16
    800047ae:	2f670713          	addi	a4,a4,758 # 8001aaa0 <bcache>
    800047b2:	67a1                	lui	a5,0x8
    800047b4:	97ba                	add	a5,a5,a4
    800047b6:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047ba:	fef43423          	sd	a5,-24(s0)
    800047be:	a095                	j	80004822 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800047c0:	fe843783          	ld	a5,-24(s0)
    800047c4:	4798                	lw	a4,8(a5)
    800047c6:	fdc42783          	lw	a5,-36(s0)
    800047ca:	2781                	sext.w	a5,a5
    800047cc:	04e79663          	bne	a5,a4,80004818 <bget+0x94>
    800047d0:	fe843783          	ld	a5,-24(s0)
    800047d4:	47d8                	lw	a4,12(a5)
    800047d6:	fd842783          	lw	a5,-40(s0)
    800047da:	2781                	sext.w	a5,a5
    800047dc:	02e79e63          	bne	a5,a4,80004818 <bget+0x94>
      b->refcnt++;
    800047e0:	fe843783          	ld	a5,-24(s0)
    800047e4:	43bc                	lw	a5,64(a5)
    800047e6:	2785                	addiw	a5,a5,1
    800047e8:	0007871b          	sext.w	a4,a5
    800047ec:	fe843783          	ld	a5,-24(s0)
    800047f0:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800047f2:	00016517          	auipc	a0,0x16
    800047f6:	2ae50513          	addi	a0,a0,686 # 8001aaa0 <bcache>
    800047fa:	ffffd097          	auipc	ra,0xffffd
    800047fe:	ba6080e7          	jalr	-1114(ra) # 800013a0 <release>
      acquiresleep(&b->lock);
    80004802:	fe843783          	ld	a5,-24(s0)
    80004806:	07c1                	addi	a5,a5,16
    80004808:	853e                	mv	a0,a5
    8000480a:	00002097          	auipc	ra,0x2
    8000480e:	fa0080e7          	jalr	-96(ra) # 800067aa <acquiresleep>
      return b;
    80004812:	fe843783          	ld	a5,-24(s0)
    80004816:	a07d                	j	800048c4 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004818:	fe843783          	ld	a5,-24(s0)
    8000481c:	6bbc                	ld	a5,80(a5)
    8000481e:	fef43423          	sd	a5,-24(s0)
    80004822:	fe843703          	ld	a4,-24(s0)
    80004826:	0001e797          	auipc	a5,0x1e
    8000482a:	4e278793          	addi	a5,a5,1250 # 80022d08 <bcache+0x8268>
    8000482e:	f8f719e3          	bne	a4,a5,800047c0 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004832:	00016717          	auipc	a4,0x16
    80004836:	26e70713          	addi	a4,a4,622 # 8001aaa0 <bcache>
    8000483a:	67a1                	lui	a5,0x8
    8000483c:	97ba                	add	a5,a5,a4
    8000483e:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004842:	fef43423          	sd	a5,-24(s0)
    80004846:	a8b9                	j	800048a4 <bget+0x120>
    if(b->refcnt == 0) {
    80004848:	fe843783          	ld	a5,-24(s0)
    8000484c:	43bc                	lw	a5,64(a5)
    8000484e:	e7b1                	bnez	a5,8000489a <bget+0x116>
      b->dev = dev;
    80004850:	fe843783          	ld	a5,-24(s0)
    80004854:	fdc42703          	lw	a4,-36(s0)
    80004858:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    8000485a:	fe843783          	ld	a5,-24(s0)
    8000485e:	fd842703          	lw	a4,-40(s0)
    80004862:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    80004864:	fe843783          	ld	a5,-24(s0)
    80004868:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    8000486c:	fe843783          	ld	a5,-24(s0)
    80004870:	4705                	li	a4,1
    80004872:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004874:	00016517          	auipc	a0,0x16
    80004878:	22c50513          	addi	a0,a0,556 # 8001aaa0 <bcache>
    8000487c:	ffffd097          	auipc	ra,0xffffd
    80004880:	b24080e7          	jalr	-1244(ra) # 800013a0 <release>
      acquiresleep(&b->lock);
    80004884:	fe843783          	ld	a5,-24(s0)
    80004888:	07c1                	addi	a5,a5,16
    8000488a:	853e                	mv	a0,a5
    8000488c:	00002097          	auipc	ra,0x2
    80004890:	f1e080e7          	jalr	-226(ra) # 800067aa <acquiresleep>
      return b;
    80004894:	fe843783          	ld	a5,-24(s0)
    80004898:	a035                	j	800048c4 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    8000489a:	fe843783          	ld	a5,-24(s0)
    8000489e:	67bc                	ld	a5,72(a5)
    800048a0:	fef43423          	sd	a5,-24(s0)
    800048a4:	fe843703          	ld	a4,-24(s0)
    800048a8:	0001e797          	auipc	a5,0x1e
    800048ac:	46078793          	addi	a5,a5,1120 # 80022d08 <bcache+0x8268>
    800048b0:	f8f71ce3          	bne	a4,a5,80004848 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800048b4:	00008517          	auipc	a0,0x8
    800048b8:	bac50513          	addi	a0,a0,-1108 # 8000c460 <etext+0x460>
    800048bc:	ffffc097          	auipc	ra,0xffffc
    800048c0:	3d0080e7          	jalr	976(ra) # 80000c8c <panic>
}
    800048c4:	853e                	mv	a0,a5
    800048c6:	70a2                	ld	ra,40(sp)
    800048c8:	7402                	ld	s0,32(sp)
    800048ca:	6145                	addi	sp,sp,48
    800048cc:	8082                	ret

00000000800048ce <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    800048ce:	7179                	addi	sp,sp,-48
    800048d0:	f406                	sd	ra,40(sp)
    800048d2:	f022                	sd	s0,32(sp)
    800048d4:	1800                	addi	s0,sp,48
    800048d6:	87aa                	mv	a5,a0
    800048d8:	872e                	mv	a4,a1
    800048da:	fcf42e23          	sw	a5,-36(s0)
    800048de:	87ba                	mv	a5,a4
    800048e0:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    800048e4:	fd842703          	lw	a4,-40(s0)
    800048e8:	fdc42783          	lw	a5,-36(s0)
    800048ec:	85ba                	mv	a1,a4
    800048ee:	853e                	mv	a0,a5
    800048f0:	00000097          	auipc	ra,0x0
    800048f4:	e94080e7          	jalr	-364(ra) # 80004784 <bget>
    800048f8:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    800048fc:	fe843783          	ld	a5,-24(s0)
    80004900:	439c                	lw	a5,0(a5)
    80004902:	ef91                	bnez	a5,8000491e <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    80004904:	4681                	li	a3,0
    80004906:	4601                	li	a2,0
    80004908:	fe843583          	ld	a1,-24(s0)
    8000490c:	4501                	li	a0,0
    8000490e:	00005097          	auipc	ra,0x5
    80004912:	eb2080e7          	jalr	-334(ra) # 800097c0 <virtio_disk_rw>
    b->valid = 1;
    80004916:	fe843783          	ld	a5,-24(s0)
    8000491a:	4705                	li	a4,1
    8000491c:	c398                	sw	a4,0(a5)
  }
  return b;
    8000491e:	fe843783          	ld	a5,-24(s0)
}
    80004922:	853e                	mv	a0,a5
    80004924:	70a2                	ld	ra,40(sp)
    80004926:	7402                	ld	s0,32(sp)
    80004928:	6145                	addi	sp,sp,48
    8000492a:	8082                	ret

000000008000492c <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    8000492c:	1101                	addi	sp,sp,-32
    8000492e:	ec06                	sd	ra,24(sp)
    80004930:	e822                	sd	s0,16(sp)
    80004932:	1000                	addi	s0,sp,32
    80004934:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004938:	fe843783          	ld	a5,-24(s0)
    8000493c:	07c1                	addi	a5,a5,16
    8000493e:	853e                	mv	a0,a5
    80004940:	00002097          	auipc	ra,0x2
    80004944:	f2a080e7          	jalr	-214(ra) # 8000686a <holdingsleep>
    80004948:	87aa                	mv	a5,a0
    8000494a:	eb89                	bnez	a5,8000495c <bwrite+0x30>
    panic("bwrite");
    8000494c:	00008517          	auipc	a0,0x8
    80004950:	b2c50513          	addi	a0,a0,-1236 # 8000c478 <etext+0x478>
    80004954:	ffffc097          	auipc	ra,0xffffc
    80004958:	338080e7          	jalr	824(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    8000495c:	4681                	li	a3,0
    8000495e:	4605                	li	a2,1
    80004960:	fe843583          	ld	a1,-24(s0)
    80004964:	4501                	li	a0,0
    80004966:	00005097          	auipc	ra,0x5
    8000496a:	e5a080e7          	jalr	-422(ra) # 800097c0 <virtio_disk_rw>
}
    8000496e:	0001                	nop
    80004970:	60e2                	ld	ra,24(sp)
    80004972:	6442                	ld	s0,16(sp)
    80004974:	6105                	addi	sp,sp,32
    80004976:	8082                	ret

0000000080004978 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004978:	1101                	addi	sp,sp,-32
    8000497a:	ec06                	sd	ra,24(sp)
    8000497c:	e822                	sd	s0,16(sp)
    8000497e:	1000                	addi	s0,sp,32
    80004980:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004984:	fe843783          	ld	a5,-24(s0)
    80004988:	07c1                	addi	a5,a5,16
    8000498a:	853e                	mv	a0,a5
    8000498c:	00002097          	auipc	ra,0x2
    80004990:	ede080e7          	jalr	-290(ra) # 8000686a <holdingsleep>
    80004994:	87aa                	mv	a5,a0
    80004996:	eb89                	bnez	a5,800049a8 <brelse+0x30>
    panic("brelse");
    80004998:	00008517          	auipc	a0,0x8
    8000499c:	ae850513          	addi	a0,a0,-1304 # 8000c480 <etext+0x480>
    800049a0:	ffffc097          	auipc	ra,0xffffc
    800049a4:	2ec080e7          	jalr	748(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    800049a8:	fe843783          	ld	a5,-24(s0)
    800049ac:	07c1                	addi	a5,a5,16
    800049ae:	853e                	mv	a0,a5
    800049b0:	00002097          	auipc	ra,0x2
    800049b4:	e68080e7          	jalr	-408(ra) # 80006818 <releasesleep>

  acquire(&bcache.lock);
    800049b8:	00016517          	auipc	a0,0x16
    800049bc:	0e850513          	addi	a0,a0,232 # 8001aaa0 <bcache>
    800049c0:	ffffd097          	auipc	ra,0xffffd
    800049c4:	97c080e7          	jalr	-1668(ra) # 8000133c <acquire>
  b->refcnt--;
    800049c8:	fe843783          	ld	a5,-24(s0)
    800049cc:	43bc                	lw	a5,64(a5)
    800049ce:	37fd                	addiw	a5,a5,-1
    800049d0:	0007871b          	sext.w	a4,a5
    800049d4:	fe843783          	ld	a5,-24(s0)
    800049d8:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    800049da:	fe843783          	ld	a5,-24(s0)
    800049de:	43bc                	lw	a5,64(a5)
    800049e0:	e7b5                	bnez	a5,80004a4c <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    800049e2:	fe843783          	ld	a5,-24(s0)
    800049e6:	6bbc                	ld	a5,80(a5)
    800049e8:	fe843703          	ld	a4,-24(s0)
    800049ec:	6738                	ld	a4,72(a4)
    800049ee:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    800049f0:	fe843783          	ld	a5,-24(s0)
    800049f4:	67bc                	ld	a5,72(a5)
    800049f6:	fe843703          	ld	a4,-24(s0)
    800049fa:	6b38                	ld	a4,80(a4)
    800049fc:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    800049fe:	00016717          	auipc	a4,0x16
    80004a02:	0a270713          	addi	a4,a4,162 # 8001aaa0 <bcache>
    80004a06:	67a1                	lui	a5,0x8
    80004a08:	97ba                	add	a5,a5,a4
    80004a0a:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a0e:	fe843783          	ld	a5,-24(s0)
    80004a12:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004a14:	fe843783          	ld	a5,-24(s0)
    80004a18:	0001e717          	auipc	a4,0x1e
    80004a1c:	2f070713          	addi	a4,a4,752 # 80022d08 <bcache+0x8268>
    80004a20:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004a22:	00016717          	auipc	a4,0x16
    80004a26:	07e70713          	addi	a4,a4,126 # 8001aaa0 <bcache>
    80004a2a:	67a1                	lui	a5,0x8
    80004a2c:	97ba                	add	a5,a5,a4
    80004a2e:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a32:	fe843703          	ld	a4,-24(s0)
    80004a36:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004a38:	00016717          	auipc	a4,0x16
    80004a3c:	06870713          	addi	a4,a4,104 # 8001aaa0 <bcache>
    80004a40:	67a1                	lui	a5,0x8
    80004a42:	97ba                	add	a5,a5,a4
    80004a44:	fe843703          	ld	a4,-24(s0)
    80004a48:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004a4c:	00016517          	auipc	a0,0x16
    80004a50:	05450513          	addi	a0,a0,84 # 8001aaa0 <bcache>
    80004a54:	ffffd097          	auipc	ra,0xffffd
    80004a58:	94c080e7          	jalr	-1716(ra) # 800013a0 <release>
}
    80004a5c:	0001                	nop
    80004a5e:	60e2                	ld	ra,24(sp)
    80004a60:	6442                	ld	s0,16(sp)
    80004a62:	6105                	addi	sp,sp,32
    80004a64:	8082                	ret

0000000080004a66 <bpin>:

void
bpin(struct buf *b) {
    80004a66:	1101                	addi	sp,sp,-32
    80004a68:	ec06                	sd	ra,24(sp)
    80004a6a:	e822                	sd	s0,16(sp)
    80004a6c:	1000                	addi	s0,sp,32
    80004a6e:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004a72:	00016517          	auipc	a0,0x16
    80004a76:	02e50513          	addi	a0,a0,46 # 8001aaa0 <bcache>
    80004a7a:	ffffd097          	auipc	ra,0xffffd
    80004a7e:	8c2080e7          	jalr	-1854(ra) # 8000133c <acquire>
  b->refcnt++;
    80004a82:	fe843783          	ld	a5,-24(s0)
    80004a86:	43bc                	lw	a5,64(a5)
    80004a88:	2785                	addiw	a5,a5,1
    80004a8a:	0007871b          	sext.w	a4,a5
    80004a8e:	fe843783          	ld	a5,-24(s0)
    80004a92:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004a94:	00016517          	auipc	a0,0x16
    80004a98:	00c50513          	addi	a0,a0,12 # 8001aaa0 <bcache>
    80004a9c:	ffffd097          	auipc	ra,0xffffd
    80004aa0:	904080e7          	jalr	-1788(ra) # 800013a0 <release>
}
    80004aa4:	0001                	nop
    80004aa6:	60e2                	ld	ra,24(sp)
    80004aa8:	6442                	ld	s0,16(sp)
    80004aaa:	6105                	addi	sp,sp,32
    80004aac:	8082                	ret

0000000080004aae <bunpin>:

void
bunpin(struct buf *b) {
    80004aae:	1101                	addi	sp,sp,-32
    80004ab0:	ec06                	sd	ra,24(sp)
    80004ab2:	e822                	sd	s0,16(sp)
    80004ab4:	1000                	addi	s0,sp,32
    80004ab6:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004aba:	00016517          	auipc	a0,0x16
    80004abe:	fe650513          	addi	a0,a0,-26 # 8001aaa0 <bcache>
    80004ac2:	ffffd097          	auipc	ra,0xffffd
    80004ac6:	87a080e7          	jalr	-1926(ra) # 8000133c <acquire>
  b->refcnt--;
    80004aca:	fe843783          	ld	a5,-24(s0)
    80004ace:	43bc                	lw	a5,64(a5)
    80004ad0:	37fd                	addiw	a5,a5,-1
    80004ad2:	0007871b          	sext.w	a4,a5
    80004ad6:	fe843783          	ld	a5,-24(s0)
    80004ada:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004adc:	00016517          	auipc	a0,0x16
    80004ae0:	fc450513          	addi	a0,a0,-60 # 8001aaa0 <bcache>
    80004ae4:	ffffd097          	auipc	ra,0xffffd
    80004ae8:	8bc080e7          	jalr	-1860(ra) # 800013a0 <release>
}
    80004aec:	0001                	nop
    80004aee:	60e2                	ld	ra,24(sp)
    80004af0:	6442                	ld	s0,16(sp)
    80004af2:	6105                	addi	sp,sp,32
    80004af4:	8082                	ret

0000000080004af6 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004af6:	7179                	addi	sp,sp,-48
    80004af8:	f406                	sd	ra,40(sp)
    80004afa:	f022                	sd	s0,32(sp)
    80004afc:	1800                	addi	s0,sp,48
    80004afe:	87aa                	mv	a5,a0
    80004b00:	fcb43823          	sd	a1,-48(s0)
    80004b04:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004b08:	fdc42783          	lw	a5,-36(s0)
    80004b0c:	4585                	li	a1,1
    80004b0e:	853e                	mv	a0,a5
    80004b10:	00000097          	auipc	ra,0x0
    80004b14:	dbe080e7          	jalr	-578(ra) # 800048ce <bread>
    80004b18:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004b1c:	fe843783          	ld	a5,-24(s0)
    80004b20:	05878793          	addi	a5,a5,88
    80004b24:	02000613          	li	a2,32
    80004b28:	85be                	mv	a1,a5
    80004b2a:	fd043503          	ld	a0,-48(s0)
    80004b2e:	ffffd097          	auipc	ra,0xffffd
    80004b32:	ac6080e7          	jalr	-1338(ra) # 800015f4 <memmove>
  brelse(bp);
    80004b36:	fe843503          	ld	a0,-24(s0)
    80004b3a:	00000097          	auipc	ra,0x0
    80004b3e:	e3e080e7          	jalr	-450(ra) # 80004978 <brelse>
}
    80004b42:	0001                	nop
    80004b44:	70a2                	ld	ra,40(sp)
    80004b46:	7402                	ld	s0,32(sp)
    80004b48:	6145                	addi	sp,sp,48
    80004b4a:	8082                	ret

0000000080004b4c <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004b4c:	1101                	addi	sp,sp,-32
    80004b4e:	ec06                	sd	ra,24(sp)
    80004b50:	e822                	sd	s0,16(sp)
    80004b52:	1000                	addi	s0,sp,32
    80004b54:	87aa                	mv	a5,a0
    80004b56:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004b5a:	fec42783          	lw	a5,-20(s0)
    80004b5e:	0001e597          	auipc	a1,0x1e
    80004b62:	60258593          	addi	a1,a1,1538 # 80023160 <sb>
    80004b66:	853e                	mv	a0,a5
    80004b68:	00000097          	auipc	ra,0x0
    80004b6c:	f8e080e7          	jalr	-114(ra) # 80004af6 <readsb>
  if(sb.magic != FSMAGIC)
    80004b70:	0001e797          	auipc	a5,0x1e
    80004b74:	5f078793          	addi	a5,a5,1520 # 80023160 <sb>
    80004b78:	439c                	lw	a5,0(a5)
    80004b7a:	873e                	mv	a4,a5
    80004b7c:	102037b7          	lui	a5,0x10203
    80004b80:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004b84:	00f70a63          	beq	a4,a5,80004b98 <fsinit+0x4c>
    panic("invalid file system");
    80004b88:	00008517          	auipc	a0,0x8
    80004b8c:	90050513          	addi	a0,a0,-1792 # 8000c488 <etext+0x488>
    80004b90:	ffffc097          	auipc	ra,0xffffc
    80004b94:	0fc080e7          	jalr	252(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004b98:	fec42783          	lw	a5,-20(s0)
    80004b9c:	0001e597          	auipc	a1,0x1e
    80004ba0:	5c458593          	addi	a1,a1,1476 # 80023160 <sb>
    80004ba4:	853e                	mv	a0,a5
    80004ba6:	00001097          	auipc	ra,0x1
    80004baa:	49c080e7          	jalr	1180(ra) # 80006042 <initlog>
}
    80004bae:	0001                	nop
    80004bb0:	60e2                	ld	ra,24(sp)
    80004bb2:	6442                	ld	s0,16(sp)
    80004bb4:	6105                	addi	sp,sp,32
    80004bb6:	8082                	ret

0000000080004bb8 <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004bb8:	7179                	addi	sp,sp,-48
    80004bba:	f406                	sd	ra,40(sp)
    80004bbc:	f022                	sd	s0,32(sp)
    80004bbe:	1800                	addi	s0,sp,48
    80004bc0:	87aa                	mv	a5,a0
    80004bc2:	872e                	mv	a4,a1
    80004bc4:	fcf42e23          	sw	a5,-36(s0)
    80004bc8:	87ba                	mv	a5,a4
    80004bca:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004bce:	fdc42783          	lw	a5,-36(s0)
    80004bd2:	fd842703          	lw	a4,-40(s0)
    80004bd6:	85ba                	mv	a1,a4
    80004bd8:	853e                	mv	a0,a5
    80004bda:	00000097          	auipc	ra,0x0
    80004bde:	cf4080e7          	jalr	-780(ra) # 800048ce <bread>
    80004be2:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004be6:	fe843783          	ld	a5,-24(s0)
    80004bea:	05878793          	addi	a5,a5,88
    80004bee:	40000613          	li	a2,1024
    80004bf2:	4581                	li	a1,0
    80004bf4:	853e                	mv	a0,a5
    80004bf6:	ffffd097          	auipc	ra,0xffffd
    80004bfa:	91a080e7          	jalr	-1766(ra) # 80001510 <memset>
  log_write(bp);
    80004bfe:	fe843503          	ld	a0,-24(s0)
    80004c02:	00002097          	auipc	ra,0x2
    80004c06:	a28080e7          	jalr	-1496(ra) # 8000662a <log_write>
  brelse(bp);
    80004c0a:	fe843503          	ld	a0,-24(s0)
    80004c0e:	00000097          	auipc	ra,0x0
    80004c12:	d6a080e7          	jalr	-662(ra) # 80004978 <brelse>
}
    80004c16:	0001                	nop
    80004c18:	70a2                	ld	ra,40(sp)
    80004c1a:	7402                	ld	s0,32(sp)
    80004c1c:	6145                	addi	sp,sp,48
    80004c1e:	8082                	ret

0000000080004c20 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004c20:	7139                	addi	sp,sp,-64
    80004c22:	fc06                	sd	ra,56(sp)
    80004c24:	f822                	sd	s0,48(sp)
    80004c26:	0080                	addi	s0,sp,64
    80004c28:	87aa                	mv	a5,a0
    80004c2a:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004c2e:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004c32:	fe042623          	sw	zero,-20(s0)
    80004c36:	a2b5                	j	80004da2 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004c38:	fec42783          	lw	a5,-20(s0)
    80004c3c:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c40:	0137571b          	srliw	a4,a4,0x13
    80004c44:	9fb9                	addw	a5,a5,a4
    80004c46:	40d7d79b          	sraiw	a5,a5,0xd
    80004c4a:	2781                	sext.w	a5,a5
    80004c4c:	0007871b          	sext.w	a4,a5
    80004c50:	0001e797          	auipc	a5,0x1e
    80004c54:	51078793          	addi	a5,a5,1296 # 80023160 <sb>
    80004c58:	4fdc                	lw	a5,28(a5)
    80004c5a:	9fb9                	addw	a5,a5,a4
    80004c5c:	0007871b          	sext.w	a4,a5
    80004c60:	fcc42783          	lw	a5,-52(s0)
    80004c64:	85ba                	mv	a1,a4
    80004c66:	853e                	mv	a0,a5
    80004c68:	00000097          	auipc	ra,0x0
    80004c6c:	c66080e7          	jalr	-922(ra) # 800048ce <bread>
    80004c70:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004c74:	fe042423          	sw	zero,-24(s0)
    80004c78:	a0dd                	j	80004d5e <balloc+0x13e>
      m = 1 << (bi % 8);
    80004c7a:	fe842703          	lw	a4,-24(s0)
    80004c7e:	41f7579b          	sraiw	a5,a4,0x1f
    80004c82:	01d7d79b          	srliw	a5,a5,0x1d
    80004c86:	9f3d                	addw	a4,a4,a5
    80004c88:	8b1d                	andi	a4,a4,7
    80004c8a:	40f707bb          	subw	a5,a4,a5
    80004c8e:	2781                	sext.w	a5,a5
    80004c90:	4705                	li	a4,1
    80004c92:	00f717bb          	sllw	a5,a4,a5
    80004c96:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004c9a:	fe842783          	lw	a5,-24(s0)
    80004c9e:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ca2:	01d7571b          	srliw	a4,a4,0x1d
    80004ca6:	9fb9                	addw	a5,a5,a4
    80004ca8:	4037d79b          	sraiw	a5,a5,0x3
    80004cac:	2781                	sext.w	a5,a5
    80004cae:	fe043703          	ld	a4,-32(s0)
    80004cb2:	97ba                	add	a5,a5,a4
    80004cb4:	0587c783          	lbu	a5,88(a5)
    80004cb8:	0007871b          	sext.w	a4,a5
    80004cbc:	fdc42783          	lw	a5,-36(s0)
    80004cc0:	8ff9                	and	a5,a5,a4
    80004cc2:	2781                	sext.w	a5,a5
    80004cc4:	ebc1                	bnez	a5,80004d54 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004cc6:	fe842783          	lw	a5,-24(s0)
    80004cca:	41f7d71b          	sraiw	a4,a5,0x1f
    80004cce:	01d7571b          	srliw	a4,a4,0x1d
    80004cd2:	9fb9                	addw	a5,a5,a4
    80004cd4:	4037d79b          	sraiw	a5,a5,0x3
    80004cd8:	2781                	sext.w	a5,a5
    80004cda:	fe043703          	ld	a4,-32(s0)
    80004cde:	973e                	add	a4,a4,a5
    80004ce0:	05874703          	lbu	a4,88(a4)
    80004ce4:	0187169b          	slliw	a3,a4,0x18
    80004ce8:	4186d69b          	sraiw	a3,a3,0x18
    80004cec:	fdc42703          	lw	a4,-36(s0)
    80004cf0:	0187171b          	slliw	a4,a4,0x18
    80004cf4:	4187571b          	sraiw	a4,a4,0x18
    80004cf8:	8f55                	or	a4,a4,a3
    80004cfa:	0187171b          	slliw	a4,a4,0x18
    80004cfe:	4187571b          	sraiw	a4,a4,0x18
    80004d02:	0ff77713          	andi	a4,a4,255
    80004d06:	fe043683          	ld	a3,-32(s0)
    80004d0a:	97b6                	add	a5,a5,a3
    80004d0c:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004d10:	fe043503          	ld	a0,-32(s0)
    80004d14:	00002097          	auipc	ra,0x2
    80004d18:	916080e7          	jalr	-1770(ra) # 8000662a <log_write>
        brelse(bp);
    80004d1c:	fe043503          	ld	a0,-32(s0)
    80004d20:	00000097          	auipc	ra,0x0
    80004d24:	c58080e7          	jalr	-936(ra) # 80004978 <brelse>
        bzero(dev, b + bi);
    80004d28:	fcc42683          	lw	a3,-52(s0)
    80004d2c:	fec42703          	lw	a4,-20(s0)
    80004d30:	fe842783          	lw	a5,-24(s0)
    80004d34:	9fb9                	addw	a5,a5,a4
    80004d36:	2781                	sext.w	a5,a5
    80004d38:	85be                	mv	a1,a5
    80004d3a:	8536                	mv	a0,a3
    80004d3c:	00000097          	auipc	ra,0x0
    80004d40:	e7c080e7          	jalr	-388(ra) # 80004bb8 <bzero>
        return b + bi;
    80004d44:	fec42703          	lw	a4,-20(s0)
    80004d48:	fe842783          	lw	a5,-24(s0)
    80004d4c:	9fb9                	addw	a5,a5,a4
    80004d4e:	2781                	sext.w	a5,a5
    80004d50:	2781                	sext.w	a5,a5
    80004d52:	a895                	j	80004dc6 <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004d54:	fe842783          	lw	a5,-24(s0)
    80004d58:	2785                	addiw	a5,a5,1
    80004d5a:	fef42423          	sw	a5,-24(s0)
    80004d5e:	fe842783          	lw	a5,-24(s0)
    80004d62:	0007871b          	sext.w	a4,a5
    80004d66:	6789                	lui	a5,0x2
    80004d68:	02f75163          	bge	a4,a5,80004d8a <balloc+0x16a>
    80004d6c:	fec42703          	lw	a4,-20(s0)
    80004d70:	fe842783          	lw	a5,-24(s0)
    80004d74:	9fb9                	addw	a5,a5,a4
    80004d76:	2781                	sext.w	a5,a5
    80004d78:	0007871b          	sext.w	a4,a5
    80004d7c:	0001e797          	auipc	a5,0x1e
    80004d80:	3e478793          	addi	a5,a5,996 # 80023160 <sb>
    80004d84:	43dc                	lw	a5,4(a5)
    80004d86:	eef76ae3          	bltu	a4,a5,80004c7a <balloc+0x5a>
      }
    }
    brelse(bp);
    80004d8a:	fe043503          	ld	a0,-32(s0)
    80004d8e:	00000097          	auipc	ra,0x0
    80004d92:	bea080e7          	jalr	-1046(ra) # 80004978 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004d96:	fec42703          	lw	a4,-20(s0)
    80004d9a:	6789                	lui	a5,0x2
    80004d9c:	9fb9                	addw	a5,a5,a4
    80004d9e:	fef42623          	sw	a5,-20(s0)
    80004da2:	0001e797          	auipc	a5,0x1e
    80004da6:	3be78793          	addi	a5,a5,958 # 80023160 <sb>
    80004daa:	43d8                	lw	a4,4(a5)
    80004dac:	fec42783          	lw	a5,-20(s0)
    80004db0:	e8e7e4e3          	bltu	a5,a4,80004c38 <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004db4:	00007517          	auipc	a0,0x7
    80004db8:	6ec50513          	addi	a0,a0,1772 # 8000c4a0 <etext+0x4a0>
    80004dbc:	ffffc097          	auipc	ra,0xffffc
    80004dc0:	c7a080e7          	jalr	-902(ra) # 80000a36 <printf>
  return 0;
    80004dc4:	4781                	li	a5,0
}
    80004dc6:	853e                	mv	a0,a5
    80004dc8:	70e2                	ld	ra,56(sp)
    80004dca:	7442                	ld	s0,48(sp)
    80004dcc:	6121                	addi	sp,sp,64
    80004dce:	8082                	ret

0000000080004dd0 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004dd0:	7179                	addi	sp,sp,-48
    80004dd2:	f406                	sd	ra,40(sp)
    80004dd4:	f022                	sd	s0,32(sp)
    80004dd6:	1800                	addi	s0,sp,48
    80004dd8:	87aa                	mv	a5,a0
    80004dda:	872e                	mv	a4,a1
    80004ddc:	fcf42e23          	sw	a5,-36(s0)
    80004de0:	87ba                	mv	a5,a4
    80004de2:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004de6:	fdc42683          	lw	a3,-36(s0)
    80004dea:	fd842783          	lw	a5,-40(s0)
    80004dee:	00d7d79b          	srliw	a5,a5,0xd
    80004df2:	0007871b          	sext.w	a4,a5
    80004df6:	0001e797          	auipc	a5,0x1e
    80004dfa:	36a78793          	addi	a5,a5,874 # 80023160 <sb>
    80004dfe:	4fdc                	lw	a5,28(a5)
    80004e00:	9fb9                	addw	a5,a5,a4
    80004e02:	2781                	sext.w	a5,a5
    80004e04:	85be                	mv	a1,a5
    80004e06:	8536                	mv	a0,a3
    80004e08:	00000097          	auipc	ra,0x0
    80004e0c:	ac6080e7          	jalr	-1338(ra) # 800048ce <bread>
    80004e10:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004e14:	fd842703          	lw	a4,-40(s0)
    80004e18:	6789                	lui	a5,0x2
    80004e1a:	17fd                	addi	a5,a5,-1
    80004e1c:	8ff9                	and	a5,a5,a4
    80004e1e:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004e22:	fe442703          	lw	a4,-28(s0)
    80004e26:	41f7579b          	sraiw	a5,a4,0x1f
    80004e2a:	01d7d79b          	srliw	a5,a5,0x1d
    80004e2e:	9f3d                	addw	a4,a4,a5
    80004e30:	8b1d                	andi	a4,a4,7
    80004e32:	40f707bb          	subw	a5,a4,a5
    80004e36:	2781                	sext.w	a5,a5
    80004e38:	4705                	li	a4,1
    80004e3a:	00f717bb          	sllw	a5,a4,a5
    80004e3e:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004e42:	fe442783          	lw	a5,-28(s0)
    80004e46:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e4a:	01d7571b          	srliw	a4,a4,0x1d
    80004e4e:	9fb9                	addw	a5,a5,a4
    80004e50:	4037d79b          	sraiw	a5,a5,0x3
    80004e54:	2781                	sext.w	a5,a5
    80004e56:	fe843703          	ld	a4,-24(s0)
    80004e5a:	97ba                	add	a5,a5,a4
    80004e5c:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004e60:	0007871b          	sext.w	a4,a5
    80004e64:	fe042783          	lw	a5,-32(s0)
    80004e68:	8ff9                	and	a5,a5,a4
    80004e6a:	2781                	sext.w	a5,a5
    80004e6c:	eb89                	bnez	a5,80004e7e <bfree+0xae>
    panic("freeing free block");
    80004e6e:	00007517          	auipc	a0,0x7
    80004e72:	64a50513          	addi	a0,a0,1610 # 8000c4b8 <etext+0x4b8>
    80004e76:	ffffc097          	auipc	ra,0xffffc
    80004e7a:	e16080e7          	jalr	-490(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    80004e7e:	fe442783          	lw	a5,-28(s0)
    80004e82:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e86:	01d7571b          	srliw	a4,a4,0x1d
    80004e8a:	9fb9                	addw	a5,a5,a4
    80004e8c:	4037d79b          	sraiw	a5,a5,0x3
    80004e90:	2781                	sext.w	a5,a5
    80004e92:	fe843703          	ld	a4,-24(s0)
    80004e96:	973e                	add	a4,a4,a5
    80004e98:	05874703          	lbu	a4,88(a4)
    80004e9c:	0187169b          	slliw	a3,a4,0x18
    80004ea0:	4186d69b          	sraiw	a3,a3,0x18
    80004ea4:	fe042703          	lw	a4,-32(s0)
    80004ea8:	0187171b          	slliw	a4,a4,0x18
    80004eac:	4187571b          	sraiw	a4,a4,0x18
    80004eb0:	fff74713          	not	a4,a4
    80004eb4:	0187171b          	slliw	a4,a4,0x18
    80004eb8:	4187571b          	sraiw	a4,a4,0x18
    80004ebc:	8f75                	and	a4,a4,a3
    80004ebe:	0187171b          	slliw	a4,a4,0x18
    80004ec2:	4187571b          	sraiw	a4,a4,0x18
    80004ec6:	0ff77713          	andi	a4,a4,255
    80004eca:	fe843683          	ld	a3,-24(s0)
    80004ece:	97b6                	add	a5,a5,a3
    80004ed0:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004ed4:	fe843503          	ld	a0,-24(s0)
    80004ed8:	00001097          	auipc	ra,0x1
    80004edc:	752080e7          	jalr	1874(ra) # 8000662a <log_write>
  brelse(bp);
    80004ee0:	fe843503          	ld	a0,-24(s0)
    80004ee4:	00000097          	auipc	ra,0x0
    80004ee8:	a94080e7          	jalr	-1388(ra) # 80004978 <brelse>
}
    80004eec:	0001                	nop
    80004eee:	70a2                	ld	ra,40(sp)
    80004ef0:	7402                	ld	s0,32(sp)
    80004ef2:	6145                	addi	sp,sp,48
    80004ef4:	8082                	ret

0000000080004ef6 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004ef6:	1101                	addi	sp,sp,-32
    80004ef8:	ec06                	sd	ra,24(sp)
    80004efa:	e822                	sd	s0,16(sp)
    80004efc:	1000                	addi	s0,sp,32
  int i = 0;
    80004efe:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004f02:	00007597          	auipc	a1,0x7
    80004f06:	5ce58593          	addi	a1,a1,1486 # 8000c4d0 <etext+0x4d0>
    80004f0a:	0001e517          	auipc	a0,0x1e
    80004f0e:	27650513          	addi	a0,a0,630 # 80023180 <itable>
    80004f12:	ffffc097          	auipc	ra,0xffffc
    80004f16:	3fa080e7          	jalr	1018(ra) # 8000130c <initlock>
  for(i = 0; i < NINODE; i++) {
    80004f1a:	fe042623          	sw	zero,-20(s0)
    80004f1e:	a82d                	j	80004f58 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004f20:	fec42703          	lw	a4,-20(s0)
    80004f24:	87ba                	mv	a5,a4
    80004f26:	0792                	slli	a5,a5,0x4
    80004f28:	97ba                	add	a5,a5,a4
    80004f2a:	078e                	slli	a5,a5,0x3
    80004f2c:	02078713          	addi	a4,a5,32
    80004f30:	0001e797          	auipc	a5,0x1e
    80004f34:	25078793          	addi	a5,a5,592 # 80023180 <itable>
    80004f38:	97ba                	add	a5,a5,a4
    80004f3a:	07a1                	addi	a5,a5,8
    80004f3c:	00007597          	auipc	a1,0x7
    80004f40:	59c58593          	addi	a1,a1,1436 # 8000c4d8 <etext+0x4d8>
    80004f44:	853e                	mv	a0,a5
    80004f46:	00002097          	auipc	ra,0x2
    80004f4a:	818080e7          	jalr	-2024(ra) # 8000675e <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004f4e:	fec42783          	lw	a5,-20(s0)
    80004f52:	2785                	addiw	a5,a5,1
    80004f54:	fef42623          	sw	a5,-20(s0)
    80004f58:	fec42783          	lw	a5,-20(s0)
    80004f5c:	0007871b          	sext.w	a4,a5
    80004f60:	03100793          	li	a5,49
    80004f64:	fae7dee3          	bge	a5,a4,80004f20 <iinit+0x2a>
  }
}
    80004f68:	0001                	nop
    80004f6a:	0001                	nop
    80004f6c:	60e2                	ld	ra,24(sp)
    80004f6e:	6442                	ld	s0,16(sp)
    80004f70:	6105                	addi	sp,sp,32
    80004f72:	8082                	ret

0000000080004f74 <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004f74:	7139                	addi	sp,sp,-64
    80004f76:	fc06                	sd	ra,56(sp)
    80004f78:	f822                	sd	s0,48(sp)
    80004f7a:	0080                	addi	s0,sp,64
    80004f7c:	87aa                	mv	a5,a0
    80004f7e:	872e                	mv	a4,a1
    80004f80:	fcf42623          	sw	a5,-52(s0)
    80004f84:	87ba                	mv	a5,a4
    80004f86:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004f8a:	4785                	li	a5,1
    80004f8c:	fef42623          	sw	a5,-20(s0)
    80004f90:	a855                	j	80005044 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004f92:	fec42783          	lw	a5,-20(s0)
    80004f96:	8391                	srli	a5,a5,0x4
    80004f98:	0007871b          	sext.w	a4,a5
    80004f9c:	0001e797          	auipc	a5,0x1e
    80004fa0:	1c478793          	addi	a5,a5,452 # 80023160 <sb>
    80004fa4:	4f9c                	lw	a5,24(a5)
    80004fa6:	9fb9                	addw	a5,a5,a4
    80004fa8:	0007871b          	sext.w	a4,a5
    80004fac:	fcc42783          	lw	a5,-52(s0)
    80004fb0:	85ba                	mv	a1,a4
    80004fb2:	853e                	mv	a0,a5
    80004fb4:	00000097          	auipc	ra,0x0
    80004fb8:	91a080e7          	jalr	-1766(ra) # 800048ce <bread>
    80004fbc:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004fc0:	fe043783          	ld	a5,-32(s0)
    80004fc4:	05878713          	addi	a4,a5,88
    80004fc8:	fec42783          	lw	a5,-20(s0)
    80004fcc:	8bbd                	andi	a5,a5,15
    80004fce:	079a                	slli	a5,a5,0x6
    80004fd0:	97ba                	add	a5,a5,a4
    80004fd2:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80004fd6:	fd843783          	ld	a5,-40(s0)
    80004fda:	00079783          	lh	a5,0(a5)
    80004fde:	eba1                	bnez	a5,8000502e <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80004fe0:	04000613          	li	a2,64
    80004fe4:	4581                	li	a1,0
    80004fe6:	fd843503          	ld	a0,-40(s0)
    80004fea:	ffffc097          	auipc	ra,0xffffc
    80004fee:	526080e7          	jalr	1318(ra) # 80001510 <memset>
      dip->type = type;
    80004ff2:	fd843783          	ld	a5,-40(s0)
    80004ff6:	fca45703          	lhu	a4,-54(s0)
    80004ffa:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80004ffe:	fe043503          	ld	a0,-32(s0)
    80005002:	00001097          	auipc	ra,0x1
    80005006:	628080e7          	jalr	1576(ra) # 8000662a <log_write>
      brelse(bp);
    8000500a:	fe043503          	ld	a0,-32(s0)
    8000500e:	00000097          	auipc	ra,0x0
    80005012:	96a080e7          	jalr	-1686(ra) # 80004978 <brelse>
      return iget(dev, inum);
    80005016:	fec42703          	lw	a4,-20(s0)
    8000501a:	fcc42783          	lw	a5,-52(s0)
    8000501e:	85ba                	mv	a1,a4
    80005020:	853e                	mv	a0,a5
    80005022:	00000097          	auipc	ra,0x0
    80005026:	138080e7          	jalr	312(ra) # 8000515a <iget>
    8000502a:	87aa                	mv	a5,a0
    8000502c:	a835                	j	80005068 <ialloc+0xf4>
    }
    brelse(bp);
    8000502e:	fe043503          	ld	a0,-32(s0)
    80005032:	00000097          	auipc	ra,0x0
    80005036:	946080e7          	jalr	-1722(ra) # 80004978 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    8000503a:	fec42783          	lw	a5,-20(s0)
    8000503e:	2785                	addiw	a5,a5,1
    80005040:	fef42623          	sw	a5,-20(s0)
    80005044:	0001e797          	auipc	a5,0x1e
    80005048:	11c78793          	addi	a5,a5,284 # 80023160 <sb>
    8000504c:	47d8                	lw	a4,12(a5)
    8000504e:	fec42783          	lw	a5,-20(s0)
    80005052:	f4e7e0e3          	bltu	a5,a4,80004f92 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    80005056:	00007517          	auipc	a0,0x7
    8000505a:	48a50513          	addi	a0,a0,1162 # 8000c4e0 <etext+0x4e0>
    8000505e:	ffffc097          	auipc	ra,0xffffc
    80005062:	9d8080e7          	jalr	-1576(ra) # 80000a36 <printf>
  return 0;
    80005066:	4781                	li	a5,0
}
    80005068:	853e                	mv	a0,a5
    8000506a:	70e2                	ld	ra,56(sp)
    8000506c:	7442                	ld	s0,48(sp)
    8000506e:	6121                	addi	sp,sp,64
    80005070:	8082                	ret

0000000080005072 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80005072:	7179                	addi	sp,sp,-48
    80005074:	f406                	sd	ra,40(sp)
    80005076:	f022                	sd	s0,32(sp)
    80005078:	1800                	addi	s0,sp,48
    8000507a:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000507e:	fd843783          	ld	a5,-40(s0)
    80005082:	4394                	lw	a3,0(a5)
    80005084:	fd843783          	ld	a5,-40(s0)
    80005088:	43dc                	lw	a5,4(a5)
    8000508a:	0047d79b          	srliw	a5,a5,0x4
    8000508e:	0007871b          	sext.w	a4,a5
    80005092:	0001e797          	auipc	a5,0x1e
    80005096:	0ce78793          	addi	a5,a5,206 # 80023160 <sb>
    8000509a:	4f9c                	lw	a5,24(a5)
    8000509c:	9fb9                	addw	a5,a5,a4
    8000509e:	2781                	sext.w	a5,a5
    800050a0:	85be                	mv	a1,a5
    800050a2:	8536                	mv	a0,a3
    800050a4:	00000097          	auipc	ra,0x0
    800050a8:	82a080e7          	jalr	-2006(ra) # 800048ce <bread>
    800050ac:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    800050b0:	fe843783          	ld	a5,-24(s0)
    800050b4:	05878713          	addi	a4,a5,88
    800050b8:	fd843783          	ld	a5,-40(s0)
    800050bc:	43dc                	lw	a5,4(a5)
    800050be:	1782                	slli	a5,a5,0x20
    800050c0:	9381                	srli	a5,a5,0x20
    800050c2:	8bbd                	andi	a5,a5,15
    800050c4:	079a                	slli	a5,a5,0x6
    800050c6:	97ba                	add	a5,a5,a4
    800050c8:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    800050cc:	fd843783          	ld	a5,-40(s0)
    800050d0:	04479703          	lh	a4,68(a5)
    800050d4:	fe043783          	ld	a5,-32(s0)
    800050d8:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    800050dc:	fd843783          	ld	a5,-40(s0)
    800050e0:	04679703          	lh	a4,70(a5)
    800050e4:	fe043783          	ld	a5,-32(s0)
    800050e8:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    800050ec:	fd843783          	ld	a5,-40(s0)
    800050f0:	04879703          	lh	a4,72(a5)
    800050f4:	fe043783          	ld	a5,-32(s0)
    800050f8:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    800050fc:	fd843783          	ld	a5,-40(s0)
    80005100:	04a79703          	lh	a4,74(a5)
    80005104:	fe043783          	ld	a5,-32(s0)
    80005108:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    8000510c:	fd843783          	ld	a5,-40(s0)
    80005110:	47f8                	lw	a4,76(a5)
    80005112:	fe043783          	ld	a5,-32(s0)
    80005116:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005118:	fe043783          	ld	a5,-32(s0)
    8000511c:	00c78713          	addi	a4,a5,12
    80005120:	fd843783          	ld	a5,-40(s0)
    80005124:	05078793          	addi	a5,a5,80
    80005128:	03400613          	li	a2,52
    8000512c:	85be                	mv	a1,a5
    8000512e:	853a                	mv	a0,a4
    80005130:	ffffc097          	auipc	ra,0xffffc
    80005134:	4c4080e7          	jalr	1220(ra) # 800015f4 <memmove>
  log_write(bp);
    80005138:	fe843503          	ld	a0,-24(s0)
    8000513c:	00001097          	auipc	ra,0x1
    80005140:	4ee080e7          	jalr	1262(ra) # 8000662a <log_write>
  brelse(bp);
    80005144:	fe843503          	ld	a0,-24(s0)
    80005148:	00000097          	auipc	ra,0x0
    8000514c:	830080e7          	jalr	-2000(ra) # 80004978 <brelse>
}
    80005150:	0001                	nop
    80005152:	70a2                	ld	ra,40(sp)
    80005154:	7402                	ld	s0,32(sp)
    80005156:	6145                	addi	sp,sp,48
    80005158:	8082                	ret

000000008000515a <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    8000515a:	7179                	addi	sp,sp,-48
    8000515c:	f406                	sd	ra,40(sp)
    8000515e:	f022                	sd	s0,32(sp)
    80005160:	1800                	addi	s0,sp,48
    80005162:	87aa                	mv	a5,a0
    80005164:	872e                	mv	a4,a1
    80005166:	fcf42e23          	sw	a5,-36(s0)
    8000516a:	87ba                	mv	a5,a4
    8000516c:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80005170:	0001e517          	auipc	a0,0x1e
    80005174:	01050513          	addi	a0,a0,16 # 80023180 <itable>
    80005178:	ffffc097          	auipc	ra,0xffffc
    8000517c:	1c4080e7          	jalr	452(ra) # 8000133c <acquire>

  // Is the inode already in the table?
  empty = 0;
    80005180:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005184:	0001e797          	auipc	a5,0x1e
    80005188:	01478793          	addi	a5,a5,20 # 80023198 <itable+0x18>
    8000518c:	fef43423          	sd	a5,-24(s0)
    80005190:	a89d                	j	80005206 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    80005192:	fe843783          	ld	a5,-24(s0)
    80005196:	479c                	lw	a5,8(a5)
    80005198:	04f05663          	blez	a5,800051e4 <iget+0x8a>
    8000519c:	fe843783          	ld	a5,-24(s0)
    800051a0:	4398                	lw	a4,0(a5)
    800051a2:	fdc42783          	lw	a5,-36(s0)
    800051a6:	2781                	sext.w	a5,a5
    800051a8:	02e79e63          	bne	a5,a4,800051e4 <iget+0x8a>
    800051ac:	fe843783          	ld	a5,-24(s0)
    800051b0:	43d8                	lw	a4,4(a5)
    800051b2:	fd842783          	lw	a5,-40(s0)
    800051b6:	2781                	sext.w	a5,a5
    800051b8:	02e79663          	bne	a5,a4,800051e4 <iget+0x8a>
      ip->ref++;
    800051bc:	fe843783          	ld	a5,-24(s0)
    800051c0:	479c                	lw	a5,8(a5)
    800051c2:	2785                	addiw	a5,a5,1
    800051c4:	0007871b          	sext.w	a4,a5
    800051c8:	fe843783          	ld	a5,-24(s0)
    800051cc:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    800051ce:	0001e517          	auipc	a0,0x1e
    800051d2:	fb250513          	addi	a0,a0,-78 # 80023180 <itable>
    800051d6:	ffffc097          	auipc	ra,0xffffc
    800051da:	1ca080e7          	jalr	458(ra) # 800013a0 <release>
      return ip;
    800051de:	fe843783          	ld	a5,-24(s0)
    800051e2:	a069                	j	8000526c <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    800051e4:	fe043783          	ld	a5,-32(s0)
    800051e8:	eb89                	bnez	a5,800051fa <iget+0xa0>
    800051ea:	fe843783          	ld	a5,-24(s0)
    800051ee:	479c                	lw	a5,8(a5)
    800051f0:	e789                	bnez	a5,800051fa <iget+0xa0>
      empty = ip;
    800051f2:	fe843783          	ld	a5,-24(s0)
    800051f6:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800051fa:	fe843783          	ld	a5,-24(s0)
    800051fe:	08878793          	addi	a5,a5,136
    80005202:	fef43423          	sd	a5,-24(s0)
    80005206:	fe843703          	ld	a4,-24(s0)
    8000520a:	00020797          	auipc	a5,0x20
    8000520e:	a1e78793          	addi	a5,a5,-1506 # 80024c28 <log>
    80005212:	f8f760e3          	bltu	a4,a5,80005192 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80005216:	fe043783          	ld	a5,-32(s0)
    8000521a:	eb89                	bnez	a5,8000522c <iget+0xd2>
    panic("iget: no inodes");
    8000521c:	00007517          	auipc	a0,0x7
    80005220:	2dc50513          	addi	a0,a0,732 # 8000c4f8 <etext+0x4f8>
    80005224:	ffffc097          	auipc	ra,0xffffc
    80005228:	a68080e7          	jalr	-1432(ra) # 80000c8c <panic>

  ip = empty;
    8000522c:	fe043783          	ld	a5,-32(s0)
    80005230:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005234:	fe843783          	ld	a5,-24(s0)
    80005238:	fdc42703          	lw	a4,-36(s0)
    8000523c:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000523e:	fe843783          	ld	a5,-24(s0)
    80005242:	fd842703          	lw	a4,-40(s0)
    80005246:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005248:	fe843783          	ld	a5,-24(s0)
    8000524c:	4705                	li	a4,1
    8000524e:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80005250:	fe843783          	ld	a5,-24(s0)
    80005254:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005258:	0001e517          	auipc	a0,0x1e
    8000525c:	f2850513          	addi	a0,a0,-216 # 80023180 <itable>
    80005260:	ffffc097          	auipc	ra,0xffffc
    80005264:	140080e7          	jalr	320(ra) # 800013a0 <release>

  return ip;
    80005268:	fe843783          	ld	a5,-24(s0)
}
    8000526c:	853e                	mv	a0,a5
    8000526e:	70a2                	ld	ra,40(sp)
    80005270:	7402                	ld	s0,32(sp)
    80005272:	6145                	addi	sp,sp,48
    80005274:	8082                	ret

0000000080005276 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    80005276:	1101                	addi	sp,sp,-32
    80005278:	ec06                	sd	ra,24(sp)
    8000527a:	e822                	sd	s0,16(sp)
    8000527c:	1000                	addi	s0,sp,32
    8000527e:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80005282:	0001e517          	auipc	a0,0x1e
    80005286:	efe50513          	addi	a0,a0,-258 # 80023180 <itable>
    8000528a:	ffffc097          	auipc	ra,0xffffc
    8000528e:	0b2080e7          	jalr	178(ra) # 8000133c <acquire>
  ip->ref++;
    80005292:	fe843783          	ld	a5,-24(s0)
    80005296:	479c                	lw	a5,8(a5)
    80005298:	2785                	addiw	a5,a5,1
    8000529a:	0007871b          	sext.w	a4,a5
    8000529e:	fe843783          	ld	a5,-24(s0)
    800052a2:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800052a4:	0001e517          	auipc	a0,0x1e
    800052a8:	edc50513          	addi	a0,a0,-292 # 80023180 <itable>
    800052ac:	ffffc097          	auipc	ra,0xffffc
    800052b0:	0f4080e7          	jalr	244(ra) # 800013a0 <release>
  return ip;
    800052b4:	fe843783          	ld	a5,-24(s0)
}
    800052b8:	853e                	mv	a0,a5
    800052ba:	60e2                	ld	ra,24(sp)
    800052bc:	6442                	ld	s0,16(sp)
    800052be:	6105                	addi	sp,sp,32
    800052c0:	8082                	ret

00000000800052c2 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    800052c2:	7179                	addi	sp,sp,-48
    800052c4:	f406                	sd	ra,40(sp)
    800052c6:	f022                	sd	s0,32(sp)
    800052c8:	1800                	addi	s0,sp,48
    800052ca:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800052ce:	fd843783          	ld	a5,-40(s0)
    800052d2:	c791                	beqz	a5,800052de <ilock+0x1c>
    800052d4:	fd843783          	ld	a5,-40(s0)
    800052d8:	479c                	lw	a5,8(a5)
    800052da:	00f04a63          	bgtz	a5,800052ee <ilock+0x2c>
    panic("ilock");
    800052de:	00007517          	auipc	a0,0x7
    800052e2:	22a50513          	addi	a0,a0,554 # 8000c508 <etext+0x508>
    800052e6:	ffffc097          	auipc	ra,0xffffc
    800052ea:	9a6080e7          	jalr	-1626(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    800052ee:	fd843783          	ld	a5,-40(s0)
    800052f2:	07c1                	addi	a5,a5,16
    800052f4:	853e                	mv	a0,a5
    800052f6:	00001097          	auipc	ra,0x1
    800052fa:	4b4080e7          	jalr	1204(ra) # 800067aa <acquiresleep>

  if(ip->valid == 0){
    800052fe:	fd843783          	ld	a5,-40(s0)
    80005302:	43bc                	lw	a5,64(a5)
    80005304:	e7e5                	bnez	a5,800053ec <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005306:	fd843783          	ld	a5,-40(s0)
    8000530a:	4394                	lw	a3,0(a5)
    8000530c:	fd843783          	ld	a5,-40(s0)
    80005310:	43dc                	lw	a5,4(a5)
    80005312:	0047d79b          	srliw	a5,a5,0x4
    80005316:	0007871b          	sext.w	a4,a5
    8000531a:	0001e797          	auipc	a5,0x1e
    8000531e:	e4678793          	addi	a5,a5,-442 # 80023160 <sb>
    80005322:	4f9c                	lw	a5,24(a5)
    80005324:	9fb9                	addw	a5,a5,a4
    80005326:	2781                	sext.w	a5,a5
    80005328:	85be                	mv	a1,a5
    8000532a:	8536                	mv	a0,a3
    8000532c:	fffff097          	auipc	ra,0xfffff
    80005330:	5a2080e7          	jalr	1442(ra) # 800048ce <bread>
    80005334:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005338:	fe843783          	ld	a5,-24(s0)
    8000533c:	05878713          	addi	a4,a5,88
    80005340:	fd843783          	ld	a5,-40(s0)
    80005344:	43dc                	lw	a5,4(a5)
    80005346:	1782                	slli	a5,a5,0x20
    80005348:	9381                	srli	a5,a5,0x20
    8000534a:	8bbd                	andi	a5,a5,15
    8000534c:	079a                	slli	a5,a5,0x6
    8000534e:	97ba                	add	a5,a5,a4
    80005350:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005354:	fe043783          	ld	a5,-32(s0)
    80005358:	00079703          	lh	a4,0(a5)
    8000535c:	fd843783          	ld	a5,-40(s0)
    80005360:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    80005364:	fe043783          	ld	a5,-32(s0)
    80005368:	00279703          	lh	a4,2(a5)
    8000536c:	fd843783          	ld	a5,-40(s0)
    80005370:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    80005374:	fe043783          	ld	a5,-32(s0)
    80005378:	00479703          	lh	a4,4(a5)
    8000537c:	fd843783          	ld	a5,-40(s0)
    80005380:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    80005384:	fe043783          	ld	a5,-32(s0)
    80005388:	00679703          	lh	a4,6(a5)
    8000538c:	fd843783          	ld	a5,-40(s0)
    80005390:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    80005394:	fe043783          	ld	a5,-32(s0)
    80005398:	4798                	lw	a4,8(a5)
    8000539a:	fd843783          	ld	a5,-40(s0)
    8000539e:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800053a0:	fd843783          	ld	a5,-40(s0)
    800053a4:	05078713          	addi	a4,a5,80
    800053a8:	fe043783          	ld	a5,-32(s0)
    800053ac:	07b1                	addi	a5,a5,12
    800053ae:	03400613          	li	a2,52
    800053b2:	85be                	mv	a1,a5
    800053b4:	853a                	mv	a0,a4
    800053b6:	ffffc097          	auipc	ra,0xffffc
    800053ba:	23e080e7          	jalr	574(ra) # 800015f4 <memmove>
    brelse(bp);
    800053be:	fe843503          	ld	a0,-24(s0)
    800053c2:	fffff097          	auipc	ra,0xfffff
    800053c6:	5b6080e7          	jalr	1462(ra) # 80004978 <brelse>
    ip->valid = 1;
    800053ca:	fd843783          	ld	a5,-40(s0)
    800053ce:	4705                	li	a4,1
    800053d0:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    800053d2:	fd843783          	ld	a5,-40(s0)
    800053d6:	04479783          	lh	a5,68(a5)
    800053da:	eb89                	bnez	a5,800053ec <ilock+0x12a>
      panic("ilock: no type");
    800053dc:	00007517          	auipc	a0,0x7
    800053e0:	13450513          	addi	a0,a0,308 # 8000c510 <etext+0x510>
    800053e4:	ffffc097          	auipc	ra,0xffffc
    800053e8:	8a8080e7          	jalr	-1880(ra) # 80000c8c <panic>
  }
}
    800053ec:	0001                	nop
    800053ee:	70a2                	ld	ra,40(sp)
    800053f0:	7402                	ld	s0,32(sp)
    800053f2:	6145                	addi	sp,sp,48
    800053f4:	8082                	ret

00000000800053f6 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    800053f6:	1101                	addi	sp,sp,-32
    800053f8:	ec06                	sd	ra,24(sp)
    800053fa:	e822                	sd	s0,16(sp)
    800053fc:	1000                	addi	s0,sp,32
    800053fe:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005402:	fe843783          	ld	a5,-24(s0)
    80005406:	c385                	beqz	a5,80005426 <iunlock+0x30>
    80005408:	fe843783          	ld	a5,-24(s0)
    8000540c:	07c1                	addi	a5,a5,16
    8000540e:	853e                	mv	a0,a5
    80005410:	00001097          	auipc	ra,0x1
    80005414:	45a080e7          	jalr	1114(ra) # 8000686a <holdingsleep>
    80005418:	87aa                	mv	a5,a0
    8000541a:	c791                	beqz	a5,80005426 <iunlock+0x30>
    8000541c:	fe843783          	ld	a5,-24(s0)
    80005420:	479c                	lw	a5,8(a5)
    80005422:	00f04a63          	bgtz	a5,80005436 <iunlock+0x40>
    panic("iunlock");
    80005426:	00007517          	auipc	a0,0x7
    8000542a:	0fa50513          	addi	a0,a0,250 # 8000c520 <etext+0x520>
    8000542e:	ffffc097          	auipc	ra,0xffffc
    80005432:	85e080e7          	jalr	-1954(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    80005436:	fe843783          	ld	a5,-24(s0)
    8000543a:	07c1                	addi	a5,a5,16
    8000543c:	853e                	mv	a0,a5
    8000543e:	00001097          	auipc	ra,0x1
    80005442:	3da080e7          	jalr	986(ra) # 80006818 <releasesleep>
}
    80005446:	0001                	nop
    80005448:	60e2                	ld	ra,24(sp)
    8000544a:	6442                	ld	s0,16(sp)
    8000544c:	6105                	addi	sp,sp,32
    8000544e:	8082                	ret

0000000080005450 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    80005450:	1101                	addi	sp,sp,-32
    80005452:	ec06                	sd	ra,24(sp)
    80005454:	e822                	sd	s0,16(sp)
    80005456:	1000                	addi	s0,sp,32
    80005458:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000545c:	0001e517          	auipc	a0,0x1e
    80005460:	d2450513          	addi	a0,a0,-732 # 80023180 <itable>
    80005464:	ffffc097          	auipc	ra,0xffffc
    80005468:	ed8080e7          	jalr	-296(ra) # 8000133c <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    8000546c:	fe843783          	ld	a5,-24(s0)
    80005470:	479c                	lw	a5,8(a5)
    80005472:	873e                	mv	a4,a5
    80005474:	4785                	li	a5,1
    80005476:	06f71f63          	bne	a4,a5,800054f4 <iput+0xa4>
    8000547a:	fe843783          	ld	a5,-24(s0)
    8000547e:	43bc                	lw	a5,64(a5)
    80005480:	cbb5                	beqz	a5,800054f4 <iput+0xa4>
    80005482:	fe843783          	ld	a5,-24(s0)
    80005486:	04a79783          	lh	a5,74(a5)
    8000548a:	e7ad                	bnez	a5,800054f4 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    8000548c:	fe843783          	ld	a5,-24(s0)
    80005490:	07c1                	addi	a5,a5,16
    80005492:	853e                	mv	a0,a5
    80005494:	00001097          	auipc	ra,0x1
    80005498:	316080e7          	jalr	790(ra) # 800067aa <acquiresleep>

    release(&itable.lock);
    8000549c:	0001e517          	auipc	a0,0x1e
    800054a0:	ce450513          	addi	a0,a0,-796 # 80023180 <itable>
    800054a4:	ffffc097          	auipc	ra,0xffffc
    800054a8:	efc080e7          	jalr	-260(ra) # 800013a0 <release>

    itrunc(ip);
    800054ac:	fe843503          	ld	a0,-24(s0)
    800054b0:	00000097          	auipc	ra,0x0
    800054b4:	21a080e7          	jalr	538(ra) # 800056ca <itrunc>
    ip->type = 0;
    800054b8:	fe843783          	ld	a5,-24(s0)
    800054bc:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    800054c0:	fe843503          	ld	a0,-24(s0)
    800054c4:	00000097          	auipc	ra,0x0
    800054c8:	bae080e7          	jalr	-1106(ra) # 80005072 <iupdate>
    ip->valid = 0;
    800054cc:	fe843783          	ld	a5,-24(s0)
    800054d0:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    800054d4:	fe843783          	ld	a5,-24(s0)
    800054d8:	07c1                	addi	a5,a5,16
    800054da:	853e                	mv	a0,a5
    800054dc:	00001097          	auipc	ra,0x1
    800054e0:	33c080e7          	jalr	828(ra) # 80006818 <releasesleep>

    acquire(&itable.lock);
    800054e4:	0001e517          	auipc	a0,0x1e
    800054e8:	c9c50513          	addi	a0,a0,-868 # 80023180 <itable>
    800054ec:	ffffc097          	auipc	ra,0xffffc
    800054f0:	e50080e7          	jalr	-432(ra) # 8000133c <acquire>
  }

  ip->ref--;
    800054f4:	fe843783          	ld	a5,-24(s0)
    800054f8:	479c                	lw	a5,8(a5)
    800054fa:	37fd                	addiw	a5,a5,-1
    800054fc:	0007871b          	sext.w	a4,a5
    80005500:	fe843783          	ld	a5,-24(s0)
    80005504:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005506:	0001e517          	auipc	a0,0x1e
    8000550a:	c7a50513          	addi	a0,a0,-902 # 80023180 <itable>
    8000550e:	ffffc097          	auipc	ra,0xffffc
    80005512:	e92080e7          	jalr	-366(ra) # 800013a0 <release>
}
    80005516:	0001                	nop
    80005518:	60e2                	ld	ra,24(sp)
    8000551a:	6442                	ld	s0,16(sp)
    8000551c:	6105                	addi	sp,sp,32
    8000551e:	8082                	ret

0000000080005520 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005520:	1101                	addi	sp,sp,-32
    80005522:	ec06                	sd	ra,24(sp)
    80005524:	e822                	sd	s0,16(sp)
    80005526:	1000                	addi	s0,sp,32
    80005528:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000552c:	fe843503          	ld	a0,-24(s0)
    80005530:	00000097          	auipc	ra,0x0
    80005534:	ec6080e7          	jalr	-314(ra) # 800053f6 <iunlock>
  iput(ip);
    80005538:	fe843503          	ld	a0,-24(s0)
    8000553c:	00000097          	auipc	ra,0x0
    80005540:	f14080e7          	jalr	-236(ra) # 80005450 <iput>
}
    80005544:	0001                	nop
    80005546:	60e2                	ld	ra,24(sp)
    80005548:	6442                	ld	s0,16(sp)
    8000554a:	6105                	addi	sp,sp,32
    8000554c:	8082                	ret

000000008000554e <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    8000554e:	7139                	addi	sp,sp,-64
    80005550:	fc06                	sd	ra,56(sp)
    80005552:	f822                	sd	s0,48(sp)
    80005554:	0080                	addi	s0,sp,64
    80005556:	fca43423          	sd	a0,-56(s0)
    8000555a:	87ae                	mv	a5,a1
    8000555c:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80005560:	fc442783          	lw	a5,-60(s0)
    80005564:	0007871b          	sext.w	a4,a5
    80005568:	47ad                	li	a5,11
    8000556a:	04e7ee63          	bltu	a5,a4,800055c6 <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    8000556e:	fc843703          	ld	a4,-56(s0)
    80005572:	fc446783          	lwu	a5,-60(s0)
    80005576:	07d1                	addi	a5,a5,20
    80005578:	078a                	slli	a5,a5,0x2
    8000557a:	97ba                	add	a5,a5,a4
    8000557c:	439c                	lw	a5,0(a5)
    8000557e:	fef42623          	sw	a5,-20(s0)
    80005582:	fec42783          	lw	a5,-20(s0)
    80005586:	2781                	sext.w	a5,a5
    80005588:	ef85                	bnez	a5,800055c0 <bmap+0x72>
      addr = balloc(ip->dev);
    8000558a:	fc843783          	ld	a5,-56(s0)
    8000558e:	439c                	lw	a5,0(a5)
    80005590:	853e                	mv	a0,a5
    80005592:	fffff097          	auipc	ra,0xfffff
    80005596:	68e080e7          	jalr	1678(ra) # 80004c20 <balloc>
    8000559a:	87aa                	mv	a5,a0
    8000559c:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800055a0:	fec42783          	lw	a5,-20(s0)
    800055a4:	2781                	sext.w	a5,a5
    800055a6:	e399                	bnez	a5,800055ac <bmap+0x5e>
        return 0;
    800055a8:	4781                	li	a5,0
    800055aa:	aa19                	j	800056c0 <bmap+0x172>
      ip->addrs[bn] = addr;
    800055ac:	fc843703          	ld	a4,-56(s0)
    800055b0:	fc446783          	lwu	a5,-60(s0)
    800055b4:	07d1                	addi	a5,a5,20
    800055b6:	078a                	slli	a5,a5,0x2
    800055b8:	97ba                	add	a5,a5,a4
    800055ba:	fec42703          	lw	a4,-20(s0)
    800055be:	c398                	sw	a4,0(a5)
    }
    return addr;
    800055c0:	fec42783          	lw	a5,-20(s0)
    800055c4:	a8f5                	j	800056c0 <bmap+0x172>
  }
  bn -= NDIRECT;
    800055c6:	fc442783          	lw	a5,-60(s0)
    800055ca:	37d1                	addiw	a5,a5,-12
    800055cc:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    800055d0:	fc442783          	lw	a5,-60(s0)
    800055d4:	0007871b          	sext.w	a4,a5
    800055d8:	0ff00793          	li	a5,255
    800055dc:	0ce7ea63          	bltu	a5,a4,800056b0 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    800055e0:	fc843783          	ld	a5,-56(s0)
    800055e4:	0807a783          	lw	a5,128(a5)
    800055e8:	fef42623          	sw	a5,-20(s0)
    800055ec:	fec42783          	lw	a5,-20(s0)
    800055f0:	2781                	sext.w	a5,a5
    800055f2:	eb85                	bnez	a5,80005622 <bmap+0xd4>
      addr = balloc(ip->dev);
    800055f4:	fc843783          	ld	a5,-56(s0)
    800055f8:	439c                	lw	a5,0(a5)
    800055fa:	853e                	mv	a0,a5
    800055fc:	fffff097          	auipc	ra,0xfffff
    80005600:	624080e7          	jalr	1572(ra) # 80004c20 <balloc>
    80005604:	87aa                	mv	a5,a0
    80005606:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    8000560a:	fec42783          	lw	a5,-20(s0)
    8000560e:	2781                	sext.w	a5,a5
    80005610:	e399                	bnez	a5,80005616 <bmap+0xc8>
        return 0;
    80005612:	4781                	li	a5,0
    80005614:	a075                	j	800056c0 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    80005616:	fc843783          	ld	a5,-56(s0)
    8000561a:	fec42703          	lw	a4,-20(s0)
    8000561e:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005622:	fc843783          	ld	a5,-56(s0)
    80005626:	439c                	lw	a5,0(a5)
    80005628:	fec42703          	lw	a4,-20(s0)
    8000562c:	85ba                	mv	a1,a4
    8000562e:	853e                	mv	a0,a5
    80005630:	fffff097          	auipc	ra,0xfffff
    80005634:	29e080e7          	jalr	670(ra) # 800048ce <bread>
    80005638:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    8000563c:	fe043783          	ld	a5,-32(s0)
    80005640:	05878793          	addi	a5,a5,88
    80005644:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005648:	fc446783          	lwu	a5,-60(s0)
    8000564c:	078a                	slli	a5,a5,0x2
    8000564e:	fd843703          	ld	a4,-40(s0)
    80005652:	97ba                	add	a5,a5,a4
    80005654:	439c                	lw	a5,0(a5)
    80005656:	fef42623          	sw	a5,-20(s0)
    8000565a:	fec42783          	lw	a5,-20(s0)
    8000565e:	2781                	sext.w	a5,a5
    80005660:	ef9d                	bnez	a5,8000569e <bmap+0x150>
      addr = balloc(ip->dev);
    80005662:	fc843783          	ld	a5,-56(s0)
    80005666:	439c                	lw	a5,0(a5)
    80005668:	853e                	mv	a0,a5
    8000566a:	fffff097          	auipc	ra,0xfffff
    8000566e:	5b6080e7          	jalr	1462(ra) # 80004c20 <balloc>
    80005672:	87aa                	mv	a5,a0
    80005674:	fef42623          	sw	a5,-20(s0)
      if(addr){
    80005678:	fec42783          	lw	a5,-20(s0)
    8000567c:	2781                	sext.w	a5,a5
    8000567e:	c385                	beqz	a5,8000569e <bmap+0x150>
        a[bn] = addr;
    80005680:	fc446783          	lwu	a5,-60(s0)
    80005684:	078a                	slli	a5,a5,0x2
    80005686:	fd843703          	ld	a4,-40(s0)
    8000568a:	97ba                	add	a5,a5,a4
    8000568c:	fec42703          	lw	a4,-20(s0)
    80005690:	c398                	sw	a4,0(a5)
        log_write(bp);
    80005692:	fe043503          	ld	a0,-32(s0)
    80005696:	00001097          	auipc	ra,0x1
    8000569a:	f94080e7          	jalr	-108(ra) # 8000662a <log_write>
      }
    }
    brelse(bp);
    8000569e:	fe043503          	ld	a0,-32(s0)
    800056a2:	fffff097          	auipc	ra,0xfffff
    800056a6:	2d6080e7          	jalr	726(ra) # 80004978 <brelse>
    return addr;
    800056aa:	fec42783          	lw	a5,-20(s0)
    800056ae:	a809                	j	800056c0 <bmap+0x172>
  }

  panic("bmap: out of range");
    800056b0:	00007517          	auipc	a0,0x7
    800056b4:	e7850513          	addi	a0,a0,-392 # 8000c528 <etext+0x528>
    800056b8:	ffffb097          	auipc	ra,0xffffb
    800056bc:	5d4080e7          	jalr	1492(ra) # 80000c8c <panic>
}
    800056c0:	853e                	mv	a0,a5
    800056c2:	70e2                	ld	ra,56(sp)
    800056c4:	7442                	ld	s0,48(sp)
    800056c6:	6121                	addi	sp,sp,64
    800056c8:	8082                	ret

00000000800056ca <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800056ca:	7139                	addi	sp,sp,-64
    800056cc:	fc06                	sd	ra,56(sp)
    800056ce:	f822                	sd	s0,48(sp)
    800056d0:	0080                	addi	s0,sp,64
    800056d2:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    800056d6:	fe042623          	sw	zero,-20(s0)
    800056da:	a899                	j	80005730 <itrunc+0x66>
    if(ip->addrs[i]){
    800056dc:	fc843703          	ld	a4,-56(s0)
    800056e0:	fec42783          	lw	a5,-20(s0)
    800056e4:	07d1                	addi	a5,a5,20
    800056e6:	078a                	slli	a5,a5,0x2
    800056e8:	97ba                	add	a5,a5,a4
    800056ea:	439c                	lw	a5,0(a5)
    800056ec:	cf8d                	beqz	a5,80005726 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    800056ee:	fc843783          	ld	a5,-56(s0)
    800056f2:	439c                	lw	a5,0(a5)
    800056f4:	0007869b          	sext.w	a3,a5
    800056f8:	fc843703          	ld	a4,-56(s0)
    800056fc:	fec42783          	lw	a5,-20(s0)
    80005700:	07d1                	addi	a5,a5,20
    80005702:	078a                	slli	a5,a5,0x2
    80005704:	97ba                	add	a5,a5,a4
    80005706:	439c                	lw	a5,0(a5)
    80005708:	85be                	mv	a1,a5
    8000570a:	8536                	mv	a0,a3
    8000570c:	fffff097          	auipc	ra,0xfffff
    80005710:	6c4080e7          	jalr	1732(ra) # 80004dd0 <bfree>
      ip->addrs[i] = 0;
    80005714:	fc843703          	ld	a4,-56(s0)
    80005718:	fec42783          	lw	a5,-20(s0)
    8000571c:	07d1                	addi	a5,a5,20
    8000571e:	078a                	slli	a5,a5,0x2
    80005720:	97ba                	add	a5,a5,a4
    80005722:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005726:	fec42783          	lw	a5,-20(s0)
    8000572a:	2785                	addiw	a5,a5,1
    8000572c:	fef42623          	sw	a5,-20(s0)
    80005730:	fec42783          	lw	a5,-20(s0)
    80005734:	0007871b          	sext.w	a4,a5
    80005738:	47ad                	li	a5,11
    8000573a:	fae7d1e3          	bge	a5,a4,800056dc <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    8000573e:	fc843783          	ld	a5,-56(s0)
    80005742:	0807a783          	lw	a5,128(a5)
    80005746:	cbc5                	beqz	a5,800057f6 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005748:	fc843783          	ld	a5,-56(s0)
    8000574c:	4398                	lw	a4,0(a5)
    8000574e:	fc843783          	ld	a5,-56(s0)
    80005752:	0807a783          	lw	a5,128(a5)
    80005756:	85be                	mv	a1,a5
    80005758:	853a                	mv	a0,a4
    8000575a:	fffff097          	auipc	ra,0xfffff
    8000575e:	174080e7          	jalr	372(ra) # 800048ce <bread>
    80005762:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005766:	fe043783          	ld	a5,-32(s0)
    8000576a:	05878793          	addi	a5,a5,88
    8000576e:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005772:	fe042423          	sw	zero,-24(s0)
    80005776:	a081                	j	800057b6 <itrunc+0xec>
      if(a[j])
    80005778:	fe842783          	lw	a5,-24(s0)
    8000577c:	078a                	slli	a5,a5,0x2
    8000577e:	fd843703          	ld	a4,-40(s0)
    80005782:	97ba                	add	a5,a5,a4
    80005784:	439c                	lw	a5,0(a5)
    80005786:	c39d                	beqz	a5,800057ac <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    80005788:	fc843783          	ld	a5,-56(s0)
    8000578c:	439c                	lw	a5,0(a5)
    8000578e:	0007869b          	sext.w	a3,a5
    80005792:	fe842783          	lw	a5,-24(s0)
    80005796:	078a                	slli	a5,a5,0x2
    80005798:	fd843703          	ld	a4,-40(s0)
    8000579c:	97ba                	add	a5,a5,a4
    8000579e:	439c                	lw	a5,0(a5)
    800057a0:	85be                	mv	a1,a5
    800057a2:	8536                	mv	a0,a3
    800057a4:	fffff097          	auipc	ra,0xfffff
    800057a8:	62c080e7          	jalr	1580(ra) # 80004dd0 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800057ac:	fe842783          	lw	a5,-24(s0)
    800057b0:	2785                	addiw	a5,a5,1
    800057b2:	fef42423          	sw	a5,-24(s0)
    800057b6:	fe842783          	lw	a5,-24(s0)
    800057ba:	873e                	mv	a4,a5
    800057bc:	0ff00793          	li	a5,255
    800057c0:	fae7fce3          	bgeu	a5,a4,80005778 <itrunc+0xae>
    }
    brelse(bp);
    800057c4:	fe043503          	ld	a0,-32(s0)
    800057c8:	fffff097          	auipc	ra,0xfffff
    800057cc:	1b0080e7          	jalr	432(ra) # 80004978 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    800057d0:	fc843783          	ld	a5,-56(s0)
    800057d4:	439c                	lw	a5,0(a5)
    800057d6:	0007871b          	sext.w	a4,a5
    800057da:	fc843783          	ld	a5,-56(s0)
    800057de:	0807a783          	lw	a5,128(a5)
    800057e2:	85be                	mv	a1,a5
    800057e4:	853a                	mv	a0,a4
    800057e6:	fffff097          	auipc	ra,0xfffff
    800057ea:	5ea080e7          	jalr	1514(ra) # 80004dd0 <bfree>
    ip->addrs[NDIRECT] = 0;
    800057ee:	fc843783          	ld	a5,-56(s0)
    800057f2:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    800057f6:	fc843783          	ld	a5,-56(s0)
    800057fa:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    800057fe:	fc843503          	ld	a0,-56(s0)
    80005802:	00000097          	auipc	ra,0x0
    80005806:	870080e7          	jalr	-1936(ra) # 80005072 <iupdate>
}
    8000580a:	0001                	nop
    8000580c:	70e2                	ld	ra,56(sp)
    8000580e:	7442                	ld	s0,48(sp)
    80005810:	6121                	addi	sp,sp,64
    80005812:	8082                	ret

0000000080005814 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005814:	1101                	addi	sp,sp,-32
    80005816:	ec22                	sd	s0,24(sp)
    80005818:	1000                	addi	s0,sp,32
    8000581a:	fea43423          	sd	a0,-24(s0)
    8000581e:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005822:	fe843783          	ld	a5,-24(s0)
    80005826:	439c                	lw	a5,0(a5)
    80005828:	0007871b          	sext.w	a4,a5
    8000582c:	fe043783          	ld	a5,-32(s0)
    80005830:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005832:	fe843783          	ld	a5,-24(s0)
    80005836:	43d8                	lw	a4,4(a5)
    80005838:	fe043783          	ld	a5,-32(s0)
    8000583c:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    8000583e:	fe843783          	ld	a5,-24(s0)
    80005842:	04479703          	lh	a4,68(a5)
    80005846:	fe043783          	ld	a5,-32(s0)
    8000584a:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    8000584e:	fe843783          	ld	a5,-24(s0)
    80005852:	04a79703          	lh	a4,74(a5)
    80005856:	fe043783          	ld	a5,-32(s0)
    8000585a:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    8000585e:	fe843783          	ld	a5,-24(s0)
    80005862:	47fc                	lw	a5,76(a5)
    80005864:	02079713          	slli	a4,a5,0x20
    80005868:	9301                	srli	a4,a4,0x20
    8000586a:	fe043783          	ld	a5,-32(s0)
    8000586e:	eb98                	sd	a4,16(a5)
}
    80005870:	0001                	nop
    80005872:	6462                	ld	s0,24(sp)
    80005874:	6105                	addi	sp,sp,32
    80005876:	8082                	ret

0000000080005878 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    80005878:	715d                	addi	sp,sp,-80
    8000587a:	e486                	sd	ra,72(sp)
    8000587c:	e0a2                	sd	s0,64(sp)
    8000587e:	0880                	addi	s0,sp,80
    80005880:	fca43423          	sd	a0,-56(s0)
    80005884:	87ae                	mv	a5,a1
    80005886:	fac43c23          	sd	a2,-72(s0)
    8000588a:	fcf42223          	sw	a5,-60(s0)
    8000588e:	87b6                	mv	a5,a3
    80005890:	fcf42023          	sw	a5,-64(s0)
    80005894:	87ba                	mv	a5,a4
    80005896:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    8000589a:	fc843783          	ld	a5,-56(s0)
    8000589e:	47f8                	lw	a4,76(a5)
    800058a0:	fc042783          	lw	a5,-64(s0)
    800058a4:	2781                	sext.w	a5,a5
    800058a6:	00f76e63          	bltu	a4,a5,800058c2 <readi+0x4a>
    800058aa:	fc042703          	lw	a4,-64(s0)
    800058ae:	fb442783          	lw	a5,-76(s0)
    800058b2:	9fb9                	addw	a5,a5,a4
    800058b4:	0007871b          	sext.w	a4,a5
    800058b8:	fc042783          	lw	a5,-64(s0)
    800058bc:	2781                	sext.w	a5,a5
    800058be:	00f77463          	bgeu	a4,a5,800058c6 <readi+0x4e>
    return 0;
    800058c2:	4781                	li	a5,0
    800058c4:	a289                	j	80005a06 <readi+0x18e>
  if(off + n > ip->size)
    800058c6:	fc042703          	lw	a4,-64(s0)
    800058ca:	fb442783          	lw	a5,-76(s0)
    800058ce:	9fb9                	addw	a5,a5,a4
    800058d0:	0007871b          	sext.w	a4,a5
    800058d4:	fc843783          	ld	a5,-56(s0)
    800058d8:	47fc                	lw	a5,76(a5)
    800058da:	00e7fb63          	bgeu	a5,a4,800058f0 <readi+0x78>
    n = ip->size - off;
    800058de:	fc843783          	ld	a5,-56(s0)
    800058e2:	47f8                	lw	a4,76(a5)
    800058e4:	fc042783          	lw	a5,-64(s0)
    800058e8:	40f707bb          	subw	a5,a4,a5
    800058ec:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800058f0:	fe042623          	sw	zero,-20(s0)
    800058f4:	a8ed                	j	800059ee <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    800058f6:	fc042783          	lw	a5,-64(s0)
    800058fa:	00a7d79b          	srliw	a5,a5,0xa
    800058fe:	2781                	sext.w	a5,a5
    80005900:	85be                	mv	a1,a5
    80005902:	fc843503          	ld	a0,-56(s0)
    80005906:	00000097          	auipc	ra,0x0
    8000590a:	c48080e7          	jalr	-952(ra) # 8000554e <bmap>
    8000590e:	87aa                	mv	a5,a0
    80005910:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005914:	fe842783          	lw	a5,-24(s0)
    80005918:	2781                	sext.w	a5,a5
    8000591a:	c3fd                	beqz	a5,80005a00 <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    8000591c:	fc843783          	ld	a5,-56(s0)
    80005920:	439c                	lw	a5,0(a5)
    80005922:	fe842703          	lw	a4,-24(s0)
    80005926:	85ba                	mv	a1,a4
    80005928:	853e                	mv	a0,a5
    8000592a:	fffff097          	auipc	ra,0xfffff
    8000592e:	fa4080e7          	jalr	-92(ra) # 800048ce <bread>
    80005932:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005936:	fc042783          	lw	a5,-64(s0)
    8000593a:	3ff7f793          	andi	a5,a5,1023
    8000593e:	2781                	sext.w	a5,a5
    80005940:	40000713          	li	a4,1024
    80005944:	40f707bb          	subw	a5,a4,a5
    80005948:	0007869b          	sext.w	a3,a5
    8000594c:	fb442703          	lw	a4,-76(s0)
    80005950:	fec42783          	lw	a5,-20(s0)
    80005954:	40f707bb          	subw	a5,a4,a5
    80005958:	2781                	sext.w	a5,a5
    8000595a:	863e                	mv	a2,a5
    8000595c:	87b6                	mv	a5,a3
    8000595e:	0007869b          	sext.w	a3,a5
    80005962:	0006071b          	sext.w	a4,a2
    80005966:	00d77363          	bgeu	a4,a3,8000596c <readi+0xf4>
    8000596a:	87b2                	mv	a5,a2
    8000596c:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005970:	fe043783          	ld	a5,-32(s0)
    80005974:	05878713          	addi	a4,a5,88
    80005978:	fc046783          	lwu	a5,-64(s0)
    8000597c:	3ff7f793          	andi	a5,a5,1023
    80005980:	973e                	add	a4,a4,a5
    80005982:	fdc46683          	lwu	a3,-36(s0)
    80005986:	fc442783          	lw	a5,-60(s0)
    8000598a:	863a                	mv	a2,a4
    8000598c:	fb843583          	ld	a1,-72(s0)
    80005990:	853e                	mv	a0,a5
    80005992:	ffffe097          	auipc	ra,0xffffe
    80005996:	e8e080e7          	jalr	-370(ra) # 80003820 <either_copyout>
    8000599a:	87aa                	mv	a5,a0
    8000599c:	873e                	mv	a4,a5
    8000599e:	57fd                	li	a5,-1
    800059a0:	00f71c63          	bne	a4,a5,800059b8 <readi+0x140>
      brelse(bp);
    800059a4:	fe043503          	ld	a0,-32(s0)
    800059a8:	fffff097          	auipc	ra,0xfffff
    800059ac:	fd0080e7          	jalr	-48(ra) # 80004978 <brelse>
      tot = -1;
    800059b0:	57fd                	li	a5,-1
    800059b2:	fef42623          	sw	a5,-20(s0)
      break;
    800059b6:	a0b1                	j	80005a02 <readi+0x18a>
    }
    brelse(bp);
    800059b8:	fe043503          	ld	a0,-32(s0)
    800059bc:	fffff097          	auipc	ra,0xfffff
    800059c0:	fbc080e7          	jalr	-68(ra) # 80004978 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    800059c4:	fec42703          	lw	a4,-20(s0)
    800059c8:	fdc42783          	lw	a5,-36(s0)
    800059cc:	9fb9                	addw	a5,a5,a4
    800059ce:	fef42623          	sw	a5,-20(s0)
    800059d2:	fc042703          	lw	a4,-64(s0)
    800059d6:	fdc42783          	lw	a5,-36(s0)
    800059da:	9fb9                	addw	a5,a5,a4
    800059dc:	fcf42023          	sw	a5,-64(s0)
    800059e0:	fdc46783          	lwu	a5,-36(s0)
    800059e4:	fb843703          	ld	a4,-72(s0)
    800059e8:	97ba                	add	a5,a5,a4
    800059ea:	faf43c23          	sd	a5,-72(s0)
    800059ee:	fec42703          	lw	a4,-20(s0)
    800059f2:	fb442783          	lw	a5,-76(s0)
    800059f6:	2701                	sext.w	a4,a4
    800059f8:	2781                	sext.w	a5,a5
    800059fa:	eef76ee3          	bltu	a4,a5,800058f6 <readi+0x7e>
    800059fe:	a011                	j	80005a02 <readi+0x18a>
      break;
    80005a00:	0001                	nop
  }
  return tot;
    80005a02:	fec42783          	lw	a5,-20(s0)
}
    80005a06:	853e                	mv	a0,a5
    80005a08:	60a6                	ld	ra,72(sp)
    80005a0a:	6406                	ld	s0,64(sp)
    80005a0c:	6161                	addi	sp,sp,80
    80005a0e:	8082                	ret

0000000080005a10 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005a10:	715d                	addi	sp,sp,-80
    80005a12:	e486                	sd	ra,72(sp)
    80005a14:	e0a2                	sd	s0,64(sp)
    80005a16:	0880                	addi	s0,sp,80
    80005a18:	fca43423          	sd	a0,-56(s0)
    80005a1c:	87ae                	mv	a5,a1
    80005a1e:	fac43c23          	sd	a2,-72(s0)
    80005a22:	fcf42223          	sw	a5,-60(s0)
    80005a26:	87b6                	mv	a5,a3
    80005a28:	fcf42023          	sw	a5,-64(s0)
    80005a2c:	87ba                	mv	a5,a4
    80005a2e:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005a32:	fc843783          	ld	a5,-56(s0)
    80005a36:	47f8                	lw	a4,76(a5)
    80005a38:	fc042783          	lw	a5,-64(s0)
    80005a3c:	2781                	sext.w	a5,a5
    80005a3e:	00f76e63          	bltu	a4,a5,80005a5a <writei+0x4a>
    80005a42:	fc042703          	lw	a4,-64(s0)
    80005a46:	fb442783          	lw	a5,-76(s0)
    80005a4a:	9fb9                	addw	a5,a5,a4
    80005a4c:	0007871b          	sext.w	a4,a5
    80005a50:	fc042783          	lw	a5,-64(s0)
    80005a54:	2781                	sext.w	a5,a5
    80005a56:	00f77463          	bgeu	a4,a5,80005a5e <writei+0x4e>
    return -1;
    80005a5a:	57fd                	li	a5,-1
    80005a5c:	aab9                	j	80005bba <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005a5e:	fc042703          	lw	a4,-64(s0)
    80005a62:	fb442783          	lw	a5,-76(s0)
    80005a66:	9fb9                	addw	a5,a5,a4
    80005a68:	2781                	sext.w	a5,a5
    80005a6a:	873e                	mv	a4,a5
    80005a6c:	000437b7          	lui	a5,0x43
    80005a70:	00e7f463          	bgeu	a5,a4,80005a78 <writei+0x68>
    return -1;
    80005a74:	57fd                	li	a5,-1
    80005a76:	a291                	j	80005bba <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005a78:	fe042623          	sw	zero,-20(s0)
    80005a7c:	a201                	j	80005b7c <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005a7e:	fc042783          	lw	a5,-64(s0)
    80005a82:	00a7d79b          	srliw	a5,a5,0xa
    80005a86:	2781                	sext.w	a5,a5
    80005a88:	85be                	mv	a1,a5
    80005a8a:	fc843503          	ld	a0,-56(s0)
    80005a8e:	00000097          	auipc	ra,0x0
    80005a92:	ac0080e7          	jalr	-1344(ra) # 8000554e <bmap>
    80005a96:	87aa                	mv	a5,a0
    80005a98:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005a9c:	fe842783          	lw	a5,-24(s0)
    80005aa0:	2781                	sext.w	a5,a5
    80005aa2:	c7f5                	beqz	a5,80005b8e <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005aa4:	fc843783          	ld	a5,-56(s0)
    80005aa8:	439c                	lw	a5,0(a5)
    80005aaa:	fe842703          	lw	a4,-24(s0)
    80005aae:	85ba                	mv	a1,a4
    80005ab0:	853e                	mv	a0,a5
    80005ab2:	fffff097          	auipc	ra,0xfffff
    80005ab6:	e1c080e7          	jalr	-484(ra) # 800048ce <bread>
    80005aba:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005abe:	fc042783          	lw	a5,-64(s0)
    80005ac2:	3ff7f793          	andi	a5,a5,1023
    80005ac6:	2781                	sext.w	a5,a5
    80005ac8:	40000713          	li	a4,1024
    80005acc:	40f707bb          	subw	a5,a4,a5
    80005ad0:	0007869b          	sext.w	a3,a5
    80005ad4:	fb442703          	lw	a4,-76(s0)
    80005ad8:	fec42783          	lw	a5,-20(s0)
    80005adc:	40f707bb          	subw	a5,a4,a5
    80005ae0:	2781                	sext.w	a5,a5
    80005ae2:	863e                	mv	a2,a5
    80005ae4:	87b6                	mv	a5,a3
    80005ae6:	0007869b          	sext.w	a3,a5
    80005aea:	0006071b          	sext.w	a4,a2
    80005aee:	00d77363          	bgeu	a4,a3,80005af4 <writei+0xe4>
    80005af2:	87b2                	mv	a5,a2
    80005af4:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005af8:	fe043783          	ld	a5,-32(s0)
    80005afc:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005b00:	fc046783          	lwu	a5,-64(s0)
    80005b04:	3ff7f793          	andi	a5,a5,1023
    80005b08:	97ba                	add	a5,a5,a4
    80005b0a:	fdc46683          	lwu	a3,-36(s0)
    80005b0e:	fc442703          	lw	a4,-60(s0)
    80005b12:	fb843603          	ld	a2,-72(s0)
    80005b16:	85ba                	mv	a1,a4
    80005b18:	853e                	mv	a0,a5
    80005b1a:	ffffe097          	auipc	ra,0xffffe
    80005b1e:	d7a080e7          	jalr	-646(ra) # 80003894 <either_copyin>
    80005b22:	87aa                	mv	a5,a0
    80005b24:	873e                	mv	a4,a5
    80005b26:	57fd                	li	a5,-1
    80005b28:	00f71963          	bne	a4,a5,80005b3a <writei+0x12a>
      brelse(bp);
    80005b2c:	fe043503          	ld	a0,-32(s0)
    80005b30:	fffff097          	auipc	ra,0xfffff
    80005b34:	e48080e7          	jalr	-440(ra) # 80004978 <brelse>
      break;
    80005b38:	a8a1                	j	80005b90 <writei+0x180>
    }
    log_write(bp);
    80005b3a:	fe043503          	ld	a0,-32(s0)
    80005b3e:	00001097          	auipc	ra,0x1
    80005b42:	aec080e7          	jalr	-1300(ra) # 8000662a <log_write>
    brelse(bp);
    80005b46:	fe043503          	ld	a0,-32(s0)
    80005b4a:	fffff097          	auipc	ra,0xfffff
    80005b4e:	e2e080e7          	jalr	-466(ra) # 80004978 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005b52:	fec42703          	lw	a4,-20(s0)
    80005b56:	fdc42783          	lw	a5,-36(s0)
    80005b5a:	9fb9                	addw	a5,a5,a4
    80005b5c:	fef42623          	sw	a5,-20(s0)
    80005b60:	fc042703          	lw	a4,-64(s0)
    80005b64:	fdc42783          	lw	a5,-36(s0)
    80005b68:	9fb9                	addw	a5,a5,a4
    80005b6a:	fcf42023          	sw	a5,-64(s0)
    80005b6e:	fdc46783          	lwu	a5,-36(s0)
    80005b72:	fb843703          	ld	a4,-72(s0)
    80005b76:	97ba                	add	a5,a5,a4
    80005b78:	faf43c23          	sd	a5,-72(s0)
    80005b7c:	fec42703          	lw	a4,-20(s0)
    80005b80:	fb442783          	lw	a5,-76(s0)
    80005b84:	2701                	sext.w	a4,a4
    80005b86:	2781                	sext.w	a5,a5
    80005b88:	eef76be3          	bltu	a4,a5,80005a7e <writei+0x6e>
    80005b8c:	a011                	j	80005b90 <writei+0x180>
      break;
    80005b8e:	0001                	nop
  }

  if(off > ip->size)
    80005b90:	fc843783          	ld	a5,-56(s0)
    80005b94:	47f8                	lw	a4,76(a5)
    80005b96:	fc042783          	lw	a5,-64(s0)
    80005b9a:	2781                	sext.w	a5,a5
    80005b9c:	00f77763          	bgeu	a4,a5,80005baa <writei+0x19a>
    ip->size = off;
    80005ba0:	fc843783          	ld	a5,-56(s0)
    80005ba4:	fc042703          	lw	a4,-64(s0)
    80005ba8:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005baa:	fc843503          	ld	a0,-56(s0)
    80005bae:	fffff097          	auipc	ra,0xfffff
    80005bb2:	4c4080e7          	jalr	1220(ra) # 80005072 <iupdate>

  return tot;
    80005bb6:	fec42783          	lw	a5,-20(s0)
}
    80005bba:	853e                	mv	a0,a5
    80005bbc:	60a6                	ld	ra,72(sp)
    80005bbe:	6406                	ld	s0,64(sp)
    80005bc0:	6161                	addi	sp,sp,80
    80005bc2:	8082                	ret

0000000080005bc4 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005bc4:	1101                	addi	sp,sp,-32
    80005bc6:	ec06                	sd	ra,24(sp)
    80005bc8:	e822                	sd	s0,16(sp)
    80005bca:	1000                	addi	s0,sp,32
    80005bcc:	fea43423          	sd	a0,-24(s0)
    80005bd0:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005bd4:	4639                	li	a2,14
    80005bd6:	fe043583          	ld	a1,-32(s0)
    80005bda:	fe843503          	ld	a0,-24(s0)
    80005bde:	ffffc097          	auipc	ra,0xffffc
    80005be2:	b2a080e7          	jalr	-1238(ra) # 80001708 <strncmp>
    80005be6:	87aa                	mv	a5,a0
}
    80005be8:	853e                	mv	a0,a5
    80005bea:	60e2                	ld	ra,24(sp)
    80005bec:	6442                	ld	s0,16(sp)
    80005bee:	6105                	addi	sp,sp,32
    80005bf0:	8082                	ret

0000000080005bf2 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005bf2:	715d                	addi	sp,sp,-80
    80005bf4:	e486                	sd	ra,72(sp)
    80005bf6:	e0a2                	sd	s0,64(sp)
    80005bf8:	0880                	addi	s0,sp,80
    80005bfa:	fca43423          	sd	a0,-56(s0)
    80005bfe:	fcb43023          	sd	a1,-64(s0)
    80005c02:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005c06:	fc843783          	ld	a5,-56(s0)
    80005c0a:	04479783          	lh	a5,68(a5)
    80005c0e:	0007871b          	sext.w	a4,a5
    80005c12:	4785                	li	a5,1
    80005c14:	00f70a63          	beq	a4,a5,80005c28 <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005c18:	00007517          	auipc	a0,0x7
    80005c1c:	92850513          	addi	a0,a0,-1752 # 8000c540 <etext+0x540>
    80005c20:	ffffb097          	auipc	ra,0xffffb
    80005c24:	06c080e7          	jalr	108(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c28:	fe042623          	sw	zero,-20(s0)
    80005c2c:	a849                	j	80005cbe <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005c2e:	fd840793          	addi	a5,s0,-40
    80005c32:	fec42683          	lw	a3,-20(s0)
    80005c36:	4741                	li	a4,16
    80005c38:	863e                	mv	a2,a5
    80005c3a:	4581                	li	a1,0
    80005c3c:	fc843503          	ld	a0,-56(s0)
    80005c40:	00000097          	auipc	ra,0x0
    80005c44:	c38080e7          	jalr	-968(ra) # 80005878 <readi>
    80005c48:	87aa                	mv	a5,a0
    80005c4a:	873e                	mv	a4,a5
    80005c4c:	47c1                	li	a5,16
    80005c4e:	00f70a63          	beq	a4,a5,80005c62 <dirlookup+0x70>
      panic("dirlookup read");
    80005c52:	00007517          	auipc	a0,0x7
    80005c56:	90650513          	addi	a0,a0,-1786 # 8000c558 <etext+0x558>
    80005c5a:	ffffb097          	auipc	ra,0xffffb
    80005c5e:	032080e7          	jalr	50(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005c62:	fd845783          	lhu	a5,-40(s0)
    80005c66:	c7b1                	beqz	a5,80005cb2 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005c68:	fd840793          	addi	a5,s0,-40
    80005c6c:	0789                	addi	a5,a5,2
    80005c6e:	85be                	mv	a1,a5
    80005c70:	fc043503          	ld	a0,-64(s0)
    80005c74:	00000097          	auipc	ra,0x0
    80005c78:	f50080e7          	jalr	-176(ra) # 80005bc4 <namecmp>
    80005c7c:	87aa                	mv	a5,a0
    80005c7e:	eb9d                	bnez	a5,80005cb4 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005c80:	fb843783          	ld	a5,-72(s0)
    80005c84:	c791                	beqz	a5,80005c90 <dirlookup+0x9e>
        *poff = off;
    80005c86:	fb843783          	ld	a5,-72(s0)
    80005c8a:	fec42703          	lw	a4,-20(s0)
    80005c8e:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005c90:	fd845783          	lhu	a5,-40(s0)
    80005c94:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005c98:	fc843783          	ld	a5,-56(s0)
    80005c9c:	439c                	lw	a5,0(a5)
    80005c9e:	fe842703          	lw	a4,-24(s0)
    80005ca2:	85ba                	mv	a1,a4
    80005ca4:	853e                	mv	a0,a5
    80005ca6:	fffff097          	auipc	ra,0xfffff
    80005caa:	4b4080e7          	jalr	1204(ra) # 8000515a <iget>
    80005cae:	87aa                	mv	a5,a0
    80005cb0:	a005                	j	80005cd0 <dirlookup+0xde>
      continue;
    80005cb2:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005cb4:	fec42783          	lw	a5,-20(s0)
    80005cb8:	27c1                	addiw	a5,a5,16
    80005cba:	fef42623          	sw	a5,-20(s0)
    80005cbe:	fc843783          	ld	a5,-56(s0)
    80005cc2:	47f8                	lw	a4,76(a5)
    80005cc4:	fec42783          	lw	a5,-20(s0)
    80005cc8:	2781                	sext.w	a5,a5
    80005cca:	f6e7e2e3          	bltu	a5,a4,80005c2e <dirlookup+0x3c>
    }
  }

  return 0;
    80005cce:	4781                	li	a5,0
}
    80005cd0:	853e                	mv	a0,a5
    80005cd2:	60a6                	ld	ra,72(sp)
    80005cd4:	6406                	ld	s0,64(sp)
    80005cd6:	6161                	addi	sp,sp,80
    80005cd8:	8082                	ret

0000000080005cda <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005cda:	715d                	addi	sp,sp,-80
    80005cdc:	e486                	sd	ra,72(sp)
    80005cde:	e0a2                	sd	s0,64(sp)
    80005ce0:	0880                	addi	s0,sp,80
    80005ce2:	fca43423          	sd	a0,-56(s0)
    80005ce6:	fcb43023          	sd	a1,-64(s0)
    80005cea:	87b2                	mv	a5,a2
    80005cec:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005cf0:	4601                	li	a2,0
    80005cf2:	fc043583          	ld	a1,-64(s0)
    80005cf6:	fc843503          	ld	a0,-56(s0)
    80005cfa:	00000097          	auipc	ra,0x0
    80005cfe:	ef8080e7          	jalr	-264(ra) # 80005bf2 <dirlookup>
    80005d02:	fea43023          	sd	a0,-32(s0)
    80005d06:	fe043783          	ld	a5,-32(s0)
    80005d0a:	cb89                	beqz	a5,80005d1c <dirlink+0x42>
    iput(ip);
    80005d0c:	fe043503          	ld	a0,-32(s0)
    80005d10:	fffff097          	auipc	ra,0xfffff
    80005d14:	740080e7          	jalr	1856(ra) # 80005450 <iput>
    return -1;
    80005d18:	57fd                	li	a5,-1
    80005d1a:	a075                	j	80005dc6 <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d1c:	fe042623          	sw	zero,-20(s0)
    80005d20:	a0a1                	j	80005d68 <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d22:	fd040793          	addi	a5,s0,-48
    80005d26:	fec42683          	lw	a3,-20(s0)
    80005d2a:	4741                	li	a4,16
    80005d2c:	863e                	mv	a2,a5
    80005d2e:	4581                	li	a1,0
    80005d30:	fc843503          	ld	a0,-56(s0)
    80005d34:	00000097          	auipc	ra,0x0
    80005d38:	b44080e7          	jalr	-1212(ra) # 80005878 <readi>
    80005d3c:	87aa                	mv	a5,a0
    80005d3e:	873e                	mv	a4,a5
    80005d40:	47c1                	li	a5,16
    80005d42:	00f70a63          	beq	a4,a5,80005d56 <dirlink+0x7c>
      panic("dirlink read");
    80005d46:	00007517          	auipc	a0,0x7
    80005d4a:	82250513          	addi	a0,a0,-2014 # 8000c568 <etext+0x568>
    80005d4e:	ffffb097          	auipc	ra,0xffffb
    80005d52:	f3e080e7          	jalr	-194(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005d56:	fd045783          	lhu	a5,-48(s0)
    80005d5a:	cf99                	beqz	a5,80005d78 <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d5c:	fec42783          	lw	a5,-20(s0)
    80005d60:	27c1                	addiw	a5,a5,16
    80005d62:	2781                	sext.w	a5,a5
    80005d64:	fef42623          	sw	a5,-20(s0)
    80005d68:	fc843783          	ld	a5,-56(s0)
    80005d6c:	47f8                	lw	a4,76(a5)
    80005d6e:	fec42783          	lw	a5,-20(s0)
    80005d72:	fae7e8e3          	bltu	a5,a4,80005d22 <dirlink+0x48>
    80005d76:	a011                	j	80005d7a <dirlink+0xa0>
      break;
    80005d78:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005d7a:	fd040793          	addi	a5,s0,-48
    80005d7e:	0789                	addi	a5,a5,2
    80005d80:	4639                	li	a2,14
    80005d82:	fc043583          	ld	a1,-64(s0)
    80005d86:	853e                	mv	a0,a5
    80005d88:	ffffc097          	auipc	ra,0xffffc
    80005d8c:	a0a080e7          	jalr	-1526(ra) # 80001792 <strncpy>
  de.inum = inum;
    80005d90:	fbc42783          	lw	a5,-68(s0)
    80005d94:	17c2                	slli	a5,a5,0x30
    80005d96:	93c1                	srli	a5,a5,0x30
    80005d98:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d9c:	fd040793          	addi	a5,s0,-48
    80005da0:	fec42683          	lw	a3,-20(s0)
    80005da4:	4741                	li	a4,16
    80005da6:	863e                	mv	a2,a5
    80005da8:	4581                	li	a1,0
    80005daa:	fc843503          	ld	a0,-56(s0)
    80005dae:	00000097          	auipc	ra,0x0
    80005db2:	c62080e7          	jalr	-926(ra) # 80005a10 <writei>
    80005db6:	87aa                	mv	a5,a0
    80005db8:	873e                	mv	a4,a5
    80005dba:	47c1                	li	a5,16
    80005dbc:	00f70463          	beq	a4,a5,80005dc4 <dirlink+0xea>
    return -1;
    80005dc0:	57fd                	li	a5,-1
    80005dc2:	a011                	j	80005dc6 <dirlink+0xec>

  return 0;
    80005dc4:	4781                	li	a5,0
}
    80005dc6:	853e                	mv	a0,a5
    80005dc8:	60a6                	ld	ra,72(sp)
    80005dca:	6406                	ld	s0,64(sp)
    80005dcc:	6161                	addi	sp,sp,80
    80005dce:	8082                	ret

0000000080005dd0 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005dd0:	7179                	addi	sp,sp,-48
    80005dd2:	f406                	sd	ra,40(sp)
    80005dd4:	f022                	sd	s0,32(sp)
    80005dd6:	1800                	addi	s0,sp,48
    80005dd8:	fca43c23          	sd	a0,-40(s0)
    80005ddc:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005de0:	a031                	j	80005dec <skipelem+0x1c>
    path++;
    80005de2:	fd843783          	ld	a5,-40(s0)
    80005de6:	0785                	addi	a5,a5,1
    80005de8:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005dec:	fd843783          	ld	a5,-40(s0)
    80005df0:	0007c783          	lbu	a5,0(a5)
    80005df4:	873e                	mv	a4,a5
    80005df6:	02f00793          	li	a5,47
    80005dfa:	fef704e3          	beq	a4,a5,80005de2 <skipelem+0x12>
  if(*path == 0)
    80005dfe:	fd843783          	ld	a5,-40(s0)
    80005e02:	0007c783          	lbu	a5,0(a5)
    80005e06:	e399                	bnez	a5,80005e0c <skipelem+0x3c>
    return 0;
    80005e08:	4781                	li	a5,0
    80005e0a:	a06d                	j	80005eb4 <skipelem+0xe4>
  s = path;
    80005e0c:	fd843783          	ld	a5,-40(s0)
    80005e10:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005e14:	a031                	j	80005e20 <skipelem+0x50>
    path++;
    80005e16:	fd843783          	ld	a5,-40(s0)
    80005e1a:	0785                	addi	a5,a5,1
    80005e1c:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005e20:	fd843783          	ld	a5,-40(s0)
    80005e24:	0007c783          	lbu	a5,0(a5)
    80005e28:	873e                	mv	a4,a5
    80005e2a:	02f00793          	li	a5,47
    80005e2e:	00f70763          	beq	a4,a5,80005e3c <skipelem+0x6c>
    80005e32:	fd843783          	ld	a5,-40(s0)
    80005e36:	0007c783          	lbu	a5,0(a5)
    80005e3a:	fff1                	bnez	a5,80005e16 <skipelem+0x46>
  len = path - s;
    80005e3c:	fd843703          	ld	a4,-40(s0)
    80005e40:	fe843783          	ld	a5,-24(s0)
    80005e44:	40f707b3          	sub	a5,a4,a5
    80005e48:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005e4c:	fe442783          	lw	a5,-28(s0)
    80005e50:	0007871b          	sext.w	a4,a5
    80005e54:	47b5                	li	a5,13
    80005e56:	00e7dc63          	bge	a5,a4,80005e6e <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005e5a:	4639                	li	a2,14
    80005e5c:	fe843583          	ld	a1,-24(s0)
    80005e60:	fd043503          	ld	a0,-48(s0)
    80005e64:	ffffb097          	auipc	ra,0xffffb
    80005e68:	790080e7          	jalr	1936(ra) # 800015f4 <memmove>
    80005e6c:	a80d                	j	80005e9e <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005e6e:	fe442783          	lw	a5,-28(s0)
    80005e72:	863e                	mv	a2,a5
    80005e74:	fe843583          	ld	a1,-24(s0)
    80005e78:	fd043503          	ld	a0,-48(s0)
    80005e7c:	ffffb097          	auipc	ra,0xffffb
    80005e80:	778080e7          	jalr	1912(ra) # 800015f4 <memmove>
    name[len] = 0;
    80005e84:	fe442783          	lw	a5,-28(s0)
    80005e88:	fd043703          	ld	a4,-48(s0)
    80005e8c:	97ba                	add	a5,a5,a4
    80005e8e:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005e92:	a031                	j	80005e9e <skipelem+0xce>
    path++;
    80005e94:	fd843783          	ld	a5,-40(s0)
    80005e98:	0785                	addi	a5,a5,1
    80005e9a:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005e9e:	fd843783          	ld	a5,-40(s0)
    80005ea2:	0007c783          	lbu	a5,0(a5)
    80005ea6:	873e                	mv	a4,a5
    80005ea8:	02f00793          	li	a5,47
    80005eac:	fef704e3          	beq	a4,a5,80005e94 <skipelem+0xc4>
  return path;
    80005eb0:	fd843783          	ld	a5,-40(s0)
}
    80005eb4:	853e                	mv	a0,a5
    80005eb6:	70a2                	ld	ra,40(sp)
    80005eb8:	7402                	ld	s0,32(sp)
    80005eba:	6145                	addi	sp,sp,48
    80005ebc:	8082                	ret

0000000080005ebe <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005ebe:	7139                	addi	sp,sp,-64
    80005ec0:	fc06                	sd	ra,56(sp)
    80005ec2:	f822                	sd	s0,48(sp)
    80005ec4:	0080                	addi	s0,sp,64
    80005ec6:	fca43c23          	sd	a0,-40(s0)
    80005eca:	87ae                	mv	a5,a1
    80005ecc:	fcc43423          	sd	a2,-56(s0)
    80005ed0:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005ed4:	fd843783          	ld	a5,-40(s0)
    80005ed8:	0007c783          	lbu	a5,0(a5)
    80005edc:	873e                	mv	a4,a5
    80005ede:	02f00793          	li	a5,47
    80005ee2:	00f71b63          	bne	a4,a5,80005ef8 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005ee6:	4585                	li	a1,1
    80005ee8:	4505                	li	a0,1
    80005eea:	fffff097          	auipc	ra,0xfffff
    80005eee:	270080e7          	jalr	624(ra) # 8000515a <iget>
    80005ef2:	fea43423          	sd	a0,-24(s0)
    80005ef6:	a84d                	j	80005fa8 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005ef8:	ffffd097          	auipc	ra,0xffffd
    80005efc:	b18080e7          	jalr	-1256(ra) # 80002a10 <myproc>
    80005f00:	87aa                	mv	a5,a0
    80005f02:	1507b783          	ld	a5,336(a5)
    80005f06:	853e                	mv	a0,a5
    80005f08:	fffff097          	auipc	ra,0xfffff
    80005f0c:	36e080e7          	jalr	878(ra) # 80005276 <idup>
    80005f10:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005f14:	a851                	j	80005fa8 <namex+0xea>
    ilock(ip);
    80005f16:	fe843503          	ld	a0,-24(s0)
    80005f1a:	fffff097          	auipc	ra,0xfffff
    80005f1e:	3a8080e7          	jalr	936(ra) # 800052c2 <ilock>
    if(ip->type != T_DIR){
    80005f22:	fe843783          	ld	a5,-24(s0)
    80005f26:	04479783          	lh	a5,68(a5)
    80005f2a:	0007871b          	sext.w	a4,a5
    80005f2e:	4785                	li	a5,1
    80005f30:	00f70a63          	beq	a4,a5,80005f44 <namex+0x86>
      iunlockput(ip);
    80005f34:	fe843503          	ld	a0,-24(s0)
    80005f38:	fffff097          	auipc	ra,0xfffff
    80005f3c:	5e8080e7          	jalr	1512(ra) # 80005520 <iunlockput>
      return 0;
    80005f40:	4781                	li	a5,0
    80005f42:	a871                	j	80005fde <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005f44:	fd442783          	lw	a5,-44(s0)
    80005f48:	2781                	sext.w	a5,a5
    80005f4a:	cf99                	beqz	a5,80005f68 <namex+0xaa>
    80005f4c:	fd843783          	ld	a5,-40(s0)
    80005f50:	0007c783          	lbu	a5,0(a5)
    80005f54:	eb91                	bnez	a5,80005f68 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005f56:	fe843503          	ld	a0,-24(s0)
    80005f5a:	fffff097          	auipc	ra,0xfffff
    80005f5e:	49c080e7          	jalr	1180(ra) # 800053f6 <iunlock>
      return ip;
    80005f62:	fe843783          	ld	a5,-24(s0)
    80005f66:	a8a5                	j	80005fde <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005f68:	4601                	li	a2,0
    80005f6a:	fc843583          	ld	a1,-56(s0)
    80005f6e:	fe843503          	ld	a0,-24(s0)
    80005f72:	00000097          	auipc	ra,0x0
    80005f76:	c80080e7          	jalr	-896(ra) # 80005bf2 <dirlookup>
    80005f7a:	fea43023          	sd	a0,-32(s0)
    80005f7e:	fe043783          	ld	a5,-32(s0)
    80005f82:	eb89                	bnez	a5,80005f94 <namex+0xd6>
      iunlockput(ip);
    80005f84:	fe843503          	ld	a0,-24(s0)
    80005f88:	fffff097          	auipc	ra,0xfffff
    80005f8c:	598080e7          	jalr	1432(ra) # 80005520 <iunlockput>
      return 0;
    80005f90:	4781                	li	a5,0
    80005f92:	a0b1                	j	80005fde <namex+0x120>
    }
    iunlockput(ip);
    80005f94:	fe843503          	ld	a0,-24(s0)
    80005f98:	fffff097          	auipc	ra,0xfffff
    80005f9c:	588080e7          	jalr	1416(ra) # 80005520 <iunlockput>
    ip = next;
    80005fa0:	fe043783          	ld	a5,-32(s0)
    80005fa4:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005fa8:	fc843583          	ld	a1,-56(s0)
    80005fac:	fd843503          	ld	a0,-40(s0)
    80005fb0:	00000097          	auipc	ra,0x0
    80005fb4:	e20080e7          	jalr	-480(ra) # 80005dd0 <skipelem>
    80005fb8:	fca43c23          	sd	a0,-40(s0)
    80005fbc:	fd843783          	ld	a5,-40(s0)
    80005fc0:	fbb9                	bnez	a5,80005f16 <namex+0x58>
  }
  if(nameiparent){
    80005fc2:	fd442783          	lw	a5,-44(s0)
    80005fc6:	2781                	sext.w	a5,a5
    80005fc8:	cb89                	beqz	a5,80005fda <namex+0x11c>
    iput(ip);
    80005fca:	fe843503          	ld	a0,-24(s0)
    80005fce:	fffff097          	auipc	ra,0xfffff
    80005fd2:	482080e7          	jalr	1154(ra) # 80005450 <iput>
    return 0;
    80005fd6:	4781                	li	a5,0
    80005fd8:	a019                	j	80005fde <namex+0x120>
  }
  return ip;
    80005fda:	fe843783          	ld	a5,-24(s0)
}
    80005fde:	853e                	mv	a0,a5
    80005fe0:	70e2                	ld	ra,56(sp)
    80005fe2:	7442                	ld	s0,48(sp)
    80005fe4:	6121                	addi	sp,sp,64
    80005fe6:	8082                	ret

0000000080005fe8 <namei>:

struct inode*
namei(char *path)
{
    80005fe8:	7179                	addi	sp,sp,-48
    80005fea:	f406                	sd	ra,40(sp)
    80005fec:	f022                	sd	s0,32(sp)
    80005fee:	1800                	addi	s0,sp,48
    80005ff0:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80005ff4:	fe040793          	addi	a5,s0,-32
    80005ff8:	863e                	mv	a2,a5
    80005ffa:	4581                	li	a1,0
    80005ffc:	fd843503          	ld	a0,-40(s0)
    80006000:	00000097          	auipc	ra,0x0
    80006004:	ebe080e7          	jalr	-322(ra) # 80005ebe <namex>
    80006008:	87aa                	mv	a5,a0
}
    8000600a:	853e                	mv	a0,a5
    8000600c:	70a2                	ld	ra,40(sp)
    8000600e:	7402                	ld	s0,32(sp)
    80006010:	6145                	addi	sp,sp,48
    80006012:	8082                	ret

0000000080006014 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80006014:	1101                	addi	sp,sp,-32
    80006016:	ec06                	sd	ra,24(sp)
    80006018:	e822                	sd	s0,16(sp)
    8000601a:	1000                	addi	s0,sp,32
    8000601c:	fea43423          	sd	a0,-24(s0)
    80006020:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80006024:	fe043603          	ld	a2,-32(s0)
    80006028:	4585                	li	a1,1
    8000602a:	fe843503          	ld	a0,-24(s0)
    8000602e:	00000097          	auipc	ra,0x0
    80006032:	e90080e7          	jalr	-368(ra) # 80005ebe <namex>
    80006036:	87aa                	mv	a5,a0
}
    80006038:	853e                	mv	a0,a5
    8000603a:	60e2                	ld	ra,24(sp)
    8000603c:	6442                	ld	s0,16(sp)
    8000603e:	6105                	addi	sp,sp,32
    80006040:	8082                	ret

0000000080006042 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80006042:	1101                	addi	sp,sp,-32
    80006044:	ec06                	sd	ra,24(sp)
    80006046:	e822                	sd	s0,16(sp)
    80006048:	1000                	addi	s0,sp,32
    8000604a:	87aa                	mv	a5,a0
    8000604c:	feb43023          	sd	a1,-32(s0)
    80006050:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80006054:	00006597          	auipc	a1,0x6
    80006058:	52458593          	addi	a1,a1,1316 # 8000c578 <etext+0x578>
    8000605c:	0001f517          	auipc	a0,0x1f
    80006060:	bcc50513          	addi	a0,a0,-1076 # 80024c28 <log>
    80006064:	ffffb097          	auipc	ra,0xffffb
    80006068:	2a8080e7          	jalr	680(ra) # 8000130c <initlock>
  log.start = sb->logstart;
    8000606c:	fe043783          	ld	a5,-32(s0)
    80006070:	4bdc                	lw	a5,20(a5)
    80006072:	0007871b          	sext.w	a4,a5
    80006076:	0001f797          	auipc	a5,0x1f
    8000607a:	bb278793          	addi	a5,a5,-1102 # 80024c28 <log>
    8000607e:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    80006080:	fe043783          	ld	a5,-32(s0)
    80006084:	4b9c                	lw	a5,16(a5)
    80006086:	0007871b          	sext.w	a4,a5
    8000608a:	0001f797          	auipc	a5,0x1f
    8000608e:	b9e78793          	addi	a5,a5,-1122 # 80024c28 <log>
    80006092:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    80006094:	0001f797          	auipc	a5,0x1f
    80006098:	b9478793          	addi	a5,a5,-1132 # 80024c28 <log>
    8000609c:	fec42703          	lw	a4,-20(s0)
    800060a0:	d798                	sw	a4,40(a5)
  recover_from_log();
    800060a2:	00000097          	auipc	ra,0x0
    800060a6:	272080e7          	jalr	626(ra) # 80006314 <recover_from_log>
}
    800060aa:	0001                	nop
    800060ac:	60e2                	ld	ra,24(sp)
    800060ae:	6442                	ld	s0,16(sp)
    800060b0:	6105                	addi	sp,sp,32
    800060b2:	8082                	ret

00000000800060b4 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    800060b4:	7139                	addi	sp,sp,-64
    800060b6:	fc06                	sd	ra,56(sp)
    800060b8:	f822                	sd	s0,48(sp)
    800060ba:	0080                	addi	s0,sp,64
    800060bc:	87aa                	mv	a5,a0
    800060be:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800060c2:	fe042623          	sw	zero,-20(s0)
    800060c6:	a0f9                	j	80006194 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    800060c8:	0001f797          	auipc	a5,0x1f
    800060cc:	b6078793          	addi	a5,a5,-1184 # 80024c28 <log>
    800060d0:	579c                	lw	a5,40(a5)
    800060d2:	0007869b          	sext.w	a3,a5
    800060d6:	0001f797          	auipc	a5,0x1f
    800060da:	b5278793          	addi	a5,a5,-1198 # 80024c28 <log>
    800060de:	4f9c                	lw	a5,24(a5)
    800060e0:	fec42703          	lw	a4,-20(s0)
    800060e4:	9fb9                	addw	a5,a5,a4
    800060e6:	2781                	sext.w	a5,a5
    800060e8:	2785                	addiw	a5,a5,1
    800060ea:	2781                	sext.w	a5,a5
    800060ec:	2781                	sext.w	a5,a5
    800060ee:	85be                	mv	a1,a5
    800060f0:	8536                	mv	a0,a3
    800060f2:	ffffe097          	auipc	ra,0xffffe
    800060f6:	7dc080e7          	jalr	2012(ra) # 800048ce <bread>
    800060fa:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    800060fe:	0001f797          	auipc	a5,0x1f
    80006102:	b2a78793          	addi	a5,a5,-1238 # 80024c28 <log>
    80006106:	579c                	lw	a5,40(a5)
    80006108:	0007869b          	sext.w	a3,a5
    8000610c:	0001f717          	auipc	a4,0x1f
    80006110:	b1c70713          	addi	a4,a4,-1252 # 80024c28 <log>
    80006114:	fec42783          	lw	a5,-20(s0)
    80006118:	07a1                	addi	a5,a5,8
    8000611a:	078a                	slli	a5,a5,0x2
    8000611c:	97ba                	add	a5,a5,a4
    8000611e:	4b9c                	lw	a5,16(a5)
    80006120:	2781                	sext.w	a5,a5
    80006122:	85be                	mv	a1,a5
    80006124:	8536                	mv	a0,a3
    80006126:	ffffe097          	auipc	ra,0xffffe
    8000612a:	7a8080e7          	jalr	1960(ra) # 800048ce <bread>
    8000612e:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006132:	fd843783          	ld	a5,-40(s0)
    80006136:	05878713          	addi	a4,a5,88
    8000613a:	fe043783          	ld	a5,-32(s0)
    8000613e:	05878793          	addi	a5,a5,88
    80006142:	40000613          	li	a2,1024
    80006146:	85be                	mv	a1,a5
    80006148:	853a                	mv	a0,a4
    8000614a:	ffffb097          	auipc	ra,0xffffb
    8000614e:	4aa080e7          	jalr	1194(ra) # 800015f4 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006152:	fd843503          	ld	a0,-40(s0)
    80006156:	ffffe097          	auipc	ra,0xffffe
    8000615a:	7d6080e7          	jalr	2006(ra) # 8000492c <bwrite>
    if(recovering == 0)
    8000615e:	fcc42783          	lw	a5,-52(s0)
    80006162:	2781                	sext.w	a5,a5
    80006164:	e799                	bnez	a5,80006172 <install_trans+0xbe>
      bunpin(dbuf);
    80006166:	fd843503          	ld	a0,-40(s0)
    8000616a:	fffff097          	auipc	ra,0xfffff
    8000616e:	944080e7          	jalr	-1724(ra) # 80004aae <bunpin>
    brelse(lbuf);
    80006172:	fe043503          	ld	a0,-32(s0)
    80006176:	fffff097          	auipc	ra,0xfffff
    8000617a:	802080e7          	jalr	-2046(ra) # 80004978 <brelse>
    brelse(dbuf);
    8000617e:	fd843503          	ld	a0,-40(s0)
    80006182:	ffffe097          	auipc	ra,0xffffe
    80006186:	7f6080e7          	jalr	2038(ra) # 80004978 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    8000618a:	fec42783          	lw	a5,-20(s0)
    8000618e:	2785                	addiw	a5,a5,1
    80006190:	fef42623          	sw	a5,-20(s0)
    80006194:	0001f797          	auipc	a5,0x1f
    80006198:	a9478793          	addi	a5,a5,-1388 # 80024c28 <log>
    8000619c:	57d8                	lw	a4,44(a5)
    8000619e:	fec42783          	lw	a5,-20(s0)
    800061a2:	2781                	sext.w	a5,a5
    800061a4:	f2e7c2e3          	blt	a5,a4,800060c8 <install_trans+0x14>
  }
}
    800061a8:	0001                	nop
    800061aa:	0001                	nop
    800061ac:	70e2                	ld	ra,56(sp)
    800061ae:	7442                	ld	s0,48(sp)
    800061b0:	6121                	addi	sp,sp,64
    800061b2:	8082                	ret

00000000800061b4 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800061b4:	7179                	addi	sp,sp,-48
    800061b6:	f406                	sd	ra,40(sp)
    800061b8:	f022                	sd	s0,32(sp)
    800061ba:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800061bc:	0001f797          	auipc	a5,0x1f
    800061c0:	a6c78793          	addi	a5,a5,-1428 # 80024c28 <log>
    800061c4:	579c                	lw	a5,40(a5)
    800061c6:	0007871b          	sext.w	a4,a5
    800061ca:	0001f797          	auipc	a5,0x1f
    800061ce:	a5e78793          	addi	a5,a5,-1442 # 80024c28 <log>
    800061d2:	4f9c                	lw	a5,24(a5)
    800061d4:	2781                	sext.w	a5,a5
    800061d6:	85be                	mv	a1,a5
    800061d8:	853a                	mv	a0,a4
    800061da:	ffffe097          	auipc	ra,0xffffe
    800061de:	6f4080e7          	jalr	1780(ra) # 800048ce <bread>
    800061e2:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    800061e6:	fe043783          	ld	a5,-32(s0)
    800061ea:	05878793          	addi	a5,a5,88
    800061ee:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    800061f2:	fd843783          	ld	a5,-40(s0)
    800061f6:	4398                	lw	a4,0(a5)
    800061f8:	0001f797          	auipc	a5,0x1f
    800061fc:	a3078793          	addi	a5,a5,-1488 # 80024c28 <log>
    80006200:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006202:	fe042623          	sw	zero,-20(s0)
    80006206:	a03d                	j	80006234 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80006208:	fd843703          	ld	a4,-40(s0)
    8000620c:	fec42783          	lw	a5,-20(s0)
    80006210:	078a                	slli	a5,a5,0x2
    80006212:	97ba                	add	a5,a5,a4
    80006214:	43d8                	lw	a4,4(a5)
    80006216:	0001f697          	auipc	a3,0x1f
    8000621a:	a1268693          	addi	a3,a3,-1518 # 80024c28 <log>
    8000621e:	fec42783          	lw	a5,-20(s0)
    80006222:	07a1                	addi	a5,a5,8
    80006224:	078a                	slli	a5,a5,0x2
    80006226:	97b6                	add	a5,a5,a3
    80006228:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    8000622a:	fec42783          	lw	a5,-20(s0)
    8000622e:	2785                	addiw	a5,a5,1
    80006230:	fef42623          	sw	a5,-20(s0)
    80006234:	0001f797          	auipc	a5,0x1f
    80006238:	9f478793          	addi	a5,a5,-1548 # 80024c28 <log>
    8000623c:	57d8                	lw	a4,44(a5)
    8000623e:	fec42783          	lw	a5,-20(s0)
    80006242:	2781                	sext.w	a5,a5
    80006244:	fce7c2e3          	blt	a5,a4,80006208 <read_head+0x54>
  }
  brelse(buf);
    80006248:	fe043503          	ld	a0,-32(s0)
    8000624c:	ffffe097          	auipc	ra,0xffffe
    80006250:	72c080e7          	jalr	1836(ra) # 80004978 <brelse>
}
    80006254:	0001                	nop
    80006256:	70a2                	ld	ra,40(sp)
    80006258:	7402                	ld	s0,32(sp)
    8000625a:	6145                	addi	sp,sp,48
    8000625c:	8082                	ret

000000008000625e <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000625e:	7179                	addi	sp,sp,-48
    80006260:	f406                	sd	ra,40(sp)
    80006262:	f022                	sd	s0,32(sp)
    80006264:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    80006266:	0001f797          	auipc	a5,0x1f
    8000626a:	9c278793          	addi	a5,a5,-1598 # 80024c28 <log>
    8000626e:	579c                	lw	a5,40(a5)
    80006270:	0007871b          	sext.w	a4,a5
    80006274:	0001f797          	auipc	a5,0x1f
    80006278:	9b478793          	addi	a5,a5,-1612 # 80024c28 <log>
    8000627c:	4f9c                	lw	a5,24(a5)
    8000627e:	2781                	sext.w	a5,a5
    80006280:	85be                	mv	a1,a5
    80006282:	853a                	mv	a0,a4
    80006284:	ffffe097          	auipc	ra,0xffffe
    80006288:	64a080e7          	jalr	1610(ra) # 800048ce <bread>
    8000628c:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    80006290:	fe043783          	ld	a5,-32(s0)
    80006294:	05878793          	addi	a5,a5,88
    80006298:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    8000629c:	0001f797          	auipc	a5,0x1f
    800062a0:	98c78793          	addi	a5,a5,-1652 # 80024c28 <log>
    800062a4:	57d8                	lw	a4,44(a5)
    800062a6:	fd843783          	ld	a5,-40(s0)
    800062aa:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800062ac:	fe042623          	sw	zero,-20(s0)
    800062b0:	a03d                	j	800062de <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800062b2:	0001f717          	auipc	a4,0x1f
    800062b6:	97670713          	addi	a4,a4,-1674 # 80024c28 <log>
    800062ba:	fec42783          	lw	a5,-20(s0)
    800062be:	07a1                	addi	a5,a5,8
    800062c0:	078a                	slli	a5,a5,0x2
    800062c2:	97ba                	add	a5,a5,a4
    800062c4:	4b98                	lw	a4,16(a5)
    800062c6:	fd843683          	ld	a3,-40(s0)
    800062ca:	fec42783          	lw	a5,-20(s0)
    800062ce:	078a                	slli	a5,a5,0x2
    800062d0:	97b6                	add	a5,a5,a3
    800062d2:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    800062d4:	fec42783          	lw	a5,-20(s0)
    800062d8:	2785                	addiw	a5,a5,1
    800062da:	fef42623          	sw	a5,-20(s0)
    800062de:	0001f797          	auipc	a5,0x1f
    800062e2:	94a78793          	addi	a5,a5,-1718 # 80024c28 <log>
    800062e6:	57d8                	lw	a4,44(a5)
    800062e8:	fec42783          	lw	a5,-20(s0)
    800062ec:	2781                	sext.w	a5,a5
    800062ee:	fce7c2e3          	blt	a5,a4,800062b2 <write_head+0x54>
  }
  bwrite(buf);
    800062f2:	fe043503          	ld	a0,-32(s0)
    800062f6:	ffffe097          	auipc	ra,0xffffe
    800062fa:	636080e7          	jalr	1590(ra) # 8000492c <bwrite>
  brelse(buf);
    800062fe:	fe043503          	ld	a0,-32(s0)
    80006302:	ffffe097          	auipc	ra,0xffffe
    80006306:	676080e7          	jalr	1654(ra) # 80004978 <brelse>
}
    8000630a:	0001                	nop
    8000630c:	70a2                	ld	ra,40(sp)
    8000630e:	7402                	ld	s0,32(sp)
    80006310:	6145                	addi	sp,sp,48
    80006312:	8082                	ret

0000000080006314 <recover_from_log>:

static void
recover_from_log(void)
{
    80006314:	1141                	addi	sp,sp,-16
    80006316:	e406                	sd	ra,8(sp)
    80006318:	e022                	sd	s0,0(sp)
    8000631a:	0800                	addi	s0,sp,16
  read_head();
    8000631c:	00000097          	auipc	ra,0x0
    80006320:	e98080e7          	jalr	-360(ra) # 800061b4 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006324:	4505                	li	a0,1
    80006326:	00000097          	auipc	ra,0x0
    8000632a:	d8e080e7          	jalr	-626(ra) # 800060b4 <install_trans>
  log.lh.n = 0;
    8000632e:	0001f797          	auipc	a5,0x1f
    80006332:	8fa78793          	addi	a5,a5,-1798 # 80024c28 <log>
    80006336:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    8000633a:	00000097          	auipc	ra,0x0
    8000633e:	f24080e7          	jalr	-220(ra) # 8000625e <write_head>
}
    80006342:	0001                	nop
    80006344:	60a2                	ld	ra,8(sp)
    80006346:	6402                	ld	s0,0(sp)
    80006348:	0141                	addi	sp,sp,16
    8000634a:	8082                	ret

000000008000634c <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000634c:	1141                	addi	sp,sp,-16
    8000634e:	e406                	sd	ra,8(sp)
    80006350:	e022                	sd	s0,0(sp)
    80006352:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006354:	0001f517          	auipc	a0,0x1f
    80006358:	8d450513          	addi	a0,a0,-1836 # 80024c28 <log>
    8000635c:	ffffb097          	auipc	ra,0xffffb
    80006360:	fe0080e7          	jalr	-32(ra) # 8000133c <acquire>
  while(1){
    if(log.committing){
    80006364:	0001f797          	auipc	a5,0x1f
    80006368:	8c478793          	addi	a5,a5,-1852 # 80024c28 <log>
    8000636c:	53dc                	lw	a5,36(a5)
    8000636e:	cf91                	beqz	a5,8000638a <begin_op+0x3e>
      sleep(&log, &log.lock);
    80006370:	0001f597          	auipc	a1,0x1f
    80006374:	8b858593          	addi	a1,a1,-1864 # 80024c28 <log>
    80006378:	0001f517          	auipc	a0,0x1f
    8000637c:	8b050513          	addi	a0,a0,-1872 # 80024c28 <log>
    80006380:	ffffd097          	auipc	ra,0xffffd
    80006384:	252080e7          	jalr	594(ra) # 800035d2 <sleep>
    80006388:	bff1                	j	80006364 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    8000638a:	0001f797          	auipc	a5,0x1f
    8000638e:	89e78793          	addi	a5,a5,-1890 # 80024c28 <log>
    80006392:	57d8                	lw	a4,44(a5)
    80006394:	0001f797          	auipc	a5,0x1f
    80006398:	89478793          	addi	a5,a5,-1900 # 80024c28 <log>
    8000639c:	539c                	lw	a5,32(a5)
    8000639e:	2785                	addiw	a5,a5,1
    800063a0:	2781                	sext.w	a5,a5
    800063a2:	86be                	mv	a3,a5
    800063a4:	87b6                	mv	a5,a3
    800063a6:	0027979b          	slliw	a5,a5,0x2
    800063aa:	9fb5                	addw	a5,a5,a3
    800063ac:	0017979b          	slliw	a5,a5,0x1
    800063b0:	2781                	sext.w	a5,a5
    800063b2:	9fb9                	addw	a5,a5,a4
    800063b4:	2781                	sext.w	a5,a5
    800063b6:	873e                	mv	a4,a5
    800063b8:	47f9                	li	a5,30
    800063ba:	00e7df63          	bge	a5,a4,800063d8 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800063be:	0001f597          	auipc	a1,0x1f
    800063c2:	86a58593          	addi	a1,a1,-1942 # 80024c28 <log>
    800063c6:	0001f517          	auipc	a0,0x1f
    800063ca:	86250513          	addi	a0,a0,-1950 # 80024c28 <log>
    800063ce:	ffffd097          	auipc	ra,0xffffd
    800063d2:	204080e7          	jalr	516(ra) # 800035d2 <sleep>
    800063d6:	b779                	j	80006364 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    800063d8:	0001f797          	auipc	a5,0x1f
    800063dc:	85078793          	addi	a5,a5,-1968 # 80024c28 <log>
    800063e0:	539c                	lw	a5,32(a5)
    800063e2:	2785                	addiw	a5,a5,1
    800063e4:	0007871b          	sext.w	a4,a5
    800063e8:	0001f797          	auipc	a5,0x1f
    800063ec:	84078793          	addi	a5,a5,-1984 # 80024c28 <log>
    800063f0:	d398                	sw	a4,32(a5)
      release(&log.lock);
    800063f2:	0001f517          	auipc	a0,0x1f
    800063f6:	83650513          	addi	a0,a0,-1994 # 80024c28 <log>
    800063fa:	ffffb097          	auipc	ra,0xffffb
    800063fe:	fa6080e7          	jalr	-90(ra) # 800013a0 <release>
      break;
    80006402:	0001                	nop
    }
  }
}
    80006404:	0001                	nop
    80006406:	60a2                	ld	ra,8(sp)
    80006408:	6402                	ld	s0,0(sp)
    8000640a:	0141                	addi	sp,sp,16
    8000640c:	8082                	ret

000000008000640e <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000640e:	1101                	addi	sp,sp,-32
    80006410:	ec06                	sd	ra,24(sp)
    80006412:	e822                	sd	s0,16(sp)
    80006414:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006416:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    8000641a:	0001f517          	auipc	a0,0x1f
    8000641e:	80e50513          	addi	a0,a0,-2034 # 80024c28 <log>
    80006422:	ffffb097          	auipc	ra,0xffffb
    80006426:	f1a080e7          	jalr	-230(ra) # 8000133c <acquire>
  log.outstanding -= 1;
    8000642a:	0001e797          	auipc	a5,0x1e
    8000642e:	7fe78793          	addi	a5,a5,2046 # 80024c28 <log>
    80006432:	539c                	lw	a5,32(a5)
    80006434:	37fd                	addiw	a5,a5,-1
    80006436:	0007871b          	sext.w	a4,a5
    8000643a:	0001e797          	auipc	a5,0x1e
    8000643e:	7ee78793          	addi	a5,a5,2030 # 80024c28 <log>
    80006442:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006444:	0001e797          	auipc	a5,0x1e
    80006448:	7e478793          	addi	a5,a5,2020 # 80024c28 <log>
    8000644c:	53dc                	lw	a5,36(a5)
    8000644e:	cb89                	beqz	a5,80006460 <end_op+0x52>
    panic("log.committing");
    80006450:	00006517          	auipc	a0,0x6
    80006454:	13050513          	addi	a0,a0,304 # 8000c580 <etext+0x580>
    80006458:	ffffb097          	auipc	ra,0xffffb
    8000645c:	834080e7          	jalr	-1996(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    80006460:	0001e797          	auipc	a5,0x1e
    80006464:	7c878793          	addi	a5,a5,1992 # 80024c28 <log>
    80006468:	539c                	lw	a5,32(a5)
    8000646a:	eb99                	bnez	a5,80006480 <end_op+0x72>
    do_commit = 1;
    8000646c:	4785                	li	a5,1
    8000646e:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006472:	0001e797          	auipc	a5,0x1e
    80006476:	7b678793          	addi	a5,a5,1974 # 80024c28 <log>
    8000647a:	4705                	li	a4,1
    8000647c:	d3d8                	sw	a4,36(a5)
    8000647e:	a809                	j	80006490 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    80006480:	0001e517          	auipc	a0,0x1e
    80006484:	7a850513          	addi	a0,a0,1960 # 80024c28 <log>
    80006488:	ffffd097          	auipc	ra,0xffffd
    8000648c:	1c6080e7          	jalr	454(ra) # 8000364e <wakeup>
  }
  release(&log.lock);
    80006490:	0001e517          	auipc	a0,0x1e
    80006494:	79850513          	addi	a0,a0,1944 # 80024c28 <log>
    80006498:	ffffb097          	auipc	ra,0xffffb
    8000649c:	f08080e7          	jalr	-248(ra) # 800013a0 <release>

  if(do_commit){
    800064a0:	fec42783          	lw	a5,-20(s0)
    800064a4:	2781                	sext.w	a5,a5
    800064a6:	c3b9                	beqz	a5,800064ec <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800064a8:	00000097          	auipc	ra,0x0
    800064ac:	134080e7          	jalr	308(ra) # 800065dc <commit>
    acquire(&log.lock);
    800064b0:	0001e517          	auipc	a0,0x1e
    800064b4:	77850513          	addi	a0,a0,1912 # 80024c28 <log>
    800064b8:	ffffb097          	auipc	ra,0xffffb
    800064bc:	e84080e7          	jalr	-380(ra) # 8000133c <acquire>
    log.committing = 0;
    800064c0:	0001e797          	auipc	a5,0x1e
    800064c4:	76878793          	addi	a5,a5,1896 # 80024c28 <log>
    800064c8:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    800064cc:	0001e517          	auipc	a0,0x1e
    800064d0:	75c50513          	addi	a0,a0,1884 # 80024c28 <log>
    800064d4:	ffffd097          	auipc	ra,0xffffd
    800064d8:	17a080e7          	jalr	378(ra) # 8000364e <wakeup>
    release(&log.lock);
    800064dc:	0001e517          	auipc	a0,0x1e
    800064e0:	74c50513          	addi	a0,a0,1868 # 80024c28 <log>
    800064e4:	ffffb097          	auipc	ra,0xffffb
    800064e8:	ebc080e7          	jalr	-324(ra) # 800013a0 <release>
  }
}
    800064ec:	0001                	nop
    800064ee:	60e2                	ld	ra,24(sp)
    800064f0:	6442                	ld	s0,16(sp)
    800064f2:	6105                	addi	sp,sp,32
    800064f4:	8082                	ret

00000000800064f6 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    800064f6:	7179                	addi	sp,sp,-48
    800064f8:	f406                	sd	ra,40(sp)
    800064fa:	f022                	sd	s0,32(sp)
    800064fc:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800064fe:	fe042623          	sw	zero,-20(s0)
    80006502:	a86d                	j	800065bc <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006504:	0001e797          	auipc	a5,0x1e
    80006508:	72478793          	addi	a5,a5,1828 # 80024c28 <log>
    8000650c:	579c                	lw	a5,40(a5)
    8000650e:	0007869b          	sext.w	a3,a5
    80006512:	0001e797          	auipc	a5,0x1e
    80006516:	71678793          	addi	a5,a5,1814 # 80024c28 <log>
    8000651a:	4f9c                	lw	a5,24(a5)
    8000651c:	fec42703          	lw	a4,-20(s0)
    80006520:	9fb9                	addw	a5,a5,a4
    80006522:	2781                	sext.w	a5,a5
    80006524:	2785                	addiw	a5,a5,1
    80006526:	2781                	sext.w	a5,a5
    80006528:	2781                	sext.w	a5,a5
    8000652a:	85be                	mv	a1,a5
    8000652c:	8536                	mv	a0,a3
    8000652e:	ffffe097          	auipc	ra,0xffffe
    80006532:	3a0080e7          	jalr	928(ra) # 800048ce <bread>
    80006536:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    8000653a:	0001e797          	auipc	a5,0x1e
    8000653e:	6ee78793          	addi	a5,a5,1774 # 80024c28 <log>
    80006542:	579c                	lw	a5,40(a5)
    80006544:	0007869b          	sext.w	a3,a5
    80006548:	0001e717          	auipc	a4,0x1e
    8000654c:	6e070713          	addi	a4,a4,1760 # 80024c28 <log>
    80006550:	fec42783          	lw	a5,-20(s0)
    80006554:	07a1                	addi	a5,a5,8
    80006556:	078a                	slli	a5,a5,0x2
    80006558:	97ba                	add	a5,a5,a4
    8000655a:	4b9c                	lw	a5,16(a5)
    8000655c:	2781                	sext.w	a5,a5
    8000655e:	85be                	mv	a1,a5
    80006560:	8536                	mv	a0,a3
    80006562:	ffffe097          	auipc	ra,0xffffe
    80006566:	36c080e7          	jalr	876(ra) # 800048ce <bread>
    8000656a:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    8000656e:	fe043783          	ld	a5,-32(s0)
    80006572:	05878713          	addi	a4,a5,88
    80006576:	fd843783          	ld	a5,-40(s0)
    8000657a:	05878793          	addi	a5,a5,88
    8000657e:	40000613          	li	a2,1024
    80006582:	85be                	mv	a1,a5
    80006584:	853a                	mv	a0,a4
    80006586:	ffffb097          	auipc	ra,0xffffb
    8000658a:	06e080e7          	jalr	110(ra) # 800015f4 <memmove>
    bwrite(to);  // write the log
    8000658e:	fe043503          	ld	a0,-32(s0)
    80006592:	ffffe097          	auipc	ra,0xffffe
    80006596:	39a080e7          	jalr	922(ra) # 8000492c <bwrite>
    brelse(from);
    8000659a:	fd843503          	ld	a0,-40(s0)
    8000659e:	ffffe097          	auipc	ra,0xffffe
    800065a2:	3da080e7          	jalr	986(ra) # 80004978 <brelse>
    brelse(to);
    800065a6:	fe043503          	ld	a0,-32(s0)
    800065aa:	ffffe097          	auipc	ra,0xffffe
    800065ae:	3ce080e7          	jalr	974(ra) # 80004978 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800065b2:	fec42783          	lw	a5,-20(s0)
    800065b6:	2785                	addiw	a5,a5,1
    800065b8:	fef42623          	sw	a5,-20(s0)
    800065bc:	0001e797          	auipc	a5,0x1e
    800065c0:	66c78793          	addi	a5,a5,1644 # 80024c28 <log>
    800065c4:	57d8                	lw	a4,44(a5)
    800065c6:	fec42783          	lw	a5,-20(s0)
    800065ca:	2781                	sext.w	a5,a5
    800065cc:	f2e7cce3          	blt	a5,a4,80006504 <write_log+0xe>
  }
}
    800065d0:	0001                	nop
    800065d2:	0001                	nop
    800065d4:	70a2                	ld	ra,40(sp)
    800065d6:	7402                	ld	s0,32(sp)
    800065d8:	6145                	addi	sp,sp,48
    800065da:	8082                	ret

00000000800065dc <commit>:

static void
commit()
{
    800065dc:	1141                	addi	sp,sp,-16
    800065de:	e406                	sd	ra,8(sp)
    800065e0:	e022                	sd	s0,0(sp)
    800065e2:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    800065e4:	0001e797          	auipc	a5,0x1e
    800065e8:	64478793          	addi	a5,a5,1604 # 80024c28 <log>
    800065ec:	57dc                	lw	a5,44(a5)
    800065ee:	02f05963          	blez	a5,80006620 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    800065f2:	00000097          	auipc	ra,0x0
    800065f6:	f04080e7          	jalr	-252(ra) # 800064f6 <write_log>
    write_head();    // Write header to disk -- the real commit
    800065fa:	00000097          	auipc	ra,0x0
    800065fe:	c64080e7          	jalr	-924(ra) # 8000625e <write_head>
    install_trans(0); // Now install writes to home locations
    80006602:	4501                	li	a0,0
    80006604:	00000097          	auipc	ra,0x0
    80006608:	ab0080e7          	jalr	-1360(ra) # 800060b4 <install_trans>
    log.lh.n = 0;
    8000660c:	0001e797          	auipc	a5,0x1e
    80006610:	61c78793          	addi	a5,a5,1564 # 80024c28 <log>
    80006614:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006618:	00000097          	auipc	ra,0x0
    8000661c:	c46080e7          	jalr	-954(ra) # 8000625e <write_head>
  }
}
    80006620:	0001                	nop
    80006622:	60a2                	ld	ra,8(sp)
    80006624:	6402                	ld	s0,0(sp)
    80006626:	0141                	addi	sp,sp,16
    80006628:	8082                	ret

000000008000662a <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    8000662a:	7179                	addi	sp,sp,-48
    8000662c:	f406                	sd	ra,40(sp)
    8000662e:	f022                	sd	s0,32(sp)
    80006630:	1800                	addi	s0,sp,48
    80006632:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006636:	0001e517          	auipc	a0,0x1e
    8000663a:	5f250513          	addi	a0,a0,1522 # 80024c28 <log>
    8000663e:	ffffb097          	auipc	ra,0xffffb
    80006642:	cfe080e7          	jalr	-770(ra) # 8000133c <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006646:	0001e797          	auipc	a5,0x1e
    8000664a:	5e278793          	addi	a5,a5,1506 # 80024c28 <log>
    8000664e:	57dc                	lw	a5,44(a5)
    80006650:	873e                	mv	a4,a5
    80006652:	47f5                	li	a5,29
    80006654:	02e7c063          	blt	a5,a4,80006674 <log_write+0x4a>
    80006658:	0001e797          	auipc	a5,0x1e
    8000665c:	5d078793          	addi	a5,a5,1488 # 80024c28 <log>
    80006660:	57d8                	lw	a4,44(a5)
    80006662:	0001e797          	auipc	a5,0x1e
    80006666:	5c678793          	addi	a5,a5,1478 # 80024c28 <log>
    8000666a:	4fdc                	lw	a5,28(a5)
    8000666c:	37fd                	addiw	a5,a5,-1
    8000666e:	2781                	sext.w	a5,a5
    80006670:	00f74a63          	blt	a4,a5,80006684 <log_write+0x5a>
    panic("too big a transaction");
    80006674:	00006517          	auipc	a0,0x6
    80006678:	f1c50513          	addi	a0,a0,-228 # 8000c590 <etext+0x590>
    8000667c:	ffffa097          	auipc	ra,0xffffa
    80006680:	610080e7          	jalr	1552(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    80006684:	0001e797          	auipc	a5,0x1e
    80006688:	5a478793          	addi	a5,a5,1444 # 80024c28 <log>
    8000668c:	539c                	lw	a5,32(a5)
    8000668e:	00f04a63          	bgtz	a5,800066a2 <log_write+0x78>
    panic("log_write outside of trans");
    80006692:	00006517          	auipc	a0,0x6
    80006696:	f1650513          	addi	a0,a0,-234 # 8000c5a8 <etext+0x5a8>
    8000669a:	ffffa097          	auipc	ra,0xffffa
    8000669e:	5f2080e7          	jalr	1522(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    800066a2:	fe042623          	sw	zero,-20(s0)
    800066a6:	a03d                	j	800066d4 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    800066a8:	0001e717          	auipc	a4,0x1e
    800066ac:	58070713          	addi	a4,a4,1408 # 80024c28 <log>
    800066b0:	fec42783          	lw	a5,-20(s0)
    800066b4:	07a1                	addi	a5,a5,8
    800066b6:	078a                	slli	a5,a5,0x2
    800066b8:	97ba                	add	a5,a5,a4
    800066ba:	4b9c                	lw	a5,16(a5)
    800066bc:	0007871b          	sext.w	a4,a5
    800066c0:	fd843783          	ld	a5,-40(s0)
    800066c4:	47dc                	lw	a5,12(a5)
    800066c6:	02f70263          	beq	a4,a5,800066ea <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    800066ca:	fec42783          	lw	a5,-20(s0)
    800066ce:	2785                	addiw	a5,a5,1
    800066d0:	fef42623          	sw	a5,-20(s0)
    800066d4:	0001e797          	auipc	a5,0x1e
    800066d8:	55478793          	addi	a5,a5,1364 # 80024c28 <log>
    800066dc:	57d8                	lw	a4,44(a5)
    800066de:	fec42783          	lw	a5,-20(s0)
    800066e2:	2781                	sext.w	a5,a5
    800066e4:	fce7c2e3          	blt	a5,a4,800066a8 <log_write+0x7e>
    800066e8:	a011                	j	800066ec <log_write+0xc2>
      break;
    800066ea:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    800066ec:	fd843783          	ld	a5,-40(s0)
    800066f0:	47dc                	lw	a5,12(a5)
    800066f2:	0007871b          	sext.w	a4,a5
    800066f6:	0001e697          	auipc	a3,0x1e
    800066fa:	53268693          	addi	a3,a3,1330 # 80024c28 <log>
    800066fe:	fec42783          	lw	a5,-20(s0)
    80006702:	07a1                	addi	a5,a5,8
    80006704:	078a                	slli	a5,a5,0x2
    80006706:	97b6                	add	a5,a5,a3
    80006708:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    8000670a:	0001e797          	auipc	a5,0x1e
    8000670e:	51e78793          	addi	a5,a5,1310 # 80024c28 <log>
    80006712:	57d8                	lw	a4,44(a5)
    80006714:	fec42783          	lw	a5,-20(s0)
    80006718:	2781                	sext.w	a5,a5
    8000671a:	02e79563          	bne	a5,a4,80006744 <log_write+0x11a>
    bpin(b);
    8000671e:	fd843503          	ld	a0,-40(s0)
    80006722:	ffffe097          	auipc	ra,0xffffe
    80006726:	344080e7          	jalr	836(ra) # 80004a66 <bpin>
    log.lh.n++;
    8000672a:	0001e797          	auipc	a5,0x1e
    8000672e:	4fe78793          	addi	a5,a5,1278 # 80024c28 <log>
    80006732:	57dc                	lw	a5,44(a5)
    80006734:	2785                	addiw	a5,a5,1
    80006736:	0007871b          	sext.w	a4,a5
    8000673a:	0001e797          	auipc	a5,0x1e
    8000673e:	4ee78793          	addi	a5,a5,1262 # 80024c28 <log>
    80006742:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006744:	0001e517          	auipc	a0,0x1e
    80006748:	4e450513          	addi	a0,a0,1252 # 80024c28 <log>
    8000674c:	ffffb097          	auipc	ra,0xffffb
    80006750:	c54080e7          	jalr	-940(ra) # 800013a0 <release>
}
    80006754:	0001                	nop
    80006756:	70a2                	ld	ra,40(sp)
    80006758:	7402                	ld	s0,32(sp)
    8000675a:	6145                	addi	sp,sp,48
    8000675c:	8082                	ret

000000008000675e <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000675e:	1101                	addi	sp,sp,-32
    80006760:	ec06                	sd	ra,24(sp)
    80006762:	e822                	sd	s0,16(sp)
    80006764:	1000                	addi	s0,sp,32
    80006766:	fea43423          	sd	a0,-24(s0)
    8000676a:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    8000676e:	fe843783          	ld	a5,-24(s0)
    80006772:	07a1                	addi	a5,a5,8
    80006774:	00006597          	auipc	a1,0x6
    80006778:	e5458593          	addi	a1,a1,-428 # 8000c5c8 <etext+0x5c8>
    8000677c:	853e                	mv	a0,a5
    8000677e:	ffffb097          	auipc	ra,0xffffb
    80006782:	b8e080e7          	jalr	-1138(ra) # 8000130c <initlock>
  lk->name = name;
    80006786:	fe843783          	ld	a5,-24(s0)
    8000678a:	fe043703          	ld	a4,-32(s0)
    8000678e:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    80006790:	fe843783          	ld	a5,-24(s0)
    80006794:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006798:	fe843783          	ld	a5,-24(s0)
    8000679c:	0207a423          	sw	zero,40(a5)
}
    800067a0:	0001                	nop
    800067a2:	60e2                	ld	ra,24(sp)
    800067a4:	6442                	ld	s0,16(sp)
    800067a6:	6105                	addi	sp,sp,32
    800067a8:	8082                	ret

00000000800067aa <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    800067aa:	1101                	addi	sp,sp,-32
    800067ac:	ec06                	sd	ra,24(sp)
    800067ae:	e822                	sd	s0,16(sp)
    800067b0:	1000                	addi	s0,sp,32
    800067b2:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800067b6:	fe843783          	ld	a5,-24(s0)
    800067ba:	07a1                	addi	a5,a5,8
    800067bc:	853e                	mv	a0,a5
    800067be:	ffffb097          	auipc	ra,0xffffb
    800067c2:	b7e080e7          	jalr	-1154(ra) # 8000133c <acquire>
  while (lk->locked) {
    800067c6:	a819                	j	800067dc <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    800067c8:	fe843783          	ld	a5,-24(s0)
    800067cc:	07a1                	addi	a5,a5,8
    800067ce:	85be                	mv	a1,a5
    800067d0:	fe843503          	ld	a0,-24(s0)
    800067d4:	ffffd097          	auipc	ra,0xffffd
    800067d8:	dfe080e7          	jalr	-514(ra) # 800035d2 <sleep>
  while (lk->locked) {
    800067dc:	fe843783          	ld	a5,-24(s0)
    800067e0:	439c                	lw	a5,0(a5)
    800067e2:	f3fd                	bnez	a5,800067c8 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    800067e4:	fe843783          	ld	a5,-24(s0)
    800067e8:	4705                	li	a4,1
    800067ea:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    800067ec:	ffffc097          	auipc	ra,0xffffc
    800067f0:	224080e7          	jalr	548(ra) # 80002a10 <myproc>
    800067f4:	87aa                	mv	a5,a0
    800067f6:	5b98                	lw	a4,48(a5)
    800067f8:	fe843783          	ld	a5,-24(s0)
    800067fc:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    800067fe:	fe843783          	ld	a5,-24(s0)
    80006802:	07a1                	addi	a5,a5,8
    80006804:	853e                	mv	a0,a5
    80006806:	ffffb097          	auipc	ra,0xffffb
    8000680a:	b9a080e7          	jalr	-1126(ra) # 800013a0 <release>
}
    8000680e:	0001                	nop
    80006810:	60e2                	ld	ra,24(sp)
    80006812:	6442                	ld	s0,16(sp)
    80006814:	6105                	addi	sp,sp,32
    80006816:	8082                	ret

0000000080006818 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006818:	1101                	addi	sp,sp,-32
    8000681a:	ec06                	sd	ra,24(sp)
    8000681c:	e822                	sd	s0,16(sp)
    8000681e:	1000                	addi	s0,sp,32
    80006820:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006824:	fe843783          	ld	a5,-24(s0)
    80006828:	07a1                	addi	a5,a5,8
    8000682a:	853e                	mv	a0,a5
    8000682c:	ffffb097          	auipc	ra,0xffffb
    80006830:	b10080e7          	jalr	-1264(ra) # 8000133c <acquire>
  lk->locked = 0;
    80006834:	fe843783          	ld	a5,-24(s0)
    80006838:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000683c:	fe843783          	ld	a5,-24(s0)
    80006840:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006844:	fe843503          	ld	a0,-24(s0)
    80006848:	ffffd097          	auipc	ra,0xffffd
    8000684c:	e06080e7          	jalr	-506(ra) # 8000364e <wakeup>
  release(&lk->lk);
    80006850:	fe843783          	ld	a5,-24(s0)
    80006854:	07a1                	addi	a5,a5,8
    80006856:	853e                	mv	a0,a5
    80006858:	ffffb097          	auipc	ra,0xffffb
    8000685c:	b48080e7          	jalr	-1208(ra) # 800013a0 <release>
}
    80006860:	0001                	nop
    80006862:	60e2                	ld	ra,24(sp)
    80006864:	6442                	ld	s0,16(sp)
    80006866:	6105                	addi	sp,sp,32
    80006868:	8082                	ret

000000008000686a <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    8000686a:	7139                	addi	sp,sp,-64
    8000686c:	fc06                	sd	ra,56(sp)
    8000686e:	f822                	sd	s0,48(sp)
    80006870:	f426                	sd	s1,40(sp)
    80006872:	0080                	addi	s0,sp,64
    80006874:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    80006878:	fc843783          	ld	a5,-56(s0)
    8000687c:	07a1                	addi	a5,a5,8
    8000687e:	853e                	mv	a0,a5
    80006880:	ffffb097          	auipc	ra,0xffffb
    80006884:	abc080e7          	jalr	-1348(ra) # 8000133c <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    80006888:	fc843783          	ld	a5,-56(s0)
    8000688c:	439c                	lw	a5,0(a5)
    8000688e:	cf99                	beqz	a5,800068ac <holdingsleep+0x42>
    80006890:	fc843783          	ld	a5,-56(s0)
    80006894:	5784                	lw	s1,40(a5)
    80006896:	ffffc097          	auipc	ra,0xffffc
    8000689a:	17a080e7          	jalr	378(ra) # 80002a10 <myproc>
    8000689e:	87aa                	mv	a5,a0
    800068a0:	5b9c                	lw	a5,48(a5)
    800068a2:	8726                	mv	a4,s1
    800068a4:	00f71463          	bne	a4,a5,800068ac <holdingsleep+0x42>
    800068a8:	4785                	li	a5,1
    800068aa:	a011                	j	800068ae <holdingsleep+0x44>
    800068ac:	4781                	li	a5,0
    800068ae:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    800068b2:	fc843783          	ld	a5,-56(s0)
    800068b6:	07a1                	addi	a5,a5,8
    800068b8:	853e                	mv	a0,a5
    800068ba:	ffffb097          	auipc	ra,0xffffb
    800068be:	ae6080e7          	jalr	-1306(ra) # 800013a0 <release>
  return r;
    800068c2:	fdc42783          	lw	a5,-36(s0)
}
    800068c6:	853e                	mv	a0,a5
    800068c8:	70e2                	ld	ra,56(sp)
    800068ca:	7442                	ld	s0,48(sp)
    800068cc:	74a2                	ld	s1,40(sp)
    800068ce:	6121                	addi	sp,sp,64
    800068d0:	8082                	ret

00000000800068d2 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    800068d2:	1141                	addi	sp,sp,-16
    800068d4:	e406                	sd	ra,8(sp)
    800068d6:	e022                	sd	s0,0(sp)
    800068d8:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    800068da:	00006597          	auipc	a1,0x6
    800068de:	cfe58593          	addi	a1,a1,-770 # 8000c5d8 <etext+0x5d8>
    800068e2:	0001e517          	auipc	a0,0x1e
    800068e6:	48e50513          	addi	a0,a0,1166 # 80024d70 <ftable>
    800068ea:	ffffb097          	auipc	ra,0xffffb
    800068ee:	a22080e7          	jalr	-1502(ra) # 8000130c <initlock>
}
    800068f2:	0001                	nop
    800068f4:	60a2                	ld	ra,8(sp)
    800068f6:	6402                	ld	s0,0(sp)
    800068f8:	0141                	addi	sp,sp,16
    800068fa:	8082                	ret

00000000800068fc <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    800068fc:	1101                	addi	sp,sp,-32
    800068fe:	ec06                	sd	ra,24(sp)
    80006900:	e822                	sd	s0,16(sp)
    80006902:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006904:	0001e517          	auipc	a0,0x1e
    80006908:	46c50513          	addi	a0,a0,1132 # 80024d70 <ftable>
    8000690c:	ffffb097          	auipc	ra,0xffffb
    80006910:	a30080e7          	jalr	-1488(ra) # 8000133c <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006914:	0001e797          	auipc	a5,0x1e
    80006918:	47478793          	addi	a5,a5,1140 # 80024d88 <ftable+0x18>
    8000691c:	fef43423          	sd	a5,-24(s0)
    80006920:	a815                	j	80006954 <filealloc+0x58>
    if(f->ref == 0){
    80006922:	fe843783          	ld	a5,-24(s0)
    80006926:	43dc                	lw	a5,4(a5)
    80006928:	e385                	bnez	a5,80006948 <filealloc+0x4c>
      f->ref = 1;
    8000692a:	fe843783          	ld	a5,-24(s0)
    8000692e:	4705                	li	a4,1
    80006930:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006932:	0001e517          	auipc	a0,0x1e
    80006936:	43e50513          	addi	a0,a0,1086 # 80024d70 <ftable>
    8000693a:	ffffb097          	auipc	ra,0xffffb
    8000693e:	a66080e7          	jalr	-1434(ra) # 800013a0 <release>
      return f;
    80006942:	fe843783          	ld	a5,-24(s0)
    80006946:	a805                	j	80006976 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006948:	fe843783          	ld	a5,-24(s0)
    8000694c:	02878793          	addi	a5,a5,40
    80006950:	fef43423          	sd	a5,-24(s0)
    80006954:	0001f797          	auipc	a5,0x1f
    80006958:	3d478793          	addi	a5,a5,980 # 80025d28 <diskpagesallocated>
    8000695c:	fe843703          	ld	a4,-24(s0)
    80006960:	fcf761e3          	bltu	a4,a5,80006922 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006964:	0001e517          	auipc	a0,0x1e
    80006968:	40c50513          	addi	a0,a0,1036 # 80024d70 <ftable>
    8000696c:	ffffb097          	auipc	ra,0xffffb
    80006970:	a34080e7          	jalr	-1484(ra) # 800013a0 <release>
  return 0;
    80006974:	4781                	li	a5,0
}
    80006976:	853e                	mv	a0,a5
    80006978:	60e2                	ld	ra,24(sp)
    8000697a:	6442                	ld	s0,16(sp)
    8000697c:	6105                	addi	sp,sp,32
    8000697e:	8082                	ret

0000000080006980 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006980:	1101                	addi	sp,sp,-32
    80006982:	ec06                	sd	ra,24(sp)
    80006984:	e822                	sd	s0,16(sp)
    80006986:	1000                	addi	s0,sp,32
    80006988:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    8000698c:	0001e517          	auipc	a0,0x1e
    80006990:	3e450513          	addi	a0,a0,996 # 80024d70 <ftable>
    80006994:	ffffb097          	auipc	ra,0xffffb
    80006998:	9a8080e7          	jalr	-1624(ra) # 8000133c <acquire>
  if(f->ref < 1)
    8000699c:	fe843783          	ld	a5,-24(s0)
    800069a0:	43dc                	lw	a5,4(a5)
    800069a2:	00f04a63          	bgtz	a5,800069b6 <filedup+0x36>
    panic("filedup");
    800069a6:	00006517          	auipc	a0,0x6
    800069aa:	c3a50513          	addi	a0,a0,-966 # 8000c5e0 <etext+0x5e0>
    800069ae:	ffffa097          	auipc	ra,0xffffa
    800069b2:	2de080e7          	jalr	734(ra) # 80000c8c <panic>
  f->ref++;
    800069b6:	fe843783          	ld	a5,-24(s0)
    800069ba:	43dc                	lw	a5,4(a5)
    800069bc:	2785                	addiw	a5,a5,1
    800069be:	0007871b          	sext.w	a4,a5
    800069c2:	fe843783          	ld	a5,-24(s0)
    800069c6:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    800069c8:	0001e517          	auipc	a0,0x1e
    800069cc:	3a850513          	addi	a0,a0,936 # 80024d70 <ftable>
    800069d0:	ffffb097          	auipc	ra,0xffffb
    800069d4:	9d0080e7          	jalr	-1584(ra) # 800013a0 <release>
  return f;
    800069d8:	fe843783          	ld	a5,-24(s0)
}
    800069dc:	853e                	mv	a0,a5
    800069de:	60e2                	ld	ra,24(sp)
    800069e0:	6442                	ld	s0,16(sp)
    800069e2:	6105                	addi	sp,sp,32
    800069e4:	8082                	ret

00000000800069e6 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    800069e6:	715d                	addi	sp,sp,-80
    800069e8:	e486                	sd	ra,72(sp)
    800069ea:	e0a2                	sd	s0,64(sp)
    800069ec:	0880                	addi	s0,sp,80
    800069ee:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    800069f2:	0001e517          	auipc	a0,0x1e
    800069f6:	37e50513          	addi	a0,a0,894 # 80024d70 <ftable>
    800069fa:	ffffb097          	auipc	ra,0xffffb
    800069fe:	942080e7          	jalr	-1726(ra) # 8000133c <acquire>
  if(f->ref < 1)
    80006a02:	fb843783          	ld	a5,-72(s0)
    80006a06:	43dc                	lw	a5,4(a5)
    80006a08:	00f04a63          	bgtz	a5,80006a1c <fileclose+0x36>
    panic("fileclose");
    80006a0c:	00006517          	auipc	a0,0x6
    80006a10:	bdc50513          	addi	a0,a0,-1060 # 8000c5e8 <etext+0x5e8>
    80006a14:	ffffa097          	auipc	ra,0xffffa
    80006a18:	278080e7          	jalr	632(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006a1c:	fb843783          	ld	a5,-72(s0)
    80006a20:	43dc                	lw	a5,4(a5)
    80006a22:	37fd                	addiw	a5,a5,-1
    80006a24:	0007871b          	sext.w	a4,a5
    80006a28:	fb843783          	ld	a5,-72(s0)
    80006a2c:	c3d8                	sw	a4,4(a5)
    80006a2e:	fb843783          	ld	a5,-72(s0)
    80006a32:	43dc                	lw	a5,4(a5)
    80006a34:	00f05b63          	blez	a5,80006a4a <fileclose+0x64>
    release(&ftable.lock);
    80006a38:	0001e517          	auipc	a0,0x1e
    80006a3c:	33850513          	addi	a0,a0,824 # 80024d70 <ftable>
    80006a40:	ffffb097          	auipc	ra,0xffffb
    80006a44:	960080e7          	jalr	-1696(ra) # 800013a0 <release>
    80006a48:	a879                	j	80006ae6 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006a4a:	fb843783          	ld	a5,-72(s0)
    80006a4e:	638c                	ld	a1,0(a5)
    80006a50:	6790                	ld	a2,8(a5)
    80006a52:	6b94                	ld	a3,16(a5)
    80006a54:	6f98                	ld	a4,24(a5)
    80006a56:	739c                	ld	a5,32(a5)
    80006a58:	fcb43423          	sd	a1,-56(s0)
    80006a5c:	fcc43823          	sd	a2,-48(s0)
    80006a60:	fcd43c23          	sd	a3,-40(s0)
    80006a64:	fee43023          	sd	a4,-32(s0)
    80006a68:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006a6c:	fb843783          	ld	a5,-72(s0)
    80006a70:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006a74:	fb843783          	ld	a5,-72(s0)
    80006a78:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006a7c:	0001e517          	auipc	a0,0x1e
    80006a80:	2f450513          	addi	a0,a0,756 # 80024d70 <ftable>
    80006a84:	ffffb097          	auipc	ra,0xffffb
    80006a88:	91c080e7          	jalr	-1764(ra) # 800013a0 <release>

  if(ff.type == FD_PIPE){
    80006a8c:	fc842783          	lw	a5,-56(s0)
    80006a90:	873e                	mv	a4,a5
    80006a92:	4785                	li	a5,1
    80006a94:	00f71e63          	bne	a4,a5,80006ab0 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006a98:	fd843783          	ld	a5,-40(s0)
    80006a9c:	fd144703          	lbu	a4,-47(s0)
    80006aa0:	2701                	sext.w	a4,a4
    80006aa2:	85ba                	mv	a1,a4
    80006aa4:	853e                	mv	a0,a5
    80006aa6:	00000097          	auipc	ra,0x0
    80006aaa:	5aa080e7          	jalr	1450(ra) # 80007050 <pipeclose>
    80006aae:	a825                	j	80006ae6 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006ab0:	fc842783          	lw	a5,-56(s0)
    80006ab4:	873e                	mv	a4,a5
    80006ab6:	4789                	li	a5,2
    80006ab8:	00f70863          	beq	a4,a5,80006ac8 <fileclose+0xe2>
    80006abc:	fc842783          	lw	a5,-56(s0)
    80006ac0:	873e                	mv	a4,a5
    80006ac2:	478d                	li	a5,3
    80006ac4:	02f71163          	bne	a4,a5,80006ae6 <fileclose+0x100>
    begin_op();
    80006ac8:	00000097          	auipc	ra,0x0
    80006acc:	884080e7          	jalr	-1916(ra) # 8000634c <begin_op>
    iput(ff.ip);
    80006ad0:	fe043783          	ld	a5,-32(s0)
    80006ad4:	853e                	mv	a0,a5
    80006ad6:	fffff097          	auipc	ra,0xfffff
    80006ada:	97a080e7          	jalr	-1670(ra) # 80005450 <iput>
    end_op();
    80006ade:	00000097          	auipc	ra,0x0
    80006ae2:	930080e7          	jalr	-1744(ra) # 8000640e <end_op>
  }
}
    80006ae6:	60a6                	ld	ra,72(sp)
    80006ae8:	6406                	ld	s0,64(sp)
    80006aea:	6161                	addi	sp,sp,80
    80006aec:	8082                	ret

0000000080006aee <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006aee:	7139                	addi	sp,sp,-64
    80006af0:	fc06                	sd	ra,56(sp)
    80006af2:	f822                	sd	s0,48(sp)
    80006af4:	0080                	addi	s0,sp,64
    80006af6:	fca43423          	sd	a0,-56(s0)
    80006afa:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006afe:	ffffc097          	auipc	ra,0xffffc
    80006b02:	f12080e7          	jalr	-238(ra) # 80002a10 <myproc>
    80006b06:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006b0a:	fc843783          	ld	a5,-56(s0)
    80006b0e:	439c                	lw	a5,0(a5)
    80006b10:	873e                	mv	a4,a5
    80006b12:	4789                	li	a5,2
    80006b14:	00f70963          	beq	a4,a5,80006b26 <filestat+0x38>
    80006b18:	fc843783          	ld	a5,-56(s0)
    80006b1c:	439c                	lw	a5,0(a5)
    80006b1e:	873e                	mv	a4,a5
    80006b20:	478d                	li	a5,3
    80006b22:	06f71263          	bne	a4,a5,80006b86 <filestat+0x98>
    ilock(f->ip);
    80006b26:	fc843783          	ld	a5,-56(s0)
    80006b2a:	6f9c                	ld	a5,24(a5)
    80006b2c:	853e                	mv	a0,a5
    80006b2e:	ffffe097          	auipc	ra,0xffffe
    80006b32:	794080e7          	jalr	1940(ra) # 800052c2 <ilock>
    stati(f->ip, &st);
    80006b36:	fc843783          	ld	a5,-56(s0)
    80006b3a:	6f9c                	ld	a5,24(a5)
    80006b3c:	fd040713          	addi	a4,s0,-48
    80006b40:	85ba                	mv	a1,a4
    80006b42:	853e                	mv	a0,a5
    80006b44:	fffff097          	auipc	ra,0xfffff
    80006b48:	cd0080e7          	jalr	-816(ra) # 80005814 <stati>
    iunlock(f->ip);
    80006b4c:	fc843783          	ld	a5,-56(s0)
    80006b50:	6f9c                	ld	a5,24(a5)
    80006b52:	853e                	mv	a0,a5
    80006b54:	fffff097          	auipc	ra,0xfffff
    80006b58:	8a2080e7          	jalr	-1886(ra) # 800053f6 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006b5c:	fe843783          	ld	a5,-24(s0)
    80006b60:	6bbc                	ld	a5,80(a5)
    80006b62:	fd040713          	addi	a4,s0,-48
    80006b66:	46e1                	li	a3,24
    80006b68:	863a                	mv	a2,a4
    80006b6a:	fc043583          	ld	a1,-64(s0)
    80006b6e:	853e                	mv	a0,a5
    80006b70:	ffffc097          	auipc	ra,0xffffc
    80006b74:	96a080e7          	jalr	-1686(ra) # 800024da <copyout>
    80006b78:	87aa                	mv	a5,a0
    80006b7a:	0007d463          	bgez	a5,80006b82 <filestat+0x94>
      return -1;
    80006b7e:	57fd                	li	a5,-1
    80006b80:	a021                	j	80006b88 <filestat+0x9a>
    return 0;
    80006b82:	4781                	li	a5,0
    80006b84:	a011                	j	80006b88 <filestat+0x9a>
  }
  return -1;
    80006b86:	57fd                	li	a5,-1
}
    80006b88:	853e                	mv	a0,a5
    80006b8a:	70e2                	ld	ra,56(sp)
    80006b8c:	7442                	ld	s0,48(sp)
    80006b8e:	6121                	addi	sp,sp,64
    80006b90:	8082                	ret

0000000080006b92 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006b92:	7139                	addi	sp,sp,-64
    80006b94:	fc06                	sd	ra,56(sp)
    80006b96:	f822                	sd	s0,48(sp)
    80006b98:	0080                	addi	s0,sp,64
    80006b9a:	fca43c23          	sd	a0,-40(s0)
    80006b9e:	fcb43823          	sd	a1,-48(s0)
    80006ba2:	87b2                	mv	a5,a2
    80006ba4:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006ba8:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006bac:	fd843783          	ld	a5,-40(s0)
    80006bb0:	0087c783          	lbu	a5,8(a5)
    80006bb4:	e399                	bnez	a5,80006bba <fileread+0x28>
    return -1;
    80006bb6:	57fd                	li	a5,-1
    80006bb8:	aa1d                	j	80006cee <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006bba:	fd843783          	ld	a5,-40(s0)
    80006bbe:	439c                	lw	a5,0(a5)
    80006bc0:	873e                	mv	a4,a5
    80006bc2:	4785                	li	a5,1
    80006bc4:	02f71363          	bne	a4,a5,80006bea <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006bc8:	fd843783          	ld	a5,-40(s0)
    80006bcc:	6b9c                	ld	a5,16(a5)
    80006bce:	fcc42703          	lw	a4,-52(s0)
    80006bd2:	863a                	mv	a2,a4
    80006bd4:	fd043583          	ld	a1,-48(s0)
    80006bd8:	853e                	mv	a0,a5
    80006bda:	00000097          	auipc	ra,0x0
    80006bde:	670080e7          	jalr	1648(ra) # 8000724a <piperead>
    80006be2:	87aa                	mv	a5,a0
    80006be4:	fef42623          	sw	a5,-20(s0)
    80006be8:	a209                	j	80006cea <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006bea:	fd843783          	ld	a5,-40(s0)
    80006bee:	439c                	lw	a5,0(a5)
    80006bf0:	873e                	mv	a4,a5
    80006bf2:	478d                	li	a5,3
    80006bf4:	06f71863          	bne	a4,a5,80006c64 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006bf8:	fd843783          	ld	a5,-40(s0)
    80006bfc:	02479783          	lh	a5,36(a5)
    80006c00:	2781                	sext.w	a5,a5
    80006c02:	0207c863          	bltz	a5,80006c32 <fileread+0xa0>
    80006c06:	fd843783          	ld	a5,-40(s0)
    80006c0a:	02479783          	lh	a5,36(a5)
    80006c0e:	0007871b          	sext.w	a4,a5
    80006c12:	47a5                	li	a5,9
    80006c14:	00e7cf63          	blt	a5,a4,80006c32 <fileread+0xa0>
    80006c18:	fd843783          	ld	a5,-40(s0)
    80006c1c:	02479783          	lh	a5,36(a5)
    80006c20:	2781                	sext.w	a5,a5
    80006c22:	0001e717          	auipc	a4,0x1e
    80006c26:	0ae70713          	addi	a4,a4,174 # 80024cd0 <devsw>
    80006c2a:	0792                	slli	a5,a5,0x4
    80006c2c:	97ba                	add	a5,a5,a4
    80006c2e:	639c                	ld	a5,0(a5)
    80006c30:	e399                	bnez	a5,80006c36 <fileread+0xa4>
      return -1;
    80006c32:	57fd                	li	a5,-1
    80006c34:	a86d                	j	80006cee <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006c36:	fd843783          	ld	a5,-40(s0)
    80006c3a:	02479783          	lh	a5,36(a5)
    80006c3e:	2781                	sext.w	a5,a5
    80006c40:	0001e717          	auipc	a4,0x1e
    80006c44:	09070713          	addi	a4,a4,144 # 80024cd0 <devsw>
    80006c48:	0792                	slli	a5,a5,0x4
    80006c4a:	97ba                	add	a5,a5,a4
    80006c4c:	6398                	ld	a4,0(a5)
    80006c4e:	fcc42783          	lw	a5,-52(s0)
    80006c52:	863e                	mv	a2,a5
    80006c54:	fd043583          	ld	a1,-48(s0)
    80006c58:	4505                	li	a0,1
    80006c5a:	9702                	jalr	a4
    80006c5c:	87aa                	mv	a5,a0
    80006c5e:	fef42623          	sw	a5,-20(s0)
    80006c62:	a061                	j	80006cea <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006c64:	fd843783          	ld	a5,-40(s0)
    80006c68:	439c                	lw	a5,0(a5)
    80006c6a:	873e                	mv	a4,a5
    80006c6c:	4789                	li	a5,2
    80006c6e:	06f71663          	bne	a4,a5,80006cda <fileread+0x148>
    ilock(f->ip);
    80006c72:	fd843783          	ld	a5,-40(s0)
    80006c76:	6f9c                	ld	a5,24(a5)
    80006c78:	853e                	mv	a0,a5
    80006c7a:	ffffe097          	auipc	ra,0xffffe
    80006c7e:	648080e7          	jalr	1608(ra) # 800052c2 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006c82:	fd843783          	ld	a5,-40(s0)
    80006c86:	6f88                	ld	a0,24(a5)
    80006c88:	fd843783          	ld	a5,-40(s0)
    80006c8c:	539c                	lw	a5,32(a5)
    80006c8e:	fcc42703          	lw	a4,-52(s0)
    80006c92:	86be                	mv	a3,a5
    80006c94:	fd043603          	ld	a2,-48(s0)
    80006c98:	4585                	li	a1,1
    80006c9a:	fffff097          	auipc	ra,0xfffff
    80006c9e:	bde080e7          	jalr	-1058(ra) # 80005878 <readi>
    80006ca2:	87aa                	mv	a5,a0
    80006ca4:	fef42623          	sw	a5,-20(s0)
    80006ca8:	fec42783          	lw	a5,-20(s0)
    80006cac:	2781                	sext.w	a5,a5
    80006cae:	00f05d63          	blez	a5,80006cc8 <fileread+0x136>
      f->off += r;
    80006cb2:	fd843783          	ld	a5,-40(s0)
    80006cb6:	5398                	lw	a4,32(a5)
    80006cb8:	fec42783          	lw	a5,-20(s0)
    80006cbc:	9fb9                	addw	a5,a5,a4
    80006cbe:	0007871b          	sext.w	a4,a5
    80006cc2:	fd843783          	ld	a5,-40(s0)
    80006cc6:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006cc8:	fd843783          	ld	a5,-40(s0)
    80006ccc:	6f9c                	ld	a5,24(a5)
    80006cce:	853e                	mv	a0,a5
    80006cd0:	ffffe097          	auipc	ra,0xffffe
    80006cd4:	726080e7          	jalr	1830(ra) # 800053f6 <iunlock>
    80006cd8:	a809                	j	80006cea <fileread+0x158>
  } else {
    panic("fileread");
    80006cda:	00006517          	auipc	a0,0x6
    80006cde:	91e50513          	addi	a0,a0,-1762 # 8000c5f8 <etext+0x5f8>
    80006ce2:	ffffa097          	auipc	ra,0xffffa
    80006ce6:	faa080e7          	jalr	-86(ra) # 80000c8c <panic>
  }

  return r;
    80006cea:	fec42783          	lw	a5,-20(s0)
}
    80006cee:	853e                	mv	a0,a5
    80006cf0:	70e2                	ld	ra,56(sp)
    80006cf2:	7442                	ld	s0,48(sp)
    80006cf4:	6121                	addi	sp,sp,64
    80006cf6:	8082                	ret

0000000080006cf8 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006cf8:	715d                	addi	sp,sp,-80
    80006cfa:	e486                	sd	ra,72(sp)
    80006cfc:	e0a2                	sd	s0,64(sp)
    80006cfe:	0880                	addi	s0,sp,80
    80006d00:	fca43423          	sd	a0,-56(s0)
    80006d04:	fcb43023          	sd	a1,-64(s0)
    80006d08:	87b2                	mv	a5,a2
    80006d0a:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006d0e:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006d12:	fc843783          	ld	a5,-56(s0)
    80006d16:	0097c783          	lbu	a5,9(a5)
    80006d1a:	e399                	bnez	a5,80006d20 <filewrite+0x28>
    return -1;
    80006d1c:	57fd                	li	a5,-1
    80006d1e:	aad1                	j	80006ef2 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006d20:	fc843783          	ld	a5,-56(s0)
    80006d24:	439c                	lw	a5,0(a5)
    80006d26:	873e                	mv	a4,a5
    80006d28:	4785                	li	a5,1
    80006d2a:	02f71363          	bne	a4,a5,80006d50 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006d2e:	fc843783          	ld	a5,-56(s0)
    80006d32:	6b9c                	ld	a5,16(a5)
    80006d34:	fbc42703          	lw	a4,-68(s0)
    80006d38:	863a                	mv	a2,a4
    80006d3a:	fc043583          	ld	a1,-64(s0)
    80006d3e:	853e                	mv	a0,a5
    80006d40:	00000097          	auipc	ra,0x0
    80006d44:	3b8080e7          	jalr	952(ra) # 800070f8 <pipewrite>
    80006d48:	87aa                	mv	a5,a0
    80006d4a:	fef42623          	sw	a5,-20(s0)
    80006d4e:	a245                	j	80006eee <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006d50:	fc843783          	ld	a5,-56(s0)
    80006d54:	439c                	lw	a5,0(a5)
    80006d56:	873e                	mv	a4,a5
    80006d58:	478d                	li	a5,3
    80006d5a:	06f71863          	bne	a4,a5,80006dca <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006d5e:	fc843783          	ld	a5,-56(s0)
    80006d62:	02479783          	lh	a5,36(a5)
    80006d66:	2781                	sext.w	a5,a5
    80006d68:	0207c863          	bltz	a5,80006d98 <filewrite+0xa0>
    80006d6c:	fc843783          	ld	a5,-56(s0)
    80006d70:	02479783          	lh	a5,36(a5)
    80006d74:	0007871b          	sext.w	a4,a5
    80006d78:	47a5                	li	a5,9
    80006d7a:	00e7cf63          	blt	a5,a4,80006d98 <filewrite+0xa0>
    80006d7e:	fc843783          	ld	a5,-56(s0)
    80006d82:	02479783          	lh	a5,36(a5)
    80006d86:	2781                	sext.w	a5,a5
    80006d88:	0001e717          	auipc	a4,0x1e
    80006d8c:	f4870713          	addi	a4,a4,-184 # 80024cd0 <devsw>
    80006d90:	0792                	slli	a5,a5,0x4
    80006d92:	97ba                	add	a5,a5,a4
    80006d94:	679c                	ld	a5,8(a5)
    80006d96:	e399                	bnez	a5,80006d9c <filewrite+0xa4>
      return -1;
    80006d98:	57fd                	li	a5,-1
    80006d9a:	aaa1                	j	80006ef2 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006d9c:	fc843783          	ld	a5,-56(s0)
    80006da0:	02479783          	lh	a5,36(a5)
    80006da4:	2781                	sext.w	a5,a5
    80006da6:	0001e717          	auipc	a4,0x1e
    80006daa:	f2a70713          	addi	a4,a4,-214 # 80024cd0 <devsw>
    80006dae:	0792                	slli	a5,a5,0x4
    80006db0:	97ba                	add	a5,a5,a4
    80006db2:	6798                	ld	a4,8(a5)
    80006db4:	fbc42783          	lw	a5,-68(s0)
    80006db8:	863e                	mv	a2,a5
    80006dba:	fc043583          	ld	a1,-64(s0)
    80006dbe:	4505                	li	a0,1
    80006dc0:	9702                	jalr	a4
    80006dc2:	87aa                	mv	a5,a0
    80006dc4:	fef42623          	sw	a5,-20(s0)
    80006dc8:	a21d                	j	80006eee <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006dca:	fc843783          	ld	a5,-56(s0)
    80006dce:	439c                	lw	a5,0(a5)
    80006dd0:	873e                	mv	a4,a5
    80006dd2:	4789                	li	a5,2
    80006dd4:	10f71563          	bne	a4,a5,80006ede <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006dd8:	6785                	lui	a5,0x1
    80006dda:	c007879b          	addiw	a5,a5,-1024
    80006dde:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006de2:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006de6:	a0d9                	j	80006eac <filewrite+0x1b4>
      int n1 = n - i;
    80006de8:	fbc42703          	lw	a4,-68(s0)
    80006dec:	fe842783          	lw	a5,-24(s0)
    80006df0:	40f707bb          	subw	a5,a4,a5
    80006df4:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006df8:	fe442703          	lw	a4,-28(s0)
    80006dfc:	fe042783          	lw	a5,-32(s0)
    80006e00:	2701                	sext.w	a4,a4
    80006e02:	2781                	sext.w	a5,a5
    80006e04:	00e7d663          	bge	a5,a4,80006e10 <filewrite+0x118>
        n1 = max;
    80006e08:	fe042783          	lw	a5,-32(s0)
    80006e0c:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006e10:	fffff097          	auipc	ra,0xfffff
    80006e14:	53c080e7          	jalr	1340(ra) # 8000634c <begin_op>
      ilock(f->ip);
    80006e18:	fc843783          	ld	a5,-56(s0)
    80006e1c:	6f9c                	ld	a5,24(a5)
    80006e1e:	853e                	mv	a0,a5
    80006e20:	ffffe097          	auipc	ra,0xffffe
    80006e24:	4a2080e7          	jalr	1186(ra) # 800052c2 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006e28:	fc843783          	ld	a5,-56(s0)
    80006e2c:	6f88                	ld	a0,24(a5)
    80006e2e:	fe842703          	lw	a4,-24(s0)
    80006e32:	fc043783          	ld	a5,-64(s0)
    80006e36:	00f70633          	add	a2,a4,a5
    80006e3a:	fc843783          	ld	a5,-56(s0)
    80006e3e:	539c                	lw	a5,32(a5)
    80006e40:	fe442703          	lw	a4,-28(s0)
    80006e44:	86be                	mv	a3,a5
    80006e46:	4585                	li	a1,1
    80006e48:	fffff097          	auipc	ra,0xfffff
    80006e4c:	bc8080e7          	jalr	-1080(ra) # 80005a10 <writei>
    80006e50:	87aa                	mv	a5,a0
    80006e52:	fcf42e23          	sw	a5,-36(s0)
    80006e56:	fdc42783          	lw	a5,-36(s0)
    80006e5a:	2781                	sext.w	a5,a5
    80006e5c:	00f05d63          	blez	a5,80006e76 <filewrite+0x17e>
        f->off += r;
    80006e60:	fc843783          	ld	a5,-56(s0)
    80006e64:	5398                	lw	a4,32(a5)
    80006e66:	fdc42783          	lw	a5,-36(s0)
    80006e6a:	9fb9                	addw	a5,a5,a4
    80006e6c:	0007871b          	sext.w	a4,a5
    80006e70:	fc843783          	ld	a5,-56(s0)
    80006e74:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006e76:	fc843783          	ld	a5,-56(s0)
    80006e7a:	6f9c                	ld	a5,24(a5)
    80006e7c:	853e                	mv	a0,a5
    80006e7e:	ffffe097          	auipc	ra,0xffffe
    80006e82:	578080e7          	jalr	1400(ra) # 800053f6 <iunlock>
      end_op();
    80006e86:	fffff097          	auipc	ra,0xfffff
    80006e8a:	588080e7          	jalr	1416(ra) # 8000640e <end_op>

      if(r != n1){
    80006e8e:	fdc42703          	lw	a4,-36(s0)
    80006e92:	fe442783          	lw	a5,-28(s0)
    80006e96:	2701                	sext.w	a4,a4
    80006e98:	2781                	sext.w	a5,a5
    80006e9a:	02f71263          	bne	a4,a5,80006ebe <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006e9e:	fe842703          	lw	a4,-24(s0)
    80006ea2:	fdc42783          	lw	a5,-36(s0)
    80006ea6:	9fb9                	addw	a5,a5,a4
    80006ea8:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006eac:	fe842703          	lw	a4,-24(s0)
    80006eb0:	fbc42783          	lw	a5,-68(s0)
    80006eb4:	2701                	sext.w	a4,a4
    80006eb6:	2781                	sext.w	a5,a5
    80006eb8:	f2f748e3          	blt	a4,a5,80006de8 <filewrite+0xf0>
    80006ebc:	a011                	j	80006ec0 <filewrite+0x1c8>
        break;
    80006ebe:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006ec0:	fe842703          	lw	a4,-24(s0)
    80006ec4:	fbc42783          	lw	a5,-68(s0)
    80006ec8:	2701                	sext.w	a4,a4
    80006eca:	2781                	sext.w	a5,a5
    80006ecc:	00f71563          	bne	a4,a5,80006ed6 <filewrite+0x1de>
    80006ed0:	fbc42783          	lw	a5,-68(s0)
    80006ed4:	a011                	j	80006ed8 <filewrite+0x1e0>
    80006ed6:	57fd                	li	a5,-1
    80006ed8:	fef42623          	sw	a5,-20(s0)
    80006edc:	a809                	j	80006eee <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006ede:	00005517          	auipc	a0,0x5
    80006ee2:	72a50513          	addi	a0,a0,1834 # 8000c608 <etext+0x608>
    80006ee6:	ffffa097          	auipc	ra,0xffffa
    80006eea:	da6080e7          	jalr	-602(ra) # 80000c8c <panic>
  }

  return ret;
    80006eee:	fec42783          	lw	a5,-20(s0)
}
    80006ef2:	853e                	mv	a0,a5
    80006ef4:	60a6                	ld	ra,72(sp)
    80006ef6:	6406                	ld	s0,64(sp)
    80006ef8:	6161                	addi	sp,sp,80
    80006efa:	8082                	ret

0000000080006efc <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006efc:	7179                	addi	sp,sp,-48
    80006efe:	f406                	sd	ra,40(sp)
    80006f00:	f022                	sd	s0,32(sp)
    80006f02:	1800                	addi	s0,sp,48
    80006f04:	fca43c23          	sd	a0,-40(s0)
    80006f08:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006f0c:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006f10:	fd043783          	ld	a5,-48(s0)
    80006f14:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006f18:	fd043783          	ld	a5,-48(s0)
    80006f1c:	6398                	ld	a4,0(a5)
    80006f1e:	fd843783          	ld	a5,-40(s0)
    80006f22:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006f24:	00000097          	auipc	ra,0x0
    80006f28:	9d8080e7          	jalr	-1576(ra) # 800068fc <filealloc>
    80006f2c:	872a                	mv	a4,a0
    80006f2e:	fd843783          	ld	a5,-40(s0)
    80006f32:	e398                	sd	a4,0(a5)
    80006f34:	fd843783          	ld	a5,-40(s0)
    80006f38:	639c                	ld	a5,0(a5)
    80006f3a:	c3e9                	beqz	a5,80006ffc <pipealloc+0x100>
    80006f3c:	00000097          	auipc	ra,0x0
    80006f40:	9c0080e7          	jalr	-1600(ra) # 800068fc <filealloc>
    80006f44:	872a                	mv	a4,a0
    80006f46:	fd043783          	ld	a5,-48(s0)
    80006f4a:	e398                	sd	a4,0(a5)
    80006f4c:	fd043783          	ld	a5,-48(s0)
    80006f50:	639c                	ld	a5,0(a5)
    80006f52:	c7cd                	beqz	a5,80006ffc <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006f54:	ffffa097          	auipc	ra,0xffffa
    80006f58:	282080e7          	jalr	642(ra) # 800011d6 <kalloc>
    80006f5c:	fea43423          	sd	a0,-24(s0)
    80006f60:	fe843783          	ld	a5,-24(s0)
    80006f64:	cfd1                	beqz	a5,80007000 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006f66:	fe843783          	ld	a5,-24(s0)
    80006f6a:	4705                	li	a4,1
    80006f6c:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006f70:	fe843783          	ld	a5,-24(s0)
    80006f74:	4705                	li	a4,1
    80006f76:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006f7a:	fe843783          	ld	a5,-24(s0)
    80006f7e:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006f82:	fe843783          	ld	a5,-24(s0)
    80006f86:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006f8a:	fe843783          	ld	a5,-24(s0)
    80006f8e:	00005597          	auipc	a1,0x5
    80006f92:	68a58593          	addi	a1,a1,1674 # 8000c618 <etext+0x618>
    80006f96:	853e                	mv	a0,a5
    80006f98:	ffffa097          	auipc	ra,0xffffa
    80006f9c:	374080e7          	jalr	884(ra) # 8000130c <initlock>
  (*f0)->type = FD_PIPE;
    80006fa0:	fd843783          	ld	a5,-40(s0)
    80006fa4:	639c                	ld	a5,0(a5)
    80006fa6:	4705                	li	a4,1
    80006fa8:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006faa:	fd843783          	ld	a5,-40(s0)
    80006fae:	639c                	ld	a5,0(a5)
    80006fb0:	4705                	li	a4,1
    80006fb2:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006fb6:	fd843783          	ld	a5,-40(s0)
    80006fba:	639c                	ld	a5,0(a5)
    80006fbc:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006fc0:	fd843783          	ld	a5,-40(s0)
    80006fc4:	639c                	ld	a5,0(a5)
    80006fc6:	fe843703          	ld	a4,-24(s0)
    80006fca:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    80006fcc:	fd043783          	ld	a5,-48(s0)
    80006fd0:	639c                	ld	a5,0(a5)
    80006fd2:	4705                	li	a4,1
    80006fd4:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80006fd6:	fd043783          	ld	a5,-48(s0)
    80006fda:	639c                	ld	a5,0(a5)
    80006fdc:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80006fe0:	fd043783          	ld	a5,-48(s0)
    80006fe4:	639c                	ld	a5,0(a5)
    80006fe6:	4705                	li	a4,1
    80006fe8:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80006fec:	fd043783          	ld	a5,-48(s0)
    80006ff0:	639c                	ld	a5,0(a5)
    80006ff2:	fe843703          	ld	a4,-24(s0)
    80006ff6:	eb98                	sd	a4,16(a5)
  return 0;
    80006ff8:	4781                	li	a5,0
    80006ffa:	a0b1                	j	80007046 <pipealloc+0x14a>
    goto bad;
    80006ffc:	0001                	nop
    80006ffe:	a011                	j	80007002 <pipealloc+0x106>
    goto bad;
    80007000:	0001                	nop

 bad:
  if(pi)
    80007002:	fe843783          	ld	a5,-24(s0)
    80007006:	c799                	beqz	a5,80007014 <pipealloc+0x118>
    kfree((char*)pi);
    80007008:	fe843503          	ld	a0,-24(s0)
    8000700c:	ffffa097          	auipc	ra,0xffffa
    80007010:	124080e7          	jalr	292(ra) # 80001130 <kfree>
  if(*f0)
    80007014:	fd843783          	ld	a5,-40(s0)
    80007018:	639c                	ld	a5,0(a5)
    8000701a:	cb89                	beqz	a5,8000702c <pipealloc+0x130>
    fileclose(*f0);
    8000701c:	fd843783          	ld	a5,-40(s0)
    80007020:	639c                	ld	a5,0(a5)
    80007022:	853e                	mv	a0,a5
    80007024:	00000097          	auipc	ra,0x0
    80007028:	9c2080e7          	jalr	-1598(ra) # 800069e6 <fileclose>
  if(*f1)
    8000702c:	fd043783          	ld	a5,-48(s0)
    80007030:	639c                	ld	a5,0(a5)
    80007032:	cb89                	beqz	a5,80007044 <pipealloc+0x148>
    fileclose(*f1);
    80007034:	fd043783          	ld	a5,-48(s0)
    80007038:	639c                	ld	a5,0(a5)
    8000703a:	853e                	mv	a0,a5
    8000703c:	00000097          	auipc	ra,0x0
    80007040:	9aa080e7          	jalr	-1622(ra) # 800069e6 <fileclose>
  return -1;
    80007044:	57fd                	li	a5,-1
}
    80007046:	853e                	mv	a0,a5
    80007048:	70a2                	ld	ra,40(sp)
    8000704a:	7402                	ld	s0,32(sp)
    8000704c:	6145                	addi	sp,sp,48
    8000704e:	8082                	ret

0000000080007050 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80007050:	1101                	addi	sp,sp,-32
    80007052:	ec06                	sd	ra,24(sp)
    80007054:	e822                	sd	s0,16(sp)
    80007056:	1000                	addi	s0,sp,32
    80007058:	fea43423          	sd	a0,-24(s0)
    8000705c:	87ae                	mv	a5,a1
    8000705e:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80007062:	fe843783          	ld	a5,-24(s0)
    80007066:	853e                	mv	a0,a5
    80007068:	ffffa097          	auipc	ra,0xffffa
    8000706c:	2d4080e7          	jalr	724(ra) # 8000133c <acquire>
  if(writable){
    80007070:	fe442783          	lw	a5,-28(s0)
    80007074:	2781                	sext.w	a5,a5
    80007076:	cf99                	beqz	a5,80007094 <pipeclose+0x44>
    pi->writeopen = 0;
    80007078:	fe843783          	ld	a5,-24(s0)
    8000707c:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    80007080:	fe843783          	ld	a5,-24(s0)
    80007084:	21878793          	addi	a5,a5,536
    80007088:	853e                	mv	a0,a5
    8000708a:	ffffc097          	auipc	ra,0xffffc
    8000708e:	5c4080e7          	jalr	1476(ra) # 8000364e <wakeup>
    80007092:	a831                	j	800070ae <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    80007094:	fe843783          	ld	a5,-24(s0)
    80007098:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    8000709c:	fe843783          	ld	a5,-24(s0)
    800070a0:	21c78793          	addi	a5,a5,540
    800070a4:	853e                	mv	a0,a5
    800070a6:	ffffc097          	auipc	ra,0xffffc
    800070aa:	5a8080e7          	jalr	1448(ra) # 8000364e <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    800070ae:	fe843783          	ld	a5,-24(s0)
    800070b2:	2207a783          	lw	a5,544(a5)
    800070b6:	e785                	bnez	a5,800070de <pipeclose+0x8e>
    800070b8:	fe843783          	ld	a5,-24(s0)
    800070bc:	2247a783          	lw	a5,548(a5)
    800070c0:	ef99                	bnez	a5,800070de <pipeclose+0x8e>
    release(&pi->lock);
    800070c2:	fe843783          	ld	a5,-24(s0)
    800070c6:	853e                	mv	a0,a5
    800070c8:	ffffa097          	auipc	ra,0xffffa
    800070cc:	2d8080e7          	jalr	728(ra) # 800013a0 <release>
    kfree((char*)pi);
    800070d0:	fe843503          	ld	a0,-24(s0)
    800070d4:	ffffa097          	auipc	ra,0xffffa
    800070d8:	05c080e7          	jalr	92(ra) # 80001130 <kfree>
    800070dc:	a809                	j	800070ee <pipeclose+0x9e>
  } else
    release(&pi->lock);
    800070de:	fe843783          	ld	a5,-24(s0)
    800070e2:	853e                	mv	a0,a5
    800070e4:	ffffa097          	auipc	ra,0xffffa
    800070e8:	2bc080e7          	jalr	700(ra) # 800013a0 <release>
}
    800070ec:	0001                	nop
    800070ee:	0001                	nop
    800070f0:	60e2                	ld	ra,24(sp)
    800070f2:	6442                	ld	s0,16(sp)
    800070f4:	6105                	addi	sp,sp,32
    800070f6:	8082                	ret

00000000800070f8 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    800070f8:	715d                	addi	sp,sp,-80
    800070fa:	e486                	sd	ra,72(sp)
    800070fc:	e0a2                	sd	s0,64(sp)
    800070fe:	0880                	addi	s0,sp,80
    80007100:	fca43423          	sd	a0,-56(s0)
    80007104:	fcb43023          	sd	a1,-64(s0)
    80007108:	87b2                	mv	a5,a2
    8000710a:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    8000710e:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007112:	ffffc097          	auipc	ra,0xffffc
    80007116:	8fe080e7          	jalr	-1794(ra) # 80002a10 <myproc>
    8000711a:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    8000711e:	fc843783          	ld	a5,-56(s0)
    80007122:	853e                	mv	a0,a5
    80007124:	ffffa097          	auipc	ra,0xffffa
    80007128:	218080e7          	jalr	536(ra) # 8000133c <acquire>
  while(i < n){
    8000712c:	a8f1                	j	80007208 <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    8000712e:	fc843783          	ld	a5,-56(s0)
    80007132:	2207a783          	lw	a5,544(a5)
    80007136:	cb89                	beqz	a5,80007148 <pipewrite+0x50>
    80007138:	fe043503          	ld	a0,-32(s0)
    8000713c:	ffffc097          	auipc	ra,0xffffc
    80007140:	6a4080e7          	jalr	1700(ra) # 800037e0 <killed>
    80007144:	87aa                	mv	a5,a0
    80007146:	cb91                	beqz	a5,8000715a <pipewrite+0x62>
      release(&pi->lock);
    80007148:	fc843783          	ld	a5,-56(s0)
    8000714c:	853e                	mv	a0,a5
    8000714e:	ffffa097          	auipc	ra,0xffffa
    80007152:	252080e7          	jalr	594(ra) # 800013a0 <release>
      return -1;
    80007156:	57fd                	li	a5,-1
    80007158:	a0e5                	j	80007240 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    8000715a:	fc843783          	ld	a5,-56(s0)
    8000715e:	21c7a703          	lw	a4,540(a5)
    80007162:	fc843783          	ld	a5,-56(s0)
    80007166:	2187a783          	lw	a5,536(a5)
    8000716a:	2007879b          	addiw	a5,a5,512
    8000716e:	2781                	sext.w	a5,a5
    80007170:	02f71863          	bne	a4,a5,800071a0 <pipewrite+0xa8>
      wakeup(&pi->nread);
    80007174:	fc843783          	ld	a5,-56(s0)
    80007178:	21878793          	addi	a5,a5,536
    8000717c:	853e                	mv	a0,a5
    8000717e:	ffffc097          	auipc	ra,0xffffc
    80007182:	4d0080e7          	jalr	1232(ra) # 8000364e <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    80007186:	fc843783          	ld	a5,-56(s0)
    8000718a:	21c78793          	addi	a5,a5,540
    8000718e:	fc843703          	ld	a4,-56(s0)
    80007192:	85ba                	mv	a1,a4
    80007194:	853e                	mv	a0,a5
    80007196:	ffffc097          	auipc	ra,0xffffc
    8000719a:	43c080e7          	jalr	1084(ra) # 800035d2 <sleep>
    8000719e:	a0ad                	j	80007208 <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800071a0:	fe043783          	ld	a5,-32(s0)
    800071a4:	6ba8                	ld	a0,80(a5)
    800071a6:	fec42703          	lw	a4,-20(s0)
    800071aa:	fc043783          	ld	a5,-64(s0)
    800071ae:	973e                	add	a4,a4,a5
    800071b0:	fdf40793          	addi	a5,s0,-33
    800071b4:	4685                	li	a3,1
    800071b6:	863a                	mv	a2,a4
    800071b8:	85be                	mv	a1,a5
    800071ba:	ffffb097          	auipc	ra,0xffffb
    800071be:	3ee080e7          	jalr	1006(ra) # 800025a8 <copyin>
    800071c2:	87aa                	mv	a5,a0
    800071c4:	873e                	mv	a4,a5
    800071c6:	57fd                	li	a5,-1
    800071c8:	04f70963          	beq	a4,a5,8000721a <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    800071cc:	fc843783          	ld	a5,-56(s0)
    800071d0:	21c7a783          	lw	a5,540(a5)
    800071d4:	2781                	sext.w	a5,a5
    800071d6:	0017871b          	addiw	a4,a5,1
    800071da:	0007069b          	sext.w	a3,a4
    800071de:	fc843703          	ld	a4,-56(s0)
    800071e2:	20d72e23          	sw	a3,540(a4)
    800071e6:	1ff7f793          	andi	a5,a5,511
    800071ea:	2781                	sext.w	a5,a5
    800071ec:	fdf44703          	lbu	a4,-33(s0)
    800071f0:	fc843683          	ld	a3,-56(s0)
    800071f4:	1782                	slli	a5,a5,0x20
    800071f6:	9381                	srli	a5,a5,0x20
    800071f8:	97b6                	add	a5,a5,a3
    800071fa:	00e78c23          	sb	a4,24(a5)
      i++;
    800071fe:	fec42783          	lw	a5,-20(s0)
    80007202:	2785                	addiw	a5,a5,1
    80007204:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80007208:	fec42703          	lw	a4,-20(s0)
    8000720c:	fbc42783          	lw	a5,-68(s0)
    80007210:	2701                	sext.w	a4,a4
    80007212:	2781                	sext.w	a5,a5
    80007214:	f0f74de3          	blt	a4,a5,8000712e <pipewrite+0x36>
    80007218:	a011                	j	8000721c <pipewrite+0x124>
        break;
    8000721a:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    8000721c:	fc843783          	ld	a5,-56(s0)
    80007220:	21878793          	addi	a5,a5,536
    80007224:	853e                	mv	a0,a5
    80007226:	ffffc097          	auipc	ra,0xffffc
    8000722a:	428080e7          	jalr	1064(ra) # 8000364e <wakeup>
  release(&pi->lock);
    8000722e:	fc843783          	ld	a5,-56(s0)
    80007232:	853e                	mv	a0,a5
    80007234:	ffffa097          	auipc	ra,0xffffa
    80007238:	16c080e7          	jalr	364(ra) # 800013a0 <release>

  return i;
    8000723c:	fec42783          	lw	a5,-20(s0)
}
    80007240:	853e                	mv	a0,a5
    80007242:	60a6                	ld	ra,72(sp)
    80007244:	6406                	ld	s0,64(sp)
    80007246:	6161                	addi	sp,sp,80
    80007248:	8082                	ret

000000008000724a <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    8000724a:	715d                	addi	sp,sp,-80
    8000724c:	e486                	sd	ra,72(sp)
    8000724e:	e0a2                	sd	s0,64(sp)
    80007250:	0880                	addi	s0,sp,80
    80007252:	fca43423          	sd	a0,-56(s0)
    80007256:	fcb43023          	sd	a1,-64(s0)
    8000725a:	87b2                	mv	a5,a2
    8000725c:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007260:	ffffb097          	auipc	ra,0xffffb
    80007264:	7b0080e7          	jalr	1968(ra) # 80002a10 <myproc>
    80007268:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    8000726c:	fc843783          	ld	a5,-56(s0)
    80007270:	853e                	mv	a0,a5
    80007272:	ffffa097          	auipc	ra,0xffffa
    80007276:	0ca080e7          	jalr	202(ra) # 8000133c <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    8000727a:	a835                	j	800072b6 <piperead+0x6c>
    if(killed(pr)){
    8000727c:	fe043503          	ld	a0,-32(s0)
    80007280:	ffffc097          	auipc	ra,0xffffc
    80007284:	560080e7          	jalr	1376(ra) # 800037e0 <killed>
    80007288:	87aa                	mv	a5,a0
    8000728a:	cb91                	beqz	a5,8000729e <piperead+0x54>
      release(&pi->lock);
    8000728c:	fc843783          	ld	a5,-56(s0)
    80007290:	853e                	mv	a0,a5
    80007292:	ffffa097          	auipc	ra,0xffffa
    80007296:	10e080e7          	jalr	270(ra) # 800013a0 <release>
      return -1;
    8000729a:	57fd                	li	a5,-1
    8000729c:	a8dd                	j	80007392 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    8000729e:	fc843783          	ld	a5,-56(s0)
    800072a2:	21878793          	addi	a5,a5,536
    800072a6:	fc843703          	ld	a4,-56(s0)
    800072aa:	85ba                	mv	a1,a4
    800072ac:	853e                	mv	a0,a5
    800072ae:	ffffc097          	auipc	ra,0xffffc
    800072b2:	324080e7          	jalr	804(ra) # 800035d2 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800072b6:	fc843783          	ld	a5,-56(s0)
    800072ba:	2187a703          	lw	a4,536(a5)
    800072be:	fc843783          	ld	a5,-56(s0)
    800072c2:	21c7a783          	lw	a5,540(a5)
    800072c6:	00f71763          	bne	a4,a5,800072d4 <piperead+0x8a>
    800072ca:	fc843783          	ld	a5,-56(s0)
    800072ce:	2247a783          	lw	a5,548(a5)
    800072d2:	f7cd                	bnez	a5,8000727c <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800072d4:	fe042623          	sw	zero,-20(s0)
    800072d8:	a8bd                	j	80007356 <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    800072da:	fc843783          	ld	a5,-56(s0)
    800072de:	2187a703          	lw	a4,536(a5)
    800072e2:	fc843783          	ld	a5,-56(s0)
    800072e6:	21c7a783          	lw	a5,540(a5)
    800072ea:	06f70f63          	beq	a4,a5,80007368 <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    800072ee:	fc843783          	ld	a5,-56(s0)
    800072f2:	2187a783          	lw	a5,536(a5)
    800072f6:	2781                	sext.w	a5,a5
    800072f8:	0017871b          	addiw	a4,a5,1
    800072fc:	0007069b          	sext.w	a3,a4
    80007300:	fc843703          	ld	a4,-56(s0)
    80007304:	20d72c23          	sw	a3,536(a4)
    80007308:	1ff7f793          	andi	a5,a5,511
    8000730c:	2781                	sext.w	a5,a5
    8000730e:	fc843703          	ld	a4,-56(s0)
    80007312:	1782                	slli	a5,a5,0x20
    80007314:	9381                	srli	a5,a5,0x20
    80007316:	97ba                	add	a5,a5,a4
    80007318:	0187c783          	lbu	a5,24(a5)
    8000731c:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007320:	fe043783          	ld	a5,-32(s0)
    80007324:	6ba8                	ld	a0,80(a5)
    80007326:	fec42703          	lw	a4,-20(s0)
    8000732a:	fc043783          	ld	a5,-64(s0)
    8000732e:	97ba                	add	a5,a5,a4
    80007330:	fdf40713          	addi	a4,s0,-33
    80007334:	4685                	li	a3,1
    80007336:	863a                	mv	a2,a4
    80007338:	85be                	mv	a1,a5
    8000733a:	ffffb097          	auipc	ra,0xffffb
    8000733e:	1a0080e7          	jalr	416(ra) # 800024da <copyout>
    80007342:	87aa                	mv	a5,a0
    80007344:	873e                	mv	a4,a5
    80007346:	57fd                	li	a5,-1
    80007348:	02f70263          	beq	a4,a5,8000736c <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000734c:	fec42783          	lw	a5,-20(s0)
    80007350:	2785                	addiw	a5,a5,1
    80007352:	fef42623          	sw	a5,-20(s0)
    80007356:	fec42703          	lw	a4,-20(s0)
    8000735a:	fbc42783          	lw	a5,-68(s0)
    8000735e:	2701                	sext.w	a4,a4
    80007360:	2781                	sext.w	a5,a5
    80007362:	f6f74ce3          	blt	a4,a5,800072da <piperead+0x90>
    80007366:	a021                	j	8000736e <piperead+0x124>
      break;
    80007368:	0001                	nop
    8000736a:	a011                	j	8000736e <piperead+0x124>
      break;
    8000736c:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    8000736e:	fc843783          	ld	a5,-56(s0)
    80007372:	21c78793          	addi	a5,a5,540
    80007376:	853e                	mv	a0,a5
    80007378:	ffffc097          	auipc	ra,0xffffc
    8000737c:	2d6080e7          	jalr	726(ra) # 8000364e <wakeup>
  release(&pi->lock);
    80007380:	fc843783          	ld	a5,-56(s0)
    80007384:	853e                	mv	a0,a5
    80007386:	ffffa097          	auipc	ra,0xffffa
    8000738a:	01a080e7          	jalr	26(ra) # 800013a0 <release>
  return i;
    8000738e:	fec42783          	lw	a5,-20(s0)
}
    80007392:	853e                	mv	a0,a5
    80007394:	60a6                	ld	ra,72(sp)
    80007396:	6406                	ld	s0,64(sp)
    80007398:	6161                	addi	sp,sp,80
    8000739a:	8082                	ret

000000008000739c <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    8000739c:	7179                	addi	sp,sp,-48
    8000739e:	f422                	sd	s0,40(sp)
    800073a0:	1800                	addi	s0,sp,48
    800073a2:	87aa                	mv	a5,a0
    800073a4:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    800073a8:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    800073ac:	fdc42783          	lw	a5,-36(s0)
    800073b0:	8b85                	andi	a5,a5,1
    800073b2:	2781                	sext.w	a5,a5
    800073b4:	c781                	beqz	a5,800073bc <flags2perm+0x20>
      perm = PTE_X;
    800073b6:	47a1                	li	a5,8
    800073b8:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    800073bc:	fdc42783          	lw	a5,-36(s0)
    800073c0:	8b89                	andi	a5,a5,2
    800073c2:	2781                	sext.w	a5,a5
    800073c4:	c799                	beqz	a5,800073d2 <flags2perm+0x36>
      perm |= PTE_W;
    800073c6:	fec42783          	lw	a5,-20(s0)
    800073ca:	0047e793          	ori	a5,a5,4
    800073ce:	fef42623          	sw	a5,-20(s0)
    return perm;
    800073d2:	fec42783          	lw	a5,-20(s0)
}
    800073d6:	853e                	mv	a0,a5
    800073d8:	7422                	ld	s0,40(sp)
    800073da:	6145                	addi	sp,sp,48
    800073dc:	8082                	ret

00000000800073de <exec>:

int
exec(char *path, char **argv)
{
    800073de:	de010113          	addi	sp,sp,-544
    800073e2:	20113c23          	sd	ra,536(sp)
    800073e6:	20813823          	sd	s0,528(sp)
    800073ea:	20913423          	sd	s1,520(sp)
    800073ee:	1400                	addi	s0,sp,544
    800073f0:	dea43423          	sd	a0,-536(s0)
    800073f4:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    800073f8:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    800073fc:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007400:	ffffb097          	auipc	ra,0xffffb
    80007404:	610080e7          	jalr	1552(ra) # 80002a10 <myproc>
    80007408:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    8000740c:	fffff097          	auipc	ra,0xfffff
    80007410:	f40080e7          	jalr	-192(ra) # 8000634c <begin_op>

  if((ip = namei(path)) == 0){
    80007414:	de843503          	ld	a0,-536(s0)
    80007418:	fffff097          	auipc	ra,0xfffff
    8000741c:	bd0080e7          	jalr	-1072(ra) # 80005fe8 <namei>
    80007420:	faa43423          	sd	a0,-88(s0)
    80007424:	fa843783          	ld	a5,-88(s0)
    80007428:	e799                	bnez	a5,80007436 <exec+0x58>
    end_op();
    8000742a:	fffff097          	auipc	ra,0xfffff
    8000742e:	fe4080e7          	jalr	-28(ra) # 8000640e <end_op>
    return -1;
    80007432:	57fd                	li	a5,-1
    80007434:	a1a9                	j	8000787e <exec+0x4a0>
  }
  ilock(ip);
    80007436:	fa843503          	ld	a0,-88(s0)
    8000743a:	ffffe097          	auipc	ra,0xffffe
    8000743e:	e88080e7          	jalr	-376(ra) # 800052c2 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    80007442:	e3040793          	addi	a5,s0,-464
    80007446:	04000713          	li	a4,64
    8000744a:	4681                	li	a3,0
    8000744c:	863e                	mv	a2,a5
    8000744e:	4581                	li	a1,0
    80007450:	fa843503          	ld	a0,-88(s0)
    80007454:	ffffe097          	auipc	ra,0xffffe
    80007458:	424080e7          	jalr	1060(ra) # 80005878 <readi>
    8000745c:	87aa                	mv	a5,a0
    8000745e:	873e                	mv	a4,a5
    80007460:	04000793          	li	a5,64
    80007464:	3af71763          	bne	a4,a5,80007812 <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    80007468:	e3042783          	lw	a5,-464(s0)
    8000746c:	873e                	mv	a4,a5
    8000746e:	464c47b7          	lui	a5,0x464c4
    80007472:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    80007476:	3af71063          	bne	a4,a5,80007816 <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    8000747a:	f9843503          	ld	a0,-104(s0)
    8000747e:	ffffb097          	auipc	ra,0xffffb
    80007482:	7f4080e7          	jalr	2036(ra) # 80002c72 <proc_pagetable>
    80007486:	faa43023          	sd	a0,-96(s0)
    8000748a:	fa043783          	ld	a5,-96(s0)
    8000748e:	38078663          	beqz	a5,8000781a <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007492:	fc042623          	sw	zero,-52(s0)
    80007496:	e5043783          	ld	a5,-432(s0)
    8000749a:	fcf42423          	sw	a5,-56(s0)
    8000749e:	a0fd                	j	8000758c <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800074a0:	df840793          	addi	a5,s0,-520
    800074a4:	fc842683          	lw	a3,-56(s0)
    800074a8:	03800713          	li	a4,56
    800074ac:	863e                	mv	a2,a5
    800074ae:	4581                	li	a1,0
    800074b0:	fa843503          	ld	a0,-88(s0)
    800074b4:	ffffe097          	auipc	ra,0xffffe
    800074b8:	3c4080e7          	jalr	964(ra) # 80005878 <readi>
    800074bc:	87aa                	mv	a5,a0
    800074be:	873e                	mv	a4,a5
    800074c0:	03800793          	li	a5,56
    800074c4:	34f71d63          	bne	a4,a5,8000781e <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    800074c8:	df842783          	lw	a5,-520(s0)
    800074cc:	873e                	mv	a4,a5
    800074ce:	4785                	li	a5,1
    800074d0:	0af71163          	bne	a4,a5,80007572 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    800074d4:	e2043703          	ld	a4,-480(s0)
    800074d8:	e1843783          	ld	a5,-488(s0)
    800074dc:	34f76363          	bltu	a4,a5,80007822 <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    800074e0:	e0843703          	ld	a4,-504(s0)
    800074e4:	e2043783          	ld	a5,-480(s0)
    800074e8:	973e                	add	a4,a4,a5
    800074ea:	e0843783          	ld	a5,-504(s0)
    800074ee:	32f76c63          	bltu	a4,a5,80007826 <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    800074f2:	e0843703          	ld	a4,-504(s0)
    800074f6:	6785                	lui	a5,0x1
    800074f8:	17fd                	addi	a5,a5,-1
    800074fa:	8ff9                	and	a5,a5,a4
    800074fc:	32079763          	bnez	a5,8000782a <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007500:	e0843703          	ld	a4,-504(s0)
    80007504:	e2043783          	ld	a5,-480(s0)
    80007508:	00f704b3          	add	s1,a4,a5
    8000750c:	dfc42783          	lw	a5,-516(s0)
    80007510:	2781                	sext.w	a5,a5
    80007512:	853e                	mv	a0,a5
    80007514:	00000097          	auipc	ra,0x0
    80007518:	e88080e7          	jalr	-376(ra) # 8000739c <flags2perm>
    8000751c:	87aa                	mv	a5,a0
    8000751e:	86be                	mv	a3,a5
    80007520:	8626                	mv	a2,s1
    80007522:	fb843583          	ld	a1,-72(s0)
    80007526:	fa043503          	ld	a0,-96(s0)
    8000752a:	ffffb097          	auipc	ra,0xffffb
    8000752e:	bb4080e7          	jalr	-1100(ra) # 800020de <uvmalloc>
    80007532:	f6a43823          	sd	a0,-144(s0)
    80007536:	f7043783          	ld	a5,-144(s0)
    8000753a:	2e078a63          	beqz	a5,8000782e <exec+0x450>
      goto bad;
    sz = sz1;
    8000753e:	f7043783          	ld	a5,-144(s0)
    80007542:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    80007546:	e0843783          	ld	a5,-504(s0)
    8000754a:	e0043703          	ld	a4,-512(s0)
    8000754e:	0007069b          	sext.w	a3,a4
    80007552:	e1843703          	ld	a4,-488(s0)
    80007556:	2701                	sext.w	a4,a4
    80007558:	fa843603          	ld	a2,-88(s0)
    8000755c:	85be                	mv	a1,a5
    8000755e:	fa043503          	ld	a0,-96(s0)
    80007562:	00000097          	auipc	ra,0x0
    80007566:	330080e7          	jalr	816(ra) # 80007892 <loadseg>
    8000756a:	87aa                	mv	a5,a0
    8000756c:	2c07c363          	bltz	a5,80007832 <exec+0x454>
    80007570:	a011                	j	80007574 <exec+0x196>
      continue;
    80007572:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    80007574:	fcc42783          	lw	a5,-52(s0)
    80007578:	2785                	addiw	a5,a5,1
    8000757a:	fcf42623          	sw	a5,-52(s0)
    8000757e:	fc842783          	lw	a5,-56(s0)
    80007582:	0387879b          	addiw	a5,a5,56
    80007586:	2781                	sext.w	a5,a5
    80007588:	fcf42423          	sw	a5,-56(s0)
    8000758c:	e6845783          	lhu	a5,-408(s0)
    80007590:	0007871b          	sext.w	a4,a5
    80007594:	fcc42783          	lw	a5,-52(s0)
    80007598:	2781                	sext.w	a5,a5
    8000759a:	f0e7c3e3          	blt	a5,a4,800074a0 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    8000759e:	fa843503          	ld	a0,-88(s0)
    800075a2:	ffffe097          	auipc	ra,0xffffe
    800075a6:	f7e080e7          	jalr	-130(ra) # 80005520 <iunlockput>
  end_op();
    800075aa:	fffff097          	auipc	ra,0xfffff
    800075ae:	e64080e7          	jalr	-412(ra) # 8000640e <end_op>
  ip = 0;
    800075b2:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800075b6:	ffffb097          	auipc	ra,0xffffb
    800075ba:	45a080e7          	jalr	1114(ra) # 80002a10 <myproc>
    800075be:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    800075c2:	f9843783          	ld	a5,-104(s0)
    800075c6:	67bc                	ld	a5,72(a5)
    800075c8:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    800075cc:	fb843703          	ld	a4,-72(s0)
    800075d0:	6785                	lui	a5,0x1
    800075d2:	17fd                	addi	a5,a5,-1
    800075d4:	973e                	add	a4,a4,a5
    800075d6:	77fd                	lui	a5,0xfffff
    800075d8:	8ff9                	and	a5,a5,a4
    800075da:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    800075de:	fb843703          	ld	a4,-72(s0)
    800075e2:	6789                	lui	a5,0x2
    800075e4:	97ba                	add	a5,a5,a4
    800075e6:	4691                	li	a3,4
    800075e8:	863e                	mv	a2,a5
    800075ea:	fb843583          	ld	a1,-72(s0)
    800075ee:	fa043503          	ld	a0,-96(s0)
    800075f2:	ffffb097          	auipc	ra,0xffffb
    800075f6:	aec080e7          	jalr	-1300(ra) # 800020de <uvmalloc>
    800075fa:	f8a43423          	sd	a0,-120(s0)
    800075fe:	f8843783          	ld	a5,-120(s0)
    80007602:	22078a63          	beqz	a5,80007836 <exec+0x458>
    goto bad;
  sz = sz1;
    80007606:	f8843783          	ld	a5,-120(s0)
    8000760a:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    8000760e:	fb843703          	ld	a4,-72(s0)
    80007612:	77f9                	lui	a5,0xffffe
    80007614:	97ba                	add	a5,a5,a4
    80007616:	85be                	mv	a1,a5
    80007618:	fa043503          	ld	a0,-96(s0)
    8000761c:	ffffb097          	auipc	ra,0xffffb
    80007620:	e58080e7          	jalr	-424(ra) # 80002474 <uvmclear>
  sp = sz;
    80007624:	fb843783          	ld	a5,-72(s0)
    80007628:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    8000762c:	fb043703          	ld	a4,-80(s0)
    80007630:	77fd                	lui	a5,0xfffff
    80007632:	97ba                	add	a5,a5,a4
    80007634:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007638:	fc043023          	sd	zero,-64(s0)
    8000763c:	a845                	j	800076ec <exec+0x30e>
    if(argc >= MAXARG)
    8000763e:	fc043703          	ld	a4,-64(s0)
    80007642:	47fd                	li	a5,31
    80007644:	1ee7eb63          	bltu	a5,a4,8000783a <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007648:	fc043783          	ld	a5,-64(s0)
    8000764c:	078e                	slli	a5,a5,0x3
    8000764e:	de043703          	ld	a4,-544(s0)
    80007652:	97ba                	add	a5,a5,a4
    80007654:	639c                	ld	a5,0(a5)
    80007656:	853e                	mv	a0,a5
    80007658:	ffffa097          	auipc	ra,0xffffa
    8000765c:	236080e7          	jalr	566(ra) # 8000188e <strlen>
    80007660:	87aa                	mv	a5,a0
    80007662:	2785                	addiw	a5,a5,1
    80007664:	2781                	sext.w	a5,a5
    80007666:	873e                	mv	a4,a5
    80007668:	fb043783          	ld	a5,-80(s0)
    8000766c:	8f99                	sub	a5,a5,a4
    8000766e:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007672:	fb043783          	ld	a5,-80(s0)
    80007676:	9bc1                	andi	a5,a5,-16
    80007678:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    8000767c:	fb043703          	ld	a4,-80(s0)
    80007680:	f8043783          	ld	a5,-128(s0)
    80007684:	1af76d63          	bltu	a4,a5,8000783e <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    80007688:	fc043783          	ld	a5,-64(s0)
    8000768c:	078e                	slli	a5,a5,0x3
    8000768e:	de043703          	ld	a4,-544(s0)
    80007692:	97ba                	add	a5,a5,a4
    80007694:	6384                	ld	s1,0(a5)
    80007696:	fc043783          	ld	a5,-64(s0)
    8000769a:	078e                	slli	a5,a5,0x3
    8000769c:	de043703          	ld	a4,-544(s0)
    800076a0:	97ba                	add	a5,a5,a4
    800076a2:	639c                	ld	a5,0(a5)
    800076a4:	853e                	mv	a0,a5
    800076a6:	ffffa097          	auipc	ra,0xffffa
    800076aa:	1e8080e7          	jalr	488(ra) # 8000188e <strlen>
    800076ae:	87aa                	mv	a5,a0
    800076b0:	2785                	addiw	a5,a5,1
    800076b2:	2781                	sext.w	a5,a5
    800076b4:	86be                	mv	a3,a5
    800076b6:	8626                	mv	a2,s1
    800076b8:	fb043583          	ld	a1,-80(s0)
    800076bc:	fa043503          	ld	a0,-96(s0)
    800076c0:	ffffb097          	auipc	ra,0xffffb
    800076c4:	e1a080e7          	jalr	-486(ra) # 800024da <copyout>
    800076c8:	87aa                	mv	a5,a0
    800076ca:	1607cc63          	bltz	a5,80007842 <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    800076ce:	fc043783          	ld	a5,-64(s0)
    800076d2:	078e                	slli	a5,a5,0x3
    800076d4:	fe040713          	addi	a4,s0,-32
    800076d8:	97ba                	add	a5,a5,a4
    800076da:	fb043703          	ld	a4,-80(s0)
    800076de:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ff98ca8>
  for(argc = 0; argv[argc]; argc++) {
    800076e2:	fc043783          	ld	a5,-64(s0)
    800076e6:	0785                	addi	a5,a5,1
    800076e8:	fcf43023          	sd	a5,-64(s0)
    800076ec:	fc043783          	ld	a5,-64(s0)
    800076f0:	078e                	slli	a5,a5,0x3
    800076f2:	de043703          	ld	a4,-544(s0)
    800076f6:	97ba                	add	a5,a5,a4
    800076f8:	639c                	ld	a5,0(a5)
    800076fa:	f3b1                	bnez	a5,8000763e <exec+0x260>
  }
  ustack[argc] = 0;
    800076fc:	fc043783          	ld	a5,-64(s0)
    80007700:	078e                	slli	a5,a5,0x3
    80007702:	fe040713          	addi	a4,s0,-32
    80007706:	97ba                	add	a5,a5,a4
    80007708:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    8000770c:	fc043783          	ld	a5,-64(s0)
    80007710:	0785                	addi	a5,a5,1
    80007712:	078e                	slli	a5,a5,0x3
    80007714:	fb043703          	ld	a4,-80(s0)
    80007718:	40f707b3          	sub	a5,a4,a5
    8000771c:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007720:	fb043783          	ld	a5,-80(s0)
    80007724:	9bc1                	andi	a5,a5,-16
    80007726:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    8000772a:	fb043703          	ld	a4,-80(s0)
    8000772e:	f8043783          	ld	a5,-128(s0)
    80007732:	10f76a63          	bltu	a4,a5,80007846 <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80007736:	fc043783          	ld	a5,-64(s0)
    8000773a:	0785                	addi	a5,a5,1
    8000773c:	00379713          	slli	a4,a5,0x3
    80007740:	e7040793          	addi	a5,s0,-400
    80007744:	86ba                	mv	a3,a4
    80007746:	863e                	mv	a2,a5
    80007748:	fb043583          	ld	a1,-80(s0)
    8000774c:	fa043503          	ld	a0,-96(s0)
    80007750:	ffffb097          	auipc	ra,0xffffb
    80007754:	d8a080e7          	jalr	-630(ra) # 800024da <copyout>
    80007758:	87aa                	mv	a5,a0
    8000775a:	0e07c863          	bltz	a5,8000784a <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    8000775e:	f9843783          	ld	a5,-104(s0)
    80007762:	6fbc                	ld	a5,88(a5)
    80007764:	fb043703          	ld	a4,-80(s0)
    80007768:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    8000776a:	de843783          	ld	a5,-536(s0)
    8000776e:	fcf43c23          	sd	a5,-40(s0)
    80007772:	fd843783          	ld	a5,-40(s0)
    80007776:	fcf43823          	sd	a5,-48(s0)
    8000777a:	a025                	j	800077a2 <exec+0x3c4>
    if(*s == '/')
    8000777c:	fd843783          	ld	a5,-40(s0)
    80007780:	0007c783          	lbu	a5,0(a5)
    80007784:	873e                	mv	a4,a5
    80007786:	02f00793          	li	a5,47
    8000778a:	00f71763          	bne	a4,a5,80007798 <exec+0x3ba>
      last = s+1;
    8000778e:	fd843783          	ld	a5,-40(s0)
    80007792:	0785                	addi	a5,a5,1
    80007794:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    80007798:	fd843783          	ld	a5,-40(s0)
    8000779c:	0785                	addi	a5,a5,1
    8000779e:	fcf43c23          	sd	a5,-40(s0)
    800077a2:	fd843783          	ld	a5,-40(s0)
    800077a6:	0007c783          	lbu	a5,0(a5)
    800077aa:	fbe9                	bnez	a5,8000777c <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    800077ac:	f9843783          	ld	a5,-104(s0)
    800077b0:	15878793          	addi	a5,a5,344
    800077b4:	4641                	li	a2,16
    800077b6:	fd043583          	ld	a1,-48(s0)
    800077ba:	853e                	mv	a0,a5
    800077bc:	ffffa097          	auipc	ra,0xffffa
    800077c0:	058080e7          	jalr	88(ra) # 80001814 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    800077c4:	f9843783          	ld	a5,-104(s0)
    800077c8:	6bbc                	ld	a5,80(a5)
    800077ca:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    800077ce:	f9843783          	ld	a5,-104(s0)
    800077d2:	fa043703          	ld	a4,-96(s0)
    800077d6:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    800077d8:	f9843783          	ld	a5,-104(s0)
    800077dc:	fb843703          	ld	a4,-72(s0)
    800077e0:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    800077e2:	f9843783          	ld	a5,-104(s0)
    800077e6:	6fbc                	ld	a5,88(a5)
    800077e8:	e4843703          	ld	a4,-440(s0)
    800077ec:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    800077ee:	f9843783          	ld	a5,-104(s0)
    800077f2:	6fbc                	ld	a5,88(a5)
    800077f4:	fb043703          	ld	a4,-80(s0)
    800077f8:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    800077fa:	f9043583          	ld	a1,-112(s0)
    800077fe:	f7843503          	ld	a0,-136(s0)
    80007802:	ffffb097          	auipc	ra,0xffffb
    80007806:	530080e7          	jalr	1328(ra) # 80002d32 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    8000780a:	fc043783          	ld	a5,-64(s0)
    8000780e:	2781                	sext.w	a5,a5
    80007810:	a0bd                	j	8000787e <exec+0x4a0>
    goto bad;
    80007812:	0001                	nop
    80007814:	a825                	j	8000784c <exec+0x46e>
    goto bad;
    80007816:	0001                	nop
    80007818:	a815                	j	8000784c <exec+0x46e>
    goto bad;
    8000781a:	0001                	nop
    8000781c:	a805                	j	8000784c <exec+0x46e>
      goto bad;
    8000781e:	0001                	nop
    80007820:	a035                	j	8000784c <exec+0x46e>
      goto bad;
    80007822:	0001                	nop
    80007824:	a025                	j	8000784c <exec+0x46e>
      goto bad;
    80007826:	0001                	nop
    80007828:	a015                	j	8000784c <exec+0x46e>
      goto bad;
    8000782a:	0001                	nop
    8000782c:	a005                	j	8000784c <exec+0x46e>
      goto bad;
    8000782e:	0001                	nop
    80007830:	a831                	j	8000784c <exec+0x46e>
      goto bad;
    80007832:	0001                	nop
    80007834:	a821                	j	8000784c <exec+0x46e>
    goto bad;
    80007836:	0001                	nop
    80007838:	a811                	j	8000784c <exec+0x46e>
      goto bad;
    8000783a:	0001                	nop
    8000783c:	a801                	j	8000784c <exec+0x46e>
      goto bad;
    8000783e:	0001                	nop
    80007840:	a031                	j	8000784c <exec+0x46e>
      goto bad;
    80007842:	0001                	nop
    80007844:	a021                	j	8000784c <exec+0x46e>
    goto bad;
    80007846:	0001                	nop
    80007848:	a011                	j	8000784c <exec+0x46e>
    goto bad;
    8000784a:	0001                	nop

 bad:
  if(pagetable)
    8000784c:	fa043783          	ld	a5,-96(s0)
    80007850:	cb89                	beqz	a5,80007862 <exec+0x484>
    proc_freepagetable(pagetable, sz);
    80007852:	fb843583          	ld	a1,-72(s0)
    80007856:	fa043503          	ld	a0,-96(s0)
    8000785a:	ffffb097          	auipc	ra,0xffffb
    8000785e:	4d8080e7          	jalr	1240(ra) # 80002d32 <proc_freepagetable>
  if(ip){
    80007862:	fa843783          	ld	a5,-88(s0)
    80007866:	cb99                	beqz	a5,8000787c <exec+0x49e>
    iunlockput(ip);
    80007868:	fa843503          	ld	a0,-88(s0)
    8000786c:	ffffe097          	auipc	ra,0xffffe
    80007870:	cb4080e7          	jalr	-844(ra) # 80005520 <iunlockput>
    end_op();
    80007874:	fffff097          	auipc	ra,0xfffff
    80007878:	b9a080e7          	jalr	-1126(ra) # 8000640e <end_op>
  }
  return -1;
    8000787c:	57fd                	li	a5,-1
}
    8000787e:	853e                	mv	a0,a5
    80007880:	21813083          	ld	ra,536(sp)
    80007884:	21013403          	ld	s0,528(sp)
    80007888:	20813483          	ld	s1,520(sp)
    8000788c:	22010113          	addi	sp,sp,544
    80007890:	8082                	ret

0000000080007892 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    80007892:	7139                	addi	sp,sp,-64
    80007894:	fc06                	sd	ra,56(sp)
    80007896:	f822                	sd	s0,48(sp)
    80007898:	0080                	addi	s0,sp,64
    8000789a:	fca43c23          	sd	a0,-40(s0)
    8000789e:	fcb43823          	sd	a1,-48(s0)
    800078a2:	fcc43423          	sd	a2,-56(s0)
    800078a6:	87b6                	mv	a5,a3
    800078a8:	fcf42223          	sw	a5,-60(s0)
    800078ac:	87ba                	mv	a5,a4
    800078ae:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    800078b2:	fe042623          	sw	zero,-20(s0)
    800078b6:	a05d                	j	8000795c <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    800078b8:	fec46703          	lwu	a4,-20(s0)
    800078bc:	fd043783          	ld	a5,-48(s0)
    800078c0:	97ba                	add	a5,a5,a4
    800078c2:	85be                	mv	a1,a5
    800078c4:	fd843503          	ld	a0,-40(s0)
    800078c8:	ffffa097          	auipc	ra,0xffffa
    800078cc:	414080e7          	jalr	1044(ra) # 80001cdc <walkaddr>
    800078d0:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800078d4:	fe043783          	ld	a5,-32(s0)
    800078d8:	eb89                	bnez	a5,800078ea <loadseg+0x58>
      panic("loadseg: address should exist");
    800078da:	00005517          	auipc	a0,0x5
    800078de:	d4650513          	addi	a0,a0,-698 # 8000c620 <etext+0x620>
    800078e2:	ffff9097          	auipc	ra,0xffff9
    800078e6:	3aa080e7          	jalr	938(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    800078ea:	fc042703          	lw	a4,-64(s0)
    800078ee:	fec42783          	lw	a5,-20(s0)
    800078f2:	40f707bb          	subw	a5,a4,a5
    800078f6:	2781                	sext.w	a5,a5
    800078f8:	873e                	mv	a4,a5
    800078fa:	6785                	lui	a5,0x1
    800078fc:	00f77b63          	bgeu	a4,a5,80007912 <loadseg+0x80>
      n = sz - i;
    80007900:	fc042703          	lw	a4,-64(s0)
    80007904:	fec42783          	lw	a5,-20(s0)
    80007908:	40f707bb          	subw	a5,a4,a5
    8000790c:	fef42423          	sw	a5,-24(s0)
    80007910:	a021                	j	80007918 <loadseg+0x86>
    else
      n = PGSIZE;
    80007912:	6785                	lui	a5,0x1
    80007914:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007918:	fc442703          	lw	a4,-60(s0)
    8000791c:	fec42783          	lw	a5,-20(s0)
    80007920:	9fb9                	addw	a5,a5,a4
    80007922:	2781                	sext.w	a5,a5
    80007924:	fe842703          	lw	a4,-24(s0)
    80007928:	86be                	mv	a3,a5
    8000792a:	fe043603          	ld	a2,-32(s0)
    8000792e:	4581                	li	a1,0
    80007930:	fc843503          	ld	a0,-56(s0)
    80007934:	ffffe097          	auipc	ra,0xffffe
    80007938:	f44080e7          	jalr	-188(ra) # 80005878 <readi>
    8000793c:	87aa                	mv	a5,a0
    8000793e:	0007871b          	sext.w	a4,a5
    80007942:	fe842783          	lw	a5,-24(s0)
    80007946:	2781                	sext.w	a5,a5
    80007948:	00e78463          	beq	a5,a4,80007950 <loadseg+0xbe>
      return -1;
    8000794c:	57fd                	li	a5,-1
    8000794e:	a005                	j	8000796e <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007950:	fec42703          	lw	a4,-20(s0)
    80007954:	6785                	lui	a5,0x1
    80007956:	9fb9                	addw	a5,a5,a4
    80007958:	fef42623          	sw	a5,-20(s0)
    8000795c:	fec42703          	lw	a4,-20(s0)
    80007960:	fc042783          	lw	a5,-64(s0)
    80007964:	2701                	sext.w	a4,a4
    80007966:	2781                	sext.w	a5,a5
    80007968:	f4f768e3          	bltu	a4,a5,800078b8 <loadseg+0x26>
  }
  
  return 0;
    8000796c:	4781                	li	a5,0
}
    8000796e:	853e                	mv	a0,a5
    80007970:	70e2                	ld	ra,56(sp)
    80007972:	7442                	ld	s0,48(sp)
    80007974:	6121                	addi	sp,sp,64
    80007976:	8082                	ret

0000000080007978 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007978:	7139                	addi	sp,sp,-64
    8000797a:	fc06                	sd	ra,56(sp)
    8000797c:	f822                	sd	s0,48(sp)
    8000797e:	0080                	addi	s0,sp,64
    80007980:	87aa                	mv	a5,a0
    80007982:	fcb43823          	sd	a1,-48(s0)
    80007986:	fcc43423          	sd	a2,-56(s0)
    8000798a:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    8000798e:	fe440713          	addi	a4,s0,-28
    80007992:	fdc42783          	lw	a5,-36(s0)
    80007996:	85ba                	mv	a1,a4
    80007998:	853e                	mv	a0,a5
    8000799a:	ffffd097          	auipc	ra,0xffffd
    8000799e:	980080e7          	jalr	-1664(ra) # 8000431a <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    800079a2:	fe442783          	lw	a5,-28(s0)
    800079a6:	0207c863          	bltz	a5,800079d6 <argfd+0x5e>
    800079aa:	fe442783          	lw	a5,-28(s0)
    800079ae:	873e                	mv	a4,a5
    800079b0:	47bd                	li	a5,15
    800079b2:	02e7c263          	blt	a5,a4,800079d6 <argfd+0x5e>
    800079b6:	ffffb097          	auipc	ra,0xffffb
    800079ba:	05a080e7          	jalr	90(ra) # 80002a10 <myproc>
    800079be:	872a                	mv	a4,a0
    800079c0:	fe442783          	lw	a5,-28(s0)
    800079c4:	07e9                	addi	a5,a5,26
    800079c6:	078e                	slli	a5,a5,0x3
    800079c8:	97ba                	add	a5,a5,a4
    800079ca:	639c                	ld	a5,0(a5)
    800079cc:	fef43423          	sd	a5,-24(s0)
    800079d0:	fe843783          	ld	a5,-24(s0)
    800079d4:	e399                	bnez	a5,800079da <argfd+0x62>
    return -1;
    800079d6:	57fd                	li	a5,-1
    800079d8:	a015                	j	800079fc <argfd+0x84>
  if(pfd)
    800079da:	fd043783          	ld	a5,-48(s0)
    800079de:	c791                	beqz	a5,800079ea <argfd+0x72>
    *pfd = fd;
    800079e0:	fe442703          	lw	a4,-28(s0)
    800079e4:	fd043783          	ld	a5,-48(s0)
    800079e8:	c398                	sw	a4,0(a5)
  if(pf)
    800079ea:	fc843783          	ld	a5,-56(s0)
    800079ee:	c791                	beqz	a5,800079fa <argfd+0x82>
    *pf = f;
    800079f0:	fc843783          	ld	a5,-56(s0)
    800079f4:	fe843703          	ld	a4,-24(s0)
    800079f8:	e398                	sd	a4,0(a5)
  return 0;
    800079fa:	4781                	li	a5,0
}
    800079fc:	853e                	mv	a0,a5
    800079fe:	70e2                	ld	ra,56(sp)
    80007a00:	7442                	ld	s0,48(sp)
    80007a02:	6121                	addi	sp,sp,64
    80007a04:	8082                	ret

0000000080007a06 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007a06:	7179                	addi	sp,sp,-48
    80007a08:	f406                	sd	ra,40(sp)
    80007a0a:	f022                	sd	s0,32(sp)
    80007a0c:	1800                	addi	s0,sp,48
    80007a0e:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007a12:	ffffb097          	auipc	ra,0xffffb
    80007a16:	ffe080e7          	jalr	-2(ra) # 80002a10 <myproc>
    80007a1a:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007a1e:	fe042623          	sw	zero,-20(s0)
    80007a22:	a825                	j	80007a5a <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007a24:	fe043703          	ld	a4,-32(s0)
    80007a28:	fec42783          	lw	a5,-20(s0)
    80007a2c:	07e9                	addi	a5,a5,26
    80007a2e:	078e                	slli	a5,a5,0x3
    80007a30:	97ba                	add	a5,a5,a4
    80007a32:	639c                	ld	a5,0(a5)
    80007a34:	ef91                	bnez	a5,80007a50 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007a36:	fe043703          	ld	a4,-32(s0)
    80007a3a:	fec42783          	lw	a5,-20(s0)
    80007a3e:	07e9                	addi	a5,a5,26
    80007a40:	078e                	slli	a5,a5,0x3
    80007a42:	97ba                	add	a5,a5,a4
    80007a44:	fd843703          	ld	a4,-40(s0)
    80007a48:	e398                	sd	a4,0(a5)
      return fd;
    80007a4a:	fec42783          	lw	a5,-20(s0)
    80007a4e:	a831                	j	80007a6a <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007a50:	fec42783          	lw	a5,-20(s0)
    80007a54:	2785                	addiw	a5,a5,1
    80007a56:	fef42623          	sw	a5,-20(s0)
    80007a5a:	fec42783          	lw	a5,-20(s0)
    80007a5e:	0007871b          	sext.w	a4,a5
    80007a62:	47bd                	li	a5,15
    80007a64:	fce7d0e3          	bge	a5,a4,80007a24 <fdalloc+0x1e>
    }
  }
  return -1;
    80007a68:	57fd                	li	a5,-1
}
    80007a6a:	853e                	mv	a0,a5
    80007a6c:	70a2                	ld	ra,40(sp)
    80007a6e:	7402                	ld	s0,32(sp)
    80007a70:	6145                	addi	sp,sp,48
    80007a72:	8082                	ret

0000000080007a74 <sys_dup>:

uint64
sys_dup(void)
{
    80007a74:	1101                	addi	sp,sp,-32
    80007a76:	ec06                	sd	ra,24(sp)
    80007a78:	e822                	sd	s0,16(sp)
    80007a7a:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007a7c:	fe040793          	addi	a5,s0,-32
    80007a80:	863e                	mv	a2,a5
    80007a82:	4581                	li	a1,0
    80007a84:	4501                	li	a0,0
    80007a86:	00000097          	auipc	ra,0x0
    80007a8a:	ef2080e7          	jalr	-270(ra) # 80007978 <argfd>
    80007a8e:	87aa                	mv	a5,a0
    80007a90:	0007d463          	bgez	a5,80007a98 <sys_dup+0x24>
    return -1;
    80007a94:	57fd                	li	a5,-1
    80007a96:	a81d                	j	80007acc <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007a98:	fe043783          	ld	a5,-32(s0)
    80007a9c:	853e                	mv	a0,a5
    80007a9e:	00000097          	auipc	ra,0x0
    80007aa2:	f68080e7          	jalr	-152(ra) # 80007a06 <fdalloc>
    80007aa6:	87aa                	mv	a5,a0
    80007aa8:	fef42623          	sw	a5,-20(s0)
    80007aac:	fec42783          	lw	a5,-20(s0)
    80007ab0:	2781                	sext.w	a5,a5
    80007ab2:	0007d463          	bgez	a5,80007aba <sys_dup+0x46>
    return -1;
    80007ab6:	57fd                	li	a5,-1
    80007ab8:	a811                	j	80007acc <sys_dup+0x58>
  filedup(f);
    80007aba:	fe043783          	ld	a5,-32(s0)
    80007abe:	853e                	mv	a0,a5
    80007ac0:	fffff097          	auipc	ra,0xfffff
    80007ac4:	ec0080e7          	jalr	-320(ra) # 80006980 <filedup>
  return fd;
    80007ac8:	fec42783          	lw	a5,-20(s0)
}
    80007acc:	853e                	mv	a0,a5
    80007ace:	60e2                	ld	ra,24(sp)
    80007ad0:	6442                	ld	s0,16(sp)
    80007ad2:	6105                	addi	sp,sp,32
    80007ad4:	8082                	ret

0000000080007ad6 <sys_read>:

uint64
sys_read(void)
{
    80007ad6:	7179                	addi	sp,sp,-48
    80007ad8:	f406                	sd	ra,40(sp)
    80007ada:	f022                	sd	s0,32(sp)
    80007adc:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007ade:	fd840793          	addi	a5,s0,-40
    80007ae2:	85be                	mv	a1,a5
    80007ae4:	4505                	li	a0,1
    80007ae6:	ffffd097          	auipc	ra,0xffffd
    80007aea:	86a080e7          	jalr	-1942(ra) # 80004350 <argaddr>
  argint(2, &n);
    80007aee:	fe440793          	addi	a5,s0,-28
    80007af2:	85be                	mv	a1,a5
    80007af4:	4509                	li	a0,2
    80007af6:	ffffd097          	auipc	ra,0xffffd
    80007afa:	824080e7          	jalr	-2012(ra) # 8000431a <argint>
  if(argfd(0, 0, &f) < 0)
    80007afe:	fe840793          	addi	a5,s0,-24
    80007b02:	863e                	mv	a2,a5
    80007b04:	4581                	li	a1,0
    80007b06:	4501                	li	a0,0
    80007b08:	00000097          	auipc	ra,0x0
    80007b0c:	e70080e7          	jalr	-400(ra) # 80007978 <argfd>
    80007b10:	87aa                	mv	a5,a0
    80007b12:	0007d463          	bgez	a5,80007b1a <sys_read+0x44>
    return -1;
    80007b16:	57fd                	li	a5,-1
    80007b18:	a839                	j	80007b36 <sys_read+0x60>
  return fileread(f, p, n);
    80007b1a:	fe843783          	ld	a5,-24(s0)
    80007b1e:	fd843703          	ld	a4,-40(s0)
    80007b22:	fe442683          	lw	a3,-28(s0)
    80007b26:	8636                	mv	a2,a3
    80007b28:	85ba                	mv	a1,a4
    80007b2a:	853e                	mv	a0,a5
    80007b2c:	fffff097          	auipc	ra,0xfffff
    80007b30:	066080e7          	jalr	102(ra) # 80006b92 <fileread>
    80007b34:	87aa                	mv	a5,a0
}
    80007b36:	853e                	mv	a0,a5
    80007b38:	70a2                	ld	ra,40(sp)
    80007b3a:	7402                	ld	s0,32(sp)
    80007b3c:	6145                	addi	sp,sp,48
    80007b3e:	8082                	ret

0000000080007b40 <sys_write>:

uint64
sys_write(void)
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
    80007b54:	800080e7          	jalr	-2048(ra) # 80004350 <argaddr>
  argint(2, &n);
    80007b58:	fe440793          	addi	a5,s0,-28
    80007b5c:	85be                	mv	a1,a5
    80007b5e:	4509                	li	a0,2
    80007b60:	ffffc097          	auipc	ra,0xffffc
    80007b64:	7ba080e7          	jalr	1978(ra) # 8000431a <argint>
  if(argfd(0, 0, &f) < 0)
    80007b68:	fe840793          	addi	a5,s0,-24
    80007b6c:	863e                	mv	a2,a5
    80007b6e:	4581                	li	a1,0
    80007b70:	4501                	li	a0,0
    80007b72:	00000097          	auipc	ra,0x0
    80007b76:	e06080e7          	jalr	-506(ra) # 80007978 <argfd>
    80007b7a:	87aa                	mv	a5,a0
    80007b7c:	0007d463          	bgez	a5,80007b84 <sys_write+0x44>
    return -1;
    80007b80:	57fd                	li	a5,-1
    80007b82:	a839                	j	80007ba0 <sys_write+0x60>

  return filewrite(f, p, n);
    80007b84:	fe843783          	ld	a5,-24(s0)
    80007b88:	fd843703          	ld	a4,-40(s0)
    80007b8c:	fe442683          	lw	a3,-28(s0)
    80007b90:	8636                	mv	a2,a3
    80007b92:	85ba                	mv	a1,a4
    80007b94:	853e                	mv	a0,a5
    80007b96:	fffff097          	auipc	ra,0xfffff
    80007b9a:	162080e7          	jalr	354(ra) # 80006cf8 <filewrite>
    80007b9e:	87aa                	mv	a5,a0
}
    80007ba0:	853e                	mv	a0,a5
    80007ba2:	70a2                	ld	ra,40(sp)
    80007ba4:	7402                	ld	s0,32(sp)
    80007ba6:	6145                	addi	sp,sp,48
    80007ba8:	8082                	ret

0000000080007baa <sys_close>:

uint64
sys_close(void)
{
    80007baa:	1101                	addi	sp,sp,-32
    80007bac:	ec06                	sd	ra,24(sp)
    80007bae:	e822                	sd	s0,16(sp)
    80007bb0:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007bb2:	fe040713          	addi	a4,s0,-32
    80007bb6:	fec40793          	addi	a5,s0,-20
    80007bba:	863a                	mv	a2,a4
    80007bbc:	85be                	mv	a1,a5
    80007bbe:	4501                	li	a0,0
    80007bc0:	00000097          	auipc	ra,0x0
    80007bc4:	db8080e7          	jalr	-584(ra) # 80007978 <argfd>
    80007bc8:	87aa                	mv	a5,a0
    80007bca:	0007d463          	bgez	a5,80007bd2 <sys_close+0x28>
    return -1;
    80007bce:	57fd                	li	a5,-1
    80007bd0:	a02d                	j	80007bfa <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007bd2:	ffffb097          	auipc	ra,0xffffb
    80007bd6:	e3e080e7          	jalr	-450(ra) # 80002a10 <myproc>
    80007bda:	872a                	mv	a4,a0
    80007bdc:	fec42783          	lw	a5,-20(s0)
    80007be0:	07e9                	addi	a5,a5,26
    80007be2:	078e                	slli	a5,a5,0x3
    80007be4:	97ba                	add	a5,a5,a4
    80007be6:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007bea:	fe043783          	ld	a5,-32(s0)
    80007bee:	853e                	mv	a0,a5
    80007bf0:	fffff097          	auipc	ra,0xfffff
    80007bf4:	df6080e7          	jalr	-522(ra) # 800069e6 <fileclose>
  return 0;
    80007bf8:	4781                	li	a5,0
}
    80007bfa:	853e                	mv	a0,a5
    80007bfc:	60e2                	ld	ra,24(sp)
    80007bfe:	6442                	ld	s0,16(sp)
    80007c00:	6105                	addi	sp,sp,32
    80007c02:	8082                	ret

0000000080007c04 <sys_fstat>:

uint64
sys_fstat(void)
{
    80007c04:	1101                	addi	sp,sp,-32
    80007c06:	ec06                	sd	ra,24(sp)
    80007c08:	e822                	sd	s0,16(sp)
    80007c0a:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007c0c:	fe040793          	addi	a5,s0,-32
    80007c10:	85be                	mv	a1,a5
    80007c12:	4505                	li	a0,1
    80007c14:	ffffc097          	auipc	ra,0xffffc
    80007c18:	73c080e7          	jalr	1852(ra) # 80004350 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007c1c:	fe840793          	addi	a5,s0,-24
    80007c20:	863e                	mv	a2,a5
    80007c22:	4581                	li	a1,0
    80007c24:	4501                	li	a0,0
    80007c26:	00000097          	auipc	ra,0x0
    80007c2a:	d52080e7          	jalr	-686(ra) # 80007978 <argfd>
    80007c2e:	87aa                	mv	a5,a0
    80007c30:	0007d463          	bgez	a5,80007c38 <sys_fstat+0x34>
    return -1;
    80007c34:	57fd                	li	a5,-1
    80007c36:	a821                	j	80007c4e <sys_fstat+0x4a>
  return filestat(f, st);
    80007c38:	fe843783          	ld	a5,-24(s0)
    80007c3c:	fe043703          	ld	a4,-32(s0)
    80007c40:	85ba                	mv	a1,a4
    80007c42:	853e                	mv	a0,a5
    80007c44:	fffff097          	auipc	ra,0xfffff
    80007c48:	eaa080e7          	jalr	-342(ra) # 80006aee <filestat>
    80007c4c:	87aa                	mv	a5,a0
}
    80007c4e:	853e                	mv	a0,a5
    80007c50:	60e2                	ld	ra,24(sp)
    80007c52:	6442                	ld	s0,16(sp)
    80007c54:	6105                	addi	sp,sp,32
    80007c56:	8082                	ret

0000000080007c58 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007c58:	7169                	addi	sp,sp,-304
    80007c5a:	f606                	sd	ra,296(sp)
    80007c5c:	f222                	sd	s0,288(sp)
    80007c5e:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007c60:	ed040793          	addi	a5,s0,-304
    80007c64:	08000613          	li	a2,128
    80007c68:	85be                	mv	a1,a5
    80007c6a:	4501                	li	a0,0
    80007c6c:	ffffc097          	auipc	ra,0xffffc
    80007c70:	716080e7          	jalr	1814(ra) # 80004382 <argstr>
    80007c74:	87aa                	mv	a5,a0
    80007c76:	0007cf63          	bltz	a5,80007c94 <sys_link+0x3c>
    80007c7a:	f5040793          	addi	a5,s0,-176
    80007c7e:	08000613          	li	a2,128
    80007c82:	85be                	mv	a1,a5
    80007c84:	4505                	li	a0,1
    80007c86:	ffffc097          	auipc	ra,0xffffc
    80007c8a:	6fc080e7          	jalr	1788(ra) # 80004382 <argstr>
    80007c8e:	87aa                	mv	a5,a0
    80007c90:	0007d463          	bgez	a5,80007c98 <sys_link+0x40>
    return -1;
    80007c94:	57fd                	li	a5,-1
    80007c96:	aab5                	j	80007e12 <sys_link+0x1ba>

  begin_op();
    80007c98:	ffffe097          	auipc	ra,0xffffe
    80007c9c:	6b4080e7          	jalr	1716(ra) # 8000634c <begin_op>
  if((ip = namei(old)) == 0){
    80007ca0:	ed040793          	addi	a5,s0,-304
    80007ca4:	853e                	mv	a0,a5
    80007ca6:	ffffe097          	auipc	ra,0xffffe
    80007caa:	342080e7          	jalr	834(ra) # 80005fe8 <namei>
    80007cae:	fea43423          	sd	a0,-24(s0)
    80007cb2:	fe843783          	ld	a5,-24(s0)
    80007cb6:	e799                	bnez	a5,80007cc4 <sys_link+0x6c>
    end_op();
    80007cb8:	ffffe097          	auipc	ra,0xffffe
    80007cbc:	756080e7          	jalr	1878(ra) # 8000640e <end_op>
    return -1;
    80007cc0:	57fd                	li	a5,-1
    80007cc2:	aa81                	j	80007e12 <sys_link+0x1ba>
  }

  ilock(ip);
    80007cc4:	fe843503          	ld	a0,-24(s0)
    80007cc8:	ffffd097          	auipc	ra,0xffffd
    80007ccc:	5fa080e7          	jalr	1530(ra) # 800052c2 <ilock>
  if(ip->type == T_DIR){
    80007cd0:	fe843783          	ld	a5,-24(s0)
    80007cd4:	04479783          	lh	a5,68(a5)
    80007cd8:	0007871b          	sext.w	a4,a5
    80007cdc:	4785                	li	a5,1
    80007cde:	00f71e63          	bne	a4,a5,80007cfa <sys_link+0xa2>
    iunlockput(ip);
    80007ce2:	fe843503          	ld	a0,-24(s0)
    80007ce6:	ffffe097          	auipc	ra,0xffffe
    80007cea:	83a080e7          	jalr	-1990(ra) # 80005520 <iunlockput>
    end_op();
    80007cee:	ffffe097          	auipc	ra,0xffffe
    80007cf2:	720080e7          	jalr	1824(ra) # 8000640e <end_op>
    return -1;
    80007cf6:	57fd                	li	a5,-1
    80007cf8:	aa29                	j	80007e12 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007cfa:	fe843783          	ld	a5,-24(s0)
    80007cfe:	04a79783          	lh	a5,74(a5)
    80007d02:	17c2                	slli	a5,a5,0x30
    80007d04:	93c1                	srli	a5,a5,0x30
    80007d06:	2785                	addiw	a5,a5,1
    80007d08:	17c2                	slli	a5,a5,0x30
    80007d0a:	93c1                	srli	a5,a5,0x30
    80007d0c:	0107971b          	slliw	a4,a5,0x10
    80007d10:	4107571b          	sraiw	a4,a4,0x10
    80007d14:	fe843783          	ld	a5,-24(s0)
    80007d18:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d1c:	fe843503          	ld	a0,-24(s0)
    80007d20:	ffffd097          	auipc	ra,0xffffd
    80007d24:	352080e7          	jalr	850(ra) # 80005072 <iupdate>
  iunlock(ip);
    80007d28:	fe843503          	ld	a0,-24(s0)
    80007d2c:	ffffd097          	auipc	ra,0xffffd
    80007d30:	6ca080e7          	jalr	1738(ra) # 800053f6 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007d34:	fd040713          	addi	a4,s0,-48
    80007d38:	f5040793          	addi	a5,s0,-176
    80007d3c:	85ba                	mv	a1,a4
    80007d3e:	853e                	mv	a0,a5
    80007d40:	ffffe097          	auipc	ra,0xffffe
    80007d44:	2d4080e7          	jalr	724(ra) # 80006014 <nameiparent>
    80007d48:	fea43023          	sd	a0,-32(s0)
    80007d4c:	fe043783          	ld	a5,-32(s0)
    80007d50:	cba5                	beqz	a5,80007dc0 <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007d52:	fe043503          	ld	a0,-32(s0)
    80007d56:	ffffd097          	auipc	ra,0xffffd
    80007d5a:	56c080e7          	jalr	1388(ra) # 800052c2 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007d5e:	fe043783          	ld	a5,-32(s0)
    80007d62:	4398                	lw	a4,0(a5)
    80007d64:	fe843783          	ld	a5,-24(s0)
    80007d68:	439c                	lw	a5,0(a5)
    80007d6a:	02f71263          	bne	a4,a5,80007d8e <sys_link+0x136>
    80007d6e:	fe843783          	ld	a5,-24(s0)
    80007d72:	43d8                	lw	a4,4(a5)
    80007d74:	fd040793          	addi	a5,s0,-48
    80007d78:	863a                	mv	a2,a4
    80007d7a:	85be                	mv	a1,a5
    80007d7c:	fe043503          	ld	a0,-32(s0)
    80007d80:	ffffe097          	auipc	ra,0xffffe
    80007d84:	f5a080e7          	jalr	-166(ra) # 80005cda <dirlink>
    80007d88:	87aa                	mv	a5,a0
    80007d8a:	0007d963          	bgez	a5,80007d9c <sys_link+0x144>
    iunlockput(dp);
    80007d8e:	fe043503          	ld	a0,-32(s0)
    80007d92:	ffffd097          	auipc	ra,0xffffd
    80007d96:	78e080e7          	jalr	1934(ra) # 80005520 <iunlockput>
    goto bad;
    80007d9a:	a025                	j	80007dc2 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007d9c:	fe043503          	ld	a0,-32(s0)
    80007da0:	ffffd097          	auipc	ra,0xffffd
    80007da4:	780080e7          	jalr	1920(ra) # 80005520 <iunlockput>
  iput(ip);
    80007da8:	fe843503          	ld	a0,-24(s0)
    80007dac:	ffffd097          	auipc	ra,0xffffd
    80007db0:	6a4080e7          	jalr	1700(ra) # 80005450 <iput>

  end_op();
    80007db4:	ffffe097          	auipc	ra,0xffffe
    80007db8:	65a080e7          	jalr	1626(ra) # 8000640e <end_op>

  return 0;
    80007dbc:	4781                	li	a5,0
    80007dbe:	a891                	j	80007e12 <sys_link+0x1ba>
    goto bad;
    80007dc0:	0001                	nop

bad:
  ilock(ip);
    80007dc2:	fe843503          	ld	a0,-24(s0)
    80007dc6:	ffffd097          	auipc	ra,0xffffd
    80007dca:	4fc080e7          	jalr	1276(ra) # 800052c2 <ilock>
  ip->nlink--;
    80007dce:	fe843783          	ld	a5,-24(s0)
    80007dd2:	04a79783          	lh	a5,74(a5)
    80007dd6:	17c2                	slli	a5,a5,0x30
    80007dd8:	93c1                	srli	a5,a5,0x30
    80007dda:	37fd                	addiw	a5,a5,-1
    80007ddc:	17c2                	slli	a5,a5,0x30
    80007dde:	93c1                	srli	a5,a5,0x30
    80007de0:	0107971b          	slliw	a4,a5,0x10
    80007de4:	4107571b          	sraiw	a4,a4,0x10
    80007de8:	fe843783          	ld	a5,-24(s0)
    80007dec:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007df0:	fe843503          	ld	a0,-24(s0)
    80007df4:	ffffd097          	auipc	ra,0xffffd
    80007df8:	27e080e7          	jalr	638(ra) # 80005072 <iupdate>
  iunlockput(ip);
    80007dfc:	fe843503          	ld	a0,-24(s0)
    80007e00:	ffffd097          	auipc	ra,0xffffd
    80007e04:	720080e7          	jalr	1824(ra) # 80005520 <iunlockput>
  end_op();
    80007e08:	ffffe097          	auipc	ra,0xffffe
    80007e0c:	606080e7          	jalr	1542(ra) # 8000640e <end_op>
  return -1;
    80007e10:	57fd                	li	a5,-1
}
    80007e12:	853e                	mv	a0,a5
    80007e14:	70b2                	ld	ra,296(sp)
    80007e16:	7412                	ld	s0,288(sp)
    80007e18:	6155                	addi	sp,sp,304
    80007e1a:	8082                	ret

0000000080007e1c <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007e1c:	7139                	addi	sp,sp,-64
    80007e1e:	fc06                	sd	ra,56(sp)
    80007e20:	f822                	sd	s0,48(sp)
    80007e22:	0080                	addi	s0,sp,64
    80007e24:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e28:	02000793          	li	a5,32
    80007e2c:	fef42623          	sw	a5,-20(s0)
    80007e30:	a0b1                	j	80007e7c <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007e32:	fd840793          	addi	a5,s0,-40
    80007e36:	fec42683          	lw	a3,-20(s0)
    80007e3a:	4741                	li	a4,16
    80007e3c:	863e                	mv	a2,a5
    80007e3e:	4581                	li	a1,0
    80007e40:	fc843503          	ld	a0,-56(s0)
    80007e44:	ffffe097          	auipc	ra,0xffffe
    80007e48:	a34080e7          	jalr	-1484(ra) # 80005878 <readi>
    80007e4c:	87aa                	mv	a5,a0
    80007e4e:	873e                	mv	a4,a5
    80007e50:	47c1                	li	a5,16
    80007e52:	00f70a63          	beq	a4,a5,80007e66 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007e56:	00004517          	auipc	a0,0x4
    80007e5a:	7ea50513          	addi	a0,a0,2026 # 8000c640 <etext+0x640>
    80007e5e:	ffff9097          	auipc	ra,0xffff9
    80007e62:	e2e080e7          	jalr	-466(ra) # 80000c8c <panic>
    if(de.inum != 0)
    80007e66:	fd845783          	lhu	a5,-40(s0)
    80007e6a:	c399                	beqz	a5,80007e70 <isdirempty+0x54>
      return 0;
    80007e6c:	4781                	li	a5,0
    80007e6e:	a839                	j	80007e8c <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e70:	fec42783          	lw	a5,-20(s0)
    80007e74:	27c1                	addiw	a5,a5,16
    80007e76:	2781                	sext.w	a5,a5
    80007e78:	fef42623          	sw	a5,-20(s0)
    80007e7c:	fc843783          	ld	a5,-56(s0)
    80007e80:	47f8                	lw	a4,76(a5)
    80007e82:	fec42783          	lw	a5,-20(s0)
    80007e86:	fae7e6e3          	bltu	a5,a4,80007e32 <isdirempty+0x16>
  }
  return 1;
    80007e8a:	4785                	li	a5,1
}
    80007e8c:	853e                	mv	a0,a5
    80007e8e:	70e2                	ld	ra,56(sp)
    80007e90:	7442                	ld	s0,48(sp)
    80007e92:	6121                	addi	sp,sp,64
    80007e94:	8082                	ret

0000000080007e96 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007e96:	7155                	addi	sp,sp,-208
    80007e98:	e586                	sd	ra,200(sp)
    80007e9a:	e1a2                	sd	s0,192(sp)
    80007e9c:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007e9e:	f4040793          	addi	a5,s0,-192
    80007ea2:	08000613          	li	a2,128
    80007ea6:	85be                	mv	a1,a5
    80007ea8:	4501                	li	a0,0
    80007eaa:	ffffc097          	auipc	ra,0xffffc
    80007eae:	4d8080e7          	jalr	1240(ra) # 80004382 <argstr>
    80007eb2:	87aa                	mv	a5,a0
    80007eb4:	0007d463          	bgez	a5,80007ebc <sys_unlink+0x26>
    return -1;
    80007eb8:	57fd                	li	a5,-1
    80007eba:	a2ed                	j	800080a4 <sys_unlink+0x20e>

  begin_op();
    80007ebc:	ffffe097          	auipc	ra,0xffffe
    80007ec0:	490080e7          	jalr	1168(ra) # 8000634c <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007ec4:	fc040713          	addi	a4,s0,-64
    80007ec8:	f4040793          	addi	a5,s0,-192
    80007ecc:	85ba                	mv	a1,a4
    80007ece:	853e                	mv	a0,a5
    80007ed0:	ffffe097          	auipc	ra,0xffffe
    80007ed4:	144080e7          	jalr	324(ra) # 80006014 <nameiparent>
    80007ed8:	fea43423          	sd	a0,-24(s0)
    80007edc:	fe843783          	ld	a5,-24(s0)
    80007ee0:	e799                	bnez	a5,80007eee <sys_unlink+0x58>
    end_op();
    80007ee2:	ffffe097          	auipc	ra,0xffffe
    80007ee6:	52c080e7          	jalr	1324(ra) # 8000640e <end_op>
    return -1;
    80007eea:	57fd                	li	a5,-1
    80007eec:	aa65                	j	800080a4 <sys_unlink+0x20e>
  }

  ilock(dp);
    80007eee:	fe843503          	ld	a0,-24(s0)
    80007ef2:	ffffd097          	auipc	ra,0xffffd
    80007ef6:	3d0080e7          	jalr	976(ra) # 800052c2 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007efa:	fc040793          	addi	a5,s0,-64
    80007efe:	00004597          	auipc	a1,0x4
    80007f02:	75a58593          	addi	a1,a1,1882 # 8000c658 <etext+0x658>
    80007f06:	853e                	mv	a0,a5
    80007f08:	ffffe097          	auipc	ra,0xffffe
    80007f0c:	cbc080e7          	jalr	-836(ra) # 80005bc4 <namecmp>
    80007f10:	87aa                	mv	a5,a0
    80007f12:	16078b63          	beqz	a5,80008088 <sys_unlink+0x1f2>
    80007f16:	fc040793          	addi	a5,s0,-64
    80007f1a:	00004597          	auipc	a1,0x4
    80007f1e:	74658593          	addi	a1,a1,1862 # 8000c660 <etext+0x660>
    80007f22:	853e                	mv	a0,a5
    80007f24:	ffffe097          	auipc	ra,0xffffe
    80007f28:	ca0080e7          	jalr	-864(ra) # 80005bc4 <namecmp>
    80007f2c:	87aa                	mv	a5,a0
    80007f2e:	14078d63          	beqz	a5,80008088 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007f32:	f3c40713          	addi	a4,s0,-196
    80007f36:	fc040793          	addi	a5,s0,-64
    80007f3a:	863a                	mv	a2,a4
    80007f3c:	85be                	mv	a1,a5
    80007f3e:	fe843503          	ld	a0,-24(s0)
    80007f42:	ffffe097          	auipc	ra,0xffffe
    80007f46:	cb0080e7          	jalr	-848(ra) # 80005bf2 <dirlookup>
    80007f4a:	fea43023          	sd	a0,-32(s0)
    80007f4e:	fe043783          	ld	a5,-32(s0)
    80007f52:	12078d63          	beqz	a5,8000808c <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007f56:	fe043503          	ld	a0,-32(s0)
    80007f5a:	ffffd097          	auipc	ra,0xffffd
    80007f5e:	368080e7          	jalr	872(ra) # 800052c2 <ilock>

  if(ip->nlink < 1)
    80007f62:	fe043783          	ld	a5,-32(s0)
    80007f66:	04a79783          	lh	a5,74(a5)
    80007f6a:	2781                	sext.w	a5,a5
    80007f6c:	00f04a63          	bgtz	a5,80007f80 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007f70:	00004517          	auipc	a0,0x4
    80007f74:	6f850513          	addi	a0,a0,1784 # 8000c668 <etext+0x668>
    80007f78:	ffff9097          	auipc	ra,0xffff9
    80007f7c:	d14080e7          	jalr	-748(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007f80:	fe043783          	ld	a5,-32(s0)
    80007f84:	04479783          	lh	a5,68(a5)
    80007f88:	0007871b          	sext.w	a4,a5
    80007f8c:	4785                	li	a5,1
    80007f8e:	02f71163          	bne	a4,a5,80007fb0 <sys_unlink+0x11a>
    80007f92:	fe043503          	ld	a0,-32(s0)
    80007f96:	00000097          	auipc	ra,0x0
    80007f9a:	e86080e7          	jalr	-378(ra) # 80007e1c <isdirempty>
    80007f9e:	87aa                	mv	a5,a0
    80007fa0:	eb81                	bnez	a5,80007fb0 <sys_unlink+0x11a>
    iunlockput(ip);
    80007fa2:	fe043503          	ld	a0,-32(s0)
    80007fa6:	ffffd097          	auipc	ra,0xffffd
    80007faa:	57a080e7          	jalr	1402(ra) # 80005520 <iunlockput>
    goto bad;
    80007fae:	a0c5                	j	8000808e <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007fb0:	fd040793          	addi	a5,s0,-48
    80007fb4:	4641                	li	a2,16
    80007fb6:	4581                	li	a1,0
    80007fb8:	853e                	mv	a0,a5
    80007fba:	ffff9097          	auipc	ra,0xffff9
    80007fbe:	556080e7          	jalr	1366(ra) # 80001510 <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007fc2:	fd040793          	addi	a5,s0,-48
    80007fc6:	f3c42683          	lw	a3,-196(s0)
    80007fca:	4741                	li	a4,16
    80007fcc:	863e                	mv	a2,a5
    80007fce:	4581                	li	a1,0
    80007fd0:	fe843503          	ld	a0,-24(s0)
    80007fd4:	ffffe097          	auipc	ra,0xffffe
    80007fd8:	a3c080e7          	jalr	-1476(ra) # 80005a10 <writei>
    80007fdc:	87aa                	mv	a5,a0
    80007fde:	873e                	mv	a4,a5
    80007fe0:	47c1                	li	a5,16
    80007fe2:	00f70a63          	beq	a4,a5,80007ff6 <sys_unlink+0x160>
    panic("unlink: writei");
    80007fe6:	00004517          	auipc	a0,0x4
    80007fea:	69a50513          	addi	a0,a0,1690 # 8000c680 <etext+0x680>
    80007fee:	ffff9097          	auipc	ra,0xffff9
    80007ff2:	c9e080e7          	jalr	-866(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    80007ff6:	fe043783          	ld	a5,-32(s0)
    80007ffa:	04479783          	lh	a5,68(a5)
    80007ffe:	0007871b          	sext.w	a4,a5
    80008002:	4785                	li	a5,1
    80008004:	02f71963          	bne	a4,a5,80008036 <sys_unlink+0x1a0>
    dp->nlink--;
    80008008:	fe843783          	ld	a5,-24(s0)
    8000800c:	04a79783          	lh	a5,74(a5)
    80008010:	17c2                	slli	a5,a5,0x30
    80008012:	93c1                	srli	a5,a5,0x30
    80008014:	37fd                	addiw	a5,a5,-1
    80008016:	17c2                	slli	a5,a5,0x30
    80008018:	93c1                	srli	a5,a5,0x30
    8000801a:	0107971b          	slliw	a4,a5,0x10
    8000801e:	4107571b          	sraiw	a4,a4,0x10
    80008022:	fe843783          	ld	a5,-24(s0)
    80008026:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    8000802a:	fe843503          	ld	a0,-24(s0)
    8000802e:	ffffd097          	auipc	ra,0xffffd
    80008032:	044080e7          	jalr	68(ra) # 80005072 <iupdate>
  }
  iunlockput(dp);
    80008036:	fe843503          	ld	a0,-24(s0)
    8000803a:	ffffd097          	auipc	ra,0xffffd
    8000803e:	4e6080e7          	jalr	1254(ra) # 80005520 <iunlockput>

  ip->nlink--;
    80008042:	fe043783          	ld	a5,-32(s0)
    80008046:	04a79783          	lh	a5,74(a5)
    8000804a:	17c2                	slli	a5,a5,0x30
    8000804c:	93c1                	srli	a5,a5,0x30
    8000804e:	37fd                	addiw	a5,a5,-1
    80008050:	17c2                	slli	a5,a5,0x30
    80008052:	93c1                	srli	a5,a5,0x30
    80008054:	0107971b          	slliw	a4,a5,0x10
    80008058:	4107571b          	sraiw	a4,a4,0x10
    8000805c:	fe043783          	ld	a5,-32(s0)
    80008060:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008064:	fe043503          	ld	a0,-32(s0)
    80008068:	ffffd097          	auipc	ra,0xffffd
    8000806c:	00a080e7          	jalr	10(ra) # 80005072 <iupdate>
  iunlockput(ip);
    80008070:	fe043503          	ld	a0,-32(s0)
    80008074:	ffffd097          	auipc	ra,0xffffd
    80008078:	4ac080e7          	jalr	1196(ra) # 80005520 <iunlockput>

  end_op();
    8000807c:	ffffe097          	auipc	ra,0xffffe
    80008080:	392080e7          	jalr	914(ra) # 8000640e <end_op>

  return 0;
    80008084:	4781                	li	a5,0
    80008086:	a839                	j	800080a4 <sys_unlink+0x20e>
    goto bad;
    80008088:	0001                	nop
    8000808a:	a011                	j	8000808e <sys_unlink+0x1f8>
    goto bad;
    8000808c:	0001                	nop

bad:
  iunlockput(dp);
    8000808e:	fe843503          	ld	a0,-24(s0)
    80008092:	ffffd097          	auipc	ra,0xffffd
    80008096:	48e080e7          	jalr	1166(ra) # 80005520 <iunlockput>
  end_op();
    8000809a:	ffffe097          	auipc	ra,0xffffe
    8000809e:	374080e7          	jalr	884(ra) # 8000640e <end_op>
  return -1;
    800080a2:	57fd                	li	a5,-1
}
    800080a4:	853e                	mv	a0,a5
    800080a6:	60ae                	ld	ra,200(sp)
    800080a8:	640e                	ld	s0,192(sp)
    800080aa:	6169                	addi	sp,sp,208
    800080ac:	8082                	ret

00000000800080ae <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    800080ae:	7139                	addi	sp,sp,-64
    800080b0:	fc06                	sd	ra,56(sp)
    800080b2:	f822                	sd	s0,48(sp)
    800080b4:	0080                	addi	s0,sp,64
    800080b6:	fca43423          	sd	a0,-56(s0)
    800080ba:	87ae                	mv	a5,a1
    800080bc:	8736                	mv	a4,a3
    800080be:	fcf41323          	sh	a5,-58(s0)
    800080c2:	87b2                	mv	a5,a2
    800080c4:	fcf41223          	sh	a5,-60(s0)
    800080c8:	87ba                	mv	a5,a4
    800080ca:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    800080ce:	fd040793          	addi	a5,s0,-48
    800080d2:	85be                	mv	a1,a5
    800080d4:	fc843503          	ld	a0,-56(s0)
    800080d8:	ffffe097          	auipc	ra,0xffffe
    800080dc:	f3c080e7          	jalr	-196(ra) # 80006014 <nameiparent>
    800080e0:	fea43423          	sd	a0,-24(s0)
    800080e4:	fe843783          	ld	a5,-24(s0)
    800080e8:	e399                	bnez	a5,800080ee <create+0x40>
    return 0;
    800080ea:	4781                	li	a5,0
    800080ec:	a2ed                	j	800082d6 <create+0x228>

  ilock(dp);
    800080ee:	fe843503          	ld	a0,-24(s0)
    800080f2:	ffffd097          	auipc	ra,0xffffd
    800080f6:	1d0080e7          	jalr	464(ra) # 800052c2 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    800080fa:	fd040793          	addi	a5,s0,-48
    800080fe:	4601                	li	a2,0
    80008100:	85be                	mv	a1,a5
    80008102:	fe843503          	ld	a0,-24(s0)
    80008106:	ffffe097          	auipc	ra,0xffffe
    8000810a:	aec080e7          	jalr	-1300(ra) # 80005bf2 <dirlookup>
    8000810e:	fea43023          	sd	a0,-32(s0)
    80008112:	fe043783          	ld	a5,-32(s0)
    80008116:	c3ad                	beqz	a5,80008178 <create+0xca>
    iunlockput(dp);
    80008118:	fe843503          	ld	a0,-24(s0)
    8000811c:	ffffd097          	auipc	ra,0xffffd
    80008120:	404080e7          	jalr	1028(ra) # 80005520 <iunlockput>
    ilock(ip);
    80008124:	fe043503          	ld	a0,-32(s0)
    80008128:	ffffd097          	auipc	ra,0xffffd
    8000812c:	19a080e7          	jalr	410(ra) # 800052c2 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80008130:	fc641783          	lh	a5,-58(s0)
    80008134:	0007871b          	sext.w	a4,a5
    80008138:	4789                	li	a5,2
    8000813a:	02f71763          	bne	a4,a5,80008168 <create+0xba>
    8000813e:	fe043783          	ld	a5,-32(s0)
    80008142:	04479783          	lh	a5,68(a5)
    80008146:	0007871b          	sext.w	a4,a5
    8000814a:	4789                	li	a5,2
    8000814c:	00f70b63          	beq	a4,a5,80008162 <create+0xb4>
    80008150:	fe043783          	ld	a5,-32(s0)
    80008154:	04479783          	lh	a5,68(a5)
    80008158:	0007871b          	sext.w	a4,a5
    8000815c:	478d                	li	a5,3
    8000815e:	00f71563          	bne	a4,a5,80008168 <create+0xba>
      return ip;
    80008162:	fe043783          	ld	a5,-32(s0)
    80008166:	aa85                	j	800082d6 <create+0x228>
    iunlockput(ip);
    80008168:	fe043503          	ld	a0,-32(s0)
    8000816c:	ffffd097          	auipc	ra,0xffffd
    80008170:	3b4080e7          	jalr	948(ra) # 80005520 <iunlockput>
    return 0;
    80008174:	4781                	li	a5,0
    80008176:	a285                	j	800082d6 <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    80008178:	fe843783          	ld	a5,-24(s0)
    8000817c:	439c                	lw	a5,0(a5)
    8000817e:	fc641703          	lh	a4,-58(s0)
    80008182:	85ba                	mv	a1,a4
    80008184:	853e                	mv	a0,a5
    80008186:	ffffd097          	auipc	ra,0xffffd
    8000818a:	dee080e7          	jalr	-530(ra) # 80004f74 <ialloc>
    8000818e:	fea43023          	sd	a0,-32(s0)
    80008192:	fe043783          	ld	a5,-32(s0)
    80008196:	eb89                	bnez	a5,800081a8 <create+0xfa>
    iunlockput(dp);
    80008198:	fe843503          	ld	a0,-24(s0)
    8000819c:	ffffd097          	auipc	ra,0xffffd
    800081a0:	384080e7          	jalr	900(ra) # 80005520 <iunlockput>
    return 0;
    800081a4:	4781                	li	a5,0
    800081a6:	aa05                	j	800082d6 <create+0x228>
  }

  ilock(ip);
    800081a8:	fe043503          	ld	a0,-32(s0)
    800081ac:	ffffd097          	auipc	ra,0xffffd
    800081b0:	116080e7          	jalr	278(ra) # 800052c2 <ilock>
  ip->major = major;
    800081b4:	fe043783          	ld	a5,-32(s0)
    800081b8:	fc445703          	lhu	a4,-60(s0)
    800081bc:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    800081c0:	fe043783          	ld	a5,-32(s0)
    800081c4:	fc245703          	lhu	a4,-62(s0)
    800081c8:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    800081cc:	fe043783          	ld	a5,-32(s0)
    800081d0:	4705                	li	a4,1
    800081d2:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800081d6:	fe043503          	ld	a0,-32(s0)
    800081da:	ffffd097          	auipc	ra,0xffffd
    800081de:	e98080e7          	jalr	-360(ra) # 80005072 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    800081e2:	fc641783          	lh	a5,-58(s0)
    800081e6:	0007871b          	sext.w	a4,a5
    800081ea:	4785                	li	a5,1
    800081ec:	04f71463          	bne	a4,a5,80008234 <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    800081f0:	fe043783          	ld	a5,-32(s0)
    800081f4:	43dc                	lw	a5,4(a5)
    800081f6:	863e                	mv	a2,a5
    800081f8:	00004597          	auipc	a1,0x4
    800081fc:	46058593          	addi	a1,a1,1120 # 8000c658 <etext+0x658>
    80008200:	fe043503          	ld	a0,-32(s0)
    80008204:	ffffe097          	auipc	ra,0xffffe
    80008208:	ad6080e7          	jalr	-1322(ra) # 80005cda <dirlink>
    8000820c:	87aa                	mv	a5,a0
    8000820e:	0807ca63          	bltz	a5,800082a2 <create+0x1f4>
    80008212:	fe843783          	ld	a5,-24(s0)
    80008216:	43dc                	lw	a5,4(a5)
    80008218:	863e                	mv	a2,a5
    8000821a:	00004597          	auipc	a1,0x4
    8000821e:	44658593          	addi	a1,a1,1094 # 8000c660 <etext+0x660>
    80008222:	fe043503          	ld	a0,-32(s0)
    80008226:	ffffe097          	auipc	ra,0xffffe
    8000822a:	ab4080e7          	jalr	-1356(ra) # 80005cda <dirlink>
    8000822e:	87aa                	mv	a5,a0
    80008230:	0607c963          	bltz	a5,800082a2 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80008234:	fe043783          	ld	a5,-32(s0)
    80008238:	43d8                	lw	a4,4(a5)
    8000823a:	fd040793          	addi	a5,s0,-48
    8000823e:	863a                	mv	a2,a4
    80008240:	85be                	mv	a1,a5
    80008242:	fe843503          	ld	a0,-24(s0)
    80008246:	ffffe097          	auipc	ra,0xffffe
    8000824a:	a94080e7          	jalr	-1388(ra) # 80005cda <dirlink>
    8000824e:	87aa                	mv	a5,a0
    80008250:	0407cb63          	bltz	a5,800082a6 <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    80008254:	fc641783          	lh	a5,-58(s0)
    80008258:	0007871b          	sext.w	a4,a5
    8000825c:	4785                	li	a5,1
    8000825e:	02f71963          	bne	a4,a5,80008290 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    80008262:	fe843783          	ld	a5,-24(s0)
    80008266:	04a79783          	lh	a5,74(a5)
    8000826a:	17c2                	slli	a5,a5,0x30
    8000826c:	93c1                	srli	a5,a5,0x30
    8000826e:	2785                	addiw	a5,a5,1
    80008270:	17c2                	slli	a5,a5,0x30
    80008272:	93c1                	srli	a5,a5,0x30
    80008274:	0107971b          	slliw	a4,a5,0x10
    80008278:	4107571b          	sraiw	a4,a4,0x10
    8000827c:	fe843783          	ld	a5,-24(s0)
    80008280:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008284:	fe843503          	ld	a0,-24(s0)
    80008288:	ffffd097          	auipc	ra,0xffffd
    8000828c:	dea080e7          	jalr	-534(ra) # 80005072 <iupdate>
  }

  iunlockput(dp);
    80008290:	fe843503          	ld	a0,-24(s0)
    80008294:	ffffd097          	auipc	ra,0xffffd
    80008298:	28c080e7          	jalr	652(ra) # 80005520 <iunlockput>

  return ip;
    8000829c:	fe043783          	ld	a5,-32(s0)
    800082a0:	a81d                	j	800082d6 <create+0x228>
      goto fail;
    800082a2:	0001                	nop
    800082a4:	a011                	j	800082a8 <create+0x1fa>
    goto fail;
    800082a6:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    800082a8:	fe043783          	ld	a5,-32(s0)
    800082ac:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    800082b0:	fe043503          	ld	a0,-32(s0)
    800082b4:	ffffd097          	auipc	ra,0xffffd
    800082b8:	dbe080e7          	jalr	-578(ra) # 80005072 <iupdate>
  iunlockput(ip);
    800082bc:	fe043503          	ld	a0,-32(s0)
    800082c0:	ffffd097          	auipc	ra,0xffffd
    800082c4:	260080e7          	jalr	608(ra) # 80005520 <iunlockput>
  iunlockput(dp);
    800082c8:	fe843503          	ld	a0,-24(s0)
    800082cc:	ffffd097          	auipc	ra,0xffffd
    800082d0:	254080e7          	jalr	596(ra) # 80005520 <iunlockput>
  return 0;
    800082d4:	4781                	li	a5,0
}
    800082d6:	853e                	mv	a0,a5
    800082d8:	70e2                	ld	ra,56(sp)
    800082da:	7442                	ld	s0,48(sp)
    800082dc:	6121                	addi	sp,sp,64
    800082de:	8082                	ret

00000000800082e0 <sys_open>:

uint64
sys_open(void)
{
    800082e0:	7131                	addi	sp,sp,-192
    800082e2:	fd06                	sd	ra,184(sp)
    800082e4:	f922                	sd	s0,176(sp)
    800082e6:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    800082e8:	f4c40793          	addi	a5,s0,-180
    800082ec:	85be                	mv	a1,a5
    800082ee:	4505                	li	a0,1
    800082f0:	ffffc097          	auipc	ra,0xffffc
    800082f4:	02a080e7          	jalr	42(ra) # 8000431a <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    800082f8:	f5040793          	addi	a5,s0,-176
    800082fc:	08000613          	li	a2,128
    80008300:	85be                	mv	a1,a5
    80008302:	4501                	li	a0,0
    80008304:	ffffc097          	auipc	ra,0xffffc
    80008308:	07e080e7          	jalr	126(ra) # 80004382 <argstr>
    8000830c:	87aa                	mv	a5,a0
    8000830e:	fef42223          	sw	a5,-28(s0)
    80008312:	fe442783          	lw	a5,-28(s0)
    80008316:	2781                	sext.w	a5,a5
    80008318:	0007d463          	bgez	a5,80008320 <sys_open+0x40>
    return -1;
    8000831c:	57fd                	li	a5,-1
    8000831e:	a429                	j	80008528 <sys_open+0x248>

  begin_op();
    80008320:	ffffe097          	auipc	ra,0xffffe
    80008324:	02c080e7          	jalr	44(ra) # 8000634c <begin_op>

  if(omode & O_CREATE){
    80008328:	f4c42783          	lw	a5,-180(s0)
    8000832c:	2007f793          	andi	a5,a5,512
    80008330:	2781                	sext.w	a5,a5
    80008332:	c795                	beqz	a5,8000835e <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    80008334:	f5040793          	addi	a5,s0,-176
    80008338:	4681                	li	a3,0
    8000833a:	4601                	li	a2,0
    8000833c:	4589                	li	a1,2
    8000833e:	853e                	mv	a0,a5
    80008340:	00000097          	auipc	ra,0x0
    80008344:	d6e080e7          	jalr	-658(ra) # 800080ae <create>
    80008348:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    8000834c:	fe843783          	ld	a5,-24(s0)
    80008350:	e7bd                	bnez	a5,800083be <sys_open+0xde>
      end_op();
    80008352:	ffffe097          	auipc	ra,0xffffe
    80008356:	0bc080e7          	jalr	188(ra) # 8000640e <end_op>
      return -1;
    8000835a:	57fd                	li	a5,-1
    8000835c:	a2f1                	j	80008528 <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    8000835e:	f5040793          	addi	a5,s0,-176
    80008362:	853e                	mv	a0,a5
    80008364:	ffffe097          	auipc	ra,0xffffe
    80008368:	c84080e7          	jalr	-892(ra) # 80005fe8 <namei>
    8000836c:	fea43423          	sd	a0,-24(s0)
    80008370:	fe843783          	ld	a5,-24(s0)
    80008374:	e799                	bnez	a5,80008382 <sys_open+0xa2>
      end_op();
    80008376:	ffffe097          	auipc	ra,0xffffe
    8000837a:	098080e7          	jalr	152(ra) # 8000640e <end_op>
      return -1;
    8000837e:	57fd                	li	a5,-1
    80008380:	a265                	j	80008528 <sys_open+0x248>
    }
    ilock(ip);
    80008382:	fe843503          	ld	a0,-24(s0)
    80008386:	ffffd097          	auipc	ra,0xffffd
    8000838a:	f3c080e7          	jalr	-196(ra) # 800052c2 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    8000838e:	fe843783          	ld	a5,-24(s0)
    80008392:	04479783          	lh	a5,68(a5)
    80008396:	0007871b          	sext.w	a4,a5
    8000839a:	4785                	li	a5,1
    8000839c:	02f71163          	bne	a4,a5,800083be <sys_open+0xde>
    800083a0:	f4c42783          	lw	a5,-180(s0)
    800083a4:	cf89                	beqz	a5,800083be <sys_open+0xde>
      iunlockput(ip);
    800083a6:	fe843503          	ld	a0,-24(s0)
    800083aa:	ffffd097          	auipc	ra,0xffffd
    800083ae:	176080e7          	jalr	374(ra) # 80005520 <iunlockput>
      end_op();
    800083b2:	ffffe097          	auipc	ra,0xffffe
    800083b6:	05c080e7          	jalr	92(ra) # 8000640e <end_op>
      return -1;
    800083ba:	57fd                	li	a5,-1
    800083bc:	a2b5                	j	80008528 <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800083be:	fe843783          	ld	a5,-24(s0)
    800083c2:	04479783          	lh	a5,68(a5)
    800083c6:	0007871b          	sext.w	a4,a5
    800083ca:	478d                	li	a5,3
    800083cc:	02f71e63          	bne	a4,a5,80008408 <sys_open+0x128>
    800083d0:	fe843783          	ld	a5,-24(s0)
    800083d4:	04679783          	lh	a5,70(a5)
    800083d8:	2781                	sext.w	a5,a5
    800083da:	0007cb63          	bltz	a5,800083f0 <sys_open+0x110>
    800083de:	fe843783          	ld	a5,-24(s0)
    800083e2:	04679783          	lh	a5,70(a5)
    800083e6:	0007871b          	sext.w	a4,a5
    800083ea:	47a5                	li	a5,9
    800083ec:	00e7de63          	bge	a5,a4,80008408 <sys_open+0x128>
    iunlockput(ip);
    800083f0:	fe843503          	ld	a0,-24(s0)
    800083f4:	ffffd097          	auipc	ra,0xffffd
    800083f8:	12c080e7          	jalr	300(ra) # 80005520 <iunlockput>
    end_op();
    800083fc:	ffffe097          	auipc	ra,0xffffe
    80008400:	012080e7          	jalr	18(ra) # 8000640e <end_op>
    return -1;
    80008404:	57fd                	li	a5,-1
    80008406:	a20d                	j	80008528 <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008408:	ffffe097          	auipc	ra,0xffffe
    8000840c:	4f4080e7          	jalr	1268(ra) # 800068fc <filealloc>
    80008410:	fca43c23          	sd	a0,-40(s0)
    80008414:	fd843783          	ld	a5,-40(s0)
    80008418:	cf99                	beqz	a5,80008436 <sys_open+0x156>
    8000841a:	fd843503          	ld	a0,-40(s0)
    8000841e:	fffff097          	auipc	ra,0xfffff
    80008422:	5e8080e7          	jalr	1512(ra) # 80007a06 <fdalloc>
    80008426:	87aa                	mv	a5,a0
    80008428:	fcf42a23          	sw	a5,-44(s0)
    8000842c:	fd442783          	lw	a5,-44(s0)
    80008430:	2781                	sext.w	a5,a5
    80008432:	0207d763          	bgez	a5,80008460 <sys_open+0x180>
    if(f)
    80008436:	fd843783          	ld	a5,-40(s0)
    8000843a:	c799                	beqz	a5,80008448 <sys_open+0x168>
      fileclose(f);
    8000843c:	fd843503          	ld	a0,-40(s0)
    80008440:	ffffe097          	auipc	ra,0xffffe
    80008444:	5a6080e7          	jalr	1446(ra) # 800069e6 <fileclose>
    iunlockput(ip);
    80008448:	fe843503          	ld	a0,-24(s0)
    8000844c:	ffffd097          	auipc	ra,0xffffd
    80008450:	0d4080e7          	jalr	212(ra) # 80005520 <iunlockput>
    end_op();
    80008454:	ffffe097          	auipc	ra,0xffffe
    80008458:	fba080e7          	jalr	-70(ra) # 8000640e <end_op>
    return -1;
    8000845c:	57fd                	li	a5,-1
    8000845e:	a0e9                	j	80008528 <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    80008460:	fe843783          	ld	a5,-24(s0)
    80008464:	04479783          	lh	a5,68(a5)
    80008468:	0007871b          	sext.w	a4,a5
    8000846c:	478d                	li	a5,3
    8000846e:	00f71f63          	bne	a4,a5,8000848c <sys_open+0x1ac>
    f->type = FD_DEVICE;
    80008472:	fd843783          	ld	a5,-40(s0)
    80008476:	470d                	li	a4,3
    80008478:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    8000847a:	fe843783          	ld	a5,-24(s0)
    8000847e:	04679703          	lh	a4,70(a5)
    80008482:	fd843783          	ld	a5,-40(s0)
    80008486:	02e79223          	sh	a4,36(a5)
    8000848a:	a809                	j	8000849c <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    8000848c:	fd843783          	ld	a5,-40(s0)
    80008490:	4709                	li	a4,2
    80008492:	c398                	sw	a4,0(a5)
    f->off = 0;
    80008494:	fd843783          	ld	a5,-40(s0)
    80008498:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    8000849c:	fd843783          	ld	a5,-40(s0)
    800084a0:	fe843703          	ld	a4,-24(s0)
    800084a4:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800084a6:	f4c42783          	lw	a5,-180(s0)
    800084aa:	8b85                	andi	a5,a5,1
    800084ac:	2781                	sext.w	a5,a5
    800084ae:	0017b793          	seqz	a5,a5
    800084b2:	0ff7f793          	andi	a5,a5,255
    800084b6:	873e                	mv	a4,a5
    800084b8:	fd843783          	ld	a5,-40(s0)
    800084bc:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    800084c0:	f4c42783          	lw	a5,-180(s0)
    800084c4:	8b85                	andi	a5,a5,1
    800084c6:	2781                	sext.w	a5,a5
    800084c8:	e791                	bnez	a5,800084d4 <sys_open+0x1f4>
    800084ca:	f4c42783          	lw	a5,-180(s0)
    800084ce:	8b89                	andi	a5,a5,2
    800084d0:	2781                	sext.w	a5,a5
    800084d2:	c399                	beqz	a5,800084d8 <sys_open+0x1f8>
    800084d4:	4785                	li	a5,1
    800084d6:	a011                	j	800084da <sys_open+0x1fa>
    800084d8:	4781                	li	a5,0
    800084da:	0ff7f713          	andi	a4,a5,255
    800084de:	fd843783          	ld	a5,-40(s0)
    800084e2:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    800084e6:	f4c42783          	lw	a5,-180(s0)
    800084ea:	4007f793          	andi	a5,a5,1024
    800084ee:	2781                	sext.w	a5,a5
    800084f0:	c385                	beqz	a5,80008510 <sys_open+0x230>
    800084f2:	fe843783          	ld	a5,-24(s0)
    800084f6:	04479783          	lh	a5,68(a5)
    800084fa:	0007871b          	sext.w	a4,a5
    800084fe:	4789                	li	a5,2
    80008500:	00f71863          	bne	a4,a5,80008510 <sys_open+0x230>
    itrunc(ip);
    80008504:	fe843503          	ld	a0,-24(s0)
    80008508:	ffffd097          	auipc	ra,0xffffd
    8000850c:	1c2080e7          	jalr	450(ra) # 800056ca <itrunc>
  }

  iunlock(ip);
    80008510:	fe843503          	ld	a0,-24(s0)
    80008514:	ffffd097          	auipc	ra,0xffffd
    80008518:	ee2080e7          	jalr	-286(ra) # 800053f6 <iunlock>
  end_op();
    8000851c:	ffffe097          	auipc	ra,0xffffe
    80008520:	ef2080e7          	jalr	-270(ra) # 8000640e <end_op>

  return fd;
    80008524:	fd442783          	lw	a5,-44(s0)
}
    80008528:	853e                	mv	a0,a5
    8000852a:	70ea                	ld	ra,184(sp)
    8000852c:	744a                	ld	s0,176(sp)
    8000852e:	6129                	addi	sp,sp,192
    80008530:	8082                	ret

0000000080008532 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008532:	7135                	addi	sp,sp,-160
    80008534:	ed06                	sd	ra,152(sp)
    80008536:	e922                	sd	s0,144(sp)
    80008538:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    8000853a:	ffffe097          	auipc	ra,0xffffe
    8000853e:	e12080e7          	jalr	-494(ra) # 8000634c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80008542:	f6840793          	addi	a5,s0,-152
    80008546:	08000613          	li	a2,128
    8000854a:	85be                	mv	a1,a5
    8000854c:	4501                	li	a0,0
    8000854e:	ffffc097          	auipc	ra,0xffffc
    80008552:	e34080e7          	jalr	-460(ra) # 80004382 <argstr>
    80008556:	87aa                	mv	a5,a0
    80008558:	0207c163          	bltz	a5,8000857a <sys_mkdir+0x48>
    8000855c:	f6840793          	addi	a5,s0,-152
    80008560:	4681                	li	a3,0
    80008562:	4601                	li	a2,0
    80008564:	4585                	li	a1,1
    80008566:	853e                	mv	a0,a5
    80008568:	00000097          	auipc	ra,0x0
    8000856c:	b46080e7          	jalr	-1210(ra) # 800080ae <create>
    80008570:	fea43423          	sd	a0,-24(s0)
    80008574:	fe843783          	ld	a5,-24(s0)
    80008578:	e799                	bnez	a5,80008586 <sys_mkdir+0x54>
    end_op();
    8000857a:	ffffe097          	auipc	ra,0xffffe
    8000857e:	e94080e7          	jalr	-364(ra) # 8000640e <end_op>
    return -1;
    80008582:	57fd                	li	a5,-1
    80008584:	a821                	j	8000859c <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    80008586:	fe843503          	ld	a0,-24(s0)
    8000858a:	ffffd097          	auipc	ra,0xffffd
    8000858e:	f96080e7          	jalr	-106(ra) # 80005520 <iunlockput>
  end_op();
    80008592:	ffffe097          	auipc	ra,0xffffe
    80008596:	e7c080e7          	jalr	-388(ra) # 8000640e <end_op>
  return 0;
    8000859a:	4781                	li	a5,0
}
    8000859c:	853e                	mv	a0,a5
    8000859e:	60ea                	ld	ra,152(sp)
    800085a0:	644a                	ld	s0,144(sp)
    800085a2:	610d                	addi	sp,sp,160
    800085a4:	8082                	ret

00000000800085a6 <sys_mknod>:

uint64
sys_mknod(void)
{
    800085a6:	7135                	addi	sp,sp,-160
    800085a8:	ed06                	sd	ra,152(sp)
    800085aa:	e922                	sd	s0,144(sp)
    800085ac:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    800085ae:	ffffe097          	auipc	ra,0xffffe
    800085b2:	d9e080e7          	jalr	-610(ra) # 8000634c <begin_op>
  argint(1, &major);
    800085b6:	f6440793          	addi	a5,s0,-156
    800085ba:	85be                	mv	a1,a5
    800085bc:	4505                	li	a0,1
    800085be:	ffffc097          	auipc	ra,0xffffc
    800085c2:	d5c080e7          	jalr	-676(ra) # 8000431a <argint>
  argint(2, &minor);
    800085c6:	f6040793          	addi	a5,s0,-160
    800085ca:	85be                	mv	a1,a5
    800085cc:	4509                	li	a0,2
    800085ce:	ffffc097          	auipc	ra,0xffffc
    800085d2:	d4c080e7          	jalr	-692(ra) # 8000431a <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    800085d6:	f6840793          	addi	a5,s0,-152
    800085da:	08000613          	li	a2,128
    800085de:	85be                	mv	a1,a5
    800085e0:	4501                	li	a0,0
    800085e2:	ffffc097          	auipc	ra,0xffffc
    800085e6:	da0080e7          	jalr	-608(ra) # 80004382 <argstr>
    800085ea:	87aa                	mv	a5,a0
    800085ec:	0207cc63          	bltz	a5,80008624 <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    800085f0:	f6442783          	lw	a5,-156(s0)
    800085f4:	0107971b          	slliw	a4,a5,0x10
    800085f8:	4107571b          	sraiw	a4,a4,0x10
    800085fc:	f6042783          	lw	a5,-160(s0)
    80008600:	0107969b          	slliw	a3,a5,0x10
    80008604:	4106d69b          	sraiw	a3,a3,0x10
    80008608:	f6840793          	addi	a5,s0,-152
    8000860c:	863a                	mv	a2,a4
    8000860e:	458d                	li	a1,3
    80008610:	853e                	mv	a0,a5
    80008612:	00000097          	auipc	ra,0x0
    80008616:	a9c080e7          	jalr	-1380(ra) # 800080ae <create>
    8000861a:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    8000861e:	fe843783          	ld	a5,-24(s0)
    80008622:	e799                	bnez	a5,80008630 <sys_mknod+0x8a>
    end_op();
    80008624:	ffffe097          	auipc	ra,0xffffe
    80008628:	dea080e7          	jalr	-534(ra) # 8000640e <end_op>
    return -1;
    8000862c:	57fd                	li	a5,-1
    8000862e:	a821                	j	80008646 <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008630:	fe843503          	ld	a0,-24(s0)
    80008634:	ffffd097          	auipc	ra,0xffffd
    80008638:	eec080e7          	jalr	-276(ra) # 80005520 <iunlockput>
  end_op();
    8000863c:	ffffe097          	auipc	ra,0xffffe
    80008640:	dd2080e7          	jalr	-558(ra) # 8000640e <end_op>
  return 0;
    80008644:	4781                	li	a5,0
}
    80008646:	853e                	mv	a0,a5
    80008648:	60ea                	ld	ra,152(sp)
    8000864a:	644a                	ld	s0,144(sp)
    8000864c:	610d                	addi	sp,sp,160
    8000864e:	8082                	ret

0000000080008650 <sys_chdir>:

uint64
sys_chdir(void)
{
    80008650:	7135                	addi	sp,sp,-160
    80008652:	ed06                	sd	ra,152(sp)
    80008654:	e922                	sd	s0,144(sp)
    80008656:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008658:	ffffa097          	auipc	ra,0xffffa
    8000865c:	3b8080e7          	jalr	952(ra) # 80002a10 <myproc>
    80008660:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    80008664:	ffffe097          	auipc	ra,0xffffe
    80008668:	ce8080e7          	jalr	-792(ra) # 8000634c <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    8000866c:	f6040793          	addi	a5,s0,-160
    80008670:	08000613          	li	a2,128
    80008674:	85be                	mv	a1,a5
    80008676:	4501                	li	a0,0
    80008678:	ffffc097          	auipc	ra,0xffffc
    8000867c:	d0a080e7          	jalr	-758(ra) # 80004382 <argstr>
    80008680:	87aa                	mv	a5,a0
    80008682:	0007ce63          	bltz	a5,8000869e <sys_chdir+0x4e>
    80008686:	f6040793          	addi	a5,s0,-160
    8000868a:	853e                	mv	a0,a5
    8000868c:	ffffe097          	auipc	ra,0xffffe
    80008690:	95c080e7          	jalr	-1700(ra) # 80005fe8 <namei>
    80008694:	fea43023          	sd	a0,-32(s0)
    80008698:	fe043783          	ld	a5,-32(s0)
    8000869c:	e799                	bnez	a5,800086aa <sys_chdir+0x5a>
    end_op();
    8000869e:	ffffe097          	auipc	ra,0xffffe
    800086a2:	d70080e7          	jalr	-656(ra) # 8000640e <end_op>
    return -1;
    800086a6:	57fd                	li	a5,-1
    800086a8:	a0b5                	j	80008714 <sys_chdir+0xc4>
  }
  ilock(ip);
    800086aa:	fe043503          	ld	a0,-32(s0)
    800086ae:	ffffd097          	auipc	ra,0xffffd
    800086b2:	c14080e7          	jalr	-1004(ra) # 800052c2 <ilock>
  if(ip->type != T_DIR){
    800086b6:	fe043783          	ld	a5,-32(s0)
    800086ba:	04479783          	lh	a5,68(a5)
    800086be:	0007871b          	sext.w	a4,a5
    800086c2:	4785                	li	a5,1
    800086c4:	00f70e63          	beq	a4,a5,800086e0 <sys_chdir+0x90>
    iunlockput(ip);
    800086c8:	fe043503          	ld	a0,-32(s0)
    800086cc:	ffffd097          	auipc	ra,0xffffd
    800086d0:	e54080e7          	jalr	-428(ra) # 80005520 <iunlockput>
    end_op();
    800086d4:	ffffe097          	auipc	ra,0xffffe
    800086d8:	d3a080e7          	jalr	-710(ra) # 8000640e <end_op>
    return -1;
    800086dc:	57fd                	li	a5,-1
    800086de:	a81d                	j	80008714 <sys_chdir+0xc4>
  }
  iunlock(ip);
    800086e0:	fe043503          	ld	a0,-32(s0)
    800086e4:	ffffd097          	auipc	ra,0xffffd
    800086e8:	d12080e7          	jalr	-750(ra) # 800053f6 <iunlock>
  iput(p->cwd);
    800086ec:	fe843783          	ld	a5,-24(s0)
    800086f0:	1507b783          	ld	a5,336(a5)
    800086f4:	853e                	mv	a0,a5
    800086f6:	ffffd097          	auipc	ra,0xffffd
    800086fa:	d5a080e7          	jalr	-678(ra) # 80005450 <iput>
  end_op();
    800086fe:	ffffe097          	auipc	ra,0xffffe
    80008702:	d10080e7          	jalr	-752(ra) # 8000640e <end_op>
  p->cwd = ip;
    80008706:	fe843783          	ld	a5,-24(s0)
    8000870a:	fe043703          	ld	a4,-32(s0)
    8000870e:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008712:	4781                	li	a5,0
}
    80008714:	853e                	mv	a0,a5
    80008716:	60ea                	ld	ra,152(sp)
    80008718:	644a                	ld	s0,144(sp)
    8000871a:	610d                	addi	sp,sp,160
    8000871c:	8082                	ret

000000008000871e <sys_exec>:

uint64
sys_exec(void)
{
    8000871e:	7161                	addi	sp,sp,-432
    80008720:	f706                	sd	ra,424(sp)
    80008722:	f322                	sd	s0,416(sp)
    80008724:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    80008726:	e6040793          	addi	a5,s0,-416
    8000872a:	85be                	mv	a1,a5
    8000872c:	4505                	li	a0,1
    8000872e:	ffffc097          	auipc	ra,0xffffc
    80008732:	c22080e7          	jalr	-990(ra) # 80004350 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    80008736:	f6840793          	addi	a5,s0,-152
    8000873a:	08000613          	li	a2,128
    8000873e:	85be                	mv	a1,a5
    80008740:	4501                	li	a0,0
    80008742:	ffffc097          	auipc	ra,0xffffc
    80008746:	c40080e7          	jalr	-960(ra) # 80004382 <argstr>
    8000874a:	87aa                	mv	a5,a0
    8000874c:	0007d463          	bgez	a5,80008754 <sys_exec+0x36>
    return -1;
    80008750:	57fd                	li	a5,-1
    80008752:	a249                	j	800088d4 <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    80008754:	e6840793          	addi	a5,s0,-408
    80008758:	10000613          	li	a2,256
    8000875c:	4581                	li	a1,0
    8000875e:	853e                	mv	a0,a5
    80008760:	ffff9097          	auipc	ra,0xffff9
    80008764:	db0080e7          	jalr	-592(ra) # 80001510 <memset>
  for(i=0;; i++){
    80008768:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    8000876c:	fec42783          	lw	a5,-20(s0)
    80008770:	873e                	mv	a4,a5
    80008772:	47fd                	li	a5,31
    80008774:	10e7e463          	bltu	a5,a4,8000887c <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    80008778:	fec42783          	lw	a5,-20(s0)
    8000877c:	00379713          	slli	a4,a5,0x3
    80008780:	e6043783          	ld	a5,-416(s0)
    80008784:	97ba                	add	a5,a5,a4
    80008786:	e5840713          	addi	a4,s0,-424
    8000878a:	85ba                	mv	a1,a4
    8000878c:	853e                	mv	a0,a5
    8000878e:	ffffc097          	auipc	ra,0xffffc
    80008792:	a1a080e7          	jalr	-1510(ra) # 800041a8 <fetchaddr>
    80008796:	87aa                	mv	a5,a0
    80008798:	0e07c463          	bltz	a5,80008880 <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    8000879c:	e5843783          	ld	a5,-424(s0)
    800087a0:	eb95                	bnez	a5,800087d4 <sys_exec+0xb6>
      argv[i] = 0;
    800087a2:	fec42783          	lw	a5,-20(s0)
    800087a6:	078e                	slli	a5,a5,0x3
    800087a8:	ff040713          	addi	a4,s0,-16
    800087ac:	97ba                	add	a5,a5,a4
    800087ae:	e607bc23          	sd	zero,-392(a5)
      break;
    800087b2:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    800087b4:	e6840713          	addi	a4,s0,-408
    800087b8:	f6840793          	addi	a5,s0,-152
    800087bc:	85ba                	mv	a1,a4
    800087be:	853e                	mv	a0,a5
    800087c0:	fffff097          	auipc	ra,0xfffff
    800087c4:	c1e080e7          	jalr	-994(ra) # 800073de <exec>
    800087c8:	87aa                	mv	a5,a0
    800087ca:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800087ce:	fe042623          	sw	zero,-20(s0)
    800087d2:	a059                	j	80008858 <sys_exec+0x13a>
    argv[i] = kalloc();
    800087d4:	ffff9097          	auipc	ra,0xffff9
    800087d8:	a02080e7          	jalr	-1534(ra) # 800011d6 <kalloc>
    800087dc:	872a                	mv	a4,a0
    800087de:	fec42783          	lw	a5,-20(s0)
    800087e2:	078e                	slli	a5,a5,0x3
    800087e4:	ff040693          	addi	a3,s0,-16
    800087e8:	97b6                	add	a5,a5,a3
    800087ea:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    800087ee:	fec42783          	lw	a5,-20(s0)
    800087f2:	078e                	slli	a5,a5,0x3
    800087f4:	ff040713          	addi	a4,s0,-16
    800087f8:	97ba                	add	a5,a5,a4
    800087fa:	e787b783          	ld	a5,-392(a5)
    800087fe:	c3d9                	beqz	a5,80008884 <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008800:	e5843703          	ld	a4,-424(s0)
    80008804:	fec42783          	lw	a5,-20(s0)
    80008808:	078e                	slli	a5,a5,0x3
    8000880a:	ff040693          	addi	a3,s0,-16
    8000880e:	97b6                	add	a5,a5,a3
    80008810:	e787b783          	ld	a5,-392(a5)
    80008814:	6605                	lui	a2,0x1
    80008816:	85be                	mv	a1,a5
    80008818:	853a                	mv	a0,a4
    8000881a:	ffffc097          	auipc	ra,0xffffc
    8000881e:	9fc080e7          	jalr	-1540(ra) # 80004216 <fetchstr>
    80008822:	87aa                	mv	a5,a0
    80008824:	0607c263          	bltz	a5,80008888 <sys_exec+0x16a>
  for(i=0;; i++){
    80008828:	fec42783          	lw	a5,-20(s0)
    8000882c:	2785                	addiw	a5,a5,1
    8000882e:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008832:	bf2d                	j	8000876c <sys_exec+0x4e>
    kfree(argv[i]);
    80008834:	fec42783          	lw	a5,-20(s0)
    80008838:	078e                	slli	a5,a5,0x3
    8000883a:	ff040713          	addi	a4,s0,-16
    8000883e:	97ba                	add	a5,a5,a4
    80008840:	e787b783          	ld	a5,-392(a5)
    80008844:	853e                	mv	a0,a5
    80008846:	ffff9097          	auipc	ra,0xffff9
    8000884a:	8ea080e7          	jalr	-1814(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000884e:	fec42783          	lw	a5,-20(s0)
    80008852:	2785                	addiw	a5,a5,1
    80008854:	fef42623          	sw	a5,-20(s0)
    80008858:	fec42783          	lw	a5,-20(s0)
    8000885c:	873e                	mv	a4,a5
    8000885e:	47fd                	li	a5,31
    80008860:	00e7eb63          	bltu	a5,a4,80008876 <sys_exec+0x158>
    80008864:	fec42783          	lw	a5,-20(s0)
    80008868:	078e                	slli	a5,a5,0x3
    8000886a:	ff040713          	addi	a4,s0,-16
    8000886e:	97ba                	add	a5,a5,a4
    80008870:	e787b783          	ld	a5,-392(a5)
    80008874:	f3e1                	bnez	a5,80008834 <sys_exec+0x116>

  return ret;
    80008876:	fe842783          	lw	a5,-24(s0)
    8000887a:	a8a9                	j	800088d4 <sys_exec+0x1b6>
      goto bad;
    8000887c:	0001                	nop
    8000887e:	a031                	j	8000888a <sys_exec+0x16c>
      goto bad;
    80008880:	0001                	nop
    80008882:	a021                	j	8000888a <sys_exec+0x16c>
      goto bad;
    80008884:	0001                	nop
    80008886:	a011                	j	8000888a <sys_exec+0x16c>
      goto bad;
    80008888:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000888a:	fe042623          	sw	zero,-20(s0)
    8000888e:	a01d                	j	800088b4 <sys_exec+0x196>
    kfree(argv[i]);
    80008890:	fec42783          	lw	a5,-20(s0)
    80008894:	078e                	slli	a5,a5,0x3
    80008896:	ff040713          	addi	a4,s0,-16
    8000889a:	97ba                	add	a5,a5,a4
    8000889c:	e787b783          	ld	a5,-392(a5)
    800088a0:	853e                	mv	a0,a5
    800088a2:	ffff9097          	auipc	ra,0xffff9
    800088a6:	88e080e7          	jalr	-1906(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088aa:	fec42783          	lw	a5,-20(s0)
    800088ae:	2785                	addiw	a5,a5,1
    800088b0:	fef42623          	sw	a5,-20(s0)
    800088b4:	fec42783          	lw	a5,-20(s0)
    800088b8:	873e                	mv	a4,a5
    800088ba:	47fd                	li	a5,31
    800088bc:	00e7eb63          	bltu	a5,a4,800088d2 <sys_exec+0x1b4>
    800088c0:	fec42783          	lw	a5,-20(s0)
    800088c4:	078e                	slli	a5,a5,0x3
    800088c6:	ff040713          	addi	a4,s0,-16
    800088ca:	97ba                	add	a5,a5,a4
    800088cc:	e787b783          	ld	a5,-392(a5)
    800088d0:	f3e1                	bnez	a5,80008890 <sys_exec+0x172>
  return -1;
    800088d2:	57fd                	li	a5,-1
}
    800088d4:	853e                	mv	a0,a5
    800088d6:	70ba                	ld	ra,424(sp)
    800088d8:	741a                	ld	s0,416(sp)
    800088da:	615d                	addi	sp,sp,432
    800088dc:	8082                	ret

00000000800088de <sys_pipe>:

uint64
sys_pipe(void)
{
    800088de:	7139                	addi	sp,sp,-64
    800088e0:	fc06                	sd	ra,56(sp)
    800088e2:	f822                	sd	s0,48(sp)
    800088e4:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    800088e6:	ffffa097          	auipc	ra,0xffffa
    800088ea:	12a080e7          	jalr	298(ra) # 80002a10 <myproc>
    800088ee:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    800088f2:	fe040793          	addi	a5,s0,-32
    800088f6:	85be                	mv	a1,a5
    800088f8:	4501                	li	a0,0
    800088fa:	ffffc097          	auipc	ra,0xffffc
    800088fe:	a56080e7          	jalr	-1450(ra) # 80004350 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008902:	fd040713          	addi	a4,s0,-48
    80008906:	fd840793          	addi	a5,s0,-40
    8000890a:	85ba                	mv	a1,a4
    8000890c:	853e                	mv	a0,a5
    8000890e:	ffffe097          	auipc	ra,0xffffe
    80008912:	5ee080e7          	jalr	1518(ra) # 80006efc <pipealloc>
    80008916:	87aa                	mv	a5,a0
    80008918:	0007d463          	bgez	a5,80008920 <sys_pipe+0x42>
    return -1;
    8000891c:	57fd                	li	a5,-1
    8000891e:	a219                	j	80008a24 <sys_pipe+0x146>
  fd0 = -1;
    80008920:	57fd                	li	a5,-1
    80008922:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008926:	fd843783          	ld	a5,-40(s0)
    8000892a:	853e                	mv	a0,a5
    8000892c:	fffff097          	auipc	ra,0xfffff
    80008930:	0da080e7          	jalr	218(ra) # 80007a06 <fdalloc>
    80008934:	87aa                	mv	a5,a0
    80008936:	fcf42623          	sw	a5,-52(s0)
    8000893a:	fcc42783          	lw	a5,-52(s0)
    8000893e:	0207c063          	bltz	a5,8000895e <sys_pipe+0x80>
    80008942:	fd043783          	ld	a5,-48(s0)
    80008946:	853e                	mv	a0,a5
    80008948:	fffff097          	auipc	ra,0xfffff
    8000894c:	0be080e7          	jalr	190(ra) # 80007a06 <fdalloc>
    80008950:	87aa                	mv	a5,a0
    80008952:	fcf42423          	sw	a5,-56(s0)
    80008956:	fc842783          	lw	a5,-56(s0)
    8000895a:	0207df63          	bgez	a5,80008998 <sys_pipe+0xba>
    if(fd0 >= 0)
    8000895e:	fcc42783          	lw	a5,-52(s0)
    80008962:	0007cb63          	bltz	a5,80008978 <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    80008966:	fcc42783          	lw	a5,-52(s0)
    8000896a:	fe843703          	ld	a4,-24(s0)
    8000896e:	07e9                	addi	a5,a5,26
    80008970:	078e                	slli	a5,a5,0x3
    80008972:	97ba                	add	a5,a5,a4
    80008974:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008978:	fd843783          	ld	a5,-40(s0)
    8000897c:	853e                	mv	a0,a5
    8000897e:	ffffe097          	auipc	ra,0xffffe
    80008982:	068080e7          	jalr	104(ra) # 800069e6 <fileclose>
    fileclose(wf);
    80008986:	fd043783          	ld	a5,-48(s0)
    8000898a:	853e                	mv	a0,a5
    8000898c:	ffffe097          	auipc	ra,0xffffe
    80008990:	05a080e7          	jalr	90(ra) # 800069e6 <fileclose>
    return -1;
    80008994:	57fd                	li	a5,-1
    80008996:	a079                	j	80008a24 <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008998:	fe843783          	ld	a5,-24(s0)
    8000899c:	6bbc                	ld	a5,80(a5)
    8000899e:	fe043703          	ld	a4,-32(s0)
    800089a2:	fcc40613          	addi	a2,s0,-52
    800089a6:	4691                	li	a3,4
    800089a8:	85ba                	mv	a1,a4
    800089aa:	853e                	mv	a0,a5
    800089ac:	ffffa097          	auipc	ra,0xffffa
    800089b0:	b2e080e7          	jalr	-1234(ra) # 800024da <copyout>
    800089b4:	87aa                	mv	a5,a0
    800089b6:	0207c463          	bltz	a5,800089de <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    800089ba:	fe843783          	ld	a5,-24(s0)
    800089be:	6bb8                	ld	a4,80(a5)
    800089c0:	fe043783          	ld	a5,-32(s0)
    800089c4:	0791                	addi	a5,a5,4
    800089c6:	fc840613          	addi	a2,s0,-56
    800089ca:	4691                	li	a3,4
    800089cc:	85be                	mv	a1,a5
    800089ce:	853a                	mv	a0,a4
    800089d0:	ffffa097          	auipc	ra,0xffffa
    800089d4:	b0a080e7          	jalr	-1270(ra) # 800024da <copyout>
    800089d8:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800089da:	0407d463          	bgez	a5,80008a22 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    800089de:	fcc42783          	lw	a5,-52(s0)
    800089e2:	fe843703          	ld	a4,-24(s0)
    800089e6:	07e9                	addi	a5,a5,26
    800089e8:	078e                	slli	a5,a5,0x3
    800089ea:	97ba                	add	a5,a5,a4
    800089ec:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    800089f0:	fc842783          	lw	a5,-56(s0)
    800089f4:	fe843703          	ld	a4,-24(s0)
    800089f8:	07e9                	addi	a5,a5,26
    800089fa:	078e                	slli	a5,a5,0x3
    800089fc:	97ba                	add	a5,a5,a4
    800089fe:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a02:	fd843783          	ld	a5,-40(s0)
    80008a06:	853e                	mv	a0,a5
    80008a08:	ffffe097          	auipc	ra,0xffffe
    80008a0c:	fde080e7          	jalr	-34(ra) # 800069e6 <fileclose>
    fileclose(wf);
    80008a10:	fd043783          	ld	a5,-48(s0)
    80008a14:	853e                	mv	a0,a5
    80008a16:	ffffe097          	auipc	ra,0xffffe
    80008a1a:	fd0080e7          	jalr	-48(ra) # 800069e6 <fileclose>
    return -1;
    80008a1e:	57fd                	li	a5,-1
    80008a20:	a011                	j	80008a24 <sys_pipe+0x146>
  }
  return 0;
    80008a22:	4781                	li	a5,0
}
    80008a24:	853e                	mv	a0,a5
    80008a26:	70e2                	ld	ra,56(sp)
    80008a28:	7442                	ld	s0,48(sp)
    80008a2a:	6121                	addi	sp,sp,64
    80008a2c:	8082                	ret
	...

0000000080008a30 <kernelvec>:
    80008a30:	7111                	addi	sp,sp,-256
    80008a32:	e006                	sd	ra,0(sp)
    80008a34:	e40a                	sd	sp,8(sp)
    80008a36:	e80e                	sd	gp,16(sp)
    80008a38:	ec12                	sd	tp,24(sp)
    80008a3a:	f016                	sd	t0,32(sp)
    80008a3c:	f41a                	sd	t1,40(sp)
    80008a3e:	f81e                	sd	t2,48(sp)
    80008a40:	fc22                	sd	s0,56(sp)
    80008a42:	e0a6                	sd	s1,64(sp)
    80008a44:	e4aa                	sd	a0,72(sp)
    80008a46:	e8ae                	sd	a1,80(sp)
    80008a48:	ecb2                	sd	a2,88(sp)
    80008a4a:	f0b6                	sd	a3,96(sp)
    80008a4c:	f4ba                	sd	a4,104(sp)
    80008a4e:	f8be                	sd	a5,112(sp)
    80008a50:	fcc2                	sd	a6,120(sp)
    80008a52:	e146                	sd	a7,128(sp)
    80008a54:	e54a                	sd	s2,136(sp)
    80008a56:	e94e                	sd	s3,144(sp)
    80008a58:	ed52                	sd	s4,152(sp)
    80008a5a:	f156                	sd	s5,160(sp)
    80008a5c:	f55a                	sd	s6,168(sp)
    80008a5e:	f95e                	sd	s7,176(sp)
    80008a60:	fd62                	sd	s8,184(sp)
    80008a62:	e1e6                	sd	s9,192(sp)
    80008a64:	e5ea                	sd	s10,200(sp)
    80008a66:	e9ee                	sd	s11,208(sp)
    80008a68:	edf2                	sd	t3,216(sp)
    80008a6a:	f1f6                	sd	t4,224(sp)
    80008a6c:	f5fa                	sd	t5,232(sp)
    80008a6e:	f9fe                	sd	t6,240(sp)
    80008a70:	c94fb0ef          	jal	ra,80003f04 <kerneltrap>
    80008a74:	6082                	ld	ra,0(sp)
    80008a76:	6122                	ld	sp,8(sp)
    80008a78:	61c2                	ld	gp,16(sp)
    80008a7a:	7282                	ld	t0,32(sp)
    80008a7c:	7322                	ld	t1,40(sp)
    80008a7e:	73c2                	ld	t2,48(sp)
    80008a80:	7462                	ld	s0,56(sp)
    80008a82:	6486                	ld	s1,64(sp)
    80008a84:	6526                	ld	a0,72(sp)
    80008a86:	65c6                	ld	a1,80(sp)
    80008a88:	6666                	ld	a2,88(sp)
    80008a8a:	7686                	ld	a3,96(sp)
    80008a8c:	7726                	ld	a4,104(sp)
    80008a8e:	77c6                	ld	a5,112(sp)
    80008a90:	7866                	ld	a6,120(sp)
    80008a92:	688a                	ld	a7,128(sp)
    80008a94:	692a                	ld	s2,136(sp)
    80008a96:	69ca                	ld	s3,144(sp)
    80008a98:	6a6a                	ld	s4,152(sp)
    80008a9a:	7a8a                	ld	s5,160(sp)
    80008a9c:	7b2a                	ld	s6,168(sp)
    80008a9e:	7bca                	ld	s7,176(sp)
    80008aa0:	7c6a                	ld	s8,184(sp)
    80008aa2:	6c8e                	ld	s9,192(sp)
    80008aa4:	6d2e                	ld	s10,200(sp)
    80008aa6:	6dce                	ld	s11,208(sp)
    80008aa8:	6e6e                	ld	t3,216(sp)
    80008aaa:	7e8e                	ld	t4,224(sp)
    80008aac:	7f2e                	ld	t5,232(sp)
    80008aae:	7fce                	ld	t6,240(sp)
    80008ab0:	6111                	addi	sp,sp,256
    80008ab2:	10200073          	sret
    80008ab6:	00000013          	nop
    80008aba:	00000013          	nop
    80008abe:	0001                	nop

0000000080008ac0 <timervec>:
    80008ac0:	34051573          	csrrw	a0,mscratch,a0
    80008ac4:	e10c                	sd	a1,0(a0)
    80008ac6:	e510                	sd	a2,8(a0)
    80008ac8:	e914                	sd	a3,16(a0)
    80008aca:	6d0c                	ld	a1,24(a0)
    80008acc:	7110                	ld	a2,32(a0)
    80008ace:	6194                	ld	a3,0(a1)
    80008ad0:	96b2                	add	a3,a3,a2
    80008ad2:	e194                	sd	a3,0(a1)
    80008ad4:	4589                	li	a1,2
    80008ad6:	14459073          	csrw	sip,a1
    80008ada:	6914                	ld	a3,16(a0)
    80008adc:	6510                	ld	a2,8(a0)
    80008ade:	610c                	ld	a1,0(a0)
    80008ae0:	34051573          	csrrw	a0,mscratch,a0
    80008ae4:	30200073          	mret
	...

0000000080008aea <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008aea:	1141                	addi	sp,sp,-16
    80008aec:	e422                	sd	s0,8(sp)
    80008aee:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008af0:	0c0007b7          	lui	a5,0xc000
    80008af4:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008af8:	4705                	li	a4,1
    80008afa:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008afc:	0c0007b7          	lui	a5,0xc000
    80008b00:	0791                	addi	a5,a5,4
    80008b02:	4705                	li	a4,1
    80008b04:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008b06:	0c0007b7          	lui	a5,0xc000
    80008b0a:	07a1                	addi	a5,a5,8
    80008b0c:	4705                	li	a4,1
    80008b0e:	c398                	sw	a4,0(a5)
}
    80008b10:	0001                	nop
    80008b12:	6422                	ld	s0,8(sp)
    80008b14:	0141                	addi	sp,sp,16
    80008b16:	8082                	ret

0000000080008b18 <plicinithart>:

void
plicinithart(void)
{
    80008b18:	1101                	addi	sp,sp,-32
    80008b1a:	ec06                	sd	ra,24(sp)
    80008b1c:	e822                	sd	s0,16(sp)
    80008b1e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008b20:	ffffa097          	auipc	ra,0xffffa
    80008b24:	e92080e7          	jalr	-366(ra) # 800029b2 <cpuid>
    80008b28:	87aa                	mv	a5,a0
    80008b2a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008b2e:	fec42783          	lw	a5,-20(s0)
    80008b32:	0087979b          	slliw	a5,a5,0x8
    80008b36:	2781                	sext.w	a5,a5
    80008b38:	873e                	mv	a4,a5
    80008b3a:	0c0027b7          	lui	a5,0xc002
    80008b3e:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008b42:	97ba                	add	a5,a5,a4
    80008b44:	873e                	mv	a4,a5
    80008b46:	40600793          	li	a5,1030
    80008b4a:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008b4c:	fec42783          	lw	a5,-20(s0)
    80008b50:	00d7979b          	slliw	a5,a5,0xd
    80008b54:	2781                	sext.w	a5,a5
    80008b56:	873e                	mv	a4,a5
    80008b58:	0c2017b7          	lui	a5,0xc201
    80008b5c:	97ba                	add	a5,a5,a4
    80008b5e:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008b62:	0001                	nop
    80008b64:	60e2                	ld	ra,24(sp)
    80008b66:	6442                	ld	s0,16(sp)
    80008b68:	6105                	addi	sp,sp,32
    80008b6a:	8082                	ret

0000000080008b6c <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008b6c:	1101                	addi	sp,sp,-32
    80008b6e:	ec06                	sd	ra,24(sp)
    80008b70:	e822                	sd	s0,16(sp)
    80008b72:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008b74:	ffffa097          	auipc	ra,0xffffa
    80008b78:	e3e080e7          	jalr	-450(ra) # 800029b2 <cpuid>
    80008b7c:	87aa                	mv	a5,a0
    80008b7e:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008b82:	fec42783          	lw	a5,-20(s0)
    80008b86:	00d7979b          	slliw	a5,a5,0xd
    80008b8a:	2781                	sext.w	a5,a5
    80008b8c:	873e                	mv	a4,a5
    80008b8e:	0c2017b7          	lui	a5,0xc201
    80008b92:	0791                	addi	a5,a5,4
    80008b94:	97ba                	add	a5,a5,a4
    80008b96:	439c                	lw	a5,0(a5)
    80008b98:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008b9c:	fe842783          	lw	a5,-24(s0)
}
    80008ba0:	853e                	mv	a0,a5
    80008ba2:	60e2                	ld	ra,24(sp)
    80008ba4:	6442                	ld	s0,16(sp)
    80008ba6:	6105                	addi	sp,sp,32
    80008ba8:	8082                	ret

0000000080008baa <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008baa:	7179                	addi	sp,sp,-48
    80008bac:	f406                	sd	ra,40(sp)
    80008bae:	f022                	sd	s0,32(sp)
    80008bb0:	1800                	addi	s0,sp,48
    80008bb2:	87aa                	mv	a5,a0
    80008bb4:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008bb8:	ffffa097          	auipc	ra,0xffffa
    80008bbc:	dfa080e7          	jalr	-518(ra) # 800029b2 <cpuid>
    80008bc0:	87aa                	mv	a5,a0
    80008bc2:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008bc6:	fec42783          	lw	a5,-20(s0)
    80008bca:	00d7979b          	slliw	a5,a5,0xd
    80008bce:	2781                	sext.w	a5,a5
    80008bd0:	873e                	mv	a4,a5
    80008bd2:	0c2017b7          	lui	a5,0xc201
    80008bd6:	0791                	addi	a5,a5,4
    80008bd8:	97ba                	add	a5,a5,a4
    80008bda:	873e                	mv	a4,a5
    80008bdc:	fdc42783          	lw	a5,-36(s0)
    80008be0:	c31c                	sw	a5,0(a4)
}
    80008be2:	0001                	nop
    80008be4:	70a2                	ld	ra,40(sp)
    80008be6:	7402                	ld	s0,32(sp)
    80008be8:	6145                	addi	sp,sp,48
    80008bea:	8082                	ret

0000000080008bec <r_sstatus>:
{
    80008bec:	1101                	addi	sp,sp,-32
    80008bee:	ec22                	sd	s0,24(sp)
    80008bf0:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80008bf2:	100027f3          	csrr	a5,sstatus
    80008bf6:	fef43423          	sd	a5,-24(s0)
  return x;
    80008bfa:	fe843783          	ld	a5,-24(s0)
}
    80008bfe:	853e                	mv	a0,a5
    80008c00:	6462                	ld	s0,24(sp)
    80008c02:	6105                	addi	sp,sp,32
    80008c04:	8082                	ret

0000000080008c06 <w_sstatus>:
{
    80008c06:	1101                	addi	sp,sp,-32
    80008c08:	ec22                	sd	s0,24(sp)
    80008c0a:	1000                	addi	s0,sp,32
    80008c0c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80008c10:	fe843783          	ld	a5,-24(s0)
    80008c14:	10079073          	csrw	sstatus,a5
}
    80008c18:	0001                	nop
    80008c1a:	6462                	ld	s0,24(sp)
    80008c1c:	6105                	addi	sp,sp,32
    80008c1e:	8082                	ret

0000000080008c20 <intr_on>:
{
    80008c20:	1141                	addi	sp,sp,-16
    80008c22:	e406                	sd	ra,8(sp)
    80008c24:	e022                	sd	s0,0(sp)
    80008c26:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80008c28:	00000097          	auipc	ra,0x0
    80008c2c:	fc4080e7          	jalr	-60(ra) # 80008bec <r_sstatus>
    80008c30:	87aa                	mv	a5,a0
    80008c32:	0027e793          	ori	a5,a5,2
    80008c36:	853e                	mv	a0,a5
    80008c38:	00000097          	auipc	ra,0x0
    80008c3c:	fce080e7          	jalr	-50(ra) # 80008c06 <w_sstatus>
}
    80008c40:	0001                	nop
    80008c42:	60a2                	ld	ra,8(sp)
    80008c44:	6402                	ld	s0,0(sp)
    80008c46:	0141                	addi	sp,sp,16
    80008c48:	8082                	ret

0000000080008c4a <intr_off>:
{
    80008c4a:	1141                	addi	sp,sp,-16
    80008c4c:	e406                	sd	ra,8(sp)
    80008c4e:	e022                	sd	s0,0(sp)
    80008c50:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80008c52:	00000097          	auipc	ra,0x0
    80008c56:	f9a080e7          	jalr	-102(ra) # 80008bec <r_sstatus>
    80008c5a:	87aa                	mv	a5,a0
    80008c5c:	9bf5                	andi	a5,a5,-3
    80008c5e:	853e                	mv	a0,a5
    80008c60:	00000097          	auipc	ra,0x0
    80008c64:	fa6080e7          	jalr	-90(ra) # 80008c06 <w_sstatus>
}
    80008c68:	0001                	nop
    80008c6a:	60a2                	ld	ra,8(sp)
    80008c6c:	6402                	ld	s0,0(sp)
    80008c6e:	0141                	addi	sp,sp,16
    80008c70:	8082                	ret

0000000080008c72 <setBit>:

static struct Bitset {
  uint32 bits[DISK_PAGES_COUNT / BITS_PER_UINT];
} diskpagesallocated = {{0} };

void setBit(int index) {
    80008c72:	7179                	addi	sp,sp,-48
    80008c74:	f422                	sd	s0,40(sp)
    80008c76:	1800                	addi	s0,sp,48
    80008c78:	87aa                	mv	a5,a0
    80008c7a:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008c7e:	fdc42783          	lw	a5,-36(s0)
    80008c82:	8395                	srli	a5,a5,0x5
    80008c84:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008c88:	fdc42783          	lw	a5,-36(s0)
    80008c8c:	8bfd                	andi	a5,a5,31
    80008c8e:	fef42423          	sw	a5,-24(s0)
  diskpagesallocated.bits[arrayIndex] |= (1 << bitOffset);
    80008c92:	0001d717          	auipc	a4,0x1d
    80008c96:	09670713          	addi	a4,a4,150 # 80025d28 <diskpagesallocated>
    80008c9a:	fec42783          	lw	a5,-20(s0)
    80008c9e:	078a                	slli	a5,a5,0x2
    80008ca0:	97ba                	add	a5,a5,a4
    80008ca2:	4394                	lw	a3,0(a5)
    80008ca4:	fe842783          	lw	a5,-24(s0)
    80008ca8:	4705                	li	a4,1
    80008caa:	00f717bb          	sllw	a5,a4,a5
    80008cae:	2781                	sext.w	a5,a5
    80008cb0:	2781                	sext.w	a5,a5
    80008cb2:	8736                	mv	a4,a3
    80008cb4:	8fd9                	or	a5,a5,a4
    80008cb6:	0007871b          	sext.w	a4,a5
    80008cba:	0001d697          	auipc	a3,0x1d
    80008cbe:	06e68693          	addi	a3,a3,110 # 80025d28 <diskpagesallocated>
    80008cc2:	fec42783          	lw	a5,-20(s0)
    80008cc6:	078a                	slli	a5,a5,0x2
    80008cc8:	97b6                	add	a5,a5,a3
    80008cca:	c398                	sw	a4,0(a5)
}
    80008ccc:	0001                	nop
    80008cce:	7422                	ld	s0,40(sp)
    80008cd0:	6145                	addi	sp,sp,48
    80008cd2:	8082                	ret

0000000080008cd4 <clearBit>:

void clearBit(int index) {
    80008cd4:	7179                	addi	sp,sp,-48
    80008cd6:	f422                	sd	s0,40(sp)
    80008cd8:	1800                	addi	s0,sp,48
    80008cda:	87aa                	mv	a5,a0
    80008cdc:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008ce0:	fdc42783          	lw	a5,-36(s0)
    80008ce4:	8395                	srli	a5,a5,0x5
    80008ce6:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008cea:	fdc42783          	lw	a5,-36(s0)
    80008cee:	8bfd                	andi	a5,a5,31
    80008cf0:	fef42423          	sw	a5,-24(s0)
  diskpagesallocated.bits[arrayIndex] &= ~(1 << bitOffset);
    80008cf4:	0001d717          	auipc	a4,0x1d
    80008cf8:	03470713          	addi	a4,a4,52 # 80025d28 <diskpagesallocated>
    80008cfc:	fec42783          	lw	a5,-20(s0)
    80008d00:	078a                	slli	a5,a5,0x2
    80008d02:	97ba                	add	a5,a5,a4
    80008d04:	4394                	lw	a3,0(a5)
    80008d06:	fe842783          	lw	a5,-24(s0)
    80008d0a:	4705                	li	a4,1
    80008d0c:	00f717bb          	sllw	a5,a4,a5
    80008d10:	2781                	sext.w	a5,a5
    80008d12:	fff7c793          	not	a5,a5
    80008d16:	2781                	sext.w	a5,a5
    80008d18:	2781                	sext.w	a5,a5
    80008d1a:	8736                	mv	a4,a3
    80008d1c:	8ff9                	and	a5,a5,a4
    80008d1e:	0007871b          	sext.w	a4,a5
    80008d22:	0001d697          	auipc	a3,0x1d
    80008d26:	00668693          	addi	a3,a3,6 # 80025d28 <diskpagesallocated>
    80008d2a:	fec42783          	lw	a5,-20(s0)
    80008d2e:	078a                	slli	a5,a5,0x2
    80008d30:	97b6                	add	a5,a5,a3
    80008d32:	c398                	sw	a4,0(a5)
}
    80008d34:	0001                	nop
    80008d36:	7422                	ld	s0,40(sp)
    80008d38:	6145                	addi	sp,sp,48
    80008d3a:	8082                	ret

0000000080008d3c <getBit>:

int getBit(int index) {
    80008d3c:	7179                	addi	sp,sp,-48
    80008d3e:	f422                	sd	s0,40(sp)
    80008d40:	1800                	addi	s0,sp,48
    80008d42:	87aa                	mv	a5,a0
    80008d44:	fcf42e23          	sw	a5,-36(s0)
  int arrayIndex = index / BITS_PER_UINT;
    80008d48:	fdc42783          	lw	a5,-36(s0)
    80008d4c:	8395                	srli	a5,a5,0x5
    80008d4e:	fef42623          	sw	a5,-20(s0)
  int bitOffset = index % BITS_PER_UINT;
    80008d52:	fdc42783          	lw	a5,-36(s0)
    80008d56:	8bfd                	andi	a5,a5,31
    80008d58:	fef42423          	sw	a5,-24(s0)
  return (diskpagesallocated.bits[arrayIndex] >> bitOffset) & 1;
    80008d5c:	0001d717          	auipc	a4,0x1d
    80008d60:	fcc70713          	addi	a4,a4,-52 # 80025d28 <diskpagesallocated>
    80008d64:	fec42783          	lw	a5,-20(s0)
    80008d68:	078a                	slli	a5,a5,0x2
    80008d6a:	97ba                	add	a5,a5,a4
    80008d6c:	4398                	lw	a4,0(a5)
    80008d6e:	fe842783          	lw	a5,-24(s0)
    80008d72:	00f757bb          	srlw	a5,a4,a5
    80008d76:	2781                	sext.w	a5,a5
    80008d78:	2781                	sext.w	a5,a5
    80008d7a:	8b85                	andi	a5,a5,1
    80008d7c:	2781                	sext.w	a5,a5
}
    80008d7e:	853e                	mv	a0,a5
    80008d80:	7422                	ld	s0,40(sp)
    80008d82:	6145                	addi	sp,sp,48
    80008d84:	8082                	ret

0000000080008d86 <findFirstFreePage>:

int findFirstFreePage() {
    80008d86:	1101                	addi	sp,sp,-32
    80008d88:	ec06                	sd	ra,24(sp)
    80008d8a:	e822                	sd	s0,16(sp)
    80008d8c:	1000                	addi	s0,sp,32
  for (int i = 0; i < DISK_PAGES_COUNT; ++i) {
    80008d8e:	fe042623          	sw	zero,-20(s0)
    80008d92:	a015                	j	80008db6 <findFirstFreePage+0x30>
    if (getBit(i) == 0) {
    80008d94:	fec42783          	lw	a5,-20(s0)
    80008d98:	853e                	mv	a0,a5
    80008d9a:	00000097          	auipc	ra,0x0
    80008d9e:	fa2080e7          	jalr	-94(ra) # 80008d3c <getBit>
    80008da2:	87aa                	mv	a5,a0
    80008da4:	e781                	bnez	a5,80008dac <findFirstFreePage+0x26>
      return i;
    80008da6:	fec42783          	lw	a5,-20(s0)
    80008daa:	a831                	j	80008dc6 <findFirstFreePage+0x40>
  for (int i = 0; i < DISK_PAGES_COUNT; ++i) {
    80008dac:	fec42783          	lw	a5,-20(s0)
    80008db0:	2785                	addiw	a5,a5,1
    80008db2:	fef42623          	sw	a5,-20(s0)
    80008db6:	fec42783          	lw	a5,-20(s0)
    80008dba:	0007871b          	sext.w	a4,a5
    80008dbe:	6785                	lui	a5,0x1
    80008dc0:	fcf74ae3          	blt	a4,a5,80008d94 <findFirstFreePage+0xe>
    }
  }
  return -1; // Return -1 if no clear bit is found
    80008dc4:	57fd                	li	a5,-1
}
    80008dc6:	853e                	mv	a0,a5
    80008dc8:	60e2                	ld	ra,24(sp)
    80008dca:	6442                	ld	s0,16(sp)
    80008dcc:	6105                	addi	sp,sp,32
    80008dce:	8082                	ret

0000000080008dd0 <takeFirstFreePage>:

int takeFirstFreePage() {
    80008dd0:	1101                	addi	sp,sp,-32
    80008dd2:	ec06                	sd	ra,24(sp)
    80008dd4:	e822                	sd	s0,16(sp)
    80008dd6:	1000                	addi	s0,sp,32
  int index = findFirstFreePage();
    80008dd8:	00000097          	auipc	ra,0x0
    80008ddc:	fae080e7          	jalr	-82(ra) # 80008d86 <findFirstFreePage>
    80008de0:	87aa                	mv	a5,a0
    80008de2:	fef42623          	sw	a5,-20(s0)
  if(index < 0) return -1;
    80008de6:	fec42783          	lw	a5,-20(s0)
    80008dea:	2781                	sext.w	a5,a5
    80008dec:	0007d463          	bgez	a5,80008df4 <takeFirstFreePage+0x24>
    80008df0:	57fd                	li	a5,-1
    80008df2:	a811                	j	80008e06 <takeFirstFreePage+0x36>
  setBit(index);
    80008df4:	fec42783          	lw	a5,-20(s0)
    80008df8:	853e                	mv	a0,a5
    80008dfa:	00000097          	auipc	ra,0x0
    80008dfe:	e78080e7          	jalr	-392(ra) # 80008c72 <setBit>
  return index;
    80008e02:	fec42783          	lw	a5,-20(s0)
}
    80008e06:	853e                	mv	a0,a5
    80008e08:	60e2                	ld	ra,24(sp)
    80008e0a:	6442                	ld	s0,16(sp)
    80008e0c:	6105                	addi	sp,sp,32
    80008e0e:	8082                	ret

0000000080008e10 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    80008e10:	7139                	addi	sp,sp,-64
    80008e12:	fc06                	sd	ra,56(sp)
    80008e14:	f822                	sd	s0,48(sp)
    80008e16:	0080                	addi	s0,sp,64
    80008e18:	87aa                	mv	a5,a0
    80008e1a:	fcb43023          	sd	a1,-64(s0)
    80008e1e:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80008e22:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008e26:	fcc42703          	lw	a4,-52(s0)
    80008e2a:	15000793          	li	a5,336
    80008e2e:	02f707b3          	mul	a5,a4,a5
    80008e32:	13078713          	addi	a4,a5,304 # 1130 <_entry-0x7fffeed0>
    80008e36:	0001d797          	auipc	a5,0x1d
    80008e3a:	0f278793          	addi	a5,a5,242 # 80025f28 <disk>
    80008e3e:	97ba                	add	a5,a5,a4
    80008e40:	fc043583          	ld	a1,-64(s0)
    80008e44:	853e                	mv	a0,a5
    80008e46:	ffff8097          	auipc	ra,0xffff8
    80008e4a:	4c6080e7          	jalr	1222(ra) # 8000130c <initlock>
  disk[id].name = name;
    80008e4e:	0001d717          	auipc	a4,0x1d
    80008e52:	0da70713          	addi	a4,a4,218 # 80025f28 <disk>
    80008e56:	fcc42683          	lw	a3,-52(s0)
    80008e5a:	15000793          	li	a5,336
    80008e5e:	02f687b3          	mul	a5,a3,a5
    80008e62:	97ba                	add	a5,a5,a4
    80008e64:	fc043703          	ld	a4,-64(s0)
    80008e68:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008e6a:	fcc42703          	lw	a4,-52(s0)
    80008e6e:	67c1                	lui	a5,0x10
    80008e70:	0785                	addi	a5,a5,1
    80008e72:	97ba                	add	a5,a5,a4
    80008e74:	07b2                	slli	a5,a5,0xc
    80008e76:	439c                	lw	a5,0(a5)
    80008e78:	2781                	sext.w	a5,a5
    80008e7a:	873e                	mv	a4,a5
    80008e7c:	747277b7          	lui	a5,0x74727
    80008e80:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008e84:	04f71c63          	bne	a4,a5,80008edc <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008e88:	fcc42703          	lw	a4,-52(s0)
    80008e8c:	67c1                	lui	a5,0x10
    80008e8e:	0785                	addi	a5,a5,1
    80008e90:	97ba                	add	a5,a5,a4
    80008e92:	07b2                	slli	a5,a5,0xc
    80008e94:	0791                	addi	a5,a5,4
    80008e96:	439c                	lw	a5,0(a5)
    80008e98:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008e9a:	873e                	mv	a4,a5
    80008e9c:	4789                	li	a5,2
    80008e9e:	02f71f63          	bne	a4,a5,80008edc <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008ea2:	fcc42703          	lw	a4,-52(s0)
    80008ea6:	67c1                	lui	a5,0x10
    80008ea8:	0785                	addi	a5,a5,1
    80008eaa:	97ba                	add	a5,a5,a4
    80008eac:	07b2                	slli	a5,a5,0xc
    80008eae:	07a1                	addi	a5,a5,8
    80008eb0:	439c                	lw	a5,0(a5)
    80008eb2:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008eb4:	873e                	mv	a4,a5
    80008eb6:	4789                	li	a5,2
    80008eb8:	02f71263          	bne	a4,a5,80008edc <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008ebc:	fcc42703          	lw	a4,-52(s0)
    80008ec0:	67c1                	lui	a5,0x10
    80008ec2:	0785                	addi	a5,a5,1
    80008ec4:	97ba                	add	a5,a5,a4
    80008ec6:	07b2                	slli	a5,a5,0xc
    80008ec8:	07b1                	addi	a5,a5,12
    80008eca:	439c                	lw	a5,0(a5)
    80008ecc:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008ece:	873e                	mv	a4,a5
    80008ed0:	554d47b7          	lui	a5,0x554d4
    80008ed4:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008ed8:	00f70d63          	beq	a4,a5,80008ef2 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    80008edc:	fc043603          	ld	a2,-64(s0)
    80008ee0:	00003597          	auipc	a1,0x3
    80008ee4:	7b058593          	addi	a1,a1,1968 # 8000c690 <etext+0x690>
    80008ee8:	4509                	li	a0,2
    80008eea:	ffff8097          	auipc	ra,0xffff8
    80008eee:	df4080e7          	jalr	-524(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008ef2:	fcc42703          	lw	a4,-52(s0)
    80008ef6:	67c1                	lui	a5,0x10
    80008ef8:	0785                	addi	a5,a5,1
    80008efa:	97ba                	add	a5,a5,a4
    80008efc:	07b2                	slli	a5,a5,0xc
    80008efe:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f02:	873e                	mv	a4,a5
    80008f04:	fe842783          	lw	a5,-24(s0)
    80008f08:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008f0a:	fe842783          	lw	a5,-24(s0)
    80008f0e:	0017e793          	ori	a5,a5,1
    80008f12:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f16:	fcc42703          	lw	a4,-52(s0)
    80008f1a:	67c1                	lui	a5,0x10
    80008f1c:	0785                	addi	a5,a5,1
    80008f1e:	97ba                	add	a5,a5,a4
    80008f20:	07b2                	slli	a5,a5,0xc
    80008f22:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f26:	873e                	mv	a4,a5
    80008f28:	fe842783          	lw	a5,-24(s0)
    80008f2c:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008f2e:	fe842783          	lw	a5,-24(s0)
    80008f32:	0027e793          	ori	a5,a5,2
    80008f36:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f3a:	fcc42703          	lw	a4,-52(s0)
    80008f3e:	67c1                	lui	a5,0x10
    80008f40:	0785                	addi	a5,a5,1
    80008f42:	97ba                	add	a5,a5,a4
    80008f44:	07b2                	slli	a5,a5,0xc
    80008f46:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f4a:	873e                	mv	a4,a5
    80008f4c:	fe842783          	lw	a5,-24(s0)
    80008f50:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008f52:	fcc42703          	lw	a4,-52(s0)
    80008f56:	67c1                	lui	a5,0x10
    80008f58:	0785                	addi	a5,a5,1
    80008f5a:	97ba                	add	a5,a5,a4
    80008f5c:	07b2                	slli	a5,a5,0xc
    80008f5e:	07c1                	addi	a5,a5,16
    80008f60:	439c                	lw	a5,0(a5)
    80008f62:	2781                	sext.w	a5,a5
    80008f64:	1782                	slli	a5,a5,0x20
    80008f66:	9381                	srli	a5,a5,0x20
    80008f68:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008f6c:	fe043783          	ld	a5,-32(s0)
    80008f70:	fdf7f793          	andi	a5,a5,-33
    80008f74:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008f78:	fe043783          	ld	a5,-32(s0)
    80008f7c:	f7f7f793          	andi	a5,a5,-129
    80008f80:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008f84:	fe043703          	ld	a4,-32(s0)
    80008f88:	77fd                	lui	a5,0xfffff
    80008f8a:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ff99617>
    80008f8e:	8ff9                	and	a5,a5,a4
    80008f90:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008f94:	fe043703          	ld	a4,-32(s0)
    80008f98:	77fd                	lui	a5,0xfffff
    80008f9a:	17fd                	addi	a5,a5,-1
    80008f9c:	8ff9                	and	a5,a5,a4
    80008f9e:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008fa2:	fe043703          	ld	a4,-32(s0)
    80008fa6:	f80007b7          	lui	a5,0xf8000
    80008faa:	17fd                	addi	a5,a5,-1
    80008fac:	8ff9                	and	a5,a5,a4
    80008fae:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008fb2:	fe043703          	ld	a4,-32(s0)
    80008fb6:	e00007b7          	lui	a5,0xe0000
    80008fba:	17fd                	addi	a5,a5,-1
    80008fbc:	8ff9                	and	a5,a5,a4
    80008fbe:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008fc2:	fe043703          	ld	a4,-32(s0)
    80008fc6:	f00007b7          	lui	a5,0xf0000
    80008fca:	17fd                	addi	a5,a5,-1
    80008fcc:	8ff9                	and	a5,a5,a4
    80008fce:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008fd2:	fcc42703          	lw	a4,-52(s0)
    80008fd6:	67c1                	lui	a5,0x10
    80008fd8:	0785                	addi	a5,a5,1
    80008fda:	97ba                	add	a5,a5,a4
    80008fdc:	07b2                	slli	a5,a5,0xc
    80008fde:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80008fe2:	873e                	mv	a4,a5
    80008fe4:	fe043783          	ld	a5,-32(s0)
    80008fe8:	2781                	sext.w	a5,a5
    80008fea:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008fec:	fe842783          	lw	a5,-24(s0)
    80008ff0:	0087e793          	ori	a5,a5,8
    80008ff4:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008ff8:	fcc42703          	lw	a4,-52(s0)
    80008ffc:	67c1                	lui	a5,0x10
    80008ffe:	0785                	addi	a5,a5,1
    80009000:	97ba                	add	a5,a5,a4
    80009002:	07b2                	slli	a5,a5,0xc
    80009004:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009008:	873e                	mv	a4,a5
    8000900a:	fe842783          	lw	a5,-24(s0)
    8000900e:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80009010:	fcc42703          	lw	a4,-52(s0)
    80009014:	67c1                	lui	a5,0x10
    80009016:	0785                	addi	a5,a5,1
    80009018:	97ba                	add	a5,a5,a4
    8000901a:	07b2                	slli	a5,a5,0xc
    8000901c:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009020:	439c                	lw	a5,0(a5)
    80009022:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80009026:	fe842783          	lw	a5,-24(s0)
    8000902a:	8ba1                	andi	a5,a5,8
    8000902c:	2781                	sext.w	a5,a5
    8000902e:	ef81                	bnez	a5,80009046 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    80009030:	00003617          	auipc	a2,0x3
    80009034:	68060613          	addi	a2,a2,1664 # 8000c6b0 <etext+0x6b0>
    80009038:	fc043583          	ld	a1,-64(s0)
    8000903c:	4509                	li	a0,2
    8000903e:	ffff8097          	auipc	ra,0xffff8
    80009042:	ca0080e7          	jalr	-864(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    80009046:	fcc42703          	lw	a4,-52(s0)
    8000904a:	67c1                	lui	a5,0x10
    8000904c:	0785                	addi	a5,a5,1
    8000904e:	97ba                	add	a5,a5,a4
    80009050:	07b2                	slli	a5,a5,0xc
    80009052:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    80009056:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    8000905a:	fcc42703          	lw	a4,-52(s0)
    8000905e:	67c1                	lui	a5,0x10
    80009060:	0785                	addi	a5,a5,1
    80009062:	97ba                	add	a5,a5,a4
    80009064:	07b2                	slli	a5,a5,0xc
    80009066:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    8000906a:	439c                	lw	a5,0(a5)
    8000906c:	2781                	sext.w	a5,a5
    8000906e:	cf81                	beqz	a5,80009086 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    80009070:	00003617          	auipc	a2,0x3
    80009074:	66060613          	addi	a2,a2,1632 # 8000c6d0 <etext+0x6d0>
    80009078:	fc043583          	ld	a1,-64(s0)
    8000907c:	4509                	li	a0,2
    8000907e:	ffff8097          	auipc	ra,0xffff8
    80009082:	c60080e7          	jalr	-928(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    80009086:	fcc42703          	lw	a4,-52(s0)
    8000908a:	67c1                	lui	a5,0x10
    8000908c:	0785                	addi	a5,a5,1
    8000908e:	97ba                	add	a5,a5,a4
    80009090:	07b2                	slli	a5,a5,0xc
    80009092:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80009096:	439c                	lw	a5,0(a5)
    80009098:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    8000909c:	fdc42783          	lw	a5,-36(s0)
    800090a0:	2781                	sext.w	a5,a5
    800090a2:	ef81                	bnez	a5,800090ba <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    800090a4:	00003617          	auipc	a2,0x3
    800090a8:	65460613          	addi	a2,a2,1620 # 8000c6f8 <etext+0x6f8>
    800090ac:	fc043583          	ld	a1,-64(s0)
    800090b0:	4509                	li	a0,2
    800090b2:	ffff8097          	auipc	ra,0xffff8
    800090b6:	c2c080e7          	jalr	-980(ra) # 80000cde <panic_concat>
  if(max < NUM)
    800090ba:	fdc42783          	lw	a5,-36(s0)
    800090be:	0007871b          	sext.w	a4,a5
    800090c2:	479d                	li	a5,7
    800090c4:	00e7ed63          	bltu	a5,a4,800090de <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    800090c8:	00003617          	auipc	a2,0x3
    800090cc:	65060613          	addi	a2,a2,1616 # 8000c718 <etext+0x718>
    800090d0:	fc043583          	ld	a1,-64(s0)
    800090d4:	4509                	li	a0,2
    800090d6:	ffff8097          	auipc	ra,0xffff8
    800090da:	c08080e7          	jalr	-1016(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    800090de:	ffff8097          	auipc	ra,0xffff8
    800090e2:	0f8080e7          	jalr	248(ra) # 800011d6 <kalloc>
    800090e6:	862a                	mv	a2,a0
    800090e8:	0001d717          	auipc	a4,0x1d
    800090ec:	e4070713          	addi	a4,a4,-448 # 80025f28 <disk>
    800090f0:	fcc42683          	lw	a3,-52(s0)
    800090f4:	15000793          	li	a5,336
    800090f8:	02f687b3          	mul	a5,a3,a5
    800090fc:	97ba                	add	a5,a5,a4
    800090fe:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    80009100:	ffff8097          	auipc	ra,0xffff8
    80009104:	0d6080e7          	jalr	214(ra) # 800011d6 <kalloc>
    80009108:	862a                	mv	a2,a0
    8000910a:	0001d717          	auipc	a4,0x1d
    8000910e:	e1e70713          	addi	a4,a4,-482 # 80025f28 <disk>
    80009112:	fcc42683          	lw	a3,-52(s0)
    80009116:	15000793          	li	a5,336
    8000911a:	02f687b3          	mul	a5,a3,a5
    8000911e:	97ba                	add	a5,a5,a4
    80009120:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    80009122:	ffff8097          	auipc	ra,0xffff8
    80009126:	0b4080e7          	jalr	180(ra) # 800011d6 <kalloc>
    8000912a:	862a                	mv	a2,a0
    8000912c:	0001d717          	auipc	a4,0x1d
    80009130:	dfc70713          	addi	a4,a4,-516 # 80025f28 <disk>
    80009134:	fcc42683          	lw	a3,-52(s0)
    80009138:	15000793          	li	a5,336
    8000913c:	02f687b3          	mul	a5,a3,a5
    80009140:	97ba                	add	a5,a5,a4
    80009142:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    80009144:	0001d717          	auipc	a4,0x1d
    80009148:	de470713          	addi	a4,a4,-540 # 80025f28 <disk>
    8000914c:	fcc42683          	lw	a3,-52(s0)
    80009150:	15000793          	li	a5,336
    80009154:	02f687b3          	mul	a5,a3,a5
    80009158:	97ba                	add	a5,a5,a4
    8000915a:	679c                	ld	a5,8(a5)
    8000915c:	cb9d                	beqz	a5,80009192 <virtio_disk_init+0x382>
    8000915e:	0001d717          	auipc	a4,0x1d
    80009162:	dca70713          	addi	a4,a4,-566 # 80025f28 <disk>
    80009166:	fcc42683          	lw	a3,-52(s0)
    8000916a:	15000793          	li	a5,336
    8000916e:	02f687b3          	mul	a5,a3,a5
    80009172:	97ba                	add	a5,a5,a4
    80009174:	6b9c                	ld	a5,16(a5)
    80009176:	cf91                	beqz	a5,80009192 <virtio_disk_init+0x382>
    80009178:	0001d717          	auipc	a4,0x1d
    8000917c:	db070713          	addi	a4,a4,-592 # 80025f28 <disk>
    80009180:	fcc42683          	lw	a3,-52(s0)
    80009184:	15000793          	li	a5,336
    80009188:	02f687b3          	mul	a5,a3,a5
    8000918c:	97ba                	add	a5,a5,a4
    8000918e:	6f9c                	ld	a5,24(a5)
    80009190:	ef81                	bnez	a5,800091a8 <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80009192:	00003617          	auipc	a2,0x3
    80009196:	5ae60613          	addi	a2,a2,1454 # 8000c740 <etext+0x740>
    8000919a:	fc043583          	ld	a1,-64(s0)
    8000919e:	4509                	li	a0,2
    800091a0:	ffff8097          	auipc	ra,0xffff8
    800091a4:	b3e080e7          	jalr	-1218(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    800091a8:	0001d717          	auipc	a4,0x1d
    800091ac:	d8070713          	addi	a4,a4,-640 # 80025f28 <disk>
    800091b0:	fcc42683          	lw	a3,-52(s0)
    800091b4:	15000793          	li	a5,336
    800091b8:	02f687b3          	mul	a5,a3,a5
    800091bc:	97ba                	add	a5,a5,a4
    800091be:	679c                	ld	a5,8(a5)
    800091c0:	6605                	lui	a2,0x1
    800091c2:	4581                	li	a1,0
    800091c4:	853e                	mv	a0,a5
    800091c6:	ffff8097          	auipc	ra,0xffff8
    800091ca:	34a080e7          	jalr	842(ra) # 80001510 <memset>
  memset(disk[id].avail, 0, PGSIZE);
    800091ce:	0001d717          	auipc	a4,0x1d
    800091d2:	d5a70713          	addi	a4,a4,-678 # 80025f28 <disk>
    800091d6:	fcc42683          	lw	a3,-52(s0)
    800091da:	15000793          	li	a5,336
    800091de:	02f687b3          	mul	a5,a3,a5
    800091e2:	97ba                	add	a5,a5,a4
    800091e4:	6b9c                	ld	a5,16(a5)
    800091e6:	6605                	lui	a2,0x1
    800091e8:	4581                	li	a1,0
    800091ea:	853e                	mv	a0,a5
    800091ec:	ffff8097          	auipc	ra,0xffff8
    800091f0:	324080e7          	jalr	804(ra) # 80001510 <memset>
  memset(disk[id].used, 0, PGSIZE);
    800091f4:	0001d717          	auipc	a4,0x1d
    800091f8:	d3470713          	addi	a4,a4,-716 # 80025f28 <disk>
    800091fc:	fcc42683          	lw	a3,-52(s0)
    80009200:	15000793          	li	a5,336
    80009204:	02f687b3          	mul	a5,a3,a5
    80009208:	97ba                	add	a5,a5,a4
    8000920a:	6f9c                	ld	a5,24(a5)
    8000920c:	6605                	lui	a2,0x1
    8000920e:	4581                	li	a1,0
    80009210:	853e                	mv	a0,a5
    80009212:	ffff8097          	auipc	ra,0xffff8
    80009216:	2fe080e7          	jalr	766(ra) # 80001510 <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    8000921a:	fcc42703          	lw	a4,-52(s0)
    8000921e:	67c1                	lui	a5,0x10
    80009220:	0785                	addi	a5,a5,1
    80009222:	97ba                	add	a5,a5,a4
    80009224:	07b2                	slli	a5,a5,0xc
    80009226:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    8000922a:	873e                	mv	a4,a5
    8000922c:	47a1                	li	a5,8
    8000922e:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    80009230:	0001d717          	auipc	a4,0x1d
    80009234:	cf870713          	addi	a4,a4,-776 # 80025f28 <disk>
    80009238:	fcc42683          	lw	a3,-52(s0)
    8000923c:	15000793          	li	a5,336
    80009240:	02f687b3          	mul	a5,a3,a5
    80009244:	97ba                	add	a5,a5,a4
    80009246:	679c                	ld	a5,8(a5)
    80009248:	86be                	mv	a3,a5
    8000924a:	fcc42703          	lw	a4,-52(s0)
    8000924e:	67c1                	lui	a5,0x10
    80009250:	0785                	addi	a5,a5,1
    80009252:	97ba                	add	a5,a5,a4
    80009254:	07b2                	slli	a5,a5,0xc
    80009256:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    8000925a:	873e                	mv	a4,a5
    8000925c:	0006879b          	sext.w	a5,a3
    80009260:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    80009262:	0001d717          	auipc	a4,0x1d
    80009266:	cc670713          	addi	a4,a4,-826 # 80025f28 <disk>
    8000926a:	fcc42683          	lw	a3,-52(s0)
    8000926e:	15000793          	li	a5,336
    80009272:	02f687b3          	mul	a5,a3,a5
    80009276:	97ba                	add	a5,a5,a4
    80009278:	679c                	ld	a5,8(a5)
    8000927a:	0207d693          	srli	a3,a5,0x20
    8000927e:	fcc42703          	lw	a4,-52(s0)
    80009282:	67c1                	lui	a5,0x10
    80009284:	0785                	addi	a5,a5,1
    80009286:	97ba                	add	a5,a5,a4
    80009288:	07b2                	slli	a5,a5,0xc
    8000928a:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    8000928e:	873e                	mv	a4,a5
    80009290:	0006879b          	sext.w	a5,a3
    80009294:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009296:	0001d717          	auipc	a4,0x1d
    8000929a:	c9270713          	addi	a4,a4,-878 # 80025f28 <disk>
    8000929e:	fcc42683          	lw	a3,-52(s0)
    800092a2:	15000793          	li	a5,336
    800092a6:	02f687b3          	mul	a5,a3,a5
    800092aa:	97ba                	add	a5,a5,a4
    800092ac:	6b9c                	ld	a5,16(a5)
    800092ae:	86be                	mv	a3,a5
    800092b0:	fcc42703          	lw	a4,-52(s0)
    800092b4:	67c1                	lui	a5,0x10
    800092b6:	0785                	addi	a5,a5,1
    800092b8:	97ba                	add	a5,a5,a4
    800092ba:	07b2                	slli	a5,a5,0xc
    800092bc:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    800092c0:	873e                	mv	a4,a5
    800092c2:	0006879b          	sext.w	a5,a3
    800092c6:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    800092c8:	0001d717          	auipc	a4,0x1d
    800092cc:	c6070713          	addi	a4,a4,-928 # 80025f28 <disk>
    800092d0:	fcc42683          	lw	a3,-52(s0)
    800092d4:	15000793          	li	a5,336
    800092d8:	02f687b3          	mul	a5,a3,a5
    800092dc:	97ba                	add	a5,a5,a4
    800092de:	6b9c                	ld	a5,16(a5)
    800092e0:	0207d693          	srli	a3,a5,0x20
    800092e4:	fcc42703          	lw	a4,-52(s0)
    800092e8:	67c1                	lui	a5,0x10
    800092ea:	0785                	addi	a5,a5,1
    800092ec:	97ba                	add	a5,a5,a4
    800092ee:	07b2                	slli	a5,a5,0xc
    800092f0:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    800092f4:	873e                	mv	a4,a5
    800092f6:	0006879b          	sext.w	a5,a3
    800092fa:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    800092fc:	0001d717          	auipc	a4,0x1d
    80009300:	c2c70713          	addi	a4,a4,-980 # 80025f28 <disk>
    80009304:	fcc42683          	lw	a3,-52(s0)
    80009308:	15000793          	li	a5,336
    8000930c:	02f687b3          	mul	a5,a3,a5
    80009310:	97ba                	add	a5,a5,a4
    80009312:	6f9c                	ld	a5,24(a5)
    80009314:	86be                	mv	a3,a5
    80009316:	fcc42703          	lw	a4,-52(s0)
    8000931a:	67c1                	lui	a5,0x10
    8000931c:	0785                	addi	a5,a5,1
    8000931e:	97ba                	add	a5,a5,a4
    80009320:	07b2                	slli	a5,a5,0xc
    80009322:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    80009326:	873e                	mv	a4,a5
    80009328:	0006879b          	sext.w	a5,a3
    8000932c:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    8000932e:	0001d717          	auipc	a4,0x1d
    80009332:	bfa70713          	addi	a4,a4,-1030 # 80025f28 <disk>
    80009336:	fcc42683          	lw	a3,-52(s0)
    8000933a:	15000793          	li	a5,336
    8000933e:	02f687b3          	mul	a5,a3,a5
    80009342:	97ba                	add	a5,a5,a4
    80009344:	6f9c                	ld	a5,24(a5)
    80009346:	0207d693          	srli	a3,a5,0x20
    8000934a:	fcc42703          	lw	a4,-52(s0)
    8000934e:	67c1                	lui	a5,0x10
    80009350:	0785                	addi	a5,a5,1
    80009352:	97ba                	add	a5,a5,a4
    80009354:	07b2                	slli	a5,a5,0xc
    80009356:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    8000935a:	873e                	mv	a4,a5
    8000935c:	0006879b          	sext.w	a5,a3
    80009360:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80009362:	fcc42703          	lw	a4,-52(s0)
    80009366:	67c1                	lui	a5,0x10
    80009368:	0785                	addi	a5,a5,1
    8000936a:	97ba                	add	a5,a5,a4
    8000936c:	07b2                	slli	a5,a5,0xc
    8000936e:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80009372:	873e                	mv	a4,a5
    80009374:	4785                	li	a5,1
    80009376:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    80009378:	fe042623          	sw	zero,-20(s0)
    8000937c:	a03d                	j	800093aa <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    8000937e:	0001d697          	auipc	a3,0x1d
    80009382:	baa68693          	addi	a3,a3,-1110 # 80025f28 <disk>
    80009386:	fec42703          	lw	a4,-20(s0)
    8000938a:	fcc42603          	lw	a2,-52(s0)
    8000938e:	15000793          	li	a5,336
    80009392:	02f607b3          	mul	a5,a2,a5
    80009396:	97b6                	add	a5,a5,a3
    80009398:	97ba                	add	a5,a5,a4
    8000939a:	4705                	li	a4,1
    8000939c:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    800093a0:	fec42783          	lw	a5,-20(s0)
    800093a4:	2785                	addiw	a5,a5,1
    800093a6:	fef42623          	sw	a5,-20(s0)
    800093aa:	fec42783          	lw	a5,-20(s0)
    800093ae:	0007871b          	sext.w	a4,a5
    800093b2:	479d                	li	a5,7
    800093b4:	fce7d5e3          	bge	a5,a4,8000937e <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    800093b8:	fe842783          	lw	a5,-24(s0)
    800093bc:	0047e793          	ori	a5,a5,4
    800093c0:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    800093c4:	fcc42703          	lw	a4,-52(s0)
    800093c8:	67c1                	lui	a5,0x10
    800093ca:	0785                	addi	a5,a5,1
    800093cc:	97ba                	add	a5,a5,a4
    800093ce:	07b2                	slli	a5,a5,0xc
    800093d0:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    800093d4:	873e                	mv	a4,a5
    800093d6:	fe842783          	lw	a5,-24(s0)
    800093da:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    800093dc:	fcc42783          	lw	a5,-52(s0)
    800093e0:	0007871b          	sext.w	a4,a5
    800093e4:	4785                	li	a5,1
    800093e6:	06f71663          	bne	a4,a5,80009452 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    800093ea:	ffff8097          	auipc	ra,0xffff8
    800093ee:	dec080e7          	jalr	-532(ra) # 800011d6 <kalloc>
    800093f2:	872a                	mv	a4,a0
    800093f4:	0001d797          	auipc	a5,0x1d
    800093f8:	dd478793          	addi	a5,a5,-556 # 800261c8 <swap_buffer>
    800093fc:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    800093fe:	0001d797          	auipc	a5,0x1d
    80009402:	dca78793          	addi	a5,a5,-566 # 800261c8 <swap_buffer>
    80009406:	639c                	ld	a5,0(a5)
    80009408:	eb89                	bnez	a5,8000941a <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    8000940a:	00003517          	auipc	a0,0x3
    8000940e:	34e50513          	addi	a0,a0,846 # 8000c758 <etext+0x758>
    80009412:	ffff8097          	auipc	ra,0xffff8
    80009416:	87a080e7          	jalr	-1926(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    8000941a:	0001d797          	auipc	a5,0x1d
    8000941e:	dae78793          	addi	a5,a5,-594 # 800261c8 <swap_buffer>
    80009422:	639c                	ld	a5,0(a5)
    80009424:	40000613          	li	a2,1024
    80009428:	4581                	li	a1,0
    8000942a:	853e                	mv	a0,a5
    8000942c:	ffff8097          	auipc	ra,0xffff8
    80009430:	0e4080e7          	jalr	228(ra) # 80001510 <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    80009434:	0001d797          	auipc	a5,0x1d
    80009438:	d9478793          	addi	a5,a5,-620 # 800261c8 <swap_buffer>
    8000943c:	639c                	ld	a5,0(a5)
    8000943e:	07c1                	addi	a5,a5,16
    80009440:	00003597          	auipc	a1,0x3
    80009444:	34858593          	addi	a1,a1,840 # 8000c788 <etext+0x788>
    80009448:	853e                	mv	a0,a5
    8000944a:	ffffd097          	auipc	ra,0xffffd
    8000944e:	314080e7          	jalr	788(ra) # 8000675e <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    80009452:	0001                	nop
    80009454:	70e2                	ld	ra,56(sp)
    80009456:	7442                	ld	s0,48(sp)
    80009458:	6121                	addi	sp,sp,64
    8000945a:	8082                	ret

000000008000945c <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    8000945c:	7179                	addi	sp,sp,-48
    8000945e:	f422                	sd	s0,40(sp)
    80009460:	1800                	addi	s0,sp,48
    80009462:	87aa                	mv	a5,a0
    80009464:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    80009468:	fe042623          	sw	zero,-20(s0)
    8000946c:	a891                	j	800094c0 <alloc_desc+0x64>
    if(disk[id].free[i]){
    8000946e:	0001d697          	auipc	a3,0x1d
    80009472:	aba68693          	addi	a3,a3,-1350 # 80025f28 <disk>
    80009476:	fec42703          	lw	a4,-20(s0)
    8000947a:	fdc42603          	lw	a2,-36(s0)
    8000947e:	15000793          	li	a5,336
    80009482:	02f607b3          	mul	a5,a2,a5
    80009486:	97b6                	add	a5,a5,a3
    80009488:	97ba                	add	a5,a5,a4
    8000948a:	0207c783          	lbu	a5,32(a5)
    8000948e:	c785                	beqz	a5,800094b6 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009490:	0001d697          	auipc	a3,0x1d
    80009494:	a9868693          	addi	a3,a3,-1384 # 80025f28 <disk>
    80009498:	fec42703          	lw	a4,-20(s0)
    8000949c:	fdc42603          	lw	a2,-36(s0)
    800094a0:	15000793          	li	a5,336
    800094a4:	02f607b3          	mul	a5,a2,a5
    800094a8:	97b6                	add	a5,a5,a3
    800094aa:	97ba                	add	a5,a5,a4
    800094ac:	02078023          	sb	zero,32(a5)
      return i;
    800094b0:	fec42783          	lw	a5,-20(s0)
    800094b4:	a831                	j	800094d0 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    800094b6:	fec42783          	lw	a5,-20(s0)
    800094ba:	2785                	addiw	a5,a5,1
    800094bc:	fef42623          	sw	a5,-20(s0)
    800094c0:	fec42783          	lw	a5,-20(s0)
    800094c4:	0007871b          	sext.w	a4,a5
    800094c8:	479d                	li	a5,7
    800094ca:	fae7d2e3          	bge	a5,a4,8000946e <alloc_desc+0x12>
    }
  }
  return -1;
    800094ce:	57fd                	li	a5,-1
}
    800094d0:	853e                	mv	a0,a5
    800094d2:	7422                	ld	s0,40(sp)
    800094d4:	6145                	addi	sp,sp,48
    800094d6:	8082                	ret

00000000800094d8 <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    800094d8:	1101                	addi	sp,sp,-32
    800094da:	ec06                	sd	ra,24(sp)
    800094dc:	e822                	sd	s0,16(sp)
    800094de:	1000                	addi	s0,sp,32
    800094e0:	87aa                	mv	a5,a0
    800094e2:	872e                	mv	a4,a1
    800094e4:	fef42623          	sw	a5,-20(s0)
    800094e8:	87ba                	mv	a5,a4
    800094ea:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    800094ee:	fe842783          	lw	a5,-24(s0)
    800094f2:	0007871b          	sext.w	a4,a5
    800094f6:	479d                	li	a5,7
    800094f8:	02e7d863          	bge	a5,a4,80009528 <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    800094fc:	0001d717          	auipc	a4,0x1d
    80009500:	a2c70713          	addi	a4,a4,-1492 # 80025f28 <disk>
    80009504:	fec42683          	lw	a3,-20(s0)
    80009508:	15000793          	li	a5,336
    8000950c:	02f687b3          	mul	a5,a3,a5
    80009510:	97ba                	add	a5,a5,a4
    80009512:	639c                	ld	a5,0(a5)
    80009514:	00003617          	auipc	a2,0x3
    80009518:	28460613          	addi	a2,a2,644 # 8000c798 <etext+0x798>
    8000951c:	85be                	mv	a1,a5
    8000951e:	4509                	li	a0,2
    80009520:	ffff7097          	auipc	ra,0xffff7
    80009524:	7be080e7          	jalr	1982(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    80009528:	0001d697          	auipc	a3,0x1d
    8000952c:	a0068693          	addi	a3,a3,-1536 # 80025f28 <disk>
    80009530:	fe842703          	lw	a4,-24(s0)
    80009534:	fec42603          	lw	a2,-20(s0)
    80009538:	15000793          	li	a5,336
    8000953c:	02f607b3          	mul	a5,a2,a5
    80009540:	97b6                	add	a5,a5,a3
    80009542:	97ba                	add	a5,a5,a4
    80009544:	0207c783          	lbu	a5,32(a5)
    80009548:	c79d                	beqz	a5,80009576 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    8000954a:	0001d717          	auipc	a4,0x1d
    8000954e:	9de70713          	addi	a4,a4,-1570 # 80025f28 <disk>
    80009552:	fec42683          	lw	a3,-20(s0)
    80009556:	15000793          	li	a5,336
    8000955a:	02f687b3          	mul	a5,a3,a5
    8000955e:	97ba                	add	a5,a5,a4
    80009560:	639c                	ld	a5,0(a5)
    80009562:	00003617          	auipc	a2,0x3
    80009566:	24660613          	addi	a2,a2,582 # 8000c7a8 <etext+0x7a8>
    8000956a:	85be                	mv	a1,a5
    8000956c:	4509                	li	a0,2
    8000956e:	ffff7097          	auipc	ra,0xffff7
    80009572:	770080e7          	jalr	1904(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    80009576:	0001d717          	auipc	a4,0x1d
    8000957a:	9b270713          	addi	a4,a4,-1614 # 80025f28 <disk>
    8000957e:	fec42683          	lw	a3,-20(s0)
    80009582:	15000793          	li	a5,336
    80009586:	02f687b3          	mul	a5,a3,a5
    8000958a:	97ba                	add	a5,a5,a4
    8000958c:	6798                	ld	a4,8(a5)
    8000958e:	fe842783          	lw	a5,-24(s0)
    80009592:	0792                	slli	a5,a5,0x4
    80009594:	97ba                	add	a5,a5,a4
    80009596:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000959a:	0001d717          	auipc	a4,0x1d
    8000959e:	98e70713          	addi	a4,a4,-1650 # 80025f28 <disk>
    800095a2:	fec42683          	lw	a3,-20(s0)
    800095a6:	15000793          	li	a5,336
    800095aa:	02f687b3          	mul	a5,a3,a5
    800095ae:	97ba                	add	a5,a5,a4
    800095b0:	6798                	ld	a4,8(a5)
    800095b2:	fe842783          	lw	a5,-24(s0)
    800095b6:	0792                	slli	a5,a5,0x4
    800095b8:	97ba                	add	a5,a5,a4
    800095ba:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    800095be:	0001d717          	auipc	a4,0x1d
    800095c2:	96a70713          	addi	a4,a4,-1686 # 80025f28 <disk>
    800095c6:	fec42683          	lw	a3,-20(s0)
    800095ca:	15000793          	li	a5,336
    800095ce:	02f687b3          	mul	a5,a3,a5
    800095d2:	97ba                	add	a5,a5,a4
    800095d4:	6798                	ld	a4,8(a5)
    800095d6:	fe842783          	lw	a5,-24(s0)
    800095da:	0792                	slli	a5,a5,0x4
    800095dc:	97ba                	add	a5,a5,a4
    800095de:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    800095e2:	0001d717          	auipc	a4,0x1d
    800095e6:	94670713          	addi	a4,a4,-1722 # 80025f28 <disk>
    800095ea:	fec42683          	lw	a3,-20(s0)
    800095ee:	15000793          	li	a5,336
    800095f2:	02f687b3          	mul	a5,a3,a5
    800095f6:	97ba                	add	a5,a5,a4
    800095f8:	6798                	ld	a4,8(a5)
    800095fa:	fe842783          	lw	a5,-24(s0)
    800095fe:	0792                	slli	a5,a5,0x4
    80009600:	97ba                	add	a5,a5,a4
    80009602:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    80009606:	0001d697          	auipc	a3,0x1d
    8000960a:	92268693          	addi	a3,a3,-1758 # 80025f28 <disk>
    8000960e:	fe842703          	lw	a4,-24(s0)
    80009612:	fec42603          	lw	a2,-20(s0)
    80009616:	15000793          	li	a5,336
    8000961a:	02f607b3          	mul	a5,a2,a5
    8000961e:	97b6                	add	a5,a5,a3
    80009620:	97ba                	add	a5,a5,a4
    80009622:	4705                	li	a4,1
    80009624:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    80009628:	0001d717          	auipc	a4,0x1d
    8000962c:	90070713          	addi	a4,a4,-1792 # 80025f28 <disk>
    80009630:	fec42683          	lw	a3,-20(s0)
    80009634:	15000793          	li	a5,336
    80009638:	02f687b3          	mul	a5,a3,a5
    8000963c:	97ba                	add	a5,a5,a4
    8000963e:	1487a783          	lw	a5,328(a5)
    80009642:	e39d                	bnez	a5,80009668 <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    80009644:	fec42703          	lw	a4,-20(s0)
    80009648:	15000793          	li	a5,336
    8000964c:	02f707b3          	mul	a5,a4,a5
    80009650:	02078713          	addi	a4,a5,32
    80009654:	0001d797          	auipc	a5,0x1d
    80009658:	8d478793          	addi	a5,a5,-1836 # 80025f28 <disk>
    8000965c:	97ba                	add	a5,a5,a4
    8000965e:	853e                	mv	a0,a5
    80009660:	ffffa097          	auipc	ra,0xffffa
    80009664:	fee080e7          	jalr	-18(ra) # 8000364e <wakeup>
  }
}
    80009668:	0001                	nop
    8000966a:	60e2                	ld	ra,24(sp)
    8000966c:	6442                	ld	s0,16(sp)
    8000966e:	6105                	addi	sp,sp,32
    80009670:	8082                	ret

0000000080009672 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009672:	7179                	addi	sp,sp,-48
    80009674:	f406                	sd	ra,40(sp)
    80009676:	f022                	sd	s0,32(sp)
    80009678:	1800                	addi	s0,sp,48
    8000967a:	87aa                	mv	a5,a0
    8000967c:	872e                	mv	a4,a1
    8000967e:	fcf42e23          	sw	a5,-36(s0)
    80009682:	87ba                	mv	a5,a4
    80009684:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    80009688:	0001d717          	auipc	a4,0x1d
    8000968c:	8a070713          	addi	a4,a4,-1888 # 80025f28 <disk>
    80009690:	fdc42683          	lw	a3,-36(s0)
    80009694:	15000793          	li	a5,336
    80009698:	02f687b3          	mul	a5,a3,a5
    8000969c:	97ba                	add	a5,a5,a4
    8000969e:	6798                	ld	a4,8(a5)
    800096a0:	fd842783          	lw	a5,-40(s0)
    800096a4:	0792                	slli	a5,a5,0x4
    800096a6:	97ba                	add	a5,a5,a4
    800096a8:	00c7d783          	lhu	a5,12(a5)
    800096ac:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    800096b0:	0001d717          	auipc	a4,0x1d
    800096b4:	87870713          	addi	a4,a4,-1928 # 80025f28 <disk>
    800096b8:	fdc42683          	lw	a3,-36(s0)
    800096bc:	15000793          	li	a5,336
    800096c0:	02f687b3          	mul	a5,a3,a5
    800096c4:	97ba                	add	a5,a5,a4
    800096c6:	6798                	ld	a4,8(a5)
    800096c8:	fd842783          	lw	a5,-40(s0)
    800096cc:	0792                	slli	a5,a5,0x4
    800096ce:	97ba                	add	a5,a5,a4
    800096d0:	00e7d783          	lhu	a5,14(a5)
    800096d4:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    800096d8:	fd842703          	lw	a4,-40(s0)
    800096dc:	fdc42783          	lw	a5,-36(s0)
    800096e0:	85ba                	mv	a1,a4
    800096e2:	853e                	mv	a0,a5
    800096e4:	00000097          	auipc	ra,0x0
    800096e8:	df4080e7          	jalr	-524(ra) # 800094d8 <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    800096ec:	fec42783          	lw	a5,-20(s0)
    800096f0:	8b85                	andi	a5,a5,1
    800096f2:	2781                	sext.w	a5,a5
    800096f4:	c791                	beqz	a5,80009700 <free_chain+0x8e>
      i = nxt;
    800096f6:	fe842783          	lw	a5,-24(s0)
    800096fa:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    800096fe:	b769                	j	80009688 <free_chain+0x16>
    else
      break;
    80009700:	0001                	nop
  }
}
    80009702:	0001                	nop
    80009704:	70a2                	ld	ra,40(sp)
    80009706:	7402                	ld	s0,32(sp)
    80009708:	6145                	addi	sp,sp,48
    8000970a:	8082                	ret

000000008000970c <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    8000970c:	7139                	addi	sp,sp,-64
    8000970e:	fc06                	sd	ra,56(sp)
    80009710:	f822                	sd	s0,48(sp)
    80009712:	f426                	sd	s1,40(sp)
    80009714:	0080                	addi	s0,sp,64
    80009716:	87aa                	mv	a5,a0
    80009718:	fcb43023          	sd	a1,-64(s0)
    8000971c:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    80009720:	fc042e23          	sw	zero,-36(s0)
    80009724:	a041                	j	800097a4 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    80009726:	fdc42783          	lw	a5,-36(s0)
    8000972a:	078a                	slli	a5,a5,0x2
    8000972c:	fc043703          	ld	a4,-64(s0)
    80009730:	00f704b3          	add	s1,a4,a5
    80009734:	fcc42783          	lw	a5,-52(s0)
    80009738:	853e                	mv	a0,a5
    8000973a:	00000097          	auipc	ra,0x0
    8000973e:	d22080e7          	jalr	-734(ra) # 8000945c <alloc_desc>
    80009742:	87aa                	mv	a5,a0
    80009744:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    80009746:	fdc42783          	lw	a5,-36(s0)
    8000974a:	078a                	slli	a5,a5,0x2
    8000974c:	fc043703          	ld	a4,-64(s0)
    80009750:	97ba                	add	a5,a5,a4
    80009752:	439c                	lw	a5,0(a5)
    80009754:	0407d363          	bgez	a5,8000979a <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    80009758:	fc042c23          	sw	zero,-40(s0)
    8000975c:	a02d                	j	80009786 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    8000975e:	fd842783          	lw	a5,-40(s0)
    80009762:	078a                	slli	a5,a5,0x2
    80009764:	fc043703          	ld	a4,-64(s0)
    80009768:	97ba                	add	a5,a5,a4
    8000976a:	4398                	lw	a4,0(a5)
    8000976c:	fcc42783          	lw	a5,-52(s0)
    80009770:	85ba                	mv	a1,a4
    80009772:	853e                	mv	a0,a5
    80009774:	00000097          	auipc	ra,0x0
    80009778:	d64080e7          	jalr	-668(ra) # 800094d8 <free_desc>
      for(int j = 0; j < i; j++)
    8000977c:	fd842783          	lw	a5,-40(s0)
    80009780:	2785                	addiw	a5,a5,1
    80009782:	fcf42c23          	sw	a5,-40(s0)
    80009786:	fd842703          	lw	a4,-40(s0)
    8000978a:	fdc42783          	lw	a5,-36(s0)
    8000978e:	2701                	sext.w	a4,a4
    80009790:	2781                	sext.w	a5,a5
    80009792:	fcf746e3          	blt	a4,a5,8000975e <alloc3_desc+0x52>
      return -1;
    80009796:	57fd                	li	a5,-1
    80009798:	a831                	j	800097b4 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    8000979a:	fdc42783          	lw	a5,-36(s0)
    8000979e:	2785                	addiw	a5,a5,1
    800097a0:	fcf42e23          	sw	a5,-36(s0)
    800097a4:	fdc42783          	lw	a5,-36(s0)
    800097a8:	0007871b          	sext.w	a4,a5
    800097ac:	4789                	li	a5,2
    800097ae:	f6e7dce3          	bge	a5,a4,80009726 <alloc3_desc+0x1a>
    }
  }
  return 0;
    800097b2:	4781                	li	a5,0
}
    800097b4:	853e                	mv	a0,a5
    800097b6:	70e2                	ld	ra,56(sp)
    800097b8:	7442                	ld	s0,48(sp)
    800097ba:	74a2                	ld	s1,40(sp)
    800097bc:	6121                	addi	sp,sp,64
    800097be:	8082                	ret

00000000800097c0 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    800097c0:	715d                	addi	sp,sp,-80
    800097c2:	e486                	sd	ra,72(sp)
    800097c4:	e0a2                	sd	s0,64(sp)
    800097c6:	0880                	addi	s0,sp,80
    800097c8:	87aa                	mv	a5,a0
    800097ca:	fcb43023          	sd	a1,-64(s0)
    800097ce:	8736                	mv	a4,a3
    800097d0:	fcf42623          	sw	a5,-52(s0)
    800097d4:	87b2                	mv	a5,a2
    800097d6:	fcf42423          	sw	a5,-56(s0)
    800097da:	87ba                	mv	a5,a4
    800097dc:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    800097e0:	fc043783          	ld	a5,-64(s0)
    800097e4:	47dc                	lw	a5,12(a5)
    800097e6:	0017979b          	slliw	a5,a5,0x1
    800097ea:	2781                	sext.w	a5,a5
    800097ec:	1782                	slli	a5,a5,0x20
    800097ee:	9381                	srli	a5,a5,0x20
    800097f0:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    800097f4:	fcc42703          	lw	a4,-52(s0)
    800097f8:	15000793          	li	a5,336
    800097fc:	02f707b3          	mul	a5,a4,a5
    80009800:	13078713          	addi	a4,a5,304
    80009804:	0001c797          	auipc	a5,0x1c
    80009808:	72478793          	addi	a5,a5,1828 # 80025f28 <disk>
    8000980c:	97ba                	add	a5,a5,a4
    8000980e:	853e                	mv	a0,a5
    80009810:	ffff8097          	auipc	ra,0xffff8
    80009814:	b2c080e7          	jalr	-1236(ra) # 8000133c <acquire>
  disk[id].bw_transfer = busy_wait;
    80009818:	0001c717          	auipc	a4,0x1c
    8000981c:	71070713          	addi	a4,a4,1808 # 80025f28 <disk>
    80009820:	fcc42683          	lw	a3,-52(s0)
    80009824:	15000793          	li	a5,336
    80009828:	02f687b3          	mul	a5,a3,a5
    8000982c:	97ba                	add	a5,a5,a4
    8000982e:	fbc42703          	lw	a4,-68(s0)
    80009832:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    80009836:	fd040713          	addi	a4,s0,-48
    8000983a:	fcc42783          	lw	a5,-52(s0)
    8000983e:	85ba                	mv	a1,a4
    80009840:	853e                	mv	a0,a5
    80009842:	00000097          	auipc	ra,0x0
    80009846:	eca080e7          	jalr	-310(ra) # 8000970c <alloc3_desc>
    8000984a:	87aa                	mv	a5,a0
    8000984c:	c3e9                	beqz	a5,8000990e <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    8000984e:	fbc42783          	lw	a5,-68(s0)
    80009852:	2781                	sext.w	a5,a5
    80009854:	e3b9                	bnez	a5,8000989a <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    80009856:	fcc42703          	lw	a4,-52(s0)
    8000985a:	15000793          	li	a5,336
    8000985e:	02f707b3          	mul	a5,a4,a5
    80009862:	02078713          	addi	a4,a5,32
    80009866:	0001c797          	auipc	a5,0x1c
    8000986a:	6c278793          	addi	a5,a5,1730 # 80025f28 <disk>
    8000986e:	00f706b3          	add	a3,a4,a5
    80009872:	fcc42703          	lw	a4,-52(s0)
    80009876:	15000793          	li	a5,336
    8000987a:	02f707b3          	mul	a5,a4,a5
    8000987e:	13078713          	addi	a4,a5,304
    80009882:	0001c797          	auipc	a5,0x1c
    80009886:	6a678793          	addi	a5,a5,1702 # 80025f28 <disk>
    8000988a:	97ba                	add	a5,a5,a4
    8000988c:	85be                	mv	a1,a5
    8000988e:	8536                	mv	a0,a3
    80009890:	ffffa097          	auipc	ra,0xffffa
    80009894:	d42080e7          	jalr	-702(ra) # 800035d2 <sleep>
    80009898:	bf79                	j	80009836 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    8000989a:	fcc42703          	lw	a4,-52(s0)
    8000989e:	15000793          	li	a5,336
    800098a2:	02f707b3          	mul	a5,a4,a5
    800098a6:	13078713          	addi	a4,a5,304
    800098aa:	0001c797          	auipc	a5,0x1c
    800098ae:	67e78793          	addi	a5,a5,1662 # 80025f28 <disk>
    800098b2:	97ba                	add	a5,a5,a4
    800098b4:	853e                	mv	a0,a5
    800098b6:	ffff8097          	auipc	ra,0xffff8
    800098ba:	aea080e7          	jalr	-1302(ra) # 800013a0 <release>
        intr_on();
    800098be:	fffff097          	auipc	ra,0xfffff
    800098c2:	362080e7          	jalr	866(ra) # 80008c20 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    800098c6:	0001                	nop
    800098c8:	fd040713          	addi	a4,s0,-48
    800098cc:	fcc42783          	lw	a5,-52(s0)
    800098d0:	85ba                	mv	a1,a4
    800098d2:	853e                	mv	a0,a5
    800098d4:	00000097          	auipc	ra,0x0
    800098d8:	e38080e7          	jalr	-456(ra) # 8000970c <alloc3_desc>
    800098dc:	87aa                	mv	a5,a0
    800098de:	f7ed                	bnez	a5,800098c8 <virtio_disk_rw+0x108>
        intr_off();
    800098e0:	fffff097          	auipc	ra,0xfffff
    800098e4:	36a080e7          	jalr	874(ra) # 80008c4a <intr_off>
        acquire(&disk[id].vdisk_lock);
    800098e8:	fcc42703          	lw	a4,-52(s0)
    800098ec:	15000793          	li	a5,336
    800098f0:	02f707b3          	mul	a5,a4,a5
    800098f4:	13078713          	addi	a4,a5,304
    800098f8:	0001c797          	auipc	a5,0x1c
    800098fc:	63078793          	addi	a5,a5,1584 # 80025f28 <disk>
    80009900:	97ba                	add	a5,a5,a4
    80009902:	853e                	mv	a0,a5
    80009904:	ffff8097          	auipc	ra,0xffff8
    80009908:	a38080e7          	jalr	-1480(ra) # 8000133c <acquire>
    if(alloc3_desc(id, idx) == 0) {
    8000990c:	b72d                	j	80009836 <virtio_disk_rw+0x76>
      break;
    8000990e:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    80009910:	fd042683          	lw	a3,-48(s0)
    80009914:	fcc42703          	lw	a4,-52(s0)
    80009918:	87ba                	mv	a5,a4
    8000991a:	078a                	slli	a5,a5,0x2
    8000991c:	97ba                	add	a5,a5,a4
    8000991e:	078a                	slli	a5,a5,0x2
    80009920:	97ba                	add	a5,a5,a4
    80009922:	97b6                	add	a5,a5,a3
    80009924:	07ad                	addi	a5,a5,11
    80009926:	00479713          	slli	a4,a5,0x4
    8000992a:	0001c797          	auipc	a5,0x1c
    8000992e:	5fe78793          	addi	a5,a5,1534 # 80025f28 <disk>
    80009932:	97ba                	add	a5,a5,a4
    80009934:	fef43023          	sd	a5,-32(s0)

  if(write)
    80009938:	fc842783          	lw	a5,-56(s0)
    8000993c:	2781                	sext.w	a5,a5
    8000993e:	c791                	beqz	a5,8000994a <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    80009940:	fe043783          	ld	a5,-32(s0)
    80009944:	4705                	li	a4,1
    80009946:	c398                	sw	a4,0(a5)
    80009948:	a029                	j	80009952 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    8000994a:	fe043783          	ld	a5,-32(s0)
    8000994e:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    80009952:	fe043783          	ld	a5,-32(s0)
    80009956:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    8000995a:	fe043783          	ld	a5,-32(s0)
    8000995e:	fe843703          	ld	a4,-24(s0)
    80009962:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    80009964:	0001c717          	auipc	a4,0x1c
    80009968:	5c470713          	addi	a4,a4,1476 # 80025f28 <disk>
    8000996c:	fcc42683          	lw	a3,-52(s0)
    80009970:	15000793          	li	a5,336
    80009974:	02f687b3          	mul	a5,a3,a5
    80009978:	97ba                	add	a5,a5,a4
    8000997a:	6798                	ld	a4,8(a5)
    8000997c:	fd042783          	lw	a5,-48(s0)
    80009980:	0792                	slli	a5,a5,0x4
    80009982:	97ba                	add	a5,a5,a4
    80009984:	fe043703          	ld	a4,-32(s0)
    80009988:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    8000998a:	0001c717          	auipc	a4,0x1c
    8000998e:	59e70713          	addi	a4,a4,1438 # 80025f28 <disk>
    80009992:	fcc42683          	lw	a3,-52(s0)
    80009996:	15000793          	li	a5,336
    8000999a:	02f687b3          	mul	a5,a3,a5
    8000999e:	97ba                	add	a5,a5,a4
    800099a0:	6798                	ld	a4,8(a5)
    800099a2:	fd042783          	lw	a5,-48(s0)
    800099a6:	0792                	slli	a5,a5,0x4
    800099a8:	97ba                	add	a5,a5,a4
    800099aa:	4741                	li	a4,16
    800099ac:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    800099ae:	0001c717          	auipc	a4,0x1c
    800099b2:	57a70713          	addi	a4,a4,1402 # 80025f28 <disk>
    800099b6:	fcc42683          	lw	a3,-52(s0)
    800099ba:	15000793          	li	a5,336
    800099be:	02f687b3          	mul	a5,a3,a5
    800099c2:	97ba                	add	a5,a5,a4
    800099c4:	6798                	ld	a4,8(a5)
    800099c6:	fd042783          	lw	a5,-48(s0)
    800099ca:	0792                	slli	a5,a5,0x4
    800099cc:	97ba                	add	a5,a5,a4
    800099ce:	4705                	li	a4,1
    800099d0:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    800099d4:	fd442603          	lw	a2,-44(s0)
    800099d8:	0001c717          	auipc	a4,0x1c
    800099dc:	55070713          	addi	a4,a4,1360 # 80025f28 <disk>
    800099e0:	fcc42683          	lw	a3,-52(s0)
    800099e4:	15000793          	li	a5,336
    800099e8:	02f687b3          	mul	a5,a3,a5
    800099ec:	97ba                	add	a5,a5,a4
    800099ee:	6798                	ld	a4,8(a5)
    800099f0:	fd042783          	lw	a5,-48(s0)
    800099f4:	0792                	slli	a5,a5,0x4
    800099f6:	97ba                	add	a5,a5,a4
    800099f8:	03061713          	slli	a4,a2,0x30
    800099fc:	9341                	srli	a4,a4,0x30
    800099fe:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    80009a02:	fc043783          	ld	a5,-64(s0)
    80009a06:	05878613          	addi	a2,a5,88
    80009a0a:	0001c717          	auipc	a4,0x1c
    80009a0e:	51e70713          	addi	a4,a4,1310 # 80025f28 <disk>
    80009a12:	fcc42683          	lw	a3,-52(s0)
    80009a16:	15000793          	li	a5,336
    80009a1a:	02f687b3          	mul	a5,a3,a5
    80009a1e:	97ba                	add	a5,a5,a4
    80009a20:	6798                	ld	a4,8(a5)
    80009a22:	fd442783          	lw	a5,-44(s0)
    80009a26:	0792                	slli	a5,a5,0x4
    80009a28:	97ba                	add	a5,a5,a4
    80009a2a:	8732                	mv	a4,a2
    80009a2c:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    80009a2e:	0001c717          	auipc	a4,0x1c
    80009a32:	4fa70713          	addi	a4,a4,1274 # 80025f28 <disk>
    80009a36:	fcc42683          	lw	a3,-52(s0)
    80009a3a:	15000793          	li	a5,336
    80009a3e:	02f687b3          	mul	a5,a3,a5
    80009a42:	97ba                	add	a5,a5,a4
    80009a44:	6798                	ld	a4,8(a5)
    80009a46:	fd442783          	lw	a5,-44(s0)
    80009a4a:	0792                	slli	a5,a5,0x4
    80009a4c:	97ba                	add	a5,a5,a4
    80009a4e:	40000713          	li	a4,1024
    80009a52:	c798                	sw	a4,8(a5)
  if(write)
    80009a54:	fc842783          	lw	a5,-56(s0)
    80009a58:	2781                	sext.w	a5,a5
    80009a5a:	c785                	beqz	a5,80009a82 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    80009a5c:	0001c717          	auipc	a4,0x1c
    80009a60:	4cc70713          	addi	a4,a4,1228 # 80025f28 <disk>
    80009a64:	fcc42683          	lw	a3,-52(s0)
    80009a68:	15000793          	li	a5,336
    80009a6c:	02f687b3          	mul	a5,a3,a5
    80009a70:	97ba                	add	a5,a5,a4
    80009a72:	6798                	ld	a4,8(a5)
    80009a74:	fd442783          	lw	a5,-44(s0)
    80009a78:	0792                	slli	a5,a5,0x4
    80009a7a:	97ba                	add	a5,a5,a4
    80009a7c:	00079623          	sh	zero,12(a5)
    80009a80:	a025                	j	80009aa8 <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009a82:	0001c717          	auipc	a4,0x1c
    80009a86:	4a670713          	addi	a4,a4,1190 # 80025f28 <disk>
    80009a8a:	fcc42683          	lw	a3,-52(s0)
    80009a8e:	15000793          	li	a5,336
    80009a92:	02f687b3          	mul	a5,a3,a5
    80009a96:	97ba                	add	a5,a5,a4
    80009a98:	6798                	ld	a4,8(a5)
    80009a9a:	fd442783          	lw	a5,-44(s0)
    80009a9e:	0792                	slli	a5,a5,0x4
    80009aa0:	97ba                	add	a5,a5,a4
    80009aa2:	4709                	li	a4,2
    80009aa4:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80009aa8:	0001c717          	auipc	a4,0x1c
    80009aac:	48070713          	addi	a4,a4,1152 # 80025f28 <disk>
    80009ab0:	fcc42683          	lw	a3,-52(s0)
    80009ab4:	15000793          	li	a5,336
    80009ab8:	02f687b3          	mul	a5,a3,a5
    80009abc:	97ba                	add	a5,a5,a4
    80009abe:	6798                	ld	a4,8(a5)
    80009ac0:	fd442783          	lw	a5,-44(s0)
    80009ac4:	0792                	slli	a5,a5,0x4
    80009ac6:	97ba                	add	a5,a5,a4
    80009ac8:	00c7d703          	lhu	a4,12(a5)
    80009acc:	0001c697          	auipc	a3,0x1c
    80009ad0:	45c68693          	addi	a3,a3,1116 # 80025f28 <disk>
    80009ad4:	fcc42603          	lw	a2,-52(s0)
    80009ad8:	15000793          	li	a5,336
    80009adc:	02f607b3          	mul	a5,a2,a5
    80009ae0:	97b6                	add	a5,a5,a3
    80009ae2:	6794                	ld	a3,8(a5)
    80009ae4:	fd442783          	lw	a5,-44(s0)
    80009ae8:	0792                	slli	a5,a5,0x4
    80009aea:	97b6                	add	a5,a5,a3
    80009aec:	00176713          	ori	a4,a4,1
    80009af0:	1742                	slli	a4,a4,0x30
    80009af2:	9341                	srli	a4,a4,0x30
    80009af4:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    80009af8:	fd842603          	lw	a2,-40(s0)
    80009afc:	0001c717          	auipc	a4,0x1c
    80009b00:	42c70713          	addi	a4,a4,1068 # 80025f28 <disk>
    80009b04:	fcc42683          	lw	a3,-52(s0)
    80009b08:	15000793          	li	a5,336
    80009b0c:	02f687b3          	mul	a5,a3,a5
    80009b10:	97ba                	add	a5,a5,a4
    80009b12:	6798                	ld	a4,8(a5)
    80009b14:	fd442783          	lw	a5,-44(s0)
    80009b18:	0792                	slli	a5,a5,0x4
    80009b1a:	97ba                	add	a5,a5,a4
    80009b1c:	03061713          	slli	a4,a2,0x30
    80009b20:	9341                	srli	a4,a4,0x30
    80009b22:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    80009b26:	fd042603          	lw	a2,-48(s0)
    80009b2a:	0001c697          	auipc	a3,0x1c
    80009b2e:	3fe68693          	addi	a3,a3,1022 # 80025f28 <disk>
    80009b32:	fcc42703          	lw	a4,-52(s0)
    80009b36:	87ba                	mv	a5,a4
    80009b38:	078a                	slli	a5,a5,0x2
    80009b3a:	97ba                	add	a5,a5,a4
    80009b3c:	078a                	slli	a5,a5,0x2
    80009b3e:	97ba                	add	a5,a5,a4
    80009b40:	97b2                	add	a5,a5,a2
    80009b42:	078d                	addi	a5,a5,3
    80009b44:	0792                	slli	a5,a5,0x4
    80009b46:	97b6                	add	a5,a5,a3
    80009b48:	577d                	li	a4,-1
    80009b4a:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009b4e:	fd042683          	lw	a3,-48(s0)
    80009b52:	fcc42703          	lw	a4,-52(s0)
    80009b56:	87ba                	mv	a5,a4
    80009b58:	078a                	slli	a5,a5,0x2
    80009b5a:	97ba                	add	a5,a5,a4
    80009b5c:	078a                	slli	a5,a5,0x2
    80009b5e:	97ba                	add	a5,a5,a4
    80009b60:	97b6                	add	a5,a5,a3
    80009b62:	078d                	addi	a5,a5,3
    80009b64:	00479713          	slli	a4,a5,0x4
    80009b68:	0001c797          	auipc	a5,0x1c
    80009b6c:	3c078793          	addi	a5,a5,960 # 80025f28 <disk>
    80009b70:	97ba                	add	a5,a5,a4
    80009b72:	00878613          	addi	a2,a5,8
    80009b76:	0001c717          	auipc	a4,0x1c
    80009b7a:	3b270713          	addi	a4,a4,946 # 80025f28 <disk>
    80009b7e:	fcc42683          	lw	a3,-52(s0)
    80009b82:	15000793          	li	a5,336
    80009b86:	02f687b3          	mul	a5,a3,a5
    80009b8a:	97ba                	add	a5,a5,a4
    80009b8c:	6798                	ld	a4,8(a5)
    80009b8e:	fd842783          	lw	a5,-40(s0)
    80009b92:	0792                	slli	a5,a5,0x4
    80009b94:	97ba                	add	a5,a5,a4
    80009b96:	8732                	mv	a4,a2
    80009b98:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    80009b9a:	0001c717          	auipc	a4,0x1c
    80009b9e:	38e70713          	addi	a4,a4,910 # 80025f28 <disk>
    80009ba2:	fcc42683          	lw	a3,-52(s0)
    80009ba6:	15000793          	li	a5,336
    80009baa:	02f687b3          	mul	a5,a3,a5
    80009bae:	97ba                	add	a5,a5,a4
    80009bb0:	6798                	ld	a4,8(a5)
    80009bb2:	fd842783          	lw	a5,-40(s0)
    80009bb6:	0792                	slli	a5,a5,0x4
    80009bb8:	97ba                	add	a5,a5,a4
    80009bba:	4705                	li	a4,1
    80009bbc:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009bbe:	0001c717          	auipc	a4,0x1c
    80009bc2:	36a70713          	addi	a4,a4,874 # 80025f28 <disk>
    80009bc6:	fcc42683          	lw	a3,-52(s0)
    80009bca:	15000793          	li	a5,336
    80009bce:	02f687b3          	mul	a5,a3,a5
    80009bd2:	97ba                	add	a5,a5,a4
    80009bd4:	6798                	ld	a4,8(a5)
    80009bd6:	fd842783          	lw	a5,-40(s0)
    80009bda:	0792                	slli	a5,a5,0x4
    80009bdc:	97ba                	add	a5,a5,a4
    80009bde:	4709                	li	a4,2
    80009be0:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009be4:	0001c717          	auipc	a4,0x1c
    80009be8:	34470713          	addi	a4,a4,836 # 80025f28 <disk>
    80009bec:	fcc42683          	lw	a3,-52(s0)
    80009bf0:	15000793          	li	a5,336
    80009bf4:	02f687b3          	mul	a5,a3,a5
    80009bf8:	97ba                	add	a5,a5,a4
    80009bfa:	6798                	ld	a4,8(a5)
    80009bfc:	fd842783          	lw	a5,-40(s0)
    80009c00:	0792                	slli	a5,a5,0x4
    80009c02:	97ba                	add	a5,a5,a4
    80009c04:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009c08:	fc043783          	ld	a5,-64(s0)
    80009c0c:	4705                	li	a4,1
    80009c0e:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    80009c10:	fd042603          	lw	a2,-48(s0)
    80009c14:	0001c697          	auipc	a3,0x1c
    80009c18:	31468693          	addi	a3,a3,788 # 80025f28 <disk>
    80009c1c:	fcc42703          	lw	a4,-52(s0)
    80009c20:	87ba                	mv	a5,a4
    80009c22:	078a                	slli	a5,a5,0x2
    80009c24:	97ba                	add	a5,a5,a4
    80009c26:	078a                	slli	a5,a5,0x2
    80009c28:	97ba                	add	a5,a5,a4
    80009c2a:	97b2                	add	a5,a5,a2
    80009c2c:	078d                	addi	a5,a5,3
    80009c2e:	0792                	slli	a5,a5,0x4
    80009c30:	97b6                	add	a5,a5,a3
    80009c32:	fc043703          	ld	a4,-64(s0)
    80009c36:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009c38:	fd042583          	lw	a1,-48(s0)
    80009c3c:	0001c717          	auipc	a4,0x1c
    80009c40:	2ec70713          	addi	a4,a4,748 # 80025f28 <disk>
    80009c44:	fcc42683          	lw	a3,-52(s0)
    80009c48:	15000793          	li	a5,336
    80009c4c:	02f687b3          	mul	a5,a3,a5
    80009c50:	97ba                	add	a5,a5,a4
    80009c52:	6b94                	ld	a3,16(a5)
    80009c54:	0001c717          	auipc	a4,0x1c
    80009c58:	2d470713          	addi	a4,a4,724 # 80025f28 <disk>
    80009c5c:	fcc42603          	lw	a2,-52(s0)
    80009c60:	15000793          	li	a5,336
    80009c64:	02f607b3          	mul	a5,a2,a5
    80009c68:	97ba                	add	a5,a5,a4
    80009c6a:	6b9c                	ld	a5,16(a5)
    80009c6c:	0027d783          	lhu	a5,2(a5)
    80009c70:	2781                	sext.w	a5,a5
    80009c72:	8b9d                	andi	a5,a5,7
    80009c74:	2781                	sext.w	a5,a5
    80009c76:	03059713          	slli	a4,a1,0x30
    80009c7a:	9341                	srli	a4,a4,0x30
    80009c7c:	0786                	slli	a5,a5,0x1
    80009c7e:	97b6                	add	a5,a5,a3
    80009c80:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009c84:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009c88:	0001c717          	auipc	a4,0x1c
    80009c8c:	2a070713          	addi	a4,a4,672 # 80025f28 <disk>
    80009c90:	fcc42683          	lw	a3,-52(s0)
    80009c94:	15000793          	li	a5,336
    80009c98:	02f687b3          	mul	a5,a3,a5
    80009c9c:	97ba                	add	a5,a5,a4
    80009c9e:	6b9c                	ld	a5,16(a5)
    80009ca0:	0027d703          	lhu	a4,2(a5)
    80009ca4:	0001c697          	auipc	a3,0x1c
    80009ca8:	28468693          	addi	a3,a3,644 # 80025f28 <disk>
    80009cac:	fcc42603          	lw	a2,-52(s0)
    80009cb0:	15000793          	li	a5,336
    80009cb4:	02f607b3          	mul	a5,a2,a5
    80009cb8:	97b6                	add	a5,a5,a3
    80009cba:	6b9c                	ld	a5,16(a5)
    80009cbc:	2705                	addiw	a4,a4,1
    80009cbe:	1742                	slli	a4,a4,0x30
    80009cc0:	9341                	srli	a4,a4,0x30
    80009cc2:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009cc6:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009cca:	fcc42703          	lw	a4,-52(s0)
    80009cce:	67c1                	lui	a5,0x10
    80009cd0:	0785                	addi	a5,a5,1
    80009cd2:	97ba                	add	a5,a5,a4
    80009cd4:	07b2                	slli	a5,a5,0xc
    80009cd6:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009cda:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009cde:	a871                	j	80009d7a <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009ce0:	fbc42783          	lw	a5,-68(s0)
    80009ce4:	2781                	sext.w	a5,a5
    80009ce6:	e795                	bnez	a5,80009d12 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009ce8:	fcc42703          	lw	a4,-52(s0)
    80009cec:	15000793          	li	a5,336
    80009cf0:	02f707b3          	mul	a5,a4,a5
    80009cf4:	13078713          	addi	a4,a5,304
    80009cf8:	0001c797          	auipc	a5,0x1c
    80009cfc:	23078793          	addi	a5,a5,560 # 80025f28 <disk>
    80009d00:	97ba                	add	a5,a5,a4
    80009d02:	85be                	mv	a1,a5
    80009d04:	fc043503          	ld	a0,-64(s0)
    80009d08:	ffffa097          	auipc	ra,0xffffa
    80009d0c:	8ca080e7          	jalr	-1846(ra) # 800035d2 <sleep>
    80009d10:	a0ad                	j	80009d7a <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009d12:	fcc42703          	lw	a4,-52(s0)
    80009d16:	15000793          	li	a5,336
    80009d1a:	02f707b3          	mul	a5,a4,a5
    80009d1e:	13078713          	addi	a4,a5,304
    80009d22:	0001c797          	auipc	a5,0x1c
    80009d26:	20678793          	addi	a5,a5,518 # 80025f28 <disk>
    80009d2a:	97ba                	add	a5,a5,a4
    80009d2c:	853e                	mv	a0,a5
    80009d2e:	ffff7097          	auipc	ra,0xffff7
    80009d32:	672080e7          	jalr	1650(ra) # 800013a0 <release>
        intr_on();
    80009d36:	fffff097          	auipc	ra,0xfffff
    80009d3a:	eea080e7          	jalr	-278(ra) # 80008c20 <intr_on>
        while(b->disk == 1);
    80009d3e:	0001                	nop
    80009d40:	fc043783          	ld	a5,-64(s0)
    80009d44:	43dc                	lw	a5,4(a5)
    80009d46:	873e                	mv	a4,a5
    80009d48:	4785                	li	a5,1
    80009d4a:	fef70be3          	beq	a4,a5,80009d40 <virtio_disk_rw+0x580>
        intr_off();
    80009d4e:	fffff097          	auipc	ra,0xfffff
    80009d52:	efc080e7          	jalr	-260(ra) # 80008c4a <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009d56:	fcc42703          	lw	a4,-52(s0)
    80009d5a:	15000793          	li	a5,336
    80009d5e:	02f707b3          	mul	a5,a4,a5
    80009d62:	13078713          	addi	a4,a5,304
    80009d66:	0001c797          	auipc	a5,0x1c
    80009d6a:	1c278793          	addi	a5,a5,450 # 80025f28 <disk>
    80009d6e:	97ba                	add	a5,a5,a4
    80009d70:	853e                	mv	a0,a5
    80009d72:	ffff7097          	auipc	ra,0xffff7
    80009d76:	5ca080e7          	jalr	1482(ra) # 8000133c <acquire>
  while(b->disk == 1) {
    80009d7a:	fc043783          	ld	a5,-64(s0)
    80009d7e:	43dc                	lw	a5,4(a5)
    80009d80:	873e                	mv	a4,a5
    80009d82:	4785                	li	a5,1
    80009d84:	f4f70ee3          	beq	a4,a5,80009ce0 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    80009d88:	fd042603          	lw	a2,-48(s0)
    80009d8c:	0001c697          	auipc	a3,0x1c
    80009d90:	19c68693          	addi	a3,a3,412 # 80025f28 <disk>
    80009d94:	fcc42703          	lw	a4,-52(s0)
    80009d98:	87ba                	mv	a5,a4
    80009d9a:	078a                	slli	a5,a5,0x2
    80009d9c:	97ba                	add	a5,a5,a4
    80009d9e:	078a                	slli	a5,a5,0x2
    80009da0:	97ba                	add	a5,a5,a4
    80009da2:	97b2                	add	a5,a5,a2
    80009da4:	078d                	addi	a5,a5,3
    80009da6:	0792                	slli	a5,a5,0x4
    80009da8:	97b6                	add	a5,a5,a3
    80009daa:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    80009dae:	fd042703          	lw	a4,-48(s0)
    80009db2:	fcc42783          	lw	a5,-52(s0)
    80009db6:	85ba                	mv	a1,a4
    80009db8:	853e                	mv	a0,a5
    80009dba:	00000097          	auipc	ra,0x0
    80009dbe:	8b8080e7          	jalr	-1864(ra) # 80009672 <free_chain>

  release(&disk[id].vdisk_lock);
    80009dc2:	fcc42703          	lw	a4,-52(s0)
    80009dc6:	15000793          	li	a5,336
    80009dca:	02f707b3          	mul	a5,a4,a5
    80009dce:	13078713          	addi	a4,a5,304
    80009dd2:	0001c797          	auipc	a5,0x1c
    80009dd6:	15678793          	addi	a5,a5,342 # 80025f28 <disk>
    80009dda:	97ba                	add	a5,a5,a4
    80009ddc:	853e                	mv	a0,a5
    80009dde:	ffff7097          	auipc	ra,0xffff7
    80009de2:	5c2080e7          	jalr	1474(ra) # 800013a0 <release>
}
    80009de6:	0001                	nop
    80009de8:	60a6                	ld	ra,72(sp)
    80009dea:	6406                	ld	s0,64(sp)
    80009dec:	6161                	addi	sp,sp,80
    80009dee:	8082                	ret

0000000080009df0 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009df0:	7179                	addi	sp,sp,-48
    80009df2:	f406                	sd	ra,40(sp)
    80009df4:	f022                	sd	s0,32(sp)
    80009df6:	1800                	addi	s0,sp,48
    80009df8:	87aa                	mv	a5,a0
    80009dfa:	fcb43823          	sd	a1,-48(s0)
    80009dfe:	8732                	mv	a4,a2
    80009e00:	fcf42e23          	sw	a5,-36(s0)
    80009e04:	87ba                	mv	a5,a4
    80009e06:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009e0a:	0001c797          	auipc	a5,0x1c
    80009e0e:	3be78793          	addi	a5,a5,958 # 800261c8 <swap_buffer>
    80009e12:	639c                	ld	a5,0(a5)
    80009e14:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009e18:	fdc42703          	lw	a4,-36(s0)
    80009e1c:	fe843783          	ld	a5,-24(s0)
    80009e20:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    80009e22:	fe843783          	ld	a5,-24(s0)
    80009e26:	05878793          	addi	a5,a5,88
    80009e2a:	40000613          	li	a2,1024
    80009e2e:	fd043583          	ld	a1,-48(s0)
    80009e32:	853e                	mv	a0,a5
    80009e34:	ffff7097          	auipc	ra,0xffff7
    80009e38:	7c0080e7          	jalr	1984(ra) # 800015f4 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    80009e3c:	fd842783          	lw	a5,-40(s0)
    80009e40:	86be                	mv	a3,a5
    80009e42:	4605                	li	a2,1
    80009e44:	fe843583          	ld	a1,-24(s0)
    80009e48:	4505                	li	a0,1
    80009e4a:	00000097          	auipc	ra,0x0
    80009e4e:	976080e7          	jalr	-1674(ra) # 800097c0 <virtio_disk_rw>
}
    80009e52:	0001                	nop
    80009e54:	70a2                	ld	ra,40(sp)
    80009e56:	7402                	ld	s0,32(sp)
    80009e58:	6145                	addi	sp,sp,48
    80009e5a:	8082                	ret

0000000080009e5c <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009e5c:	7179                	addi	sp,sp,-48
    80009e5e:	f406                	sd	ra,40(sp)
    80009e60:	f022                	sd	s0,32(sp)
    80009e62:	1800                	addi	s0,sp,48
    80009e64:	87aa                	mv	a5,a0
    80009e66:	fcb43823          	sd	a1,-48(s0)
    80009e6a:	8732                	mv	a4,a2
    80009e6c:	fcf42e23          	sw	a5,-36(s0)
    80009e70:	87ba                	mv	a5,a4
    80009e72:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009e76:	0001c797          	auipc	a5,0x1c
    80009e7a:	35278793          	addi	a5,a5,850 # 800261c8 <swap_buffer>
    80009e7e:	639c                	ld	a5,0(a5)
    80009e80:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009e84:	fdc42703          	lw	a4,-36(s0)
    80009e88:	fe843783          	ld	a5,-24(s0)
    80009e8c:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    80009e8e:	fd842783          	lw	a5,-40(s0)
    80009e92:	86be                	mv	a3,a5
    80009e94:	4601                	li	a2,0
    80009e96:	fe843583          	ld	a1,-24(s0)
    80009e9a:	4505                	li	a0,1
    80009e9c:	00000097          	auipc	ra,0x0
    80009ea0:	924080e7          	jalr	-1756(ra) # 800097c0 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009ea4:	fe843783          	ld	a5,-24(s0)
    80009ea8:	05878793          	addi	a5,a5,88
    80009eac:	40000613          	li	a2,1024
    80009eb0:	85be                	mv	a1,a5
    80009eb2:	fd043503          	ld	a0,-48(s0)
    80009eb6:	ffff7097          	auipc	ra,0xffff7
    80009eba:	73e080e7          	jalr	1854(ra) # 800015f4 <memmove>
}
    80009ebe:	0001                	nop
    80009ec0:	70a2                	ld	ra,40(sp)
    80009ec2:	7402                	ld	s0,32(sp)
    80009ec4:	6145                	addi	sp,sp,48
    80009ec6:	8082                	ret

0000000080009ec8 <deallocate_page>:

void deallocate_page(int pageno)
{
    80009ec8:	1101                	addi	sp,sp,-32
    80009eca:	ec06                	sd	ra,24(sp)
    80009ecc:	e822                	sd	s0,16(sp)
    80009ece:	1000                	addi	s0,sp,32
    80009ed0:	87aa                	mv	a5,a0
    80009ed2:	fef42623          	sw	a5,-20(s0)
  clearBit(pageno);
    80009ed6:	fec42783          	lw	a5,-20(s0)
    80009eda:	853e                	mv	a0,a5
    80009edc:	fffff097          	auipc	ra,0xfffff
    80009ee0:	df8080e7          	jalr	-520(ra) # 80008cd4 <clearBit>
}
    80009ee4:	0001                	nop
    80009ee6:	60e2                	ld	ra,24(sp)
    80009ee8:	6442                	ld	s0,16(sp)
    80009eea:	6105                	addi	sp,sp,32
    80009eec:	8082                	ret

0000000080009eee <write_page_to_disk>:

int write_page_to_disk(uchar data[4096]) {
    80009eee:	7179                	addi	sp,sp,-48
    80009ef0:	f406                	sd	ra,40(sp)
    80009ef2:	f022                	sd	s0,32(sp)
    80009ef4:	1800                	addi	s0,sp,48
    80009ef6:	fca43c23          	sd	a0,-40(s0)
  int pageno = takeFirstFreePage();
    80009efa:	fffff097          	auipc	ra,0xfffff
    80009efe:	ed6080e7          	jalr	-298(ra) # 80008dd0 <takeFirstFreePage>
    80009f02:	87aa                	mv	a5,a0
    80009f04:	fef42423          	sw	a5,-24(s0)
  if(pageno < 0) return -1;
    80009f08:	fe842783          	lw	a5,-24(s0)
    80009f0c:	2781                	sext.w	a5,a5
    80009f0e:	0007d463          	bgez	a5,80009f16 <write_page_to_disk+0x28>
    80009f12:	57fd                	li	a5,-1
    80009f14:	a8b9                	j	80009f72 <write_page_to_disk+0x84>

  int blockno = pageno*4;
    80009f16:	fe842783          	lw	a5,-24(s0)
    80009f1a:	0027979b          	slliw	a5,a5,0x2
    80009f1e:	fef42223          	sw	a5,-28(s0)
  for(int i = 0; i < 4; i++)
    80009f22:	fe042623          	sw	zero,-20(s0)
    80009f26:	a82d                	j	80009f60 <write_page_to_disk+0x72>
  {
    write_block(blockno + i, data + i*1024, 0);
    80009f28:	fe442703          	lw	a4,-28(s0)
    80009f2c:	fec42783          	lw	a5,-20(s0)
    80009f30:	9fb9                	addw	a5,a5,a4
    80009f32:	0007871b          	sext.w	a4,a5
    80009f36:	fec42783          	lw	a5,-20(s0)
    80009f3a:	00a7979b          	slliw	a5,a5,0xa
    80009f3e:	2781                	sext.w	a5,a5
    80009f40:	86be                	mv	a3,a5
    80009f42:	fd843783          	ld	a5,-40(s0)
    80009f46:	97b6                	add	a5,a5,a3
    80009f48:	4601                	li	a2,0
    80009f4a:	85be                	mv	a1,a5
    80009f4c:	853a                	mv	a0,a4
    80009f4e:	00000097          	auipc	ra,0x0
    80009f52:	ea2080e7          	jalr	-350(ra) # 80009df0 <write_block>
  for(int i = 0; i < 4; i++)
    80009f56:	fec42783          	lw	a5,-20(s0)
    80009f5a:	2785                	addiw	a5,a5,1
    80009f5c:	fef42623          	sw	a5,-20(s0)
    80009f60:	fec42783          	lw	a5,-20(s0)
    80009f64:	0007871b          	sext.w	a4,a5
    80009f68:	478d                	li	a5,3
    80009f6a:	fae7dfe3          	bge	a5,a4,80009f28 <write_page_to_disk+0x3a>
  }

  return pageno;
    80009f6e:	fe842783          	lw	a5,-24(s0)
}
    80009f72:	853e                	mv	a0,a5
    80009f74:	70a2                	ld	ra,40(sp)
    80009f76:	7402                	ld	s0,32(sp)
    80009f78:	6145                	addi	sp,sp,48
    80009f7a:	8082                	ret

0000000080009f7c <take_page_from_disk>:

void take_page_from_disk(int diskpageno, uchar dest[4096]){
    80009f7c:	7179                	addi	sp,sp,-48
    80009f7e:	f406                	sd	ra,40(sp)
    80009f80:	f022                	sd	s0,32(sp)
    80009f82:	1800                	addi	s0,sp,48
    80009f84:	87aa                	mv	a5,a0
    80009f86:	fcb43823          	sd	a1,-48(s0)
    80009f8a:	fcf42e23          	sw	a5,-36(s0)
  int blockno = diskpageno * 4;
    80009f8e:	fdc42783          	lw	a5,-36(s0)
    80009f92:	0027979b          	slliw	a5,a5,0x2
    80009f96:	fef42423          	sw	a5,-24(s0)
  for(int i = 0; i < 4; i++)
    80009f9a:	fe042623          	sw	zero,-20(s0)
    80009f9e:	a82d                	j	80009fd8 <take_page_from_disk+0x5c>
  {
    read_block(blockno + i, dest + i * 1024, 0);
    80009fa0:	fe842703          	lw	a4,-24(s0)
    80009fa4:	fec42783          	lw	a5,-20(s0)
    80009fa8:	9fb9                	addw	a5,a5,a4
    80009faa:	0007871b          	sext.w	a4,a5
    80009fae:	fec42783          	lw	a5,-20(s0)
    80009fb2:	00a7979b          	slliw	a5,a5,0xa
    80009fb6:	2781                	sext.w	a5,a5
    80009fb8:	86be                	mv	a3,a5
    80009fba:	fd043783          	ld	a5,-48(s0)
    80009fbe:	97b6                	add	a5,a5,a3
    80009fc0:	4601                	li	a2,0
    80009fc2:	85be                	mv	a1,a5
    80009fc4:	853a                	mv	a0,a4
    80009fc6:	00000097          	auipc	ra,0x0
    80009fca:	e96080e7          	jalr	-362(ra) # 80009e5c <read_block>
  for(int i = 0; i < 4; i++)
    80009fce:	fec42783          	lw	a5,-20(s0)
    80009fd2:	2785                	addiw	a5,a5,1
    80009fd4:	fef42623          	sw	a5,-20(s0)
    80009fd8:	fec42783          	lw	a5,-20(s0)
    80009fdc:	0007871b          	sext.w	a4,a5
    80009fe0:	478d                	li	a5,3
    80009fe2:	fae7dfe3          	bge	a5,a4,80009fa0 <take_page_from_disk+0x24>
  }
  deallocate_page(diskpageno);
    80009fe6:	fdc42783          	lw	a5,-36(s0)
    80009fea:	853e                	mv	a0,a5
    80009fec:	00000097          	auipc	ra,0x0
    80009ff0:	edc080e7          	jalr	-292(ra) # 80009ec8 <deallocate_page>
}
    80009ff4:	0001                	nop
    80009ff6:	70a2                	ld	ra,40(sp)
    80009ff8:	7402                	ld	s0,32(sp)
    80009ffa:	6145                	addi	sp,sp,48
    80009ffc:	8082                	ret

0000000080009ffe <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    80009ffe:	7179                	addi	sp,sp,-48
    8000a000:	f406                	sd	ra,40(sp)
    8000a002:	f022                	sd	s0,32(sp)
    8000a004:	1800                	addi	s0,sp,48
    8000a006:	87aa                	mv	a5,a0
    8000a008:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    8000a00c:	fdc42703          	lw	a4,-36(s0)
    8000a010:	15000793          	li	a5,336
    8000a014:	02f707b3          	mul	a5,a4,a5
    8000a018:	13078713          	addi	a4,a5,304
    8000a01c:	0001c797          	auipc	a5,0x1c
    8000a020:	f0c78793          	addi	a5,a5,-244 # 80025f28 <disk>
    8000a024:	97ba                	add	a5,a5,a4
    8000a026:	853e                	mv	a0,a5
    8000a028:	ffff7097          	auipc	ra,0xffff7
    8000a02c:	314080e7          	jalr	788(ra) # 8000133c <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    8000a030:	fdc42703          	lw	a4,-36(s0)
    8000a034:	67c1                	lui	a5,0x10
    8000a036:	0785                	addi	a5,a5,1
    8000a038:	97ba                	add	a5,a5,a4
    8000a03a:	07b2                	slli	a5,a5,0xc
    8000a03c:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    8000a040:	439c                	lw	a5,0(a5)
    8000a042:	0007869b          	sext.w	a3,a5
    8000a046:	fdc42703          	lw	a4,-36(s0)
    8000a04a:	67c1                	lui	a5,0x10
    8000a04c:	0785                	addi	a5,a5,1
    8000a04e:	97ba                	add	a5,a5,a4
    8000a050:	07b2                	slli	a5,a5,0xc
    8000a052:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    8000a056:	873e                	mv	a4,a5
    8000a058:	87b6                	mv	a5,a3
    8000a05a:	8b8d                	andi	a5,a5,3
    8000a05c:	2781                	sext.w	a5,a5
    8000a05e:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    8000a060:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    8000a064:	aa05                	j	8000a194 <virtio_disk_intr+0x196>
    __sync_synchronize();
    8000a066:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    8000a06a:	0001c717          	auipc	a4,0x1c
    8000a06e:	ebe70713          	addi	a4,a4,-322 # 80025f28 <disk>
    8000a072:	fdc42683          	lw	a3,-36(s0)
    8000a076:	15000793          	li	a5,336
    8000a07a:	02f687b3          	mul	a5,a3,a5
    8000a07e:	97ba                	add	a5,a5,a4
    8000a080:	6f98                	ld	a4,24(a5)
    8000a082:	0001c697          	auipc	a3,0x1c
    8000a086:	ea668693          	addi	a3,a3,-346 # 80025f28 <disk>
    8000a08a:	fdc42603          	lw	a2,-36(s0)
    8000a08e:	15000793          	li	a5,336
    8000a092:	02f607b3          	mul	a5,a2,a5
    8000a096:	97b6                	add	a5,a5,a3
    8000a098:	0287d783          	lhu	a5,40(a5)
    8000a09c:	2781                	sext.w	a5,a5
    8000a09e:	8b9d                	andi	a5,a5,7
    8000a0a0:	2781                	sext.w	a5,a5
    8000a0a2:	078e                	slli	a5,a5,0x3
    8000a0a4:	97ba                	add	a5,a5,a4
    8000a0a6:	43dc                	lw	a5,4(a5)
    8000a0a8:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    8000a0ac:	0001c697          	auipc	a3,0x1c
    8000a0b0:	e7c68693          	addi	a3,a3,-388 # 80025f28 <disk>
    8000a0b4:	fec42603          	lw	a2,-20(s0)
    8000a0b8:	fdc42703          	lw	a4,-36(s0)
    8000a0bc:	87ba                	mv	a5,a4
    8000a0be:	078a                	slli	a5,a5,0x2
    8000a0c0:	97ba                	add	a5,a5,a4
    8000a0c2:	078a                	slli	a5,a5,0x2
    8000a0c4:	97ba                	add	a5,a5,a4
    8000a0c6:	97b2                	add	a5,a5,a2
    8000a0c8:	078d                	addi	a5,a5,3
    8000a0ca:	0792                	slli	a5,a5,0x4
    8000a0cc:	97b6                	add	a5,a5,a3
    8000a0ce:	0087c783          	lbu	a5,8(a5)
    8000a0d2:	c79d                	beqz	a5,8000a100 <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    8000a0d4:	0001c717          	auipc	a4,0x1c
    8000a0d8:	e5470713          	addi	a4,a4,-428 # 80025f28 <disk>
    8000a0dc:	fdc42683          	lw	a3,-36(s0)
    8000a0e0:	15000793          	li	a5,336
    8000a0e4:	02f687b3          	mul	a5,a3,a5
    8000a0e8:	97ba                	add	a5,a5,a4
    8000a0ea:	639c                	ld	a5,0(a5)
    8000a0ec:	00002617          	auipc	a2,0x2
    8000a0f0:	6cc60613          	addi	a2,a2,1740 # 8000c7b8 <etext+0x7b8>
    8000a0f4:	85be                	mv	a1,a5
    8000a0f6:	4509                	li	a0,2
    8000a0f8:	ffff7097          	auipc	ra,0xffff7
    8000a0fc:	be6080e7          	jalr	-1050(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    8000a100:	0001c697          	auipc	a3,0x1c
    8000a104:	e2868693          	addi	a3,a3,-472 # 80025f28 <disk>
    8000a108:	fec42603          	lw	a2,-20(s0)
    8000a10c:	fdc42703          	lw	a4,-36(s0)
    8000a110:	87ba                	mv	a5,a4
    8000a112:	078a                	slli	a5,a5,0x2
    8000a114:	97ba                	add	a5,a5,a4
    8000a116:	078a                	slli	a5,a5,0x2
    8000a118:	97ba                	add	a5,a5,a4
    8000a11a:	97b2                	add	a5,a5,a2
    8000a11c:	078d                	addi	a5,a5,3
    8000a11e:	0792                	slli	a5,a5,0x4
    8000a120:	97b6                	add	a5,a5,a3
    8000a122:	639c                	ld	a5,0(a5)
    8000a124:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    8000a128:	fe043783          	ld	a5,-32(s0)
    8000a12c:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    8000a130:	0001c717          	auipc	a4,0x1c
    8000a134:	df870713          	addi	a4,a4,-520 # 80025f28 <disk>
    8000a138:	fdc42683          	lw	a3,-36(s0)
    8000a13c:	15000793          	li	a5,336
    8000a140:	02f687b3          	mul	a5,a3,a5
    8000a144:	97ba                	add	a5,a5,a4
    8000a146:	1487a783          	lw	a5,328(a5)
    8000a14a:	e799                	bnez	a5,8000a158 <virtio_disk_intr+0x15a>
        wakeup(b);
    8000a14c:	fe043503          	ld	a0,-32(s0)
    8000a150:	ffff9097          	auipc	ra,0xffff9
    8000a154:	4fe080e7          	jalr	1278(ra) # 8000364e <wakeup>
    }

    disk[id].used_idx += 1;
    8000a158:	0001c717          	auipc	a4,0x1c
    8000a15c:	dd070713          	addi	a4,a4,-560 # 80025f28 <disk>
    8000a160:	fdc42683          	lw	a3,-36(s0)
    8000a164:	15000793          	li	a5,336
    8000a168:	02f687b3          	mul	a5,a3,a5
    8000a16c:	97ba                	add	a5,a5,a4
    8000a16e:	0287d783          	lhu	a5,40(a5)
    8000a172:	2785                	addiw	a5,a5,1
    8000a174:	03079713          	slli	a4,a5,0x30
    8000a178:	9341                	srli	a4,a4,0x30
    8000a17a:	0001c697          	auipc	a3,0x1c
    8000a17e:	dae68693          	addi	a3,a3,-594 # 80025f28 <disk>
    8000a182:	fdc42603          	lw	a2,-36(s0)
    8000a186:	15000793          	li	a5,336
    8000a18a:	02f607b3          	mul	a5,a2,a5
    8000a18e:	97b6                	add	a5,a5,a3
    8000a190:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    8000a194:	0001c717          	auipc	a4,0x1c
    8000a198:	d9470713          	addi	a4,a4,-620 # 80025f28 <disk>
    8000a19c:	fdc42683          	lw	a3,-36(s0)
    8000a1a0:	15000793          	li	a5,336
    8000a1a4:	02f687b3          	mul	a5,a3,a5
    8000a1a8:	97ba                	add	a5,a5,a4
    8000a1aa:	0287d603          	lhu	a2,40(a5)
    8000a1ae:	0001c717          	auipc	a4,0x1c
    8000a1b2:	d7a70713          	addi	a4,a4,-646 # 80025f28 <disk>
    8000a1b6:	fdc42683          	lw	a3,-36(s0)
    8000a1ba:	15000793          	li	a5,336
    8000a1be:	02f687b3          	mul	a5,a3,a5
    8000a1c2:	97ba                	add	a5,a5,a4
    8000a1c4:	6f9c                	ld	a5,24(a5)
    8000a1c6:	0027d783          	lhu	a5,2(a5)
    8000a1ca:	0006071b          	sext.w	a4,a2
    8000a1ce:	2781                	sext.w	a5,a5
    8000a1d0:	e8f71be3          	bne	a4,a5,8000a066 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    8000a1d4:	fdc42703          	lw	a4,-36(s0)
    8000a1d8:	15000793          	li	a5,336
    8000a1dc:	02f707b3          	mul	a5,a4,a5
    8000a1e0:	13078713          	addi	a4,a5,304
    8000a1e4:	0001c797          	auipc	a5,0x1c
    8000a1e8:	d4478793          	addi	a5,a5,-700 # 80025f28 <disk>
    8000a1ec:	97ba                	add	a5,a5,a4
    8000a1ee:	853e                	mv	a0,a5
    8000a1f0:	ffff7097          	auipc	ra,0xffff7
    8000a1f4:	1b0080e7          	jalr	432(ra) # 800013a0 <release>
}
    8000a1f8:	0001                	nop
    8000a1fa:	70a2                	ld	ra,40(sp)
    8000a1fc:	7402                	ld	s0,32(sp)
    8000a1fe:	6145                	addi	sp,sp,48
    8000a200:	8082                	ret

000000008000a202 <sfence_vma>:
{
    8000a202:	1141                	addi	sp,sp,-16
    8000a204:	e422                	sd	s0,8(sp)
    8000a206:	0800                	addi	s0,sp,16
  asm volatile("sfence.vma zero, zero");
    8000a208:	12000073          	sfence.vma
}
    8000a20c:	0001                	nop
    8000a20e:	6422                	ld	s0,8(sp)
    8000a210:	0141                	addi	sp,sp,16
    8000a212:	8082                	ret

000000008000a214 <ispteready>:

static struct lrupinfo lrupages[RAM_PAGES_COUNT] = {{0} };
struct spinlock lrupageslock;

int ispteready(pte_t *pte)
{
    8000a214:	1101                	addi	sp,sp,-32
    8000a216:	ec22                	sd	s0,24(sp)
    8000a218:	1000                	addi	s0,sp,32
    8000a21a:	fea43423          	sd	a0,-24(s0)
  return (*pte & PTE_V) && !(*pte & PTE_PENDING_DISK_OPERATION);
    8000a21e:	fe843783          	ld	a5,-24(s0)
    8000a222:	639c                	ld	a5,0(a5)
    8000a224:	8b85                	andi	a5,a5,1
    8000a226:	cb89                	beqz	a5,8000a238 <ispteready+0x24>
    8000a228:	fe843783          	ld	a5,-24(s0)
    8000a22c:	639c                	ld	a5,0(a5)
    8000a22e:	2007f793          	andi	a5,a5,512
    8000a232:	e399                	bnez	a5,8000a238 <ispteready+0x24>
    8000a234:	4785                	li	a5,1
    8000a236:	a011                	j	8000a23a <ispteready+0x26>
    8000a238:	4781                	li	a5,0
}
    8000a23a:	853e                	mv	a0,a5
    8000a23c:	6462                	ld	s0,24(sp)
    8000a23e:	6105                	addi	sp,sp,32
    8000a240:	8082                	ret

000000008000a242 <getfirstfreelrupage>:

struct lrupinfo*
getfirstfreelrupage()
{
    8000a242:	1101                	addi	sp,sp,-32
    8000a244:	ec22                	sd	s0,24(sp)
    8000a246:	1000                	addi	s0,sp,32
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a248:	fe043423          	sd	zero,-24(s0)
    8000a24c:	a815                	j	8000a280 <getfirstfreelrupage+0x3e>
  {
    if(lrupages[i].pte == 0)
    8000a24e:	0001c717          	auipc	a4,0x1c
    8000a252:	f9a70713          	addi	a4,a4,-102 # 800261e8 <lrupages>
    8000a256:	fe843783          	ld	a5,-24(s0)
    8000a25a:	0796                	slli	a5,a5,0x5
    8000a25c:	97ba                	add	a5,a5,a4
    8000a25e:	679c                	ld	a5,8(a5)
    8000a260:	eb99                	bnez	a5,8000a276 <getfirstfreelrupage+0x34>
    {
      return &(lrupages[i]);
    8000a262:	fe843783          	ld	a5,-24(s0)
    8000a266:	00579713          	slli	a4,a5,0x5
    8000a26a:	0001c797          	auipc	a5,0x1c
    8000a26e:	f7e78793          	addi	a5,a5,-130 # 800261e8 <lrupages>
    8000a272:	97ba                	add	a5,a5,a4
    8000a274:	a821                	j	8000a28c <getfirstfreelrupage+0x4a>
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a276:	fe843783          	ld	a5,-24(s0)
    8000a27a:	0785                	addi	a5,a5,1
    8000a27c:	fef43423          	sd	a5,-24(s0)
    8000a280:	fe843703          	ld	a4,-24(s0)
    8000a284:	6789                	lui	a5,0x2
    8000a286:	fcf764e3          	bltu	a4,a5,8000a24e <getfirstfreelrupage+0xc>
    }
  }

  return 0;
    8000a28a:	4781                	li	a5,0
}
    8000a28c:	853e                	mv	a0,a5
    8000a28e:	6462                	ld	s0,24(sp)
    8000a290:	6105                	addi	sp,sp,32
    8000a292:	8082                	ret

000000008000a294 <getpinfo>:

struct lrupinfo*
getpinfo(uint64 va, pagetable_t pagetable)
{
    8000a294:	7179                	addi	sp,sp,-48
    8000a296:	f422                	sd	s0,40(sp)
    8000a298:	1800                	addi	s0,sp,48
    8000a29a:	fca43c23          	sd	a0,-40(s0)
    8000a29e:	fcb43823          	sd	a1,-48(s0)
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a2a2:	fe043423          	sd	zero,-24(s0)
    8000a2a6:	a0ad                	j	8000a310 <getpinfo+0x7c>
  {
    if(lrupages[i].pte == 0) continue;
    8000a2a8:	0001c717          	auipc	a4,0x1c
    8000a2ac:	f4070713          	addi	a4,a4,-192 # 800261e8 <lrupages>
    8000a2b0:	fe843783          	ld	a5,-24(s0)
    8000a2b4:	0796                	slli	a5,a5,0x5
    8000a2b6:	97ba                	add	a5,a5,a4
    8000a2b8:	679c                	ld	a5,8(a5)
    8000a2ba:	c7a9                	beqz	a5,8000a304 <getpinfo+0x70>
    if(lrupages[i].pagetable == pagetable && lrupages[i].va == va)
    8000a2bc:	0001c717          	auipc	a4,0x1c
    8000a2c0:	f2c70713          	addi	a4,a4,-212 # 800261e8 <lrupages>
    8000a2c4:	fe843783          	ld	a5,-24(s0)
    8000a2c8:	0796                	slli	a5,a5,0x5
    8000a2ca:	97ba                	add	a5,a5,a4
    8000a2cc:	6f9c                	ld	a5,24(a5)
    8000a2ce:	fd043703          	ld	a4,-48(s0)
    8000a2d2:	02f71a63          	bne	a4,a5,8000a306 <getpinfo+0x72>
    8000a2d6:	0001c717          	auipc	a4,0x1c
    8000a2da:	f1270713          	addi	a4,a4,-238 # 800261e8 <lrupages>
    8000a2de:	fe843783          	ld	a5,-24(s0)
    8000a2e2:	0796                	slli	a5,a5,0x5
    8000a2e4:	97ba                	add	a5,a5,a4
    8000a2e6:	6b9c                	ld	a5,16(a5)
    8000a2e8:	fd843703          	ld	a4,-40(s0)
    8000a2ec:	00f71d63          	bne	a4,a5,8000a306 <getpinfo+0x72>
    {
      return &(lrupages[i]);
    8000a2f0:	fe843783          	ld	a5,-24(s0)
    8000a2f4:	00579713          	slli	a4,a5,0x5
    8000a2f8:	0001c797          	auipc	a5,0x1c
    8000a2fc:	ef078793          	addi	a5,a5,-272 # 800261e8 <lrupages>
    8000a300:	97ba                	add	a5,a5,a4
    8000a302:	a829                	j	8000a31c <getpinfo+0x88>
    if(lrupages[i].pte == 0) continue;
    8000a304:	0001                	nop
  for(uint64 i = 0; i < RAM_PAGES_COUNT; i++)
    8000a306:	fe843783          	ld	a5,-24(s0)
    8000a30a:	0785                	addi	a5,a5,1
    8000a30c:	fef43423          	sd	a5,-24(s0)
    8000a310:	fe843703          	ld	a4,-24(s0)
    8000a314:	6789                	lui	a5,0x2
    8000a316:	f8f769e3          	bltu	a4,a5,8000a2a8 <getpinfo+0x14>
    }
  }

  return 0;
    8000a31a:	4781                	li	a5,0
}
    8000a31c:	853e                	mv	a0,a5
    8000a31e:	7422                	ld	s0,40(sp)
    8000a320:	6145                	addi	sp,sp,48
    8000a322:	8082                	ret

000000008000a324 <getpaddress>:

uint64
getpaddress(pte_t *pte)
{
    8000a324:	7179                	addi	sp,sp,-48
    8000a326:	f422                	sd	s0,40(sp)
    8000a328:	1800                	addi	s0,sp,48
    8000a32a:	fca43c23          	sd	a0,-40(s0)
  uint64 ppn = ( (*pte) & 0x3FFFFFFFFFFFFL ) >> 10; // Extract bits 53-10 and shift to the right place
    8000a32e:	fd843783          	ld	a5,-40(s0)
    8000a332:	639c                	ld	a5,0(a5)
    8000a334:	00a7d713          	srli	a4,a5,0xa
    8000a338:	57fd                	li	a5,-1
    8000a33a:	83e1                	srli	a5,a5,0x18
    8000a33c:	8ff9                	and	a5,a5,a4
    8000a33e:	fef43423          	sd	a5,-24(s0)
  uint64 physical_address = ppn << 12; // Shift left by 12 bits to accommodate for the page offset
    8000a342:	fe843783          	ld	a5,-24(s0)
    8000a346:	07b2                	slli	a5,a5,0xc
    8000a348:	fef43023          	sd	a5,-32(s0)
  return physical_address;
    8000a34c:	fe043783          	ld	a5,-32(s0)
}
    8000a350:	853e                	mv	a0,a5
    8000a352:	7422                	ld	s0,40(sp)
    8000a354:	6145                	addi	sp,sp,48
    8000a356:	8082                	ret

000000008000a358 <setpaddress>:

void
setpaddress(pte_t *pte, uint64 new_ppn)
{
    8000a358:	7179                	addi	sp,sp,-48
    8000a35a:	f422                	sd	s0,40(sp)
    8000a35c:	1800                	addi	s0,sp,48
    8000a35e:	fca43c23          	sd	a0,-40(s0)
    8000a362:	fcb43823          	sd	a1,-48(s0)
  uint64 masked_pte = *pte & ~0x3FFFFFFFFFFFFL;
    8000a366:	fd843783          	ld	a5,-40(s0)
    8000a36a:	6398                	ld	a4,0(a5)
    8000a36c:	57fd                	li	a5,-1
    8000a36e:	17ca                	slli	a5,a5,0x32
    8000a370:	8ff9                	and	a5,a5,a4
    8000a372:	fef43423          	sd	a5,-24(s0)
  uint64 new_ppn_shifted = (new_ppn << 10) & 0x3FFFFFFFFFFFFL;
    8000a376:	fd043783          	ld	a5,-48(s0)
    8000a37a:	00a79713          	slli	a4,a5,0xa
    8000a37e:	57fd                	li	a5,-1
    8000a380:	83b9                	srli	a5,a5,0xe
    8000a382:	8ff9                	and	a5,a5,a4
    8000a384:	fef43023          	sd	a5,-32(s0)
  *pte = masked_pte | new_ppn_shifted;
    8000a388:	fe843703          	ld	a4,-24(s0)
    8000a38c:	fe043783          	ld	a5,-32(s0)
    8000a390:	8f5d                	or	a4,a4,a5
    8000a392:	fd843783          	ld	a5,-40(s0)
    8000a396:	e398                	sd	a4,0(a5)
}
    8000a398:	0001                	nop
    8000a39a:	7422                	ld	s0,40(sp)
    8000a39c:	6145                	addi	sp,sp,48
    8000a39e:	8082                	ret

000000008000a3a0 <reglrupage>:

void
reglrupage(pte_t *pte, uint64 va, pagetable_t pagetable)
{
    8000a3a0:	7139                	addi	sp,sp,-64
    8000a3a2:	fc06                	sd	ra,56(sp)
    8000a3a4:	f822                	sd	s0,48(sp)
    8000a3a6:	0080                	addi	s0,sp,64
    8000a3a8:	fca43c23          	sd	a0,-40(s0)
    8000a3ac:	fcb43823          	sd	a1,-48(s0)
    8000a3b0:	fcc43423          	sd	a2,-56(s0)
  acquire(&lrupageslock);
    8000a3b4:	0001c517          	auipc	a0,0x1c
    8000a3b8:	e1c50513          	addi	a0,a0,-484 # 800261d0 <lrupageslock>
    8000a3bc:	ffff7097          	auipc	ra,0xffff7
    8000a3c0:	f80080e7          	jalr	-128(ra) # 8000133c <acquire>

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
    8000a3c4:	fc843583          	ld	a1,-56(s0)
    8000a3c8:	fd043503          	ld	a0,-48(s0)
    8000a3cc:	00000097          	auipc	ra,0x0
    8000a3d0:	ec8080e7          	jalr	-312(ra) # 8000a294 <getpinfo>
    8000a3d4:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a3d8:	fe843783          	ld	a5,-24(s0)
    8000a3dc:	e7a9                	bnez	a5,8000a426 <reglrupage+0x86>
  {
    pinfo = getfirstfreelrupage();
    8000a3de:	00000097          	auipc	ra,0x0
    8000a3e2:	e64080e7          	jalr	-412(ra) # 8000a242 <getfirstfreelrupage>
    8000a3e6:	fea43423          	sd	a0,-24(s0)
    if(pinfo == 0)
    8000a3ea:	fe843783          	ld	a5,-24(s0)
    8000a3ee:	e38d                	bnez	a5,8000a410 <reglrupage+0x70>
    {
      release(&lrupageslock);
    8000a3f0:	0001c517          	auipc	a0,0x1c
    8000a3f4:	de050513          	addi	a0,a0,-544 # 800261d0 <lrupageslock>
    8000a3f8:	ffff7097          	auipc	ra,0xffff7
    8000a3fc:	fa8080e7          	jalr	-88(ra) # 800013a0 <release>
      panic("reglrupage: no more space in lrupages");
    8000a400:	00002517          	auipc	a0,0x2
    8000a404:	3d850513          	addi	a0,a0,984 # 8000c7d8 <etext+0x7d8>
    8000a408:	ffff7097          	auipc	ra,0xffff7
    8000a40c:	884080e7          	jalr	-1916(ra) # 80000c8c <panic>
    }

    pinfo->va = va;
    8000a410:	fe843783          	ld	a5,-24(s0)
    8000a414:	fd043703          	ld	a4,-48(s0)
    8000a418:	eb98                	sd	a4,16(a5)
    pinfo->pagetable = pagetable;
    8000a41a:	fe843783          	ld	a5,-24(s0)
    8000a41e:	fc843703          	ld	a4,-56(s0)
    8000a422:	ef98                	sd	a4,24(a5)
    8000a424:	a00d                	j	8000a446 <reglrupage+0xa6>
  }
  else // TODO: Does this ever happen?
  {
    release(&lrupageslock);
    8000a426:	0001c517          	auipc	a0,0x1c
    8000a42a:	daa50513          	addi	a0,a0,-598 # 800261d0 <lrupageslock>
    8000a42e:	ffff7097          	auipc	ra,0xffff7
    8000a432:	f72080e7          	jalr	-142(ra) # 800013a0 <release>
    panic("getpinfo: edge case isreal");
    8000a436:	00002517          	auipc	a0,0x2
    8000a43a:	3ca50513          	addi	a0,a0,970 # 8000c800 <etext+0x800>
    8000a43e:	ffff7097          	auipc	ra,0xffff7
    8000a442:	84e080e7          	jalr	-1970(ra) # 80000c8c <panic>
  }

  pinfo->refhistory = 0;
    8000a446:	fe843783          	ld	a5,-24(s0)
    8000a44a:	00078023          	sb	zero,0(a5) # 2000 <_entry-0x7fffe000>
  pinfo->pte = pte;
    8000a44e:	fe843783          	ld	a5,-24(s0)
    8000a452:	fd843703          	ld	a4,-40(s0)
    8000a456:	e798                	sd	a4,8(a5)

  release(&lrupageslock);
    8000a458:	0001c517          	auipc	a0,0x1c
    8000a45c:	d7850513          	addi	a0,a0,-648 # 800261d0 <lrupageslock>
    8000a460:	ffff7097          	auipc	ra,0xffff7
    8000a464:	f40080e7          	jalr	-192(ra) # 800013a0 <release>
}
    8000a468:	0001                	nop
    8000a46a:	70e2                	ld	ra,56(sp)
    8000a46c:	7442                	ld	s0,48(sp)
    8000a46e:	6121                	addi	sp,sp,64
    8000a470:	8082                	ret

000000008000a472 <unreglrupage>:

void
unreglrupage(uint64 va, pagetable_t pagetable)
{
    8000a472:	715d                	addi	sp,sp,-80
    8000a474:	e486                	sd	ra,72(sp)
    8000a476:	e0a2                	sd	s0,64(sp)
    8000a478:	0880                	addi	s0,sp,80
    8000a47a:	faa43c23          	sd	a0,-72(s0)
    8000a47e:	fab43823          	sd	a1,-80(s0)
  acquire(&lrupageslock);
    8000a482:	0001c517          	auipc	a0,0x1c
    8000a486:	d4e50513          	addi	a0,a0,-690 # 800261d0 <lrupageslock>
    8000a48a:	ffff7097          	auipc	ra,0xffff7
    8000a48e:	eb2080e7          	jalr	-334(ra) # 8000133c <acquire>

  struct lrupinfo* pinfo = getpinfo(va, pagetable);
    8000a492:	fb043583          	ld	a1,-80(s0)
    8000a496:	fb843503          	ld	a0,-72(s0)
    8000a49a:	00000097          	auipc	ra,0x0
    8000a49e:	dfa080e7          	jalr	-518(ra) # 8000a294 <getpinfo>
    8000a4a2:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a4a6:	fe843783          	ld	a5,-24(s0)
    8000a4aa:	e38d                	bnez	a5,8000a4cc <unreglrupage+0x5a>
  {
    release(&lrupageslock);
    8000a4ac:	0001c517          	auipc	a0,0x1c
    8000a4b0:	d2450513          	addi	a0,a0,-732 # 800261d0 <lrupageslock>
    8000a4b4:	ffff7097          	auipc	ra,0xffff7
    8000a4b8:	eec080e7          	jalr	-276(ra) # 800013a0 <release>
    panic("unreglrupage: not mapped");
    8000a4bc:	00002517          	auipc	a0,0x2
    8000a4c0:	36450513          	addi	a0,a0,868 # 8000c820 <etext+0x820>
    8000a4c4:	ffff6097          	auipc	ra,0xffff6
    8000a4c8:	7c8080e7          	jalr	1992(ra) # 80000c8c <panic>
  }

  *pinfo = (struct lrupinfo){0};
    8000a4cc:	fe843783          	ld	a5,-24(s0)
    8000a4d0:	0007b023          	sd	zero,0(a5)
    8000a4d4:	0007b423          	sd	zero,8(a5)
    8000a4d8:	0007b823          	sd	zero,16(a5)
    8000a4dc:	0007bc23          	sd	zero,24(a5)

  release(&lrupageslock);
    8000a4e0:	0001c517          	auipc	a0,0x1c
    8000a4e4:	cf050513          	addi	a0,a0,-784 # 800261d0 <lrupageslock>
    8000a4e8:	ffff7097          	auipc	ra,0xffff7
    8000a4ec:	eb8080e7          	jalr	-328(ra) # 800013a0 <release>
}
    8000a4f0:	0001                	nop
    8000a4f2:	60a6                	ld	ra,72(sp)
    8000a4f4:	6406                	ld	s0,64(sp)
    8000a4f6:	6161                	addi	sp,sp,80
    8000a4f8:	8082                	ret

000000008000a4fa <updaterefhistory>:

void
updaterefhistory()
{
    8000a4fa:	7179                	addi	sp,sp,-48
    8000a4fc:	f406                	sd	ra,40(sp)
    8000a4fe:	f022                	sd	s0,32(sp)
    8000a500:	1800                	addi	s0,sp,48
  acquire(&lrupageslock);
    8000a502:	0001c517          	auipc	a0,0x1c
    8000a506:	cce50513          	addi	a0,a0,-818 # 800261d0 <lrupageslock>
    8000a50a:	ffff7097          	auipc	ra,0xffff7
    8000a50e:	e32080e7          	jalr	-462(ra) # 8000133c <acquire>

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a512:	fe043423          	sd	zero,-24(s0)
    8000a516:	a065                	j	8000a5be <updaterefhistory+0xc4>
  {
    pte_t *pte = lrupages[i].pte;
    8000a518:	0001c717          	auipc	a4,0x1c
    8000a51c:	cd070713          	addi	a4,a4,-816 # 800261e8 <lrupages>
    8000a520:	fe843783          	ld	a5,-24(s0)
    8000a524:	0796                	slli	a5,a5,0x5
    8000a526:	97ba                	add	a5,a5,a4
    8000a528:	679c                	ld	a5,8(a5)
    8000a52a:	fef43023          	sd	a5,-32(s0)
    if(pte == 0) continue;
    8000a52e:	fe043783          	ld	a5,-32(s0)
    8000a532:	cfb5                	beqz	a5,8000a5ae <updaterefhistory+0xb4>
    if(*pte & PTE_ON_DISK) continue;
    8000a534:	fe043783          	ld	a5,-32(s0)
    8000a538:	639c                	ld	a5,0(a5)
    8000a53a:	1007f793          	andi	a5,a5,256
    8000a53e:	ebb5                	bnez	a5,8000a5b2 <updaterefhistory+0xb8>

    uchar a = ( *pte & PTE_A ) == 0 ? 0 : 1;
    8000a540:	fe043783          	ld	a5,-32(s0)
    8000a544:	639c                	ld	a5,0(a5)
    8000a546:	0407f793          	andi	a5,a5,64
    8000a54a:	00f037b3          	snez	a5,a5
    8000a54e:	0ff7f793          	andi	a5,a5,255
    8000a552:	fcf40fa3          	sb	a5,-33(s0)
    *pte &= ~PTE_A; // A = 0
    8000a556:	fe043783          	ld	a5,-32(s0)
    8000a55a:	639c                	ld	a5,0(a5)
    8000a55c:	fbf7f713          	andi	a4,a5,-65
    8000a560:	fe043783          	ld	a5,-32(s0)
    8000a564:	e398                	sd	a4,0(a5)

    uchar mask = a << ( sizeof(uchar) * 8 - 1 );
    8000a566:	fdf44783          	lbu	a5,-33(s0)
    8000a56a:	0077979b          	slliw	a5,a5,0x7
    8000a56e:	fcf40f23          	sb	a5,-34(s0)
    lrupages[i].refhistory = (lrupages[i].refhistory >> 1) | mask;
    8000a572:	0001c717          	auipc	a4,0x1c
    8000a576:	c7670713          	addi	a4,a4,-906 # 800261e8 <lrupages>
    8000a57a:	fe843783          	ld	a5,-24(s0)
    8000a57e:	0796                	slli	a5,a5,0x5
    8000a580:	97ba                	add	a5,a5,a4
    8000a582:	0007c783          	lbu	a5,0(a5)
    8000a586:	0017d79b          	srliw	a5,a5,0x1
    8000a58a:	0ff7f713          	andi	a4,a5,255
    8000a58e:	fde44783          	lbu	a5,-34(s0)
    8000a592:	8fd9                	or	a5,a5,a4
    8000a594:	0ff7f713          	andi	a4,a5,255
    8000a598:	0001c697          	auipc	a3,0x1c
    8000a59c:	c5068693          	addi	a3,a3,-944 # 800261e8 <lrupages>
    8000a5a0:	fe843783          	ld	a5,-24(s0)
    8000a5a4:	0796                	slli	a5,a5,0x5
    8000a5a6:	97b6                	add	a5,a5,a3
    8000a5a8:	00e78023          	sb	a4,0(a5)
    8000a5ac:	a021                	j	8000a5b4 <updaterefhistory+0xba>
    if(pte == 0) continue;
    8000a5ae:	0001                	nop
    8000a5b0:	a011                	j	8000a5b4 <updaterefhistory+0xba>
    if(*pte & PTE_ON_DISK) continue;
    8000a5b2:	0001                	nop
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a5b4:	fe843783          	ld	a5,-24(s0)
    8000a5b8:	0785                	addi	a5,a5,1
    8000a5ba:	fef43423          	sd	a5,-24(s0)
    8000a5be:	fe843703          	ld	a4,-24(s0)
    8000a5c2:	6789                	lui	a5,0x2
    8000a5c4:	f4f76ae3          	bltu	a4,a5,8000a518 <updaterefhistory+0x1e>
  }

  release(&lrupageslock);
    8000a5c8:	0001c517          	auipc	a0,0x1c
    8000a5cc:	c0850513          	addi	a0,a0,-1016 # 800261d0 <lrupageslock>
    8000a5d0:	ffff7097          	auipc	ra,0xffff7
    8000a5d4:	dd0080e7          	jalr	-560(ra) # 800013a0 <release>
}
    8000a5d8:	0001                	nop
    8000a5da:	70a2                	ld	ra,40(sp)
    8000a5dc:	7402                	ld	s0,32(sp)
    8000a5de:	6145                	addi	sp,sp,48
    8000a5e0:	8082                	ret

000000008000a5e2 <getvictim>:

struct lrupinfo*
getvictim()
{
    8000a5e2:	7179                	addi	sp,sp,-48
    8000a5e4:	f406                	sd	ra,40(sp)
    8000a5e6:	f022                	sd	s0,32(sp)
    8000a5e8:	1800                	addi	s0,sp,48
  uchar minhistory = ~0;
    8000a5ea:	57fd                	li	a5,-1
    8000a5ec:	fef407a3          	sb	a5,-17(s0)
  struct lrupinfo *result = 0;
    8000a5f0:	fe043023          	sd	zero,-32(s0)

  uint64 i;
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a5f4:	fc043c23          	sd	zero,-40(s0)
    8000a5f8:	a069                	j	8000a682 <getvictim+0xa0>
  {
    pte_t *pte = lrupages[i].pte;
    8000a5fa:	0001c717          	auipc	a4,0x1c
    8000a5fe:	bee70713          	addi	a4,a4,-1042 # 800261e8 <lrupages>
    8000a602:	fd843783          	ld	a5,-40(s0)
    8000a606:	0796                	slli	a5,a5,0x5
    8000a608:	97ba                	add	a5,a5,a4
    8000a60a:	679c                	ld	a5,8(a5)
    8000a60c:	fcf43823          	sd	a5,-48(s0)
    if(pte == 0) continue;
    8000a610:	fd043783          	ld	a5,-48(s0)
    8000a614:	c3ad                	beqz	a5,8000a676 <getvictim+0x94>

    if(ispteready(pte) && lrupages[i].refhistory < minhistory)
    8000a616:	fd043503          	ld	a0,-48(s0)
    8000a61a:	00000097          	auipc	ra,0x0
    8000a61e:	bfa080e7          	jalr	-1030(ra) # 8000a214 <ispteready>
    8000a622:	87aa                	mv	a5,a0
    8000a624:	cbb1                	beqz	a5,8000a678 <getvictim+0x96>
    8000a626:	0001c717          	auipc	a4,0x1c
    8000a62a:	bc270713          	addi	a4,a4,-1086 # 800261e8 <lrupages>
    8000a62e:	fd843783          	ld	a5,-40(s0)
    8000a632:	0796                	slli	a5,a5,0x5
    8000a634:	97ba                	add	a5,a5,a4
    8000a636:	0007c703          	lbu	a4,0(a5) # 2000 <_entry-0x7fffe000>
    8000a63a:	fef44783          	lbu	a5,-17(s0)
    8000a63e:	0ff7f793          	andi	a5,a5,255
    8000a642:	02f77b63          	bgeu	a4,a5,8000a678 <getvictim+0x96>
    {
      result = &(lrupages[i]);
    8000a646:	fd843783          	ld	a5,-40(s0)
    8000a64a:	00579713          	slli	a4,a5,0x5
    8000a64e:	0001c797          	auipc	a5,0x1c
    8000a652:	b9a78793          	addi	a5,a5,-1126 # 800261e8 <lrupages>
    8000a656:	97ba                	add	a5,a5,a4
    8000a658:	fef43023          	sd	a5,-32(s0)
      minhistory = lrupages[i].refhistory;
    8000a65c:	0001c717          	auipc	a4,0x1c
    8000a660:	b8c70713          	addi	a4,a4,-1140 # 800261e8 <lrupages>
    8000a664:	fd843783          	ld	a5,-40(s0)
    8000a668:	0796                	slli	a5,a5,0x5
    8000a66a:	97ba                	add	a5,a5,a4
    8000a66c:	0007c783          	lbu	a5,0(a5)
    8000a670:	fef407a3          	sb	a5,-17(s0)
    8000a674:	a011                	j	8000a678 <getvictim+0x96>
    if(pte == 0) continue;
    8000a676:	0001                	nop
  for(i = 0; i < RAM_PAGES_COUNT; i++)
    8000a678:	fd843783          	ld	a5,-40(s0)
    8000a67c:	0785                	addi	a5,a5,1
    8000a67e:	fcf43c23          	sd	a5,-40(s0)
    8000a682:	fd843703          	ld	a4,-40(s0)
    8000a686:	6789                	lui	a5,0x2
    8000a688:	f6f769e3          	bltu	a4,a5,8000a5fa <getvictim+0x18>
    }
  }

  return result;
    8000a68c:	fe043783          	ld	a5,-32(s0)
}
    8000a690:	853e                	mv	a0,a5
    8000a692:	70a2                	ld	ra,40(sp)
    8000a694:	7402                	ld	s0,32(sp)
    8000a696:	6145                	addi	sp,sp,48
    8000a698:	8082                	ret

000000008000a69a <swapout>:

// Returns free page, 0 if there is none
void*
swapout()
{
    8000a69a:	7179                	addi	sp,sp,-48
    8000a69c:	f406                	sd	ra,40(sp)
    8000a69e:	f022                	sd	s0,32(sp)
    8000a6a0:	1800                	addi	s0,sp,48
  acquire(&lrupageslock);
    8000a6a2:	0001c517          	auipc	a0,0x1c
    8000a6a6:	b2e50513          	addi	a0,a0,-1234 # 800261d0 <lrupageslock>
    8000a6aa:	ffff7097          	auipc	ra,0xffff7
    8000a6ae:	c92080e7          	jalr	-878(ra) # 8000133c <acquire>

  struct lrupinfo *pinfo = getvictim();
    8000a6b2:	00000097          	auipc	ra,0x0
    8000a6b6:	f30080e7          	jalr	-208(ra) # 8000a5e2 <getvictim>
    8000a6ba:	fea43423          	sd	a0,-24(s0)
  if(pinfo == 0)
    8000a6be:	fe843783          	ld	a5,-24(s0)
    8000a6c2:	eb89                	bnez	a5,8000a6d4 <swapout+0x3a>
    panic("swapout: no victim!");
    8000a6c4:	00002517          	auipc	a0,0x2
    8000a6c8:	17c50513          	addi	a0,a0,380 # 8000c840 <etext+0x840>
    8000a6cc:	ffff6097          	auipc	ra,0xffff6
    8000a6d0:	5c0080e7          	jalr	1472(ra) # 80000c8c <panic>

  pte_t *pte = pinfo->pte;
    8000a6d4:	fe843783          	ld	a5,-24(s0)
    8000a6d8:	679c                	ld	a5,8(a5)
    8000a6da:	fef43023          	sd	a5,-32(s0)
  uchar *data = (uchar*)getpaddress(pte);
    8000a6de:	fe043503          	ld	a0,-32(s0)
    8000a6e2:	00000097          	auipc	ra,0x0
    8000a6e6:	c42080e7          	jalr	-958(ra) # 8000a324 <getpaddress>
    8000a6ea:	87aa                	mv	a5,a0
    8000a6ec:	fcf43c23          	sd	a5,-40(s0)
  *pte |= PTE_PENDING_DISK_OPERATION; // PTE_PENDING_DISK_OPERATION = 1
    8000a6f0:	fe043783          	ld	a5,-32(s0)
    8000a6f4:	639c                	ld	a5,0(a5)
    8000a6f6:	2007e713          	ori	a4,a5,512
    8000a6fa:	fe043783          	ld	a5,-32(s0)
    8000a6fe:	e398                	sd	a4,0(a5)
  release(&lrupageslock);
    8000a700:	0001c517          	auipc	a0,0x1c
    8000a704:	ad050513          	addi	a0,a0,-1328 # 800261d0 <lrupageslock>
    8000a708:	ffff7097          	auipc	ra,0xffff7
    8000a70c:	c98080e7          	jalr	-872(ra) # 800013a0 <release>

  int diskpageno = write_page_to_disk(data);
    8000a710:	fd843503          	ld	a0,-40(s0)
    8000a714:	fffff097          	auipc	ra,0xfffff
    8000a718:	7da080e7          	jalr	2010(ra) # 80009eee <write_page_to_disk>
    8000a71c:	87aa                	mv	a5,a0
    8000a71e:	fcf42a23          	sw	a5,-44(s0)
  if(diskpageno < 0)
    8000a722:	fd442783          	lw	a5,-44(s0)
    8000a726:	2781                	sext.w	a5,a5
    8000a728:	0007d463          	bgez	a5,8000a730 <swapout+0x96>
    return 0;
    8000a72c:	4781                	li	a5,0
    8000a72e:	a8a5                	j	8000a7a6 <swapout+0x10c>

  acquire(&lrupageslock);
    8000a730:	0001c517          	auipc	a0,0x1c
    8000a734:	aa050513          	addi	a0,a0,-1376 # 800261d0 <lrupageslock>
    8000a738:	ffff7097          	auipc	ra,0xffff7
    8000a73c:	c04080e7          	jalr	-1020(ra) # 8000133c <acquire>

  setpaddress(pte, (uint64)diskpageno);
    8000a740:	fd442783          	lw	a5,-44(s0)
    8000a744:	85be                	mv	a1,a5
    8000a746:	fe043503          	ld	a0,-32(s0)
    8000a74a:	00000097          	auipc	ra,0x0
    8000a74e:	c0e080e7          	jalr	-1010(ra) # 8000a358 <setpaddress>
  *pte &= ~PTE_V; // V = 0
    8000a752:	fe043783          	ld	a5,-32(s0)
    8000a756:	639c                	ld	a5,0(a5)
    8000a758:	ffe7f713          	andi	a4,a5,-2
    8000a75c:	fe043783          	ld	a5,-32(s0)
    8000a760:	e398                	sd	a4,0(a5)
  *pte |= PTE_ON_DISK; // ON_DISK = 1
    8000a762:	fe043783          	ld	a5,-32(s0)
    8000a766:	639c                	ld	a5,0(a5)
    8000a768:	1007e713          	ori	a4,a5,256
    8000a76c:	fe043783          	ld	a5,-32(s0)
    8000a770:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_PENDING_DISK_OPERATION; // PTE_PENDING_DISK_OPERATION = 0
    8000a772:	fe043783          	ld	a5,-32(s0)
    8000a776:	639c                	ld	a5,0(a5)
    8000a778:	dff7f713          	andi	a4,a5,-513
    8000a77c:	fe043783          	ld	a5,-32(s0)
    8000a780:	e398                	sd	a4,0(a5)
  pinfo->refhistory = 0;
    8000a782:	fe843783          	ld	a5,-24(s0)
    8000a786:	00078023          	sb	zero,0(a5) # 2000 <_entry-0x7fffe000>
  sfence_vma(); // Flush TLB
    8000a78a:	00000097          	auipc	ra,0x0
    8000a78e:	a78080e7          	jalr	-1416(ra) # 8000a202 <sfence_vma>

  release(&lrupageslock);
    8000a792:	0001c517          	auipc	a0,0x1c
    8000a796:	a3e50513          	addi	a0,a0,-1474 # 800261d0 <lrupageslock>
    8000a79a:	ffff7097          	auipc	ra,0xffff7
    8000a79e:	c06080e7          	jalr	-1018(ra) # 800013a0 <release>
  return (void*)data;
    8000a7a2:	fd843783          	ld	a5,-40(s0)
}
    8000a7a6:	853e                	mv	a0,a5
    8000a7a8:	70a2                	ld	ra,40(sp)
    8000a7aa:	7402                	ld	s0,32(sp)
    8000a7ac:	6145                	addi	sp,sp,48
    8000a7ae:	8082                	ret

000000008000a7b0 <swapin>:

int
swapin(uint64 va, pagetable_t pagetable)
{
    8000a7b0:	7139                	addi	sp,sp,-64
    8000a7b2:	fc06                	sd	ra,56(sp)
    8000a7b4:	f822                	sd	s0,48(sp)
    8000a7b6:	0080                	addi	s0,sp,64
    8000a7b8:	fca43423          	sd	a0,-56(s0)
    8000a7bc:	fcb43023          	sd	a1,-64(s0)
  acquire(&lrupageslock);
    8000a7c0:	0001c517          	auipc	a0,0x1c
    8000a7c4:	a1050513          	addi	a0,a0,-1520 # 800261d0 <lrupageslock>
    8000a7c8:	ffff7097          	auipc	ra,0xffff7
    8000a7cc:	b74080e7          	jalr	-1164(ra) # 8000133c <acquire>

  pte_t *pte = getpinfo(va, pagetable)->pte;
    8000a7d0:	fc043583          	ld	a1,-64(s0)
    8000a7d4:	fc843503          	ld	a0,-56(s0)
    8000a7d8:	00000097          	auipc	ra,0x0
    8000a7dc:	abc080e7          	jalr	-1348(ra) # 8000a294 <getpinfo>
    8000a7e0:	87aa                	mv	a5,a0
    8000a7e2:	679c                	ld	a5,8(a5)
    8000a7e4:	fef43423          	sd	a5,-24(s0)
  if((*pte & PTE_ON_DISK) == 0)
    8000a7e8:	fe843783          	ld	a5,-24(s0)
    8000a7ec:	639c                	ld	a5,0(a5)
    8000a7ee:	1007f793          	andi	a5,a5,256
    8000a7f2:	e399                	bnez	a5,8000a7f8 <swapin+0x48>
    return 0;
    8000a7f4:	4781                	li	a5,0
    8000a7f6:	a0e1                	j	8000a8be <swapin+0x10e>
  *pte |= PTE_PENDING_DISK_OPERATION; // PENDING_DISK_OPERATION = 1
    8000a7f8:	fe843783          	ld	a5,-24(s0)
    8000a7fc:	639c                	ld	a5,0(a5)
    8000a7fe:	2007e713          	ori	a4,a5,512
    8000a802:	fe843783          	ld	a5,-24(s0)
    8000a806:	e398                	sd	a4,0(a5)

  release(&lrupageslock);
    8000a808:	0001c517          	auipc	a0,0x1c
    8000a80c:	9c850513          	addi	a0,a0,-1592 # 800261d0 <lrupageslock>
    8000a810:	ffff7097          	auipc	ra,0xffff7
    8000a814:	b90080e7          	jalr	-1136(ra) # 800013a0 <release>

  uchar *rampage = kalloc();
    8000a818:	ffff7097          	auipc	ra,0xffff7
    8000a81c:	9be080e7          	jalr	-1602(ra) # 800011d6 <kalloc>
    8000a820:	fea43023          	sd	a0,-32(s0)
  if(rampage == 0)
    8000a824:	fe043783          	ld	a5,-32(s0)
    8000a828:	e399                	bnez	a5,8000a82e <swapin+0x7e>
    return 0;
    8000a82a:	4781                	li	a5,0
    8000a82c:	a849                	j	8000a8be <swapin+0x10e>

  int diskpageno = (int) getpaddress(pte);
    8000a82e:	fe843503          	ld	a0,-24(s0)
    8000a832:	00000097          	auipc	ra,0x0
    8000a836:	af2080e7          	jalr	-1294(ra) # 8000a324 <getpaddress>
    8000a83a:	87aa                	mv	a5,a0
    8000a83c:	fcf42e23          	sw	a5,-36(s0)
  take_page_from_disk(diskpageno, rampage);
    8000a840:	fdc42783          	lw	a5,-36(s0)
    8000a844:	fe043583          	ld	a1,-32(s0)
    8000a848:	853e                	mv	a0,a5
    8000a84a:	fffff097          	auipc	ra,0xfffff
    8000a84e:	732080e7          	jalr	1842(ra) # 80009f7c <take_page_from_disk>

  acquire(&lrupageslock);
    8000a852:	0001c517          	auipc	a0,0x1c
    8000a856:	97e50513          	addi	a0,a0,-1666 # 800261d0 <lrupageslock>
    8000a85a:	ffff7097          	auipc	ra,0xffff7
    8000a85e:	ae2080e7          	jalr	-1310(ra) # 8000133c <acquire>

  setpaddress(pte, (uint64)rampage);
    8000a862:	fe043783          	ld	a5,-32(s0)
    8000a866:	85be                	mv	a1,a5
    8000a868:	fe843503          	ld	a0,-24(s0)
    8000a86c:	00000097          	auipc	ra,0x0
    8000a870:	aec080e7          	jalr	-1300(ra) # 8000a358 <setpaddress>
  *pte |= PTE_V; // V = 1
    8000a874:	fe843783          	ld	a5,-24(s0)
    8000a878:	639c                	ld	a5,0(a5)
    8000a87a:	0017e713          	ori	a4,a5,1
    8000a87e:	fe843783          	ld	a5,-24(s0)
    8000a882:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_ON_DISK; // ON_DISK = 0
    8000a884:	fe843783          	ld	a5,-24(s0)
    8000a888:	639c                	ld	a5,0(a5)
    8000a88a:	eff7f713          	andi	a4,a5,-257
    8000a88e:	fe843783          	ld	a5,-24(s0)
    8000a892:	e398                	sd	a4,0(a5)
  *pte &= ~PTE_PENDING_DISK_OPERATION; // PENDING_DISK_OPERATION = 0
    8000a894:	fe843783          	ld	a5,-24(s0)
    8000a898:	639c                	ld	a5,0(a5)
    8000a89a:	dff7f713          	andi	a4,a5,-513
    8000a89e:	fe843783          	ld	a5,-24(s0)
    8000a8a2:	e398                	sd	a4,0(a5)
  sfence_vma(); // Flush TLB
    8000a8a4:	00000097          	auipc	ra,0x0
    8000a8a8:	95e080e7          	jalr	-1698(ra) # 8000a202 <sfence_vma>

  release(&lrupageslock);
    8000a8ac:	0001c517          	auipc	a0,0x1c
    8000a8b0:	92450513          	addi	a0,a0,-1756 # 800261d0 <lrupageslock>
    8000a8b4:	ffff7097          	auipc	ra,0xffff7
    8000a8b8:	aec080e7          	jalr	-1300(ra) # 800013a0 <release>
  return 1;
    8000a8bc:	4785                	li	a5,1
    8000a8be:	853e                	mv	a0,a5
    8000a8c0:	70e2                	ld	ra,56(sp)
    8000a8c2:	7442                	ld	s0,48(sp)
    8000a8c4:	6121                	addi	sp,sp,64
    8000a8c6:	8082                	ret
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
