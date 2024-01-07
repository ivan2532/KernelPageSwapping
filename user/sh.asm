
user/_sh:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <runcmd>:
void runcmd(struct cmd*) __attribute__((noreturn));

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
       0:	715d                	addi	sp,sp,-80
       2:	e486                	sd	ra,72(sp)
       4:	e0a2                	sd	s0,64(sp)
       6:	0880                	addi	s0,sp,80
       8:	faa43c23          	sd	a0,-72(s0)
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
       c:	fb843783          	ld	a5,-72(s0)
      10:	e791                	bnez	a5,1c <runcmd+0x1c>
    exit(1);
      12:	4505                	li	a0,1
      14:	00001097          	auipc	ra,0x1
      18:	3f0080e7          	jalr	1008(ra) # 1404 <exit>

  switch(cmd->type){
      1c:	fb843783          	ld	a5,-72(s0)
      20:	439c                	lw	a5,0(a5)
      22:	86be                	mv	a3,a5
      24:	4715                	li	a4,5
      26:	02d76263          	bltu	a4,a3,4a <runcmd+0x4a>
      2a:	00279713          	slli	a4,a5,0x2
      2e:	00002797          	auipc	a5,0x2
      32:	c7278793          	addi	a5,a5,-910 # 1ca0 <malloc+0x17c>
      36:	97ba                	add	a5,a5,a4
      38:	439c                	lw	a5,0(a5)
      3a:	0007871b          	sext.w	a4,a5
      3e:	00002797          	auipc	a5,0x2
      42:	c6278793          	addi	a5,a5,-926 # 1ca0 <malloc+0x17c>
      46:	97ba                	add	a5,a5,a4
      48:	8782                	jr	a5
  default:
    panic("runcmd");
      4a:	00002517          	auipc	a0,0x2
      4e:	c2650513          	addi	a0,a0,-986 # 1c70 <malloc+0x14c>
      52:	00000097          	auipc	ra,0x0
      56:	3d6080e7          	jalr	982(ra) # 428 <panic>

  case EXEC:
    ecmd = (struct execcmd*)cmd;
      5a:	fb843783          	ld	a5,-72(s0)
      5e:	fcf43423          	sd	a5,-56(s0)
    if(ecmd->argv[0] == 0)
      62:	fc843783          	ld	a5,-56(s0)
      66:	679c                	ld	a5,8(a5)
      68:	e791                	bnez	a5,74 <runcmd+0x74>
      exit(1);
      6a:	4505                	li	a0,1
      6c:	00001097          	auipc	ra,0x1
      70:	398080e7          	jalr	920(ra) # 1404 <exit>
    exec(ecmd->argv[0], ecmd->argv);
      74:	fc843783          	ld	a5,-56(s0)
      78:	6798                	ld	a4,8(a5)
      7a:	fc843783          	ld	a5,-56(s0)
      7e:	07a1                	addi	a5,a5,8
      80:	85be                	mv	a1,a5
      82:	853a                	mv	a0,a4
      84:	00001097          	auipc	ra,0x1
      88:	3b8080e7          	jalr	952(ra) # 143c <exec>
    fprintf(2, "exec %s failed\n", ecmd->argv[0]);
      8c:	fc843783          	ld	a5,-56(s0)
      90:	679c                	ld	a5,8(a5)
      92:	863e                	mv	a2,a5
      94:	00002597          	auipc	a1,0x2
      98:	be458593          	addi	a1,a1,-1052 # 1c78 <malloc+0x154>
      9c:	4509                	li	a0,2
      9e:	00002097          	auipc	ra,0x2
      a2:	83c080e7          	jalr	-1988(ra) # 18da <fprintf>
    break;
      a6:	a2f9                	j	274 <runcmd+0x274>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
      a8:	fb843783          	ld	a5,-72(s0)
      ac:	fcf43823          	sd	a5,-48(s0)
    close(rcmd->fd);
      b0:	fd043783          	ld	a5,-48(s0)
      b4:	53dc                	lw	a5,36(a5)
      b6:	853e                	mv	a0,a5
      b8:	00001097          	auipc	ra,0x1
      bc:	374080e7          	jalr	884(ra) # 142c <close>
    if(open(rcmd->file, rcmd->mode) < 0){
      c0:	fd043783          	ld	a5,-48(s0)
      c4:	6b98                	ld	a4,16(a5)
      c6:	fd043783          	ld	a5,-48(s0)
      ca:	539c                	lw	a5,32(a5)
      cc:	85be                	mv	a1,a5
      ce:	853a                	mv	a0,a4
      d0:	00001097          	auipc	ra,0x1
      d4:	374080e7          	jalr	884(ra) # 1444 <open>
      d8:	87aa                	mv	a5,a0
      da:	0207d463          	bgez	a5,102 <runcmd+0x102>
      fprintf(2, "open %s failed\n", rcmd->file);
      de:	fd043783          	ld	a5,-48(s0)
      e2:	6b9c                	ld	a5,16(a5)
      e4:	863e                	mv	a2,a5
      e6:	00002597          	auipc	a1,0x2
      ea:	ba258593          	addi	a1,a1,-1118 # 1c88 <malloc+0x164>
      ee:	4509                	li	a0,2
      f0:	00001097          	auipc	ra,0x1
      f4:	7ea080e7          	jalr	2026(ra) # 18da <fprintf>
      exit(1);
      f8:	4505                	li	a0,1
      fa:	00001097          	auipc	ra,0x1
      fe:	30a080e7          	jalr	778(ra) # 1404 <exit>
    }
    runcmd(rcmd->cmd);
     102:	fd043783          	ld	a5,-48(s0)
     106:	679c                	ld	a5,8(a5)
     108:	853e                	mv	a0,a5
     10a:	00000097          	auipc	ra,0x0
     10e:	ef6080e7          	jalr	-266(ra) # 0 <runcmd>
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
     112:	fb843783          	ld	a5,-72(s0)
     116:	fef43023          	sd	a5,-32(s0)
    if(fork1() == 0)
     11a:	00000097          	auipc	ra,0x0
     11e:	33a080e7          	jalr	826(ra) # 454 <fork1>
     122:	87aa                	mv	a5,a0
     124:	eb89                	bnez	a5,136 <runcmd+0x136>
      runcmd(lcmd->left);
     126:	fe043783          	ld	a5,-32(s0)
     12a:	679c                	ld	a5,8(a5)
     12c:	853e                	mv	a0,a5
     12e:	00000097          	auipc	ra,0x0
     132:	ed2080e7          	jalr	-302(ra) # 0 <runcmd>
    wait(0);
     136:	4501                	li	a0,0
     138:	00001097          	auipc	ra,0x1
     13c:	2d4080e7          	jalr	724(ra) # 140c <wait>
    runcmd(lcmd->right);
     140:	fe043783          	ld	a5,-32(s0)
     144:	6b9c                	ld	a5,16(a5)
     146:	853e                	mv	a0,a5
     148:	00000097          	auipc	ra,0x0
     14c:	eb8080e7          	jalr	-328(ra) # 0 <runcmd>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     150:	fb843783          	ld	a5,-72(s0)
     154:	fcf43c23          	sd	a5,-40(s0)
    if(pipe(p) < 0)
     158:	fc040793          	addi	a5,s0,-64
     15c:	853e                	mv	a0,a5
     15e:	00001097          	auipc	ra,0x1
     162:	2b6080e7          	jalr	694(ra) # 1414 <pipe>
     166:	87aa                	mv	a5,a0
     168:	0007da63          	bgez	a5,17c <runcmd+0x17c>
      panic("pipe");
     16c:	00002517          	auipc	a0,0x2
     170:	b2c50513          	addi	a0,a0,-1236 # 1c98 <malloc+0x174>
     174:	00000097          	auipc	ra,0x0
     178:	2b4080e7          	jalr	692(ra) # 428 <panic>
    if(fork1() == 0){
     17c:	00000097          	auipc	ra,0x0
     180:	2d8080e7          	jalr	728(ra) # 454 <fork1>
     184:	87aa                	mv	a5,a0
     186:	e3b9                	bnez	a5,1cc <runcmd+0x1cc>
      close(1);
     188:	4505                	li	a0,1
     18a:	00001097          	auipc	ra,0x1
     18e:	2a2080e7          	jalr	674(ra) # 142c <close>
      dup(p[1]);
     192:	fc442783          	lw	a5,-60(s0)
     196:	853e                	mv	a0,a5
     198:	00001097          	auipc	ra,0x1
     19c:	2e4080e7          	jalr	740(ra) # 147c <dup>
      close(p[0]);
     1a0:	fc042783          	lw	a5,-64(s0)
     1a4:	853e                	mv	a0,a5
     1a6:	00001097          	auipc	ra,0x1
     1aa:	286080e7          	jalr	646(ra) # 142c <close>
      close(p[1]);
     1ae:	fc442783          	lw	a5,-60(s0)
     1b2:	853e                	mv	a0,a5
     1b4:	00001097          	auipc	ra,0x1
     1b8:	278080e7          	jalr	632(ra) # 142c <close>
      runcmd(pcmd->left);
     1bc:	fd843783          	ld	a5,-40(s0)
     1c0:	679c                	ld	a5,8(a5)
     1c2:	853e                	mv	a0,a5
     1c4:	00000097          	auipc	ra,0x0
     1c8:	e3c080e7          	jalr	-452(ra) # 0 <runcmd>
    }
    if(fork1() == 0){
     1cc:	00000097          	auipc	ra,0x0
     1d0:	288080e7          	jalr	648(ra) # 454 <fork1>
     1d4:	87aa                	mv	a5,a0
     1d6:	e3b9                	bnez	a5,21c <runcmd+0x21c>
      close(0);
     1d8:	4501                	li	a0,0
     1da:	00001097          	auipc	ra,0x1
     1de:	252080e7          	jalr	594(ra) # 142c <close>
      dup(p[0]);
     1e2:	fc042783          	lw	a5,-64(s0)
     1e6:	853e                	mv	a0,a5
     1e8:	00001097          	auipc	ra,0x1
     1ec:	294080e7          	jalr	660(ra) # 147c <dup>
      close(p[0]);
     1f0:	fc042783          	lw	a5,-64(s0)
     1f4:	853e                	mv	a0,a5
     1f6:	00001097          	auipc	ra,0x1
     1fa:	236080e7          	jalr	566(ra) # 142c <close>
      close(p[1]);
     1fe:	fc442783          	lw	a5,-60(s0)
     202:	853e                	mv	a0,a5
     204:	00001097          	auipc	ra,0x1
     208:	228080e7          	jalr	552(ra) # 142c <close>
      runcmd(pcmd->right);
     20c:	fd843783          	ld	a5,-40(s0)
     210:	6b9c                	ld	a5,16(a5)
     212:	853e                	mv	a0,a5
     214:	00000097          	auipc	ra,0x0
     218:	dec080e7          	jalr	-532(ra) # 0 <runcmd>
    }
    close(p[0]);
     21c:	fc042783          	lw	a5,-64(s0)
     220:	853e                	mv	a0,a5
     222:	00001097          	auipc	ra,0x1
     226:	20a080e7          	jalr	522(ra) # 142c <close>
    close(p[1]);
     22a:	fc442783          	lw	a5,-60(s0)
     22e:	853e                	mv	a0,a5
     230:	00001097          	auipc	ra,0x1
     234:	1fc080e7          	jalr	508(ra) # 142c <close>
    wait(0);
     238:	4501                	li	a0,0
     23a:	00001097          	auipc	ra,0x1
     23e:	1d2080e7          	jalr	466(ra) # 140c <wait>
    wait(0);
     242:	4501                	li	a0,0
     244:	00001097          	auipc	ra,0x1
     248:	1c8080e7          	jalr	456(ra) # 140c <wait>
    break;
     24c:	a025                	j	274 <runcmd+0x274>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     24e:	fb843783          	ld	a5,-72(s0)
     252:	fef43423          	sd	a5,-24(s0)
    if(fork1() == 0)
     256:	00000097          	auipc	ra,0x0
     25a:	1fe080e7          	jalr	510(ra) # 454 <fork1>
     25e:	87aa                	mv	a5,a0
     260:	eb89                	bnez	a5,272 <runcmd+0x272>
      runcmd(bcmd->cmd);
     262:	fe843783          	ld	a5,-24(s0)
     266:	679c                	ld	a5,8(a5)
     268:	853e                	mv	a0,a5
     26a:	00000097          	auipc	ra,0x0
     26e:	d96080e7          	jalr	-618(ra) # 0 <runcmd>
    break;
     272:	0001                	nop
  }
  exit(0);
     274:	4501                	li	a0,0
     276:	00001097          	auipc	ra,0x1
     27a:	18e080e7          	jalr	398(ra) # 1404 <exit>

000000000000027e <getcmd>:
}

int
getcmd(char *buf, int nbuf)
{
     27e:	1101                	addi	sp,sp,-32
     280:	ec06                	sd	ra,24(sp)
     282:	e822                	sd	s0,16(sp)
     284:	1000                	addi	s0,sp,32
     286:	fea43423          	sd	a0,-24(s0)
     28a:	87ae                	mv	a5,a1
     28c:	fef42223          	sw	a5,-28(s0)
  write(2, "$ ", 2);
     290:	4609                	li	a2,2
     292:	00002597          	auipc	a1,0x2
     296:	a2658593          	addi	a1,a1,-1498 # 1cb8 <malloc+0x194>
     29a:	4509                	li	a0,2
     29c:	00001097          	auipc	ra,0x1
     2a0:	188080e7          	jalr	392(ra) # 1424 <write>
  memset(buf, 0, nbuf);
     2a4:	fe442783          	lw	a5,-28(s0)
     2a8:	863e                	mv	a2,a5
     2aa:	4581                	li	a1,0
     2ac:	fe843503          	ld	a0,-24(s0)
     2b0:	00001097          	auipc	ra,0x1
     2b4:	daa080e7          	jalr	-598(ra) # 105a <memset>
  gets(buf, nbuf);
     2b8:	fe442783          	lw	a5,-28(s0)
     2bc:	85be                	mv	a1,a5
     2be:	fe843503          	ld	a0,-24(s0)
     2c2:	00001097          	auipc	ra,0x1
     2c6:	e42080e7          	jalr	-446(ra) # 1104 <gets>
  if(buf[0] == 0) // EOF
     2ca:	fe843783          	ld	a5,-24(s0)
     2ce:	0007c783          	lbu	a5,0(a5)
     2d2:	e399                	bnez	a5,2d8 <getcmd+0x5a>
    return -1;
     2d4:	57fd                	li	a5,-1
     2d6:	a011                	j	2da <getcmd+0x5c>
  return 0;
     2d8:	4781                	li	a5,0
}
     2da:	853e                	mv	a0,a5
     2dc:	60e2                	ld	ra,24(sp)
     2de:	6442                	ld	s0,16(sp)
     2e0:	6105                	addi	sp,sp,32
     2e2:	8082                	ret

00000000000002e4 <main>:

int
main(void)
{
     2e4:	1101                	addi	sp,sp,-32
     2e6:	ec06                	sd	ra,24(sp)
     2e8:	e822                	sd	s0,16(sp)
     2ea:	1000                	addi	s0,sp,32
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
     2ec:	a005                	j	30c <main+0x28>
    if(fd >= 3){
     2ee:	fec42783          	lw	a5,-20(s0)
     2f2:	0007871b          	sext.w	a4,a5
     2f6:	4789                	li	a5,2
     2f8:	00e7da63          	bge	a5,a4,30c <main+0x28>
      close(fd);
     2fc:	fec42783          	lw	a5,-20(s0)
     300:	853e                	mv	a0,a5
     302:	00001097          	auipc	ra,0x1
     306:	12a080e7          	jalr	298(ra) # 142c <close>
      break;
     30a:	a015                	j	32e <main+0x4a>
  while((fd = open("console", O_RDWR)) >= 0){
     30c:	4589                	li	a1,2
     30e:	00002517          	auipc	a0,0x2
     312:	9b250513          	addi	a0,a0,-1614 # 1cc0 <malloc+0x19c>
     316:	00001097          	auipc	ra,0x1
     31a:	12e080e7          	jalr	302(ra) # 1444 <open>
     31e:	87aa                	mv	a5,a0
     320:	fef42623          	sw	a5,-20(s0)
     324:	fec42783          	lw	a5,-20(s0)
     328:	2781                	sext.w	a5,a5
     32a:	fc07d2e3          	bgez	a5,2ee <main+0xa>
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
     32e:	a8d9                	j	404 <main+0x120>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
     330:	00002797          	auipc	a5,0x2
     334:	d0078793          	addi	a5,a5,-768 # 2030 <buf.1134>
     338:	0007c783          	lbu	a5,0(a5)
     33c:	873e                	mv	a4,a5
     33e:	06300793          	li	a5,99
     342:	08f71863          	bne	a4,a5,3d2 <main+0xee>
     346:	00002797          	auipc	a5,0x2
     34a:	cea78793          	addi	a5,a5,-790 # 2030 <buf.1134>
     34e:	0017c783          	lbu	a5,1(a5)
     352:	873e                	mv	a4,a5
     354:	06400793          	li	a5,100
     358:	06f71d63          	bne	a4,a5,3d2 <main+0xee>
     35c:	00002797          	auipc	a5,0x2
     360:	cd478793          	addi	a5,a5,-812 # 2030 <buf.1134>
     364:	0027c783          	lbu	a5,2(a5)
     368:	873e                	mv	a4,a5
     36a:	02000793          	li	a5,32
     36e:	06f71263          	bne	a4,a5,3d2 <main+0xee>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
     372:	00002517          	auipc	a0,0x2
     376:	cbe50513          	addi	a0,a0,-834 # 2030 <buf.1134>
     37a:	00001097          	auipc	ra,0x1
     37e:	caa080e7          	jalr	-854(ra) # 1024 <strlen>
     382:	87aa                	mv	a5,a0
     384:	2781                	sext.w	a5,a5
     386:	37fd                	addiw	a5,a5,-1
     388:	2781                	sext.w	a5,a5
     38a:	00002717          	auipc	a4,0x2
     38e:	ca670713          	addi	a4,a4,-858 # 2030 <buf.1134>
     392:	1782                	slli	a5,a5,0x20
     394:	9381                	srli	a5,a5,0x20
     396:	97ba                	add	a5,a5,a4
     398:	00078023          	sb	zero,0(a5)
      if(chdir(buf+3) < 0)
     39c:	00002797          	auipc	a5,0x2
     3a0:	c9778793          	addi	a5,a5,-873 # 2033 <buf.1134+0x3>
     3a4:	853e                	mv	a0,a5
     3a6:	00001097          	auipc	ra,0x1
     3aa:	0ce080e7          	jalr	206(ra) # 1474 <chdir>
     3ae:	87aa                	mv	a5,a0
     3b0:	0407da63          	bgez	a5,404 <main+0x120>
        fprintf(2, "cannot cd %s\n", buf+3);
     3b4:	00002797          	auipc	a5,0x2
     3b8:	c7f78793          	addi	a5,a5,-897 # 2033 <buf.1134+0x3>
     3bc:	863e                	mv	a2,a5
     3be:	00002597          	auipc	a1,0x2
     3c2:	90a58593          	addi	a1,a1,-1782 # 1cc8 <malloc+0x1a4>
     3c6:	4509                	li	a0,2
     3c8:	00001097          	auipc	ra,0x1
     3cc:	512080e7          	jalr	1298(ra) # 18da <fprintf>
      continue;
     3d0:	a815                	j	404 <main+0x120>
    }
    if(fork1() == 0)
     3d2:	00000097          	auipc	ra,0x0
     3d6:	082080e7          	jalr	130(ra) # 454 <fork1>
     3da:	87aa                	mv	a5,a0
     3dc:	ef99                	bnez	a5,3fa <main+0x116>
      runcmd(parsecmd(buf));
     3de:	00002517          	auipc	a0,0x2
     3e2:	c5250513          	addi	a0,a0,-942 # 2030 <buf.1134>
     3e6:	00000097          	auipc	ra,0x0
     3ea:	4e2080e7          	jalr	1250(ra) # 8c8 <parsecmd>
     3ee:	87aa                	mv	a5,a0
     3f0:	853e                	mv	a0,a5
     3f2:	00000097          	auipc	ra,0x0
     3f6:	c0e080e7          	jalr	-1010(ra) # 0 <runcmd>
    wait(0);
     3fa:	4501                	li	a0,0
     3fc:	00001097          	auipc	ra,0x1
     400:	010080e7          	jalr	16(ra) # 140c <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
     404:	06400593          	li	a1,100
     408:	00002517          	auipc	a0,0x2
     40c:	c2850513          	addi	a0,a0,-984 # 2030 <buf.1134>
     410:	00000097          	auipc	ra,0x0
     414:	e6e080e7          	jalr	-402(ra) # 27e <getcmd>
     418:	87aa                	mv	a5,a0
     41a:	f007dbe3          	bgez	a5,330 <main+0x4c>
  }
  exit(0);
     41e:	4501                	li	a0,0
     420:	00001097          	auipc	ra,0x1
     424:	fe4080e7          	jalr	-28(ra) # 1404 <exit>

0000000000000428 <panic>:
}

