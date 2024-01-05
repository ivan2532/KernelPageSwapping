
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
    8000032a:	7da78793          	addi	a5,a5,2010 # 80008b00 <timervec>
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
    80000408:	51a080e7          	jalr	1306(ra) # 8000391e <either_copyin>
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
    8000048a:	614080e7          	jalr	1556(ra) # 80002a9a <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	3d8080e7          	jalr	984(ra) # 8000386a <killed>
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
    800004c6:	19a080e7          	jalr	410(ra) # 8000365c <sleep>
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
    80000582:	32c080e7          	jalr	812(ra) # 800038aa <either_copyout>
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
    8000066c:	32a080e7          	jalr	810(ra) # 80003992 <procdump>
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
    80000836:	ea6080e7          	jalr	-346(ra) # 800036d8 <wakeup>
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
    80000e7c:	7e4080e7          	jalr	2020(ra) # 8000365c <sleep>
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
    80000fd4:	708080e7          	jalr	1800(ra) # 800036d8 <wakeup>
    
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
    80001378:	6ec080e7          	jalr	1772(ra) # 80002a60 <mycpu>
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
    80001404:	660080e7          	jalr	1632(ra) # 80002a60 <mycpu>
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
    8000144a:	61a080e7          	jalr	1562(ra) # 80002a60 <mycpu>
    8000144e:	87aa                	mv	a5,a0
    80001450:	5fbc                	lw	a5,120(a5)
    80001452:	eb89                	bnez	a5,80001464 <push_off+0x3c>
    mycpu()->intena = old;
    80001454:	00001097          	auipc	ra,0x1
    80001458:	60c080e7          	jalr	1548(ra) # 80002a60 <mycpu>
    8000145c:	872a                	mv	a4,a0
    8000145e:	fec42783          	lw	a5,-20(s0)
    80001462:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    80001464:	00001097          	auipc	ra,0x1
    80001468:	5fc080e7          	jalr	1532(ra) # 80002a60 <mycpu>
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
    8000148c:	5d8080e7          	jalr	1496(ra) # 80002a60 <mycpu>
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
    800018be:	182080e7          	jalr	386(ra) # 80002a3c <cpuid>
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
    80001912:	380080e7          	jalr	896(ra) # 80001c8e <kvminit>
    kvminithart();   // turn on paging
    80001916:	00000097          	auipc	ra,0x0
    8000191a:	3a6080e7          	jalr	934(ra) # 80001cbc <kvminithart>
    procinit();      // process table
    8000191e:	00001097          	auipc	ra,0x1
    80001922:	050080e7          	jalr	80(ra) # 8000296e <procinit>
    trapinit();      // trap vectors
    80001926:	00002097          	auipc	ra,0x2
    8000192a:	354080e7          	jalr	852(ra) # 80003c7a <trapinit>
    trapinithart();  // install kernel trap vector
    8000192e:	00002097          	auipc	ra,0x2
    80001932:	376080e7          	jalr	886(ra) # 80003ca4 <trapinithart>
    plicinit();      // set up interrupt controller
    80001936:	00007097          	auipc	ra,0x7
    8000193a:	1f4080e7          	jalr	500(ra) # 80008b2a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    8000193e:	00007097          	auipc	ra,0x7
    80001942:	21a080e7          	jalr	538(ra) # 80008b58 <plicinithart>
    binit();         // buffer cache
    80001946:	00003097          	auipc	ra,0x3
    8000194a:	d90080e7          	jalr	-624(ra) # 800046d6 <binit>
    iinit();         // inode table
    8000194e:	00003097          	auipc	ra,0x3
    80001952:	5e6080e7          	jalr	1510(ra) # 80004f34 <iinit>
    fileinit();      // file table
    80001956:	00005097          	auipc	ra,0x5
    8000195a:	fba080e7          	jalr	-70(ra) # 80006910 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    8000195e:	00009597          	auipc	a1,0x9
    80001962:	74258593          	addi	a1,a1,1858 # 8000b0a0 <etext+0xa0>
    80001966:	4501                	li	a0,0
    80001968:	00007097          	auipc	ra,0x7
    8000196c:	34a080e7          	jalr	842(ra) # 80008cb2 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    80001970:	00009597          	auipc	a1,0x9
    80001974:	74058593          	addi	a1,a1,1856 # 8000b0b0 <etext+0xb0>
    80001978:	4505                	li	a0,1
    8000197a:	00007097          	auipc	ra,0x7
    8000197e:	338080e7          	jalr	824(ra) # 80008cb2 <virtio_disk_init>

    userinit();      // first user process
    80001982:	00001097          	auipc	ra,0x1
    80001986:	498080e7          	jalr	1176(ra) # 80002e1a <userinit>
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
    800019b4:	08c080e7          	jalr	140(ra) # 80002a3c <cpuid>
    800019b8:	87aa                	mv	a5,a0
    800019ba:	85be                	mv	a1,a5
    800019bc:	00009517          	auipc	a0,0x9
    800019c0:	70450513          	addi	a0,a0,1796 # 8000b0c0 <etext+0xc0>
    800019c4:	fffff097          	auipc	ra,0xfffff
    800019c8:	072080e7          	jalr	114(ra) # 80000a36 <printf>
    kvminithart();    // turn on paging
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	2f0080e7          	jalr	752(ra) # 80001cbc <kvminithart>
    trapinithart();   // install kernel trap vector
    800019d4:	00002097          	auipc	ra,0x2
    800019d8:	2d0080e7          	jalr	720(ra) # 80003ca4 <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    800019dc:	00007097          	auipc	ra,0x7
    800019e0:	17c080e7          	jalr	380(ra) # 80008b58 <plicinithart>
  }

  scheduler();        
    800019e4:	00002097          	auipc	ra,0x2
    800019e8:	a4c080e7          	jalr	-1460(ra) # 80003430 <scheduler>

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
    80001acc:	a079                	j	80001b5a <updaterefhistory+0x98>
  {
    if(lrupages[i].pte == 0) continue;
    80001ace:	00012717          	auipc	a4,0x12
    80001ad2:	0ea70713          	addi	a4,a4,234 # 80013bb8 <lrupages>
    80001ad6:	fe843783          	ld	a5,-24(s0)
    80001ada:	0792                	slli	a5,a5,0x4
    80001adc:	97ba                	add	a5,a5,a4
    80001ade:	679c                	ld	a5,8(a5)
    80001ae0:	c7bd                	beqz	a5,80001b4e <updaterefhistory+0x8c>
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
    uchar mask = a << (sizeof(uchar) * 8 - 1);
    80001b06:	fe744783          	lbu	a5,-25(s0)
    80001b0a:	0077979b          	slliw	a5,a5,0x7
    80001b0e:	fef40323          	sb	a5,-26(s0)
    lrupages[i].refbits = (lrupages[i].refbits >> 1) | mask;
    80001b12:	00012717          	auipc	a4,0x12
    80001b16:	0a670713          	addi	a4,a4,166 # 80013bb8 <lrupages>
    80001b1a:	fe843783          	ld	a5,-24(s0)
    80001b1e:	0792                	slli	a5,a5,0x4
    80001b20:	97ba                	add	a5,a5,a4
    80001b22:	0007c783          	lbu	a5,0(a5)
    80001b26:	0017d79b          	srliw	a5,a5,0x1
    80001b2a:	0ff7f713          	andi	a4,a5,255
    80001b2e:	fe644783          	lbu	a5,-26(s0)
    80001b32:	8fd9                	or	a5,a5,a4
    80001b34:	0ff7f713          	andi	a4,a5,255
    80001b38:	00012697          	auipc	a3,0x12
    80001b3c:	08068693          	addi	a3,a3,128 # 80013bb8 <lrupages>
    80001b40:	fe843783          	ld	a5,-24(s0)
    80001b44:	0792                	slli	a5,a5,0x4
    80001b46:	97b6                	add	a5,a5,a3
    80001b48:	00e78023          	sb	a4,0(a5)
    80001b4c:	a011                	j	80001b50 <updaterefhistory+0x8e>
    if(lrupages[i].pte == 0) continue;
    80001b4e:	0001                	nop
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001b50:	fe843783          	ld	a5,-24(s0)
    80001b54:	0785                	addi	a5,a5,1
    80001b56:	fef43423          	sd	a5,-24(s0)
    80001b5a:	fe843703          	ld	a4,-24(s0)
    80001b5e:	6785                	lui	a5,0x1
    80001b60:	f6f767e3          	bltu	a4,a5,80001ace <updaterefhistory+0xc>
  }
}
    80001b64:	0001                	nop
    80001b66:	0001                	nop
    80001b68:	6462                	ld	s0,24(sp)
    80001b6a:	6105                	addi	sp,sp,32
    80001b6c:	8082                	ret

0000000080001b6e <kvmmake>:

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001b6e:	1101                	addi	sp,sp,-32
    80001b70:	ec06                	sd	ra,24(sp)
    80001b72:	e822                	sd	s0,16(sp)
    80001b74:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001b76:	fffff097          	auipc	ra,0xfffff
    80001b7a:	660080e7          	jalr	1632(ra) # 800011d6 <kalloc>
    80001b7e:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001b82:	6605                	lui	a2,0x1
    80001b84:	4581                	li	a1,0
    80001b86:	fe843503          	ld	a0,-24(s0)
    80001b8a:	00000097          	auipc	ra,0x0
    80001b8e:	974080e7          	jalr	-1676(ra) # 800014fe <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001b92:	4719                	li	a4,6
    80001b94:	6685                	lui	a3,0x1
    80001b96:	10000637          	lui	a2,0x10000
    80001b9a:	100005b7          	lui	a1,0x10000
    80001b9e:	fe843503          	ld	a0,-24(s0)
    80001ba2:	00000097          	auipc	ra,0x0
    80001ba6:	2b6080e7          	jalr	694(ra) # 80001e58 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001baa:	4719                	li	a4,6
    80001bac:	6685                	lui	a3,0x1
    80001bae:	10001637          	lui	a2,0x10001
    80001bb2:	100015b7          	lui	a1,0x10001
    80001bb6:	fe843503          	ld	a0,-24(s0)
    80001bba:	00000097          	auipc	ra,0x0
    80001bbe:	29e080e7          	jalr	670(ra) # 80001e58 <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001bc2:	4719                	li	a4,6
    80001bc4:	6685                	lui	a3,0x1
    80001bc6:	10002637          	lui	a2,0x10002
    80001bca:	100025b7          	lui	a1,0x10002
    80001bce:	fe843503          	ld	a0,-24(s0)
    80001bd2:	00000097          	auipc	ra,0x0
    80001bd6:	286080e7          	jalr	646(ra) # 80001e58 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001bda:	4719                	li	a4,6
    80001bdc:	004006b7          	lui	a3,0x400
    80001be0:	0c000637          	lui	a2,0xc000
    80001be4:	0c0005b7          	lui	a1,0xc000
    80001be8:	fe843503          	ld	a0,-24(s0)
    80001bec:	00000097          	auipc	ra,0x0
    80001bf0:	26c080e7          	jalr	620(ra) # 80001e58 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001bf4:	00009717          	auipc	a4,0x9
    80001bf8:	40c70713          	addi	a4,a4,1036 # 8000b000 <etext>
    80001bfc:	800007b7          	lui	a5,0x80000
    80001c00:	97ba                	add	a5,a5,a4
    80001c02:	4729                	li	a4,10
    80001c04:	86be                	mv	a3,a5
    80001c06:	4785                	li	a5,1
    80001c08:	01f79613          	slli	a2,a5,0x1f
    80001c0c:	4785                	li	a5,1
    80001c0e:	01f79593          	slli	a1,a5,0x1f
    80001c12:	fe843503          	ld	a0,-24(s0)
    80001c16:	00000097          	auipc	ra,0x0
    80001c1a:	242080e7          	jalr	578(ra) # 80001e58 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001c1e:	00009597          	auipc	a1,0x9
    80001c22:	3e258593          	addi	a1,a1,994 # 8000b000 <etext>
    80001c26:	00009617          	auipc	a2,0x9
    80001c2a:	3da60613          	addi	a2,a2,986 # 8000b000 <etext>
    80001c2e:	00009797          	auipc	a5,0x9
    80001c32:	3d278793          	addi	a5,a5,978 # 8000b000 <etext>
    80001c36:	08100713          	li	a4,129
    80001c3a:	0762                	slli	a4,a4,0x18
    80001c3c:	40f707b3          	sub	a5,a4,a5
    80001c40:	4719                	li	a4,6
    80001c42:	86be                	mv	a3,a5
    80001c44:	fe843503          	ld	a0,-24(s0)
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	210080e7          	jalr	528(ra) # 80001e58 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001c50:	00008797          	auipc	a5,0x8
    80001c54:	3b078793          	addi	a5,a5,944 # 8000a000 <_trampoline>
    80001c58:	4729                	li	a4,10
    80001c5a:	6685                	lui	a3,0x1
    80001c5c:	863e                	mv	a2,a5
    80001c5e:	040007b7          	lui	a5,0x4000
    80001c62:	17fd                	addi	a5,a5,-1
    80001c64:	00c79593          	slli	a1,a5,0xc
    80001c68:	fe843503          	ld	a0,-24(s0)
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	1ec080e7          	jalr	492(ra) # 80001e58 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001c74:	fe843503          	ld	a0,-24(s0)
    80001c78:	00001097          	auipc	ra,0x1
    80001c7c:	c3a080e7          	jalr	-966(ra) # 800028b2 <proc_mapstacks>
  
  return kpgtbl;
    80001c80:	fe843783          	ld	a5,-24(s0)
}
    80001c84:	853e                	mv	a0,a5
    80001c86:	60e2                	ld	ra,24(sp)
    80001c88:	6442                	ld	s0,16(sp)
    80001c8a:	6105                	addi	sp,sp,32
    80001c8c:	8082                	ret

0000000080001c8e <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001c8e:	1141                	addi	sp,sp,-16
    80001c90:	e406                	sd	ra,8(sp)
    80001c92:	e022                	sd	s0,0(sp)
    80001c94:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001c96:	00000097          	auipc	ra,0x0
    80001c9a:	ed8080e7          	jalr	-296(ra) # 80001b6e <kvmmake>
    80001c9e:	872a                	mv	a4,a0
    80001ca0:	0000a797          	auipc	a5,0xa
    80001ca4:	c9878793          	addi	a5,a5,-872 # 8000b938 <kernel_pagetable>
    80001ca8:	e398                	sd	a4,0(a5)
  updaterefhistory();
    80001caa:	00000097          	auipc	ra,0x0
    80001cae:	e18080e7          	jalr	-488(ra) # 80001ac2 <updaterefhistory>
}
    80001cb2:	0001                	nop
    80001cb4:	60a2                	ld	ra,8(sp)
    80001cb6:	6402                	ld	s0,0(sp)
    80001cb8:	0141                	addi	sp,sp,16
    80001cba:	8082                	ret

0000000080001cbc <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001cbc:	1141                	addi	sp,sp,-16
    80001cbe:	e406                	sd	ra,8(sp)
    80001cc0:	e022                	sd	s0,0(sp)
    80001cc2:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	d42080e7          	jalr	-702(ra) # 80001a06 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001ccc:	0000a797          	auipc	a5,0xa
    80001cd0:	c6c78793          	addi	a5,a5,-916 # 8000b938 <kernel_pagetable>
    80001cd4:	639c                	ld	a5,0(a5)
    80001cd6:	00c7d713          	srli	a4,a5,0xc
    80001cda:	57fd                	li	a5,-1
    80001cdc:	17fe                	slli	a5,a5,0x3f
    80001cde:	8fd9                	or	a5,a5,a4
    80001ce0:	853e                	mv	a0,a5
    80001ce2:	00000097          	auipc	ra,0x0
    80001ce6:	d0a080e7          	jalr	-758(ra) # 800019ec <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001cea:	00000097          	auipc	ra,0x0
    80001cee:	d1c080e7          	jalr	-740(ra) # 80001a06 <sfence_vma>
}
    80001cf2:	0001                	nop
    80001cf4:	60a2                	ld	ra,8(sp)
    80001cf6:	6402                	ld	s0,0(sp)
    80001cf8:	0141                	addi	sp,sp,16
    80001cfa:	8082                	ret

0000000080001cfc <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001cfc:	7139                	addi	sp,sp,-64
    80001cfe:	fc06                	sd	ra,56(sp)
    80001d00:	f822                	sd	s0,48(sp)
    80001d02:	0080                	addi	s0,sp,64
    80001d04:	fca43c23          	sd	a0,-40(s0)
    80001d08:	fcb43823          	sd	a1,-48(s0)
    80001d0c:	87b2                	mv	a5,a2
    80001d0e:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001d12:	fd043703          	ld	a4,-48(s0)
    80001d16:	57fd                	li	a5,-1
    80001d18:	83e9                	srli	a5,a5,0x1a
    80001d1a:	00e7f463          	bgeu	a5,a4,80001d22 <walk+0x26>
    return 0;
    80001d1e:	4781                	li	a5,0
    80001d20:	a85d                	j	80001dd6 <walk+0xda>

  for(int level = 2; level > 0; level--) {
    80001d22:	4789                	li	a5,2
    80001d24:	fef42623          	sw	a5,-20(s0)
    80001d28:	a849                	j	80001dba <walk+0xbe>
    pte_t *pte = &pagetable[PX(level, va)];
    80001d2a:	fec42703          	lw	a4,-20(s0)
    80001d2e:	87ba                	mv	a5,a4
    80001d30:	0037979b          	slliw	a5,a5,0x3
    80001d34:	9fb9                	addw	a5,a5,a4
    80001d36:	2781                	sext.w	a5,a5
    80001d38:	27b1                	addiw	a5,a5,12
    80001d3a:	2781                	sext.w	a5,a5
    80001d3c:	873e                	mv	a4,a5
    80001d3e:	fd043783          	ld	a5,-48(s0)
    80001d42:	00e7d7b3          	srl	a5,a5,a4
    80001d46:	1ff7f793          	andi	a5,a5,511
    80001d4a:	078e                	slli	a5,a5,0x3
    80001d4c:	fd843703          	ld	a4,-40(s0)
    80001d50:	97ba                	add	a5,a5,a4
    80001d52:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001d56:	fe043783          	ld	a5,-32(s0)
    80001d5a:	639c                	ld	a5,0(a5)
    80001d5c:	8b85                	andi	a5,a5,1
    80001d5e:	cb89                	beqz	a5,80001d70 <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001d60:	fe043783          	ld	a5,-32(s0)
    80001d64:	639c                	ld	a5,0(a5)
    80001d66:	83a9                	srli	a5,a5,0xa
    80001d68:	07b2                	slli	a5,a5,0xc
    80001d6a:	fcf43c23          	sd	a5,-40(s0)
    80001d6e:	a089                	j	80001db0 <walk+0xb4>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001d70:	fcc42783          	lw	a5,-52(s0)
    80001d74:	2781                	sext.w	a5,a5
    80001d76:	cb91                	beqz	a5,80001d8a <walk+0x8e>
    80001d78:	fffff097          	auipc	ra,0xfffff
    80001d7c:	45e080e7          	jalr	1118(ra) # 800011d6 <kalloc>
    80001d80:	fca43c23          	sd	a0,-40(s0)
    80001d84:	fd843783          	ld	a5,-40(s0)
    80001d88:	e399                	bnez	a5,80001d8e <walk+0x92>
        return 0;
    80001d8a:	4781                	li	a5,0
    80001d8c:	a0a9                	j	80001dd6 <walk+0xda>
      memset(pagetable, 0, PGSIZE);
    80001d8e:	6605                	lui	a2,0x1
    80001d90:	4581                	li	a1,0
    80001d92:	fd843503          	ld	a0,-40(s0)
    80001d96:	fffff097          	auipc	ra,0xfffff
    80001d9a:	768080e7          	jalr	1896(ra) # 800014fe <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001d9e:	fd843783          	ld	a5,-40(s0)
    80001da2:	83b1                	srli	a5,a5,0xc
    80001da4:	07aa                	slli	a5,a5,0xa
    80001da6:	0017e713          	ori	a4,a5,1
    80001daa:	fe043783          	ld	a5,-32(s0)
    80001dae:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001db0:	fec42783          	lw	a5,-20(s0)
    80001db4:	37fd                	addiw	a5,a5,-1
    80001db6:	fef42623          	sw	a5,-20(s0)
    80001dba:	fec42783          	lw	a5,-20(s0)
    80001dbe:	2781                	sext.w	a5,a5
    80001dc0:	f6f045e3          	bgtz	a5,80001d2a <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    80001dc4:	fd043783          	ld	a5,-48(s0)
    80001dc8:	83b1                	srli	a5,a5,0xc
    80001dca:	1ff7f793          	andi	a5,a5,511
    80001dce:	078e                	slli	a5,a5,0x3
    80001dd0:	fd843703          	ld	a4,-40(s0)
    80001dd4:	97ba                	add	a5,a5,a4
}
    80001dd6:	853e                	mv	a0,a5
    80001dd8:	70e2                	ld	ra,56(sp)
    80001dda:	7442                	ld	s0,48(sp)
    80001ddc:	6121                	addi	sp,sp,64
    80001dde:	8082                	ret

0000000080001de0 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001de0:	7179                	addi	sp,sp,-48
    80001de2:	f406                	sd	ra,40(sp)
    80001de4:	f022                	sd	s0,32(sp)
    80001de6:	1800                	addi	s0,sp,48
    80001de8:	fca43c23          	sd	a0,-40(s0)
    80001dec:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001df0:	fd043703          	ld	a4,-48(s0)
    80001df4:	57fd                	li	a5,-1
    80001df6:	83e9                	srli	a5,a5,0x1a
    80001df8:	00e7f463          	bgeu	a5,a4,80001e00 <walkaddr+0x20>
    return 0;
    80001dfc:	4781                	li	a5,0
    80001dfe:	a881                	j	80001e4e <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001e00:	4601                	li	a2,0
    80001e02:	fd043583          	ld	a1,-48(s0)
    80001e06:	fd843503          	ld	a0,-40(s0)
    80001e0a:	00000097          	auipc	ra,0x0
    80001e0e:	ef2080e7          	jalr	-270(ra) # 80001cfc <walk>
    80001e12:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001e16:	fe843783          	ld	a5,-24(s0)
    80001e1a:	e399                	bnez	a5,80001e20 <walkaddr+0x40>
    return 0;
    80001e1c:	4781                	li	a5,0
    80001e1e:	a805                	j	80001e4e <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001e20:	fe843783          	ld	a5,-24(s0)
    80001e24:	639c                	ld	a5,0(a5)
    80001e26:	8b85                	andi	a5,a5,1
    80001e28:	e399                	bnez	a5,80001e2e <walkaddr+0x4e>
    return 0;
    80001e2a:	4781                	li	a5,0
    80001e2c:	a00d                	j	80001e4e <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001e2e:	fe843783          	ld	a5,-24(s0)
    80001e32:	639c                	ld	a5,0(a5)
    80001e34:	8bc1                	andi	a5,a5,16
    80001e36:	e399                	bnez	a5,80001e3c <walkaddr+0x5c>
    return 0;
    80001e38:	4781                	li	a5,0
    80001e3a:	a811                	j	80001e4e <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001e3c:	fe843783          	ld	a5,-24(s0)
    80001e40:	639c                	ld	a5,0(a5)
    80001e42:	83a9                	srli	a5,a5,0xa
    80001e44:	07b2                	slli	a5,a5,0xc
    80001e46:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001e4a:	fe043783          	ld	a5,-32(s0)
}
    80001e4e:	853e                	mv	a0,a5
    80001e50:	70a2                	ld	ra,40(sp)
    80001e52:	7402                	ld	s0,32(sp)
    80001e54:	6145                	addi	sp,sp,48
    80001e56:	8082                	ret

0000000080001e58 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001e58:	7139                	addi	sp,sp,-64
    80001e5a:	fc06                	sd	ra,56(sp)
    80001e5c:	f822                	sd	s0,48(sp)
    80001e5e:	0080                	addi	s0,sp,64
    80001e60:	fea43423          	sd	a0,-24(s0)
    80001e64:	feb43023          	sd	a1,-32(s0)
    80001e68:	fcc43c23          	sd	a2,-40(s0)
    80001e6c:	fcd43823          	sd	a3,-48(s0)
    80001e70:	87ba                	mv	a5,a4
    80001e72:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001e76:	fcc42783          	lw	a5,-52(s0)
    80001e7a:	873e                	mv	a4,a5
    80001e7c:	fd843683          	ld	a3,-40(s0)
    80001e80:	fd043603          	ld	a2,-48(s0)
    80001e84:	fe043583          	ld	a1,-32(s0)
    80001e88:	fe843503          	ld	a0,-24(s0)
    80001e8c:	00000097          	auipc	ra,0x0
    80001e90:	026080e7          	jalr	38(ra) # 80001eb2 <mappages>
    80001e94:	87aa                	mv	a5,a0
    80001e96:	cb89                	beqz	a5,80001ea8 <kvmmap+0x50>
    panic("kvmmap");
    80001e98:	00009517          	auipc	a0,0x9
    80001e9c:	24050513          	addi	a0,a0,576 # 8000b0d8 <etext+0xd8>
    80001ea0:	fffff097          	auipc	ra,0xfffff
    80001ea4:	dec080e7          	jalr	-532(ra) # 80000c8c <panic>
}
    80001ea8:	0001                	nop
    80001eaa:	70e2                	ld	ra,56(sp)
    80001eac:	7442                	ld	s0,48(sp)
    80001eae:	6121                	addi	sp,sp,64
    80001eb0:	8082                	ret

0000000080001eb2 <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001eb2:	711d                	addi	sp,sp,-96
    80001eb4:	ec86                	sd	ra,88(sp)
    80001eb6:	e8a2                	sd	s0,80(sp)
    80001eb8:	1080                	addi	s0,sp,96
    80001eba:	fca43423          	sd	a0,-56(s0)
    80001ebe:	fcb43023          	sd	a1,-64(s0)
    80001ec2:	fac43c23          	sd	a2,-72(s0)
    80001ec6:	fad43823          	sd	a3,-80(s0)
    80001eca:	87ba                	mv	a5,a4
    80001ecc:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001ed0:	fb843783          	ld	a5,-72(s0)
    80001ed4:	eb89                	bnez	a5,80001ee6 <mappages+0x34>
    panic("mappages: size");
    80001ed6:	00009517          	auipc	a0,0x9
    80001eda:	20a50513          	addi	a0,a0,522 # 8000b0e0 <etext+0xe0>
    80001ede:	fffff097          	auipc	ra,0xfffff
    80001ee2:	dae080e7          	jalr	-594(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    80001ee6:	fc043703          	ld	a4,-64(s0)
    80001eea:	77fd                	lui	a5,0xfffff
    80001eec:	8ff9                	and	a5,a5,a4
    80001eee:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001ef2:	fc043703          	ld	a4,-64(s0)
    80001ef6:	fb843783          	ld	a5,-72(s0)
    80001efa:	97ba                	add	a5,a5,a4
    80001efc:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffca0cf>
    80001f00:	77fd                	lui	a5,0xfffff
    80001f02:	8ff9                	and	a5,a5,a4
    80001f04:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001f08:	4605                	li	a2,1
    80001f0a:	fe843583          	ld	a1,-24(s0)
    80001f0e:	fc843503          	ld	a0,-56(s0)
    80001f12:	00000097          	auipc	ra,0x0
    80001f16:	dea080e7          	jalr	-534(ra) # 80001cfc <walk>
    80001f1a:	fca43c23          	sd	a0,-40(s0)
    80001f1e:	fd843783          	ld	a5,-40(s0)
    80001f22:	e399                	bnez	a5,80001f28 <mappages+0x76>
      return -1;
    80001f24:	57fd                	li	a5,-1
    80001f26:	a0b5                	j	80001f92 <mappages+0xe0>
    if(*pte & PTE_V)
    80001f28:	fd843783          	ld	a5,-40(s0)
    80001f2c:	639c                	ld	a5,0(a5)
    80001f2e:	8b85                	andi	a5,a5,1
    80001f30:	cb89                	beqz	a5,80001f42 <mappages+0x90>
      panic("mappages: remap");
    80001f32:	00009517          	auipc	a0,0x9
    80001f36:	1be50513          	addi	a0,a0,446 # 8000b0f0 <etext+0xf0>
    80001f3a:	fffff097          	auipc	ra,0xfffff
    80001f3e:	d52080e7          	jalr	-686(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    80001f42:	fb043783          	ld	a5,-80(s0)
    80001f46:	83b1                	srli	a5,a5,0xc
    80001f48:	00a79713          	slli	a4,a5,0xa
    80001f4c:	fac42783          	lw	a5,-84(s0)
    80001f50:	8fd9                	or	a5,a5,a4
    80001f52:	0017e713          	ori	a4,a5,1
    80001f56:	fd843783          	ld	a5,-40(s0)
    80001f5a:	e398                	sd	a4,0(a5)
    reglrupage(pte);
    80001f5c:	fd843503          	ld	a0,-40(s0)
    80001f60:	00000097          	auipc	ra,0x0
    80001f64:	ad8080e7          	jalr	-1320(ra) # 80001a38 <reglrupage>
    if(a == last)
    80001f68:	fe843703          	ld	a4,-24(s0)
    80001f6c:	fe043783          	ld	a5,-32(s0)
    80001f70:	00f70f63          	beq	a4,a5,80001f8e <mappages+0xdc>
      break;
    a += PGSIZE;
    80001f74:	fe843703          	ld	a4,-24(s0)
    80001f78:	6785                	lui	a5,0x1
    80001f7a:	97ba                	add	a5,a5,a4
    80001f7c:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80001f80:	fb043703          	ld	a4,-80(s0)
    80001f84:	6785                	lui	a5,0x1
    80001f86:	97ba                	add	a5,a5,a4
    80001f88:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80001f8c:	bfb5                	j	80001f08 <mappages+0x56>
      break;
    80001f8e:	0001                	nop
  }
  return 0;
    80001f90:	4781                	li	a5,0
}
    80001f92:	853e                	mv	a0,a5
    80001f94:	60e6                	ld	ra,88(sp)
    80001f96:	6446                	ld	s0,80(sp)
    80001f98:	6125                	addi	sp,sp,96
    80001f9a:	8082                	ret

0000000080001f9c <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80001f9c:	715d                	addi	sp,sp,-80
    80001f9e:	e486                	sd	ra,72(sp)
    80001fa0:	e0a2                	sd	s0,64(sp)
    80001fa2:	0880                	addi	s0,sp,80
    80001fa4:	fca43423          	sd	a0,-56(s0)
    80001fa8:	fcb43023          	sd	a1,-64(s0)
    80001fac:	fac43c23          	sd	a2,-72(s0)
    80001fb0:	87b6                	mv	a5,a3
    80001fb2:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    80001fb6:	fc043703          	ld	a4,-64(s0)
    80001fba:	6785                	lui	a5,0x1
    80001fbc:	17fd                	addi	a5,a5,-1
    80001fbe:	8ff9                	and	a5,a5,a4
    80001fc0:	cb89                	beqz	a5,80001fd2 <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    80001fc2:	00009517          	auipc	a0,0x9
    80001fc6:	13e50513          	addi	a0,a0,318 # 8000b100 <etext+0x100>
    80001fca:	fffff097          	auipc	ra,0xfffff
    80001fce:	cc2080e7          	jalr	-830(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80001fd2:	fc043783          	ld	a5,-64(s0)
    80001fd6:	fef43423          	sd	a5,-24(s0)
    80001fda:	a075                	j	80002086 <uvmunmap+0xea>
    if((pte = walk(pagetable, a, 0)) == 0)
    80001fdc:	4601                	li	a2,0
    80001fde:	fe843583          	ld	a1,-24(s0)
    80001fe2:	fc843503          	ld	a0,-56(s0)
    80001fe6:	00000097          	auipc	ra,0x0
    80001fea:	d16080e7          	jalr	-746(ra) # 80001cfc <walk>
    80001fee:	fea43023          	sd	a0,-32(s0)
    80001ff2:	fe043783          	ld	a5,-32(s0)
    80001ff6:	eb89                	bnez	a5,80002008 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    80001ff8:	00009517          	auipc	a0,0x9
    80001ffc:	12050513          	addi	a0,a0,288 # 8000b118 <etext+0x118>
    80002000:	fffff097          	auipc	ra,0xfffff
    80002004:	c8c080e7          	jalr	-884(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80002008:	fe043783          	ld	a5,-32(s0)
    8000200c:	639c                	ld	a5,0(a5)
    8000200e:	8b85                	andi	a5,a5,1
    80002010:	eb89                	bnez	a5,80002022 <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    80002012:	00009517          	auipc	a0,0x9
    80002016:	11650513          	addi	a0,a0,278 # 8000b128 <etext+0x128>
    8000201a:	fffff097          	auipc	ra,0xfffff
    8000201e:	c72080e7          	jalr	-910(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    80002022:	fe043783          	ld	a5,-32(s0)
    80002026:	639c                	ld	a5,0(a5)
    80002028:	3ff7f713          	andi	a4,a5,1023
    8000202c:	4785                	li	a5,1
    8000202e:	00f71a63          	bne	a4,a5,80002042 <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    80002032:	00009517          	auipc	a0,0x9
    80002036:	10e50513          	addi	a0,a0,270 # 8000b140 <etext+0x140>
    8000203a:	fffff097          	auipc	ra,0xfffff
    8000203e:	c52080e7          	jalr	-942(ra) # 80000c8c <panic>
    if(do_free){
    80002042:	fb442783          	lw	a5,-76(s0)
    80002046:	2781                	sext.w	a5,a5
    80002048:	c78d                	beqz	a5,80002072 <uvmunmap+0xd6>
      unreglrupage(pte);
    8000204a:	fe043503          	ld	a0,-32(s0)
    8000204e:	00000097          	auipc	ra,0x0
    80002052:	a3a080e7          	jalr	-1478(ra) # 80001a88 <unreglrupage>
      uint64 pa = PTE2PA(*pte);
    80002056:	fe043783          	ld	a5,-32(s0)
    8000205a:	639c                	ld	a5,0(a5)
    8000205c:	83a9                	srli	a5,a5,0xa
    8000205e:	07b2                	slli	a5,a5,0xc
    80002060:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    80002064:	fd843783          	ld	a5,-40(s0)
    80002068:	853e                	mv	a0,a5
    8000206a:	fffff097          	auipc	ra,0xfffff
    8000206e:	0c6080e7          	jalr	198(ra) # 80001130 <kfree>
    }
    *pte = 0;
    80002072:	fe043783          	ld	a5,-32(s0)
    80002076:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    8000207a:	fe843703          	ld	a4,-24(s0)
    8000207e:	6785                	lui	a5,0x1
    80002080:	97ba                	add	a5,a5,a4
    80002082:	fef43423          	sd	a5,-24(s0)
    80002086:	fb843783          	ld	a5,-72(s0)
    8000208a:	00c79713          	slli	a4,a5,0xc
    8000208e:	fc043783          	ld	a5,-64(s0)
    80002092:	97ba                	add	a5,a5,a4
    80002094:	fe843703          	ld	a4,-24(s0)
    80002098:	f4f762e3          	bltu	a4,a5,80001fdc <uvmunmap+0x40>
  }
}
    8000209c:	0001                	nop
    8000209e:	0001                	nop
    800020a0:	60a6                	ld	ra,72(sp)
    800020a2:	6406                	ld	s0,64(sp)
    800020a4:	6161                	addi	sp,sp,80
    800020a6:	8082                	ret

00000000800020a8 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    800020a8:	1101                	addi	sp,sp,-32
    800020aa:	ec06                	sd	ra,24(sp)
    800020ac:	e822                	sd	s0,16(sp)
    800020ae:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    800020b0:	fffff097          	auipc	ra,0xfffff
    800020b4:	126080e7          	jalr	294(ra) # 800011d6 <kalloc>
    800020b8:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    800020bc:	fe843783          	ld	a5,-24(s0)
    800020c0:	e399                	bnez	a5,800020c6 <uvmcreate+0x1e>
    return 0;
    800020c2:	4781                	li	a5,0
    800020c4:	a819                	j	800020da <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    800020c6:	6605                	lui	a2,0x1
    800020c8:	4581                	li	a1,0
    800020ca:	fe843503          	ld	a0,-24(s0)
    800020ce:	fffff097          	auipc	ra,0xfffff
    800020d2:	430080e7          	jalr	1072(ra) # 800014fe <memset>
  return pagetable;
    800020d6:	fe843783          	ld	a5,-24(s0)
}
    800020da:	853e                	mv	a0,a5
    800020dc:	60e2                	ld	ra,24(sp)
    800020de:	6442                	ld	s0,16(sp)
    800020e0:	6105                	addi	sp,sp,32
    800020e2:	8082                	ret

00000000800020e4 <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    800020e4:	7139                	addi	sp,sp,-64
    800020e6:	fc06                	sd	ra,56(sp)
    800020e8:	f822                	sd	s0,48(sp)
    800020ea:	0080                	addi	s0,sp,64
    800020ec:	fca43c23          	sd	a0,-40(s0)
    800020f0:	fcb43823          	sd	a1,-48(s0)
    800020f4:	87b2                	mv	a5,a2
    800020f6:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    800020fa:	fcc42783          	lw	a5,-52(s0)
    800020fe:	0007871b          	sext.w	a4,a5
    80002102:	6785                	lui	a5,0x1
    80002104:	00f76a63          	bltu	a4,a5,80002118 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    80002108:	00009517          	auipc	a0,0x9
    8000210c:	05050513          	addi	a0,a0,80 # 8000b158 <etext+0x158>
    80002110:	fffff097          	auipc	ra,0xfffff
    80002114:	b7c080e7          	jalr	-1156(ra) # 80000c8c <panic>
  mem = kalloc();
    80002118:	fffff097          	auipc	ra,0xfffff
    8000211c:	0be080e7          	jalr	190(ra) # 800011d6 <kalloc>
    80002120:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    80002124:	6605                	lui	a2,0x1
    80002126:	4581                	li	a1,0
    80002128:	fe843503          	ld	a0,-24(s0)
    8000212c:	fffff097          	auipc	ra,0xfffff
    80002130:	3d2080e7          	jalr	978(ra) # 800014fe <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    80002134:	fe843783          	ld	a5,-24(s0)
    80002138:	4779                	li	a4,30
    8000213a:	86be                	mv	a3,a5
    8000213c:	6605                	lui	a2,0x1
    8000213e:	4581                	li	a1,0
    80002140:	fd843503          	ld	a0,-40(s0)
    80002144:	00000097          	auipc	ra,0x0
    80002148:	d6e080e7          	jalr	-658(ra) # 80001eb2 <mappages>
  memmove(mem, src, sz);
    8000214c:	fcc42783          	lw	a5,-52(s0)
    80002150:	863e                	mv	a2,a5
    80002152:	fd043583          	ld	a1,-48(s0)
    80002156:	fe843503          	ld	a0,-24(s0)
    8000215a:	fffff097          	auipc	ra,0xfffff
    8000215e:	488080e7          	jalr	1160(ra) # 800015e2 <memmove>
}
    80002162:	0001                	nop
    80002164:	70e2                	ld	ra,56(sp)
    80002166:	7442                	ld	s0,48(sp)
    80002168:	6121                	addi	sp,sp,64
    8000216a:	8082                	ret

000000008000216c <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    8000216c:	7139                	addi	sp,sp,-64
    8000216e:	fc06                	sd	ra,56(sp)
    80002170:	f822                	sd	s0,48(sp)
    80002172:	0080                	addi	s0,sp,64
    80002174:	fca43c23          	sd	a0,-40(s0)
    80002178:	fcb43823          	sd	a1,-48(s0)
    8000217c:	fcc43423          	sd	a2,-56(s0)
    80002180:	87b6                	mv	a5,a3
    80002182:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    80002186:	fc843703          	ld	a4,-56(s0)
    8000218a:	fd043783          	ld	a5,-48(s0)
    8000218e:	00f77563          	bgeu	a4,a5,80002198 <uvmalloc+0x2c>
    return oldsz;
    80002192:	fd043783          	ld	a5,-48(s0)
    80002196:	a87d                	j	80002254 <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80002198:	fd043703          	ld	a4,-48(s0)
    8000219c:	6785                	lui	a5,0x1
    8000219e:	17fd                	addi	a5,a5,-1
    800021a0:	973e                	add	a4,a4,a5
    800021a2:	77fd                	lui	a5,0xfffff
    800021a4:	8ff9                	and	a5,a5,a4
    800021a6:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    800021aa:	fd043783          	ld	a5,-48(s0)
    800021ae:	fef43423          	sd	a5,-24(s0)
    800021b2:	a849                	j	80002244 <uvmalloc+0xd8>
    mem = kalloc();
    800021b4:	fffff097          	auipc	ra,0xfffff
    800021b8:	022080e7          	jalr	34(ra) # 800011d6 <kalloc>
    800021bc:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    800021c0:	fe043783          	ld	a5,-32(s0)
    800021c4:	ef89                	bnez	a5,800021de <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    800021c6:	fd043603          	ld	a2,-48(s0)
    800021ca:	fe843583          	ld	a1,-24(s0)
    800021ce:	fd843503          	ld	a0,-40(s0)
    800021d2:	00000097          	auipc	ra,0x0
    800021d6:	08c080e7          	jalr	140(ra) # 8000225e <uvmdealloc>
      return 0;
    800021da:	4781                	li	a5,0
    800021dc:	a8a5                	j	80002254 <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    800021de:	6605                	lui	a2,0x1
    800021e0:	4581                	li	a1,0
    800021e2:	fe043503          	ld	a0,-32(s0)
    800021e6:	fffff097          	auipc	ra,0xfffff
    800021ea:	318080e7          	jalr	792(ra) # 800014fe <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    800021ee:	fe043683          	ld	a3,-32(s0)
    800021f2:	fc442783          	lw	a5,-60(s0)
    800021f6:	0127e793          	ori	a5,a5,18
    800021fa:	2781                	sext.w	a5,a5
    800021fc:	873e                	mv	a4,a5
    800021fe:	6605                	lui	a2,0x1
    80002200:	fe843583          	ld	a1,-24(s0)
    80002204:	fd843503          	ld	a0,-40(s0)
    80002208:	00000097          	auipc	ra,0x0
    8000220c:	caa080e7          	jalr	-854(ra) # 80001eb2 <mappages>
    80002210:	87aa                	mv	a5,a0
    80002212:	c39d                	beqz	a5,80002238 <uvmalloc+0xcc>
      kfree(mem);
    80002214:	fe043503          	ld	a0,-32(s0)
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	f18080e7          	jalr	-232(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    80002220:	fd043603          	ld	a2,-48(s0)
    80002224:	fe843583          	ld	a1,-24(s0)
    80002228:	fd843503          	ld	a0,-40(s0)
    8000222c:	00000097          	auipc	ra,0x0
    80002230:	032080e7          	jalr	50(ra) # 8000225e <uvmdealloc>
      return 0;
    80002234:	4781                	li	a5,0
    80002236:	a839                	j	80002254 <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002238:	fe843703          	ld	a4,-24(s0)
    8000223c:	6785                	lui	a5,0x1
    8000223e:	97ba                	add	a5,a5,a4
    80002240:	fef43423          	sd	a5,-24(s0)
    80002244:	fe843703          	ld	a4,-24(s0)
    80002248:	fc843783          	ld	a5,-56(s0)
    8000224c:	f6f764e3          	bltu	a4,a5,800021b4 <uvmalloc+0x48>
    }
  }
  return newsz;
    80002250:	fc843783          	ld	a5,-56(s0)
}
    80002254:	853e                	mv	a0,a5
    80002256:	70e2                	ld	ra,56(sp)
    80002258:	7442                	ld	s0,48(sp)
    8000225a:	6121                	addi	sp,sp,64
    8000225c:	8082                	ret

000000008000225e <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    8000225e:	7139                	addi	sp,sp,-64
    80002260:	fc06                	sd	ra,56(sp)
    80002262:	f822                	sd	s0,48(sp)
    80002264:	0080                	addi	s0,sp,64
    80002266:	fca43c23          	sd	a0,-40(s0)
    8000226a:	fcb43823          	sd	a1,-48(s0)
    8000226e:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    80002272:	fc843703          	ld	a4,-56(s0)
    80002276:	fd043783          	ld	a5,-48(s0)
    8000227a:	00f76563          	bltu	a4,a5,80002284 <uvmdealloc+0x26>
    return oldsz;
    8000227e:	fd043783          	ld	a5,-48(s0)
    80002282:	a885                	j	800022f2 <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    80002284:	fc843703          	ld	a4,-56(s0)
    80002288:	6785                	lui	a5,0x1
    8000228a:	17fd                	addi	a5,a5,-1
    8000228c:	973e                	add	a4,a4,a5
    8000228e:	77fd                	lui	a5,0xfffff
    80002290:	8f7d                	and	a4,a4,a5
    80002292:	fd043683          	ld	a3,-48(s0)
    80002296:	6785                	lui	a5,0x1
    80002298:	17fd                	addi	a5,a5,-1
    8000229a:	96be                	add	a3,a3,a5
    8000229c:	77fd                	lui	a5,0xfffff
    8000229e:	8ff5                	and	a5,a5,a3
    800022a0:	04f77763          	bgeu	a4,a5,800022ee <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    800022a4:	fd043703          	ld	a4,-48(s0)
    800022a8:	6785                	lui	a5,0x1
    800022aa:	17fd                	addi	a5,a5,-1
    800022ac:	973e                	add	a4,a4,a5
    800022ae:	77fd                	lui	a5,0xfffff
    800022b0:	8f7d                	and	a4,a4,a5
    800022b2:	fc843683          	ld	a3,-56(s0)
    800022b6:	6785                	lui	a5,0x1
    800022b8:	17fd                	addi	a5,a5,-1
    800022ba:	96be                	add	a3,a3,a5
    800022bc:	77fd                	lui	a5,0xfffff
    800022be:	8ff5                	and	a5,a5,a3
    800022c0:	40f707b3          	sub	a5,a4,a5
    800022c4:	83b1                	srli	a5,a5,0xc
    800022c6:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    800022ca:	fc843703          	ld	a4,-56(s0)
    800022ce:	6785                	lui	a5,0x1
    800022d0:	17fd                	addi	a5,a5,-1
    800022d2:	973e                	add	a4,a4,a5
    800022d4:	77fd                	lui	a5,0xfffff
    800022d6:	8ff9                	and	a5,a5,a4
    800022d8:	fec42703          	lw	a4,-20(s0)
    800022dc:	4685                	li	a3,1
    800022de:	863a                	mv	a2,a4
    800022e0:	85be                	mv	a1,a5
    800022e2:	fd843503          	ld	a0,-40(s0)
    800022e6:	00000097          	auipc	ra,0x0
    800022ea:	cb6080e7          	jalr	-842(ra) # 80001f9c <uvmunmap>
  }

  return newsz;
    800022ee:	fc843783          	ld	a5,-56(s0)
}
    800022f2:	853e                	mv	a0,a5
    800022f4:	70e2                	ld	ra,56(sp)
    800022f6:	7442                	ld	s0,48(sp)
    800022f8:	6121                	addi	sp,sp,64
    800022fa:	8082                	ret

00000000800022fc <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    800022fc:	7139                	addi	sp,sp,-64
    800022fe:	fc06                	sd	ra,56(sp)
    80002300:	f822                	sd	s0,48(sp)
    80002302:	0080                	addi	s0,sp,64
    80002304:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    80002308:	fe042623          	sw	zero,-20(s0)
    8000230c:	a88d                	j	8000237e <freewalk+0x82>
    pte_t pte = pagetable[i];
    8000230e:	fec42783          	lw	a5,-20(s0)
    80002312:	078e                	slli	a5,a5,0x3
    80002314:	fc843703          	ld	a4,-56(s0)
    80002318:	97ba                	add	a5,a5,a4
    8000231a:	639c                	ld	a5,0(a5)
    8000231c:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002320:	fe043783          	ld	a5,-32(s0)
    80002324:	8b85                	andi	a5,a5,1
    80002326:	cb9d                	beqz	a5,8000235c <freewalk+0x60>
    80002328:	fe043783          	ld	a5,-32(s0)
    8000232c:	8bb9                	andi	a5,a5,14
    8000232e:	e79d                	bnez	a5,8000235c <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    80002330:	fe043783          	ld	a5,-32(s0)
    80002334:	83a9                	srli	a5,a5,0xa
    80002336:	07b2                	slli	a5,a5,0xc
    80002338:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    8000233c:	fd843783          	ld	a5,-40(s0)
    80002340:	853e                	mv	a0,a5
    80002342:	00000097          	auipc	ra,0x0
    80002346:	fba080e7          	jalr	-70(ra) # 800022fc <freewalk>
      pagetable[i] = 0;
    8000234a:	fec42783          	lw	a5,-20(s0)
    8000234e:	078e                	slli	a5,a5,0x3
    80002350:	fc843703          	ld	a4,-56(s0)
    80002354:	97ba                	add	a5,a5,a4
    80002356:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffca0d0>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    8000235a:	a829                	j	80002374 <freewalk+0x78>
    } else if(pte & PTE_V){
    8000235c:	fe043783          	ld	a5,-32(s0)
    80002360:	8b85                	andi	a5,a5,1
    80002362:	cb89                	beqz	a5,80002374 <freewalk+0x78>
      panic("freewalk: leaf");
    80002364:	00009517          	auipc	a0,0x9
    80002368:	e1450513          	addi	a0,a0,-492 # 8000b178 <etext+0x178>
    8000236c:	fffff097          	auipc	ra,0xfffff
    80002370:	920080e7          	jalr	-1760(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    80002374:	fec42783          	lw	a5,-20(s0)
    80002378:	2785                	addiw	a5,a5,1
    8000237a:	fef42623          	sw	a5,-20(s0)
    8000237e:	fec42783          	lw	a5,-20(s0)
    80002382:	0007871b          	sext.w	a4,a5
    80002386:	1ff00793          	li	a5,511
    8000238a:	f8e7d2e3          	bge	a5,a4,8000230e <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    8000238e:	fc843503          	ld	a0,-56(s0)
    80002392:	fffff097          	auipc	ra,0xfffff
    80002396:	d9e080e7          	jalr	-610(ra) # 80001130 <kfree>
}
    8000239a:	0001                	nop
    8000239c:	70e2                	ld	ra,56(sp)
    8000239e:	7442                	ld	s0,48(sp)
    800023a0:	6121                	addi	sp,sp,64
    800023a2:	8082                	ret

00000000800023a4 <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    800023a4:	1101                	addi	sp,sp,-32
    800023a6:	ec06                	sd	ra,24(sp)
    800023a8:	e822                	sd	s0,16(sp)
    800023aa:	1000                	addi	s0,sp,32
    800023ac:	fea43423          	sd	a0,-24(s0)
    800023b0:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    800023b4:	fe043783          	ld	a5,-32(s0)
    800023b8:	c385                	beqz	a5,800023d8 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    800023ba:	fe043703          	ld	a4,-32(s0)
    800023be:	6785                	lui	a5,0x1
    800023c0:	17fd                	addi	a5,a5,-1
    800023c2:	97ba                	add	a5,a5,a4
    800023c4:	83b1                	srli	a5,a5,0xc
    800023c6:	4685                	li	a3,1
    800023c8:	863e                	mv	a2,a5
    800023ca:	4581                	li	a1,0
    800023cc:	fe843503          	ld	a0,-24(s0)
    800023d0:	00000097          	auipc	ra,0x0
    800023d4:	bcc080e7          	jalr	-1076(ra) # 80001f9c <uvmunmap>
  freewalk(pagetable);
    800023d8:	fe843503          	ld	a0,-24(s0)
    800023dc:	00000097          	auipc	ra,0x0
    800023e0:	f20080e7          	jalr	-224(ra) # 800022fc <freewalk>
}
    800023e4:	0001                	nop
    800023e6:	60e2                	ld	ra,24(sp)
    800023e8:	6442                	ld	s0,16(sp)
    800023ea:	6105                	addi	sp,sp,32
    800023ec:	8082                	ret

00000000800023ee <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    800023ee:	711d                	addi	sp,sp,-96
    800023f0:	ec86                	sd	ra,88(sp)
    800023f2:	e8a2                	sd	s0,80(sp)
    800023f4:	1080                	addi	s0,sp,96
    800023f6:	faa43c23          	sd	a0,-72(s0)
    800023fa:	fab43823          	sd	a1,-80(s0)
    800023fe:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    80002402:	fe043423          	sd	zero,-24(s0)
    80002406:	a0d9                	j	800024cc <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    80002408:	4601                	li	a2,0
    8000240a:	fe843583          	ld	a1,-24(s0)
    8000240e:	fb843503          	ld	a0,-72(s0)
    80002412:	00000097          	auipc	ra,0x0
    80002416:	8ea080e7          	jalr	-1814(ra) # 80001cfc <walk>
    8000241a:	fea43023          	sd	a0,-32(s0)
    8000241e:	fe043783          	ld	a5,-32(s0)
    80002422:	eb89                	bnez	a5,80002434 <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    80002424:	00009517          	auipc	a0,0x9
    80002428:	d6450513          	addi	a0,a0,-668 # 8000b188 <etext+0x188>
    8000242c:	fffff097          	auipc	ra,0xfffff
    80002430:	860080e7          	jalr	-1952(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    80002434:	fe043783          	ld	a5,-32(s0)
    80002438:	639c                	ld	a5,0(a5)
    8000243a:	8b85                	andi	a5,a5,1
    8000243c:	eb89                	bnez	a5,8000244e <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    8000243e:	00009517          	auipc	a0,0x9
    80002442:	d6a50513          	addi	a0,a0,-662 # 8000b1a8 <etext+0x1a8>
    80002446:	fffff097          	auipc	ra,0xfffff
    8000244a:	846080e7          	jalr	-1978(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    8000244e:	fe043783          	ld	a5,-32(s0)
    80002452:	639c                	ld	a5,0(a5)
    80002454:	83a9                	srli	a5,a5,0xa
    80002456:	07b2                	slli	a5,a5,0xc
    80002458:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    8000245c:	fe043783          	ld	a5,-32(s0)
    80002460:	639c                	ld	a5,0(a5)
    80002462:	2781                	sext.w	a5,a5
    80002464:	3ff7f793          	andi	a5,a5,1023
    80002468:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    8000246c:	fffff097          	auipc	ra,0xfffff
    80002470:	d6a080e7          	jalr	-662(ra) # 800011d6 <kalloc>
    80002474:	fca43423          	sd	a0,-56(s0)
    80002478:	fc843783          	ld	a5,-56(s0)
    8000247c:	c3a5                	beqz	a5,800024dc <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    8000247e:	fd843783          	ld	a5,-40(s0)
    80002482:	6605                	lui	a2,0x1
    80002484:	85be                	mv	a1,a5
    80002486:	fc843503          	ld	a0,-56(s0)
    8000248a:	fffff097          	auipc	ra,0xfffff
    8000248e:	158080e7          	jalr	344(ra) # 800015e2 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    80002492:	fc843783          	ld	a5,-56(s0)
    80002496:	fd442703          	lw	a4,-44(s0)
    8000249a:	86be                	mv	a3,a5
    8000249c:	6605                	lui	a2,0x1
    8000249e:	fe843583          	ld	a1,-24(s0)
    800024a2:	fb043503          	ld	a0,-80(s0)
    800024a6:	00000097          	auipc	ra,0x0
    800024aa:	a0c080e7          	jalr	-1524(ra) # 80001eb2 <mappages>
    800024ae:	87aa                	mv	a5,a0
    800024b0:	cb81                	beqz	a5,800024c0 <uvmcopy+0xd2>
      kfree(mem);
    800024b2:	fc843503          	ld	a0,-56(s0)
    800024b6:	fffff097          	auipc	ra,0xfffff
    800024ba:	c7a080e7          	jalr	-902(ra) # 80001130 <kfree>
      goto err;
    800024be:	a005                	j	800024de <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    800024c0:	fe843703          	ld	a4,-24(s0)
    800024c4:	6785                	lui	a5,0x1
    800024c6:	97ba                	add	a5,a5,a4
    800024c8:	fef43423          	sd	a5,-24(s0)
    800024cc:	fe843703          	ld	a4,-24(s0)
    800024d0:	fa843783          	ld	a5,-88(s0)
    800024d4:	f2f76ae3          	bltu	a4,a5,80002408 <uvmcopy+0x1a>
    }
  }
  return 0;
    800024d8:	4781                	li	a5,0
    800024da:	a839                	j	800024f8 <uvmcopy+0x10a>
      goto err;
    800024dc:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    800024de:	fe843783          	ld	a5,-24(s0)
    800024e2:	83b1                	srli	a5,a5,0xc
    800024e4:	4685                	li	a3,1
    800024e6:	863e                	mv	a2,a5
    800024e8:	4581                	li	a1,0
    800024ea:	fb043503          	ld	a0,-80(s0)
    800024ee:	00000097          	auipc	ra,0x0
    800024f2:	aae080e7          	jalr	-1362(ra) # 80001f9c <uvmunmap>
  return -1;
    800024f6:	57fd                	li	a5,-1
}
    800024f8:	853e                	mv	a0,a5
    800024fa:	60e6                	ld	ra,88(sp)
    800024fc:	6446                	ld	s0,80(sp)
    800024fe:	6125                	addi	sp,sp,96
    80002500:	8082                	ret

0000000080002502 <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    80002502:	7179                	addi	sp,sp,-48
    80002504:	f406                	sd	ra,40(sp)
    80002506:	f022                	sd	s0,32(sp)
    80002508:	1800                	addi	s0,sp,48
    8000250a:	fca43c23          	sd	a0,-40(s0)
    8000250e:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    80002512:	4601                	li	a2,0
    80002514:	fd043583          	ld	a1,-48(s0)
    80002518:	fd843503          	ld	a0,-40(s0)
    8000251c:	fffff097          	auipc	ra,0xfffff
    80002520:	7e0080e7          	jalr	2016(ra) # 80001cfc <walk>
    80002524:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80002528:	fe843783          	ld	a5,-24(s0)
    8000252c:	eb89                	bnez	a5,8000253e <uvmclear+0x3c>
    panic("uvmclear");
    8000252e:	00009517          	auipc	a0,0x9
    80002532:	c9a50513          	addi	a0,a0,-870 # 8000b1c8 <etext+0x1c8>
    80002536:	ffffe097          	auipc	ra,0xffffe
    8000253a:	756080e7          	jalr	1878(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    8000253e:	fe843783          	ld	a5,-24(s0)
    80002542:	639c                	ld	a5,0(a5)
    80002544:	fef7f713          	andi	a4,a5,-17
    80002548:	fe843783          	ld	a5,-24(s0)
    8000254c:	e398                	sd	a4,0(a5)
  unreglrupage(pte);
    8000254e:	fe843503          	ld	a0,-24(s0)
    80002552:	fffff097          	auipc	ra,0xfffff
    80002556:	536080e7          	jalr	1334(ra) # 80001a88 <unreglrupage>
}
    8000255a:	0001                	nop
    8000255c:	70a2                	ld	ra,40(sp)
    8000255e:	7402                	ld	s0,32(sp)
    80002560:	6145                	addi	sp,sp,48
    80002562:	8082                	ret

0000000080002564 <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    80002564:	715d                	addi	sp,sp,-80
    80002566:	e486                	sd	ra,72(sp)
    80002568:	e0a2                	sd	s0,64(sp)
    8000256a:	0880                	addi	s0,sp,80
    8000256c:	fca43423          	sd	a0,-56(s0)
    80002570:	fcb43023          	sd	a1,-64(s0)
    80002574:	fac43c23          	sd	a2,-72(s0)
    80002578:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    8000257c:	a055                	j	80002620 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    8000257e:	fc043703          	ld	a4,-64(s0)
    80002582:	77fd                	lui	a5,0xfffff
    80002584:	8ff9                	and	a5,a5,a4
    80002586:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    8000258a:	fe043583          	ld	a1,-32(s0)
    8000258e:	fc843503          	ld	a0,-56(s0)
    80002592:	00000097          	auipc	ra,0x0
    80002596:	84e080e7          	jalr	-1970(ra) # 80001de0 <walkaddr>
    8000259a:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000259e:	fd843783          	ld	a5,-40(s0)
    800025a2:	e399                	bnez	a5,800025a8 <copyout+0x44>
      return -1;
    800025a4:	57fd                	li	a5,-1
    800025a6:	a049                	j	80002628 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    800025a8:	fe043703          	ld	a4,-32(s0)
    800025ac:	fc043783          	ld	a5,-64(s0)
    800025b0:	8f1d                	sub	a4,a4,a5
    800025b2:	6785                	lui	a5,0x1
    800025b4:	97ba                	add	a5,a5,a4
    800025b6:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    800025ba:	fe843703          	ld	a4,-24(s0)
    800025be:	fb043783          	ld	a5,-80(s0)
    800025c2:	00e7f663          	bgeu	a5,a4,800025ce <copyout+0x6a>
      n = len;
    800025c6:	fb043783          	ld	a5,-80(s0)
    800025ca:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    800025ce:	fc043703          	ld	a4,-64(s0)
    800025d2:	fe043783          	ld	a5,-32(s0)
    800025d6:	8f1d                	sub	a4,a4,a5
    800025d8:	fd843783          	ld	a5,-40(s0)
    800025dc:	97ba                	add	a5,a5,a4
    800025de:	873e                	mv	a4,a5
    800025e0:	fe843783          	ld	a5,-24(s0)
    800025e4:	2781                	sext.w	a5,a5
    800025e6:	863e                	mv	a2,a5
    800025e8:	fb843583          	ld	a1,-72(s0)
    800025ec:	853a                	mv	a0,a4
    800025ee:	fffff097          	auipc	ra,0xfffff
    800025f2:	ff4080e7          	jalr	-12(ra) # 800015e2 <memmove>

    len -= n;
    800025f6:	fb043703          	ld	a4,-80(s0)
    800025fa:	fe843783          	ld	a5,-24(s0)
    800025fe:	40f707b3          	sub	a5,a4,a5
    80002602:	faf43823          	sd	a5,-80(s0)
    src += n;
    80002606:	fb843703          	ld	a4,-72(s0)
    8000260a:	fe843783          	ld	a5,-24(s0)
    8000260e:	97ba                	add	a5,a5,a4
    80002610:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    80002614:	fe043703          	ld	a4,-32(s0)
    80002618:	6785                	lui	a5,0x1
    8000261a:	97ba                	add	a5,a5,a4
    8000261c:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    80002620:	fb043783          	ld	a5,-80(s0)
    80002624:	ffa9                	bnez	a5,8000257e <copyout+0x1a>
  }
  return 0;
    80002626:	4781                	li	a5,0
}
    80002628:	853e                	mv	a0,a5
    8000262a:	60a6                	ld	ra,72(sp)
    8000262c:	6406                	ld	s0,64(sp)
    8000262e:	6161                	addi	sp,sp,80
    80002630:	8082                	ret

0000000080002632 <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    80002632:	715d                	addi	sp,sp,-80
    80002634:	e486                	sd	ra,72(sp)
    80002636:	e0a2                	sd	s0,64(sp)
    80002638:	0880                	addi	s0,sp,80
    8000263a:	fca43423          	sd	a0,-56(s0)
    8000263e:	fcb43023          	sd	a1,-64(s0)
    80002642:	fac43c23          	sd	a2,-72(s0)
    80002646:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    8000264a:	a055                	j	800026ee <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    8000264c:	fb843703          	ld	a4,-72(s0)
    80002650:	77fd                	lui	a5,0xfffff
    80002652:	8ff9                	and	a5,a5,a4
    80002654:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002658:	fe043583          	ld	a1,-32(s0)
    8000265c:	fc843503          	ld	a0,-56(s0)
    80002660:	fffff097          	auipc	ra,0xfffff
    80002664:	780080e7          	jalr	1920(ra) # 80001de0 <walkaddr>
    80002668:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    8000266c:	fd843783          	ld	a5,-40(s0)
    80002670:	e399                	bnez	a5,80002676 <copyin+0x44>
      return -1;
    80002672:	57fd                	li	a5,-1
    80002674:	a049                	j	800026f6 <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    80002676:	fe043703          	ld	a4,-32(s0)
    8000267a:	fb843783          	ld	a5,-72(s0)
    8000267e:	8f1d                	sub	a4,a4,a5
    80002680:	6785                	lui	a5,0x1
    80002682:	97ba                	add	a5,a5,a4
    80002684:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002688:	fe843703          	ld	a4,-24(s0)
    8000268c:	fb043783          	ld	a5,-80(s0)
    80002690:	00e7f663          	bgeu	a5,a4,8000269c <copyin+0x6a>
      n = len;
    80002694:	fb043783          	ld	a5,-80(s0)
    80002698:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    8000269c:	fb843703          	ld	a4,-72(s0)
    800026a0:	fe043783          	ld	a5,-32(s0)
    800026a4:	8f1d                	sub	a4,a4,a5
    800026a6:	fd843783          	ld	a5,-40(s0)
    800026aa:	97ba                	add	a5,a5,a4
    800026ac:	873e                	mv	a4,a5
    800026ae:	fe843783          	ld	a5,-24(s0)
    800026b2:	2781                	sext.w	a5,a5
    800026b4:	863e                	mv	a2,a5
    800026b6:	85ba                	mv	a1,a4
    800026b8:	fc043503          	ld	a0,-64(s0)
    800026bc:	fffff097          	auipc	ra,0xfffff
    800026c0:	f26080e7          	jalr	-218(ra) # 800015e2 <memmove>

    len -= n;
    800026c4:	fb043703          	ld	a4,-80(s0)
    800026c8:	fe843783          	ld	a5,-24(s0)
    800026cc:	40f707b3          	sub	a5,a4,a5
    800026d0:	faf43823          	sd	a5,-80(s0)
    dst += n;
    800026d4:	fc043703          	ld	a4,-64(s0)
    800026d8:	fe843783          	ld	a5,-24(s0)
    800026dc:	97ba                	add	a5,a5,a4
    800026de:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    800026e2:	fe043703          	ld	a4,-32(s0)
    800026e6:	6785                	lui	a5,0x1
    800026e8:	97ba                	add	a5,a5,a4
    800026ea:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    800026ee:	fb043783          	ld	a5,-80(s0)
    800026f2:	ffa9                	bnez	a5,8000264c <copyin+0x1a>
  }
  return 0;
    800026f4:	4781                	li	a5,0
}
    800026f6:	853e                	mv	a0,a5
    800026f8:	60a6                	ld	ra,72(sp)
    800026fa:	6406                	ld	s0,64(sp)
    800026fc:	6161                	addi	sp,sp,80
    800026fe:	8082                	ret

0000000080002700 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    80002700:	711d                	addi	sp,sp,-96
    80002702:	ec86                	sd	ra,88(sp)
    80002704:	e8a2                	sd	s0,80(sp)
    80002706:	1080                	addi	s0,sp,96
    80002708:	faa43c23          	sd	a0,-72(s0)
    8000270c:	fab43823          	sd	a1,-80(s0)
    80002710:	fac43423          	sd	a2,-88(s0)
    80002714:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    80002718:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    8000271c:	a0f1                	j	800027e8 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    8000271e:	fa843703          	ld	a4,-88(s0)
    80002722:	77fd                	lui	a5,0xfffff
    80002724:	8ff9                	and	a5,a5,a4
    80002726:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    8000272a:	fd043583          	ld	a1,-48(s0)
    8000272e:	fb843503          	ld	a0,-72(s0)
    80002732:	fffff097          	auipc	ra,0xfffff
    80002736:	6ae080e7          	jalr	1710(ra) # 80001de0 <walkaddr>
    8000273a:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    8000273e:	fc843783          	ld	a5,-56(s0)
    80002742:	e399                	bnez	a5,80002748 <copyinstr+0x48>
      return -1;
    80002744:	57fd                	li	a5,-1
    80002746:	a87d                	j	80002804 <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    80002748:	fd043703          	ld	a4,-48(s0)
    8000274c:	fa843783          	ld	a5,-88(s0)
    80002750:	8f1d                	sub	a4,a4,a5
    80002752:	6785                	lui	a5,0x1
    80002754:	97ba                	add	a5,a5,a4
    80002756:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    8000275a:	fe843703          	ld	a4,-24(s0)
    8000275e:	fa043783          	ld	a5,-96(s0)
    80002762:	00e7f663          	bgeu	a5,a4,8000276e <copyinstr+0x6e>
      n = max;
    80002766:	fa043783          	ld	a5,-96(s0)
    8000276a:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    8000276e:	fa843703          	ld	a4,-88(s0)
    80002772:	fd043783          	ld	a5,-48(s0)
    80002776:	8f1d                	sub	a4,a4,a5
    80002778:	fc843783          	ld	a5,-56(s0)
    8000277c:	97ba                	add	a5,a5,a4
    8000277e:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    80002782:	a891                	j	800027d6 <copyinstr+0xd6>
      if(*p == '\0'){
    80002784:	fd843783          	ld	a5,-40(s0)
    80002788:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    8000278c:	eb89                	bnez	a5,8000279e <copyinstr+0x9e>
        *dst = '\0';
    8000278e:	fb043783          	ld	a5,-80(s0)
    80002792:	00078023          	sb	zero,0(a5)
        got_null = 1;
    80002796:	4785                	li	a5,1
    80002798:	fef42223          	sw	a5,-28(s0)
        break;
    8000279c:	a081                	j	800027dc <copyinstr+0xdc>
      } else {
        *dst = *p;
    8000279e:	fd843783          	ld	a5,-40(s0)
    800027a2:	0007c703          	lbu	a4,0(a5)
    800027a6:	fb043783          	ld	a5,-80(s0)
    800027aa:	00e78023          	sb	a4,0(a5)
      }
      --n;
    800027ae:	fe843783          	ld	a5,-24(s0)
    800027b2:	17fd                	addi	a5,a5,-1
    800027b4:	fef43423          	sd	a5,-24(s0)
      --max;
    800027b8:	fa043783          	ld	a5,-96(s0)
    800027bc:	17fd                	addi	a5,a5,-1
    800027be:	faf43023          	sd	a5,-96(s0)
      p++;
    800027c2:	fd843783          	ld	a5,-40(s0)
    800027c6:	0785                	addi	a5,a5,1
    800027c8:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    800027cc:	fb043783          	ld	a5,-80(s0)
    800027d0:	0785                	addi	a5,a5,1
    800027d2:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    800027d6:	fe843783          	ld	a5,-24(s0)
    800027da:	f7cd                	bnez	a5,80002784 <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    800027dc:	fd043703          	ld	a4,-48(s0)
    800027e0:	6785                	lui	a5,0x1
    800027e2:	97ba                	add	a5,a5,a4
    800027e4:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    800027e8:	fe442783          	lw	a5,-28(s0)
    800027ec:	2781                	sext.w	a5,a5
    800027ee:	e781                	bnez	a5,800027f6 <copyinstr+0xf6>
    800027f0:	fa043783          	ld	a5,-96(s0)
    800027f4:	f78d                	bnez	a5,8000271e <copyinstr+0x1e>
  }
  if(got_null){
    800027f6:	fe442783          	lw	a5,-28(s0)
    800027fa:	2781                	sext.w	a5,a5
    800027fc:	c399                	beqz	a5,80002802 <copyinstr+0x102>
    return 0;
    800027fe:	4781                	li	a5,0
    80002800:	a011                	j	80002804 <copyinstr+0x104>
  } else {
    return -1;
    80002802:	57fd                	li	a5,-1
  }
}
    80002804:	853e                	mv	a0,a5
    80002806:	60e6                	ld	ra,88(sp)
    80002808:	6446                	ld	s0,80(sp)
    8000280a:	6125                	addi	sp,sp,96
    8000280c:	8082                	ret

000000008000280e <r_sstatus>:
{
    8000280e:	1101                	addi	sp,sp,-32
    80002810:	ec22                	sd	s0,24(sp)
    80002812:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80002814:	100027f3          	csrr	a5,sstatus
    80002818:	fef43423          	sd	a5,-24(s0)
  return x;
    8000281c:	fe843783          	ld	a5,-24(s0)
}
    80002820:	853e                	mv	a0,a5
    80002822:	6462                	ld	s0,24(sp)
    80002824:	6105                	addi	sp,sp,32
    80002826:	8082                	ret

0000000080002828 <w_sstatus>:
{
    80002828:	1101                	addi	sp,sp,-32
    8000282a:	ec22                	sd	s0,24(sp)
    8000282c:	1000                	addi	s0,sp,32
    8000282e:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80002832:	fe843783          	ld	a5,-24(s0)
    80002836:	10079073          	csrw	sstatus,a5
}
    8000283a:	0001                	nop
    8000283c:	6462                	ld	s0,24(sp)
    8000283e:	6105                	addi	sp,sp,32
    80002840:	8082                	ret

0000000080002842 <intr_on>:
{
    80002842:	1141                	addi	sp,sp,-16
    80002844:	e406                	sd	ra,8(sp)
    80002846:	e022                	sd	s0,0(sp)
    80002848:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    8000284a:	00000097          	auipc	ra,0x0
    8000284e:	fc4080e7          	jalr	-60(ra) # 8000280e <r_sstatus>
    80002852:	87aa                	mv	a5,a0
    80002854:	0027e793          	ori	a5,a5,2
    80002858:	853e                	mv	a0,a5
    8000285a:	00000097          	auipc	ra,0x0
    8000285e:	fce080e7          	jalr	-50(ra) # 80002828 <w_sstatus>
}
    80002862:	0001                	nop
    80002864:	60a2                	ld	ra,8(sp)
    80002866:	6402                	ld	s0,0(sp)
    80002868:	0141                	addi	sp,sp,16
    8000286a:	8082                	ret

000000008000286c <intr_get>:
{
    8000286c:	1101                	addi	sp,sp,-32
    8000286e:	ec06                	sd	ra,24(sp)
    80002870:	e822                	sd	s0,16(sp)
    80002872:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80002874:	00000097          	auipc	ra,0x0
    80002878:	f9a080e7          	jalr	-102(ra) # 8000280e <r_sstatus>
    8000287c:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002880:	fe843783          	ld	a5,-24(s0)
    80002884:	8b89                	andi	a5,a5,2
    80002886:	00f037b3          	snez	a5,a5
    8000288a:	0ff7f793          	andi	a5,a5,255
    8000288e:	2781                	sext.w	a5,a5
}
    80002890:	853e                	mv	a0,a5
    80002892:	60e2                	ld	ra,24(sp)
    80002894:	6442                	ld	s0,16(sp)
    80002896:	6105                	addi	sp,sp,32
    80002898:	8082                	ret

000000008000289a <r_tp>:
{
    8000289a:	1101                	addi	sp,sp,-32
    8000289c:	ec22                	sd	s0,24(sp)
    8000289e:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    800028a0:	8792                	mv	a5,tp
    800028a2:	fef43423          	sd	a5,-24(s0)
  return x;
    800028a6:	fe843783          	ld	a5,-24(s0)
}
    800028aa:	853e                	mv	a0,a5
    800028ac:	6462                	ld	s0,24(sp)
    800028ae:	6105                	addi	sp,sp,32
    800028b0:	8082                	ret

00000000800028b2 <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    800028b2:	7139                	addi	sp,sp,-64
    800028b4:	fc06                	sd	ra,56(sp)
    800028b6:	f822                	sd	s0,48(sp)
    800028b8:	0080                	addi	s0,sp,64
    800028ba:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    800028be:	00021797          	auipc	a5,0x21
    800028c2:	6fa78793          	addi	a5,a5,1786 # 80023fb8 <proc>
    800028c6:	fef43423          	sd	a5,-24(s0)
    800028ca:	a061                	j	80002952 <proc_mapstacks+0xa0>
    char *pa = kalloc();
    800028cc:	fffff097          	auipc	ra,0xfffff
    800028d0:	90a080e7          	jalr	-1782(ra) # 800011d6 <kalloc>
    800028d4:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800028d8:	fe043783          	ld	a5,-32(s0)
    800028dc:	eb89                	bnez	a5,800028ee <proc_mapstacks+0x3c>
      panic("kalloc");
    800028de:	00009517          	auipc	a0,0x9
    800028e2:	8fa50513          	addi	a0,a0,-1798 # 8000b1d8 <etext+0x1d8>
    800028e6:	ffffe097          	auipc	ra,0xffffe
    800028ea:	3a6080e7          	jalr	934(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    800028ee:	fe843703          	ld	a4,-24(s0)
    800028f2:	00021797          	auipc	a5,0x21
    800028f6:	6c678793          	addi	a5,a5,1734 # 80023fb8 <proc>
    800028fa:	40f707b3          	sub	a5,a4,a5
    800028fe:	4037d713          	srai	a4,a5,0x3
    80002902:	00009797          	auipc	a5,0x9
    80002906:	9ce78793          	addi	a5,a5,-1586 # 8000b2d0 <etext+0x2d0>
    8000290a:	639c                	ld	a5,0(a5)
    8000290c:	02f707b3          	mul	a5,a4,a5
    80002910:	2781                	sext.w	a5,a5
    80002912:	2785                	addiw	a5,a5,1
    80002914:	2781                	sext.w	a5,a5
    80002916:	00d7979b          	slliw	a5,a5,0xd
    8000291a:	2781                	sext.w	a5,a5
    8000291c:	873e                	mv	a4,a5
    8000291e:	040007b7          	lui	a5,0x4000
    80002922:	17fd                	addi	a5,a5,-1
    80002924:	07b2                	slli	a5,a5,0xc
    80002926:	8f99                	sub	a5,a5,a4
    80002928:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    8000292c:	fe043783          	ld	a5,-32(s0)
    80002930:	4719                	li	a4,6
    80002932:	6685                	lui	a3,0x1
    80002934:	863e                	mv	a2,a5
    80002936:	fd843583          	ld	a1,-40(s0)
    8000293a:	fc843503          	ld	a0,-56(s0)
    8000293e:	fffff097          	auipc	ra,0xfffff
    80002942:	51a080e7          	jalr	1306(ra) # 80001e58 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002946:	fe843783          	ld	a5,-24(s0)
    8000294a:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    8000294e:	fef43423          	sd	a5,-24(s0)
    80002952:	fe843703          	ld	a4,-24(s0)
    80002956:	00027797          	auipc	a5,0x27
    8000295a:	06278793          	addi	a5,a5,98 # 800299b8 <pid_lock>
    8000295e:	f6f767e3          	bltu	a4,a5,800028cc <proc_mapstacks+0x1a>
  }
}
    80002962:	0001                	nop
    80002964:	0001                	nop
    80002966:	70e2                	ld	ra,56(sp)
    80002968:	7442                	ld	s0,48(sp)
    8000296a:	6121                	addi	sp,sp,64
    8000296c:	8082                	ret

000000008000296e <procinit>:

// initialize the proc table.
void
procinit(void)
{
    8000296e:	1101                	addi	sp,sp,-32
    80002970:	ec06                	sd	ra,24(sp)
    80002972:	e822                	sd	s0,16(sp)
    80002974:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    80002976:	00009597          	auipc	a1,0x9
    8000297a:	86a58593          	addi	a1,a1,-1942 # 8000b1e0 <etext+0x1e0>
    8000297e:	00027517          	auipc	a0,0x27
    80002982:	03a50513          	addi	a0,a0,58 # 800299b8 <pid_lock>
    80002986:	fffff097          	auipc	ra,0xfffff
    8000298a:	974080e7          	jalr	-1676(ra) # 800012fa <initlock>
  initlock(&wait_lock, "wait_lock");
    8000298e:	00009597          	auipc	a1,0x9
    80002992:	85a58593          	addi	a1,a1,-1958 # 8000b1e8 <etext+0x1e8>
    80002996:	00027517          	auipc	a0,0x27
    8000299a:	03a50513          	addi	a0,a0,58 # 800299d0 <wait_lock>
    8000299e:	fffff097          	auipc	ra,0xfffff
    800029a2:	95c080e7          	jalr	-1700(ra) # 800012fa <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    800029a6:	00021797          	auipc	a5,0x21
    800029aa:	61278793          	addi	a5,a5,1554 # 80023fb8 <proc>
    800029ae:	fef43423          	sd	a5,-24(s0)
    800029b2:	a0bd                	j	80002a20 <procinit+0xb2>
      initlock(&p->lock, "proc");
    800029b4:	fe843783          	ld	a5,-24(s0)
    800029b8:	00009597          	auipc	a1,0x9
    800029bc:	84058593          	addi	a1,a1,-1984 # 8000b1f8 <etext+0x1f8>
    800029c0:	853e                	mv	a0,a5
    800029c2:	fffff097          	auipc	ra,0xfffff
    800029c6:	938080e7          	jalr	-1736(ra) # 800012fa <initlock>
      p->state = UNUSED;
    800029ca:	fe843783          	ld	a5,-24(s0)
    800029ce:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    800029d2:	fe843703          	ld	a4,-24(s0)
    800029d6:	00021797          	auipc	a5,0x21
    800029da:	5e278793          	addi	a5,a5,1506 # 80023fb8 <proc>
    800029de:	40f707b3          	sub	a5,a4,a5
    800029e2:	4037d713          	srai	a4,a5,0x3
    800029e6:	00009797          	auipc	a5,0x9
    800029ea:	8ea78793          	addi	a5,a5,-1814 # 8000b2d0 <etext+0x2d0>
    800029ee:	639c                	ld	a5,0(a5)
    800029f0:	02f707b3          	mul	a5,a4,a5
    800029f4:	2781                	sext.w	a5,a5
    800029f6:	2785                	addiw	a5,a5,1
    800029f8:	2781                	sext.w	a5,a5
    800029fa:	00d7979b          	slliw	a5,a5,0xd
    800029fe:	2781                	sext.w	a5,a5
    80002a00:	873e                	mv	a4,a5
    80002a02:	040007b7          	lui	a5,0x4000
    80002a06:	17fd                	addi	a5,a5,-1
    80002a08:	07b2                	slli	a5,a5,0xc
    80002a0a:	8f99                	sub	a5,a5,a4
    80002a0c:	873e                	mv	a4,a5
    80002a0e:	fe843783          	ld	a5,-24(s0)
    80002a12:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002a14:	fe843783          	ld	a5,-24(s0)
    80002a18:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002a1c:	fef43423          	sd	a5,-24(s0)
    80002a20:	fe843703          	ld	a4,-24(s0)
    80002a24:	00027797          	auipc	a5,0x27
    80002a28:	f9478793          	addi	a5,a5,-108 # 800299b8 <pid_lock>
    80002a2c:	f8f764e3          	bltu	a4,a5,800029b4 <procinit+0x46>
  }
}
    80002a30:	0001                	nop
    80002a32:	0001                	nop
    80002a34:	60e2                	ld	ra,24(sp)
    80002a36:	6442                	ld	s0,16(sp)
    80002a38:	6105                	addi	sp,sp,32
    80002a3a:	8082                	ret

0000000080002a3c <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002a3c:	1101                	addi	sp,sp,-32
    80002a3e:	ec06                	sd	ra,24(sp)
    80002a40:	e822                	sd	s0,16(sp)
    80002a42:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002a44:	00000097          	auipc	ra,0x0
    80002a48:	e56080e7          	jalr	-426(ra) # 8000289a <r_tp>
    80002a4c:	87aa                	mv	a5,a0
    80002a4e:	fef42623          	sw	a5,-20(s0)
  return id;
    80002a52:	fec42783          	lw	a5,-20(s0)
}
    80002a56:	853e                	mv	a0,a5
    80002a58:	60e2                	ld	ra,24(sp)
    80002a5a:	6442                	ld	s0,16(sp)
    80002a5c:	6105                	addi	sp,sp,32
    80002a5e:	8082                	ret

0000000080002a60 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002a60:	1101                	addi	sp,sp,-32
    80002a62:	ec06                	sd	ra,24(sp)
    80002a64:	e822                	sd	s0,16(sp)
    80002a66:	1000                	addi	s0,sp,32
  int id = cpuid();
    80002a68:	00000097          	auipc	ra,0x0
    80002a6c:	fd4080e7          	jalr	-44(ra) # 80002a3c <cpuid>
    80002a70:	87aa                	mv	a5,a0
    80002a72:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002a76:	fec42783          	lw	a5,-20(s0)
    80002a7a:	00779713          	slli	a4,a5,0x7
    80002a7e:	00021797          	auipc	a5,0x21
    80002a82:	13a78793          	addi	a5,a5,314 # 80023bb8 <cpus>
    80002a86:	97ba                	add	a5,a5,a4
    80002a88:	fef43023          	sd	a5,-32(s0)
  return c;
    80002a8c:	fe043783          	ld	a5,-32(s0)
}
    80002a90:	853e                	mv	a0,a5
    80002a92:	60e2                	ld	ra,24(sp)
    80002a94:	6442                	ld	s0,16(sp)
    80002a96:	6105                	addi	sp,sp,32
    80002a98:	8082                	ret

0000000080002a9a <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002a9a:	1101                	addi	sp,sp,-32
    80002a9c:	ec06                	sd	ra,24(sp)
    80002a9e:	e822                	sd	s0,16(sp)
    80002aa0:	1000                	addi	s0,sp,32
  push_off();
    80002aa2:	fffff097          	auipc	ra,0xfffff
    80002aa6:	986080e7          	jalr	-1658(ra) # 80001428 <push_off>
  struct cpu *c = mycpu();
    80002aaa:	00000097          	auipc	ra,0x0
    80002aae:	fb6080e7          	jalr	-74(ra) # 80002a60 <mycpu>
    80002ab2:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002ab6:	fe843783          	ld	a5,-24(s0)
    80002aba:	639c                	ld	a5,0(a5)
    80002abc:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	9c0080e7          	jalr	-1600(ra) # 80001480 <pop_off>
  return p;
    80002ac8:	fe043783          	ld	a5,-32(s0)
}
    80002acc:	853e                	mv	a0,a5
    80002ace:	60e2                	ld	ra,24(sp)
    80002ad0:	6442                	ld	s0,16(sp)
    80002ad2:	6105                	addi	sp,sp,32
    80002ad4:	8082                	ret

0000000080002ad6 <allocpid>:

int
allocpid()
{
    80002ad6:	1101                	addi	sp,sp,-32
    80002ad8:	ec06                	sd	ra,24(sp)
    80002ada:	e822                	sd	s0,16(sp)
    80002adc:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002ade:	00027517          	auipc	a0,0x27
    80002ae2:	eda50513          	addi	a0,a0,-294 # 800299b8 <pid_lock>
    80002ae6:	fffff097          	auipc	ra,0xfffff
    80002aea:	844080e7          	jalr	-1980(ra) # 8000132a <acquire>
  pid = nextpid;
    80002aee:	00009797          	auipc	a5,0x9
    80002af2:	cd278793          	addi	a5,a5,-814 # 8000b7c0 <nextpid>
    80002af6:	439c                	lw	a5,0(a5)
    80002af8:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002afc:	00009797          	auipc	a5,0x9
    80002b00:	cc478793          	addi	a5,a5,-828 # 8000b7c0 <nextpid>
    80002b04:	439c                	lw	a5,0(a5)
    80002b06:	2785                	addiw	a5,a5,1
    80002b08:	0007871b          	sext.w	a4,a5
    80002b0c:	00009797          	auipc	a5,0x9
    80002b10:	cb478793          	addi	a5,a5,-844 # 8000b7c0 <nextpid>
    80002b14:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002b16:	00027517          	auipc	a0,0x27
    80002b1a:	ea250513          	addi	a0,a0,-350 # 800299b8 <pid_lock>
    80002b1e:	fffff097          	auipc	ra,0xfffff
    80002b22:	870080e7          	jalr	-1936(ra) # 8000138e <release>

  return pid;
    80002b26:	fec42783          	lw	a5,-20(s0)
}
    80002b2a:	853e                	mv	a0,a5
    80002b2c:	60e2                	ld	ra,24(sp)
    80002b2e:	6442                	ld	s0,16(sp)
    80002b30:	6105                	addi	sp,sp,32
    80002b32:	8082                	ret

0000000080002b34 <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002b34:	1101                	addi	sp,sp,-32
    80002b36:	ec06                	sd	ra,24(sp)
    80002b38:	e822                	sd	s0,16(sp)
    80002b3a:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002b3c:	00021797          	auipc	a5,0x21
    80002b40:	47c78793          	addi	a5,a5,1148 # 80023fb8 <proc>
    80002b44:	fef43423          	sd	a5,-24(s0)
    80002b48:	a80d                	j	80002b7a <allocproc+0x46>
    acquire(&p->lock);
    80002b4a:	fe843783          	ld	a5,-24(s0)
    80002b4e:	853e                	mv	a0,a5
    80002b50:	ffffe097          	auipc	ra,0xffffe
    80002b54:	7da080e7          	jalr	2010(ra) # 8000132a <acquire>
    if(p->state == UNUSED) {
    80002b58:	fe843783          	ld	a5,-24(s0)
    80002b5c:	4f9c                	lw	a5,24(a5)
    80002b5e:	cb85                	beqz	a5,80002b8e <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002b60:	fe843783          	ld	a5,-24(s0)
    80002b64:	853e                	mv	a0,a5
    80002b66:	fffff097          	auipc	ra,0xfffff
    80002b6a:	828080e7          	jalr	-2008(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002b6e:	fe843783          	ld	a5,-24(s0)
    80002b72:	16878793          	addi	a5,a5,360
    80002b76:	fef43423          	sd	a5,-24(s0)
    80002b7a:	fe843703          	ld	a4,-24(s0)
    80002b7e:	00027797          	auipc	a5,0x27
    80002b82:	e3a78793          	addi	a5,a5,-454 # 800299b8 <pid_lock>
    80002b86:	fcf762e3          	bltu	a4,a5,80002b4a <allocproc+0x16>
    }
  }
  return 0;
    80002b8a:	4781                	li	a5,0
    80002b8c:	a0e1                	j	80002c54 <allocproc+0x120>
      goto found;
    80002b8e:	0001                	nop

found:
  p->pid = allocpid();
    80002b90:	00000097          	auipc	ra,0x0
    80002b94:	f46080e7          	jalr	-186(ra) # 80002ad6 <allocpid>
    80002b98:	87aa                	mv	a5,a0
    80002b9a:	873e                	mv	a4,a5
    80002b9c:	fe843783          	ld	a5,-24(s0)
    80002ba0:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002ba2:	fe843783          	ld	a5,-24(s0)
    80002ba6:	4705                	li	a4,1
    80002ba8:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002baa:	ffffe097          	auipc	ra,0xffffe
    80002bae:	62c080e7          	jalr	1580(ra) # 800011d6 <kalloc>
    80002bb2:	872a                	mv	a4,a0
    80002bb4:	fe843783          	ld	a5,-24(s0)
    80002bb8:	efb8                	sd	a4,88(a5)
    80002bba:	fe843783          	ld	a5,-24(s0)
    80002bbe:	6fbc                	ld	a5,88(a5)
    80002bc0:	e385                	bnez	a5,80002be0 <allocproc+0xac>
    freeproc(p);
    80002bc2:	fe843503          	ld	a0,-24(s0)
    80002bc6:	00000097          	auipc	ra,0x0
    80002bca:	098080e7          	jalr	152(ra) # 80002c5e <freeproc>
    release(&p->lock);
    80002bce:	fe843783          	ld	a5,-24(s0)
    80002bd2:	853e                	mv	a0,a5
    80002bd4:	ffffe097          	auipc	ra,0xffffe
    80002bd8:	7ba080e7          	jalr	1978(ra) # 8000138e <release>
    return 0;
    80002bdc:	4781                	li	a5,0
    80002bde:	a89d                	j	80002c54 <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002be0:	fe843503          	ld	a0,-24(s0)
    80002be4:	00000097          	auipc	ra,0x0
    80002be8:	118080e7          	jalr	280(ra) # 80002cfc <proc_pagetable>
    80002bec:	872a                	mv	a4,a0
    80002bee:	fe843783          	ld	a5,-24(s0)
    80002bf2:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002bf4:	fe843783          	ld	a5,-24(s0)
    80002bf8:	6bbc                	ld	a5,80(a5)
    80002bfa:	e385                	bnez	a5,80002c1a <allocproc+0xe6>
    freeproc(p);
    80002bfc:	fe843503          	ld	a0,-24(s0)
    80002c00:	00000097          	auipc	ra,0x0
    80002c04:	05e080e7          	jalr	94(ra) # 80002c5e <freeproc>
    release(&p->lock);
    80002c08:	fe843783          	ld	a5,-24(s0)
    80002c0c:	853e                	mv	a0,a5
    80002c0e:	ffffe097          	auipc	ra,0xffffe
    80002c12:	780080e7          	jalr	1920(ra) # 8000138e <release>
    return 0;
    80002c16:	4781                	li	a5,0
    80002c18:	a835                	j	80002c54 <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002c1a:	fe843783          	ld	a5,-24(s0)
    80002c1e:	06078793          	addi	a5,a5,96
    80002c22:	07000613          	li	a2,112
    80002c26:	4581                	li	a1,0
    80002c28:	853e                	mv	a0,a5
    80002c2a:	fffff097          	auipc	ra,0xfffff
    80002c2e:	8d4080e7          	jalr	-1836(ra) # 800014fe <memset>
  p->context.ra = (uint64)forkret;
    80002c32:	00001717          	auipc	a4,0x1
    80002c36:	9da70713          	addi	a4,a4,-1574 # 8000360c <forkret>
    80002c3a:	fe843783          	ld	a5,-24(s0)
    80002c3e:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002c40:	fe843783          	ld	a5,-24(s0)
    80002c44:	63b8                	ld	a4,64(a5)
    80002c46:	6785                	lui	a5,0x1
    80002c48:	973e                	add	a4,a4,a5
    80002c4a:	fe843783          	ld	a5,-24(s0)
    80002c4e:	f7b8                	sd	a4,104(a5)

  return p;
    80002c50:	fe843783          	ld	a5,-24(s0)
}
    80002c54:	853e                	mv	a0,a5
    80002c56:	60e2                	ld	ra,24(sp)
    80002c58:	6442                	ld	s0,16(sp)
    80002c5a:	6105                	addi	sp,sp,32
    80002c5c:	8082                	ret

0000000080002c5e <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002c5e:	1101                	addi	sp,sp,-32
    80002c60:	ec06                	sd	ra,24(sp)
    80002c62:	e822                	sd	s0,16(sp)
    80002c64:	1000                	addi	s0,sp,32
    80002c66:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002c6a:	fe843783          	ld	a5,-24(s0)
    80002c6e:	6fbc                	ld	a5,88(a5)
    80002c70:	cb89                	beqz	a5,80002c82 <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002c72:	fe843783          	ld	a5,-24(s0)
    80002c76:	6fbc                	ld	a5,88(a5)
    80002c78:	853e                	mv	a0,a5
    80002c7a:	ffffe097          	auipc	ra,0xffffe
    80002c7e:	4b6080e7          	jalr	1206(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80002c82:	fe843783          	ld	a5,-24(s0)
    80002c86:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002c8a:	fe843783          	ld	a5,-24(s0)
    80002c8e:	6bbc                	ld	a5,80(a5)
    80002c90:	cf89                	beqz	a5,80002caa <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002c92:	fe843783          	ld	a5,-24(s0)
    80002c96:	6bb8                	ld	a4,80(a5)
    80002c98:	fe843783          	ld	a5,-24(s0)
    80002c9c:	67bc                	ld	a5,72(a5)
    80002c9e:	85be                	mv	a1,a5
    80002ca0:	853a                	mv	a0,a4
    80002ca2:	00000097          	auipc	ra,0x0
    80002ca6:	11a080e7          	jalr	282(ra) # 80002dbc <proc_freepagetable>
  p->pagetable = 0;
    80002caa:	fe843783          	ld	a5,-24(s0)
    80002cae:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002cb2:	fe843783          	ld	a5,-24(s0)
    80002cb6:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002cba:	fe843783          	ld	a5,-24(s0)
    80002cbe:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002cc2:	fe843783          	ld	a5,-24(s0)
    80002cc6:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002cca:	fe843783          	ld	a5,-24(s0)
    80002cce:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002cd2:	fe843783          	ld	a5,-24(s0)
    80002cd6:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002cda:	fe843783          	ld	a5,-24(s0)
    80002cde:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002ce2:	fe843783          	ld	a5,-24(s0)
    80002ce6:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002cea:	fe843783          	ld	a5,-24(s0)
    80002cee:	0007ac23          	sw	zero,24(a5)
}
    80002cf2:	0001                	nop
    80002cf4:	60e2                	ld	ra,24(sp)
    80002cf6:	6442                	ld	s0,16(sp)
    80002cf8:	6105                	addi	sp,sp,32
    80002cfa:	8082                	ret

0000000080002cfc <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002cfc:	7179                	addi	sp,sp,-48
    80002cfe:	f406                	sd	ra,40(sp)
    80002d00:	f022                	sd	s0,32(sp)
    80002d02:	1800                	addi	s0,sp,48
    80002d04:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002d08:	fffff097          	auipc	ra,0xfffff
    80002d0c:	3a0080e7          	jalr	928(ra) # 800020a8 <uvmcreate>
    80002d10:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002d14:	fe843783          	ld	a5,-24(s0)
    80002d18:	e399                	bnez	a5,80002d1e <proc_pagetable+0x22>
    return 0;
    80002d1a:	4781                	li	a5,0
    80002d1c:	a859                	j	80002db2 <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002d1e:	00007797          	auipc	a5,0x7
    80002d22:	2e278793          	addi	a5,a5,738 # 8000a000 <_trampoline>
    80002d26:	4729                	li	a4,10
    80002d28:	86be                	mv	a3,a5
    80002d2a:	6605                	lui	a2,0x1
    80002d2c:	040007b7          	lui	a5,0x4000
    80002d30:	17fd                	addi	a5,a5,-1
    80002d32:	00c79593          	slli	a1,a5,0xc
    80002d36:	fe843503          	ld	a0,-24(s0)
    80002d3a:	fffff097          	auipc	ra,0xfffff
    80002d3e:	178080e7          	jalr	376(ra) # 80001eb2 <mappages>
    80002d42:	87aa                	mv	a5,a0
    80002d44:	0007db63          	bgez	a5,80002d5a <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002d48:	4581                	li	a1,0
    80002d4a:	fe843503          	ld	a0,-24(s0)
    80002d4e:	fffff097          	auipc	ra,0xfffff
    80002d52:	656080e7          	jalr	1622(ra) # 800023a4 <uvmfree>
    return 0;
    80002d56:	4781                	li	a5,0
    80002d58:	a8a9                	j	80002db2 <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002d5a:	fd843783          	ld	a5,-40(s0)
    80002d5e:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002d60:	4719                	li	a4,6
    80002d62:	86be                	mv	a3,a5
    80002d64:	6605                	lui	a2,0x1
    80002d66:	020007b7          	lui	a5,0x2000
    80002d6a:	17fd                	addi	a5,a5,-1
    80002d6c:	00d79593          	slli	a1,a5,0xd
    80002d70:	fe843503          	ld	a0,-24(s0)
    80002d74:	fffff097          	auipc	ra,0xfffff
    80002d78:	13e080e7          	jalr	318(ra) # 80001eb2 <mappages>
    80002d7c:	87aa                	mv	a5,a0
    80002d7e:	0207d863          	bgez	a5,80002dae <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002d82:	4681                	li	a3,0
    80002d84:	4605                	li	a2,1
    80002d86:	040007b7          	lui	a5,0x4000
    80002d8a:	17fd                	addi	a5,a5,-1
    80002d8c:	00c79593          	slli	a1,a5,0xc
    80002d90:	fe843503          	ld	a0,-24(s0)
    80002d94:	fffff097          	auipc	ra,0xfffff
    80002d98:	208080e7          	jalr	520(ra) # 80001f9c <uvmunmap>
    uvmfree(pagetable, 0);
    80002d9c:	4581                	li	a1,0
    80002d9e:	fe843503          	ld	a0,-24(s0)
    80002da2:	fffff097          	auipc	ra,0xfffff
    80002da6:	602080e7          	jalr	1538(ra) # 800023a4 <uvmfree>
    return 0;
    80002daa:	4781                	li	a5,0
    80002dac:	a019                	j	80002db2 <proc_pagetable+0xb6>
  }

  return pagetable;
    80002dae:	fe843783          	ld	a5,-24(s0)
}
    80002db2:	853e                	mv	a0,a5
    80002db4:	70a2                	ld	ra,40(sp)
    80002db6:	7402                	ld	s0,32(sp)
    80002db8:	6145                	addi	sp,sp,48
    80002dba:	8082                	ret

0000000080002dbc <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002dbc:	1101                	addi	sp,sp,-32
    80002dbe:	ec06                	sd	ra,24(sp)
    80002dc0:	e822                	sd	s0,16(sp)
    80002dc2:	1000                	addi	s0,sp,32
    80002dc4:	fea43423          	sd	a0,-24(s0)
    80002dc8:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002dcc:	4681                	li	a3,0
    80002dce:	4605                	li	a2,1
    80002dd0:	040007b7          	lui	a5,0x4000
    80002dd4:	17fd                	addi	a5,a5,-1
    80002dd6:	00c79593          	slli	a1,a5,0xc
    80002dda:	fe843503          	ld	a0,-24(s0)
    80002dde:	fffff097          	auipc	ra,0xfffff
    80002de2:	1be080e7          	jalr	446(ra) # 80001f9c <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002de6:	4681                	li	a3,0
    80002de8:	4605                	li	a2,1
    80002dea:	020007b7          	lui	a5,0x2000
    80002dee:	17fd                	addi	a5,a5,-1
    80002df0:	00d79593          	slli	a1,a5,0xd
    80002df4:	fe843503          	ld	a0,-24(s0)
    80002df8:	fffff097          	auipc	ra,0xfffff
    80002dfc:	1a4080e7          	jalr	420(ra) # 80001f9c <uvmunmap>
  uvmfree(pagetable, sz);
    80002e00:	fe043583          	ld	a1,-32(s0)
    80002e04:	fe843503          	ld	a0,-24(s0)
    80002e08:	fffff097          	auipc	ra,0xfffff
    80002e0c:	59c080e7          	jalr	1436(ra) # 800023a4 <uvmfree>
}
    80002e10:	0001                	nop
    80002e12:	60e2                	ld	ra,24(sp)
    80002e14:	6442                	ld	s0,16(sp)
    80002e16:	6105                	addi	sp,sp,32
    80002e18:	8082                	ret

0000000080002e1a <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002e1a:	1101                	addi	sp,sp,-32
    80002e1c:	ec06                	sd	ra,24(sp)
    80002e1e:	e822                	sd	s0,16(sp)
    80002e20:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002e22:	00000097          	auipc	ra,0x0
    80002e26:	d12080e7          	jalr	-750(ra) # 80002b34 <allocproc>
    80002e2a:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002e2e:	00009797          	auipc	a5,0x9
    80002e32:	b1278793          	addi	a5,a5,-1262 # 8000b940 <initproc>
    80002e36:	fe843703          	ld	a4,-24(s0)
    80002e3a:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002e3c:	fe843783          	ld	a5,-24(s0)
    80002e40:	6bbc                	ld	a5,80(a5)
    80002e42:	03400613          	li	a2,52
    80002e46:	00009597          	auipc	a1,0x9
    80002e4a:	9a258593          	addi	a1,a1,-1630 # 8000b7e8 <initcode>
    80002e4e:	853e                	mv	a0,a5
    80002e50:	fffff097          	auipc	ra,0xfffff
    80002e54:	294080e7          	jalr	660(ra) # 800020e4 <uvmfirst>
  p->sz = PGSIZE;
    80002e58:	fe843783          	ld	a5,-24(s0)
    80002e5c:	6705                	lui	a4,0x1
    80002e5e:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002e60:	fe843783          	ld	a5,-24(s0)
    80002e64:	6fbc                	ld	a5,88(a5)
    80002e66:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002e6a:	fe843783          	ld	a5,-24(s0)
    80002e6e:	6fbc                	ld	a5,88(a5)
    80002e70:	6705                	lui	a4,0x1
    80002e72:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002e74:	fe843783          	ld	a5,-24(s0)
    80002e78:	15878793          	addi	a5,a5,344
    80002e7c:	4641                	li	a2,16
    80002e7e:	00008597          	auipc	a1,0x8
    80002e82:	38258593          	addi	a1,a1,898 # 8000b200 <etext+0x200>
    80002e86:	853e                	mv	a0,a5
    80002e88:	fffff097          	auipc	ra,0xfffff
    80002e8c:	97a080e7          	jalr	-1670(ra) # 80001802 <safestrcpy>
  p->cwd = namei("/");
    80002e90:	00008517          	auipc	a0,0x8
    80002e94:	38050513          	addi	a0,a0,896 # 8000b210 <etext+0x210>
    80002e98:	00003097          	auipc	ra,0x3
    80002e9c:	18e080e7          	jalr	398(ra) # 80006026 <namei>
    80002ea0:	872a                	mv	a4,a0
    80002ea2:	fe843783          	ld	a5,-24(s0)
    80002ea6:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002eaa:	fe843783          	ld	a5,-24(s0)
    80002eae:	470d                	li	a4,3
    80002eb0:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002eb2:	fe843783          	ld	a5,-24(s0)
    80002eb6:	853e                	mv	a0,a5
    80002eb8:	ffffe097          	auipc	ra,0xffffe
    80002ebc:	4d6080e7          	jalr	1238(ra) # 8000138e <release>
}
    80002ec0:	0001                	nop
    80002ec2:	60e2                	ld	ra,24(sp)
    80002ec4:	6442                	ld	s0,16(sp)
    80002ec6:	6105                	addi	sp,sp,32
    80002ec8:	8082                	ret

0000000080002eca <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002eca:	7179                	addi	sp,sp,-48
    80002ecc:	f406                	sd	ra,40(sp)
    80002ece:	f022                	sd	s0,32(sp)
    80002ed0:	1800                	addi	s0,sp,48
    80002ed2:	87aa                	mv	a5,a0
    80002ed4:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002ed8:	00000097          	auipc	ra,0x0
    80002edc:	bc2080e7          	jalr	-1086(ra) # 80002a9a <myproc>
    80002ee0:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002ee4:	fe043783          	ld	a5,-32(s0)
    80002ee8:	67bc                	ld	a5,72(a5)
    80002eea:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002eee:	fdc42783          	lw	a5,-36(s0)
    80002ef2:	2781                	sext.w	a5,a5
    80002ef4:	02f05963          	blez	a5,80002f26 <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002ef8:	fe043783          	ld	a5,-32(s0)
    80002efc:	6ba8                	ld	a0,80(a5)
    80002efe:	fdc42703          	lw	a4,-36(s0)
    80002f02:	fe843783          	ld	a5,-24(s0)
    80002f06:	97ba                	add	a5,a5,a4
    80002f08:	4691                	li	a3,4
    80002f0a:	863e                	mv	a2,a5
    80002f0c:	fe843583          	ld	a1,-24(s0)
    80002f10:	fffff097          	auipc	ra,0xfffff
    80002f14:	25c080e7          	jalr	604(ra) # 8000216c <uvmalloc>
    80002f18:	fea43423          	sd	a0,-24(s0)
    80002f1c:	fe843783          	ld	a5,-24(s0)
    80002f20:	eb95                	bnez	a5,80002f54 <growproc+0x8a>
      return -1;
    80002f22:	57fd                	li	a5,-1
    80002f24:	a835                	j	80002f60 <growproc+0x96>
    }
  } else if(n < 0){
    80002f26:	fdc42783          	lw	a5,-36(s0)
    80002f2a:	2781                	sext.w	a5,a5
    80002f2c:	0207d463          	bgez	a5,80002f54 <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002f30:	fe043783          	ld	a5,-32(s0)
    80002f34:	6bb4                	ld	a3,80(a5)
    80002f36:	fdc42703          	lw	a4,-36(s0)
    80002f3a:	fe843783          	ld	a5,-24(s0)
    80002f3e:	97ba                	add	a5,a5,a4
    80002f40:	863e                	mv	a2,a5
    80002f42:	fe843583          	ld	a1,-24(s0)
    80002f46:	8536                	mv	a0,a3
    80002f48:	fffff097          	auipc	ra,0xfffff
    80002f4c:	316080e7          	jalr	790(ra) # 8000225e <uvmdealloc>
    80002f50:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    80002f54:	fe043783          	ld	a5,-32(s0)
    80002f58:	fe843703          	ld	a4,-24(s0)
    80002f5c:	e7b8                	sd	a4,72(a5)
  return 0;
    80002f5e:	4781                	li	a5,0
}
    80002f60:	853e                	mv	a0,a5
    80002f62:	70a2                	ld	ra,40(sp)
    80002f64:	7402                	ld	s0,32(sp)
    80002f66:	6145                	addi	sp,sp,48
    80002f68:	8082                	ret

0000000080002f6a <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80002f6a:	7179                	addi	sp,sp,-48
    80002f6c:	f406                	sd	ra,40(sp)
    80002f6e:	f022                	sd	s0,32(sp)
    80002f70:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    80002f72:	00000097          	auipc	ra,0x0
    80002f76:	b28080e7          	jalr	-1240(ra) # 80002a9a <myproc>
    80002f7a:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80002f7e:	00000097          	auipc	ra,0x0
    80002f82:	bb6080e7          	jalr	-1098(ra) # 80002b34 <allocproc>
    80002f86:	fca43c23          	sd	a0,-40(s0)
    80002f8a:	fd843783          	ld	a5,-40(s0)
    80002f8e:	e399                	bnez	a5,80002f94 <fork+0x2a>
    return -1;
    80002f90:	57fd                	li	a5,-1
    80002f92:	aab5                	j	8000310e <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    80002f94:	fe043783          	ld	a5,-32(s0)
    80002f98:	6bb8                	ld	a4,80(a5)
    80002f9a:	fd843783          	ld	a5,-40(s0)
    80002f9e:	6bb4                	ld	a3,80(a5)
    80002fa0:	fe043783          	ld	a5,-32(s0)
    80002fa4:	67bc                	ld	a5,72(a5)
    80002fa6:	863e                	mv	a2,a5
    80002fa8:	85b6                	mv	a1,a3
    80002faa:	853a                	mv	a0,a4
    80002fac:	fffff097          	auipc	ra,0xfffff
    80002fb0:	442080e7          	jalr	1090(ra) # 800023ee <uvmcopy>
    80002fb4:	87aa                	mv	a5,a0
    80002fb6:	0207d163          	bgez	a5,80002fd8 <fork+0x6e>
    freeproc(np);
    80002fba:	fd843503          	ld	a0,-40(s0)
    80002fbe:	00000097          	auipc	ra,0x0
    80002fc2:	ca0080e7          	jalr	-864(ra) # 80002c5e <freeproc>
    release(&np->lock);
    80002fc6:	fd843783          	ld	a5,-40(s0)
    80002fca:	853e                	mv	a0,a5
    80002fcc:	ffffe097          	auipc	ra,0xffffe
    80002fd0:	3c2080e7          	jalr	962(ra) # 8000138e <release>
    return -1;
    80002fd4:	57fd                	li	a5,-1
    80002fd6:	aa25                	j	8000310e <fork+0x1a4>
  }
  np->sz = p->sz;
    80002fd8:	fe043783          	ld	a5,-32(s0)
    80002fdc:	67b8                	ld	a4,72(a5)
    80002fde:	fd843783          	ld	a5,-40(s0)
    80002fe2:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    80002fe4:	fe043783          	ld	a5,-32(s0)
    80002fe8:	6fb8                	ld	a4,88(a5)
    80002fea:	fd843783          	ld	a5,-40(s0)
    80002fee:	6fbc                	ld	a5,88(a5)
    80002ff0:	86be                	mv	a3,a5
    80002ff2:	12000793          	li	a5,288
    80002ff6:	863e                	mv	a2,a5
    80002ff8:	85ba                	mv	a1,a4
    80002ffa:	8536                	mv	a0,a3
    80002ffc:	ffffe097          	auipc	ra,0xffffe
    80003000:	6c2080e7          	jalr	1730(ra) # 800016be <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    80003004:	fd843783          	ld	a5,-40(s0)
    80003008:	6fbc                	ld	a5,88(a5)
    8000300a:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    8000300e:	fe042623          	sw	zero,-20(s0)
    80003012:	a0a9                	j	8000305c <fork+0xf2>
    if(p->ofile[i])
    80003014:	fe043703          	ld	a4,-32(s0)
    80003018:	fec42783          	lw	a5,-20(s0)
    8000301c:	07e9                	addi	a5,a5,26
    8000301e:	078e                	slli	a5,a5,0x3
    80003020:	97ba                	add	a5,a5,a4
    80003022:	639c                	ld	a5,0(a5)
    80003024:	c79d                	beqz	a5,80003052 <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    80003026:	fe043703          	ld	a4,-32(s0)
    8000302a:	fec42783          	lw	a5,-20(s0)
    8000302e:	07e9                	addi	a5,a5,26
    80003030:	078e                	slli	a5,a5,0x3
    80003032:	97ba                	add	a5,a5,a4
    80003034:	639c                	ld	a5,0(a5)
    80003036:	853e                	mv	a0,a5
    80003038:	00004097          	auipc	ra,0x4
    8000303c:	986080e7          	jalr	-1658(ra) # 800069be <filedup>
    80003040:	86aa                	mv	a3,a0
    80003042:	fd843703          	ld	a4,-40(s0)
    80003046:	fec42783          	lw	a5,-20(s0)
    8000304a:	07e9                	addi	a5,a5,26
    8000304c:	078e                	slli	a5,a5,0x3
    8000304e:	97ba                	add	a5,a5,a4
    80003050:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    80003052:	fec42783          	lw	a5,-20(s0)
    80003056:	2785                	addiw	a5,a5,1
    80003058:	fef42623          	sw	a5,-20(s0)
    8000305c:	fec42783          	lw	a5,-20(s0)
    80003060:	0007871b          	sext.w	a4,a5
    80003064:	47bd                	li	a5,15
    80003066:	fae7d7e3          	bge	a5,a4,80003014 <fork+0xaa>
  np->cwd = idup(p->cwd);
    8000306a:	fe043783          	ld	a5,-32(s0)
    8000306e:	1507b783          	ld	a5,336(a5)
    80003072:	853e                	mv	a0,a5
    80003074:	00002097          	auipc	ra,0x2
    80003078:	240080e7          	jalr	576(ra) # 800052b4 <idup>
    8000307c:	872a                	mv	a4,a0
    8000307e:	fd843783          	ld	a5,-40(s0)
    80003082:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    80003086:	fd843783          	ld	a5,-40(s0)
    8000308a:	15878713          	addi	a4,a5,344
    8000308e:	fe043783          	ld	a5,-32(s0)
    80003092:	15878793          	addi	a5,a5,344
    80003096:	4641                	li	a2,16
    80003098:	85be                	mv	a1,a5
    8000309a:	853a                	mv	a0,a4
    8000309c:	ffffe097          	auipc	ra,0xffffe
    800030a0:	766080e7          	jalr	1894(ra) # 80001802 <safestrcpy>

  pid = np->pid;
    800030a4:	fd843783          	ld	a5,-40(s0)
    800030a8:	5b9c                	lw	a5,48(a5)
    800030aa:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    800030ae:	fd843783          	ld	a5,-40(s0)
    800030b2:	853e                	mv	a0,a5
    800030b4:	ffffe097          	auipc	ra,0xffffe
    800030b8:	2da080e7          	jalr	730(ra) # 8000138e <release>

  acquire(&wait_lock);
    800030bc:	00027517          	auipc	a0,0x27
    800030c0:	91450513          	addi	a0,a0,-1772 # 800299d0 <wait_lock>
    800030c4:	ffffe097          	auipc	ra,0xffffe
    800030c8:	266080e7          	jalr	614(ra) # 8000132a <acquire>
  np->parent = p;
    800030cc:	fd843783          	ld	a5,-40(s0)
    800030d0:	fe043703          	ld	a4,-32(s0)
    800030d4:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    800030d6:	00027517          	auipc	a0,0x27
    800030da:	8fa50513          	addi	a0,a0,-1798 # 800299d0 <wait_lock>
    800030de:	ffffe097          	auipc	ra,0xffffe
    800030e2:	2b0080e7          	jalr	688(ra) # 8000138e <release>

  acquire(&np->lock);
    800030e6:	fd843783          	ld	a5,-40(s0)
    800030ea:	853e                	mv	a0,a5
    800030ec:	ffffe097          	auipc	ra,0xffffe
    800030f0:	23e080e7          	jalr	574(ra) # 8000132a <acquire>
  np->state = RUNNABLE;
    800030f4:	fd843783          	ld	a5,-40(s0)
    800030f8:	470d                	li	a4,3
    800030fa:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    800030fc:	fd843783          	ld	a5,-40(s0)
    80003100:	853e                	mv	a0,a5
    80003102:	ffffe097          	auipc	ra,0xffffe
    80003106:	28c080e7          	jalr	652(ra) # 8000138e <release>

  return pid;
    8000310a:	fd442783          	lw	a5,-44(s0)
}
    8000310e:	853e                	mv	a0,a5
    80003110:	70a2                	ld	ra,40(sp)
    80003112:	7402                	ld	s0,32(sp)
    80003114:	6145                	addi	sp,sp,48
    80003116:	8082                	ret

0000000080003118 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    80003118:	7179                	addi	sp,sp,-48
    8000311a:	f406                	sd	ra,40(sp)
    8000311c:	f022                	sd	s0,32(sp)
    8000311e:	1800                	addi	s0,sp,48
    80003120:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003124:	00021797          	auipc	a5,0x21
    80003128:	e9478793          	addi	a5,a5,-364 # 80023fb8 <proc>
    8000312c:	fef43423          	sd	a5,-24(s0)
    80003130:	a081                	j	80003170 <reparent+0x58>
    if(pp->parent == p){
    80003132:	fe843783          	ld	a5,-24(s0)
    80003136:	7f9c                	ld	a5,56(a5)
    80003138:	fd843703          	ld	a4,-40(s0)
    8000313c:	02f71463          	bne	a4,a5,80003164 <reparent+0x4c>
      pp->parent = initproc;
    80003140:	00009797          	auipc	a5,0x9
    80003144:	80078793          	addi	a5,a5,-2048 # 8000b940 <initproc>
    80003148:	6398                	ld	a4,0(a5)
    8000314a:	fe843783          	ld	a5,-24(s0)
    8000314e:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80003150:	00008797          	auipc	a5,0x8
    80003154:	7f078793          	addi	a5,a5,2032 # 8000b940 <initproc>
    80003158:	639c                	ld	a5,0(a5)
    8000315a:	853e                	mv	a0,a5
    8000315c:	00000097          	auipc	ra,0x0
    80003160:	57c080e7          	jalr	1404(ra) # 800036d8 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    80003164:	fe843783          	ld	a5,-24(s0)
    80003168:	16878793          	addi	a5,a5,360
    8000316c:	fef43423          	sd	a5,-24(s0)
    80003170:	fe843703          	ld	a4,-24(s0)
    80003174:	00027797          	auipc	a5,0x27
    80003178:	84478793          	addi	a5,a5,-1980 # 800299b8 <pid_lock>
    8000317c:	faf76be3          	bltu	a4,a5,80003132 <reparent+0x1a>
    }
  }
}
    80003180:	0001                	nop
    80003182:	0001                	nop
    80003184:	70a2                	ld	ra,40(sp)
    80003186:	7402                	ld	s0,32(sp)
    80003188:	6145                	addi	sp,sp,48
    8000318a:	8082                	ret

000000008000318c <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    8000318c:	7139                	addi	sp,sp,-64
    8000318e:	fc06                	sd	ra,56(sp)
    80003190:	f822                	sd	s0,48(sp)
    80003192:	0080                	addi	s0,sp,64
    80003194:	87aa                	mv	a5,a0
    80003196:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    8000319a:	00000097          	auipc	ra,0x0
    8000319e:	900080e7          	jalr	-1792(ra) # 80002a9a <myproc>
    800031a2:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    800031a6:	00008797          	auipc	a5,0x8
    800031aa:	79a78793          	addi	a5,a5,1946 # 8000b940 <initproc>
    800031ae:	639c                	ld	a5,0(a5)
    800031b0:	fe043703          	ld	a4,-32(s0)
    800031b4:	00f71a63          	bne	a4,a5,800031c8 <exit+0x3c>
    panic("init exiting");
    800031b8:	00008517          	auipc	a0,0x8
    800031bc:	06050513          	addi	a0,a0,96 # 8000b218 <etext+0x218>
    800031c0:	ffffe097          	auipc	ra,0xffffe
    800031c4:	acc080e7          	jalr	-1332(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    800031c8:	fe042623          	sw	zero,-20(s0)
    800031cc:	a881                	j	8000321c <exit+0x90>
    if(p->ofile[fd]){
    800031ce:	fe043703          	ld	a4,-32(s0)
    800031d2:	fec42783          	lw	a5,-20(s0)
    800031d6:	07e9                	addi	a5,a5,26
    800031d8:	078e                	slli	a5,a5,0x3
    800031da:	97ba                	add	a5,a5,a4
    800031dc:	639c                	ld	a5,0(a5)
    800031de:	cb95                	beqz	a5,80003212 <exit+0x86>
      struct file *f = p->ofile[fd];
    800031e0:	fe043703          	ld	a4,-32(s0)
    800031e4:	fec42783          	lw	a5,-20(s0)
    800031e8:	07e9                	addi	a5,a5,26
    800031ea:	078e                	slli	a5,a5,0x3
    800031ec:	97ba                	add	a5,a5,a4
    800031ee:	639c                	ld	a5,0(a5)
    800031f0:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    800031f4:	fd843503          	ld	a0,-40(s0)
    800031f8:	00004097          	auipc	ra,0x4
    800031fc:	82c080e7          	jalr	-2004(ra) # 80006a24 <fileclose>
      p->ofile[fd] = 0;
    80003200:	fe043703          	ld	a4,-32(s0)
    80003204:	fec42783          	lw	a5,-20(s0)
    80003208:	07e9                	addi	a5,a5,26
    8000320a:	078e                	slli	a5,a5,0x3
    8000320c:	97ba                	add	a5,a5,a4
    8000320e:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    80003212:	fec42783          	lw	a5,-20(s0)
    80003216:	2785                	addiw	a5,a5,1
    80003218:	fef42623          	sw	a5,-20(s0)
    8000321c:	fec42783          	lw	a5,-20(s0)
    80003220:	0007871b          	sext.w	a4,a5
    80003224:	47bd                	li	a5,15
    80003226:	fae7d4e3          	bge	a5,a4,800031ce <exit+0x42>
    }
  }

  begin_op();
    8000322a:	00003097          	auipc	ra,0x3
    8000322e:	160080e7          	jalr	352(ra) # 8000638a <begin_op>
  iput(p->cwd);
    80003232:	fe043783          	ld	a5,-32(s0)
    80003236:	1507b783          	ld	a5,336(a5)
    8000323a:	853e                	mv	a0,a5
    8000323c:	00002097          	auipc	ra,0x2
    80003240:	252080e7          	jalr	594(ra) # 8000548e <iput>
  end_op();
    80003244:	00003097          	auipc	ra,0x3
    80003248:	208080e7          	jalr	520(ra) # 8000644c <end_op>
  p->cwd = 0;
    8000324c:	fe043783          	ld	a5,-32(s0)
    80003250:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    80003254:	00026517          	auipc	a0,0x26
    80003258:	77c50513          	addi	a0,a0,1916 # 800299d0 <wait_lock>
    8000325c:	ffffe097          	auipc	ra,0xffffe
    80003260:	0ce080e7          	jalr	206(ra) # 8000132a <acquire>

  // Give any children to init.
  reparent(p);
    80003264:	fe043503          	ld	a0,-32(s0)
    80003268:	00000097          	auipc	ra,0x0
    8000326c:	eb0080e7          	jalr	-336(ra) # 80003118 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003270:	fe043783          	ld	a5,-32(s0)
    80003274:	7f9c                	ld	a5,56(a5)
    80003276:	853e                	mv	a0,a5
    80003278:	00000097          	auipc	ra,0x0
    8000327c:	460080e7          	jalr	1120(ra) # 800036d8 <wakeup>
  
  acquire(&p->lock);
    80003280:	fe043783          	ld	a5,-32(s0)
    80003284:	853e                	mv	a0,a5
    80003286:	ffffe097          	auipc	ra,0xffffe
    8000328a:	0a4080e7          	jalr	164(ra) # 8000132a <acquire>

  p->xstate = status;
    8000328e:	fe043783          	ld	a5,-32(s0)
    80003292:	fcc42703          	lw	a4,-52(s0)
    80003296:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003298:	fe043783          	ld	a5,-32(s0)
    8000329c:	4715                	li	a4,5
    8000329e:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    800032a0:	00026517          	auipc	a0,0x26
    800032a4:	73050513          	addi	a0,a0,1840 # 800299d0 <wait_lock>
    800032a8:	ffffe097          	auipc	ra,0xffffe
    800032ac:	0e6080e7          	jalr	230(ra) # 8000138e <release>

  // Jump into the scheduler, never to return.
  sched();
    800032b0:	00000097          	auipc	ra,0x0
    800032b4:	230080e7          	jalr	560(ra) # 800034e0 <sched>
  panic("zombie exit");
    800032b8:	00008517          	auipc	a0,0x8
    800032bc:	f7050513          	addi	a0,a0,-144 # 8000b228 <etext+0x228>
    800032c0:	ffffe097          	auipc	ra,0xffffe
    800032c4:	9cc080e7          	jalr	-1588(ra) # 80000c8c <panic>

00000000800032c8 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    800032c8:	7139                	addi	sp,sp,-64
    800032ca:	fc06                	sd	ra,56(sp)
    800032cc:	f822                	sd	s0,48(sp)
    800032ce:	0080                	addi	s0,sp,64
    800032d0:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    800032d4:	fffff097          	auipc	ra,0xfffff
    800032d8:	7c6080e7          	jalr	1990(ra) # 80002a9a <myproc>
    800032dc:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    800032e0:	00026517          	auipc	a0,0x26
    800032e4:	6f050513          	addi	a0,a0,1776 # 800299d0 <wait_lock>
    800032e8:	ffffe097          	auipc	ra,0xffffe
    800032ec:	042080e7          	jalr	66(ra) # 8000132a <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800032f0:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800032f4:	00021797          	auipc	a5,0x21
    800032f8:	cc478793          	addi	a5,a5,-828 # 80023fb8 <proc>
    800032fc:	fef43423          	sd	a5,-24(s0)
    80003300:	a8d1                	j	800033d4 <wait+0x10c>
      if(pp->parent == p){
    80003302:	fe843783          	ld	a5,-24(s0)
    80003306:	7f9c                	ld	a5,56(a5)
    80003308:	fd843703          	ld	a4,-40(s0)
    8000330c:	0af71e63          	bne	a4,a5,800033c8 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    80003310:	fe843783          	ld	a5,-24(s0)
    80003314:	853e                	mv	a0,a5
    80003316:	ffffe097          	auipc	ra,0xffffe
    8000331a:	014080e7          	jalr	20(ra) # 8000132a <acquire>

        havekids = 1;
    8000331e:	4785                	li	a5,1
    80003320:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    80003324:	fe843783          	ld	a5,-24(s0)
    80003328:	4f9c                	lw	a5,24(a5)
    8000332a:	873e                	mv	a4,a5
    8000332c:	4795                	li	a5,5
    8000332e:	08f71663          	bne	a4,a5,800033ba <wait+0xf2>
          // Found one.
          pid = pp->pid;
    80003332:	fe843783          	ld	a5,-24(s0)
    80003336:	5b9c                	lw	a5,48(a5)
    80003338:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    8000333c:	fc843783          	ld	a5,-56(s0)
    80003340:	c7a9                	beqz	a5,8000338a <wait+0xc2>
    80003342:	fd843783          	ld	a5,-40(s0)
    80003346:	6bb8                	ld	a4,80(a5)
    80003348:	fe843783          	ld	a5,-24(s0)
    8000334c:	02c78793          	addi	a5,a5,44
    80003350:	4691                	li	a3,4
    80003352:	863e                	mv	a2,a5
    80003354:	fc843583          	ld	a1,-56(s0)
    80003358:	853a                	mv	a0,a4
    8000335a:	fffff097          	auipc	ra,0xfffff
    8000335e:	20a080e7          	jalr	522(ra) # 80002564 <copyout>
    80003362:	87aa                	mv	a5,a0
    80003364:	0207d363          	bgez	a5,8000338a <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    80003368:	fe843783          	ld	a5,-24(s0)
    8000336c:	853e                	mv	a0,a5
    8000336e:	ffffe097          	auipc	ra,0xffffe
    80003372:	020080e7          	jalr	32(ra) # 8000138e <release>
            release(&wait_lock);
    80003376:	00026517          	auipc	a0,0x26
    8000337a:	65a50513          	addi	a0,a0,1626 # 800299d0 <wait_lock>
    8000337e:	ffffe097          	auipc	ra,0xffffe
    80003382:	010080e7          	jalr	16(ra) # 8000138e <release>
            return -1;
    80003386:	57fd                	li	a5,-1
    80003388:	a879                	j	80003426 <wait+0x15e>
          }
          freeproc(pp);
    8000338a:	fe843503          	ld	a0,-24(s0)
    8000338e:	00000097          	auipc	ra,0x0
    80003392:	8d0080e7          	jalr	-1840(ra) # 80002c5e <freeproc>
          release(&pp->lock);
    80003396:	fe843783          	ld	a5,-24(s0)
    8000339a:	853e                	mv	a0,a5
    8000339c:	ffffe097          	auipc	ra,0xffffe
    800033a0:	ff2080e7          	jalr	-14(ra) # 8000138e <release>
          release(&wait_lock);
    800033a4:	00026517          	auipc	a0,0x26
    800033a8:	62c50513          	addi	a0,a0,1580 # 800299d0 <wait_lock>
    800033ac:	ffffe097          	auipc	ra,0xffffe
    800033b0:	fe2080e7          	jalr	-30(ra) # 8000138e <release>
          return pid;
    800033b4:	fd442783          	lw	a5,-44(s0)
    800033b8:	a0bd                	j	80003426 <wait+0x15e>
        }
        release(&pp->lock);
    800033ba:	fe843783          	ld	a5,-24(s0)
    800033be:	853e                	mv	a0,a5
    800033c0:	ffffe097          	auipc	ra,0xffffe
    800033c4:	fce080e7          	jalr	-50(ra) # 8000138e <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800033c8:	fe843783          	ld	a5,-24(s0)
    800033cc:	16878793          	addi	a5,a5,360
    800033d0:	fef43423          	sd	a5,-24(s0)
    800033d4:	fe843703          	ld	a4,-24(s0)
    800033d8:	00026797          	auipc	a5,0x26
    800033dc:	5e078793          	addi	a5,a5,1504 # 800299b8 <pid_lock>
    800033e0:	f2f761e3          	bltu	a4,a5,80003302 <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    800033e4:	fe442783          	lw	a5,-28(s0)
    800033e8:	2781                	sext.w	a5,a5
    800033ea:	cb89                	beqz	a5,800033fc <wait+0x134>
    800033ec:	fd843503          	ld	a0,-40(s0)
    800033f0:	00000097          	auipc	ra,0x0
    800033f4:	47a080e7          	jalr	1146(ra) # 8000386a <killed>
    800033f8:	87aa                	mv	a5,a0
    800033fa:	cb99                	beqz	a5,80003410 <wait+0x148>
      release(&wait_lock);
    800033fc:	00026517          	auipc	a0,0x26
    80003400:	5d450513          	addi	a0,a0,1492 # 800299d0 <wait_lock>
    80003404:	ffffe097          	auipc	ra,0xffffe
    80003408:	f8a080e7          	jalr	-118(ra) # 8000138e <release>
      return -1;
    8000340c:	57fd                	li	a5,-1
    8000340e:	a821                	j	80003426 <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    80003410:	00026597          	auipc	a1,0x26
    80003414:	5c058593          	addi	a1,a1,1472 # 800299d0 <wait_lock>
    80003418:	fd843503          	ld	a0,-40(s0)
    8000341c:	00000097          	auipc	ra,0x0
    80003420:	240080e7          	jalr	576(ra) # 8000365c <sleep>
    havekids = 0;
    80003424:	b5f1                	j	800032f0 <wait+0x28>
  }
}
    80003426:	853e                	mv	a0,a5
    80003428:	70e2                	ld	ra,56(sp)
    8000342a:	7442                	ld	s0,48(sp)
    8000342c:	6121                	addi	sp,sp,64
    8000342e:	8082                	ret

0000000080003430 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    80003430:	1101                	addi	sp,sp,-32
    80003432:	ec06                	sd	ra,24(sp)
    80003434:	e822                	sd	s0,16(sp)
    80003436:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003438:	fffff097          	auipc	ra,0xfffff
    8000343c:	628080e7          	jalr	1576(ra) # 80002a60 <mycpu>
    80003440:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    80003444:	fe043783          	ld	a5,-32(s0)
    80003448:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    8000344c:	fffff097          	auipc	ra,0xfffff
    80003450:	3f6080e7          	jalr	1014(ra) # 80002842 <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    80003454:	00021797          	auipc	a5,0x21
    80003458:	b6478793          	addi	a5,a5,-1180 # 80023fb8 <proc>
    8000345c:	fef43423          	sd	a5,-24(s0)
    80003460:	a0bd                	j	800034ce <scheduler+0x9e>
      acquire(&p->lock);
    80003462:	fe843783          	ld	a5,-24(s0)
    80003466:	853e                	mv	a0,a5
    80003468:	ffffe097          	auipc	ra,0xffffe
    8000346c:	ec2080e7          	jalr	-318(ra) # 8000132a <acquire>
      if(p->state == RUNNABLE) {
    80003470:	fe843783          	ld	a5,-24(s0)
    80003474:	4f9c                	lw	a5,24(a5)
    80003476:	873e                	mv	a4,a5
    80003478:	478d                	li	a5,3
    8000347a:	02f71d63          	bne	a4,a5,800034b4 <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    8000347e:	fe843783          	ld	a5,-24(s0)
    80003482:	4711                	li	a4,4
    80003484:	cf98                	sw	a4,24(a5)
        c->proc = p;
    80003486:	fe043783          	ld	a5,-32(s0)
    8000348a:	fe843703          	ld	a4,-24(s0)
    8000348e:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    80003490:	fe043783          	ld	a5,-32(s0)
    80003494:	00878713          	addi	a4,a5,8
    80003498:	fe843783          	ld	a5,-24(s0)
    8000349c:	06078793          	addi	a5,a5,96
    800034a0:	85be                	mv	a1,a5
    800034a2:	853a                	mv	a0,a4
    800034a4:	00000097          	auipc	ra,0x0
    800034a8:	5d0080e7          	jalr	1488(ra) # 80003a74 <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    800034ac:	fe043783          	ld	a5,-32(s0)
    800034b0:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    800034b4:	fe843783          	ld	a5,-24(s0)
    800034b8:	853e                	mv	a0,a5
    800034ba:	ffffe097          	auipc	ra,0xffffe
    800034be:	ed4080e7          	jalr	-300(ra) # 8000138e <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    800034c2:	fe843783          	ld	a5,-24(s0)
    800034c6:	16878793          	addi	a5,a5,360
    800034ca:	fef43423          	sd	a5,-24(s0)
    800034ce:	fe843703          	ld	a4,-24(s0)
    800034d2:	00026797          	auipc	a5,0x26
    800034d6:	4e678793          	addi	a5,a5,1254 # 800299b8 <pid_lock>
    800034da:	f8f764e3          	bltu	a4,a5,80003462 <scheduler+0x32>
    intr_on();
    800034de:	b7bd                	j	8000344c <scheduler+0x1c>

00000000800034e0 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800034e0:	7179                	addi	sp,sp,-48
    800034e2:	f406                	sd	ra,40(sp)
    800034e4:	f022                	sd	s0,32(sp)
    800034e6:	ec26                	sd	s1,24(sp)
    800034e8:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800034ea:	fffff097          	auipc	ra,0xfffff
    800034ee:	5b0080e7          	jalr	1456(ra) # 80002a9a <myproc>
    800034f2:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800034f6:	fd843783          	ld	a5,-40(s0)
    800034fa:	853e                	mv	a0,a5
    800034fc:	ffffe097          	auipc	ra,0xffffe
    80003500:	ee8080e7          	jalr	-280(ra) # 800013e4 <holding>
    80003504:	87aa                	mv	a5,a0
    80003506:	eb89                	bnez	a5,80003518 <sched+0x38>
    panic("sched p->lock");
    80003508:	00008517          	auipc	a0,0x8
    8000350c:	d3050513          	addi	a0,a0,-720 # 8000b238 <etext+0x238>
    80003510:	ffffd097          	auipc	ra,0xffffd
    80003514:	77c080e7          	jalr	1916(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    80003518:	fffff097          	auipc	ra,0xfffff
    8000351c:	548080e7          	jalr	1352(ra) # 80002a60 <mycpu>
    80003520:	87aa                	mv	a5,a0
    80003522:	5fbc                	lw	a5,120(a5)
    80003524:	873e                	mv	a4,a5
    80003526:	4785                	li	a5,1
    80003528:	00f70a63          	beq	a4,a5,8000353c <sched+0x5c>
    panic("sched locks");
    8000352c:	00008517          	auipc	a0,0x8
    80003530:	d1c50513          	addi	a0,a0,-740 # 8000b248 <etext+0x248>
    80003534:	ffffd097          	auipc	ra,0xffffd
    80003538:	758080e7          	jalr	1880(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    8000353c:	fd843783          	ld	a5,-40(s0)
    80003540:	4f9c                	lw	a5,24(a5)
    80003542:	873e                	mv	a4,a5
    80003544:	4791                	li	a5,4
    80003546:	00f71a63          	bne	a4,a5,8000355a <sched+0x7a>
    panic("sched running");
    8000354a:	00008517          	auipc	a0,0x8
    8000354e:	d0e50513          	addi	a0,a0,-754 # 8000b258 <etext+0x258>
    80003552:	ffffd097          	auipc	ra,0xffffd
    80003556:	73a080e7          	jalr	1850(ra) # 80000c8c <panic>
  if(intr_get())
    8000355a:	fffff097          	auipc	ra,0xfffff
    8000355e:	312080e7          	jalr	786(ra) # 8000286c <intr_get>
    80003562:	87aa                	mv	a5,a0
    80003564:	cb89                	beqz	a5,80003576 <sched+0x96>
    panic("sched interruptible");
    80003566:	00008517          	auipc	a0,0x8
    8000356a:	d0250513          	addi	a0,a0,-766 # 8000b268 <etext+0x268>
    8000356e:	ffffd097          	auipc	ra,0xffffd
    80003572:	71e080e7          	jalr	1822(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    80003576:	fffff097          	auipc	ra,0xfffff
    8000357a:	4ea080e7          	jalr	1258(ra) # 80002a60 <mycpu>
    8000357e:	87aa                	mv	a5,a0
    80003580:	5ffc                	lw	a5,124(a5)
    80003582:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    80003586:	fd843783          	ld	a5,-40(s0)
    8000358a:	06078493          	addi	s1,a5,96
    8000358e:	fffff097          	auipc	ra,0xfffff
    80003592:	4d2080e7          	jalr	1234(ra) # 80002a60 <mycpu>
    80003596:	87aa                	mv	a5,a0
    80003598:	07a1                	addi	a5,a5,8
    8000359a:	85be                	mv	a1,a5
    8000359c:	8526                	mv	a0,s1
    8000359e:	00000097          	auipc	ra,0x0
    800035a2:	4d6080e7          	jalr	1238(ra) # 80003a74 <swtch>
  mycpu()->intena = intena;
    800035a6:	fffff097          	auipc	ra,0xfffff
    800035aa:	4ba080e7          	jalr	1210(ra) # 80002a60 <mycpu>
    800035ae:	872a                	mv	a4,a0
    800035b0:	fd442783          	lw	a5,-44(s0)
    800035b4:	df7c                	sw	a5,124(a4)
}
    800035b6:	0001                	nop
    800035b8:	70a2                	ld	ra,40(sp)
    800035ba:	7402                	ld	s0,32(sp)
    800035bc:	64e2                	ld	s1,24(sp)
    800035be:	6145                	addi	sp,sp,48
    800035c0:	8082                	ret

00000000800035c2 <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    800035c2:	1101                	addi	sp,sp,-32
    800035c4:	ec06                	sd	ra,24(sp)
    800035c6:	e822                	sd	s0,16(sp)
    800035c8:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    800035ca:	fffff097          	auipc	ra,0xfffff
    800035ce:	4d0080e7          	jalr	1232(ra) # 80002a9a <myproc>
    800035d2:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    800035d6:	fe843783          	ld	a5,-24(s0)
    800035da:	853e                	mv	a0,a5
    800035dc:	ffffe097          	auipc	ra,0xffffe
    800035e0:	d4e080e7          	jalr	-690(ra) # 8000132a <acquire>
  p->state = RUNNABLE;
    800035e4:	fe843783          	ld	a5,-24(s0)
    800035e8:	470d                	li	a4,3
    800035ea:	cf98                	sw	a4,24(a5)
  sched();
    800035ec:	00000097          	auipc	ra,0x0
    800035f0:	ef4080e7          	jalr	-268(ra) # 800034e0 <sched>
  release(&p->lock);
    800035f4:	fe843783          	ld	a5,-24(s0)
    800035f8:	853e                	mv	a0,a5
    800035fa:	ffffe097          	auipc	ra,0xffffe
    800035fe:	d94080e7          	jalr	-620(ra) # 8000138e <release>
}
    80003602:	0001                	nop
    80003604:	60e2                	ld	ra,24(sp)
    80003606:	6442                	ld	s0,16(sp)
    80003608:	6105                	addi	sp,sp,32
    8000360a:	8082                	ret

000000008000360c <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    8000360c:	1141                	addi	sp,sp,-16
    8000360e:	e406                	sd	ra,8(sp)
    80003610:	e022                	sd	s0,0(sp)
    80003612:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    80003614:	fffff097          	auipc	ra,0xfffff
    80003618:	486080e7          	jalr	1158(ra) # 80002a9a <myproc>
    8000361c:	87aa                	mv	a5,a0
    8000361e:	853e                	mv	a0,a5
    80003620:	ffffe097          	auipc	ra,0xffffe
    80003624:	d6e080e7          	jalr	-658(ra) # 8000138e <release>

  if (first) {
    80003628:	00008797          	auipc	a5,0x8
    8000362c:	19c78793          	addi	a5,a5,412 # 8000b7c4 <first.1699>
    80003630:	439c                	lw	a5,0(a5)
    80003632:	cf81                	beqz	a5,8000364a <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    80003634:	00008797          	auipc	a5,0x8
    80003638:	19078793          	addi	a5,a5,400 # 8000b7c4 <first.1699>
    8000363c:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003640:	4505                	li	a0,1
    80003642:	00001097          	auipc	ra,0x1
    80003646:	548080e7          	jalr	1352(ra) # 80004b8a <fsinit>
  }

  usertrapret();
    8000364a:	00000097          	auipc	ra,0x0
    8000364e:	7dc080e7          	jalr	2012(ra) # 80003e26 <usertrapret>
}
    80003652:	0001                	nop
    80003654:	60a2                	ld	ra,8(sp)
    80003656:	6402                	ld	s0,0(sp)
    80003658:	0141                	addi	sp,sp,16
    8000365a:	8082                	ret

000000008000365c <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    8000365c:	7179                	addi	sp,sp,-48
    8000365e:	f406                	sd	ra,40(sp)
    80003660:	f022                	sd	s0,32(sp)
    80003662:	1800                	addi	s0,sp,48
    80003664:	fca43c23          	sd	a0,-40(s0)
    80003668:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    8000366c:	fffff097          	auipc	ra,0xfffff
    80003670:	42e080e7          	jalr	1070(ra) # 80002a9a <myproc>
    80003674:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003678:	fe843783          	ld	a5,-24(s0)
    8000367c:	853e                	mv	a0,a5
    8000367e:	ffffe097          	auipc	ra,0xffffe
    80003682:	cac080e7          	jalr	-852(ra) # 8000132a <acquire>
  release(lk);
    80003686:	fd043503          	ld	a0,-48(s0)
    8000368a:	ffffe097          	auipc	ra,0xffffe
    8000368e:	d04080e7          	jalr	-764(ra) # 8000138e <release>

  // Go to sleep.
  p->chan = chan;
    80003692:	fe843783          	ld	a5,-24(s0)
    80003696:	fd843703          	ld	a4,-40(s0)
    8000369a:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    8000369c:	fe843783          	ld	a5,-24(s0)
    800036a0:	4709                	li	a4,2
    800036a2:	cf98                	sw	a4,24(a5)

  sched();
    800036a4:	00000097          	auipc	ra,0x0
    800036a8:	e3c080e7          	jalr	-452(ra) # 800034e0 <sched>

  // Tidy up.
  p->chan = 0;
    800036ac:	fe843783          	ld	a5,-24(s0)
    800036b0:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    800036b4:	fe843783          	ld	a5,-24(s0)
    800036b8:	853e                	mv	a0,a5
    800036ba:	ffffe097          	auipc	ra,0xffffe
    800036be:	cd4080e7          	jalr	-812(ra) # 8000138e <release>
  acquire(lk);
    800036c2:	fd043503          	ld	a0,-48(s0)
    800036c6:	ffffe097          	auipc	ra,0xffffe
    800036ca:	c64080e7          	jalr	-924(ra) # 8000132a <acquire>
}
    800036ce:	0001                	nop
    800036d0:	70a2                	ld	ra,40(sp)
    800036d2:	7402                	ld	s0,32(sp)
    800036d4:	6145                	addi	sp,sp,48
    800036d6:	8082                	ret

00000000800036d8 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800036d8:	7179                	addi	sp,sp,-48
    800036da:	f406                	sd	ra,40(sp)
    800036dc:	f022                	sd	s0,32(sp)
    800036de:	1800                	addi	s0,sp,48
    800036e0:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800036e4:	00021797          	auipc	a5,0x21
    800036e8:	8d478793          	addi	a5,a5,-1836 # 80023fb8 <proc>
    800036ec:	fef43423          	sd	a5,-24(s0)
    800036f0:	a051                	j	80003774 <wakeup+0x9c>
    if(p != myproc()){
    800036f2:	fffff097          	auipc	ra,0xfffff
    800036f6:	3a8080e7          	jalr	936(ra) # 80002a9a <myproc>
    800036fa:	872a                	mv	a4,a0
    800036fc:	fe843783          	ld	a5,-24(s0)
    80003700:	06e78463          	beq	a5,a4,80003768 <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    80003704:	fe843783          	ld	a5,-24(s0)
    80003708:	853e                	mv	a0,a5
    8000370a:	ffffe097          	auipc	ra,0xffffe
    8000370e:	cda080e7          	jalr	-806(ra) # 800013e4 <holding>
    80003712:	87aa                	mv	a5,a0
    80003714:	cb81                	beqz	a5,80003724 <wakeup+0x4c>
    80003716:	fe843783          	ld	a5,-24(s0)
    8000371a:	4f9c                	lw	a5,24(a5)
    8000371c:	873e                	mv	a4,a5
    8000371e:	4785                	li	a5,1
    80003720:	04f70363          	beq	a4,a5,80003766 <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    80003724:	fe843783          	ld	a5,-24(s0)
    80003728:	853e                	mv	a0,a5
    8000372a:	ffffe097          	auipc	ra,0xffffe
    8000372e:	c00080e7          	jalr	-1024(ra) # 8000132a <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    80003732:	fe843783          	ld	a5,-24(s0)
    80003736:	4f9c                	lw	a5,24(a5)
    80003738:	873e                	mv	a4,a5
    8000373a:	4789                	li	a5,2
    8000373c:	00f71d63          	bne	a4,a5,80003756 <wakeup+0x7e>
    80003740:	fe843783          	ld	a5,-24(s0)
    80003744:	739c                	ld	a5,32(a5)
    80003746:	fd843703          	ld	a4,-40(s0)
    8000374a:	00f71663          	bne	a4,a5,80003756 <wakeup+0x7e>
        p->state = RUNNABLE;
    8000374e:	fe843783          	ld	a5,-24(s0)
    80003752:	470d                	li	a4,3
    80003754:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    80003756:	fe843783          	ld	a5,-24(s0)
    8000375a:	853e                	mv	a0,a5
    8000375c:	ffffe097          	auipc	ra,0xffffe
    80003760:	c32080e7          	jalr	-974(ra) # 8000138e <release>
    80003764:	a011                	j	80003768 <wakeup+0x90>
        continue;
    80003766:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    80003768:	fe843783          	ld	a5,-24(s0)
    8000376c:	16878793          	addi	a5,a5,360
    80003770:	fef43423          	sd	a5,-24(s0)
    80003774:	fe843703          	ld	a4,-24(s0)
    80003778:	00026797          	auipc	a5,0x26
    8000377c:	24078793          	addi	a5,a5,576 # 800299b8 <pid_lock>
    80003780:	f6f769e3          	bltu	a4,a5,800036f2 <wakeup+0x1a>
    }
  }
}
    80003784:	0001                	nop
    80003786:	0001                	nop
    80003788:	70a2                	ld	ra,40(sp)
    8000378a:	7402                	ld	s0,32(sp)
    8000378c:	6145                	addi	sp,sp,48
    8000378e:	8082                	ret

0000000080003790 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003790:	7179                	addi	sp,sp,-48
    80003792:	f406                	sd	ra,40(sp)
    80003794:	f022                	sd	s0,32(sp)
    80003796:	1800                	addi	s0,sp,48
    80003798:	87aa                	mv	a5,a0
    8000379a:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    8000379e:	00021797          	auipc	a5,0x21
    800037a2:	81a78793          	addi	a5,a5,-2022 # 80023fb8 <proc>
    800037a6:	fef43423          	sd	a5,-24(s0)
    800037aa:	a0ad                	j	80003814 <kill+0x84>
    acquire(&p->lock);
    800037ac:	fe843783          	ld	a5,-24(s0)
    800037b0:	853e                	mv	a0,a5
    800037b2:	ffffe097          	auipc	ra,0xffffe
    800037b6:	b78080e7          	jalr	-1160(ra) # 8000132a <acquire>
    if(p->pid == pid){
    800037ba:	fe843783          	ld	a5,-24(s0)
    800037be:	5b98                	lw	a4,48(a5)
    800037c0:	fdc42783          	lw	a5,-36(s0)
    800037c4:	2781                	sext.w	a5,a5
    800037c6:	02e79a63          	bne	a5,a4,800037fa <kill+0x6a>
      p->killed = 1;
    800037ca:	fe843783          	ld	a5,-24(s0)
    800037ce:	4705                	li	a4,1
    800037d0:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    800037d2:	fe843783          	ld	a5,-24(s0)
    800037d6:	4f9c                	lw	a5,24(a5)
    800037d8:	873e                	mv	a4,a5
    800037da:	4789                	li	a5,2
    800037dc:	00f71663          	bne	a4,a5,800037e8 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    800037e0:	fe843783          	ld	a5,-24(s0)
    800037e4:	470d                	li	a4,3
    800037e6:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800037e8:	fe843783          	ld	a5,-24(s0)
    800037ec:	853e                	mv	a0,a5
    800037ee:	ffffe097          	auipc	ra,0xffffe
    800037f2:	ba0080e7          	jalr	-1120(ra) # 8000138e <release>
      return 0;
    800037f6:	4781                	li	a5,0
    800037f8:	a03d                	j	80003826 <kill+0x96>
    }
    release(&p->lock);
    800037fa:	fe843783          	ld	a5,-24(s0)
    800037fe:	853e                	mv	a0,a5
    80003800:	ffffe097          	auipc	ra,0xffffe
    80003804:	b8e080e7          	jalr	-1138(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++){
    80003808:	fe843783          	ld	a5,-24(s0)
    8000380c:	16878793          	addi	a5,a5,360
    80003810:	fef43423          	sd	a5,-24(s0)
    80003814:	fe843703          	ld	a4,-24(s0)
    80003818:	00026797          	auipc	a5,0x26
    8000381c:	1a078793          	addi	a5,a5,416 # 800299b8 <pid_lock>
    80003820:	f8f766e3          	bltu	a4,a5,800037ac <kill+0x1c>
  }
  return -1;
    80003824:	57fd                	li	a5,-1
}
    80003826:	853e                	mv	a0,a5
    80003828:	70a2                	ld	ra,40(sp)
    8000382a:	7402                	ld	s0,32(sp)
    8000382c:	6145                	addi	sp,sp,48
    8000382e:	8082                	ret

0000000080003830 <setkilled>:

void
setkilled(struct proc *p)
{
    80003830:	1101                	addi	sp,sp,-32
    80003832:	ec06                	sd	ra,24(sp)
    80003834:	e822                	sd	s0,16(sp)
    80003836:	1000                	addi	s0,sp,32
    80003838:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000383c:	fe843783          	ld	a5,-24(s0)
    80003840:	853e                	mv	a0,a5
    80003842:	ffffe097          	auipc	ra,0xffffe
    80003846:	ae8080e7          	jalr	-1304(ra) # 8000132a <acquire>
  p->killed = 1;
    8000384a:	fe843783          	ld	a5,-24(s0)
    8000384e:	4705                	li	a4,1
    80003850:	d798                	sw	a4,40(a5)
  release(&p->lock);
    80003852:	fe843783          	ld	a5,-24(s0)
    80003856:	853e                	mv	a0,a5
    80003858:	ffffe097          	auipc	ra,0xffffe
    8000385c:	b36080e7          	jalr	-1226(ra) # 8000138e <release>
}
    80003860:	0001                	nop
    80003862:	60e2                	ld	ra,24(sp)
    80003864:	6442                	ld	s0,16(sp)
    80003866:	6105                	addi	sp,sp,32
    80003868:	8082                	ret

000000008000386a <killed>:

int
killed(struct proc *p)
{
    8000386a:	7179                	addi	sp,sp,-48
    8000386c:	f406                	sd	ra,40(sp)
    8000386e:	f022                	sd	s0,32(sp)
    80003870:	1800                	addi	s0,sp,48
    80003872:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    80003876:	fd843783          	ld	a5,-40(s0)
    8000387a:	853e                	mv	a0,a5
    8000387c:	ffffe097          	auipc	ra,0xffffe
    80003880:	aae080e7          	jalr	-1362(ra) # 8000132a <acquire>
  k = p->killed;
    80003884:	fd843783          	ld	a5,-40(s0)
    80003888:	579c                	lw	a5,40(a5)
    8000388a:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    8000388e:	fd843783          	ld	a5,-40(s0)
    80003892:	853e                	mv	a0,a5
    80003894:	ffffe097          	auipc	ra,0xffffe
    80003898:	afa080e7          	jalr	-1286(ra) # 8000138e <release>
  return k;
    8000389c:	fec42783          	lw	a5,-20(s0)
}
    800038a0:	853e                	mv	a0,a5
    800038a2:	70a2                	ld	ra,40(sp)
    800038a4:	7402                	ld	s0,32(sp)
    800038a6:	6145                	addi	sp,sp,48
    800038a8:	8082                	ret

00000000800038aa <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    800038aa:	7139                	addi	sp,sp,-64
    800038ac:	fc06                	sd	ra,56(sp)
    800038ae:	f822                	sd	s0,48(sp)
    800038b0:	0080                	addi	s0,sp,64
    800038b2:	87aa                	mv	a5,a0
    800038b4:	fcb43823          	sd	a1,-48(s0)
    800038b8:	fcc43423          	sd	a2,-56(s0)
    800038bc:	fcd43023          	sd	a3,-64(s0)
    800038c0:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800038c4:	fffff097          	auipc	ra,0xfffff
    800038c8:	1d6080e7          	jalr	470(ra) # 80002a9a <myproc>
    800038cc:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    800038d0:	fdc42783          	lw	a5,-36(s0)
    800038d4:	2781                	sext.w	a5,a5
    800038d6:	c38d                	beqz	a5,800038f8 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    800038d8:	fe843783          	ld	a5,-24(s0)
    800038dc:	6bbc                	ld	a5,80(a5)
    800038de:	fc043683          	ld	a3,-64(s0)
    800038e2:	fc843603          	ld	a2,-56(s0)
    800038e6:	fd043583          	ld	a1,-48(s0)
    800038ea:	853e                	mv	a0,a5
    800038ec:	fffff097          	auipc	ra,0xfffff
    800038f0:	c78080e7          	jalr	-904(ra) # 80002564 <copyout>
    800038f4:	87aa                	mv	a5,a0
    800038f6:	a839                	j	80003914 <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    800038f8:	fd043783          	ld	a5,-48(s0)
    800038fc:	fc043703          	ld	a4,-64(s0)
    80003900:	2701                	sext.w	a4,a4
    80003902:	863a                	mv	a2,a4
    80003904:	fc843583          	ld	a1,-56(s0)
    80003908:	853e                	mv	a0,a5
    8000390a:	ffffe097          	auipc	ra,0xffffe
    8000390e:	cd8080e7          	jalr	-808(ra) # 800015e2 <memmove>
    return 0;
    80003912:	4781                	li	a5,0
  }
}
    80003914:	853e                	mv	a0,a5
    80003916:	70e2                	ld	ra,56(sp)
    80003918:	7442                	ld	s0,48(sp)
    8000391a:	6121                	addi	sp,sp,64
    8000391c:	8082                	ret

000000008000391e <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    8000391e:	7139                	addi	sp,sp,-64
    80003920:	fc06                	sd	ra,56(sp)
    80003922:	f822                	sd	s0,48(sp)
    80003924:	0080                	addi	s0,sp,64
    80003926:	fca43c23          	sd	a0,-40(s0)
    8000392a:	87ae                	mv	a5,a1
    8000392c:	fcc43423          	sd	a2,-56(s0)
    80003930:	fcd43023          	sd	a3,-64(s0)
    80003934:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003938:	fffff097          	auipc	ra,0xfffff
    8000393c:	162080e7          	jalr	354(ra) # 80002a9a <myproc>
    80003940:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003944:	fd442783          	lw	a5,-44(s0)
    80003948:	2781                	sext.w	a5,a5
    8000394a:	c38d                	beqz	a5,8000396c <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    8000394c:	fe843783          	ld	a5,-24(s0)
    80003950:	6bbc                	ld	a5,80(a5)
    80003952:	fc043683          	ld	a3,-64(s0)
    80003956:	fc843603          	ld	a2,-56(s0)
    8000395a:	fd843583          	ld	a1,-40(s0)
    8000395e:	853e                	mv	a0,a5
    80003960:	fffff097          	auipc	ra,0xfffff
    80003964:	cd2080e7          	jalr	-814(ra) # 80002632 <copyin>
    80003968:	87aa                	mv	a5,a0
    8000396a:	a839                	j	80003988 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    8000396c:	fc843783          	ld	a5,-56(s0)
    80003970:	fc043703          	ld	a4,-64(s0)
    80003974:	2701                	sext.w	a4,a4
    80003976:	863a                	mv	a2,a4
    80003978:	85be                	mv	a1,a5
    8000397a:	fd843503          	ld	a0,-40(s0)
    8000397e:	ffffe097          	auipc	ra,0xffffe
    80003982:	c64080e7          	jalr	-924(ra) # 800015e2 <memmove>
    return 0;
    80003986:	4781                	li	a5,0
  }
}
    80003988:	853e                	mv	a0,a5
    8000398a:	70e2                	ld	ra,56(sp)
    8000398c:	7442                	ld	s0,48(sp)
    8000398e:	6121                	addi	sp,sp,64
    80003990:	8082                	ret

0000000080003992 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003992:	1101                	addi	sp,sp,-32
    80003994:	ec06                	sd	ra,24(sp)
    80003996:	e822                	sd	s0,16(sp)
    80003998:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    8000399a:	00008517          	auipc	a0,0x8
    8000399e:	8e650513          	addi	a0,a0,-1818 # 8000b280 <etext+0x280>
    800039a2:	ffffd097          	auipc	ra,0xffffd
    800039a6:	094080e7          	jalr	148(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    800039aa:	00020797          	auipc	a5,0x20
    800039ae:	60e78793          	addi	a5,a5,1550 # 80023fb8 <proc>
    800039b2:	fef43423          	sd	a5,-24(s0)
    800039b6:	a04d                	j	80003a58 <procdump+0xc6>
    if(p->state == UNUSED)
    800039b8:	fe843783          	ld	a5,-24(s0)
    800039bc:	4f9c                	lw	a5,24(a5)
    800039be:	c7d1                	beqz	a5,80003a4a <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    800039c0:	fe843783          	ld	a5,-24(s0)
    800039c4:	4f9c                	lw	a5,24(a5)
    800039c6:	873e                	mv	a4,a5
    800039c8:	4795                	li	a5,5
    800039ca:	02e7ee63          	bltu	a5,a4,80003a06 <procdump+0x74>
    800039ce:	fe843783          	ld	a5,-24(s0)
    800039d2:	4f9c                	lw	a5,24(a5)
    800039d4:	00008717          	auipc	a4,0x8
    800039d8:	e4c70713          	addi	a4,a4,-436 # 8000b820 <states.1744>
    800039dc:	1782                	slli	a5,a5,0x20
    800039de:	9381                	srli	a5,a5,0x20
    800039e0:	078e                	slli	a5,a5,0x3
    800039e2:	97ba                	add	a5,a5,a4
    800039e4:	639c                	ld	a5,0(a5)
    800039e6:	c385                	beqz	a5,80003a06 <procdump+0x74>
      state = states[p->state];
    800039e8:	fe843783          	ld	a5,-24(s0)
    800039ec:	4f9c                	lw	a5,24(a5)
    800039ee:	00008717          	auipc	a4,0x8
    800039f2:	e3270713          	addi	a4,a4,-462 # 8000b820 <states.1744>
    800039f6:	1782                	slli	a5,a5,0x20
    800039f8:	9381                	srli	a5,a5,0x20
    800039fa:	078e                	slli	a5,a5,0x3
    800039fc:	97ba                	add	a5,a5,a4
    800039fe:	639c                	ld	a5,0(a5)
    80003a00:	fef43023          	sd	a5,-32(s0)
    80003a04:	a039                	j	80003a12 <procdump+0x80>
    else
      state = "???";
    80003a06:	00008797          	auipc	a5,0x8
    80003a0a:	88278793          	addi	a5,a5,-1918 # 8000b288 <etext+0x288>
    80003a0e:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003a12:	fe843783          	ld	a5,-24(s0)
    80003a16:	5b98                	lw	a4,48(a5)
    80003a18:	fe843783          	ld	a5,-24(s0)
    80003a1c:	15878793          	addi	a5,a5,344
    80003a20:	86be                	mv	a3,a5
    80003a22:	fe043603          	ld	a2,-32(s0)
    80003a26:	85ba                	mv	a1,a4
    80003a28:	00008517          	auipc	a0,0x8
    80003a2c:	86850513          	addi	a0,a0,-1944 # 8000b290 <etext+0x290>
    80003a30:	ffffd097          	auipc	ra,0xffffd
    80003a34:	006080e7          	jalr	6(ra) # 80000a36 <printf>
    printf("\n");
    80003a38:	00008517          	auipc	a0,0x8
    80003a3c:	84850513          	addi	a0,a0,-1976 # 8000b280 <etext+0x280>
    80003a40:	ffffd097          	auipc	ra,0xffffd
    80003a44:	ff6080e7          	jalr	-10(ra) # 80000a36 <printf>
    80003a48:	a011                	j	80003a4c <procdump+0xba>
      continue;
    80003a4a:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003a4c:	fe843783          	ld	a5,-24(s0)
    80003a50:	16878793          	addi	a5,a5,360
    80003a54:	fef43423          	sd	a5,-24(s0)
    80003a58:	fe843703          	ld	a4,-24(s0)
    80003a5c:	00026797          	auipc	a5,0x26
    80003a60:	f5c78793          	addi	a5,a5,-164 # 800299b8 <pid_lock>
    80003a64:	f4f76ae3          	bltu	a4,a5,800039b8 <procdump+0x26>
  }
}
    80003a68:	0001                	nop
    80003a6a:	0001                	nop
    80003a6c:	60e2                	ld	ra,24(sp)
    80003a6e:	6442                	ld	s0,16(sp)
    80003a70:	6105                	addi	sp,sp,32
    80003a72:	8082                	ret

0000000080003a74 <swtch>:
    80003a74:	00153023          	sd	ra,0(a0)
    80003a78:	00253423          	sd	sp,8(a0)
    80003a7c:	e900                	sd	s0,16(a0)
    80003a7e:	ed04                	sd	s1,24(a0)
    80003a80:	03253023          	sd	s2,32(a0)
    80003a84:	03353423          	sd	s3,40(a0)
    80003a88:	03453823          	sd	s4,48(a0)
    80003a8c:	03553c23          	sd	s5,56(a0)
    80003a90:	05653023          	sd	s6,64(a0)
    80003a94:	05753423          	sd	s7,72(a0)
    80003a98:	05853823          	sd	s8,80(a0)
    80003a9c:	05953c23          	sd	s9,88(a0)
    80003aa0:	07a53023          	sd	s10,96(a0)
    80003aa4:	07b53423          	sd	s11,104(a0)
    80003aa8:	0005b083          	ld	ra,0(a1)
    80003aac:	0085b103          	ld	sp,8(a1)
    80003ab0:	6980                	ld	s0,16(a1)
    80003ab2:	6d84                	ld	s1,24(a1)
    80003ab4:	0205b903          	ld	s2,32(a1)
    80003ab8:	0285b983          	ld	s3,40(a1)
    80003abc:	0305ba03          	ld	s4,48(a1)
    80003ac0:	0385ba83          	ld	s5,56(a1)
    80003ac4:	0405bb03          	ld	s6,64(a1)
    80003ac8:	0485bb83          	ld	s7,72(a1)
    80003acc:	0505bc03          	ld	s8,80(a1)
    80003ad0:	0585bc83          	ld	s9,88(a1)
    80003ad4:	0605bd03          	ld	s10,96(a1)
    80003ad8:	0685bd83          	ld	s11,104(a1)
    80003adc:	8082                	ret

0000000080003ade <r_sstatus>:
{
    80003ade:	1101                	addi	sp,sp,-32
    80003ae0:	ec22                	sd	s0,24(sp)
    80003ae2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003ae4:	100027f3          	csrr	a5,sstatus
    80003ae8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003aec:	fe843783          	ld	a5,-24(s0)
}
    80003af0:	853e                	mv	a0,a5
    80003af2:	6462                	ld	s0,24(sp)
    80003af4:	6105                	addi	sp,sp,32
    80003af6:	8082                	ret

0000000080003af8 <w_sstatus>:
{
    80003af8:	1101                	addi	sp,sp,-32
    80003afa:	ec22                	sd	s0,24(sp)
    80003afc:	1000                	addi	s0,sp,32
    80003afe:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003b02:	fe843783          	ld	a5,-24(s0)
    80003b06:	10079073          	csrw	sstatus,a5
}
    80003b0a:	0001                	nop
    80003b0c:	6462                	ld	s0,24(sp)
    80003b0e:	6105                	addi	sp,sp,32
    80003b10:	8082                	ret

0000000080003b12 <r_sip>:
{
    80003b12:	1101                	addi	sp,sp,-32
    80003b14:	ec22                	sd	s0,24(sp)
    80003b16:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003b18:	144027f3          	csrr	a5,sip
    80003b1c:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b20:	fe843783          	ld	a5,-24(s0)
}
    80003b24:	853e                	mv	a0,a5
    80003b26:	6462                	ld	s0,24(sp)
    80003b28:	6105                	addi	sp,sp,32
    80003b2a:	8082                	ret

0000000080003b2c <w_sip>:
{
    80003b2c:	1101                	addi	sp,sp,-32
    80003b2e:	ec22                	sd	s0,24(sp)
    80003b30:	1000                	addi	s0,sp,32
    80003b32:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003b36:	fe843783          	ld	a5,-24(s0)
    80003b3a:	14479073          	csrw	sip,a5
}
    80003b3e:	0001                	nop
    80003b40:	6462                	ld	s0,24(sp)
    80003b42:	6105                	addi	sp,sp,32
    80003b44:	8082                	ret

0000000080003b46 <w_sepc>:
{
    80003b46:	1101                	addi	sp,sp,-32
    80003b48:	ec22                	sd	s0,24(sp)
    80003b4a:	1000                	addi	s0,sp,32
    80003b4c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003b50:	fe843783          	ld	a5,-24(s0)
    80003b54:	14179073          	csrw	sepc,a5
}
    80003b58:	0001                	nop
    80003b5a:	6462                	ld	s0,24(sp)
    80003b5c:	6105                	addi	sp,sp,32
    80003b5e:	8082                	ret

0000000080003b60 <r_sepc>:
{
    80003b60:	1101                	addi	sp,sp,-32
    80003b62:	ec22                	sd	s0,24(sp)
    80003b64:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003b66:	141027f3          	csrr	a5,sepc
    80003b6a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003b6e:	fe843783          	ld	a5,-24(s0)
}
    80003b72:	853e                	mv	a0,a5
    80003b74:	6462                	ld	s0,24(sp)
    80003b76:	6105                	addi	sp,sp,32
    80003b78:	8082                	ret

0000000080003b7a <w_stvec>:
{
    80003b7a:	1101                	addi	sp,sp,-32
    80003b7c:	ec22                	sd	s0,24(sp)
    80003b7e:	1000                	addi	s0,sp,32
    80003b80:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003b84:	fe843783          	ld	a5,-24(s0)
    80003b88:	10579073          	csrw	stvec,a5
}
    80003b8c:	0001                	nop
    80003b8e:	6462                	ld	s0,24(sp)
    80003b90:	6105                	addi	sp,sp,32
    80003b92:	8082                	ret

0000000080003b94 <r_satp>:
{
    80003b94:	1101                	addi	sp,sp,-32
    80003b96:	ec22                	sd	s0,24(sp)
    80003b98:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003b9a:	180027f3          	csrr	a5,satp
    80003b9e:	fef43423          	sd	a5,-24(s0)
  return x;
    80003ba2:	fe843783          	ld	a5,-24(s0)
}
    80003ba6:	853e                	mv	a0,a5
    80003ba8:	6462                	ld	s0,24(sp)
    80003baa:	6105                	addi	sp,sp,32
    80003bac:	8082                	ret

0000000080003bae <r_scause>:
{
    80003bae:	1101                	addi	sp,sp,-32
    80003bb0:	ec22                	sd	s0,24(sp)
    80003bb2:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003bb4:	142027f3          	csrr	a5,scause
    80003bb8:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bbc:	fe843783          	ld	a5,-24(s0)
}
    80003bc0:	853e                	mv	a0,a5
    80003bc2:	6462                	ld	s0,24(sp)
    80003bc4:	6105                	addi	sp,sp,32
    80003bc6:	8082                	ret

0000000080003bc8 <r_stval>:
{
    80003bc8:	1101                	addi	sp,sp,-32
    80003bca:	ec22                	sd	s0,24(sp)
    80003bcc:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003bce:	143027f3          	csrr	a5,stval
    80003bd2:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bd6:	fe843783          	ld	a5,-24(s0)
}
    80003bda:	853e                	mv	a0,a5
    80003bdc:	6462                	ld	s0,24(sp)
    80003bde:	6105                	addi	sp,sp,32
    80003be0:	8082                	ret

0000000080003be2 <intr_on>:
{
    80003be2:	1141                	addi	sp,sp,-16
    80003be4:	e406                	sd	ra,8(sp)
    80003be6:	e022                	sd	s0,0(sp)
    80003be8:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003bea:	00000097          	auipc	ra,0x0
    80003bee:	ef4080e7          	jalr	-268(ra) # 80003ade <r_sstatus>
    80003bf2:	87aa                	mv	a5,a0
    80003bf4:	0027e793          	ori	a5,a5,2
    80003bf8:	853e                	mv	a0,a5
    80003bfa:	00000097          	auipc	ra,0x0
    80003bfe:	efe080e7          	jalr	-258(ra) # 80003af8 <w_sstatus>
}
    80003c02:	0001                	nop
    80003c04:	60a2                	ld	ra,8(sp)
    80003c06:	6402                	ld	s0,0(sp)
    80003c08:	0141                	addi	sp,sp,16
    80003c0a:	8082                	ret

0000000080003c0c <intr_off>:
{
    80003c0c:	1141                	addi	sp,sp,-16
    80003c0e:	e406                	sd	ra,8(sp)
    80003c10:	e022                	sd	s0,0(sp)
    80003c12:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003c14:	00000097          	auipc	ra,0x0
    80003c18:	eca080e7          	jalr	-310(ra) # 80003ade <r_sstatus>
    80003c1c:	87aa                	mv	a5,a0
    80003c1e:	9bf5                	andi	a5,a5,-3
    80003c20:	853e                	mv	a0,a5
    80003c22:	00000097          	auipc	ra,0x0
    80003c26:	ed6080e7          	jalr	-298(ra) # 80003af8 <w_sstatus>
}
    80003c2a:	0001                	nop
    80003c2c:	60a2                	ld	ra,8(sp)
    80003c2e:	6402                	ld	s0,0(sp)
    80003c30:	0141                	addi	sp,sp,16
    80003c32:	8082                	ret

0000000080003c34 <intr_get>:
{
    80003c34:	1101                	addi	sp,sp,-32
    80003c36:	ec06                	sd	ra,24(sp)
    80003c38:	e822                	sd	s0,16(sp)
    80003c3a:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003c3c:	00000097          	auipc	ra,0x0
    80003c40:	ea2080e7          	jalr	-350(ra) # 80003ade <r_sstatus>
    80003c44:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003c48:	fe843783          	ld	a5,-24(s0)
    80003c4c:	8b89                	andi	a5,a5,2
    80003c4e:	00f037b3          	snez	a5,a5
    80003c52:	0ff7f793          	andi	a5,a5,255
    80003c56:	2781                	sext.w	a5,a5
}
    80003c58:	853e                	mv	a0,a5
    80003c5a:	60e2                	ld	ra,24(sp)
    80003c5c:	6442                	ld	s0,16(sp)
    80003c5e:	6105                	addi	sp,sp,32
    80003c60:	8082                	ret

0000000080003c62 <r_tp>:
{
    80003c62:	1101                	addi	sp,sp,-32
    80003c64:	ec22                	sd	s0,24(sp)
    80003c66:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003c68:	8792                	mv	a5,tp
    80003c6a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c6e:	fe843783          	ld	a5,-24(s0)
}
    80003c72:	853e                	mv	a0,a5
    80003c74:	6462                	ld	s0,24(sp)
    80003c76:	6105                	addi	sp,sp,32
    80003c78:	8082                	ret

0000000080003c7a <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003c7a:	1141                	addi	sp,sp,-16
    80003c7c:	e406                	sd	ra,8(sp)
    80003c7e:	e022                	sd	s0,0(sp)
    80003c80:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003c82:	00007597          	auipc	a1,0x7
    80003c86:	65658593          	addi	a1,a1,1622 # 8000b2d8 <etext+0x2d8>
    80003c8a:	00026517          	auipc	a0,0x26
    80003c8e:	d5e50513          	addi	a0,a0,-674 # 800299e8 <tickslock>
    80003c92:	ffffd097          	auipc	ra,0xffffd
    80003c96:	668080e7          	jalr	1640(ra) # 800012fa <initlock>
}
    80003c9a:	0001                	nop
    80003c9c:	60a2                	ld	ra,8(sp)
    80003c9e:	6402                	ld	s0,0(sp)
    80003ca0:	0141                	addi	sp,sp,16
    80003ca2:	8082                	ret

0000000080003ca4 <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003ca4:	1141                	addi	sp,sp,-16
    80003ca6:	e406                	sd	ra,8(sp)
    80003ca8:	e022                	sd	s0,0(sp)
    80003caa:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003cac:	00005797          	auipc	a5,0x5
    80003cb0:	dc478793          	addi	a5,a5,-572 # 80008a70 <kernelvec>
    80003cb4:	853e                	mv	a0,a5
    80003cb6:	00000097          	auipc	ra,0x0
    80003cba:	ec4080e7          	jalr	-316(ra) # 80003b7a <w_stvec>
}
    80003cbe:	0001                	nop
    80003cc0:	60a2                	ld	ra,8(sp)
    80003cc2:	6402                	ld	s0,0(sp)
    80003cc4:	0141                	addi	sp,sp,16
    80003cc6:	8082                	ret

0000000080003cc8 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003cc8:	7179                	addi	sp,sp,-48
    80003cca:	f406                	sd	ra,40(sp)
    80003ccc:	f022                	sd	s0,32(sp)
    80003cce:	ec26                	sd	s1,24(sp)
    80003cd0:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003cd2:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003cd6:	00000097          	auipc	ra,0x0
    80003cda:	e08080e7          	jalr	-504(ra) # 80003ade <r_sstatus>
    80003cde:	87aa                	mv	a5,a0
    80003ce0:	1007f793          	andi	a5,a5,256
    80003ce4:	cb89                	beqz	a5,80003cf6 <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003ce6:	00007517          	auipc	a0,0x7
    80003cea:	5fa50513          	addi	a0,a0,1530 # 8000b2e0 <etext+0x2e0>
    80003cee:	ffffd097          	auipc	ra,0xffffd
    80003cf2:	f9e080e7          	jalr	-98(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003cf6:	00005797          	auipc	a5,0x5
    80003cfa:	d7a78793          	addi	a5,a5,-646 # 80008a70 <kernelvec>
    80003cfe:	853e                	mv	a0,a5
    80003d00:	00000097          	auipc	ra,0x0
    80003d04:	e7a080e7          	jalr	-390(ra) # 80003b7a <w_stvec>

  struct proc *p = myproc();
    80003d08:	fffff097          	auipc	ra,0xfffff
    80003d0c:	d92080e7          	jalr	-622(ra) # 80002a9a <myproc>
    80003d10:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003d14:	fd043783          	ld	a5,-48(s0)
    80003d18:	6fa4                	ld	s1,88(a5)
    80003d1a:	00000097          	auipc	ra,0x0
    80003d1e:	e46080e7          	jalr	-442(ra) # 80003b60 <r_sepc>
    80003d22:	87aa                	mv	a5,a0
    80003d24:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003d26:	00000097          	auipc	ra,0x0
    80003d2a:	e88080e7          	jalr	-376(ra) # 80003bae <r_scause>
    80003d2e:	872a                	mv	a4,a0
    80003d30:	47a1                	li	a5,8
    80003d32:	04f71163          	bne	a4,a5,80003d74 <usertrap+0xac>
    // system call

    if(killed(p))
    80003d36:	fd043503          	ld	a0,-48(s0)
    80003d3a:	00000097          	auipc	ra,0x0
    80003d3e:	b30080e7          	jalr	-1232(ra) # 8000386a <killed>
    80003d42:	87aa                	mv	a5,a0
    80003d44:	c791                	beqz	a5,80003d50 <usertrap+0x88>
      exit(-1);
    80003d46:	557d                	li	a0,-1
    80003d48:	fffff097          	auipc	ra,0xfffff
    80003d4c:	444080e7          	jalr	1092(ra) # 8000318c <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003d50:	fd043783          	ld	a5,-48(s0)
    80003d54:	6fbc                	ld	a5,88(a5)
    80003d56:	6f98                	ld	a4,24(a5)
    80003d58:	fd043783          	ld	a5,-48(s0)
    80003d5c:	6fbc                	ld	a5,88(a5)
    80003d5e:	0711                	addi	a4,a4,4
    80003d60:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003d62:	00000097          	auipc	ra,0x0
    80003d66:	e80080e7          	jalr	-384(ra) # 80003be2 <intr_on>

    syscall();
    80003d6a:	00000097          	auipc	ra,0x0
    80003d6e:	6a8080e7          	jalr	1704(ra) # 80004412 <syscall>
    80003d72:	a885                	j	80003de2 <usertrap+0x11a>
  } else if((which_dev = devintr()) != 0){
    80003d74:	00000097          	auipc	ra,0x0
    80003d78:	36e080e7          	jalr	878(ra) # 800040e2 <devintr>
    80003d7c:	87aa                	mv	a5,a0
    80003d7e:	fcf42e23          	sw	a5,-36(s0)
    80003d82:	fdc42783          	lw	a5,-36(s0)
    80003d86:	2781                	sext.w	a5,a5
    80003d88:	efa9                	bnez	a5,80003de2 <usertrap+0x11a>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003d8a:	00000097          	auipc	ra,0x0
    80003d8e:	e24080e7          	jalr	-476(ra) # 80003bae <r_scause>
    80003d92:	872a                	mv	a4,a0
    80003d94:	fd043783          	ld	a5,-48(s0)
    80003d98:	5b9c                	lw	a5,48(a5)
    80003d9a:	863e                	mv	a2,a5
    80003d9c:	85ba                	mv	a1,a4
    80003d9e:	00007517          	auipc	a0,0x7
    80003da2:	56250513          	addi	a0,a0,1378 # 8000b300 <etext+0x300>
    80003da6:	ffffd097          	auipc	ra,0xffffd
    80003daa:	c90080e7          	jalr	-880(ra) # 80000a36 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003dae:	00000097          	auipc	ra,0x0
    80003db2:	db2080e7          	jalr	-590(ra) # 80003b60 <r_sepc>
    80003db6:	84aa                	mv	s1,a0
    80003db8:	00000097          	auipc	ra,0x0
    80003dbc:	e10080e7          	jalr	-496(ra) # 80003bc8 <r_stval>
    80003dc0:	87aa                	mv	a5,a0
    80003dc2:	863e                	mv	a2,a5
    80003dc4:	85a6                	mv	a1,s1
    80003dc6:	00007517          	auipc	a0,0x7
    80003dca:	56a50513          	addi	a0,a0,1386 # 8000b330 <etext+0x330>
    80003dce:	ffffd097          	auipc	ra,0xffffd
    80003dd2:	c68080e7          	jalr	-920(ra) # 80000a36 <printf>
    setkilled(p);
    80003dd6:	fd043503          	ld	a0,-48(s0)
    80003dda:	00000097          	auipc	ra,0x0
    80003dde:	a56080e7          	jalr	-1450(ra) # 80003830 <setkilled>
  }

  if(killed(p))
    80003de2:	fd043503          	ld	a0,-48(s0)
    80003de6:	00000097          	auipc	ra,0x0
    80003dea:	a84080e7          	jalr	-1404(ra) # 8000386a <killed>
    80003dee:	87aa                	mv	a5,a0
    80003df0:	c791                	beqz	a5,80003dfc <usertrap+0x134>
    exit(-1);
    80003df2:	557d                	li	a0,-1
    80003df4:	fffff097          	auipc	ra,0xfffff
    80003df8:	398080e7          	jalr	920(ra) # 8000318c <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003dfc:	fdc42783          	lw	a5,-36(s0)
    80003e00:	0007871b          	sext.w	a4,a5
    80003e04:	4789                	li	a5,2
    80003e06:	00f71663          	bne	a4,a5,80003e12 <usertrap+0x14a>
    yield();
    80003e0a:	fffff097          	auipc	ra,0xfffff
    80003e0e:	7b8080e7          	jalr	1976(ra) # 800035c2 <yield>

  usertrapret();
    80003e12:	00000097          	auipc	ra,0x0
    80003e16:	014080e7          	jalr	20(ra) # 80003e26 <usertrapret>
}
    80003e1a:	0001                	nop
    80003e1c:	70a2                	ld	ra,40(sp)
    80003e1e:	7402                	ld	s0,32(sp)
    80003e20:	64e2                	ld	s1,24(sp)
    80003e22:	6145                	addi	sp,sp,48
    80003e24:	8082                	ret

0000000080003e26 <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003e26:	715d                	addi	sp,sp,-80
    80003e28:	e486                	sd	ra,72(sp)
    80003e2a:	e0a2                	sd	s0,64(sp)
    80003e2c:	fc26                	sd	s1,56(sp)
    80003e2e:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003e30:	fffff097          	auipc	ra,0xfffff
    80003e34:	c6a080e7          	jalr	-918(ra) # 80002a9a <myproc>
    80003e38:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003e3c:	00000097          	auipc	ra,0x0
    80003e40:	dd0080e7          	jalr	-560(ra) # 80003c0c <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003e44:	00006717          	auipc	a4,0x6
    80003e48:	1bc70713          	addi	a4,a4,444 # 8000a000 <_trampoline>
    80003e4c:	00006797          	auipc	a5,0x6
    80003e50:	1b478793          	addi	a5,a5,436 # 8000a000 <_trampoline>
    80003e54:	8f1d                	sub	a4,a4,a5
    80003e56:	040007b7          	lui	a5,0x4000
    80003e5a:	17fd                	addi	a5,a5,-1
    80003e5c:	07b2                	slli	a5,a5,0xc
    80003e5e:	97ba                	add	a5,a5,a4
    80003e60:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003e64:	fd043503          	ld	a0,-48(s0)
    80003e68:	00000097          	auipc	ra,0x0
    80003e6c:	d12080e7          	jalr	-750(ra) # 80003b7a <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003e70:	fd843783          	ld	a5,-40(s0)
    80003e74:	6fa4                	ld	s1,88(a5)
    80003e76:	00000097          	auipc	ra,0x0
    80003e7a:	d1e080e7          	jalr	-738(ra) # 80003b94 <r_satp>
    80003e7e:	87aa                	mv	a5,a0
    80003e80:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003e82:	fd843783          	ld	a5,-40(s0)
    80003e86:	63b4                	ld	a3,64(a5)
    80003e88:	fd843783          	ld	a5,-40(s0)
    80003e8c:	6fbc                	ld	a5,88(a5)
    80003e8e:	6705                	lui	a4,0x1
    80003e90:	9736                	add	a4,a4,a3
    80003e92:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003e94:	fd843783          	ld	a5,-40(s0)
    80003e98:	6fbc                	ld	a5,88(a5)
    80003e9a:	00000717          	auipc	a4,0x0
    80003e9e:	e2e70713          	addi	a4,a4,-466 # 80003cc8 <usertrap>
    80003ea2:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003ea4:	fd843783          	ld	a5,-40(s0)
    80003ea8:	6fa4                	ld	s1,88(a5)
    80003eaa:	00000097          	auipc	ra,0x0
    80003eae:	db8080e7          	jalr	-584(ra) # 80003c62 <r_tp>
    80003eb2:	87aa                	mv	a5,a0
    80003eb4:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003eb6:	00000097          	auipc	ra,0x0
    80003eba:	c28080e7          	jalr	-984(ra) # 80003ade <r_sstatus>
    80003ebe:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003ec2:	fc843783          	ld	a5,-56(s0)
    80003ec6:	eff7f793          	andi	a5,a5,-257
    80003eca:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003ece:	fc843783          	ld	a5,-56(s0)
    80003ed2:	0207e793          	ori	a5,a5,32
    80003ed6:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003eda:	fc843503          	ld	a0,-56(s0)
    80003ede:	00000097          	auipc	ra,0x0
    80003ee2:	c1a080e7          	jalr	-998(ra) # 80003af8 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003ee6:	fd843783          	ld	a5,-40(s0)
    80003eea:	6fbc                	ld	a5,88(a5)
    80003eec:	6f9c                	ld	a5,24(a5)
    80003eee:	853e                	mv	a0,a5
    80003ef0:	00000097          	auipc	ra,0x0
    80003ef4:	c56080e7          	jalr	-938(ra) # 80003b46 <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003ef8:	fd843783          	ld	a5,-40(s0)
    80003efc:	6bbc                	ld	a5,80(a5)
    80003efe:	00c7d713          	srli	a4,a5,0xc
    80003f02:	57fd                	li	a5,-1
    80003f04:	17fe                	slli	a5,a5,0x3f
    80003f06:	8fd9                	or	a5,a5,a4
    80003f08:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003f0c:	00006717          	auipc	a4,0x6
    80003f10:	19070713          	addi	a4,a4,400 # 8000a09c <userret>
    80003f14:	00006797          	auipc	a5,0x6
    80003f18:	0ec78793          	addi	a5,a5,236 # 8000a000 <_trampoline>
    80003f1c:	8f1d                	sub	a4,a4,a5
    80003f1e:	040007b7          	lui	a5,0x4000
    80003f22:	17fd                	addi	a5,a5,-1
    80003f24:	07b2                	slli	a5,a5,0xc
    80003f26:	97ba                	add	a5,a5,a4
    80003f28:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003f2c:	fb843783          	ld	a5,-72(s0)
    80003f30:	fc043503          	ld	a0,-64(s0)
    80003f34:	9782                	jalr	a5
}
    80003f36:	0001                	nop
    80003f38:	60a6                	ld	ra,72(sp)
    80003f3a:	6406                	ld	s0,64(sp)
    80003f3c:	74e2                	ld	s1,56(sp)
    80003f3e:	6161                	addi	sp,sp,80
    80003f40:	8082                	ret

0000000080003f42 <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    80003f42:	7139                	addi	sp,sp,-64
    80003f44:	fc06                	sd	ra,56(sp)
    80003f46:	f822                	sd	s0,48(sp)
    80003f48:	f426                	sd	s1,40(sp)
    80003f4a:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80003f4c:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80003f50:	00000097          	auipc	ra,0x0
    80003f54:	c10080e7          	jalr	-1008(ra) # 80003b60 <r_sepc>
    80003f58:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80003f5c:	00000097          	auipc	ra,0x0
    80003f60:	b82080e7          	jalr	-1150(ra) # 80003ade <r_sstatus>
    80003f64:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80003f68:	00000097          	auipc	ra,0x0
    80003f6c:	c46080e7          	jalr	-954(ra) # 80003bae <r_scause>
    80003f70:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    80003f74:	fc843783          	ld	a5,-56(s0)
    80003f78:	1007f793          	andi	a5,a5,256
    80003f7c:	eb89                	bnez	a5,80003f8e <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80003f7e:	00007517          	auipc	a0,0x7
    80003f82:	3d250513          	addi	a0,a0,978 # 8000b350 <etext+0x350>
    80003f86:	ffffd097          	auipc	ra,0xffffd
    80003f8a:	d06080e7          	jalr	-762(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    80003f8e:	00000097          	auipc	ra,0x0
    80003f92:	ca6080e7          	jalr	-858(ra) # 80003c34 <intr_get>
    80003f96:	87aa                	mv	a5,a0
    80003f98:	cb89                	beqz	a5,80003faa <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80003f9a:	00007517          	auipc	a0,0x7
    80003f9e:	3de50513          	addi	a0,a0,990 # 8000b378 <etext+0x378>
    80003fa2:	ffffd097          	auipc	ra,0xffffd
    80003fa6:	cea080e7          	jalr	-790(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    80003faa:	00000097          	auipc	ra,0x0
    80003fae:	138080e7          	jalr	312(ra) # 800040e2 <devintr>
    80003fb2:	87aa                	mv	a5,a0
    80003fb4:	fcf42e23          	sw	a5,-36(s0)
    80003fb8:	fdc42783          	lw	a5,-36(s0)
    80003fbc:	2781                	sext.w	a5,a5
    80003fbe:	e7b9                	bnez	a5,8000400c <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80003fc0:	fc043583          	ld	a1,-64(s0)
    80003fc4:	00007517          	auipc	a0,0x7
    80003fc8:	3d450513          	addi	a0,a0,980 # 8000b398 <etext+0x398>
    80003fcc:	ffffd097          	auipc	ra,0xffffd
    80003fd0:	a6a080e7          	jalr	-1430(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003fd4:	00000097          	auipc	ra,0x0
    80003fd8:	b8c080e7          	jalr	-1140(ra) # 80003b60 <r_sepc>
    80003fdc:	84aa                	mv	s1,a0
    80003fde:	00000097          	auipc	ra,0x0
    80003fe2:	bea080e7          	jalr	-1046(ra) # 80003bc8 <r_stval>
    80003fe6:	87aa                	mv	a5,a0
    80003fe8:	863e                	mv	a2,a5
    80003fea:	85a6                	mv	a1,s1
    80003fec:	00007517          	auipc	a0,0x7
    80003ff0:	3bc50513          	addi	a0,a0,956 # 8000b3a8 <etext+0x3a8>
    80003ff4:	ffffd097          	auipc	ra,0xffffd
    80003ff8:	a42080e7          	jalr	-1470(ra) # 80000a36 <printf>
    panic("kerneltrap");
    80003ffc:	00007517          	auipc	a0,0x7
    80004000:	3c450513          	addi	a0,a0,964 # 8000b3c0 <etext+0x3c0>
    80004004:	ffffd097          	auipc	ra,0xffffd
    80004008:	c88080e7          	jalr	-888(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    8000400c:	fdc42783          	lw	a5,-36(s0)
    80004010:	0007871b          	sext.w	a4,a5
    80004014:	4789                	li	a5,2
    80004016:	02f71663          	bne	a4,a5,80004042 <kerneltrap+0x100>
    8000401a:	fffff097          	auipc	ra,0xfffff
    8000401e:	a80080e7          	jalr	-1408(ra) # 80002a9a <myproc>
    80004022:	87aa                	mv	a5,a0
    80004024:	cf99                	beqz	a5,80004042 <kerneltrap+0x100>
    80004026:	fffff097          	auipc	ra,0xfffff
    8000402a:	a74080e7          	jalr	-1420(ra) # 80002a9a <myproc>
    8000402e:	87aa                	mv	a5,a0
    80004030:	4f9c                	lw	a5,24(a5)
    80004032:	873e                	mv	a4,a5
    80004034:	4791                	li	a5,4
    80004036:	00f71663          	bne	a4,a5,80004042 <kerneltrap+0x100>
    yield();
    8000403a:	fffff097          	auipc	ra,0xfffff
    8000403e:	588080e7          	jalr	1416(ra) # 800035c2 <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    80004042:	fd043503          	ld	a0,-48(s0)
    80004046:	00000097          	auipc	ra,0x0
    8000404a:	b00080e7          	jalr	-1280(ra) # 80003b46 <w_sepc>
  w_sstatus(sstatus);
    8000404e:	fc843503          	ld	a0,-56(s0)
    80004052:	00000097          	auipc	ra,0x0
    80004056:	aa6080e7          	jalr	-1370(ra) # 80003af8 <w_sstatus>
}
    8000405a:	0001                	nop
    8000405c:	70e2                	ld	ra,56(sp)
    8000405e:	7442                	ld	s0,48(sp)
    80004060:	74a2                	ld	s1,40(sp)
    80004062:	6121                	addi	sp,sp,64
    80004064:	8082                	ret

0000000080004066 <clockintr>:

void
clockintr()
{
    80004066:	1141                	addi	sp,sp,-16
    80004068:	e406                	sd	ra,8(sp)
    8000406a:	e022                	sd	s0,0(sp)
    8000406c:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    8000406e:	00026517          	auipc	a0,0x26
    80004072:	97a50513          	addi	a0,a0,-1670 # 800299e8 <tickslock>
    80004076:	ffffd097          	auipc	ra,0xffffd
    8000407a:	2b4080e7          	jalr	692(ra) # 8000132a <acquire>
  ticks++;
    8000407e:	00008797          	auipc	a5,0x8
    80004082:	8ca78793          	addi	a5,a5,-1846 # 8000b948 <ticks>
    80004086:	439c                	lw	a5,0(a5)
    80004088:	2785                	addiw	a5,a5,1
    8000408a:	0007871b          	sext.w	a4,a5
    8000408e:	00008797          	auipc	a5,0x8
    80004092:	8ba78793          	addi	a5,a5,-1862 # 8000b948 <ticks>
    80004096:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    80004098:	00008797          	auipc	a5,0x8
    8000409c:	8b078793          	addi	a5,a5,-1872 # 8000b948 <ticks>
    800040a0:	439c                	lw	a5,0(a5)
    800040a2:	873e                	mv	a4,a5
    800040a4:	06400793          	li	a5,100
    800040a8:	02f777bb          	remuw	a5,a4,a5
    800040ac:	2781                	sext.w	a5,a5
    800040ae:	e789                	bnez	a5,800040b8 <clockintr+0x52>
  {
    updaterefhistory();
    800040b0:	ffffe097          	auipc	ra,0xffffe
    800040b4:	a12080e7          	jalr	-1518(ra) # 80001ac2 <updaterefhistory>
  }

  wakeup(&ticks);
    800040b8:	00008517          	auipc	a0,0x8
    800040bc:	89050513          	addi	a0,a0,-1904 # 8000b948 <ticks>
    800040c0:	fffff097          	auipc	ra,0xfffff
    800040c4:	618080e7          	jalr	1560(ra) # 800036d8 <wakeup>
  release(&tickslock);
    800040c8:	00026517          	auipc	a0,0x26
    800040cc:	92050513          	addi	a0,a0,-1760 # 800299e8 <tickslock>
    800040d0:	ffffd097          	auipc	ra,0xffffd
    800040d4:	2be080e7          	jalr	702(ra) # 8000138e <release>
}
    800040d8:	0001                	nop
    800040da:	60a2                	ld	ra,8(sp)
    800040dc:	6402                	ld	s0,0(sp)
    800040de:	0141                	addi	sp,sp,16
    800040e0:	8082                	ret

00000000800040e2 <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    800040e2:	1101                	addi	sp,sp,-32
    800040e4:	ec06                	sd	ra,24(sp)
    800040e6:	e822                	sd	s0,16(sp)
    800040e8:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    800040ea:	00000097          	auipc	ra,0x0
    800040ee:	ac4080e7          	jalr	-1340(ra) # 80003bae <r_scause>
    800040f2:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    800040f6:	fe843783          	ld	a5,-24(s0)
    800040fa:	0a07d263          	bgez	a5,8000419e <devintr+0xbc>
     (scause & 0xff) == 9){
    800040fe:	fe843783          	ld	a5,-24(s0)
    80004102:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    80004106:	47a5                	li	a5,9
    80004108:	08f71b63          	bne	a4,a5,8000419e <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    8000410c:	00005097          	auipc	ra,0x5
    80004110:	aa0080e7          	jalr	-1376(ra) # 80008bac <plic_claim>
    80004114:	87aa                	mv	a5,a0
    80004116:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    8000411a:	fe442783          	lw	a5,-28(s0)
    8000411e:	0007871b          	sext.w	a4,a5
    80004122:	47a9                	li	a5,10
    80004124:	00f71763          	bne	a4,a5,80004132 <devintr+0x50>
      uartintr();
    80004128:	ffffd097          	auipc	ra,0xffffd
    8000412c:	f06080e7          	jalr	-250(ra) # 8000102e <uartintr>
    80004130:	a891                	j	80004184 <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    80004132:	fe442783          	lw	a5,-28(s0)
    80004136:	0007871b          	sext.w	a4,a5
    8000413a:	4785                	li	a5,1
    8000413c:	00f71863          	bne	a4,a5,8000414c <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004140:	4501                	li	a0,0
    80004142:	00006097          	auipc	ra,0x6
    80004146:	c28080e7          	jalr	-984(ra) # 80009d6a <virtio_disk_intr>
    8000414a:	a82d                	j	80004184 <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    8000414c:	fe442783          	lw	a5,-28(s0)
    80004150:	0007871b          	sext.w	a4,a5
    80004154:	4789                	li	a5,2
    80004156:	00f71863          	bne	a4,a5,80004166 <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    8000415a:	4505                	li	a0,1
    8000415c:	00006097          	auipc	ra,0x6
    80004160:	c0e080e7          	jalr	-1010(ra) # 80009d6a <virtio_disk_intr>
    80004164:	a005                	j	80004184 <devintr+0xa2>
    } else if(irq){
    80004166:	fe442783          	lw	a5,-28(s0)
    8000416a:	2781                	sext.w	a5,a5
    8000416c:	cf81                	beqz	a5,80004184 <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    8000416e:	fe442783          	lw	a5,-28(s0)
    80004172:	85be                	mv	a1,a5
    80004174:	00007517          	auipc	a0,0x7
    80004178:	25c50513          	addi	a0,a0,604 # 8000b3d0 <etext+0x3d0>
    8000417c:	ffffd097          	auipc	ra,0xffffd
    80004180:	8ba080e7          	jalr	-1862(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    80004184:	fe442783          	lw	a5,-28(s0)
    80004188:	2781                	sext.w	a5,a5
    8000418a:	cb81                	beqz	a5,8000419a <devintr+0xb8>
      plic_complete(irq);
    8000418c:	fe442783          	lw	a5,-28(s0)
    80004190:	853e                	mv	a0,a5
    80004192:	00005097          	auipc	ra,0x5
    80004196:	a58080e7          	jalr	-1448(ra) # 80008bea <plic_complete>

    return 1;
    8000419a:	4785                	li	a5,1
    8000419c:	a081                	j	800041dc <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    8000419e:	fe843703          	ld	a4,-24(s0)
    800041a2:	57fd                	li	a5,-1
    800041a4:	17fe                	slli	a5,a5,0x3f
    800041a6:	0785                	addi	a5,a5,1
    800041a8:	02f71963          	bne	a4,a5,800041da <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    800041ac:	fffff097          	auipc	ra,0xfffff
    800041b0:	890080e7          	jalr	-1904(ra) # 80002a3c <cpuid>
    800041b4:	87aa                	mv	a5,a0
    800041b6:	e789                	bnez	a5,800041c0 <devintr+0xde>
      clockintr();
    800041b8:	00000097          	auipc	ra,0x0
    800041bc:	eae080e7          	jalr	-338(ra) # 80004066 <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800041c0:	00000097          	auipc	ra,0x0
    800041c4:	952080e7          	jalr	-1710(ra) # 80003b12 <r_sip>
    800041c8:	87aa                	mv	a5,a0
    800041ca:	9bf5                	andi	a5,a5,-3
    800041cc:	853e                	mv	a0,a5
    800041ce:	00000097          	auipc	ra,0x0
    800041d2:	95e080e7          	jalr	-1698(ra) # 80003b2c <w_sip>

    return 2;
    800041d6:	4789                	li	a5,2
    800041d8:	a011                	j	800041dc <devintr+0xfa>
  } else {
    return 0;
    800041da:	4781                	li	a5,0
  }
}
    800041dc:	853e                	mv	a0,a5
    800041de:	60e2                	ld	ra,24(sp)
    800041e0:	6442                	ld	s0,16(sp)
    800041e2:	6105                	addi	sp,sp,32
    800041e4:	8082                	ret

00000000800041e6 <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    800041e6:	7179                	addi	sp,sp,-48
    800041e8:	f406                	sd	ra,40(sp)
    800041ea:	f022                	sd	s0,32(sp)
    800041ec:	1800                	addi	s0,sp,48
    800041ee:	fca43c23          	sd	a0,-40(s0)
    800041f2:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800041f6:	fffff097          	auipc	ra,0xfffff
    800041fa:	8a4080e7          	jalr	-1884(ra) # 80002a9a <myproc>
    800041fe:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    80004202:	fe843783          	ld	a5,-24(s0)
    80004206:	67bc                	ld	a5,72(a5)
    80004208:	fd843703          	ld	a4,-40(s0)
    8000420c:	00f77b63          	bgeu	a4,a5,80004222 <fetchaddr+0x3c>
    80004210:	fd843783          	ld	a5,-40(s0)
    80004214:	00878713          	addi	a4,a5,8
    80004218:	fe843783          	ld	a5,-24(s0)
    8000421c:	67bc                	ld	a5,72(a5)
    8000421e:	00e7f463          	bgeu	a5,a4,80004226 <fetchaddr+0x40>
    return -1;
    80004222:	57fd                	li	a5,-1
    80004224:	a01d                	j	8000424a <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    80004226:	fe843783          	ld	a5,-24(s0)
    8000422a:	6bbc                	ld	a5,80(a5)
    8000422c:	46a1                	li	a3,8
    8000422e:	fd843603          	ld	a2,-40(s0)
    80004232:	fd043583          	ld	a1,-48(s0)
    80004236:	853e                	mv	a0,a5
    80004238:	ffffe097          	auipc	ra,0xffffe
    8000423c:	3fa080e7          	jalr	1018(ra) # 80002632 <copyin>
    80004240:	87aa                	mv	a5,a0
    80004242:	c399                	beqz	a5,80004248 <fetchaddr+0x62>
    return -1;
    80004244:	57fd                	li	a5,-1
    80004246:	a011                	j	8000424a <fetchaddr+0x64>
  return 0;
    80004248:	4781                	li	a5,0
}
    8000424a:	853e                	mv	a0,a5
    8000424c:	70a2                	ld	ra,40(sp)
    8000424e:	7402                	ld	s0,32(sp)
    80004250:	6145                	addi	sp,sp,48
    80004252:	8082                	ret

0000000080004254 <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    80004254:	7139                	addi	sp,sp,-64
    80004256:	fc06                	sd	ra,56(sp)
    80004258:	f822                	sd	s0,48(sp)
    8000425a:	0080                	addi	s0,sp,64
    8000425c:	fca43c23          	sd	a0,-40(s0)
    80004260:	fcb43823          	sd	a1,-48(s0)
    80004264:	87b2                	mv	a5,a2
    80004266:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    8000426a:	fffff097          	auipc	ra,0xfffff
    8000426e:	830080e7          	jalr	-2000(ra) # 80002a9a <myproc>
    80004272:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    80004276:	fe843783          	ld	a5,-24(s0)
    8000427a:	6bbc                	ld	a5,80(a5)
    8000427c:	fcc42703          	lw	a4,-52(s0)
    80004280:	86ba                	mv	a3,a4
    80004282:	fd843603          	ld	a2,-40(s0)
    80004286:	fd043583          	ld	a1,-48(s0)
    8000428a:	853e                	mv	a0,a5
    8000428c:	ffffe097          	auipc	ra,0xffffe
    80004290:	474080e7          	jalr	1140(ra) # 80002700 <copyinstr>
    80004294:	87aa                	mv	a5,a0
    80004296:	0007d463          	bgez	a5,8000429e <fetchstr+0x4a>
    return -1;
    8000429a:	57fd                	li	a5,-1
    8000429c:	a801                	j	800042ac <fetchstr+0x58>
  return strlen(buf);
    8000429e:	fd043503          	ld	a0,-48(s0)
    800042a2:	ffffd097          	auipc	ra,0xffffd
    800042a6:	5da080e7          	jalr	1498(ra) # 8000187c <strlen>
    800042aa:	87aa                	mv	a5,a0
}
    800042ac:	853e                	mv	a0,a5
    800042ae:	70e2                	ld	ra,56(sp)
    800042b0:	7442                	ld	s0,48(sp)
    800042b2:	6121                	addi	sp,sp,64
    800042b4:	8082                	ret

00000000800042b6 <argraw>:

static uint64
argraw(int n)
{
    800042b6:	7179                	addi	sp,sp,-48
    800042b8:	f406                	sd	ra,40(sp)
    800042ba:	f022                	sd	s0,32(sp)
    800042bc:	1800                	addi	s0,sp,48
    800042be:	87aa                	mv	a5,a0
    800042c0:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800042c4:	ffffe097          	auipc	ra,0xffffe
    800042c8:	7d6080e7          	jalr	2006(ra) # 80002a9a <myproc>
    800042cc:	fea43423          	sd	a0,-24(s0)
    800042d0:	fdc42783          	lw	a5,-36(s0)
    800042d4:	0007871b          	sext.w	a4,a5
    800042d8:	4795                	li	a5,5
    800042da:	06e7e263          	bltu	a5,a4,8000433e <argraw+0x88>
    800042de:	fdc46783          	lwu	a5,-36(s0)
    800042e2:	00279713          	slli	a4,a5,0x2
    800042e6:	00007797          	auipc	a5,0x7
    800042ea:	11278793          	addi	a5,a5,274 # 8000b3f8 <etext+0x3f8>
    800042ee:	97ba                	add	a5,a5,a4
    800042f0:	439c                	lw	a5,0(a5)
    800042f2:	0007871b          	sext.w	a4,a5
    800042f6:	00007797          	auipc	a5,0x7
    800042fa:	10278793          	addi	a5,a5,258 # 8000b3f8 <etext+0x3f8>
    800042fe:	97ba                	add	a5,a5,a4
    80004300:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    80004302:	fe843783          	ld	a5,-24(s0)
    80004306:	6fbc                	ld	a5,88(a5)
    80004308:	7bbc                	ld	a5,112(a5)
    8000430a:	a091                	j	8000434e <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    8000430c:	fe843783          	ld	a5,-24(s0)
    80004310:	6fbc                	ld	a5,88(a5)
    80004312:	7fbc                	ld	a5,120(a5)
    80004314:	a82d                	j	8000434e <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    80004316:	fe843783          	ld	a5,-24(s0)
    8000431a:	6fbc                	ld	a5,88(a5)
    8000431c:	63dc                	ld	a5,128(a5)
    8000431e:	a805                	j	8000434e <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004320:	fe843783          	ld	a5,-24(s0)
    80004324:	6fbc                	ld	a5,88(a5)
    80004326:	67dc                	ld	a5,136(a5)
    80004328:	a01d                	j	8000434e <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    8000432a:	fe843783          	ld	a5,-24(s0)
    8000432e:	6fbc                	ld	a5,88(a5)
    80004330:	6bdc                	ld	a5,144(a5)
    80004332:	a831                	j	8000434e <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    80004334:	fe843783          	ld	a5,-24(s0)
    80004338:	6fbc                	ld	a5,88(a5)
    8000433a:	6fdc                	ld	a5,152(a5)
    8000433c:	a809                	j	8000434e <argraw+0x98>
  }
  panic("argraw");
    8000433e:	00007517          	auipc	a0,0x7
    80004342:	0b250513          	addi	a0,a0,178 # 8000b3f0 <etext+0x3f0>
    80004346:	ffffd097          	auipc	ra,0xffffd
    8000434a:	946080e7          	jalr	-1722(ra) # 80000c8c <panic>
  return -1;
}
    8000434e:	853e                	mv	a0,a5
    80004350:	70a2                	ld	ra,40(sp)
    80004352:	7402                	ld	s0,32(sp)
    80004354:	6145                	addi	sp,sp,48
    80004356:	8082                	ret

0000000080004358 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
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
    80004374:	f46080e7          	jalr	-186(ra) # 800042b6 <argraw>
    80004378:	87aa                	mv	a5,a0
    8000437a:	0007871b          	sext.w	a4,a5
    8000437e:	fe043783          	ld	a5,-32(s0)
    80004382:	c398                	sw	a4,0(a5)
}
    80004384:	0001                	nop
    80004386:	60e2                	ld	ra,24(sp)
    80004388:	6442                	ld	s0,16(sp)
    8000438a:	6105                	addi	sp,sp,32
    8000438c:	8082                	ret

000000008000438e <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    8000438e:	1101                	addi	sp,sp,-32
    80004390:	ec06                	sd	ra,24(sp)
    80004392:	e822                	sd	s0,16(sp)
    80004394:	1000                	addi	s0,sp,32
    80004396:	87aa                	mv	a5,a0
    80004398:	feb43023          	sd	a1,-32(s0)
    8000439c:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    800043a0:	fec42783          	lw	a5,-20(s0)
    800043a4:	853e                	mv	a0,a5
    800043a6:	00000097          	auipc	ra,0x0
    800043aa:	f10080e7          	jalr	-240(ra) # 800042b6 <argraw>
    800043ae:	872a                	mv	a4,a0
    800043b0:	fe043783          	ld	a5,-32(s0)
    800043b4:	e398                	sd	a4,0(a5)
}
    800043b6:	0001                	nop
    800043b8:	60e2                	ld	ra,24(sp)
    800043ba:	6442                	ld	s0,16(sp)
    800043bc:	6105                	addi	sp,sp,32
    800043be:	8082                	ret

00000000800043c0 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800043c0:	7179                	addi	sp,sp,-48
    800043c2:	f406                	sd	ra,40(sp)
    800043c4:	f022                	sd	s0,32(sp)
    800043c6:	1800                	addi	s0,sp,48
    800043c8:	87aa                	mv	a5,a0
    800043ca:	fcb43823          	sd	a1,-48(s0)
    800043ce:	8732                	mv	a4,a2
    800043d0:	fcf42e23          	sw	a5,-36(s0)
    800043d4:	87ba                	mv	a5,a4
    800043d6:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    800043da:	fe840713          	addi	a4,s0,-24
    800043de:	fdc42783          	lw	a5,-36(s0)
    800043e2:	85ba                	mv	a1,a4
    800043e4:	853e                	mv	a0,a5
    800043e6:	00000097          	auipc	ra,0x0
    800043ea:	fa8080e7          	jalr	-88(ra) # 8000438e <argaddr>
  return fetchstr(addr, buf, max);
    800043ee:	fe843783          	ld	a5,-24(s0)
    800043f2:	fd842703          	lw	a4,-40(s0)
    800043f6:	863a                	mv	a2,a4
    800043f8:	fd043583          	ld	a1,-48(s0)
    800043fc:	853e                	mv	a0,a5
    800043fe:	00000097          	auipc	ra,0x0
    80004402:	e56080e7          	jalr	-426(ra) # 80004254 <fetchstr>
    80004406:	87aa                	mv	a5,a0
}
    80004408:	853e                	mv	a0,a5
    8000440a:	70a2                	ld	ra,40(sp)
    8000440c:	7402                	ld	s0,32(sp)
    8000440e:	6145                	addi	sp,sp,48
    80004410:	8082                	ret

0000000080004412 <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    80004412:	7179                	addi	sp,sp,-48
    80004414:	f406                	sd	ra,40(sp)
    80004416:	f022                	sd	s0,32(sp)
    80004418:	ec26                	sd	s1,24(sp)
    8000441a:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    8000441c:	ffffe097          	auipc	ra,0xffffe
    80004420:	67e080e7          	jalr	1662(ra) # 80002a9a <myproc>
    80004424:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004428:	fd843783          	ld	a5,-40(s0)
    8000442c:	6fbc                	ld	a5,88(a5)
    8000442e:	77dc                	ld	a5,168(a5)
    80004430:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    80004434:	fd442783          	lw	a5,-44(s0)
    80004438:	2781                	sext.w	a5,a5
    8000443a:	04f05263          	blez	a5,8000447e <syscall+0x6c>
    8000443e:	fd442783          	lw	a5,-44(s0)
    80004442:	873e                	mv	a4,a5
    80004444:	47d5                	li	a5,21
    80004446:	02e7ec63          	bltu	a5,a4,8000447e <syscall+0x6c>
    8000444a:	00007717          	auipc	a4,0x7
    8000444e:	40670713          	addi	a4,a4,1030 # 8000b850 <syscalls>
    80004452:	fd442783          	lw	a5,-44(s0)
    80004456:	078e                	slli	a5,a5,0x3
    80004458:	97ba                	add	a5,a5,a4
    8000445a:	639c                	ld	a5,0(a5)
    8000445c:	c38d                	beqz	a5,8000447e <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    8000445e:	00007717          	auipc	a4,0x7
    80004462:	3f270713          	addi	a4,a4,1010 # 8000b850 <syscalls>
    80004466:	fd442783          	lw	a5,-44(s0)
    8000446a:	078e                	slli	a5,a5,0x3
    8000446c:	97ba                	add	a5,a5,a4
    8000446e:	6398                	ld	a4,0(a5)
    80004470:	fd843783          	ld	a5,-40(s0)
    80004474:	6fa4                	ld	s1,88(a5)
    80004476:	9702                	jalr	a4
    80004478:	87aa                	mv	a5,a0
    8000447a:	f8bc                	sd	a5,112(s1)
    8000447c:	a815                	j	800044b0 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    8000447e:	fd843783          	ld	a5,-40(s0)
    80004482:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    80004484:	fd843783          	ld	a5,-40(s0)
    80004488:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    8000448c:	fd442683          	lw	a3,-44(s0)
    80004490:	863e                	mv	a2,a5
    80004492:	85ba                	mv	a1,a4
    80004494:	00007517          	auipc	a0,0x7
    80004498:	f7c50513          	addi	a0,a0,-132 # 8000b410 <etext+0x410>
    8000449c:	ffffc097          	auipc	ra,0xffffc
    800044a0:	59a080e7          	jalr	1434(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    800044a4:	fd843783          	ld	a5,-40(s0)
    800044a8:	6fbc                	ld	a5,88(a5)
    800044aa:	577d                	li	a4,-1
    800044ac:	fbb8                	sd	a4,112(a5)
  }
}
    800044ae:	0001                	nop
    800044b0:	0001                	nop
    800044b2:	70a2                	ld	ra,40(sp)
    800044b4:	7402                	ld	s0,32(sp)
    800044b6:	64e2                	ld	s1,24(sp)
    800044b8:	6145                	addi	sp,sp,48
    800044ba:	8082                	ret

00000000800044bc <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800044bc:	1101                	addi	sp,sp,-32
    800044be:	ec06                	sd	ra,24(sp)
    800044c0:	e822                	sd	s0,16(sp)
    800044c2:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    800044c4:	fec40793          	addi	a5,s0,-20
    800044c8:	85be                	mv	a1,a5
    800044ca:	4501                	li	a0,0
    800044cc:	00000097          	auipc	ra,0x0
    800044d0:	e8c080e7          	jalr	-372(ra) # 80004358 <argint>
  exit(n);
    800044d4:	fec42783          	lw	a5,-20(s0)
    800044d8:	853e                	mv	a0,a5
    800044da:	fffff097          	auipc	ra,0xfffff
    800044de:	cb2080e7          	jalr	-846(ra) # 8000318c <exit>
  return 0;  // not reached
    800044e2:	4781                	li	a5,0
}
    800044e4:	853e                	mv	a0,a5
    800044e6:	60e2                	ld	ra,24(sp)
    800044e8:	6442                	ld	s0,16(sp)
    800044ea:	6105                	addi	sp,sp,32
    800044ec:	8082                	ret

00000000800044ee <sys_getpid>:

uint64
sys_getpid(void)
{
    800044ee:	1141                	addi	sp,sp,-16
    800044f0:	e406                	sd	ra,8(sp)
    800044f2:	e022                	sd	s0,0(sp)
    800044f4:	0800                	addi	s0,sp,16
  return myproc()->pid;
    800044f6:	ffffe097          	auipc	ra,0xffffe
    800044fa:	5a4080e7          	jalr	1444(ra) # 80002a9a <myproc>
    800044fe:	87aa                	mv	a5,a0
    80004500:	5b9c                	lw	a5,48(a5)
}
    80004502:	853e                	mv	a0,a5
    80004504:	60a2                	ld	ra,8(sp)
    80004506:	6402                	ld	s0,0(sp)
    80004508:	0141                	addi	sp,sp,16
    8000450a:	8082                	ret

000000008000450c <sys_fork>:

uint64
sys_fork(void)
{
    8000450c:	1141                	addi	sp,sp,-16
    8000450e:	e406                	sd	ra,8(sp)
    80004510:	e022                	sd	s0,0(sp)
    80004512:	0800                	addi	s0,sp,16
  return fork();
    80004514:	fffff097          	auipc	ra,0xfffff
    80004518:	a56080e7          	jalr	-1450(ra) # 80002f6a <fork>
    8000451c:	87aa                	mv	a5,a0
}
    8000451e:	853e                	mv	a0,a5
    80004520:	60a2                	ld	ra,8(sp)
    80004522:	6402                	ld	s0,0(sp)
    80004524:	0141                	addi	sp,sp,16
    80004526:	8082                	ret

0000000080004528 <sys_wait>:

uint64
sys_wait(void)
{
    80004528:	1101                	addi	sp,sp,-32
    8000452a:	ec06                	sd	ra,24(sp)
    8000452c:	e822                	sd	s0,16(sp)
    8000452e:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    80004530:	fe840793          	addi	a5,s0,-24
    80004534:	85be                	mv	a1,a5
    80004536:	4501                	li	a0,0
    80004538:	00000097          	auipc	ra,0x0
    8000453c:	e56080e7          	jalr	-426(ra) # 8000438e <argaddr>
  return wait(p);
    80004540:	fe843783          	ld	a5,-24(s0)
    80004544:	853e                	mv	a0,a5
    80004546:	fffff097          	auipc	ra,0xfffff
    8000454a:	d82080e7          	jalr	-638(ra) # 800032c8 <wait>
    8000454e:	87aa                	mv	a5,a0
}
    80004550:	853e                	mv	a0,a5
    80004552:	60e2                	ld	ra,24(sp)
    80004554:	6442                	ld	s0,16(sp)
    80004556:	6105                	addi	sp,sp,32
    80004558:	8082                	ret

000000008000455a <sys_sbrk>:

uint64
sys_sbrk(void)
{
    8000455a:	1101                	addi	sp,sp,-32
    8000455c:	ec06                	sd	ra,24(sp)
    8000455e:	e822                	sd	s0,16(sp)
    80004560:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    80004562:	fe440793          	addi	a5,s0,-28
    80004566:	85be                	mv	a1,a5
    80004568:	4501                	li	a0,0
    8000456a:	00000097          	auipc	ra,0x0
    8000456e:	dee080e7          	jalr	-530(ra) # 80004358 <argint>
  addr = myproc()->sz;
    80004572:	ffffe097          	auipc	ra,0xffffe
    80004576:	528080e7          	jalr	1320(ra) # 80002a9a <myproc>
    8000457a:	87aa                	mv	a5,a0
    8000457c:	67bc                	ld	a5,72(a5)
    8000457e:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    80004582:	fe442783          	lw	a5,-28(s0)
    80004586:	853e                	mv	a0,a5
    80004588:	fffff097          	auipc	ra,0xfffff
    8000458c:	942080e7          	jalr	-1726(ra) # 80002eca <growproc>
    80004590:	87aa                	mv	a5,a0
    80004592:	0007d463          	bgez	a5,8000459a <sys_sbrk+0x40>
    return -1;
    80004596:	57fd                	li	a5,-1
    80004598:	a019                	j	8000459e <sys_sbrk+0x44>
  return addr;
    8000459a:	fe843783          	ld	a5,-24(s0)
}
    8000459e:	853e                	mv	a0,a5
    800045a0:	60e2                	ld	ra,24(sp)
    800045a2:	6442                	ld	s0,16(sp)
    800045a4:	6105                	addi	sp,sp,32
    800045a6:	8082                	ret

00000000800045a8 <sys_sleep>:

uint64
sys_sleep(void)
{
    800045a8:	1101                	addi	sp,sp,-32
    800045aa:	ec06                	sd	ra,24(sp)
    800045ac:	e822                	sd	s0,16(sp)
    800045ae:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    800045b0:	fe840793          	addi	a5,s0,-24
    800045b4:	85be                	mv	a1,a5
    800045b6:	4501                	li	a0,0
    800045b8:	00000097          	auipc	ra,0x0
    800045bc:	da0080e7          	jalr	-608(ra) # 80004358 <argint>
  acquire(&tickslock);
    800045c0:	00025517          	auipc	a0,0x25
    800045c4:	42850513          	addi	a0,a0,1064 # 800299e8 <tickslock>
    800045c8:	ffffd097          	auipc	ra,0xffffd
    800045cc:	d62080e7          	jalr	-670(ra) # 8000132a <acquire>
  ticks0 = ticks;
    800045d0:	00007797          	auipc	a5,0x7
    800045d4:	37878793          	addi	a5,a5,888 # 8000b948 <ticks>
    800045d8:	439c                	lw	a5,0(a5)
    800045da:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    800045de:	a099                	j	80004624 <sys_sleep+0x7c>
    if(killed(myproc())){
    800045e0:	ffffe097          	auipc	ra,0xffffe
    800045e4:	4ba080e7          	jalr	1210(ra) # 80002a9a <myproc>
    800045e8:	87aa                	mv	a5,a0
    800045ea:	853e                	mv	a0,a5
    800045ec:	fffff097          	auipc	ra,0xfffff
    800045f0:	27e080e7          	jalr	638(ra) # 8000386a <killed>
    800045f4:	87aa                	mv	a5,a0
    800045f6:	cb99                	beqz	a5,8000460c <sys_sleep+0x64>
      release(&tickslock);
    800045f8:	00025517          	auipc	a0,0x25
    800045fc:	3f050513          	addi	a0,a0,1008 # 800299e8 <tickslock>
    80004600:	ffffd097          	auipc	ra,0xffffd
    80004604:	d8e080e7          	jalr	-626(ra) # 8000138e <release>
      return -1;
    80004608:	57fd                	li	a5,-1
    8000460a:	a0b1                	j	80004656 <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    8000460c:	00025597          	auipc	a1,0x25
    80004610:	3dc58593          	addi	a1,a1,988 # 800299e8 <tickslock>
    80004614:	00007517          	auipc	a0,0x7
    80004618:	33450513          	addi	a0,a0,820 # 8000b948 <ticks>
    8000461c:	fffff097          	auipc	ra,0xfffff
    80004620:	040080e7          	jalr	64(ra) # 8000365c <sleep>
  while(ticks - ticks0 < n){
    80004624:	00007797          	auipc	a5,0x7
    80004628:	32478793          	addi	a5,a5,804 # 8000b948 <ticks>
    8000462c:	4398                	lw	a4,0(a5)
    8000462e:	fec42783          	lw	a5,-20(s0)
    80004632:	40f707bb          	subw	a5,a4,a5
    80004636:	0007871b          	sext.w	a4,a5
    8000463a:	fe842783          	lw	a5,-24(s0)
    8000463e:	2781                	sext.w	a5,a5
    80004640:	faf760e3          	bltu	a4,a5,800045e0 <sys_sleep+0x38>
  }
  release(&tickslock);
    80004644:	00025517          	auipc	a0,0x25
    80004648:	3a450513          	addi	a0,a0,932 # 800299e8 <tickslock>
    8000464c:	ffffd097          	auipc	ra,0xffffd
    80004650:	d42080e7          	jalr	-702(ra) # 8000138e <release>
  return 0;
    80004654:	4781                	li	a5,0
}
    80004656:	853e                	mv	a0,a5
    80004658:	60e2                	ld	ra,24(sp)
    8000465a:	6442                	ld	s0,16(sp)
    8000465c:	6105                	addi	sp,sp,32
    8000465e:	8082                	ret

0000000080004660 <sys_kill>:

uint64
sys_kill(void)
{
    80004660:	1101                	addi	sp,sp,-32
    80004662:	ec06                	sd	ra,24(sp)
    80004664:	e822                	sd	s0,16(sp)
    80004666:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    80004668:	fec40793          	addi	a5,s0,-20
    8000466c:	85be                	mv	a1,a5
    8000466e:	4501                	li	a0,0
    80004670:	00000097          	auipc	ra,0x0
    80004674:	ce8080e7          	jalr	-792(ra) # 80004358 <argint>
  return kill(pid);
    80004678:	fec42783          	lw	a5,-20(s0)
    8000467c:	853e                	mv	a0,a5
    8000467e:	fffff097          	auipc	ra,0xfffff
    80004682:	112080e7          	jalr	274(ra) # 80003790 <kill>
    80004686:	87aa                	mv	a5,a0
}
    80004688:	853e                	mv	a0,a5
    8000468a:	60e2                	ld	ra,24(sp)
    8000468c:	6442                	ld	s0,16(sp)
    8000468e:	6105                	addi	sp,sp,32
    80004690:	8082                	ret

0000000080004692 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    80004692:	1101                	addi	sp,sp,-32
    80004694:	ec06                	sd	ra,24(sp)
    80004696:	e822                	sd	s0,16(sp)
    80004698:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    8000469a:	00025517          	auipc	a0,0x25
    8000469e:	34e50513          	addi	a0,a0,846 # 800299e8 <tickslock>
    800046a2:	ffffd097          	auipc	ra,0xffffd
    800046a6:	c88080e7          	jalr	-888(ra) # 8000132a <acquire>
  xticks = ticks;
    800046aa:	00007797          	auipc	a5,0x7
    800046ae:	29e78793          	addi	a5,a5,670 # 8000b948 <ticks>
    800046b2:	439c                	lw	a5,0(a5)
    800046b4:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    800046b8:	00025517          	auipc	a0,0x25
    800046bc:	33050513          	addi	a0,a0,816 # 800299e8 <tickslock>
    800046c0:	ffffd097          	auipc	ra,0xffffd
    800046c4:	cce080e7          	jalr	-818(ra) # 8000138e <release>
  return xticks;
    800046c8:	fec46783          	lwu	a5,-20(s0)
}
    800046cc:	853e                	mv	a0,a5
    800046ce:	60e2                	ld	ra,24(sp)
    800046d0:	6442                	ld	s0,16(sp)
    800046d2:	6105                	addi	sp,sp,32
    800046d4:	8082                	ret

00000000800046d6 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800046d6:	1101                	addi	sp,sp,-32
    800046d8:	ec06                	sd	ra,24(sp)
    800046da:	e822                	sd	s0,16(sp)
    800046dc:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800046de:	00007597          	auipc	a1,0x7
    800046e2:	d5258593          	addi	a1,a1,-686 # 8000b430 <etext+0x430>
    800046e6:	00025517          	auipc	a0,0x25
    800046ea:	31a50513          	addi	a0,a0,794 # 80029a00 <bcache>
    800046ee:	ffffd097          	auipc	ra,0xffffd
    800046f2:	c0c080e7          	jalr	-1012(ra) # 800012fa <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800046f6:	00025717          	auipc	a4,0x25
    800046fa:	30a70713          	addi	a4,a4,778 # 80029a00 <bcache>
    800046fe:	67a1                	lui	a5,0x8
    80004700:	97ba                	add	a5,a5,a4
    80004702:	0002d717          	auipc	a4,0x2d
    80004706:	56670713          	addi	a4,a4,1382 # 80031c68 <bcache+0x8268>
    8000470a:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    8000470e:	00025717          	auipc	a4,0x25
    80004712:	2f270713          	addi	a4,a4,754 # 80029a00 <bcache>
    80004716:	67a1                	lui	a5,0x8
    80004718:	97ba                	add	a5,a5,a4
    8000471a:	0002d717          	auipc	a4,0x2d
    8000471e:	54e70713          	addi	a4,a4,1358 # 80031c68 <bcache+0x8268>
    80004722:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004726:	00025797          	auipc	a5,0x25
    8000472a:	2f278793          	addi	a5,a5,754 # 80029a18 <bcache+0x18>
    8000472e:	fef43423          	sd	a5,-24(s0)
    80004732:	a895                	j	800047a6 <binit+0xd0>
    b->next = bcache.head.next;
    80004734:	00025717          	auipc	a4,0x25
    80004738:	2cc70713          	addi	a4,a4,716 # 80029a00 <bcache>
    8000473c:	67a1                	lui	a5,0x8
    8000473e:	97ba                	add	a5,a5,a4
    80004740:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004744:	fe843783          	ld	a5,-24(s0)
    80004748:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    8000474a:	fe843783          	ld	a5,-24(s0)
    8000474e:	0002d717          	auipc	a4,0x2d
    80004752:	51a70713          	addi	a4,a4,1306 # 80031c68 <bcache+0x8268>
    80004756:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004758:	fe843783          	ld	a5,-24(s0)
    8000475c:	07c1                	addi	a5,a5,16
    8000475e:	00007597          	auipc	a1,0x7
    80004762:	cda58593          	addi	a1,a1,-806 # 8000b438 <etext+0x438>
    80004766:	853e                	mv	a0,a5
    80004768:	00002097          	auipc	ra,0x2
    8000476c:	034080e7          	jalr	52(ra) # 8000679c <initsleeplock>
    bcache.head.next->prev = b;
    80004770:	00025717          	auipc	a4,0x25
    80004774:	29070713          	addi	a4,a4,656 # 80029a00 <bcache>
    80004778:	67a1                	lui	a5,0x8
    8000477a:	97ba                	add	a5,a5,a4
    8000477c:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004780:	fe843703          	ld	a4,-24(s0)
    80004784:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004786:	00025717          	auipc	a4,0x25
    8000478a:	27a70713          	addi	a4,a4,634 # 80029a00 <bcache>
    8000478e:	67a1                	lui	a5,0x8
    80004790:	97ba                	add	a5,a5,a4
    80004792:	fe843703          	ld	a4,-24(s0)
    80004796:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000479a:	fe843783          	ld	a5,-24(s0)
    8000479e:	45878793          	addi	a5,a5,1112
    800047a2:	fef43423          	sd	a5,-24(s0)
    800047a6:	0002d797          	auipc	a5,0x2d
    800047aa:	4c278793          	addi	a5,a5,1218 # 80031c68 <bcache+0x8268>
    800047ae:	fe843703          	ld	a4,-24(s0)
    800047b2:	f8f761e3          	bltu	a4,a5,80004734 <binit+0x5e>
  }
}
    800047b6:	0001                	nop
    800047b8:	0001                	nop
    800047ba:	60e2                	ld	ra,24(sp)
    800047bc:	6442                	ld	s0,16(sp)
    800047be:	6105                	addi	sp,sp,32
    800047c0:	8082                	ret

00000000800047c2 <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800047c2:	7179                	addi	sp,sp,-48
    800047c4:	f406                	sd	ra,40(sp)
    800047c6:	f022                	sd	s0,32(sp)
    800047c8:	1800                	addi	s0,sp,48
    800047ca:	87aa                	mv	a5,a0
    800047cc:	872e                	mv	a4,a1
    800047ce:	fcf42e23          	sw	a5,-36(s0)
    800047d2:	87ba                	mv	a5,a4
    800047d4:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    800047d8:	00025517          	auipc	a0,0x25
    800047dc:	22850513          	addi	a0,a0,552 # 80029a00 <bcache>
    800047e0:	ffffd097          	auipc	ra,0xffffd
    800047e4:	b4a080e7          	jalr	-1206(ra) # 8000132a <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800047e8:	00025717          	auipc	a4,0x25
    800047ec:	21870713          	addi	a4,a4,536 # 80029a00 <bcache>
    800047f0:	67a1                	lui	a5,0x8
    800047f2:	97ba                	add	a5,a5,a4
    800047f4:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800047f8:	fef43423          	sd	a5,-24(s0)
    800047fc:	a095                	j	80004860 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800047fe:	fe843783          	ld	a5,-24(s0)
    80004802:	4798                	lw	a4,8(a5)
    80004804:	fdc42783          	lw	a5,-36(s0)
    80004808:	2781                	sext.w	a5,a5
    8000480a:	04e79663          	bne	a5,a4,80004856 <bget+0x94>
    8000480e:	fe843783          	ld	a5,-24(s0)
    80004812:	47d8                	lw	a4,12(a5)
    80004814:	fd842783          	lw	a5,-40(s0)
    80004818:	2781                	sext.w	a5,a5
    8000481a:	02e79e63          	bne	a5,a4,80004856 <bget+0x94>
      b->refcnt++;
    8000481e:	fe843783          	ld	a5,-24(s0)
    80004822:	43bc                	lw	a5,64(a5)
    80004824:	2785                	addiw	a5,a5,1
    80004826:	0007871b          	sext.w	a4,a5
    8000482a:	fe843783          	ld	a5,-24(s0)
    8000482e:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004830:	00025517          	auipc	a0,0x25
    80004834:	1d050513          	addi	a0,a0,464 # 80029a00 <bcache>
    80004838:	ffffd097          	auipc	ra,0xffffd
    8000483c:	b56080e7          	jalr	-1194(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    80004840:	fe843783          	ld	a5,-24(s0)
    80004844:	07c1                	addi	a5,a5,16
    80004846:	853e                	mv	a0,a5
    80004848:	00002097          	auipc	ra,0x2
    8000484c:	fa0080e7          	jalr	-96(ra) # 800067e8 <acquiresleep>
      return b;
    80004850:	fe843783          	ld	a5,-24(s0)
    80004854:	a07d                	j	80004902 <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    80004856:	fe843783          	ld	a5,-24(s0)
    8000485a:	6bbc                	ld	a5,80(a5)
    8000485c:	fef43423          	sd	a5,-24(s0)
    80004860:	fe843703          	ld	a4,-24(s0)
    80004864:	0002d797          	auipc	a5,0x2d
    80004868:	40478793          	addi	a5,a5,1028 # 80031c68 <bcache+0x8268>
    8000486c:	f8f719e3          	bne	a4,a5,800047fe <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004870:	00025717          	auipc	a4,0x25
    80004874:	19070713          	addi	a4,a4,400 # 80029a00 <bcache>
    80004878:	67a1                	lui	a5,0x8
    8000487a:	97ba                	add	a5,a5,a4
    8000487c:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004880:	fef43423          	sd	a5,-24(s0)
    80004884:	a8b9                	j	800048e2 <bget+0x120>
    if(b->refcnt == 0) {
    80004886:	fe843783          	ld	a5,-24(s0)
    8000488a:	43bc                	lw	a5,64(a5)
    8000488c:	e7b1                	bnez	a5,800048d8 <bget+0x116>
      b->dev = dev;
    8000488e:	fe843783          	ld	a5,-24(s0)
    80004892:	fdc42703          	lw	a4,-36(s0)
    80004896:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004898:	fe843783          	ld	a5,-24(s0)
    8000489c:	fd842703          	lw	a4,-40(s0)
    800048a0:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    800048a2:	fe843783          	ld	a5,-24(s0)
    800048a6:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    800048aa:	fe843783          	ld	a5,-24(s0)
    800048ae:	4705                	li	a4,1
    800048b0:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    800048b2:	00025517          	auipc	a0,0x25
    800048b6:	14e50513          	addi	a0,a0,334 # 80029a00 <bcache>
    800048ba:	ffffd097          	auipc	ra,0xffffd
    800048be:	ad4080e7          	jalr	-1324(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    800048c2:	fe843783          	ld	a5,-24(s0)
    800048c6:	07c1                	addi	a5,a5,16
    800048c8:	853e                	mv	a0,a5
    800048ca:	00002097          	auipc	ra,0x2
    800048ce:	f1e080e7          	jalr	-226(ra) # 800067e8 <acquiresleep>
      return b;
    800048d2:	fe843783          	ld	a5,-24(s0)
    800048d6:	a035                	j	80004902 <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800048d8:	fe843783          	ld	a5,-24(s0)
    800048dc:	67bc                	ld	a5,72(a5)
    800048de:	fef43423          	sd	a5,-24(s0)
    800048e2:	fe843703          	ld	a4,-24(s0)
    800048e6:	0002d797          	auipc	a5,0x2d
    800048ea:	38278793          	addi	a5,a5,898 # 80031c68 <bcache+0x8268>
    800048ee:	f8f71ce3          	bne	a4,a5,80004886 <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800048f2:	00007517          	auipc	a0,0x7
    800048f6:	b4e50513          	addi	a0,a0,-1202 # 8000b440 <etext+0x440>
    800048fa:	ffffc097          	auipc	ra,0xffffc
    800048fe:	392080e7          	jalr	914(ra) # 80000c8c <panic>
}
    80004902:	853e                	mv	a0,a5
    80004904:	70a2                	ld	ra,40(sp)
    80004906:	7402                	ld	s0,32(sp)
    80004908:	6145                	addi	sp,sp,48
    8000490a:	8082                	ret

000000008000490c <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    8000490c:	7179                	addi	sp,sp,-48
    8000490e:	f406                	sd	ra,40(sp)
    80004910:	f022                	sd	s0,32(sp)
    80004912:	1800                	addi	s0,sp,48
    80004914:	87aa                	mv	a5,a0
    80004916:	872e                	mv	a4,a1
    80004918:	fcf42e23          	sw	a5,-36(s0)
    8000491c:	87ba                	mv	a5,a4
    8000491e:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004922:	fd842703          	lw	a4,-40(s0)
    80004926:	fdc42783          	lw	a5,-36(s0)
    8000492a:	85ba                	mv	a1,a4
    8000492c:	853e                	mv	a0,a5
    8000492e:	00000097          	auipc	ra,0x0
    80004932:	e94080e7          	jalr	-364(ra) # 800047c2 <bget>
    80004936:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    8000493a:	fe843783          	ld	a5,-24(s0)
    8000493e:	439c                	lw	a5,0(a5)
    80004940:	ef91                	bnez	a5,8000495c <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    80004942:	4681                	li	a3,0
    80004944:	4601                	li	a2,0
    80004946:	fe843583          	ld	a1,-24(s0)
    8000494a:	4501                	li	a0,0
    8000494c:	00005097          	auipc	ra,0x5
    80004950:	d16080e7          	jalr	-746(ra) # 80009662 <virtio_disk_rw>
    b->valid = 1;
    80004954:	fe843783          	ld	a5,-24(s0)
    80004958:	4705                	li	a4,1
    8000495a:	c398                	sw	a4,0(a5)
  }
  return b;
    8000495c:	fe843783          	ld	a5,-24(s0)
}
    80004960:	853e                	mv	a0,a5
    80004962:	70a2                	ld	ra,40(sp)
    80004964:	7402                	ld	s0,32(sp)
    80004966:	6145                	addi	sp,sp,48
    80004968:	8082                	ret

000000008000496a <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    8000496a:	1101                	addi	sp,sp,-32
    8000496c:	ec06                	sd	ra,24(sp)
    8000496e:	e822                	sd	s0,16(sp)
    80004970:	1000                	addi	s0,sp,32
    80004972:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004976:	fe843783          	ld	a5,-24(s0)
    8000497a:	07c1                	addi	a5,a5,16
    8000497c:	853e                	mv	a0,a5
    8000497e:	00002097          	auipc	ra,0x2
    80004982:	f2a080e7          	jalr	-214(ra) # 800068a8 <holdingsleep>
    80004986:	87aa                	mv	a5,a0
    80004988:	eb89                	bnez	a5,8000499a <bwrite+0x30>
    panic("bwrite");
    8000498a:	00007517          	auipc	a0,0x7
    8000498e:	ace50513          	addi	a0,a0,-1330 # 8000b458 <etext+0x458>
    80004992:	ffffc097          	auipc	ra,0xffffc
    80004996:	2fa080e7          	jalr	762(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    8000499a:	4681                	li	a3,0
    8000499c:	4605                	li	a2,1
    8000499e:	fe843583          	ld	a1,-24(s0)
    800049a2:	4501                	li	a0,0
    800049a4:	00005097          	auipc	ra,0x5
    800049a8:	cbe080e7          	jalr	-834(ra) # 80009662 <virtio_disk_rw>
}
    800049ac:	0001                	nop
    800049ae:	60e2                	ld	ra,24(sp)
    800049b0:	6442                	ld	s0,16(sp)
    800049b2:	6105                	addi	sp,sp,32
    800049b4:	8082                	ret

00000000800049b6 <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    800049b6:	1101                	addi	sp,sp,-32
    800049b8:	ec06                	sd	ra,24(sp)
    800049ba:	e822                	sd	s0,16(sp)
    800049bc:	1000                	addi	s0,sp,32
    800049be:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    800049c2:	fe843783          	ld	a5,-24(s0)
    800049c6:	07c1                	addi	a5,a5,16
    800049c8:	853e                	mv	a0,a5
    800049ca:	00002097          	auipc	ra,0x2
    800049ce:	ede080e7          	jalr	-290(ra) # 800068a8 <holdingsleep>
    800049d2:	87aa                	mv	a5,a0
    800049d4:	eb89                	bnez	a5,800049e6 <brelse+0x30>
    panic("brelse");
    800049d6:	00007517          	auipc	a0,0x7
    800049da:	a8a50513          	addi	a0,a0,-1398 # 8000b460 <etext+0x460>
    800049de:	ffffc097          	auipc	ra,0xffffc
    800049e2:	2ae080e7          	jalr	686(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    800049e6:	fe843783          	ld	a5,-24(s0)
    800049ea:	07c1                	addi	a5,a5,16
    800049ec:	853e                	mv	a0,a5
    800049ee:	00002097          	auipc	ra,0x2
    800049f2:	e68080e7          	jalr	-408(ra) # 80006856 <releasesleep>

  acquire(&bcache.lock);
    800049f6:	00025517          	auipc	a0,0x25
    800049fa:	00a50513          	addi	a0,a0,10 # 80029a00 <bcache>
    800049fe:	ffffd097          	auipc	ra,0xffffd
    80004a02:	92c080e7          	jalr	-1748(ra) # 8000132a <acquire>
  b->refcnt--;
    80004a06:	fe843783          	ld	a5,-24(s0)
    80004a0a:	43bc                	lw	a5,64(a5)
    80004a0c:	37fd                	addiw	a5,a5,-1
    80004a0e:	0007871b          	sext.w	a4,a5
    80004a12:	fe843783          	ld	a5,-24(s0)
    80004a16:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004a18:	fe843783          	ld	a5,-24(s0)
    80004a1c:	43bc                	lw	a5,64(a5)
    80004a1e:	e7b5                	bnez	a5,80004a8a <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004a20:	fe843783          	ld	a5,-24(s0)
    80004a24:	6bbc                	ld	a5,80(a5)
    80004a26:	fe843703          	ld	a4,-24(s0)
    80004a2a:	6738                	ld	a4,72(a4)
    80004a2c:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004a2e:	fe843783          	ld	a5,-24(s0)
    80004a32:	67bc                	ld	a5,72(a5)
    80004a34:	fe843703          	ld	a4,-24(s0)
    80004a38:	6b38                	ld	a4,80(a4)
    80004a3a:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004a3c:	00025717          	auipc	a4,0x25
    80004a40:	fc470713          	addi	a4,a4,-60 # 80029a00 <bcache>
    80004a44:	67a1                	lui	a5,0x8
    80004a46:	97ba                	add	a5,a5,a4
    80004a48:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a4c:	fe843783          	ld	a5,-24(s0)
    80004a50:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004a52:	fe843783          	ld	a5,-24(s0)
    80004a56:	0002d717          	auipc	a4,0x2d
    80004a5a:	21270713          	addi	a4,a4,530 # 80031c68 <bcache+0x8268>
    80004a5e:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004a60:	00025717          	auipc	a4,0x25
    80004a64:	fa070713          	addi	a4,a4,-96 # 80029a00 <bcache>
    80004a68:	67a1                	lui	a5,0x8
    80004a6a:	97ba                	add	a5,a5,a4
    80004a6c:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004a70:	fe843703          	ld	a4,-24(s0)
    80004a74:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004a76:	00025717          	auipc	a4,0x25
    80004a7a:	f8a70713          	addi	a4,a4,-118 # 80029a00 <bcache>
    80004a7e:	67a1                	lui	a5,0x8
    80004a80:	97ba                	add	a5,a5,a4
    80004a82:	fe843703          	ld	a4,-24(s0)
    80004a86:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004a8a:	00025517          	auipc	a0,0x25
    80004a8e:	f7650513          	addi	a0,a0,-138 # 80029a00 <bcache>
    80004a92:	ffffd097          	auipc	ra,0xffffd
    80004a96:	8fc080e7          	jalr	-1796(ra) # 8000138e <release>
}
    80004a9a:	0001                	nop
    80004a9c:	60e2                	ld	ra,24(sp)
    80004a9e:	6442                	ld	s0,16(sp)
    80004aa0:	6105                	addi	sp,sp,32
    80004aa2:	8082                	ret

0000000080004aa4 <bpin>:

void
bpin(struct buf *b) {
    80004aa4:	1101                	addi	sp,sp,-32
    80004aa6:	ec06                	sd	ra,24(sp)
    80004aa8:	e822                	sd	s0,16(sp)
    80004aaa:	1000                	addi	s0,sp,32
    80004aac:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004ab0:	00025517          	auipc	a0,0x25
    80004ab4:	f5050513          	addi	a0,a0,-176 # 80029a00 <bcache>
    80004ab8:	ffffd097          	auipc	ra,0xffffd
    80004abc:	872080e7          	jalr	-1934(ra) # 8000132a <acquire>
  b->refcnt++;
    80004ac0:	fe843783          	ld	a5,-24(s0)
    80004ac4:	43bc                	lw	a5,64(a5)
    80004ac6:	2785                	addiw	a5,a5,1
    80004ac8:	0007871b          	sext.w	a4,a5
    80004acc:	fe843783          	ld	a5,-24(s0)
    80004ad0:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004ad2:	00025517          	auipc	a0,0x25
    80004ad6:	f2e50513          	addi	a0,a0,-210 # 80029a00 <bcache>
    80004ada:	ffffd097          	auipc	ra,0xffffd
    80004ade:	8b4080e7          	jalr	-1868(ra) # 8000138e <release>
}
    80004ae2:	0001                	nop
    80004ae4:	60e2                	ld	ra,24(sp)
    80004ae6:	6442                	ld	s0,16(sp)
    80004ae8:	6105                	addi	sp,sp,32
    80004aea:	8082                	ret

0000000080004aec <bunpin>:

void
bunpin(struct buf *b) {
    80004aec:	1101                	addi	sp,sp,-32
    80004aee:	ec06                	sd	ra,24(sp)
    80004af0:	e822                	sd	s0,16(sp)
    80004af2:	1000                	addi	s0,sp,32
    80004af4:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004af8:	00025517          	auipc	a0,0x25
    80004afc:	f0850513          	addi	a0,a0,-248 # 80029a00 <bcache>
    80004b00:	ffffd097          	auipc	ra,0xffffd
    80004b04:	82a080e7          	jalr	-2006(ra) # 8000132a <acquire>
  b->refcnt--;
    80004b08:	fe843783          	ld	a5,-24(s0)
    80004b0c:	43bc                	lw	a5,64(a5)
    80004b0e:	37fd                	addiw	a5,a5,-1
    80004b10:	0007871b          	sext.w	a4,a5
    80004b14:	fe843783          	ld	a5,-24(s0)
    80004b18:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004b1a:	00025517          	auipc	a0,0x25
    80004b1e:	ee650513          	addi	a0,a0,-282 # 80029a00 <bcache>
    80004b22:	ffffd097          	auipc	ra,0xffffd
    80004b26:	86c080e7          	jalr	-1940(ra) # 8000138e <release>
}
    80004b2a:	0001                	nop
    80004b2c:	60e2                	ld	ra,24(sp)
    80004b2e:	6442                	ld	s0,16(sp)
    80004b30:	6105                	addi	sp,sp,32
    80004b32:	8082                	ret

0000000080004b34 <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004b34:	7179                	addi	sp,sp,-48
    80004b36:	f406                	sd	ra,40(sp)
    80004b38:	f022                	sd	s0,32(sp)
    80004b3a:	1800                	addi	s0,sp,48
    80004b3c:	87aa                	mv	a5,a0
    80004b3e:	fcb43823          	sd	a1,-48(s0)
    80004b42:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004b46:	fdc42783          	lw	a5,-36(s0)
    80004b4a:	4585                	li	a1,1
    80004b4c:	853e                	mv	a0,a5
    80004b4e:	00000097          	auipc	ra,0x0
    80004b52:	dbe080e7          	jalr	-578(ra) # 8000490c <bread>
    80004b56:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004b5a:	fe843783          	ld	a5,-24(s0)
    80004b5e:	05878793          	addi	a5,a5,88
    80004b62:	02000613          	li	a2,32
    80004b66:	85be                	mv	a1,a5
    80004b68:	fd043503          	ld	a0,-48(s0)
    80004b6c:	ffffd097          	auipc	ra,0xffffd
    80004b70:	a76080e7          	jalr	-1418(ra) # 800015e2 <memmove>
  brelse(bp);
    80004b74:	fe843503          	ld	a0,-24(s0)
    80004b78:	00000097          	auipc	ra,0x0
    80004b7c:	e3e080e7          	jalr	-450(ra) # 800049b6 <brelse>
}
    80004b80:	0001                	nop
    80004b82:	70a2                	ld	ra,40(sp)
    80004b84:	7402                	ld	s0,32(sp)
    80004b86:	6145                	addi	sp,sp,48
    80004b88:	8082                	ret

0000000080004b8a <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004b8a:	1101                	addi	sp,sp,-32
    80004b8c:	ec06                	sd	ra,24(sp)
    80004b8e:	e822                	sd	s0,16(sp)
    80004b90:	1000                	addi	s0,sp,32
    80004b92:	87aa                	mv	a5,a0
    80004b94:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004b98:	fec42783          	lw	a5,-20(s0)
    80004b9c:	0002d597          	auipc	a1,0x2d
    80004ba0:	52458593          	addi	a1,a1,1316 # 800320c0 <sb>
    80004ba4:	853e                	mv	a0,a5
    80004ba6:	00000097          	auipc	ra,0x0
    80004baa:	f8e080e7          	jalr	-114(ra) # 80004b34 <readsb>
  if(sb.magic != FSMAGIC)
    80004bae:	0002d797          	auipc	a5,0x2d
    80004bb2:	51278793          	addi	a5,a5,1298 # 800320c0 <sb>
    80004bb6:	439c                	lw	a5,0(a5)
    80004bb8:	873e                	mv	a4,a5
    80004bba:	102037b7          	lui	a5,0x10203
    80004bbe:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004bc2:	00f70a63          	beq	a4,a5,80004bd6 <fsinit+0x4c>
    panic("invalid file system");
    80004bc6:	00007517          	auipc	a0,0x7
    80004bca:	8a250513          	addi	a0,a0,-1886 # 8000b468 <etext+0x468>
    80004bce:	ffffc097          	auipc	ra,0xffffc
    80004bd2:	0be080e7          	jalr	190(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004bd6:	fec42783          	lw	a5,-20(s0)
    80004bda:	0002d597          	auipc	a1,0x2d
    80004bde:	4e658593          	addi	a1,a1,1254 # 800320c0 <sb>
    80004be2:	853e                	mv	a0,a5
    80004be4:	00001097          	auipc	ra,0x1
    80004be8:	49c080e7          	jalr	1180(ra) # 80006080 <initlog>
}
    80004bec:	0001                	nop
    80004bee:	60e2                	ld	ra,24(sp)
    80004bf0:	6442                	ld	s0,16(sp)
    80004bf2:	6105                	addi	sp,sp,32
    80004bf4:	8082                	ret

0000000080004bf6 <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004bf6:	7179                	addi	sp,sp,-48
    80004bf8:	f406                	sd	ra,40(sp)
    80004bfa:	f022                	sd	s0,32(sp)
    80004bfc:	1800                	addi	s0,sp,48
    80004bfe:	87aa                	mv	a5,a0
    80004c00:	872e                	mv	a4,a1
    80004c02:	fcf42e23          	sw	a5,-36(s0)
    80004c06:	87ba                	mv	a5,a4
    80004c08:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004c0c:	fdc42783          	lw	a5,-36(s0)
    80004c10:	fd842703          	lw	a4,-40(s0)
    80004c14:	85ba                	mv	a1,a4
    80004c16:	853e                	mv	a0,a5
    80004c18:	00000097          	auipc	ra,0x0
    80004c1c:	cf4080e7          	jalr	-780(ra) # 8000490c <bread>
    80004c20:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004c24:	fe843783          	ld	a5,-24(s0)
    80004c28:	05878793          	addi	a5,a5,88
    80004c2c:	40000613          	li	a2,1024
    80004c30:	4581                	li	a1,0
    80004c32:	853e                	mv	a0,a5
    80004c34:	ffffd097          	auipc	ra,0xffffd
    80004c38:	8ca080e7          	jalr	-1846(ra) # 800014fe <memset>
  log_write(bp);
    80004c3c:	fe843503          	ld	a0,-24(s0)
    80004c40:	00002097          	auipc	ra,0x2
    80004c44:	a28080e7          	jalr	-1496(ra) # 80006668 <log_write>
  brelse(bp);
    80004c48:	fe843503          	ld	a0,-24(s0)
    80004c4c:	00000097          	auipc	ra,0x0
    80004c50:	d6a080e7          	jalr	-662(ra) # 800049b6 <brelse>
}
    80004c54:	0001                	nop
    80004c56:	70a2                	ld	ra,40(sp)
    80004c58:	7402                	ld	s0,32(sp)
    80004c5a:	6145                	addi	sp,sp,48
    80004c5c:	8082                	ret

0000000080004c5e <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004c5e:	7139                	addi	sp,sp,-64
    80004c60:	fc06                	sd	ra,56(sp)
    80004c62:	f822                	sd	s0,48(sp)
    80004c64:	0080                	addi	s0,sp,64
    80004c66:	87aa                	mv	a5,a0
    80004c68:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004c6c:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004c70:	fe042623          	sw	zero,-20(s0)
    80004c74:	a2b5                	j	80004de0 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004c76:	fec42783          	lw	a5,-20(s0)
    80004c7a:	41f7d71b          	sraiw	a4,a5,0x1f
    80004c7e:	0137571b          	srliw	a4,a4,0x13
    80004c82:	9fb9                	addw	a5,a5,a4
    80004c84:	40d7d79b          	sraiw	a5,a5,0xd
    80004c88:	2781                	sext.w	a5,a5
    80004c8a:	0007871b          	sext.w	a4,a5
    80004c8e:	0002d797          	auipc	a5,0x2d
    80004c92:	43278793          	addi	a5,a5,1074 # 800320c0 <sb>
    80004c96:	4fdc                	lw	a5,28(a5)
    80004c98:	9fb9                	addw	a5,a5,a4
    80004c9a:	0007871b          	sext.w	a4,a5
    80004c9e:	fcc42783          	lw	a5,-52(s0)
    80004ca2:	85ba                	mv	a1,a4
    80004ca4:	853e                	mv	a0,a5
    80004ca6:	00000097          	auipc	ra,0x0
    80004caa:	c66080e7          	jalr	-922(ra) # 8000490c <bread>
    80004cae:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004cb2:	fe042423          	sw	zero,-24(s0)
    80004cb6:	a0dd                	j	80004d9c <balloc+0x13e>
      m = 1 << (bi % 8);
    80004cb8:	fe842703          	lw	a4,-24(s0)
    80004cbc:	41f7579b          	sraiw	a5,a4,0x1f
    80004cc0:	01d7d79b          	srliw	a5,a5,0x1d
    80004cc4:	9f3d                	addw	a4,a4,a5
    80004cc6:	8b1d                	andi	a4,a4,7
    80004cc8:	40f707bb          	subw	a5,a4,a5
    80004ccc:	2781                	sext.w	a5,a5
    80004cce:	4705                	li	a4,1
    80004cd0:	00f717bb          	sllw	a5,a4,a5
    80004cd4:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004cd8:	fe842783          	lw	a5,-24(s0)
    80004cdc:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ce0:	01d7571b          	srliw	a4,a4,0x1d
    80004ce4:	9fb9                	addw	a5,a5,a4
    80004ce6:	4037d79b          	sraiw	a5,a5,0x3
    80004cea:	2781                	sext.w	a5,a5
    80004cec:	fe043703          	ld	a4,-32(s0)
    80004cf0:	97ba                	add	a5,a5,a4
    80004cf2:	0587c783          	lbu	a5,88(a5)
    80004cf6:	0007871b          	sext.w	a4,a5
    80004cfa:	fdc42783          	lw	a5,-36(s0)
    80004cfe:	8ff9                	and	a5,a5,a4
    80004d00:	2781                	sext.w	a5,a5
    80004d02:	ebc1                	bnez	a5,80004d92 <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004d04:	fe842783          	lw	a5,-24(s0)
    80004d08:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d0c:	01d7571b          	srliw	a4,a4,0x1d
    80004d10:	9fb9                	addw	a5,a5,a4
    80004d12:	4037d79b          	sraiw	a5,a5,0x3
    80004d16:	2781                	sext.w	a5,a5
    80004d18:	fe043703          	ld	a4,-32(s0)
    80004d1c:	973e                	add	a4,a4,a5
    80004d1e:	05874703          	lbu	a4,88(a4)
    80004d22:	0187169b          	slliw	a3,a4,0x18
    80004d26:	4186d69b          	sraiw	a3,a3,0x18
    80004d2a:	fdc42703          	lw	a4,-36(s0)
    80004d2e:	0187171b          	slliw	a4,a4,0x18
    80004d32:	4187571b          	sraiw	a4,a4,0x18
    80004d36:	8f55                	or	a4,a4,a3
    80004d38:	0187171b          	slliw	a4,a4,0x18
    80004d3c:	4187571b          	sraiw	a4,a4,0x18
    80004d40:	0ff77713          	andi	a4,a4,255
    80004d44:	fe043683          	ld	a3,-32(s0)
    80004d48:	97b6                	add	a5,a5,a3
    80004d4a:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004d4e:	fe043503          	ld	a0,-32(s0)
    80004d52:	00002097          	auipc	ra,0x2
    80004d56:	916080e7          	jalr	-1770(ra) # 80006668 <log_write>
        brelse(bp);
    80004d5a:	fe043503          	ld	a0,-32(s0)
    80004d5e:	00000097          	auipc	ra,0x0
    80004d62:	c58080e7          	jalr	-936(ra) # 800049b6 <brelse>
        bzero(dev, b + bi);
    80004d66:	fcc42683          	lw	a3,-52(s0)
    80004d6a:	fec42703          	lw	a4,-20(s0)
    80004d6e:	fe842783          	lw	a5,-24(s0)
    80004d72:	9fb9                	addw	a5,a5,a4
    80004d74:	2781                	sext.w	a5,a5
    80004d76:	85be                	mv	a1,a5
    80004d78:	8536                	mv	a0,a3
    80004d7a:	00000097          	auipc	ra,0x0
    80004d7e:	e7c080e7          	jalr	-388(ra) # 80004bf6 <bzero>
        return b + bi;
    80004d82:	fec42703          	lw	a4,-20(s0)
    80004d86:	fe842783          	lw	a5,-24(s0)
    80004d8a:	9fb9                	addw	a5,a5,a4
    80004d8c:	2781                	sext.w	a5,a5
    80004d8e:	2781                	sext.w	a5,a5
    80004d90:	a895                	j	80004e04 <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004d92:	fe842783          	lw	a5,-24(s0)
    80004d96:	2785                	addiw	a5,a5,1
    80004d98:	fef42423          	sw	a5,-24(s0)
    80004d9c:	fe842783          	lw	a5,-24(s0)
    80004da0:	0007871b          	sext.w	a4,a5
    80004da4:	6789                	lui	a5,0x2
    80004da6:	02f75163          	bge	a4,a5,80004dc8 <balloc+0x16a>
    80004daa:	fec42703          	lw	a4,-20(s0)
    80004dae:	fe842783          	lw	a5,-24(s0)
    80004db2:	9fb9                	addw	a5,a5,a4
    80004db4:	2781                	sext.w	a5,a5
    80004db6:	0007871b          	sext.w	a4,a5
    80004dba:	0002d797          	auipc	a5,0x2d
    80004dbe:	30678793          	addi	a5,a5,774 # 800320c0 <sb>
    80004dc2:	43dc                	lw	a5,4(a5)
    80004dc4:	eef76ae3          	bltu	a4,a5,80004cb8 <balloc+0x5a>
      }
    }
    brelse(bp);
    80004dc8:	fe043503          	ld	a0,-32(s0)
    80004dcc:	00000097          	auipc	ra,0x0
    80004dd0:	bea080e7          	jalr	-1046(ra) # 800049b6 <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004dd4:	fec42703          	lw	a4,-20(s0)
    80004dd8:	6789                	lui	a5,0x2
    80004dda:	9fb9                	addw	a5,a5,a4
    80004ddc:	fef42623          	sw	a5,-20(s0)
    80004de0:	0002d797          	auipc	a5,0x2d
    80004de4:	2e078793          	addi	a5,a5,736 # 800320c0 <sb>
    80004de8:	43d8                	lw	a4,4(a5)
    80004dea:	fec42783          	lw	a5,-20(s0)
    80004dee:	e8e7e4e3          	bltu	a5,a4,80004c76 <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004df2:	00006517          	auipc	a0,0x6
    80004df6:	68e50513          	addi	a0,a0,1678 # 8000b480 <etext+0x480>
    80004dfa:	ffffc097          	auipc	ra,0xffffc
    80004dfe:	c3c080e7          	jalr	-964(ra) # 80000a36 <printf>
  return 0;
    80004e02:	4781                	li	a5,0
}
    80004e04:	853e                	mv	a0,a5
    80004e06:	70e2                	ld	ra,56(sp)
    80004e08:	7442                	ld	s0,48(sp)
    80004e0a:	6121                	addi	sp,sp,64
    80004e0c:	8082                	ret

0000000080004e0e <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004e0e:	7179                	addi	sp,sp,-48
    80004e10:	f406                	sd	ra,40(sp)
    80004e12:	f022                	sd	s0,32(sp)
    80004e14:	1800                	addi	s0,sp,48
    80004e16:	87aa                	mv	a5,a0
    80004e18:	872e                	mv	a4,a1
    80004e1a:	fcf42e23          	sw	a5,-36(s0)
    80004e1e:	87ba                	mv	a5,a4
    80004e20:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004e24:	fdc42683          	lw	a3,-36(s0)
    80004e28:	fd842783          	lw	a5,-40(s0)
    80004e2c:	00d7d79b          	srliw	a5,a5,0xd
    80004e30:	0007871b          	sext.w	a4,a5
    80004e34:	0002d797          	auipc	a5,0x2d
    80004e38:	28c78793          	addi	a5,a5,652 # 800320c0 <sb>
    80004e3c:	4fdc                	lw	a5,28(a5)
    80004e3e:	9fb9                	addw	a5,a5,a4
    80004e40:	2781                	sext.w	a5,a5
    80004e42:	85be                	mv	a1,a5
    80004e44:	8536                	mv	a0,a3
    80004e46:	00000097          	auipc	ra,0x0
    80004e4a:	ac6080e7          	jalr	-1338(ra) # 8000490c <bread>
    80004e4e:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004e52:	fd842703          	lw	a4,-40(s0)
    80004e56:	6789                	lui	a5,0x2
    80004e58:	17fd                	addi	a5,a5,-1
    80004e5a:	8ff9                	and	a5,a5,a4
    80004e5c:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004e60:	fe442703          	lw	a4,-28(s0)
    80004e64:	41f7579b          	sraiw	a5,a4,0x1f
    80004e68:	01d7d79b          	srliw	a5,a5,0x1d
    80004e6c:	9f3d                	addw	a4,a4,a5
    80004e6e:	8b1d                	andi	a4,a4,7
    80004e70:	40f707bb          	subw	a5,a4,a5
    80004e74:	2781                	sext.w	a5,a5
    80004e76:	4705                	li	a4,1
    80004e78:	00f717bb          	sllw	a5,a4,a5
    80004e7c:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004e80:	fe442783          	lw	a5,-28(s0)
    80004e84:	41f7d71b          	sraiw	a4,a5,0x1f
    80004e88:	01d7571b          	srliw	a4,a4,0x1d
    80004e8c:	9fb9                	addw	a5,a5,a4
    80004e8e:	4037d79b          	sraiw	a5,a5,0x3
    80004e92:	2781                	sext.w	a5,a5
    80004e94:	fe843703          	ld	a4,-24(s0)
    80004e98:	97ba                	add	a5,a5,a4
    80004e9a:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004e9e:	0007871b          	sext.w	a4,a5
    80004ea2:	fe042783          	lw	a5,-32(s0)
    80004ea6:	8ff9                	and	a5,a5,a4
    80004ea8:	2781                	sext.w	a5,a5
    80004eaa:	eb89                	bnez	a5,80004ebc <bfree+0xae>
    panic("freeing free block");
    80004eac:	00006517          	auipc	a0,0x6
    80004eb0:	5ec50513          	addi	a0,a0,1516 # 8000b498 <etext+0x498>
    80004eb4:	ffffc097          	auipc	ra,0xffffc
    80004eb8:	dd8080e7          	jalr	-552(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    80004ebc:	fe442783          	lw	a5,-28(s0)
    80004ec0:	41f7d71b          	sraiw	a4,a5,0x1f
    80004ec4:	01d7571b          	srliw	a4,a4,0x1d
    80004ec8:	9fb9                	addw	a5,a5,a4
    80004eca:	4037d79b          	sraiw	a5,a5,0x3
    80004ece:	2781                	sext.w	a5,a5
    80004ed0:	fe843703          	ld	a4,-24(s0)
    80004ed4:	973e                	add	a4,a4,a5
    80004ed6:	05874703          	lbu	a4,88(a4)
    80004eda:	0187169b          	slliw	a3,a4,0x18
    80004ede:	4186d69b          	sraiw	a3,a3,0x18
    80004ee2:	fe042703          	lw	a4,-32(s0)
    80004ee6:	0187171b          	slliw	a4,a4,0x18
    80004eea:	4187571b          	sraiw	a4,a4,0x18
    80004eee:	fff74713          	not	a4,a4
    80004ef2:	0187171b          	slliw	a4,a4,0x18
    80004ef6:	4187571b          	sraiw	a4,a4,0x18
    80004efa:	8f75                	and	a4,a4,a3
    80004efc:	0187171b          	slliw	a4,a4,0x18
    80004f00:	4187571b          	sraiw	a4,a4,0x18
    80004f04:	0ff77713          	andi	a4,a4,255
    80004f08:	fe843683          	ld	a3,-24(s0)
    80004f0c:	97b6                	add	a5,a5,a3
    80004f0e:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004f12:	fe843503          	ld	a0,-24(s0)
    80004f16:	00001097          	auipc	ra,0x1
    80004f1a:	752080e7          	jalr	1874(ra) # 80006668 <log_write>
  brelse(bp);
    80004f1e:	fe843503          	ld	a0,-24(s0)
    80004f22:	00000097          	auipc	ra,0x0
    80004f26:	a94080e7          	jalr	-1388(ra) # 800049b6 <brelse>
}
    80004f2a:	0001                	nop
    80004f2c:	70a2                	ld	ra,40(sp)
    80004f2e:	7402                	ld	s0,32(sp)
    80004f30:	6145                	addi	sp,sp,48
    80004f32:	8082                	ret

0000000080004f34 <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    80004f34:	1101                	addi	sp,sp,-32
    80004f36:	ec06                	sd	ra,24(sp)
    80004f38:	e822                	sd	s0,16(sp)
    80004f3a:	1000                	addi	s0,sp,32
  int i = 0;
    80004f3c:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80004f40:	00006597          	auipc	a1,0x6
    80004f44:	57058593          	addi	a1,a1,1392 # 8000b4b0 <etext+0x4b0>
    80004f48:	0002d517          	auipc	a0,0x2d
    80004f4c:	19850513          	addi	a0,a0,408 # 800320e0 <itable>
    80004f50:	ffffc097          	auipc	ra,0xffffc
    80004f54:	3aa080e7          	jalr	938(ra) # 800012fa <initlock>
  for(i = 0; i < NINODE; i++) {
    80004f58:	fe042623          	sw	zero,-20(s0)
    80004f5c:	a82d                	j	80004f96 <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80004f5e:	fec42703          	lw	a4,-20(s0)
    80004f62:	87ba                	mv	a5,a4
    80004f64:	0792                	slli	a5,a5,0x4
    80004f66:	97ba                	add	a5,a5,a4
    80004f68:	078e                	slli	a5,a5,0x3
    80004f6a:	02078713          	addi	a4,a5,32
    80004f6e:	0002d797          	auipc	a5,0x2d
    80004f72:	17278793          	addi	a5,a5,370 # 800320e0 <itable>
    80004f76:	97ba                	add	a5,a5,a4
    80004f78:	07a1                	addi	a5,a5,8
    80004f7a:	00006597          	auipc	a1,0x6
    80004f7e:	53e58593          	addi	a1,a1,1342 # 8000b4b8 <etext+0x4b8>
    80004f82:	853e                	mv	a0,a5
    80004f84:	00002097          	auipc	ra,0x2
    80004f88:	818080e7          	jalr	-2024(ra) # 8000679c <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80004f8c:	fec42783          	lw	a5,-20(s0)
    80004f90:	2785                	addiw	a5,a5,1
    80004f92:	fef42623          	sw	a5,-20(s0)
    80004f96:	fec42783          	lw	a5,-20(s0)
    80004f9a:	0007871b          	sext.w	a4,a5
    80004f9e:	03100793          	li	a5,49
    80004fa2:	fae7dee3          	bge	a5,a4,80004f5e <iinit+0x2a>
  }
}
    80004fa6:	0001                	nop
    80004fa8:	0001                	nop
    80004faa:	60e2                	ld	ra,24(sp)
    80004fac:	6442                	ld	s0,16(sp)
    80004fae:	6105                	addi	sp,sp,32
    80004fb0:	8082                	ret

0000000080004fb2 <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    80004fb2:	7139                	addi	sp,sp,-64
    80004fb4:	fc06                	sd	ra,56(sp)
    80004fb6:	f822                	sd	s0,48(sp)
    80004fb8:	0080                	addi	s0,sp,64
    80004fba:	87aa                	mv	a5,a0
    80004fbc:	872e                	mv	a4,a1
    80004fbe:	fcf42623          	sw	a5,-52(s0)
    80004fc2:	87ba                	mv	a5,a4
    80004fc4:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    80004fc8:	4785                	li	a5,1
    80004fca:	fef42623          	sw	a5,-20(s0)
    80004fce:	a855                	j	80005082 <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    80004fd0:	fec42783          	lw	a5,-20(s0)
    80004fd4:	8391                	srli	a5,a5,0x4
    80004fd6:	0007871b          	sext.w	a4,a5
    80004fda:	0002d797          	auipc	a5,0x2d
    80004fde:	0e678793          	addi	a5,a5,230 # 800320c0 <sb>
    80004fe2:	4f9c                	lw	a5,24(a5)
    80004fe4:	9fb9                	addw	a5,a5,a4
    80004fe6:	0007871b          	sext.w	a4,a5
    80004fea:	fcc42783          	lw	a5,-52(s0)
    80004fee:	85ba                	mv	a1,a4
    80004ff0:	853e                	mv	a0,a5
    80004ff2:	00000097          	auipc	ra,0x0
    80004ff6:	91a080e7          	jalr	-1766(ra) # 8000490c <bread>
    80004ffa:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    80004ffe:	fe043783          	ld	a5,-32(s0)
    80005002:	05878713          	addi	a4,a5,88
    80005006:	fec42783          	lw	a5,-20(s0)
    8000500a:	8bbd                	andi	a5,a5,15
    8000500c:	079a                	slli	a5,a5,0x6
    8000500e:	97ba                	add	a5,a5,a4
    80005010:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    80005014:	fd843783          	ld	a5,-40(s0)
    80005018:	00079783          	lh	a5,0(a5)
    8000501c:	eba1                	bnez	a5,8000506c <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    8000501e:	04000613          	li	a2,64
    80005022:	4581                	li	a1,0
    80005024:	fd843503          	ld	a0,-40(s0)
    80005028:	ffffc097          	auipc	ra,0xffffc
    8000502c:	4d6080e7          	jalr	1238(ra) # 800014fe <memset>
      dip->type = type;
    80005030:	fd843783          	ld	a5,-40(s0)
    80005034:	fca45703          	lhu	a4,-54(s0)
    80005038:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    8000503c:	fe043503          	ld	a0,-32(s0)
    80005040:	00001097          	auipc	ra,0x1
    80005044:	628080e7          	jalr	1576(ra) # 80006668 <log_write>
      brelse(bp);
    80005048:	fe043503          	ld	a0,-32(s0)
    8000504c:	00000097          	auipc	ra,0x0
    80005050:	96a080e7          	jalr	-1686(ra) # 800049b6 <brelse>
      return iget(dev, inum);
    80005054:	fec42703          	lw	a4,-20(s0)
    80005058:	fcc42783          	lw	a5,-52(s0)
    8000505c:	85ba                	mv	a1,a4
    8000505e:	853e                	mv	a0,a5
    80005060:	00000097          	auipc	ra,0x0
    80005064:	138080e7          	jalr	312(ra) # 80005198 <iget>
    80005068:	87aa                	mv	a5,a0
    8000506a:	a835                	j	800050a6 <ialloc+0xf4>
    }
    brelse(bp);
    8000506c:	fe043503          	ld	a0,-32(s0)
    80005070:	00000097          	auipc	ra,0x0
    80005074:	946080e7          	jalr	-1722(ra) # 800049b6 <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80005078:	fec42783          	lw	a5,-20(s0)
    8000507c:	2785                	addiw	a5,a5,1
    8000507e:	fef42623          	sw	a5,-20(s0)
    80005082:	0002d797          	auipc	a5,0x2d
    80005086:	03e78793          	addi	a5,a5,62 # 800320c0 <sb>
    8000508a:	47d8                	lw	a4,12(a5)
    8000508c:	fec42783          	lw	a5,-20(s0)
    80005090:	f4e7e0e3          	bltu	a5,a4,80004fd0 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    80005094:	00006517          	auipc	a0,0x6
    80005098:	42c50513          	addi	a0,a0,1068 # 8000b4c0 <etext+0x4c0>
    8000509c:	ffffc097          	auipc	ra,0xffffc
    800050a0:	99a080e7          	jalr	-1638(ra) # 80000a36 <printf>
  return 0;
    800050a4:	4781                	li	a5,0
}
    800050a6:	853e                	mv	a0,a5
    800050a8:	70e2                	ld	ra,56(sp)
    800050aa:	7442                	ld	s0,48(sp)
    800050ac:	6121                	addi	sp,sp,64
    800050ae:	8082                	ret

00000000800050b0 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    800050b0:	7179                	addi	sp,sp,-48
    800050b2:	f406                	sd	ra,40(sp)
    800050b4:	f022                	sd	s0,32(sp)
    800050b6:	1800                	addi	s0,sp,48
    800050b8:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800050bc:	fd843783          	ld	a5,-40(s0)
    800050c0:	4394                	lw	a3,0(a5)
    800050c2:	fd843783          	ld	a5,-40(s0)
    800050c6:	43dc                	lw	a5,4(a5)
    800050c8:	0047d79b          	srliw	a5,a5,0x4
    800050cc:	0007871b          	sext.w	a4,a5
    800050d0:	0002d797          	auipc	a5,0x2d
    800050d4:	ff078793          	addi	a5,a5,-16 # 800320c0 <sb>
    800050d8:	4f9c                	lw	a5,24(a5)
    800050da:	9fb9                	addw	a5,a5,a4
    800050dc:	2781                	sext.w	a5,a5
    800050de:	85be                	mv	a1,a5
    800050e0:	8536                	mv	a0,a3
    800050e2:	00000097          	auipc	ra,0x0
    800050e6:	82a080e7          	jalr	-2006(ra) # 8000490c <bread>
    800050ea:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    800050ee:	fe843783          	ld	a5,-24(s0)
    800050f2:	05878713          	addi	a4,a5,88
    800050f6:	fd843783          	ld	a5,-40(s0)
    800050fa:	43dc                	lw	a5,4(a5)
    800050fc:	1782                	slli	a5,a5,0x20
    800050fe:	9381                	srli	a5,a5,0x20
    80005100:	8bbd                	andi	a5,a5,15
    80005102:	079a                	slli	a5,a5,0x6
    80005104:	97ba                	add	a5,a5,a4
    80005106:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    8000510a:	fd843783          	ld	a5,-40(s0)
    8000510e:	04479703          	lh	a4,68(a5)
    80005112:	fe043783          	ld	a5,-32(s0)
    80005116:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    8000511a:	fd843783          	ld	a5,-40(s0)
    8000511e:	04679703          	lh	a4,70(a5)
    80005122:	fe043783          	ld	a5,-32(s0)
    80005126:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    8000512a:	fd843783          	ld	a5,-40(s0)
    8000512e:	04879703          	lh	a4,72(a5)
    80005132:	fe043783          	ld	a5,-32(s0)
    80005136:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    8000513a:	fd843783          	ld	a5,-40(s0)
    8000513e:	04a79703          	lh	a4,74(a5)
    80005142:	fe043783          	ld	a5,-32(s0)
    80005146:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    8000514a:	fd843783          	ld	a5,-40(s0)
    8000514e:	47f8                	lw	a4,76(a5)
    80005150:	fe043783          	ld	a5,-32(s0)
    80005154:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    80005156:	fe043783          	ld	a5,-32(s0)
    8000515a:	00c78713          	addi	a4,a5,12
    8000515e:	fd843783          	ld	a5,-40(s0)
    80005162:	05078793          	addi	a5,a5,80
    80005166:	03400613          	li	a2,52
    8000516a:	85be                	mv	a1,a5
    8000516c:	853a                	mv	a0,a4
    8000516e:	ffffc097          	auipc	ra,0xffffc
    80005172:	474080e7          	jalr	1140(ra) # 800015e2 <memmove>
  log_write(bp);
    80005176:	fe843503          	ld	a0,-24(s0)
    8000517a:	00001097          	auipc	ra,0x1
    8000517e:	4ee080e7          	jalr	1262(ra) # 80006668 <log_write>
  brelse(bp);
    80005182:	fe843503          	ld	a0,-24(s0)
    80005186:	00000097          	auipc	ra,0x0
    8000518a:	830080e7          	jalr	-2000(ra) # 800049b6 <brelse>
}
    8000518e:	0001                	nop
    80005190:	70a2                	ld	ra,40(sp)
    80005192:	7402                	ld	s0,32(sp)
    80005194:	6145                	addi	sp,sp,48
    80005196:	8082                	ret

0000000080005198 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80005198:	7179                	addi	sp,sp,-48
    8000519a:	f406                	sd	ra,40(sp)
    8000519c:	f022                	sd	s0,32(sp)
    8000519e:	1800                	addi	s0,sp,48
    800051a0:	87aa                	mv	a5,a0
    800051a2:	872e                	mv	a4,a1
    800051a4:	fcf42e23          	sw	a5,-36(s0)
    800051a8:	87ba                	mv	a5,a4
    800051aa:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    800051ae:	0002d517          	auipc	a0,0x2d
    800051b2:	f3250513          	addi	a0,a0,-206 # 800320e0 <itable>
    800051b6:	ffffc097          	auipc	ra,0xffffc
    800051ba:	174080e7          	jalr	372(ra) # 8000132a <acquire>

  // Is the inode already in the table?
  empty = 0;
    800051be:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800051c2:	0002d797          	auipc	a5,0x2d
    800051c6:	f3678793          	addi	a5,a5,-202 # 800320f8 <itable+0x18>
    800051ca:	fef43423          	sd	a5,-24(s0)
    800051ce:	a89d                	j	80005244 <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800051d0:	fe843783          	ld	a5,-24(s0)
    800051d4:	479c                	lw	a5,8(a5)
    800051d6:	04f05663          	blez	a5,80005222 <iget+0x8a>
    800051da:	fe843783          	ld	a5,-24(s0)
    800051de:	4398                	lw	a4,0(a5)
    800051e0:	fdc42783          	lw	a5,-36(s0)
    800051e4:	2781                	sext.w	a5,a5
    800051e6:	02e79e63          	bne	a5,a4,80005222 <iget+0x8a>
    800051ea:	fe843783          	ld	a5,-24(s0)
    800051ee:	43d8                	lw	a4,4(a5)
    800051f0:	fd842783          	lw	a5,-40(s0)
    800051f4:	2781                	sext.w	a5,a5
    800051f6:	02e79663          	bne	a5,a4,80005222 <iget+0x8a>
      ip->ref++;
    800051fa:	fe843783          	ld	a5,-24(s0)
    800051fe:	479c                	lw	a5,8(a5)
    80005200:	2785                	addiw	a5,a5,1
    80005202:	0007871b          	sext.w	a4,a5
    80005206:	fe843783          	ld	a5,-24(s0)
    8000520a:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    8000520c:	0002d517          	auipc	a0,0x2d
    80005210:	ed450513          	addi	a0,a0,-300 # 800320e0 <itable>
    80005214:	ffffc097          	auipc	ra,0xffffc
    80005218:	17a080e7          	jalr	378(ra) # 8000138e <release>
      return ip;
    8000521c:	fe843783          	ld	a5,-24(s0)
    80005220:	a069                	j	800052aa <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    80005222:	fe043783          	ld	a5,-32(s0)
    80005226:	eb89                	bnez	a5,80005238 <iget+0xa0>
    80005228:	fe843783          	ld	a5,-24(s0)
    8000522c:	479c                	lw	a5,8(a5)
    8000522e:	e789                	bnez	a5,80005238 <iget+0xa0>
      empty = ip;
    80005230:	fe843783          	ld	a5,-24(s0)
    80005234:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005238:	fe843783          	ld	a5,-24(s0)
    8000523c:	08878793          	addi	a5,a5,136
    80005240:	fef43423          	sd	a5,-24(s0)
    80005244:	fe843703          	ld	a4,-24(s0)
    80005248:	0002f797          	auipc	a5,0x2f
    8000524c:	94078793          	addi	a5,a5,-1728 # 80033b88 <log>
    80005250:	f8f760e3          	bltu	a4,a5,800051d0 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    80005254:	fe043783          	ld	a5,-32(s0)
    80005258:	eb89                	bnez	a5,8000526a <iget+0xd2>
    panic("iget: no inodes");
    8000525a:	00006517          	auipc	a0,0x6
    8000525e:	27e50513          	addi	a0,a0,638 # 8000b4d8 <etext+0x4d8>
    80005262:	ffffc097          	auipc	ra,0xffffc
    80005266:	a2a080e7          	jalr	-1494(ra) # 80000c8c <panic>

  ip = empty;
    8000526a:	fe043783          	ld	a5,-32(s0)
    8000526e:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    80005272:	fe843783          	ld	a5,-24(s0)
    80005276:	fdc42703          	lw	a4,-36(s0)
    8000527a:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    8000527c:	fe843783          	ld	a5,-24(s0)
    80005280:	fd842703          	lw	a4,-40(s0)
    80005284:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    80005286:	fe843783          	ld	a5,-24(s0)
    8000528a:	4705                	li	a4,1
    8000528c:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    8000528e:	fe843783          	ld	a5,-24(s0)
    80005292:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    80005296:	0002d517          	auipc	a0,0x2d
    8000529a:	e4a50513          	addi	a0,a0,-438 # 800320e0 <itable>
    8000529e:	ffffc097          	auipc	ra,0xffffc
    800052a2:	0f0080e7          	jalr	240(ra) # 8000138e <release>

  return ip;
    800052a6:	fe843783          	ld	a5,-24(s0)
}
    800052aa:	853e                	mv	a0,a5
    800052ac:	70a2                	ld	ra,40(sp)
    800052ae:	7402                	ld	s0,32(sp)
    800052b0:	6145                	addi	sp,sp,48
    800052b2:	8082                	ret

00000000800052b4 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    800052b4:	1101                	addi	sp,sp,-32
    800052b6:	ec06                	sd	ra,24(sp)
    800052b8:	e822                	sd	s0,16(sp)
    800052ba:	1000                	addi	s0,sp,32
    800052bc:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800052c0:	0002d517          	auipc	a0,0x2d
    800052c4:	e2050513          	addi	a0,a0,-480 # 800320e0 <itable>
    800052c8:	ffffc097          	auipc	ra,0xffffc
    800052cc:	062080e7          	jalr	98(ra) # 8000132a <acquire>
  ip->ref++;
    800052d0:	fe843783          	ld	a5,-24(s0)
    800052d4:	479c                	lw	a5,8(a5)
    800052d6:	2785                	addiw	a5,a5,1
    800052d8:	0007871b          	sext.w	a4,a5
    800052dc:	fe843783          	ld	a5,-24(s0)
    800052e0:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800052e2:	0002d517          	auipc	a0,0x2d
    800052e6:	dfe50513          	addi	a0,a0,-514 # 800320e0 <itable>
    800052ea:	ffffc097          	auipc	ra,0xffffc
    800052ee:	0a4080e7          	jalr	164(ra) # 8000138e <release>
  return ip;
    800052f2:	fe843783          	ld	a5,-24(s0)
}
    800052f6:	853e                	mv	a0,a5
    800052f8:	60e2                	ld	ra,24(sp)
    800052fa:	6442                	ld	s0,16(sp)
    800052fc:	6105                	addi	sp,sp,32
    800052fe:	8082                	ret

0000000080005300 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    80005300:	7179                	addi	sp,sp,-48
    80005302:	f406                	sd	ra,40(sp)
    80005304:	f022                	sd	s0,32(sp)
    80005306:	1800                	addi	s0,sp,48
    80005308:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    8000530c:	fd843783          	ld	a5,-40(s0)
    80005310:	c791                	beqz	a5,8000531c <ilock+0x1c>
    80005312:	fd843783          	ld	a5,-40(s0)
    80005316:	479c                	lw	a5,8(a5)
    80005318:	00f04a63          	bgtz	a5,8000532c <ilock+0x2c>
    panic("ilock");
    8000531c:	00006517          	auipc	a0,0x6
    80005320:	1cc50513          	addi	a0,a0,460 # 8000b4e8 <etext+0x4e8>
    80005324:	ffffc097          	auipc	ra,0xffffc
    80005328:	968080e7          	jalr	-1688(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    8000532c:	fd843783          	ld	a5,-40(s0)
    80005330:	07c1                	addi	a5,a5,16
    80005332:	853e                	mv	a0,a5
    80005334:	00001097          	auipc	ra,0x1
    80005338:	4b4080e7          	jalr	1204(ra) # 800067e8 <acquiresleep>

  if(ip->valid == 0){
    8000533c:	fd843783          	ld	a5,-40(s0)
    80005340:	43bc                	lw	a5,64(a5)
    80005342:	e7e5                	bnez	a5,8000542a <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    80005344:	fd843783          	ld	a5,-40(s0)
    80005348:	4394                	lw	a3,0(a5)
    8000534a:	fd843783          	ld	a5,-40(s0)
    8000534e:	43dc                	lw	a5,4(a5)
    80005350:	0047d79b          	srliw	a5,a5,0x4
    80005354:	0007871b          	sext.w	a4,a5
    80005358:	0002d797          	auipc	a5,0x2d
    8000535c:	d6878793          	addi	a5,a5,-664 # 800320c0 <sb>
    80005360:	4f9c                	lw	a5,24(a5)
    80005362:	9fb9                	addw	a5,a5,a4
    80005364:	2781                	sext.w	a5,a5
    80005366:	85be                	mv	a1,a5
    80005368:	8536                	mv	a0,a3
    8000536a:	fffff097          	auipc	ra,0xfffff
    8000536e:	5a2080e7          	jalr	1442(ra) # 8000490c <bread>
    80005372:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    80005376:	fe843783          	ld	a5,-24(s0)
    8000537a:	05878713          	addi	a4,a5,88
    8000537e:	fd843783          	ld	a5,-40(s0)
    80005382:	43dc                	lw	a5,4(a5)
    80005384:	1782                	slli	a5,a5,0x20
    80005386:	9381                	srli	a5,a5,0x20
    80005388:	8bbd                	andi	a5,a5,15
    8000538a:	079a                	slli	a5,a5,0x6
    8000538c:	97ba                	add	a5,a5,a4
    8000538e:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    80005392:	fe043783          	ld	a5,-32(s0)
    80005396:	00079703          	lh	a4,0(a5)
    8000539a:	fd843783          	ld	a5,-40(s0)
    8000539e:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    800053a2:	fe043783          	ld	a5,-32(s0)
    800053a6:	00279703          	lh	a4,2(a5)
    800053aa:	fd843783          	ld	a5,-40(s0)
    800053ae:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    800053b2:	fe043783          	ld	a5,-32(s0)
    800053b6:	00479703          	lh	a4,4(a5)
    800053ba:	fd843783          	ld	a5,-40(s0)
    800053be:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800053c2:	fe043783          	ld	a5,-32(s0)
    800053c6:	00679703          	lh	a4,6(a5)
    800053ca:	fd843783          	ld	a5,-40(s0)
    800053ce:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800053d2:	fe043783          	ld	a5,-32(s0)
    800053d6:	4798                	lw	a4,8(a5)
    800053d8:	fd843783          	ld	a5,-40(s0)
    800053dc:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800053de:	fd843783          	ld	a5,-40(s0)
    800053e2:	05078713          	addi	a4,a5,80
    800053e6:	fe043783          	ld	a5,-32(s0)
    800053ea:	07b1                	addi	a5,a5,12
    800053ec:	03400613          	li	a2,52
    800053f0:	85be                	mv	a1,a5
    800053f2:	853a                	mv	a0,a4
    800053f4:	ffffc097          	auipc	ra,0xffffc
    800053f8:	1ee080e7          	jalr	494(ra) # 800015e2 <memmove>
    brelse(bp);
    800053fc:	fe843503          	ld	a0,-24(s0)
    80005400:	fffff097          	auipc	ra,0xfffff
    80005404:	5b6080e7          	jalr	1462(ra) # 800049b6 <brelse>
    ip->valid = 1;
    80005408:	fd843783          	ld	a5,-40(s0)
    8000540c:	4705                	li	a4,1
    8000540e:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    80005410:	fd843783          	ld	a5,-40(s0)
    80005414:	04479783          	lh	a5,68(a5)
    80005418:	eb89                	bnez	a5,8000542a <ilock+0x12a>
      panic("ilock: no type");
    8000541a:	00006517          	auipc	a0,0x6
    8000541e:	0d650513          	addi	a0,a0,214 # 8000b4f0 <etext+0x4f0>
    80005422:	ffffc097          	auipc	ra,0xffffc
    80005426:	86a080e7          	jalr	-1942(ra) # 80000c8c <panic>
  }
}
    8000542a:	0001                	nop
    8000542c:	70a2                	ld	ra,40(sp)
    8000542e:	7402                	ld	s0,32(sp)
    80005430:	6145                	addi	sp,sp,48
    80005432:	8082                	ret

0000000080005434 <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    80005434:	1101                	addi	sp,sp,-32
    80005436:	ec06                	sd	ra,24(sp)
    80005438:	e822                	sd	s0,16(sp)
    8000543a:	1000                	addi	s0,sp,32
    8000543c:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005440:	fe843783          	ld	a5,-24(s0)
    80005444:	c385                	beqz	a5,80005464 <iunlock+0x30>
    80005446:	fe843783          	ld	a5,-24(s0)
    8000544a:	07c1                	addi	a5,a5,16
    8000544c:	853e                	mv	a0,a5
    8000544e:	00001097          	auipc	ra,0x1
    80005452:	45a080e7          	jalr	1114(ra) # 800068a8 <holdingsleep>
    80005456:	87aa                	mv	a5,a0
    80005458:	c791                	beqz	a5,80005464 <iunlock+0x30>
    8000545a:	fe843783          	ld	a5,-24(s0)
    8000545e:	479c                	lw	a5,8(a5)
    80005460:	00f04a63          	bgtz	a5,80005474 <iunlock+0x40>
    panic("iunlock");
    80005464:	00006517          	auipc	a0,0x6
    80005468:	09c50513          	addi	a0,a0,156 # 8000b500 <etext+0x500>
    8000546c:	ffffc097          	auipc	ra,0xffffc
    80005470:	820080e7          	jalr	-2016(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    80005474:	fe843783          	ld	a5,-24(s0)
    80005478:	07c1                	addi	a5,a5,16
    8000547a:	853e                	mv	a0,a5
    8000547c:	00001097          	auipc	ra,0x1
    80005480:	3da080e7          	jalr	986(ra) # 80006856 <releasesleep>
}
    80005484:	0001                	nop
    80005486:	60e2                	ld	ra,24(sp)
    80005488:	6442                	ld	s0,16(sp)
    8000548a:	6105                	addi	sp,sp,32
    8000548c:	8082                	ret

000000008000548e <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    8000548e:	1101                	addi	sp,sp,-32
    80005490:	ec06                	sd	ra,24(sp)
    80005492:	e822                	sd	s0,16(sp)
    80005494:	1000                	addi	s0,sp,32
    80005496:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    8000549a:	0002d517          	auipc	a0,0x2d
    8000549e:	c4650513          	addi	a0,a0,-954 # 800320e0 <itable>
    800054a2:	ffffc097          	auipc	ra,0xffffc
    800054a6:	e88080e7          	jalr	-376(ra) # 8000132a <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    800054aa:	fe843783          	ld	a5,-24(s0)
    800054ae:	479c                	lw	a5,8(a5)
    800054b0:	873e                	mv	a4,a5
    800054b2:	4785                	li	a5,1
    800054b4:	06f71f63          	bne	a4,a5,80005532 <iput+0xa4>
    800054b8:	fe843783          	ld	a5,-24(s0)
    800054bc:	43bc                	lw	a5,64(a5)
    800054be:	cbb5                	beqz	a5,80005532 <iput+0xa4>
    800054c0:	fe843783          	ld	a5,-24(s0)
    800054c4:	04a79783          	lh	a5,74(a5)
    800054c8:	e7ad                	bnez	a5,80005532 <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800054ca:	fe843783          	ld	a5,-24(s0)
    800054ce:	07c1                	addi	a5,a5,16
    800054d0:	853e                	mv	a0,a5
    800054d2:	00001097          	auipc	ra,0x1
    800054d6:	316080e7          	jalr	790(ra) # 800067e8 <acquiresleep>

    release(&itable.lock);
    800054da:	0002d517          	auipc	a0,0x2d
    800054de:	c0650513          	addi	a0,a0,-1018 # 800320e0 <itable>
    800054e2:	ffffc097          	auipc	ra,0xffffc
    800054e6:	eac080e7          	jalr	-340(ra) # 8000138e <release>

    itrunc(ip);
    800054ea:	fe843503          	ld	a0,-24(s0)
    800054ee:	00000097          	auipc	ra,0x0
    800054f2:	21a080e7          	jalr	538(ra) # 80005708 <itrunc>
    ip->type = 0;
    800054f6:	fe843783          	ld	a5,-24(s0)
    800054fa:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    800054fe:	fe843503          	ld	a0,-24(s0)
    80005502:	00000097          	auipc	ra,0x0
    80005506:	bae080e7          	jalr	-1106(ra) # 800050b0 <iupdate>
    ip->valid = 0;
    8000550a:	fe843783          	ld	a5,-24(s0)
    8000550e:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    80005512:	fe843783          	ld	a5,-24(s0)
    80005516:	07c1                	addi	a5,a5,16
    80005518:	853e                	mv	a0,a5
    8000551a:	00001097          	auipc	ra,0x1
    8000551e:	33c080e7          	jalr	828(ra) # 80006856 <releasesleep>

    acquire(&itable.lock);
    80005522:	0002d517          	auipc	a0,0x2d
    80005526:	bbe50513          	addi	a0,a0,-1090 # 800320e0 <itable>
    8000552a:	ffffc097          	auipc	ra,0xffffc
    8000552e:	e00080e7          	jalr	-512(ra) # 8000132a <acquire>
  }

  ip->ref--;
    80005532:	fe843783          	ld	a5,-24(s0)
    80005536:	479c                	lw	a5,8(a5)
    80005538:	37fd                	addiw	a5,a5,-1
    8000553a:	0007871b          	sext.w	a4,a5
    8000553e:	fe843783          	ld	a5,-24(s0)
    80005542:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    80005544:	0002d517          	auipc	a0,0x2d
    80005548:	b9c50513          	addi	a0,a0,-1124 # 800320e0 <itable>
    8000554c:	ffffc097          	auipc	ra,0xffffc
    80005550:	e42080e7          	jalr	-446(ra) # 8000138e <release>
}
    80005554:	0001                	nop
    80005556:	60e2                	ld	ra,24(sp)
    80005558:	6442                	ld	s0,16(sp)
    8000555a:	6105                	addi	sp,sp,32
    8000555c:	8082                	ret

000000008000555e <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    8000555e:	1101                	addi	sp,sp,-32
    80005560:	ec06                	sd	ra,24(sp)
    80005562:	e822                	sd	s0,16(sp)
    80005564:	1000                	addi	s0,sp,32
    80005566:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    8000556a:	fe843503          	ld	a0,-24(s0)
    8000556e:	00000097          	auipc	ra,0x0
    80005572:	ec6080e7          	jalr	-314(ra) # 80005434 <iunlock>
  iput(ip);
    80005576:	fe843503          	ld	a0,-24(s0)
    8000557a:	00000097          	auipc	ra,0x0
    8000557e:	f14080e7          	jalr	-236(ra) # 8000548e <iput>
}
    80005582:	0001                	nop
    80005584:	60e2                	ld	ra,24(sp)
    80005586:	6442                	ld	s0,16(sp)
    80005588:	6105                	addi	sp,sp,32
    8000558a:	8082                	ret

000000008000558c <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    8000558c:	7139                	addi	sp,sp,-64
    8000558e:	fc06                	sd	ra,56(sp)
    80005590:	f822                	sd	s0,48(sp)
    80005592:	0080                	addi	s0,sp,64
    80005594:	fca43423          	sd	a0,-56(s0)
    80005598:	87ae                	mv	a5,a1
    8000559a:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    8000559e:	fc442783          	lw	a5,-60(s0)
    800055a2:	0007871b          	sext.w	a4,a5
    800055a6:	47ad                	li	a5,11
    800055a8:	04e7ee63          	bltu	a5,a4,80005604 <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    800055ac:	fc843703          	ld	a4,-56(s0)
    800055b0:	fc446783          	lwu	a5,-60(s0)
    800055b4:	07d1                	addi	a5,a5,20
    800055b6:	078a                	slli	a5,a5,0x2
    800055b8:	97ba                	add	a5,a5,a4
    800055ba:	439c                	lw	a5,0(a5)
    800055bc:	fef42623          	sw	a5,-20(s0)
    800055c0:	fec42783          	lw	a5,-20(s0)
    800055c4:	2781                	sext.w	a5,a5
    800055c6:	ef85                	bnez	a5,800055fe <bmap+0x72>
      addr = balloc(ip->dev);
    800055c8:	fc843783          	ld	a5,-56(s0)
    800055cc:	439c                	lw	a5,0(a5)
    800055ce:	853e                	mv	a0,a5
    800055d0:	fffff097          	auipc	ra,0xfffff
    800055d4:	68e080e7          	jalr	1678(ra) # 80004c5e <balloc>
    800055d8:	87aa                	mv	a5,a0
    800055da:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800055de:	fec42783          	lw	a5,-20(s0)
    800055e2:	2781                	sext.w	a5,a5
    800055e4:	e399                	bnez	a5,800055ea <bmap+0x5e>
        return 0;
    800055e6:	4781                	li	a5,0
    800055e8:	aa19                	j	800056fe <bmap+0x172>
      ip->addrs[bn] = addr;
    800055ea:	fc843703          	ld	a4,-56(s0)
    800055ee:	fc446783          	lwu	a5,-60(s0)
    800055f2:	07d1                	addi	a5,a5,20
    800055f4:	078a                	slli	a5,a5,0x2
    800055f6:	97ba                	add	a5,a5,a4
    800055f8:	fec42703          	lw	a4,-20(s0)
    800055fc:	c398                	sw	a4,0(a5)
    }
    return addr;
    800055fe:	fec42783          	lw	a5,-20(s0)
    80005602:	a8f5                	j	800056fe <bmap+0x172>
  }
  bn -= NDIRECT;
    80005604:	fc442783          	lw	a5,-60(s0)
    80005608:	37d1                	addiw	a5,a5,-12
    8000560a:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    8000560e:	fc442783          	lw	a5,-60(s0)
    80005612:	0007871b          	sext.w	a4,a5
    80005616:	0ff00793          	li	a5,255
    8000561a:	0ce7ea63          	bltu	a5,a4,800056ee <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    8000561e:	fc843783          	ld	a5,-56(s0)
    80005622:	0807a783          	lw	a5,128(a5)
    80005626:	fef42623          	sw	a5,-20(s0)
    8000562a:	fec42783          	lw	a5,-20(s0)
    8000562e:	2781                	sext.w	a5,a5
    80005630:	eb85                	bnez	a5,80005660 <bmap+0xd4>
      addr = balloc(ip->dev);
    80005632:	fc843783          	ld	a5,-56(s0)
    80005636:	439c                	lw	a5,0(a5)
    80005638:	853e                	mv	a0,a5
    8000563a:	fffff097          	auipc	ra,0xfffff
    8000563e:	624080e7          	jalr	1572(ra) # 80004c5e <balloc>
    80005642:	87aa                	mv	a5,a0
    80005644:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005648:	fec42783          	lw	a5,-20(s0)
    8000564c:	2781                	sext.w	a5,a5
    8000564e:	e399                	bnez	a5,80005654 <bmap+0xc8>
        return 0;
    80005650:	4781                	li	a5,0
    80005652:	a075                	j	800056fe <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    80005654:	fc843783          	ld	a5,-56(s0)
    80005658:	fec42703          	lw	a4,-20(s0)
    8000565c:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005660:	fc843783          	ld	a5,-56(s0)
    80005664:	439c                	lw	a5,0(a5)
    80005666:	fec42703          	lw	a4,-20(s0)
    8000566a:	85ba                	mv	a1,a4
    8000566c:	853e                	mv	a0,a5
    8000566e:	fffff097          	auipc	ra,0xfffff
    80005672:	29e080e7          	jalr	670(ra) # 8000490c <bread>
    80005676:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    8000567a:	fe043783          	ld	a5,-32(s0)
    8000567e:	05878793          	addi	a5,a5,88
    80005682:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    80005686:	fc446783          	lwu	a5,-60(s0)
    8000568a:	078a                	slli	a5,a5,0x2
    8000568c:	fd843703          	ld	a4,-40(s0)
    80005690:	97ba                	add	a5,a5,a4
    80005692:	439c                	lw	a5,0(a5)
    80005694:	fef42623          	sw	a5,-20(s0)
    80005698:	fec42783          	lw	a5,-20(s0)
    8000569c:	2781                	sext.w	a5,a5
    8000569e:	ef9d                	bnez	a5,800056dc <bmap+0x150>
      addr = balloc(ip->dev);
    800056a0:	fc843783          	ld	a5,-56(s0)
    800056a4:	439c                	lw	a5,0(a5)
    800056a6:	853e                	mv	a0,a5
    800056a8:	fffff097          	auipc	ra,0xfffff
    800056ac:	5b6080e7          	jalr	1462(ra) # 80004c5e <balloc>
    800056b0:	87aa                	mv	a5,a0
    800056b2:	fef42623          	sw	a5,-20(s0)
      if(addr){
    800056b6:	fec42783          	lw	a5,-20(s0)
    800056ba:	2781                	sext.w	a5,a5
    800056bc:	c385                	beqz	a5,800056dc <bmap+0x150>
        a[bn] = addr;
    800056be:	fc446783          	lwu	a5,-60(s0)
    800056c2:	078a                	slli	a5,a5,0x2
    800056c4:	fd843703          	ld	a4,-40(s0)
    800056c8:	97ba                	add	a5,a5,a4
    800056ca:	fec42703          	lw	a4,-20(s0)
    800056ce:	c398                	sw	a4,0(a5)
        log_write(bp);
    800056d0:	fe043503          	ld	a0,-32(s0)
    800056d4:	00001097          	auipc	ra,0x1
    800056d8:	f94080e7          	jalr	-108(ra) # 80006668 <log_write>
      }
    }
    brelse(bp);
    800056dc:	fe043503          	ld	a0,-32(s0)
    800056e0:	fffff097          	auipc	ra,0xfffff
    800056e4:	2d6080e7          	jalr	726(ra) # 800049b6 <brelse>
    return addr;
    800056e8:	fec42783          	lw	a5,-20(s0)
    800056ec:	a809                	j	800056fe <bmap+0x172>
  }

  panic("bmap: out of range");
    800056ee:	00006517          	auipc	a0,0x6
    800056f2:	e1a50513          	addi	a0,a0,-486 # 8000b508 <etext+0x508>
    800056f6:	ffffb097          	auipc	ra,0xffffb
    800056fa:	596080e7          	jalr	1430(ra) # 80000c8c <panic>
}
    800056fe:	853e                	mv	a0,a5
    80005700:	70e2                	ld	ra,56(sp)
    80005702:	7442                	ld	s0,48(sp)
    80005704:	6121                	addi	sp,sp,64
    80005706:	8082                	ret

0000000080005708 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    80005708:	7139                	addi	sp,sp,-64
    8000570a:	fc06                	sd	ra,56(sp)
    8000570c:	f822                	sd	s0,48(sp)
    8000570e:	0080                	addi	s0,sp,64
    80005710:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    80005714:	fe042623          	sw	zero,-20(s0)
    80005718:	a899                	j	8000576e <itrunc+0x66>
    if(ip->addrs[i]){
    8000571a:	fc843703          	ld	a4,-56(s0)
    8000571e:	fec42783          	lw	a5,-20(s0)
    80005722:	07d1                	addi	a5,a5,20
    80005724:	078a                	slli	a5,a5,0x2
    80005726:	97ba                	add	a5,a5,a4
    80005728:	439c                	lw	a5,0(a5)
    8000572a:	cf8d                	beqz	a5,80005764 <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    8000572c:	fc843783          	ld	a5,-56(s0)
    80005730:	439c                	lw	a5,0(a5)
    80005732:	0007869b          	sext.w	a3,a5
    80005736:	fc843703          	ld	a4,-56(s0)
    8000573a:	fec42783          	lw	a5,-20(s0)
    8000573e:	07d1                	addi	a5,a5,20
    80005740:	078a                	slli	a5,a5,0x2
    80005742:	97ba                	add	a5,a5,a4
    80005744:	439c                	lw	a5,0(a5)
    80005746:	85be                	mv	a1,a5
    80005748:	8536                	mv	a0,a3
    8000574a:	fffff097          	auipc	ra,0xfffff
    8000574e:	6c4080e7          	jalr	1732(ra) # 80004e0e <bfree>
      ip->addrs[i] = 0;
    80005752:	fc843703          	ld	a4,-56(s0)
    80005756:	fec42783          	lw	a5,-20(s0)
    8000575a:	07d1                	addi	a5,a5,20
    8000575c:	078a                	slli	a5,a5,0x2
    8000575e:	97ba                	add	a5,a5,a4
    80005760:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    80005764:	fec42783          	lw	a5,-20(s0)
    80005768:	2785                	addiw	a5,a5,1
    8000576a:	fef42623          	sw	a5,-20(s0)
    8000576e:	fec42783          	lw	a5,-20(s0)
    80005772:	0007871b          	sext.w	a4,a5
    80005776:	47ad                	li	a5,11
    80005778:	fae7d1e3          	bge	a5,a4,8000571a <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    8000577c:	fc843783          	ld	a5,-56(s0)
    80005780:	0807a783          	lw	a5,128(a5)
    80005784:	cbc5                	beqz	a5,80005834 <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    80005786:	fc843783          	ld	a5,-56(s0)
    8000578a:	4398                	lw	a4,0(a5)
    8000578c:	fc843783          	ld	a5,-56(s0)
    80005790:	0807a783          	lw	a5,128(a5)
    80005794:	85be                	mv	a1,a5
    80005796:	853a                	mv	a0,a4
    80005798:	fffff097          	auipc	ra,0xfffff
    8000579c:	174080e7          	jalr	372(ra) # 8000490c <bread>
    800057a0:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    800057a4:	fe043783          	ld	a5,-32(s0)
    800057a8:	05878793          	addi	a5,a5,88
    800057ac:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    800057b0:	fe042423          	sw	zero,-24(s0)
    800057b4:	a081                	j	800057f4 <itrunc+0xec>
      if(a[j])
    800057b6:	fe842783          	lw	a5,-24(s0)
    800057ba:	078a                	slli	a5,a5,0x2
    800057bc:	fd843703          	ld	a4,-40(s0)
    800057c0:	97ba                	add	a5,a5,a4
    800057c2:	439c                	lw	a5,0(a5)
    800057c4:	c39d                	beqz	a5,800057ea <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800057c6:	fc843783          	ld	a5,-56(s0)
    800057ca:	439c                	lw	a5,0(a5)
    800057cc:	0007869b          	sext.w	a3,a5
    800057d0:	fe842783          	lw	a5,-24(s0)
    800057d4:	078a                	slli	a5,a5,0x2
    800057d6:	fd843703          	ld	a4,-40(s0)
    800057da:	97ba                	add	a5,a5,a4
    800057dc:	439c                	lw	a5,0(a5)
    800057de:	85be                	mv	a1,a5
    800057e0:	8536                	mv	a0,a3
    800057e2:	fffff097          	auipc	ra,0xfffff
    800057e6:	62c080e7          	jalr	1580(ra) # 80004e0e <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800057ea:	fe842783          	lw	a5,-24(s0)
    800057ee:	2785                	addiw	a5,a5,1
    800057f0:	fef42423          	sw	a5,-24(s0)
    800057f4:	fe842783          	lw	a5,-24(s0)
    800057f8:	873e                	mv	a4,a5
    800057fa:	0ff00793          	li	a5,255
    800057fe:	fae7fce3          	bgeu	a5,a4,800057b6 <itrunc+0xae>
    }
    brelse(bp);
    80005802:	fe043503          	ld	a0,-32(s0)
    80005806:	fffff097          	auipc	ra,0xfffff
    8000580a:	1b0080e7          	jalr	432(ra) # 800049b6 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    8000580e:	fc843783          	ld	a5,-56(s0)
    80005812:	439c                	lw	a5,0(a5)
    80005814:	0007871b          	sext.w	a4,a5
    80005818:	fc843783          	ld	a5,-56(s0)
    8000581c:	0807a783          	lw	a5,128(a5)
    80005820:	85be                	mv	a1,a5
    80005822:	853a                	mv	a0,a4
    80005824:	fffff097          	auipc	ra,0xfffff
    80005828:	5ea080e7          	jalr	1514(ra) # 80004e0e <bfree>
    ip->addrs[NDIRECT] = 0;
    8000582c:	fc843783          	ld	a5,-56(s0)
    80005830:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    80005834:	fc843783          	ld	a5,-56(s0)
    80005838:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    8000583c:	fc843503          	ld	a0,-56(s0)
    80005840:	00000097          	auipc	ra,0x0
    80005844:	870080e7          	jalr	-1936(ra) # 800050b0 <iupdate>
}
    80005848:	0001                	nop
    8000584a:	70e2                	ld	ra,56(sp)
    8000584c:	7442                	ld	s0,48(sp)
    8000584e:	6121                	addi	sp,sp,64
    80005850:	8082                	ret

0000000080005852 <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    80005852:	1101                	addi	sp,sp,-32
    80005854:	ec22                	sd	s0,24(sp)
    80005856:	1000                	addi	s0,sp,32
    80005858:	fea43423          	sd	a0,-24(s0)
    8000585c:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005860:	fe843783          	ld	a5,-24(s0)
    80005864:	439c                	lw	a5,0(a5)
    80005866:	0007871b          	sext.w	a4,a5
    8000586a:	fe043783          	ld	a5,-32(s0)
    8000586e:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005870:	fe843783          	ld	a5,-24(s0)
    80005874:	43d8                	lw	a4,4(a5)
    80005876:	fe043783          	ld	a5,-32(s0)
    8000587a:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    8000587c:	fe843783          	ld	a5,-24(s0)
    80005880:	04479703          	lh	a4,68(a5)
    80005884:	fe043783          	ld	a5,-32(s0)
    80005888:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    8000588c:	fe843783          	ld	a5,-24(s0)
    80005890:	04a79703          	lh	a4,74(a5)
    80005894:	fe043783          	ld	a5,-32(s0)
    80005898:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    8000589c:	fe843783          	ld	a5,-24(s0)
    800058a0:	47fc                	lw	a5,76(a5)
    800058a2:	02079713          	slli	a4,a5,0x20
    800058a6:	9301                	srli	a4,a4,0x20
    800058a8:	fe043783          	ld	a5,-32(s0)
    800058ac:	eb98                	sd	a4,16(a5)
}
    800058ae:	0001                	nop
    800058b0:	6462                	ld	s0,24(sp)
    800058b2:	6105                	addi	sp,sp,32
    800058b4:	8082                	ret

00000000800058b6 <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    800058b6:	715d                	addi	sp,sp,-80
    800058b8:	e486                	sd	ra,72(sp)
    800058ba:	e0a2                	sd	s0,64(sp)
    800058bc:	0880                	addi	s0,sp,80
    800058be:	fca43423          	sd	a0,-56(s0)
    800058c2:	87ae                	mv	a5,a1
    800058c4:	fac43c23          	sd	a2,-72(s0)
    800058c8:	fcf42223          	sw	a5,-60(s0)
    800058cc:	87b6                	mv	a5,a3
    800058ce:	fcf42023          	sw	a5,-64(s0)
    800058d2:	87ba                	mv	a5,a4
    800058d4:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800058d8:	fc843783          	ld	a5,-56(s0)
    800058dc:	47f8                	lw	a4,76(a5)
    800058de:	fc042783          	lw	a5,-64(s0)
    800058e2:	2781                	sext.w	a5,a5
    800058e4:	00f76e63          	bltu	a4,a5,80005900 <readi+0x4a>
    800058e8:	fc042703          	lw	a4,-64(s0)
    800058ec:	fb442783          	lw	a5,-76(s0)
    800058f0:	9fb9                	addw	a5,a5,a4
    800058f2:	0007871b          	sext.w	a4,a5
    800058f6:	fc042783          	lw	a5,-64(s0)
    800058fa:	2781                	sext.w	a5,a5
    800058fc:	00f77463          	bgeu	a4,a5,80005904 <readi+0x4e>
    return 0;
    80005900:	4781                	li	a5,0
    80005902:	a289                	j	80005a44 <readi+0x18e>
  if(off + n > ip->size)
    80005904:	fc042703          	lw	a4,-64(s0)
    80005908:	fb442783          	lw	a5,-76(s0)
    8000590c:	9fb9                	addw	a5,a5,a4
    8000590e:	0007871b          	sext.w	a4,a5
    80005912:	fc843783          	ld	a5,-56(s0)
    80005916:	47fc                	lw	a5,76(a5)
    80005918:	00e7fb63          	bgeu	a5,a4,8000592e <readi+0x78>
    n = ip->size - off;
    8000591c:	fc843783          	ld	a5,-56(s0)
    80005920:	47f8                	lw	a4,76(a5)
    80005922:	fc042783          	lw	a5,-64(s0)
    80005926:	40f707bb          	subw	a5,a4,a5
    8000592a:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    8000592e:	fe042623          	sw	zero,-20(s0)
    80005932:	a8ed                	j	80005a2c <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    80005934:	fc042783          	lw	a5,-64(s0)
    80005938:	00a7d79b          	srliw	a5,a5,0xa
    8000593c:	2781                	sext.w	a5,a5
    8000593e:	85be                	mv	a1,a5
    80005940:	fc843503          	ld	a0,-56(s0)
    80005944:	00000097          	auipc	ra,0x0
    80005948:	c48080e7          	jalr	-952(ra) # 8000558c <bmap>
    8000594c:	87aa                	mv	a5,a0
    8000594e:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005952:	fe842783          	lw	a5,-24(s0)
    80005956:	2781                	sext.w	a5,a5
    80005958:	c3fd                	beqz	a5,80005a3e <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    8000595a:	fc843783          	ld	a5,-56(s0)
    8000595e:	439c                	lw	a5,0(a5)
    80005960:	fe842703          	lw	a4,-24(s0)
    80005964:	85ba                	mv	a1,a4
    80005966:	853e                	mv	a0,a5
    80005968:	fffff097          	auipc	ra,0xfffff
    8000596c:	fa4080e7          	jalr	-92(ra) # 8000490c <bread>
    80005970:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005974:	fc042783          	lw	a5,-64(s0)
    80005978:	3ff7f793          	andi	a5,a5,1023
    8000597c:	2781                	sext.w	a5,a5
    8000597e:	40000713          	li	a4,1024
    80005982:	40f707bb          	subw	a5,a4,a5
    80005986:	0007869b          	sext.w	a3,a5
    8000598a:	fb442703          	lw	a4,-76(s0)
    8000598e:	fec42783          	lw	a5,-20(s0)
    80005992:	40f707bb          	subw	a5,a4,a5
    80005996:	2781                	sext.w	a5,a5
    80005998:	863e                	mv	a2,a5
    8000599a:	87b6                	mv	a5,a3
    8000599c:	0007869b          	sext.w	a3,a5
    800059a0:	0006071b          	sext.w	a4,a2
    800059a4:	00d77363          	bgeu	a4,a3,800059aa <readi+0xf4>
    800059a8:	87b2                	mv	a5,a2
    800059aa:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    800059ae:	fe043783          	ld	a5,-32(s0)
    800059b2:	05878713          	addi	a4,a5,88
    800059b6:	fc046783          	lwu	a5,-64(s0)
    800059ba:	3ff7f793          	andi	a5,a5,1023
    800059be:	973e                	add	a4,a4,a5
    800059c0:	fdc46683          	lwu	a3,-36(s0)
    800059c4:	fc442783          	lw	a5,-60(s0)
    800059c8:	863a                	mv	a2,a4
    800059ca:	fb843583          	ld	a1,-72(s0)
    800059ce:	853e                	mv	a0,a5
    800059d0:	ffffe097          	auipc	ra,0xffffe
    800059d4:	eda080e7          	jalr	-294(ra) # 800038aa <either_copyout>
    800059d8:	87aa                	mv	a5,a0
    800059da:	873e                	mv	a4,a5
    800059dc:	57fd                	li	a5,-1
    800059de:	00f71c63          	bne	a4,a5,800059f6 <readi+0x140>
      brelse(bp);
    800059e2:	fe043503          	ld	a0,-32(s0)
    800059e6:	fffff097          	auipc	ra,0xfffff
    800059ea:	fd0080e7          	jalr	-48(ra) # 800049b6 <brelse>
      tot = -1;
    800059ee:	57fd                	li	a5,-1
    800059f0:	fef42623          	sw	a5,-20(s0)
      break;
    800059f4:	a0b1                	j	80005a40 <readi+0x18a>
    }
    brelse(bp);
    800059f6:	fe043503          	ld	a0,-32(s0)
    800059fa:	fffff097          	auipc	ra,0xfffff
    800059fe:	fbc080e7          	jalr	-68(ra) # 800049b6 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005a02:	fec42703          	lw	a4,-20(s0)
    80005a06:	fdc42783          	lw	a5,-36(s0)
    80005a0a:	9fb9                	addw	a5,a5,a4
    80005a0c:	fef42623          	sw	a5,-20(s0)
    80005a10:	fc042703          	lw	a4,-64(s0)
    80005a14:	fdc42783          	lw	a5,-36(s0)
    80005a18:	9fb9                	addw	a5,a5,a4
    80005a1a:	fcf42023          	sw	a5,-64(s0)
    80005a1e:	fdc46783          	lwu	a5,-36(s0)
    80005a22:	fb843703          	ld	a4,-72(s0)
    80005a26:	97ba                	add	a5,a5,a4
    80005a28:	faf43c23          	sd	a5,-72(s0)
    80005a2c:	fec42703          	lw	a4,-20(s0)
    80005a30:	fb442783          	lw	a5,-76(s0)
    80005a34:	2701                	sext.w	a4,a4
    80005a36:	2781                	sext.w	a5,a5
    80005a38:	eef76ee3          	bltu	a4,a5,80005934 <readi+0x7e>
    80005a3c:	a011                	j	80005a40 <readi+0x18a>
      break;
    80005a3e:	0001                	nop
  }
  return tot;
    80005a40:	fec42783          	lw	a5,-20(s0)
}
    80005a44:	853e                	mv	a0,a5
    80005a46:	60a6                	ld	ra,72(sp)
    80005a48:	6406                	ld	s0,64(sp)
    80005a4a:	6161                	addi	sp,sp,80
    80005a4c:	8082                	ret

0000000080005a4e <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005a4e:	715d                	addi	sp,sp,-80
    80005a50:	e486                	sd	ra,72(sp)
    80005a52:	e0a2                	sd	s0,64(sp)
    80005a54:	0880                	addi	s0,sp,80
    80005a56:	fca43423          	sd	a0,-56(s0)
    80005a5a:	87ae                	mv	a5,a1
    80005a5c:	fac43c23          	sd	a2,-72(s0)
    80005a60:	fcf42223          	sw	a5,-60(s0)
    80005a64:	87b6                	mv	a5,a3
    80005a66:	fcf42023          	sw	a5,-64(s0)
    80005a6a:	87ba                	mv	a5,a4
    80005a6c:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005a70:	fc843783          	ld	a5,-56(s0)
    80005a74:	47f8                	lw	a4,76(a5)
    80005a76:	fc042783          	lw	a5,-64(s0)
    80005a7a:	2781                	sext.w	a5,a5
    80005a7c:	00f76e63          	bltu	a4,a5,80005a98 <writei+0x4a>
    80005a80:	fc042703          	lw	a4,-64(s0)
    80005a84:	fb442783          	lw	a5,-76(s0)
    80005a88:	9fb9                	addw	a5,a5,a4
    80005a8a:	0007871b          	sext.w	a4,a5
    80005a8e:	fc042783          	lw	a5,-64(s0)
    80005a92:	2781                	sext.w	a5,a5
    80005a94:	00f77463          	bgeu	a4,a5,80005a9c <writei+0x4e>
    return -1;
    80005a98:	57fd                	li	a5,-1
    80005a9a:	aab9                	j	80005bf8 <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005a9c:	fc042703          	lw	a4,-64(s0)
    80005aa0:	fb442783          	lw	a5,-76(s0)
    80005aa4:	9fb9                	addw	a5,a5,a4
    80005aa6:	2781                	sext.w	a5,a5
    80005aa8:	873e                	mv	a4,a5
    80005aaa:	000437b7          	lui	a5,0x43
    80005aae:	00e7f463          	bgeu	a5,a4,80005ab6 <writei+0x68>
    return -1;
    80005ab2:	57fd                	li	a5,-1
    80005ab4:	a291                	j	80005bf8 <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005ab6:	fe042623          	sw	zero,-20(s0)
    80005aba:	a201                	j	80005bba <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005abc:	fc042783          	lw	a5,-64(s0)
    80005ac0:	00a7d79b          	srliw	a5,a5,0xa
    80005ac4:	2781                	sext.w	a5,a5
    80005ac6:	85be                	mv	a1,a5
    80005ac8:	fc843503          	ld	a0,-56(s0)
    80005acc:	00000097          	auipc	ra,0x0
    80005ad0:	ac0080e7          	jalr	-1344(ra) # 8000558c <bmap>
    80005ad4:	87aa                	mv	a5,a0
    80005ad6:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005ada:	fe842783          	lw	a5,-24(s0)
    80005ade:	2781                	sext.w	a5,a5
    80005ae0:	c7f5                	beqz	a5,80005bcc <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005ae2:	fc843783          	ld	a5,-56(s0)
    80005ae6:	439c                	lw	a5,0(a5)
    80005ae8:	fe842703          	lw	a4,-24(s0)
    80005aec:	85ba                	mv	a1,a4
    80005aee:	853e                	mv	a0,a5
    80005af0:	fffff097          	auipc	ra,0xfffff
    80005af4:	e1c080e7          	jalr	-484(ra) # 8000490c <bread>
    80005af8:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005afc:	fc042783          	lw	a5,-64(s0)
    80005b00:	3ff7f793          	andi	a5,a5,1023
    80005b04:	2781                	sext.w	a5,a5
    80005b06:	40000713          	li	a4,1024
    80005b0a:	40f707bb          	subw	a5,a4,a5
    80005b0e:	0007869b          	sext.w	a3,a5
    80005b12:	fb442703          	lw	a4,-76(s0)
    80005b16:	fec42783          	lw	a5,-20(s0)
    80005b1a:	40f707bb          	subw	a5,a4,a5
    80005b1e:	2781                	sext.w	a5,a5
    80005b20:	863e                	mv	a2,a5
    80005b22:	87b6                	mv	a5,a3
    80005b24:	0007869b          	sext.w	a3,a5
    80005b28:	0006071b          	sext.w	a4,a2
    80005b2c:	00d77363          	bgeu	a4,a3,80005b32 <writei+0xe4>
    80005b30:	87b2                	mv	a5,a2
    80005b32:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005b36:	fe043783          	ld	a5,-32(s0)
    80005b3a:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005b3e:	fc046783          	lwu	a5,-64(s0)
    80005b42:	3ff7f793          	andi	a5,a5,1023
    80005b46:	97ba                	add	a5,a5,a4
    80005b48:	fdc46683          	lwu	a3,-36(s0)
    80005b4c:	fc442703          	lw	a4,-60(s0)
    80005b50:	fb843603          	ld	a2,-72(s0)
    80005b54:	85ba                	mv	a1,a4
    80005b56:	853e                	mv	a0,a5
    80005b58:	ffffe097          	auipc	ra,0xffffe
    80005b5c:	dc6080e7          	jalr	-570(ra) # 8000391e <either_copyin>
    80005b60:	87aa                	mv	a5,a0
    80005b62:	873e                	mv	a4,a5
    80005b64:	57fd                	li	a5,-1
    80005b66:	00f71963          	bne	a4,a5,80005b78 <writei+0x12a>
      brelse(bp);
    80005b6a:	fe043503          	ld	a0,-32(s0)
    80005b6e:	fffff097          	auipc	ra,0xfffff
    80005b72:	e48080e7          	jalr	-440(ra) # 800049b6 <brelse>
      break;
    80005b76:	a8a1                	j	80005bce <writei+0x180>
    }
    log_write(bp);
    80005b78:	fe043503          	ld	a0,-32(s0)
    80005b7c:	00001097          	auipc	ra,0x1
    80005b80:	aec080e7          	jalr	-1300(ra) # 80006668 <log_write>
    brelse(bp);
    80005b84:	fe043503          	ld	a0,-32(s0)
    80005b88:	fffff097          	auipc	ra,0xfffff
    80005b8c:	e2e080e7          	jalr	-466(ra) # 800049b6 <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005b90:	fec42703          	lw	a4,-20(s0)
    80005b94:	fdc42783          	lw	a5,-36(s0)
    80005b98:	9fb9                	addw	a5,a5,a4
    80005b9a:	fef42623          	sw	a5,-20(s0)
    80005b9e:	fc042703          	lw	a4,-64(s0)
    80005ba2:	fdc42783          	lw	a5,-36(s0)
    80005ba6:	9fb9                	addw	a5,a5,a4
    80005ba8:	fcf42023          	sw	a5,-64(s0)
    80005bac:	fdc46783          	lwu	a5,-36(s0)
    80005bb0:	fb843703          	ld	a4,-72(s0)
    80005bb4:	97ba                	add	a5,a5,a4
    80005bb6:	faf43c23          	sd	a5,-72(s0)
    80005bba:	fec42703          	lw	a4,-20(s0)
    80005bbe:	fb442783          	lw	a5,-76(s0)
    80005bc2:	2701                	sext.w	a4,a4
    80005bc4:	2781                	sext.w	a5,a5
    80005bc6:	eef76be3          	bltu	a4,a5,80005abc <writei+0x6e>
    80005bca:	a011                	j	80005bce <writei+0x180>
      break;
    80005bcc:	0001                	nop
  }

  if(off > ip->size)
    80005bce:	fc843783          	ld	a5,-56(s0)
    80005bd2:	47f8                	lw	a4,76(a5)
    80005bd4:	fc042783          	lw	a5,-64(s0)
    80005bd8:	2781                	sext.w	a5,a5
    80005bda:	00f77763          	bgeu	a4,a5,80005be8 <writei+0x19a>
    ip->size = off;
    80005bde:	fc843783          	ld	a5,-56(s0)
    80005be2:	fc042703          	lw	a4,-64(s0)
    80005be6:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005be8:	fc843503          	ld	a0,-56(s0)
    80005bec:	fffff097          	auipc	ra,0xfffff
    80005bf0:	4c4080e7          	jalr	1220(ra) # 800050b0 <iupdate>

  return tot;
    80005bf4:	fec42783          	lw	a5,-20(s0)
}
    80005bf8:	853e                	mv	a0,a5
    80005bfa:	60a6                	ld	ra,72(sp)
    80005bfc:	6406                	ld	s0,64(sp)
    80005bfe:	6161                	addi	sp,sp,80
    80005c00:	8082                	ret

0000000080005c02 <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005c02:	1101                	addi	sp,sp,-32
    80005c04:	ec06                	sd	ra,24(sp)
    80005c06:	e822                	sd	s0,16(sp)
    80005c08:	1000                	addi	s0,sp,32
    80005c0a:	fea43423          	sd	a0,-24(s0)
    80005c0e:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005c12:	4639                	li	a2,14
    80005c14:	fe043583          	ld	a1,-32(s0)
    80005c18:	fe843503          	ld	a0,-24(s0)
    80005c1c:	ffffc097          	auipc	ra,0xffffc
    80005c20:	ada080e7          	jalr	-1318(ra) # 800016f6 <strncmp>
    80005c24:	87aa                	mv	a5,a0
}
    80005c26:	853e                	mv	a0,a5
    80005c28:	60e2                	ld	ra,24(sp)
    80005c2a:	6442                	ld	s0,16(sp)
    80005c2c:	6105                	addi	sp,sp,32
    80005c2e:	8082                	ret

0000000080005c30 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005c30:	715d                	addi	sp,sp,-80
    80005c32:	e486                	sd	ra,72(sp)
    80005c34:	e0a2                	sd	s0,64(sp)
    80005c36:	0880                	addi	s0,sp,80
    80005c38:	fca43423          	sd	a0,-56(s0)
    80005c3c:	fcb43023          	sd	a1,-64(s0)
    80005c40:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005c44:	fc843783          	ld	a5,-56(s0)
    80005c48:	04479783          	lh	a5,68(a5)
    80005c4c:	0007871b          	sext.w	a4,a5
    80005c50:	4785                	li	a5,1
    80005c52:	00f70a63          	beq	a4,a5,80005c66 <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005c56:	00006517          	auipc	a0,0x6
    80005c5a:	8ca50513          	addi	a0,a0,-1846 # 8000b520 <etext+0x520>
    80005c5e:	ffffb097          	auipc	ra,0xffffb
    80005c62:	02e080e7          	jalr	46(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005c66:	fe042623          	sw	zero,-20(s0)
    80005c6a:	a849                	j	80005cfc <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005c6c:	fd840793          	addi	a5,s0,-40
    80005c70:	fec42683          	lw	a3,-20(s0)
    80005c74:	4741                	li	a4,16
    80005c76:	863e                	mv	a2,a5
    80005c78:	4581                	li	a1,0
    80005c7a:	fc843503          	ld	a0,-56(s0)
    80005c7e:	00000097          	auipc	ra,0x0
    80005c82:	c38080e7          	jalr	-968(ra) # 800058b6 <readi>
    80005c86:	87aa                	mv	a5,a0
    80005c88:	873e                	mv	a4,a5
    80005c8a:	47c1                	li	a5,16
    80005c8c:	00f70a63          	beq	a4,a5,80005ca0 <dirlookup+0x70>
      panic("dirlookup read");
    80005c90:	00006517          	auipc	a0,0x6
    80005c94:	8a850513          	addi	a0,a0,-1880 # 8000b538 <etext+0x538>
    80005c98:	ffffb097          	auipc	ra,0xffffb
    80005c9c:	ff4080e7          	jalr	-12(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005ca0:	fd845783          	lhu	a5,-40(s0)
    80005ca4:	c7b1                	beqz	a5,80005cf0 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005ca6:	fd840793          	addi	a5,s0,-40
    80005caa:	0789                	addi	a5,a5,2
    80005cac:	85be                	mv	a1,a5
    80005cae:	fc043503          	ld	a0,-64(s0)
    80005cb2:	00000097          	auipc	ra,0x0
    80005cb6:	f50080e7          	jalr	-176(ra) # 80005c02 <namecmp>
    80005cba:	87aa                	mv	a5,a0
    80005cbc:	eb9d                	bnez	a5,80005cf2 <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005cbe:	fb843783          	ld	a5,-72(s0)
    80005cc2:	c791                	beqz	a5,80005cce <dirlookup+0x9e>
        *poff = off;
    80005cc4:	fb843783          	ld	a5,-72(s0)
    80005cc8:	fec42703          	lw	a4,-20(s0)
    80005ccc:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005cce:	fd845783          	lhu	a5,-40(s0)
    80005cd2:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005cd6:	fc843783          	ld	a5,-56(s0)
    80005cda:	439c                	lw	a5,0(a5)
    80005cdc:	fe842703          	lw	a4,-24(s0)
    80005ce0:	85ba                	mv	a1,a4
    80005ce2:	853e                	mv	a0,a5
    80005ce4:	fffff097          	auipc	ra,0xfffff
    80005ce8:	4b4080e7          	jalr	1204(ra) # 80005198 <iget>
    80005cec:	87aa                	mv	a5,a0
    80005cee:	a005                	j	80005d0e <dirlookup+0xde>
      continue;
    80005cf0:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005cf2:	fec42783          	lw	a5,-20(s0)
    80005cf6:	27c1                	addiw	a5,a5,16
    80005cf8:	fef42623          	sw	a5,-20(s0)
    80005cfc:	fc843783          	ld	a5,-56(s0)
    80005d00:	47f8                	lw	a4,76(a5)
    80005d02:	fec42783          	lw	a5,-20(s0)
    80005d06:	2781                	sext.w	a5,a5
    80005d08:	f6e7e2e3          	bltu	a5,a4,80005c6c <dirlookup+0x3c>
    }
  }

  return 0;
    80005d0c:	4781                	li	a5,0
}
    80005d0e:	853e                	mv	a0,a5
    80005d10:	60a6                	ld	ra,72(sp)
    80005d12:	6406                	ld	s0,64(sp)
    80005d14:	6161                	addi	sp,sp,80
    80005d16:	8082                	ret

0000000080005d18 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005d18:	715d                	addi	sp,sp,-80
    80005d1a:	e486                	sd	ra,72(sp)
    80005d1c:	e0a2                	sd	s0,64(sp)
    80005d1e:	0880                	addi	s0,sp,80
    80005d20:	fca43423          	sd	a0,-56(s0)
    80005d24:	fcb43023          	sd	a1,-64(s0)
    80005d28:	87b2                	mv	a5,a2
    80005d2a:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005d2e:	4601                	li	a2,0
    80005d30:	fc043583          	ld	a1,-64(s0)
    80005d34:	fc843503          	ld	a0,-56(s0)
    80005d38:	00000097          	auipc	ra,0x0
    80005d3c:	ef8080e7          	jalr	-264(ra) # 80005c30 <dirlookup>
    80005d40:	fea43023          	sd	a0,-32(s0)
    80005d44:	fe043783          	ld	a5,-32(s0)
    80005d48:	cb89                	beqz	a5,80005d5a <dirlink+0x42>
    iput(ip);
    80005d4a:	fe043503          	ld	a0,-32(s0)
    80005d4e:	fffff097          	auipc	ra,0xfffff
    80005d52:	740080e7          	jalr	1856(ra) # 8000548e <iput>
    return -1;
    80005d56:	57fd                	li	a5,-1
    80005d58:	a075                	j	80005e04 <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d5a:	fe042623          	sw	zero,-20(s0)
    80005d5e:	a0a1                	j	80005da6 <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d60:	fd040793          	addi	a5,s0,-48
    80005d64:	fec42683          	lw	a3,-20(s0)
    80005d68:	4741                	li	a4,16
    80005d6a:	863e                	mv	a2,a5
    80005d6c:	4581                	li	a1,0
    80005d6e:	fc843503          	ld	a0,-56(s0)
    80005d72:	00000097          	auipc	ra,0x0
    80005d76:	b44080e7          	jalr	-1212(ra) # 800058b6 <readi>
    80005d7a:	87aa                	mv	a5,a0
    80005d7c:	873e                	mv	a4,a5
    80005d7e:	47c1                	li	a5,16
    80005d80:	00f70a63          	beq	a4,a5,80005d94 <dirlink+0x7c>
      panic("dirlink read");
    80005d84:	00005517          	auipc	a0,0x5
    80005d88:	7c450513          	addi	a0,a0,1988 # 8000b548 <etext+0x548>
    80005d8c:	ffffb097          	auipc	ra,0xffffb
    80005d90:	f00080e7          	jalr	-256(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005d94:	fd045783          	lhu	a5,-48(s0)
    80005d98:	cf99                	beqz	a5,80005db6 <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d9a:	fec42783          	lw	a5,-20(s0)
    80005d9e:	27c1                	addiw	a5,a5,16
    80005da0:	2781                	sext.w	a5,a5
    80005da2:	fef42623          	sw	a5,-20(s0)
    80005da6:	fc843783          	ld	a5,-56(s0)
    80005daa:	47f8                	lw	a4,76(a5)
    80005dac:	fec42783          	lw	a5,-20(s0)
    80005db0:	fae7e8e3          	bltu	a5,a4,80005d60 <dirlink+0x48>
    80005db4:	a011                	j	80005db8 <dirlink+0xa0>
      break;
    80005db6:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005db8:	fd040793          	addi	a5,s0,-48
    80005dbc:	0789                	addi	a5,a5,2
    80005dbe:	4639                	li	a2,14
    80005dc0:	fc043583          	ld	a1,-64(s0)
    80005dc4:	853e                	mv	a0,a5
    80005dc6:	ffffc097          	auipc	ra,0xffffc
    80005dca:	9ba080e7          	jalr	-1606(ra) # 80001780 <strncpy>
  de.inum = inum;
    80005dce:	fbc42783          	lw	a5,-68(s0)
    80005dd2:	17c2                	slli	a5,a5,0x30
    80005dd4:	93c1                	srli	a5,a5,0x30
    80005dd6:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005dda:	fd040793          	addi	a5,s0,-48
    80005dde:	fec42683          	lw	a3,-20(s0)
    80005de2:	4741                	li	a4,16
    80005de4:	863e                	mv	a2,a5
    80005de6:	4581                	li	a1,0
    80005de8:	fc843503          	ld	a0,-56(s0)
    80005dec:	00000097          	auipc	ra,0x0
    80005df0:	c62080e7          	jalr	-926(ra) # 80005a4e <writei>
    80005df4:	87aa                	mv	a5,a0
    80005df6:	873e                	mv	a4,a5
    80005df8:	47c1                	li	a5,16
    80005dfa:	00f70463          	beq	a4,a5,80005e02 <dirlink+0xea>
    return -1;
    80005dfe:	57fd                	li	a5,-1
    80005e00:	a011                	j	80005e04 <dirlink+0xec>

  return 0;
    80005e02:	4781                	li	a5,0
}
    80005e04:	853e                	mv	a0,a5
    80005e06:	60a6                	ld	ra,72(sp)
    80005e08:	6406                	ld	s0,64(sp)
    80005e0a:	6161                	addi	sp,sp,80
    80005e0c:	8082                	ret

0000000080005e0e <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005e0e:	7179                	addi	sp,sp,-48
    80005e10:	f406                	sd	ra,40(sp)
    80005e12:	f022                	sd	s0,32(sp)
    80005e14:	1800                	addi	s0,sp,48
    80005e16:	fca43c23          	sd	a0,-40(s0)
    80005e1a:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005e1e:	a031                	j	80005e2a <skipelem+0x1c>
    path++;
    80005e20:	fd843783          	ld	a5,-40(s0)
    80005e24:	0785                	addi	a5,a5,1
    80005e26:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005e2a:	fd843783          	ld	a5,-40(s0)
    80005e2e:	0007c783          	lbu	a5,0(a5)
    80005e32:	873e                	mv	a4,a5
    80005e34:	02f00793          	li	a5,47
    80005e38:	fef704e3          	beq	a4,a5,80005e20 <skipelem+0x12>
  if(*path == 0)
    80005e3c:	fd843783          	ld	a5,-40(s0)
    80005e40:	0007c783          	lbu	a5,0(a5)
    80005e44:	e399                	bnez	a5,80005e4a <skipelem+0x3c>
    return 0;
    80005e46:	4781                	li	a5,0
    80005e48:	a06d                	j	80005ef2 <skipelem+0xe4>
  s = path;
    80005e4a:	fd843783          	ld	a5,-40(s0)
    80005e4e:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005e52:	a031                	j	80005e5e <skipelem+0x50>
    path++;
    80005e54:	fd843783          	ld	a5,-40(s0)
    80005e58:	0785                	addi	a5,a5,1
    80005e5a:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005e5e:	fd843783          	ld	a5,-40(s0)
    80005e62:	0007c783          	lbu	a5,0(a5)
    80005e66:	873e                	mv	a4,a5
    80005e68:	02f00793          	li	a5,47
    80005e6c:	00f70763          	beq	a4,a5,80005e7a <skipelem+0x6c>
    80005e70:	fd843783          	ld	a5,-40(s0)
    80005e74:	0007c783          	lbu	a5,0(a5)
    80005e78:	fff1                	bnez	a5,80005e54 <skipelem+0x46>
  len = path - s;
    80005e7a:	fd843703          	ld	a4,-40(s0)
    80005e7e:	fe843783          	ld	a5,-24(s0)
    80005e82:	40f707b3          	sub	a5,a4,a5
    80005e86:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005e8a:	fe442783          	lw	a5,-28(s0)
    80005e8e:	0007871b          	sext.w	a4,a5
    80005e92:	47b5                	li	a5,13
    80005e94:	00e7dc63          	bge	a5,a4,80005eac <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005e98:	4639                	li	a2,14
    80005e9a:	fe843583          	ld	a1,-24(s0)
    80005e9e:	fd043503          	ld	a0,-48(s0)
    80005ea2:	ffffb097          	auipc	ra,0xffffb
    80005ea6:	740080e7          	jalr	1856(ra) # 800015e2 <memmove>
    80005eaa:	a80d                	j	80005edc <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005eac:	fe442783          	lw	a5,-28(s0)
    80005eb0:	863e                	mv	a2,a5
    80005eb2:	fe843583          	ld	a1,-24(s0)
    80005eb6:	fd043503          	ld	a0,-48(s0)
    80005eba:	ffffb097          	auipc	ra,0xffffb
    80005ebe:	728080e7          	jalr	1832(ra) # 800015e2 <memmove>
    name[len] = 0;
    80005ec2:	fe442783          	lw	a5,-28(s0)
    80005ec6:	fd043703          	ld	a4,-48(s0)
    80005eca:	97ba                	add	a5,a5,a4
    80005ecc:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005ed0:	a031                	j	80005edc <skipelem+0xce>
    path++;
    80005ed2:	fd843783          	ld	a5,-40(s0)
    80005ed6:	0785                	addi	a5,a5,1
    80005ed8:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005edc:	fd843783          	ld	a5,-40(s0)
    80005ee0:	0007c783          	lbu	a5,0(a5)
    80005ee4:	873e                	mv	a4,a5
    80005ee6:	02f00793          	li	a5,47
    80005eea:	fef704e3          	beq	a4,a5,80005ed2 <skipelem+0xc4>
  return path;
    80005eee:	fd843783          	ld	a5,-40(s0)
}
    80005ef2:	853e                	mv	a0,a5
    80005ef4:	70a2                	ld	ra,40(sp)
    80005ef6:	7402                	ld	s0,32(sp)
    80005ef8:	6145                	addi	sp,sp,48
    80005efa:	8082                	ret

0000000080005efc <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005efc:	7139                	addi	sp,sp,-64
    80005efe:	fc06                	sd	ra,56(sp)
    80005f00:	f822                	sd	s0,48(sp)
    80005f02:	0080                	addi	s0,sp,64
    80005f04:	fca43c23          	sd	a0,-40(s0)
    80005f08:	87ae                	mv	a5,a1
    80005f0a:	fcc43423          	sd	a2,-56(s0)
    80005f0e:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005f12:	fd843783          	ld	a5,-40(s0)
    80005f16:	0007c783          	lbu	a5,0(a5)
    80005f1a:	873e                	mv	a4,a5
    80005f1c:	02f00793          	li	a5,47
    80005f20:	00f71b63          	bne	a4,a5,80005f36 <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    80005f24:	4585                	li	a1,1
    80005f26:	4505                	li	a0,1
    80005f28:	fffff097          	auipc	ra,0xfffff
    80005f2c:	270080e7          	jalr	624(ra) # 80005198 <iget>
    80005f30:	fea43423          	sd	a0,-24(s0)
    80005f34:	a84d                	j	80005fe6 <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    80005f36:	ffffd097          	auipc	ra,0xffffd
    80005f3a:	b64080e7          	jalr	-1180(ra) # 80002a9a <myproc>
    80005f3e:	87aa                	mv	a5,a0
    80005f40:	1507b783          	ld	a5,336(a5)
    80005f44:	853e                	mv	a0,a5
    80005f46:	fffff097          	auipc	ra,0xfffff
    80005f4a:	36e080e7          	jalr	878(ra) # 800052b4 <idup>
    80005f4e:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    80005f52:	a851                	j	80005fe6 <namex+0xea>
    ilock(ip);
    80005f54:	fe843503          	ld	a0,-24(s0)
    80005f58:	fffff097          	auipc	ra,0xfffff
    80005f5c:	3a8080e7          	jalr	936(ra) # 80005300 <ilock>
    if(ip->type != T_DIR){
    80005f60:	fe843783          	ld	a5,-24(s0)
    80005f64:	04479783          	lh	a5,68(a5)
    80005f68:	0007871b          	sext.w	a4,a5
    80005f6c:	4785                	li	a5,1
    80005f6e:	00f70a63          	beq	a4,a5,80005f82 <namex+0x86>
      iunlockput(ip);
    80005f72:	fe843503          	ld	a0,-24(s0)
    80005f76:	fffff097          	auipc	ra,0xfffff
    80005f7a:	5e8080e7          	jalr	1512(ra) # 8000555e <iunlockput>
      return 0;
    80005f7e:	4781                	li	a5,0
    80005f80:	a871                	j	8000601c <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    80005f82:	fd442783          	lw	a5,-44(s0)
    80005f86:	2781                	sext.w	a5,a5
    80005f88:	cf99                	beqz	a5,80005fa6 <namex+0xaa>
    80005f8a:	fd843783          	ld	a5,-40(s0)
    80005f8e:	0007c783          	lbu	a5,0(a5)
    80005f92:	eb91                	bnez	a5,80005fa6 <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    80005f94:	fe843503          	ld	a0,-24(s0)
    80005f98:	fffff097          	auipc	ra,0xfffff
    80005f9c:	49c080e7          	jalr	1180(ra) # 80005434 <iunlock>
      return ip;
    80005fa0:	fe843783          	ld	a5,-24(s0)
    80005fa4:	a8a5                	j	8000601c <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    80005fa6:	4601                	li	a2,0
    80005fa8:	fc843583          	ld	a1,-56(s0)
    80005fac:	fe843503          	ld	a0,-24(s0)
    80005fb0:	00000097          	auipc	ra,0x0
    80005fb4:	c80080e7          	jalr	-896(ra) # 80005c30 <dirlookup>
    80005fb8:	fea43023          	sd	a0,-32(s0)
    80005fbc:	fe043783          	ld	a5,-32(s0)
    80005fc0:	eb89                	bnez	a5,80005fd2 <namex+0xd6>
      iunlockput(ip);
    80005fc2:	fe843503          	ld	a0,-24(s0)
    80005fc6:	fffff097          	auipc	ra,0xfffff
    80005fca:	598080e7          	jalr	1432(ra) # 8000555e <iunlockput>
      return 0;
    80005fce:	4781                	li	a5,0
    80005fd0:	a0b1                	j	8000601c <namex+0x120>
    }
    iunlockput(ip);
    80005fd2:	fe843503          	ld	a0,-24(s0)
    80005fd6:	fffff097          	auipc	ra,0xfffff
    80005fda:	588080e7          	jalr	1416(ra) # 8000555e <iunlockput>
    ip = next;
    80005fde:	fe043783          	ld	a5,-32(s0)
    80005fe2:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    80005fe6:	fc843583          	ld	a1,-56(s0)
    80005fea:	fd843503          	ld	a0,-40(s0)
    80005fee:	00000097          	auipc	ra,0x0
    80005ff2:	e20080e7          	jalr	-480(ra) # 80005e0e <skipelem>
    80005ff6:	fca43c23          	sd	a0,-40(s0)
    80005ffa:	fd843783          	ld	a5,-40(s0)
    80005ffe:	fbb9                	bnez	a5,80005f54 <namex+0x58>
  }
  if(nameiparent){
    80006000:	fd442783          	lw	a5,-44(s0)
    80006004:	2781                	sext.w	a5,a5
    80006006:	cb89                	beqz	a5,80006018 <namex+0x11c>
    iput(ip);
    80006008:	fe843503          	ld	a0,-24(s0)
    8000600c:	fffff097          	auipc	ra,0xfffff
    80006010:	482080e7          	jalr	1154(ra) # 8000548e <iput>
    return 0;
    80006014:	4781                	li	a5,0
    80006016:	a019                	j	8000601c <namex+0x120>
  }
  return ip;
    80006018:	fe843783          	ld	a5,-24(s0)
}
    8000601c:	853e                	mv	a0,a5
    8000601e:	70e2                	ld	ra,56(sp)
    80006020:	7442                	ld	s0,48(sp)
    80006022:	6121                	addi	sp,sp,64
    80006024:	8082                	ret

0000000080006026 <namei>:

struct inode*
namei(char *path)
{
    80006026:	7179                	addi	sp,sp,-48
    80006028:	f406                	sd	ra,40(sp)
    8000602a:	f022                	sd	s0,32(sp)
    8000602c:	1800                	addi	s0,sp,48
    8000602e:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    80006032:	fe040793          	addi	a5,s0,-32
    80006036:	863e                	mv	a2,a5
    80006038:	4581                	li	a1,0
    8000603a:	fd843503          	ld	a0,-40(s0)
    8000603e:	00000097          	auipc	ra,0x0
    80006042:	ebe080e7          	jalr	-322(ra) # 80005efc <namex>
    80006046:	87aa                	mv	a5,a0
}
    80006048:	853e                	mv	a0,a5
    8000604a:	70a2                	ld	ra,40(sp)
    8000604c:	7402                	ld	s0,32(sp)
    8000604e:	6145                	addi	sp,sp,48
    80006050:	8082                	ret

0000000080006052 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    80006052:	1101                	addi	sp,sp,-32
    80006054:	ec06                	sd	ra,24(sp)
    80006056:	e822                	sd	s0,16(sp)
    80006058:	1000                	addi	s0,sp,32
    8000605a:	fea43423          	sd	a0,-24(s0)
    8000605e:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    80006062:	fe043603          	ld	a2,-32(s0)
    80006066:	4585                	li	a1,1
    80006068:	fe843503          	ld	a0,-24(s0)
    8000606c:	00000097          	auipc	ra,0x0
    80006070:	e90080e7          	jalr	-368(ra) # 80005efc <namex>
    80006074:	87aa                	mv	a5,a0
}
    80006076:	853e                	mv	a0,a5
    80006078:	60e2                	ld	ra,24(sp)
    8000607a:	6442                	ld	s0,16(sp)
    8000607c:	6105                	addi	sp,sp,32
    8000607e:	8082                	ret

0000000080006080 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80006080:	1101                	addi	sp,sp,-32
    80006082:	ec06                	sd	ra,24(sp)
    80006084:	e822                	sd	s0,16(sp)
    80006086:	1000                	addi	s0,sp,32
    80006088:	87aa                	mv	a5,a0
    8000608a:	feb43023          	sd	a1,-32(s0)
    8000608e:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    80006092:	00005597          	auipc	a1,0x5
    80006096:	4c658593          	addi	a1,a1,1222 # 8000b558 <etext+0x558>
    8000609a:	0002e517          	auipc	a0,0x2e
    8000609e:	aee50513          	addi	a0,a0,-1298 # 80033b88 <log>
    800060a2:	ffffb097          	auipc	ra,0xffffb
    800060a6:	258080e7          	jalr	600(ra) # 800012fa <initlock>
  log.start = sb->logstart;
    800060aa:	fe043783          	ld	a5,-32(s0)
    800060ae:	4bdc                	lw	a5,20(a5)
    800060b0:	0007871b          	sext.w	a4,a5
    800060b4:	0002e797          	auipc	a5,0x2e
    800060b8:	ad478793          	addi	a5,a5,-1324 # 80033b88 <log>
    800060bc:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800060be:	fe043783          	ld	a5,-32(s0)
    800060c2:	4b9c                	lw	a5,16(a5)
    800060c4:	0007871b          	sext.w	a4,a5
    800060c8:	0002e797          	auipc	a5,0x2e
    800060cc:	ac078793          	addi	a5,a5,-1344 # 80033b88 <log>
    800060d0:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800060d2:	0002e797          	auipc	a5,0x2e
    800060d6:	ab678793          	addi	a5,a5,-1354 # 80033b88 <log>
    800060da:	fec42703          	lw	a4,-20(s0)
    800060de:	d798                	sw	a4,40(a5)
  recover_from_log();
    800060e0:	00000097          	auipc	ra,0x0
    800060e4:	272080e7          	jalr	626(ra) # 80006352 <recover_from_log>
}
    800060e8:	0001                	nop
    800060ea:	60e2                	ld	ra,24(sp)
    800060ec:	6442                	ld	s0,16(sp)
    800060ee:	6105                	addi	sp,sp,32
    800060f0:	8082                	ret

00000000800060f2 <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    800060f2:	7139                	addi	sp,sp,-64
    800060f4:	fc06                	sd	ra,56(sp)
    800060f6:	f822                	sd	s0,48(sp)
    800060f8:	0080                	addi	s0,sp,64
    800060fa:	87aa                	mv	a5,a0
    800060fc:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006100:	fe042623          	sw	zero,-20(s0)
    80006104:	a0f9                	j	800061d2 <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    80006106:	0002e797          	auipc	a5,0x2e
    8000610a:	a8278793          	addi	a5,a5,-1406 # 80033b88 <log>
    8000610e:	579c                	lw	a5,40(a5)
    80006110:	0007869b          	sext.w	a3,a5
    80006114:	0002e797          	auipc	a5,0x2e
    80006118:	a7478793          	addi	a5,a5,-1420 # 80033b88 <log>
    8000611c:	4f9c                	lw	a5,24(a5)
    8000611e:	fec42703          	lw	a4,-20(s0)
    80006122:	9fb9                	addw	a5,a5,a4
    80006124:	2781                	sext.w	a5,a5
    80006126:	2785                	addiw	a5,a5,1
    80006128:	2781                	sext.w	a5,a5
    8000612a:	2781                	sext.w	a5,a5
    8000612c:	85be                	mv	a1,a5
    8000612e:	8536                	mv	a0,a3
    80006130:	ffffe097          	auipc	ra,0xffffe
    80006134:	7dc080e7          	jalr	2012(ra) # 8000490c <bread>
    80006138:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    8000613c:	0002e797          	auipc	a5,0x2e
    80006140:	a4c78793          	addi	a5,a5,-1460 # 80033b88 <log>
    80006144:	579c                	lw	a5,40(a5)
    80006146:	0007869b          	sext.w	a3,a5
    8000614a:	0002e717          	auipc	a4,0x2e
    8000614e:	a3e70713          	addi	a4,a4,-1474 # 80033b88 <log>
    80006152:	fec42783          	lw	a5,-20(s0)
    80006156:	07a1                	addi	a5,a5,8
    80006158:	078a                	slli	a5,a5,0x2
    8000615a:	97ba                	add	a5,a5,a4
    8000615c:	4b9c                	lw	a5,16(a5)
    8000615e:	2781                	sext.w	a5,a5
    80006160:	85be                	mv	a1,a5
    80006162:	8536                	mv	a0,a3
    80006164:	ffffe097          	auipc	ra,0xffffe
    80006168:	7a8080e7          	jalr	1960(ra) # 8000490c <bread>
    8000616c:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006170:	fd843783          	ld	a5,-40(s0)
    80006174:	05878713          	addi	a4,a5,88
    80006178:	fe043783          	ld	a5,-32(s0)
    8000617c:	05878793          	addi	a5,a5,88
    80006180:	40000613          	li	a2,1024
    80006184:	85be                	mv	a1,a5
    80006186:	853a                	mv	a0,a4
    80006188:	ffffb097          	auipc	ra,0xffffb
    8000618c:	45a080e7          	jalr	1114(ra) # 800015e2 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006190:	fd843503          	ld	a0,-40(s0)
    80006194:	ffffe097          	auipc	ra,0xffffe
    80006198:	7d6080e7          	jalr	2006(ra) # 8000496a <bwrite>
    if(recovering == 0)
    8000619c:	fcc42783          	lw	a5,-52(s0)
    800061a0:	2781                	sext.w	a5,a5
    800061a2:	e799                	bnez	a5,800061b0 <install_trans+0xbe>
      bunpin(dbuf);
    800061a4:	fd843503          	ld	a0,-40(s0)
    800061a8:	fffff097          	auipc	ra,0xfffff
    800061ac:	944080e7          	jalr	-1724(ra) # 80004aec <bunpin>
    brelse(lbuf);
    800061b0:	fe043503          	ld	a0,-32(s0)
    800061b4:	fffff097          	auipc	ra,0xfffff
    800061b8:	802080e7          	jalr	-2046(ra) # 800049b6 <brelse>
    brelse(dbuf);
    800061bc:	fd843503          	ld	a0,-40(s0)
    800061c0:	ffffe097          	auipc	ra,0xffffe
    800061c4:	7f6080e7          	jalr	2038(ra) # 800049b6 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800061c8:	fec42783          	lw	a5,-20(s0)
    800061cc:	2785                	addiw	a5,a5,1
    800061ce:	fef42623          	sw	a5,-20(s0)
    800061d2:	0002e797          	auipc	a5,0x2e
    800061d6:	9b678793          	addi	a5,a5,-1610 # 80033b88 <log>
    800061da:	57d8                	lw	a4,44(a5)
    800061dc:	fec42783          	lw	a5,-20(s0)
    800061e0:	2781                	sext.w	a5,a5
    800061e2:	f2e7c2e3          	blt	a5,a4,80006106 <install_trans+0x14>
  }
}
    800061e6:	0001                	nop
    800061e8:	0001                	nop
    800061ea:	70e2                	ld	ra,56(sp)
    800061ec:	7442                	ld	s0,48(sp)
    800061ee:	6121                	addi	sp,sp,64
    800061f0:	8082                	ret

00000000800061f2 <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800061f2:	7179                	addi	sp,sp,-48
    800061f4:	f406                	sd	ra,40(sp)
    800061f6:	f022                	sd	s0,32(sp)
    800061f8:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800061fa:	0002e797          	auipc	a5,0x2e
    800061fe:	98e78793          	addi	a5,a5,-1650 # 80033b88 <log>
    80006202:	579c                	lw	a5,40(a5)
    80006204:	0007871b          	sext.w	a4,a5
    80006208:	0002e797          	auipc	a5,0x2e
    8000620c:	98078793          	addi	a5,a5,-1664 # 80033b88 <log>
    80006210:	4f9c                	lw	a5,24(a5)
    80006212:	2781                	sext.w	a5,a5
    80006214:	85be                	mv	a1,a5
    80006216:	853a                	mv	a0,a4
    80006218:	ffffe097          	auipc	ra,0xffffe
    8000621c:	6f4080e7          	jalr	1780(ra) # 8000490c <bread>
    80006220:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    80006224:	fe043783          	ld	a5,-32(s0)
    80006228:	05878793          	addi	a5,a5,88
    8000622c:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006230:	fd843783          	ld	a5,-40(s0)
    80006234:	4398                	lw	a4,0(a5)
    80006236:	0002e797          	auipc	a5,0x2e
    8000623a:	95278793          	addi	a5,a5,-1710 # 80033b88 <log>
    8000623e:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006240:	fe042623          	sw	zero,-20(s0)
    80006244:	a03d                	j	80006272 <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    80006246:	fd843703          	ld	a4,-40(s0)
    8000624a:	fec42783          	lw	a5,-20(s0)
    8000624e:	078a                	slli	a5,a5,0x2
    80006250:	97ba                	add	a5,a5,a4
    80006252:	43d8                	lw	a4,4(a5)
    80006254:	0002e697          	auipc	a3,0x2e
    80006258:	93468693          	addi	a3,a3,-1740 # 80033b88 <log>
    8000625c:	fec42783          	lw	a5,-20(s0)
    80006260:	07a1                	addi	a5,a5,8
    80006262:	078a                	slli	a5,a5,0x2
    80006264:	97b6                	add	a5,a5,a3
    80006266:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006268:	fec42783          	lw	a5,-20(s0)
    8000626c:	2785                	addiw	a5,a5,1
    8000626e:	fef42623          	sw	a5,-20(s0)
    80006272:	0002e797          	auipc	a5,0x2e
    80006276:	91678793          	addi	a5,a5,-1770 # 80033b88 <log>
    8000627a:	57d8                	lw	a4,44(a5)
    8000627c:	fec42783          	lw	a5,-20(s0)
    80006280:	2781                	sext.w	a5,a5
    80006282:	fce7c2e3          	blt	a5,a4,80006246 <read_head+0x54>
  }
  brelse(buf);
    80006286:	fe043503          	ld	a0,-32(s0)
    8000628a:	ffffe097          	auipc	ra,0xffffe
    8000628e:	72c080e7          	jalr	1836(ra) # 800049b6 <brelse>
}
    80006292:	0001                	nop
    80006294:	70a2                	ld	ra,40(sp)
    80006296:	7402                	ld	s0,32(sp)
    80006298:	6145                	addi	sp,sp,48
    8000629a:	8082                	ret

000000008000629c <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    8000629c:	7179                	addi	sp,sp,-48
    8000629e:	f406                	sd	ra,40(sp)
    800062a0:	f022                	sd	s0,32(sp)
    800062a2:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800062a4:	0002e797          	auipc	a5,0x2e
    800062a8:	8e478793          	addi	a5,a5,-1820 # 80033b88 <log>
    800062ac:	579c                	lw	a5,40(a5)
    800062ae:	0007871b          	sext.w	a4,a5
    800062b2:	0002e797          	auipc	a5,0x2e
    800062b6:	8d678793          	addi	a5,a5,-1834 # 80033b88 <log>
    800062ba:	4f9c                	lw	a5,24(a5)
    800062bc:	2781                	sext.w	a5,a5
    800062be:	85be                	mv	a1,a5
    800062c0:	853a                	mv	a0,a4
    800062c2:	ffffe097          	auipc	ra,0xffffe
    800062c6:	64a080e7          	jalr	1610(ra) # 8000490c <bread>
    800062ca:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800062ce:	fe043783          	ld	a5,-32(s0)
    800062d2:	05878793          	addi	a5,a5,88
    800062d6:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    800062da:	0002e797          	auipc	a5,0x2e
    800062de:	8ae78793          	addi	a5,a5,-1874 # 80033b88 <log>
    800062e2:	57d8                	lw	a4,44(a5)
    800062e4:	fd843783          	ld	a5,-40(s0)
    800062e8:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800062ea:	fe042623          	sw	zero,-20(s0)
    800062ee:	a03d                	j	8000631c <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800062f0:	0002e717          	auipc	a4,0x2e
    800062f4:	89870713          	addi	a4,a4,-1896 # 80033b88 <log>
    800062f8:	fec42783          	lw	a5,-20(s0)
    800062fc:	07a1                	addi	a5,a5,8
    800062fe:	078a                	slli	a5,a5,0x2
    80006300:	97ba                	add	a5,a5,a4
    80006302:	4b98                	lw	a4,16(a5)
    80006304:	fd843683          	ld	a3,-40(s0)
    80006308:	fec42783          	lw	a5,-20(s0)
    8000630c:	078a                	slli	a5,a5,0x2
    8000630e:	97b6                	add	a5,a5,a3
    80006310:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006312:	fec42783          	lw	a5,-20(s0)
    80006316:	2785                	addiw	a5,a5,1
    80006318:	fef42623          	sw	a5,-20(s0)
    8000631c:	0002e797          	auipc	a5,0x2e
    80006320:	86c78793          	addi	a5,a5,-1940 # 80033b88 <log>
    80006324:	57d8                	lw	a4,44(a5)
    80006326:	fec42783          	lw	a5,-20(s0)
    8000632a:	2781                	sext.w	a5,a5
    8000632c:	fce7c2e3          	blt	a5,a4,800062f0 <write_head+0x54>
  }
  bwrite(buf);
    80006330:	fe043503          	ld	a0,-32(s0)
    80006334:	ffffe097          	auipc	ra,0xffffe
    80006338:	636080e7          	jalr	1590(ra) # 8000496a <bwrite>
  brelse(buf);
    8000633c:	fe043503          	ld	a0,-32(s0)
    80006340:	ffffe097          	auipc	ra,0xffffe
    80006344:	676080e7          	jalr	1654(ra) # 800049b6 <brelse>
}
    80006348:	0001                	nop
    8000634a:	70a2                	ld	ra,40(sp)
    8000634c:	7402                	ld	s0,32(sp)
    8000634e:	6145                	addi	sp,sp,48
    80006350:	8082                	ret

0000000080006352 <recover_from_log>:

static void
recover_from_log(void)
{
    80006352:	1141                	addi	sp,sp,-16
    80006354:	e406                	sd	ra,8(sp)
    80006356:	e022                	sd	s0,0(sp)
    80006358:	0800                	addi	s0,sp,16
  read_head();
    8000635a:	00000097          	auipc	ra,0x0
    8000635e:	e98080e7          	jalr	-360(ra) # 800061f2 <read_head>
  install_trans(1); // if committed, copy from log to disk
    80006362:	4505                	li	a0,1
    80006364:	00000097          	auipc	ra,0x0
    80006368:	d8e080e7          	jalr	-626(ra) # 800060f2 <install_trans>
  log.lh.n = 0;
    8000636c:	0002e797          	auipc	a5,0x2e
    80006370:	81c78793          	addi	a5,a5,-2020 # 80033b88 <log>
    80006374:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    80006378:	00000097          	auipc	ra,0x0
    8000637c:	f24080e7          	jalr	-220(ra) # 8000629c <write_head>
}
    80006380:	0001                	nop
    80006382:	60a2                	ld	ra,8(sp)
    80006384:	6402                	ld	s0,0(sp)
    80006386:	0141                	addi	sp,sp,16
    80006388:	8082                	ret

000000008000638a <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    8000638a:	1141                	addi	sp,sp,-16
    8000638c:	e406                	sd	ra,8(sp)
    8000638e:	e022                	sd	s0,0(sp)
    80006390:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    80006392:	0002d517          	auipc	a0,0x2d
    80006396:	7f650513          	addi	a0,a0,2038 # 80033b88 <log>
    8000639a:	ffffb097          	auipc	ra,0xffffb
    8000639e:	f90080e7          	jalr	-112(ra) # 8000132a <acquire>
  while(1){
    if(log.committing){
    800063a2:	0002d797          	auipc	a5,0x2d
    800063a6:	7e678793          	addi	a5,a5,2022 # 80033b88 <log>
    800063aa:	53dc                	lw	a5,36(a5)
    800063ac:	cf91                	beqz	a5,800063c8 <begin_op+0x3e>
      sleep(&log, &log.lock);
    800063ae:	0002d597          	auipc	a1,0x2d
    800063b2:	7da58593          	addi	a1,a1,2010 # 80033b88 <log>
    800063b6:	0002d517          	auipc	a0,0x2d
    800063ba:	7d250513          	addi	a0,a0,2002 # 80033b88 <log>
    800063be:	ffffd097          	auipc	ra,0xffffd
    800063c2:	29e080e7          	jalr	670(ra) # 8000365c <sleep>
    800063c6:	bff1                	j	800063a2 <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800063c8:	0002d797          	auipc	a5,0x2d
    800063cc:	7c078793          	addi	a5,a5,1984 # 80033b88 <log>
    800063d0:	57d8                	lw	a4,44(a5)
    800063d2:	0002d797          	auipc	a5,0x2d
    800063d6:	7b678793          	addi	a5,a5,1974 # 80033b88 <log>
    800063da:	539c                	lw	a5,32(a5)
    800063dc:	2785                	addiw	a5,a5,1
    800063de:	2781                	sext.w	a5,a5
    800063e0:	86be                	mv	a3,a5
    800063e2:	87b6                	mv	a5,a3
    800063e4:	0027979b          	slliw	a5,a5,0x2
    800063e8:	9fb5                	addw	a5,a5,a3
    800063ea:	0017979b          	slliw	a5,a5,0x1
    800063ee:	2781                	sext.w	a5,a5
    800063f0:	9fb9                	addw	a5,a5,a4
    800063f2:	2781                	sext.w	a5,a5
    800063f4:	873e                	mv	a4,a5
    800063f6:	47f9                	li	a5,30
    800063f8:	00e7df63          	bge	a5,a4,80006416 <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800063fc:	0002d597          	auipc	a1,0x2d
    80006400:	78c58593          	addi	a1,a1,1932 # 80033b88 <log>
    80006404:	0002d517          	auipc	a0,0x2d
    80006408:	78450513          	addi	a0,a0,1924 # 80033b88 <log>
    8000640c:	ffffd097          	auipc	ra,0xffffd
    80006410:	250080e7          	jalr	592(ra) # 8000365c <sleep>
    80006414:	b779                	j	800063a2 <begin_op+0x18>
    } else {
      log.outstanding += 1;
    80006416:	0002d797          	auipc	a5,0x2d
    8000641a:	77278793          	addi	a5,a5,1906 # 80033b88 <log>
    8000641e:	539c                	lw	a5,32(a5)
    80006420:	2785                	addiw	a5,a5,1
    80006422:	0007871b          	sext.w	a4,a5
    80006426:	0002d797          	auipc	a5,0x2d
    8000642a:	76278793          	addi	a5,a5,1890 # 80033b88 <log>
    8000642e:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006430:	0002d517          	auipc	a0,0x2d
    80006434:	75850513          	addi	a0,a0,1880 # 80033b88 <log>
    80006438:	ffffb097          	auipc	ra,0xffffb
    8000643c:	f56080e7          	jalr	-170(ra) # 8000138e <release>
      break;
    80006440:	0001                	nop
    }
  }
}
    80006442:	0001                	nop
    80006444:	60a2                	ld	ra,8(sp)
    80006446:	6402                	ld	s0,0(sp)
    80006448:	0141                	addi	sp,sp,16
    8000644a:	8082                	ret

000000008000644c <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    8000644c:	1101                	addi	sp,sp,-32
    8000644e:	ec06                	sd	ra,24(sp)
    80006450:	e822                	sd	s0,16(sp)
    80006452:	1000                	addi	s0,sp,32
  int do_commit = 0;
    80006454:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006458:	0002d517          	auipc	a0,0x2d
    8000645c:	73050513          	addi	a0,a0,1840 # 80033b88 <log>
    80006460:	ffffb097          	auipc	ra,0xffffb
    80006464:	eca080e7          	jalr	-310(ra) # 8000132a <acquire>
  log.outstanding -= 1;
    80006468:	0002d797          	auipc	a5,0x2d
    8000646c:	72078793          	addi	a5,a5,1824 # 80033b88 <log>
    80006470:	539c                	lw	a5,32(a5)
    80006472:	37fd                	addiw	a5,a5,-1
    80006474:	0007871b          	sext.w	a4,a5
    80006478:	0002d797          	auipc	a5,0x2d
    8000647c:	71078793          	addi	a5,a5,1808 # 80033b88 <log>
    80006480:	d398                	sw	a4,32(a5)
  if(log.committing)
    80006482:	0002d797          	auipc	a5,0x2d
    80006486:	70678793          	addi	a5,a5,1798 # 80033b88 <log>
    8000648a:	53dc                	lw	a5,36(a5)
    8000648c:	cb89                	beqz	a5,8000649e <end_op+0x52>
    panic("log.committing");
    8000648e:	00005517          	auipc	a0,0x5
    80006492:	0d250513          	addi	a0,a0,210 # 8000b560 <etext+0x560>
    80006496:	ffffa097          	auipc	ra,0xffffa
    8000649a:	7f6080e7          	jalr	2038(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    8000649e:	0002d797          	auipc	a5,0x2d
    800064a2:	6ea78793          	addi	a5,a5,1770 # 80033b88 <log>
    800064a6:	539c                	lw	a5,32(a5)
    800064a8:	eb99                	bnez	a5,800064be <end_op+0x72>
    do_commit = 1;
    800064aa:	4785                	li	a5,1
    800064ac:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    800064b0:	0002d797          	auipc	a5,0x2d
    800064b4:	6d878793          	addi	a5,a5,1752 # 80033b88 <log>
    800064b8:	4705                	li	a4,1
    800064ba:	d3d8                	sw	a4,36(a5)
    800064bc:	a809                	j	800064ce <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800064be:	0002d517          	auipc	a0,0x2d
    800064c2:	6ca50513          	addi	a0,a0,1738 # 80033b88 <log>
    800064c6:	ffffd097          	auipc	ra,0xffffd
    800064ca:	212080e7          	jalr	530(ra) # 800036d8 <wakeup>
  }
  release(&log.lock);
    800064ce:	0002d517          	auipc	a0,0x2d
    800064d2:	6ba50513          	addi	a0,a0,1722 # 80033b88 <log>
    800064d6:	ffffb097          	auipc	ra,0xffffb
    800064da:	eb8080e7          	jalr	-328(ra) # 8000138e <release>

  if(do_commit){
    800064de:	fec42783          	lw	a5,-20(s0)
    800064e2:	2781                	sext.w	a5,a5
    800064e4:	c3b9                	beqz	a5,8000652a <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800064e6:	00000097          	auipc	ra,0x0
    800064ea:	134080e7          	jalr	308(ra) # 8000661a <commit>
    acquire(&log.lock);
    800064ee:	0002d517          	auipc	a0,0x2d
    800064f2:	69a50513          	addi	a0,a0,1690 # 80033b88 <log>
    800064f6:	ffffb097          	auipc	ra,0xffffb
    800064fa:	e34080e7          	jalr	-460(ra) # 8000132a <acquire>
    log.committing = 0;
    800064fe:	0002d797          	auipc	a5,0x2d
    80006502:	68a78793          	addi	a5,a5,1674 # 80033b88 <log>
    80006506:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    8000650a:	0002d517          	auipc	a0,0x2d
    8000650e:	67e50513          	addi	a0,a0,1662 # 80033b88 <log>
    80006512:	ffffd097          	auipc	ra,0xffffd
    80006516:	1c6080e7          	jalr	454(ra) # 800036d8 <wakeup>
    release(&log.lock);
    8000651a:	0002d517          	auipc	a0,0x2d
    8000651e:	66e50513          	addi	a0,a0,1646 # 80033b88 <log>
    80006522:	ffffb097          	auipc	ra,0xffffb
    80006526:	e6c080e7          	jalr	-404(ra) # 8000138e <release>
  }
}
    8000652a:	0001                	nop
    8000652c:	60e2                	ld	ra,24(sp)
    8000652e:	6442                	ld	s0,16(sp)
    80006530:	6105                	addi	sp,sp,32
    80006532:	8082                	ret

0000000080006534 <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    80006534:	7179                	addi	sp,sp,-48
    80006536:	f406                	sd	ra,40(sp)
    80006538:	f022                	sd	s0,32(sp)
    8000653a:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    8000653c:	fe042623          	sw	zero,-20(s0)
    80006540:	a86d                	j	800065fa <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    80006542:	0002d797          	auipc	a5,0x2d
    80006546:	64678793          	addi	a5,a5,1606 # 80033b88 <log>
    8000654a:	579c                	lw	a5,40(a5)
    8000654c:	0007869b          	sext.w	a3,a5
    80006550:	0002d797          	auipc	a5,0x2d
    80006554:	63878793          	addi	a5,a5,1592 # 80033b88 <log>
    80006558:	4f9c                	lw	a5,24(a5)
    8000655a:	fec42703          	lw	a4,-20(s0)
    8000655e:	9fb9                	addw	a5,a5,a4
    80006560:	2781                	sext.w	a5,a5
    80006562:	2785                	addiw	a5,a5,1
    80006564:	2781                	sext.w	a5,a5
    80006566:	2781                	sext.w	a5,a5
    80006568:	85be                	mv	a1,a5
    8000656a:	8536                	mv	a0,a3
    8000656c:	ffffe097          	auipc	ra,0xffffe
    80006570:	3a0080e7          	jalr	928(ra) # 8000490c <bread>
    80006574:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80006578:	0002d797          	auipc	a5,0x2d
    8000657c:	61078793          	addi	a5,a5,1552 # 80033b88 <log>
    80006580:	579c                	lw	a5,40(a5)
    80006582:	0007869b          	sext.w	a3,a5
    80006586:	0002d717          	auipc	a4,0x2d
    8000658a:	60270713          	addi	a4,a4,1538 # 80033b88 <log>
    8000658e:	fec42783          	lw	a5,-20(s0)
    80006592:	07a1                	addi	a5,a5,8
    80006594:	078a                	slli	a5,a5,0x2
    80006596:	97ba                	add	a5,a5,a4
    80006598:	4b9c                	lw	a5,16(a5)
    8000659a:	2781                	sext.w	a5,a5
    8000659c:	85be                	mv	a1,a5
    8000659e:	8536                	mv	a0,a3
    800065a0:	ffffe097          	auipc	ra,0xffffe
    800065a4:	36c080e7          	jalr	876(ra) # 8000490c <bread>
    800065a8:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    800065ac:	fe043783          	ld	a5,-32(s0)
    800065b0:	05878713          	addi	a4,a5,88
    800065b4:	fd843783          	ld	a5,-40(s0)
    800065b8:	05878793          	addi	a5,a5,88
    800065bc:	40000613          	li	a2,1024
    800065c0:	85be                	mv	a1,a5
    800065c2:	853a                	mv	a0,a4
    800065c4:	ffffb097          	auipc	ra,0xffffb
    800065c8:	01e080e7          	jalr	30(ra) # 800015e2 <memmove>
    bwrite(to);  // write the log
    800065cc:	fe043503          	ld	a0,-32(s0)
    800065d0:	ffffe097          	auipc	ra,0xffffe
    800065d4:	39a080e7          	jalr	922(ra) # 8000496a <bwrite>
    brelse(from);
    800065d8:	fd843503          	ld	a0,-40(s0)
    800065dc:	ffffe097          	auipc	ra,0xffffe
    800065e0:	3da080e7          	jalr	986(ra) # 800049b6 <brelse>
    brelse(to);
    800065e4:	fe043503          	ld	a0,-32(s0)
    800065e8:	ffffe097          	auipc	ra,0xffffe
    800065ec:	3ce080e7          	jalr	974(ra) # 800049b6 <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800065f0:	fec42783          	lw	a5,-20(s0)
    800065f4:	2785                	addiw	a5,a5,1
    800065f6:	fef42623          	sw	a5,-20(s0)
    800065fa:	0002d797          	auipc	a5,0x2d
    800065fe:	58e78793          	addi	a5,a5,1422 # 80033b88 <log>
    80006602:	57d8                	lw	a4,44(a5)
    80006604:	fec42783          	lw	a5,-20(s0)
    80006608:	2781                	sext.w	a5,a5
    8000660a:	f2e7cce3          	blt	a5,a4,80006542 <write_log+0xe>
  }
}
    8000660e:	0001                	nop
    80006610:	0001                	nop
    80006612:	70a2                	ld	ra,40(sp)
    80006614:	7402                	ld	s0,32(sp)
    80006616:	6145                	addi	sp,sp,48
    80006618:	8082                	ret

000000008000661a <commit>:

static void
commit()
{
    8000661a:	1141                	addi	sp,sp,-16
    8000661c:	e406                	sd	ra,8(sp)
    8000661e:	e022                	sd	s0,0(sp)
    80006620:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    80006622:	0002d797          	auipc	a5,0x2d
    80006626:	56678793          	addi	a5,a5,1382 # 80033b88 <log>
    8000662a:	57dc                	lw	a5,44(a5)
    8000662c:	02f05963          	blez	a5,8000665e <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006630:	00000097          	auipc	ra,0x0
    80006634:	f04080e7          	jalr	-252(ra) # 80006534 <write_log>
    write_head();    // Write header to disk -- the real commit
    80006638:	00000097          	auipc	ra,0x0
    8000663c:	c64080e7          	jalr	-924(ra) # 8000629c <write_head>
    install_trans(0); // Now install writes to home locations
    80006640:	4501                	li	a0,0
    80006642:	00000097          	auipc	ra,0x0
    80006646:	ab0080e7          	jalr	-1360(ra) # 800060f2 <install_trans>
    log.lh.n = 0;
    8000664a:	0002d797          	auipc	a5,0x2d
    8000664e:	53e78793          	addi	a5,a5,1342 # 80033b88 <log>
    80006652:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    80006656:	00000097          	auipc	ra,0x0
    8000665a:	c46080e7          	jalr	-954(ra) # 8000629c <write_head>
  }
}
    8000665e:	0001                	nop
    80006660:	60a2                	ld	ra,8(sp)
    80006662:	6402                	ld	s0,0(sp)
    80006664:	0141                	addi	sp,sp,16
    80006666:	8082                	ret

0000000080006668 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006668:	7179                	addi	sp,sp,-48
    8000666a:	f406                	sd	ra,40(sp)
    8000666c:	f022                	sd	s0,32(sp)
    8000666e:	1800                	addi	s0,sp,48
    80006670:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    80006674:	0002d517          	auipc	a0,0x2d
    80006678:	51450513          	addi	a0,a0,1300 # 80033b88 <log>
    8000667c:	ffffb097          	auipc	ra,0xffffb
    80006680:	cae080e7          	jalr	-850(ra) # 8000132a <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    80006684:	0002d797          	auipc	a5,0x2d
    80006688:	50478793          	addi	a5,a5,1284 # 80033b88 <log>
    8000668c:	57dc                	lw	a5,44(a5)
    8000668e:	873e                	mv	a4,a5
    80006690:	47f5                	li	a5,29
    80006692:	02e7c063          	blt	a5,a4,800066b2 <log_write+0x4a>
    80006696:	0002d797          	auipc	a5,0x2d
    8000669a:	4f278793          	addi	a5,a5,1266 # 80033b88 <log>
    8000669e:	57d8                	lw	a4,44(a5)
    800066a0:	0002d797          	auipc	a5,0x2d
    800066a4:	4e878793          	addi	a5,a5,1256 # 80033b88 <log>
    800066a8:	4fdc                	lw	a5,28(a5)
    800066aa:	37fd                	addiw	a5,a5,-1
    800066ac:	2781                	sext.w	a5,a5
    800066ae:	00f74a63          	blt	a4,a5,800066c2 <log_write+0x5a>
    panic("too big a transaction");
    800066b2:	00005517          	auipc	a0,0x5
    800066b6:	ebe50513          	addi	a0,a0,-322 # 8000b570 <etext+0x570>
    800066ba:	ffffa097          	auipc	ra,0xffffa
    800066be:	5d2080e7          	jalr	1490(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    800066c2:	0002d797          	auipc	a5,0x2d
    800066c6:	4c678793          	addi	a5,a5,1222 # 80033b88 <log>
    800066ca:	539c                	lw	a5,32(a5)
    800066cc:	00f04a63          	bgtz	a5,800066e0 <log_write+0x78>
    panic("log_write outside of trans");
    800066d0:	00005517          	auipc	a0,0x5
    800066d4:	eb850513          	addi	a0,a0,-328 # 8000b588 <etext+0x588>
    800066d8:	ffffa097          	auipc	ra,0xffffa
    800066dc:	5b4080e7          	jalr	1460(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    800066e0:	fe042623          	sw	zero,-20(s0)
    800066e4:	a03d                	j	80006712 <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    800066e6:	0002d717          	auipc	a4,0x2d
    800066ea:	4a270713          	addi	a4,a4,1186 # 80033b88 <log>
    800066ee:	fec42783          	lw	a5,-20(s0)
    800066f2:	07a1                	addi	a5,a5,8
    800066f4:	078a                	slli	a5,a5,0x2
    800066f6:	97ba                	add	a5,a5,a4
    800066f8:	4b9c                	lw	a5,16(a5)
    800066fa:	0007871b          	sext.w	a4,a5
    800066fe:	fd843783          	ld	a5,-40(s0)
    80006702:	47dc                	lw	a5,12(a5)
    80006704:	02f70263          	beq	a4,a5,80006728 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    80006708:	fec42783          	lw	a5,-20(s0)
    8000670c:	2785                	addiw	a5,a5,1
    8000670e:	fef42623          	sw	a5,-20(s0)
    80006712:	0002d797          	auipc	a5,0x2d
    80006716:	47678793          	addi	a5,a5,1142 # 80033b88 <log>
    8000671a:	57d8                	lw	a4,44(a5)
    8000671c:	fec42783          	lw	a5,-20(s0)
    80006720:	2781                	sext.w	a5,a5
    80006722:	fce7c2e3          	blt	a5,a4,800066e6 <log_write+0x7e>
    80006726:	a011                	j	8000672a <log_write+0xc2>
      break;
    80006728:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    8000672a:	fd843783          	ld	a5,-40(s0)
    8000672e:	47dc                	lw	a5,12(a5)
    80006730:	0007871b          	sext.w	a4,a5
    80006734:	0002d697          	auipc	a3,0x2d
    80006738:	45468693          	addi	a3,a3,1108 # 80033b88 <log>
    8000673c:	fec42783          	lw	a5,-20(s0)
    80006740:	07a1                	addi	a5,a5,8
    80006742:	078a                	slli	a5,a5,0x2
    80006744:	97b6                	add	a5,a5,a3
    80006746:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006748:	0002d797          	auipc	a5,0x2d
    8000674c:	44078793          	addi	a5,a5,1088 # 80033b88 <log>
    80006750:	57d8                	lw	a4,44(a5)
    80006752:	fec42783          	lw	a5,-20(s0)
    80006756:	2781                	sext.w	a5,a5
    80006758:	02e79563          	bne	a5,a4,80006782 <log_write+0x11a>
    bpin(b);
    8000675c:	fd843503          	ld	a0,-40(s0)
    80006760:	ffffe097          	auipc	ra,0xffffe
    80006764:	344080e7          	jalr	836(ra) # 80004aa4 <bpin>
    log.lh.n++;
    80006768:	0002d797          	auipc	a5,0x2d
    8000676c:	42078793          	addi	a5,a5,1056 # 80033b88 <log>
    80006770:	57dc                	lw	a5,44(a5)
    80006772:	2785                	addiw	a5,a5,1
    80006774:	0007871b          	sext.w	a4,a5
    80006778:	0002d797          	auipc	a5,0x2d
    8000677c:	41078793          	addi	a5,a5,1040 # 80033b88 <log>
    80006780:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    80006782:	0002d517          	auipc	a0,0x2d
    80006786:	40650513          	addi	a0,a0,1030 # 80033b88 <log>
    8000678a:	ffffb097          	auipc	ra,0xffffb
    8000678e:	c04080e7          	jalr	-1020(ra) # 8000138e <release>
}
    80006792:	0001                	nop
    80006794:	70a2                	ld	ra,40(sp)
    80006796:	7402                	ld	s0,32(sp)
    80006798:	6145                	addi	sp,sp,48
    8000679a:	8082                	ret

000000008000679c <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    8000679c:	1101                	addi	sp,sp,-32
    8000679e:	ec06                	sd	ra,24(sp)
    800067a0:	e822                	sd	s0,16(sp)
    800067a2:	1000                	addi	s0,sp,32
    800067a4:	fea43423          	sd	a0,-24(s0)
    800067a8:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    800067ac:	fe843783          	ld	a5,-24(s0)
    800067b0:	07a1                	addi	a5,a5,8
    800067b2:	00005597          	auipc	a1,0x5
    800067b6:	df658593          	addi	a1,a1,-522 # 8000b5a8 <etext+0x5a8>
    800067ba:	853e                	mv	a0,a5
    800067bc:	ffffb097          	auipc	ra,0xffffb
    800067c0:	b3e080e7          	jalr	-1218(ra) # 800012fa <initlock>
  lk->name = name;
    800067c4:	fe843783          	ld	a5,-24(s0)
    800067c8:	fe043703          	ld	a4,-32(s0)
    800067cc:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    800067ce:	fe843783          	ld	a5,-24(s0)
    800067d2:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800067d6:	fe843783          	ld	a5,-24(s0)
    800067da:	0207a423          	sw	zero,40(a5)
}
    800067de:	0001                	nop
    800067e0:	60e2                	ld	ra,24(sp)
    800067e2:	6442                	ld	s0,16(sp)
    800067e4:	6105                	addi	sp,sp,32
    800067e6:	8082                	ret

00000000800067e8 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    800067e8:	1101                	addi	sp,sp,-32
    800067ea:	ec06                	sd	ra,24(sp)
    800067ec:	e822                	sd	s0,16(sp)
    800067ee:	1000                	addi	s0,sp,32
    800067f0:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800067f4:	fe843783          	ld	a5,-24(s0)
    800067f8:	07a1                	addi	a5,a5,8
    800067fa:	853e                	mv	a0,a5
    800067fc:	ffffb097          	auipc	ra,0xffffb
    80006800:	b2e080e7          	jalr	-1234(ra) # 8000132a <acquire>
  while (lk->locked) {
    80006804:	a819                	j	8000681a <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    80006806:	fe843783          	ld	a5,-24(s0)
    8000680a:	07a1                	addi	a5,a5,8
    8000680c:	85be                	mv	a1,a5
    8000680e:	fe843503          	ld	a0,-24(s0)
    80006812:	ffffd097          	auipc	ra,0xffffd
    80006816:	e4a080e7          	jalr	-438(ra) # 8000365c <sleep>
  while (lk->locked) {
    8000681a:	fe843783          	ld	a5,-24(s0)
    8000681e:	439c                	lw	a5,0(a5)
    80006820:	f3fd                	bnez	a5,80006806 <acquiresleep+0x1e>
  }
  lk->locked = 1;
    80006822:	fe843783          	ld	a5,-24(s0)
    80006826:	4705                	li	a4,1
    80006828:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    8000682a:	ffffc097          	auipc	ra,0xffffc
    8000682e:	270080e7          	jalr	624(ra) # 80002a9a <myproc>
    80006832:	87aa                	mv	a5,a0
    80006834:	5b98                	lw	a4,48(a5)
    80006836:	fe843783          	ld	a5,-24(s0)
    8000683a:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    8000683c:	fe843783          	ld	a5,-24(s0)
    80006840:	07a1                	addi	a5,a5,8
    80006842:	853e                	mv	a0,a5
    80006844:	ffffb097          	auipc	ra,0xffffb
    80006848:	b4a080e7          	jalr	-1206(ra) # 8000138e <release>
}
    8000684c:	0001                	nop
    8000684e:	60e2                	ld	ra,24(sp)
    80006850:	6442                	ld	s0,16(sp)
    80006852:	6105                	addi	sp,sp,32
    80006854:	8082                	ret

0000000080006856 <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    80006856:	1101                	addi	sp,sp,-32
    80006858:	ec06                	sd	ra,24(sp)
    8000685a:	e822                	sd	s0,16(sp)
    8000685c:	1000                	addi	s0,sp,32
    8000685e:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    80006862:	fe843783          	ld	a5,-24(s0)
    80006866:	07a1                	addi	a5,a5,8
    80006868:	853e                	mv	a0,a5
    8000686a:	ffffb097          	auipc	ra,0xffffb
    8000686e:	ac0080e7          	jalr	-1344(ra) # 8000132a <acquire>
  lk->locked = 0;
    80006872:	fe843783          	ld	a5,-24(s0)
    80006876:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    8000687a:	fe843783          	ld	a5,-24(s0)
    8000687e:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    80006882:	fe843503          	ld	a0,-24(s0)
    80006886:	ffffd097          	auipc	ra,0xffffd
    8000688a:	e52080e7          	jalr	-430(ra) # 800036d8 <wakeup>
  release(&lk->lk);
    8000688e:	fe843783          	ld	a5,-24(s0)
    80006892:	07a1                	addi	a5,a5,8
    80006894:	853e                	mv	a0,a5
    80006896:	ffffb097          	auipc	ra,0xffffb
    8000689a:	af8080e7          	jalr	-1288(ra) # 8000138e <release>
}
    8000689e:	0001                	nop
    800068a0:	60e2                	ld	ra,24(sp)
    800068a2:	6442                	ld	s0,16(sp)
    800068a4:	6105                	addi	sp,sp,32
    800068a6:	8082                	ret

00000000800068a8 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    800068a8:	7139                	addi	sp,sp,-64
    800068aa:	fc06                	sd	ra,56(sp)
    800068ac:	f822                	sd	s0,48(sp)
    800068ae:	f426                	sd	s1,40(sp)
    800068b0:	0080                	addi	s0,sp,64
    800068b2:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    800068b6:	fc843783          	ld	a5,-56(s0)
    800068ba:	07a1                	addi	a5,a5,8
    800068bc:	853e                	mv	a0,a5
    800068be:	ffffb097          	auipc	ra,0xffffb
    800068c2:	a6c080e7          	jalr	-1428(ra) # 8000132a <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800068c6:	fc843783          	ld	a5,-56(s0)
    800068ca:	439c                	lw	a5,0(a5)
    800068cc:	cf99                	beqz	a5,800068ea <holdingsleep+0x42>
    800068ce:	fc843783          	ld	a5,-56(s0)
    800068d2:	5784                	lw	s1,40(a5)
    800068d4:	ffffc097          	auipc	ra,0xffffc
    800068d8:	1c6080e7          	jalr	454(ra) # 80002a9a <myproc>
    800068dc:	87aa                	mv	a5,a0
    800068de:	5b9c                	lw	a5,48(a5)
    800068e0:	8726                	mv	a4,s1
    800068e2:	00f71463          	bne	a4,a5,800068ea <holdingsleep+0x42>
    800068e6:	4785                	li	a5,1
    800068e8:	a011                	j	800068ec <holdingsleep+0x44>
    800068ea:	4781                	li	a5,0
    800068ec:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    800068f0:	fc843783          	ld	a5,-56(s0)
    800068f4:	07a1                	addi	a5,a5,8
    800068f6:	853e                	mv	a0,a5
    800068f8:	ffffb097          	auipc	ra,0xffffb
    800068fc:	a96080e7          	jalr	-1386(ra) # 8000138e <release>
  return r;
    80006900:	fdc42783          	lw	a5,-36(s0)
}
    80006904:	853e                	mv	a0,a5
    80006906:	70e2                	ld	ra,56(sp)
    80006908:	7442                	ld	s0,48(sp)
    8000690a:	74a2                	ld	s1,40(sp)
    8000690c:	6121                	addi	sp,sp,64
    8000690e:	8082                	ret

0000000080006910 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    80006910:	1141                	addi	sp,sp,-16
    80006912:	e406                	sd	ra,8(sp)
    80006914:	e022                	sd	s0,0(sp)
    80006916:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006918:	00005597          	auipc	a1,0x5
    8000691c:	ca058593          	addi	a1,a1,-864 # 8000b5b8 <etext+0x5b8>
    80006920:	0002d517          	auipc	a0,0x2d
    80006924:	3b050513          	addi	a0,a0,944 # 80033cd0 <ftable>
    80006928:	ffffb097          	auipc	ra,0xffffb
    8000692c:	9d2080e7          	jalr	-1582(ra) # 800012fa <initlock>
}
    80006930:	0001                	nop
    80006932:	60a2                	ld	ra,8(sp)
    80006934:	6402                	ld	s0,0(sp)
    80006936:	0141                	addi	sp,sp,16
    80006938:	8082                	ret

000000008000693a <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    8000693a:	1101                	addi	sp,sp,-32
    8000693c:	ec06                	sd	ra,24(sp)
    8000693e:	e822                	sd	s0,16(sp)
    80006940:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006942:	0002d517          	auipc	a0,0x2d
    80006946:	38e50513          	addi	a0,a0,910 # 80033cd0 <ftable>
    8000694a:	ffffb097          	auipc	ra,0xffffb
    8000694e:	9e0080e7          	jalr	-1568(ra) # 8000132a <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006952:	0002d797          	auipc	a5,0x2d
    80006956:	39678793          	addi	a5,a5,918 # 80033ce8 <ftable+0x18>
    8000695a:	fef43423          	sd	a5,-24(s0)
    8000695e:	a815                	j	80006992 <filealloc+0x58>
    if(f->ref == 0){
    80006960:	fe843783          	ld	a5,-24(s0)
    80006964:	43dc                	lw	a5,4(a5)
    80006966:	e385                	bnez	a5,80006986 <filealloc+0x4c>
      f->ref = 1;
    80006968:	fe843783          	ld	a5,-24(s0)
    8000696c:	4705                	li	a4,1
    8000696e:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006970:	0002d517          	auipc	a0,0x2d
    80006974:	36050513          	addi	a0,a0,864 # 80033cd0 <ftable>
    80006978:	ffffb097          	auipc	ra,0xffffb
    8000697c:	a16080e7          	jalr	-1514(ra) # 8000138e <release>
      return f;
    80006980:	fe843783          	ld	a5,-24(s0)
    80006984:	a805                	j	800069b4 <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006986:	fe843783          	ld	a5,-24(s0)
    8000698a:	02878793          	addi	a5,a5,40
    8000698e:	fef43423          	sd	a5,-24(s0)
    80006992:	0002e797          	auipc	a5,0x2e
    80006996:	2f678793          	addi	a5,a5,758 # 80034c88 <disk>
    8000699a:	fe843703          	ld	a4,-24(s0)
    8000699e:	fcf761e3          	bltu	a4,a5,80006960 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    800069a2:	0002d517          	auipc	a0,0x2d
    800069a6:	32e50513          	addi	a0,a0,814 # 80033cd0 <ftable>
    800069aa:	ffffb097          	auipc	ra,0xffffb
    800069ae:	9e4080e7          	jalr	-1564(ra) # 8000138e <release>
  return 0;
    800069b2:	4781                	li	a5,0
}
    800069b4:	853e                	mv	a0,a5
    800069b6:	60e2                	ld	ra,24(sp)
    800069b8:	6442                	ld	s0,16(sp)
    800069ba:	6105                	addi	sp,sp,32
    800069bc:	8082                	ret

00000000800069be <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    800069be:	1101                	addi	sp,sp,-32
    800069c0:	ec06                	sd	ra,24(sp)
    800069c2:	e822                	sd	s0,16(sp)
    800069c4:	1000                	addi	s0,sp,32
    800069c6:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    800069ca:	0002d517          	auipc	a0,0x2d
    800069ce:	30650513          	addi	a0,a0,774 # 80033cd0 <ftable>
    800069d2:	ffffb097          	auipc	ra,0xffffb
    800069d6:	958080e7          	jalr	-1704(ra) # 8000132a <acquire>
  if(f->ref < 1)
    800069da:	fe843783          	ld	a5,-24(s0)
    800069de:	43dc                	lw	a5,4(a5)
    800069e0:	00f04a63          	bgtz	a5,800069f4 <filedup+0x36>
    panic("filedup");
    800069e4:	00005517          	auipc	a0,0x5
    800069e8:	bdc50513          	addi	a0,a0,-1060 # 8000b5c0 <etext+0x5c0>
    800069ec:	ffffa097          	auipc	ra,0xffffa
    800069f0:	2a0080e7          	jalr	672(ra) # 80000c8c <panic>
  f->ref++;
    800069f4:	fe843783          	ld	a5,-24(s0)
    800069f8:	43dc                	lw	a5,4(a5)
    800069fa:	2785                	addiw	a5,a5,1
    800069fc:	0007871b          	sext.w	a4,a5
    80006a00:	fe843783          	ld	a5,-24(s0)
    80006a04:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006a06:	0002d517          	auipc	a0,0x2d
    80006a0a:	2ca50513          	addi	a0,a0,714 # 80033cd0 <ftable>
    80006a0e:	ffffb097          	auipc	ra,0xffffb
    80006a12:	980080e7          	jalr	-1664(ra) # 8000138e <release>
  return f;
    80006a16:	fe843783          	ld	a5,-24(s0)
}
    80006a1a:	853e                	mv	a0,a5
    80006a1c:	60e2                	ld	ra,24(sp)
    80006a1e:	6442                	ld	s0,16(sp)
    80006a20:	6105                	addi	sp,sp,32
    80006a22:	8082                	ret

0000000080006a24 <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006a24:	715d                	addi	sp,sp,-80
    80006a26:	e486                	sd	ra,72(sp)
    80006a28:	e0a2                	sd	s0,64(sp)
    80006a2a:	0880                	addi	s0,sp,80
    80006a2c:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006a30:	0002d517          	auipc	a0,0x2d
    80006a34:	2a050513          	addi	a0,a0,672 # 80033cd0 <ftable>
    80006a38:	ffffb097          	auipc	ra,0xffffb
    80006a3c:	8f2080e7          	jalr	-1806(ra) # 8000132a <acquire>
  if(f->ref < 1)
    80006a40:	fb843783          	ld	a5,-72(s0)
    80006a44:	43dc                	lw	a5,4(a5)
    80006a46:	00f04a63          	bgtz	a5,80006a5a <fileclose+0x36>
    panic("fileclose");
    80006a4a:	00005517          	auipc	a0,0x5
    80006a4e:	b7e50513          	addi	a0,a0,-1154 # 8000b5c8 <etext+0x5c8>
    80006a52:	ffffa097          	auipc	ra,0xffffa
    80006a56:	23a080e7          	jalr	570(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006a5a:	fb843783          	ld	a5,-72(s0)
    80006a5e:	43dc                	lw	a5,4(a5)
    80006a60:	37fd                	addiw	a5,a5,-1
    80006a62:	0007871b          	sext.w	a4,a5
    80006a66:	fb843783          	ld	a5,-72(s0)
    80006a6a:	c3d8                	sw	a4,4(a5)
    80006a6c:	fb843783          	ld	a5,-72(s0)
    80006a70:	43dc                	lw	a5,4(a5)
    80006a72:	00f05b63          	blez	a5,80006a88 <fileclose+0x64>
    release(&ftable.lock);
    80006a76:	0002d517          	auipc	a0,0x2d
    80006a7a:	25a50513          	addi	a0,a0,602 # 80033cd0 <ftable>
    80006a7e:	ffffb097          	auipc	ra,0xffffb
    80006a82:	910080e7          	jalr	-1776(ra) # 8000138e <release>
    80006a86:	a879                	j	80006b24 <fileclose+0x100>
    return;
  }
  ff = *f;
    80006a88:	fb843783          	ld	a5,-72(s0)
    80006a8c:	638c                	ld	a1,0(a5)
    80006a8e:	6790                	ld	a2,8(a5)
    80006a90:	6b94                	ld	a3,16(a5)
    80006a92:	6f98                	ld	a4,24(a5)
    80006a94:	739c                	ld	a5,32(a5)
    80006a96:	fcb43423          	sd	a1,-56(s0)
    80006a9a:	fcc43823          	sd	a2,-48(s0)
    80006a9e:	fcd43c23          	sd	a3,-40(s0)
    80006aa2:	fee43023          	sd	a4,-32(s0)
    80006aa6:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006aaa:	fb843783          	ld	a5,-72(s0)
    80006aae:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006ab2:	fb843783          	ld	a5,-72(s0)
    80006ab6:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006aba:	0002d517          	auipc	a0,0x2d
    80006abe:	21650513          	addi	a0,a0,534 # 80033cd0 <ftable>
    80006ac2:	ffffb097          	auipc	ra,0xffffb
    80006ac6:	8cc080e7          	jalr	-1844(ra) # 8000138e <release>

  if(ff.type == FD_PIPE){
    80006aca:	fc842783          	lw	a5,-56(s0)
    80006ace:	873e                	mv	a4,a5
    80006ad0:	4785                	li	a5,1
    80006ad2:	00f71e63          	bne	a4,a5,80006aee <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006ad6:	fd843783          	ld	a5,-40(s0)
    80006ada:	fd144703          	lbu	a4,-47(s0)
    80006ade:	2701                	sext.w	a4,a4
    80006ae0:	85ba                	mv	a1,a4
    80006ae2:	853e                	mv	a0,a5
    80006ae4:	00000097          	auipc	ra,0x0
    80006ae8:	5aa080e7          	jalr	1450(ra) # 8000708e <pipeclose>
    80006aec:	a825                	j	80006b24 <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006aee:	fc842783          	lw	a5,-56(s0)
    80006af2:	873e                	mv	a4,a5
    80006af4:	4789                	li	a5,2
    80006af6:	00f70863          	beq	a4,a5,80006b06 <fileclose+0xe2>
    80006afa:	fc842783          	lw	a5,-56(s0)
    80006afe:	873e                	mv	a4,a5
    80006b00:	478d                	li	a5,3
    80006b02:	02f71163          	bne	a4,a5,80006b24 <fileclose+0x100>
    begin_op();
    80006b06:	00000097          	auipc	ra,0x0
    80006b0a:	884080e7          	jalr	-1916(ra) # 8000638a <begin_op>
    iput(ff.ip);
    80006b0e:	fe043783          	ld	a5,-32(s0)
    80006b12:	853e                	mv	a0,a5
    80006b14:	fffff097          	auipc	ra,0xfffff
    80006b18:	97a080e7          	jalr	-1670(ra) # 8000548e <iput>
    end_op();
    80006b1c:	00000097          	auipc	ra,0x0
    80006b20:	930080e7          	jalr	-1744(ra) # 8000644c <end_op>
  }
}
    80006b24:	60a6                	ld	ra,72(sp)
    80006b26:	6406                	ld	s0,64(sp)
    80006b28:	6161                	addi	sp,sp,80
    80006b2a:	8082                	ret

0000000080006b2c <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006b2c:	7139                	addi	sp,sp,-64
    80006b2e:	fc06                	sd	ra,56(sp)
    80006b30:	f822                	sd	s0,48(sp)
    80006b32:	0080                	addi	s0,sp,64
    80006b34:	fca43423          	sd	a0,-56(s0)
    80006b38:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006b3c:	ffffc097          	auipc	ra,0xffffc
    80006b40:	f5e080e7          	jalr	-162(ra) # 80002a9a <myproc>
    80006b44:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006b48:	fc843783          	ld	a5,-56(s0)
    80006b4c:	439c                	lw	a5,0(a5)
    80006b4e:	873e                	mv	a4,a5
    80006b50:	4789                	li	a5,2
    80006b52:	00f70963          	beq	a4,a5,80006b64 <filestat+0x38>
    80006b56:	fc843783          	ld	a5,-56(s0)
    80006b5a:	439c                	lw	a5,0(a5)
    80006b5c:	873e                	mv	a4,a5
    80006b5e:	478d                	li	a5,3
    80006b60:	06f71263          	bne	a4,a5,80006bc4 <filestat+0x98>
    ilock(f->ip);
    80006b64:	fc843783          	ld	a5,-56(s0)
    80006b68:	6f9c                	ld	a5,24(a5)
    80006b6a:	853e                	mv	a0,a5
    80006b6c:	ffffe097          	auipc	ra,0xffffe
    80006b70:	794080e7          	jalr	1940(ra) # 80005300 <ilock>
    stati(f->ip, &st);
    80006b74:	fc843783          	ld	a5,-56(s0)
    80006b78:	6f9c                	ld	a5,24(a5)
    80006b7a:	fd040713          	addi	a4,s0,-48
    80006b7e:	85ba                	mv	a1,a4
    80006b80:	853e                	mv	a0,a5
    80006b82:	fffff097          	auipc	ra,0xfffff
    80006b86:	cd0080e7          	jalr	-816(ra) # 80005852 <stati>
    iunlock(f->ip);
    80006b8a:	fc843783          	ld	a5,-56(s0)
    80006b8e:	6f9c                	ld	a5,24(a5)
    80006b90:	853e                	mv	a0,a5
    80006b92:	fffff097          	auipc	ra,0xfffff
    80006b96:	8a2080e7          	jalr	-1886(ra) # 80005434 <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006b9a:	fe843783          	ld	a5,-24(s0)
    80006b9e:	6bbc                	ld	a5,80(a5)
    80006ba0:	fd040713          	addi	a4,s0,-48
    80006ba4:	46e1                	li	a3,24
    80006ba6:	863a                	mv	a2,a4
    80006ba8:	fc043583          	ld	a1,-64(s0)
    80006bac:	853e                	mv	a0,a5
    80006bae:	ffffc097          	auipc	ra,0xffffc
    80006bb2:	9b6080e7          	jalr	-1610(ra) # 80002564 <copyout>
    80006bb6:	87aa                	mv	a5,a0
    80006bb8:	0007d463          	bgez	a5,80006bc0 <filestat+0x94>
      return -1;
    80006bbc:	57fd                	li	a5,-1
    80006bbe:	a021                	j	80006bc6 <filestat+0x9a>
    return 0;
    80006bc0:	4781                	li	a5,0
    80006bc2:	a011                	j	80006bc6 <filestat+0x9a>
  }
  return -1;
    80006bc4:	57fd                	li	a5,-1
}
    80006bc6:	853e                	mv	a0,a5
    80006bc8:	70e2                	ld	ra,56(sp)
    80006bca:	7442                	ld	s0,48(sp)
    80006bcc:	6121                	addi	sp,sp,64
    80006bce:	8082                	ret

0000000080006bd0 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006bd0:	7139                	addi	sp,sp,-64
    80006bd2:	fc06                	sd	ra,56(sp)
    80006bd4:	f822                	sd	s0,48(sp)
    80006bd6:	0080                	addi	s0,sp,64
    80006bd8:	fca43c23          	sd	a0,-40(s0)
    80006bdc:	fcb43823          	sd	a1,-48(s0)
    80006be0:	87b2                	mv	a5,a2
    80006be2:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006be6:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006bea:	fd843783          	ld	a5,-40(s0)
    80006bee:	0087c783          	lbu	a5,8(a5)
    80006bf2:	e399                	bnez	a5,80006bf8 <fileread+0x28>
    return -1;
    80006bf4:	57fd                	li	a5,-1
    80006bf6:	aa1d                	j	80006d2c <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006bf8:	fd843783          	ld	a5,-40(s0)
    80006bfc:	439c                	lw	a5,0(a5)
    80006bfe:	873e                	mv	a4,a5
    80006c00:	4785                	li	a5,1
    80006c02:	02f71363          	bne	a4,a5,80006c28 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006c06:	fd843783          	ld	a5,-40(s0)
    80006c0a:	6b9c                	ld	a5,16(a5)
    80006c0c:	fcc42703          	lw	a4,-52(s0)
    80006c10:	863a                	mv	a2,a4
    80006c12:	fd043583          	ld	a1,-48(s0)
    80006c16:	853e                	mv	a0,a5
    80006c18:	00000097          	auipc	ra,0x0
    80006c1c:	670080e7          	jalr	1648(ra) # 80007288 <piperead>
    80006c20:	87aa                	mv	a5,a0
    80006c22:	fef42623          	sw	a5,-20(s0)
    80006c26:	a209                	j	80006d28 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006c28:	fd843783          	ld	a5,-40(s0)
    80006c2c:	439c                	lw	a5,0(a5)
    80006c2e:	873e                	mv	a4,a5
    80006c30:	478d                	li	a5,3
    80006c32:	06f71863          	bne	a4,a5,80006ca2 <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006c36:	fd843783          	ld	a5,-40(s0)
    80006c3a:	02479783          	lh	a5,36(a5)
    80006c3e:	2781                	sext.w	a5,a5
    80006c40:	0207c863          	bltz	a5,80006c70 <fileread+0xa0>
    80006c44:	fd843783          	ld	a5,-40(s0)
    80006c48:	02479783          	lh	a5,36(a5)
    80006c4c:	0007871b          	sext.w	a4,a5
    80006c50:	47a5                	li	a5,9
    80006c52:	00e7cf63          	blt	a5,a4,80006c70 <fileread+0xa0>
    80006c56:	fd843783          	ld	a5,-40(s0)
    80006c5a:	02479783          	lh	a5,36(a5)
    80006c5e:	2781                	sext.w	a5,a5
    80006c60:	0002d717          	auipc	a4,0x2d
    80006c64:	fd070713          	addi	a4,a4,-48 # 80033c30 <devsw>
    80006c68:	0792                	slli	a5,a5,0x4
    80006c6a:	97ba                	add	a5,a5,a4
    80006c6c:	639c                	ld	a5,0(a5)
    80006c6e:	e399                	bnez	a5,80006c74 <fileread+0xa4>
      return -1;
    80006c70:	57fd                	li	a5,-1
    80006c72:	a86d                	j	80006d2c <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006c74:	fd843783          	ld	a5,-40(s0)
    80006c78:	02479783          	lh	a5,36(a5)
    80006c7c:	2781                	sext.w	a5,a5
    80006c7e:	0002d717          	auipc	a4,0x2d
    80006c82:	fb270713          	addi	a4,a4,-78 # 80033c30 <devsw>
    80006c86:	0792                	slli	a5,a5,0x4
    80006c88:	97ba                	add	a5,a5,a4
    80006c8a:	6398                	ld	a4,0(a5)
    80006c8c:	fcc42783          	lw	a5,-52(s0)
    80006c90:	863e                	mv	a2,a5
    80006c92:	fd043583          	ld	a1,-48(s0)
    80006c96:	4505                	li	a0,1
    80006c98:	9702                	jalr	a4
    80006c9a:	87aa                	mv	a5,a0
    80006c9c:	fef42623          	sw	a5,-20(s0)
    80006ca0:	a061                	j	80006d28 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006ca2:	fd843783          	ld	a5,-40(s0)
    80006ca6:	439c                	lw	a5,0(a5)
    80006ca8:	873e                	mv	a4,a5
    80006caa:	4789                	li	a5,2
    80006cac:	06f71663          	bne	a4,a5,80006d18 <fileread+0x148>
    ilock(f->ip);
    80006cb0:	fd843783          	ld	a5,-40(s0)
    80006cb4:	6f9c                	ld	a5,24(a5)
    80006cb6:	853e                	mv	a0,a5
    80006cb8:	ffffe097          	auipc	ra,0xffffe
    80006cbc:	648080e7          	jalr	1608(ra) # 80005300 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006cc0:	fd843783          	ld	a5,-40(s0)
    80006cc4:	6f88                	ld	a0,24(a5)
    80006cc6:	fd843783          	ld	a5,-40(s0)
    80006cca:	539c                	lw	a5,32(a5)
    80006ccc:	fcc42703          	lw	a4,-52(s0)
    80006cd0:	86be                	mv	a3,a5
    80006cd2:	fd043603          	ld	a2,-48(s0)
    80006cd6:	4585                	li	a1,1
    80006cd8:	fffff097          	auipc	ra,0xfffff
    80006cdc:	bde080e7          	jalr	-1058(ra) # 800058b6 <readi>
    80006ce0:	87aa                	mv	a5,a0
    80006ce2:	fef42623          	sw	a5,-20(s0)
    80006ce6:	fec42783          	lw	a5,-20(s0)
    80006cea:	2781                	sext.w	a5,a5
    80006cec:	00f05d63          	blez	a5,80006d06 <fileread+0x136>
      f->off += r;
    80006cf0:	fd843783          	ld	a5,-40(s0)
    80006cf4:	5398                	lw	a4,32(a5)
    80006cf6:	fec42783          	lw	a5,-20(s0)
    80006cfa:	9fb9                	addw	a5,a5,a4
    80006cfc:	0007871b          	sext.w	a4,a5
    80006d00:	fd843783          	ld	a5,-40(s0)
    80006d04:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006d06:	fd843783          	ld	a5,-40(s0)
    80006d0a:	6f9c                	ld	a5,24(a5)
    80006d0c:	853e                	mv	a0,a5
    80006d0e:	ffffe097          	auipc	ra,0xffffe
    80006d12:	726080e7          	jalr	1830(ra) # 80005434 <iunlock>
    80006d16:	a809                	j	80006d28 <fileread+0x158>
  } else {
    panic("fileread");
    80006d18:	00005517          	auipc	a0,0x5
    80006d1c:	8c050513          	addi	a0,a0,-1856 # 8000b5d8 <etext+0x5d8>
    80006d20:	ffffa097          	auipc	ra,0xffffa
    80006d24:	f6c080e7          	jalr	-148(ra) # 80000c8c <panic>
  }

  return r;
    80006d28:	fec42783          	lw	a5,-20(s0)
}
    80006d2c:	853e                	mv	a0,a5
    80006d2e:	70e2                	ld	ra,56(sp)
    80006d30:	7442                	ld	s0,48(sp)
    80006d32:	6121                	addi	sp,sp,64
    80006d34:	8082                	ret

0000000080006d36 <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006d36:	715d                	addi	sp,sp,-80
    80006d38:	e486                	sd	ra,72(sp)
    80006d3a:	e0a2                	sd	s0,64(sp)
    80006d3c:	0880                	addi	s0,sp,80
    80006d3e:	fca43423          	sd	a0,-56(s0)
    80006d42:	fcb43023          	sd	a1,-64(s0)
    80006d46:	87b2                	mv	a5,a2
    80006d48:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006d4c:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006d50:	fc843783          	ld	a5,-56(s0)
    80006d54:	0097c783          	lbu	a5,9(a5)
    80006d58:	e399                	bnez	a5,80006d5e <filewrite+0x28>
    return -1;
    80006d5a:	57fd                	li	a5,-1
    80006d5c:	aad1                	j	80006f30 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006d5e:	fc843783          	ld	a5,-56(s0)
    80006d62:	439c                	lw	a5,0(a5)
    80006d64:	873e                	mv	a4,a5
    80006d66:	4785                	li	a5,1
    80006d68:	02f71363          	bne	a4,a5,80006d8e <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006d6c:	fc843783          	ld	a5,-56(s0)
    80006d70:	6b9c                	ld	a5,16(a5)
    80006d72:	fbc42703          	lw	a4,-68(s0)
    80006d76:	863a                	mv	a2,a4
    80006d78:	fc043583          	ld	a1,-64(s0)
    80006d7c:	853e                	mv	a0,a5
    80006d7e:	00000097          	auipc	ra,0x0
    80006d82:	3b8080e7          	jalr	952(ra) # 80007136 <pipewrite>
    80006d86:	87aa                	mv	a5,a0
    80006d88:	fef42623          	sw	a5,-20(s0)
    80006d8c:	a245                	j	80006f2c <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006d8e:	fc843783          	ld	a5,-56(s0)
    80006d92:	439c                	lw	a5,0(a5)
    80006d94:	873e                	mv	a4,a5
    80006d96:	478d                	li	a5,3
    80006d98:	06f71863          	bne	a4,a5,80006e08 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006d9c:	fc843783          	ld	a5,-56(s0)
    80006da0:	02479783          	lh	a5,36(a5)
    80006da4:	2781                	sext.w	a5,a5
    80006da6:	0207c863          	bltz	a5,80006dd6 <filewrite+0xa0>
    80006daa:	fc843783          	ld	a5,-56(s0)
    80006dae:	02479783          	lh	a5,36(a5)
    80006db2:	0007871b          	sext.w	a4,a5
    80006db6:	47a5                	li	a5,9
    80006db8:	00e7cf63          	blt	a5,a4,80006dd6 <filewrite+0xa0>
    80006dbc:	fc843783          	ld	a5,-56(s0)
    80006dc0:	02479783          	lh	a5,36(a5)
    80006dc4:	2781                	sext.w	a5,a5
    80006dc6:	0002d717          	auipc	a4,0x2d
    80006dca:	e6a70713          	addi	a4,a4,-406 # 80033c30 <devsw>
    80006dce:	0792                	slli	a5,a5,0x4
    80006dd0:	97ba                	add	a5,a5,a4
    80006dd2:	679c                	ld	a5,8(a5)
    80006dd4:	e399                	bnez	a5,80006dda <filewrite+0xa4>
      return -1;
    80006dd6:	57fd                	li	a5,-1
    80006dd8:	aaa1                	j	80006f30 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006dda:	fc843783          	ld	a5,-56(s0)
    80006dde:	02479783          	lh	a5,36(a5)
    80006de2:	2781                	sext.w	a5,a5
    80006de4:	0002d717          	auipc	a4,0x2d
    80006de8:	e4c70713          	addi	a4,a4,-436 # 80033c30 <devsw>
    80006dec:	0792                	slli	a5,a5,0x4
    80006dee:	97ba                	add	a5,a5,a4
    80006df0:	6798                	ld	a4,8(a5)
    80006df2:	fbc42783          	lw	a5,-68(s0)
    80006df6:	863e                	mv	a2,a5
    80006df8:	fc043583          	ld	a1,-64(s0)
    80006dfc:	4505                	li	a0,1
    80006dfe:	9702                	jalr	a4
    80006e00:	87aa                	mv	a5,a0
    80006e02:	fef42623          	sw	a5,-20(s0)
    80006e06:	a21d                	j	80006f2c <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006e08:	fc843783          	ld	a5,-56(s0)
    80006e0c:	439c                	lw	a5,0(a5)
    80006e0e:	873e                	mv	a4,a5
    80006e10:	4789                	li	a5,2
    80006e12:	10f71563          	bne	a4,a5,80006f1c <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006e16:	6785                	lui	a5,0x1
    80006e18:	c007879b          	addiw	a5,a5,-1024
    80006e1c:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006e20:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006e24:	a0d9                	j	80006eea <filewrite+0x1b4>
      int n1 = n - i;
    80006e26:	fbc42703          	lw	a4,-68(s0)
    80006e2a:	fe842783          	lw	a5,-24(s0)
    80006e2e:	40f707bb          	subw	a5,a4,a5
    80006e32:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006e36:	fe442703          	lw	a4,-28(s0)
    80006e3a:	fe042783          	lw	a5,-32(s0)
    80006e3e:	2701                	sext.w	a4,a4
    80006e40:	2781                	sext.w	a5,a5
    80006e42:	00e7d663          	bge	a5,a4,80006e4e <filewrite+0x118>
        n1 = max;
    80006e46:	fe042783          	lw	a5,-32(s0)
    80006e4a:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006e4e:	fffff097          	auipc	ra,0xfffff
    80006e52:	53c080e7          	jalr	1340(ra) # 8000638a <begin_op>
      ilock(f->ip);
    80006e56:	fc843783          	ld	a5,-56(s0)
    80006e5a:	6f9c                	ld	a5,24(a5)
    80006e5c:	853e                	mv	a0,a5
    80006e5e:	ffffe097          	auipc	ra,0xffffe
    80006e62:	4a2080e7          	jalr	1186(ra) # 80005300 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006e66:	fc843783          	ld	a5,-56(s0)
    80006e6a:	6f88                	ld	a0,24(a5)
    80006e6c:	fe842703          	lw	a4,-24(s0)
    80006e70:	fc043783          	ld	a5,-64(s0)
    80006e74:	00f70633          	add	a2,a4,a5
    80006e78:	fc843783          	ld	a5,-56(s0)
    80006e7c:	539c                	lw	a5,32(a5)
    80006e7e:	fe442703          	lw	a4,-28(s0)
    80006e82:	86be                	mv	a3,a5
    80006e84:	4585                	li	a1,1
    80006e86:	fffff097          	auipc	ra,0xfffff
    80006e8a:	bc8080e7          	jalr	-1080(ra) # 80005a4e <writei>
    80006e8e:	87aa                	mv	a5,a0
    80006e90:	fcf42e23          	sw	a5,-36(s0)
    80006e94:	fdc42783          	lw	a5,-36(s0)
    80006e98:	2781                	sext.w	a5,a5
    80006e9a:	00f05d63          	blez	a5,80006eb4 <filewrite+0x17e>
        f->off += r;
    80006e9e:	fc843783          	ld	a5,-56(s0)
    80006ea2:	5398                	lw	a4,32(a5)
    80006ea4:	fdc42783          	lw	a5,-36(s0)
    80006ea8:	9fb9                	addw	a5,a5,a4
    80006eaa:	0007871b          	sext.w	a4,a5
    80006eae:	fc843783          	ld	a5,-56(s0)
    80006eb2:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006eb4:	fc843783          	ld	a5,-56(s0)
    80006eb8:	6f9c                	ld	a5,24(a5)
    80006eba:	853e                	mv	a0,a5
    80006ebc:	ffffe097          	auipc	ra,0xffffe
    80006ec0:	578080e7          	jalr	1400(ra) # 80005434 <iunlock>
      end_op();
    80006ec4:	fffff097          	auipc	ra,0xfffff
    80006ec8:	588080e7          	jalr	1416(ra) # 8000644c <end_op>

      if(r != n1){
    80006ecc:	fdc42703          	lw	a4,-36(s0)
    80006ed0:	fe442783          	lw	a5,-28(s0)
    80006ed4:	2701                	sext.w	a4,a4
    80006ed6:	2781                	sext.w	a5,a5
    80006ed8:	02f71263          	bne	a4,a5,80006efc <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006edc:	fe842703          	lw	a4,-24(s0)
    80006ee0:	fdc42783          	lw	a5,-36(s0)
    80006ee4:	9fb9                	addw	a5,a5,a4
    80006ee6:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006eea:	fe842703          	lw	a4,-24(s0)
    80006eee:	fbc42783          	lw	a5,-68(s0)
    80006ef2:	2701                	sext.w	a4,a4
    80006ef4:	2781                	sext.w	a5,a5
    80006ef6:	f2f748e3          	blt	a4,a5,80006e26 <filewrite+0xf0>
    80006efa:	a011                	j	80006efe <filewrite+0x1c8>
        break;
    80006efc:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006efe:	fe842703          	lw	a4,-24(s0)
    80006f02:	fbc42783          	lw	a5,-68(s0)
    80006f06:	2701                	sext.w	a4,a4
    80006f08:	2781                	sext.w	a5,a5
    80006f0a:	00f71563          	bne	a4,a5,80006f14 <filewrite+0x1de>
    80006f0e:	fbc42783          	lw	a5,-68(s0)
    80006f12:	a011                	j	80006f16 <filewrite+0x1e0>
    80006f14:	57fd                	li	a5,-1
    80006f16:	fef42623          	sw	a5,-20(s0)
    80006f1a:	a809                	j	80006f2c <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80006f1c:	00004517          	auipc	a0,0x4
    80006f20:	6cc50513          	addi	a0,a0,1740 # 8000b5e8 <etext+0x5e8>
    80006f24:	ffffa097          	auipc	ra,0xffffa
    80006f28:	d68080e7          	jalr	-664(ra) # 80000c8c <panic>
  }

  return ret;
    80006f2c:	fec42783          	lw	a5,-20(s0)
}
    80006f30:	853e                	mv	a0,a5
    80006f32:	60a6                	ld	ra,72(sp)
    80006f34:	6406                	ld	s0,64(sp)
    80006f36:	6161                	addi	sp,sp,80
    80006f38:	8082                	ret

0000000080006f3a <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80006f3a:	7179                	addi	sp,sp,-48
    80006f3c:	f406                	sd	ra,40(sp)
    80006f3e:	f022                	sd	s0,32(sp)
    80006f40:	1800                	addi	s0,sp,48
    80006f42:	fca43c23          	sd	a0,-40(s0)
    80006f46:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80006f4a:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80006f4e:	fd043783          	ld	a5,-48(s0)
    80006f52:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    80006f56:	fd043783          	ld	a5,-48(s0)
    80006f5a:	6398                	ld	a4,0(a5)
    80006f5c:	fd843783          	ld	a5,-40(s0)
    80006f60:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    80006f62:	00000097          	auipc	ra,0x0
    80006f66:	9d8080e7          	jalr	-1576(ra) # 8000693a <filealloc>
    80006f6a:	872a                	mv	a4,a0
    80006f6c:	fd843783          	ld	a5,-40(s0)
    80006f70:	e398                	sd	a4,0(a5)
    80006f72:	fd843783          	ld	a5,-40(s0)
    80006f76:	639c                	ld	a5,0(a5)
    80006f78:	c3e9                	beqz	a5,8000703a <pipealloc+0x100>
    80006f7a:	00000097          	auipc	ra,0x0
    80006f7e:	9c0080e7          	jalr	-1600(ra) # 8000693a <filealloc>
    80006f82:	872a                	mv	a4,a0
    80006f84:	fd043783          	ld	a5,-48(s0)
    80006f88:	e398                	sd	a4,0(a5)
    80006f8a:	fd043783          	ld	a5,-48(s0)
    80006f8e:	639c                	ld	a5,0(a5)
    80006f90:	c7cd                	beqz	a5,8000703a <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    80006f92:	ffffa097          	auipc	ra,0xffffa
    80006f96:	244080e7          	jalr	580(ra) # 800011d6 <kalloc>
    80006f9a:	fea43423          	sd	a0,-24(s0)
    80006f9e:	fe843783          	ld	a5,-24(s0)
    80006fa2:	cfd1                	beqz	a5,8000703e <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    80006fa4:	fe843783          	ld	a5,-24(s0)
    80006fa8:	4705                	li	a4,1
    80006faa:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80006fae:	fe843783          	ld	a5,-24(s0)
    80006fb2:	4705                	li	a4,1
    80006fb4:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    80006fb8:	fe843783          	ld	a5,-24(s0)
    80006fbc:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    80006fc0:	fe843783          	ld	a5,-24(s0)
    80006fc4:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    80006fc8:	fe843783          	ld	a5,-24(s0)
    80006fcc:	00004597          	auipc	a1,0x4
    80006fd0:	62c58593          	addi	a1,a1,1580 # 8000b5f8 <etext+0x5f8>
    80006fd4:	853e                	mv	a0,a5
    80006fd6:	ffffa097          	auipc	ra,0xffffa
    80006fda:	324080e7          	jalr	804(ra) # 800012fa <initlock>
  (*f0)->type = FD_PIPE;
    80006fde:	fd843783          	ld	a5,-40(s0)
    80006fe2:	639c                	ld	a5,0(a5)
    80006fe4:	4705                	li	a4,1
    80006fe6:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    80006fe8:	fd843783          	ld	a5,-40(s0)
    80006fec:	639c                	ld	a5,0(a5)
    80006fee:	4705                	li	a4,1
    80006ff0:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    80006ff4:	fd843783          	ld	a5,-40(s0)
    80006ff8:	639c                	ld	a5,0(a5)
    80006ffa:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    80006ffe:	fd843783          	ld	a5,-40(s0)
    80007002:	639c                	ld	a5,0(a5)
    80007004:	fe843703          	ld	a4,-24(s0)
    80007008:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    8000700a:	fd043783          	ld	a5,-48(s0)
    8000700e:	639c                	ld	a5,0(a5)
    80007010:	4705                	li	a4,1
    80007012:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    80007014:	fd043783          	ld	a5,-48(s0)
    80007018:	639c                	ld	a5,0(a5)
    8000701a:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    8000701e:	fd043783          	ld	a5,-48(s0)
    80007022:	639c                	ld	a5,0(a5)
    80007024:	4705                	li	a4,1
    80007026:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    8000702a:	fd043783          	ld	a5,-48(s0)
    8000702e:	639c                	ld	a5,0(a5)
    80007030:	fe843703          	ld	a4,-24(s0)
    80007034:	eb98                	sd	a4,16(a5)
  return 0;
    80007036:	4781                	li	a5,0
    80007038:	a0b1                	j	80007084 <pipealloc+0x14a>
    goto bad;
    8000703a:	0001                	nop
    8000703c:	a011                	j	80007040 <pipealloc+0x106>
    goto bad;
    8000703e:	0001                	nop

 bad:
  if(pi)
    80007040:	fe843783          	ld	a5,-24(s0)
    80007044:	c799                	beqz	a5,80007052 <pipealloc+0x118>
    kfree((char*)pi);
    80007046:	fe843503          	ld	a0,-24(s0)
    8000704a:	ffffa097          	auipc	ra,0xffffa
    8000704e:	0e6080e7          	jalr	230(ra) # 80001130 <kfree>
  if(*f0)
    80007052:	fd843783          	ld	a5,-40(s0)
    80007056:	639c                	ld	a5,0(a5)
    80007058:	cb89                	beqz	a5,8000706a <pipealloc+0x130>
    fileclose(*f0);
    8000705a:	fd843783          	ld	a5,-40(s0)
    8000705e:	639c                	ld	a5,0(a5)
    80007060:	853e                	mv	a0,a5
    80007062:	00000097          	auipc	ra,0x0
    80007066:	9c2080e7          	jalr	-1598(ra) # 80006a24 <fileclose>
  if(*f1)
    8000706a:	fd043783          	ld	a5,-48(s0)
    8000706e:	639c                	ld	a5,0(a5)
    80007070:	cb89                	beqz	a5,80007082 <pipealloc+0x148>
    fileclose(*f1);
    80007072:	fd043783          	ld	a5,-48(s0)
    80007076:	639c                	ld	a5,0(a5)
    80007078:	853e                	mv	a0,a5
    8000707a:	00000097          	auipc	ra,0x0
    8000707e:	9aa080e7          	jalr	-1622(ra) # 80006a24 <fileclose>
  return -1;
    80007082:	57fd                	li	a5,-1
}
    80007084:	853e                	mv	a0,a5
    80007086:	70a2                	ld	ra,40(sp)
    80007088:	7402                	ld	s0,32(sp)
    8000708a:	6145                	addi	sp,sp,48
    8000708c:	8082                	ret

000000008000708e <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    8000708e:	1101                	addi	sp,sp,-32
    80007090:	ec06                	sd	ra,24(sp)
    80007092:	e822                	sd	s0,16(sp)
    80007094:	1000                	addi	s0,sp,32
    80007096:	fea43423          	sd	a0,-24(s0)
    8000709a:	87ae                	mv	a5,a1
    8000709c:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    800070a0:	fe843783          	ld	a5,-24(s0)
    800070a4:	853e                	mv	a0,a5
    800070a6:	ffffa097          	auipc	ra,0xffffa
    800070aa:	284080e7          	jalr	644(ra) # 8000132a <acquire>
  if(writable){
    800070ae:	fe442783          	lw	a5,-28(s0)
    800070b2:	2781                	sext.w	a5,a5
    800070b4:	cf99                	beqz	a5,800070d2 <pipeclose+0x44>
    pi->writeopen = 0;
    800070b6:	fe843783          	ld	a5,-24(s0)
    800070ba:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800070be:	fe843783          	ld	a5,-24(s0)
    800070c2:	21878793          	addi	a5,a5,536
    800070c6:	853e                	mv	a0,a5
    800070c8:	ffffc097          	auipc	ra,0xffffc
    800070cc:	610080e7          	jalr	1552(ra) # 800036d8 <wakeup>
    800070d0:	a831                	j	800070ec <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800070d2:	fe843783          	ld	a5,-24(s0)
    800070d6:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    800070da:	fe843783          	ld	a5,-24(s0)
    800070de:	21c78793          	addi	a5,a5,540
    800070e2:	853e                	mv	a0,a5
    800070e4:	ffffc097          	auipc	ra,0xffffc
    800070e8:	5f4080e7          	jalr	1524(ra) # 800036d8 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    800070ec:	fe843783          	ld	a5,-24(s0)
    800070f0:	2207a783          	lw	a5,544(a5)
    800070f4:	e785                	bnez	a5,8000711c <pipeclose+0x8e>
    800070f6:	fe843783          	ld	a5,-24(s0)
    800070fa:	2247a783          	lw	a5,548(a5)
    800070fe:	ef99                	bnez	a5,8000711c <pipeclose+0x8e>
    release(&pi->lock);
    80007100:	fe843783          	ld	a5,-24(s0)
    80007104:	853e                	mv	a0,a5
    80007106:	ffffa097          	auipc	ra,0xffffa
    8000710a:	288080e7          	jalr	648(ra) # 8000138e <release>
    kfree((char*)pi);
    8000710e:	fe843503          	ld	a0,-24(s0)
    80007112:	ffffa097          	auipc	ra,0xffffa
    80007116:	01e080e7          	jalr	30(ra) # 80001130 <kfree>
    8000711a:	a809                	j	8000712c <pipeclose+0x9e>
  } else
    release(&pi->lock);
    8000711c:	fe843783          	ld	a5,-24(s0)
    80007120:	853e                	mv	a0,a5
    80007122:	ffffa097          	auipc	ra,0xffffa
    80007126:	26c080e7          	jalr	620(ra) # 8000138e <release>
}
    8000712a:	0001                	nop
    8000712c:	0001                	nop
    8000712e:	60e2                	ld	ra,24(sp)
    80007130:	6442                	ld	s0,16(sp)
    80007132:	6105                	addi	sp,sp,32
    80007134:	8082                	ret

0000000080007136 <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    80007136:	715d                	addi	sp,sp,-80
    80007138:	e486                	sd	ra,72(sp)
    8000713a:	e0a2                	sd	s0,64(sp)
    8000713c:	0880                	addi	s0,sp,80
    8000713e:	fca43423          	sd	a0,-56(s0)
    80007142:	fcb43023          	sd	a1,-64(s0)
    80007146:	87b2                	mv	a5,a2
    80007148:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    8000714c:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007150:	ffffc097          	auipc	ra,0xffffc
    80007154:	94a080e7          	jalr	-1718(ra) # 80002a9a <myproc>
    80007158:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    8000715c:	fc843783          	ld	a5,-56(s0)
    80007160:	853e                	mv	a0,a5
    80007162:	ffffa097          	auipc	ra,0xffffa
    80007166:	1c8080e7          	jalr	456(ra) # 8000132a <acquire>
  while(i < n){
    8000716a:	a8f1                	j	80007246 <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    8000716c:	fc843783          	ld	a5,-56(s0)
    80007170:	2207a783          	lw	a5,544(a5)
    80007174:	cb89                	beqz	a5,80007186 <pipewrite+0x50>
    80007176:	fe043503          	ld	a0,-32(s0)
    8000717a:	ffffc097          	auipc	ra,0xffffc
    8000717e:	6f0080e7          	jalr	1776(ra) # 8000386a <killed>
    80007182:	87aa                	mv	a5,a0
    80007184:	cb91                	beqz	a5,80007198 <pipewrite+0x62>
      release(&pi->lock);
    80007186:	fc843783          	ld	a5,-56(s0)
    8000718a:	853e                	mv	a0,a5
    8000718c:	ffffa097          	auipc	ra,0xffffa
    80007190:	202080e7          	jalr	514(ra) # 8000138e <release>
      return -1;
    80007194:	57fd                	li	a5,-1
    80007196:	a0e5                	j	8000727e <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80007198:	fc843783          	ld	a5,-56(s0)
    8000719c:	21c7a703          	lw	a4,540(a5)
    800071a0:	fc843783          	ld	a5,-56(s0)
    800071a4:	2187a783          	lw	a5,536(a5)
    800071a8:	2007879b          	addiw	a5,a5,512
    800071ac:	2781                	sext.w	a5,a5
    800071ae:	02f71863          	bne	a4,a5,800071de <pipewrite+0xa8>
      wakeup(&pi->nread);
    800071b2:	fc843783          	ld	a5,-56(s0)
    800071b6:	21878793          	addi	a5,a5,536
    800071ba:	853e                	mv	a0,a5
    800071bc:	ffffc097          	auipc	ra,0xffffc
    800071c0:	51c080e7          	jalr	1308(ra) # 800036d8 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800071c4:	fc843783          	ld	a5,-56(s0)
    800071c8:	21c78793          	addi	a5,a5,540
    800071cc:	fc843703          	ld	a4,-56(s0)
    800071d0:	85ba                	mv	a1,a4
    800071d2:	853e                	mv	a0,a5
    800071d4:	ffffc097          	auipc	ra,0xffffc
    800071d8:	488080e7          	jalr	1160(ra) # 8000365c <sleep>
    800071dc:	a0ad                	j	80007246 <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800071de:	fe043783          	ld	a5,-32(s0)
    800071e2:	6ba8                	ld	a0,80(a5)
    800071e4:	fec42703          	lw	a4,-20(s0)
    800071e8:	fc043783          	ld	a5,-64(s0)
    800071ec:	973e                	add	a4,a4,a5
    800071ee:	fdf40793          	addi	a5,s0,-33
    800071f2:	4685                	li	a3,1
    800071f4:	863a                	mv	a2,a4
    800071f6:	85be                	mv	a1,a5
    800071f8:	ffffb097          	auipc	ra,0xffffb
    800071fc:	43a080e7          	jalr	1082(ra) # 80002632 <copyin>
    80007200:	87aa                	mv	a5,a0
    80007202:	873e                	mv	a4,a5
    80007204:	57fd                	li	a5,-1
    80007206:	04f70963          	beq	a4,a5,80007258 <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    8000720a:	fc843783          	ld	a5,-56(s0)
    8000720e:	21c7a783          	lw	a5,540(a5)
    80007212:	2781                	sext.w	a5,a5
    80007214:	0017871b          	addiw	a4,a5,1
    80007218:	0007069b          	sext.w	a3,a4
    8000721c:	fc843703          	ld	a4,-56(s0)
    80007220:	20d72e23          	sw	a3,540(a4)
    80007224:	1ff7f793          	andi	a5,a5,511
    80007228:	2781                	sext.w	a5,a5
    8000722a:	fdf44703          	lbu	a4,-33(s0)
    8000722e:	fc843683          	ld	a3,-56(s0)
    80007232:	1782                	slli	a5,a5,0x20
    80007234:	9381                	srli	a5,a5,0x20
    80007236:	97b6                	add	a5,a5,a3
    80007238:	00e78c23          	sb	a4,24(a5)
      i++;
    8000723c:	fec42783          	lw	a5,-20(s0)
    80007240:	2785                	addiw	a5,a5,1
    80007242:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    80007246:	fec42703          	lw	a4,-20(s0)
    8000724a:	fbc42783          	lw	a5,-68(s0)
    8000724e:	2701                	sext.w	a4,a4
    80007250:	2781                	sext.w	a5,a5
    80007252:	f0f74de3          	blt	a4,a5,8000716c <pipewrite+0x36>
    80007256:	a011                	j	8000725a <pipewrite+0x124>
        break;
    80007258:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    8000725a:	fc843783          	ld	a5,-56(s0)
    8000725e:	21878793          	addi	a5,a5,536
    80007262:	853e                	mv	a0,a5
    80007264:	ffffc097          	auipc	ra,0xffffc
    80007268:	474080e7          	jalr	1140(ra) # 800036d8 <wakeup>
  release(&pi->lock);
    8000726c:	fc843783          	ld	a5,-56(s0)
    80007270:	853e                	mv	a0,a5
    80007272:	ffffa097          	auipc	ra,0xffffa
    80007276:	11c080e7          	jalr	284(ra) # 8000138e <release>

  return i;
    8000727a:	fec42783          	lw	a5,-20(s0)
}
    8000727e:	853e                	mv	a0,a5
    80007280:	60a6                	ld	ra,72(sp)
    80007282:	6406                	ld	s0,64(sp)
    80007284:	6161                	addi	sp,sp,80
    80007286:	8082                	ret

0000000080007288 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80007288:	715d                	addi	sp,sp,-80
    8000728a:	e486                	sd	ra,72(sp)
    8000728c:	e0a2                	sd	s0,64(sp)
    8000728e:	0880                	addi	s0,sp,80
    80007290:	fca43423          	sd	a0,-56(s0)
    80007294:	fcb43023          	sd	a1,-64(s0)
    80007298:	87b2                	mv	a5,a2
    8000729a:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    8000729e:	ffffb097          	auipc	ra,0xffffb
    800072a2:	7fc080e7          	jalr	2044(ra) # 80002a9a <myproc>
    800072a6:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    800072aa:	fc843783          	ld	a5,-56(s0)
    800072ae:	853e                	mv	a0,a5
    800072b0:	ffffa097          	auipc	ra,0xffffa
    800072b4:	07a080e7          	jalr	122(ra) # 8000132a <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800072b8:	a835                	j	800072f4 <piperead+0x6c>
    if(killed(pr)){
    800072ba:	fe043503          	ld	a0,-32(s0)
    800072be:	ffffc097          	auipc	ra,0xffffc
    800072c2:	5ac080e7          	jalr	1452(ra) # 8000386a <killed>
    800072c6:	87aa                	mv	a5,a0
    800072c8:	cb91                	beqz	a5,800072dc <piperead+0x54>
      release(&pi->lock);
    800072ca:	fc843783          	ld	a5,-56(s0)
    800072ce:	853e                	mv	a0,a5
    800072d0:	ffffa097          	auipc	ra,0xffffa
    800072d4:	0be080e7          	jalr	190(ra) # 8000138e <release>
      return -1;
    800072d8:	57fd                	li	a5,-1
    800072da:	a8dd                	j	800073d0 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    800072dc:	fc843783          	ld	a5,-56(s0)
    800072e0:	21878793          	addi	a5,a5,536
    800072e4:	fc843703          	ld	a4,-56(s0)
    800072e8:	85ba                	mv	a1,a4
    800072ea:	853e                	mv	a0,a5
    800072ec:	ffffc097          	auipc	ra,0xffffc
    800072f0:	370080e7          	jalr	880(ra) # 8000365c <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800072f4:	fc843783          	ld	a5,-56(s0)
    800072f8:	2187a703          	lw	a4,536(a5)
    800072fc:	fc843783          	ld	a5,-56(s0)
    80007300:	21c7a783          	lw	a5,540(a5)
    80007304:	00f71763          	bne	a4,a5,80007312 <piperead+0x8a>
    80007308:	fc843783          	ld	a5,-56(s0)
    8000730c:	2247a783          	lw	a5,548(a5)
    80007310:	f7cd                	bnez	a5,800072ba <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007312:	fe042623          	sw	zero,-20(s0)
    80007316:	a8bd                	j	80007394 <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    80007318:	fc843783          	ld	a5,-56(s0)
    8000731c:	2187a703          	lw	a4,536(a5)
    80007320:	fc843783          	ld	a5,-56(s0)
    80007324:	21c7a783          	lw	a5,540(a5)
    80007328:	06f70f63          	beq	a4,a5,800073a6 <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    8000732c:	fc843783          	ld	a5,-56(s0)
    80007330:	2187a783          	lw	a5,536(a5)
    80007334:	2781                	sext.w	a5,a5
    80007336:	0017871b          	addiw	a4,a5,1
    8000733a:	0007069b          	sext.w	a3,a4
    8000733e:	fc843703          	ld	a4,-56(s0)
    80007342:	20d72c23          	sw	a3,536(a4)
    80007346:	1ff7f793          	andi	a5,a5,511
    8000734a:	2781                	sext.w	a5,a5
    8000734c:	fc843703          	ld	a4,-56(s0)
    80007350:	1782                	slli	a5,a5,0x20
    80007352:	9381                	srli	a5,a5,0x20
    80007354:	97ba                	add	a5,a5,a4
    80007356:	0187c783          	lbu	a5,24(a5)
    8000735a:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    8000735e:	fe043783          	ld	a5,-32(s0)
    80007362:	6ba8                	ld	a0,80(a5)
    80007364:	fec42703          	lw	a4,-20(s0)
    80007368:	fc043783          	ld	a5,-64(s0)
    8000736c:	97ba                	add	a5,a5,a4
    8000736e:	fdf40713          	addi	a4,s0,-33
    80007372:	4685                	li	a3,1
    80007374:	863a                	mv	a2,a4
    80007376:	85be                	mv	a1,a5
    80007378:	ffffb097          	auipc	ra,0xffffb
    8000737c:	1ec080e7          	jalr	492(ra) # 80002564 <copyout>
    80007380:	87aa                	mv	a5,a0
    80007382:	873e                	mv	a4,a5
    80007384:	57fd                	li	a5,-1
    80007386:	02f70263          	beq	a4,a5,800073aa <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    8000738a:	fec42783          	lw	a5,-20(s0)
    8000738e:	2785                	addiw	a5,a5,1
    80007390:	fef42623          	sw	a5,-20(s0)
    80007394:	fec42703          	lw	a4,-20(s0)
    80007398:	fbc42783          	lw	a5,-68(s0)
    8000739c:	2701                	sext.w	a4,a4
    8000739e:	2781                	sext.w	a5,a5
    800073a0:	f6f74ce3          	blt	a4,a5,80007318 <piperead+0x90>
    800073a4:	a021                	j	800073ac <piperead+0x124>
      break;
    800073a6:	0001                	nop
    800073a8:	a011                	j	800073ac <piperead+0x124>
      break;
    800073aa:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    800073ac:	fc843783          	ld	a5,-56(s0)
    800073b0:	21c78793          	addi	a5,a5,540
    800073b4:	853e                	mv	a0,a5
    800073b6:	ffffc097          	auipc	ra,0xffffc
    800073ba:	322080e7          	jalr	802(ra) # 800036d8 <wakeup>
  release(&pi->lock);
    800073be:	fc843783          	ld	a5,-56(s0)
    800073c2:	853e                	mv	a0,a5
    800073c4:	ffffa097          	auipc	ra,0xffffa
    800073c8:	fca080e7          	jalr	-54(ra) # 8000138e <release>
  return i;
    800073cc:	fec42783          	lw	a5,-20(s0)
}
    800073d0:	853e                	mv	a0,a5
    800073d2:	60a6                	ld	ra,72(sp)
    800073d4:	6406                	ld	s0,64(sp)
    800073d6:	6161                	addi	sp,sp,80
    800073d8:	8082                	ret

00000000800073da <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    800073da:	7179                	addi	sp,sp,-48
    800073dc:	f422                	sd	s0,40(sp)
    800073de:	1800                	addi	s0,sp,48
    800073e0:	87aa                	mv	a5,a0
    800073e2:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    800073e6:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    800073ea:	fdc42783          	lw	a5,-36(s0)
    800073ee:	8b85                	andi	a5,a5,1
    800073f0:	2781                	sext.w	a5,a5
    800073f2:	c781                	beqz	a5,800073fa <flags2perm+0x20>
      perm = PTE_X;
    800073f4:	47a1                	li	a5,8
    800073f6:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    800073fa:	fdc42783          	lw	a5,-36(s0)
    800073fe:	8b89                	andi	a5,a5,2
    80007400:	2781                	sext.w	a5,a5
    80007402:	c799                	beqz	a5,80007410 <flags2perm+0x36>
      perm |= PTE_W;
    80007404:	fec42783          	lw	a5,-20(s0)
    80007408:	0047e793          	ori	a5,a5,4
    8000740c:	fef42623          	sw	a5,-20(s0)
    return perm;
    80007410:	fec42783          	lw	a5,-20(s0)
}
    80007414:	853e                	mv	a0,a5
    80007416:	7422                	ld	s0,40(sp)
    80007418:	6145                	addi	sp,sp,48
    8000741a:	8082                	ret

000000008000741c <exec>:

int
exec(char *path, char **argv)
{
    8000741c:	de010113          	addi	sp,sp,-544
    80007420:	20113c23          	sd	ra,536(sp)
    80007424:	20813823          	sd	s0,528(sp)
    80007428:	20913423          	sd	s1,520(sp)
    8000742c:	1400                	addi	s0,sp,544
    8000742e:	dea43423          	sd	a0,-536(s0)
    80007432:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    80007436:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    8000743a:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    8000743e:	ffffb097          	auipc	ra,0xffffb
    80007442:	65c080e7          	jalr	1628(ra) # 80002a9a <myproc>
    80007446:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    8000744a:	fffff097          	auipc	ra,0xfffff
    8000744e:	f40080e7          	jalr	-192(ra) # 8000638a <begin_op>

  if((ip = namei(path)) == 0){
    80007452:	de843503          	ld	a0,-536(s0)
    80007456:	fffff097          	auipc	ra,0xfffff
    8000745a:	bd0080e7          	jalr	-1072(ra) # 80006026 <namei>
    8000745e:	faa43423          	sd	a0,-88(s0)
    80007462:	fa843783          	ld	a5,-88(s0)
    80007466:	e799                	bnez	a5,80007474 <exec+0x58>
    end_op();
    80007468:	fffff097          	auipc	ra,0xfffff
    8000746c:	fe4080e7          	jalr	-28(ra) # 8000644c <end_op>
    return -1;
    80007470:	57fd                	li	a5,-1
    80007472:	a1a9                	j	800078bc <exec+0x4a0>
  }
  ilock(ip);
    80007474:	fa843503          	ld	a0,-88(s0)
    80007478:	ffffe097          	auipc	ra,0xffffe
    8000747c:	e88080e7          	jalr	-376(ra) # 80005300 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    80007480:	e3040793          	addi	a5,s0,-464
    80007484:	04000713          	li	a4,64
    80007488:	4681                	li	a3,0
    8000748a:	863e                	mv	a2,a5
    8000748c:	4581                	li	a1,0
    8000748e:	fa843503          	ld	a0,-88(s0)
    80007492:	ffffe097          	auipc	ra,0xffffe
    80007496:	424080e7          	jalr	1060(ra) # 800058b6 <readi>
    8000749a:	87aa                	mv	a5,a0
    8000749c:	873e                	mv	a4,a5
    8000749e:	04000793          	li	a5,64
    800074a2:	3af71763          	bne	a4,a5,80007850 <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    800074a6:	e3042783          	lw	a5,-464(s0)
    800074aa:	873e                	mv	a4,a5
    800074ac:	464c47b7          	lui	a5,0x464c4
    800074b0:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    800074b4:	3af71063          	bne	a4,a5,80007854 <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800074b8:	f9843503          	ld	a0,-104(s0)
    800074bc:	ffffc097          	auipc	ra,0xffffc
    800074c0:	840080e7          	jalr	-1984(ra) # 80002cfc <proc_pagetable>
    800074c4:	faa43023          	sd	a0,-96(s0)
    800074c8:	fa043783          	ld	a5,-96(s0)
    800074cc:	38078663          	beqz	a5,80007858 <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800074d0:	fc042623          	sw	zero,-52(s0)
    800074d4:	e5043783          	ld	a5,-432(s0)
    800074d8:	fcf42423          	sw	a5,-56(s0)
    800074dc:	a0fd                	j	800075ca <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800074de:	df840793          	addi	a5,s0,-520
    800074e2:	fc842683          	lw	a3,-56(s0)
    800074e6:	03800713          	li	a4,56
    800074ea:	863e                	mv	a2,a5
    800074ec:	4581                	li	a1,0
    800074ee:	fa843503          	ld	a0,-88(s0)
    800074f2:	ffffe097          	auipc	ra,0xffffe
    800074f6:	3c4080e7          	jalr	964(ra) # 800058b6 <readi>
    800074fa:	87aa                	mv	a5,a0
    800074fc:	873e                	mv	a4,a5
    800074fe:	03800793          	li	a5,56
    80007502:	34f71d63          	bne	a4,a5,8000785c <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    80007506:	df842783          	lw	a5,-520(s0)
    8000750a:	873e                	mv	a4,a5
    8000750c:	4785                	li	a5,1
    8000750e:	0af71163          	bne	a4,a5,800075b0 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    80007512:	e2043703          	ld	a4,-480(s0)
    80007516:	e1843783          	ld	a5,-488(s0)
    8000751a:	34f76363          	bltu	a4,a5,80007860 <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    8000751e:	e0843703          	ld	a4,-504(s0)
    80007522:	e2043783          	ld	a5,-480(s0)
    80007526:	973e                	add	a4,a4,a5
    80007528:	e0843783          	ld	a5,-504(s0)
    8000752c:	32f76c63          	bltu	a4,a5,80007864 <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007530:	e0843703          	ld	a4,-504(s0)
    80007534:	6785                	lui	a5,0x1
    80007536:	17fd                	addi	a5,a5,-1
    80007538:	8ff9                	and	a5,a5,a4
    8000753a:	32079763          	bnez	a5,80007868 <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    8000753e:	e0843703          	ld	a4,-504(s0)
    80007542:	e2043783          	ld	a5,-480(s0)
    80007546:	00f704b3          	add	s1,a4,a5
    8000754a:	dfc42783          	lw	a5,-516(s0)
    8000754e:	2781                	sext.w	a5,a5
    80007550:	853e                	mv	a0,a5
    80007552:	00000097          	auipc	ra,0x0
    80007556:	e88080e7          	jalr	-376(ra) # 800073da <flags2perm>
    8000755a:	87aa                	mv	a5,a0
    8000755c:	86be                	mv	a3,a5
    8000755e:	8626                	mv	a2,s1
    80007560:	fb843583          	ld	a1,-72(s0)
    80007564:	fa043503          	ld	a0,-96(s0)
    80007568:	ffffb097          	auipc	ra,0xffffb
    8000756c:	c04080e7          	jalr	-1020(ra) # 8000216c <uvmalloc>
    80007570:	f6a43823          	sd	a0,-144(s0)
    80007574:	f7043783          	ld	a5,-144(s0)
    80007578:	2e078a63          	beqz	a5,8000786c <exec+0x450>
      goto bad;
    sz = sz1;
    8000757c:	f7043783          	ld	a5,-144(s0)
    80007580:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    80007584:	e0843783          	ld	a5,-504(s0)
    80007588:	e0043703          	ld	a4,-512(s0)
    8000758c:	0007069b          	sext.w	a3,a4
    80007590:	e1843703          	ld	a4,-488(s0)
    80007594:	2701                	sext.w	a4,a4
    80007596:	fa843603          	ld	a2,-88(s0)
    8000759a:	85be                	mv	a1,a5
    8000759c:	fa043503          	ld	a0,-96(s0)
    800075a0:	00000097          	auipc	ra,0x0
    800075a4:	330080e7          	jalr	816(ra) # 800078d0 <loadseg>
    800075a8:	87aa                	mv	a5,a0
    800075aa:	2c07c363          	bltz	a5,80007870 <exec+0x454>
    800075ae:	a011                	j	800075b2 <exec+0x196>
      continue;
    800075b0:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800075b2:	fcc42783          	lw	a5,-52(s0)
    800075b6:	2785                	addiw	a5,a5,1
    800075b8:	fcf42623          	sw	a5,-52(s0)
    800075bc:	fc842783          	lw	a5,-56(s0)
    800075c0:	0387879b          	addiw	a5,a5,56
    800075c4:	2781                	sext.w	a5,a5
    800075c6:	fcf42423          	sw	a5,-56(s0)
    800075ca:	e6845783          	lhu	a5,-408(s0)
    800075ce:	0007871b          	sext.w	a4,a5
    800075d2:	fcc42783          	lw	a5,-52(s0)
    800075d6:	2781                	sext.w	a5,a5
    800075d8:	f0e7c3e3          	blt	a5,a4,800074de <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800075dc:	fa843503          	ld	a0,-88(s0)
    800075e0:	ffffe097          	auipc	ra,0xffffe
    800075e4:	f7e080e7          	jalr	-130(ra) # 8000555e <iunlockput>
  end_op();
    800075e8:	fffff097          	auipc	ra,0xfffff
    800075ec:	e64080e7          	jalr	-412(ra) # 8000644c <end_op>
  ip = 0;
    800075f0:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800075f4:	ffffb097          	auipc	ra,0xffffb
    800075f8:	4a6080e7          	jalr	1190(ra) # 80002a9a <myproc>
    800075fc:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    80007600:	f9843783          	ld	a5,-104(s0)
    80007604:	67bc                	ld	a5,72(a5)
    80007606:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    8000760a:	fb843703          	ld	a4,-72(s0)
    8000760e:	6785                	lui	a5,0x1
    80007610:	17fd                	addi	a5,a5,-1
    80007612:	973e                	add	a4,a4,a5
    80007614:	77fd                	lui	a5,0xfffff
    80007616:	8ff9                	and	a5,a5,a4
    80007618:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    8000761c:	fb843703          	ld	a4,-72(s0)
    80007620:	6789                	lui	a5,0x2
    80007622:	97ba                	add	a5,a5,a4
    80007624:	4691                	li	a3,4
    80007626:	863e                	mv	a2,a5
    80007628:	fb843583          	ld	a1,-72(s0)
    8000762c:	fa043503          	ld	a0,-96(s0)
    80007630:	ffffb097          	auipc	ra,0xffffb
    80007634:	b3c080e7          	jalr	-1220(ra) # 8000216c <uvmalloc>
    80007638:	f8a43423          	sd	a0,-120(s0)
    8000763c:	f8843783          	ld	a5,-120(s0)
    80007640:	22078a63          	beqz	a5,80007874 <exec+0x458>
    goto bad;
  sz = sz1;
    80007644:	f8843783          	ld	a5,-120(s0)
    80007648:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    8000764c:	fb843703          	ld	a4,-72(s0)
    80007650:	77f9                	lui	a5,0xffffe
    80007652:	97ba                	add	a5,a5,a4
    80007654:	85be                	mv	a1,a5
    80007656:	fa043503          	ld	a0,-96(s0)
    8000765a:	ffffb097          	auipc	ra,0xffffb
    8000765e:	ea8080e7          	jalr	-344(ra) # 80002502 <uvmclear>
  sp = sz;
    80007662:	fb843783          	ld	a5,-72(s0)
    80007666:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    8000766a:	fb043703          	ld	a4,-80(s0)
    8000766e:	77fd                	lui	a5,0xfffff
    80007670:	97ba                	add	a5,a5,a4
    80007672:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    80007676:	fc043023          	sd	zero,-64(s0)
    8000767a:	a845                	j	8000772a <exec+0x30e>
    if(argc >= MAXARG)
    8000767c:	fc043703          	ld	a4,-64(s0)
    80007680:	47fd                	li	a5,31
    80007682:	1ee7eb63          	bltu	a5,a4,80007878 <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    80007686:	fc043783          	ld	a5,-64(s0)
    8000768a:	078e                	slli	a5,a5,0x3
    8000768c:	de043703          	ld	a4,-544(s0)
    80007690:	97ba                	add	a5,a5,a4
    80007692:	639c                	ld	a5,0(a5)
    80007694:	853e                	mv	a0,a5
    80007696:	ffffa097          	auipc	ra,0xffffa
    8000769a:	1e6080e7          	jalr	486(ra) # 8000187c <strlen>
    8000769e:	87aa                	mv	a5,a0
    800076a0:	2785                	addiw	a5,a5,1
    800076a2:	2781                	sext.w	a5,a5
    800076a4:	873e                	mv	a4,a5
    800076a6:	fb043783          	ld	a5,-80(s0)
    800076aa:	8f99                	sub	a5,a5,a4
    800076ac:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    800076b0:	fb043783          	ld	a5,-80(s0)
    800076b4:	9bc1                	andi	a5,a5,-16
    800076b6:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800076ba:	fb043703          	ld	a4,-80(s0)
    800076be:	f8043783          	ld	a5,-128(s0)
    800076c2:	1af76d63          	bltu	a4,a5,8000787c <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800076c6:	fc043783          	ld	a5,-64(s0)
    800076ca:	078e                	slli	a5,a5,0x3
    800076cc:	de043703          	ld	a4,-544(s0)
    800076d0:	97ba                	add	a5,a5,a4
    800076d2:	6384                	ld	s1,0(a5)
    800076d4:	fc043783          	ld	a5,-64(s0)
    800076d8:	078e                	slli	a5,a5,0x3
    800076da:	de043703          	ld	a4,-544(s0)
    800076de:	97ba                	add	a5,a5,a4
    800076e0:	639c                	ld	a5,0(a5)
    800076e2:	853e                	mv	a0,a5
    800076e4:	ffffa097          	auipc	ra,0xffffa
    800076e8:	198080e7          	jalr	408(ra) # 8000187c <strlen>
    800076ec:	87aa                	mv	a5,a0
    800076ee:	2785                	addiw	a5,a5,1
    800076f0:	2781                	sext.w	a5,a5
    800076f2:	86be                	mv	a3,a5
    800076f4:	8626                	mv	a2,s1
    800076f6:	fb043583          	ld	a1,-80(s0)
    800076fa:	fa043503          	ld	a0,-96(s0)
    800076fe:	ffffb097          	auipc	ra,0xffffb
    80007702:	e66080e7          	jalr	-410(ra) # 80002564 <copyout>
    80007706:	87aa                	mv	a5,a0
    80007708:	1607cc63          	bltz	a5,80007880 <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    8000770c:	fc043783          	ld	a5,-64(s0)
    80007710:	078e                	slli	a5,a5,0x3
    80007712:	fe040713          	addi	a4,s0,-32
    80007716:	97ba                	add	a5,a5,a4
    80007718:	fb043703          	ld	a4,-80(s0)
    8000771c:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffc9f60>
  for(argc = 0; argv[argc]; argc++) {
    80007720:	fc043783          	ld	a5,-64(s0)
    80007724:	0785                	addi	a5,a5,1
    80007726:	fcf43023          	sd	a5,-64(s0)
    8000772a:	fc043783          	ld	a5,-64(s0)
    8000772e:	078e                	slli	a5,a5,0x3
    80007730:	de043703          	ld	a4,-544(s0)
    80007734:	97ba                	add	a5,a5,a4
    80007736:	639c                	ld	a5,0(a5)
    80007738:	f3b1                	bnez	a5,8000767c <exec+0x260>
  }
  ustack[argc] = 0;
    8000773a:	fc043783          	ld	a5,-64(s0)
    8000773e:	078e                	slli	a5,a5,0x3
    80007740:	fe040713          	addi	a4,s0,-32
    80007744:	97ba                	add	a5,a5,a4
    80007746:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    8000774a:	fc043783          	ld	a5,-64(s0)
    8000774e:	0785                	addi	a5,a5,1
    80007750:	078e                	slli	a5,a5,0x3
    80007752:	fb043703          	ld	a4,-80(s0)
    80007756:	40f707b3          	sub	a5,a4,a5
    8000775a:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    8000775e:	fb043783          	ld	a5,-80(s0)
    80007762:	9bc1                	andi	a5,a5,-16
    80007764:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007768:	fb043703          	ld	a4,-80(s0)
    8000776c:	f8043783          	ld	a5,-128(s0)
    80007770:	10f76a63          	bltu	a4,a5,80007884 <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    80007774:	fc043783          	ld	a5,-64(s0)
    80007778:	0785                	addi	a5,a5,1
    8000777a:	00379713          	slli	a4,a5,0x3
    8000777e:	e7040793          	addi	a5,s0,-400
    80007782:	86ba                	mv	a3,a4
    80007784:	863e                	mv	a2,a5
    80007786:	fb043583          	ld	a1,-80(s0)
    8000778a:	fa043503          	ld	a0,-96(s0)
    8000778e:	ffffb097          	auipc	ra,0xffffb
    80007792:	dd6080e7          	jalr	-554(ra) # 80002564 <copyout>
    80007796:	87aa                	mv	a5,a0
    80007798:	0e07c863          	bltz	a5,80007888 <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    8000779c:	f9843783          	ld	a5,-104(s0)
    800077a0:	6fbc                	ld	a5,88(a5)
    800077a2:	fb043703          	ld	a4,-80(s0)
    800077a6:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    800077a8:	de843783          	ld	a5,-536(s0)
    800077ac:	fcf43c23          	sd	a5,-40(s0)
    800077b0:	fd843783          	ld	a5,-40(s0)
    800077b4:	fcf43823          	sd	a5,-48(s0)
    800077b8:	a025                	j	800077e0 <exec+0x3c4>
    if(*s == '/')
    800077ba:	fd843783          	ld	a5,-40(s0)
    800077be:	0007c783          	lbu	a5,0(a5)
    800077c2:	873e                	mv	a4,a5
    800077c4:	02f00793          	li	a5,47
    800077c8:	00f71763          	bne	a4,a5,800077d6 <exec+0x3ba>
      last = s+1;
    800077cc:	fd843783          	ld	a5,-40(s0)
    800077d0:	0785                	addi	a5,a5,1
    800077d2:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    800077d6:	fd843783          	ld	a5,-40(s0)
    800077da:	0785                	addi	a5,a5,1
    800077dc:	fcf43c23          	sd	a5,-40(s0)
    800077e0:	fd843783          	ld	a5,-40(s0)
    800077e4:	0007c783          	lbu	a5,0(a5)
    800077e8:	fbe9                	bnez	a5,800077ba <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    800077ea:	f9843783          	ld	a5,-104(s0)
    800077ee:	15878793          	addi	a5,a5,344
    800077f2:	4641                	li	a2,16
    800077f4:	fd043583          	ld	a1,-48(s0)
    800077f8:	853e                	mv	a0,a5
    800077fa:	ffffa097          	auipc	ra,0xffffa
    800077fe:	008080e7          	jalr	8(ra) # 80001802 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    80007802:	f9843783          	ld	a5,-104(s0)
    80007806:	6bbc                	ld	a5,80(a5)
    80007808:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    8000780c:	f9843783          	ld	a5,-104(s0)
    80007810:	fa043703          	ld	a4,-96(s0)
    80007814:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    80007816:	f9843783          	ld	a5,-104(s0)
    8000781a:	fb843703          	ld	a4,-72(s0)
    8000781e:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007820:	f9843783          	ld	a5,-104(s0)
    80007824:	6fbc                	ld	a5,88(a5)
    80007826:	e4843703          	ld	a4,-440(s0)
    8000782a:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    8000782c:	f9843783          	ld	a5,-104(s0)
    80007830:	6fbc                	ld	a5,88(a5)
    80007832:	fb043703          	ld	a4,-80(s0)
    80007836:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007838:	f9043583          	ld	a1,-112(s0)
    8000783c:	f7843503          	ld	a0,-136(s0)
    80007840:	ffffb097          	auipc	ra,0xffffb
    80007844:	57c080e7          	jalr	1404(ra) # 80002dbc <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007848:	fc043783          	ld	a5,-64(s0)
    8000784c:	2781                	sext.w	a5,a5
    8000784e:	a0bd                	j	800078bc <exec+0x4a0>
    goto bad;
    80007850:	0001                	nop
    80007852:	a825                	j	8000788a <exec+0x46e>
    goto bad;
    80007854:	0001                	nop
    80007856:	a815                	j	8000788a <exec+0x46e>
    goto bad;
    80007858:	0001                	nop
    8000785a:	a805                	j	8000788a <exec+0x46e>
      goto bad;
    8000785c:	0001                	nop
    8000785e:	a035                	j	8000788a <exec+0x46e>
      goto bad;
    80007860:	0001                	nop
    80007862:	a025                	j	8000788a <exec+0x46e>
      goto bad;
    80007864:	0001                	nop
    80007866:	a015                	j	8000788a <exec+0x46e>
      goto bad;
    80007868:	0001                	nop
    8000786a:	a005                	j	8000788a <exec+0x46e>
      goto bad;
    8000786c:	0001                	nop
    8000786e:	a831                	j	8000788a <exec+0x46e>
      goto bad;
    80007870:	0001                	nop
    80007872:	a821                	j	8000788a <exec+0x46e>
    goto bad;
    80007874:	0001                	nop
    80007876:	a811                	j	8000788a <exec+0x46e>
      goto bad;
    80007878:	0001                	nop
    8000787a:	a801                	j	8000788a <exec+0x46e>
      goto bad;
    8000787c:	0001                	nop
    8000787e:	a031                	j	8000788a <exec+0x46e>
      goto bad;
    80007880:	0001                	nop
    80007882:	a021                	j	8000788a <exec+0x46e>
    goto bad;
    80007884:	0001                	nop
    80007886:	a011                	j	8000788a <exec+0x46e>
    goto bad;
    80007888:	0001                	nop

 bad:
  if(pagetable)
    8000788a:	fa043783          	ld	a5,-96(s0)
    8000788e:	cb89                	beqz	a5,800078a0 <exec+0x484>
    proc_freepagetable(pagetable, sz);
    80007890:	fb843583          	ld	a1,-72(s0)
    80007894:	fa043503          	ld	a0,-96(s0)
    80007898:	ffffb097          	auipc	ra,0xffffb
    8000789c:	524080e7          	jalr	1316(ra) # 80002dbc <proc_freepagetable>
  if(ip){
    800078a0:	fa843783          	ld	a5,-88(s0)
    800078a4:	cb99                	beqz	a5,800078ba <exec+0x49e>
    iunlockput(ip);
    800078a6:	fa843503          	ld	a0,-88(s0)
    800078aa:	ffffe097          	auipc	ra,0xffffe
    800078ae:	cb4080e7          	jalr	-844(ra) # 8000555e <iunlockput>
    end_op();
    800078b2:	fffff097          	auipc	ra,0xfffff
    800078b6:	b9a080e7          	jalr	-1126(ra) # 8000644c <end_op>
  }
  return -1;
    800078ba:	57fd                	li	a5,-1
}
    800078bc:	853e                	mv	a0,a5
    800078be:	21813083          	ld	ra,536(sp)
    800078c2:	21013403          	ld	s0,528(sp)
    800078c6:	20813483          	ld	s1,520(sp)
    800078ca:	22010113          	addi	sp,sp,544
    800078ce:	8082                	ret

00000000800078d0 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    800078d0:	7139                	addi	sp,sp,-64
    800078d2:	fc06                	sd	ra,56(sp)
    800078d4:	f822                	sd	s0,48(sp)
    800078d6:	0080                	addi	s0,sp,64
    800078d8:	fca43c23          	sd	a0,-40(s0)
    800078dc:	fcb43823          	sd	a1,-48(s0)
    800078e0:	fcc43423          	sd	a2,-56(s0)
    800078e4:	87b6                	mv	a5,a3
    800078e6:	fcf42223          	sw	a5,-60(s0)
    800078ea:	87ba                	mv	a5,a4
    800078ec:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    800078f0:	fe042623          	sw	zero,-20(s0)
    800078f4:	a05d                	j	8000799a <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    800078f6:	fec46703          	lwu	a4,-20(s0)
    800078fa:	fd043783          	ld	a5,-48(s0)
    800078fe:	97ba                	add	a5,a5,a4
    80007900:	85be                	mv	a1,a5
    80007902:	fd843503          	ld	a0,-40(s0)
    80007906:	ffffa097          	auipc	ra,0xffffa
    8000790a:	4da080e7          	jalr	1242(ra) # 80001de0 <walkaddr>
    8000790e:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    80007912:	fe043783          	ld	a5,-32(s0)
    80007916:	eb89                	bnez	a5,80007928 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007918:	00004517          	auipc	a0,0x4
    8000791c:	ce850513          	addi	a0,a0,-792 # 8000b600 <etext+0x600>
    80007920:	ffff9097          	auipc	ra,0xffff9
    80007924:	36c080e7          	jalr	876(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    80007928:	fc042703          	lw	a4,-64(s0)
    8000792c:	fec42783          	lw	a5,-20(s0)
    80007930:	40f707bb          	subw	a5,a4,a5
    80007934:	2781                	sext.w	a5,a5
    80007936:	873e                	mv	a4,a5
    80007938:	6785                	lui	a5,0x1
    8000793a:	00f77b63          	bgeu	a4,a5,80007950 <loadseg+0x80>
      n = sz - i;
    8000793e:	fc042703          	lw	a4,-64(s0)
    80007942:	fec42783          	lw	a5,-20(s0)
    80007946:	40f707bb          	subw	a5,a4,a5
    8000794a:	fef42423          	sw	a5,-24(s0)
    8000794e:	a021                	j	80007956 <loadseg+0x86>
    else
      n = PGSIZE;
    80007950:	6785                	lui	a5,0x1
    80007952:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007956:	fc442703          	lw	a4,-60(s0)
    8000795a:	fec42783          	lw	a5,-20(s0)
    8000795e:	9fb9                	addw	a5,a5,a4
    80007960:	2781                	sext.w	a5,a5
    80007962:	fe842703          	lw	a4,-24(s0)
    80007966:	86be                	mv	a3,a5
    80007968:	fe043603          	ld	a2,-32(s0)
    8000796c:	4581                	li	a1,0
    8000796e:	fc843503          	ld	a0,-56(s0)
    80007972:	ffffe097          	auipc	ra,0xffffe
    80007976:	f44080e7          	jalr	-188(ra) # 800058b6 <readi>
    8000797a:	87aa                	mv	a5,a0
    8000797c:	0007871b          	sext.w	a4,a5
    80007980:	fe842783          	lw	a5,-24(s0)
    80007984:	2781                	sext.w	a5,a5
    80007986:	00e78463          	beq	a5,a4,8000798e <loadseg+0xbe>
      return -1;
    8000798a:	57fd                	li	a5,-1
    8000798c:	a005                	j	800079ac <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    8000798e:	fec42703          	lw	a4,-20(s0)
    80007992:	6785                	lui	a5,0x1
    80007994:	9fb9                	addw	a5,a5,a4
    80007996:	fef42623          	sw	a5,-20(s0)
    8000799a:	fec42703          	lw	a4,-20(s0)
    8000799e:	fc042783          	lw	a5,-64(s0)
    800079a2:	2701                	sext.w	a4,a4
    800079a4:	2781                	sext.w	a5,a5
    800079a6:	f4f768e3          	bltu	a4,a5,800078f6 <loadseg+0x26>
  }
  
  return 0;
    800079aa:	4781                	li	a5,0
}
    800079ac:	853e                	mv	a0,a5
    800079ae:	70e2                	ld	ra,56(sp)
    800079b0:	7442                	ld	s0,48(sp)
    800079b2:	6121                	addi	sp,sp,64
    800079b4:	8082                	ret

00000000800079b6 <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    800079b6:	7139                	addi	sp,sp,-64
    800079b8:	fc06                	sd	ra,56(sp)
    800079ba:	f822                	sd	s0,48(sp)
    800079bc:	0080                	addi	s0,sp,64
    800079be:	87aa                	mv	a5,a0
    800079c0:	fcb43823          	sd	a1,-48(s0)
    800079c4:	fcc43423          	sd	a2,-56(s0)
    800079c8:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    800079cc:	fe440713          	addi	a4,s0,-28
    800079d0:	fdc42783          	lw	a5,-36(s0)
    800079d4:	85ba                	mv	a1,a4
    800079d6:	853e                	mv	a0,a5
    800079d8:	ffffd097          	auipc	ra,0xffffd
    800079dc:	980080e7          	jalr	-1664(ra) # 80004358 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    800079e0:	fe442783          	lw	a5,-28(s0)
    800079e4:	0207c863          	bltz	a5,80007a14 <argfd+0x5e>
    800079e8:	fe442783          	lw	a5,-28(s0)
    800079ec:	873e                	mv	a4,a5
    800079ee:	47bd                	li	a5,15
    800079f0:	02e7c263          	blt	a5,a4,80007a14 <argfd+0x5e>
    800079f4:	ffffb097          	auipc	ra,0xffffb
    800079f8:	0a6080e7          	jalr	166(ra) # 80002a9a <myproc>
    800079fc:	872a                	mv	a4,a0
    800079fe:	fe442783          	lw	a5,-28(s0)
    80007a02:	07e9                	addi	a5,a5,26
    80007a04:	078e                	slli	a5,a5,0x3
    80007a06:	97ba                	add	a5,a5,a4
    80007a08:	639c                	ld	a5,0(a5)
    80007a0a:	fef43423          	sd	a5,-24(s0)
    80007a0e:	fe843783          	ld	a5,-24(s0)
    80007a12:	e399                	bnez	a5,80007a18 <argfd+0x62>
    return -1;
    80007a14:	57fd                	li	a5,-1
    80007a16:	a015                	j	80007a3a <argfd+0x84>
  if(pfd)
    80007a18:	fd043783          	ld	a5,-48(s0)
    80007a1c:	c791                	beqz	a5,80007a28 <argfd+0x72>
    *pfd = fd;
    80007a1e:	fe442703          	lw	a4,-28(s0)
    80007a22:	fd043783          	ld	a5,-48(s0)
    80007a26:	c398                	sw	a4,0(a5)
  if(pf)
    80007a28:	fc843783          	ld	a5,-56(s0)
    80007a2c:	c791                	beqz	a5,80007a38 <argfd+0x82>
    *pf = f;
    80007a2e:	fc843783          	ld	a5,-56(s0)
    80007a32:	fe843703          	ld	a4,-24(s0)
    80007a36:	e398                	sd	a4,0(a5)
  return 0;
    80007a38:	4781                	li	a5,0
}
    80007a3a:	853e                	mv	a0,a5
    80007a3c:	70e2                	ld	ra,56(sp)
    80007a3e:	7442                	ld	s0,48(sp)
    80007a40:	6121                	addi	sp,sp,64
    80007a42:	8082                	ret

0000000080007a44 <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007a44:	7179                	addi	sp,sp,-48
    80007a46:	f406                	sd	ra,40(sp)
    80007a48:	f022                	sd	s0,32(sp)
    80007a4a:	1800                	addi	s0,sp,48
    80007a4c:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007a50:	ffffb097          	auipc	ra,0xffffb
    80007a54:	04a080e7          	jalr	74(ra) # 80002a9a <myproc>
    80007a58:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007a5c:	fe042623          	sw	zero,-20(s0)
    80007a60:	a825                	j	80007a98 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007a62:	fe043703          	ld	a4,-32(s0)
    80007a66:	fec42783          	lw	a5,-20(s0)
    80007a6a:	07e9                	addi	a5,a5,26
    80007a6c:	078e                	slli	a5,a5,0x3
    80007a6e:	97ba                	add	a5,a5,a4
    80007a70:	639c                	ld	a5,0(a5)
    80007a72:	ef91                	bnez	a5,80007a8e <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007a74:	fe043703          	ld	a4,-32(s0)
    80007a78:	fec42783          	lw	a5,-20(s0)
    80007a7c:	07e9                	addi	a5,a5,26
    80007a7e:	078e                	slli	a5,a5,0x3
    80007a80:	97ba                	add	a5,a5,a4
    80007a82:	fd843703          	ld	a4,-40(s0)
    80007a86:	e398                	sd	a4,0(a5)
      return fd;
    80007a88:	fec42783          	lw	a5,-20(s0)
    80007a8c:	a831                	j	80007aa8 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007a8e:	fec42783          	lw	a5,-20(s0)
    80007a92:	2785                	addiw	a5,a5,1
    80007a94:	fef42623          	sw	a5,-20(s0)
    80007a98:	fec42783          	lw	a5,-20(s0)
    80007a9c:	0007871b          	sext.w	a4,a5
    80007aa0:	47bd                	li	a5,15
    80007aa2:	fce7d0e3          	bge	a5,a4,80007a62 <fdalloc+0x1e>
    }
  }
  return -1;
    80007aa6:	57fd                	li	a5,-1
}
    80007aa8:	853e                	mv	a0,a5
    80007aaa:	70a2                	ld	ra,40(sp)
    80007aac:	7402                	ld	s0,32(sp)
    80007aae:	6145                	addi	sp,sp,48
    80007ab0:	8082                	ret

0000000080007ab2 <sys_dup>:

uint64
sys_dup(void)
{
    80007ab2:	1101                	addi	sp,sp,-32
    80007ab4:	ec06                	sd	ra,24(sp)
    80007ab6:	e822                	sd	s0,16(sp)
    80007ab8:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007aba:	fe040793          	addi	a5,s0,-32
    80007abe:	863e                	mv	a2,a5
    80007ac0:	4581                	li	a1,0
    80007ac2:	4501                	li	a0,0
    80007ac4:	00000097          	auipc	ra,0x0
    80007ac8:	ef2080e7          	jalr	-270(ra) # 800079b6 <argfd>
    80007acc:	87aa                	mv	a5,a0
    80007ace:	0007d463          	bgez	a5,80007ad6 <sys_dup+0x24>
    return -1;
    80007ad2:	57fd                	li	a5,-1
    80007ad4:	a81d                	j	80007b0a <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007ad6:	fe043783          	ld	a5,-32(s0)
    80007ada:	853e                	mv	a0,a5
    80007adc:	00000097          	auipc	ra,0x0
    80007ae0:	f68080e7          	jalr	-152(ra) # 80007a44 <fdalloc>
    80007ae4:	87aa                	mv	a5,a0
    80007ae6:	fef42623          	sw	a5,-20(s0)
    80007aea:	fec42783          	lw	a5,-20(s0)
    80007aee:	2781                	sext.w	a5,a5
    80007af0:	0007d463          	bgez	a5,80007af8 <sys_dup+0x46>
    return -1;
    80007af4:	57fd                	li	a5,-1
    80007af6:	a811                	j	80007b0a <sys_dup+0x58>
  filedup(f);
    80007af8:	fe043783          	ld	a5,-32(s0)
    80007afc:	853e                	mv	a0,a5
    80007afe:	fffff097          	auipc	ra,0xfffff
    80007b02:	ec0080e7          	jalr	-320(ra) # 800069be <filedup>
  return fd;
    80007b06:	fec42783          	lw	a5,-20(s0)
}
    80007b0a:	853e                	mv	a0,a5
    80007b0c:	60e2                	ld	ra,24(sp)
    80007b0e:	6442                	ld	s0,16(sp)
    80007b10:	6105                	addi	sp,sp,32
    80007b12:	8082                	ret

0000000080007b14 <sys_read>:

uint64
sys_read(void)
{
    80007b14:	7179                	addi	sp,sp,-48
    80007b16:	f406                	sd	ra,40(sp)
    80007b18:	f022                	sd	s0,32(sp)
    80007b1a:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007b1c:	fd840793          	addi	a5,s0,-40
    80007b20:	85be                	mv	a1,a5
    80007b22:	4505                	li	a0,1
    80007b24:	ffffd097          	auipc	ra,0xffffd
    80007b28:	86a080e7          	jalr	-1942(ra) # 8000438e <argaddr>
  argint(2, &n);
    80007b2c:	fe440793          	addi	a5,s0,-28
    80007b30:	85be                	mv	a1,a5
    80007b32:	4509                	li	a0,2
    80007b34:	ffffd097          	auipc	ra,0xffffd
    80007b38:	824080e7          	jalr	-2012(ra) # 80004358 <argint>
  if(argfd(0, 0, &f) < 0)
    80007b3c:	fe840793          	addi	a5,s0,-24
    80007b40:	863e                	mv	a2,a5
    80007b42:	4581                	li	a1,0
    80007b44:	4501                	li	a0,0
    80007b46:	00000097          	auipc	ra,0x0
    80007b4a:	e70080e7          	jalr	-400(ra) # 800079b6 <argfd>
    80007b4e:	87aa                	mv	a5,a0
    80007b50:	0007d463          	bgez	a5,80007b58 <sys_read+0x44>
    return -1;
    80007b54:	57fd                	li	a5,-1
    80007b56:	a839                	j	80007b74 <sys_read+0x60>
  return fileread(f, p, n);
    80007b58:	fe843783          	ld	a5,-24(s0)
    80007b5c:	fd843703          	ld	a4,-40(s0)
    80007b60:	fe442683          	lw	a3,-28(s0)
    80007b64:	8636                	mv	a2,a3
    80007b66:	85ba                	mv	a1,a4
    80007b68:	853e                	mv	a0,a5
    80007b6a:	fffff097          	auipc	ra,0xfffff
    80007b6e:	066080e7          	jalr	102(ra) # 80006bd0 <fileread>
    80007b72:	87aa                	mv	a5,a0
}
    80007b74:	853e                	mv	a0,a5
    80007b76:	70a2                	ld	ra,40(sp)
    80007b78:	7402                	ld	s0,32(sp)
    80007b7a:	6145                	addi	sp,sp,48
    80007b7c:	8082                	ret

0000000080007b7e <sys_write>:

uint64
sys_write(void)
{
    80007b7e:	7179                	addi	sp,sp,-48
    80007b80:	f406                	sd	ra,40(sp)
    80007b82:	f022                	sd	s0,32(sp)
    80007b84:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007b86:	fd840793          	addi	a5,s0,-40
    80007b8a:	85be                	mv	a1,a5
    80007b8c:	4505                	li	a0,1
    80007b8e:	ffffd097          	auipc	ra,0xffffd
    80007b92:	800080e7          	jalr	-2048(ra) # 8000438e <argaddr>
  argint(2, &n);
    80007b96:	fe440793          	addi	a5,s0,-28
    80007b9a:	85be                	mv	a1,a5
    80007b9c:	4509                	li	a0,2
    80007b9e:	ffffc097          	auipc	ra,0xffffc
    80007ba2:	7ba080e7          	jalr	1978(ra) # 80004358 <argint>
  if(argfd(0, 0, &f) < 0)
    80007ba6:	fe840793          	addi	a5,s0,-24
    80007baa:	863e                	mv	a2,a5
    80007bac:	4581                	li	a1,0
    80007bae:	4501                	li	a0,0
    80007bb0:	00000097          	auipc	ra,0x0
    80007bb4:	e06080e7          	jalr	-506(ra) # 800079b6 <argfd>
    80007bb8:	87aa                	mv	a5,a0
    80007bba:	0007d463          	bgez	a5,80007bc2 <sys_write+0x44>
    return -1;
    80007bbe:	57fd                	li	a5,-1
    80007bc0:	a839                	j	80007bde <sys_write+0x60>

  return filewrite(f, p, n);
    80007bc2:	fe843783          	ld	a5,-24(s0)
    80007bc6:	fd843703          	ld	a4,-40(s0)
    80007bca:	fe442683          	lw	a3,-28(s0)
    80007bce:	8636                	mv	a2,a3
    80007bd0:	85ba                	mv	a1,a4
    80007bd2:	853e                	mv	a0,a5
    80007bd4:	fffff097          	auipc	ra,0xfffff
    80007bd8:	162080e7          	jalr	354(ra) # 80006d36 <filewrite>
    80007bdc:	87aa                	mv	a5,a0
}
    80007bde:	853e                	mv	a0,a5
    80007be0:	70a2                	ld	ra,40(sp)
    80007be2:	7402                	ld	s0,32(sp)
    80007be4:	6145                	addi	sp,sp,48
    80007be6:	8082                	ret

0000000080007be8 <sys_close>:

uint64
sys_close(void)
{
    80007be8:	1101                	addi	sp,sp,-32
    80007bea:	ec06                	sd	ra,24(sp)
    80007bec:	e822                	sd	s0,16(sp)
    80007bee:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007bf0:	fe040713          	addi	a4,s0,-32
    80007bf4:	fec40793          	addi	a5,s0,-20
    80007bf8:	863a                	mv	a2,a4
    80007bfa:	85be                	mv	a1,a5
    80007bfc:	4501                	li	a0,0
    80007bfe:	00000097          	auipc	ra,0x0
    80007c02:	db8080e7          	jalr	-584(ra) # 800079b6 <argfd>
    80007c06:	87aa                	mv	a5,a0
    80007c08:	0007d463          	bgez	a5,80007c10 <sys_close+0x28>
    return -1;
    80007c0c:	57fd                	li	a5,-1
    80007c0e:	a02d                	j	80007c38 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007c10:	ffffb097          	auipc	ra,0xffffb
    80007c14:	e8a080e7          	jalr	-374(ra) # 80002a9a <myproc>
    80007c18:	872a                	mv	a4,a0
    80007c1a:	fec42783          	lw	a5,-20(s0)
    80007c1e:	07e9                	addi	a5,a5,26
    80007c20:	078e                	slli	a5,a5,0x3
    80007c22:	97ba                	add	a5,a5,a4
    80007c24:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007c28:	fe043783          	ld	a5,-32(s0)
    80007c2c:	853e                	mv	a0,a5
    80007c2e:	fffff097          	auipc	ra,0xfffff
    80007c32:	df6080e7          	jalr	-522(ra) # 80006a24 <fileclose>
  return 0;
    80007c36:	4781                	li	a5,0
}
    80007c38:	853e                	mv	a0,a5
    80007c3a:	60e2                	ld	ra,24(sp)
    80007c3c:	6442                	ld	s0,16(sp)
    80007c3e:	6105                	addi	sp,sp,32
    80007c40:	8082                	ret

0000000080007c42 <sys_fstat>:

uint64
sys_fstat(void)
{
    80007c42:	1101                	addi	sp,sp,-32
    80007c44:	ec06                	sd	ra,24(sp)
    80007c46:	e822                	sd	s0,16(sp)
    80007c48:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007c4a:	fe040793          	addi	a5,s0,-32
    80007c4e:	85be                	mv	a1,a5
    80007c50:	4505                	li	a0,1
    80007c52:	ffffc097          	auipc	ra,0xffffc
    80007c56:	73c080e7          	jalr	1852(ra) # 8000438e <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007c5a:	fe840793          	addi	a5,s0,-24
    80007c5e:	863e                	mv	a2,a5
    80007c60:	4581                	li	a1,0
    80007c62:	4501                	li	a0,0
    80007c64:	00000097          	auipc	ra,0x0
    80007c68:	d52080e7          	jalr	-686(ra) # 800079b6 <argfd>
    80007c6c:	87aa                	mv	a5,a0
    80007c6e:	0007d463          	bgez	a5,80007c76 <sys_fstat+0x34>
    return -1;
    80007c72:	57fd                	li	a5,-1
    80007c74:	a821                	j	80007c8c <sys_fstat+0x4a>
  return filestat(f, st);
    80007c76:	fe843783          	ld	a5,-24(s0)
    80007c7a:	fe043703          	ld	a4,-32(s0)
    80007c7e:	85ba                	mv	a1,a4
    80007c80:	853e                	mv	a0,a5
    80007c82:	fffff097          	auipc	ra,0xfffff
    80007c86:	eaa080e7          	jalr	-342(ra) # 80006b2c <filestat>
    80007c8a:	87aa                	mv	a5,a0
}
    80007c8c:	853e                	mv	a0,a5
    80007c8e:	60e2                	ld	ra,24(sp)
    80007c90:	6442                	ld	s0,16(sp)
    80007c92:	6105                	addi	sp,sp,32
    80007c94:	8082                	ret

0000000080007c96 <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007c96:	7169                	addi	sp,sp,-304
    80007c98:	f606                	sd	ra,296(sp)
    80007c9a:	f222                	sd	s0,288(sp)
    80007c9c:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007c9e:	ed040793          	addi	a5,s0,-304
    80007ca2:	08000613          	li	a2,128
    80007ca6:	85be                	mv	a1,a5
    80007ca8:	4501                	li	a0,0
    80007caa:	ffffc097          	auipc	ra,0xffffc
    80007cae:	716080e7          	jalr	1814(ra) # 800043c0 <argstr>
    80007cb2:	87aa                	mv	a5,a0
    80007cb4:	0007cf63          	bltz	a5,80007cd2 <sys_link+0x3c>
    80007cb8:	f5040793          	addi	a5,s0,-176
    80007cbc:	08000613          	li	a2,128
    80007cc0:	85be                	mv	a1,a5
    80007cc2:	4505                	li	a0,1
    80007cc4:	ffffc097          	auipc	ra,0xffffc
    80007cc8:	6fc080e7          	jalr	1788(ra) # 800043c0 <argstr>
    80007ccc:	87aa                	mv	a5,a0
    80007cce:	0007d463          	bgez	a5,80007cd6 <sys_link+0x40>
    return -1;
    80007cd2:	57fd                	li	a5,-1
    80007cd4:	aab5                	j	80007e50 <sys_link+0x1ba>

  begin_op();
    80007cd6:	ffffe097          	auipc	ra,0xffffe
    80007cda:	6b4080e7          	jalr	1716(ra) # 8000638a <begin_op>
  if((ip = namei(old)) == 0){
    80007cde:	ed040793          	addi	a5,s0,-304
    80007ce2:	853e                	mv	a0,a5
    80007ce4:	ffffe097          	auipc	ra,0xffffe
    80007ce8:	342080e7          	jalr	834(ra) # 80006026 <namei>
    80007cec:	fea43423          	sd	a0,-24(s0)
    80007cf0:	fe843783          	ld	a5,-24(s0)
    80007cf4:	e799                	bnez	a5,80007d02 <sys_link+0x6c>
    end_op();
    80007cf6:	ffffe097          	auipc	ra,0xffffe
    80007cfa:	756080e7          	jalr	1878(ra) # 8000644c <end_op>
    return -1;
    80007cfe:	57fd                	li	a5,-1
    80007d00:	aa81                	j	80007e50 <sys_link+0x1ba>
  }

  ilock(ip);
    80007d02:	fe843503          	ld	a0,-24(s0)
    80007d06:	ffffd097          	auipc	ra,0xffffd
    80007d0a:	5fa080e7          	jalr	1530(ra) # 80005300 <ilock>
  if(ip->type == T_DIR){
    80007d0e:	fe843783          	ld	a5,-24(s0)
    80007d12:	04479783          	lh	a5,68(a5)
    80007d16:	0007871b          	sext.w	a4,a5
    80007d1a:	4785                	li	a5,1
    80007d1c:	00f71e63          	bne	a4,a5,80007d38 <sys_link+0xa2>
    iunlockput(ip);
    80007d20:	fe843503          	ld	a0,-24(s0)
    80007d24:	ffffe097          	auipc	ra,0xffffe
    80007d28:	83a080e7          	jalr	-1990(ra) # 8000555e <iunlockput>
    end_op();
    80007d2c:	ffffe097          	auipc	ra,0xffffe
    80007d30:	720080e7          	jalr	1824(ra) # 8000644c <end_op>
    return -1;
    80007d34:	57fd                	li	a5,-1
    80007d36:	aa29                	j	80007e50 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007d38:	fe843783          	ld	a5,-24(s0)
    80007d3c:	04a79783          	lh	a5,74(a5)
    80007d40:	17c2                	slli	a5,a5,0x30
    80007d42:	93c1                	srli	a5,a5,0x30
    80007d44:	2785                	addiw	a5,a5,1
    80007d46:	17c2                	slli	a5,a5,0x30
    80007d48:	93c1                	srli	a5,a5,0x30
    80007d4a:	0107971b          	slliw	a4,a5,0x10
    80007d4e:	4107571b          	sraiw	a4,a4,0x10
    80007d52:	fe843783          	ld	a5,-24(s0)
    80007d56:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007d5a:	fe843503          	ld	a0,-24(s0)
    80007d5e:	ffffd097          	auipc	ra,0xffffd
    80007d62:	352080e7          	jalr	850(ra) # 800050b0 <iupdate>
  iunlock(ip);
    80007d66:	fe843503          	ld	a0,-24(s0)
    80007d6a:	ffffd097          	auipc	ra,0xffffd
    80007d6e:	6ca080e7          	jalr	1738(ra) # 80005434 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007d72:	fd040713          	addi	a4,s0,-48
    80007d76:	f5040793          	addi	a5,s0,-176
    80007d7a:	85ba                	mv	a1,a4
    80007d7c:	853e                	mv	a0,a5
    80007d7e:	ffffe097          	auipc	ra,0xffffe
    80007d82:	2d4080e7          	jalr	724(ra) # 80006052 <nameiparent>
    80007d86:	fea43023          	sd	a0,-32(s0)
    80007d8a:	fe043783          	ld	a5,-32(s0)
    80007d8e:	cba5                	beqz	a5,80007dfe <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007d90:	fe043503          	ld	a0,-32(s0)
    80007d94:	ffffd097          	auipc	ra,0xffffd
    80007d98:	56c080e7          	jalr	1388(ra) # 80005300 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007d9c:	fe043783          	ld	a5,-32(s0)
    80007da0:	4398                	lw	a4,0(a5)
    80007da2:	fe843783          	ld	a5,-24(s0)
    80007da6:	439c                	lw	a5,0(a5)
    80007da8:	02f71263          	bne	a4,a5,80007dcc <sys_link+0x136>
    80007dac:	fe843783          	ld	a5,-24(s0)
    80007db0:	43d8                	lw	a4,4(a5)
    80007db2:	fd040793          	addi	a5,s0,-48
    80007db6:	863a                	mv	a2,a4
    80007db8:	85be                	mv	a1,a5
    80007dba:	fe043503          	ld	a0,-32(s0)
    80007dbe:	ffffe097          	auipc	ra,0xffffe
    80007dc2:	f5a080e7          	jalr	-166(ra) # 80005d18 <dirlink>
    80007dc6:	87aa                	mv	a5,a0
    80007dc8:	0007d963          	bgez	a5,80007dda <sys_link+0x144>
    iunlockput(dp);
    80007dcc:	fe043503          	ld	a0,-32(s0)
    80007dd0:	ffffd097          	auipc	ra,0xffffd
    80007dd4:	78e080e7          	jalr	1934(ra) # 8000555e <iunlockput>
    goto bad;
    80007dd8:	a025                	j	80007e00 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007dda:	fe043503          	ld	a0,-32(s0)
    80007dde:	ffffd097          	auipc	ra,0xffffd
    80007de2:	780080e7          	jalr	1920(ra) # 8000555e <iunlockput>
  iput(ip);
    80007de6:	fe843503          	ld	a0,-24(s0)
    80007dea:	ffffd097          	auipc	ra,0xffffd
    80007dee:	6a4080e7          	jalr	1700(ra) # 8000548e <iput>

  end_op();
    80007df2:	ffffe097          	auipc	ra,0xffffe
    80007df6:	65a080e7          	jalr	1626(ra) # 8000644c <end_op>

  return 0;
    80007dfa:	4781                	li	a5,0
    80007dfc:	a891                	j	80007e50 <sys_link+0x1ba>
    goto bad;
    80007dfe:	0001                	nop

bad:
  ilock(ip);
    80007e00:	fe843503          	ld	a0,-24(s0)
    80007e04:	ffffd097          	auipc	ra,0xffffd
    80007e08:	4fc080e7          	jalr	1276(ra) # 80005300 <ilock>
  ip->nlink--;
    80007e0c:	fe843783          	ld	a5,-24(s0)
    80007e10:	04a79783          	lh	a5,74(a5)
    80007e14:	17c2                	slli	a5,a5,0x30
    80007e16:	93c1                	srli	a5,a5,0x30
    80007e18:	37fd                	addiw	a5,a5,-1
    80007e1a:	17c2                	slli	a5,a5,0x30
    80007e1c:	93c1                	srli	a5,a5,0x30
    80007e1e:	0107971b          	slliw	a4,a5,0x10
    80007e22:	4107571b          	sraiw	a4,a4,0x10
    80007e26:	fe843783          	ld	a5,-24(s0)
    80007e2a:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007e2e:	fe843503          	ld	a0,-24(s0)
    80007e32:	ffffd097          	auipc	ra,0xffffd
    80007e36:	27e080e7          	jalr	638(ra) # 800050b0 <iupdate>
  iunlockput(ip);
    80007e3a:	fe843503          	ld	a0,-24(s0)
    80007e3e:	ffffd097          	auipc	ra,0xffffd
    80007e42:	720080e7          	jalr	1824(ra) # 8000555e <iunlockput>
  end_op();
    80007e46:	ffffe097          	auipc	ra,0xffffe
    80007e4a:	606080e7          	jalr	1542(ra) # 8000644c <end_op>
  return -1;
    80007e4e:	57fd                	li	a5,-1
}
    80007e50:	853e                	mv	a0,a5
    80007e52:	70b2                	ld	ra,296(sp)
    80007e54:	7412                	ld	s0,288(sp)
    80007e56:	6155                	addi	sp,sp,304
    80007e58:	8082                	ret

0000000080007e5a <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007e5a:	7139                	addi	sp,sp,-64
    80007e5c:	fc06                	sd	ra,56(sp)
    80007e5e:	f822                	sd	s0,48(sp)
    80007e60:	0080                	addi	s0,sp,64
    80007e62:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007e66:	02000793          	li	a5,32
    80007e6a:	fef42623          	sw	a5,-20(s0)
    80007e6e:	a0b1                	j	80007eba <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007e70:	fd840793          	addi	a5,s0,-40
    80007e74:	fec42683          	lw	a3,-20(s0)
    80007e78:	4741                	li	a4,16
    80007e7a:	863e                	mv	a2,a5
    80007e7c:	4581                	li	a1,0
    80007e7e:	fc843503          	ld	a0,-56(s0)
    80007e82:	ffffe097          	auipc	ra,0xffffe
    80007e86:	a34080e7          	jalr	-1484(ra) # 800058b6 <readi>
    80007e8a:	87aa                	mv	a5,a0
    80007e8c:	873e                	mv	a4,a5
    80007e8e:	47c1                	li	a5,16
    80007e90:	00f70a63          	beq	a4,a5,80007ea4 <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007e94:	00003517          	auipc	a0,0x3
    80007e98:	78c50513          	addi	a0,a0,1932 # 8000b620 <etext+0x620>
    80007e9c:	ffff9097          	auipc	ra,0xffff9
    80007ea0:	df0080e7          	jalr	-528(ra) # 80000c8c <panic>
    if(de.inum != 0)
    80007ea4:	fd845783          	lhu	a5,-40(s0)
    80007ea8:	c399                	beqz	a5,80007eae <isdirempty+0x54>
      return 0;
    80007eaa:	4781                	li	a5,0
    80007eac:	a839                	j	80007eca <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007eae:	fec42783          	lw	a5,-20(s0)
    80007eb2:	27c1                	addiw	a5,a5,16
    80007eb4:	2781                	sext.w	a5,a5
    80007eb6:	fef42623          	sw	a5,-20(s0)
    80007eba:	fc843783          	ld	a5,-56(s0)
    80007ebe:	47f8                	lw	a4,76(a5)
    80007ec0:	fec42783          	lw	a5,-20(s0)
    80007ec4:	fae7e6e3          	bltu	a5,a4,80007e70 <isdirempty+0x16>
  }
  return 1;
    80007ec8:	4785                	li	a5,1
}
    80007eca:	853e                	mv	a0,a5
    80007ecc:	70e2                	ld	ra,56(sp)
    80007ece:	7442                	ld	s0,48(sp)
    80007ed0:	6121                	addi	sp,sp,64
    80007ed2:	8082                	ret

0000000080007ed4 <sys_unlink>:

uint64
sys_unlink(void)
{
    80007ed4:	7155                	addi	sp,sp,-208
    80007ed6:	e586                	sd	ra,200(sp)
    80007ed8:	e1a2                	sd	s0,192(sp)
    80007eda:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007edc:	f4040793          	addi	a5,s0,-192
    80007ee0:	08000613          	li	a2,128
    80007ee4:	85be                	mv	a1,a5
    80007ee6:	4501                	li	a0,0
    80007ee8:	ffffc097          	auipc	ra,0xffffc
    80007eec:	4d8080e7          	jalr	1240(ra) # 800043c0 <argstr>
    80007ef0:	87aa                	mv	a5,a0
    80007ef2:	0007d463          	bgez	a5,80007efa <sys_unlink+0x26>
    return -1;
    80007ef6:	57fd                	li	a5,-1
    80007ef8:	a2ed                	j	800080e2 <sys_unlink+0x20e>

  begin_op();
    80007efa:	ffffe097          	auipc	ra,0xffffe
    80007efe:	490080e7          	jalr	1168(ra) # 8000638a <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007f02:	fc040713          	addi	a4,s0,-64
    80007f06:	f4040793          	addi	a5,s0,-192
    80007f0a:	85ba                	mv	a1,a4
    80007f0c:	853e                	mv	a0,a5
    80007f0e:	ffffe097          	auipc	ra,0xffffe
    80007f12:	144080e7          	jalr	324(ra) # 80006052 <nameiparent>
    80007f16:	fea43423          	sd	a0,-24(s0)
    80007f1a:	fe843783          	ld	a5,-24(s0)
    80007f1e:	e799                	bnez	a5,80007f2c <sys_unlink+0x58>
    end_op();
    80007f20:	ffffe097          	auipc	ra,0xffffe
    80007f24:	52c080e7          	jalr	1324(ra) # 8000644c <end_op>
    return -1;
    80007f28:	57fd                	li	a5,-1
    80007f2a:	aa65                	j	800080e2 <sys_unlink+0x20e>
  }

  ilock(dp);
    80007f2c:	fe843503          	ld	a0,-24(s0)
    80007f30:	ffffd097          	auipc	ra,0xffffd
    80007f34:	3d0080e7          	jalr	976(ra) # 80005300 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80007f38:	fc040793          	addi	a5,s0,-64
    80007f3c:	00003597          	auipc	a1,0x3
    80007f40:	6fc58593          	addi	a1,a1,1788 # 8000b638 <etext+0x638>
    80007f44:	853e                	mv	a0,a5
    80007f46:	ffffe097          	auipc	ra,0xffffe
    80007f4a:	cbc080e7          	jalr	-836(ra) # 80005c02 <namecmp>
    80007f4e:	87aa                	mv	a5,a0
    80007f50:	16078b63          	beqz	a5,800080c6 <sys_unlink+0x1f2>
    80007f54:	fc040793          	addi	a5,s0,-64
    80007f58:	00003597          	auipc	a1,0x3
    80007f5c:	6e858593          	addi	a1,a1,1768 # 8000b640 <etext+0x640>
    80007f60:	853e                	mv	a0,a5
    80007f62:	ffffe097          	auipc	ra,0xffffe
    80007f66:	ca0080e7          	jalr	-864(ra) # 80005c02 <namecmp>
    80007f6a:	87aa                	mv	a5,a0
    80007f6c:	14078d63          	beqz	a5,800080c6 <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80007f70:	f3c40713          	addi	a4,s0,-196
    80007f74:	fc040793          	addi	a5,s0,-64
    80007f78:	863a                	mv	a2,a4
    80007f7a:	85be                	mv	a1,a5
    80007f7c:	fe843503          	ld	a0,-24(s0)
    80007f80:	ffffe097          	auipc	ra,0xffffe
    80007f84:	cb0080e7          	jalr	-848(ra) # 80005c30 <dirlookup>
    80007f88:	fea43023          	sd	a0,-32(s0)
    80007f8c:	fe043783          	ld	a5,-32(s0)
    80007f90:	12078d63          	beqz	a5,800080ca <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    80007f94:	fe043503          	ld	a0,-32(s0)
    80007f98:	ffffd097          	auipc	ra,0xffffd
    80007f9c:	368080e7          	jalr	872(ra) # 80005300 <ilock>

  if(ip->nlink < 1)
    80007fa0:	fe043783          	ld	a5,-32(s0)
    80007fa4:	04a79783          	lh	a5,74(a5)
    80007fa8:	2781                	sext.w	a5,a5
    80007faa:	00f04a63          	bgtz	a5,80007fbe <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80007fae:	00003517          	auipc	a0,0x3
    80007fb2:	69a50513          	addi	a0,a0,1690 # 8000b648 <etext+0x648>
    80007fb6:	ffff9097          	auipc	ra,0xffff9
    80007fba:	cd6080e7          	jalr	-810(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    80007fbe:	fe043783          	ld	a5,-32(s0)
    80007fc2:	04479783          	lh	a5,68(a5)
    80007fc6:	0007871b          	sext.w	a4,a5
    80007fca:	4785                	li	a5,1
    80007fcc:	02f71163          	bne	a4,a5,80007fee <sys_unlink+0x11a>
    80007fd0:	fe043503          	ld	a0,-32(s0)
    80007fd4:	00000097          	auipc	ra,0x0
    80007fd8:	e86080e7          	jalr	-378(ra) # 80007e5a <isdirempty>
    80007fdc:	87aa                	mv	a5,a0
    80007fde:	eb81                	bnez	a5,80007fee <sys_unlink+0x11a>
    iunlockput(ip);
    80007fe0:	fe043503          	ld	a0,-32(s0)
    80007fe4:	ffffd097          	auipc	ra,0xffffd
    80007fe8:	57a080e7          	jalr	1402(ra) # 8000555e <iunlockput>
    goto bad;
    80007fec:	a0c5                	j	800080cc <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    80007fee:	fd040793          	addi	a5,s0,-48
    80007ff2:	4641                	li	a2,16
    80007ff4:	4581                	li	a1,0
    80007ff6:	853e                	mv	a0,a5
    80007ff8:	ffff9097          	auipc	ra,0xffff9
    80007ffc:	506080e7          	jalr	1286(ra) # 800014fe <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80008000:	fd040793          	addi	a5,s0,-48
    80008004:	f3c42683          	lw	a3,-196(s0)
    80008008:	4741                	li	a4,16
    8000800a:	863e                	mv	a2,a5
    8000800c:	4581                	li	a1,0
    8000800e:	fe843503          	ld	a0,-24(s0)
    80008012:	ffffe097          	auipc	ra,0xffffe
    80008016:	a3c080e7          	jalr	-1476(ra) # 80005a4e <writei>
    8000801a:	87aa                	mv	a5,a0
    8000801c:	873e                	mv	a4,a5
    8000801e:	47c1                	li	a5,16
    80008020:	00f70a63          	beq	a4,a5,80008034 <sys_unlink+0x160>
    panic("unlink: writei");
    80008024:	00003517          	auipc	a0,0x3
    80008028:	63c50513          	addi	a0,a0,1596 # 8000b660 <etext+0x660>
    8000802c:	ffff9097          	auipc	ra,0xffff9
    80008030:	c60080e7          	jalr	-928(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    80008034:	fe043783          	ld	a5,-32(s0)
    80008038:	04479783          	lh	a5,68(a5)
    8000803c:	0007871b          	sext.w	a4,a5
    80008040:	4785                	li	a5,1
    80008042:	02f71963          	bne	a4,a5,80008074 <sys_unlink+0x1a0>
    dp->nlink--;
    80008046:	fe843783          	ld	a5,-24(s0)
    8000804a:	04a79783          	lh	a5,74(a5)
    8000804e:	17c2                	slli	a5,a5,0x30
    80008050:	93c1                	srli	a5,a5,0x30
    80008052:	37fd                	addiw	a5,a5,-1
    80008054:	17c2                	slli	a5,a5,0x30
    80008056:	93c1                	srli	a5,a5,0x30
    80008058:	0107971b          	slliw	a4,a5,0x10
    8000805c:	4107571b          	sraiw	a4,a4,0x10
    80008060:	fe843783          	ld	a5,-24(s0)
    80008064:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008068:	fe843503          	ld	a0,-24(s0)
    8000806c:	ffffd097          	auipc	ra,0xffffd
    80008070:	044080e7          	jalr	68(ra) # 800050b0 <iupdate>
  }
  iunlockput(dp);
    80008074:	fe843503          	ld	a0,-24(s0)
    80008078:	ffffd097          	auipc	ra,0xffffd
    8000807c:	4e6080e7          	jalr	1254(ra) # 8000555e <iunlockput>

  ip->nlink--;
    80008080:	fe043783          	ld	a5,-32(s0)
    80008084:	04a79783          	lh	a5,74(a5)
    80008088:	17c2                	slli	a5,a5,0x30
    8000808a:	93c1                	srli	a5,a5,0x30
    8000808c:	37fd                	addiw	a5,a5,-1
    8000808e:	17c2                	slli	a5,a5,0x30
    80008090:	93c1                	srli	a5,a5,0x30
    80008092:	0107971b          	slliw	a4,a5,0x10
    80008096:	4107571b          	sraiw	a4,a4,0x10
    8000809a:	fe043783          	ld	a5,-32(s0)
    8000809e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800080a2:	fe043503          	ld	a0,-32(s0)
    800080a6:	ffffd097          	auipc	ra,0xffffd
    800080aa:	00a080e7          	jalr	10(ra) # 800050b0 <iupdate>
  iunlockput(ip);
    800080ae:	fe043503          	ld	a0,-32(s0)
    800080b2:	ffffd097          	auipc	ra,0xffffd
    800080b6:	4ac080e7          	jalr	1196(ra) # 8000555e <iunlockput>

  end_op();
    800080ba:	ffffe097          	auipc	ra,0xffffe
    800080be:	392080e7          	jalr	914(ra) # 8000644c <end_op>

  return 0;
    800080c2:	4781                	li	a5,0
    800080c4:	a839                	j	800080e2 <sys_unlink+0x20e>
    goto bad;
    800080c6:	0001                	nop
    800080c8:	a011                	j	800080cc <sys_unlink+0x1f8>
    goto bad;
    800080ca:	0001                	nop

bad:
  iunlockput(dp);
    800080cc:	fe843503          	ld	a0,-24(s0)
    800080d0:	ffffd097          	auipc	ra,0xffffd
    800080d4:	48e080e7          	jalr	1166(ra) # 8000555e <iunlockput>
  end_op();
    800080d8:	ffffe097          	auipc	ra,0xffffe
    800080dc:	374080e7          	jalr	884(ra) # 8000644c <end_op>
  return -1;
    800080e0:	57fd                	li	a5,-1
}
    800080e2:	853e                	mv	a0,a5
    800080e4:	60ae                	ld	ra,200(sp)
    800080e6:	640e                	ld	s0,192(sp)
    800080e8:	6169                	addi	sp,sp,208
    800080ea:	8082                	ret

00000000800080ec <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    800080ec:	7139                	addi	sp,sp,-64
    800080ee:	fc06                	sd	ra,56(sp)
    800080f0:	f822                	sd	s0,48(sp)
    800080f2:	0080                	addi	s0,sp,64
    800080f4:	fca43423          	sd	a0,-56(s0)
    800080f8:	87ae                	mv	a5,a1
    800080fa:	8736                	mv	a4,a3
    800080fc:	fcf41323          	sh	a5,-58(s0)
    80008100:	87b2                	mv	a5,a2
    80008102:	fcf41223          	sh	a5,-60(s0)
    80008106:	87ba                	mv	a5,a4
    80008108:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    8000810c:	fd040793          	addi	a5,s0,-48
    80008110:	85be                	mv	a1,a5
    80008112:	fc843503          	ld	a0,-56(s0)
    80008116:	ffffe097          	auipc	ra,0xffffe
    8000811a:	f3c080e7          	jalr	-196(ra) # 80006052 <nameiparent>
    8000811e:	fea43423          	sd	a0,-24(s0)
    80008122:	fe843783          	ld	a5,-24(s0)
    80008126:	e399                	bnez	a5,8000812c <create+0x40>
    return 0;
    80008128:	4781                	li	a5,0
    8000812a:	a2ed                	j	80008314 <create+0x228>

  ilock(dp);
    8000812c:	fe843503          	ld	a0,-24(s0)
    80008130:	ffffd097          	auipc	ra,0xffffd
    80008134:	1d0080e7          	jalr	464(ra) # 80005300 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008138:	fd040793          	addi	a5,s0,-48
    8000813c:	4601                	li	a2,0
    8000813e:	85be                	mv	a1,a5
    80008140:	fe843503          	ld	a0,-24(s0)
    80008144:	ffffe097          	auipc	ra,0xffffe
    80008148:	aec080e7          	jalr	-1300(ra) # 80005c30 <dirlookup>
    8000814c:	fea43023          	sd	a0,-32(s0)
    80008150:	fe043783          	ld	a5,-32(s0)
    80008154:	c3ad                	beqz	a5,800081b6 <create+0xca>
    iunlockput(dp);
    80008156:	fe843503          	ld	a0,-24(s0)
    8000815a:	ffffd097          	auipc	ra,0xffffd
    8000815e:	404080e7          	jalr	1028(ra) # 8000555e <iunlockput>
    ilock(ip);
    80008162:	fe043503          	ld	a0,-32(s0)
    80008166:	ffffd097          	auipc	ra,0xffffd
    8000816a:	19a080e7          	jalr	410(ra) # 80005300 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    8000816e:	fc641783          	lh	a5,-58(s0)
    80008172:	0007871b          	sext.w	a4,a5
    80008176:	4789                	li	a5,2
    80008178:	02f71763          	bne	a4,a5,800081a6 <create+0xba>
    8000817c:	fe043783          	ld	a5,-32(s0)
    80008180:	04479783          	lh	a5,68(a5)
    80008184:	0007871b          	sext.w	a4,a5
    80008188:	4789                	li	a5,2
    8000818a:	00f70b63          	beq	a4,a5,800081a0 <create+0xb4>
    8000818e:	fe043783          	ld	a5,-32(s0)
    80008192:	04479783          	lh	a5,68(a5)
    80008196:	0007871b          	sext.w	a4,a5
    8000819a:	478d                	li	a5,3
    8000819c:	00f71563          	bne	a4,a5,800081a6 <create+0xba>
      return ip;
    800081a0:	fe043783          	ld	a5,-32(s0)
    800081a4:	aa85                	j	80008314 <create+0x228>
    iunlockput(ip);
    800081a6:	fe043503          	ld	a0,-32(s0)
    800081aa:	ffffd097          	auipc	ra,0xffffd
    800081ae:	3b4080e7          	jalr	948(ra) # 8000555e <iunlockput>
    return 0;
    800081b2:	4781                	li	a5,0
    800081b4:	a285                	j	80008314 <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    800081b6:	fe843783          	ld	a5,-24(s0)
    800081ba:	439c                	lw	a5,0(a5)
    800081bc:	fc641703          	lh	a4,-58(s0)
    800081c0:	85ba                	mv	a1,a4
    800081c2:	853e                	mv	a0,a5
    800081c4:	ffffd097          	auipc	ra,0xffffd
    800081c8:	dee080e7          	jalr	-530(ra) # 80004fb2 <ialloc>
    800081cc:	fea43023          	sd	a0,-32(s0)
    800081d0:	fe043783          	ld	a5,-32(s0)
    800081d4:	eb89                	bnez	a5,800081e6 <create+0xfa>
    iunlockput(dp);
    800081d6:	fe843503          	ld	a0,-24(s0)
    800081da:	ffffd097          	auipc	ra,0xffffd
    800081de:	384080e7          	jalr	900(ra) # 8000555e <iunlockput>
    return 0;
    800081e2:	4781                	li	a5,0
    800081e4:	aa05                	j	80008314 <create+0x228>
  }

  ilock(ip);
    800081e6:	fe043503          	ld	a0,-32(s0)
    800081ea:	ffffd097          	auipc	ra,0xffffd
    800081ee:	116080e7          	jalr	278(ra) # 80005300 <ilock>
  ip->major = major;
    800081f2:	fe043783          	ld	a5,-32(s0)
    800081f6:	fc445703          	lhu	a4,-60(s0)
    800081fa:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    800081fe:	fe043783          	ld	a5,-32(s0)
    80008202:	fc245703          	lhu	a4,-62(s0)
    80008206:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    8000820a:	fe043783          	ld	a5,-32(s0)
    8000820e:	4705                	li	a4,1
    80008210:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80008214:	fe043503          	ld	a0,-32(s0)
    80008218:	ffffd097          	auipc	ra,0xffffd
    8000821c:	e98080e7          	jalr	-360(ra) # 800050b0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008220:	fc641783          	lh	a5,-58(s0)
    80008224:	0007871b          	sext.w	a4,a5
    80008228:	4785                	li	a5,1
    8000822a:	04f71463          	bne	a4,a5,80008272 <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    8000822e:	fe043783          	ld	a5,-32(s0)
    80008232:	43dc                	lw	a5,4(a5)
    80008234:	863e                	mv	a2,a5
    80008236:	00003597          	auipc	a1,0x3
    8000823a:	40258593          	addi	a1,a1,1026 # 8000b638 <etext+0x638>
    8000823e:	fe043503          	ld	a0,-32(s0)
    80008242:	ffffe097          	auipc	ra,0xffffe
    80008246:	ad6080e7          	jalr	-1322(ra) # 80005d18 <dirlink>
    8000824a:	87aa                	mv	a5,a0
    8000824c:	0807ca63          	bltz	a5,800082e0 <create+0x1f4>
    80008250:	fe843783          	ld	a5,-24(s0)
    80008254:	43dc                	lw	a5,4(a5)
    80008256:	863e                	mv	a2,a5
    80008258:	00003597          	auipc	a1,0x3
    8000825c:	3e858593          	addi	a1,a1,1000 # 8000b640 <etext+0x640>
    80008260:	fe043503          	ld	a0,-32(s0)
    80008264:	ffffe097          	auipc	ra,0xffffe
    80008268:	ab4080e7          	jalr	-1356(ra) # 80005d18 <dirlink>
    8000826c:	87aa                	mv	a5,a0
    8000826e:	0607c963          	bltz	a5,800082e0 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    80008272:	fe043783          	ld	a5,-32(s0)
    80008276:	43d8                	lw	a4,4(a5)
    80008278:	fd040793          	addi	a5,s0,-48
    8000827c:	863a                	mv	a2,a4
    8000827e:	85be                	mv	a1,a5
    80008280:	fe843503          	ld	a0,-24(s0)
    80008284:	ffffe097          	auipc	ra,0xffffe
    80008288:	a94080e7          	jalr	-1388(ra) # 80005d18 <dirlink>
    8000828c:	87aa                	mv	a5,a0
    8000828e:	0407cb63          	bltz	a5,800082e4 <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    80008292:	fc641783          	lh	a5,-58(s0)
    80008296:	0007871b          	sext.w	a4,a5
    8000829a:	4785                	li	a5,1
    8000829c:	02f71963          	bne	a4,a5,800082ce <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    800082a0:	fe843783          	ld	a5,-24(s0)
    800082a4:	04a79783          	lh	a5,74(a5)
    800082a8:	17c2                	slli	a5,a5,0x30
    800082aa:	93c1                	srli	a5,a5,0x30
    800082ac:	2785                	addiw	a5,a5,1
    800082ae:	17c2                	slli	a5,a5,0x30
    800082b0:	93c1                	srli	a5,a5,0x30
    800082b2:	0107971b          	slliw	a4,a5,0x10
    800082b6:	4107571b          	sraiw	a4,a4,0x10
    800082ba:	fe843783          	ld	a5,-24(s0)
    800082be:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800082c2:	fe843503          	ld	a0,-24(s0)
    800082c6:	ffffd097          	auipc	ra,0xffffd
    800082ca:	dea080e7          	jalr	-534(ra) # 800050b0 <iupdate>
  }

  iunlockput(dp);
    800082ce:	fe843503          	ld	a0,-24(s0)
    800082d2:	ffffd097          	auipc	ra,0xffffd
    800082d6:	28c080e7          	jalr	652(ra) # 8000555e <iunlockput>

  return ip;
    800082da:	fe043783          	ld	a5,-32(s0)
    800082de:	a81d                	j	80008314 <create+0x228>
      goto fail;
    800082e0:	0001                	nop
    800082e2:	a011                	j	800082e6 <create+0x1fa>
    goto fail;
    800082e4:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    800082e6:	fe043783          	ld	a5,-32(s0)
    800082ea:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    800082ee:	fe043503          	ld	a0,-32(s0)
    800082f2:	ffffd097          	auipc	ra,0xffffd
    800082f6:	dbe080e7          	jalr	-578(ra) # 800050b0 <iupdate>
  iunlockput(ip);
    800082fa:	fe043503          	ld	a0,-32(s0)
    800082fe:	ffffd097          	auipc	ra,0xffffd
    80008302:	260080e7          	jalr	608(ra) # 8000555e <iunlockput>
  iunlockput(dp);
    80008306:	fe843503          	ld	a0,-24(s0)
    8000830a:	ffffd097          	auipc	ra,0xffffd
    8000830e:	254080e7          	jalr	596(ra) # 8000555e <iunlockput>
  return 0;
    80008312:	4781                	li	a5,0
}
    80008314:	853e                	mv	a0,a5
    80008316:	70e2                	ld	ra,56(sp)
    80008318:	7442                	ld	s0,48(sp)
    8000831a:	6121                	addi	sp,sp,64
    8000831c:	8082                	ret

000000008000831e <sys_open>:

uint64
sys_open(void)
{
    8000831e:	7131                	addi	sp,sp,-192
    80008320:	fd06                	sd	ra,184(sp)
    80008322:	f922                	sd	s0,176(sp)
    80008324:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    80008326:	f4c40793          	addi	a5,s0,-180
    8000832a:	85be                	mv	a1,a5
    8000832c:	4505                	li	a0,1
    8000832e:	ffffc097          	auipc	ra,0xffffc
    80008332:	02a080e7          	jalr	42(ra) # 80004358 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    80008336:	f5040793          	addi	a5,s0,-176
    8000833a:	08000613          	li	a2,128
    8000833e:	85be                	mv	a1,a5
    80008340:	4501                	li	a0,0
    80008342:	ffffc097          	auipc	ra,0xffffc
    80008346:	07e080e7          	jalr	126(ra) # 800043c0 <argstr>
    8000834a:	87aa                	mv	a5,a0
    8000834c:	fef42223          	sw	a5,-28(s0)
    80008350:	fe442783          	lw	a5,-28(s0)
    80008354:	2781                	sext.w	a5,a5
    80008356:	0007d463          	bgez	a5,8000835e <sys_open+0x40>
    return -1;
    8000835a:	57fd                	li	a5,-1
    8000835c:	a429                	j	80008566 <sys_open+0x248>

  begin_op();
    8000835e:	ffffe097          	auipc	ra,0xffffe
    80008362:	02c080e7          	jalr	44(ra) # 8000638a <begin_op>

  if(omode & O_CREATE){
    80008366:	f4c42783          	lw	a5,-180(s0)
    8000836a:	2007f793          	andi	a5,a5,512
    8000836e:	2781                	sext.w	a5,a5
    80008370:	c795                	beqz	a5,8000839c <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    80008372:	f5040793          	addi	a5,s0,-176
    80008376:	4681                	li	a3,0
    80008378:	4601                	li	a2,0
    8000837a:	4589                	li	a1,2
    8000837c:	853e                	mv	a0,a5
    8000837e:	00000097          	auipc	ra,0x0
    80008382:	d6e080e7          	jalr	-658(ra) # 800080ec <create>
    80008386:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    8000838a:	fe843783          	ld	a5,-24(s0)
    8000838e:	e7bd                	bnez	a5,800083fc <sys_open+0xde>
      end_op();
    80008390:	ffffe097          	auipc	ra,0xffffe
    80008394:	0bc080e7          	jalr	188(ra) # 8000644c <end_op>
      return -1;
    80008398:	57fd                	li	a5,-1
    8000839a:	a2f1                	j	80008566 <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    8000839c:	f5040793          	addi	a5,s0,-176
    800083a0:	853e                	mv	a0,a5
    800083a2:	ffffe097          	auipc	ra,0xffffe
    800083a6:	c84080e7          	jalr	-892(ra) # 80006026 <namei>
    800083aa:	fea43423          	sd	a0,-24(s0)
    800083ae:	fe843783          	ld	a5,-24(s0)
    800083b2:	e799                	bnez	a5,800083c0 <sys_open+0xa2>
      end_op();
    800083b4:	ffffe097          	auipc	ra,0xffffe
    800083b8:	098080e7          	jalr	152(ra) # 8000644c <end_op>
      return -1;
    800083bc:	57fd                	li	a5,-1
    800083be:	a265                	j	80008566 <sys_open+0x248>
    }
    ilock(ip);
    800083c0:	fe843503          	ld	a0,-24(s0)
    800083c4:	ffffd097          	auipc	ra,0xffffd
    800083c8:	f3c080e7          	jalr	-196(ra) # 80005300 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800083cc:	fe843783          	ld	a5,-24(s0)
    800083d0:	04479783          	lh	a5,68(a5)
    800083d4:	0007871b          	sext.w	a4,a5
    800083d8:	4785                	li	a5,1
    800083da:	02f71163          	bne	a4,a5,800083fc <sys_open+0xde>
    800083de:	f4c42783          	lw	a5,-180(s0)
    800083e2:	cf89                	beqz	a5,800083fc <sys_open+0xde>
      iunlockput(ip);
    800083e4:	fe843503          	ld	a0,-24(s0)
    800083e8:	ffffd097          	auipc	ra,0xffffd
    800083ec:	176080e7          	jalr	374(ra) # 8000555e <iunlockput>
      end_op();
    800083f0:	ffffe097          	auipc	ra,0xffffe
    800083f4:	05c080e7          	jalr	92(ra) # 8000644c <end_op>
      return -1;
    800083f8:	57fd                	li	a5,-1
    800083fa:	a2b5                	j	80008566 <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800083fc:	fe843783          	ld	a5,-24(s0)
    80008400:	04479783          	lh	a5,68(a5)
    80008404:	0007871b          	sext.w	a4,a5
    80008408:	478d                	li	a5,3
    8000840a:	02f71e63          	bne	a4,a5,80008446 <sys_open+0x128>
    8000840e:	fe843783          	ld	a5,-24(s0)
    80008412:	04679783          	lh	a5,70(a5)
    80008416:	2781                	sext.w	a5,a5
    80008418:	0007cb63          	bltz	a5,8000842e <sys_open+0x110>
    8000841c:	fe843783          	ld	a5,-24(s0)
    80008420:	04679783          	lh	a5,70(a5)
    80008424:	0007871b          	sext.w	a4,a5
    80008428:	47a5                	li	a5,9
    8000842a:	00e7de63          	bge	a5,a4,80008446 <sys_open+0x128>
    iunlockput(ip);
    8000842e:	fe843503          	ld	a0,-24(s0)
    80008432:	ffffd097          	auipc	ra,0xffffd
    80008436:	12c080e7          	jalr	300(ra) # 8000555e <iunlockput>
    end_op();
    8000843a:	ffffe097          	auipc	ra,0xffffe
    8000843e:	012080e7          	jalr	18(ra) # 8000644c <end_op>
    return -1;
    80008442:	57fd                	li	a5,-1
    80008444:	a20d                	j	80008566 <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    80008446:	ffffe097          	auipc	ra,0xffffe
    8000844a:	4f4080e7          	jalr	1268(ra) # 8000693a <filealloc>
    8000844e:	fca43c23          	sd	a0,-40(s0)
    80008452:	fd843783          	ld	a5,-40(s0)
    80008456:	cf99                	beqz	a5,80008474 <sys_open+0x156>
    80008458:	fd843503          	ld	a0,-40(s0)
    8000845c:	fffff097          	auipc	ra,0xfffff
    80008460:	5e8080e7          	jalr	1512(ra) # 80007a44 <fdalloc>
    80008464:	87aa                	mv	a5,a0
    80008466:	fcf42a23          	sw	a5,-44(s0)
    8000846a:	fd442783          	lw	a5,-44(s0)
    8000846e:	2781                	sext.w	a5,a5
    80008470:	0207d763          	bgez	a5,8000849e <sys_open+0x180>
    if(f)
    80008474:	fd843783          	ld	a5,-40(s0)
    80008478:	c799                	beqz	a5,80008486 <sys_open+0x168>
      fileclose(f);
    8000847a:	fd843503          	ld	a0,-40(s0)
    8000847e:	ffffe097          	auipc	ra,0xffffe
    80008482:	5a6080e7          	jalr	1446(ra) # 80006a24 <fileclose>
    iunlockput(ip);
    80008486:	fe843503          	ld	a0,-24(s0)
    8000848a:	ffffd097          	auipc	ra,0xffffd
    8000848e:	0d4080e7          	jalr	212(ra) # 8000555e <iunlockput>
    end_op();
    80008492:	ffffe097          	auipc	ra,0xffffe
    80008496:	fba080e7          	jalr	-70(ra) # 8000644c <end_op>
    return -1;
    8000849a:	57fd                	li	a5,-1
    8000849c:	a0e9                	j	80008566 <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    8000849e:	fe843783          	ld	a5,-24(s0)
    800084a2:	04479783          	lh	a5,68(a5)
    800084a6:	0007871b          	sext.w	a4,a5
    800084aa:	478d                	li	a5,3
    800084ac:	00f71f63          	bne	a4,a5,800084ca <sys_open+0x1ac>
    f->type = FD_DEVICE;
    800084b0:	fd843783          	ld	a5,-40(s0)
    800084b4:	470d                	li	a4,3
    800084b6:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800084b8:	fe843783          	ld	a5,-24(s0)
    800084bc:	04679703          	lh	a4,70(a5)
    800084c0:	fd843783          	ld	a5,-40(s0)
    800084c4:	02e79223          	sh	a4,36(a5)
    800084c8:	a809                	j	800084da <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    800084ca:	fd843783          	ld	a5,-40(s0)
    800084ce:	4709                	li	a4,2
    800084d0:	c398                	sw	a4,0(a5)
    f->off = 0;
    800084d2:	fd843783          	ld	a5,-40(s0)
    800084d6:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    800084da:	fd843783          	ld	a5,-40(s0)
    800084de:	fe843703          	ld	a4,-24(s0)
    800084e2:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800084e4:	f4c42783          	lw	a5,-180(s0)
    800084e8:	8b85                	andi	a5,a5,1
    800084ea:	2781                	sext.w	a5,a5
    800084ec:	0017b793          	seqz	a5,a5
    800084f0:	0ff7f793          	andi	a5,a5,255
    800084f4:	873e                	mv	a4,a5
    800084f6:	fd843783          	ld	a5,-40(s0)
    800084fa:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    800084fe:	f4c42783          	lw	a5,-180(s0)
    80008502:	8b85                	andi	a5,a5,1
    80008504:	2781                	sext.w	a5,a5
    80008506:	e791                	bnez	a5,80008512 <sys_open+0x1f4>
    80008508:	f4c42783          	lw	a5,-180(s0)
    8000850c:	8b89                	andi	a5,a5,2
    8000850e:	2781                	sext.w	a5,a5
    80008510:	c399                	beqz	a5,80008516 <sys_open+0x1f8>
    80008512:	4785                	li	a5,1
    80008514:	a011                	j	80008518 <sys_open+0x1fa>
    80008516:	4781                	li	a5,0
    80008518:	0ff7f713          	andi	a4,a5,255
    8000851c:	fd843783          	ld	a5,-40(s0)
    80008520:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    80008524:	f4c42783          	lw	a5,-180(s0)
    80008528:	4007f793          	andi	a5,a5,1024
    8000852c:	2781                	sext.w	a5,a5
    8000852e:	c385                	beqz	a5,8000854e <sys_open+0x230>
    80008530:	fe843783          	ld	a5,-24(s0)
    80008534:	04479783          	lh	a5,68(a5)
    80008538:	0007871b          	sext.w	a4,a5
    8000853c:	4789                	li	a5,2
    8000853e:	00f71863          	bne	a4,a5,8000854e <sys_open+0x230>
    itrunc(ip);
    80008542:	fe843503          	ld	a0,-24(s0)
    80008546:	ffffd097          	auipc	ra,0xffffd
    8000854a:	1c2080e7          	jalr	450(ra) # 80005708 <itrunc>
  }

  iunlock(ip);
    8000854e:	fe843503          	ld	a0,-24(s0)
    80008552:	ffffd097          	auipc	ra,0xffffd
    80008556:	ee2080e7          	jalr	-286(ra) # 80005434 <iunlock>
  end_op();
    8000855a:	ffffe097          	auipc	ra,0xffffe
    8000855e:	ef2080e7          	jalr	-270(ra) # 8000644c <end_op>

  return fd;
    80008562:	fd442783          	lw	a5,-44(s0)
}
    80008566:	853e                	mv	a0,a5
    80008568:	70ea                	ld	ra,184(sp)
    8000856a:	744a                	ld	s0,176(sp)
    8000856c:	6129                	addi	sp,sp,192
    8000856e:	8082                	ret

0000000080008570 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008570:	7135                	addi	sp,sp,-160
    80008572:	ed06                	sd	ra,152(sp)
    80008574:	e922                	sd	s0,144(sp)
    80008576:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    80008578:	ffffe097          	auipc	ra,0xffffe
    8000857c:	e12080e7          	jalr	-494(ra) # 8000638a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80008580:	f6840793          	addi	a5,s0,-152
    80008584:	08000613          	li	a2,128
    80008588:	85be                	mv	a1,a5
    8000858a:	4501                	li	a0,0
    8000858c:	ffffc097          	auipc	ra,0xffffc
    80008590:	e34080e7          	jalr	-460(ra) # 800043c0 <argstr>
    80008594:	87aa                	mv	a5,a0
    80008596:	0207c163          	bltz	a5,800085b8 <sys_mkdir+0x48>
    8000859a:	f6840793          	addi	a5,s0,-152
    8000859e:	4681                	li	a3,0
    800085a0:	4601                	li	a2,0
    800085a2:	4585                	li	a1,1
    800085a4:	853e                	mv	a0,a5
    800085a6:	00000097          	auipc	ra,0x0
    800085aa:	b46080e7          	jalr	-1210(ra) # 800080ec <create>
    800085ae:	fea43423          	sd	a0,-24(s0)
    800085b2:	fe843783          	ld	a5,-24(s0)
    800085b6:	e799                	bnez	a5,800085c4 <sys_mkdir+0x54>
    end_op();
    800085b8:	ffffe097          	auipc	ra,0xffffe
    800085bc:	e94080e7          	jalr	-364(ra) # 8000644c <end_op>
    return -1;
    800085c0:	57fd                	li	a5,-1
    800085c2:	a821                	j	800085da <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800085c4:	fe843503          	ld	a0,-24(s0)
    800085c8:	ffffd097          	auipc	ra,0xffffd
    800085cc:	f96080e7          	jalr	-106(ra) # 8000555e <iunlockput>
  end_op();
    800085d0:	ffffe097          	auipc	ra,0xffffe
    800085d4:	e7c080e7          	jalr	-388(ra) # 8000644c <end_op>
  return 0;
    800085d8:	4781                	li	a5,0
}
    800085da:	853e                	mv	a0,a5
    800085dc:	60ea                	ld	ra,152(sp)
    800085de:	644a                	ld	s0,144(sp)
    800085e0:	610d                	addi	sp,sp,160
    800085e2:	8082                	ret

00000000800085e4 <sys_mknod>:

uint64
sys_mknod(void)
{
    800085e4:	7135                	addi	sp,sp,-160
    800085e6:	ed06                	sd	ra,152(sp)
    800085e8:	e922                	sd	s0,144(sp)
    800085ea:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    800085ec:	ffffe097          	auipc	ra,0xffffe
    800085f0:	d9e080e7          	jalr	-610(ra) # 8000638a <begin_op>
  argint(1, &major);
    800085f4:	f6440793          	addi	a5,s0,-156
    800085f8:	85be                	mv	a1,a5
    800085fa:	4505                	li	a0,1
    800085fc:	ffffc097          	auipc	ra,0xffffc
    80008600:	d5c080e7          	jalr	-676(ra) # 80004358 <argint>
  argint(2, &minor);
    80008604:	f6040793          	addi	a5,s0,-160
    80008608:	85be                	mv	a1,a5
    8000860a:	4509                	li	a0,2
    8000860c:	ffffc097          	auipc	ra,0xffffc
    80008610:	d4c080e7          	jalr	-692(ra) # 80004358 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008614:	f6840793          	addi	a5,s0,-152
    80008618:	08000613          	li	a2,128
    8000861c:	85be                	mv	a1,a5
    8000861e:	4501                	li	a0,0
    80008620:	ffffc097          	auipc	ra,0xffffc
    80008624:	da0080e7          	jalr	-608(ra) # 800043c0 <argstr>
    80008628:	87aa                	mv	a5,a0
    8000862a:	0207cc63          	bltz	a5,80008662 <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    8000862e:	f6442783          	lw	a5,-156(s0)
    80008632:	0107971b          	slliw	a4,a5,0x10
    80008636:	4107571b          	sraiw	a4,a4,0x10
    8000863a:	f6042783          	lw	a5,-160(s0)
    8000863e:	0107969b          	slliw	a3,a5,0x10
    80008642:	4106d69b          	sraiw	a3,a3,0x10
    80008646:	f6840793          	addi	a5,s0,-152
    8000864a:	863a                	mv	a2,a4
    8000864c:	458d                	li	a1,3
    8000864e:	853e                	mv	a0,a5
    80008650:	00000097          	auipc	ra,0x0
    80008654:	a9c080e7          	jalr	-1380(ra) # 800080ec <create>
    80008658:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    8000865c:	fe843783          	ld	a5,-24(s0)
    80008660:	e799                	bnez	a5,8000866e <sys_mknod+0x8a>
    end_op();
    80008662:	ffffe097          	auipc	ra,0xffffe
    80008666:	dea080e7          	jalr	-534(ra) # 8000644c <end_op>
    return -1;
    8000866a:	57fd                	li	a5,-1
    8000866c:	a821                	j	80008684 <sys_mknod+0xa0>
  }
  iunlockput(ip);
    8000866e:	fe843503          	ld	a0,-24(s0)
    80008672:	ffffd097          	auipc	ra,0xffffd
    80008676:	eec080e7          	jalr	-276(ra) # 8000555e <iunlockput>
  end_op();
    8000867a:	ffffe097          	auipc	ra,0xffffe
    8000867e:	dd2080e7          	jalr	-558(ra) # 8000644c <end_op>
  return 0;
    80008682:	4781                	li	a5,0
}
    80008684:	853e                	mv	a0,a5
    80008686:	60ea                	ld	ra,152(sp)
    80008688:	644a                	ld	s0,144(sp)
    8000868a:	610d                	addi	sp,sp,160
    8000868c:	8082                	ret

000000008000868e <sys_chdir>:

uint64
sys_chdir(void)
{
    8000868e:	7135                	addi	sp,sp,-160
    80008690:	ed06                	sd	ra,152(sp)
    80008692:	e922                	sd	s0,144(sp)
    80008694:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    80008696:	ffffa097          	auipc	ra,0xffffa
    8000869a:	404080e7          	jalr	1028(ra) # 80002a9a <myproc>
    8000869e:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    800086a2:	ffffe097          	auipc	ra,0xffffe
    800086a6:	ce8080e7          	jalr	-792(ra) # 8000638a <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    800086aa:	f6040793          	addi	a5,s0,-160
    800086ae:	08000613          	li	a2,128
    800086b2:	85be                	mv	a1,a5
    800086b4:	4501                	li	a0,0
    800086b6:	ffffc097          	auipc	ra,0xffffc
    800086ba:	d0a080e7          	jalr	-758(ra) # 800043c0 <argstr>
    800086be:	87aa                	mv	a5,a0
    800086c0:	0007ce63          	bltz	a5,800086dc <sys_chdir+0x4e>
    800086c4:	f6040793          	addi	a5,s0,-160
    800086c8:	853e                	mv	a0,a5
    800086ca:	ffffe097          	auipc	ra,0xffffe
    800086ce:	95c080e7          	jalr	-1700(ra) # 80006026 <namei>
    800086d2:	fea43023          	sd	a0,-32(s0)
    800086d6:	fe043783          	ld	a5,-32(s0)
    800086da:	e799                	bnez	a5,800086e8 <sys_chdir+0x5a>
    end_op();
    800086dc:	ffffe097          	auipc	ra,0xffffe
    800086e0:	d70080e7          	jalr	-656(ra) # 8000644c <end_op>
    return -1;
    800086e4:	57fd                	li	a5,-1
    800086e6:	a0b5                	j	80008752 <sys_chdir+0xc4>
  }
  ilock(ip);
    800086e8:	fe043503          	ld	a0,-32(s0)
    800086ec:	ffffd097          	auipc	ra,0xffffd
    800086f0:	c14080e7          	jalr	-1004(ra) # 80005300 <ilock>
  if(ip->type != T_DIR){
    800086f4:	fe043783          	ld	a5,-32(s0)
    800086f8:	04479783          	lh	a5,68(a5)
    800086fc:	0007871b          	sext.w	a4,a5
    80008700:	4785                	li	a5,1
    80008702:	00f70e63          	beq	a4,a5,8000871e <sys_chdir+0x90>
    iunlockput(ip);
    80008706:	fe043503          	ld	a0,-32(s0)
    8000870a:	ffffd097          	auipc	ra,0xffffd
    8000870e:	e54080e7          	jalr	-428(ra) # 8000555e <iunlockput>
    end_op();
    80008712:	ffffe097          	auipc	ra,0xffffe
    80008716:	d3a080e7          	jalr	-710(ra) # 8000644c <end_op>
    return -1;
    8000871a:	57fd                	li	a5,-1
    8000871c:	a81d                	j	80008752 <sys_chdir+0xc4>
  }
  iunlock(ip);
    8000871e:	fe043503          	ld	a0,-32(s0)
    80008722:	ffffd097          	auipc	ra,0xffffd
    80008726:	d12080e7          	jalr	-750(ra) # 80005434 <iunlock>
  iput(p->cwd);
    8000872a:	fe843783          	ld	a5,-24(s0)
    8000872e:	1507b783          	ld	a5,336(a5)
    80008732:	853e                	mv	a0,a5
    80008734:	ffffd097          	auipc	ra,0xffffd
    80008738:	d5a080e7          	jalr	-678(ra) # 8000548e <iput>
  end_op();
    8000873c:	ffffe097          	auipc	ra,0xffffe
    80008740:	d10080e7          	jalr	-752(ra) # 8000644c <end_op>
  p->cwd = ip;
    80008744:	fe843783          	ld	a5,-24(s0)
    80008748:	fe043703          	ld	a4,-32(s0)
    8000874c:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008750:	4781                	li	a5,0
}
    80008752:	853e                	mv	a0,a5
    80008754:	60ea                	ld	ra,152(sp)
    80008756:	644a                	ld	s0,144(sp)
    80008758:	610d                	addi	sp,sp,160
    8000875a:	8082                	ret

000000008000875c <sys_exec>:

uint64
sys_exec(void)
{
    8000875c:	7161                	addi	sp,sp,-432
    8000875e:	f706                	sd	ra,424(sp)
    80008760:	f322                	sd	s0,416(sp)
    80008762:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    80008764:	e6040793          	addi	a5,s0,-416
    80008768:	85be                	mv	a1,a5
    8000876a:	4505                	li	a0,1
    8000876c:	ffffc097          	auipc	ra,0xffffc
    80008770:	c22080e7          	jalr	-990(ra) # 8000438e <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    80008774:	f6840793          	addi	a5,s0,-152
    80008778:	08000613          	li	a2,128
    8000877c:	85be                	mv	a1,a5
    8000877e:	4501                	li	a0,0
    80008780:	ffffc097          	auipc	ra,0xffffc
    80008784:	c40080e7          	jalr	-960(ra) # 800043c0 <argstr>
    80008788:	87aa                	mv	a5,a0
    8000878a:	0007d463          	bgez	a5,80008792 <sys_exec+0x36>
    return -1;
    8000878e:	57fd                	li	a5,-1
    80008790:	a249                	j	80008912 <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    80008792:	e6840793          	addi	a5,s0,-408
    80008796:	10000613          	li	a2,256
    8000879a:	4581                	li	a1,0
    8000879c:	853e                	mv	a0,a5
    8000879e:	ffff9097          	auipc	ra,0xffff9
    800087a2:	d60080e7          	jalr	-672(ra) # 800014fe <memset>
  for(i=0;; i++){
    800087a6:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    800087aa:	fec42783          	lw	a5,-20(s0)
    800087ae:	873e                	mv	a4,a5
    800087b0:	47fd                	li	a5,31
    800087b2:	10e7e463          	bltu	a5,a4,800088ba <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    800087b6:	fec42783          	lw	a5,-20(s0)
    800087ba:	00379713          	slli	a4,a5,0x3
    800087be:	e6043783          	ld	a5,-416(s0)
    800087c2:	97ba                	add	a5,a5,a4
    800087c4:	e5840713          	addi	a4,s0,-424
    800087c8:	85ba                	mv	a1,a4
    800087ca:	853e                	mv	a0,a5
    800087cc:	ffffc097          	auipc	ra,0xffffc
    800087d0:	a1a080e7          	jalr	-1510(ra) # 800041e6 <fetchaddr>
    800087d4:	87aa                	mv	a5,a0
    800087d6:	0e07c463          	bltz	a5,800088be <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    800087da:	e5843783          	ld	a5,-424(s0)
    800087de:	eb95                	bnez	a5,80008812 <sys_exec+0xb6>
      argv[i] = 0;
    800087e0:	fec42783          	lw	a5,-20(s0)
    800087e4:	078e                	slli	a5,a5,0x3
    800087e6:	ff040713          	addi	a4,s0,-16
    800087ea:	97ba                	add	a5,a5,a4
    800087ec:	e607bc23          	sd	zero,-392(a5)
      break;
    800087f0:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    800087f2:	e6840713          	addi	a4,s0,-408
    800087f6:	f6840793          	addi	a5,s0,-152
    800087fa:	85ba                	mv	a1,a4
    800087fc:	853e                	mv	a0,a5
    800087fe:	fffff097          	auipc	ra,0xfffff
    80008802:	c1e080e7          	jalr	-994(ra) # 8000741c <exec>
    80008806:	87aa                	mv	a5,a0
    80008808:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000880c:	fe042623          	sw	zero,-20(s0)
    80008810:	a059                	j	80008896 <sys_exec+0x13a>
    argv[i] = kalloc();
    80008812:	ffff9097          	auipc	ra,0xffff9
    80008816:	9c4080e7          	jalr	-1596(ra) # 800011d6 <kalloc>
    8000881a:	872a                	mv	a4,a0
    8000881c:	fec42783          	lw	a5,-20(s0)
    80008820:	078e                	slli	a5,a5,0x3
    80008822:	ff040693          	addi	a3,s0,-16
    80008826:	97b6                	add	a5,a5,a3
    80008828:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    8000882c:	fec42783          	lw	a5,-20(s0)
    80008830:	078e                	slli	a5,a5,0x3
    80008832:	ff040713          	addi	a4,s0,-16
    80008836:	97ba                	add	a5,a5,a4
    80008838:	e787b783          	ld	a5,-392(a5)
    8000883c:	c3d9                	beqz	a5,800088c2 <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    8000883e:	e5843703          	ld	a4,-424(s0)
    80008842:	fec42783          	lw	a5,-20(s0)
    80008846:	078e                	slli	a5,a5,0x3
    80008848:	ff040693          	addi	a3,s0,-16
    8000884c:	97b6                	add	a5,a5,a3
    8000884e:	e787b783          	ld	a5,-392(a5)
    80008852:	6605                	lui	a2,0x1
    80008854:	85be                	mv	a1,a5
    80008856:	853a                	mv	a0,a4
    80008858:	ffffc097          	auipc	ra,0xffffc
    8000885c:	9fc080e7          	jalr	-1540(ra) # 80004254 <fetchstr>
    80008860:	87aa                	mv	a5,a0
    80008862:	0607c263          	bltz	a5,800088c6 <sys_exec+0x16a>
  for(i=0;; i++){
    80008866:	fec42783          	lw	a5,-20(s0)
    8000886a:	2785                	addiw	a5,a5,1
    8000886c:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008870:	bf2d                	j	800087aa <sys_exec+0x4e>
    kfree(argv[i]);
    80008872:	fec42783          	lw	a5,-20(s0)
    80008876:	078e                	slli	a5,a5,0x3
    80008878:	ff040713          	addi	a4,s0,-16
    8000887c:	97ba                	add	a5,a5,a4
    8000887e:	e787b783          	ld	a5,-392(a5)
    80008882:	853e                	mv	a0,a5
    80008884:	ffff9097          	auipc	ra,0xffff9
    80008888:	8ac080e7          	jalr	-1876(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    8000888c:	fec42783          	lw	a5,-20(s0)
    80008890:	2785                	addiw	a5,a5,1
    80008892:	fef42623          	sw	a5,-20(s0)
    80008896:	fec42783          	lw	a5,-20(s0)
    8000889a:	873e                	mv	a4,a5
    8000889c:	47fd                	li	a5,31
    8000889e:	00e7eb63          	bltu	a5,a4,800088b4 <sys_exec+0x158>
    800088a2:	fec42783          	lw	a5,-20(s0)
    800088a6:	078e                	slli	a5,a5,0x3
    800088a8:	ff040713          	addi	a4,s0,-16
    800088ac:	97ba                	add	a5,a5,a4
    800088ae:	e787b783          	ld	a5,-392(a5)
    800088b2:	f3e1                	bnez	a5,80008872 <sys_exec+0x116>

  return ret;
    800088b4:	fe842783          	lw	a5,-24(s0)
    800088b8:	a8a9                	j	80008912 <sys_exec+0x1b6>
      goto bad;
    800088ba:	0001                	nop
    800088bc:	a031                	j	800088c8 <sys_exec+0x16c>
      goto bad;
    800088be:	0001                	nop
    800088c0:	a021                	j	800088c8 <sys_exec+0x16c>
      goto bad;
    800088c2:	0001                	nop
    800088c4:	a011                	j	800088c8 <sys_exec+0x16c>
      goto bad;
    800088c6:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088c8:	fe042623          	sw	zero,-20(s0)
    800088cc:	a01d                	j	800088f2 <sys_exec+0x196>
    kfree(argv[i]);
    800088ce:	fec42783          	lw	a5,-20(s0)
    800088d2:	078e                	slli	a5,a5,0x3
    800088d4:	ff040713          	addi	a4,s0,-16
    800088d8:	97ba                	add	a5,a5,a4
    800088da:	e787b783          	ld	a5,-392(a5)
    800088de:	853e                	mv	a0,a5
    800088e0:	ffff9097          	auipc	ra,0xffff9
    800088e4:	850080e7          	jalr	-1968(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088e8:	fec42783          	lw	a5,-20(s0)
    800088ec:	2785                	addiw	a5,a5,1
    800088ee:	fef42623          	sw	a5,-20(s0)
    800088f2:	fec42783          	lw	a5,-20(s0)
    800088f6:	873e                	mv	a4,a5
    800088f8:	47fd                	li	a5,31
    800088fa:	00e7eb63          	bltu	a5,a4,80008910 <sys_exec+0x1b4>
    800088fe:	fec42783          	lw	a5,-20(s0)
    80008902:	078e                	slli	a5,a5,0x3
    80008904:	ff040713          	addi	a4,s0,-16
    80008908:	97ba                	add	a5,a5,a4
    8000890a:	e787b783          	ld	a5,-392(a5)
    8000890e:	f3e1                	bnez	a5,800088ce <sys_exec+0x172>
  return -1;
    80008910:	57fd                	li	a5,-1
}
    80008912:	853e                	mv	a0,a5
    80008914:	70ba                	ld	ra,424(sp)
    80008916:	741a                	ld	s0,416(sp)
    80008918:	615d                	addi	sp,sp,432
    8000891a:	8082                	ret

000000008000891c <sys_pipe>:

uint64
sys_pipe(void)
{
    8000891c:	7139                	addi	sp,sp,-64
    8000891e:	fc06                	sd	ra,56(sp)
    80008920:	f822                	sd	s0,48(sp)
    80008922:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008924:	ffffa097          	auipc	ra,0xffffa
    80008928:	176080e7          	jalr	374(ra) # 80002a9a <myproc>
    8000892c:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008930:	fe040793          	addi	a5,s0,-32
    80008934:	85be                	mv	a1,a5
    80008936:	4501                	li	a0,0
    80008938:	ffffc097          	auipc	ra,0xffffc
    8000893c:	a56080e7          	jalr	-1450(ra) # 8000438e <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008940:	fd040713          	addi	a4,s0,-48
    80008944:	fd840793          	addi	a5,s0,-40
    80008948:	85ba                	mv	a1,a4
    8000894a:	853e                	mv	a0,a5
    8000894c:	ffffe097          	auipc	ra,0xffffe
    80008950:	5ee080e7          	jalr	1518(ra) # 80006f3a <pipealloc>
    80008954:	87aa                	mv	a5,a0
    80008956:	0007d463          	bgez	a5,8000895e <sys_pipe+0x42>
    return -1;
    8000895a:	57fd                	li	a5,-1
    8000895c:	a219                	j	80008a62 <sys_pipe+0x146>
  fd0 = -1;
    8000895e:	57fd                	li	a5,-1
    80008960:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008964:	fd843783          	ld	a5,-40(s0)
    80008968:	853e                	mv	a0,a5
    8000896a:	fffff097          	auipc	ra,0xfffff
    8000896e:	0da080e7          	jalr	218(ra) # 80007a44 <fdalloc>
    80008972:	87aa                	mv	a5,a0
    80008974:	fcf42623          	sw	a5,-52(s0)
    80008978:	fcc42783          	lw	a5,-52(s0)
    8000897c:	0207c063          	bltz	a5,8000899c <sys_pipe+0x80>
    80008980:	fd043783          	ld	a5,-48(s0)
    80008984:	853e                	mv	a0,a5
    80008986:	fffff097          	auipc	ra,0xfffff
    8000898a:	0be080e7          	jalr	190(ra) # 80007a44 <fdalloc>
    8000898e:	87aa                	mv	a5,a0
    80008990:	fcf42423          	sw	a5,-56(s0)
    80008994:	fc842783          	lw	a5,-56(s0)
    80008998:	0207df63          	bgez	a5,800089d6 <sys_pipe+0xba>
    if(fd0 >= 0)
    8000899c:	fcc42783          	lw	a5,-52(s0)
    800089a0:	0007cb63          	bltz	a5,800089b6 <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    800089a4:	fcc42783          	lw	a5,-52(s0)
    800089a8:	fe843703          	ld	a4,-24(s0)
    800089ac:	07e9                	addi	a5,a5,26
    800089ae:	078e                	slli	a5,a5,0x3
    800089b0:	97ba                	add	a5,a5,a4
    800089b2:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    800089b6:	fd843783          	ld	a5,-40(s0)
    800089ba:	853e                	mv	a0,a5
    800089bc:	ffffe097          	auipc	ra,0xffffe
    800089c0:	068080e7          	jalr	104(ra) # 80006a24 <fileclose>
    fileclose(wf);
    800089c4:	fd043783          	ld	a5,-48(s0)
    800089c8:	853e                	mv	a0,a5
    800089ca:	ffffe097          	auipc	ra,0xffffe
    800089ce:	05a080e7          	jalr	90(ra) # 80006a24 <fileclose>
    return -1;
    800089d2:	57fd                	li	a5,-1
    800089d4:	a079                	j	80008a62 <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    800089d6:	fe843783          	ld	a5,-24(s0)
    800089da:	6bbc                	ld	a5,80(a5)
    800089dc:	fe043703          	ld	a4,-32(s0)
    800089e0:	fcc40613          	addi	a2,s0,-52
    800089e4:	4691                	li	a3,4
    800089e6:	85ba                	mv	a1,a4
    800089e8:	853e                	mv	a0,a5
    800089ea:	ffffa097          	auipc	ra,0xffffa
    800089ee:	b7a080e7          	jalr	-1158(ra) # 80002564 <copyout>
    800089f2:	87aa                	mv	a5,a0
    800089f4:	0207c463          	bltz	a5,80008a1c <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    800089f8:	fe843783          	ld	a5,-24(s0)
    800089fc:	6bb8                	ld	a4,80(a5)
    800089fe:	fe043783          	ld	a5,-32(s0)
    80008a02:	0791                	addi	a5,a5,4
    80008a04:	fc840613          	addi	a2,s0,-56
    80008a08:	4691                	li	a3,4
    80008a0a:	85be                	mv	a1,a5
    80008a0c:	853a                	mv	a0,a4
    80008a0e:	ffffa097          	auipc	ra,0xffffa
    80008a12:	b56080e7          	jalr	-1194(ra) # 80002564 <copyout>
    80008a16:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008a18:	0407d463          	bgez	a5,80008a60 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008a1c:	fcc42783          	lw	a5,-52(s0)
    80008a20:	fe843703          	ld	a4,-24(s0)
    80008a24:	07e9                	addi	a5,a5,26
    80008a26:	078e                	slli	a5,a5,0x3
    80008a28:	97ba                	add	a5,a5,a4
    80008a2a:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008a2e:	fc842783          	lw	a5,-56(s0)
    80008a32:	fe843703          	ld	a4,-24(s0)
    80008a36:	07e9                	addi	a5,a5,26
    80008a38:	078e                	slli	a5,a5,0x3
    80008a3a:	97ba                	add	a5,a5,a4
    80008a3c:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a40:	fd843783          	ld	a5,-40(s0)
    80008a44:	853e                	mv	a0,a5
    80008a46:	ffffe097          	auipc	ra,0xffffe
    80008a4a:	fde080e7          	jalr	-34(ra) # 80006a24 <fileclose>
    fileclose(wf);
    80008a4e:	fd043783          	ld	a5,-48(s0)
    80008a52:	853e                	mv	a0,a5
    80008a54:	ffffe097          	auipc	ra,0xffffe
    80008a58:	fd0080e7          	jalr	-48(ra) # 80006a24 <fileclose>
    return -1;
    80008a5c:	57fd                	li	a5,-1
    80008a5e:	a011                	j	80008a62 <sys_pipe+0x146>
  }
  return 0;
    80008a60:	4781                	li	a5,0
}
    80008a62:	853e                	mv	a0,a5
    80008a64:	70e2                	ld	ra,56(sp)
    80008a66:	7442                	ld	s0,48(sp)
    80008a68:	6121                	addi	sp,sp,64
    80008a6a:	8082                	ret
    80008a6c:	0000                	unimp
	...

0000000080008a70 <kernelvec>:
    80008a70:	7111                	addi	sp,sp,-256
    80008a72:	e006                	sd	ra,0(sp)
    80008a74:	e40a                	sd	sp,8(sp)
    80008a76:	e80e                	sd	gp,16(sp)
    80008a78:	ec12                	sd	tp,24(sp)
    80008a7a:	f016                	sd	t0,32(sp)
    80008a7c:	f41a                	sd	t1,40(sp)
    80008a7e:	f81e                	sd	t2,48(sp)
    80008a80:	fc22                	sd	s0,56(sp)
    80008a82:	e0a6                	sd	s1,64(sp)
    80008a84:	e4aa                	sd	a0,72(sp)
    80008a86:	e8ae                	sd	a1,80(sp)
    80008a88:	ecb2                	sd	a2,88(sp)
    80008a8a:	f0b6                	sd	a3,96(sp)
    80008a8c:	f4ba                	sd	a4,104(sp)
    80008a8e:	f8be                	sd	a5,112(sp)
    80008a90:	fcc2                	sd	a6,120(sp)
    80008a92:	e146                	sd	a7,128(sp)
    80008a94:	e54a                	sd	s2,136(sp)
    80008a96:	e94e                	sd	s3,144(sp)
    80008a98:	ed52                	sd	s4,152(sp)
    80008a9a:	f156                	sd	s5,160(sp)
    80008a9c:	f55a                	sd	s6,168(sp)
    80008a9e:	f95e                	sd	s7,176(sp)
    80008aa0:	fd62                	sd	s8,184(sp)
    80008aa2:	e1e6                	sd	s9,192(sp)
    80008aa4:	e5ea                	sd	s10,200(sp)
    80008aa6:	e9ee                	sd	s11,208(sp)
    80008aa8:	edf2                	sd	t3,216(sp)
    80008aaa:	f1f6                	sd	t4,224(sp)
    80008aac:	f5fa                	sd	t5,232(sp)
    80008aae:	f9fe                	sd	t6,240(sp)
    80008ab0:	c92fb0ef          	jal	ra,80003f42 <kerneltrap>
    80008ab4:	6082                	ld	ra,0(sp)
    80008ab6:	6122                	ld	sp,8(sp)
    80008ab8:	61c2                	ld	gp,16(sp)
    80008aba:	7282                	ld	t0,32(sp)
    80008abc:	7322                	ld	t1,40(sp)
    80008abe:	73c2                	ld	t2,48(sp)
    80008ac0:	7462                	ld	s0,56(sp)
    80008ac2:	6486                	ld	s1,64(sp)
    80008ac4:	6526                	ld	a0,72(sp)
    80008ac6:	65c6                	ld	a1,80(sp)
    80008ac8:	6666                	ld	a2,88(sp)
    80008aca:	7686                	ld	a3,96(sp)
    80008acc:	7726                	ld	a4,104(sp)
    80008ace:	77c6                	ld	a5,112(sp)
    80008ad0:	7866                	ld	a6,120(sp)
    80008ad2:	688a                	ld	a7,128(sp)
    80008ad4:	692a                	ld	s2,136(sp)
    80008ad6:	69ca                	ld	s3,144(sp)
    80008ad8:	6a6a                	ld	s4,152(sp)
    80008ada:	7a8a                	ld	s5,160(sp)
    80008adc:	7b2a                	ld	s6,168(sp)
    80008ade:	7bca                	ld	s7,176(sp)
    80008ae0:	7c6a                	ld	s8,184(sp)
    80008ae2:	6c8e                	ld	s9,192(sp)
    80008ae4:	6d2e                	ld	s10,200(sp)
    80008ae6:	6dce                	ld	s11,208(sp)
    80008ae8:	6e6e                	ld	t3,216(sp)
    80008aea:	7e8e                	ld	t4,224(sp)
    80008aec:	7f2e                	ld	t5,232(sp)
    80008aee:	7fce                	ld	t6,240(sp)
    80008af0:	6111                	addi	sp,sp,256
    80008af2:	10200073          	sret
    80008af6:	00000013          	nop
    80008afa:	00000013          	nop
    80008afe:	0001                	nop

0000000080008b00 <timervec>:
    80008b00:	34051573          	csrrw	a0,mscratch,a0
    80008b04:	e10c                	sd	a1,0(a0)
    80008b06:	e510                	sd	a2,8(a0)
    80008b08:	e914                	sd	a3,16(a0)
    80008b0a:	6d0c                	ld	a1,24(a0)
    80008b0c:	7110                	ld	a2,32(a0)
    80008b0e:	6194                	ld	a3,0(a1)
    80008b10:	96b2                	add	a3,a3,a2
    80008b12:	e194                	sd	a3,0(a1)
    80008b14:	4589                	li	a1,2
    80008b16:	14459073          	csrw	sip,a1
    80008b1a:	6914                	ld	a3,16(a0)
    80008b1c:	6510                	ld	a2,8(a0)
    80008b1e:	610c                	ld	a1,0(a0)
    80008b20:	34051573          	csrrw	a0,mscratch,a0
    80008b24:	30200073          	mret
	...

0000000080008b2a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008b2a:	1141                	addi	sp,sp,-16
    80008b2c:	e422                	sd	s0,8(sp)
    80008b2e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008b30:	0c0007b7          	lui	a5,0xc000
    80008b34:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008b38:	4705                	li	a4,1
    80008b3a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008b3c:	0c0007b7          	lui	a5,0xc000
    80008b40:	0791                	addi	a5,a5,4
    80008b42:	4705                	li	a4,1
    80008b44:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008b46:	0c0007b7          	lui	a5,0xc000
    80008b4a:	07a1                	addi	a5,a5,8
    80008b4c:	4705                	li	a4,1
    80008b4e:	c398                	sw	a4,0(a5)
}
    80008b50:	0001                	nop
    80008b52:	6422                	ld	s0,8(sp)
    80008b54:	0141                	addi	sp,sp,16
    80008b56:	8082                	ret

0000000080008b58 <plicinithart>:

void
plicinithart(void)
{
    80008b58:	1101                	addi	sp,sp,-32
    80008b5a:	ec06                	sd	ra,24(sp)
    80008b5c:	e822                	sd	s0,16(sp)
    80008b5e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008b60:	ffffa097          	auipc	ra,0xffffa
    80008b64:	edc080e7          	jalr	-292(ra) # 80002a3c <cpuid>
    80008b68:	87aa                	mv	a5,a0
    80008b6a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008b6e:	fec42783          	lw	a5,-20(s0)
    80008b72:	0087979b          	slliw	a5,a5,0x8
    80008b76:	2781                	sext.w	a5,a5
    80008b78:	873e                	mv	a4,a5
    80008b7a:	0c0027b7          	lui	a5,0xc002
    80008b7e:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008b82:	97ba                	add	a5,a5,a4
    80008b84:	873e                	mv	a4,a5
    80008b86:	40600793          	li	a5,1030
    80008b8a:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008b8c:	fec42783          	lw	a5,-20(s0)
    80008b90:	00d7979b          	slliw	a5,a5,0xd
    80008b94:	2781                	sext.w	a5,a5
    80008b96:	873e                	mv	a4,a5
    80008b98:	0c2017b7          	lui	a5,0xc201
    80008b9c:	97ba                	add	a5,a5,a4
    80008b9e:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008ba2:	0001                	nop
    80008ba4:	60e2                	ld	ra,24(sp)
    80008ba6:	6442                	ld	s0,16(sp)
    80008ba8:	6105                	addi	sp,sp,32
    80008baa:	8082                	ret

0000000080008bac <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008bac:	1101                	addi	sp,sp,-32
    80008bae:	ec06                	sd	ra,24(sp)
    80008bb0:	e822                	sd	s0,16(sp)
    80008bb2:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008bb4:	ffffa097          	auipc	ra,0xffffa
    80008bb8:	e88080e7          	jalr	-376(ra) # 80002a3c <cpuid>
    80008bbc:	87aa                	mv	a5,a0
    80008bbe:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008bc2:	fec42783          	lw	a5,-20(s0)
    80008bc6:	00d7979b          	slliw	a5,a5,0xd
    80008bca:	2781                	sext.w	a5,a5
    80008bcc:	873e                	mv	a4,a5
    80008bce:	0c2017b7          	lui	a5,0xc201
    80008bd2:	0791                	addi	a5,a5,4
    80008bd4:	97ba                	add	a5,a5,a4
    80008bd6:	439c                	lw	a5,0(a5)
    80008bd8:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008bdc:	fe842783          	lw	a5,-24(s0)
}
    80008be0:	853e                	mv	a0,a5
    80008be2:	60e2                	ld	ra,24(sp)
    80008be4:	6442                	ld	s0,16(sp)
    80008be6:	6105                	addi	sp,sp,32
    80008be8:	8082                	ret

0000000080008bea <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008bea:	7179                	addi	sp,sp,-48
    80008bec:	f406                	sd	ra,40(sp)
    80008bee:	f022                	sd	s0,32(sp)
    80008bf0:	1800                	addi	s0,sp,48
    80008bf2:	87aa                	mv	a5,a0
    80008bf4:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008bf8:	ffffa097          	auipc	ra,0xffffa
    80008bfc:	e44080e7          	jalr	-444(ra) # 80002a3c <cpuid>
    80008c00:	87aa                	mv	a5,a0
    80008c02:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008c06:	fec42783          	lw	a5,-20(s0)
    80008c0a:	00d7979b          	slliw	a5,a5,0xd
    80008c0e:	2781                	sext.w	a5,a5
    80008c10:	873e                	mv	a4,a5
    80008c12:	0c2017b7          	lui	a5,0xc201
    80008c16:	0791                	addi	a5,a5,4
    80008c18:	97ba                	add	a5,a5,a4
    80008c1a:	873e                	mv	a4,a5
    80008c1c:	fdc42783          	lw	a5,-36(s0)
    80008c20:	c31c                	sw	a5,0(a4)
}
    80008c22:	0001                	nop
    80008c24:	70a2                	ld	ra,40(sp)
    80008c26:	7402                	ld	s0,32(sp)
    80008c28:	6145                	addi	sp,sp,48
    80008c2a:	8082                	ret

0000000080008c2c <r_sstatus>:
{
    80008c2c:	1101                	addi	sp,sp,-32
    80008c2e:	ec22                	sd	s0,24(sp)
    80008c30:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80008c32:	100027f3          	csrr	a5,sstatus
    80008c36:	fef43423          	sd	a5,-24(s0)
  return x;
    80008c3a:	fe843783          	ld	a5,-24(s0)
}
    80008c3e:	853e                	mv	a0,a5
    80008c40:	6462                	ld	s0,24(sp)
    80008c42:	6105                	addi	sp,sp,32
    80008c44:	8082                	ret

0000000080008c46 <w_sstatus>:
{
    80008c46:	1101                	addi	sp,sp,-32
    80008c48:	ec22                	sd	s0,24(sp)
    80008c4a:	1000                	addi	s0,sp,32
    80008c4c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80008c50:	fe843783          	ld	a5,-24(s0)
    80008c54:	10079073          	csrw	sstatus,a5
}
    80008c58:	0001                	nop
    80008c5a:	6462                	ld	s0,24(sp)
    80008c5c:	6105                	addi	sp,sp,32
    80008c5e:	8082                	ret

0000000080008c60 <intr_on>:
{
    80008c60:	1141                	addi	sp,sp,-16
    80008c62:	e406                	sd	ra,8(sp)
    80008c64:	e022                	sd	s0,0(sp)
    80008c66:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80008c68:	00000097          	auipc	ra,0x0
    80008c6c:	fc4080e7          	jalr	-60(ra) # 80008c2c <r_sstatus>
    80008c70:	87aa                	mv	a5,a0
    80008c72:	0027e793          	ori	a5,a5,2
    80008c76:	853e                	mv	a0,a5
    80008c78:	00000097          	auipc	ra,0x0
    80008c7c:	fce080e7          	jalr	-50(ra) # 80008c46 <w_sstatus>
}
    80008c80:	0001                	nop
    80008c82:	60a2                	ld	ra,8(sp)
    80008c84:	6402                	ld	s0,0(sp)
    80008c86:	0141                	addi	sp,sp,16
    80008c88:	8082                	ret

0000000080008c8a <intr_off>:
{
    80008c8a:	1141                	addi	sp,sp,-16
    80008c8c:	e406                	sd	ra,8(sp)
    80008c8e:	e022                	sd	s0,0(sp)
    80008c90:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80008c92:	00000097          	auipc	ra,0x0
    80008c96:	f9a080e7          	jalr	-102(ra) # 80008c2c <r_sstatus>
    80008c9a:	87aa                	mv	a5,a0
    80008c9c:	9bf5                	andi	a5,a5,-3
    80008c9e:	853e                	mv	a0,a5
    80008ca0:	00000097          	auipc	ra,0x0
    80008ca4:	fa6080e7          	jalr	-90(ra) # 80008c46 <w_sstatus>
}
    80008ca8:	0001                	nop
    80008caa:	60a2                	ld	ra,8(sp)
    80008cac:	6402                	ld	s0,0(sp)
    80008cae:	0141                	addi	sp,sp,16
    80008cb0:	8082                	ret

0000000080008cb2 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    80008cb2:	7139                	addi	sp,sp,-64
    80008cb4:	fc06                	sd	ra,56(sp)
    80008cb6:	f822                	sd	s0,48(sp)
    80008cb8:	0080                	addi	s0,sp,64
    80008cba:	87aa                	mv	a5,a0
    80008cbc:	fcb43023          	sd	a1,-64(s0)
    80008cc0:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80008cc4:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008cc8:	fcc42703          	lw	a4,-52(s0)
    80008ccc:	15000793          	li	a5,336
    80008cd0:	02f707b3          	mul	a5,a4,a5
    80008cd4:	13078713          	addi	a4,a5,304 # c201130 <_entry-0x73dfeed0>
    80008cd8:	0002c797          	auipc	a5,0x2c
    80008cdc:	fb078793          	addi	a5,a5,-80 # 80034c88 <disk>
    80008ce0:	97ba                	add	a5,a5,a4
    80008ce2:	fc043583          	ld	a1,-64(s0)
    80008ce6:	853e                	mv	a0,a5
    80008ce8:	ffff8097          	auipc	ra,0xffff8
    80008cec:	612080e7          	jalr	1554(ra) # 800012fa <initlock>
  disk[id].name = name;
    80008cf0:	0002c717          	auipc	a4,0x2c
    80008cf4:	f9870713          	addi	a4,a4,-104 # 80034c88 <disk>
    80008cf8:	fcc42683          	lw	a3,-52(s0)
    80008cfc:	15000793          	li	a5,336
    80008d00:	02f687b3          	mul	a5,a3,a5
    80008d04:	97ba                	add	a5,a5,a4
    80008d06:	fc043703          	ld	a4,-64(s0)
    80008d0a:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008d0c:	fcc42703          	lw	a4,-52(s0)
    80008d10:	67c1                	lui	a5,0x10
    80008d12:	0785                	addi	a5,a5,1
    80008d14:	97ba                	add	a5,a5,a4
    80008d16:	07b2                	slli	a5,a5,0xc
    80008d18:	439c                	lw	a5,0(a5)
    80008d1a:	2781                	sext.w	a5,a5
    80008d1c:	873e                	mv	a4,a5
    80008d1e:	747277b7          	lui	a5,0x74727
    80008d22:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008d26:	04f71c63          	bne	a4,a5,80008d7e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008d2a:	fcc42703          	lw	a4,-52(s0)
    80008d2e:	67c1                	lui	a5,0x10
    80008d30:	0785                	addi	a5,a5,1
    80008d32:	97ba                	add	a5,a5,a4
    80008d34:	07b2                	slli	a5,a5,0xc
    80008d36:	0791                	addi	a5,a5,4
    80008d38:	439c                	lw	a5,0(a5)
    80008d3a:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008d3c:	873e                	mv	a4,a5
    80008d3e:	4789                	li	a5,2
    80008d40:	02f71f63          	bne	a4,a5,80008d7e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008d44:	fcc42703          	lw	a4,-52(s0)
    80008d48:	67c1                	lui	a5,0x10
    80008d4a:	0785                	addi	a5,a5,1
    80008d4c:	97ba                	add	a5,a5,a4
    80008d4e:	07b2                	slli	a5,a5,0xc
    80008d50:	07a1                	addi	a5,a5,8
    80008d52:	439c                	lw	a5,0(a5)
    80008d54:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008d56:	873e                	mv	a4,a5
    80008d58:	4789                	li	a5,2
    80008d5a:	02f71263          	bne	a4,a5,80008d7e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008d5e:	fcc42703          	lw	a4,-52(s0)
    80008d62:	67c1                	lui	a5,0x10
    80008d64:	0785                	addi	a5,a5,1
    80008d66:	97ba                	add	a5,a5,a4
    80008d68:	07b2                	slli	a5,a5,0xc
    80008d6a:	07b1                	addi	a5,a5,12
    80008d6c:	439c                	lw	a5,0(a5)
    80008d6e:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008d70:	873e                	mv	a4,a5
    80008d72:	554d47b7          	lui	a5,0x554d4
    80008d76:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008d7a:	00f70d63          	beq	a4,a5,80008d94 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    80008d7e:	fc043603          	ld	a2,-64(s0)
    80008d82:	00003597          	auipc	a1,0x3
    80008d86:	8ee58593          	addi	a1,a1,-1810 # 8000b670 <etext+0x670>
    80008d8a:	4509                	li	a0,2
    80008d8c:	ffff8097          	auipc	ra,0xffff8
    80008d90:	f52080e7          	jalr	-174(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008d94:	fcc42703          	lw	a4,-52(s0)
    80008d98:	67c1                	lui	a5,0x10
    80008d9a:	0785                	addi	a5,a5,1
    80008d9c:	97ba                	add	a5,a5,a4
    80008d9e:	07b2                	slli	a5,a5,0xc
    80008da0:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008da4:	873e                	mv	a4,a5
    80008da6:	fe842783          	lw	a5,-24(s0)
    80008daa:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008dac:	fe842783          	lw	a5,-24(s0)
    80008db0:	0017e793          	ori	a5,a5,1
    80008db4:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008db8:	fcc42703          	lw	a4,-52(s0)
    80008dbc:	67c1                	lui	a5,0x10
    80008dbe:	0785                	addi	a5,a5,1
    80008dc0:	97ba                	add	a5,a5,a4
    80008dc2:	07b2                	slli	a5,a5,0xc
    80008dc4:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008dc8:	873e                	mv	a4,a5
    80008dca:	fe842783          	lw	a5,-24(s0)
    80008dce:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008dd0:	fe842783          	lw	a5,-24(s0)
    80008dd4:	0027e793          	ori	a5,a5,2
    80008dd8:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008ddc:	fcc42703          	lw	a4,-52(s0)
    80008de0:	67c1                	lui	a5,0x10
    80008de2:	0785                	addi	a5,a5,1
    80008de4:	97ba                	add	a5,a5,a4
    80008de6:	07b2                	slli	a5,a5,0xc
    80008de8:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008dec:	873e                	mv	a4,a5
    80008dee:	fe842783          	lw	a5,-24(s0)
    80008df2:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008df4:	fcc42703          	lw	a4,-52(s0)
    80008df8:	67c1                	lui	a5,0x10
    80008dfa:	0785                	addi	a5,a5,1
    80008dfc:	97ba                	add	a5,a5,a4
    80008dfe:	07b2                	slli	a5,a5,0xc
    80008e00:	07c1                	addi	a5,a5,16
    80008e02:	439c                	lw	a5,0(a5)
    80008e04:	2781                	sext.w	a5,a5
    80008e06:	1782                	slli	a5,a5,0x20
    80008e08:	9381                	srli	a5,a5,0x20
    80008e0a:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008e0e:	fe043783          	ld	a5,-32(s0)
    80008e12:	fdf7f793          	andi	a5,a5,-33
    80008e16:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008e1a:	fe043783          	ld	a5,-32(s0)
    80008e1e:	f7f7f793          	andi	a5,a5,-129
    80008e22:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008e26:	fe043703          	ld	a4,-32(s0)
    80008e2a:	77fd                	lui	a5,0xfffff
    80008e2c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffca8cf>
    80008e30:	8ff9                	and	a5,a5,a4
    80008e32:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008e36:	fe043703          	ld	a4,-32(s0)
    80008e3a:	77fd                	lui	a5,0xfffff
    80008e3c:	17fd                	addi	a5,a5,-1
    80008e3e:	8ff9                	and	a5,a5,a4
    80008e40:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008e44:	fe043703          	ld	a4,-32(s0)
    80008e48:	f80007b7          	lui	a5,0xf8000
    80008e4c:	17fd                	addi	a5,a5,-1
    80008e4e:	8ff9                	and	a5,a5,a4
    80008e50:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008e54:	fe043703          	ld	a4,-32(s0)
    80008e58:	e00007b7          	lui	a5,0xe0000
    80008e5c:	17fd                	addi	a5,a5,-1
    80008e5e:	8ff9                	and	a5,a5,a4
    80008e60:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008e64:	fe043703          	ld	a4,-32(s0)
    80008e68:	f00007b7          	lui	a5,0xf0000
    80008e6c:	17fd                	addi	a5,a5,-1
    80008e6e:	8ff9                	and	a5,a5,a4
    80008e70:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008e74:	fcc42703          	lw	a4,-52(s0)
    80008e78:	67c1                	lui	a5,0x10
    80008e7a:	0785                	addi	a5,a5,1
    80008e7c:	97ba                	add	a5,a5,a4
    80008e7e:	07b2                	slli	a5,a5,0xc
    80008e80:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80008e84:	873e                	mv	a4,a5
    80008e86:	fe043783          	ld	a5,-32(s0)
    80008e8a:	2781                	sext.w	a5,a5
    80008e8c:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008e8e:	fe842783          	lw	a5,-24(s0)
    80008e92:	0087e793          	ori	a5,a5,8
    80008e96:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008e9a:	fcc42703          	lw	a4,-52(s0)
    80008e9e:	67c1                	lui	a5,0x10
    80008ea0:	0785                	addi	a5,a5,1
    80008ea2:	97ba                	add	a5,a5,a4
    80008ea4:	07b2                	slli	a5,a5,0xc
    80008ea6:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008eaa:	873e                	mv	a4,a5
    80008eac:	fe842783          	lw	a5,-24(s0)
    80008eb0:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80008eb2:	fcc42703          	lw	a4,-52(s0)
    80008eb6:	67c1                	lui	a5,0x10
    80008eb8:	0785                	addi	a5,a5,1
    80008eba:	97ba                	add	a5,a5,a4
    80008ebc:	07b2                	slli	a5,a5,0xc
    80008ebe:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008ec2:	439c                	lw	a5,0(a5)
    80008ec4:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80008ec8:	fe842783          	lw	a5,-24(s0)
    80008ecc:	8ba1                	andi	a5,a5,8
    80008ece:	2781                	sext.w	a5,a5
    80008ed0:	ef81                	bnez	a5,80008ee8 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    80008ed2:	00002617          	auipc	a2,0x2
    80008ed6:	7be60613          	addi	a2,a2,1982 # 8000b690 <etext+0x690>
    80008eda:	fc043583          	ld	a1,-64(s0)
    80008ede:	4509                	li	a0,2
    80008ee0:	ffff8097          	auipc	ra,0xffff8
    80008ee4:	dfe080e7          	jalr	-514(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008ee8:	fcc42703          	lw	a4,-52(s0)
    80008eec:	67c1                	lui	a5,0x10
    80008eee:	0785                	addi	a5,a5,1
    80008ef0:	97ba                	add	a5,a5,a4
    80008ef2:	07b2                	slli	a5,a5,0xc
    80008ef4:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    80008ef8:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    80008efc:	fcc42703          	lw	a4,-52(s0)
    80008f00:	67c1                	lui	a5,0x10
    80008f02:	0785                	addi	a5,a5,1
    80008f04:	97ba                	add	a5,a5,a4
    80008f06:	07b2                	slli	a5,a5,0xc
    80008f08:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80008f0c:	439c                	lw	a5,0(a5)
    80008f0e:	2781                	sext.w	a5,a5
    80008f10:	cf81                	beqz	a5,80008f28 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    80008f12:	00002617          	auipc	a2,0x2
    80008f16:	79e60613          	addi	a2,a2,1950 # 8000b6b0 <etext+0x6b0>
    80008f1a:	fc043583          	ld	a1,-64(s0)
    80008f1e:	4509                	li	a0,2
    80008f20:	ffff8097          	auipc	ra,0xffff8
    80008f24:	dbe080e7          	jalr	-578(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    80008f28:	fcc42703          	lw	a4,-52(s0)
    80008f2c:	67c1                	lui	a5,0x10
    80008f2e:	0785                	addi	a5,a5,1
    80008f30:	97ba                	add	a5,a5,a4
    80008f32:	07b2                	slli	a5,a5,0xc
    80008f34:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80008f38:	439c                	lw	a5,0(a5)
    80008f3a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    80008f3e:	fdc42783          	lw	a5,-36(s0)
    80008f42:	2781                	sext.w	a5,a5
    80008f44:	ef81                	bnez	a5,80008f5c <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    80008f46:	00002617          	auipc	a2,0x2
    80008f4a:	79260613          	addi	a2,a2,1938 # 8000b6d8 <etext+0x6d8>
    80008f4e:	fc043583          	ld	a1,-64(s0)
    80008f52:	4509                	li	a0,2
    80008f54:	ffff8097          	auipc	ra,0xffff8
    80008f58:	d8a080e7          	jalr	-630(ra) # 80000cde <panic_concat>
  if(max < NUM)
    80008f5c:	fdc42783          	lw	a5,-36(s0)
    80008f60:	0007871b          	sext.w	a4,a5
    80008f64:	479d                	li	a5,7
    80008f66:	00e7ed63          	bltu	a5,a4,80008f80 <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    80008f6a:	00002617          	auipc	a2,0x2
    80008f6e:	78e60613          	addi	a2,a2,1934 # 8000b6f8 <etext+0x6f8>
    80008f72:	fc043583          	ld	a1,-64(s0)
    80008f76:	4509                	li	a0,2
    80008f78:	ffff8097          	auipc	ra,0xffff8
    80008f7c:	d66080e7          	jalr	-666(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    80008f80:	ffff8097          	auipc	ra,0xffff8
    80008f84:	256080e7          	jalr	598(ra) # 800011d6 <kalloc>
    80008f88:	862a                	mv	a2,a0
    80008f8a:	0002c717          	auipc	a4,0x2c
    80008f8e:	cfe70713          	addi	a4,a4,-770 # 80034c88 <disk>
    80008f92:	fcc42683          	lw	a3,-52(s0)
    80008f96:	15000793          	li	a5,336
    80008f9a:	02f687b3          	mul	a5,a3,a5
    80008f9e:	97ba                	add	a5,a5,a4
    80008fa0:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    80008fa2:	ffff8097          	auipc	ra,0xffff8
    80008fa6:	234080e7          	jalr	564(ra) # 800011d6 <kalloc>
    80008faa:	862a                	mv	a2,a0
    80008fac:	0002c717          	auipc	a4,0x2c
    80008fb0:	cdc70713          	addi	a4,a4,-804 # 80034c88 <disk>
    80008fb4:	fcc42683          	lw	a3,-52(s0)
    80008fb8:	15000793          	li	a5,336
    80008fbc:	02f687b3          	mul	a5,a3,a5
    80008fc0:	97ba                	add	a5,a5,a4
    80008fc2:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    80008fc4:	ffff8097          	auipc	ra,0xffff8
    80008fc8:	212080e7          	jalr	530(ra) # 800011d6 <kalloc>
    80008fcc:	862a                	mv	a2,a0
    80008fce:	0002c717          	auipc	a4,0x2c
    80008fd2:	cba70713          	addi	a4,a4,-838 # 80034c88 <disk>
    80008fd6:	fcc42683          	lw	a3,-52(s0)
    80008fda:	15000793          	li	a5,336
    80008fde:	02f687b3          	mul	a5,a3,a5
    80008fe2:	97ba                	add	a5,a5,a4
    80008fe4:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    80008fe6:	0002c717          	auipc	a4,0x2c
    80008fea:	ca270713          	addi	a4,a4,-862 # 80034c88 <disk>
    80008fee:	fcc42683          	lw	a3,-52(s0)
    80008ff2:	15000793          	li	a5,336
    80008ff6:	02f687b3          	mul	a5,a3,a5
    80008ffa:	97ba                	add	a5,a5,a4
    80008ffc:	679c                	ld	a5,8(a5)
    80008ffe:	cb9d                	beqz	a5,80009034 <virtio_disk_init+0x382>
    80009000:	0002c717          	auipc	a4,0x2c
    80009004:	c8870713          	addi	a4,a4,-888 # 80034c88 <disk>
    80009008:	fcc42683          	lw	a3,-52(s0)
    8000900c:	15000793          	li	a5,336
    80009010:	02f687b3          	mul	a5,a3,a5
    80009014:	97ba                	add	a5,a5,a4
    80009016:	6b9c                	ld	a5,16(a5)
    80009018:	cf91                	beqz	a5,80009034 <virtio_disk_init+0x382>
    8000901a:	0002c717          	auipc	a4,0x2c
    8000901e:	c6e70713          	addi	a4,a4,-914 # 80034c88 <disk>
    80009022:	fcc42683          	lw	a3,-52(s0)
    80009026:	15000793          	li	a5,336
    8000902a:	02f687b3          	mul	a5,a3,a5
    8000902e:	97ba                	add	a5,a5,a4
    80009030:	6f9c                	ld	a5,24(a5)
    80009032:	ef81                	bnez	a5,8000904a <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80009034:	00002617          	auipc	a2,0x2
    80009038:	6ec60613          	addi	a2,a2,1772 # 8000b720 <etext+0x720>
    8000903c:	fc043583          	ld	a1,-64(s0)
    80009040:	4509                	li	a0,2
    80009042:	ffff8097          	auipc	ra,0xffff8
    80009046:	c9c080e7          	jalr	-868(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    8000904a:	0002c717          	auipc	a4,0x2c
    8000904e:	c3e70713          	addi	a4,a4,-962 # 80034c88 <disk>
    80009052:	fcc42683          	lw	a3,-52(s0)
    80009056:	15000793          	li	a5,336
    8000905a:	02f687b3          	mul	a5,a3,a5
    8000905e:	97ba                	add	a5,a5,a4
    80009060:	679c                	ld	a5,8(a5)
    80009062:	6605                	lui	a2,0x1
    80009064:	4581                	li	a1,0
    80009066:	853e                	mv	a0,a5
    80009068:	ffff8097          	auipc	ra,0xffff8
    8000906c:	496080e7          	jalr	1174(ra) # 800014fe <memset>
  memset(disk[id].avail, 0, PGSIZE);
    80009070:	0002c717          	auipc	a4,0x2c
    80009074:	c1870713          	addi	a4,a4,-1000 # 80034c88 <disk>
    80009078:	fcc42683          	lw	a3,-52(s0)
    8000907c:	15000793          	li	a5,336
    80009080:	02f687b3          	mul	a5,a3,a5
    80009084:	97ba                	add	a5,a5,a4
    80009086:	6b9c                	ld	a5,16(a5)
    80009088:	6605                	lui	a2,0x1
    8000908a:	4581                	li	a1,0
    8000908c:	853e                	mv	a0,a5
    8000908e:	ffff8097          	auipc	ra,0xffff8
    80009092:	470080e7          	jalr	1136(ra) # 800014fe <memset>
  memset(disk[id].used, 0, PGSIZE);
    80009096:	0002c717          	auipc	a4,0x2c
    8000909a:	bf270713          	addi	a4,a4,-1038 # 80034c88 <disk>
    8000909e:	fcc42683          	lw	a3,-52(s0)
    800090a2:	15000793          	li	a5,336
    800090a6:	02f687b3          	mul	a5,a3,a5
    800090aa:	97ba                	add	a5,a5,a4
    800090ac:	6f9c                	ld	a5,24(a5)
    800090ae:	6605                	lui	a2,0x1
    800090b0:	4581                	li	a1,0
    800090b2:	853e                	mv	a0,a5
    800090b4:	ffff8097          	auipc	ra,0xffff8
    800090b8:	44a080e7          	jalr	1098(ra) # 800014fe <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    800090bc:	fcc42703          	lw	a4,-52(s0)
    800090c0:	67c1                	lui	a5,0x10
    800090c2:	0785                	addi	a5,a5,1
    800090c4:	97ba                	add	a5,a5,a4
    800090c6:	07b2                	slli	a5,a5,0xc
    800090c8:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    800090cc:	873e                	mv	a4,a5
    800090ce:	47a1                	li	a5,8
    800090d0:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    800090d2:	0002c717          	auipc	a4,0x2c
    800090d6:	bb670713          	addi	a4,a4,-1098 # 80034c88 <disk>
    800090da:	fcc42683          	lw	a3,-52(s0)
    800090de:	15000793          	li	a5,336
    800090e2:	02f687b3          	mul	a5,a3,a5
    800090e6:	97ba                	add	a5,a5,a4
    800090e8:	679c                	ld	a5,8(a5)
    800090ea:	86be                	mv	a3,a5
    800090ec:	fcc42703          	lw	a4,-52(s0)
    800090f0:	67c1                	lui	a5,0x10
    800090f2:	0785                	addi	a5,a5,1
    800090f4:	97ba                	add	a5,a5,a4
    800090f6:	07b2                	slli	a5,a5,0xc
    800090f8:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    800090fc:	873e                	mv	a4,a5
    800090fe:	0006879b          	sext.w	a5,a3
    80009102:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    80009104:	0002c717          	auipc	a4,0x2c
    80009108:	b8470713          	addi	a4,a4,-1148 # 80034c88 <disk>
    8000910c:	fcc42683          	lw	a3,-52(s0)
    80009110:	15000793          	li	a5,336
    80009114:	02f687b3          	mul	a5,a3,a5
    80009118:	97ba                	add	a5,a5,a4
    8000911a:	679c                	ld	a5,8(a5)
    8000911c:	0207d693          	srli	a3,a5,0x20
    80009120:	fcc42703          	lw	a4,-52(s0)
    80009124:	67c1                	lui	a5,0x10
    80009126:	0785                	addi	a5,a5,1
    80009128:	97ba                	add	a5,a5,a4
    8000912a:	07b2                	slli	a5,a5,0xc
    8000912c:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    80009130:	873e                	mv	a4,a5
    80009132:	0006879b          	sext.w	a5,a3
    80009136:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009138:	0002c717          	auipc	a4,0x2c
    8000913c:	b5070713          	addi	a4,a4,-1200 # 80034c88 <disk>
    80009140:	fcc42683          	lw	a3,-52(s0)
    80009144:	15000793          	li	a5,336
    80009148:	02f687b3          	mul	a5,a3,a5
    8000914c:	97ba                	add	a5,a5,a4
    8000914e:	6b9c                	ld	a5,16(a5)
    80009150:	86be                	mv	a3,a5
    80009152:	fcc42703          	lw	a4,-52(s0)
    80009156:	67c1                	lui	a5,0x10
    80009158:	0785                	addi	a5,a5,1
    8000915a:	97ba                	add	a5,a5,a4
    8000915c:	07b2                	slli	a5,a5,0xc
    8000915e:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    80009162:	873e                	mv	a4,a5
    80009164:	0006879b          	sext.w	a5,a3
    80009168:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    8000916a:	0002c717          	auipc	a4,0x2c
    8000916e:	b1e70713          	addi	a4,a4,-1250 # 80034c88 <disk>
    80009172:	fcc42683          	lw	a3,-52(s0)
    80009176:	15000793          	li	a5,336
    8000917a:	02f687b3          	mul	a5,a3,a5
    8000917e:	97ba                	add	a5,a5,a4
    80009180:	6b9c                	ld	a5,16(a5)
    80009182:	0207d693          	srli	a3,a5,0x20
    80009186:	fcc42703          	lw	a4,-52(s0)
    8000918a:	67c1                	lui	a5,0x10
    8000918c:	0785                	addi	a5,a5,1
    8000918e:	97ba                	add	a5,a5,a4
    80009190:	07b2                	slli	a5,a5,0xc
    80009192:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    80009196:	873e                	mv	a4,a5
    80009198:	0006879b          	sext.w	a5,a3
    8000919c:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    8000919e:	0002c717          	auipc	a4,0x2c
    800091a2:	aea70713          	addi	a4,a4,-1302 # 80034c88 <disk>
    800091a6:	fcc42683          	lw	a3,-52(s0)
    800091aa:	15000793          	li	a5,336
    800091ae:	02f687b3          	mul	a5,a3,a5
    800091b2:	97ba                	add	a5,a5,a4
    800091b4:	6f9c                	ld	a5,24(a5)
    800091b6:	86be                	mv	a3,a5
    800091b8:	fcc42703          	lw	a4,-52(s0)
    800091bc:	67c1                	lui	a5,0x10
    800091be:	0785                	addi	a5,a5,1
    800091c0:	97ba                	add	a5,a5,a4
    800091c2:	07b2                	slli	a5,a5,0xc
    800091c4:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    800091c8:	873e                	mv	a4,a5
    800091ca:	0006879b          	sext.w	a5,a3
    800091ce:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    800091d0:	0002c717          	auipc	a4,0x2c
    800091d4:	ab870713          	addi	a4,a4,-1352 # 80034c88 <disk>
    800091d8:	fcc42683          	lw	a3,-52(s0)
    800091dc:	15000793          	li	a5,336
    800091e0:	02f687b3          	mul	a5,a3,a5
    800091e4:	97ba                	add	a5,a5,a4
    800091e6:	6f9c                	ld	a5,24(a5)
    800091e8:	0207d693          	srli	a3,a5,0x20
    800091ec:	fcc42703          	lw	a4,-52(s0)
    800091f0:	67c1                	lui	a5,0x10
    800091f2:	0785                	addi	a5,a5,1
    800091f4:	97ba                	add	a5,a5,a4
    800091f6:	07b2                	slli	a5,a5,0xc
    800091f8:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    800091fc:	873e                	mv	a4,a5
    800091fe:	0006879b          	sext.w	a5,a3
    80009202:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    80009204:	fcc42703          	lw	a4,-52(s0)
    80009208:	67c1                	lui	a5,0x10
    8000920a:	0785                	addi	a5,a5,1
    8000920c:	97ba                	add	a5,a5,a4
    8000920e:	07b2                	slli	a5,a5,0xc
    80009210:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80009214:	873e                	mv	a4,a5
    80009216:	4785                	li	a5,1
    80009218:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000921a:	fe042623          	sw	zero,-20(s0)
    8000921e:	a03d                	j	8000924c <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    80009220:	0002c697          	auipc	a3,0x2c
    80009224:	a6868693          	addi	a3,a3,-1432 # 80034c88 <disk>
    80009228:	fec42703          	lw	a4,-20(s0)
    8000922c:	fcc42603          	lw	a2,-52(s0)
    80009230:	15000793          	li	a5,336
    80009234:	02f607b3          	mul	a5,a2,a5
    80009238:	97b6                	add	a5,a5,a3
    8000923a:	97ba                	add	a5,a5,a4
    8000923c:	4705                	li	a4,1
    8000923e:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    80009242:	fec42783          	lw	a5,-20(s0)
    80009246:	2785                	addiw	a5,a5,1
    80009248:	fef42623          	sw	a5,-20(s0)
    8000924c:	fec42783          	lw	a5,-20(s0)
    80009250:	0007871b          	sext.w	a4,a5
    80009254:	479d                	li	a5,7
    80009256:	fce7d5e3          	bge	a5,a4,80009220 <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000925a:	fe842783          	lw	a5,-24(s0)
    8000925e:	0047e793          	ori	a5,a5,4
    80009262:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009266:	fcc42703          	lw	a4,-52(s0)
    8000926a:	67c1                	lui	a5,0x10
    8000926c:	0785                	addi	a5,a5,1
    8000926e:	97ba                	add	a5,a5,a4
    80009270:	07b2                	slli	a5,a5,0xc
    80009272:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009276:	873e                	mv	a4,a5
    80009278:	fe842783          	lw	a5,-24(s0)
    8000927c:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    8000927e:	fcc42783          	lw	a5,-52(s0)
    80009282:	0007871b          	sext.w	a4,a5
    80009286:	4785                	li	a5,1
    80009288:	06f71663          	bne	a4,a5,800092f4 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    8000928c:	ffff8097          	auipc	ra,0xffff8
    80009290:	f4a080e7          	jalr	-182(ra) # 800011d6 <kalloc>
    80009294:	872a                	mv	a4,a0
    80009296:	0002c797          	auipc	a5,0x2c
    8000929a:	c9278793          	addi	a5,a5,-878 # 80034f28 <swap_buffer>
    8000929e:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    800092a0:	0002c797          	auipc	a5,0x2c
    800092a4:	c8878793          	addi	a5,a5,-888 # 80034f28 <swap_buffer>
    800092a8:	639c                	ld	a5,0(a5)
    800092aa:	eb89                	bnez	a5,800092bc <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    800092ac:	00002517          	auipc	a0,0x2
    800092b0:	48c50513          	addi	a0,a0,1164 # 8000b738 <etext+0x738>
    800092b4:	ffff8097          	auipc	ra,0xffff8
    800092b8:	9d8080e7          	jalr	-1576(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    800092bc:	0002c797          	auipc	a5,0x2c
    800092c0:	c6c78793          	addi	a5,a5,-916 # 80034f28 <swap_buffer>
    800092c4:	639c                	ld	a5,0(a5)
    800092c6:	40000613          	li	a2,1024
    800092ca:	4581                	li	a1,0
    800092cc:	853e                	mv	a0,a5
    800092ce:	ffff8097          	auipc	ra,0xffff8
    800092d2:	230080e7          	jalr	560(ra) # 800014fe <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    800092d6:	0002c797          	auipc	a5,0x2c
    800092da:	c5278793          	addi	a5,a5,-942 # 80034f28 <swap_buffer>
    800092de:	639c                	ld	a5,0(a5)
    800092e0:	07c1                	addi	a5,a5,16
    800092e2:	00002597          	auipc	a1,0x2
    800092e6:	48658593          	addi	a1,a1,1158 # 8000b768 <etext+0x768>
    800092ea:	853e                	mv	a0,a5
    800092ec:	ffffd097          	auipc	ra,0xffffd
    800092f0:	4b0080e7          	jalr	1200(ra) # 8000679c <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    800092f4:	0001                	nop
    800092f6:	70e2                	ld	ra,56(sp)
    800092f8:	7442                	ld	s0,48(sp)
    800092fa:	6121                	addi	sp,sp,64
    800092fc:	8082                	ret

00000000800092fe <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    800092fe:	7179                	addi	sp,sp,-48
    80009300:	f422                	sd	s0,40(sp)
    80009302:	1800                	addi	s0,sp,48
    80009304:	87aa                	mv	a5,a0
    80009306:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    8000930a:	fe042623          	sw	zero,-20(s0)
    8000930e:	a891                	j	80009362 <alloc_desc+0x64>
    if(disk[id].free[i]){
    80009310:	0002c697          	auipc	a3,0x2c
    80009314:	97868693          	addi	a3,a3,-1672 # 80034c88 <disk>
    80009318:	fec42703          	lw	a4,-20(s0)
    8000931c:	fdc42603          	lw	a2,-36(s0)
    80009320:	15000793          	li	a5,336
    80009324:	02f607b3          	mul	a5,a2,a5
    80009328:	97b6                	add	a5,a5,a3
    8000932a:	97ba                	add	a5,a5,a4
    8000932c:	0207c783          	lbu	a5,32(a5)
    80009330:	c785                	beqz	a5,80009358 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009332:	0002c697          	auipc	a3,0x2c
    80009336:	95668693          	addi	a3,a3,-1706 # 80034c88 <disk>
    8000933a:	fec42703          	lw	a4,-20(s0)
    8000933e:	fdc42603          	lw	a2,-36(s0)
    80009342:	15000793          	li	a5,336
    80009346:	02f607b3          	mul	a5,a2,a5
    8000934a:	97b6                	add	a5,a5,a3
    8000934c:	97ba                	add	a5,a5,a4
    8000934e:	02078023          	sb	zero,32(a5)
      return i;
    80009352:	fec42783          	lw	a5,-20(s0)
    80009356:	a831                	j	80009372 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    80009358:	fec42783          	lw	a5,-20(s0)
    8000935c:	2785                	addiw	a5,a5,1
    8000935e:	fef42623          	sw	a5,-20(s0)
    80009362:	fec42783          	lw	a5,-20(s0)
    80009366:	0007871b          	sext.w	a4,a5
    8000936a:	479d                	li	a5,7
    8000936c:	fae7d2e3          	bge	a5,a4,80009310 <alloc_desc+0x12>
    }
  }
  return -1;
    80009370:	57fd                	li	a5,-1
}
    80009372:	853e                	mv	a0,a5
    80009374:	7422                	ld	s0,40(sp)
    80009376:	6145                	addi	sp,sp,48
    80009378:	8082                	ret

000000008000937a <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    8000937a:	1101                	addi	sp,sp,-32
    8000937c:	ec06                	sd	ra,24(sp)
    8000937e:	e822                	sd	s0,16(sp)
    80009380:	1000                	addi	s0,sp,32
    80009382:	87aa                	mv	a5,a0
    80009384:	872e                	mv	a4,a1
    80009386:	fef42623          	sw	a5,-20(s0)
    8000938a:	87ba                	mv	a5,a4
    8000938c:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    80009390:	fe842783          	lw	a5,-24(s0)
    80009394:	0007871b          	sext.w	a4,a5
    80009398:	479d                	li	a5,7
    8000939a:	02e7d863          	bge	a5,a4,800093ca <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    8000939e:	0002c717          	auipc	a4,0x2c
    800093a2:	8ea70713          	addi	a4,a4,-1814 # 80034c88 <disk>
    800093a6:	fec42683          	lw	a3,-20(s0)
    800093aa:	15000793          	li	a5,336
    800093ae:	02f687b3          	mul	a5,a3,a5
    800093b2:	97ba                	add	a5,a5,a4
    800093b4:	639c                	ld	a5,0(a5)
    800093b6:	00002617          	auipc	a2,0x2
    800093ba:	3c260613          	addi	a2,a2,962 # 8000b778 <etext+0x778>
    800093be:	85be                	mv	a1,a5
    800093c0:	4509                	li	a0,2
    800093c2:	ffff8097          	auipc	ra,0xffff8
    800093c6:	91c080e7          	jalr	-1764(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    800093ca:	0002c697          	auipc	a3,0x2c
    800093ce:	8be68693          	addi	a3,a3,-1858 # 80034c88 <disk>
    800093d2:	fe842703          	lw	a4,-24(s0)
    800093d6:	fec42603          	lw	a2,-20(s0)
    800093da:	15000793          	li	a5,336
    800093de:	02f607b3          	mul	a5,a2,a5
    800093e2:	97b6                	add	a5,a5,a3
    800093e4:	97ba                	add	a5,a5,a4
    800093e6:	0207c783          	lbu	a5,32(a5)
    800093ea:	c79d                	beqz	a5,80009418 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    800093ec:	0002c717          	auipc	a4,0x2c
    800093f0:	89c70713          	addi	a4,a4,-1892 # 80034c88 <disk>
    800093f4:	fec42683          	lw	a3,-20(s0)
    800093f8:	15000793          	li	a5,336
    800093fc:	02f687b3          	mul	a5,a3,a5
    80009400:	97ba                	add	a5,a5,a4
    80009402:	639c                	ld	a5,0(a5)
    80009404:	00002617          	auipc	a2,0x2
    80009408:	38460613          	addi	a2,a2,900 # 8000b788 <etext+0x788>
    8000940c:	85be                	mv	a1,a5
    8000940e:	4509                	li	a0,2
    80009410:	ffff8097          	auipc	ra,0xffff8
    80009414:	8ce080e7          	jalr	-1842(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    80009418:	0002c717          	auipc	a4,0x2c
    8000941c:	87070713          	addi	a4,a4,-1936 # 80034c88 <disk>
    80009420:	fec42683          	lw	a3,-20(s0)
    80009424:	15000793          	li	a5,336
    80009428:	02f687b3          	mul	a5,a3,a5
    8000942c:	97ba                	add	a5,a5,a4
    8000942e:	6798                	ld	a4,8(a5)
    80009430:	fe842783          	lw	a5,-24(s0)
    80009434:	0792                	slli	a5,a5,0x4
    80009436:	97ba                	add	a5,a5,a4
    80009438:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000943c:	0002c717          	auipc	a4,0x2c
    80009440:	84c70713          	addi	a4,a4,-1972 # 80034c88 <disk>
    80009444:	fec42683          	lw	a3,-20(s0)
    80009448:	15000793          	li	a5,336
    8000944c:	02f687b3          	mul	a5,a3,a5
    80009450:	97ba                	add	a5,a5,a4
    80009452:	6798                	ld	a4,8(a5)
    80009454:	fe842783          	lw	a5,-24(s0)
    80009458:	0792                	slli	a5,a5,0x4
    8000945a:	97ba                	add	a5,a5,a4
    8000945c:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    80009460:	0002c717          	auipc	a4,0x2c
    80009464:	82870713          	addi	a4,a4,-2008 # 80034c88 <disk>
    80009468:	fec42683          	lw	a3,-20(s0)
    8000946c:	15000793          	li	a5,336
    80009470:	02f687b3          	mul	a5,a3,a5
    80009474:	97ba                	add	a5,a5,a4
    80009476:	6798                	ld	a4,8(a5)
    80009478:	fe842783          	lw	a5,-24(s0)
    8000947c:	0792                	slli	a5,a5,0x4
    8000947e:	97ba                	add	a5,a5,a4
    80009480:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    80009484:	0002c717          	auipc	a4,0x2c
    80009488:	80470713          	addi	a4,a4,-2044 # 80034c88 <disk>
    8000948c:	fec42683          	lw	a3,-20(s0)
    80009490:	15000793          	li	a5,336
    80009494:	02f687b3          	mul	a5,a3,a5
    80009498:	97ba                	add	a5,a5,a4
    8000949a:	6798                	ld	a4,8(a5)
    8000949c:	fe842783          	lw	a5,-24(s0)
    800094a0:	0792                	slli	a5,a5,0x4
    800094a2:	97ba                	add	a5,a5,a4
    800094a4:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    800094a8:	0002b697          	auipc	a3,0x2b
    800094ac:	7e068693          	addi	a3,a3,2016 # 80034c88 <disk>
    800094b0:	fe842703          	lw	a4,-24(s0)
    800094b4:	fec42603          	lw	a2,-20(s0)
    800094b8:	15000793          	li	a5,336
    800094bc:	02f607b3          	mul	a5,a2,a5
    800094c0:	97b6                	add	a5,a5,a3
    800094c2:	97ba                	add	a5,a5,a4
    800094c4:	4705                	li	a4,1
    800094c6:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    800094ca:	0002b717          	auipc	a4,0x2b
    800094ce:	7be70713          	addi	a4,a4,1982 # 80034c88 <disk>
    800094d2:	fec42683          	lw	a3,-20(s0)
    800094d6:	15000793          	li	a5,336
    800094da:	02f687b3          	mul	a5,a3,a5
    800094de:	97ba                	add	a5,a5,a4
    800094e0:	1487a783          	lw	a5,328(a5)
    800094e4:	e39d                	bnez	a5,8000950a <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    800094e6:	fec42703          	lw	a4,-20(s0)
    800094ea:	15000793          	li	a5,336
    800094ee:	02f707b3          	mul	a5,a4,a5
    800094f2:	02078713          	addi	a4,a5,32
    800094f6:	0002b797          	auipc	a5,0x2b
    800094fa:	79278793          	addi	a5,a5,1938 # 80034c88 <disk>
    800094fe:	97ba                	add	a5,a5,a4
    80009500:	853e                	mv	a0,a5
    80009502:	ffffa097          	auipc	ra,0xffffa
    80009506:	1d6080e7          	jalr	470(ra) # 800036d8 <wakeup>
  }
}
    8000950a:	0001                	nop
    8000950c:	60e2                	ld	ra,24(sp)
    8000950e:	6442                	ld	s0,16(sp)
    80009510:	6105                	addi	sp,sp,32
    80009512:	8082                	ret

0000000080009514 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009514:	7179                	addi	sp,sp,-48
    80009516:	f406                	sd	ra,40(sp)
    80009518:	f022                	sd	s0,32(sp)
    8000951a:	1800                	addi	s0,sp,48
    8000951c:	87aa                	mv	a5,a0
    8000951e:	872e                	mv	a4,a1
    80009520:	fcf42e23          	sw	a5,-36(s0)
    80009524:	87ba                	mv	a5,a4
    80009526:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    8000952a:	0002b717          	auipc	a4,0x2b
    8000952e:	75e70713          	addi	a4,a4,1886 # 80034c88 <disk>
    80009532:	fdc42683          	lw	a3,-36(s0)
    80009536:	15000793          	li	a5,336
    8000953a:	02f687b3          	mul	a5,a3,a5
    8000953e:	97ba                	add	a5,a5,a4
    80009540:	6798                	ld	a4,8(a5)
    80009542:	fd842783          	lw	a5,-40(s0)
    80009546:	0792                	slli	a5,a5,0x4
    80009548:	97ba                	add	a5,a5,a4
    8000954a:	00c7d783          	lhu	a5,12(a5)
    8000954e:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009552:	0002b717          	auipc	a4,0x2b
    80009556:	73670713          	addi	a4,a4,1846 # 80034c88 <disk>
    8000955a:	fdc42683          	lw	a3,-36(s0)
    8000955e:	15000793          	li	a5,336
    80009562:	02f687b3          	mul	a5,a3,a5
    80009566:	97ba                	add	a5,a5,a4
    80009568:	6798                	ld	a4,8(a5)
    8000956a:	fd842783          	lw	a5,-40(s0)
    8000956e:	0792                	slli	a5,a5,0x4
    80009570:	97ba                	add	a5,a5,a4
    80009572:	00e7d783          	lhu	a5,14(a5)
    80009576:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    8000957a:	fd842703          	lw	a4,-40(s0)
    8000957e:	fdc42783          	lw	a5,-36(s0)
    80009582:	85ba                	mv	a1,a4
    80009584:	853e                	mv	a0,a5
    80009586:	00000097          	auipc	ra,0x0
    8000958a:	df4080e7          	jalr	-524(ra) # 8000937a <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    8000958e:	fec42783          	lw	a5,-20(s0)
    80009592:	8b85                	andi	a5,a5,1
    80009594:	2781                	sext.w	a5,a5
    80009596:	c791                	beqz	a5,800095a2 <free_chain+0x8e>
      i = nxt;
    80009598:	fe842783          	lw	a5,-24(s0)
    8000959c:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    800095a0:	b769                	j	8000952a <free_chain+0x16>
    else
      break;
    800095a2:	0001                	nop
  }
}
    800095a4:	0001                	nop
    800095a6:	70a2                	ld	ra,40(sp)
    800095a8:	7402                	ld	s0,32(sp)
    800095aa:	6145                	addi	sp,sp,48
    800095ac:	8082                	ret

00000000800095ae <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    800095ae:	7139                	addi	sp,sp,-64
    800095b0:	fc06                	sd	ra,56(sp)
    800095b2:	f822                	sd	s0,48(sp)
    800095b4:	f426                	sd	s1,40(sp)
    800095b6:	0080                	addi	s0,sp,64
    800095b8:	87aa                	mv	a5,a0
    800095ba:	fcb43023          	sd	a1,-64(s0)
    800095be:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    800095c2:	fc042e23          	sw	zero,-36(s0)
    800095c6:	a041                	j	80009646 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    800095c8:	fdc42783          	lw	a5,-36(s0)
    800095cc:	078a                	slli	a5,a5,0x2
    800095ce:	fc043703          	ld	a4,-64(s0)
    800095d2:	00f704b3          	add	s1,a4,a5
    800095d6:	fcc42783          	lw	a5,-52(s0)
    800095da:	853e                	mv	a0,a5
    800095dc:	00000097          	auipc	ra,0x0
    800095e0:	d22080e7          	jalr	-734(ra) # 800092fe <alloc_desc>
    800095e4:	87aa                	mv	a5,a0
    800095e6:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    800095e8:	fdc42783          	lw	a5,-36(s0)
    800095ec:	078a                	slli	a5,a5,0x2
    800095ee:	fc043703          	ld	a4,-64(s0)
    800095f2:	97ba                	add	a5,a5,a4
    800095f4:	439c                	lw	a5,0(a5)
    800095f6:	0407d363          	bgez	a5,8000963c <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    800095fa:	fc042c23          	sw	zero,-40(s0)
    800095fe:	a02d                	j	80009628 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    80009600:	fd842783          	lw	a5,-40(s0)
    80009604:	078a                	slli	a5,a5,0x2
    80009606:	fc043703          	ld	a4,-64(s0)
    8000960a:	97ba                	add	a5,a5,a4
    8000960c:	4398                	lw	a4,0(a5)
    8000960e:	fcc42783          	lw	a5,-52(s0)
    80009612:	85ba                	mv	a1,a4
    80009614:	853e                	mv	a0,a5
    80009616:	00000097          	auipc	ra,0x0
    8000961a:	d64080e7          	jalr	-668(ra) # 8000937a <free_desc>
      for(int j = 0; j < i; j++)
    8000961e:	fd842783          	lw	a5,-40(s0)
    80009622:	2785                	addiw	a5,a5,1
    80009624:	fcf42c23          	sw	a5,-40(s0)
    80009628:	fd842703          	lw	a4,-40(s0)
    8000962c:	fdc42783          	lw	a5,-36(s0)
    80009630:	2701                	sext.w	a4,a4
    80009632:	2781                	sext.w	a5,a5
    80009634:	fcf746e3          	blt	a4,a5,80009600 <alloc3_desc+0x52>
      return -1;
    80009638:	57fd                	li	a5,-1
    8000963a:	a831                	j	80009656 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    8000963c:	fdc42783          	lw	a5,-36(s0)
    80009640:	2785                	addiw	a5,a5,1
    80009642:	fcf42e23          	sw	a5,-36(s0)
    80009646:	fdc42783          	lw	a5,-36(s0)
    8000964a:	0007871b          	sext.w	a4,a5
    8000964e:	4789                	li	a5,2
    80009650:	f6e7dce3          	bge	a5,a4,800095c8 <alloc3_desc+0x1a>
    }
  }
  return 0;
    80009654:	4781                	li	a5,0
}
    80009656:	853e                	mv	a0,a5
    80009658:	70e2                	ld	ra,56(sp)
    8000965a:	7442                	ld	s0,48(sp)
    8000965c:	74a2                	ld	s1,40(sp)
    8000965e:	6121                	addi	sp,sp,64
    80009660:	8082                	ret

0000000080009662 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    80009662:	715d                	addi	sp,sp,-80
    80009664:	e486                	sd	ra,72(sp)
    80009666:	e0a2                	sd	s0,64(sp)
    80009668:	0880                	addi	s0,sp,80
    8000966a:	87aa                	mv	a5,a0
    8000966c:	fcb43023          	sd	a1,-64(s0)
    80009670:	8736                	mv	a4,a3
    80009672:	fcf42623          	sw	a5,-52(s0)
    80009676:	87b2                	mv	a5,a2
    80009678:	fcf42423          	sw	a5,-56(s0)
    8000967c:	87ba                	mv	a5,a4
    8000967e:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80009682:	fc043783          	ld	a5,-64(s0)
    80009686:	47dc                	lw	a5,12(a5)
    80009688:	0017979b          	slliw	a5,a5,0x1
    8000968c:	2781                	sext.w	a5,a5
    8000968e:	1782                	slli	a5,a5,0x20
    80009690:	9381                	srli	a5,a5,0x20
    80009692:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    80009696:	fcc42703          	lw	a4,-52(s0)
    8000969a:	15000793          	li	a5,336
    8000969e:	02f707b3          	mul	a5,a4,a5
    800096a2:	13078713          	addi	a4,a5,304
    800096a6:	0002b797          	auipc	a5,0x2b
    800096aa:	5e278793          	addi	a5,a5,1506 # 80034c88 <disk>
    800096ae:	97ba                	add	a5,a5,a4
    800096b0:	853e                	mv	a0,a5
    800096b2:	ffff8097          	auipc	ra,0xffff8
    800096b6:	c78080e7          	jalr	-904(ra) # 8000132a <acquire>
  disk[id].bw_transfer = busy_wait;
    800096ba:	0002b717          	auipc	a4,0x2b
    800096be:	5ce70713          	addi	a4,a4,1486 # 80034c88 <disk>
    800096c2:	fcc42683          	lw	a3,-52(s0)
    800096c6:	15000793          	li	a5,336
    800096ca:	02f687b3          	mul	a5,a3,a5
    800096ce:	97ba                	add	a5,a5,a4
    800096d0:	fbc42703          	lw	a4,-68(s0)
    800096d4:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    800096d8:	fd040713          	addi	a4,s0,-48
    800096dc:	fcc42783          	lw	a5,-52(s0)
    800096e0:	85ba                	mv	a1,a4
    800096e2:	853e                	mv	a0,a5
    800096e4:	00000097          	auipc	ra,0x0
    800096e8:	eca080e7          	jalr	-310(ra) # 800095ae <alloc3_desc>
    800096ec:	87aa                	mv	a5,a0
    800096ee:	c3e9                	beqz	a5,800097b0 <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    800096f0:	fbc42783          	lw	a5,-68(s0)
    800096f4:	2781                	sext.w	a5,a5
    800096f6:	e3b9                	bnez	a5,8000973c <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    800096f8:	fcc42703          	lw	a4,-52(s0)
    800096fc:	15000793          	li	a5,336
    80009700:	02f707b3          	mul	a5,a4,a5
    80009704:	02078713          	addi	a4,a5,32
    80009708:	0002b797          	auipc	a5,0x2b
    8000970c:	58078793          	addi	a5,a5,1408 # 80034c88 <disk>
    80009710:	00f706b3          	add	a3,a4,a5
    80009714:	fcc42703          	lw	a4,-52(s0)
    80009718:	15000793          	li	a5,336
    8000971c:	02f707b3          	mul	a5,a4,a5
    80009720:	13078713          	addi	a4,a5,304
    80009724:	0002b797          	auipc	a5,0x2b
    80009728:	56478793          	addi	a5,a5,1380 # 80034c88 <disk>
    8000972c:	97ba                	add	a5,a5,a4
    8000972e:	85be                	mv	a1,a5
    80009730:	8536                	mv	a0,a3
    80009732:	ffffa097          	auipc	ra,0xffffa
    80009736:	f2a080e7          	jalr	-214(ra) # 8000365c <sleep>
    8000973a:	bf79                	j	800096d8 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    8000973c:	fcc42703          	lw	a4,-52(s0)
    80009740:	15000793          	li	a5,336
    80009744:	02f707b3          	mul	a5,a4,a5
    80009748:	13078713          	addi	a4,a5,304
    8000974c:	0002b797          	auipc	a5,0x2b
    80009750:	53c78793          	addi	a5,a5,1340 # 80034c88 <disk>
    80009754:	97ba                	add	a5,a5,a4
    80009756:	853e                	mv	a0,a5
    80009758:	ffff8097          	auipc	ra,0xffff8
    8000975c:	c36080e7          	jalr	-970(ra) # 8000138e <release>
        intr_on();
    80009760:	fffff097          	auipc	ra,0xfffff
    80009764:	500080e7          	jalr	1280(ra) # 80008c60 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    80009768:	0001                	nop
    8000976a:	fd040713          	addi	a4,s0,-48
    8000976e:	fcc42783          	lw	a5,-52(s0)
    80009772:	85ba                	mv	a1,a4
    80009774:	853e                	mv	a0,a5
    80009776:	00000097          	auipc	ra,0x0
    8000977a:	e38080e7          	jalr	-456(ra) # 800095ae <alloc3_desc>
    8000977e:	87aa                	mv	a5,a0
    80009780:	f7ed                	bnez	a5,8000976a <virtio_disk_rw+0x108>
        intr_off();
    80009782:	fffff097          	auipc	ra,0xfffff
    80009786:	508080e7          	jalr	1288(ra) # 80008c8a <intr_off>
        acquire(&disk[id].vdisk_lock);
    8000978a:	fcc42703          	lw	a4,-52(s0)
    8000978e:	15000793          	li	a5,336
    80009792:	02f707b3          	mul	a5,a4,a5
    80009796:	13078713          	addi	a4,a5,304
    8000979a:	0002b797          	auipc	a5,0x2b
    8000979e:	4ee78793          	addi	a5,a5,1262 # 80034c88 <disk>
    800097a2:	97ba                	add	a5,a5,a4
    800097a4:	853e                	mv	a0,a5
    800097a6:	ffff8097          	auipc	ra,0xffff8
    800097aa:	b84080e7          	jalr	-1148(ra) # 8000132a <acquire>
    if(alloc3_desc(id, idx) == 0) {
    800097ae:	b72d                	j	800096d8 <virtio_disk_rw+0x76>
      break;
    800097b0:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    800097b2:	fd042683          	lw	a3,-48(s0)
    800097b6:	fcc42703          	lw	a4,-52(s0)
    800097ba:	87ba                	mv	a5,a4
    800097bc:	078a                	slli	a5,a5,0x2
    800097be:	97ba                	add	a5,a5,a4
    800097c0:	078a                	slli	a5,a5,0x2
    800097c2:	97ba                	add	a5,a5,a4
    800097c4:	97b6                	add	a5,a5,a3
    800097c6:	07ad                	addi	a5,a5,11
    800097c8:	00479713          	slli	a4,a5,0x4
    800097cc:	0002b797          	auipc	a5,0x2b
    800097d0:	4bc78793          	addi	a5,a5,1212 # 80034c88 <disk>
    800097d4:	97ba                	add	a5,a5,a4
    800097d6:	fef43023          	sd	a5,-32(s0)

  if(write)
    800097da:	fc842783          	lw	a5,-56(s0)
    800097de:	2781                	sext.w	a5,a5
    800097e0:	c791                	beqz	a5,800097ec <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    800097e2:	fe043783          	ld	a5,-32(s0)
    800097e6:	4705                	li	a4,1
    800097e8:	c398                	sw	a4,0(a5)
    800097ea:	a029                	j	800097f4 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    800097ec:	fe043783          	ld	a5,-32(s0)
    800097f0:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    800097f4:	fe043783          	ld	a5,-32(s0)
    800097f8:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    800097fc:	fe043783          	ld	a5,-32(s0)
    80009800:	fe843703          	ld	a4,-24(s0)
    80009804:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    80009806:	0002b717          	auipc	a4,0x2b
    8000980a:	48270713          	addi	a4,a4,1154 # 80034c88 <disk>
    8000980e:	fcc42683          	lw	a3,-52(s0)
    80009812:	15000793          	li	a5,336
    80009816:	02f687b3          	mul	a5,a3,a5
    8000981a:	97ba                	add	a5,a5,a4
    8000981c:	6798                	ld	a4,8(a5)
    8000981e:	fd042783          	lw	a5,-48(s0)
    80009822:	0792                	slli	a5,a5,0x4
    80009824:	97ba                	add	a5,a5,a4
    80009826:	fe043703          	ld	a4,-32(s0)
    8000982a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    8000982c:	0002b717          	auipc	a4,0x2b
    80009830:	45c70713          	addi	a4,a4,1116 # 80034c88 <disk>
    80009834:	fcc42683          	lw	a3,-52(s0)
    80009838:	15000793          	li	a5,336
    8000983c:	02f687b3          	mul	a5,a3,a5
    80009840:	97ba                	add	a5,a5,a4
    80009842:	6798                	ld	a4,8(a5)
    80009844:	fd042783          	lw	a5,-48(s0)
    80009848:	0792                	slli	a5,a5,0x4
    8000984a:	97ba                	add	a5,a5,a4
    8000984c:	4741                	li	a4,16
    8000984e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009850:	0002b717          	auipc	a4,0x2b
    80009854:	43870713          	addi	a4,a4,1080 # 80034c88 <disk>
    80009858:	fcc42683          	lw	a3,-52(s0)
    8000985c:	15000793          	li	a5,336
    80009860:	02f687b3          	mul	a5,a3,a5
    80009864:	97ba                	add	a5,a5,a4
    80009866:	6798                	ld	a4,8(a5)
    80009868:	fd042783          	lw	a5,-48(s0)
    8000986c:	0792                	slli	a5,a5,0x4
    8000986e:	97ba                	add	a5,a5,a4
    80009870:	4705                	li	a4,1
    80009872:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    80009876:	fd442603          	lw	a2,-44(s0)
    8000987a:	0002b717          	auipc	a4,0x2b
    8000987e:	40e70713          	addi	a4,a4,1038 # 80034c88 <disk>
    80009882:	fcc42683          	lw	a3,-52(s0)
    80009886:	15000793          	li	a5,336
    8000988a:	02f687b3          	mul	a5,a3,a5
    8000988e:	97ba                	add	a5,a5,a4
    80009890:	6798                	ld	a4,8(a5)
    80009892:	fd042783          	lw	a5,-48(s0)
    80009896:	0792                	slli	a5,a5,0x4
    80009898:	97ba                	add	a5,a5,a4
    8000989a:	03061713          	slli	a4,a2,0x30
    8000989e:	9341                	srli	a4,a4,0x30
    800098a0:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    800098a4:	fc043783          	ld	a5,-64(s0)
    800098a8:	05878613          	addi	a2,a5,88
    800098ac:	0002b717          	auipc	a4,0x2b
    800098b0:	3dc70713          	addi	a4,a4,988 # 80034c88 <disk>
    800098b4:	fcc42683          	lw	a3,-52(s0)
    800098b8:	15000793          	li	a5,336
    800098bc:	02f687b3          	mul	a5,a3,a5
    800098c0:	97ba                	add	a5,a5,a4
    800098c2:	6798                	ld	a4,8(a5)
    800098c4:	fd442783          	lw	a5,-44(s0)
    800098c8:	0792                	slli	a5,a5,0x4
    800098ca:	97ba                	add	a5,a5,a4
    800098cc:	8732                	mv	a4,a2
    800098ce:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    800098d0:	0002b717          	auipc	a4,0x2b
    800098d4:	3b870713          	addi	a4,a4,952 # 80034c88 <disk>
    800098d8:	fcc42683          	lw	a3,-52(s0)
    800098dc:	15000793          	li	a5,336
    800098e0:	02f687b3          	mul	a5,a3,a5
    800098e4:	97ba                	add	a5,a5,a4
    800098e6:	6798                	ld	a4,8(a5)
    800098e8:	fd442783          	lw	a5,-44(s0)
    800098ec:	0792                	slli	a5,a5,0x4
    800098ee:	97ba                	add	a5,a5,a4
    800098f0:	40000713          	li	a4,1024
    800098f4:	c798                	sw	a4,8(a5)
  if(write)
    800098f6:	fc842783          	lw	a5,-56(s0)
    800098fa:	2781                	sext.w	a5,a5
    800098fc:	c785                	beqz	a5,80009924 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    800098fe:	0002b717          	auipc	a4,0x2b
    80009902:	38a70713          	addi	a4,a4,906 # 80034c88 <disk>
    80009906:	fcc42683          	lw	a3,-52(s0)
    8000990a:	15000793          	li	a5,336
    8000990e:	02f687b3          	mul	a5,a3,a5
    80009912:	97ba                	add	a5,a5,a4
    80009914:	6798                	ld	a4,8(a5)
    80009916:	fd442783          	lw	a5,-44(s0)
    8000991a:	0792                	slli	a5,a5,0x4
    8000991c:	97ba                	add	a5,a5,a4
    8000991e:	00079623          	sh	zero,12(a5)
    80009922:	a025                	j	8000994a <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009924:	0002b717          	auipc	a4,0x2b
    80009928:	36470713          	addi	a4,a4,868 # 80034c88 <disk>
    8000992c:	fcc42683          	lw	a3,-52(s0)
    80009930:	15000793          	li	a5,336
    80009934:	02f687b3          	mul	a5,a3,a5
    80009938:	97ba                	add	a5,a5,a4
    8000993a:	6798                	ld	a4,8(a5)
    8000993c:	fd442783          	lw	a5,-44(s0)
    80009940:	0792                	slli	a5,a5,0x4
    80009942:	97ba                	add	a5,a5,a4
    80009944:	4709                	li	a4,2
    80009946:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    8000994a:	0002b717          	auipc	a4,0x2b
    8000994e:	33e70713          	addi	a4,a4,830 # 80034c88 <disk>
    80009952:	fcc42683          	lw	a3,-52(s0)
    80009956:	15000793          	li	a5,336
    8000995a:	02f687b3          	mul	a5,a3,a5
    8000995e:	97ba                	add	a5,a5,a4
    80009960:	6798                	ld	a4,8(a5)
    80009962:	fd442783          	lw	a5,-44(s0)
    80009966:	0792                	slli	a5,a5,0x4
    80009968:	97ba                	add	a5,a5,a4
    8000996a:	00c7d703          	lhu	a4,12(a5)
    8000996e:	0002b697          	auipc	a3,0x2b
    80009972:	31a68693          	addi	a3,a3,794 # 80034c88 <disk>
    80009976:	fcc42603          	lw	a2,-52(s0)
    8000997a:	15000793          	li	a5,336
    8000997e:	02f607b3          	mul	a5,a2,a5
    80009982:	97b6                	add	a5,a5,a3
    80009984:	6794                	ld	a3,8(a5)
    80009986:	fd442783          	lw	a5,-44(s0)
    8000998a:	0792                	slli	a5,a5,0x4
    8000998c:	97b6                	add	a5,a5,a3
    8000998e:	00176713          	ori	a4,a4,1
    80009992:	1742                	slli	a4,a4,0x30
    80009994:	9341                	srli	a4,a4,0x30
    80009996:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    8000999a:	fd842603          	lw	a2,-40(s0)
    8000999e:	0002b717          	auipc	a4,0x2b
    800099a2:	2ea70713          	addi	a4,a4,746 # 80034c88 <disk>
    800099a6:	fcc42683          	lw	a3,-52(s0)
    800099aa:	15000793          	li	a5,336
    800099ae:	02f687b3          	mul	a5,a3,a5
    800099b2:	97ba                	add	a5,a5,a4
    800099b4:	6798                	ld	a4,8(a5)
    800099b6:	fd442783          	lw	a5,-44(s0)
    800099ba:	0792                	slli	a5,a5,0x4
    800099bc:	97ba                	add	a5,a5,a4
    800099be:	03061713          	slli	a4,a2,0x30
    800099c2:	9341                	srli	a4,a4,0x30
    800099c4:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    800099c8:	fd042603          	lw	a2,-48(s0)
    800099cc:	0002b697          	auipc	a3,0x2b
    800099d0:	2bc68693          	addi	a3,a3,700 # 80034c88 <disk>
    800099d4:	fcc42703          	lw	a4,-52(s0)
    800099d8:	87ba                	mv	a5,a4
    800099da:	078a                	slli	a5,a5,0x2
    800099dc:	97ba                	add	a5,a5,a4
    800099de:	078a                	slli	a5,a5,0x2
    800099e0:	97ba                	add	a5,a5,a4
    800099e2:	97b2                	add	a5,a5,a2
    800099e4:	078d                	addi	a5,a5,3
    800099e6:	0792                	slli	a5,a5,0x4
    800099e8:	97b6                	add	a5,a5,a3
    800099ea:	577d                	li	a4,-1
    800099ec:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    800099f0:	fd042683          	lw	a3,-48(s0)
    800099f4:	fcc42703          	lw	a4,-52(s0)
    800099f8:	87ba                	mv	a5,a4
    800099fa:	078a                	slli	a5,a5,0x2
    800099fc:	97ba                	add	a5,a5,a4
    800099fe:	078a                	slli	a5,a5,0x2
    80009a00:	97ba                	add	a5,a5,a4
    80009a02:	97b6                	add	a5,a5,a3
    80009a04:	078d                	addi	a5,a5,3
    80009a06:	00479713          	slli	a4,a5,0x4
    80009a0a:	0002b797          	auipc	a5,0x2b
    80009a0e:	27e78793          	addi	a5,a5,638 # 80034c88 <disk>
    80009a12:	97ba                	add	a5,a5,a4
    80009a14:	00878613          	addi	a2,a5,8
    80009a18:	0002b717          	auipc	a4,0x2b
    80009a1c:	27070713          	addi	a4,a4,624 # 80034c88 <disk>
    80009a20:	fcc42683          	lw	a3,-52(s0)
    80009a24:	15000793          	li	a5,336
    80009a28:	02f687b3          	mul	a5,a3,a5
    80009a2c:	97ba                	add	a5,a5,a4
    80009a2e:	6798                	ld	a4,8(a5)
    80009a30:	fd842783          	lw	a5,-40(s0)
    80009a34:	0792                	slli	a5,a5,0x4
    80009a36:	97ba                	add	a5,a5,a4
    80009a38:	8732                	mv	a4,a2
    80009a3a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    80009a3c:	0002b717          	auipc	a4,0x2b
    80009a40:	24c70713          	addi	a4,a4,588 # 80034c88 <disk>
    80009a44:	fcc42683          	lw	a3,-52(s0)
    80009a48:	15000793          	li	a5,336
    80009a4c:	02f687b3          	mul	a5,a3,a5
    80009a50:	97ba                	add	a5,a5,a4
    80009a52:	6798                	ld	a4,8(a5)
    80009a54:	fd842783          	lw	a5,-40(s0)
    80009a58:	0792                	slli	a5,a5,0x4
    80009a5a:	97ba                	add	a5,a5,a4
    80009a5c:	4705                	li	a4,1
    80009a5e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009a60:	0002b717          	auipc	a4,0x2b
    80009a64:	22870713          	addi	a4,a4,552 # 80034c88 <disk>
    80009a68:	fcc42683          	lw	a3,-52(s0)
    80009a6c:	15000793          	li	a5,336
    80009a70:	02f687b3          	mul	a5,a3,a5
    80009a74:	97ba                	add	a5,a5,a4
    80009a76:	6798                	ld	a4,8(a5)
    80009a78:	fd842783          	lw	a5,-40(s0)
    80009a7c:	0792                	slli	a5,a5,0x4
    80009a7e:	97ba                	add	a5,a5,a4
    80009a80:	4709                	li	a4,2
    80009a82:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009a86:	0002b717          	auipc	a4,0x2b
    80009a8a:	20270713          	addi	a4,a4,514 # 80034c88 <disk>
    80009a8e:	fcc42683          	lw	a3,-52(s0)
    80009a92:	15000793          	li	a5,336
    80009a96:	02f687b3          	mul	a5,a3,a5
    80009a9a:	97ba                	add	a5,a5,a4
    80009a9c:	6798                	ld	a4,8(a5)
    80009a9e:	fd842783          	lw	a5,-40(s0)
    80009aa2:	0792                	slli	a5,a5,0x4
    80009aa4:	97ba                	add	a5,a5,a4
    80009aa6:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009aaa:	fc043783          	ld	a5,-64(s0)
    80009aae:	4705                	li	a4,1
    80009ab0:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    80009ab2:	fd042603          	lw	a2,-48(s0)
    80009ab6:	0002b697          	auipc	a3,0x2b
    80009aba:	1d268693          	addi	a3,a3,466 # 80034c88 <disk>
    80009abe:	fcc42703          	lw	a4,-52(s0)
    80009ac2:	87ba                	mv	a5,a4
    80009ac4:	078a                	slli	a5,a5,0x2
    80009ac6:	97ba                	add	a5,a5,a4
    80009ac8:	078a                	slli	a5,a5,0x2
    80009aca:	97ba                	add	a5,a5,a4
    80009acc:	97b2                	add	a5,a5,a2
    80009ace:	078d                	addi	a5,a5,3
    80009ad0:	0792                	slli	a5,a5,0x4
    80009ad2:	97b6                	add	a5,a5,a3
    80009ad4:	fc043703          	ld	a4,-64(s0)
    80009ad8:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009ada:	fd042583          	lw	a1,-48(s0)
    80009ade:	0002b717          	auipc	a4,0x2b
    80009ae2:	1aa70713          	addi	a4,a4,426 # 80034c88 <disk>
    80009ae6:	fcc42683          	lw	a3,-52(s0)
    80009aea:	15000793          	li	a5,336
    80009aee:	02f687b3          	mul	a5,a3,a5
    80009af2:	97ba                	add	a5,a5,a4
    80009af4:	6b94                	ld	a3,16(a5)
    80009af6:	0002b717          	auipc	a4,0x2b
    80009afa:	19270713          	addi	a4,a4,402 # 80034c88 <disk>
    80009afe:	fcc42603          	lw	a2,-52(s0)
    80009b02:	15000793          	li	a5,336
    80009b06:	02f607b3          	mul	a5,a2,a5
    80009b0a:	97ba                	add	a5,a5,a4
    80009b0c:	6b9c                	ld	a5,16(a5)
    80009b0e:	0027d783          	lhu	a5,2(a5)
    80009b12:	2781                	sext.w	a5,a5
    80009b14:	8b9d                	andi	a5,a5,7
    80009b16:	2781                	sext.w	a5,a5
    80009b18:	03059713          	slli	a4,a1,0x30
    80009b1c:	9341                	srli	a4,a4,0x30
    80009b1e:	0786                	slli	a5,a5,0x1
    80009b20:	97b6                	add	a5,a5,a3
    80009b22:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009b26:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009b2a:	0002b717          	auipc	a4,0x2b
    80009b2e:	15e70713          	addi	a4,a4,350 # 80034c88 <disk>
    80009b32:	fcc42683          	lw	a3,-52(s0)
    80009b36:	15000793          	li	a5,336
    80009b3a:	02f687b3          	mul	a5,a3,a5
    80009b3e:	97ba                	add	a5,a5,a4
    80009b40:	6b9c                	ld	a5,16(a5)
    80009b42:	0027d703          	lhu	a4,2(a5)
    80009b46:	0002b697          	auipc	a3,0x2b
    80009b4a:	14268693          	addi	a3,a3,322 # 80034c88 <disk>
    80009b4e:	fcc42603          	lw	a2,-52(s0)
    80009b52:	15000793          	li	a5,336
    80009b56:	02f607b3          	mul	a5,a2,a5
    80009b5a:	97b6                	add	a5,a5,a3
    80009b5c:	6b9c                	ld	a5,16(a5)
    80009b5e:	2705                	addiw	a4,a4,1
    80009b60:	1742                	slli	a4,a4,0x30
    80009b62:	9341                	srli	a4,a4,0x30
    80009b64:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009b68:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009b6c:	fcc42703          	lw	a4,-52(s0)
    80009b70:	67c1                	lui	a5,0x10
    80009b72:	0785                	addi	a5,a5,1
    80009b74:	97ba                	add	a5,a5,a4
    80009b76:	07b2                	slli	a5,a5,0xc
    80009b78:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009b7c:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009b80:	a871                	j	80009c1c <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009b82:	fbc42783          	lw	a5,-68(s0)
    80009b86:	2781                	sext.w	a5,a5
    80009b88:	e795                	bnez	a5,80009bb4 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009b8a:	fcc42703          	lw	a4,-52(s0)
    80009b8e:	15000793          	li	a5,336
    80009b92:	02f707b3          	mul	a5,a4,a5
    80009b96:	13078713          	addi	a4,a5,304
    80009b9a:	0002b797          	auipc	a5,0x2b
    80009b9e:	0ee78793          	addi	a5,a5,238 # 80034c88 <disk>
    80009ba2:	97ba                	add	a5,a5,a4
    80009ba4:	85be                	mv	a1,a5
    80009ba6:	fc043503          	ld	a0,-64(s0)
    80009baa:	ffffa097          	auipc	ra,0xffffa
    80009bae:	ab2080e7          	jalr	-1358(ra) # 8000365c <sleep>
    80009bb2:	a0ad                	j	80009c1c <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009bb4:	fcc42703          	lw	a4,-52(s0)
    80009bb8:	15000793          	li	a5,336
    80009bbc:	02f707b3          	mul	a5,a4,a5
    80009bc0:	13078713          	addi	a4,a5,304
    80009bc4:	0002b797          	auipc	a5,0x2b
    80009bc8:	0c478793          	addi	a5,a5,196 # 80034c88 <disk>
    80009bcc:	97ba                	add	a5,a5,a4
    80009bce:	853e                	mv	a0,a5
    80009bd0:	ffff7097          	auipc	ra,0xffff7
    80009bd4:	7be080e7          	jalr	1982(ra) # 8000138e <release>
        intr_on();
    80009bd8:	fffff097          	auipc	ra,0xfffff
    80009bdc:	088080e7          	jalr	136(ra) # 80008c60 <intr_on>
        while(b->disk == 1);
    80009be0:	0001                	nop
    80009be2:	fc043783          	ld	a5,-64(s0)
    80009be6:	43dc                	lw	a5,4(a5)
    80009be8:	873e                	mv	a4,a5
    80009bea:	4785                	li	a5,1
    80009bec:	fef70be3          	beq	a4,a5,80009be2 <virtio_disk_rw+0x580>
        intr_off();
    80009bf0:	fffff097          	auipc	ra,0xfffff
    80009bf4:	09a080e7          	jalr	154(ra) # 80008c8a <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009bf8:	fcc42703          	lw	a4,-52(s0)
    80009bfc:	15000793          	li	a5,336
    80009c00:	02f707b3          	mul	a5,a4,a5
    80009c04:	13078713          	addi	a4,a5,304
    80009c08:	0002b797          	auipc	a5,0x2b
    80009c0c:	08078793          	addi	a5,a5,128 # 80034c88 <disk>
    80009c10:	97ba                	add	a5,a5,a4
    80009c12:	853e                	mv	a0,a5
    80009c14:	ffff7097          	auipc	ra,0xffff7
    80009c18:	716080e7          	jalr	1814(ra) # 8000132a <acquire>
  while(b->disk == 1) {
    80009c1c:	fc043783          	ld	a5,-64(s0)
    80009c20:	43dc                	lw	a5,4(a5)
    80009c22:	873e                	mv	a4,a5
    80009c24:	4785                	li	a5,1
    80009c26:	f4f70ee3          	beq	a4,a5,80009b82 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    80009c2a:	fd042603          	lw	a2,-48(s0)
    80009c2e:	0002b697          	auipc	a3,0x2b
    80009c32:	05a68693          	addi	a3,a3,90 # 80034c88 <disk>
    80009c36:	fcc42703          	lw	a4,-52(s0)
    80009c3a:	87ba                	mv	a5,a4
    80009c3c:	078a                	slli	a5,a5,0x2
    80009c3e:	97ba                	add	a5,a5,a4
    80009c40:	078a                	slli	a5,a5,0x2
    80009c42:	97ba                	add	a5,a5,a4
    80009c44:	97b2                	add	a5,a5,a2
    80009c46:	078d                	addi	a5,a5,3
    80009c48:	0792                	slli	a5,a5,0x4
    80009c4a:	97b6                	add	a5,a5,a3
    80009c4c:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    80009c50:	fd042703          	lw	a4,-48(s0)
    80009c54:	fcc42783          	lw	a5,-52(s0)
    80009c58:	85ba                	mv	a1,a4
    80009c5a:	853e                	mv	a0,a5
    80009c5c:	00000097          	auipc	ra,0x0
    80009c60:	8b8080e7          	jalr	-1864(ra) # 80009514 <free_chain>

  release(&disk[id].vdisk_lock);
    80009c64:	fcc42703          	lw	a4,-52(s0)
    80009c68:	15000793          	li	a5,336
    80009c6c:	02f707b3          	mul	a5,a4,a5
    80009c70:	13078713          	addi	a4,a5,304
    80009c74:	0002b797          	auipc	a5,0x2b
    80009c78:	01478793          	addi	a5,a5,20 # 80034c88 <disk>
    80009c7c:	97ba                	add	a5,a5,a4
    80009c7e:	853e                	mv	a0,a5
    80009c80:	ffff7097          	auipc	ra,0xffff7
    80009c84:	70e080e7          	jalr	1806(ra) # 8000138e <release>
}
    80009c88:	0001                	nop
    80009c8a:	60a6                	ld	ra,72(sp)
    80009c8c:	6406                	ld	s0,64(sp)
    80009c8e:	6161                	addi	sp,sp,80
    80009c90:	8082                	ret

0000000080009c92 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009c92:	7179                	addi	sp,sp,-48
    80009c94:	f406                	sd	ra,40(sp)
    80009c96:	f022                	sd	s0,32(sp)
    80009c98:	1800                	addi	s0,sp,48
    80009c9a:	87aa                	mv	a5,a0
    80009c9c:	fcb43823          	sd	a1,-48(s0)
    80009ca0:	8732                	mv	a4,a2
    80009ca2:	fcf42e23          	sw	a5,-36(s0)
    80009ca6:	87ba                	mv	a5,a4
    80009ca8:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009cac:	0002b797          	auipc	a5,0x2b
    80009cb0:	27c78793          	addi	a5,a5,636 # 80034f28 <swap_buffer>
    80009cb4:	639c                	ld	a5,0(a5)
    80009cb6:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009cba:	fdc42703          	lw	a4,-36(s0)
    80009cbe:	fe843783          	ld	a5,-24(s0)
    80009cc2:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    80009cc4:	fe843783          	ld	a5,-24(s0)
    80009cc8:	05878793          	addi	a5,a5,88
    80009ccc:	40000613          	li	a2,1024
    80009cd0:	fd043583          	ld	a1,-48(s0)
    80009cd4:	853e                	mv	a0,a5
    80009cd6:	ffff8097          	auipc	ra,0xffff8
    80009cda:	90c080e7          	jalr	-1780(ra) # 800015e2 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    80009cde:	fd842783          	lw	a5,-40(s0)
    80009ce2:	86be                	mv	a3,a5
    80009ce4:	4605                	li	a2,1
    80009ce6:	fe843583          	ld	a1,-24(s0)
    80009cea:	4505                	li	a0,1
    80009cec:	00000097          	auipc	ra,0x0
    80009cf0:	976080e7          	jalr	-1674(ra) # 80009662 <virtio_disk_rw>
}
    80009cf4:	0001                	nop
    80009cf6:	70a2                	ld	ra,40(sp)
    80009cf8:	7402                	ld	s0,32(sp)
    80009cfa:	6145                	addi	sp,sp,48
    80009cfc:	8082                	ret

0000000080009cfe <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009cfe:	7179                	addi	sp,sp,-48
    80009d00:	f406                	sd	ra,40(sp)
    80009d02:	f022                	sd	s0,32(sp)
    80009d04:	1800                	addi	s0,sp,48
    80009d06:	87aa                	mv	a5,a0
    80009d08:	fcb43823          	sd	a1,-48(s0)
    80009d0c:	8732                	mv	a4,a2
    80009d0e:	fcf42e23          	sw	a5,-36(s0)
    80009d12:	87ba                	mv	a5,a4
    80009d14:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009d18:	0002b797          	auipc	a5,0x2b
    80009d1c:	21078793          	addi	a5,a5,528 # 80034f28 <swap_buffer>
    80009d20:	639c                	ld	a5,0(a5)
    80009d22:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009d26:	fdc42703          	lw	a4,-36(s0)
    80009d2a:	fe843783          	ld	a5,-24(s0)
    80009d2e:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    80009d30:	fd842783          	lw	a5,-40(s0)
    80009d34:	86be                	mv	a3,a5
    80009d36:	4601                	li	a2,0
    80009d38:	fe843583          	ld	a1,-24(s0)
    80009d3c:	4505                	li	a0,1
    80009d3e:	00000097          	auipc	ra,0x0
    80009d42:	924080e7          	jalr	-1756(ra) # 80009662 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009d46:	fe843783          	ld	a5,-24(s0)
    80009d4a:	05878793          	addi	a5,a5,88
    80009d4e:	40000613          	li	a2,1024
    80009d52:	85be                	mv	a1,a5
    80009d54:	fd043503          	ld	a0,-48(s0)
    80009d58:	ffff8097          	auipc	ra,0xffff8
    80009d5c:	88a080e7          	jalr	-1910(ra) # 800015e2 <memmove>
}
    80009d60:	0001                	nop
    80009d62:	70a2                	ld	ra,40(sp)
    80009d64:	7402                	ld	s0,32(sp)
    80009d66:	6145                	addi	sp,sp,48
    80009d68:	8082                	ret

0000000080009d6a <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    80009d6a:	7179                	addi	sp,sp,-48
    80009d6c:	f406                	sd	ra,40(sp)
    80009d6e:	f022                	sd	s0,32(sp)
    80009d70:	1800                	addi	s0,sp,48
    80009d72:	87aa                	mv	a5,a0
    80009d74:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    80009d78:	fdc42703          	lw	a4,-36(s0)
    80009d7c:	15000793          	li	a5,336
    80009d80:	02f707b3          	mul	a5,a4,a5
    80009d84:	13078713          	addi	a4,a5,304
    80009d88:	0002b797          	auipc	a5,0x2b
    80009d8c:	f0078793          	addi	a5,a5,-256 # 80034c88 <disk>
    80009d90:	97ba                	add	a5,a5,a4
    80009d92:	853e                	mv	a0,a5
    80009d94:	ffff7097          	auipc	ra,0xffff7
    80009d98:	596080e7          	jalr	1430(ra) # 8000132a <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80009d9c:	fdc42703          	lw	a4,-36(s0)
    80009da0:	67c1                	lui	a5,0x10
    80009da2:	0785                	addi	a5,a5,1
    80009da4:	97ba                	add	a5,a5,a4
    80009da6:	07b2                	slli	a5,a5,0xc
    80009da8:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    80009dac:	439c                	lw	a5,0(a5)
    80009dae:	0007869b          	sext.w	a3,a5
    80009db2:	fdc42703          	lw	a4,-36(s0)
    80009db6:	67c1                	lui	a5,0x10
    80009db8:	0785                	addi	a5,a5,1
    80009dba:	97ba                	add	a5,a5,a4
    80009dbc:	07b2                	slli	a5,a5,0xc
    80009dbe:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    80009dc2:	873e                	mv	a4,a5
    80009dc4:	87b6                	mv	a5,a3
    80009dc6:	8b8d                	andi	a5,a5,3
    80009dc8:	2781                	sext.w	a5,a5
    80009dca:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    80009dcc:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    80009dd0:	aa05                	j	80009f00 <virtio_disk_intr+0x196>
    __sync_synchronize();
    80009dd2:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    80009dd6:	0002b717          	auipc	a4,0x2b
    80009dda:	eb270713          	addi	a4,a4,-334 # 80034c88 <disk>
    80009dde:	fdc42683          	lw	a3,-36(s0)
    80009de2:	15000793          	li	a5,336
    80009de6:	02f687b3          	mul	a5,a3,a5
    80009dea:	97ba                	add	a5,a5,a4
    80009dec:	6f98                	ld	a4,24(a5)
    80009dee:	0002b697          	auipc	a3,0x2b
    80009df2:	e9a68693          	addi	a3,a3,-358 # 80034c88 <disk>
    80009df6:	fdc42603          	lw	a2,-36(s0)
    80009dfa:	15000793          	li	a5,336
    80009dfe:	02f607b3          	mul	a5,a2,a5
    80009e02:	97b6                	add	a5,a5,a3
    80009e04:	0287d783          	lhu	a5,40(a5)
    80009e08:	2781                	sext.w	a5,a5
    80009e0a:	8b9d                	andi	a5,a5,7
    80009e0c:	2781                	sext.w	a5,a5
    80009e0e:	078e                	slli	a5,a5,0x3
    80009e10:	97ba                	add	a5,a5,a4
    80009e12:	43dc                	lw	a5,4(a5)
    80009e14:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    80009e18:	0002b697          	auipc	a3,0x2b
    80009e1c:	e7068693          	addi	a3,a3,-400 # 80034c88 <disk>
    80009e20:	fec42603          	lw	a2,-20(s0)
    80009e24:	fdc42703          	lw	a4,-36(s0)
    80009e28:	87ba                	mv	a5,a4
    80009e2a:	078a                	slli	a5,a5,0x2
    80009e2c:	97ba                	add	a5,a5,a4
    80009e2e:	078a                	slli	a5,a5,0x2
    80009e30:	97ba                	add	a5,a5,a4
    80009e32:	97b2                	add	a5,a5,a2
    80009e34:	078d                	addi	a5,a5,3
    80009e36:	0792                	slli	a5,a5,0x4
    80009e38:	97b6                	add	a5,a5,a3
    80009e3a:	0087c783          	lbu	a5,8(a5)
    80009e3e:	c79d                	beqz	a5,80009e6c <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    80009e40:	0002b717          	auipc	a4,0x2b
    80009e44:	e4870713          	addi	a4,a4,-440 # 80034c88 <disk>
    80009e48:	fdc42683          	lw	a3,-36(s0)
    80009e4c:	15000793          	li	a5,336
    80009e50:	02f687b3          	mul	a5,a3,a5
    80009e54:	97ba                	add	a5,a5,a4
    80009e56:	639c                	ld	a5,0(a5)
    80009e58:	00002617          	auipc	a2,0x2
    80009e5c:	94060613          	addi	a2,a2,-1728 # 8000b798 <etext+0x798>
    80009e60:	85be                	mv	a1,a5
    80009e62:	4509                	li	a0,2
    80009e64:	ffff7097          	auipc	ra,0xffff7
    80009e68:	e7a080e7          	jalr	-390(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    80009e6c:	0002b697          	auipc	a3,0x2b
    80009e70:	e1c68693          	addi	a3,a3,-484 # 80034c88 <disk>
    80009e74:	fec42603          	lw	a2,-20(s0)
    80009e78:	fdc42703          	lw	a4,-36(s0)
    80009e7c:	87ba                	mv	a5,a4
    80009e7e:	078a                	slli	a5,a5,0x2
    80009e80:	97ba                	add	a5,a5,a4
    80009e82:	078a                	slli	a5,a5,0x2
    80009e84:	97ba                	add	a5,a5,a4
    80009e86:	97b2                	add	a5,a5,a2
    80009e88:	078d                	addi	a5,a5,3
    80009e8a:	0792                	slli	a5,a5,0x4
    80009e8c:	97b6                	add	a5,a5,a3
    80009e8e:	639c                	ld	a5,0(a5)
    80009e90:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009e94:	fe043783          	ld	a5,-32(s0)
    80009e98:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    80009e9c:	0002b717          	auipc	a4,0x2b
    80009ea0:	dec70713          	addi	a4,a4,-532 # 80034c88 <disk>
    80009ea4:	fdc42683          	lw	a3,-36(s0)
    80009ea8:	15000793          	li	a5,336
    80009eac:	02f687b3          	mul	a5,a3,a5
    80009eb0:	97ba                	add	a5,a5,a4
    80009eb2:	1487a783          	lw	a5,328(a5)
    80009eb6:	e799                	bnez	a5,80009ec4 <virtio_disk_intr+0x15a>
        wakeup(b);
    80009eb8:	fe043503          	ld	a0,-32(s0)
    80009ebc:	ffffa097          	auipc	ra,0xffffa
    80009ec0:	81c080e7          	jalr	-2020(ra) # 800036d8 <wakeup>
    }

    disk[id].used_idx += 1;
    80009ec4:	0002b717          	auipc	a4,0x2b
    80009ec8:	dc470713          	addi	a4,a4,-572 # 80034c88 <disk>
    80009ecc:	fdc42683          	lw	a3,-36(s0)
    80009ed0:	15000793          	li	a5,336
    80009ed4:	02f687b3          	mul	a5,a3,a5
    80009ed8:	97ba                	add	a5,a5,a4
    80009eda:	0287d783          	lhu	a5,40(a5)
    80009ede:	2785                	addiw	a5,a5,1
    80009ee0:	03079713          	slli	a4,a5,0x30
    80009ee4:	9341                	srli	a4,a4,0x30
    80009ee6:	0002b697          	auipc	a3,0x2b
    80009eea:	da268693          	addi	a3,a3,-606 # 80034c88 <disk>
    80009eee:	fdc42603          	lw	a2,-36(s0)
    80009ef2:	15000793          	li	a5,336
    80009ef6:	02f607b3          	mul	a5,a2,a5
    80009efa:	97b6                	add	a5,a5,a3
    80009efc:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    80009f00:	0002b717          	auipc	a4,0x2b
    80009f04:	d8870713          	addi	a4,a4,-632 # 80034c88 <disk>
    80009f08:	fdc42683          	lw	a3,-36(s0)
    80009f0c:	15000793          	li	a5,336
    80009f10:	02f687b3          	mul	a5,a3,a5
    80009f14:	97ba                	add	a5,a5,a4
    80009f16:	0287d603          	lhu	a2,40(a5)
    80009f1a:	0002b717          	auipc	a4,0x2b
    80009f1e:	d6e70713          	addi	a4,a4,-658 # 80034c88 <disk>
    80009f22:	fdc42683          	lw	a3,-36(s0)
    80009f26:	15000793          	li	a5,336
    80009f2a:	02f687b3          	mul	a5,a3,a5
    80009f2e:	97ba                	add	a5,a5,a4
    80009f30:	6f9c                	ld	a5,24(a5)
    80009f32:	0027d783          	lhu	a5,2(a5)
    80009f36:	0006071b          	sext.w	a4,a2
    80009f3a:	2781                	sext.w	a5,a5
    80009f3c:	e8f71be3          	bne	a4,a5,80009dd2 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    80009f40:	fdc42703          	lw	a4,-36(s0)
    80009f44:	15000793          	li	a5,336
    80009f48:	02f707b3          	mul	a5,a4,a5
    80009f4c:	13078713          	addi	a4,a5,304
    80009f50:	0002b797          	auipc	a5,0x2b
    80009f54:	d3878793          	addi	a5,a5,-712 # 80034c88 <disk>
    80009f58:	97ba                	add	a5,a5,a4
    80009f5a:	853e                	mv	a0,a5
    80009f5c:	ffff7097          	auipc	ra,0xffff7
    80009f60:	432080e7          	jalr	1074(ra) # 8000138e <release>
}
    80009f64:	0001                	nop
    80009f66:	70a2                	ld	ra,40(sp)
    80009f68:	7402                	ld	s0,32(sp)
    80009f6a:	6145                	addi	sp,sp,48
    80009f6c:	8082                	ret
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
