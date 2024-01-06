
user/_usertests:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <r_sp>:
  return (x & SSTATUS_SIE) != 0;
}

static inline uint64
r_sp()
{
       0:	1101                	addi	sp,sp,-32
       2:	ec22                	sd	s0,24(sp)
       4:	1000                	addi	s0,sp,32
  uint64 x;
  asm volatile("mv %0, sp" : "=r" (x) );
       6:	878a                	mv	a5,sp
       8:	fef43423          	sd	a5,-24(s0)
  return x;
       c:	fe843783          	ld	a5,-24(s0)
}
      10:	853e                	mv	a0,a5
      12:	6462                	ld	s0,24(sp)
      14:	6105                	addi	sp,sp,32
      16:	8082                	ret

0000000000000018 <copyin>:

// what if you pass ridiculous pointers to system calls
// that read user memory with copyin?
void
copyin(char *s)
{
      18:	715d                	addi	sp,sp,-80
      1a:	e486                	sd	ra,72(sp)
      1c:	e0a2                	sd	s0,64(sp)
      1e:	0880                	addi	s0,sp,80
      20:	faa43c23          	sd	a0,-72(s0)
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
      24:	4785                	li	a5,1
      26:	07fe                	slli	a5,a5,0x1f
      28:	fcf43423          	sd	a5,-56(s0)
      2c:	57fd                	li	a5,-1
      2e:	fcf43823          	sd	a5,-48(s0)

  for(int ai = 0; ai < 2; ai++){
      32:	fe042623          	sw	zero,-20(s0)
      36:	a245                	j	1d6 <copyin+0x1be>
    uint64 addr = addrs[ai];
      38:	fec42783          	lw	a5,-20(s0)
      3c:	078e                	slli	a5,a5,0x3
      3e:	ff040713          	addi	a4,s0,-16
      42:	97ba                	add	a5,a5,a4
      44:	fd87b783          	ld	a5,-40(a5)
      48:	fef43023          	sd	a5,-32(s0)

    int fd = open("copyin1", O_CREATE|O_WRONLY);
      4c:	20100593          	li	a1,513
      50:	00008517          	auipc	a0,0x8
      54:	0c050513          	addi	a0,a0,192 # 8110 <malloc+0x168>
      58:	00008097          	auipc	ra,0x8
      5c:	870080e7          	jalr	-1936(ra) # 78c8 <open>
      60:	87aa                	mv	a5,a0
      62:	fcf42e23          	sw	a5,-36(s0)
    if(fd < 0){
      66:	fdc42783          	lw	a5,-36(s0)
      6a:	2781                	sext.w	a5,a5
      6c:	0007df63          	bgez	a5,8a <copyin+0x72>
      printf("open(copyin1) failed\n");
      70:	00008517          	auipc	a0,0x8
      74:	0a850513          	addi	a0,a0,168 # 8118 <malloc+0x170>
      78:	00008097          	auipc	ra,0x8
      7c:	d3e080e7          	jalr	-706(ra) # 7db6 <printf>
      exit(1);
      80:	4505                	li	a0,1
      82:	00008097          	auipc	ra,0x8
      86:	806080e7          	jalr	-2042(ra) # 7888 <exit>
    }
    int n = write(fd, (void*)addr, 8192);
      8a:	fe043703          	ld	a4,-32(s0)
      8e:	fdc42783          	lw	a5,-36(s0)
      92:	6609                	lui	a2,0x2
      94:	85ba                	mv	a1,a4
      96:	853e                	mv	a0,a5
      98:	00008097          	auipc	ra,0x8
      9c:	810080e7          	jalr	-2032(ra) # 78a8 <write>
      a0:	87aa                	mv	a5,a0
      a2:	fcf42c23          	sw	a5,-40(s0)
    if(n >= 0){
      a6:	fd842783          	lw	a5,-40(s0)
      aa:	2781                	sext.w	a5,a5
      ac:	0207c463          	bltz	a5,d4 <copyin+0xbc>
      printf("write(fd, %p, 8192) returned %d, not -1\n", addr, n);
      b0:	fd842783          	lw	a5,-40(s0)
      b4:	863e                	mv	a2,a5
      b6:	fe043583          	ld	a1,-32(s0)
      ba:	00008517          	auipc	a0,0x8
      be:	07650513          	addi	a0,a0,118 # 8130 <malloc+0x188>
      c2:	00008097          	auipc	ra,0x8
      c6:	cf4080e7          	jalr	-780(ra) # 7db6 <printf>
      exit(1);
      ca:	4505                	li	a0,1
      cc:	00007097          	auipc	ra,0x7
      d0:	7bc080e7          	jalr	1980(ra) # 7888 <exit>
    }
    close(fd);
      d4:	fdc42783          	lw	a5,-36(s0)
      d8:	853e                	mv	a0,a5
      da:	00007097          	auipc	ra,0x7
      de:	7d6080e7          	jalr	2006(ra) # 78b0 <close>
    unlink("copyin1");
      e2:	00008517          	auipc	a0,0x8
      e6:	02e50513          	addi	a0,a0,46 # 8110 <malloc+0x168>
      ea:	00007097          	auipc	ra,0x7
      ee:	7ee080e7          	jalr	2030(ra) # 78d8 <unlink>

    n = write(1, (char*)addr, 8192);
      f2:	fe043783          	ld	a5,-32(s0)
      f6:	6609                	lui	a2,0x2
      f8:	85be                	mv	a1,a5
      fa:	4505                	li	a0,1
      fc:	00007097          	auipc	ra,0x7
     100:	7ac080e7          	jalr	1964(ra) # 78a8 <write>
     104:	87aa                	mv	a5,a0
     106:	fcf42c23          	sw	a5,-40(s0)
    if(n > 0){
     10a:	fd842783          	lw	a5,-40(s0)
     10e:	2781                	sext.w	a5,a5
     110:	02f05463          	blez	a5,138 <copyin+0x120>
      printf("write(1, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     114:	fd842783          	lw	a5,-40(s0)
     118:	863e                	mv	a2,a5
     11a:	fe043583          	ld	a1,-32(s0)
     11e:	00008517          	auipc	a0,0x8
     122:	04250513          	addi	a0,a0,66 # 8160 <malloc+0x1b8>
     126:	00008097          	auipc	ra,0x8
     12a:	c90080e7          	jalr	-880(ra) # 7db6 <printf>
      exit(1);
     12e:	4505                	li	a0,1
     130:	00007097          	auipc	ra,0x7
     134:	758080e7          	jalr	1880(ra) # 7888 <exit>
    }

    int fds[2];
    if(pipe(fds) < 0){
     138:	fc040793          	addi	a5,s0,-64
     13c:	853e                	mv	a0,a5
     13e:	00007097          	auipc	ra,0x7
     142:	75a080e7          	jalr	1882(ra) # 7898 <pipe>
     146:	87aa                	mv	a5,a0
     148:	0007df63          	bgez	a5,166 <copyin+0x14e>
      printf("pipe() failed\n");
     14c:	00008517          	auipc	a0,0x8
     150:	04450513          	addi	a0,a0,68 # 8190 <malloc+0x1e8>
     154:	00008097          	auipc	ra,0x8
     158:	c62080e7          	jalr	-926(ra) # 7db6 <printf>
      exit(1);
     15c:	4505                	li	a0,1
     15e:	00007097          	auipc	ra,0x7
     162:	72a080e7          	jalr	1834(ra) # 7888 <exit>
    }
    n = write(fds[1], (char*)addr, 8192);
     166:	fc442783          	lw	a5,-60(s0)
     16a:	fe043703          	ld	a4,-32(s0)
     16e:	6609                	lui	a2,0x2
     170:	85ba                	mv	a1,a4
     172:	853e                	mv	a0,a5
     174:	00007097          	auipc	ra,0x7
     178:	734080e7          	jalr	1844(ra) # 78a8 <write>
     17c:	87aa                	mv	a5,a0
     17e:	fcf42c23          	sw	a5,-40(s0)
    if(n > 0){
     182:	fd842783          	lw	a5,-40(s0)
     186:	2781                	sext.w	a5,a5
     188:	02f05463          	blez	a5,1b0 <copyin+0x198>
      printf("write(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     18c:	fd842783          	lw	a5,-40(s0)
     190:	863e                	mv	a2,a5
     192:	fe043583          	ld	a1,-32(s0)
     196:	00008517          	auipc	a0,0x8
     19a:	00a50513          	addi	a0,a0,10 # 81a0 <malloc+0x1f8>
     19e:	00008097          	auipc	ra,0x8
     1a2:	c18080e7          	jalr	-1000(ra) # 7db6 <printf>
      exit(1);
     1a6:	4505                	li	a0,1
     1a8:	00007097          	auipc	ra,0x7
     1ac:	6e0080e7          	jalr	1760(ra) # 7888 <exit>
    }
    close(fds[0]);
     1b0:	fc042783          	lw	a5,-64(s0)
     1b4:	853e                	mv	a0,a5
     1b6:	00007097          	auipc	ra,0x7
     1ba:	6fa080e7          	jalr	1786(ra) # 78b0 <close>
    close(fds[1]);
     1be:	fc442783          	lw	a5,-60(s0)
     1c2:	853e                	mv	a0,a5
     1c4:	00007097          	auipc	ra,0x7
     1c8:	6ec080e7          	jalr	1772(ra) # 78b0 <close>
  for(int ai = 0; ai < 2; ai++){
     1cc:	fec42783          	lw	a5,-20(s0)
     1d0:	2785                	addiw	a5,a5,1
     1d2:	fef42623          	sw	a5,-20(s0)
     1d6:	fec42783          	lw	a5,-20(s0)
     1da:	0007871b          	sext.w	a4,a5
     1de:	4785                	li	a5,1
     1e0:	e4e7dce3          	bge	a5,a4,38 <copyin+0x20>
  }
}
     1e4:	0001                	nop
     1e6:	0001                	nop
     1e8:	60a6                	ld	ra,72(sp)
     1ea:	6406                	ld	s0,64(sp)
     1ec:	6161                	addi	sp,sp,80
     1ee:	8082                	ret

00000000000001f0 <copyout>:

// what if you pass ridiculous pointers to system calls
// that write user memory with copyout?
void
copyout(char *s)
{
     1f0:	715d                	addi	sp,sp,-80
     1f2:	e486                	sd	ra,72(sp)
     1f4:	e0a2                	sd	s0,64(sp)
     1f6:	0880                	addi	s0,sp,80
     1f8:	faa43c23          	sd	a0,-72(s0)
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     1fc:	4785                	li	a5,1
     1fe:	07fe                	slli	a5,a5,0x1f
     200:	fcf43423          	sd	a5,-56(s0)
     204:	57fd                	li	a5,-1
     206:	fcf43823          	sd	a5,-48(s0)

  for(int ai = 0; ai < 2; ai++){
     20a:	fe042623          	sw	zero,-20(s0)
     20e:	a279                	j	39c <copyout+0x1ac>
    uint64 addr = addrs[ai];
     210:	fec42783          	lw	a5,-20(s0)
     214:	078e                	slli	a5,a5,0x3
     216:	ff040713          	addi	a4,s0,-16
     21a:	97ba                	add	a5,a5,a4
     21c:	fd87b783          	ld	a5,-40(a5)
     220:	fef43023          	sd	a5,-32(s0)

    int fd = open("README", 0);
     224:	4581                	li	a1,0
     226:	00008517          	auipc	a0,0x8
     22a:	faa50513          	addi	a0,a0,-86 # 81d0 <malloc+0x228>
     22e:	00007097          	auipc	ra,0x7
     232:	69a080e7          	jalr	1690(ra) # 78c8 <open>
     236:	87aa                	mv	a5,a0
     238:	fcf42e23          	sw	a5,-36(s0)
    if(fd < 0){
     23c:	fdc42783          	lw	a5,-36(s0)
     240:	2781                	sext.w	a5,a5
     242:	0007df63          	bgez	a5,260 <copyout+0x70>
      printf("open(README) failed\n");
     246:	00008517          	auipc	a0,0x8
     24a:	f9250513          	addi	a0,a0,-110 # 81d8 <malloc+0x230>
     24e:	00008097          	auipc	ra,0x8
     252:	b68080e7          	jalr	-1176(ra) # 7db6 <printf>
      exit(1);
     256:	4505                	li	a0,1
     258:	00007097          	auipc	ra,0x7
     25c:	630080e7          	jalr	1584(ra) # 7888 <exit>
    }
    int n = read(fd, (void*)addr, 8192);
     260:	fe043703          	ld	a4,-32(s0)
     264:	fdc42783          	lw	a5,-36(s0)
     268:	6609                	lui	a2,0x2
     26a:	85ba                	mv	a1,a4
     26c:	853e                	mv	a0,a5
     26e:	00007097          	auipc	ra,0x7
     272:	632080e7          	jalr	1586(ra) # 78a0 <read>
     276:	87aa                	mv	a5,a0
     278:	fcf42c23          	sw	a5,-40(s0)
    if(n > 0){
     27c:	fd842783          	lw	a5,-40(s0)
     280:	2781                	sext.w	a5,a5
     282:	02f05463          	blez	a5,2aa <copyout+0xba>
      printf("read(fd, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     286:	fd842783          	lw	a5,-40(s0)
     28a:	863e                	mv	a2,a5
     28c:	fe043583          	ld	a1,-32(s0)
     290:	00008517          	auipc	a0,0x8
     294:	f6050513          	addi	a0,a0,-160 # 81f0 <malloc+0x248>
     298:	00008097          	auipc	ra,0x8
     29c:	b1e080e7          	jalr	-1250(ra) # 7db6 <printf>
      exit(1);
     2a0:	4505                	li	a0,1
     2a2:	00007097          	auipc	ra,0x7
     2a6:	5e6080e7          	jalr	1510(ra) # 7888 <exit>
    }
    close(fd);
     2aa:	fdc42783          	lw	a5,-36(s0)
     2ae:	853e                	mv	a0,a5
     2b0:	00007097          	auipc	ra,0x7
     2b4:	600080e7          	jalr	1536(ra) # 78b0 <close>

    int fds[2];
    if(pipe(fds) < 0){
     2b8:	fc040793          	addi	a5,s0,-64
     2bc:	853e                	mv	a0,a5
     2be:	00007097          	auipc	ra,0x7
     2c2:	5da080e7          	jalr	1498(ra) # 7898 <pipe>
     2c6:	87aa                	mv	a5,a0
     2c8:	0007df63          	bgez	a5,2e6 <copyout+0xf6>
      printf("pipe() failed\n");
     2cc:	00008517          	auipc	a0,0x8
     2d0:	ec450513          	addi	a0,a0,-316 # 8190 <malloc+0x1e8>
     2d4:	00008097          	auipc	ra,0x8
     2d8:	ae2080e7          	jalr	-1310(ra) # 7db6 <printf>
      exit(1);
     2dc:	4505                	li	a0,1
     2de:	00007097          	auipc	ra,0x7
     2e2:	5aa080e7          	jalr	1450(ra) # 7888 <exit>
    }
    n = write(fds[1], "x", 1);
     2e6:	fc442783          	lw	a5,-60(s0)
     2ea:	4605                	li	a2,1
     2ec:	00008597          	auipc	a1,0x8
     2f0:	f3458593          	addi	a1,a1,-204 # 8220 <malloc+0x278>
     2f4:	853e                	mv	a0,a5
     2f6:	00007097          	auipc	ra,0x7
     2fa:	5b2080e7          	jalr	1458(ra) # 78a8 <write>
     2fe:	87aa                	mv	a5,a0
     300:	fcf42c23          	sw	a5,-40(s0)
    if(n != 1){
     304:	fd842783          	lw	a5,-40(s0)
     308:	0007871b          	sext.w	a4,a5
     30c:	4785                	li	a5,1
     30e:	00f70f63          	beq	a4,a5,32c <copyout+0x13c>
      printf("pipe write failed\n");
     312:	00008517          	auipc	a0,0x8
     316:	f1650513          	addi	a0,a0,-234 # 8228 <malloc+0x280>
     31a:	00008097          	auipc	ra,0x8
     31e:	a9c080e7          	jalr	-1380(ra) # 7db6 <printf>
      exit(1);
     322:	4505                	li	a0,1
     324:	00007097          	auipc	ra,0x7
     328:	564080e7          	jalr	1380(ra) # 7888 <exit>
    }
    n = read(fds[0], (void*)addr, 8192);
     32c:	fc042783          	lw	a5,-64(s0)
     330:	fe043703          	ld	a4,-32(s0)
     334:	6609                	lui	a2,0x2
     336:	85ba                	mv	a1,a4
     338:	853e                	mv	a0,a5
     33a:	00007097          	auipc	ra,0x7
     33e:	566080e7          	jalr	1382(ra) # 78a0 <read>
     342:	87aa                	mv	a5,a0
     344:	fcf42c23          	sw	a5,-40(s0)
    if(n > 0){
     348:	fd842783          	lw	a5,-40(s0)
     34c:	2781                	sext.w	a5,a5
     34e:	02f05463          	blez	a5,376 <copyout+0x186>
      printf("read(pipe, %p, 8192) returned %d, not -1 or 0\n", addr, n);
     352:	fd842783          	lw	a5,-40(s0)
     356:	863e                	mv	a2,a5
     358:	fe043583          	ld	a1,-32(s0)
     35c:	00008517          	auipc	a0,0x8
     360:	ee450513          	addi	a0,a0,-284 # 8240 <malloc+0x298>
     364:	00008097          	auipc	ra,0x8
     368:	a52080e7          	jalr	-1454(ra) # 7db6 <printf>
      exit(1);
     36c:	4505                	li	a0,1
     36e:	00007097          	auipc	ra,0x7
     372:	51a080e7          	jalr	1306(ra) # 7888 <exit>
    }
    close(fds[0]);
     376:	fc042783          	lw	a5,-64(s0)
     37a:	853e                	mv	a0,a5
     37c:	00007097          	auipc	ra,0x7
     380:	534080e7          	jalr	1332(ra) # 78b0 <close>
    close(fds[1]);
     384:	fc442783          	lw	a5,-60(s0)
     388:	853e                	mv	a0,a5
     38a:	00007097          	auipc	ra,0x7
     38e:	526080e7          	jalr	1318(ra) # 78b0 <close>
  for(int ai = 0; ai < 2; ai++){
     392:	fec42783          	lw	a5,-20(s0)
     396:	2785                	addiw	a5,a5,1
     398:	fef42623          	sw	a5,-20(s0)
     39c:	fec42783          	lw	a5,-20(s0)
     3a0:	0007871b          	sext.w	a4,a5
     3a4:	4785                	li	a5,1
     3a6:	e6e7d5e3          	bge	a5,a4,210 <copyout+0x20>
  }
}
     3aa:	0001                	nop
     3ac:	0001                	nop
     3ae:	60a6                	ld	ra,72(sp)
     3b0:	6406                	ld	s0,64(sp)
     3b2:	6161                	addi	sp,sp,80
     3b4:	8082                	ret

00000000000003b6 <copyinstr1>:

// what if you pass ridiculous string pointers to system calls?
void
copyinstr1(char *s)
{
     3b6:	715d                	addi	sp,sp,-80
     3b8:	e486                	sd	ra,72(sp)
     3ba:	e0a2                	sd	s0,64(sp)
     3bc:	0880                	addi	s0,sp,80
     3be:	faa43c23          	sd	a0,-72(s0)
  uint64 addrs[] = { 0x80000000LL, 0xffffffffffffffff };
     3c2:	4785                	li	a5,1
     3c4:	07fe                	slli	a5,a5,0x1f
     3c6:	fcf43423          	sd	a5,-56(s0)
     3ca:	57fd                	li	a5,-1
     3cc:	fcf43823          	sd	a5,-48(s0)

  for(int ai = 0; ai < 2; ai++){
     3d0:	fe042623          	sw	zero,-20(s0)
     3d4:	a09d                	j	43a <copyinstr1+0x84>
    uint64 addr = addrs[ai];
     3d6:	fec42783          	lw	a5,-20(s0)
     3da:	078e                	slli	a5,a5,0x3
     3dc:	ff040713          	addi	a4,s0,-16
     3e0:	97ba                	add	a5,a5,a4
     3e2:	fd87b783          	ld	a5,-40(a5)
     3e6:	fef43023          	sd	a5,-32(s0)

    int fd = open((char *)addr, O_CREATE|O_WRONLY);
     3ea:	fe043783          	ld	a5,-32(s0)
     3ee:	20100593          	li	a1,513
     3f2:	853e                	mv	a0,a5
     3f4:	00007097          	auipc	ra,0x7
     3f8:	4d4080e7          	jalr	1236(ra) # 78c8 <open>
     3fc:	87aa                	mv	a5,a0
     3fe:	fcf42e23          	sw	a5,-36(s0)
    if(fd >= 0){
     402:	fdc42783          	lw	a5,-36(s0)
     406:	2781                	sext.w	a5,a5
     408:	0207c463          	bltz	a5,430 <copyinstr1+0x7a>
      printf("open(%p) returned %d, not -1\n", addr, fd);
     40c:	fdc42783          	lw	a5,-36(s0)
     410:	863e                	mv	a2,a5
     412:	fe043583          	ld	a1,-32(s0)
     416:	00008517          	auipc	a0,0x8
     41a:	e5a50513          	addi	a0,a0,-422 # 8270 <malloc+0x2c8>
     41e:	00008097          	auipc	ra,0x8
     422:	998080e7          	jalr	-1640(ra) # 7db6 <printf>
      exit(1);
     426:	4505                	li	a0,1
     428:	00007097          	auipc	ra,0x7
     42c:	460080e7          	jalr	1120(ra) # 7888 <exit>
  for(int ai = 0; ai < 2; ai++){
     430:	fec42783          	lw	a5,-20(s0)
     434:	2785                	addiw	a5,a5,1
     436:	fef42623          	sw	a5,-20(s0)
     43a:	fec42783          	lw	a5,-20(s0)
     43e:	0007871b          	sext.w	a4,a5
     442:	4785                	li	a5,1
     444:	f8e7d9e3          	bge	a5,a4,3d6 <copyinstr1+0x20>
    }
  }
}
     448:	0001                	nop
     44a:	0001                	nop
     44c:	60a6                	ld	ra,72(sp)
     44e:	6406                	ld	s0,64(sp)
     450:	6161                	addi	sp,sp,80
     452:	8082                	ret

0000000000000454 <copyinstr2>:
// what if a string system call argument is exactly the size
// of the kernel buffer it is copied into, so that the null
// would fall just beyond the end of the kernel buffer?
void
copyinstr2(char *s)
{
     454:	7151                	addi	sp,sp,-240
     456:	f586                	sd	ra,232(sp)
     458:	f1a2                	sd	s0,224(sp)
     45a:	1980                	addi	s0,sp,240
     45c:	f0a43c23          	sd	a0,-232(s0)
  char b[MAXPATH+1];

  for(int i = 0; i < MAXPATH; i++)
     460:	fe042623          	sw	zero,-20(s0)
     464:	a839                	j	482 <copyinstr2+0x2e>
    b[i] = 'x';
     466:	fec42783          	lw	a5,-20(s0)
     46a:	ff040713          	addi	a4,s0,-16
     46e:	97ba                	add	a5,a5,a4
     470:	07800713          	li	a4,120
     474:	f6e78423          	sb	a4,-152(a5)
  for(int i = 0; i < MAXPATH; i++)
     478:	fec42783          	lw	a5,-20(s0)
     47c:	2785                	addiw	a5,a5,1
     47e:	fef42623          	sw	a5,-20(s0)
     482:	fec42783          	lw	a5,-20(s0)
     486:	0007871b          	sext.w	a4,a5
     48a:	07f00793          	li	a5,127
     48e:	fce7dce3          	bge	a5,a4,466 <copyinstr2+0x12>
  b[MAXPATH] = '\0';
     492:	fc040c23          	sb	zero,-40(s0)

  int ret = unlink(b);
     496:	f5840793          	addi	a5,s0,-168
     49a:	853e                	mv	a0,a5
     49c:	00007097          	auipc	ra,0x7
     4a0:	43c080e7          	jalr	1084(ra) # 78d8 <unlink>
     4a4:	87aa                	mv	a5,a0
     4a6:	fef42223          	sw	a5,-28(s0)
  if(ret != -1){
     4aa:	fe442783          	lw	a5,-28(s0)
     4ae:	0007871b          	sext.w	a4,a5
     4b2:	57fd                	li	a5,-1
     4b4:	02f70563          	beq	a4,a5,4de <copyinstr2+0x8a>
    printf("unlink(%s) returned %d, not -1\n", b, ret);
     4b8:	fe442703          	lw	a4,-28(s0)
     4bc:	f5840793          	addi	a5,s0,-168
     4c0:	863a                	mv	a2,a4
     4c2:	85be                	mv	a1,a5
     4c4:	00008517          	auipc	a0,0x8
     4c8:	dcc50513          	addi	a0,a0,-564 # 8290 <malloc+0x2e8>
     4cc:	00008097          	auipc	ra,0x8
     4d0:	8ea080e7          	jalr	-1814(ra) # 7db6 <printf>
    exit(1);
     4d4:	4505                	li	a0,1
     4d6:	00007097          	auipc	ra,0x7
     4da:	3b2080e7          	jalr	946(ra) # 7888 <exit>
  }

  int fd = open(b, O_CREATE | O_WRONLY);
     4de:	f5840793          	addi	a5,s0,-168
     4e2:	20100593          	li	a1,513
     4e6:	853e                	mv	a0,a5
     4e8:	00007097          	auipc	ra,0x7
     4ec:	3e0080e7          	jalr	992(ra) # 78c8 <open>
     4f0:	87aa                	mv	a5,a0
     4f2:	fef42023          	sw	a5,-32(s0)
  if(fd != -1){
     4f6:	fe042783          	lw	a5,-32(s0)
     4fa:	0007871b          	sext.w	a4,a5
     4fe:	57fd                	li	a5,-1
     500:	02f70563          	beq	a4,a5,52a <copyinstr2+0xd6>
    printf("open(%s) returned %d, not -1\n", b, fd);
     504:	fe042703          	lw	a4,-32(s0)
     508:	f5840793          	addi	a5,s0,-168
     50c:	863a                	mv	a2,a4
     50e:	85be                	mv	a1,a5
     510:	00008517          	auipc	a0,0x8
     514:	da050513          	addi	a0,a0,-608 # 82b0 <malloc+0x308>
     518:	00008097          	auipc	ra,0x8
     51c:	89e080e7          	jalr	-1890(ra) # 7db6 <printf>
    exit(1);
     520:	4505                	li	a0,1
     522:	00007097          	auipc	ra,0x7
     526:	366080e7          	jalr	870(ra) # 7888 <exit>
  }

  ret = link(b, b);
     52a:	f5840713          	addi	a4,s0,-168
     52e:	f5840793          	addi	a5,s0,-168
     532:	85ba                	mv	a1,a4
     534:	853e                	mv	a0,a5
     536:	00007097          	auipc	ra,0x7
     53a:	3b2080e7          	jalr	946(ra) # 78e8 <link>
     53e:	87aa                	mv	a5,a0
     540:	fef42223          	sw	a5,-28(s0)
  if(ret != -1){
     544:	fe442783          	lw	a5,-28(s0)
     548:	0007871b          	sext.w	a4,a5
     54c:	57fd                	li	a5,-1
     54e:	02f70763          	beq	a4,a5,57c <copyinstr2+0x128>
    printf("link(%s, %s) returned %d, not -1\n", b, b, ret);
     552:	fe442683          	lw	a3,-28(s0)
     556:	f5840713          	addi	a4,s0,-168
     55a:	f5840793          	addi	a5,s0,-168
     55e:	863a                	mv	a2,a4
     560:	85be                	mv	a1,a5
     562:	00008517          	auipc	a0,0x8
     566:	d6e50513          	addi	a0,a0,-658 # 82d0 <malloc+0x328>
     56a:	00008097          	auipc	ra,0x8
     56e:	84c080e7          	jalr	-1972(ra) # 7db6 <printf>
    exit(1);
     572:	4505                	li	a0,1
     574:	00007097          	auipc	ra,0x7
     578:	314080e7          	jalr	788(ra) # 7888 <exit>
  }

  char *args[] = { "xx", 0 };
     57c:	00008797          	auipc	a5,0x8
     580:	d7c78793          	addi	a5,a5,-644 # 82f8 <malloc+0x350>
     584:	f4f43423          	sd	a5,-184(s0)
     588:	f4043823          	sd	zero,-176(s0)
  ret = exec(b, args);
     58c:	f4840713          	addi	a4,s0,-184
     590:	f5840793          	addi	a5,s0,-168
     594:	85ba                	mv	a1,a4
     596:	853e                	mv	a0,a5
     598:	00007097          	auipc	ra,0x7
     59c:	328080e7          	jalr	808(ra) # 78c0 <exec>
     5a0:	87aa                	mv	a5,a0
     5a2:	fef42223          	sw	a5,-28(s0)
  if(ret != -1){
     5a6:	fe442783          	lw	a5,-28(s0)
     5aa:	0007871b          	sext.w	a4,a5
     5ae:	57fd                	li	a5,-1
     5b0:	02f70563          	beq	a4,a5,5da <copyinstr2+0x186>
    printf("exec(%s) returned %d, not -1\n", b, fd);
     5b4:	fe042703          	lw	a4,-32(s0)
     5b8:	f5840793          	addi	a5,s0,-168
     5bc:	863a                	mv	a2,a4
     5be:	85be                	mv	a1,a5
     5c0:	00008517          	auipc	a0,0x8
     5c4:	d4050513          	addi	a0,a0,-704 # 8300 <malloc+0x358>
     5c8:	00007097          	auipc	ra,0x7
     5cc:	7ee080e7          	jalr	2030(ra) # 7db6 <printf>
    exit(1);
     5d0:	4505                	li	a0,1
     5d2:	00007097          	auipc	ra,0x7
     5d6:	2b6080e7          	jalr	694(ra) # 7888 <exit>
  }

  int pid = fork();
     5da:	00007097          	auipc	ra,0x7
     5de:	2a6080e7          	jalr	678(ra) # 7880 <fork>
     5e2:	87aa                	mv	a5,a0
     5e4:	fcf42e23          	sw	a5,-36(s0)
  if(pid < 0){
     5e8:	fdc42783          	lw	a5,-36(s0)
     5ec:	2781                	sext.w	a5,a5
     5ee:	0007df63          	bgez	a5,60c <copyinstr2+0x1b8>
    printf("fork failed\n");
     5f2:	00008517          	auipc	a0,0x8
     5f6:	d2e50513          	addi	a0,a0,-722 # 8320 <malloc+0x378>
     5fa:	00007097          	auipc	ra,0x7
     5fe:	7bc080e7          	jalr	1980(ra) # 7db6 <printf>
    exit(1);
     602:	4505                	li	a0,1
     604:	00007097          	auipc	ra,0x7
     608:	284080e7          	jalr	644(ra) # 7888 <exit>
  }
  if(pid == 0){
     60c:	fdc42783          	lw	a5,-36(s0)
     610:	2781                	sext.w	a5,a5
     612:	efd5                	bnez	a5,6ce <copyinstr2+0x27a>
    static char big[PGSIZE+1];
    for(int i = 0; i < PGSIZE; i++)
     614:	fe042423          	sw	zero,-24(s0)
     618:	a00d                	j	63a <copyinstr2+0x1e6>
      big[i] = 'x';
     61a:	00010717          	auipc	a4,0x10
     61e:	54670713          	addi	a4,a4,1350 # 10b60 <big.1266>
     622:	fe842783          	lw	a5,-24(s0)
     626:	97ba                	add	a5,a5,a4
     628:	07800713          	li	a4,120
     62c:	00e78023          	sb	a4,0(a5)
    for(int i = 0; i < PGSIZE; i++)
     630:	fe842783          	lw	a5,-24(s0)
     634:	2785                	addiw	a5,a5,1
     636:	fef42423          	sw	a5,-24(s0)
     63a:	fe842783          	lw	a5,-24(s0)
     63e:	0007871b          	sext.w	a4,a5
     642:	6785                	lui	a5,0x1
     644:	fcf74be3          	blt	a4,a5,61a <copyinstr2+0x1c6>
    big[PGSIZE] = '\0';
     648:	00010717          	auipc	a4,0x10
     64c:	51870713          	addi	a4,a4,1304 # 10b60 <big.1266>
     650:	6785                	lui	a5,0x1
     652:	97ba                	add	a5,a5,a4
     654:	00078023          	sb	zero,0(a5) # 1000 <truncate3+0x1aa>
    char *args2[] = { big, big, big, 0 };
     658:	00008797          	auipc	a5,0x8
     65c:	d3878793          	addi	a5,a5,-712 # 8390 <malloc+0x3e8>
     660:	6390                	ld	a2,0(a5)
     662:	6794                	ld	a3,8(a5)
     664:	6b98                	ld	a4,16(a5)
     666:	6f9c                	ld	a5,24(a5)
     668:	f2c43023          	sd	a2,-224(s0)
     66c:	f2d43423          	sd	a3,-216(s0)
     670:	f2e43823          	sd	a4,-208(s0)
     674:	f2f43c23          	sd	a5,-200(s0)
    ret = exec("echo", args2);
     678:	f2040793          	addi	a5,s0,-224
     67c:	85be                	mv	a1,a5
     67e:	00008517          	auipc	a0,0x8
     682:	cb250513          	addi	a0,a0,-846 # 8330 <malloc+0x388>
     686:	00007097          	auipc	ra,0x7
     68a:	23a080e7          	jalr	570(ra) # 78c0 <exec>
     68e:	87aa                	mv	a5,a0
     690:	fef42223          	sw	a5,-28(s0)
    if(ret != -1){
     694:	fe442783          	lw	a5,-28(s0)
     698:	0007871b          	sext.w	a4,a5
     69c:	57fd                	li	a5,-1
     69e:	02f70263          	beq	a4,a5,6c2 <copyinstr2+0x26e>
      printf("exec(echo, BIG) returned %d, not -1\n", fd);
     6a2:	fe042783          	lw	a5,-32(s0)
     6a6:	85be                	mv	a1,a5
     6a8:	00008517          	auipc	a0,0x8
     6ac:	c9050513          	addi	a0,a0,-880 # 8338 <malloc+0x390>
     6b0:	00007097          	auipc	ra,0x7
     6b4:	706080e7          	jalr	1798(ra) # 7db6 <printf>
      exit(1);
     6b8:	4505                	li	a0,1
     6ba:	00007097          	auipc	ra,0x7
     6be:	1ce080e7          	jalr	462(ra) # 7888 <exit>
    }
    exit(747); // OK
     6c2:	2eb00513          	li	a0,747
     6c6:	00007097          	auipc	ra,0x7
     6ca:	1c2080e7          	jalr	450(ra) # 7888 <exit>
  }

  int st = 0;
     6ce:	f4042223          	sw	zero,-188(s0)
  wait(&st);
     6d2:	f4440793          	addi	a5,s0,-188
     6d6:	853e                	mv	a0,a5
     6d8:	00007097          	auipc	ra,0x7
     6dc:	1b8080e7          	jalr	440(ra) # 7890 <wait>
  if(st != 747){
     6e0:	f4442783          	lw	a5,-188(s0)
     6e4:	873e                	mv	a4,a5
     6e6:	2eb00793          	li	a5,747
     6ea:	00f70f63          	beq	a4,a5,708 <copyinstr2+0x2b4>
    printf("exec(echo, BIG) succeeded, should have failed\n");
     6ee:	00008517          	auipc	a0,0x8
     6f2:	c7250513          	addi	a0,a0,-910 # 8360 <malloc+0x3b8>
     6f6:	00007097          	auipc	ra,0x7
     6fa:	6c0080e7          	jalr	1728(ra) # 7db6 <printf>
    exit(1);
     6fe:	4505                	li	a0,1
     700:	00007097          	auipc	ra,0x7
     704:	188080e7          	jalr	392(ra) # 7888 <exit>
  }
}
     708:	0001                	nop
     70a:	70ae                	ld	ra,232(sp)
     70c:	740e                	ld	s0,224(sp)
     70e:	616d                	addi	sp,sp,240
     710:	8082                	ret

0000000000000712 <copyinstr3>:

// what if a string argument crosses over the end of last user page?
void
copyinstr3(char *s)
{
     712:	715d                	addi	sp,sp,-80
     714:	e486                	sd	ra,72(sp)
     716:	e0a2                	sd	s0,64(sp)
     718:	0880                	addi	s0,sp,80
     71a:	faa43c23          	sd	a0,-72(s0)
  sbrk(8192);
     71e:	6509                	lui	a0,0x2
     720:	00007097          	auipc	ra,0x7
     724:	1f0080e7          	jalr	496(ra) # 7910 <sbrk>
  uint64 top = (uint64) sbrk(0);
     728:	4501                	li	a0,0
     72a:	00007097          	auipc	ra,0x7
     72e:	1e6080e7          	jalr	486(ra) # 7910 <sbrk>
     732:	87aa                	mv	a5,a0
     734:	fef43423          	sd	a5,-24(s0)
  if((top % PGSIZE) != 0){
     738:	fe843703          	ld	a4,-24(s0)
     73c:	6785                	lui	a5,0x1
     73e:	17fd                	addi	a5,a5,-1
     740:	8ff9                	and	a5,a5,a4
     742:	c39d                	beqz	a5,768 <copyinstr3+0x56>
    sbrk(PGSIZE - (top % PGSIZE));
     744:	fe843783          	ld	a5,-24(s0)
     748:	2781                	sext.w	a5,a5
     74a:	873e                	mv	a4,a5
     74c:	6785                	lui	a5,0x1
     74e:	17fd                	addi	a5,a5,-1
     750:	8ff9                	and	a5,a5,a4
     752:	2781                	sext.w	a5,a5
     754:	6705                	lui	a4,0x1
     756:	40f707bb          	subw	a5,a4,a5
     75a:	2781                	sext.w	a5,a5
     75c:	2781                	sext.w	a5,a5
     75e:	853e                	mv	a0,a5
     760:	00007097          	auipc	ra,0x7
     764:	1b0080e7          	jalr	432(ra) # 7910 <sbrk>
  }
  top = (uint64) sbrk(0);
     768:	4501                	li	a0,0
     76a:	00007097          	auipc	ra,0x7
     76e:	1a6080e7          	jalr	422(ra) # 7910 <sbrk>
     772:	87aa                	mv	a5,a0
     774:	fef43423          	sd	a5,-24(s0)
  if(top % PGSIZE){
     778:	fe843703          	ld	a4,-24(s0)
     77c:	6785                	lui	a5,0x1
     77e:	17fd                	addi	a5,a5,-1
     780:	8ff9                	and	a5,a5,a4
     782:	cf91                	beqz	a5,79e <copyinstr3+0x8c>
    printf("oops\n");
     784:	00008517          	auipc	a0,0x8
     788:	c2c50513          	addi	a0,a0,-980 # 83b0 <malloc+0x408>
     78c:	00007097          	auipc	ra,0x7
     790:	62a080e7          	jalr	1578(ra) # 7db6 <printf>
    exit(1);
     794:	4505                	li	a0,1
     796:	00007097          	auipc	ra,0x7
     79a:	0f2080e7          	jalr	242(ra) # 7888 <exit>
  }

  char *b = (char *) (top - 1);
     79e:	fe843783          	ld	a5,-24(s0)
     7a2:	17fd                	addi	a5,a5,-1
     7a4:	fef43023          	sd	a5,-32(s0)
  *b = 'x';
     7a8:	fe043783          	ld	a5,-32(s0)
     7ac:	07800713          	li	a4,120
     7b0:	00e78023          	sb	a4,0(a5) # 1000 <truncate3+0x1aa>

  int ret = unlink(b);
     7b4:	fe043503          	ld	a0,-32(s0)
     7b8:	00007097          	auipc	ra,0x7
     7bc:	120080e7          	jalr	288(ra) # 78d8 <unlink>
     7c0:	87aa                	mv	a5,a0
     7c2:	fcf42e23          	sw	a5,-36(s0)
  if(ret != -1){
     7c6:	fdc42783          	lw	a5,-36(s0)
     7ca:	0007871b          	sext.w	a4,a5
     7ce:	57fd                	li	a5,-1
     7d0:	02f70463          	beq	a4,a5,7f8 <copyinstr3+0xe6>
    printf("unlink(%s) returned %d, not -1\n", b, ret);
     7d4:	fdc42783          	lw	a5,-36(s0)
     7d8:	863e                	mv	a2,a5
     7da:	fe043583          	ld	a1,-32(s0)
     7de:	00008517          	auipc	a0,0x8
     7e2:	ab250513          	addi	a0,a0,-1358 # 8290 <malloc+0x2e8>
     7e6:	00007097          	auipc	ra,0x7
     7ea:	5d0080e7          	jalr	1488(ra) # 7db6 <printf>
    exit(1);
     7ee:	4505                	li	a0,1
     7f0:	00007097          	auipc	ra,0x7
     7f4:	098080e7          	jalr	152(ra) # 7888 <exit>
  }

  int fd = open(b, O_CREATE | O_WRONLY);
     7f8:	20100593          	li	a1,513
     7fc:	fe043503          	ld	a0,-32(s0)
     800:	00007097          	auipc	ra,0x7
     804:	0c8080e7          	jalr	200(ra) # 78c8 <open>
     808:	87aa                	mv	a5,a0
     80a:	fcf42c23          	sw	a5,-40(s0)
  if(fd != -1){
     80e:	fd842783          	lw	a5,-40(s0)
     812:	0007871b          	sext.w	a4,a5
     816:	57fd                	li	a5,-1
     818:	02f70463          	beq	a4,a5,840 <copyinstr3+0x12e>
    printf("open(%s) returned %d, not -1\n", b, fd);
     81c:	fd842783          	lw	a5,-40(s0)
     820:	863e                	mv	a2,a5
     822:	fe043583          	ld	a1,-32(s0)
     826:	00008517          	auipc	a0,0x8
     82a:	a8a50513          	addi	a0,a0,-1398 # 82b0 <malloc+0x308>
     82e:	00007097          	auipc	ra,0x7
     832:	588080e7          	jalr	1416(ra) # 7db6 <printf>
    exit(1);
     836:	4505                	li	a0,1
     838:	00007097          	auipc	ra,0x7
     83c:	050080e7          	jalr	80(ra) # 7888 <exit>
  }

  ret = link(b, b);
     840:	fe043583          	ld	a1,-32(s0)
     844:	fe043503          	ld	a0,-32(s0)
     848:	00007097          	auipc	ra,0x7
     84c:	0a0080e7          	jalr	160(ra) # 78e8 <link>
     850:	87aa                	mv	a5,a0
     852:	fcf42e23          	sw	a5,-36(s0)
  if(ret != -1){
     856:	fdc42783          	lw	a5,-36(s0)
     85a:	0007871b          	sext.w	a4,a5
     85e:	57fd                	li	a5,-1
     860:	02f70663          	beq	a4,a5,88c <copyinstr3+0x17a>
    printf("link(%s, %s) returned %d, not -1\n", b, b, ret);
     864:	fdc42783          	lw	a5,-36(s0)
     868:	86be                	mv	a3,a5
     86a:	fe043603          	ld	a2,-32(s0)
     86e:	fe043583          	ld	a1,-32(s0)
     872:	00008517          	auipc	a0,0x8
     876:	a5e50513          	addi	a0,a0,-1442 # 82d0 <malloc+0x328>
     87a:	00007097          	auipc	ra,0x7
     87e:	53c080e7          	jalr	1340(ra) # 7db6 <printf>
    exit(1);
     882:	4505                	li	a0,1
     884:	00007097          	auipc	ra,0x7
     888:	004080e7          	jalr	4(ra) # 7888 <exit>
  }

  char *args[] = { "xx", 0 };
     88c:	00008797          	auipc	a5,0x8
     890:	a6c78793          	addi	a5,a5,-1428 # 82f8 <malloc+0x350>
     894:	fcf43423          	sd	a5,-56(s0)
     898:	fc043823          	sd	zero,-48(s0)
  ret = exec(b, args);
     89c:	fc840793          	addi	a5,s0,-56
     8a0:	85be                	mv	a1,a5
     8a2:	fe043503          	ld	a0,-32(s0)
     8a6:	00007097          	auipc	ra,0x7
     8aa:	01a080e7          	jalr	26(ra) # 78c0 <exec>
     8ae:	87aa                	mv	a5,a0
     8b0:	fcf42e23          	sw	a5,-36(s0)
  if(ret != -1){
     8b4:	fdc42783          	lw	a5,-36(s0)
     8b8:	0007871b          	sext.w	a4,a5
     8bc:	57fd                	li	a5,-1
     8be:	02f70463          	beq	a4,a5,8e6 <copyinstr3+0x1d4>
    printf("exec(%s) returned %d, not -1\n", b, fd);
     8c2:	fd842783          	lw	a5,-40(s0)
     8c6:	863e                	mv	a2,a5
     8c8:	fe043583          	ld	a1,-32(s0)
     8cc:	00008517          	auipc	a0,0x8
     8d0:	a3450513          	addi	a0,a0,-1484 # 8300 <malloc+0x358>
     8d4:	00007097          	auipc	ra,0x7
     8d8:	4e2080e7          	jalr	1250(ra) # 7db6 <printf>
    exit(1);
     8dc:	4505                	li	a0,1
     8de:	00007097          	auipc	ra,0x7
     8e2:	faa080e7          	jalr	-86(ra) # 7888 <exit>
  }
}
     8e6:	0001                	nop
     8e8:	60a6                	ld	ra,72(sp)
     8ea:	6406                	ld	s0,64(sp)
     8ec:	6161                	addi	sp,sp,80
     8ee:	8082                	ret

00000000000008f0 <rwsbrk>:

// See if the kernel refuses to read/write user memory that the
// application doesn't have anymore, because it returned it.
void
rwsbrk()
{
     8f0:	1101                	addi	sp,sp,-32
     8f2:	ec06                	sd	ra,24(sp)
     8f4:	e822                	sd	s0,16(sp)
     8f6:	1000                	addi	s0,sp,32
  int fd, n;

  uint64 a = (uint64) sbrk(8192);
     8f8:	6509                	lui	a0,0x2
     8fa:	00007097          	auipc	ra,0x7
     8fe:	016080e7          	jalr	22(ra) # 7910 <sbrk>
     902:	87aa                	mv	a5,a0
     904:	fef43423          	sd	a5,-24(s0)

  if(a == 0xffffffffffffffffLL) {
     908:	fe843703          	ld	a4,-24(s0)
     90c:	57fd                	li	a5,-1
     90e:	00f71f63          	bne	a4,a5,92c <rwsbrk+0x3c>
    printf("sbrk(rwsbrk) failed\n");
     912:	00008517          	auipc	a0,0x8
     916:	aa650513          	addi	a0,a0,-1370 # 83b8 <malloc+0x410>
     91a:	00007097          	auipc	ra,0x7
     91e:	49c080e7          	jalr	1180(ra) # 7db6 <printf>
    exit(1);
     922:	4505                	li	a0,1
     924:	00007097          	auipc	ra,0x7
     928:	f64080e7          	jalr	-156(ra) # 7888 <exit>
  }

  if ((uint64) sbrk(-8192) ==  0xffffffffffffffffLL) {
     92c:	7579                	lui	a0,0xffffe
     92e:	00007097          	auipc	ra,0x7
     932:	fe2080e7          	jalr	-30(ra) # 7910 <sbrk>
     936:	872a                	mv	a4,a0
     938:	57fd                	li	a5,-1
     93a:	00f71f63          	bne	a4,a5,958 <rwsbrk+0x68>
    printf("sbrk(rwsbrk) shrink failed\n");
     93e:	00008517          	auipc	a0,0x8
     942:	a9250513          	addi	a0,a0,-1390 # 83d0 <malloc+0x428>
     946:	00007097          	auipc	ra,0x7
     94a:	470080e7          	jalr	1136(ra) # 7db6 <printf>
    exit(1);
     94e:	4505                	li	a0,1
     950:	00007097          	auipc	ra,0x7
     954:	f38080e7          	jalr	-200(ra) # 7888 <exit>
  }

  fd = open("rwsbrk", O_CREATE|O_WRONLY);
     958:	20100593          	li	a1,513
     95c:	00008517          	auipc	a0,0x8
     960:	a9450513          	addi	a0,a0,-1388 # 83f0 <malloc+0x448>
     964:	00007097          	auipc	ra,0x7
     968:	f64080e7          	jalr	-156(ra) # 78c8 <open>
     96c:	87aa                	mv	a5,a0
     96e:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
     972:	fe442783          	lw	a5,-28(s0)
     976:	2781                	sext.w	a5,a5
     978:	0007df63          	bgez	a5,996 <rwsbrk+0xa6>
    printf("open(rwsbrk) failed\n");
     97c:	00008517          	auipc	a0,0x8
     980:	a7c50513          	addi	a0,a0,-1412 # 83f8 <malloc+0x450>
     984:	00007097          	auipc	ra,0x7
     988:	432080e7          	jalr	1074(ra) # 7db6 <printf>
    exit(1);
     98c:	4505                	li	a0,1
     98e:	00007097          	auipc	ra,0x7
     992:	efa080e7          	jalr	-262(ra) # 7888 <exit>
  }
  n = write(fd, (void*)(a+4096), 1024);
     996:	fe843703          	ld	a4,-24(s0)
     99a:	6785                	lui	a5,0x1
     99c:	97ba                	add	a5,a5,a4
     99e:	873e                	mv	a4,a5
     9a0:	fe442783          	lw	a5,-28(s0)
     9a4:	40000613          	li	a2,1024
     9a8:	85ba                	mv	a1,a4
     9aa:	853e                	mv	a0,a5
     9ac:	00007097          	auipc	ra,0x7
     9b0:	efc080e7          	jalr	-260(ra) # 78a8 <write>
     9b4:	87aa                	mv	a5,a0
     9b6:	fef42023          	sw	a5,-32(s0)
  if(n >= 0){
     9ba:	fe042783          	lw	a5,-32(s0)
     9be:	2781                	sext.w	a5,a5
     9c0:	0207c763          	bltz	a5,9ee <rwsbrk+0xfe>
    printf("write(fd, %p, 1024) returned %d, not -1\n", a+4096, n);
     9c4:	fe843703          	ld	a4,-24(s0)
     9c8:	6785                	lui	a5,0x1
     9ca:	97ba                	add	a5,a5,a4
     9cc:	fe042703          	lw	a4,-32(s0)
     9d0:	863a                	mv	a2,a4
     9d2:	85be                	mv	a1,a5
     9d4:	00008517          	auipc	a0,0x8
     9d8:	a3c50513          	addi	a0,a0,-1476 # 8410 <malloc+0x468>
     9dc:	00007097          	auipc	ra,0x7
     9e0:	3da080e7          	jalr	986(ra) # 7db6 <printf>
    exit(1);
     9e4:	4505                	li	a0,1
     9e6:	00007097          	auipc	ra,0x7
     9ea:	ea2080e7          	jalr	-350(ra) # 7888 <exit>
  }
  close(fd);
     9ee:	fe442783          	lw	a5,-28(s0)
     9f2:	853e                	mv	a0,a5
     9f4:	00007097          	auipc	ra,0x7
     9f8:	ebc080e7          	jalr	-324(ra) # 78b0 <close>
  unlink("rwsbrk");
     9fc:	00008517          	auipc	a0,0x8
     a00:	9f450513          	addi	a0,a0,-1548 # 83f0 <malloc+0x448>
     a04:	00007097          	auipc	ra,0x7
     a08:	ed4080e7          	jalr	-300(ra) # 78d8 <unlink>

  fd = open("README", O_RDONLY);
     a0c:	4581                	li	a1,0
     a0e:	00007517          	auipc	a0,0x7
     a12:	7c250513          	addi	a0,a0,1986 # 81d0 <malloc+0x228>
     a16:	00007097          	auipc	ra,0x7
     a1a:	eb2080e7          	jalr	-334(ra) # 78c8 <open>
     a1e:	87aa                	mv	a5,a0
     a20:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
     a24:	fe442783          	lw	a5,-28(s0)
     a28:	2781                	sext.w	a5,a5
     a2a:	0007df63          	bgez	a5,a48 <rwsbrk+0x158>
    printf("open(rwsbrk) failed\n");
     a2e:	00008517          	auipc	a0,0x8
     a32:	9ca50513          	addi	a0,a0,-1590 # 83f8 <malloc+0x450>
     a36:	00007097          	auipc	ra,0x7
     a3a:	380080e7          	jalr	896(ra) # 7db6 <printf>
    exit(1);
     a3e:	4505                	li	a0,1
     a40:	00007097          	auipc	ra,0x7
     a44:	e48080e7          	jalr	-440(ra) # 7888 <exit>
  }
  n = read(fd, (void*)(a+4096), 10);
     a48:	fe843703          	ld	a4,-24(s0)
     a4c:	6785                	lui	a5,0x1
     a4e:	97ba                	add	a5,a5,a4
     a50:	873e                	mv	a4,a5
     a52:	fe442783          	lw	a5,-28(s0)
     a56:	4629                	li	a2,10
     a58:	85ba                	mv	a1,a4
     a5a:	853e                	mv	a0,a5
     a5c:	00007097          	auipc	ra,0x7
     a60:	e44080e7          	jalr	-444(ra) # 78a0 <read>
     a64:	87aa                	mv	a5,a0
     a66:	fef42023          	sw	a5,-32(s0)
  if(n >= 0){
     a6a:	fe042783          	lw	a5,-32(s0)
     a6e:	2781                	sext.w	a5,a5
     a70:	0207c763          	bltz	a5,a9e <rwsbrk+0x1ae>
    printf("read(fd, %p, 10) returned %d, not -1\n", a+4096, n);
     a74:	fe843703          	ld	a4,-24(s0)
     a78:	6785                	lui	a5,0x1
     a7a:	97ba                	add	a5,a5,a4
     a7c:	fe042703          	lw	a4,-32(s0)
     a80:	863a                	mv	a2,a4
     a82:	85be                	mv	a1,a5
     a84:	00008517          	auipc	a0,0x8
     a88:	9bc50513          	addi	a0,a0,-1604 # 8440 <malloc+0x498>
     a8c:	00007097          	auipc	ra,0x7
     a90:	32a080e7          	jalr	810(ra) # 7db6 <printf>
    exit(1);
     a94:	4505                	li	a0,1
     a96:	00007097          	auipc	ra,0x7
     a9a:	df2080e7          	jalr	-526(ra) # 7888 <exit>
  }
  close(fd);
     a9e:	fe442783          	lw	a5,-28(s0)
     aa2:	853e                	mv	a0,a5
     aa4:	00007097          	auipc	ra,0x7
     aa8:	e0c080e7          	jalr	-500(ra) # 78b0 <close>

  exit(0);
     aac:	4501                	li	a0,0
     aae:	00007097          	auipc	ra,0x7
     ab2:	dda080e7          	jalr	-550(ra) # 7888 <exit>

0000000000000ab6 <truncate1>:
}

// test O_TRUNC.
void
truncate1(char *s)
{
     ab6:	715d                	addi	sp,sp,-80
     ab8:	e486                	sd	ra,72(sp)
     aba:	e0a2                	sd	s0,64(sp)
     abc:	0880                	addi	s0,sp,80
     abe:	faa43c23          	sd	a0,-72(s0)
  char buf[32];

  unlink("truncfile");
     ac2:	00008517          	auipc	a0,0x8
     ac6:	9a650513          	addi	a0,a0,-1626 # 8468 <malloc+0x4c0>
     aca:	00007097          	auipc	ra,0x7
     ace:	e0e080e7          	jalr	-498(ra) # 78d8 <unlink>
  int fd1 = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
     ad2:	60100593          	li	a1,1537
     ad6:	00008517          	auipc	a0,0x8
     ada:	99250513          	addi	a0,a0,-1646 # 8468 <malloc+0x4c0>
     ade:	00007097          	auipc	ra,0x7
     ae2:	dea080e7          	jalr	-534(ra) # 78c8 <open>
     ae6:	87aa                	mv	a5,a0
     ae8:	fef42623          	sw	a5,-20(s0)
  write(fd1, "abcd", 4);
     aec:	fec42783          	lw	a5,-20(s0)
     af0:	4611                	li	a2,4
     af2:	00008597          	auipc	a1,0x8
     af6:	98658593          	addi	a1,a1,-1658 # 8478 <malloc+0x4d0>
     afa:	853e                	mv	a0,a5
     afc:	00007097          	auipc	ra,0x7
     b00:	dac080e7          	jalr	-596(ra) # 78a8 <write>
  close(fd1);
     b04:	fec42783          	lw	a5,-20(s0)
     b08:	853e                	mv	a0,a5
     b0a:	00007097          	auipc	ra,0x7
     b0e:	da6080e7          	jalr	-602(ra) # 78b0 <close>

  int fd2 = open("truncfile", O_RDONLY);
     b12:	4581                	li	a1,0
     b14:	00008517          	auipc	a0,0x8
     b18:	95450513          	addi	a0,a0,-1708 # 8468 <malloc+0x4c0>
     b1c:	00007097          	auipc	ra,0x7
     b20:	dac080e7          	jalr	-596(ra) # 78c8 <open>
     b24:	87aa                	mv	a5,a0
     b26:	fef42423          	sw	a5,-24(s0)
  int n = read(fd2, buf, sizeof(buf));
     b2a:	fc040713          	addi	a4,s0,-64
     b2e:	fe842783          	lw	a5,-24(s0)
     b32:	02000613          	li	a2,32
     b36:	85ba                	mv	a1,a4
     b38:	853e                	mv	a0,a5
     b3a:	00007097          	auipc	ra,0x7
     b3e:	d66080e7          	jalr	-666(ra) # 78a0 <read>
     b42:	87aa                	mv	a5,a0
     b44:	fef42223          	sw	a5,-28(s0)
  if(n != 4){
     b48:	fe442783          	lw	a5,-28(s0)
     b4c:	0007871b          	sext.w	a4,a5
     b50:	4791                	li	a5,4
     b52:	02f70463          	beq	a4,a5,b7a <truncate1+0xc4>
    printf("%s: read %d bytes, wanted 4\n", s, n);
     b56:	fe442783          	lw	a5,-28(s0)
     b5a:	863e                	mv	a2,a5
     b5c:	fb843583          	ld	a1,-72(s0)
     b60:	00008517          	auipc	a0,0x8
     b64:	92050513          	addi	a0,a0,-1760 # 8480 <malloc+0x4d8>
     b68:	00007097          	auipc	ra,0x7
     b6c:	24e080e7          	jalr	590(ra) # 7db6 <printf>
    exit(1);
     b70:	4505                	li	a0,1
     b72:	00007097          	auipc	ra,0x7
     b76:	d16080e7          	jalr	-746(ra) # 7888 <exit>
  }

  fd1 = open("truncfile", O_WRONLY|O_TRUNC);
     b7a:	40100593          	li	a1,1025
     b7e:	00008517          	auipc	a0,0x8
     b82:	8ea50513          	addi	a0,a0,-1814 # 8468 <malloc+0x4c0>
     b86:	00007097          	auipc	ra,0x7
     b8a:	d42080e7          	jalr	-702(ra) # 78c8 <open>
     b8e:	87aa                	mv	a5,a0
     b90:	fef42623          	sw	a5,-20(s0)

  int fd3 = open("truncfile", O_RDONLY);
     b94:	4581                	li	a1,0
     b96:	00008517          	auipc	a0,0x8
     b9a:	8d250513          	addi	a0,a0,-1838 # 8468 <malloc+0x4c0>
     b9e:	00007097          	auipc	ra,0x7
     ba2:	d2a080e7          	jalr	-726(ra) # 78c8 <open>
     ba6:	87aa                	mv	a5,a0
     ba8:	fef42023          	sw	a5,-32(s0)
  n = read(fd3, buf, sizeof(buf));
     bac:	fc040713          	addi	a4,s0,-64
     bb0:	fe042783          	lw	a5,-32(s0)
     bb4:	02000613          	li	a2,32
     bb8:	85ba                	mv	a1,a4
     bba:	853e                	mv	a0,a5
     bbc:	00007097          	auipc	ra,0x7
     bc0:	ce4080e7          	jalr	-796(ra) # 78a0 <read>
     bc4:	87aa                	mv	a5,a0
     bc6:	fef42223          	sw	a5,-28(s0)
  if(n != 0){
     bca:	fe442783          	lw	a5,-28(s0)
     bce:	2781                	sext.w	a5,a5
     bd0:	cf95                	beqz	a5,c0c <truncate1+0x156>
    printf("aaa fd3=%d\n", fd3);
     bd2:	fe042783          	lw	a5,-32(s0)
     bd6:	85be                	mv	a1,a5
     bd8:	00008517          	auipc	a0,0x8
     bdc:	8c850513          	addi	a0,a0,-1848 # 84a0 <malloc+0x4f8>
     be0:	00007097          	auipc	ra,0x7
     be4:	1d6080e7          	jalr	470(ra) # 7db6 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     be8:	fe442783          	lw	a5,-28(s0)
     bec:	863e                	mv	a2,a5
     bee:	fb843583          	ld	a1,-72(s0)
     bf2:	00008517          	auipc	a0,0x8
     bf6:	8be50513          	addi	a0,a0,-1858 # 84b0 <malloc+0x508>
     bfa:	00007097          	auipc	ra,0x7
     bfe:	1bc080e7          	jalr	444(ra) # 7db6 <printf>
    exit(1);
     c02:	4505                	li	a0,1
     c04:	00007097          	auipc	ra,0x7
     c08:	c84080e7          	jalr	-892(ra) # 7888 <exit>
  }

  n = read(fd2, buf, sizeof(buf));
     c0c:	fc040713          	addi	a4,s0,-64
     c10:	fe842783          	lw	a5,-24(s0)
     c14:	02000613          	li	a2,32
     c18:	85ba                	mv	a1,a4
     c1a:	853e                	mv	a0,a5
     c1c:	00007097          	auipc	ra,0x7
     c20:	c84080e7          	jalr	-892(ra) # 78a0 <read>
     c24:	87aa                	mv	a5,a0
     c26:	fef42223          	sw	a5,-28(s0)
  if(n != 0){
     c2a:	fe442783          	lw	a5,-28(s0)
     c2e:	2781                	sext.w	a5,a5
     c30:	cf95                	beqz	a5,c6c <truncate1+0x1b6>
    printf("bbb fd2=%d\n", fd2);
     c32:	fe842783          	lw	a5,-24(s0)
     c36:	85be                	mv	a1,a5
     c38:	00008517          	auipc	a0,0x8
     c3c:	89850513          	addi	a0,a0,-1896 # 84d0 <malloc+0x528>
     c40:	00007097          	auipc	ra,0x7
     c44:	176080e7          	jalr	374(ra) # 7db6 <printf>
    printf("%s: read %d bytes, wanted 0\n", s, n);
     c48:	fe442783          	lw	a5,-28(s0)
     c4c:	863e                	mv	a2,a5
     c4e:	fb843583          	ld	a1,-72(s0)
     c52:	00008517          	auipc	a0,0x8
     c56:	85e50513          	addi	a0,a0,-1954 # 84b0 <malloc+0x508>
     c5a:	00007097          	auipc	ra,0x7
     c5e:	15c080e7          	jalr	348(ra) # 7db6 <printf>
    exit(1);
     c62:	4505                	li	a0,1
     c64:	00007097          	auipc	ra,0x7
     c68:	c24080e7          	jalr	-988(ra) # 7888 <exit>
  }

  write(fd1, "abcdef", 6);
     c6c:	fec42783          	lw	a5,-20(s0)
     c70:	4619                	li	a2,6
     c72:	00008597          	auipc	a1,0x8
     c76:	86e58593          	addi	a1,a1,-1938 # 84e0 <malloc+0x538>
     c7a:	853e                	mv	a0,a5
     c7c:	00007097          	auipc	ra,0x7
     c80:	c2c080e7          	jalr	-980(ra) # 78a8 <write>

  n = read(fd3, buf, sizeof(buf));
     c84:	fc040713          	addi	a4,s0,-64
     c88:	fe042783          	lw	a5,-32(s0)
     c8c:	02000613          	li	a2,32
     c90:	85ba                	mv	a1,a4
     c92:	853e                	mv	a0,a5
     c94:	00007097          	auipc	ra,0x7
     c98:	c0c080e7          	jalr	-1012(ra) # 78a0 <read>
     c9c:	87aa                	mv	a5,a0
     c9e:	fef42223          	sw	a5,-28(s0)
  if(n != 6){
     ca2:	fe442783          	lw	a5,-28(s0)
     ca6:	0007871b          	sext.w	a4,a5
     caa:	4799                	li	a5,6
     cac:	02f70463          	beq	a4,a5,cd4 <truncate1+0x21e>
    printf("%s: read %d bytes, wanted 6\n", s, n);
     cb0:	fe442783          	lw	a5,-28(s0)
     cb4:	863e                	mv	a2,a5
     cb6:	fb843583          	ld	a1,-72(s0)
     cba:	00008517          	auipc	a0,0x8
     cbe:	82e50513          	addi	a0,a0,-2002 # 84e8 <malloc+0x540>
     cc2:	00007097          	auipc	ra,0x7
     cc6:	0f4080e7          	jalr	244(ra) # 7db6 <printf>
    exit(1);
     cca:	4505                	li	a0,1
     ccc:	00007097          	auipc	ra,0x7
     cd0:	bbc080e7          	jalr	-1092(ra) # 7888 <exit>
  }

  n = read(fd2, buf, sizeof(buf));
     cd4:	fc040713          	addi	a4,s0,-64
     cd8:	fe842783          	lw	a5,-24(s0)
     cdc:	02000613          	li	a2,32
     ce0:	85ba                	mv	a1,a4
     ce2:	853e                	mv	a0,a5
     ce4:	00007097          	auipc	ra,0x7
     ce8:	bbc080e7          	jalr	-1092(ra) # 78a0 <read>
     cec:	87aa                	mv	a5,a0
     cee:	fef42223          	sw	a5,-28(s0)
  if(n != 2){
     cf2:	fe442783          	lw	a5,-28(s0)
     cf6:	0007871b          	sext.w	a4,a5
     cfa:	4789                	li	a5,2
     cfc:	02f70463          	beq	a4,a5,d24 <truncate1+0x26e>
    printf("%s: read %d bytes, wanted 2\n", s, n);
     d00:	fe442783          	lw	a5,-28(s0)
     d04:	863e                	mv	a2,a5
     d06:	fb843583          	ld	a1,-72(s0)
     d0a:	00007517          	auipc	a0,0x7
     d0e:	7fe50513          	addi	a0,a0,2046 # 8508 <malloc+0x560>
     d12:	00007097          	auipc	ra,0x7
     d16:	0a4080e7          	jalr	164(ra) # 7db6 <printf>
    exit(1);
     d1a:	4505                	li	a0,1
     d1c:	00007097          	auipc	ra,0x7
     d20:	b6c080e7          	jalr	-1172(ra) # 7888 <exit>
  }

  unlink("truncfile");
     d24:	00007517          	auipc	a0,0x7
     d28:	74450513          	addi	a0,a0,1860 # 8468 <malloc+0x4c0>
     d2c:	00007097          	auipc	ra,0x7
     d30:	bac080e7          	jalr	-1108(ra) # 78d8 <unlink>

  close(fd1);
     d34:	fec42783          	lw	a5,-20(s0)
     d38:	853e                	mv	a0,a5
     d3a:	00007097          	auipc	ra,0x7
     d3e:	b76080e7          	jalr	-1162(ra) # 78b0 <close>
  close(fd2);
     d42:	fe842783          	lw	a5,-24(s0)
     d46:	853e                	mv	a0,a5
     d48:	00007097          	auipc	ra,0x7
     d4c:	b68080e7          	jalr	-1176(ra) # 78b0 <close>
  close(fd3);
     d50:	fe042783          	lw	a5,-32(s0)
     d54:	853e                	mv	a0,a5
     d56:	00007097          	auipc	ra,0x7
     d5a:	b5a080e7          	jalr	-1190(ra) # 78b0 <close>
}
     d5e:	0001                	nop
     d60:	60a6                	ld	ra,72(sp)
     d62:	6406                	ld	s0,64(sp)
     d64:	6161                	addi	sp,sp,80
     d66:	8082                	ret

0000000000000d68 <truncate2>:
// this causes a write at an offset beyond the end of the file.
// such writes fail on xv6 (unlike POSIX) but at least
// they don't crash.
void
truncate2(char *s)
{
     d68:	7179                	addi	sp,sp,-48
     d6a:	f406                	sd	ra,40(sp)
     d6c:	f022                	sd	s0,32(sp)
     d6e:	1800                	addi	s0,sp,48
     d70:	fca43c23          	sd	a0,-40(s0)
  unlink("truncfile");
     d74:	00007517          	auipc	a0,0x7
     d78:	6f450513          	addi	a0,a0,1780 # 8468 <malloc+0x4c0>
     d7c:	00007097          	auipc	ra,0x7
     d80:	b5c080e7          	jalr	-1188(ra) # 78d8 <unlink>

  int fd1 = open("truncfile", O_CREATE|O_TRUNC|O_WRONLY);
     d84:	60100593          	li	a1,1537
     d88:	00007517          	auipc	a0,0x7
     d8c:	6e050513          	addi	a0,a0,1760 # 8468 <malloc+0x4c0>
     d90:	00007097          	auipc	ra,0x7
     d94:	b38080e7          	jalr	-1224(ra) # 78c8 <open>
     d98:	87aa                	mv	a5,a0
     d9a:	fef42623          	sw	a5,-20(s0)
  write(fd1, "abcd", 4);
     d9e:	fec42783          	lw	a5,-20(s0)
     da2:	4611                	li	a2,4
     da4:	00007597          	auipc	a1,0x7
     da8:	6d458593          	addi	a1,a1,1748 # 8478 <malloc+0x4d0>
     dac:	853e                	mv	a0,a5
     dae:	00007097          	auipc	ra,0x7
     db2:	afa080e7          	jalr	-1286(ra) # 78a8 <write>

  int fd2 = open("truncfile", O_TRUNC|O_WRONLY);
     db6:	40100593          	li	a1,1025
     dba:	00007517          	auipc	a0,0x7
     dbe:	6ae50513          	addi	a0,a0,1710 # 8468 <malloc+0x4c0>
     dc2:	00007097          	auipc	ra,0x7
     dc6:	b06080e7          	jalr	-1274(ra) # 78c8 <open>
     dca:	87aa                	mv	a5,a0
     dcc:	fef42423          	sw	a5,-24(s0)

  int n = write(fd1, "x", 1);
     dd0:	fec42783          	lw	a5,-20(s0)
     dd4:	4605                	li	a2,1
     dd6:	00007597          	auipc	a1,0x7
     dda:	44a58593          	addi	a1,a1,1098 # 8220 <malloc+0x278>
     dde:	853e                	mv	a0,a5
     de0:	00007097          	auipc	ra,0x7
     de4:	ac8080e7          	jalr	-1336(ra) # 78a8 <write>
     de8:	87aa                	mv	a5,a0
     dea:	fef42223          	sw	a5,-28(s0)
  if(n != -1){
     dee:	fe442783          	lw	a5,-28(s0)
     df2:	0007871b          	sext.w	a4,a5
     df6:	57fd                	li	a5,-1
     df8:	02f70463          	beq	a4,a5,e20 <truncate2+0xb8>
    printf("%s: write returned %d, expected -1\n", s, n);
     dfc:	fe442783          	lw	a5,-28(s0)
     e00:	863e                	mv	a2,a5
     e02:	fd843583          	ld	a1,-40(s0)
     e06:	00007517          	auipc	a0,0x7
     e0a:	72250513          	addi	a0,a0,1826 # 8528 <malloc+0x580>
     e0e:	00007097          	auipc	ra,0x7
     e12:	fa8080e7          	jalr	-88(ra) # 7db6 <printf>
    exit(1);
     e16:	4505                	li	a0,1
     e18:	00007097          	auipc	ra,0x7
     e1c:	a70080e7          	jalr	-1424(ra) # 7888 <exit>
  }

  unlink("truncfile");
     e20:	00007517          	auipc	a0,0x7
     e24:	64850513          	addi	a0,a0,1608 # 8468 <malloc+0x4c0>
     e28:	00007097          	auipc	ra,0x7
     e2c:	ab0080e7          	jalr	-1360(ra) # 78d8 <unlink>
  close(fd1);
     e30:	fec42783          	lw	a5,-20(s0)
     e34:	853e                	mv	a0,a5
     e36:	00007097          	auipc	ra,0x7
     e3a:	a7a080e7          	jalr	-1414(ra) # 78b0 <close>
  close(fd2);
     e3e:	fe842783          	lw	a5,-24(s0)
     e42:	853e                	mv	a0,a5
     e44:	00007097          	auipc	ra,0x7
     e48:	a6c080e7          	jalr	-1428(ra) # 78b0 <close>
}
     e4c:	0001                	nop
     e4e:	70a2                	ld	ra,40(sp)
     e50:	7402                	ld	s0,32(sp)
     e52:	6145                	addi	sp,sp,48
     e54:	8082                	ret

0000000000000e56 <truncate3>:

void
truncate3(char *s)
{
     e56:	711d                	addi	sp,sp,-96
     e58:	ec86                	sd	ra,88(sp)
     e5a:	e8a2                	sd	s0,80(sp)
     e5c:	1080                	addi	s0,sp,96
     e5e:	faa43423          	sd	a0,-88(s0)
  int pid, xstatus;

  close(open("truncfile", O_CREATE|O_TRUNC|O_WRONLY));
     e62:	60100593          	li	a1,1537
     e66:	00007517          	auipc	a0,0x7
     e6a:	60250513          	addi	a0,a0,1538 # 8468 <malloc+0x4c0>
     e6e:	00007097          	auipc	ra,0x7
     e72:	a5a080e7          	jalr	-1446(ra) # 78c8 <open>
     e76:	87aa                	mv	a5,a0
     e78:	853e                	mv	a0,a5
     e7a:	00007097          	auipc	ra,0x7
     e7e:	a36080e7          	jalr	-1482(ra) # 78b0 <close>

  pid = fork();
     e82:	00007097          	auipc	ra,0x7
     e86:	9fe080e7          	jalr	-1538(ra) # 7880 <fork>
     e8a:	87aa                	mv	a5,a0
     e8c:	fef42223          	sw	a5,-28(s0)
  if(pid < 0){
     e90:	fe442783          	lw	a5,-28(s0)
     e94:	2781                	sext.w	a5,a5
     e96:	0207d163          	bgez	a5,eb8 <truncate3+0x62>
    printf("%s: fork failed\n", s);
     e9a:	fa843583          	ld	a1,-88(s0)
     e9e:	00007517          	auipc	a0,0x7
     ea2:	6b250513          	addi	a0,a0,1714 # 8550 <malloc+0x5a8>
     ea6:	00007097          	auipc	ra,0x7
     eaa:	f10080e7          	jalr	-240(ra) # 7db6 <printf>
    exit(1);
     eae:	4505                	li	a0,1
     eb0:	00007097          	auipc	ra,0x7
     eb4:	9d8080e7          	jalr	-1576(ra) # 7888 <exit>
  }

  if(pid == 0){
     eb8:	fe442783          	lw	a5,-28(s0)
     ebc:	2781                	sext.w	a5,a5
     ebe:	10079563          	bnez	a5,fc8 <truncate3+0x172>
    for(int i = 0; i < 100; i++){
     ec2:	fe042623          	sw	zero,-20(s0)
     ec6:	a0e5                	j	fae <truncate3+0x158>
      char buf[32];
      int fd = open("truncfile", O_WRONLY);
     ec8:	4585                	li	a1,1
     eca:	00007517          	auipc	a0,0x7
     ece:	59e50513          	addi	a0,a0,1438 # 8468 <malloc+0x4c0>
     ed2:	00007097          	auipc	ra,0x7
     ed6:	9f6080e7          	jalr	-1546(ra) # 78c8 <open>
     eda:	87aa                	mv	a5,a0
     edc:	fcf42c23          	sw	a5,-40(s0)
      if(fd < 0){
     ee0:	fd842783          	lw	a5,-40(s0)
     ee4:	2781                	sext.w	a5,a5
     ee6:	0207d163          	bgez	a5,f08 <truncate3+0xb2>
        printf("%s: open failed\n", s);
     eea:	fa843583          	ld	a1,-88(s0)
     eee:	00007517          	auipc	a0,0x7
     ef2:	67a50513          	addi	a0,a0,1658 # 8568 <malloc+0x5c0>
     ef6:	00007097          	auipc	ra,0x7
     efa:	ec0080e7          	jalr	-320(ra) # 7db6 <printf>
        exit(1);
     efe:	4505                	li	a0,1
     f00:	00007097          	auipc	ra,0x7
     f04:	988080e7          	jalr	-1656(ra) # 7888 <exit>
      }
      int n = write(fd, "1234567890", 10);
     f08:	fd842783          	lw	a5,-40(s0)
     f0c:	4629                	li	a2,10
     f0e:	00007597          	auipc	a1,0x7
     f12:	67258593          	addi	a1,a1,1650 # 8580 <malloc+0x5d8>
     f16:	853e                	mv	a0,a5
     f18:	00007097          	auipc	ra,0x7
     f1c:	990080e7          	jalr	-1648(ra) # 78a8 <write>
     f20:	87aa                	mv	a5,a0
     f22:	fcf42a23          	sw	a5,-44(s0)
      if(n != 10){
     f26:	fd442783          	lw	a5,-44(s0)
     f2a:	0007871b          	sext.w	a4,a5
     f2e:	47a9                	li	a5,10
     f30:	02f70463          	beq	a4,a5,f58 <truncate3+0x102>
        printf("%s: write got %d, expected 10\n", s, n);
     f34:	fd442783          	lw	a5,-44(s0)
     f38:	863e                	mv	a2,a5
     f3a:	fa843583          	ld	a1,-88(s0)
     f3e:	00007517          	auipc	a0,0x7
     f42:	65250513          	addi	a0,a0,1618 # 8590 <malloc+0x5e8>
     f46:	00007097          	auipc	ra,0x7
     f4a:	e70080e7          	jalr	-400(ra) # 7db6 <printf>
        exit(1);
     f4e:	4505                	li	a0,1
     f50:	00007097          	auipc	ra,0x7
     f54:	938080e7          	jalr	-1736(ra) # 7888 <exit>
      }
      close(fd);
     f58:	fd842783          	lw	a5,-40(s0)
     f5c:	853e                	mv	a0,a5
     f5e:	00007097          	auipc	ra,0x7
     f62:	952080e7          	jalr	-1710(ra) # 78b0 <close>
      fd = open("truncfile", O_RDONLY);
     f66:	4581                	li	a1,0
     f68:	00007517          	auipc	a0,0x7
     f6c:	50050513          	addi	a0,a0,1280 # 8468 <malloc+0x4c0>
     f70:	00007097          	auipc	ra,0x7
     f74:	958080e7          	jalr	-1704(ra) # 78c8 <open>
     f78:	87aa                	mv	a5,a0
     f7a:	fcf42c23          	sw	a5,-40(s0)
      read(fd, buf, sizeof(buf));
     f7e:	fb040713          	addi	a4,s0,-80
     f82:	fd842783          	lw	a5,-40(s0)
     f86:	02000613          	li	a2,32
     f8a:	85ba                	mv	a1,a4
     f8c:	853e                	mv	a0,a5
     f8e:	00007097          	auipc	ra,0x7
     f92:	912080e7          	jalr	-1774(ra) # 78a0 <read>
      close(fd);
     f96:	fd842783          	lw	a5,-40(s0)
     f9a:	853e                	mv	a0,a5
     f9c:	00007097          	auipc	ra,0x7
     fa0:	914080e7          	jalr	-1772(ra) # 78b0 <close>
    for(int i = 0; i < 100; i++){
     fa4:	fec42783          	lw	a5,-20(s0)
     fa8:	2785                	addiw	a5,a5,1
     faa:	fef42623          	sw	a5,-20(s0)
     fae:	fec42783          	lw	a5,-20(s0)
     fb2:	0007871b          	sext.w	a4,a5
     fb6:	06300793          	li	a5,99
     fba:	f0e7d7e3          	bge	a5,a4,ec8 <truncate3+0x72>
    }
    exit(0);
     fbe:	4501                	li	a0,0
     fc0:	00007097          	auipc	ra,0x7
     fc4:	8c8080e7          	jalr	-1848(ra) # 7888 <exit>
  }

  for(int i = 0; i < 150; i++){
     fc8:	fe042423          	sw	zero,-24(s0)
     fcc:	a075                	j	1078 <truncate3+0x222>
    int fd = open("truncfile", O_CREATE|O_WRONLY|O_TRUNC);
     fce:	60100593          	li	a1,1537
     fd2:	00007517          	auipc	a0,0x7
     fd6:	49650513          	addi	a0,a0,1174 # 8468 <malloc+0x4c0>
     fda:	00007097          	auipc	ra,0x7
     fde:	8ee080e7          	jalr	-1810(ra) # 78c8 <open>
     fe2:	87aa                	mv	a5,a0
     fe4:	fef42023          	sw	a5,-32(s0)
    if(fd < 0){
     fe8:	fe042783          	lw	a5,-32(s0)
     fec:	2781                	sext.w	a5,a5
     fee:	0207d163          	bgez	a5,1010 <truncate3+0x1ba>
      printf("%s: open failed\n", s);
     ff2:	fa843583          	ld	a1,-88(s0)
     ff6:	00007517          	auipc	a0,0x7
     ffa:	57250513          	addi	a0,a0,1394 # 8568 <malloc+0x5c0>
     ffe:	00007097          	auipc	ra,0x7
    1002:	db8080e7          	jalr	-584(ra) # 7db6 <printf>
      exit(1);
    1006:	4505                	li	a0,1
    1008:	00007097          	auipc	ra,0x7
    100c:	880080e7          	jalr	-1920(ra) # 7888 <exit>
    }
    int n = write(fd, "xxx", 3);
    1010:	fe042783          	lw	a5,-32(s0)
    1014:	460d                	li	a2,3
    1016:	00007597          	auipc	a1,0x7
    101a:	59a58593          	addi	a1,a1,1434 # 85b0 <malloc+0x608>
    101e:	853e                	mv	a0,a5
    1020:	00007097          	auipc	ra,0x7
    1024:	888080e7          	jalr	-1912(ra) # 78a8 <write>
    1028:	87aa                	mv	a5,a0
    102a:	fcf42e23          	sw	a5,-36(s0)
    if(n != 3){
    102e:	fdc42783          	lw	a5,-36(s0)
    1032:	0007871b          	sext.w	a4,a5
    1036:	478d                	li	a5,3
    1038:	02f70463          	beq	a4,a5,1060 <truncate3+0x20a>
      printf("%s: write got %d, expected 3\n", s, n);
    103c:	fdc42783          	lw	a5,-36(s0)
    1040:	863e                	mv	a2,a5
    1042:	fa843583          	ld	a1,-88(s0)
    1046:	00007517          	auipc	a0,0x7
    104a:	57250513          	addi	a0,a0,1394 # 85b8 <malloc+0x610>
    104e:	00007097          	auipc	ra,0x7
    1052:	d68080e7          	jalr	-664(ra) # 7db6 <printf>
      exit(1);
    1056:	4505                	li	a0,1
    1058:	00007097          	auipc	ra,0x7
    105c:	830080e7          	jalr	-2000(ra) # 7888 <exit>
    }
    close(fd);
    1060:	fe042783          	lw	a5,-32(s0)
    1064:	853e                	mv	a0,a5
    1066:	00007097          	auipc	ra,0x7
    106a:	84a080e7          	jalr	-1974(ra) # 78b0 <close>
  for(int i = 0; i < 150; i++){
    106e:	fe842783          	lw	a5,-24(s0)
    1072:	2785                	addiw	a5,a5,1
    1074:	fef42423          	sw	a5,-24(s0)
    1078:	fe842783          	lw	a5,-24(s0)
    107c:	0007871b          	sext.w	a4,a5
    1080:	09500793          	li	a5,149
    1084:	f4e7d5e3          	bge	a5,a4,fce <truncate3+0x178>
  }

  wait(&xstatus);
    1088:	fd040793          	addi	a5,s0,-48
    108c:	853e                	mv	a0,a5
    108e:	00007097          	auipc	ra,0x7
    1092:	802080e7          	jalr	-2046(ra) # 7890 <wait>
  unlink("truncfile");
    1096:	00007517          	auipc	a0,0x7
    109a:	3d250513          	addi	a0,a0,978 # 8468 <malloc+0x4c0>
    109e:	00007097          	auipc	ra,0x7
    10a2:	83a080e7          	jalr	-1990(ra) # 78d8 <unlink>
  exit(xstatus);
    10a6:	fd042783          	lw	a5,-48(s0)
    10aa:	853e                	mv	a0,a5
    10ac:	00006097          	auipc	ra,0x6
    10b0:	7dc080e7          	jalr	2012(ra) # 7888 <exit>

00000000000010b4 <iputtest>:


// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(char *s)
{
    10b4:	1101                	addi	sp,sp,-32
    10b6:	ec06                	sd	ra,24(sp)
    10b8:	e822                	sd	s0,16(sp)
    10ba:	1000                	addi	s0,sp,32
    10bc:	fea43423          	sd	a0,-24(s0)
  if(mkdir("iputdir") < 0){
    10c0:	00007517          	auipc	a0,0x7
    10c4:	51850513          	addi	a0,a0,1304 # 85d8 <malloc+0x630>
    10c8:	00007097          	auipc	ra,0x7
    10cc:	828080e7          	jalr	-2008(ra) # 78f0 <mkdir>
    10d0:	87aa                	mv	a5,a0
    10d2:	0207d163          	bgez	a5,10f4 <iputtest+0x40>
    printf("%s: mkdir failed\n", s);
    10d6:	fe843583          	ld	a1,-24(s0)
    10da:	00007517          	auipc	a0,0x7
    10de:	50650513          	addi	a0,a0,1286 # 85e0 <malloc+0x638>
    10e2:	00007097          	auipc	ra,0x7
    10e6:	cd4080e7          	jalr	-812(ra) # 7db6 <printf>
    exit(1);
    10ea:	4505                	li	a0,1
    10ec:	00006097          	auipc	ra,0x6
    10f0:	79c080e7          	jalr	1948(ra) # 7888 <exit>
  }
  if(chdir("iputdir") < 0){
    10f4:	00007517          	auipc	a0,0x7
    10f8:	4e450513          	addi	a0,a0,1252 # 85d8 <malloc+0x630>
    10fc:	00006097          	auipc	ra,0x6
    1100:	7fc080e7          	jalr	2044(ra) # 78f8 <chdir>
    1104:	87aa                	mv	a5,a0
    1106:	0207d163          	bgez	a5,1128 <iputtest+0x74>
    printf("%s: chdir iputdir failed\n", s);
    110a:	fe843583          	ld	a1,-24(s0)
    110e:	00007517          	auipc	a0,0x7
    1112:	4ea50513          	addi	a0,a0,1258 # 85f8 <malloc+0x650>
    1116:	00007097          	auipc	ra,0x7
    111a:	ca0080e7          	jalr	-864(ra) # 7db6 <printf>
    exit(1);
    111e:	4505                	li	a0,1
    1120:	00006097          	auipc	ra,0x6
    1124:	768080e7          	jalr	1896(ra) # 7888 <exit>
  }
  if(unlink("../iputdir") < 0){
    1128:	00007517          	auipc	a0,0x7
    112c:	4f050513          	addi	a0,a0,1264 # 8618 <malloc+0x670>
    1130:	00006097          	auipc	ra,0x6
    1134:	7a8080e7          	jalr	1960(ra) # 78d8 <unlink>
    1138:	87aa                	mv	a5,a0
    113a:	0207d163          	bgez	a5,115c <iputtest+0xa8>
    printf("%s: unlink ../iputdir failed\n", s);
    113e:	fe843583          	ld	a1,-24(s0)
    1142:	00007517          	auipc	a0,0x7
    1146:	4e650513          	addi	a0,a0,1254 # 8628 <malloc+0x680>
    114a:	00007097          	auipc	ra,0x7
    114e:	c6c080e7          	jalr	-916(ra) # 7db6 <printf>
    exit(1);
    1152:	4505                	li	a0,1
    1154:	00006097          	auipc	ra,0x6
    1158:	734080e7          	jalr	1844(ra) # 7888 <exit>
  }
  if(chdir("/") < 0){
    115c:	00007517          	auipc	a0,0x7
    1160:	4ec50513          	addi	a0,a0,1260 # 8648 <malloc+0x6a0>
    1164:	00006097          	auipc	ra,0x6
    1168:	794080e7          	jalr	1940(ra) # 78f8 <chdir>
    116c:	87aa                	mv	a5,a0
    116e:	0207d163          	bgez	a5,1190 <iputtest+0xdc>
    printf("%s: chdir / failed\n", s);
    1172:	fe843583          	ld	a1,-24(s0)
    1176:	00007517          	auipc	a0,0x7
    117a:	4da50513          	addi	a0,a0,1242 # 8650 <malloc+0x6a8>
    117e:	00007097          	auipc	ra,0x7
    1182:	c38080e7          	jalr	-968(ra) # 7db6 <printf>
    exit(1);
    1186:	4505                	li	a0,1
    1188:	00006097          	auipc	ra,0x6
    118c:	700080e7          	jalr	1792(ra) # 7888 <exit>
  }
}
    1190:	0001                	nop
    1192:	60e2                	ld	ra,24(sp)
    1194:	6442                	ld	s0,16(sp)
    1196:	6105                	addi	sp,sp,32
    1198:	8082                	ret

000000000000119a <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(char *s)
{
    119a:	7179                	addi	sp,sp,-48
    119c:	f406                	sd	ra,40(sp)
    119e:	f022                	sd	s0,32(sp)
    11a0:	1800                	addi	s0,sp,48
    11a2:	fca43c23          	sd	a0,-40(s0)
  int pid, xstatus;

  pid = fork();
    11a6:	00006097          	auipc	ra,0x6
    11aa:	6da080e7          	jalr	1754(ra) # 7880 <fork>
    11ae:	87aa                	mv	a5,a0
    11b0:	fef42623          	sw	a5,-20(s0)
  if(pid < 0){
    11b4:	fec42783          	lw	a5,-20(s0)
    11b8:	2781                	sext.w	a5,a5
    11ba:	0207d163          	bgez	a5,11dc <exitiputtest+0x42>
    printf("%s: fork failed\n", s);
    11be:	fd843583          	ld	a1,-40(s0)
    11c2:	00007517          	auipc	a0,0x7
    11c6:	38e50513          	addi	a0,a0,910 # 8550 <malloc+0x5a8>
    11ca:	00007097          	auipc	ra,0x7
    11ce:	bec080e7          	jalr	-1044(ra) # 7db6 <printf>
    exit(1);
    11d2:	4505                	li	a0,1
    11d4:	00006097          	auipc	ra,0x6
    11d8:	6b4080e7          	jalr	1716(ra) # 7888 <exit>
  }
  if(pid == 0){
    11dc:	fec42783          	lw	a5,-20(s0)
    11e0:	2781                	sext.w	a5,a5
    11e2:	e7c5                	bnez	a5,128a <exitiputtest+0xf0>
    if(mkdir("iputdir") < 0){
    11e4:	00007517          	auipc	a0,0x7
    11e8:	3f450513          	addi	a0,a0,1012 # 85d8 <malloc+0x630>
    11ec:	00006097          	auipc	ra,0x6
    11f0:	704080e7          	jalr	1796(ra) # 78f0 <mkdir>
    11f4:	87aa                	mv	a5,a0
    11f6:	0207d163          	bgez	a5,1218 <exitiputtest+0x7e>
      printf("%s: mkdir failed\n", s);
    11fa:	fd843583          	ld	a1,-40(s0)
    11fe:	00007517          	auipc	a0,0x7
    1202:	3e250513          	addi	a0,a0,994 # 85e0 <malloc+0x638>
    1206:	00007097          	auipc	ra,0x7
    120a:	bb0080e7          	jalr	-1104(ra) # 7db6 <printf>
      exit(1);
    120e:	4505                	li	a0,1
    1210:	00006097          	auipc	ra,0x6
    1214:	678080e7          	jalr	1656(ra) # 7888 <exit>
    }
    if(chdir("iputdir") < 0){
    1218:	00007517          	auipc	a0,0x7
    121c:	3c050513          	addi	a0,a0,960 # 85d8 <malloc+0x630>
    1220:	00006097          	auipc	ra,0x6
    1224:	6d8080e7          	jalr	1752(ra) # 78f8 <chdir>
    1228:	87aa                	mv	a5,a0
    122a:	0207d163          	bgez	a5,124c <exitiputtest+0xb2>
      printf("%s: child chdir failed\n", s);
    122e:	fd843583          	ld	a1,-40(s0)
    1232:	00007517          	auipc	a0,0x7
    1236:	43650513          	addi	a0,a0,1078 # 8668 <malloc+0x6c0>
    123a:	00007097          	auipc	ra,0x7
    123e:	b7c080e7          	jalr	-1156(ra) # 7db6 <printf>
      exit(1);
    1242:	4505                	li	a0,1
    1244:	00006097          	auipc	ra,0x6
    1248:	644080e7          	jalr	1604(ra) # 7888 <exit>
    }
    if(unlink("../iputdir") < 0){
    124c:	00007517          	auipc	a0,0x7
    1250:	3cc50513          	addi	a0,a0,972 # 8618 <malloc+0x670>
    1254:	00006097          	auipc	ra,0x6
    1258:	684080e7          	jalr	1668(ra) # 78d8 <unlink>
    125c:	87aa                	mv	a5,a0
    125e:	0207d163          	bgez	a5,1280 <exitiputtest+0xe6>
      printf("%s: unlink ../iputdir failed\n", s);
    1262:	fd843583          	ld	a1,-40(s0)
    1266:	00007517          	auipc	a0,0x7
    126a:	3c250513          	addi	a0,a0,962 # 8628 <malloc+0x680>
    126e:	00007097          	auipc	ra,0x7
    1272:	b48080e7          	jalr	-1208(ra) # 7db6 <printf>
      exit(1);
    1276:	4505                	li	a0,1
    1278:	00006097          	auipc	ra,0x6
    127c:	610080e7          	jalr	1552(ra) # 7888 <exit>
    }
    exit(0);
    1280:	4501                	li	a0,0
    1282:	00006097          	auipc	ra,0x6
    1286:	606080e7          	jalr	1542(ra) # 7888 <exit>
  }
  wait(&xstatus);
    128a:	fe840793          	addi	a5,s0,-24
    128e:	853e                	mv	a0,a5
    1290:	00006097          	auipc	ra,0x6
    1294:	600080e7          	jalr	1536(ra) # 7890 <wait>
  exit(xstatus);
    1298:	fe842783          	lw	a5,-24(s0)
    129c:	853e                	mv	a0,a5
    129e:	00006097          	auipc	ra,0x6
    12a2:	5ea080e7          	jalr	1514(ra) # 7888 <exit>

00000000000012a6 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(char *s)
{
    12a6:	7179                	addi	sp,sp,-48
    12a8:	f406                	sd	ra,40(sp)
    12aa:	f022                	sd	s0,32(sp)
    12ac:	1800                	addi	s0,sp,48
    12ae:	fca43c23          	sd	a0,-40(s0)
  int pid, xstatus;

  if(mkdir("oidir") < 0){
    12b2:	00007517          	auipc	a0,0x7
    12b6:	3ce50513          	addi	a0,a0,974 # 8680 <malloc+0x6d8>
    12ba:	00006097          	auipc	ra,0x6
    12be:	636080e7          	jalr	1590(ra) # 78f0 <mkdir>
    12c2:	87aa                	mv	a5,a0
    12c4:	0207d163          	bgez	a5,12e6 <openiputtest+0x40>
    printf("%s: mkdir oidir failed\n", s);
    12c8:	fd843583          	ld	a1,-40(s0)
    12cc:	00007517          	auipc	a0,0x7
    12d0:	3bc50513          	addi	a0,a0,956 # 8688 <malloc+0x6e0>
    12d4:	00007097          	auipc	ra,0x7
    12d8:	ae2080e7          	jalr	-1310(ra) # 7db6 <printf>
    exit(1);
    12dc:	4505                	li	a0,1
    12de:	00006097          	auipc	ra,0x6
    12e2:	5aa080e7          	jalr	1450(ra) # 7888 <exit>
  }
  pid = fork();
    12e6:	00006097          	auipc	ra,0x6
    12ea:	59a080e7          	jalr	1434(ra) # 7880 <fork>
    12ee:	87aa                	mv	a5,a0
    12f0:	fef42623          	sw	a5,-20(s0)
  if(pid < 0){
    12f4:	fec42783          	lw	a5,-20(s0)
    12f8:	2781                	sext.w	a5,a5
    12fa:	0207d163          	bgez	a5,131c <openiputtest+0x76>
    printf("%s: fork failed\n", s);
    12fe:	fd843583          	ld	a1,-40(s0)
    1302:	00007517          	auipc	a0,0x7
    1306:	24e50513          	addi	a0,a0,590 # 8550 <malloc+0x5a8>
    130a:	00007097          	auipc	ra,0x7
    130e:	aac080e7          	jalr	-1364(ra) # 7db6 <printf>
    exit(1);
    1312:	4505                	li	a0,1
    1314:	00006097          	auipc	ra,0x6
    1318:	574080e7          	jalr	1396(ra) # 7888 <exit>
  }
  if(pid == 0){
    131c:	fec42783          	lw	a5,-20(s0)
    1320:	2781                	sext.w	a5,a5
    1322:	e7b1                	bnez	a5,136e <openiputtest+0xc8>
    int fd = open("oidir", O_RDWR);
    1324:	4589                	li	a1,2
    1326:	00007517          	auipc	a0,0x7
    132a:	35a50513          	addi	a0,a0,858 # 8680 <malloc+0x6d8>
    132e:	00006097          	auipc	ra,0x6
    1332:	59a080e7          	jalr	1434(ra) # 78c8 <open>
    1336:	87aa                	mv	a5,a0
    1338:	fef42423          	sw	a5,-24(s0)
    if(fd >= 0){
    133c:	fe842783          	lw	a5,-24(s0)
    1340:	2781                	sext.w	a5,a5
    1342:	0207c163          	bltz	a5,1364 <openiputtest+0xbe>
      printf("%s: open directory for write succeeded\n", s);
    1346:	fd843583          	ld	a1,-40(s0)
    134a:	00007517          	auipc	a0,0x7
    134e:	35650513          	addi	a0,a0,854 # 86a0 <malloc+0x6f8>
    1352:	00007097          	auipc	ra,0x7
    1356:	a64080e7          	jalr	-1436(ra) # 7db6 <printf>
      exit(1);
    135a:	4505                	li	a0,1
    135c:	00006097          	auipc	ra,0x6
    1360:	52c080e7          	jalr	1324(ra) # 7888 <exit>
    }
    exit(0);
    1364:	4501                	li	a0,0
    1366:	00006097          	auipc	ra,0x6
    136a:	522080e7          	jalr	1314(ra) # 7888 <exit>
  }
  sleep(1);
    136e:	4505                	li	a0,1
    1370:	00006097          	auipc	ra,0x6
    1374:	5a8080e7          	jalr	1448(ra) # 7918 <sleep>
  if(unlink("oidir") != 0){
    1378:	00007517          	auipc	a0,0x7
    137c:	30850513          	addi	a0,a0,776 # 8680 <malloc+0x6d8>
    1380:	00006097          	auipc	ra,0x6
    1384:	558080e7          	jalr	1368(ra) # 78d8 <unlink>
    1388:	87aa                	mv	a5,a0
    138a:	c385                	beqz	a5,13aa <openiputtest+0x104>
    printf("%s: unlink failed\n", s);
    138c:	fd843583          	ld	a1,-40(s0)
    1390:	00007517          	auipc	a0,0x7
    1394:	33850513          	addi	a0,a0,824 # 86c8 <malloc+0x720>
    1398:	00007097          	auipc	ra,0x7
    139c:	a1e080e7          	jalr	-1506(ra) # 7db6 <printf>
    exit(1);
    13a0:	4505                	li	a0,1
    13a2:	00006097          	auipc	ra,0x6
    13a6:	4e6080e7          	jalr	1254(ra) # 7888 <exit>
  }
  wait(&xstatus);
    13aa:	fe440793          	addi	a5,s0,-28
    13ae:	853e                	mv	a0,a5
    13b0:	00006097          	auipc	ra,0x6
    13b4:	4e0080e7          	jalr	1248(ra) # 7890 <wait>
  exit(xstatus);
    13b8:	fe442783          	lw	a5,-28(s0)
    13bc:	853e                	mv	a0,a5
    13be:	00006097          	auipc	ra,0x6
    13c2:	4ca080e7          	jalr	1226(ra) # 7888 <exit>

00000000000013c6 <opentest>:

// simple file system tests

void
opentest(char *s)
{
    13c6:	7179                	addi	sp,sp,-48
    13c8:	f406                	sd	ra,40(sp)
    13ca:	f022                	sd	s0,32(sp)
    13cc:	1800                	addi	s0,sp,48
    13ce:	fca43c23          	sd	a0,-40(s0)
  int fd;

  fd = open("echo", 0);
    13d2:	4581                	li	a1,0
    13d4:	00007517          	auipc	a0,0x7
    13d8:	f5c50513          	addi	a0,a0,-164 # 8330 <malloc+0x388>
    13dc:	00006097          	auipc	ra,0x6
    13e0:	4ec080e7          	jalr	1260(ra) # 78c8 <open>
    13e4:	87aa                	mv	a5,a0
    13e6:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    13ea:	fec42783          	lw	a5,-20(s0)
    13ee:	2781                	sext.w	a5,a5
    13f0:	0207d163          	bgez	a5,1412 <opentest+0x4c>
    printf("%s: open echo failed!\n", s);
    13f4:	fd843583          	ld	a1,-40(s0)
    13f8:	00007517          	auipc	a0,0x7
    13fc:	2e850513          	addi	a0,a0,744 # 86e0 <malloc+0x738>
    1400:	00007097          	auipc	ra,0x7
    1404:	9b6080e7          	jalr	-1610(ra) # 7db6 <printf>
    exit(1);
    1408:	4505                	li	a0,1
    140a:	00006097          	auipc	ra,0x6
    140e:	47e080e7          	jalr	1150(ra) # 7888 <exit>
  }
  close(fd);
    1412:	fec42783          	lw	a5,-20(s0)
    1416:	853e                	mv	a0,a5
    1418:	00006097          	auipc	ra,0x6
    141c:	498080e7          	jalr	1176(ra) # 78b0 <close>
  fd = open("doesnotexist", 0);
    1420:	4581                	li	a1,0
    1422:	00007517          	auipc	a0,0x7
    1426:	2d650513          	addi	a0,a0,726 # 86f8 <malloc+0x750>
    142a:	00006097          	auipc	ra,0x6
    142e:	49e080e7          	jalr	1182(ra) # 78c8 <open>
    1432:	87aa                	mv	a5,a0
    1434:	fef42623          	sw	a5,-20(s0)
  if(fd >= 0){
    1438:	fec42783          	lw	a5,-20(s0)
    143c:	2781                	sext.w	a5,a5
    143e:	0207c163          	bltz	a5,1460 <opentest+0x9a>
    printf("%s: open doesnotexist succeeded!\n", s);
    1442:	fd843583          	ld	a1,-40(s0)
    1446:	00007517          	auipc	a0,0x7
    144a:	2c250513          	addi	a0,a0,706 # 8708 <malloc+0x760>
    144e:	00007097          	auipc	ra,0x7
    1452:	968080e7          	jalr	-1688(ra) # 7db6 <printf>
    exit(1);
    1456:	4505                	li	a0,1
    1458:	00006097          	auipc	ra,0x6
    145c:	430080e7          	jalr	1072(ra) # 7888 <exit>
  }
}
    1460:	0001                	nop
    1462:	70a2                	ld	ra,40(sp)
    1464:	7402                	ld	s0,32(sp)
    1466:	6145                	addi	sp,sp,48
    1468:	8082                	ret

000000000000146a <writetest>:

void
writetest(char *s)
{
    146a:	7179                	addi	sp,sp,-48
    146c:	f406                	sd	ra,40(sp)
    146e:	f022                	sd	s0,32(sp)
    1470:	1800                	addi	s0,sp,48
    1472:	fca43c23          	sd	a0,-40(s0)
  int fd;
  int i;
  enum { N=100, SZ=10 };

  fd = open("small", O_CREATE|O_RDWR);
    1476:	20200593          	li	a1,514
    147a:	00007517          	auipc	a0,0x7
    147e:	2b650513          	addi	a0,a0,694 # 8730 <malloc+0x788>
    1482:	00006097          	auipc	ra,0x6
    1486:	446080e7          	jalr	1094(ra) # 78c8 <open>
    148a:	87aa                	mv	a5,a0
    148c:	fef42423          	sw	a5,-24(s0)
  if(fd < 0){
    1490:	fe842783          	lw	a5,-24(s0)
    1494:	2781                	sext.w	a5,a5
    1496:	0207d163          	bgez	a5,14b8 <writetest+0x4e>
    printf("%s: error: creat small failed!\n", s);
    149a:	fd843583          	ld	a1,-40(s0)
    149e:	00007517          	auipc	a0,0x7
    14a2:	29a50513          	addi	a0,a0,666 # 8738 <malloc+0x790>
    14a6:	00007097          	auipc	ra,0x7
    14aa:	910080e7          	jalr	-1776(ra) # 7db6 <printf>
    exit(1);
    14ae:	4505                	li	a0,1
    14b0:	00006097          	auipc	ra,0x6
    14b4:	3d8080e7          	jalr	984(ra) # 7888 <exit>
  }
  for(i = 0; i < N; i++){
    14b8:	fe042623          	sw	zero,-20(s0)
    14bc:	a861                	j	1554 <writetest+0xea>
    if(write(fd, "aaaaaaaaaa", SZ) != SZ){
    14be:	fe842783          	lw	a5,-24(s0)
    14c2:	4629                	li	a2,10
    14c4:	00007597          	auipc	a1,0x7
    14c8:	29458593          	addi	a1,a1,660 # 8758 <malloc+0x7b0>
    14cc:	853e                	mv	a0,a5
    14ce:	00006097          	auipc	ra,0x6
    14d2:	3da080e7          	jalr	986(ra) # 78a8 <write>
    14d6:	87aa                	mv	a5,a0
    14d8:	873e                	mv	a4,a5
    14da:	47a9                	li	a5,10
    14dc:	02f70463          	beq	a4,a5,1504 <writetest+0x9a>
      printf("%s: error: write aa %d new file failed\n", s, i);
    14e0:	fec42783          	lw	a5,-20(s0)
    14e4:	863e                	mv	a2,a5
    14e6:	fd843583          	ld	a1,-40(s0)
    14ea:	00007517          	auipc	a0,0x7
    14ee:	27e50513          	addi	a0,a0,638 # 8768 <malloc+0x7c0>
    14f2:	00007097          	auipc	ra,0x7
    14f6:	8c4080e7          	jalr	-1852(ra) # 7db6 <printf>
      exit(1);
    14fa:	4505                	li	a0,1
    14fc:	00006097          	auipc	ra,0x6
    1500:	38c080e7          	jalr	908(ra) # 7888 <exit>
    }
    if(write(fd, "bbbbbbbbbb", SZ) != SZ){
    1504:	fe842783          	lw	a5,-24(s0)
    1508:	4629                	li	a2,10
    150a:	00007597          	auipc	a1,0x7
    150e:	28658593          	addi	a1,a1,646 # 8790 <malloc+0x7e8>
    1512:	853e                	mv	a0,a5
    1514:	00006097          	auipc	ra,0x6
    1518:	394080e7          	jalr	916(ra) # 78a8 <write>
    151c:	87aa                	mv	a5,a0
    151e:	873e                	mv	a4,a5
    1520:	47a9                	li	a5,10
    1522:	02f70463          	beq	a4,a5,154a <writetest+0xe0>
      printf("%s: error: write bb %d new file failed\n", s, i);
    1526:	fec42783          	lw	a5,-20(s0)
    152a:	863e                	mv	a2,a5
    152c:	fd843583          	ld	a1,-40(s0)
    1530:	00007517          	auipc	a0,0x7
    1534:	27050513          	addi	a0,a0,624 # 87a0 <malloc+0x7f8>
    1538:	00007097          	auipc	ra,0x7
    153c:	87e080e7          	jalr	-1922(ra) # 7db6 <printf>
      exit(1);
    1540:	4505                	li	a0,1
    1542:	00006097          	auipc	ra,0x6
    1546:	346080e7          	jalr	838(ra) # 7888 <exit>
  for(i = 0; i < N; i++){
    154a:	fec42783          	lw	a5,-20(s0)
    154e:	2785                	addiw	a5,a5,1
    1550:	fef42623          	sw	a5,-20(s0)
    1554:	fec42783          	lw	a5,-20(s0)
    1558:	0007871b          	sext.w	a4,a5
    155c:	06300793          	li	a5,99
    1560:	f4e7dfe3          	bge	a5,a4,14be <writetest+0x54>
    }
  }
  close(fd);
    1564:	fe842783          	lw	a5,-24(s0)
    1568:	853e                	mv	a0,a5
    156a:	00006097          	auipc	ra,0x6
    156e:	346080e7          	jalr	838(ra) # 78b0 <close>
  fd = open("small", O_RDONLY);
    1572:	4581                	li	a1,0
    1574:	00007517          	auipc	a0,0x7
    1578:	1bc50513          	addi	a0,a0,444 # 8730 <malloc+0x788>
    157c:	00006097          	auipc	ra,0x6
    1580:	34c080e7          	jalr	844(ra) # 78c8 <open>
    1584:	87aa                	mv	a5,a0
    1586:	fef42423          	sw	a5,-24(s0)
  if(fd < 0){
    158a:	fe842783          	lw	a5,-24(s0)
    158e:	2781                	sext.w	a5,a5
    1590:	0207d163          	bgez	a5,15b2 <writetest+0x148>
    printf("%s: error: open small failed!\n", s);
    1594:	fd843583          	ld	a1,-40(s0)
    1598:	00007517          	auipc	a0,0x7
    159c:	23050513          	addi	a0,a0,560 # 87c8 <malloc+0x820>
    15a0:	00007097          	auipc	ra,0x7
    15a4:	816080e7          	jalr	-2026(ra) # 7db6 <printf>
    exit(1);
    15a8:	4505                	li	a0,1
    15aa:	00006097          	auipc	ra,0x6
    15ae:	2de080e7          	jalr	734(ra) # 7888 <exit>
  }
  i = read(fd, buf, N*SZ*2);
    15b2:	fe842783          	lw	a5,-24(s0)
    15b6:	7d000613          	li	a2,2000
    15ba:	0000a597          	auipc	a1,0xa
    15be:	e9658593          	addi	a1,a1,-362 # b450 <buf>
    15c2:	853e                	mv	a0,a5
    15c4:	00006097          	auipc	ra,0x6
    15c8:	2dc080e7          	jalr	732(ra) # 78a0 <read>
    15cc:	87aa                	mv	a5,a0
    15ce:	fef42623          	sw	a5,-20(s0)
  if(i != N*SZ*2){
    15d2:	fec42783          	lw	a5,-20(s0)
    15d6:	0007871b          	sext.w	a4,a5
    15da:	7d000793          	li	a5,2000
    15de:	02f70163          	beq	a4,a5,1600 <writetest+0x196>
    printf("%s: read failed\n", s);
    15e2:	fd843583          	ld	a1,-40(s0)
    15e6:	00007517          	auipc	a0,0x7
    15ea:	20250513          	addi	a0,a0,514 # 87e8 <malloc+0x840>
    15ee:	00006097          	auipc	ra,0x6
    15f2:	7c8080e7          	jalr	1992(ra) # 7db6 <printf>
    exit(1);
    15f6:	4505                	li	a0,1
    15f8:	00006097          	auipc	ra,0x6
    15fc:	290080e7          	jalr	656(ra) # 7888 <exit>
  }
  close(fd);
    1600:	fe842783          	lw	a5,-24(s0)
    1604:	853e                	mv	a0,a5
    1606:	00006097          	auipc	ra,0x6
    160a:	2aa080e7          	jalr	682(ra) # 78b0 <close>

  if(unlink("small") < 0){
    160e:	00007517          	auipc	a0,0x7
    1612:	12250513          	addi	a0,a0,290 # 8730 <malloc+0x788>
    1616:	00006097          	auipc	ra,0x6
    161a:	2c2080e7          	jalr	706(ra) # 78d8 <unlink>
    161e:	87aa                	mv	a5,a0
    1620:	0207d163          	bgez	a5,1642 <writetest+0x1d8>
    printf("%s: unlink small failed\n", s);
    1624:	fd843583          	ld	a1,-40(s0)
    1628:	00007517          	auipc	a0,0x7
    162c:	1d850513          	addi	a0,a0,472 # 8800 <malloc+0x858>
    1630:	00006097          	auipc	ra,0x6
    1634:	786080e7          	jalr	1926(ra) # 7db6 <printf>
    exit(1);
    1638:	4505                	li	a0,1
    163a:	00006097          	auipc	ra,0x6
    163e:	24e080e7          	jalr	590(ra) # 7888 <exit>
  }
}
    1642:	0001                	nop
    1644:	70a2                	ld	ra,40(sp)
    1646:	7402                	ld	s0,32(sp)
    1648:	6145                	addi	sp,sp,48
    164a:	8082                	ret

000000000000164c <writebig>:

void
writebig(char *s)
{
    164c:	7179                	addi	sp,sp,-48
    164e:	f406                	sd	ra,40(sp)
    1650:	f022                	sd	s0,32(sp)
    1652:	1800                	addi	s0,sp,48
    1654:	fca43c23          	sd	a0,-40(s0)
  int i, fd, n;

  fd = open("big", O_CREATE|O_RDWR);
    1658:	20200593          	li	a1,514
    165c:	00007517          	auipc	a0,0x7
    1660:	1c450513          	addi	a0,a0,452 # 8820 <malloc+0x878>
    1664:	00006097          	auipc	ra,0x6
    1668:	264080e7          	jalr	612(ra) # 78c8 <open>
    166c:	87aa                	mv	a5,a0
    166e:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
    1672:	fe442783          	lw	a5,-28(s0)
    1676:	2781                	sext.w	a5,a5
    1678:	0207d163          	bgez	a5,169a <writebig+0x4e>
    printf("%s: error: creat big failed!\n", s);
    167c:	fd843583          	ld	a1,-40(s0)
    1680:	00007517          	auipc	a0,0x7
    1684:	1a850513          	addi	a0,a0,424 # 8828 <malloc+0x880>
    1688:	00006097          	auipc	ra,0x6
    168c:	72e080e7          	jalr	1838(ra) # 7db6 <printf>
    exit(1);
    1690:	4505                	li	a0,1
    1692:	00006097          	auipc	ra,0x6
    1696:	1f6080e7          	jalr	502(ra) # 7888 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
    169a:	fe042623          	sw	zero,-20(s0)
    169e:	a095                	j	1702 <writebig+0xb6>
    ((int*)buf)[0] = i;
    16a0:	0000a797          	auipc	a5,0xa
    16a4:	db078793          	addi	a5,a5,-592 # b450 <buf>
    16a8:	fec42703          	lw	a4,-20(s0)
    16ac:	c398                	sw	a4,0(a5)
    if(write(fd, buf, BSIZE) != BSIZE){
    16ae:	fe442783          	lw	a5,-28(s0)
    16b2:	40000613          	li	a2,1024
    16b6:	0000a597          	auipc	a1,0xa
    16ba:	d9a58593          	addi	a1,a1,-614 # b450 <buf>
    16be:	853e                	mv	a0,a5
    16c0:	00006097          	auipc	ra,0x6
    16c4:	1e8080e7          	jalr	488(ra) # 78a8 <write>
    16c8:	87aa                	mv	a5,a0
    16ca:	873e                	mv	a4,a5
    16cc:	40000793          	li	a5,1024
    16d0:	02f70463          	beq	a4,a5,16f8 <writebig+0xac>
      printf("%s: error: write big file failed\n", s, i);
    16d4:	fec42783          	lw	a5,-20(s0)
    16d8:	863e                	mv	a2,a5
    16da:	fd843583          	ld	a1,-40(s0)
    16de:	00007517          	auipc	a0,0x7
    16e2:	16a50513          	addi	a0,a0,362 # 8848 <malloc+0x8a0>
    16e6:	00006097          	auipc	ra,0x6
    16ea:	6d0080e7          	jalr	1744(ra) # 7db6 <printf>
      exit(1);
    16ee:	4505                	li	a0,1
    16f0:	00006097          	auipc	ra,0x6
    16f4:	198080e7          	jalr	408(ra) # 7888 <exit>
  for(i = 0; i < MAXFILE; i++){
    16f8:	fec42783          	lw	a5,-20(s0)
    16fc:	2785                	addiw	a5,a5,1
    16fe:	fef42623          	sw	a5,-20(s0)
    1702:	fec42783          	lw	a5,-20(s0)
    1706:	873e                	mv	a4,a5
    1708:	10b00793          	li	a5,267
    170c:	f8e7fae3          	bgeu	a5,a4,16a0 <writebig+0x54>
    }
  }

  close(fd);
    1710:	fe442783          	lw	a5,-28(s0)
    1714:	853e                	mv	a0,a5
    1716:	00006097          	auipc	ra,0x6
    171a:	19a080e7          	jalr	410(ra) # 78b0 <close>

  fd = open("big", O_RDONLY);
    171e:	4581                	li	a1,0
    1720:	00007517          	auipc	a0,0x7
    1724:	10050513          	addi	a0,a0,256 # 8820 <malloc+0x878>
    1728:	00006097          	auipc	ra,0x6
    172c:	1a0080e7          	jalr	416(ra) # 78c8 <open>
    1730:	87aa                	mv	a5,a0
    1732:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
    1736:	fe442783          	lw	a5,-28(s0)
    173a:	2781                	sext.w	a5,a5
    173c:	0207d163          	bgez	a5,175e <writebig+0x112>
    printf("%s: error: open big failed!\n", s);
    1740:	fd843583          	ld	a1,-40(s0)
    1744:	00007517          	auipc	a0,0x7
    1748:	12c50513          	addi	a0,a0,300 # 8870 <malloc+0x8c8>
    174c:	00006097          	auipc	ra,0x6
    1750:	66a080e7          	jalr	1642(ra) # 7db6 <printf>
    exit(1);
    1754:	4505                	li	a0,1
    1756:	00006097          	auipc	ra,0x6
    175a:	132080e7          	jalr	306(ra) # 7888 <exit>
  }

  n = 0;
    175e:	fe042423          	sw	zero,-24(s0)
  for(;;){
    i = read(fd, buf, BSIZE);
    1762:	fe442783          	lw	a5,-28(s0)
    1766:	40000613          	li	a2,1024
    176a:	0000a597          	auipc	a1,0xa
    176e:	ce658593          	addi	a1,a1,-794 # b450 <buf>
    1772:	853e                	mv	a0,a5
    1774:	00006097          	auipc	ra,0x6
    1778:	12c080e7          	jalr	300(ra) # 78a0 <read>
    177c:	87aa                	mv	a5,a0
    177e:	fef42623          	sw	a5,-20(s0)
    if(i == 0){
    1782:	fec42783          	lw	a5,-20(s0)
    1786:	2781                	sext.w	a5,a5
    1788:	eb9d                	bnez	a5,17be <writebig+0x172>
      if(n == MAXFILE - 1){
    178a:	fe842783          	lw	a5,-24(s0)
    178e:	0007871b          	sext.w	a4,a5
    1792:	10b00793          	li	a5,267
    1796:	0af71663          	bne	a4,a5,1842 <writebig+0x1f6>
        printf("%s: read only %d blocks from big", s, n);
    179a:	fe842783          	lw	a5,-24(s0)
    179e:	863e                	mv	a2,a5
    17a0:	fd843583          	ld	a1,-40(s0)
    17a4:	00007517          	auipc	a0,0x7
    17a8:	0ec50513          	addi	a0,a0,236 # 8890 <malloc+0x8e8>
    17ac:	00006097          	auipc	ra,0x6
    17b0:	60a080e7          	jalr	1546(ra) # 7db6 <printf>
        exit(1);
    17b4:	4505                	li	a0,1
    17b6:	00006097          	auipc	ra,0x6
    17ba:	0d2080e7          	jalr	210(ra) # 7888 <exit>
      }
      break;
    } else if(i != BSIZE){
    17be:	fec42783          	lw	a5,-20(s0)
    17c2:	0007871b          	sext.w	a4,a5
    17c6:	40000793          	li	a5,1024
    17ca:	02f70463          	beq	a4,a5,17f2 <writebig+0x1a6>
      printf("%s: read failed %d\n", s, i);
    17ce:	fec42783          	lw	a5,-20(s0)
    17d2:	863e                	mv	a2,a5
    17d4:	fd843583          	ld	a1,-40(s0)
    17d8:	00007517          	auipc	a0,0x7
    17dc:	0e050513          	addi	a0,a0,224 # 88b8 <malloc+0x910>
    17e0:	00006097          	auipc	ra,0x6
    17e4:	5d6080e7          	jalr	1494(ra) # 7db6 <printf>
      exit(1);
    17e8:	4505                	li	a0,1
    17ea:	00006097          	auipc	ra,0x6
    17ee:	09e080e7          	jalr	158(ra) # 7888 <exit>
    }
    if(((int*)buf)[0] != n){
    17f2:	0000a797          	auipc	a5,0xa
    17f6:	c5e78793          	addi	a5,a5,-930 # b450 <buf>
    17fa:	4398                	lw	a4,0(a5)
    17fc:	fe842783          	lw	a5,-24(s0)
    1800:	2781                	sext.w	a5,a5
    1802:	02e78a63          	beq	a5,a4,1836 <writebig+0x1ea>
      printf("%s: read content of block %d is %d\n", s,
             n, ((int*)buf)[0]);
    1806:	0000a797          	auipc	a5,0xa
    180a:	c4a78793          	addi	a5,a5,-950 # b450 <buf>
      printf("%s: read content of block %d is %d\n", s,
    180e:	4398                	lw	a4,0(a5)
    1810:	fe842783          	lw	a5,-24(s0)
    1814:	86ba                	mv	a3,a4
    1816:	863e                	mv	a2,a5
    1818:	fd843583          	ld	a1,-40(s0)
    181c:	00007517          	auipc	a0,0x7
    1820:	0b450513          	addi	a0,a0,180 # 88d0 <malloc+0x928>
    1824:	00006097          	auipc	ra,0x6
    1828:	592080e7          	jalr	1426(ra) # 7db6 <printf>
      exit(1);
    182c:	4505                	li	a0,1
    182e:	00006097          	auipc	ra,0x6
    1832:	05a080e7          	jalr	90(ra) # 7888 <exit>
    }
    n++;
    1836:	fe842783          	lw	a5,-24(s0)
    183a:	2785                	addiw	a5,a5,1
    183c:	fef42423          	sw	a5,-24(s0)
    i = read(fd, buf, BSIZE);
    1840:	b70d                	j	1762 <writebig+0x116>
      break;
    1842:	0001                	nop
  }
  close(fd);
    1844:	fe442783          	lw	a5,-28(s0)
    1848:	853e                	mv	a0,a5
    184a:	00006097          	auipc	ra,0x6
    184e:	066080e7          	jalr	102(ra) # 78b0 <close>
  if(unlink("big") < 0){
    1852:	00007517          	auipc	a0,0x7
    1856:	fce50513          	addi	a0,a0,-50 # 8820 <malloc+0x878>
    185a:	00006097          	auipc	ra,0x6
    185e:	07e080e7          	jalr	126(ra) # 78d8 <unlink>
    1862:	87aa                	mv	a5,a0
    1864:	0207d163          	bgez	a5,1886 <writebig+0x23a>
    printf("%s: unlink big failed\n", s);
    1868:	fd843583          	ld	a1,-40(s0)
    186c:	00007517          	auipc	a0,0x7
    1870:	08c50513          	addi	a0,a0,140 # 88f8 <malloc+0x950>
    1874:	00006097          	auipc	ra,0x6
    1878:	542080e7          	jalr	1346(ra) # 7db6 <printf>
    exit(1);
    187c:	4505                	li	a0,1
    187e:	00006097          	auipc	ra,0x6
    1882:	00a080e7          	jalr	10(ra) # 7888 <exit>
  }
}
    1886:	0001                	nop
    1888:	70a2                	ld	ra,40(sp)
    188a:	7402                	ld	s0,32(sp)
    188c:	6145                	addi	sp,sp,48
    188e:	8082                	ret

0000000000001890 <createtest>:

// many creates, followed by unlink test
void
createtest(char *s)
{
    1890:	7179                	addi	sp,sp,-48
    1892:	f406                	sd	ra,40(sp)
    1894:	f022                	sd	s0,32(sp)
    1896:	1800                	addi	s0,sp,48
    1898:	fca43c23          	sd	a0,-40(s0)
  int i, fd;
  enum { N=52 };

  char name[3];
  name[0] = 'a';
    189c:	06100793          	li	a5,97
    18a0:	fef40023          	sb	a5,-32(s0)
  name[2] = '\0';
    18a4:	fe040123          	sb	zero,-30(s0)
  for(i = 0; i < N; i++){
    18a8:	fe042623          	sw	zero,-20(s0)
    18ac:	a099                	j	18f2 <createtest+0x62>
    name[1] = '0' + i;
    18ae:	fec42783          	lw	a5,-20(s0)
    18b2:	0ff7f793          	andi	a5,a5,255
    18b6:	0307879b          	addiw	a5,a5,48
    18ba:	0ff7f793          	andi	a5,a5,255
    18be:	fef400a3          	sb	a5,-31(s0)
    fd = open(name, O_CREATE|O_RDWR);
    18c2:	fe040793          	addi	a5,s0,-32
    18c6:	20200593          	li	a1,514
    18ca:	853e                	mv	a0,a5
    18cc:	00006097          	auipc	ra,0x6
    18d0:	ffc080e7          	jalr	-4(ra) # 78c8 <open>
    18d4:	87aa                	mv	a5,a0
    18d6:	fef42423          	sw	a5,-24(s0)
    close(fd);
    18da:	fe842783          	lw	a5,-24(s0)
    18de:	853e                	mv	a0,a5
    18e0:	00006097          	auipc	ra,0x6
    18e4:	fd0080e7          	jalr	-48(ra) # 78b0 <close>
  for(i = 0; i < N; i++){
    18e8:	fec42783          	lw	a5,-20(s0)
    18ec:	2785                	addiw	a5,a5,1
    18ee:	fef42623          	sw	a5,-20(s0)
    18f2:	fec42783          	lw	a5,-20(s0)
    18f6:	0007871b          	sext.w	a4,a5
    18fa:	03300793          	li	a5,51
    18fe:	fae7d8e3          	bge	a5,a4,18ae <createtest+0x1e>
  }
  name[0] = 'a';
    1902:	06100793          	li	a5,97
    1906:	fef40023          	sb	a5,-32(s0)
  name[2] = '\0';
    190a:	fe040123          	sb	zero,-30(s0)
  for(i = 0; i < N; i++){
    190e:	fe042623          	sw	zero,-20(s0)
    1912:	a03d                	j	1940 <createtest+0xb0>
    name[1] = '0' + i;
    1914:	fec42783          	lw	a5,-20(s0)
    1918:	0ff7f793          	andi	a5,a5,255
    191c:	0307879b          	addiw	a5,a5,48
    1920:	0ff7f793          	andi	a5,a5,255
    1924:	fef400a3          	sb	a5,-31(s0)
    unlink(name);
    1928:	fe040793          	addi	a5,s0,-32
    192c:	853e                	mv	a0,a5
    192e:	00006097          	auipc	ra,0x6
    1932:	faa080e7          	jalr	-86(ra) # 78d8 <unlink>
  for(i = 0; i < N; i++){
    1936:	fec42783          	lw	a5,-20(s0)
    193a:	2785                	addiw	a5,a5,1
    193c:	fef42623          	sw	a5,-20(s0)
    1940:	fec42783          	lw	a5,-20(s0)
    1944:	0007871b          	sext.w	a4,a5
    1948:	03300793          	li	a5,51
    194c:	fce7d4e3          	bge	a5,a4,1914 <createtest+0x84>
  }
}
    1950:	0001                	nop
    1952:	0001                	nop
    1954:	70a2                	ld	ra,40(sp)
    1956:	7402                	ld	s0,32(sp)
    1958:	6145                	addi	sp,sp,48
    195a:	8082                	ret

000000000000195c <dirtest>:

void dirtest(char *s)
{
    195c:	1101                	addi	sp,sp,-32
    195e:	ec06                	sd	ra,24(sp)
    1960:	e822                	sd	s0,16(sp)
    1962:	1000                	addi	s0,sp,32
    1964:	fea43423          	sd	a0,-24(s0)
  if(mkdir("dir0") < 0){
    1968:	00007517          	auipc	a0,0x7
    196c:	fa850513          	addi	a0,a0,-88 # 8910 <malloc+0x968>
    1970:	00006097          	auipc	ra,0x6
    1974:	f80080e7          	jalr	-128(ra) # 78f0 <mkdir>
    1978:	87aa                	mv	a5,a0
    197a:	0207d163          	bgez	a5,199c <dirtest+0x40>
    printf("%s: mkdir failed\n", s);
    197e:	fe843583          	ld	a1,-24(s0)
    1982:	00007517          	auipc	a0,0x7
    1986:	c5e50513          	addi	a0,a0,-930 # 85e0 <malloc+0x638>
    198a:	00006097          	auipc	ra,0x6
    198e:	42c080e7          	jalr	1068(ra) # 7db6 <printf>
    exit(1);
    1992:	4505                	li	a0,1
    1994:	00006097          	auipc	ra,0x6
    1998:	ef4080e7          	jalr	-268(ra) # 7888 <exit>
  }

  if(chdir("dir0") < 0){
    199c:	00007517          	auipc	a0,0x7
    19a0:	f7450513          	addi	a0,a0,-140 # 8910 <malloc+0x968>
    19a4:	00006097          	auipc	ra,0x6
    19a8:	f54080e7          	jalr	-172(ra) # 78f8 <chdir>
    19ac:	87aa                	mv	a5,a0
    19ae:	0207d163          	bgez	a5,19d0 <dirtest+0x74>
    printf("%s: chdir dir0 failed\n", s);
    19b2:	fe843583          	ld	a1,-24(s0)
    19b6:	00007517          	auipc	a0,0x7
    19ba:	f6250513          	addi	a0,a0,-158 # 8918 <malloc+0x970>
    19be:	00006097          	auipc	ra,0x6
    19c2:	3f8080e7          	jalr	1016(ra) # 7db6 <printf>
    exit(1);
    19c6:	4505                	li	a0,1
    19c8:	00006097          	auipc	ra,0x6
    19cc:	ec0080e7          	jalr	-320(ra) # 7888 <exit>
  }

  if(chdir("..") < 0){
    19d0:	00007517          	auipc	a0,0x7
    19d4:	f6050513          	addi	a0,a0,-160 # 8930 <malloc+0x988>
    19d8:	00006097          	auipc	ra,0x6
    19dc:	f20080e7          	jalr	-224(ra) # 78f8 <chdir>
    19e0:	87aa                	mv	a5,a0
    19e2:	0207d163          	bgez	a5,1a04 <dirtest+0xa8>
    printf("%s: chdir .. failed\n", s);
    19e6:	fe843583          	ld	a1,-24(s0)
    19ea:	00007517          	auipc	a0,0x7
    19ee:	f4e50513          	addi	a0,a0,-178 # 8938 <malloc+0x990>
    19f2:	00006097          	auipc	ra,0x6
    19f6:	3c4080e7          	jalr	964(ra) # 7db6 <printf>
    exit(1);
    19fa:	4505                	li	a0,1
    19fc:	00006097          	auipc	ra,0x6
    1a00:	e8c080e7          	jalr	-372(ra) # 7888 <exit>
  }

  if(unlink("dir0") < 0){
    1a04:	00007517          	auipc	a0,0x7
    1a08:	f0c50513          	addi	a0,a0,-244 # 8910 <malloc+0x968>
    1a0c:	00006097          	auipc	ra,0x6
    1a10:	ecc080e7          	jalr	-308(ra) # 78d8 <unlink>
    1a14:	87aa                	mv	a5,a0
    1a16:	0207d163          	bgez	a5,1a38 <dirtest+0xdc>
    printf("%s: unlink dir0 failed\n", s);
    1a1a:	fe843583          	ld	a1,-24(s0)
    1a1e:	00007517          	auipc	a0,0x7
    1a22:	f3250513          	addi	a0,a0,-206 # 8950 <malloc+0x9a8>
    1a26:	00006097          	auipc	ra,0x6
    1a2a:	390080e7          	jalr	912(ra) # 7db6 <printf>
    exit(1);
    1a2e:	4505                	li	a0,1
    1a30:	00006097          	auipc	ra,0x6
    1a34:	e58080e7          	jalr	-424(ra) # 7888 <exit>
  }
}
    1a38:	0001                	nop
    1a3a:	60e2                	ld	ra,24(sp)
    1a3c:	6442                	ld	s0,16(sp)
    1a3e:	6105                	addi	sp,sp,32
    1a40:	8082                	ret

0000000000001a42 <exectest>:

void
exectest(char *s)
{
    1a42:	715d                	addi	sp,sp,-80
    1a44:	e486                	sd	ra,72(sp)
    1a46:	e0a2                	sd	s0,64(sp)
    1a48:	0880                	addi	s0,sp,80
    1a4a:	faa43c23          	sd	a0,-72(s0)
  int fd, xstatus, pid;
  char *echoargv[] = { "echo", "OK", 0 };
    1a4e:	00007797          	auipc	a5,0x7
    1a52:	8e278793          	addi	a5,a5,-1822 # 8330 <malloc+0x388>
    1a56:	fcf43423          	sd	a5,-56(s0)
    1a5a:	00007797          	auipc	a5,0x7
    1a5e:	f0e78793          	addi	a5,a5,-242 # 8968 <malloc+0x9c0>
    1a62:	fcf43823          	sd	a5,-48(s0)
    1a66:	fc043c23          	sd	zero,-40(s0)
  char buf[3];

  unlink("echo-ok");
    1a6a:	00007517          	auipc	a0,0x7
    1a6e:	f0650513          	addi	a0,a0,-250 # 8970 <malloc+0x9c8>
    1a72:	00006097          	auipc	ra,0x6
    1a76:	e66080e7          	jalr	-410(ra) # 78d8 <unlink>
  pid = fork();
    1a7a:	00006097          	auipc	ra,0x6
    1a7e:	e06080e7          	jalr	-506(ra) # 7880 <fork>
    1a82:	87aa                	mv	a5,a0
    1a84:	fef42623          	sw	a5,-20(s0)
  if(pid < 0) {
    1a88:	fec42783          	lw	a5,-20(s0)
    1a8c:	2781                	sext.w	a5,a5
    1a8e:	0207d163          	bgez	a5,1ab0 <exectest+0x6e>
     printf("%s: fork failed\n", s);
    1a92:	fb843583          	ld	a1,-72(s0)
    1a96:	00007517          	auipc	a0,0x7
    1a9a:	aba50513          	addi	a0,a0,-1350 # 8550 <malloc+0x5a8>
    1a9e:	00006097          	auipc	ra,0x6
    1aa2:	318080e7          	jalr	792(ra) # 7db6 <printf>
     exit(1);
    1aa6:	4505                	li	a0,1
    1aa8:	00006097          	auipc	ra,0x6
    1aac:	de0080e7          	jalr	-544(ra) # 7888 <exit>
  }
  if(pid == 0) {
    1ab0:	fec42783          	lw	a5,-20(s0)
    1ab4:	2781                	sext.w	a5,a5
    1ab6:	ebd5                	bnez	a5,1b6a <exectest+0x128>
    close(1);
    1ab8:	4505                	li	a0,1
    1aba:	00006097          	auipc	ra,0x6
    1abe:	df6080e7          	jalr	-522(ra) # 78b0 <close>
    fd = open("echo-ok", O_CREATE|O_WRONLY);
    1ac2:	20100593          	li	a1,513
    1ac6:	00007517          	auipc	a0,0x7
    1aca:	eaa50513          	addi	a0,a0,-342 # 8970 <malloc+0x9c8>
    1ace:	00006097          	auipc	ra,0x6
    1ad2:	dfa080e7          	jalr	-518(ra) # 78c8 <open>
    1ad6:	87aa                	mv	a5,a0
    1ad8:	fef42423          	sw	a5,-24(s0)
    if(fd < 0) {
    1adc:	fe842783          	lw	a5,-24(s0)
    1ae0:	2781                	sext.w	a5,a5
    1ae2:	0207d163          	bgez	a5,1b04 <exectest+0xc2>
      printf("%s: create failed\n", s);
    1ae6:	fb843583          	ld	a1,-72(s0)
    1aea:	00007517          	auipc	a0,0x7
    1aee:	e8e50513          	addi	a0,a0,-370 # 8978 <malloc+0x9d0>
    1af2:	00006097          	auipc	ra,0x6
    1af6:	2c4080e7          	jalr	708(ra) # 7db6 <printf>
      exit(1);
    1afa:	4505                	li	a0,1
    1afc:	00006097          	auipc	ra,0x6
    1b00:	d8c080e7          	jalr	-628(ra) # 7888 <exit>
    }
    if(fd != 1) {
    1b04:	fe842783          	lw	a5,-24(s0)
    1b08:	0007871b          	sext.w	a4,a5
    1b0c:	4785                	li	a5,1
    1b0e:	02f70163          	beq	a4,a5,1b30 <exectest+0xee>
      printf("%s: wrong fd\n", s);
    1b12:	fb843583          	ld	a1,-72(s0)
    1b16:	00007517          	auipc	a0,0x7
    1b1a:	e7a50513          	addi	a0,a0,-390 # 8990 <malloc+0x9e8>
    1b1e:	00006097          	auipc	ra,0x6
    1b22:	298080e7          	jalr	664(ra) # 7db6 <printf>
      exit(1);
    1b26:	4505                	li	a0,1
    1b28:	00006097          	auipc	ra,0x6
    1b2c:	d60080e7          	jalr	-672(ra) # 7888 <exit>
    }
    if(exec("echo", echoargv) < 0){
    1b30:	fc840793          	addi	a5,s0,-56
    1b34:	85be                	mv	a1,a5
    1b36:	00006517          	auipc	a0,0x6
    1b3a:	7fa50513          	addi	a0,a0,2042 # 8330 <malloc+0x388>
    1b3e:	00006097          	auipc	ra,0x6
    1b42:	d82080e7          	jalr	-638(ra) # 78c0 <exec>
    1b46:	87aa                	mv	a5,a0
    1b48:	0207d163          	bgez	a5,1b6a <exectest+0x128>
      printf("%s: exec echo failed\n", s);
    1b4c:	fb843583          	ld	a1,-72(s0)
    1b50:	00007517          	auipc	a0,0x7
    1b54:	e5050513          	addi	a0,a0,-432 # 89a0 <malloc+0x9f8>
    1b58:	00006097          	auipc	ra,0x6
    1b5c:	25e080e7          	jalr	606(ra) # 7db6 <printf>
      exit(1);
    1b60:	4505                	li	a0,1
    1b62:	00006097          	auipc	ra,0x6
    1b66:	d26080e7          	jalr	-730(ra) # 7888 <exit>
    }
    // won't get to here
  }
  if (wait(&xstatus) != pid) {
    1b6a:	fe440793          	addi	a5,s0,-28
    1b6e:	853e                	mv	a0,a5
    1b70:	00006097          	auipc	ra,0x6
    1b74:	d20080e7          	jalr	-736(ra) # 7890 <wait>
    1b78:	87aa                	mv	a5,a0
    1b7a:	873e                	mv	a4,a5
    1b7c:	fec42783          	lw	a5,-20(s0)
    1b80:	2781                	sext.w	a5,a5
    1b82:	00e78c63          	beq	a5,a4,1b9a <exectest+0x158>
    printf("%s: wait failed!\n", s);
    1b86:	fb843583          	ld	a1,-72(s0)
    1b8a:	00007517          	auipc	a0,0x7
    1b8e:	e2e50513          	addi	a0,a0,-466 # 89b8 <malloc+0xa10>
    1b92:	00006097          	auipc	ra,0x6
    1b96:	224080e7          	jalr	548(ra) # 7db6 <printf>
  }
  if(xstatus != 0)
    1b9a:	fe442783          	lw	a5,-28(s0)
    1b9e:	cb81                	beqz	a5,1bae <exectest+0x16c>
    exit(xstatus);
    1ba0:	fe442783          	lw	a5,-28(s0)
    1ba4:	853e                	mv	a0,a5
    1ba6:	00006097          	auipc	ra,0x6
    1baa:	ce2080e7          	jalr	-798(ra) # 7888 <exit>

  fd = open("echo-ok", O_RDONLY);
    1bae:	4581                	li	a1,0
    1bb0:	00007517          	auipc	a0,0x7
    1bb4:	dc050513          	addi	a0,a0,-576 # 8970 <malloc+0x9c8>
    1bb8:	00006097          	auipc	ra,0x6
    1bbc:	d10080e7          	jalr	-752(ra) # 78c8 <open>
    1bc0:	87aa                	mv	a5,a0
    1bc2:	fef42423          	sw	a5,-24(s0)
  if(fd < 0) {
    1bc6:	fe842783          	lw	a5,-24(s0)
    1bca:	2781                	sext.w	a5,a5
    1bcc:	0207d163          	bgez	a5,1bee <exectest+0x1ac>
    printf("%s: open failed\n", s);
    1bd0:	fb843583          	ld	a1,-72(s0)
    1bd4:	00007517          	auipc	a0,0x7
    1bd8:	99450513          	addi	a0,a0,-1644 # 8568 <malloc+0x5c0>
    1bdc:	00006097          	auipc	ra,0x6
    1be0:	1da080e7          	jalr	474(ra) # 7db6 <printf>
    exit(1);
    1be4:	4505                	li	a0,1
    1be6:	00006097          	auipc	ra,0x6
    1bea:	ca2080e7          	jalr	-862(ra) # 7888 <exit>
  }
  if (read(fd, buf, 2) != 2) {
    1bee:	fc040713          	addi	a4,s0,-64
    1bf2:	fe842783          	lw	a5,-24(s0)
    1bf6:	4609                	li	a2,2
    1bf8:	85ba                	mv	a1,a4
    1bfa:	853e                	mv	a0,a5
    1bfc:	00006097          	auipc	ra,0x6
    1c00:	ca4080e7          	jalr	-860(ra) # 78a0 <read>
    1c04:	87aa                	mv	a5,a0
    1c06:	873e                	mv	a4,a5
    1c08:	4789                	li	a5,2
    1c0a:	02f70163          	beq	a4,a5,1c2c <exectest+0x1ea>
    printf("%s: read failed\n", s);
    1c0e:	fb843583          	ld	a1,-72(s0)
    1c12:	00007517          	auipc	a0,0x7
    1c16:	bd650513          	addi	a0,a0,-1066 # 87e8 <malloc+0x840>
    1c1a:	00006097          	auipc	ra,0x6
    1c1e:	19c080e7          	jalr	412(ra) # 7db6 <printf>
    exit(1);
    1c22:	4505                	li	a0,1
    1c24:	00006097          	auipc	ra,0x6
    1c28:	c64080e7          	jalr	-924(ra) # 7888 <exit>
  }
  unlink("echo-ok");
    1c2c:	00007517          	auipc	a0,0x7
    1c30:	d4450513          	addi	a0,a0,-700 # 8970 <malloc+0x9c8>
    1c34:	00006097          	auipc	ra,0x6
    1c38:	ca4080e7          	jalr	-860(ra) # 78d8 <unlink>
  if(buf[0] == 'O' && buf[1] == 'K')
    1c3c:	fc044783          	lbu	a5,-64(s0)
    1c40:	873e                	mv	a4,a5
    1c42:	04f00793          	li	a5,79
    1c46:	00f71e63          	bne	a4,a5,1c62 <exectest+0x220>
    1c4a:	fc144783          	lbu	a5,-63(s0)
    1c4e:	873e                	mv	a4,a5
    1c50:	04b00793          	li	a5,75
    1c54:	00f71763          	bne	a4,a5,1c62 <exectest+0x220>
    exit(0);
    1c58:	4501                	li	a0,0
    1c5a:	00006097          	auipc	ra,0x6
    1c5e:	c2e080e7          	jalr	-978(ra) # 7888 <exit>
  else {
    printf("%s: wrong output\n", s);
    1c62:	fb843583          	ld	a1,-72(s0)
    1c66:	00007517          	auipc	a0,0x7
    1c6a:	d6a50513          	addi	a0,a0,-662 # 89d0 <malloc+0xa28>
    1c6e:	00006097          	auipc	ra,0x6
    1c72:	148080e7          	jalr	328(ra) # 7db6 <printf>
    exit(1);
    1c76:	4505                	li	a0,1
    1c78:	00006097          	auipc	ra,0x6
    1c7c:	c10080e7          	jalr	-1008(ra) # 7888 <exit>

0000000000001c80 <pipe1>:

// simple fork and pipe read/write

void
pipe1(char *s)
{
    1c80:	715d                	addi	sp,sp,-80
    1c82:	e486                	sd	ra,72(sp)
    1c84:	e0a2                	sd	s0,64(sp)
    1c86:	0880                	addi	s0,sp,80
    1c88:	faa43c23          	sd	a0,-72(s0)
  int fds[2], pid, xstatus;
  int seq, i, n, cc, total;
  enum { N=5, SZ=1033 };

  if(pipe(fds) != 0){
    1c8c:	fd040793          	addi	a5,s0,-48
    1c90:	853e                	mv	a0,a5
    1c92:	00006097          	auipc	ra,0x6
    1c96:	c06080e7          	jalr	-1018(ra) # 7898 <pipe>
    1c9a:	87aa                	mv	a5,a0
    1c9c:	c385                	beqz	a5,1cbc <pipe1+0x3c>
    printf("%s: pipe() failed\n", s);
    1c9e:	fb843583          	ld	a1,-72(s0)
    1ca2:	00007517          	auipc	a0,0x7
    1ca6:	d4650513          	addi	a0,a0,-698 # 89e8 <malloc+0xa40>
    1caa:	00006097          	auipc	ra,0x6
    1cae:	10c080e7          	jalr	268(ra) # 7db6 <printf>
    exit(1);
    1cb2:	4505                	li	a0,1
    1cb4:	00006097          	auipc	ra,0x6
    1cb8:	bd4080e7          	jalr	-1068(ra) # 7888 <exit>
  }
  pid = fork();
    1cbc:	00006097          	auipc	ra,0x6
    1cc0:	bc4080e7          	jalr	-1084(ra) # 7880 <fork>
    1cc4:	87aa                	mv	a5,a0
    1cc6:	fcf42c23          	sw	a5,-40(s0)
  seq = 0;
    1cca:	fe042623          	sw	zero,-20(s0)
  if(pid == 0){
    1cce:	fd842783          	lw	a5,-40(s0)
    1cd2:	2781                	sext.w	a5,a5
    1cd4:	efdd                	bnez	a5,1d92 <pipe1+0x112>
    close(fds[0]);
    1cd6:	fd042783          	lw	a5,-48(s0)
    1cda:	853e                	mv	a0,a5
    1cdc:	00006097          	auipc	ra,0x6
    1ce0:	bd4080e7          	jalr	-1068(ra) # 78b0 <close>
    for(n = 0; n < N; n++){
    1ce4:	fe042223          	sw	zero,-28(s0)
    1ce8:	a849                	j	1d7a <pipe1+0xfa>
      for(i = 0; i < SZ; i++)
    1cea:	fe042423          	sw	zero,-24(s0)
    1cee:	a03d                	j	1d1c <pipe1+0x9c>
        buf[i] = seq++;
    1cf0:	fec42783          	lw	a5,-20(s0)
    1cf4:	0017871b          	addiw	a4,a5,1
    1cf8:	fee42623          	sw	a4,-20(s0)
    1cfc:	0ff7f713          	andi	a4,a5,255
    1d00:	00009697          	auipc	a3,0x9
    1d04:	75068693          	addi	a3,a3,1872 # b450 <buf>
    1d08:	fe842783          	lw	a5,-24(s0)
    1d0c:	97b6                	add	a5,a5,a3
    1d0e:	00e78023          	sb	a4,0(a5)
      for(i = 0; i < SZ; i++)
    1d12:	fe842783          	lw	a5,-24(s0)
    1d16:	2785                	addiw	a5,a5,1
    1d18:	fef42423          	sw	a5,-24(s0)
    1d1c:	fe842783          	lw	a5,-24(s0)
    1d20:	0007871b          	sext.w	a4,a5
    1d24:	40800793          	li	a5,1032
    1d28:	fce7d4e3          	bge	a5,a4,1cf0 <pipe1+0x70>
      if(write(fds[1], buf, SZ) != SZ){
    1d2c:	fd442783          	lw	a5,-44(s0)
    1d30:	40900613          	li	a2,1033
    1d34:	00009597          	auipc	a1,0x9
    1d38:	71c58593          	addi	a1,a1,1820 # b450 <buf>
    1d3c:	853e                	mv	a0,a5
    1d3e:	00006097          	auipc	ra,0x6
    1d42:	b6a080e7          	jalr	-1174(ra) # 78a8 <write>
    1d46:	87aa                	mv	a5,a0
    1d48:	873e                	mv	a4,a5
    1d4a:	40900793          	li	a5,1033
    1d4e:	02f70163          	beq	a4,a5,1d70 <pipe1+0xf0>
        printf("%s: pipe1 oops 1\n", s);
    1d52:	fb843583          	ld	a1,-72(s0)
    1d56:	00007517          	auipc	a0,0x7
    1d5a:	caa50513          	addi	a0,a0,-854 # 8a00 <malloc+0xa58>
    1d5e:	00006097          	auipc	ra,0x6
    1d62:	058080e7          	jalr	88(ra) # 7db6 <printf>
        exit(1);
    1d66:	4505                	li	a0,1
    1d68:	00006097          	auipc	ra,0x6
    1d6c:	b20080e7          	jalr	-1248(ra) # 7888 <exit>
    for(n = 0; n < N; n++){
    1d70:	fe442783          	lw	a5,-28(s0)
    1d74:	2785                	addiw	a5,a5,1
    1d76:	fef42223          	sw	a5,-28(s0)
    1d7a:	fe442783          	lw	a5,-28(s0)
    1d7e:	0007871b          	sext.w	a4,a5
    1d82:	4791                	li	a5,4
    1d84:	f6e7d3e3          	bge	a5,a4,1cea <pipe1+0x6a>
      }
    }
    exit(0);
    1d88:	4501                	li	a0,0
    1d8a:	00006097          	auipc	ra,0x6
    1d8e:	afe080e7          	jalr	-1282(ra) # 7888 <exit>
  } else if(pid > 0){
    1d92:	fd842783          	lw	a5,-40(s0)
    1d96:	2781                	sext.w	a5,a5
    1d98:	12f05b63          	blez	a5,1ece <pipe1+0x24e>
    close(fds[1]);
    1d9c:	fd442783          	lw	a5,-44(s0)
    1da0:	853e                	mv	a0,a5
    1da2:	00006097          	auipc	ra,0x6
    1da6:	b0e080e7          	jalr	-1266(ra) # 78b0 <close>
    total = 0;
    1daa:	fc042e23          	sw	zero,-36(s0)
    cc = 1;
    1dae:	4785                	li	a5,1
    1db0:	fef42023          	sw	a5,-32(s0)
    while((n = read(fds[0], buf, cc)) > 0){
    1db4:	a849                	j	1e46 <pipe1+0x1c6>
      for(i = 0; i < n; i++){
    1db6:	fe042423          	sw	zero,-24(s0)
    1dba:	a881                	j	1e0a <pipe1+0x18a>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
    1dbc:	00009717          	auipc	a4,0x9
    1dc0:	69470713          	addi	a4,a4,1684 # b450 <buf>
    1dc4:	fe842783          	lw	a5,-24(s0)
    1dc8:	97ba                	add	a5,a5,a4
    1dca:	0007c783          	lbu	a5,0(a5)
    1dce:	0007869b          	sext.w	a3,a5
    1dd2:	fec42783          	lw	a5,-20(s0)
    1dd6:	0017871b          	addiw	a4,a5,1
    1dda:	fee42623          	sw	a4,-20(s0)
    1dde:	0ff7f793          	andi	a5,a5,255
    1de2:	2781                	sext.w	a5,a5
    1de4:	8736                	mv	a4,a3
    1de6:	00f70d63          	beq	a4,a5,1e00 <pipe1+0x180>
          printf("%s: pipe1 oops 2\n", s);
    1dea:	fb843583          	ld	a1,-72(s0)
    1dee:	00007517          	auipc	a0,0x7
    1df2:	c2a50513          	addi	a0,a0,-982 # 8a18 <malloc+0xa70>
    1df6:	00006097          	auipc	ra,0x6
    1dfa:	fc0080e7          	jalr	-64(ra) # 7db6 <printf>
          return;
    1dfe:	a0fd                	j	1eec <pipe1+0x26c>
      for(i = 0; i < n; i++){
    1e00:	fe842783          	lw	a5,-24(s0)
    1e04:	2785                	addiw	a5,a5,1
    1e06:	fef42423          	sw	a5,-24(s0)
    1e0a:	fe842703          	lw	a4,-24(s0)
    1e0e:	fe442783          	lw	a5,-28(s0)
    1e12:	2701                	sext.w	a4,a4
    1e14:	2781                	sext.w	a5,a5
    1e16:	faf743e3          	blt	a4,a5,1dbc <pipe1+0x13c>
        }
      }
      total += n;
    1e1a:	fdc42703          	lw	a4,-36(s0)
    1e1e:	fe442783          	lw	a5,-28(s0)
    1e22:	9fb9                	addw	a5,a5,a4
    1e24:	fcf42e23          	sw	a5,-36(s0)
      cc = cc * 2;
    1e28:	fe042783          	lw	a5,-32(s0)
    1e2c:	0017979b          	slliw	a5,a5,0x1
    1e30:	fef42023          	sw	a5,-32(s0)
      if(cc > sizeof(buf))
    1e34:	fe042783          	lw	a5,-32(s0)
    1e38:	873e                	mv	a4,a5
    1e3a:	678d                	lui	a5,0x3
    1e3c:	00e7f563          	bgeu	a5,a4,1e46 <pipe1+0x1c6>
        cc = sizeof(buf);
    1e40:	678d                	lui	a5,0x3
    1e42:	fef42023          	sw	a5,-32(s0)
    while((n = read(fds[0], buf, cc)) > 0){
    1e46:	fd042783          	lw	a5,-48(s0)
    1e4a:	fe042703          	lw	a4,-32(s0)
    1e4e:	863a                	mv	a2,a4
    1e50:	00009597          	auipc	a1,0x9
    1e54:	60058593          	addi	a1,a1,1536 # b450 <buf>
    1e58:	853e                	mv	a0,a5
    1e5a:	00006097          	auipc	ra,0x6
    1e5e:	a46080e7          	jalr	-1466(ra) # 78a0 <read>
    1e62:	87aa                	mv	a5,a0
    1e64:	fef42223          	sw	a5,-28(s0)
    1e68:	fe442783          	lw	a5,-28(s0)
    1e6c:	2781                	sext.w	a5,a5
    1e6e:	f4f044e3          	bgtz	a5,1db6 <pipe1+0x136>
    }
    if(total != N * SZ){
    1e72:	fdc42783          	lw	a5,-36(s0)
    1e76:	0007871b          	sext.w	a4,a5
    1e7a:	6785                	lui	a5,0x1
    1e7c:	42d78793          	addi	a5,a5,1069 # 142d <opentest+0x67>
    1e80:	02f70263          	beq	a4,a5,1ea4 <pipe1+0x224>
      printf("%s: pipe1 oops 3 total %d\n", total);
    1e84:	fdc42783          	lw	a5,-36(s0)
    1e88:	85be                	mv	a1,a5
    1e8a:	00007517          	auipc	a0,0x7
    1e8e:	ba650513          	addi	a0,a0,-1114 # 8a30 <malloc+0xa88>
    1e92:	00006097          	auipc	ra,0x6
    1e96:	f24080e7          	jalr	-220(ra) # 7db6 <printf>
      exit(1);
    1e9a:	4505                	li	a0,1
    1e9c:	00006097          	auipc	ra,0x6
    1ea0:	9ec080e7          	jalr	-1556(ra) # 7888 <exit>
    }
    close(fds[0]);
    1ea4:	fd042783          	lw	a5,-48(s0)
    1ea8:	853e                	mv	a0,a5
    1eaa:	00006097          	auipc	ra,0x6
    1eae:	a06080e7          	jalr	-1530(ra) # 78b0 <close>
    wait(&xstatus);
    1eb2:	fcc40793          	addi	a5,s0,-52
    1eb6:	853e                	mv	a0,a5
    1eb8:	00006097          	auipc	ra,0x6
    1ebc:	9d8080e7          	jalr	-1576(ra) # 7890 <wait>
    exit(xstatus);
    1ec0:	fcc42783          	lw	a5,-52(s0)
    1ec4:	853e                	mv	a0,a5
    1ec6:	00006097          	auipc	ra,0x6
    1eca:	9c2080e7          	jalr	-1598(ra) # 7888 <exit>
  } else {
    printf("%s: fork() failed\n", s);
    1ece:	fb843583          	ld	a1,-72(s0)
    1ed2:	00007517          	auipc	a0,0x7
    1ed6:	b7e50513          	addi	a0,a0,-1154 # 8a50 <malloc+0xaa8>
    1eda:	00006097          	auipc	ra,0x6
    1ede:	edc080e7          	jalr	-292(ra) # 7db6 <printf>
    exit(1);
    1ee2:	4505                	li	a0,1
    1ee4:	00006097          	auipc	ra,0x6
    1ee8:	9a4080e7          	jalr	-1628(ra) # 7888 <exit>
  }
}
    1eec:	60a6                	ld	ra,72(sp)
    1eee:	6406                	ld	s0,64(sp)
    1ef0:	6161                	addi	sp,sp,80
    1ef2:	8082                	ret

0000000000001ef4 <killstatus>:


// test if child is killed (status = -1)
void
killstatus(char *s)
{
    1ef4:	7179                	addi	sp,sp,-48
    1ef6:	f406                	sd	ra,40(sp)
    1ef8:	f022                	sd	s0,32(sp)
    1efa:	1800                	addi	s0,sp,48
    1efc:	fca43c23          	sd	a0,-40(s0)
  int xst;

  for(int i = 0; i < 100; i++){
    1f00:	fe042623          	sw	zero,-20(s0)
    1f04:	a055                	j	1fa8 <killstatus+0xb4>
    int pid1 = fork();
    1f06:	00006097          	auipc	ra,0x6
    1f0a:	97a080e7          	jalr	-1670(ra) # 7880 <fork>
    1f0e:	87aa                	mv	a5,a0
    1f10:	fef42423          	sw	a5,-24(s0)
    if(pid1 < 0){
    1f14:	fe842783          	lw	a5,-24(s0)
    1f18:	2781                	sext.w	a5,a5
    1f1a:	0207d163          	bgez	a5,1f3c <killstatus+0x48>
      printf("%s: fork failed\n", s);
    1f1e:	fd843583          	ld	a1,-40(s0)
    1f22:	00006517          	auipc	a0,0x6
    1f26:	62e50513          	addi	a0,a0,1582 # 8550 <malloc+0x5a8>
    1f2a:	00006097          	auipc	ra,0x6
    1f2e:	e8c080e7          	jalr	-372(ra) # 7db6 <printf>
      exit(1);
    1f32:	4505                	li	a0,1
    1f34:	00006097          	auipc	ra,0x6
    1f38:	954080e7          	jalr	-1708(ra) # 7888 <exit>
    }
    if(pid1 == 0){
    1f3c:	fe842783          	lw	a5,-24(s0)
    1f40:	2781                	sext.w	a5,a5
    1f42:	e791                	bnez	a5,1f4e <killstatus+0x5a>
      while(1) {
        getpid();
    1f44:	00006097          	auipc	ra,0x6
    1f48:	9c4080e7          	jalr	-1596(ra) # 7908 <getpid>
    1f4c:	bfe5                	j	1f44 <killstatus+0x50>
      }
      exit(0);
    }
    sleep(1);
    1f4e:	4505                	li	a0,1
    1f50:	00006097          	auipc	ra,0x6
    1f54:	9c8080e7          	jalr	-1592(ra) # 7918 <sleep>
    kill(pid1);
    1f58:	fe842783          	lw	a5,-24(s0)
    1f5c:	853e                	mv	a0,a5
    1f5e:	00006097          	auipc	ra,0x6
    1f62:	95a080e7          	jalr	-1702(ra) # 78b8 <kill>
    wait(&xst);
    1f66:	fe440793          	addi	a5,s0,-28
    1f6a:	853e                	mv	a0,a5
    1f6c:	00006097          	auipc	ra,0x6
    1f70:	924080e7          	jalr	-1756(ra) # 7890 <wait>
    if(xst != -1) {
    1f74:	fe442783          	lw	a5,-28(s0)
    1f78:	873e                	mv	a4,a5
    1f7a:	57fd                	li	a5,-1
    1f7c:	02f70163          	beq	a4,a5,1f9e <killstatus+0xaa>
       printf("%s: status should be -1\n", s);
    1f80:	fd843583          	ld	a1,-40(s0)
    1f84:	00007517          	auipc	a0,0x7
    1f88:	ae450513          	addi	a0,a0,-1308 # 8a68 <malloc+0xac0>
    1f8c:	00006097          	auipc	ra,0x6
    1f90:	e2a080e7          	jalr	-470(ra) # 7db6 <printf>
       exit(1);
    1f94:	4505                	li	a0,1
    1f96:	00006097          	auipc	ra,0x6
    1f9a:	8f2080e7          	jalr	-1806(ra) # 7888 <exit>
  for(int i = 0; i < 100; i++){
    1f9e:	fec42783          	lw	a5,-20(s0)
    1fa2:	2785                	addiw	a5,a5,1
    1fa4:	fef42623          	sw	a5,-20(s0)
    1fa8:	fec42783          	lw	a5,-20(s0)
    1fac:	0007871b          	sext.w	a4,a5
    1fb0:	06300793          	li	a5,99
    1fb4:	f4e7d9e3          	bge	a5,a4,1f06 <killstatus+0x12>
    }
  }
  exit(0);
    1fb8:	4501                	li	a0,0
    1fba:	00006097          	auipc	ra,0x6
    1fbe:	8ce080e7          	jalr	-1842(ra) # 7888 <exit>

0000000000001fc2 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(char *s)
{
    1fc2:	7139                	addi	sp,sp,-64
    1fc4:	fc06                	sd	ra,56(sp)
    1fc6:	f822                	sd	s0,48(sp)
    1fc8:	0080                	addi	s0,sp,64
    1fca:	fca43423          	sd	a0,-56(s0)
  int pid1, pid2, pid3;
  int pfds[2];

  pid1 = fork();
    1fce:	00006097          	auipc	ra,0x6
    1fd2:	8b2080e7          	jalr	-1870(ra) # 7880 <fork>
    1fd6:	87aa                	mv	a5,a0
    1fd8:	fef42623          	sw	a5,-20(s0)
  if(pid1 < 0) {
    1fdc:	fec42783          	lw	a5,-20(s0)
    1fe0:	2781                	sext.w	a5,a5
    1fe2:	0207d163          	bgez	a5,2004 <preempt+0x42>
    printf("%s: fork failed", s);
    1fe6:	fc843583          	ld	a1,-56(s0)
    1fea:	00007517          	auipc	a0,0x7
    1fee:	a9e50513          	addi	a0,a0,-1378 # 8a88 <malloc+0xae0>
    1ff2:	00006097          	auipc	ra,0x6
    1ff6:	dc4080e7          	jalr	-572(ra) # 7db6 <printf>
    exit(1);
    1ffa:	4505                	li	a0,1
    1ffc:	00006097          	auipc	ra,0x6
    2000:	88c080e7          	jalr	-1908(ra) # 7888 <exit>
  }
  if(pid1 == 0)
    2004:	fec42783          	lw	a5,-20(s0)
    2008:	2781                	sext.w	a5,a5
    200a:	e391                	bnez	a5,200e <preempt+0x4c>
    for(;;)
    200c:	a001                	j	200c <preempt+0x4a>
      ;

  pid2 = fork();
    200e:	00006097          	auipc	ra,0x6
    2012:	872080e7          	jalr	-1934(ra) # 7880 <fork>
    2016:	87aa                	mv	a5,a0
    2018:	fef42423          	sw	a5,-24(s0)
  if(pid2 < 0) {
    201c:	fe842783          	lw	a5,-24(s0)
    2020:	2781                	sext.w	a5,a5
    2022:	0207d163          	bgez	a5,2044 <preempt+0x82>
    printf("%s: fork failed\n", s);
    2026:	fc843583          	ld	a1,-56(s0)
    202a:	00006517          	auipc	a0,0x6
    202e:	52650513          	addi	a0,a0,1318 # 8550 <malloc+0x5a8>
    2032:	00006097          	auipc	ra,0x6
    2036:	d84080e7          	jalr	-636(ra) # 7db6 <printf>
    exit(1);
    203a:	4505                	li	a0,1
    203c:	00006097          	auipc	ra,0x6
    2040:	84c080e7          	jalr	-1972(ra) # 7888 <exit>
  }
  if(pid2 == 0)
    2044:	fe842783          	lw	a5,-24(s0)
    2048:	2781                	sext.w	a5,a5
    204a:	e391                	bnez	a5,204e <preempt+0x8c>
    for(;;)
    204c:	a001                	j	204c <preempt+0x8a>
      ;

  pipe(pfds);
    204e:	fd840793          	addi	a5,s0,-40
    2052:	853e                	mv	a0,a5
    2054:	00006097          	auipc	ra,0x6
    2058:	844080e7          	jalr	-1980(ra) # 7898 <pipe>
  pid3 = fork();
    205c:	00006097          	auipc	ra,0x6
    2060:	824080e7          	jalr	-2012(ra) # 7880 <fork>
    2064:	87aa                	mv	a5,a0
    2066:	fef42223          	sw	a5,-28(s0)
  if(pid3 < 0) {
    206a:	fe442783          	lw	a5,-28(s0)
    206e:	2781                	sext.w	a5,a5
    2070:	0207d163          	bgez	a5,2092 <preempt+0xd0>
     printf("%s: fork failed\n", s);
    2074:	fc843583          	ld	a1,-56(s0)
    2078:	00006517          	auipc	a0,0x6
    207c:	4d850513          	addi	a0,a0,1240 # 8550 <malloc+0x5a8>
    2080:	00006097          	auipc	ra,0x6
    2084:	d36080e7          	jalr	-714(ra) # 7db6 <printf>
     exit(1);
    2088:	4505                	li	a0,1
    208a:	00005097          	auipc	ra,0x5
    208e:	7fe080e7          	jalr	2046(ra) # 7888 <exit>
  }
  if(pid3 == 0){
    2092:	fe442783          	lw	a5,-28(s0)
    2096:	2781                	sext.w	a5,a5
    2098:	ebb9                	bnez	a5,20ee <preempt+0x12c>
    close(pfds[0]);
    209a:	fd842783          	lw	a5,-40(s0)
    209e:	853e                	mv	a0,a5
    20a0:	00006097          	auipc	ra,0x6
    20a4:	810080e7          	jalr	-2032(ra) # 78b0 <close>
    if(write(pfds[1], "x", 1) != 1)
    20a8:	fdc42783          	lw	a5,-36(s0)
    20ac:	4605                	li	a2,1
    20ae:	00006597          	auipc	a1,0x6
    20b2:	17258593          	addi	a1,a1,370 # 8220 <malloc+0x278>
    20b6:	853e                	mv	a0,a5
    20b8:	00005097          	auipc	ra,0x5
    20bc:	7f0080e7          	jalr	2032(ra) # 78a8 <write>
    20c0:	87aa                	mv	a5,a0
    20c2:	873e                	mv	a4,a5
    20c4:	4785                	li	a5,1
    20c6:	00f70c63          	beq	a4,a5,20de <preempt+0x11c>
      printf("%s: preempt write error", s);
    20ca:	fc843583          	ld	a1,-56(s0)
    20ce:	00007517          	auipc	a0,0x7
    20d2:	9ca50513          	addi	a0,a0,-1590 # 8a98 <malloc+0xaf0>
    20d6:	00006097          	auipc	ra,0x6
    20da:	ce0080e7          	jalr	-800(ra) # 7db6 <printf>
    close(pfds[1]);
    20de:	fdc42783          	lw	a5,-36(s0)
    20e2:	853e                	mv	a0,a5
    20e4:	00005097          	auipc	ra,0x5
    20e8:	7cc080e7          	jalr	1996(ra) # 78b0 <close>
    for(;;)
    20ec:	a001                	j	20ec <preempt+0x12a>
      ;
  }

  close(pfds[1]);
    20ee:	fdc42783          	lw	a5,-36(s0)
    20f2:	853e                	mv	a0,a5
    20f4:	00005097          	auipc	ra,0x5
    20f8:	7bc080e7          	jalr	1980(ra) # 78b0 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    20fc:	fd842783          	lw	a5,-40(s0)
    2100:	660d                	lui	a2,0x3
    2102:	00009597          	auipc	a1,0x9
    2106:	34e58593          	addi	a1,a1,846 # b450 <buf>
    210a:	853e                	mv	a0,a5
    210c:	00005097          	auipc	ra,0x5
    2110:	794080e7          	jalr	1940(ra) # 78a0 <read>
    2114:	87aa                	mv	a5,a0
    2116:	873e                	mv	a4,a5
    2118:	4785                	li	a5,1
    211a:	00f70d63          	beq	a4,a5,2134 <preempt+0x172>
    printf("%s: preempt read error", s);
    211e:	fc843583          	ld	a1,-56(s0)
    2122:	00007517          	auipc	a0,0x7
    2126:	98e50513          	addi	a0,a0,-1650 # 8ab0 <malloc+0xb08>
    212a:	00006097          	auipc	ra,0x6
    212e:	c8c080e7          	jalr	-884(ra) # 7db6 <printf>
    2132:	a8a5                	j	21aa <preempt+0x1e8>
    return;
  }
  close(pfds[0]);
    2134:	fd842783          	lw	a5,-40(s0)
    2138:	853e                	mv	a0,a5
    213a:	00005097          	auipc	ra,0x5
    213e:	776080e7          	jalr	1910(ra) # 78b0 <close>
  printf("kill... ");
    2142:	00007517          	auipc	a0,0x7
    2146:	98650513          	addi	a0,a0,-1658 # 8ac8 <malloc+0xb20>
    214a:	00006097          	auipc	ra,0x6
    214e:	c6c080e7          	jalr	-916(ra) # 7db6 <printf>
  kill(pid1);
    2152:	fec42783          	lw	a5,-20(s0)
    2156:	853e                	mv	a0,a5
    2158:	00005097          	auipc	ra,0x5
    215c:	760080e7          	jalr	1888(ra) # 78b8 <kill>
  kill(pid2);
    2160:	fe842783          	lw	a5,-24(s0)
    2164:	853e                	mv	a0,a5
    2166:	00005097          	auipc	ra,0x5
    216a:	752080e7          	jalr	1874(ra) # 78b8 <kill>
  kill(pid3);
    216e:	fe442783          	lw	a5,-28(s0)
    2172:	853e                	mv	a0,a5
    2174:	00005097          	auipc	ra,0x5
    2178:	744080e7          	jalr	1860(ra) # 78b8 <kill>
  printf("wait... ");
    217c:	00007517          	auipc	a0,0x7
    2180:	95c50513          	addi	a0,a0,-1700 # 8ad8 <malloc+0xb30>
    2184:	00006097          	auipc	ra,0x6
    2188:	c32080e7          	jalr	-974(ra) # 7db6 <printf>
  wait(0);
    218c:	4501                	li	a0,0
    218e:	00005097          	auipc	ra,0x5
    2192:	702080e7          	jalr	1794(ra) # 7890 <wait>
  wait(0);
    2196:	4501                	li	a0,0
    2198:	00005097          	auipc	ra,0x5
    219c:	6f8080e7          	jalr	1784(ra) # 7890 <wait>
  wait(0);
    21a0:	4501                	li	a0,0
    21a2:	00005097          	auipc	ra,0x5
    21a6:	6ee080e7          	jalr	1774(ra) # 7890 <wait>
}
    21aa:	70e2                	ld	ra,56(sp)
    21ac:	7442                	ld	s0,48(sp)
    21ae:	6121                	addi	sp,sp,64
    21b0:	8082                	ret

00000000000021b2 <exitwait>:

// try to find any races between exit and wait
void
exitwait(char *s)
{
    21b2:	7179                	addi	sp,sp,-48
    21b4:	f406                	sd	ra,40(sp)
    21b6:	f022                	sd	s0,32(sp)
    21b8:	1800                	addi	s0,sp,48
    21ba:	fca43c23          	sd	a0,-40(s0)
  int i, pid;

  for(i = 0; i < 100; i++){
    21be:	fe042623          	sw	zero,-20(s0)
    21c2:	a87d                	j	2280 <exitwait+0xce>
    pid = fork();
    21c4:	00005097          	auipc	ra,0x5
    21c8:	6bc080e7          	jalr	1724(ra) # 7880 <fork>
    21cc:	87aa                	mv	a5,a0
    21ce:	fef42423          	sw	a5,-24(s0)
    if(pid < 0){
    21d2:	fe842783          	lw	a5,-24(s0)
    21d6:	2781                	sext.w	a5,a5
    21d8:	0207d163          	bgez	a5,21fa <exitwait+0x48>
      printf("%s: fork failed\n", s);
    21dc:	fd843583          	ld	a1,-40(s0)
    21e0:	00006517          	auipc	a0,0x6
    21e4:	37050513          	addi	a0,a0,880 # 8550 <malloc+0x5a8>
    21e8:	00006097          	auipc	ra,0x6
    21ec:	bce080e7          	jalr	-1074(ra) # 7db6 <printf>
      exit(1);
    21f0:	4505                	li	a0,1
    21f2:	00005097          	auipc	ra,0x5
    21f6:	696080e7          	jalr	1686(ra) # 7888 <exit>
    }
    if(pid){
    21fa:	fe842783          	lw	a5,-24(s0)
    21fe:	2781                	sext.w	a5,a5
    2200:	c7a5                	beqz	a5,2268 <exitwait+0xb6>
      int xstate;
      if(wait(&xstate) != pid){
    2202:	fe440793          	addi	a5,s0,-28
    2206:	853e                	mv	a0,a5
    2208:	00005097          	auipc	ra,0x5
    220c:	688080e7          	jalr	1672(ra) # 7890 <wait>
    2210:	87aa                	mv	a5,a0
    2212:	873e                	mv	a4,a5
    2214:	fe842783          	lw	a5,-24(s0)
    2218:	2781                	sext.w	a5,a5
    221a:	02e78163          	beq	a5,a4,223c <exitwait+0x8a>
        printf("%s: wait wrong pid\n", s);
    221e:	fd843583          	ld	a1,-40(s0)
    2222:	00007517          	auipc	a0,0x7
    2226:	8c650513          	addi	a0,a0,-1850 # 8ae8 <malloc+0xb40>
    222a:	00006097          	auipc	ra,0x6
    222e:	b8c080e7          	jalr	-1140(ra) # 7db6 <printf>
        exit(1);
    2232:	4505                	li	a0,1
    2234:	00005097          	auipc	ra,0x5
    2238:	654080e7          	jalr	1620(ra) # 7888 <exit>
      }
      if(i != xstate) {
    223c:	fe442703          	lw	a4,-28(s0)
    2240:	fec42783          	lw	a5,-20(s0)
    2244:	2781                	sext.w	a5,a5
    2246:	02e78863          	beq	a5,a4,2276 <exitwait+0xc4>
        printf("%s: wait wrong exit status\n", s);
    224a:	fd843583          	ld	a1,-40(s0)
    224e:	00007517          	auipc	a0,0x7
    2252:	8b250513          	addi	a0,a0,-1870 # 8b00 <malloc+0xb58>
    2256:	00006097          	auipc	ra,0x6
    225a:	b60080e7          	jalr	-1184(ra) # 7db6 <printf>
        exit(1);
    225e:	4505                	li	a0,1
    2260:	00005097          	auipc	ra,0x5
    2264:	628080e7          	jalr	1576(ra) # 7888 <exit>
      }
    } else {
      exit(i);
    2268:	fec42783          	lw	a5,-20(s0)
    226c:	853e                	mv	a0,a5
    226e:	00005097          	auipc	ra,0x5
    2272:	61a080e7          	jalr	1562(ra) # 7888 <exit>
  for(i = 0; i < 100; i++){
    2276:	fec42783          	lw	a5,-20(s0)
    227a:	2785                	addiw	a5,a5,1
    227c:	fef42623          	sw	a5,-20(s0)
    2280:	fec42783          	lw	a5,-20(s0)
    2284:	0007871b          	sext.w	a4,a5
    2288:	06300793          	li	a5,99
    228c:	f2e7dce3          	bge	a5,a4,21c4 <exitwait+0x12>
    }
  }
}
    2290:	0001                	nop
    2292:	0001                	nop
    2294:	70a2                	ld	ra,40(sp)
    2296:	7402                	ld	s0,32(sp)
    2298:	6145                	addi	sp,sp,48
    229a:	8082                	ret

000000000000229c <reparent>:
// try to find races in the reparenting
// code that handles a parent exiting
// when it still has live children.
void
reparent(char *s)
{
    229c:	7179                	addi	sp,sp,-48
    229e:	f406                	sd	ra,40(sp)
    22a0:	f022                	sd	s0,32(sp)
    22a2:	1800                	addi	s0,sp,48
    22a4:	fca43c23          	sd	a0,-40(s0)
  int master_pid = getpid();
    22a8:	00005097          	auipc	ra,0x5
    22ac:	660080e7          	jalr	1632(ra) # 7908 <getpid>
    22b0:	87aa                	mv	a5,a0
    22b2:	fef42423          	sw	a5,-24(s0)
  for(int i = 0; i < 200; i++){
    22b6:	fe042623          	sw	zero,-20(s0)
    22ba:	a86d                	j	2374 <reparent+0xd8>
    int pid = fork();
    22bc:	00005097          	auipc	ra,0x5
    22c0:	5c4080e7          	jalr	1476(ra) # 7880 <fork>
    22c4:	87aa                	mv	a5,a0
    22c6:	fef42223          	sw	a5,-28(s0)
    if(pid < 0){
    22ca:	fe442783          	lw	a5,-28(s0)
    22ce:	2781                	sext.w	a5,a5
    22d0:	0207d163          	bgez	a5,22f2 <reparent+0x56>
      printf("%s: fork failed\n", s);
    22d4:	fd843583          	ld	a1,-40(s0)
    22d8:	00006517          	auipc	a0,0x6
    22dc:	27850513          	addi	a0,a0,632 # 8550 <malloc+0x5a8>
    22e0:	00006097          	auipc	ra,0x6
    22e4:	ad6080e7          	jalr	-1322(ra) # 7db6 <printf>
      exit(1);
    22e8:	4505                	li	a0,1
    22ea:	00005097          	auipc	ra,0x5
    22ee:	59e080e7          	jalr	1438(ra) # 7888 <exit>
    }
    if(pid){
    22f2:	fe442783          	lw	a5,-28(s0)
    22f6:	2781                	sext.w	a5,a5
    22f8:	cf85                	beqz	a5,2330 <reparent+0x94>
      if(wait(0) != pid){
    22fa:	4501                	li	a0,0
    22fc:	00005097          	auipc	ra,0x5
    2300:	594080e7          	jalr	1428(ra) # 7890 <wait>
    2304:	87aa                	mv	a5,a0
    2306:	873e                	mv	a4,a5
    2308:	fe442783          	lw	a5,-28(s0)
    230c:	2781                	sext.w	a5,a5
    230e:	04e78e63          	beq	a5,a4,236a <reparent+0xce>
        printf("%s: wait wrong pid\n", s);
    2312:	fd843583          	ld	a1,-40(s0)
    2316:	00006517          	auipc	a0,0x6
    231a:	7d250513          	addi	a0,a0,2002 # 8ae8 <malloc+0xb40>
    231e:	00006097          	auipc	ra,0x6
    2322:	a98080e7          	jalr	-1384(ra) # 7db6 <printf>
        exit(1);
    2326:	4505                	li	a0,1
    2328:	00005097          	auipc	ra,0x5
    232c:	560080e7          	jalr	1376(ra) # 7888 <exit>
      }
    } else {
      int pid2 = fork();
    2330:	00005097          	auipc	ra,0x5
    2334:	550080e7          	jalr	1360(ra) # 7880 <fork>
    2338:	87aa                	mv	a5,a0
    233a:	fef42023          	sw	a5,-32(s0)
      if(pid2 < 0){
    233e:	fe042783          	lw	a5,-32(s0)
    2342:	2781                	sext.w	a5,a5
    2344:	0007de63          	bgez	a5,2360 <reparent+0xc4>
        kill(master_pid);
    2348:	fe842783          	lw	a5,-24(s0)
    234c:	853e                	mv	a0,a5
    234e:	00005097          	auipc	ra,0x5
    2352:	56a080e7          	jalr	1386(ra) # 78b8 <kill>
        exit(1);
    2356:	4505                	li	a0,1
    2358:	00005097          	auipc	ra,0x5
    235c:	530080e7          	jalr	1328(ra) # 7888 <exit>
      }
      exit(0);
    2360:	4501                	li	a0,0
    2362:	00005097          	auipc	ra,0x5
    2366:	526080e7          	jalr	1318(ra) # 7888 <exit>
  for(int i = 0; i < 200; i++){
    236a:	fec42783          	lw	a5,-20(s0)
    236e:	2785                	addiw	a5,a5,1
    2370:	fef42623          	sw	a5,-20(s0)
    2374:	fec42783          	lw	a5,-20(s0)
    2378:	0007871b          	sext.w	a4,a5
    237c:	0c700793          	li	a5,199
    2380:	f2e7dee3          	bge	a5,a4,22bc <reparent+0x20>
    }
  }
  exit(0);
    2384:	4501                	li	a0,0
    2386:	00005097          	auipc	ra,0x5
    238a:	502080e7          	jalr	1282(ra) # 7888 <exit>

000000000000238e <twochildren>:
}

// what if two children exit() at the same time?
void
twochildren(char *s)
{
    238e:	7179                	addi	sp,sp,-48
    2390:	f406                	sd	ra,40(sp)
    2392:	f022                	sd	s0,32(sp)
    2394:	1800                	addi	s0,sp,48
    2396:	fca43c23          	sd	a0,-40(s0)
  for(int i = 0; i < 1000; i++){
    239a:	fe042623          	sw	zero,-20(s0)
    239e:	a845                	j	244e <twochildren+0xc0>
    int pid1 = fork();
    23a0:	00005097          	auipc	ra,0x5
    23a4:	4e0080e7          	jalr	1248(ra) # 7880 <fork>
    23a8:	87aa                	mv	a5,a0
    23aa:	fef42423          	sw	a5,-24(s0)
    if(pid1 < 0){
    23ae:	fe842783          	lw	a5,-24(s0)
    23b2:	2781                	sext.w	a5,a5
    23b4:	0207d163          	bgez	a5,23d6 <twochildren+0x48>
      printf("%s: fork failed\n", s);
    23b8:	fd843583          	ld	a1,-40(s0)
    23bc:	00006517          	auipc	a0,0x6
    23c0:	19450513          	addi	a0,a0,404 # 8550 <malloc+0x5a8>
    23c4:	00006097          	auipc	ra,0x6
    23c8:	9f2080e7          	jalr	-1550(ra) # 7db6 <printf>
      exit(1);
    23cc:	4505                	li	a0,1
    23ce:	00005097          	auipc	ra,0x5
    23d2:	4ba080e7          	jalr	1210(ra) # 7888 <exit>
    }
    if(pid1 == 0){
    23d6:	fe842783          	lw	a5,-24(s0)
    23da:	2781                	sext.w	a5,a5
    23dc:	e791                	bnez	a5,23e8 <twochildren+0x5a>
      exit(0);
    23de:	4501                	li	a0,0
    23e0:	00005097          	auipc	ra,0x5
    23e4:	4a8080e7          	jalr	1192(ra) # 7888 <exit>
    } else {
      int pid2 = fork();
    23e8:	00005097          	auipc	ra,0x5
    23ec:	498080e7          	jalr	1176(ra) # 7880 <fork>
    23f0:	87aa                	mv	a5,a0
    23f2:	fef42223          	sw	a5,-28(s0)
      if(pid2 < 0){
    23f6:	fe442783          	lw	a5,-28(s0)
    23fa:	2781                	sext.w	a5,a5
    23fc:	0207d163          	bgez	a5,241e <twochildren+0x90>
        printf("%s: fork failed\n", s);
    2400:	fd843583          	ld	a1,-40(s0)
    2404:	00006517          	auipc	a0,0x6
    2408:	14c50513          	addi	a0,a0,332 # 8550 <malloc+0x5a8>
    240c:	00006097          	auipc	ra,0x6
    2410:	9aa080e7          	jalr	-1622(ra) # 7db6 <printf>
        exit(1);
    2414:	4505                	li	a0,1
    2416:	00005097          	auipc	ra,0x5
    241a:	472080e7          	jalr	1138(ra) # 7888 <exit>
      }
      if(pid2 == 0){
    241e:	fe442783          	lw	a5,-28(s0)
    2422:	2781                	sext.w	a5,a5
    2424:	e791                	bnez	a5,2430 <twochildren+0xa2>
        exit(0);
    2426:	4501                	li	a0,0
    2428:	00005097          	auipc	ra,0x5
    242c:	460080e7          	jalr	1120(ra) # 7888 <exit>
      } else {
        wait(0);
    2430:	4501                	li	a0,0
    2432:	00005097          	auipc	ra,0x5
    2436:	45e080e7          	jalr	1118(ra) # 7890 <wait>
        wait(0);
    243a:	4501                	li	a0,0
    243c:	00005097          	auipc	ra,0x5
    2440:	454080e7          	jalr	1108(ra) # 7890 <wait>
  for(int i = 0; i < 1000; i++){
    2444:	fec42783          	lw	a5,-20(s0)
    2448:	2785                	addiw	a5,a5,1
    244a:	fef42623          	sw	a5,-20(s0)
    244e:	fec42783          	lw	a5,-20(s0)
    2452:	0007871b          	sext.w	a4,a5
    2456:	3e700793          	li	a5,999
    245a:	f4e7d3e3          	bge	a5,a4,23a0 <twochildren+0x12>
      }
    }
  }
}
    245e:	0001                	nop
    2460:	0001                	nop
    2462:	70a2                	ld	ra,40(sp)
    2464:	7402                	ld	s0,32(sp)
    2466:	6145                	addi	sp,sp,48
    2468:	8082                	ret

000000000000246a <forkfork>:

// concurrent forks to try to expose locking bugs.
void
forkfork(char *s)
{
    246a:	7139                	addi	sp,sp,-64
    246c:	fc06                	sd	ra,56(sp)
    246e:	f822                	sd	s0,48(sp)
    2470:	0080                	addi	s0,sp,64
    2472:	fca43423          	sd	a0,-56(s0)
  enum { N=2 };

  for(int i = 0; i < N; i++){
    2476:	fe042623          	sw	zero,-20(s0)
    247a:	a84d                	j	252c <forkfork+0xc2>
    int pid = fork();
    247c:	00005097          	auipc	ra,0x5
    2480:	404080e7          	jalr	1028(ra) # 7880 <fork>
    2484:	87aa                	mv	a5,a0
    2486:	fef42023          	sw	a5,-32(s0)
    if(pid < 0){
    248a:	fe042783          	lw	a5,-32(s0)
    248e:	2781                	sext.w	a5,a5
    2490:	0207d163          	bgez	a5,24b2 <forkfork+0x48>
      printf("%s: fork failed", s);
    2494:	fc843583          	ld	a1,-56(s0)
    2498:	00006517          	auipc	a0,0x6
    249c:	5f050513          	addi	a0,a0,1520 # 8a88 <malloc+0xae0>
    24a0:	00006097          	auipc	ra,0x6
    24a4:	916080e7          	jalr	-1770(ra) # 7db6 <printf>
      exit(1);
    24a8:	4505                	li	a0,1
    24aa:	00005097          	auipc	ra,0x5
    24ae:	3de080e7          	jalr	990(ra) # 7888 <exit>
    }
    if(pid == 0){
    24b2:	fe042783          	lw	a5,-32(s0)
    24b6:	2781                	sext.w	a5,a5
    24b8:	e7ad                	bnez	a5,2522 <forkfork+0xb8>
      for(int j = 0; j < 200; j++){
    24ba:	fe042423          	sw	zero,-24(s0)
    24be:	a0a9                	j	2508 <forkfork+0x9e>
        int pid1 = fork();
    24c0:	00005097          	auipc	ra,0x5
    24c4:	3c0080e7          	jalr	960(ra) # 7880 <fork>
    24c8:	87aa                	mv	a5,a0
    24ca:	fcf42e23          	sw	a5,-36(s0)
        if(pid1 < 0){
    24ce:	fdc42783          	lw	a5,-36(s0)
    24d2:	2781                	sext.w	a5,a5
    24d4:	0007d763          	bgez	a5,24e2 <forkfork+0x78>
          exit(1);
    24d8:	4505                	li	a0,1
    24da:	00005097          	auipc	ra,0x5
    24de:	3ae080e7          	jalr	942(ra) # 7888 <exit>
        }
        if(pid1 == 0){
    24e2:	fdc42783          	lw	a5,-36(s0)
    24e6:	2781                	sext.w	a5,a5
    24e8:	e791                	bnez	a5,24f4 <forkfork+0x8a>
          exit(0);
    24ea:	4501                	li	a0,0
    24ec:	00005097          	auipc	ra,0x5
    24f0:	39c080e7          	jalr	924(ra) # 7888 <exit>
        }
        wait(0);
    24f4:	4501                	li	a0,0
    24f6:	00005097          	auipc	ra,0x5
    24fa:	39a080e7          	jalr	922(ra) # 7890 <wait>
      for(int j = 0; j < 200; j++){
    24fe:	fe842783          	lw	a5,-24(s0)
    2502:	2785                	addiw	a5,a5,1
    2504:	fef42423          	sw	a5,-24(s0)
    2508:	fe842783          	lw	a5,-24(s0)
    250c:	0007871b          	sext.w	a4,a5
    2510:	0c700793          	li	a5,199
    2514:	fae7d6e3          	bge	a5,a4,24c0 <forkfork+0x56>
      }
      exit(0);
    2518:	4501                	li	a0,0
    251a:	00005097          	auipc	ra,0x5
    251e:	36e080e7          	jalr	878(ra) # 7888 <exit>
  for(int i = 0; i < N; i++){
    2522:	fec42783          	lw	a5,-20(s0)
    2526:	2785                	addiw	a5,a5,1
    2528:	fef42623          	sw	a5,-20(s0)
    252c:	fec42783          	lw	a5,-20(s0)
    2530:	0007871b          	sext.w	a4,a5
    2534:	4785                	li	a5,1
    2536:	f4e7d3e3          	bge	a5,a4,247c <forkfork+0x12>
    }
  }

  int xstatus;
  for(int i = 0; i < N; i++){
    253a:	fe042223          	sw	zero,-28(s0)
    253e:	a83d                	j	257c <forkfork+0x112>
    wait(&xstatus);
    2540:	fd840793          	addi	a5,s0,-40
    2544:	853e                	mv	a0,a5
    2546:	00005097          	auipc	ra,0x5
    254a:	34a080e7          	jalr	842(ra) # 7890 <wait>
    if(xstatus != 0) {
    254e:	fd842783          	lw	a5,-40(s0)
    2552:	c385                	beqz	a5,2572 <forkfork+0x108>
      printf("%s: fork in child failed", s);
    2554:	fc843583          	ld	a1,-56(s0)
    2558:	00006517          	auipc	a0,0x6
    255c:	5c850513          	addi	a0,a0,1480 # 8b20 <malloc+0xb78>
    2560:	00006097          	auipc	ra,0x6
    2564:	856080e7          	jalr	-1962(ra) # 7db6 <printf>
      exit(1);
    2568:	4505                	li	a0,1
    256a:	00005097          	auipc	ra,0x5
    256e:	31e080e7          	jalr	798(ra) # 7888 <exit>
  for(int i = 0; i < N; i++){
    2572:	fe442783          	lw	a5,-28(s0)
    2576:	2785                	addiw	a5,a5,1
    2578:	fef42223          	sw	a5,-28(s0)
    257c:	fe442783          	lw	a5,-28(s0)
    2580:	0007871b          	sext.w	a4,a5
    2584:	4785                	li	a5,1
    2586:	fae7dde3          	bge	a5,a4,2540 <forkfork+0xd6>
    }
  }
}
    258a:	0001                	nop
    258c:	0001                	nop
    258e:	70e2                	ld	ra,56(sp)
    2590:	7442                	ld	s0,48(sp)
    2592:	6121                	addi	sp,sp,64
    2594:	8082                	ret

0000000000002596 <forkforkfork>:

void
forkforkfork(char *s)
{
    2596:	7179                	addi	sp,sp,-48
    2598:	f406                	sd	ra,40(sp)
    259a:	f022                	sd	s0,32(sp)
    259c:	1800                	addi	s0,sp,48
    259e:	fca43c23          	sd	a0,-40(s0)
  unlink("stopforking");
    25a2:	00006517          	auipc	a0,0x6
    25a6:	59e50513          	addi	a0,a0,1438 # 8b40 <malloc+0xb98>
    25aa:	00005097          	auipc	ra,0x5
    25ae:	32e080e7          	jalr	814(ra) # 78d8 <unlink>

  int pid = fork();
    25b2:	00005097          	auipc	ra,0x5
    25b6:	2ce080e7          	jalr	718(ra) # 7880 <fork>
    25ba:	87aa                	mv	a5,a0
    25bc:	fef42623          	sw	a5,-20(s0)
  if(pid < 0){
    25c0:	fec42783          	lw	a5,-20(s0)
    25c4:	2781                	sext.w	a5,a5
    25c6:	0207d163          	bgez	a5,25e8 <forkforkfork+0x52>
    printf("%s: fork failed", s);
    25ca:	fd843583          	ld	a1,-40(s0)
    25ce:	00006517          	auipc	a0,0x6
    25d2:	4ba50513          	addi	a0,a0,1210 # 8a88 <malloc+0xae0>
    25d6:	00005097          	auipc	ra,0x5
    25da:	7e0080e7          	jalr	2016(ra) # 7db6 <printf>
    exit(1);
    25de:	4505                	li	a0,1
    25e0:	00005097          	auipc	ra,0x5
    25e4:	2a8080e7          	jalr	680(ra) # 7888 <exit>
  }
  if(pid == 0){
    25e8:	fec42783          	lw	a5,-20(s0)
    25ec:	2781                	sext.w	a5,a5
    25ee:	efb9                	bnez	a5,264c <forkforkfork+0xb6>
    while(1){
      int fd = open("stopforking", 0);
    25f0:	4581                	li	a1,0
    25f2:	00006517          	auipc	a0,0x6
    25f6:	54e50513          	addi	a0,a0,1358 # 8b40 <malloc+0xb98>
    25fa:	00005097          	auipc	ra,0x5
    25fe:	2ce080e7          	jalr	718(ra) # 78c8 <open>
    2602:	87aa                	mv	a5,a0
    2604:	fef42423          	sw	a5,-24(s0)
      if(fd >= 0){
    2608:	fe842783          	lw	a5,-24(s0)
    260c:	2781                	sext.w	a5,a5
    260e:	0007c763          	bltz	a5,261c <forkforkfork+0x86>
        exit(0);
    2612:	4501                	li	a0,0
    2614:	00005097          	auipc	ra,0x5
    2618:	274080e7          	jalr	628(ra) # 7888 <exit>
      }
      if(fork() < 0){
    261c:	00005097          	auipc	ra,0x5
    2620:	264080e7          	jalr	612(ra) # 7880 <fork>
    2624:	87aa                	mv	a5,a0
    2626:	fc07d5e3          	bgez	a5,25f0 <forkforkfork+0x5a>
        close(open("stopforking", O_CREATE|O_RDWR));
    262a:	20200593          	li	a1,514
    262e:	00006517          	auipc	a0,0x6
    2632:	51250513          	addi	a0,a0,1298 # 8b40 <malloc+0xb98>
    2636:	00005097          	auipc	ra,0x5
    263a:	292080e7          	jalr	658(ra) # 78c8 <open>
    263e:	87aa                	mv	a5,a0
    2640:	853e                	mv	a0,a5
    2642:	00005097          	auipc	ra,0x5
    2646:	26e080e7          	jalr	622(ra) # 78b0 <close>
    while(1){
    264a:	b75d                	j	25f0 <forkforkfork+0x5a>
    }

    exit(0);
  }

  sleep(20); // two seconds
    264c:	4551                	li	a0,20
    264e:	00005097          	auipc	ra,0x5
    2652:	2ca080e7          	jalr	714(ra) # 7918 <sleep>
  close(open("stopforking", O_CREATE|O_RDWR));
    2656:	20200593          	li	a1,514
    265a:	00006517          	auipc	a0,0x6
    265e:	4e650513          	addi	a0,a0,1254 # 8b40 <malloc+0xb98>
    2662:	00005097          	auipc	ra,0x5
    2666:	266080e7          	jalr	614(ra) # 78c8 <open>
    266a:	87aa                	mv	a5,a0
    266c:	853e                	mv	a0,a5
    266e:	00005097          	auipc	ra,0x5
    2672:	242080e7          	jalr	578(ra) # 78b0 <close>
  wait(0);
    2676:	4501                	li	a0,0
    2678:	00005097          	auipc	ra,0x5
    267c:	218080e7          	jalr	536(ra) # 7890 <wait>
  sleep(10); // one second
    2680:	4529                	li	a0,10
    2682:	00005097          	auipc	ra,0x5
    2686:	296080e7          	jalr	662(ra) # 7918 <sleep>
}
    268a:	0001                	nop
    268c:	70a2                	ld	ra,40(sp)
    268e:	7402                	ld	s0,32(sp)
    2690:	6145                	addi	sp,sp,48
    2692:	8082                	ret

0000000000002694 <reparent2>:
// deadlocks against init's wait()? also used to trigger a "panic:
// release" due to exit() releasing a different p->parent->lock than
// it acquired.
void
reparent2(char *s)
{
    2694:	7179                	addi	sp,sp,-48
    2696:	f406                	sd	ra,40(sp)
    2698:	f022                	sd	s0,32(sp)
    269a:	1800                	addi	s0,sp,48
    269c:	fca43c23          	sd	a0,-40(s0)
  for(int i = 0; i < 800; i++){
    26a0:	fe042623          	sw	zero,-20(s0)
    26a4:	a0ad                	j	270e <reparent2+0x7a>
    int pid1 = fork();
    26a6:	00005097          	auipc	ra,0x5
    26aa:	1da080e7          	jalr	474(ra) # 7880 <fork>
    26ae:	87aa                	mv	a5,a0
    26b0:	fef42423          	sw	a5,-24(s0)
    if(pid1 < 0){
    26b4:	fe842783          	lw	a5,-24(s0)
    26b8:	2781                	sext.w	a5,a5
    26ba:	0007df63          	bgez	a5,26d8 <reparent2+0x44>
      printf("fork failed\n");
    26be:	00006517          	auipc	a0,0x6
    26c2:	c6250513          	addi	a0,a0,-926 # 8320 <malloc+0x378>
    26c6:	00005097          	auipc	ra,0x5
    26ca:	6f0080e7          	jalr	1776(ra) # 7db6 <printf>
      exit(1);
    26ce:	4505                	li	a0,1
    26d0:	00005097          	auipc	ra,0x5
    26d4:	1b8080e7          	jalr	440(ra) # 7888 <exit>
    }
    if(pid1 == 0){
    26d8:	fe842783          	lw	a5,-24(s0)
    26dc:	2781                	sext.w	a5,a5
    26de:	ef91                	bnez	a5,26fa <reparent2+0x66>
      fork();
    26e0:	00005097          	auipc	ra,0x5
    26e4:	1a0080e7          	jalr	416(ra) # 7880 <fork>
      fork();
    26e8:	00005097          	auipc	ra,0x5
    26ec:	198080e7          	jalr	408(ra) # 7880 <fork>
      exit(0);
    26f0:	4501                	li	a0,0
    26f2:	00005097          	auipc	ra,0x5
    26f6:	196080e7          	jalr	406(ra) # 7888 <exit>
    }
    wait(0);
    26fa:	4501                	li	a0,0
    26fc:	00005097          	auipc	ra,0x5
    2700:	194080e7          	jalr	404(ra) # 7890 <wait>
  for(int i = 0; i < 800; i++){
    2704:	fec42783          	lw	a5,-20(s0)
    2708:	2785                	addiw	a5,a5,1
    270a:	fef42623          	sw	a5,-20(s0)
    270e:	fec42783          	lw	a5,-20(s0)
    2712:	0007871b          	sext.w	a4,a5
    2716:	31f00793          	li	a5,799
    271a:	f8e7d6e3          	bge	a5,a4,26a6 <reparent2+0x12>
  }

  exit(0);
    271e:	4501                	li	a0,0
    2720:	00005097          	auipc	ra,0x5
    2724:	168080e7          	jalr	360(ra) # 7888 <exit>

0000000000002728 <mem>:
}

// allocate all mem, free it, and allocate again
void
mem(char *s)
{
    2728:	7139                	addi	sp,sp,-64
    272a:	fc06                	sd	ra,56(sp)
    272c:	f822                	sd	s0,48(sp)
    272e:	0080                	addi	s0,sp,64
    2730:	fca43423          	sd	a0,-56(s0)
  void *m1, *m2;
  int pid;

  if((pid = fork()) == 0){
    2734:	00005097          	auipc	ra,0x5
    2738:	14c080e7          	jalr	332(ra) # 7880 <fork>
    273c:	87aa                	mv	a5,a0
    273e:	fef42223          	sw	a5,-28(s0)
    2742:	fe442783          	lw	a5,-28(s0)
    2746:	2781                	sext.w	a5,a5
    2748:	e3c5                	bnez	a5,27e8 <mem+0xc0>
    m1 = 0;
    274a:	fe043423          	sd	zero,-24(s0)
    while((m2 = malloc(10001)) != 0){
    274e:	a811                	j	2762 <mem+0x3a>
      *(char**)m2 = m1;
    2750:	fd843783          	ld	a5,-40(s0)
    2754:	fe843703          	ld	a4,-24(s0)
    2758:	e398                	sd	a4,0(a5)
      m1 = m2;
    275a:	fd843783          	ld	a5,-40(s0)
    275e:	fef43423          	sd	a5,-24(s0)
    while((m2 = malloc(10001)) != 0){
    2762:	6789                	lui	a5,0x2
    2764:	71178513          	addi	a0,a5,1809 # 2711 <reparent2+0x7d>
    2768:	00006097          	auipc	ra,0x6
    276c:	840080e7          	jalr	-1984(ra) # 7fa8 <malloc>
    2770:	fca43c23          	sd	a0,-40(s0)
    2774:	fd843783          	ld	a5,-40(s0)
    2778:	ffe1                	bnez	a5,2750 <mem+0x28>
    }
    while(m1){
    277a:	a005                	j	279a <mem+0x72>
      m2 = *(char**)m1;
    277c:	fe843783          	ld	a5,-24(s0)
    2780:	639c                	ld	a5,0(a5)
    2782:	fcf43c23          	sd	a5,-40(s0)
      free(m1);
    2786:	fe843503          	ld	a0,-24(s0)
    278a:	00005097          	auipc	ra,0x5
    278e:	67c080e7          	jalr	1660(ra) # 7e06 <free>
      m1 = m2;
    2792:	fd843783          	ld	a5,-40(s0)
    2796:	fef43423          	sd	a5,-24(s0)
    while(m1){
    279a:	fe843783          	ld	a5,-24(s0)
    279e:	fff9                	bnez	a5,277c <mem+0x54>
    }
    m1 = malloc(1024*20);
    27a0:	6515                	lui	a0,0x5
    27a2:	00006097          	auipc	ra,0x6
    27a6:	806080e7          	jalr	-2042(ra) # 7fa8 <malloc>
    27aa:	fea43423          	sd	a0,-24(s0)
    if(m1 == 0){
    27ae:	fe843783          	ld	a5,-24(s0)
    27b2:	e385                	bnez	a5,27d2 <mem+0xaa>
      printf("couldn't allocate mem?!!\n", s);
    27b4:	fc843583          	ld	a1,-56(s0)
    27b8:	00006517          	auipc	a0,0x6
    27bc:	39850513          	addi	a0,a0,920 # 8b50 <malloc+0xba8>
    27c0:	00005097          	auipc	ra,0x5
    27c4:	5f6080e7          	jalr	1526(ra) # 7db6 <printf>
      exit(1);
    27c8:	4505                	li	a0,1
    27ca:	00005097          	auipc	ra,0x5
    27ce:	0be080e7          	jalr	190(ra) # 7888 <exit>
    }
    free(m1);
    27d2:	fe843503          	ld	a0,-24(s0)
    27d6:	00005097          	auipc	ra,0x5
    27da:	630080e7          	jalr	1584(ra) # 7e06 <free>
    exit(0);
    27de:	4501                	li	a0,0
    27e0:	00005097          	auipc	ra,0x5
    27e4:	0a8080e7          	jalr	168(ra) # 7888 <exit>
  } else {
    int xstatus;
    wait(&xstatus);
    27e8:	fd440793          	addi	a5,s0,-44
    27ec:	853e                	mv	a0,a5
    27ee:	00005097          	auipc	ra,0x5
    27f2:	0a2080e7          	jalr	162(ra) # 7890 <wait>
    if(xstatus == -1){
    27f6:	fd442783          	lw	a5,-44(s0)
    27fa:	873e                	mv	a4,a5
    27fc:	57fd                	li	a5,-1
    27fe:	00f71763          	bne	a4,a5,280c <mem+0xe4>
      // probably page fault, so might be lazy lab,
      // so OK.
      exit(0);
    2802:	4501                	li	a0,0
    2804:	00005097          	auipc	ra,0x5
    2808:	084080e7          	jalr	132(ra) # 7888 <exit>
    }
    exit(xstatus);
    280c:	fd442783          	lw	a5,-44(s0)
    2810:	853e                	mv	a0,a5
    2812:	00005097          	auipc	ra,0x5
    2816:	076080e7          	jalr	118(ra) # 7888 <exit>

000000000000281a <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(char *s)
{
    281a:	715d                	addi	sp,sp,-80
    281c:	e486                	sd	ra,72(sp)
    281e:	e0a2                	sd	s0,64(sp)
    2820:	0880                	addi	s0,sp,80
    2822:	faa43c23          	sd	a0,-72(s0)
  int fd, pid, i, n, nc, np;
  enum { N = 1000, SZ=10};
  char buf[SZ];

  unlink("sharedfd");
    2826:	00006517          	auipc	a0,0x6
    282a:	34a50513          	addi	a0,a0,842 # 8b70 <malloc+0xbc8>
    282e:	00005097          	auipc	ra,0x5
    2832:	0aa080e7          	jalr	170(ra) # 78d8 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
    2836:	20200593          	li	a1,514
    283a:	00006517          	auipc	a0,0x6
    283e:	33650513          	addi	a0,a0,822 # 8b70 <malloc+0xbc8>
    2842:	00005097          	auipc	ra,0x5
    2846:	086080e7          	jalr	134(ra) # 78c8 <open>
    284a:	87aa                	mv	a5,a0
    284c:	fef42023          	sw	a5,-32(s0)
  if(fd < 0){
    2850:	fe042783          	lw	a5,-32(s0)
    2854:	2781                	sext.w	a5,a5
    2856:	0207d163          	bgez	a5,2878 <sharedfd+0x5e>
    printf("%s: cannot open sharedfd for writing", s);
    285a:	fb843583          	ld	a1,-72(s0)
    285e:	00006517          	auipc	a0,0x6
    2862:	32250513          	addi	a0,a0,802 # 8b80 <malloc+0xbd8>
    2866:	00005097          	auipc	ra,0x5
    286a:	550080e7          	jalr	1360(ra) # 7db6 <printf>
    exit(1);
    286e:	4505                	li	a0,1
    2870:	00005097          	auipc	ra,0x5
    2874:	018080e7          	jalr	24(ra) # 7888 <exit>
  }
  pid = fork();
    2878:	00005097          	auipc	ra,0x5
    287c:	008080e7          	jalr	8(ra) # 7880 <fork>
    2880:	87aa                	mv	a5,a0
    2882:	fcf42e23          	sw	a5,-36(s0)
  memset(buf, pid==0?'c':'p', sizeof(buf));
    2886:	fdc42783          	lw	a5,-36(s0)
    288a:	2781                	sext.w	a5,a5
    288c:	e781                	bnez	a5,2894 <sharedfd+0x7a>
    288e:	06300793          	li	a5,99
    2892:	a019                	j	2898 <sharedfd+0x7e>
    2894:	07000793          	li	a5,112
    2898:	fc840713          	addi	a4,s0,-56
    289c:	4629                	li	a2,10
    289e:	85be                	mv	a1,a5
    28a0:	853a                	mv	a0,a4
    28a2:	00005097          	auipc	ra,0x5
    28a6:	c3c080e7          	jalr	-964(ra) # 74de <memset>
  for(i = 0; i < N; i++){
    28aa:	fe042623          	sw	zero,-20(s0)
    28ae:	a0a9                	j	28f8 <sharedfd+0xde>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
    28b0:	fc840713          	addi	a4,s0,-56
    28b4:	fe042783          	lw	a5,-32(s0)
    28b8:	4629                	li	a2,10
    28ba:	85ba                	mv	a1,a4
    28bc:	853e                	mv	a0,a5
    28be:	00005097          	auipc	ra,0x5
    28c2:	fea080e7          	jalr	-22(ra) # 78a8 <write>
    28c6:	87aa                	mv	a5,a0
    28c8:	873e                	mv	a4,a5
    28ca:	47a9                	li	a5,10
    28cc:	02f70163          	beq	a4,a5,28ee <sharedfd+0xd4>
      printf("%s: write sharedfd failed\n", s);
    28d0:	fb843583          	ld	a1,-72(s0)
    28d4:	00006517          	auipc	a0,0x6
    28d8:	2d450513          	addi	a0,a0,724 # 8ba8 <malloc+0xc00>
    28dc:	00005097          	auipc	ra,0x5
    28e0:	4da080e7          	jalr	1242(ra) # 7db6 <printf>
      exit(1);
    28e4:	4505                	li	a0,1
    28e6:	00005097          	auipc	ra,0x5
    28ea:	fa2080e7          	jalr	-94(ra) # 7888 <exit>
  for(i = 0; i < N; i++){
    28ee:	fec42783          	lw	a5,-20(s0)
    28f2:	2785                	addiw	a5,a5,1
    28f4:	fef42623          	sw	a5,-20(s0)
    28f8:	fec42783          	lw	a5,-20(s0)
    28fc:	0007871b          	sext.w	a4,a5
    2900:	3e700793          	li	a5,999
    2904:	fae7d6e3          	bge	a5,a4,28b0 <sharedfd+0x96>
    }
  }
  if(pid == 0) {
    2908:	fdc42783          	lw	a5,-36(s0)
    290c:	2781                	sext.w	a5,a5
    290e:	e791                	bnez	a5,291a <sharedfd+0x100>
    exit(0);
    2910:	4501                	li	a0,0
    2912:	00005097          	auipc	ra,0x5
    2916:	f76080e7          	jalr	-138(ra) # 7888 <exit>
  } else {
    int xstatus;
    wait(&xstatus);
    291a:	fc440793          	addi	a5,s0,-60
    291e:	853e                	mv	a0,a5
    2920:	00005097          	auipc	ra,0x5
    2924:	f70080e7          	jalr	-144(ra) # 7890 <wait>
    if(xstatus != 0)
    2928:	fc442783          	lw	a5,-60(s0)
    292c:	cb81                	beqz	a5,293c <sharedfd+0x122>
      exit(xstatus);
    292e:	fc442783          	lw	a5,-60(s0)
    2932:	853e                	mv	a0,a5
    2934:	00005097          	auipc	ra,0x5
    2938:	f54080e7          	jalr	-172(ra) # 7888 <exit>
  }

  close(fd);
    293c:	fe042783          	lw	a5,-32(s0)
    2940:	853e                	mv	a0,a5
    2942:	00005097          	auipc	ra,0x5
    2946:	f6e080e7          	jalr	-146(ra) # 78b0 <close>
  fd = open("sharedfd", 0);
    294a:	4581                	li	a1,0
    294c:	00006517          	auipc	a0,0x6
    2950:	22450513          	addi	a0,a0,548 # 8b70 <malloc+0xbc8>
    2954:	00005097          	auipc	ra,0x5
    2958:	f74080e7          	jalr	-140(ra) # 78c8 <open>
    295c:	87aa                	mv	a5,a0
    295e:	fef42023          	sw	a5,-32(s0)
  if(fd < 0){
    2962:	fe042783          	lw	a5,-32(s0)
    2966:	2781                	sext.w	a5,a5
    2968:	0207d163          	bgez	a5,298a <sharedfd+0x170>
    printf("%s: cannot open sharedfd for reading\n", s);
    296c:	fb843583          	ld	a1,-72(s0)
    2970:	00006517          	auipc	a0,0x6
    2974:	25850513          	addi	a0,a0,600 # 8bc8 <malloc+0xc20>
    2978:	00005097          	auipc	ra,0x5
    297c:	43e080e7          	jalr	1086(ra) # 7db6 <printf>
    exit(1);
    2980:	4505                	li	a0,1
    2982:	00005097          	auipc	ra,0x5
    2986:	f06080e7          	jalr	-250(ra) # 7888 <exit>
  }
  nc = np = 0;
    298a:	fe042223          	sw	zero,-28(s0)
    298e:	fe442783          	lw	a5,-28(s0)
    2992:	fef42423          	sw	a5,-24(s0)
  while((n = read(fd, buf, sizeof(buf))) > 0){
    2996:	a08d                	j	29f8 <sharedfd+0x1de>
    for(i = 0; i < sizeof(buf); i++){
    2998:	fe042623          	sw	zero,-20(s0)
    299c:	a881                	j	29ec <sharedfd+0x1d2>
      if(buf[i] == 'c')
    299e:	fec42783          	lw	a5,-20(s0)
    29a2:	ff040713          	addi	a4,s0,-16
    29a6:	97ba                	add	a5,a5,a4
    29a8:	fd87c783          	lbu	a5,-40(a5)
    29ac:	873e                	mv	a4,a5
    29ae:	06300793          	li	a5,99
    29b2:	00f71763          	bne	a4,a5,29c0 <sharedfd+0x1a6>
        nc++;
    29b6:	fe842783          	lw	a5,-24(s0)
    29ba:	2785                	addiw	a5,a5,1
    29bc:	fef42423          	sw	a5,-24(s0)
      if(buf[i] == 'p')
    29c0:	fec42783          	lw	a5,-20(s0)
    29c4:	ff040713          	addi	a4,s0,-16
    29c8:	97ba                	add	a5,a5,a4
    29ca:	fd87c783          	lbu	a5,-40(a5)
    29ce:	873e                	mv	a4,a5
    29d0:	07000793          	li	a5,112
    29d4:	00f71763          	bne	a4,a5,29e2 <sharedfd+0x1c8>
        np++;
    29d8:	fe442783          	lw	a5,-28(s0)
    29dc:	2785                	addiw	a5,a5,1
    29de:	fef42223          	sw	a5,-28(s0)
    for(i = 0; i < sizeof(buf); i++){
    29e2:	fec42783          	lw	a5,-20(s0)
    29e6:	2785                	addiw	a5,a5,1
    29e8:	fef42623          	sw	a5,-20(s0)
    29ec:	fec42783          	lw	a5,-20(s0)
    29f0:	873e                	mv	a4,a5
    29f2:	47a5                	li	a5,9
    29f4:	fae7f5e3          	bgeu	a5,a4,299e <sharedfd+0x184>
  while((n = read(fd, buf, sizeof(buf))) > 0){
    29f8:	fc840713          	addi	a4,s0,-56
    29fc:	fe042783          	lw	a5,-32(s0)
    2a00:	4629                	li	a2,10
    2a02:	85ba                	mv	a1,a4
    2a04:	853e                	mv	a0,a5
    2a06:	00005097          	auipc	ra,0x5
    2a0a:	e9a080e7          	jalr	-358(ra) # 78a0 <read>
    2a0e:	87aa                	mv	a5,a0
    2a10:	fcf42c23          	sw	a5,-40(s0)
    2a14:	fd842783          	lw	a5,-40(s0)
    2a18:	2781                	sext.w	a5,a5
    2a1a:	f6f04fe3          	bgtz	a5,2998 <sharedfd+0x17e>
    }
  }
  close(fd);
    2a1e:	fe042783          	lw	a5,-32(s0)
    2a22:	853e                	mv	a0,a5
    2a24:	00005097          	auipc	ra,0x5
    2a28:	e8c080e7          	jalr	-372(ra) # 78b0 <close>
  unlink("sharedfd");
    2a2c:	00006517          	auipc	a0,0x6
    2a30:	14450513          	addi	a0,a0,324 # 8b70 <malloc+0xbc8>
    2a34:	00005097          	auipc	ra,0x5
    2a38:	ea4080e7          	jalr	-348(ra) # 78d8 <unlink>
  if(nc == N*SZ && np == N*SZ){
    2a3c:	fe842783          	lw	a5,-24(s0)
    2a40:	0007871b          	sext.w	a4,a5
    2a44:	6789                	lui	a5,0x2
    2a46:	71078793          	addi	a5,a5,1808 # 2710 <reparent2+0x7c>
    2a4a:	02f71063          	bne	a4,a5,2a6a <sharedfd+0x250>
    2a4e:	fe442783          	lw	a5,-28(s0)
    2a52:	0007871b          	sext.w	a4,a5
    2a56:	6789                	lui	a5,0x2
    2a58:	71078793          	addi	a5,a5,1808 # 2710 <reparent2+0x7c>
    2a5c:	00f71763          	bne	a4,a5,2a6a <sharedfd+0x250>
    exit(0);
    2a60:	4501                	li	a0,0
    2a62:	00005097          	auipc	ra,0x5
    2a66:	e26080e7          	jalr	-474(ra) # 7888 <exit>
  } else {
    printf("%s: nc/np test fails\n", s);
    2a6a:	fb843583          	ld	a1,-72(s0)
    2a6e:	00006517          	auipc	a0,0x6
    2a72:	18250513          	addi	a0,a0,386 # 8bf0 <malloc+0xc48>
    2a76:	00005097          	auipc	ra,0x5
    2a7a:	340080e7          	jalr	832(ra) # 7db6 <printf>
    exit(1);
    2a7e:	4505                	li	a0,1
    2a80:	00005097          	auipc	ra,0x5
    2a84:	e08080e7          	jalr	-504(ra) # 7888 <exit>

0000000000002a88 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(char *s)
{
    2a88:	7159                	addi	sp,sp,-112
    2a8a:	f486                	sd	ra,104(sp)
    2a8c:	f0a2                	sd	s0,96(sp)
    2a8e:	1880                	addi	s0,sp,112
    2a90:	f8a43c23          	sd	a0,-104(s0)
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    2a94:	00006797          	auipc	a5,0x6
    2a98:	1c478793          	addi	a5,a5,452 # 8c58 <malloc+0xcb0>
    2a9c:	6390                	ld	a2,0(a5)
    2a9e:	6794                	ld	a3,8(a5)
    2aa0:	6b98                	ld	a4,16(a5)
    2aa2:	6f9c                	ld	a5,24(a5)
    2aa4:	fac43423          	sd	a2,-88(s0)
    2aa8:	fad43823          	sd	a3,-80(s0)
    2aac:	fae43c23          	sd	a4,-72(s0)
    2ab0:	fcf43023          	sd	a5,-64(s0)
  char *fname;
  enum { N=12, NCHILD=4, SZ=500 };

  for(pi = 0; pi < NCHILD; pi++){
    2ab4:	fe042023          	sw	zero,-32(s0)
    2ab8:	a281                	j	2bf8 <fourfiles+0x170>
    fname = names[pi];
    2aba:	fe042783          	lw	a5,-32(s0)
    2abe:	078e                	slli	a5,a5,0x3
    2ac0:	ff040713          	addi	a4,s0,-16
    2ac4:	97ba                	add	a5,a5,a4
    2ac6:	fb87b783          	ld	a5,-72(a5)
    2aca:	fcf43c23          	sd	a5,-40(s0)
    unlink(fname);
    2ace:	fd843503          	ld	a0,-40(s0)
    2ad2:	00005097          	auipc	ra,0x5
    2ad6:	e06080e7          	jalr	-506(ra) # 78d8 <unlink>

    pid = fork();
    2ada:	00005097          	auipc	ra,0x5
    2ade:	da6080e7          	jalr	-602(ra) # 7880 <fork>
    2ae2:	87aa                	mv	a5,a0
    2ae4:	fcf42623          	sw	a5,-52(s0)
    if(pid < 0){
    2ae8:	fcc42783          	lw	a5,-52(s0)
    2aec:	2781                	sext.w	a5,a5
    2aee:	0207d163          	bgez	a5,2b10 <fourfiles+0x88>
      printf("fork failed\n", s);
    2af2:	f9843583          	ld	a1,-104(s0)
    2af6:	00006517          	auipc	a0,0x6
    2afa:	82a50513          	addi	a0,a0,-2006 # 8320 <malloc+0x378>
    2afe:	00005097          	auipc	ra,0x5
    2b02:	2b8080e7          	jalr	696(ra) # 7db6 <printf>
      exit(1);
    2b06:	4505                	li	a0,1
    2b08:	00005097          	auipc	ra,0x5
    2b0c:	d80080e7          	jalr	-640(ra) # 7888 <exit>
    }

    if(pid == 0){
    2b10:	fcc42783          	lw	a5,-52(s0)
    2b14:	2781                	sext.w	a5,a5
    2b16:	efe1                	bnez	a5,2bee <fourfiles+0x166>
      fd = open(fname, O_CREATE | O_RDWR);
    2b18:	20200593          	li	a1,514
    2b1c:	fd843503          	ld	a0,-40(s0)
    2b20:	00005097          	auipc	ra,0x5
    2b24:	da8080e7          	jalr	-600(ra) # 78c8 <open>
    2b28:	87aa                	mv	a5,a0
    2b2a:	fcf42a23          	sw	a5,-44(s0)
      if(fd < 0){
    2b2e:	fd442783          	lw	a5,-44(s0)
    2b32:	2781                	sext.w	a5,a5
    2b34:	0207d163          	bgez	a5,2b56 <fourfiles+0xce>
        printf("create failed\n", s);
    2b38:	f9843583          	ld	a1,-104(s0)
    2b3c:	00006517          	auipc	a0,0x6
    2b40:	0cc50513          	addi	a0,a0,204 # 8c08 <malloc+0xc60>
    2b44:	00005097          	auipc	ra,0x5
    2b48:	272080e7          	jalr	626(ra) # 7db6 <printf>
        exit(1);
    2b4c:	4505                	li	a0,1
    2b4e:	00005097          	auipc	ra,0x5
    2b52:	d3a080e7          	jalr	-710(ra) # 7888 <exit>
      }

      memset(buf, '0'+pi, SZ);
    2b56:	fe042783          	lw	a5,-32(s0)
    2b5a:	0307879b          	addiw	a5,a5,48
    2b5e:	2781                	sext.w	a5,a5
    2b60:	1f400613          	li	a2,500
    2b64:	85be                	mv	a1,a5
    2b66:	00009517          	auipc	a0,0x9
    2b6a:	8ea50513          	addi	a0,a0,-1814 # b450 <buf>
    2b6e:	00005097          	auipc	ra,0x5
    2b72:	970080e7          	jalr	-1680(ra) # 74de <memset>
      for(i = 0; i < N; i++){
    2b76:	fe042623          	sw	zero,-20(s0)
    2b7a:	a8b1                	j	2bd6 <fourfiles+0x14e>
        if((n = write(fd, buf, SZ)) != SZ){
    2b7c:	fd442783          	lw	a5,-44(s0)
    2b80:	1f400613          	li	a2,500
    2b84:	00009597          	auipc	a1,0x9
    2b88:	8cc58593          	addi	a1,a1,-1844 # b450 <buf>
    2b8c:	853e                	mv	a0,a5
    2b8e:	00005097          	auipc	ra,0x5
    2b92:	d1a080e7          	jalr	-742(ra) # 78a8 <write>
    2b96:	87aa                	mv	a5,a0
    2b98:	fcf42823          	sw	a5,-48(s0)
    2b9c:	fd042783          	lw	a5,-48(s0)
    2ba0:	0007871b          	sext.w	a4,a5
    2ba4:	1f400793          	li	a5,500
    2ba8:	02f70263          	beq	a4,a5,2bcc <fourfiles+0x144>
          printf("write failed %d\n", n);
    2bac:	fd042783          	lw	a5,-48(s0)
    2bb0:	85be                	mv	a1,a5
    2bb2:	00006517          	auipc	a0,0x6
    2bb6:	06650513          	addi	a0,a0,102 # 8c18 <malloc+0xc70>
    2bba:	00005097          	auipc	ra,0x5
    2bbe:	1fc080e7          	jalr	508(ra) # 7db6 <printf>
          exit(1);
    2bc2:	4505                	li	a0,1
    2bc4:	00005097          	auipc	ra,0x5
    2bc8:	cc4080e7          	jalr	-828(ra) # 7888 <exit>
      for(i = 0; i < N; i++){
    2bcc:	fec42783          	lw	a5,-20(s0)
    2bd0:	2785                	addiw	a5,a5,1
    2bd2:	fef42623          	sw	a5,-20(s0)
    2bd6:	fec42783          	lw	a5,-20(s0)
    2bda:	0007871b          	sext.w	a4,a5
    2bde:	47ad                	li	a5,11
    2be0:	f8e7dee3          	bge	a5,a4,2b7c <fourfiles+0xf4>
        }
      }
      exit(0);
    2be4:	4501                	li	a0,0
    2be6:	00005097          	auipc	ra,0x5
    2bea:	ca2080e7          	jalr	-862(ra) # 7888 <exit>
  for(pi = 0; pi < NCHILD; pi++){
    2bee:	fe042783          	lw	a5,-32(s0)
    2bf2:	2785                	addiw	a5,a5,1
    2bf4:	fef42023          	sw	a5,-32(s0)
    2bf8:	fe042783          	lw	a5,-32(s0)
    2bfc:	0007871b          	sext.w	a4,a5
    2c00:	478d                	li	a5,3
    2c02:	eae7dce3          	bge	a5,a4,2aba <fourfiles+0x32>
    }
  }

  int xstatus;
  for(pi = 0; pi < NCHILD; pi++){
    2c06:	fe042023          	sw	zero,-32(s0)
    2c0a:	a03d                	j	2c38 <fourfiles+0x1b0>
    wait(&xstatus);
    2c0c:	fa440793          	addi	a5,s0,-92
    2c10:	853e                	mv	a0,a5
    2c12:	00005097          	auipc	ra,0x5
    2c16:	c7e080e7          	jalr	-898(ra) # 7890 <wait>
    if(xstatus != 0)
    2c1a:	fa442783          	lw	a5,-92(s0)
    2c1e:	cb81                	beqz	a5,2c2e <fourfiles+0x1a6>
      exit(xstatus);
    2c20:	fa442783          	lw	a5,-92(s0)
    2c24:	853e                	mv	a0,a5
    2c26:	00005097          	auipc	ra,0x5
    2c2a:	c62080e7          	jalr	-926(ra) # 7888 <exit>
  for(pi = 0; pi < NCHILD; pi++){
    2c2e:	fe042783          	lw	a5,-32(s0)
    2c32:	2785                	addiw	a5,a5,1
    2c34:	fef42023          	sw	a5,-32(s0)
    2c38:	fe042783          	lw	a5,-32(s0)
    2c3c:	0007871b          	sext.w	a4,a5
    2c40:	478d                	li	a5,3
    2c42:	fce7d5e3          	bge	a5,a4,2c0c <fourfiles+0x184>
  }

  for(i = 0; i < NCHILD; i++){
    2c46:	fe042623          	sw	zero,-20(s0)
    2c4a:	aa39                	j	2d68 <fourfiles+0x2e0>
    fname = names[i];
    2c4c:	fec42783          	lw	a5,-20(s0)
    2c50:	078e                	slli	a5,a5,0x3
    2c52:	ff040713          	addi	a4,s0,-16
    2c56:	97ba                	add	a5,a5,a4
    2c58:	fb87b783          	ld	a5,-72(a5)
    2c5c:	fcf43c23          	sd	a5,-40(s0)
    fd = open(fname, 0);
    2c60:	4581                	li	a1,0
    2c62:	fd843503          	ld	a0,-40(s0)
    2c66:	00005097          	auipc	ra,0x5
    2c6a:	c62080e7          	jalr	-926(ra) # 78c8 <open>
    2c6e:	87aa                	mv	a5,a0
    2c70:	fcf42a23          	sw	a5,-44(s0)
    total = 0;
    2c74:	fe042223          	sw	zero,-28(s0)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    2c78:	a88d                	j	2cea <fourfiles+0x262>
      for(j = 0; j < n; j++){
    2c7a:	fe042423          	sw	zero,-24(s0)
    2c7e:	a0b9                	j	2ccc <fourfiles+0x244>
        if(buf[j] != '0'+i){
    2c80:	00008717          	auipc	a4,0x8
    2c84:	7d070713          	addi	a4,a4,2000 # b450 <buf>
    2c88:	fe842783          	lw	a5,-24(s0)
    2c8c:	97ba                	add	a5,a5,a4
    2c8e:	0007c783          	lbu	a5,0(a5)
    2c92:	0007871b          	sext.w	a4,a5
    2c96:	fec42783          	lw	a5,-20(s0)
    2c9a:	0307879b          	addiw	a5,a5,48
    2c9e:	2781                	sext.w	a5,a5
    2ca0:	02f70163          	beq	a4,a5,2cc2 <fourfiles+0x23a>
          printf("wrong char\n", s);
    2ca4:	f9843583          	ld	a1,-104(s0)
    2ca8:	00006517          	auipc	a0,0x6
    2cac:	f8850513          	addi	a0,a0,-120 # 8c30 <malloc+0xc88>
    2cb0:	00005097          	auipc	ra,0x5
    2cb4:	106080e7          	jalr	262(ra) # 7db6 <printf>
          exit(1);
    2cb8:	4505                	li	a0,1
    2cba:	00005097          	auipc	ra,0x5
    2cbe:	bce080e7          	jalr	-1074(ra) # 7888 <exit>
      for(j = 0; j < n; j++){
    2cc2:	fe842783          	lw	a5,-24(s0)
    2cc6:	2785                	addiw	a5,a5,1
    2cc8:	fef42423          	sw	a5,-24(s0)
    2ccc:	fe842703          	lw	a4,-24(s0)
    2cd0:	fd042783          	lw	a5,-48(s0)
    2cd4:	2701                	sext.w	a4,a4
    2cd6:	2781                	sext.w	a5,a5
    2cd8:	faf744e3          	blt	a4,a5,2c80 <fourfiles+0x1f8>
        }
      }
      total += n;
    2cdc:	fe442703          	lw	a4,-28(s0)
    2ce0:	fd042783          	lw	a5,-48(s0)
    2ce4:	9fb9                	addw	a5,a5,a4
    2ce6:	fef42223          	sw	a5,-28(s0)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    2cea:	fd442783          	lw	a5,-44(s0)
    2cee:	660d                	lui	a2,0x3
    2cf0:	00008597          	auipc	a1,0x8
    2cf4:	76058593          	addi	a1,a1,1888 # b450 <buf>
    2cf8:	853e                	mv	a0,a5
    2cfa:	00005097          	auipc	ra,0x5
    2cfe:	ba6080e7          	jalr	-1114(ra) # 78a0 <read>
    2d02:	87aa                	mv	a5,a0
    2d04:	fcf42823          	sw	a5,-48(s0)
    2d08:	fd042783          	lw	a5,-48(s0)
    2d0c:	2781                	sext.w	a5,a5
    2d0e:	f6f046e3          	bgtz	a5,2c7a <fourfiles+0x1f2>
    }
    close(fd);
    2d12:	fd442783          	lw	a5,-44(s0)
    2d16:	853e                	mv	a0,a5
    2d18:	00005097          	auipc	ra,0x5
    2d1c:	b98080e7          	jalr	-1128(ra) # 78b0 <close>
    if(total != N*SZ){
    2d20:	fe442783          	lw	a5,-28(s0)
    2d24:	0007871b          	sext.w	a4,a5
    2d28:	6785                	lui	a5,0x1
    2d2a:	77078793          	addi	a5,a5,1904 # 1770 <writebig+0x124>
    2d2e:	02f70263          	beq	a4,a5,2d52 <fourfiles+0x2ca>
      printf("wrong length %d\n", total);
    2d32:	fe442783          	lw	a5,-28(s0)
    2d36:	85be                	mv	a1,a5
    2d38:	00006517          	auipc	a0,0x6
    2d3c:	f0850513          	addi	a0,a0,-248 # 8c40 <malloc+0xc98>
    2d40:	00005097          	auipc	ra,0x5
    2d44:	076080e7          	jalr	118(ra) # 7db6 <printf>
      exit(1);
    2d48:	4505                	li	a0,1
    2d4a:	00005097          	auipc	ra,0x5
    2d4e:	b3e080e7          	jalr	-1218(ra) # 7888 <exit>
    }
    unlink(fname);
    2d52:	fd843503          	ld	a0,-40(s0)
    2d56:	00005097          	auipc	ra,0x5
    2d5a:	b82080e7          	jalr	-1150(ra) # 78d8 <unlink>
  for(i = 0; i < NCHILD; i++){
    2d5e:	fec42783          	lw	a5,-20(s0)
    2d62:	2785                	addiw	a5,a5,1
    2d64:	fef42623          	sw	a5,-20(s0)
    2d68:	fec42783          	lw	a5,-20(s0)
    2d6c:	0007871b          	sext.w	a4,a5
    2d70:	478d                	li	a5,3
    2d72:	ece7dde3          	bge	a5,a4,2c4c <fourfiles+0x1c4>
  }
}
    2d76:	0001                	nop
    2d78:	0001                	nop
    2d7a:	70a6                	ld	ra,104(sp)
    2d7c:	7406                	ld	s0,96(sp)
    2d7e:	6165                	addi	sp,sp,112
    2d80:	8082                	ret

0000000000002d82 <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(char *s)
{
    2d82:	711d                	addi	sp,sp,-96
    2d84:	ec86                	sd	ra,88(sp)
    2d86:	e8a2                	sd	s0,80(sp)
    2d88:	1080                	addi	s0,sp,96
    2d8a:	faa43423          	sd	a0,-88(s0)
  enum { N = 20, NCHILD=4 };
  int pid, i, fd, pi;
  char name[32];

  for(pi = 0; pi < NCHILD; pi++){
    2d8e:	fe042423          	sw	zero,-24(s0)
    2d92:	aa91                	j	2ee6 <createdelete+0x164>
    pid = fork();
    2d94:	00005097          	auipc	ra,0x5
    2d98:	aec080e7          	jalr	-1300(ra) # 7880 <fork>
    2d9c:	87aa                	mv	a5,a0
    2d9e:	fef42023          	sw	a5,-32(s0)
    if(pid < 0){
    2da2:	fe042783          	lw	a5,-32(s0)
    2da6:	2781                	sext.w	a5,a5
    2da8:	0207d163          	bgez	a5,2dca <createdelete+0x48>
      printf("fork failed\n", s);
    2dac:	fa843583          	ld	a1,-88(s0)
    2db0:	00005517          	auipc	a0,0x5
    2db4:	57050513          	addi	a0,a0,1392 # 8320 <malloc+0x378>
    2db8:	00005097          	auipc	ra,0x5
    2dbc:	ffe080e7          	jalr	-2(ra) # 7db6 <printf>
      exit(1);
    2dc0:	4505                	li	a0,1
    2dc2:	00005097          	auipc	ra,0x5
    2dc6:	ac6080e7          	jalr	-1338(ra) # 7888 <exit>
    }

    if(pid == 0){
    2dca:	fe042783          	lw	a5,-32(s0)
    2dce:	2781                	sext.w	a5,a5
    2dd0:	10079663          	bnez	a5,2edc <createdelete+0x15a>
      name[0] = 'p' + pi;
    2dd4:	fe842783          	lw	a5,-24(s0)
    2dd8:	0ff7f793          	andi	a5,a5,255
    2ddc:	0707879b          	addiw	a5,a5,112
    2de0:	0ff7f793          	andi	a5,a5,255
    2de4:	fcf40023          	sb	a5,-64(s0)
      name[2] = '\0';
    2de8:	fc040123          	sb	zero,-62(s0)
      for(i = 0; i < N; i++){
    2dec:	fe042623          	sw	zero,-20(s0)
    2df0:	a8d1                	j	2ec4 <createdelete+0x142>
        name[1] = '0' + i;
    2df2:	fec42783          	lw	a5,-20(s0)
    2df6:	0ff7f793          	andi	a5,a5,255
    2dfa:	0307879b          	addiw	a5,a5,48
    2dfe:	0ff7f793          	andi	a5,a5,255
    2e02:	fcf400a3          	sb	a5,-63(s0)
        fd = open(name, O_CREATE | O_RDWR);
    2e06:	fc040793          	addi	a5,s0,-64
    2e0a:	20200593          	li	a1,514
    2e0e:	853e                	mv	a0,a5
    2e10:	00005097          	auipc	ra,0x5
    2e14:	ab8080e7          	jalr	-1352(ra) # 78c8 <open>
    2e18:	87aa                	mv	a5,a0
    2e1a:	fef42223          	sw	a5,-28(s0)
        if(fd < 0){
    2e1e:	fe442783          	lw	a5,-28(s0)
    2e22:	2781                	sext.w	a5,a5
    2e24:	0207d163          	bgez	a5,2e46 <createdelete+0xc4>
          printf("%s: create failed\n", s);
    2e28:	fa843583          	ld	a1,-88(s0)
    2e2c:	00006517          	auipc	a0,0x6
    2e30:	b4c50513          	addi	a0,a0,-1204 # 8978 <malloc+0x9d0>
    2e34:	00005097          	auipc	ra,0x5
    2e38:	f82080e7          	jalr	-126(ra) # 7db6 <printf>
          exit(1);
    2e3c:	4505                	li	a0,1
    2e3e:	00005097          	auipc	ra,0x5
    2e42:	a4a080e7          	jalr	-1462(ra) # 7888 <exit>
        }
        close(fd);
    2e46:	fe442783          	lw	a5,-28(s0)
    2e4a:	853e                	mv	a0,a5
    2e4c:	00005097          	auipc	ra,0x5
    2e50:	a64080e7          	jalr	-1436(ra) # 78b0 <close>
        if(i > 0 && (i % 2 ) == 0){
    2e54:	fec42783          	lw	a5,-20(s0)
    2e58:	2781                	sext.w	a5,a5
    2e5a:	06f05063          	blez	a5,2eba <createdelete+0x138>
    2e5e:	fec42783          	lw	a5,-20(s0)
    2e62:	8b85                	andi	a5,a5,1
    2e64:	2781                	sext.w	a5,a5
    2e66:	ebb1                	bnez	a5,2eba <createdelete+0x138>
          name[1] = '0' + (i / 2);
    2e68:	fec42783          	lw	a5,-20(s0)
    2e6c:	01f7d71b          	srliw	a4,a5,0x1f
    2e70:	9fb9                	addw	a5,a5,a4
    2e72:	4017d79b          	sraiw	a5,a5,0x1
    2e76:	2781                	sext.w	a5,a5
    2e78:	0ff7f793          	andi	a5,a5,255
    2e7c:	0307879b          	addiw	a5,a5,48
    2e80:	0ff7f793          	andi	a5,a5,255
    2e84:	fcf400a3          	sb	a5,-63(s0)
          if(unlink(name) < 0){
    2e88:	fc040793          	addi	a5,s0,-64
    2e8c:	853e                	mv	a0,a5
    2e8e:	00005097          	auipc	ra,0x5
    2e92:	a4a080e7          	jalr	-1462(ra) # 78d8 <unlink>
    2e96:	87aa                	mv	a5,a0
    2e98:	0207d163          	bgez	a5,2eba <createdelete+0x138>
            printf("%s: unlink failed\n", s);
    2e9c:	fa843583          	ld	a1,-88(s0)
    2ea0:	00006517          	auipc	a0,0x6
    2ea4:	82850513          	addi	a0,a0,-2008 # 86c8 <malloc+0x720>
    2ea8:	00005097          	auipc	ra,0x5
    2eac:	f0e080e7          	jalr	-242(ra) # 7db6 <printf>
            exit(1);
    2eb0:	4505                	li	a0,1
    2eb2:	00005097          	auipc	ra,0x5
    2eb6:	9d6080e7          	jalr	-1578(ra) # 7888 <exit>
      for(i = 0; i < N; i++){
    2eba:	fec42783          	lw	a5,-20(s0)
    2ebe:	2785                	addiw	a5,a5,1
    2ec0:	fef42623          	sw	a5,-20(s0)
    2ec4:	fec42783          	lw	a5,-20(s0)
    2ec8:	0007871b          	sext.w	a4,a5
    2ecc:	47cd                	li	a5,19
    2ece:	f2e7d2e3          	bge	a5,a4,2df2 <createdelete+0x70>
          }
        }
      }
      exit(0);
    2ed2:	4501                	li	a0,0
    2ed4:	00005097          	auipc	ra,0x5
    2ed8:	9b4080e7          	jalr	-1612(ra) # 7888 <exit>
  for(pi = 0; pi < NCHILD; pi++){
    2edc:	fe842783          	lw	a5,-24(s0)
    2ee0:	2785                	addiw	a5,a5,1
    2ee2:	fef42423          	sw	a5,-24(s0)
    2ee6:	fe842783          	lw	a5,-24(s0)
    2eea:	0007871b          	sext.w	a4,a5
    2eee:	478d                	li	a5,3
    2ef0:	eae7d2e3          	bge	a5,a4,2d94 <createdelete+0x12>
    }
  }

  int xstatus;
  for(pi = 0; pi < NCHILD; pi++){
    2ef4:	fe042423          	sw	zero,-24(s0)
    2ef8:	a02d                	j	2f22 <createdelete+0x1a0>
    wait(&xstatus);
    2efa:	fbc40793          	addi	a5,s0,-68
    2efe:	853e                	mv	a0,a5
    2f00:	00005097          	auipc	ra,0x5
    2f04:	990080e7          	jalr	-1648(ra) # 7890 <wait>
    if(xstatus != 0)
    2f08:	fbc42783          	lw	a5,-68(s0)
    2f0c:	c791                	beqz	a5,2f18 <createdelete+0x196>
      exit(1);
    2f0e:	4505                	li	a0,1
    2f10:	00005097          	auipc	ra,0x5
    2f14:	978080e7          	jalr	-1672(ra) # 7888 <exit>
  for(pi = 0; pi < NCHILD; pi++){
    2f18:	fe842783          	lw	a5,-24(s0)
    2f1c:	2785                	addiw	a5,a5,1
    2f1e:	fef42423          	sw	a5,-24(s0)
    2f22:	fe842783          	lw	a5,-24(s0)
    2f26:	0007871b          	sext.w	a4,a5
    2f2a:	478d                	li	a5,3
    2f2c:	fce7d7e3          	bge	a5,a4,2efa <createdelete+0x178>
  }

  name[0] = name[1] = name[2] = 0;
    2f30:	fc040123          	sb	zero,-62(s0)
    2f34:	fc244783          	lbu	a5,-62(s0)
    2f38:	fcf400a3          	sb	a5,-63(s0)
    2f3c:	fc144783          	lbu	a5,-63(s0)
    2f40:	fcf40023          	sb	a5,-64(s0)
  for(i = 0; i < N; i++){
    2f44:	fe042623          	sw	zero,-20(s0)
    2f48:	a229                	j	3052 <createdelete+0x2d0>
    for(pi = 0; pi < NCHILD; pi++){
    2f4a:	fe042423          	sw	zero,-24(s0)
    2f4e:	a0f5                	j	303a <createdelete+0x2b8>
      name[0] = 'p' + pi;
    2f50:	fe842783          	lw	a5,-24(s0)
    2f54:	0ff7f793          	andi	a5,a5,255
    2f58:	0707879b          	addiw	a5,a5,112
    2f5c:	0ff7f793          	andi	a5,a5,255
    2f60:	fcf40023          	sb	a5,-64(s0)
      name[1] = '0' + i;
    2f64:	fec42783          	lw	a5,-20(s0)
    2f68:	0ff7f793          	andi	a5,a5,255
    2f6c:	0307879b          	addiw	a5,a5,48
    2f70:	0ff7f793          	andi	a5,a5,255
    2f74:	fcf400a3          	sb	a5,-63(s0)
      fd = open(name, 0);
    2f78:	fc040793          	addi	a5,s0,-64
    2f7c:	4581                	li	a1,0
    2f7e:	853e                	mv	a0,a5
    2f80:	00005097          	auipc	ra,0x5
    2f84:	948080e7          	jalr	-1720(ra) # 78c8 <open>
    2f88:	87aa                	mv	a5,a0
    2f8a:	fef42223          	sw	a5,-28(s0)
      if((i == 0 || i >= N/2) && fd < 0){
    2f8e:	fec42783          	lw	a5,-20(s0)
    2f92:	2781                	sext.w	a5,a5
    2f94:	cb81                	beqz	a5,2fa4 <createdelete+0x222>
    2f96:	fec42783          	lw	a5,-20(s0)
    2f9a:	0007871b          	sext.w	a4,a5
    2f9e:	47a5                	li	a5,9
    2fa0:	02e7d963          	bge	a5,a4,2fd2 <createdelete+0x250>
    2fa4:	fe442783          	lw	a5,-28(s0)
    2fa8:	2781                	sext.w	a5,a5
    2faa:	0207d463          	bgez	a5,2fd2 <createdelete+0x250>
        printf("%s: oops createdelete %s didn't exist\n", s, name);
    2fae:	fc040793          	addi	a5,s0,-64
    2fb2:	863e                	mv	a2,a5
    2fb4:	fa843583          	ld	a1,-88(s0)
    2fb8:	00006517          	auipc	a0,0x6
    2fbc:	cc050513          	addi	a0,a0,-832 # 8c78 <malloc+0xcd0>
    2fc0:	00005097          	auipc	ra,0x5
    2fc4:	df6080e7          	jalr	-522(ra) # 7db6 <printf>
        exit(1);
    2fc8:	4505                	li	a0,1
    2fca:	00005097          	auipc	ra,0x5
    2fce:	8be080e7          	jalr	-1858(ra) # 7888 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    2fd2:	fec42783          	lw	a5,-20(s0)
    2fd6:	2781                	sext.w	a5,a5
    2fd8:	04f05063          	blez	a5,3018 <createdelete+0x296>
    2fdc:	fec42783          	lw	a5,-20(s0)
    2fe0:	0007871b          	sext.w	a4,a5
    2fe4:	47a5                	li	a5,9
    2fe6:	02e7c963          	blt	a5,a4,3018 <createdelete+0x296>
    2fea:	fe442783          	lw	a5,-28(s0)
    2fee:	2781                	sext.w	a5,a5
    2ff0:	0207c463          	bltz	a5,3018 <createdelete+0x296>
        printf("%s: oops createdelete %s did exist\n", s, name);
    2ff4:	fc040793          	addi	a5,s0,-64
    2ff8:	863e                	mv	a2,a5
    2ffa:	fa843583          	ld	a1,-88(s0)
    2ffe:	00006517          	auipc	a0,0x6
    3002:	ca250513          	addi	a0,a0,-862 # 8ca0 <malloc+0xcf8>
    3006:	00005097          	auipc	ra,0x5
    300a:	db0080e7          	jalr	-592(ra) # 7db6 <printf>
        exit(1);
    300e:	4505                	li	a0,1
    3010:	00005097          	auipc	ra,0x5
    3014:	878080e7          	jalr	-1928(ra) # 7888 <exit>
      }
      if(fd >= 0)
    3018:	fe442783          	lw	a5,-28(s0)
    301c:	2781                	sext.w	a5,a5
    301e:	0007c963          	bltz	a5,3030 <createdelete+0x2ae>
        close(fd);
    3022:	fe442783          	lw	a5,-28(s0)
    3026:	853e                	mv	a0,a5
    3028:	00005097          	auipc	ra,0x5
    302c:	888080e7          	jalr	-1912(ra) # 78b0 <close>
    for(pi = 0; pi < NCHILD; pi++){
    3030:	fe842783          	lw	a5,-24(s0)
    3034:	2785                	addiw	a5,a5,1
    3036:	fef42423          	sw	a5,-24(s0)
    303a:	fe842783          	lw	a5,-24(s0)
    303e:	0007871b          	sext.w	a4,a5
    3042:	478d                	li	a5,3
    3044:	f0e7d6e3          	bge	a5,a4,2f50 <createdelete+0x1ce>
  for(i = 0; i < N; i++){
    3048:	fec42783          	lw	a5,-20(s0)
    304c:	2785                	addiw	a5,a5,1
    304e:	fef42623          	sw	a5,-20(s0)
    3052:	fec42783          	lw	a5,-20(s0)
    3056:	0007871b          	sext.w	a4,a5
    305a:	47cd                	li	a5,19
    305c:	eee7d7e3          	bge	a5,a4,2f4a <createdelete+0x1c8>
    }
  }

  for(i = 0; i < N; i++){
    3060:	fe042623          	sw	zero,-20(s0)
    3064:	a085                	j	30c4 <createdelete+0x342>
    for(pi = 0; pi < NCHILD; pi++){
    3066:	fe042423          	sw	zero,-24(s0)
    306a:	a089                	j	30ac <createdelete+0x32a>
      name[0] = 'p' + i;
    306c:	fec42783          	lw	a5,-20(s0)
    3070:	0ff7f793          	andi	a5,a5,255
    3074:	0707879b          	addiw	a5,a5,112
    3078:	0ff7f793          	andi	a5,a5,255
    307c:	fcf40023          	sb	a5,-64(s0)
      name[1] = '0' + i;
    3080:	fec42783          	lw	a5,-20(s0)
    3084:	0ff7f793          	andi	a5,a5,255
    3088:	0307879b          	addiw	a5,a5,48
    308c:	0ff7f793          	andi	a5,a5,255
    3090:	fcf400a3          	sb	a5,-63(s0)
      unlink(name);
    3094:	fc040793          	addi	a5,s0,-64
    3098:	853e                	mv	a0,a5
    309a:	00005097          	auipc	ra,0x5
    309e:	83e080e7          	jalr	-1986(ra) # 78d8 <unlink>
    for(pi = 0; pi < NCHILD; pi++){
    30a2:	fe842783          	lw	a5,-24(s0)
    30a6:	2785                	addiw	a5,a5,1
    30a8:	fef42423          	sw	a5,-24(s0)
    30ac:	fe842783          	lw	a5,-24(s0)
    30b0:	0007871b          	sext.w	a4,a5
    30b4:	478d                	li	a5,3
    30b6:	fae7dbe3          	bge	a5,a4,306c <createdelete+0x2ea>
  for(i = 0; i < N; i++){
    30ba:	fec42783          	lw	a5,-20(s0)
    30be:	2785                	addiw	a5,a5,1
    30c0:	fef42623          	sw	a5,-20(s0)
    30c4:	fec42783          	lw	a5,-20(s0)
    30c8:	0007871b          	sext.w	a4,a5
    30cc:	47cd                	li	a5,19
    30ce:	f8e7dce3          	bge	a5,a4,3066 <createdelete+0x2e4>
    }
  }
}
    30d2:	0001                	nop
    30d4:	0001                	nop
    30d6:	60e6                	ld	ra,88(sp)
    30d8:	6446                	ld	s0,80(sp)
    30da:	6125                	addi	sp,sp,96
    30dc:	8082                	ret

00000000000030de <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(char *s)
{
    30de:	7179                	addi	sp,sp,-48
    30e0:	f406                	sd	ra,40(sp)
    30e2:	f022                	sd	s0,32(sp)
    30e4:	1800                	addi	s0,sp,48
    30e6:	fca43c23          	sd	a0,-40(s0)
  enum { SZ = 5 };
  int fd, fd1;

  fd = open("unlinkread", O_CREATE | O_RDWR);
    30ea:	20200593          	li	a1,514
    30ee:	00006517          	auipc	a0,0x6
    30f2:	bda50513          	addi	a0,a0,-1062 # 8cc8 <malloc+0xd20>
    30f6:	00004097          	auipc	ra,0x4
    30fa:	7d2080e7          	jalr	2002(ra) # 78c8 <open>
    30fe:	87aa                	mv	a5,a0
    3100:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    3104:	fec42783          	lw	a5,-20(s0)
    3108:	2781                	sext.w	a5,a5
    310a:	0207d163          	bgez	a5,312c <unlinkread+0x4e>
    printf("%s: create unlinkread failed\n", s);
    310e:	fd843583          	ld	a1,-40(s0)
    3112:	00006517          	auipc	a0,0x6
    3116:	bc650513          	addi	a0,a0,-1082 # 8cd8 <malloc+0xd30>
    311a:	00005097          	auipc	ra,0x5
    311e:	c9c080e7          	jalr	-868(ra) # 7db6 <printf>
    exit(1);
    3122:	4505                	li	a0,1
    3124:	00004097          	auipc	ra,0x4
    3128:	764080e7          	jalr	1892(ra) # 7888 <exit>
  }
  write(fd, "hello", SZ);
    312c:	fec42783          	lw	a5,-20(s0)
    3130:	4615                	li	a2,5
    3132:	00006597          	auipc	a1,0x6
    3136:	bc658593          	addi	a1,a1,-1082 # 8cf8 <malloc+0xd50>
    313a:	853e                	mv	a0,a5
    313c:	00004097          	auipc	ra,0x4
    3140:	76c080e7          	jalr	1900(ra) # 78a8 <write>
  close(fd);
    3144:	fec42783          	lw	a5,-20(s0)
    3148:	853e                	mv	a0,a5
    314a:	00004097          	auipc	ra,0x4
    314e:	766080e7          	jalr	1894(ra) # 78b0 <close>

  fd = open("unlinkread", O_RDWR);
    3152:	4589                	li	a1,2
    3154:	00006517          	auipc	a0,0x6
    3158:	b7450513          	addi	a0,a0,-1164 # 8cc8 <malloc+0xd20>
    315c:	00004097          	auipc	ra,0x4
    3160:	76c080e7          	jalr	1900(ra) # 78c8 <open>
    3164:	87aa                	mv	a5,a0
    3166:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    316a:	fec42783          	lw	a5,-20(s0)
    316e:	2781                	sext.w	a5,a5
    3170:	0207d163          	bgez	a5,3192 <unlinkread+0xb4>
    printf("%s: open unlinkread failed\n", s);
    3174:	fd843583          	ld	a1,-40(s0)
    3178:	00006517          	auipc	a0,0x6
    317c:	b8850513          	addi	a0,a0,-1144 # 8d00 <malloc+0xd58>
    3180:	00005097          	auipc	ra,0x5
    3184:	c36080e7          	jalr	-970(ra) # 7db6 <printf>
    exit(1);
    3188:	4505                	li	a0,1
    318a:	00004097          	auipc	ra,0x4
    318e:	6fe080e7          	jalr	1790(ra) # 7888 <exit>
  }
  if(unlink("unlinkread") != 0){
    3192:	00006517          	auipc	a0,0x6
    3196:	b3650513          	addi	a0,a0,-1226 # 8cc8 <malloc+0xd20>
    319a:	00004097          	auipc	ra,0x4
    319e:	73e080e7          	jalr	1854(ra) # 78d8 <unlink>
    31a2:	87aa                	mv	a5,a0
    31a4:	c385                	beqz	a5,31c4 <unlinkread+0xe6>
    printf("%s: unlink unlinkread failed\n", s);
    31a6:	fd843583          	ld	a1,-40(s0)
    31aa:	00006517          	auipc	a0,0x6
    31ae:	b7650513          	addi	a0,a0,-1162 # 8d20 <malloc+0xd78>
    31b2:	00005097          	auipc	ra,0x5
    31b6:	c04080e7          	jalr	-1020(ra) # 7db6 <printf>
    exit(1);
    31ba:	4505                	li	a0,1
    31bc:	00004097          	auipc	ra,0x4
    31c0:	6cc080e7          	jalr	1740(ra) # 7888 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    31c4:	20200593          	li	a1,514
    31c8:	00006517          	auipc	a0,0x6
    31cc:	b0050513          	addi	a0,a0,-1280 # 8cc8 <malloc+0xd20>
    31d0:	00004097          	auipc	ra,0x4
    31d4:	6f8080e7          	jalr	1784(ra) # 78c8 <open>
    31d8:	87aa                	mv	a5,a0
    31da:	fef42423          	sw	a5,-24(s0)
  write(fd1, "yyy", 3);
    31de:	fe842783          	lw	a5,-24(s0)
    31e2:	460d                	li	a2,3
    31e4:	00006597          	auipc	a1,0x6
    31e8:	b5c58593          	addi	a1,a1,-1188 # 8d40 <malloc+0xd98>
    31ec:	853e                	mv	a0,a5
    31ee:	00004097          	auipc	ra,0x4
    31f2:	6ba080e7          	jalr	1722(ra) # 78a8 <write>
  close(fd1);
    31f6:	fe842783          	lw	a5,-24(s0)
    31fa:	853e                	mv	a0,a5
    31fc:	00004097          	auipc	ra,0x4
    3200:	6b4080e7          	jalr	1716(ra) # 78b0 <close>

  if(read(fd, buf, sizeof(buf)) != SZ){
    3204:	fec42783          	lw	a5,-20(s0)
    3208:	660d                	lui	a2,0x3
    320a:	00008597          	auipc	a1,0x8
    320e:	24658593          	addi	a1,a1,582 # b450 <buf>
    3212:	853e                	mv	a0,a5
    3214:	00004097          	auipc	ra,0x4
    3218:	68c080e7          	jalr	1676(ra) # 78a0 <read>
    321c:	87aa                	mv	a5,a0
    321e:	873e                	mv	a4,a5
    3220:	4795                	li	a5,5
    3222:	02f70163          	beq	a4,a5,3244 <unlinkread+0x166>
    printf("%s: unlinkread read failed", s);
    3226:	fd843583          	ld	a1,-40(s0)
    322a:	00006517          	auipc	a0,0x6
    322e:	b1e50513          	addi	a0,a0,-1250 # 8d48 <malloc+0xda0>
    3232:	00005097          	auipc	ra,0x5
    3236:	b84080e7          	jalr	-1148(ra) # 7db6 <printf>
    exit(1);
    323a:	4505                	li	a0,1
    323c:	00004097          	auipc	ra,0x4
    3240:	64c080e7          	jalr	1612(ra) # 7888 <exit>
  }
  if(buf[0] != 'h'){
    3244:	00008797          	auipc	a5,0x8
    3248:	20c78793          	addi	a5,a5,524 # b450 <buf>
    324c:	0007c783          	lbu	a5,0(a5)
    3250:	873e                	mv	a4,a5
    3252:	06800793          	li	a5,104
    3256:	02f70163          	beq	a4,a5,3278 <unlinkread+0x19a>
    printf("%s: unlinkread wrong data\n", s);
    325a:	fd843583          	ld	a1,-40(s0)
    325e:	00006517          	auipc	a0,0x6
    3262:	b0a50513          	addi	a0,a0,-1270 # 8d68 <malloc+0xdc0>
    3266:	00005097          	auipc	ra,0x5
    326a:	b50080e7          	jalr	-1200(ra) # 7db6 <printf>
    exit(1);
    326e:	4505                	li	a0,1
    3270:	00004097          	auipc	ra,0x4
    3274:	618080e7          	jalr	1560(ra) # 7888 <exit>
  }
  if(write(fd, buf, 10) != 10){
    3278:	fec42783          	lw	a5,-20(s0)
    327c:	4629                	li	a2,10
    327e:	00008597          	auipc	a1,0x8
    3282:	1d258593          	addi	a1,a1,466 # b450 <buf>
    3286:	853e                	mv	a0,a5
    3288:	00004097          	auipc	ra,0x4
    328c:	620080e7          	jalr	1568(ra) # 78a8 <write>
    3290:	87aa                	mv	a5,a0
    3292:	873e                	mv	a4,a5
    3294:	47a9                	li	a5,10
    3296:	02f70163          	beq	a4,a5,32b8 <unlinkread+0x1da>
    printf("%s: unlinkread write failed\n", s);
    329a:	fd843583          	ld	a1,-40(s0)
    329e:	00006517          	auipc	a0,0x6
    32a2:	aea50513          	addi	a0,a0,-1302 # 8d88 <malloc+0xde0>
    32a6:	00005097          	auipc	ra,0x5
    32aa:	b10080e7          	jalr	-1264(ra) # 7db6 <printf>
    exit(1);
    32ae:	4505                	li	a0,1
    32b0:	00004097          	auipc	ra,0x4
    32b4:	5d8080e7          	jalr	1496(ra) # 7888 <exit>
  }
  close(fd);
    32b8:	fec42783          	lw	a5,-20(s0)
    32bc:	853e                	mv	a0,a5
    32be:	00004097          	auipc	ra,0x4
    32c2:	5f2080e7          	jalr	1522(ra) # 78b0 <close>
  unlink("unlinkread");
    32c6:	00006517          	auipc	a0,0x6
    32ca:	a0250513          	addi	a0,a0,-1534 # 8cc8 <malloc+0xd20>
    32ce:	00004097          	auipc	ra,0x4
    32d2:	60a080e7          	jalr	1546(ra) # 78d8 <unlink>
}
    32d6:	0001                	nop
    32d8:	70a2                	ld	ra,40(sp)
    32da:	7402                	ld	s0,32(sp)
    32dc:	6145                	addi	sp,sp,48
    32de:	8082                	ret

00000000000032e0 <linktest>:

void
linktest(char *s)
{
    32e0:	7179                	addi	sp,sp,-48
    32e2:	f406                	sd	ra,40(sp)
    32e4:	f022                	sd	s0,32(sp)
    32e6:	1800                	addi	s0,sp,48
    32e8:	fca43c23          	sd	a0,-40(s0)
  enum { SZ = 5 };
  int fd;

  unlink("lf1");
    32ec:	00006517          	auipc	a0,0x6
    32f0:	abc50513          	addi	a0,a0,-1348 # 8da8 <malloc+0xe00>
    32f4:	00004097          	auipc	ra,0x4
    32f8:	5e4080e7          	jalr	1508(ra) # 78d8 <unlink>
  unlink("lf2");
    32fc:	00006517          	auipc	a0,0x6
    3300:	ab450513          	addi	a0,a0,-1356 # 8db0 <malloc+0xe08>
    3304:	00004097          	auipc	ra,0x4
    3308:	5d4080e7          	jalr	1492(ra) # 78d8 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    330c:	20200593          	li	a1,514
    3310:	00006517          	auipc	a0,0x6
    3314:	a9850513          	addi	a0,a0,-1384 # 8da8 <malloc+0xe00>
    3318:	00004097          	auipc	ra,0x4
    331c:	5b0080e7          	jalr	1456(ra) # 78c8 <open>
    3320:	87aa                	mv	a5,a0
    3322:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    3326:	fec42783          	lw	a5,-20(s0)
    332a:	2781                	sext.w	a5,a5
    332c:	0207d163          	bgez	a5,334e <linktest+0x6e>
    printf("%s: create lf1 failed\n", s);
    3330:	fd843583          	ld	a1,-40(s0)
    3334:	00006517          	auipc	a0,0x6
    3338:	a8450513          	addi	a0,a0,-1404 # 8db8 <malloc+0xe10>
    333c:	00005097          	auipc	ra,0x5
    3340:	a7a080e7          	jalr	-1414(ra) # 7db6 <printf>
    exit(1);
    3344:	4505                	li	a0,1
    3346:	00004097          	auipc	ra,0x4
    334a:	542080e7          	jalr	1346(ra) # 7888 <exit>
  }
  if(write(fd, "hello", SZ) != SZ){
    334e:	fec42783          	lw	a5,-20(s0)
    3352:	4615                	li	a2,5
    3354:	00006597          	auipc	a1,0x6
    3358:	9a458593          	addi	a1,a1,-1628 # 8cf8 <malloc+0xd50>
    335c:	853e                	mv	a0,a5
    335e:	00004097          	auipc	ra,0x4
    3362:	54a080e7          	jalr	1354(ra) # 78a8 <write>
    3366:	87aa                	mv	a5,a0
    3368:	873e                	mv	a4,a5
    336a:	4795                	li	a5,5
    336c:	02f70163          	beq	a4,a5,338e <linktest+0xae>
    printf("%s: write lf1 failed\n", s);
    3370:	fd843583          	ld	a1,-40(s0)
    3374:	00006517          	auipc	a0,0x6
    3378:	a5c50513          	addi	a0,a0,-1444 # 8dd0 <malloc+0xe28>
    337c:	00005097          	auipc	ra,0x5
    3380:	a3a080e7          	jalr	-1478(ra) # 7db6 <printf>
    exit(1);
    3384:	4505                	li	a0,1
    3386:	00004097          	auipc	ra,0x4
    338a:	502080e7          	jalr	1282(ra) # 7888 <exit>
  }
  close(fd);
    338e:	fec42783          	lw	a5,-20(s0)
    3392:	853e                	mv	a0,a5
    3394:	00004097          	auipc	ra,0x4
    3398:	51c080e7          	jalr	1308(ra) # 78b0 <close>

  if(link("lf1", "lf2") < 0){
    339c:	00006597          	auipc	a1,0x6
    33a0:	a1458593          	addi	a1,a1,-1516 # 8db0 <malloc+0xe08>
    33a4:	00006517          	auipc	a0,0x6
    33a8:	a0450513          	addi	a0,a0,-1532 # 8da8 <malloc+0xe00>
    33ac:	00004097          	auipc	ra,0x4
    33b0:	53c080e7          	jalr	1340(ra) # 78e8 <link>
    33b4:	87aa                	mv	a5,a0
    33b6:	0207d163          	bgez	a5,33d8 <linktest+0xf8>
    printf("%s: link lf1 lf2 failed\n", s);
    33ba:	fd843583          	ld	a1,-40(s0)
    33be:	00006517          	auipc	a0,0x6
    33c2:	a2a50513          	addi	a0,a0,-1494 # 8de8 <malloc+0xe40>
    33c6:	00005097          	auipc	ra,0x5
    33ca:	9f0080e7          	jalr	-1552(ra) # 7db6 <printf>
    exit(1);
    33ce:	4505                	li	a0,1
    33d0:	00004097          	auipc	ra,0x4
    33d4:	4b8080e7          	jalr	1208(ra) # 7888 <exit>
  }
  unlink("lf1");
    33d8:	00006517          	auipc	a0,0x6
    33dc:	9d050513          	addi	a0,a0,-1584 # 8da8 <malloc+0xe00>
    33e0:	00004097          	auipc	ra,0x4
    33e4:	4f8080e7          	jalr	1272(ra) # 78d8 <unlink>

  if(open("lf1", 0) >= 0){
    33e8:	4581                	li	a1,0
    33ea:	00006517          	auipc	a0,0x6
    33ee:	9be50513          	addi	a0,a0,-1602 # 8da8 <malloc+0xe00>
    33f2:	00004097          	auipc	ra,0x4
    33f6:	4d6080e7          	jalr	1238(ra) # 78c8 <open>
    33fa:	87aa                	mv	a5,a0
    33fc:	0207c163          	bltz	a5,341e <linktest+0x13e>
    printf("%s: unlinked lf1 but it is still there!\n", s);
    3400:	fd843583          	ld	a1,-40(s0)
    3404:	00006517          	auipc	a0,0x6
    3408:	a0450513          	addi	a0,a0,-1532 # 8e08 <malloc+0xe60>
    340c:	00005097          	auipc	ra,0x5
    3410:	9aa080e7          	jalr	-1622(ra) # 7db6 <printf>
    exit(1);
    3414:	4505                	li	a0,1
    3416:	00004097          	auipc	ra,0x4
    341a:	472080e7          	jalr	1138(ra) # 7888 <exit>
  }

  fd = open("lf2", 0);
    341e:	4581                	li	a1,0
    3420:	00006517          	auipc	a0,0x6
    3424:	99050513          	addi	a0,a0,-1648 # 8db0 <malloc+0xe08>
    3428:	00004097          	auipc	ra,0x4
    342c:	4a0080e7          	jalr	1184(ra) # 78c8 <open>
    3430:	87aa                	mv	a5,a0
    3432:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    3436:	fec42783          	lw	a5,-20(s0)
    343a:	2781                	sext.w	a5,a5
    343c:	0207d163          	bgez	a5,345e <linktest+0x17e>
    printf("%s: open lf2 failed\n", s);
    3440:	fd843583          	ld	a1,-40(s0)
    3444:	00006517          	auipc	a0,0x6
    3448:	9f450513          	addi	a0,a0,-1548 # 8e38 <malloc+0xe90>
    344c:	00005097          	auipc	ra,0x5
    3450:	96a080e7          	jalr	-1686(ra) # 7db6 <printf>
    exit(1);
    3454:	4505                	li	a0,1
    3456:	00004097          	auipc	ra,0x4
    345a:	432080e7          	jalr	1074(ra) # 7888 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != SZ){
    345e:	fec42783          	lw	a5,-20(s0)
    3462:	660d                	lui	a2,0x3
    3464:	00008597          	auipc	a1,0x8
    3468:	fec58593          	addi	a1,a1,-20 # b450 <buf>
    346c:	853e                	mv	a0,a5
    346e:	00004097          	auipc	ra,0x4
    3472:	432080e7          	jalr	1074(ra) # 78a0 <read>
    3476:	87aa                	mv	a5,a0
    3478:	873e                	mv	a4,a5
    347a:	4795                	li	a5,5
    347c:	02f70163          	beq	a4,a5,349e <linktest+0x1be>
    printf("%s: read lf2 failed\n", s);
    3480:	fd843583          	ld	a1,-40(s0)
    3484:	00006517          	auipc	a0,0x6
    3488:	9cc50513          	addi	a0,a0,-1588 # 8e50 <malloc+0xea8>
    348c:	00005097          	auipc	ra,0x5
    3490:	92a080e7          	jalr	-1750(ra) # 7db6 <printf>
    exit(1);
    3494:	4505                	li	a0,1
    3496:	00004097          	auipc	ra,0x4
    349a:	3f2080e7          	jalr	1010(ra) # 7888 <exit>
  }
  close(fd);
    349e:	fec42783          	lw	a5,-20(s0)
    34a2:	853e                	mv	a0,a5
    34a4:	00004097          	auipc	ra,0x4
    34a8:	40c080e7          	jalr	1036(ra) # 78b0 <close>

  if(link("lf2", "lf2") >= 0){
    34ac:	00006597          	auipc	a1,0x6
    34b0:	90458593          	addi	a1,a1,-1788 # 8db0 <malloc+0xe08>
    34b4:	00006517          	auipc	a0,0x6
    34b8:	8fc50513          	addi	a0,a0,-1796 # 8db0 <malloc+0xe08>
    34bc:	00004097          	auipc	ra,0x4
    34c0:	42c080e7          	jalr	1068(ra) # 78e8 <link>
    34c4:	87aa                	mv	a5,a0
    34c6:	0207c163          	bltz	a5,34e8 <linktest+0x208>
    printf("%s: link lf2 lf2 succeeded! oops\n", s);
    34ca:	fd843583          	ld	a1,-40(s0)
    34ce:	00006517          	auipc	a0,0x6
    34d2:	99a50513          	addi	a0,a0,-1638 # 8e68 <malloc+0xec0>
    34d6:	00005097          	auipc	ra,0x5
    34da:	8e0080e7          	jalr	-1824(ra) # 7db6 <printf>
    exit(1);
    34de:	4505                	li	a0,1
    34e0:	00004097          	auipc	ra,0x4
    34e4:	3a8080e7          	jalr	936(ra) # 7888 <exit>
  }

  unlink("lf2");
    34e8:	00006517          	auipc	a0,0x6
    34ec:	8c850513          	addi	a0,a0,-1848 # 8db0 <malloc+0xe08>
    34f0:	00004097          	auipc	ra,0x4
    34f4:	3e8080e7          	jalr	1000(ra) # 78d8 <unlink>
  if(link("lf2", "lf1") >= 0){
    34f8:	00006597          	auipc	a1,0x6
    34fc:	8b058593          	addi	a1,a1,-1872 # 8da8 <malloc+0xe00>
    3500:	00006517          	auipc	a0,0x6
    3504:	8b050513          	addi	a0,a0,-1872 # 8db0 <malloc+0xe08>
    3508:	00004097          	auipc	ra,0x4
    350c:	3e0080e7          	jalr	992(ra) # 78e8 <link>
    3510:	87aa                	mv	a5,a0
    3512:	0207c163          	bltz	a5,3534 <linktest+0x254>
    printf("%s: link non-existent succeeded! oops\n", s);
    3516:	fd843583          	ld	a1,-40(s0)
    351a:	00006517          	auipc	a0,0x6
    351e:	97650513          	addi	a0,a0,-1674 # 8e90 <malloc+0xee8>
    3522:	00005097          	auipc	ra,0x5
    3526:	894080e7          	jalr	-1900(ra) # 7db6 <printf>
    exit(1);
    352a:	4505                	li	a0,1
    352c:	00004097          	auipc	ra,0x4
    3530:	35c080e7          	jalr	860(ra) # 7888 <exit>
  }

  if(link(".", "lf1") >= 0){
    3534:	00006597          	auipc	a1,0x6
    3538:	87458593          	addi	a1,a1,-1932 # 8da8 <malloc+0xe00>
    353c:	00006517          	auipc	a0,0x6
    3540:	97c50513          	addi	a0,a0,-1668 # 8eb8 <malloc+0xf10>
    3544:	00004097          	auipc	ra,0x4
    3548:	3a4080e7          	jalr	932(ra) # 78e8 <link>
    354c:	87aa                	mv	a5,a0
    354e:	0207c163          	bltz	a5,3570 <linktest+0x290>
    printf("%s: link . lf1 succeeded! oops\n", s);
    3552:	fd843583          	ld	a1,-40(s0)
    3556:	00006517          	auipc	a0,0x6
    355a:	96a50513          	addi	a0,a0,-1686 # 8ec0 <malloc+0xf18>
    355e:	00005097          	auipc	ra,0x5
    3562:	858080e7          	jalr	-1960(ra) # 7db6 <printf>
    exit(1);
    3566:	4505                	li	a0,1
    3568:	00004097          	auipc	ra,0x4
    356c:	320080e7          	jalr	800(ra) # 7888 <exit>
  }
}
    3570:	0001                	nop
    3572:	70a2                	ld	ra,40(sp)
    3574:	7402                	ld	s0,32(sp)
    3576:	6145                	addi	sp,sp,48
    3578:	8082                	ret

000000000000357a <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(char *s)
{
    357a:	7119                	addi	sp,sp,-128
    357c:	fc86                	sd	ra,120(sp)
    357e:	f8a2                	sd	s0,112(sp)
    3580:	0100                	addi	s0,sp,128
    3582:	f8a43423          	sd	a0,-120(s0)
  struct {
    ushort inum;
    char name[DIRSIZ];
  } de;

  file[0] = 'C';
    3586:	04300793          	li	a5,67
    358a:	fcf40c23          	sb	a5,-40(s0)
  file[2] = '\0';
    358e:	fc040d23          	sb	zero,-38(s0)
  for(i = 0; i < N; i++){
    3592:	fe042623          	sw	zero,-20(s0)
    3596:	a215                	j	36ba <concreate+0x140>
    file[1] = '0' + i;
    3598:	fec42783          	lw	a5,-20(s0)
    359c:	0ff7f793          	andi	a5,a5,255
    35a0:	0307879b          	addiw	a5,a5,48
    35a4:	0ff7f793          	andi	a5,a5,255
    35a8:	fcf40ca3          	sb	a5,-39(s0)
    unlink(file);
    35ac:	fd840793          	addi	a5,s0,-40
    35b0:	853e                	mv	a0,a5
    35b2:	00004097          	auipc	ra,0x4
    35b6:	326080e7          	jalr	806(ra) # 78d8 <unlink>
    pid = fork();
    35ba:	00004097          	auipc	ra,0x4
    35be:	2c6080e7          	jalr	710(ra) # 7880 <fork>
    35c2:	87aa                	mv	a5,a0
    35c4:	fef42023          	sw	a5,-32(s0)
    if(pid && (i % 3) == 1){
    35c8:	fe042783          	lw	a5,-32(s0)
    35cc:	2781                	sext.w	a5,a5
    35ce:	c79d                	beqz	a5,35fc <concreate+0x82>
    35d0:	fec42703          	lw	a4,-20(s0)
    35d4:	478d                	li	a5,3
    35d6:	02f767bb          	remw	a5,a4,a5
    35da:	2781                	sext.w	a5,a5
    35dc:	873e                	mv	a4,a5
    35de:	4785                	li	a5,1
    35e0:	00f71e63          	bne	a4,a5,35fc <concreate+0x82>
      link("C0", file);
    35e4:	fd840793          	addi	a5,s0,-40
    35e8:	85be                	mv	a1,a5
    35ea:	00006517          	auipc	a0,0x6
    35ee:	8f650513          	addi	a0,a0,-1802 # 8ee0 <malloc+0xf38>
    35f2:	00004097          	auipc	ra,0x4
    35f6:	2f6080e7          	jalr	758(ra) # 78e8 <link>
    35fa:	a059                	j	3680 <concreate+0x106>
    } else if(pid == 0 && (i % 5) == 1){
    35fc:	fe042783          	lw	a5,-32(s0)
    3600:	2781                	sext.w	a5,a5
    3602:	e79d                	bnez	a5,3630 <concreate+0xb6>
    3604:	fec42703          	lw	a4,-20(s0)
    3608:	4795                	li	a5,5
    360a:	02f767bb          	remw	a5,a4,a5
    360e:	2781                	sext.w	a5,a5
    3610:	873e                	mv	a4,a5
    3612:	4785                	li	a5,1
    3614:	00f71e63          	bne	a4,a5,3630 <concreate+0xb6>
      link("C0", file);
    3618:	fd840793          	addi	a5,s0,-40
    361c:	85be                	mv	a1,a5
    361e:	00006517          	auipc	a0,0x6
    3622:	8c250513          	addi	a0,a0,-1854 # 8ee0 <malloc+0xf38>
    3626:	00004097          	auipc	ra,0x4
    362a:	2c2080e7          	jalr	706(ra) # 78e8 <link>
    362e:	a889                	j	3680 <concreate+0x106>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    3630:	fd840793          	addi	a5,s0,-40
    3634:	20200593          	li	a1,514
    3638:	853e                	mv	a0,a5
    363a:	00004097          	auipc	ra,0x4
    363e:	28e080e7          	jalr	654(ra) # 78c8 <open>
    3642:	87aa                	mv	a5,a0
    3644:	fef42223          	sw	a5,-28(s0)
      if(fd < 0){
    3648:	fe442783          	lw	a5,-28(s0)
    364c:	2781                	sext.w	a5,a5
    364e:	0207d263          	bgez	a5,3672 <concreate+0xf8>
        printf("concreate create %s failed\n", file);
    3652:	fd840793          	addi	a5,s0,-40
    3656:	85be                	mv	a1,a5
    3658:	00006517          	auipc	a0,0x6
    365c:	89050513          	addi	a0,a0,-1904 # 8ee8 <malloc+0xf40>
    3660:	00004097          	auipc	ra,0x4
    3664:	756080e7          	jalr	1878(ra) # 7db6 <printf>
        exit(1);
    3668:	4505                	li	a0,1
    366a:	00004097          	auipc	ra,0x4
    366e:	21e080e7          	jalr	542(ra) # 7888 <exit>
      }
      close(fd);
    3672:	fe442783          	lw	a5,-28(s0)
    3676:	853e                	mv	a0,a5
    3678:	00004097          	auipc	ra,0x4
    367c:	238080e7          	jalr	568(ra) # 78b0 <close>
    }
    if(pid == 0) {
    3680:	fe042783          	lw	a5,-32(s0)
    3684:	2781                	sext.w	a5,a5
    3686:	e791                	bnez	a5,3692 <concreate+0x118>
      exit(0);
    3688:	4501                	li	a0,0
    368a:	00004097          	auipc	ra,0x4
    368e:	1fe080e7          	jalr	510(ra) # 7888 <exit>
    } else {
      int xstatus;
      wait(&xstatus);
    3692:	f9c40793          	addi	a5,s0,-100
    3696:	853e                	mv	a0,a5
    3698:	00004097          	auipc	ra,0x4
    369c:	1f8080e7          	jalr	504(ra) # 7890 <wait>
      if(xstatus != 0)
    36a0:	f9c42783          	lw	a5,-100(s0)
    36a4:	c791                	beqz	a5,36b0 <concreate+0x136>
        exit(1);
    36a6:	4505                	li	a0,1
    36a8:	00004097          	auipc	ra,0x4
    36ac:	1e0080e7          	jalr	480(ra) # 7888 <exit>
  for(i = 0; i < N; i++){
    36b0:	fec42783          	lw	a5,-20(s0)
    36b4:	2785                	addiw	a5,a5,1
    36b6:	fef42623          	sw	a5,-20(s0)
    36ba:	fec42783          	lw	a5,-20(s0)
    36be:	0007871b          	sext.w	a4,a5
    36c2:	02700793          	li	a5,39
    36c6:	ece7d9e3          	bge	a5,a4,3598 <concreate+0x1e>
    }
  }

  memset(fa, 0, sizeof(fa));
    36ca:	fb040793          	addi	a5,s0,-80
    36ce:	02800613          	li	a2,40
    36d2:	4581                	li	a1,0
    36d4:	853e                	mv	a0,a5
    36d6:	00004097          	auipc	ra,0x4
    36da:	e08080e7          	jalr	-504(ra) # 74de <memset>
  fd = open(".", 0);
    36de:	4581                	li	a1,0
    36e0:	00005517          	auipc	a0,0x5
    36e4:	7d850513          	addi	a0,a0,2008 # 8eb8 <malloc+0xf10>
    36e8:	00004097          	auipc	ra,0x4
    36ec:	1e0080e7          	jalr	480(ra) # 78c8 <open>
    36f0:	87aa                	mv	a5,a0
    36f2:	fef42223          	sw	a5,-28(s0)
  n = 0;
    36f6:	fe042423          	sw	zero,-24(s0)
  while(read(fd, &de, sizeof(de)) > 0){
    36fa:	a86d                	j	37b4 <concreate+0x23a>
    if(de.inum == 0)
    36fc:	fa045783          	lhu	a5,-96(s0)
    3700:	e391                	bnez	a5,3704 <concreate+0x18a>
      continue;
    3702:	a84d                	j	37b4 <concreate+0x23a>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    3704:	fa244783          	lbu	a5,-94(s0)
    3708:	873e                	mv	a4,a5
    370a:	04300793          	li	a5,67
    370e:	0af71363          	bne	a4,a5,37b4 <concreate+0x23a>
    3712:	fa444783          	lbu	a5,-92(s0)
    3716:	efd9                	bnez	a5,37b4 <concreate+0x23a>
      i = de.name[1] - '0';
    3718:	fa344783          	lbu	a5,-93(s0)
    371c:	2781                	sext.w	a5,a5
    371e:	fd07879b          	addiw	a5,a5,-48
    3722:	fef42623          	sw	a5,-20(s0)
      if(i < 0 || i >= sizeof(fa)){
    3726:	fec42783          	lw	a5,-20(s0)
    372a:	2781                	sext.w	a5,a5
    372c:	0007c963          	bltz	a5,373e <concreate+0x1c4>
    3730:	fec42783          	lw	a5,-20(s0)
    3734:	873e                	mv	a4,a5
    3736:	02700793          	li	a5,39
    373a:	02e7f563          	bgeu	a5,a4,3764 <concreate+0x1ea>
        printf("%s: concreate weird file %s\n", s, de.name);
    373e:	fa040793          	addi	a5,s0,-96
    3742:	0789                	addi	a5,a5,2
    3744:	863e                	mv	a2,a5
    3746:	f8843583          	ld	a1,-120(s0)
    374a:	00005517          	auipc	a0,0x5
    374e:	7be50513          	addi	a0,a0,1982 # 8f08 <malloc+0xf60>
    3752:	00004097          	auipc	ra,0x4
    3756:	664080e7          	jalr	1636(ra) # 7db6 <printf>
        exit(1);
    375a:	4505                	li	a0,1
    375c:	00004097          	auipc	ra,0x4
    3760:	12c080e7          	jalr	300(ra) # 7888 <exit>
      }
      if(fa[i]){
    3764:	fec42783          	lw	a5,-20(s0)
    3768:	ff040713          	addi	a4,s0,-16
    376c:	97ba                	add	a5,a5,a4
    376e:	fc07c783          	lbu	a5,-64(a5)
    3772:	c785                	beqz	a5,379a <concreate+0x220>
        printf("%s: concreate duplicate file %s\n", s, de.name);
    3774:	fa040793          	addi	a5,s0,-96
    3778:	0789                	addi	a5,a5,2
    377a:	863e                	mv	a2,a5
    377c:	f8843583          	ld	a1,-120(s0)
    3780:	00005517          	auipc	a0,0x5
    3784:	7a850513          	addi	a0,a0,1960 # 8f28 <malloc+0xf80>
    3788:	00004097          	auipc	ra,0x4
    378c:	62e080e7          	jalr	1582(ra) # 7db6 <printf>
        exit(1);
    3790:	4505                	li	a0,1
    3792:	00004097          	auipc	ra,0x4
    3796:	0f6080e7          	jalr	246(ra) # 7888 <exit>
      }
      fa[i] = 1;
    379a:	fec42783          	lw	a5,-20(s0)
    379e:	ff040713          	addi	a4,s0,-16
    37a2:	97ba                	add	a5,a5,a4
    37a4:	4705                	li	a4,1
    37a6:	fce78023          	sb	a4,-64(a5)
      n++;
    37aa:	fe842783          	lw	a5,-24(s0)
    37ae:	2785                	addiw	a5,a5,1
    37b0:	fef42423          	sw	a5,-24(s0)
  while(read(fd, &de, sizeof(de)) > 0){
    37b4:	fa040713          	addi	a4,s0,-96
    37b8:	fe442783          	lw	a5,-28(s0)
    37bc:	4641                	li	a2,16
    37be:	85ba                	mv	a1,a4
    37c0:	853e                	mv	a0,a5
    37c2:	00004097          	auipc	ra,0x4
    37c6:	0de080e7          	jalr	222(ra) # 78a0 <read>
    37ca:	87aa                	mv	a5,a0
    37cc:	f2f048e3          	bgtz	a5,36fc <concreate+0x182>
    }
  }
  close(fd);
    37d0:	fe442783          	lw	a5,-28(s0)
    37d4:	853e                	mv	a0,a5
    37d6:	00004097          	auipc	ra,0x4
    37da:	0da080e7          	jalr	218(ra) # 78b0 <close>

  if(n != N){
    37de:	fe842783          	lw	a5,-24(s0)
    37e2:	0007871b          	sext.w	a4,a5
    37e6:	02800793          	li	a5,40
    37ea:	02f70163          	beq	a4,a5,380c <concreate+0x292>
    printf("%s: concreate not enough files in directory listing\n", s);
    37ee:	f8843583          	ld	a1,-120(s0)
    37f2:	00005517          	auipc	a0,0x5
    37f6:	75e50513          	addi	a0,a0,1886 # 8f50 <malloc+0xfa8>
    37fa:	00004097          	auipc	ra,0x4
    37fe:	5bc080e7          	jalr	1468(ra) # 7db6 <printf>
    exit(1);
    3802:	4505                	li	a0,1
    3804:	00004097          	auipc	ra,0x4
    3808:	084080e7          	jalr	132(ra) # 7888 <exit>
  }

  for(i = 0; i < N; i++){
    380c:	fe042623          	sw	zero,-20(s0)
    3810:	a24d                	j	39b2 <concreate+0x438>
    file[1] = '0' + i;
    3812:	fec42783          	lw	a5,-20(s0)
    3816:	0ff7f793          	andi	a5,a5,255
    381a:	0307879b          	addiw	a5,a5,48
    381e:	0ff7f793          	andi	a5,a5,255
    3822:	fcf40ca3          	sb	a5,-39(s0)
    pid = fork();
    3826:	00004097          	auipc	ra,0x4
    382a:	05a080e7          	jalr	90(ra) # 7880 <fork>
    382e:	87aa                	mv	a5,a0
    3830:	fef42023          	sw	a5,-32(s0)
    if(pid < 0){
    3834:	fe042783          	lw	a5,-32(s0)
    3838:	2781                	sext.w	a5,a5
    383a:	0207d163          	bgez	a5,385c <concreate+0x2e2>
      printf("%s: fork failed\n", s);
    383e:	f8843583          	ld	a1,-120(s0)
    3842:	00005517          	auipc	a0,0x5
    3846:	d0e50513          	addi	a0,a0,-754 # 8550 <malloc+0x5a8>
    384a:	00004097          	auipc	ra,0x4
    384e:	56c080e7          	jalr	1388(ra) # 7db6 <printf>
      exit(1);
    3852:	4505                	li	a0,1
    3854:	00004097          	auipc	ra,0x4
    3858:	034080e7          	jalr	52(ra) # 7888 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    385c:	fec42703          	lw	a4,-20(s0)
    3860:	478d                	li	a5,3
    3862:	02f767bb          	remw	a5,a4,a5
    3866:	2781                	sext.w	a5,a5
    3868:	e789                	bnez	a5,3872 <concreate+0x2f8>
    386a:	fe042783          	lw	a5,-32(s0)
    386e:	2781                	sext.w	a5,a5
    3870:	cf99                	beqz	a5,388e <concreate+0x314>
       ((i % 3) == 1 && pid != 0)){
    3872:	fec42703          	lw	a4,-20(s0)
    3876:	478d                	li	a5,3
    3878:	02f767bb          	remw	a5,a4,a5
    387c:	2781                	sext.w	a5,a5
    if(((i % 3) == 0 && pid == 0) ||
    387e:	873e                	mv	a4,a5
    3880:	4785                	li	a5,1
    3882:	0af71b63          	bne	a4,a5,3938 <concreate+0x3be>
       ((i % 3) == 1 && pid != 0)){
    3886:	fe042783          	lw	a5,-32(s0)
    388a:	2781                	sext.w	a5,a5
    388c:	c7d5                	beqz	a5,3938 <concreate+0x3be>
      close(open(file, 0));
    388e:	fd840793          	addi	a5,s0,-40
    3892:	4581                	li	a1,0
    3894:	853e                	mv	a0,a5
    3896:	00004097          	auipc	ra,0x4
    389a:	032080e7          	jalr	50(ra) # 78c8 <open>
    389e:	87aa                	mv	a5,a0
    38a0:	853e                	mv	a0,a5
    38a2:	00004097          	auipc	ra,0x4
    38a6:	00e080e7          	jalr	14(ra) # 78b0 <close>
      close(open(file, 0));
    38aa:	fd840793          	addi	a5,s0,-40
    38ae:	4581                	li	a1,0
    38b0:	853e                	mv	a0,a5
    38b2:	00004097          	auipc	ra,0x4
    38b6:	016080e7          	jalr	22(ra) # 78c8 <open>
    38ba:	87aa                	mv	a5,a0
    38bc:	853e                	mv	a0,a5
    38be:	00004097          	auipc	ra,0x4
    38c2:	ff2080e7          	jalr	-14(ra) # 78b0 <close>
      close(open(file, 0));
    38c6:	fd840793          	addi	a5,s0,-40
    38ca:	4581                	li	a1,0
    38cc:	853e                	mv	a0,a5
    38ce:	00004097          	auipc	ra,0x4
    38d2:	ffa080e7          	jalr	-6(ra) # 78c8 <open>
    38d6:	87aa                	mv	a5,a0
    38d8:	853e                	mv	a0,a5
    38da:	00004097          	auipc	ra,0x4
    38de:	fd6080e7          	jalr	-42(ra) # 78b0 <close>
      close(open(file, 0));
    38e2:	fd840793          	addi	a5,s0,-40
    38e6:	4581                	li	a1,0
    38e8:	853e                	mv	a0,a5
    38ea:	00004097          	auipc	ra,0x4
    38ee:	fde080e7          	jalr	-34(ra) # 78c8 <open>
    38f2:	87aa                	mv	a5,a0
    38f4:	853e                	mv	a0,a5
    38f6:	00004097          	auipc	ra,0x4
    38fa:	fba080e7          	jalr	-70(ra) # 78b0 <close>
      close(open(file, 0));
    38fe:	fd840793          	addi	a5,s0,-40
    3902:	4581                	li	a1,0
    3904:	853e                	mv	a0,a5
    3906:	00004097          	auipc	ra,0x4
    390a:	fc2080e7          	jalr	-62(ra) # 78c8 <open>
    390e:	87aa                	mv	a5,a0
    3910:	853e                	mv	a0,a5
    3912:	00004097          	auipc	ra,0x4
    3916:	f9e080e7          	jalr	-98(ra) # 78b0 <close>
      close(open(file, 0));
    391a:	fd840793          	addi	a5,s0,-40
    391e:	4581                	li	a1,0
    3920:	853e                	mv	a0,a5
    3922:	00004097          	auipc	ra,0x4
    3926:	fa6080e7          	jalr	-90(ra) # 78c8 <open>
    392a:	87aa                	mv	a5,a0
    392c:	853e                	mv	a0,a5
    392e:	00004097          	auipc	ra,0x4
    3932:	f82080e7          	jalr	-126(ra) # 78b0 <close>
    3936:	a899                	j	398c <concreate+0x412>
    } else {
      unlink(file);
    3938:	fd840793          	addi	a5,s0,-40
    393c:	853e                	mv	a0,a5
    393e:	00004097          	auipc	ra,0x4
    3942:	f9a080e7          	jalr	-102(ra) # 78d8 <unlink>
      unlink(file);
    3946:	fd840793          	addi	a5,s0,-40
    394a:	853e                	mv	a0,a5
    394c:	00004097          	auipc	ra,0x4
    3950:	f8c080e7          	jalr	-116(ra) # 78d8 <unlink>
      unlink(file);
    3954:	fd840793          	addi	a5,s0,-40
    3958:	853e                	mv	a0,a5
    395a:	00004097          	auipc	ra,0x4
    395e:	f7e080e7          	jalr	-130(ra) # 78d8 <unlink>
      unlink(file);
    3962:	fd840793          	addi	a5,s0,-40
    3966:	853e                	mv	a0,a5
    3968:	00004097          	auipc	ra,0x4
    396c:	f70080e7          	jalr	-144(ra) # 78d8 <unlink>
      unlink(file);
    3970:	fd840793          	addi	a5,s0,-40
    3974:	853e                	mv	a0,a5
    3976:	00004097          	auipc	ra,0x4
    397a:	f62080e7          	jalr	-158(ra) # 78d8 <unlink>
      unlink(file);
    397e:	fd840793          	addi	a5,s0,-40
    3982:	853e                	mv	a0,a5
    3984:	00004097          	auipc	ra,0x4
    3988:	f54080e7          	jalr	-172(ra) # 78d8 <unlink>
    }
    if(pid == 0)
    398c:	fe042783          	lw	a5,-32(s0)
    3990:	2781                	sext.w	a5,a5
    3992:	e791                	bnez	a5,399e <concreate+0x424>
      exit(0);
    3994:	4501                	li	a0,0
    3996:	00004097          	auipc	ra,0x4
    399a:	ef2080e7          	jalr	-270(ra) # 7888 <exit>
    else
      wait(0);
    399e:	4501                	li	a0,0
    39a0:	00004097          	auipc	ra,0x4
    39a4:	ef0080e7          	jalr	-272(ra) # 7890 <wait>
  for(i = 0; i < N; i++){
    39a8:	fec42783          	lw	a5,-20(s0)
    39ac:	2785                	addiw	a5,a5,1
    39ae:	fef42623          	sw	a5,-20(s0)
    39b2:	fec42783          	lw	a5,-20(s0)
    39b6:	0007871b          	sext.w	a4,a5
    39ba:	02700793          	li	a5,39
    39be:	e4e7dae3          	bge	a5,a4,3812 <concreate+0x298>
  }
}
    39c2:	0001                	nop
    39c4:	0001                	nop
    39c6:	70e6                	ld	ra,120(sp)
    39c8:	7446                	ld	s0,112(sp)
    39ca:	6109                	addi	sp,sp,128
    39cc:	8082                	ret

00000000000039ce <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink(char *s)
{
    39ce:	7179                	addi	sp,sp,-48
    39d0:	f406                	sd	ra,40(sp)
    39d2:	f022                	sd	s0,32(sp)
    39d4:	1800                	addi	s0,sp,48
    39d6:	fca43c23          	sd	a0,-40(s0)
  int pid, i;

  unlink("x");
    39da:	00005517          	auipc	a0,0x5
    39de:	84650513          	addi	a0,a0,-1978 # 8220 <malloc+0x278>
    39e2:	00004097          	auipc	ra,0x4
    39e6:	ef6080e7          	jalr	-266(ra) # 78d8 <unlink>
  pid = fork();
    39ea:	00004097          	auipc	ra,0x4
    39ee:	e96080e7          	jalr	-362(ra) # 7880 <fork>
    39f2:	87aa                	mv	a5,a0
    39f4:	fef42223          	sw	a5,-28(s0)
  if(pid < 0){
    39f8:	fe442783          	lw	a5,-28(s0)
    39fc:	2781                	sext.w	a5,a5
    39fe:	0207d163          	bgez	a5,3a20 <linkunlink+0x52>
    printf("%s: fork failed\n", s);
    3a02:	fd843583          	ld	a1,-40(s0)
    3a06:	00005517          	auipc	a0,0x5
    3a0a:	b4a50513          	addi	a0,a0,-1206 # 8550 <malloc+0x5a8>
    3a0e:	00004097          	auipc	ra,0x4
    3a12:	3a8080e7          	jalr	936(ra) # 7db6 <printf>
    exit(1);
    3a16:	4505                	li	a0,1
    3a18:	00004097          	auipc	ra,0x4
    3a1c:	e70080e7          	jalr	-400(ra) # 7888 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    3a20:	fe442783          	lw	a5,-28(s0)
    3a24:	2781                	sext.w	a5,a5
    3a26:	c399                	beqz	a5,3a2c <linkunlink+0x5e>
    3a28:	4785                	li	a5,1
    3a2a:	a019                	j	3a30 <linkunlink+0x62>
    3a2c:	06100793          	li	a5,97
    3a30:	fef42423          	sw	a5,-24(s0)
  for(i = 0; i < 100; i++){
    3a34:	fe042623          	sw	zero,-20(s0)
    3a38:	a869                	j	3ad2 <linkunlink+0x104>
    x = x * 1103515245 + 12345;
    3a3a:	fe842703          	lw	a4,-24(s0)
    3a3e:	41c657b7          	lui	a5,0x41c65
    3a42:	e6d7879b          	addiw	a5,a5,-403
    3a46:	02f707bb          	mulw	a5,a4,a5
    3a4a:	0007871b          	sext.w	a4,a5
    3a4e:	678d                	lui	a5,0x3
    3a50:	0397879b          	addiw	a5,a5,57
    3a54:	9fb9                	addw	a5,a5,a4
    3a56:	fef42423          	sw	a5,-24(s0)
    if((x % 3) == 0){
    3a5a:	fe842703          	lw	a4,-24(s0)
    3a5e:	478d                	li	a5,3
    3a60:	02f777bb          	remuw	a5,a4,a5
    3a64:	2781                	sext.w	a5,a5
    3a66:	e395                	bnez	a5,3a8a <linkunlink+0xbc>
      close(open("x", O_RDWR | O_CREATE));
    3a68:	20200593          	li	a1,514
    3a6c:	00004517          	auipc	a0,0x4
    3a70:	7b450513          	addi	a0,a0,1972 # 8220 <malloc+0x278>
    3a74:	00004097          	auipc	ra,0x4
    3a78:	e54080e7          	jalr	-428(ra) # 78c8 <open>
    3a7c:	87aa                	mv	a5,a0
    3a7e:	853e                	mv	a0,a5
    3a80:	00004097          	auipc	ra,0x4
    3a84:	e30080e7          	jalr	-464(ra) # 78b0 <close>
    3a88:	a081                	j	3ac8 <linkunlink+0xfa>
    } else if((x % 3) == 1){
    3a8a:	fe842703          	lw	a4,-24(s0)
    3a8e:	478d                	li	a5,3
    3a90:	02f777bb          	remuw	a5,a4,a5
    3a94:	2781                	sext.w	a5,a5
    3a96:	873e                	mv	a4,a5
    3a98:	4785                	li	a5,1
    3a9a:	00f71f63          	bne	a4,a5,3ab8 <linkunlink+0xea>
      link("cat", "x");
    3a9e:	00004597          	auipc	a1,0x4
    3aa2:	78258593          	addi	a1,a1,1922 # 8220 <malloc+0x278>
    3aa6:	00005517          	auipc	a0,0x5
    3aaa:	4e250513          	addi	a0,a0,1250 # 8f88 <malloc+0xfe0>
    3aae:	00004097          	auipc	ra,0x4
    3ab2:	e3a080e7          	jalr	-454(ra) # 78e8 <link>
    3ab6:	a809                	j	3ac8 <linkunlink+0xfa>
    } else {
      unlink("x");
    3ab8:	00004517          	auipc	a0,0x4
    3abc:	76850513          	addi	a0,a0,1896 # 8220 <malloc+0x278>
    3ac0:	00004097          	auipc	ra,0x4
    3ac4:	e18080e7          	jalr	-488(ra) # 78d8 <unlink>
  for(i = 0; i < 100; i++){
    3ac8:	fec42783          	lw	a5,-20(s0)
    3acc:	2785                	addiw	a5,a5,1
    3ace:	fef42623          	sw	a5,-20(s0)
    3ad2:	fec42783          	lw	a5,-20(s0)
    3ad6:	0007871b          	sext.w	a4,a5
    3ada:	06300793          	li	a5,99
    3ade:	f4e7dee3          	bge	a5,a4,3a3a <linkunlink+0x6c>
    }
  }

  if(pid)
    3ae2:	fe442783          	lw	a5,-28(s0)
    3ae6:	2781                	sext.w	a5,a5
    3ae8:	c799                	beqz	a5,3af6 <linkunlink+0x128>
    wait(0);
    3aea:	4501                	li	a0,0
    3aec:	00004097          	auipc	ra,0x4
    3af0:	da4080e7          	jalr	-604(ra) # 7890 <wait>
  else
    exit(0);
}
    3af4:	a031                	j	3b00 <linkunlink+0x132>
    exit(0);
    3af6:	4501                	li	a0,0
    3af8:	00004097          	auipc	ra,0x4
    3afc:	d90080e7          	jalr	-624(ra) # 7888 <exit>
}
    3b00:	70a2                	ld	ra,40(sp)
    3b02:	7402                	ld	s0,32(sp)
    3b04:	6145                	addi	sp,sp,48
    3b06:	8082                	ret

0000000000003b08 <subdir>:


void
subdir(char *s)
{
    3b08:	7179                	addi	sp,sp,-48
    3b0a:	f406                	sd	ra,40(sp)
    3b0c:	f022                	sd	s0,32(sp)
    3b0e:	1800                	addi	s0,sp,48
    3b10:	fca43c23          	sd	a0,-40(s0)
  int fd, cc;

  unlink("ff");
    3b14:	00005517          	auipc	a0,0x5
    3b18:	47c50513          	addi	a0,a0,1148 # 8f90 <malloc+0xfe8>
    3b1c:	00004097          	auipc	ra,0x4
    3b20:	dbc080e7          	jalr	-580(ra) # 78d8 <unlink>
  if(mkdir("dd") != 0){
    3b24:	00005517          	auipc	a0,0x5
    3b28:	47450513          	addi	a0,a0,1140 # 8f98 <malloc+0xff0>
    3b2c:	00004097          	auipc	ra,0x4
    3b30:	dc4080e7          	jalr	-572(ra) # 78f0 <mkdir>
    3b34:	87aa                	mv	a5,a0
    3b36:	c385                	beqz	a5,3b56 <subdir+0x4e>
    printf("%s: mkdir dd failed\n", s);
    3b38:	fd843583          	ld	a1,-40(s0)
    3b3c:	00005517          	auipc	a0,0x5
    3b40:	46450513          	addi	a0,a0,1124 # 8fa0 <malloc+0xff8>
    3b44:	00004097          	auipc	ra,0x4
    3b48:	272080e7          	jalr	626(ra) # 7db6 <printf>
    exit(1);
    3b4c:	4505                	li	a0,1
    3b4e:	00004097          	auipc	ra,0x4
    3b52:	d3a080e7          	jalr	-710(ra) # 7888 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    3b56:	20200593          	li	a1,514
    3b5a:	00005517          	auipc	a0,0x5
    3b5e:	45e50513          	addi	a0,a0,1118 # 8fb8 <malloc+0x1010>
    3b62:	00004097          	auipc	ra,0x4
    3b66:	d66080e7          	jalr	-666(ra) # 78c8 <open>
    3b6a:	87aa                	mv	a5,a0
    3b6c:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    3b70:	fec42783          	lw	a5,-20(s0)
    3b74:	2781                	sext.w	a5,a5
    3b76:	0207d163          	bgez	a5,3b98 <subdir+0x90>
    printf("%s: create dd/ff failed\n", s);
    3b7a:	fd843583          	ld	a1,-40(s0)
    3b7e:	00005517          	auipc	a0,0x5
    3b82:	44250513          	addi	a0,a0,1090 # 8fc0 <malloc+0x1018>
    3b86:	00004097          	auipc	ra,0x4
    3b8a:	230080e7          	jalr	560(ra) # 7db6 <printf>
    exit(1);
    3b8e:	4505                	li	a0,1
    3b90:	00004097          	auipc	ra,0x4
    3b94:	cf8080e7          	jalr	-776(ra) # 7888 <exit>
  }
  write(fd, "ff", 2);
    3b98:	fec42783          	lw	a5,-20(s0)
    3b9c:	4609                	li	a2,2
    3b9e:	00005597          	auipc	a1,0x5
    3ba2:	3f258593          	addi	a1,a1,1010 # 8f90 <malloc+0xfe8>
    3ba6:	853e                	mv	a0,a5
    3ba8:	00004097          	auipc	ra,0x4
    3bac:	d00080e7          	jalr	-768(ra) # 78a8 <write>
  close(fd);
    3bb0:	fec42783          	lw	a5,-20(s0)
    3bb4:	853e                	mv	a0,a5
    3bb6:	00004097          	auipc	ra,0x4
    3bba:	cfa080e7          	jalr	-774(ra) # 78b0 <close>

  if(unlink("dd") >= 0){
    3bbe:	00005517          	auipc	a0,0x5
    3bc2:	3da50513          	addi	a0,a0,986 # 8f98 <malloc+0xff0>
    3bc6:	00004097          	auipc	ra,0x4
    3bca:	d12080e7          	jalr	-750(ra) # 78d8 <unlink>
    3bce:	87aa                	mv	a5,a0
    3bd0:	0207c163          	bltz	a5,3bf2 <subdir+0xea>
    printf("%s: unlink dd (non-empty dir) succeeded!\n", s);
    3bd4:	fd843583          	ld	a1,-40(s0)
    3bd8:	00005517          	auipc	a0,0x5
    3bdc:	40850513          	addi	a0,a0,1032 # 8fe0 <malloc+0x1038>
    3be0:	00004097          	auipc	ra,0x4
    3be4:	1d6080e7          	jalr	470(ra) # 7db6 <printf>
    exit(1);
    3be8:	4505                	li	a0,1
    3bea:	00004097          	auipc	ra,0x4
    3bee:	c9e080e7          	jalr	-866(ra) # 7888 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    3bf2:	00005517          	auipc	a0,0x5
    3bf6:	41e50513          	addi	a0,a0,1054 # 9010 <malloc+0x1068>
    3bfa:	00004097          	auipc	ra,0x4
    3bfe:	cf6080e7          	jalr	-778(ra) # 78f0 <mkdir>
    3c02:	87aa                	mv	a5,a0
    3c04:	c385                	beqz	a5,3c24 <subdir+0x11c>
    printf("subdir mkdir dd/dd failed\n", s);
    3c06:	fd843583          	ld	a1,-40(s0)
    3c0a:	00005517          	auipc	a0,0x5
    3c0e:	40e50513          	addi	a0,a0,1038 # 9018 <malloc+0x1070>
    3c12:	00004097          	auipc	ra,0x4
    3c16:	1a4080e7          	jalr	420(ra) # 7db6 <printf>
    exit(1);
    3c1a:	4505                	li	a0,1
    3c1c:	00004097          	auipc	ra,0x4
    3c20:	c6c080e7          	jalr	-916(ra) # 7888 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    3c24:	20200593          	li	a1,514
    3c28:	00005517          	auipc	a0,0x5
    3c2c:	41050513          	addi	a0,a0,1040 # 9038 <malloc+0x1090>
    3c30:	00004097          	auipc	ra,0x4
    3c34:	c98080e7          	jalr	-872(ra) # 78c8 <open>
    3c38:	87aa                	mv	a5,a0
    3c3a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    3c3e:	fec42783          	lw	a5,-20(s0)
    3c42:	2781                	sext.w	a5,a5
    3c44:	0207d163          	bgez	a5,3c66 <subdir+0x15e>
    printf("%s: create dd/dd/ff failed\n", s);
    3c48:	fd843583          	ld	a1,-40(s0)
    3c4c:	00005517          	auipc	a0,0x5
    3c50:	3fc50513          	addi	a0,a0,1020 # 9048 <malloc+0x10a0>
    3c54:	00004097          	auipc	ra,0x4
    3c58:	162080e7          	jalr	354(ra) # 7db6 <printf>
    exit(1);
    3c5c:	4505                	li	a0,1
    3c5e:	00004097          	auipc	ra,0x4
    3c62:	c2a080e7          	jalr	-982(ra) # 7888 <exit>
  }
  write(fd, "FF", 2);
    3c66:	fec42783          	lw	a5,-20(s0)
    3c6a:	4609                	li	a2,2
    3c6c:	00005597          	auipc	a1,0x5
    3c70:	3fc58593          	addi	a1,a1,1020 # 9068 <malloc+0x10c0>
    3c74:	853e                	mv	a0,a5
    3c76:	00004097          	auipc	ra,0x4
    3c7a:	c32080e7          	jalr	-974(ra) # 78a8 <write>
  close(fd);
    3c7e:	fec42783          	lw	a5,-20(s0)
    3c82:	853e                	mv	a0,a5
    3c84:	00004097          	auipc	ra,0x4
    3c88:	c2c080e7          	jalr	-980(ra) # 78b0 <close>

  fd = open("dd/dd/../ff", 0);
    3c8c:	4581                	li	a1,0
    3c8e:	00005517          	auipc	a0,0x5
    3c92:	3e250513          	addi	a0,a0,994 # 9070 <malloc+0x10c8>
    3c96:	00004097          	auipc	ra,0x4
    3c9a:	c32080e7          	jalr	-974(ra) # 78c8 <open>
    3c9e:	87aa                	mv	a5,a0
    3ca0:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    3ca4:	fec42783          	lw	a5,-20(s0)
    3ca8:	2781                	sext.w	a5,a5
    3caa:	0207d163          	bgez	a5,3ccc <subdir+0x1c4>
    printf("%s: open dd/dd/../ff failed\n", s);
    3cae:	fd843583          	ld	a1,-40(s0)
    3cb2:	00005517          	auipc	a0,0x5
    3cb6:	3ce50513          	addi	a0,a0,974 # 9080 <malloc+0x10d8>
    3cba:	00004097          	auipc	ra,0x4
    3cbe:	0fc080e7          	jalr	252(ra) # 7db6 <printf>
    exit(1);
    3cc2:	4505                	li	a0,1
    3cc4:	00004097          	auipc	ra,0x4
    3cc8:	bc4080e7          	jalr	-1084(ra) # 7888 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    3ccc:	fec42783          	lw	a5,-20(s0)
    3cd0:	660d                	lui	a2,0x3
    3cd2:	00007597          	auipc	a1,0x7
    3cd6:	77e58593          	addi	a1,a1,1918 # b450 <buf>
    3cda:	853e                	mv	a0,a5
    3cdc:	00004097          	auipc	ra,0x4
    3ce0:	bc4080e7          	jalr	-1084(ra) # 78a0 <read>
    3ce4:	87aa                	mv	a5,a0
    3ce6:	fef42423          	sw	a5,-24(s0)
  if(cc != 2 || buf[0] != 'f'){
    3cea:	fe842783          	lw	a5,-24(s0)
    3cee:	0007871b          	sext.w	a4,a5
    3cf2:	4789                	li	a5,2
    3cf4:	00f71d63          	bne	a4,a5,3d0e <subdir+0x206>
    3cf8:	00007797          	auipc	a5,0x7
    3cfc:	75878793          	addi	a5,a5,1880 # b450 <buf>
    3d00:	0007c783          	lbu	a5,0(a5)
    3d04:	873e                	mv	a4,a5
    3d06:	06600793          	li	a5,102
    3d0a:	02f70163          	beq	a4,a5,3d2c <subdir+0x224>
    printf("%s: dd/dd/../ff wrong content\n", s);
    3d0e:	fd843583          	ld	a1,-40(s0)
    3d12:	00005517          	auipc	a0,0x5
    3d16:	38e50513          	addi	a0,a0,910 # 90a0 <malloc+0x10f8>
    3d1a:	00004097          	auipc	ra,0x4
    3d1e:	09c080e7          	jalr	156(ra) # 7db6 <printf>
    exit(1);
    3d22:	4505                	li	a0,1
    3d24:	00004097          	auipc	ra,0x4
    3d28:	b64080e7          	jalr	-1180(ra) # 7888 <exit>
  }
  close(fd);
    3d2c:	fec42783          	lw	a5,-20(s0)
    3d30:	853e                	mv	a0,a5
    3d32:	00004097          	auipc	ra,0x4
    3d36:	b7e080e7          	jalr	-1154(ra) # 78b0 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    3d3a:	00005597          	auipc	a1,0x5
    3d3e:	38658593          	addi	a1,a1,902 # 90c0 <malloc+0x1118>
    3d42:	00005517          	auipc	a0,0x5
    3d46:	2f650513          	addi	a0,a0,758 # 9038 <malloc+0x1090>
    3d4a:	00004097          	auipc	ra,0x4
    3d4e:	b9e080e7          	jalr	-1122(ra) # 78e8 <link>
    3d52:	87aa                	mv	a5,a0
    3d54:	c385                	beqz	a5,3d74 <subdir+0x26c>
    printf("link dd/dd/ff dd/dd/ffff failed\n", s);
    3d56:	fd843583          	ld	a1,-40(s0)
    3d5a:	00005517          	auipc	a0,0x5
    3d5e:	37650513          	addi	a0,a0,886 # 90d0 <malloc+0x1128>
    3d62:	00004097          	auipc	ra,0x4
    3d66:	054080e7          	jalr	84(ra) # 7db6 <printf>
    exit(1);
    3d6a:	4505                	li	a0,1
    3d6c:	00004097          	auipc	ra,0x4
    3d70:	b1c080e7          	jalr	-1252(ra) # 7888 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    3d74:	00005517          	auipc	a0,0x5
    3d78:	2c450513          	addi	a0,a0,708 # 9038 <malloc+0x1090>
    3d7c:	00004097          	auipc	ra,0x4
    3d80:	b5c080e7          	jalr	-1188(ra) # 78d8 <unlink>
    3d84:	87aa                	mv	a5,a0
    3d86:	c385                	beqz	a5,3da6 <subdir+0x29e>
    printf("%s: unlink dd/dd/ff failed\n", s);
    3d88:	fd843583          	ld	a1,-40(s0)
    3d8c:	00005517          	auipc	a0,0x5
    3d90:	36c50513          	addi	a0,a0,876 # 90f8 <malloc+0x1150>
    3d94:	00004097          	auipc	ra,0x4
    3d98:	022080e7          	jalr	34(ra) # 7db6 <printf>
    exit(1);
    3d9c:	4505                	li	a0,1
    3d9e:	00004097          	auipc	ra,0x4
    3da2:	aea080e7          	jalr	-1302(ra) # 7888 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    3da6:	4581                	li	a1,0
    3da8:	00005517          	auipc	a0,0x5
    3dac:	29050513          	addi	a0,a0,656 # 9038 <malloc+0x1090>
    3db0:	00004097          	auipc	ra,0x4
    3db4:	b18080e7          	jalr	-1256(ra) # 78c8 <open>
    3db8:	87aa                	mv	a5,a0
    3dba:	0207c163          	bltz	a5,3ddc <subdir+0x2d4>
    printf("%s: open (unlinked) dd/dd/ff succeeded\n", s);
    3dbe:	fd843583          	ld	a1,-40(s0)
    3dc2:	00005517          	auipc	a0,0x5
    3dc6:	35650513          	addi	a0,a0,854 # 9118 <malloc+0x1170>
    3dca:	00004097          	auipc	ra,0x4
    3dce:	fec080e7          	jalr	-20(ra) # 7db6 <printf>
    exit(1);
    3dd2:	4505                	li	a0,1
    3dd4:	00004097          	auipc	ra,0x4
    3dd8:	ab4080e7          	jalr	-1356(ra) # 7888 <exit>
  }

  if(chdir("dd") != 0){
    3ddc:	00005517          	auipc	a0,0x5
    3de0:	1bc50513          	addi	a0,a0,444 # 8f98 <malloc+0xff0>
    3de4:	00004097          	auipc	ra,0x4
    3de8:	b14080e7          	jalr	-1260(ra) # 78f8 <chdir>
    3dec:	87aa                	mv	a5,a0
    3dee:	c385                	beqz	a5,3e0e <subdir+0x306>
    printf("%s: chdir dd failed\n", s);
    3df0:	fd843583          	ld	a1,-40(s0)
    3df4:	00005517          	auipc	a0,0x5
    3df8:	34c50513          	addi	a0,a0,844 # 9140 <malloc+0x1198>
    3dfc:	00004097          	auipc	ra,0x4
    3e00:	fba080e7          	jalr	-70(ra) # 7db6 <printf>
    exit(1);
    3e04:	4505                	li	a0,1
    3e06:	00004097          	auipc	ra,0x4
    3e0a:	a82080e7          	jalr	-1406(ra) # 7888 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    3e0e:	00005517          	auipc	a0,0x5
    3e12:	34a50513          	addi	a0,a0,842 # 9158 <malloc+0x11b0>
    3e16:	00004097          	auipc	ra,0x4
    3e1a:	ae2080e7          	jalr	-1310(ra) # 78f8 <chdir>
    3e1e:	87aa                	mv	a5,a0
    3e20:	c385                	beqz	a5,3e40 <subdir+0x338>
    printf("%s: chdir dd/../../dd failed\n", s);
    3e22:	fd843583          	ld	a1,-40(s0)
    3e26:	00005517          	auipc	a0,0x5
    3e2a:	34250513          	addi	a0,a0,834 # 9168 <malloc+0x11c0>
    3e2e:	00004097          	auipc	ra,0x4
    3e32:	f88080e7          	jalr	-120(ra) # 7db6 <printf>
    exit(1);
    3e36:	4505                	li	a0,1
    3e38:	00004097          	auipc	ra,0x4
    3e3c:	a50080e7          	jalr	-1456(ra) # 7888 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    3e40:	00005517          	auipc	a0,0x5
    3e44:	34850513          	addi	a0,a0,840 # 9188 <malloc+0x11e0>
    3e48:	00004097          	auipc	ra,0x4
    3e4c:	ab0080e7          	jalr	-1360(ra) # 78f8 <chdir>
    3e50:	87aa                	mv	a5,a0
    3e52:	c385                	beqz	a5,3e72 <subdir+0x36a>
    printf("chdir dd/../../dd failed\n", s);
    3e54:	fd843583          	ld	a1,-40(s0)
    3e58:	00005517          	auipc	a0,0x5
    3e5c:	34050513          	addi	a0,a0,832 # 9198 <malloc+0x11f0>
    3e60:	00004097          	auipc	ra,0x4
    3e64:	f56080e7          	jalr	-170(ra) # 7db6 <printf>
    exit(1);
    3e68:	4505                	li	a0,1
    3e6a:	00004097          	auipc	ra,0x4
    3e6e:	a1e080e7          	jalr	-1506(ra) # 7888 <exit>
  }
  if(chdir("./..") != 0){
    3e72:	00005517          	auipc	a0,0x5
    3e76:	34650513          	addi	a0,a0,838 # 91b8 <malloc+0x1210>
    3e7a:	00004097          	auipc	ra,0x4
    3e7e:	a7e080e7          	jalr	-1410(ra) # 78f8 <chdir>
    3e82:	87aa                	mv	a5,a0
    3e84:	c385                	beqz	a5,3ea4 <subdir+0x39c>
    printf("%s: chdir ./.. failed\n", s);
    3e86:	fd843583          	ld	a1,-40(s0)
    3e8a:	00005517          	auipc	a0,0x5
    3e8e:	33650513          	addi	a0,a0,822 # 91c0 <malloc+0x1218>
    3e92:	00004097          	auipc	ra,0x4
    3e96:	f24080e7          	jalr	-220(ra) # 7db6 <printf>
    exit(1);
    3e9a:	4505                	li	a0,1
    3e9c:	00004097          	auipc	ra,0x4
    3ea0:	9ec080e7          	jalr	-1556(ra) # 7888 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    3ea4:	4581                	li	a1,0
    3ea6:	00005517          	auipc	a0,0x5
    3eaa:	21a50513          	addi	a0,a0,538 # 90c0 <malloc+0x1118>
    3eae:	00004097          	auipc	ra,0x4
    3eb2:	a1a080e7          	jalr	-1510(ra) # 78c8 <open>
    3eb6:	87aa                	mv	a5,a0
    3eb8:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    3ebc:	fec42783          	lw	a5,-20(s0)
    3ec0:	2781                	sext.w	a5,a5
    3ec2:	0207d163          	bgez	a5,3ee4 <subdir+0x3dc>
    printf("%s: open dd/dd/ffff failed\n", s);
    3ec6:	fd843583          	ld	a1,-40(s0)
    3eca:	00005517          	auipc	a0,0x5
    3ece:	30e50513          	addi	a0,a0,782 # 91d8 <malloc+0x1230>
    3ed2:	00004097          	auipc	ra,0x4
    3ed6:	ee4080e7          	jalr	-284(ra) # 7db6 <printf>
    exit(1);
    3eda:	4505                	li	a0,1
    3edc:	00004097          	auipc	ra,0x4
    3ee0:	9ac080e7          	jalr	-1620(ra) # 7888 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    3ee4:	fec42783          	lw	a5,-20(s0)
    3ee8:	660d                	lui	a2,0x3
    3eea:	00007597          	auipc	a1,0x7
    3eee:	56658593          	addi	a1,a1,1382 # b450 <buf>
    3ef2:	853e                	mv	a0,a5
    3ef4:	00004097          	auipc	ra,0x4
    3ef8:	9ac080e7          	jalr	-1620(ra) # 78a0 <read>
    3efc:	87aa                	mv	a5,a0
    3efe:	873e                	mv	a4,a5
    3f00:	4789                	li	a5,2
    3f02:	02f70163          	beq	a4,a5,3f24 <subdir+0x41c>
    printf("%s: read dd/dd/ffff wrong len\n", s);
    3f06:	fd843583          	ld	a1,-40(s0)
    3f0a:	00005517          	auipc	a0,0x5
    3f0e:	2ee50513          	addi	a0,a0,750 # 91f8 <malloc+0x1250>
    3f12:	00004097          	auipc	ra,0x4
    3f16:	ea4080e7          	jalr	-348(ra) # 7db6 <printf>
    exit(1);
    3f1a:	4505                	li	a0,1
    3f1c:	00004097          	auipc	ra,0x4
    3f20:	96c080e7          	jalr	-1684(ra) # 7888 <exit>
  }
  close(fd);
    3f24:	fec42783          	lw	a5,-20(s0)
    3f28:	853e                	mv	a0,a5
    3f2a:	00004097          	auipc	ra,0x4
    3f2e:	986080e7          	jalr	-1658(ra) # 78b0 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    3f32:	4581                	li	a1,0
    3f34:	00005517          	auipc	a0,0x5
    3f38:	10450513          	addi	a0,a0,260 # 9038 <malloc+0x1090>
    3f3c:	00004097          	auipc	ra,0x4
    3f40:	98c080e7          	jalr	-1652(ra) # 78c8 <open>
    3f44:	87aa                	mv	a5,a0
    3f46:	0207c163          	bltz	a5,3f68 <subdir+0x460>
    printf("%s: open (unlinked) dd/dd/ff succeeded!\n", s);
    3f4a:	fd843583          	ld	a1,-40(s0)
    3f4e:	00005517          	auipc	a0,0x5
    3f52:	2ca50513          	addi	a0,a0,714 # 9218 <malloc+0x1270>
    3f56:	00004097          	auipc	ra,0x4
    3f5a:	e60080e7          	jalr	-416(ra) # 7db6 <printf>
    exit(1);
    3f5e:	4505                	li	a0,1
    3f60:	00004097          	auipc	ra,0x4
    3f64:	928080e7          	jalr	-1752(ra) # 7888 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    3f68:	20200593          	li	a1,514
    3f6c:	00005517          	auipc	a0,0x5
    3f70:	2dc50513          	addi	a0,a0,732 # 9248 <malloc+0x12a0>
    3f74:	00004097          	auipc	ra,0x4
    3f78:	954080e7          	jalr	-1708(ra) # 78c8 <open>
    3f7c:	87aa                	mv	a5,a0
    3f7e:	0207c163          	bltz	a5,3fa0 <subdir+0x498>
    printf("%s: create dd/ff/ff succeeded!\n", s);
    3f82:	fd843583          	ld	a1,-40(s0)
    3f86:	00005517          	auipc	a0,0x5
    3f8a:	2d250513          	addi	a0,a0,722 # 9258 <malloc+0x12b0>
    3f8e:	00004097          	auipc	ra,0x4
    3f92:	e28080e7          	jalr	-472(ra) # 7db6 <printf>
    exit(1);
    3f96:	4505                	li	a0,1
    3f98:	00004097          	auipc	ra,0x4
    3f9c:	8f0080e7          	jalr	-1808(ra) # 7888 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    3fa0:	20200593          	li	a1,514
    3fa4:	00005517          	auipc	a0,0x5
    3fa8:	2d450513          	addi	a0,a0,724 # 9278 <malloc+0x12d0>
    3fac:	00004097          	auipc	ra,0x4
    3fb0:	91c080e7          	jalr	-1764(ra) # 78c8 <open>
    3fb4:	87aa                	mv	a5,a0
    3fb6:	0207c163          	bltz	a5,3fd8 <subdir+0x4d0>
    printf("%s: create dd/xx/ff succeeded!\n", s);
    3fba:	fd843583          	ld	a1,-40(s0)
    3fbe:	00005517          	auipc	a0,0x5
    3fc2:	2ca50513          	addi	a0,a0,714 # 9288 <malloc+0x12e0>
    3fc6:	00004097          	auipc	ra,0x4
    3fca:	df0080e7          	jalr	-528(ra) # 7db6 <printf>
    exit(1);
    3fce:	4505                	li	a0,1
    3fd0:	00004097          	auipc	ra,0x4
    3fd4:	8b8080e7          	jalr	-1864(ra) # 7888 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    3fd8:	20000593          	li	a1,512
    3fdc:	00005517          	auipc	a0,0x5
    3fe0:	fbc50513          	addi	a0,a0,-68 # 8f98 <malloc+0xff0>
    3fe4:	00004097          	auipc	ra,0x4
    3fe8:	8e4080e7          	jalr	-1820(ra) # 78c8 <open>
    3fec:	87aa                	mv	a5,a0
    3fee:	0207c163          	bltz	a5,4010 <subdir+0x508>
    printf("%s: create dd succeeded!\n", s);
    3ff2:	fd843583          	ld	a1,-40(s0)
    3ff6:	00005517          	auipc	a0,0x5
    3ffa:	2b250513          	addi	a0,a0,690 # 92a8 <malloc+0x1300>
    3ffe:	00004097          	auipc	ra,0x4
    4002:	db8080e7          	jalr	-584(ra) # 7db6 <printf>
    exit(1);
    4006:	4505                	li	a0,1
    4008:	00004097          	auipc	ra,0x4
    400c:	880080e7          	jalr	-1920(ra) # 7888 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    4010:	4589                	li	a1,2
    4012:	00005517          	auipc	a0,0x5
    4016:	f8650513          	addi	a0,a0,-122 # 8f98 <malloc+0xff0>
    401a:	00004097          	auipc	ra,0x4
    401e:	8ae080e7          	jalr	-1874(ra) # 78c8 <open>
    4022:	87aa                	mv	a5,a0
    4024:	0207c163          	bltz	a5,4046 <subdir+0x53e>
    printf("%s: open dd rdwr succeeded!\n", s);
    4028:	fd843583          	ld	a1,-40(s0)
    402c:	00005517          	auipc	a0,0x5
    4030:	29c50513          	addi	a0,a0,668 # 92c8 <malloc+0x1320>
    4034:	00004097          	auipc	ra,0x4
    4038:	d82080e7          	jalr	-638(ra) # 7db6 <printf>
    exit(1);
    403c:	4505                	li	a0,1
    403e:	00004097          	auipc	ra,0x4
    4042:	84a080e7          	jalr	-1974(ra) # 7888 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    4046:	4585                	li	a1,1
    4048:	00005517          	auipc	a0,0x5
    404c:	f5050513          	addi	a0,a0,-176 # 8f98 <malloc+0xff0>
    4050:	00004097          	auipc	ra,0x4
    4054:	878080e7          	jalr	-1928(ra) # 78c8 <open>
    4058:	87aa                	mv	a5,a0
    405a:	0207c163          	bltz	a5,407c <subdir+0x574>
    printf("%s: open dd wronly succeeded!\n", s);
    405e:	fd843583          	ld	a1,-40(s0)
    4062:	00005517          	auipc	a0,0x5
    4066:	28650513          	addi	a0,a0,646 # 92e8 <malloc+0x1340>
    406a:	00004097          	auipc	ra,0x4
    406e:	d4c080e7          	jalr	-692(ra) # 7db6 <printf>
    exit(1);
    4072:	4505                	li	a0,1
    4074:	00004097          	auipc	ra,0x4
    4078:	814080e7          	jalr	-2028(ra) # 7888 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    407c:	00005597          	auipc	a1,0x5
    4080:	28c58593          	addi	a1,a1,652 # 9308 <malloc+0x1360>
    4084:	00005517          	auipc	a0,0x5
    4088:	1c450513          	addi	a0,a0,452 # 9248 <malloc+0x12a0>
    408c:	00004097          	auipc	ra,0x4
    4090:	85c080e7          	jalr	-1956(ra) # 78e8 <link>
    4094:	87aa                	mv	a5,a0
    4096:	e385                	bnez	a5,40b6 <subdir+0x5ae>
    printf("%s: link dd/ff/ff dd/dd/xx succeeded!\n", s);
    4098:	fd843583          	ld	a1,-40(s0)
    409c:	00005517          	auipc	a0,0x5
    40a0:	27c50513          	addi	a0,a0,636 # 9318 <malloc+0x1370>
    40a4:	00004097          	auipc	ra,0x4
    40a8:	d12080e7          	jalr	-750(ra) # 7db6 <printf>
    exit(1);
    40ac:	4505                	li	a0,1
    40ae:	00003097          	auipc	ra,0x3
    40b2:	7da080e7          	jalr	2010(ra) # 7888 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    40b6:	00005597          	auipc	a1,0x5
    40ba:	25258593          	addi	a1,a1,594 # 9308 <malloc+0x1360>
    40be:	00005517          	auipc	a0,0x5
    40c2:	1ba50513          	addi	a0,a0,442 # 9278 <malloc+0x12d0>
    40c6:	00004097          	auipc	ra,0x4
    40ca:	822080e7          	jalr	-2014(ra) # 78e8 <link>
    40ce:	87aa                	mv	a5,a0
    40d0:	e385                	bnez	a5,40f0 <subdir+0x5e8>
    printf("%s: link dd/xx/ff dd/dd/xx succeeded!\n", s);
    40d2:	fd843583          	ld	a1,-40(s0)
    40d6:	00005517          	auipc	a0,0x5
    40da:	26a50513          	addi	a0,a0,618 # 9340 <malloc+0x1398>
    40de:	00004097          	auipc	ra,0x4
    40e2:	cd8080e7          	jalr	-808(ra) # 7db6 <printf>
    exit(1);
    40e6:	4505                	li	a0,1
    40e8:	00003097          	auipc	ra,0x3
    40ec:	7a0080e7          	jalr	1952(ra) # 7888 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    40f0:	00005597          	auipc	a1,0x5
    40f4:	fd058593          	addi	a1,a1,-48 # 90c0 <malloc+0x1118>
    40f8:	00005517          	auipc	a0,0x5
    40fc:	ec050513          	addi	a0,a0,-320 # 8fb8 <malloc+0x1010>
    4100:	00003097          	auipc	ra,0x3
    4104:	7e8080e7          	jalr	2024(ra) # 78e8 <link>
    4108:	87aa                	mv	a5,a0
    410a:	e385                	bnez	a5,412a <subdir+0x622>
    printf("%s: link dd/ff dd/dd/ffff succeeded!\n", s);
    410c:	fd843583          	ld	a1,-40(s0)
    4110:	00005517          	auipc	a0,0x5
    4114:	25850513          	addi	a0,a0,600 # 9368 <malloc+0x13c0>
    4118:	00004097          	auipc	ra,0x4
    411c:	c9e080e7          	jalr	-866(ra) # 7db6 <printf>
    exit(1);
    4120:	4505                	li	a0,1
    4122:	00003097          	auipc	ra,0x3
    4126:	766080e7          	jalr	1894(ra) # 7888 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    412a:	00005517          	auipc	a0,0x5
    412e:	11e50513          	addi	a0,a0,286 # 9248 <malloc+0x12a0>
    4132:	00003097          	auipc	ra,0x3
    4136:	7be080e7          	jalr	1982(ra) # 78f0 <mkdir>
    413a:	87aa                	mv	a5,a0
    413c:	e385                	bnez	a5,415c <subdir+0x654>
    printf("%s: mkdir dd/ff/ff succeeded!\n", s);
    413e:	fd843583          	ld	a1,-40(s0)
    4142:	00005517          	auipc	a0,0x5
    4146:	24e50513          	addi	a0,a0,590 # 9390 <malloc+0x13e8>
    414a:	00004097          	auipc	ra,0x4
    414e:	c6c080e7          	jalr	-916(ra) # 7db6 <printf>
    exit(1);
    4152:	4505                	li	a0,1
    4154:	00003097          	auipc	ra,0x3
    4158:	734080e7          	jalr	1844(ra) # 7888 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    415c:	00005517          	auipc	a0,0x5
    4160:	11c50513          	addi	a0,a0,284 # 9278 <malloc+0x12d0>
    4164:	00003097          	auipc	ra,0x3
    4168:	78c080e7          	jalr	1932(ra) # 78f0 <mkdir>
    416c:	87aa                	mv	a5,a0
    416e:	e385                	bnez	a5,418e <subdir+0x686>
    printf("%s: mkdir dd/xx/ff succeeded!\n", s);
    4170:	fd843583          	ld	a1,-40(s0)
    4174:	00005517          	auipc	a0,0x5
    4178:	23c50513          	addi	a0,a0,572 # 93b0 <malloc+0x1408>
    417c:	00004097          	auipc	ra,0x4
    4180:	c3a080e7          	jalr	-966(ra) # 7db6 <printf>
    exit(1);
    4184:	4505                	li	a0,1
    4186:	00003097          	auipc	ra,0x3
    418a:	702080e7          	jalr	1794(ra) # 7888 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    418e:	00005517          	auipc	a0,0x5
    4192:	f3250513          	addi	a0,a0,-206 # 90c0 <malloc+0x1118>
    4196:	00003097          	auipc	ra,0x3
    419a:	75a080e7          	jalr	1882(ra) # 78f0 <mkdir>
    419e:	87aa                	mv	a5,a0
    41a0:	e385                	bnez	a5,41c0 <subdir+0x6b8>
    printf("%s: mkdir dd/dd/ffff succeeded!\n", s);
    41a2:	fd843583          	ld	a1,-40(s0)
    41a6:	00005517          	auipc	a0,0x5
    41aa:	22a50513          	addi	a0,a0,554 # 93d0 <malloc+0x1428>
    41ae:	00004097          	auipc	ra,0x4
    41b2:	c08080e7          	jalr	-1016(ra) # 7db6 <printf>
    exit(1);
    41b6:	4505                	li	a0,1
    41b8:	00003097          	auipc	ra,0x3
    41bc:	6d0080e7          	jalr	1744(ra) # 7888 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    41c0:	00005517          	auipc	a0,0x5
    41c4:	0b850513          	addi	a0,a0,184 # 9278 <malloc+0x12d0>
    41c8:	00003097          	auipc	ra,0x3
    41cc:	710080e7          	jalr	1808(ra) # 78d8 <unlink>
    41d0:	87aa                	mv	a5,a0
    41d2:	e385                	bnez	a5,41f2 <subdir+0x6ea>
    printf("%s: unlink dd/xx/ff succeeded!\n", s);
    41d4:	fd843583          	ld	a1,-40(s0)
    41d8:	00005517          	auipc	a0,0x5
    41dc:	22050513          	addi	a0,a0,544 # 93f8 <malloc+0x1450>
    41e0:	00004097          	auipc	ra,0x4
    41e4:	bd6080e7          	jalr	-1066(ra) # 7db6 <printf>
    exit(1);
    41e8:	4505                	li	a0,1
    41ea:	00003097          	auipc	ra,0x3
    41ee:	69e080e7          	jalr	1694(ra) # 7888 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    41f2:	00005517          	auipc	a0,0x5
    41f6:	05650513          	addi	a0,a0,86 # 9248 <malloc+0x12a0>
    41fa:	00003097          	auipc	ra,0x3
    41fe:	6de080e7          	jalr	1758(ra) # 78d8 <unlink>
    4202:	87aa                	mv	a5,a0
    4204:	e385                	bnez	a5,4224 <subdir+0x71c>
    printf("%s: unlink dd/ff/ff succeeded!\n", s);
    4206:	fd843583          	ld	a1,-40(s0)
    420a:	00005517          	auipc	a0,0x5
    420e:	20e50513          	addi	a0,a0,526 # 9418 <malloc+0x1470>
    4212:	00004097          	auipc	ra,0x4
    4216:	ba4080e7          	jalr	-1116(ra) # 7db6 <printf>
    exit(1);
    421a:	4505                	li	a0,1
    421c:	00003097          	auipc	ra,0x3
    4220:	66c080e7          	jalr	1644(ra) # 7888 <exit>
  }
  if(chdir("dd/ff") == 0){
    4224:	00005517          	auipc	a0,0x5
    4228:	d9450513          	addi	a0,a0,-620 # 8fb8 <malloc+0x1010>
    422c:	00003097          	auipc	ra,0x3
    4230:	6cc080e7          	jalr	1740(ra) # 78f8 <chdir>
    4234:	87aa                	mv	a5,a0
    4236:	e385                	bnez	a5,4256 <subdir+0x74e>
    printf("%s: chdir dd/ff succeeded!\n", s);
    4238:	fd843583          	ld	a1,-40(s0)
    423c:	00005517          	auipc	a0,0x5
    4240:	1fc50513          	addi	a0,a0,508 # 9438 <malloc+0x1490>
    4244:	00004097          	auipc	ra,0x4
    4248:	b72080e7          	jalr	-1166(ra) # 7db6 <printf>
    exit(1);
    424c:	4505                	li	a0,1
    424e:	00003097          	auipc	ra,0x3
    4252:	63a080e7          	jalr	1594(ra) # 7888 <exit>
  }
  if(chdir("dd/xx") == 0){
    4256:	00005517          	auipc	a0,0x5
    425a:	20250513          	addi	a0,a0,514 # 9458 <malloc+0x14b0>
    425e:	00003097          	auipc	ra,0x3
    4262:	69a080e7          	jalr	1690(ra) # 78f8 <chdir>
    4266:	87aa                	mv	a5,a0
    4268:	e385                	bnez	a5,4288 <subdir+0x780>
    printf("%s: chdir dd/xx succeeded!\n", s);
    426a:	fd843583          	ld	a1,-40(s0)
    426e:	00005517          	auipc	a0,0x5
    4272:	1f250513          	addi	a0,a0,498 # 9460 <malloc+0x14b8>
    4276:	00004097          	auipc	ra,0x4
    427a:	b40080e7          	jalr	-1216(ra) # 7db6 <printf>
    exit(1);
    427e:	4505                	li	a0,1
    4280:	00003097          	auipc	ra,0x3
    4284:	608080e7          	jalr	1544(ra) # 7888 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    4288:	00005517          	auipc	a0,0x5
    428c:	e3850513          	addi	a0,a0,-456 # 90c0 <malloc+0x1118>
    4290:	00003097          	auipc	ra,0x3
    4294:	648080e7          	jalr	1608(ra) # 78d8 <unlink>
    4298:	87aa                	mv	a5,a0
    429a:	c385                	beqz	a5,42ba <subdir+0x7b2>
    printf("%s: unlink dd/dd/ff failed\n", s);
    429c:	fd843583          	ld	a1,-40(s0)
    42a0:	00005517          	auipc	a0,0x5
    42a4:	e5850513          	addi	a0,a0,-424 # 90f8 <malloc+0x1150>
    42a8:	00004097          	auipc	ra,0x4
    42ac:	b0e080e7          	jalr	-1266(ra) # 7db6 <printf>
    exit(1);
    42b0:	4505                	li	a0,1
    42b2:	00003097          	auipc	ra,0x3
    42b6:	5d6080e7          	jalr	1494(ra) # 7888 <exit>
  }
  if(unlink("dd/ff") != 0){
    42ba:	00005517          	auipc	a0,0x5
    42be:	cfe50513          	addi	a0,a0,-770 # 8fb8 <malloc+0x1010>
    42c2:	00003097          	auipc	ra,0x3
    42c6:	616080e7          	jalr	1558(ra) # 78d8 <unlink>
    42ca:	87aa                	mv	a5,a0
    42cc:	c385                	beqz	a5,42ec <subdir+0x7e4>
    printf("%s: unlink dd/ff failed\n", s);
    42ce:	fd843583          	ld	a1,-40(s0)
    42d2:	00005517          	auipc	a0,0x5
    42d6:	1ae50513          	addi	a0,a0,430 # 9480 <malloc+0x14d8>
    42da:	00004097          	auipc	ra,0x4
    42de:	adc080e7          	jalr	-1316(ra) # 7db6 <printf>
    exit(1);
    42e2:	4505                	li	a0,1
    42e4:	00003097          	auipc	ra,0x3
    42e8:	5a4080e7          	jalr	1444(ra) # 7888 <exit>
  }
  if(unlink("dd") == 0){
    42ec:	00005517          	auipc	a0,0x5
    42f0:	cac50513          	addi	a0,a0,-852 # 8f98 <malloc+0xff0>
    42f4:	00003097          	auipc	ra,0x3
    42f8:	5e4080e7          	jalr	1508(ra) # 78d8 <unlink>
    42fc:	87aa                	mv	a5,a0
    42fe:	e385                	bnez	a5,431e <subdir+0x816>
    printf("%s: unlink non-empty dd succeeded!\n", s);
    4300:	fd843583          	ld	a1,-40(s0)
    4304:	00005517          	auipc	a0,0x5
    4308:	19c50513          	addi	a0,a0,412 # 94a0 <malloc+0x14f8>
    430c:	00004097          	auipc	ra,0x4
    4310:	aaa080e7          	jalr	-1366(ra) # 7db6 <printf>
    exit(1);
    4314:	4505                	li	a0,1
    4316:	00003097          	auipc	ra,0x3
    431a:	572080e7          	jalr	1394(ra) # 7888 <exit>
  }
  if(unlink("dd/dd") < 0){
    431e:	00005517          	auipc	a0,0x5
    4322:	1aa50513          	addi	a0,a0,426 # 94c8 <malloc+0x1520>
    4326:	00003097          	auipc	ra,0x3
    432a:	5b2080e7          	jalr	1458(ra) # 78d8 <unlink>
    432e:	87aa                	mv	a5,a0
    4330:	0207d163          	bgez	a5,4352 <subdir+0x84a>
    printf("%s: unlink dd/dd failed\n", s);
    4334:	fd843583          	ld	a1,-40(s0)
    4338:	00005517          	auipc	a0,0x5
    433c:	19850513          	addi	a0,a0,408 # 94d0 <malloc+0x1528>
    4340:	00004097          	auipc	ra,0x4
    4344:	a76080e7          	jalr	-1418(ra) # 7db6 <printf>
    exit(1);
    4348:	4505                	li	a0,1
    434a:	00003097          	auipc	ra,0x3
    434e:	53e080e7          	jalr	1342(ra) # 7888 <exit>
  }
  if(unlink("dd") < 0){
    4352:	00005517          	auipc	a0,0x5
    4356:	c4650513          	addi	a0,a0,-954 # 8f98 <malloc+0xff0>
    435a:	00003097          	auipc	ra,0x3
    435e:	57e080e7          	jalr	1406(ra) # 78d8 <unlink>
    4362:	87aa                	mv	a5,a0
    4364:	0207d163          	bgez	a5,4386 <subdir+0x87e>
    printf("%s: unlink dd failed\n", s);
    4368:	fd843583          	ld	a1,-40(s0)
    436c:	00005517          	auipc	a0,0x5
    4370:	18450513          	addi	a0,a0,388 # 94f0 <malloc+0x1548>
    4374:	00004097          	auipc	ra,0x4
    4378:	a42080e7          	jalr	-1470(ra) # 7db6 <printf>
    exit(1);
    437c:	4505                	li	a0,1
    437e:	00003097          	auipc	ra,0x3
    4382:	50a080e7          	jalr	1290(ra) # 7888 <exit>
  }
}
    4386:	0001                	nop
    4388:	70a2                	ld	ra,40(sp)
    438a:	7402                	ld	s0,32(sp)
    438c:	6145                	addi	sp,sp,48
    438e:	8082                	ret

0000000000004390 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(char *s)
{
    4390:	7179                	addi	sp,sp,-48
    4392:	f406                	sd	ra,40(sp)
    4394:	f022                	sd	s0,32(sp)
    4396:	1800                	addi	s0,sp,48
    4398:	fca43c23          	sd	a0,-40(s0)
  int fd, sz;

  unlink("bigwrite");
    439c:	00005517          	auipc	a0,0x5
    43a0:	16c50513          	addi	a0,a0,364 # 9508 <malloc+0x1560>
    43a4:	00003097          	auipc	ra,0x3
    43a8:	534080e7          	jalr	1332(ra) # 78d8 <unlink>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
    43ac:	1f300793          	li	a5,499
    43b0:	fef42623          	sw	a5,-20(s0)
    43b4:	a0e5                	j	449c <bigwrite+0x10c>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    43b6:	20200593          	li	a1,514
    43ba:	00005517          	auipc	a0,0x5
    43be:	14e50513          	addi	a0,a0,334 # 9508 <malloc+0x1560>
    43c2:	00003097          	auipc	ra,0x3
    43c6:	506080e7          	jalr	1286(ra) # 78c8 <open>
    43ca:	87aa                	mv	a5,a0
    43cc:	fef42223          	sw	a5,-28(s0)
    if(fd < 0){
    43d0:	fe442783          	lw	a5,-28(s0)
    43d4:	2781                	sext.w	a5,a5
    43d6:	0207d163          	bgez	a5,43f8 <bigwrite+0x68>
      printf("%s: cannot create bigwrite\n", s);
    43da:	fd843583          	ld	a1,-40(s0)
    43de:	00005517          	auipc	a0,0x5
    43e2:	13a50513          	addi	a0,a0,314 # 9518 <malloc+0x1570>
    43e6:	00004097          	auipc	ra,0x4
    43ea:	9d0080e7          	jalr	-1584(ra) # 7db6 <printf>
      exit(1);
    43ee:	4505                	li	a0,1
    43f0:	00003097          	auipc	ra,0x3
    43f4:	498080e7          	jalr	1176(ra) # 7888 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    43f8:	fe042423          	sw	zero,-24(s0)
    43fc:	a0a5                	j	4464 <bigwrite+0xd4>
      int cc = write(fd, buf, sz);
    43fe:	fec42703          	lw	a4,-20(s0)
    4402:	fe442783          	lw	a5,-28(s0)
    4406:	863a                	mv	a2,a4
    4408:	00007597          	auipc	a1,0x7
    440c:	04858593          	addi	a1,a1,72 # b450 <buf>
    4410:	853e                	mv	a0,a5
    4412:	00003097          	auipc	ra,0x3
    4416:	496080e7          	jalr	1174(ra) # 78a8 <write>
    441a:	87aa                	mv	a5,a0
    441c:	fef42023          	sw	a5,-32(s0)
      if(cc != sz){
    4420:	fe042703          	lw	a4,-32(s0)
    4424:	fec42783          	lw	a5,-20(s0)
    4428:	2701                	sext.w	a4,a4
    442a:	2781                	sext.w	a5,a5
    442c:	02f70763          	beq	a4,a5,445a <bigwrite+0xca>
        printf("%s: write(%d) ret %d\n", s, sz, cc);
    4430:	fe042703          	lw	a4,-32(s0)
    4434:	fec42783          	lw	a5,-20(s0)
    4438:	86ba                	mv	a3,a4
    443a:	863e                	mv	a2,a5
    443c:	fd843583          	ld	a1,-40(s0)
    4440:	00005517          	auipc	a0,0x5
    4444:	0f850513          	addi	a0,a0,248 # 9538 <malloc+0x1590>
    4448:	00004097          	auipc	ra,0x4
    444c:	96e080e7          	jalr	-1682(ra) # 7db6 <printf>
        exit(1);
    4450:	4505                	li	a0,1
    4452:	00003097          	auipc	ra,0x3
    4456:	436080e7          	jalr	1078(ra) # 7888 <exit>
    for(i = 0; i < 2; i++){
    445a:	fe842783          	lw	a5,-24(s0)
    445e:	2785                	addiw	a5,a5,1
    4460:	fef42423          	sw	a5,-24(s0)
    4464:	fe842783          	lw	a5,-24(s0)
    4468:	0007871b          	sext.w	a4,a5
    446c:	4785                	li	a5,1
    446e:	f8e7d8e3          	bge	a5,a4,43fe <bigwrite+0x6e>
      }
    }
    close(fd);
    4472:	fe442783          	lw	a5,-28(s0)
    4476:	853e                	mv	a0,a5
    4478:	00003097          	auipc	ra,0x3
    447c:	438080e7          	jalr	1080(ra) # 78b0 <close>
    unlink("bigwrite");
    4480:	00005517          	auipc	a0,0x5
    4484:	08850513          	addi	a0,a0,136 # 9508 <malloc+0x1560>
    4488:	00003097          	auipc	ra,0x3
    448c:	450080e7          	jalr	1104(ra) # 78d8 <unlink>
  for(sz = 499; sz < (MAXOPBLOCKS+2)*BSIZE; sz += 471){
    4490:	fec42783          	lw	a5,-20(s0)
    4494:	1d77879b          	addiw	a5,a5,471
    4498:	fef42623          	sw	a5,-20(s0)
    449c:	fec42783          	lw	a5,-20(s0)
    44a0:	0007871b          	sext.w	a4,a5
    44a4:	678d                	lui	a5,0x3
    44a6:	f0f748e3          	blt	a4,a5,43b6 <bigwrite+0x26>
  }
}
    44aa:	0001                	nop
    44ac:	0001                	nop
    44ae:	70a2                	ld	ra,40(sp)
    44b0:	7402                	ld	s0,32(sp)
    44b2:	6145                	addi	sp,sp,48
    44b4:	8082                	ret

00000000000044b6 <bigfile>:


void
bigfile(char *s)
{
    44b6:	7179                	addi	sp,sp,-48
    44b8:	f406                	sd	ra,40(sp)
    44ba:	f022                	sd	s0,32(sp)
    44bc:	1800                	addi	s0,sp,48
    44be:	fca43c23          	sd	a0,-40(s0)
  enum { N = 20, SZ=600 };
  int fd, i, total, cc;

  unlink("bigfile.dat");
    44c2:	00005517          	auipc	a0,0x5
    44c6:	08e50513          	addi	a0,a0,142 # 9550 <malloc+0x15a8>
    44ca:	00003097          	auipc	ra,0x3
    44ce:	40e080e7          	jalr	1038(ra) # 78d8 <unlink>
  fd = open("bigfile.dat", O_CREATE | O_RDWR);
    44d2:	20200593          	li	a1,514
    44d6:	00005517          	auipc	a0,0x5
    44da:	07a50513          	addi	a0,a0,122 # 9550 <malloc+0x15a8>
    44de:	00003097          	auipc	ra,0x3
    44e2:	3ea080e7          	jalr	1002(ra) # 78c8 <open>
    44e6:	87aa                	mv	a5,a0
    44e8:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
    44ec:	fe442783          	lw	a5,-28(s0)
    44f0:	2781                	sext.w	a5,a5
    44f2:	0207d163          	bgez	a5,4514 <bigfile+0x5e>
    printf("%s: cannot create bigfile", s);
    44f6:	fd843583          	ld	a1,-40(s0)
    44fa:	00005517          	auipc	a0,0x5
    44fe:	06650513          	addi	a0,a0,102 # 9560 <malloc+0x15b8>
    4502:	00004097          	auipc	ra,0x4
    4506:	8b4080e7          	jalr	-1868(ra) # 7db6 <printf>
    exit(1);
    450a:	4505                	li	a0,1
    450c:	00003097          	auipc	ra,0x3
    4510:	37c080e7          	jalr	892(ra) # 7888 <exit>
  }
  for(i = 0; i < N; i++){
    4514:	fe042623          	sw	zero,-20(s0)
    4518:	a0ad                	j	4582 <bigfile+0xcc>
    memset(buf, i, SZ);
    451a:	fec42783          	lw	a5,-20(s0)
    451e:	25800613          	li	a2,600
    4522:	85be                	mv	a1,a5
    4524:	00007517          	auipc	a0,0x7
    4528:	f2c50513          	addi	a0,a0,-212 # b450 <buf>
    452c:	00003097          	auipc	ra,0x3
    4530:	fb2080e7          	jalr	-78(ra) # 74de <memset>
    if(write(fd, buf, SZ) != SZ){
    4534:	fe442783          	lw	a5,-28(s0)
    4538:	25800613          	li	a2,600
    453c:	00007597          	auipc	a1,0x7
    4540:	f1458593          	addi	a1,a1,-236 # b450 <buf>
    4544:	853e                	mv	a0,a5
    4546:	00003097          	auipc	ra,0x3
    454a:	362080e7          	jalr	866(ra) # 78a8 <write>
    454e:	87aa                	mv	a5,a0
    4550:	873e                	mv	a4,a5
    4552:	25800793          	li	a5,600
    4556:	02f70163          	beq	a4,a5,4578 <bigfile+0xc2>
      printf("%s: write bigfile failed\n", s);
    455a:	fd843583          	ld	a1,-40(s0)
    455e:	00005517          	auipc	a0,0x5
    4562:	02250513          	addi	a0,a0,34 # 9580 <malloc+0x15d8>
    4566:	00004097          	auipc	ra,0x4
    456a:	850080e7          	jalr	-1968(ra) # 7db6 <printf>
      exit(1);
    456e:	4505                	li	a0,1
    4570:	00003097          	auipc	ra,0x3
    4574:	318080e7          	jalr	792(ra) # 7888 <exit>
  for(i = 0; i < N; i++){
    4578:	fec42783          	lw	a5,-20(s0)
    457c:	2785                	addiw	a5,a5,1
    457e:	fef42623          	sw	a5,-20(s0)
    4582:	fec42783          	lw	a5,-20(s0)
    4586:	0007871b          	sext.w	a4,a5
    458a:	47cd                	li	a5,19
    458c:	f8e7d7e3          	bge	a5,a4,451a <bigfile+0x64>
    }
  }
  close(fd);
    4590:	fe442783          	lw	a5,-28(s0)
    4594:	853e                	mv	a0,a5
    4596:	00003097          	auipc	ra,0x3
    459a:	31a080e7          	jalr	794(ra) # 78b0 <close>

  fd = open("bigfile.dat", 0);
    459e:	4581                	li	a1,0
    45a0:	00005517          	auipc	a0,0x5
    45a4:	fb050513          	addi	a0,a0,-80 # 9550 <malloc+0x15a8>
    45a8:	00003097          	auipc	ra,0x3
    45ac:	320080e7          	jalr	800(ra) # 78c8 <open>
    45b0:	87aa                	mv	a5,a0
    45b2:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
    45b6:	fe442783          	lw	a5,-28(s0)
    45ba:	2781                	sext.w	a5,a5
    45bc:	0207d163          	bgez	a5,45de <bigfile+0x128>
    printf("%s: cannot open bigfile\n", s);
    45c0:	fd843583          	ld	a1,-40(s0)
    45c4:	00005517          	auipc	a0,0x5
    45c8:	fdc50513          	addi	a0,a0,-36 # 95a0 <malloc+0x15f8>
    45cc:	00003097          	auipc	ra,0x3
    45d0:	7ea080e7          	jalr	2026(ra) # 7db6 <printf>
    exit(1);
    45d4:	4505                	li	a0,1
    45d6:	00003097          	auipc	ra,0x3
    45da:	2b2080e7          	jalr	690(ra) # 7888 <exit>
  }
  total = 0;
    45de:	fe042423          	sw	zero,-24(s0)
  for(i = 0; ; i++){
    45e2:	fe042623          	sw	zero,-20(s0)
    cc = read(fd, buf, SZ/2);
    45e6:	fe442783          	lw	a5,-28(s0)
    45ea:	12c00613          	li	a2,300
    45ee:	00007597          	auipc	a1,0x7
    45f2:	e6258593          	addi	a1,a1,-414 # b450 <buf>
    45f6:	853e                	mv	a0,a5
    45f8:	00003097          	auipc	ra,0x3
    45fc:	2a8080e7          	jalr	680(ra) # 78a0 <read>
    4600:	87aa                	mv	a5,a0
    4602:	fef42023          	sw	a5,-32(s0)
    if(cc < 0){
    4606:	fe042783          	lw	a5,-32(s0)
    460a:	2781                	sext.w	a5,a5
    460c:	0207d163          	bgez	a5,462e <bigfile+0x178>
      printf("%s: read bigfile failed\n", s);
    4610:	fd843583          	ld	a1,-40(s0)
    4614:	00005517          	auipc	a0,0x5
    4618:	fac50513          	addi	a0,a0,-84 # 95c0 <malloc+0x1618>
    461c:	00003097          	auipc	ra,0x3
    4620:	79a080e7          	jalr	1946(ra) # 7db6 <printf>
      exit(1);
    4624:	4505                	li	a0,1
    4626:	00003097          	auipc	ra,0x3
    462a:	262080e7          	jalr	610(ra) # 7888 <exit>
    }
    if(cc == 0)
    462e:	fe042783          	lw	a5,-32(s0)
    4632:	2781                	sext.w	a5,a5
    4634:	cbd5                	beqz	a5,46e8 <bigfile+0x232>
      break;
    if(cc != SZ/2){
    4636:	fe042783          	lw	a5,-32(s0)
    463a:	0007871b          	sext.w	a4,a5
    463e:	12c00793          	li	a5,300
    4642:	02f70163          	beq	a4,a5,4664 <bigfile+0x1ae>
      printf("%s: short read bigfile\n", s);
    4646:	fd843583          	ld	a1,-40(s0)
    464a:	00005517          	auipc	a0,0x5
    464e:	f9650513          	addi	a0,a0,-106 # 95e0 <malloc+0x1638>
    4652:	00003097          	auipc	ra,0x3
    4656:	764080e7          	jalr	1892(ra) # 7db6 <printf>
      exit(1);
    465a:	4505                	li	a0,1
    465c:	00003097          	auipc	ra,0x3
    4660:	22c080e7          	jalr	556(ra) # 7888 <exit>
    }
    if(buf[0] != i/2 || buf[SZ/2-1] != i/2){
    4664:	00007797          	auipc	a5,0x7
    4668:	dec78793          	addi	a5,a5,-532 # b450 <buf>
    466c:	0007c783          	lbu	a5,0(a5)
    4670:	0007869b          	sext.w	a3,a5
    4674:	fec42783          	lw	a5,-20(s0)
    4678:	01f7d71b          	srliw	a4,a5,0x1f
    467c:	9fb9                	addw	a5,a5,a4
    467e:	4017d79b          	sraiw	a5,a5,0x1
    4682:	2781                	sext.w	a5,a5
    4684:	8736                	mv	a4,a3
    4686:	02f71563          	bne	a4,a5,46b0 <bigfile+0x1fa>
    468a:	00007797          	auipc	a5,0x7
    468e:	dc678793          	addi	a5,a5,-570 # b450 <buf>
    4692:	12b7c783          	lbu	a5,299(a5)
    4696:	0007869b          	sext.w	a3,a5
    469a:	fec42783          	lw	a5,-20(s0)
    469e:	01f7d71b          	srliw	a4,a5,0x1f
    46a2:	9fb9                	addw	a5,a5,a4
    46a4:	4017d79b          	sraiw	a5,a5,0x1
    46a8:	2781                	sext.w	a5,a5
    46aa:	8736                	mv	a4,a3
    46ac:	02f70163          	beq	a4,a5,46ce <bigfile+0x218>
      printf("%s: read bigfile wrong data\n", s);
    46b0:	fd843583          	ld	a1,-40(s0)
    46b4:	00005517          	auipc	a0,0x5
    46b8:	f4450513          	addi	a0,a0,-188 # 95f8 <malloc+0x1650>
    46bc:	00003097          	auipc	ra,0x3
    46c0:	6fa080e7          	jalr	1786(ra) # 7db6 <printf>
      exit(1);
    46c4:	4505                	li	a0,1
    46c6:	00003097          	auipc	ra,0x3
    46ca:	1c2080e7          	jalr	450(ra) # 7888 <exit>
    }
    total += cc;
    46ce:	fe842703          	lw	a4,-24(s0)
    46d2:	fe042783          	lw	a5,-32(s0)
    46d6:	9fb9                	addw	a5,a5,a4
    46d8:	fef42423          	sw	a5,-24(s0)
  for(i = 0; ; i++){
    46dc:	fec42783          	lw	a5,-20(s0)
    46e0:	2785                	addiw	a5,a5,1
    46e2:	fef42623          	sw	a5,-20(s0)
    cc = read(fd, buf, SZ/2);
    46e6:	b701                	j	45e6 <bigfile+0x130>
      break;
    46e8:	0001                	nop
  }
  close(fd);
    46ea:	fe442783          	lw	a5,-28(s0)
    46ee:	853e                	mv	a0,a5
    46f0:	00003097          	auipc	ra,0x3
    46f4:	1c0080e7          	jalr	448(ra) # 78b0 <close>
  if(total != N*SZ){
    46f8:	fe842783          	lw	a5,-24(s0)
    46fc:	0007871b          	sext.w	a4,a5
    4700:	678d                	lui	a5,0x3
    4702:	ee078793          	addi	a5,a5,-288 # 2ee0 <createdelete+0x15e>
    4706:	02f70163          	beq	a4,a5,4728 <bigfile+0x272>
    printf("%s: read bigfile wrong total\n", s);
    470a:	fd843583          	ld	a1,-40(s0)
    470e:	00005517          	auipc	a0,0x5
    4712:	f0a50513          	addi	a0,a0,-246 # 9618 <malloc+0x1670>
    4716:	00003097          	auipc	ra,0x3
    471a:	6a0080e7          	jalr	1696(ra) # 7db6 <printf>
    exit(1);
    471e:	4505                	li	a0,1
    4720:	00003097          	auipc	ra,0x3
    4724:	168080e7          	jalr	360(ra) # 7888 <exit>
  }
  unlink("bigfile.dat");
    4728:	00005517          	auipc	a0,0x5
    472c:	e2850513          	addi	a0,a0,-472 # 9550 <malloc+0x15a8>
    4730:	00003097          	auipc	ra,0x3
    4734:	1a8080e7          	jalr	424(ra) # 78d8 <unlink>
}
    4738:	0001                	nop
    473a:	70a2                	ld	ra,40(sp)
    473c:	7402                	ld	s0,32(sp)
    473e:	6145                	addi	sp,sp,48
    4740:	8082                	ret

0000000000004742 <fourteen>:

void
fourteen(char *s)
{
    4742:	7179                	addi	sp,sp,-48
    4744:	f406                	sd	ra,40(sp)
    4746:	f022                	sd	s0,32(sp)
    4748:	1800                	addi	s0,sp,48
    474a:	fca43c23          	sd	a0,-40(s0)
  int fd;

  // DIRSIZ is 14.

  if(mkdir("12345678901234") != 0){
    474e:	00005517          	auipc	a0,0x5
    4752:	eea50513          	addi	a0,a0,-278 # 9638 <malloc+0x1690>
    4756:	00003097          	auipc	ra,0x3
    475a:	19a080e7          	jalr	410(ra) # 78f0 <mkdir>
    475e:	87aa                	mv	a5,a0
    4760:	c385                	beqz	a5,4780 <fourteen+0x3e>
    printf("%s: mkdir 12345678901234 failed\n", s);
    4762:	fd843583          	ld	a1,-40(s0)
    4766:	00005517          	auipc	a0,0x5
    476a:	ee250513          	addi	a0,a0,-286 # 9648 <malloc+0x16a0>
    476e:	00003097          	auipc	ra,0x3
    4772:	648080e7          	jalr	1608(ra) # 7db6 <printf>
    exit(1);
    4776:	4505                	li	a0,1
    4778:	00003097          	auipc	ra,0x3
    477c:	110080e7          	jalr	272(ra) # 7888 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    4780:	00005517          	auipc	a0,0x5
    4784:	ef050513          	addi	a0,a0,-272 # 9670 <malloc+0x16c8>
    4788:	00003097          	auipc	ra,0x3
    478c:	168080e7          	jalr	360(ra) # 78f0 <mkdir>
    4790:	87aa                	mv	a5,a0
    4792:	c385                	beqz	a5,47b2 <fourteen+0x70>
    printf("%s: mkdir 12345678901234/123456789012345 failed\n", s);
    4794:	fd843583          	ld	a1,-40(s0)
    4798:	00005517          	auipc	a0,0x5
    479c:	ef850513          	addi	a0,a0,-264 # 9690 <malloc+0x16e8>
    47a0:	00003097          	auipc	ra,0x3
    47a4:	616080e7          	jalr	1558(ra) # 7db6 <printf>
    exit(1);
    47a8:	4505                	li	a0,1
    47aa:	00003097          	auipc	ra,0x3
    47ae:	0de080e7          	jalr	222(ra) # 7888 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    47b2:	20000593          	li	a1,512
    47b6:	00005517          	auipc	a0,0x5
    47ba:	f1250513          	addi	a0,a0,-238 # 96c8 <malloc+0x1720>
    47be:	00003097          	auipc	ra,0x3
    47c2:	10a080e7          	jalr	266(ra) # 78c8 <open>
    47c6:	87aa                	mv	a5,a0
    47c8:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    47cc:	fec42783          	lw	a5,-20(s0)
    47d0:	2781                	sext.w	a5,a5
    47d2:	0207d163          	bgez	a5,47f4 <fourteen+0xb2>
    printf("%s: create 123456789012345/123456789012345/123456789012345 failed\n", s);
    47d6:	fd843583          	ld	a1,-40(s0)
    47da:	00005517          	auipc	a0,0x5
    47de:	f1e50513          	addi	a0,a0,-226 # 96f8 <malloc+0x1750>
    47e2:	00003097          	auipc	ra,0x3
    47e6:	5d4080e7          	jalr	1492(ra) # 7db6 <printf>
    exit(1);
    47ea:	4505                	li	a0,1
    47ec:	00003097          	auipc	ra,0x3
    47f0:	09c080e7          	jalr	156(ra) # 7888 <exit>
  }
  close(fd);
    47f4:	fec42783          	lw	a5,-20(s0)
    47f8:	853e                	mv	a0,a5
    47fa:	00003097          	auipc	ra,0x3
    47fe:	0b6080e7          	jalr	182(ra) # 78b0 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    4802:	4581                	li	a1,0
    4804:	00005517          	auipc	a0,0x5
    4808:	f3c50513          	addi	a0,a0,-196 # 9740 <malloc+0x1798>
    480c:	00003097          	auipc	ra,0x3
    4810:	0bc080e7          	jalr	188(ra) # 78c8 <open>
    4814:	87aa                	mv	a5,a0
    4816:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    481a:	fec42783          	lw	a5,-20(s0)
    481e:	2781                	sext.w	a5,a5
    4820:	0207d163          	bgez	a5,4842 <fourteen+0x100>
    printf("%s: open 12345678901234/12345678901234/12345678901234 failed\n", s);
    4824:	fd843583          	ld	a1,-40(s0)
    4828:	00005517          	auipc	a0,0x5
    482c:	f4850513          	addi	a0,a0,-184 # 9770 <malloc+0x17c8>
    4830:	00003097          	auipc	ra,0x3
    4834:	586080e7          	jalr	1414(ra) # 7db6 <printf>
    exit(1);
    4838:	4505                	li	a0,1
    483a:	00003097          	auipc	ra,0x3
    483e:	04e080e7          	jalr	78(ra) # 7888 <exit>
  }
  close(fd);
    4842:	fec42783          	lw	a5,-20(s0)
    4846:	853e                	mv	a0,a5
    4848:	00003097          	auipc	ra,0x3
    484c:	068080e7          	jalr	104(ra) # 78b0 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    4850:	00005517          	auipc	a0,0x5
    4854:	f6050513          	addi	a0,a0,-160 # 97b0 <malloc+0x1808>
    4858:	00003097          	auipc	ra,0x3
    485c:	098080e7          	jalr	152(ra) # 78f0 <mkdir>
    4860:	87aa                	mv	a5,a0
    4862:	e385                	bnez	a5,4882 <fourteen+0x140>
    printf("%s: mkdir 12345678901234/12345678901234 succeeded!\n", s);
    4864:	fd843583          	ld	a1,-40(s0)
    4868:	00005517          	auipc	a0,0x5
    486c:	f6850513          	addi	a0,a0,-152 # 97d0 <malloc+0x1828>
    4870:	00003097          	auipc	ra,0x3
    4874:	546080e7          	jalr	1350(ra) # 7db6 <printf>
    exit(1);
    4878:	4505                	li	a0,1
    487a:	00003097          	auipc	ra,0x3
    487e:	00e080e7          	jalr	14(ra) # 7888 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    4882:	00005517          	auipc	a0,0x5
    4886:	f8650513          	addi	a0,a0,-122 # 9808 <malloc+0x1860>
    488a:	00003097          	auipc	ra,0x3
    488e:	066080e7          	jalr	102(ra) # 78f0 <mkdir>
    4892:	87aa                	mv	a5,a0
    4894:	e385                	bnez	a5,48b4 <fourteen+0x172>
    printf("%s: mkdir 12345678901234/123456789012345 succeeded!\n", s);
    4896:	fd843583          	ld	a1,-40(s0)
    489a:	00005517          	auipc	a0,0x5
    489e:	f8e50513          	addi	a0,a0,-114 # 9828 <malloc+0x1880>
    48a2:	00003097          	auipc	ra,0x3
    48a6:	514080e7          	jalr	1300(ra) # 7db6 <printf>
    exit(1);
    48aa:	4505                	li	a0,1
    48ac:	00003097          	auipc	ra,0x3
    48b0:	fdc080e7          	jalr	-36(ra) # 7888 <exit>
  }

  // clean up
  unlink("123456789012345/12345678901234");
    48b4:	00005517          	auipc	a0,0x5
    48b8:	f5450513          	addi	a0,a0,-172 # 9808 <malloc+0x1860>
    48bc:	00003097          	auipc	ra,0x3
    48c0:	01c080e7          	jalr	28(ra) # 78d8 <unlink>
  unlink("12345678901234/12345678901234");
    48c4:	00005517          	auipc	a0,0x5
    48c8:	eec50513          	addi	a0,a0,-276 # 97b0 <malloc+0x1808>
    48cc:	00003097          	auipc	ra,0x3
    48d0:	00c080e7          	jalr	12(ra) # 78d8 <unlink>
  unlink("12345678901234/12345678901234/12345678901234");
    48d4:	00005517          	auipc	a0,0x5
    48d8:	e6c50513          	addi	a0,a0,-404 # 9740 <malloc+0x1798>
    48dc:	00003097          	auipc	ra,0x3
    48e0:	ffc080e7          	jalr	-4(ra) # 78d8 <unlink>
  unlink("123456789012345/123456789012345/123456789012345");
    48e4:	00005517          	auipc	a0,0x5
    48e8:	de450513          	addi	a0,a0,-540 # 96c8 <malloc+0x1720>
    48ec:	00003097          	auipc	ra,0x3
    48f0:	fec080e7          	jalr	-20(ra) # 78d8 <unlink>
  unlink("12345678901234/123456789012345");
    48f4:	00005517          	auipc	a0,0x5
    48f8:	d7c50513          	addi	a0,a0,-644 # 9670 <malloc+0x16c8>
    48fc:	00003097          	auipc	ra,0x3
    4900:	fdc080e7          	jalr	-36(ra) # 78d8 <unlink>
  unlink("12345678901234");
    4904:	00005517          	auipc	a0,0x5
    4908:	d3450513          	addi	a0,a0,-716 # 9638 <malloc+0x1690>
    490c:	00003097          	auipc	ra,0x3
    4910:	fcc080e7          	jalr	-52(ra) # 78d8 <unlink>
}
    4914:	0001                	nop
    4916:	70a2                	ld	ra,40(sp)
    4918:	7402                	ld	s0,32(sp)
    491a:	6145                	addi	sp,sp,48
    491c:	8082                	ret

000000000000491e <rmdot>:

void
rmdot(char *s)
{
    491e:	1101                	addi	sp,sp,-32
    4920:	ec06                	sd	ra,24(sp)
    4922:	e822                	sd	s0,16(sp)
    4924:	1000                	addi	s0,sp,32
    4926:	fea43423          	sd	a0,-24(s0)
  if(mkdir("dots") != 0){
    492a:	00005517          	auipc	a0,0x5
    492e:	f3650513          	addi	a0,a0,-202 # 9860 <malloc+0x18b8>
    4932:	00003097          	auipc	ra,0x3
    4936:	fbe080e7          	jalr	-66(ra) # 78f0 <mkdir>
    493a:	87aa                	mv	a5,a0
    493c:	c385                	beqz	a5,495c <rmdot+0x3e>
    printf("%s: mkdir dots failed\n", s);
    493e:	fe843583          	ld	a1,-24(s0)
    4942:	00005517          	auipc	a0,0x5
    4946:	f2650513          	addi	a0,a0,-218 # 9868 <malloc+0x18c0>
    494a:	00003097          	auipc	ra,0x3
    494e:	46c080e7          	jalr	1132(ra) # 7db6 <printf>
    exit(1);
    4952:	4505                	li	a0,1
    4954:	00003097          	auipc	ra,0x3
    4958:	f34080e7          	jalr	-204(ra) # 7888 <exit>
  }
  if(chdir("dots") != 0){
    495c:	00005517          	auipc	a0,0x5
    4960:	f0450513          	addi	a0,a0,-252 # 9860 <malloc+0x18b8>
    4964:	00003097          	auipc	ra,0x3
    4968:	f94080e7          	jalr	-108(ra) # 78f8 <chdir>
    496c:	87aa                	mv	a5,a0
    496e:	c385                	beqz	a5,498e <rmdot+0x70>
    printf("%s: chdir dots failed\n", s);
    4970:	fe843583          	ld	a1,-24(s0)
    4974:	00005517          	auipc	a0,0x5
    4978:	f0c50513          	addi	a0,a0,-244 # 9880 <malloc+0x18d8>
    497c:	00003097          	auipc	ra,0x3
    4980:	43a080e7          	jalr	1082(ra) # 7db6 <printf>
    exit(1);
    4984:	4505                	li	a0,1
    4986:	00003097          	auipc	ra,0x3
    498a:	f02080e7          	jalr	-254(ra) # 7888 <exit>
  }
  if(unlink(".") == 0){
    498e:	00004517          	auipc	a0,0x4
    4992:	52a50513          	addi	a0,a0,1322 # 8eb8 <malloc+0xf10>
    4996:	00003097          	auipc	ra,0x3
    499a:	f42080e7          	jalr	-190(ra) # 78d8 <unlink>
    499e:	87aa                	mv	a5,a0
    49a0:	e385                	bnez	a5,49c0 <rmdot+0xa2>
    printf("%s: rm . worked!\n", s);
    49a2:	fe843583          	ld	a1,-24(s0)
    49a6:	00005517          	auipc	a0,0x5
    49aa:	ef250513          	addi	a0,a0,-270 # 9898 <malloc+0x18f0>
    49ae:	00003097          	auipc	ra,0x3
    49b2:	408080e7          	jalr	1032(ra) # 7db6 <printf>
    exit(1);
    49b6:	4505                	li	a0,1
    49b8:	00003097          	auipc	ra,0x3
    49bc:	ed0080e7          	jalr	-304(ra) # 7888 <exit>
  }
  if(unlink("..") == 0){
    49c0:	00004517          	auipc	a0,0x4
    49c4:	f7050513          	addi	a0,a0,-144 # 8930 <malloc+0x988>
    49c8:	00003097          	auipc	ra,0x3
    49cc:	f10080e7          	jalr	-240(ra) # 78d8 <unlink>
    49d0:	87aa                	mv	a5,a0
    49d2:	e385                	bnez	a5,49f2 <rmdot+0xd4>
    printf("%s: rm .. worked!\n", s);
    49d4:	fe843583          	ld	a1,-24(s0)
    49d8:	00005517          	auipc	a0,0x5
    49dc:	ed850513          	addi	a0,a0,-296 # 98b0 <malloc+0x1908>
    49e0:	00003097          	auipc	ra,0x3
    49e4:	3d6080e7          	jalr	982(ra) # 7db6 <printf>
    exit(1);
    49e8:	4505                	li	a0,1
    49ea:	00003097          	auipc	ra,0x3
    49ee:	e9e080e7          	jalr	-354(ra) # 7888 <exit>
  }
  if(chdir("/") != 0){
    49f2:	00004517          	auipc	a0,0x4
    49f6:	c5650513          	addi	a0,a0,-938 # 8648 <malloc+0x6a0>
    49fa:	00003097          	auipc	ra,0x3
    49fe:	efe080e7          	jalr	-258(ra) # 78f8 <chdir>
    4a02:	87aa                	mv	a5,a0
    4a04:	c385                	beqz	a5,4a24 <rmdot+0x106>
    printf("%s: chdir / failed\n", s);
    4a06:	fe843583          	ld	a1,-24(s0)
    4a0a:	00004517          	auipc	a0,0x4
    4a0e:	c4650513          	addi	a0,a0,-954 # 8650 <malloc+0x6a8>
    4a12:	00003097          	auipc	ra,0x3
    4a16:	3a4080e7          	jalr	932(ra) # 7db6 <printf>
    exit(1);
    4a1a:	4505                	li	a0,1
    4a1c:	00003097          	auipc	ra,0x3
    4a20:	e6c080e7          	jalr	-404(ra) # 7888 <exit>
  }
  if(unlink("dots/.") == 0){
    4a24:	00005517          	auipc	a0,0x5
    4a28:	ea450513          	addi	a0,a0,-348 # 98c8 <malloc+0x1920>
    4a2c:	00003097          	auipc	ra,0x3
    4a30:	eac080e7          	jalr	-340(ra) # 78d8 <unlink>
    4a34:	87aa                	mv	a5,a0
    4a36:	e385                	bnez	a5,4a56 <rmdot+0x138>
    printf("%s: unlink dots/. worked!\n", s);
    4a38:	fe843583          	ld	a1,-24(s0)
    4a3c:	00005517          	auipc	a0,0x5
    4a40:	e9450513          	addi	a0,a0,-364 # 98d0 <malloc+0x1928>
    4a44:	00003097          	auipc	ra,0x3
    4a48:	372080e7          	jalr	882(ra) # 7db6 <printf>
    exit(1);
    4a4c:	4505                	li	a0,1
    4a4e:	00003097          	auipc	ra,0x3
    4a52:	e3a080e7          	jalr	-454(ra) # 7888 <exit>
  }
  if(unlink("dots/..") == 0){
    4a56:	00005517          	auipc	a0,0x5
    4a5a:	e9a50513          	addi	a0,a0,-358 # 98f0 <malloc+0x1948>
    4a5e:	00003097          	auipc	ra,0x3
    4a62:	e7a080e7          	jalr	-390(ra) # 78d8 <unlink>
    4a66:	87aa                	mv	a5,a0
    4a68:	e385                	bnez	a5,4a88 <rmdot+0x16a>
    printf("%s: unlink dots/.. worked!\n", s);
    4a6a:	fe843583          	ld	a1,-24(s0)
    4a6e:	00005517          	auipc	a0,0x5
    4a72:	e8a50513          	addi	a0,a0,-374 # 98f8 <malloc+0x1950>
    4a76:	00003097          	auipc	ra,0x3
    4a7a:	340080e7          	jalr	832(ra) # 7db6 <printf>
    exit(1);
    4a7e:	4505                	li	a0,1
    4a80:	00003097          	auipc	ra,0x3
    4a84:	e08080e7          	jalr	-504(ra) # 7888 <exit>
  }
  if(unlink("dots") != 0){
    4a88:	00005517          	auipc	a0,0x5
    4a8c:	dd850513          	addi	a0,a0,-552 # 9860 <malloc+0x18b8>
    4a90:	00003097          	auipc	ra,0x3
    4a94:	e48080e7          	jalr	-440(ra) # 78d8 <unlink>
    4a98:	87aa                	mv	a5,a0
    4a9a:	c385                	beqz	a5,4aba <rmdot+0x19c>
    printf("%s: unlink dots failed!\n", s);
    4a9c:	fe843583          	ld	a1,-24(s0)
    4aa0:	00005517          	auipc	a0,0x5
    4aa4:	e7850513          	addi	a0,a0,-392 # 9918 <malloc+0x1970>
    4aa8:	00003097          	auipc	ra,0x3
    4aac:	30e080e7          	jalr	782(ra) # 7db6 <printf>
    exit(1);
    4ab0:	4505                	li	a0,1
    4ab2:	00003097          	auipc	ra,0x3
    4ab6:	dd6080e7          	jalr	-554(ra) # 7888 <exit>
  }
}
    4aba:	0001                	nop
    4abc:	60e2                	ld	ra,24(sp)
    4abe:	6442                	ld	s0,16(sp)
    4ac0:	6105                	addi	sp,sp,32
    4ac2:	8082                	ret

0000000000004ac4 <dirfile>:

void
dirfile(char *s)
{
    4ac4:	7179                	addi	sp,sp,-48
    4ac6:	f406                	sd	ra,40(sp)
    4ac8:	f022                	sd	s0,32(sp)
    4aca:	1800                	addi	s0,sp,48
    4acc:	fca43c23          	sd	a0,-40(s0)
  int fd;

  fd = open("dirfile", O_CREATE);
    4ad0:	20000593          	li	a1,512
    4ad4:	00005517          	auipc	a0,0x5
    4ad8:	e6450513          	addi	a0,a0,-412 # 9938 <malloc+0x1990>
    4adc:	00003097          	auipc	ra,0x3
    4ae0:	dec080e7          	jalr	-532(ra) # 78c8 <open>
    4ae4:	87aa                	mv	a5,a0
    4ae6:	fef42623          	sw	a5,-20(s0)
  if(fd < 0){
    4aea:	fec42783          	lw	a5,-20(s0)
    4aee:	2781                	sext.w	a5,a5
    4af0:	0207d163          	bgez	a5,4b12 <dirfile+0x4e>
    printf("%s: create dirfile failed\n", s);
    4af4:	fd843583          	ld	a1,-40(s0)
    4af8:	00005517          	auipc	a0,0x5
    4afc:	e4850513          	addi	a0,a0,-440 # 9940 <malloc+0x1998>
    4b00:	00003097          	auipc	ra,0x3
    4b04:	2b6080e7          	jalr	694(ra) # 7db6 <printf>
    exit(1);
    4b08:	4505                	li	a0,1
    4b0a:	00003097          	auipc	ra,0x3
    4b0e:	d7e080e7          	jalr	-642(ra) # 7888 <exit>
  }
  close(fd);
    4b12:	fec42783          	lw	a5,-20(s0)
    4b16:	853e                	mv	a0,a5
    4b18:	00003097          	auipc	ra,0x3
    4b1c:	d98080e7          	jalr	-616(ra) # 78b0 <close>
  if(chdir("dirfile") == 0){
    4b20:	00005517          	auipc	a0,0x5
    4b24:	e1850513          	addi	a0,a0,-488 # 9938 <malloc+0x1990>
    4b28:	00003097          	auipc	ra,0x3
    4b2c:	dd0080e7          	jalr	-560(ra) # 78f8 <chdir>
    4b30:	87aa                	mv	a5,a0
    4b32:	e385                	bnez	a5,4b52 <dirfile+0x8e>
    printf("%s: chdir dirfile succeeded!\n", s);
    4b34:	fd843583          	ld	a1,-40(s0)
    4b38:	00005517          	auipc	a0,0x5
    4b3c:	e2850513          	addi	a0,a0,-472 # 9960 <malloc+0x19b8>
    4b40:	00003097          	auipc	ra,0x3
    4b44:	276080e7          	jalr	630(ra) # 7db6 <printf>
    exit(1);
    4b48:	4505                	li	a0,1
    4b4a:	00003097          	auipc	ra,0x3
    4b4e:	d3e080e7          	jalr	-706(ra) # 7888 <exit>
  }
  fd = open("dirfile/xx", 0);
    4b52:	4581                	li	a1,0
    4b54:	00005517          	auipc	a0,0x5
    4b58:	e2c50513          	addi	a0,a0,-468 # 9980 <malloc+0x19d8>
    4b5c:	00003097          	auipc	ra,0x3
    4b60:	d6c080e7          	jalr	-660(ra) # 78c8 <open>
    4b64:	87aa                	mv	a5,a0
    4b66:	fef42623          	sw	a5,-20(s0)
  if(fd >= 0){
    4b6a:	fec42783          	lw	a5,-20(s0)
    4b6e:	2781                	sext.w	a5,a5
    4b70:	0207c163          	bltz	a5,4b92 <dirfile+0xce>
    printf("%s: create dirfile/xx succeeded!\n", s);
    4b74:	fd843583          	ld	a1,-40(s0)
    4b78:	00005517          	auipc	a0,0x5
    4b7c:	e1850513          	addi	a0,a0,-488 # 9990 <malloc+0x19e8>
    4b80:	00003097          	auipc	ra,0x3
    4b84:	236080e7          	jalr	566(ra) # 7db6 <printf>
    exit(1);
    4b88:	4505                	li	a0,1
    4b8a:	00003097          	auipc	ra,0x3
    4b8e:	cfe080e7          	jalr	-770(ra) # 7888 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    4b92:	20000593          	li	a1,512
    4b96:	00005517          	auipc	a0,0x5
    4b9a:	dea50513          	addi	a0,a0,-534 # 9980 <malloc+0x19d8>
    4b9e:	00003097          	auipc	ra,0x3
    4ba2:	d2a080e7          	jalr	-726(ra) # 78c8 <open>
    4ba6:	87aa                	mv	a5,a0
    4ba8:	fef42623          	sw	a5,-20(s0)
  if(fd >= 0){
    4bac:	fec42783          	lw	a5,-20(s0)
    4bb0:	2781                	sext.w	a5,a5
    4bb2:	0207c163          	bltz	a5,4bd4 <dirfile+0x110>
    printf("%s: create dirfile/xx succeeded!\n", s);
    4bb6:	fd843583          	ld	a1,-40(s0)
    4bba:	00005517          	auipc	a0,0x5
    4bbe:	dd650513          	addi	a0,a0,-554 # 9990 <malloc+0x19e8>
    4bc2:	00003097          	auipc	ra,0x3
    4bc6:	1f4080e7          	jalr	500(ra) # 7db6 <printf>
    exit(1);
    4bca:	4505                	li	a0,1
    4bcc:	00003097          	auipc	ra,0x3
    4bd0:	cbc080e7          	jalr	-836(ra) # 7888 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    4bd4:	00005517          	auipc	a0,0x5
    4bd8:	dac50513          	addi	a0,a0,-596 # 9980 <malloc+0x19d8>
    4bdc:	00003097          	auipc	ra,0x3
    4be0:	d14080e7          	jalr	-748(ra) # 78f0 <mkdir>
    4be4:	87aa                	mv	a5,a0
    4be6:	e385                	bnez	a5,4c06 <dirfile+0x142>
    printf("%s: mkdir dirfile/xx succeeded!\n", s);
    4be8:	fd843583          	ld	a1,-40(s0)
    4bec:	00005517          	auipc	a0,0x5
    4bf0:	dcc50513          	addi	a0,a0,-564 # 99b8 <malloc+0x1a10>
    4bf4:	00003097          	auipc	ra,0x3
    4bf8:	1c2080e7          	jalr	450(ra) # 7db6 <printf>
    exit(1);
    4bfc:	4505                	li	a0,1
    4bfe:	00003097          	auipc	ra,0x3
    4c02:	c8a080e7          	jalr	-886(ra) # 7888 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    4c06:	00005517          	auipc	a0,0x5
    4c0a:	d7a50513          	addi	a0,a0,-646 # 9980 <malloc+0x19d8>
    4c0e:	00003097          	auipc	ra,0x3
    4c12:	cca080e7          	jalr	-822(ra) # 78d8 <unlink>
    4c16:	87aa                	mv	a5,a0
    4c18:	e385                	bnez	a5,4c38 <dirfile+0x174>
    printf("%s: unlink dirfile/xx succeeded!\n", s);
    4c1a:	fd843583          	ld	a1,-40(s0)
    4c1e:	00005517          	auipc	a0,0x5
    4c22:	dc250513          	addi	a0,a0,-574 # 99e0 <malloc+0x1a38>
    4c26:	00003097          	auipc	ra,0x3
    4c2a:	190080e7          	jalr	400(ra) # 7db6 <printf>
    exit(1);
    4c2e:	4505                	li	a0,1
    4c30:	00003097          	auipc	ra,0x3
    4c34:	c58080e7          	jalr	-936(ra) # 7888 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    4c38:	00005597          	auipc	a1,0x5
    4c3c:	d4858593          	addi	a1,a1,-696 # 9980 <malloc+0x19d8>
    4c40:	00003517          	auipc	a0,0x3
    4c44:	59050513          	addi	a0,a0,1424 # 81d0 <malloc+0x228>
    4c48:	00003097          	auipc	ra,0x3
    4c4c:	ca0080e7          	jalr	-864(ra) # 78e8 <link>
    4c50:	87aa                	mv	a5,a0
    4c52:	e385                	bnez	a5,4c72 <dirfile+0x1ae>
    printf("%s: link to dirfile/xx succeeded!\n", s);
    4c54:	fd843583          	ld	a1,-40(s0)
    4c58:	00005517          	auipc	a0,0x5
    4c5c:	db050513          	addi	a0,a0,-592 # 9a08 <malloc+0x1a60>
    4c60:	00003097          	auipc	ra,0x3
    4c64:	156080e7          	jalr	342(ra) # 7db6 <printf>
    exit(1);
    4c68:	4505                	li	a0,1
    4c6a:	00003097          	auipc	ra,0x3
    4c6e:	c1e080e7          	jalr	-994(ra) # 7888 <exit>
  }
  if(unlink("dirfile") != 0){
    4c72:	00005517          	auipc	a0,0x5
    4c76:	cc650513          	addi	a0,a0,-826 # 9938 <malloc+0x1990>
    4c7a:	00003097          	auipc	ra,0x3
    4c7e:	c5e080e7          	jalr	-930(ra) # 78d8 <unlink>
    4c82:	87aa                	mv	a5,a0
    4c84:	c385                	beqz	a5,4ca4 <dirfile+0x1e0>
    printf("%s: unlink dirfile failed!\n", s);
    4c86:	fd843583          	ld	a1,-40(s0)
    4c8a:	00005517          	auipc	a0,0x5
    4c8e:	da650513          	addi	a0,a0,-602 # 9a30 <malloc+0x1a88>
    4c92:	00003097          	auipc	ra,0x3
    4c96:	124080e7          	jalr	292(ra) # 7db6 <printf>
    exit(1);
    4c9a:	4505                	li	a0,1
    4c9c:	00003097          	auipc	ra,0x3
    4ca0:	bec080e7          	jalr	-1044(ra) # 7888 <exit>
  }

  fd = open(".", O_RDWR);
    4ca4:	4589                	li	a1,2
    4ca6:	00004517          	auipc	a0,0x4
    4caa:	21250513          	addi	a0,a0,530 # 8eb8 <malloc+0xf10>
    4cae:	00003097          	auipc	ra,0x3
    4cb2:	c1a080e7          	jalr	-998(ra) # 78c8 <open>
    4cb6:	87aa                	mv	a5,a0
    4cb8:	fef42623          	sw	a5,-20(s0)
  if(fd >= 0){
    4cbc:	fec42783          	lw	a5,-20(s0)
    4cc0:	2781                	sext.w	a5,a5
    4cc2:	0207c163          	bltz	a5,4ce4 <dirfile+0x220>
    printf("%s: open . for writing succeeded!\n", s);
    4cc6:	fd843583          	ld	a1,-40(s0)
    4cca:	00005517          	auipc	a0,0x5
    4cce:	d8650513          	addi	a0,a0,-634 # 9a50 <malloc+0x1aa8>
    4cd2:	00003097          	auipc	ra,0x3
    4cd6:	0e4080e7          	jalr	228(ra) # 7db6 <printf>
    exit(1);
    4cda:	4505                	li	a0,1
    4cdc:	00003097          	auipc	ra,0x3
    4ce0:	bac080e7          	jalr	-1108(ra) # 7888 <exit>
  }
  fd = open(".", 0);
    4ce4:	4581                	li	a1,0
    4ce6:	00004517          	auipc	a0,0x4
    4cea:	1d250513          	addi	a0,a0,466 # 8eb8 <malloc+0xf10>
    4cee:	00003097          	auipc	ra,0x3
    4cf2:	bda080e7          	jalr	-1062(ra) # 78c8 <open>
    4cf6:	87aa                	mv	a5,a0
    4cf8:	fef42623          	sw	a5,-20(s0)
  if(write(fd, "x", 1) > 0){
    4cfc:	fec42783          	lw	a5,-20(s0)
    4d00:	4605                	li	a2,1
    4d02:	00003597          	auipc	a1,0x3
    4d06:	51e58593          	addi	a1,a1,1310 # 8220 <malloc+0x278>
    4d0a:	853e                	mv	a0,a5
    4d0c:	00003097          	auipc	ra,0x3
    4d10:	b9c080e7          	jalr	-1124(ra) # 78a8 <write>
    4d14:	87aa                	mv	a5,a0
    4d16:	02f05163          	blez	a5,4d38 <dirfile+0x274>
    printf("%s: write . succeeded!\n", s);
    4d1a:	fd843583          	ld	a1,-40(s0)
    4d1e:	00005517          	auipc	a0,0x5
    4d22:	d5a50513          	addi	a0,a0,-678 # 9a78 <malloc+0x1ad0>
    4d26:	00003097          	auipc	ra,0x3
    4d2a:	090080e7          	jalr	144(ra) # 7db6 <printf>
    exit(1);
    4d2e:	4505                	li	a0,1
    4d30:	00003097          	auipc	ra,0x3
    4d34:	b58080e7          	jalr	-1192(ra) # 7888 <exit>
  }
  close(fd);
    4d38:	fec42783          	lw	a5,-20(s0)
    4d3c:	853e                	mv	a0,a5
    4d3e:	00003097          	auipc	ra,0x3
    4d42:	b72080e7          	jalr	-1166(ra) # 78b0 <close>
}
    4d46:	0001                	nop
    4d48:	70a2                	ld	ra,40(sp)
    4d4a:	7402                	ld	s0,32(sp)
    4d4c:	6145                	addi	sp,sp,48
    4d4e:	8082                	ret

0000000000004d50 <iref>:

// test that iput() is called at the end of _namei().
// also tests empty file names.
void
iref(char *s)
{
    4d50:	7179                	addi	sp,sp,-48
    4d52:	f406                	sd	ra,40(sp)
    4d54:	f022                	sd	s0,32(sp)
    4d56:	1800                	addi	s0,sp,48
    4d58:	fca43c23          	sd	a0,-40(s0)
  int i, fd;

  for(i = 0; i < NINODE + 1; i++){
    4d5c:	fe042623          	sw	zero,-20(s0)
    4d60:	a231                	j	4e6c <iref+0x11c>
    if(mkdir("irefd") != 0){
    4d62:	00005517          	auipc	a0,0x5
    4d66:	d2e50513          	addi	a0,a0,-722 # 9a90 <malloc+0x1ae8>
    4d6a:	00003097          	auipc	ra,0x3
    4d6e:	b86080e7          	jalr	-1146(ra) # 78f0 <mkdir>
    4d72:	87aa                	mv	a5,a0
    4d74:	c385                	beqz	a5,4d94 <iref+0x44>
      printf("%s: mkdir irefd failed\n", s);
    4d76:	fd843583          	ld	a1,-40(s0)
    4d7a:	00005517          	auipc	a0,0x5
    4d7e:	d1e50513          	addi	a0,a0,-738 # 9a98 <malloc+0x1af0>
    4d82:	00003097          	auipc	ra,0x3
    4d86:	034080e7          	jalr	52(ra) # 7db6 <printf>
      exit(1);
    4d8a:	4505                	li	a0,1
    4d8c:	00003097          	auipc	ra,0x3
    4d90:	afc080e7          	jalr	-1284(ra) # 7888 <exit>
    }
    if(chdir("irefd") != 0){
    4d94:	00005517          	auipc	a0,0x5
    4d98:	cfc50513          	addi	a0,a0,-772 # 9a90 <malloc+0x1ae8>
    4d9c:	00003097          	auipc	ra,0x3
    4da0:	b5c080e7          	jalr	-1188(ra) # 78f8 <chdir>
    4da4:	87aa                	mv	a5,a0
    4da6:	c385                	beqz	a5,4dc6 <iref+0x76>
      printf("%s: chdir irefd failed\n", s);
    4da8:	fd843583          	ld	a1,-40(s0)
    4dac:	00005517          	auipc	a0,0x5
    4db0:	d0450513          	addi	a0,a0,-764 # 9ab0 <malloc+0x1b08>
    4db4:	00003097          	auipc	ra,0x3
    4db8:	002080e7          	jalr	2(ra) # 7db6 <printf>
      exit(1);
    4dbc:	4505                	li	a0,1
    4dbe:	00003097          	auipc	ra,0x3
    4dc2:	aca080e7          	jalr	-1334(ra) # 7888 <exit>
    }

    mkdir("");
    4dc6:	00005517          	auipc	a0,0x5
    4dca:	d0250513          	addi	a0,a0,-766 # 9ac8 <malloc+0x1b20>
    4dce:	00003097          	auipc	ra,0x3
    4dd2:	b22080e7          	jalr	-1246(ra) # 78f0 <mkdir>
    link("README", "");
    4dd6:	00005597          	auipc	a1,0x5
    4dda:	cf258593          	addi	a1,a1,-782 # 9ac8 <malloc+0x1b20>
    4dde:	00003517          	auipc	a0,0x3
    4de2:	3f250513          	addi	a0,a0,1010 # 81d0 <malloc+0x228>
    4de6:	00003097          	auipc	ra,0x3
    4dea:	b02080e7          	jalr	-1278(ra) # 78e8 <link>
    fd = open("", O_CREATE);
    4dee:	20000593          	li	a1,512
    4df2:	00005517          	auipc	a0,0x5
    4df6:	cd650513          	addi	a0,a0,-810 # 9ac8 <malloc+0x1b20>
    4dfa:	00003097          	auipc	ra,0x3
    4dfe:	ace080e7          	jalr	-1330(ra) # 78c8 <open>
    4e02:	87aa                	mv	a5,a0
    4e04:	fef42423          	sw	a5,-24(s0)
    if(fd >= 0)
    4e08:	fe842783          	lw	a5,-24(s0)
    4e0c:	2781                	sext.w	a5,a5
    4e0e:	0007c963          	bltz	a5,4e20 <iref+0xd0>
      close(fd);
    4e12:	fe842783          	lw	a5,-24(s0)
    4e16:	853e                	mv	a0,a5
    4e18:	00003097          	auipc	ra,0x3
    4e1c:	a98080e7          	jalr	-1384(ra) # 78b0 <close>
    fd = open("xx", O_CREATE);
    4e20:	20000593          	li	a1,512
    4e24:	00003517          	auipc	a0,0x3
    4e28:	4d450513          	addi	a0,a0,1236 # 82f8 <malloc+0x350>
    4e2c:	00003097          	auipc	ra,0x3
    4e30:	a9c080e7          	jalr	-1380(ra) # 78c8 <open>
    4e34:	87aa                	mv	a5,a0
    4e36:	fef42423          	sw	a5,-24(s0)
    if(fd >= 0)
    4e3a:	fe842783          	lw	a5,-24(s0)
    4e3e:	2781                	sext.w	a5,a5
    4e40:	0007c963          	bltz	a5,4e52 <iref+0x102>
      close(fd);
    4e44:	fe842783          	lw	a5,-24(s0)
    4e48:	853e                	mv	a0,a5
    4e4a:	00003097          	auipc	ra,0x3
    4e4e:	a66080e7          	jalr	-1434(ra) # 78b0 <close>
    unlink("xx");
    4e52:	00003517          	auipc	a0,0x3
    4e56:	4a650513          	addi	a0,a0,1190 # 82f8 <malloc+0x350>
    4e5a:	00003097          	auipc	ra,0x3
    4e5e:	a7e080e7          	jalr	-1410(ra) # 78d8 <unlink>
  for(i = 0; i < NINODE + 1; i++){
    4e62:	fec42783          	lw	a5,-20(s0)
    4e66:	2785                	addiw	a5,a5,1
    4e68:	fef42623          	sw	a5,-20(s0)
    4e6c:	fec42783          	lw	a5,-20(s0)
    4e70:	0007871b          	sext.w	a4,a5
    4e74:	03200793          	li	a5,50
    4e78:	eee7d5e3          	bge	a5,a4,4d62 <iref+0x12>
  }

  // clean up
  for(i = 0; i < NINODE + 1; i++){
    4e7c:	fe042623          	sw	zero,-20(s0)
    4e80:	a035                	j	4eac <iref+0x15c>
    chdir("..");
    4e82:	00004517          	auipc	a0,0x4
    4e86:	aae50513          	addi	a0,a0,-1362 # 8930 <malloc+0x988>
    4e8a:	00003097          	auipc	ra,0x3
    4e8e:	a6e080e7          	jalr	-1426(ra) # 78f8 <chdir>
    unlink("irefd");
    4e92:	00005517          	auipc	a0,0x5
    4e96:	bfe50513          	addi	a0,a0,-1026 # 9a90 <malloc+0x1ae8>
    4e9a:	00003097          	auipc	ra,0x3
    4e9e:	a3e080e7          	jalr	-1474(ra) # 78d8 <unlink>
  for(i = 0; i < NINODE + 1; i++){
    4ea2:	fec42783          	lw	a5,-20(s0)
    4ea6:	2785                	addiw	a5,a5,1
    4ea8:	fef42623          	sw	a5,-20(s0)
    4eac:	fec42783          	lw	a5,-20(s0)
    4eb0:	0007871b          	sext.w	a4,a5
    4eb4:	03200793          	li	a5,50
    4eb8:	fce7d5e3          	bge	a5,a4,4e82 <iref+0x132>
  }

  chdir("/");
    4ebc:	00003517          	auipc	a0,0x3
    4ec0:	78c50513          	addi	a0,a0,1932 # 8648 <malloc+0x6a0>
    4ec4:	00003097          	auipc	ra,0x3
    4ec8:	a34080e7          	jalr	-1484(ra) # 78f8 <chdir>
}
    4ecc:	0001                	nop
    4ece:	70a2                	ld	ra,40(sp)
    4ed0:	7402                	ld	s0,32(sp)
    4ed2:	6145                	addi	sp,sp,48
    4ed4:	8082                	ret

0000000000004ed6 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(char *s)
{
    4ed6:	7179                	addi	sp,sp,-48
    4ed8:	f406                	sd	ra,40(sp)
    4eda:	f022                	sd	s0,32(sp)
    4edc:	1800                	addi	s0,sp,48
    4ede:	fca43c23          	sd	a0,-40(s0)
  enum{ N = 1000 };
  int n, pid;

  for(n=0; n<N; n++){
    4ee2:	fe042623          	sw	zero,-20(s0)
    4ee6:	a81d                	j	4f1c <forktest+0x46>
    pid = fork();
    4ee8:	00003097          	auipc	ra,0x3
    4eec:	998080e7          	jalr	-1640(ra) # 7880 <fork>
    4ef0:	87aa                	mv	a5,a0
    4ef2:	fef42423          	sw	a5,-24(s0)
    if(pid < 0)
    4ef6:	fe842783          	lw	a5,-24(s0)
    4efa:	2781                	sext.w	a5,a5
    4efc:	0207c963          	bltz	a5,4f2e <forktest+0x58>
      break;
    if(pid == 0)
    4f00:	fe842783          	lw	a5,-24(s0)
    4f04:	2781                	sext.w	a5,a5
    4f06:	e791                	bnez	a5,4f12 <forktest+0x3c>
      exit(0);
    4f08:	4501                	li	a0,0
    4f0a:	00003097          	auipc	ra,0x3
    4f0e:	97e080e7          	jalr	-1666(ra) # 7888 <exit>
  for(n=0; n<N; n++){
    4f12:	fec42783          	lw	a5,-20(s0)
    4f16:	2785                	addiw	a5,a5,1
    4f18:	fef42623          	sw	a5,-20(s0)
    4f1c:	fec42783          	lw	a5,-20(s0)
    4f20:	0007871b          	sext.w	a4,a5
    4f24:	3e700793          	li	a5,999
    4f28:	fce7d0e3          	bge	a5,a4,4ee8 <forktest+0x12>
    4f2c:	a011                	j	4f30 <forktest+0x5a>
      break;
    4f2e:	0001                	nop
  }

  if (n == 0) {
    4f30:	fec42783          	lw	a5,-20(s0)
    4f34:	2781                	sext.w	a5,a5
    4f36:	e385                	bnez	a5,4f56 <forktest+0x80>
    printf("%s: no fork at all!\n", s);
    4f38:	fd843583          	ld	a1,-40(s0)
    4f3c:	00005517          	auipc	a0,0x5
    4f40:	b9450513          	addi	a0,a0,-1132 # 9ad0 <malloc+0x1b28>
    4f44:	00003097          	auipc	ra,0x3
    4f48:	e72080e7          	jalr	-398(ra) # 7db6 <printf>
    exit(1);
    4f4c:	4505                	li	a0,1
    4f4e:	00003097          	auipc	ra,0x3
    4f52:	93a080e7          	jalr	-1734(ra) # 7888 <exit>
  }

  if(n == N){
    4f56:	fec42783          	lw	a5,-20(s0)
    4f5a:	0007871b          	sext.w	a4,a5
    4f5e:	3e800793          	li	a5,1000
    4f62:	04f71d63          	bne	a4,a5,4fbc <forktest+0xe6>
    printf("%s: fork claimed to work 1000 times!\n", s);
    4f66:	fd843583          	ld	a1,-40(s0)
    4f6a:	00005517          	auipc	a0,0x5
    4f6e:	b7e50513          	addi	a0,a0,-1154 # 9ae8 <malloc+0x1b40>
    4f72:	00003097          	auipc	ra,0x3
    4f76:	e44080e7          	jalr	-444(ra) # 7db6 <printf>
    exit(1);
    4f7a:	4505                	li	a0,1
    4f7c:	00003097          	auipc	ra,0x3
    4f80:	90c080e7          	jalr	-1780(ra) # 7888 <exit>
  }

  for(; n > 0; n--){
    if(wait(0) < 0){
    4f84:	4501                	li	a0,0
    4f86:	00003097          	auipc	ra,0x3
    4f8a:	90a080e7          	jalr	-1782(ra) # 7890 <wait>
    4f8e:	87aa                	mv	a5,a0
    4f90:	0207d163          	bgez	a5,4fb2 <forktest+0xdc>
      printf("%s: wait stopped early\n", s);
    4f94:	fd843583          	ld	a1,-40(s0)
    4f98:	00005517          	auipc	a0,0x5
    4f9c:	b7850513          	addi	a0,a0,-1160 # 9b10 <malloc+0x1b68>
    4fa0:	00003097          	auipc	ra,0x3
    4fa4:	e16080e7          	jalr	-490(ra) # 7db6 <printf>
      exit(1);
    4fa8:	4505                	li	a0,1
    4faa:	00003097          	auipc	ra,0x3
    4fae:	8de080e7          	jalr	-1826(ra) # 7888 <exit>
  for(; n > 0; n--){
    4fb2:	fec42783          	lw	a5,-20(s0)
    4fb6:	37fd                	addiw	a5,a5,-1
    4fb8:	fef42623          	sw	a5,-20(s0)
    4fbc:	fec42783          	lw	a5,-20(s0)
    4fc0:	2781                	sext.w	a5,a5
    4fc2:	fcf041e3          	bgtz	a5,4f84 <forktest+0xae>
    }
  }

  if(wait(0) != -1){
    4fc6:	4501                	li	a0,0
    4fc8:	00003097          	auipc	ra,0x3
    4fcc:	8c8080e7          	jalr	-1848(ra) # 7890 <wait>
    4fd0:	87aa                	mv	a5,a0
    4fd2:	873e                	mv	a4,a5
    4fd4:	57fd                	li	a5,-1
    4fd6:	02f70163          	beq	a4,a5,4ff8 <forktest+0x122>
    printf("%s: wait got too many\n", s);
    4fda:	fd843583          	ld	a1,-40(s0)
    4fde:	00005517          	auipc	a0,0x5
    4fe2:	b4a50513          	addi	a0,a0,-1206 # 9b28 <malloc+0x1b80>
    4fe6:	00003097          	auipc	ra,0x3
    4fea:	dd0080e7          	jalr	-560(ra) # 7db6 <printf>
    exit(1);
    4fee:	4505                	li	a0,1
    4ff0:	00003097          	auipc	ra,0x3
    4ff4:	898080e7          	jalr	-1896(ra) # 7888 <exit>
  }
}
    4ff8:	0001                	nop
    4ffa:	70a2                	ld	ra,40(sp)
    4ffc:	7402                	ld	s0,32(sp)
    4ffe:	6145                	addi	sp,sp,48
    5000:	8082                	ret

0000000000005002 <sbrkbasic>:

void
sbrkbasic(char *s)
{
    5002:	715d                	addi	sp,sp,-80
    5004:	e486                	sd	ra,72(sp)
    5006:	e0a2                	sd	s0,64(sp)
    5008:	0880                	addi	s0,sp,80
    500a:	faa43c23          	sd	a0,-72(s0)
  enum { TOOMUCH=1024*1024*1024};
  int i, pid, xstatus;
  char *c, *a, *b;

  // does sbrk() return the expected failure value?
  pid = fork();
    500e:	00003097          	auipc	ra,0x3
    5012:	872080e7          	jalr	-1934(ra) # 7880 <fork>
    5016:	87aa                	mv	a5,a0
    5018:	fcf42a23          	sw	a5,-44(s0)
  if(pid < 0){
    501c:	fd442783          	lw	a5,-44(s0)
    5020:	2781                	sext.w	a5,a5
    5022:	0007df63          	bgez	a5,5040 <sbrkbasic+0x3e>
    printf("fork failed in sbrkbasic\n");
    5026:	00005517          	auipc	a0,0x5
    502a:	b1a50513          	addi	a0,a0,-1254 # 9b40 <malloc+0x1b98>
    502e:	00003097          	auipc	ra,0x3
    5032:	d88080e7          	jalr	-632(ra) # 7db6 <printf>
    exit(1);
    5036:	4505                	li	a0,1
    5038:	00003097          	auipc	ra,0x3
    503c:	850080e7          	jalr	-1968(ra) # 7888 <exit>
  }
  if(pid == 0){
    5040:	fd442783          	lw	a5,-44(s0)
    5044:	2781                	sext.w	a5,a5
    5046:	e3d5                	bnez	a5,50ea <sbrkbasic+0xe8>
    printf("fork successful\n");
    5048:	00005517          	auipc	a0,0x5
    504c:	b1850513          	addi	a0,a0,-1256 # 9b60 <malloc+0x1bb8>
    5050:	00003097          	auipc	ra,0x3
    5054:	d66080e7          	jalr	-666(ra) # 7db6 <printf>
    a = sbrk(TOOMUCH);
    5058:	40000537          	lui	a0,0x40000
    505c:	00003097          	auipc	ra,0x3
    5060:	8b4080e7          	jalr	-1868(ra) # 7910 <sbrk>
    5064:	fea43023          	sd	a0,-32(s0)
    printf("after sbrk\n");
    5068:	00005517          	auipc	a0,0x5
    506c:	b1050513          	addi	a0,a0,-1264 # 9b78 <malloc+0x1bd0>
    5070:	00003097          	auipc	ra,0x3
    5074:	d46080e7          	jalr	-698(ra) # 7db6 <printf>
    if(a == (char*)0xffffffffffffffffL){
    5078:	fe043703          	ld	a4,-32(s0)
    507c:	57fd                	li	a5,-1
    507e:	00f71f63          	bne	a4,a5,509c <sbrkbasic+0x9a>
      // it's OK if this fails.
      printf("it's OK if this fails.\n");
    5082:	00005517          	auipc	a0,0x5
    5086:	b0650513          	addi	a0,a0,-1274 # 9b88 <malloc+0x1be0>
    508a:	00003097          	auipc	ra,0x3
    508e:	d2c080e7          	jalr	-724(ra) # 7db6 <printf>
      exit(0);
    5092:	4501                	li	a0,0
    5094:	00002097          	auipc	ra,0x2
    5098:	7f4080e7          	jalr	2036(ra) # 7888 <exit>
    }

    for(b = a; b < a+TOOMUCH; b += 4096){
    509c:	fe043783          	ld	a5,-32(s0)
    50a0:	fcf43c23          	sd	a5,-40(s0)
    50a4:	a829                	j	50be <sbrkbasic+0xbc>
      *b = 99;
    50a6:	fd843783          	ld	a5,-40(s0)
    50aa:	06300713          	li	a4,99
    50ae:	00e78023          	sb	a4,0(a5)
    for(b = a; b < a+TOOMUCH; b += 4096){
    50b2:	fd843703          	ld	a4,-40(s0)
    50b6:	6785                	lui	a5,0x1
    50b8:	97ba                	add	a5,a5,a4
    50ba:	fcf43c23          	sd	a5,-40(s0)
    50be:	fe043703          	ld	a4,-32(s0)
    50c2:	400007b7          	lui	a5,0x40000
    50c6:	97ba                	add	a5,a5,a4
    50c8:	fd843703          	ld	a4,-40(s0)
    50cc:	fcf76de3          	bltu	a4,a5,50a6 <sbrkbasic+0xa4>
    }

    // we should not get here! either sbrk(TOOMUCH)
    // should have failed, or (with lazy allocation)
    // a pagefault should have killed this process.
    printf("we should not get here!\n");
    50d0:	00005517          	auipc	a0,0x5
    50d4:	ad050513          	addi	a0,a0,-1328 # 9ba0 <malloc+0x1bf8>
    50d8:	00003097          	auipc	ra,0x3
    50dc:	cde080e7          	jalr	-802(ra) # 7db6 <printf>
    exit(1);
    50e0:	4505                	li	a0,1
    50e2:	00002097          	auipc	ra,0x2
    50e6:	7a6080e7          	jalr	1958(ra) # 7888 <exit>
  }

  printf("wait for xstatus\n");
    50ea:	00005517          	auipc	a0,0x5
    50ee:	ad650513          	addi	a0,a0,-1322 # 9bc0 <malloc+0x1c18>
    50f2:	00003097          	auipc	ra,0x3
    50f6:	cc4080e7          	jalr	-828(ra) # 7db6 <printf>
  wait(&xstatus);
    50fa:	fc440793          	addi	a5,s0,-60
    50fe:	853e                	mv	a0,a5
    5100:	00002097          	auipc	ra,0x2
    5104:	790080e7          	jalr	1936(ra) # 7890 <wait>
  printf("wait for xstatus completed\n");
    5108:	00005517          	auipc	a0,0x5
    510c:	ad050513          	addi	a0,a0,-1328 # 9bd8 <malloc+0x1c30>
    5110:	00003097          	auipc	ra,0x3
    5114:	ca6080e7          	jalr	-858(ra) # 7db6 <printf>

  if(xstatus == 1){
    5118:	fc442783          	lw	a5,-60(s0)
    511c:	873e                	mv	a4,a5
    511e:	4785                	li	a5,1
    5120:	02f71163          	bne	a4,a5,5142 <sbrkbasic+0x140>
    printf("%s: too much memory allocated!\n", s);
    5124:	fb843583          	ld	a1,-72(s0)
    5128:	00005517          	auipc	a0,0x5
    512c:	ad050513          	addi	a0,a0,-1328 # 9bf8 <malloc+0x1c50>
    5130:	00003097          	auipc	ra,0x3
    5134:	c86080e7          	jalr	-890(ra) # 7db6 <printf>
    exit(1);
    5138:	4505                	li	a0,1
    513a:	00002097          	auipc	ra,0x2
    513e:	74e080e7          	jalr	1870(ra) # 7888 <exit>
  }

  // can one sbrk() less than a page?
  printf("can one sbrk() less than a page?\n");
    5142:	00005517          	auipc	a0,0x5
    5146:	ad650513          	addi	a0,a0,-1322 # 9c18 <malloc+0x1c70>
    514a:	00003097          	auipc	ra,0x3
    514e:	c6c080e7          	jalr	-916(ra) # 7db6 <printf>
  a = sbrk(0);
    5152:	4501                	li	a0,0
    5154:	00002097          	auipc	ra,0x2
    5158:	7bc080e7          	jalr	1980(ra) # 7910 <sbrk>
    515c:	fea43023          	sd	a0,-32(s0)
  for(i = 0; i < 5000; i++){
    5160:	fe042623          	sw	zero,-20(s0)
    5164:	a09d                	j	51ca <sbrkbasic+0x1c8>
    b = sbrk(1);
    5166:	4505                	li	a0,1
    5168:	00002097          	auipc	ra,0x2
    516c:	7a8080e7          	jalr	1960(ra) # 7910 <sbrk>
    5170:	fca43c23          	sd	a0,-40(s0)
    if(b != a){
    5174:	fd843703          	ld	a4,-40(s0)
    5178:	fe043783          	ld	a5,-32(s0)
    517c:	02f70863          	beq	a4,a5,51ac <sbrkbasic+0x1aa>
      printf("%s: sbrk test failed %d %x %x\n", s, i, a, b);
    5180:	fec42783          	lw	a5,-20(s0)
    5184:	fd843703          	ld	a4,-40(s0)
    5188:	fe043683          	ld	a3,-32(s0)
    518c:	863e                	mv	a2,a5
    518e:	fb843583          	ld	a1,-72(s0)
    5192:	00005517          	auipc	a0,0x5
    5196:	aae50513          	addi	a0,a0,-1362 # 9c40 <malloc+0x1c98>
    519a:	00003097          	auipc	ra,0x3
    519e:	c1c080e7          	jalr	-996(ra) # 7db6 <printf>
      exit(1);
    51a2:	4505                	li	a0,1
    51a4:	00002097          	auipc	ra,0x2
    51a8:	6e4080e7          	jalr	1764(ra) # 7888 <exit>
    }
    *b = 1;
    51ac:	fd843783          	ld	a5,-40(s0)
    51b0:	4705                	li	a4,1
    51b2:	00e78023          	sb	a4,0(a5) # 40000000 <freep+0x3ffee388>
    a = b + 1;
    51b6:	fd843783          	ld	a5,-40(s0)
    51ba:	0785                	addi	a5,a5,1
    51bc:	fef43023          	sd	a5,-32(s0)
  for(i = 0; i < 5000; i++){
    51c0:	fec42783          	lw	a5,-20(s0)
    51c4:	2785                	addiw	a5,a5,1
    51c6:	fef42623          	sw	a5,-20(s0)
    51ca:	fec42783          	lw	a5,-20(s0)
    51ce:	0007871b          	sext.w	a4,a5
    51d2:	6785                	lui	a5,0x1
    51d4:	38778793          	addi	a5,a5,903 # 1387 <openiputtest+0xe1>
    51d8:	f8e7d7e3          	bge	a5,a4,5166 <sbrkbasic+0x164>
  }
  pid = fork();
    51dc:	00002097          	auipc	ra,0x2
    51e0:	6a4080e7          	jalr	1700(ra) # 7880 <fork>
    51e4:	87aa                	mv	a5,a0
    51e6:	fcf42a23          	sw	a5,-44(s0)
  if(pid < 0){
    51ea:	fd442783          	lw	a5,-44(s0)
    51ee:	2781                	sext.w	a5,a5
    51f0:	0207d163          	bgez	a5,5212 <sbrkbasic+0x210>
    printf("%s: sbrk test fork failed\n", s);
    51f4:	fb843583          	ld	a1,-72(s0)
    51f8:	00005517          	auipc	a0,0x5
    51fc:	a6850513          	addi	a0,a0,-1432 # 9c60 <malloc+0x1cb8>
    5200:	00003097          	auipc	ra,0x3
    5204:	bb6080e7          	jalr	-1098(ra) # 7db6 <printf>
    exit(1);
    5208:	4505                	li	a0,1
    520a:	00002097          	auipc	ra,0x2
    520e:	67e080e7          	jalr	1662(ra) # 7888 <exit>
  }
  c = sbrk(1);
    5212:	4505                	li	a0,1
    5214:	00002097          	auipc	ra,0x2
    5218:	6fc080e7          	jalr	1788(ra) # 7910 <sbrk>
    521c:	fca43423          	sd	a0,-56(s0)
  c = sbrk(1);
    5220:	4505                	li	a0,1
    5222:	00002097          	auipc	ra,0x2
    5226:	6ee080e7          	jalr	1774(ra) # 7910 <sbrk>
    522a:	fca43423          	sd	a0,-56(s0)
  if(c != a + 1){
    522e:	fe043783          	ld	a5,-32(s0)
    5232:	0785                	addi	a5,a5,1
    5234:	fc843703          	ld	a4,-56(s0)
    5238:	02f70163          	beq	a4,a5,525a <sbrkbasic+0x258>
    printf("%s: sbrk test failed post-fork\n", s);
    523c:	fb843583          	ld	a1,-72(s0)
    5240:	00005517          	auipc	a0,0x5
    5244:	a4050513          	addi	a0,a0,-1472 # 9c80 <malloc+0x1cd8>
    5248:	00003097          	auipc	ra,0x3
    524c:	b6e080e7          	jalr	-1170(ra) # 7db6 <printf>
    exit(1);
    5250:	4505                	li	a0,1
    5252:	00002097          	auipc	ra,0x2
    5256:	636080e7          	jalr	1590(ra) # 7888 <exit>
  }
  if(pid == 0)
    525a:	fd442783          	lw	a5,-44(s0)
    525e:	2781                	sext.w	a5,a5
    5260:	e791                	bnez	a5,526c <sbrkbasic+0x26a>
    exit(0);
    5262:	4501                	li	a0,0
    5264:	00002097          	auipc	ra,0x2
    5268:	624080e7          	jalr	1572(ra) # 7888 <exit>
  wait(&xstatus);
    526c:	fc440793          	addi	a5,s0,-60
    5270:	853e                	mv	a0,a5
    5272:	00002097          	auipc	ra,0x2
    5276:	61e080e7          	jalr	1566(ra) # 7890 <wait>
  exit(xstatus);
    527a:	fc442783          	lw	a5,-60(s0)
    527e:	853e                	mv	a0,a5
    5280:	00002097          	auipc	ra,0x2
    5284:	608080e7          	jalr	1544(ra) # 7888 <exit>

0000000000005288 <sbrkmuch>:
}

void
sbrkmuch(char *s)
{
    5288:	711d                	addi	sp,sp,-96
    528a:	ec86                	sd	ra,88(sp)
    528c:	e8a2                	sd	s0,80(sp)
    528e:	1080                	addi	s0,sp,96
    5290:	faa43423          	sd	a0,-88(s0)
  enum { BIG=18*1024*1024 };
  char *c, *oldbrk, *a, *lastaddr, *p;
  uint64 amt;

  oldbrk = sbrk(0);
    5294:	4501                	li	a0,0
    5296:	00002097          	auipc	ra,0x2
    529a:	67a080e7          	jalr	1658(ra) # 7910 <sbrk>
    529e:	fea43023          	sd	a0,-32(s0)

  // can one grow address space to something big?
  a = sbrk(0);
    52a2:	4501                	li	a0,0
    52a4:	00002097          	auipc	ra,0x2
    52a8:	66c080e7          	jalr	1644(ra) # 7910 <sbrk>
    52ac:	fca43c23          	sd	a0,-40(s0)
  amt = BIG - (uint64)a;
    52b0:	fd843783          	ld	a5,-40(s0)
    52b4:	01200737          	lui	a4,0x1200
    52b8:	40f707b3          	sub	a5,a4,a5
    52bc:	fcf43823          	sd	a5,-48(s0)
  p = sbrk(amt);
    52c0:	fd043783          	ld	a5,-48(s0)
    52c4:	2781                	sext.w	a5,a5
    52c6:	853e                	mv	a0,a5
    52c8:	00002097          	auipc	ra,0x2
    52cc:	648080e7          	jalr	1608(ra) # 7910 <sbrk>
    52d0:	fca43423          	sd	a0,-56(s0)

  if (p != a) {
    52d4:	fc843703          	ld	a4,-56(s0)
    52d8:	fd843783          	ld	a5,-40(s0)
    52dc:	02f70163          	beq	a4,a5,52fe <sbrkmuch+0x76>
    printf("%s: sbrk test failed to grow big address space; enough phys mem?\n", s);
    52e0:	fa843583          	ld	a1,-88(s0)
    52e4:	00005517          	auipc	a0,0x5
    52e8:	9bc50513          	addi	a0,a0,-1604 # 9ca0 <malloc+0x1cf8>
    52ec:	00003097          	auipc	ra,0x3
    52f0:	aca080e7          	jalr	-1334(ra) # 7db6 <printf>
    exit(1);
    52f4:	4505                	li	a0,1
    52f6:	00002097          	auipc	ra,0x2
    52fa:	592080e7          	jalr	1426(ra) # 7888 <exit>
  }

  // touch each page to make sure it exists.
  char *eee = sbrk(0);
    52fe:	4501                	li	a0,0
    5300:	00002097          	auipc	ra,0x2
    5304:	610080e7          	jalr	1552(ra) # 7910 <sbrk>
    5308:	fca43023          	sd	a0,-64(s0)
  for(char *pp = eee-4096; pp > a; pp -= 4096)
    530c:	fc043703          	ld	a4,-64(s0)
    5310:	77fd                	lui	a5,0xfffff
    5312:	97ba                	add	a5,a5,a4
    5314:	fef43423          	sd	a5,-24(s0)
    5318:	a821                	j	5330 <sbrkmuch+0xa8>
    *pp = 1;
    531a:	fe843783          	ld	a5,-24(s0)
    531e:	4705                	li	a4,1
    5320:	00e78023          	sb	a4,0(a5) # fffffffffffff000 <freep+0xfffffffffffed388>
  for(char *pp = eee-4096; pp > a; pp -= 4096)
    5324:	fe843703          	ld	a4,-24(s0)
    5328:	77fd                	lui	a5,0xfffff
    532a:	97ba                	add	a5,a5,a4
    532c:	fef43423          	sd	a5,-24(s0)
    5330:	fe843703          	ld	a4,-24(s0)
    5334:	fd843783          	ld	a5,-40(s0)
    5338:	fee7e1e3          	bltu	a5,a4,531a <sbrkmuch+0x92>

  lastaddr = (char*) (BIG-1);
    533c:	012007b7          	lui	a5,0x1200
    5340:	17fd                	addi	a5,a5,-1
    5342:	faf43c23          	sd	a5,-72(s0)
  *lastaddr = 99;
    5346:	fb843783          	ld	a5,-72(s0)
    534a:	06300713          	li	a4,99
    534e:	00e78023          	sb	a4,0(a5) # 1200000 <freep+0x11ee388>

  // can one de-allocate?
  a = sbrk(0);
    5352:	4501                	li	a0,0
    5354:	00002097          	auipc	ra,0x2
    5358:	5bc080e7          	jalr	1468(ra) # 7910 <sbrk>
    535c:	fca43c23          	sd	a0,-40(s0)
  c = sbrk(-PGSIZE);
    5360:	757d                	lui	a0,0xfffff
    5362:	00002097          	auipc	ra,0x2
    5366:	5ae080e7          	jalr	1454(ra) # 7910 <sbrk>
    536a:	faa43823          	sd	a0,-80(s0)
  if(c == (char*)0xffffffffffffffffL){
    536e:	fb043703          	ld	a4,-80(s0)
    5372:	57fd                	li	a5,-1
    5374:	02f71163          	bne	a4,a5,5396 <sbrkmuch+0x10e>
    printf("%s: sbrk could not deallocate\n", s);
    5378:	fa843583          	ld	a1,-88(s0)
    537c:	00005517          	auipc	a0,0x5
    5380:	96c50513          	addi	a0,a0,-1684 # 9ce8 <malloc+0x1d40>
    5384:	00003097          	auipc	ra,0x3
    5388:	a32080e7          	jalr	-1486(ra) # 7db6 <printf>
    exit(1);
    538c:	4505                	li	a0,1
    538e:	00002097          	auipc	ra,0x2
    5392:	4fa080e7          	jalr	1274(ra) # 7888 <exit>
  }

  c = sbrk(0);
    5396:	4501                	li	a0,0
    5398:	00002097          	auipc	ra,0x2
    539c:	578080e7          	jalr	1400(ra) # 7910 <sbrk>
    53a0:	faa43823          	sd	a0,-80(s0)
  if(c != a - PGSIZE){
    53a4:	fd843703          	ld	a4,-40(s0)
    53a8:	77fd                	lui	a5,0xfffff
    53aa:	97ba                	add	a5,a5,a4
    53ac:	fb043703          	ld	a4,-80(s0)
    53b0:	02f70563          	beq	a4,a5,53da <sbrkmuch+0x152>
    printf("%s: sbrk deallocation produced wrong address, a %x c %x\n", s, a, c);
    53b4:	fb043683          	ld	a3,-80(s0)
    53b8:	fd843603          	ld	a2,-40(s0)
    53bc:	fa843583          	ld	a1,-88(s0)
    53c0:	00005517          	auipc	a0,0x5
    53c4:	94850513          	addi	a0,a0,-1720 # 9d08 <malloc+0x1d60>
    53c8:	00003097          	auipc	ra,0x3
    53cc:	9ee080e7          	jalr	-1554(ra) # 7db6 <printf>
    exit(1);
    53d0:	4505                	li	a0,1
    53d2:	00002097          	auipc	ra,0x2
    53d6:	4b6080e7          	jalr	1206(ra) # 7888 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    53da:	4501                	li	a0,0
    53dc:	00002097          	auipc	ra,0x2
    53e0:	534080e7          	jalr	1332(ra) # 7910 <sbrk>
    53e4:	fca43c23          	sd	a0,-40(s0)
  c = sbrk(PGSIZE);
    53e8:	6505                	lui	a0,0x1
    53ea:	00002097          	auipc	ra,0x2
    53ee:	526080e7          	jalr	1318(ra) # 7910 <sbrk>
    53f2:	faa43823          	sd	a0,-80(s0)
  if(c != a || sbrk(0) != a + PGSIZE){
    53f6:	fb043703          	ld	a4,-80(s0)
    53fa:	fd843783          	ld	a5,-40(s0)
    53fe:	00f71e63          	bne	a4,a5,541a <sbrkmuch+0x192>
    5402:	4501                	li	a0,0
    5404:	00002097          	auipc	ra,0x2
    5408:	50c080e7          	jalr	1292(ra) # 7910 <sbrk>
    540c:	86aa                	mv	a3,a0
    540e:	fd843703          	ld	a4,-40(s0)
    5412:	6785                	lui	a5,0x1
    5414:	97ba                	add	a5,a5,a4
    5416:	02f68563          	beq	a3,a5,5440 <sbrkmuch+0x1b8>
    printf("%s: sbrk re-allocation failed, a %x c %x\n", s, a, c);
    541a:	fb043683          	ld	a3,-80(s0)
    541e:	fd843603          	ld	a2,-40(s0)
    5422:	fa843583          	ld	a1,-88(s0)
    5426:	00005517          	auipc	a0,0x5
    542a:	92250513          	addi	a0,a0,-1758 # 9d48 <malloc+0x1da0>
    542e:	00003097          	auipc	ra,0x3
    5432:	988080e7          	jalr	-1656(ra) # 7db6 <printf>
    exit(1);
    5436:	4505                	li	a0,1
    5438:	00002097          	auipc	ra,0x2
    543c:	450080e7          	jalr	1104(ra) # 7888 <exit>
  }

  if(*lastaddr == 99){
    5440:	fb843783          	ld	a5,-72(s0)
    5444:	0007c783          	lbu	a5,0(a5) # 1000 <truncate3+0x1aa>
    5448:	873e                	mv	a4,a5
    544a:	06300793          	li	a5,99
    544e:	02f71163          	bne	a4,a5,5470 <sbrkmuch+0x1e8>
    // should be zero
    printf("%s: sbrk de-allocation didn't really deallocate\n", s);
    5452:	fa843583          	ld	a1,-88(s0)
    5456:	00005517          	auipc	a0,0x5
    545a:	92250513          	addi	a0,a0,-1758 # 9d78 <malloc+0x1dd0>
    545e:	00003097          	auipc	ra,0x3
    5462:	958080e7          	jalr	-1704(ra) # 7db6 <printf>
    exit(1);
    5466:	4505                	li	a0,1
    5468:	00002097          	auipc	ra,0x2
    546c:	420080e7          	jalr	1056(ra) # 7888 <exit>
  }

  a = sbrk(0);
    5470:	4501                	li	a0,0
    5472:	00002097          	auipc	ra,0x2
    5476:	49e080e7          	jalr	1182(ra) # 7910 <sbrk>
    547a:	fca43c23          	sd	a0,-40(s0)
  c = sbrk(-(sbrk(0) - oldbrk));
    547e:	4501                	li	a0,0
    5480:	00002097          	auipc	ra,0x2
    5484:	490080e7          	jalr	1168(ra) # 7910 <sbrk>
    5488:	872a                	mv	a4,a0
    548a:	fe043783          	ld	a5,-32(s0)
    548e:	8f99                	sub	a5,a5,a4
    5490:	2781                	sext.w	a5,a5
    5492:	853e                	mv	a0,a5
    5494:	00002097          	auipc	ra,0x2
    5498:	47c080e7          	jalr	1148(ra) # 7910 <sbrk>
    549c:	faa43823          	sd	a0,-80(s0)
  if(c != a){
    54a0:	fb043703          	ld	a4,-80(s0)
    54a4:	fd843783          	ld	a5,-40(s0)
    54a8:	02f70563          	beq	a4,a5,54d2 <sbrkmuch+0x24a>
    printf("%s: sbrk downsize failed, a %x c %x\n", s, a, c);
    54ac:	fb043683          	ld	a3,-80(s0)
    54b0:	fd843603          	ld	a2,-40(s0)
    54b4:	fa843583          	ld	a1,-88(s0)
    54b8:	00005517          	auipc	a0,0x5
    54bc:	8f850513          	addi	a0,a0,-1800 # 9db0 <malloc+0x1e08>
    54c0:	00003097          	auipc	ra,0x3
    54c4:	8f6080e7          	jalr	-1802(ra) # 7db6 <printf>
    exit(1);
    54c8:	4505                	li	a0,1
    54ca:	00002097          	auipc	ra,0x2
    54ce:	3be080e7          	jalr	958(ra) # 7888 <exit>
  }
}
    54d2:	0001                	nop
    54d4:	60e6                	ld	ra,88(sp)
    54d6:	6446                	ld	s0,80(sp)
    54d8:	6125                	addi	sp,sp,96
    54da:	8082                	ret

00000000000054dc <kernmem>:

// can we read the kernel's memory?
void
kernmem(char *s)
{
    54dc:	7179                	addi	sp,sp,-48
    54de:	f406                	sd	ra,40(sp)
    54e0:	f022                	sd	s0,32(sp)
    54e2:	1800                	addi	s0,sp,48
    54e4:	fca43c23          	sd	a0,-40(s0)
  char *a;
  int pid;

  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    54e8:	4785                	li	a5,1
    54ea:	07fe                	slli	a5,a5,0x1f
    54ec:	fef43423          	sd	a5,-24(s0)
    54f0:	a04d                	j	5592 <kernmem+0xb6>
    pid = fork();
    54f2:	00002097          	auipc	ra,0x2
    54f6:	38e080e7          	jalr	910(ra) # 7880 <fork>
    54fa:	87aa                	mv	a5,a0
    54fc:	fef42223          	sw	a5,-28(s0)
    if(pid < 0){
    5500:	fe442783          	lw	a5,-28(s0)
    5504:	2781                	sext.w	a5,a5
    5506:	0207d163          	bgez	a5,5528 <kernmem+0x4c>
      printf("%s: fork failed\n", s);
    550a:	fd843583          	ld	a1,-40(s0)
    550e:	00003517          	auipc	a0,0x3
    5512:	04250513          	addi	a0,a0,66 # 8550 <malloc+0x5a8>
    5516:	00003097          	auipc	ra,0x3
    551a:	8a0080e7          	jalr	-1888(ra) # 7db6 <printf>
      exit(1);
    551e:	4505                	li	a0,1
    5520:	00002097          	auipc	ra,0x2
    5524:	368080e7          	jalr	872(ra) # 7888 <exit>
    }
    if(pid == 0){
    5528:	fe442783          	lw	a5,-28(s0)
    552c:	2781                	sext.w	a5,a5
    552e:	eb85                	bnez	a5,555e <kernmem+0x82>
      printf("%s: oops could read %x = %x\n", s, a, *a);
    5530:	fe843783          	ld	a5,-24(s0)
    5534:	0007c783          	lbu	a5,0(a5)
    5538:	2781                	sext.w	a5,a5
    553a:	86be                	mv	a3,a5
    553c:	fe843603          	ld	a2,-24(s0)
    5540:	fd843583          	ld	a1,-40(s0)
    5544:	00005517          	auipc	a0,0x5
    5548:	89450513          	addi	a0,a0,-1900 # 9dd8 <malloc+0x1e30>
    554c:	00003097          	auipc	ra,0x3
    5550:	86a080e7          	jalr	-1942(ra) # 7db6 <printf>
      exit(1);
    5554:	4505                	li	a0,1
    5556:	00002097          	auipc	ra,0x2
    555a:	332080e7          	jalr	818(ra) # 7888 <exit>
    }
    int xstatus;
    wait(&xstatus);
    555e:	fe040793          	addi	a5,s0,-32
    5562:	853e                	mv	a0,a5
    5564:	00002097          	auipc	ra,0x2
    5568:	32c080e7          	jalr	812(ra) # 7890 <wait>
    if(xstatus != -1)  // did kernel kill child?
    556c:	fe042783          	lw	a5,-32(s0)
    5570:	873e                	mv	a4,a5
    5572:	57fd                	li	a5,-1
    5574:	00f70763          	beq	a4,a5,5582 <kernmem+0xa6>
      exit(1);
    5578:	4505                	li	a0,1
    557a:	00002097          	auipc	ra,0x2
    557e:	30e080e7          	jalr	782(ra) # 7888 <exit>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    5582:	fe843703          	ld	a4,-24(s0)
    5586:	67b1                	lui	a5,0xc
    5588:	35078793          	addi	a5,a5,848 # c350 <buf+0xf00>
    558c:	97ba                	add	a5,a5,a4
    558e:	fef43423          	sd	a5,-24(s0)
    5592:	fe843703          	ld	a4,-24(s0)
    5596:	1003d7b7          	lui	a5,0x1003d
    559a:	078e                	slli	a5,a5,0x3
    559c:	47f78793          	addi	a5,a5,1151 # 1003d47f <freep+0x1002b807>
    55a0:	f4e7f9e3          	bgeu	a5,a4,54f2 <kernmem+0x16>
  }
}
    55a4:	0001                	nop
    55a6:	0001                	nop
    55a8:	70a2                	ld	ra,40(sp)
    55aa:	7402                	ld	s0,32(sp)
    55ac:	6145                	addi	sp,sp,48
    55ae:	8082                	ret

00000000000055b0 <MAXVAplus>:

// user code should not be able to write to addresses above MAXVA.
void
MAXVAplus(char *s)
{
    55b0:	7139                	addi	sp,sp,-64
    55b2:	fc06                	sd	ra,56(sp)
    55b4:	f822                	sd	s0,48(sp)
    55b6:	0080                	addi	s0,sp,64
    55b8:	fca43423          	sd	a0,-56(s0)
  volatile uint64 a = MAXVA;
    55bc:	4785                	li	a5,1
    55be:	179a                	slli	a5,a5,0x26
    55c0:	fef43023          	sd	a5,-32(s0)
  for( ; a != 0; a <<= 1){
    55c4:	a045                	j	5664 <MAXVAplus+0xb4>
    int pid;
    pid = fork();
    55c6:	00002097          	auipc	ra,0x2
    55ca:	2ba080e7          	jalr	698(ra) # 7880 <fork>
    55ce:	87aa                	mv	a5,a0
    55d0:	fef42623          	sw	a5,-20(s0)
    if(pid < 0){
    55d4:	fec42783          	lw	a5,-20(s0)
    55d8:	2781                	sext.w	a5,a5
    55da:	0207d163          	bgez	a5,55fc <MAXVAplus+0x4c>
      printf("%s: fork failed\n", s);
    55de:	fc843583          	ld	a1,-56(s0)
    55e2:	00003517          	auipc	a0,0x3
    55e6:	f6e50513          	addi	a0,a0,-146 # 8550 <malloc+0x5a8>
    55ea:	00002097          	auipc	ra,0x2
    55ee:	7cc080e7          	jalr	1996(ra) # 7db6 <printf>
      exit(1);
    55f2:	4505                	li	a0,1
    55f4:	00002097          	auipc	ra,0x2
    55f8:	294080e7          	jalr	660(ra) # 7888 <exit>
    }
    if(pid == 0){
    55fc:	fec42783          	lw	a5,-20(s0)
    5600:	2781                	sext.w	a5,a5
    5602:	eb95                	bnez	a5,5636 <MAXVAplus+0x86>
      *(char*)a = 99;
    5604:	fe043783          	ld	a5,-32(s0)
    5608:	873e                	mv	a4,a5
    560a:	06300793          	li	a5,99
    560e:	00f70023          	sb	a5,0(a4) # 1200000 <freep+0x11ee388>
      printf("%s: oops wrote %x\n", s, a);
    5612:	fe043783          	ld	a5,-32(s0)
    5616:	863e                	mv	a2,a5
    5618:	fc843583          	ld	a1,-56(s0)
    561c:	00004517          	auipc	a0,0x4
    5620:	7dc50513          	addi	a0,a0,2012 # 9df8 <malloc+0x1e50>
    5624:	00002097          	auipc	ra,0x2
    5628:	792080e7          	jalr	1938(ra) # 7db6 <printf>
      exit(1);
    562c:	4505                	li	a0,1
    562e:	00002097          	auipc	ra,0x2
    5632:	25a080e7          	jalr	602(ra) # 7888 <exit>
    }
    int xstatus;
    wait(&xstatus);
    5636:	fdc40793          	addi	a5,s0,-36
    563a:	853e                	mv	a0,a5
    563c:	00002097          	auipc	ra,0x2
    5640:	254080e7          	jalr	596(ra) # 7890 <wait>
    if(xstatus != -1)  // did kernel kill child?
    5644:	fdc42783          	lw	a5,-36(s0)
    5648:	873e                	mv	a4,a5
    564a:	57fd                	li	a5,-1
    564c:	00f70763          	beq	a4,a5,565a <MAXVAplus+0xaa>
      exit(1);
    5650:	4505                	li	a0,1
    5652:	00002097          	auipc	ra,0x2
    5656:	236080e7          	jalr	566(ra) # 7888 <exit>
  for( ; a != 0; a <<= 1){
    565a:	fe043783          	ld	a5,-32(s0)
    565e:	0786                	slli	a5,a5,0x1
    5660:	fef43023          	sd	a5,-32(s0)
    5664:	fe043783          	ld	a5,-32(s0)
    5668:	ffb9                	bnez	a5,55c6 <MAXVAplus+0x16>
  }
}
    566a:	0001                	nop
    566c:	0001                	nop
    566e:	70e2                	ld	ra,56(sp)
    5670:	7442                	ld	s0,48(sp)
    5672:	6121                	addi	sp,sp,64
    5674:	8082                	ret

0000000000005676 <sbrkfail>:

// if we run the system out of memory, does it clean up the last
// failed allocation?
void
sbrkfail(char *s)
{
    5676:	7119                	addi	sp,sp,-128
    5678:	fc86                	sd	ra,120(sp)
    567a:	f8a2                	sd	s0,112(sp)
    567c:	0100                	addi	s0,sp,128
    567e:	f8a43423          	sd	a0,-120(s0)
  char scratch;
  char *c, *a;
  int pids[10];
  int pid;

  if(pipe(fds) != 0){
    5682:	fc040793          	addi	a5,s0,-64
    5686:	853e                	mv	a0,a5
    5688:	00002097          	auipc	ra,0x2
    568c:	210080e7          	jalr	528(ra) # 7898 <pipe>
    5690:	87aa                	mv	a5,a0
    5692:	c385                	beqz	a5,56b2 <sbrkfail+0x3c>
    printf("%s: pipe() failed\n", s);
    5694:	f8843583          	ld	a1,-120(s0)
    5698:	00003517          	auipc	a0,0x3
    569c:	35050513          	addi	a0,a0,848 # 89e8 <malloc+0xa40>
    56a0:	00002097          	auipc	ra,0x2
    56a4:	716080e7          	jalr	1814(ra) # 7db6 <printf>
    exit(1);
    56a8:	4505                	li	a0,1
    56aa:	00002097          	auipc	ra,0x2
    56ae:	1de080e7          	jalr	478(ra) # 7888 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    56b2:	fe042623          	sw	zero,-20(s0)
    56b6:	a84d                	j	5768 <sbrkfail+0xf2>
    if((pids[i] = fork()) == 0){
    56b8:	00002097          	auipc	ra,0x2
    56bc:	1c8080e7          	jalr	456(ra) # 7880 <fork>
    56c0:	87aa                	mv	a5,a0
    56c2:	873e                	mv	a4,a5
    56c4:	fec42783          	lw	a5,-20(s0)
    56c8:	078a                	slli	a5,a5,0x2
    56ca:	ff040693          	addi	a3,s0,-16
    56ce:	97b6                	add	a5,a5,a3
    56d0:	fae7a023          	sw	a4,-96(a5)
    56d4:	fec42783          	lw	a5,-20(s0)
    56d8:	078a                	slli	a5,a5,0x2
    56da:	ff040713          	addi	a4,s0,-16
    56de:	97ba                	add	a5,a5,a4
    56e0:	fa07a783          	lw	a5,-96(a5)
    56e4:	e7b1                	bnez	a5,5730 <sbrkfail+0xba>
      // allocate a lot of memory
      sbrk(BIG - (uint64)sbrk(0));
    56e6:	4501                	li	a0,0
    56e8:	00002097          	auipc	ra,0x2
    56ec:	228080e7          	jalr	552(ra) # 7910 <sbrk>
    56f0:	87aa                	mv	a5,a0
    56f2:	2781                	sext.w	a5,a5
    56f4:	06400737          	lui	a4,0x6400
    56f8:	40f707bb          	subw	a5,a4,a5
    56fc:	2781                	sext.w	a5,a5
    56fe:	2781                	sext.w	a5,a5
    5700:	853e                	mv	a0,a5
    5702:	00002097          	auipc	ra,0x2
    5706:	20e080e7          	jalr	526(ra) # 7910 <sbrk>
      write(fds[1], "x", 1);
    570a:	fc442783          	lw	a5,-60(s0)
    570e:	4605                	li	a2,1
    5710:	00003597          	auipc	a1,0x3
    5714:	b1058593          	addi	a1,a1,-1264 # 8220 <malloc+0x278>
    5718:	853e                	mv	a0,a5
    571a:	00002097          	auipc	ra,0x2
    571e:	18e080e7          	jalr	398(ra) # 78a8 <write>
      // sit around until killed
      for(;;) sleep(1000);
    5722:	3e800513          	li	a0,1000
    5726:	00002097          	auipc	ra,0x2
    572a:	1f2080e7          	jalr	498(ra) # 7918 <sleep>
    572e:	bfd5                	j	5722 <sbrkfail+0xac>
    }
    if(pids[i] != -1)
    5730:	fec42783          	lw	a5,-20(s0)
    5734:	078a                	slli	a5,a5,0x2
    5736:	ff040713          	addi	a4,s0,-16
    573a:	97ba                	add	a5,a5,a4
    573c:	fa07a783          	lw	a5,-96(a5)
    5740:	873e                	mv	a4,a5
    5742:	57fd                	li	a5,-1
    5744:	00f70d63          	beq	a4,a5,575e <sbrkfail+0xe8>
      read(fds[0], &scratch, 1);
    5748:	fc042783          	lw	a5,-64(s0)
    574c:	fbf40713          	addi	a4,s0,-65
    5750:	4605                	li	a2,1
    5752:	85ba                	mv	a1,a4
    5754:	853e                	mv	a0,a5
    5756:	00002097          	auipc	ra,0x2
    575a:	14a080e7          	jalr	330(ra) # 78a0 <read>
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    575e:	fec42783          	lw	a5,-20(s0)
    5762:	2785                	addiw	a5,a5,1
    5764:	fef42623          	sw	a5,-20(s0)
    5768:	fec42783          	lw	a5,-20(s0)
    576c:	873e                	mv	a4,a5
    576e:	47a5                	li	a5,9
    5770:	f4e7f4e3          	bgeu	a5,a4,56b8 <sbrkfail+0x42>
  }

  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(PGSIZE);
    5774:	6505                	lui	a0,0x1
    5776:	00002097          	auipc	ra,0x2
    577a:	19a080e7          	jalr	410(ra) # 7910 <sbrk>
    577e:	fea43023          	sd	a0,-32(s0)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    5782:	fe042623          	sw	zero,-20(s0)
    5786:	a0b1                	j	57d2 <sbrkfail+0x15c>
    if(pids[i] == -1)
    5788:	fec42783          	lw	a5,-20(s0)
    578c:	078a                	slli	a5,a5,0x2
    578e:	ff040713          	addi	a4,s0,-16
    5792:	97ba                	add	a5,a5,a4
    5794:	fa07a783          	lw	a5,-96(a5)
    5798:	873e                	mv	a4,a5
    579a:	57fd                	li	a5,-1
    579c:	02f70563          	beq	a4,a5,57c6 <sbrkfail+0x150>
      continue;
    kill(pids[i]);
    57a0:	fec42783          	lw	a5,-20(s0)
    57a4:	078a                	slli	a5,a5,0x2
    57a6:	ff040713          	addi	a4,s0,-16
    57aa:	97ba                	add	a5,a5,a4
    57ac:	fa07a783          	lw	a5,-96(a5)
    57b0:	853e                	mv	a0,a5
    57b2:	00002097          	auipc	ra,0x2
    57b6:	106080e7          	jalr	262(ra) # 78b8 <kill>
    wait(0);
    57ba:	4501                	li	a0,0
    57bc:	00002097          	auipc	ra,0x2
    57c0:	0d4080e7          	jalr	212(ra) # 7890 <wait>
    57c4:	a011                	j	57c8 <sbrkfail+0x152>
      continue;
    57c6:	0001                	nop
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    57c8:	fec42783          	lw	a5,-20(s0)
    57cc:	2785                	addiw	a5,a5,1
    57ce:	fef42623          	sw	a5,-20(s0)
    57d2:	fec42783          	lw	a5,-20(s0)
    57d6:	873e                	mv	a4,a5
    57d8:	47a5                	li	a5,9
    57da:	fae7f7e3          	bgeu	a5,a4,5788 <sbrkfail+0x112>
  }
  if(c == (char*)0xffffffffffffffffL){
    57de:	fe043703          	ld	a4,-32(s0)
    57e2:	57fd                	li	a5,-1
    57e4:	02f71163          	bne	a4,a5,5806 <sbrkfail+0x190>
    printf("%s: failed sbrk leaked memory\n", s);
    57e8:	f8843583          	ld	a1,-120(s0)
    57ec:	00004517          	auipc	a0,0x4
    57f0:	62450513          	addi	a0,a0,1572 # 9e10 <malloc+0x1e68>
    57f4:	00002097          	auipc	ra,0x2
    57f8:	5c2080e7          	jalr	1474(ra) # 7db6 <printf>
    exit(1);
    57fc:	4505                	li	a0,1
    57fe:	00002097          	auipc	ra,0x2
    5802:	08a080e7          	jalr	138(ra) # 7888 <exit>
  }

  // test running fork with the above allocated page
  pid = fork();
    5806:	00002097          	auipc	ra,0x2
    580a:	07a080e7          	jalr	122(ra) # 7880 <fork>
    580e:	87aa                	mv	a5,a0
    5810:	fcf42e23          	sw	a5,-36(s0)
  if(pid < 0){
    5814:	fdc42783          	lw	a5,-36(s0)
    5818:	2781                	sext.w	a5,a5
    581a:	0207d163          	bgez	a5,583c <sbrkfail+0x1c6>
    printf("%s: fork failed\n", s);
    581e:	f8843583          	ld	a1,-120(s0)
    5822:	00003517          	auipc	a0,0x3
    5826:	d2e50513          	addi	a0,a0,-722 # 8550 <malloc+0x5a8>
    582a:	00002097          	auipc	ra,0x2
    582e:	58c080e7          	jalr	1420(ra) # 7db6 <printf>
    exit(1);
    5832:	4505                	li	a0,1
    5834:	00002097          	auipc	ra,0x2
    5838:	054080e7          	jalr	84(ra) # 7888 <exit>
  }
  if(pid == 0){
    583c:	fdc42783          	lw	a5,-36(s0)
    5840:	2781                	sext.w	a5,a5
    5842:	e3c1                	bnez	a5,58c2 <sbrkfail+0x24c>
    // allocate a lot of memory.
    // this should produce a page fault,
    // and thus not complete.
    a = sbrk(0);
    5844:	4501                	li	a0,0
    5846:	00002097          	auipc	ra,0x2
    584a:	0ca080e7          	jalr	202(ra) # 7910 <sbrk>
    584e:	fca43823          	sd	a0,-48(s0)
    sbrk(10*BIG);
    5852:	3e800537          	lui	a0,0x3e800
    5856:	00002097          	auipc	ra,0x2
    585a:	0ba080e7          	jalr	186(ra) # 7910 <sbrk>
    int n = 0;
    585e:	fe042423          	sw	zero,-24(s0)
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    5862:	fe042623          	sw	zero,-20(s0)
    5866:	a025                	j	588e <sbrkfail+0x218>
      n += *(a+i);
    5868:	fec42783          	lw	a5,-20(s0)
    586c:	fd043703          	ld	a4,-48(s0)
    5870:	97ba                	add	a5,a5,a4
    5872:	0007c783          	lbu	a5,0(a5)
    5876:	2781                	sext.w	a5,a5
    5878:	fe842703          	lw	a4,-24(s0)
    587c:	9fb9                	addw	a5,a5,a4
    587e:	fef42423          	sw	a5,-24(s0)
    for (i = 0; i < 10*BIG; i += PGSIZE) {
    5882:	fec42703          	lw	a4,-20(s0)
    5886:	6785                	lui	a5,0x1
    5888:	9fb9                	addw	a5,a5,a4
    588a:	fef42623          	sw	a5,-20(s0)
    588e:	fec42783          	lw	a5,-20(s0)
    5892:	0007871b          	sext.w	a4,a5
    5896:	3e8007b7          	lui	a5,0x3e800
    589a:	fcf747e3          	blt	a4,a5,5868 <sbrkfail+0x1f2>
    }
    // print n so the compiler doesn't optimize away
    // the for loop.
    printf("%s: allocate a lot of memory succeeded %d\n", s, n);
    589e:	fe842783          	lw	a5,-24(s0)
    58a2:	863e                	mv	a2,a5
    58a4:	f8843583          	ld	a1,-120(s0)
    58a8:	00004517          	auipc	a0,0x4
    58ac:	58850513          	addi	a0,a0,1416 # 9e30 <malloc+0x1e88>
    58b0:	00002097          	auipc	ra,0x2
    58b4:	506080e7          	jalr	1286(ra) # 7db6 <printf>
    exit(1);
    58b8:	4505                	li	a0,1
    58ba:	00002097          	auipc	ra,0x2
    58be:	fce080e7          	jalr	-50(ra) # 7888 <exit>
  }
  wait(&xstatus);
    58c2:	fcc40793          	addi	a5,s0,-52
    58c6:	853e                	mv	a0,a5
    58c8:	00002097          	auipc	ra,0x2
    58cc:	fc8080e7          	jalr	-56(ra) # 7890 <wait>
  if(xstatus != -1 && xstatus != 2)
    58d0:	fcc42783          	lw	a5,-52(s0)
    58d4:	873e                	mv	a4,a5
    58d6:	57fd                	li	a5,-1
    58d8:	00f70d63          	beq	a4,a5,58f2 <sbrkfail+0x27c>
    58dc:	fcc42783          	lw	a5,-52(s0)
    58e0:	873e                	mv	a4,a5
    58e2:	4789                	li	a5,2
    58e4:	00f70763          	beq	a4,a5,58f2 <sbrkfail+0x27c>
    exit(1);
    58e8:	4505                	li	a0,1
    58ea:	00002097          	auipc	ra,0x2
    58ee:	f9e080e7          	jalr	-98(ra) # 7888 <exit>
}
    58f2:	0001                	nop
    58f4:	70e6                	ld	ra,120(sp)
    58f6:	7446                	ld	s0,112(sp)
    58f8:	6109                	addi	sp,sp,128
    58fa:	8082                	ret

00000000000058fc <sbrkarg>:


// test reads/writes from/to allocated memory
void
sbrkarg(char *s)
{
    58fc:	7179                	addi	sp,sp,-48
    58fe:	f406                	sd	ra,40(sp)
    5900:	f022                	sd	s0,32(sp)
    5902:	1800                	addi	s0,sp,48
    5904:	fca43c23          	sd	a0,-40(s0)
  char *a;
  int fd, n;

  a = sbrk(PGSIZE);
    5908:	6505                	lui	a0,0x1
    590a:	00002097          	auipc	ra,0x2
    590e:	006080e7          	jalr	6(ra) # 7910 <sbrk>
    5912:	fea43423          	sd	a0,-24(s0)
  fd = open("sbrk", O_CREATE|O_WRONLY);
    5916:	20100593          	li	a1,513
    591a:	00004517          	auipc	a0,0x4
    591e:	54650513          	addi	a0,a0,1350 # 9e60 <malloc+0x1eb8>
    5922:	00002097          	auipc	ra,0x2
    5926:	fa6080e7          	jalr	-90(ra) # 78c8 <open>
    592a:	87aa                	mv	a5,a0
    592c:	fef42223          	sw	a5,-28(s0)
  unlink("sbrk");
    5930:	00004517          	auipc	a0,0x4
    5934:	53050513          	addi	a0,a0,1328 # 9e60 <malloc+0x1eb8>
    5938:	00002097          	auipc	ra,0x2
    593c:	fa0080e7          	jalr	-96(ra) # 78d8 <unlink>
  if(fd < 0)  {
    5940:	fe442783          	lw	a5,-28(s0)
    5944:	2781                	sext.w	a5,a5
    5946:	0207d163          	bgez	a5,5968 <sbrkarg+0x6c>
    printf("%s: open sbrk failed\n", s);
    594a:	fd843583          	ld	a1,-40(s0)
    594e:	00004517          	auipc	a0,0x4
    5952:	51a50513          	addi	a0,a0,1306 # 9e68 <malloc+0x1ec0>
    5956:	00002097          	auipc	ra,0x2
    595a:	460080e7          	jalr	1120(ra) # 7db6 <printf>
    exit(1);
    595e:	4505                	li	a0,1
    5960:	00002097          	auipc	ra,0x2
    5964:	f28080e7          	jalr	-216(ra) # 7888 <exit>
  }
  if ((n = write(fd, a, PGSIZE)) < 0) {
    5968:	fe442783          	lw	a5,-28(s0)
    596c:	6605                	lui	a2,0x1
    596e:	fe843583          	ld	a1,-24(s0)
    5972:	853e                	mv	a0,a5
    5974:	00002097          	auipc	ra,0x2
    5978:	f34080e7          	jalr	-204(ra) # 78a8 <write>
    597c:	87aa                	mv	a5,a0
    597e:	fef42023          	sw	a5,-32(s0)
    5982:	fe042783          	lw	a5,-32(s0)
    5986:	2781                	sext.w	a5,a5
    5988:	0207d163          	bgez	a5,59aa <sbrkarg+0xae>
    printf("%s: write sbrk failed\n", s);
    598c:	fd843583          	ld	a1,-40(s0)
    5990:	00004517          	auipc	a0,0x4
    5994:	4f050513          	addi	a0,a0,1264 # 9e80 <malloc+0x1ed8>
    5998:	00002097          	auipc	ra,0x2
    599c:	41e080e7          	jalr	1054(ra) # 7db6 <printf>
    exit(1);
    59a0:	4505                	li	a0,1
    59a2:	00002097          	auipc	ra,0x2
    59a6:	ee6080e7          	jalr	-282(ra) # 7888 <exit>
  }
  close(fd);
    59aa:	fe442783          	lw	a5,-28(s0)
    59ae:	853e                	mv	a0,a5
    59b0:	00002097          	auipc	ra,0x2
    59b4:	f00080e7          	jalr	-256(ra) # 78b0 <close>

  // test writes to allocated memory
  a = sbrk(PGSIZE);
    59b8:	6505                	lui	a0,0x1
    59ba:	00002097          	auipc	ra,0x2
    59be:	f56080e7          	jalr	-170(ra) # 7910 <sbrk>
    59c2:	fea43423          	sd	a0,-24(s0)
  if(pipe((int *) a) != 0){
    59c6:	fe843503          	ld	a0,-24(s0)
    59ca:	00002097          	auipc	ra,0x2
    59ce:	ece080e7          	jalr	-306(ra) # 7898 <pipe>
    59d2:	87aa                	mv	a5,a0
    59d4:	c385                	beqz	a5,59f4 <sbrkarg+0xf8>
    printf("%s: pipe() failed\n", s);
    59d6:	fd843583          	ld	a1,-40(s0)
    59da:	00003517          	auipc	a0,0x3
    59de:	00e50513          	addi	a0,a0,14 # 89e8 <malloc+0xa40>
    59e2:	00002097          	auipc	ra,0x2
    59e6:	3d4080e7          	jalr	980(ra) # 7db6 <printf>
    exit(1);
    59ea:	4505                	li	a0,1
    59ec:	00002097          	auipc	ra,0x2
    59f0:	e9c080e7          	jalr	-356(ra) # 7888 <exit>
  }
}
    59f4:	0001                	nop
    59f6:	70a2                	ld	ra,40(sp)
    59f8:	7402                	ld	s0,32(sp)
    59fa:	6145                	addi	sp,sp,48
    59fc:	8082                	ret

00000000000059fe <validatetest>:

void
validatetest(char *s)
{
    59fe:	7179                	addi	sp,sp,-48
    5a00:	f406                	sd	ra,40(sp)
    5a02:	f022                	sd	s0,32(sp)
    5a04:	1800                	addi	s0,sp,48
    5a06:	fca43c23          	sd	a0,-40(s0)
  int hi;
  uint64 p;

  hi = 1100*1024;
    5a0a:	001137b7          	lui	a5,0x113
    5a0e:	fef42223          	sw	a5,-28(s0)
  for(p = 0; p <= (uint)hi; p += PGSIZE){
    5a12:	fe043423          	sd	zero,-24(s0)
    5a16:	a0b1                	j	5a62 <validatetest+0x64>
    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    5a18:	fe843783          	ld	a5,-24(s0)
    5a1c:	85be                	mv	a1,a5
    5a1e:	00004517          	auipc	a0,0x4
    5a22:	47a50513          	addi	a0,a0,1146 # 9e98 <malloc+0x1ef0>
    5a26:	00002097          	auipc	ra,0x2
    5a2a:	ec2080e7          	jalr	-318(ra) # 78e8 <link>
    5a2e:	87aa                	mv	a5,a0
    5a30:	873e                	mv	a4,a5
    5a32:	57fd                	li	a5,-1
    5a34:	02f70163          	beq	a4,a5,5a56 <validatetest+0x58>
      printf("%s: link should not succeed\n", s);
    5a38:	fd843583          	ld	a1,-40(s0)
    5a3c:	00004517          	auipc	a0,0x4
    5a40:	46c50513          	addi	a0,a0,1132 # 9ea8 <malloc+0x1f00>
    5a44:	00002097          	auipc	ra,0x2
    5a48:	372080e7          	jalr	882(ra) # 7db6 <printf>
      exit(1);
    5a4c:	4505                	li	a0,1
    5a4e:	00002097          	auipc	ra,0x2
    5a52:	e3a080e7          	jalr	-454(ra) # 7888 <exit>
  for(p = 0; p <= (uint)hi; p += PGSIZE){
    5a56:	fe843703          	ld	a4,-24(s0)
    5a5a:	6785                	lui	a5,0x1
    5a5c:	97ba                	add	a5,a5,a4
    5a5e:	fef43423          	sd	a5,-24(s0)
    5a62:	fe442783          	lw	a5,-28(s0)
    5a66:	1782                	slli	a5,a5,0x20
    5a68:	9381                	srli	a5,a5,0x20
    5a6a:	fe843703          	ld	a4,-24(s0)
    5a6e:	fae7f5e3          	bgeu	a5,a4,5a18 <validatetest+0x1a>
    }
  }
}
    5a72:	0001                	nop
    5a74:	0001                	nop
    5a76:	70a2                	ld	ra,40(sp)
    5a78:	7402                	ld	s0,32(sp)
    5a7a:	6145                	addi	sp,sp,48
    5a7c:	8082                	ret

0000000000005a7e <bsstest>:

// does uninitialized data start out zero?
char uninit[10000];
void
bsstest(char *s)
{
    5a7e:	7179                	addi	sp,sp,-48
    5a80:	f406                	sd	ra,40(sp)
    5a82:	f022                	sd	s0,32(sp)
    5a84:	1800                	addi	s0,sp,48
    5a86:	fca43c23          	sd	a0,-40(s0)
  int i;

  for(i = 0; i < sizeof(uninit); i++){
    5a8a:	fe042623          	sw	zero,-20(s0)
    5a8e:	a83d                	j	5acc <bsstest+0x4e>
    if(uninit[i] != '\0'){
    5a90:	00009717          	auipc	a4,0x9
    5a94:	9c070713          	addi	a4,a4,-1600 # e450 <uninit>
    5a98:	fec42783          	lw	a5,-20(s0)
    5a9c:	97ba                	add	a5,a5,a4
    5a9e:	0007c783          	lbu	a5,0(a5) # 1000 <truncate3+0x1aa>
    5aa2:	c385                	beqz	a5,5ac2 <bsstest+0x44>
      printf("%s: bss test failed\n", s);
    5aa4:	fd843583          	ld	a1,-40(s0)
    5aa8:	00004517          	auipc	a0,0x4
    5aac:	42050513          	addi	a0,a0,1056 # 9ec8 <malloc+0x1f20>
    5ab0:	00002097          	auipc	ra,0x2
    5ab4:	306080e7          	jalr	774(ra) # 7db6 <printf>
      exit(1);
    5ab8:	4505                	li	a0,1
    5aba:	00002097          	auipc	ra,0x2
    5abe:	dce080e7          	jalr	-562(ra) # 7888 <exit>
  for(i = 0; i < sizeof(uninit); i++){
    5ac2:	fec42783          	lw	a5,-20(s0)
    5ac6:	2785                	addiw	a5,a5,1
    5ac8:	fef42623          	sw	a5,-20(s0)
    5acc:	fec42783          	lw	a5,-20(s0)
    5ad0:	873e                	mv	a4,a5
    5ad2:	6789                	lui	a5,0x2
    5ad4:	70f78793          	addi	a5,a5,1807 # 270f <reparent2+0x7b>
    5ad8:	fae7fce3          	bgeu	a5,a4,5a90 <bsstest+0x12>
    }
  }
}
    5adc:	0001                	nop
    5ade:	0001                	nop
    5ae0:	70a2                	ld	ra,40(sp)
    5ae2:	7402                	ld	s0,32(sp)
    5ae4:	6145                	addi	sp,sp,48
    5ae6:	8082                	ret

0000000000005ae8 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(char *s)
{
    5ae8:	7179                	addi	sp,sp,-48
    5aea:	f406                	sd	ra,40(sp)
    5aec:	f022                	sd	s0,32(sp)
    5aee:	1800                	addi	s0,sp,48
    5af0:	fca43c23          	sd	a0,-40(s0)
  int pid, fd, xstatus;

  unlink("bigarg-ok");
    5af4:	00004517          	auipc	a0,0x4
    5af8:	3ec50513          	addi	a0,a0,1004 # 9ee0 <malloc+0x1f38>
    5afc:	00002097          	auipc	ra,0x2
    5b00:	ddc080e7          	jalr	-548(ra) # 78d8 <unlink>
  pid = fork();
    5b04:	00002097          	auipc	ra,0x2
    5b08:	d7c080e7          	jalr	-644(ra) # 7880 <fork>
    5b0c:	87aa                	mv	a5,a0
    5b0e:	fef42423          	sw	a5,-24(s0)
  if(pid == 0){
    5b12:	fe842783          	lw	a5,-24(s0)
    5b16:	2781                	sext.w	a5,a5
    5b18:	ebc1                	bnez	a5,5ba8 <bigargtest+0xc0>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    5b1a:	fe042623          	sw	zero,-20(s0)
    5b1e:	a01d                	j	5b44 <bigargtest+0x5c>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    5b20:	0000c717          	auipc	a4,0xc
    5b24:	04870713          	addi	a4,a4,72 # 11b68 <args.1814>
    5b28:	fec42783          	lw	a5,-20(s0)
    5b2c:	078e                	slli	a5,a5,0x3
    5b2e:	97ba                	add	a5,a5,a4
    5b30:	00004717          	auipc	a4,0x4
    5b34:	3c070713          	addi	a4,a4,960 # 9ef0 <malloc+0x1f48>
    5b38:	e398                	sd	a4,0(a5)
    for(i = 0; i < MAXARG-1; i++)
    5b3a:	fec42783          	lw	a5,-20(s0)
    5b3e:	2785                	addiw	a5,a5,1
    5b40:	fef42623          	sw	a5,-20(s0)
    5b44:	fec42783          	lw	a5,-20(s0)
    5b48:	0007871b          	sext.w	a4,a5
    5b4c:	47f9                	li	a5,30
    5b4e:	fce7d9e3          	bge	a5,a4,5b20 <bigargtest+0x38>
    args[MAXARG-1] = 0;
    5b52:	0000c797          	auipc	a5,0xc
    5b56:	01678793          	addi	a5,a5,22 # 11b68 <args.1814>
    5b5a:	0e07bc23          	sd	zero,248(a5)
    exec("echo", args);
    5b5e:	0000c597          	auipc	a1,0xc
    5b62:	00a58593          	addi	a1,a1,10 # 11b68 <args.1814>
    5b66:	00002517          	auipc	a0,0x2
    5b6a:	7ca50513          	addi	a0,a0,1994 # 8330 <malloc+0x388>
    5b6e:	00002097          	auipc	ra,0x2
    5b72:	d52080e7          	jalr	-686(ra) # 78c0 <exec>
    fd = open("bigarg-ok", O_CREATE);
    5b76:	20000593          	li	a1,512
    5b7a:	00004517          	auipc	a0,0x4
    5b7e:	36650513          	addi	a0,a0,870 # 9ee0 <malloc+0x1f38>
    5b82:	00002097          	auipc	ra,0x2
    5b86:	d46080e7          	jalr	-698(ra) # 78c8 <open>
    5b8a:	87aa                	mv	a5,a0
    5b8c:	fef42223          	sw	a5,-28(s0)
    close(fd);
    5b90:	fe442783          	lw	a5,-28(s0)
    5b94:	853e                	mv	a0,a5
    5b96:	00002097          	auipc	ra,0x2
    5b9a:	d1a080e7          	jalr	-742(ra) # 78b0 <close>
    exit(0);
    5b9e:	4501                	li	a0,0
    5ba0:	00002097          	auipc	ra,0x2
    5ba4:	ce8080e7          	jalr	-792(ra) # 7888 <exit>
  } else if(pid < 0){
    5ba8:	fe842783          	lw	a5,-24(s0)
    5bac:	2781                	sext.w	a5,a5
    5bae:	0207d163          	bgez	a5,5bd0 <bigargtest+0xe8>
    printf("%s: bigargtest: fork failed\n", s);
    5bb2:	fd843583          	ld	a1,-40(s0)
    5bb6:	00004517          	auipc	a0,0x4
    5bba:	41a50513          	addi	a0,a0,1050 # 9fd0 <malloc+0x2028>
    5bbe:	00002097          	auipc	ra,0x2
    5bc2:	1f8080e7          	jalr	504(ra) # 7db6 <printf>
    exit(1);
    5bc6:	4505                	li	a0,1
    5bc8:	00002097          	auipc	ra,0x2
    5bcc:	cc0080e7          	jalr	-832(ra) # 7888 <exit>
  }

  wait(&xstatus);
    5bd0:	fe040793          	addi	a5,s0,-32
    5bd4:	853e                	mv	a0,a5
    5bd6:	00002097          	auipc	ra,0x2
    5bda:	cba080e7          	jalr	-838(ra) # 7890 <wait>
  if(xstatus != 0)
    5bde:	fe042783          	lw	a5,-32(s0)
    5be2:	cb81                	beqz	a5,5bf2 <bigargtest+0x10a>
    exit(xstatus);
    5be4:	fe042783          	lw	a5,-32(s0)
    5be8:	853e                	mv	a0,a5
    5bea:	00002097          	auipc	ra,0x2
    5bee:	c9e080e7          	jalr	-866(ra) # 7888 <exit>
  fd = open("bigarg-ok", 0);
    5bf2:	4581                	li	a1,0
    5bf4:	00004517          	auipc	a0,0x4
    5bf8:	2ec50513          	addi	a0,a0,748 # 9ee0 <malloc+0x1f38>
    5bfc:	00002097          	auipc	ra,0x2
    5c00:	ccc080e7          	jalr	-820(ra) # 78c8 <open>
    5c04:	87aa                	mv	a5,a0
    5c06:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
    5c0a:	fe442783          	lw	a5,-28(s0)
    5c0e:	2781                	sext.w	a5,a5
    5c10:	0207d163          	bgez	a5,5c32 <bigargtest+0x14a>
    printf("%s: bigarg test failed!\n", s);
    5c14:	fd843583          	ld	a1,-40(s0)
    5c18:	00004517          	auipc	a0,0x4
    5c1c:	3d850513          	addi	a0,a0,984 # 9ff0 <malloc+0x2048>
    5c20:	00002097          	auipc	ra,0x2
    5c24:	196080e7          	jalr	406(ra) # 7db6 <printf>
    exit(1);
    5c28:	4505                	li	a0,1
    5c2a:	00002097          	auipc	ra,0x2
    5c2e:	c5e080e7          	jalr	-930(ra) # 7888 <exit>
  }
  close(fd);
    5c32:	fe442783          	lw	a5,-28(s0)
    5c36:	853e                	mv	a0,a5
    5c38:	00002097          	auipc	ra,0x2
    5c3c:	c78080e7          	jalr	-904(ra) # 78b0 <close>
}
    5c40:	0001                	nop
    5c42:	70a2                	ld	ra,40(sp)
    5c44:	7402                	ld	s0,32(sp)
    5c46:	6145                	addi	sp,sp,48
    5c48:	8082                	ret

0000000000005c4a <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    5c4a:	7159                	addi	sp,sp,-112
    5c4c:	f486                	sd	ra,104(sp)
    5c4e:	f0a2                	sd	s0,96(sp)
    5c50:	1880                	addi	s0,sp,112
  int nfiles;
  int fsblocks = 0;
    5c52:	fe042423          	sw	zero,-24(s0)

  printf("fsfull test\n");
    5c56:	00004517          	auipc	a0,0x4
    5c5a:	3ba50513          	addi	a0,a0,954 # a010 <malloc+0x2068>
    5c5e:	00002097          	auipc	ra,0x2
    5c62:	158080e7          	jalr	344(ra) # 7db6 <printf>

  for(nfiles = 0; ; nfiles++){
    5c66:	fe042623          	sw	zero,-20(s0)
    char name[64];
    name[0] = 'f';
    5c6a:	06600793          	li	a5,102
    5c6e:	f8f40c23          	sb	a5,-104(s0)
    name[1] = '0' + nfiles / 1000;
    5c72:	fec42703          	lw	a4,-20(s0)
    5c76:	3e800793          	li	a5,1000
    5c7a:	02f747bb          	divw	a5,a4,a5
    5c7e:	2781                	sext.w	a5,a5
    5c80:	0ff7f793          	andi	a5,a5,255
    5c84:	0307879b          	addiw	a5,a5,48
    5c88:	0ff7f793          	andi	a5,a5,255
    5c8c:	f8f40ca3          	sb	a5,-103(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    5c90:	fec42703          	lw	a4,-20(s0)
    5c94:	3e800793          	li	a5,1000
    5c98:	02f767bb          	remw	a5,a4,a5
    5c9c:	2781                	sext.w	a5,a5
    5c9e:	873e                	mv	a4,a5
    5ca0:	06400793          	li	a5,100
    5ca4:	02f747bb          	divw	a5,a4,a5
    5ca8:	2781                	sext.w	a5,a5
    5caa:	0ff7f793          	andi	a5,a5,255
    5cae:	0307879b          	addiw	a5,a5,48
    5cb2:	0ff7f793          	andi	a5,a5,255
    5cb6:	f8f40d23          	sb	a5,-102(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    5cba:	fec42703          	lw	a4,-20(s0)
    5cbe:	06400793          	li	a5,100
    5cc2:	02f767bb          	remw	a5,a4,a5
    5cc6:	2781                	sext.w	a5,a5
    5cc8:	873e                	mv	a4,a5
    5cca:	47a9                	li	a5,10
    5ccc:	02f747bb          	divw	a5,a4,a5
    5cd0:	2781                	sext.w	a5,a5
    5cd2:	0ff7f793          	andi	a5,a5,255
    5cd6:	0307879b          	addiw	a5,a5,48
    5cda:	0ff7f793          	andi	a5,a5,255
    5cde:	f8f40da3          	sb	a5,-101(s0)
    name[4] = '0' + (nfiles % 10);
    5ce2:	fec42703          	lw	a4,-20(s0)
    5ce6:	47a9                	li	a5,10
    5ce8:	02f767bb          	remw	a5,a4,a5
    5cec:	2781                	sext.w	a5,a5
    5cee:	0ff7f793          	andi	a5,a5,255
    5cf2:	0307879b          	addiw	a5,a5,48
    5cf6:	0ff7f793          	andi	a5,a5,255
    5cfa:	f8f40e23          	sb	a5,-100(s0)
    name[5] = '\0';
    5cfe:	f8040ea3          	sb	zero,-99(s0)
    printf("writing %s\n", name);
    5d02:	f9840793          	addi	a5,s0,-104
    5d06:	85be                	mv	a1,a5
    5d08:	00004517          	auipc	a0,0x4
    5d0c:	31850513          	addi	a0,a0,792 # a020 <malloc+0x2078>
    5d10:	00002097          	auipc	ra,0x2
    5d14:	0a6080e7          	jalr	166(ra) # 7db6 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    5d18:	f9840793          	addi	a5,s0,-104
    5d1c:	20200593          	li	a1,514
    5d20:	853e                	mv	a0,a5
    5d22:	00002097          	auipc	ra,0x2
    5d26:	ba6080e7          	jalr	-1114(ra) # 78c8 <open>
    5d2a:	87aa                	mv	a5,a0
    5d2c:	fef42023          	sw	a5,-32(s0)
    if(fd < 0){
    5d30:	fe042783          	lw	a5,-32(s0)
    5d34:	2781                	sext.w	a5,a5
    5d36:	0007de63          	bgez	a5,5d52 <fsfull+0x108>
      printf("open %s failed\n", name);
    5d3a:	f9840793          	addi	a5,s0,-104
    5d3e:	85be                	mv	a1,a5
    5d40:	00004517          	auipc	a0,0x4
    5d44:	2f050513          	addi	a0,a0,752 # a030 <malloc+0x2088>
    5d48:	00002097          	auipc	ra,0x2
    5d4c:	06e080e7          	jalr	110(ra) # 7db6 <printf>
      break;
    5d50:	a071                	j	5ddc <fsfull+0x192>
    }
    int total = 0;
    5d52:	fe042223          	sw	zero,-28(s0)
    while(1){
      int cc = write(fd, buf, BSIZE);
    5d56:	fe042783          	lw	a5,-32(s0)
    5d5a:	40000613          	li	a2,1024
    5d5e:	00005597          	auipc	a1,0x5
    5d62:	6f258593          	addi	a1,a1,1778 # b450 <buf>
    5d66:	853e                	mv	a0,a5
    5d68:	00002097          	auipc	ra,0x2
    5d6c:	b40080e7          	jalr	-1216(ra) # 78a8 <write>
    5d70:	87aa                	mv	a5,a0
    5d72:	fcf42e23          	sw	a5,-36(s0)
      if(cc < BSIZE)
    5d76:	fdc42783          	lw	a5,-36(s0)
    5d7a:	0007871b          	sext.w	a4,a5
    5d7e:	3ff00793          	li	a5,1023
    5d82:	00e7df63          	bge	a5,a4,5da0 <fsfull+0x156>
        break;
      total += cc;
    5d86:	fe442703          	lw	a4,-28(s0)
    5d8a:	fdc42783          	lw	a5,-36(s0)
    5d8e:	9fb9                	addw	a5,a5,a4
    5d90:	fef42223          	sw	a5,-28(s0)
      fsblocks++;
    5d94:	fe842783          	lw	a5,-24(s0)
    5d98:	2785                	addiw	a5,a5,1
    5d9a:	fef42423          	sw	a5,-24(s0)
    while(1){
    5d9e:	bf65                	j	5d56 <fsfull+0x10c>
        break;
    5da0:	0001                	nop
    }
    printf("wrote %d bytes\n", total);
    5da2:	fe442783          	lw	a5,-28(s0)
    5da6:	85be                	mv	a1,a5
    5da8:	00004517          	auipc	a0,0x4
    5dac:	29850513          	addi	a0,a0,664 # a040 <malloc+0x2098>
    5db0:	00002097          	auipc	ra,0x2
    5db4:	006080e7          	jalr	6(ra) # 7db6 <printf>
    close(fd);
    5db8:	fe042783          	lw	a5,-32(s0)
    5dbc:	853e                	mv	a0,a5
    5dbe:	00002097          	auipc	ra,0x2
    5dc2:	af2080e7          	jalr	-1294(ra) # 78b0 <close>
    if(total == 0)
    5dc6:	fe442783          	lw	a5,-28(s0)
    5dca:	2781                	sext.w	a5,a5
    5dcc:	c799                	beqz	a5,5dda <fsfull+0x190>
  for(nfiles = 0; ; nfiles++){
    5dce:	fec42783          	lw	a5,-20(s0)
    5dd2:	2785                	addiw	a5,a5,1
    5dd4:	fef42623          	sw	a5,-20(s0)
    5dd8:	bd49                	j	5c6a <fsfull+0x20>
      break;
    5dda:	0001                	nop
  }

  while(nfiles >= 0){
    5ddc:	a84d                	j	5e8e <fsfull+0x244>
    char name[64];
    name[0] = 'f';
    5dde:	06600793          	li	a5,102
    5de2:	f8f40c23          	sb	a5,-104(s0)
    name[1] = '0' + nfiles / 1000;
    5de6:	fec42703          	lw	a4,-20(s0)
    5dea:	3e800793          	li	a5,1000
    5dee:	02f747bb          	divw	a5,a4,a5
    5df2:	2781                	sext.w	a5,a5
    5df4:	0ff7f793          	andi	a5,a5,255
    5df8:	0307879b          	addiw	a5,a5,48
    5dfc:	0ff7f793          	andi	a5,a5,255
    5e00:	f8f40ca3          	sb	a5,-103(s0)
    name[2] = '0' + (nfiles % 1000) / 100;
    5e04:	fec42703          	lw	a4,-20(s0)
    5e08:	3e800793          	li	a5,1000
    5e0c:	02f767bb          	remw	a5,a4,a5
    5e10:	2781                	sext.w	a5,a5
    5e12:	873e                	mv	a4,a5
    5e14:	06400793          	li	a5,100
    5e18:	02f747bb          	divw	a5,a4,a5
    5e1c:	2781                	sext.w	a5,a5
    5e1e:	0ff7f793          	andi	a5,a5,255
    5e22:	0307879b          	addiw	a5,a5,48
    5e26:	0ff7f793          	andi	a5,a5,255
    5e2a:	f8f40d23          	sb	a5,-102(s0)
    name[3] = '0' + (nfiles % 100) / 10;
    5e2e:	fec42703          	lw	a4,-20(s0)
    5e32:	06400793          	li	a5,100
    5e36:	02f767bb          	remw	a5,a4,a5
    5e3a:	2781                	sext.w	a5,a5
    5e3c:	873e                	mv	a4,a5
    5e3e:	47a9                	li	a5,10
    5e40:	02f747bb          	divw	a5,a4,a5
    5e44:	2781                	sext.w	a5,a5
    5e46:	0ff7f793          	andi	a5,a5,255
    5e4a:	0307879b          	addiw	a5,a5,48
    5e4e:	0ff7f793          	andi	a5,a5,255
    5e52:	f8f40da3          	sb	a5,-101(s0)
    name[4] = '0' + (nfiles % 10);
    5e56:	fec42703          	lw	a4,-20(s0)
    5e5a:	47a9                	li	a5,10
    5e5c:	02f767bb          	remw	a5,a4,a5
    5e60:	2781                	sext.w	a5,a5
    5e62:	0ff7f793          	andi	a5,a5,255
    5e66:	0307879b          	addiw	a5,a5,48
    5e6a:	0ff7f793          	andi	a5,a5,255
    5e6e:	f8f40e23          	sb	a5,-100(s0)
    name[5] = '\0';
    5e72:	f8040ea3          	sb	zero,-99(s0)
    unlink(name);
    5e76:	f9840793          	addi	a5,s0,-104
    5e7a:	853e                	mv	a0,a5
    5e7c:	00002097          	auipc	ra,0x2
    5e80:	a5c080e7          	jalr	-1444(ra) # 78d8 <unlink>
    nfiles--;
    5e84:	fec42783          	lw	a5,-20(s0)
    5e88:	37fd                	addiw	a5,a5,-1
    5e8a:	fef42623          	sw	a5,-20(s0)
  while(nfiles >= 0){
    5e8e:	fec42783          	lw	a5,-20(s0)
    5e92:	2781                	sext.w	a5,a5
    5e94:	f407d5e3          	bgez	a5,5dde <fsfull+0x194>
  }

  printf("fsfull test finished\n");
    5e98:	00004517          	auipc	a0,0x4
    5e9c:	1b850513          	addi	a0,a0,440 # a050 <malloc+0x20a8>
    5ea0:	00002097          	auipc	ra,0x2
    5ea4:	f16080e7          	jalr	-234(ra) # 7db6 <printf>
}
    5ea8:	0001                	nop
    5eaa:	70a6                	ld	ra,104(sp)
    5eac:	7406                	ld	s0,96(sp)
    5eae:	6165                	addi	sp,sp,112
    5eb0:	8082                	ret

0000000000005eb2 <argptest>:

void argptest(char *s)
{
    5eb2:	7179                	addi	sp,sp,-48
    5eb4:	f406                	sd	ra,40(sp)
    5eb6:	f022                	sd	s0,32(sp)
    5eb8:	1800                	addi	s0,sp,48
    5eba:	fca43c23          	sd	a0,-40(s0)
  int fd;
  fd = open("init", O_RDONLY);
    5ebe:	4581                	li	a1,0
    5ec0:	00004517          	auipc	a0,0x4
    5ec4:	1a850513          	addi	a0,a0,424 # a068 <malloc+0x20c0>
    5ec8:	00002097          	auipc	ra,0x2
    5ecc:	a00080e7          	jalr	-1536(ra) # 78c8 <open>
    5ed0:	87aa                	mv	a5,a0
    5ed2:	fef42623          	sw	a5,-20(s0)
  if (fd < 0) {
    5ed6:	fec42783          	lw	a5,-20(s0)
    5eda:	2781                	sext.w	a5,a5
    5edc:	0207d163          	bgez	a5,5efe <argptest+0x4c>
    printf("%s: open failed\n", s);
    5ee0:	fd843583          	ld	a1,-40(s0)
    5ee4:	00002517          	auipc	a0,0x2
    5ee8:	68450513          	addi	a0,a0,1668 # 8568 <malloc+0x5c0>
    5eec:	00002097          	auipc	ra,0x2
    5ef0:	eca080e7          	jalr	-310(ra) # 7db6 <printf>
    exit(1);
    5ef4:	4505                	li	a0,1
    5ef6:	00002097          	auipc	ra,0x2
    5efa:	992080e7          	jalr	-1646(ra) # 7888 <exit>
  }
  read(fd, sbrk(0) - 1, -1);
    5efe:	4501                	li	a0,0
    5f00:	00002097          	auipc	ra,0x2
    5f04:	a10080e7          	jalr	-1520(ra) # 7910 <sbrk>
    5f08:	87aa                	mv	a5,a0
    5f0a:	fff78713          	addi	a4,a5,-1
    5f0e:	fec42783          	lw	a5,-20(s0)
    5f12:	567d                	li	a2,-1
    5f14:	85ba                	mv	a1,a4
    5f16:	853e                	mv	a0,a5
    5f18:	00002097          	auipc	ra,0x2
    5f1c:	988080e7          	jalr	-1656(ra) # 78a0 <read>
  close(fd);
    5f20:	fec42783          	lw	a5,-20(s0)
    5f24:	853e                	mv	a0,a5
    5f26:	00002097          	auipc	ra,0x2
    5f2a:	98a080e7          	jalr	-1654(ra) # 78b0 <close>
}
    5f2e:	0001                	nop
    5f30:	70a2                	ld	ra,40(sp)
    5f32:	7402                	ld	s0,32(sp)
    5f34:	6145                	addi	sp,sp,48
    5f36:	8082                	ret

0000000000005f38 <stacktest>:

// check that there's an invalid page beneath
// the user stack, to catch stack overflow.
void
stacktest(char *s)
{
    5f38:	7139                	addi	sp,sp,-64
    5f3a:	fc06                	sd	ra,56(sp)
    5f3c:	f822                	sd	s0,48(sp)
    5f3e:	0080                	addi	s0,sp,64
    5f40:	fca43423          	sd	a0,-56(s0)
  int pid;
  int xstatus;

  pid = fork();
    5f44:	00002097          	auipc	ra,0x2
    5f48:	93c080e7          	jalr	-1732(ra) # 7880 <fork>
    5f4c:	87aa                	mv	a5,a0
    5f4e:	fef42623          	sw	a5,-20(s0)
  if(pid == 0) {
    5f52:	fec42783          	lw	a5,-20(s0)
    5f56:	2781                	sext.w	a5,a5
    5f58:	e3b9                	bnez	a5,5f9e <stacktest+0x66>
    char *sp = (char *) r_sp();
    5f5a:	ffffa097          	auipc	ra,0xffffa
    5f5e:	0a6080e7          	jalr	166(ra) # 0 <r_sp>
    5f62:	87aa                	mv	a5,a0
    5f64:	fef43023          	sd	a5,-32(s0)
    sp -= PGSIZE;
    5f68:	fe043703          	ld	a4,-32(s0)
    5f6c:	77fd                	lui	a5,0xfffff
    5f6e:	97ba                	add	a5,a5,a4
    5f70:	fef43023          	sd	a5,-32(s0)
    // the *sp should cause a trap.
    printf("%s: stacktest: read below stack %p\n", s, *sp);
    5f74:	fe043783          	ld	a5,-32(s0)
    5f78:	0007c783          	lbu	a5,0(a5) # fffffffffffff000 <freep+0xfffffffffffed388>
    5f7c:	2781                	sext.w	a5,a5
    5f7e:	863e                	mv	a2,a5
    5f80:	fc843583          	ld	a1,-56(s0)
    5f84:	00004517          	auipc	a0,0x4
    5f88:	0ec50513          	addi	a0,a0,236 # a070 <malloc+0x20c8>
    5f8c:	00002097          	auipc	ra,0x2
    5f90:	e2a080e7          	jalr	-470(ra) # 7db6 <printf>
    exit(1);
    5f94:	4505                	li	a0,1
    5f96:	00002097          	auipc	ra,0x2
    5f9a:	8f2080e7          	jalr	-1806(ra) # 7888 <exit>
  } else if(pid < 0){
    5f9e:	fec42783          	lw	a5,-20(s0)
    5fa2:	2781                	sext.w	a5,a5
    5fa4:	0207d163          	bgez	a5,5fc6 <stacktest+0x8e>
    printf("%s: fork failed\n", s);
    5fa8:	fc843583          	ld	a1,-56(s0)
    5fac:	00002517          	auipc	a0,0x2
    5fb0:	5a450513          	addi	a0,a0,1444 # 8550 <malloc+0x5a8>
    5fb4:	00002097          	auipc	ra,0x2
    5fb8:	e02080e7          	jalr	-510(ra) # 7db6 <printf>
    exit(1);
    5fbc:	4505                	li	a0,1
    5fbe:	00002097          	auipc	ra,0x2
    5fc2:	8ca080e7          	jalr	-1846(ra) # 7888 <exit>
  }
  wait(&xstatus);
    5fc6:	fdc40793          	addi	a5,s0,-36
    5fca:	853e                	mv	a0,a5
    5fcc:	00002097          	auipc	ra,0x2
    5fd0:	8c4080e7          	jalr	-1852(ra) # 7890 <wait>
  if(xstatus == -1)  // kernel killed child?
    5fd4:	fdc42783          	lw	a5,-36(s0)
    5fd8:	873e                	mv	a4,a5
    5fda:	57fd                	li	a5,-1
    5fdc:	00f71763          	bne	a4,a5,5fea <stacktest+0xb2>
    exit(0);
    5fe0:	4501                	li	a0,0
    5fe2:	00002097          	auipc	ra,0x2
    5fe6:	8a6080e7          	jalr	-1882(ra) # 7888 <exit>
  else
    exit(xstatus);
    5fea:	fdc42783          	lw	a5,-36(s0)
    5fee:	853e                	mv	a0,a5
    5ff0:	00002097          	auipc	ra,0x2
    5ff4:	898080e7          	jalr	-1896(ra) # 7888 <exit>

0000000000005ff8 <textwrite>:
}

// check that writes to text segment fault
void
textwrite(char *s)
{
    5ff8:	7139                	addi	sp,sp,-64
    5ffa:	fc06                	sd	ra,56(sp)
    5ffc:	f822                	sd	s0,48(sp)
    5ffe:	0080                	addi	s0,sp,64
    6000:	fca43423          	sd	a0,-56(s0)
  int pid;
  int xstatus;

  pid = fork();
    6004:	00002097          	auipc	ra,0x2
    6008:	87c080e7          	jalr	-1924(ra) # 7880 <fork>
    600c:	87aa                	mv	a5,a0
    600e:	fef42623          	sw	a5,-20(s0)
  if(pid == 0) {
    6012:	fec42783          	lw	a5,-20(s0)
    6016:	2781                	sext.w	a5,a5
    6018:	ef81                	bnez	a5,6030 <textwrite+0x38>
    volatile int *addr = (int *) 0;
    601a:	fe043023          	sd	zero,-32(s0)
    *addr = 10;
    601e:	fe043783          	ld	a5,-32(s0)
    6022:	4729                	li	a4,10
    6024:	c398                	sw	a4,0(a5)
    exit(1);
    6026:	4505                	li	a0,1
    6028:	00002097          	auipc	ra,0x2
    602c:	860080e7          	jalr	-1952(ra) # 7888 <exit>
  } else if(pid < 0){
    6030:	fec42783          	lw	a5,-20(s0)
    6034:	2781                	sext.w	a5,a5
    6036:	0207d163          	bgez	a5,6058 <textwrite+0x60>
    printf("%s: fork failed\n", s);
    603a:	fc843583          	ld	a1,-56(s0)
    603e:	00002517          	auipc	a0,0x2
    6042:	51250513          	addi	a0,a0,1298 # 8550 <malloc+0x5a8>
    6046:	00002097          	auipc	ra,0x2
    604a:	d70080e7          	jalr	-656(ra) # 7db6 <printf>
    exit(1);
    604e:	4505                	li	a0,1
    6050:	00002097          	auipc	ra,0x2
    6054:	838080e7          	jalr	-1992(ra) # 7888 <exit>
  }
  wait(&xstatus);
    6058:	fdc40793          	addi	a5,s0,-36
    605c:	853e                	mv	a0,a5
    605e:	00002097          	auipc	ra,0x2
    6062:	832080e7          	jalr	-1998(ra) # 7890 <wait>
  if(xstatus == -1)  // kernel killed child?
    6066:	fdc42783          	lw	a5,-36(s0)
    606a:	873e                	mv	a4,a5
    606c:	57fd                	li	a5,-1
    606e:	00f71763          	bne	a4,a5,607c <textwrite+0x84>
    exit(0);
    6072:	4501                	li	a0,0
    6074:	00002097          	auipc	ra,0x2
    6078:	814080e7          	jalr	-2028(ra) # 7888 <exit>
  else
    exit(xstatus);
    607c:	fdc42783          	lw	a5,-36(s0)
    6080:	853e                	mv	a0,a5
    6082:	00002097          	auipc	ra,0x2
    6086:	806080e7          	jalr	-2042(ra) # 7888 <exit>

000000000000608a <pgbug>:
// the virtual page address to uint, which (with certain wild system
// call arguments) resulted in a kernel page faults.
void *big = (void*) 0xeaeb0b5b00002f5e;
void
pgbug(char *s)
{
    608a:	7179                	addi	sp,sp,-48
    608c:	f406                	sd	ra,40(sp)
    608e:	f022                	sd	s0,32(sp)
    6090:	1800                	addi	s0,sp,48
    6092:	fca43c23          	sd	a0,-40(s0)
  char *argv[1];
  argv[0] = 0;
    6096:	fe043423          	sd	zero,-24(s0)
  exec(big, argv);
    609a:	00005797          	auipc	a5,0x5
    609e:	f6678793          	addi	a5,a5,-154 # b000 <big>
    60a2:	639c                	ld	a5,0(a5)
    60a4:	fe840713          	addi	a4,s0,-24
    60a8:	85ba                	mv	a1,a4
    60aa:	853e                	mv	a0,a5
    60ac:	00002097          	auipc	ra,0x2
    60b0:	814080e7          	jalr	-2028(ra) # 78c0 <exec>
  pipe(big);
    60b4:	00005797          	auipc	a5,0x5
    60b8:	f4c78793          	addi	a5,a5,-180 # b000 <big>
    60bc:	639c                	ld	a5,0(a5)
    60be:	853e                	mv	a0,a5
    60c0:	00001097          	auipc	ra,0x1
    60c4:	7d8080e7          	jalr	2008(ra) # 7898 <pipe>

  exit(0);
    60c8:	4501                	li	a0,0
    60ca:	00001097          	auipc	ra,0x1
    60ce:	7be080e7          	jalr	1982(ra) # 7888 <exit>

00000000000060d2 <sbrkbugs>:
// regression test. does the kernel panic if a process sbrk()s its
// size to be less than a page, or zero, or reduces the break by an
// amount too small to cause a page to be freed?
void
sbrkbugs(char *s)
{
    60d2:	7179                	addi	sp,sp,-48
    60d4:	f406                	sd	ra,40(sp)
    60d6:	f022                	sd	s0,32(sp)
    60d8:	1800                	addi	s0,sp,48
    60da:	fca43c23          	sd	a0,-40(s0)
  int pid = fork();
    60de:	00001097          	auipc	ra,0x1
    60e2:	7a2080e7          	jalr	1954(ra) # 7880 <fork>
    60e6:	87aa                	mv	a5,a0
    60e8:	fef42623          	sw	a5,-20(s0)
  if(pid < 0){
    60ec:	fec42783          	lw	a5,-20(s0)
    60f0:	2781                	sext.w	a5,a5
    60f2:	0007df63          	bgez	a5,6110 <sbrkbugs+0x3e>
    printf("fork failed\n");
    60f6:	00002517          	auipc	a0,0x2
    60fa:	22a50513          	addi	a0,a0,554 # 8320 <malloc+0x378>
    60fe:	00002097          	auipc	ra,0x2
    6102:	cb8080e7          	jalr	-840(ra) # 7db6 <printf>
    exit(1);
    6106:	4505                	li	a0,1
    6108:	00001097          	auipc	ra,0x1
    610c:	780080e7          	jalr	1920(ra) # 7888 <exit>
  }
  if(pid == 0){
    6110:	fec42783          	lw	a5,-20(s0)
    6114:	2781                	sext.w	a5,a5
    6116:	eb85                	bnez	a5,6146 <sbrkbugs+0x74>
    int sz = (uint64) sbrk(0);
    6118:	4501                	li	a0,0
    611a:	00001097          	auipc	ra,0x1
    611e:	7f6080e7          	jalr	2038(ra) # 7910 <sbrk>
    6122:	87aa                	mv	a5,a0
    6124:	fef42223          	sw	a5,-28(s0)
    // free all user memory; there used to be a bug that
    // would not adjust p->sz correctly in this case,
    // causing exit() to panic.
    sbrk(-sz);
    6128:	fe442783          	lw	a5,-28(s0)
    612c:	40f007bb          	negw	a5,a5
    6130:	2781                	sext.w	a5,a5
    6132:	853e                	mv	a0,a5
    6134:	00001097          	auipc	ra,0x1
    6138:	7dc080e7          	jalr	2012(ra) # 7910 <sbrk>
    // user page fault here.
    exit(0);
    613c:	4501                	li	a0,0
    613e:	00001097          	auipc	ra,0x1
    6142:	74a080e7          	jalr	1866(ra) # 7888 <exit>
  }
  wait(0);
    6146:	4501                	li	a0,0
    6148:	00001097          	auipc	ra,0x1
    614c:	748080e7          	jalr	1864(ra) # 7890 <wait>

  pid = fork();
    6150:	00001097          	auipc	ra,0x1
    6154:	730080e7          	jalr	1840(ra) # 7880 <fork>
    6158:	87aa                	mv	a5,a0
    615a:	fef42623          	sw	a5,-20(s0)
  if(pid < 0){
    615e:	fec42783          	lw	a5,-20(s0)
    6162:	2781                	sext.w	a5,a5
    6164:	0007df63          	bgez	a5,6182 <sbrkbugs+0xb0>
    printf("fork failed\n");
    6168:	00002517          	auipc	a0,0x2
    616c:	1b850513          	addi	a0,a0,440 # 8320 <malloc+0x378>
    6170:	00002097          	auipc	ra,0x2
    6174:	c46080e7          	jalr	-954(ra) # 7db6 <printf>
    exit(1);
    6178:	4505                	li	a0,1
    617a:	00001097          	auipc	ra,0x1
    617e:	70e080e7          	jalr	1806(ra) # 7888 <exit>
  }
  if(pid == 0){
    6182:	fec42783          	lw	a5,-20(s0)
    6186:	2781                	sext.w	a5,a5
    6188:	eb9d                	bnez	a5,61be <sbrkbugs+0xec>
    int sz = (uint64) sbrk(0);
    618a:	4501                	li	a0,0
    618c:	00001097          	auipc	ra,0x1
    6190:	784080e7          	jalr	1924(ra) # 7910 <sbrk>
    6194:	87aa                	mv	a5,a0
    6196:	fef42423          	sw	a5,-24(s0)
    // set the break to somewhere in the very first
    // page; there used to be a bug that would incorrectly
    // free the first page.
    sbrk(-(sz - 3500));
    619a:	6785                	lui	a5,0x1
    619c:	dac7871b          	addiw	a4,a5,-596
    61a0:	fe842783          	lw	a5,-24(s0)
    61a4:	40f707bb          	subw	a5,a4,a5
    61a8:	2781                	sext.w	a5,a5
    61aa:	853e                	mv	a0,a5
    61ac:	00001097          	auipc	ra,0x1
    61b0:	764080e7          	jalr	1892(ra) # 7910 <sbrk>
    exit(0);
    61b4:	4501                	li	a0,0
    61b6:	00001097          	auipc	ra,0x1
    61ba:	6d2080e7          	jalr	1746(ra) # 7888 <exit>
  }
  wait(0);
    61be:	4501                	li	a0,0
    61c0:	00001097          	auipc	ra,0x1
    61c4:	6d0080e7          	jalr	1744(ra) # 7890 <wait>

  pid = fork();
    61c8:	00001097          	auipc	ra,0x1
    61cc:	6b8080e7          	jalr	1720(ra) # 7880 <fork>
    61d0:	87aa                	mv	a5,a0
    61d2:	fef42623          	sw	a5,-20(s0)
  if(pid < 0){
    61d6:	fec42783          	lw	a5,-20(s0)
    61da:	2781                	sext.w	a5,a5
    61dc:	0007df63          	bgez	a5,61fa <sbrkbugs+0x128>
    printf("fork failed\n");
    61e0:	00002517          	auipc	a0,0x2
    61e4:	14050513          	addi	a0,a0,320 # 8320 <malloc+0x378>
    61e8:	00002097          	auipc	ra,0x2
    61ec:	bce080e7          	jalr	-1074(ra) # 7db6 <printf>
    exit(1);
    61f0:	4505                	li	a0,1
    61f2:	00001097          	auipc	ra,0x1
    61f6:	696080e7          	jalr	1686(ra) # 7888 <exit>
  }
  if(pid == 0){
    61fa:	fec42783          	lw	a5,-20(s0)
    61fe:	2781                	sext.w	a5,a5
    6200:	ef95                	bnez	a5,623c <sbrkbugs+0x16a>
    // set the break in the middle of a page.
    sbrk((10*4096 + 2048) - (uint64)sbrk(0));
    6202:	4501                	li	a0,0
    6204:	00001097          	auipc	ra,0x1
    6208:	70c080e7          	jalr	1804(ra) # 7910 <sbrk>
    620c:	87aa                	mv	a5,a0
    620e:	2781                	sext.w	a5,a5
    6210:	672d                	lui	a4,0xb
    6212:	8007071b          	addiw	a4,a4,-2048
    6216:	40f707bb          	subw	a5,a4,a5
    621a:	2781                	sext.w	a5,a5
    621c:	2781                	sext.w	a5,a5
    621e:	853e                	mv	a0,a5
    6220:	00001097          	auipc	ra,0x1
    6224:	6f0080e7          	jalr	1776(ra) # 7910 <sbrk>

    // reduce the break a bit, but not enough to
    // cause a page to be freed. this used to cause
    // a panic.
    sbrk(-10);
    6228:	5559                	li	a0,-10
    622a:	00001097          	auipc	ra,0x1
    622e:	6e6080e7          	jalr	1766(ra) # 7910 <sbrk>

    exit(0);
    6232:	4501                	li	a0,0
    6234:	00001097          	auipc	ra,0x1
    6238:	654080e7          	jalr	1620(ra) # 7888 <exit>
  }
  wait(0);
    623c:	4501                	li	a0,0
    623e:	00001097          	auipc	ra,0x1
    6242:	652080e7          	jalr	1618(ra) # 7890 <wait>

  exit(0);
    6246:	4501                	li	a0,0
    6248:	00001097          	auipc	ra,0x1
    624c:	640080e7          	jalr	1600(ra) # 7888 <exit>

0000000000006250 <sbrklast>:
// if process size was somewhat more than a page boundary, and then
// shrunk to be somewhat less than that page boundary, can the kernel
// still copyin() from addresses in the last page?
void
sbrklast(char *s)
{
    6250:	7139                	addi	sp,sp,-64
    6252:	fc06                	sd	ra,56(sp)
    6254:	f822                	sd	s0,48(sp)
    6256:	0080                	addi	s0,sp,64
    6258:	fca43423          	sd	a0,-56(s0)
  uint64 top = (uint64) sbrk(0);
    625c:	4501                	li	a0,0
    625e:	00001097          	auipc	ra,0x1
    6262:	6b2080e7          	jalr	1714(ra) # 7910 <sbrk>
    6266:	87aa                	mv	a5,a0
    6268:	fef43423          	sd	a5,-24(s0)
  if((top % 4096) != 0)
    626c:	fe843703          	ld	a4,-24(s0)
    6270:	6785                	lui	a5,0x1
    6272:	17fd                	addi	a5,a5,-1
    6274:	8ff9                	and	a5,a5,a4
    6276:	c39d                	beqz	a5,629c <sbrklast+0x4c>
    sbrk(4096 - (top % 4096));
    6278:	fe843783          	ld	a5,-24(s0)
    627c:	2781                	sext.w	a5,a5
    627e:	873e                	mv	a4,a5
    6280:	6785                	lui	a5,0x1
    6282:	17fd                	addi	a5,a5,-1
    6284:	8ff9                	and	a5,a5,a4
    6286:	2781                	sext.w	a5,a5
    6288:	6705                	lui	a4,0x1
    628a:	40f707bb          	subw	a5,a4,a5
    628e:	2781                	sext.w	a5,a5
    6290:	2781                	sext.w	a5,a5
    6292:	853e                	mv	a0,a5
    6294:	00001097          	auipc	ra,0x1
    6298:	67c080e7          	jalr	1660(ra) # 7910 <sbrk>
  sbrk(4096);
    629c:	6505                	lui	a0,0x1
    629e:	00001097          	auipc	ra,0x1
    62a2:	672080e7          	jalr	1650(ra) # 7910 <sbrk>
  sbrk(10);
    62a6:	4529                	li	a0,10
    62a8:	00001097          	auipc	ra,0x1
    62ac:	668080e7          	jalr	1640(ra) # 7910 <sbrk>
  sbrk(-20);
    62b0:	5531                	li	a0,-20
    62b2:	00001097          	auipc	ra,0x1
    62b6:	65e080e7          	jalr	1630(ra) # 7910 <sbrk>
  top = (uint64) sbrk(0);
    62ba:	4501                	li	a0,0
    62bc:	00001097          	auipc	ra,0x1
    62c0:	654080e7          	jalr	1620(ra) # 7910 <sbrk>
    62c4:	87aa                	mv	a5,a0
    62c6:	fef43423          	sd	a5,-24(s0)
  char *p = (char *) (top - 64);
    62ca:	fe843783          	ld	a5,-24(s0)
    62ce:	fc078793          	addi	a5,a5,-64 # fc0 <truncate3+0x16a>
    62d2:	fef43023          	sd	a5,-32(s0)
  p[0] = 'x';
    62d6:	fe043783          	ld	a5,-32(s0)
    62da:	07800713          	li	a4,120
    62de:	00e78023          	sb	a4,0(a5)
  p[1] = '\0';
    62e2:	fe043783          	ld	a5,-32(s0)
    62e6:	0785                	addi	a5,a5,1
    62e8:	00078023          	sb	zero,0(a5)
  int fd = open(p, O_RDWR|O_CREATE);
    62ec:	20200593          	li	a1,514
    62f0:	fe043503          	ld	a0,-32(s0)
    62f4:	00001097          	auipc	ra,0x1
    62f8:	5d4080e7          	jalr	1492(ra) # 78c8 <open>
    62fc:	87aa                	mv	a5,a0
    62fe:	fcf42e23          	sw	a5,-36(s0)
  write(fd, p, 1);
    6302:	fdc42783          	lw	a5,-36(s0)
    6306:	4605                	li	a2,1
    6308:	fe043583          	ld	a1,-32(s0)
    630c:	853e                	mv	a0,a5
    630e:	00001097          	auipc	ra,0x1
    6312:	59a080e7          	jalr	1434(ra) # 78a8 <write>
  close(fd);
    6316:	fdc42783          	lw	a5,-36(s0)
    631a:	853e                	mv	a0,a5
    631c:	00001097          	auipc	ra,0x1
    6320:	594080e7          	jalr	1428(ra) # 78b0 <close>
  fd = open(p, O_RDWR);
    6324:	4589                	li	a1,2
    6326:	fe043503          	ld	a0,-32(s0)
    632a:	00001097          	auipc	ra,0x1
    632e:	59e080e7          	jalr	1438(ra) # 78c8 <open>
    6332:	87aa                	mv	a5,a0
    6334:	fcf42e23          	sw	a5,-36(s0)
  p[0] = '\0';
    6338:	fe043783          	ld	a5,-32(s0)
    633c:	00078023          	sb	zero,0(a5)
  read(fd, p, 1);
    6340:	fdc42783          	lw	a5,-36(s0)
    6344:	4605                	li	a2,1
    6346:	fe043583          	ld	a1,-32(s0)
    634a:	853e                	mv	a0,a5
    634c:	00001097          	auipc	ra,0x1
    6350:	554080e7          	jalr	1364(ra) # 78a0 <read>
  if(p[0] != 'x')
    6354:	fe043783          	ld	a5,-32(s0)
    6358:	0007c783          	lbu	a5,0(a5)
    635c:	873e                	mv	a4,a5
    635e:	07800793          	li	a5,120
    6362:	00f70763          	beq	a4,a5,6370 <sbrklast+0x120>
    exit(1);
    6366:	4505                	li	a0,1
    6368:	00001097          	auipc	ra,0x1
    636c:	520080e7          	jalr	1312(ra) # 7888 <exit>
}
    6370:	0001                	nop
    6372:	70e2                	ld	ra,56(sp)
    6374:	7442                	ld	s0,48(sp)
    6376:	6121                	addi	sp,sp,64
    6378:	8082                	ret

000000000000637a <sbrk8000>:

// does sbrk handle signed int32 wrap-around with
// negative arguments?
void
sbrk8000(char *s)
{
    637a:	7179                	addi	sp,sp,-48
    637c:	f406                	sd	ra,40(sp)
    637e:	f022                	sd	s0,32(sp)
    6380:	1800                	addi	s0,sp,48
    6382:	fca43c23          	sd	a0,-40(s0)
  sbrk(0x80000004);
    6386:	800007b7          	lui	a5,0x80000
    638a:	00478513          	addi	a0,a5,4 # ffffffff80000004 <freep+0xffffffff7ffee38c>
    638e:	00001097          	auipc	ra,0x1
    6392:	582080e7          	jalr	1410(ra) # 7910 <sbrk>
  volatile char *top = sbrk(0);
    6396:	4501                	li	a0,0
    6398:	00001097          	auipc	ra,0x1
    639c:	578080e7          	jalr	1400(ra) # 7910 <sbrk>
    63a0:	fea43423          	sd	a0,-24(s0)
  *(top-1) = *(top-1) + 1;
    63a4:	fe843783          	ld	a5,-24(s0)
    63a8:	17fd                	addi	a5,a5,-1
    63aa:	0007c783          	lbu	a5,0(a5)
    63ae:	0ff7f713          	andi	a4,a5,255
    63b2:	fe843783          	ld	a5,-24(s0)
    63b6:	17fd                	addi	a5,a5,-1
    63b8:	2705                	addiw	a4,a4,1
    63ba:	0ff77713          	andi	a4,a4,255
    63be:	00e78023          	sb	a4,0(a5)
}
    63c2:	0001                	nop
    63c4:	70a2                	ld	ra,40(sp)
    63c6:	7402                	ld	s0,32(sp)
    63c8:	6145                	addi	sp,sp,48
    63ca:	8082                	ret

00000000000063cc <badarg>:

// regression test. test whether exec() leaks memory if one of the
// arguments is invalid. the test passes if the kernel doesn't panic.
void
badarg(char *s)
{
    63cc:	7139                	addi	sp,sp,-64
    63ce:	fc06                	sd	ra,56(sp)
    63d0:	f822                	sd	s0,48(sp)
    63d2:	0080                	addi	s0,sp,64
    63d4:	fca43423          	sd	a0,-56(s0)
  for(int i = 0; i < 50000; i++){
    63d8:	fe042623          	sw	zero,-20(s0)
    63dc:	a03d                	j	640a <badarg+0x3e>
    char *argv[2];
    argv[0] = (char*)0xffffffff;
    63de:	57fd                	li	a5,-1
    63e0:	9381                	srli	a5,a5,0x20
    63e2:	fcf43c23          	sd	a5,-40(s0)
    argv[1] = 0;
    63e6:	fe043023          	sd	zero,-32(s0)
    exec("echo", argv);
    63ea:	fd840793          	addi	a5,s0,-40
    63ee:	85be                	mv	a1,a5
    63f0:	00002517          	auipc	a0,0x2
    63f4:	f4050513          	addi	a0,a0,-192 # 8330 <malloc+0x388>
    63f8:	00001097          	auipc	ra,0x1
    63fc:	4c8080e7          	jalr	1224(ra) # 78c0 <exec>
  for(int i = 0; i < 50000; i++){
    6400:	fec42783          	lw	a5,-20(s0)
    6404:	2785                	addiw	a5,a5,1
    6406:	fef42623          	sw	a5,-20(s0)
    640a:	fec42783          	lw	a5,-20(s0)
    640e:	0007871b          	sext.w	a4,a5
    6412:	67b1                	lui	a5,0xc
    6414:	34f78793          	addi	a5,a5,847 # c34f <buf+0xeff>
    6418:	fce7d3e3          	bge	a5,a4,63de <badarg+0x12>
  }

  exit(0);
    641c:	4501                	li	a0,0
    641e:	00001097          	auipc	ra,0x1
    6422:	46a080e7          	jalr	1130(ra) # 7888 <exit>

0000000000006426 <bigdir>:
//

// directory that uses indirect blocks
void
bigdir(char *s)
{
    6426:	7139                	addi	sp,sp,-64
    6428:	fc06                	sd	ra,56(sp)
    642a:	f822                	sd	s0,48(sp)
    642c:	0080                	addi	s0,sp,64
    642e:	fca43423          	sd	a0,-56(s0)
  enum { N = 500 };
  int i, fd;
  char name[10];

  unlink("bd");
    6432:	00004517          	auipc	a0,0x4
    6436:	f3e50513          	addi	a0,a0,-194 # a370 <malloc+0x23c8>
    643a:	00001097          	auipc	ra,0x1
    643e:	49e080e7          	jalr	1182(ra) # 78d8 <unlink>

  fd = open("bd", O_CREATE);
    6442:	20000593          	li	a1,512
    6446:	00004517          	auipc	a0,0x4
    644a:	f2a50513          	addi	a0,a0,-214 # a370 <malloc+0x23c8>
    644e:	00001097          	auipc	ra,0x1
    6452:	47a080e7          	jalr	1146(ra) # 78c8 <open>
    6456:	87aa                	mv	a5,a0
    6458:	fef42423          	sw	a5,-24(s0)
  if(fd < 0){
    645c:	fe842783          	lw	a5,-24(s0)
    6460:	2781                	sext.w	a5,a5
    6462:	0207d163          	bgez	a5,6484 <bigdir+0x5e>
    printf("%s: bigdir create failed\n", s);
    6466:	fc843583          	ld	a1,-56(s0)
    646a:	00004517          	auipc	a0,0x4
    646e:	f0e50513          	addi	a0,a0,-242 # a378 <malloc+0x23d0>
    6472:	00002097          	auipc	ra,0x2
    6476:	944080e7          	jalr	-1724(ra) # 7db6 <printf>
    exit(1);
    647a:	4505                	li	a0,1
    647c:	00001097          	auipc	ra,0x1
    6480:	40c080e7          	jalr	1036(ra) # 7888 <exit>
  }
  close(fd);
    6484:	fe842783          	lw	a5,-24(s0)
    6488:	853e                	mv	a0,a5
    648a:	00001097          	auipc	ra,0x1
    648e:	426080e7          	jalr	1062(ra) # 78b0 <close>

  for(i = 0; i < N; i++){
    6492:	fe042623          	sw	zero,-20(s0)
    6496:	a04d                	j	6538 <bigdir+0x112>
    name[0] = 'x';
    6498:	07800793          	li	a5,120
    649c:	fcf40c23          	sb	a5,-40(s0)
    name[1] = '0' + (i / 64);
    64a0:	fec42783          	lw	a5,-20(s0)
    64a4:	41f7d71b          	sraiw	a4,a5,0x1f
    64a8:	01a7571b          	srliw	a4,a4,0x1a
    64ac:	9fb9                	addw	a5,a5,a4
    64ae:	4067d79b          	sraiw	a5,a5,0x6
    64b2:	2781                	sext.w	a5,a5
    64b4:	0ff7f793          	andi	a5,a5,255
    64b8:	0307879b          	addiw	a5,a5,48
    64bc:	0ff7f793          	andi	a5,a5,255
    64c0:	fcf40ca3          	sb	a5,-39(s0)
    name[2] = '0' + (i % 64);
    64c4:	fec42703          	lw	a4,-20(s0)
    64c8:	41f7579b          	sraiw	a5,a4,0x1f
    64cc:	01a7d79b          	srliw	a5,a5,0x1a
    64d0:	9f3d                	addw	a4,a4,a5
    64d2:	03f77713          	andi	a4,a4,63
    64d6:	40f707bb          	subw	a5,a4,a5
    64da:	2781                	sext.w	a5,a5
    64dc:	0ff7f793          	andi	a5,a5,255
    64e0:	0307879b          	addiw	a5,a5,48
    64e4:	0ff7f793          	andi	a5,a5,255
    64e8:	fcf40d23          	sb	a5,-38(s0)
    name[3] = '\0';
    64ec:	fc040da3          	sb	zero,-37(s0)
    if(link("bd", name) != 0){
    64f0:	fd840793          	addi	a5,s0,-40
    64f4:	85be                	mv	a1,a5
    64f6:	00004517          	auipc	a0,0x4
    64fa:	e7a50513          	addi	a0,a0,-390 # a370 <malloc+0x23c8>
    64fe:	00001097          	auipc	ra,0x1
    6502:	3ea080e7          	jalr	1002(ra) # 78e8 <link>
    6506:	87aa                	mv	a5,a0
    6508:	c39d                	beqz	a5,652e <bigdir+0x108>
      printf("%s: bigdir link(bd, %s) failed\n", s, name);
    650a:	fd840793          	addi	a5,s0,-40
    650e:	863e                	mv	a2,a5
    6510:	fc843583          	ld	a1,-56(s0)
    6514:	00004517          	auipc	a0,0x4
    6518:	e8450513          	addi	a0,a0,-380 # a398 <malloc+0x23f0>
    651c:	00002097          	auipc	ra,0x2
    6520:	89a080e7          	jalr	-1894(ra) # 7db6 <printf>
      exit(1);
    6524:	4505                	li	a0,1
    6526:	00001097          	auipc	ra,0x1
    652a:	362080e7          	jalr	866(ra) # 7888 <exit>
  for(i = 0; i < N; i++){
    652e:	fec42783          	lw	a5,-20(s0)
    6532:	2785                	addiw	a5,a5,1
    6534:	fef42623          	sw	a5,-20(s0)
    6538:	fec42783          	lw	a5,-20(s0)
    653c:	0007871b          	sext.w	a4,a5
    6540:	1f300793          	li	a5,499
    6544:	f4e7dae3          	bge	a5,a4,6498 <bigdir+0x72>
    }
  }

  unlink("bd");
    6548:	00004517          	auipc	a0,0x4
    654c:	e2850513          	addi	a0,a0,-472 # a370 <malloc+0x23c8>
    6550:	00001097          	auipc	ra,0x1
    6554:	388080e7          	jalr	904(ra) # 78d8 <unlink>
  for(i = 0; i < N; i++){
    6558:	fe042623          	sw	zero,-20(s0)
    655c:	a851                	j	65f0 <bigdir+0x1ca>
    name[0] = 'x';
    655e:	07800793          	li	a5,120
    6562:	fcf40c23          	sb	a5,-40(s0)
    name[1] = '0' + (i / 64);
    6566:	fec42783          	lw	a5,-20(s0)
    656a:	41f7d71b          	sraiw	a4,a5,0x1f
    656e:	01a7571b          	srliw	a4,a4,0x1a
    6572:	9fb9                	addw	a5,a5,a4
    6574:	4067d79b          	sraiw	a5,a5,0x6
    6578:	2781                	sext.w	a5,a5
    657a:	0ff7f793          	andi	a5,a5,255
    657e:	0307879b          	addiw	a5,a5,48
    6582:	0ff7f793          	andi	a5,a5,255
    6586:	fcf40ca3          	sb	a5,-39(s0)
    name[2] = '0' + (i % 64);
    658a:	fec42703          	lw	a4,-20(s0)
    658e:	41f7579b          	sraiw	a5,a4,0x1f
    6592:	01a7d79b          	srliw	a5,a5,0x1a
    6596:	9f3d                	addw	a4,a4,a5
    6598:	03f77713          	andi	a4,a4,63
    659c:	40f707bb          	subw	a5,a4,a5
    65a0:	2781                	sext.w	a5,a5
    65a2:	0ff7f793          	andi	a5,a5,255
    65a6:	0307879b          	addiw	a5,a5,48
    65aa:	0ff7f793          	andi	a5,a5,255
    65ae:	fcf40d23          	sb	a5,-38(s0)
    name[3] = '\0';
    65b2:	fc040da3          	sb	zero,-37(s0)
    if(unlink(name) != 0){
    65b6:	fd840793          	addi	a5,s0,-40
    65ba:	853e                	mv	a0,a5
    65bc:	00001097          	auipc	ra,0x1
    65c0:	31c080e7          	jalr	796(ra) # 78d8 <unlink>
    65c4:	87aa                	mv	a5,a0
    65c6:	c385                	beqz	a5,65e6 <bigdir+0x1c0>
      printf("%s: bigdir unlink failed", s);
    65c8:	fc843583          	ld	a1,-56(s0)
    65cc:	00004517          	auipc	a0,0x4
    65d0:	dec50513          	addi	a0,a0,-532 # a3b8 <malloc+0x2410>
    65d4:	00001097          	auipc	ra,0x1
    65d8:	7e2080e7          	jalr	2018(ra) # 7db6 <printf>
      exit(1);
    65dc:	4505                	li	a0,1
    65de:	00001097          	auipc	ra,0x1
    65e2:	2aa080e7          	jalr	682(ra) # 7888 <exit>
  for(i = 0; i < N; i++){
    65e6:	fec42783          	lw	a5,-20(s0)
    65ea:	2785                	addiw	a5,a5,1
    65ec:	fef42623          	sw	a5,-20(s0)
    65f0:	fec42783          	lw	a5,-20(s0)
    65f4:	0007871b          	sext.w	a4,a5
    65f8:	1f300793          	li	a5,499
    65fc:	f6e7d1e3          	bge	a5,a4,655e <bigdir+0x138>
    }
  }
}
    6600:	0001                	nop
    6602:	0001                	nop
    6604:	70e2                	ld	ra,56(sp)
    6606:	7442                	ld	s0,48(sp)
    6608:	6121                	addi	sp,sp,64
    660a:	8082                	ret

000000000000660c <manywrites>:

// concurrent writes to try to provoke deadlock in the virtio disk
// driver.
void
manywrites(char *s)
{
    660c:	711d                	addi	sp,sp,-96
    660e:	ec86                	sd	ra,88(sp)
    6610:	e8a2                	sd	s0,80(sp)
    6612:	1080                	addi	s0,sp,96
    6614:	faa43423          	sd	a0,-88(s0)
  int nchildren = 4;
    6618:	4791                	li	a5,4
    661a:	fcf42e23          	sw	a5,-36(s0)
  int howmany = 30; // increase to look for deadlock
    661e:	47f9                	li	a5,30
    6620:	fcf42c23          	sw	a5,-40(s0)

  for(int ci = 0; ci < nchildren; ci++){
    6624:	fe042623          	sw	zero,-20(s0)
    6628:	aa49                	j	67ba <manywrites+0x1ae>
    int pid = fork();
    662a:	00001097          	auipc	ra,0x1
    662e:	256080e7          	jalr	598(ra) # 7880 <fork>
    6632:	87aa                	mv	a5,a0
    6634:	fcf42a23          	sw	a5,-44(s0)
    if(pid < 0){
    6638:	fd442783          	lw	a5,-44(s0)
    663c:	2781                	sext.w	a5,a5
    663e:	0007df63          	bgez	a5,665c <manywrites+0x50>
      printf("fork failed\n");
    6642:	00002517          	auipc	a0,0x2
    6646:	cde50513          	addi	a0,a0,-802 # 8320 <malloc+0x378>
    664a:	00001097          	auipc	ra,0x1
    664e:	76c080e7          	jalr	1900(ra) # 7db6 <printf>
      exit(1);
    6652:	4505                	li	a0,1
    6654:	00001097          	auipc	ra,0x1
    6658:	234080e7          	jalr	564(ra) # 7888 <exit>
    }

    if(pid == 0){
    665c:	fd442783          	lw	a5,-44(s0)
    6660:	2781                	sext.w	a5,a5
    6662:	14079763          	bnez	a5,67b0 <manywrites+0x1a4>
      char name[3];
      name[0] = 'b';
    6666:	06200793          	li	a5,98
    666a:	fcf40023          	sb	a5,-64(s0)
      name[1] = 'a' + ci;
    666e:	fec42783          	lw	a5,-20(s0)
    6672:	0ff7f793          	andi	a5,a5,255
    6676:	0617879b          	addiw	a5,a5,97
    667a:	0ff7f793          	andi	a5,a5,255
    667e:	fcf400a3          	sb	a5,-63(s0)
      name[2] = '\0';
    6682:	fc040123          	sb	zero,-62(s0)
      unlink(name);
    6686:	fc040793          	addi	a5,s0,-64
    668a:	853e                	mv	a0,a5
    668c:	00001097          	auipc	ra,0x1
    6690:	24c080e7          	jalr	588(ra) # 78d8 <unlink>

      for(int iters = 0; iters < howmany; iters++){
    6694:	fe042423          	sw	zero,-24(s0)
    6698:	a8c5                	j	6788 <manywrites+0x17c>
        for(int i = 0; i < ci+1; i++){
    669a:	fe042223          	sw	zero,-28(s0)
    669e:	a0c9                	j	6760 <manywrites+0x154>
          int fd = open(name, O_CREATE | O_RDWR);
    66a0:	fc040793          	addi	a5,s0,-64
    66a4:	20200593          	li	a1,514
    66a8:	853e                	mv	a0,a5
    66aa:	00001097          	auipc	ra,0x1
    66ae:	21e080e7          	jalr	542(ra) # 78c8 <open>
    66b2:	87aa                	mv	a5,a0
    66b4:	fcf42823          	sw	a5,-48(s0)
          if(fd < 0){
    66b8:	fd042783          	lw	a5,-48(s0)
    66bc:	2781                	sext.w	a5,a5
    66be:	0207d463          	bgez	a5,66e6 <manywrites+0xda>
            printf("%s: cannot create %s\n", s, name);
    66c2:	fc040793          	addi	a5,s0,-64
    66c6:	863e                	mv	a2,a5
    66c8:	fa843583          	ld	a1,-88(s0)
    66cc:	00004517          	auipc	a0,0x4
    66d0:	d0c50513          	addi	a0,a0,-756 # a3d8 <malloc+0x2430>
    66d4:	00001097          	auipc	ra,0x1
    66d8:	6e2080e7          	jalr	1762(ra) # 7db6 <printf>
            exit(1);
    66dc:	4505                	li	a0,1
    66de:	00001097          	auipc	ra,0x1
    66e2:	1aa080e7          	jalr	426(ra) # 7888 <exit>
          }
          int sz = sizeof(buf);
    66e6:	678d                	lui	a5,0x3
    66e8:	fcf42623          	sw	a5,-52(s0)
          int cc = write(fd, buf, sz);
    66ec:	fcc42703          	lw	a4,-52(s0)
    66f0:	fd042783          	lw	a5,-48(s0)
    66f4:	863a                	mv	a2,a4
    66f6:	00005597          	auipc	a1,0x5
    66fa:	d5a58593          	addi	a1,a1,-678 # b450 <buf>
    66fe:	853e                	mv	a0,a5
    6700:	00001097          	auipc	ra,0x1
    6704:	1a8080e7          	jalr	424(ra) # 78a8 <write>
    6708:	87aa                	mv	a5,a0
    670a:	fcf42423          	sw	a5,-56(s0)
          if(cc != sz){
    670e:	fc842703          	lw	a4,-56(s0)
    6712:	fcc42783          	lw	a5,-52(s0)
    6716:	2701                	sext.w	a4,a4
    6718:	2781                	sext.w	a5,a5
    671a:	02f70763          	beq	a4,a5,6748 <manywrites+0x13c>
            printf("%s: write(%d) ret %d\n", s, sz, cc);
    671e:	fc842703          	lw	a4,-56(s0)
    6722:	fcc42783          	lw	a5,-52(s0)
    6726:	86ba                	mv	a3,a4
    6728:	863e                	mv	a2,a5
    672a:	fa843583          	ld	a1,-88(s0)
    672e:	00003517          	auipc	a0,0x3
    6732:	e0a50513          	addi	a0,a0,-502 # 9538 <malloc+0x1590>
    6736:	00001097          	auipc	ra,0x1
    673a:	680080e7          	jalr	1664(ra) # 7db6 <printf>
            exit(1);
    673e:	4505                	li	a0,1
    6740:	00001097          	auipc	ra,0x1
    6744:	148080e7          	jalr	328(ra) # 7888 <exit>
          }
          close(fd);
    6748:	fd042783          	lw	a5,-48(s0)
    674c:	853e                	mv	a0,a5
    674e:	00001097          	auipc	ra,0x1
    6752:	162080e7          	jalr	354(ra) # 78b0 <close>
        for(int i = 0; i < ci+1; i++){
    6756:	fe442783          	lw	a5,-28(s0)
    675a:	2785                	addiw	a5,a5,1
    675c:	fef42223          	sw	a5,-28(s0)
    6760:	fec42703          	lw	a4,-20(s0)
    6764:	fe442783          	lw	a5,-28(s0)
    6768:	2701                	sext.w	a4,a4
    676a:	2781                	sext.w	a5,a5
    676c:	f2f75ae3          	bge	a4,a5,66a0 <manywrites+0x94>
        }
        unlink(name);
    6770:	fc040793          	addi	a5,s0,-64
    6774:	853e                	mv	a0,a5
    6776:	00001097          	auipc	ra,0x1
    677a:	162080e7          	jalr	354(ra) # 78d8 <unlink>
      for(int iters = 0; iters < howmany; iters++){
    677e:	fe842783          	lw	a5,-24(s0)
    6782:	2785                	addiw	a5,a5,1
    6784:	fef42423          	sw	a5,-24(s0)
    6788:	fe842703          	lw	a4,-24(s0)
    678c:	fd842783          	lw	a5,-40(s0)
    6790:	2701                	sext.w	a4,a4
    6792:	2781                	sext.w	a5,a5
    6794:	f0f743e3          	blt	a4,a5,669a <manywrites+0x8e>
      }

      unlink(name);
    6798:	fc040793          	addi	a5,s0,-64
    679c:	853e                	mv	a0,a5
    679e:	00001097          	auipc	ra,0x1
    67a2:	13a080e7          	jalr	314(ra) # 78d8 <unlink>
      exit(0);
    67a6:	4501                	li	a0,0
    67a8:	00001097          	auipc	ra,0x1
    67ac:	0e0080e7          	jalr	224(ra) # 7888 <exit>
  for(int ci = 0; ci < nchildren; ci++){
    67b0:	fec42783          	lw	a5,-20(s0)
    67b4:	2785                	addiw	a5,a5,1
    67b6:	fef42623          	sw	a5,-20(s0)
    67ba:	fec42703          	lw	a4,-20(s0)
    67be:	fdc42783          	lw	a5,-36(s0)
    67c2:	2701                	sext.w	a4,a4
    67c4:	2781                	sext.w	a5,a5
    67c6:	e6f742e3          	blt	a4,a5,662a <manywrites+0x1e>
    }
  }

  for(int ci = 0; ci < nchildren; ci++){
    67ca:	fe042023          	sw	zero,-32(s0)
    67ce:	a80d                	j	6800 <manywrites+0x1f4>
    int st = 0;
    67d0:	fa042e23          	sw	zero,-68(s0)
    wait(&st);
    67d4:	fbc40793          	addi	a5,s0,-68
    67d8:	853e                	mv	a0,a5
    67da:	00001097          	auipc	ra,0x1
    67de:	0b6080e7          	jalr	182(ra) # 7890 <wait>
    if(st != 0)
    67e2:	fbc42783          	lw	a5,-68(s0)
    67e6:	cb81                	beqz	a5,67f6 <manywrites+0x1ea>
      exit(st);
    67e8:	fbc42783          	lw	a5,-68(s0)
    67ec:	853e                	mv	a0,a5
    67ee:	00001097          	auipc	ra,0x1
    67f2:	09a080e7          	jalr	154(ra) # 7888 <exit>
  for(int ci = 0; ci < nchildren; ci++){
    67f6:	fe042783          	lw	a5,-32(s0)
    67fa:	2785                	addiw	a5,a5,1
    67fc:	fef42023          	sw	a5,-32(s0)
    6800:	fe042703          	lw	a4,-32(s0)
    6804:	fdc42783          	lw	a5,-36(s0)
    6808:	2701                	sext.w	a4,a4
    680a:	2781                	sext.w	a5,a5
    680c:	fcf742e3          	blt	a4,a5,67d0 <manywrites+0x1c4>
  }
  exit(0);
    6810:	4501                	li	a0,0
    6812:	00001097          	auipc	ra,0x1
    6816:	076080e7          	jalr	118(ra) # 7888 <exit>

000000000000681a <badwrite>:
// file is deleted? if the kernel has this bug, it will panic: balloc:
// out of blocks. assumed_free may need to be raised to be more than
// the number of free blocks. this test takes a long time.
void
badwrite(char *s)
{
    681a:	7179                	addi	sp,sp,-48
    681c:	f406                	sd	ra,40(sp)
    681e:	f022                	sd	s0,32(sp)
    6820:	1800                	addi	s0,sp,48
    6822:	fca43c23          	sd	a0,-40(s0)
  int assumed_free = 600;
    6826:	25800793          	li	a5,600
    682a:	fef42423          	sw	a5,-24(s0)

  unlink("junk");
    682e:	00004517          	auipc	a0,0x4
    6832:	bc250513          	addi	a0,a0,-1086 # a3f0 <malloc+0x2448>
    6836:	00001097          	auipc	ra,0x1
    683a:	0a2080e7          	jalr	162(ra) # 78d8 <unlink>
  for(int i = 0; i < assumed_free; i++){
    683e:	fe042623          	sw	zero,-20(s0)
    6842:	a8bd                	j	68c0 <badwrite+0xa6>
    int fd = open("junk", O_CREATE|O_WRONLY);
    6844:	20100593          	li	a1,513
    6848:	00004517          	auipc	a0,0x4
    684c:	ba850513          	addi	a0,a0,-1112 # a3f0 <malloc+0x2448>
    6850:	00001097          	auipc	ra,0x1
    6854:	078080e7          	jalr	120(ra) # 78c8 <open>
    6858:	87aa                	mv	a5,a0
    685a:	fef42023          	sw	a5,-32(s0)
    if(fd < 0){
    685e:	fe042783          	lw	a5,-32(s0)
    6862:	2781                	sext.w	a5,a5
    6864:	0007df63          	bgez	a5,6882 <badwrite+0x68>
      printf("open junk failed\n");
    6868:	00004517          	auipc	a0,0x4
    686c:	b9050513          	addi	a0,a0,-1136 # a3f8 <malloc+0x2450>
    6870:	00001097          	auipc	ra,0x1
    6874:	546080e7          	jalr	1350(ra) # 7db6 <printf>
      exit(1);
    6878:	4505                	li	a0,1
    687a:	00001097          	auipc	ra,0x1
    687e:	00e080e7          	jalr	14(ra) # 7888 <exit>
    }
    write(fd, (char*)0xffffffffffL, 1);
    6882:	fe042703          	lw	a4,-32(s0)
    6886:	4605                	li	a2,1
    6888:	57fd                	li	a5,-1
    688a:	0187d593          	srli	a1,a5,0x18
    688e:	853a                	mv	a0,a4
    6890:	00001097          	auipc	ra,0x1
    6894:	018080e7          	jalr	24(ra) # 78a8 <write>
    close(fd);
    6898:	fe042783          	lw	a5,-32(s0)
    689c:	853e                	mv	a0,a5
    689e:	00001097          	auipc	ra,0x1
    68a2:	012080e7          	jalr	18(ra) # 78b0 <close>
    unlink("junk");
    68a6:	00004517          	auipc	a0,0x4
    68aa:	b4a50513          	addi	a0,a0,-1206 # a3f0 <malloc+0x2448>
    68ae:	00001097          	auipc	ra,0x1
    68b2:	02a080e7          	jalr	42(ra) # 78d8 <unlink>
  for(int i = 0; i < assumed_free; i++){
    68b6:	fec42783          	lw	a5,-20(s0)
    68ba:	2785                	addiw	a5,a5,1
    68bc:	fef42623          	sw	a5,-20(s0)
    68c0:	fec42703          	lw	a4,-20(s0)
    68c4:	fe842783          	lw	a5,-24(s0)
    68c8:	2701                	sext.w	a4,a4
    68ca:	2781                	sext.w	a5,a5
    68cc:	f6f74ce3          	blt	a4,a5,6844 <badwrite+0x2a>
  }

  int fd = open("junk", O_CREATE|O_WRONLY);
    68d0:	20100593          	li	a1,513
    68d4:	00004517          	auipc	a0,0x4
    68d8:	b1c50513          	addi	a0,a0,-1252 # a3f0 <malloc+0x2448>
    68dc:	00001097          	auipc	ra,0x1
    68e0:	fec080e7          	jalr	-20(ra) # 78c8 <open>
    68e4:	87aa                	mv	a5,a0
    68e6:	fef42223          	sw	a5,-28(s0)
  if(fd < 0){
    68ea:	fe442783          	lw	a5,-28(s0)
    68ee:	2781                	sext.w	a5,a5
    68f0:	0007df63          	bgez	a5,690e <badwrite+0xf4>
    printf("open junk failed\n");
    68f4:	00004517          	auipc	a0,0x4
    68f8:	b0450513          	addi	a0,a0,-1276 # a3f8 <malloc+0x2450>
    68fc:	00001097          	auipc	ra,0x1
    6900:	4ba080e7          	jalr	1210(ra) # 7db6 <printf>
    exit(1);
    6904:	4505                	li	a0,1
    6906:	00001097          	auipc	ra,0x1
    690a:	f82080e7          	jalr	-126(ra) # 7888 <exit>
  }
  if(write(fd, "x", 1) != 1){
    690e:	fe442783          	lw	a5,-28(s0)
    6912:	4605                	li	a2,1
    6914:	00002597          	auipc	a1,0x2
    6918:	90c58593          	addi	a1,a1,-1780 # 8220 <malloc+0x278>
    691c:	853e                	mv	a0,a5
    691e:	00001097          	auipc	ra,0x1
    6922:	f8a080e7          	jalr	-118(ra) # 78a8 <write>
    6926:	87aa                	mv	a5,a0
    6928:	873e                	mv	a4,a5
    692a:	4785                	li	a5,1
    692c:	00f70f63          	beq	a4,a5,694a <badwrite+0x130>
    printf("write failed\n");
    6930:	00004517          	auipc	a0,0x4
    6934:	ae050513          	addi	a0,a0,-1312 # a410 <malloc+0x2468>
    6938:	00001097          	auipc	ra,0x1
    693c:	47e080e7          	jalr	1150(ra) # 7db6 <printf>
    exit(1);
    6940:	4505                	li	a0,1
    6942:	00001097          	auipc	ra,0x1
    6946:	f46080e7          	jalr	-186(ra) # 7888 <exit>
  }
  close(fd);
    694a:	fe442783          	lw	a5,-28(s0)
    694e:	853e                	mv	a0,a5
    6950:	00001097          	auipc	ra,0x1
    6954:	f60080e7          	jalr	-160(ra) # 78b0 <close>
  unlink("junk");
    6958:	00004517          	auipc	a0,0x4
    695c:	a9850513          	addi	a0,a0,-1384 # a3f0 <malloc+0x2448>
    6960:	00001097          	auipc	ra,0x1
    6964:	f78080e7          	jalr	-136(ra) # 78d8 <unlink>

  exit(0);
    6968:	4501                	li	a0,0
    696a:	00001097          	auipc	ra,0x1
    696e:	f1e080e7          	jalr	-226(ra) # 7888 <exit>

0000000000006972 <execout>:
// test the exec() code that cleans up if it runs out
// of memory. it's really a test that such a condition
// doesn't cause a panic.
void
execout(char *s)
{
    6972:	715d                	addi	sp,sp,-80
    6974:	e486                	sd	ra,72(sp)
    6976:	e0a2                	sd	s0,64(sp)
    6978:	0880                	addi	s0,sp,80
    697a:	faa43c23          	sd	a0,-72(s0)
  for(int avail = 0; avail < 15; avail++){
    697e:	fe042623          	sw	zero,-20(s0)
    6982:	a8c5                	j	6a72 <execout+0x100>
    int pid = fork();
    6984:	00001097          	auipc	ra,0x1
    6988:	efc080e7          	jalr	-260(ra) # 7880 <fork>
    698c:	87aa                	mv	a5,a0
    698e:	fef42223          	sw	a5,-28(s0)
    if(pid < 0){
    6992:	fe442783          	lw	a5,-28(s0)
    6996:	2781                	sext.w	a5,a5
    6998:	0007df63          	bgez	a5,69b6 <execout+0x44>
      printf("fork failed\n");
    699c:	00002517          	auipc	a0,0x2
    69a0:	98450513          	addi	a0,a0,-1660 # 8320 <malloc+0x378>
    69a4:	00001097          	auipc	ra,0x1
    69a8:	412080e7          	jalr	1042(ra) # 7db6 <printf>
      exit(1);
    69ac:	4505                	li	a0,1
    69ae:	00001097          	auipc	ra,0x1
    69b2:	eda080e7          	jalr	-294(ra) # 7888 <exit>
    } else if(pid == 0){
    69b6:	fe442783          	lw	a5,-28(s0)
    69ba:	2781                	sext.w	a5,a5
    69bc:	e3cd                	bnez	a5,6a5e <execout+0xec>
      // allocate all of memory.
      while(1){
        uint64 a = (uint64) sbrk(4096);
    69be:	6505                	lui	a0,0x1
    69c0:	00001097          	auipc	ra,0x1
    69c4:	f50080e7          	jalr	-176(ra) # 7910 <sbrk>
    69c8:	87aa                	mv	a5,a0
    69ca:	fcf43c23          	sd	a5,-40(s0)
        if(a == 0xffffffffffffffffLL)
    69ce:	fd843703          	ld	a4,-40(s0)
    69d2:	57fd                	li	a5,-1
    69d4:	00f70c63          	beq	a4,a5,69ec <execout+0x7a>
          break;
        *(char*)(a + 4096 - 1) = 1;
    69d8:	fd843703          	ld	a4,-40(s0)
    69dc:	6785                	lui	a5,0x1
    69de:	17fd                	addi	a5,a5,-1
    69e0:	97ba                	add	a5,a5,a4
    69e2:	873e                	mv	a4,a5
    69e4:	4785                	li	a5,1
    69e6:	00f70023          	sb	a5,0(a4) # 1000 <truncate3+0x1aa>
      while(1){
    69ea:	bfd1                	j	69be <execout+0x4c>
          break;
    69ec:	0001                	nop
      }

      // free a few pages, in order to let exec() make some
      // progress.
      for(int i = 0; i < avail; i++)
    69ee:	fe042423          	sw	zero,-24(s0)
    69f2:	a819                	j	6a08 <execout+0x96>
        sbrk(-4096);
    69f4:	757d                	lui	a0,0xfffff
    69f6:	00001097          	auipc	ra,0x1
    69fa:	f1a080e7          	jalr	-230(ra) # 7910 <sbrk>
      for(int i = 0; i < avail; i++)
    69fe:	fe842783          	lw	a5,-24(s0)
    6a02:	2785                	addiw	a5,a5,1
    6a04:	fef42423          	sw	a5,-24(s0)
    6a08:	fe842703          	lw	a4,-24(s0)
    6a0c:	fec42783          	lw	a5,-20(s0)
    6a10:	2701                	sext.w	a4,a4
    6a12:	2781                	sext.w	a5,a5
    6a14:	fef740e3          	blt	a4,a5,69f4 <execout+0x82>

      close(1);
    6a18:	4505                	li	a0,1
    6a1a:	00001097          	auipc	ra,0x1
    6a1e:	e96080e7          	jalr	-362(ra) # 78b0 <close>
      char *args[] = { "echo", "x", 0 };
    6a22:	00002797          	auipc	a5,0x2
    6a26:	90e78793          	addi	a5,a5,-1778 # 8330 <malloc+0x388>
    6a2a:	fcf43023          	sd	a5,-64(s0)
    6a2e:	00001797          	auipc	a5,0x1
    6a32:	7f278793          	addi	a5,a5,2034 # 8220 <malloc+0x278>
    6a36:	fcf43423          	sd	a5,-56(s0)
    6a3a:	fc043823          	sd	zero,-48(s0)
      exec("echo", args);
    6a3e:	fc040793          	addi	a5,s0,-64
    6a42:	85be                	mv	a1,a5
    6a44:	00002517          	auipc	a0,0x2
    6a48:	8ec50513          	addi	a0,a0,-1812 # 8330 <malloc+0x388>
    6a4c:	00001097          	auipc	ra,0x1
    6a50:	e74080e7          	jalr	-396(ra) # 78c0 <exec>
      exit(0);
    6a54:	4501                	li	a0,0
    6a56:	00001097          	auipc	ra,0x1
    6a5a:	e32080e7          	jalr	-462(ra) # 7888 <exit>
    } else {
      wait((int*)0);
    6a5e:	4501                	li	a0,0
    6a60:	00001097          	auipc	ra,0x1
    6a64:	e30080e7          	jalr	-464(ra) # 7890 <wait>
  for(int avail = 0; avail < 15; avail++){
    6a68:	fec42783          	lw	a5,-20(s0)
    6a6c:	2785                	addiw	a5,a5,1
    6a6e:	fef42623          	sw	a5,-20(s0)
    6a72:	fec42783          	lw	a5,-20(s0)
    6a76:	0007871b          	sext.w	a4,a5
    6a7a:	47b9                	li	a5,14
    6a7c:	f0e7d4e3          	bge	a5,a4,6984 <execout+0x12>
    }
  }

  exit(0);
    6a80:	4501                	li	a0,0
    6a82:	00001097          	auipc	ra,0x1
    6a86:	e06080e7          	jalr	-506(ra) # 7888 <exit>

0000000000006a8a <diskfull>:
}

// can the kernel tolerate running out of disk space?
void
diskfull(char *s)
{
    6a8a:	b9010113          	addi	sp,sp,-1136
    6a8e:	46113423          	sd	ra,1128(sp)
    6a92:	46813023          	sd	s0,1120(sp)
    6a96:	47010413          	addi	s0,sp,1136
    6a9a:	b8a43c23          	sd	a0,-1128(s0)
  int fi;
  int done = 0;
    6a9e:	fe042423          	sw	zero,-24(s0)

  unlink("diskfulldir");
    6aa2:	00004517          	auipc	a0,0x4
    6aa6:	97e50513          	addi	a0,a0,-1666 # a420 <malloc+0x2478>
    6aaa:	00001097          	auipc	ra,0x1
    6aae:	e2e080e7          	jalr	-466(ra) # 78d8 <unlink>

  for(fi = 0; done == 0; fi++){
    6ab2:	fe042623          	sw	zero,-20(s0)
    6ab6:	a8d5                	j	6baa <diskfull+0x120>
    char name[32];
    name[0] = 'b';
    6ab8:	06200793          	li	a5,98
    6abc:	baf40423          	sb	a5,-1112(s0)
    name[1] = 'i';
    6ac0:	06900793          	li	a5,105
    6ac4:	baf404a3          	sb	a5,-1111(s0)
    name[2] = 'g';
    6ac8:	06700793          	li	a5,103
    6acc:	baf40523          	sb	a5,-1110(s0)
    name[3] = '0' + fi;
    6ad0:	fec42783          	lw	a5,-20(s0)
    6ad4:	0ff7f793          	andi	a5,a5,255
    6ad8:	0307879b          	addiw	a5,a5,48
    6adc:	0ff7f793          	andi	a5,a5,255
    6ae0:	baf405a3          	sb	a5,-1109(s0)
    name[4] = '\0';
    6ae4:	ba040623          	sb	zero,-1108(s0)
    unlink(name);
    6ae8:	ba840793          	addi	a5,s0,-1112
    6aec:	853e                	mv	a0,a5
    6aee:	00001097          	auipc	ra,0x1
    6af2:	dea080e7          	jalr	-534(ra) # 78d8 <unlink>
    int fd = open(name, O_CREATE|O_RDWR|O_TRUNC);
    6af6:	ba840793          	addi	a5,s0,-1112
    6afa:	60200593          	li	a1,1538
    6afe:	853e                	mv	a0,a5
    6b00:	00001097          	auipc	ra,0x1
    6b04:	dc8080e7          	jalr	-568(ra) # 78c8 <open>
    6b08:	87aa                	mv	a5,a0
    6b0a:	fcf42a23          	sw	a5,-44(s0)
    if(fd < 0){
    6b0e:	fd442783          	lw	a5,-44(s0)
    6b12:	2781                	sext.w	a5,a5
    6b14:	0207d363          	bgez	a5,6b3a <diskfull+0xb0>
      // oops, ran out of inodes before running out of blocks.
      printf("%s: could not create file %s\n", s, name);
    6b18:	ba840793          	addi	a5,s0,-1112
    6b1c:	863e                	mv	a2,a5
    6b1e:	b9843583          	ld	a1,-1128(s0)
    6b22:	00004517          	auipc	a0,0x4
    6b26:	90e50513          	addi	a0,a0,-1778 # a430 <malloc+0x2488>
    6b2a:	00001097          	auipc	ra,0x1
    6b2e:	28c080e7          	jalr	652(ra) # 7db6 <printf>
      done = 1;
    6b32:	4785                	li	a5,1
    6b34:	fef42423          	sw	a5,-24(s0)
    6b38:	a8ad                	j	6bb2 <diskfull+0x128>
      break;
    }
    for(int i = 0; i < MAXFILE; i++){
    6b3a:	fe042223          	sw	zero,-28(s0)
    6b3e:	a099                	j	6b84 <diskfull+0xfa>
      char buf[BSIZE];
      if(write(fd, buf, BSIZE) != BSIZE){
    6b40:	bc840713          	addi	a4,s0,-1080
    6b44:	fd442783          	lw	a5,-44(s0)
    6b48:	40000613          	li	a2,1024
    6b4c:	85ba                	mv	a1,a4
    6b4e:	853e                	mv	a0,a5
    6b50:	00001097          	auipc	ra,0x1
    6b54:	d58080e7          	jalr	-680(ra) # 78a8 <write>
    6b58:	87aa                	mv	a5,a0
    6b5a:	873e                	mv	a4,a5
    6b5c:	40000793          	li	a5,1024
    6b60:	00f70d63          	beq	a4,a5,6b7a <diskfull+0xf0>
        done = 1;
    6b64:	4785                	li	a5,1
    6b66:	fef42423          	sw	a5,-24(s0)
        close(fd);
    6b6a:	fd442783          	lw	a5,-44(s0)
    6b6e:	853e                	mv	a0,a5
    6b70:	00001097          	auipc	ra,0x1
    6b74:	d40080e7          	jalr	-704(ra) # 78b0 <close>
    6b78:	a829                	j	6b92 <diskfull+0x108>
    for(int i = 0; i < MAXFILE; i++){
    6b7a:	fe442783          	lw	a5,-28(s0)
    6b7e:	2785                	addiw	a5,a5,1
    6b80:	fef42223          	sw	a5,-28(s0)
    6b84:	fe442783          	lw	a5,-28(s0)
    6b88:	873e                	mv	a4,a5
    6b8a:	10b00793          	li	a5,267
    6b8e:	fae7f9e3          	bgeu	a5,a4,6b40 <diskfull+0xb6>
        break;
      }
    }
    close(fd);
    6b92:	fd442783          	lw	a5,-44(s0)
    6b96:	853e                	mv	a0,a5
    6b98:	00001097          	auipc	ra,0x1
    6b9c:	d18080e7          	jalr	-744(ra) # 78b0 <close>
  for(fi = 0; done == 0; fi++){
    6ba0:	fec42783          	lw	a5,-20(s0)
    6ba4:	2785                	addiw	a5,a5,1
    6ba6:	fef42623          	sw	a5,-20(s0)
    6baa:	fe842783          	lw	a5,-24(s0)
    6bae:	2781                	sext.w	a5,a5
    6bb0:	d781                	beqz	a5,6ab8 <diskfull+0x2e>

  // now that there are no free blocks, test that dirlink()
  // merely fails (doesn't panic) if it can't extend
  // directory content. one of these file creations
  // is expected to fail.
  int nzz = 128;
    6bb2:	08000793          	li	a5,128
    6bb6:	fcf42823          	sw	a5,-48(s0)
  for(int i = 0; i < nzz; i++){
    6bba:	fe042023          	sw	zero,-32(s0)
    6bbe:	a065                	j	6c66 <diskfull+0x1dc>
    char name[32];
    name[0] = 'z';
    6bc0:	07a00793          	li	a5,122
    6bc4:	bcf40423          	sb	a5,-1080(s0)
    name[1] = 'z';
    6bc8:	07a00793          	li	a5,122
    6bcc:	bcf404a3          	sb	a5,-1079(s0)
    name[2] = '0' + (i / 32);
    6bd0:	fe042783          	lw	a5,-32(s0)
    6bd4:	41f7d71b          	sraiw	a4,a5,0x1f
    6bd8:	01b7571b          	srliw	a4,a4,0x1b
    6bdc:	9fb9                	addw	a5,a5,a4
    6bde:	4057d79b          	sraiw	a5,a5,0x5
    6be2:	2781                	sext.w	a5,a5
    6be4:	0ff7f793          	andi	a5,a5,255
    6be8:	0307879b          	addiw	a5,a5,48
    6bec:	0ff7f793          	andi	a5,a5,255
    6bf0:	bcf40523          	sb	a5,-1078(s0)
    name[3] = '0' + (i % 32);
    6bf4:	fe042703          	lw	a4,-32(s0)
    6bf8:	41f7579b          	sraiw	a5,a4,0x1f
    6bfc:	01b7d79b          	srliw	a5,a5,0x1b
    6c00:	9f3d                	addw	a4,a4,a5
    6c02:	8b7d                	andi	a4,a4,31
    6c04:	40f707bb          	subw	a5,a4,a5
    6c08:	2781                	sext.w	a5,a5
    6c0a:	0ff7f793          	andi	a5,a5,255
    6c0e:	0307879b          	addiw	a5,a5,48
    6c12:	0ff7f793          	andi	a5,a5,255
    6c16:	bcf405a3          	sb	a5,-1077(s0)
    name[4] = '\0';
    6c1a:	bc040623          	sb	zero,-1076(s0)
    unlink(name);
    6c1e:	bc840793          	addi	a5,s0,-1080
    6c22:	853e                	mv	a0,a5
    6c24:	00001097          	auipc	ra,0x1
    6c28:	cb4080e7          	jalr	-844(ra) # 78d8 <unlink>
    int fd = open(name, O_CREATE|O_RDWR|O_TRUNC);
    6c2c:	bc840793          	addi	a5,s0,-1080
    6c30:	60200593          	li	a1,1538
    6c34:	853e                	mv	a0,a5
    6c36:	00001097          	auipc	ra,0x1
    6c3a:	c92080e7          	jalr	-878(ra) # 78c8 <open>
    6c3e:	87aa                	mv	a5,a0
    6c40:	fcf42623          	sw	a5,-52(s0)
    if(fd < 0)
    6c44:	fcc42783          	lw	a5,-52(s0)
    6c48:	2781                	sext.w	a5,a5
    6c4a:	0207c763          	bltz	a5,6c78 <diskfull+0x1ee>
      break;
    close(fd);
    6c4e:	fcc42783          	lw	a5,-52(s0)
    6c52:	853e                	mv	a0,a5
    6c54:	00001097          	auipc	ra,0x1
    6c58:	c5c080e7          	jalr	-932(ra) # 78b0 <close>
  for(int i = 0; i < nzz; i++){
    6c5c:	fe042783          	lw	a5,-32(s0)
    6c60:	2785                	addiw	a5,a5,1
    6c62:	fef42023          	sw	a5,-32(s0)
    6c66:	fe042703          	lw	a4,-32(s0)
    6c6a:	fd042783          	lw	a5,-48(s0)
    6c6e:	2701                	sext.w	a4,a4
    6c70:	2781                	sext.w	a5,a5
    6c72:	f4f747e3          	blt	a4,a5,6bc0 <diskfull+0x136>
    6c76:	a011                	j	6c7a <diskfull+0x1f0>
      break;
    6c78:	0001                	nop
  }

  // this mkdir() is expected to fail.
  if(mkdir("diskfulldir") == 0)
    6c7a:	00003517          	auipc	a0,0x3
    6c7e:	7a650513          	addi	a0,a0,1958 # a420 <malloc+0x2478>
    6c82:	00001097          	auipc	ra,0x1
    6c86:	c6e080e7          	jalr	-914(ra) # 78f0 <mkdir>
    6c8a:	87aa                	mv	a5,a0
    6c8c:	eb89                	bnez	a5,6c9e <diskfull+0x214>
    printf("%s: mkdir(diskfulldir) unexpectedly succeeded!\n");
    6c8e:	00003517          	auipc	a0,0x3
    6c92:	7c250513          	addi	a0,a0,1986 # a450 <malloc+0x24a8>
    6c96:	00001097          	auipc	ra,0x1
    6c9a:	120080e7          	jalr	288(ra) # 7db6 <printf>

  unlink("diskfulldir");
    6c9e:	00003517          	auipc	a0,0x3
    6ca2:	78250513          	addi	a0,a0,1922 # a420 <malloc+0x2478>
    6ca6:	00001097          	auipc	ra,0x1
    6caa:	c32080e7          	jalr	-974(ra) # 78d8 <unlink>

  for(int i = 0; i < nzz; i++){
    6cae:	fc042e23          	sw	zero,-36(s0)
    6cb2:	a8a5                	j	6d2a <diskfull+0x2a0>
    char name[32];
    name[0] = 'z';
    6cb4:	07a00793          	li	a5,122
    6cb8:	bcf40423          	sb	a5,-1080(s0)
    name[1] = 'z';
    6cbc:	07a00793          	li	a5,122
    6cc0:	bcf404a3          	sb	a5,-1079(s0)
    name[2] = '0' + (i / 32);
    6cc4:	fdc42783          	lw	a5,-36(s0)
    6cc8:	41f7d71b          	sraiw	a4,a5,0x1f
    6ccc:	01b7571b          	srliw	a4,a4,0x1b
    6cd0:	9fb9                	addw	a5,a5,a4
    6cd2:	4057d79b          	sraiw	a5,a5,0x5
    6cd6:	2781                	sext.w	a5,a5
    6cd8:	0ff7f793          	andi	a5,a5,255
    6cdc:	0307879b          	addiw	a5,a5,48
    6ce0:	0ff7f793          	andi	a5,a5,255
    6ce4:	bcf40523          	sb	a5,-1078(s0)
    name[3] = '0' + (i % 32);
    6ce8:	fdc42703          	lw	a4,-36(s0)
    6cec:	41f7579b          	sraiw	a5,a4,0x1f
    6cf0:	01b7d79b          	srliw	a5,a5,0x1b
    6cf4:	9f3d                	addw	a4,a4,a5
    6cf6:	8b7d                	andi	a4,a4,31
    6cf8:	40f707bb          	subw	a5,a4,a5
    6cfc:	2781                	sext.w	a5,a5
    6cfe:	0ff7f793          	andi	a5,a5,255
    6d02:	0307879b          	addiw	a5,a5,48
    6d06:	0ff7f793          	andi	a5,a5,255
    6d0a:	bcf405a3          	sb	a5,-1077(s0)
    name[4] = '\0';
    6d0e:	bc040623          	sb	zero,-1076(s0)
    unlink(name);
    6d12:	bc840793          	addi	a5,s0,-1080
    6d16:	853e                	mv	a0,a5
    6d18:	00001097          	auipc	ra,0x1
    6d1c:	bc0080e7          	jalr	-1088(ra) # 78d8 <unlink>
  for(int i = 0; i < nzz; i++){
    6d20:	fdc42783          	lw	a5,-36(s0)
    6d24:	2785                	addiw	a5,a5,1
    6d26:	fcf42e23          	sw	a5,-36(s0)
    6d2a:	fdc42703          	lw	a4,-36(s0)
    6d2e:	fd042783          	lw	a5,-48(s0)
    6d32:	2701                	sext.w	a4,a4
    6d34:	2781                	sext.w	a5,a5
    6d36:	f6f74fe3          	blt	a4,a5,6cb4 <diskfull+0x22a>
  }

  for(int i = 0; i < fi; i++){
    6d3a:	fc042c23          	sw	zero,-40(s0)
    6d3e:	a0a9                	j	6d88 <diskfull+0x2fe>
    char name[32];
    name[0] = 'b';
    6d40:	06200793          	li	a5,98
    6d44:	bcf40423          	sb	a5,-1080(s0)
    name[1] = 'i';
    6d48:	06900793          	li	a5,105
    6d4c:	bcf404a3          	sb	a5,-1079(s0)
    name[2] = 'g';
    6d50:	06700793          	li	a5,103
    6d54:	bcf40523          	sb	a5,-1078(s0)
    name[3] = '0' + i;
    6d58:	fd842783          	lw	a5,-40(s0)
    6d5c:	0ff7f793          	andi	a5,a5,255
    6d60:	0307879b          	addiw	a5,a5,48
    6d64:	0ff7f793          	andi	a5,a5,255
    6d68:	bcf405a3          	sb	a5,-1077(s0)
    name[4] = '\0';
    6d6c:	bc040623          	sb	zero,-1076(s0)
    unlink(name);
    6d70:	bc840793          	addi	a5,s0,-1080
    6d74:	853e                	mv	a0,a5
    6d76:	00001097          	auipc	ra,0x1
    6d7a:	b62080e7          	jalr	-1182(ra) # 78d8 <unlink>
  for(int i = 0; i < fi; i++){
    6d7e:	fd842783          	lw	a5,-40(s0)
    6d82:	2785                	addiw	a5,a5,1
    6d84:	fcf42c23          	sw	a5,-40(s0)
    6d88:	fd842703          	lw	a4,-40(s0)
    6d8c:	fec42783          	lw	a5,-20(s0)
    6d90:	2701                	sext.w	a4,a4
    6d92:	2781                	sext.w	a5,a5
    6d94:	faf746e3          	blt	a4,a5,6d40 <diskfull+0x2b6>
  }
}
    6d98:	0001                	nop
    6d9a:	0001                	nop
    6d9c:	46813083          	ld	ra,1128(sp)
    6da0:	46013403          	ld	s0,1120(sp)
    6da4:	47010113          	addi	sp,sp,1136
    6da8:	8082                	ret

0000000000006daa <outofinodes>:

void
outofinodes(char *s)
{
    6daa:	715d                	addi	sp,sp,-80
    6dac:	e486                	sd	ra,72(sp)
    6dae:	e0a2                	sd	s0,64(sp)
    6db0:	0880                	addi	s0,sp,80
    6db2:	faa43c23          	sd	a0,-72(s0)
  int nzz = 32*32;
    6db6:	40000793          	li	a5,1024
    6dba:	fef42223          	sw	a5,-28(s0)
  for(int i = 0; i < nzz; i++){
    6dbe:	fe042623          	sw	zero,-20(s0)
    6dc2:	a065                	j	6e6a <outofinodes+0xc0>
    char name[32];
    name[0] = 'z';
    6dc4:	07a00793          	li	a5,122
    6dc8:	fcf40023          	sb	a5,-64(s0)
    name[1] = 'z';
    6dcc:	07a00793          	li	a5,122
    6dd0:	fcf400a3          	sb	a5,-63(s0)
    name[2] = '0' + (i / 32);
    6dd4:	fec42783          	lw	a5,-20(s0)
    6dd8:	41f7d71b          	sraiw	a4,a5,0x1f
    6ddc:	01b7571b          	srliw	a4,a4,0x1b
    6de0:	9fb9                	addw	a5,a5,a4
    6de2:	4057d79b          	sraiw	a5,a5,0x5
    6de6:	2781                	sext.w	a5,a5
    6de8:	0ff7f793          	andi	a5,a5,255
    6dec:	0307879b          	addiw	a5,a5,48
    6df0:	0ff7f793          	andi	a5,a5,255
    6df4:	fcf40123          	sb	a5,-62(s0)
    name[3] = '0' + (i % 32);
    6df8:	fec42703          	lw	a4,-20(s0)
    6dfc:	41f7579b          	sraiw	a5,a4,0x1f
    6e00:	01b7d79b          	srliw	a5,a5,0x1b
    6e04:	9f3d                	addw	a4,a4,a5
    6e06:	8b7d                	andi	a4,a4,31
    6e08:	40f707bb          	subw	a5,a4,a5
    6e0c:	2781                	sext.w	a5,a5
    6e0e:	0ff7f793          	andi	a5,a5,255
    6e12:	0307879b          	addiw	a5,a5,48
    6e16:	0ff7f793          	andi	a5,a5,255
    6e1a:	fcf401a3          	sb	a5,-61(s0)
    name[4] = '\0';
    6e1e:	fc040223          	sb	zero,-60(s0)
    unlink(name);
    6e22:	fc040793          	addi	a5,s0,-64
    6e26:	853e                	mv	a0,a5
    6e28:	00001097          	auipc	ra,0x1
    6e2c:	ab0080e7          	jalr	-1360(ra) # 78d8 <unlink>
    int fd = open(name, O_CREATE|O_RDWR|O_TRUNC);
    6e30:	fc040793          	addi	a5,s0,-64
    6e34:	60200593          	li	a1,1538
    6e38:	853e                	mv	a0,a5
    6e3a:	00001097          	auipc	ra,0x1
    6e3e:	a8e080e7          	jalr	-1394(ra) # 78c8 <open>
    6e42:	87aa                	mv	a5,a0
    6e44:	fef42023          	sw	a5,-32(s0)
    if(fd < 0){
    6e48:	fe042783          	lw	a5,-32(s0)
    6e4c:	2781                	sext.w	a5,a5
    6e4e:	0207c763          	bltz	a5,6e7c <outofinodes+0xd2>
      // failure is eventually expected.
      break;
    }
    close(fd);
    6e52:	fe042783          	lw	a5,-32(s0)
    6e56:	853e                	mv	a0,a5
    6e58:	00001097          	auipc	ra,0x1
    6e5c:	a58080e7          	jalr	-1448(ra) # 78b0 <close>
  for(int i = 0; i < nzz; i++){
    6e60:	fec42783          	lw	a5,-20(s0)
    6e64:	2785                	addiw	a5,a5,1
    6e66:	fef42623          	sw	a5,-20(s0)
    6e6a:	fec42703          	lw	a4,-20(s0)
    6e6e:	fe442783          	lw	a5,-28(s0)
    6e72:	2701                	sext.w	a4,a4
    6e74:	2781                	sext.w	a5,a5
    6e76:	f4f747e3          	blt	a4,a5,6dc4 <outofinodes+0x1a>
    6e7a:	a011                	j	6e7e <outofinodes+0xd4>
      break;
    6e7c:	0001                	nop
  }

  for(int i = 0; i < nzz; i++){
    6e7e:	fe042423          	sw	zero,-24(s0)
    6e82:	a8a5                	j	6efa <outofinodes+0x150>
    char name[32];
    name[0] = 'z';
    6e84:	07a00793          	li	a5,122
    6e88:	fcf40023          	sb	a5,-64(s0)
    name[1] = 'z';
    6e8c:	07a00793          	li	a5,122
    6e90:	fcf400a3          	sb	a5,-63(s0)
    name[2] = '0' + (i / 32);
    6e94:	fe842783          	lw	a5,-24(s0)
    6e98:	41f7d71b          	sraiw	a4,a5,0x1f
    6e9c:	01b7571b          	srliw	a4,a4,0x1b
    6ea0:	9fb9                	addw	a5,a5,a4
    6ea2:	4057d79b          	sraiw	a5,a5,0x5
    6ea6:	2781                	sext.w	a5,a5
    6ea8:	0ff7f793          	andi	a5,a5,255
    6eac:	0307879b          	addiw	a5,a5,48
    6eb0:	0ff7f793          	andi	a5,a5,255
    6eb4:	fcf40123          	sb	a5,-62(s0)
    name[3] = '0' + (i % 32);
    6eb8:	fe842703          	lw	a4,-24(s0)
    6ebc:	41f7579b          	sraiw	a5,a4,0x1f
    6ec0:	01b7d79b          	srliw	a5,a5,0x1b
    6ec4:	9f3d                	addw	a4,a4,a5
    6ec6:	8b7d                	andi	a4,a4,31
    6ec8:	40f707bb          	subw	a5,a4,a5
    6ecc:	2781                	sext.w	a5,a5
    6ece:	0ff7f793          	andi	a5,a5,255
    6ed2:	0307879b          	addiw	a5,a5,48
    6ed6:	0ff7f793          	andi	a5,a5,255
    6eda:	fcf401a3          	sb	a5,-61(s0)
    name[4] = '\0';
    6ede:	fc040223          	sb	zero,-60(s0)
    unlink(name);
    6ee2:	fc040793          	addi	a5,s0,-64
    6ee6:	853e                	mv	a0,a5
    6ee8:	00001097          	auipc	ra,0x1
    6eec:	9f0080e7          	jalr	-1552(ra) # 78d8 <unlink>
  for(int i = 0; i < nzz; i++){
    6ef0:	fe842783          	lw	a5,-24(s0)
    6ef4:	2785                	addiw	a5,a5,1
    6ef6:	fef42423          	sw	a5,-24(s0)
    6efa:	fe842703          	lw	a4,-24(s0)
    6efe:	fe442783          	lw	a5,-28(s0)
    6f02:	2701                	sext.w	a4,a4
    6f04:	2781                	sext.w	a5,a5
    6f06:	f6f74fe3          	blt	a4,a5,6e84 <outofinodes+0xda>
  }
}
    6f0a:	0001                	nop
    6f0c:	0001                	nop
    6f0e:	60a6                	ld	ra,72(sp)
    6f10:	6406                	ld	s0,64(sp)
    6f12:	6161                	addi	sp,sp,80
    6f14:	8082                	ret

0000000000006f16 <run>:
//

// run each test in its own process. run returns 1 if child's exit()
// indicates success.
int
run(void f(char *), char *s) {
    6f16:	7179                	addi	sp,sp,-48
    6f18:	f406                	sd	ra,40(sp)
    6f1a:	f022                	sd	s0,32(sp)
    6f1c:	1800                	addi	s0,sp,48
    6f1e:	fca43c23          	sd	a0,-40(s0)
    6f22:	fcb43823          	sd	a1,-48(s0)
  int pid;
  int xstatus;

  printf("test %s: ", s);
    6f26:	fd043583          	ld	a1,-48(s0)
    6f2a:	00003517          	auipc	a0,0x3
    6f2e:	5a650513          	addi	a0,a0,1446 # a4d0 <malloc+0x2528>
    6f32:	00001097          	auipc	ra,0x1
    6f36:	e84080e7          	jalr	-380(ra) # 7db6 <printf>
  if((pid = fork()) < 0) {
    6f3a:	00001097          	auipc	ra,0x1
    6f3e:	946080e7          	jalr	-1722(ra) # 7880 <fork>
    6f42:	87aa                	mv	a5,a0
    6f44:	fef42623          	sw	a5,-20(s0)
    6f48:	fec42783          	lw	a5,-20(s0)
    6f4c:	2781                	sext.w	a5,a5
    6f4e:	0007df63          	bgez	a5,6f6c <run+0x56>
    printf("runtest: fork error\n");
    6f52:	00003517          	auipc	a0,0x3
    6f56:	58e50513          	addi	a0,a0,1422 # a4e0 <malloc+0x2538>
    6f5a:	00001097          	auipc	ra,0x1
    6f5e:	e5c080e7          	jalr	-420(ra) # 7db6 <printf>
    exit(1);
    6f62:	4505                	li	a0,1
    6f64:	00001097          	auipc	ra,0x1
    6f68:	924080e7          	jalr	-1756(ra) # 7888 <exit>
  }
  if(pid == 0) {
    6f6c:	fec42783          	lw	a5,-20(s0)
    6f70:	2781                	sext.w	a5,a5
    6f72:	eb99                	bnez	a5,6f88 <run+0x72>
    f(s);
    6f74:	fd843783          	ld	a5,-40(s0)
    6f78:	fd043503          	ld	a0,-48(s0)
    6f7c:	9782                	jalr	a5
    exit(0);
    6f7e:	4501                	li	a0,0
    6f80:	00001097          	auipc	ra,0x1
    6f84:	908080e7          	jalr	-1784(ra) # 7888 <exit>
  } else {
    wait(&xstatus);
    6f88:	fe840793          	addi	a5,s0,-24
    6f8c:	853e                	mv	a0,a5
    6f8e:	00001097          	auipc	ra,0x1
    6f92:	902080e7          	jalr	-1790(ra) # 7890 <wait>
    if(xstatus != 0)
    6f96:	fe842783          	lw	a5,-24(s0)
    6f9a:	cb91                	beqz	a5,6fae <run+0x98>
      printf("FAILED\n");
    6f9c:	00003517          	auipc	a0,0x3
    6fa0:	55c50513          	addi	a0,a0,1372 # a4f8 <malloc+0x2550>
    6fa4:	00001097          	auipc	ra,0x1
    6fa8:	e12080e7          	jalr	-494(ra) # 7db6 <printf>
    6fac:	a809                	j	6fbe <run+0xa8>
    else
      printf("OK\n");
    6fae:	00003517          	auipc	a0,0x3
    6fb2:	55250513          	addi	a0,a0,1362 # a500 <malloc+0x2558>
    6fb6:	00001097          	auipc	ra,0x1
    6fba:	e00080e7          	jalr	-512(ra) # 7db6 <printf>
    return xstatus == 0;
    6fbe:	fe842783          	lw	a5,-24(s0)
    6fc2:	0017b793          	seqz	a5,a5
    6fc6:	0ff7f793          	andi	a5,a5,255
    6fca:	2781                	sext.w	a5,a5
  }
}
    6fcc:	853e                	mv	a0,a5
    6fce:	70a2                	ld	ra,40(sp)
    6fd0:	7402                	ld	s0,32(sp)
    6fd2:	6145                	addi	sp,sp,48
    6fd4:	8082                	ret

0000000000006fd6 <runtests>:

int
runtests(struct test *tests, char *justone) {
    6fd6:	7179                	addi	sp,sp,-48
    6fd8:	f406                	sd	ra,40(sp)
    6fda:	f022                	sd	s0,32(sp)
    6fdc:	1800                	addi	s0,sp,48
    6fde:	fca43c23          	sd	a0,-40(s0)
    6fe2:	fcb43823          	sd	a1,-48(s0)
  for (struct test *t = tests; t->s != 0; t++) {
    6fe6:	fd843783          	ld	a5,-40(s0)
    6fea:	fef43423          	sd	a5,-24(s0)
    6fee:	a8a9                	j	7048 <runtests+0x72>
    if((justone == 0) || strcmp(t->s, justone) == 0) {
    6ff0:	fd043783          	ld	a5,-48(s0)
    6ff4:	cf89                	beqz	a5,700e <runtests+0x38>
    6ff6:	fe843783          	ld	a5,-24(s0)
    6ffa:	679c                	ld	a5,8(a5)
    6ffc:	fd043583          	ld	a1,-48(s0)
    7000:	853e                	mv	a0,a5
    7002:	00000097          	auipc	ra,0x0
    7006:	440080e7          	jalr	1088(ra) # 7442 <strcmp>
    700a:	87aa                	mv	a5,a0
    700c:	eb8d                	bnez	a5,703e <runtests+0x68>
      if(!run(t->f, t->s)){
    700e:	fe843783          	ld	a5,-24(s0)
    7012:	6398                	ld	a4,0(a5)
    7014:	fe843783          	ld	a5,-24(s0)
    7018:	679c                	ld	a5,8(a5)
    701a:	85be                	mv	a1,a5
    701c:	853a                	mv	a0,a4
    701e:	00000097          	auipc	ra,0x0
    7022:	ef8080e7          	jalr	-264(ra) # 6f16 <run>
    7026:	87aa                	mv	a5,a0
    7028:	eb99                	bnez	a5,703e <runtests+0x68>
        printf("SOME TESTS FAILED\n");
    702a:	00003517          	auipc	a0,0x3
    702e:	4de50513          	addi	a0,a0,1246 # a508 <malloc+0x2560>
    7032:	00001097          	auipc	ra,0x1
    7036:	d84080e7          	jalr	-636(ra) # 7db6 <printf>
        return 1;
    703a:	4785                	li	a5,1
    703c:	a819                	j	7052 <runtests+0x7c>
  for (struct test *t = tests; t->s != 0; t++) {
    703e:	fe843783          	ld	a5,-24(s0)
    7042:	07c1                	addi	a5,a5,16
    7044:	fef43423          	sd	a5,-24(s0)
    7048:	fe843783          	ld	a5,-24(s0)
    704c:	679c                	ld	a5,8(a5)
    704e:	f3cd                	bnez	a5,6ff0 <runtests+0x1a>
      }
    }
  }
  return 0;
    7050:	4781                	li	a5,0
}
    7052:	853e                	mv	a0,a5
    7054:	70a2                	ld	ra,40(sp)
    7056:	7402                	ld	s0,32(sp)
    7058:	6145                	addi	sp,sp,48
    705a:	8082                	ret

000000000000705c <countfree>:
// because out of memory with lazy allocation results in the process
// taking a fault and being killed, fork and report back.
//
int
countfree()
{
    705c:	7139                	addi	sp,sp,-64
    705e:	fc06                	sd	ra,56(sp)
    7060:	f822                	sd	s0,48(sp)
    7062:	0080                	addi	s0,sp,64
  int fds[2];

  if(pipe(fds) < 0){
    7064:	fd040793          	addi	a5,s0,-48
    7068:	853e                	mv	a0,a5
    706a:	00001097          	auipc	ra,0x1
    706e:	82e080e7          	jalr	-2002(ra) # 7898 <pipe>
    7072:	87aa                	mv	a5,a0
    7074:	0007df63          	bgez	a5,7092 <countfree+0x36>
    printf("pipe() failed in countfree()\n");
    7078:	00003517          	auipc	a0,0x3
    707c:	4a850513          	addi	a0,a0,1192 # a520 <malloc+0x2578>
    7080:	00001097          	auipc	ra,0x1
    7084:	d36080e7          	jalr	-714(ra) # 7db6 <printf>
    exit(1);
    7088:	4505                	li	a0,1
    708a:	00000097          	auipc	ra,0x0
    708e:	7fe080e7          	jalr	2046(ra) # 7888 <exit>
  }

  int pid = fork();
    7092:	00000097          	auipc	ra,0x0
    7096:	7ee080e7          	jalr	2030(ra) # 7880 <fork>
    709a:	87aa                	mv	a5,a0
    709c:	fef42423          	sw	a5,-24(s0)

  if(pid < 0){
    70a0:	fe842783          	lw	a5,-24(s0)
    70a4:	2781                	sext.w	a5,a5
    70a6:	0007df63          	bgez	a5,70c4 <countfree+0x68>
    printf("fork failed in countfree()\n");
    70aa:	00003517          	auipc	a0,0x3
    70ae:	49650513          	addi	a0,a0,1174 # a540 <malloc+0x2598>
    70b2:	00001097          	auipc	ra,0x1
    70b6:	d04080e7          	jalr	-764(ra) # 7db6 <printf>
    exit(1);
    70ba:	4505                	li	a0,1
    70bc:	00000097          	auipc	ra,0x0
    70c0:	7cc080e7          	jalr	1996(ra) # 7888 <exit>
  }

  if(pid == 0){
    70c4:	fe842783          	lw	a5,-24(s0)
    70c8:	2781                	sext.w	a5,a5
    70ca:	e3d1                	bnez	a5,714e <countfree+0xf2>
    close(fds[0]);
    70cc:	fd042783          	lw	a5,-48(s0)
    70d0:	853e                	mv	a0,a5
    70d2:	00000097          	auipc	ra,0x0
    70d6:	7de080e7          	jalr	2014(ra) # 78b0 <close>

    while(1){
      uint64 a = (uint64) sbrk(4096);
    70da:	6505                	lui	a0,0x1
    70dc:	00001097          	auipc	ra,0x1
    70e0:	834080e7          	jalr	-1996(ra) # 7910 <sbrk>
    70e4:	87aa                	mv	a5,a0
    70e6:	fcf43c23          	sd	a5,-40(s0)
      if(a == 0xffffffffffffffff){
    70ea:	fd843703          	ld	a4,-40(s0)
    70ee:	57fd                	li	a5,-1
    70f0:	04f70963          	beq	a4,a5,7142 <countfree+0xe6>
        break;
      }

      // modify the memory to make sure it's really allocated.
      *(char *)(a + 4096 - 1) = 1;
    70f4:	fd843703          	ld	a4,-40(s0)
    70f8:	6785                	lui	a5,0x1
    70fa:	17fd                	addi	a5,a5,-1
    70fc:	97ba                	add	a5,a5,a4
    70fe:	873e                	mv	a4,a5
    7100:	4785                	li	a5,1
    7102:	00f70023          	sb	a5,0(a4)

      // report back one more page.
      if(write(fds[1], "x", 1) != 1){
    7106:	fd442783          	lw	a5,-44(s0)
    710a:	4605                	li	a2,1
    710c:	00001597          	auipc	a1,0x1
    7110:	11458593          	addi	a1,a1,276 # 8220 <malloc+0x278>
    7114:	853e                	mv	a0,a5
    7116:	00000097          	auipc	ra,0x0
    711a:	792080e7          	jalr	1938(ra) # 78a8 <write>
    711e:	87aa                	mv	a5,a0
    7120:	873e                	mv	a4,a5
    7122:	4785                	li	a5,1
    7124:	faf70be3          	beq	a4,a5,70da <countfree+0x7e>
        printf("write() failed in countfree()\n");
    7128:	00003517          	auipc	a0,0x3
    712c:	43850513          	addi	a0,a0,1080 # a560 <malloc+0x25b8>
    7130:	00001097          	auipc	ra,0x1
    7134:	c86080e7          	jalr	-890(ra) # 7db6 <printf>
        exit(1);
    7138:	4505                	li	a0,1
    713a:	00000097          	auipc	ra,0x0
    713e:	74e080e7          	jalr	1870(ra) # 7888 <exit>
        break;
    7142:	0001                	nop
      }
    }

    exit(0);
    7144:	4501                	li	a0,0
    7146:	00000097          	auipc	ra,0x0
    714a:	742080e7          	jalr	1858(ra) # 7888 <exit>
  }

  close(fds[1]);
    714e:	fd442783          	lw	a5,-44(s0)
    7152:	853e                	mv	a0,a5
    7154:	00000097          	auipc	ra,0x0
    7158:	75c080e7          	jalr	1884(ra) # 78b0 <close>

  int n = 0;
    715c:	fe042623          	sw	zero,-20(s0)
  while(1){
    char c;
    int cc = read(fds[0], &c, 1);
    7160:	fd042783          	lw	a5,-48(s0)
    7164:	fcf40713          	addi	a4,s0,-49
    7168:	4605                	li	a2,1
    716a:	85ba                	mv	a1,a4
    716c:	853e                	mv	a0,a5
    716e:	00000097          	auipc	ra,0x0
    7172:	732080e7          	jalr	1842(ra) # 78a0 <read>
    7176:	87aa                	mv	a5,a0
    7178:	fef42223          	sw	a5,-28(s0)
    if(cc < 0){
    717c:	fe442783          	lw	a5,-28(s0)
    7180:	2781                	sext.w	a5,a5
    7182:	0007df63          	bgez	a5,71a0 <countfree+0x144>
      printf("read() failed in countfree()\n");
    7186:	00003517          	auipc	a0,0x3
    718a:	3fa50513          	addi	a0,a0,1018 # a580 <malloc+0x25d8>
    718e:	00001097          	auipc	ra,0x1
    7192:	c28080e7          	jalr	-984(ra) # 7db6 <printf>
      exit(1);
    7196:	4505                	li	a0,1
    7198:	00000097          	auipc	ra,0x0
    719c:	6f0080e7          	jalr	1776(ra) # 7888 <exit>
    }
    if(cc == 0)
    71a0:	fe442783          	lw	a5,-28(s0)
    71a4:	2781                	sext.w	a5,a5
    71a6:	e385                	bnez	a5,71c6 <countfree+0x16a>
      break;
    n += 1;
  }

  close(fds[0]);
    71a8:	fd042783          	lw	a5,-48(s0)
    71ac:	853e                	mv	a0,a5
    71ae:	00000097          	auipc	ra,0x0
    71b2:	702080e7          	jalr	1794(ra) # 78b0 <close>
  wait((int*)0);
    71b6:	4501                	li	a0,0
    71b8:	00000097          	auipc	ra,0x0
    71bc:	6d8080e7          	jalr	1752(ra) # 7890 <wait>

  return n;
    71c0:	fec42783          	lw	a5,-20(s0)
    71c4:	a039                	j	71d2 <countfree+0x176>
    n += 1;
    71c6:	fec42783          	lw	a5,-20(s0)
    71ca:	2785                	addiw	a5,a5,1
    71cc:	fef42623          	sw	a5,-20(s0)
  while(1){
    71d0:	bf41                	j	7160 <countfree+0x104>
}
    71d2:	853e                	mv	a0,a5
    71d4:	70e2                	ld	ra,56(sp)
    71d6:	7442                	ld	s0,48(sp)
    71d8:	6121                	addi	sp,sp,64
    71da:	8082                	ret

00000000000071dc <drivetests>:

int
drivetests(int quick, int continuous, char *justone) {
    71dc:	1101                	addi	sp,sp,-32
    71de:	ec06                	sd	ra,24(sp)
    71e0:	e822                	sd	s0,16(sp)
    71e2:	1000                	addi	s0,sp,32
    71e4:	87aa                	mv	a5,a0
    71e6:	872e                	mv	a4,a1
    71e8:	fec43023          	sd	a2,-32(s0)
    71ec:	fef42623          	sw	a5,-20(s0)
    71f0:	87ba                	mv	a5,a4
    71f2:	fef42423          	sw	a5,-24(s0)
  do {
    printf("usertests starting\n");
    71f6:	00003517          	auipc	a0,0x3
    71fa:	3aa50513          	addi	a0,a0,938 # a5a0 <malloc+0x25f8>
    71fe:	00001097          	auipc	ra,0x1
    7202:	bb8080e7          	jalr	-1096(ra) # 7db6 <printf>
    if (runtests(quicktests, justone)) {
    7206:	fe043583          	ld	a1,-32(s0)
    720a:	00004517          	auipc	a0,0x4
    720e:	e0650513          	addi	a0,a0,-506 # b010 <quicktests>
    7212:	00000097          	auipc	ra,0x0
    7216:	dc4080e7          	jalr	-572(ra) # 6fd6 <runtests>
    721a:	87aa                	mv	a5,a0
    721c:	cb91                	beqz	a5,7230 <drivetests+0x54>
      if(continuous != 2) {
    721e:	fe842783          	lw	a5,-24(s0)
    7222:	0007871b          	sext.w	a4,a5
    7226:	4789                	li	a5,2
    7228:	00f70463          	beq	a4,a5,7230 <drivetests+0x54>
        return 1;
    722c:	4785                	li	a5,1
    722e:	a891                	j	7282 <drivetests+0xa6>
      }
    }
    if(!quick) {
    7230:	fec42783          	lw	a5,-20(s0)
    7234:	2781                	sext.w	a5,a5
    7236:	e3a9                	bnez	a5,7278 <drivetests+0x9c>
      if (justone == 0)
    7238:	fe043783          	ld	a5,-32(s0)
    723c:	eb89                	bnez	a5,724e <drivetests+0x72>
        printf("usertests slow tests starting\n");
    723e:	00003517          	auipc	a0,0x3
    7242:	37a50513          	addi	a0,a0,890 # a5b8 <malloc+0x2610>
    7246:	00001097          	auipc	ra,0x1
    724a:	b70080e7          	jalr	-1168(ra) # 7db6 <printf>
      if (runtests(slowtests, justone)) {
    724e:	fe043583          	ld	a1,-32(s0)
    7252:	00004517          	auipc	a0,0x4
    7256:	16e50513          	addi	a0,a0,366 # b3c0 <slowtests>
    725a:	00000097          	auipc	ra,0x0
    725e:	d7c080e7          	jalr	-644(ra) # 6fd6 <runtests>
    7262:	87aa                	mv	a5,a0
    7264:	cb91                	beqz	a5,7278 <drivetests+0x9c>
        if(continuous != 2) {
    7266:	fe842783          	lw	a5,-24(s0)
    726a:	0007871b          	sext.w	a4,a5
    726e:	4789                	li	a5,2
    7270:	00f70463          	beq	a4,a5,7278 <drivetests+0x9c>
          return 1;
    7274:	4785                	li	a5,1
    7276:	a031                	j	7282 <drivetests+0xa6>
        }
      }
    }
  } while(continuous);
    7278:	fe842783          	lw	a5,-24(s0)
    727c:	2781                	sext.w	a5,a5
    727e:	ffa5                	bnez	a5,71f6 <drivetests+0x1a>
  return 0;
    7280:	4781                	li	a5,0
}
    7282:	853e                	mv	a0,a5
    7284:	60e2                	ld	ra,24(sp)
    7286:	6442                	ld	s0,16(sp)
    7288:	6105                	addi	sp,sp,32
    728a:	8082                	ret

000000000000728c <main>:

int
main(int argc, char *argv[])
{
    728c:	7179                	addi	sp,sp,-48
    728e:	f406                	sd	ra,40(sp)
    7290:	f022                	sd	s0,32(sp)
    7292:	1800                	addi	s0,sp,48
    7294:	87aa                	mv	a5,a0
    7296:	fcb43823          	sd	a1,-48(s0)
    729a:	fcf42e23          	sw	a5,-36(s0)
  int continuous = 0;
    729e:	fe042623          	sw	zero,-20(s0)
  int quick = 0;
    72a2:	fe042423          	sw	zero,-24(s0)
  char *justone = 0;
    72a6:	fe043023          	sd	zero,-32(s0)

  if(argc == 2 && strcmp(argv[1], "-q") == 0){
    72aa:	fdc42783          	lw	a5,-36(s0)
    72ae:	0007871b          	sext.w	a4,a5
    72b2:	4789                	li	a5,2
    72b4:	02f71563          	bne	a4,a5,72de <main+0x52>
    72b8:	fd043783          	ld	a5,-48(s0)
    72bc:	07a1                	addi	a5,a5,8
    72be:	639c                	ld	a5,0(a5)
    72c0:	00003597          	auipc	a1,0x3
    72c4:	31858593          	addi	a1,a1,792 # a5d8 <malloc+0x2630>
    72c8:	853e                	mv	a0,a5
    72ca:	00000097          	auipc	ra,0x0
    72ce:	178080e7          	jalr	376(ra) # 7442 <strcmp>
    72d2:	87aa                	mv	a5,a0
    72d4:	e789                	bnez	a5,72de <main+0x52>
    quick = 1;
    72d6:	4785                	li	a5,1
    72d8:	fef42423          	sw	a5,-24(s0)
    72dc:	a0c9                	j	739e <main+0x112>
  } else if(argc == 2 && strcmp(argv[1], "-c") == 0){
    72de:	fdc42783          	lw	a5,-36(s0)
    72e2:	0007871b          	sext.w	a4,a5
    72e6:	4789                	li	a5,2
    72e8:	02f71563          	bne	a4,a5,7312 <main+0x86>
    72ec:	fd043783          	ld	a5,-48(s0)
    72f0:	07a1                	addi	a5,a5,8
    72f2:	639c                	ld	a5,0(a5)
    72f4:	00003597          	auipc	a1,0x3
    72f8:	2ec58593          	addi	a1,a1,748 # a5e0 <malloc+0x2638>
    72fc:	853e                	mv	a0,a5
    72fe:	00000097          	auipc	ra,0x0
    7302:	144080e7          	jalr	324(ra) # 7442 <strcmp>
    7306:	87aa                	mv	a5,a0
    7308:	e789                	bnez	a5,7312 <main+0x86>
    continuous = 1;
    730a:	4785                	li	a5,1
    730c:	fef42623          	sw	a5,-20(s0)
    7310:	a079                	j	739e <main+0x112>
  } else if(argc == 2 && strcmp(argv[1], "-C") == 0){
    7312:	fdc42783          	lw	a5,-36(s0)
    7316:	0007871b          	sext.w	a4,a5
    731a:	4789                	li	a5,2
    731c:	02f71563          	bne	a4,a5,7346 <main+0xba>
    7320:	fd043783          	ld	a5,-48(s0)
    7324:	07a1                	addi	a5,a5,8
    7326:	639c                	ld	a5,0(a5)
    7328:	00003597          	auipc	a1,0x3
    732c:	2c058593          	addi	a1,a1,704 # a5e8 <malloc+0x2640>
    7330:	853e                	mv	a0,a5
    7332:	00000097          	auipc	ra,0x0
    7336:	110080e7          	jalr	272(ra) # 7442 <strcmp>
    733a:	87aa                	mv	a5,a0
    733c:	e789                	bnez	a5,7346 <main+0xba>
    continuous = 2;
    733e:	4789                	li	a5,2
    7340:	fef42623          	sw	a5,-20(s0)
    7344:	a8a9                	j	739e <main+0x112>
  } else if(argc == 2 && argv[1][0] != '-'){
    7346:	fdc42783          	lw	a5,-36(s0)
    734a:	0007871b          	sext.w	a4,a5
    734e:	4789                	li	a5,2
    7350:	02f71363          	bne	a4,a5,7376 <main+0xea>
    7354:	fd043783          	ld	a5,-48(s0)
    7358:	07a1                	addi	a5,a5,8
    735a:	639c                	ld	a5,0(a5)
    735c:	0007c783          	lbu	a5,0(a5) # 1000 <truncate3+0x1aa>
    7360:	873e                	mv	a4,a5
    7362:	02d00793          	li	a5,45
    7366:	00f70863          	beq	a4,a5,7376 <main+0xea>
    justone = argv[1];
    736a:	fd043783          	ld	a5,-48(s0)
    736e:	679c                	ld	a5,8(a5)
    7370:	fef43023          	sd	a5,-32(s0)
    7374:	a02d                	j	739e <main+0x112>
  } else if(argc > 1){
    7376:	fdc42783          	lw	a5,-36(s0)
    737a:	0007871b          	sext.w	a4,a5
    737e:	4785                	li	a5,1
    7380:	00e7df63          	bge	a5,a4,739e <main+0x112>
    printf("Usage: usertests [-c] [-C] [-q] [testname]\n");
    7384:	00003517          	auipc	a0,0x3
    7388:	26c50513          	addi	a0,a0,620 # a5f0 <malloc+0x2648>
    738c:	00001097          	auipc	ra,0x1
    7390:	a2a080e7          	jalr	-1494(ra) # 7db6 <printf>
    exit(1);
    7394:	4505                	li	a0,1
    7396:	00000097          	auipc	ra,0x0
    739a:	4f2080e7          	jalr	1266(ra) # 7888 <exit>
  }
  if (drivetests(quick, continuous, justone)) {
    739e:	fec42703          	lw	a4,-20(s0)
    73a2:	fe842783          	lw	a5,-24(s0)
    73a6:	fe043603          	ld	a2,-32(s0)
    73aa:	85ba                	mv	a1,a4
    73ac:	853e                	mv	a0,a5
    73ae:	00000097          	auipc	ra,0x0
    73b2:	e2e080e7          	jalr	-466(ra) # 71dc <drivetests>
    73b6:	87aa                	mv	a5,a0
    73b8:	c791                	beqz	a5,73c4 <main+0x138>
    exit(1);
    73ba:	4505                	li	a0,1
    73bc:	00000097          	auipc	ra,0x0
    73c0:	4cc080e7          	jalr	1228(ra) # 7888 <exit>
  }
  printf("ALL TESTS PASSED\n");
    73c4:	00003517          	auipc	a0,0x3
    73c8:	25c50513          	addi	a0,a0,604 # a620 <malloc+0x2678>
    73cc:	00001097          	auipc	ra,0x1
    73d0:	9ea080e7          	jalr	-1558(ra) # 7db6 <printf>
  exit(0);
    73d4:	4501                	li	a0,0
    73d6:	00000097          	auipc	ra,0x0
    73da:	4b2080e7          	jalr	1202(ra) # 7888 <exit>

00000000000073de <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
    73de:	1141                	addi	sp,sp,-16
    73e0:	e406                	sd	ra,8(sp)
    73e2:	e022                	sd	s0,0(sp)
    73e4:	0800                	addi	s0,sp,16
  extern int main();
  main();
    73e6:	00000097          	auipc	ra,0x0
    73ea:	ea6080e7          	jalr	-346(ra) # 728c <main>
  exit(0);
    73ee:	4501                	li	a0,0
    73f0:	00000097          	auipc	ra,0x0
    73f4:	498080e7          	jalr	1176(ra) # 7888 <exit>

00000000000073f8 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
    73f8:	7179                	addi	sp,sp,-48
    73fa:	f422                	sd	s0,40(sp)
    73fc:	1800                	addi	s0,sp,48
    73fe:	fca43c23          	sd	a0,-40(s0)
    7402:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
    7406:	fd843783          	ld	a5,-40(s0)
    740a:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
    740e:	0001                	nop
    7410:	fd043703          	ld	a4,-48(s0)
    7414:	00170793          	addi	a5,a4,1
    7418:	fcf43823          	sd	a5,-48(s0)
    741c:	fd843783          	ld	a5,-40(s0)
    7420:	00178693          	addi	a3,a5,1
    7424:	fcd43c23          	sd	a3,-40(s0)
    7428:	00074703          	lbu	a4,0(a4)
    742c:	00e78023          	sb	a4,0(a5)
    7430:	0007c783          	lbu	a5,0(a5)
    7434:	fff1                	bnez	a5,7410 <strcpy+0x18>
    ;
  return os;
    7436:	fe843783          	ld	a5,-24(s0)
}
    743a:	853e                	mv	a0,a5
    743c:	7422                	ld	s0,40(sp)
    743e:	6145                	addi	sp,sp,48
    7440:	8082                	ret

0000000000007442 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    7442:	1101                	addi	sp,sp,-32
    7444:	ec22                	sd	s0,24(sp)
    7446:	1000                	addi	s0,sp,32
    7448:	fea43423          	sd	a0,-24(s0)
    744c:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
    7450:	a819                	j	7466 <strcmp+0x24>
    p++, q++;
    7452:	fe843783          	ld	a5,-24(s0)
    7456:	0785                	addi	a5,a5,1
    7458:	fef43423          	sd	a5,-24(s0)
    745c:	fe043783          	ld	a5,-32(s0)
    7460:	0785                	addi	a5,a5,1
    7462:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
    7466:	fe843783          	ld	a5,-24(s0)
    746a:	0007c783          	lbu	a5,0(a5)
    746e:	cb99                	beqz	a5,7484 <strcmp+0x42>
    7470:	fe843783          	ld	a5,-24(s0)
    7474:	0007c703          	lbu	a4,0(a5)
    7478:	fe043783          	ld	a5,-32(s0)
    747c:	0007c783          	lbu	a5,0(a5)
    7480:	fcf709e3          	beq	a4,a5,7452 <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
    7484:	fe843783          	ld	a5,-24(s0)
    7488:	0007c783          	lbu	a5,0(a5)
    748c:	0007871b          	sext.w	a4,a5
    7490:	fe043783          	ld	a5,-32(s0)
    7494:	0007c783          	lbu	a5,0(a5)
    7498:	2781                	sext.w	a5,a5
    749a:	40f707bb          	subw	a5,a4,a5
    749e:	2781                	sext.w	a5,a5
}
    74a0:	853e                	mv	a0,a5
    74a2:	6462                	ld	s0,24(sp)
    74a4:	6105                	addi	sp,sp,32
    74a6:	8082                	ret

00000000000074a8 <strlen>:

uint
strlen(const char *s)
{
    74a8:	7179                	addi	sp,sp,-48
    74aa:	f422                	sd	s0,40(sp)
    74ac:	1800                	addi	s0,sp,48
    74ae:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    74b2:	fe042623          	sw	zero,-20(s0)
    74b6:	a031                	j	74c2 <strlen+0x1a>
    74b8:	fec42783          	lw	a5,-20(s0)
    74bc:	2785                	addiw	a5,a5,1
    74be:	fef42623          	sw	a5,-20(s0)
    74c2:	fec42783          	lw	a5,-20(s0)
    74c6:	fd843703          	ld	a4,-40(s0)
    74ca:	97ba                	add	a5,a5,a4
    74cc:	0007c783          	lbu	a5,0(a5)
    74d0:	f7e5                	bnez	a5,74b8 <strlen+0x10>
    ;
  return n;
    74d2:	fec42783          	lw	a5,-20(s0)
}
    74d6:	853e                	mv	a0,a5
    74d8:	7422                	ld	s0,40(sp)
    74da:	6145                	addi	sp,sp,48
    74dc:	8082                	ret

00000000000074de <memset>:

void*
memset(void *dst, int c, uint n)
{
    74de:	7179                	addi	sp,sp,-48
    74e0:	f422                	sd	s0,40(sp)
    74e2:	1800                	addi	s0,sp,48
    74e4:	fca43c23          	sd	a0,-40(s0)
    74e8:	87ae                	mv	a5,a1
    74ea:	8732                	mv	a4,a2
    74ec:	fcf42a23          	sw	a5,-44(s0)
    74f0:	87ba                	mv	a5,a4
    74f2:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    74f6:	fd843783          	ld	a5,-40(s0)
    74fa:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    74fe:	fe042623          	sw	zero,-20(s0)
    7502:	a00d                	j	7524 <memset+0x46>
    cdst[i] = c;
    7504:	fec42783          	lw	a5,-20(s0)
    7508:	fe043703          	ld	a4,-32(s0)
    750c:	97ba                	add	a5,a5,a4
    750e:	fd442703          	lw	a4,-44(s0)
    7512:	0ff77713          	andi	a4,a4,255
    7516:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    751a:	fec42783          	lw	a5,-20(s0)
    751e:	2785                	addiw	a5,a5,1
    7520:	fef42623          	sw	a5,-20(s0)
    7524:	fec42703          	lw	a4,-20(s0)
    7528:	fd042783          	lw	a5,-48(s0)
    752c:	2781                	sext.w	a5,a5
    752e:	fcf76be3          	bltu	a4,a5,7504 <memset+0x26>
  }
  return dst;
    7532:	fd843783          	ld	a5,-40(s0)
}
    7536:	853e                	mv	a0,a5
    7538:	7422                	ld	s0,40(sp)
    753a:	6145                	addi	sp,sp,48
    753c:	8082                	ret

000000000000753e <strchr>:

char*
strchr(const char *s, char c)
{
    753e:	1101                	addi	sp,sp,-32
    7540:	ec22                	sd	s0,24(sp)
    7542:	1000                	addi	s0,sp,32
    7544:	fea43423          	sd	a0,-24(s0)
    7548:	87ae                	mv	a5,a1
    754a:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
    754e:	a01d                	j	7574 <strchr+0x36>
    if(*s == c)
    7550:	fe843783          	ld	a5,-24(s0)
    7554:	0007c703          	lbu	a4,0(a5)
    7558:	fe744783          	lbu	a5,-25(s0)
    755c:	0ff7f793          	andi	a5,a5,255
    7560:	00e79563          	bne	a5,a4,756a <strchr+0x2c>
      return (char*)s;
    7564:	fe843783          	ld	a5,-24(s0)
    7568:	a821                	j	7580 <strchr+0x42>
  for(; *s; s++)
    756a:	fe843783          	ld	a5,-24(s0)
    756e:	0785                	addi	a5,a5,1
    7570:	fef43423          	sd	a5,-24(s0)
    7574:	fe843783          	ld	a5,-24(s0)
    7578:	0007c783          	lbu	a5,0(a5)
    757c:	fbf1                	bnez	a5,7550 <strchr+0x12>
  return 0;
    757e:	4781                	li	a5,0
}
    7580:	853e                	mv	a0,a5
    7582:	6462                	ld	s0,24(sp)
    7584:	6105                	addi	sp,sp,32
    7586:	8082                	ret

0000000000007588 <gets>:

char*
gets(char *buf, int max)
{
    7588:	7179                	addi	sp,sp,-48
    758a:	f406                	sd	ra,40(sp)
    758c:	f022                	sd	s0,32(sp)
    758e:	1800                	addi	s0,sp,48
    7590:	fca43c23          	sd	a0,-40(s0)
    7594:	87ae                	mv	a5,a1
    7596:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    759a:	fe042623          	sw	zero,-20(s0)
    759e:	a8a1                	j	75f6 <gets+0x6e>
    cc = read(0, &c, 1);
    75a0:	fe740793          	addi	a5,s0,-25
    75a4:	4605                	li	a2,1
    75a6:	85be                	mv	a1,a5
    75a8:	4501                	li	a0,0
    75aa:	00000097          	auipc	ra,0x0
    75ae:	2f6080e7          	jalr	758(ra) # 78a0 <read>
    75b2:	87aa                	mv	a5,a0
    75b4:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
    75b8:	fe842783          	lw	a5,-24(s0)
    75bc:	2781                	sext.w	a5,a5
    75be:	04f05763          	blez	a5,760c <gets+0x84>
      break;
    buf[i++] = c;
    75c2:	fec42783          	lw	a5,-20(s0)
    75c6:	0017871b          	addiw	a4,a5,1
    75ca:	fee42623          	sw	a4,-20(s0)
    75ce:	873e                	mv	a4,a5
    75d0:	fd843783          	ld	a5,-40(s0)
    75d4:	97ba                	add	a5,a5,a4
    75d6:	fe744703          	lbu	a4,-25(s0)
    75da:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
    75de:	fe744783          	lbu	a5,-25(s0)
    75e2:	873e                	mv	a4,a5
    75e4:	47a9                	li	a5,10
    75e6:	02f70463          	beq	a4,a5,760e <gets+0x86>
    75ea:	fe744783          	lbu	a5,-25(s0)
    75ee:	873e                	mv	a4,a5
    75f0:	47b5                	li	a5,13
    75f2:	00f70e63          	beq	a4,a5,760e <gets+0x86>
  for(i=0; i+1 < max; ){
    75f6:	fec42783          	lw	a5,-20(s0)
    75fa:	2785                	addiw	a5,a5,1
    75fc:	0007871b          	sext.w	a4,a5
    7600:	fd442783          	lw	a5,-44(s0)
    7604:	2781                	sext.w	a5,a5
    7606:	f8f74de3          	blt	a4,a5,75a0 <gets+0x18>
    760a:	a011                	j	760e <gets+0x86>
      break;
    760c:	0001                	nop
      break;
  }
  buf[i] = '\0';
    760e:	fec42783          	lw	a5,-20(s0)
    7612:	fd843703          	ld	a4,-40(s0)
    7616:	97ba                	add	a5,a5,a4
    7618:	00078023          	sb	zero,0(a5)
  return buf;
    761c:	fd843783          	ld	a5,-40(s0)
}
    7620:	853e                	mv	a0,a5
    7622:	70a2                	ld	ra,40(sp)
    7624:	7402                	ld	s0,32(sp)
    7626:	6145                	addi	sp,sp,48
    7628:	8082                	ret

000000000000762a <stat>:

int
stat(const char *n, struct stat *st)
{
    762a:	7179                	addi	sp,sp,-48
    762c:	f406                	sd	ra,40(sp)
    762e:	f022                	sd	s0,32(sp)
    7630:	1800                	addi	s0,sp,48
    7632:	fca43c23          	sd	a0,-40(s0)
    7636:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    763a:	4581                	li	a1,0
    763c:	fd843503          	ld	a0,-40(s0)
    7640:	00000097          	auipc	ra,0x0
    7644:	288080e7          	jalr	648(ra) # 78c8 <open>
    7648:	87aa                	mv	a5,a0
    764a:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
    764e:	fec42783          	lw	a5,-20(s0)
    7652:	2781                	sext.w	a5,a5
    7654:	0007d463          	bgez	a5,765c <stat+0x32>
    return -1;
    7658:	57fd                	li	a5,-1
    765a:	a035                	j	7686 <stat+0x5c>
  r = fstat(fd, st);
    765c:	fec42783          	lw	a5,-20(s0)
    7660:	fd043583          	ld	a1,-48(s0)
    7664:	853e                	mv	a0,a5
    7666:	00000097          	auipc	ra,0x0
    766a:	27a080e7          	jalr	634(ra) # 78e0 <fstat>
    766e:	87aa                	mv	a5,a0
    7670:	fef42423          	sw	a5,-24(s0)
  close(fd);
    7674:	fec42783          	lw	a5,-20(s0)
    7678:	853e                	mv	a0,a5
    767a:	00000097          	auipc	ra,0x0
    767e:	236080e7          	jalr	566(ra) # 78b0 <close>
  return r;
    7682:	fe842783          	lw	a5,-24(s0)
}
    7686:	853e                	mv	a0,a5
    7688:	70a2                	ld	ra,40(sp)
    768a:	7402                	ld	s0,32(sp)
    768c:	6145                	addi	sp,sp,48
    768e:	8082                	ret

0000000000007690 <atoi>:

int
atoi(const char *s)
{
    7690:	7179                	addi	sp,sp,-48
    7692:	f422                	sd	s0,40(sp)
    7694:	1800                	addi	s0,sp,48
    7696:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
    769a:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
    769e:	a815                	j	76d2 <atoi+0x42>
    n = n*10 + *s++ - '0';
    76a0:	fec42703          	lw	a4,-20(s0)
    76a4:	87ba                	mv	a5,a4
    76a6:	0027979b          	slliw	a5,a5,0x2
    76aa:	9fb9                	addw	a5,a5,a4
    76ac:	0017979b          	slliw	a5,a5,0x1
    76b0:	0007871b          	sext.w	a4,a5
    76b4:	fd843783          	ld	a5,-40(s0)
    76b8:	00178693          	addi	a3,a5,1
    76bc:	fcd43c23          	sd	a3,-40(s0)
    76c0:	0007c783          	lbu	a5,0(a5)
    76c4:	2781                	sext.w	a5,a5
    76c6:	9fb9                	addw	a5,a5,a4
    76c8:	2781                	sext.w	a5,a5
    76ca:	fd07879b          	addiw	a5,a5,-48
    76ce:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
    76d2:	fd843783          	ld	a5,-40(s0)
    76d6:	0007c783          	lbu	a5,0(a5)
    76da:	873e                	mv	a4,a5
    76dc:	02f00793          	li	a5,47
    76e0:	00e7fb63          	bgeu	a5,a4,76f6 <atoi+0x66>
    76e4:	fd843783          	ld	a5,-40(s0)
    76e8:	0007c783          	lbu	a5,0(a5)
    76ec:	873e                	mv	a4,a5
    76ee:	03900793          	li	a5,57
    76f2:	fae7f7e3          	bgeu	a5,a4,76a0 <atoi+0x10>
  return n;
    76f6:	fec42783          	lw	a5,-20(s0)
}
    76fa:	853e                	mv	a0,a5
    76fc:	7422                	ld	s0,40(sp)
    76fe:	6145                	addi	sp,sp,48
    7700:	8082                	ret

0000000000007702 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    7702:	7139                	addi	sp,sp,-64
    7704:	fc22                	sd	s0,56(sp)
    7706:	0080                	addi	s0,sp,64
    7708:	fca43c23          	sd	a0,-40(s0)
    770c:	fcb43823          	sd	a1,-48(s0)
    7710:	87b2                	mv	a5,a2
    7712:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
    7716:	fd843783          	ld	a5,-40(s0)
    771a:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
    771e:	fd043783          	ld	a5,-48(s0)
    7722:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
    7726:	fe043703          	ld	a4,-32(s0)
    772a:	fe843783          	ld	a5,-24(s0)
    772e:	02e7fc63          	bgeu	a5,a4,7766 <memmove+0x64>
    while(n-- > 0)
    7732:	a00d                	j	7754 <memmove+0x52>
      *dst++ = *src++;
    7734:	fe043703          	ld	a4,-32(s0)
    7738:	00170793          	addi	a5,a4,1
    773c:	fef43023          	sd	a5,-32(s0)
    7740:	fe843783          	ld	a5,-24(s0)
    7744:	00178693          	addi	a3,a5,1
    7748:	fed43423          	sd	a3,-24(s0)
    774c:	00074703          	lbu	a4,0(a4)
    7750:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    7754:	fcc42783          	lw	a5,-52(s0)
    7758:	fff7871b          	addiw	a4,a5,-1
    775c:	fce42623          	sw	a4,-52(s0)
    7760:	fcf04ae3          	bgtz	a5,7734 <memmove+0x32>
    7764:	a891                	j	77b8 <memmove+0xb6>
  } else {
    dst += n;
    7766:	fcc42783          	lw	a5,-52(s0)
    776a:	fe843703          	ld	a4,-24(s0)
    776e:	97ba                	add	a5,a5,a4
    7770:	fef43423          	sd	a5,-24(s0)
    src += n;
    7774:	fcc42783          	lw	a5,-52(s0)
    7778:	fe043703          	ld	a4,-32(s0)
    777c:	97ba                	add	a5,a5,a4
    777e:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    7782:	a01d                	j	77a8 <memmove+0xa6>
      *--dst = *--src;
    7784:	fe043783          	ld	a5,-32(s0)
    7788:	17fd                	addi	a5,a5,-1
    778a:	fef43023          	sd	a5,-32(s0)
    778e:	fe843783          	ld	a5,-24(s0)
    7792:	17fd                	addi	a5,a5,-1
    7794:	fef43423          	sd	a5,-24(s0)
    7798:	fe043783          	ld	a5,-32(s0)
    779c:	0007c703          	lbu	a4,0(a5)
    77a0:	fe843783          	ld	a5,-24(s0)
    77a4:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    77a8:	fcc42783          	lw	a5,-52(s0)
    77ac:	fff7871b          	addiw	a4,a5,-1
    77b0:	fce42623          	sw	a4,-52(s0)
    77b4:	fcf048e3          	bgtz	a5,7784 <memmove+0x82>
  }
  return vdst;
    77b8:	fd843783          	ld	a5,-40(s0)
}
    77bc:	853e                	mv	a0,a5
    77be:	7462                	ld	s0,56(sp)
    77c0:	6121                	addi	sp,sp,64
    77c2:	8082                	ret

00000000000077c4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    77c4:	7139                	addi	sp,sp,-64
    77c6:	fc22                	sd	s0,56(sp)
    77c8:	0080                	addi	s0,sp,64
    77ca:	fca43c23          	sd	a0,-40(s0)
    77ce:	fcb43823          	sd	a1,-48(s0)
    77d2:	87b2                	mv	a5,a2
    77d4:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    77d8:	fd843783          	ld	a5,-40(s0)
    77dc:	fef43423          	sd	a5,-24(s0)
    77e0:	fd043783          	ld	a5,-48(s0)
    77e4:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    77e8:	a0a1                	j	7830 <memcmp+0x6c>
    if (*p1 != *p2) {
    77ea:	fe843783          	ld	a5,-24(s0)
    77ee:	0007c703          	lbu	a4,0(a5)
    77f2:	fe043783          	ld	a5,-32(s0)
    77f6:	0007c783          	lbu	a5,0(a5)
    77fa:	02f70163          	beq	a4,a5,781c <memcmp+0x58>
      return *p1 - *p2;
    77fe:	fe843783          	ld	a5,-24(s0)
    7802:	0007c783          	lbu	a5,0(a5)
    7806:	0007871b          	sext.w	a4,a5
    780a:	fe043783          	ld	a5,-32(s0)
    780e:	0007c783          	lbu	a5,0(a5)
    7812:	2781                	sext.w	a5,a5
    7814:	40f707bb          	subw	a5,a4,a5
    7818:	2781                	sext.w	a5,a5
    781a:	a01d                	j	7840 <memcmp+0x7c>
    }
    p1++;
    781c:	fe843783          	ld	a5,-24(s0)
    7820:	0785                	addi	a5,a5,1
    7822:	fef43423          	sd	a5,-24(s0)
    p2++;
    7826:	fe043783          	ld	a5,-32(s0)
    782a:	0785                	addi	a5,a5,1
    782c:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    7830:	fcc42783          	lw	a5,-52(s0)
    7834:	fff7871b          	addiw	a4,a5,-1
    7838:	fce42623          	sw	a4,-52(s0)
    783c:	f7dd                	bnez	a5,77ea <memcmp+0x26>
  }
  return 0;
    783e:	4781                	li	a5,0
}
    7840:	853e                	mv	a0,a5
    7842:	7462                	ld	s0,56(sp)
    7844:	6121                	addi	sp,sp,64
    7846:	8082                	ret

0000000000007848 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    7848:	7179                	addi	sp,sp,-48
    784a:	f406                	sd	ra,40(sp)
    784c:	f022                	sd	s0,32(sp)
    784e:	1800                	addi	s0,sp,48
    7850:	fea43423          	sd	a0,-24(s0)
    7854:	feb43023          	sd	a1,-32(s0)
    7858:	87b2                	mv	a5,a2
    785a:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    785e:	fdc42783          	lw	a5,-36(s0)
    7862:	863e                	mv	a2,a5
    7864:	fe043583          	ld	a1,-32(s0)
    7868:	fe843503          	ld	a0,-24(s0)
    786c:	00000097          	auipc	ra,0x0
    7870:	e96080e7          	jalr	-362(ra) # 7702 <memmove>
    7874:	87aa                	mv	a5,a0
}
    7876:	853e                	mv	a0,a5
    7878:	70a2                	ld	ra,40(sp)
    787a:	7402                	ld	s0,32(sp)
    787c:	6145                	addi	sp,sp,48
    787e:	8082                	ret

0000000000007880 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    7880:	4885                	li	a7,1
 ecall
    7882:	00000073          	ecall
 ret
    7886:	8082                	ret

0000000000007888 <exit>:
.global exit
exit:
 li a7, SYS_exit
    7888:	4889                	li	a7,2
 ecall
    788a:	00000073          	ecall
 ret
    788e:	8082                	ret

0000000000007890 <wait>:
.global wait
wait:
 li a7, SYS_wait
    7890:	488d                	li	a7,3
 ecall
    7892:	00000073          	ecall
 ret
    7896:	8082                	ret

0000000000007898 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    7898:	4891                	li	a7,4
 ecall
    789a:	00000073          	ecall
 ret
    789e:	8082                	ret

00000000000078a0 <read>:
.global read
read:
 li a7, SYS_read
    78a0:	4895                	li	a7,5
 ecall
    78a2:	00000073          	ecall
 ret
    78a6:	8082                	ret

00000000000078a8 <write>:
.global write
write:
 li a7, SYS_write
    78a8:	48c1                	li	a7,16
 ecall
    78aa:	00000073          	ecall
 ret
    78ae:	8082                	ret

00000000000078b0 <close>:
.global close
close:
 li a7, SYS_close
    78b0:	48d5                	li	a7,21
 ecall
    78b2:	00000073          	ecall
 ret
    78b6:	8082                	ret

00000000000078b8 <kill>:
.global kill
kill:
 li a7, SYS_kill
    78b8:	4899                	li	a7,6
 ecall
    78ba:	00000073          	ecall
 ret
    78be:	8082                	ret

00000000000078c0 <exec>:
.global exec
exec:
 li a7, SYS_exec
    78c0:	489d                	li	a7,7
 ecall
    78c2:	00000073          	ecall
 ret
    78c6:	8082                	ret

00000000000078c8 <open>:
.global open
open:
 li a7, SYS_open
    78c8:	48bd                	li	a7,15
 ecall
    78ca:	00000073          	ecall
 ret
    78ce:	8082                	ret

00000000000078d0 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    78d0:	48c5                	li	a7,17
 ecall
    78d2:	00000073          	ecall
 ret
    78d6:	8082                	ret

00000000000078d8 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    78d8:	48c9                	li	a7,18
 ecall
    78da:	00000073          	ecall
 ret
    78de:	8082                	ret

00000000000078e0 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    78e0:	48a1                	li	a7,8
 ecall
    78e2:	00000073          	ecall
 ret
    78e6:	8082                	ret

00000000000078e8 <link>:
.global link
link:
 li a7, SYS_link
    78e8:	48cd                	li	a7,19
 ecall
    78ea:	00000073          	ecall
 ret
    78ee:	8082                	ret

00000000000078f0 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    78f0:	48d1                	li	a7,20
 ecall
    78f2:	00000073          	ecall
 ret
    78f6:	8082                	ret

00000000000078f8 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    78f8:	48a5                	li	a7,9
 ecall
    78fa:	00000073          	ecall
 ret
    78fe:	8082                	ret

0000000000007900 <dup>:
.global dup
dup:
 li a7, SYS_dup
    7900:	48a9                	li	a7,10
 ecall
    7902:	00000073          	ecall
 ret
    7906:	8082                	ret

0000000000007908 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    7908:	48ad                	li	a7,11
 ecall
    790a:	00000073          	ecall
 ret
    790e:	8082                	ret

0000000000007910 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    7910:	48b1                	li	a7,12
 ecall
    7912:	00000073          	ecall
 ret
    7916:	8082                	ret

0000000000007918 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    7918:	48b5                	li	a7,13
 ecall
    791a:	00000073          	ecall
 ret
    791e:	8082                	ret

0000000000007920 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    7920:	48b9                	li	a7,14
 ecall
    7922:	00000073          	ecall
 ret
    7926:	8082                	ret

0000000000007928 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    7928:	1101                	addi	sp,sp,-32
    792a:	ec06                	sd	ra,24(sp)
    792c:	e822                	sd	s0,16(sp)
    792e:	1000                	addi	s0,sp,32
    7930:	87aa                	mv	a5,a0
    7932:	872e                	mv	a4,a1
    7934:	fef42623          	sw	a5,-20(s0)
    7938:	87ba                	mv	a5,a4
    793a:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    793e:	feb40713          	addi	a4,s0,-21
    7942:	fec42783          	lw	a5,-20(s0)
    7946:	4605                	li	a2,1
    7948:	85ba                	mv	a1,a4
    794a:	853e                	mv	a0,a5
    794c:	00000097          	auipc	ra,0x0
    7950:	f5c080e7          	jalr	-164(ra) # 78a8 <write>
}
    7954:	0001                	nop
    7956:	60e2                	ld	ra,24(sp)
    7958:	6442                	ld	s0,16(sp)
    795a:	6105                	addi	sp,sp,32
    795c:	8082                	ret

000000000000795e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    795e:	7139                	addi	sp,sp,-64
    7960:	fc06                	sd	ra,56(sp)
    7962:	f822                	sd	s0,48(sp)
    7964:	0080                	addi	s0,sp,64
    7966:	87aa                	mv	a5,a0
    7968:	8736                	mv	a4,a3
    796a:	fcf42623          	sw	a5,-52(s0)
    796e:	87ae                	mv	a5,a1
    7970:	fcf42423          	sw	a5,-56(s0)
    7974:	87b2                	mv	a5,a2
    7976:	fcf42223          	sw	a5,-60(s0)
    797a:	87ba                	mv	a5,a4
    797c:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    7980:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    7984:	fc042783          	lw	a5,-64(s0)
    7988:	2781                	sext.w	a5,a5
    798a:	c38d                	beqz	a5,79ac <printint+0x4e>
    798c:	fc842783          	lw	a5,-56(s0)
    7990:	2781                	sext.w	a5,a5
    7992:	0007dd63          	bgez	a5,79ac <printint+0x4e>
    neg = 1;
    7996:	4785                	li	a5,1
    7998:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    799c:	fc842783          	lw	a5,-56(s0)
    79a0:	40f007bb          	negw	a5,a5
    79a4:	2781                	sext.w	a5,a5
    79a6:	fef42223          	sw	a5,-28(s0)
    79aa:	a029                	j	79b4 <printint+0x56>
  } else {
    x = xx;
    79ac:	fc842783          	lw	a5,-56(s0)
    79b0:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    79b4:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    79b8:	fc442783          	lw	a5,-60(s0)
    79bc:	fe442703          	lw	a4,-28(s0)
    79c0:	02f777bb          	remuw	a5,a4,a5
    79c4:	0007861b          	sext.w	a2,a5
    79c8:	fec42783          	lw	a5,-20(s0)
    79cc:	0017871b          	addiw	a4,a5,1
    79d0:	fee42623          	sw	a4,-20(s0)
    79d4:	00004697          	auipc	a3,0x4
    79d8:	a5c68693          	addi	a3,a3,-1444 # b430 <digits>
    79dc:	02061713          	slli	a4,a2,0x20
    79e0:	9301                	srli	a4,a4,0x20
    79e2:	9736                	add	a4,a4,a3
    79e4:	00074703          	lbu	a4,0(a4)
    79e8:	ff040693          	addi	a3,s0,-16
    79ec:	97b6                	add	a5,a5,a3
    79ee:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    79f2:	fc442783          	lw	a5,-60(s0)
    79f6:	fe442703          	lw	a4,-28(s0)
    79fa:	02f757bb          	divuw	a5,a4,a5
    79fe:	fef42223          	sw	a5,-28(s0)
    7a02:	fe442783          	lw	a5,-28(s0)
    7a06:	2781                	sext.w	a5,a5
    7a08:	fbc5                	bnez	a5,79b8 <printint+0x5a>
  if(neg)
    7a0a:	fe842783          	lw	a5,-24(s0)
    7a0e:	2781                	sext.w	a5,a5
    7a10:	cf95                	beqz	a5,7a4c <printint+0xee>
    buf[i++] = '-';
    7a12:	fec42783          	lw	a5,-20(s0)
    7a16:	0017871b          	addiw	a4,a5,1
    7a1a:	fee42623          	sw	a4,-20(s0)
    7a1e:	ff040713          	addi	a4,s0,-16
    7a22:	97ba                	add	a5,a5,a4
    7a24:	02d00713          	li	a4,45
    7a28:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    7a2c:	a005                	j	7a4c <printint+0xee>
    putc(fd, buf[i]);
    7a2e:	fec42783          	lw	a5,-20(s0)
    7a32:	ff040713          	addi	a4,s0,-16
    7a36:	97ba                	add	a5,a5,a4
    7a38:	fe07c703          	lbu	a4,-32(a5)
    7a3c:	fcc42783          	lw	a5,-52(s0)
    7a40:	85ba                	mv	a1,a4
    7a42:	853e                	mv	a0,a5
    7a44:	00000097          	auipc	ra,0x0
    7a48:	ee4080e7          	jalr	-284(ra) # 7928 <putc>
  while(--i >= 0)
    7a4c:	fec42783          	lw	a5,-20(s0)
    7a50:	37fd                	addiw	a5,a5,-1
    7a52:	fef42623          	sw	a5,-20(s0)
    7a56:	fec42783          	lw	a5,-20(s0)
    7a5a:	2781                	sext.w	a5,a5
    7a5c:	fc07d9e3          	bgez	a5,7a2e <printint+0xd0>
}
    7a60:	0001                	nop
    7a62:	0001                	nop
    7a64:	70e2                	ld	ra,56(sp)
    7a66:	7442                	ld	s0,48(sp)
    7a68:	6121                	addi	sp,sp,64
    7a6a:	8082                	ret

0000000000007a6c <printptr>:

static void
printptr(int fd, uint64 x) {
    7a6c:	7179                	addi	sp,sp,-48
    7a6e:	f406                	sd	ra,40(sp)
    7a70:	f022                	sd	s0,32(sp)
    7a72:	1800                	addi	s0,sp,48
    7a74:	87aa                	mv	a5,a0
    7a76:	fcb43823          	sd	a1,-48(s0)
    7a7a:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    7a7e:	fdc42783          	lw	a5,-36(s0)
    7a82:	03000593          	li	a1,48
    7a86:	853e                	mv	a0,a5
    7a88:	00000097          	auipc	ra,0x0
    7a8c:	ea0080e7          	jalr	-352(ra) # 7928 <putc>
  putc(fd, 'x');
    7a90:	fdc42783          	lw	a5,-36(s0)
    7a94:	07800593          	li	a1,120
    7a98:	853e                	mv	a0,a5
    7a9a:	00000097          	auipc	ra,0x0
    7a9e:	e8e080e7          	jalr	-370(ra) # 7928 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    7aa2:	fe042623          	sw	zero,-20(s0)
    7aa6:	a82d                	j	7ae0 <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    7aa8:	fd043783          	ld	a5,-48(s0)
    7aac:	93f1                	srli	a5,a5,0x3c
    7aae:	00004717          	auipc	a4,0x4
    7ab2:	98270713          	addi	a4,a4,-1662 # b430 <digits>
    7ab6:	97ba                	add	a5,a5,a4
    7ab8:	0007c703          	lbu	a4,0(a5)
    7abc:	fdc42783          	lw	a5,-36(s0)
    7ac0:	85ba                	mv	a1,a4
    7ac2:	853e                	mv	a0,a5
    7ac4:	00000097          	auipc	ra,0x0
    7ac8:	e64080e7          	jalr	-412(ra) # 7928 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    7acc:	fec42783          	lw	a5,-20(s0)
    7ad0:	2785                	addiw	a5,a5,1
    7ad2:	fef42623          	sw	a5,-20(s0)
    7ad6:	fd043783          	ld	a5,-48(s0)
    7ada:	0792                	slli	a5,a5,0x4
    7adc:	fcf43823          	sd	a5,-48(s0)
    7ae0:	fec42783          	lw	a5,-20(s0)
    7ae4:	873e                	mv	a4,a5
    7ae6:	47bd                	li	a5,15
    7ae8:	fce7f0e3          	bgeu	a5,a4,7aa8 <printptr+0x3c>
}
    7aec:	0001                	nop
    7aee:	0001                	nop
    7af0:	70a2                	ld	ra,40(sp)
    7af2:	7402                	ld	s0,32(sp)
    7af4:	6145                	addi	sp,sp,48
    7af6:	8082                	ret

0000000000007af8 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    7af8:	715d                	addi	sp,sp,-80
    7afa:	e486                	sd	ra,72(sp)
    7afc:	e0a2                	sd	s0,64(sp)
    7afe:	0880                	addi	s0,sp,80
    7b00:	87aa                	mv	a5,a0
    7b02:	fcb43023          	sd	a1,-64(s0)
    7b06:	fac43c23          	sd	a2,-72(s0)
    7b0a:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    7b0e:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    7b12:	fe042223          	sw	zero,-28(s0)
    7b16:	a42d                	j	7d40 <vprintf+0x248>
    c = fmt[i] & 0xff;
    7b18:	fe442783          	lw	a5,-28(s0)
    7b1c:	fc043703          	ld	a4,-64(s0)
    7b20:	97ba                	add	a5,a5,a4
    7b22:	0007c783          	lbu	a5,0(a5)
    7b26:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    7b2a:	fe042783          	lw	a5,-32(s0)
    7b2e:	2781                	sext.w	a5,a5
    7b30:	eb9d                	bnez	a5,7b66 <vprintf+0x6e>
      if(c == '%'){
    7b32:	fdc42783          	lw	a5,-36(s0)
    7b36:	0007871b          	sext.w	a4,a5
    7b3a:	02500793          	li	a5,37
    7b3e:	00f71763          	bne	a4,a5,7b4c <vprintf+0x54>
        state = '%';
    7b42:	02500793          	li	a5,37
    7b46:	fef42023          	sw	a5,-32(s0)
    7b4a:	a2f5                	j	7d36 <vprintf+0x23e>
      } else {
        putc(fd, c);
    7b4c:	fdc42783          	lw	a5,-36(s0)
    7b50:	0ff7f713          	andi	a4,a5,255
    7b54:	fcc42783          	lw	a5,-52(s0)
    7b58:	85ba                	mv	a1,a4
    7b5a:	853e                	mv	a0,a5
    7b5c:	00000097          	auipc	ra,0x0
    7b60:	dcc080e7          	jalr	-564(ra) # 7928 <putc>
    7b64:	aac9                	j	7d36 <vprintf+0x23e>
      }
    } else if(state == '%'){
    7b66:	fe042783          	lw	a5,-32(s0)
    7b6a:	0007871b          	sext.w	a4,a5
    7b6e:	02500793          	li	a5,37
    7b72:	1cf71263          	bne	a4,a5,7d36 <vprintf+0x23e>
      if(c == 'd'){
    7b76:	fdc42783          	lw	a5,-36(s0)
    7b7a:	0007871b          	sext.w	a4,a5
    7b7e:	06400793          	li	a5,100
    7b82:	02f71463          	bne	a4,a5,7baa <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    7b86:	fb843783          	ld	a5,-72(s0)
    7b8a:	00878713          	addi	a4,a5,8
    7b8e:	fae43c23          	sd	a4,-72(s0)
    7b92:	4398                	lw	a4,0(a5)
    7b94:	fcc42783          	lw	a5,-52(s0)
    7b98:	4685                	li	a3,1
    7b9a:	4629                	li	a2,10
    7b9c:	85ba                	mv	a1,a4
    7b9e:	853e                	mv	a0,a5
    7ba0:	00000097          	auipc	ra,0x0
    7ba4:	dbe080e7          	jalr	-578(ra) # 795e <printint>
    7ba8:	a269                	j	7d32 <vprintf+0x23a>
      } else if(c == 'l') {
    7baa:	fdc42783          	lw	a5,-36(s0)
    7bae:	0007871b          	sext.w	a4,a5
    7bb2:	06c00793          	li	a5,108
    7bb6:	02f71663          	bne	a4,a5,7be2 <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    7bba:	fb843783          	ld	a5,-72(s0)
    7bbe:	00878713          	addi	a4,a5,8
    7bc2:	fae43c23          	sd	a4,-72(s0)
    7bc6:	639c                	ld	a5,0(a5)
    7bc8:	0007871b          	sext.w	a4,a5
    7bcc:	fcc42783          	lw	a5,-52(s0)
    7bd0:	4681                	li	a3,0
    7bd2:	4629                	li	a2,10
    7bd4:	85ba                	mv	a1,a4
    7bd6:	853e                	mv	a0,a5
    7bd8:	00000097          	auipc	ra,0x0
    7bdc:	d86080e7          	jalr	-634(ra) # 795e <printint>
    7be0:	aa89                	j	7d32 <vprintf+0x23a>
      } else if(c == 'x') {
    7be2:	fdc42783          	lw	a5,-36(s0)
    7be6:	0007871b          	sext.w	a4,a5
    7bea:	07800793          	li	a5,120
    7bee:	02f71463          	bne	a4,a5,7c16 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    7bf2:	fb843783          	ld	a5,-72(s0)
    7bf6:	00878713          	addi	a4,a5,8
    7bfa:	fae43c23          	sd	a4,-72(s0)
    7bfe:	4398                	lw	a4,0(a5)
    7c00:	fcc42783          	lw	a5,-52(s0)
    7c04:	4681                	li	a3,0
    7c06:	4641                	li	a2,16
    7c08:	85ba                	mv	a1,a4
    7c0a:	853e                	mv	a0,a5
    7c0c:	00000097          	auipc	ra,0x0
    7c10:	d52080e7          	jalr	-686(ra) # 795e <printint>
    7c14:	aa39                	j	7d32 <vprintf+0x23a>
      } else if(c == 'p') {
    7c16:	fdc42783          	lw	a5,-36(s0)
    7c1a:	0007871b          	sext.w	a4,a5
    7c1e:	07000793          	li	a5,112
    7c22:	02f71263          	bne	a4,a5,7c46 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    7c26:	fb843783          	ld	a5,-72(s0)
    7c2a:	00878713          	addi	a4,a5,8
    7c2e:	fae43c23          	sd	a4,-72(s0)
    7c32:	6398                	ld	a4,0(a5)
    7c34:	fcc42783          	lw	a5,-52(s0)
    7c38:	85ba                	mv	a1,a4
    7c3a:	853e                	mv	a0,a5
    7c3c:	00000097          	auipc	ra,0x0
    7c40:	e30080e7          	jalr	-464(ra) # 7a6c <printptr>
    7c44:	a0fd                	j	7d32 <vprintf+0x23a>
      } else if(c == 's'){
    7c46:	fdc42783          	lw	a5,-36(s0)
    7c4a:	0007871b          	sext.w	a4,a5
    7c4e:	07300793          	li	a5,115
    7c52:	04f71c63          	bne	a4,a5,7caa <vprintf+0x1b2>
        s = va_arg(ap, char*);
    7c56:	fb843783          	ld	a5,-72(s0)
    7c5a:	00878713          	addi	a4,a5,8
    7c5e:	fae43c23          	sd	a4,-72(s0)
    7c62:	639c                	ld	a5,0(a5)
    7c64:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    7c68:	fe843783          	ld	a5,-24(s0)
    7c6c:	eb8d                	bnez	a5,7c9e <vprintf+0x1a6>
          s = "(null)";
    7c6e:	00003797          	auipc	a5,0x3
    7c72:	9ca78793          	addi	a5,a5,-1590 # a638 <malloc+0x2690>
    7c76:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    7c7a:	a015                	j	7c9e <vprintf+0x1a6>
          putc(fd, *s);
    7c7c:	fe843783          	ld	a5,-24(s0)
    7c80:	0007c703          	lbu	a4,0(a5)
    7c84:	fcc42783          	lw	a5,-52(s0)
    7c88:	85ba                	mv	a1,a4
    7c8a:	853e                	mv	a0,a5
    7c8c:	00000097          	auipc	ra,0x0
    7c90:	c9c080e7          	jalr	-868(ra) # 7928 <putc>
          s++;
    7c94:	fe843783          	ld	a5,-24(s0)
    7c98:	0785                	addi	a5,a5,1
    7c9a:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    7c9e:	fe843783          	ld	a5,-24(s0)
    7ca2:	0007c783          	lbu	a5,0(a5)
    7ca6:	fbf9                	bnez	a5,7c7c <vprintf+0x184>
    7ca8:	a069                	j	7d32 <vprintf+0x23a>
        }
      } else if(c == 'c'){
    7caa:	fdc42783          	lw	a5,-36(s0)
    7cae:	0007871b          	sext.w	a4,a5
    7cb2:	06300793          	li	a5,99
    7cb6:	02f71463          	bne	a4,a5,7cde <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    7cba:	fb843783          	ld	a5,-72(s0)
    7cbe:	00878713          	addi	a4,a5,8
    7cc2:	fae43c23          	sd	a4,-72(s0)
    7cc6:	439c                	lw	a5,0(a5)
    7cc8:	0ff7f713          	andi	a4,a5,255
    7ccc:	fcc42783          	lw	a5,-52(s0)
    7cd0:	85ba                	mv	a1,a4
    7cd2:	853e                	mv	a0,a5
    7cd4:	00000097          	auipc	ra,0x0
    7cd8:	c54080e7          	jalr	-940(ra) # 7928 <putc>
    7cdc:	a899                	j	7d32 <vprintf+0x23a>
      } else if(c == '%'){
    7cde:	fdc42783          	lw	a5,-36(s0)
    7ce2:	0007871b          	sext.w	a4,a5
    7ce6:	02500793          	li	a5,37
    7cea:	00f71f63          	bne	a4,a5,7d08 <vprintf+0x210>
        putc(fd, c);
    7cee:	fdc42783          	lw	a5,-36(s0)
    7cf2:	0ff7f713          	andi	a4,a5,255
    7cf6:	fcc42783          	lw	a5,-52(s0)
    7cfa:	85ba                	mv	a1,a4
    7cfc:	853e                	mv	a0,a5
    7cfe:	00000097          	auipc	ra,0x0
    7d02:	c2a080e7          	jalr	-982(ra) # 7928 <putc>
    7d06:	a035                	j	7d32 <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    7d08:	fcc42783          	lw	a5,-52(s0)
    7d0c:	02500593          	li	a1,37
    7d10:	853e                	mv	a0,a5
    7d12:	00000097          	auipc	ra,0x0
    7d16:	c16080e7          	jalr	-1002(ra) # 7928 <putc>
        putc(fd, c);
    7d1a:	fdc42783          	lw	a5,-36(s0)
    7d1e:	0ff7f713          	andi	a4,a5,255
    7d22:	fcc42783          	lw	a5,-52(s0)
    7d26:	85ba                	mv	a1,a4
    7d28:	853e                	mv	a0,a5
    7d2a:	00000097          	auipc	ra,0x0
    7d2e:	bfe080e7          	jalr	-1026(ra) # 7928 <putc>
      }
      state = 0;
    7d32:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    7d36:	fe442783          	lw	a5,-28(s0)
    7d3a:	2785                	addiw	a5,a5,1
    7d3c:	fef42223          	sw	a5,-28(s0)
    7d40:	fe442783          	lw	a5,-28(s0)
    7d44:	fc043703          	ld	a4,-64(s0)
    7d48:	97ba                	add	a5,a5,a4
    7d4a:	0007c783          	lbu	a5,0(a5)
    7d4e:	dc0795e3          	bnez	a5,7b18 <vprintf+0x20>
    }
  }
}
    7d52:	0001                	nop
    7d54:	0001                	nop
    7d56:	60a6                	ld	ra,72(sp)
    7d58:	6406                	ld	s0,64(sp)
    7d5a:	6161                	addi	sp,sp,80
    7d5c:	8082                	ret

0000000000007d5e <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    7d5e:	7159                	addi	sp,sp,-112
    7d60:	fc06                	sd	ra,56(sp)
    7d62:	f822                	sd	s0,48(sp)
    7d64:	0080                	addi	s0,sp,64
    7d66:	fcb43823          	sd	a1,-48(s0)
    7d6a:	e010                	sd	a2,0(s0)
    7d6c:	e414                	sd	a3,8(s0)
    7d6e:	e818                	sd	a4,16(s0)
    7d70:	ec1c                	sd	a5,24(s0)
    7d72:	03043023          	sd	a6,32(s0)
    7d76:	03143423          	sd	a7,40(s0)
    7d7a:	87aa                	mv	a5,a0
    7d7c:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    7d80:	03040793          	addi	a5,s0,48
    7d84:	fcf43423          	sd	a5,-56(s0)
    7d88:	fc843783          	ld	a5,-56(s0)
    7d8c:	fd078793          	addi	a5,a5,-48
    7d90:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    7d94:	fe843703          	ld	a4,-24(s0)
    7d98:	fdc42783          	lw	a5,-36(s0)
    7d9c:	863a                	mv	a2,a4
    7d9e:	fd043583          	ld	a1,-48(s0)
    7da2:	853e                	mv	a0,a5
    7da4:	00000097          	auipc	ra,0x0
    7da8:	d54080e7          	jalr	-684(ra) # 7af8 <vprintf>
}
    7dac:	0001                	nop
    7dae:	70e2                	ld	ra,56(sp)
    7db0:	7442                	ld	s0,48(sp)
    7db2:	6165                	addi	sp,sp,112
    7db4:	8082                	ret

0000000000007db6 <printf>:

void
printf(const char *fmt, ...)
{
    7db6:	7159                	addi	sp,sp,-112
    7db8:	f406                	sd	ra,40(sp)
    7dba:	f022                	sd	s0,32(sp)
    7dbc:	1800                	addi	s0,sp,48
    7dbe:	fca43c23          	sd	a0,-40(s0)
    7dc2:	e40c                	sd	a1,8(s0)
    7dc4:	e810                	sd	a2,16(s0)
    7dc6:	ec14                	sd	a3,24(s0)
    7dc8:	f018                	sd	a4,32(s0)
    7dca:	f41c                	sd	a5,40(s0)
    7dcc:	03043823          	sd	a6,48(s0)
    7dd0:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    7dd4:	04040793          	addi	a5,s0,64
    7dd8:	fcf43823          	sd	a5,-48(s0)
    7ddc:	fd043783          	ld	a5,-48(s0)
    7de0:	fc878793          	addi	a5,a5,-56
    7de4:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    7de8:	fe843783          	ld	a5,-24(s0)
    7dec:	863e                	mv	a2,a5
    7dee:	fd843583          	ld	a1,-40(s0)
    7df2:	4505                	li	a0,1
    7df4:	00000097          	auipc	ra,0x0
    7df8:	d04080e7          	jalr	-764(ra) # 7af8 <vprintf>
}
    7dfc:	0001                	nop
    7dfe:	70a2                	ld	ra,40(sp)
    7e00:	7402                	ld	s0,32(sp)
    7e02:	6165                	addi	sp,sp,112
    7e04:	8082                	ret

0000000000007e06 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    7e06:	7179                	addi	sp,sp,-48
    7e08:	f422                	sd	s0,40(sp)
    7e0a:	1800                	addi	s0,sp,48
    7e0c:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    7e10:	fd843783          	ld	a5,-40(s0)
    7e14:	17c1                	addi	a5,a5,-16
    7e16:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    7e1a:	0000a797          	auipc	a5,0xa
    7e1e:	e5e78793          	addi	a5,a5,-418 # 11c78 <freep>
    7e22:	639c                	ld	a5,0(a5)
    7e24:	fef43423          	sd	a5,-24(s0)
    7e28:	a815                	j	7e5c <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    7e2a:	fe843783          	ld	a5,-24(s0)
    7e2e:	639c                	ld	a5,0(a5)
    7e30:	fe843703          	ld	a4,-24(s0)
    7e34:	00f76f63          	bltu	a4,a5,7e52 <free+0x4c>
    7e38:	fe043703          	ld	a4,-32(s0)
    7e3c:	fe843783          	ld	a5,-24(s0)
    7e40:	02e7eb63          	bltu	a5,a4,7e76 <free+0x70>
    7e44:	fe843783          	ld	a5,-24(s0)
    7e48:	639c                	ld	a5,0(a5)
    7e4a:	fe043703          	ld	a4,-32(s0)
    7e4e:	02f76463          	bltu	a4,a5,7e76 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    7e52:	fe843783          	ld	a5,-24(s0)
    7e56:	639c                	ld	a5,0(a5)
    7e58:	fef43423          	sd	a5,-24(s0)
    7e5c:	fe043703          	ld	a4,-32(s0)
    7e60:	fe843783          	ld	a5,-24(s0)
    7e64:	fce7f3e3          	bgeu	a5,a4,7e2a <free+0x24>
    7e68:	fe843783          	ld	a5,-24(s0)
    7e6c:	639c                	ld	a5,0(a5)
    7e6e:	fe043703          	ld	a4,-32(s0)
    7e72:	faf77ce3          	bgeu	a4,a5,7e2a <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    7e76:	fe043783          	ld	a5,-32(s0)
    7e7a:	479c                	lw	a5,8(a5)
    7e7c:	1782                	slli	a5,a5,0x20
    7e7e:	9381                	srli	a5,a5,0x20
    7e80:	0792                	slli	a5,a5,0x4
    7e82:	fe043703          	ld	a4,-32(s0)
    7e86:	973e                	add	a4,a4,a5
    7e88:	fe843783          	ld	a5,-24(s0)
    7e8c:	639c                	ld	a5,0(a5)
    7e8e:	02f71763          	bne	a4,a5,7ebc <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    7e92:	fe043783          	ld	a5,-32(s0)
    7e96:	4798                	lw	a4,8(a5)
    7e98:	fe843783          	ld	a5,-24(s0)
    7e9c:	639c                	ld	a5,0(a5)
    7e9e:	479c                	lw	a5,8(a5)
    7ea0:	9fb9                	addw	a5,a5,a4
    7ea2:	0007871b          	sext.w	a4,a5
    7ea6:	fe043783          	ld	a5,-32(s0)
    7eaa:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    7eac:	fe843783          	ld	a5,-24(s0)
    7eb0:	639c                	ld	a5,0(a5)
    7eb2:	6398                	ld	a4,0(a5)
    7eb4:	fe043783          	ld	a5,-32(s0)
    7eb8:	e398                	sd	a4,0(a5)
    7eba:	a039                	j	7ec8 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    7ebc:	fe843783          	ld	a5,-24(s0)
    7ec0:	6398                	ld	a4,0(a5)
    7ec2:	fe043783          	ld	a5,-32(s0)
    7ec6:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    7ec8:	fe843783          	ld	a5,-24(s0)
    7ecc:	479c                	lw	a5,8(a5)
    7ece:	1782                	slli	a5,a5,0x20
    7ed0:	9381                	srli	a5,a5,0x20
    7ed2:	0792                	slli	a5,a5,0x4
    7ed4:	fe843703          	ld	a4,-24(s0)
    7ed8:	97ba                	add	a5,a5,a4
    7eda:	fe043703          	ld	a4,-32(s0)
    7ede:	02f71563          	bne	a4,a5,7f08 <free+0x102>
    p->s.size += bp->s.size;
    7ee2:	fe843783          	ld	a5,-24(s0)
    7ee6:	4798                	lw	a4,8(a5)
    7ee8:	fe043783          	ld	a5,-32(s0)
    7eec:	479c                	lw	a5,8(a5)
    7eee:	9fb9                	addw	a5,a5,a4
    7ef0:	0007871b          	sext.w	a4,a5
    7ef4:	fe843783          	ld	a5,-24(s0)
    7ef8:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    7efa:	fe043783          	ld	a5,-32(s0)
    7efe:	6398                	ld	a4,0(a5)
    7f00:	fe843783          	ld	a5,-24(s0)
    7f04:	e398                	sd	a4,0(a5)
    7f06:	a031                	j	7f12 <free+0x10c>
  } else
    p->s.ptr = bp;
    7f08:	fe843783          	ld	a5,-24(s0)
    7f0c:	fe043703          	ld	a4,-32(s0)
    7f10:	e398                	sd	a4,0(a5)
  freep = p;
    7f12:	0000a797          	auipc	a5,0xa
    7f16:	d6678793          	addi	a5,a5,-666 # 11c78 <freep>
    7f1a:	fe843703          	ld	a4,-24(s0)
    7f1e:	e398                	sd	a4,0(a5)
}
    7f20:	0001                	nop
    7f22:	7422                	ld	s0,40(sp)
    7f24:	6145                	addi	sp,sp,48
    7f26:	8082                	ret

0000000000007f28 <morecore>:

static Header*
morecore(uint nu)
{
    7f28:	7179                	addi	sp,sp,-48
    7f2a:	f406                	sd	ra,40(sp)
    7f2c:	f022                	sd	s0,32(sp)
    7f2e:	1800                	addi	s0,sp,48
    7f30:	87aa                	mv	a5,a0
    7f32:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    7f36:	fdc42783          	lw	a5,-36(s0)
    7f3a:	0007871b          	sext.w	a4,a5
    7f3e:	6785                	lui	a5,0x1
    7f40:	00f77563          	bgeu	a4,a5,7f4a <morecore+0x22>
    nu = 4096;
    7f44:	6785                	lui	a5,0x1
    7f46:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    7f4a:	fdc42783          	lw	a5,-36(s0)
    7f4e:	0047979b          	slliw	a5,a5,0x4
    7f52:	2781                	sext.w	a5,a5
    7f54:	2781                	sext.w	a5,a5
    7f56:	853e                	mv	a0,a5
    7f58:	00000097          	auipc	ra,0x0
    7f5c:	9b8080e7          	jalr	-1608(ra) # 7910 <sbrk>
    7f60:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    7f64:	fe843703          	ld	a4,-24(s0)
    7f68:	57fd                	li	a5,-1
    7f6a:	00f71463          	bne	a4,a5,7f72 <morecore+0x4a>
    return 0;
    7f6e:	4781                	li	a5,0
    7f70:	a03d                	j	7f9e <morecore+0x76>
  hp = (Header*)p;
    7f72:	fe843783          	ld	a5,-24(s0)
    7f76:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    7f7a:	fe043783          	ld	a5,-32(s0)
    7f7e:	fdc42703          	lw	a4,-36(s0)
    7f82:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    7f84:	fe043783          	ld	a5,-32(s0)
    7f88:	07c1                	addi	a5,a5,16
    7f8a:	853e                	mv	a0,a5
    7f8c:	00000097          	auipc	ra,0x0
    7f90:	e7a080e7          	jalr	-390(ra) # 7e06 <free>
  return freep;
    7f94:	0000a797          	auipc	a5,0xa
    7f98:	ce478793          	addi	a5,a5,-796 # 11c78 <freep>
    7f9c:	639c                	ld	a5,0(a5)
}
    7f9e:	853e                	mv	a0,a5
    7fa0:	70a2                	ld	ra,40(sp)
    7fa2:	7402                	ld	s0,32(sp)
    7fa4:	6145                	addi	sp,sp,48
    7fa6:	8082                	ret

0000000000007fa8 <malloc>:

void*
malloc(uint nbytes)
{
    7fa8:	7139                	addi	sp,sp,-64
    7faa:	fc06                	sd	ra,56(sp)
    7fac:	f822                	sd	s0,48(sp)
    7fae:	0080                	addi	s0,sp,64
    7fb0:	87aa                	mv	a5,a0
    7fb2:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    7fb6:	fcc46783          	lwu	a5,-52(s0)
    7fba:	07bd                	addi	a5,a5,15
    7fbc:	8391                	srli	a5,a5,0x4
    7fbe:	2781                	sext.w	a5,a5
    7fc0:	2785                	addiw	a5,a5,1
    7fc2:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    7fc6:	0000a797          	auipc	a5,0xa
    7fca:	cb278793          	addi	a5,a5,-846 # 11c78 <freep>
    7fce:	639c                	ld	a5,0(a5)
    7fd0:	fef43023          	sd	a5,-32(s0)
    7fd4:	fe043783          	ld	a5,-32(s0)
    7fd8:	ef95                	bnez	a5,8014 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    7fda:	0000a797          	auipc	a5,0xa
    7fde:	c8e78793          	addi	a5,a5,-882 # 11c68 <base>
    7fe2:	fef43023          	sd	a5,-32(s0)
    7fe6:	0000a797          	auipc	a5,0xa
    7fea:	c9278793          	addi	a5,a5,-878 # 11c78 <freep>
    7fee:	fe043703          	ld	a4,-32(s0)
    7ff2:	e398                	sd	a4,0(a5)
    7ff4:	0000a797          	auipc	a5,0xa
    7ff8:	c8478793          	addi	a5,a5,-892 # 11c78 <freep>
    7ffc:	6398                	ld	a4,0(a5)
    7ffe:	0000a797          	auipc	a5,0xa
    8002:	c6a78793          	addi	a5,a5,-918 # 11c68 <base>
    8006:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    8008:	0000a797          	auipc	a5,0xa
    800c:	c6078793          	addi	a5,a5,-928 # 11c68 <base>
    8010:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    8014:	fe043783          	ld	a5,-32(s0)
    8018:	639c                	ld	a5,0(a5)
    801a:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    801e:	fe843783          	ld	a5,-24(s0)
    8022:	4798                	lw	a4,8(a5)
    8024:	fdc42783          	lw	a5,-36(s0)
    8028:	2781                	sext.w	a5,a5
    802a:	06f76863          	bltu	a4,a5,809a <malloc+0xf2>
      if(p->s.size == nunits)
    802e:	fe843783          	ld	a5,-24(s0)
    8032:	4798                	lw	a4,8(a5)
    8034:	fdc42783          	lw	a5,-36(s0)
    8038:	2781                	sext.w	a5,a5
    803a:	00e79963          	bne	a5,a4,804c <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    803e:	fe843783          	ld	a5,-24(s0)
    8042:	6398                	ld	a4,0(a5)
    8044:	fe043783          	ld	a5,-32(s0)
    8048:	e398                	sd	a4,0(a5)
    804a:	a82d                	j	8084 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    804c:	fe843783          	ld	a5,-24(s0)
    8050:	4798                	lw	a4,8(a5)
    8052:	fdc42783          	lw	a5,-36(s0)
    8056:	40f707bb          	subw	a5,a4,a5
    805a:	0007871b          	sext.w	a4,a5
    805e:	fe843783          	ld	a5,-24(s0)
    8062:	c798                	sw	a4,8(a5)
        p += p->s.size;
    8064:	fe843783          	ld	a5,-24(s0)
    8068:	479c                	lw	a5,8(a5)
    806a:	1782                	slli	a5,a5,0x20
    806c:	9381                	srli	a5,a5,0x20
    806e:	0792                	slli	a5,a5,0x4
    8070:	fe843703          	ld	a4,-24(s0)
    8074:	97ba                	add	a5,a5,a4
    8076:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    807a:	fe843783          	ld	a5,-24(s0)
    807e:	fdc42703          	lw	a4,-36(s0)
    8082:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    8084:	0000a797          	auipc	a5,0xa
    8088:	bf478793          	addi	a5,a5,-1036 # 11c78 <freep>
    808c:	fe043703          	ld	a4,-32(s0)
    8090:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    8092:	fe843783          	ld	a5,-24(s0)
    8096:	07c1                	addi	a5,a5,16
    8098:	a091                	j	80dc <malloc+0x134>
    }
    if(p == freep)
    809a:	0000a797          	auipc	a5,0xa
    809e:	bde78793          	addi	a5,a5,-1058 # 11c78 <freep>
    80a2:	639c                	ld	a5,0(a5)
    80a4:	fe843703          	ld	a4,-24(s0)
    80a8:	02f71063          	bne	a4,a5,80c8 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    80ac:	fdc42783          	lw	a5,-36(s0)
    80b0:	853e                	mv	a0,a5
    80b2:	00000097          	auipc	ra,0x0
    80b6:	e76080e7          	jalr	-394(ra) # 7f28 <morecore>
    80ba:	fea43423          	sd	a0,-24(s0)
    80be:	fe843783          	ld	a5,-24(s0)
    80c2:	e399                	bnez	a5,80c8 <malloc+0x120>
        return 0;
    80c4:	4781                	li	a5,0
    80c6:	a819                	j	80dc <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    80c8:	fe843783          	ld	a5,-24(s0)
    80cc:	fef43023          	sd	a5,-32(s0)
    80d0:	fe843783          	ld	a5,-24(s0)
    80d4:	639c                	ld	a5,0(a5)
    80d6:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    80da:	b791                	j	801e <malloc+0x76>
  }
}
    80dc:	853e                	mv	a0,a5
    80de:	70e2                	ld	ra,56(sp)
    80e0:	7442                	ld	s0,48(sp)
    80e2:	6121                	addi	sp,sp,64
    80e4:	8082                	ret