void
panic(char *s)
{
     428:	1101                	addi	sp,sp,-32
     42a:	ec06                	sd	ra,24(sp)
     42c:	e822                	sd	s0,16(sp)
     42e:	1000                	addi	s0,sp,32
     430:	fea43423          	sd	a0,-24(s0)
  fprintf(2, "%s\n", s);
     434:	fe843603          	ld	a2,-24(s0)
     438:	00002597          	auipc	a1,0x2
     43c:	8a058593          	addi	a1,a1,-1888 # 1cd8 <malloc+0x1b4>
     440:	4509                	li	a0,2
     442:	00001097          	auipc	ra,0x1
     446:	498080e7          	jalr	1176(ra) # 18da <fprintf>
  exit(1);
     44a:	4505                	li	a0,1
     44c:	00001097          	auipc	ra,0x1
     450:	fb8080e7          	jalr	-72(ra) # 1404 <exit>

0000000000000454 <fork1>:
}

int
fork1(void)
{
     454:	1101                	addi	sp,sp,-32
     456:	ec06                	sd	ra,24(sp)
     458:	e822                	sd	s0,16(sp)
     45a:	1000                	addi	s0,sp,32
  int pid;

  pid = fork();
     45c:	00001097          	auipc	ra,0x1
     460:	fa0080e7          	jalr	-96(ra) # 13fc <fork>
     464:	87aa                	mv	a5,a0
     466:	fef42623          	sw	a5,-20(s0)
  if(pid == -1)
     46a:	fec42783          	lw	a5,-20(s0)
     46e:	0007871b          	sext.w	a4,a5
     472:	57fd                	li	a5,-1
     474:	00f71a63          	bne	a4,a5,488 <fork1+0x34>
    panic("fork");
     478:	00002517          	auipc	a0,0x2
     47c:	86850513          	addi	a0,a0,-1944 # 1ce0 <malloc+0x1bc>
     480:	00000097          	auipc	ra,0x0
     484:	fa8080e7          	jalr	-88(ra) # 428 <panic>
  return pid;
     488:	fec42783          	lw	a5,-20(s0)
}
     48c:	853e                	mv	a0,a5
     48e:	60e2                	ld	ra,24(sp)
     490:	6442                	ld	s0,16(sp)
     492:	6105                	addi	sp,sp,32
     494:	8082                	ret

0000000000000496 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     496:	1101                	addi	sp,sp,-32
     498:	ec06                	sd	ra,24(sp)
     49a:	e822                	sd	s0,16(sp)
     49c:	1000                	addi	s0,sp,32
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     49e:	0a800513          	li	a0,168
     4a2:	00001097          	auipc	ra,0x1
     4a6:	682080e7          	jalr	1666(ra) # 1b24 <malloc>
     4aa:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     4ae:	0a800613          	li	a2,168
     4b2:	4581                	li	a1,0
     4b4:	fe843503          	ld	a0,-24(s0)
     4b8:	00001097          	auipc	ra,0x1
     4bc:	ba2080e7          	jalr	-1118(ra) # 105a <memset>
  cmd->type = EXEC;
     4c0:	fe843783          	ld	a5,-24(s0)
     4c4:	4705                	li	a4,1
     4c6:	c398                	sw	a4,0(a5)
  return (struct cmd*)cmd;
     4c8:	fe843783          	ld	a5,-24(s0)
}
     4cc:	853e                	mv	a0,a5
     4ce:	60e2                	ld	ra,24(sp)
     4d0:	6442                	ld	s0,16(sp)
     4d2:	6105                	addi	sp,sp,32
     4d4:	8082                	ret

00000000000004d6 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     4d6:	7139                	addi	sp,sp,-64
     4d8:	fc06                	sd	ra,56(sp)
     4da:	f822                	sd	s0,48(sp)
     4dc:	0080                	addi	s0,sp,64
     4de:	fca43c23          	sd	a0,-40(s0)
     4e2:	fcb43823          	sd	a1,-48(s0)
     4e6:	fcc43423          	sd	a2,-56(s0)
     4ea:	87b6                	mv	a5,a3
     4ec:	fcf42223          	sw	a5,-60(s0)
     4f0:	87ba                	mv	a5,a4
     4f2:	fcf42023          	sw	a5,-64(s0)
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f6:	02800513          	li	a0,40
     4fa:	00001097          	auipc	ra,0x1
     4fe:	62a080e7          	jalr	1578(ra) # 1b24 <malloc>
     502:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     506:	02800613          	li	a2,40
     50a:	4581                	li	a1,0
     50c:	fe843503          	ld	a0,-24(s0)
     510:	00001097          	auipc	ra,0x1
     514:	b4a080e7          	jalr	-1206(ra) # 105a <memset>
  cmd->type = REDIR;
     518:	fe843783          	ld	a5,-24(s0)
     51c:	4709                	li	a4,2
     51e:	c398                	sw	a4,0(a5)
  cmd->cmd = subcmd;
     520:	fe843783          	ld	a5,-24(s0)
     524:	fd843703          	ld	a4,-40(s0)
     528:	e798                	sd	a4,8(a5)
  cmd->file = file;
     52a:	fe843783          	ld	a5,-24(s0)
     52e:	fd043703          	ld	a4,-48(s0)
     532:	eb98                	sd	a4,16(a5)
  cmd->efile = efile;
     534:	fe843783          	ld	a5,-24(s0)
     538:	fc843703          	ld	a4,-56(s0)
     53c:	ef98                	sd	a4,24(a5)
  cmd->mode = mode;
     53e:	fe843783          	ld	a5,-24(s0)
     542:	fc442703          	lw	a4,-60(s0)
     546:	d398                	sw	a4,32(a5)
  cmd->fd = fd;
     548:	fe843783          	ld	a5,-24(s0)
     54c:	fc042703          	lw	a4,-64(s0)
     550:	d3d8                	sw	a4,36(a5)
  return (struct cmd*)cmd;
     552:	fe843783          	ld	a5,-24(s0)
}
     556:	853e                	mv	a0,a5
     558:	70e2                	ld	ra,56(sp)
     55a:	7442                	ld	s0,48(sp)
     55c:	6121                	addi	sp,sp,64
     55e:	8082                	ret

0000000000000560 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     560:	7179                	addi	sp,sp,-48
     562:	f406                	sd	ra,40(sp)
     564:	f022                	sd	s0,32(sp)
     566:	1800                	addi	s0,sp,48
     568:	fca43c23          	sd	a0,-40(s0)
     56c:	fcb43823          	sd	a1,-48(s0)
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     570:	4561                	li	a0,24
     572:	00001097          	auipc	ra,0x1
     576:	5b2080e7          	jalr	1458(ra) # 1b24 <malloc>
     57a:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     57e:	4661                	li	a2,24
     580:	4581                	li	a1,0
     582:	fe843503          	ld	a0,-24(s0)
     586:	00001097          	auipc	ra,0x1
     58a:	ad4080e7          	jalr	-1324(ra) # 105a <memset>
  cmd->type = PIPE;
     58e:	fe843783          	ld	a5,-24(s0)
     592:	470d                	li	a4,3
     594:	c398                	sw	a4,0(a5)
  cmd->left = left;
     596:	fe843783          	ld	a5,-24(s0)
     59a:	fd843703          	ld	a4,-40(s0)
     59e:	e798                	sd	a4,8(a5)
  cmd->right = right;
     5a0:	fe843783          	ld	a5,-24(s0)
     5a4:	fd043703          	ld	a4,-48(s0)
     5a8:	eb98                	sd	a4,16(a5)
  return (struct cmd*)cmd;
     5aa:	fe843783          	ld	a5,-24(s0)
}
     5ae:	853e                	mv	a0,a5
     5b0:	70a2                	ld	ra,40(sp)
     5b2:	7402                	ld	s0,32(sp)
     5b4:	6145                	addi	sp,sp,48
     5b6:	8082                	ret

00000000000005b8 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5b8:	7179                	addi	sp,sp,-48
     5ba:	f406                	sd	ra,40(sp)
     5bc:	f022                	sd	s0,32(sp)
     5be:	1800                	addi	s0,sp,48
     5c0:	fca43c23          	sd	a0,-40(s0)
     5c4:	fcb43823          	sd	a1,-48(s0)
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5c8:	4561                	li	a0,24
     5ca:	00001097          	auipc	ra,0x1
     5ce:	55a080e7          	jalr	1370(ra) # 1b24 <malloc>
     5d2:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     5d6:	4661                	li	a2,24
     5d8:	4581                	li	a1,0
     5da:	fe843503          	ld	a0,-24(s0)
     5de:	00001097          	auipc	ra,0x1
     5e2:	a7c080e7          	jalr	-1412(ra) # 105a <memset>
  cmd->type = LIST;
     5e6:	fe843783          	ld	a5,-24(s0)
     5ea:	4711                	li	a4,4
     5ec:	c398                	sw	a4,0(a5)
  cmd->left = left;
     5ee:	fe843783          	ld	a5,-24(s0)
     5f2:	fd843703          	ld	a4,-40(s0)
     5f6:	e798                	sd	a4,8(a5)
  cmd->right = right;
     5f8:	fe843783          	ld	a5,-24(s0)
     5fc:	fd043703          	ld	a4,-48(s0)
     600:	eb98                	sd	a4,16(a5)
  return (struct cmd*)cmd;
     602:	fe843783          	ld	a5,-24(s0)
}
     606:	853e                	mv	a0,a5
     608:	70a2                	ld	ra,40(sp)
     60a:	7402                	ld	s0,32(sp)
     60c:	6145                	addi	sp,sp,48
     60e:	8082                	ret

0000000000000610 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     610:	7179                	addi	sp,sp,-48
     612:	f406                	sd	ra,40(sp)
     614:	f022                	sd	s0,32(sp)
     616:	1800                	addi	s0,sp,48
     618:	fca43c23          	sd	a0,-40(s0)
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     61c:	4541                	li	a0,16
     61e:	00001097          	auipc	ra,0x1
     622:	506080e7          	jalr	1286(ra) # 1b24 <malloc>
     626:	fea43423          	sd	a0,-24(s0)
  memset(cmd, 0, sizeof(*cmd));
     62a:	4641                	li	a2,16
     62c:	4581                	li	a1,0
     62e:	fe843503          	ld	a0,-24(s0)
     632:	00001097          	auipc	ra,0x1
     636:	a28080e7          	jalr	-1496(ra) # 105a <memset>
  cmd->type = BACK;
     63a:	fe843783          	ld	a5,-24(s0)
     63e:	4715                	li	a4,5
     640:	c398                	sw	a4,0(a5)
  cmd->cmd = subcmd;
     642:	fe843783          	ld	a5,-24(s0)
     646:	fd843703          	ld	a4,-40(s0)
     64a:	e798                	sd	a4,8(a5)
  return (struct cmd*)cmd;
     64c:	fe843783          	ld	a5,-24(s0)
}
     650:	853e                	mv	a0,a5
     652:	70a2                	ld	ra,40(sp)
     654:	7402                	ld	s0,32(sp)
     656:	6145                	addi	sp,sp,48
     658:	8082                	ret

