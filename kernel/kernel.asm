
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
    800001d4:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <end+0xffffffff7ffc88cf>
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
    8000032a:	8ca78793          	addi	a5,a5,-1846 # 80008bf0 <timervec>
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
    80000408:	5e2080e7          	jalr	1506(ra) # 800039e6 <either_copyin>
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
    80000480:	eae080e7          	jalr	-338(ra) # 8000132a <acquire>
  while(n > 0){
    80000484:	a23d                	j	800005b2 <consoleread+0x160>
    // wait until interrupt handler has put some
    // input into cons.buffer.
    while(cons.r == cons.w){
      if(killed(myproc())){
    80000486:	00002097          	auipc	ra,0x2
    8000048a:	6dc080e7          	jalr	1756(ra) # 80002b62 <myproc>
    8000048e:	87aa                	mv	a5,a0
    80000490:	853e                	mv	a0,a5
    80000492:	00003097          	auipc	ra,0x3
    80000496:	4a0080e7          	jalr	1184(ra) # 80003932 <killed>
    8000049a:	87aa                	mv	a5,a0
    8000049c:	cb99                	beqz	a5,800004b2 <consoleread+0x60>
        release(&cons.lock);
    8000049e:	00014517          	auipc	a0,0x14
    800004a2:	5f250513          	addi	a0,a0,1522 # 80014a90 <cons>
    800004a6:	00001097          	auipc	ra,0x1
    800004aa:	ee8080e7          	jalr	-280(ra) # 8000138e <release>
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
    800004c6:	262080e7          	jalr	610(ra) # 80003724 <sleep>
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
    80000582:	3f4080e7          	jalr	1012(ra) # 80003972 <either_copyout>
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
    80000600:	00014517          	auipc	a0,0x14
    80000604:	49050513          	addi	a0,a0,1168 # 80014a90 <cons>
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
    8000066c:	3f2080e7          	jalr	1010(ra) # 80003a5a <procdump>
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
    80000836:	f6e080e7          	jalr	-146(ra) # 800037a0 <wakeup>
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
    80000868:	0000b597          	auipc	a1,0xb
    8000086c:	79858593          	addi	a1,a1,1944 # 8000c000 <etext>
    80000870:	00014517          	auipc	a0,0x14
    80000874:	22050513          	addi	a0,a0,544 # 80014a90 <cons>
    80000878:	00001097          	auipc	ra,0x1
    8000087c:	a82080e7          	jalr	-1406(ra) # 800012fa <initlock>

  uartinit();
    80000880:	00000097          	auipc	ra,0x0
    80000884:	540080e7          	jalr	1344(ra) # 80000dc0 <uartinit>

  // connect read and write system calls
  // to consoleread and consolewrite.
  devsw[CONSOLE].read = consoleread;
    80000888:	00034797          	auipc	a5,0x34
    8000088c:	3a878793          	addi	a5,a5,936 # 80034c30 <devsw>
    80000890:	00000717          	auipc	a4,0x0
    80000894:	bc270713          	addi	a4,a4,-1086 # 80000452 <consoleread>
    80000898:	eb98                	sd	a4,16(a5)
  devsw[CONSOLE].write = consolewrite;
    8000089a:	00034797          	auipc	a5,0x34
    8000089e:	39678793          	addi	a5,a5,918 # 80034c30 <devsw>
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
    80000a76:	8b8080e7          	jalr	-1864(ra) # 8000132a <acquire>

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
    80000da6:	558080e7          	jalr	1368(ra) # 800012fa <initlock>
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
    80000e48:	00014517          	auipc	a0,0x14
    80000e4c:	d1050513          	addi	a0,a0,-752 # 80014b58 <uart_tx_lock>
    80000e50:	00000097          	auipc	ra,0x0
    80000e54:	4da080e7          	jalr	1242(ra) # 8000132a <acquire>

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
    80000e7c:	8ac080e7          	jalr	-1876(ra) # 80003724 <sleep>
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
    80000fd0:	00002097          	auipc	ra,0x2
    80000fd4:	7d0080e7          	jalr	2000(ra) # 800037a0 <wakeup>
    
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
    80001070:	2be080e7          	jalr	702(ra) # 8000132a <acquire>
  uartstart();
    80001074:	00000097          	auipc	ra,0x0
    80001078:	ee6080e7          	jalr	-282(ra) # 80000f5a <uartstart>
  release(&uart_tx_lock);
    8000107c:	00014517          	auipc	a0,0x14
    80001080:	adc50513          	addi	a0,a0,-1316 # 80014b58 <uart_tx_lock>
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
    8000109e:	0000b597          	auipc	a1,0xb
    800010a2:	fa258593          	addi	a1,a1,-94 # 8000c040 <etext+0x40>
    800010a6:	00014517          	auipc	a0,0x14
    800010aa:	aea50513          	addi	a0,a0,-1302 # 80014b90 <kmem>
    800010ae:	00000097          	auipc	ra,0x0
    800010b2:	24c080e7          	jalr	588(ra) # 800012fa <initlock>
  freerange(end, (void*)PHYSTOP);
    800010b6:	08100793          	li	a5,129
    800010ba:	01879593          	slli	a1,a5,0x18
    800010be:	00035517          	auipc	a0,0x35
    800010c2:	e7250513          	addi	a0,a0,-398 # 80035f30 <end>
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
    8000114c:	00035797          	auipc	a5,0x35
    80001150:	de478793          	addi	a5,a5,-540 # 80035f30 <end>
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
    80001182:	380080e7          	jalr	896(ra) # 800014fe <memset>

  r = (struct run*)pa;
    80001186:	fd843783          	ld	a5,-40(s0)
    8000118a:	fef43423          	sd	a5,-24(s0)

  acquire(&kmem.lock);
    8000118e:	00014517          	auipc	a0,0x14
    80001192:	a0250513          	addi	a0,a0,-1534 # 80014b90 <kmem>
    80001196:	00000097          	auipc	ra,0x0
    8000119a:	194080e7          	jalr	404(ra) # 8000132a <acquire>
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
    800011de:	00014517          	auipc	a0,0x14
    800011e2:	9b250513          	addi	a0,a0,-1614 # 80014b90 <kmem>
    800011e6:	00000097          	auipc	ra,0x0
    800011ea:	144080e7          	jalr	324(ra) # 8000132a <acquire>
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
    8000134e:	0000b517          	auipc	a0,0xb
    80001352:	d0250513          	addi	a0,a0,-766 # 8000c050 <etext+0x50>
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
    80001378:	7b4080e7          	jalr	1972(ra) # 80002b28 <mycpu>
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
    800013aa:	0000b517          	auipc	a0,0xb
    800013ae:	cae50513          	addi	a0,a0,-850 # 8000c058 <etext+0x58>
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
    80001404:	728080e7          	jalr	1832(ra) # 80002b28 <mycpu>
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
    8000144a:	6e2080e7          	jalr	1762(ra) # 80002b28 <mycpu>
    8000144e:	87aa                	mv	a5,a0
    80001450:	5fbc                	lw	a5,120(a5)
    80001452:	eb89                	bnez	a5,80001464 <push_off+0x3c>
    mycpu()->intena = old;
    80001454:	00001097          	auipc	ra,0x1
    80001458:	6d4080e7          	jalr	1748(ra) # 80002b28 <mycpu>
    8000145c:	872a                	mv	a4,a0
    8000145e:	fec42783          	lw	a5,-20(s0)
    80001462:	df7c                	sw	a5,124(a4)
  mycpu()->noff += 1;
    80001464:	00001097          	auipc	ra,0x1
    80001468:	6c4080e7          	jalr	1732(ra) # 80002b28 <mycpu>
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
    8000148c:	6a0080e7          	jalr	1696(ra) # 80002b28 <mycpu>
    80001490:	fea43423          	sd	a0,-24(s0)
  if(intr_get())
    80001494:	00000097          	auipc	ra,0x0
    80001498:	e38080e7          	jalr	-456(ra) # 800012cc <intr_get>
    8000149c:	87aa                	mv	a5,a0
    8000149e:	cb89                	beqz	a5,800014b0 <pop_off+0x30>
    panic("pop_off - interruptible");
    800014a0:	0000b517          	auipc	a0,0xb
    800014a4:	bc050513          	addi	a0,a0,-1088 # 8000c060 <etext+0x60>
    800014a8:	fffff097          	auipc	ra,0xfffff
    800014ac:	7e4080e7          	jalr	2020(ra) # 80000c8c <panic>
  if(c->noff < 1)
    800014b0:	fe843783          	ld	a5,-24(s0)
    800014b4:	5fbc                	lw	a5,120(a5)
    800014b6:	00f04a63          	bgtz	a5,800014ca <pop_off+0x4a>
    panic("pop_off");
    800014ba:	0000b517          	auipc	a0,0xb
    800014be:	bbe50513          	addi	a0,a0,-1090 # 8000c078 <etext+0x78>
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
    800018be:	24a080e7          	jalr	586(ra) # 80002b04 <cpuid>
    800018c2:	87aa                	mv	a5,a0
    800018c4:	efe1                	bnez	a5,8000199c <main+0xea>
    consoleinit();
    800018c6:	fffff097          	auipc	ra,0xfffff
    800018ca:	f9a080e7          	jalr	-102(ra) # 80000860 <consoleinit>
    printfinit();
    800018ce:	fffff097          	auipc	ra,0xfffff
    800018d2:	4bc080e7          	jalr	1212(ra) # 80000d8a <printfinit>
    printf("\n");
    800018d6:	0000a517          	auipc	a0,0xa
    800018da:	7aa50513          	addi	a0,a0,1962 # 8000c080 <etext+0x80>
    800018de:	fffff097          	auipc	ra,0xfffff
    800018e2:	158080e7          	jalr	344(ra) # 80000a36 <printf>
    printf("xv6 kernel is booting\n");
    800018e6:	0000a517          	auipc	a0,0xa
    800018ea:	7a250513          	addi	a0,a0,1954 # 8000c088 <etext+0x88>
    800018ee:	fffff097          	auipc	ra,0xfffff
    800018f2:	148080e7          	jalr	328(ra) # 80000a36 <printf>
    printf("\n");
    800018f6:	0000a517          	auipc	a0,0xa
    800018fa:	78a50513          	addi	a0,a0,1930 # 8000c080 <etext+0x80>
    800018fe:	fffff097          	auipc	ra,0xfffff
    80001902:	138080e7          	jalr	312(ra) # 80000a36 <printf>
    kinit();         // physical page allocator
    80001906:	fffff097          	auipc	ra,0xfffff
    8000190a:	790080e7          	jalr	1936(ra) # 80001096 <kinit>
    kvminit();       // create kernel page table
    8000190e:	00000097          	auipc	ra,0x0
    80001912:	448080e7          	jalr	1096(ra) # 80001d56 <kvminit>
    kvminithart();   // turn on paging
    80001916:	00000097          	auipc	ra,0x0
    8000191a:	46e080e7          	jalr	1134(ra) # 80001d84 <kvminithart>
    procinit();      // process table
    8000191e:	00001097          	auipc	ra,0x1
    80001922:	118080e7          	jalr	280(ra) # 80002a36 <procinit>
    trapinit();      // trap vectors
    80001926:	00002097          	auipc	ra,0x2
    8000192a:	41c080e7          	jalr	1052(ra) # 80003d42 <trapinit>
    trapinithart();  // install kernel trap vector
    8000192e:	00002097          	auipc	ra,0x2
    80001932:	43e080e7          	jalr	1086(ra) # 80003d6c <trapinithart>
    plicinit();      // set up interrupt controller
    80001936:	00007097          	auipc	ra,0x7
    8000193a:	2e4080e7          	jalr	740(ra) # 80008c1a <plicinit>
    plicinithart();  // ask PLIC for device interrupts
    8000193e:	00007097          	auipc	ra,0x7
    80001942:	30a080e7          	jalr	778(ra) # 80008c48 <plicinithart>
    binit();         // buffer cache
    80001946:	00003097          	auipc	ra,0x3
    8000194a:	e78080e7          	jalr	-392(ra) # 800047be <binit>
    iinit();         // inode table
    8000194e:	00003097          	auipc	ra,0x3
    80001952:	6ce080e7          	jalr	1742(ra) # 8000501c <iinit>
    fileinit();      // file table
    80001956:	00005097          	auipc	ra,0x5
    8000195a:	0a2080e7          	jalr	162(ra) # 800069f8 <fileinit>
    virtio_disk_init(VIRTIO0_ID, "program_disk"); // emulated hard disk 0, with programs
    8000195e:	0000a597          	auipc	a1,0xa
    80001962:	74258593          	addi	a1,a1,1858 # 8000c0a0 <etext+0xa0>
    80001966:	4501                	li	a0,0
    80001968:	00007097          	auipc	ra,0x7
    8000196c:	43a080e7          	jalr	1082(ra) # 80008da2 <virtio_disk_init>
    virtio_disk_init(VIRTIO1_ID, "swap_disk"); // emulated hard disk 1, with swap
    80001970:	0000a597          	auipc	a1,0xa
    80001974:	74058593          	addi	a1,a1,1856 # 8000c0b0 <etext+0xb0>
    80001978:	4505                	li	a0,1
    8000197a:	00007097          	auipc	ra,0x7
    8000197e:	428080e7          	jalr	1064(ra) # 80008da2 <virtio_disk_init>

    userinit();      // first user process
    80001982:	00001097          	auipc	ra,0x1
    80001986:	560080e7          	jalr	1376(ra) # 80002ee2 <userinit>
    __sync_synchronize();
    8000198a:	0ff0000f          	fence
    started = 1;
    8000198e:	00013797          	auipc	a5,0x13
    80001992:	22278793          	addi	a5,a5,546 # 80014bb0 <started>
    80001996:	4705                	li	a4,1
    80001998:	c398                	sw	a4,0(a5)
    8000199a:	a0a9                	j	800019e4 <main+0x132>
  } else {
    while(started == 0)
    8000199c:	0001                	nop
    8000199e:	00013797          	auipc	a5,0x13
    800019a2:	21278793          	addi	a5,a5,530 # 80014bb0 <started>
    800019a6:	439c                	lw	a5,0(a5)
    800019a8:	2781                	sext.w	a5,a5
    800019aa:	dbf5                	beqz	a5,8000199e <main+0xec>
      ;
    __sync_synchronize();
    800019ac:	0ff0000f          	fence
    printf("hart %d starting\n", cpuid());
    800019b0:	00001097          	auipc	ra,0x1
    800019b4:	154080e7          	jalr	340(ra) # 80002b04 <cpuid>
    800019b8:	87aa                	mv	a5,a0
    800019ba:	85be                	mv	a1,a5
    800019bc:	0000a517          	auipc	a0,0xa
    800019c0:	70450513          	addi	a0,a0,1796 # 8000c0c0 <etext+0xc0>
    800019c4:	fffff097          	auipc	ra,0xfffff
    800019c8:	072080e7          	jalr	114(ra) # 80000a36 <printf>
    kvminithart();    // turn on paging
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	3b8080e7          	jalr	952(ra) # 80001d84 <kvminithart>
    trapinithart();   // install kernel trap vector
    800019d4:	00002097          	auipc	ra,0x2
    800019d8:	398080e7          	jalr	920(ra) # 80003d6c <trapinithart>
    plicinithart();   // ask PLIC for device interrupts
    800019dc:	00007097          	auipc	ra,0x7
    800019e0:	26c080e7          	jalr	620(ra) # 80008c48 <plicinithart>
  }

  scheduler();        
    800019e4:	00002097          	auipc	ra,0x2
    800019e8:	b14080e7          	jalr	-1260(ra) # 800034f8 <scheduler>

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
  lrupages[i].refhistory = (uchar)0;
    80001a54:	00013717          	auipc	a4,0x13
    80001a58:	16470713          	addi	a4,a4,356 # 80014bb8 <lrupages>
    80001a5c:	fe843783          	ld	a5,-24(s0)
    80001a60:	0792                	slli	a5,a5,0x4
    80001a62:	97ba                	add	a5,a5,a4
    80001a64:	00078023          	sb	zero,0(a5) # fffffffffff80000 <end+0xffffffff7ff4a0d0>
  lrupages[i].pte = pte;
    80001a68:	00013717          	auipc	a4,0x13
    80001a6c:	15070713          	addi	a4,a4,336 # 80014bb8 <lrupages>
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
    80001aa4:	00013717          	auipc	a4,0x13
    80001aa8:	11470713          	addi	a4,a4,276 # 80014bb8 <lrupages>
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
    80001ace:	00013717          	auipc	a4,0x13
    80001ad2:	0ea70713          	addi	a4,a4,234 # 80014bb8 <lrupages>
    80001ad6:	fe843783          	ld	a5,-24(s0)
    80001ada:	0792                	slli	a5,a5,0x4
    80001adc:	97ba                	add	a5,a5,a4
    80001ade:	679c                	ld	a5,8(a5)
    80001ae0:	cfc9                	beqz	a5,80001b7a <updaterefhistory+0xb8>

    uchar a = ( *(lrupages[i].pte) & PTE_A ) == 0 ? 0 : 1;
    80001ae2:	00013717          	auipc	a4,0x13
    80001ae6:	0d670713          	addi	a4,a4,214 # 80014bb8 <lrupages>
    80001aea:	fe843783          	ld	a5,-24(s0)
    80001aee:	0792                	slli	a5,a5,0x4
    80001af0:	97ba                	add	a5,a5,a4
    80001af2:	679c                	ld	a5,8(a5)
    80001af4:	639c                	ld	a5,0(a5)
    80001af6:	0407f793          	andi	a5,a5,64
    80001afa:	00f037b3          	snez	a5,a5
    80001afe:	0ff7f793          	andi	a5,a5,255
    80001b02:	fef403a3          	sb	a5,-25(s0)
    *(lrupages[i].pte) = (*lrupages[i].pte) & (~PTE_A);
    80001b06:	00013717          	auipc	a4,0x13
    80001b0a:	0b270713          	addi	a4,a4,178 # 80014bb8 <lrupages>
    80001b0e:	fe843783          	ld	a5,-24(s0)
    80001b12:	0792                	slli	a5,a5,0x4
    80001b14:	97ba                	add	a5,a5,a4
    80001b16:	679c                	ld	a5,8(a5)
    80001b18:	6398                	ld	a4,0(a5)
    80001b1a:	00013697          	auipc	a3,0x13
    80001b1e:	09e68693          	addi	a3,a3,158 # 80014bb8 <lrupages>
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
    lrupages[i].refhistory = (lrupages[i].refhistory >> 1) | mask;
    80001b3e:	00013717          	auipc	a4,0x13
    80001b42:	07a70713          	addi	a4,a4,122 # 80014bb8 <lrupages>
    80001b46:	fe843783          	ld	a5,-24(s0)
    80001b4a:	0792                	slli	a5,a5,0x4
    80001b4c:	97ba                	add	a5,a5,a4
    80001b4e:	0007c783          	lbu	a5,0(a5)
    80001b52:	0017d79b          	srliw	a5,a5,0x1
    80001b56:	0ff7f713          	andi	a4,a5,255
    80001b5a:	fe644783          	lbu	a5,-26(s0)
    80001b5e:	8fd9                	or	a5,a5,a4
    80001b60:	0ff7f713          	andi	a4,a5,255
    80001b64:	00013697          	auipc	a3,0x13
    80001b68:	05468693          	addi	a3,a3,84 # 80014bb8 <lrupages>
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

0000000080001b9a <getvictim>:

pte_t*
getvictim()
{
    80001b9a:	7179                	addi	sp,sp,-48
    80001b9c:	f422                	sd	s0,40(sp)
    80001b9e:	1800                	addi	s0,sp,48
  uint64 i;
  uchar minhistory = ~0;
    80001ba0:	57fd                	li	a5,-1
    80001ba2:	fef403a3          	sb	a5,-25(s0)
  pte_t *result = 0;
    80001ba6:	fc043c23          	sd	zero,-40(s0)

  for(i = 0; i < LRUPAGESSIZE; i++)
    80001baa:	fe043423          	sd	zero,-24(s0)
    80001bae:	a88d                	j	80001c20 <getvictim+0x86>
  {
    if(lrupages[i].pte == 0) continue;
    80001bb0:	00013717          	auipc	a4,0x13
    80001bb4:	00870713          	addi	a4,a4,8 # 80014bb8 <lrupages>
    80001bb8:	fe843783          	ld	a5,-24(s0)
    80001bbc:	0792                	slli	a5,a5,0x4
    80001bbe:	97ba                	add	a5,a5,a4
    80001bc0:	679c                	ld	a5,8(a5)
    80001bc2:	cba9                	beqz	a5,80001c14 <getvictim+0x7a>
    if(lrupages[i].refhistory < minhistory)
    80001bc4:	00013717          	auipc	a4,0x13
    80001bc8:	ff470713          	addi	a4,a4,-12 # 80014bb8 <lrupages>
    80001bcc:	fe843783          	ld	a5,-24(s0)
    80001bd0:	0792                	slli	a5,a5,0x4
    80001bd2:	97ba                	add	a5,a5,a4
    80001bd4:	0007c703          	lbu	a4,0(a5) # 1000 <_entry-0x7ffff000>
    80001bd8:	fe744783          	lbu	a5,-25(s0)
    80001bdc:	0ff7f793          	andi	a5,a5,255
    80001be0:	02f77b63          	bgeu	a4,a5,80001c16 <getvictim+0x7c>
    {
      result = lrupages[i].pte;
    80001be4:	00013717          	auipc	a4,0x13
    80001be8:	fd470713          	addi	a4,a4,-44 # 80014bb8 <lrupages>
    80001bec:	fe843783          	ld	a5,-24(s0)
    80001bf0:	0792                	slli	a5,a5,0x4
    80001bf2:	97ba                	add	a5,a5,a4
    80001bf4:	679c                	ld	a5,8(a5)
    80001bf6:	fcf43c23          	sd	a5,-40(s0)
      minhistory = lrupages[i].refhistory;
    80001bfa:	00013717          	auipc	a4,0x13
    80001bfe:	fbe70713          	addi	a4,a4,-66 # 80014bb8 <lrupages>
    80001c02:	fe843783          	ld	a5,-24(s0)
    80001c06:	0792                	slli	a5,a5,0x4
    80001c08:	97ba                	add	a5,a5,a4
    80001c0a:	0007c783          	lbu	a5,0(a5)
    80001c0e:	fef403a3          	sb	a5,-25(s0)
    80001c12:	a011                	j	80001c16 <getvictim+0x7c>
    if(lrupages[i].pte == 0) continue;
    80001c14:	0001                	nop
  for(i = 0; i < LRUPAGESSIZE; i++)
    80001c16:	fe843783          	ld	a5,-24(s0)
    80001c1a:	0785                	addi	a5,a5,1
    80001c1c:	fef43423          	sd	a5,-24(s0)
    80001c20:	fe843703          	ld	a4,-24(s0)
    80001c24:	6785                	lui	a5,0x1
    80001c26:	f8f765e3          	bltu	a4,a5,80001bb0 <getvictim+0x16>
    }
  }

  return result;
    80001c2a:	fd843783          	ld	a5,-40(s0)
}
    80001c2e:	853e                	mv	a0,a5
    80001c30:	7422                	ld	s0,40(sp)
    80001c32:	6145                	addi	sp,sp,48
    80001c34:	8082                	ret

0000000080001c36 <kvmmake>:

// Make a direct-map page table for the kernel.
pagetable_t
kvmmake(void)
{
    80001c36:	1101                	addi	sp,sp,-32
    80001c38:	ec06                	sd	ra,24(sp)
    80001c3a:	e822                	sd	s0,16(sp)
    80001c3c:	1000                	addi	s0,sp,32
  pagetable_t kpgtbl;

  kpgtbl = (pagetable_t) kalloc();
    80001c3e:	fffff097          	auipc	ra,0xfffff
    80001c42:	598080e7          	jalr	1432(ra) # 800011d6 <kalloc>
    80001c46:	fea43423          	sd	a0,-24(s0)
  memset(kpgtbl, 0, PGSIZE);
    80001c4a:	6605                	lui	a2,0x1
    80001c4c:	4581                	li	a1,0
    80001c4e:	fe843503          	ld	a0,-24(s0)
    80001c52:	00000097          	auipc	ra,0x0
    80001c56:	8ac080e7          	jalr	-1876(ra) # 800014fe <memset>

  // uart registers
  kvmmap(kpgtbl, UART0, UART0, PGSIZE, PTE_R | PTE_W);
    80001c5a:	4719                	li	a4,6
    80001c5c:	6685                	lui	a3,0x1
    80001c5e:	10000637          	lui	a2,0x10000
    80001c62:	100005b7          	lui	a1,0x10000
    80001c66:	fe843503          	ld	a0,-24(s0)
    80001c6a:	00000097          	auipc	ra,0x0
    80001c6e:	2b6080e7          	jalr	694(ra) # 80001f20 <kvmmap>

  // virtio mmio disk interface
  kvmmap(kpgtbl, VIRTIO0, VIRTIO0, PGSIZE, PTE_R | PTE_W);
    80001c72:	4719                	li	a4,6
    80001c74:	6685                	lui	a3,0x1
    80001c76:	10001637          	lui	a2,0x10001
    80001c7a:	100015b7          	lui	a1,0x10001
    80001c7e:	fe843503          	ld	a0,-24(s0)
    80001c82:	00000097          	auipc	ra,0x0
    80001c86:	29e080e7          	jalr	670(ra) # 80001f20 <kvmmap>
  kvmmap(kpgtbl, VIRTIO1, VIRTIO1, PGSIZE, PTE_R | PTE_W);
    80001c8a:	4719                	li	a4,6
    80001c8c:	6685                	lui	a3,0x1
    80001c8e:	10002637          	lui	a2,0x10002
    80001c92:	100025b7          	lui	a1,0x10002
    80001c96:	fe843503          	ld	a0,-24(s0)
    80001c9a:	00000097          	auipc	ra,0x0
    80001c9e:	286080e7          	jalr	646(ra) # 80001f20 <kvmmap>

  // PLIC
  kvmmap(kpgtbl, PLIC, PLIC, 0x400000, PTE_R | PTE_W);
    80001ca2:	4719                	li	a4,6
    80001ca4:	004006b7          	lui	a3,0x400
    80001ca8:	0c000637          	lui	a2,0xc000
    80001cac:	0c0005b7          	lui	a1,0xc000
    80001cb0:	fe843503          	ld	a0,-24(s0)
    80001cb4:	00000097          	auipc	ra,0x0
    80001cb8:	26c080e7          	jalr	620(ra) # 80001f20 <kvmmap>

  // map kernel text executable and read-only.
  kvmmap(kpgtbl, KERNBASE, KERNBASE, (uint64)etext-KERNBASE, PTE_R | PTE_X);
    80001cbc:	0000a717          	auipc	a4,0xa
    80001cc0:	34470713          	addi	a4,a4,836 # 8000c000 <etext>
    80001cc4:	800007b7          	lui	a5,0x80000
    80001cc8:	97ba                	add	a5,a5,a4
    80001cca:	4729                	li	a4,10
    80001ccc:	86be                	mv	a3,a5
    80001cce:	4785                	li	a5,1
    80001cd0:	01f79613          	slli	a2,a5,0x1f
    80001cd4:	4785                	li	a5,1
    80001cd6:	01f79593          	slli	a1,a5,0x1f
    80001cda:	fe843503          	ld	a0,-24(s0)
    80001cde:	00000097          	auipc	ra,0x0
    80001ce2:	242080e7          	jalr	578(ra) # 80001f20 <kvmmap>

  // map kernel data and the physical RAM we'll make use of.
  kvmmap(kpgtbl, (uint64)etext, (uint64)etext, PHYSTOP-(uint64)etext, PTE_R | PTE_W);
    80001ce6:	0000a597          	auipc	a1,0xa
    80001cea:	31a58593          	addi	a1,a1,794 # 8000c000 <etext>
    80001cee:	0000a617          	auipc	a2,0xa
    80001cf2:	31260613          	addi	a2,a2,786 # 8000c000 <etext>
    80001cf6:	0000a797          	auipc	a5,0xa
    80001cfa:	30a78793          	addi	a5,a5,778 # 8000c000 <etext>
    80001cfe:	08100713          	li	a4,129
    80001d02:	0762                	slli	a4,a4,0x18
    80001d04:	40f707b3          	sub	a5,a4,a5
    80001d08:	4719                	li	a4,6
    80001d0a:	86be                	mv	a3,a5
    80001d0c:	fe843503          	ld	a0,-24(s0)
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	210080e7          	jalr	528(ra) # 80001f20 <kvmmap>

  // map the trampoline for trap entry/exit to
  // the highest virtual address in the kernel.
  kvmmap(kpgtbl, TRAMPOLINE, (uint64)trampoline, PGSIZE, PTE_R | PTE_X);
    80001d18:	00009797          	auipc	a5,0x9
    80001d1c:	2e878793          	addi	a5,a5,744 # 8000b000 <_trampoline>
    80001d20:	4729                	li	a4,10
    80001d22:	6685                	lui	a3,0x1
    80001d24:	863e                	mv	a2,a5
    80001d26:	040007b7          	lui	a5,0x4000
    80001d2a:	17fd                	addi	a5,a5,-1
    80001d2c:	00c79593          	slli	a1,a5,0xc
    80001d30:	fe843503          	ld	a0,-24(s0)
    80001d34:	00000097          	auipc	ra,0x0
    80001d38:	1ec080e7          	jalr	492(ra) # 80001f20 <kvmmap>

  // allocate and map a kernel stack for each process.
  proc_mapstacks(kpgtbl);
    80001d3c:	fe843503          	ld	a0,-24(s0)
    80001d40:	00001097          	auipc	ra,0x1
    80001d44:	c3a080e7          	jalr	-966(ra) # 8000297a <proc_mapstacks>
  
  return kpgtbl;
    80001d48:	fe843783          	ld	a5,-24(s0)
}
    80001d4c:	853e                	mv	a0,a5
    80001d4e:	60e2                	ld	ra,24(sp)
    80001d50:	6442                	ld	s0,16(sp)
    80001d52:	6105                	addi	sp,sp,32
    80001d54:	8082                	ret

0000000080001d56 <kvminit>:

// Initialize the one kernel_pagetable
void
kvminit(void)
{
    80001d56:	1141                	addi	sp,sp,-16
    80001d58:	e406                	sd	ra,8(sp)
    80001d5a:	e022                	sd	s0,0(sp)
    80001d5c:	0800                	addi	s0,sp,16
  kernel_pagetable = kvmmake();
    80001d5e:	00000097          	auipc	ra,0x0
    80001d62:	ed8080e7          	jalr	-296(ra) # 80001c36 <kvmmake>
    80001d66:	872a                	mv	a4,a0
    80001d68:	0000b797          	auipc	a5,0xb
    80001d6c:	bd078793          	addi	a5,a5,-1072 # 8000c938 <kernel_pagetable>
    80001d70:	e398                	sd	a4,0(a5)
  updaterefhistory();
    80001d72:	00000097          	auipc	ra,0x0
    80001d76:	d50080e7          	jalr	-688(ra) # 80001ac2 <updaterefhistory>
}
    80001d7a:	0001                	nop
    80001d7c:	60a2                	ld	ra,8(sp)
    80001d7e:	6402                	ld	s0,0(sp)
    80001d80:	0141                	addi	sp,sp,16
    80001d82:	8082                	ret

0000000080001d84 <kvminithart>:

// Switch h/w page table register to the kernel's page table,
// and enable paging.
void
kvminithart()
{
    80001d84:	1141                	addi	sp,sp,-16
    80001d86:	e406                	sd	ra,8(sp)
    80001d88:	e022                	sd	s0,0(sp)
    80001d8a:	0800                	addi	s0,sp,16
  // wait for any previous writes to the page table memory to finish.
  sfence_vma();
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	c7a080e7          	jalr	-902(ra) # 80001a06 <sfence_vma>

  w_satp(MAKE_SATP(kernel_pagetable));
    80001d94:	0000b797          	auipc	a5,0xb
    80001d98:	ba478793          	addi	a5,a5,-1116 # 8000c938 <kernel_pagetable>
    80001d9c:	639c                	ld	a5,0(a5)
    80001d9e:	00c7d713          	srli	a4,a5,0xc
    80001da2:	57fd                	li	a5,-1
    80001da4:	17fe                	slli	a5,a5,0x3f
    80001da6:	8fd9                	or	a5,a5,a4
    80001da8:	853e                	mv	a0,a5
    80001daa:	00000097          	auipc	ra,0x0
    80001dae:	c42080e7          	jalr	-958(ra) # 800019ec <w_satp>

  // flush stale entries from the TLB.
  sfence_vma();
    80001db2:	00000097          	auipc	ra,0x0
    80001db6:	c54080e7          	jalr	-940(ra) # 80001a06 <sfence_vma>
}
    80001dba:	0001                	nop
    80001dbc:	60a2                	ld	ra,8(sp)
    80001dbe:	6402                	ld	s0,0(sp)
    80001dc0:	0141                	addi	sp,sp,16
    80001dc2:	8082                	ret

0000000080001dc4 <walk>:
//   21..29 -- 9 bits of level-1 index.
//   12..20 -- 9 bits of level-0 index.
//    0..11 -- 12 bits of byte offset within the page.
pte_t *
walk(pagetable_t pagetable, uint64 va, int alloc)
{
    80001dc4:	7139                	addi	sp,sp,-64
    80001dc6:	fc06                	sd	ra,56(sp)
    80001dc8:	f822                	sd	s0,48(sp)
    80001dca:	0080                	addi	s0,sp,64
    80001dcc:	fca43c23          	sd	a0,-40(s0)
    80001dd0:	fcb43823          	sd	a1,-48(s0)
    80001dd4:	87b2                	mv	a5,a2
    80001dd6:	fcf42623          	sw	a5,-52(s0)
  if(va >= MAXVA)
    80001dda:	fd043703          	ld	a4,-48(s0)
    80001dde:	57fd                	li	a5,-1
    80001de0:	83e9                	srli	a5,a5,0x1a
    80001de2:	00e7f463          	bgeu	a5,a4,80001dea <walk+0x26>
    return 0;
    80001de6:	4781                	li	a5,0
    80001de8:	a85d                	j	80001e9e <walk+0xda>

  for(int level = 2; level > 0; level--) {
    80001dea:	4789                	li	a5,2
    80001dec:	fef42623          	sw	a5,-20(s0)
    80001df0:	a849                	j	80001e82 <walk+0xbe>
    pte_t *pte = &pagetable[PX(level, va)];
    80001df2:	fec42703          	lw	a4,-20(s0)
    80001df6:	87ba                	mv	a5,a4
    80001df8:	0037979b          	slliw	a5,a5,0x3
    80001dfc:	9fb9                	addw	a5,a5,a4
    80001dfe:	2781                	sext.w	a5,a5
    80001e00:	27b1                	addiw	a5,a5,12
    80001e02:	2781                	sext.w	a5,a5
    80001e04:	873e                	mv	a4,a5
    80001e06:	fd043783          	ld	a5,-48(s0)
    80001e0a:	00e7d7b3          	srl	a5,a5,a4
    80001e0e:	1ff7f793          	andi	a5,a5,511
    80001e12:	078e                	slli	a5,a5,0x3
    80001e14:	fd843703          	ld	a4,-40(s0)
    80001e18:	97ba                	add	a5,a5,a4
    80001e1a:	fef43023          	sd	a5,-32(s0)
    if(*pte & PTE_V) {
    80001e1e:	fe043783          	ld	a5,-32(s0)
    80001e22:	639c                	ld	a5,0(a5)
    80001e24:	8b85                	andi	a5,a5,1
    80001e26:	cb89                	beqz	a5,80001e38 <walk+0x74>
      pagetable = (pagetable_t)PTE2PA(*pte);
    80001e28:	fe043783          	ld	a5,-32(s0)
    80001e2c:	639c                	ld	a5,0(a5)
    80001e2e:	83a9                	srli	a5,a5,0xa
    80001e30:	07b2                	slli	a5,a5,0xc
    80001e32:	fcf43c23          	sd	a5,-40(s0)
    80001e36:	a089                	j	80001e78 <walk+0xb4>
    } else {
      if(!alloc || (pagetable = (pde_t*)kalloc()) == 0)
    80001e38:	fcc42783          	lw	a5,-52(s0)
    80001e3c:	2781                	sext.w	a5,a5
    80001e3e:	cb91                	beqz	a5,80001e52 <walk+0x8e>
    80001e40:	fffff097          	auipc	ra,0xfffff
    80001e44:	396080e7          	jalr	918(ra) # 800011d6 <kalloc>
    80001e48:	fca43c23          	sd	a0,-40(s0)
    80001e4c:	fd843783          	ld	a5,-40(s0)
    80001e50:	e399                	bnez	a5,80001e56 <walk+0x92>
        return 0;
    80001e52:	4781                	li	a5,0
    80001e54:	a0a9                	j	80001e9e <walk+0xda>
      memset(pagetable, 0, PGSIZE);
    80001e56:	6605                	lui	a2,0x1
    80001e58:	4581                	li	a1,0
    80001e5a:	fd843503          	ld	a0,-40(s0)
    80001e5e:	fffff097          	auipc	ra,0xfffff
    80001e62:	6a0080e7          	jalr	1696(ra) # 800014fe <memset>
      *pte = PA2PTE(pagetable) | PTE_V;
    80001e66:	fd843783          	ld	a5,-40(s0)
    80001e6a:	83b1                	srli	a5,a5,0xc
    80001e6c:	07aa                	slli	a5,a5,0xa
    80001e6e:	0017e713          	ori	a4,a5,1
    80001e72:	fe043783          	ld	a5,-32(s0)
    80001e76:	e398                	sd	a4,0(a5)
  for(int level = 2; level > 0; level--) {
    80001e78:	fec42783          	lw	a5,-20(s0)
    80001e7c:	37fd                	addiw	a5,a5,-1
    80001e7e:	fef42623          	sw	a5,-20(s0)
    80001e82:	fec42783          	lw	a5,-20(s0)
    80001e86:	2781                	sext.w	a5,a5
    80001e88:	f6f045e3          	bgtz	a5,80001df2 <walk+0x2e>
    }
  }
  return &pagetable[PX(0, va)];
    80001e8c:	fd043783          	ld	a5,-48(s0)
    80001e90:	83b1                	srli	a5,a5,0xc
    80001e92:	1ff7f793          	andi	a5,a5,511
    80001e96:	078e                	slli	a5,a5,0x3
    80001e98:	fd843703          	ld	a4,-40(s0)
    80001e9c:	97ba                	add	a5,a5,a4
}
    80001e9e:	853e                	mv	a0,a5
    80001ea0:	70e2                	ld	ra,56(sp)
    80001ea2:	7442                	ld	s0,48(sp)
    80001ea4:	6121                	addi	sp,sp,64
    80001ea6:	8082                	ret

0000000080001ea8 <walkaddr>:
// Look up a virtual address, return the physical address,
// or 0 if not mapped.
// Can only be used to look up user pages.
uint64
walkaddr(pagetable_t pagetable, uint64 va)
{
    80001ea8:	7179                	addi	sp,sp,-48
    80001eaa:	f406                	sd	ra,40(sp)
    80001eac:	f022                	sd	s0,32(sp)
    80001eae:	1800                	addi	s0,sp,48
    80001eb0:	fca43c23          	sd	a0,-40(s0)
    80001eb4:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  uint64 pa;

  if(va >= MAXVA)
    80001eb8:	fd043703          	ld	a4,-48(s0)
    80001ebc:	57fd                	li	a5,-1
    80001ebe:	83e9                	srli	a5,a5,0x1a
    80001ec0:	00e7f463          	bgeu	a5,a4,80001ec8 <walkaddr+0x20>
    return 0;
    80001ec4:	4781                	li	a5,0
    80001ec6:	a881                	j	80001f16 <walkaddr+0x6e>

  pte = walk(pagetable, va, 0);
    80001ec8:	4601                	li	a2,0
    80001eca:	fd043583          	ld	a1,-48(s0)
    80001ece:	fd843503          	ld	a0,-40(s0)
    80001ed2:	00000097          	auipc	ra,0x0
    80001ed6:	ef2080e7          	jalr	-270(ra) # 80001dc4 <walk>
    80001eda:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    80001ede:	fe843783          	ld	a5,-24(s0)
    80001ee2:	e399                	bnez	a5,80001ee8 <walkaddr+0x40>
    return 0;
    80001ee4:	4781                	li	a5,0
    80001ee6:	a805                	j	80001f16 <walkaddr+0x6e>
  if((*pte & PTE_V) == 0)
    80001ee8:	fe843783          	ld	a5,-24(s0)
    80001eec:	639c                	ld	a5,0(a5)
    80001eee:	8b85                	andi	a5,a5,1
    80001ef0:	e399                	bnez	a5,80001ef6 <walkaddr+0x4e>
    return 0;
    80001ef2:	4781                	li	a5,0
    80001ef4:	a00d                	j	80001f16 <walkaddr+0x6e>
  if((*pte & PTE_U) == 0)
    80001ef6:	fe843783          	ld	a5,-24(s0)
    80001efa:	639c                	ld	a5,0(a5)
    80001efc:	8bc1                	andi	a5,a5,16
    80001efe:	e399                	bnez	a5,80001f04 <walkaddr+0x5c>
    return 0;
    80001f00:	4781                	li	a5,0
    80001f02:	a811                	j	80001f16 <walkaddr+0x6e>
  pa = PTE2PA(*pte);
    80001f04:	fe843783          	ld	a5,-24(s0)
    80001f08:	639c                	ld	a5,0(a5)
    80001f0a:	83a9                	srli	a5,a5,0xa
    80001f0c:	07b2                	slli	a5,a5,0xc
    80001f0e:	fef43023          	sd	a5,-32(s0)
  return pa;
    80001f12:	fe043783          	ld	a5,-32(s0)
}
    80001f16:	853e                	mv	a0,a5
    80001f18:	70a2                	ld	ra,40(sp)
    80001f1a:	7402                	ld	s0,32(sp)
    80001f1c:	6145                	addi	sp,sp,48
    80001f1e:	8082                	ret

0000000080001f20 <kvmmap>:
// add a mapping to the kernel page table.
// only used when booting.
// does not flush TLB or enable paging.
void
kvmmap(pagetable_t kpgtbl, uint64 va, uint64 pa, uint64 sz, int perm)
{
    80001f20:	7139                	addi	sp,sp,-64
    80001f22:	fc06                	sd	ra,56(sp)
    80001f24:	f822                	sd	s0,48(sp)
    80001f26:	0080                	addi	s0,sp,64
    80001f28:	fea43423          	sd	a0,-24(s0)
    80001f2c:	feb43023          	sd	a1,-32(s0)
    80001f30:	fcc43c23          	sd	a2,-40(s0)
    80001f34:	fcd43823          	sd	a3,-48(s0)
    80001f38:	87ba                	mv	a5,a4
    80001f3a:	fcf42623          	sw	a5,-52(s0)
  if(mappages(kpgtbl, va, sz, pa, perm) != 0)
    80001f3e:	fcc42783          	lw	a5,-52(s0)
    80001f42:	873e                	mv	a4,a5
    80001f44:	fd843683          	ld	a3,-40(s0)
    80001f48:	fd043603          	ld	a2,-48(s0)
    80001f4c:	fe043583          	ld	a1,-32(s0)
    80001f50:	fe843503          	ld	a0,-24(s0)
    80001f54:	00000097          	auipc	ra,0x0
    80001f58:	026080e7          	jalr	38(ra) # 80001f7a <mappages>
    80001f5c:	87aa                	mv	a5,a0
    80001f5e:	cb89                	beqz	a5,80001f70 <kvmmap+0x50>
    panic("kvmmap");
    80001f60:	0000a517          	auipc	a0,0xa
    80001f64:	17850513          	addi	a0,a0,376 # 8000c0d8 <etext+0xd8>
    80001f68:	fffff097          	auipc	ra,0xfffff
    80001f6c:	d24080e7          	jalr	-732(ra) # 80000c8c <panic>
}
    80001f70:	0001                	nop
    80001f72:	70e2                	ld	ra,56(sp)
    80001f74:	7442                	ld	s0,48(sp)
    80001f76:	6121                	addi	sp,sp,64
    80001f78:	8082                	ret

0000000080001f7a <mappages>:
// physical addresses starting at pa. va and size might not
// be page-aligned. Returns 0 on success, -1 if walk() couldn't
// allocate a needed page-table page.
int
mappages(pagetable_t pagetable, uint64 va, uint64 size, uint64 pa, int perm)
{
    80001f7a:	711d                	addi	sp,sp,-96
    80001f7c:	ec86                	sd	ra,88(sp)
    80001f7e:	e8a2                	sd	s0,80(sp)
    80001f80:	1080                	addi	s0,sp,96
    80001f82:	fca43423          	sd	a0,-56(s0)
    80001f86:	fcb43023          	sd	a1,-64(s0)
    80001f8a:	fac43c23          	sd	a2,-72(s0)
    80001f8e:	fad43823          	sd	a3,-80(s0)
    80001f92:	87ba                	mv	a5,a4
    80001f94:	faf42623          	sw	a5,-84(s0)
  uint64 a, last;
  pte_t *pte;

  if(size == 0)
    80001f98:	fb843783          	ld	a5,-72(s0)
    80001f9c:	eb89                	bnez	a5,80001fae <mappages+0x34>
    panic("mappages: size");
    80001f9e:	0000a517          	auipc	a0,0xa
    80001fa2:	14250513          	addi	a0,a0,322 # 8000c0e0 <etext+0xe0>
    80001fa6:	fffff097          	auipc	ra,0xfffff
    80001faa:	ce6080e7          	jalr	-794(ra) # 80000c8c <panic>
  
  a = PGROUNDDOWN(va);
    80001fae:	fc043703          	ld	a4,-64(s0)
    80001fb2:	77fd                	lui	a5,0xfffff
    80001fb4:	8ff9                	and	a5,a5,a4
    80001fb6:	fef43423          	sd	a5,-24(s0)
  last = PGROUNDDOWN(va + size - 1);
    80001fba:	fc043703          	ld	a4,-64(s0)
    80001fbe:	fb843783          	ld	a5,-72(s0)
    80001fc2:	97ba                	add	a5,a5,a4
    80001fc4:	fff78713          	addi	a4,a5,-1 # ffffffffffffefff <end+0xffffffff7ffc90cf>
    80001fc8:	77fd                	lui	a5,0xfffff
    80001fca:	8ff9                	and	a5,a5,a4
    80001fcc:	fef43023          	sd	a5,-32(s0)
  for(;;){
    if((pte = walk(pagetable, a, 1)) == 0)
    80001fd0:	4605                	li	a2,1
    80001fd2:	fe843583          	ld	a1,-24(s0)
    80001fd6:	fc843503          	ld	a0,-56(s0)
    80001fda:	00000097          	auipc	ra,0x0
    80001fde:	dea080e7          	jalr	-534(ra) # 80001dc4 <walk>
    80001fe2:	fca43c23          	sd	a0,-40(s0)
    80001fe6:	fd843783          	ld	a5,-40(s0)
    80001fea:	e399                	bnez	a5,80001ff0 <mappages+0x76>
      return -1;
    80001fec:	57fd                	li	a5,-1
    80001fee:	a0b5                	j	8000205a <mappages+0xe0>
    if(*pte & PTE_V)
    80001ff0:	fd843783          	ld	a5,-40(s0)
    80001ff4:	639c                	ld	a5,0(a5)
    80001ff6:	8b85                	andi	a5,a5,1
    80001ff8:	cb89                	beqz	a5,8000200a <mappages+0x90>
      panic("mappages: remap");
    80001ffa:	0000a517          	auipc	a0,0xa
    80001ffe:	0f650513          	addi	a0,a0,246 # 8000c0f0 <etext+0xf0>
    80002002:	fffff097          	auipc	ra,0xfffff
    80002006:	c8a080e7          	jalr	-886(ra) # 80000c8c <panic>
    *pte = PA2PTE(pa) | perm | PTE_V;
    8000200a:	fb043783          	ld	a5,-80(s0)
    8000200e:	83b1                	srli	a5,a5,0xc
    80002010:	00a79713          	slli	a4,a5,0xa
    80002014:	fac42783          	lw	a5,-84(s0)
    80002018:	8fd9                	or	a5,a5,a4
    8000201a:	0017e713          	ori	a4,a5,1
    8000201e:	fd843783          	ld	a5,-40(s0)
    80002022:	e398                	sd	a4,0(a5)
    reglrupage(pte);
    80002024:	fd843503          	ld	a0,-40(s0)
    80002028:	00000097          	auipc	ra,0x0
    8000202c:	a10080e7          	jalr	-1520(ra) # 80001a38 <reglrupage>
    if(a == last)
    80002030:	fe843703          	ld	a4,-24(s0)
    80002034:	fe043783          	ld	a5,-32(s0)
    80002038:	00f70f63          	beq	a4,a5,80002056 <mappages+0xdc>
      break;
    a += PGSIZE;
    8000203c:	fe843703          	ld	a4,-24(s0)
    80002040:	6785                	lui	a5,0x1
    80002042:	97ba                	add	a5,a5,a4
    80002044:	fef43423          	sd	a5,-24(s0)
    pa += PGSIZE;
    80002048:	fb043703          	ld	a4,-80(s0)
    8000204c:	6785                	lui	a5,0x1
    8000204e:	97ba                	add	a5,a5,a4
    80002050:	faf43823          	sd	a5,-80(s0)
    if((pte = walk(pagetable, a, 1)) == 0)
    80002054:	bfb5                	j	80001fd0 <mappages+0x56>
      break;
    80002056:	0001                	nop
  }
  return 0;
    80002058:	4781                	li	a5,0
}
    8000205a:	853e                	mv	a0,a5
    8000205c:	60e6                	ld	ra,88(sp)
    8000205e:	6446                	ld	s0,80(sp)
    80002060:	6125                	addi	sp,sp,96
    80002062:	8082                	ret

0000000080002064 <uvmunmap>:
// Remove npages of mappings starting from va. va must be
// page-aligned. The mappings must exist.
// Optionally free the physical memory.
void
uvmunmap(pagetable_t pagetable, uint64 va, uint64 npages, int do_free)
{
    80002064:	715d                	addi	sp,sp,-80
    80002066:	e486                	sd	ra,72(sp)
    80002068:	e0a2                	sd	s0,64(sp)
    8000206a:	0880                	addi	s0,sp,80
    8000206c:	fca43423          	sd	a0,-56(s0)
    80002070:	fcb43023          	sd	a1,-64(s0)
    80002074:	fac43c23          	sd	a2,-72(s0)
    80002078:	87b6                	mv	a5,a3
    8000207a:	faf42a23          	sw	a5,-76(s0)
  uint64 a;
  pte_t *pte;

  if((va % PGSIZE) != 0)
    8000207e:	fc043703          	ld	a4,-64(s0)
    80002082:	6785                	lui	a5,0x1
    80002084:	17fd                	addi	a5,a5,-1
    80002086:	8ff9                	and	a5,a5,a4
    80002088:	cb89                	beqz	a5,8000209a <uvmunmap+0x36>
    panic("uvmunmap: not aligned");
    8000208a:	0000a517          	auipc	a0,0xa
    8000208e:	07650513          	addi	a0,a0,118 # 8000c100 <etext+0x100>
    80002092:	fffff097          	auipc	ra,0xfffff
    80002096:	bfa080e7          	jalr	-1030(ra) # 80000c8c <panic>

  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    8000209a:	fc043783          	ld	a5,-64(s0)
    8000209e:	fef43423          	sd	a5,-24(s0)
    800020a2:	a075                	j	8000214e <uvmunmap+0xea>
    if((pte = walk(pagetable, a, 0)) == 0)
    800020a4:	4601                	li	a2,0
    800020a6:	fe843583          	ld	a1,-24(s0)
    800020aa:	fc843503          	ld	a0,-56(s0)
    800020ae:	00000097          	auipc	ra,0x0
    800020b2:	d16080e7          	jalr	-746(ra) # 80001dc4 <walk>
    800020b6:	fea43023          	sd	a0,-32(s0)
    800020ba:	fe043783          	ld	a5,-32(s0)
    800020be:	eb89                	bnez	a5,800020d0 <uvmunmap+0x6c>
      panic("uvmunmap: walk");
    800020c0:	0000a517          	auipc	a0,0xa
    800020c4:	05850513          	addi	a0,a0,88 # 8000c118 <etext+0x118>
    800020c8:	fffff097          	auipc	ra,0xfffff
    800020cc:	bc4080e7          	jalr	-1084(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    800020d0:	fe043783          	ld	a5,-32(s0)
    800020d4:	639c                	ld	a5,0(a5)
    800020d6:	8b85                	andi	a5,a5,1
    800020d8:	eb89                	bnez	a5,800020ea <uvmunmap+0x86>
      panic("uvmunmap: not mapped");
    800020da:	0000a517          	auipc	a0,0xa
    800020de:	04e50513          	addi	a0,a0,78 # 8000c128 <etext+0x128>
    800020e2:	fffff097          	auipc	ra,0xfffff
    800020e6:	baa080e7          	jalr	-1110(ra) # 80000c8c <panic>
    if(PTE_FLAGS(*pte) == PTE_V)
    800020ea:	fe043783          	ld	a5,-32(s0)
    800020ee:	639c                	ld	a5,0(a5)
    800020f0:	3ff7f713          	andi	a4,a5,1023
    800020f4:	4785                	li	a5,1
    800020f6:	00f71a63          	bne	a4,a5,8000210a <uvmunmap+0xa6>
      panic("uvmunmap: not a leaf");
    800020fa:	0000a517          	auipc	a0,0xa
    800020fe:	04650513          	addi	a0,a0,70 # 8000c140 <etext+0x140>
    80002102:	fffff097          	auipc	ra,0xfffff
    80002106:	b8a080e7          	jalr	-1142(ra) # 80000c8c <panic>
    if(do_free){
    8000210a:	fb442783          	lw	a5,-76(s0)
    8000210e:	2781                	sext.w	a5,a5
    80002110:	c78d                	beqz	a5,8000213a <uvmunmap+0xd6>
      unreglrupage(pte);
    80002112:	fe043503          	ld	a0,-32(s0)
    80002116:	00000097          	auipc	ra,0x0
    8000211a:	972080e7          	jalr	-1678(ra) # 80001a88 <unreglrupage>
      uint64 pa = PTE2PA(*pte);
    8000211e:	fe043783          	ld	a5,-32(s0)
    80002122:	639c                	ld	a5,0(a5)
    80002124:	83a9                	srli	a5,a5,0xa
    80002126:	07b2                	slli	a5,a5,0xc
    80002128:	fcf43c23          	sd	a5,-40(s0)
      kfree((void*)pa);
    8000212c:	fd843783          	ld	a5,-40(s0)
    80002130:	853e                	mv	a0,a5
    80002132:	fffff097          	auipc	ra,0xfffff
    80002136:	ffe080e7          	jalr	-2(ra) # 80001130 <kfree>
    }
    *pte = 0;
    8000213a:	fe043783          	ld	a5,-32(s0)
    8000213e:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  for(a = va; a < va + npages*PGSIZE; a += PGSIZE){
    80002142:	fe843703          	ld	a4,-24(s0)
    80002146:	6785                	lui	a5,0x1
    80002148:	97ba                	add	a5,a5,a4
    8000214a:	fef43423          	sd	a5,-24(s0)
    8000214e:	fb843783          	ld	a5,-72(s0)
    80002152:	00c79713          	slli	a4,a5,0xc
    80002156:	fc043783          	ld	a5,-64(s0)
    8000215a:	97ba                	add	a5,a5,a4
    8000215c:	fe843703          	ld	a4,-24(s0)
    80002160:	f4f762e3          	bltu	a4,a5,800020a4 <uvmunmap+0x40>
  }
}
    80002164:	0001                	nop
    80002166:	0001                	nop
    80002168:	60a6                	ld	ra,72(sp)
    8000216a:	6406                	ld	s0,64(sp)
    8000216c:	6161                	addi	sp,sp,80
    8000216e:	8082                	ret

0000000080002170 <uvmcreate>:

// create an empty user page table.
// returns 0 if out of memory.
pagetable_t
uvmcreate()
{
    80002170:	1101                	addi	sp,sp,-32
    80002172:	ec06                	sd	ra,24(sp)
    80002174:	e822                	sd	s0,16(sp)
    80002176:	1000                	addi	s0,sp,32
  pagetable_t pagetable;
  pagetable = (pagetable_t) kalloc();
    80002178:	fffff097          	auipc	ra,0xfffff
    8000217c:	05e080e7          	jalr	94(ra) # 800011d6 <kalloc>
    80002180:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002184:	fe843783          	ld	a5,-24(s0)
    80002188:	e399                	bnez	a5,8000218e <uvmcreate+0x1e>
    return 0;
    8000218a:	4781                	li	a5,0
    8000218c:	a819                	j	800021a2 <uvmcreate+0x32>
  memset(pagetable, 0, PGSIZE);
    8000218e:	6605                	lui	a2,0x1
    80002190:	4581                	li	a1,0
    80002192:	fe843503          	ld	a0,-24(s0)
    80002196:	fffff097          	auipc	ra,0xfffff
    8000219a:	368080e7          	jalr	872(ra) # 800014fe <memset>
  return pagetable;
    8000219e:	fe843783          	ld	a5,-24(s0)
}
    800021a2:	853e                	mv	a0,a5
    800021a4:	60e2                	ld	ra,24(sp)
    800021a6:	6442                	ld	s0,16(sp)
    800021a8:	6105                	addi	sp,sp,32
    800021aa:	8082                	ret

00000000800021ac <uvmfirst>:
// Load the user initcode into address 0 of pagetable,
// for the very first process.
// sz must be less than a page.
void
uvmfirst(pagetable_t pagetable, uchar *src, uint sz)
{
    800021ac:	7139                	addi	sp,sp,-64
    800021ae:	fc06                	sd	ra,56(sp)
    800021b0:	f822                	sd	s0,48(sp)
    800021b2:	0080                	addi	s0,sp,64
    800021b4:	fca43c23          	sd	a0,-40(s0)
    800021b8:	fcb43823          	sd	a1,-48(s0)
    800021bc:	87b2                	mv	a5,a2
    800021be:	fcf42623          	sw	a5,-52(s0)
  char *mem;

  if(sz >= PGSIZE)
    800021c2:	fcc42783          	lw	a5,-52(s0)
    800021c6:	0007871b          	sext.w	a4,a5
    800021ca:	6785                	lui	a5,0x1
    800021cc:	00f76a63          	bltu	a4,a5,800021e0 <uvmfirst+0x34>
    panic("uvmfirst: more than a page");
    800021d0:	0000a517          	auipc	a0,0xa
    800021d4:	f8850513          	addi	a0,a0,-120 # 8000c158 <etext+0x158>
    800021d8:	fffff097          	auipc	ra,0xfffff
    800021dc:	ab4080e7          	jalr	-1356(ra) # 80000c8c <panic>
  mem = kalloc();
    800021e0:	fffff097          	auipc	ra,0xfffff
    800021e4:	ff6080e7          	jalr	-10(ra) # 800011d6 <kalloc>
    800021e8:	fea43423          	sd	a0,-24(s0)
  memset(mem, 0, PGSIZE);
    800021ec:	6605                	lui	a2,0x1
    800021ee:	4581                	li	a1,0
    800021f0:	fe843503          	ld	a0,-24(s0)
    800021f4:	fffff097          	auipc	ra,0xfffff
    800021f8:	30a080e7          	jalr	778(ra) # 800014fe <memset>
  mappages(pagetable, 0, PGSIZE, (uint64)mem, PTE_W|PTE_R|PTE_X|PTE_U);
    800021fc:	fe843783          	ld	a5,-24(s0)
    80002200:	4779                	li	a4,30
    80002202:	86be                	mv	a3,a5
    80002204:	6605                	lui	a2,0x1
    80002206:	4581                	li	a1,0
    80002208:	fd843503          	ld	a0,-40(s0)
    8000220c:	00000097          	auipc	ra,0x0
    80002210:	d6e080e7          	jalr	-658(ra) # 80001f7a <mappages>
  memmove(mem, src, sz);
    80002214:	fcc42783          	lw	a5,-52(s0)
    80002218:	863e                	mv	a2,a5
    8000221a:	fd043583          	ld	a1,-48(s0)
    8000221e:	fe843503          	ld	a0,-24(s0)
    80002222:	fffff097          	auipc	ra,0xfffff
    80002226:	3c0080e7          	jalr	960(ra) # 800015e2 <memmove>
}
    8000222a:	0001                	nop
    8000222c:	70e2                	ld	ra,56(sp)
    8000222e:	7442                	ld	s0,48(sp)
    80002230:	6121                	addi	sp,sp,64
    80002232:	8082                	ret

0000000080002234 <uvmalloc>:

// Allocate PTEs and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
uint64
uvmalloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz, int xperm)
{
    80002234:	7139                	addi	sp,sp,-64
    80002236:	fc06                	sd	ra,56(sp)
    80002238:	f822                	sd	s0,48(sp)
    8000223a:	0080                	addi	s0,sp,64
    8000223c:	fca43c23          	sd	a0,-40(s0)
    80002240:	fcb43823          	sd	a1,-48(s0)
    80002244:	fcc43423          	sd	a2,-56(s0)
    80002248:	87b6                	mv	a5,a3
    8000224a:	fcf42223          	sw	a5,-60(s0)
  char *mem;
  uint64 a;

  if(newsz < oldsz)
    8000224e:	fc843703          	ld	a4,-56(s0)
    80002252:	fd043783          	ld	a5,-48(s0)
    80002256:	00f77563          	bgeu	a4,a5,80002260 <uvmalloc+0x2c>
    return oldsz;
    8000225a:	fd043783          	ld	a5,-48(s0)
    8000225e:	a87d                	j	8000231c <uvmalloc+0xe8>

  oldsz = PGROUNDUP(oldsz);
    80002260:	fd043703          	ld	a4,-48(s0)
    80002264:	6785                	lui	a5,0x1
    80002266:	17fd                	addi	a5,a5,-1
    80002268:	973e                	add	a4,a4,a5
    8000226a:	77fd                	lui	a5,0xfffff
    8000226c:	8ff9                	and	a5,a5,a4
    8000226e:	fcf43823          	sd	a5,-48(s0)
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002272:	fd043783          	ld	a5,-48(s0)
    80002276:	fef43423          	sd	a5,-24(s0)
    8000227a:	a849                	j	8000230c <uvmalloc+0xd8>
    mem = kalloc();
    8000227c:	fffff097          	auipc	ra,0xfffff
    80002280:	f5a080e7          	jalr	-166(ra) # 800011d6 <kalloc>
    80002284:	fea43023          	sd	a0,-32(s0)
    if(mem == 0){
    80002288:	fe043783          	ld	a5,-32(s0)
    8000228c:	ef89                	bnez	a5,800022a6 <uvmalloc+0x72>
      uvmdealloc(pagetable, a, oldsz);
    8000228e:	fd043603          	ld	a2,-48(s0)
    80002292:	fe843583          	ld	a1,-24(s0)
    80002296:	fd843503          	ld	a0,-40(s0)
    8000229a:	00000097          	auipc	ra,0x0
    8000229e:	08c080e7          	jalr	140(ra) # 80002326 <uvmdealloc>
      return 0;
    800022a2:	4781                	li	a5,0
    800022a4:	a8a5                	j	8000231c <uvmalloc+0xe8>
    }
    memset(mem, 0, PGSIZE);
    800022a6:	6605                	lui	a2,0x1
    800022a8:	4581                	li	a1,0
    800022aa:	fe043503          	ld	a0,-32(s0)
    800022ae:	fffff097          	auipc	ra,0xfffff
    800022b2:	250080e7          	jalr	592(ra) # 800014fe <memset>
    if(mappages(pagetable, a, PGSIZE, (uint64)mem, PTE_R|PTE_U|xperm) != 0){
    800022b6:	fe043683          	ld	a3,-32(s0)
    800022ba:	fc442783          	lw	a5,-60(s0)
    800022be:	0127e793          	ori	a5,a5,18
    800022c2:	2781                	sext.w	a5,a5
    800022c4:	873e                	mv	a4,a5
    800022c6:	6605                	lui	a2,0x1
    800022c8:	fe843583          	ld	a1,-24(s0)
    800022cc:	fd843503          	ld	a0,-40(s0)
    800022d0:	00000097          	auipc	ra,0x0
    800022d4:	caa080e7          	jalr	-854(ra) # 80001f7a <mappages>
    800022d8:	87aa                	mv	a5,a0
    800022da:	c39d                	beqz	a5,80002300 <uvmalloc+0xcc>
      kfree(mem);
    800022dc:	fe043503          	ld	a0,-32(s0)
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	e50080e7          	jalr	-432(ra) # 80001130 <kfree>
      uvmdealloc(pagetable, a, oldsz);
    800022e8:	fd043603          	ld	a2,-48(s0)
    800022ec:	fe843583          	ld	a1,-24(s0)
    800022f0:	fd843503          	ld	a0,-40(s0)
    800022f4:	00000097          	auipc	ra,0x0
    800022f8:	032080e7          	jalr	50(ra) # 80002326 <uvmdealloc>
      return 0;
    800022fc:	4781                	li	a5,0
    800022fe:	a839                	j	8000231c <uvmalloc+0xe8>
  for(a = oldsz; a < newsz; a += PGSIZE){
    80002300:	fe843703          	ld	a4,-24(s0)
    80002304:	6785                	lui	a5,0x1
    80002306:	97ba                	add	a5,a5,a4
    80002308:	fef43423          	sd	a5,-24(s0)
    8000230c:	fe843703          	ld	a4,-24(s0)
    80002310:	fc843783          	ld	a5,-56(s0)
    80002314:	f6f764e3          	bltu	a4,a5,8000227c <uvmalloc+0x48>
    }
  }
  return newsz;
    80002318:	fc843783          	ld	a5,-56(s0)
}
    8000231c:	853e                	mv	a0,a5
    8000231e:	70e2                	ld	ra,56(sp)
    80002320:	7442                	ld	s0,48(sp)
    80002322:	6121                	addi	sp,sp,64
    80002324:	8082                	ret

0000000080002326 <uvmdealloc>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
uint64
uvmdealloc(pagetable_t pagetable, uint64 oldsz, uint64 newsz)
{
    80002326:	7139                	addi	sp,sp,-64
    80002328:	fc06                	sd	ra,56(sp)
    8000232a:	f822                	sd	s0,48(sp)
    8000232c:	0080                	addi	s0,sp,64
    8000232e:	fca43c23          	sd	a0,-40(s0)
    80002332:	fcb43823          	sd	a1,-48(s0)
    80002336:	fcc43423          	sd	a2,-56(s0)
  if(newsz >= oldsz)
    8000233a:	fc843703          	ld	a4,-56(s0)
    8000233e:	fd043783          	ld	a5,-48(s0)
    80002342:	00f76563          	bltu	a4,a5,8000234c <uvmdealloc+0x26>
    return oldsz;
    80002346:	fd043783          	ld	a5,-48(s0)
    8000234a:	a885                	j	800023ba <uvmdealloc+0x94>

  if(PGROUNDUP(newsz) < PGROUNDUP(oldsz)){
    8000234c:	fc843703          	ld	a4,-56(s0)
    80002350:	6785                	lui	a5,0x1
    80002352:	17fd                	addi	a5,a5,-1
    80002354:	973e                	add	a4,a4,a5
    80002356:	77fd                	lui	a5,0xfffff
    80002358:	8f7d                	and	a4,a4,a5
    8000235a:	fd043683          	ld	a3,-48(s0)
    8000235e:	6785                	lui	a5,0x1
    80002360:	17fd                	addi	a5,a5,-1
    80002362:	96be                	add	a3,a3,a5
    80002364:	77fd                	lui	a5,0xfffff
    80002366:	8ff5                	and	a5,a5,a3
    80002368:	04f77763          	bgeu	a4,a5,800023b6 <uvmdealloc+0x90>
    int npages = (PGROUNDUP(oldsz) - PGROUNDUP(newsz)) / PGSIZE;
    8000236c:	fd043703          	ld	a4,-48(s0)
    80002370:	6785                	lui	a5,0x1
    80002372:	17fd                	addi	a5,a5,-1
    80002374:	973e                	add	a4,a4,a5
    80002376:	77fd                	lui	a5,0xfffff
    80002378:	8f7d                	and	a4,a4,a5
    8000237a:	fc843683          	ld	a3,-56(s0)
    8000237e:	6785                	lui	a5,0x1
    80002380:	17fd                	addi	a5,a5,-1
    80002382:	96be                	add	a3,a3,a5
    80002384:	77fd                	lui	a5,0xfffff
    80002386:	8ff5                	and	a5,a5,a3
    80002388:	40f707b3          	sub	a5,a4,a5
    8000238c:	83b1                	srli	a5,a5,0xc
    8000238e:	fef42623          	sw	a5,-20(s0)
    uvmunmap(pagetable, PGROUNDUP(newsz), npages, 1);
    80002392:	fc843703          	ld	a4,-56(s0)
    80002396:	6785                	lui	a5,0x1
    80002398:	17fd                	addi	a5,a5,-1
    8000239a:	973e                	add	a4,a4,a5
    8000239c:	77fd                	lui	a5,0xfffff
    8000239e:	8ff9                	and	a5,a5,a4
    800023a0:	fec42703          	lw	a4,-20(s0)
    800023a4:	4685                	li	a3,1
    800023a6:	863a                	mv	a2,a4
    800023a8:	85be                	mv	a1,a5
    800023aa:	fd843503          	ld	a0,-40(s0)
    800023ae:	00000097          	auipc	ra,0x0
    800023b2:	cb6080e7          	jalr	-842(ra) # 80002064 <uvmunmap>
  }

  return newsz;
    800023b6:	fc843783          	ld	a5,-56(s0)
}
    800023ba:	853e                	mv	a0,a5
    800023bc:	70e2                	ld	ra,56(sp)
    800023be:	7442                	ld	s0,48(sp)
    800023c0:	6121                	addi	sp,sp,64
    800023c2:	8082                	ret

00000000800023c4 <freewalk>:

// Recursively free page-table pages.
// All leaf mappings must already have been removed.
void
freewalk(pagetable_t pagetable)
{
    800023c4:	7139                	addi	sp,sp,-64
    800023c6:	fc06                	sd	ra,56(sp)
    800023c8:	f822                	sd	s0,48(sp)
    800023ca:	0080                	addi	s0,sp,64
    800023cc:	fca43423          	sd	a0,-56(s0)
  // there are 2^9 = 512 PTEs in a page table.
  for(int i = 0; i < 512; i++){
    800023d0:	fe042623          	sw	zero,-20(s0)
    800023d4:	a88d                	j	80002446 <freewalk+0x82>
    pte_t pte = pagetable[i];
    800023d6:	fec42783          	lw	a5,-20(s0)
    800023da:	078e                	slli	a5,a5,0x3
    800023dc:	fc843703          	ld	a4,-56(s0)
    800023e0:	97ba                	add	a5,a5,a4
    800023e2:	639c                	ld	a5,0(a5)
    800023e4:	fef43023          	sd	a5,-32(s0)
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    800023e8:	fe043783          	ld	a5,-32(s0)
    800023ec:	8b85                	andi	a5,a5,1
    800023ee:	cb9d                	beqz	a5,80002424 <freewalk+0x60>
    800023f0:	fe043783          	ld	a5,-32(s0)
    800023f4:	8bb9                	andi	a5,a5,14
    800023f6:	e79d                	bnez	a5,80002424 <freewalk+0x60>
      // this PTE points to a lower-level page table.
      uint64 child = PTE2PA(pte);
    800023f8:	fe043783          	ld	a5,-32(s0)
    800023fc:	83a9                	srli	a5,a5,0xa
    800023fe:	07b2                	slli	a5,a5,0xc
    80002400:	fcf43c23          	sd	a5,-40(s0)
      freewalk((pagetable_t)child);
    80002404:	fd843783          	ld	a5,-40(s0)
    80002408:	853e                	mv	a0,a5
    8000240a:	00000097          	auipc	ra,0x0
    8000240e:	fba080e7          	jalr	-70(ra) # 800023c4 <freewalk>
      pagetable[i] = 0;
    80002412:	fec42783          	lw	a5,-20(s0)
    80002416:	078e                	slli	a5,a5,0x3
    80002418:	fc843703          	ld	a4,-56(s0)
    8000241c:	97ba                	add	a5,a5,a4
    8000241e:	0007b023          	sd	zero,0(a5) # fffffffffffff000 <end+0xffffffff7ffc90d0>
    if((pte & PTE_V) && (pte & (PTE_R|PTE_W|PTE_X)) == 0){
    80002422:	a829                	j	8000243c <freewalk+0x78>
    } else if(pte & PTE_V){
    80002424:	fe043783          	ld	a5,-32(s0)
    80002428:	8b85                	andi	a5,a5,1
    8000242a:	cb89                	beqz	a5,8000243c <freewalk+0x78>
      panic("freewalk: leaf");
    8000242c:	0000a517          	auipc	a0,0xa
    80002430:	d4c50513          	addi	a0,a0,-692 # 8000c178 <etext+0x178>
    80002434:	fffff097          	auipc	ra,0xfffff
    80002438:	858080e7          	jalr	-1960(ra) # 80000c8c <panic>
  for(int i = 0; i < 512; i++){
    8000243c:	fec42783          	lw	a5,-20(s0)
    80002440:	2785                	addiw	a5,a5,1
    80002442:	fef42623          	sw	a5,-20(s0)
    80002446:	fec42783          	lw	a5,-20(s0)
    8000244a:	0007871b          	sext.w	a4,a5
    8000244e:	1ff00793          	li	a5,511
    80002452:	f8e7d2e3          	bge	a5,a4,800023d6 <freewalk+0x12>
    }
  }
  kfree((void*)pagetable);
    80002456:	fc843503          	ld	a0,-56(s0)
    8000245a:	fffff097          	auipc	ra,0xfffff
    8000245e:	cd6080e7          	jalr	-810(ra) # 80001130 <kfree>
}
    80002462:	0001                	nop
    80002464:	70e2                	ld	ra,56(sp)
    80002466:	7442                	ld	s0,48(sp)
    80002468:	6121                	addi	sp,sp,64
    8000246a:	8082                	ret

000000008000246c <uvmfree>:

// Free user memory pages,
// then free page-table pages.
void
uvmfree(pagetable_t pagetable, uint64 sz)
{
    8000246c:	1101                	addi	sp,sp,-32
    8000246e:	ec06                	sd	ra,24(sp)
    80002470:	e822                	sd	s0,16(sp)
    80002472:	1000                	addi	s0,sp,32
    80002474:	fea43423          	sd	a0,-24(s0)
    80002478:	feb43023          	sd	a1,-32(s0)
  if(sz > 0)
    8000247c:	fe043783          	ld	a5,-32(s0)
    80002480:	c385                	beqz	a5,800024a0 <uvmfree+0x34>
    uvmunmap(pagetable, 0, PGROUNDUP(sz)/PGSIZE, 1);
    80002482:	fe043703          	ld	a4,-32(s0)
    80002486:	6785                	lui	a5,0x1
    80002488:	17fd                	addi	a5,a5,-1
    8000248a:	97ba                	add	a5,a5,a4
    8000248c:	83b1                	srli	a5,a5,0xc
    8000248e:	4685                	li	a3,1
    80002490:	863e                	mv	a2,a5
    80002492:	4581                	li	a1,0
    80002494:	fe843503          	ld	a0,-24(s0)
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	bcc080e7          	jalr	-1076(ra) # 80002064 <uvmunmap>
  freewalk(pagetable);
    800024a0:	fe843503          	ld	a0,-24(s0)
    800024a4:	00000097          	auipc	ra,0x0
    800024a8:	f20080e7          	jalr	-224(ra) # 800023c4 <freewalk>
}
    800024ac:	0001                	nop
    800024ae:	60e2                	ld	ra,24(sp)
    800024b0:	6442                	ld	s0,16(sp)
    800024b2:	6105                	addi	sp,sp,32
    800024b4:	8082                	ret

00000000800024b6 <uvmcopy>:
// physical memory.
// returns 0 on success, -1 on failure.
// frees any allocated pages on failure.
int
uvmcopy(pagetable_t old, pagetable_t new, uint64 sz)
{
    800024b6:	711d                	addi	sp,sp,-96
    800024b8:	ec86                	sd	ra,88(sp)
    800024ba:	e8a2                	sd	s0,80(sp)
    800024bc:	1080                	addi	s0,sp,96
    800024be:	faa43c23          	sd	a0,-72(s0)
    800024c2:	fab43823          	sd	a1,-80(s0)
    800024c6:	fac43423          	sd	a2,-88(s0)
  pte_t *pte;
  uint64 pa, i;
  uint flags;
  char *mem;

  for(i = 0; i < sz; i += PGSIZE){
    800024ca:	fe043423          	sd	zero,-24(s0)
    800024ce:	a0d9                	j	80002594 <uvmcopy+0xde>
    if((pte = walk(old, i, 0)) == 0)
    800024d0:	4601                	li	a2,0
    800024d2:	fe843583          	ld	a1,-24(s0)
    800024d6:	fb843503          	ld	a0,-72(s0)
    800024da:	00000097          	auipc	ra,0x0
    800024de:	8ea080e7          	jalr	-1814(ra) # 80001dc4 <walk>
    800024e2:	fea43023          	sd	a0,-32(s0)
    800024e6:	fe043783          	ld	a5,-32(s0)
    800024ea:	eb89                	bnez	a5,800024fc <uvmcopy+0x46>
      panic("uvmcopy: pte should exist");
    800024ec:	0000a517          	auipc	a0,0xa
    800024f0:	c9c50513          	addi	a0,a0,-868 # 8000c188 <etext+0x188>
    800024f4:	ffffe097          	auipc	ra,0xffffe
    800024f8:	798080e7          	jalr	1944(ra) # 80000c8c <panic>
    if((*pte & PTE_V) == 0)
    800024fc:	fe043783          	ld	a5,-32(s0)
    80002500:	639c                	ld	a5,0(a5)
    80002502:	8b85                	andi	a5,a5,1
    80002504:	eb89                	bnez	a5,80002516 <uvmcopy+0x60>
      panic("uvmcopy: page not present");
    80002506:	0000a517          	auipc	a0,0xa
    8000250a:	ca250513          	addi	a0,a0,-862 # 8000c1a8 <etext+0x1a8>
    8000250e:	ffffe097          	auipc	ra,0xffffe
    80002512:	77e080e7          	jalr	1918(ra) # 80000c8c <panic>
    pa = PTE2PA(*pte);
    80002516:	fe043783          	ld	a5,-32(s0)
    8000251a:	639c                	ld	a5,0(a5)
    8000251c:	83a9                	srli	a5,a5,0xa
    8000251e:	07b2                	slli	a5,a5,0xc
    80002520:	fcf43c23          	sd	a5,-40(s0)
    flags = PTE_FLAGS(*pte);
    80002524:	fe043783          	ld	a5,-32(s0)
    80002528:	639c                	ld	a5,0(a5)
    8000252a:	2781                	sext.w	a5,a5
    8000252c:	3ff7f793          	andi	a5,a5,1023
    80002530:	fcf42a23          	sw	a5,-44(s0)
    if((mem = kalloc()) == 0)
    80002534:	fffff097          	auipc	ra,0xfffff
    80002538:	ca2080e7          	jalr	-862(ra) # 800011d6 <kalloc>
    8000253c:	fca43423          	sd	a0,-56(s0)
    80002540:	fc843783          	ld	a5,-56(s0)
    80002544:	c3a5                	beqz	a5,800025a4 <uvmcopy+0xee>
      goto err;
    memmove(mem, (char*)pa, PGSIZE);
    80002546:	fd843783          	ld	a5,-40(s0)
    8000254a:	6605                	lui	a2,0x1
    8000254c:	85be                	mv	a1,a5
    8000254e:	fc843503          	ld	a0,-56(s0)
    80002552:	fffff097          	auipc	ra,0xfffff
    80002556:	090080e7          	jalr	144(ra) # 800015e2 <memmove>
    if(mappages(new, i, PGSIZE, (uint64)mem, flags) != 0){
    8000255a:	fc843783          	ld	a5,-56(s0)
    8000255e:	fd442703          	lw	a4,-44(s0)
    80002562:	86be                	mv	a3,a5
    80002564:	6605                	lui	a2,0x1
    80002566:	fe843583          	ld	a1,-24(s0)
    8000256a:	fb043503          	ld	a0,-80(s0)
    8000256e:	00000097          	auipc	ra,0x0
    80002572:	a0c080e7          	jalr	-1524(ra) # 80001f7a <mappages>
    80002576:	87aa                	mv	a5,a0
    80002578:	cb81                	beqz	a5,80002588 <uvmcopy+0xd2>
      kfree(mem);
    8000257a:	fc843503          	ld	a0,-56(s0)
    8000257e:	fffff097          	auipc	ra,0xfffff
    80002582:	bb2080e7          	jalr	-1102(ra) # 80001130 <kfree>
      goto err;
    80002586:	a005                	j	800025a6 <uvmcopy+0xf0>
  for(i = 0; i < sz; i += PGSIZE){
    80002588:	fe843703          	ld	a4,-24(s0)
    8000258c:	6785                	lui	a5,0x1
    8000258e:	97ba                	add	a5,a5,a4
    80002590:	fef43423          	sd	a5,-24(s0)
    80002594:	fe843703          	ld	a4,-24(s0)
    80002598:	fa843783          	ld	a5,-88(s0)
    8000259c:	f2f76ae3          	bltu	a4,a5,800024d0 <uvmcopy+0x1a>
    }
  }
  return 0;
    800025a0:	4781                	li	a5,0
    800025a2:	a839                	j	800025c0 <uvmcopy+0x10a>
      goto err;
    800025a4:	0001                	nop

 err:
  uvmunmap(new, 0, i / PGSIZE, 1);
    800025a6:	fe843783          	ld	a5,-24(s0)
    800025aa:	83b1                	srli	a5,a5,0xc
    800025ac:	4685                	li	a3,1
    800025ae:	863e                	mv	a2,a5
    800025b0:	4581                	li	a1,0
    800025b2:	fb043503          	ld	a0,-80(s0)
    800025b6:	00000097          	auipc	ra,0x0
    800025ba:	aae080e7          	jalr	-1362(ra) # 80002064 <uvmunmap>
  return -1;
    800025be:	57fd                	li	a5,-1
}
    800025c0:	853e                	mv	a0,a5
    800025c2:	60e6                	ld	ra,88(sp)
    800025c4:	6446                	ld	s0,80(sp)
    800025c6:	6125                	addi	sp,sp,96
    800025c8:	8082                	ret

00000000800025ca <uvmclear>:

// mark a PTE invalid for user access.
// used by exec for the user stack guard page.
void
uvmclear(pagetable_t pagetable, uint64 va)
{
    800025ca:	7179                	addi	sp,sp,-48
    800025cc:	f406                	sd	ra,40(sp)
    800025ce:	f022                	sd	s0,32(sp)
    800025d0:	1800                	addi	s0,sp,48
    800025d2:	fca43c23          	sd	a0,-40(s0)
    800025d6:	fcb43823          	sd	a1,-48(s0)
  pte_t *pte;
  
  pte = walk(pagetable, va, 0);
    800025da:	4601                	li	a2,0
    800025dc:	fd043583          	ld	a1,-48(s0)
    800025e0:	fd843503          	ld	a0,-40(s0)
    800025e4:	fffff097          	auipc	ra,0xfffff
    800025e8:	7e0080e7          	jalr	2016(ra) # 80001dc4 <walk>
    800025ec:	fea43423          	sd	a0,-24(s0)
  if(pte == 0)
    800025f0:	fe843783          	ld	a5,-24(s0)
    800025f4:	eb89                	bnez	a5,80002606 <uvmclear+0x3c>
    panic("uvmclear");
    800025f6:	0000a517          	auipc	a0,0xa
    800025fa:	bd250513          	addi	a0,a0,-1070 # 8000c1c8 <etext+0x1c8>
    800025fe:	ffffe097          	auipc	ra,0xffffe
    80002602:	68e080e7          	jalr	1678(ra) # 80000c8c <panic>
  *pte &= ~PTE_U;
    80002606:	fe843783          	ld	a5,-24(s0)
    8000260a:	639c                	ld	a5,0(a5)
    8000260c:	fef7f713          	andi	a4,a5,-17
    80002610:	fe843783          	ld	a5,-24(s0)
    80002614:	e398                	sd	a4,0(a5)
  unreglrupage(pte);
    80002616:	fe843503          	ld	a0,-24(s0)
    8000261a:	fffff097          	auipc	ra,0xfffff
    8000261e:	46e080e7          	jalr	1134(ra) # 80001a88 <unreglrupage>
}
    80002622:	0001                	nop
    80002624:	70a2                	ld	ra,40(sp)
    80002626:	7402                	ld	s0,32(sp)
    80002628:	6145                	addi	sp,sp,48
    8000262a:	8082                	ret

000000008000262c <copyout>:
// Copy from kernel to user.
// Copy len bytes from src to virtual address dstva in a given page table.
// Return 0 on success, -1 on error.
int
copyout(pagetable_t pagetable, uint64 dstva, char *src, uint64 len)
{
    8000262c:	715d                	addi	sp,sp,-80
    8000262e:	e486                	sd	ra,72(sp)
    80002630:	e0a2                	sd	s0,64(sp)
    80002632:	0880                	addi	s0,sp,80
    80002634:	fca43423          	sd	a0,-56(s0)
    80002638:	fcb43023          	sd	a1,-64(s0)
    8000263c:	fac43c23          	sd	a2,-72(s0)
    80002640:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002644:	a055                	j	800026e8 <copyout+0xbc>
    va0 = PGROUNDDOWN(dstva);
    80002646:	fc043703          	ld	a4,-64(s0)
    8000264a:	77fd                	lui	a5,0xfffff
    8000264c:	8ff9                	and	a5,a5,a4
    8000264e:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002652:	fe043583          	ld	a1,-32(s0)
    80002656:	fc843503          	ld	a0,-56(s0)
    8000265a:	00000097          	auipc	ra,0x0
    8000265e:	84e080e7          	jalr	-1970(ra) # 80001ea8 <walkaddr>
    80002662:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002666:	fd843783          	ld	a5,-40(s0)
    8000266a:	e399                	bnez	a5,80002670 <copyout+0x44>
      return -1;
    8000266c:	57fd                	li	a5,-1
    8000266e:	a049                	j	800026f0 <copyout+0xc4>
    n = PGSIZE - (dstva - va0);
    80002670:	fe043703          	ld	a4,-32(s0)
    80002674:	fc043783          	ld	a5,-64(s0)
    80002678:	8f1d                	sub	a4,a4,a5
    8000267a:	6785                	lui	a5,0x1
    8000267c:	97ba                	add	a5,a5,a4
    8000267e:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002682:	fe843703          	ld	a4,-24(s0)
    80002686:	fb043783          	ld	a5,-80(s0)
    8000268a:	00e7f663          	bgeu	a5,a4,80002696 <copyout+0x6a>
      n = len;
    8000268e:	fb043783          	ld	a5,-80(s0)
    80002692:	fef43423          	sd	a5,-24(s0)
    memmove((void *)(pa0 + (dstva - va0)), src, n);
    80002696:	fc043703          	ld	a4,-64(s0)
    8000269a:	fe043783          	ld	a5,-32(s0)
    8000269e:	8f1d                	sub	a4,a4,a5
    800026a0:	fd843783          	ld	a5,-40(s0)
    800026a4:	97ba                	add	a5,a5,a4
    800026a6:	873e                	mv	a4,a5
    800026a8:	fe843783          	ld	a5,-24(s0)
    800026ac:	2781                	sext.w	a5,a5
    800026ae:	863e                	mv	a2,a5
    800026b0:	fb843583          	ld	a1,-72(s0)
    800026b4:	853a                	mv	a0,a4
    800026b6:	fffff097          	auipc	ra,0xfffff
    800026ba:	f2c080e7          	jalr	-212(ra) # 800015e2 <memmove>

    len -= n;
    800026be:	fb043703          	ld	a4,-80(s0)
    800026c2:	fe843783          	ld	a5,-24(s0)
    800026c6:	40f707b3          	sub	a5,a4,a5
    800026ca:	faf43823          	sd	a5,-80(s0)
    src += n;
    800026ce:	fb843703          	ld	a4,-72(s0)
    800026d2:	fe843783          	ld	a5,-24(s0)
    800026d6:	97ba                	add	a5,a5,a4
    800026d8:	faf43c23          	sd	a5,-72(s0)
    dstva = va0 + PGSIZE;
    800026dc:	fe043703          	ld	a4,-32(s0)
    800026e0:	6785                	lui	a5,0x1
    800026e2:	97ba                	add	a5,a5,a4
    800026e4:	fcf43023          	sd	a5,-64(s0)
  while(len > 0){
    800026e8:	fb043783          	ld	a5,-80(s0)
    800026ec:	ffa9                	bnez	a5,80002646 <copyout+0x1a>
  }
  return 0;
    800026ee:	4781                	li	a5,0
}
    800026f0:	853e                	mv	a0,a5
    800026f2:	60a6                	ld	ra,72(sp)
    800026f4:	6406                	ld	s0,64(sp)
    800026f6:	6161                	addi	sp,sp,80
    800026f8:	8082                	ret

00000000800026fa <copyin>:
// Copy from user to kernel.
// Copy len bytes to dst from virtual address srcva in a given page table.
// Return 0 on success, -1 on error.
int
copyin(pagetable_t pagetable, char *dst, uint64 srcva, uint64 len)
{
    800026fa:	715d                	addi	sp,sp,-80
    800026fc:	e486                	sd	ra,72(sp)
    800026fe:	e0a2                	sd	s0,64(sp)
    80002700:	0880                	addi	s0,sp,80
    80002702:	fca43423          	sd	a0,-56(s0)
    80002706:	fcb43023          	sd	a1,-64(s0)
    8000270a:	fac43c23          	sd	a2,-72(s0)
    8000270e:	fad43823          	sd	a3,-80(s0)
  uint64 n, va0, pa0;

  while(len > 0){
    80002712:	a055                	j	800027b6 <copyin+0xbc>
    va0 = PGROUNDDOWN(srcva);
    80002714:	fb843703          	ld	a4,-72(s0)
    80002718:	77fd                	lui	a5,0xfffff
    8000271a:	8ff9                	and	a5,a5,a4
    8000271c:	fef43023          	sd	a5,-32(s0)
    pa0 = walkaddr(pagetable, va0);
    80002720:	fe043583          	ld	a1,-32(s0)
    80002724:	fc843503          	ld	a0,-56(s0)
    80002728:	fffff097          	auipc	ra,0xfffff
    8000272c:	780080e7          	jalr	1920(ra) # 80001ea8 <walkaddr>
    80002730:	fca43c23          	sd	a0,-40(s0)
    if(pa0 == 0)
    80002734:	fd843783          	ld	a5,-40(s0)
    80002738:	e399                	bnez	a5,8000273e <copyin+0x44>
      return -1;
    8000273a:	57fd                	li	a5,-1
    8000273c:	a049                	j	800027be <copyin+0xc4>
    n = PGSIZE - (srcva - va0);
    8000273e:	fe043703          	ld	a4,-32(s0)
    80002742:	fb843783          	ld	a5,-72(s0)
    80002746:	8f1d                	sub	a4,a4,a5
    80002748:	6785                	lui	a5,0x1
    8000274a:	97ba                	add	a5,a5,a4
    8000274c:	fef43423          	sd	a5,-24(s0)
    if(n > len)
    80002750:	fe843703          	ld	a4,-24(s0)
    80002754:	fb043783          	ld	a5,-80(s0)
    80002758:	00e7f663          	bgeu	a5,a4,80002764 <copyin+0x6a>
      n = len;
    8000275c:	fb043783          	ld	a5,-80(s0)
    80002760:	fef43423          	sd	a5,-24(s0)
    memmove(dst, (void *)(pa0 + (srcva - va0)), n);
    80002764:	fb843703          	ld	a4,-72(s0)
    80002768:	fe043783          	ld	a5,-32(s0)
    8000276c:	8f1d                	sub	a4,a4,a5
    8000276e:	fd843783          	ld	a5,-40(s0)
    80002772:	97ba                	add	a5,a5,a4
    80002774:	873e                	mv	a4,a5
    80002776:	fe843783          	ld	a5,-24(s0)
    8000277a:	2781                	sext.w	a5,a5
    8000277c:	863e                	mv	a2,a5
    8000277e:	85ba                	mv	a1,a4
    80002780:	fc043503          	ld	a0,-64(s0)
    80002784:	fffff097          	auipc	ra,0xfffff
    80002788:	e5e080e7          	jalr	-418(ra) # 800015e2 <memmove>

    len -= n;
    8000278c:	fb043703          	ld	a4,-80(s0)
    80002790:	fe843783          	ld	a5,-24(s0)
    80002794:	40f707b3          	sub	a5,a4,a5
    80002798:	faf43823          	sd	a5,-80(s0)
    dst += n;
    8000279c:	fc043703          	ld	a4,-64(s0)
    800027a0:	fe843783          	ld	a5,-24(s0)
    800027a4:	97ba                	add	a5,a5,a4
    800027a6:	fcf43023          	sd	a5,-64(s0)
    srcva = va0 + PGSIZE;
    800027aa:	fe043703          	ld	a4,-32(s0)
    800027ae:	6785                	lui	a5,0x1
    800027b0:	97ba                	add	a5,a5,a4
    800027b2:	faf43c23          	sd	a5,-72(s0)
  while(len > 0){
    800027b6:	fb043783          	ld	a5,-80(s0)
    800027ba:	ffa9                	bnez	a5,80002714 <copyin+0x1a>
  }
  return 0;
    800027bc:	4781                	li	a5,0
}
    800027be:	853e                	mv	a0,a5
    800027c0:	60a6                	ld	ra,72(sp)
    800027c2:	6406                	ld	s0,64(sp)
    800027c4:	6161                	addi	sp,sp,80
    800027c6:	8082                	ret

00000000800027c8 <copyinstr>:
// Copy bytes to dst from virtual address srcva in a given page table,
// until a '\0', or max.
// Return 0 on success, -1 on error.
int
copyinstr(pagetable_t pagetable, char *dst, uint64 srcva, uint64 max)
{
    800027c8:	711d                	addi	sp,sp,-96
    800027ca:	ec86                	sd	ra,88(sp)
    800027cc:	e8a2                	sd	s0,80(sp)
    800027ce:	1080                	addi	s0,sp,96
    800027d0:	faa43c23          	sd	a0,-72(s0)
    800027d4:	fab43823          	sd	a1,-80(s0)
    800027d8:	fac43423          	sd	a2,-88(s0)
    800027dc:	fad43023          	sd	a3,-96(s0)
  uint64 n, va0, pa0;
  int got_null = 0;
    800027e0:	fe042223          	sw	zero,-28(s0)

  while(got_null == 0 && max > 0){
    800027e4:	a0f1                	j	800028b0 <copyinstr+0xe8>
    va0 = PGROUNDDOWN(srcva);
    800027e6:	fa843703          	ld	a4,-88(s0)
    800027ea:	77fd                	lui	a5,0xfffff
    800027ec:	8ff9                	and	a5,a5,a4
    800027ee:	fcf43823          	sd	a5,-48(s0)
    pa0 = walkaddr(pagetable, va0);
    800027f2:	fd043583          	ld	a1,-48(s0)
    800027f6:	fb843503          	ld	a0,-72(s0)
    800027fa:	fffff097          	auipc	ra,0xfffff
    800027fe:	6ae080e7          	jalr	1710(ra) # 80001ea8 <walkaddr>
    80002802:	fca43423          	sd	a0,-56(s0)
    if(pa0 == 0)
    80002806:	fc843783          	ld	a5,-56(s0)
    8000280a:	e399                	bnez	a5,80002810 <copyinstr+0x48>
      return -1;
    8000280c:	57fd                	li	a5,-1
    8000280e:	a87d                	j	800028cc <copyinstr+0x104>
    n = PGSIZE - (srcva - va0);
    80002810:	fd043703          	ld	a4,-48(s0)
    80002814:	fa843783          	ld	a5,-88(s0)
    80002818:	8f1d                	sub	a4,a4,a5
    8000281a:	6785                	lui	a5,0x1
    8000281c:	97ba                	add	a5,a5,a4
    8000281e:	fef43423          	sd	a5,-24(s0)
    if(n > max)
    80002822:	fe843703          	ld	a4,-24(s0)
    80002826:	fa043783          	ld	a5,-96(s0)
    8000282a:	00e7f663          	bgeu	a5,a4,80002836 <copyinstr+0x6e>
      n = max;
    8000282e:	fa043783          	ld	a5,-96(s0)
    80002832:	fef43423          	sd	a5,-24(s0)

    char *p = (char *) (pa0 + (srcva - va0));
    80002836:	fa843703          	ld	a4,-88(s0)
    8000283a:	fd043783          	ld	a5,-48(s0)
    8000283e:	8f1d                	sub	a4,a4,a5
    80002840:	fc843783          	ld	a5,-56(s0)
    80002844:	97ba                	add	a5,a5,a4
    80002846:	fcf43c23          	sd	a5,-40(s0)
    while(n > 0){
    8000284a:	a891                	j	8000289e <copyinstr+0xd6>
      if(*p == '\0'){
    8000284c:	fd843783          	ld	a5,-40(s0)
    80002850:	0007c783          	lbu	a5,0(a5) # 1000 <_entry-0x7ffff000>
    80002854:	eb89                	bnez	a5,80002866 <copyinstr+0x9e>
        *dst = '\0';
    80002856:	fb043783          	ld	a5,-80(s0)
    8000285a:	00078023          	sb	zero,0(a5)
        got_null = 1;
    8000285e:	4785                	li	a5,1
    80002860:	fef42223          	sw	a5,-28(s0)
        break;
    80002864:	a081                	j	800028a4 <copyinstr+0xdc>
      } else {
        *dst = *p;
    80002866:	fd843783          	ld	a5,-40(s0)
    8000286a:	0007c703          	lbu	a4,0(a5)
    8000286e:	fb043783          	ld	a5,-80(s0)
    80002872:	00e78023          	sb	a4,0(a5)
      }
      --n;
    80002876:	fe843783          	ld	a5,-24(s0)
    8000287a:	17fd                	addi	a5,a5,-1
    8000287c:	fef43423          	sd	a5,-24(s0)
      --max;
    80002880:	fa043783          	ld	a5,-96(s0)
    80002884:	17fd                	addi	a5,a5,-1
    80002886:	faf43023          	sd	a5,-96(s0)
      p++;
    8000288a:	fd843783          	ld	a5,-40(s0)
    8000288e:	0785                	addi	a5,a5,1
    80002890:	fcf43c23          	sd	a5,-40(s0)
      dst++;
    80002894:	fb043783          	ld	a5,-80(s0)
    80002898:	0785                	addi	a5,a5,1
    8000289a:	faf43823          	sd	a5,-80(s0)
    while(n > 0){
    8000289e:	fe843783          	ld	a5,-24(s0)
    800028a2:	f7cd                	bnez	a5,8000284c <copyinstr+0x84>
    }

    srcva = va0 + PGSIZE;
    800028a4:	fd043703          	ld	a4,-48(s0)
    800028a8:	6785                	lui	a5,0x1
    800028aa:	97ba                	add	a5,a5,a4
    800028ac:	faf43423          	sd	a5,-88(s0)
  while(got_null == 0 && max > 0){
    800028b0:	fe442783          	lw	a5,-28(s0)
    800028b4:	2781                	sext.w	a5,a5
    800028b6:	e781                	bnez	a5,800028be <copyinstr+0xf6>
    800028b8:	fa043783          	ld	a5,-96(s0)
    800028bc:	f78d                	bnez	a5,800027e6 <copyinstr+0x1e>
  }
  if(got_null){
    800028be:	fe442783          	lw	a5,-28(s0)
    800028c2:	2781                	sext.w	a5,a5
    800028c4:	c399                	beqz	a5,800028ca <copyinstr+0x102>
    return 0;
    800028c6:	4781                	li	a5,0
    800028c8:	a011                	j	800028cc <copyinstr+0x104>
  } else {
    return -1;
    800028ca:	57fd                	li	a5,-1
  }
}
    800028cc:	853e                	mv	a0,a5
    800028ce:	60e6                	ld	ra,88(sp)
    800028d0:	6446                	ld	s0,80(sp)
    800028d2:	6125                	addi	sp,sp,96
    800028d4:	8082                	ret

00000000800028d6 <r_sstatus>:
{
    800028d6:	1101                	addi	sp,sp,-32
    800028d8:	ec22                	sd	s0,24(sp)
    800028da:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    800028dc:	100027f3          	csrr	a5,sstatus
    800028e0:	fef43423          	sd	a5,-24(s0)
  return x;
    800028e4:	fe843783          	ld	a5,-24(s0)
}
    800028e8:	853e                	mv	a0,a5
    800028ea:	6462                	ld	s0,24(sp)
    800028ec:	6105                	addi	sp,sp,32
    800028ee:	8082                	ret

00000000800028f0 <w_sstatus>:
{
    800028f0:	1101                	addi	sp,sp,-32
    800028f2:	ec22                	sd	s0,24(sp)
    800028f4:	1000                	addi	s0,sp,32
    800028f6:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    800028fa:	fe843783          	ld	a5,-24(s0)
    800028fe:	10079073          	csrw	sstatus,a5
}
    80002902:	0001                	nop
    80002904:	6462                	ld	s0,24(sp)
    80002906:	6105                	addi	sp,sp,32
    80002908:	8082                	ret

000000008000290a <intr_on>:
{
    8000290a:	1141                	addi	sp,sp,-16
    8000290c:	e406                	sd	ra,8(sp)
    8000290e:	e022                	sd	s0,0(sp)
    80002910:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80002912:	00000097          	auipc	ra,0x0
    80002916:	fc4080e7          	jalr	-60(ra) # 800028d6 <r_sstatus>
    8000291a:	87aa                	mv	a5,a0
    8000291c:	0027e793          	ori	a5,a5,2
    80002920:	853e                	mv	a0,a5
    80002922:	00000097          	auipc	ra,0x0
    80002926:	fce080e7          	jalr	-50(ra) # 800028f0 <w_sstatus>
}
    8000292a:	0001                	nop
    8000292c:	60a2                	ld	ra,8(sp)
    8000292e:	6402                	ld	s0,0(sp)
    80002930:	0141                	addi	sp,sp,16
    80002932:	8082                	ret

0000000080002934 <intr_get>:
{
    80002934:	1101                	addi	sp,sp,-32
    80002936:	ec06                	sd	ra,24(sp)
    80002938:	e822                	sd	s0,16(sp)
    8000293a:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    8000293c:	00000097          	auipc	ra,0x0
    80002940:	f9a080e7          	jalr	-102(ra) # 800028d6 <r_sstatus>
    80002944:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80002948:	fe843783          	ld	a5,-24(s0)
    8000294c:	8b89                	andi	a5,a5,2
    8000294e:	00f037b3          	snez	a5,a5
    80002952:	0ff7f793          	andi	a5,a5,255
    80002956:	2781                	sext.w	a5,a5
}
    80002958:	853e                	mv	a0,a5
    8000295a:	60e2                	ld	ra,24(sp)
    8000295c:	6442                	ld	s0,16(sp)
    8000295e:	6105                	addi	sp,sp,32
    80002960:	8082                	ret

0000000080002962 <r_tp>:
{
    80002962:	1101                	addi	sp,sp,-32
    80002964:	ec22                	sd	s0,24(sp)
    80002966:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80002968:	8792                	mv	a5,tp
    8000296a:	fef43423          	sd	a5,-24(s0)
  return x;
    8000296e:	fe843783          	ld	a5,-24(s0)
}
    80002972:	853e                	mv	a0,a5
    80002974:	6462                	ld	s0,24(sp)
    80002976:	6105                	addi	sp,sp,32
    80002978:	8082                	ret

000000008000297a <proc_mapstacks>:
// Allocate a page for each process's kernel stack.
// Map it high in memory, followed by an invalid
// guard page.
void
proc_mapstacks(pagetable_t kpgtbl)
{
    8000297a:	7139                	addi	sp,sp,-64
    8000297c:	fc06                	sd	ra,56(sp)
    8000297e:	f822                	sd	s0,48(sp)
    80002980:	0080                	addi	s0,sp,64
    80002982:	fca43423          	sd	a0,-56(s0)
  struct proc *p;
  
  for(p = proc; p < &proc[NPROC]; p++) {
    80002986:	00022797          	auipc	a5,0x22
    8000298a:	63278793          	addi	a5,a5,1586 # 80024fb8 <proc>
    8000298e:	fef43423          	sd	a5,-24(s0)
    80002992:	a061                	j	80002a1a <proc_mapstacks+0xa0>
    char *pa = kalloc();
    80002994:	fffff097          	auipc	ra,0xfffff
    80002998:	842080e7          	jalr	-1982(ra) # 800011d6 <kalloc>
    8000299c:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800029a0:	fe043783          	ld	a5,-32(s0)
    800029a4:	eb89                	bnez	a5,800029b6 <proc_mapstacks+0x3c>
      panic("kalloc");
    800029a6:	0000a517          	auipc	a0,0xa
    800029aa:	83250513          	addi	a0,a0,-1998 # 8000c1d8 <etext+0x1d8>
    800029ae:	ffffe097          	auipc	ra,0xffffe
    800029b2:	2de080e7          	jalr	734(ra) # 80000c8c <panic>
    uint64 va = KSTACK((int) (p - proc));
    800029b6:	fe843703          	ld	a4,-24(s0)
    800029ba:	00022797          	auipc	a5,0x22
    800029be:	5fe78793          	addi	a5,a5,1534 # 80024fb8 <proc>
    800029c2:	40f707b3          	sub	a5,a4,a5
    800029c6:	4037d713          	srai	a4,a5,0x3
    800029ca:	0000a797          	auipc	a5,0xa
    800029ce:	90678793          	addi	a5,a5,-1786 # 8000c2d0 <etext+0x2d0>
    800029d2:	639c                	ld	a5,0(a5)
    800029d4:	02f707b3          	mul	a5,a4,a5
    800029d8:	2781                	sext.w	a5,a5
    800029da:	2785                	addiw	a5,a5,1
    800029dc:	2781                	sext.w	a5,a5
    800029de:	00d7979b          	slliw	a5,a5,0xd
    800029e2:	2781                	sext.w	a5,a5
    800029e4:	873e                	mv	a4,a5
    800029e6:	040007b7          	lui	a5,0x4000
    800029ea:	17fd                	addi	a5,a5,-1
    800029ec:	07b2                	slli	a5,a5,0xc
    800029ee:	8f99                	sub	a5,a5,a4
    800029f0:	fcf43c23          	sd	a5,-40(s0)
    kvmmap(kpgtbl, va, (uint64)pa, PGSIZE, PTE_R | PTE_W);
    800029f4:	fe043783          	ld	a5,-32(s0)
    800029f8:	4719                	li	a4,6
    800029fa:	6685                	lui	a3,0x1
    800029fc:	863e                	mv	a2,a5
    800029fe:	fd843583          	ld	a1,-40(s0)
    80002a02:	fc843503          	ld	a0,-56(s0)
    80002a06:	fffff097          	auipc	ra,0xfffff
    80002a0a:	51a080e7          	jalr	1306(ra) # 80001f20 <kvmmap>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002a0e:	fe843783          	ld	a5,-24(s0)
    80002a12:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002a16:	fef43423          	sd	a5,-24(s0)
    80002a1a:	fe843703          	ld	a4,-24(s0)
    80002a1e:	00028797          	auipc	a5,0x28
    80002a22:	f9a78793          	addi	a5,a5,-102 # 8002a9b8 <pid_lock>
    80002a26:	f6f767e3          	bltu	a4,a5,80002994 <proc_mapstacks+0x1a>
  }
}
    80002a2a:	0001                	nop
    80002a2c:	0001                	nop
    80002a2e:	70e2                	ld	ra,56(sp)
    80002a30:	7442                	ld	s0,48(sp)
    80002a32:	6121                	addi	sp,sp,64
    80002a34:	8082                	ret

0000000080002a36 <procinit>:

// initialize the proc table.
void
procinit(void)
{
    80002a36:	1101                	addi	sp,sp,-32
    80002a38:	ec06                	sd	ra,24(sp)
    80002a3a:	e822                	sd	s0,16(sp)
    80002a3c:	1000                	addi	s0,sp,32
  struct proc *p;
  
  initlock(&pid_lock, "nextpid");
    80002a3e:	00009597          	auipc	a1,0x9
    80002a42:	7a258593          	addi	a1,a1,1954 # 8000c1e0 <etext+0x1e0>
    80002a46:	00028517          	auipc	a0,0x28
    80002a4a:	f7250513          	addi	a0,a0,-142 # 8002a9b8 <pid_lock>
    80002a4e:	fffff097          	auipc	ra,0xfffff
    80002a52:	8ac080e7          	jalr	-1876(ra) # 800012fa <initlock>
  initlock(&wait_lock, "wait_lock");
    80002a56:	00009597          	auipc	a1,0x9
    80002a5a:	79258593          	addi	a1,a1,1938 # 8000c1e8 <etext+0x1e8>
    80002a5e:	00028517          	auipc	a0,0x28
    80002a62:	f7250513          	addi	a0,a0,-142 # 8002a9d0 <wait_lock>
    80002a66:	fffff097          	auipc	ra,0xfffff
    80002a6a:	894080e7          	jalr	-1900(ra) # 800012fa <initlock>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002a6e:	00022797          	auipc	a5,0x22
    80002a72:	54a78793          	addi	a5,a5,1354 # 80024fb8 <proc>
    80002a76:	fef43423          	sd	a5,-24(s0)
    80002a7a:	a0bd                	j	80002ae8 <procinit+0xb2>
      initlock(&p->lock, "proc");
    80002a7c:	fe843783          	ld	a5,-24(s0)
    80002a80:	00009597          	auipc	a1,0x9
    80002a84:	77858593          	addi	a1,a1,1912 # 8000c1f8 <etext+0x1f8>
    80002a88:	853e                	mv	a0,a5
    80002a8a:	fffff097          	auipc	ra,0xfffff
    80002a8e:	870080e7          	jalr	-1936(ra) # 800012fa <initlock>
      p->state = UNUSED;
    80002a92:	fe843783          	ld	a5,-24(s0)
    80002a96:	0007ac23          	sw	zero,24(a5)
      p->kstack = KSTACK((int) (p - proc));
    80002a9a:	fe843703          	ld	a4,-24(s0)
    80002a9e:	00022797          	auipc	a5,0x22
    80002aa2:	51a78793          	addi	a5,a5,1306 # 80024fb8 <proc>
    80002aa6:	40f707b3          	sub	a5,a4,a5
    80002aaa:	4037d713          	srai	a4,a5,0x3
    80002aae:	0000a797          	auipc	a5,0xa
    80002ab2:	82278793          	addi	a5,a5,-2014 # 8000c2d0 <etext+0x2d0>
    80002ab6:	639c                	ld	a5,0(a5)
    80002ab8:	02f707b3          	mul	a5,a4,a5
    80002abc:	2781                	sext.w	a5,a5
    80002abe:	2785                	addiw	a5,a5,1
    80002ac0:	2781                	sext.w	a5,a5
    80002ac2:	00d7979b          	slliw	a5,a5,0xd
    80002ac6:	2781                	sext.w	a5,a5
    80002ac8:	873e                	mv	a4,a5
    80002aca:	040007b7          	lui	a5,0x4000
    80002ace:	17fd                	addi	a5,a5,-1
    80002ad0:	07b2                	slli	a5,a5,0xc
    80002ad2:	8f99                	sub	a5,a5,a4
    80002ad4:	873e                	mv	a4,a5
    80002ad6:	fe843783          	ld	a5,-24(s0)
    80002ada:	e3b8                	sd	a4,64(a5)
  for(p = proc; p < &proc[NPROC]; p++) {
    80002adc:	fe843783          	ld	a5,-24(s0)
    80002ae0:	16878793          	addi	a5,a5,360 # 4000168 <_entry-0x7bfffe98>
    80002ae4:	fef43423          	sd	a5,-24(s0)
    80002ae8:	fe843703          	ld	a4,-24(s0)
    80002aec:	00028797          	auipc	a5,0x28
    80002af0:	ecc78793          	addi	a5,a5,-308 # 8002a9b8 <pid_lock>
    80002af4:	f8f764e3          	bltu	a4,a5,80002a7c <procinit+0x46>
  }
}
    80002af8:	0001                	nop
    80002afa:	0001                	nop
    80002afc:	60e2                	ld	ra,24(sp)
    80002afe:	6442                	ld	s0,16(sp)
    80002b00:	6105                	addi	sp,sp,32
    80002b02:	8082                	ret

0000000080002b04 <cpuid>:
// Must be called with interrupts disabled,
// to prevent race with process being moved
// to a different CPU.
int
cpuid()
{
    80002b04:	1101                	addi	sp,sp,-32
    80002b06:	ec06                	sd	ra,24(sp)
    80002b08:	e822                	sd	s0,16(sp)
    80002b0a:	1000                	addi	s0,sp,32
  int id = r_tp();
    80002b0c:	00000097          	auipc	ra,0x0
    80002b10:	e56080e7          	jalr	-426(ra) # 80002962 <r_tp>
    80002b14:	87aa                	mv	a5,a0
    80002b16:	fef42623          	sw	a5,-20(s0)
  return id;
    80002b1a:	fec42783          	lw	a5,-20(s0)
}
    80002b1e:	853e                	mv	a0,a5
    80002b20:	60e2                	ld	ra,24(sp)
    80002b22:	6442                	ld	s0,16(sp)
    80002b24:	6105                	addi	sp,sp,32
    80002b26:	8082                	ret

0000000080002b28 <mycpu>:

// Return this CPU's cpu struct.
// Interrupts must be disabled.
struct cpu*
mycpu(void)
{
    80002b28:	1101                	addi	sp,sp,-32
    80002b2a:	ec06                	sd	ra,24(sp)
    80002b2c:	e822                	sd	s0,16(sp)
    80002b2e:	1000                	addi	s0,sp,32
  int id = cpuid();
    80002b30:	00000097          	auipc	ra,0x0
    80002b34:	fd4080e7          	jalr	-44(ra) # 80002b04 <cpuid>
    80002b38:	87aa                	mv	a5,a0
    80002b3a:	fef42623          	sw	a5,-20(s0)
  struct cpu *c = &cpus[id];
    80002b3e:	fec42783          	lw	a5,-20(s0)
    80002b42:	00779713          	slli	a4,a5,0x7
    80002b46:	00022797          	auipc	a5,0x22
    80002b4a:	07278793          	addi	a5,a5,114 # 80024bb8 <cpus>
    80002b4e:	97ba                	add	a5,a5,a4
    80002b50:	fef43023          	sd	a5,-32(s0)
  return c;
    80002b54:	fe043783          	ld	a5,-32(s0)
}
    80002b58:	853e                	mv	a0,a5
    80002b5a:	60e2                	ld	ra,24(sp)
    80002b5c:	6442                	ld	s0,16(sp)
    80002b5e:	6105                	addi	sp,sp,32
    80002b60:	8082                	ret

0000000080002b62 <myproc>:

// Return the current struct proc *, or zero if none.
struct proc*
myproc(void)
{
    80002b62:	1101                	addi	sp,sp,-32
    80002b64:	ec06                	sd	ra,24(sp)
    80002b66:	e822                	sd	s0,16(sp)
    80002b68:	1000                	addi	s0,sp,32
  push_off();
    80002b6a:	fffff097          	auipc	ra,0xfffff
    80002b6e:	8be080e7          	jalr	-1858(ra) # 80001428 <push_off>
  struct cpu *c = mycpu();
    80002b72:	00000097          	auipc	ra,0x0
    80002b76:	fb6080e7          	jalr	-74(ra) # 80002b28 <mycpu>
    80002b7a:	fea43423          	sd	a0,-24(s0)
  struct proc *p = c->proc;
    80002b7e:	fe843783          	ld	a5,-24(s0)
    80002b82:	639c                	ld	a5,0(a5)
    80002b84:	fef43023          	sd	a5,-32(s0)
  pop_off();
    80002b88:	fffff097          	auipc	ra,0xfffff
    80002b8c:	8f8080e7          	jalr	-1800(ra) # 80001480 <pop_off>
  return p;
    80002b90:	fe043783          	ld	a5,-32(s0)
}
    80002b94:	853e                	mv	a0,a5
    80002b96:	60e2                	ld	ra,24(sp)
    80002b98:	6442                	ld	s0,16(sp)
    80002b9a:	6105                	addi	sp,sp,32
    80002b9c:	8082                	ret

0000000080002b9e <allocpid>:

int
allocpid()
{
    80002b9e:	1101                	addi	sp,sp,-32
    80002ba0:	ec06                	sd	ra,24(sp)
    80002ba2:	e822                	sd	s0,16(sp)
    80002ba4:	1000                	addi	s0,sp,32
  int pid;
  
  acquire(&pid_lock);
    80002ba6:	00028517          	auipc	a0,0x28
    80002baa:	e1250513          	addi	a0,a0,-494 # 8002a9b8 <pid_lock>
    80002bae:	ffffe097          	auipc	ra,0xffffe
    80002bb2:	77c080e7          	jalr	1916(ra) # 8000132a <acquire>
  pid = nextpid;
    80002bb6:	0000a797          	auipc	a5,0xa
    80002bba:	c0a78793          	addi	a5,a5,-1014 # 8000c7c0 <nextpid>
    80002bbe:	439c                	lw	a5,0(a5)
    80002bc0:	fef42623          	sw	a5,-20(s0)
  nextpid = nextpid + 1;
    80002bc4:	0000a797          	auipc	a5,0xa
    80002bc8:	bfc78793          	addi	a5,a5,-1028 # 8000c7c0 <nextpid>
    80002bcc:	439c                	lw	a5,0(a5)
    80002bce:	2785                	addiw	a5,a5,1
    80002bd0:	0007871b          	sext.w	a4,a5
    80002bd4:	0000a797          	auipc	a5,0xa
    80002bd8:	bec78793          	addi	a5,a5,-1044 # 8000c7c0 <nextpid>
    80002bdc:	c398                	sw	a4,0(a5)
  release(&pid_lock);
    80002bde:	00028517          	auipc	a0,0x28
    80002be2:	dda50513          	addi	a0,a0,-550 # 8002a9b8 <pid_lock>
    80002be6:	ffffe097          	auipc	ra,0xffffe
    80002bea:	7a8080e7          	jalr	1960(ra) # 8000138e <release>

  return pid;
    80002bee:	fec42783          	lw	a5,-20(s0)
}
    80002bf2:	853e                	mv	a0,a5
    80002bf4:	60e2                	ld	ra,24(sp)
    80002bf6:	6442                	ld	s0,16(sp)
    80002bf8:	6105                	addi	sp,sp,32
    80002bfa:	8082                	ret

0000000080002bfc <allocproc>:
// If found, initialize state required to run in the kernel,
// and return with p->lock held.
// If there are no free procs, or a memory allocation fails, return 0.
static struct proc*
allocproc(void)
{
    80002bfc:	1101                	addi	sp,sp,-32
    80002bfe:	ec06                	sd	ra,24(sp)
    80002c00:	e822                	sd	s0,16(sp)
    80002c02:	1000                	addi	s0,sp,32
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    80002c04:	00022797          	auipc	a5,0x22
    80002c08:	3b478793          	addi	a5,a5,948 # 80024fb8 <proc>
    80002c0c:	fef43423          	sd	a5,-24(s0)
    80002c10:	a80d                	j	80002c42 <allocproc+0x46>
    acquire(&p->lock);
    80002c12:	fe843783          	ld	a5,-24(s0)
    80002c16:	853e                	mv	a0,a5
    80002c18:	ffffe097          	auipc	ra,0xffffe
    80002c1c:	712080e7          	jalr	1810(ra) # 8000132a <acquire>
    if(p->state == UNUSED) {
    80002c20:	fe843783          	ld	a5,-24(s0)
    80002c24:	4f9c                	lw	a5,24(a5)
    80002c26:	cb85                	beqz	a5,80002c56 <allocproc+0x5a>
      goto found;
    } else {
      release(&p->lock);
    80002c28:	fe843783          	ld	a5,-24(s0)
    80002c2c:	853e                	mv	a0,a5
    80002c2e:	ffffe097          	auipc	ra,0xffffe
    80002c32:	760080e7          	jalr	1888(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++) {
    80002c36:	fe843783          	ld	a5,-24(s0)
    80002c3a:	16878793          	addi	a5,a5,360
    80002c3e:	fef43423          	sd	a5,-24(s0)
    80002c42:	fe843703          	ld	a4,-24(s0)
    80002c46:	00028797          	auipc	a5,0x28
    80002c4a:	d7278793          	addi	a5,a5,-654 # 8002a9b8 <pid_lock>
    80002c4e:	fcf762e3          	bltu	a4,a5,80002c12 <allocproc+0x16>
    }
  }
  return 0;
    80002c52:	4781                	li	a5,0
    80002c54:	a0e1                	j	80002d1c <allocproc+0x120>
      goto found;
    80002c56:	0001                	nop

found:
  p->pid = allocpid();
    80002c58:	00000097          	auipc	ra,0x0
    80002c5c:	f46080e7          	jalr	-186(ra) # 80002b9e <allocpid>
    80002c60:	87aa                	mv	a5,a0
    80002c62:	873e                	mv	a4,a5
    80002c64:	fe843783          	ld	a5,-24(s0)
    80002c68:	db98                	sw	a4,48(a5)
  p->state = USED;
    80002c6a:	fe843783          	ld	a5,-24(s0)
    80002c6e:	4705                	li	a4,1
    80002c70:	cf98                	sw	a4,24(a5)

  // Allocate a trapframe page.
  if((p->trapframe = (struct trapframe *)kalloc()) == 0){
    80002c72:	ffffe097          	auipc	ra,0xffffe
    80002c76:	564080e7          	jalr	1380(ra) # 800011d6 <kalloc>
    80002c7a:	872a                	mv	a4,a0
    80002c7c:	fe843783          	ld	a5,-24(s0)
    80002c80:	efb8                	sd	a4,88(a5)
    80002c82:	fe843783          	ld	a5,-24(s0)
    80002c86:	6fbc                	ld	a5,88(a5)
    80002c88:	e385                	bnez	a5,80002ca8 <allocproc+0xac>
    freeproc(p);
    80002c8a:	fe843503          	ld	a0,-24(s0)
    80002c8e:	00000097          	auipc	ra,0x0
    80002c92:	098080e7          	jalr	152(ra) # 80002d26 <freeproc>
    release(&p->lock);
    80002c96:	fe843783          	ld	a5,-24(s0)
    80002c9a:	853e                	mv	a0,a5
    80002c9c:	ffffe097          	auipc	ra,0xffffe
    80002ca0:	6f2080e7          	jalr	1778(ra) # 8000138e <release>
    return 0;
    80002ca4:	4781                	li	a5,0
    80002ca6:	a89d                	j	80002d1c <allocproc+0x120>
  }

  // An empty user page table.
  p->pagetable = proc_pagetable(p);
    80002ca8:	fe843503          	ld	a0,-24(s0)
    80002cac:	00000097          	auipc	ra,0x0
    80002cb0:	118080e7          	jalr	280(ra) # 80002dc4 <proc_pagetable>
    80002cb4:	872a                	mv	a4,a0
    80002cb6:	fe843783          	ld	a5,-24(s0)
    80002cba:	ebb8                	sd	a4,80(a5)
  if(p->pagetable == 0){
    80002cbc:	fe843783          	ld	a5,-24(s0)
    80002cc0:	6bbc                	ld	a5,80(a5)
    80002cc2:	e385                	bnez	a5,80002ce2 <allocproc+0xe6>
    freeproc(p);
    80002cc4:	fe843503          	ld	a0,-24(s0)
    80002cc8:	00000097          	auipc	ra,0x0
    80002ccc:	05e080e7          	jalr	94(ra) # 80002d26 <freeproc>
    release(&p->lock);
    80002cd0:	fe843783          	ld	a5,-24(s0)
    80002cd4:	853e                	mv	a0,a5
    80002cd6:	ffffe097          	auipc	ra,0xffffe
    80002cda:	6b8080e7          	jalr	1720(ra) # 8000138e <release>
    return 0;
    80002cde:	4781                	li	a5,0
    80002ce0:	a835                	j	80002d1c <allocproc+0x120>
  }

  // Set up new context to start executing at forkret,
  // which returns to user space.
  memset(&p->context, 0, sizeof(p->context));
    80002ce2:	fe843783          	ld	a5,-24(s0)
    80002ce6:	06078793          	addi	a5,a5,96
    80002cea:	07000613          	li	a2,112
    80002cee:	4581                	li	a1,0
    80002cf0:	853e                	mv	a0,a5
    80002cf2:	fffff097          	auipc	ra,0xfffff
    80002cf6:	80c080e7          	jalr	-2036(ra) # 800014fe <memset>
  p->context.ra = (uint64)forkret;
    80002cfa:	00001717          	auipc	a4,0x1
    80002cfe:	9da70713          	addi	a4,a4,-1574 # 800036d4 <forkret>
    80002d02:	fe843783          	ld	a5,-24(s0)
    80002d06:	f3b8                	sd	a4,96(a5)
  p->context.sp = p->kstack + PGSIZE;
    80002d08:	fe843783          	ld	a5,-24(s0)
    80002d0c:	63b8                	ld	a4,64(a5)
    80002d0e:	6785                	lui	a5,0x1
    80002d10:	973e                	add	a4,a4,a5
    80002d12:	fe843783          	ld	a5,-24(s0)
    80002d16:	f7b8                	sd	a4,104(a5)

  return p;
    80002d18:	fe843783          	ld	a5,-24(s0)
}
    80002d1c:	853e                	mv	a0,a5
    80002d1e:	60e2                	ld	ra,24(sp)
    80002d20:	6442                	ld	s0,16(sp)
    80002d22:	6105                	addi	sp,sp,32
    80002d24:	8082                	ret

0000000080002d26 <freeproc>:
// free a proc structure and the data hanging from it,
// including user pages.
// p->lock must be held.
static void
freeproc(struct proc *p)
{
    80002d26:	1101                	addi	sp,sp,-32
    80002d28:	ec06                	sd	ra,24(sp)
    80002d2a:	e822                	sd	s0,16(sp)
    80002d2c:	1000                	addi	s0,sp,32
    80002d2e:	fea43423          	sd	a0,-24(s0)
  if(p->trapframe)
    80002d32:	fe843783          	ld	a5,-24(s0)
    80002d36:	6fbc                	ld	a5,88(a5)
    80002d38:	cb89                	beqz	a5,80002d4a <freeproc+0x24>
    kfree((void*)p->trapframe);
    80002d3a:	fe843783          	ld	a5,-24(s0)
    80002d3e:	6fbc                	ld	a5,88(a5)
    80002d40:	853e                	mv	a0,a5
    80002d42:	ffffe097          	auipc	ra,0xffffe
    80002d46:	3ee080e7          	jalr	1006(ra) # 80001130 <kfree>
  p->trapframe = 0;
    80002d4a:	fe843783          	ld	a5,-24(s0)
    80002d4e:	0407bc23          	sd	zero,88(a5) # 1058 <_entry-0x7fffefa8>
  if(p->pagetable)
    80002d52:	fe843783          	ld	a5,-24(s0)
    80002d56:	6bbc                	ld	a5,80(a5)
    80002d58:	cf89                	beqz	a5,80002d72 <freeproc+0x4c>
    proc_freepagetable(p->pagetable, p->sz);
    80002d5a:	fe843783          	ld	a5,-24(s0)
    80002d5e:	6bb8                	ld	a4,80(a5)
    80002d60:	fe843783          	ld	a5,-24(s0)
    80002d64:	67bc                	ld	a5,72(a5)
    80002d66:	85be                	mv	a1,a5
    80002d68:	853a                	mv	a0,a4
    80002d6a:	00000097          	auipc	ra,0x0
    80002d6e:	11a080e7          	jalr	282(ra) # 80002e84 <proc_freepagetable>
  p->pagetable = 0;
    80002d72:	fe843783          	ld	a5,-24(s0)
    80002d76:	0407b823          	sd	zero,80(a5)
  p->sz = 0;
    80002d7a:	fe843783          	ld	a5,-24(s0)
    80002d7e:	0407b423          	sd	zero,72(a5)
  p->pid = 0;
    80002d82:	fe843783          	ld	a5,-24(s0)
    80002d86:	0207a823          	sw	zero,48(a5)
  p->parent = 0;
    80002d8a:	fe843783          	ld	a5,-24(s0)
    80002d8e:	0207bc23          	sd	zero,56(a5)
  p->name[0] = 0;
    80002d92:	fe843783          	ld	a5,-24(s0)
    80002d96:	14078c23          	sb	zero,344(a5)
  p->chan = 0;
    80002d9a:	fe843783          	ld	a5,-24(s0)
    80002d9e:	0207b023          	sd	zero,32(a5)
  p->killed = 0;
    80002da2:	fe843783          	ld	a5,-24(s0)
    80002da6:	0207a423          	sw	zero,40(a5)
  p->xstate = 0;
    80002daa:	fe843783          	ld	a5,-24(s0)
    80002dae:	0207a623          	sw	zero,44(a5)
  p->state = UNUSED;
    80002db2:	fe843783          	ld	a5,-24(s0)
    80002db6:	0007ac23          	sw	zero,24(a5)
}
    80002dba:	0001                	nop
    80002dbc:	60e2                	ld	ra,24(sp)
    80002dbe:	6442                	ld	s0,16(sp)
    80002dc0:	6105                	addi	sp,sp,32
    80002dc2:	8082                	ret

0000000080002dc4 <proc_pagetable>:

// Create a user page table for a given process, with no user memory,
// but with trampoline and trapframe pages.
pagetable_t
proc_pagetable(struct proc *p)
{
    80002dc4:	7179                	addi	sp,sp,-48
    80002dc6:	f406                	sd	ra,40(sp)
    80002dc8:	f022                	sd	s0,32(sp)
    80002dca:	1800                	addi	s0,sp,48
    80002dcc:	fca43c23          	sd	a0,-40(s0)
  pagetable_t pagetable;

  // An empty page table.
  pagetable = uvmcreate();
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	3a0080e7          	jalr	928(ra) # 80002170 <uvmcreate>
    80002dd8:	fea43423          	sd	a0,-24(s0)
  if(pagetable == 0)
    80002ddc:	fe843783          	ld	a5,-24(s0)
    80002de0:	e399                	bnez	a5,80002de6 <proc_pagetable+0x22>
    return 0;
    80002de2:	4781                	li	a5,0
    80002de4:	a859                	j	80002e7a <proc_pagetable+0xb6>

  // map the trampoline code (for system call return)
  // at the highest user virtual address.
  // only the supervisor uses it, on the way
  // to/from user space, so not PTE_U.
  if(mappages(pagetable, TRAMPOLINE, PGSIZE,
    80002de6:	00008797          	auipc	a5,0x8
    80002dea:	21a78793          	addi	a5,a5,538 # 8000b000 <_trampoline>
    80002dee:	4729                	li	a4,10
    80002df0:	86be                	mv	a3,a5
    80002df2:	6605                	lui	a2,0x1
    80002df4:	040007b7          	lui	a5,0x4000
    80002df8:	17fd                	addi	a5,a5,-1
    80002dfa:	00c79593          	slli	a1,a5,0xc
    80002dfe:	fe843503          	ld	a0,-24(s0)
    80002e02:	fffff097          	auipc	ra,0xfffff
    80002e06:	178080e7          	jalr	376(ra) # 80001f7a <mappages>
    80002e0a:	87aa                	mv	a5,a0
    80002e0c:	0007db63          	bgez	a5,80002e22 <proc_pagetable+0x5e>
              (uint64)trampoline, PTE_R | PTE_X) < 0){
    uvmfree(pagetable, 0);
    80002e10:	4581                	li	a1,0
    80002e12:	fe843503          	ld	a0,-24(s0)
    80002e16:	fffff097          	auipc	ra,0xfffff
    80002e1a:	656080e7          	jalr	1622(ra) # 8000246c <uvmfree>
    return 0;
    80002e1e:	4781                	li	a5,0
    80002e20:	a8a9                	j	80002e7a <proc_pagetable+0xb6>
  }

  // map the trapframe page just below the trampoline page, for
  // trampoline.S.
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
              (uint64)(p->trapframe), PTE_R | PTE_W) < 0){
    80002e22:	fd843783          	ld	a5,-40(s0)
    80002e26:	6fbc                	ld	a5,88(a5)
  if(mappages(pagetable, TRAPFRAME, PGSIZE,
    80002e28:	4719                	li	a4,6
    80002e2a:	86be                	mv	a3,a5
    80002e2c:	6605                	lui	a2,0x1
    80002e2e:	020007b7          	lui	a5,0x2000
    80002e32:	17fd                	addi	a5,a5,-1
    80002e34:	00d79593          	slli	a1,a5,0xd
    80002e38:	fe843503          	ld	a0,-24(s0)
    80002e3c:	fffff097          	auipc	ra,0xfffff
    80002e40:	13e080e7          	jalr	318(ra) # 80001f7a <mappages>
    80002e44:	87aa                	mv	a5,a0
    80002e46:	0207d863          	bgez	a5,80002e76 <proc_pagetable+0xb2>
    uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002e4a:	4681                	li	a3,0
    80002e4c:	4605                	li	a2,1
    80002e4e:	040007b7          	lui	a5,0x4000
    80002e52:	17fd                	addi	a5,a5,-1
    80002e54:	00c79593          	slli	a1,a5,0xc
    80002e58:	fe843503          	ld	a0,-24(s0)
    80002e5c:	fffff097          	auipc	ra,0xfffff
    80002e60:	208080e7          	jalr	520(ra) # 80002064 <uvmunmap>
    uvmfree(pagetable, 0);
    80002e64:	4581                	li	a1,0
    80002e66:	fe843503          	ld	a0,-24(s0)
    80002e6a:	fffff097          	auipc	ra,0xfffff
    80002e6e:	602080e7          	jalr	1538(ra) # 8000246c <uvmfree>
    return 0;
    80002e72:	4781                	li	a5,0
    80002e74:	a019                	j	80002e7a <proc_pagetable+0xb6>
  }

  return pagetable;
    80002e76:	fe843783          	ld	a5,-24(s0)
}
    80002e7a:	853e                	mv	a0,a5
    80002e7c:	70a2                	ld	ra,40(sp)
    80002e7e:	7402                	ld	s0,32(sp)
    80002e80:	6145                	addi	sp,sp,48
    80002e82:	8082                	ret

0000000080002e84 <proc_freepagetable>:

// Free a process's page table, and free the
// physical memory it refers to.
void
proc_freepagetable(pagetable_t pagetable, uint64 sz)
{
    80002e84:	1101                	addi	sp,sp,-32
    80002e86:	ec06                	sd	ra,24(sp)
    80002e88:	e822                	sd	s0,16(sp)
    80002e8a:	1000                	addi	s0,sp,32
    80002e8c:	fea43423          	sd	a0,-24(s0)
    80002e90:	feb43023          	sd	a1,-32(s0)
  uvmunmap(pagetable, TRAMPOLINE, 1, 0);
    80002e94:	4681                	li	a3,0
    80002e96:	4605                	li	a2,1
    80002e98:	040007b7          	lui	a5,0x4000
    80002e9c:	17fd                	addi	a5,a5,-1
    80002e9e:	00c79593          	slli	a1,a5,0xc
    80002ea2:	fe843503          	ld	a0,-24(s0)
    80002ea6:	fffff097          	auipc	ra,0xfffff
    80002eaa:	1be080e7          	jalr	446(ra) # 80002064 <uvmunmap>
  uvmunmap(pagetable, TRAPFRAME, 1, 0);
    80002eae:	4681                	li	a3,0
    80002eb0:	4605                	li	a2,1
    80002eb2:	020007b7          	lui	a5,0x2000
    80002eb6:	17fd                	addi	a5,a5,-1
    80002eb8:	00d79593          	slli	a1,a5,0xd
    80002ebc:	fe843503          	ld	a0,-24(s0)
    80002ec0:	fffff097          	auipc	ra,0xfffff
    80002ec4:	1a4080e7          	jalr	420(ra) # 80002064 <uvmunmap>
  uvmfree(pagetable, sz);
    80002ec8:	fe043583          	ld	a1,-32(s0)
    80002ecc:	fe843503          	ld	a0,-24(s0)
    80002ed0:	fffff097          	auipc	ra,0xfffff
    80002ed4:	59c080e7          	jalr	1436(ra) # 8000246c <uvmfree>
}
    80002ed8:	0001                	nop
    80002eda:	60e2                	ld	ra,24(sp)
    80002edc:	6442                	ld	s0,16(sp)
    80002ede:	6105                	addi	sp,sp,32
    80002ee0:	8082                	ret

0000000080002ee2 <userinit>:
};

// Set up first user process.
void
userinit(void)
{
    80002ee2:	1101                	addi	sp,sp,-32
    80002ee4:	ec06                	sd	ra,24(sp)
    80002ee6:	e822                	sd	s0,16(sp)
    80002ee8:	1000                	addi	s0,sp,32
  struct proc *p;

  p = allocproc();
    80002eea:	00000097          	auipc	ra,0x0
    80002eee:	d12080e7          	jalr	-750(ra) # 80002bfc <allocproc>
    80002ef2:	fea43423          	sd	a0,-24(s0)
  initproc = p;
    80002ef6:	0000a797          	auipc	a5,0xa
    80002efa:	a4a78793          	addi	a5,a5,-1462 # 8000c940 <initproc>
    80002efe:	fe843703          	ld	a4,-24(s0)
    80002f02:	e398                	sd	a4,0(a5)
  
  // allocate one user page and copy initcode's instructions
  // and data into it.
  uvmfirst(p->pagetable, initcode, sizeof(initcode));
    80002f04:	fe843783          	ld	a5,-24(s0)
    80002f08:	6bbc                	ld	a5,80(a5)
    80002f0a:	03400613          	li	a2,52
    80002f0e:	0000a597          	auipc	a1,0xa
    80002f12:	8da58593          	addi	a1,a1,-1830 # 8000c7e8 <initcode>
    80002f16:	853e                	mv	a0,a5
    80002f18:	fffff097          	auipc	ra,0xfffff
    80002f1c:	294080e7          	jalr	660(ra) # 800021ac <uvmfirst>
  p->sz = PGSIZE;
    80002f20:	fe843783          	ld	a5,-24(s0)
    80002f24:	6705                	lui	a4,0x1
    80002f26:	e7b8                	sd	a4,72(a5)

  // prepare for the very first "return" from kernel to user.
  p->trapframe->epc = 0;      // user program counter
    80002f28:	fe843783          	ld	a5,-24(s0)
    80002f2c:	6fbc                	ld	a5,88(a5)
    80002f2e:	0007bc23          	sd	zero,24(a5)
  p->trapframe->sp = PGSIZE;  // user stack pointer
    80002f32:	fe843783          	ld	a5,-24(s0)
    80002f36:	6fbc                	ld	a5,88(a5)
    80002f38:	6705                	lui	a4,0x1
    80002f3a:	fb98                	sd	a4,48(a5)

  safestrcpy(p->name, "initcode", sizeof(p->name));
    80002f3c:	fe843783          	ld	a5,-24(s0)
    80002f40:	15878793          	addi	a5,a5,344
    80002f44:	4641                	li	a2,16
    80002f46:	00009597          	auipc	a1,0x9
    80002f4a:	2ba58593          	addi	a1,a1,698 # 8000c200 <etext+0x200>
    80002f4e:	853e                	mv	a0,a5
    80002f50:	fffff097          	auipc	ra,0xfffff
    80002f54:	8b2080e7          	jalr	-1870(ra) # 80001802 <safestrcpy>
  p->cwd = namei("/");
    80002f58:	00009517          	auipc	a0,0x9
    80002f5c:	2b850513          	addi	a0,a0,696 # 8000c210 <etext+0x210>
    80002f60:	00003097          	auipc	ra,0x3
    80002f64:	1ae080e7          	jalr	430(ra) # 8000610e <namei>
    80002f68:	872a                	mv	a4,a0
    80002f6a:	fe843783          	ld	a5,-24(s0)
    80002f6e:	14e7b823          	sd	a4,336(a5)

  p->state = RUNNABLE;
    80002f72:	fe843783          	ld	a5,-24(s0)
    80002f76:	470d                	li	a4,3
    80002f78:	cf98                	sw	a4,24(a5)

  release(&p->lock);
    80002f7a:	fe843783          	ld	a5,-24(s0)
    80002f7e:	853e                	mv	a0,a5
    80002f80:	ffffe097          	auipc	ra,0xffffe
    80002f84:	40e080e7          	jalr	1038(ra) # 8000138e <release>
}
    80002f88:	0001                	nop
    80002f8a:	60e2                	ld	ra,24(sp)
    80002f8c:	6442                	ld	s0,16(sp)
    80002f8e:	6105                	addi	sp,sp,32
    80002f90:	8082                	ret

0000000080002f92 <growproc>:

// Grow or shrink user memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
    80002f92:	7179                	addi	sp,sp,-48
    80002f94:	f406                	sd	ra,40(sp)
    80002f96:	f022                	sd	s0,32(sp)
    80002f98:	1800                	addi	s0,sp,48
    80002f9a:	87aa                	mv	a5,a0
    80002f9c:	fcf42e23          	sw	a5,-36(s0)
  uint64 sz;
  struct proc *p = myproc();
    80002fa0:	00000097          	auipc	ra,0x0
    80002fa4:	bc2080e7          	jalr	-1086(ra) # 80002b62 <myproc>
    80002fa8:	fea43023          	sd	a0,-32(s0)

  sz = p->sz;
    80002fac:	fe043783          	ld	a5,-32(s0)
    80002fb0:	67bc                	ld	a5,72(a5)
    80002fb2:	fef43423          	sd	a5,-24(s0)
  if(n > 0){
    80002fb6:	fdc42783          	lw	a5,-36(s0)
    80002fba:	2781                	sext.w	a5,a5
    80002fbc:	02f05963          	blez	a5,80002fee <growproc+0x5c>
    if((sz = uvmalloc(p->pagetable, sz, sz + n, PTE_W)) == 0) {
    80002fc0:	fe043783          	ld	a5,-32(s0)
    80002fc4:	6ba8                	ld	a0,80(a5)
    80002fc6:	fdc42703          	lw	a4,-36(s0)
    80002fca:	fe843783          	ld	a5,-24(s0)
    80002fce:	97ba                	add	a5,a5,a4
    80002fd0:	4691                	li	a3,4
    80002fd2:	863e                	mv	a2,a5
    80002fd4:	fe843583          	ld	a1,-24(s0)
    80002fd8:	fffff097          	auipc	ra,0xfffff
    80002fdc:	25c080e7          	jalr	604(ra) # 80002234 <uvmalloc>
    80002fe0:	fea43423          	sd	a0,-24(s0)
    80002fe4:	fe843783          	ld	a5,-24(s0)
    80002fe8:	eb95                	bnez	a5,8000301c <growproc+0x8a>
      return -1;
    80002fea:	57fd                	li	a5,-1
    80002fec:	a835                	j	80003028 <growproc+0x96>
    }
  } else if(n < 0){
    80002fee:	fdc42783          	lw	a5,-36(s0)
    80002ff2:	2781                	sext.w	a5,a5
    80002ff4:	0207d463          	bgez	a5,8000301c <growproc+0x8a>
    sz = uvmdealloc(p->pagetable, sz, sz + n);
    80002ff8:	fe043783          	ld	a5,-32(s0)
    80002ffc:	6bb4                	ld	a3,80(a5)
    80002ffe:	fdc42703          	lw	a4,-36(s0)
    80003002:	fe843783          	ld	a5,-24(s0)
    80003006:	97ba                	add	a5,a5,a4
    80003008:	863e                	mv	a2,a5
    8000300a:	fe843583          	ld	a1,-24(s0)
    8000300e:	8536                	mv	a0,a3
    80003010:	fffff097          	auipc	ra,0xfffff
    80003014:	316080e7          	jalr	790(ra) # 80002326 <uvmdealloc>
    80003018:	fea43423          	sd	a0,-24(s0)
  }
  p->sz = sz;
    8000301c:	fe043783          	ld	a5,-32(s0)
    80003020:	fe843703          	ld	a4,-24(s0)
    80003024:	e7b8                	sd	a4,72(a5)
  return 0;
    80003026:	4781                	li	a5,0
}
    80003028:	853e                	mv	a0,a5
    8000302a:	70a2                	ld	ra,40(sp)
    8000302c:	7402                	ld	s0,32(sp)
    8000302e:	6145                	addi	sp,sp,48
    80003030:	8082                	ret

0000000080003032 <fork>:

// Create a new process, copying the parent.
// Sets up child kernel stack to return as if from fork() system call.
int
fork(void)
{
    80003032:	7179                	addi	sp,sp,-48
    80003034:	f406                	sd	ra,40(sp)
    80003036:	f022                	sd	s0,32(sp)
    80003038:	1800                	addi	s0,sp,48
  int i, pid;
  struct proc *np;
  struct proc *p = myproc();
    8000303a:	00000097          	auipc	ra,0x0
    8000303e:	b28080e7          	jalr	-1240(ra) # 80002b62 <myproc>
    80003042:	fea43023          	sd	a0,-32(s0)

  // Allocate process.
  if((np = allocproc()) == 0){
    80003046:	00000097          	auipc	ra,0x0
    8000304a:	bb6080e7          	jalr	-1098(ra) # 80002bfc <allocproc>
    8000304e:	fca43c23          	sd	a0,-40(s0)
    80003052:	fd843783          	ld	a5,-40(s0)
    80003056:	e399                	bnez	a5,8000305c <fork+0x2a>
    return -1;
    80003058:	57fd                	li	a5,-1
    8000305a:	aab5                	j	800031d6 <fork+0x1a4>
  }

  // Copy user memory from parent to child.
  if(uvmcopy(p->pagetable, np->pagetable, p->sz) < 0){
    8000305c:	fe043783          	ld	a5,-32(s0)
    80003060:	6bb8                	ld	a4,80(a5)
    80003062:	fd843783          	ld	a5,-40(s0)
    80003066:	6bb4                	ld	a3,80(a5)
    80003068:	fe043783          	ld	a5,-32(s0)
    8000306c:	67bc                	ld	a5,72(a5)
    8000306e:	863e                	mv	a2,a5
    80003070:	85b6                	mv	a1,a3
    80003072:	853a                	mv	a0,a4
    80003074:	fffff097          	auipc	ra,0xfffff
    80003078:	442080e7          	jalr	1090(ra) # 800024b6 <uvmcopy>
    8000307c:	87aa                	mv	a5,a0
    8000307e:	0207d163          	bgez	a5,800030a0 <fork+0x6e>
    freeproc(np);
    80003082:	fd843503          	ld	a0,-40(s0)
    80003086:	00000097          	auipc	ra,0x0
    8000308a:	ca0080e7          	jalr	-864(ra) # 80002d26 <freeproc>
    release(&np->lock);
    8000308e:	fd843783          	ld	a5,-40(s0)
    80003092:	853e                	mv	a0,a5
    80003094:	ffffe097          	auipc	ra,0xffffe
    80003098:	2fa080e7          	jalr	762(ra) # 8000138e <release>
    return -1;
    8000309c:	57fd                	li	a5,-1
    8000309e:	aa25                	j	800031d6 <fork+0x1a4>
  }
  np->sz = p->sz;
    800030a0:	fe043783          	ld	a5,-32(s0)
    800030a4:	67b8                	ld	a4,72(a5)
    800030a6:	fd843783          	ld	a5,-40(s0)
    800030aa:	e7b8                	sd	a4,72(a5)

  // copy saved user registers.
  *(np->trapframe) = *(p->trapframe);
    800030ac:	fe043783          	ld	a5,-32(s0)
    800030b0:	6fb8                	ld	a4,88(a5)
    800030b2:	fd843783          	ld	a5,-40(s0)
    800030b6:	6fbc                	ld	a5,88(a5)
    800030b8:	86be                	mv	a3,a5
    800030ba:	12000793          	li	a5,288
    800030be:	863e                	mv	a2,a5
    800030c0:	85ba                	mv	a1,a4
    800030c2:	8536                	mv	a0,a3
    800030c4:	ffffe097          	auipc	ra,0xffffe
    800030c8:	5fa080e7          	jalr	1530(ra) # 800016be <memcpy>

  // Cause fork to return 0 in the child.
  np->trapframe->a0 = 0;
    800030cc:	fd843783          	ld	a5,-40(s0)
    800030d0:	6fbc                	ld	a5,88(a5)
    800030d2:	0607b823          	sd	zero,112(a5)

  // increment reference counts on open file descriptors.
  for(i = 0; i < NOFILE; i++)
    800030d6:	fe042623          	sw	zero,-20(s0)
    800030da:	a0a9                	j	80003124 <fork+0xf2>
    if(p->ofile[i])
    800030dc:	fe043703          	ld	a4,-32(s0)
    800030e0:	fec42783          	lw	a5,-20(s0)
    800030e4:	07e9                	addi	a5,a5,26
    800030e6:	078e                	slli	a5,a5,0x3
    800030e8:	97ba                	add	a5,a5,a4
    800030ea:	639c                	ld	a5,0(a5)
    800030ec:	c79d                	beqz	a5,8000311a <fork+0xe8>
      np->ofile[i] = filedup(p->ofile[i]);
    800030ee:	fe043703          	ld	a4,-32(s0)
    800030f2:	fec42783          	lw	a5,-20(s0)
    800030f6:	07e9                	addi	a5,a5,26
    800030f8:	078e                	slli	a5,a5,0x3
    800030fa:	97ba                	add	a5,a5,a4
    800030fc:	639c                	ld	a5,0(a5)
    800030fe:	853e                	mv	a0,a5
    80003100:	00004097          	auipc	ra,0x4
    80003104:	9a6080e7          	jalr	-1626(ra) # 80006aa6 <filedup>
    80003108:	86aa                	mv	a3,a0
    8000310a:	fd843703          	ld	a4,-40(s0)
    8000310e:	fec42783          	lw	a5,-20(s0)
    80003112:	07e9                	addi	a5,a5,26
    80003114:	078e                	slli	a5,a5,0x3
    80003116:	97ba                	add	a5,a5,a4
    80003118:	e394                	sd	a3,0(a5)
  for(i = 0; i < NOFILE; i++)
    8000311a:	fec42783          	lw	a5,-20(s0)
    8000311e:	2785                	addiw	a5,a5,1
    80003120:	fef42623          	sw	a5,-20(s0)
    80003124:	fec42783          	lw	a5,-20(s0)
    80003128:	0007871b          	sext.w	a4,a5
    8000312c:	47bd                	li	a5,15
    8000312e:	fae7d7e3          	bge	a5,a4,800030dc <fork+0xaa>
  np->cwd = idup(p->cwd);
    80003132:	fe043783          	ld	a5,-32(s0)
    80003136:	1507b783          	ld	a5,336(a5)
    8000313a:	853e                	mv	a0,a5
    8000313c:	00002097          	auipc	ra,0x2
    80003140:	260080e7          	jalr	608(ra) # 8000539c <idup>
    80003144:	872a                	mv	a4,a0
    80003146:	fd843783          	ld	a5,-40(s0)
    8000314a:	14e7b823          	sd	a4,336(a5)

  safestrcpy(np->name, p->name, sizeof(p->name));
    8000314e:	fd843783          	ld	a5,-40(s0)
    80003152:	15878713          	addi	a4,a5,344
    80003156:	fe043783          	ld	a5,-32(s0)
    8000315a:	15878793          	addi	a5,a5,344
    8000315e:	4641                	li	a2,16
    80003160:	85be                	mv	a1,a5
    80003162:	853a                	mv	a0,a4
    80003164:	ffffe097          	auipc	ra,0xffffe
    80003168:	69e080e7          	jalr	1694(ra) # 80001802 <safestrcpy>

  pid = np->pid;
    8000316c:	fd843783          	ld	a5,-40(s0)
    80003170:	5b9c                	lw	a5,48(a5)
    80003172:	fcf42a23          	sw	a5,-44(s0)

  release(&np->lock);
    80003176:	fd843783          	ld	a5,-40(s0)
    8000317a:	853e                	mv	a0,a5
    8000317c:	ffffe097          	auipc	ra,0xffffe
    80003180:	212080e7          	jalr	530(ra) # 8000138e <release>

  acquire(&wait_lock);
    80003184:	00028517          	auipc	a0,0x28
    80003188:	84c50513          	addi	a0,a0,-1972 # 8002a9d0 <wait_lock>
    8000318c:	ffffe097          	auipc	ra,0xffffe
    80003190:	19e080e7          	jalr	414(ra) # 8000132a <acquire>
  np->parent = p;
    80003194:	fd843783          	ld	a5,-40(s0)
    80003198:	fe043703          	ld	a4,-32(s0)
    8000319c:	ff98                	sd	a4,56(a5)
  release(&wait_lock);
    8000319e:	00028517          	auipc	a0,0x28
    800031a2:	83250513          	addi	a0,a0,-1998 # 8002a9d0 <wait_lock>
    800031a6:	ffffe097          	auipc	ra,0xffffe
    800031aa:	1e8080e7          	jalr	488(ra) # 8000138e <release>

  acquire(&np->lock);
    800031ae:	fd843783          	ld	a5,-40(s0)
    800031b2:	853e                	mv	a0,a5
    800031b4:	ffffe097          	auipc	ra,0xffffe
    800031b8:	176080e7          	jalr	374(ra) # 8000132a <acquire>
  np->state = RUNNABLE;
    800031bc:	fd843783          	ld	a5,-40(s0)
    800031c0:	470d                	li	a4,3
    800031c2:	cf98                	sw	a4,24(a5)
  release(&np->lock);
    800031c4:	fd843783          	ld	a5,-40(s0)
    800031c8:	853e                	mv	a0,a5
    800031ca:	ffffe097          	auipc	ra,0xffffe
    800031ce:	1c4080e7          	jalr	452(ra) # 8000138e <release>

  return pid;
    800031d2:	fd442783          	lw	a5,-44(s0)
}
    800031d6:	853e                	mv	a0,a5
    800031d8:	70a2                	ld	ra,40(sp)
    800031da:	7402                	ld	s0,32(sp)
    800031dc:	6145                	addi	sp,sp,48
    800031de:	8082                	ret

00000000800031e0 <reparent>:

// Pass p's abandoned children to init.
// Caller must hold wait_lock.
void
reparent(struct proc *p)
{
    800031e0:	7179                	addi	sp,sp,-48
    800031e2:	f406                	sd	ra,40(sp)
    800031e4:	f022                	sd	s0,32(sp)
    800031e6:	1800                	addi	s0,sp,48
    800031e8:	fca43c23          	sd	a0,-40(s0)
  struct proc *pp;

  for(pp = proc; pp < &proc[NPROC]; pp++){
    800031ec:	00022797          	auipc	a5,0x22
    800031f0:	dcc78793          	addi	a5,a5,-564 # 80024fb8 <proc>
    800031f4:	fef43423          	sd	a5,-24(s0)
    800031f8:	a081                	j	80003238 <reparent+0x58>
    if(pp->parent == p){
    800031fa:	fe843783          	ld	a5,-24(s0)
    800031fe:	7f9c                	ld	a5,56(a5)
    80003200:	fd843703          	ld	a4,-40(s0)
    80003204:	02f71463          	bne	a4,a5,8000322c <reparent+0x4c>
      pp->parent = initproc;
    80003208:	00009797          	auipc	a5,0x9
    8000320c:	73878793          	addi	a5,a5,1848 # 8000c940 <initproc>
    80003210:	6398                	ld	a4,0(a5)
    80003212:	fe843783          	ld	a5,-24(s0)
    80003216:	ff98                	sd	a4,56(a5)
      wakeup(initproc);
    80003218:	00009797          	auipc	a5,0x9
    8000321c:	72878793          	addi	a5,a5,1832 # 8000c940 <initproc>
    80003220:	639c                	ld	a5,0(a5)
    80003222:	853e                	mv	a0,a5
    80003224:	00000097          	auipc	ra,0x0
    80003228:	57c080e7          	jalr	1404(ra) # 800037a0 <wakeup>
  for(pp = proc; pp < &proc[NPROC]; pp++){
    8000322c:	fe843783          	ld	a5,-24(s0)
    80003230:	16878793          	addi	a5,a5,360
    80003234:	fef43423          	sd	a5,-24(s0)
    80003238:	fe843703          	ld	a4,-24(s0)
    8000323c:	00027797          	auipc	a5,0x27
    80003240:	77c78793          	addi	a5,a5,1916 # 8002a9b8 <pid_lock>
    80003244:	faf76be3          	bltu	a4,a5,800031fa <reparent+0x1a>
    }
  }
}
    80003248:	0001                	nop
    8000324a:	0001                	nop
    8000324c:	70a2                	ld	ra,40(sp)
    8000324e:	7402                	ld	s0,32(sp)
    80003250:	6145                	addi	sp,sp,48
    80003252:	8082                	ret

0000000080003254 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait().
void
exit(int status)
{
    80003254:	7139                	addi	sp,sp,-64
    80003256:	fc06                	sd	ra,56(sp)
    80003258:	f822                	sd	s0,48(sp)
    8000325a:	0080                	addi	s0,sp,64
    8000325c:	87aa                	mv	a5,a0
    8000325e:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80003262:	00000097          	auipc	ra,0x0
    80003266:	900080e7          	jalr	-1792(ra) # 80002b62 <myproc>
    8000326a:	fea43023          	sd	a0,-32(s0)

  if(p == initproc)
    8000326e:	00009797          	auipc	a5,0x9
    80003272:	6d278793          	addi	a5,a5,1746 # 8000c940 <initproc>
    80003276:	639c                	ld	a5,0(a5)
    80003278:	fe043703          	ld	a4,-32(s0)
    8000327c:	00f71a63          	bne	a4,a5,80003290 <exit+0x3c>
    panic("init exiting");
    80003280:	00009517          	auipc	a0,0x9
    80003284:	f9850513          	addi	a0,a0,-104 # 8000c218 <etext+0x218>
    80003288:	ffffe097          	auipc	ra,0xffffe
    8000328c:	a04080e7          	jalr	-1532(ra) # 80000c8c <panic>

  // Close all open files.
  for(int fd = 0; fd < NOFILE; fd++){
    80003290:	fe042623          	sw	zero,-20(s0)
    80003294:	a881                	j	800032e4 <exit+0x90>
    if(p->ofile[fd]){
    80003296:	fe043703          	ld	a4,-32(s0)
    8000329a:	fec42783          	lw	a5,-20(s0)
    8000329e:	07e9                	addi	a5,a5,26
    800032a0:	078e                	slli	a5,a5,0x3
    800032a2:	97ba                	add	a5,a5,a4
    800032a4:	639c                	ld	a5,0(a5)
    800032a6:	cb95                	beqz	a5,800032da <exit+0x86>
      struct file *f = p->ofile[fd];
    800032a8:	fe043703          	ld	a4,-32(s0)
    800032ac:	fec42783          	lw	a5,-20(s0)
    800032b0:	07e9                	addi	a5,a5,26
    800032b2:	078e                	slli	a5,a5,0x3
    800032b4:	97ba                	add	a5,a5,a4
    800032b6:	639c                	ld	a5,0(a5)
    800032b8:	fcf43c23          	sd	a5,-40(s0)
      fileclose(f);
    800032bc:	fd843503          	ld	a0,-40(s0)
    800032c0:	00004097          	auipc	ra,0x4
    800032c4:	84c080e7          	jalr	-1972(ra) # 80006b0c <fileclose>
      p->ofile[fd] = 0;
    800032c8:	fe043703          	ld	a4,-32(s0)
    800032cc:	fec42783          	lw	a5,-20(s0)
    800032d0:	07e9                	addi	a5,a5,26
    800032d2:	078e                	slli	a5,a5,0x3
    800032d4:	97ba                	add	a5,a5,a4
    800032d6:	0007b023          	sd	zero,0(a5)
  for(int fd = 0; fd < NOFILE; fd++){
    800032da:	fec42783          	lw	a5,-20(s0)
    800032de:	2785                	addiw	a5,a5,1
    800032e0:	fef42623          	sw	a5,-20(s0)
    800032e4:	fec42783          	lw	a5,-20(s0)
    800032e8:	0007871b          	sext.w	a4,a5
    800032ec:	47bd                	li	a5,15
    800032ee:	fae7d4e3          	bge	a5,a4,80003296 <exit+0x42>
    }
  }

  begin_op();
    800032f2:	00003097          	auipc	ra,0x3
    800032f6:	180080e7          	jalr	384(ra) # 80006472 <begin_op>
  iput(p->cwd);
    800032fa:	fe043783          	ld	a5,-32(s0)
    800032fe:	1507b783          	ld	a5,336(a5)
    80003302:	853e                	mv	a0,a5
    80003304:	00002097          	auipc	ra,0x2
    80003308:	272080e7          	jalr	626(ra) # 80005576 <iput>
  end_op();
    8000330c:	00003097          	auipc	ra,0x3
    80003310:	228080e7          	jalr	552(ra) # 80006534 <end_op>
  p->cwd = 0;
    80003314:	fe043783          	ld	a5,-32(s0)
    80003318:	1407b823          	sd	zero,336(a5)

  acquire(&wait_lock);
    8000331c:	00027517          	auipc	a0,0x27
    80003320:	6b450513          	addi	a0,a0,1716 # 8002a9d0 <wait_lock>
    80003324:	ffffe097          	auipc	ra,0xffffe
    80003328:	006080e7          	jalr	6(ra) # 8000132a <acquire>

  // Give any children to init.
  reparent(p);
    8000332c:	fe043503          	ld	a0,-32(s0)
    80003330:	00000097          	auipc	ra,0x0
    80003334:	eb0080e7          	jalr	-336(ra) # 800031e0 <reparent>

  // Parent might be sleeping in wait().
  wakeup(p->parent);
    80003338:	fe043783          	ld	a5,-32(s0)
    8000333c:	7f9c                	ld	a5,56(a5)
    8000333e:	853e                	mv	a0,a5
    80003340:	00000097          	auipc	ra,0x0
    80003344:	460080e7          	jalr	1120(ra) # 800037a0 <wakeup>
  
  acquire(&p->lock);
    80003348:	fe043783          	ld	a5,-32(s0)
    8000334c:	853e                	mv	a0,a5
    8000334e:	ffffe097          	auipc	ra,0xffffe
    80003352:	fdc080e7          	jalr	-36(ra) # 8000132a <acquire>

  p->xstate = status;
    80003356:	fe043783          	ld	a5,-32(s0)
    8000335a:	fcc42703          	lw	a4,-52(s0)
    8000335e:	d7d8                	sw	a4,44(a5)
  p->state = ZOMBIE;
    80003360:	fe043783          	ld	a5,-32(s0)
    80003364:	4715                	li	a4,5
    80003366:	cf98                	sw	a4,24(a5)

  release(&wait_lock);
    80003368:	00027517          	auipc	a0,0x27
    8000336c:	66850513          	addi	a0,a0,1640 # 8002a9d0 <wait_lock>
    80003370:	ffffe097          	auipc	ra,0xffffe
    80003374:	01e080e7          	jalr	30(ra) # 8000138e <release>

  // Jump into the scheduler, never to return.
  sched();
    80003378:	00000097          	auipc	ra,0x0
    8000337c:	230080e7          	jalr	560(ra) # 800035a8 <sched>
  panic("zombie exit");
    80003380:	00009517          	auipc	a0,0x9
    80003384:	ea850513          	addi	a0,a0,-344 # 8000c228 <etext+0x228>
    80003388:	ffffe097          	auipc	ra,0xffffe
    8000338c:	904080e7          	jalr	-1788(ra) # 80000c8c <panic>

0000000080003390 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(uint64 addr)
{
    80003390:	7139                	addi	sp,sp,-64
    80003392:	fc06                	sd	ra,56(sp)
    80003394:	f822                	sd	s0,48(sp)
    80003396:	0080                	addi	s0,sp,64
    80003398:	fca43423          	sd	a0,-56(s0)
  struct proc *pp;
  int havekids, pid;
  struct proc *p = myproc();
    8000339c:	fffff097          	auipc	ra,0xfffff
    800033a0:	7c6080e7          	jalr	1990(ra) # 80002b62 <myproc>
    800033a4:	fca43c23          	sd	a0,-40(s0)

  acquire(&wait_lock);
    800033a8:	00027517          	auipc	a0,0x27
    800033ac:	62850513          	addi	a0,a0,1576 # 8002a9d0 <wait_lock>
    800033b0:	ffffe097          	auipc	ra,0xffffe
    800033b4:	f7a080e7          	jalr	-134(ra) # 8000132a <acquire>

  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    800033b8:	fe042223          	sw	zero,-28(s0)
    for(pp = proc; pp < &proc[NPROC]; pp++){
    800033bc:	00022797          	auipc	a5,0x22
    800033c0:	bfc78793          	addi	a5,a5,-1028 # 80024fb8 <proc>
    800033c4:	fef43423          	sd	a5,-24(s0)
    800033c8:	a8d1                	j	8000349c <wait+0x10c>
      if(pp->parent == p){
    800033ca:	fe843783          	ld	a5,-24(s0)
    800033ce:	7f9c                	ld	a5,56(a5)
    800033d0:	fd843703          	ld	a4,-40(s0)
    800033d4:	0af71e63          	bne	a4,a5,80003490 <wait+0x100>
        // make sure the child isn't still in exit() or swtch().
        acquire(&pp->lock);
    800033d8:	fe843783          	ld	a5,-24(s0)
    800033dc:	853e                	mv	a0,a5
    800033de:	ffffe097          	auipc	ra,0xffffe
    800033e2:	f4c080e7          	jalr	-180(ra) # 8000132a <acquire>

        havekids = 1;
    800033e6:	4785                	li	a5,1
    800033e8:	fef42223          	sw	a5,-28(s0)
        if(pp->state == ZOMBIE){
    800033ec:	fe843783          	ld	a5,-24(s0)
    800033f0:	4f9c                	lw	a5,24(a5)
    800033f2:	873e                	mv	a4,a5
    800033f4:	4795                	li	a5,5
    800033f6:	08f71663          	bne	a4,a5,80003482 <wait+0xf2>
          // Found one.
          pid = pp->pid;
    800033fa:	fe843783          	ld	a5,-24(s0)
    800033fe:	5b9c                	lw	a5,48(a5)
    80003400:	fcf42a23          	sw	a5,-44(s0)
          if(addr != 0 && copyout(p->pagetable, addr, (char *)&pp->xstate,
    80003404:	fc843783          	ld	a5,-56(s0)
    80003408:	c7a9                	beqz	a5,80003452 <wait+0xc2>
    8000340a:	fd843783          	ld	a5,-40(s0)
    8000340e:	6bb8                	ld	a4,80(a5)
    80003410:	fe843783          	ld	a5,-24(s0)
    80003414:	02c78793          	addi	a5,a5,44
    80003418:	4691                	li	a3,4
    8000341a:	863e                	mv	a2,a5
    8000341c:	fc843583          	ld	a1,-56(s0)
    80003420:	853a                	mv	a0,a4
    80003422:	fffff097          	auipc	ra,0xfffff
    80003426:	20a080e7          	jalr	522(ra) # 8000262c <copyout>
    8000342a:	87aa                	mv	a5,a0
    8000342c:	0207d363          	bgez	a5,80003452 <wait+0xc2>
                                  sizeof(pp->xstate)) < 0) {
            release(&pp->lock);
    80003430:	fe843783          	ld	a5,-24(s0)
    80003434:	853e                	mv	a0,a5
    80003436:	ffffe097          	auipc	ra,0xffffe
    8000343a:	f58080e7          	jalr	-168(ra) # 8000138e <release>
            release(&wait_lock);
    8000343e:	00027517          	auipc	a0,0x27
    80003442:	59250513          	addi	a0,a0,1426 # 8002a9d0 <wait_lock>
    80003446:	ffffe097          	auipc	ra,0xffffe
    8000344a:	f48080e7          	jalr	-184(ra) # 8000138e <release>
            return -1;
    8000344e:	57fd                	li	a5,-1
    80003450:	a879                	j	800034ee <wait+0x15e>
          }
          freeproc(pp);
    80003452:	fe843503          	ld	a0,-24(s0)
    80003456:	00000097          	auipc	ra,0x0
    8000345a:	8d0080e7          	jalr	-1840(ra) # 80002d26 <freeproc>
          release(&pp->lock);
    8000345e:	fe843783          	ld	a5,-24(s0)
    80003462:	853e                	mv	a0,a5
    80003464:	ffffe097          	auipc	ra,0xffffe
    80003468:	f2a080e7          	jalr	-214(ra) # 8000138e <release>
          release(&wait_lock);
    8000346c:	00027517          	auipc	a0,0x27
    80003470:	56450513          	addi	a0,a0,1380 # 8002a9d0 <wait_lock>
    80003474:	ffffe097          	auipc	ra,0xffffe
    80003478:	f1a080e7          	jalr	-230(ra) # 8000138e <release>
          return pid;
    8000347c:	fd442783          	lw	a5,-44(s0)
    80003480:	a0bd                	j	800034ee <wait+0x15e>
        }
        release(&pp->lock);
    80003482:	fe843783          	ld	a5,-24(s0)
    80003486:	853e                	mv	a0,a5
    80003488:	ffffe097          	auipc	ra,0xffffe
    8000348c:	f06080e7          	jalr	-250(ra) # 8000138e <release>
    for(pp = proc; pp < &proc[NPROC]; pp++){
    80003490:	fe843783          	ld	a5,-24(s0)
    80003494:	16878793          	addi	a5,a5,360
    80003498:	fef43423          	sd	a5,-24(s0)
    8000349c:	fe843703          	ld	a4,-24(s0)
    800034a0:	00027797          	auipc	a5,0x27
    800034a4:	51878793          	addi	a5,a5,1304 # 8002a9b8 <pid_lock>
    800034a8:	f2f761e3          	bltu	a4,a5,800033ca <wait+0x3a>
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || killed(p)){
    800034ac:	fe442783          	lw	a5,-28(s0)
    800034b0:	2781                	sext.w	a5,a5
    800034b2:	cb89                	beqz	a5,800034c4 <wait+0x134>
    800034b4:	fd843503          	ld	a0,-40(s0)
    800034b8:	00000097          	auipc	ra,0x0
    800034bc:	47a080e7          	jalr	1146(ra) # 80003932 <killed>
    800034c0:	87aa                	mv	a5,a0
    800034c2:	cb99                	beqz	a5,800034d8 <wait+0x148>
      release(&wait_lock);
    800034c4:	00027517          	auipc	a0,0x27
    800034c8:	50c50513          	addi	a0,a0,1292 # 8002a9d0 <wait_lock>
    800034cc:	ffffe097          	auipc	ra,0xffffe
    800034d0:	ec2080e7          	jalr	-318(ra) # 8000138e <release>
      return -1;
    800034d4:	57fd                	li	a5,-1
    800034d6:	a821                	j	800034ee <wait+0x15e>
    }
    
    // Wait for a child to exit.
    sleep(p, &wait_lock);  //DOC: wait-sleep
    800034d8:	00027597          	auipc	a1,0x27
    800034dc:	4f858593          	addi	a1,a1,1272 # 8002a9d0 <wait_lock>
    800034e0:	fd843503          	ld	a0,-40(s0)
    800034e4:	00000097          	auipc	ra,0x0
    800034e8:	240080e7          	jalr	576(ra) # 80003724 <sleep>
    havekids = 0;
    800034ec:	b5f1                	j	800033b8 <wait+0x28>
  }
}
    800034ee:	853e                	mv	a0,a5
    800034f0:	70e2                	ld	ra,56(sp)
    800034f2:	7442                	ld	s0,48(sp)
    800034f4:	6121                	addi	sp,sp,64
    800034f6:	8082                	ret

00000000800034f8 <scheduler>:
//  - swtch to start running that process.
//  - eventually that process transfers control
//    via swtch back to the scheduler.
void
scheduler(void)
{
    800034f8:	1101                	addi	sp,sp,-32
    800034fa:	ec06                	sd	ra,24(sp)
    800034fc:	e822                	sd	s0,16(sp)
    800034fe:	1000                	addi	s0,sp,32
  struct proc *p;
  struct cpu *c = mycpu();
    80003500:	fffff097          	auipc	ra,0xfffff
    80003504:	628080e7          	jalr	1576(ra) # 80002b28 <mycpu>
    80003508:	fea43023          	sd	a0,-32(s0)
  
  c->proc = 0;
    8000350c:	fe043783          	ld	a5,-32(s0)
    80003510:	0007b023          	sd	zero,0(a5)
  for(;;){
    // Avoid deadlock by ensuring that devices can interrupt.
    intr_on();
    80003514:	fffff097          	auipc	ra,0xfffff
    80003518:	3f6080e7          	jalr	1014(ra) # 8000290a <intr_on>

    for(p = proc; p < &proc[NPROC]; p++) {
    8000351c:	00022797          	auipc	a5,0x22
    80003520:	a9c78793          	addi	a5,a5,-1380 # 80024fb8 <proc>
    80003524:	fef43423          	sd	a5,-24(s0)
    80003528:	a0bd                	j	80003596 <scheduler+0x9e>
      acquire(&p->lock);
    8000352a:	fe843783          	ld	a5,-24(s0)
    8000352e:	853e                	mv	a0,a5
    80003530:	ffffe097          	auipc	ra,0xffffe
    80003534:	dfa080e7          	jalr	-518(ra) # 8000132a <acquire>
      if(p->state == RUNNABLE) {
    80003538:	fe843783          	ld	a5,-24(s0)
    8000353c:	4f9c                	lw	a5,24(a5)
    8000353e:	873e                	mv	a4,a5
    80003540:	478d                	li	a5,3
    80003542:	02f71d63          	bne	a4,a5,8000357c <scheduler+0x84>
        // Switch to chosen process.  It is the process's job
        // to release its lock and then reacquire it
        // before jumping back to us.
        p->state = RUNNING;
    80003546:	fe843783          	ld	a5,-24(s0)
    8000354a:	4711                	li	a4,4
    8000354c:	cf98                	sw	a4,24(a5)
        c->proc = p;
    8000354e:	fe043783          	ld	a5,-32(s0)
    80003552:	fe843703          	ld	a4,-24(s0)
    80003556:	e398                	sd	a4,0(a5)
        swtch(&c->context, &p->context);
    80003558:	fe043783          	ld	a5,-32(s0)
    8000355c:	00878713          	addi	a4,a5,8
    80003560:	fe843783          	ld	a5,-24(s0)
    80003564:	06078793          	addi	a5,a5,96
    80003568:	85be                	mv	a1,a5
    8000356a:	853a                	mv	a0,a4
    8000356c:	00000097          	auipc	ra,0x0
    80003570:	5d0080e7          	jalr	1488(ra) # 80003b3c <swtch>

        // Process is done running for now.
        // It should have changed its p->state before coming back.
        c->proc = 0;
    80003574:	fe043783          	ld	a5,-32(s0)
    80003578:	0007b023          	sd	zero,0(a5)
      }
      release(&p->lock);
    8000357c:	fe843783          	ld	a5,-24(s0)
    80003580:	853e                	mv	a0,a5
    80003582:	ffffe097          	auipc	ra,0xffffe
    80003586:	e0c080e7          	jalr	-500(ra) # 8000138e <release>
    for(p = proc; p < &proc[NPROC]; p++) {
    8000358a:	fe843783          	ld	a5,-24(s0)
    8000358e:	16878793          	addi	a5,a5,360
    80003592:	fef43423          	sd	a5,-24(s0)
    80003596:	fe843703          	ld	a4,-24(s0)
    8000359a:	00027797          	auipc	a5,0x27
    8000359e:	41e78793          	addi	a5,a5,1054 # 8002a9b8 <pid_lock>
    800035a2:	f8f764e3          	bltu	a4,a5,8000352a <scheduler+0x32>
    intr_on();
    800035a6:	b7bd                	j	80003514 <scheduler+0x1c>

00000000800035a8 <sched>:
// be proc->intena and proc->noff, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
    800035a8:	7179                	addi	sp,sp,-48
    800035aa:	f406                	sd	ra,40(sp)
    800035ac:	f022                	sd	s0,32(sp)
    800035ae:	ec26                	sd	s1,24(sp)
    800035b0:	1800                	addi	s0,sp,48
  int intena;
  struct proc *p = myproc();
    800035b2:	fffff097          	auipc	ra,0xfffff
    800035b6:	5b0080e7          	jalr	1456(ra) # 80002b62 <myproc>
    800035ba:	fca43c23          	sd	a0,-40(s0)

  if(!holding(&p->lock))
    800035be:	fd843783          	ld	a5,-40(s0)
    800035c2:	853e                	mv	a0,a5
    800035c4:	ffffe097          	auipc	ra,0xffffe
    800035c8:	e20080e7          	jalr	-480(ra) # 800013e4 <holding>
    800035cc:	87aa                	mv	a5,a0
    800035ce:	eb89                	bnez	a5,800035e0 <sched+0x38>
    panic("sched p->lock");
    800035d0:	00009517          	auipc	a0,0x9
    800035d4:	c6850513          	addi	a0,a0,-920 # 8000c238 <etext+0x238>
    800035d8:	ffffd097          	auipc	ra,0xffffd
    800035dc:	6b4080e7          	jalr	1716(ra) # 80000c8c <panic>
  if(mycpu()->noff != 1)
    800035e0:	fffff097          	auipc	ra,0xfffff
    800035e4:	548080e7          	jalr	1352(ra) # 80002b28 <mycpu>
    800035e8:	87aa                	mv	a5,a0
    800035ea:	5fbc                	lw	a5,120(a5)
    800035ec:	873e                	mv	a4,a5
    800035ee:	4785                	li	a5,1
    800035f0:	00f70a63          	beq	a4,a5,80003604 <sched+0x5c>
    panic("sched locks");
    800035f4:	00009517          	auipc	a0,0x9
    800035f8:	c5450513          	addi	a0,a0,-940 # 8000c248 <etext+0x248>
    800035fc:	ffffd097          	auipc	ra,0xffffd
    80003600:	690080e7          	jalr	1680(ra) # 80000c8c <panic>
  if(p->state == RUNNING)
    80003604:	fd843783          	ld	a5,-40(s0)
    80003608:	4f9c                	lw	a5,24(a5)
    8000360a:	873e                	mv	a4,a5
    8000360c:	4791                	li	a5,4
    8000360e:	00f71a63          	bne	a4,a5,80003622 <sched+0x7a>
    panic("sched running");
    80003612:	00009517          	auipc	a0,0x9
    80003616:	c4650513          	addi	a0,a0,-954 # 8000c258 <etext+0x258>
    8000361a:	ffffd097          	auipc	ra,0xffffd
    8000361e:	672080e7          	jalr	1650(ra) # 80000c8c <panic>
  if(intr_get())
    80003622:	fffff097          	auipc	ra,0xfffff
    80003626:	312080e7          	jalr	786(ra) # 80002934 <intr_get>
    8000362a:	87aa                	mv	a5,a0
    8000362c:	cb89                	beqz	a5,8000363e <sched+0x96>
    panic("sched interruptible");
    8000362e:	00009517          	auipc	a0,0x9
    80003632:	c3a50513          	addi	a0,a0,-966 # 8000c268 <etext+0x268>
    80003636:	ffffd097          	auipc	ra,0xffffd
    8000363a:	656080e7          	jalr	1622(ra) # 80000c8c <panic>

  intena = mycpu()->intena;
    8000363e:	fffff097          	auipc	ra,0xfffff
    80003642:	4ea080e7          	jalr	1258(ra) # 80002b28 <mycpu>
    80003646:	87aa                	mv	a5,a0
    80003648:	5ffc                	lw	a5,124(a5)
    8000364a:	fcf42a23          	sw	a5,-44(s0)
  swtch(&p->context, &mycpu()->context);
    8000364e:	fd843783          	ld	a5,-40(s0)
    80003652:	06078493          	addi	s1,a5,96
    80003656:	fffff097          	auipc	ra,0xfffff
    8000365a:	4d2080e7          	jalr	1234(ra) # 80002b28 <mycpu>
    8000365e:	87aa                	mv	a5,a0
    80003660:	07a1                	addi	a5,a5,8
    80003662:	85be                	mv	a1,a5
    80003664:	8526                	mv	a0,s1
    80003666:	00000097          	auipc	ra,0x0
    8000366a:	4d6080e7          	jalr	1238(ra) # 80003b3c <swtch>
  mycpu()->intena = intena;
    8000366e:	fffff097          	auipc	ra,0xfffff
    80003672:	4ba080e7          	jalr	1210(ra) # 80002b28 <mycpu>
    80003676:	872a                	mv	a4,a0
    80003678:	fd442783          	lw	a5,-44(s0)
    8000367c:	df7c                	sw	a5,124(a4)
}
    8000367e:	0001                	nop
    80003680:	70a2                	ld	ra,40(sp)
    80003682:	7402                	ld	s0,32(sp)
    80003684:	64e2                	ld	s1,24(sp)
    80003686:	6145                	addi	sp,sp,48
    80003688:	8082                	ret

000000008000368a <yield>:

// Give up the CPU for one scheduling round.
void
yield(void)
{
    8000368a:	1101                	addi	sp,sp,-32
    8000368c:	ec06                	sd	ra,24(sp)
    8000368e:	e822                	sd	s0,16(sp)
    80003690:	1000                	addi	s0,sp,32
  struct proc *p = myproc();
    80003692:	fffff097          	auipc	ra,0xfffff
    80003696:	4d0080e7          	jalr	1232(ra) # 80002b62 <myproc>
    8000369a:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    8000369e:	fe843783          	ld	a5,-24(s0)
    800036a2:	853e                	mv	a0,a5
    800036a4:	ffffe097          	auipc	ra,0xffffe
    800036a8:	c86080e7          	jalr	-890(ra) # 8000132a <acquire>
  p->state = RUNNABLE;
    800036ac:	fe843783          	ld	a5,-24(s0)
    800036b0:	470d                	li	a4,3
    800036b2:	cf98                	sw	a4,24(a5)
  sched();
    800036b4:	00000097          	auipc	ra,0x0
    800036b8:	ef4080e7          	jalr	-268(ra) # 800035a8 <sched>
  release(&p->lock);
    800036bc:	fe843783          	ld	a5,-24(s0)
    800036c0:	853e                	mv	a0,a5
    800036c2:	ffffe097          	auipc	ra,0xffffe
    800036c6:	ccc080e7          	jalr	-820(ra) # 8000138e <release>
}
    800036ca:	0001                	nop
    800036cc:	60e2                	ld	ra,24(sp)
    800036ce:	6442                	ld	s0,16(sp)
    800036d0:	6105                	addi	sp,sp,32
    800036d2:	8082                	ret

00000000800036d4 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch to forkret.
void
forkret(void)
{
    800036d4:	1141                	addi	sp,sp,-16
    800036d6:	e406                	sd	ra,8(sp)
    800036d8:	e022                	sd	s0,0(sp)
    800036da:	0800                	addi	s0,sp,16
  static int first = 1;

  // Still holding p->lock from scheduler.
  release(&myproc()->lock);
    800036dc:	fffff097          	auipc	ra,0xfffff
    800036e0:	486080e7          	jalr	1158(ra) # 80002b62 <myproc>
    800036e4:	87aa                	mv	a5,a0
    800036e6:	853e                	mv	a0,a5
    800036e8:	ffffe097          	auipc	ra,0xffffe
    800036ec:	ca6080e7          	jalr	-858(ra) # 8000138e <release>

  if (first) {
    800036f0:	00009797          	auipc	a5,0x9
    800036f4:	0d478793          	addi	a5,a5,212 # 8000c7c4 <first.1699>
    800036f8:	439c                	lw	a5,0(a5)
    800036fa:	cf81                	beqz	a5,80003712 <forkret+0x3e>
    // File system initialization must be run in the context of a
    // regular process (e.g., because it calls sleep), and thus cannot
    // be run from main().
    first = 0;
    800036fc:	00009797          	auipc	a5,0x9
    80003700:	0c878793          	addi	a5,a5,200 # 8000c7c4 <first.1699>
    80003704:	0007a023          	sw	zero,0(a5)
    fsinit(ROOTDEV);
    80003708:	4505                	li	a0,1
    8000370a:	00001097          	auipc	ra,0x1
    8000370e:	568080e7          	jalr	1384(ra) # 80004c72 <fsinit>
  }

  usertrapret();
    80003712:	00000097          	auipc	ra,0x0
    80003716:	7dc080e7          	jalr	2012(ra) # 80003eee <usertrapret>
}
    8000371a:	0001                	nop
    8000371c:	60a2                	ld	ra,8(sp)
    8000371e:	6402                	ld	s0,0(sp)
    80003720:	0141                	addi	sp,sp,16
    80003722:	8082                	ret

0000000080003724 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
    80003724:	7179                	addi	sp,sp,-48
    80003726:	f406                	sd	ra,40(sp)
    80003728:	f022                	sd	s0,32(sp)
    8000372a:	1800                	addi	s0,sp,48
    8000372c:	fca43c23          	sd	a0,-40(s0)
    80003730:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    80003734:	fffff097          	auipc	ra,0xfffff
    80003738:	42e080e7          	jalr	1070(ra) # 80002b62 <myproc>
    8000373c:	fea43423          	sd	a0,-24(s0)
  // Once we hold p->lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup locks p->lock),
  // so it's okay to release lk.

  acquire(&p->lock);  //DOC: sleeplock1
    80003740:	fe843783          	ld	a5,-24(s0)
    80003744:	853e                	mv	a0,a5
    80003746:	ffffe097          	auipc	ra,0xffffe
    8000374a:	be4080e7          	jalr	-1052(ra) # 8000132a <acquire>
  release(lk);
    8000374e:	fd043503          	ld	a0,-48(s0)
    80003752:	ffffe097          	auipc	ra,0xffffe
    80003756:	c3c080e7          	jalr	-964(ra) # 8000138e <release>

  // Go to sleep.
  p->chan = chan;
    8000375a:	fe843783          	ld	a5,-24(s0)
    8000375e:	fd843703          	ld	a4,-40(s0)
    80003762:	f398                	sd	a4,32(a5)
  p->state = SLEEPING;
    80003764:	fe843783          	ld	a5,-24(s0)
    80003768:	4709                	li	a4,2
    8000376a:	cf98                	sw	a4,24(a5)

  sched();
    8000376c:	00000097          	auipc	ra,0x0
    80003770:	e3c080e7          	jalr	-452(ra) # 800035a8 <sched>

  // Tidy up.
  p->chan = 0;
    80003774:	fe843783          	ld	a5,-24(s0)
    80003778:	0207b023          	sd	zero,32(a5)

  // Reacquire original lock.
  release(&p->lock);
    8000377c:	fe843783          	ld	a5,-24(s0)
    80003780:	853e                	mv	a0,a5
    80003782:	ffffe097          	auipc	ra,0xffffe
    80003786:	c0c080e7          	jalr	-1012(ra) # 8000138e <release>
  acquire(lk);
    8000378a:	fd043503          	ld	a0,-48(s0)
    8000378e:	ffffe097          	auipc	ra,0xffffe
    80003792:	b9c080e7          	jalr	-1124(ra) # 8000132a <acquire>
}
    80003796:	0001                	nop
    80003798:	70a2                	ld	ra,40(sp)
    8000379a:	7402                	ld	s0,32(sp)
    8000379c:	6145                	addi	sp,sp,48
    8000379e:	8082                	ret

00000000800037a0 <wakeup>:

// Wake up all processes sleeping on chan.
// Must be called without any p->lock.
void
wakeup(void *chan)
{
    800037a0:	7179                	addi	sp,sp,-48
    800037a2:	f406                	sd	ra,40(sp)
    800037a4:	f022                	sd	s0,32(sp)
    800037a6:	1800                	addi	s0,sp,48
    800037a8:	fca43c23          	sd	a0,-40(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++) {
    800037ac:	00022797          	auipc	a5,0x22
    800037b0:	80c78793          	addi	a5,a5,-2036 # 80024fb8 <proc>
    800037b4:	fef43423          	sd	a5,-24(s0)
    800037b8:	a051                	j	8000383c <wakeup+0x9c>
    if(p != myproc()){
    800037ba:	fffff097          	auipc	ra,0xfffff
    800037be:	3a8080e7          	jalr	936(ra) # 80002b62 <myproc>
    800037c2:	872a                	mv	a4,a0
    800037c4:	fe843783          	ld	a5,-24(s0)
    800037c8:	06e78463          	beq	a5,a4,80003830 <wakeup+0x90>
      if (holding(&p->lock) && p->state == USED ) {
    800037cc:	fe843783          	ld	a5,-24(s0)
    800037d0:	853e                	mv	a0,a5
    800037d2:	ffffe097          	auipc	ra,0xffffe
    800037d6:	c12080e7          	jalr	-1006(ra) # 800013e4 <holding>
    800037da:	87aa                	mv	a5,a0
    800037dc:	cb81                	beqz	a5,800037ec <wakeup+0x4c>
    800037de:	fe843783          	ld	a5,-24(s0)
    800037e2:	4f9c                	lw	a5,24(a5)
    800037e4:	873e                	mv	a4,a5
    800037e6:	4785                	li	a5,1
    800037e8:	04f70363          	beq	a4,a5,8000382e <wakeup+0x8e>
        // Process is being created.
        continue;
      }
      acquire(&p->lock);
    800037ec:	fe843783          	ld	a5,-24(s0)
    800037f0:	853e                	mv	a0,a5
    800037f2:	ffffe097          	auipc	ra,0xffffe
    800037f6:	b38080e7          	jalr	-1224(ra) # 8000132a <acquire>
      if(p->state == SLEEPING && p->chan == chan) {
    800037fa:	fe843783          	ld	a5,-24(s0)
    800037fe:	4f9c                	lw	a5,24(a5)
    80003800:	873e                	mv	a4,a5
    80003802:	4789                	li	a5,2
    80003804:	00f71d63          	bne	a4,a5,8000381e <wakeup+0x7e>
    80003808:	fe843783          	ld	a5,-24(s0)
    8000380c:	739c                	ld	a5,32(a5)
    8000380e:	fd843703          	ld	a4,-40(s0)
    80003812:	00f71663          	bne	a4,a5,8000381e <wakeup+0x7e>
        p->state = RUNNABLE;
    80003816:	fe843783          	ld	a5,-24(s0)
    8000381a:	470d                	li	a4,3
    8000381c:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    8000381e:	fe843783          	ld	a5,-24(s0)
    80003822:	853e                	mv	a0,a5
    80003824:	ffffe097          	auipc	ra,0xffffe
    80003828:	b6a080e7          	jalr	-1174(ra) # 8000138e <release>
    8000382c:	a011                	j	80003830 <wakeup+0x90>
        continue;
    8000382e:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++) {
    80003830:	fe843783          	ld	a5,-24(s0)
    80003834:	16878793          	addi	a5,a5,360
    80003838:	fef43423          	sd	a5,-24(s0)
    8000383c:	fe843703          	ld	a4,-24(s0)
    80003840:	00027797          	auipc	a5,0x27
    80003844:	17878793          	addi	a5,a5,376 # 8002a9b8 <pid_lock>
    80003848:	f6f769e3          	bltu	a4,a5,800037ba <wakeup+0x1a>
    }
  }
}
    8000384c:	0001                	nop
    8000384e:	0001                	nop
    80003850:	70a2                	ld	ra,40(sp)
    80003852:	7402                	ld	s0,32(sp)
    80003854:	6145                	addi	sp,sp,48
    80003856:	8082                	ret

0000000080003858 <kill>:
// Kill the process with the given pid.
// The victim won't exit until it tries to return
// to user space (see usertrap() in trap.c).
int
kill(int pid)
{
    80003858:	7179                	addi	sp,sp,-48
    8000385a:	f406                	sd	ra,40(sp)
    8000385c:	f022                	sd	s0,32(sp)
    8000385e:	1800                	addi	s0,sp,48
    80003860:	87aa                	mv	a5,a0
    80003862:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p;

  for(p = proc; p < &proc[NPROC]; p++){
    80003866:	00021797          	auipc	a5,0x21
    8000386a:	75278793          	addi	a5,a5,1874 # 80024fb8 <proc>
    8000386e:	fef43423          	sd	a5,-24(s0)
    80003872:	a0ad                	j	800038dc <kill+0x84>
    acquire(&p->lock);
    80003874:	fe843783          	ld	a5,-24(s0)
    80003878:	853e                	mv	a0,a5
    8000387a:	ffffe097          	auipc	ra,0xffffe
    8000387e:	ab0080e7          	jalr	-1360(ra) # 8000132a <acquire>
    if(p->pid == pid){
    80003882:	fe843783          	ld	a5,-24(s0)
    80003886:	5b98                	lw	a4,48(a5)
    80003888:	fdc42783          	lw	a5,-36(s0)
    8000388c:	2781                	sext.w	a5,a5
    8000388e:	02e79a63          	bne	a5,a4,800038c2 <kill+0x6a>
      p->killed = 1;
    80003892:	fe843783          	ld	a5,-24(s0)
    80003896:	4705                	li	a4,1
    80003898:	d798                	sw	a4,40(a5)
      if(p->state == SLEEPING){
    8000389a:	fe843783          	ld	a5,-24(s0)
    8000389e:	4f9c                	lw	a5,24(a5)
    800038a0:	873e                	mv	a4,a5
    800038a2:	4789                	li	a5,2
    800038a4:	00f71663          	bne	a4,a5,800038b0 <kill+0x58>
        // Wake process from sleep().
        p->state = RUNNABLE;
    800038a8:	fe843783          	ld	a5,-24(s0)
    800038ac:	470d                	li	a4,3
    800038ae:	cf98                	sw	a4,24(a5)
      }
      release(&p->lock);
    800038b0:	fe843783          	ld	a5,-24(s0)
    800038b4:	853e                	mv	a0,a5
    800038b6:	ffffe097          	auipc	ra,0xffffe
    800038ba:	ad8080e7          	jalr	-1320(ra) # 8000138e <release>
      return 0;
    800038be:	4781                	li	a5,0
    800038c0:	a03d                	j	800038ee <kill+0x96>
    }
    release(&p->lock);
    800038c2:	fe843783          	ld	a5,-24(s0)
    800038c6:	853e                	mv	a0,a5
    800038c8:	ffffe097          	auipc	ra,0xffffe
    800038cc:	ac6080e7          	jalr	-1338(ra) # 8000138e <release>
  for(p = proc; p < &proc[NPROC]; p++){
    800038d0:	fe843783          	ld	a5,-24(s0)
    800038d4:	16878793          	addi	a5,a5,360
    800038d8:	fef43423          	sd	a5,-24(s0)
    800038dc:	fe843703          	ld	a4,-24(s0)
    800038e0:	00027797          	auipc	a5,0x27
    800038e4:	0d878793          	addi	a5,a5,216 # 8002a9b8 <pid_lock>
    800038e8:	f8f766e3          	bltu	a4,a5,80003874 <kill+0x1c>
  }
  return -1;
    800038ec:	57fd                	li	a5,-1
}
    800038ee:	853e                	mv	a0,a5
    800038f0:	70a2                	ld	ra,40(sp)
    800038f2:	7402                	ld	s0,32(sp)
    800038f4:	6145                	addi	sp,sp,48
    800038f6:	8082                	ret

00000000800038f8 <setkilled>:

void
setkilled(struct proc *p)
{
    800038f8:	1101                	addi	sp,sp,-32
    800038fa:	ec06                	sd	ra,24(sp)
    800038fc:	e822                	sd	s0,16(sp)
    800038fe:	1000                	addi	s0,sp,32
    80003900:	fea43423          	sd	a0,-24(s0)
  acquire(&p->lock);
    80003904:	fe843783          	ld	a5,-24(s0)
    80003908:	853e                	mv	a0,a5
    8000390a:	ffffe097          	auipc	ra,0xffffe
    8000390e:	a20080e7          	jalr	-1504(ra) # 8000132a <acquire>
  p->killed = 1;
    80003912:	fe843783          	ld	a5,-24(s0)
    80003916:	4705                	li	a4,1
    80003918:	d798                	sw	a4,40(a5)
  release(&p->lock);
    8000391a:	fe843783          	ld	a5,-24(s0)
    8000391e:	853e                	mv	a0,a5
    80003920:	ffffe097          	auipc	ra,0xffffe
    80003924:	a6e080e7          	jalr	-1426(ra) # 8000138e <release>
}
    80003928:	0001                	nop
    8000392a:	60e2                	ld	ra,24(sp)
    8000392c:	6442                	ld	s0,16(sp)
    8000392e:	6105                	addi	sp,sp,32
    80003930:	8082                	ret

0000000080003932 <killed>:

int
killed(struct proc *p)
{
    80003932:	7179                	addi	sp,sp,-48
    80003934:	f406                	sd	ra,40(sp)
    80003936:	f022                	sd	s0,32(sp)
    80003938:	1800                	addi	s0,sp,48
    8000393a:	fca43c23          	sd	a0,-40(s0)
  int k;
  
  acquire(&p->lock);
    8000393e:	fd843783          	ld	a5,-40(s0)
    80003942:	853e                	mv	a0,a5
    80003944:	ffffe097          	auipc	ra,0xffffe
    80003948:	9e6080e7          	jalr	-1562(ra) # 8000132a <acquire>
  k = p->killed;
    8000394c:	fd843783          	ld	a5,-40(s0)
    80003950:	579c                	lw	a5,40(a5)
    80003952:	fef42623          	sw	a5,-20(s0)
  release(&p->lock);
    80003956:	fd843783          	ld	a5,-40(s0)
    8000395a:	853e                	mv	a0,a5
    8000395c:	ffffe097          	auipc	ra,0xffffe
    80003960:	a32080e7          	jalr	-1486(ra) # 8000138e <release>
  return k;
    80003964:	fec42783          	lw	a5,-20(s0)
}
    80003968:	853e                	mv	a0,a5
    8000396a:	70a2                	ld	ra,40(sp)
    8000396c:	7402                	ld	s0,32(sp)
    8000396e:	6145                	addi	sp,sp,48
    80003970:	8082                	ret

0000000080003972 <either_copyout>:
// Copy to either a user address, or kernel address,
// depending on usr_dst.
// Returns 0 on success, -1 on error.
int
either_copyout(int user_dst, uint64 dst, void *src, uint64 len)
{
    80003972:	7139                	addi	sp,sp,-64
    80003974:	fc06                	sd	ra,56(sp)
    80003976:	f822                	sd	s0,48(sp)
    80003978:	0080                	addi	s0,sp,64
    8000397a:	87aa                	mv	a5,a0
    8000397c:	fcb43823          	sd	a1,-48(s0)
    80003980:	fcc43423          	sd	a2,-56(s0)
    80003984:	fcd43023          	sd	a3,-64(s0)
    80003988:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    8000398c:	fffff097          	auipc	ra,0xfffff
    80003990:	1d6080e7          	jalr	470(ra) # 80002b62 <myproc>
    80003994:	fea43423          	sd	a0,-24(s0)
  if(user_dst){
    80003998:	fdc42783          	lw	a5,-36(s0)
    8000399c:	2781                	sext.w	a5,a5
    8000399e:	c38d                	beqz	a5,800039c0 <either_copyout+0x4e>
    return copyout(p->pagetable, dst, src, len);
    800039a0:	fe843783          	ld	a5,-24(s0)
    800039a4:	6bbc                	ld	a5,80(a5)
    800039a6:	fc043683          	ld	a3,-64(s0)
    800039aa:	fc843603          	ld	a2,-56(s0)
    800039ae:	fd043583          	ld	a1,-48(s0)
    800039b2:	853e                	mv	a0,a5
    800039b4:	fffff097          	auipc	ra,0xfffff
    800039b8:	c78080e7          	jalr	-904(ra) # 8000262c <copyout>
    800039bc:	87aa                	mv	a5,a0
    800039be:	a839                	j	800039dc <either_copyout+0x6a>
  } else {
    memmove((char *)dst, src, len);
    800039c0:	fd043783          	ld	a5,-48(s0)
    800039c4:	fc043703          	ld	a4,-64(s0)
    800039c8:	2701                	sext.w	a4,a4
    800039ca:	863a                	mv	a2,a4
    800039cc:	fc843583          	ld	a1,-56(s0)
    800039d0:	853e                	mv	a0,a5
    800039d2:	ffffe097          	auipc	ra,0xffffe
    800039d6:	c10080e7          	jalr	-1008(ra) # 800015e2 <memmove>
    return 0;
    800039da:	4781                	li	a5,0
  }
}
    800039dc:	853e                	mv	a0,a5
    800039de:	70e2                	ld	ra,56(sp)
    800039e0:	7442                	ld	s0,48(sp)
    800039e2:	6121                	addi	sp,sp,64
    800039e4:	8082                	ret

00000000800039e6 <either_copyin>:
// Copy from either a user address, or kernel address,
// depending on usr_src.
// Returns 0 on success, -1 on error.
int
either_copyin(void *dst, int user_src, uint64 src, uint64 len)
{
    800039e6:	7139                	addi	sp,sp,-64
    800039e8:	fc06                	sd	ra,56(sp)
    800039ea:	f822                	sd	s0,48(sp)
    800039ec:	0080                	addi	s0,sp,64
    800039ee:	fca43c23          	sd	a0,-40(s0)
    800039f2:	87ae                	mv	a5,a1
    800039f4:	fcc43423          	sd	a2,-56(s0)
    800039f8:	fcd43023          	sd	a3,-64(s0)
    800039fc:	fcf42a23          	sw	a5,-44(s0)
  struct proc *p = myproc();
    80003a00:	fffff097          	auipc	ra,0xfffff
    80003a04:	162080e7          	jalr	354(ra) # 80002b62 <myproc>
    80003a08:	fea43423          	sd	a0,-24(s0)
  if(user_src){
    80003a0c:	fd442783          	lw	a5,-44(s0)
    80003a10:	2781                	sext.w	a5,a5
    80003a12:	c38d                	beqz	a5,80003a34 <either_copyin+0x4e>
    return copyin(p->pagetable, dst, src, len);
    80003a14:	fe843783          	ld	a5,-24(s0)
    80003a18:	6bbc                	ld	a5,80(a5)
    80003a1a:	fc043683          	ld	a3,-64(s0)
    80003a1e:	fc843603          	ld	a2,-56(s0)
    80003a22:	fd843583          	ld	a1,-40(s0)
    80003a26:	853e                	mv	a0,a5
    80003a28:	fffff097          	auipc	ra,0xfffff
    80003a2c:	cd2080e7          	jalr	-814(ra) # 800026fa <copyin>
    80003a30:	87aa                	mv	a5,a0
    80003a32:	a839                	j	80003a50 <either_copyin+0x6a>
  } else {
    memmove(dst, (char*)src, len);
    80003a34:	fc843783          	ld	a5,-56(s0)
    80003a38:	fc043703          	ld	a4,-64(s0)
    80003a3c:	2701                	sext.w	a4,a4
    80003a3e:	863a                	mv	a2,a4
    80003a40:	85be                	mv	a1,a5
    80003a42:	fd843503          	ld	a0,-40(s0)
    80003a46:	ffffe097          	auipc	ra,0xffffe
    80003a4a:	b9c080e7          	jalr	-1124(ra) # 800015e2 <memmove>
    return 0;
    80003a4e:	4781                	li	a5,0
  }
}
    80003a50:	853e                	mv	a0,a5
    80003a52:	70e2                	ld	ra,56(sp)
    80003a54:	7442                	ld	s0,48(sp)
    80003a56:	6121                	addi	sp,sp,64
    80003a58:	8082                	ret

0000000080003a5a <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
    80003a5a:	1101                	addi	sp,sp,-32
    80003a5c:	ec06                	sd	ra,24(sp)
    80003a5e:	e822                	sd	s0,16(sp)
    80003a60:	1000                	addi	s0,sp,32
  [ZOMBIE]    "zombie"
  };
  struct proc *p;
  char *state;

  printf("\n");
    80003a62:	00009517          	auipc	a0,0x9
    80003a66:	81e50513          	addi	a0,a0,-2018 # 8000c280 <etext+0x280>
    80003a6a:	ffffd097          	auipc	ra,0xffffd
    80003a6e:	fcc080e7          	jalr	-52(ra) # 80000a36 <printf>
  for(p = proc; p < &proc[NPROC]; p++){
    80003a72:	00021797          	auipc	a5,0x21
    80003a76:	54678793          	addi	a5,a5,1350 # 80024fb8 <proc>
    80003a7a:	fef43423          	sd	a5,-24(s0)
    80003a7e:	a04d                	j	80003b20 <procdump+0xc6>
    if(p->state == UNUSED)
    80003a80:	fe843783          	ld	a5,-24(s0)
    80003a84:	4f9c                	lw	a5,24(a5)
    80003a86:	c7d1                	beqz	a5,80003b12 <procdump+0xb8>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
    80003a88:	fe843783          	ld	a5,-24(s0)
    80003a8c:	4f9c                	lw	a5,24(a5)
    80003a8e:	873e                	mv	a4,a5
    80003a90:	4795                	li	a5,5
    80003a92:	02e7ee63          	bltu	a5,a4,80003ace <procdump+0x74>
    80003a96:	fe843783          	ld	a5,-24(s0)
    80003a9a:	4f9c                	lw	a5,24(a5)
    80003a9c:	00009717          	auipc	a4,0x9
    80003aa0:	d8470713          	addi	a4,a4,-636 # 8000c820 <states.1744>
    80003aa4:	1782                	slli	a5,a5,0x20
    80003aa6:	9381                	srli	a5,a5,0x20
    80003aa8:	078e                	slli	a5,a5,0x3
    80003aaa:	97ba                	add	a5,a5,a4
    80003aac:	639c                	ld	a5,0(a5)
    80003aae:	c385                	beqz	a5,80003ace <procdump+0x74>
      state = states[p->state];
    80003ab0:	fe843783          	ld	a5,-24(s0)
    80003ab4:	4f9c                	lw	a5,24(a5)
    80003ab6:	00009717          	auipc	a4,0x9
    80003aba:	d6a70713          	addi	a4,a4,-662 # 8000c820 <states.1744>
    80003abe:	1782                	slli	a5,a5,0x20
    80003ac0:	9381                	srli	a5,a5,0x20
    80003ac2:	078e                	slli	a5,a5,0x3
    80003ac4:	97ba                	add	a5,a5,a4
    80003ac6:	639c                	ld	a5,0(a5)
    80003ac8:	fef43023          	sd	a5,-32(s0)
    80003acc:	a039                	j	80003ada <procdump+0x80>
    else
      state = "???";
    80003ace:	00008797          	auipc	a5,0x8
    80003ad2:	7ba78793          	addi	a5,a5,1978 # 8000c288 <etext+0x288>
    80003ad6:	fef43023          	sd	a5,-32(s0)
    printf("%d %s %s", p->pid, state, p->name);
    80003ada:	fe843783          	ld	a5,-24(s0)
    80003ade:	5b98                	lw	a4,48(a5)
    80003ae0:	fe843783          	ld	a5,-24(s0)
    80003ae4:	15878793          	addi	a5,a5,344
    80003ae8:	86be                	mv	a3,a5
    80003aea:	fe043603          	ld	a2,-32(s0)
    80003aee:	85ba                	mv	a1,a4
    80003af0:	00008517          	auipc	a0,0x8
    80003af4:	7a050513          	addi	a0,a0,1952 # 8000c290 <etext+0x290>
    80003af8:	ffffd097          	auipc	ra,0xffffd
    80003afc:	f3e080e7          	jalr	-194(ra) # 80000a36 <printf>
    printf("\n");
    80003b00:	00008517          	auipc	a0,0x8
    80003b04:	78050513          	addi	a0,a0,1920 # 8000c280 <etext+0x280>
    80003b08:	ffffd097          	auipc	ra,0xffffd
    80003b0c:	f2e080e7          	jalr	-210(ra) # 80000a36 <printf>
    80003b10:	a011                	j	80003b14 <procdump+0xba>
      continue;
    80003b12:	0001                	nop
  for(p = proc; p < &proc[NPROC]; p++){
    80003b14:	fe843783          	ld	a5,-24(s0)
    80003b18:	16878793          	addi	a5,a5,360
    80003b1c:	fef43423          	sd	a5,-24(s0)
    80003b20:	fe843703          	ld	a4,-24(s0)
    80003b24:	00027797          	auipc	a5,0x27
    80003b28:	e9478793          	addi	a5,a5,-364 # 8002a9b8 <pid_lock>
    80003b2c:	f4f76ae3          	bltu	a4,a5,80003a80 <procdump+0x26>
  }
}
    80003b30:	0001                	nop
    80003b32:	0001                	nop
    80003b34:	60e2                	ld	ra,24(sp)
    80003b36:	6442                	ld	s0,16(sp)
    80003b38:	6105                	addi	sp,sp,32
    80003b3a:	8082                	ret

0000000080003b3c <swtch>:
    80003b3c:	00153023          	sd	ra,0(a0)
    80003b40:	00253423          	sd	sp,8(a0)
    80003b44:	e900                	sd	s0,16(a0)
    80003b46:	ed04                	sd	s1,24(a0)
    80003b48:	03253023          	sd	s2,32(a0)
    80003b4c:	03353423          	sd	s3,40(a0)
    80003b50:	03453823          	sd	s4,48(a0)
    80003b54:	03553c23          	sd	s5,56(a0)
    80003b58:	05653023          	sd	s6,64(a0)
    80003b5c:	05753423          	sd	s7,72(a0)
    80003b60:	05853823          	sd	s8,80(a0)
    80003b64:	05953c23          	sd	s9,88(a0)
    80003b68:	07a53023          	sd	s10,96(a0)
    80003b6c:	07b53423          	sd	s11,104(a0)
    80003b70:	0005b083          	ld	ra,0(a1)
    80003b74:	0085b103          	ld	sp,8(a1)
    80003b78:	6980                	ld	s0,16(a1)
    80003b7a:	6d84                	ld	s1,24(a1)
    80003b7c:	0205b903          	ld	s2,32(a1)
    80003b80:	0285b983          	ld	s3,40(a1)
    80003b84:	0305ba03          	ld	s4,48(a1)
    80003b88:	0385ba83          	ld	s5,56(a1)
    80003b8c:	0405bb03          	ld	s6,64(a1)
    80003b90:	0485bb83          	ld	s7,72(a1)
    80003b94:	0505bc03          	ld	s8,80(a1)
    80003b98:	0585bc83          	ld	s9,88(a1)
    80003b9c:	0605bd03          	ld	s10,96(a1)
    80003ba0:	0685bd83          	ld	s11,104(a1)
    80003ba4:	8082                	ret

0000000080003ba6 <r_sstatus>:
{
    80003ba6:	1101                	addi	sp,sp,-32
    80003ba8:	ec22                	sd	s0,24(sp)
    80003baa:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80003bac:	100027f3          	csrr	a5,sstatus
    80003bb0:	fef43423          	sd	a5,-24(s0)
  return x;
    80003bb4:	fe843783          	ld	a5,-24(s0)
}
    80003bb8:	853e                	mv	a0,a5
    80003bba:	6462                	ld	s0,24(sp)
    80003bbc:	6105                	addi	sp,sp,32
    80003bbe:	8082                	ret

0000000080003bc0 <w_sstatus>:
{
    80003bc0:	1101                	addi	sp,sp,-32
    80003bc2:	ec22                	sd	s0,24(sp)
    80003bc4:	1000                	addi	s0,sp,32
    80003bc6:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80003bca:	fe843783          	ld	a5,-24(s0)
    80003bce:	10079073          	csrw	sstatus,a5
}
    80003bd2:	0001                	nop
    80003bd4:	6462                	ld	s0,24(sp)
    80003bd6:	6105                	addi	sp,sp,32
    80003bd8:	8082                	ret

0000000080003bda <r_sip>:
{
    80003bda:	1101                	addi	sp,sp,-32
    80003bdc:	ec22                	sd	s0,24(sp)
    80003bde:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sip" : "=r" (x) );
    80003be0:	144027f3          	csrr	a5,sip
    80003be4:	fef43423          	sd	a5,-24(s0)
  return x;
    80003be8:	fe843783          	ld	a5,-24(s0)
}
    80003bec:	853e                	mv	a0,a5
    80003bee:	6462                	ld	s0,24(sp)
    80003bf0:	6105                	addi	sp,sp,32
    80003bf2:	8082                	ret

0000000080003bf4 <w_sip>:
{
    80003bf4:	1101                	addi	sp,sp,-32
    80003bf6:	ec22                	sd	s0,24(sp)
    80003bf8:	1000                	addi	s0,sp,32
    80003bfa:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sip, %0" : : "r" (x));
    80003bfe:	fe843783          	ld	a5,-24(s0)
    80003c02:	14479073          	csrw	sip,a5
}
    80003c06:	0001                	nop
    80003c08:	6462                	ld	s0,24(sp)
    80003c0a:	6105                	addi	sp,sp,32
    80003c0c:	8082                	ret

0000000080003c0e <w_sepc>:
{
    80003c0e:	1101                	addi	sp,sp,-32
    80003c10:	ec22                	sd	s0,24(sp)
    80003c12:	1000                	addi	s0,sp,32
    80003c14:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sepc, %0" : : "r" (x));
    80003c18:	fe843783          	ld	a5,-24(s0)
    80003c1c:	14179073          	csrw	sepc,a5
}
    80003c20:	0001                	nop
    80003c22:	6462                	ld	s0,24(sp)
    80003c24:	6105                	addi	sp,sp,32
    80003c26:	8082                	ret

0000000080003c28 <r_sepc>:
{
    80003c28:	1101                	addi	sp,sp,-32
    80003c2a:	ec22                	sd	s0,24(sp)
    80003c2c:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sepc" : "=r" (x) );
    80003c2e:	141027f3          	csrr	a5,sepc
    80003c32:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c36:	fe843783          	ld	a5,-24(s0)
}
    80003c3a:	853e                	mv	a0,a5
    80003c3c:	6462                	ld	s0,24(sp)
    80003c3e:	6105                	addi	sp,sp,32
    80003c40:	8082                	ret

0000000080003c42 <w_stvec>:
{
    80003c42:	1101                	addi	sp,sp,-32
    80003c44:	ec22                	sd	s0,24(sp)
    80003c46:	1000                	addi	s0,sp,32
    80003c48:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw stvec, %0" : : "r" (x));
    80003c4c:	fe843783          	ld	a5,-24(s0)
    80003c50:	10579073          	csrw	stvec,a5
}
    80003c54:	0001                	nop
    80003c56:	6462                	ld	s0,24(sp)
    80003c58:	6105                	addi	sp,sp,32
    80003c5a:	8082                	ret

0000000080003c5c <r_satp>:
{
    80003c5c:	1101                	addi	sp,sp,-32
    80003c5e:	ec22                	sd	s0,24(sp)
    80003c60:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, satp" : "=r" (x) );
    80003c62:	180027f3          	csrr	a5,satp
    80003c66:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c6a:	fe843783          	ld	a5,-24(s0)
}
    80003c6e:	853e                	mv	a0,a5
    80003c70:	6462                	ld	s0,24(sp)
    80003c72:	6105                	addi	sp,sp,32
    80003c74:	8082                	ret

0000000080003c76 <r_scause>:
{
    80003c76:	1101                	addi	sp,sp,-32
    80003c78:	ec22                	sd	s0,24(sp)
    80003c7a:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, scause" : "=r" (x) );
    80003c7c:	142027f3          	csrr	a5,scause
    80003c80:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c84:	fe843783          	ld	a5,-24(s0)
}
    80003c88:	853e                	mv	a0,a5
    80003c8a:	6462                	ld	s0,24(sp)
    80003c8c:	6105                	addi	sp,sp,32
    80003c8e:	8082                	ret

0000000080003c90 <r_stval>:
{
    80003c90:	1101                	addi	sp,sp,-32
    80003c92:	ec22                	sd	s0,24(sp)
    80003c94:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, stval" : "=r" (x) );
    80003c96:	143027f3          	csrr	a5,stval
    80003c9a:	fef43423          	sd	a5,-24(s0)
  return x;
    80003c9e:	fe843783          	ld	a5,-24(s0)
}
    80003ca2:	853e                	mv	a0,a5
    80003ca4:	6462                	ld	s0,24(sp)
    80003ca6:	6105                	addi	sp,sp,32
    80003ca8:	8082                	ret

0000000080003caa <intr_on>:
{
    80003caa:	1141                	addi	sp,sp,-16
    80003cac:	e406                	sd	ra,8(sp)
    80003cae:	e022                	sd	s0,0(sp)
    80003cb0:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80003cb2:	00000097          	auipc	ra,0x0
    80003cb6:	ef4080e7          	jalr	-268(ra) # 80003ba6 <r_sstatus>
    80003cba:	87aa                	mv	a5,a0
    80003cbc:	0027e793          	ori	a5,a5,2
    80003cc0:	853e                	mv	a0,a5
    80003cc2:	00000097          	auipc	ra,0x0
    80003cc6:	efe080e7          	jalr	-258(ra) # 80003bc0 <w_sstatus>
}
    80003cca:	0001                	nop
    80003ccc:	60a2                	ld	ra,8(sp)
    80003cce:	6402                	ld	s0,0(sp)
    80003cd0:	0141                	addi	sp,sp,16
    80003cd2:	8082                	ret

0000000080003cd4 <intr_off>:
{
    80003cd4:	1141                	addi	sp,sp,-16
    80003cd6:	e406                	sd	ra,8(sp)
    80003cd8:	e022                	sd	s0,0(sp)
    80003cda:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80003cdc:	00000097          	auipc	ra,0x0
    80003ce0:	eca080e7          	jalr	-310(ra) # 80003ba6 <r_sstatus>
    80003ce4:	87aa                	mv	a5,a0
    80003ce6:	9bf5                	andi	a5,a5,-3
    80003ce8:	853e                	mv	a0,a5
    80003cea:	00000097          	auipc	ra,0x0
    80003cee:	ed6080e7          	jalr	-298(ra) # 80003bc0 <w_sstatus>
}
    80003cf2:	0001                	nop
    80003cf4:	60a2                	ld	ra,8(sp)
    80003cf6:	6402                	ld	s0,0(sp)
    80003cf8:	0141                	addi	sp,sp,16
    80003cfa:	8082                	ret

0000000080003cfc <intr_get>:
{
    80003cfc:	1101                	addi	sp,sp,-32
    80003cfe:	ec06                	sd	ra,24(sp)
    80003d00:	e822                	sd	s0,16(sp)
    80003d02:	1000                	addi	s0,sp,32
  uint64 x = r_sstatus();
    80003d04:	00000097          	auipc	ra,0x0
    80003d08:	ea2080e7          	jalr	-350(ra) # 80003ba6 <r_sstatus>
    80003d0c:	fea43423          	sd	a0,-24(s0)
  return (x & SSTATUS_SIE) != 0;
    80003d10:	fe843783          	ld	a5,-24(s0)
    80003d14:	8b89                	andi	a5,a5,2
    80003d16:	00f037b3          	snez	a5,a5
    80003d1a:	0ff7f793          	andi	a5,a5,255
    80003d1e:	2781                	sext.w	a5,a5
}
    80003d20:	853e                	mv	a0,a5
    80003d22:	60e2                	ld	ra,24(sp)
    80003d24:	6442                	ld	s0,16(sp)
    80003d26:	6105                	addi	sp,sp,32
    80003d28:	8082                	ret

0000000080003d2a <r_tp>:
{
    80003d2a:	1101                	addi	sp,sp,-32
    80003d2c:	ec22                	sd	s0,24(sp)
    80003d2e:	1000                	addi	s0,sp,32
  asm volatile("mv %0, tp" : "=r" (x) );
    80003d30:	8792                	mv	a5,tp
    80003d32:	fef43423          	sd	a5,-24(s0)
  return x;
    80003d36:	fe843783          	ld	a5,-24(s0)
}
    80003d3a:	853e                	mv	a0,a5
    80003d3c:	6462                	ld	s0,24(sp)
    80003d3e:	6105                	addi	sp,sp,32
    80003d40:	8082                	ret

0000000080003d42 <trapinit>:

extern int devintr();

void
trapinit(void)
{
    80003d42:	1141                	addi	sp,sp,-16
    80003d44:	e406                	sd	ra,8(sp)
    80003d46:	e022                	sd	s0,0(sp)
    80003d48:	0800                	addi	s0,sp,16
  initlock(&tickslock, "time");
    80003d4a:	00008597          	auipc	a1,0x8
    80003d4e:	58e58593          	addi	a1,a1,1422 # 8000c2d8 <etext+0x2d8>
    80003d52:	00027517          	auipc	a0,0x27
    80003d56:	c9650513          	addi	a0,a0,-874 # 8002a9e8 <tickslock>
    80003d5a:	ffffd097          	auipc	ra,0xffffd
    80003d5e:	5a0080e7          	jalr	1440(ra) # 800012fa <initlock>
}
    80003d62:	0001                	nop
    80003d64:	60a2                	ld	ra,8(sp)
    80003d66:	6402                	ld	s0,0(sp)
    80003d68:	0141                	addi	sp,sp,16
    80003d6a:	8082                	ret

0000000080003d6c <trapinithart>:

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
    80003d6c:	1141                	addi	sp,sp,-16
    80003d6e:	e406                	sd	ra,8(sp)
    80003d70:	e022                	sd	s0,0(sp)
    80003d72:	0800                	addi	s0,sp,16
  w_stvec((uint64)kernelvec);
    80003d74:	00005797          	auipc	a5,0x5
    80003d78:	dec78793          	addi	a5,a5,-532 # 80008b60 <kernelvec>
    80003d7c:	853e                	mv	a0,a5
    80003d7e:	00000097          	auipc	ra,0x0
    80003d82:	ec4080e7          	jalr	-316(ra) # 80003c42 <w_stvec>
}
    80003d86:	0001                	nop
    80003d88:	60a2                	ld	ra,8(sp)
    80003d8a:	6402                	ld	s0,0(sp)
    80003d8c:	0141                	addi	sp,sp,16
    80003d8e:	8082                	ret

0000000080003d90 <usertrap>:
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
    80003d90:	7179                	addi	sp,sp,-48
    80003d92:	f406                	sd	ra,40(sp)
    80003d94:	f022                	sd	s0,32(sp)
    80003d96:	ec26                	sd	s1,24(sp)
    80003d98:	1800                	addi	s0,sp,48
  int which_dev = 0;
    80003d9a:	fc042e23          	sw	zero,-36(s0)

  if((r_sstatus() & SSTATUS_SPP) != 0)
    80003d9e:	00000097          	auipc	ra,0x0
    80003da2:	e08080e7          	jalr	-504(ra) # 80003ba6 <r_sstatus>
    80003da6:	87aa                	mv	a5,a0
    80003da8:	1007f793          	andi	a5,a5,256
    80003dac:	cb89                	beqz	a5,80003dbe <usertrap+0x2e>
    panic("usertrap: not from user mode");
    80003dae:	00008517          	auipc	a0,0x8
    80003db2:	53250513          	addi	a0,a0,1330 # 8000c2e0 <etext+0x2e0>
    80003db6:	ffffd097          	auipc	ra,0xffffd
    80003dba:	ed6080e7          	jalr	-298(ra) # 80000c8c <panic>

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);
    80003dbe:	00005797          	auipc	a5,0x5
    80003dc2:	da278793          	addi	a5,a5,-606 # 80008b60 <kernelvec>
    80003dc6:	853e                	mv	a0,a5
    80003dc8:	00000097          	auipc	ra,0x0
    80003dcc:	e7a080e7          	jalr	-390(ra) # 80003c42 <w_stvec>

  struct proc *p = myproc();
    80003dd0:	fffff097          	auipc	ra,0xfffff
    80003dd4:	d92080e7          	jalr	-622(ra) # 80002b62 <myproc>
    80003dd8:	fca43823          	sd	a0,-48(s0)
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
    80003ddc:	fd043783          	ld	a5,-48(s0)
    80003de0:	6fa4                	ld	s1,88(a5)
    80003de2:	00000097          	auipc	ra,0x0
    80003de6:	e46080e7          	jalr	-442(ra) # 80003c28 <r_sepc>
    80003dea:	87aa                	mv	a5,a0
    80003dec:	ec9c                	sd	a5,24(s1)
  
  if(r_scause() == 8){
    80003dee:	00000097          	auipc	ra,0x0
    80003df2:	e88080e7          	jalr	-376(ra) # 80003c76 <r_scause>
    80003df6:	872a                	mv	a4,a0
    80003df8:	47a1                	li	a5,8
    80003dfa:	04f71163          	bne	a4,a5,80003e3c <usertrap+0xac>
    // system call

    if(killed(p))
    80003dfe:	fd043503          	ld	a0,-48(s0)
    80003e02:	00000097          	auipc	ra,0x0
    80003e06:	b30080e7          	jalr	-1232(ra) # 80003932 <killed>
    80003e0a:	87aa                	mv	a5,a0
    80003e0c:	c791                	beqz	a5,80003e18 <usertrap+0x88>
      exit(-1);
    80003e0e:	557d                	li	a0,-1
    80003e10:	fffff097          	auipc	ra,0xfffff
    80003e14:	444080e7          	jalr	1092(ra) # 80003254 <exit>

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;
    80003e18:	fd043783          	ld	a5,-48(s0)
    80003e1c:	6fbc                	ld	a5,88(a5)
    80003e1e:	6f98                	ld	a4,24(a5)
    80003e20:	fd043783          	ld	a5,-48(s0)
    80003e24:	6fbc                	ld	a5,88(a5)
    80003e26:	0711                	addi	a4,a4,4
    80003e28:	ef98                	sd	a4,24(a5)

    // an interrupt will change sepc, scause, and sstatus,
    // so enable only now that we're done with those registers.
    intr_on();
    80003e2a:	00000097          	auipc	ra,0x0
    80003e2e:	e80080e7          	jalr	-384(ra) # 80003caa <intr_on>

    syscall();
    80003e32:	00000097          	auipc	ra,0x0
    80003e36:	6c8080e7          	jalr	1736(ra) # 800044fa <syscall>
    80003e3a:	a885                	j	80003eaa <usertrap+0x11a>
  } else if((which_dev = devintr()) != 0){
    80003e3c:	00000097          	auipc	ra,0x0
    80003e40:	38e080e7          	jalr	910(ra) # 800041ca <devintr>
    80003e44:	87aa                	mv	a5,a0
    80003e46:	fcf42e23          	sw	a5,-36(s0)
    80003e4a:	fdc42783          	lw	a5,-36(s0)
    80003e4e:	2781                	sext.w	a5,a5
    80003e50:	efa9                	bnez	a5,80003eaa <usertrap+0x11a>
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    80003e52:	00000097          	auipc	ra,0x0
    80003e56:	e24080e7          	jalr	-476(ra) # 80003c76 <r_scause>
    80003e5a:	872a                	mv	a4,a0
    80003e5c:	fd043783          	ld	a5,-48(s0)
    80003e60:	5b9c                	lw	a5,48(a5)
    80003e62:	863e                	mv	a2,a5
    80003e64:	85ba                	mv	a1,a4
    80003e66:	00008517          	auipc	a0,0x8
    80003e6a:	49a50513          	addi	a0,a0,1178 # 8000c300 <etext+0x300>
    80003e6e:	ffffd097          	auipc	ra,0xffffd
    80003e72:	bc8080e7          	jalr	-1080(ra) # 80000a36 <printf>
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    80003e76:	00000097          	auipc	ra,0x0
    80003e7a:	db2080e7          	jalr	-590(ra) # 80003c28 <r_sepc>
    80003e7e:	84aa                	mv	s1,a0
    80003e80:	00000097          	auipc	ra,0x0
    80003e84:	e10080e7          	jalr	-496(ra) # 80003c90 <r_stval>
    80003e88:	87aa                	mv	a5,a0
    80003e8a:	863e                	mv	a2,a5
    80003e8c:	85a6                	mv	a1,s1
    80003e8e:	00008517          	auipc	a0,0x8
    80003e92:	4a250513          	addi	a0,a0,1186 # 8000c330 <etext+0x330>
    80003e96:	ffffd097          	auipc	ra,0xffffd
    80003e9a:	ba0080e7          	jalr	-1120(ra) # 80000a36 <printf>
    setkilled(p);
    80003e9e:	fd043503          	ld	a0,-48(s0)
    80003ea2:	00000097          	auipc	ra,0x0
    80003ea6:	a56080e7          	jalr	-1450(ra) # 800038f8 <setkilled>
  }

  if(killed(p))
    80003eaa:	fd043503          	ld	a0,-48(s0)
    80003eae:	00000097          	auipc	ra,0x0
    80003eb2:	a84080e7          	jalr	-1404(ra) # 80003932 <killed>
    80003eb6:	87aa                	mv	a5,a0
    80003eb8:	c791                	beqz	a5,80003ec4 <usertrap+0x134>
    exit(-1);
    80003eba:	557d                	li	a0,-1
    80003ebc:	fffff097          	auipc	ra,0xfffff
    80003ec0:	398080e7          	jalr	920(ra) # 80003254 <exit>

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
    80003ec4:	fdc42783          	lw	a5,-36(s0)
    80003ec8:	0007871b          	sext.w	a4,a5
    80003ecc:	4789                	li	a5,2
    80003ece:	00f71663          	bne	a4,a5,80003eda <usertrap+0x14a>
    yield();
    80003ed2:	fffff097          	auipc	ra,0xfffff
    80003ed6:	7b8080e7          	jalr	1976(ra) # 8000368a <yield>

  usertrapret();
    80003eda:	00000097          	auipc	ra,0x0
    80003ede:	014080e7          	jalr	20(ra) # 80003eee <usertrapret>
}
    80003ee2:	0001                	nop
    80003ee4:	70a2                	ld	ra,40(sp)
    80003ee6:	7402                	ld	s0,32(sp)
    80003ee8:	64e2                	ld	s1,24(sp)
    80003eea:	6145                	addi	sp,sp,48
    80003eec:	8082                	ret

0000000080003eee <usertrapret>:
//
// return to user space
//
void
usertrapret(void)
{
    80003eee:	715d                	addi	sp,sp,-80
    80003ef0:	e486                	sd	ra,72(sp)
    80003ef2:	e0a2                	sd	s0,64(sp)
    80003ef4:	fc26                	sd	s1,56(sp)
    80003ef6:	0880                	addi	s0,sp,80
  struct proc *p = myproc();
    80003ef8:	fffff097          	auipc	ra,0xfffff
    80003efc:	c6a080e7          	jalr	-918(ra) # 80002b62 <myproc>
    80003f00:	fca43c23          	sd	a0,-40(s0)

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();
    80003f04:	00000097          	auipc	ra,0x0
    80003f08:	dd0080e7          	jalr	-560(ra) # 80003cd4 <intr_off>

  // send syscalls, interrupts, and exceptions to uservec in trampoline.S
  uint64 trampoline_uservec = TRAMPOLINE + (uservec - trampoline);
    80003f0c:	00007717          	auipc	a4,0x7
    80003f10:	0f470713          	addi	a4,a4,244 # 8000b000 <_trampoline>
    80003f14:	00007797          	auipc	a5,0x7
    80003f18:	0ec78793          	addi	a5,a5,236 # 8000b000 <_trampoline>
    80003f1c:	8f1d                	sub	a4,a4,a5
    80003f1e:	040007b7          	lui	a5,0x4000
    80003f22:	17fd                	addi	a5,a5,-1
    80003f24:	07b2                	slli	a5,a5,0xc
    80003f26:	97ba                	add	a5,a5,a4
    80003f28:	fcf43823          	sd	a5,-48(s0)
  w_stvec(trampoline_uservec);
    80003f2c:	fd043503          	ld	a0,-48(s0)
    80003f30:	00000097          	auipc	ra,0x0
    80003f34:	d12080e7          	jalr	-750(ra) # 80003c42 <w_stvec>

  // set up trapframe values that uservec will need when
  // the process next traps into the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
    80003f38:	fd843783          	ld	a5,-40(s0)
    80003f3c:	6fa4                	ld	s1,88(a5)
    80003f3e:	00000097          	auipc	ra,0x0
    80003f42:	d1e080e7          	jalr	-738(ra) # 80003c5c <r_satp>
    80003f46:	87aa                	mv	a5,a0
    80003f48:	e09c                	sd	a5,0(s1)
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
    80003f4a:	fd843783          	ld	a5,-40(s0)
    80003f4e:	63b4                	ld	a3,64(a5)
    80003f50:	fd843783          	ld	a5,-40(s0)
    80003f54:	6fbc                	ld	a5,88(a5)
    80003f56:	6705                	lui	a4,0x1
    80003f58:	9736                	add	a4,a4,a3
    80003f5a:	e798                	sd	a4,8(a5)
  p->trapframe->kernel_trap = (uint64)usertrap;
    80003f5c:	fd843783          	ld	a5,-40(s0)
    80003f60:	6fbc                	ld	a5,88(a5)
    80003f62:	00000717          	auipc	a4,0x0
    80003f66:	e2e70713          	addi	a4,a4,-466 # 80003d90 <usertrap>
    80003f6a:	eb98                	sd	a4,16(a5)
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()
    80003f6c:	fd843783          	ld	a5,-40(s0)
    80003f70:	6fa4                	ld	s1,88(a5)
    80003f72:	00000097          	auipc	ra,0x0
    80003f76:	db8080e7          	jalr	-584(ra) # 80003d2a <r_tp>
    80003f7a:	87aa                	mv	a5,a0
    80003f7c:	f09c                	sd	a5,32(s1)

  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
    80003f7e:	00000097          	auipc	ra,0x0
    80003f82:	c28080e7          	jalr	-984(ra) # 80003ba6 <r_sstatus>
    80003f86:	fca43423          	sd	a0,-56(s0)
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
    80003f8a:	fc843783          	ld	a5,-56(s0)
    80003f8e:	eff7f793          	andi	a5,a5,-257
    80003f92:	fcf43423          	sd	a5,-56(s0)
  x |= SSTATUS_SPIE; // enable interrupts in user mode
    80003f96:	fc843783          	ld	a5,-56(s0)
    80003f9a:	0207e793          	ori	a5,a5,32
    80003f9e:	fcf43423          	sd	a5,-56(s0)
  w_sstatus(x);
    80003fa2:	fc843503          	ld	a0,-56(s0)
    80003fa6:	00000097          	auipc	ra,0x0
    80003faa:	c1a080e7          	jalr	-998(ra) # 80003bc0 <w_sstatus>

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);
    80003fae:	fd843783          	ld	a5,-40(s0)
    80003fb2:	6fbc                	ld	a5,88(a5)
    80003fb4:	6f9c                	ld	a5,24(a5)
    80003fb6:	853e                	mv	a0,a5
    80003fb8:	00000097          	auipc	ra,0x0
    80003fbc:	c56080e7          	jalr	-938(ra) # 80003c0e <w_sepc>

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
    80003fc0:	fd843783          	ld	a5,-40(s0)
    80003fc4:	6bbc                	ld	a5,80(a5)
    80003fc6:	00c7d713          	srli	a4,a5,0xc
    80003fca:	57fd                	li	a5,-1
    80003fcc:	17fe                	slli	a5,a5,0x3f
    80003fce:	8fd9                	or	a5,a5,a4
    80003fd0:	fcf43023          	sd	a5,-64(s0)

  // jump to userret in trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 trampoline_userret = TRAMPOLINE + (userret - trampoline);
    80003fd4:	00007717          	auipc	a4,0x7
    80003fd8:	0c870713          	addi	a4,a4,200 # 8000b09c <userret>
    80003fdc:	00007797          	auipc	a5,0x7
    80003fe0:	02478793          	addi	a5,a5,36 # 8000b000 <_trampoline>
    80003fe4:	8f1d                	sub	a4,a4,a5
    80003fe6:	040007b7          	lui	a5,0x4000
    80003fea:	17fd                	addi	a5,a5,-1
    80003fec:	07b2                	slli	a5,a5,0xc
    80003fee:	97ba                	add	a5,a5,a4
    80003ff0:	faf43c23          	sd	a5,-72(s0)
  ((void (*)(uint64))trampoline_userret)(satp);
    80003ff4:	fb843783          	ld	a5,-72(s0)
    80003ff8:	fc043503          	ld	a0,-64(s0)
    80003ffc:	9782                	jalr	a5
}
    80003ffe:	0001                	nop
    80004000:	60a6                	ld	ra,72(sp)
    80004002:	6406                	ld	s0,64(sp)
    80004004:	74e2                	ld	s1,56(sp)
    80004006:	6161                	addi	sp,sp,80
    80004008:	8082                	ret

000000008000400a <kerneltrap>:

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
    8000400a:	7139                	addi	sp,sp,-64
    8000400c:	fc06                	sd	ra,56(sp)
    8000400e:	f822                	sd	s0,48(sp)
    80004010:	f426                	sd	s1,40(sp)
    80004012:	0080                	addi	s0,sp,64
  int which_dev = 0;
    80004014:	fc042e23          	sw	zero,-36(s0)
  uint64 sepc = r_sepc();
    80004018:	00000097          	auipc	ra,0x0
    8000401c:	c10080e7          	jalr	-1008(ra) # 80003c28 <r_sepc>
    80004020:	fca43823          	sd	a0,-48(s0)
  uint64 sstatus = r_sstatus();
    80004024:	00000097          	auipc	ra,0x0
    80004028:	b82080e7          	jalr	-1150(ra) # 80003ba6 <r_sstatus>
    8000402c:	fca43423          	sd	a0,-56(s0)
  uint64 scause = r_scause();
    80004030:	00000097          	auipc	ra,0x0
    80004034:	c46080e7          	jalr	-954(ra) # 80003c76 <r_scause>
    80004038:	fca43023          	sd	a0,-64(s0)
  
  if((sstatus & SSTATUS_SPP) == 0)
    8000403c:	fc843783          	ld	a5,-56(s0)
    80004040:	1007f793          	andi	a5,a5,256
    80004044:	eb89                	bnez	a5,80004056 <kerneltrap+0x4c>
    panic("kerneltrap: not from supervisor mode");
    80004046:	00008517          	auipc	a0,0x8
    8000404a:	30a50513          	addi	a0,a0,778 # 8000c350 <etext+0x350>
    8000404e:	ffffd097          	auipc	ra,0xffffd
    80004052:	c3e080e7          	jalr	-962(ra) # 80000c8c <panic>
  if(intr_get() != 0)
    80004056:	00000097          	auipc	ra,0x0
    8000405a:	ca6080e7          	jalr	-858(ra) # 80003cfc <intr_get>
    8000405e:	87aa                	mv	a5,a0
    80004060:	cb89                	beqz	a5,80004072 <kerneltrap+0x68>
    panic("kerneltrap: interrupts enabled");
    80004062:	00008517          	auipc	a0,0x8
    80004066:	31650513          	addi	a0,a0,790 # 8000c378 <etext+0x378>
    8000406a:	ffffd097          	auipc	ra,0xffffd
    8000406e:	c22080e7          	jalr	-990(ra) # 80000c8c <panic>

  if((which_dev = devintr()) == 0){
    80004072:	00000097          	auipc	ra,0x0
    80004076:	158080e7          	jalr	344(ra) # 800041ca <devintr>
    8000407a:	87aa                	mv	a5,a0
    8000407c:	fcf42e23          	sw	a5,-36(s0)
    80004080:	fdc42783          	lw	a5,-36(s0)
    80004084:	2781                	sext.w	a5,a5
    80004086:	e7b9                	bnez	a5,800040d4 <kerneltrap+0xca>
    printf("scause %p\n", scause);
    80004088:	fc043583          	ld	a1,-64(s0)
    8000408c:	00008517          	auipc	a0,0x8
    80004090:	30c50513          	addi	a0,a0,780 # 8000c398 <etext+0x398>
    80004094:	ffffd097          	auipc	ra,0xffffd
    80004098:	9a2080e7          	jalr	-1630(ra) # 80000a36 <printf>
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    8000409c:	00000097          	auipc	ra,0x0
    800040a0:	b8c080e7          	jalr	-1140(ra) # 80003c28 <r_sepc>
    800040a4:	84aa                	mv	s1,a0
    800040a6:	00000097          	auipc	ra,0x0
    800040aa:	bea080e7          	jalr	-1046(ra) # 80003c90 <r_stval>
    800040ae:	87aa                	mv	a5,a0
    800040b0:	863e                	mv	a2,a5
    800040b2:	85a6                	mv	a1,s1
    800040b4:	00008517          	auipc	a0,0x8
    800040b8:	2f450513          	addi	a0,a0,756 # 8000c3a8 <etext+0x3a8>
    800040bc:	ffffd097          	auipc	ra,0xffffd
    800040c0:	97a080e7          	jalr	-1670(ra) # 80000a36 <printf>
    panic("kerneltrap");
    800040c4:	00008517          	auipc	a0,0x8
    800040c8:	2fc50513          	addi	a0,a0,764 # 8000c3c0 <etext+0x3c0>
    800040cc:	ffffd097          	auipc	ra,0xffffd
    800040d0:	bc0080e7          	jalr	-1088(ra) # 80000c8c <panic>
  }

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
    800040d4:	fdc42783          	lw	a5,-36(s0)
    800040d8:	0007871b          	sext.w	a4,a5
    800040dc:	4789                	li	a5,2
    800040de:	02f71663          	bne	a4,a5,8000410a <kerneltrap+0x100>
    800040e2:	fffff097          	auipc	ra,0xfffff
    800040e6:	a80080e7          	jalr	-1408(ra) # 80002b62 <myproc>
    800040ea:	87aa                	mv	a5,a0
    800040ec:	cf99                	beqz	a5,8000410a <kerneltrap+0x100>
    800040ee:	fffff097          	auipc	ra,0xfffff
    800040f2:	a74080e7          	jalr	-1420(ra) # 80002b62 <myproc>
    800040f6:	87aa                	mv	a5,a0
    800040f8:	4f9c                	lw	a5,24(a5)
    800040fa:	873e                	mv	a4,a5
    800040fc:	4791                	li	a5,4
    800040fe:	00f71663          	bne	a4,a5,8000410a <kerneltrap+0x100>
    yield();
    80004102:	fffff097          	auipc	ra,0xfffff
    80004106:	588080e7          	jalr	1416(ra) # 8000368a <yield>

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
    8000410a:	fd043503          	ld	a0,-48(s0)
    8000410e:	00000097          	auipc	ra,0x0
    80004112:	b00080e7          	jalr	-1280(ra) # 80003c0e <w_sepc>
  w_sstatus(sstatus);
    80004116:	fc843503          	ld	a0,-56(s0)
    8000411a:	00000097          	auipc	ra,0x0
    8000411e:	aa6080e7          	jalr	-1370(ra) # 80003bc0 <w_sstatus>
}
    80004122:	0001                	nop
    80004124:	70e2                	ld	ra,56(sp)
    80004126:	7442                	ld	s0,48(sp)
    80004128:	74a2                	ld	s1,40(sp)
    8000412a:	6121                	addi	sp,sp,64
    8000412c:	8082                	ret

000000008000412e <clockintr>:

void
clockintr()
{
    8000412e:	1141                	addi	sp,sp,-16
    80004130:	e406                	sd	ra,8(sp)
    80004132:	e022                	sd	s0,0(sp)
    80004134:	0800                	addi	s0,sp,16
  acquire(&tickslock);
    80004136:	00027517          	auipc	a0,0x27
    8000413a:	8b250513          	addi	a0,a0,-1870 # 8002a9e8 <tickslock>
    8000413e:	ffffd097          	auipc	ra,0xffffd
    80004142:	1ec080e7          	jalr	492(ra) # 8000132a <acquire>
  ticks++;
    80004146:	00009797          	auipc	a5,0x9
    8000414a:	80278793          	addi	a5,a5,-2046 # 8000c948 <ticks>
    8000414e:	439c                	lw	a5,0(a5)
    80004150:	2785                	addiw	a5,a5,1
    80004152:	0007871b          	sext.w	a4,a5
    80004156:	00008797          	auipc	a5,0x8
    8000415a:	7f278793          	addi	a5,a5,2034 # 8000c948 <ticks>
    8000415e:	c398                	sw	a4,0(a5)

  if(ticks % LRUINTERVAL == 0)
    80004160:	00008797          	auipc	a5,0x8
    80004164:	7e878793          	addi	a5,a5,2024 # 8000c948 <ticks>
    80004168:	439c                	lw	a5,0(a5)
    8000416a:	873e                	mv	a4,a5
    8000416c:	06400793          	li	a5,100
    80004170:	02f777bb          	remuw	a5,a4,a5
    80004174:	2781                	sext.w	a5,a5
    80004176:	e789                	bnez	a5,80004180 <clockintr+0x52>
  {
    updaterefhistory();
    80004178:	ffffe097          	auipc	ra,0xffffe
    8000417c:	94a080e7          	jalr	-1718(ra) # 80001ac2 <updaterefhistory>
  }

  if(ticks % (LRUINTERVAL * 10) == 0)
    80004180:	00008797          	auipc	a5,0x8
    80004184:	7c878793          	addi	a5,a5,1992 # 8000c948 <ticks>
    80004188:	439c                	lw	a5,0(a5)
    8000418a:	873e                	mv	a4,a5
    8000418c:	3e800793          	li	a5,1000
    80004190:	02f777bb          	remuw	a5,a4,a5
    80004194:	2781                	sext.w	a5,a5
    80004196:	e789                	bnez	a5,800041a0 <clockintr+0x72>
  {
    getvictim();
    80004198:	ffffe097          	auipc	ra,0xffffe
    8000419c:	a02080e7          	jalr	-1534(ra) # 80001b9a <getvictim>
  }

  wakeup(&ticks);
    800041a0:	00008517          	auipc	a0,0x8
    800041a4:	7a850513          	addi	a0,a0,1960 # 8000c948 <ticks>
    800041a8:	fffff097          	auipc	ra,0xfffff
    800041ac:	5f8080e7          	jalr	1528(ra) # 800037a0 <wakeup>
  release(&tickslock);
    800041b0:	00027517          	auipc	a0,0x27
    800041b4:	83850513          	addi	a0,a0,-1992 # 8002a9e8 <tickslock>
    800041b8:	ffffd097          	auipc	ra,0xffffd
    800041bc:	1d6080e7          	jalr	470(ra) # 8000138e <release>
}
    800041c0:	0001                	nop
    800041c2:	60a2                	ld	ra,8(sp)
    800041c4:	6402                	ld	s0,0(sp)
    800041c6:	0141                	addi	sp,sp,16
    800041c8:	8082                	ret

00000000800041ca <devintr>:
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
    800041ca:	1101                	addi	sp,sp,-32
    800041cc:	ec06                	sd	ra,24(sp)
    800041ce:	e822                	sd	s0,16(sp)
    800041d0:	1000                	addi	s0,sp,32
  uint64 scause = r_scause();
    800041d2:	00000097          	auipc	ra,0x0
    800041d6:	aa4080e7          	jalr	-1372(ra) # 80003c76 <r_scause>
    800041da:	fea43423          	sd	a0,-24(s0)

  if((scause & 0x8000000000000000L) &&
    800041de:	fe843783          	ld	a5,-24(s0)
    800041e2:	0a07d263          	bgez	a5,80004286 <devintr+0xbc>
     (scause & 0xff) == 9){
    800041e6:	fe843783          	ld	a5,-24(s0)
    800041ea:	0ff7f713          	andi	a4,a5,255
  if((scause & 0x8000000000000000L) &&
    800041ee:	47a5                	li	a5,9
    800041f0:	08f71b63          	bne	a4,a5,80004286 <devintr+0xbc>
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();
    800041f4:	00005097          	auipc	ra,0x5
    800041f8:	aa8080e7          	jalr	-1368(ra) # 80008c9c <plic_claim>
    800041fc:	87aa                	mv	a5,a0
    800041fe:	fef42223          	sw	a5,-28(s0)

    if(irq == UART0_IRQ){
    80004202:	fe442783          	lw	a5,-28(s0)
    80004206:	0007871b          	sext.w	a4,a5
    8000420a:	47a9                	li	a5,10
    8000420c:	00f71763          	bne	a4,a5,8000421a <devintr+0x50>
      uartintr();
    80004210:	ffffd097          	auipc	ra,0xffffd
    80004214:	e1e080e7          	jalr	-482(ra) # 8000102e <uartintr>
    80004218:	a891                	j	8000426c <devintr+0xa2>
    } else if(irq == VIRTIO0_IRQ){
    8000421a:	fe442783          	lw	a5,-28(s0)
    8000421e:	0007871b          	sext.w	a4,a5
    80004222:	4785                	li	a5,1
    80004224:	00f71863          	bne	a4,a5,80004234 <devintr+0x6a>
      virtio_disk_intr(VIRTIO0_ID);
    80004228:	4501                	li	a0,0
    8000422a:	00006097          	auipc	ra,0x6
    8000422e:	c30080e7          	jalr	-976(ra) # 80009e5a <virtio_disk_intr>
    80004232:	a82d                	j	8000426c <devintr+0xa2>
    } else if(irq == VIRTIO1_IRQ){
    80004234:	fe442783          	lw	a5,-28(s0)
    80004238:	0007871b          	sext.w	a4,a5
    8000423c:	4789                	li	a5,2
    8000423e:	00f71863          	bne	a4,a5,8000424e <devintr+0x84>
      virtio_disk_intr(VIRTIO1_ID);
    80004242:	4505                	li	a0,1
    80004244:	00006097          	auipc	ra,0x6
    80004248:	c16080e7          	jalr	-1002(ra) # 80009e5a <virtio_disk_intr>
    8000424c:	a005                	j	8000426c <devintr+0xa2>
    } else if(irq){
    8000424e:	fe442783          	lw	a5,-28(s0)
    80004252:	2781                	sext.w	a5,a5
    80004254:	cf81                	beqz	a5,8000426c <devintr+0xa2>
      printf("unexpected interrupt irq=%d\n", irq);
    80004256:	fe442783          	lw	a5,-28(s0)
    8000425a:	85be                	mv	a1,a5
    8000425c:	00008517          	auipc	a0,0x8
    80004260:	17450513          	addi	a0,a0,372 # 8000c3d0 <etext+0x3d0>
    80004264:	ffffc097          	auipc	ra,0xffffc
    80004268:	7d2080e7          	jalr	2002(ra) # 80000a36 <printf>
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
    8000426c:	fe442783          	lw	a5,-28(s0)
    80004270:	2781                	sext.w	a5,a5
    80004272:	cb81                	beqz	a5,80004282 <devintr+0xb8>
      plic_complete(irq);
    80004274:	fe442783          	lw	a5,-28(s0)
    80004278:	853e                	mv	a0,a5
    8000427a:	00005097          	auipc	ra,0x5
    8000427e:	a60080e7          	jalr	-1440(ra) # 80008cda <plic_complete>

    return 1;
    80004282:	4785                	li	a5,1
    80004284:	a081                	j	800042c4 <devintr+0xfa>
  } else if(scause == 0x8000000000000001L){
    80004286:	fe843703          	ld	a4,-24(s0)
    8000428a:	57fd                	li	a5,-1
    8000428c:	17fe                	slli	a5,a5,0x3f
    8000428e:	0785                	addi	a5,a5,1
    80004290:	02f71963          	bne	a4,a5,800042c2 <devintr+0xf8>
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
    80004294:	fffff097          	auipc	ra,0xfffff
    80004298:	870080e7          	jalr	-1936(ra) # 80002b04 <cpuid>
    8000429c:	87aa                	mv	a5,a0
    8000429e:	e789                	bnez	a5,800042a8 <devintr+0xde>
      clockintr();
    800042a0:	00000097          	auipc	ra,0x0
    800042a4:	e8e080e7          	jalr	-370(ra) # 8000412e <clockintr>
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);
    800042a8:	00000097          	auipc	ra,0x0
    800042ac:	932080e7          	jalr	-1742(ra) # 80003bda <r_sip>
    800042b0:	87aa                	mv	a5,a0
    800042b2:	9bf5                	andi	a5,a5,-3
    800042b4:	853e                	mv	a0,a5
    800042b6:	00000097          	auipc	ra,0x0
    800042ba:	93e080e7          	jalr	-1730(ra) # 80003bf4 <w_sip>

    return 2;
    800042be:	4789                	li	a5,2
    800042c0:	a011                	j	800042c4 <devintr+0xfa>
  } else {
    return 0;
    800042c2:	4781                	li	a5,0
  }
}
    800042c4:	853e                	mv	a0,a5
    800042c6:	60e2                	ld	ra,24(sp)
    800042c8:	6442                	ld	s0,16(sp)
    800042ca:	6105                	addi	sp,sp,32
    800042cc:	8082                	ret

00000000800042ce <fetchaddr>:
#include "defs.h"

// Fetch the uint64 at addr from the current process.
int
fetchaddr(uint64 addr, uint64 *ip)
{
    800042ce:	7179                	addi	sp,sp,-48
    800042d0:	f406                	sd	ra,40(sp)
    800042d2:	f022                	sd	s0,32(sp)
    800042d4:	1800                	addi	s0,sp,48
    800042d6:	fca43c23          	sd	a0,-40(s0)
    800042da:	fcb43823          	sd	a1,-48(s0)
  struct proc *p = myproc();
    800042de:	fffff097          	auipc	ra,0xfffff
    800042e2:	884080e7          	jalr	-1916(ra) # 80002b62 <myproc>
    800042e6:	fea43423          	sd	a0,-24(s0)
  if(addr >= p->sz || addr+sizeof(uint64) > p->sz) // both tests needed, in case of overflow
    800042ea:	fe843783          	ld	a5,-24(s0)
    800042ee:	67bc                	ld	a5,72(a5)
    800042f0:	fd843703          	ld	a4,-40(s0)
    800042f4:	00f77b63          	bgeu	a4,a5,8000430a <fetchaddr+0x3c>
    800042f8:	fd843783          	ld	a5,-40(s0)
    800042fc:	00878713          	addi	a4,a5,8
    80004300:	fe843783          	ld	a5,-24(s0)
    80004304:	67bc                	ld	a5,72(a5)
    80004306:	00e7f463          	bgeu	a5,a4,8000430e <fetchaddr+0x40>
    return -1;
    8000430a:	57fd                	li	a5,-1
    8000430c:	a01d                	j	80004332 <fetchaddr+0x64>
  if(copyin(p->pagetable, (char *)ip, addr, sizeof(*ip)) != 0)
    8000430e:	fe843783          	ld	a5,-24(s0)
    80004312:	6bbc                	ld	a5,80(a5)
    80004314:	46a1                	li	a3,8
    80004316:	fd843603          	ld	a2,-40(s0)
    8000431a:	fd043583          	ld	a1,-48(s0)
    8000431e:	853e                	mv	a0,a5
    80004320:	ffffe097          	auipc	ra,0xffffe
    80004324:	3da080e7          	jalr	986(ra) # 800026fa <copyin>
    80004328:	87aa                	mv	a5,a0
    8000432a:	c399                	beqz	a5,80004330 <fetchaddr+0x62>
    return -1;
    8000432c:	57fd                	li	a5,-1
    8000432e:	a011                	j	80004332 <fetchaddr+0x64>
  return 0;
    80004330:	4781                	li	a5,0
}
    80004332:	853e                	mv	a0,a5
    80004334:	70a2                	ld	ra,40(sp)
    80004336:	7402                	ld	s0,32(sp)
    80004338:	6145                	addi	sp,sp,48
    8000433a:	8082                	ret

000000008000433c <fetchstr>:

// Fetch the nul-terminated string at addr from the current process.
// Returns length of string, not including nul, or -1 for error.
int
fetchstr(uint64 addr, char *buf, int max)
{
    8000433c:	7139                	addi	sp,sp,-64
    8000433e:	fc06                	sd	ra,56(sp)
    80004340:	f822                	sd	s0,48(sp)
    80004342:	0080                	addi	s0,sp,64
    80004344:	fca43c23          	sd	a0,-40(s0)
    80004348:	fcb43823          	sd	a1,-48(s0)
    8000434c:	87b2                	mv	a5,a2
    8000434e:	fcf42623          	sw	a5,-52(s0)
  struct proc *p = myproc();
    80004352:	fffff097          	auipc	ra,0xfffff
    80004356:	810080e7          	jalr	-2032(ra) # 80002b62 <myproc>
    8000435a:	fea43423          	sd	a0,-24(s0)
  if(copyinstr(p->pagetable, buf, addr, max) < 0)
    8000435e:	fe843783          	ld	a5,-24(s0)
    80004362:	6bbc                	ld	a5,80(a5)
    80004364:	fcc42703          	lw	a4,-52(s0)
    80004368:	86ba                	mv	a3,a4
    8000436a:	fd843603          	ld	a2,-40(s0)
    8000436e:	fd043583          	ld	a1,-48(s0)
    80004372:	853e                	mv	a0,a5
    80004374:	ffffe097          	auipc	ra,0xffffe
    80004378:	454080e7          	jalr	1108(ra) # 800027c8 <copyinstr>
    8000437c:	87aa                	mv	a5,a0
    8000437e:	0007d463          	bgez	a5,80004386 <fetchstr+0x4a>
    return -1;
    80004382:	57fd                	li	a5,-1
    80004384:	a801                	j	80004394 <fetchstr+0x58>
  return strlen(buf);
    80004386:	fd043503          	ld	a0,-48(s0)
    8000438a:	ffffd097          	auipc	ra,0xffffd
    8000438e:	4f2080e7          	jalr	1266(ra) # 8000187c <strlen>
    80004392:	87aa                	mv	a5,a0
}
    80004394:	853e                	mv	a0,a5
    80004396:	70e2                	ld	ra,56(sp)
    80004398:	7442                	ld	s0,48(sp)
    8000439a:	6121                	addi	sp,sp,64
    8000439c:	8082                	ret

000000008000439e <argraw>:

static uint64
argraw(int n)
{
    8000439e:	7179                	addi	sp,sp,-48
    800043a0:	f406                	sd	ra,40(sp)
    800043a2:	f022                	sd	s0,32(sp)
    800043a4:	1800                	addi	s0,sp,48
    800043a6:	87aa                	mv	a5,a0
    800043a8:	fcf42e23          	sw	a5,-36(s0)
  struct proc *p = myproc();
    800043ac:	ffffe097          	auipc	ra,0xffffe
    800043b0:	7b6080e7          	jalr	1974(ra) # 80002b62 <myproc>
    800043b4:	fea43423          	sd	a0,-24(s0)
    800043b8:	fdc42783          	lw	a5,-36(s0)
    800043bc:	0007871b          	sext.w	a4,a5
    800043c0:	4795                	li	a5,5
    800043c2:	06e7e263          	bltu	a5,a4,80004426 <argraw+0x88>
    800043c6:	fdc46783          	lwu	a5,-36(s0)
    800043ca:	00279713          	slli	a4,a5,0x2
    800043ce:	00008797          	auipc	a5,0x8
    800043d2:	02a78793          	addi	a5,a5,42 # 8000c3f8 <etext+0x3f8>
    800043d6:	97ba                	add	a5,a5,a4
    800043d8:	439c                	lw	a5,0(a5)
    800043da:	0007871b          	sext.w	a4,a5
    800043de:	00008797          	auipc	a5,0x8
    800043e2:	01a78793          	addi	a5,a5,26 # 8000c3f8 <etext+0x3f8>
    800043e6:	97ba                	add	a5,a5,a4
    800043e8:	8782                	jr	a5
  switch (n) {
  case 0:
    return p->trapframe->a0;
    800043ea:	fe843783          	ld	a5,-24(s0)
    800043ee:	6fbc                	ld	a5,88(a5)
    800043f0:	7bbc                	ld	a5,112(a5)
    800043f2:	a091                	j	80004436 <argraw+0x98>
  case 1:
    return p->trapframe->a1;
    800043f4:	fe843783          	ld	a5,-24(s0)
    800043f8:	6fbc                	ld	a5,88(a5)
    800043fa:	7fbc                	ld	a5,120(a5)
    800043fc:	a82d                	j	80004436 <argraw+0x98>
  case 2:
    return p->trapframe->a2;
    800043fe:	fe843783          	ld	a5,-24(s0)
    80004402:	6fbc                	ld	a5,88(a5)
    80004404:	63dc                	ld	a5,128(a5)
    80004406:	a805                	j	80004436 <argraw+0x98>
  case 3:
    return p->trapframe->a3;
    80004408:	fe843783          	ld	a5,-24(s0)
    8000440c:	6fbc                	ld	a5,88(a5)
    8000440e:	67dc                	ld	a5,136(a5)
    80004410:	a01d                	j	80004436 <argraw+0x98>
  case 4:
    return p->trapframe->a4;
    80004412:	fe843783          	ld	a5,-24(s0)
    80004416:	6fbc                	ld	a5,88(a5)
    80004418:	6bdc                	ld	a5,144(a5)
    8000441a:	a831                	j	80004436 <argraw+0x98>
  case 5:
    return p->trapframe->a5;
    8000441c:	fe843783          	ld	a5,-24(s0)
    80004420:	6fbc                	ld	a5,88(a5)
    80004422:	6fdc                	ld	a5,152(a5)
    80004424:	a809                	j	80004436 <argraw+0x98>
  }
  panic("argraw");
    80004426:	00008517          	auipc	a0,0x8
    8000442a:	fca50513          	addi	a0,a0,-54 # 8000c3f0 <etext+0x3f0>
    8000442e:	ffffd097          	auipc	ra,0xffffd
    80004432:	85e080e7          	jalr	-1954(ra) # 80000c8c <panic>
  return -1;
}
    80004436:	853e                	mv	a0,a5
    80004438:	70a2                	ld	ra,40(sp)
    8000443a:	7402                	ld	s0,32(sp)
    8000443c:	6145                	addi	sp,sp,48
    8000443e:	8082                	ret

0000000080004440 <argint>:

// Fetch the nth 32-bit system call argument.
void
argint(int n, int *ip)
{
    80004440:	1101                	addi	sp,sp,-32
    80004442:	ec06                	sd	ra,24(sp)
    80004444:	e822                	sd	s0,16(sp)
    80004446:	1000                	addi	s0,sp,32
    80004448:	87aa                	mv	a5,a0
    8000444a:	feb43023          	sd	a1,-32(s0)
    8000444e:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004452:	fec42783          	lw	a5,-20(s0)
    80004456:	853e                	mv	a0,a5
    80004458:	00000097          	auipc	ra,0x0
    8000445c:	f46080e7          	jalr	-186(ra) # 8000439e <argraw>
    80004460:	87aa                	mv	a5,a0
    80004462:	0007871b          	sext.w	a4,a5
    80004466:	fe043783          	ld	a5,-32(s0)
    8000446a:	c398                	sw	a4,0(a5)
}
    8000446c:	0001                	nop
    8000446e:	60e2                	ld	ra,24(sp)
    80004470:	6442                	ld	s0,16(sp)
    80004472:	6105                	addi	sp,sp,32
    80004474:	8082                	ret

0000000080004476 <argaddr>:
// Retrieve an argument as a pointer.
// Doesn't check for legality, since
// copyin/copyout will do that.
void
argaddr(int n, uint64 *ip)
{
    80004476:	1101                	addi	sp,sp,-32
    80004478:	ec06                	sd	ra,24(sp)
    8000447a:	e822                	sd	s0,16(sp)
    8000447c:	1000                	addi	s0,sp,32
    8000447e:	87aa                	mv	a5,a0
    80004480:	feb43023          	sd	a1,-32(s0)
    80004484:	fef42623          	sw	a5,-20(s0)
  *ip = argraw(n);
    80004488:	fec42783          	lw	a5,-20(s0)
    8000448c:	853e                	mv	a0,a5
    8000448e:	00000097          	auipc	ra,0x0
    80004492:	f10080e7          	jalr	-240(ra) # 8000439e <argraw>
    80004496:	872a                	mv	a4,a0
    80004498:	fe043783          	ld	a5,-32(s0)
    8000449c:	e398                	sd	a4,0(a5)
}
    8000449e:	0001                	nop
    800044a0:	60e2                	ld	ra,24(sp)
    800044a2:	6442                	ld	s0,16(sp)
    800044a4:	6105                	addi	sp,sp,32
    800044a6:	8082                	ret

00000000800044a8 <argstr>:
// Fetch the nth word-sized system call argument as a null-terminated string.
// Copies into buf, at most max.
// Returns string length if OK (including nul), -1 if error.
int
argstr(int n, char *buf, int max)
{
    800044a8:	7179                	addi	sp,sp,-48
    800044aa:	f406                	sd	ra,40(sp)
    800044ac:	f022                	sd	s0,32(sp)
    800044ae:	1800                	addi	s0,sp,48
    800044b0:	87aa                	mv	a5,a0
    800044b2:	fcb43823          	sd	a1,-48(s0)
    800044b6:	8732                	mv	a4,a2
    800044b8:	fcf42e23          	sw	a5,-36(s0)
    800044bc:	87ba                	mv	a5,a4
    800044be:	fcf42c23          	sw	a5,-40(s0)
  uint64 addr;
  argaddr(n, &addr);
    800044c2:	fe840713          	addi	a4,s0,-24
    800044c6:	fdc42783          	lw	a5,-36(s0)
    800044ca:	85ba                	mv	a1,a4
    800044cc:	853e                	mv	a0,a5
    800044ce:	00000097          	auipc	ra,0x0
    800044d2:	fa8080e7          	jalr	-88(ra) # 80004476 <argaddr>
  return fetchstr(addr, buf, max);
    800044d6:	fe843783          	ld	a5,-24(s0)
    800044da:	fd842703          	lw	a4,-40(s0)
    800044de:	863a                	mv	a2,a4
    800044e0:	fd043583          	ld	a1,-48(s0)
    800044e4:	853e                	mv	a0,a5
    800044e6:	00000097          	auipc	ra,0x0
    800044ea:	e56080e7          	jalr	-426(ra) # 8000433c <fetchstr>
    800044ee:	87aa                	mv	a5,a0
}
    800044f0:	853e                	mv	a0,a5
    800044f2:	70a2                	ld	ra,40(sp)
    800044f4:	7402                	ld	s0,32(sp)
    800044f6:	6145                	addi	sp,sp,48
    800044f8:	8082                	ret

00000000800044fa <syscall>:
[SYS_close]   sys_close,
};

void
syscall(void)
{
    800044fa:	7179                	addi	sp,sp,-48
    800044fc:	f406                	sd	ra,40(sp)
    800044fe:	f022                	sd	s0,32(sp)
    80004500:	ec26                	sd	s1,24(sp)
    80004502:	1800                	addi	s0,sp,48
  int num;
  struct proc *p = myproc();
    80004504:	ffffe097          	auipc	ra,0xffffe
    80004508:	65e080e7          	jalr	1630(ra) # 80002b62 <myproc>
    8000450c:	fca43c23          	sd	a0,-40(s0)

  num = p->trapframe->a7;
    80004510:	fd843783          	ld	a5,-40(s0)
    80004514:	6fbc                	ld	a5,88(a5)
    80004516:	77dc                	ld	a5,168(a5)
    80004518:	fcf42a23          	sw	a5,-44(s0)
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    8000451c:	fd442783          	lw	a5,-44(s0)
    80004520:	2781                	sext.w	a5,a5
    80004522:	04f05263          	blez	a5,80004566 <syscall+0x6c>
    80004526:	fd442783          	lw	a5,-44(s0)
    8000452a:	873e                	mv	a4,a5
    8000452c:	47d5                	li	a5,21
    8000452e:	02e7ec63          	bltu	a5,a4,80004566 <syscall+0x6c>
    80004532:	00008717          	auipc	a4,0x8
    80004536:	31e70713          	addi	a4,a4,798 # 8000c850 <syscalls>
    8000453a:	fd442783          	lw	a5,-44(s0)
    8000453e:	078e                	slli	a5,a5,0x3
    80004540:	97ba                	add	a5,a5,a4
    80004542:	639c                	ld	a5,0(a5)
    80004544:	c38d                	beqz	a5,80004566 <syscall+0x6c>
    // Use num to lookup the system call function for num, call it,
    // and store its return value in p->trapframe->a0
    p->trapframe->a0 = syscalls[num]();
    80004546:	00008717          	auipc	a4,0x8
    8000454a:	30a70713          	addi	a4,a4,778 # 8000c850 <syscalls>
    8000454e:	fd442783          	lw	a5,-44(s0)
    80004552:	078e                	slli	a5,a5,0x3
    80004554:	97ba                	add	a5,a5,a4
    80004556:	6398                	ld	a4,0(a5)
    80004558:	fd843783          	ld	a5,-40(s0)
    8000455c:	6fa4                	ld	s1,88(a5)
    8000455e:	9702                	jalr	a4
    80004560:	87aa                	mv	a5,a0
    80004562:	f8bc                	sd	a5,112(s1)
    80004564:	a815                	j	80004598 <syscall+0x9e>
  } else {
    printf("%d %s: unknown sys call %d\n",
    80004566:	fd843783          	ld	a5,-40(s0)
    8000456a:	5b98                	lw	a4,48(a5)
            p->pid, p->name, num);
    8000456c:	fd843783          	ld	a5,-40(s0)
    80004570:	15878793          	addi	a5,a5,344
    printf("%d %s: unknown sys call %d\n",
    80004574:	fd442683          	lw	a3,-44(s0)
    80004578:	863e                	mv	a2,a5
    8000457a:	85ba                	mv	a1,a4
    8000457c:	00008517          	auipc	a0,0x8
    80004580:	e9450513          	addi	a0,a0,-364 # 8000c410 <etext+0x410>
    80004584:	ffffc097          	auipc	ra,0xffffc
    80004588:	4b2080e7          	jalr	1202(ra) # 80000a36 <printf>
    p->trapframe->a0 = -1;
    8000458c:	fd843783          	ld	a5,-40(s0)
    80004590:	6fbc                	ld	a5,88(a5)
    80004592:	577d                	li	a4,-1
    80004594:	fbb8                	sd	a4,112(a5)
  }
}
    80004596:	0001                	nop
    80004598:	0001                	nop
    8000459a:	70a2                	ld	ra,40(sp)
    8000459c:	7402                	ld	s0,32(sp)
    8000459e:	64e2                	ld	s1,24(sp)
    800045a0:	6145                	addi	sp,sp,48
    800045a2:	8082                	ret

00000000800045a4 <sys_exit>:
#include "spinlock.h"
#include "proc.h"

uint64
sys_exit(void)
{
    800045a4:	1101                	addi	sp,sp,-32
    800045a6:	ec06                	sd	ra,24(sp)
    800045a8:	e822                	sd	s0,16(sp)
    800045aa:	1000                	addi	s0,sp,32
  int n;
  argint(0, &n);
    800045ac:	fec40793          	addi	a5,s0,-20
    800045b0:	85be                	mv	a1,a5
    800045b2:	4501                	li	a0,0
    800045b4:	00000097          	auipc	ra,0x0
    800045b8:	e8c080e7          	jalr	-372(ra) # 80004440 <argint>
  exit(n);
    800045bc:	fec42783          	lw	a5,-20(s0)
    800045c0:	853e                	mv	a0,a5
    800045c2:	fffff097          	auipc	ra,0xfffff
    800045c6:	c92080e7          	jalr	-878(ra) # 80003254 <exit>
  return 0;  // not reached
    800045ca:	4781                	li	a5,0
}
    800045cc:	853e                	mv	a0,a5
    800045ce:	60e2                	ld	ra,24(sp)
    800045d0:	6442                	ld	s0,16(sp)
    800045d2:	6105                	addi	sp,sp,32
    800045d4:	8082                	ret

00000000800045d6 <sys_getpid>:

uint64
sys_getpid(void)
{
    800045d6:	1141                	addi	sp,sp,-16
    800045d8:	e406                	sd	ra,8(sp)
    800045da:	e022                	sd	s0,0(sp)
    800045dc:	0800                	addi	s0,sp,16
  return myproc()->pid;
    800045de:	ffffe097          	auipc	ra,0xffffe
    800045e2:	584080e7          	jalr	1412(ra) # 80002b62 <myproc>
    800045e6:	87aa                	mv	a5,a0
    800045e8:	5b9c                	lw	a5,48(a5)
}
    800045ea:	853e                	mv	a0,a5
    800045ec:	60a2                	ld	ra,8(sp)
    800045ee:	6402                	ld	s0,0(sp)
    800045f0:	0141                	addi	sp,sp,16
    800045f2:	8082                	ret

00000000800045f4 <sys_fork>:

uint64
sys_fork(void)
{
    800045f4:	1141                	addi	sp,sp,-16
    800045f6:	e406                	sd	ra,8(sp)
    800045f8:	e022                	sd	s0,0(sp)
    800045fa:	0800                	addi	s0,sp,16
  return fork();
    800045fc:	fffff097          	auipc	ra,0xfffff
    80004600:	a36080e7          	jalr	-1482(ra) # 80003032 <fork>
    80004604:	87aa                	mv	a5,a0
}
    80004606:	853e                	mv	a0,a5
    80004608:	60a2                	ld	ra,8(sp)
    8000460a:	6402                	ld	s0,0(sp)
    8000460c:	0141                	addi	sp,sp,16
    8000460e:	8082                	ret

0000000080004610 <sys_wait>:

uint64
sys_wait(void)
{
    80004610:	1101                	addi	sp,sp,-32
    80004612:	ec06                	sd	ra,24(sp)
    80004614:	e822                	sd	s0,16(sp)
    80004616:	1000                	addi	s0,sp,32
  uint64 p;
  argaddr(0, &p);
    80004618:	fe840793          	addi	a5,s0,-24
    8000461c:	85be                	mv	a1,a5
    8000461e:	4501                	li	a0,0
    80004620:	00000097          	auipc	ra,0x0
    80004624:	e56080e7          	jalr	-426(ra) # 80004476 <argaddr>
  return wait(p);
    80004628:	fe843783          	ld	a5,-24(s0)
    8000462c:	853e                	mv	a0,a5
    8000462e:	fffff097          	auipc	ra,0xfffff
    80004632:	d62080e7          	jalr	-670(ra) # 80003390 <wait>
    80004636:	87aa                	mv	a5,a0
}
    80004638:	853e                	mv	a0,a5
    8000463a:	60e2                	ld	ra,24(sp)
    8000463c:	6442                	ld	s0,16(sp)
    8000463e:	6105                	addi	sp,sp,32
    80004640:	8082                	ret

0000000080004642 <sys_sbrk>:

uint64
sys_sbrk(void)
{
    80004642:	1101                	addi	sp,sp,-32
    80004644:	ec06                	sd	ra,24(sp)
    80004646:	e822                	sd	s0,16(sp)
    80004648:	1000                	addi	s0,sp,32
  uint64 addr;
  int n;

  argint(0, &n);
    8000464a:	fe440793          	addi	a5,s0,-28
    8000464e:	85be                	mv	a1,a5
    80004650:	4501                	li	a0,0
    80004652:	00000097          	auipc	ra,0x0
    80004656:	dee080e7          	jalr	-530(ra) # 80004440 <argint>
  addr = myproc()->sz;
    8000465a:	ffffe097          	auipc	ra,0xffffe
    8000465e:	508080e7          	jalr	1288(ra) # 80002b62 <myproc>
    80004662:	87aa                	mv	a5,a0
    80004664:	67bc                	ld	a5,72(a5)
    80004666:	fef43423          	sd	a5,-24(s0)
  if(growproc(n) < 0)
    8000466a:	fe442783          	lw	a5,-28(s0)
    8000466e:	853e                	mv	a0,a5
    80004670:	fffff097          	auipc	ra,0xfffff
    80004674:	922080e7          	jalr	-1758(ra) # 80002f92 <growproc>
    80004678:	87aa                	mv	a5,a0
    8000467a:	0007d463          	bgez	a5,80004682 <sys_sbrk+0x40>
    return -1;
    8000467e:	57fd                	li	a5,-1
    80004680:	a019                	j	80004686 <sys_sbrk+0x44>
  return addr;
    80004682:	fe843783          	ld	a5,-24(s0)
}
    80004686:	853e                	mv	a0,a5
    80004688:	60e2                	ld	ra,24(sp)
    8000468a:	6442                	ld	s0,16(sp)
    8000468c:	6105                	addi	sp,sp,32
    8000468e:	8082                	ret

0000000080004690 <sys_sleep>:

uint64
sys_sleep(void)
{
    80004690:	1101                	addi	sp,sp,-32
    80004692:	ec06                	sd	ra,24(sp)
    80004694:	e822                	sd	s0,16(sp)
    80004696:	1000                	addi	s0,sp,32
  int n;
  uint ticks0;

  argint(0, &n);
    80004698:	fe840793          	addi	a5,s0,-24
    8000469c:	85be                	mv	a1,a5
    8000469e:	4501                	li	a0,0
    800046a0:	00000097          	auipc	ra,0x0
    800046a4:	da0080e7          	jalr	-608(ra) # 80004440 <argint>
  acquire(&tickslock);
    800046a8:	00026517          	auipc	a0,0x26
    800046ac:	34050513          	addi	a0,a0,832 # 8002a9e8 <tickslock>
    800046b0:	ffffd097          	auipc	ra,0xffffd
    800046b4:	c7a080e7          	jalr	-902(ra) # 8000132a <acquire>
  ticks0 = ticks;
    800046b8:	00008797          	auipc	a5,0x8
    800046bc:	29078793          	addi	a5,a5,656 # 8000c948 <ticks>
    800046c0:	439c                	lw	a5,0(a5)
    800046c2:	fef42623          	sw	a5,-20(s0)
  while(ticks - ticks0 < n){
    800046c6:	a099                	j	8000470c <sys_sleep+0x7c>
    if(killed(myproc())){
    800046c8:	ffffe097          	auipc	ra,0xffffe
    800046cc:	49a080e7          	jalr	1178(ra) # 80002b62 <myproc>
    800046d0:	87aa                	mv	a5,a0
    800046d2:	853e                	mv	a0,a5
    800046d4:	fffff097          	auipc	ra,0xfffff
    800046d8:	25e080e7          	jalr	606(ra) # 80003932 <killed>
    800046dc:	87aa                	mv	a5,a0
    800046de:	cb99                	beqz	a5,800046f4 <sys_sleep+0x64>
      release(&tickslock);
    800046e0:	00026517          	auipc	a0,0x26
    800046e4:	30850513          	addi	a0,a0,776 # 8002a9e8 <tickslock>
    800046e8:	ffffd097          	auipc	ra,0xffffd
    800046ec:	ca6080e7          	jalr	-858(ra) # 8000138e <release>
      return -1;
    800046f0:	57fd                	li	a5,-1
    800046f2:	a0b1                	j	8000473e <sys_sleep+0xae>
    }
    sleep(&ticks, &tickslock);
    800046f4:	00026597          	auipc	a1,0x26
    800046f8:	2f458593          	addi	a1,a1,756 # 8002a9e8 <tickslock>
    800046fc:	00008517          	auipc	a0,0x8
    80004700:	24c50513          	addi	a0,a0,588 # 8000c948 <ticks>
    80004704:	fffff097          	auipc	ra,0xfffff
    80004708:	020080e7          	jalr	32(ra) # 80003724 <sleep>
  while(ticks - ticks0 < n){
    8000470c:	00008797          	auipc	a5,0x8
    80004710:	23c78793          	addi	a5,a5,572 # 8000c948 <ticks>
    80004714:	4398                	lw	a4,0(a5)
    80004716:	fec42783          	lw	a5,-20(s0)
    8000471a:	40f707bb          	subw	a5,a4,a5
    8000471e:	0007871b          	sext.w	a4,a5
    80004722:	fe842783          	lw	a5,-24(s0)
    80004726:	2781                	sext.w	a5,a5
    80004728:	faf760e3          	bltu	a4,a5,800046c8 <sys_sleep+0x38>
  }
  release(&tickslock);
    8000472c:	00026517          	auipc	a0,0x26
    80004730:	2bc50513          	addi	a0,a0,700 # 8002a9e8 <tickslock>
    80004734:	ffffd097          	auipc	ra,0xffffd
    80004738:	c5a080e7          	jalr	-934(ra) # 8000138e <release>
  return 0;
    8000473c:	4781                	li	a5,0
}
    8000473e:	853e                	mv	a0,a5
    80004740:	60e2                	ld	ra,24(sp)
    80004742:	6442                	ld	s0,16(sp)
    80004744:	6105                	addi	sp,sp,32
    80004746:	8082                	ret

0000000080004748 <sys_kill>:

uint64
sys_kill(void)
{
    80004748:	1101                	addi	sp,sp,-32
    8000474a:	ec06                	sd	ra,24(sp)
    8000474c:	e822                	sd	s0,16(sp)
    8000474e:	1000                	addi	s0,sp,32
  int pid;

  argint(0, &pid);
    80004750:	fec40793          	addi	a5,s0,-20
    80004754:	85be                	mv	a1,a5
    80004756:	4501                	li	a0,0
    80004758:	00000097          	auipc	ra,0x0
    8000475c:	ce8080e7          	jalr	-792(ra) # 80004440 <argint>
  return kill(pid);
    80004760:	fec42783          	lw	a5,-20(s0)
    80004764:	853e                	mv	a0,a5
    80004766:	fffff097          	auipc	ra,0xfffff
    8000476a:	0f2080e7          	jalr	242(ra) # 80003858 <kill>
    8000476e:	87aa                	mv	a5,a0
}
    80004770:	853e                	mv	a0,a5
    80004772:	60e2                	ld	ra,24(sp)
    80004774:	6442                	ld	s0,16(sp)
    80004776:	6105                	addi	sp,sp,32
    80004778:	8082                	ret

000000008000477a <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
uint64
sys_uptime(void)
{
    8000477a:	1101                	addi	sp,sp,-32
    8000477c:	ec06                	sd	ra,24(sp)
    8000477e:	e822                	sd	s0,16(sp)
    80004780:	1000                	addi	s0,sp,32
  uint xticks;

  acquire(&tickslock);
    80004782:	00026517          	auipc	a0,0x26
    80004786:	26650513          	addi	a0,a0,614 # 8002a9e8 <tickslock>
    8000478a:	ffffd097          	auipc	ra,0xffffd
    8000478e:	ba0080e7          	jalr	-1120(ra) # 8000132a <acquire>
  xticks = ticks;
    80004792:	00008797          	auipc	a5,0x8
    80004796:	1b678793          	addi	a5,a5,438 # 8000c948 <ticks>
    8000479a:	439c                	lw	a5,0(a5)
    8000479c:	fef42623          	sw	a5,-20(s0)
  release(&tickslock);
    800047a0:	00026517          	auipc	a0,0x26
    800047a4:	24850513          	addi	a0,a0,584 # 8002a9e8 <tickslock>
    800047a8:	ffffd097          	auipc	ra,0xffffd
    800047ac:	be6080e7          	jalr	-1050(ra) # 8000138e <release>
  return xticks;
    800047b0:	fec46783          	lwu	a5,-20(s0)
}
    800047b4:	853e                	mv	a0,a5
    800047b6:	60e2                	ld	ra,24(sp)
    800047b8:	6442                	ld	s0,16(sp)
    800047ba:	6105                	addi	sp,sp,32
    800047bc:	8082                	ret

00000000800047be <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
    800047be:	1101                	addi	sp,sp,-32
    800047c0:	ec06                	sd	ra,24(sp)
    800047c2:	e822                	sd	s0,16(sp)
    800047c4:	1000                	addi	s0,sp,32
  struct buf *b;

  initlock(&bcache.lock, "bcache");
    800047c6:	00008597          	auipc	a1,0x8
    800047ca:	c6a58593          	addi	a1,a1,-918 # 8000c430 <etext+0x430>
    800047ce:	00026517          	auipc	a0,0x26
    800047d2:	23250513          	addi	a0,a0,562 # 8002aa00 <bcache>
    800047d6:	ffffd097          	auipc	ra,0xffffd
    800047da:	b24080e7          	jalr	-1244(ra) # 800012fa <initlock>

  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
    800047de:	00026717          	auipc	a4,0x26
    800047e2:	22270713          	addi	a4,a4,546 # 8002aa00 <bcache>
    800047e6:	67a1                	lui	a5,0x8
    800047e8:	97ba                	add	a5,a5,a4
    800047ea:	0002e717          	auipc	a4,0x2e
    800047ee:	47e70713          	addi	a4,a4,1150 # 80032c68 <bcache+0x8268>
    800047f2:	2ae7b823          	sd	a4,688(a5) # 82b0 <_entry-0x7fff7d50>
  bcache.head.next = &bcache.head;
    800047f6:	00026717          	auipc	a4,0x26
    800047fa:	20a70713          	addi	a4,a4,522 # 8002aa00 <bcache>
    800047fe:	67a1                	lui	a5,0x8
    80004800:	97ba                	add	a5,a5,a4
    80004802:	0002e717          	auipc	a4,0x2e
    80004806:	46670713          	addi	a4,a4,1126 # 80032c68 <bcache+0x8268>
    8000480a:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    8000480e:	00026797          	auipc	a5,0x26
    80004812:	20a78793          	addi	a5,a5,522 # 8002aa18 <bcache+0x18>
    80004816:	fef43423          	sd	a5,-24(s0)
    8000481a:	a895                	j	8000488e <binit+0xd0>
    b->next = bcache.head.next;
    8000481c:	00026717          	auipc	a4,0x26
    80004820:	1e470713          	addi	a4,a4,484 # 8002aa00 <bcache>
    80004824:	67a1                	lui	a5,0x8
    80004826:	97ba                	add	a5,a5,a4
    80004828:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    8000482c:	fe843783          	ld	a5,-24(s0)
    80004830:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004832:	fe843783          	ld	a5,-24(s0)
    80004836:	0002e717          	auipc	a4,0x2e
    8000483a:	43270713          	addi	a4,a4,1074 # 80032c68 <bcache+0x8268>
    8000483e:	e7b8                	sd	a4,72(a5)
    initsleeplock(&b->lock, "buffer");
    80004840:	fe843783          	ld	a5,-24(s0)
    80004844:	07c1                	addi	a5,a5,16
    80004846:	00008597          	auipc	a1,0x8
    8000484a:	bf258593          	addi	a1,a1,-1038 # 8000c438 <etext+0x438>
    8000484e:	853e                	mv	a0,a5
    80004850:	00002097          	auipc	ra,0x2
    80004854:	034080e7          	jalr	52(ra) # 80006884 <initsleeplock>
    bcache.head.next->prev = b;
    80004858:	00026717          	auipc	a4,0x26
    8000485c:	1a870713          	addi	a4,a4,424 # 8002aa00 <bcache>
    80004860:	67a1                	lui	a5,0x8
    80004862:	97ba                	add	a5,a5,a4
    80004864:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004868:	fe843703          	ld	a4,-24(s0)
    8000486c:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    8000486e:	00026717          	auipc	a4,0x26
    80004872:	19270713          	addi	a4,a4,402 # 8002aa00 <bcache>
    80004876:	67a1                	lui	a5,0x8
    80004878:	97ba                	add	a5,a5,a4
    8000487a:	fe843703          	ld	a4,-24(s0)
    8000487e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    80004882:	fe843783          	ld	a5,-24(s0)
    80004886:	45878793          	addi	a5,a5,1112
    8000488a:	fef43423          	sd	a5,-24(s0)
    8000488e:	0002e797          	auipc	a5,0x2e
    80004892:	3da78793          	addi	a5,a5,986 # 80032c68 <bcache+0x8268>
    80004896:	fe843703          	ld	a4,-24(s0)
    8000489a:	f8f761e3          	bltu	a4,a5,8000481c <binit+0x5e>
  }
}
    8000489e:	0001                	nop
    800048a0:	0001                	nop
    800048a2:	60e2                	ld	ra,24(sp)
    800048a4:	6442                	ld	s0,16(sp)
    800048a6:	6105                	addi	sp,sp,32
    800048a8:	8082                	ret

00000000800048aa <bget>:
// Look through buffer cache for block on device dev.
// If not found, allocate a buffer.
// In either case, return locked buffer.
static struct buf*
bget(uint dev, uint blockno)
{
    800048aa:	7179                	addi	sp,sp,-48
    800048ac:	f406                	sd	ra,40(sp)
    800048ae:	f022                	sd	s0,32(sp)
    800048b0:	1800                	addi	s0,sp,48
    800048b2:	87aa                	mv	a5,a0
    800048b4:	872e                	mv	a4,a1
    800048b6:	fcf42e23          	sw	a5,-36(s0)
    800048ba:	87ba                	mv	a5,a4
    800048bc:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  acquire(&bcache.lock);
    800048c0:	00026517          	auipc	a0,0x26
    800048c4:	14050513          	addi	a0,a0,320 # 8002aa00 <bcache>
    800048c8:	ffffd097          	auipc	ra,0xffffd
    800048cc:	a62080e7          	jalr	-1438(ra) # 8000132a <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    800048d0:	00026717          	auipc	a4,0x26
    800048d4:	13070713          	addi	a4,a4,304 # 8002aa00 <bcache>
    800048d8:	67a1                	lui	a5,0x8
    800048da:	97ba                	add	a5,a5,a4
    800048dc:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    800048e0:	fef43423          	sd	a5,-24(s0)
    800048e4:	a095                	j	80004948 <bget+0x9e>
    if(b->dev == dev && b->blockno == blockno){
    800048e6:	fe843783          	ld	a5,-24(s0)
    800048ea:	4798                	lw	a4,8(a5)
    800048ec:	fdc42783          	lw	a5,-36(s0)
    800048f0:	2781                	sext.w	a5,a5
    800048f2:	04e79663          	bne	a5,a4,8000493e <bget+0x94>
    800048f6:	fe843783          	ld	a5,-24(s0)
    800048fa:	47d8                	lw	a4,12(a5)
    800048fc:	fd842783          	lw	a5,-40(s0)
    80004900:	2781                	sext.w	a5,a5
    80004902:	02e79e63          	bne	a5,a4,8000493e <bget+0x94>
      b->refcnt++;
    80004906:	fe843783          	ld	a5,-24(s0)
    8000490a:	43bc                	lw	a5,64(a5)
    8000490c:	2785                	addiw	a5,a5,1
    8000490e:	0007871b          	sext.w	a4,a5
    80004912:	fe843783          	ld	a5,-24(s0)
    80004916:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    80004918:	00026517          	auipc	a0,0x26
    8000491c:	0e850513          	addi	a0,a0,232 # 8002aa00 <bcache>
    80004920:	ffffd097          	auipc	ra,0xffffd
    80004924:	a6e080e7          	jalr	-1426(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    80004928:	fe843783          	ld	a5,-24(s0)
    8000492c:	07c1                	addi	a5,a5,16
    8000492e:	853e                	mv	a0,a5
    80004930:	00002097          	auipc	ra,0x2
    80004934:	fa0080e7          	jalr	-96(ra) # 800068d0 <acquiresleep>
      return b;
    80004938:	fe843783          	ld	a5,-24(s0)
    8000493c:	a07d                	j	800049ea <bget+0x140>
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
    8000493e:	fe843783          	ld	a5,-24(s0)
    80004942:	6bbc                	ld	a5,80(a5)
    80004944:	fef43423          	sd	a5,-24(s0)
    80004948:	fe843703          	ld	a4,-24(s0)
    8000494c:	0002e797          	auipc	a5,0x2e
    80004950:	31c78793          	addi	a5,a5,796 # 80032c68 <bcache+0x8268>
    80004954:	f8f719e3          	bne	a4,a5,800048e6 <bget+0x3c>
    }
  }

  // Not cached.
  // Recycle the least recently used (LRU) unused buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    80004958:	00026717          	auipc	a4,0x26
    8000495c:	0a870713          	addi	a4,a4,168 # 8002aa00 <bcache>
    80004960:	67a1                	lui	a5,0x8
    80004962:	97ba                	add	a5,a5,a4
    80004964:	2b07b783          	ld	a5,688(a5) # 82b0 <_entry-0x7fff7d50>
    80004968:	fef43423          	sd	a5,-24(s0)
    8000496c:	a8b9                	j	800049ca <bget+0x120>
    if(b->refcnt == 0) {
    8000496e:	fe843783          	ld	a5,-24(s0)
    80004972:	43bc                	lw	a5,64(a5)
    80004974:	e7b1                	bnez	a5,800049c0 <bget+0x116>
      b->dev = dev;
    80004976:	fe843783          	ld	a5,-24(s0)
    8000497a:	fdc42703          	lw	a4,-36(s0)
    8000497e:	c798                	sw	a4,8(a5)
      b->blockno = blockno;
    80004980:	fe843783          	ld	a5,-24(s0)
    80004984:	fd842703          	lw	a4,-40(s0)
    80004988:	c7d8                	sw	a4,12(a5)
      b->valid = 0;
    8000498a:	fe843783          	ld	a5,-24(s0)
    8000498e:	0007a023          	sw	zero,0(a5)
      b->refcnt = 1;
    80004992:	fe843783          	ld	a5,-24(s0)
    80004996:	4705                	li	a4,1
    80004998:	c3b8                	sw	a4,64(a5)
      release(&bcache.lock);
    8000499a:	00026517          	auipc	a0,0x26
    8000499e:	06650513          	addi	a0,a0,102 # 8002aa00 <bcache>
    800049a2:	ffffd097          	auipc	ra,0xffffd
    800049a6:	9ec080e7          	jalr	-1556(ra) # 8000138e <release>
      acquiresleep(&b->lock);
    800049aa:	fe843783          	ld	a5,-24(s0)
    800049ae:	07c1                	addi	a5,a5,16
    800049b0:	853e                	mv	a0,a5
    800049b2:	00002097          	auipc	ra,0x2
    800049b6:	f1e080e7          	jalr	-226(ra) # 800068d0 <acquiresleep>
      return b;
    800049ba:	fe843783          	ld	a5,-24(s0)
    800049be:	a035                	j	800049ea <bget+0x140>
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
    800049c0:	fe843783          	ld	a5,-24(s0)
    800049c4:	67bc                	ld	a5,72(a5)
    800049c6:	fef43423          	sd	a5,-24(s0)
    800049ca:	fe843703          	ld	a4,-24(s0)
    800049ce:	0002e797          	auipc	a5,0x2e
    800049d2:	29a78793          	addi	a5,a5,666 # 80032c68 <bcache+0x8268>
    800049d6:	f8f71ce3          	bne	a4,a5,8000496e <bget+0xc4>
    }
  }
  panic("bget: no buffers");
    800049da:	00008517          	auipc	a0,0x8
    800049de:	a6650513          	addi	a0,a0,-1434 # 8000c440 <etext+0x440>
    800049e2:	ffffc097          	auipc	ra,0xffffc
    800049e6:	2aa080e7          	jalr	682(ra) # 80000c8c <panic>
}
    800049ea:	853e                	mv	a0,a5
    800049ec:	70a2                	ld	ra,40(sp)
    800049ee:	7402                	ld	s0,32(sp)
    800049f0:	6145                	addi	sp,sp,48
    800049f2:	8082                	ret

00000000800049f4 <bread>:

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
    800049f4:	7179                	addi	sp,sp,-48
    800049f6:	f406                	sd	ra,40(sp)
    800049f8:	f022                	sd	s0,32(sp)
    800049fa:	1800                	addi	s0,sp,48
    800049fc:	87aa                	mv	a5,a0
    800049fe:	872e                	mv	a4,a1
    80004a00:	fcf42e23          	sw	a5,-36(s0)
    80004a04:	87ba                	mv	a5,a4
    80004a06:	fcf42c23          	sw	a5,-40(s0)
  struct buf *b;

  b = bget(dev, blockno);
    80004a0a:	fd842703          	lw	a4,-40(s0)
    80004a0e:	fdc42783          	lw	a5,-36(s0)
    80004a12:	85ba                	mv	a1,a4
    80004a14:	853e                	mv	a0,a5
    80004a16:	00000097          	auipc	ra,0x0
    80004a1a:	e94080e7          	jalr	-364(ra) # 800048aa <bget>
    80004a1e:	fea43423          	sd	a0,-24(s0)
  if(!b->valid) {
    80004a22:	fe843783          	ld	a5,-24(s0)
    80004a26:	439c                	lw	a5,0(a5)
    80004a28:	ef91                	bnez	a5,80004a44 <bread+0x50>
    virtio_disk_rw(VIRTIO0_ID, b, 0, 0);
    80004a2a:	4681                	li	a3,0
    80004a2c:	4601                	li	a2,0
    80004a2e:	fe843583          	ld	a1,-24(s0)
    80004a32:	4501                	li	a0,0
    80004a34:	00005097          	auipc	ra,0x5
    80004a38:	d1e080e7          	jalr	-738(ra) # 80009752 <virtio_disk_rw>
    b->valid = 1;
    80004a3c:	fe843783          	ld	a5,-24(s0)
    80004a40:	4705                	li	a4,1
    80004a42:	c398                	sw	a4,0(a5)
  }
  return b;
    80004a44:	fe843783          	ld	a5,-24(s0)
}
    80004a48:	853e                	mv	a0,a5
    80004a4a:	70a2                	ld	ra,40(sp)
    80004a4c:	7402                	ld	s0,32(sp)
    80004a4e:	6145                	addi	sp,sp,48
    80004a50:	8082                	ret

0000000080004a52 <bwrite>:

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
    80004a52:	1101                	addi	sp,sp,-32
    80004a54:	ec06                	sd	ra,24(sp)
    80004a56:	e822                	sd	s0,16(sp)
    80004a58:	1000                	addi	s0,sp,32
    80004a5a:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004a5e:	fe843783          	ld	a5,-24(s0)
    80004a62:	07c1                	addi	a5,a5,16
    80004a64:	853e                	mv	a0,a5
    80004a66:	00002097          	auipc	ra,0x2
    80004a6a:	f2a080e7          	jalr	-214(ra) # 80006990 <holdingsleep>
    80004a6e:	87aa                	mv	a5,a0
    80004a70:	eb89                	bnez	a5,80004a82 <bwrite+0x30>
    panic("bwrite");
    80004a72:	00008517          	auipc	a0,0x8
    80004a76:	9e650513          	addi	a0,a0,-1562 # 8000c458 <etext+0x458>
    80004a7a:	ffffc097          	auipc	ra,0xffffc
    80004a7e:	212080e7          	jalr	530(ra) # 80000c8c <panic>
  virtio_disk_rw(VIRTIO0_ID, b, 1, 0);
    80004a82:	4681                	li	a3,0
    80004a84:	4605                	li	a2,1
    80004a86:	fe843583          	ld	a1,-24(s0)
    80004a8a:	4501                	li	a0,0
    80004a8c:	00005097          	auipc	ra,0x5
    80004a90:	cc6080e7          	jalr	-826(ra) # 80009752 <virtio_disk_rw>
}
    80004a94:	0001                	nop
    80004a96:	60e2                	ld	ra,24(sp)
    80004a98:	6442                	ld	s0,16(sp)
    80004a9a:	6105                	addi	sp,sp,32
    80004a9c:	8082                	ret

0000000080004a9e <brelse>:

// Release a locked buffer.
// Move to the head of the most-recently-used list.
void
brelse(struct buf *b)
{
    80004a9e:	1101                	addi	sp,sp,-32
    80004aa0:	ec06                	sd	ra,24(sp)
    80004aa2:	e822                	sd	s0,16(sp)
    80004aa4:	1000                	addi	s0,sp,32
    80004aa6:	fea43423          	sd	a0,-24(s0)
  if(!holdingsleep(&b->lock))
    80004aaa:	fe843783          	ld	a5,-24(s0)
    80004aae:	07c1                	addi	a5,a5,16
    80004ab0:	853e                	mv	a0,a5
    80004ab2:	00002097          	auipc	ra,0x2
    80004ab6:	ede080e7          	jalr	-290(ra) # 80006990 <holdingsleep>
    80004aba:	87aa                	mv	a5,a0
    80004abc:	eb89                	bnez	a5,80004ace <brelse+0x30>
    panic("brelse");
    80004abe:	00008517          	auipc	a0,0x8
    80004ac2:	9a250513          	addi	a0,a0,-1630 # 8000c460 <etext+0x460>
    80004ac6:	ffffc097          	auipc	ra,0xffffc
    80004aca:	1c6080e7          	jalr	454(ra) # 80000c8c <panic>

  releasesleep(&b->lock);
    80004ace:	fe843783          	ld	a5,-24(s0)
    80004ad2:	07c1                	addi	a5,a5,16
    80004ad4:	853e                	mv	a0,a5
    80004ad6:	00002097          	auipc	ra,0x2
    80004ada:	e68080e7          	jalr	-408(ra) # 8000693e <releasesleep>

  acquire(&bcache.lock);
    80004ade:	00026517          	auipc	a0,0x26
    80004ae2:	f2250513          	addi	a0,a0,-222 # 8002aa00 <bcache>
    80004ae6:	ffffd097          	auipc	ra,0xffffd
    80004aea:	844080e7          	jalr	-1980(ra) # 8000132a <acquire>
  b->refcnt--;
    80004aee:	fe843783          	ld	a5,-24(s0)
    80004af2:	43bc                	lw	a5,64(a5)
    80004af4:	37fd                	addiw	a5,a5,-1
    80004af6:	0007871b          	sext.w	a4,a5
    80004afa:	fe843783          	ld	a5,-24(s0)
    80004afe:	c3b8                	sw	a4,64(a5)
  if (b->refcnt == 0) {
    80004b00:	fe843783          	ld	a5,-24(s0)
    80004b04:	43bc                	lw	a5,64(a5)
    80004b06:	e7b5                	bnez	a5,80004b72 <brelse+0xd4>
    // no one is waiting for it.
    b->next->prev = b->prev;
    80004b08:	fe843783          	ld	a5,-24(s0)
    80004b0c:	6bbc                	ld	a5,80(a5)
    80004b0e:	fe843703          	ld	a4,-24(s0)
    80004b12:	6738                	ld	a4,72(a4)
    80004b14:	e7b8                	sd	a4,72(a5)
    b->prev->next = b->next;
    80004b16:	fe843783          	ld	a5,-24(s0)
    80004b1a:	67bc                	ld	a5,72(a5)
    80004b1c:	fe843703          	ld	a4,-24(s0)
    80004b20:	6b38                	ld	a4,80(a4)
    80004b22:	ebb8                	sd	a4,80(a5)
    b->next = bcache.head.next;
    80004b24:	00026717          	auipc	a4,0x26
    80004b28:	edc70713          	addi	a4,a4,-292 # 8002aa00 <bcache>
    80004b2c:	67a1                	lui	a5,0x8
    80004b2e:	97ba                	add	a5,a5,a4
    80004b30:	2b87b703          	ld	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b34:	fe843783          	ld	a5,-24(s0)
    80004b38:	ebb8                	sd	a4,80(a5)
    b->prev = &bcache.head;
    80004b3a:	fe843783          	ld	a5,-24(s0)
    80004b3e:	0002e717          	auipc	a4,0x2e
    80004b42:	12a70713          	addi	a4,a4,298 # 80032c68 <bcache+0x8268>
    80004b46:	e7b8                	sd	a4,72(a5)
    bcache.head.next->prev = b;
    80004b48:	00026717          	auipc	a4,0x26
    80004b4c:	eb870713          	addi	a4,a4,-328 # 8002aa00 <bcache>
    80004b50:	67a1                	lui	a5,0x8
    80004b52:	97ba                	add	a5,a5,a4
    80004b54:	2b87b783          	ld	a5,696(a5) # 82b8 <_entry-0x7fff7d48>
    80004b58:	fe843703          	ld	a4,-24(s0)
    80004b5c:	e7b8                	sd	a4,72(a5)
    bcache.head.next = b;
    80004b5e:	00026717          	auipc	a4,0x26
    80004b62:	ea270713          	addi	a4,a4,-350 # 8002aa00 <bcache>
    80004b66:	67a1                	lui	a5,0x8
    80004b68:	97ba                	add	a5,a5,a4
    80004b6a:	fe843703          	ld	a4,-24(s0)
    80004b6e:	2ae7bc23          	sd	a4,696(a5) # 82b8 <_entry-0x7fff7d48>
  }
  
  release(&bcache.lock);
    80004b72:	00026517          	auipc	a0,0x26
    80004b76:	e8e50513          	addi	a0,a0,-370 # 8002aa00 <bcache>
    80004b7a:	ffffd097          	auipc	ra,0xffffd
    80004b7e:	814080e7          	jalr	-2028(ra) # 8000138e <release>
}
    80004b82:	0001                	nop
    80004b84:	60e2                	ld	ra,24(sp)
    80004b86:	6442                	ld	s0,16(sp)
    80004b88:	6105                	addi	sp,sp,32
    80004b8a:	8082                	ret

0000000080004b8c <bpin>:

void
bpin(struct buf *b) {
    80004b8c:	1101                	addi	sp,sp,-32
    80004b8e:	ec06                	sd	ra,24(sp)
    80004b90:	e822                	sd	s0,16(sp)
    80004b92:	1000                	addi	s0,sp,32
    80004b94:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004b98:	00026517          	auipc	a0,0x26
    80004b9c:	e6850513          	addi	a0,a0,-408 # 8002aa00 <bcache>
    80004ba0:	ffffc097          	auipc	ra,0xffffc
    80004ba4:	78a080e7          	jalr	1930(ra) # 8000132a <acquire>
  b->refcnt++;
    80004ba8:	fe843783          	ld	a5,-24(s0)
    80004bac:	43bc                	lw	a5,64(a5)
    80004bae:	2785                	addiw	a5,a5,1
    80004bb0:	0007871b          	sext.w	a4,a5
    80004bb4:	fe843783          	ld	a5,-24(s0)
    80004bb8:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004bba:	00026517          	auipc	a0,0x26
    80004bbe:	e4650513          	addi	a0,a0,-442 # 8002aa00 <bcache>
    80004bc2:	ffffc097          	auipc	ra,0xffffc
    80004bc6:	7cc080e7          	jalr	1996(ra) # 8000138e <release>
}
    80004bca:	0001                	nop
    80004bcc:	60e2                	ld	ra,24(sp)
    80004bce:	6442                	ld	s0,16(sp)
    80004bd0:	6105                	addi	sp,sp,32
    80004bd2:	8082                	ret

0000000080004bd4 <bunpin>:

void
bunpin(struct buf *b) {
    80004bd4:	1101                	addi	sp,sp,-32
    80004bd6:	ec06                	sd	ra,24(sp)
    80004bd8:	e822                	sd	s0,16(sp)
    80004bda:	1000                	addi	s0,sp,32
    80004bdc:	fea43423          	sd	a0,-24(s0)
  acquire(&bcache.lock);
    80004be0:	00026517          	auipc	a0,0x26
    80004be4:	e2050513          	addi	a0,a0,-480 # 8002aa00 <bcache>
    80004be8:	ffffc097          	auipc	ra,0xffffc
    80004bec:	742080e7          	jalr	1858(ra) # 8000132a <acquire>
  b->refcnt--;
    80004bf0:	fe843783          	ld	a5,-24(s0)
    80004bf4:	43bc                	lw	a5,64(a5)
    80004bf6:	37fd                	addiw	a5,a5,-1
    80004bf8:	0007871b          	sext.w	a4,a5
    80004bfc:	fe843783          	ld	a5,-24(s0)
    80004c00:	c3b8                	sw	a4,64(a5)
  release(&bcache.lock);
    80004c02:	00026517          	auipc	a0,0x26
    80004c06:	dfe50513          	addi	a0,a0,-514 # 8002aa00 <bcache>
    80004c0a:	ffffc097          	auipc	ra,0xffffc
    80004c0e:	784080e7          	jalr	1924(ra) # 8000138e <release>
}
    80004c12:	0001                	nop
    80004c14:	60e2                	ld	ra,24(sp)
    80004c16:	6442                	ld	s0,16(sp)
    80004c18:	6105                	addi	sp,sp,32
    80004c1a:	8082                	ret

0000000080004c1c <readsb>:
struct superblock sb; 

// Read the super block.
static void
readsb(int dev, struct superblock *sb)
{
    80004c1c:	7179                	addi	sp,sp,-48
    80004c1e:	f406                	sd	ra,40(sp)
    80004c20:	f022                	sd	s0,32(sp)
    80004c22:	1800                	addi	s0,sp,48
    80004c24:	87aa                	mv	a5,a0
    80004c26:	fcb43823          	sd	a1,-48(s0)
    80004c2a:	fcf42e23          	sw	a5,-36(s0)
  struct buf *bp;

  bp = bread(dev, 1);
    80004c2e:	fdc42783          	lw	a5,-36(s0)
    80004c32:	4585                	li	a1,1
    80004c34:	853e                	mv	a0,a5
    80004c36:	00000097          	auipc	ra,0x0
    80004c3a:	dbe080e7          	jalr	-578(ra) # 800049f4 <bread>
    80004c3e:	fea43423          	sd	a0,-24(s0)
  memmove(sb, bp->data, sizeof(*sb));
    80004c42:	fe843783          	ld	a5,-24(s0)
    80004c46:	05878793          	addi	a5,a5,88
    80004c4a:	02000613          	li	a2,32
    80004c4e:	85be                	mv	a1,a5
    80004c50:	fd043503          	ld	a0,-48(s0)
    80004c54:	ffffd097          	auipc	ra,0xffffd
    80004c58:	98e080e7          	jalr	-1650(ra) # 800015e2 <memmove>
  brelse(bp);
    80004c5c:	fe843503          	ld	a0,-24(s0)
    80004c60:	00000097          	auipc	ra,0x0
    80004c64:	e3e080e7          	jalr	-450(ra) # 80004a9e <brelse>
}
    80004c68:	0001                	nop
    80004c6a:	70a2                	ld	ra,40(sp)
    80004c6c:	7402                	ld	s0,32(sp)
    80004c6e:	6145                	addi	sp,sp,48
    80004c70:	8082                	ret

0000000080004c72 <fsinit>:

// Init fs
void
fsinit(int dev) {
    80004c72:	1101                	addi	sp,sp,-32
    80004c74:	ec06                	sd	ra,24(sp)
    80004c76:	e822                	sd	s0,16(sp)
    80004c78:	1000                	addi	s0,sp,32
    80004c7a:	87aa                	mv	a5,a0
    80004c7c:	fef42623          	sw	a5,-20(s0)
  readsb(dev, &sb);
    80004c80:	fec42783          	lw	a5,-20(s0)
    80004c84:	0002e597          	auipc	a1,0x2e
    80004c88:	43c58593          	addi	a1,a1,1084 # 800330c0 <sb>
    80004c8c:	853e                	mv	a0,a5
    80004c8e:	00000097          	auipc	ra,0x0
    80004c92:	f8e080e7          	jalr	-114(ra) # 80004c1c <readsb>
  if(sb.magic != FSMAGIC)
    80004c96:	0002e797          	auipc	a5,0x2e
    80004c9a:	42a78793          	addi	a5,a5,1066 # 800330c0 <sb>
    80004c9e:	439c                	lw	a5,0(a5)
    80004ca0:	873e                	mv	a4,a5
    80004ca2:	102037b7          	lui	a5,0x10203
    80004ca6:	04078793          	addi	a5,a5,64 # 10203040 <_entry-0x6fdfcfc0>
    80004caa:	00f70a63          	beq	a4,a5,80004cbe <fsinit+0x4c>
    panic("invalid file system");
    80004cae:	00007517          	auipc	a0,0x7
    80004cb2:	7ba50513          	addi	a0,a0,1978 # 8000c468 <etext+0x468>
    80004cb6:	ffffc097          	auipc	ra,0xffffc
    80004cba:	fd6080e7          	jalr	-42(ra) # 80000c8c <panic>
  initlog(dev, &sb);
    80004cbe:	fec42783          	lw	a5,-20(s0)
    80004cc2:	0002e597          	auipc	a1,0x2e
    80004cc6:	3fe58593          	addi	a1,a1,1022 # 800330c0 <sb>
    80004cca:	853e                	mv	a0,a5
    80004ccc:	00001097          	auipc	ra,0x1
    80004cd0:	49c080e7          	jalr	1180(ra) # 80006168 <initlog>
}
    80004cd4:	0001                	nop
    80004cd6:	60e2                	ld	ra,24(sp)
    80004cd8:	6442                	ld	s0,16(sp)
    80004cda:	6105                	addi	sp,sp,32
    80004cdc:	8082                	ret

0000000080004cde <bzero>:

// Zero a block.
static void
bzero(int dev, int bno)
{
    80004cde:	7179                	addi	sp,sp,-48
    80004ce0:	f406                	sd	ra,40(sp)
    80004ce2:	f022                	sd	s0,32(sp)
    80004ce4:	1800                	addi	s0,sp,48
    80004ce6:	87aa                	mv	a5,a0
    80004ce8:	872e                	mv	a4,a1
    80004cea:	fcf42e23          	sw	a5,-36(s0)
    80004cee:	87ba                	mv	a5,a4
    80004cf0:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;

  bp = bread(dev, bno);
    80004cf4:	fdc42783          	lw	a5,-36(s0)
    80004cf8:	fd842703          	lw	a4,-40(s0)
    80004cfc:	85ba                	mv	a1,a4
    80004cfe:	853e                	mv	a0,a5
    80004d00:	00000097          	auipc	ra,0x0
    80004d04:	cf4080e7          	jalr	-780(ra) # 800049f4 <bread>
    80004d08:	fea43423          	sd	a0,-24(s0)
  memset(bp->data, 0, BSIZE);
    80004d0c:	fe843783          	ld	a5,-24(s0)
    80004d10:	05878793          	addi	a5,a5,88
    80004d14:	40000613          	li	a2,1024
    80004d18:	4581                	li	a1,0
    80004d1a:	853e                	mv	a0,a5
    80004d1c:	ffffc097          	auipc	ra,0xffffc
    80004d20:	7e2080e7          	jalr	2018(ra) # 800014fe <memset>
  log_write(bp);
    80004d24:	fe843503          	ld	a0,-24(s0)
    80004d28:	00002097          	auipc	ra,0x2
    80004d2c:	a28080e7          	jalr	-1496(ra) # 80006750 <log_write>
  brelse(bp);
    80004d30:	fe843503          	ld	a0,-24(s0)
    80004d34:	00000097          	auipc	ra,0x0
    80004d38:	d6a080e7          	jalr	-662(ra) # 80004a9e <brelse>
}
    80004d3c:	0001                	nop
    80004d3e:	70a2                	ld	ra,40(sp)
    80004d40:	7402                	ld	s0,32(sp)
    80004d42:	6145                	addi	sp,sp,48
    80004d44:	8082                	ret

0000000080004d46 <balloc>:

// Allocate a zeroed disk block.
// returns 0 if out of disk space.
static uint
balloc(uint dev)
{
    80004d46:	7139                	addi	sp,sp,-64
    80004d48:	fc06                	sd	ra,56(sp)
    80004d4a:	f822                	sd	s0,48(sp)
    80004d4c:	0080                	addi	s0,sp,64
    80004d4e:	87aa                	mv	a5,a0
    80004d50:	fcf42623          	sw	a5,-52(s0)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
    80004d54:	fe043023          	sd	zero,-32(s0)
  for(b = 0; b < sb.size; b += BPB){
    80004d58:	fe042623          	sw	zero,-20(s0)
    80004d5c:	a2b5                	j	80004ec8 <balloc+0x182>
    bp = bread(dev, BBLOCK(b, sb));
    80004d5e:	fec42783          	lw	a5,-20(s0)
    80004d62:	41f7d71b          	sraiw	a4,a5,0x1f
    80004d66:	0137571b          	srliw	a4,a4,0x13
    80004d6a:	9fb9                	addw	a5,a5,a4
    80004d6c:	40d7d79b          	sraiw	a5,a5,0xd
    80004d70:	2781                	sext.w	a5,a5
    80004d72:	0007871b          	sext.w	a4,a5
    80004d76:	0002e797          	auipc	a5,0x2e
    80004d7a:	34a78793          	addi	a5,a5,842 # 800330c0 <sb>
    80004d7e:	4fdc                	lw	a5,28(a5)
    80004d80:	9fb9                	addw	a5,a5,a4
    80004d82:	0007871b          	sext.w	a4,a5
    80004d86:	fcc42783          	lw	a5,-52(s0)
    80004d8a:	85ba                	mv	a1,a4
    80004d8c:	853e                	mv	a0,a5
    80004d8e:	00000097          	auipc	ra,0x0
    80004d92:	c66080e7          	jalr	-922(ra) # 800049f4 <bread>
    80004d96:	fea43023          	sd	a0,-32(s0)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004d9a:	fe042423          	sw	zero,-24(s0)
    80004d9e:	a0dd                	j	80004e84 <balloc+0x13e>
      m = 1 << (bi % 8);
    80004da0:	fe842703          	lw	a4,-24(s0)
    80004da4:	41f7579b          	sraiw	a5,a4,0x1f
    80004da8:	01d7d79b          	srliw	a5,a5,0x1d
    80004dac:	9f3d                	addw	a4,a4,a5
    80004dae:	8b1d                	andi	a4,a4,7
    80004db0:	40f707bb          	subw	a5,a4,a5
    80004db4:	2781                	sext.w	a5,a5
    80004db6:	4705                	li	a4,1
    80004db8:	00f717bb          	sllw	a5,a4,a5
    80004dbc:	fcf42e23          	sw	a5,-36(s0)
      if((bp->data[bi/8] & m) == 0){  // Is block free?
    80004dc0:	fe842783          	lw	a5,-24(s0)
    80004dc4:	41f7d71b          	sraiw	a4,a5,0x1f
    80004dc8:	01d7571b          	srliw	a4,a4,0x1d
    80004dcc:	9fb9                	addw	a5,a5,a4
    80004dce:	4037d79b          	sraiw	a5,a5,0x3
    80004dd2:	2781                	sext.w	a5,a5
    80004dd4:	fe043703          	ld	a4,-32(s0)
    80004dd8:	97ba                	add	a5,a5,a4
    80004dda:	0587c783          	lbu	a5,88(a5)
    80004dde:	0007871b          	sext.w	a4,a5
    80004de2:	fdc42783          	lw	a5,-36(s0)
    80004de6:	8ff9                	and	a5,a5,a4
    80004de8:	2781                	sext.w	a5,a5
    80004dea:	ebc1                	bnez	a5,80004e7a <balloc+0x134>
        bp->data[bi/8] |= m;  // Mark block in use.
    80004dec:	fe842783          	lw	a5,-24(s0)
    80004df0:	41f7d71b          	sraiw	a4,a5,0x1f
    80004df4:	01d7571b          	srliw	a4,a4,0x1d
    80004df8:	9fb9                	addw	a5,a5,a4
    80004dfa:	4037d79b          	sraiw	a5,a5,0x3
    80004dfe:	2781                	sext.w	a5,a5
    80004e00:	fe043703          	ld	a4,-32(s0)
    80004e04:	973e                	add	a4,a4,a5
    80004e06:	05874703          	lbu	a4,88(a4)
    80004e0a:	0187169b          	slliw	a3,a4,0x18
    80004e0e:	4186d69b          	sraiw	a3,a3,0x18
    80004e12:	fdc42703          	lw	a4,-36(s0)
    80004e16:	0187171b          	slliw	a4,a4,0x18
    80004e1a:	4187571b          	sraiw	a4,a4,0x18
    80004e1e:	8f55                	or	a4,a4,a3
    80004e20:	0187171b          	slliw	a4,a4,0x18
    80004e24:	4187571b          	sraiw	a4,a4,0x18
    80004e28:	0ff77713          	andi	a4,a4,255
    80004e2c:	fe043683          	ld	a3,-32(s0)
    80004e30:	97b6                	add	a5,a5,a3
    80004e32:	04e78c23          	sb	a4,88(a5)
        log_write(bp);
    80004e36:	fe043503          	ld	a0,-32(s0)
    80004e3a:	00002097          	auipc	ra,0x2
    80004e3e:	916080e7          	jalr	-1770(ra) # 80006750 <log_write>
        brelse(bp);
    80004e42:	fe043503          	ld	a0,-32(s0)
    80004e46:	00000097          	auipc	ra,0x0
    80004e4a:	c58080e7          	jalr	-936(ra) # 80004a9e <brelse>
        bzero(dev, b + bi);
    80004e4e:	fcc42683          	lw	a3,-52(s0)
    80004e52:	fec42703          	lw	a4,-20(s0)
    80004e56:	fe842783          	lw	a5,-24(s0)
    80004e5a:	9fb9                	addw	a5,a5,a4
    80004e5c:	2781                	sext.w	a5,a5
    80004e5e:	85be                	mv	a1,a5
    80004e60:	8536                	mv	a0,a3
    80004e62:	00000097          	auipc	ra,0x0
    80004e66:	e7c080e7          	jalr	-388(ra) # 80004cde <bzero>
        return b + bi;
    80004e6a:	fec42703          	lw	a4,-20(s0)
    80004e6e:	fe842783          	lw	a5,-24(s0)
    80004e72:	9fb9                	addw	a5,a5,a4
    80004e74:	2781                	sext.w	a5,a5
    80004e76:	2781                	sext.w	a5,a5
    80004e78:	a895                	j	80004eec <balloc+0x1a6>
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
    80004e7a:	fe842783          	lw	a5,-24(s0)
    80004e7e:	2785                	addiw	a5,a5,1
    80004e80:	fef42423          	sw	a5,-24(s0)
    80004e84:	fe842783          	lw	a5,-24(s0)
    80004e88:	0007871b          	sext.w	a4,a5
    80004e8c:	6789                	lui	a5,0x2
    80004e8e:	02f75163          	bge	a4,a5,80004eb0 <balloc+0x16a>
    80004e92:	fec42703          	lw	a4,-20(s0)
    80004e96:	fe842783          	lw	a5,-24(s0)
    80004e9a:	9fb9                	addw	a5,a5,a4
    80004e9c:	2781                	sext.w	a5,a5
    80004e9e:	0007871b          	sext.w	a4,a5
    80004ea2:	0002e797          	auipc	a5,0x2e
    80004ea6:	21e78793          	addi	a5,a5,542 # 800330c0 <sb>
    80004eaa:	43dc                	lw	a5,4(a5)
    80004eac:	eef76ae3          	bltu	a4,a5,80004da0 <balloc+0x5a>
      }
    }
    brelse(bp);
    80004eb0:	fe043503          	ld	a0,-32(s0)
    80004eb4:	00000097          	auipc	ra,0x0
    80004eb8:	bea080e7          	jalr	-1046(ra) # 80004a9e <brelse>
  for(b = 0; b < sb.size; b += BPB){
    80004ebc:	fec42703          	lw	a4,-20(s0)
    80004ec0:	6789                	lui	a5,0x2
    80004ec2:	9fb9                	addw	a5,a5,a4
    80004ec4:	fef42623          	sw	a5,-20(s0)
    80004ec8:	0002e797          	auipc	a5,0x2e
    80004ecc:	1f878793          	addi	a5,a5,504 # 800330c0 <sb>
    80004ed0:	43d8                	lw	a4,4(a5)
    80004ed2:	fec42783          	lw	a5,-20(s0)
    80004ed6:	e8e7e4e3          	bltu	a5,a4,80004d5e <balloc+0x18>
  }
  printf("balloc: out of blocks\n");
    80004eda:	00007517          	auipc	a0,0x7
    80004ede:	5a650513          	addi	a0,a0,1446 # 8000c480 <etext+0x480>
    80004ee2:	ffffc097          	auipc	ra,0xffffc
    80004ee6:	b54080e7          	jalr	-1196(ra) # 80000a36 <printf>
  return 0;
    80004eea:	4781                	li	a5,0
}
    80004eec:	853e                	mv	a0,a5
    80004eee:	70e2                	ld	ra,56(sp)
    80004ef0:	7442                	ld	s0,48(sp)
    80004ef2:	6121                	addi	sp,sp,64
    80004ef4:	8082                	ret

0000000080004ef6 <bfree>:

// Free a disk block.
static void
bfree(int dev, uint b)
{
    80004ef6:	7179                	addi	sp,sp,-48
    80004ef8:	f406                	sd	ra,40(sp)
    80004efa:	f022                	sd	s0,32(sp)
    80004efc:	1800                	addi	s0,sp,48
    80004efe:	87aa                	mv	a5,a0
    80004f00:	872e                	mv	a4,a1
    80004f02:	fcf42e23          	sw	a5,-36(s0)
    80004f06:	87ba                	mv	a5,a4
    80004f08:	fcf42c23          	sw	a5,-40(s0)
  struct buf *bp;
  int bi, m;

  bp = bread(dev, BBLOCK(b, sb));
    80004f0c:	fdc42683          	lw	a3,-36(s0)
    80004f10:	fd842783          	lw	a5,-40(s0)
    80004f14:	00d7d79b          	srliw	a5,a5,0xd
    80004f18:	0007871b          	sext.w	a4,a5
    80004f1c:	0002e797          	auipc	a5,0x2e
    80004f20:	1a478793          	addi	a5,a5,420 # 800330c0 <sb>
    80004f24:	4fdc                	lw	a5,28(a5)
    80004f26:	9fb9                	addw	a5,a5,a4
    80004f28:	2781                	sext.w	a5,a5
    80004f2a:	85be                	mv	a1,a5
    80004f2c:	8536                	mv	a0,a3
    80004f2e:	00000097          	auipc	ra,0x0
    80004f32:	ac6080e7          	jalr	-1338(ra) # 800049f4 <bread>
    80004f36:	fea43423          	sd	a0,-24(s0)
  bi = b % BPB;
    80004f3a:	fd842703          	lw	a4,-40(s0)
    80004f3e:	6789                	lui	a5,0x2
    80004f40:	17fd                	addi	a5,a5,-1
    80004f42:	8ff9                	and	a5,a5,a4
    80004f44:	fef42223          	sw	a5,-28(s0)
  m = 1 << (bi % 8);
    80004f48:	fe442703          	lw	a4,-28(s0)
    80004f4c:	41f7579b          	sraiw	a5,a4,0x1f
    80004f50:	01d7d79b          	srliw	a5,a5,0x1d
    80004f54:	9f3d                	addw	a4,a4,a5
    80004f56:	8b1d                	andi	a4,a4,7
    80004f58:	40f707bb          	subw	a5,a4,a5
    80004f5c:	2781                	sext.w	a5,a5
    80004f5e:	4705                	li	a4,1
    80004f60:	00f717bb          	sllw	a5,a4,a5
    80004f64:	fef42023          	sw	a5,-32(s0)
  if((bp->data[bi/8] & m) == 0)
    80004f68:	fe442783          	lw	a5,-28(s0)
    80004f6c:	41f7d71b          	sraiw	a4,a5,0x1f
    80004f70:	01d7571b          	srliw	a4,a4,0x1d
    80004f74:	9fb9                	addw	a5,a5,a4
    80004f76:	4037d79b          	sraiw	a5,a5,0x3
    80004f7a:	2781                	sext.w	a5,a5
    80004f7c:	fe843703          	ld	a4,-24(s0)
    80004f80:	97ba                	add	a5,a5,a4
    80004f82:	0587c783          	lbu	a5,88(a5) # 2058 <_entry-0x7fffdfa8>
    80004f86:	0007871b          	sext.w	a4,a5
    80004f8a:	fe042783          	lw	a5,-32(s0)
    80004f8e:	8ff9                	and	a5,a5,a4
    80004f90:	2781                	sext.w	a5,a5
    80004f92:	eb89                	bnez	a5,80004fa4 <bfree+0xae>
    panic("freeing free block");
    80004f94:	00007517          	auipc	a0,0x7
    80004f98:	50450513          	addi	a0,a0,1284 # 8000c498 <etext+0x498>
    80004f9c:	ffffc097          	auipc	ra,0xffffc
    80004fa0:	cf0080e7          	jalr	-784(ra) # 80000c8c <panic>
  bp->data[bi/8] &= ~m;
    80004fa4:	fe442783          	lw	a5,-28(s0)
    80004fa8:	41f7d71b          	sraiw	a4,a5,0x1f
    80004fac:	01d7571b          	srliw	a4,a4,0x1d
    80004fb0:	9fb9                	addw	a5,a5,a4
    80004fb2:	4037d79b          	sraiw	a5,a5,0x3
    80004fb6:	2781                	sext.w	a5,a5
    80004fb8:	fe843703          	ld	a4,-24(s0)
    80004fbc:	973e                	add	a4,a4,a5
    80004fbe:	05874703          	lbu	a4,88(a4)
    80004fc2:	0187169b          	slliw	a3,a4,0x18
    80004fc6:	4186d69b          	sraiw	a3,a3,0x18
    80004fca:	fe042703          	lw	a4,-32(s0)
    80004fce:	0187171b          	slliw	a4,a4,0x18
    80004fd2:	4187571b          	sraiw	a4,a4,0x18
    80004fd6:	fff74713          	not	a4,a4
    80004fda:	0187171b          	slliw	a4,a4,0x18
    80004fde:	4187571b          	sraiw	a4,a4,0x18
    80004fe2:	8f75                	and	a4,a4,a3
    80004fe4:	0187171b          	slliw	a4,a4,0x18
    80004fe8:	4187571b          	sraiw	a4,a4,0x18
    80004fec:	0ff77713          	andi	a4,a4,255
    80004ff0:	fe843683          	ld	a3,-24(s0)
    80004ff4:	97b6                	add	a5,a5,a3
    80004ff6:	04e78c23          	sb	a4,88(a5)
  log_write(bp);
    80004ffa:	fe843503          	ld	a0,-24(s0)
    80004ffe:	00001097          	auipc	ra,0x1
    80005002:	752080e7          	jalr	1874(ra) # 80006750 <log_write>
  brelse(bp);
    80005006:	fe843503          	ld	a0,-24(s0)
    8000500a:	00000097          	auipc	ra,0x0
    8000500e:	a94080e7          	jalr	-1388(ra) # 80004a9e <brelse>
}
    80005012:	0001                	nop
    80005014:	70a2                	ld	ra,40(sp)
    80005016:	7402                	ld	s0,32(sp)
    80005018:	6145                	addi	sp,sp,48
    8000501a:	8082                	ret

000000008000501c <iinit>:
  struct inode inode[NINODE];
} itable;

void
iinit()
{
    8000501c:	1101                	addi	sp,sp,-32
    8000501e:	ec06                	sd	ra,24(sp)
    80005020:	e822                	sd	s0,16(sp)
    80005022:	1000                	addi	s0,sp,32
  int i = 0;
    80005024:	fe042623          	sw	zero,-20(s0)
  
  initlock(&itable.lock, "itable");
    80005028:	00007597          	auipc	a1,0x7
    8000502c:	48858593          	addi	a1,a1,1160 # 8000c4b0 <etext+0x4b0>
    80005030:	0002e517          	auipc	a0,0x2e
    80005034:	0b050513          	addi	a0,a0,176 # 800330e0 <itable>
    80005038:	ffffc097          	auipc	ra,0xffffc
    8000503c:	2c2080e7          	jalr	706(ra) # 800012fa <initlock>
  for(i = 0; i < NINODE; i++) {
    80005040:	fe042623          	sw	zero,-20(s0)
    80005044:	a82d                	j	8000507e <iinit+0x62>
    initsleeplock(&itable.inode[i].lock, "inode");
    80005046:	fec42703          	lw	a4,-20(s0)
    8000504a:	87ba                	mv	a5,a4
    8000504c:	0792                	slli	a5,a5,0x4
    8000504e:	97ba                	add	a5,a5,a4
    80005050:	078e                	slli	a5,a5,0x3
    80005052:	02078713          	addi	a4,a5,32
    80005056:	0002e797          	auipc	a5,0x2e
    8000505a:	08a78793          	addi	a5,a5,138 # 800330e0 <itable>
    8000505e:	97ba                	add	a5,a5,a4
    80005060:	07a1                	addi	a5,a5,8
    80005062:	00007597          	auipc	a1,0x7
    80005066:	45658593          	addi	a1,a1,1110 # 8000c4b8 <etext+0x4b8>
    8000506a:	853e                	mv	a0,a5
    8000506c:	00002097          	auipc	ra,0x2
    80005070:	818080e7          	jalr	-2024(ra) # 80006884 <initsleeplock>
  for(i = 0; i < NINODE; i++) {
    80005074:	fec42783          	lw	a5,-20(s0)
    80005078:	2785                	addiw	a5,a5,1
    8000507a:	fef42623          	sw	a5,-20(s0)
    8000507e:	fec42783          	lw	a5,-20(s0)
    80005082:	0007871b          	sext.w	a4,a5
    80005086:	03100793          	li	a5,49
    8000508a:	fae7dee3          	bge	a5,a4,80005046 <iinit+0x2a>
  }
}
    8000508e:	0001                	nop
    80005090:	0001                	nop
    80005092:	60e2                	ld	ra,24(sp)
    80005094:	6442                	ld	s0,16(sp)
    80005096:	6105                	addi	sp,sp,32
    80005098:	8082                	ret

000000008000509a <ialloc>:
// Mark it as allocated by  giving it type type.
// Returns an unlocked but allocated and referenced inode,
// or NULL if there is no free inode.
struct inode*
ialloc(uint dev, short type)
{
    8000509a:	7139                	addi	sp,sp,-64
    8000509c:	fc06                	sd	ra,56(sp)
    8000509e:	f822                	sd	s0,48(sp)
    800050a0:	0080                	addi	s0,sp,64
    800050a2:	87aa                	mv	a5,a0
    800050a4:	872e                	mv	a4,a1
    800050a6:	fcf42623          	sw	a5,-52(s0)
    800050aa:	87ba                	mv	a5,a4
    800050ac:	fcf41523          	sh	a5,-54(s0)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    800050b0:	4785                	li	a5,1
    800050b2:	fef42623          	sw	a5,-20(s0)
    800050b6:	a855                	j	8000516a <ialloc+0xd0>
    bp = bread(dev, IBLOCK(inum, sb));
    800050b8:	fec42783          	lw	a5,-20(s0)
    800050bc:	8391                	srli	a5,a5,0x4
    800050be:	0007871b          	sext.w	a4,a5
    800050c2:	0002e797          	auipc	a5,0x2e
    800050c6:	ffe78793          	addi	a5,a5,-2 # 800330c0 <sb>
    800050ca:	4f9c                	lw	a5,24(a5)
    800050cc:	9fb9                	addw	a5,a5,a4
    800050ce:	0007871b          	sext.w	a4,a5
    800050d2:	fcc42783          	lw	a5,-52(s0)
    800050d6:	85ba                	mv	a1,a4
    800050d8:	853e                	mv	a0,a5
    800050da:	00000097          	auipc	ra,0x0
    800050de:	91a080e7          	jalr	-1766(ra) # 800049f4 <bread>
    800050e2:	fea43023          	sd	a0,-32(s0)
    dip = (struct dinode*)bp->data + inum%IPB;
    800050e6:	fe043783          	ld	a5,-32(s0)
    800050ea:	05878713          	addi	a4,a5,88
    800050ee:	fec42783          	lw	a5,-20(s0)
    800050f2:	8bbd                	andi	a5,a5,15
    800050f4:	079a                	slli	a5,a5,0x6
    800050f6:	97ba                	add	a5,a5,a4
    800050f8:	fcf43c23          	sd	a5,-40(s0)
    if(dip->type == 0){  // a free inode
    800050fc:	fd843783          	ld	a5,-40(s0)
    80005100:	00079783          	lh	a5,0(a5)
    80005104:	eba1                	bnez	a5,80005154 <ialloc+0xba>
      memset(dip, 0, sizeof(*dip));
    80005106:	04000613          	li	a2,64
    8000510a:	4581                	li	a1,0
    8000510c:	fd843503          	ld	a0,-40(s0)
    80005110:	ffffc097          	auipc	ra,0xffffc
    80005114:	3ee080e7          	jalr	1006(ra) # 800014fe <memset>
      dip->type = type;
    80005118:	fd843783          	ld	a5,-40(s0)
    8000511c:	fca45703          	lhu	a4,-54(s0)
    80005120:	00e79023          	sh	a4,0(a5)
      log_write(bp);   // mark it allocated on the disk
    80005124:	fe043503          	ld	a0,-32(s0)
    80005128:	00001097          	auipc	ra,0x1
    8000512c:	628080e7          	jalr	1576(ra) # 80006750 <log_write>
      brelse(bp);
    80005130:	fe043503          	ld	a0,-32(s0)
    80005134:	00000097          	auipc	ra,0x0
    80005138:	96a080e7          	jalr	-1686(ra) # 80004a9e <brelse>
      return iget(dev, inum);
    8000513c:	fec42703          	lw	a4,-20(s0)
    80005140:	fcc42783          	lw	a5,-52(s0)
    80005144:	85ba                	mv	a1,a4
    80005146:	853e                	mv	a0,a5
    80005148:	00000097          	auipc	ra,0x0
    8000514c:	138080e7          	jalr	312(ra) # 80005280 <iget>
    80005150:	87aa                	mv	a5,a0
    80005152:	a835                	j	8000518e <ialloc+0xf4>
    }
    brelse(bp);
    80005154:	fe043503          	ld	a0,-32(s0)
    80005158:	00000097          	auipc	ra,0x0
    8000515c:	946080e7          	jalr	-1722(ra) # 80004a9e <brelse>
  for(inum = 1; inum < sb.ninodes; inum++){
    80005160:	fec42783          	lw	a5,-20(s0)
    80005164:	2785                	addiw	a5,a5,1
    80005166:	fef42623          	sw	a5,-20(s0)
    8000516a:	0002e797          	auipc	a5,0x2e
    8000516e:	f5678793          	addi	a5,a5,-170 # 800330c0 <sb>
    80005172:	47d8                	lw	a4,12(a5)
    80005174:	fec42783          	lw	a5,-20(s0)
    80005178:	f4e7e0e3          	bltu	a5,a4,800050b8 <ialloc+0x1e>
  }
  printf("ialloc: no inodes\n");
    8000517c:	00007517          	auipc	a0,0x7
    80005180:	34450513          	addi	a0,a0,836 # 8000c4c0 <etext+0x4c0>
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	8b2080e7          	jalr	-1870(ra) # 80000a36 <printf>
  return 0;
    8000518c:	4781                	li	a5,0
}
    8000518e:	853e                	mv	a0,a5
    80005190:	70e2                	ld	ra,56(sp)
    80005192:	7442                	ld	s0,48(sp)
    80005194:	6121                	addi	sp,sp,64
    80005196:	8082                	ret

0000000080005198 <iupdate>:
// Must be called after every change to an ip->xxx field
// that lives on disk.
// Caller must hold ip->lock.
void
iupdate(struct inode *ip)
{
    80005198:	7179                	addi	sp,sp,-48
    8000519a:	f406                	sd	ra,40(sp)
    8000519c:	f022                	sd	s0,32(sp)
    8000519e:	1800                	addi	s0,sp,48
    800051a0:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    800051a4:	fd843783          	ld	a5,-40(s0)
    800051a8:	4394                	lw	a3,0(a5)
    800051aa:	fd843783          	ld	a5,-40(s0)
    800051ae:	43dc                	lw	a5,4(a5)
    800051b0:	0047d79b          	srliw	a5,a5,0x4
    800051b4:	0007871b          	sext.w	a4,a5
    800051b8:	0002e797          	auipc	a5,0x2e
    800051bc:	f0878793          	addi	a5,a5,-248 # 800330c0 <sb>
    800051c0:	4f9c                	lw	a5,24(a5)
    800051c2:	9fb9                	addw	a5,a5,a4
    800051c4:	2781                	sext.w	a5,a5
    800051c6:	85be                	mv	a1,a5
    800051c8:	8536                	mv	a0,a3
    800051ca:	00000097          	auipc	ra,0x0
    800051ce:	82a080e7          	jalr	-2006(ra) # 800049f4 <bread>
    800051d2:	fea43423          	sd	a0,-24(s0)
  dip = (struct dinode*)bp->data + ip->inum%IPB;
    800051d6:	fe843783          	ld	a5,-24(s0)
    800051da:	05878713          	addi	a4,a5,88
    800051de:	fd843783          	ld	a5,-40(s0)
    800051e2:	43dc                	lw	a5,4(a5)
    800051e4:	1782                	slli	a5,a5,0x20
    800051e6:	9381                	srli	a5,a5,0x20
    800051e8:	8bbd                	andi	a5,a5,15
    800051ea:	079a                	slli	a5,a5,0x6
    800051ec:	97ba                	add	a5,a5,a4
    800051ee:	fef43023          	sd	a5,-32(s0)
  dip->type = ip->type;
    800051f2:	fd843783          	ld	a5,-40(s0)
    800051f6:	04479703          	lh	a4,68(a5)
    800051fa:	fe043783          	ld	a5,-32(s0)
    800051fe:	00e79023          	sh	a4,0(a5)
  dip->major = ip->major;
    80005202:	fd843783          	ld	a5,-40(s0)
    80005206:	04679703          	lh	a4,70(a5)
    8000520a:	fe043783          	ld	a5,-32(s0)
    8000520e:	00e79123          	sh	a4,2(a5)
  dip->minor = ip->minor;
    80005212:	fd843783          	ld	a5,-40(s0)
    80005216:	04879703          	lh	a4,72(a5)
    8000521a:	fe043783          	ld	a5,-32(s0)
    8000521e:	00e79223          	sh	a4,4(a5)
  dip->nlink = ip->nlink;
    80005222:	fd843783          	ld	a5,-40(s0)
    80005226:	04a79703          	lh	a4,74(a5)
    8000522a:	fe043783          	ld	a5,-32(s0)
    8000522e:	00e79323          	sh	a4,6(a5)
  dip->size = ip->size;
    80005232:	fd843783          	ld	a5,-40(s0)
    80005236:	47f8                	lw	a4,76(a5)
    80005238:	fe043783          	ld	a5,-32(s0)
    8000523c:	c798                	sw	a4,8(a5)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
    8000523e:	fe043783          	ld	a5,-32(s0)
    80005242:	00c78713          	addi	a4,a5,12
    80005246:	fd843783          	ld	a5,-40(s0)
    8000524a:	05078793          	addi	a5,a5,80
    8000524e:	03400613          	li	a2,52
    80005252:	85be                	mv	a1,a5
    80005254:	853a                	mv	a0,a4
    80005256:	ffffc097          	auipc	ra,0xffffc
    8000525a:	38c080e7          	jalr	908(ra) # 800015e2 <memmove>
  log_write(bp);
    8000525e:	fe843503          	ld	a0,-24(s0)
    80005262:	00001097          	auipc	ra,0x1
    80005266:	4ee080e7          	jalr	1262(ra) # 80006750 <log_write>
  brelse(bp);
    8000526a:	fe843503          	ld	a0,-24(s0)
    8000526e:	00000097          	auipc	ra,0x0
    80005272:	830080e7          	jalr	-2000(ra) # 80004a9e <brelse>
}
    80005276:	0001                	nop
    80005278:	70a2                	ld	ra,40(sp)
    8000527a:	7402                	ld	s0,32(sp)
    8000527c:	6145                	addi	sp,sp,48
    8000527e:	8082                	ret

0000000080005280 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
    80005280:	7179                	addi	sp,sp,-48
    80005282:	f406                	sd	ra,40(sp)
    80005284:	f022                	sd	s0,32(sp)
    80005286:	1800                	addi	s0,sp,48
    80005288:	87aa                	mv	a5,a0
    8000528a:	872e                	mv	a4,a1
    8000528c:	fcf42e23          	sw	a5,-36(s0)
    80005290:	87ba                	mv	a5,a4
    80005292:	fcf42c23          	sw	a5,-40(s0)
  struct inode *ip, *empty;

  acquire(&itable.lock);
    80005296:	0002e517          	auipc	a0,0x2e
    8000529a:	e4a50513          	addi	a0,a0,-438 # 800330e0 <itable>
    8000529e:	ffffc097          	auipc	ra,0xffffc
    800052a2:	08c080e7          	jalr	140(ra) # 8000132a <acquire>

  // Is the inode already in the table?
  empty = 0;
    800052a6:	fe043023          	sd	zero,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    800052aa:	0002e797          	auipc	a5,0x2e
    800052ae:	e4e78793          	addi	a5,a5,-434 # 800330f8 <itable+0x18>
    800052b2:	fef43423          	sd	a5,-24(s0)
    800052b6:	a89d                	j	8000532c <iget+0xac>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
    800052b8:	fe843783          	ld	a5,-24(s0)
    800052bc:	479c                	lw	a5,8(a5)
    800052be:	04f05663          	blez	a5,8000530a <iget+0x8a>
    800052c2:	fe843783          	ld	a5,-24(s0)
    800052c6:	4398                	lw	a4,0(a5)
    800052c8:	fdc42783          	lw	a5,-36(s0)
    800052cc:	2781                	sext.w	a5,a5
    800052ce:	02e79e63          	bne	a5,a4,8000530a <iget+0x8a>
    800052d2:	fe843783          	ld	a5,-24(s0)
    800052d6:	43d8                	lw	a4,4(a5)
    800052d8:	fd842783          	lw	a5,-40(s0)
    800052dc:	2781                	sext.w	a5,a5
    800052de:	02e79663          	bne	a5,a4,8000530a <iget+0x8a>
      ip->ref++;
    800052e2:	fe843783          	ld	a5,-24(s0)
    800052e6:	479c                	lw	a5,8(a5)
    800052e8:	2785                	addiw	a5,a5,1
    800052ea:	0007871b          	sext.w	a4,a5
    800052ee:	fe843783          	ld	a5,-24(s0)
    800052f2:	c798                	sw	a4,8(a5)
      release(&itable.lock);
    800052f4:	0002e517          	auipc	a0,0x2e
    800052f8:	dec50513          	addi	a0,a0,-532 # 800330e0 <itable>
    800052fc:	ffffc097          	auipc	ra,0xffffc
    80005300:	092080e7          	jalr	146(ra) # 8000138e <release>
      return ip;
    80005304:	fe843783          	ld	a5,-24(s0)
    80005308:	a069                	j	80005392 <iget+0x112>
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
    8000530a:	fe043783          	ld	a5,-32(s0)
    8000530e:	eb89                	bnez	a5,80005320 <iget+0xa0>
    80005310:	fe843783          	ld	a5,-24(s0)
    80005314:	479c                	lw	a5,8(a5)
    80005316:	e789                	bnez	a5,80005320 <iget+0xa0>
      empty = ip;
    80005318:	fe843783          	ld	a5,-24(s0)
    8000531c:	fef43023          	sd	a5,-32(s0)
  for(ip = &itable.inode[0]; ip < &itable.inode[NINODE]; ip++){
    80005320:	fe843783          	ld	a5,-24(s0)
    80005324:	08878793          	addi	a5,a5,136
    80005328:	fef43423          	sd	a5,-24(s0)
    8000532c:	fe843703          	ld	a4,-24(s0)
    80005330:	00030797          	auipc	a5,0x30
    80005334:	85878793          	addi	a5,a5,-1960 # 80034b88 <log>
    80005338:	f8f760e3          	bltu	a4,a5,800052b8 <iget+0x38>
  }

  // Recycle an inode entry.
  if(empty == 0)
    8000533c:	fe043783          	ld	a5,-32(s0)
    80005340:	eb89                	bnez	a5,80005352 <iget+0xd2>
    panic("iget: no inodes");
    80005342:	00007517          	auipc	a0,0x7
    80005346:	19650513          	addi	a0,a0,406 # 8000c4d8 <etext+0x4d8>
    8000534a:	ffffc097          	auipc	ra,0xffffc
    8000534e:	942080e7          	jalr	-1726(ra) # 80000c8c <panic>

  ip = empty;
    80005352:	fe043783          	ld	a5,-32(s0)
    80005356:	fef43423          	sd	a5,-24(s0)
  ip->dev = dev;
    8000535a:	fe843783          	ld	a5,-24(s0)
    8000535e:	fdc42703          	lw	a4,-36(s0)
    80005362:	c398                	sw	a4,0(a5)
  ip->inum = inum;
    80005364:	fe843783          	ld	a5,-24(s0)
    80005368:	fd842703          	lw	a4,-40(s0)
    8000536c:	c3d8                	sw	a4,4(a5)
  ip->ref = 1;
    8000536e:	fe843783          	ld	a5,-24(s0)
    80005372:	4705                	li	a4,1
    80005374:	c798                	sw	a4,8(a5)
  ip->valid = 0;
    80005376:	fe843783          	ld	a5,-24(s0)
    8000537a:	0407a023          	sw	zero,64(a5)
  release(&itable.lock);
    8000537e:	0002e517          	auipc	a0,0x2e
    80005382:	d6250513          	addi	a0,a0,-670 # 800330e0 <itable>
    80005386:	ffffc097          	auipc	ra,0xffffc
    8000538a:	008080e7          	jalr	8(ra) # 8000138e <release>

  return ip;
    8000538e:	fe843783          	ld	a5,-24(s0)
}
    80005392:	853e                	mv	a0,a5
    80005394:	70a2                	ld	ra,40(sp)
    80005396:	7402                	ld	s0,32(sp)
    80005398:	6145                	addi	sp,sp,48
    8000539a:	8082                	ret

000000008000539c <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
    8000539c:	1101                	addi	sp,sp,-32
    8000539e:	ec06                	sd	ra,24(sp)
    800053a0:	e822                	sd	s0,16(sp)
    800053a2:	1000                	addi	s0,sp,32
    800053a4:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    800053a8:	0002e517          	auipc	a0,0x2e
    800053ac:	d3850513          	addi	a0,a0,-712 # 800330e0 <itable>
    800053b0:	ffffc097          	auipc	ra,0xffffc
    800053b4:	f7a080e7          	jalr	-134(ra) # 8000132a <acquire>
  ip->ref++;
    800053b8:	fe843783          	ld	a5,-24(s0)
    800053bc:	479c                	lw	a5,8(a5)
    800053be:	2785                	addiw	a5,a5,1
    800053c0:	0007871b          	sext.w	a4,a5
    800053c4:	fe843783          	ld	a5,-24(s0)
    800053c8:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    800053ca:	0002e517          	auipc	a0,0x2e
    800053ce:	d1650513          	addi	a0,a0,-746 # 800330e0 <itable>
    800053d2:	ffffc097          	auipc	ra,0xffffc
    800053d6:	fbc080e7          	jalr	-68(ra) # 8000138e <release>
  return ip;
    800053da:	fe843783          	ld	a5,-24(s0)
}
    800053de:	853e                	mv	a0,a5
    800053e0:	60e2                	ld	ra,24(sp)
    800053e2:	6442                	ld	s0,16(sp)
    800053e4:	6105                	addi	sp,sp,32
    800053e6:	8082                	ret

00000000800053e8 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
    800053e8:	7179                	addi	sp,sp,-48
    800053ea:	f406                	sd	ra,40(sp)
    800053ec:	f022                	sd	s0,32(sp)
    800053ee:	1800                	addi	s0,sp,48
    800053f0:	fca43c23          	sd	a0,-40(s0)
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    800053f4:	fd843783          	ld	a5,-40(s0)
    800053f8:	c791                	beqz	a5,80005404 <ilock+0x1c>
    800053fa:	fd843783          	ld	a5,-40(s0)
    800053fe:	479c                	lw	a5,8(a5)
    80005400:	00f04a63          	bgtz	a5,80005414 <ilock+0x2c>
    panic("ilock");
    80005404:	00007517          	auipc	a0,0x7
    80005408:	0e450513          	addi	a0,a0,228 # 8000c4e8 <etext+0x4e8>
    8000540c:	ffffc097          	auipc	ra,0xffffc
    80005410:	880080e7          	jalr	-1920(ra) # 80000c8c <panic>

  acquiresleep(&ip->lock);
    80005414:	fd843783          	ld	a5,-40(s0)
    80005418:	07c1                	addi	a5,a5,16
    8000541a:	853e                	mv	a0,a5
    8000541c:	00001097          	auipc	ra,0x1
    80005420:	4b4080e7          	jalr	1204(ra) # 800068d0 <acquiresleep>

  if(ip->valid == 0){
    80005424:	fd843783          	ld	a5,-40(s0)
    80005428:	43bc                	lw	a5,64(a5)
    8000542a:	e7e5                	bnez	a5,80005512 <ilock+0x12a>
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    8000542c:	fd843783          	ld	a5,-40(s0)
    80005430:	4394                	lw	a3,0(a5)
    80005432:	fd843783          	ld	a5,-40(s0)
    80005436:	43dc                	lw	a5,4(a5)
    80005438:	0047d79b          	srliw	a5,a5,0x4
    8000543c:	0007871b          	sext.w	a4,a5
    80005440:	0002e797          	auipc	a5,0x2e
    80005444:	c8078793          	addi	a5,a5,-896 # 800330c0 <sb>
    80005448:	4f9c                	lw	a5,24(a5)
    8000544a:	9fb9                	addw	a5,a5,a4
    8000544c:	2781                	sext.w	a5,a5
    8000544e:	85be                	mv	a1,a5
    80005450:	8536                	mv	a0,a3
    80005452:	fffff097          	auipc	ra,0xfffff
    80005456:	5a2080e7          	jalr	1442(ra) # 800049f4 <bread>
    8000545a:	fea43423          	sd	a0,-24(s0)
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    8000545e:	fe843783          	ld	a5,-24(s0)
    80005462:	05878713          	addi	a4,a5,88
    80005466:	fd843783          	ld	a5,-40(s0)
    8000546a:	43dc                	lw	a5,4(a5)
    8000546c:	1782                	slli	a5,a5,0x20
    8000546e:	9381                	srli	a5,a5,0x20
    80005470:	8bbd                	andi	a5,a5,15
    80005472:	079a                	slli	a5,a5,0x6
    80005474:	97ba                	add	a5,a5,a4
    80005476:	fef43023          	sd	a5,-32(s0)
    ip->type = dip->type;
    8000547a:	fe043783          	ld	a5,-32(s0)
    8000547e:	00079703          	lh	a4,0(a5)
    80005482:	fd843783          	ld	a5,-40(s0)
    80005486:	04e79223          	sh	a4,68(a5)
    ip->major = dip->major;
    8000548a:	fe043783          	ld	a5,-32(s0)
    8000548e:	00279703          	lh	a4,2(a5)
    80005492:	fd843783          	ld	a5,-40(s0)
    80005496:	04e79323          	sh	a4,70(a5)
    ip->minor = dip->minor;
    8000549a:	fe043783          	ld	a5,-32(s0)
    8000549e:	00479703          	lh	a4,4(a5)
    800054a2:	fd843783          	ld	a5,-40(s0)
    800054a6:	04e79423          	sh	a4,72(a5)
    ip->nlink = dip->nlink;
    800054aa:	fe043783          	ld	a5,-32(s0)
    800054ae:	00679703          	lh	a4,6(a5)
    800054b2:	fd843783          	ld	a5,-40(s0)
    800054b6:	04e79523          	sh	a4,74(a5)
    ip->size = dip->size;
    800054ba:	fe043783          	ld	a5,-32(s0)
    800054be:	4798                	lw	a4,8(a5)
    800054c0:	fd843783          	ld	a5,-40(s0)
    800054c4:	c7f8                	sw	a4,76(a5)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
    800054c6:	fd843783          	ld	a5,-40(s0)
    800054ca:	05078713          	addi	a4,a5,80
    800054ce:	fe043783          	ld	a5,-32(s0)
    800054d2:	07b1                	addi	a5,a5,12
    800054d4:	03400613          	li	a2,52
    800054d8:	85be                	mv	a1,a5
    800054da:	853a                	mv	a0,a4
    800054dc:	ffffc097          	auipc	ra,0xffffc
    800054e0:	106080e7          	jalr	262(ra) # 800015e2 <memmove>
    brelse(bp);
    800054e4:	fe843503          	ld	a0,-24(s0)
    800054e8:	fffff097          	auipc	ra,0xfffff
    800054ec:	5b6080e7          	jalr	1462(ra) # 80004a9e <brelse>
    ip->valid = 1;
    800054f0:	fd843783          	ld	a5,-40(s0)
    800054f4:	4705                	li	a4,1
    800054f6:	c3b8                	sw	a4,64(a5)
    if(ip->type == 0)
    800054f8:	fd843783          	ld	a5,-40(s0)
    800054fc:	04479783          	lh	a5,68(a5)
    80005500:	eb89                	bnez	a5,80005512 <ilock+0x12a>
      panic("ilock: no type");
    80005502:	00007517          	auipc	a0,0x7
    80005506:	fee50513          	addi	a0,a0,-18 # 8000c4f0 <etext+0x4f0>
    8000550a:	ffffb097          	auipc	ra,0xffffb
    8000550e:	782080e7          	jalr	1922(ra) # 80000c8c <panic>
  }
}
    80005512:	0001                	nop
    80005514:	70a2                	ld	ra,40(sp)
    80005516:	7402                	ld	s0,32(sp)
    80005518:	6145                	addi	sp,sp,48
    8000551a:	8082                	ret

000000008000551c <iunlock>:

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
    8000551c:	1101                	addi	sp,sp,-32
    8000551e:	ec06                	sd	ra,24(sp)
    80005520:	e822                	sd	s0,16(sp)
    80005522:	1000                	addi	s0,sp,32
    80005524:	fea43423          	sd	a0,-24(s0)
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    80005528:	fe843783          	ld	a5,-24(s0)
    8000552c:	c385                	beqz	a5,8000554c <iunlock+0x30>
    8000552e:	fe843783          	ld	a5,-24(s0)
    80005532:	07c1                	addi	a5,a5,16
    80005534:	853e                	mv	a0,a5
    80005536:	00001097          	auipc	ra,0x1
    8000553a:	45a080e7          	jalr	1114(ra) # 80006990 <holdingsleep>
    8000553e:	87aa                	mv	a5,a0
    80005540:	c791                	beqz	a5,8000554c <iunlock+0x30>
    80005542:	fe843783          	ld	a5,-24(s0)
    80005546:	479c                	lw	a5,8(a5)
    80005548:	00f04a63          	bgtz	a5,8000555c <iunlock+0x40>
    panic("iunlock");
    8000554c:	00007517          	auipc	a0,0x7
    80005550:	fb450513          	addi	a0,a0,-76 # 8000c500 <etext+0x500>
    80005554:	ffffb097          	auipc	ra,0xffffb
    80005558:	738080e7          	jalr	1848(ra) # 80000c8c <panic>

  releasesleep(&ip->lock);
    8000555c:	fe843783          	ld	a5,-24(s0)
    80005560:	07c1                	addi	a5,a5,16
    80005562:	853e                	mv	a0,a5
    80005564:	00001097          	auipc	ra,0x1
    80005568:	3da080e7          	jalr	986(ra) # 8000693e <releasesleep>
}
    8000556c:	0001                	nop
    8000556e:	60e2                	ld	ra,24(sp)
    80005570:	6442                	ld	s0,16(sp)
    80005572:	6105                	addi	sp,sp,32
    80005574:	8082                	ret

0000000080005576 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
    80005576:	1101                	addi	sp,sp,-32
    80005578:	ec06                	sd	ra,24(sp)
    8000557a:	e822                	sd	s0,16(sp)
    8000557c:	1000                	addi	s0,sp,32
    8000557e:	fea43423          	sd	a0,-24(s0)
  acquire(&itable.lock);
    80005582:	0002e517          	auipc	a0,0x2e
    80005586:	b5e50513          	addi	a0,a0,-1186 # 800330e0 <itable>
    8000558a:	ffffc097          	auipc	ra,0xffffc
    8000558e:	da0080e7          	jalr	-608(ra) # 8000132a <acquire>

  if(ip->ref == 1 && ip->valid && ip->nlink == 0){
    80005592:	fe843783          	ld	a5,-24(s0)
    80005596:	479c                	lw	a5,8(a5)
    80005598:	873e                	mv	a4,a5
    8000559a:	4785                	li	a5,1
    8000559c:	06f71f63          	bne	a4,a5,8000561a <iput+0xa4>
    800055a0:	fe843783          	ld	a5,-24(s0)
    800055a4:	43bc                	lw	a5,64(a5)
    800055a6:	cbb5                	beqz	a5,8000561a <iput+0xa4>
    800055a8:	fe843783          	ld	a5,-24(s0)
    800055ac:	04a79783          	lh	a5,74(a5)
    800055b0:	e7ad                	bnez	a5,8000561a <iput+0xa4>
    // inode has no links and no other references: truncate and free.

    // ip->ref == 1 means no other process can have ip locked,
    // so this acquiresleep() won't block (or deadlock).
    acquiresleep(&ip->lock);
    800055b2:	fe843783          	ld	a5,-24(s0)
    800055b6:	07c1                	addi	a5,a5,16
    800055b8:	853e                	mv	a0,a5
    800055ba:	00001097          	auipc	ra,0x1
    800055be:	316080e7          	jalr	790(ra) # 800068d0 <acquiresleep>

    release(&itable.lock);
    800055c2:	0002e517          	auipc	a0,0x2e
    800055c6:	b1e50513          	addi	a0,a0,-1250 # 800330e0 <itable>
    800055ca:	ffffc097          	auipc	ra,0xffffc
    800055ce:	dc4080e7          	jalr	-572(ra) # 8000138e <release>

    itrunc(ip);
    800055d2:	fe843503          	ld	a0,-24(s0)
    800055d6:	00000097          	auipc	ra,0x0
    800055da:	21a080e7          	jalr	538(ra) # 800057f0 <itrunc>
    ip->type = 0;
    800055de:	fe843783          	ld	a5,-24(s0)
    800055e2:	04079223          	sh	zero,68(a5)
    iupdate(ip);
    800055e6:	fe843503          	ld	a0,-24(s0)
    800055ea:	00000097          	auipc	ra,0x0
    800055ee:	bae080e7          	jalr	-1106(ra) # 80005198 <iupdate>
    ip->valid = 0;
    800055f2:	fe843783          	ld	a5,-24(s0)
    800055f6:	0407a023          	sw	zero,64(a5)

    releasesleep(&ip->lock);
    800055fa:	fe843783          	ld	a5,-24(s0)
    800055fe:	07c1                	addi	a5,a5,16
    80005600:	853e                	mv	a0,a5
    80005602:	00001097          	auipc	ra,0x1
    80005606:	33c080e7          	jalr	828(ra) # 8000693e <releasesleep>

    acquire(&itable.lock);
    8000560a:	0002e517          	auipc	a0,0x2e
    8000560e:	ad650513          	addi	a0,a0,-1322 # 800330e0 <itable>
    80005612:	ffffc097          	auipc	ra,0xffffc
    80005616:	d18080e7          	jalr	-744(ra) # 8000132a <acquire>
  }

  ip->ref--;
    8000561a:	fe843783          	ld	a5,-24(s0)
    8000561e:	479c                	lw	a5,8(a5)
    80005620:	37fd                	addiw	a5,a5,-1
    80005622:	0007871b          	sext.w	a4,a5
    80005626:	fe843783          	ld	a5,-24(s0)
    8000562a:	c798                	sw	a4,8(a5)
  release(&itable.lock);
    8000562c:	0002e517          	auipc	a0,0x2e
    80005630:	ab450513          	addi	a0,a0,-1356 # 800330e0 <itable>
    80005634:	ffffc097          	auipc	ra,0xffffc
    80005638:	d5a080e7          	jalr	-678(ra) # 8000138e <release>
}
    8000563c:	0001                	nop
    8000563e:	60e2                	ld	ra,24(sp)
    80005640:	6442                	ld	s0,16(sp)
    80005642:	6105                	addi	sp,sp,32
    80005644:	8082                	ret

0000000080005646 <iunlockput>:

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
    80005646:	1101                	addi	sp,sp,-32
    80005648:	ec06                	sd	ra,24(sp)
    8000564a:	e822                	sd	s0,16(sp)
    8000564c:	1000                	addi	s0,sp,32
    8000564e:	fea43423          	sd	a0,-24(s0)
  iunlock(ip);
    80005652:	fe843503          	ld	a0,-24(s0)
    80005656:	00000097          	auipc	ra,0x0
    8000565a:	ec6080e7          	jalr	-314(ra) # 8000551c <iunlock>
  iput(ip);
    8000565e:	fe843503          	ld	a0,-24(s0)
    80005662:	00000097          	auipc	ra,0x0
    80005666:	f14080e7          	jalr	-236(ra) # 80005576 <iput>
}
    8000566a:	0001                	nop
    8000566c:	60e2                	ld	ra,24(sp)
    8000566e:	6442                	ld	s0,16(sp)
    80005670:	6105                	addi	sp,sp,32
    80005672:	8082                	ret

0000000080005674 <bmap>:
// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
// returns 0 if out of disk space.
static uint
bmap(struct inode *ip, uint bn)
{
    80005674:	7139                	addi	sp,sp,-64
    80005676:	fc06                	sd	ra,56(sp)
    80005678:	f822                	sd	s0,48(sp)
    8000567a:	0080                	addi	s0,sp,64
    8000567c:	fca43423          	sd	a0,-56(s0)
    80005680:	87ae                	mv	a5,a1
    80005682:	fcf42223          	sw	a5,-60(s0)
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    80005686:	fc442783          	lw	a5,-60(s0)
    8000568a:	0007871b          	sext.w	a4,a5
    8000568e:	47ad                	li	a5,11
    80005690:	04e7ee63          	bltu	a5,a4,800056ec <bmap+0x78>
    if((addr = ip->addrs[bn]) == 0){
    80005694:	fc843703          	ld	a4,-56(s0)
    80005698:	fc446783          	lwu	a5,-60(s0)
    8000569c:	07d1                	addi	a5,a5,20
    8000569e:	078a                	slli	a5,a5,0x2
    800056a0:	97ba                	add	a5,a5,a4
    800056a2:	439c                	lw	a5,0(a5)
    800056a4:	fef42623          	sw	a5,-20(s0)
    800056a8:	fec42783          	lw	a5,-20(s0)
    800056ac:	2781                	sext.w	a5,a5
    800056ae:	ef85                	bnez	a5,800056e6 <bmap+0x72>
      addr = balloc(ip->dev);
    800056b0:	fc843783          	ld	a5,-56(s0)
    800056b4:	439c                	lw	a5,0(a5)
    800056b6:	853e                	mv	a0,a5
    800056b8:	fffff097          	auipc	ra,0xfffff
    800056bc:	68e080e7          	jalr	1678(ra) # 80004d46 <balloc>
    800056c0:	87aa                	mv	a5,a0
    800056c2:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    800056c6:	fec42783          	lw	a5,-20(s0)
    800056ca:	2781                	sext.w	a5,a5
    800056cc:	e399                	bnez	a5,800056d2 <bmap+0x5e>
        return 0;
    800056ce:	4781                	li	a5,0
    800056d0:	aa19                	j	800057e6 <bmap+0x172>
      ip->addrs[bn] = addr;
    800056d2:	fc843703          	ld	a4,-56(s0)
    800056d6:	fc446783          	lwu	a5,-60(s0)
    800056da:	07d1                	addi	a5,a5,20
    800056dc:	078a                	slli	a5,a5,0x2
    800056de:	97ba                	add	a5,a5,a4
    800056e0:	fec42703          	lw	a4,-20(s0)
    800056e4:	c398                	sw	a4,0(a5)
    }
    return addr;
    800056e6:	fec42783          	lw	a5,-20(s0)
    800056ea:	a8f5                	j	800057e6 <bmap+0x172>
  }
  bn -= NDIRECT;
    800056ec:	fc442783          	lw	a5,-60(s0)
    800056f0:	37d1                	addiw	a5,a5,-12
    800056f2:	fcf42223          	sw	a5,-60(s0)

  if(bn < NINDIRECT){
    800056f6:	fc442783          	lw	a5,-60(s0)
    800056fa:	0007871b          	sext.w	a4,a5
    800056fe:	0ff00793          	li	a5,255
    80005702:	0ce7ea63          	bltu	a5,a4,800057d6 <bmap+0x162>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0){
    80005706:	fc843783          	ld	a5,-56(s0)
    8000570a:	0807a783          	lw	a5,128(a5)
    8000570e:	fef42623          	sw	a5,-20(s0)
    80005712:	fec42783          	lw	a5,-20(s0)
    80005716:	2781                	sext.w	a5,a5
    80005718:	eb85                	bnez	a5,80005748 <bmap+0xd4>
      addr = balloc(ip->dev);
    8000571a:	fc843783          	ld	a5,-56(s0)
    8000571e:	439c                	lw	a5,0(a5)
    80005720:	853e                	mv	a0,a5
    80005722:	fffff097          	auipc	ra,0xfffff
    80005726:	624080e7          	jalr	1572(ra) # 80004d46 <balloc>
    8000572a:	87aa                	mv	a5,a0
    8000572c:	fef42623          	sw	a5,-20(s0)
      if(addr == 0)
    80005730:	fec42783          	lw	a5,-20(s0)
    80005734:	2781                	sext.w	a5,a5
    80005736:	e399                	bnez	a5,8000573c <bmap+0xc8>
        return 0;
    80005738:	4781                	li	a5,0
    8000573a:	a075                	j	800057e6 <bmap+0x172>
      ip->addrs[NDIRECT] = addr;
    8000573c:	fc843783          	ld	a5,-56(s0)
    80005740:	fec42703          	lw	a4,-20(s0)
    80005744:	08e7a023          	sw	a4,128(a5)
    }
    bp = bread(ip->dev, addr);
    80005748:	fc843783          	ld	a5,-56(s0)
    8000574c:	439c                	lw	a5,0(a5)
    8000574e:	fec42703          	lw	a4,-20(s0)
    80005752:	85ba                	mv	a1,a4
    80005754:	853e                	mv	a0,a5
    80005756:	fffff097          	auipc	ra,0xfffff
    8000575a:	29e080e7          	jalr	670(ra) # 800049f4 <bread>
    8000575e:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    80005762:	fe043783          	ld	a5,-32(s0)
    80005766:	05878793          	addi	a5,a5,88
    8000576a:	fcf43c23          	sd	a5,-40(s0)
    if((addr = a[bn]) == 0){
    8000576e:	fc446783          	lwu	a5,-60(s0)
    80005772:	078a                	slli	a5,a5,0x2
    80005774:	fd843703          	ld	a4,-40(s0)
    80005778:	97ba                	add	a5,a5,a4
    8000577a:	439c                	lw	a5,0(a5)
    8000577c:	fef42623          	sw	a5,-20(s0)
    80005780:	fec42783          	lw	a5,-20(s0)
    80005784:	2781                	sext.w	a5,a5
    80005786:	ef9d                	bnez	a5,800057c4 <bmap+0x150>
      addr = balloc(ip->dev);
    80005788:	fc843783          	ld	a5,-56(s0)
    8000578c:	439c                	lw	a5,0(a5)
    8000578e:	853e                	mv	a0,a5
    80005790:	fffff097          	auipc	ra,0xfffff
    80005794:	5b6080e7          	jalr	1462(ra) # 80004d46 <balloc>
    80005798:	87aa                	mv	a5,a0
    8000579a:	fef42623          	sw	a5,-20(s0)
      if(addr){
    8000579e:	fec42783          	lw	a5,-20(s0)
    800057a2:	2781                	sext.w	a5,a5
    800057a4:	c385                	beqz	a5,800057c4 <bmap+0x150>
        a[bn] = addr;
    800057a6:	fc446783          	lwu	a5,-60(s0)
    800057aa:	078a                	slli	a5,a5,0x2
    800057ac:	fd843703          	ld	a4,-40(s0)
    800057b0:	97ba                	add	a5,a5,a4
    800057b2:	fec42703          	lw	a4,-20(s0)
    800057b6:	c398                	sw	a4,0(a5)
        log_write(bp);
    800057b8:	fe043503          	ld	a0,-32(s0)
    800057bc:	00001097          	auipc	ra,0x1
    800057c0:	f94080e7          	jalr	-108(ra) # 80006750 <log_write>
      }
    }
    brelse(bp);
    800057c4:	fe043503          	ld	a0,-32(s0)
    800057c8:	fffff097          	auipc	ra,0xfffff
    800057cc:	2d6080e7          	jalr	726(ra) # 80004a9e <brelse>
    return addr;
    800057d0:	fec42783          	lw	a5,-20(s0)
    800057d4:	a809                	j	800057e6 <bmap+0x172>
  }

  panic("bmap: out of range");
    800057d6:	00007517          	auipc	a0,0x7
    800057da:	d3250513          	addi	a0,a0,-718 # 8000c508 <etext+0x508>
    800057de:	ffffb097          	auipc	ra,0xffffb
    800057e2:	4ae080e7          	jalr	1198(ra) # 80000c8c <panic>
}
    800057e6:	853e                	mv	a0,a5
    800057e8:	70e2                	ld	ra,56(sp)
    800057ea:	7442                	ld	s0,48(sp)
    800057ec:	6121                	addi	sp,sp,64
    800057ee:	8082                	ret

00000000800057f0 <itrunc>:

// Truncate inode (discard contents).
// Caller must hold ip->lock.
void
itrunc(struct inode *ip)
{
    800057f0:	7139                	addi	sp,sp,-64
    800057f2:	fc06                	sd	ra,56(sp)
    800057f4:	f822                	sd	s0,48(sp)
    800057f6:	0080                	addi	s0,sp,64
    800057f8:	fca43423          	sd	a0,-56(s0)
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
    800057fc:	fe042623          	sw	zero,-20(s0)
    80005800:	a899                	j	80005856 <itrunc+0x66>
    if(ip->addrs[i]){
    80005802:	fc843703          	ld	a4,-56(s0)
    80005806:	fec42783          	lw	a5,-20(s0)
    8000580a:	07d1                	addi	a5,a5,20
    8000580c:	078a                	slli	a5,a5,0x2
    8000580e:	97ba                	add	a5,a5,a4
    80005810:	439c                	lw	a5,0(a5)
    80005812:	cf8d                	beqz	a5,8000584c <itrunc+0x5c>
      bfree(ip->dev, ip->addrs[i]);
    80005814:	fc843783          	ld	a5,-56(s0)
    80005818:	439c                	lw	a5,0(a5)
    8000581a:	0007869b          	sext.w	a3,a5
    8000581e:	fc843703          	ld	a4,-56(s0)
    80005822:	fec42783          	lw	a5,-20(s0)
    80005826:	07d1                	addi	a5,a5,20
    80005828:	078a                	slli	a5,a5,0x2
    8000582a:	97ba                	add	a5,a5,a4
    8000582c:	439c                	lw	a5,0(a5)
    8000582e:	85be                	mv	a1,a5
    80005830:	8536                	mv	a0,a3
    80005832:	fffff097          	auipc	ra,0xfffff
    80005836:	6c4080e7          	jalr	1732(ra) # 80004ef6 <bfree>
      ip->addrs[i] = 0;
    8000583a:	fc843703          	ld	a4,-56(s0)
    8000583e:	fec42783          	lw	a5,-20(s0)
    80005842:	07d1                	addi	a5,a5,20
    80005844:	078a                	slli	a5,a5,0x2
    80005846:	97ba                	add	a5,a5,a4
    80005848:	0007a023          	sw	zero,0(a5)
  for(i = 0; i < NDIRECT; i++){
    8000584c:	fec42783          	lw	a5,-20(s0)
    80005850:	2785                	addiw	a5,a5,1
    80005852:	fef42623          	sw	a5,-20(s0)
    80005856:	fec42783          	lw	a5,-20(s0)
    8000585a:	0007871b          	sext.w	a4,a5
    8000585e:	47ad                	li	a5,11
    80005860:	fae7d1e3          	bge	a5,a4,80005802 <itrunc+0x12>
    }
  }

  if(ip->addrs[NDIRECT]){
    80005864:	fc843783          	ld	a5,-56(s0)
    80005868:	0807a783          	lw	a5,128(a5)
    8000586c:	cbc5                	beqz	a5,8000591c <itrunc+0x12c>
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
    8000586e:	fc843783          	ld	a5,-56(s0)
    80005872:	4398                	lw	a4,0(a5)
    80005874:	fc843783          	ld	a5,-56(s0)
    80005878:	0807a783          	lw	a5,128(a5)
    8000587c:	85be                	mv	a1,a5
    8000587e:	853a                	mv	a0,a4
    80005880:	fffff097          	auipc	ra,0xfffff
    80005884:	174080e7          	jalr	372(ra) # 800049f4 <bread>
    80005888:	fea43023          	sd	a0,-32(s0)
    a = (uint*)bp->data;
    8000588c:	fe043783          	ld	a5,-32(s0)
    80005890:	05878793          	addi	a5,a5,88
    80005894:	fcf43c23          	sd	a5,-40(s0)
    for(j = 0; j < NINDIRECT; j++){
    80005898:	fe042423          	sw	zero,-24(s0)
    8000589c:	a081                	j	800058dc <itrunc+0xec>
      if(a[j])
    8000589e:	fe842783          	lw	a5,-24(s0)
    800058a2:	078a                	slli	a5,a5,0x2
    800058a4:	fd843703          	ld	a4,-40(s0)
    800058a8:	97ba                	add	a5,a5,a4
    800058aa:	439c                	lw	a5,0(a5)
    800058ac:	c39d                	beqz	a5,800058d2 <itrunc+0xe2>
        bfree(ip->dev, a[j]);
    800058ae:	fc843783          	ld	a5,-56(s0)
    800058b2:	439c                	lw	a5,0(a5)
    800058b4:	0007869b          	sext.w	a3,a5
    800058b8:	fe842783          	lw	a5,-24(s0)
    800058bc:	078a                	slli	a5,a5,0x2
    800058be:	fd843703          	ld	a4,-40(s0)
    800058c2:	97ba                	add	a5,a5,a4
    800058c4:	439c                	lw	a5,0(a5)
    800058c6:	85be                	mv	a1,a5
    800058c8:	8536                	mv	a0,a3
    800058ca:	fffff097          	auipc	ra,0xfffff
    800058ce:	62c080e7          	jalr	1580(ra) # 80004ef6 <bfree>
    for(j = 0; j < NINDIRECT; j++){
    800058d2:	fe842783          	lw	a5,-24(s0)
    800058d6:	2785                	addiw	a5,a5,1
    800058d8:	fef42423          	sw	a5,-24(s0)
    800058dc:	fe842783          	lw	a5,-24(s0)
    800058e0:	873e                	mv	a4,a5
    800058e2:	0ff00793          	li	a5,255
    800058e6:	fae7fce3          	bgeu	a5,a4,8000589e <itrunc+0xae>
    }
    brelse(bp);
    800058ea:	fe043503          	ld	a0,-32(s0)
    800058ee:	fffff097          	auipc	ra,0xfffff
    800058f2:	1b0080e7          	jalr	432(ra) # 80004a9e <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    800058f6:	fc843783          	ld	a5,-56(s0)
    800058fa:	439c                	lw	a5,0(a5)
    800058fc:	0007871b          	sext.w	a4,a5
    80005900:	fc843783          	ld	a5,-56(s0)
    80005904:	0807a783          	lw	a5,128(a5)
    80005908:	85be                	mv	a1,a5
    8000590a:	853a                	mv	a0,a4
    8000590c:	fffff097          	auipc	ra,0xfffff
    80005910:	5ea080e7          	jalr	1514(ra) # 80004ef6 <bfree>
    ip->addrs[NDIRECT] = 0;
    80005914:	fc843783          	ld	a5,-56(s0)
    80005918:	0807a023          	sw	zero,128(a5)
  }

  ip->size = 0;
    8000591c:	fc843783          	ld	a5,-56(s0)
    80005920:	0407a623          	sw	zero,76(a5)
  iupdate(ip);
    80005924:	fc843503          	ld	a0,-56(s0)
    80005928:	00000097          	auipc	ra,0x0
    8000592c:	870080e7          	jalr	-1936(ra) # 80005198 <iupdate>
}
    80005930:	0001                	nop
    80005932:	70e2                	ld	ra,56(sp)
    80005934:	7442                	ld	s0,48(sp)
    80005936:	6121                	addi	sp,sp,64
    80005938:	8082                	ret

000000008000593a <stati>:

// Copy stat information from inode.
// Caller must hold ip->lock.
void
stati(struct inode *ip, struct stat *st)
{
    8000593a:	1101                	addi	sp,sp,-32
    8000593c:	ec22                	sd	s0,24(sp)
    8000593e:	1000                	addi	s0,sp,32
    80005940:	fea43423          	sd	a0,-24(s0)
    80005944:	feb43023          	sd	a1,-32(s0)
  st->dev = ip->dev;
    80005948:	fe843783          	ld	a5,-24(s0)
    8000594c:	439c                	lw	a5,0(a5)
    8000594e:	0007871b          	sext.w	a4,a5
    80005952:	fe043783          	ld	a5,-32(s0)
    80005956:	c398                	sw	a4,0(a5)
  st->ino = ip->inum;
    80005958:	fe843783          	ld	a5,-24(s0)
    8000595c:	43d8                	lw	a4,4(a5)
    8000595e:	fe043783          	ld	a5,-32(s0)
    80005962:	c3d8                	sw	a4,4(a5)
  st->type = ip->type;
    80005964:	fe843783          	ld	a5,-24(s0)
    80005968:	04479703          	lh	a4,68(a5)
    8000596c:	fe043783          	ld	a5,-32(s0)
    80005970:	00e79423          	sh	a4,8(a5)
  st->nlink = ip->nlink;
    80005974:	fe843783          	ld	a5,-24(s0)
    80005978:	04a79703          	lh	a4,74(a5)
    8000597c:	fe043783          	ld	a5,-32(s0)
    80005980:	00e79523          	sh	a4,10(a5)
  st->size = ip->size;
    80005984:	fe843783          	ld	a5,-24(s0)
    80005988:	47fc                	lw	a5,76(a5)
    8000598a:	02079713          	slli	a4,a5,0x20
    8000598e:	9301                	srli	a4,a4,0x20
    80005990:	fe043783          	ld	a5,-32(s0)
    80005994:	eb98                	sd	a4,16(a5)
}
    80005996:	0001                	nop
    80005998:	6462                	ld	s0,24(sp)
    8000599a:	6105                	addi	sp,sp,32
    8000599c:	8082                	ret

000000008000599e <readi>:
// Caller must hold ip->lock.
// If user_dst==1, then dst is a user virtual address;
// otherwise, dst is a kernel address.
int
readi(struct inode *ip, int user_dst, uint64 dst, uint off, uint n)
{
    8000599e:	715d                	addi	sp,sp,-80
    800059a0:	e486                	sd	ra,72(sp)
    800059a2:	e0a2                	sd	s0,64(sp)
    800059a4:	0880                	addi	s0,sp,80
    800059a6:	fca43423          	sd	a0,-56(s0)
    800059aa:	87ae                	mv	a5,a1
    800059ac:	fac43c23          	sd	a2,-72(s0)
    800059b0:	fcf42223          	sw	a5,-60(s0)
    800059b4:	87b6                	mv	a5,a3
    800059b6:	fcf42023          	sw	a5,-64(s0)
    800059ba:	87ba                	mv	a5,a4
    800059bc:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    800059c0:	fc843783          	ld	a5,-56(s0)
    800059c4:	47f8                	lw	a4,76(a5)
    800059c6:	fc042783          	lw	a5,-64(s0)
    800059ca:	2781                	sext.w	a5,a5
    800059cc:	00f76e63          	bltu	a4,a5,800059e8 <readi+0x4a>
    800059d0:	fc042703          	lw	a4,-64(s0)
    800059d4:	fb442783          	lw	a5,-76(s0)
    800059d8:	9fb9                	addw	a5,a5,a4
    800059da:	0007871b          	sext.w	a4,a5
    800059de:	fc042783          	lw	a5,-64(s0)
    800059e2:	2781                	sext.w	a5,a5
    800059e4:	00f77463          	bgeu	a4,a5,800059ec <readi+0x4e>
    return 0;
    800059e8:	4781                	li	a5,0
    800059ea:	a289                	j	80005b2c <readi+0x18e>
  if(off + n > ip->size)
    800059ec:	fc042703          	lw	a4,-64(s0)
    800059f0:	fb442783          	lw	a5,-76(s0)
    800059f4:	9fb9                	addw	a5,a5,a4
    800059f6:	0007871b          	sext.w	a4,a5
    800059fa:	fc843783          	ld	a5,-56(s0)
    800059fe:	47fc                	lw	a5,76(a5)
    80005a00:	00e7fb63          	bgeu	a5,a4,80005a16 <readi+0x78>
    n = ip->size - off;
    80005a04:	fc843783          	ld	a5,-56(s0)
    80005a08:	47f8                	lw	a4,76(a5)
    80005a0a:	fc042783          	lw	a5,-64(s0)
    80005a0e:	40f707bb          	subw	a5,a4,a5
    80005a12:	faf42a23          	sw	a5,-76(s0)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005a16:	fe042623          	sw	zero,-20(s0)
    80005a1a:	a8ed                	j	80005b14 <readi+0x176>
    uint addr = bmap(ip, off/BSIZE);
    80005a1c:	fc042783          	lw	a5,-64(s0)
    80005a20:	00a7d79b          	srliw	a5,a5,0xa
    80005a24:	2781                	sext.w	a5,a5
    80005a26:	85be                	mv	a1,a5
    80005a28:	fc843503          	ld	a0,-56(s0)
    80005a2c:	00000097          	auipc	ra,0x0
    80005a30:	c48080e7          	jalr	-952(ra) # 80005674 <bmap>
    80005a34:	87aa                	mv	a5,a0
    80005a36:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005a3a:	fe842783          	lw	a5,-24(s0)
    80005a3e:	2781                	sext.w	a5,a5
    80005a40:	c3fd                	beqz	a5,80005b26 <readi+0x188>
      break;
    bp = bread(ip->dev, addr);
    80005a42:	fc843783          	ld	a5,-56(s0)
    80005a46:	439c                	lw	a5,0(a5)
    80005a48:	fe842703          	lw	a4,-24(s0)
    80005a4c:	85ba                	mv	a1,a4
    80005a4e:	853e                	mv	a0,a5
    80005a50:	fffff097          	auipc	ra,0xfffff
    80005a54:	fa4080e7          	jalr	-92(ra) # 800049f4 <bread>
    80005a58:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005a5c:	fc042783          	lw	a5,-64(s0)
    80005a60:	3ff7f793          	andi	a5,a5,1023
    80005a64:	2781                	sext.w	a5,a5
    80005a66:	40000713          	li	a4,1024
    80005a6a:	40f707bb          	subw	a5,a4,a5
    80005a6e:	0007869b          	sext.w	a3,a5
    80005a72:	fb442703          	lw	a4,-76(s0)
    80005a76:	fec42783          	lw	a5,-20(s0)
    80005a7a:	40f707bb          	subw	a5,a4,a5
    80005a7e:	2781                	sext.w	a5,a5
    80005a80:	863e                	mv	a2,a5
    80005a82:	87b6                	mv	a5,a3
    80005a84:	0007869b          	sext.w	a3,a5
    80005a88:	0006071b          	sext.w	a4,a2
    80005a8c:	00d77363          	bgeu	a4,a3,80005a92 <readi+0xf4>
    80005a90:	87b2                	mv	a5,a2
    80005a92:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyout(user_dst, dst, bp->data + (off % BSIZE), m) == -1) {
    80005a96:	fe043783          	ld	a5,-32(s0)
    80005a9a:	05878713          	addi	a4,a5,88
    80005a9e:	fc046783          	lwu	a5,-64(s0)
    80005aa2:	3ff7f793          	andi	a5,a5,1023
    80005aa6:	973e                	add	a4,a4,a5
    80005aa8:	fdc46683          	lwu	a3,-36(s0)
    80005aac:	fc442783          	lw	a5,-60(s0)
    80005ab0:	863a                	mv	a2,a4
    80005ab2:	fb843583          	ld	a1,-72(s0)
    80005ab6:	853e                	mv	a0,a5
    80005ab8:	ffffe097          	auipc	ra,0xffffe
    80005abc:	eba080e7          	jalr	-326(ra) # 80003972 <either_copyout>
    80005ac0:	87aa                	mv	a5,a0
    80005ac2:	873e                	mv	a4,a5
    80005ac4:	57fd                	li	a5,-1
    80005ac6:	00f71c63          	bne	a4,a5,80005ade <readi+0x140>
      brelse(bp);
    80005aca:	fe043503          	ld	a0,-32(s0)
    80005ace:	fffff097          	auipc	ra,0xfffff
    80005ad2:	fd0080e7          	jalr	-48(ra) # 80004a9e <brelse>
      tot = -1;
    80005ad6:	57fd                	li	a5,-1
    80005ad8:	fef42623          	sw	a5,-20(s0)
      break;
    80005adc:	a0b1                	j	80005b28 <readi+0x18a>
    }
    brelse(bp);
    80005ade:	fe043503          	ld	a0,-32(s0)
    80005ae2:	fffff097          	auipc	ra,0xfffff
    80005ae6:	fbc080e7          	jalr	-68(ra) # 80004a9e <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    80005aea:	fec42703          	lw	a4,-20(s0)
    80005aee:	fdc42783          	lw	a5,-36(s0)
    80005af2:	9fb9                	addw	a5,a5,a4
    80005af4:	fef42623          	sw	a5,-20(s0)
    80005af8:	fc042703          	lw	a4,-64(s0)
    80005afc:	fdc42783          	lw	a5,-36(s0)
    80005b00:	9fb9                	addw	a5,a5,a4
    80005b02:	fcf42023          	sw	a5,-64(s0)
    80005b06:	fdc46783          	lwu	a5,-36(s0)
    80005b0a:	fb843703          	ld	a4,-72(s0)
    80005b0e:	97ba                	add	a5,a5,a4
    80005b10:	faf43c23          	sd	a5,-72(s0)
    80005b14:	fec42703          	lw	a4,-20(s0)
    80005b18:	fb442783          	lw	a5,-76(s0)
    80005b1c:	2701                	sext.w	a4,a4
    80005b1e:	2781                	sext.w	a5,a5
    80005b20:	eef76ee3          	bltu	a4,a5,80005a1c <readi+0x7e>
    80005b24:	a011                	j	80005b28 <readi+0x18a>
      break;
    80005b26:	0001                	nop
  }
  return tot;
    80005b28:	fec42783          	lw	a5,-20(s0)
}
    80005b2c:	853e                	mv	a0,a5
    80005b2e:	60a6                	ld	ra,72(sp)
    80005b30:	6406                	ld	s0,64(sp)
    80005b32:	6161                	addi	sp,sp,80
    80005b34:	8082                	ret

0000000080005b36 <writei>:
// Returns the number of bytes successfully written.
// If the return value is less than the requested n,
// there was an error of some kind.
int
writei(struct inode *ip, int user_src, uint64 src, uint off, uint n)
{
    80005b36:	715d                	addi	sp,sp,-80
    80005b38:	e486                	sd	ra,72(sp)
    80005b3a:	e0a2                	sd	s0,64(sp)
    80005b3c:	0880                	addi	s0,sp,80
    80005b3e:	fca43423          	sd	a0,-56(s0)
    80005b42:	87ae                	mv	a5,a1
    80005b44:	fac43c23          	sd	a2,-72(s0)
    80005b48:	fcf42223          	sw	a5,-60(s0)
    80005b4c:	87b6                	mv	a5,a3
    80005b4e:	fcf42023          	sw	a5,-64(s0)
    80005b52:	87ba                	mv	a5,a4
    80005b54:	faf42a23          	sw	a5,-76(s0)
  uint tot, m;
  struct buf *bp;

  if(off > ip->size || off + n < off)
    80005b58:	fc843783          	ld	a5,-56(s0)
    80005b5c:	47f8                	lw	a4,76(a5)
    80005b5e:	fc042783          	lw	a5,-64(s0)
    80005b62:	2781                	sext.w	a5,a5
    80005b64:	00f76e63          	bltu	a4,a5,80005b80 <writei+0x4a>
    80005b68:	fc042703          	lw	a4,-64(s0)
    80005b6c:	fb442783          	lw	a5,-76(s0)
    80005b70:	9fb9                	addw	a5,a5,a4
    80005b72:	0007871b          	sext.w	a4,a5
    80005b76:	fc042783          	lw	a5,-64(s0)
    80005b7a:	2781                	sext.w	a5,a5
    80005b7c:	00f77463          	bgeu	a4,a5,80005b84 <writei+0x4e>
    return -1;
    80005b80:	57fd                	li	a5,-1
    80005b82:	aab9                	j	80005ce0 <writei+0x1aa>
  if(off + n > MAXFILE*BSIZE)
    80005b84:	fc042703          	lw	a4,-64(s0)
    80005b88:	fb442783          	lw	a5,-76(s0)
    80005b8c:	9fb9                	addw	a5,a5,a4
    80005b8e:	2781                	sext.w	a5,a5
    80005b90:	873e                	mv	a4,a5
    80005b92:	000437b7          	lui	a5,0x43
    80005b96:	00e7f463          	bgeu	a5,a4,80005b9e <writei+0x68>
    return -1;
    80005b9a:	57fd                	li	a5,-1
    80005b9c:	a291                	j	80005ce0 <writei+0x1aa>

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005b9e:	fe042623          	sw	zero,-20(s0)
    80005ba2:	a201                	j	80005ca2 <writei+0x16c>
    uint addr = bmap(ip, off/BSIZE);
    80005ba4:	fc042783          	lw	a5,-64(s0)
    80005ba8:	00a7d79b          	srliw	a5,a5,0xa
    80005bac:	2781                	sext.w	a5,a5
    80005bae:	85be                	mv	a1,a5
    80005bb0:	fc843503          	ld	a0,-56(s0)
    80005bb4:	00000097          	auipc	ra,0x0
    80005bb8:	ac0080e7          	jalr	-1344(ra) # 80005674 <bmap>
    80005bbc:	87aa                	mv	a5,a0
    80005bbe:	fef42423          	sw	a5,-24(s0)
    if(addr == 0)
    80005bc2:	fe842783          	lw	a5,-24(s0)
    80005bc6:	2781                	sext.w	a5,a5
    80005bc8:	c7f5                	beqz	a5,80005cb4 <writei+0x17e>
      break;
    bp = bread(ip->dev, addr);
    80005bca:	fc843783          	ld	a5,-56(s0)
    80005bce:	439c                	lw	a5,0(a5)
    80005bd0:	fe842703          	lw	a4,-24(s0)
    80005bd4:	85ba                	mv	a1,a4
    80005bd6:	853e                	mv	a0,a5
    80005bd8:	fffff097          	auipc	ra,0xfffff
    80005bdc:	e1c080e7          	jalr	-484(ra) # 800049f4 <bread>
    80005be0:	fea43023          	sd	a0,-32(s0)
    m = min(n - tot, BSIZE - off%BSIZE);
    80005be4:	fc042783          	lw	a5,-64(s0)
    80005be8:	3ff7f793          	andi	a5,a5,1023
    80005bec:	2781                	sext.w	a5,a5
    80005bee:	40000713          	li	a4,1024
    80005bf2:	40f707bb          	subw	a5,a4,a5
    80005bf6:	0007869b          	sext.w	a3,a5
    80005bfa:	fb442703          	lw	a4,-76(s0)
    80005bfe:	fec42783          	lw	a5,-20(s0)
    80005c02:	40f707bb          	subw	a5,a4,a5
    80005c06:	2781                	sext.w	a5,a5
    80005c08:	863e                	mv	a2,a5
    80005c0a:	87b6                	mv	a5,a3
    80005c0c:	0007869b          	sext.w	a3,a5
    80005c10:	0006071b          	sext.w	a4,a2
    80005c14:	00d77363          	bgeu	a4,a3,80005c1a <writei+0xe4>
    80005c18:	87b2                	mv	a5,a2
    80005c1a:	fcf42e23          	sw	a5,-36(s0)
    if(either_copyin(bp->data + (off % BSIZE), user_src, src, m) == -1) {
    80005c1e:	fe043783          	ld	a5,-32(s0)
    80005c22:	05878713          	addi	a4,a5,88 # 43058 <_entry-0x7ffbcfa8>
    80005c26:	fc046783          	lwu	a5,-64(s0)
    80005c2a:	3ff7f793          	andi	a5,a5,1023
    80005c2e:	97ba                	add	a5,a5,a4
    80005c30:	fdc46683          	lwu	a3,-36(s0)
    80005c34:	fc442703          	lw	a4,-60(s0)
    80005c38:	fb843603          	ld	a2,-72(s0)
    80005c3c:	85ba                	mv	a1,a4
    80005c3e:	853e                	mv	a0,a5
    80005c40:	ffffe097          	auipc	ra,0xffffe
    80005c44:	da6080e7          	jalr	-602(ra) # 800039e6 <either_copyin>
    80005c48:	87aa                	mv	a5,a0
    80005c4a:	873e                	mv	a4,a5
    80005c4c:	57fd                	li	a5,-1
    80005c4e:	00f71963          	bne	a4,a5,80005c60 <writei+0x12a>
      brelse(bp);
    80005c52:	fe043503          	ld	a0,-32(s0)
    80005c56:	fffff097          	auipc	ra,0xfffff
    80005c5a:	e48080e7          	jalr	-440(ra) # 80004a9e <brelse>
      break;
    80005c5e:	a8a1                	j	80005cb6 <writei+0x180>
    }
    log_write(bp);
    80005c60:	fe043503          	ld	a0,-32(s0)
    80005c64:	00001097          	auipc	ra,0x1
    80005c68:	aec080e7          	jalr	-1300(ra) # 80006750 <log_write>
    brelse(bp);
    80005c6c:	fe043503          	ld	a0,-32(s0)
    80005c70:	fffff097          	auipc	ra,0xfffff
    80005c74:	e2e080e7          	jalr	-466(ra) # 80004a9e <brelse>
  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    80005c78:	fec42703          	lw	a4,-20(s0)
    80005c7c:	fdc42783          	lw	a5,-36(s0)
    80005c80:	9fb9                	addw	a5,a5,a4
    80005c82:	fef42623          	sw	a5,-20(s0)
    80005c86:	fc042703          	lw	a4,-64(s0)
    80005c8a:	fdc42783          	lw	a5,-36(s0)
    80005c8e:	9fb9                	addw	a5,a5,a4
    80005c90:	fcf42023          	sw	a5,-64(s0)
    80005c94:	fdc46783          	lwu	a5,-36(s0)
    80005c98:	fb843703          	ld	a4,-72(s0)
    80005c9c:	97ba                	add	a5,a5,a4
    80005c9e:	faf43c23          	sd	a5,-72(s0)
    80005ca2:	fec42703          	lw	a4,-20(s0)
    80005ca6:	fb442783          	lw	a5,-76(s0)
    80005caa:	2701                	sext.w	a4,a4
    80005cac:	2781                	sext.w	a5,a5
    80005cae:	eef76be3          	bltu	a4,a5,80005ba4 <writei+0x6e>
    80005cb2:	a011                	j	80005cb6 <writei+0x180>
      break;
    80005cb4:	0001                	nop
  }

  if(off > ip->size)
    80005cb6:	fc843783          	ld	a5,-56(s0)
    80005cba:	47f8                	lw	a4,76(a5)
    80005cbc:	fc042783          	lw	a5,-64(s0)
    80005cc0:	2781                	sext.w	a5,a5
    80005cc2:	00f77763          	bgeu	a4,a5,80005cd0 <writei+0x19a>
    ip->size = off;
    80005cc6:	fc843783          	ld	a5,-56(s0)
    80005cca:	fc042703          	lw	a4,-64(s0)
    80005cce:	c7f8                	sw	a4,76(a5)

  // write the i-node back to disk even if the size didn't change
  // because the loop above might have called bmap() and added a new
  // block to ip->addrs[].
  iupdate(ip);
    80005cd0:	fc843503          	ld	a0,-56(s0)
    80005cd4:	fffff097          	auipc	ra,0xfffff
    80005cd8:	4c4080e7          	jalr	1220(ra) # 80005198 <iupdate>

  return tot;
    80005cdc:	fec42783          	lw	a5,-20(s0)
}
    80005ce0:	853e                	mv	a0,a5
    80005ce2:	60a6                	ld	ra,72(sp)
    80005ce4:	6406                	ld	s0,64(sp)
    80005ce6:	6161                	addi	sp,sp,80
    80005ce8:	8082                	ret

0000000080005cea <namecmp>:

// Directories

int
namecmp(const char *s, const char *t)
{
    80005cea:	1101                	addi	sp,sp,-32
    80005cec:	ec06                	sd	ra,24(sp)
    80005cee:	e822                	sd	s0,16(sp)
    80005cf0:	1000                	addi	s0,sp,32
    80005cf2:	fea43423          	sd	a0,-24(s0)
    80005cf6:	feb43023          	sd	a1,-32(s0)
  return strncmp(s, t, DIRSIZ);
    80005cfa:	4639                	li	a2,14
    80005cfc:	fe043583          	ld	a1,-32(s0)
    80005d00:	fe843503          	ld	a0,-24(s0)
    80005d04:	ffffc097          	auipc	ra,0xffffc
    80005d08:	9f2080e7          	jalr	-1550(ra) # 800016f6 <strncmp>
    80005d0c:	87aa                	mv	a5,a0
}
    80005d0e:	853e                	mv	a0,a5
    80005d10:	60e2                	ld	ra,24(sp)
    80005d12:	6442                	ld	s0,16(sp)
    80005d14:	6105                	addi	sp,sp,32
    80005d16:	8082                	ret

0000000080005d18 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
    80005d18:	715d                	addi	sp,sp,-80
    80005d1a:	e486                	sd	ra,72(sp)
    80005d1c:	e0a2                	sd	s0,64(sp)
    80005d1e:	0880                	addi	s0,sp,80
    80005d20:	fca43423          	sd	a0,-56(s0)
    80005d24:	fcb43023          	sd	a1,-64(s0)
    80005d28:	fac43c23          	sd	a2,-72(s0)
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    80005d2c:	fc843783          	ld	a5,-56(s0)
    80005d30:	04479783          	lh	a5,68(a5)
    80005d34:	0007871b          	sext.w	a4,a5
    80005d38:	4785                	li	a5,1
    80005d3a:	00f70a63          	beq	a4,a5,80005d4e <dirlookup+0x36>
    panic("dirlookup not DIR");
    80005d3e:	00006517          	auipc	a0,0x6
    80005d42:	7e250513          	addi	a0,a0,2018 # 8000c520 <etext+0x520>
    80005d46:	ffffb097          	auipc	ra,0xffffb
    80005d4a:	f46080e7          	jalr	-186(ra) # 80000c8c <panic>

  for(off = 0; off < dp->size; off += sizeof(de)){
    80005d4e:	fe042623          	sw	zero,-20(s0)
    80005d52:	a849                	j	80005de4 <dirlookup+0xcc>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005d54:	fd840793          	addi	a5,s0,-40
    80005d58:	fec42683          	lw	a3,-20(s0)
    80005d5c:	4741                	li	a4,16
    80005d5e:	863e                	mv	a2,a5
    80005d60:	4581                	li	a1,0
    80005d62:	fc843503          	ld	a0,-56(s0)
    80005d66:	00000097          	auipc	ra,0x0
    80005d6a:	c38080e7          	jalr	-968(ra) # 8000599e <readi>
    80005d6e:	87aa                	mv	a5,a0
    80005d70:	873e                	mv	a4,a5
    80005d72:	47c1                	li	a5,16
    80005d74:	00f70a63          	beq	a4,a5,80005d88 <dirlookup+0x70>
      panic("dirlookup read");
    80005d78:	00006517          	auipc	a0,0x6
    80005d7c:	7c050513          	addi	a0,a0,1984 # 8000c538 <etext+0x538>
    80005d80:	ffffb097          	auipc	ra,0xffffb
    80005d84:	f0c080e7          	jalr	-244(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005d88:	fd845783          	lhu	a5,-40(s0)
    80005d8c:	c7b1                	beqz	a5,80005dd8 <dirlookup+0xc0>
      continue;
    if(namecmp(name, de.name) == 0){
    80005d8e:	fd840793          	addi	a5,s0,-40
    80005d92:	0789                	addi	a5,a5,2
    80005d94:	85be                	mv	a1,a5
    80005d96:	fc043503          	ld	a0,-64(s0)
    80005d9a:	00000097          	auipc	ra,0x0
    80005d9e:	f50080e7          	jalr	-176(ra) # 80005cea <namecmp>
    80005da2:	87aa                	mv	a5,a0
    80005da4:	eb9d                	bnez	a5,80005dda <dirlookup+0xc2>
      // entry matches path element
      if(poff)
    80005da6:	fb843783          	ld	a5,-72(s0)
    80005daa:	c791                	beqz	a5,80005db6 <dirlookup+0x9e>
        *poff = off;
    80005dac:	fb843783          	ld	a5,-72(s0)
    80005db0:	fec42703          	lw	a4,-20(s0)
    80005db4:	c398                	sw	a4,0(a5)
      inum = de.inum;
    80005db6:	fd845783          	lhu	a5,-40(s0)
    80005dba:	fef42423          	sw	a5,-24(s0)
      return iget(dp->dev, inum);
    80005dbe:	fc843783          	ld	a5,-56(s0)
    80005dc2:	439c                	lw	a5,0(a5)
    80005dc4:	fe842703          	lw	a4,-24(s0)
    80005dc8:	85ba                	mv	a1,a4
    80005dca:	853e                	mv	a0,a5
    80005dcc:	fffff097          	auipc	ra,0xfffff
    80005dd0:	4b4080e7          	jalr	1204(ra) # 80005280 <iget>
    80005dd4:	87aa                	mv	a5,a0
    80005dd6:	a005                	j	80005df6 <dirlookup+0xde>
      continue;
    80005dd8:	0001                	nop
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005dda:	fec42783          	lw	a5,-20(s0)
    80005dde:	27c1                	addiw	a5,a5,16
    80005de0:	fef42623          	sw	a5,-20(s0)
    80005de4:	fc843783          	ld	a5,-56(s0)
    80005de8:	47f8                	lw	a4,76(a5)
    80005dea:	fec42783          	lw	a5,-20(s0)
    80005dee:	2781                	sext.w	a5,a5
    80005df0:	f6e7e2e3          	bltu	a5,a4,80005d54 <dirlookup+0x3c>
    }
  }

  return 0;
    80005df4:	4781                	li	a5,0
}
    80005df6:	853e                	mv	a0,a5
    80005df8:	60a6                	ld	ra,72(sp)
    80005dfa:	6406                	ld	s0,64(sp)
    80005dfc:	6161                	addi	sp,sp,80
    80005dfe:	8082                	ret

0000000080005e00 <dirlink>:

// Write a new directory entry (name, inum) into the directory dp.
// Returns 0 on success, -1 on failure (e.g. out of disk blocks).
int
dirlink(struct inode *dp, char *name, uint inum)
{
    80005e00:	715d                	addi	sp,sp,-80
    80005e02:	e486                	sd	ra,72(sp)
    80005e04:	e0a2                	sd	s0,64(sp)
    80005e06:	0880                	addi	s0,sp,80
    80005e08:	fca43423          	sd	a0,-56(s0)
    80005e0c:	fcb43023          	sd	a1,-64(s0)
    80005e10:	87b2                	mv	a5,a2
    80005e12:	faf42e23          	sw	a5,-68(s0)
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    80005e16:	4601                	li	a2,0
    80005e18:	fc043583          	ld	a1,-64(s0)
    80005e1c:	fc843503          	ld	a0,-56(s0)
    80005e20:	00000097          	auipc	ra,0x0
    80005e24:	ef8080e7          	jalr	-264(ra) # 80005d18 <dirlookup>
    80005e28:	fea43023          	sd	a0,-32(s0)
    80005e2c:	fe043783          	ld	a5,-32(s0)
    80005e30:	cb89                	beqz	a5,80005e42 <dirlink+0x42>
    iput(ip);
    80005e32:	fe043503          	ld	a0,-32(s0)
    80005e36:	fffff097          	auipc	ra,0xfffff
    80005e3a:	740080e7          	jalr	1856(ra) # 80005576 <iput>
    return -1;
    80005e3e:	57fd                	li	a5,-1
    80005e40:	a075                	j	80005eec <dirlink+0xec>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e42:	fe042623          	sw	zero,-20(s0)
    80005e46:	a0a1                	j	80005e8e <dirlink+0x8e>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005e48:	fd040793          	addi	a5,s0,-48
    80005e4c:	fec42683          	lw	a3,-20(s0)
    80005e50:	4741                	li	a4,16
    80005e52:	863e                	mv	a2,a5
    80005e54:	4581                	li	a1,0
    80005e56:	fc843503          	ld	a0,-56(s0)
    80005e5a:	00000097          	auipc	ra,0x0
    80005e5e:	b44080e7          	jalr	-1212(ra) # 8000599e <readi>
    80005e62:	87aa                	mv	a5,a0
    80005e64:	873e                	mv	a4,a5
    80005e66:	47c1                	li	a5,16
    80005e68:	00f70a63          	beq	a4,a5,80005e7c <dirlink+0x7c>
      panic("dirlink read");
    80005e6c:	00006517          	auipc	a0,0x6
    80005e70:	6dc50513          	addi	a0,a0,1756 # 8000c548 <etext+0x548>
    80005e74:	ffffb097          	auipc	ra,0xffffb
    80005e78:	e18080e7          	jalr	-488(ra) # 80000c8c <panic>
    if(de.inum == 0)
    80005e7c:	fd045783          	lhu	a5,-48(s0)
    80005e80:	cf99                	beqz	a5,80005e9e <dirlink+0x9e>
  for(off = 0; off < dp->size; off += sizeof(de)){
    80005e82:	fec42783          	lw	a5,-20(s0)
    80005e86:	27c1                	addiw	a5,a5,16
    80005e88:	2781                	sext.w	a5,a5
    80005e8a:	fef42623          	sw	a5,-20(s0)
    80005e8e:	fc843783          	ld	a5,-56(s0)
    80005e92:	47f8                	lw	a4,76(a5)
    80005e94:	fec42783          	lw	a5,-20(s0)
    80005e98:	fae7e8e3          	bltu	a5,a4,80005e48 <dirlink+0x48>
    80005e9c:	a011                	j	80005ea0 <dirlink+0xa0>
      break;
    80005e9e:	0001                	nop
  }

  strncpy(de.name, name, DIRSIZ);
    80005ea0:	fd040793          	addi	a5,s0,-48
    80005ea4:	0789                	addi	a5,a5,2
    80005ea6:	4639                	li	a2,14
    80005ea8:	fc043583          	ld	a1,-64(s0)
    80005eac:	853e                	mv	a0,a5
    80005eae:	ffffc097          	auipc	ra,0xffffc
    80005eb2:	8d2080e7          	jalr	-1838(ra) # 80001780 <strncpy>
  de.inum = inum;
    80005eb6:	fbc42783          	lw	a5,-68(s0)
    80005eba:	17c2                	slli	a5,a5,0x30
    80005ebc:	93c1                	srli	a5,a5,0x30
    80005ebe:	fcf41823          	sh	a5,-48(s0)
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80005ec2:	fd040793          	addi	a5,s0,-48
    80005ec6:	fec42683          	lw	a3,-20(s0)
    80005eca:	4741                	li	a4,16
    80005ecc:	863e                	mv	a2,a5
    80005ece:	4581                	li	a1,0
    80005ed0:	fc843503          	ld	a0,-56(s0)
    80005ed4:	00000097          	auipc	ra,0x0
    80005ed8:	c62080e7          	jalr	-926(ra) # 80005b36 <writei>
    80005edc:	87aa                	mv	a5,a0
    80005ede:	873e                	mv	a4,a5
    80005ee0:	47c1                	li	a5,16
    80005ee2:	00f70463          	beq	a4,a5,80005eea <dirlink+0xea>
    return -1;
    80005ee6:	57fd                	li	a5,-1
    80005ee8:	a011                	j	80005eec <dirlink+0xec>

  return 0;
    80005eea:	4781                	li	a5,0
}
    80005eec:	853e                	mv	a0,a5
    80005eee:	60a6                	ld	ra,72(sp)
    80005ef0:	6406                	ld	s0,64(sp)
    80005ef2:	6161                	addi	sp,sp,80
    80005ef4:	8082                	ret

0000000080005ef6 <skipelem>:
//   skipelem("a", name) = "", setting name = "a"
//   skipelem("", name) = skipelem("////", name) = 0
//
static char*
skipelem(char *path, char *name)
{
    80005ef6:	7179                	addi	sp,sp,-48
    80005ef8:	f406                	sd	ra,40(sp)
    80005efa:	f022                	sd	s0,32(sp)
    80005efc:	1800                	addi	s0,sp,48
    80005efe:	fca43c23          	sd	a0,-40(s0)
    80005f02:	fcb43823          	sd	a1,-48(s0)
  char *s;
  int len;

  while(*path == '/')
    80005f06:	a031                	j	80005f12 <skipelem+0x1c>
    path++;
    80005f08:	fd843783          	ld	a5,-40(s0)
    80005f0c:	0785                	addi	a5,a5,1
    80005f0e:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005f12:	fd843783          	ld	a5,-40(s0)
    80005f16:	0007c783          	lbu	a5,0(a5)
    80005f1a:	873e                	mv	a4,a5
    80005f1c:	02f00793          	li	a5,47
    80005f20:	fef704e3          	beq	a4,a5,80005f08 <skipelem+0x12>
  if(*path == 0)
    80005f24:	fd843783          	ld	a5,-40(s0)
    80005f28:	0007c783          	lbu	a5,0(a5)
    80005f2c:	e399                	bnez	a5,80005f32 <skipelem+0x3c>
    return 0;
    80005f2e:	4781                	li	a5,0
    80005f30:	a06d                	j	80005fda <skipelem+0xe4>
  s = path;
    80005f32:	fd843783          	ld	a5,-40(s0)
    80005f36:	fef43423          	sd	a5,-24(s0)
  while(*path != '/' && *path != 0)
    80005f3a:	a031                	j	80005f46 <skipelem+0x50>
    path++;
    80005f3c:	fd843783          	ld	a5,-40(s0)
    80005f40:	0785                	addi	a5,a5,1
    80005f42:	fcf43c23          	sd	a5,-40(s0)
  while(*path != '/' && *path != 0)
    80005f46:	fd843783          	ld	a5,-40(s0)
    80005f4a:	0007c783          	lbu	a5,0(a5)
    80005f4e:	873e                	mv	a4,a5
    80005f50:	02f00793          	li	a5,47
    80005f54:	00f70763          	beq	a4,a5,80005f62 <skipelem+0x6c>
    80005f58:	fd843783          	ld	a5,-40(s0)
    80005f5c:	0007c783          	lbu	a5,0(a5)
    80005f60:	fff1                	bnez	a5,80005f3c <skipelem+0x46>
  len = path - s;
    80005f62:	fd843703          	ld	a4,-40(s0)
    80005f66:	fe843783          	ld	a5,-24(s0)
    80005f6a:	40f707b3          	sub	a5,a4,a5
    80005f6e:	fef42223          	sw	a5,-28(s0)
  if(len >= DIRSIZ)
    80005f72:	fe442783          	lw	a5,-28(s0)
    80005f76:	0007871b          	sext.w	a4,a5
    80005f7a:	47b5                	li	a5,13
    80005f7c:	00e7dc63          	bge	a5,a4,80005f94 <skipelem+0x9e>
    memmove(name, s, DIRSIZ);
    80005f80:	4639                	li	a2,14
    80005f82:	fe843583          	ld	a1,-24(s0)
    80005f86:	fd043503          	ld	a0,-48(s0)
    80005f8a:	ffffb097          	auipc	ra,0xffffb
    80005f8e:	658080e7          	jalr	1624(ra) # 800015e2 <memmove>
    80005f92:	a80d                	j	80005fc4 <skipelem+0xce>
  else {
    memmove(name, s, len);
    80005f94:	fe442783          	lw	a5,-28(s0)
    80005f98:	863e                	mv	a2,a5
    80005f9a:	fe843583          	ld	a1,-24(s0)
    80005f9e:	fd043503          	ld	a0,-48(s0)
    80005fa2:	ffffb097          	auipc	ra,0xffffb
    80005fa6:	640080e7          	jalr	1600(ra) # 800015e2 <memmove>
    name[len] = 0;
    80005faa:	fe442783          	lw	a5,-28(s0)
    80005fae:	fd043703          	ld	a4,-48(s0)
    80005fb2:	97ba                	add	a5,a5,a4
    80005fb4:	00078023          	sb	zero,0(a5)
  }
  while(*path == '/')
    80005fb8:	a031                	j	80005fc4 <skipelem+0xce>
    path++;
    80005fba:	fd843783          	ld	a5,-40(s0)
    80005fbe:	0785                	addi	a5,a5,1
    80005fc0:	fcf43c23          	sd	a5,-40(s0)
  while(*path == '/')
    80005fc4:	fd843783          	ld	a5,-40(s0)
    80005fc8:	0007c783          	lbu	a5,0(a5)
    80005fcc:	873e                	mv	a4,a5
    80005fce:	02f00793          	li	a5,47
    80005fd2:	fef704e3          	beq	a4,a5,80005fba <skipelem+0xc4>
  return path;
    80005fd6:	fd843783          	ld	a5,-40(s0)
}
    80005fda:	853e                	mv	a0,a5
    80005fdc:	70a2                	ld	ra,40(sp)
    80005fde:	7402                	ld	s0,32(sp)
    80005fe0:	6145                	addi	sp,sp,48
    80005fe2:	8082                	ret

0000000080005fe4 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
    80005fe4:	7139                	addi	sp,sp,-64
    80005fe6:	fc06                	sd	ra,56(sp)
    80005fe8:	f822                	sd	s0,48(sp)
    80005fea:	0080                	addi	s0,sp,64
    80005fec:	fca43c23          	sd	a0,-40(s0)
    80005ff0:	87ae                	mv	a5,a1
    80005ff2:	fcc43423          	sd	a2,-56(s0)
    80005ff6:	fcf42a23          	sw	a5,-44(s0)
  struct inode *ip, *next;

  if(*path == '/')
    80005ffa:	fd843783          	ld	a5,-40(s0)
    80005ffe:	0007c783          	lbu	a5,0(a5)
    80006002:	873e                	mv	a4,a5
    80006004:	02f00793          	li	a5,47
    80006008:	00f71b63          	bne	a4,a5,8000601e <namex+0x3a>
    ip = iget(ROOTDEV, ROOTINO);
    8000600c:	4585                	li	a1,1
    8000600e:	4505                	li	a0,1
    80006010:	fffff097          	auipc	ra,0xfffff
    80006014:	270080e7          	jalr	624(ra) # 80005280 <iget>
    80006018:	fea43423          	sd	a0,-24(s0)
    8000601c:	a84d                	j	800060ce <namex+0xea>
  else
    ip = idup(myproc()->cwd);
    8000601e:	ffffd097          	auipc	ra,0xffffd
    80006022:	b44080e7          	jalr	-1212(ra) # 80002b62 <myproc>
    80006026:	87aa                	mv	a5,a0
    80006028:	1507b783          	ld	a5,336(a5)
    8000602c:	853e                	mv	a0,a5
    8000602e:	fffff097          	auipc	ra,0xfffff
    80006032:	36e080e7          	jalr	878(ra) # 8000539c <idup>
    80006036:	fea43423          	sd	a0,-24(s0)

  while((path = skipelem(path, name)) != 0){
    8000603a:	a851                	j	800060ce <namex+0xea>
    ilock(ip);
    8000603c:	fe843503          	ld	a0,-24(s0)
    80006040:	fffff097          	auipc	ra,0xfffff
    80006044:	3a8080e7          	jalr	936(ra) # 800053e8 <ilock>
    if(ip->type != T_DIR){
    80006048:	fe843783          	ld	a5,-24(s0)
    8000604c:	04479783          	lh	a5,68(a5)
    80006050:	0007871b          	sext.w	a4,a5
    80006054:	4785                	li	a5,1
    80006056:	00f70a63          	beq	a4,a5,8000606a <namex+0x86>
      iunlockput(ip);
    8000605a:	fe843503          	ld	a0,-24(s0)
    8000605e:	fffff097          	auipc	ra,0xfffff
    80006062:	5e8080e7          	jalr	1512(ra) # 80005646 <iunlockput>
      return 0;
    80006066:	4781                	li	a5,0
    80006068:	a871                	j	80006104 <namex+0x120>
    }
    if(nameiparent && *path == '\0'){
    8000606a:	fd442783          	lw	a5,-44(s0)
    8000606e:	2781                	sext.w	a5,a5
    80006070:	cf99                	beqz	a5,8000608e <namex+0xaa>
    80006072:	fd843783          	ld	a5,-40(s0)
    80006076:	0007c783          	lbu	a5,0(a5)
    8000607a:	eb91                	bnez	a5,8000608e <namex+0xaa>
      // Stop one level early.
      iunlock(ip);
    8000607c:	fe843503          	ld	a0,-24(s0)
    80006080:	fffff097          	auipc	ra,0xfffff
    80006084:	49c080e7          	jalr	1180(ra) # 8000551c <iunlock>
      return ip;
    80006088:	fe843783          	ld	a5,-24(s0)
    8000608c:	a8a5                	j	80006104 <namex+0x120>
    }
    if((next = dirlookup(ip, name, 0)) == 0){
    8000608e:	4601                	li	a2,0
    80006090:	fc843583          	ld	a1,-56(s0)
    80006094:	fe843503          	ld	a0,-24(s0)
    80006098:	00000097          	auipc	ra,0x0
    8000609c:	c80080e7          	jalr	-896(ra) # 80005d18 <dirlookup>
    800060a0:	fea43023          	sd	a0,-32(s0)
    800060a4:	fe043783          	ld	a5,-32(s0)
    800060a8:	eb89                	bnez	a5,800060ba <namex+0xd6>
      iunlockput(ip);
    800060aa:	fe843503          	ld	a0,-24(s0)
    800060ae:	fffff097          	auipc	ra,0xfffff
    800060b2:	598080e7          	jalr	1432(ra) # 80005646 <iunlockput>
      return 0;
    800060b6:	4781                	li	a5,0
    800060b8:	a0b1                	j	80006104 <namex+0x120>
    }
    iunlockput(ip);
    800060ba:	fe843503          	ld	a0,-24(s0)
    800060be:	fffff097          	auipc	ra,0xfffff
    800060c2:	588080e7          	jalr	1416(ra) # 80005646 <iunlockput>
    ip = next;
    800060c6:	fe043783          	ld	a5,-32(s0)
    800060ca:	fef43423          	sd	a5,-24(s0)
  while((path = skipelem(path, name)) != 0){
    800060ce:	fc843583          	ld	a1,-56(s0)
    800060d2:	fd843503          	ld	a0,-40(s0)
    800060d6:	00000097          	auipc	ra,0x0
    800060da:	e20080e7          	jalr	-480(ra) # 80005ef6 <skipelem>
    800060de:	fca43c23          	sd	a0,-40(s0)
    800060e2:	fd843783          	ld	a5,-40(s0)
    800060e6:	fbb9                	bnez	a5,8000603c <namex+0x58>
  }
  if(nameiparent){
    800060e8:	fd442783          	lw	a5,-44(s0)
    800060ec:	2781                	sext.w	a5,a5
    800060ee:	cb89                	beqz	a5,80006100 <namex+0x11c>
    iput(ip);
    800060f0:	fe843503          	ld	a0,-24(s0)
    800060f4:	fffff097          	auipc	ra,0xfffff
    800060f8:	482080e7          	jalr	1154(ra) # 80005576 <iput>
    return 0;
    800060fc:	4781                	li	a5,0
    800060fe:	a019                	j	80006104 <namex+0x120>
  }
  return ip;
    80006100:	fe843783          	ld	a5,-24(s0)
}
    80006104:	853e                	mv	a0,a5
    80006106:	70e2                	ld	ra,56(sp)
    80006108:	7442                	ld	s0,48(sp)
    8000610a:	6121                	addi	sp,sp,64
    8000610c:	8082                	ret

000000008000610e <namei>:

struct inode*
namei(char *path)
{
    8000610e:	7179                	addi	sp,sp,-48
    80006110:	f406                	sd	ra,40(sp)
    80006112:	f022                	sd	s0,32(sp)
    80006114:	1800                	addi	s0,sp,48
    80006116:	fca43c23          	sd	a0,-40(s0)
  char name[DIRSIZ];
  return namex(path, 0, name);
    8000611a:	fe040793          	addi	a5,s0,-32
    8000611e:	863e                	mv	a2,a5
    80006120:	4581                	li	a1,0
    80006122:	fd843503          	ld	a0,-40(s0)
    80006126:	00000097          	auipc	ra,0x0
    8000612a:	ebe080e7          	jalr	-322(ra) # 80005fe4 <namex>
    8000612e:	87aa                	mv	a5,a0
}
    80006130:	853e                	mv	a0,a5
    80006132:	70a2                	ld	ra,40(sp)
    80006134:	7402                	ld	s0,32(sp)
    80006136:	6145                	addi	sp,sp,48
    80006138:	8082                	ret

000000008000613a <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
    8000613a:	1101                	addi	sp,sp,-32
    8000613c:	ec06                	sd	ra,24(sp)
    8000613e:	e822                	sd	s0,16(sp)
    80006140:	1000                	addi	s0,sp,32
    80006142:	fea43423          	sd	a0,-24(s0)
    80006146:	feb43023          	sd	a1,-32(s0)
  return namex(path, 1, name);
    8000614a:	fe043603          	ld	a2,-32(s0)
    8000614e:	4585                	li	a1,1
    80006150:	fe843503          	ld	a0,-24(s0)
    80006154:	00000097          	auipc	ra,0x0
    80006158:	e90080e7          	jalr	-368(ra) # 80005fe4 <namex>
    8000615c:	87aa                	mv	a5,a0
}
    8000615e:	853e                	mv	a0,a5
    80006160:	60e2                	ld	ra,24(sp)
    80006162:	6442                	ld	s0,16(sp)
    80006164:	6105                	addi	sp,sp,32
    80006166:	8082                	ret

0000000080006168 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev, struct superblock *sb)
{
    80006168:	1101                	addi	sp,sp,-32
    8000616a:	ec06                	sd	ra,24(sp)
    8000616c:	e822                	sd	s0,16(sp)
    8000616e:	1000                	addi	s0,sp,32
    80006170:	87aa                	mv	a5,a0
    80006172:	feb43023          	sd	a1,-32(s0)
    80006176:	fef42623          	sw	a5,-20(s0)
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  initlock(&log.lock, "log");
    8000617a:	00006597          	auipc	a1,0x6
    8000617e:	3de58593          	addi	a1,a1,990 # 8000c558 <etext+0x558>
    80006182:	0002f517          	auipc	a0,0x2f
    80006186:	a0650513          	addi	a0,a0,-1530 # 80034b88 <log>
    8000618a:	ffffb097          	auipc	ra,0xffffb
    8000618e:	170080e7          	jalr	368(ra) # 800012fa <initlock>
  log.start = sb->logstart;
    80006192:	fe043783          	ld	a5,-32(s0)
    80006196:	4bdc                	lw	a5,20(a5)
    80006198:	0007871b          	sext.w	a4,a5
    8000619c:	0002f797          	auipc	a5,0x2f
    800061a0:	9ec78793          	addi	a5,a5,-1556 # 80034b88 <log>
    800061a4:	cf98                	sw	a4,24(a5)
  log.size = sb->nlog;
    800061a6:	fe043783          	ld	a5,-32(s0)
    800061aa:	4b9c                	lw	a5,16(a5)
    800061ac:	0007871b          	sext.w	a4,a5
    800061b0:	0002f797          	auipc	a5,0x2f
    800061b4:	9d878793          	addi	a5,a5,-1576 # 80034b88 <log>
    800061b8:	cfd8                	sw	a4,28(a5)
  log.dev = dev;
    800061ba:	0002f797          	auipc	a5,0x2f
    800061be:	9ce78793          	addi	a5,a5,-1586 # 80034b88 <log>
    800061c2:	fec42703          	lw	a4,-20(s0)
    800061c6:	d798                	sw	a4,40(a5)
  recover_from_log();
    800061c8:	00000097          	auipc	ra,0x0
    800061cc:	272080e7          	jalr	626(ra) # 8000643a <recover_from_log>
}
    800061d0:	0001                	nop
    800061d2:	60e2                	ld	ra,24(sp)
    800061d4:	6442                	ld	s0,16(sp)
    800061d6:	6105                	addi	sp,sp,32
    800061d8:	8082                	ret

00000000800061da <install_trans>:

// Copy committed blocks from log to their home location
static void
install_trans(int recovering)
{
    800061da:	7139                	addi	sp,sp,-64
    800061dc:	fc06                	sd	ra,56(sp)
    800061de:	f822                	sd	s0,48(sp)
    800061e0:	0080                	addi	s0,sp,64
    800061e2:	87aa                	mv	a5,a0
    800061e4:	fcf42623          	sw	a5,-52(s0)
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    800061e8:	fe042623          	sw	zero,-20(s0)
    800061ec:	a0f9                	j	800062ba <install_trans+0xe0>
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    800061ee:	0002f797          	auipc	a5,0x2f
    800061f2:	99a78793          	addi	a5,a5,-1638 # 80034b88 <log>
    800061f6:	579c                	lw	a5,40(a5)
    800061f8:	0007869b          	sext.w	a3,a5
    800061fc:	0002f797          	auipc	a5,0x2f
    80006200:	98c78793          	addi	a5,a5,-1652 # 80034b88 <log>
    80006204:	4f9c                	lw	a5,24(a5)
    80006206:	fec42703          	lw	a4,-20(s0)
    8000620a:	9fb9                	addw	a5,a5,a4
    8000620c:	2781                	sext.w	a5,a5
    8000620e:	2785                	addiw	a5,a5,1
    80006210:	2781                	sext.w	a5,a5
    80006212:	2781                	sext.w	a5,a5
    80006214:	85be                	mv	a1,a5
    80006216:	8536                	mv	a0,a3
    80006218:	ffffe097          	auipc	ra,0xffffe
    8000621c:	7dc080e7          	jalr	2012(ra) # 800049f4 <bread>
    80006220:	fea43023          	sd	a0,-32(s0)
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
    80006224:	0002f797          	auipc	a5,0x2f
    80006228:	96478793          	addi	a5,a5,-1692 # 80034b88 <log>
    8000622c:	579c                	lw	a5,40(a5)
    8000622e:	0007869b          	sext.w	a3,a5
    80006232:	0002f717          	auipc	a4,0x2f
    80006236:	95670713          	addi	a4,a4,-1706 # 80034b88 <log>
    8000623a:	fec42783          	lw	a5,-20(s0)
    8000623e:	07a1                	addi	a5,a5,8
    80006240:	078a                	slli	a5,a5,0x2
    80006242:	97ba                	add	a5,a5,a4
    80006244:	4b9c                	lw	a5,16(a5)
    80006246:	2781                	sext.w	a5,a5
    80006248:	85be                	mv	a1,a5
    8000624a:	8536                	mv	a0,a3
    8000624c:	ffffe097          	auipc	ra,0xffffe
    80006250:	7a8080e7          	jalr	1960(ra) # 800049f4 <bread>
    80006254:	fca43c23          	sd	a0,-40(s0)
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    80006258:	fd843783          	ld	a5,-40(s0)
    8000625c:	05878713          	addi	a4,a5,88
    80006260:	fe043783          	ld	a5,-32(s0)
    80006264:	05878793          	addi	a5,a5,88
    80006268:	40000613          	li	a2,1024
    8000626c:	85be                	mv	a1,a5
    8000626e:	853a                	mv	a0,a4
    80006270:	ffffb097          	auipc	ra,0xffffb
    80006274:	372080e7          	jalr	882(ra) # 800015e2 <memmove>
    bwrite(dbuf);  // write dst to disk
    80006278:	fd843503          	ld	a0,-40(s0)
    8000627c:	ffffe097          	auipc	ra,0xffffe
    80006280:	7d6080e7          	jalr	2006(ra) # 80004a52 <bwrite>
    if(recovering == 0)
    80006284:	fcc42783          	lw	a5,-52(s0)
    80006288:	2781                	sext.w	a5,a5
    8000628a:	e799                	bnez	a5,80006298 <install_trans+0xbe>
      bunpin(dbuf);
    8000628c:	fd843503          	ld	a0,-40(s0)
    80006290:	fffff097          	auipc	ra,0xfffff
    80006294:	944080e7          	jalr	-1724(ra) # 80004bd4 <bunpin>
    brelse(lbuf);
    80006298:	fe043503          	ld	a0,-32(s0)
    8000629c:	fffff097          	auipc	ra,0xfffff
    800062a0:	802080e7          	jalr	-2046(ra) # 80004a9e <brelse>
    brelse(dbuf);
    800062a4:	fd843503          	ld	a0,-40(s0)
    800062a8:	ffffe097          	auipc	ra,0xffffe
    800062ac:	7f6080e7          	jalr	2038(ra) # 80004a9e <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800062b0:	fec42783          	lw	a5,-20(s0)
    800062b4:	2785                	addiw	a5,a5,1
    800062b6:	fef42623          	sw	a5,-20(s0)
    800062ba:	0002f797          	auipc	a5,0x2f
    800062be:	8ce78793          	addi	a5,a5,-1842 # 80034b88 <log>
    800062c2:	57d8                	lw	a4,44(a5)
    800062c4:	fec42783          	lw	a5,-20(s0)
    800062c8:	2781                	sext.w	a5,a5
    800062ca:	f2e7c2e3          	blt	a5,a4,800061ee <install_trans+0x14>
  }
}
    800062ce:	0001                	nop
    800062d0:	0001                	nop
    800062d2:	70e2                	ld	ra,56(sp)
    800062d4:	7442                	ld	s0,48(sp)
    800062d6:	6121                	addi	sp,sp,64
    800062d8:	8082                	ret

00000000800062da <read_head>:

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
    800062da:	7179                	addi	sp,sp,-48
    800062dc:	f406                	sd	ra,40(sp)
    800062de:	f022                	sd	s0,32(sp)
    800062e0:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    800062e2:	0002f797          	auipc	a5,0x2f
    800062e6:	8a678793          	addi	a5,a5,-1882 # 80034b88 <log>
    800062ea:	579c                	lw	a5,40(a5)
    800062ec:	0007871b          	sext.w	a4,a5
    800062f0:	0002f797          	auipc	a5,0x2f
    800062f4:	89878793          	addi	a5,a5,-1896 # 80034b88 <log>
    800062f8:	4f9c                	lw	a5,24(a5)
    800062fa:	2781                	sext.w	a5,a5
    800062fc:	85be                	mv	a1,a5
    800062fe:	853a                	mv	a0,a4
    80006300:	ffffe097          	auipc	ra,0xffffe
    80006304:	6f4080e7          	jalr	1780(ra) # 800049f4 <bread>
    80006308:	fea43023          	sd	a0,-32(s0)
  struct logheader *lh = (struct logheader *) (buf->data);
    8000630c:	fe043783          	ld	a5,-32(s0)
    80006310:	05878793          	addi	a5,a5,88
    80006314:	fcf43c23          	sd	a5,-40(s0)
  int i;
  log.lh.n = lh->n;
    80006318:	fd843783          	ld	a5,-40(s0)
    8000631c:	4398                	lw	a4,0(a5)
    8000631e:	0002f797          	auipc	a5,0x2f
    80006322:	86a78793          	addi	a5,a5,-1942 # 80034b88 <log>
    80006326:	d7d8                	sw	a4,44(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006328:	fe042623          	sw	zero,-20(s0)
    8000632c:	a03d                	j	8000635a <read_head+0x80>
    log.lh.block[i] = lh->block[i];
    8000632e:	fd843703          	ld	a4,-40(s0)
    80006332:	fec42783          	lw	a5,-20(s0)
    80006336:	078a                	slli	a5,a5,0x2
    80006338:	97ba                	add	a5,a5,a4
    8000633a:	43d8                	lw	a4,4(a5)
    8000633c:	0002f697          	auipc	a3,0x2f
    80006340:	84c68693          	addi	a3,a3,-1972 # 80034b88 <log>
    80006344:	fec42783          	lw	a5,-20(s0)
    80006348:	07a1                	addi	a5,a5,8
    8000634a:	078a                	slli	a5,a5,0x2
    8000634c:	97b6                	add	a5,a5,a3
    8000634e:	cb98                	sw	a4,16(a5)
  for (i = 0; i < log.lh.n; i++) {
    80006350:	fec42783          	lw	a5,-20(s0)
    80006354:	2785                	addiw	a5,a5,1
    80006356:	fef42623          	sw	a5,-20(s0)
    8000635a:	0002f797          	auipc	a5,0x2f
    8000635e:	82e78793          	addi	a5,a5,-2002 # 80034b88 <log>
    80006362:	57d8                	lw	a4,44(a5)
    80006364:	fec42783          	lw	a5,-20(s0)
    80006368:	2781                	sext.w	a5,a5
    8000636a:	fce7c2e3          	blt	a5,a4,8000632e <read_head+0x54>
  }
  brelse(buf);
    8000636e:	fe043503          	ld	a0,-32(s0)
    80006372:	ffffe097          	auipc	ra,0xffffe
    80006376:	72c080e7          	jalr	1836(ra) # 80004a9e <brelse>
}
    8000637a:	0001                	nop
    8000637c:	70a2                	ld	ra,40(sp)
    8000637e:	7402                	ld	s0,32(sp)
    80006380:	6145                	addi	sp,sp,48
    80006382:	8082                	ret

0000000080006384 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
    80006384:	7179                	addi	sp,sp,-48
    80006386:	f406                	sd	ra,40(sp)
    80006388:	f022                	sd	s0,32(sp)
    8000638a:	1800                	addi	s0,sp,48
  struct buf *buf = bread(log.dev, log.start);
    8000638c:	0002e797          	auipc	a5,0x2e
    80006390:	7fc78793          	addi	a5,a5,2044 # 80034b88 <log>
    80006394:	579c                	lw	a5,40(a5)
    80006396:	0007871b          	sext.w	a4,a5
    8000639a:	0002e797          	auipc	a5,0x2e
    8000639e:	7ee78793          	addi	a5,a5,2030 # 80034b88 <log>
    800063a2:	4f9c                	lw	a5,24(a5)
    800063a4:	2781                	sext.w	a5,a5
    800063a6:	85be                	mv	a1,a5
    800063a8:	853a                	mv	a0,a4
    800063aa:	ffffe097          	auipc	ra,0xffffe
    800063ae:	64a080e7          	jalr	1610(ra) # 800049f4 <bread>
    800063b2:	fea43023          	sd	a0,-32(s0)
  struct logheader *hb = (struct logheader *) (buf->data);
    800063b6:	fe043783          	ld	a5,-32(s0)
    800063ba:	05878793          	addi	a5,a5,88
    800063be:	fcf43c23          	sd	a5,-40(s0)
  int i;
  hb->n = log.lh.n;
    800063c2:	0002e797          	auipc	a5,0x2e
    800063c6:	7c678793          	addi	a5,a5,1990 # 80034b88 <log>
    800063ca:	57d8                	lw	a4,44(a5)
    800063cc:	fd843783          	ld	a5,-40(s0)
    800063d0:	c398                	sw	a4,0(a5)
  for (i = 0; i < log.lh.n; i++) {
    800063d2:	fe042623          	sw	zero,-20(s0)
    800063d6:	a03d                	j	80006404 <write_head+0x80>
    hb->block[i] = log.lh.block[i];
    800063d8:	0002e717          	auipc	a4,0x2e
    800063dc:	7b070713          	addi	a4,a4,1968 # 80034b88 <log>
    800063e0:	fec42783          	lw	a5,-20(s0)
    800063e4:	07a1                	addi	a5,a5,8
    800063e6:	078a                	slli	a5,a5,0x2
    800063e8:	97ba                	add	a5,a5,a4
    800063ea:	4b98                	lw	a4,16(a5)
    800063ec:	fd843683          	ld	a3,-40(s0)
    800063f0:	fec42783          	lw	a5,-20(s0)
    800063f4:	078a                	slli	a5,a5,0x2
    800063f6:	97b6                	add	a5,a5,a3
    800063f8:	c3d8                	sw	a4,4(a5)
  for (i = 0; i < log.lh.n; i++) {
    800063fa:	fec42783          	lw	a5,-20(s0)
    800063fe:	2785                	addiw	a5,a5,1
    80006400:	fef42623          	sw	a5,-20(s0)
    80006404:	0002e797          	auipc	a5,0x2e
    80006408:	78478793          	addi	a5,a5,1924 # 80034b88 <log>
    8000640c:	57d8                	lw	a4,44(a5)
    8000640e:	fec42783          	lw	a5,-20(s0)
    80006412:	2781                	sext.w	a5,a5
    80006414:	fce7c2e3          	blt	a5,a4,800063d8 <write_head+0x54>
  }
  bwrite(buf);
    80006418:	fe043503          	ld	a0,-32(s0)
    8000641c:	ffffe097          	auipc	ra,0xffffe
    80006420:	636080e7          	jalr	1590(ra) # 80004a52 <bwrite>
  brelse(buf);
    80006424:	fe043503          	ld	a0,-32(s0)
    80006428:	ffffe097          	auipc	ra,0xffffe
    8000642c:	676080e7          	jalr	1654(ra) # 80004a9e <brelse>
}
    80006430:	0001                	nop
    80006432:	70a2                	ld	ra,40(sp)
    80006434:	7402                	ld	s0,32(sp)
    80006436:	6145                	addi	sp,sp,48
    80006438:	8082                	ret

000000008000643a <recover_from_log>:

static void
recover_from_log(void)
{
    8000643a:	1141                	addi	sp,sp,-16
    8000643c:	e406                	sd	ra,8(sp)
    8000643e:	e022                	sd	s0,0(sp)
    80006440:	0800                	addi	s0,sp,16
  read_head();
    80006442:	00000097          	auipc	ra,0x0
    80006446:	e98080e7          	jalr	-360(ra) # 800062da <read_head>
  install_trans(1); // if committed, copy from log to disk
    8000644a:	4505                	li	a0,1
    8000644c:	00000097          	auipc	ra,0x0
    80006450:	d8e080e7          	jalr	-626(ra) # 800061da <install_trans>
  log.lh.n = 0;
    80006454:	0002e797          	auipc	a5,0x2e
    80006458:	73478793          	addi	a5,a5,1844 # 80034b88 <log>
    8000645c:	0207a623          	sw	zero,44(a5)
  write_head(); // clear the log
    80006460:	00000097          	auipc	ra,0x0
    80006464:	f24080e7          	jalr	-220(ra) # 80006384 <write_head>
}
    80006468:	0001                	nop
    8000646a:	60a2                	ld	ra,8(sp)
    8000646c:	6402                	ld	s0,0(sp)
    8000646e:	0141                	addi	sp,sp,16
    80006470:	8082                	ret

0000000080006472 <begin_op>:

// called at the start of each FS system call.
void
begin_op(void)
{
    80006472:	1141                	addi	sp,sp,-16
    80006474:	e406                	sd	ra,8(sp)
    80006476:	e022                	sd	s0,0(sp)
    80006478:	0800                	addi	s0,sp,16
  acquire(&log.lock);
    8000647a:	0002e517          	auipc	a0,0x2e
    8000647e:	70e50513          	addi	a0,a0,1806 # 80034b88 <log>
    80006482:	ffffb097          	auipc	ra,0xffffb
    80006486:	ea8080e7          	jalr	-344(ra) # 8000132a <acquire>
  while(1){
    if(log.committing){
    8000648a:	0002e797          	auipc	a5,0x2e
    8000648e:	6fe78793          	addi	a5,a5,1790 # 80034b88 <log>
    80006492:	53dc                	lw	a5,36(a5)
    80006494:	cf91                	beqz	a5,800064b0 <begin_op+0x3e>
      sleep(&log, &log.lock);
    80006496:	0002e597          	auipc	a1,0x2e
    8000649a:	6f258593          	addi	a1,a1,1778 # 80034b88 <log>
    8000649e:	0002e517          	auipc	a0,0x2e
    800064a2:	6ea50513          	addi	a0,a0,1770 # 80034b88 <log>
    800064a6:	ffffd097          	auipc	ra,0xffffd
    800064aa:	27e080e7          	jalr	638(ra) # 80003724 <sleep>
    800064ae:	bff1                	j	8000648a <begin_op+0x18>
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
    800064b0:	0002e797          	auipc	a5,0x2e
    800064b4:	6d878793          	addi	a5,a5,1752 # 80034b88 <log>
    800064b8:	57d8                	lw	a4,44(a5)
    800064ba:	0002e797          	auipc	a5,0x2e
    800064be:	6ce78793          	addi	a5,a5,1742 # 80034b88 <log>
    800064c2:	539c                	lw	a5,32(a5)
    800064c4:	2785                	addiw	a5,a5,1
    800064c6:	2781                	sext.w	a5,a5
    800064c8:	86be                	mv	a3,a5
    800064ca:	87b6                	mv	a5,a3
    800064cc:	0027979b          	slliw	a5,a5,0x2
    800064d0:	9fb5                	addw	a5,a5,a3
    800064d2:	0017979b          	slliw	a5,a5,0x1
    800064d6:	2781                	sext.w	a5,a5
    800064d8:	9fb9                	addw	a5,a5,a4
    800064da:	2781                	sext.w	a5,a5
    800064dc:	873e                	mv	a4,a5
    800064de:	47f9                	li	a5,30
    800064e0:	00e7df63          	bge	a5,a4,800064fe <begin_op+0x8c>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    800064e4:	0002e597          	auipc	a1,0x2e
    800064e8:	6a458593          	addi	a1,a1,1700 # 80034b88 <log>
    800064ec:	0002e517          	auipc	a0,0x2e
    800064f0:	69c50513          	addi	a0,a0,1692 # 80034b88 <log>
    800064f4:	ffffd097          	auipc	ra,0xffffd
    800064f8:	230080e7          	jalr	560(ra) # 80003724 <sleep>
    800064fc:	b779                	j	8000648a <begin_op+0x18>
    } else {
      log.outstanding += 1;
    800064fe:	0002e797          	auipc	a5,0x2e
    80006502:	68a78793          	addi	a5,a5,1674 # 80034b88 <log>
    80006506:	539c                	lw	a5,32(a5)
    80006508:	2785                	addiw	a5,a5,1
    8000650a:	0007871b          	sext.w	a4,a5
    8000650e:	0002e797          	auipc	a5,0x2e
    80006512:	67a78793          	addi	a5,a5,1658 # 80034b88 <log>
    80006516:	d398                	sw	a4,32(a5)
      release(&log.lock);
    80006518:	0002e517          	auipc	a0,0x2e
    8000651c:	67050513          	addi	a0,a0,1648 # 80034b88 <log>
    80006520:	ffffb097          	auipc	ra,0xffffb
    80006524:	e6e080e7          	jalr	-402(ra) # 8000138e <release>
      break;
    80006528:	0001                	nop
    }
  }
}
    8000652a:	0001                	nop
    8000652c:	60a2                	ld	ra,8(sp)
    8000652e:	6402                	ld	s0,0(sp)
    80006530:	0141                	addi	sp,sp,16
    80006532:	8082                	ret

0000000080006534 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
    80006534:	1101                	addi	sp,sp,-32
    80006536:	ec06                	sd	ra,24(sp)
    80006538:	e822                	sd	s0,16(sp)
    8000653a:	1000                	addi	s0,sp,32
  int do_commit = 0;
    8000653c:	fe042623          	sw	zero,-20(s0)

  acquire(&log.lock);
    80006540:	0002e517          	auipc	a0,0x2e
    80006544:	64850513          	addi	a0,a0,1608 # 80034b88 <log>
    80006548:	ffffb097          	auipc	ra,0xffffb
    8000654c:	de2080e7          	jalr	-542(ra) # 8000132a <acquire>
  log.outstanding -= 1;
    80006550:	0002e797          	auipc	a5,0x2e
    80006554:	63878793          	addi	a5,a5,1592 # 80034b88 <log>
    80006558:	539c                	lw	a5,32(a5)
    8000655a:	37fd                	addiw	a5,a5,-1
    8000655c:	0007871b          	sext.w	a4,a5
    80006560:	0002e797          	auipc	a5,0x2e
    80006564:	62878793          	addi	a5,a5,1576 # 80034b88 <log>
    80006568:	d398                	sw	a4,32(a5)
  if(log.committing)
    8000656a:	0002e797          	auipc	a5,0x2e
    8000656e:	61e78793          	addi	a5,a5,1566 # 80034b88 <log>
    80006572:	53dc                	lw	a5,36(a5)
    80006574:	cb89                	beqz	a5,80006586 <end_op+0x52>
    panic("log.committing");
    80006576:	00006517          	auipc	a0,0x6
    8000657a:	fea50513          	addi	a0,a0,-22 # 8000c560 <etext+0x560>
    8000657e:	ffffa097          	auipc	ra,0xffffa
    80006582:	70e080e7          	jalr	1806(ra) # 80000c8c <panic>
  if(log.outstanding == 0){
    80006586:	0002e797          	auipc	a5,0x2e
    8000658a:	60278793          	addi	a5,a5,1538 # 80034b88 <log>
    8000658e:	539c                	lw	a5,32(a5)
    80006590:	eb99                	bnez	a5,800065a6 <end_op+0x72>
    do_commit = 1;
    80006592:	4785                	li	a5,1
    80006594:	fef42623          	sw	a5,-20(s0)
    log.committing = 1;
    80006598:	0002e797          	auipc	a5,0x2e
    8000659c:	5f078793          	addi	a5,a5,1520 # 80034b88 <log>
    800065a0:	4705                	li	a4,1
    800065a2:	d3d8                	sw	a4,36(a5)
    800065a4:	a809                	j	800065b6 <end_op+0x82>
  } else {
    // begin_op() may be waiting for log space,
    // and decrementing log.outstanding has decreased
    // the amount of reserved space.
    wakeup(&log);
    800065a6:	0002e517          	auipc	a0,0x2e
    800065aa:	5e250513          	addi	a0,a0,1506 # 80034b88 <log>
    800065ae:	ffffd097          	auipc	ra,0xffffd
    800065b2:	1f2080e7          	jalr	498(ra) # 800037a0 <wakeup>
  }
  release(&log.lock);
    800065b6:	0002e517          	auipc	a0,0x2e
    800065ba:	5d250513          	addi	a0,a0,1490 # 80034b88 <log>
    800065be:	ffffb097          	auipc	ra,0xffffb
    800065c2:	dd0080e7          	jalr	-560(ra) # 8000138e <release>

  if(do_commit){
    800065c6:	fec42783          	lw	a5,-20(s0)
    800065ca:	2781                	sext.w	a5,a5
    800065cc:	c3b9                	beqz	a5,80006612 <end_op+0xde>
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    800065ce:	00000097          	auipc	ra,0x0
    800065d2:	134080e7          	jalr	308(ra) # 80006702 <commit>
    acquire(&log.lock);
    800065d6:	0002e517          	auipc	a0,0x2e
    800065da:	5b250513          	addi	a0,a0,1458 # 80034b88 <log>
    800065de:	ffffb097          	auipc	ra,0xffffb
    800065e2:	d4c080e7          	jalr	-692(ra) # 8000132a <acquire>
    log.committing = 0;
    800065e6:	0002e797          	auipc	a5,0x2e
    800065ea:	5a278793          	addi	a5,a5,1442 # 80034b88 <log>
    800065ee:	0207a223          	sw	zero,36(a5)
    wakeup(&log);
    800065f2:	0002e517          	auipc	a0,0x2e
    800065f6:	59650513          	addi	a0,a0,1430 # 80034b88 <log>
    800065fa:	ffffd097          	auipc	ra,0xffffd
    800065fe:	1a6080e7          	jalr	422(ra) # 800037a0 <wakeup>
    release(&log.lock);
    80006602:	0002e517          	auipc	a0,0x2e
    80006606:	58650513          	addi	a0,a0,1414 # 80034b88 <log>
    8000660a:	ffffb097          	auipc	ra,0xffffb
    8000660e:	d84080e7          	jalr	-636(ra) # 8000138e <release>
  }
}
    80006612:	0001                	nop
    80006614:	60e2                	ld	ra,24(sp)
    80006616:	6442                	ld	s0,16(sp)
    80006618:	6105                	addi	sp,sp,32
    8000661a:	8082                	ret

000000008000661c <write_log>:

// Copy modified blocks from cache to log.
static void
write_log(void)
{
    8000661c:	7179                	addi	sp,sp,-48
    8000661e:	f406                	sd	ra,40(sp)
    80006620:	f022                	sd	s0,32(sp)
    80006622:	1800                	addi	s0,sp,48
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    80006624:	fe042623          	sw	zero,-20(s0)
    80006628:	a86d                	j	800066e2 <write_log+0xc6>
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    8000662a:	0002e797          	auipc	a5,0x2e
    8000662e:	55e78793          	addi	a5,a5,1374 # 80034b88 <log>
    80006632:	579c                	lw	a5,40(a5)
    80006634:	0007869b          	sext.w	a3,a5
    80006638:	0002e797          	auipc	a5,0x2e
    8000663c:	55078793          	addi	a5,a5,1360 # 80034b88 <log>
    80006640:	4f9c                	lw	a5,24(a5)
    80006642:	fec42703          	lw	a4,-20(s0)
    80006646:	9fb9                	addw	a5,a5,a4
    80006648:	2781                	sext.w	a5,a5
    8000664a:	2785                	addiw	a5,a5,1
    8000664c:	2781                	sext.w	a5,a5
    8000664e:	2781                	sext.w	a5,a5
    80006650:	85be                	mv	a1,a5
    80006652:	8536                	mv	a0,a3
    80006654:	ffffe097          	auipc	ra,0xffffe
    80006658:	3a0080e7          	jalr	928(ra) # 800049f4 <bread>
    8000665c:	fea43023          	sd	a0,-32(s0)
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
    80006660:	0002e797          	auipc	a5,0x2e
    80006664:	52878793          	addi	a5,a5,1320 # 80034b88 <log>
    80006668:	579c                	lw	a5,40(a5)
    8000666a:	0007869b          	sext.w	a3,a5
    8000666e:	0002e717          	auipc	a4,0x2e
    80006672:	51a70713          	addi	a4,a4,1306 # 80034b88 <log>
    80006676:	fec42783          	lw	a5,-20(s0)
    8000667a:	07a1                	addi	a5,a5,8
    8000667c:	078a                	slli	a5,a5,0x2
    8000667e:	97ba                	add	a5,a5,a4
    80006680:	4b9c                	lw	a5,16(a5)
    80006682:	2781                	sext.w	a5,a5
    80006684:	85be                	mv	a1,a5
    80006686:	8536                	mv	a0,a3
    80006688:	ffffe097          	auipc	ra,0xffffe
    8000668c:	36c080e7          	jalr	876(ra) # 800049f4 <bread>
    80006690:	fca43c23          	sd	a0,-40(s0)
    memmove(to->data, from->data, BSIZE);
    80006694:	fe043783          	ld	a5,-32(s0)
    80006698:	05878713          	addi	a4,a5,88
    8000669c:	fd843783          	ld	a5,-40(s0)
    800066a0:	05878793          	addi	a5,a5,88
    800066a4:	40000613          	li	a2,1024
    800066a8:	85be                	mv	a1,a5
    800066aa:	853a                	mv	a0,a4
    800066ac:	ffffb097          	auipc	ra,0xffffb
    800066b0:	f36080e7          	jalr	-202(ra) # 800015e2 <memmove>
    bwrite(to);  // write the log
    800066b4:	fe043503          	ld	a0,-32(s0)
    800066b8:	ffffe097          	auipc	ra,0xffffe
    800066bc:	39a080e7          	jalr	922(ra) # 80004a52 <bwrite>
    brelse(from);
    800066c0:	fd843503          	ld	a0,-40(s0)
    800066c4:	ffffe097          	auipc	ra,0xffffe
    800066c8:	3da080e7          	jalr	986(ra) # 80004a9e <brelse>
    brelse(to);
    800066cc:	fe043503          	ld	a0,-32(s0)
    800066d0:	ffffe097          	auipc	ra,0xffffe
    800066d4:	3ce080e7          	jalr	974(ra) # 80004a9e <brelse>
  for (tail = 0; tail < log.lh.n; tail++) {
    800066d8:	fec42783          	lw	a5,-20(s0)
    800066dc:	2785                	addiw	a5,a5,1
    800066de:	fef42623          	sw	a5,-20(s0)
    800066e2:	0002e797          	auipc	a5,0x2e
    800066e6:	4a678793          	addi	a5,a5,1190 # 80034b88 <log>
    800066ea:	57d8                	lw	a4,44(a5)
    800066ec:	fec42783          	lw	a5,-20(s0)
    800066f0:	2781                	sext.w	a5,a5
    800066f2:	f2e7cce3          	blt	a5,a4,8000662a <write_log+0xe>
  }
}
    800066f6:	0001                	nop
    800066f8:	0001                	nop
    800066fa:	70a2                	ld	ra,40(sp)
    800066fc:	7402                	ld	s0,32(sp)
    800066fe:	6145                	addi	sp,sp,48
    80006700:	8082                	ret

0000000080006702 <commit>:

static void
commit()
{
    80006702:	1141                	addi	sp,sp,-16
    80006704:	e406                	sd	ra,8(sp)
    80006706:	e022                	sd	s0,0(sp)
    80006708:	0800                	addi	s0,sp,16
  if (log.lh.n > 0) {
    8000670a:	0002e797          	auipc	a5,0x2e
    8000670e:	47e78793          	addi	a5,a5,1150 # 80034b88 <log>
    80006712:	57dc                	lw	a5,44(a5)
    80006714:	02f05963          	blez	a5,80006746 <commit+0x44>
    write_log();     // Write modified blocks from cache to log
    80006718:	00000097          	auipc	ra,0x0
    8000671c:	f04080e7          	jalr	-252(ra) # 8000661c <write_log>
    write_head();    // Write header to disk -- the real commit
    80006720:	00000097          	auipc	ra,0x0
    80006724:	c64080e7          	jalr	-924(ra) # 80006384 <write_head>
    install_trans(0); // Now install writes to home locations
    80006728:	4501                	li	a0,0
    8000672a:	00000097          	auipc	ra,0x0
    8000672e:	ab0080e7          	jalr	-1360(ra) # 800061da <install_trans>
    log.lh.n = 0;
    80006732:	0002e797          	auipc	a5,0x2e
    80006736:	45678793          	addi	a5,a5,1110 # 80034b88 <log>
    8000673a:	0207a623          	sw	zero,44(a5)
    write_head();    // Erase the transaction from the log
    8000673e:	00000097          	auipc	ra,0x0
    80006742:	c46080e7          	jalr	-954(ra) # 80006384 <write_head>
  }
}
    80006746:	0001                	nop
    80006748:	60a2                	ld	ra,8(sp)
    8000674a:	6402                	ld	s0,0(sp)
    8000674c:	0141                	addi	sp,sp,16
    8000674e:	8082                	ret

0000000080006750 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
    80006750:	7179                	addi	sp,sp,-48
    80006752:	f406                	sd	ra,40(sp)
    80006754:	f022                	sd	s0,32(sp)
    80006756:	1800                	addi	s0,sp,48
    80006758:	fca43c23          	sd	a0,-40(s0)
  int i;

  acquire(&log.lock);
    8000675c:	0002e517          	auipc	a0,0x2e
    80006760:	42c50513          	addi	a0,a0,1068 # 80034b88 <log>
    80006764:	ffffb097          	auipc	ra,0xffffb
    80006768:	bc6080e7          	jalr	-1082(ra) # 8000132a <acquire>
  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    8000676c:	0002e797          	auipc	a5,0x2e
    80006770:	41c78793          	addi	a5,a5,1052 # 80034b88 <log>
    80006774:	57dc                	lw	a5,44(a5)
    80006776:	873e                	mv	a4,a5
    80006778:	47f5                	li	a5,29
    8000677a:	02e7c063          	blt	a5,a4,8000679a <log_write+0x4a>
    8000677e:	0002e797          	auipc	a5,0x2e
    80006782:	40a78793          	addi	a5,a5,1034 # 80034b88 <log>
    80006786:	57d8                	lw	a4,44(a5)
    80006788:	0002e797          	auipc	a5,0x2e
    8000678c:	40078793          	addi	a5,a5,1024 # 80034b88 <log>
    80006790:	4fdc                	lw	a5,28(a5)
    80006792:	37fd                	addiw	a5,a5,-1
    80006794:	2781                	sext.w	a5,a5
    80006796:	00f74a63          	blt	a4,a5,800067aa <log_write+0x5a>
    panic("too big a transaction");
    8000679a:	00006517          	auipc	a0,0x6
    8000679e:	dd650513          	addi	a0,a0,-554 # 8000c570 <etext+0x570>
    800067a2:	ffffa097          	auipc	ra,0xffffa
    800067a6:	4ea080e7          	jalr	1258(ra) # 80000c8c <panic>
  if (log.outstanding < 1)
    800067aa:	0002e797          	auipc	a5,0x2e
    800067ae:	3de78793          	addi	a5,a5,990 # 80034b88 <log>
    800067b2:	539c                	lw	a5,32(a5)
    800067b4:	00f04a63          	bgtz	a5,800067c8 <log_write+0x78>
    panic("log_write outside of trans");
    800067b8:	00006517          	auipc	a0,0x6
    800067bc:	dd050513          	addi	a0,a0,-560 # 8000c588 <etext+0x588>
    800067c0:	ffffa097          	auipc	ra,0xffffa
    800067c4:	4cc080e7          	jalr	1228(ra) # 80000c8c <panic>

  for (i = 0; i < log.lh.n; i++) {
    800067c8:	fe042623          	sw	zero,-20(s0)
    800067cc:	a03d                	j	800067fa <log_write+0xaa>
    if (log.lh.block[i] == b->blockno)   // log absorption
    800067ce:	0002e717          	auipc	a4,0x2e
    800067d2:	3ba70713          	addi	a4,a4,954 # 80034b88 <log>
    800067d6:	fec42783          	lw	a5,-20(s0)
    800067da:	07a1                	addi	a5,a5,8
    800067dc:	078a                	slli	a5,a5,0x2
    800067de:	97ba                	add	a5,a5,a4
    800067e0:	4b9c                	lw	a5,16(a5)
    800067e2:	0007871b          	sext.w	a4,a5
    800067e6:	fd843783          	ld	a5,-40(s0)
    800067ea:	47dc                	lw	a5,12(a5)
    800067ec:	02f70263          	beq	a4,a5,80006810 <log_write+0xc0>
  for (i = 0; i < log.lh.n; i++) {
    800067f0:	fec42783          	lw	a5,-20(s0)
    800067f4:	2785                	addiw	a5,a5,1
    800067f6:	fef42623          	sw	a5,-20(s0)
    800067fa:	0002e797          	auipc	a5,0x2e
    800067fe:	38e78793          	addi	a5,a5,910 # 80034b88 <log>
    80006802:	57d8                	lw	a4,44(a5)
    80006804:	fec42783          	lw	a5,-20(s0)
    80006808:	2781                	sext.w	a5,a5
    8000680a:	fce7c2e3          	blt	a5,a4,800067ce <log_write+0x7e>
    8000680e:	a011                	j	80006812 <log_write+0xc2>
      break;
    80006810:	0001                	nop
  }
  log.lh.block[i] = b->blockno;
    80006812:	fd843783          	ld	a5,-40(s0)
    80006816:	47dc                	lw	a5,12(a5)
    80006818:	0007871b          	sext.w	a4,a5
    8000681c:	0002e697          	auipc	a3,0x2e
    80006820:	36c68693          	addi	a3,a3,876 # 80034b88 <log>
    80006824:	fec42783          	lw	a5,-20(s0)
    80006828:	07a1                	addi	a5,a5,8
    8000682a:	078a                	slli	a5,a5,0x2
    8000682c:	97b6                	add	a5,a5,a3
    8000682e:	cb98                	sw	a4,16(a5)
  if (i == log.lh.n) {  // Add new block to log?
    80006830:	0002e797          	auipc	a5,0x2e
    80006834:	35878793          	addi	a5,a5,856 # 80034b88 <log>
    80006838:	57d8                	lw	a4,44(a5)
    8000683a:	fec42783          	lw	a5,-20(s0)
    8000683e:	2781                	sext.w	a5,a5
    80006840:	02e79563          	bne	a5,a4,8000686a <log_write+0x11a>
    bpin(b);
    80006844:	fd843503          	ld	a0,-40(s0)
    80006848:	ffffe097          	auipc	ra,0xffffe
    8000684c:	344080e7          	jalr	836(ra) # 80004b8c <bpin>
    log.lh.n++;
    80006850:	0002e797          	auipc	a5,0x2e
    80006854:	33878793          	addi	a5,a5,824 # 80034b88 <log>
    80006858:	57dc                	lw	a5,44(a5)
    8000685a:	2785                	addiw	a5,a5,1
    8000685c:	0007871b          	sext.w	a4,a5
    80006860:	0002e797          	auipc	a5,0x2e
    80006864:	32878793          	addi	a5,a5,808 # 80034b88 <log>
    80006868:	d7d8                	sw	a4,44(a5)
  }
  release(&log.lock);
    8000686a:	0002e517          	auipc	a0,0x2e
    8000686e:	31e50513          	addi	a0,a0,798 # 80034b88 <log>
    80006872:	ffffb097          	auipc	ra,0xffffb
    80006876:	b1c080e7          	jalr	-1252(ra) # 8000138e <release>
}
    8000687a:	0001                	nop
    8000687c:	70a2                	ld	ra,40(sp)
    8000687e:	7402                	ld	s0,32(sp)
    80006880:	6145                	addi	sp,sp,48
    80006882:	8082                	ret

0000000080006884 <initsleeplock>:
#include "proc.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
    80006884:	1101                	addi	sp,sp,-32
    80006886:	ec06                	sd	ra,24(sp)
    80006888:	e822                	sd	s0,16(sp)
    8000688a:	1000                	addi	s0,sp,32
    8000688c:	fea43423          	sd	a0,-24(s0)
    80006890:	feb43023          	sd	a1,-32(s0)
  initlock(&lk->lk, "sleep lock");
    80006894:	fe843783          	ld	a5,-24(s0)
    80006898:	07a1                	addi	a5,a5,8
    8000689a:	00006597          	auipc	a1,0x6
    8000689e:	d0e58593          	addi	a1,a1,-754 # 8000c5a8 <etext+0x5a8>
    800068a2:	853e                	mv	a0,a5
    800068a4:	ffffb097          	auipc	ra,0xffffb
    800068a8:	a56080e7          	jalr	-1450(ra) # 800012fa <initlock>
  lk->name = name;
    800068ac:	fe843783          	ld	a5,-24(s0)
    800068b0:	fe043703          	ld	a4,-32(s0)
    800068b4:	f398                	sd	a4,32(a5)
  lk->locked = 0;
    800068b6:	fe843783          	ld	a5,-24(s0)
    800068ba:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    800068be:	fe843783          	ld	a5,-24(s0)
    800068c2:	0207a423          	sw	zero,40(a5)
}
    800068c6:	0001                	nop
    800068c8:	60e2                	ld	ra,24(sp)
    800068ca:	6442                	ld	s0,16(sp)
    800068cc:	6105                	addi	sp,sp,32
    800068ce:	8082                	ret

00000000800068d0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
    800068d0:	1101                	addi	sp,sp,-32
    800068d2:	ec06                	sd	ra,24(sp)
    800068d4:	e822                	sd	s0,16(sp)
    800068d6:	1000                	addi	s0,sp,32
    800068d8:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    800068dc:	fe843783          	ld	a5,-24(s0)
    800068e0:	07a1                	addi	a5,a5,8
    800068e2:	853e                	mv	a0,a5
    800068e4:	ffffb097          	auipc	ra,0xffffb
    800068e8:	a46080e7          	jalr	-1466(ra) # 8000132a <acquire>
  while (lk->locked) {
    800068ec:	a819                	j	80006902 <acquiresleep+0x32>
    sleep(lk, &lk->lk);
    800068ee:	fe843783          	ld	a5,-24(s0)
    800068f2:	07a1                	addi	a5,a5,8
    800068f4:	85be                	mv	a1,a5
    800068f6:	fe843503          	ld	a0,-24(s0)
    800068fa:	ffffd097          	auipc	ra,0xffffd
    800068fe:	e2a080e7          	jalr	-470(ra) # 80003724 <sleep>
  while (lk->locked) {
    80006902:	fe843783          	ld	a5,-24(s0)
    80006906:	439c                	lw	a5,0(a5)
    80006908:	f3fd                	bnez	a5,800068ee <acquiresleep+0x1e>
  }
  lk->locked = 1;
    8000690a:	fe843783          	ld	a5,-24(s0)
    8000690e:	4705                	li	a4,1
    80006910:	c398                	sw	a4,0(a5)
  lk->pid = myproc()->pid;
    80006912:	ffffc097          	auipc	ra,0xffffc
    80006916:	250080e7          	jalr	592(ra) # 80002b62 <myproc>
    8000691a:	87aa                	mv	a5,a0
    8000691c:	5b98                	lw	a4,48(a5)
    8000691e:	fe843783          	ld	a5,-24(s0)
    80006922:	d798                	sw	a4,40(a5)
  release(&lk->lk);
    80006924:	fe843783          	ld	a5,-24(s0)
    80006928:	07a1                	addi	a5,a5,8
    8000692a:	853e                	mv	a0,a5
    8000692c:	ffffb097          	auipc	ra,0xffffb
    80006930:	a62080e7          	jalr	-1438(ra) # 8000138e <release>
}
    80006934:	0001                	nop
    80006936:	60e2                	ld	ra,24(sp)
    80006938:	6442                	ld	s0,16(sp)
    8000693a:	6105                	addi	sp,sp,32
    8000693c:	8082                	ret

000000008000693e <releasesleep>:

void
releasesleep(struct sleeplock *lk)
{
    8000693e:	1101                	addi	sp,sp,-32
    80006940:	ec06                	sd	ra,24(sp)
    80006942:	e822                	sd	s0,16(sp)
    80006944:	1000                	addi	s0,sp,32
    80006946:	fea43423          	sd	a0,-24(s0)
  acquire(&lk->lk);
    8000694a:	fe843783          	ld	a5,-24(s0)
    8000694e:	07a1                	addi	a5,a5,8
    80006950:	853e                	mv	a0,a5
    80006952:	ffffb097          	auipc	ra,0xffffb
    80006956:	9d8080e7          	jalr	-1576(ra) # 8000132a <acquire>
  lk->locked = 0;
    8000695a:	fe843783          	ld	a5,-24(s0)
    8000695e:	0007a023          	sw	zero,0(a5)
  lk->pid = 0;
    80006962:	fe843783          	ld	a5,-24(s0)
    80006966:	0207a423          	sw	zero,40(a5)
  wakeup(lk);
    8000696a:	fe843503          	ld	a0,-24(s0)
    8000696e:	ffffd097          	auipc	ra,0xffffd
    80006972:	e32080e7          	jalr	-462(ra) # 800037a0 <wakeup>
  release(&lk->lk);
    80006976:	fe843783          	ld	a5,-24(s0)
    8000697a:	07a1                	addi	a5,a5,8
    8000697c:	853e                	mv	a0,a5
    8000697e:	ffffb097          	auipc	ra,0xffffb
    80006982:	a10080e7          	jalr	-1520(ra) # 8000138e <release>
}
    80006986:	0001                	nop
    80006988:	60e2                	ld	ra,24(sp)
    8000698a:	6442                	ld	s0,16(sp)
    8000698c:	6105                	addi	sp,sp,32
    8000698e:	8082                	ret

0000000080006990 <holdingsleep>:

int
holdingsleep(struct sleeplock *lk)
{
    80006990:	7139                	addi	sp,sp,-64
    80006992:	fc06                	sd	ra,56(sp)
    80006994:	f822                	sd	s0,48(sp)
    80006996:	f426                	sd	s1,40(sp)
    80006998:	0080                	addi	s0,sp,64
    8000699a:	fca43423          	sd	a0,-56(s0)
  int r;
  
  acquire(&lk->lk);
    8000699e:	fc843783          	ld	a5,-56(s0)
    800069a2:	07a1                	addi	a5,a5,8
    800069a4:	853e                	mv	a0,a5
    800069a6:	ffffb097          	auipc	ra,0xffffb
    800069aa:	984080e7          	jalr	-1660(ra) # 8000132a <acquire>
  r = lk->locked && (lk->pid == myproc()->pid);
    800069ae:	fc843783          	ld	a5,-56(s0)
    800069b2:	439c                	lw	a5,0(a5)
    800069b4:	cf99                	beqz	a5,800069d2 <holdingsleep+0x42>
    800069b6:	fc843783          	ld	a5,-56(s0)
    800069ba:	5784                	lw	s1,40(a5)
    800069bc:	ffffc097          	auipc	ra,0xffffc
    800069c0:	1a6080e7          	jalr	422(ra) # 80002b62 <myproc>
    800069c4:	87aa                	mv	a5,a0
    800069c6:	5b9c                	lw	a5,48(a5)
    800069c8:	8726                	mv	a4,s1
    800069ca:	00f71463          	bne	a4,a5,800069d2 <holdingsleep+0x42>
    800069ce:	4785                	li	a5,1
    800069d0:	a011                	j	800069d4 <holdingsleep+0x44>
    800069d2:	4781                	li	a5,0
    800069d4:	fcf42e23          	sw	a5,-36(s0)
  release(&lk->lk);
    800069d8:	fc843783          	ld	a5,-56(s0)
    800069dc:	07a1                	addi	a5,a5,8
    800069de:	853e                	mv	a0,a5
    800069e0:	ffffb097          	auipc	ra,0xffffb
    800069e4:	9ae080e7          	jalr	-1618(ra) # 8000138e <release>
  return r;
    800069e8:	fdc42783          	lw	a5,-36(s0)
}
    800069ec:	853e                	mv	a0,a5
    800069ee:	70e2                	ld	ra,56(sp)
    800069f0:	7442                	ld	s0,48(sp)
    800069f2:	74a2                	ld	s1,40(sp)
    800069f4:	6121                	addi	sp,sp,64
    800069f6:	8082                	ret

00000000800069f8 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
    800069f8:	1141                	addi	sp,sp,-16
    800069fa:	e406                	sd	ra,8(sp)
    800069fc:	e022                	sd	s0,0(sp)
    800069fe:	0800                	addi	s0,sp,16
  initlock(&ftable.lock, "ftable");
    80006a00:	00006597          	auipc	a1,0x6
    80006a04:	bb858593          	addi	a1,a1,-1096 # 8000c5b8 <etext+0x5b8>
    80006a08:	0002e517          	auipc	a0,0x2e
    80006a0c:	2c850513          	addi	a0,a0,712 # 80034cd0 <ftable>
    80006a10:	ffffb097          	auipc	ra,0xffffb
    80006a14:	8ea080e7          	jalr	-1814(ra) # 800012fa <initlock>
}
    80006a18:	0001                	nop
    80006a1a:	60a2                	ld	ra,8(sp)
    80006a1c:	6402                	ld	s0,0(sp)
    80006a1e:	0141                	addi	sp,sp,16
    80006a20:	8082                	ret

0000000080006a22 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
    80006a22:	1101                	addi	sp,sp,-32
    80006a24:	ec06                	sd	ra,24(sp)
    80006a26:	e822                	sd	s0,16(sp)
    80006a28:	1000                	addi	s0,sp,32
  struct file *f;

  acquire(&ftable.lock);
    80006a2a:	0002e517          	auipc	a0,0x2e
    80006a2e:	2a650513          	addi	a0,a0,678 # 80034cd0 <ftable>
    80006a32:	ffffb097          	auipc	ra,0xffffb
    80006a36:	8f8080e7          	jalr	-1800(ra) # 8000132a <acquire>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006a3a:	0002e797          	auipc	a5,0x2e
    80006a3e:	2ae78793          	addi	a5,a5,686 # 80034ce8 <ftable+0x18>
    80006a42:	fef43423          	sd	a5,-24(s0)
    80006a46:	a815                	j	80006a7a <filealloc+0x58>
    if(f->ref == 0){
    80006a48:	fe843783          	ld	a5,-24(s0)
    80006a4c:	43dc                	lw	a5,4(a5)
    80006a4e:	e385                	bnez	a5,80006a6e <filealloc+0x4c>
      f->ref = 1;
    80006a50:	fe843783          	ld	a5,-24(s0)
    80006a54:	4705                	li	a4,1
    80006a56:	c3d8                	sw	a4,4(a5)
      release(&ftable.lock);
    80006a58:	0002e517          	auipc	a0,0x2e
    80006a5c:	27850513          	addi	a0,a0,632 # 80034cd0 <ftable>
    80006a60:	ffffb097          	auipc	ra,0xffffb
    80006a64:	92e080e7          	jalr	-1746(ra) # 8000138e <release>
      return f;
    80006a68:	fe843783          	ld	a5,-24(s0)
    80006a6c:	a805                	j	80006a9c <filealloc+0x7a>
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    80006a6e:	fe843783          	ld	a5,-24(s0)
    80006a72:	02878793          	addi	a5,a5,40
    80006a76:	fef43423          	sd	a5,-24(s0)
    80006a7a:	0002f797          	auipc	a5,0x2f
    80006a7e:	20e78793          	addi	a5,a5,526 # 80035c88 <disk>
    80006a82:	fe843703          	ld	a4,-24(s0)
    80006a86:	fcf761e3          	bltu	a4,a5,80006a48 <filealloc+0x26>
    }
  }
  release(&ftable.lock);
    80006a8a:	0002e517          	auipc	a0,0x2e
    80006a8e:	24650513          	addi	a0,a0,582 # 80034cd0 <ftable>
    80006a92:	ffffb097          	auipc	ra,0xffffb
    80006a96:	8fc080e7          	jalr	-1796(ra) # 8000138e <release>
  return 0;
    80006a9a:	4781                	li	a5,0
}
    80006a9c:	853e                	mv	a0,a5
    80006a9e:	60e2                	ld	ra,24(sp)
    80006aa0:	6442                	ld	s0,16(sp)
    80006aa2:	6105                	addi	sp,sp,32
    80006aa4:	8082                	ret

0000000080006aa6 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
    80006aa6:	1101                	addi	sp,sp,-32
    80006aa8:	ec06                	sd	ra,24(sp)
    80006aaa:	e822                	sd	s0,16(sp)
    80006aac:	1000                	addi	s0,sp,32
    80006aae:	fea43423          	sd	a0,-24(s0)
  acquire(&ftable.lock);
    80006ab2:	0002e517          	auipc	a0,0x2e
    80006ab6:	21e50513          	addi	a0,a0,542 # 80034cd0 <ftable>
    80006aba:	ffffb097          	auipc	ra,0xffffb
    80006abe:	870080e7          	jalr	-1936(ra) # 8000132a <acquire>
  if(f->ref < 1)
    80006ac2:	fe843783          	ld	a5,-24(s0)
    80006ac6:	43dc                	lw	a5,4(a5)
    80006ac8:	00f04a63          	bgtz	a5,80006adc <filedup+0x36>
    panic("filedup");
    80006acc:	00006517          	auipc	a0,0x6
    80006ad0:	af450513          	addi	a0,a0,-1292 # 8000c5c0 <etext+0x5c0>
    80006ad4:	ffffa097          	auipc	ra,0xffffa
    80006ad8:	1b8080e7          	jalr	440(ra) # 80000c8c <panic>
  f->ref++;
    80006adc:	fe843783          	ld	a5,-24(s0)
    80006ae0:	43dc                	lw	a5,4(a5)
    80006ae2:	2785                	addiw	a5,a5,1
    80006ae4:	0007871b          	sext.w	a4,a5
    80006ae8:	fe843783          	ld	a5,-24(s0)
    80006aec:	c3d8                	sw	a4,4(a5)
  release(&ftable.lock);
    80006aee:	0002e517          	auipc	a0,0x2e
    80006af2:	1e250513          	addi	a0,a0,482 # 80034cd0 <ftable>
    80006af6:	ffffb097          	auipc	ra,0xffffb
    80006afa:	898080e7          	jalr	-1896(ra) # 8000138e <release>
  return f;
    80006afe:	fe843783          	ld	a5,-24(s0)
}
    80006b02:	853e                	mv	a0,a5
    80006b04:	60e2                	ld	ra,24(sp)
    80006b06:	6442                	ld	s0,16(sp)
    80006b08:	6105                	addi	sp,sp,32
    80006b0a:	8082                	ret

0000000080006b0c <fileclose>:

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
    80006b0c:	715d                	addi	sp,sp,-80
    80006b0e:	e486                	sd	ra,72(sp)
    80006b10:	e0a2                	sd	s0,64(sp)
    80006b12:	0880                	addi	s0,sp,80
    80006b14:	faa43c23          	sd	a0,-72(s0)
  struct file ff;

  acquire(&ftable.lock);
    80006b18:	0002e517          	auipc	a0,0x2e
    80006b1c:	1b850513          	addi	a0,a0,440 # 80034cd0 <ftable>
    80006b20:	ffffb097          	auipc	ra,0xffffb
    80006b24:	80a080e7          	jalr	-2038(ra) # 8000132a <acquire>
  if(f->ref < 1)
    80006b28:	fb843783          	ld	a5,-72(s0)
    80006b2c:	43dc                	lw	a5,4(a5)
    80006b2e:	00f04a63          	bgtz	a5,80006b42 <fileclose+0x36>
    panic("fileclose");
    80006b32:	00006517          	auipc	a0,0x6
    80006b36:	a9650513          	addi	a0,a0,-1386 # 8000c5c8 <etext+0x5c8>
    80006b3a:	ffffa097          	auipc	ra,0xffffa
    80006b3e:	152080e7          	jalr	338(ra) # 80000c8c <panic>
  if(--f->ref > 0){
    80006b42:	fb843783          	ld	a5,-72(s0)
    80006b46:	43dc                	lw	a5,4(a5)
    80006b48:	37fd                	addiw	a5,a5,-1
    80006b4a:	0007871b          	sext.w	a4,a5
    80006b4e:	fb843783          	ld	a5,-72(s0)
    80006b52:	c3d8                	sw	a4,4(a5)
    80006b54:	fb843783          	ld	a5,-72(s0)
    80006b58:	43dc                	lw	a5,4(a5)
    80006b5a:	00f05b63          	blez	a5,80006b70 <fileclose+0x64>
    release(&ftable.lock);
    80006b5e:	0002e517          	auipc	a0,0x2e
    80006b62:	17250513          	addi	a0,a0,370 # 80034cd0 <ftable>
    80006b66:	ffffb097          	auipc	ra,0xffffb
    80006b6a:	828080e7          	jalr	-2008(ra) # 8000138e <release>
    80006b6e:	a879                	j	80006c0c <fileclose+0x100>
    return;
  }
  ff = *f;
    80006b70:	fb843783          	ld	a5,-72(s0)
    80006b74:	638c                	ld	a1,0(a5)
    80006b76:	6790                	ld	a2,8(a5)
    80006b78:	6b94                	ld	a3,16(a5)
    80006b7a:	6f98                	ld	a4,24(a5)
    80006b7c:	739c                	ld	a5,32(a5)
    80006b7e:	fcb43423          	sd	a1,-56(s0)
    80006b82:	fcc43823          	sd	a2,-48(s0)
    80006b86:	fcd43c23          	sd	a3,-40(s0)
    80006b8a:	fee43023          	sd	a4,-32(s0)
    80006b8e:	fef43423          	sd	a5,-24(s0)
  f->ref = 0;
    80006b92:	fb843783          	ld	a5,-72(s0)
    80006b96:	0007a223          	sw	zero,4(a5)
  f->type = FD_NONE;
    80006b9a:	fb843783          	ld	a5,-72(s0)
    80006b9e:	0007a023          	sw	zero,0(a5)
  release(&ftable.lock);
    80006ba2:	0002e517          	auipc	a0,0x2e
    80006ba6:	12e50513          	addi	a0,a0,302 # 80034cd0 <ftable>
    80006baa:	ffffa097          	auipc	ra,0xffffa
    80006bae:	7e4080e7          	jalr	2020(ra) # 8000138e <release>

  if(ff.type == FD_PIPE){
    80006bb2:	fc842783          	lw	a5,-56(s0)
    80006bb6:	873e                	mv	a4,a5
    80006bb8:	4785                	li	a5,1
    80006bba:	00f71e63          	bne	a4,a5,80006bd6 <fileclose+0xca>
    pipeclose(ff.pipe, ff.writable);
    80006bbe:	fd843783          	ld	a5,-40(s0)
    80006bc2:	fd144703          	lbu	a4,-47(s0)
    80006bc6:	2701                	sext.w	a4,a4
    80006bc8:	85ba                	mv	a1,a4
    80006bca:	853e                	mv	a0,a5
    80006bcc:	00000097          	auipc	ra,0x0
    80006bd0:	5aa080e7          	jalr	1450(ra) # 80007176 <pipeclose>
    80006bd4:	a825                	j	80006c0c <fileclose+0x100>
  } else if(ff.type == FD_INODE || ff.type == FD_DEVICE){
    80006bd6:	fc842783          	lw	a5,-56(s0)
    80006bda:	873e                	mv	a4,a5
    80006bdc:	4789                	li	a5,2
    80006bde:	00f70863          	beq	a4,a5,80006bee <fileclose+0xe2>
    80006be2:	fc842783          	lw	a5,-56(s0)
    80006be6:	873e                	mv	a4,a5
    80006be8:	478d                	li	a5,3
    80006bea:	02f71163          	bne	a4,a5,80006c0c <fileclose+0x100>
    begin_op();
    80006bee:	00000097          	auipc	ra,0x0
    80006bf2:	884080e7          	jalr	-1916(ra) # 80006472 <begin_op>
    iput(ff.ip);
    80006bf6:	fe043783          	ld	a5,-32(s0)
    80006bfa:	853e                	mv	a0,a5
    80006bfc:	fffff097          	auipc	ra,0xfffff
    80006c00:	97a080e7          	jalr	-1670(ra) # 80005576 <iput>
    end_op();
    80006c04:	00000097          	auipc	ra,0x0
    80006c08:	930080e7          	jalr	-1744(ra) # 80006534 <end_op>
  }
}
    80006c0c:	60a6                	ld	ra,72(sp)
    80006c0e:	6406                	ld	s0,64(sp)
    80006c10:	6161                	addi	sp,sp,80
    80006c12:	8082                	ret

0000000080006c14 <filestat>:

// Get metadata about file f.
// addr is a user virtual address, pointing to a struct stat.
int
filestat(struct file *f, uint64 addr)
{
    80006c14:	7139                	addi	sp,sp,-64
    80006c16:	fc06                	sd	ra,56(sp)
    80006c18:	f822                	sd	s0,48(sp)
    80006c1a:	0080                	addi	s0,sp,64
    80006c1c:	fca43423          	sd	a0,-56(s0)
    80006c20:	fcb43023          	sd	a1,-64(s0)
  struct proc *p = myproc();
    80006c24:	ffffc097          	auipc	ra,0xffffc
    80006c28:	f3e080e7          	jalr	-194(ra) # 80002b62 <myproc>
    80006c2c:	fea43423          	sd	a0,-24(s0)
  struct stat st;
  
  if(f->type == FD_INODE || f->type == FD_DEVICE){
    80006c30:	fc843783          	ld	a5,-56(s0)
    80006c34:	439c                	lw	a5,0(a5)
    80006c36:	873e                	mv	a4,a5
    80006c38:	4789                	li	a5,2
    80006c3a:	00f70963          	beq	a4,a5,80006c4c <filestat+0x38>
    80006c3e:	fc843783          	ld	a5,-56(s0)
    80006c42:	439c                	lw	a5,0(a5)
    80006c44:	873e                	mv	a4,a5
    80006c46:	478d                	li	a5,3
    80006c48:	06f71263          	bne	a4,a5,80006cac <filestat+0x98>
    ilock(f->ip);
    80006c4c:	fc843783          	ld	a5,-56(s0)
    80006c50:	6f9c                	ld	a5,24(a5)
    80006c52:	853e                	mv	a0,a5
    80006c54:	ffffe097          	auipc	ra,0xffffe
    80006c58:	794080e7          	jalr	1940(ra) # 800053e8 <ilock>
    stati(f->ip, &st);
    80006c5c:	fc843783          	ld	a5,-56(s0)
    80006c60:	6f9c                	ld	a5,24(a5)
    80006c62:	fd040713          	addi	a4,s0,-48
    80006c66:	85ba                	mv	a1,a4
    80006c68:	853e                	mv	a0,a5
    80006c6a:	fffff097          	auipc	ra,0xfffff
    80006c6e:	cd0080e7          	jalr	-816(ra) # 8000593a <stati>
    iunlock(f->ip);
    80006c72:	fc843783          	ld	a5,-56(s0)
    80006c76:	6f9c                	ld	a5,24(a5)
    80006c78:	853e                	mv	a0,a5
    80006c7a:	fffff097          	auipc	ra,0xfffff
    80006c7e:	8a2080e7          	jalr	-1886(ra) # 8000551c <iunlock>
    if(copyout(p->pagetable, addr, (char *)&st, sizeof(st)) < 0)
    80006c82:	fe843783          	ld	a5,-24(s0)
    80006c86:	6bbc                	ld	a5,80(a5)
    80006c88:	fd040713          	addi	a4,s0,-48
    80006c8c:	46e1                	li	a3,24
    80006c8e:	863a                	mv	a2,a4
    80006c90:	fc043583          	ld	a1,-64(s0)
    80006c94:	853e                	mv	a0,a5
    80006c96:	ffffc097          	auipc	ra,0xffffc
    80006c9a:	996080e7          	jalr	-1642(ra) # 8000262c <copyout>
    80006c9e:	87aa                	mv	a5,a0
    80006ca0:	0007d463          	bgez	a5,80006ca8 <filestat+0x94>
      return -1;
    80006ca4:	57fd                	li	a5,-1
    80006ca6:	a021                	j	80006cae <filestat+0x9a>
    return 0;
    80006ca8:	4781                	li	a5,0
    80006caa:	a011                	j	80006cae <filestat+0x9a>
  }
  return -1;
    80006cac:	57fd                	li	a5,-1
}
    80006cae:	853e                	mv	a0,a5
    80006cb0:	70e2                	ld	ra,56(sp)
    80006cb2:	7442                	ld	s0,48(sp)
    80006cb4:	6121                	addi	sp,sp,64
    80006cb6:	8082                	ret

0000000080006cb8 <fileread>:

// Read from file f.
// addr is a user virtual address.
int
fileread(struct file *f, uint64 addr, int n)
{
    80006cb8:	7139                	addi	sp,sp,-64
    80006cba:	fc06                	sd	ra,56(sp)
    80006cbc:	f822                	sd	s0,48(sp)
    80006cbe:	0080                	addi	s0,sp,64
    80006cc0:	fca43c23          	sd	a0,-40(s0)
    80006cc4:	fcb43823          	sd	a1,-48(s0)
    80006cc8:	87b2                	mv	a5,a2
    80006cca:	fcf42623          	sw	a5,-52(s0)
  int r = 0;
    80006cce:	fe042623          	sw	zero,-20(s0)

  if(f->readable == 0)
    80006cd2:	fd843783          	ld	a5,-40(s0)
    80006cd6:	0087c783          	lbu	a5,8(a5)
    80006cda:	e399                	bnez	a5,80006ce0 <fileread+0x28>
    return -1;
    80006cdc:	57fd                	li	a5,-1
    80006cde:	aa1d                	j	80006e14 <fileread+0x15c>

  if(f->type == FD_PIPE){
    80006ce0:	fd843783          	ld	a5,-40(s0)
    80006ce4:	439c                	lw	a5,0(a5)
    80006ce6:	873e                	mv	a4,a5
    80006ce8:	4785                	li	a5,1
    80006cea:	02f71363          	bne	a4,a5,80006d10 <fileread+0x58>
    r = piperead(f->pipe, addr, n);
    80006cee:	fd843783          	ld	a5,-40(s0)
    80006cf2:	6b9c                	ld	a5,16(a5)
    80006cf4:	fcc42703          	lw	a4,-52(s0)
    80006cf8:	863a                	mv	a2,a4
    80006cfa:	fd043583          	ld	a1,-48(s0)
    80006cfe:	853e                	mv	a0,a5
    80006d00:	00000097          	auipc	ra,0x0
    80006d04:	670080e7          	jalr	1648(ra) # 80007370 <piperead>
    80006d08:	87aa                	mv	a5,a0
    80006d0a:	fef42623          	sw	a5,-20(s0)
    80006d0e:	a209                	j	80006e10 <fileread+0x158>
  } else if(f->type == FD_DEVICE){
    80006d10:	fd843783          	ld	a5,-40(s0)
    80006d14:	439c                	lw	a5,0(a5)
    80006d16:	873e                	mv	a4,a5
    80006d18:	478d                	li	a5,3
    80006d1a:	06f71863          	bne	a4,a5,80006d8a <fileread+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].read)
    80006d1e:	fd843783          	ld	a5,-40(s0)
    80006d22:	02479783          	lh	a5,36(a5)
    80006d26:	2781                	sext.w	a5,a5
    80006d28:	0207c863          	bltz	a5,80006d58 <fileread+0xa0>
    80006d2c:	fd843783          	ld	a5,-40(s0)
    80006d30:	02479783          	lh	a5,36(a5)
    80006d34:	0007871b          	sext.w	a4,a5
    80006d38:	47a5                	li	a5,9
    80006d3a:	00e7cf63          	blt	a5,a4,80006d58 <fileread+0xa0>
    80006d3e:	fd843783          	ld	a5,-40(s0)
    80006d42:	02479783          	lh	a5,36(a5)
    80006d46:	2781                	sext.w	a5,a5
    80006d48:	0002e717          	auipc	a4,0x2e
    80006d4c:	ee870713          	addi	a4,a4,-280 # 80034c30 <devsw>
    80006d50:	0792                	slli	a5,a5,0x4
    80006d52:	97ba                	add	a5,a5,a4
    80006d54:	639c                	ld	a5,0(a5)
    80006d56:	e399                	bnez	a5,80006d5c <fileread+0xa4>
      return -1;
    80006d58:	57fd                	li	a5,-1
    80006d5a:	a86d                	j	80006e14 <fileread+0x15c>
    r = devsw[f->major].read(1, addr, n);
    80006d5c:	fd843783          	ld	a5,-40(s0)
    80006d60:	02479783          	lh	a5,36(a5)
    80006d64:	2781                	sext.w	a5,a5
    80006d66:	0002e717          	auipc	a4,0x2e
    80006d6a:	eca70713          	addi	a4,a4,-310 # 80034c30 <devsw>
    80006d6e:	0792                	slli	a5,a5,0x4
    80006d70:	97ba                	add	a5,a5,a4
    80006d72:	6398                	ld	a4,0(a5)
    80006d74:	fcc42783          	lw	a5,-52(s0)
    80006d78:	863e                	mv	a2,a5
    80006d7a:	fd043583          	ld	a1,-48(s0)
    80006d7e:	4505                	li	a0,1
    80006d80:	9702                	jalr	a4
    80006d82:	87aa                	mv	a5,a0
    80006d84:	fef42623          	sw	a5,-20(s0)
    80006d88:	a061                	j	80006e10 <fileread+0x158>
  } else if(f->type == FD_INODE){
    80006d8a:	fd843783          	ld	a5,-40(s0)
    80006d8e:	439c                	lw	a5,0(a5)
    80006d90:	873e                	mv	a4,a5
    80006d92:	4789                	li	a5,2
    80006d94:	06f71663          	bne	a4,a5,80006e00 <fileread+0x148>
    ilock(f->ip);
    80006d98:	fd843783          	ld	a5,-40(s0)
    80006d9c:	6f9c                	ld	a5,24(a5)
    80006d9e:	853e                	mv	a0,a5
    80006da0:	ffffe097          	auipc	ra,0xffffe
    80006da4:	648080e7          	jalr	1608(ra) # 800053e8 <ilock>
    if((r = readi(f->ip, 1, addr, f->off, n)) > 0)
    80006da8:	fd843783          	ld	a5,-40(s0)
    80006dac:	6f88                	ld	a0,24(a5)
    80006dae:	fd843783          	ld	a5,-40(s0)
    80006db2:	539c                	lw	a5,32(a5)
    80006db4:	fcc42703          	lw	a4,-52(s0)
    80006db8:	86be                	mv	a3,a5
    80006dba:	fd043603          	ld	a2,-48(s0)
    80006dbe:	4585                	li	a1,1
    80006dc0:	fffff097          	auipc	ra,0xfffff
    80006dc4:	bde080e7          	jalr	-1058(ra) # 8000599e <readi>
    80006dc8:	87aa                	mv	a5,a0
    80006dca:	fef42623          	sw	a5,-20(s0)
    80006dce:	fec42783          	lw	a5,-20(s0)
    80006dd2:	2781                	sext.w	a5,a5
    80006dd4:	00f05d63          	blez	a5,80006dee <fileread+0x136>
      f->off += r;
    80006dd8:	fd843783          	ld	a5,-40(s0)
    80006ddc:	5398                	lw	a4,32(a5)
    80006dde:	fec42783          	lw	a5,-20(s0)
    80006de2:	9fb9                	addw	a5,a5,a4
    80006de4:	0007871b          	sext.w	a4,a5
    80006de8:	fd843783          	ld	a5,-40(s0)
    80006dec:	d398                	sw	a4,32(a5)
    iunlock(f->ip);
    80006dee:	fd843783          	ld	a5,-40(s0)
    80006df2:	6f9c                	ld	a5,24(a5)
    80006df4:	853e                	mv	a0,a5
    80006df6:	ffffe097          	auipc	ra,0xffffe
    80006dfa:	726080e7          	jalr	1830(ra) # 8000551c <iunlock>
    80006dfe:	a809                	j	80006e10 <fileread+0x158>
  } else {
    panic("fileread");
    80006e00:	00005517          	auipc	a0,0x5
    80006e04:	7d850513          	addi	a0,a0,2008 # 8000c5d8 <etext+0x5d8>
    80006e08:	ffffa097          	auipc	ra,0xffffa
    80006e0c:	e84080e7          	jalr	-380(ra) # 80000c8c <panic>
  }

  return r;
    80006e10:	fec42783          	lw	a5,-20(s0)
}
    80006e14:	853e                	mv	a0,a5
    80006e16:	70e2                	ld	ra,56(sp)
    80006e18:	7442                	ld	s0,48(sp)
    80006e1a:	6121                	addi	sp,sp,64
    80006e1c:	8082                	ret

0000000080006e1e <filewrite>:

// Write to file f.
// addr is a user virtual address.
int
filewrite(struct file *f, uint64 addr, int n)
{
    80006e1e:	715d                	addi	sp,sp,-80
    80006e20:	e486                	sd	ra,72(sp)
    80006e22:	e0a2                	sd	s0,64(sp)
    80006e24:	0880                	addi	s0,sp,80
    80006e26:	fca43423          	sd	a0,-56(s0)
    80006e2a:	fcb43023          	sd	a1,-64(s0)
    80006e2e:	87b2                	mv	a5,a2
    80006e30:	faf42e23          	sw	a5,-68(s0)
  int r, ret = 0;
    80006e34:	fe042623          	sw	zero,-20(s0)

  if(f->writable == 0)
    80006e38:	fc843783          	ld	a5,-56(s0)
    80006e3c:	0097c783          	lbu	a5,9(a5)
    80006e40:	e399                	bnez	a5,80006e46 <filewrite+0x28>
    return -1;
    80006e42:	57fd                	li	a5,-1
    80006e44:	aad1                	j	80007018 <filewrite+0x1fa>

  if(f->type == FD_PIPE){
    80006e46:	fc843783          	ld	a5,-56(s0)
    80006e4a:	439c                	lw	a5,0(a5)
    80006e4c:	873e                	mv	a4,a5
    80006e4e:	4785                	li	a5,1
    80006e50:	02f71363          	bne	a4,a5,80006e76 <filewrite+0x58>
    ret = pipewrite(f->pipe, addr, n);
    80006e54:	fc843783          	ld	a5,-56(s0)
    80006e58:	6b9c                	ld	a5,16(a5)
    80006e5a:	fbc42703          	lw	a4,-68(s0)
    80006e5e:	863a                	mv	a2,a4
    80006e60:	fc043583          	ld	a1,-64(s0)
    80006e64:	853e                	mv	a0,a5
    80006e66:	00000097          	auipc	ra,0x0
    80006e6a:	3b8080e7          	jalr	952(ra) # 8000721e <pipewrite>
    80006e6e:	87aa                	mv	a5,a0
    80006e70:	fef42623          	sw	a5,-20(s0)
    80006e74:	a245                	j	80007014 <filewrite+0x1f6>
  } else if(f->type == FD_DEVICE){
    80006e76:	fc843783          	ld	a5,-56(s0)
    80006e7a:	439c                	lw	a5,0(a5)
    80006e7c:	873e                	mv	a4,a5
    80006e7e:	478d                	li	a5,3
    80006e80:	06f71863          	bne	a4,a5,80006ef0 <filewrite+0xd2>
    if(f->major < 0 || f->major >= NDEV || !devsw[f->major].write)
    80006e84:	fc843783          	ld	a5,-56(s0)
    80006e88:	02479783          	lh	a5,36(a5)
    80006e8c:	2781                	sext.w	a5,a5
    80006e8e:	0207c863          	bltz	a5,80006ebe <filewrite+0xa0>
    80006e92:	fc843783          	ld	a5,-56(s0)
    80006e96:	02479783          	lh	a5,36(a5)
    80006e9a:	0007871b          	sext.w	a4,a5
    80006e9e:	47a5                	li	a5,9
    80006ea0:	00e7cf63          	blt	a5,a4,80006ebe <filewrite+0xa0>
    80006ea4:	fc843783          	ld	a5,-56(s0)
    80006ea8:	02479783          	lh	a5,36(a5)
    80006eac:	2781                	sext.w	a5,a5
    80006eae:	0002e717          	auipc	a4,0x2e
    80006eb2:	d8270713          	addi	a4,a4,-638 # 80034c30 <devsw>
    80006eb6:	0792                	slli	a5,a5,0x4
    80006eb8:	97ba                	add	a5,a5,a4
    80006eba:	679c                	ld	a5,8(a5)
    80006ebc:	e399                	bnez	a5,80006ec2 <filewrite+0xa4>
      return -1;
    80006ebe:	57fd                	li	a5,-1
    80006ec0:	aaa1                	j	80007018 <filewrite+0x1fa>
    ret = devsw[f->major].write(1, addr, n);
    80006ec2:	fc843783          	ld	a5,-56(s0)
    80006ec6:	02479783          	lh	a5,36(a5)
    80006eca:	2781                	sext.w	a5,a5
    80006ecc:	0002e717          	auipc	a4,0x2e
    80006ed0:	d6470713          	addi	a4,a4,-668 # 80034c30 <devsw>
    80006ed4:	0792                	slli	a5,a5,0x4
    80006ed6:	97ba                	add	a5,a5,a4
    80006ed8:	6798                	ld	a4,8(a5)
    80006eda:	fbc42783          	lw	a5,-68(s0)
    80006ede:	863e                	mv	a2,a5
    80006ee0:	fc043583          	ld	a1,-64(s0)
    80006ee4:	4505                	li	a0,1
    80006ee6:	9702                	jalr	a4
    80006ee8:	87aa                	mv	a5,a0
    80006eea:	fef42623          	sw	a5,-20(s0)
    80006eee:	a21d                	j	80007014 <filewrite+0x1f6>
  } else if(f->type == FD_INODE){
    80006ef0:	fc843783          	ld	a5,-56(s0)
    80006ef4:	439c                	lw	a5,0(a5)
    80006ef6:	873e                	mv	a4,a5
    80006ef8:	4789                	li	a5,2
    80006efa:	10f71563          	bne	a4,a5,80007004 <filewrite+0x1e6>
    // the maximum log transaction size, including
    // i-node, indirect block, allocation blocks,
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((MAXOPBLOCKS-1-1-2) / 2) * BSIZE;
    80006efe:	6785                	lui	a5,0x1
    80006f00:	c007879b          	addiw	a5,a5,-1024
    80006f04:	fef42023          	sw	a5,-32(s0)
    int i = 0;
    80006f08:	fe042423          	sw	zero,-24(s0)
    while(i < n){
    80006f0c:	a0d9                	j	80006fd2 <filewrite+0x1b4>
      int n1 = n - i;
    80006f0e:	fbc42703          	lw	a4,-68(s0)
    80006f12:	fe842783          	lw	a5,-24(s0)
    80006f16:	40f707bb          	subw	a5,a4,a5
    80006f1a:	fef42223          	sw	a5,-28(s0)
      if(n1 > max)
    80006f1e:	fe442703          	lw	a4,-28(s0)
    80006f22:	fe042783          	lw	a5,-32(s0)
    80006f26:	2701                	sext.w	a4,a4
    80006f28:	2781                	sext.w	a5,a5
    80006f2a:	00e7d663          	bge	a5,a4,80006f36 <filewrite+0x118>
        n1 = max;
    80006f2e:	fe042783          	lw	a5,-32(s0)
    80006f32:	fef42223          	sw	a5,-28(s0)

      begin_op();
    80006f36:	fffff097          	auipc	ra,0xfffff
    80006f3a:	53c080e7          	jalr	1340(ra) # 80006472 <begin_op>
      ilock(f->ip);
    80006f3e:	fc843783          	ld	a5,-56(s0)
    80006f42:	6f9c                	ld	a5,24(a5)
    80006f44:	853e                	mv	a0,a5
    80006f46:	ffffe097          	auipc	ra,0xffffe
    80006f4a:	4a2080e7          	jalr	1186(ra) # 800053e8 <ilock>
      if ((r = writei(f->ip, 1, addr + i, f->off, n1)) > 0)
    80006f4e:	fc843783          	ld	a5,-56(s0)
    80006f52:	6f88                	ld	a0,24(a5)
    80006f54:	fe842703          	lw	a4,-24(s0)
    80006f58:	fc043783          	ld	a5,-64(s0)
    80006f5c:	00f70633          	add	a2,a4,a5
    80006f60:	fc843783          	ld	a5,-56(s0)
    80006f64:	539c                	lw	a5,32(a5)
    80006f66:	fe442703          	lw	a4,-28(s0)
    80006f6a:	86be                	mv	a3,a5
    80006f6c:	4585                	li	a1,1
    80006f6e:	fffff097          	auipc	ra,0xfffff
    80006f72:	bc8080e7          	jalr	-1080(ra) # 80005b36 <writei>
    80006f76:	87aa                	mv	a5,a0
    80006f78:	fcf42e23          	sw	a5,-36(s0)
    80006f7c:	fdc42783          	lw	a5,-36(s0)
    80006f80:	2781                	sext.w	a5,a5
    80006f82:	00f05d63          	blez	a5,80006f9c <filewrite+0x17e>
        f->off += r;
    80006f86:	fc843783          	ld	a5,-56(s0)
    80006f8a:	5398                	lw	a4,32(a5)
    80006f8c:	fdc42783          	lw	a5,-36(s0)
    80006f90:	9fb9                	addw	a5,a5,a4
    80006f92:	0007871b          	sext.w	a4,a5
    80006f96:	fc843783          	ld	a5,-56(s0)
    80006f9a:	d398                	sw	a4,32(a5)
      iunlock(f->ip);
    80006f9c:	fc843783          	ld	a5,-56(s0)
    80006fa0:	6f9c                	ld	a5,24(a5)
    80006fa2:	853e                	mv	a0,a5
    80006fa4:	ffffe097          	auipc	ra,0xffffe
    80006fa8:	578080e7          	jalr	1400(ra) # 8000551c <iunlock>
      end_op();
    80006fac:	fffff097          	auipc	ra,0xfffff
    80006fb0:	588080e7          	jalr	1416(ra) # 80006534 <end_op>

      if(r != n1){
    80006fb4:	fdc42703          	lw	a4,-36(s0)
    80006fb8:	fe442783          	lw	a5,-28(s0)
    80006fbc:	2701                	sext.w	a4,a4
    80006fbe:	2781                	sext.w	a5,a5
    80006fc0:	02f71263          	bne	a4,a5,80006fe4 <filewrite+0x1c6>
        // error from writei
        break;
      }
      i += r;
    80006fc4:	fe842703          	lw	a4,-24(s0)
    80006fc8:	fdc42783          	lw	a5,-36(s0)
    80006fcc:	9fb9                	addw	a5,a5,a4
    80006fce:	fef42423          	sw	a5,-24(s0)
    while(i < n){
    80006fd2:	fe842703          	lw	a4,-24(s0)
    80006fd6:	fbc42783          	lw	a5,-68(s0)
    80006fda:	2701                	sext.w	a4,a4
    80006fdc:	2781                	sext.w	a5,a5
    80006fde:	f2f748e3          	blt	a4,a5,80006f0e <filewrite+0xf0>
    80006fe2:	a011                	j	80006fe6 <filewrite+0x1c8>
        break;
    80006fe4:	0001                	nop
    }
    ret = (i == n ? n : -1);
    80006fe6:	fe842703          	lw	a4,-24(s0)
    80006fea:	fbc42783          	lw	a5,-68(s0)
    80006fee:	2701                	sext.w	a4,a4
    80006ff0:	2781                	sext.w	a5,a5
    80006ff2:	00f71563          	bne	a4,a5,80006ffc <filewrite+0x1de>
    80006ff6:	fbc42783          	lw	a5,-68(s0)
    80006ffa:	a011                	j	80006ffe <filewrite+0x1e0>
    80006ffc:	57fd                	li	a5,-1
    80006ffe:	fef42623          	sw	a5,-20(s0)
    80007002:	a809                	j	80007014 <filewrite+0x1f6>
  } else {
    panic("filewrite");
    80007004:	00005517          	auipc	a0,0x5
    80007008:	5e450513          	addi	a0,a0,1508 # 8000c5e8 <etext+0x5e8>
    8000700c:	ffffa097          	auipc	ra,0xffffa
    80007010:	c80080e7          	jalr	-896(ra) # 80000c8c <panic>
  }

  return ret;
    80007014:	fec42783          	lw	a5,-20(s0)
}
    80007018:	853e                	mv	a0,a5
    8000701a:	60a6                	ld	ra,72(sp)
    8000701c:	6406                	ld	s0,64(sp)
    8000701e:	6161                	addi	sp,sp,80
    80007020:	8082                	ret

0000000080007022 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
    80007022:	7179                	addi	sp,sp,-48
    80007024:	f406                	sd	ra,40(sp)
    80007026:	f022                	sd	s0,32(sp)
    80007028:	1800                	addi	s0,sp,48
    8000702a:	fca43c23          	sd	a0,-40(s0)
    8000702e:	fcb43823          	sd	a1,-48(s0)
  struct pipe *pi;

  pi = 0;
    80007032:	fe043423          	sd	zero,-24(s0)
  *f0 = *f1 = 0;
    80007036:	fd043783          	ld	a5,-48(s0)
    8000703a:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
    8000703e:	fd043783          	ld	a5,-48(s0)
    80007042:	6398                	ld	a4,0(a5)
    80007044:	fd843783          	ld	a5,-40(s0)
    80007048:	e398                	sd	a4,0(a5)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    8000704a:	00000097          	auipc	ra,0x0
    8000704e:	9d8080e7          	jalr	-1576(ra) # 80006a22 <filealloc>
    80007052:	872a                	mv	a4,a0
    80007054:	fd843783          	ld	a5,-40(s0)
    80007058:	e398                	sd	a4,0(a5)
    8000705a:	fd843783          	ld	a5,-40(s0)
    8000705e:	639c                	ld	a5,0(a5)
    80007060:	c3e9                	beqz	a5,80007122 <pipealloc+0x100>
    80007062:	00000097          	auipc	ra,0x0
    80007066:	9c0080e7          	jalr	-1600(ra) # 80006a22 <filealloc>
    8000706a:	872a                	mv	a4,a0
    8000706c:	fd043783          	ld	a5,-48(s0)
    80007070:	e398                	sd	a4,0(a5)
    80007072:	fd043783          	ld	a5,-48(s0)
    80007076:	639c                	ld	a5,0(a5)
    80007078:	c7cd                	beqz	a5,80007122 <pipealloc+0x100>
    goto bad;
  if((pi = (struct pipe*)kalloc()) == 0)
    8000707a:	ffffa097          	auipc	ra,0xffffa
    8000707e:	15c080e7          	jalr	348(ra) # 800011d6 <kalloc>
    80007082:	fea43423          	sd	a0,-24(s0)
    80007086:	fe843783          	ld	a5,-24(s0)
    8000708a:	cfd1                	beqz	a5,80007126 <pipealloc+0x104>
    goto bad;
  pi->readopen = 1;
    8000708c:	fe843783          	ld	a5,-24(s0)
    80007090:	4705                	li	a4,1
    80007092:	22e7a023          	sw	a4,544(a5)
  pi->writeopen = 1;
    80007096:	fe843783          	ld	a5,-24(s0)
    8000709a:	4705                	li	a4,1
    8000709c:	22e7a223          	sw	a4,548(a5)
  pi->nwrite = 0;
    800070a0:	fe843783          	ld	a5,-24(s0)
    800070a4:	2007ae23          	sw	zero,540(a5)
  pi->nread = 0;
    800070a8:	fe843783          	ld	a5,-24(s0)
    800070ac:	2007ac23          	sw	zero,536(a5)
  initlock(&pi->lock, "pipe");
    800070b0:	fe843783          	ld	a5,-24(s0)
    800070b4:	00005597          	auipc	a1,0x5
    800070b8:	54458593          	addi	a1,a1,1348 # 8000c5f8 <etext+0x5f8>
    800070bc:	853e                	mv	a0,a5
    800070be:	ffffa097          	auipc	ra,0xffffa
    800070c2:	23c080e7          	jalr	572(ra) # 800012fa <initlock>
  (*f0)->type = FD_PIPE;
    800070c6:	fd843783          	ld	a5,-40(s0)
    800070ca:	639c                	ld	a5,0(a5)
    800070cc:	4705                	li	a4,1
    800070ce:	c398                	sw	a4,0(a5)
  (*f0)->readable = 1;
    800070d0:	fd843783          	ld	a5,-40(s0)
    800070d4:	639c                	ld	a5,0(a5)
    800070d6:	4705                	li	a4,1
    800070d8:	00e78423          	sb	a4,8(a5)
  (*f0)->writable = 0;
    800070dc:	fd843783          	ld	a5,-40(s0)
    800070e0:	639c                	ld	a5,0(a5)
    800070e2:	000784a3          	sb	zero,9(a5)
  (*f0)->pipe = pi;
    800070e6:	fd843783          	ld	a5,-40(s0)
    800070ea:	639c                	ld	a5,0(a5)
    800070ec:	fe843703          	ld	a4,-24(s0)
    800070f0:	eb98                	sd	a4,16(a5)
  (*f1)->type = FD_PIPE;
    800070f2:	fd043783          	ld	a5,-48(s0)
    800070f6:	639c                	ld	a5,0(a5)
    800070f8:	4705                	li	a4,1
    800070fa:	c398                	sw	a4,0(a5)
  (*f1)->readable = 0;
    800070fc:	fd043783          	ld	a5,-48(s0)
    80007100:	639c                	ld	a5,0(a5)
    80007102:	00078423          	sb	zero,8(a5)
  (*f1)->writable = 1;
    80007106:	fd043783          	ld	a5,-48(s0)
    8000710a:	639c                	ld	a5,0(a5)
    8000710c:	4705                	li	a4,1
    8000710e:	00e784a3          	sb	a4,9(a5)
  (*f1)->pipe = pi;
    80007112:	fd043783          	ld	a5,-48(s0)
    80007116:	639c                	ld	a5,0(a5)
    80007118:	fe843703          	ld	a4,-24(s0)
    8000711c:	eb98                	sd	a4,16(a5)
  return 0;
    8000711e:	4781                	li	a5,0
    80007120:	a0b1                	j	8000716c <pipealloc+0x14a>
    goto bad;
    80007122:	0001                	nop
    80007124:	a011                	j	80007128 <pipealloc+0x106>
    goto bad;
    80007126:	0001                	nop

 bad:
  if(pi)
    80007128:	fe843783          	ld	a5,-24(s0)
    8000712c:	c799                	beqz	a5,8000713a <pipealloc+0x118>
    kfree((char*)pi);
    8000712e:	fe843503          	ld	a0,-24(s0)
    80007132:	ffffa097          	auipc	ra,0xffffa
    80007136:	ffe080e7          	jalr	-2(ra) # 80001130 <kfree>
  if(*f0)
    8000713a:	fd843783          	ld	a5,-40(s0)
    8000713e:	639c                	ld	a5,0(a5)
    80007140:	cb89                	beqz	a5,80007152 <pipealloc+0x130>
    fileclose(*f0);
    80007142:	fd843783          	ld	a5,-40(s0)
    80007146:	639c                	ld	a5,0(a5)
    80007148:	853e                	mv	a0,a5
    8000714a:	00000097          	auipc	ra,0x0
    8000714e:	9c2080e7          	jalr	-1598(ra) # 80006b0c <fileclose>
  if(*f1)
    80007152:	fd043783          	ld	a5,-48(s0)
    80007156:	639c                	ld	a5,0(a5)
    80007158:	cb89                	beqz	a5,8000716a <pipealloc+0x148>
    fileclose(*f1);
    8000715a:	fd043783          	ld	a5,-48(s0)
    8000715e:	639c                	ld	a5,0(a5)
    80007160:	853e                	mv	a0,a5
    80007162:	00000097          	auipc	ra,0x0
    80007166:	9aa080e7          	jalr	-1622(ra) # 80006b0c <fileclose>
  return -1;
    8000716a:	57fd                	li	a5,-1
}
    8000716c:	853e                	mv	a0,a5
    8000716e:	70a2                	ld	ra,40(sp)
    80007170:	7402                	ld	s0,32(sp)
    80007172:	6145                	addi	sp,sp,48
    80007174:	8082                	ret

0000000080007176 <pipeclose>:

void
pipeclose(struct pipe *pi, int writable)
{
    80007176:	1101                	addi	sp,sp,-32
    80007178:	ec06                	sd	ra,24(sp)
    8000717a:	e822                	sd	s0,16(sp)
    8000717c:	1000                	addi	s0,sp,32
    8000717e:	fea43423          	sd	a0,-24(s0)
    80007182:	87ae                	mv	a5,a1
    80007184:	fef42223          	sw	a5,-28(s0)
  acquire(&pi->lock);
    80007188:	fe843783          	ld	a5,-24(s0)
    8000718c:	853e                	mv	a0,a5
    8000718e:	ffffa097          	auipc	ra,0xffffa
    80007192:	19c080e7          	jalr	412(ra) # 8000132a <acquire>
  if(writable){
    80007196:	fe442783          	lw	a5,-28(s0)
    8000719a:	2781                	sext.w	a5,a5
    8000719c:	cf99                	beqz	a5,800071ba <pipeclose+0x44>
    pi->writeopen = 0;
    8000719e:	fe843783          	ld	a5,-24(s0)
    800071a2:	2207a223          	sw	zero,548(a5)
    wakeup(&pi->nread);
    800071a6:	fe843783          	ld	a5,-24(s0)
    800071aa:	21878793          	addi	a5,a5,536
    800071ae:	853e                	mv	a0,a5
    800071b0:	ffffc097          	auipc	ra,0xffffc
    800071b4:	5f0080e7          	jalr	1520(ra) # 800037a0 <wakeup>
    800071b8:	a831                	j	800071d4 <pipeclose+0x5e>
  } else {
    pi->readopen = 0;
    800071ba:	fe843783          	ld	a5,-24(s0)
    800071be:	2207a023          	sw	zero,544(a5)
    wakeup(&pi->nwrite);
    800071c2:	fe843783          	ld	a5,-24(s0)
    800071c6:	21c78793          	addi	a5,a5,540
    800071ca:	853e                	mv	a0,a5
    800071cc:	ffffc097          	auipc	ra,0xffffc
    800071d0:	5d4080e7          	jalr	1492(ra) # 800037a0 <wakeup>
  }
  if(pi->readopen == 0 && pi->writeopen == 0){
    800071d4:	fe843783          	ld	a5,-24(s0)
    800071d8:	2207a783          	lw	a5,544(a5)
    800071dc:	e785                	bnez	a5,80007204 <pipeclose+0x8e>
    800071de:	fe843783          	ld	a5,-24(s0)
    800071e2:	2247a783          	lw	a5,548(a5)
    800071e6:	ef99                	bnez	a5,80007204 <pipeclose+0x8e>
    release(&pi->lock);
    800071e8:	fe843783          	ld	a5,-24(s0)
    800071ec:	853e                	mv	a0,a5
    800071ee:	ffffa097          	auipc	ra,0xffffa
    800071f2:	1a0080e7          	jalr	416(ra) # 8000138e <release>
    kfree((char*)pi);
    800071f6:	fe843503          	ld	a0,-24(s0)
    800071fa:	ffffa097          	auipc	ra,0xffffa
    800071fe:	f36080e7          	jalr	-202(ra) # 80001130 <kfree>
    80007202:	a809                	j	80007214 <pipeclose+0x9e>
  } else
    release(&pi->lock);
    80007204:	fe843783          	ld	a5,-24(s0)
    80007208:	853e                	mv	a0,a5
    8000720a:	ffffa097          	auipc	ra,0xffffa
    8000720e:	184080e7          	jalr	388(ra) # 8000138e <release>
}
    80007212:	0001                	nop
    80007214:	0001                	nop
    80007216:	60e2                	ld	ra,24(sp)
    80007218:	6442                	ld	s0,16(sp)
    8000721a:	6105                	addi	sp,sp,32
    8000721c:	8082                	ret

000000008000721e <pipewrite>:

int
pipewrite(struct pipe *pi, uint64 addr, int n)
{
    8000721e:	715d                	addi	sp,sp,-80
    80007220:	e486                	sd	ra,72(sp)
    80007222:	e0a2                	sd	s0,64(sp)
    80007224:	0880                	addi	s0,sp,80
    80007226:	fca43423          	sd	a0,-56(s0)
    8000722a:	fcb43023          	sd	a1,-64(s0)
    8000722e:	87b2                	mv	a5,a2
    80007230:	faf42e23          	sw	a5,-68(s0)
  int i = 0;
    80007234:	fe042623          	sw	zero,-20(s0)
  struct proc *pr = myproc();
    80007238:	ffffc097          	auipc	ra,0xffffc
    8000723c:	92a080e7          	jalr	-1750(ra) # 80002b62 <myproc>
    80007240:	fea43023          	sd	a0,-32(s0)

  acquire(&pi->lock);
    80007244:	fc843783          	ld	a5,-56(s0)
    80007248:	853e                	mv	a0,a5
    8000724a:	ffffa097          	auipc	ra,0xffffa
    8000724e:	0e0080e7          	jalr	224(ra) # 8000132a <acquire>
  while(i < n){
    80007252:	a8f1                	j	8000732e <pipewrite+0x110>
    if(pi->readopen == 0 || killed(pr)){
    80007254:	fc843783          	ld	a5,-56(s0)
    80007258:	2207a783          	lw	a5,544(a5)
    8000725c:	cb89                	beqz	a5,8000726e <pipewrite+0x50>
    8000725e:	fe043503          	ld	a0,-32(s0)
    80007262:	ffffc097          	auipc	ra,0xffffc
    80007266:	6d0080e7          	jalr	1744(ra) # 80003932 <killed>
    8000726a:	87aa                	mv	a5,a0
    8000726c:	cb91                	beqz	a5,80007280 <pipewrite+0x62>
      release(&pi->lock);
    8000726e:	fc843783          	ld	a5,-56(s0)
    80007272:	853e                	mv	a0,a5
    80007274:	ffffa097          	auipc	ra,0xffffa
    80007278:	11a080e7          	jalr	282(ra) # 8000138e <release>
      return -1;
    8000727c:	57fd                	li	a5,-1
    8000727e:	a0e5                	j	80007366 <pipewrite+0x148>
    }
    if(pi->nwrite == pi->nread + PIPESIZE){ //DOC: pipewrite-full
    80007280:	fc843783          	ld	a5,-56(s0)
    80007284:	21c7a703          	lw	a4,540(a5)
    80007288:	fc843783          	ld	a5,-56(s0)
    8000728c:	2187a783          	lw	a5,536(a5)
    80007290:	2007879b          	addiw	a5,a5,512
    80007294:	2781                	sext.w	a5,a5
    80007296:	02f71863          	bne	a4,a5,800072c6 <pipewrite+0xa8>
      wakeup(&pi->nread);
    8000729a:	fc843783          	ld	a5,-56(s0)
    8000729e:	21878793          	addi	a5,a5,536
    800072a2:	853e                	mv	a0,a5
    800072a4:	ffffc097          	auipc	ra,0xffffc
    800072a8:	4fc080e7          	jalr	1276(ra) # 800037a0 <wakeup>
      sleep(&pi->nwrite, &pi->lock);
    800072ac:	fc843783          	ld	a5,-56(s0)
    800072b0:	21c78793          	addi	a5,a5,540
    800072b4:	fc843703          	ld	a4,-56(s0)
    800072b8:	85ba                	mv	a1,a4
    800072ba:	853e                	mv	a0,a5
    800072bc:	ffffc097          	auipc	ra,0xffffc
    800072c0:	468080e7          	jalr	1128(ra) # 80003724 <sleep>
    800072c4:	a0ad                	j	8000732e <pipewrite+0x110>
    } else {
      char ch;
      if(copyin(pr->pagetable, &ch, addr + i, 1) == -1)
    800072c6:	fe043783          	ld	a5,-32(s0)
    800072ca:	6ba8                	ld	a0,80(a5)
    800072cc:	fec42703          	lw	a4,-20(s0)
    800072d0:	fc043783          	ld	a5,-64(s0)
    800072d4:	973e                	add	a4,a4,a5
    800072d6:	fdf40793          	addi	a5,s0,-33
    800072da:	4685                	li	a3,1
    800072dc:	863a                	mv	a2,a4
    800072de:	85be                	mv	a1,a5
    800072e0:	ffffb097          	auipc	ra,0xffffb
    800072e4:	41a080e7          	jalr	1050(ra) # 800026fa <copyin>
    800072e8:	87aa                	mv	a5,a0
    800072ea:	873e                	mv	a4,a5
    800072ec:	57fd                	li	a5,-1
    800072ee:	04f70963          	beq	a4,a5,80007340 <pipewrite+0x122>
        break;
      pi->data[pi->nwrite++ % PIPESIZE] = ch;
    800072f2:	fc843783          	ld	a5,-56(s0)
    800072f6:	21c7a783          	lw	a5,540(a5)
    800072fa:	2781                	sext.w	a5,a5
    800072fc:	0017871b          	addiw	a4,a5,1
    80007300:	0007069b          	sext.w	a3,a4
    80007304:	fc843703          	ld	a4,-56(s0)
    80007308:	20d72e23          	sw	a3,540(a4)
    8000730c:	1ff7f793          	andi	a5,a5,511
    80007310:	2781                	sext.w	a5,a5
    80007312:	fdf44703          	lbu	a4,-33(s0)
    80007316:	fc843683          	ld	a3,-56(s0)
    8000731a:	1782                	slli	a5,a5,0x20
    8000731c:	9381                	srli	a5,a5,0x20
    8000731e:	97b6                	add	a5,a5,a3
    80007320:	00e78c23          	sb	a4,24(a5)
      i++;
    80007324:	fec42783          	lw	a5,-20(s0)
    80007328:	2785                	addiw	a5,a5,1
    8000732a:	fef42623          	sw	a5,-20(s0)
  while(i < n){
    8000732e:	fec42703          	lw	a4,-20(s0)
    80007332:	fbc42783          	lw	a5,-68(s0)
    80007336:	2701                	sext.w	a4,a4
    80007338:	2781                	sext.w	a5,a5
    8000733a:	f0f74de3          	blt	a4,a5,80007254 <pipewrite+0x36>
    8000733e:	a011                	j	80007342 <pipewrite+0x124>
        break;
    80007340:	0001                	nop
    }
  }
  wakeup(&pi->nread);
    80007342:	fc843783          	ld	a5,-56(s0)
    80007346:	21878793          	addi	a5,a5,536
    8000734a:	853e                	mv	a0,a5
    8000734c:	ffffc097          	auipc	ra,0xffffc
    80007350:	454080e7          	jalr	1108(ra) # 800037a0 <wakeup>
  release(&pi->lock);
    80007354:	fc843783          	ld	a5,-56(s0)
    80007358:	853e                	mv	a0,a5
    8000735a:	ffffa097          	auipc	ra,0xffffa
    8000735e:	034080e7          	jalr	52(ra) # 8000138e <release>

  return i;
    80007362:	fec42783          	lw	a5,-20(s0)
}
    80007366:	853e                	mv	a0,a5
    80007368:	60a6                	ld	ra,72(sp)
    8000736a:	6406                	ld	s0,64(sp)
    8000736c:	6161                	addi	sp,sp,80
    8000736e:	8082                	ret

0000000080007370 <piperead>:

int
piperead(struct pipe *pi, uint64 addr, int n)
{
    80007370:	715d                	addi	sp,sp,-80
    80007372:	e486                	sd	ra,72(sp)
    80007374:	e0a2                	sd	s0,64(sp)
    80007376:	0880                	addi	s0,sp,80
    80007378:	fca43423          	sd	a0,-56(s0)
    8000737c:	fcb43023          	sd	a1,-64(s0)
    80007380:	87b2                	mv	a5,a2
    80007382:	faf42e23          	sw	a5,-68(s0)
  int i;
  struct proc *pr = myproc();
    80007386:	ffffb097          	auipc	ra,0xffffb
    8000738a:	7dc080e7          	jalr	2012(ra) # 80002b62 <myproc>
    8000738e:	fea43023          	sd	a0,-32(s0)
  char ch;

  acquire(&pi->lock);
    80007392:	fc843783          	ld	a5,-56(s0)
    80007396:	853e                	mv	a0,a5
    80007398:	ffffa097          	auipc	ra,0xffffa
    8000739c:	f92080e7          	jalr	-110(ra) # 8000132a <acquire>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800073a0:	a835                	j	800073dc <piperead+0x6c>
    if(killed(pr)){
    800073a2:	fe043503          	ld	a0,-32(s0)
    800073a6:	ffffc097          	auipc	ra,0xffffc
    800073aa:	58c080e7          	jalr	1420(ra) # 80003932 <killed>
    800073ae:	87aa                	mv	a5,a0
    800073b0:	cb91                	beqz	a5,800073c4 <piperead+0x54>
      release(&pi->lock);
    800073b2:	fc843783          	ld	a5,-56(s0)
    800073b6:	853e                	mv	a0,a5
    800073b8:	ffffa097          	auipc	ra,0xffffa
    800073bc:	fd6080e7          	jalr	-42(ra) # 8000138e <release>
      return -1;
    800073c0:	57fd                	li	a5,-1
    800073c2:	a8dd                	j	800074b8 <piperead+0x148>
    }
    sleep(&pi->nread, &pi->lock); //DOC: piperead-sleep
    800073c4:	fc843783          	ld	a5,-56(s0)
    800073c8:	21878793          	addi	a5,a5,536
    800073cc:	fc843703          	ld	a4,-56(s0)
    800073d0:	85ba                	mv	a1,a4
    800073d2:	853e                	mv	a0,a5
    800073d4:	ffffc097          	auipc	ra,0xffffc
    800073d8:	350080e7          	jalr	848(ra) # 80003724 <sleep>
  while(pi->nread == pi->nwrite && pi->writeopen){  //DOC: pipe-empty
    800073dc:	fc843783          	ld	a5,-56(s0)
    800073e0:	2187a703          	lw	a4,536(a5)
    800073e4:	fc843783          	ld	a5,-56(s0)
    800073e8:	21c7a783          	lw	a5,540(a5)
    800073ec:	00f71763          	bne	a4,a5,800073fa <piperead+0x8a>
    800073f0:	fc843783          	ld	a5,-56(s0)
    800073f4:	2247a783          	lw	a5,548(a5)
    800073f8:	f7cd                	bnez	a5,800073a2 <piperead+0x32>
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    800073fa:	fe042623          	sw	zero,-20(s0)
    800073fe:	a8bd                	j	8000747c <piperead+0x10c>
    if(pi->nread == pi->nwrite)
    80007400:	fc843783          	ld	a5,-56(s0)
    80007404:	2187a703          	lw	a4,536(a5)
    80007408:	fc843783          	ld	a5,-56(s0)
    8000740c:	21c7a783          	lw	a5,540(a5)
    80007410:	06f70f63          	beq	a4,a5,8000748e <piperead+0x11e>
      break;
    ch = pi->data[pi->nread++ % PIPESIZE];
    80007414:	fc843783          	ld	a5,-56(s0)
    80007418:	2187a783          	lw	a5,536(a5)
    8000741c:	2781                	sext.w	a5,a5
    8000741e:	0017871b          	addiw	a4,a5,1
    80007422:	0007069b          	sext.w	a3,a4
    80007426:	fc843703          	ld	a4,-56(s0)
    8000742a:	20d72c23          	sw	a3,536(a4)
    8000742e:	1ff7f793          	andi	a5,a5,511
    80007432:	2781                	sext.w	a5,a5
    80007434:	fc843703          	ld	a4,-56(s0)
    80007438:	1782                	slli	a5,a5,0x20
    8000743a:	9381                	srli	a5,a5,0x20
    8000743c:	97ba                	add	a5,a5,a4
    8000743e:	0187c783          	lbu	a5,24(a5)
    80007442:	fcf40fa3          	sb	a5,-33(s0)
    if(copyout(pr->pagetable, addr + i, &ch, 1) == -1)
    80007446:	fe043783          	ld	a5,-32(s0)
    8000744a:	6ba8                	ld	a0,80(a5)
    8000744c:	fec42703          	lw	a4,-20(s0)
    80007450:	fc043783          	ld	a5,-64(s0)
    80007454:	97ba                	add	a5,a5,a4
    80007456:	fdf40713          	addi	a4,s0,-33
    8000745a:	4685                	li	a3,1
    8000745c:	863a                	mv	a2,a4
    8000745e:	85be                	mv	a1,a5
    80007460:	ffffb097          	auipc	ra,0xffffb
    80007464:	1cc080e7          	jalr	460(ra) # 8000262c <copyout>
    80007468:	87aa                	mv	a5,a0
    8000746a:	873e                	mv	a4,a5
    8000746c:	57fd                	li	a5,-1
    8000746e:	02f70263          	beq	a4,a5,80007492 <piperead+0x122>
  for(i = 0; i < n; i++){  //DOC: piperead-copy
    80007472:	fec42783          	lw	a5,-20(s0)
    80007476:	2785                	addiw	a5,a5,1
    80007478:	fef42623          	sw	a5,-20(s0)
    8000747c:	fec42703          	lw	a4,-20(s0)
    80007480:	fbc42783          	lw	a5,-68(s0)
    80007484:	2701                	sext.w	a4,a4
    80007486:	2781                	sext.w	a5,a5
    80007488:	f6f74ce3          	blt	a4,a5,80007400 <piperead+0x90>
    8000748c:	a021                	j	80007494 <piperead+0x124>
      break;
    8000748e:	0001                	nop
    80007490:	a011                	j	80007494 <piperead+0x124>
      break;
    80007492:	0001                	nop
  }
  wakeup(&pi->nwrite);  //DOC: piperead-wakeup
    80007494:	fc843783          	ld	a5,-56(s0)
    80007498:	21c78793          	addi	a5,a5,540
    8000749c:	853e                	mv	a0,a5
    8000749e:	ffffc097          	auipc	ra,0xffffc
    800074a2:	302080e7          	jalr	770(ra) # 800037a0 <wakeup>
  release(&pi->lock);
    800074a6:	fc843783          	ld	a5,-56(s0)
    800074aa:	853e                	mv	a0,a5
    800074ac:	ffffa097          	auipc	ra,0xffffa
    800074b0:	ee2080e7          	jalr	-286(ra) # 8000138e <release>
  return i;
    800074b4:	fec42783          	lw	a5,-20(s0)
}
    800074b8:	853e                	mv	a0,a5
    800074ba:	60a6                	ld	ra,72(sp)
    800074bc:	6406                	ld	s0,64(sp)
    800074be:	6161                	addi	sp,sp,80
    800074c0:	8082                	ret

00000000800074c2 <flags2perm>:
#include "elf.h"

static int loadseg(pde_t *, uint64, struct inode *, uint, uint);

int flags2perm(int flags)
{
    800074c2:	7179                	addi	sp,sp,-48
    800074c4:	f422                	sd	s0,40(sp)
    800074c6:	1800                	addi	s0,sp,48
    800074c8:	87aa                	mv	a5,a0
    800074ca:	fcf42e23          	sw	a5,-36(s0)
    int perm = 0;
    800074ce:	fe042623          	sw	zero,-20(s0)
    if(flags & 0x1)
    800074d2:	fdc42783          	lw	a5,-36(s0)
    800074d6:	8b85                	andi	a5,a5,1
    800074d8:	2781                	sext.w	a5,a5
    800074da:	c781                	beqz	a5,800074e2 <flags2perm+0x20>
      perm = PTE_X;
    800074dc:	47a1                	li	a5,8
    800074de:	fef42623          	sw	a5,-20(s0)
    if(flags & 0x2)
    800074e2:	fdc42783          	lw	a5,-36(s0)
    800074e6:	8b89                	andi	a5,a5,2
    800074e8:	2781                	sext.w	a5,a5
    800074ea:	c799                	beqz	a5,800074f8 <flags2perm+0x36>
      perm |= PTE_W;
    800074ec:	fec42783          	lw	a5,-20(s0)
    800074f0:	0047e793          	ori	a5,a5,4
    800074f4:	fef42623          	sw	a5,-20(s0)
    return perm;
    800074f8:	fec42783          	lw	a5,-20(s0)
}
    800074fc:	853e                	mv	a0,a5
    800074fe:	7422                	ld	s0,40(sp)
    80007500:	6145                	addi	sp,sp,48
    80007502:	8082                	ret

0000000080007504 <exec>:

int
exec(char *path, char **argv)
{
    80007504:	de010113          	addi	sp,sp,-544
    80007508:	20113c23          	sd	ra,536(sp)
    8000750c:	20813823          	sd	s0,528(sp)
    80007510:	20913423          	sd	s1,520(sp)
    80007514:	1400                	addi	s0,sp,544
    80007516:	dea43423          	sd	a0,-536(s0)
    8000751a:	deb43023          	sd	a1,-544(s0)
  char *s, *last;
  int i, off;
  uint64 argc, sz = 0, sp, ustack[MAXARG], stackbase;
    8000751e:	fa043c23          	sd	zero,-72(s0)
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pagetable_t pagetable = 0, oldpagetable;
    80007522:	fa043023          	sd	zero,-96(s0)
  struct proc *p = myproc();
    80007526:	ffffb097          	auipc	ra,0xffffb
    8000752a:	63c080e7          	jalr	1596(ra) # 80002b62 <myproc>
    8000752e:	f8a43c23          	sd	a0,-104(s0)

  begin_op();
    80007532:	fffff097          	auipc	ra,0xfffff
    80007536:	f40080e7          	jalr	-192(ra) # 80006472 <begin_op>

  if((ip = namei(path)) == 0){
    8000753a:	de843503          	ld	a0,-536(s0)
    8000753e:	fffff097          	auipc	ra,0xfffff
    80007542:	bd0080e7          	jalr	-1072(ra) # 8000610e <namei>
    80007546:	faa43423          	sd	a0,-88(s0)
    8000754a:	fa843783          	ld	a5,-88(s0)
    8000754e:	e799                	bnez	a5,8000755c <exec+0x58>
    end_op();
    80007550:	fffff097          	auipc	ra,0xfffff
    80007554:	fe4080e7          	jalr	-28(ra) # 80006534 <end_op>
    return -1;
    80007558:	57fd                	li	a5,-1
    8000755a:	a1a9                	j	800079a4 <exec+0x4a0>
  }
  ilock(ip);
    8000755c:	fa843503          	ld	a0,-88(s0)
    80007560:	ffffe097          	auipc	ra,0xffffe
    80007564:	e88080e7          	jalr	-376(ra) # 800053e8 <ilock>

  // Check ELF header
  if(readi(ip, 0, (uint64)&elf, 0, sizeof(elf)) != sizeof(elf))
    80007568:	e3040793          	addi	a5,s0,-464
    8000756c:	04000713          	li	a4,64
    80007570:	4681                	li	a3,0
    80007572:	863e                	mv	a2,a5
    80007574:	4581                	li	a1,0
    80007576:	fa843503          	ld	a0,-88(s0)
    8000757a:	ffffe097          	auipc	ra,0xffffe
    8000757e:	424080e7          	jalr	1060(ra) # 8000599e <readi>
    80007582:	87aa                	mv	a5,a0
    80007584:	873e                	mv	a4,a5
    80007586:	04000793          	li	a5,64
    8000758a:	3af71763          	bne	a4,a5,80007938 <exec+0x434>
    goto bad;

  if(elf.magic != ELF_MAGIC)
    8000758e:	e3042783          	lw	a5,-464(s0)
    80007592:	873e                	mv	a4,a5
    80007594:	464c47b7          	lui	a5,0x464c4
    80007598:	57f78793          	addi	a5,a5,1407 # 464c457f <_entry-0x39b3ba81>
    8000759c:	3af71063          	bne	a4,a5,8000793c <exec+0x438>
    goto bad;

  if((pagetable = proc_pagetable(p)) == 0)
    800075a0:	f9843503          	ld	a0,-104(s0)
    800075a4:	ffffc097          	auipc	ra,0xffffc
    800075a8:	820080e7          	jalr	-2016(ra) # 80002dc4 <proc_pagetable>
    800075ac:	faa43023          	sd	a0,-96(s0)
    800075b0:	fa043783          	ld	a5,-96(s0)
    800075b4:	38078663          	beqz	a5,80007940 <exec+0x43c>
    goto bad;

  // Load program into memory.
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    800075b8:	fc042623          	sw	zero,-52(s0)
    800075bc:	e5043783          	ld	a5,-432(s0)
    800075c0:	fcf42423          	sw	a5,-56(s0)
    800075c4:	a0fd                	j	800076b2 <exec+0x1ae>
    if(readi(ip, 0, (uint64)&ph, off, sizeof(ph)) != sizeof(ph))
    800075c6:	df840793          	addi	a5,s0,-520
    800075ca:	fc842683          	lw	a3,-56(s0)
    800075ce:	03800713          	li	a4,56
    800075d2:	863e                	mv	a2,a5
    800075d4:	4581                	li	a1,0
    800075d6:	fa843503          	ld	a0,-88(s0)
    800075da:	ffffe097          	auipc	ra,0xffffe
    800075de:	3c4080e7          	jalr	964(ra) # 8000599e <readi>
    800075e2:	87aa                	mv	a5,a0
    800075e4:	873e                	mv	a4,a5
    800075e6:	03800793          	li	a5,56
    800075ea:	34f71d63          	bne	a4,a5,80007944 <exec+0x440>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
    800075ee:	df842783          	lw	a5,-520(s0)
    800075f2:	873e                	mv	a4,a5
    800075f4:	4785                	li	a5,1
    800075f6:	0af71163          	bne	a4,a5,80007698 <exec+0x194>
      continue;
    if(ph.memsz < ph.filesz)
    800075fa:	e2043703          	ld	a4,-480(s0)
    800075fe:	e1843783          	ld	a5,-488(s0)
    80007602:	34f76363          	bltu	a4,a5,80007948 <exec+0x444>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
    80007606:	e0843703          	ld	a4,-504(s0)
    8000760a:	e2043783          	ld	a5,-480(s0)
    8000760e:	973e                	add	a4,a4,a5
    80007610:	e0843783          	ld	a5,-504(s0)
    80007614:	32f76c63          	bltu	a4,a5,8000794c <exec+0x448>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
    80007618:	e0843703          	ld	a4,-504(s0)
    8000761c:	6785                	lui	a5,0x1
    8000761e:	17fd                	addi	a5,a5,-1
    80007620:	8ff9                	and	a5,a5,a4
    80007622:	32079763          	bnez	a5,80007950 <exec+0x44c>
      goto bad;
    uint64 sz1;
    if((sz1 = uvmalloc(pagetable, sz, ph.vaddr + ph.memsz, flags2perm(ph.flags))) == 0)
    80007626:	e0843703          	ld	a4,-504(s0)
    8000762a:	e2043783          	ld	a5,-480(s0)
    8000762e:	00f704b3          	add	s1,a4,a5
    80007632:	dfc42783          	lw	a5,-516(s0)
    80007636:	2781                	sext.w	a5,a5
    80007638:	853e                	mv	a0,a5
    8000763a:	00000097          	auipc	ra,0x0
    8000763e:	e88080e7          	jalr	-376(ra) # 800074c2 <flags2perm>
    80007642:	87aa                	mv	a5,a0
    80007644:	86be                	mv	a3,a5
    80007646:	8626                	mv	a2,s1
    80007648:	fb843583          	ld	a1,-72(s0)
    8000764c:	fa043503          	ld	a0,-96(s0)
    80007650:	ffffb097          	auipc	ra,0xffffb
    80007654:	be4080e7          	jalr	-1052(ra) # 80002234 <uvmalloc>
    80007658:	f6a43823          	sd	a0,-144(s0)
    8000765c:	f7043783          	ld	a5,-144(s0)
    80007660:	2e078a63          	beqz	a5,80007954 <exec+0x450>
      goto bad;
    sz = sz1;
    80007664:	f7043783          	ld	a5,-144(s0)
    80007668:	faf43c23          	sd	a5,-72(s0)
    if(loadseg(pagetable, ph.vaddr, ip, ph.off, ph.filesz) < 0)
    8000766c:	e0843783          	ld	a5,-504(s0)
    80007670:	e0043703          	ld	a4,-512(s0)
    80007674:	0007069b          	sext.w	a3,a4
    80007678:	e1843703          	ld	a4,-488(s0)
    8000767c:	2701                	sext.w	a4,a4
    8000767e:	fa843603          	ld	a2,-88(s0)
    80007682:	85be                	mv	a1,a5
    80007684:	fa043503          	ld	a0,-96(s0)
    80007688:	00000097          	auipc	ra,0x0
    8000768c:	330080e7          	jalr	816(ra) # 800079b8 <loadseg>
    80007690:	87aa                	mv	a5,a0
    80007692:	2c07c363          	bltz	a5,80007958 <exec+0x454>
    80007696:	a011                	j	8000769a <exec+0x196>
      continue;
    80007698:	0001                	nop
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
    8000769a:	fcc42783          	lw	a5,-52(s0)
    8000769e:	2785                	addiw	a5,a5,1
    800076a0:	fcf42623          	sw	a5,-52(s0)
    800076a4:	fc842783          	lw	a5,-56(s0)
    800076a8:	0387879b          	addiw	a5,a5,56
    800076ac:	2781                	sext.w	a5,a5
    800076ae:	fcf42423          	sw	a5,-56(s0)
    800076b2:	e6845783          	lhu	a5,-408(s0)
    800076b6:	0007871b          	sext.w	a4,a5
    800076ba:	fcc42783          	lw	a5,-52(s0)
    800076be:	2781                	sext.w	a5,a5
    800076c0:	f0e7c3e3          	blt	a5,a4,800075c6 <exec+0xc2>
      goto bad;
  }
  iunlockput(ip);
    800076c4:	fa843503          	ld	a0,-88(s0)
    800076c8:	ffffe097          	auipc	ra,0xffffe
    800076cc:	f7e080e7          	jalr	-130(ra) # 80005646 <iunlockput>
  end_op();
    800076d0:	fffff097          	auipc	ra,0xfffff
    800076d4:	e64080e7          	jalr	-412(ra) # 80006534 <end_op>
  ip = 0;
    800076d8:	fa043423          	sd	zero,-88(s0)

  p = myproc();
    800076dc:	ffffb097          	auipc	ra,0xffffb
    800076e0:	486080e7          	jalr	1158(ra) # 80002b62 <myproc>
    800076e4:	f8a43c23          	sd	a0,-104(s0)
  uint64 oldsz = p->sz;
    800076e8:	f9843783          	ld	a5,-104(s0)
    800076ec:	67bc                	ld	a5,72(a5)
    800076ee:	f8f43823          	sd	a5,-112(s0)

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible as a stack guard.
  // Use the second as the user stack.
  sz = PGROUNDUP(sz);
    800076f2:	fb843703          	ld	a4,-72(s0)
    800076f6:	6785                	lui	a5,0x1
    800076f8:	17fd                	addi	a5,a5,-1
    800076fa:	973e                	add	a4,a4,a5
    800076fc:	77fd                	lui	a5,0xfffff
    800076fe:	8ff9                	and	a5,a5,a4
    80007700:	faf43c23          	sd	a5,-72(s0)
  uint64 sz1;
  if((sz1 = uvmalloc(pagetable, sz, sz + 2*PGSIZE, PTE_W)) == 0)
    80007704:	fb843703          	ld	a4,-72(s0)
    80007708:	6789                	lui	a5,0x2
    8000770a:	97ba                	add	a5,a5,a4
    8000770c:	4691                	li	a3,4
    8000770e:	863e                	mv	a2,a5
    80007710:	fb843583          	ld	a1,-72(s0)
    80007714:	fa043503          	ld	a0,-96(s0)
    80007718:	ffffb097          	auipc	ra,0xffffb
    8000771c:	b1c080e7          	jalr	-1252(ra) # 80002234 <uvmalloc>
    80007720:	f8a43423          	sd	a0,-120(s0)
    80007724:	f8843783          	ld	a5,-120(s0)
    80007728:	22078a63          	beqz	a5,8000795c <exec+0x458>
    goto bad;
  sz = sz1;
    8000772c:	f8843783          	ld	a5,-120(s0)
    80007730:	faf43c23          	sd	a5,-72(s0)
  uvmclear(pagetable, sz-2*PGSIZE);
    80007734:	fb843703          	ld	a4,-72(s0)
    80007738:	77f9                	lui	a5,0xffffe
    8000773a:	97ba                	add	a5,a5,a4
    8000773c:	85be                	mv	a1,a5
    8000773e:	fa043503          	ld	a0,-96(s0)
    80007742:	ffffb097          	auipc	ra,0xffffb
    80007746:	e88080e7          	jalr	-376(ra) # 800025ca <uvmclear>
  sp = sz;
    8000774a:	fb843783          	ld	a5,-72(s0)
    8000774e:	faf43823          	sd	a5,-80(s0)
  stackbase = sp - PGSIZE;
    80007752:	fb043703          	ld	a4,-80(s0)
    80007756:	77fd                	lui	a5,0xfffff
    80007758:	97ba                	add	a5,a5,a4
    8000775a:	f8f43023          	sd	a5,-128(s0)

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    8000775e:	fc043023          	sd	zero,-64(s0)
    80007762:	a845                	j	80007812 <exec+0x30e>
    if(argc >= MAXARG)
    80007764:	fc043703          	ld	a4,-64(s0)
    80007768:	47fd                	li	a5,31
    8000776a:	1ee7eb63          	bltu	a5,a4,80007960 <exec+0x45c>
      goto bad;
    sp -= strlen(argv[argc]) + 1;
    8000776e:	fc043783          	ld	a5,-64(s0)
    80007772:	078e                	slli	a5,a5,0x3
    80007774:	de043703          	ld	a4,-544(s0)
    80007778:	97ba                	add	a5,a5,a4
    8000777a:	639c                	ld	a5,0(a5)
    8000777c:	853e                	mv	a0,a5
    8000777e:	ffffa097          	auipc	ra,0xffffa
    80007782:	0fe080e7          	jalr	254(ra) # 8000187c <strlen>
    80007786:	87aa                	mv	a5,a0
    80007788:	2785                	addiw	a5,a5,1
    8000778a:	2781                	sext.w	a5,a5
    8000778c:	873e                	mv	a4,a5
    8000778e:	fb043783          	ld	a5,-80(s0)
    80007792:	8f99                	sub	a5,a5,a4
    80007794:	faf43823          	sd	a5,-80(s0)
    sp -= sp % 16; // riscv sp must be 16-byte aligned
    80007798:	fb043783          	ld	a5,-80(s0)
    8000779c:	9bc1                	andi	a5,a5,-16
    8000779e:	faf43823          	sd	a5,-80(s0)
    if(sp < stackbase)
    800077a2:	fb043703          	ld	a4,-80(s0)
    800077a6:	f8043783          	ld	a5,-128(s0)
    800077aa:	1af76d63          	bltu	a4,a5,80007964 <exec+0x460>
      goto bad;
    if(copyout(pagetable, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
    800077ae:	fc043783          	ld	a5,-64(s0)
    800077b2:	078e                	slli	a5,a5,0x3
    800077b4:	de043703          	ld	a4,-544(s0)
    800077b8:	97ba                	add	a5,a5,a4
    800077ba:	6384                	ld	s1,0(a5)
    800077bc:	fc043783          	ld	a5,-64(s0)
    800077c0:	078e                	slli	a5,a5,0x3
    800077c2:	de043703          	ld	a4,-544(s0)
    800077c6:	97ba                	add	a5,a5,a4
    800077c8:	639c                	ld	a5,0(a5)
    800077ca:	853e                	mv	a0,a5
    800077cc:	ffffa097          	auipc	ra,0xffffa
    800077d0:	0b0080e7          	jalr	176(ra) # 8000187c <strlen>
    800077d4:	87aa                	mv	a5,a0
    800077d6:	2785                	addiw	a5,a5,1
    800077d8:	2781                	sext.w	a5,a5
    800077da:	86be                	mv	a3,a5
    800077dc:	8626                	mv	a2,s1
    800077de:	fb043583          	ld	a1,-80(s0)
    800077e2:	fa043503          	ld	a0,-96(s0)
    800077e6:	ffffb097          	auipc	ra,0xffffb
    800077ea:	e46080e7          	jalr	-442(ra) # 8000262c <copyout>
    800077ee:	87aa                	mv	a5,a0
    800077f0:	1607cc63          	bltz	a5,80007968 <exec+0x464>
      goto bad;
    ustack[argc] = sp;
    800077f4:	fc043783          	ld	a5,-64(s0)
    800077f8:	078e                	slli	a5,a5,0x3
    800077fa:	fe040713          	addi	a4,s0,-32
    800077fe:	97ba                	add	a5,a5,a4
    80007800:	fb043703          	ld	a4,-80(s0)
    80007804:	e8e7b823          	sd	a4,-368(a5) # ffffffffffffee90 <end+0xffffffff7ffc8f60>
  for(argc = 0; argv[argc]; argc++) {
    80007808:	fc043783          	ld	a5,-64(s0)
    8000780c:	0785                	addi	a5,a5,1
    8000780e:	fcf43023          	sd	a5,-64(s0)
    80007812:	fc043783          	ld	a5,-64(s0)
    80007816:	078e                	slli	a5,a5,0x3
    80007818:	de043703          	ld	a4,-544(s0)
    8000781c:	97ba                	add	a5,a5,a4
    8000781e:	639c                	ld	a5,0(a5)
    80007820:	f3b1                	bnez	a5,80007764 <exec+0x260>
  }
  ustack[argc] = 0;
    80007822:	fc043783          	ld	a5,-64(s0)
    80007826:	078e                	slli	a5,a5,0x3
    80007828:	fe040713          	addi	a4,s0,-32
    8000782c:	97ba                	add	a5,a5,a4
    8000782e:	e807b823          	sd	zero,-368(a5)

  // push the array of argv[] pointers.
  sp -= (argc+1) * sizeof(uint64);
    80007832:	fc043783          	ld	a5,-64(s0)
    80007836:	0785                	addi	a5,a5,1
    80007838:	078e                	slli	a5,a5,0x3
    8000783a:	fb043703          	ld	a4,-80(s0)
    8000783e:	40f707b3          	sub	a5,a4,a5
    80007842:	faf43823          	sd	a5,-80(s0)
  sp -= sp % 16;
    80007846:	fb043783          	ld	a5,-80(s0)
    8000784a:	9bc1                	andi	a5,a5,-16
    8000784c:	faf43823          	sd	a5,-80(s0)
  if(sp < stackbase)
    80007850:	fb043703          	ld	a4,-80(s0)
    80007854:	f8043783          	ld	a5,-128(s0)
    80007858:	10f76a63          	bltu	a4,a5,8000796c <exec+0x468>
    goto bad;
  if(copyout(pagetable, sp, (char *)ustack, (argc+1)*sizeof(uint64)) < 0)
    8000785c:	fc043783          	ld	a5,-64(s0)
    80007860:	0785                	addi	a5,a5,1
    80007862:	00379713          	slli	a4,a5,0x3
    80007866:	e7040793          	addi	a5,s0,-400
    8000786a:	86ba                	mv	a3,a4
    8000786c:	863e                	mv	a2,a5
    8000786e:	fb043583          	ld	a1,-80(s0)
    80007872:	fa043503          	ld	a0,-96(s0)
    80007876:	ffffb097          	auipc	ra,0xffffb
    8000787a:	db6080e7          	jalr	-586(ra) # 8000262c <copyout>
    8000787e:	87aa                	mv	a5,a0
    80007880:	0e07c863          	bltz	a5,80007970 <exec+0x46c>
    goto bad;

  // arguments to user main(argc, argv)
  // argc is returned via the system call return
  // value, which goes in a0.
  p->trapframe->a1 = sp;
    80007884:	f9843783          	ld	a5,-104(s0)
    80007888:	6fbc                	ld	a5,88(a5)
    8000788a:	fb043703          	ld	a4,-80(s0)
    8000788e:	ffb8                	sd	a4,120(a5)

  // Save program name for debugging.
  for(last=s=path; *s; s++)
    80007890:	de843783          	ld	a5,-536(s0)
    80007894:	fcf43c23          	sd	a5,-40(s0)
    80007898:	fd843783          	ld	a5,-40(s0)
    8000789c:	fcf43823          	sd	a5,-48(s0)
    800078a0:	a025                	j	800078c8 <exec+0x3c4>
    if(*s == '/')
    800078a2:	fd843783          	ld	a5,-40(s0)
    800078a6:	0007c783          	lbu	a5,0(a5)
    800078aa:	873e                	mv	a4,a5
    800078ac:	02f00793          	li	a5,47
    800078b0:	00f71763          	bne	a4,a5,800078be <exec+0x3ba>
      last = s+1;
    800078b4:	fd843783          	ld	a5,-40(s0)
    800078b8:	0785                	addi	a5,a5,1
    800078ba:	fcf43823          	sd	a5,-48(s0)
  for(last=s=path; *s; s++)
    800078be:	fd843783          	ld	a5,-40(s0)
    800078c2:	0785                	addi	a5,a5,1
    800078c4:	fcf43c23          	sd	a5,-40(s0)
    800078c8:	fd843783          	ld	a5,-40(s0)
    800078cc:	0007c783          	lbu	a5,0(a5)
    800078d0:	fbe9                	bnez	a5,800078a2 <exec+0x39e>
  safestrcpy(p->name, last, sizeof(p->name));
    800078d2:	f9843783          	ld	a5,-104(s0)
    800078d6:	15878793          	addi	a5,a5,344
    800078da:	4641                	li	a2,16
    800078dc:	fd043583          	ld	a1,-48(s0)
    800078e0:	853e                	mv	a0,a5
    800078e2:	ffffa097          	auipc	ra,0xffffa
    800078e6:	f20080e7          	jalr	-224(ra) # 80001802 <safestrcpy>
    
  // Commit to the user image.
  oldpagetable = p->pagetable;
    800078ea:	f9843783          	ld	a5,-104(s0)
    800078ee:	6bbc                	ld	a5,80(a5)
    800078f0:	f6f43c23          	sd	a5,-136(s0)
  p->pagetable = pagetable;
    800078f4:	f9843783          	ld	a5,-104(s0)
    800078f8:	fa043703          	ld	a4,-96(s0)
    800078fc:	ebb8                	sd	a4,80(a5)
  p->sz = sz;
    800078fe:	f9843783          	ld	a5,-104(s0)
    80007902:	fb843703          	ld	a4,-72(s0)
    80007906:	e7b8                	sd	a4,72(a5)
  p->trapframe->epc = elf.entry;  // initial program counter = main
    80007908:	f9843783          	ld	a5,-104(s0)
    8000790c:	6fbc                	ld	a5,88(a5)
    8000790e:	e4843703          	ld	a4,-440(s0)
    80007912:	ef98                	sd	a4,24(a5)
  p->trapframe->sp = sp; // initial stack pointer
    80007914:	f9843783          	ld	a5,-104(s0)
    80007918:	6fbc                	ld	a5,88(a5)
    8000791a:	fb043703          	ld	a4,-80(s0)
    8000791e:	fb98                	sd	a4,48(a5)
  proc_freepagetable(oldpagetable, oldsz);
    80007920:	f9043583          	ld	a1,-112(s0)
    80007924:	f7843503          	ld	a0,-136(s0)
    80007928:	ffffb097          	auipc	ra,0xffffb
    8000792c:	55c080e7          	jalr	1372(ra) # 80002e84 <proc_freepagetable>

  return argc; // this ends up in a0, the first argument to main(argc, argv)
    80007930:	fc043783          	ld	a5,-64(s0)
    80007934:	2781                	sext.w	a5,a5
    80007936:	a0bd                	j	800079a4 <exec+0x4a0>
    goto bad;
    80007938:	0001                	nop
    8000793a:	a825                	j	80007972 <exec+0x46e>
    goto bad;
    8000793c:	0001                	nop
    8000793e:	a815                	j	80007972 <exec+0x46e>
    goto bad;
    80007940:	0001                	nop
    80007942:	a805                	j	80007972 <exec+0x46e>
      goto bad;
    80007944:	0001                	nop
    80007946:	a035                	j	80007972 <exec+0x46e>
      goto bad;
    80007948:	0001                	nop
    8000794a:	a025                	j	80007972 <exec+0x46e>
      goto bad;
    8000794c:	0001                	nop
    8000794e:	a015                	j	80007972 <exec+0x46e>
      goto bad;
    80007950:	0001                	nop
    80007952:	a005                	j	80007972 <exec+0x46e>
      goto bad;
    80007954:	0001                	nop
    80007956:	a831                	j	80007972 <exec+0x46e>
      goto bad;
    80007958:	0001                	nop
    8000795a:	a821                	j	80007972 <exec+0x46e>
    goto bad;
    8000795c:	0001                	nop
    8000795e:	a811                	j	80007972 <exec+0x46e>
      goto bad;
    80007960:	0001                	nop
    80007962:	a801                	j	80007972 <exec+0x46e>
      goto bad;
    80007964:	0001                	nop
    80007966:	a031                	j	80007972 <exec+0x46e>
      goto bad;
    80007968:	0001                	nop
    8000796a:	a021                	j	80007972 <exec+0x46e>
    goto bad;
    8000796c:	0001                	nop
    8000796e:	a011                	j	80007972 <exec+0x46e>
    goto bad;
    80007970:	0001                	nop

 bad:
  if(pagetable)
    80007972:	fa043783          	ld	a5,-96(s0)
    80007976:	cb89                	beqz	a5,80007988 <exec+0x484>
    proc_freepagetable(pagetable, sz);
    80007978:	fb843583          	ld	a1,-72(s0)
    8000797c:	fa043503          	ld	a0,-96(s0)
    80007980:	ffffb097          	auipc	ra,0xffffb
    80007984:	504080e7          	jalr	1284(ra) # 80002e84 <proc_freepagetable>
  if(ip){
    80007988:	fa843783          	ld	a5,-88(s0)
    8000798c:	cb99                	beqz	a5,800079a2 <exec+0x49e>
    iunlockput(ip);
    8000798e:	fa843503          	ld	a0,-88(s0)
    80007992:	ffffe097          	auipc	ra,0xffffe
    80007996:	cb4080e7          	jalr	-844(ra) # 80005646 <iunlockput>
    end_op();
    8000799a:	fffff097          	auipc	ra,0xfffff
    8000799e:	b9a080e7          	jalr	-1126(ra) # 80006534 <end_op>
  }
  return -1;
    800079a2:	57fd                	li	a5,-1
}
    800079a4:	853e                	mv	a0,a5
    800079a6:	21813083          	ld	ra,536(sp)
    800079aa:	21013403          	ld	s0,528(sp)
    800079ae:	20813483          	ld	s1,520(sp)
    800079b2:	22010113          	addi	sp,sp,544
    800079b6:	8082                	ret

00000000800079b8 <loadseg>:
// va must be page-aligned
// and the pages from va to va+sz must already be mapped.
// Returns 0 on success, -1 on failure.
static int
loadseg(pagetable_t pagetable, uint64 va, struct inode *ip, uint offset, uint sz)
{
    800079b8:	7139                	addi	sp,sp,-64
    800079ba:	fc06                	sd	ra,56(sp)
    800079bc:	f822                	sd	s0,48(sp)
    800079be:	0080                	addi	s0,sp,64
    800079c0:	fca43c23          	sd	a0,-40(s0)
    800079c4:	fcb43823          	sd	a1,-48(s0)
    800079c8:	fcc43423          	sd	a2,-56(s0)
    800079cc:	87b6                	mv	a5,a3
    800079ce:	fcf42223          	sw	a5,-60(s0)
    800079d2:	87ba                	mv	a5,a4
    800079d4:	fcf42023          	sw	a5,-64(s0)
  uint i, n;
  uint64 pa;

  for(i = 0; i < sz; i += PGSIZE){
    800079d8:	fe042623          	sw	zero,-20(s0)
    800079dc:	a05d                	j	80007a82 <loadseg+0xca>
    pa = walkaddr(pagetable, va + i);
    800079de:	fec46703          	lwu	a4,-20(s0)
    800079e2:	fd043783          	ld	a5,-48(s0)
    800079e6:	97ba                	add	a5,a5,a4
    800079e8:	85be                	mv	a1,a5
    800079ea:	fd843503          	ld	a0,-40(s0)
    800079ee:	ffffa097          	auipc	ra,0xffffa
    800079f2:	4ba080e7          	jalr	1210(ra) # 80001ea8 <walkaddr>
    800079f6:	fea43023          	sd	a0,-32(s0)
    if(pa == 0)
    800079fa:	fe043783          	ld	a5,-32(s0)
    800079fe:	eb89                	bnez	a5,80007a10 <loadseg+0x58>
      panic("loadseg: address should exist");
    80007a00:	00005517          	auipc	a0,0x5
    80007a04:	c0050513          	addi	a0,a0,-1024 # 8000c600 <etext+0x600>
    80007a08:	ffff9097          	auipc	ra,0xffff9
    80007a0c:	284080e7          	jalr	644(ra) # 80000c8c <panic>
    if(sz - i < PGSIZE)
    80007a10:	fc042703          	lw	a4,-64(s0)
    80007a14:	fec42783          	lw	a5,-20(s0)
    80007a18:	40f707bb          	subw	a5,a4,a5
    80007a1c:	2781                	sext.w	a5,a5
    80007a1e:	873e                	mv	a4,a5
    80007a20:	6785                	lui	a5,0x1
    80007a22:	00f77b63          	bgeu	a4,a5,80007a38 <loadseg+0x80>
      n = sz - i;
    80007a26:	fc042703          	lw	a4,-64(s0)
    80007a2a:	fec42783          	lw	a5,-20(s0)
    80007a2e:	40f707bb          	subw	a5,a4,a5
    80007a32:	fef42423          	sw	a5,-24(s0)
    80007a36:	a021                	j	80007a3e <loadseg+0x86>
    else
      n = PGSIZE;
    80007a38:	6785                	lui	a5,0x1
    80007a3a:	fef42423          	sw	a5,-24(s0)
    if(readi(ip, 0, (uint64)pa, offset+i, n) != n)
    80007a3e:	fc442703          	lw	a4,-60(s0)
    80007a42:	fec42783          	lw	a5,-20(s0)
    80007a46:	9fb9                	addw	a5,a5,a4
    80007a48:	2781                	sext.w	a5,a5
    80007a4a:	fe842703          	lw	a4,-24(s0)
    80007a4e:	86be                	mv	a3,a5
    80007a50:	fe043603          	ld	a2,-32(s0)
    80007a54:	4581                	li	a1,0
    80007a56:	fc843503          	ld	a0,-56(s0)
    80007a5a:	ffffe097          	auipc	ra,0xffffe
    80007a5e:	f44080e7          	jalr	-188(ra) # 8000599e <readi>
    80007a62:	87aa                	mv	a5,a0
    80007a64:	0007871b          	sext.w	a4,a5
    80007a68:	fe842783          	lw	a5,-24(s0)
    80007a6c:	2781                	sext.w	a5,a5
    80007a6e:	00e78463          	beq	a5,a4,80007a76 <loadseg+0xbe>
      return -1;
    80007a72:	57fd                	li	a5,-1
    80007a74:	a005                	j	80007a94 <loadseg+0xdc>
  for(i = 0; i < sz; i += PGSIZE){
    80007a76:	fec42703          	lw	a4,-20(s0)
    80007a7a:	6785                	lui	a5,0x1
    80007a7c:	9fb9                	addw	a5,a5,a4
    80007a7e:	fef42623          	sw	a5,-20(s0)
    80007a82:	fec42703          	lw	a4,-20(s0)
    80007a86:	fc042783          	lw	a5,-64(s0)
    80007a8a:	2701                	sext.w	a4,a4
    80007a8c:	2781                	sext.w	a5,a5
    80007a8e:	f4f768e3          	bltu	a4,a5,800079de <loadseg+0x26>
  }
  
  return 0;
    80007a92:	4781                	li	a5,0
}
    80007a94:	853e                	mv	a0,a5
    80007a96:	70e2                	ld	ra,56(sp)
    80007a98:	7442                	ld	s0,48(sp)
    80007a9a:	6121                	addi	sp,sp,64
    80007a9c:	8082                	ret

0000000080007a9e <argfd>:

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
{
    80007a9e:	7139                	addi	sp,sp,-64
    80007aa0:	fc06                	sd	ra,56(sp)
    80007aa2:	f822                	sd	s0,48(sp)
    80007aa4:	0080                	addi	s0,sp,64
    80007aa6:	87aa                	mv	a5,a0
    80007aa8:	fcb43823          	sd	a1,-48(s0)
    80007aac:	fcc43423          	sd	a2,-56(s0)
    80007ab0:	fcf42e23          	sw	a5,-36(s0)
  int fd;
  struct file *f;

  argint(n, &fd);
    80007ab4:	fe440713          	addi	a4,s0,-28
    80007ab8:	fdc42783          	lw	a5,-36(s0)
    80007abc:	85ba                	mv	a1,a4
    80007abe:	853e                	mv	a0,a5
    80007ac0:	ffffd097          	auipc	ra,0xffffd
    80007ac4:	980080e7          	jalr	-1664(ra) # 80004440 <argint>
  if(fd < 0 || fd >= NOFILE || (f=myproc()->ofile[fd]) == 0)
    80007ac8:	fe442783          	lw	a5,-28(s0)
    80007acc:	0207c863          	bltz	a5,80007afc <argfd+0x5e>
    80007ad0:	fe442783          	lw	a5,-28(s0)
    80007ad4:	873e                	mv	a4,a5
    80007ad6:	47bd                	li	a5,15
    80007ad8:	02e7c263          	blt	a5,a4,80007afc <argfd+0x5e>
    80007adc:	ffffb097          	auipc	ra,0xffffb
    80007ae0:	086080e7          	jalr	134(ra) # 80002b62 <myproc>
    80007ae4:	872a                	mv	a4,a0
    80007ae6:	fe442783          	lw	a5,-28(s0)
    80007aea:	07e9                	addi	a5,a5,26
    80007aec:	078e                	slli	a5,a5,0x3
    80007aee:	97ba                	add	a5,a5,a4
    80007af0:	639c                	ld	a5,0(a5)
    80007af2:	fef43423          	sd	a5,-24(s0)
    80007af6:	fe843783          	ld	a5,-24(s0)
    80007afa:	e399                	bnez	a5,80007b00 <argfd+0x62>
    return -1;
    80007afc:	57fd                	li	a5,-1
    80007afe:	a015                	j	80007b22 <argfd+0x84>
  if(pfd)
    80007b00:	fd043783          	ld	a5,-48(s0)
    80007b04:	c791                	beqz	a5,80007b10 <argfd+0x72>
    *pfd = fd;
    80007b06:	fe442703          	lw	a4,-28(s0)
    80007b0a:	fd043783          	ld	a5,-48(s0)
    80007b0e:	c398                	sw	a4,0(a5)
  if(pf)
    80007b10:	fc843783          	ld	a5,-56(s0)
    80007b14:	c791                	beqz	a5,80007b20 <argfd+0x82>
    *pf = f;
    80007b16:	fc843783          	ld	a5,-56(s0)
    80007b1a:	fe843703          	ld	a4,-24(s0)
    80007b1e:	e398                	sd	a4,0(a5)
  return 0;
    80007b20:	4781                	li	a5,0
}
    80007b22:	853e                	mv	a0,a5
    80007b24:	70e2                	ld	ra,56(sp)
    80007b26:	7442                	ld	s0,48(sp)
    80007b28:	6121                	addi	sp,sp,64
    80007b2a:	8082                	ret

0000000080007b2c <fdalloc>:

// Allocate a file descriptor for the given file.
// Takes over file reference from caller on success.
static int
fdalloc(struct file *f)
{
    80007b2c:	7179                	addi	sp,sp,-48
    80007b2e:	f406                	sd	ra,40(sp)
    80007b30:	f022                	sd	s0,32(sp)
    80007b32:	1800                	addi	s0,sp,48
    80007b34:	fca43c23          	sd	a0,-40(s0)
  int fd;
  struct proc *p = myproc();
    80007b38:	ffffb097          	auipc	ra,0xffffb
    80007b3c:	02a080e7          	jalr	42(ra) # 80002b62 <myproc>
    80007b40:	fea43023          	sd	a0,-32(s0)

  for(fd = 0; fd < NOFILE; fd++){
    80007b44:	fe042623          	sw	zero,-20(s0)
    80007b48:	a825                	j	80007b80 <fdalloc+0x54>
    if(p->ofile[fd] == 0){
    80007b4a:	fe043703          	ld	a4,-32(s0)
    80007b4e:	fec42783          	lw	a5,-20(s0)
    80007b52:	07e9                	addi	a5,a5,26
    80007b54:	078e                	slli	a5,a5,0x3
    80007b56:	97ba                	add	a5,a5,a4
    80007b58:	639c                	ld	a5,0(a5)
    80007b5a:	ef91                	bnez	a5,80007b76 <fdalloc+0x4a>
      p->ofile[fd] = f;
    80007b5c:	fe043703          	ld	a4,-32(s0)
    80007b60:	fec42783          	lw	a5,-20(s0)
    80007b64:	07e9                	addi	a5,a5,26
    80007b66:	078e                	slli	a5,a5,0x3
    80007b68:	97ba                	add	a5,a5,a4
    80007b6a:	fd843703          	ld	a4,-40(s0)
    80007b6e:	e398                	sd	a4,0(a5)
      return fd;
    80007b70:	fec42783          	lw	a5,-20(s0)
    80007b74:	a831                	j	80007b90 <fdalloc+0x64>
  for(fd = 0; fd < NOFILE; fd++){
    80007b76:	fec42783          	lw	a5,-20(s0)
    80007b7a:	2785                	addiw	a5,a5,1
    80007b7c:	fef42623          	sw	a5,-20(s0)
    80007b80:	fec42783          	lw	a5,-20(s0)
    80007b84:	0007871b          	sext.w	a4,a5
    80007b88:	47bd                	li	a5,15
    80007b8a:	fce7d0e3          	bge	a5,a4,80007b4a <fdalloc+0x1e>
    }
  }
  return -1;
    80007b8e:	57fd                	li	a5,-1
}
    80007b90:	853e                	mv	a0,a5
    80007b92:	70a2                	ld	ra,40(sp)
    80007b94:	7402                	ld	s0,32(sp)
    80007b96:	6145                	addi	sp,sp,48
    80007b98:	8082                	ret

0000000080007b9a <sys_dup>:

uint64
sys_dup(void)
{
    80007b9a:	1101                	addi	sp,sp,-32
    80007b9c:	ec06                	sd	ra,24(sp)
    80007b9e:	e822                	sd	s0,16(sp)
    80007ba0:	1000                	addi	s0,sp,32
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    80007ba2:	fe040793          	addi	a5,s0,-32
    80007ba6:	863e                	mv	a2,a5
    80007ba8:	4581                	li	a1,0
    80007baa:	4501                	li	a0,0
    80007bac:	00000097          	auipc	ra,0x0
    80007bb0:	ef2080e7          	jalr	-270(ra) # 80007a9e <argfd>
    80007bb4:	87aa                	mv	a5,a0
    80007bb6:	0007d463          	bgez	a5,80007bbe <sys_dup+0x24>
    return -1;
    80007bba:	57fd                	li	a5,-1
    80007bbc:	a81d                	j	80007bf2 <sys_dup+0x58>
  if((fd=fdalloc(f)) < 0)
    80007bbe:	fe043783          	ld	a5,-32(s0)
    80007bc2:	853e                	mv	a0,a5
    80007bc4:	00000097          	auipc	ra,0x0
    80007bc8:	f68080e7          	jalr	-152(ra) # 80007b2c <fdalloc>
    80007bcc:	87aa                	mv	a5,a0
    80007bce:	fef42623          	sw	a5,-20(s0)
    80007bd2:	fec42783          	lw	a5,-20(s0)
    80007bd6:	2781                	sext.w	a5,a5
    80007bd8:	0007d463          	bgez	a5,80007be0 <sys_dup+0x46>
    return -1;
    80007bdc:	57fd                	li	a5,-1
    80007bde:	a811                	j	80007bf2 <sys_dup+0x58>
  filedup(f);
    80007be0:	fe043783          	ld	a5,-32(s0)
    80007be4:	853e                	mv	a0,a5
    80007be6:	fffff097          	auipc	ra,0xfffff
    80007bea:	ec0080e7          	jalr	-320(ra) # 80006aa6 <filedup>
  return fd;
    80007bee:	fec42783          	lw	a5,-20(s0)
}
    80007bf2:	853e                	mv	a0,a5
    80007bf4:	60e2                	ld	ra,24(sp)
    80007bf6:	6442                	ld	s0,16(sp)
    80007bf8:	6105                	addi	sp,sp,32
    80007bfa:	8082                	ret

0000000080007bfc <sys_read>:

uint64
sys_read(void)
{
    80007bfc:	7179                	addi	sp,sp,-48
    80007bfe:	f406                	sd	ra,40(sp)
    80007c00:	f022                	sd	s0,32(sp)
    80007c02:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;

  argaddr(1, &p);
    80007c04:	fd840793          	addi	a5,s0,-40
    80007c08:	85be                	mv	a1,a5
    80007c0a:	4505                	li	a0,1
    80007c0c:	ffffd097          	auipc	ra,0xffffd
    80007c10:	86a080e7          	jalr	-1942(ra) # 80004476 <argaddr>
  argint(2, &n);
    80007c14:	fe440793          	addi	a5,s0,-28
    80007c18:	85be                	mv	a1,a5
    80007c1a:	4509                	li	a0,2
    80007c1c:	ffffd097          	auipc	ra,0xffffd
    80007c20:	824080e7          	jalr	-2012(ra) # 80004440 <argint>
  if(argfd(0, 0, &f) < 0)
    80007c24:	fe840793          	addi	a5,s0,-24
    80007c28:	863e                	mv	a2,a5
    80007c2a:	4581                	li	a1,0
    80007c2c:	4501                	li	a0,0
    80007c2e:	00000097          	auipc	ra,0x0
    80007c32:	e70080e7          	jalr	-400(ra) # 80007a9e <argfd>
    80007c36:	87aa                	mv	a5,a0
    80007c38:	0007d463          	bgez	a5,80007c40 <sys_read+0x44>
    return -1;
    80007c3c:	57fd                	li	a5,-1
    80007c3e:	a839                	j	80007c5c <sys_read+0x60>
  return fileread(f, p, n);
    80007c40:	fe843783          	ld	a5,-24(s0)
    80007c44:	fd843703          	ld	a4,-40(s0)
    80007c48:	fe442683          	lw	a3,-28(s0)
    80007c4c:	8636                	mv	a2,a3
    80007c4e:	85ba                	mv	a1,a4
    80007c50:	853e                	mv	a0,a5
    80007c52:	fffff097          	auipc	ra,0xfffff
    80007c56:	066080e7          	jalr	102(ra) # 80006cb8 <fileread>
    80007c5a:	87aa                	mv	a5,a0
}
    80007c5c:	853e                	mv	a0,a5
    80007c5e:	70a2                	ld	ra,40(sp)
    80007c60:	7402                	ld	s0,32(sp)
    80007c62:	6145                	addi	sp,sp,48
    80007c64:	8082                	ret

0000000080007c66 <sys_write>:

uint64
sys_write(void)
{
    80007c66:	7179                	addi	sp,sp,-48
    80007c68:	f406                	sd	ra,40(sp)
    80007c6a:	f022                	sd	s0,32(sp)
    80007c6c:	1800                	addi	s0,sp,48
  struct file *f;
  int n;
  uint64 p;
  
  argaddr(1, &p);
    80007c6e:	fd840793          	addi	a5,s0,-40
    80007c72:	85be                	mv	a1,a5
    80007c74:	4505                	li	a0,1
    80007c76:	ffffd097          	auipc	ra,0xffffd
    80007c7a:	800080e7          	jalr	-2048(ra) # 80004476 <argaddr>
  argint(2, &n);
    80007c7e:	fe440793          	addi	a5,s0,-28
    80007c82:	85be                	mv	a1,a5
    80007c84:	4509                	li	a0,2
    80007c86:	ffffc097          	auipc	ra,0xffffc
    80007c8a:	7ba080e7          	jalr	1978(ra) # 80004440 <argint>
  if(argfd(0, 0, &f) < 0)
    80007c8e:	fe840793          	addi	a5,s0,-24
    80007c92:	863e                	mv	a2,a5
    80007c94:	4581                	li	a1,0
    80007c96:	4501                	li	a0,0
    80007c98:	00000097          	auipc	ra,0x0
    80007c9c:	e06080e7          	jalr	-506(ra) # 80007a9e <argfd>
    80007ca0:	87aa                	mv	a5,a0
    80007ca2:	0007d463          	bgez	a5,80007caa <sys_write+0x44>
    return -1;
    80007ca6:	57fd                	li	a5,-1
    80007ca8:	a839                	j	80007cc6 <sys_write+0x60>

  return filewrite(f, p, n);
    80007caa:	fe843783          	ld	a5,-24(s0)
    80007cae:	fd843703          	ld	a4,-40(s0)
    80007cb2:	fe442683          	lw	a3,-28(s0)
    80007cb6:	8636                	mv	a2,a3
    80007cb8:	85ba                	mv	a1,a4
    80007cba:	853e                	mv	a0,a5
    80007cbc:	fffff097          	auipc	ra,0xfffff
    80007cc0:	162080e7          	jalr	354(ra) # 80006e1e <filewrite>
    80007cc4:	87aa                	mv	a5,a0
}
    80007cc6:	853e                	mv	a0,a5
    80007cc8:	70a2                	ld	ra,40(sp)
    80007cca:	7402                	ld	s0,32(sp)
    80007ccc:	6145                	addi	sp,sp,48
    80007cce:	8082                	ret

0000000080007cd0 <sys_close>:

uint64
sys_close(void)
{
    80007cd0:	1101                	addi	sp,sp,-32
    80007cd2:	ec06                	sd	ra,24(sp)
    80007cd4:	e822                	sd	s0,16(sp)
    80007cd6:	1000                	addi	s0,sp,32
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    80007cd8:	fe040713          	addi	a4,s0,-32
    80007cdc:	fec40793          	addi	a5,s0,-20
    80007ce0:	863a                	mv	a2,a4
    80007ce2:	85be                	mv	a1,a5
    80007ce4:	4501                	li	a0,0
    80007ce6:	00000097          	auipc	ra,0x0
    80007cea:	db8080e7          	jalr	-584(ra) # 80007a9e <argfd>
    80007cee:	87aa                	mv	a5,a0
    80007cf0:	0007d463          	bgez	a5,80007cf8 <sys_close+0x28>
    return -1;
    80007cf4:	57fd                	li	a5,-1
    80007cf6:	a02d                	j	80007d20 <sys_close+0x50>
  myproc()->ofile[fd] = 0;
    80007cf8:	ffffb097          	auipc	ra,0xffffb
    80007cfc:	e6a080e7          	jalr	-406(ra) # 80002b62 <myproc>
    80007d00:	872a                	mv	a4,a0
    80007d02:	fec42783          	lw	a5,-20(s0)
    80007d06:	07e9                	addi	a5,a5,26
    80007d08:	078e                	slli	a5,a5,0x3
    80007d0a:	97ba                	add	a5,a5,a4
    80007d0c:	0007b023          	sd	zero,0(a5) # 1000 <_entry-0x7ffff000>
  fileclose(f);
    80007d10:	fe043783          	ld	a5,-32(s0)
    80007d14:	853e                	mv	a0,a5
    80007d16:	fffff097          	auipc	ra,0xfffff
    80007d1a:	df6080e7          	jalr	-522(ra) # 80006b0c <fileclose>
  return 0;
    80007d1e:	4781                	li	a5,0
}
    80007d20:	853e                	mv	a0,a5
    80007d22:	60e2                	ld	ra,24(sp)
    80007d24:	6442                	ld	s0,16(sp)
    80007d26:	6105                	addi	sp,sp,32
    80007d28:	8082                	ret

0000000080007d2a <sys_fstat>:

uint64
sys_fstat(void)
{
    80007d2a:	1101                	addi	sp,sp,-32
    80007d2c:	ec06                	sd	ra,24(sp)
    80007d2e:	e822                	sd	s0,16(sp)
    80007d30:	1000                	addi	s0,sp,32
  struct file *f;
  uint64 st; // user pointer to struct stat

  argaddr(1, &st);
    80007d32:	fe040793          	addi	a5,s0,-32
    80007d36:	85be                	mv	a1,a5
    80007d38:	4505                	li	a0,1
    80007d3a:	ffffc097          	auipc	ra,0xffffc
    80007d3e:	73c080e7          	jalr	1852(ra) # 80004476 <argaddr>
  if(argfd(0, 0, &f) < 0)
    80007d42:	fe840793          	addi	a5,s0,-24
    80007d46:	863e                	mv	a2,a5
    80007d48:	4581                	li	a1,0
    80007d4a:	4501                	li	a0,0
    80007d4c:	00000097          	auipc	ra,0x0
    80007d50:	d52080e7          	jalr	-686(ra) # 80007a9e <argfd>
    80007d54:	87aa                	mv	a5,a0
    80007d56:	0007d463          	bgez	a5,80007d5e <sys_fstat+0x34>
    return -1;
    80007d5a:	57fd                	li	a5,-1
    80007d5c:	a821                	j	80007d74 <sys_fstat+0x4a>
  return filestat(f, st);
    80007d5e:	fe843783          	ld	a5,-24(s0)
    80007d62:	fe043703          	ld	a4,-32(s0)
    80007d66:	85ba                	mv	a1,a4
    80007d68:	853e                	mv	a0,a5
    80007d6a:	fffff097          	auipc	ra,0xfffff
    80007d6e:	eaa080e7          	jalr	-342(ra) # 80006c14 <filestat>
    80007d72:	87aa                	mv	a5,a0
}
    80007d74:	853e                	mv	a0,a5
    80007d76:	60e2                	ld	ra,24(sp)
    80007d78:	6442                	ld	s0,16(sp)
    80007d7a:	6105                	addi	sp,sp,32
    80007d7c:	8082                	ret

0000000080007d7e <sys_link>:

// Create the path new as a link to the same inode as old.
uint64
sys_link(void)
{
    80007d7e:	7169                	addi	sp,sp,-304
    80007d80:	f606                	sd	ra,296(sp)
    80007d82:	f222                	sd	s0,288(sp)
    80007d84:	1a00                	addi	s0,sp,304
  char name[DIRSIZ], new[MAXPATH], old[MAXPATH];
  struct inode *dp, *ip;

  if(argstr(0, old, MAXPATH) < 0 || argstr(1, new, MAXPATH) < 0)
    80007d86:	ed040793          	addi	a5,s0,-304
    80007d8a:	08000613          	li	a2,128
    80007d8e:	85be                	mv	a1,a5
    80007d90:	4501                	li	a0,0
    80007d92:	ffffc097          	auipc	ra,0xffffc
    80007d96:	716080e7          	jalr	1814(ra) # 800044a8 <argstr>
    80007d9a:	87aa                	mv	a5,a0
    80007d9c:	0007cf63          	bltz	a5,80007dba <sys_link+0x3c>
    80007da0:	f5040793          	addi	a5,s0,-176
    80007da4:	08000613          	li	a2,128
    80007da8:	85be                	mv	a1,a5
    80007daa:	4505                	li	a0,1
    80007dac:	ffffc097          	auipc	ra,0xffffc
    80007db0:	6fc080e7          	jalr	1788(ra) # 800044a8 <argstr>
    80007db4:	87aa                	mv	a5,a0
    80007db6:	0007d463          	bgez	a5,80007dbe <sys_link+0x40>
    return -1;
    80007dba:	57fd                	li	a5,-1
    80007dbc:	aab5                	j	80007f38 <sys_link+0x1ba>

  begin_op();
    80007dbe:	ffffe097          	auipc	ra,0xffffe
    80007dc2:	6b4080e7          	jalr	1716(ra) # 80006472 <begin_op>
  if((ip = namei(old)) == 0){
    80007dc6:	ed040793          	addi	a5,s0,-304
    80007dca:	853e                	mv	a0,a5
    80007dcc:	ffffe097          	auipc	ra,0xffffe
    80007dd0:	342080e7          	jalr	834(ra) # 8000610e <namei>
    80007dd4:	fea43423          	sd	a0,-24(s0)
    80007dd8:	fe843783          	ld	a5,-24(s0)
    80007ddc:	e799                	bnez	a5,80007dea <sys_link+0x6c>
    end_op();
    80007dde:	ffffe097          	auipc	ra,0xffffe
    80007de2:	756080e7          	jalr	1878(ra) # 80006534 <end_op>
    return -1;
    80007de6:	57fd                	li	a5,-1
    80007de8:	aa81                	j	80007f38 <sys_link+0x1ba>
  }

  ilock(ip);
    80007dea:	fe843503          	ld	a0,-24(s0)
    80007dee:	ffffd097          	auipc	ra,0xffffd
    80007df2:	5fa080e7          	jalr	1530(ra) # 800053e8 <ilock>
  if(ip->type == T_DIR){
    80007df6:	fe843783          	ld	a5,-24(s0)
    80007dfa:	04479783          	lh	a5,68(a5)
    80007dfe:	0007871b          	sext.w	a4,a5
    80007e02:	4785                	li	a5,1
    80007e04:	00f71e63          	bne	a4,a5,80007e20 <sys_link+0xa2>
    iunlockput(ip);
    80007e08:	fe843503          	ld	a0,-24(s0)
    80007e0c:	ffffe097          	auipc	ra,0xffffe
    80007e10:	83a080e7          	jalr	-1990(ra) # 80005646 <iunlockput>
    end_op();
    80007e14:	ffffe097          	auipc	ra,0xffffe
    80007e18:	720080e7          	jalr	1824(ra) # 80006534 <end_op>
    return -1;
    80007e1c:	57fd                	li	a5,-1
    80007e1e:	aa29                	j	80007f38 <sys_link+0x1ba>
  }

  ip->nlink++;
    80007e20:	fe843783          	ld	a5,-24(s0)
    80007e24:	04a79783          	lh	a5,74(a5)
    80007e28:	17c2                	slli	a5,a5,0x30
    80007e2a:	93c1                	srli	a5,a5,0x30
    80007e2c:	2785                	addiw	a5,a5,1
    80007e2e:	17c2                	slli	a5,a5,0x30
    80007e30:	93c1                	srli	a5,a5,0x30
    80007e32:	0107971b          	slliw	a4,a5,0x10
    80007e36:	4107571b          	sraiw	a4,a4,0x10
    80007e3a:	fe843783          	ld	a5,-24(s0)
    80007e3e:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007e42:	fe843503          	ld	a0,-24(s0)
    80007e46:	ffffd097          	auipc	ra,0xffffd
    80007e4a:	352080e7          	jalr	850(ra) # 80005198 <iupdate>
  iunlock(ip);
    80007e4e:	fe843503          	ld	a0,-24(s0)
    80007e52:	ffffd097          	auipc	ra,0xffffd
    80007e56:	6ca080e7          	jalr	1738(ra) # 8000551c <iunlock>

  if((dp = nameiparent(new, name)) == 0)
    80007e5a:	fd040713          	addi	a4,s0,-48
    80007e5e:	f5040793          	addi	a5,s0,-176
    80007e62:	85ba                	mv	a1,a4
    80007e64:	853e                	mv	a0,a5
    80007e66:	ffffe097          	auipc	ra,0xffffe
    80007e6a:	2d4080e7          	jalr	724(ra) # 8000613a <nameiparent>
    80007e6e:	fea43023          	sd	a0,-32(s0)
    80007e72:	fe043783          	ld	a5,-32(s0)
    80007e76:	cba5                	beqz	a5,80007ee6 <sys_link+0x168>
    goto bad;
  ilock(dp);
    80007e78:	fe043503          	ld	a0,-32(s0)
    80007e7c:	ffffd097          	auipc	ra,0xffffd
    80007e80:	56c080e7          	jalr	1388(ra) # 800053e8 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    80007e84:	fe043783          	ld	a5,-32(s0)
    80007e88:	4398                	lw	a4,0(a5)
    80007e8a:	fe843783          	ld	a5,-24(s0)
    80007e8e:	439c                	lw	a5,0(a5)
    80007e90:	02f71263          	bne	a4,a5,80007eb4 <sys_link+0x136>
    80007e94:	fe843783          	ld	a5,-24(s0)
    80007e98:	43d8                	lw	a4,4(a5)
    80007e9a:	fd040793          	addi	a5,s0,-48
    80007e9e:	863a                	mv	a2,a4
    80007ea0:	85be                	mv	a1,a5
    80007ea2:	fe043503          	ld	a0,-32(s0)
    80007ea6:	ffffe097          	auipc	ra,0xffffe
    80007eaa:	f5a080e7          	jalr	-166(ra) # 80005e00 <dirlink>
    80007eae:	87aa                	mv	a5,a0
    80007eb0:	0007d963          	bgez	a5,80007ec2 <sys_link+0x144>
    iunlockput(dp);
    80007eb4:	fe043503          	ld	a0,-32(s0)
    80007eb8:	ffffd097          	auipc	ra,0xffffd
    80007ebc:	78e080e7          	jalr	1934(ra) # 80005646 <iunlockput>
    goto bad;
    80007ec0:	a025                	j	80007ee8 <sys_link+0x16a>
  }
  iunlockput(dp);
    80007ec2:	fe043503          	ld	a0,-32(s0)
    80007ec6:	ffffd097          	auipc	ra,0xffffd
    80007eca:	780080e7          	jalr	1920(ra) # 80005646 <iunlockput>
  iput(ip);
    80007ece:	fe843503          	ld	a0,-24(s0)
    80007ed2:	ffffd097          	auipc	ra,0xffffd
    80007ed6:	6a4080e7          	jalr	1700(ra) # 80005576 <iput>

  end_op();
    80007eda:	ffffe097          	auipc	ra,0xffffe
    80007ede:	65a080e7          	jalr	1626(ra) # 80006534 <end_op>

  return 0;
    80007ee2:	4781                	li	a5,0
    80007ee4:	a891                	j	80007f38 <sys_link+0x1ba>
    goto bad;
    80007ee6:	0001                	nop

bad:
  ilock(ip);
    80007ee8:	fe843503          	ld	a0,-24(s0)
    80007eec:	ffffd097          	auipc	ra,0xffffd
    80007ef0:	4fc080e7          	jalr	1276(ra) # 800053e8 <ilock>
  ip->nlink--;
    80007ef4:	fe843783          	ld	a5,-24(s0)
    80007ef8:	04a79783          	lh	a5,74(a5)
    80007efc:	17c2                	slli	a5,a5,0x30
    80007efe:	93c1                	srli	a5,a5,0x30
    80007f00:	37fd                	addiw	a5,a5,-1
    80007f02:	17c2                	slli	a5,a5,0x30
    80007f04:	93c1                	srli	a5,a5,0x30
    80007f06:	0107971b          	slliw	a4,a5,0x10
    80007f0a:	4107571b          	sraiw	a4,a4,0x10
    80007f0e:	fe843783          	ld	a5,-24(s0)
    80007f12:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    80007f16:	fe843503          	ld	a0,-24(s0)
    80007f1a:	ffffd097          	auipc	ra,0xffffd
    80007f1e:	27e080e7          	jalr	638(ra) # 80005198 <iupdate>
  iunlockput(ip);
    80007f22:	fe843503          	ld	a0,-24(s0)
    80007f26:	ffffd097          	auipc	ra,0xffffd
    80007f2a:	720080e7          	jalr	1824(ra) # 80005646 <iunlockput>
  end_op();
    80007f2e:	ffffe097          	auipc	ra,0xffffe
    80007f32:	606080e7          	jalr	1542(ra) # 80006534 <end_op>
  return -1;
    80007f36:	57fd                	li	a5,-1
}
    80007f38:	853e                	mv	a0,a5
    80007f3a:	70b2                	ld	ra,296(sp)
    80007f3c:	7412                	ld	s0,288(sp)
    80007f3e:	6155                	addi	sp,sp,304
    80007f40:	8082                	ret

0000000080007f42 <isdirempty>:

// Is the directory dp empty except for "." and ".." ?
static int
isdirempty(struct inode *dp)
{
    80007f42:	7139                	addi	sp,sp,-64
    80007f44:	fc06                	sd	ra,56(sp)
    80007f46:	f822                	sd	s0,48(sp)
    80007f48:	0080                	addi	s0,sp,64
    80007f4a:	fca43423          	sd	a0,-56(s0)
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007f4e:	02000793          	li	a5,32
    80007f52:	fef42623          	sw	a5,-20(s0)
    80007f56:	a0b1                	j	80007fa2 <isdirempty+0x60>
    if(readi(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    80007f58:	fd840793          	addi	a5,s0,-40
    80007f5c:	fec42683          	lw	a3,-20(s0)
    80007f60:	4741                	li	a4,16
    80007f62:	863e                	mv	a2,a5
    80007f64:	4581                	li	a1,0
    80007f66:	fc843503          	ld	a0,-56(s0)
    80007f6a:	ffffe097          	auipc	ra,0xffffe
    80007f6e:	a34080e7          	jalr	-1484(ra) # 8000599e <readi>
    80007f72:	87aa                	mv	a5,a0
    80007f74:	873e                	mv	a4,a5
    80007f76:	47c1                	li	a5,16
    80007f78:	00f70a63          	beq	a4,a5,80007f8c <isdirempty+0x4a>
      panic("isdirempty: readi");
    80007f7c:	00004517          	auipc	a0,0x4
    80007f80:	6a450513          	addi	a0,a0,1700 # 8000c620 <etext+0x620>
    80007f84:	ffff9097          	auipc	ra,0xffff9
    80007f88:	d08080e7          	jalr	-760(ra) # 80000c8c <panic>
    if(de.inum != 0)
    80007f8c:	fd845783          	lhu	a5,-40(s0)
    80007f90:	c399                	beqz	a5,80007f96 <isdirempty+0x54>
      return 0;
    80007f92:	4781                	li	a5,0
    80007f94:	a839                	j	80007fb2 <isdirempty+0x70>
  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    80007f96:	fec42783          	lw	a5,-20(s0)
    80007f9a:	27c1                	addiw	a5,a5,16
    80007f9c:	2781                	sext.w	a5,a5
    80007f9e:	fef42623          	sw	a5,-20(s0)
    80007fa2:	fc843783          	ld	a5,-56(s0)
    80007fa6:	47f8                	lw	a4,76(a5)
    80007fa8:	fec42783          	lw	a5,-20(s0)
    80007fac:	fae7e6e3          	bltu	a5,a4,80007f58 <isdirempty+0x16>
  }
  return 1;
    80007fb0:	4785                	li	a5,1
}
    80007fb2:	853e                	mv	a0,a5
    80007fb4:	70e2                	ld	ra,56(sp)
    80007fb6:	7442                	ld	s0,48(sp)
    80007fb8:	6121                	addi	sp,sp,64
    80007fba:	8082                	ret

0000000080007fbc <sys_unlink>:

uint64
sys_unlink(void)
{
    80007fbc:	7155                	addi	sp,sp,-208
    80007fbe:	e586                	sd	ra,200(sp)
    80007fc0:	e1a2                	sd	s0,192(sp)
    80007fc2:	0980                	addi	s0,sp,208
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], path[MAXPATH];
  uint off;

  if(argstr(0, path, MAXPATH) < 0)
    80007fc4:	f4040793          	addi	a5,s0,-192
    80007fc8:	08000613          	li	a2,128
    80007fcc:	85be                	mv	a1,a5
    80007fce:	4501                	li	a0,0
    80007fd0:	ffffc097          	auipc	ra,0xffffc
    80007fd4:	4d8080e7          	jalr	1240(ra) # 800044a8 <argstr>
    80007fd8:	87aa                	mv	a5,a0
    80007fda:	0007d463          	bgez	a5,80007fe2 <sys_unlink+0x26>
    return -1;
    80007fde:	57fd                	li	a5,-1
    80007fe0:	a2ed                	j	800081ca <sys_unlink+0x20e>

  begin_op();
    80007fe2:	ffffe097          	auipc	ra,0xffffe
    80007fe6:	490080e7          	jalr	1168(ra) # 80006472 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
    80007fea:	fc040713          	addi	a4,s0,-64
    80007fee:	f4040793          	addi	a5,s0,-192
    80007ff2:	85ba                	mv	a1,a4
    80007ff4:	853e                	mv	a0,a5
    80007ff6:	ffffe097          	auipc	ra,0xffffe
    80007ffa:	144080e7          	jalr	324(ra) # 8000613a <nameiparent>
    80007ffe:	fea43423          	sd	a0,-24(s0)
    80008002:	fe843783          	ld	a5,-24(s0)
    80008006:	e799                	bnez	a5,80008014 <sys_unlink+0x58>
    end_op();
    80008008:	ffffe097          	auipc	ra,0xffffe
    8000800c:	52c080e7          	jalr	1324(ra) # 80006534 <end_op>
    return -1;
    80008010:	57fd                	li	a5,-1
    80008012:	aa65                	j	800081ca <sys_unlink+0x20e>
  }

  ilock(dp);
    80008014:	fe843503          	ld	a0,-24(s0)
    80008018:	ffffd097          	auipc	ra,0xffffd
    8000801c:	3d0080e7          	jalr	976(ra) # 800053e8 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
    80008020:	fc040793          	addi	a5,s0,-64
    80008024:	00004597          	auipc	a1,0x4
    80008028:	61458593          	addi	a1,a1,1556 # 8000c638 <etext+0x638>
    8000802c:	853e                	mv	a0,a5
    8000802e:	ffffe097          	auipc	ra,0xffffe
    80008032:	cbc080e7          	jalr	-836(ra) # 80005cea <namecmp>
    80008036:	87aa                	mv	a5,a0
    80008038:	16078b63          	beqz	a5,800081ae <sys_unlink+0x1f2>
    8000803c:	fc040793          	addi	a5,s0,-64
    80008040:	00004597          	auipc	a1,0x4
    80008044:	60058593          	addi	a1,a1,1536 # 8000c640 <etext+0x640>
    80008048:	853e                	mv	a0,a5
    8000804a:	ffffe097          	auipc	ra,0xffffe
    8000804e:	ca0080e7          	jalr	-864(ra) # 80005cea <namecmp>
    80008052:	87aa                	mv	a5,a0
    80008054:	14078d63          	beqz	a5,800081ae <sys_unlink+0x1f2>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
    80008058:	f3c40713          	addi	a4,s0,-196
    8000805c:	fc040793          	addi	a5,s0,-64
    80008060:	863a                	mv	a2,a4
    80008062:	85be                	mv	a1,a5
    80008064:	fe843503          	ld	a0,-24(s0)
    80008068:	ffffe097          	auipc	ra,0xffffe
    8000806c:	cb0080e7          	jalr	-848(ra) # 80005d18 <dirlookup>
    80008070:	fea43023          	sd	a0,-32(s0)
    80008074:	fe043783          	ld	a5,-32(s0)
    80008078:	12078d63          	beqz	a5,800081b2 <sys_unlink+0x1f6>
    goto bad;
  ilock(ip);
    8000807c:	fe043503          	ld	a0,-32(s0)
    80008080:	ffffd097          	auipc	ra,0xffffd
    80008084:	368080e7          	jalr	872(ra) # 800053e8 <ilock>

  if(ip->nlink < 1)
    80008088:	fe043783          	ld	a5,-32(s0)
    8000808c:	04a79783          	lh	a5,74(a5)
    80008090:	2781                	sext.w	a5,a5
    80008092:	00f04a63          	bgtz	a5,800080a6 <sys_unlink+0xea>
    panic("unlink: nlink < 1");
    80008096:	00004517          	auipc	a0,0x4
    8000809a:	5b250513          	addi	a0,a0,1458 # 8000c648 <etext+0x648>
    8000809e:	ffff9097          	auipc	ra,0xffff9
    800080a2:	bee080e7          	jalr	-1042(ra) # 80000c8c <panic>
  if(ip->type == T_DIR && !isdirempty(ip)){
    800080a6:	fe043783          	ld	a5,-32(s0)
    800080aa:	04479783          	lh	a5,68(a5)
    800080ae:	0007871b          	sext.w	a4,a5
    800080b2:	4785                	li	a5,1
    800080b4:	02f71163          	bne	a4,a5,800080d6 <sys_unlink+0x11a>
    800080b8:	fe043503          	ld	a0,-32(s0)
    800080bc:	00000097          	auipc	ra,0x0
    800080c0:	e86080e7          	jalr	-378(ra) # 80007f42 <isdirempty>
    800080c4:	87aa                	mv	a5,a0
    800080c6:	eb81                	bnez	a5,800080d6 <sys_unlink+0x11a>
    iunlockput(ip);
    800080c8:	fe043503          	ld	a0,-32(s0)
    800080cc:	ffffd097          	auipc	ra,0xffffd
    800080d0:	57a080e7          	jalr	1402(ra) # 80005646 <iunlockput>
    goto bad;
    800080d4:	a0c5                	j	800081b4 <sys_unlink+0x1f8>
  }

  memset(&de, 0, sizeof(de));
    800080d6:	fd040793          	addi	a5,s0,-48
    800080da:	4641                	li	a2,16
    800080dc:	4581                	li	a1,0
    800080de:	853e                	mv	a0,a5
    800080e0:	ffff9097          	auipc	ra,0xffff9
    800080e4:	41e080e7          	jalr	1054(ra) # 800014fe <memset>
  if(writei(dp, 0, (uint64)&de, off, sizeof(de)) != sizeof(de))
    800080e8:	fd040793          	addi	a5,s0,-48
    800080ec:	f3c42683          	lw	a3,-196(s0)
    800080f0:	4741                	li	a4,16
    800080f2:	863e                	mv	a2,a5
    800080f4:	4581                	li	a1,0
    800080f6:	fe843503          	ld	a0,-24(s0)
    800080fa:	ffffe097          	auipc	ra,0xffffe
    800080fe:	a3c080e7          	jalr	-1476(ra) # 80005b36 <writei>
    80008102:	87aa                	mv	a5,a0
    80008104:	873e                	mv	a4,a5
    80008106:	47c1                	li	a5,16
    80008108:	00f70a63          	beq	a4,a5,8000811c <sys_unlink+0x160>
    panic("unlink: writei");
    8000810c:	00004517          	auipc	a0,0x4
    80008110:	55450513          	addi	a0,a0,1364 # 8000c660 <etext+0x660>
    80008114:	ffff9097          	auipc	ra,0xffff9
    80008118:	b78080e7          	jalr	-1160(ra) # 80000c8c <panic>
  if(ip->type == T_DIR){
    8000811c:	fe043783          	ld	a5,-32(s0)
    80008120:	04479783          	lh	a5,68(a5)
    80008124:	0007871b          	sext.w	a4,a5
    80008128:	4785                	li	a5,1
    8000812a:	02f71963          	bne	a4,a5,8000815c <sys_unlink+0x1a0>
    dp->nlink--;
    8000812e:	fe843783          	ld	a5,-24(s0)
    80008132:	04a79783          	lh	a5,74(a5)
    80008136:	17c2                	slli	a5,a5,0x30
    80008138:	93c1                	srli	a5,a5,0x30
    8000813a:	37fd                	addiw	a5,a5,-1
    8000813c:	17c2                	slli	a5,a5,0x30
    8000813e:	93c1                	srli	a5,a5,0x30
    80008140:	0107971b          	slliw	a4,a5,0x10
    80008144:	4107571b          	sraiw	a4,a4,0x10
    80008148:	fe843783          	ld	a5,-24(s0)
    8000814c:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    80008150:	fe843503          	ld	a0,-24(s0)
    80008154:	ffffd097          	auipc	ra,0xffffd
    80008158:	044080e7          	jalr	68(ra) # 80005198 <iupdate>
  }
  iunlockput(dp);
    8000815c:	fe843503          	ld	a0,-24(s0)
    80008160:	ffffd097          	auipc	ra,0xffffd
    80008164:	4e6080e7          	jalr	1254(ra) # 80005646 <iunlockput>

  ip->nlink--;
    80008168:	fe043783          	ld	a5,-32(s0)
    8000816c:	04a79783          	lh	a5,74(a5)
    80008170:	17c2                	slli	a5,a5,0x30
    80008172:	93c1                	srli	a5,a5,0x30
    80008174:	37fd                	addiw	a5,a5,-1
    80008176:	17c2                	slli	a5,a5,0x30
    80008178:	93c1                	srli	a5,a5,0x30
    8000817a:	0107971b          	slliw	a4,a5,0x10
    8000817e:	4107571b          	sraiw	a4,a4,0x10
    80008182:	fe043783          	ld	a5,-32(s0)
    80008186:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    8000818a:	fe043503          	ld	a0,-32(s0)
    8000818e:	ffffd097          	auipc	ra,0xffffd
    80008192:	00a080e7          	jalr	10(ra) # 80005198 <iupdate>
  iunlockput(ip);
    80008196:	fe043503          	ld	a0,-32(s0)
    8000819a:	ffffd097          	auipc	ra,0xffffd
    8000819e:	4ac080e7          	jalr	1196(ra) # 80005646 <iunlockput>

  end_op();
    800081a2:	ffffe097          	auipc	ra,0xffffe
    800081a6:	392080e7          	jalr	914(ra) # 80006534 <end_op>

  return 0;
    800081aa:	4781                	li	a5,0
    800081ac:	a839                	j	800081ca <sys_unlink+0x20e>
    goto bad;
    800081ae:	0001                	nop
    800081b0:	a011                	j	800081b4 <sys_unlink+0x1f8>
    goto bad;
    800081b2:	0001                	nop

bad:
  iunlockput(dp);
    800081b4:	fe843503          	ld	a0,-24(s0)
    800081b8:	ffffd097          	auipc	ra,0xffffd
    800081bc:	48e080e7          	jalr	1166(ra) # 80005646 <iunlockput>
  end_op();
    800081c0:	ffffe097          	auipc	ra,0xffffe
    800081c4:	374080e7          	jalr	884(ra) # 80006534 <end_op>
  return -1;
    800081c8:	57fd                	li	a5,-1
}
    800081ca:	853e                	mv	a0,a5
    800081cc:	60ae                	ld	ra,200(sp)
    800081ce:	640e                	ld	s0,192(sp)
    800081d0:	6169                	addi	sp,sp,208
    800081d2:	8082                	ret

00000000800081d4 <create>:

static struct inode*
create(char *path, short type, short major, short minor)
{
    800081d4:	7139                	addi	sp,sp,-64
    800081d6:	fc06                	sd	ra,56(sp)
    800081d8:	f822                	sd	s0,48(sp)
    800081da:	0080                	addi	s0,sp,64
    800081dc:	fca43423          	sd	a0,-56(s0)
    800081e0:	87ae                	mv	a5,a1
    800081e2:	8736                	mv	a4,a3
    800081e4:	fcf41323          	sh	a5,-58(s0)
    800081e8:	87b2                	mv	a5,a2
    800081ea:	fcf41223          	sh	a5,-60(s0)
    800081ee:	87ba                	mv	a5,a4
    800081f0:	fcf41123          	sh	a5,-62(s0)
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    800081f4:	fd040793          	addi	a5,s0,-48
    800081f8:	85be                	mv	a1,a5
    800081fa:	fc843503          	ld	a0,-56(s0)
    800081fe:	ffffe097          	auipc	ra,0xffffe
    80008202:	f3c080e7          	jalr	-196(ra) # 8000613a <nameiparent>
    80008206:	fea43423          	sd	a0,-24(s0)
    8000820a:	fe843783          	ld	a5,-24(s0)
    8000820e:	e399                	bnez	a5,80008214 <create+0x40>
    return 0;
    80008210:	4781                	li	a5,0
    80008212:	a2ed                	j	800083fc <create+0x228>

  ilock(dp);
    80008214:	fe843503          	ld	a0,-24(s0)
    80008218:	ffffd097          	auipc	ra,0xffffd
    8000821c:	1d0080e7          	jalr	464(ra) # 800053e8 <ilock>

  if((ip = dirlookup(dp, name, 0)) != 0){
    80008220:	fd040793          	addi	a5,s0,-48
    80008224:	4601                	li	a2,0
    80008226:	85be                	mv	a1,a5
    80008228:	fe843503          	ld	a0,-24(s0)
    8000822c:	ffffe097          	auipc	ra,0xffffe
    80008230:	aec080e7          	jalr	-1300(ra) # 80005d18 <dirlookup>
    80008234:	fea43023          	sd	a0,-32(s0)
    80008238:	fe043783          	ld	a5,-32(s0)
    8000823c:	c3ad                	beqz	a5,8000829e <create+0xca>
    iunlockput(dp);
    8000823e:	fe843503          	ld	a0,-24(s0)
    80008242:	ffffd097          	auipc	ra,0xffffd
    80008246:	404080e7          	jalr	1028(ra) # 80005646 <iunlockput>
    ilock(ip);
    8000824a:	fe043503          	ld	a0,-32(s0)
    8000824e:	ffffd097          	auipc	ra,0xffffd
    80008252:	19a080e7          	jalr	410(ra) # 800053e8 <ilock>
    if(type == T_FILE && (ip->type == T_FILE || ip->type == T_DEVICE))
    80008256:	fc641783          	lh	a5,-58(s0)
    8000825a:	0007871b          	sext.w	a4,a5
    8000825e:	4789                	li	a5,2
    80008260:	02f71763          	bne	a4,a5,8000828e <create+0xba>
    80008264:	fe043783          	ld	a5,-32(s0)
    80008268:	04479783          	lh	a5,68(a5)
    8000826c:	0007871b          	sext.w	a4,a5
    80008270:	4789                	li	a5,2
    80008272:	00f70b63          	beq	a4,a5,80008288 <create+0xb4>
    80008276:	fe043783          	ld	a5,-32(s0)
    8000827a:	04479783          	lh	a5,68(a5)
    8000827e:	0007871b          	sext.w	a4,a5
    80008282:	478d                	li	a5,3
    80008284:	00f71563          	bne	a4,a5,8000828e <create+0xba>
      return ip;
    80008288:	fe043783          	ld	a5,-32(s0)
    8000828c:	aa85                	j	800083fc <create+0x228>
    iunlockput(ip);
    8000828e:	fe043503          	ld	a0,-32(s0)
    80008292:	ffffd097          	auipc	ra,0xffffd
    80008296:	3b4080e7          	jalr	948(ra) # 80005646 <iunlockput>
    return 0;
    8000829a:	4781                	li	a5,0
    8000829c:	a285                	j	800083fc <create+0x228>
  }

  if((ip = ialloc(dp->dev, type)) == 0){
    8000829e:	fe843783          	ld	a5,-24(s0)
    800082a2:	439c                	lw	a5,0(a5)
    800082a4:	fc641703          	lh	a4,-58(s0)
    800082a8:	85ba                	mv	a1,a4
    800082aa:	853e                	mv	a0,a5
    800082ac:	ffffd097          	auipc	ra,0xffffd
    800082b0:	dee080e7          	jalr	-530(ra) # 8000509a <ialloc>
    800082b4:	fea43023          	sd	a0,-32(s0)
    800082b8:	fe043783          	ld	a5,-32(s0)
    800082bc:	eb89                	bnez	a5,800082ce <create+0xfa>
    iunlockput(dp);
    800082be:	fe843503          	ld	a0,-24(s0)
    800082c2:	ffffd097          	auipc	ra,0xffffd
    800082c6:	384080e7          	jalr	900(ra) # 80005646 <iunlockput>
    return 0;
    800082ca:	4781                	li	a5,0
    800082cc:	aa05                	j	800083fc <create+0x228>
  }

  ilock(ip);
    800082ce:	fe043503          	ld	a0,-32(s0)
    800082d2:	ffffd097          	auipc	ra,0xffffd
    800082d6:	116080e7          	jalr	278(ra) # 800053e8 <ilock>
  ip->major = major;
    800082da:	fe043783          	ld	a5,-32(s0)
    800082de:	fc445703          	lhu	a4,-60(s0)
    800082e2:	04e79323          	sh	a4,70(a5)
  ip->minor = minor;
    800082e6:	fe043783          	ld	a5,-32(s0)
    800082ea:	fc245703          	lhu	a4,-62(s0)
    800082ee:	04e79423          	sh	a4,72(a5)
  ip->nlink = 1;
    800082f2:	fe043783          	ld	a5,-32(s0)
    800082f6:	4705                	li	a4,1
    800082f8:	04e79523          	sh	a4,74(a5)
  iupdate(ip);
    800082fc:	fe043503          	ld	a0,-32(s0)
    80008300:	ffffd097          	auipc	ra,0xffffd
    80008304:	e98080e7          	jalr	-360(ra) # 80005198 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
    80008308:	fc641783          	lh	a5,-58(s0)
    8000830c:	0007871b          	sext.w	a4,a5
    80008310:	4785                	li	a5,1
    80008312:	04f71463          	bne	a4,a5,8000835a <create+0x186>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
    80008316:	fe043783          	ld	a5,-32(s0)
    8000831a:	43dc                	lw	a5,4(a5)
    8000831c:	863e                	mv	a2,a5
    8000831e:	00004597          	auipc	a1,0x4
    80008322:	31a58593          	addi	a1,a1,794 # 8000c638 <etext+0x638>
    80008326:	fe043503          	ld	a0,-32(s0)
    8000832a:	ffffe097          	auipc	ra,0xffffe
    8000832e:	ad6080e7          	jalr	-1322(ra) # 80005e00 <dirlink>
    80008332:	87aa                	mv	a5,a0
    80008334:	0807ca63          	bltz	a5,800083c8 <create+0x1f4>
    80008338:	fe843783          	ld	a5,-24(s0)
    8000833c:	43dc                	lw	a5,4(a5)
    8000833e:	863e                	mv	a2,a5
    80008340:	00004597          	auipc	a1,0x4
    80008344:	30058593          	addi	a1,a1,768 # 8000c640 <etext+0x640>
    80008348:	fe043503          	ld	a0,-32(s0)
    8000834c:	ffffe097          	auipc	ra,0xffffe
    80008350:	ab4080e7          	jalr	-1356(ra) # 80005e00 <dirlink>
    80008354:	87aa                	mv	a5,a0
    80008356:	0607c963          	bltz	a5,800083c8 <create+0x1f4>
      goto fail;
  }

  if(dirlink(dp, name, ip->inum) < 0)
    8000835a:	fe043783          	ld	a5,-32(s0)
    8000835e:	43d8                	lw	a4,4(a5)
    80008360:	fd040793          	addi	a5,s0,-48
    80008364:	863a                	mv	a2,a4
    80008366:	85be                	mv	a1,a5
    80008368:	fe843503          	ld	a0,-24(s0)
    8000836c:	ffffe097          	auipc	ra,0xffffe
    80008370:	a94080e7          	jalr	-1388(ra) # 80005e00 <dirlink>
    80008374:	87aa                	mv	a5,a0
    80008376:	0407cb63          	bltz	a5,800083cc <create+0x1f8>
    goto fail;

  if(type == T_DIR){
    8000837a:	fc641783          	lh	a5,-58(s0)
    8000837e:	0007871b          	sext.w	a4,a5
    80008382:	4785                	li	a5,1
    80008384:	02f71963          	bne	a4,a5,800083b6 <create+0x1e2>
    // now that success is guaranteed:
    dp->nlink++;  // for ".."
    80008388:	fe843783          	ld	a5,-24(s0)
    8000838c:	04a79783          	lh	a5,74(a5)
    80008390:	17c2                	slli	a5,a5,0x30
    80008392:	93c1                	srli	a5,a5,0x30
    80008394:	2785                	addiw	a5,a5,1
    80008396:	17c2                	slli	a5,a5,0x30
    80008398:	93c1                	srli	a5,a5,0x30
    8000839a:	0107971b          	slliw	a4,a5,0x10
    8000839e:	4107571b          	sraiw	a4,a4,0x10
    800083a2:	fe843783          	ld	a5,-24(s0)
    800083a6:	04e79523          	sh	a4,74(a5)
    iupdate(dp);
    800083aa:	fe843503          	ld	a0,-24(s0)
    800083ae:	ffffd097          	auipc	ra,0xffffd
    800083b2:	dea080e7          	jalr	-534(ra) # 80005198 <iupdate>
  }

  iunlockput(dp);
    800083b6:	fe843503          	ld	a0,-24(s0)
    800083ba:	ffffd097          	auipc	ra,0xffffd
    800083be:	28c080e7          	jalr	652(ra) # 80005646 <iunlockput>

  return ip;
    800083c2:	fe043783          	ld	a5,-32(s0)
    800083c6:	a81d                	j	800083fc <create+0x228>
      goto fail;
    800083c8:	0001                	nop
    800083ca:	a011                	j	800083ce <create+0x1fa>
    goto fail;
    800083cc:	0001                	nop

 fail:
  // something went wrong. de-allocate ip.
  ip->nlink = 0;
    800083ce:	fe043783          	ld	a5,-32(s0)
    800083d2:	04079523          	sh	zero,74(a5)
  iupdate(ip);
    800083d6:	fe043503          	ld	a0,-32(s0)
    800083da:	ffffd097          	auipc	ra,0xffffd
    800083de:	dbe080e7          	jalr	-578(ra) # 80005198 <iupdate>
  iunlockput(ip);
    800083e2:	fe043503          	ld	a0,-32(s0)
    800083e6:	ffffd097          	auipc	ra,0xffffd
    800083ea:	260080e7          	jalr	608(ra) # 80005646 <iunlockput>
  iunlockput(dp);
    800083ee:	fe843503          	ld	a0,-24(s0)
    800083f2:	ffffd097          	auipc	ra,0xffffd
    800083f6:	254080e7          	jalr	596(ra) # 80005646 <iunlockput>
  return 0;
    800083fa:	4781                	li	a5,0
}
    800083fc:	853e                	mv	a0,a5
    800083fe:	70e2                	ld	ra,56(sp)
    80008400:	7442                	ld	s0,48(sp)
    80008402:	6121                	addi	sp,sp,64
    80008404:	8082                	ret

0000000080008406 <sys_open>:

uint64
sys_open(void)
{
    80008406:	7131                	addi	sp,sp,-192
    80008408:	fd06                	sd	ra,184(sp)
    8000840a:	f922                	sd	s0,176(sp)
    8000840c:	0180                	addi	s0,sp,192
  int fd, omode;
  struct file *f;
  struct inode *ip;
  int n;

  argint(1, &omode);
    8000840e:	f4c40793          	addi	a5,s0,-180
    80008412:	85be                	mv	a1,a5
    80008414:	4505                	li	a0,1
    80008416:	ffffc097          	auipc	ra,0xffffc
    8000841a:	02a080e7          	jalr	42(ra) # 80004440 <argint>
  if((n = argstr(0, path, MAXPATH)) < 0)
    8000841e:	f5040793          	addi	a5,s0,-176
    80008422:	08000613          	li	a2,128
    80008426:	85be                	mv	a1,a5
    80008428:	4501                	li	a0,0
    8000842a:	ffffc097          	auipc	ra,0xffffc
    8000842e:	07e080e7          	jalr	126(ra) # 800044a8 <argstr>
    80008432:	87aa                	mv	a5,a0
    80008434:	fef42223          	sw	a5,-28(s0)
    80008438:	fe442783          	lw	a5,-28(s0)
    8000843c:	2781                	sext.w	a5,a5
    8000843e:	0007d463          	bgez	a5,80008446 <sys_open+0x40>
    return -1;
    80008442:	57fd                	li	a5,-1
    80008444:	a429                	j	8000864e <sys_open+0x248>

  begin_op();
    80008446:	ffffe097          	auipc	ra,0xffffe
    8000844a:	02c080e7          	jalr	44(ra) # 80006472 <begin_op>

  if(omode & O_CREATE){
    8000844e:	f4c42783          	lw	a5,-180(s0)
    80008452:	2007f793          	andi	a5,a5,512
    80008456:	2781                	sext.w	a5,a5
    80008458:	c795                	beqz	a5,80008484 <sys_open+0x7e>
    ip = create(path, T_FILE, 0, 0);
    8000845a:	f5040793          	addi	a5,s0,-176
    8000845e:	4681                	li	a3,0
    80008460:	4601                	li	a2,0
    80008462:	4589                	li	a1,2
    80008464:	853e                	mv	a0,a5
    80008466:	00000097          	auipc	ra,0x0
    8000846a:	d6e080e7          	jalr	-658(ra) # 800081d4 <create>
    8000846e:	fea43423          	sd	a0,-24(s0)
    if(ip == 0){
    80008472:	fe843783          	ld	a5,-24(s0)
    80008476:	e7bd                	bnez	a5,800084e4 <sys_open+0xde>
      end_op();
    80008478:	ffffe097          	auipc	ra,0xffffe
    8000847c:	0bc080e7          	jalr	188(ra) # 80006534 <end_op>
      return -1;
    80008480:	57fd                	li	a5,-1
    80008482:	a2f1                	j	8000864e <sys_open+0x248>
    }
  } else {
    if((ip = namei(path)) == 0){
    80008484:	f5040793          	addi	a5,s0,-176
    80008488:	853e                	mv	a0,a5
    8000848a:	ffffe097          	auipc	ra,0xffffe
    8000848e:	c84080e7          	jalr	-892(ra) # 8000610e <namei>
    80008492:	fea43423          	sd	a0,-24(s0)
    80008496:	fe843783          	ld	a5,-24(s0)
    8000849a:	e799                	bnez	a5,800084a8 <sys_open+0xa2>
      end_op();
    8000849c:	ffffe097          	auipc	ra,0xffffe
    800084a0:	098080e7          	jalr	152(ra) # 80006534 <end_op>
      return -1;
    800084a4:	57fd                	li	a5,-1
    800084a6:	a265                	j	8000864e <sys_open+0x248>
    }
    ilock(ip);
    800084a8:	fe843503          	ld	a0,-24(s0)
    800084ac:	ffffd097          	auipc	ra,0xffffd
    800084b0:	f3c080e7          	jalr	-196(ra) # 800053e8 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
    800084b4:	fe843783          	ld	a5,-24(s0)
    800084b8:	04479783          	lh	a5,68(a5)
    800084bc:	0007871b          	sext.w	a4,a5
    800084c0:	4785                	li	a5,1
    800084c2:	02f71163          	bne	a4,a5,800084e4 <sys_open+0xde>
    800084c6:	f4c42783          	lw	a5,-180(s0)
    800084ca:	cf89                	beqz	a5,800084e4 <sys_open+0xde>
      iunlockput(ip);
    800084cc:	fe843503          	ld	a0,-24(s0)
    800084d0:	ffffd097          	auipc	ra,0xffffd
    800084d4:	176080e7          	jalr	374(ra) # 80005646 <iunlockput>
      end_op();
    800084d8:	ffffe097          	auipc	ra,0xffffe
    800084dc:	05c080e7          	jalr	92(ra) # 80006534 <end_op>
      return -1;
    800084e0:	57fd                	li	a5,-1
    800084e2:	a2b5                	j	8000864e <sys_open+0x248>
    }
  }

  if(ip->type == T_DEVICE && (ip->major < 0 || ip->major >= NDEV)){
    800084e4:	fe843783          	ld	a5,-24(s0)
    800084e8:	04479783          	lh	a5,68(a5)
    800084ec:	0007871b          	sext.w	a4,a5
    800084f0:	478d                	li	a5,3
    800084f2:	02f71e63          	bne	a4,a5,8000852e <sys_open+0x128>
    800084f6:	fe843783          	ld	a5,-24(s0)
    800084fa:	04679783          	lh	a5,70(a5)
    800084fe:	2781                	sext.w	a5,a5
    80008500:	0007cb63          	bltz	a5,80008516 <sys_open+0x110>
    80008504:	fe843783          	ld	a5,-24(s0)
    80008508:	04679783          	lh	a5,70(a5)
    8000850c:	0007871b          	sext.w	a4,a5
    80008510:	47a5                	li	a5,9
    80008512:	00e7de63          	bge	a5,a4,8000852e <sys_open+0x128>
    iunlockput(ip);
    80008516:	fe843503          	ld	a0,-24(s0)
    8000851a:	ffffd097          	auipc	ra,0xffffd
    8000851e:	12c080e7          	jalr	300(ra) # 80005646 <iunlockput>
    end_op();
    80008522:	ffffe097          	auipc	ra,0xffffe
    80008526:	012080e7          	jalr	18(ra) # 80006534 <end_op>
    return -1;
    8000852a:	57fd                	li	a5,-1
    8000852c:	a20d                	j	8000864e <sys_open+0x248>
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    8000852e:	ffffe097          	auipc	ra,0xffffe
    80008532:	4f4080e7          	jalr	1268(ra) # 80006a22 <filealloc>
    80008536:	fca43c23          	sd	a0,-40(s0)
    8000853a:	fd843783          	ld	a5,-40(s0)
    8000853e:	cf99                	beqz	a5,8000855c <sys_open+0x156>
    80008540:	fd843503          	ld	a0,-40(s0)
    80008544:	fffff097          	auipc	ra,0xfffff
    80008548:	5e8080e7          	jalr	1512(ra) # 80007b2c <fdalloc>
    8000854c:	87aa                	mv	a5,a0
    8000854e:	fcf42a23          	sw	a5,-44(s0)
    80008552:	fd442783          	lw	a5,-44(s0)
    80008556:	2781                	sext.w	a5,a5
    80008558:	0207d763          	bgez	a5,80008586 <sys_open+0x180>
    if(f)
    8000855c:	fd843783          	ld	a5,-40(s0)
    80008560:	c799                	beqz	a5,8000856e <sys_open+0x168>
      fileclose(f);
    80008562:	fd843503          	ld	a0,-40(s0)
    80008566:	ffffe097          	auipc	ra,0xffffe
    8000856a:	5a6080e7          	jalr	1446(ra) # 80006b0c <fileclose>
    iunlockput(ip);
    8000856e:	fe843503          	ld	a0,-24(s0)
    80008572:	ffffd097          	auipc	ra,0xffffd
    80008576:	0d4080e7          	jalr	212(ra) # 80005646 <iunlockput>
    end_op();
    8000857a:	ffffe097          	auipc	ra,0xffffe
    8000857e:	fba080e7          	jalr	-70(ra) # 80006534 <end_op>
    return -1;
    80008582:	57fd                	li	a5,-1
    80008584:	a0e9                	j	8000864e <sys_open+0x248>
  }

  if(ip->type == T_DEVICE){
    80008586:	fe843783          	ld	a5,-24(s0)
    8000858a:	04479783          	lh	a5,68(a5)
    8000858e:	0007871b          	sext.w	a4,a5
    80008592:	478d                	li	a5,3
    80008594:	00f71f63          	bne	a4,a5,800085b2 <sys_open+0x1ac>
    f->type = FD_DEVICE;
    80008598:	fd843783          	ld	a5,-40(s0)
    8000859c:	470d                	li	a4,3
    8000859e:	c398                	sw	a4,0(a5)
    f->major = ip->major;
    800085a0:	fe843783          	ld	a5,-24(s0)
    800085a4:	04679703          	lh	a4,70(a5)
    800085a8:	fd843783          	ld	a5,-40(s0)
    800085ac:	02e79223          	sh	a4,36(a5)
    800085b0:	a809                	j	800085c2 <sys_open+0x1bc>
  } else {
    f->type = FD_INODE;
    800085b2:	fd843783          	ld	a5,-40(s0)
    800085b6:	4709                	li	a4,2
    800085b8:	c398                	sw	a4,0(a5)
    f->off = 0;
    800085ba:	fd843783          	ld	a5,-40(s0)
    800085be:	0207a023          	sw	zero,32(a5)
  }
  f->ip = ip;
    800085c2:	fd843783          	ld	a5,-40(s0)
    800085c6:	fe843703          	ld	a4,-24(s0)
    800085ca:	ef98                	sd	a4,24(a5)
  f->readable = !(omode & O_WRONLY);
    800085cc:	f4c42783          	lw	a5,-180(s0)
    800085d0:	8b85                	andi	a5,a5,1
    800085d2:	2781                	sext.w	a5,a5
    800085d4:	0017b793          	seqz	a5,a5
    800085d8:	0ff7f793          	andi	a5,a5,255
    800085dc:	873e                	mv	a4,a5
    800085de:	fd843783          	ld	a5,-40(s0)
    800085e2:	00e78423          	sb	a4,8(a5)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
    800085e6:	f4c42783          	lw	a5,-180(s0)
    800085ea:	8b85                	andi	a5,a5,1
    800085ec:	2781                	sext.w	a5,a5
    800085ee:	e791                	bnez	a5,800085fa <sys_open+0x1f4>
    800085f0:	f4c42783          	lw	a5,-180(s0)
    800085f4:	8b89                	andi	a5,a5,2
    800085f6:	2781                	sext.w	a5,a5
    800085f8:	c399                	beqz	a5,800085fe <sys_open+0x1f8>
    800085fa:	4785                	li	a5,1
    800085fc:	a011                	j	80008600 <sys_open+0x1fa>
    800085fe:	4781                	li	a5,0
    80008600:	0ff7f713          	andi	a4,a5,255
    80008604:	fd843783          	ld	a5,-40(s0)
    80008608:	00e784a3          	sb	a4,9(a5)

  if((omode & O_TRUNC) && ip->type == T_FILE){
    8000860c:	f4c42783          	lw	a5,-180(s0)
    80008610:	4007f793          	andi	a5,a5,1024
    80008614:	2781                	sext.w	a5,a5
    80008616:	c385                	beqz	a5,80008636 <sys_open+0x230>
    80008618:	fe843783          	ld	a5,-24(s0)
    8000861c:	04479783          	lh	a5,68(a5)
    80008620:	0007871b          	sext.w	a4,a5
    80008624:	4789                	li	a5,2
    80008626:	00f71863          	bne	a4,a5,80008636 <sys_open+0x230>
    itrunc(ip);
    8000862a:	fe843503          	ld	a0,-24(s0)
    8000862e:	ffffd097          	auipc	ra,0xffffd
    80008632:	1c2080e7          	jalr	450(ra) # 800057f0 <itrunc>
  }

  iunlock(ip);
    80008636:	fe843503          	ld	a0,-24(s0)
    8000863a:	ffffd097          	auipc	ra,0xffffd
    8000863e:	ee2080e7          	jalr	-286(ra) # 8000551c <iunlock>
  end_op();
    80008642:	ffffe097          	auipc	ra,0xffffe
    80008646:	ef2080e7          	jalr	-270(ra) # 80006534 <end_op>

  return fd;
    8000864a:	fd442783          	lw	a5,-44(s0)
}
    8000864e:	853e                	mv	a0,a5
    80008650:	70ea                	ld	ra,184(sp)
    80008652:	744a                	ld	s0,176(sp)
    80008654:	6129                	addi	sp,sp,192
    80008656:	8082                	ret

0000000080008658 <sys_mkdir>:

uint64
sys_mkdir(void)
{
    80008658:	7135                	addi	sp,sp,-160
    8000865a:	ed06                	sd	ra,152(sp)
    8000865c:	e922                	sd	s0,144(sp)
    8000865e:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;

  begin_op();
    80008660:	ffffe097          	auipc	ra,0xffffe
    80008664:	e12080e7          	jalr	-494(ra) # 80006472 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    80008668:	f6840793          	addi	a5,s0,-152
    8000866c:	08000613          	li	a2,128
    80008670:	85be                	mv	a1,a5
    80008672:	4501                	li	a0,0
    80008674:	ffffc097          	auipc	ra,0xffffc
    80008678:	e34080e7          	jalr	-460(ra) # 800044a8 <argstr>
    8000867c:	87aa                	mv	a5,a0
    8000867e:	0207c163          	bltz	a5,800086a0 <sys_mkdir+0x48>
    80008682:	f6840793          	addi	a5,s0,-152
    80008686:	4681                	li	a3,0
    80008688:	4601                	li	a2,0
    8000868a:	4585                	li	a1,1
    8000868c:	853e                	mv	a0,a5
    8000868e:	00000097          	auipc	ra,0x0
    80008692:	b46080e7          	jalr	-1210(ra) # 800081d4 <create>
    80008696:	fea43423          	sd	a0,-24(s0)
    8000869a:	fe843783          	ld	a5,-24(s0)
    8000869e:	e799                	bnez	a5,800086ac <sys_mkdir+0x54>
    end_op();
    800086a0:	ffffe097          	auipc	ra,0xffffe
    800086a4:	e94080e7          	jalr	-364(ra) # 80006534 <end_op>
    return -1;
    800086a8:	57fd                	li	a5,-1
    800086aa:	a821                	j	800086c2 <sys_mkdir+0x6a>
  }
  iunlockput(ip);
    800086ac:	fe843503          	ld	a0,-24(s0)
    800086b0:	ffffd097          	auipc	ra,0xffffd
    800086b4:	f96080e7          	jalr	-106(ra) # 80005646 <iunlockput>
  end_op();
    800086b8:	ffffe097          	auipc	ra,0xffffe
    800086bc:	e7c080e7          	jalr	-388(ra) # 80006534 <end_op>
  return 0;
    800086c0:	4781                	li	a5,0
}
    800086c2:	853e                	mv	a0,a5
    800086c4:	60ea                	ld	ra,152(sp)
    800086c6:	644a                	ld	s0,144(sp)
    800086c8:	610d                	addi	sp,sp,160
    800086ca:	8082                	ret

00000000800086cc <sys_mknod>:

uint64
sys_mknod(void)
{
    800086cc:	7135                	addi	sp,sp,-160
    800086ce:	ed06                	sd	ra,152(sp)
    800086d0:	e922                	sd	s0,144(sp)
    800086d2:	1100                	addi	s0,sp,160
  struct inode *ip;
  char path[MAXPATH];
  int major, minor;

  begin_op();
    800086d4:	ffffe097          	auipc	ra,0xffffe
    800086d8:	d9e080e7          	jalr	-610(ra) # 80006472 <begin_op>
  argint(1, &major);
    800086dc:	f6440793          	addi	a5,s0,-156
    800086e0:	85be                	mv	a1,a5
    800086e2:	4505                	li	a0,1
    800086e4:	ffffc097          	auipc	ra,0xffffc
    800086e8:	d5c080e7          	jalr	-676(ra) # 80004440 <argint>
  argint(2, &minor);
    800086ec:	f6040793          	addi	a5,s0,-160
    800086f0:	85be                	mv	a1,a5
    800086f2:	4509                	li	a0,2
    800086f4:	ffffc097          	auipc	ra,0xffffc
    800086f8:	d4c080e7          	jalr	-692(ra) # 80004440 <argint>
  if((argstr(0, path, MAXPATH)) < 0 ||
    800086fc:	f6840793          	addi	a5,s0,-152
    80008700:	08000613          	li	a2,128
    80008704:	85be                	mv	a1,a5
    80008706:	4501                	li	a0,0
    80008708:	ffffc097          	auipc	ra,0xffffc
    8000870c:	da0080e7          	jalr	-608(ra) # 800044a8 <argstr>
    80008710:	87aa                	mv	a5,a0
    80008712:	0207cc63          	bltz	a5,8000874a <sys_mknod+0x7e>
     (ip = create(path, T_DEVICE, major, minor)) == 0){
    80008716:	f6442783          	lw	a5,-156(s0)
    8000871a:	0107971b          	slliw	a4,a5,0x10
    8000871e:	4107571b          	sraiw	a4,a4,0x10
    80008722:	f6042783          	lw	a5,-160(s0)
    80008726:	0107969b          	slliw	a3,a5,0x10
    8000872a:	4106d69b          	sraiw	a3,a3,0x10
    8000872e:	f6840793          	addi	a5,s0,-152
    80008732:	863a                	mv	a2,a4
    80008734:	458d                	li	a1,3
    80008736:	853e                	mv	a0,a5
    80008738:	00000097          	auipc	ra,0x0
    8000873c:	a9c080e7          	jalr	-1380(ra) # 800081d4 <create>
    80008740:	fea43423          	sd	a0,-24(s0)
  if((argstr(0, path, MAXPATH)) < 0 ||
    80008744:	fe843783          	ld	a5,-24(s0)
    80008748:	e799                	bnez	a5,80008756 <sys_mknod+0x8a>
    end_op();
    8000874a:	ffffe097          	auipc	ra,0xffffe
    8000874e:	dea080e7          	jalr	-534(ra) # 80006534 <end_op>
    return -1;
    80008752:	57fd                	li	a5,-1
    80008754:	a821                	j	8000876c <sys_mknod+0xa0>
  }
  iunlockput(ip);
    80008756:	fe843503          	ld	a0,-24(s0)
    8000875a:	ffffd097          	auipc	ra,0xffffd
    8000875e:	eec080e7          	jalr	-276(ra) # 80005646 <iunlockput>
  end_op();
    80008762:	ffffe097          	auipc	ra,0xffffe
    80008766:	dd2080e7          	jalr	-558(ra) # 80006534 <end_op>
  return 0;
    8000876a:	4781                	li	a5,0
}
    8000876c:	853e                	mv	a0,a5
    8000876e:	60ea                	ld	ra,152(sp)
    80008770:	644a                	ld	s0,144(sp)
    80008772:	610d                	addi	sp,sp,160
    80008774:	8082                	ret

0000000080008776 <sys_chdir>:

uint64
sys_chdir(void)
{
    80008776:	7135                	addi	sp,sp,-160
    80008778:	ed06                	sd	ra,152(sp)
    8000877a:	e922                	sd	s0,144(sp)
    8000877c:	1100                	addi	s0,sp,160
  char path[MAXPATH];
  struct inode *ip;
  struct proc *p = myproc();
    8000877e:	ffffa097          	auipc	ra,0xffffa
    80008782:	3e4080e7          	jalr	996(ra) # 80002b62 <myproc>
    80008786:	fea43423          	sd	a0,-24(s0)
  
  begin_op();
    8000878a:	ffffe097          	auipc	ra,0xffffe
    8000878e:	ce8080e7          	jalr	-792(ra) # 80006472 <begin_op>
  if(argstr(0, path, MAXPATH) < 0 || (ip = namei(path)) == 0){
    80008792:	f6040793          	addi	a5,s0,-160
    80008796:	08000613          	li	a2,128
    8000879a:	85be                	mv	a1,a5
    8000879c:	4501                	li	a0,0
    8000879e:	ffffc097          	auipc	ra,0xffffc
    800087a2:	d0a080e7          	jalr	-758(ra) # 800044a8 <argstr>
    800087a6:	87aa                	mv	a5,a0
    800087a8:	0007ce63          	bltz	a5,800087c4 <sys_chdir+0x4e>
    800087ac:	f6040793          	addi	a5,s0,-160
    800087b0:	853e                	mv	a0,a5
    800087b2:	ffffe097          	auipc	ra,0xffffe
    800087b6:	95c080e7          	jalr	-1700(ra) # 8000610e <namei>
    800087ba:	fea43023          	sd	a0,-32(s0)
    800087be:	fe043783          	ld	a5,-32(s0)
    800087c2:	e799                	bnez	a5,800087d0 <sys_chdir+0x5a>
    end_op();
    800087c4:	ffffe097          	auipc	ra,0xffffe
    800087c8:	d70080e7          	jalr	-656(ra) # 80006534 <end_op>
    return -1;
    800087cc:	57fd                	li	a5,-1
    800087ce:	a0b5                	j	8000883a <sys_chdir+0xc4>
  }
  ilock(ip);
    800087d0:	fe043503          	ld	a0,-32(s0)
    800087d4:	ffffd097          	auipc	ra,0xffffd
    800087d8:	c14080e7          	jalr	-1004(ra) # 800053e8 <ilock>
  if(ip->type != T_DIR){
    800087dc:	fe043783          	ld	a5,-32(s0)
    800087e0:	04479783          	lh	a5,68(a5)
    800087e4:	0007871b          	sext.w	a4,a5
    800087e8:	4785                	li	a5,1
    800087ea:	00f70e63          	beq	a4,a5,80008806 <sys_chdir+0x90>
    iunlockput(ip);
    800087ee:	fe043503          	ld	a0,-32(s0)
    800087f2:	ffffd097          	auipc	ra,0xffffd
    800087f6:	e54080e7          	jalr	-428(ra) # 80005646 <iunlockput>
    end_op();
    800087fa:	ffffe097          	auipc	ra,0xffffe
    800087fe:	d3a080e7          	jalr	-710(ra) # 80006534 <end_op>
    return -1;
    80008802:	57fd                	li	a5,-1
    80008804:	a81d                	j	8000883a <sys_chdir+0xc4>
  }
  iunlock(ip);
    80008806:	fe043503          	ld	a0,-32(s0)
    8000880a:	ffffd097          	auipc	ra,0xffffd
    8000880e:	d12080e7          	jalr	-750(ra) # 8000551c <iunlock>
  iput(p->cwd);
    80008812:	fe843783          	ld	a5,-24(s0)
    80008816:	1507b783          	ld	a5,336(a5)
    8000881a:	853e                	mv	a0,a5
    8000881c:	ffffd097          	auipc	ra,0xffffd
    80008820:	d5a080e7          	jalr	-678(ra) # 80005576 <iput>
  end_op();
    80008824:	ffffe097          	auipc	ra,0xffffe
    80008828:	d10080e7          	jalr	-752(ra) # 80006534 <end_op>
  p->cwd = ip;
    8000882c:	fe843783          	ld	a5,-24(s0)
    80008830:	fe043703          	ld	a4,-32(s0)
    80008834:	14e7b823          	sd	a4,336(a5)
  return 0;
    80008838:	4781                	li	a5,0
}
    8000883a:	853e                	mv	a0,a5
    8000883c:	60ea                	ld	ra,152(sp)
    8000883e:	644a                	ld	s0,144(sp)
    80008840:	610d                	addi	sp,sp,160
    80008842:	8082                	ret

0000000080008844 <sys_exec>:

uint64
sys_exec(void)
{
    80008844:	7161                	addi	sp,sp,-432
    80008846:	f706                	sd	ra,424(sp)
    80008848:	f322                	sd	s0,416(sp)
    8000884a:	1b00                	addi	s0,sp,432
  char path[MAXPATH], *argv[MAXARG];
  int i;
  uint64 uargv, uarg;

  argaddr(1, &uargv);
    8000884c:	e6040793          	addi	a5,s0,-416
    80008850:	85be                	mv	a1,a5
    80008852:	4505                	li	a0,1
    80008854:	ffffc097          	auipc	ra,0xffffc
    80008858:	c22080e7          	jalr	-990(ra) # 80004476 <argaddr>
  if(argstr(0, path, MAXPATH) < 0) {
    8000885c:	f6840793          	addi	a5,s0,-152
    80008860:	08000613          	li	a2,128
    80008864:	85be                	mv	a1,a5
    80008866:	4501                	li	a0,0
    80008868:	ffffc097          	auipc	ra,0xffffc
    8000886c:	c40080e7          	jalr	-960(ra) # 800044a8 <argstr>
    80008870:	87aa                	mv	a5,a0
    80008872:	0007d463          	bgez	a5,8000887a <sys_exec+0x36>
    return -1;
    80008876:	57fd                	li	a5,-1
    80008878:	a249                	j	800089fa <sys_exec+0x1b6>
  }
  memset(argv, 0, sizeof(argv));
    8000887a:	e6840793          	addi	a5,s0,-408
    8000887e:	10000613          	li	a2,256
    80008882:	4581                	li	a1,0
    80008884:	853e                	mv	a0,a5
    80008886:	ffff9097          	auipc	ra,0xffff9
    8000888a:	c78080e7          	jalr	-904(ra) # 800014fe <memset>
  for(i=0;; i++){
    8000888e:	fe042623          	sw	zero,-20(s0)
    if(i >= NELEM(argv)){
    80008892:	fec42783          	lw	a5,-20(s0)
    80008896:	873e                	mv	a4,a5
    80008898:	47fd                	li	a5,31
    8000889a:	10e7e463          	bltu	a5,a4,800089a2 <sys_exec+0x15e>
      goto bad;
    }
    if(fetchaddr(uargv+sizeof(uint64)*i, (uint64*)&uarg) < 0){
    8000889e:	fec42783          	lw	a5,-20(s0)
    800088a2:	00379713          	slli	a4,a5,0x3
    800088a6:	e6043783          	ld	a5,-416(s0)
    800088aa:	97ba                	add	a5,a5,a4
    800088ac:	e5840713          	addi	a4,s0,-424
    800088b0:	85ba                	mv	a1,a4
    800088b2:	853e                	mv	a0,a5
    800088b4:	ffffc097          	auipc	ra,0xffffc
    800088b8:	a1a080e7          	jalr	-1510(ra) # 800042ce <fetchaddr>
    800088bc:	87aa                	mv	a5,a0
    800088be:	0e07c463          	bltz	a5,800089a6 <sys_exec+0x162>
      goto bad;
    }
    if(uarg == 0){
    800088c2:	e5843783          	ld	a5,-424(s0)
    800088c6:	eb95                	bnez	a5,800088fa <sys_exec+0xb6>
      argv[i] = 0;
    800088c8:	fec42783          	lw	a5,-20(s0)
    800088cc:	078e                	slli	a5,a5,0x3
    800088ce:	ff040713          	addi	a4,s0,-16
    800088d2:	97ba                	add	a5,a5,a4
    800088d4:	e607bc23          	sd	zero,-392(a5)
      break;
    800088d8:	0001                	nop
      goto bad;
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
      goto bad;
  }

  int ret = exec(path, argv);
    800088da:	e6840713          	addi	a4,s0,-408
    800088de:	f6840793          	addi	a5,s0,-152
    800088e2:	85ba                	mv	a1,a4
    800088e4:	853e                	mv	a0,a5
    800088e6:	fffff097          	auipc	ra,0xfffff
    800088ea:	c1e080e7          	jalr	-994(ra) # 80007504 <exec>
    800088ee:	87aa                	mv	a5,a0
    800088f0:	fef42423          	sw	a5,-24(s0)

  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800088f4:	fe042623          	sw	zero,-20(s0)
    800088f8:	a059                	j	8000897e <sys_exec+0x13a>
    argv[i] = kalloc();
    800088fa:	ffff9097          	auipc	ra,0xffff9
    800088fe:	8dc080e7          	jalr	-1828(ra) # 800011d6 <kalloc>
    80008902:	872a                	mv	a4,a0
    80008904:	fec42783          	lw	a5,-20(s0)
    80008908:	078e                	slli	a5,a5,0x3
    8000890a:	ff040693          	addi	a3,s0,-16
    8000890e:	97b6                	add	a5,a5,a3
    80008910:	e6e7bc23          	sd	a4,-392(a5)
    if(argv[i] == 0)
    80008914:	fec42783          	lw	a5,-20(s0)
    80008918:	078e                	slli	a5,a5,0x3
    8000891a:	ff040713          	addi	a4,s0,-16
    8000891e:	97ba                	add	a5,a5,a4
    80008920:	e787b783          	ld	a5,-392(a5)
    80008924:	c3d9                	beqz	a5,800089aa <sys_exec+0x166>
    if(fetchstr(uarg, argv[i], PGSIZE) < 0)
    80008926:	e5843703          	ld	a4,-424(s0)
    8000892a:	fec42783          	lw	a5,-20(s0)
    8000892e:	078e                	slli	a5,a5,0x3
    80008930:	ff040693          	addi	a3,s0,-16
    80008934:	97b6                	add	a5,a5,a3
    80008936:	e787b783          	ld	a5,-392(a5)
    8000893a:	6605                	lui	a2,0x1
    8000893c:	85be                	mv	a1,a5
    8000893e:	853a                	mv	a0,a4
    80008940:	ffffc097          	auipc	ra,0xffffc
    80008944:	9fc080e7          	jalr	-1540(ra) # 8000433c <fetchstr>
    80008948:	87aa                	mv	a5,a0
    8000894a:	0607c263          	bltz	a5,800089ae <sys_exec+0x16a>
  for(i=0;; i++){
    8000894e:	fec42783          	lw	a5,-20(s0)
    80008952:	2785                	addiw	a5,a5,1
    80008954:	fef42623          	sw	a5,-20(s0)
    if(i >= NELEM(argv)){
    80008958:	bf2d                	j	80008892 <sys_exec+0x4e>
    kfree(argv[i]);
    8000895a:	fec42783          	lw	a5,-20(s0)
    8000895e:	078e                	slli	a5,a5,0x3
    80008960:	ff040713          	addi	a4,s0,-16
    80008964:	97ba                	add	a5,a5,a4
    80008966:	e787b783          	ld	a5,-392(a5)
    8000896a:	853e                	mv	a0,a5
    8000896c:	ffff8097          	auipc	ra,0xffff8
    80008970:	7c4080e7          	jalr	1988(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    80008974:	fec42783          	lw	a5,-20(s0)
    80008978:	2785                	addiw	a5,a5,1
    8000897a:	fef42623          	sw	a5,-20(s0)
    8000897e:	fec42783          	lw	a5,-20(s0)
    80008982:	873e                	mv	a4,a5
    80008984:	47fd                	li	a5,31
    80008986:	00e7eb63          	bltu	a5,a4,8000899c <sys_exec+0x158>
    8000898a:	fec42783          	lw	a5,-20(s0)
    8000898e:	078e                	slli	a5,a5,0x3
    80008990:	ff040713          	addi	a4,s0,-16
    80008994:	97ba                	add	a5,a5,a4
    80008996:	e787b783          	ld	a5,-392(a5)
    8000899a:	f3e1                	bnez	a5,8000895a <sys_exec+0x116>

  return ret;
    8000899c:	fe842783          	lw	a5,-24(s0)
    800089a0:	a8a9                	j	800089fa <sys_exec+0x1b6>
      goto bad;
    800089a2:	0001                	nop
    800089a4:	a031                	j	800089b0 <sys_exec+0x16c>
      goto bad;
    800089a6:	0001                	nop
    800089a8:	a021                	j	800089b0 <sys_exec+0x16c>
      goto bad;
    800089aa:	0001                	nop
    800089ac:	a011                	j	800089b0 <sys_exec+0x16c>
      goto bad;
    800089ae:	0001                	nop

 bad:
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800089b0:	fe042623          	sw	zero,-20(s0)
    800089b4:	a01d                	j	800089da <sys_exec+0x196>
    kfree(argv[i]);
    800089b6:	fec42783          	lw	a5,-20(s0)
    800089ba:	078e                	slli	a5,a5,0x3
    800089bc:	ff040713          	addi	a4,s0,-16
    800089c0:	97ba                	add	a5,a5,a4
    800089c2:	e787b783          	ld	a5,-392(a5)
    800089c6:	853e                	mv	a0,a5
    800089c8:	ffff8097          	auipc	ra,0xffff8
    800089cc:	768080e7          	jalr	1896(ra) # 80001130 <kfree>
  for(i = 0; i < NELEM(argv) && argv[i] != 0; i++)
    800089d0:	fec42783          	lw	a5,-20(s0)
    800089d4:	2785                	addiw	a5,a5,1
    800089d6:	fef42623          	sw	a5,-20(s0)
    800089da:	fec42783          	lw	a5,-20(s0)
    800089de:	873e                	mv	a4,a5
    800089e0:	47fd                	li	a5,31
    800089e2:	00e7eb63          	bltu	a5,a4,800089f8 <sys_exec+0x1b4>
    800089e6:	fec42783          	lw	a5,-20(s0)
    800089ea:	078e                	slli	a5,a5,0x3
    800089ec:	ff040713          	addi	a4,s0,-16
    800089f0:	97ba                	add	a5,a5,a4
    800089f2:	e787b783          	ld	a5,-392(a5)
    800089f6:	f3e1                	bnez	a5,800089b6 <sys_exec+0x172>
  return -1;
    800089f8:	57fd                	li	a5,-1
}
    800089fa:	853e                	mv	a0,a5
    800089fc:	70ba                	ld	ra,424(sp)
    800089fe:	741a                	ld	s0,416(sp)
    80008a00:	615d                	addi	sp,sp,432
    80008a02:	8082                	ret

0000000080008a04 <sys_pipe>:

uint64
sys_pipe(void)
{
    80008a04:	7139                	addi	sp,sp,-64
    80008a06:	fc06                	sd	ra,56(sp)
    80008a08:	f822                	sd	s0,48(sp)
    80008a0a:	0080                	addi	s0,sp,64
  uint64 fdarray; // user pointer to array of two integers
  struct file *rf, *wf;
  int fd0, fd1;
  struct proc *p = myproc();
    80008a0c:	ffffa097          	auipc	ra,0xffffa
    80008a10:	156080e7          	jalr	342(ra) # 80002b62 <myproc>
    80008a14:	fea43423          	sd	a0,-24(s0)

  argaddr(0, &fdarray);
    80008a18:	fe040793          	addi	a5,s0,-32
    80008a1c:	85be                	mv	a1,a5
    80008a1e:	4501                	li	a0,0
    80008a20:	ffffc097          	auipc	ra,0xffffc
    80008a24:	a56080e7          	jalr	-1450(ra) # 80004476 <argaddr>
  if(pipealloc(&rf, &wf) < 0)
    80008a28:	fd040713          	addi	a4,s0,-48
    80008a2c:	fd840793          	addi	a5,s0,-40
    80008a30:	85ba                	mv	a1,a4
    80008a32:	853e                	mv	a0,a5
    80008a34:	ffffe097          	auipc	ra,0xffffe
    80008a38:	5ee080e7          	jalr	1518(ra) # 80007022 <pipealloc>
    80008a3c:	87aa                	mv	a5,a0
    80008a3e:	0007d463          	bgez	a5,80008a46 <sys_pipe+0x42>
    return -1;
    80008a42:	57fd                	li	a5,-1
    80008a44:	a219                	j	80008b4a <sys_pipe+0x146>
  fd0 = -1;
    80008a46:	57fd                	li	a5,-1
    80008a48:	fcf42623          	sw	a5,-52(s0)
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    80008a4c:	fd843783          	ld	a5,-40(s0)
    80008a50:	853e                	mv	a0,a5
    80008a52:	fffff097          	auipc	ra,0xfffff
    80008a56:	0da080e7          	jalr	218(ra) # 80007b2c <fdalloc>
    80008a5a:	87aa                	mv	a5,a0
    80008a5c:	fcf42623          	sw	a5,-52(s0)
    80008a60:	fcc42783          	lw	a5,-52(s0)
    80008a64:	0207c063          	bltz	a5,80008a84 <sys_pipe+0x80>
    80008a68:	fd043783          	ld	a5,-48(s0)
    80008a6c:	853e                	mv	a0,a5
    80008a6e:	fffff097          	auipc	ra,0xfffff
    80008a72:	0be080e7          	jalr	190(ra) # 80007b2c <fdalloc>
    80008a76:	87aa                	mv	a5,a0
    80008a78:	fcf42423          	sw	a5,-56(s0)
    80008a7c:	fc842783          	lw	a5,-56(s0)
    80008a80:	0207df63          	bgez	a5,80008abe <sys_pipe+0xba>
    if(fd0 >= 0)
    80008a84:	fcc42783          	lw	a5,-52(s0)
    80008a88:	0007cb63          	bltz	a5,80008a9e <sys_pipe+0x9a>
      p->ofile[fd0] = 0;
    80008a8c:	fcc42783          	lw	a5,-52(s0)
    80008a90:	fe843703          	ld	a4,-24(s0)
    80008a94:	07e9                	addi	a5,a5,26
    80008a96:	078e                	slli	a5,a5,0x3
    80008a98:	97ba                	add	a5,a5,a4
    80008a9a:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008a9e:	fd843783          	ld	a5,-40(s0)
    80008aa2:	853e                	mv	a0,a5
    80008aa4:	ffffe097          	auipc	ra,0xffffe
    80008aa8:	068080e7          	jalr	104(ra) # 80006b0c <fileclose>
    fileclose(wf);
    80008aac:	fd043783          	ld	a5,-48(s0)
    80008ab0:	853e                	mv	a0,a5
    80008ab2:	ffffe097          	auipc	ra,0xffffe
    80008ab6:	05a080e7          	jalr	90(ra) # 80006b0c <fileclose>
    return -1;
    80008aba:	57fd                	li	a5,-1
    80008abc:	a079                	j	80008b4a <sys_pipe+0x146>
  }
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008abe:	fe843783          	ld	a5,-24(s0)
    80008ac2:	6bbc                	ld	a5,80(a5)
    80008ac4:	fe043703          	ld	a4,-32(s0)
    80008ac8:	fcc40613          	addi	a2,s0,-52
    80008acc:	4691                	li	a3,4
    80008ace:	85ba                	mv	a1,a4
    80008ad0:	853e                	mv	a0,a5
    80008ad2:	ffffa097          	auipc	ra,0xffffa
    80008ad6:	b5a080e7          	jalr	-1190(ra) # 8000262c <copyout>
    80008ada:	87aa                	mv	a5,a0
    80008adc:	0207c463          	bltz	a5,80008b04 <sys_pipe+0x100>
     copyout(p->pagetable, fdarray+sizeof(fd0), (char *)&fd1, sizeof(fd1)) < 0){
    80008ae0:	fe843783          	ld	a5,-24(s0)
    80008ae4:	6bb8                	ld	a4,80(a5)
    80008ae6:	fe043783          	ld	a5,-32(s0)
    80008aea:	0791                	addi	a5,a5,4
    80008aec:	fc840613          	addi	a2,s0,-56
    80008af0:	4691                	li	a3,4
    80008af2:	85be                	mv	a1,a5
    80008af4:	853a                	mv	a0,a4
    80008af6:	ffffa097          	auipc	ra,0xffffa
    80008afa:	b36080e7          	jalr	-1226(ra) # 8000262c <copyout>
    80008afe:	87aa                	mv	a5,a0
  if(copyout(p->pagetable, fdarray, (char*)&fd0, sizeof(fd0)) < 0 ||
    80008b00:	0407d463          	bgez	a5,80008b48 <sys_pipe+0x144>
    p->ofile[fd0] = 0;
    80008b04:	fcc42783          	lw	a5,-52(s0)
    80008b08:	fe843703          	ld	a4,-24(s0)
    80008b0c:	07e9                	addi	a5,a5,26
    80008b0e:	078e                	slli	a5,a5,0x3
    80008b10:	97ba                	add	a5,a5,a4
    80008b12:	0007b023          	sd	zero,0(a5)
    p->ofile[fd1] = 0;
    80008b16:	fc842783          	lw	a5,-56(s0)
    80008b1a:	fe843703          	ld	a4,-24(s0)
    80008b1e:	07e9                	addi	a5,a5,26
    80008b20:	078e                	slli	a5,a5,0x3
    80008b22:	97ba                	add	a5,a5,a4
    80008b24:	0007b023          	sd	zero,0(a5)
    fileclose(rf);
    80008b28:	fd843783          	ld	a5,-40(s0)
    80008b2c:	853e                	mv	a0,a5
    80008b2e:	ffffe097          	auipc	ra,0xffffe
    80008b32:	fde080e7          	jalr	-34(ra) # 80006b0c <fileclose>
    fileclose(wf);
    80008b36:	fd043783          	ld	a5,-48(s0)
    80008b3a:	853e                	mv	a0,a5
    80008b3c:	ffffe097          	auipc	ra,0xffffe
    80008b40:	fd0080e7          	jalr	-48(ra) # 80006b0c <fileclose>
    return -1;
    80008b44:	57fd                	li	a5,-1
    80008b46:	a011                	j	80008b4a <sys_pipe+0x146>
  }
  return 0;
    80008b48:	4781                	li	a5,0
}
    80008b4a:	853e                	mv	a0,a5
    80008b4c:	70e2                	ld	ra,56(sp)
    80008b4e:	7442                	ld	s0,48(sp)
    80008b50:	6121                	addi	sp,sp,64
    80008b52:	8082                	ret
	...

0000000080008b60 <kernelvec>:
    80008b60:	7111                	addi	sp,sp,-256
    80008b62:	e006                	sd	ra,0(sp)
    80008b64:	e40a                	sd	sp,8(sp)
    80008b66:	e80e                	sd	gp,16(sp)
    80008b68:	ec12                	sd	tp,24(sp)
    80008b6a:	f016                	sd	t0,32(sp)
    80008b6c:	f41a                	sd	t1,40(sp)
    80008b6e:	f81e                	sd	t2,48(sp)
    80008b70:	fc22                	sd	s0,56(sp)
    80008b72:	e0a6                	sd	s1,64(sp)
    80008b74:	e4aa                	sd	a0,72(sp)
    80008b76:	e8ae                	sd	a1,80(sp)
    80008b78:	ecb2                	sd	a2,88(sp)
    80008b7a:	f0b6                	sd	a3,96(sp)
    80008b7c:	f4ba                	sd	a4,104(sp)
    80008b7e:	f8be                	sd	a5,112(sp)
    80008b80:	fcc2                	sd	a6,120(sp)
    80008b82:	e146                	sd	a7,128(sp)
    80008b84:	e54a                	sd	s2,136(sp)
    80008b86:	e94e                	sd	s3,144(sp)
    80008b88:	ed52                	sd	s4,152(sp)
    80008b8a:	f156                	sd	s5,160(sp)
    80008b8c:	f55a                	sd	s6,168(sp)
    80008b8e:	f95e                	sd	s7,176(sp)
    80008b90:	fd62                	sd	s8,184(sp)
    80008b92:	e1e6                	sd	s9,192(sp)
    80008b94:	e5ea                	sd	s10,200(sp)
    80008b96:	e9ee                	sd	s11,208(sp)
    80008b98:	edf2                	sd	t3,216(sp)
    80008b9a:	f1f6                	sd	t4,224(sp)
    80008b9c:	f5fa                	sd	t5,232(sp)
    80008b9e:	f9fe                	sd	t6,240(sp)
    80008ba0:	c6afb0ef          	jal	ra,8000400a <kerneltrap>
    80008ba4:	6082                	ld	ra,0(sp)
    80008ba6:	6122                	ld	sp,8(sp)
    80008ba8:	61c2                	ld	gp,16(sp)
    80008baa:	7282                	ld	t0,32(sp)
    80008bac:	7322                	ld	t1,40(sp)
    80008bae:	73c2                	ld	t2,48(sp)
    80008bb0:	7462                	ld	s0,56(sp)
    80008bb2:	6486                	ld	s1,64(sp)
    80008bb4:	6526                	ld	a0,72(sp)
    80008bb6:	65c6                	ld	a1,80(sp)
    80008bb8:	6666                	ld	a2,88(sp)
    80008bba:	7686                	ld	a3,96(sp)
    80008bbc:	7726                	ld	a4,104(sp)
    80008bbe:	77c6                	ld	a5,112(sp)
    80008bc0:	7866                	ld	a6,120(sp)
    80008bc2:	688a                	ld	a7,128(sp)
    80008bc4:	692a                	ld	s2,136(sp)
    80008bc6:	69ca                	ld	s3,144(sp)
    80008bc8:	6a6a                	ld	s4,152(sp)
    80008bca:	7a8a                	ld	s5,160(sp)
    80008bcc:	7b2a                	ld	s6,168(sp)
    80008bce:	7bca                	ld	s7,176(sp)
    80008bd0:	7c6a                	ld	s8,184(sp)
    80008bd2:	6c8e                	ld	s9,192(sp)
    80008bd4:	6d2e                	ld	s10,200(sp)
    80008bd6:	6dce                	ld	s11,208(sp)
    80008bd8:	6e6e                	ld	t3,216(sp)
    80008bda:	7e8e                	ld	t4,224(sp)
    80008bdc:	7f2e                	ld	t5,232(sp)
    80008bde:	7fce                	ld	t6,240(sp)
    80008be0:	6111                	addi	sp,sp,256
    80008be2:	10200073          	sret
    80008be6:	00000013          	nop
    80008bea:	00000013          	nop
    80008bee:	0001                	nop

0000000080008bf0 <timervec>:
    80008bf0:	34051573          	csrrw	a0,mscratch,a0
    80008bf4:	e10c                	sd	a1,0(a0)
    80008bf6:	e510                	sd	a2,8(a0)
    80008bf8:	e914                	sd	a3,16(a0)
    80008bfa:	6d0c                	ld	a1,24(a0)
    80008bfc:	7110                	ld	a2,32(a0)
    80008bfe:	6194                	ld	a3,0(a1)
    80008c00:	96b2                	add	a3,a3,a2
    80008c02:	e194                	sd	a3,0(a1)
    80008c04:	4589                	li	a1,2
    80008c06:	14459073          	csrw	sip,a1
    80008c0a:	6914                	ld	a3,16(a0)
    80008c0c:	6510                	ld	a2,8(a0)
    80008c0e:	610c                	ld	a1,0(a0)
    80008c10:	34051573          	csrrw	a0,mscratch,a0
    80008c14:	30200073          	mret
	...

0000000080008c1a <plicinit>:
// the riscv Platform Level Interrupt Controller (PLIC).
//

void
plicinit(void)
{
    80008c1a:	1141                	addi	sp,sp,-16
    80008c1c:	e422                	sd	s0,8(sp)
    80008c1e:	0800                	addi	s0,sp,16
  // set desired IRQ priorities non-zero (otherwise disabled).
  *(uint32*)(PLIC + UART0_IRQ*4) = 1;
    80008c20:	0c0007b7          	lui	a5,0xc000
    80008c24:	02878793          	addi	a5,a5,40 # c000028 <_entry-0x73ffffd8>
    80008c28:	4705                	li	a4,1
    80008c2a:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO0_IRQ*4) = 1;
    80008c2c:	0c0007b7          	lui	a5,0xc000
    80008c30:	0791                	addi	a5,a5,4
    80008c32:	4705                	li	a4,1
    80008c34:	c398                	sw	a4,0(a5)
  *(uint32*)(PLIC + VIRTIO1_IRQ*4) = 1;
    80008c36:	0c0007b7          	lui	a5,0xc000
    80008c3a:	07a1                	addi	a5,a5,8
    80008c3c:	4705                	li	a4,1
    80008c3e:	c398                	sw	a4,0(a5)
}
    80008c40:	0001                	nop
    80008c42:	6422                	ld	s0,8(sp)
    80008c44:	0141                	addi	sp,sp,16
    80008c46:	8082                	ret

0000000080008c48 <plicinithart>:

void
plicinithart(void)
{
    80008c48:	1101                	addi	sp,sp,-32
    80008c4a:	ec06                	sd	ra,24(sp)
    80008c4c:	e822                	sd	s0,16(sp)
    80008c4e:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008c50:	ffffa097          	auipc	ra,0xffffa
    80008c54:	eb4080e7          	jalr	-332(ra) # 80002b04 <cpuid>
    80008c58:	87aa                	mv	a5,a0
    80008c5a:	fef42623          	sw	a5,-20(s0)
  
  // set enable bits for this hart's S-mode
  // for the uart and virtio disk.
  *(uint32*)PLIC_SENABLE(hart) = (1 << UART0_IRQ) | (1 << VIRTIO0_IRQ) | (1 << VIRTIO1_IRQ);
    80008c5e:	fec42783          	lw	a5,-20(s0)
    80008c62:	0087979b          	slliw	a5,a5,0x8
    80008c66:	2781                	sext.w	a5,a5
    80008c68:	873e                	mv	a4,a5
    80008c6a:	0c0027b7          	lui	a5,0xc002
    80008c6e:	08078793          	addi	a5,a5,128 # c002080 <_entry-0x73ffdf80>
    80008c72:	97ba                	add	a5,a5,a4
    80008c74:	873e                	mv	a4,a5
    80008c76:	40600793          	li	a5,1030
    80008c7a:	c31c                	sw	a5,0(a4)

  // set this hart's S-mode priority threshold to 0.
  *(uint32*)PLIC_SPRIORITY(hart) = 0;
    80008c7c:	fec42783          	lw	a5,-20(s0)
    80008c80:	00d7979b          	slliw	a5,a5,0xd
    80008c84:	2781                	sext.w	a5,a5
    80008c86:	873e                	mv	a4,a5
    80008c88:	0c2017b7          	lui	a5,0xc201
    80008c8c:	97ba                	add	a5,a5,a4
    80008c8e:	0007a023          	sw	zero,0(a5) # c201000 <_entry-0x73dff000>
}
    80008c92:	0001                	nop
    80008c94:	60e2                	ld	ra,24(sp)
    80008c96:	6442                	ld	s0,16(sp)
    80008c98:	6105                	addi	sp,sp,32
    80008c9a:	8082                	ret

0000000080008c9c <plic_claim>:

// ask the PLIC what interrupt we should serve.
int
plic_claim(void)
{
    80008c9c:	1101                	addi	sp,sp,-32
    80008c9e:	ec06                	sd	ra,24(sp)
    80008ca0:	e822                	sd	s0,16(sp)
    80008ca2:	1000                	addi	s0,sp,32
  int hart = cpuid();
    80008ca4:	ffffa097          	auipc	ra,0xffffa
    80008ca8:	e60080e7          	jalr	-416(ra) # 80002b04 <cpuid>
    80008cac:	87aa                	mv	a5,a0
    80008cae:	fef42623          	sw	a5,-20(s0)
  int irq = *(uint32*)PLIC_SCLAIM(hart);
    80008cb2:	fec42783          	lw	a5,-20(s0)
    80008cb6:	00d7979b          	slliw	a5,a5,0xd
    80008cba:	2781                	sext.w	a5,a5
    80008cbc:	873e                	mv	a4,a5
    80008cbe:	0c2017b7          	lui	a5,0xc201
    80008cc2:	0791                	addi	a5,a5,4
    80008cc4:	97ba                	add	a5,a5,a4
    80008cc6:	439c                	lw	a5,0(a5)
    80008cc8:	fef42423          	sw	a5,-24(s0)
  return irq;
    80008ccc:	fe842783          	lw	a5,-24(s0)
}
    80008cd0:	853e                	mv	a0,a5
    80008cd2:	60e2                	ld	ra,24(sp)
    80008cd4:	6442                	ld	s0,16(sp)
    80008cd6:	6105                	addi	sp,sp,32
    80008cd8:	8082                	ret

0000000080008cda <plic_complete>:

// tell the PLIC we've served this IRQ.
void
plic_complete(int irq)
{
    80008cda:	7179                	addi	sp,sp,-48
    80008cdc:	f406                	sd	ra,40(sp)
    80008cde:	f022                	sd	s0,32(sp)
    80008ce0:	1800                	addi	s0,sp,48
    80008ce2:	87aa                	mv	a5,a0
    80008ce4:	fcf42e23          	sw	a5,-36(s0)
  int hart = cpuid();
    80008ce8:	ffffa097          	auipc	ra,0xffffa
    80008cec:	e1c080e7          	jalr	-484(ra) # 80002b04 <cpuid>
    80008cf0:	87aa                	mv	a5,a0
    80008cf2:	fef42623          	sw	a5,-20(s0)
  *(uint32*)PLIC_SCLAIM(hart) = irq;
    80008cf6:	fec42783          	lw	a5,-20(s0)
    80008cfa:	00d7979b          	slliw	a5,a5,0xd
    80008cfe:	2781                	sext.w	a5,a5
    80008d00:	873e                	mv	a4,a5
    80008d02:	0c2017b7          	lui	a5,0xc201
    80008d06:	0791                	addi	a5,a5,4
    80008d08:	97ba                	add	a5,a5,a4
    80008d0a:	873e                	mv	a4,a5
    80008d0c:	fdc42783          	lw	a5,-36(s0)
    80008d10:	c31c                	sw	a5,0(a4)
}
    80008d12:	0001                	nop
    80008d14:	70a2                	ld	ra,40(sp)
    80008d16:	7402                	ld	s0,32(sp)
    80008d18:	6145                	addi	sp,sp,48
    80008d1a:	8082                	ret

0000000080008d1c <r_sstatus>:
{
    80008d1c:	1101                	addi	sp,sp,-32
    80008d1e:	ec22                	sd	s0,24(sp)
    80008d20:	1000                	addi	s0,sp,32
  asm volatile("csrr %0, sstatus" : "=r" (x) );
    80008d22:	100027f3          	csrr	a5,sstatus
    80008d26:	fef43423          	sd	a5,-24(s0)
  return x;
    80008d2a:	fe843783          	ld	a5,-24(s0)
}
    80008d2e:	853e                	mv	a0,a5
    80008d30:	6462                	ld	s0,24(sp)
    80008d32:	6105                	addi	sp,sp,32
    80008d34:	8082                	ret

0000000080008d36 <w_sstatus>:
{
    80008d36:	1101                	addi	sp,sp,-32
    80008d38:	ec22                	sd	s0,24(sp)
    80008d3a:	1000                	addi	s0,sp,32
    80008d3c:	fea43423          	sd	a0,-24(s0)
  asm volatile("csrw sstatus, %0" : : "r" (x));
    80008d40:	fe843783          	ld	a5,-24(s0)
    80008d44:	10079073          	csrw	sstatus,a5
}
    80008d48:	0001                	nop
    80008d4a:	6462                	ld	s0,24(sp)
    80008d4c:	6105                	addi	sp,sp,32
    80008d4e:	8082                	ret

0000000080008d50 <intr_on>:
{
    80008d50:	1141                	addi	sp,sp,-16
    80008d52:	e406                	sd	ra,8(sp)
    80008d54:	e022                	sd	s0,0(sp)
    80008d56:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() | SSTATUS_SIE);
    80008d58:	00000097          	auipc	ra,0x0
    80008d5c:	fc4080e7          	jalr	-60(ra) # 80008d1c <r_sstatus>
    80008d60:	87aa                	mv	a5,a0
    80008d62:	0027e793          	ori	a5,a5,2
    80008d66:	853e                	mv	a0,a5
    80008d68:	00000097          	auipc	ra,0x0
    80008d6c:	fce080e7          	jalr	-50(ra) # 80008d36 <w_sstatus>
}
    80008d70:	0001                	nop
    80008d72:	60a2                	ld	ra,8(sp)
    80008d74:	6402                	ld	s0,0(sp)
    80008d76:	0141                	addi	sp,sp,16
    80008d78:	8082                	ret

0000000080008d7a <intr_off>:
{
    80008d7a:	1141                	addi	sp,sp,-16
    80008d7c:	e406                	sd	ra,8(sp)
    80008d7e:	e022                	sd	s0,0(sp)
    80008d80:	0800                	addi	s0,sp,16
  w_sstatus(r_sstatus() & ~SSTATUS_SIE);
    80008d82:	00000097          	auipc	ra,0x0
    80008d86:	f9a080e7          	jalr	-102(ra) # 80008d1c <r_sstatus>
    80008d8a:	87aa                	mv	a5,a0
    80008d8c:	9bf5                	andi	a5,a5,-3
    80008d8e:	853e                	mv	a0,a5
    80008d90:	00000097          	auipc	ra,0x0
    80008d94:	fa6080e7          	jalr	-90(ra) # 80008d36 <w_sstatus>
}
    80008d98:	0001                	nop
    80008d9a:	60a2                	ld	ra,8(sp)
    80008d9c:	6402                	ld	s0,0(sp)
    80008d9e:	0141                	addi	sp,sp,16
    80008da0:	8082                	ret

0000000080008da2 <virtio_disk_init>:

static struct buf* swap_buffer;

void
virtio_disk_init(int id, char * name)
{
    80008da2:	7139                	addi	sp,sp,-64
    80008da4:	fc06                	sd	ra,56(sp)
    80008da6:	f822                	sd	s0,48(sp)
    80008da8:	0080                	addi	s0,sp,64
    80008daa:	87aa                	mv	a5,a0
    80008dac:	fcb43023          	sd	a1,-64(s0)
    80008db0:	fcf42623          	sw	a5,-52(s0)
  uint32 status = 0;
    80008db4:	fe042423          	sw	zero,-24(s0)

  initlock(&disk[id].vdisk_lock, name);
    80008db8:	fcc42703          	lw	a4,-52(s0)
    80008dbc:	15000793          	li	a5,336
    80008dc0:	02f707b3          	mul	a5,a4,a5
    80008dc4:	13078713          	addi	a4,a5,304 # c201130 <_entry-0x73dfeed0>
    80008dc8:	0002d797          	auipc	a5,0x2d
    80008dcc:	ec078793          	addi	a5,a5,-320 # 80035c88 <disk>
    80008dd0:	97ba                	add	a5,a5,a4
    80008dd2:	fc043583          	ld	a1,-64(s0)
    80008dd6:	853e                	mv	a0,a5
    80008dd8:	ffff8097          	auipc	ra,0xffff8
    80008ddc:	522080e7          	jalr	1314(ra) # 800012fa <initlock>
  disk[id].name = name;
    80008de0:	0002d717          	auipc	a4,0x2d
    80008de4:	ea870713          	addi	a4,a4,-344 # 80035c88 <disk>
    80008de8:	fcc42683          	lw	a3,-52(s0)
    80008dec:	15000793          	li	a5,336
    80008df0:	02f687b3          	mul	a5,a3,a5
    80008df4:	97ba                	add	a5,a5,a4
    80008df6:	fc043703          	ld	a4,-64(s0)
    80008dfa:	e398                	sd	a4,0(a5)

  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008dfc:	fcc42703          	lw	a4,-52(s0)
    80008e00:	67c1                	lui	a5,0x10
    80008e02:	0785                	addi	a5,a5,1
    80008e04:	97ba                	add	a5,a5,a4
    80008e06:	07b2                	slli	a5,a5,0xc
    80008e08:	439c                	lw	a5,0(a5)
    80008e0a:	2781                	sext.w	a5,a5
    80008e0c:	873e                	mv	a4,a5
    80008e0e:	747277b7          	lui	a5,0x74727
    80008e12:	97678793          	addi	a5,a5,-1674 # 74726976 <_entry-0xb8d968a>
    80008e16:	04f71c63          	bne	a4,a5,80008e6e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008e1a:	fcc42703          	lw	a4,-52(s0)
    80008e1e:	67c1                	lui	a5,0x10
    80008e20:	0785                	addi	a5,a5,1
    80008e22:	97ba                	add	a5,a5,a4
    80008e24:	07b2                	slli	a5,a5,0xc
    80008e26:	0791                	addi	a5,a5,4
    80008e28:	439c                	lw	a5,0(a5)
    80008e2a:	2781                	sext.w	a5,a5
  if(*R(id, VIRTIO_MMIO_MAGIC_VALUE) != 0x74726976 ||
    80008e2c:	873e                	mv	a4,a5
    80008e2e:	4789                	li	a5,2
    80008e30:	02f71f63          	bne	a4,a5,80008e6e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008e34:	fcc42703          	lw	a4,-52(s0)
    80008e38:	67c1                	lui	a5,0x10
    80008e3a:	0785                	addi	a5,a5,1
    80008e3c:	97ba                	add	a5,a5,a4
    80008e3e:	07b2                	slli	a5,a5,0xc
    80008e40:	07a1                	addi	a5,a5,8
    80008e42:	439c                	lw	a5,0(a5)
    80008e44:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_VERSION) != 2 ||
    80008e46:	873e                	mv	a4,a5
    80008e48:	4789                	li	a5,2
    80008e4a:	02f71263          	bne	a4,a5,80008e6e <virtio_disk_init+0xcc>
     *R(id, VIRTIO_MMIO_VENDOR_ID) != 0x554d4551){
    80008e4e:	fcc42703          	lw	a4,-52(s0)
    80008e52:	67c1                	lui	a5,0x10
    80008e54:	0785                	addi	a5,a5,1
    80008e56:	97ba                	add	a5,a5,a4
    80008e58:	07b2                	slli	a5,a5,0xc
    80008e5a:	07b1                	addi	a5,a5,12
    80008e5c:	439c                	lw	a5,0(a5)
    80008e5e:	2781                	sext.w	a5,a5
     *R(id, VIRTIO_MMIO_DEVICE_ID) != 2 ||
    80008e60:	873e                	mv	a4,a5
    80008e62:	554d47b7          	lui	a5,0x554d4
    80008e66:	55178793          	addi	a5,a5,1361 # 554d4551 <_entry-0x2ab2baaf>
    80008e6a:	00f70d63          	beq	a4,a5,80008e84 <virtio_disk_init+0xe2>
    panic_concat(2, "could not find virtio disk: ", name);
    80008e6e:	fc043603          	ld	a2,-64(s0)
    80008e72:	00003597          	auipc	a1,0x3
    80008e76:	7fe58593          	addi	a1,a1,2046 # 8000c670 <etext+0x670>
    80008e7a:	4509                	li	a0,2
    80008e7c:	ffff8097          	auipc	ra,0xffff8
    80008e80:	e62080e7          	jalr	-414(ra) # 80000cde <panic_concat>
  }
  
  // reset device
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008e84:	fcc42703          	lw	a4,-52(s0)
    80008e88:	67c1                	lui	a5,0x10
    80008e8a:	0785                	addi	a5,a5,1
    80008e8c:	97ba                	add	a5,a5,a4
    80008e8e:	07b2                	slli	a5,a5,0xc
    80008e90:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008e94:	873e                	mv	a4,a5
    80008e96:	fe842783          	lw	a5,-24(s0)
    80008e9a:	c31c                	sw	a5,0(a4)

  // set ACKNOWLEDGE status bit
  status |= VIRTIO_CONFIG_S_ACKNOWLEDGE;
    80008e9c:	fe842783          	lw	a5,-24(s0)
    80008ea0:	0017e793          	ori	a5,a5,1
    80008ea4:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008ea8:	fcc42703          	lw	a4,-52(s0)
    80008eac:	67c1                	lui	a5,0x10
    80008eae:	0785                	addi	a5,a5,1
    80008eb0:	97ba                	add	a5,a5,a4
    80008eb2:	07b2                	slli	a5,a5,0xc
    80008eb4:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008eb8:	873e                	mv	a4,a5
    80008eba:	fe842783          	lw	a5,-24(s0)
    80008ebe:	c31c                	sw	a5,0(a4)

  // set DRIVER status bit
  status |= VIRTIO_CONFIG_S_DRIVER;
    80008ec0:	fe842783          	lw	a5,-24(s0)
    80008ec4:	0027e793          	ori	a5,a5,2
    80008ec8:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008ecc:	fcc42703          	lw	a4,-52(s0)
    80008ed0:	67c1                	lui	a5,0x10
    80008ed2:	0785                	addi	a5,a5,1
    80008ed4:	97ba                	add	a5,a5,a4
    80008ed6:	07b2                	slli	a5,a5,0xc
    80008ed8:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008edc:	873e                	mv	a4,a5
    80008ede:	fe842783          	lw	a5,-24(s0)
    80008ee2:	c31c                	sw	a5,0(a4)

  // negotiate features
  uint64 features = *R(id, VIRTIO_MMIO_DEVICE_FEATURES);
    80008ee4:	fcc42703          	lw	a4,-52(s0)
    80008ee8:	67c1                	lui	a5,0x10
    80008eea:	0785                	addi	a5,a5,1
    80008eec:	97ba                	add	a5,a5,a4
    80008eee:	07b2                	slli	a5,a5,0xc
    80008ef0:	07c1                	addi	a5,a5,16
    80008ef2:	439c                	lw	a5,0(a5)
    80008ef4:	2781                	sext.w	a5,a5
    80008ef6:	1782                	slli	a5,a5,0x20
    80008ef8:	9381                	srli	a5,a5,0x20
    80008efa:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_RO);
    80008efe:	fe043783          	ld	a5,-32(s0)
    80008f02:	fdf7f793          	andi	a5,a5,-33
    80008f06:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_SCSI);
    80008f0a:	fe043783          	ld	a5,-32(s0)
    80008f0e:	f7f7f793          	andi	a5,a5,-129
    80008f12:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_CONFIG_WCE);
    80008f16:	fe043703          	ld	a4,-32(s0)
    80008f1a:	77fd                	lui	a5,0xfffff
    80008f1c:	7ff78793          	addi	a5,a5,2047 # fffffffffffff7ff <end+0xffffffff7ffc98cf>
    80008f20:	8ff9                	and	a5,a5,a4
    80008f22:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_BLK_F_MQ);
    80008f26:	fe043703          	ld	a4,-32(s0)
    80008f2a:	77fd                	lui	a5,0xfffff
    80008f2c:	17fd                	addi	a5,a5,-1
    80008f2e:	8ff9                	and	a5,a5,a4
    80008f30:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_F_ANY_LAYOUT);
    80008f34:	fe043703          	ld	a4,-32(s0)
    80008f38:	f80007b7          	lui	a5,0xf8000
    80008f3c:	17fd                	addi	a5,a5,-1
    80008f3e:	8ff9                	and	a5,a5,a4
    80008f40:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_EVENT_IDX);
    80008f44:	fe043703          	ld	a4,-32(s0)
    80008f48:	e00007b7          	lui	a5,0xe0000
    80008f4c:	17fd                	addi	a5,a5,-1
    80008f4e:	8ff9                	and	a5,a5,a4
    80008f50:	fef43023          	sd	a5,-32(s0)
  features &= ~(1 << VIRTIO_RING_F_INDIRECT_DESC);
    80008f54:	fe043703          	ld	a4,-32(s0)
    80008f58:	f00007b7          	lui	a5,0xf0000
    80008f5c:	17fd                	addi	a5,a5,-1
    80008f5e:	8ff9                	and	a5,a5,a4
    80008f60:	fef43023          	sd	a5,-32(s0)
  *R(id, VIRTIO_MMIO_DRIVER_FEATURES) = features;
    80008f64:	fcc42703          	lw	a4,-52(s0)
    80008f68:	67c1                	lui	a5,0x10
    80008f6a:	0785                	addi	a5,a5,1
    80008f6c:	97ba                	add	a5,a5,a4
    80008f6e:	07b2                	slli	a5,a5,0xc
    80008f70:	02078793          	addi	a5,a5,32 # 10020 <_entry-0x7ffeffe0>
    80008f74:	873e                	mv	a4,a5
    80008f76:	fe043783          	ld	a5,-32(s0)
    80008f7a:	2781                	sext.w	a5,a5
    80008f7c:	c31c                	sw	a5,0(a4)

  // tell device that feature negotiation is complete.
  status |= VIRTIO_CONFIG_S_FEATURES_OK;
    80008f7e:	fe842783          	lw	a5,-24(s0)
    80008f82:	0087e793          	ori	a5,a5,8
    80008f86:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80008f8a:	fcc42703          	lw	a4,-52(s0)
    80008f8e:	67c1                	lui	a5,0x10
    80008f90:	0785                	addi	a5,a5,1
    80008f92:	97ba                	add	a5,a5,a4
    80008f94:	07b2                	slli	a5,a5,0xc
    80008f96:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008f9a:	873e                	mv	a4,a5
    80008f9c:	fe842783          	lw	a5,-24(s0)
    80008fa0:	c31c                	sw	a5,0(a4)

  // re-read status to ensure FEATURES_OK is set.
  status = *R(id, VIRTIO_MMIO_STATUS);
    80008fa2:	fcc42703          	lw	a4,-52(s0)
    80008fa6:	67c1                	lui	a5,0x10
    80008fa8:	0785                	addi	a5,a5,1
    80008faa:	97ba                	add	a5,a5,a4
    80008fac:	07b2                	slli	a5,a5,0xc
    80008fae:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80008fb2:	439c                	lw	a5,0(a5)
    80008fb4:	fef42423          	sw	a5,-24(s0)
  if(!(status & VIRTIO_CONFIG_S_FEATURES_OK))
    80008fb8:	fe842783          	lw	a5,-24(s0)
    80008fbc:	8ba1                	andi	a5,a5,8
    80008fbe:	2781                	sext.w	a5,a5
    80008fc0:	ef81                	bnez	a5,80008fd8 <virtio_disk_init+0x236>
      panic_concat(2, name, ": virtio disk FEATURES_OK unset");
    80008fc2:	00003617          	auipc	a2,0x3
    80008fc6:	6ce60613          	addi	a2,a2,1742 # 8000c690 <etext+0x690>
    80008fca:	fc043583          	ld	a1,-64(s0)
    80008fce:	4509                	li	a0,2
    80008fd0:	ffff8097          	auipc	ra,0xffff8
    80008fd4:	d0e080e7          	jalr	-754(ra) # 80000cde <panic_concat>

  // initialize queue 0.
  *R(id, VIRTIO_MMIO_QUEUE_SEL) = 0;
    80008fd8:	fcc42703          	lw	a4,-52(s0)
    80008fdc:	67c1                	lui	a5,0x10
    80008fde:	0785                	addi	a5,a5,1
    80008fe0:	97ba                	add	a5,a5,a4
    80008fe2:	07b2                	slli	a5,a5,0xc
    80008fe4:	03078793          	addi	a5,a5,48 # 10030 <_entry-0x7ffeffd0>
    80008fe8:	0007a023          	sw	zero,0(a5)

  // ensure queue 0 is not in use.
  if(*R(id, VIRTIO_MMIO_QUEUE_READY))
    80008fec:	fcc42703          	lw	a4,-52(s0)
    80008ff0:	67c1                	lui	a5,0x10
    80008ff2:	0785                	addi	a5,a5,1
    80008ff4:	97ba                	add	a5,a5,a4
    80008ff6:	07b2                	slli	a5,a5,0xc
    80008ff8:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80008ffc:	439c                	lw	a5,0(a5)
    80008ffe:	2781                	sext.w	a5,a5
    80009000:	cf81                	beqz	a5,80009018 <virtio_disk_init+0x276>
      panic_concat(2, name, ": virtio disk should not be ready");
    80009002:	00003617          	auipc	a2,0x3
    80009006:	6ae60613          	addi	a2,a2,1710 # 8000c6b0 <etext+0x6b0>
    8000900a:	fc043583          	ld	a1,-64(s0)
    8000900e:	4509                	li	a0,2
    80009010:	ffff8097          	auipc	ra,0xffff8
    80009014:	cce080e7          	jalr	-818(ra) # 80000cde <panic_concat>

  // check maximum queue size.
  uint32 max = *R(id, VIRTIO_MMIO_QUEUE_NUM_MAX);
    80009018:	fcc42703          	lw	a4,-52(s0)
    8000901c:	67c1                	lui	a5,0x10
    8000901e:	0785                	addi	a5,a5,1
    80009020:	97ba                	add	a5,a5,a4
    80009022:	07b2                	slli	a5,a5,0xc
    80009024:	03478793          	addi	a5,a5,52 # 10034 <_entry-0x7ffeffcc>
    80009028:	439c                	lw	a5,0(a5)
    8000902a:	fcf42e23          	sw	a5,-36(s0)
  if(max == 0)
    8000902e:	fdc42783          	lw	a5,-36(s0)
    80009032:	2781                	sext.w	a5,a5
    80009034:	ef81                	bnez	a5,8000904c <virtio_disk_init+0x2aa>
      panic_concat(2, name, ": virtio disk has no queue 0");
    80009036:	00003617          	auipc	a2,0x3
    8000903a:	6a260613          	addi	a2,a2,1698 # 8000c6d8 <etext+0x6d8>
    8000903e:	fc043583          	ld	a1,-64(s0)
    80009042:	4509                	li	a0,2
    80009044:	ffff8097          	auipc	ra,0xffff8
    80009048:	c9a080e7          	jalr	-870(ra) # 80000cde <panic_concat>
  if(max < NUM)
    8000904c:	fdc42783          	lw	a5,-36(s0)
    80009050:	0007871b          	sext.w	a4,a5
    80009054:	479d                	li	a5,7
    80009056:	00e7ed63          	bltu	a5,a4,80009070 <virtio_disk_init+0x2ce>
      panic_concat(2, name, ": virtio disk max queue too short");
    8000905a:	00003617          	auipc	a2,0x3
    8000905e:	69e60613          	addi	a2,a2,1694 # 8000c6f8 <etext+0x6f8>
    80009062:	fc043583          	ld	a1,-64(s0)
    80009066:	4509                	li	a0,2
    80009068:	ffff8097          	auipc	ra,0xffff8
    8000906c:	c76080e7          	jalr	-906(ra) # 80000cde <panic_concat>

  // allocate and zero queue memory.
  disk[id].desc = kalloc();
    80009070:	ffff8097          	auipc	ra,0xffff8
    80009074:	166080e7          	jalr	358(ra) # 800011d6 <kalloc>
    80009078:	862a                	mv	a2,a0
    8000907a:	0002d717          	auipc	a4,0x2d
    8000907e:	c0e70713          	addi	a4,a4,-1010 # 80035c88 <disk>
    80009082:	fcc42683          	lw	a3,-52(s0)
    80009086:	15000793          	li	a5,336
    8000908a:	02f687b3          	mul	a5,a3,a5
    8000908e:	97ba                	add	a5,a5,a4
    80009090:	e790                	sd	a2,8(a5)
  disk[id].avail = kalloc();
    80009092:	ffff8097          	auipc	ra,0xffff8
    80009096:	144080e7          	jalr	324(ra) # 800011d6 <kalloc>
    8000909a:	862a                	mv	a2,a0
    8000909c:	0002d717          	auipc	a4,0x2d
    800090a0:	bec70713          	addi	a4,a4,-1044 # 80035c88 <disk>
    800090a4:	fcc42683          	lw	a3,-52(s0)
    800090a8:	15000793          	li	a5,336
    800090ac:	02f687b3          	mul	a5,a3,a5
    800090b0:	97ba                	add	a5,a5,a4
    800090b2:	eb90                	sd	a2,16(a5)
  disk[id].used = kalloc();
    800090b4:	ffff8097          	auipc	ra,0xffff8
    800090b8:	122080e7          	jalr	290(ra) # 800011d6 <kalloc>
    800090bc:	862a                	mv	a2,a0
    800090be:	0002d717          	auipc	a4,0x2d
    800090c2:	bca70713          	addi	a4,a4,-1078 # 80035c88 <disk>
    800090c6:	fcc42683          	lw	a3,-52(s0)
    800090ca:	15000793          	li	a5,336
    800090ce:	02f687b3          	mul	a5,a3,a5
    800090d2:	97ba                	add	a5,a5,a4
    800090d4:	ef90                	sd	a2,24(a5)
  if(!disk[id].desc || !disk[id].avail || !disk[id].used)
    800090d6:	0002d717          	auipc	a4,0x2d
    800090da:	bb270713          	addi	a4,a4,-1102 # 80035c88 <disk>
    800090de:	fcc42683          	lw	a3,-52(s0)
    800090e2:	15000793          	li	a5,336
    800090e6:	02f687b3          	mul	a5,a3,a5
    800090ea:	97ba                	add	a5,a5,a4
    800090ec:	679c                	ld	a5,8(a5)
    800090ee:	cb9d                	beqz	a5,80009124 <virtio_disk_init+0x382>
    800090f0:	0002d717          	auipc	a4,0x2d
    800090f4:	b9870713          	addi	a4,a4,-1128 # 80035c88 <disk>
    800090f8:	fcc42683          	lw	a3,-52(s0)
    800090fc:	15000793          	li	a5,336
    80009100:	02f687b3          	mul	a5,a3,a5
    80009104:	97ba                	add	a5,a5,a4
    80009106:	6b9c                	ld	a5,16(a5)
    80009108:	cf91                	beqz	a5,80009124 <virtio_disk_init+0x382>
    8000910a:	0002d717          	auipc	a4,0x2d
    8000910e:	b7e70713          	addi	a4,a4,-1154 # 80035c88 <disk>
    80009112:	fcc42683          	lw	a3,-52(s0)
    80009116:	15000793          	li	a5,336
    8000911a:	02f687b3          	mul	a5,a3,a5
    8000911e:	97ba                	add	a5,a5,a4
    80009120:	6f9c                	ld	a5,24(a5)
    80009122:	ef81                	bnez	a5,8000913a <virtio_disk_init+0x398>
      panic_concat(2, name, ": virtio disk kalloc");
    80009124:	00003617          	auipc	a2,0x3
    80009128:	5fc60613          	addi	a2,a2,1532 # 8000c720 <etext+0x720>
    8000912c:	fc043583          	ld	a1,-64(s0)
    80009130:	4509                	li	a0,2
    80009132:	ffff8097          	auipc	ra,0xffff8
    80009136:	bac080e7          	jalr	-1108(ra) # 80000cde <panic_concat>
  memset(disk[id].desc, 0, PGSIZE);
    8000913a:	0002d717          	auipc	a4,0x2d
    8000913e:	b4e70713          	addi	a4,a4,-1202 # 80035c88 <disk>
    80009142:	fcc42683          	lw	a3,-52(s0)
    80009146:	15000793          	li	a5,336
    8000914a:	02f687b3          	mul	a5,a3,a5
    8000914e:	97ba                	add	a5,a5,a4
    80009150:	679c                	ld	a5,8(a5)
    80009152:	6605                	lui	a2,0x1
    80009154:	4581                	li	a1,0
    80009156:	853e                	mv	a0,a5
    80009158:	ffff8097          	auipc	ra,0xffff8
    8000915c:	3a6080e7          	jalr	934(ra) # 800014fe <memset>
  memset(disk[id].avail, 0, PGSIZE);
    80009160:	0002d717          	auipc	a4,0x2d
    80009164:	b2870713          	addi	a4,a4,-1240 # 80035c88 <disk>
    80009168:	fcc42683          	lw	a3,-52(s0)
    8000916c:	15000793          	li	a5,336
    80009170:	02f687b3          	mul	a5,a3,a5
    80009174:	97ba                	add	a5,a5,a4
    80009176:	6b9c                	ld	a5,16(a5)
    80009178:	6605                	lui	a2,0x1
    8000917a:	4581                	li	a1,0
    8000917c:	853e                	mv	a0,a5
    8000917e:	ffff8097          	auipc	ra,0xffff8
    80009182:	380080e7          	jalr	896(ra) # 800014fe <memset>
  memset(disk[id].used, 0, PGSIZE);
    80009186:	0002d717          	auipc	a4,0x2d
    8000918a:	b0270713          	addi	a4,a4,-1278 # 80035c88 <disk>
    8000918e:	fcc42683          	lw	a3,-52(s0)
    80009192:	15000793          	li	a5,336
    80009196:	02f687b3          	mul	a5,a3,a5
    8000919a:	97ba                	add	a5,a5,a4
    8000919c:	6f9c                	ld	a5,24(a5)
    8000919e:	6605                	lui	a2,0x1
    800091a0:	4581                	li	a1,0
    800091a2:	853e                	mv	a0,a5
    800091a4:	ffff8097          	auipc	ra,0xffff8
    800091a8:	35a080e7          	jalr	858(ra) # 800014fe <memset>

  // set queue size.
  *R(id, VIRTIO_MMIO_QUEUE_NUM) = NUM;
    800091ac:	fcc42703          	lw	a4,-52(s0)
    800091b0:	67c1                	lui	a5,0x10
    800091b2:	0785                	addi	a5,a5,1
    800091b4:	97ba                	add	a5,a5,a4
    800091b6:	07b2                	slli	a5,a5,0xc
    800091b8:	03878793          	addi	a5,a5,56 # 10038 <_entry-0x7ffeffc8>
    800091bc:	873e                	mv	a4,a5
    800091be:	47a1                	li	a5,8
    800091c0:	c31c                	sw	a5,0(a4)

  // write physical addresses.
  *R(id, VIRTIO_MMIO_QUEUE_DESC_LOW) = (uint64)disk[id].desc;
    800091c2:	0002d717          	auipc	a4,0x2d
    800091c6:	ac670713          	addi	a4,a4,-1338 # 80035c88 <disk>
    800091ca:	fcc42683          	lw	a3,-52(s0)
    800091ce:	15000793          	li	a5,336
    800091d2:	02f687b3          	mul	a5,a3,a5
    800091d6:	97ba                	add	a5,a5,a4
    800091d8:	679c                	ld	a5,8(a5)
    800091da:	86be                	mv	a3,a5
    800091dc:	fcc42703          	lw	a4,-52(s0)
    800091e0:	67c1                	lui	a5,0x10
    800091e2:	0785                	addi	a5,a5,1
    800091e4:	97ba                	add	a5,a5,a4
    800091e6:	07b2                	slli	a5,a5,0xc
    800091e8:	08078793          	addi	a5,a5,128 # 10080 <_entry-0x7ffeff80>
    800091ec:	873e                	mv	a4,a5
    800091ee:	0006879b          	sext.w	a5,a3
    800091f2:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_QUEUE_DESC_HIGH) = (uint64)disk[id].desc >> 32;
    800091f4:	0002d717          	auipc	a4,0x2d
    800091f8:	a9470713          	addi	a4,a4,-1388 # 80035c88 <disk>
    800091fc:	fcc42683          	lw	a3,-52(s0)
    80009200:	15000793          	li	a5,336
    80009204:	02f687b3          	mul	a5,a3,a5
    80009208:	97ba                	add	a5,a5,a4
    8000920a:	679c                	ld	a5,8(a5)
    8000920c:	0207d693          	srli	a3,a5,0x20
    80009210:	fcc42703          	lw	a4,-52(s0)
    80009214:	67c1                	lui	a5,0x10
    80009216:	0785                	addi	a5,a5,1
    80009218:	97ba                	add	a5,a5,a4
    8000921a:	07b2                	slli	a5,a5,0xc
    8000921c:	08478793          	addi	a5,a5,132 # 10084 <_entry-0x7ffeff7c>
    80009220:	873e                	mv	a4,a5
    80009222:	0006879b          	sext.w	a5,a3
    80009226:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_LOW) = (uint64)disk[id].avail;
    80009228:	0002d717          	auipc	a4,0x2d
    8000922c:	a6070713          	addi	a4,a4,-1440 # 80035c88 <disk>
    80009230:	fcc42683          	lw	a3,-52(s0)
    80009234:	15000793          	li	a5,336
    80009238:	02f687b3          	mul	a5,a3,a5
    8000923c:	97ba                	add	a5,a5,a4
    8000923e:	6b9c                	ld	a5,16(a5)
    80009240:	86be                	mv	a3,a5
    80009242:	fcc42703          	lw	a4,-52(s0)
    80009246:	67c1                	lui	a5,0x10
    80009248:	0785                	addi	a5,a5,1
    8000924a:	97ba                	add	a5,a5,a4
    8000924c:	07b2                	slli	a5,a5,0xc
    8000924e:	09078793          	addi	a5,a5,144 # 10090 <_entry-0x7ffeff70>
    80009252:	873e                	mv	a4,a5
    80009254:	0006879b          	sext.w	a5,a3
    80009258:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DRIVER_DESC_HIGH) = (uint64)disk[id].avail >> 32;
    8000925a:	0002d717          	auipc	a4,0x2d
    8000925e:	a2e70713          	addi	a4,a4,-1490 # 80035c88 <disk>
    80009262:	fcc42683          	lw	a3,-52(s0)
    80009266:	15000793          	li	a5,336
    8000926a:	02f687b3          	mul	a5,a3,a5
    8000926e:	97ba                	add	a5,a5,a4
    80009270:	6b9c                	ld	a5,16(a5)
    80009272:	0207d693          	srli	a3,a5,0x20
    80009276:	fcc42703          	lw	a4,-52(s0)
    8000927a:	67c1                	lui	a5,0x10
    8000927c:	0785                	addi	a5,a5,1
    8000927e:	97ba                	add	a5,a5,a4
    80009280:	07b2                	slli	a5,a5,0xc
    80009282:	09478793          	addi	a5,a5,148 # 10094 <_entry-0x7ffeff6c>
    80009286:	873e                	mv	a4,a5
    80009288:	0006879b          	sext.w	a5,a3
    8000928c:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_LOW) = (uint64)disk[id].used;
    8000928e:	0002d717          	auipc	a4,0x2d
    80009292:	9fa70713          	addi	a4,a4,-1542 # 80035c88 <disk>
    80009296:	fcc42683          	lw	a3,-52(s0)
    8000929a:	15000793          	li	a5,336
    8000929e:	02f687b3          	mul	a5,a3,a5
    800092a2:	97ba                	add	a5,a5,a4
    800092a4:	6f9c                	ld	a5,24(a5)
    800092a6:	86be                	mv	a3,a5
    800092a8:	fcc42703          	lw	a4,-52(s0)
    800092ac:	67c1                	lui	a5,0x10
    800092ae:	0785                	addi	a5,a5,1
    800092b0:	97ba                	add	a5,a5,a4
    800092b2:	07b2                	slli	a5,a5,0xc
    800092b4:	0a078793          	addi	a5,a5,160 # 100a0 <_entry-0x7ffeff60>
    800092b8:	873e                	mv	a4,a5
    800092ba:	0006879b          	sext.w	a5,a3
    800092be:	c31c                	sw	a5,0(a4)
  *R(id, VIRTIO_MMIO_DEVICE_DESC_HIGH) = (uint64)disk[id].used >> 32;
    800092c0:	0002d717          	auipc	a4,0x2d
    800092c4:	9c870713          	addi	a4,a4,-1592 # 80035c88 <disk>
    800092c8:	fcc42683          	lw	a3,-52(s0)
    800092cc:	15000793          	li	a5,336
    800092d0:	02f687b3          	mul	a5,a3,a5
    800092d4:	97ba                	add	a5,a5,a4
    800092d6:	6f9c                	ld	a5,24(a5)
    800092d8:	0207d693          	srli	a3,a5,0x20
    800092dc:	fcc42703          	lw	a4,-52(s0)
    800092e0:	67c1                	lui	a5,0x10
    800092e2:	0785                	addi	a5,a5,1
    800092e4:	97ba                	add	a5,a5,a4
    800092e6:	07b2                	slli	a5,a5,0xc
    800092e8:	0a478793          	addi	a5,a5,164 # 100a4 <_entry-0x7ffeff5c>
    800092ec:	873e                	mv	a4,a5
    800092ee:	0006879b          	sext.w	a5,a3
    800092f2:	c31c                	sw	a5,0(a4)

  // queue is ready.
  *R(id, VIRTIO_MMIO_QUEUE_READY) = 0x1;
    800092f4:	fcc42703          	lw	a4,-52(s0)
    800092f8:	67c1                	lui	a5,0x10
    800092fa:	0785                	addi	a5,a5,1
    800092fc:	97ba                	add	a5,a5,a4
    800092fe:	07b2                	slli	a5,a5,0xc
    80009300:	04478793          	addi	a5,a5,68 # 10044 <_entry-0x7ffeffbc>
    80009304:	873e                	mv	a4,a5
    80009306:	4785                	li	a5,1
    80009308:	c31c                	sw	a5,0(a4)

  // all NUM descriptors start out unused.
  for(int i = 0; i < NUM; i++)
    8000930a:	fe042623          	sw	zero,-20(s0)
    8000930e:	a03d                	j	8000933c <virtio_disk_init+0x59a>
    disk[id].free[i] = 1;
    80009310:	0002d697          	auipc	a3,0x2d
    80009314:	97868693          	addi	a3,a3,-1672 # 80035c88 <disk>
    80009318:	fec42703          	lw	a4,-20(s0)
    8000931c:	fcc42603          	lw	a2,-52(s0)
    80009320:	15000793          	li	a5,336
    80009324:	02f607b3          	mul	a5,a2,a5
    80009328:	97b6                	add	a5,a5,a3
    8000932a:	97ba                	add	a5,a5,a4
    8000932c:	4705                	li	a4,1
    8000932e:	02e78023          	sb	a4,32(a5)
  for(int i = 0; i < NUM; i++)
    80009332:	fec42783          	lw	a5,-20(s0)
    80009336:	2785                	addiw	a5,a5,1
    80009338:	fef42623          	sw	a5,-20(s0)
    8000933c:	fec42783          	lw	a5,-20(s0)
    80009340:	0007871b          	sext.w	a4,a5
    80009344:	479d                	li	a5,7
    80009346:	fce7d5e3          	bge	a5,a4,80009310 <virtio_disk_init+0x56e>

  // tell device we're completely ready.
  status |= VIRTIO_CONFIG_S_DRIVER_OK;
    8000934a:	fe842783          	lw	a5,-24(s0)
    8000934e:	0047e793          	ori	a5,a5,4
    80009352:	fef42423          	sw	a5,-24(s0)
  *R(id, VIRTIO_MMIO_STATUS) = status;
    80009356:	fcc42703          	lw	a4,-52(s0)
    8000935a:	67c1                	lui	a5,0x10
    8000935c:	0785                	addi	a5,a5,1
    8000935e:	97ba                	add	a5,a5,a4
    80009360:	07b2                	slli	a5,a5,0xc
    80009362:	07078793          	addi	a5,a5,112 # 10070 <_entry-0x7ffeff90>
    80009366:	873e                	mv	a4,a5
    80009368:	fe842783          	lw	a5,-24(s0)
    8000936c:	c31c                	sw	a5,0(a4)

  if (id == VIRTIO1_ID) {
    8000936e:	fcc42783          	lw	a5,-52(s0)
    80009372:	0007871b          	sext.w	a4,a5
    80009376:	4785                	li	a5,1
    80009378:	06f71663          	bne	a4,a5,800093e4 <virtio_disk_init+0x642>
    swap_buffer = kalloc();
    8000937c:	ffff8097          	auipc	ra,0xffff8
    80009380:	e5a080e7          	jalr	-422(ra) # 800011d6 <kalloc>
    80009384:	872a                	mv	a4,a0
    80009386:	0002d797          	auipc	a5,0x2d
    8000938a:	ba278793          	addi	a5,a5,-1118 # 80035f28 <swap_buffer>
    8000938e:	e398                	sd	a4,0(a5)
    if (!swap_buffer) {
    80009390:	0002d797          	auipc	a5,0x2d
    80009394:	b9878793          	addi	a5,a5,-1128 # 80035f28 <swap_buffer>
    80009398:	639c                	ld	a5,0(a5)
    8000939a:	eb89                	bnez	a5,800093ac <virtio_disk_init+0x60a>
      panic("virtio_disk_init: kalloc of swap_buffer failed");
    8000939c:	00003517          	auipc	a0,0x3
    800093a0:	39c50513          	addi	a0,a0,924 # 8000c738 <etext+0x738>
    800093a4:	ffff8097          	auipc	ra,0xffff8
    800093a8:	8e8080e7          	jalr	-1816(ra) # 80000c8c <panic>
    }
    memset(swap_buffer, 0, BSIZE);
    800093ac:	0002d797          	auipc	a5,0x2d
    800093b0:	b7c78793          	addi	a5,a5,-1156 # 80035f28 <swap_buffer>
    800093b4:	639c                	ld	a5,0(a5)
    800093b6:	40000613          	li	a2,1024
    800093ba:	4581                	li	a1,0
    800093bc:	853e                	mv	a0,a5
    800093be:	ffff8097          	auipc	ra,0xffff8
    800093c2:	140080e7          	jalr	320(ra) # 800014fe <memset>
    initsleeplock(&swap_buffer->lock, "swap_buffer");
    800093c6:	0002d797          	auipc	a5,0x2d
    800093ca:	b6278793          	addi	a5,a5,-1182 # 80035f28 <swap_buffer>
    800093ce:	639c                	ld	a5,0(a5)
    800093d0:	07c1                	addi	a5,a5,16
    800093d2:	00003597          	auipc	a1,0x3
    800093d6:	39658593          	addi	a1,a1,918 # 8000c768 <etext+0x768>
    800093da:	853e                	mv	a0,a5
    800093dc:	ffffd097          	auipc	ra,0xffffd
    800093e0:	4a8080e7          	jalr	1192(ra) # 80006884 <initsleeplock>
  }

  // plic.c and trap.c arrange for interrupts from VIRTIO0_IRQ and VIRTIO1_IRQ.
}
    800093e4:	0001                	nop
    800093e6:	70e2                	ld	ra,56(sp)
    800093e8:	7442                	ld	s0,48(sp)
    800093ea:	6121                	addi	sp,sp,64
    800093ec:	8082                	ret

00000000800093ee <alloc_desc>:

// find a free descriptor, mark it non-free, return its index.
static int
alloc_desc(int id)
{
    800093ee:	7179                	addi	sp,sp,-48
    800093f0:	f422                	sd	s0,40(sp)
    800093f2:	1800                	addi	s0,sp,48
    800093f4:	87aa                	mv	a5,a0
    800093f6:	fcf42e23          	sw	a5,-36(s0)
  for(int i = 0; i < NUM; i++){
    800093fa:	fe042623          	sw	zero,-20(s0)
    800093fe:	a891                	j	80009452 <alloc_desc+0x64>
    if(disk[id].free[i]){
    80009400:	0002d697          	auipc	a3,0x2d
    80009404:	88868693          	addi	a3,a3,-1912 # 80035c88 <disk>
    80009408:	fec42703          	lw	a4,-20(s0)
    8000940c:	fdc42603          	lw	a2,-36(s0)
    80009410:	15000793          	li	a5,336
    80009414:	02f607b3          	mul	a5,a2,a5
    80009418:	97b6                	add	a5,a5,a3
    8000941a:	97ba                	add	a5,a5,a4
    8000941c:	0207c783          	lbu	a5,32(a5)
    80009420:	c785                	beqz	a5,80009448 <alloc_desc+0x5a>
      disk[id].free[i] = 0;
    80009422:	0002d697          	auipc	a3,0x2d
    80009426:	86668693          	addi	a3,a3,-1946 # 80035c88 <disk>
    8000942a:	fec42703          	lw	a4,-20(s0)
    8000942e:	fdc42603          	lw	a2,-36(s0)
    80009432:	15000793          	li	a5,336
    80009436:	02f607b3          	mul	a5,a2,a5
    8000943a:	97b6                	add	a5,a5,a3
    8000943c:	97ba                	add	a5,a5,a4
    8000943e:	02078023          	sb	zero,32(a5)
      return i;
    80009442:	fec42783          	lw	a5,-20(s0)
    80009446:	a831                	j	80009462 <alloc_desc+0x74>
  for(int i = 0; i < NUM; i++){
    80009448:	fec42783          	lw	a5,-20(s0)
    8000944c:	2785                	addiw	a5,a5,1
    8000944e:	fef42623          	sw	a5,-20(s0)
    80009452:	fec42783          	lw	a5,-20(s0)
    80009456:	0007871b          	sext.w	a4,a5
    8000945a:	479d                	li	a5,7
    8000945c:	fae7d2e3          	bge	a5,a4,80009400 <alloc_desc+0x12>
    }
  }
  return -1;
    80009460:	57fd                	li	a5,-1
}
    80009462:	853e                	mv	a0,a5
    80009464:	7422                	ld	s0,40(sp)
    80009466:	6145                	addi	sp,sp,48
    80009468:	8082                	ret

000000008000946a <free_desc>:

// mark a descriptor as free.
static void
free_desc(int id, int i)
{
    8000946a:	1101                	addi	sp,sp,-32
    8000946c:	ec06                	sd	ra,24(sp)
    8000946e:	e822                	sd	s0,16(sp)
    80009470:	1000                	addi	s0,sp,32
    80009472:	87aa                	mv	a5,a0
    80009474:	872e                	mv	a4,a1
    80009476:	fef42623          	sw	a5,-20(s0)
    8000947a:	87ba                	mv	a5,a4
    8000947c:	fef42423          	sw	a5,-24(s0)
  if(i >= NUM)
    80009480:	fe842783          	lw	a5,-24(s0)
    80009484:	0007871b          	sext.w	a4,a5
    80009488:	479d                	li	a5,7
    8000948a:	02e7d863          	bge	a5,a4,800094ba <free_desc+0x50>
    panic_concat(2, disk[id].name, ": free_desc 1");
    8000948e:	0002c717          	auipc	a4,0x2c
    80009492:	7fa70713          	addi	a4,a4,2042 # 80035c88 <disk>
    80009496:	fec42683          	lw	a3,-20(s0)
    8000949a:	15000793          	li	a5,336
    8000949e:	02f687b3          	mul	a5,a3,a5
    800094a2:	97ba                	add	a5,a5,a4
    800094a4:	639c                	ld	a5,0(a5)
    800094a6:	00003617          	auipc	a2,0x3
    800094aa:	2d260613          	addi	a2,a2,722 # 8000c778 <etext+0x778>
    800094ae:	85be                	mv	a1,a5
    800094b0:	4509                	li	a0,2
    800094b2:	ffff8097          	auipc	ra,0xffff8
    800094b6:	82c080e7          	jalr	-2004(ra) # 80000cde <panic_concat>
  if(disk[id].free[i])
    800094ba:	0002c697          	auipc	a3,0x2c
    800094be:	7ce68693          	addi	a3,a3,1998 # 80035c88 <disk>
    800094c2:	fe842703          	lw	a4,-24(s0)
    800094c6:	fec42603          	lw	a2,-20(s0)
    800094ca:	15000793          	li	a5,336
    800094ce:	02f607b3          	mul	a5,a2,a5
    800094d2:	97b6                	add	a5,a5,a3
    800094d4:	97ba                	add	a5,a5,a4
    800094d6:	0207c783          	lbu	a5,32(a5)
    800094da:	c79d                	beqz	a5,80009508 <free_desc+0x9e>
      panic_concat(2, disk[id].name, ": free_desc 2");
    800094dc:	0002c717          	auipc	a4,0x2c
    800094e0:	7ac70713          	addi	a4,a4,1964 # 80035c88 <disk>
    800094e4:	fec42683          	lw	a3,-20(s0)
    800094e8:	15000793          	li	a5,336
    800094ec:	02f687b3          	mul	a5,a3,a5
    800094f0:	97ba                	add	a5,a5,a4
    800094f2:	639c                	ld	a5,0(a5)
    800094f4:	00003617          	auipc	a2,0x3
    800094f8:	29460613          	addi	a2,a2,660 # 8000c788 <etext+0x788>
    800094fc:	85be                	mv	a1,a5
    800094fe:	4509                	li	a0,2
    80009500:	ffff7097          	auipc	ra,0xffff7
    80009504:	7de080e7          	jalr	2014(ra) # 80000cde <panic_concat>
  disk[id].desc[i].addr = 0;
    80009508:	0002c717          	auipc	a4,0x2c
    8000950c:	78070713          	addi	a4,a4,1920 # 80035c88 <disk>
    80009510:	fec42683          	lw	a3,-20(s0)
    80009514:	15000793          	li	a5,336
    80009518:	02f687b3          	mul	a5,a3,a5
    8000951c:	97ba                	add	a5,a5,a4
    8000951e:	6798                	ld	a4,8(a5)
    80009520:	fe842783          	lw	a5,-24(s0)
    80009524:	0792                	slli	a5,a5,0x4
    80009526:	97ba                	add	a5,a5,a4
    80009528:	0007b023          	sd	zero,0(a5)
  disk[id].desc[i].len = 0;
    8000952c:	0002c717          	auipc	a4,0x2c
    80009530:	75c70713          	addi	a4,a4,1884 # 80035c88 <disk>
    80009534:	fec42683          	lw	a3,-20(s0)
    80009538:	15000793          	li	a5,336
    8000953c:	02f687b3          	mul	a5,a3,a5
    80009540:	97ba                	add	a5,a5,a4
    80009542:	6798                	ld	a4,8(a5)
    80009544:	fe842783          	lw	a5,-24(s0)
    80009548:	0792                	slli	a5,a5,0x4
    8000954a:	97ba                	add	a5,a5,a4
    8000954c:	0007a423          	sw	zero,8(a5)
  disk[id].desc[i].flags = 0;
    80009550:	0002c717          	auipc	a4,0x2c
    80009554:	73870713          	addi	a4,a4,1848 # 80035c88 <disk>
    80009558:	fec42683          	lw	a3,-20(s0)
    8000955c:	15000793          	li	a5,336
    80009560:	02f687b3          	mul	a5,a3,a5
    80009564:	97ba                	add	a5,a5,a4
    80009566:	6798                	ld	a4,8(a5)
    80009568:	fe842783          	lw	a5,-24(s0)
    8000956c:	0792                	slli	a5,a5,0x4
    8000956e:	97ba                	add	a5,a5,a4
    80009570:	00079623          	sh	zero,12(a5)
  disk[id].desc[i].next = 0;
    80009574:	0002c717          	auipc	a4,0x2c
    80009578:	71470713          	addi	a4,a4,1812 # 80035c88 <disk>
    8000957c:	fec42683          	lw	a3,-20(s0)
    80009580:	15000793          	li	a5,336
    80009584:	02f687b3          	mul	a5,a3,a5
    80009588:	97ba                	add	a5,a5,a4
    8000958a:	6798                	ld	a4,8(a5)
    8000958c:	fe842783          	lw	a5,-24(s0)
    80009590:	0792                	slli	a5,a5,0x4
    80009592:	97ba                	add	a5,a5,a4
    80009594:	00079723          	sh	zero,14(a5)
  disk[id].free[i] = 1;
    80009598:	0002c697          	auipc	a3,0x2c
    8000959c:	6f068693          	addi	a3,a3,1776 # 80035c88 <disk>
    800095a0:	fe842703          	lw	a4,-24(s0)
    800095a4:	fec42603          	lw	a2,-20(s0)
    800095a8:	15000793          	li	a5,336
    800095ac:	02f607b3          	mul	a5,a2,a5
    800095b0:	97b6                	add	a5,a5,a3
    800095b2:	97ba                	add	a5,a5,a4
    800095b4:	4705                	li	a4,1
    800095b6:	02e78023          	sb	a4,32(a5)
  if (!disk[id].bw_transfer) {
    800095ba:	0002c717          	auipc	a4,0x2c
    800095be:	6ce70713          	addi	a4,a4,1742 # 80035c88 <disk>
    800095c2:	fec42683          	lw	a3,-20(s0)
    800095c6:	15000793          	li	a5,336
    800095ca:	02f687b3          	mul	a5,a3,a5
    800095ce:	97ba                	add	a5,a5,a4
    800095d0:	1487a783          	lw	a5,328(a5)
    800095d4:	e39d                	bnez	a5,800095fa <free_desc+0x190>
      wakeup(&disk[id].free[0]);
    800095d6:	fec42703          	lw	a4,-20(s0)
    800095da:	15000793          	li	a5,336
    800095de:	02f707b3          	mul	a5,a4,a5
    800095e2:	02078713          	addi	a4,a5,32
    800095e6:	0002c797          	auipc	a5,0x2c
    800095ea:	6a278793          	addi	a5,a5,1698 # 80035c88 <disk>
    800095ee:	97ba                	add	a5,a5,a4
    800095f0:	853e                	mv	a0,a5
    800095f2:	ffffa097          	auipc	ra,0xffffa
    800095f6:	1ae080e7          	jalr	430(ra) # 800037a0 <wakeup>
  }
}
    800095fa:	0001                	nop
    800095fc:	60e2                	ld	ra,24(sp)
    800095fe:	6442                	ld	s0,16(sp)
    80009600:	6105                	addi	sp,sp,32
    80009602:	8082                	ret

0000000080009604 <free_chain>:

// free a chain of descriptors.
static void
free_chain(int id, int i)
{
    80009604:	7179                	addi	sp,sp,-48
    80009606:	f406                	sd	ra,40(sp)
    80009608:	f022                	sd	s0,32(sp)
    8000960a:	1800                	addi	s0,sp,48
    8000960c:	87aa                	mv	a5,a0
    8000960e:	872e                	mv	a4,a1
    80009610:	fcf42e23          	sw	a5,-36(s0)
    80009614:	87ba                	mv	a5,a4
    80009616:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    int flag = disk[id].desc[i].flags;
    8000961a:	0002c717          	auipc	a4,0x2c
    8000961e:	66e70713          	addi	a4,a4,1646 # 80035c88 <disk>
    80009622:	fdc42683          	lw	a3,-36(s0)
    80009626:	15000793          	li	a5,336
    8000962a:	02f687b3          	mul	a5,a3,a5
    8000962e:	97ba                	add	a5,a5,a4
    80009630:	6798                	ld	a4,8(a5)
    80009632:	fd842783          	lw	a5,-40(s0)
    80009636:	0792                	slli	a5,a5,0x4
    80009638:	97ba                	add	a5,a5,a4
    8000963a:	00c7d783          	lhu	a5,12(a5)
    8000963e:	fef42623          	sw	a5,-20(s0)
    int nxt = disk[id].desc[i].next;
    80009642:	0002c717          	auipc	a4,0x2c
    80009646:	64670713          	addi	a4,a4,1606 # 80035c88 <disk>
    8000964a:	fdc42683          	lw	a3,-36(s0)
    8000964e:	15000793          	li	a5,336
    80009652:	02f687b3          	mul	a5,a3,a5
    80009656:	97ba                	add	a5,a5,a4
    80009658:	6798                	ld	a4,8(a5)
    8000965a:	fd842783          	lw	a5,-40(s0)
    8000965e:	0792                	slli	a5,a5,0x4
    80009660:	97ba                	add	a5,a5,a4
    80009662:	00e7d783          	lhu	a5,14(a5)
    80009666:	fef42423          	sw	a5,-24(s0)
    free_desc(id, i);
    8000966a:	fd842703          	lw	a4,-40(s0)
    8000966e:	fdc42783          	lw	a5,-36(s0)
    80009672:	85ba                	mv	a1,a4
    80009674:	853e                	mv	a0,a5
    80009676:	00000097          	auipc	ra,0x0
    8000967a:	df4080e7          	jalr	-524(ra) # 8000946a <free_desc>
    if(flag & VRING_DESC_F_NEXT)
    8000967e:	fec42783          	lw	a5,-20(s0)
    80009682:	8b85                	andi	a5,a5,1
    80009684:	2781                	sext.w	a5,a5
    80009686:	c791                	beqz	a5,80009692 <free_chain+0x8e>
      i = nxt;
    80009688:	fe842783          	lw	a5,-24(s0)
    8000968c:	fcf42c23          	sw	a5,-40(s0)
  while(1){
    80009690:	b769                	j	8000961a <free_chain+0x16>
    else
      break;
    80009692:	0001                	nop
  }
}
    80009694:	0001                	nop
    80009696:	70a2                	ld	ra,40(sp)
    80009698:	7402                	ld	s0,32(sp)
    8000969a:	6145                	addi	sp,sp,48
    8000969c:	8082                	ret

000000008000969e <alloc3_desc>:

// allocate three descriptors (they need not be contiguous).
// disk transfers always use three descriptors.
static int
alloc3_desc(int id, int *idx)
{
    8000969e:	7139                	addi	sp,sp,-64
    800096a0:	fc06                	sd	ra,56(sp)
    800096a2:	f822                	sd	s0,48(sp)
    800096a4:	f426                	sd	s1,40(sp)
    800096a6:	0080                	addi	s0,sp,64
    800096a8:	87aa                	mv	a5,a0
    800096aa:	fcb43023          	sd	a1,-64(s0)
    800096ae:	fcf42623          	sw	a5,-52(s0)
  for(int i = 0; i < 3; i++){
    800096b2:	fc042e23          	sw	zero,-36(s0)
    800096b6:	a041                	j	80009736 <alloc3_desc+0x98>
    idx[i] = alloc_desc(id);
    800096b8:	fdc42783          	lw	a5,-36(s0)
    800096bc:	078a                	slli	a5,a5,0x2
    800096be:	fc043703          	ld	a4,-64(s0)
    800096c2:	00f704b3          	add	s1,a4,a5
    800096c6:	fcc42783          	lw	a5,-52(s0)
    800096ca:	853e                	mv	a0,a5
    800096cc:	00000097          	auipc	ra,0x0
    800096d0:	d22080e7          	jalr	-734(ra) # 800093ee <alloc_desc>
    800096d4:	87aa                	mv	a5,a0
    800096d6:	c09c                	sw	a5,0(s1)
    if(idx[i] < 0){
    800096d8:	fdc42783          	lw	a5,-36(s0)
    800096dc:	078a                	slli	a5,a5,0x2
    800096de:	fc043703          	ld	a4,-64(s0)
    800096e2:	97ba                	add	a5,a5,a4
    800096e4:	439c                	lw	a5,0(a5)
    800096e6:	0407d363          	bgez	a5,8000972c <alloc3_desc+0x8e>
      for(int j = 0; j < i; j++)
    800096ea:	fc042c23          	sw	zero,-40(s0)
    800096ee:	a02d                	j	80009718 <alloc3_desc+0x7a>
        free_desc(id, idx[j]);
    800096f0:	fd842783          	lw	a5,-40(s0)
    800096f4:	078a                	slli	a5,a5,0x2
    800096f6:	fc043703          	ld	a4,-64(s0)
    800096fa:	97ba                	add	a5,a5,a4
    800096fc:	4398                	lw	a4,0(a5)
    800096fe:	fcc42783          	lw	a5,-52(s0)
    80009702:	85ba                	mv	a1,a4
    80009704:	853e                	mv	a0,a5
    80009706:	00000097          	auipc	ra,0x0
    8000970a:	d64080e7          	jalr	-668(ra) # 8000946a <free_desc>
      for(int j = 0; j < i; j++)
    8000970e:	fd842783          	lw	a5,-40(s0)
    80009712:	2785                	addiw	a5,a5,1
    80009714:	fcf42c23          	sw	a5,-40(s0)
    80009718:	fd842703          	lw	a4,-40(s0)
    8000971c:	fdc42783          	lw	a5,-36(s0)
    80009720:	2701                	sext.w	a4,a4
    80009722:	2781                	sext.w	a5,a5
    80009724:	fcf746e3          	blt	a4,a5,800096f0 <alloc3_desc+0x52>
      return -1;
    80009728:	57fd                	li	a5,-1
    8000972a:	a831                	j	80009746 <alloc3_desc+0xa8>
  for(int i = 0; i < 3; i++){
    8000972c:	fdc42783          	lw	a5,-36(s0)
    80009730:	2785                	addiw	a5,a5,1
    80009732:	fcf42e23          	sw	a5,-36(s0)
    80009736:	fdc42783          	lw	a5,-36(s0)
    8000973a:	0007871b          	sext.w	a4,a5
    8000973e:	4789                	li	a5,2
    80009740:	f6e7dce3          	bge	a5,a4,800096b8 <alloc3_desc+0x1a>
    }
  }
  return 0;
    80009744:	4781                	li	a5,0
}
    80009746:	853e                	mv	a0,a5
    80009748:	70e2                	ld	ra,56(sp)
    8000974a:	7442                	ld	s0,48(sp)
    8000974c:	74a2                	ld	s1,40(sp)
    8000974e:	6121                	addi	sp,sp,64
    80009750:	8082                	ret

0000000080009752 <virtio_disk_rw>:

void
virtio_disk_rw(int id, struct buf *b, int write, int busy_wait)
{
    80009752:	715d                	addi	sp,sp,-80
    80009754:	e486                	sd	ra,72(sp)
    80009756:	e0a2                	sd	s0,64(sp)
    80009758:	0880                	addi	s0,sp,80
    8000975a:	87aa                	mv	a5,a0
    8000975c:	fcb43023          	sd	a1,-64(s0)
    80009760:	8736                	mv	a4,a3
    80009762:	fcf42623          	sw	a5,-52(s0)
    80009766:	87b2                	mv	a5,a2
    80009768:	fcf42423          	sw	a5,-56(s0)
    8000976c:	87ba                	mv	a5,a4
    8000976e:	faf42e23          	sw	a5,-68(s0)
  uint64 sector = b->blockno * (BSIZE / 512);
    80009772:	fc043783          	ld	a5,-64(s0)
    80009776:	47dc                	lw	a5,12(a5)
    80009778:	0017979b          	slliw	a5,a5,0x1
    8000977c:	2781                	sext.w	a5,a5
    8000977e:	1782                	slli	a5,a5,0x20
    80009780:	9381                	srli	a5,a5,0x20
    80009782:	fef43423          	sd	a5,-24(s0)

  acquire(&disk[id].vdisk_lock);
    80009786:	fcc42703          	lw	a4,-52(s0)
    8000978a:	15000793          	li	a5,336
    8000978e:	02f707b3          	mul	a5,a4,a5
    80009792:	13078713          	addi	a4,a5,304
    80009796:	0002c797          	auipc	a5,0x2c
    8000979a:	4f278793          	addi	a5,a5,1266 # 80035c88 <disk>
    8000979e:	97ba                	add	a5,a5,a4
    800097a0:	853e                	mv	a0,a5
    800097a2:	ffff8097          	auipc	ra,0xffff8
    800097a6:	b88080e7          	jalr	-1144(ra) # 8000132a <acquire>
  disk[id].bw_transfer = busy_wait;
    800097aa:	0002c717          	auipc	a4,0x2c
    800097ae:	4de70713          	addi	a4,a4,1246 # 80035c88 <disk>
    800097b2:	fcc42683          	lw	a3,-52(s0)
    800097b6:	15000793          	li	a5,336
    800097ba:	02f687b3          	mul	a5,a3,a5
    800097be:	97ba                	add	a5,a5,a4
    800097c0:	fbc42703          	lw	a4,-68(s0)
    800097c4:	14e7a423          	sw	a4,328(a5)
  // data, one for a 1-byte status result.

  // allocate the three descriptors.
  int idx[3];
  while(1){
    if(alloc3_desc(id, idx) == 0) {
    800097c8:	fd040713          	addi	a4,s0,-48
    800097cc:	fcc42783          	lw	a5,-52(s0)
    800097d0:	85ba                	mv	a1,a4
    800097d2:	853e                	mv	a0,a5
    800097d4:	00000097          	auipc	ra,0x0
    800097d8:	eca080e7          	jalr	-310(ra) # 8000969e <alloc3_desc>
    800097dc:	87aa                	mv	a5,a0
    800097de:	c3e9                	beqz	a5,800098a0 <virtio_disk_rw+0x14e>
      break;
    }
    if (!busy_wait) {
    800097e0:	fbc42783          	lw	a5,-68(s0)
    800097e4:	2781                	sext.w	a5,a5
    800097e6:	e3b9                	bnez	a5,8000982c <virtio_disk_rw+0xda>
        sleep(&disk[id].free[0], &disk[id].vdisk_lock);
    800097e8:	fcc42703          	lw	a4,-52(s0)
    800097ec:	15000793          	li	a5,336
    800097f0:	02f707b3          	mul	a5,a4,a5
    800097f4:	02078713          	addi	a4,a5,32
    800097f8:	0002c797          	auipc	a5,0x2c
    800097fc:	49078793          	addi	a5,a5,1168 # 80035c88 <disk>
    80009800:	00f706b3          	add	a3,a4,a5
    80009804:	fcc42703          	lw	a4,-52(s0)
    80009808:	15000793          	li	a5,336
    8000980c:	02f707b3          	mul	a5,a4,a5
    80009810:	13078713          	addi	a4,a5,304
    80009814:	0002c797          	auipc	a5,0x2c
    80009818:	47478793          	addi	a5,a5,1140 # 80035c88 <disk>
    8000981c:	97ba                	add	a5,a5,a4
    8000981e:	85be                	mv	a1,a5
    80009820:	8536                	mv	a0,a3
    80009822:	ffffa097          	auipc	ra,0xffffa
    80009826:	f02080e7          	jalr	-254(ra) # 80003724 <sleep>
    8000982a:	bf79                	j	800097c8 <virtio_disk_rw+0x76>
    } else {
        release(&disk[id].vdisk_lock);
    8000982c:	fcc42703          	lw	a4,-52(s0)
    80009830:	15000793          	li	a5,336
    80009834:	02f707b3          	mul	a5,a4,a5
    80009838:	13078713          	addi	a4,a5,304
    8000983c:	0002c797          	auipc	a5,0x2c
    80009840:	44c78793          	addi	a5,a5,1100 # 80035c88 <disk>
    80009844:	97ba                	add	a5,a5,a4
    80009846:	853e                	mv	a0,a5
    80009848:	ffff8097          	auipc	ra,0xffff8
    8000984c:	b46080e7          	jalr	-1210(ra) # 8000138e <release>
        intr_on();
    80009850:	fffff097          	auipc	ra,0xfffff
    80009854:	500080e7          	jalr	1280(ra) # 80008d50 <intr_on>
        while(alloc3_desc(id, idx) != 0);
    80009858:	0001                	nop
    8000985a:	fd040713          	addi	a4,s0,-48
    8000985e:	fcc42783          	lw	a5,-52(s0)
    80009862:	85ba                	mv	a1,a4
    80009864:	853e                	mv	a0,a5
    80009866:	00000097          	auipc	ra,0x0
    8000986a:	e38080e7          	jalr	-456(ra) # 8000969e <alloc3_desc>
    8000986e:	87aa                	mv	a5,a0
    80009870:	f7ed                	bnez	a5,8000985a <virtio_disk_rw+0x108>
        intr_off();
    80009872:	fffff097          	auipc	ra,0xfffff
    80009876:	508080e7          	jalr	1288(ra) # 80008d7a <intr_off>
        acquire(&disk[id].vdisk_lock);
    8000987a:	fcc42703          	lw	a4,-52(s0)
    8000987e:	15000793          	li	a5,336
    80009882:	02f707b3          	mul	a5,a4,a5
    80009886:	13078713          	addi	a4,a5,304
    8000988a:	0002c797          	auipc	a5,0x2c
    8000988e:	3fe78793          	addi	a5,a5,1022 # 80035c88 <disk>
    80009892:	97ba                	add	a5,a5,a4
    80009894:	853e                	mv	a0,a5
    80009896:	ffff8097          	auipc	ra,0xffff8
    8000989a:	a94080e7          	jalr	-1388(ra) # 8000132a <acquire>
    if(alloc3_desc(id, idx) == 0) {
    8000989e:	b72d                	j	800097c8 <virtio_disk_rw+0x76>
      break;
    800098a0:	0001                	nop
  }

  // format the three descriptors.
  // qemu's virtio-blk.c reads them.

  struct virtio_blk_req *buf0 = &disk[id].ops[idx[0]];
    800098a2:	fd042683          	lw	a3,-48(s0)
    800098a6:	fcc42703          	lw	a4,-52(s0)
    800098aa:	87ba                	mv	a5,a4
    800098ac:	078a                	slli	a5,a5,0x2
    800098ae:	97ba                	add	a5,a5,a4
    800098b0:	078a                	slli	a5,a5,0x2
    800098b2:	97ba                	add	a5,a5,a4
    800098b4:	97b6                	add	a5,a5,a3
    800098b6:	07ad                	addi	a5,a5,11
    800098b8:	00479713          	slli	a4,a5,0x4
    800098bc:	0002c797          	auipc	a5,0x2c
    800098c0:	3cc78793          	addi	a5,a5,972 # 80035c88 <disk>
    800098c4:	97ba                	add	a5,a5,a4
    800098c6:	fef43023          	sd	a5,-32(s0)

  if(write)
    800098ca:	fc842783          	lw	a5,-56(s0)
    800098ce:	2781                	sext.w	a5,a5
    800098d0:	c791                	beqz	a5,800098dc <virtio_disk_rw+0x18a>
    buf0->type = VIRTIO_BLK_T_OUT; // write the disk
    800098d2:	fe043783          	ld	a5,-32(s0)
    800098d6:	4705                	li	a4,1
    800098d8:	c398                	sw	a4,0(a5)
    800098da:	a029                	j	800098e4 <virtio_disk_rw+0x192>
  else
    buf0->type = VIRTIO_BLK_T_IN; // read the disk
    800098dc:	fe043783          	ld	a5,-32(s0)
    800098e0:	0007a023          	sw	zero,0(a5)
  buf0->reserved = 0;
    800098e4:	fe043783          	ld	a5,-32(s0)
    800098e8:	0007a223          	sw	zero,4(a5)
  buf0->sector = sector;
    800098ec:	fe043783          	ld	a5,-32(s0)
    800098f0:	fe843703          	ld	a4,-24(s0)
    800098f4:	e798                	sd	a4,8(a5)

  disk[id].desc[idx[0]].addr = (uint64) buf0;
    800098f6:	0002c717          	auipc	a4,0x2c
    800098fa:	39270713          	addi	a4,a4,914 # 80035c88 <disk>
    800098fe:	fcc42683          	lw	a3,-52(s0)
    80009902:	15000793          	li	a5,336
    80009906:	02f687b3          	mul	a5,a3,a5
    8000990a:	97ba                	add	a5,a5,a4
    8000990c:	6798                	ld	a4,8(a5)
    8000990e:	fd042783          	lw	a5,-48(s0)
    80009912:	0792                	slli	a5,a5,0x4
    80009914:	97ba                	add	a5,a5,a4
    80009916:	fe043703          	ld	a4,-32(s0)
    8000991a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[0]].len = sizeof(struct virtio_blk_req);
    8000991c:	0002c717          	auipc	a4,0x2c
    80009920:	36c70713          	addi	a4,a4,876 # 80035c88 <disk>
    80009924:	fcc42683          	lw	a3,-52(s0)
    80009928:	15000793          	li	a5,336
    8000992c:	02f687b3          	mul	a5,a3,a5
    80009930:	97ba                	add	a5,a5,a4
    80009932:	6798                	ld	a4,8(a5)
    80009934:	fd042783          	lw	a5,-48(s0)
    80009938:	0792                	slli	a5,a5,0x4
    8000993a:	97ba                	add	a5,a5,a4
    8000993c:	4741                	li	a4,16
    8000993e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[0]].flags = VRING_DESC_F_NEXT;
    80009940:	0002c717          	auipc	a4,0x2c
    80009944:	34870713          	addi	a4,a4,840 # 80035c88 <disk>
    80009948:	fcc42683          	lw	a3,-52(s0)
    8000994c:	15000793          	li	a5,336
    80009950:	02f687b3          	mul	a5,a3,a5
    80009954:	97ba                	add	a5,a5,a4
    80009956:	6798                	ld	a4,8(a5)
    80009958:	fd042783          	lw	a5,-48(s0)
    8000995c:	0792                	slli	a5,a5,0x4
    8000995e:	97ba                	add	a5,a5,a4
    80009960:	4705                	li	a4,1
    80009962:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[0]].next = idx[1];
    80009966:	fd442603          	lw	a2,-44(s0)
    8000996a:	0002c717          	auipc	a4,0x2c
    8000996e:	31e70713          	addi	a4,a4,798 # 80035c88 <disk>
    80009972:	fcc42683          	lw	a3,-52(s0)
    80009976:	15000793          	li	a5,336
    8000997a:	02f687b3          	mul	a5,a3,a5
    8000997e:	97ba                	add	a5,a5,a4
    80009980:	6798                	ld	a4,8(a5)
    80009982:	fd042783          	lw	a5,-48(s0)
    80009986:	0792                	slli	a5,a5,0x4
    80009988:	97ba                	add	a5,a5,a4
    8000998a:	03061713          	slli	a4,a2,0x30
    8000998e:	9341                	srli	a4,a4,0x30
    80009990:	00e79723          	sh	a4,14(a5)

  disk[id].desc[idx[1]].addr = (uint64) b->data;
    80009994:	fc043783          	ld	a5,-64(s0)
    80009998:	05878613          	addi	a2,a5,88
    8000999c:	0002c717          	auipc	a4,0x2c
    800099a0:	2ec70713          	addi	a4,a4,748 # 80035c88 <disk>
    800099a4:	fcc42683          	lw	a3,-52(s0)
    800099a8:	15000793          	li	a5,336
    800099ac:	02f687b3          	mul	a5,a3,a5
    800099b0:	97ba                	add	a5,a5,a4
    800099b2:	6798                	ld	a4,8(a5)
    800099b4:	fd442783          	lw	a5,-44(s0)
    800099b8:	0792                	slli	a5,a5,0x4
    800099ba:	97ba                	add	a5,a5,a4
    800099bc:	8732                	mv	a4,a2
    800099be:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[1]].len = BSIZE;
    800099c0:	0002c717          	auipc	a4,0x2c
    800099c4:	2c870713          	addi	a4,a4,712 # 80035c88 <disk>
    800099c8:	fcc42683          	lw	a3,-52(s0)
    800099cc:	15000793          	li	a5,336
    800099d0:	02f687b3          	mul	a5,a3,a5
    800099d4:	97ba                	add	a5,a5,a4
    800099d6:	6798                	ld	a4,8(a5)
    800099d8:	fd442783          	lw	a5,-44(s0)
    800099dc:	0792                	slli	a5,a5,0x4
    800099de:	97ba                	add	a5,a5,a4
    800099e0:	40000713          	li	a4,1024
    800099e4:	c798                	sw	a4,8(a5)
  if(write)
    800099e6:	fc842783          	lw	a5,-56(s0)
    800099ea:	2781                	sext.w	a5,a5
    800099ec:	c785                	beqz	a5,80009a14 <virtio_disk_rw+0x2c2>
    disk[id].desc[idx[1]].flags = 0; // device reads b->data
    800099ee:	0002c717          	auipc	a4,0x2c
    800099f2:	29a70713          	addi	a4,a4,666 # 80035c88 <disk>
    800099f6:	fcc42683          	lw	a3,-52(s0)
    800099fa:	15000793          	li	a5,336
    800099fe:	02f687b3          	mul	a5,a3,a5
    80009a02:	97ba                	add	a5,a5,a4
    80009a04:	6798                	ld	a4,8(a5)
    80009a06:	fd442783          	lw	a5,-44(s0)
    80009a0a:	0792                	slli	a5,a5,0x4
    80009a0c:	97ba                	add	a5,a5,a4
    80009a0e:	00079623          	sh	zero,12(a5)
    80009a12:	a025                	j	80009a3a <virtio_disk_rw+0x2e8>
  else
    disk[id].desc[idx[1]].flags = VRING_DESC_F_WRITE; // device writes b->data
    80009a14:	0002c717          	auipc	a4,0x2c
    80009a18:	27470713          	addi	a4,a4,628 # 80035c88 <disk>
    80009a1c:	fcc42683          	lw	a3,-52(s0)
    80009a20:	15000793          	li	a5,336
    80009a24:	02f687b3          	mul	a5,a3,a5
    80009a28:	97ba                	add	a5,a5,a4
    80009a2a:	6798                	ld	a4,8(a5)
    80009a2c:	fd442783          	lw	a5,-44(s0)
    80009a30:	0792                	slli	a5,a5,0x4
    80009a32:	97ba                	add	a5,a5,a4
    80009a34:	4709                	li	a4,2
    80009a36:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].flags |= VRING_DESC_F_NEXT;
    80009a3a:	0002c717          	auipc	a4,0x2c
    80009a3e:	24e70713          	addi	a4,a4,590 # 80035c88 <disk>
    80009a42:	fcc42683          	lw	a3,-52(s0)
    80009a46:	15000793          	li	a5,336
    80009a4a:	02f687b3          	mul	a5,a3,a5
    80009a4e:	97ba                	add	a5,a5,a4
    80009a50:	6798                	ld	a4,8(a5)
    80009a52:	fd442783          	lw	a5,-44(s0)
    80009a56:	0792                	slli	a5,a5,0x4
    80009a58:	97ba                	add	a5,a5,a4
    80009a5a:	00c7d703          	lhu	a4,12(a5)
    80009a5e:	0002c697          	auipc	a3,0x2c
    80009a62:	22a68693          	addi	a3,a3,554 # 80035c88 <disk>
    80009a66:	fcc42603          	lw	a2,-52(s0)
    80009a6a:	15000793          	li	a5,336
    80009a6e:	02f607b3          	mul	a5,a2,a5
    80009a72:	97b6                	add	a5,a5,a3
    80009a74:	6794                	ld	a3,8(a5)
    80009a76:	fd442783          	lw	a5,-44(s0)
    80009a7a:	0792                	slli	a5,a5,0x4
    80009a7c:	97b6                	add	a5,a5,a3
    80009a7e:	00176713          	ori	a4,a4,1
    80009a82:	1742                	slli	a4,a4,0x30
    80009a84:	9341                	srli	a4,a4,0x30
    80009a86:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[1]].next = idx[2];
    80009a8a:	fd842603          	lw	a2,-40(s0)
    80009a8e:	0002c717          	auipc	a4,0x2c
    80009a92:	1fa70713          	addi	a4,a4,506 # 80035c88 <disk>
    80009a96:	fcc42683          	lw	a3,-52(s0)
    80009a9a:	15000793          	li	a5,336
    80009a9e:	02f687b3          	mul	a5,a3,a5
    80009aa2:	97ba                	add	a5,a5,a4
    80009aa4:	6798                	ld	a4,8(a5)
    80009aa6:	fd442783          	lw	a5,-44(s0)
    80009aaa:	0792                	slli	a5,a5,0x4
    80009aac:	97ba                	add	a5,a5,a4
    80009aae:	03061713          	slli	a4,a2,0x30
    80009ab2:	9341                	srli	a4,a4,0x30
    80009ab4:	00e79723          	sh	a4,14(a5)

  disk[id].info[idx[0]].status = 0xff; // device writes 0 on success
    80009ab8:	fd042603          	lw	a2,-48(s0)
    80009abc:	0002c697          	auipc	a3,0x2c
    80009ac0:	1cc68693          	addi	a3,a3,460 # 80035c88 <disk>
    80009ac4:	fcc42703          	lw	a4,-52(s0)
    80009ac8:	87ba                	mv	a5,a4
    80009aca:	078a                	slli	a5,a5,0x2
    80009acc:	97ba                	add	a5,a5,a4
    80009ace:	078a                	slli	a5,a5,0x2
    80009ad0:	97ba                	add	a5,a5,a4
    80009ad2:	97b2                	add	a5,a5,a2
    80009ad4:	078d                	addi	a5,a5,3
    80009ad6:	0792                	slli	a5,a5,0x4
    80009ad8:	97b6                	add	a5,a5,a3
    80009ada:	577d                	li	a4,-1
    80009adc:	00e78423          	sb	a4,8(a5)
  disk[id].desc[idx[2]].addr = (uint64) &disk[id].info[idx[0]].status;
    80009ae0:	fd042683          	lw	a3,-48(s0)
    80009ae4:	fcc42703          	lw	a4,-52(s0)
    80009ae8:	87ba                	mv	a5,a4
    80009aea:	078a                	slli	a5,a5,0x2
    80009aec:	97ba                	add	a5,a5,a4
    80009aee:	078a                	slli	a5,a5,0x2
    80009af0:	97ba                	add	a5,a5,a4
    80009af2:	97b6                	add	a5,a5,a3
    80009af4:	078d                	addi	a5,a5,3
    80009af6:	00479713          	slli	a4,a5,0x4
    80009afa:	0002c797          	auipc	a5,0x2c
    80009afe:	18e78793          	addi	a5,a5,398 # 80035c88 <disk>
    80009b02:	97ba                	add	a5,a5,a4
    80009b04:	00878613          	addi	a2,a5,8
    80009b08:	0002c717          	auipc	a4,0x2c
    80009b0c:	18070713          	addi	a4,a4,384 # 80035c88 <disk>
    80009b10:	fcc42683          	lw	a3,-52(s0)
    80009b14:	15000793          	li	a5,336
    80009b18:	02f687b3          	mul	a5,a3,a5
    80009b1c:	97ba                	add	a5,a5,a4
    80009b1e:	6798                	ld	a4,8(a5)
    80009b20:	fd842783          	lw	a5,-40(s0)
    80009b24:	0792                	slli	a5,a5,0x4
    80009b26:	97ba                	add	a5,a5,a4
    80009b28:	8732                	mv	a4,a2
    80009b2a:	e398                	sd	a4,0(a5)
  disk[id].desc[idx[2]].len = 1;
    80009b2c:	0002c717          	auipc	a4,0x2c
    80009b30:	15c70713          	addi	a4,a4,348 # 80035c88 <disk>
    80009b34:	fcc42683          	lw	a3,-52(s0)
    80009b38:	15000793          	li	a5,336
    80009b3c:	02f687b3          	mul	a5,a3,a5
    80009b40:	97ba                	add	a5,a5,a4
    80009b42:	6798                	ld	a4,8(a5)
    80009b44:	fd842783          	lw	a5,-40(s0)
    80009b48:	0792                	slli	a5,a5,0x4
    80009b4a:	97ba                	add	a5,a5,a4
    80009b4c:	4705                	li	a4,1
    80009b4e:	c798                	sw	a4,8(a5)
  disk[id].desc[idx[2]].flags = VRING_DESC_F_WRITE; // device writes the status
    80009b50:	0002c717          	auipc	a4,0x2c
    80009b54:	13870713          	addi	a4,a4,312 # 80035c88 <disk>
    80009b58:	fcc42683          	lw	a3,-52(s0)
    80009b5c:	15000793          	li	a5,336
    80009b60:	02f687b3          	mul	a5,a3,a5
    80009b64:	97ba                	add	a5,a5,a4
    80009b66:	6798                	ld	a4,8(a5)
    80009b68:	fd842783          	lw	a5,-40(s0)
    80009b6c:	0792                	slli	a5,a5,0x4
    80009b6e:	97ba                	add	a5,a5,a4
    80009b70:	4709                	li	a4,2
    80009b72:	00e79623          	sh	a4,12(a5)
  disk[id].desc[idx[2]].next = 0;
    80009b76:	0002c717          	auipc	a4,0x2c
    80009b7a:	11270713          	addi	a4,a4,274 # 80035c88 <disk>
    80009b7e:	fcc42683          	lw	a3,-52(s0)
    80009b82:	15000793          	li	a5,336
    80009b86:	02f687b3          	mul	a5,a3,a5
    80009b8a:	97ba                	add	a5,a5,a4
    80009b8c:	6798                	ld	a4,8(a5)
    80009b8e:	fd842783          	lw	a5,-40(s0)
    80009b92:	0792                	slli	a5,a5,0x4
    80009b94:	97ba                	add	a5,a5,a4
    80009b96:	00079723          	sh	zero,14(a5)

  // record struct buf for virtio_disk_intr().
  b->disk = 1;
    80009b9a:	fc043783          	ld	a5,-64(s0)
    80009b9e:	4705                	li	a4,1
    80009ba0:	c3d8                	sw	a4,4(a5)
  disk[id].info[idx[0]].b = b;
    80009ba2:	fd042603          	lw	a2,-48(s0)
    80009ba6:	0002c697          	auipc	a3,0x2c
    80009baa:	0e268693          	addi	a3,a3,226 # 80035c88 <disk>
    80009bae:	fcc42703          	lw	a4,-52(s0)
    80009bb2:	87ba                	mv	a5,a4
    80009bb4:	078a                	slli	a5,a5,0x2
    80009bb6:	97ba                	add	a5,a5,a4
    80009bb8:	078a                	slli	a5,a5,0x2
    80009bba:	97ba                	add	a5,a5,a4
    80009bbc:	97b2                	add	a5,a5,a2
    80009bbe:	078d                	addi	a5,a5,3
    80009bc0:	0792                	slli	a5,a5,0x4
    80009bc2:	97b6                	add	a5,a5,a3
    80009bc4:	fc043703          	ld	a4,-64(s0)
    80009bc8:	e398                	sd	a4,0(a5)

  // tell the device the first index in our chain of descriptors.
  disk[id].avail->ring[disk[id].avail->idx % NUM] = idx[0];
    80009bca:	fd042583          	lw	a1,-48(s0)
    80009bce:	0002c717          	auipc	a4,0x2c
    80009bd2:	0ba70713          	addi	a4,a4,186 # 80035c88 <disk>
    80009bd6:	fcc42683          	lw	a3,-52(s0)
    80009bda:	15000793          	li	a5,336
    80009bde:	02f687b3          	mul	a5,a3,a5
    80009be2:	97ba                	add	a5,a5,a4
    80009be4:	6b94                	ld	a3,16(a5)
    80009be6:	0002c717          	auipc	a4,0x2c
    80009bea:	0a270713          	addi	a4,a4,162 # 80035c88 <disk>
    80009bee:	fcc42603          	lw	a2,-52(s0)
    80009bf2:	15000793          	li	a5,336
    80009bf6:	02f607b3          	mul	a5,a2,a5
    80009bfa:	97ba                	add	a5,a5,a4
    80009bfc:	6b9c                	ld	a5,16(a5)
    80009bfe:	0027d783          	lhu	a5,2(a5)
    80009c02:	2781                	sext.w	a5,a5
    80009c04:	8b9d                	andi	a5,a5,7
    80009c06:	2781                	sext.w	a5,a5
    80009c08:	03059713          	slli	a4,a1,0x30
    80009c0c:	9341                	srli	a4,a4,0x30
    80009c0e:	0786                	slli	a5,a5,0x1
    80009c10:	97b6                	add	a5,a5,a3
    80009c12:	00e79223          	sh	a4,4(a5)

  __sync_synchronize();
    80009c16:	0ff0000f          	fence

  // tell the device another avail ring entry is available.
  disk[id].avail->idx += 1; // not % NUM ...
    80009c1a:	0002c717          	auipc	a4,0x2c
    80009c1e:	06e70713          	addi	a4,a4,110 # 80035c88 <disk>
    80009c22:	fcc42683          	lw	a3,-52(s0)
    80009c26:	15000793          	li	a5,336
    80009c2a:	02f687b3          	mul	a5,a3,a5
    80009c2e:	97ba                	add	a5,a5,a4
    80009c30:	6b9c                	ld	a5,16(a5)
    80009c32:	0027d703          	lhu	a4,2(a5)
    80009c36:	0002c697          	auipc	a3,0x2c
    80009c3a:	05268693          	addi	a3,a3,82 # 80035c88 <disk>
    80009c3e:	fcc42603          	lw	a2,-52(s0)
    80009c42:	15000793          	li	a5,336
    80009c46:	02f607b3          	mul	a5,a2,a5
    80009c4a:	97b6                	add	a5,a5,a3
    80009c4c:	6b9c                	ld	a5,16(a5)
    80009c4e:	2705                	addiw	a4,a4,1
    80009c50:	1742                	slli	a4,a4,0x30
    80009c52:	9341                	srli	a4,a4,0x30
    80009c54:	00e79123          	sh	a4,2(a5)

  __sync_synchronize();
    80009c58:	0ff0000f          	fence

  *R(id, VIRTIO_MMIO_QUEUE_NOTIFY) = 0; // value is queue number
    80009c5c:	fcc42703          	lw	a4,-52(s0)
    80009c60:	67c1                	lui	a5,0x10
    80009c62:	0785                	addi	a5,a5,1
    80009c64:	97ba                	add	a5,a5,a4
    80009c66:	07b2                	slli	a5,a5,0xc
    80009c68:	05078793          	addi	a5,a5,80 # 10050 <_entry-0x7ffeffb0>
    80009c6c:	0007a023          	sw	zero,0(a5)

  // Wait for virtio_disk_intr() to say request has finished.
  while(b->disk == 1) {
    80009c70:	a871                	j	80009d0c <virtio_disk_rw+0x5ba>
    if (!busy_wait) {
    80009c72:	fbc42783          	lw	a5,-68(s0)
    80009c76:	2781                	sext.w	a5,a5
    80009c78:	e795                	bnez	a5,80009ca4 <virtio_disk_rw+0x552>
        sleep(b, &disk[id].vdisk_lock);
    80009c7a:	fcc42703          	lw	a4,-52(s0)
    80009c7e:	15000793          	li	a5,336
    80009c82:	02f707b3          	mul	a5,a4,a5
    80009c86:	13078713          	addi	a4,a5,304
    80009c8a:	0002c797          	auipc	a5,0x2c
    80009c8e:	ffe78793          	addi	a5,a5,-2 # 80035c88 <disk>
    80009c92:	97ba                	add	a5,a5,a4
    80009c94:	85be                	mv	a1,a5
    80009c96:	fc043503          	ld	a0,-64(s0)
    80009c9a:	ffffa097          	auipc	ra,0xffffa
    80009c9e:	a8a080e7          	jalr	-1398(ra) # 80003724 <sleep>
    80009ca2:	a0ad                	j	80009d0c <virtio_disk_rw+0x5ba>
    } else {
        release(&disk[id].vdisk_lock);
    80009ca4:	fcc42703          	lw	a4,-52(s0)
    80009ca8:	15000793          	li	a5,336
    80009cac:	02f707b3          	mul	a5,a4,a5
    80009cb0:	13078713          	addi	a4,a5,304
    80009cb4:	0002c797          	auipc	a5,0x2c
    80009cb8:	fd478793          	addi	a5,a5,-44 # 80035c88 <disk>
    80009cbc:	97ba                	add	a5,a5,a4
    80009cbe:	853e                	mv	a0,a5
    80009cc0:	ffff7097          	auipc	ra,0xffff7
    80009cc4:	6ce080e7          	jalr	1742(ra) # 8000138e <release>
        intr_on();
    80009cc8:	fffff097          	auipc	ra,0xfffff
    80009ccc:	088080e7          	jalr	136(ra) # 80008d50 <intr_on>
        while(b->disk == 1);
    80009cd0:	0001                	nop
    80009cd2:	fc043783          	ld	a5,-64(s0)
    80009cd6:	43dc                	lw	a5,4(a5)
    80009cd8:	873e                	mv	a4,a5
    80009cda:	4785                	li	a5,1
    80009cdc:	fef70be3          	beq	a4,a5,80009cd2 <virtio_disk_rw+0x580>
        intr_off();
    80009ce0:	fffff097          	auipc	ra,0xfffff
    80009ce4:	09a080e7          	jalr	154(ra) # 80008d7a <intr_off>
        acquire(&disk[id].vdisk_lock);
    80009ce8:	fcc42703          	lw	a4,-52(s0)
    80009cec:	15000793          	li	a5,336
    80009cf0:	02f707b3          	mul	a5,a4,a5
    80009cf4:	13078713          	addi	a4,a5,304
    80009cf8:	0002c797          	auipc	a5,0x2c
    80009cfc:	f9078793          	addi	a5,a5,-112 # 80035c88 <disk>
    80009d00:	97ba                	add	a5,a5,a4
    80009d02:	853e                	mv	a0,a5
    80009d04:	ffff7097          	auipc	ra,0xffff7
    80009d08:	626080e7          	jalr	1574(ra) # 8000132a <acquire>
  while(b->disk == 1) {
    80009d0c:	fc043783          	ld	a5,-64(s0)
    80009d10:	43dc                	lw	a5,4(a5)
    80009d12:	873e                	mv	a4,a5
    80009d14:	4785                	li	a5,1
    80009d16:	f4f70ee3          	beq	a4,a5,80009c72 <virtio_disk_rw+0x520>
    }
  }

  disk[id].info[idx[0]].b = 0;
    80009d1a:	fd042603          	lw	a2,-48(s0)
    80009d1e:	0002c697          	auipc	a3,0x2c
    80009d22:	f6a68693          	addi	a3,a3,-150 # 80035c88 <disk>
    80009d26:	fcc42703          	lw	a4,-52(s0)
    80009d2a:	87ba                	mv	a5,a4
    80009d2c:	078a                	slli	a5,a5,0x2
    80009d2e:	97ba                	add	a5,a5,a4
    80009d30:	078a                	slli	a5,a5,0x2
    80009d32:	97ba                	add	a5,a5,a4
    80009d34:	97b2                	add	a5,a5,a2
    80009d36:	078d                	addi	a5,a5,3
    80009d38:	0792                	slli	a5,a5,0x4
    80009d3a:	97b6                	add	a5,a5,a3
    80009d3c:	0007b023          	sd	zero,0(a5)
  free_chain(id, idx[0]);
    80009d40:	fd042703          	lw	a4,-48(s0)
    80009d44:	fcc42783          	lw	a5,-52(s0)
    80009d48:	85ba                	mv	a1,a4
    80009d4a:	853e                	mv	a0,a5
    80009d4c:	00000097          	auipc	ra,0x0
    80009d50:	8b8080e7          	jalr	-1864(ra) # 80009604 <free_chain>

  release(&disk[id].vdisk_lock);
    80009d54:	fcc42703          	lw	a4,-52(s0)
    80009d58:	15000793          	li	a5,336
    80009d5c:	02f707b3          	mul	a5,a4,a5
    80009d60:	13078713          	addi	a4,a5,304
    80009d64:	0002c797          	auipc	a5,0x2c
    80009d68:	f2478793          	addi	a5,a5,-220 # 80035c88 <disk>
    80009d6c:	97ba                	add	a5,a5,a4
    80009d6e:	853e                	mv	a0,a5
    80009d70:	ffff7097          	auipc	ra,0xffff7
    80009d74:	61e080e7          	jalr	1566(ra) # 8000138e <release>
}
    80009d78:	0001                	nop
    80009d7a:	60a6                	ld	ra,72(sp)
    80009d7c:	6406                	ld	s0,64(sp)
    80009d7e:	6161                	addi	sp,sp,80
    80009d80:	8082                	ret

0000000080009d82 <write_block>:

void write_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009d82:	7179                	addi	sp,sp,-48
    80009d84:	f406                	sd	ra,40(sp)
    80009d86:	f022                	sd	s0,32(sp)
    80009d88:	1800                	addi	s0,sp,48
    80009d8a:	87aa                	mv	a5,a0
    80009d8c:	fcb43823          	sd	a1,-48(s0)
    80009d90:	8732                	mv	a4,a2
    80009d92:	fcf42e23          	sw	a5,-36(s0)
    80009d96:	87ba                	mv	a5,a4
    80009d98:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009d9c:	0002c797          	auipc	a5,0x2c
    80009da0:	18c78793          	addi	a5,a5,396 # 80035f28 <swap_buffer>
    80009da4:	639c                	ld	a5,0(a5)
    80009da6:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009daa:	fdc42703          	lw	a4,-36(s0)
    80009dae:	fe843783          	ld	a5,-24(s0)
    80009db2:	c7d8                	sw	a4,12(a5)
    memmove(b->data, data, BSIZE);
    80009db4:	fe843783          	ld	a5,-24(s0)
    80009db8:	05878793          	addi	a5,a5,88
    80009dbc:	40000613          	li	a2,1024
    80009dc0:	fd043583          	ld	a1,-48(s0)
    80009dc4:	853e                	mv	a0,a5
    80009dc6:	ffff8097          	auipc	ra,0xffff8
    80009dca:	81c080e7          	jalr	-2020(ra) # 800015e2 <memmove>

    virtio_disk_rw(VIRTIO1_ID, b, 1, busy_wait);
    80009dce:	fd842783          	lw	a5,-40(s0)
    80009dd2:	86be                	mv	a3,a5
    80009dd4:	4605                	li	a2,1
    80009dd6:	fe843583          	ld	a1,-24(s0)
    80009dda:	4505                	li	a0,1
    80009ddc:	00000097          	auipc	ra,0x0
    80009de0:	976080e7          	jalr	-1674(ra) # 80009752 <virtio_disk_rw>
}
    80009de4:	0001                	nop
    80009de6:	70a2                	ld	ra,40(sp)
    80009de8:	7402                	ld	s0,32(sp)
    80009dea:	6145                	addi	sp,sp,48
    80009dec:	8082                	ret

0000000080009dee <read_block>:

void read_block(int blockno, uchar data[BSIZE], int busy_wait) {
    80009dee:	7179                	addi	sp,sp,-48
    80009df0:	f406                	sd	ra,40(sp)
    80009df2:	f022                	sd	s0,32(sp)
    80009df4:	1800                	addi	s0,sp,48
    80009df6:	87aa                	mv	a5,a0
    80009df8:	fcb43823          	sd	a1,-48(s0)
    80009dfc:	8732                	mv	a4,a2
    80009dfe:	fcf42e23          	sw	a5,-36(s0)
    80009e02:	87ba                	mv	a5,a4
    80009e04:	fcf42c23          	sw	a5,-40(s0)
    struct buf *b = swap_buffer;
    80009e08:	0002c797          	auipc	a5,0x2c
    80009e0c:	12078793          	addi	a5,a5,288 # 80035f28 <swap_buffer>
    80009e10:	639c                	ld	a5,0(a5)
    80009e12:	fef43423          	sd	a5,-24(s0)
    b->blockno = blockno;
    80009e16:	fdc42703          	lw	a4,-36(s0)
    80009e1a:	fe843783          	ld	a5,-24(s0)
    80009e1e:	c7d8                	sw	a4,12(a5)

    virtio_disk_rw(VIRTIO1_ID, b, 0, busy_wait);
    80009e20:	fd842783          	lw	a5,-40(s0)
    80009e24:	86be                	mv	a3,a5
    80009e26:	4601                	li	a2,0
    80009e28:	fe843583          	ld	a1,-24(s0)
    80009e2c:	4505                	li	a0,1
    80009e2e:	00000097          	auipc	ra,0x0
    80009e32:	924080e7          	jalr	-1756(ra) # 80009752 <virtio_disk_rw>
    memmove(data, b->data, BSIZE);
    80009e36:	fe843783          	ld	a5,-24(s0)
    80009e3a:	05878793          	addi	a5,a5,88
    80009e3e:	40000613          	li	a2,1024
    80009e42:	85be                	mv	a1,a5
    80009e44:	fd043503          	ld	a0,-48(s0)
    80009e48:	ffff7097          	auipc	ra,0xffff7
    80009e4c:	79a080e7          	jalr	1946(ra) # 800015e2 <memmove>
}
    80009e50:	0001                	nop
    80009e52:	70a2                	ld	ra,40(sp)
    80009e54:	7402                	ld	s0,32(sp)
    80009e56:	6145                	addi	sp,sp,48
    80009e58:	8082                	ret

0000000080009e5a <virtio_disk_intr>:

void
virtio_disk_intr(int id)
{
    80009e5a:	7179                	addi	sp,sp,-48
    80009e5c:	f406                	sd	ra,40(sp)
    80009e5e:	f022                	sd	s0,32(sp)
    80009e60:	1800                	addi	s0,sp,48
    80009e62:	87aa                	mv	a5,a0
    80009e64:	fcf42e23          	sw	a5,-36(s0)
  acquire(&disk[id].vdisk_lock);
    80009e68:	fdc42703          	lw	a4,-36(s0)
    80009e6c:	15000793          	li	a5,336
    80009e70:	02f707b3          	mul	a5,a4,a5
    80009e74:	13078713          	addi	a4,a5,304
    80009e78:	0002c797          	auipc	a5,0x2c
    80009e7c:	e1078793          	addi	a5,a5,-496 # 80035c88 <disk>
    80009e80:	97ba                	add	a5,a5,a4
    80009e82:	853e                	mv	a0,a5
    80009e84:	ffff7097          	auipc	ra,0xffff7
    80009e88:	4a6080e7          	jalr	1190(ra) # 8000132a <acquire>
  // we've seen this interrupt, which the following line does.
  // this may race with the device writing new entries to
  // the "used" ring, in which case we may process the new
  // completion entries in this interrupt, and have nothing to do
  // in the next interrupt, which is harmless.
  *R(id, VIRTIO_MMIO_INTERRUPT_ACK) = *R(id, VIRTIO_MMIO_INTERRUPT_STATUS) & 0x3;
    80009e8c:	fdc42703          	lw	a4,-36(s0)
    80009e90:	67c1                	lui	a5,0x10
    80009e92:	0785                	addi	a5,a5,1
    80009e94:	97ba                	add	a5,a5,a4
    80009e96:	07b2                	slli	a5,a5,0xc
    80009e98:	06078793          	addi	a5,a5,96 # 10060 <_entry-0x7ffeffa0>
    80009e9c:	439c                	lw	a5,0(a5)
    80009e9e:	0007869b          	sext.w	a3,a5
    80009ea2:	fdc42703          	lw	a4,-36(s0)
    80009ea6:	67c1                	lui	a5,0x10
    80009ea8:	0785                	addi	a5,a5,1
    80009eaa:	97ba                	add	a5,a5,a4
    80009eac:	07b2                	slli	a5,a5,0xc
    80009eae:	06478793          	addi	a5,a5,100 # 10064 <_entry-0x7ffeff9c>
    80009eb2:	873e                	mv	a4,a5
    80009eb4:	87b6                	mv	a5,a3
    80009eb6:	8b8d                	andi	a5,a5,3
    80009eb8:	2781                	sext.w	a5,a5
    80009eba:	c31c                	sw	a5,0(a4)

  __sync_synchronize();
    80009ebc:	0ff0000f          	fence

  // the device increments disk.used->idx when it
  // adds an entry to the used ring.

  while(disk[id].used_idx != disk[id].used->idx){
    80009ec0:	aa05                	j	80009ff0 <virtio_disk_intr+0x196>
    __sync_synchronize();
    80009ec2:	0ff0000f          	fence
    int idx = disk[id].used->ring[disk[id].used_idx % NUM].id;
    80009ec6:	0002c717          	auipc	a4,0x2c
    80009eca:	dc270713          	addi	a4,a4,-574 # 80035c88 <disk>
    80009ece:	fdc42683          	lw	a3,-36(s0)
    80009ed2:	15000793          	li	a5,336
    80009ed6:	02f687b3          	mul	a5,a3,a5
    80009eda:	97ba                	add	a5,a5,a4
    80009edc:	6f98                	ld	a4,24(a5)
    80009ede:	0002c697          	auipc	a3,0x2c
    80009ee2:	daa68693          	addi	a3,a3,-598 # 80035c88 <disk>
    80009ee6:	fdc42603          	lw	a2,-36(s0)
    80009eea:	15000793          	li	a5,336
    80009eee:	02f607b3          	mul	a5,a2,a5
    80009ef2:	97b6                	add	a5,a5,a3
    80009ef4:	0287d783          	lhu	a5,40(a5)
    80009ef8:	2781                	sext.w	a5,a5
    80009efa:	8b9d                	andi	a5,a5,7
    80009efc:	2781                	sext.w	a5,a5
    80009efe:	078e                	slli	a5,a5,0x3
    80009f00:	97ba                	add	a5,a5,a4
    80009f02:	43dc                	lw	a5,4(a5)
    80009f04:	fef42623          	sw	a5,-20(s0)

    if(disk[id].info[idx].status != 0)
    80009f08:	0002c697          	auipc	a3,0x2c
    80009f0c:	d8068693          	addi	a3,a3,-640 # 80035c88 <disk>
    80009f10:	fec42603          	lw	a2,-20(s0)
    80009f14:	fdc42703          	lw	a4,-36(s0)
    80009f18:	87ba                	mv	a5,a4
    80009f1a:	078a                	slli	a5,a5,0x2
    80009f1c:	97ba                	add	a5,a5,a4
    80009f1e:	078a                	slli	a5,a5,0x2
    80009f20:	97ba                	add	a5,a5,a4
    80009f22:	97b2                	add	a5,a5,a2
    80009f24:	078d                	addi	a5,a5,3
    80009f26:	0792                	slli	a5,a5,0x4
    80009f28:	97b6                	add	a5,a5,a3
    80009f2a:	0087c783          	lbu	a5,8(a5)
    80009f2e:	c79d                	beqz	a5,80009f5c <virtio_disk_intr+0x102>
      panic_concat(2, disk[id].name, ": virtio_disk_intr status");
    80009f30:	0002c717          	auipc	a4,0x2c
    80009f34:	d5870713          	addi	a4,a4,-680 # 80035c88 <disk>
    80009f38:	fdc42683          	lw	a3,-36(s0)
    80009f3c:	15000793          	li	a5,336
    80009f40:	02f687b3          	mul	a5,a3,a5
    80009f44:	97ba                	add	a5,a5,a4
    80009f46:	639c                	ld	a5,0(a5)
    80009f48:	00003617          	auipc	a2,0x3
    80009f4c:	85060613          	addi	a2,a2,-1968 # 8000c798 <etext+0x798>
    80009f50:	85be                	mv	a1,a5
    80009f52:	4509                	li	a0,2
    80009f54:	ffff7097          	auipc	ra,0xffff7
    80009f58:	d8a080e7          	jalr	-630(ra) # 80000cde <panic_concat>

    struct buf *b = disk[id].info[idx].b;
    80009f5c:	0002c697          	auipc	a3,0x2c
    80009f60:	d2c68693          	addi	a3,a3,-724 # 80035c88 <disk>
    80009f64:	fec42603          	lw	a2,-20(s0)
    80009f68:	fdc42703          	lw	a4,-36(s0)
    80009f6c:	87ba                	mv	a5,a4
    80009f6e:	078a                	slli	a5,a5,0x2
    80009f70:	97ba                	add	a5,a5,a4
    80009f72:	078a                	slli	a5,a5,0x2
    80009f74:	97ba                	add	a5,a5,a4
    80009f76:	97b2                	add	a5,a5,a2
    80009f78:	078d                	addi	a5,a5,3
    80009f7a:	0792                	slli	a5,a5,0x4
    80009f7c:	97b6                	add	a5,a5,a3
    80009f7e:	639c                	ld	a5,0(a5)
    80009f80:	fef43023          	sd	a5,-32(s0)
    b->disk = 0;   // disk is done with buf
    80009f84:	fe043783          	ld	a5,-32(s0)
    80009f88:	0007a223          	sw	zero,4(a5)
    if (!disk[id].bw_transfer) {
    80009f8c:	0002c717          	auipc	a4,0x2c
    80009f90:	cfc70713          	addi	a4,a4,-772 # 80035c88 <disk>
    80009f94:	fdc42683          	lw	a3,-36(s0)
    80009f98:	15000793          	li	a5,336
    80009f9c:	02f687b3          	mul	a5,a3,a5
    80009fa0:	97ba                	add	a5,a5,a4
    80009fa2:	1487a783          	lw	a5,328(a5)
    80009fa6:	e799                	bnez	a5,80009fb4 <virtio_disk_intr+0x15a>
        wakeup(b);
    80009fa8:	fe043503          	ld	a0,-32(s0)
    80009fac:	ffff9097          	auipc	ra,0xffff9
    80009fb0:	7f4080e7          	jalr	2036(ra) # 800037a0 <wakeup>
    }

    disk[id].used_idx += 1;
    80009fb4:	0002c717          	auipc	a4,0x2c
    80009fb8:	cd470713          	addi	a4,a4,-812 # 80035c88 <disk>
    80009fbc:	fdc42683          	lw	a3,-36(s0)
    80009fc0:	15000793          	li	a5,336
    80009fc4:	02f687b3          	mul	a5,a3,a5
    80009fc8:	97ba                	add	a5,a5,a4
    80009fca:	0287d783          	lhu	a5,40(a5)
    80009fce:	2785                	addiw	a5,a5,1
    80009fd0:	03079713          	slli	a4,a5,0x30
    80009fd4:	9341                	srli	a4,a4,0x30
    80009fd6:	0002c697          	auipc	a3,0x2c
    80009fda:	cb268693          	addi	a3,a3,-846 # 80035c88 <disk>
    80009fde:	fdc42603          	lw	a2,-36(s0)
    80009fe2:	15000793          	li	a5,336
    80009fe6:	02f607b3          	mul	a5,a2,a5
    80009fea:	97b6                	add	a5,a5,a3
    80009fec:	02e79423          	sh	a4,40(a5)
  while(disk[id].used_idx != disk[id].used->idx){
    80009ff0:	0002c717          	auipc	a4,0x2c
    80009ff4:	c9870713          	addi	a4,a4,-872 # 80035c88 <disk>
    80009ff8:	fdc42683          	lw	a3,-36(s0)
    80009ffc:	15000793          	li	a5,336
    8000a000:	02f687b3          	mul	a5,a3,a5
    8000a004:	97ba                	add	a5,a5,a4
    8000a006:	0287d603          	lhu	a2,40(a5)
    8000a00a:	0002c717          	auipc	a4,0x2c
    8000a00e:	c7e70713          	addi	a4,a4,-898 # 80035c88 <disk>
    8000a012:	fdc42683          	lw	a3,-36(s0)
    8000a016:	15000793          	li	a5,336
    8000a01a:	02f687b3          	mul	a5,a3,a5
    8000a01e:	97ba                	add	a5,a5,a4
    8000a020:	6f9c                	ld	a5,24(a5)
    8000a022:	0027d783          	lhu	a5,2(a5)
    8000a026:	0006071b          	sext.w	a4,a2
    8000a02a:	2781                	sext.w	a5,a5
    8000a02c:	e8f71be3          	bne	a4,a5,80009ec2 <virtio_disk_intr+0x68>
  }

  release(&disk[id].vdisk_lock);
    8000a030:	fdc42703          	lw	a4,-36(s0)
    8000a034:	15000793          	li	a5,336
    8000a038:	02f707b3          	mul	a5,a4,a5
    8000a03c:	13078713          	addi	a4,a5,304
    8000a040:	0002c797          	auipc	a5,0x2c
    8000a044:	c4878793          	addi	a5,a5,-952 # 80035c88 <disk>
    8000a048:	97ba                	add	a5,a5,a4
    8000a04a:	853e                	mv	a0,a5
    8000a04c:	ffff7097          	auipc	ra,0xffff7
    8000a050:	342080e7          	jalr	834(ra) # 8000138e <release>
}
    8000a054:	0001                	nop
    8000a056:	70a2                	ld	ra,40(sp)
    8000a058:	7402                	ld	s0,32(sp)
    8000a05a:	6145                	addi	sp,sp,48
    8000a05c:	8082                	ret
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