000000000000065a <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     65a:	7139                	addi	sp,sp,-64
     65c:	fc06                	sd	ra,56(sp)
     65e:	f822                	sd	s0,48(sp)
     660:	0080                	addi	s0,sp,64
     662:	fca43c23          	sd	a0,-40(s0)
     666:	fcb43823          	sd	a1,-48(s0)
     66a:	fcc43423          	sd	a2,-56(s0)
     66e:	fcd43023          	sd	a3,-64(s0)
  char *s;
  int ret;

  s = *ps;
     672:	fd843783          	ld	a5,-40(s0)
     676:	639c                	ld	a5,0(a5)
     678:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     67c:	a031                	j	688 <gettoken+0x2e>
    s++;
     67e:	fe843783          	ld	a5,-24(s0)
     682:	0785                	addi	a5,a5,1
     684:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     688:	fe843703          	ld	a4,-24(s0)
     68c:	fd043783          	ld	a5,-48(s0)
     690:	02f77163          	bgeu	a4,a5,6b2 <gettoken+0x58>
     694:	fe843783          	ld	a5,-24(s0)
     698:	0007c783          	lbu	a5,0(a5)
     69c:	85be                	mv	a1,a5
     69e:	00002517          	auipc	a0,0x2
     6a2:	96250513          	addi	a0,a0,-1694 # 2000 <whitespace>
     6a6:	00001097          	auipc	ra,0x1
     6aa:	a14080e7          	jalr	-1516(ra) # 10ba <strchr>
     6ae:	87aa                	mv	a5,a0
     6b0:	f7f9                	bnez	a5,67e <gettoken+0x24>
  if(q)
     6b2:	fc843783          	ld	a5,-56(s0)
     6b6:	c791                	beqz	a5,6c2 <gettoken+0x68>
    *q = s;
     6b8:	fc843783          	ld	a5,-56(s0)
     6bc:	fe843703          	ld	a4,-24(s0)
     6c0:	e398                	sd	a4,0(a5)
  ret = *s;
     6c2:	fe843783          	ld	a5,-24(s0)
     6c6:	0007c783          	lbu	a5,0(a5)
     6ca:	fef42223          	sw	a5,-28(s0)
  switch(*s){
     6ce:	fe843783          	ld	a5,-24(s0)
     6d2:	0007c783          	lbu	a5,0(a5)
     6d6:	2781                	sext.w	a5,a5
     6d8:	86be                	mv	a3,a5
     6da:	07c00713          	li	a4,124
     6de:	04e68b63          	beq	a3,a4,734 <gettoken+0xda>
     6e2:	86be                	mv	a3,a5
     6e4:	07c00713          	li	a4,124
     6e8:	08d74463          	blt	a4,a3,770 <gettoken+0x116>
     6ec:	86be                	mv	a3,a5
     6ee:	03e00713          	li	a4,62
     6f2:	04e68763          	beq	a3,a4,740 <gettoken+0xe6>
     6f6:	86be                	mv	a3,a5
     6f8:	03e00713          	li	a4,62
     6fc:	06d74a63          	blt	a4,a3,770 <gettoken+0x116>
     700:	86be                	mv	a3,a5
     702:	03c00713          	li	a4,60
     706:	06d74563          	blt	a4,a3,770 <gettoken+0x116>
     70a:	86be                	mv	a3,a5
     70c:	03b00713          	li	a4,59
     710:	02e6d263          	bge	a3,a4,734 <gettoken+0xda>
     714:	86be                	mv	a3,a5
     716:	02900713          	li	a4,41
     71a:	04d74b63          	blt	a4,a3,770 <gettoken+0x116>
     71e:	86be                	mv	a3,a5
     720:	02800713          	li	a4,40
     724:	00e6d863          	bge	a3,a4,734 <gettoken+0xda>
     728:	c3dd                	beqz	a5,7ce <gettoken+0x174>
     72a:	873e                	mv	a4,a5
     72c:	02600793          	li	a5,38
     730:	04f71063          	bne	a4,a5,770 <gettoken+0x116>
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
     734:	fe843783          	ld	a5,-24(s0)
     738:	0785                	addi	a5,a5,1
     73a:	fef43423          	sd	a5,-24(s0)
    break;
     73e:	a869                	j	7d8 <gettoken+0x17e>
  case '>':
    s++;
     740:	fe843783          	ld	a5,-24(s0)
     744:	0785                	addi	a5,a5,1
     746:	fef43423          	sd	a5,-24(s0)
    if(*s == '>'){
     74a:	fe843783          	ld	a5,-24(s0)
     74e:	0007c783          	lbu	a5,0(a5)
     752:	873e                	mv	a4,a5
     754:	03e00793          	li	a5,62
     758:	06f71d63          	bne	a4,a5,7d2 <gettoken+0x178>
      ret = '+';
     75c:	02b00793          	li	a5,43
     760:	fef42223          	sw	a5,-28(s0)
      s++;
     764:	fe843783          	ld	a5,-24(s0)
     768:	0785                	addi	a5,a5,1
     76a:	fef43423          	sd	a5,-24(s0)
    }
    break;
     76e:	a095                	j	7d2 <gettoken+0x178>
  default:
    ret = 'a';
     770:	06100793          	li	a5,97
     774:	fef42223          	sw	a5,-28(s0)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     778:	a031                	j	784 <gettoken+0x12a>
      s++;
     77a:	fe843783          	ld	a5,-24(s0)
     77e:	0785                	addi	a5,a5,1
     780:	fef43423          	sd	a5,-24(s0)
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     784:	fe843703          	ld	a4,-24(s0)
     788:	fd043783          	ld	a5,-48(s0)
     78c:	04f77563          	bgeu	a4,a5,7d6 <gettoken+0x17c>
     790:	fe843783          	ld	a5,-24(s0)
     794:	0007c783          	lbu	a5,0(a5)
     798:	85be                	mv	a1,a5
     79a:	00002517          	auipc	a0,0x2
     79e:	86650513          	addi	a0,a0,-1946 # 2000 <whitespace>
     7a2:	00001097          	auipc	ra,0x1
     7a6:	918080e7          	jalr	-1768(ra) # 10ba <strchr>
     7aa:	87aa                	mv	a5,a0
     7ac:	e78d                	bnez	a5,7d6 <gettoken+0x17c>
     7ae:	fe843783          	ld	a5,-24(s0)
     7b2:	0007c783          	lbu	a5,0(a5)
     7b6:	85be                	mv	a1,a5
     7b8:	00002517          	auipc	a0,0x2
     7bc:	85050513          	addi	a0,a0,-1968 # 2008 <symbols>
     7c0:	00001097          	auipc	ra,0x1
     7c4:	8fa080e7          	jalr	-1798(ra) # 10ba <strchr>
     7c8:	87aa                	mv	a5,a0
     7ca:	dbc5                	beqz	a5,77a <gettoken+0x120>
    break;
     7cc:	a029                	j	7d6 <gettoken+0x17c>
    break;
     7ce:	0001                	nop
     7d0:	a021                	j	7d8 <gettoken+0x17e>
    break;
     7d2:	0001                	nop
     7d4:	a011                	j	7d8 <gettoken+0x17e>
    break;
     7d6:	0001                	nop
  }
  if(eq)
     7d8:	fc043783          	ld	a5,-64(s0)
     7dc:	cf81                	beqz	a5,7f4 <gettoken+0x19a>
    *eq = s;
     7de:	fc043783          	ld	a5,-64(s0)
     7e2:	fe843703          	ld	a4,-24(s0)
     7e6:	e398                	sd	a4,0(a5)

  while(s < es && strchr(whitespace, *s))
     7e8:	a031                	j	7f4 <gettoken+0x19a>
    s++;
     7ea:	fe843783          	ld	a5,-24(s0)
     7ee:	0785                	addi	a5,a5,1
     7f0:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     7f4:	fe843703          	ld	a4,-24(s0)
     7f8:	fd043783          	ld	a5,-48(s0)
     7fc:	02f77163          	bgeu	a4,a5,81e <gettoken+0x1c4>
     800:	fe843783          	ld	a5,-24(s0)
     804:	0007c783          	lbu	a5,0(a5)
     808:	85be                	mv	a1,a5
     80a:	00001517          	auipc	a0,0x1
     80e:	7f650513          	addi	a0,a0,2038 # 2000 <whitespace>
     812:	00001097          	auipc	ra,0x1
     816:	8a8080e7          	jalr	-1880(ra) # 10ba <strchr>
     81a:	87aa                	mv	a5,a0
     81c:	f7f9                	bnez	a5,7ea <gettoken+0x190>
  *ps = s;
     81e:	fd843783          	ld	a5,-40(s0)
     822:	fe843703          	ld	a4,-24(s0)
     826:	e398                	sd	a4,0(a5)
  return ret;
     828:	fe442783          	lw	a5,-28(s0)
}
     82c:	853e                	mv	a0,a5
     82e:	70e2                	ld	ra,56(sp)
     830:	7442                	ld	s0,48(sp)
     832:	6121                	addi	sp,sp,64
     834:	8082                	ret

0000000000000836 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     836:	7139                	addi	sp,sp,-64
     838:	fc06                	sd	ra,56(sp)
     83a:	f822                	sd	s0,48(sp)
     83c:	0080                	addi	s0,sp,64
     83e:	fca43c23          	sd	a0,-40(s0)
     842:	fcb43823          	sd	a1,-48(s0)
     846:	fcc43423          	sd	a2,-56(s0)
  char *s;

  s = *ps;
     84a:	fd843783          	ld	a5,-40(s0)
     84e:	639c                	ld	a5,0(a5)
     850:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     854:	a031                	j	860 <peek+0x2a>
    s++;
     856:	fe843783          	ld	a5,-24(s0)
     85a:	0785                	addi	a5,a5,1
     85c:	fef43423          	sd	a5,-24(s0)
  while(s < es && strchr(whitespace, *s))
     860:	fe843703          	ld	a4,-24(s0)
     864:	fd043783          	ld	a5,-48(s0)
     868:	02f77163          	bgeu	a4,a5,88a <peek+0x54>
     86c:	fe843783          	ld	a5,-24(s0)
     870:	0007c783          	lbu	a5,0(a5)
     874:	85be                	mv	a1,a5
     876:	00001517          	auipc	a0,0x1
     87a:	78a50513          	addi	a0,a0,1930 # 2000 <whitespace>
     87e:	00001097          	auipc	ra,0x1
     882:	83c080e7          	jalr	-1988(ra) # 10ba <strchr>
     886:	87aa                	mv	a5,a0
     888:	f7f9                	bnez	a5,856 <peek+0x20>
  *ps = s;
     88a:	fd843783          	ld	a5,-40(s0)
     88e:	fe843703          	ld	a4,-24(s0)
     892:	e398                	sd	a4,0(a5)
  return *s && strchr(toks, *s);
     894:	fe843783          	ld	a5,-24(s0)
     898:	0007c783          	lbu	a5,0(a5)
     89c:	c385                	beqz	a5,8bc <peek+0x86>
     89e:	fe843783          	ld	a5,-24(s0)
     8a2:	0007c783          	lbu	a5,0(a5)
     8a6:	85be                	mv	a1,a5
     8a8:	fc843503          	ld	a0,-56(s0)
     8ac:	00001097          	auipc	ra,0x1
     8b0:	80e080e7          	jalr	-2034(ra) # 10ba <strchr>
     8b4:	87aa                	mv	a5,a0
     8b6:	c399                	beqz	a5,8bc <peek+0x86>
     8b8:	4785                	li	a5,1
     8ba:	a011                	j	8be <peek+0x88>
     8bc:	4781                	li	a5,0
}
     8be:	853e                	mv	a0,a5
     8c0:	70e2                	ld	ra,56(sp)
     8c2:	7442                	ld	s0,48(sp)
     8c4:	6121                	addi	sp,sp,64
     8c6:	8082                	ret

00000000000008c8 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     8c8:	7139                	addi	sp,sp,-64
     8ca:	fc06                	sd	ra,56(sp)
     8cc:	f822                	sd	s0,48(sp)
     8ce:	f426                	sd	s1,40(sp)
     8d0:	0080                	addi	s0,sp,64
     8d2:	fca43423          	sd	a0,-56(s0)
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     8d6:	fc843483          	ld	s1,-56(s0)
     8da:	fc843783          	ld	a5,-56(s0)
     8de:	853e                	mv	a0,a5
     8e0:	00000097          	auipc	ra,0x0
     8e4:	744080e7          	jalr	1860(ra) # 1024 <strlen>
     8e8:	87aa                	mv	a5,a0
     8ea:	2781                	sext.w	a5,a5
     8ec:	1782                	slli	a5,a5,0x20
     8ee:	9381                	srli	a5,a5,0x20
     8f0:	97a6                	add	a5,a5,s1
     8f2:	fcf43c23          	sd	a5,-40(s0)
  cmd = parseline(&s, es);
     8f6:	fc840793          	addi	a5,s0,-56
     8fa:	fd843583          	ld	a1,-40(s0)
     8fe:	853e                	mv	a0,a5
     900:	00000097          	auipc	ra,0x0
     904:	076080e7          	jalr	118(ra) # 976 <parseline>
     908:	fca43823          	sd	a0,-48(s0)
  peek(&s, es, "");
     90c:	fc840793          	addi	a5,s0,-56
     910:	00001617          	auipc	a2,0x1
     914:	3d860613          	addi	a2,a2,984 # 1ce8 <malloc+0x1c4>
     918:	fd843583          	ld	a1,-40(s0)
     91c:	853e                	mv	a0,a5
     91e:	00000097          	auipc	ra,0x0
     922:	f18080e7          	jalr	-232(ra) # 836 <peek>
  if(s != es){
     926:	fc843783          	ld	a5,-56(s0)
     92a:	fd843703          	ld	a4,-40(s0)
     92e:	02f70663          	beq	a4,a5,95a <parsecmd+0x92>
    fprintf(2, "leftovers: %s\n", s);
     932:	fc843783          	ld	a5,-56(s0)
     936:	863e                	mv	a2,a5
     938:	00001597          	auipc	a1,0x1
     93c:	3b858593          	addi	a1,a1,952 # 1cf0 <malloc+0x1cc>
     940:	4509                	li	a0,2
     942:	00001097          	auipc	ra,0x1
     946:	f98080e7          	jalr	-104(ra) # 18da <fprintf>
    panic("syntax");
     94a:	00001517          	auipc	a0,0x1
     94e:	3b650513          	addi	a0,a0,950 # 1d00 <malloc+0x1dc>
     952:	00000097          	auipc	ra,0x0
     956:	ad6080e7          	jalr	-1322(ra) # 428 <panic>
  }
  nulterminate(cmd);
     95a:	fd043503          	ld	a0,-48(s0)
     95e:	00000097          	auipc	ra,0x0
     962:	4da080e7          	jalr	1242(ra) # e38 <nulterminate>
  return cmd;
     966:	fd043783          	ld	a5,-48(s0)
}
     96a:	853e                	mv	a0,a5
     96c:	70e2                	ld	ra,56(sp)
     96e:	7442                	ld	s0,48(sp)
     970:	74a2                	ld	s1,40(sp)
     972:	6121                	addi	sp,sp,64
     974:	8082                	ret

0000000000000976 <parseline>:

struct cmd*
parseline(char **ps, char *es)
{
     976:	7179                	addi	sp,sp,-48
     978:	f406                	sd	ra,40(sp)
     97a:	f022                	sd	s0,32(sp)
     97c:	1800                	addi	s0,sp,48
     97e:	fca43c23          	sd	a0,-40(s0)
     982:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     986:	fd043583          	ld	a1,-48(s0)
     98a:	fd843503          	ld	a0,-40(s0)
     98e:	00000097          	auipc	ra,0x0
     992:	0b0080e7          	jalr	176(ra) # a3e <parsepipe>
     996:	fea43423          	sd	a0,-24(s0)
  while(peek(ps, es, "&")){
     99a:	a01d                	j	9c0 <parseline+0x4a>
    gettoken(ps, es, 0, 0);
     99c:	4681                	li	a3,0
     99e:	4601                	li	a2,0
     9a0:	fd043583          	ld	a1,-48(s0)
     9a4:	fd843503          	ld	a0,-40(s0)
     9a8:	00000097          	auipc	ra,0x0
     9ac:	cb2080e7          	jalr	-846(ra) # 65a <gettoken>
    cmd = backcmd(cmd);
     9b0:	fe843503          	ld	a0,-24(s0)
     9b4:	00000097          	auipc	ra,0x0
     9b8:	c5c080e7          	jalr	-932(ra) # 610 <backcmd>
     9bc:	fea43423          	sd	a0,-24(s0)
  while(peek(ps, es, "&")){
     9c0:	00001617          	auipc	a2,0x1
     9c4:	34860613          	addi	a2,a2,840 # 1d08 <malloc+0x1e4>
     9c8:	fd043583          	ld	a1,-48(s0)
     9cc:	fd843503          	ld	a0,-40(s0)
     9d0:	00000097          	auipc	ra,0x0
     9d4:	e66080e7          	jalr	-410(ra) # 836 <peek>
     9d8:	87aa                	mv	a5,a0
     9da:	f3e9                	bnez	a5,99c <parseline+0x26>
  }
  if(peek(ps, es, ";")){
     9dc:	00001617          	auipc	a2,0x1
     9e0:	33460613          	addi	a2,a2,820 # 1d10 <malloc+0x1ec>
     9e4:	fd043583          	ld	a1,-48(s0)
     9e8:	fd843503          	ld	a0,-40(s0)
     9ec:	00000097          	auipc	ra,0x0
     9f0:	e4a080e7          	jalr	-438(ra) # 836 <peek>
     9f4:	87aa                	mv	a5,a0
     9f6:	cf8d                	beqz	a5,a30 <parseline+0xba>
    gettoken(ps, es, 0, 0);
     9f8:	4681                	li	a3,0
     9fa:	4601                	li	a2,0
     9fc:	fd043583          	ld	a1,-48(s0)
     a00:	fd843503          	ld	a0,-40(s0)
     a04:	00000097          	auipc	ra,0x0
     a08:	c56080e7          	jalr	-938(ra) # 65a <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     a0c:	fd043583          	ld	a1,-48(s0)
     a10:	fd843503          	ld	a0,-40(s0)
     a14:	00000097          	auipc	ra,0x0
     a18:	f62080e7          	jalr	-158(ra) # 976 <parseline>
     a1c:	87aa                	mv	a5,a0
     a1e:	85be                	mv	a1,a5
     a20:	fe843503          	ld	a0,-24(s0)
     a24:	00000097          	auipc	ra,0x0
     a28:	b94080e7          	jalr	-1132(ra) # 5b8 <listcmd>
     a2c:	fea43423          	sd	a0,-24(s0)
  }
  return cmd;
     a30:	fe843783          	ld	a5,-24(s0)
}
     a34:	853e                	mv	a0,a5
     a36:	70a2                	ld	ra,40(sp)
     a38:	7402                	ld	s0,32(sp)
     a3a:	6145                	addi	sp,sp,48
     a3c:	8082                	ret

0000000000000a3e <parsepipe>:

struct cmd*
parsepipe(char **ps, char *es)
{
     a3e:	7179                	addi	sp,sp,-48
     a40:	f406                	sd	ra,40(sp)
     a42:	f022                	sd	s0,32(sp)
     a44:	1800                	addi	s0,sp,48
     a46:	fca43c23          	sd	a0,-40(s0)
     a4a:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     a4e:	fd043583          	ld	a1,-48(s0)
     a52:	fd843503          	ld	a0,-40(s0)
     a56:	00000097          	auipc	ra,0x0
     a5a:	270080e7          	jalr	624(ra) # cc6 <parseexec>
     a5e:	fea43423          	sd	a0,-24(s0)
  if(peek(ps, es, "|")){
     a62:	00001617          	auipc	a2,0x1
     a66:	2b660613          	addi	a2,a2,694 # 1d18 <malloc+0x1f4>
     a6a:	fd043583          	ld	a1,-48(s0)
     a6e:	fd843503          	ld	a0,-40(s0)
     a72:	00000097          	auipc	ra,0x0
     a76:	dc4080e7          	jalr	-572(ra) # 836 <peek>
     a7a:	87aa                	mv	a5,a0
     a7c:	cf8d                	beqz	a5,ab6 <parsepipe+0x78>
    gettoken(ps, es, 0, 0);
     a7e:	4681                	li	a3,0
     a80:	4601                	li	a2,0
     a82:	fd043583          	ld	a1,-48(s0)
     a86:	fd843503          	ld	a0,-40(s0)
     a8a:	00000097          	auipc	ra,0x0
     a8e:	bd0080e7          	jalr	-1072(ra) # 65a <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     a92:	fd043583          	ld	a1,-48(s0)
     a96:	fd843503          	ld	a0,-40(s0)
     a9a:	00000097          	auipc	ra,0x0
     a9e:	fa4080e7          	jalr	-92(ra) # a3e <parsepipe>
     aa2:	87aa                	mv	a5,a0
     aa4:	85be                	mv	a1,a5
     aa6:	fe843503          	ld	a0,-24(s0)
     aaa:	00000097          	auipc	ra,0x0
     aae:	ab6080e7          	jalr	-1354(ra) # 560 <pipecmd>
     ab2:	fea43423          	sd	a0,-24(s0)
  }
  return cmd;
     ab6:	fe843783          	ld	a5,-24(s0)
}
     aba:	853e                	mv	a0,a5
     abc:	70a2                	ld	ra,40(sp)
     abe:	7402                	ld	s0,32(sp)
     ac0:	6145                	addi	sp,sp,48
     ac2:	8082                	ret

0000000000000ac4 <parseredirs>:

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     ac4:	715d                	addi	sp,sp,-80
     ac6:	e486                	sd	ra,72(sp)
     ac8:	e0a2                	sd	s0,64(sp)
     aca:	0880                	addi	s0,sp,80
     acc:	fca43423          	sd	a0,-56(s0)
     ad0:	fcb43023          	sd	a1,-64(s0)
     ad4:	fac43c23          	sd	a2,-72(s0)
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     ad8:	a8e5                	j	bd0 <parseredirs+0x10c>
    tok = gettoken(ps, es, 0, 0);
     ada:	4681                	li	a3,0
     adc:	4601                	li	a2,0
     ade:	fb843583          	ld	a1,-72(s0)
     ae2:	fc043503          	ld	a0,-64(s0)
     ae6:	00000097          	auipc	ra,0x0
     aea:	b74080e7          	jalr	-1164(ra) # 65a <gettoken>
     aee:	87aa                	mv	a5,a0
     af0:	fef42623          	sw	a5,-20(s0)
    if(gettoken(ps, es, &q, &eq) != 'a')
     af4:	fd840713          	addi	a4,s0,-40
     af8:	fe040793          	addi	a5,s0,-32
     afc:	86ba                	mv	a3,a4
     afe:	863e                	mv	a2,a5
     b00:	fb843583          	ld	a1,-72(s0)
     b04:	fc043503          	ld	a0,-64(s0)
     b08:	00000097          	auipc	ra,0x0
     b0c:	b52080e7          	jalr	-1198(ra) # 65a <gettoken>
     b10:	87aa                	mv	a5,a0
     b12:	873e                	mv	a4,a5
     b14:	06100793          	li	a5,97
     b18:	00f70a63          	beq	a4,a5,b2c <parseredirs+0x68>
      panic("missing file for redirection");
     b1c:	00001517          	auipc	a0,0x1
     b20:	20450513          	addi	a0,a0,516 # 1d20 <malloc+0x1fc>
     b24:	00000097          	auipc	ra,0x0
     b28:	904080e7          	jalr	-1788(ra) # 428 <panic>
    switch(tok){
     b2c:	fec42783          	lw	a5,-20(s0)
     b30:	0007871b          	sext.w	a4,a5
     b34:	03e00793          	li	a5,62
     b38:	04f70a63          	beq	a4,a5,b8c <parseredirs+0xc8>
     b3c:	fec42783          	lw	a5,-20(s0)
     b40:	0007871b          	sext.w	a4,a5
     b44:	03e00793          	li	a5,62
     b48:	08e7c463          	blt	a5,a4,bd0 <parseredirs+0x10c>
     b4c:	fec42783          	lw	a5,-20(s0)
     b50:	0007871b          	sext.w	a4,a5
     b54:	02b00793          	li	a5,43
     b58:	04f70b63          	beq	a4,a5,bae <parseredirs+0xea>
     b5c:	fec42783          	lw	a5,-20(s0)
     b60:	0007871b          	sext.w	a4,a5
     b64:	03c00793          	li	a5,60
     b68:	06f71463          	bne	a4,a5,bd0 <parseredirs+0x10c>
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     b6c:	fe043783          	ld	a5,-32(s0)
     b70:	fd843603          	ld	a2,-40(s0)
     b74:	4701                	li	a4,0
     b76:	4681                	li	a3,0
     b78:	85be                	mv	a1,a5
     b7a:	fc843503          	ld	a0,-56(s0)
     b7e:	00000097          	auipc	ra,0x0
     b82:	958080e7          	jalr	-1704(ra) # 4d6 <redircmd>
     b86:	fca43423          	sd	a0,-56(s0)
      break;
     b8a:	a099                	j	bd0 <parseredirs+0x10c>
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE|O_TRUNC, 1);
     b8c:	fe043783          	ld	a5,-32(s0)
     b90:	fd843603          	ld	a2,-40(s0)
     b94:	4705                	li	a4,1
     b96:	60100693          	li	a3,1537
     b9a:	85be                	mv	a1,a5
     b9c:	fc843503          	ld	a0,-56(s0)
     ba0:	00000097          	auipc	ra,0x0
     ba4:	936080e7          	jalr	-1738(ra) # 4d6 <redircmd>
     ba8:	fca43423          	sd	a0,-56(s0)
      break;
     bac:	a015                	j	bd0 <parseredirs+0x10c>
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     bae:	fe043783          	ld	a5,-32(s0)
     bb2:	fd843603          	ld	a2,-40(s0)
     bb6:	4705                	li	a4,1
     bb8:	20100693          	li	a3,513
     bbc:	85be                	mv	a1,a5
     bbe:	fc843503          	ld	a0,-56(s0)
     bc2:	00000097          	auipc	ra,0x0
     bc6:	914080e7          	jalr	-1772(ra) # 4d6 <redircmd>
     bca:	fca43423          	sd	a0,-56(s0)
      break;
     bce:	0001                	nop
  while(peek(ps, es, "<>")){
     bd0:	00001617          	auipc	a2,0x1
     bd4:	17060613          	addi	a2,a2,368 # 1d40 <malloc+0x21c>
     bd8:	fb843583          	ld	a1,-72(s0)
     bdc:	fc043503          	ld	a0,-64(s0)
     be0:	00000097          	auipc	ra,0x0
     be4:	c56080e7          	jalr	-938(ra) # 836 <peek>
     be8:	87aa                	mv	a5,a0
     bea:	ee0798e3          	bnez	a5,ada <parseredirs+0x16>
    }
  }
  return cmd;
     bee:	fc843783          	ld	a5,-56(s0)
}
     bf2:	853e                	mv	a0,a5
     bf4:	60a6                	ld	ra,72(sp)
     bf6:	6406                	ld	s0,64(sp)
     bf8:	6161                	addi	sp,sp,80
     bfa:	8082                	ret

0000000000000bfc <parseblock>:

struct cmd*
parseblock(char **ps, char *es)
{
     bfc:	7179                	addi	sp,sp,-48
     bfe:	f406                	sd	ra,40(sp)
     c00:	f022                	sd	s0,32(sp)
     c02:	1800                	addi	s0,sp,48
     c04:	fca43c23          	sd	a0,-40(s0)
     c08:	fcb43823          	sd	a1,-48(s0)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     c0c:	00001617          	auipc	a2,0x1
     c10:	13c60613          	addi	a2,a2,316 # 1d48 <malloc+0x224>
     c14:	fd043583          	ld	a1,-48(s0)
     c18:	fd843503          	ld	a0,-40(s0)
     c1c:	00000097          	auipc	ra,0x0
     c20:	c1a080e7          	jalr	-998(ra) # 836 <peek>
     c24:	87aa                	mv	a5,a0
     c26:	eb89                	bnez	a5,c38 <parseblock+0x3c>
    panic("parseblock");
     c28:	00001517          	auipc	a0,0x1
     c2c:	12850513          	addi	a0,a0,296 # 1d50 <malloc+0x22c>
     c30:	fffff097          	auipc	ra,0xfffff
     c34:	7f8080e7          	jalr	2040(ra) # 428 <panic>
  gettoken(ps, es, 0, 0);
     c38:	4681                	li	a3,0
     c3a:	4601                	li	a2,0
     c3c:	fd043583          	ld	a1,-48(s0)
     c40:	fd843503          	ld	a0,-40(s0)
     c44:	00000097          	auipc	ra,0x0
     c48:	a16080e7          	jalr	-1514(ra) # 65a <gettoken>
  cmd = parseline(ps, es);
     c4c:	fd043583          	ld	a1,-48(s0)
     c50:	fd843503          	ld	a0,-40(s0)
     c54:	00000097          	auipc	ra,0x0
     c58:	d22080e7          	jalr	-734(ra) # 976 <parseline>
     c5c:	fea43423          	sd	a0,-24(s0)
  if(!peek(ps, es, ")"))
     c60:	00001617          	auipc	a2,0x1
     c64:	10060613          	addi	a2,a2,256 # 1d60 <malloc+0x23c>
     c68:	fd043583          	ld	a1,-48(s0)
     c6c:	fd843503          	ld	a0,-40(s0)
     c70:	00000097          	auipc	ra,0x0
     c74:	bc6080e7          	jalr	-1082(ra) # 836 <peek>
     c78:	87aa                	mv	a5,a0
     c7a:	eb89                	bnez	a5,c8c <parseblock+0x90>
    panic("syntax - missing )");
     c7c:	00001517          	auipc	a0,0x1
     c80:	0ec50513          	addi	a0,a0,236 # 1d68 <malloc+0x244>
     c84:	fffff097          	auipc	ra,0xfffff
     c88:	7a4080e7          	jalr	1956(ra) # 428 <panic>
  gettoken(ps, es, 0, 0);
     c8c:	4681                	li	a3,0
     c8e:	4601                	li	a2,0
     c90:	fd043583          	ld	a1,-48(s0)
     c94:	fd843503          	ld	a0,-40(s0)
     c98:	00000097          	auipc	ra,0x0
     c9c:	9c2080e7          	jalr	-1598(ra) # 65a <gettoken>
  cmd = parseredirs(cmd, ps, es);
     ca0:	fd043603          	ld	a2,-48(s0)
     ca4:	fd843583          	ld	a1,-40(s0)
     ca8:	fe843503          	ld	a0,-24(s0)
     cac:	00000097          	auipc	ra,0x0
     cb0:	e18080e7          	jalr	-488(ra) # ac4 <parseredirs>
     cb4:	fea43423          	sd	a0,-24(s0)
  return cmd;
     cb8:	fe843783          	ld	a5,-24(s0)
}
     cbc:	853e                	mv	a0,a5
     cbe:	70a2                	ld	ra,40(sp)
     cc0:	7402                	ld	s0,32(sp)
     cc2:	6145                	addi	sp,sp,48
     cc4:	8082                	ret

0000000000000cc6 <parseexec>:

struct cmd*
parseexec(char **ps, char *es)
{
     cc6:	715d                	addi	sp,sp,-80
     cc8:	e486                	sd	ra,72(sp)
     cca:	e0a2                	sd	s0,64(sp)
     ccc:	0880                	addi	s0,sp,80
     cce:	faa43c23          	sd	a0,-72(s0)
     cd2:	fab43823          	sd	a1,-80(s0)
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     cd6:	00001617          	auipc	a2,0x1
     cda:	07260613          	addi	a2,a2,114 # 1d48 <malloc+0x224>
     cde:	fb043583          	ld	a1,-80(s0)
     ce2:	fb843503          	ld	a0,-72(s0)
     ce6:	00000097          	auipc	ra,0x0
     cea:	b50080e7          	jalr	-1200(ra) # 836 <peek>
     cee:	87aa                	mv	a5,a0
     cf0:	cb99                	beqz	a5,d06 <parseexec+0x40>
    return parseblock(ps, es);
     cf2:	fb043583          	ld	a1,-80(s0)
     cf6:	fb843503          	ld	a0,-72(s0)
     cfa:	00000097          	auipc	ra,0x0
     cfe:	f02080e7          	jalr	-254(ra) # bfc <parseblock>
     d02:	87aa                	mv	a5,a0
     d04:	a22d                	j	e2e <parseexec+0x168>

  ret = execcmd();
     d06:	fffff097          	auipc	ra,0xfffff
     d0a:	790080e7          	jalr	1936(ra) # 496 <execcmd>
     d0e:	fea43023          	sd	a0,-32(s0)
  cmd = (struct execcmd*)ret;
     d12:	fe043783          	ld	a5,-32(s0)
     d16:	fcf43c23          	sd	a5,-40(s0)

  argc = 0;
     d1a:	fe042623          	sw	zero,-20(s0)
  ret = parseredirs(ret, ps, es);
     d1e:	fb043603          	ld	a2,-80(s0)
     d22:	fb843583          	ld	a1,-72(s0)
     d26:	fe043503          	ld	a0,-32(s0)
     d2a:	00000097          	auipc	ra,0x0
     d2e:	d9a080e7          	jalr	-614(ra) # ac4 <parseredirs>
     d32:	fea43023          	sd	a0,-32(s0)
  while(!peek(ps, es, "|)&;")){
     d36:	a84d                	j	de8 <parseexec+0x122>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     d38:	fc040713          	addi	a4,s0,-64
     d3c:	fc840793          	addi	a5,s0,-56
     d40:	86ba                	mv	a3,a4
     d42:	863e                	mv	a2,a5
     d44:	fb043583          	ld	a1,-80(s0)
     d48:	fb843503          	ld	a0,-72(s0)
     d4c:	00000097          	auipc	ra,0x0
     d50:	90e080e7          	jalr	-1778(ra) # 65a <gettoken>
     d54:	87aa                	mv	a5,a0
     d56:	fcf42a23          	sw	a5,-44(s0)
     d5a:	fd442783          	lw	a5,-44(s0)
     d5e:	2781                	sext.w	a5,a5
     d60:	c3dd                	beqz	a5,e06 <parseexec+0x140>
      break;
    if(tok != 'a')
     d62:	fd442783          	lw	a5,-44(s0)
     d66:	0007871b          	sext.w	a4,a5
     d6a:	06100793          	li	a5,97
     d6e:	00f70a63          	beq	a4,a5,d82 <parseexec+0xbc>
      panic("syntax");
     d72:	00001517          	auipc	a0,0x1
     d76:	f8e50513          	addi	a0,a0,-114 # 1d00 <malloc+0x1dc>
     d7a:	fffff097          	auipc	ra,0xfffff
     d7e:	6ae080e7          	jalr	1710(ra) # 428 <panic>
    cmd->argv[argc] = q;
     d82:	fc843703          	ld	a4,-56(s0)
     d86:	fd843683          	ld	a3,-40(s0)
     d8a:	fec42783          	lw	a5,-20(s0)
     d8e:	078e                	slli	a5,a5,0x3
     d90:	97b6                	add	a5,a5,a3
     d92:	e798                	sd	a4,8(a5)
    cmd->eargv[argc] = eq;
     d94:	fc043703          	ld	a4,-64(s0)
     d98:	fd843683          	ld	a3,-40(s0)
     d9c:	fec42783          	lw	a5,-20(s0)
     da0:	07a9                	addi	a5,a5,10
     da2:	078e                	slli	a5,a5,0x3
     da4:	97b6                	add	a5,a5,a3
     da6:	e798                	sd	a4,8(a5)
    argc++;
     da8:	fec42783          	lw	a5,-20(s0)
     dac:	2785                	addiw	a5,a5,1
     dae:	fef42623          	sw	a5,-20(s0)
    if(argc >= MAXARGS)
     db2:	fec42783          	lw	a5,-20(s0)
     db6:	0007871b          	sext.w	a4,a5
     dba:	47a5                	li	a5,9
     dbc:	00e7da63          	bge	a5,a4,dd0 <parseexec+0x10a>
      panic("too many args");
     dc0:	00001517          	auipc	a0,0x1
     dc4:	fc050513          	addi	a0,a0,-64 # 1d80 <malloc+0x25c>
     dc8:	fffff097          	auipc	ra,0xfffff
     dcc:	660080e7          	jalr	1632(ra) # 428 <panic>
    ret = parseredirs(ret, ps, es);
     dd0:	fb043603          	ld	a2,-80(s0)
     dd4:	fb843583          	ld	a1,-72(s0)
     dd8:	fe043503          	ld	a0,-32(s0)
     ddc:	00000097          	auipc	ra,0x0
     de0:	ce8080e7          	jalr	-792(ra) # ac4 <parseredirs>
     de4:	fea43023          	sd	a0,-32(s0)
  while(!peek(ps, es, "|)&;")){
     de8:	00001617          	auipc	a2,0x1
     dec:	fa860613          	addi	a2,a2,-88 # 1d90 <malloc+0x26c>
     df0:	fb043583          	ld	a1,-80(s0)
     df4:	fb843503          	ld	a0,-72(s0)
     df8:	00000097          	auipc	ra,0x0
     dfc:	a3e080e7          	jalr	-1474(ra) # 836 <peek>
     e00:	87aa                	mv	a5,a0
     e02:	db9d                	beqz	a5,d38 <parseexec+0x72>
     e04:	a011                	j	e08 <parseexec+0x142>
      break;
     e06:	0001                	nop
  }
  cmd->argv[argc] = 0;
     e08:	fd843703          	ld	a4,-40(s0)
     e0c:	fec42783          	lw	a5,-20(s0)
     e10:	078e                	slli	a5,a5,0x3
     e12:	97ba                	add	a5,a5,a4
     e14:	0007b423          	sd	zero,8(a5)
  cmd->eargv[argc] = 0;
     e18:	fd843703          	ld	a4,-40(s0)
     e1c:	fec42783          	lw	a5,-20(s0)
     e20:	07a9                	addi	a5,a5,10
     e22:	078e                	slli	a5,a5,0x3
     e24:	97ba                	add	a5,a5,a4
     e26:	0007b423          	sd	zero,8(a5)
  return ret;
     e2a:	fe043783          	ld	a5,-32(s0)
}
     e2e:	853e                	mv	a0,a5
     e30:	60a6                	ld	ra,72(sp)
     e32:	6406                	ld	s0,64(sp)
     e34:	6161                	addi	sp,sp,80
     e36:	8082                	ret

0000000000000e38 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     e38:	715d                	addi	sp,sp,-80
     e3a:	e486                	sd	ra,72(sp)
     e3c:	e0a2                	sd	s0,64(sp)
     e3e:	0880                	addi	s0,sp,80
     e40:	faa43c23          	sd	a0,-72(s0)
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     e44:	fb843783          	ld	a5,-72(s0)
     e48:	e399                	bnez	a5,e4e <nulterminate+0x16>
    return 0;
     e4a:	4781                	li	a5,0
     e4c:	a211                	j	f50 <nulterminate+0x118>

  switch(cmd->type){
     e4e:	fb843783          	ld	a5,-72(s0)
     e52:	439c                	lw	a5,0(a5)
     e54:	86be                	mv	a3,a5
     e56:	4715                	li	a4,5
     e58:	0ed76a63          	bltu	a4,a3,f4c <nulterminate+0x114>
     e5c:	00279713          	slli	a4,a5,0x2
     e60:	00001797          	auipc	a5,0x1
     e64:	f3878793          	addi	a5,a5,-200 # 1d98 <malloc+0x274>
     e68:	97ba                	add	a5,a5,a4
     e6a:	439c                	lw	a5,0(a5)
     e6c:	0007871b          	sext.w	a4,a5
     e70:	00001797          	auipc	a5,0x1
     e74:	f2878793          	addi	a5,a5,-216 # 1d98 <malloc+0x274>
     e78:	97ba                	add	a5,a5,a4
     e7a:	8782                	jr	a5
  case EXEC:
    ecmd = (struct execcmd*)cmd;
     e7c:	fb843783          	ld	a5,-72(s0)
     e80:	fcf43023          	sd	a5,-64(s0)
    for(i=0; ecmd->argv[i]; i++)
     e84:	fe042623          	sw	zero,-20(s0)
     e88:	a005                	j	ea8 <nulterminate+0x70>
      *ecmd->eargv[i] = 0;
     e8a:	fc043703          	ld	a4,-64(s0)
     e8e:	fec42783          	lw	a5,-20(s0)
     e92:	07a9                	addi	a5,a5,10
     e94:	078e                	slli	a5,a5,0x3
     e96:	97ba                	add	a5,a5,a4
     e98:	679c                	ld	a5,8(a5)
     e9a:	00078023          	sb	zero,0(a5)
    for(i=0; ecmd->argv[i]; i++)
     e9e:	fec42783          	lw	a5,-20(s0)
     ea2:	2785                	addiw	a5,a5,1
     ea4:	fef42623          	sw	a5,-20(s0)
     ea8:	fc043703          	ld	a4,-64(s0)
     eac:	fec42783          	lw	a5,-20(s0)
     eb0:	078e                	slli	a5,a5,0x3
     eb2:	97ba                	add	a5,a5,a4
     eb4:	679c                	ld	a5,8(a5)
     eb6:	fbf1                	bnez	a5,e8a <nulterminate+0x52>
    break;
     eb8:	a851                	j	f4c <nulterminate+0x114>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
     eba:	fb843783          	ld	a5,-72(s0)
     ebe:	fcf43423          	sd	a5,-56(s0)
    nulterminate(rcmd->cmd);
     ec2:	fc843783          	ld	a5,-56(s0)
     ec6:	679c                	ld	a5,8(a5)
     ec8:	853e                	mv	a0,a5
     eca:	00000097          	auipc	ra,0x0
     ece:	f6e080e7          	jalr	-146(ra) # e38 <nulterminate>
    *rcmd->efile = 0;
     ed2:	fc843783          	ld	a5,-56(s0)
     ed6:	6f9c                	ld	a5,24(a5)
     ed8:	00078023          	sb	zero,0(a5)
    break;
     edc:	a885                	j	f4c <nulterminate+0x114>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
     ede:	fb843783          	ld	a5,-72(s0)
     ee2:	fcf43823          	sd	a5,-48(s0)
    nulterminate(pcmd->left);
     ee6:	fd043783          	ld	a5,-48(s0)
     eea:	679c                	ld	a5,8(a5)
     eec:	853e                	mv	a0,a5
     eee:	00000097          	auipc	ra,0x0
     ef2:	f4a080e7          	jalr	-182(ra) # e38 <nulterminate>
    nulterminate(pcmd->right);
     ef6:	fd043783          	ld	a5,-48(s0)
     efa:	6b9c                	ld	a5,16(a5)
     efc:	853e                	mv	a0,a5
     efe:	00000097          	auipc	ra,0x0
     f02:	f3a080e7          	jalr	-198(ra) # e38 <nulterminate>
    break;
     f06:	a099                	j	f4c <nulterminate+0x114>

  case LIST:
    lcmd = (struct listcmd*)cmd;
     f08:	fb843783          	ld	a5,-72(s0)
     f0c:	fcf43c23          	sd	a5,-40(s0)
    nulterminate(lcmd->left);
     f10:	fd843783          	ld	a5,-40(s0)
     f14:	679c                	ld	a5,8(a5)
     f16:	853e                	mv	a0,a5
     f18:	00000097          	auipc	ra,0x0
     f1c:	f20080e7          	jalr	-224(ra) # e38 <nulterminate>
    nulterminate(lcmd->right);
     f20:	fd843783          	ld	a5,-40(s0)
     f24:	6b9c                	ld	a5,16(a5)
     f26:	853e                	mv	a0,a5
     f28:	00000097          	auipc	ra,0x0
     f2c:	f10080e7          	jalr	-240(ra) # e38 <nulterminate>
    break;
     f30:	a831                	j	f4c <nulterminate+0x114>

  case BACK:
    bcmd = (struct backcmd*)cmd;
     f32:	fb843783          	ld	a5,-72(s0)
     f36:	fef43023          	sd	a5,-32(s0)
    nulterminate(bcmd->cmd);
     f3a:	fe043783          	ld	a5,-32(s0)
     f3e:	679c                	ld	a5,8(a5)
     f40:	853e                	mv	a0,a5
     f42:	00000097          	auipc	ra,0x0
     f46:	ef6080e7          	jalr	-266(ra) # e38 <nulterminate>
    break;
     f4a:	0001                	nop
  }
  return cmd;
     f4c:	fb843783          	ld	a5,-72(s0)
}
     f50:	853e                	mv	a0,a5
     f52:	60a6                	ld	ra,72(sp)
     f54:	6406                	ld	s0,64(sp)
     f56:	6161                	addi	sp,sp,80
     f58:	8082                	ret

0000000000000f5a <_main>:
//
// wrapper so that it's OK if main() does not call exit().
//
void
_main()
{
     f5a:	1141                	addi	sp,sp,-16
     f5c:	e406                	sd	ra,8(sp)
     f5e:	e022                	sd	s0,0(sp)
     f60:	0800                	addi	s0,sp,16
  extern int main();
  main();
     f62:	fffff097          	auipc	ra,0xfffff
     f66:	382080e7          	jalr	898(ra) # 2e4 <main>
  exit(0);
     f6a:	4501                	li	a0,0
     f6c:	00000097          	auipc	ra,0x0
     f70:	498080e7          	jalr	1176(ra) # 1404 <exit>

0000000000000f74 <strcpy>:
}

char*
strcpy(char *s, const char *t)
{
     f74:	7179                	addi	sp,sp,-48
     f76:	f422                	sd	s0,40(sp)
     f78:	1800                	addi	s0,sp,48
     f7a:	fca43c23          	sd	a0,-40(s0)
     f7e:	fcb43823          	sd	a1,-48(s0)
  char *os;

  os = s;
     f82:	fd843783          	ld	a5,-40(s0)
     f86:	fef43423          	sd	a5,-24(s0)
  while((*s++ = *t++) != 0)
     f8a:	0001                	nop
     f8c:	fd043703          	ld	a4,-48(s0)
     f90:	00170793          	addi	a5,a4,1
     f94:	fcf43823          	sd	a5,-48(s0)
     f98:	fd843783          	ld	a5,-40(s0)
     f9c:	00178693          	addi	a3,a5,1
     fa0:	fcd43c23          	sd	a3,-40(s0)
     fa4:	00074703          	lbu	a4,0(a4)
     fa8:	00e78023          	sb	a4,0(a5)
     fac:	0007c783          	lbu	a5,0(a5)
     fb0:	fff1                	bnez	a5,f8c <strcpy+0x18>
    ;
  return os;
     fb2:	fe843783          	ld	a5,-24(s0)
}
     fb6:	853e                	mv	a0,a5
     fb8:	7422                	ld	s0,40(sp)
     fba:	6145                	addi	sp,sp,48
     fbc:	8082                	ret

0000000000000fbe <strcmp>:

int
strcmp(const char *p, const char *q)
{
     fbe:	1101                	addi	sp,sp,-32
     fc0:	ec22                	sd	s0,24(sp)
     fc2:	1000                	addi	s0,sp,32
     fc4:	fea43423          	sd	a0,-24(s0)
     fc8:	feb43023          	sd	a1,-32(s0)
  while(*p && *p == *q)
     fcc:	a819                	j	fe2 <strcmp+0x24>
    p++, q++;
     fce:	fe843783          	ld	a5,-24(s0)
     fd2:	0785                	addi	a5,a5,1
     fd4:	fef43423          	sd	a5,-24(s0)
     fd8:	fe043783          	ld	a5,-32(s0)
     fdc:	0785                	addi	a5,a5,1
     fde:	fef43023          	sd	a5,-32(s0)
  while(*p && *p == *q)
     fe2:	fe843783          	ld	a5,-24(s0)
     fe6:	0007c783          	lbu	a5,0(a5)
     fea:	cb99                	beqz	a5,1000 <strcmp+0x42>
     fec:	fe843783          	ld	a5,-24(s0)
     ff0:	0007c703          	lbu	a4,0(a5)
     ff4:	fe043783          	ld	a5,-32(s0)
     ff8:	0007c783          	lbu	a5,0(a5)
     ffc:	fcf709e3          	beq	a4,a5,fce <strcmp+0x10>
  return (uchar)*p - (uchar)*q;
    1000:	fe843783          	ld	a5,-24(s0)
    1004:	0007c783          	lbu	a5,0(a5)
    1008:	0007871b          	sext.w	a4,a5
    100c:	fe043783          	ld	a5,-32(s0)
    1010:	0007c783          	lbu	a5,0(a5)
    1014:	2781                	sext.w	a5,a5
    1016:	40f707bb          	subw	a5,a4,a5
    101a:	2781                	sext.w	a5,a5
}
    101c:	853e                	mv	a0,a5
    101e:	6462                	ld	s0,24(sp)
    1020:	6105                	addi	sp,sp,32
    1022:	8082                	ret

0000000000001024 <strlen>:

uint
strlen(const char *s)
{
    1024:	7179                	addi	sp,sp,-48
    1026:	f422                	sd	s0,40(sp)
    1028:	1800                	addi	s0,sp,48
    102a:	fca43c23          	sd	a0,-40(s0)
  int n;

  for(n = 0; s[n]; n++)
    102e:	fe042623          	sw	zero,-20(s0)
    1032:	a031                	j	103e <strlen+0x1a>
    1034:	fec42783          	lw	a5,-20(s0)
    1038:	2785                	addiw	a5,a5,1
    103a:	fef42623          	sw	a5,-20(s0)
    103e:	fec42783          	lw	a5,-20(s0)
    1042:	fd843703          	ld	a4,-40(s0)
    1046:	97ba                	add	a5,a5,a4
    1048:	0007c783          	lbu	a5,0(a5)
    104c:	f7e5                	bnez	a5,1034 <strlen+0x10>
    ;
  return n;
    104e:	fec42783          	lw	a5,-20(s0)
}
    1052:	853e                	mv	a0,a5
    1054:	7422                	ld	s0,40(sp)
    1056:	6145                	addi	sp,sp,48
    1058:	8082                	ret

000000000000105a <memset>:

void*
memset(void *dst, int c, uint n)
{
    105a:	7179                	addi	sp,sp,-48
    105c:	f422                	sd	s0,40(sp)
    105e:	1800                	addi	s0,sp,48
    1060:	fca43c23          	sd	a0,-40(s0)
    1064:	87ae                	mv	a5,a1
    1066:	8732                	mv	a4,a2
    1068:	fcf42a23          	sw	a5,-44(s0)
    106c:	87ba                	mv	a5,a4
    106e:	fcf42823          	sw	a5,-48(s0)
  char *cdst = (char *) dst;
    1072:	fd843783          	ld	a5,-40(s0)
    1076:	fef43023          	sd	a5,-32(s0)
  int i;
  for(i = 0; i < n; i++){
    107a:	fe042623          	sw	zero,-20(s0)
    107e:	a00d                	j	10a0 <memset+0x46>
    cdst[i] = c;
    1080:	fec42783          	lw	a5,-20(s0)
    1084:	fe043703          	ld	a4,-32(s0)
    1088:	97ba                	add	a5,a5,a4
    108a:	fd442703          	lw	a4,-44(s0)
    108e:	0ff77713          	andi	a4,a4,255
    1092:	00e78023          	sb	a4,0(a5)
  for(i = 0; i < n; i++){
    1096:	fec42783          	lw	a5,-20(s0)
    109a:	2785                	addiw	a5,a5,1
    109c:	fef42623          	sw	a5,-20(s0)
    10a0:	fec42703          	lw	a4,-20(s0)
    10a4:	fd042783          	lw	a5,-48(s0)
    10a8:	2781                	sext.w	a5,a5
    10aa:	fcf76be3          	bltu	a4,a5,1080 <memset+0x26>
  }
  return dst;
    10ae:	fd843783          	ld	a5,-40(s0)
}
    10b2:	853e                	mv	a0,a5
    10b4:	7422                	ld	s0,40(sp)
    10b6:	6145                	addi	sp,sp,48
    10b8:	8082                	ret

00000000000010ba <strchr>:

char*
strchr(const char *s, char c)
{
    10ba:	1101                	addi	sp,sp,-32
    10bc:	ec22                	sd	s0,24(sp)
    10be:	1000                	addi	s0,sp,32
    10c0:	fea43423          	sd	a0,-24(s0)
    10c4:	87ae                	mv	a5,a1
    10c6:	fef403a3          	sb	a5,-25(s0)
  for(; *s; s++)
    10ca:	a01d                	j	10f0 <strchr+0x36>
    if(*s == c)
    10cc:	fe843783          	ld	a5,-24(s0)
    10d0:	0007c703          	lbu	a4,0(a5)
    10d4:	fe744783          	lbu	a5,-25(s0)
    10d8:	0ff7f793          	andi	a5,a5,255
    10dc:	00e79563          	bne	a5,a4,10e6 <strchr+0x2c>
      return (char*)s;
    10e0:	fe843783          	ld	a5,-24(s0)
    10e4:	a821                	j	10fc <strchr+0x42>
  for(; *s; s++)
    10e6:	fe843783          	ld	a5,-24(s0)
    10ea:	0785                	addi	a5,a5,1
    10ec:	fef43423          	sd	a5,-24(s0)
    10f0:	fe843783          	ld	a5,-24(s0)
    10f4:	0007c783          	lbu	a5,0(a5)
    10f8:	fbf1                	bnez	a5,10cc <strchr+0x12>
  return 0;
    10fa:	4781                	li	a5,0
}
    10fc:	853e                	mv	a0,a5
    10fe:	6462                	ld	s0,24(sp)
    1100:	6105                	addi	sp,sp,32
    1102:	8082                	ret

0000000000001104 <gets>:

char*
gets(char *buf, int max)
{
    1104:	7179                	addi	sp,sp,-48
    1106:	f406                	sd	ra,40(sp)
    1108:	f022                	sd	s0,32(sp)
    110a:	1800                	addi	s0,sp,48
    110c:	fca43c23          	sd	a0,-40(s0)
    1110:	87ae                	mv	a5,a1
    1112:	fcf42a23          	sw	a5,-44(s0)
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    1116:	fe042623          	sw	zero,-20(s0)
    111a:	a8a1                	j	1172 <gets+0x6e>
    cc = read(0, &c, 1);
    111c:	fe740793          	addi	a5,s0,-25
    1120:	4605                	li	a2,1
    1122:	85be                	mv	a1,a5
    1124:	4501                	li	a0,0
    1126:	00000097          	auipc	ra,0x0
    112a:	2f6080e7          	jalr	758(ra) # 141c <read>
    112e:	87aa                	mv	a5,a0
    1130:	fef42423          	sw	a5,-24(s0)
    if(cc < 1)
    1134:	fe842783          	lw	a5,-24(s0)
    1138:	2781                	sext.w	a5,a5
    113a:	04f05763          	blez	a5,1188 <gets+0x84>
      break;
    buf[i++] = c;
    113e:	fec42783          	lw	a5,-20(s0)
    1142:	0017871b          	addiw	a4,a5,1
    1146:	fee42623          	sw	a4,-20(s0)
    114a:	873e                	mv	a4,a5
    114c:	fd843783          	ld	a5,-40(s0)
    1150:	97ba                	add	a5,a5,a4
    1152:	fe744703          	lbu	a4,-25(s0)
    1156:	00e78023          	sb	a4,0(a5)
    if(c == '\n' || c == '\r')
    115a:	fe744783          	lbu	a5,-25(s0)
    115e:	873e                	mv	a4,a5
    1160:	47a9                	li	a5,10
    1162:	02f70463          	beq	a4,a5,118a <gets+0x86>
    1166:	fe744783          	lbu	a5,-25(s0)
    116a:	873e                	mv	a4,a5
    116c:	47b5                	li	a5,13
    116e:	00f70e63          	beq	a4,a5,118a <gets+0x86>
  for(i=0; i+1 < max; ){
    1172:	fec42783          	lw	a5,-20(s0)
    1176:	2785                	addiw	a5,a5,1
    1178:	0007871b          	sext.w	a4,a5
    117c:	fd442783          	lw	a5,-44(s0)
    1180:	2781                	sext.w	a5,a5
    1182:	f8f74de3          	blt	a4,a5,111c <gets+0x18>
    1186:	a011                	j	118a <gets+0x86>
      break;
    1188:	0001                	nop
      break;
  }
  buf[i] = '\0';
    118a:	fec42783          	lw	a5,-20(s0)
    118e:	fd843703          	ld	a4,-40(s0)
    1192:	97ba                	add	a5,a5,a4
    1194:	00078023          	sb	zero,0(a5)
  return buf;
    1198:	fd843783          	ld	a5,-40(s0)
}
    119c:	853e                	mv	a0,a5
    119e:	70a2                	ld	ra,40(sp)
    11a0:	7402                	ld	s0,32(sp)
    11a2:	6145                	addi	sp,sp,48
    11a4:	8082                	ret

00000000000011a6 <stat>:

int
stat(const char *n, struct stat *st)
{
    11a6:	7179                	addi	sp,sp,-48
    11a8:	f406                	sd	ra,40(sp)
    11aa:	f022                	sd	s0,32(sp)
    11ac:	1800                	addi	s0,sp,48
    11ae:	fca43c23          	sd	a0,-40(s0)
    11b2:	fcb43823          	sd	a1,-48(s0)
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    11b6:	4581                	li	a1,0
    11b8:	fd843503          	ld	a0,-40(s0)
    11bc:	00000097          	auipc	ra,0x0
    11c0:	288080e7          	jalr	648(ra) # 1444 <open>
    11c4:	87aa                	mv	a5,a0
    11c6:	fef42623          	sw	a5,-20(s0)
  if(fd < 0)
    11ca:	fec42783          	lw	a5,-20(s0)
    11ce:	2781                	sext.w	a5,a5
    11d0:	0007d463          	bgez	a5,11d8 <stat+0x32>
    return -1;
    11d4:	57fd                	li	a5,-1
    11d6:	a035                	j	1202 <stat+0x5c>
  r = fstat(fd, st);
    11d8:	fec42783          	lw	a5,-20(s0)
    11dc:	fd043583          	ld	a1,-48(s0)
    11e0:	853e                	mv	a0,a5
    11e2:	00000097          	auipc	ra,0x0
    11e6:	27a080e7          	jalr	634(ra) # 145c <fstat>
    11ea:	87aa                	mv	a5,a0
    11ec:	fef42423          	sw	a5,-24(s0)
  close(fd);
    11f0:	fec42783          	lw	a5,-20(s0)
    11f4:	853e                	mv	a0,a5
    11f6:	00000097          	auipc	ra,0x0
    11fa:	236080e7          	jalr	566(ra) # 142c <close>
  return r;
    11fe:	fe842783          	lw	a5,-24(s0)
}
    1202:	853e                	mv	a0,a5
    1204:	70a2                	ld	ra,40(sp)
    1206:	7402                	ld	s0,32(sp)
    1208:	6145                	addi	sp,sp,48
    120a:	8082                	ret

000000000000120c <atoi>:

int
atoi(const char *s)
{
    120c:	7179                	addi	sp,sp,-48
    120e:	f422                	sd	s0,40(sp)
    1210:	1800                	addi	s0,sp,48
    1212:	fca43c23          	sd	a0,-40(s0)
  int n;

  n = 0;
    1216:	fe042623          	sw	zero,-20(s0)
  while('0' <= *s && *s <= '9')
    121a:	a815                	j	124e <atoi+0x42>
    n = n*10 + *s++ - '0';
    121c:	fec42703          	lw	a4,-20(s0)
    1220:	87ba                	mv	a5,a4
    1222:	0027979b          	slliw	a5,a5,0x2
    1226:	9fb9                	addw	a5,a5,a4
    1228:	0017979b          	slliw	a5,a5,0x1
    122c:	0007871b          	sext.w	a4,a5
    1230:	fd843783          	ld	a5,-40(s0)
    1234:	00178693          	addi	a3,a5,1
    1238:	fcd43c23          	sd	a3,-40(s0)
    123c:	0007c783          	lbu	a5,0(a5)
    1240:	2781                	sext.w	a5,a5
    1242:	9fb9                	addw	a5,a5,a4
    1244:	2781                	sext.w	a5,a5
    1246:	fd07879b          	addiw	a5,a5,-48
    124a:	fef42623          	sw	a5,-20(s0)
  while('0' <= *s && *s <= '9')
    124e:	fd843783          	ld	a5,-40(s0)
    1252:	0007c783          	lbu	a5,0(a5)
    1256:	873e                	mv	a4,a5
    1258:	02f00793          	li	a5,47
    125c:	00e7fb63          	bgeu	a5,a4,1272 <atoi+0x66>
    1260:	fd843783          	ld	a5,-40(s0)
    1264:	0007c783          	lbu	a5,0(a5)
    1268:	873e                	mv	a4,a5
    126a:	03900793          	li	a5,57
    126e:	fae7f7e3          	bgeu	a5,a4,121c <atoi+0x10>
  return n;
    1272:	fec42783          	lw	a5,-20(s0)
}
    1276:	853e                	mv	a0,a5
    1278:	7422                	ld	s0,40(sp)
    127a:	6145                	addi	sp,sp,48
    127c:	8082                	ret

000000000000127e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    127e:	7139                	addi	sp,sp,-64
    1280:	fc22                	sd	s0,56(sp)
    1282:	0080                	addi	s0,sp,64
    1284:	fca43c23          	sd	a0,-40(s0)
    1288:	fcb43823          	sd	a1,-48(s0)
    128c:	87b2                	mv	a5,a2
    128e:	fcf42623          	sw	a5,-52(s0)
  char *dst;
  const char *src;

  dst = vdst;
    1292:	fd843783          	ld	a5,-40(s0)
    1296:	fef43423          	sd	a5,-24(s0)
  src = vsrc;
    129a:	fd043783          	ld	a5,-48(s0)
    129e:	fef43023          	sd	a5,-32(s0)
  if (src > dst) {
    12a2:	fe043703          	ld	a4,-32(s0)
    12a6:	fe843783          	ld	a5,-24(s0)
    12aa:	02e7fc63          	bgeu	a5,a4,12e2 <memmove+0x64>
    while(n-- > 0)
    12ae:	a00d                	j	12d0 <memmove+0x52>
      *dst++ = *src++;
    12b0:	fe043703          	ld	a4,-32(s0)
    12b4:	00170793          	addi	a5,a4,1
    12b8:	fef43023          	sd	a5,-32(s0)
    12bc:	fe843783          	ld	a5,-24(s0)
    12c0:	00178693          	addi	a3,a5,1
    12c4:	fed43423          	sd	a3,-24(s0)
    12c8:	00074703          	lbu	a4,0(a4)
    12cc:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    12d0:	fcc42783          	lw	a5,-52(s0)
    12d4:	fff7871b          	addiw	a4,a5,-1
    12d8:	fce42623          	sw	a4,-52(s0)
    12dc:	fcf04ae3          	bgtz	a5,12b0 <memmove+0x32>
    12e0:	a891                	j	1334 <memmove+0xb6>
  } else {
    dst += n;
    12e2:	fcc42783          	lw	a5,-52(s0)
    12e6:	fe843703          	ld	a4,-24(s0)
    12ea:	97ba                	add	a5,a5,a4
    12ec:	fef43423          	sd	a5,-24(s0)
    src += n;
    12f0:	fcc42783          	lw	a5,-52(s0)
    12f4:	fe043703          	ld	a4,-32(s0)
    12f8:	97ba                	add	a5,a5,a4
    12fa:	fef43023          	sd	a5,-32(s0)
    while(n-- > 0)
    12fe:	a01d                	j	1324 <memmove+0xa6>
      *--dst = *--src;
    1300:	fe043783          	ld	a5,-32(s0)
    1304:	17fd                	addi	a5,a5,-1
    1306:	fef43023          	sd	a5,-32(s0)
    130a:	fe843783          	ld	a5,-24(s0)
    130e:	17fd                	addi	a5,a5,-1
    1310:	fef43423          	sd	a5,-24(s0)
    1314:	fe043783          	ld	a5,-32(s0)
    1318:	0007c703          	lbu	a4,0(a5)
    131c:	fe843783          	ld	a5,-24(s0)
    1320:	00e78023          	sb	a4,0(a5)
    while(n-- > 0)
    1324:	fcc42783          	lw	a5,-52(s0)
    1328:	fff7871b          	addiw	a4,a5,-1
    132c:	fce42623          	sw	a4,-52(s0)
    1330:	fcf048e3          	bgtz	a5,1300 <memmove+0x82>
  }
  return vdst;
    1334:	fd843783          	ld	a5,-40(s0)
}
    1338:	853e                	mv	a0,a5
    133a:	7462                	ld	s0,56(sp)
    133c:	6121                	addi	sp,sp,64
    133e:	8082                	ret

0000000000001340 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
    1340:	7139                	addi	sp,sp,-64
    1342:	fc22                	sd	s0,56(sp)
    1344:	0080                	addi	s0,sp,64
    1346:	fca43c23          	sd	a0,-40(s0)
    134a:	fcb43823          	sd	a1,-48(s0)
    134e:	87b2                	mv	a5,a2
    1350:	fcf42623          	sw	a5,-52(s0)
  const char *p1 = s1, *p2 = s2;
    1354:	fd843783          	ld	a5,-40(s0)
    1358:	fef43423          	sd	a5,-24(s0)
    135c:	fd043783          	ld	a5,-48(s0)
    1360:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    1364:	a0a1                	j	13ac <memcmp+0x6c>
    if (*p1 != *p2) {
    1366:	fe843783          	ld	a5,-24(s0)
    136a:	0007c703          	lbu	a4,0(a5)
    136e:	fe043783          	ld	a5,-32(s0)
    1372:	0007c783          	lbu	a5,0(a5)
    1376:	02f70163          	beq	a4,a5,1398 <memcmp+0x58>
      return *p1 - *p2;
    137a:	fe843783          	ld	a5,-24(s0)
    137e:	0007c783          	lbu	a5,0(a5)
    1382:	0007871b          	sext.w	a4,a5
    1386:	fe043783          	ld	a5,-32(s0)
    138a:	0007c783          	lbu	a5,0(a5)
    138e:	2781                	sext.w	a5,a5
    1390:	40f707bb          	subw	a5,a4,a5
    1394:	2781                	sext.w	a5,a5
    1396:	a01d                	j	13bc <memcmp+0x7c>
    }
    p1++;
    1398:	fe843783          	ld	a5,-24(s0)
    139c:	0785                	addi	a5,a5,1
    139e:	fef43423          	sd	a5,-24(s0)
    p2++;
    13a2:	fe043783          	ld	a5,-32(s0)
    13a6:	0785                	addi	a5,a5,1
    13a8:	fef43023          	sd	a5,-32(s0)
  while (n-- > 0) {
    13ac:	fcc42783          	lw	a5,-52(s0)
    13b0:	fff7871b          	addiw	a4,a5,-1
    13b4:	fce42623          	sw	a4,-52(s0)
    13b8:	f7dd                	bnez	a5,1366 <memcmp+0x26>
  }
  return 0;
    13ba:	4781                	li	a5,0
}
    13bc:	853e                	mv	a0,a5
    13be:	7462                	ld	s0,56(sp)
    13c0:	6121                	addi	sp,sp,64
    13c2:	8082                	ret

00000000000013c4 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
    13c4:	7179                	addi	sp,sp,-48
    13c6:	f406                	sd	ra,40(sp)
    13c8:	f022                	sd	s0,32(sp)
    13ca:	1800                	addi	s0,sp,48
    13cc:	fea43423          	sd	a0,-24(s0)
    13d0:	feb43023          	sd	a1,-32(s0)
    13d4:	87b2                	mv	a5,a2
    13d6:	fcf42e23          	sw	a5,-36(s0)
  return memmove(dst, src, n);
    13da:	fdc42783          	lw	a5,-36(s0)
    13de:	863e                	mv	a2,a5
    13e0:	fe043583          	ld	a1,-32(s0)
    13e4:	fe843503          	ld	a0,-24(s0)
    13e8:	00000097          	auipc	ra,0x0
    13ec:	e96080e7          	jalr	-362(ra) # 127e <memmove>
    13f0:	87aa                	mv	a5,a0
}
    13f2:	853e                	mv	a0,a5
    13f4:	70a2                	ld	ra,40(sp)
    13f6:	7402                	ld	s0,32(sp)
    13f8:	6145                	addi	sp,sp,48
    13fa:	8082                	ret

00000000000013fc <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
    13fc:	4885                	li	a7,1
 ecall
    13fe:	00000073          	ecall
 ret
    1402:	8082                	ret

0000000000001404 <exit>:
.global exit
exit:
 li a7, SYS_exit
    1404:	4889                	li	a7,2
 ecall
    1406:	00000073          	ecall
 ret
    140a:	8082                	ret

000000000000140c <wait>:
.global wait
wait:
 li a7, SYS_wait
    140c:	488d                	li	a7,3
 ecall
    140e:	00000073          	ecall
 ret
    1412:	8082                	ret

0000000000001414 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
    1414:	4891                	li	a7,4
 ecall
    1416:	00000073          	ecall
 ret
    141a:	8082                	ret

000000000000141c <read>:
.global read
read:
 li a7, SYS_read
    141c:	4895                	li	a7,5
 ecall
    141e:	00000073          	ecall
 ret
    1422:	8082                	ret

0000000000001424 <write>:
.global write
write:
 li a7, SYS_write
    1424:	48c1                	li	a7,16
 ecall
    1426:	00000073          	ecall
 ret
    142a:	8082                	ret

000000000000142c <close>:
.global close
close:
 li a7, SYS_close
    142c:	48d5                	li	a7,21
 ecall
    142e:	00000073          	ecall
 ret
    1432:	8082                	ret

0000000000001434 <kill>:
.global kill
kill:
 li a7, SYS_kill
    1434:	4899                	li	a7,6
 ecall
    1436:	00000073          	ecall
 ret
    143a:	8082                	ret

000000000000143c <exec>:
.global exec
exec:
 li a7, SYS_exec
    143c:	489d                	li	a7,7
 ecall
    143e:	00000073          	ecall
 ret
    1442:	8082                	ret

0000000000001444 <open>:
.global open
open:
 li a7, SYS_open
    1444:	48bd                	li	a7,15
 ecall
    1446:	00000073          	ecall
 ret
    144a:	8082                	ret

000000000000144c <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
    144c:	48c5                	li	a7,17
 ecall
    144e:	00000073          	ecall
 ret
    1452:	8082                	ret

0000000000001454 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
    1454:	48c9                	li	a7,18
 ecall
    1456:	00000073          	ecall
 ret
    145a:	8082                	ret

000000000000145c <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
    145c:	48a1                	li	a7,8
 ecall
    145e:	00000073          	ecall
 ret
    1462:	8082                	ret

0000000000001464 <link>:
.global link
link:
 li a7, SYS_link
    1464:	48cd                	li	a7,19
 ecall
    1466:	00000073          	ecall
 ret
    146a:	8082                	ret

000000000000146c <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
    146c:	48d1                	li	a7,20
 ecall
    146e:	00000073          	ecall
 ret
    1472:	8082                	ret

0000000000001474 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
    1474:	48a5                	li	a7,9
 ecall
    1476:	00000073          	ecall
 ret
    147a:	8082                	ret

000000000000147c <dup>:
.global dup
dup:
 li a7, SYS_dup
    147c:	48a9                	li	a7,10
 ecall
    147e:	00000073          	ecall
 ret
    1482:	8082                	ret

0000000000001484 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
    1484:	48ad                	li	a7,11
 ecall
    1486:	00000073          	ecall
 ret
    148a:	8082                	ret

000000000000148c <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
    148c:	48b1                	li	a7,12
 ecall
    148e:	00000073          	ecall
 ret
    1492:	8082                	ret

0000000000001494 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
    1494:	48b5                	li	a7,13
 ecall
    1496:	00000073          	ecall
 ret
    149a:	8082                	ret

000000000000149c <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
    149c:	48b9                	li	a7,14
 ecall
    149e:	00000073          	ecall
 ret
    14a2:	8082                	ret

00000000000014a4 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
    14a4:	1101                	addi	sp,sp,-32
    14a6:	ec06                	sd	ra,24(sp)
    14a8:	e822                	sd	s0,16(sp)
    14aa:	1000                	addi	s0,sp,32
    14ac:	87aa                	mv	a5,a0
    14ae:	872e                	mv	a4,a1
    14b0:	fef42623          	sw	a5,-20(s0)
    14b4:	87ba                	mv	a5,a4
    14b6:	fef405a3          	sb	a5,-21(s0)
  write(fd, &c, 1);
    14ba:	feb40713          	addi	a4,s0,-21
    14be:	fec42783          	lw	a5,-20(s0)
    14c2:	4605                	li	a2,1
    14c4:	85ba                	mv	a1,a4
    14c6:	853e                	mv	a0,a5
    14c8:	00000097          	auipc	ra,0x0
    14cc:	f5c080e7          	jalr	-164(ra) # 1424 <write>
}
    14d0:	0001                	nop
    14d2:	60e2                	ld	ra,24(sp)
    14d4:	6442                	ld	s0,16(sp)
    14d6:	6105                	addi	sp,sp,32
    14d8:	8082                	ret

00000000000014da <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    14da:	7139                	addi	sp,sp,-64
    14dc:	fc06                	sd	ra,56(sp)
    14de:	f822                	sd	s0,48(sp)
    14e0:	0080                	addi	s0,sp,64
    14e2:	87aa                	mv	a5,a0
    14e4:	8736                	mv	a4,a3
    14e6:	fcf42623          	sw	a5,-52(s0)
    14ea:	87ae                	mv	a5,a1
    14ec:	fcf42423          	sw	a5,-56(s0)
    14f0:	87b2                	mv	a5,a2
    14f2:	fcf42223          	sw	a5,-60(s0)
    14f6:	87ba                	mv	a5,a4
    14f8:	fcf42023          	sw	a5,-64(s0)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    14fc:	fe042423          	sw	zero,-24(s0)
  if(sgn && xx < 0){
    1500:	fc042783          	lw	a5,-64(s0)
    1504:	2781                	sext.w	a5,a5
    1506:	c38d                	beqz	a5,1528 <printint+0x4e>
    1508:	fc842783          	lw	a5,-56(s0)
    150c:	2781                	sext.w	a5,a5
    150e:	0007dd63          	bgez	a5,1528 <printint+0x4e>
    neg = 1;
    1512:	4785                	li	a5,1
    1514:	fef42423          	sw	a5,-24(s0)
    x = -xx;
    1518:	fc842783          	lw	a5,-56(s0)
    151c:	40f007bb          	negw	a5,a5
    1520:	2781                	sext.w	a5,a5
    1522:	fef42223          	sw	a5,-28(s0)
    1526:	a029                	j	1530 <printint+0x56>
  } else {
    x = xx;
    1528:	fc842783          	lw	a5,-56(s0)
    152c:	fef42223          	sw	a5,-28(s0)
  }

  i = 0;
    1530:	fe042623          	sw	zero,-20(s0)
  do{
    buf[i++] = digits[x % base];
    1534:	fc442783          	lw	a5,-60(s0)
    1538:	fe442703          	lw	a4,-28(s0)
    153c:	02f777bb          	remuw	a5,a4,a5
    1540:	0007861b          	sext.w	a2,a5
    1544:	fec42783          	lw	a5,-20(s0)
    1548:	0017871b          	addiw	a4,a5,1
    154c:	fee42623          	sw	a4,-20(s0)
    1550:	00001697          	auipc	a3,0x1
    1554:	ac068693          	addi	a3,a3,-1344 # 2010 <digits>
    1558:	02061713          	slli	a4,a2,0x20
    155c:	9301                	srli	a4,a4,0x20
    155e:	9736                	add	a4,a4,a3
    1560:	00074703          	lbu	a4,0(a4)
    1564:	ff040693          	addi	a3,s0,-16
    1568:	97b6                	add	a5,a5,a3
    156a:	fee78023          	sb	a4,-32(a5)
  }while((x /= base) != 0);
    156e:	fc442783          	lw	a5,-60(s0)
    1572:	fe442703          	lw	a4,-28(s0)
    1576:	02f757bb          	divuw	a5,a4,a5
    157a:	fef42223          	sw	a5,-28(s0)
    157e:	fe442783          	lw	a5,-28(s0)
    1582:	2781                	sext.w	a5,a5
    1584:	fbc5                	bnez	a5,1534 <printint+0x5a>
  if(neg)
    1586:	fe842783          	lw	a5,-24(s0)
    158a:	2781                	sext.w	a5,a5
    158c:	cf95                	beqz	a5,15c8 <printint+0xee>
    buf[i++] = '-';
    158e:	fec42783          	lw	a5,-20(s0)
    1592:	0017871b          	addiw	a4,a5,1
    1596:	fee42623          	sw	a4,-20(s0)
    159a:	ff040713          	addi	a4,s0,-16
    159e:	97ba                	add	a5,a5,a4
    15a0:	02d00713          	li	a4,45
    15a4:	fee78023          	sb	a4,-32(a5)

  while(--i >= 0)
    15a8:	a005                	j	15c8 <printint+0xee>
    putc(fd, buf[i]);
    15aa:	fec42783          	lw	a5,-20(s0)
    15ae:	ff040713          	addi	a4,s0,-16
    15b2:	97ba                	add	a5,a5,a4
    15b4:	fe07c703          	lbu	a4,-32(a5)
    15b8:	fcc42783          	lw	a5,-52(s0)
    15bc:	85ba                	mv	a1,a4
    15be:	853e                	mv	a0,a5
    15c0:	00000097          	auipc	ra,0x0
    15c4:	ee4080e7          	jalr	-284(ra) # 14a4 <putc>
  while(--i >= 0)
    15c8:	fec42783          	lw	a5,-20(s0)
    15cc:	37fd                	addiw	a5,a5,-1
    15ce:	fef42623          	sw	a5,-20(s0)
    15d2:	fec42783          	lw	a5,-20(s0)
    15d6:	2781                	sext.w	a5,a5
    15d8:	fc07d9e3          	bgez	a5,15aa <printint+0xd0>
}
    15dc:	0001                	nop
    15de:	0001                	nop
    15e0:	70e2                	ld	ra,56(sp)
    15e2:	7442                	ld	s0,48(sp)
    15e4:	6121                	addi	sp,sp,64
    15e6:	8082                	ret

00000000000015e8 <printptr>:

static void
printptr(int fd, uint64 x) {
    15e8:	7179                	addi	sp,sp,-48
    15ea:	f406                	sd	ra,40(sp)
    15ec:	f022                	sd	s0,32(sp)
    15ee:	1800                	addi	s0,sp,48
    15f0:	87aa                	mv	a5,a0
    15f2:	fcb43823          	sd	a1,-48(s0)
    15f6:	fcf42e23          	sw	a5,-36(s0)
  int i;
  putc(fd, '0');
    15fa:	fdc42783          	lw	a5,-36(s0)
    15fe:	03000593          	li	a1,48
    1602:	853e                	mv	a0,a5
    1604:	00000097          	auipc	ra,0x0
    1608:	ea0080e7          	jalr	-352(ra) # 14a4 <putc>
  putc(fd, 'x');
    160c:	fdc42783          	lw	a5,-36(s0)
    1610:	07800593          	li	a1,120
    1614:	853e                	mv	a0,a5
    1616:	00000097          	auipc	ra,0x0
    161a:	e8e080e7          	jalr	-370(ra) # 14a4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    161e:	fe042623          	sw	zero,-20(s0)
    1622:	a82d                	j	165c <printptr+0x74>
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
    1624:	fd043783          	ld	a5,-48(s0)
    1628:	93f1                	srli	a5,a5,0x3c
    162a:	00001717          	auipc	a4,0x1
    162e:	9e670713          	addi	a4,a4,-1562 # 2010 <digits>
    1632:	97ba                	add	a5,a5,a4
    1634:	0007c703          	lbu	a4,0(a5)
    1638:	fdc42783          	lw	a5,-36(s0)
    163c:	85ba                	mv	a1,a4
    163e:	853e                	mv	a0,a5
    1640:	00000097          	auipc	ra,0x0
    1644:	e64080e7          	jalr	-412(ra) # 14a4 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
    1648:	fec42783          	lw	a5,-20(s0)
    164c:	2785                	addiw	a5,a5,1
    164e:	fef42623          	sw	a5,-20(s0)
    1652:	fd043783          	ld	a5,-48(s0)
    1656:	0792                	slli	a5,a5,0x4
    1658:	fcf43823          	sd	a5,-48(s0)
    165c:	fec42783          	lw	a5,-20(s0)
    1660:	873e                	mv	a4,a5
    1662:	47bd                	li	a5,15
    1664:	fce7f0e3          	bgeu	a5,a4,1624 <printptr+0x3c>
}
    1668:	0001                	nop
    166a:	0001                	nop
    166c:	70a2                	ld	ra,40(sp)
    166e:	7402                	ld	s0,32(sp)
    1670:	6145                	addi	sp,sp,48
    1672:	8082                	ret

0000000000001674 <vprintf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
    1674:	715d                	addi	sp,sp,-80
    1676:	e486                	sd	ra,72(sp)
    1678:	e0a2                	sd	s0,64(sp)
    167a:	0880                	addi	s0,sp,80
    167c:	87aa                	mv	a5,a0
    167e:	fcb43023          	sd	a1,-64(s0)
    1682:	fac43c23          	sd	a2,-72(s0)
    1686:	fcf42623          	sw	a5,-52(s0)
  char *s;
  int c, i, state;

  state = 0;
    168a:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    168e:	fe042223          	sw	zero,-28(s0)
    1692:	a42d                	j	18bc <vprintf+0x248>
    c = fmt[i] & 0xff;
    1694:	fe442783          	lw	a5,-28(s0)
    1698:	fc043703          	ld	a4,-64(s0)
    169c:	97ba                	add	a5,a5,a4
    169e:	0007c783          	lbu	a5,0(a5)
    16a2:	fcf42e23          	sw	a5,-36(s0)
    if(state == 0){
    16a6:	fe042783          	lw	a5,-32(s0)
    16aa:	2781                	sext.w	a5,a5
    16ac:	eb9d                	bnez	a5,16e2 <vprintf+0x6e>
      if(c == '%'){
    16ae:	fdc42783          	lw	a5,-36(s0)
    16b2:	0007871b          	sext.w	a4,a5
    16b6:	02500793          	li	a5,37
    16ba:	00f71763          	bne	a4,a5,16c8 <vprintf+0x54>
        state = '%';
    16be:	02500793          	li	a5,37
    16c2:	fef42023          	sw	a5,-32(s0)
    16c6:	a2f5                	j	18b2 <vprintf+0x23e>
      } else {
        putc(fd, c);
    16c8:	fdc42783          	lw	a5,-36(s0)
    16cc:	0ff7f713          	andi	a4,a5,255
    16d0:	fcc42783          	lw	a5,-52(s0)
    16d4:	85ba                	mv	a1,a4
    16d6:	853e                	mv	a0,a5
    16d8:	00000097          	auipc	ra,0x0
    16dc:	dcc080e7          	jalr	-564(ra) # 14a4 <putc>
    16e0:	aac9                	j	18b2 <vprintf+0x23e>
      }
    } else if(state == '%'){
    16e2:	fe042783          	lw	a5,-32(s0)
    16e6:	0007871b          	sext.w	a4,a5
    16ea:	02500793          	li	a5,37
    16ee:	1cf71263          	bne	a4,a5,18b2 <vprintf+0x23e>
      if(c == 'd'){
    16f2:	fdc42783          	lw	a5,-36(s0)
    16f6:	0007871b          	sext.w	a4,a5
    16fa:	06400793          	li	a5,100
    16fe:	02f71463          	bne	a4,a5,1726 <vprintf+0xb2>
        printint(fd, va_arg(ap, int), 10, 1);
    1702:	fb843783          	ld	a5,-72(s0)
    1706:	00878713          	addi	a4,a5,8
    170a:	fae43c23          	sd	a4,-72(s0)
    170e:	4398                	lw	a4,0(a5)
    1710:	fcc42783          	lw	a5,-52(s0)
    1714:	4685                	li	a3,1
    1716:	4629                	li	a2,10
    1718:	85ba                	mv	a1,a4
    171a:	853e                	mv	a0,a5
    171c:	00000097          	auipc	ra,0x0
    1720:	dbe080e7          	jalr	-578(ra) # 14da <printint>
    1724:	a269                	j	18ae <vprintf+0x23a>
      } else if(c == 'l') {
    1726:	fdc42783          	lw	a5,-36(s0)
    172a:	0007871b          	sext.w	a4,a5
    172e:	06c00793          	li	a5,108
    1732:	02f71663          	bne	a4,a5,175e <vprintf+0xea>
        printint(fd, va_arg(ap, uint64), 10, 0);
    1736:	fb843783          	ld	a5,-72(s0)
    173a:	00878713          	addi	a4,a5,8
    173e:	fae43c23          	sd	a4,-72(s0)
    1742:	639c                	ld	a5,0(a5)
    1744:	0007871b          	sext.w	a4,a5
    1748:	fcc42783          	lw	a5,-52(s0)
    174c:	4681                	li	a3,0
    174e:	4629                	li	a2,10
    1750:	85ba                	mv	a1,a4
    1752:	853e                	mv	a0,a5
    1754:	00000097          	auipc	ra,0x0
    1758:	d86080e7          	jalr	-634(ra) # 14da <printint>
    175c:	aa89                	j	18ae <vprintf+0x23a>
      } else if(c == 'x') {
    175e:	fdc42783          	lw	a5,-36(s0)
    1762:	0007871b          	sext.w	a4,a5
    1766:	07800793          	li	a5,120
    176a:	02f71463          	bne	a4,a5,1792 <vprintf+0x11e>
        printint(fd, va_arg(ap, int), 16, 0);
    176e:	fb843783          	ld	a5,-72(s0)
    1772:	00878713          	addi	a4,a5,8
    1776:	fae43c23          	sd	a4,-72(s0)
    177a:	4398                	lw	a4,0(a5)
    177c:	fcc42783          	lw	a5,-52(s0)
    1780:	4681                	li	a3,0
    1782:	4641                	li	a2,16
    1784:	85ba                	mv	a1,a4
    1786:	853e                	mv	a0,a5
    1788:	00000097          	auipc	ra,0x0
    178c:	d52080e7          	jalr	-686(ra) # 14da <printint>
    1790:	aa39                	j	18ae <vprintf+0x23a>
      } else if(c == 'p') {
    1792:	fdc42783          	lw	a5,-36(s0)
    1796:	0007871b          	sext.w	a4,a5
    179a:	07000793          	li	a5,112
    179e:	02f71263          	bne	a4,a5,17c2 <vprintf+0x14e>
        printptr(fd, va_arg(ap, uint64));
    17a2:	fb843783          	ld	a5,-72(s0)
    17a6:	00878713          	addi	a4,a5,8
    17aa:	fae43c23          	sd	a4,-72(s0)
    17ae:	6398                	ld	a4,0(a5)
    17b0:	fcc42783          	lw	a5,-52(s0)
    17b4:	85ba                	mv	a1,a4
    17b6:	853e                	mv	a0,a5
    17b8:	00000097          	auipc	ra,0x0
    17bc:	e30080e7          	jalr	-464(ra) # 15e8 <printptr>
    17c0:	a0fd                	j	18ae <vprintf+0x23a>
      } else if(c == 's'){
    17c2:	fdc42783          	lw	a5,-36(s0)
    17c6:	0007871b          	sext.w	a4,a5
    17ca:	07300793          	li	a5,115
    17ce:	04f71c63          	bne	a4,a5,1826 <vprintf+0x1b2>
        s = va_arg(ap, char*);
    17d2:	fb843783          	ld	a5,-72(s0)
    17d6:	00878713          	addi	a4,a5,8
    17da:	fae43c23          	sd	a4,-72(s0)
    17de:	639c                	ld	a5,0(a5)
    17e0:	fef43423          	sd	a5,-24(s0)
        if(s == 0)
    17e4:	fe843783          	ld	a5,-24(s0)
    17e8:	eb8d                	bnez	a5,181a <vprintf+0x1a6>
          s = "(null)";
    17ea:	00000797          	auipc	a5,0x0
    17ee:	5c678793          	addi	a5,a5,1478 # 1db0 <malloc+0x28c>
    17f2:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    17f6:	a015                	j	181a <vprintf+0x1a6>
          putc(fd, *s);
    17f8:	fe843783          	ld	a5,-24(s0)
    17fc:	0007c703          	lbu	a4,0(a5)
    1800:	fcc42783          	lw	a5,-52(s0)
    1804:	85ba                	mv	a1,a4
    1806:	853e                	mv	a0,a5
    1808:	00000097          	auipc	ra,0x0
    180c:	c9c080e7          	jalr	-868(ra) # 14a4 <putc>
          s++;
    1810:	fe843783          	ld	a5,-24(s0)
    1814:	0785                	addi	a5,a5,1
    1816:	fef43423          	sd	a5,-24(s0)
        while(*s != 0){
    181a:	fe843783          	ld	a5,-24(s0)
    181e:	0007c783          	lbu	a5,0(a5)
    1822:	fbf9                	bnez	a5,17f8 <vprintf+0x184>
    1824:	a069                	j	18ae <vprintf+0x23a>
        }
      } else if(c == 'c'){
    1826:	fdc42783          	lw	a5,-36(s0)
    182a:	0007871b          	sext.w	a4,a5
    182e:	06300793          	li	a5,99
    1832:	02f71463          	bne	a4,a5,185a <vprintf+0x1e6>
        putc(fd, va_arg(ap, uint));
    1836:	fb843783          	ld	a5,-72(s0)
    183a:	00878713          	addi	a4,a5,8
    183e:	fae43c23          	sd	a4,-72(s0)
    1842:	439c                	lw	a5,0(a5)
    1844:	0ff7f713          	andi	a4,a5,255
    1848:	fcc42783          	lw	a5,-52(s0)
    184c:	85ba                	mv	a1,a4
    184e:	853e                	mv	a0,a5
    1850:	00000097          	auipc	ra,0x0
    1854:	c54080e7          	jalr	-940(ra) # 14a4 <putc>
    1858:	a899                	j	18ae <vprintf+0x23a>
      } else if(c == '%'){
    185a:	fdc42783          	lw	a5,-36(s0)
    185e:	0007871b          	sext.w	a4,a5
    1862:	02500793          	li	a5,37
    1866:	00f71f63          	bne	a4,a5,1884 <vprintf+0x210>
        putc(fd, c);
    186a:	fdc42783          	lw	a5,-36(s0)
    186e:	0ff7f713          	andi	a4,a5,255
    1872:	fcc42783          	lw	a5,-52(s0)
    1876:	85ba                	mv	a1,a4
    1878:	853e                	mv	a0,a5
    187a:	00000097          	auipc	ra,0x0
    187e:	c2a080e7          	jalr	-982(ra) # 14a4 <putc>
    1882:	a035                	j	18ae <vprintf+0x23a>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    1884:	fcc42783          	lw	a5,-52(s0)
    1888:	02500593          	li	a1,37
    188c:	853e                	mv	a0,a5
    188e:	00000097          	auipc	ra,0x0
    1892:	c16080e7          	jalr	-1002(ra) # 14a4 <putc>
        putc(fd, c);
    1896:	fdc42783          	lw	a5,-36(s0)
    189a:	0ff7f713          	andi	a4,a5,255
    189e:	fcc42783          	lw	a5,-52(s0)
    18a2:	85ba                	mv	a1,a4
    18a4:	853e                	mv	a0,a5
    18a6:	00000097          	auipc	ra,0x0
    18aa:	bfe080e7          	jalr	-1026(ra) # 14a4 <putc>
      }
      state = 0;
    18ae:	fe042023          	sw	zero,-32(s0)
  for(i = 0; fmt[i]; i++){
    18b2:	fe442783          	lw	a5,-28(s0)
    18b6:	2785                	addiw	a5,a5,1
    18b8:	fef42223          	sw	a5,-28(s0)
    18bc:	fe442783          	lw	a5,-28(s0)
    18c0:	fc043703          	ld	a4,-64(s0)
    18c4:	97ba                	add	a5,a5,a4
    18c6:	0007c783          	lbu	a5,0(a5)
    18ca:	dc0795e3          	bnez	a5,1694 <vprintf+0x20>
    }
  }
}
    18ce:	0001                	nop
    18d0:	0001                	nop
    18d2:	60a6                	ld	ra,72(sp)
    18d4:	6406                	ld	s0,64(sp)
    18d6:	6161                	addi	sp,sp,80
    18d8:	8082                	ret

00000000000018da <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
    18da:	7159                	addi	sp,sp,-112
    18dc:	fc06                	sd	ra,56(sp)
    18de:	f822                	sd	s0,48(sp)
    18e0:	0080                	addi	s0,sp,64
    18e2:	fcb43823          	sd	a1,-48(s0)
    18e6:	e010                	sd	a2,0(s0)
    18e8:	e414                	sd	a3,8(s0)
    18ea:	e818                	sd	a4,16(s0)
    18ec:	ec1c                	sd	a5,24(s0)
    18ee:	03043023          	sd	a6,32(s0)
    18f2:	03143423          	sd	a7,40(s0)
    18f6:	87aa                	mv	a5,a0
    18f8:	fcf42e23          	sw	a5,-36(s0)
  va_list ap;

  va_start(ap, fmt);
    18fc:	03040793          	addi	a5,s0,48
    1900:	fcf43423          	sd	a5,-56(s0)
    1904:	fc843783          	ld	a5,-56(s0)
    1908:	fd078793          	addi	a5,a5,-48
    190c:	fef43423          	sd	a5,-24(s0)
  vprintf(fd, fmt, ap);
    1910:	fe843703          	ld	a4,-24(s0)
    1914:	fdc42783          	lw	a5,-36(s0)
    1918:	863a                	mv	a2,a4
    191a:	fd043583          	ld	a1,-48(s0)
    191e:	853e                	mv	a0,a5
    1920:	00000097          	auipc	ra,0x0
    1924:	d54080e7          	jalr	-684(ra) # 1674 <vprintf>
}
    1928:	0001                	nop
    192a:	70e2                	ld	ra,56(sp)
    192c:	7442                	ld	s0,48(sp)
    192e:	6165                	addi	sp,sp,112
    1930:	8082                	ret

0000000000001932 <printf>:

void
printf(const char *fmt, ...)
{
    1932:	7159                	addi	sp,sp,-112
    1934:	f406                	sd	ra,40(sp)
    1936:	f022                	sd	s0,32(sp)
    1938:	1800                	addi	s0,sp,48
    193a:	fca43c23          	sd	a0,-40(s0)
    193e:	e40c                	sd	a1,8(s0)
    1940:	e810                	sd	a2,16(s0)
    1942:	ec14                	sd	a3,24(s0)
    1944:	f018                	sd	a4,32(s0)
    1946:	f41c                	sd	a5,40(s0)
    1948:	03043823          	sd	a6,48(s0)
    194c:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
    1950:	04040793          	addi	a5,s0,64
    1954:	fcf43823          	sd	a5,-48(s0)
    1958:	fd043783          	ld	a5,-48(s0)
    195c:	fc878793          	addi	a5,a5,-56
    1960:	fef43423          	sd	a5,-24(s0)
  vprintf(1, fmt, ap);
    1964:	fe843783          	ld	a5,-24(s0)
    1968:	863e                	mv	a2,a5
    196a:	fd843583          	ld	a1,-40(s0)
    196e:	4505                	li	a0,1
    1970:	00000097          	auipc	ra,0x0
    1974:	d04080e7          	jalr	-764(ra) # 1674 <vprintf>
}
    1978:	0001                	nop
    197a:	70a2                	ld	ra,40(sp)
    197c:	7402                	ld	s0,32(sp)
    197e:	6165                	addi	sp,sp,112
    1980:	8082                	ret

0000000000001982 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1982:	7179                	addi	sp,sp,-48
    1984:	f422                	sd	s0,40(sp)
    1986:	1800                	addi	s0,sp,48
    1988:	fca43c23          	sd	a0,-40(s0)
  Header *bp, *p;

  bp = (Header*)ap - 1;
    198c:	fd843783          	ld	a5,-40(s0)
    1990:	17c1                	addi	a5,a5,-16
    1992:	fef43023          	sd	a5,-32(s0)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1996:	00000797          	auipc	a5,0x0
    199a:	71278793          	addi	a5,a5,1810 # 20a8 <freep>
    199e:	639c                	ld	a5,0(a5)
    19a0:	fef43423          	sd	a5,-24(s0)
    19a4:	a815                	j	19d8 <free+0x56>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    19a6:	fe843783          	ld	a5,-24(s0)
    19aa:	639c                	ld	a5,0(a5)
    19ac:	fe843703          	ld	a4,-24(s0)
    19b0:	00f76f63          	bltu	a4,a5,19ce <free+0x4c>
    19b4:	fe043703          	ld	a4,-32(s0)
    19b8:	fe843783          	ld	a5,-24(s0)
    19bc:	02e7eb63          	bltu	a5,a4,19f2 <free+0x70>
    19c0:	fe843783          	ld	a5,-24(s0)
    19c4:	639c                	ld	a5,0(a5)
    19c6:	fe043703          	ld	a4,-32(s0)
    19ca:	02f76463          	bltu	a4,a5,19f2 <free+0x70>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    19ce:	fe843783          	ld	a5,-24(s0)
    19d2:	639c                	ld	a5,0(a5)
    19d4:	fef43423          	sd	a5,-24(s0)
    19d8:	fe043703          	ld	a4,-32(s0)
    19dc:	fe843783          	ld	a5,-24(s0)
    19e0:	fce7f3e3          	bgeu	a5,a4,19a6 <free+0x24>
    19e4:	fe843783          	ld	a5,-24(s0)
    19e8:	639c                	ld	a5,0(a5)
    19ea:	fe043703          	ld	a4,-32(s0)
    19ee:	faf77ce3          	bgeu	a4,a5,19a6 <free+0x24>
      break;
  if(bp + bp->s.size == p->s.ptr){
    19f2:	fe043783          	ld	a5,-32(s0)
    19f6:	479c                	lw	a5,8(a5)
    19f8:	1782                	slli	a5,a5,0x20
    19fa:	9381                	srli	a5,a5,0x20
    19fc:	0792                	slli	a5,a5,0x4
    19fe:	fe043703          	ld	a4,-32(s0)
    1a02:	973e                	add	a4,a4,a5
    1a04:	fe843783          	ld	a5,-24(s0)
    1a08:	639c                	ld	a5,0(a5)
    1a0a:	02f71763          	bne	a4,a5,1a38 <free+0xb6>
    bp->s.size += p->s.ptr->s.size;
    1a0e:	fe043783          	ld	a5,-32(s0)
    1a12:	4798                	lw	a4,8(a5)
    1a14:	fe843783          	ld	a5,-24(s0)
    1a18:	639c                	ld	a5,0(a5)
    1a1a:	479c                	lw	a5,8(a5)
    1a1c:	9fb9                	addw	a5,a5,a4
    1a1e:	0007871b          	sext.w	a4,a5
    1a22:	fe043783          	ld	a5,-32(s0)
    1a26:	c798                	sw	a4,8(a5)
    bp->s.ptr = p->s.ptr->s.ptr;
    1a28:	fe843783          	ld	a5,-24(s0)
    1a2c:	639c                	ld	a5,0(a5)
    1a2e:	6398                	ld	a4,0(a5)
    1a30:	fe043783          	ld	a5,-32(s0)
    1a34:	e398                	sd	a4,0(a5)
    1a36:	a039                	j	1a44 <free+0xc2>
  } else
    bp->s.ptr = p->s.ptr;
    1a38:	fe843783          	ld	a5,-24(s0)
    1a3c:	6398                	ld	a4,0(a5)
    1a3e:	fe043783          	ld	a5,-32(s0)
    1a42:	e398                	sd	a4,0(a5)
  if(p + p->s.size == bp){
    1a44:	fe843783          	ld	a5,-24(s0)
    1a48:	479c                	lw	a5,8(a5)
    1a4a:	1782                	slli	a5,a5,0x20
    1a4c:	9381                	srli	a5,a5,0x20
    1a4e:	0792                	slli	a5,a5,0x4
    1a50:	fe843703          	ld	a4,-24(s0)
    1a54:	97ba                	add	a5,a5,a4
    1a56:	fe043703          	ld	a4,-32(s0)
    1a5a:	02f71563          	bne	a4,a5,1a84 <free+0x102>
    p->s.size += bp->s.size;
    1a5e:	fe843783          	ld	a5,-24(s0)
    1a62:	4798                	lw	a4,8(a5)
    1a64:	fe043783          	ld	a5,-32(s0)
    1a68:	479c                	lw	a5,8(a5)
    1a6a:	9fb9                	addw	a5,a5,a4
    1a6c:	0007871b          	sext.w	a4,a5
    1a70:	fe843783          	ld	a5,-24(s0)
    1a74:	c798                	sw	a4,8(a5)
    p->s.ptr = bp->s.ptr;
    1a76:	fe043783          	ld	a5,-32(s0)
    1a7a:	6398                	ld	a4,0(a5)
    1a7c:	fe843783          	ld	a5,-24(s0)
    1a80:	e398                	sd	a4,0(a5)
    1a82:	a031                	j	1a8e <free+0x10c>
  } else
    p->s.ptr = bp;
    1a84:	fe843783          	ld	a5,-24(s0)
    1a88:	fe043703          	ld	a4,-32(s0)
    1a8c:	e398                	sd	a4,0(a5)
  freep = p;
    1a8e:	00000797          	auipc	a5,0x0
    1a92:	61a78793          	addi	a5,a5,1562 # 20a8 <freep>
    1a96:	fe843703          	ld	a4,-24(s0)
    1a9a:	e398                	sd	a4,0(a5)
}
    1a9c:	0001                	nop
    1a9e:	7422                	ld	s0,40(sp)
    1aa0:	6145                	addi	sp,sp,48
    1aa2:	8082                	ret

0000000000001aa4 <morecore>:

static Header*
morecore(uint nu)
{
    1aa4:	7179                	addi	sp,sp,-48
    1aa6:	f406                	sd	ra,40(sp)
    1aa8:	f022                	sd	s0,32(sp)
    1aaa:	1800                	addi	s0,sp,48
    1aac:	87aa                	mv	a5,a0
    1aae:	fcf42e23          	sw	a5,-36(s0)
  char *p;
  Header *hp;

  if(nu < 4096)
    1ab2:	fdc42783          	lw	a5,-36(s0)
    1ab6:	0007871b          	sext.w	a4,a5
    1aba:	6785                	lui	a5,0x1
    1abc:	00f77563          	bgeu	a4,a5,1ac6 <morecore+0x22>
    nu = 4096;
    1ac0:	6785                	lui	a5,0x1
    1ac2:	fcf42e23          	sw	a5,-36(s0)
  p = sbrk(nu * sizeof(Header));
    1ac6:	fdc42783          	lw	a5,-36(s0)
    1aca:	0047979b          	slliw	a5,a5,0x4
    1ace:	2781                	sext.w	a5,a5
    1ad0:	2781                	sext.w	a5,a5
    1ad2:	853e                	mv	a0,a5
    1ad4:	00000097          	auipc	ra,0x0
    1ad8:	9b8080e7          	jalr	-1608(ra) # 148c <sbrk>
    1adc:	fea43423          	sd	a0,-24(s0)
  if(p == (char*)-1)
    1ae0:	fe843703          	ld	a4,-24(s0)
    1ae4:	57fd                	li	a5,-1
    1ae6:	00f71463          	bne	a4,a5,1aee <morecore+0x4a>
    return 0;
    1aea:	4781                	li	a5,0
    1aec:	a03d                	j	1b1a <morecore+0x76>
  hp = (Header*)p;
    1aee:	fe843783          	ld	a5,-24(s0)
    1af2:	fef43023          	sd	a5,-32(s0)
  hp->s.size = nu;
    1af6:	fe043783          	ld	a5,-32(s0)
    1afa:	fdc42703          	lw	a4,-36(s0)
    1afe:	c798                	sw	a4,8(a5)
  free((void*)(hp + 1));
    1b00:	fe043783          	ld	a5,-32(s0)
    1b04:	07c1                	addi	a5,a5,16
    1b06:	853e                	mv	a0,a5
    1b08:	00000097          	auipc	ra,0x0
    1b0c:	e7a080e7          	jalr	-390(ra) # 1982 <free>
  return freep;
    1b10:	00000797          	auipc	a5,0x0
    1b14:	59878793          	addi	a5,a5,1432 # 20a8 <freep>
    1b18:	639c                	ld	a5,0(a5)
}
    1b1a:	853e                	mv	a0,a5
    1b1c:	70a2                	ld	ra,40(sp)
    1b1e:	7402                	ld	s0,32(sp)
    1b20:	6145                	addi	sp,sp,48
    1b22:	8082                	ret

0000000000001b24 <malloc>:

void*
malloc(uint nbytes)
{
    1b24:	7139                	addi	sp,sp,-64
    1b26:	fc06                	sd	ra,56(sp)
    1b28:	f822                	sd	s0,48(sp)
    1b2a:	0080                	addi	s0,sp,64
    1b2c:	87aa                	mv	a5,a0
    1b2e:	fcf42623          	sw	a5,-52(s0)
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1b32:	fcc46783          	lwu	a5,-52(s0)
    1b36:	07bd                	addi	a5,a5,15
    1b38:	8391                	srli	a5,a5,0x4
    1b3a:	2781                	sext.w	a5,a5
    1b3c:	2785                	addiw	a5,a5,1
    1b3e:	fcf42e23          	sw	a5,-36(s0)
  if((prevp = freep) == 0){
    1b42:	00000797          	auipc	a5,0x0
    1b46:	56678793          	addi	a5,a5,1382 # 20a8 <freep>
    1b4a:	639c                	ld	a5,0(a5)
    1b4c:	fef43023          	sd	a5,-32(s0)
    1b50:	fe043783          	ld	a5,-32(s0)
    1b54:	ef95                	bnez	a5,1b90 <malloc+0x6c>
    base.s.ptr = freep = prevp = &base;
    1b56:	00000797          	auipc	a5,0x0
    1b5a:	54278793          	addi	a5,a5,1346 # 2098 <base>
    1b5e:	fef43023          	sd	a5,-32(s0)
    1b62:	00000797          	auipc	a5,0x0
    1b66:	54678793          	addi	a5,a5,1350 # 20a8 <freep>
    1b6a:	fe043703          	ld	a4,-32(s0)
    1b6e:	e398                	sd	a4,0(a5)
    1b70:	00000797          	auipc	a5,0x0
    1b74:	53878793          	addi	a5,a5,1336 # 20a8 <freep>
    1b78:	6398                	ld	a4,0(a5)
    1b7a:	00000797          	auipc	a5,0x0
    1b7e:	51e78793          	addi	a5,a5,1310 # 2098 <base>
    1b82:	e398                	sd	a4,0(a5)
    base.s.size = 0;
    1b84:	00000797          	auipc	a5,0x0
    1b88:	51478793          	addi	a5,a5,1300 # 2098 <base>
    1b8c:	0007a423          	sw	zero,8(a5)
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1b90:	fe043783          	ld	a5,-32(s0)
    1b94:	639c                	ld	a5,0(a5)
    1b96:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1b9a:	fe843783          	ld	a5,-24(s0)
    1b9e:	4798                	lw	a4,8(a5)
    1ba0:	fdc42783          	lw	a5,-36(s0)
    1ba4:	2781                	sext.w	a5,a5
    1ba6:	06f76863          	bltu	a4,a5,1c16 <malloc+0xf2>
      if(p->s.size == nunits)
    1baa:	fe843783          	ld	a5,-24(s0)
    1bae:	4798                	lw	a4,8(a5)
    1bb0:	fdc42783          	lw	a5,-36(s0)
    1bb4:	2781                	sext.w	a5,a5
    1bb6:	00e79963          	bne	a5,a4,1bc8 <malloc+0xa4>
        prevp->s.ptr = p->s.ptr;
    1bba:	fe843783          	ld	a5,-24(s0)
    1bbe:	6398                	ld	a4,0(a5)
    1bc0:	fe043783          	ld	a5,-32(s0)
    1bc4:	e398                	sd	a4,0(a5)
    1bc6:	a82d                	j	1c00 <malloc+0xdc>
      else {
        p->s.size -= nunits;
    1bc8:	fe843783          	ld	a5,-24(s0)
    1bcc:	4798                	lw	a4,8(a5)
    1bce:	fdc42783          	lw	a5,-36(s0)
    1bd2:	40f707bb          	subw	a5,a4,a5
    1bd6:	0007871b          	sext.w	a4,a5
    1bda:	fe843783          	ld	a5,-24(s0)
    1bde:	c798                	sw	a4,8(a5)
        p += p->s.size;
    1be0:	fe843783          	ld	a5,-24(s0)
    1be4:	479c                	lw	a5,8(a5)
    1be6:	1782                	slli	a5,a5,0x20
    1be8:	9381                	srli	a5,a5,0x20
    1bea:	0792                	slli	a5,a5,0x4
    1bec:	fe843703          	ld	a4,-24(s0)
    1bf0:	97ba                	add	a5,a5,a4
    1bf2:	fef43423          	sd	a5,-24(s0)
        p->s.size = nunits;
    1bf6:	fe843783          	ld	a5,-24(s0)
    1bfa:	fdc42703          	lw	a4,-36(s0)
    1bfe:	c798                	sw	a4,8(a5)
      }
      freep = prevp;
    1c00:	00000797          	auipc	a5,0x0
    1c04:	4a878793          	addi	a5,a5,1192 # 20a8 <freep>
    1c08:	fe043703          	ld	a4,-32(s0)
    1c0c:	e398                	sd	a4,0(a5)
      return (void*)(p + 1);
    1c0e:	fe843783          	ld	a5,-24(s0)
    1c12:	07c1                	addi	a5,a5,16
    1c14:	a091                	j	1c58 <malloc+0x134>
    }
    if(p == freep)
    1c16:	00000797          	auipc	a5,0x0
    1c1a:	49278793          	addi	a5,a5,1170 # 20a8 <freep>
    1c1e:	639c                	ld	a5,0(a5)
    1c20:	fe843703          	ld	a4,-24(s0)
    1c24:	02f71063          	bne	a4,a5,1c44 <malloc+0x120>
      if((p = morecore(nunits)) == 0)
    1c28:	fdc42783          	lw	a5,-36(s0)
    1c2c:	853e                	mv	a0,a5
    1c2e:	00000097          	auipc	ra,0x0
    1c32:	e76080e7          	jalr	-394(ra) # 1aa4 <morecore>
    1c36:	fea43423          	sd	a0,-24(s0)
    1c3a:	fe843783          	ld	a5,-24(s0)
    1c3e:	e399                	bnez	a5,1c44 <malloc+0x120>
        return 0;
    1c40:	4781                	li	a5,0
    1c42:	a819                	j	1c58 <malloc+0x134>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1c44:	fe843783          	ld	a5,-24(s0)
    1c48:	fef43023          	sd	a5,-32(s0)
    1c4c:	fe843783          	ld	a5,-24(s0)
    1c50:	639c                	ld	a5,0(a5)
    1c52:	fef43423          	sd	a5,-24(s0)
    if(p->s.size >= nunits){
    1c56:	b791                	j	1b9a <malloc+0x76>
  }
}
    1c58:	853e                	mv	a0,a5
    1c5a:	70e2                	ld	ra,56(sp)
    1c5c:	7442                	ld	s0,48(sp)
    1c5e:	6121                	addi	sp,sp,64
    1c60:	8082                	ret
