
dopus_stuff.o:     file format a.out-amiga

Disassembly of section .text:

00000000 <__XCEXIT>:
       0:	rts
       2:	nop
       4:	addqw #8,%a2@(0000332e)@(00000000,%d6:w:4)
       a:	movew %a2@(00000063,%d2:w),%a1@-
       e:	bles 7e <_DoReadConfig+0x1e>
      10:	bnes 7b <_DoReadConfig+0x1b>
      12:	beqs 89 <_DoReadConfig+0x29>
      14:	moveq #97,%d1
      16:	moveq #105,%d2
      18:	bles 88 <_DoReadConfig+0x28>
      1a:	moveal %a6@-,%a0
      1c:	bvss 8a <_DoReadConfig+0x2a>
      1e:	bcss 93 <_DoReadConfig+0x33>
      20:	moveal %a6@(28532),%a0
      24:	moveal %a2@(00006f67)@(6e697365),%a0
      2e:	bccs 51 <__XCEXIT+0x51>
      30:	oriw #28526,%d3
      34:	moveq #105,%d2
      36:	bgts ad <_DoReadConfig+0x4d>
      38:	bcsw 529f <_req_rets.49+0x24cd>
      3c:	070565
      3e:	bcss b3 <_DoReadConfig+0x53>
      40:	moveq #0,%d2
      42:	movel %a4@(25381),%a2@(29477)
      48:	bges ad <_DoReadConfig+0x4d>
      4a:	orib #99,%fp@-
      4e:	movel %a4@(25637),%a2@(27747)
      54:	orib #99,%fp@-
      58:	movel %fp@-,%d2
      5a:	071445
      5c:	bges c1 <_DoReadConfig+0x61>
	...

00000060 <_DoReadConfig>:
      60:	lea %sp@(-832),%sp
      64:	moveml %d2-%d7/%a2-%a6,%sp@-
      68:	lea 0 <__XCEXIT>,%a4
			6a: 32	___a4_init
      6e:	movel %a0,%d2
      70:	movel %a1,%sp@(84)
      74:	clrl %sp@(68)
      78:	clrl %sp@(64)
      7c:	moveal %a1@,%a3
      7e:	tstl %a3
      80:	bnes 88 <_DoReadConfig+0x28>
      82:	moveq #-1,%d0
      84:	braw e80 <_DoReadConfig+0xe20>
      88:	moveal %sp@(84),%a0
      8c:	bsrw 23be <_DoFreeConfig>
      90:	lea %sp@(108),%a1
      94:	moveal %d2,%a0
      96:	bsrl 0 <__XCEXIT>
			98: DISP32	_DoCheckExist
      9c:	tstl %d0
      9e:	blts a8 <_DoReadConfig+0x48>
      a0:	moveq #50,%d0
      a2:	notb %d0
      a4:	braw e80 <_DoReadConfig+0xe20>
      a8:	addil #-9200,%sp@(108)
      b0:	lea %a4@(0),%a0
			b2: BASE16	_DOSBase
      b4:	movel %a0,%sp@(60)
      b8:	moveal %a0@,%a6
      ba:	movel %d2,%d1
      bc:	movel #1005,%d2
      c2:	jsr %a6@(-30)
      c6:	movel %d0,%sp@(80)
      ca:	bnes da <_DoReadConfig+0x7a>
      cc:	moveal %sp@(60),%a1
      d0:	moveal %a1@,%a6
      d2:	jsr %a6@(-132)
      d6:	braw e80 <_DoReadConfig+0xe20>
      da:	moveal %sp@(60),%a0
      de:	moveal %a0@,%a6
      e0:	movel %d0,%d1
      e2:	moveq #106,%d2
      e4:	addl %sp,%d2
      e6:	moveq #2,%d3
      e8:	jsr %a6@(-42)
      ec:	moveq #1,%d1
      ee:	cmpl %d0,%d1
      f0:	bges 11c <_DoReadConfig+0xbc>
      f2:	moveal %sp@(60),%a0
      f6:	moveal %a0@,%a6
      f8:	movel %sp@(80),%d1
      fc:	moveq #104,%d2
      fe:	addl %sp,%d2
     100:	jsr %a6@(-42)
     104:	moveq #1,%d1
     106:	cmpl %d0,%d1
     108:	bges 11c <_DoReadConfig+0xbc>
     10a:	cmpiw #-1330,%sp@(104)
     110:	bnes 190 <_DoReadConfig+0x130>
     112:	cmpiw #222,%sp@(106)
     118:	bnew 1a4 <_DoReadConfig+0x144>
     11c:	cmpiw #-1330,%sp@(104)
     122:	bnes 190 <_DoReadConfig+0x130>
     124:	cmpiw #222,%sp@(106)
     12a:	bnes 190 <_DoReadConfig+0x130>
     12c:	movel #4,%sp@(112)
			12e: 32	.text
     134:	movel #49,%sp@(96)
			136: 32	.text
     13c:	lea %sp@(96),%a0
     140:	clrl %a0@(4)
     144:	clrl %sp@(92)
     148:	movel %a0,%sp@(116)
     14c:	lea %sp@(92),%a0
     150:	movel %a0,%sp@(120)
     154:	moveq #-1,%d0
     156:	movel %d0,%sp@(124)
     15a:	movel %d0,%sp@(128)
     15e:	movel %d0,%sp@(132)
     162:	movel %d0,%sp@(136)
     166:	clrl %sp@(140)
     16a:	moveq #32,%d1
     16c:	movel %d1,%sp@(148)
     170:	moveal %a4@(0),%a0
			172: BASE16	_GfxBase
     174:	movel %a0@(154),%sp@(152)
     17a:	movel #58,%sp@(160)
			17c: 32	.text
     182:	moveal %a4@(0),%a6
			184: BASE16	_DOpusBase
     186:	subal %a0,%a0
     188:	lea %sp@(112),%a1
     18c:	jsr %a6@(-408)
     190:	moveal %sp@(60),%a0
     194:	moveal %a0@,%a6
     196:	movel %sp@(80),%d1
     19a:	jsr %a6@(-36)
     19e:	moveq #-1,%d0
     1a0:	braw e80 <_DoReadConfig+0xe20>
     1a4:	moveal %sp@(60),%a1
     1a8:	moveal %a1@,%a6
     1aa:	movel %sp@(80),%d1
     1ae:	clrl %d2
     1b0:	moveq #-1,%d3
     1b2:	jsr %a6@(-66)
     1b6:	moveal %sp@(60),%a0
     1ba:	moveal %a0@,%a6
     1bc:	movel %sp@(80),%d1
     1c0:	movel %a3,%d2
     1c2:	movel #9200,%d3
     1c8:	jsr %a6@(-42)
     1cc:	cmpil #9199,%d0
     1d2:	bhis 1f0 <_DoReadConfig+0x190>
     1d4:	moveal %sp@(60),%a1
     1d8:	moveal %a1@,%a6
     1da:	movel %sp@(80),%d1
     1de:	jsr %a6@(-36)
     1e2:	moveal %sp@(60),%a0
     1e6:	moveal %a0@,%a6
     1e8:	jsr %a6@(-132)
     1ec:	braw e80 <_DoReadConfig+0xe20>
     1f0:	cmpiw #10016,%a3@
     1f4:	bhis 254 <_DoReadConfig+0x1f4>
     1f6:	clrl %d3
     1f8:	clrl %d2
     1fa:	clrl %d1
     1fc:	movel %d1,%d0
     1fe:	addl %d2,%d0
     200:	lea %a3@(5044),%a6
     204:	moveal %d1,%a1
     206:	lea %a1@(00000000,%d3:l:8),%a0
     20a:	lea %a3@(7089),%a2
     20e:	moveb %a0@(00000000,%a2:l),%a6@(00000000,%d0:l)
     214:	lea %a3@(5076),%fp
     218:	lea %a3@(7138),%a1
     21c:	moveb %a0@(00000000,%a1:l),%fp@(00000000,%d0:l)
     222:	clrb %a0@(00000000,%a2:l)
     226:	clrb %a0@(00000000,%a1:l)
     22a:	addql #1,%d1
     22c:	moveq #7,%d0
     22e:	cmpl %d1,%d0
     230:	bges 1fc <_DoReadConfig+0x19c>
     232:	moveq #8,%d1
     234:	movel %d1,%d0
     236:	addl %d2,%d0
     238:	st %a6@(00000000,%d0:l)
     23c:	clrb %fp@(00000000,%d0:l)
     240:	addql #1,%d1
     242:	moveq #15,%d7
     244:	cmpl %d1,%d7
     246:	bges 234 <_DoReadConfig+0x1d4>
     248:	moveq #16,%d0
     24a:	addl %d0,%d2
     24c:	addql #1,%d3
     24e:	moveq #1,%d1
     250:	cmpl %d3,%d1
     252:	bges 1fa <_DoReadConfig+0x19a>
     254:	cmpiw #10017,%a3@
     258:	bhis 266 <_DoReadConfig+0x206>
     25a:	movew #-1,%a3@(7782)
     260:	movew #-1,%a3@(7784)
     266:	cmpiw #10018,%a3@
     26a:	bhis 288 <_DoReadConfig+0x228>
     26c:	movew %a3@(6028),%a3@(6850)
     272:	movew %a3@(6030),%a3@(6852)
     278:	movew %a3@(5254),%a3@(6854)
     27e:	movew %a3@(5258),%a3@(6856)
     284:	clrb %a3@(5108)
     288:	cmpiw #10019,%a3@
     28c:	bhis 294 <_DoReadConfig+0x234>
     28e:	moveb #1,%a3@(7781)
     294:	cmpiw #9999,%a3@
     298:	bhiw 36a <_DoReadConfig+0x30a>
     29c:	addqb #2,%a3@(5246)
     2a0:	moveb #1,%a3@(7105)
     2a6:	clrl %d3
     2a8:	clrl %d2
     2aa:	clrl %d1
     2ac:	movel %d1,%d0
     2ae:	addl %d2,%d0
     2b0:	lea %a3@(5044),%a0
     2b4:	moveb %d1,%a0@(00000000,%d0:l)
     2b8:	addql #1,%d1
     2ba:	moveq #4,%d7
     2bc:	cmpl %d1,%d7
     2be:	bges 2ac <_DoReadConfig+0x24c>
     2c0:	moveq #5,%d1
     2c2:	movel %d1,%d0
     2c4:	addl %d2,%d0
     2c6:	st %a0@(00000000,%d0:l)
     2ca:	addql #1,%d1
     2cc:	moveq #15,%d0
     2ce:	cmpl %d1,%d0
     2d0:	bges 2c2 <_DoReadConfig+0x262>
     2d2:	moveb #28,%a3@(000013d4,%d2:l)
     2da:	moveb #80,%a3@(000013d5,%d2:l)
     2e2:	moveb #40,%a3@(000013d6,%d2:l)
     2ea:	moveb #32,%a3@(000013d7,%d2:l)
     2f2:	moveb #32,%a3@(000013d8,%d2:l)
     2fa:	clrb %a3@(0000000d,%d3:l)
     2fe:	moveb #1,%a3@(00001394,%d3:l)
     306:	moveq #16,%d1
     308:	addl %d1,%d2
     30a:	addql #1,%d3
     30c:	moveq #1,%d7
     30e:	cmpl %d3,%d7
     310:	bges 2aa <_DoReadConfig+0x24a>
     312:	clrb %a3@(11)
     316:	moveb #13,%a3@(6021)
     31c:	cmpib #3,%a3@(6020)
     322:	bnes 32c <_DoReadConfig+0x2cc>
     324:	moveb #16,%a3@(6020)
     32a:	bras 330 <_DoReadConfig+0x2d0>
     32c:	clrb %a3@(6020)
     330:	orib #13,%a3@(6020)
     336:	moveb %a3@(6022),%d0
     33a:	extbl %d0
     33c:	moveq #1,%d1
     33e:	lsll %d0,%d1
     340:	moveb %d1,%a3@(6022)
     344:	movew %a3@(5528),%d0
     348:	clrb %a3@(5530)
     34c:	moveb %d0,%a3@(5531)
     350:	lsrw #8,%d0
     352:	movew %d0,%a3@(5528)
     356:	moveb #1,%a3@(7107)
     35c:	clrb %a3@(7108)
     360:	moveb #1,%a3@(7119)
     366:	clrb %a3@(7120)
     36a:	cmpiw #10012,%a3@
     36e:	bhis 3b4 <_DoReadConfig+0x354>
     370:	clrl %d3
     372:	lea %a3@(7586),%a1
     376:	movel %d3,%d1
     378:	addl %d1,%d1
     37a:	lea %a3@(5188),%a0
     37e:	moveb %a0@(00000000,%d1:l),%d0
     382:	moveq #28,%d2
     384:	lsll %d2,%d0
     386:	oril #268435455,%d0
     38c:	movel %d0,%a1@+
     38e:	moveb %a0@(00000001,%d1:l),%d0
     392:	moveq #24,%d7
     394:	lsll %d7,%d0
     396:	oril #268435455,%d0
     39c:	movel %d0,%a1@+
     39e:	movew %a0@(00000000,%d1:l),%d0
     3a2:	lsll %d2,%d0
     3a4:	oril #268435455,%d0
     3aa:	movel %d0,%a1@+
     3ac:	addql #1,%d3
     3ae:	moveq #15,%d0
     3b0:	cmpl %d3,%d0
     3b2:	bges 376 <_DoReadConfig+0x316>
     3b4:	cmpiw #10004,%a3@
     3b8:	bhis 3cc <_DoReadConfig+0x36c>
     3ba:	moveb %a3@(5385),%d0
     3be:	lsrb #1,%d0
     3c0:	moveb %d0,%a3@(5385)
     3c4:	bnes 3cc <_DoReadConfig+0x36c>
     3c6:	moveb #1,%a3@(5385)
     3cc:	cmpiw #10000,%a3@
     3d0:	bhiw 49c <_DoReadConfig+0x43c>
     3d4:	lea %a4@(0),%fp
			3d6: BASE16	_SysBase
     3d8:	moveal %fp@,%a6
     3da:	movel #1152,%d0
     3e0:	moveq #1,%d1
     3e2:	swap %d1
     3e4:	jsr %a6@(-198)
     3e8:	movel %d0,%d7
     3ea:	bnes 400 <_DoReadConfig+0x3a0>
     3ec:	moveal %sp@(60),%a0
     3f0:	moveal %a0@,%a6
     3f2:	movel %sp@(80),%d1
     3f6:	jsr %a6@(-36)
     3fa:	moveq #103,%d0
     3fc:	braw e80 <_DoReadConfig+0xe20>
     400:	movel %a3,%d6
     402:	addil #3696,%d6
     408:	moveq #10,%d5
     40a:	addl %d6,%d5
     40c:	movel %d0,%d4
     40e:	movel %d6,%d2
     410:	moveq #23,%d3
     412:	moveal %d6,%a1
     414:	lea %a1@(46),%a6
     418:	moveal %d7,%a0
     41a:	lea %a0@(32),%a2
     41e:	movel %d2,%sp@-
     420:	movel %d4,%sp@-
     422:	bsrl 0 <__XCEXIT>
			424: DISP32	_strcpy
     428:	moveb %a6@(-3),%a2@(-8)
     42e:	moveb %a6@(-2),%a2@(-7)
     434:	moveb %a6@(-1),%a2@(-3)
     43a:	moveb %a6@,%a2@(-2)
     43e:	movel %d5,%sp@-
     440:	bsrw e8a <_getstringcopy>
     444:	movel %d0,%a2@
     446:	lea %sp@(12),%sp
     44a:	moveq #48,%d0
     44c:	addl %d0,%d5
     44e:	moveq #36,%d1
     450:	addl %d1,%d4
     452:	lea %a2@(36),%a2
     456:	lea %a6@(48),%a6
     45a:	addl %d0,%d2
     45c:	dbf %d3,41e <_DoReadConfig+0x3be>
     460:	clrw %d3
     462:	subql #1,%d3
     464:	bccs 41e <_DoReadConfig+0x3be>
     466:	moveal %d7,%a0
     468:	lea %a0@(893),%a0
     46c:	moveq #7,%d3
     46e:	moveb #3,%a0@
     472:	lea %a0@(36),%a0
     476:	dbf %d3,46e <_DoReadConfig+0x40e>
     47a:	clrw %d3
     47c:	subql #1,%d3
     47e:	bccs 46e <_DoReadConfig+0x40e>
     480:	movel #1152,%d2
     486:	moveal %fp@,%a6
     488:	moveal %d7,%a0
     48a:	moveal %d6,%a1
     48c:	movel %d2,%d0
     48e:	jsr %a6@(-624)
     492:	moveal %fp@,%a6
     494:	moveal %d7,%a1
     496:	movel %d2,%d0
     498:	jsr %a6@(-210)
     49c:	cmpiw #10003,%a3@
     4a0:	bhis 514 <_DoReadConfig+0x4b4>
     4a2:	eorib #1,%a3@(6)
     4a8:	clrb %a3@(15)
     4ac:	clrb %a3@(6023)
     4b0:	clrb %a3@(5303)
     4b4:	clrb %a3@(5245)
     4b8:	clrl %d3
     4ba:	clrb %a3@(000016e1,%d3:l)
     4c0:	clrb %a3@(0000150a,%d3:l)
     4c6:	addql #1,%d3
     4c8:	moveq #1,%d2
     4ca:	cmpl %d3,%d2
     4cc:	bges 4ba <_DoReadConfig+0x45a>
     4ce:	clrl %d3
     4d0:	clrb %a3@(00001aca,%d3:l)
     4d6:	addql #1,%d3
     4d8:	cmpil #231,%d3
     4de:	bles 4d0 <_DoReadConfig+0x470>
     4e0:	clrl %d3
     4e2:	movel %d3,%d0
     4e4:	lsll #3,%d0
     4e6:	movew #-1,%a3@(00001bd2,%d0:l)
     4ee:	movew #-1,%a3@(00001bd6,%d0:l)
     4f6:	movew #-1,%a3@(00001bd4,%d0:l)
     4fe:	movew #-1,%a3@(00001bd8,%d0:l)
     506:	addql #1,%d3
     508:	moveq #1,%d7
     50a:	cmpl %d3,%d7
     50c:	bges 4e2 <_DoReadConfig+0x482>
     50e:	moveb #2,%a3@(7121)
     514:	cmpiw #10010,%a3@
     518:	bhis 55e <_DoReadConfig+0x4fe>
     51a:	moveq #96,%d4
     51c:	addl %a3,%d4
     51e:	clrl %d5
     520:	moveq #99,%d3
     522:	movel %d4,%sp@-
     524:	movel %sp,%d2
     526:	addil #774,%d2
     52c:	movel %d2,%sp@-
     52e:	bsrl 0 <__XCEXIT>
			530: DISP32	_strcpy
     534:	movel %d2,%sp@-
     536:	bsrw e8a <_getstringcopy>
     53a:	movel %d0,%a3@(00000060,%d5:l)
     53e:	clrl %a3@(00000064,%d5:l)
     542:	clrl %a3@(00000068,%d5:l)
     546:	clrl %a3@(0000006c,%d5:l)
     54a:	lea %sp@(12),%sp
     54e:	moveq #36,%d0
     550:	addl %d0,%d4
     552:	addl %d0,%d5
     554:	dbf %d3,522 <_DoReadConfig+0x4c2>
     558:	clrw %d3
     55a:	subql #1,%d3
     55c:	bccs 522 <_DoReadConfig+0x4c2>
     55e:	cmpiw #10013,%a3@
     562:	bhis 576 <_DoReadConfig+0x516>
     564:	clrl %d3
     566:	moveb #8,%a3@(00001e62,%d3:l)
     56e:	addql #1,%d3
     570:	moveq #2,%d1
     572:	cmpl %d3,%d1
     574:	bges 566 <_DoReadConfig+0x506>
     576:	cmpiw #10015,%a3@
     57a:	bhis 5a8 <_DoReadConfig+0x548>
     57c:	clrl %d3
     57e:	clrb %a3@(00001790,%d3:l)
     584:	clrb %a3@(00001548,%d3:l)
     58a:	addql #1,%d3
     58c:	moveq #79,%d2
     58e:	cmpl %d3,%d2
     590:	bges 57e <_DoReadConfig+0x51e>
     592:	clrl %d3
     594:	clrb %a3@(00001c11,%d3:l)
     59a:	addql #1,%d3
     59c:	cmpil #396,%d3
     5a2:	bles 594 <_DoReadConfig+0x534>
     5a4:	clrl %a3@(7582)
     5a8:	clrl %sp@(88)
     5ac:	lea %sp@(88),%a0
     5b0:	movel %a0,%sp@(56)
     5b4:	moveq #1,%d2
     5b6:	swap %d2
     5b8:	lea %a4@(0),%a2
			5ba: BASE16	_DOpusBase
     5bc:	moveal %a2@,%a6
     5be:	movel %sp@(108),%d0
     5c2:	movel %d2,%d1
     5c4:	jsr %a6@(-288)
     5c8:	movel %d0,%sp@(72)
     5cc:	beqs 5fa <_DoReadConfig+0x59a>
     5ce:	moveal %a2@,%a6
     5d0:	moveal %sp@(56),%a0
     5d4:	movel #4096,%d0
     5da:	movel %d2,%d1
     5dc:	jsr %a6@(-288)
     5e0:	movel %d0,%d6
     5e2:	beqs 5fa <_DoReadConfig+0x59a>
     5e4:	moveal %a2@,%a6
     5e6:	moveal %sp@(56),%a0
     5ea:	movel #256,%d0
     5f0:	movel %d2,%d1
     5f2:	jsr %a6@(-288)
     5f6:	tstl %d0
     5f8:	bnes 618 <_DoReadConfig+0x5b8>
     5fa:	moveal %sp@(60),%a1
     5fe:	moveal %a1@,%a6
     600:	movel %sp@(80),%d1
     604:	jsr %a6@(-36)
     608:	moveal %a2@,%a6
     60a:	moveal %sp@(56),%a0
     60e:	jsr %a6@(-294)
     612:	moveq #103,%d0
     614:	braw e80 <_DoReadConfig+0xe20>
     618:	moveal %sp@(60),%a0
     61c:	moveal %a0@,%a6
     61e:	movel %sp@(80),%d1
     622:	movel %sp@(72),%d2
     626:	movel %sp@(108),%d3
     62a:	jsr %a6@(-42)
     62e:	moveal %sp@(60),%a1
     632:	moveal %a1@,%a6
     634:	movel %sp@(80),%d1
     638:	jsr %a6@(-36)
     63c:	clrl %d0
     63e:	moveq #99,%d3
     640:	clrl %a3@(00000080,%d0:l)
     646:	cmpiw #10010,%a3@
     64a:	blss 650 <_DoReadConfig+0x5f0>
     64c:	clrl %a3@(00000060,%d0:l)
     650:	moveq #36,%d1
     652:	addl %d1,%d0
     654:	dbf %d3,640 <_DoReadConfig+0x5e0>
     658:	clrw %d3
     65a:	subql #1,%d3
     65c:	bccs 640 <_DoReadConfig+0x5e0>
     65e:	cmpiw #9999,%a3@
     662:	blss 67c <_DoReadConfig+0x61c>
     664:	clrl %d0
     666:	moveq #31,%d3
     668:	clrl %a3@(00000e90,%d0:l)
     66e:	moveq #36,%d2
     670:	addl %d2,%d0
     672:	dbf %d3,668 <_DoReadConfig+0x608>
     676:	clrw %d3
     678:	subql #1,%d3
     67a:	bccs 668 <_DoReadConfig+0x608>
     67c:	clrl %d5
     67e:	clrl %d3
     680:	movel %sp@(108),%sp@-
     684:	movel %d6,%sp@-
     686:	movel %d5,%sp@-
     688:	movel %sp@(84),%sp@-
     68c:	bsrw 1e82 <_readline>
     690:	movel %d0,%d5
     692:	lea %sp@(16),%sp
     696:	moveal %d6,%a0
     698:	tstb %a0@
     69a:	beqs 6ac <_DoReadConfig+0x64c>
     69c:	moveal %d6,%a2
     69e:	moveaw #-1,%a1
     6a2:	movel %d3,%d0
     6a4:	moveal %sp@(84),%a0
     6a8:	bsrw 2278 <_DoAssignMenu>
     6ac:	moveq #-1,%d0
     6ae:	cmpl %d5,%d0
     6b0:	beqw e68 <_DoReadConfig+0xe08>
     6b4:	addql #1,%d3
     6b6:	moveq #99,%d1
     6b8:	cmpl %d3,%d1
     6ba:	bges 680 <_DoReadConfig+0x620>
     6bc:	cmpiw #10010,%a3@
     6c0:	blss 700 <_DoReadConfig+0x6a0>
     6c2:	clrl %d3
     6c4:	movel %sp@(108),%sp@-
     6c8:	movel %d6,%sp@-
     6ca:	movel %d5,%sp@-
     6cc:	movel %sp@(84),%sp@-
     6d0:	bsrw 1e82 <_readline>
     6d4:	movel %d0,%d5
     6d6:	lea %sp@(16),%sp
     6da:	moveal %d6,%a0
     6dc:	tstb %a0@
     6de:	beqs 6f0 <_DoReadConfig+0x690>
     6e0:	moveaw #-1,%a2
     6e4:	moveal %d6,%a1
     6e6:	movel %d3,%d0
     6e8:	moveal %sp@(84),%a0
     6ec:	bsrw 2278 <_DoAssignMenu>
     6f0:	moveq #-1,%d0
     6f2:	cmpl %d5,%d0
     6f4:	beqw e68 <_DoReadConfig+0xe08>
     6f8:	addql #1,%d3
     6fa:	moveq #99,%d1
     6fc:	cmpl %d3,%d1
     6fe:	bges 6c4 <_DoReadConfig+0x664>
     700:	cmpiw #9999,%a3@
     704:	blss 74a <_DoReadConfig+0x6ea>
     706:	clrl %d3
     708:	movel %sp@(108),%sp@-
     70c:	movel %d6,%sp@-
     70e:	movel %d5,%sp@-
     710:	movel %sp@(84),%sp@-
     714:	bsrw 1e82 <_readline>
     718:	movel %d0,%d5
     71a:	lea %sp@(16),%sp
     71e:	moveal %d6,%a0
     720:	tstb %a0@
     722:	beqs 738 <_DoReadConfig+0x6d8>
     724:	movel %d6,%sp@-
     726:	pea ffffffff <_req_rets.49+0xffffd22d>
     72a:	movel %d3,%sp@-
     72c:	movel %sp@(96),%sp@-
     730:	bsrw 22fe <_DoAssignDrive>
     734:	lea %sp@(16),%sp
     738:	moveq #-1,%d0
     73a:	cmpl %d5,%d0
     73c:	beqw e68 <_DoReadConfig+0xe08>
     740:	addql #1,%d3
     742:	moveq #31,%d1
     744:	cmpl %d3,%d1
     746:	bges 708 <_DoReadConfig+0x6a8>
     748:	bras 76c <_DoReadConfig+0x70c>
     74a:	moveq #5,%d3
     74c:	movel %sp@(108),%sp@-
     750:	movel %d6,%sp@-
     752:	movel %d5,%sp@-
     754:	movel %sp@(84),%sp@-
     758:	bsrw 1e82 <_readline>
     75c:	movel %d0,%d5
     75e:	lea %sp@(16),%sp
     762:	dbf %d3,74c <_DoReadConfig+0x6ec>
     766:	clrw %d3
     768:	subql #1,%d3
     76a:	bccs 74c <_DoReadConfig+0x6ec>
     76c:	moveq #-1,%d2
     76e:	movel %d2,%sp@(76)
     772:	movel %sp@(108),%d1
     776:	cmpl %d5,%d1
     778:	blew e68 <_DoReadConfig+0xe08>
     77c:	braw e40 <_DoReadConfig+0xde0>
     780:	lea %a4@(0),%fp
			782: BASE16	_SysBase
     784:	moveal %fp@,%a6
     786:	moveq #84,%d0
     788:	moveq #1,%d1
     78a:	swap %d1
     78c:	jsr %a6@(-198)
     790:	moveal %d0,%a2
     792:	tstl %d0
     794:	beqs 7ac <_DoReadConfig+0x74c>
     796:	moveal %fp@,%a6
     798:	moveal %sp@(72),%a0
     79c:	addal %d5,%a0
     79e:	moveal %d0,%a1
     7a0:	moveq #84,%d0
     7a2:	jsr %a6@(-624)
     7a6:	clrl %a2@(80)
     7aa:	clrl %a2@
     7ac:	movel %sp@(108),%sp@-
     7b0:	movel %d6,%sp@-
     7b2:	moveal %d5,%a1
     7b4:	pea %a1@(84)
     7b8:	movel %sp@(84),%sp@-
     7bc:	bsrw 1e82 <_readline>
     7c0:	movel %d0,%d5
     7c2:	lea %sp@(16),%sp
     7c6:	moveq #-1,%d0
     7c8:	cmpl %d5,%d0
     7ca:	beqw e68 <_DoReadConfig+0xe08>
     7ce:	tstl %a2
     7d0:	beqw e36 <_DoReadConfig+0xdd6>
     7d4:	movel %d6,%sp@-
     7d6:	bsrw e8a <_getstringcopy>
     7da:	movel %d0,%a2@(80)
     7de:	addql #4,%sp
     7e0:	tstl %sp@(64)
     7e4:	beqs 7ee <_DoReadConfig+0x78e>
     7e6:	moveal %sp@(64),%a0
     7ea:	movel %a2,%a0@
     7ec:	bras 7f6 <_DoReadConfig+0x796>
     7ee:	moveal %sp@(84),%a1
     7f2:	movel %a2,%a1@(20)
     7f6:	movel %a2,%sp@(64)
     7fa:	braw e36 <_DoReadConfig+0xdd6>
     7fe:	moveal %sp@(72),%a0
     802:	moveb %a0@(00000000,%d5:l),%d1
     806:	cmpib #6,%d1
     80a:	bnew 974 <_DoReadConfig+0x914>
     80e:	cmpib #70,%a0@(00000001,%d5:l)
     814:	bnew 974 <_DoReadConfig+0x914>
     818:	addql #2,%d5
     81a:	movel %d5,%d7
     81c:	addil #844,%d7
     822:	cmpl %sp@(108),%d7
     826:	bccw e68 <_DoReadConfig+0xe08>
     82a:	movel %sp@(84),%d4
     82e:	addql #4,%d4
     830:	lea %a4@(0),%a1
			832: BASE16	_DOpusBase
     834:	movel %a1,%d2
     836:	moveal %a1@,%a6
     838:	moveal %d4,%a0
     83a:	movel #916,%d0
     840:	moveq #1,%d1
     842:	swap %d1
     844:	jsr %a6@(-288)
     848:	moveal %d0,%a2
     84a:	tstl %d0
     84c:	beqw e36 <_DoReadConfig+0xdd6>
     850:	moveal %a4@(0),%a6
			852: BASE16	_SysBase
     854:	moveal %sp@(72),%a0
     858:	addal %d5,%a0
     85a:	moveal %d0,%a1
     85c:	movel #844,%d0
     862:	jsr %a6@(-624)
     866:	cmpiw #10014,%a3@
     86a:	bhis 874 <_DoReadConfig+0x814>
     86c:	clrb %a2@(35)
     870:	clrb %a2@(36)
     874:	clrl %a2@(844)
     878:	clrl %d3
     87a:	lea %a2@(848),%fp
     87e:	clrl %fp@(00000000,%d3:l:4)
     882:	addql #1,%d3
     884:	moveq #15,%d0
     886:	cmpl %d3,%d0
     888:	bges 87a <_DoReadConfig+0x81a>
     88a:	movel %sp@(108),%sp@-
     88e:	movel %d6,%sp@-
     890:	movel %d7,%sp@-
     892:	movel %sp@(84),%sp@-
     896:	bsrw 1e82 <_readline>
     89a:	movel %d0,%d5
     89c:	lea %sp@(16),%sp
     8a0:	moveq #-1,%d1
     8a2:	cmpl %d5,%d1
     8a4:	beqw e68 <_DoReadConfig+0xe08>
     8a8:	movel %d6,%sp@-
     8aa:	bsrl 0 <__XCEXIT>
			8ac: DISP32	_strlen
     8b0:	addql #4,%sp
     8b2:	moveal %d2,%a0
     8b4:	moveal %a0@,%a6
     8b6:	moveal %d4,%a0
     8b8:	addql #1,%d0
     8ba:	clrl %d1
     8bc:	jsr %a6@(-288)
     8c0:	movel %d0,%a2@(844)
     8c4:	beqs 8d2 <_DoReadConfig+0x872>
     8c6:	movel %d6,%sp@-
     8c8:	movel %d0,%sp@-
     8ca:	bsrl 0 <__XCEXIT>
			8cc: DISP32	_strcpy
     8d0:	addql #8,%sp
     8d2:	clrl %d3
     8d4:	bras 902 <_DoReadConfig+0x8a2>
     8d6:	movel %d6,%sp@-
     8d8:	bsrl 0 <__XCEXIT>
			8da: DISP32	_strlen
     8de:	addql #4,%sp
     8e0:	moveal %d2,%a1
     8e2:	moveal %a1@,%a6
     8e4:	moveal %d4,%a0
     8e6:	addql #1,%d0
     8e8:	clrl %d1
     8ea:	jsr %a6@(-288)
     8ee:	movel %d0,%fp@
     8f0:	beqs 8fe <_DoReadConfig+0x89e>
     8f2:	movel %d6,%sp@-
     8f4:	movel %d0,%sp@-
     8f6:	bsrl 0 <__XCEXIT>
			8f8: DISP32	_strcpy
     8fc:	addql #8,%sp
     8fe:	addql #4,%fp
     900:	addql #1,%d3
     902:	moveq #15,%d0
     904:	cmpl %d3,%d0
     906:	blts 924 <_DoReadConfig+0x8c4>
     908:	movel %sp@(108),%sp@-
     90c:	movel %d6,%sp@-
     90e:	movel %d5,%sp@-
     910:	movel %sp@(84),%sp@-
     914:	bsrw 1e82 <_readline>
     918:	movel %d0,%d5
     91a:	lea %sp@(16),%sp
     91e:	moveq #-1,%d1
     920:	cmpl %d5,%d1
     922:	bnes 8d6 <_DoReadConfig+0x876>
     924:	clrl %a2@(912)
     928:	cmpiw #10009,%a3@
     92c:	blsw c70 <_DoReadConfig+0xc10>
     930:	movel %sp@(108),%sp@-
     934:	movel %d6,%sp@-
     936:	movel %d5,%sp@-
     938:	movel %sp@(84),%sp@-
     93c:	bsrw 1e82 <_readline>
     940:	movel %d0,%d5
     942:	lea %sp@(16),%sp
     946:	moveal %d6,%a0
     948:	tstb %a0@
     94a:	beqw c70 <_DoReadConfig+0xc10>
     94e:	movel %sp@(84),%d2
     952:	addql #4,%d2
     954:	movel %d6,%sp@-
     956:	bsrl 0 <__XCEXIT>
			958: DISP32	_strlen
     95c:	addql #4,%sp
     95e:	moveal %a4@(0),%a6
			960: BASE16	_DOpusBase
     962:	moveal %d2,%a0
     964:	addql #1,%d0
     966:	clrl %d1
     968:	jsr %a6@(-288)
     96c:	movel %d0,%a2@(912)
     970:	braw c60 <_DoReadConfig+0xc00>
     974:	cmpib #1,%d1
     978:	bnew c80 <_DoReadConfig+0xc20>
     97c:	moveal %sp@(72),%a1
     980:	cmpib #70,%a1@(00000001,%d5:l)
     986:	bnew c80 <_DoReadConfig+0xc20>
     98a:	addql #2,%d5
     98c:	movel %d5,%d2
     98e:	addil #504,%d2
     994:	cmpl %sp@(108),%d2
     998:	bccw e68 <_DoReadConfig+0xe08>
     99c:	movel %sp@(84),%d0
     9a0:	addql #4,%d0
     9a2:	movel %d0,%sp@(52)
     9a6:	lea %a4@(0),%a0
			9a8: BASE16	_DOpusBase
     9aa:	movel %a0,%sp@(48)
     9ae:	moveal %a0@,%a6
     9b0:	moveal %d0,%a0
     9b2:	movel #916,%d0
     9b8:	moveq #1,%d1
     9ba:	swap %d1
     9bc:	jsr %a6@(-288)
     9c0:	moveal %d0,%a2
     9c2:	tstl %a2
     9c4:	beqw e36 <_DoReadConfig+0xdd6>
     9c8:	lea %sp@(164),%a1
     9cc:	movel %a1,%sp@(44)
     9d0:	moveal %a4@(0),%a6
			9d2: BASE16	_SysBase
     9d4:	moveal %sp@(72),%a0
     9d8:	addal %d5,%a0
     9da:	movel #504,%d0
     9e0:	jsr %a6@(-624)
     9e4:	movel %d2,%d5
     9e6:	moveal %sp@(48),%a0
     9ea:	moveal %a0@,%a6
     9ec:	lea %a2@(4),%a0
     9f0:	moveal %sp@(44),%a1
     9f4:	addql #4,%a1
     9f6:	moveq #32,%d0
     9f8:	jsr %a6@(-120)
     9fc:	clrb %a2@(35)
     a00:	clrb %a2@(36)
     a04:	clrl %d3
     a06:	lea %a2@(848),%fp
     a0a:	clrl %fp@(00000000,%d3:l:4)
     a0e:	addql #1,%d3
     a10:	moveq #15,%d0
     a12:	cmpl %d3,%d0
     a14:	bges a06 <_DoReadConfig+0x9a6>
     a16:	clrl %d3
     a18:	lea %a2@(44),%a6
     a1c:	clrl %d7
     a1e:	movel %sp@(44),%d4
     a22:	addil #204,%d4
     a28:	pea 27 <__XCEXIT+0x27>
     a2c:	movel %d4,%sp@-
     a2e:	movel %d3,%d2
     a30:	lsll #2,%d2
     a32:	movel %a6,%sp@-
     a34:	bsrl 0 <__XCEXIT>
			a36: DISP32	_strncpy
     a3a:	clrb %a2@(00000053,%d7:l)
     a3e:	movel %sp@(0000026c,%d2:l),%a2@(000002ac,%d2:l)
     a48:	lea %a2@(748),%a1
     a4c:	movel %sp@(0000027c,%d2:l),%a1@(00000000,%d2:l)
     a54:	moveb %sp@(0000028c,%d3:l),%a2@(0000032c,%d3:l)
     a5e:	lea %a2@(828),%a0
     a62:	moveb %sp@(00000290,%d3:l),%a0@(00000000,%d3:l)
     a6a:	lea %sp@(12),%sp
     a6e:	lea %a6@(40),%a6
     a72:	moveq #40,%d1
     a74:	addl %d1,%d7
     a76:	moveq #60,%d2
     a78:	addl %d2,%d4
     a7a:	addql #1,%d3
     a7c:	moveq #3,%d0
     a7e:	cmpl %d3,%d0
     a80:	bges a28 <_DoReadConfig+0x9c8>
     a82:	moveq #4,%d3
     a84:	movel #4000,%a1@(00000000,%d3:l:4)
     a8c:	moveb #2,%a0@(00000000,%d3:l)
     a92:	addql #1,%d3
     a94:	moveq #15,%d1
     a96:	cmpl %d3,%d1
     a98:	bges a84 <_DoReadConfig+0xa24>
     a9a:	clrl %d3
     a9c:	bras ad0 <_DoReadConfig+0xa70>
     a9e:	movel %d6,%sp@-
     aa0:	bsrl 0 <__XCEXIT>
			aa2: DISP32	_strlen
     aa6:	addql #4,%sp
     aa8:	moveal %sp@(48),%a0
     aac:	moveal %a0@,%a6
     aae:	moveal %sp@(52),%a0
     ab2:	addql #1,%d0
     ab4:	moveq #1,%d1
     ab6:	swap %d1
     ab8:	jsr %a6@(-288)
     abc:	movel %d0,%fp@
     abe:	beqs acc <_DoReadConfig+0xa6c>
     ac0:	movel %d6,%sp@-
     ac2:	movel %d0,%sp@-
     ac4:	bsrl 0 <__XCEXIT>
			ac6: DISP32	_strcpy
     aca:	addql #8,%sp
     acc:	addql #4,%fp
     ace:	addql #1,%d3
     ad0:	moveq #3,%d0
     ad2:	cmpl %d3,%d0
     ad4:	blts af2 <_DoReadConfig+0xa92>
     ad6:	movel %sp@(108),%sp@-
     ada:	movel %d6,%sp@-
     adc:	movel %d5,%sp@-
     ade:	movel %sp@(84),%sp@-
     ae2:	bsrw 1e82 <_readline>
     ae6:	movel %d0,%d5
     ae8:	lea %sp@(16),%sp
     aec:	moveq #-1,%d1
     aee:	cmpl %d5,%d1
     af0:	bnes a9e <_DoReadConfig+0xa3e>
     af2:	moveal %d6,%a0
     af4:	clrb %a0@
     af6:	tstb %sp@(208)
     afa:	beqs b32 <_DoReadConfig+0xad2>
     afc:	tstb %sp@(268)
     b00:	beqs b10 <_DoReadConfig+0xab0>
     b02:	moveq #2,%d0
     b04:	notb %d0
     b06:	tstb %sp@(648)
     b0a:	beqs b14 <_DoReadConfig+0xab4>
     b0c:	addql #1,%d0
     b0e:	bras b14 <_DoReadConfig+0xab4>
     b10:	moveq #0,%d0
     b12:	notb %d0
     b14:	movel %d0,%sp@-
     b16:	moveal %sp@(48),%a1
     b1a:	pea %a1@(44)
     b1e:	pea 2 <__XCEXIT+0x2>
     b22:	pea %pc@(42 <__XCEXIT+0x42>)
     b26:	movel %d6,%sp@-
     b28:	bsrl 0 <__XCEXIT>
			b2a: DISP32	_LSprintf
     b2e:	lea %sp@(20),%sp
     b32:	tstb %sp@(268)
     b36:	beqw c3c <_DoReadConfig+0xbdc>
     b3a:	clrl %d2
     b3c:	clrl %d1
     b3e:	clrl %d3
     b40:	movel %sp,%d4
     b42:	addil #268,%d4
     b48:	moveal %d4,%a0
     b4a:	moveb %a0@(00000000,%d3:l),%d0
     b4e:	beqs b58 <_DoReadConfig+0xaf8>
     b50:	cmpib #44,%d0
     b54:	bnew bec <_DoReadConfig+0xb8c>
     b58:	lea %sp@(770),%a0
     b5c:	clrb %a0@(00000000,%d1:l)
     b60:	tstl %d2
     b62:	bnes baa <_DoReadConfig+0xb4a>
     b64:	lea %a4@(0),%fp
			b66: BASE16	_DOpusBase
     b68:	moveal %fp@,%a6
     b6a:	clrl %d0
     b6c:	jsr %a6@(-396)
     b70:	tstl %d0
     b72:	bles ba6 <_DoReadConfig+0xb46>
     b74:	pea ff <_DoReadConfig+0x9f>
     b78:	movel %d0,%sp@-
     b7a:	pea 7 <__XCEXIT+0x7>
     b7e:	pea %pc@(4b <__XCEXIT+0x4b>)
     b82:	movel %sp,%d2
     b84:	addil #684,%d2
     b8a:	movel %d2,%sp@-
     b8c:	bsrl 0 <__XCEXIT>
			b8e: DISP32	_LSprintf
     b92:	lea %sp@(20),%sp
     b96:	moveal %fp@,%a6
     b98:	moveal %d6,%a0
     b9a:	moveal %d2,%a1
     b9c:	movel #4096,%d0
     ba2:	jsr %a6@(-156)
     ba6:	moveq #1,%d2
     ba8:	bras be0 <_DoReadConfig+0xb80>
     baa:	pea fe <_DoReadConfig+0x9e>
     bae:	movel %a0,%sp@-
     bb0:	pea 1 <__XCEXIT+0x1>
     bb4:	pea %pc@(55 <__XCEXIT+0x55>)
     bb8:	movel %sp,%d2
     bba:	addil #684,%d2
     bc0:	movel %d2,%sp@-
     bc2:	bsrl 0 <__XCEXIT>
			bc4: DISP32	_LSprintf
     bc8:	lea %sp@(20),%sp
     bcc:	moveal %a4@(0),%a6
			bce: BASE16	_DOpusBase
     bd0:	moveal %d6,%a0
     bd2:	moveal %d2,%a1
     bd4:	movel #4096,%d0
     bda:	jsr %a6@(-156)
     bde:	clrl %d2
     be0:	moveal %d4,%a1
     be2:	tstb %a1@(00000000,%d3:l)
     be6:	beqs c22 <_DoReadConfig+0xbc2>
     be8:	clrl %d1
     bea:	bras c18 <_DoReadConfig+0xbb8>
     bec:	moveq #1,%d7
     bee:	cmpl %d2,%d7
     bf0:	bnes c0c <_DoReadConfig+0xbac>
     bf2:	cmpib #46,%d0
     bf6:	bnes c0c <_DoReadConfig+0xbac>
     bf8:	lea %sp@(770),%a0
     bfc:	moveb #63,%a0@(00000000,%d1:l)
     c02:	addql #1,%d1
     c04:	moveb #63,%a0@(00000000,%d1:l)
     c0a:	bras c16 <_DoReadConfig+0xbb6>
     c0c:	moveal %d4,%a0
     c0e:	moveb %a0@(00000000,%d3:l),%sp@(00000302,%d1:l)
     c16:	addql #1,%d1
     c18:	addql #1,%d3
     c1a:	moveq #99,%d0
     c1c:	cmpl %d3,%d0
     c1e:	bgew b40 <_DoReadConfig+0xae0>
     c22:	movel %d6,%sp@-
     c24:	bsrl 0 <__XCEXIT>
			c26: DISP32	_strlen
     c2a:	movel %d0,%d1
     c2c:	addql #4,%sp
     c2e:	moveal %d1,%a0
     c30:	cmpib #-2,%a0@(ffffffff,%d6:l)
     c36:	bnes c3c <_DoReadConfig+0xbdc>
     c38:	clrb %a0@(ffffffff,%d6:l)
     c3c:	movel %sp@(84),%d2
     c40:	addql #4,%d2
     c42:	movel %d6,%sp@-
     c44:	bsrl 0 <__XCEXIT>
			c46: DISP32	_strlen
     c4a:	addql #4,%sp
     c4c:	moveal %a4@(0),%a6
			c4e: BASE16	_DOpusBase
     c50:	moveal %d2,%a0
     c52:	addql #1,%d0
     c54:	moveq #1,%d1
     c56:	swap %d1
     c58:	jsr %a6@(-288)
     c5c:	movel %d0,%a2@(844)
     c60:	tstl %d0
     c62:	beqs c70 <_DoReadConfig+0xc10>
     c64:	movel %d6,%sp@-
     c66:	movel %d0,%sp@-
     c68:	bsrl 0 <__XCEXIT>
			c6a: DISP32	_strcpy
     c6e:	addql #8,%sp
     c70:	movel %a2,%sp@-
     c72:	movel %sp@(88),%sp@-
     c76:	bsrw 237c <_linkinnewfiletype>
     c7a:	addql #8,%sp
     c7c:	braw e36 <_DoReadConfig+0xdd6>
     c80:	moveb %d1,%d0
     c82:	subqb #2,%d0
     c84:	cmpib #1,%d0
     c88:	bhiw e36 <_DoReadConfig+0xdd6>
     c8c:	moveal %sp@(72),%a1
     c90:	cmpib #71,%a1@(00000001,%d5:l)
     c96:	bnew e36 <_DoReadConfig+0xdd6>
     c9a:	cmpib #2,%d1
     c9e:	bnes caa <_DoReadConfig+0xc4a>
     ca0:	clrl %d3
     ca2:	movel #2688,%d1
     ca8:	bras cb2 <_DoReadConfig+0xc52>
     caa:	moveq #1,%d3
     cac:	movel #3024,%d1
     cb2:	addql #2,%d5
     cb4:	movel %d5,%d0
     cb6:	addl %d1,%d0
     cb8:	cmpl %sp@(108),%d0
     cbc:	bgew e68 <_DoReadConfig+0xe08>
     cc0:	addql #1,%sp@(76)
     cc4:	lea %a4@(0),%a0
			cc6: BASE16	_SysBase
     cc8:	movel %a0,%d7
     cca:	moveal %a0@,%a6
     ccc:	movel #3028,%d0
     cd2:	moveq #1,%d1
     cd4:	swap %d1
     cd6:	jsr %a6@(-198)
     cda:	moveal %d0,%fp
     cdc:	tstl %d0
     cde:	beqw e68 <_DoReadConfig+0xe08>
     ce2:	moveal %sp@(84),%a1
     ce6:	tstl %a1@(12)
     cea:	bnes cf2 <_DoReadConfig+0xc92>
     cec:	movel %d0,%a1@(12)
     cf0:	bras cfa <_DoReadConfig+0xc9a>
     cf2:	moveal %sp@(68),%a0
     cf6:	movel %d0,%a0@(3024)
     cfa:	movel %fp,%sp@(68)
     cfe:	tstl %d3
     d00:	beqs d20 <_DoReadConfig+0xcc0>
     d02:	moveal %d7,%a1
     d04:	moveal %a1@,%a6
     d06:	moveal %sp@(72),%a0
     d0a:	addal %d5,%a0
     d0c:	moveal %fp,%a1
     d0e:	movel #3024,%d0
     d14:	jsr %a6@(-624)
     d18:	addil #3024,%d5
     d1e:	bras d62 <_DoReadConfig+0xd02>
     d20:	moveq #16,%d4
     d22:	addl %fp,%d4
     d24:	movel %fp,%d2
     d26:	moveal %sp@(72),%a0
     d2a:	lea %a0@(0000000a,%d5:l),%a2
     d2e:	moveq #84,%d3
     d30:	moveal %d7,%a1
     d32:	moveal %a1@,%a6
     d34:	moveal %sp@(72),%a0
     d38:	addal %d5,%a0
     d3a:	moveal %d2,%a1
     d3c:	moveq #10,%d0
     d3e:	jsr %a6@(-624)
     d42:	moveal %d7,%a0
     d44:	moveal %a0@,%a6
     d46:	moveal %a2,%a0
     d48:	moveal %d4,%a1
     d4a:	moveq #16,%d0
     d4c:	jsr %a6@(-624)
     d50:	lea %a2@(32),%a2
     d54:	moveq #32,%d0
     d56:	addl %d0,%d5
     d58:	moveq #36,%d1
     d5a:	addl %d1,%d4
     d5c:	addl %d1,%d2
     d5e:	subql #1,%d3
     d60:	bnes d30 <_DoReadConfig+0xcd0>
     d62:	clrl %d2
     d64:	clrl %d3
     d66:	clrl %fp@(00000020,%d3:l)
     d6a:	moveal %d6,%a0
     d6c:	clrb %a0@
     d6e:	moveq #-1,%d0
     d70:	cmpl %d5,%d0
     d72:	bges d9e <_DoReadConfig+0xd3e>
     d74:	movel %sp@(108),%sp@-
     d78:	movel %d6,%sp@-
     d7a:	movel %d5,%sp@-
     d7c:	movel %sp@(84),%sp@-
     d80:	bsrw 1e82 <_readline>
     d84:	movel %d0,%d5
     d86:	moveal %d6,%a2
     d88:	moveaw #-1,%a1
     d8c:	movel %d2,%d1
     d8e:	movel %sp@(92),%d0
     d92:	moveal %sp@(100),%a0
     d96:	bsrw 21ae <_DoAssignGadget>
     d9a:	lea %sp@(16),%sp
     d9e:	moveq #36,%d1
     da0:	addl %d1,%d3
     da2:	addql #1,%d2
     da4:	moveq #83,%d7
     da6:	cmpl %d2,%d7
     da8:	bges d66 <_DoReadConfig+0xd06>
     daa:	cmpiw #10010,%a3@
     dae:	blss df8 <_DoReadConfig+0xd98>
     db0:	clrl %d2
     db2:	moveal %fp,%a6
     db4:	clrl %a6@
     db6:	lea %a6@(36),%a6
     dba:	moveal %d6,%a0
     dbc:	clrb %a0@
     dbe:	moveq #-1,%d0
     dc0:	cmpl %d5,%d0
     dc2:	bges dee <_DoReadConfig+0xd8e>
     dc4:	movel %sp@(108),%sp@-
     dc8:	movel %d6,%sp@-
     dca:	movel %d5,%sp@-
     dcc:	movel %sp@(84),%sp@-
     dd0:	bsrw 1e82 <_readline>
     dd4:	movel %d0,%d5
     dd6:	moveaw #-1,%a2
     dda:	moveal %d6,%a1
     ddc:	movel %d2,%d1
     dde:	movel %sp@(92),%d0
     de2:	moveal %sp@(100),%a0
     de6:	bsrw 21ae <_DoAssignGadget>
     dea:	lea %sp@(16),%sp
     dee:	addql #1,%d2
     df0:	moveq #83,%d1
     df2:	cmpl %d2,%d1
     df4:	bges db4 <_DoReadConfig+0xd54>
     df6:	bras e30 <_DoReadConfig+0xdd0>
     df8:	moveal %fp,%a2
     dfa:	clrl %d3
     dfc:	moveq #83,%d2
     dfe:	movel %a2,%sp@-
     e00:	movel %d6,%sp@-
     e02:	bsrl 0 <__XCEXIT>
			e04: DISP32	_strcpy
     e08:	movel %d6,%sp@-
     e0a:	bsrs e8a <_getstringcopy>
     e0c:	movel %d0,%a2@
     e0e:	clrl %fp@(00000004,%d3:l)
     e12:	clrl %fp@(00000008,%d3:l)
     e16:	clrl %fp@(0000000c,%d3:l)
     e1a:	lea %sp@(12),%sp
     e1e:	lea %a2@(36),%a2
     e22:	moveq #36,%d7
     e24:	addl %d7,%d3
     e26:	dbf %d2,dfe <_DoReadConfig+0xd9e>
     e2a:	clrw %d2
     e2c:	subql #1,%d2
     e2e:	bccs dfe <_DoReadConfig+0xd9e>
     e30:	moveq #-1,%d0
     e32:	cmpl %d5,%d0
     e34:	beqs e68 <_DoReadConfig+0xe08>
     e36:	movel %sp@(108),%d1
     e3a:	cmpl %d5,%d1
     e3c:	bles e68 <_DoReadConfig+0xe08>
     e3e:	moveq #-1,%d2
     e40:	cmpl %d5,%d2
     e42:	beqs e68 <_DoReadConfig+0xe08>
     e44:	moveal %sp@(72),%a0
     e48:	cmpib #5,%a0@(00000000,%d5:l)
     e4e:	bnew 7fe <_DoReadConfig+0x79e>
     e52:	cmpib #72,%a0@(00000001,%d5:l)
     e58:	bnew 7fe <_DoReadConfig+0x79e>
     e5c:	addql #2,%d5
     e5e:	moveq #84,%d0
     e60:	addl %d5,%d0
     e62:	cmpl %d0,%d1
     e64:	bhiw 780 <_DoReadConfig+0x720>
     e68:	moveal %a4@(0),%a6
			e6a: BASE16	_DOpusBase
     e6c:	moveal %sp@(56),%a0
     e70:	jsr %a6@(-294)
     e74:	moveal %sp@(84),%a1
     e78:	movel %a1@(12),%a1@(16)
     e7e:	moveq #1,%d0
     e80:	moveml %sp@+,%d2-%d7/%a2-%a6
     e84:	lea %sp@(832),%sp
     e88:	rts

00000e8a <_getstringcopy>:
     e8a:	movel %a6,%sp@-
     e8c:	movel %d2,%sp@-
     e8e:	movel %sp@(12),%d2
     e92:	subal %a6,%a6
     e94:	beqs ebe <_getstringcopy+0x34>
     e96:	movel %d2,%sp@-
     e98:	bsrl 0 <__XCEXIT>
			e9a: DISP32	_strlen
     e9e:	addql #4,%sp
     ea0:	moveal %a4@(0),%a6
			ea2: BASE16	_SysBase
     ea4:	addql #1,%d0
     ea6:	clrl %d1
     ea8:	jsr %a6@(-198)
     eac:	moveal %d0,%a6
     eae:	tstl %d0
     eb0:	beqs ebe <_getstringcopy+0x34>
     eb2:	movel %d2,%sp@-
     eb4:	movel %d0,%sp@-
     eb6:	bsrl 0 <__XCEXIT>
			eb8: DISP32	_strcpy
     ebc:	addql #8,%sp
     ebe:	movel %a6,%d0
     ec0:	movel %sp@+,%d2
     ec2:	moveal %sp@+,%a6
     ec4:	rts
     ec6:	addiw #3,%d6
     eca:	chkl %d0,%d3
     ecc:	movepl %a0@(0),%d2

00000ed0 <_DoSaveConfig>:
     ed0:	moveml %d2-%d5/%a2-%a6,%sp@-
     ed4:	lea 0 <__XCEXIT>,%a4
			ed6: 32	___a4_init
     eda:	movel %a0,%d1
     edc:	moveal %a1,%fp
     ede:	clrl %d5
     ee0:	moveal %fp@,%a2
     ee2:	tstl %a2
     ee4:	beqs f24 <_DoSaveConfig+0x54>
     ee6:	movew #10020,%a2@
     eea:	movew #-1330,%a2@(2)
     ef0:	lea %a4@(0),%a3
			ef2: BASE16	_DOSBase
     ef4:	moveal %a3@,%a6
     ef6:	movel #1006,%d2
     efc:	jsr %a6@(-30)
     f00:	movel %d0,%d4
     f02:	beqs f24 <_DoSaveConfig+0x54>
     f04:	moveal %a3@,%a6
     f06:	movel %d0,%d1
     f08:	movel %a2,%d2
     f0a:	movel #9200,%d3
     f10:	jsr %a6@(-48)
     f14:	cmpil #9199,%d0
     f1a:	bhis f2a <_DoSaveConfig+0x5a>
     f1c:	moveal %a3@,%a6
     f1e:	movel %d4,%d1
     f20:	jsr %a6@(-36)
     f24:	clrl %d0
     f26:	braw 10f0 <_DoSaveConfig+0x220>
     f2a:	clrl %d2
     f2c:	clrl %d3
     f2e:	movel %a2@(00000080,%d3:l),%sp@-
     f34:	movel %d4,%sp@-
     f36:	bsrw 10f6 <_writestring>
     f3a:	addql #8,%sp
     f3c:	tstl %d0
     f3e:	beqw 10e4 <_DoSaveConfig+0x214>
     f42:	moveq #36,%d0
     f44:	addl %d0,%d3
     f46:	addql #1,%d2
     f48:	moveq #99,%d1
     f4a:	cmpl %d2,%d1
     f4c:	bges f2e <_DoSaveConfig+0x5e>
     f4e:	clrl %d2
     f50:	clrl %d3
     f52:	movel %a2@(00000060,%d3:l),%sp@-
     f56:	movel %d4,%sp@-
     f58:	bsrw 10f6 <_writestring>
     f5c:	addql #8,%sp
     f5e:	tstl %d0
     f60:	beqw 10e4 <_DoSaveConfig+0x214>
     f64:	moveq #36,%d0
     f66:	addl %d0,%d3
     f68:	addql #1,%d2
     f6a:	moveq #99,%d1
     f6c:	cmpl %d2,%d1
     f6e:	bges f52 <_DoSaveConfig+0x82>
     f70:	clrl %d2
     f72:	clrl %d3
     f74:	movel %a2@(00000e90,%d3:l),%sp@-
     f7a:	movel %d4,%sp@-
     f7c:	bsrw 10f6 <_writestring>
     f80:	addql #8,%sp
     f82:	tstl %d0
     f84:	beqw 10e4 <_DoSaveConfig+0x214>
     f88:	moveq #36,%d0
     f8a:	addl %d0,%d3
     f8c:	addql #1,%d2
     f8e:	moveq #31,%d1
     f90:	cmpl %d2,%d1
     f92:	bges f74 <_DoSaveConfig+0xa4>
     f94:	moveal %fp@(8),%a2
     f98:	tstl %a2
     f9a:	beqs 1018 <_DoSaveConfig+0x148>
     f9c:	moveal %a3@,%a6
     f9e:	movel %d4,%d1
     fa0:	movel #3782,%d2
			fa2: 32	.text
     fa6:	moveq #2,%d3
     fa8:	jsr %a6@(-48)
     fac:	moveq #1,%d1
     fae:	cmpl %d0,%d1
     fb0:	bgew 10e4 <_DoSaveConfig+0x214>
     fb4:	moveal %a3@,%a6
     fb6:	movel %d4,%d1
     fb8:	movel %a2,%d2
     fba:	movel #844,%d3
     fc0:	jsr %a6@(-48)
     fc4:	cmpil #843,%d0
     fca:	blsw 10e4 <_DoSaveConfig+0x214>
     fce:	movel %a2@(844),%sp@-
     fd2:	movel %d4,%sp@-
     fd4:	bsrw 10f6 <_writestring>
     fd8:	addql #8,%sp
     fda:	tstl %d0
     fdc:	beqw 10e4 <_DoSaveConfig+0x214>
     fe0:	clrl %d2
     fe2:	lea %a2@(848),%a0
     fe6:	movel %a0@(00000000,%d2:l:4),%sp@-
     fea:	movel %d4,%sp@-
     fec:	bsrw 10f6 <_writestring>
     ff0:	addql #8,%sp
     ff2:	tstl %d0
     ff4:	beqw 10e4 <_DoSaveConfig+0x214>
     ff8:	addql #1,%d2
     ffa:	moveq #15,%d0
     ffc:	cmpl %d2,%d0
     ffe:	bges fe2 <_DoSaveConfig+0x112>
    1000:	movel %a2@(912),%sp@-
    1004:	movel %d4,%sp@-
    1006:	bsrw 10f6 <_writestring>
    100a:	addql #8,%sp
    100c:	tstl %d0
    100e:	beqw 10e4 <_DoSaveConfig+0x214>
    1012:	moveal %a2@,%a2
    1014:	tstl %a2
    1016:	bnes f9c <_DoSaveConfig+0xcc>
    1018:	moveal %fp@(12),%a2
    101c:	tstl %a2
    101e:	beqs 109a <_DoSaveConfig+0x1ca>
    1020:	lea %a4@(0),%a3
			1022: BASE16	_DOSBase
    1024:	moveal %a3@,%a6
    1026:	movel %d4,%d1
    1028:	movel #3785,%d2
			102a: 32	.text
    102e:	moveq #2,%d3
    1030:	jsr %a6@(-48)
    1034:	moveq #1,%d1
    1036:	cmpl %d0,%d1
    1038:	bgew 10e4 <_DoSaveConfig+0x214>
    103c:	moveal %a3@,%a6
    103e:	movel %d4,%d1
    1040:	movel %a2,%d2
    1042:	movel #3024,%d3
    1048:	jsr %a6@(-48)
    104c:	cmpil #3023,%d0
    1052:	blsw 10e4 <_DoSaveConfig+0x214>
    1056:	clrl %d2
    1058:	clrl %d3
    105a:	movel %a2@(00000020,%d3:l),%sp@-
    105e:	movel %d4,%sp@-
    1060:	bsrw 10f6 <_writestring>
    1064:	addql #8,%sp
    1066:	tstl %d0
    1068:	beqs 10e4 <_DoSaveConfig+0x214>
    106a:	moveq #36,%d0
    106c:	addl %d0,%d3
    106e:	addql #1,%d2
    1070:	moveq #83,%d1
    1072:	cmpl %d2,%d1
    1074:	bges 105a <_DoSaveConfig+0x18a>
    1076:	clrl %d2
    1078:	moveal %a2,%a6
    107a:	movel %a6@,%sp@-
    107c:	lea %a6@(36),%a6
    1080:	movel %d4,%sp@-
    1082:	bsrs 10f6 <_writestring>
    1084:	addql #8,%sp
    1086:	tstl %d0
    1088:	beqs 10e4 <_DoSaveConfig+0x214>
    108a:	addql #1,%d2
    108c:	moveq #83,%d0
    108e:	cmpl %d2,%d0
    1090:	bges 107a <_DoSaveConfig+0x1aa>
    1092:	moveal %a2@(3024),%a2
    1096:	tstl %a2
    1098:	bnes 1020 <_DoSaveConfig+0x150>
    109a:	moveal %fp@(20),%a2
    109e:	tstl %a2
    10a0:	beqs 10e2 <_DoSaveConfig+0x212>
    10a2:	lea %a4@(0),%a3
			10a4: BASE16	_DOSBase
    10a6:	moveal %a3@,%a6
    10a8:	movel %d4,%d1
    10aa:	movel #3788,%d2
			10ac: 32	.text
    10b0:	moveq #2,%d3
    10b2:	jsr %a6@(-48)
    10b6:	moveq #1,%d1
    10b8:	cmpl %d0,%d1
    10ba:	bges 10e4 <_DoSaveConfig+0x214>
    10bc:	moveal %a3@,%a6
    10be:	movel %d4,%d1
    10c0:	movel %a2,%d2
    10c2:	moveq #84,%d3
    10c4:	jsr %a6@(-48)
    10c8:	moveq #83,%d1
    10ca:	cmpl %d0,%d1
    10cc:	bccs 10e4 <_DoSaveConfig+0x214>
    10ce:	movel %a2@(80),%sp@-
    10d2:	movel %d4,%sp@-
    10d4:	bsrs 10f6 <_writestring>
    10d6:	addql #8,%sp
    10d8:	tstl %d0
    10da:	beqs 10e4 <_DoSaveConfig+0x214>
    10dc:	moveal %a2@,%a2
    10de:	tstl %a2
    10e0:	bnes 10a2 <_DoSaveConfig+0x1d2>
    10e2:	moveq #1,%d5
    10e4:	moveal %a4@(0),%a6
			10e6: BASE16	_DOSBase
    10e8:	movel %d4,%d1
    10ea:	jsr %a6@(-36)
    10ee:	movel %d5,%d0
    10f0:	moveml %sp@+,%d2-%d5/%a2-%a6
    10f4:	rts

000010f6 <_writestring>:
    10f6:	subqw #8,%sp
    10f8:	moveml %d2-%d4/%a6,%sp@-
    10fc:	movel %sp@(28),%d4
    1100:	movel %sp@(32),%d2
    1104:	clrb %sp@(19)
    1108:	tstl %d2
    110a:	beqs 112c <_writestring+0x36>
    110c:	movel %d2,%sp@-
    110e:	bsrl 0 <__XCEXIT>
			1110: DISP32	_strlen
    1114:	addql #4,%sp
    1116:	movel %d0,%d3
    1118:	addql #1,%d3
    111a:	moveal %a4@(0),%a6
			111c: BASE16	_DOSBase
    111e:	movel %d4,%d1
    1120:	jsr %a6@(-48)
    1124:	cmpl %d0,%d3
    1126:	bles 113c <_writestring+0x46>
    1128:	clrl %d0
    112a:	bras 113e <_writestring+0x48>
    112c:	moveal %a4@(0),%a6
			112e: BASE16	_DOSBase
    1130:	movel %d4,%d1
    1132:	moveq #19,%d2
    1134:	addl %sp,%d2
    1136:	moveq #1,%d3
    1138:	jsr %a6@(-48)
    113c:	moveq #1,%d0
    113e:	moveml %sp@+,%d2-%d4/%a6
    1142:	addqw #8,%sp
    1144:	rts
    1146:	addqw #8,%a2@(00007400)@(0000456e)
    114e:	blss 11c2 <_writestring+0xcc>
    1150:	074560
    1152:	moveq #0,%d2
    1154:	negw %d5
    1156:	046105
    1158:	addqw #2,%d5
    115a:	oriw #25705,%d5
    115e:	moveq #0,%d2
    1160:	040562
    1162:	blss 1184 <_writestring+0x8e>
    1164:	042570
    1166:	moveq #0,%d2
    1168:	addqw #8,%a4@(24953)
    116c:	oriw #25455,%a1
    1170:	bgts 1192 <_writestring+0x9c>
    1172:	044556
    1174:	bnes 11e5 <_writestring+0xef>
    1176:	oriw #25972,%d7
    117a:	subqw #1,%a1@(31333)
    117e:	071400
    1180:	addqw #1,%sp@(28532)
    1184:	oriw #26735,%a3@
    1188:	073400
    118a:	addqw #8,%a2@(65637400)@(00000000)
    1192:	041550
    1194:	bcss 11f9 <_writestring+0x103>
    1196:	bmis 11b8 <_writestring+0xc2>
    1198:	notw %a1@(29696)
    119c:	addqw #1,%fp@-
    119e:	bgts 1201 <_writestring+0x10b>
    11a0:	blts 1207 <_writestring+0x111>
    11a2:	oriw #24946,%a0@
    11a6:	bcss 1216 <_writestring+0x120>
    11a8:	moveq #0,%d2
    11aa:	pea %fp@-
    11ac:	moveq #32,%d4
    11ae:	addqw #1,%fp@-
    11b0:	bsrs 1216 <_writestring+0x120>
    11b2:	oriw #24948,%d4
    11b6:	bcss 122b <_writestring+0x135>
    11b8:	moveq #97,%d2
    11ba:	blts 122c <_writestring+0x136>
    11bc:	orib #101,%d0
    11c0:	bsrs 1234 <_writestring+0x13e>
    11c2:	blss 122c <_writestring+0x136>
    11c4:	oriw #29555,%d1
    11c8:	bvss 1231 <_writestring+0x13b>
    11ca:	bgtw 5f3b <_req_rets.49+0x3169>
    11ce:	moveq #101,%d3
    11d0:	oriw #28526,%a6
    11d4:	bcsw 643b <_req_rets.49+0x3669>
    11d8:	bsrs 123e <_writestring+0x148>
    11da:	oriw #28525,%d3
    11de:	blts 1245 <_writestring+0x14f>
    11e0:	bgts 1256 <_writestring+0x160>
    11e2:	oriw #30062,%a2@
    11e6:	oriw #30062,%a0
    11ea:	moveq #0,%d2
    11ec:	046541
    11ee:	bmis 1255 <_writestring+0x15f>
    11f0:	bccs 125b <_writestring+0x165>
    11f2:	moveq #0,%d1
    11f4:	041557
    11f6:	moveq #121,%d0
    11f8:	oriw #27756,%d1
    11fc:	oriw #25975,%a6
    1200:	moveal %d6,%a0
    1202:	bvss 1270 <_writestring+0x17a>
    1204:	bcsw 5e75 <_req_rets.49+0x30a3>
    1208:	bles 127a <_writestring+0x184>
    120a:	moveal %a0@,%a0
    120c:	bges 126f <_writestring+0x179>
    120e:	074400
    1210:	040544
    1212:	bccs 1234 <_writestring+0x13e>
    1214:	044543
    1216:	bles 1286 <_writestring+0x190>
    1218:	oriw #27749,%d3
    121c:	bsrs 1290 <_writestring+0x19a>
    121e:	subqw #1,%a1@(31333)
    1222:	071400
    1224:	041554
    1226:	bles 1296 <_writestring+0x1a0>
    1228:	bcsw 5f99 <_req_rets.49+0x31c7>
    122c:	moveq #101,%d3
    122e:	moveal %d1,%a0
    1230:	071400
    1232:	040516
    1234:	subqw #1,%a1
    1236:	moveal %a2@,%a0
    1238:	bcss 129b <_writestring+0x1a5>
    123a:	bccw 55ab <_req_rets.49+0x27d9>
    123e:	moveq #121,%d0
    1240:	moveal %d1,%a0
    1242:	071400
    1244:	addqw #2,%sp@(26471)
    1248:	bges 12af <_writestring+0x1b9>
    124a:	orib #114,%a2@(26990)
    1250:	moveq #0,%d2
    1252:	moveal %d5,%fp
    1254:	bgts 12b9 <_writestring+0x1c3>
    1256:	moveq #121,%d1
    1258:	moveq #116,%d0
    125a:	orib #69,%a2@(19525)
    1260:	addqw #2,%d5
    1262:	oriw #25632,%d5
    1266:	075546
    1268:	076400
    126a:	moveal %fp@,%fp
    126c:	071545
    126e:	moveq #49,%d1
    1270:	orib #108,%a2@(24953)
    1276:	orib #99,%a2@(28526)
    127c:	044556
    127e:	bnes 12ef <_writestring+0x1f9>
    1280:	orib #101,%a2@(29779)
    1286:	bvss 1302 <_writestring+0x20c>
    1288:	bcss 12fd <_writestring+0x207>
    128a:	orib #111,%a2@(28532)
    1290:	orib #104,%a2@(28535)
    1296:	orib #114,%a2@(28532)
    129c:	bcss 1301 <_writestring+0x20b>
    129e:	moveq #0,%d2
    12a0:	moveal %d3,%fp
    12a2:	bvcs 1309 <_writestring+0x213>
    12a4:	blss 1311 <_writestring+0x21b>
    12a6:	notw %a1@(29696)
    12aa:	moveal %a2@,%fp
    12ac:	bcss 131c <_writestring+0x226>
    12ae:	bsrs 131d <_writestring+0x227>
    12b0:	bcsw 3d02 <_req_rets.49+0xf30>
    12b4:	bsrs 1328 <_writestring+0x232>
    12b6:	bcss 1326 <_writestring+0x230>
    12b8:	moveq #0,%d2
    12ba:	moveal %a0,%fp
    12bc:	bcss 1336 <_writestring+0x240>
    12be:	addqw #1,%fp@-
    12c0:	bsrs 1326 <_writestring+0x230>
    12c2:	orib #97,%a2@(29797)
    12c8:	071564
    12ca:	bsrs 1339 <_writestring+0x243>
    12cc:	moveq #0,%d0
    12ce:	moveal %a3@,%fp
    12d0:	bcss 1333 <_writestring+0x23d>
    12d2:	moveq #99,%d1
    12d4:	bvcw 3d17 <_req_rets.49+0xf45>
    12d8:	071563
    12da:	bvss 1343 <_writestring+0x24d>
    12dc:	bgtw 3d2b <_req_rets.49+0xf59>
    12e0:	bles 1358 <_writestring+0x262>
    12e2:	bcsw 3d32 <_req_rets.49+0xf60>
    12e6:	bles 1356 <_writestring+0x260>
    12e8:	bcsw 3d3c <_req_rets.49+0xf6a>
    12ec:	bcss 134f <_writestring+0x259>
    12ee:	bccw 3d33 <_req_rets.49+0xf61>
    12f2:	bles 1361 <_writestring+0x26b>
    12f4:	blts 135b <_writestring+0x265>
    12f6:	bgts 136c <_writestring+0x276>
    12f8:	orib #117,%a2@(28160)
    12fe:	moveal %a0,%fp
    1300:	072556
    1302:	moveq #0,%d2
    1304:	moveal %fp,%fp
    1306:	bsrs 1373 <_writestring+0x27d>
    1308:	bcss 136e <_writestring+0x278>
    130a:	bvss 137e <_writestring+0x288>
    130c:	orib #111,%a2@(28793)
    1312:	orib #108,%a2@(27648)
    1318:	042544
    131a:	moveal %pc@(138f <_writestring+0x299>,%d5:w:2),%a0
    131e:	042556
    1320:	moveq #101,%d2
    1322:	moveq #32,%d1
    1324:	bnes 138f <_writestring+0x299>
    1326:	bges 138d <_writestring+0x297>
    1328:	bgts 138b <_writestring+0x295>
    132a:	blts 1391 <_writestring+0x29b>
    132c:	moveal %a4@(00006372,%d6:l:8),%a0
    1332:	bcss 1395 <_writestring+0x29f>
    1334:	moveq #101,%d2
    1336:	moveal %a6@(25975),%a0
    133a:	moveal %a6@-,%a0
    133c:	bvss 13aa <_writestring+0x2b4>
    133e:	bcss 137a <_writestring+0x284>
    1340:	subqw #2,%a6@(29801)
    1344:	moveq #108,%d2
    1346:	bcss 13ac <_writestring+0x2b6>
    1348:	076400
    134a:	moveal %a4,%fp
    134c:	bles 13bd <_writestring+0x2c7>
    134e:	moveq #80,%d0
    1350:	bges 13b3 <_writestring+0x2bd>
    1352:	074400
    1354:	moveal %d1,%fp
    1356:	bccs 13bc <_writestring+0x2c6>
    1358:	044543
    135a:	bles 13ca <_writestring+0x2d4>
    135c:	orib #108,%a2@(25953)
    1362:	moveq #83,%d1
    1364:	bvss 13e0 <_writestring+0x2ea>
    1366:	bcss 13db <_writestring+0x2e5>
    1368:	orib #108,%a2@(28526)
    136e:	bcsw 3dbd <_req_rets.49+0xfeb>
    1372:	bles 13ea <_writestring+0x2f4>
    1374:	bcss 13b7 <_writestring+0x2c1>
    1376:	071400
    1378:	moveal %d1,%fp
    137a:	linkw %a3,#18770
    137e:	bcss 13e1 <_writestring+0x2eb>
    1380:	bccw 3dc5 <_req_rets.49+0xff3>
    1384:	bles 13f6 <_writestring+0x300>
    1386:	074501
    1388:	071400
    138a:	moveal %a4@,%fp
    138c:	bles 13f5 <_writestring+0x2ff>
    138e:	beqs 13fc <_writestring+0x306>
    1390:	bcsw 6507 <_req_rets.49+0x3735>
    1394:	bvss 140a <_writestring+0x314>
    1396:	oriw #30068,%d2
    139a:	moveq #111,%d2
    139c:	bgts 13be <_writestring+0x2c8>
    139e:	044543
    13a0:	bles 1410 <_writestring+0x31a>
    13a2:	bvss 140a <_writestring+0x314>
    13a4:	074400
    13a6:	044543
    13a8:	bles 1418 <_writestring+0x322>
    13aa:	bvss 1412 <_writestring+0x31c>
    13ac:	074400
    13ae:	addqw #3,%fp@-
    13b0:	moveq #115,%d1
    13b2:	bvss 1423 <_writestring+0x32d>
    13b4:	bgts 1434 <_writestring+0x33e>
    13b6:	oriw #25199,%d1
    13ba:	072564
    13bc:	oriw #28526,%d3
    13c0:	bnes 142b <_writestring+0x335>
    13c2:	beqs 1439 <_writestring+0x343>
    13c4:	moveq #101,%d1
    13c6:	moveq #0,%d7
    13c8:	042562
    13ca:	moveq #111,%d1
    13cc:	moveq #32,%d1
    13ce:	bvcs 1435 <_writestring+0x33f>
    13d0:	bges 1442 <_writestring+0x34c>
    13d2:	moveq #0,%d7
    13d4:	pea %fp@-
    13d6:	bges 1448 <_writestring+0x352>
    13d8:	movel %d0,%a0@-
    13da:	041565
    13dc:	moveq #114,%d1
    13de:	bcss 144e <_writestring+0x358>
    13e0:	moveq #32,%d2
    13e2:	bccs 144d <_writestring+0x357>
    13e4:	moveq #126,%d1
    13e6:	orib #117,%a2@(26996)
    13ec:	orib #117,%a2@(29812)
    13f2:	bles 1462 <_writestring+0x36c>
    13f4:	044543
    13f6:	bles 1466 <_writestring+0x370>
    13f8:	bvss 1460 <_writestring+0x36a>
    13fa:	074400
    13fc:	moveal %a1,%fp
    13fe:	blss 146f <_writestring+0x379>
    1400:	bgts 146b <_writestring+0x375>
    1402:	bnes 147d <_writestring+0x387>
    1404:	orib #101,%a2@(29299)
    140a:	bvss 147b <_writestring+0x385>
    140c:	bgtw 3e4f <_req_rets.49+0x107d>
    1410:	bhis 1481 <_writestring+0x38b>
    1412:	072564
    1414:	orib #111,%a2@(28262)
    141a:	bvss 1483 <_writestring+0x38d>
    141c:	072562
    141e:	bcsw 3e65 <_req_rets.49+0x1093>
    1422:	moveq #114,%d1
    1424:	bles 1498 <_writestring+0x3a2>
    1426:	pea %fp@-
    1428:	bges 149a <_writestring+0x3a4>
    142a:	orib #101,%a2@(27760)
    1430:	orib #68,%a2@(90)
    1436:	bles 14a7 <_writestring+0x3b1>
    1438:	moveal %a1@-,%a0
    143a:	bccs 14a0 <_writestring+0x3aa>
    143c:	oriw #29283,%d1
    1440:	moveal %a1@-,%a0
    1442:	bccs 14a8 <_writestring+0x3b2>
    1444:	oriw #18497,%a4
    1448:	moveal %a1@-,%a0
    144a:	bccs 14b0 <_writestring+0x3ba>
    144c:	oriw #26995,%d4
    1450:	bmis 1472 <_writestring+0x37c>
    1452:	bvss 14c2 <_writestring+0x3cc>
    1454:	bnes 14c5 <_writestring+0x3cf>
    1456:	moveq #0,%d7
    1458:	addqw #8,%a2@(00007420)@(00006469)
    1460:	moveq #0,%d1
    1462:	addqw #1,%fp@-
    1464:	bges 14c7 <_writestring+0x3d1>
    1466:	bhis 14cd <_writestring+0x3d7>
    1468:	bgew 5dd8 <_req_rets.49+0x3006>
    146c:	071564
    146e:	bsrs 14dc <_writestring+0x3e6>
    1470:	bges 14f0 <_writestring+0x3fa>
    1472:	oriw #28530,%d6
    1476:	blts 14d9 <_writestring+0x3e3>
    1478:	moveq #0,%d2
    147a:	negw %a1@(29547)
    147e:	moveal %a3@-,%a0
    1480:	bles 14f2 <_writestring+0x3fc>
    1482:	074400
    1484:	addqw #5,%sp@(28448)
    1488:	bsrs 14aa <_writestring+0x3b4>
    148a:	moveal %pc@(1509 <_writestring+0x413>,%d6:w:4),%a1
    148e:	075522
    1490:	071505
    1492:	bgts 1508 <_writestring+0x412>
    1494:	bcss 1508 <_writestring+0x412>
    1496:	moveal %a2@+,%a0
    1498:	bles 1509 <_writestring+0x413>
    149a:	moveal %a1@-,%a0
    149c:	moveq #99,%d1
    149e:	bvcs 1509 <_writestring+0x413>
    14a0:	moveq #101,%d3
    14a2:	moveal %a6@(24941),%a0
    14a6:	bcss 1525 <_writestring+0x42f>
    14a8:	movel %a0@-,%d1
    14aa:	075517
    14ac:	076400
    14ae:	040562
    14b0:	blss 14d2 <_writestring+0x3dc>
    14b2:	bsrs 14d4 <_writestring+0x3de>
    14b4:	moveal %pc@(1533 <_writestring+0x43d>,%d6:w:4),%a1
    14b8:	075522
    14ba:	071505
    14bc:	bgts 1532 <_writestring+0x43c>
    14be:	bcss 1532 <_writestring+0x43c>
    14c0:	moveal %d1,%a0
    14c2:	moveq #99,%d1
    14c4:	moveal %a1@-,%a0
    14c6:	moveq #99,%d1
    14c8:	bvcs 1533 <_writestring+0x43d>
    14ca:	moveq #101,%d3
    14cc:	moveal %a6@(24941),%a0
    14d0:	bcss 154f <_writestring+0x459>
    14d2:	movel %a0@-,%d1
    14d4:	075517
    14d6:	076400
    14d8:	046110
    14da:	chkl %a0@-,%d0
    14dc:	movel 2061 <_DoGetDevices+0x17f>,%a6@(8226)
    14e2:	075544
    14e4:	076573
    14e6:	addqw #1,%a3@(00007465)@(00007220)
    14ee:	046110
    14f0:	chkl %a0@-,%d0
    14f2:	bsrs 1566 <_writestring+0x470>
    14f4:	blss 155e <_writestring+0x468>
    14f6:	bvss 156e <_writestring+0x478>
    14f8:	bcss 151a <_writestring+0x424>
    14fa:	bgts 155d <_writestring+0x467>
    14fc:	blts 1563 <_writestring+0x46d>
    14fe:	076442
    1500:	moveal %pc@(2a596b <_req_rets.49+0x2a2b99>)@(00000000),%a0
    1508:	071553
    150a:	044556
    150c:	bnes 157d <_writestring+0x487>
    150e:	orib #114,%a2@(26990)
    1514:	moveq #68,%d2
    1516:	bvss 158a <_writestring+0x494>
    1518:	orib #101,%a2@(27745)
    151e:	bhis 1585 <_writestring+0x48f>
    1520:	bgew 3f6b <_req_rets.49+0x1199>
    1524:	bgts 1599 <_writestring+0x4a3>
    1526:	moveq #97,%d2
    1528:	bges 1596 <_writestring+0x4a0>
    152a:	orib #111,%a2@(29293)
    1530:	bsrs 15a6 <_writestring+0x4b0>
    1532:	orib #105,%a2@(29547)
    1538:	blss 15a9 <_writestring+0x4b3>
    153a:	moveq #121,%d0
    153c:	oriw #25958,%d4
    1540:	bsrs 15b7 <_writestring+0x4c1>
    1542:	bges 15b8 <_writestring+0x4c2>
    1544:	oriw #25455,%a1
    1548:	bgtw 6f99 <_req_rets.49+0x41c7>
    154c:	chkl %a0@-,%d7
    154e:	bsrs 15c2 <_writestring+0x4cc>
    1550:	blss 15ba <_writestring+0x4c4>
    1552:	bvss 15ca <_writestring+0x4d4>
    1554:	bcsw 56a8 <_req_rets.49+0x28d6>
    1558:	chkl %a0@-,%d1
    155a:	bsrs 15ce <_writestring+0x4d8>
    155c:	blss 15c6 <_writestring+0x4d0>
    155e:	bvss 15d6 <_writestring+0x4e0>
    1560:	bcsw 61aa <_req_rets.49+0x33d8>
    1564:	chkl %a0@-,%d0
    1566:	bsrs 15da <_writestring+0x4e4>
    1568:	blss 15d2 <_writestring+0x4dc>
    156a:	bvss 15e2 <_writestring+0x4ec>
    156c:	bcsw 59b3 <_req_rets.49+0x2be1>
    1570:	notw %d1
    1572:	subqw #2,%a4
    1574:	addqb #2,%d0
    1576:	044503
    1578:	047516
    157a:	oriw #20303,%a2@+
    157e:	oriw #21059,%d1
    1582:	oriw #18497,%a4
    1586:	orib #0,%d2
    158a:	btst %d0,%a4@-
    158c:	chkl %a3@(fe022a2e,%d3:w),%d2
    1594:	bvss 1604 <_writestring+0x50e>
    1596:	bnes 1607 <_writestring+0x511>
    1598:	orib #46,%d2
    159c:	moveq #111,%d5
    159e:	blew 17ca <_DoDefaultConfig+0x78>
    15a2:	moveal %a1@-,%sp
    15a4:	moveq #99,%d1
    15a6:	orib #46,%d2
    15aa:	moveal %a4@(31336),%a4
    15ae:	moveq #108,%d6
    15b0:	bvcs 1613 <_writestring+0x51d>
    15b2:	movel %d0,%a4@-
    15b4:	moveal %a3@,%fp
    15b6:	blts 1619 <_writestring+0x523>
    15b8:	moveq #116,%d1
    15ba:	addqw #1,%fp@-
    15bc:	bsrs 1622 <_writestring+0x52c>
    15be:	oriw #28527,%a2@+
    15c2:	moveal 2f2f <_req_rets.49+0x15d>,%a0
    15c6:	moveal %pc@(1645 <_writestring+0x54f>,%d6:w:8),%a0
    15ca:	oriw #28527,%a2@+
    15ce:	moveal %a6@(0000007b,%d2:w),%a0
    15d2:	bnes 1651 <_writestring+0x55b>
    15d4:	oriw #29283,%d1
    15d8:	moveal 207b <_DoGetDevices+0x199>,%a0
    15dc:	bnes 165b <_writestring+0x565>
    15de:	oriw #29283,%d1
    15e2:	moveal %a6@(0000007b,%d2:w),%a0
    15e6:	bnes 1665 <_writestring+0x56f>
    15e8:	oriw #18497,%a4
    15ec:	movel %fp@(30752),%d0
    15f0:	movel %fp,%a6@(8312)
    15f4:	moveal %pc@(1673 <_writestring+0x57d>,%d6:w:8),%a0
    15f8:	oriw #18497,%a4
    15fc:	moveal %a6@(0000007b,%d2:w),%a0
    1600:	bnes 167f <_writestring+0x589>
    1602:	oriw #28528,%d3
    1606:	074551
    1608:	bgts 1671 <_writestring+0x57b>
    160a:	moveal %a6@-,%a0
    160c:	bvss 167a <_writestring+0x584>
    160e:	bcss 163e <_writestring+0x548>
    1610:	movel %a6@(82),%d7
    1614:	bcss 1677 <_writestring+0x581>
    1616:	bccs 1681 <_writestring+0x58b>
    1618:	bgts 1681 <_writestring+0x58b>
    161a:	moveal %a6@-,%a0
    161c:	bvss 168a <_writestring+0x594>
    161e:	bcss 164e <_writestring+0x558>
    1620:	movel %a6@(69),%d7
    1624:	moveq #97,%d4
    1626:	blts 1691 <_writestring+0x59b>
    1628:	bgts 1693 <_writestring+0x59d>
    162a:	bgts 1693 <_writestring+0x59d>
    162c:	moveal %a1@(25455),%a0
    1630:	bgts 1660 <_writestring+0x56a>
    1632:	movel %a6@(69),%d7
    1636:	moveq #116,%d4
    1638:	moveq #97,%d1
    163a:	blss 16b0 <_writestring+0x5ba>
    163c:	bvss 16ac <_writestring+0x5b6>
    163e:	beqs 1660 <_writestring+0x56a>
    1640:	bnes 16ab <_writestring+0x5b5>
    1642:	bges 16a9 <_writestring+0x5b3>
    1644:	071440
    1646:	bnes 16ba <_writestring+0x5c4>
    1648:	bles 16b7 <_writestring+0x5c1>
    164a:	moveal %a2@+,%a0
    164c:	bles 16bd <_writestring+0x5c7>
    164e:	moveal %a1@-,%a0
    1650:	moveq #99,%d1
    1652:	bvcs 16bd <_writestring+0x5c7>
    1654:	moveq #101,%d3
    1656:	movel %a6@(11776),%d7
    165a:	046151
    165c:	071564
    165e:	bvss 16ce <_writestring+0x5d8>
    1660:	beqs 1682 <_writestring+0x58c>
    1662:	addqw #5,%sp@(28448)
    1666:	bsrs 16da <_writestring+0x5e4>
    1668:	blss 16d2 <_writestring+0x5dc>
    166a:	bvss 16e2 <_writestring+0x5ec>
    166c:	bcss 169c <_writestring+0x5a6>
    166e:	movel %a6@(69),%d7
    1672:	moveq #116,%d4
    1674:	moveq #97,%d1
    1676:	blss 16ec <_writestring+0x5f6>
    1678:	bvss 16e8 <_writestring+0x5f2>
    167a:	beqs 169c <_writestring+0x5a6>
    167c:	bnes 16e7 <_writestring+0x5f1>
    167e:	bges 16e5 <_writestring+0x5ef>
    1680:	071440
    1682:	bnes 16f6 <_writestring+0x600>
    1684:	bles 16f3 <_writestring+0x5fd>
    1686:	moveal %d1,%a0
    1688:	moveq #99,%d1
    168a:	moveal %a1@-,%a0
    168c:	moveq #99,%d1
    168e:	bvcs 16f9 <_writestring+0x603>
    1690:	moveq #101,%d3
    1692:	movel %a6@(11776),%d7
    1696:	046151
    1698:	071564
    169a:	bvss 170a <_writestring+0x614>
    169c:	beqs 16be <_writestring+0x5c8>
    169e:	040562
    16a0:	blss 16c2 <_writestring+0x5cc>
    16a2:	bsrs 1716 <_writestring+0x620>
    16a4:	blss 170e <_writestring+0x618>
    16a6:	bvss 171e <_writestring+0x628>
    16a8:	bcss 16d8 <_writestring+0x5e2>
    16aa:	movel %a6@(69),%d7
    16ae:	moveq #116,%d4
    16b0:	moveq #97,%d1
    16b2:	blss 1728 <_writestring+0x632>
    16b4:	bvss 1724 <_writestring+0x62e>
    16b6:	beqs 16d8 <_writestring+0x5e2>
    16b8:	bnes 1723 <_writestring+0x62d>
    16ba:	bges 1721 <_writestring+0x62b>
    16bc:	071440
    16be:	bnes 1732 <_writestring+0x63c>
    16c0:	bles 172f <_writestring+0x639>
    16c2:	moveal %a4,%a0
    16c4:	swap %d1
    16c6:	moveal %a1@-,%a0
    16c8:	moveq #99,%d1
    16ca:	bvcs 1735 <_writestring+0x63f>
    16cc:	moveq #101,%d3
    16ce:	movel %a6@(11776),%d7
    16d2:	046151
    16d4:	071564
    16d6:	bvss 1746 <_writestring+0x650>
    16d8:	beqs 16fa <_writestring+0x604>
    16da:	046110
    16dc:	chkl %a0@-,%d0
    16de:	bsrs 1752 <_DoDefaultConfig>
    16e0:	blss 174a <_writestring+0x654>
    16e2:	bvss 175a <_DoDefaultConfig+0x8>
    16e4:	bcss 1714 <_writestring+0x61e>
    16e6:	movel %a6@(68),%d7
    16ea:	bvss 175e <_DoDefaultConfig+0xc>
    16ec:	bcss 1751 <_writestring+0x65b>
    16ee:	moveq #111,%d2
    16f0:	moveq #121,%d1
    16f2:	047560
    16f4:	072563
    16f6:	moveal %d4,%sp
    16f8:	bcss 1760 <_DoDefaultConfig+0xe>
    16fa:	041506
    16fc:	chkl %d0,%d3
    16fe:	movel %fp,%usp
    1700:	073503
    1702:	046111
    1704:	oriw #20302,%d3
    1708:	movew %a2@(0000002f,%d3:w),%d5
    170c:	movew %a0@(30302f31)@(00003830,%d2:l:8),%a0@-
    1716:	movel %d4,%sp@(26994)
    171a:	bcss 177f <_DoDefaultConfig+0x2d>
    171c:	moveq #111,%d2
    171e:	moveq #121,%d1
    1720:	moveal %sp,%a0
    1722:	moveq #117,%d0
    1724:	071440
    1726:	047565
    1728:	moveq #112,%d2
    172a:	072564
    172c:	oriw #26725,%a3@
    1730:	bges 179e <_DoDefaultConfig+0x4c>
    1732:	movel %a3@,%a6@(29793)
    1736:	moveq #116,%d1
    1738:	072560
    173a:	oriw #28528,%a4@(0050726f)@(00006a65)
    1746:	blss 17bc <_DoDefaultConfig+0x6a>
    1748:	oriw #30062,%d6
    174c:	blss 17c2 <_DoDefaultConfig+0x70>
    174e:	bvss 17bf <_DoDefaultConfig+0x6d>
    1750:	bgtw 6741 <_req_rets.49+0x396f>

00001752 <_DoDefaultConfig>:
    1752:	lea %sp@(-272),%sp
    1756:	moveml %d2-%d7/%a2-%a6,%sp@-
    175a:	lea 0 <__XCEXIT>,%a4
			175c: 32	___a4_init
    1760:	movel %a0,%sp@(52)
    1764:	moveal %a0@,%a3
    1766:	tstl %a3
    1768:	bnes 1770 <_DoDefaultConfig+0x1e>
    176a:	clrl %d0
    176c:	braw 1e78 <_DoDefaultConfig+0x726>
    1770:	moveal %sp@(52),%a0
    1774:	bsrw 23be <_DoFreeConfig>
    1778:	moveq #56,%d2
    177a:	addl %sp,%d2
    177c:	moveq #1,%d1
    177e:	movel #256,%d0
    1784:	moveal %d2,%a1
    1786:	lea %pc@(16e9 <_writestring+0x5f3>),%a0
    178a:	bsrw 2670 <_DoFindSystemFile>
    178e:	tstl %d0
    1790:	beqs 17a4 <_DoDefaultConfig+0x52>
    1792:	moveal %sp@(52),%a1
    1796:	moveal %d2,%a0
    1798:	bsrw 60 <_DoReadConfig>
    179c:	moveq #1,%d1
    179e:	cmpl %d0,%d1
    17a0:	beqw 1e76 <_DoDefaultConfig+0x724>
    17a4:	moveb #7,%a3@(4)
    17aa:	moveb #49,%a3@(7105)
    17b0:	moveb #8,%a3@(9)
    17b6:	moveb #1,%a3@(5)
    17bc:	moveb #3,%a3@(6)
    17c2:	moveb #-56,%a3@(7)
    17c8:	moveb #3,%a3@(8)
    17ce:	clrl %d2
    17d0:	clrl %d1
    17d2:	clrl %d5
    17d4:	movel %d5,%d0
    17d6:	addl %d1,%d0
    17d8:	lea %a3@(5044),%a0
    17dc:	moveb %d5,%a0@(00000000,%d0:l)
    17e0:	addql #1,%d5
    17e2:	moveq #4,%d0
    17e4:	cmpl %d5,%d0
    17e6:	bges 17d4 <_DoDefaultConfig+0x82>
    17e8:	moveq #5,%d5
    17ea:	movel %d5,%d0
    17ec:	addl %d1,%d0
    17ee:	st %a0@(00000000,%d0:l)
    17f2:	addql #1,%d5
    17f4:	moveq #15,%d0
    17f6:	cmpl %d5,%d0
    17f8:	bges 17ea <_DoDefaultConfig+0x98>
    17fa:	moveb #28,%a3@(000013d4,%d1:l)
    1802:	moveb #80,%a3@(000013d5,%d1:l)
    180a:	moveb #40,%a3@(000013d6,%d1:l)
    1812:	moveb #32,%a3@(000013d7,%d1:l)
    181a:	moveb #32,%a3@(000013d8,%d1:l)
    1822:	clrb %a3@(0000000d,%d2:l)
    1826:	moveb #1,%a3@(00001394,%d2:l)
    182e:	moveq #16,%d0
    1830:	addl %d0,%d1
    1832:	addql #1,%d2
    1834:	moveq #1,%d0
    1836:	cmpl %d2,%d0
    1838:	bges 17d2 <_DoDefaultConfig+0x80>
    183a:	clrb %a3@(11)
    183e:	clrb %a3@(7113)
    1842:	moveb #55,%a3@(12)
    1848:	pea 7 <__XCEXIT+0x7>
    184c:	pea %a3@(4848)
    1850:	pea %pc@(16fe <_writestring+0x608>)
    1854:	bsrl 0 <__XCEXIT>
			1856: DISP32	_bcopy
    185a:	addqw #8,%sp
    185c:	movel #40,%sp@
    1862:	pea %a3@(4928)
    1866:	pea %pc@(1705 <_writestring+0x60f>)
    186a:	bsrl 0 <__XCEXIT>
			186c: DISP32	_bcopy
    1870:	addqw #8,%sp
    1872:	movel #14,%sp@
    1878:	pea %a3@(7154)
    187c:	pea %pc@(172d <_writestring+0x637>)
    1880:	bsrl 0 <__XCEXIT>
			1882: DISP32	_bcopy
    1886:	lea %sp@(12),%sp
    188a:	clrb %a3@(5852)
    188e:	moveb #13,%a3@(6020)
    1894:	moveb #13,%a3@(6021)
    189a:	moveb #10,%a3@(5385)
    18a0:	moveb #125,%a3@(5384)
    18a6:	moveb #2,%a3@(6022)
    18ac:	movew #-1,%a3@(5528)
    18b2:	movew #25,%a3@(5530)
    18b8:	clrb %a3@(15)
    18bc:	clrb %a3@(5532)
    18c0:	clrb %a3@(5612)
    18c4:	clrb %a3@(5692)
    18c8:	clrb %a3@(5772)
    18cc:	clrb %a3@(7106)
    18d0:	clrl %a3@(7582)
    18d4:	clrb %a3@(5014)
    18d8:	clrb %a3@(5859)
    18dc:	clrb %a3@(5860)
    18e0:	clrb %a3@(5900)
    18e4:	clrb %a3@(5940)
    18e8:	clrb %a3@(5980)
    18ec:	clrb %a3@(5388)
    18f0:	clrb %a3@(5418)
    18f4:	clrb %a3@(5304)
    18f8:	clrb %a3@(6768)
    18fc:	clrb %a3@(6032)
    1900:	moveb #17,%a3@(5854)
    1906:	clrb %a3@(5853)
    190a:	moveb #2,%a3@(5855)
    1910:	moveb #8,%a3@(5856)
    1916:	subal %a2,%a2
    1918:	moveb #2,%a2@(000014b4,%a3:l)
    1920:	moveb #8,%a2@(00001e62,%a3:l)
    1928:	addql #1,%a2
    192a:	moveq #2,%d1
    192c:	cmpl %a2,%d1
    192e:	bges 1918 <_DoDefaultConfig+0x1c6>
    1930:	moveb #10,%a3@(7111)
    1936:	moveb #7,%a3@(7112)
    193c:	moveb #8,%a3@(7118)
    1942:	moveb #1,%a3@(5222)
    1948:	clrb %a3@(5223)
    194c:	moveb #2,%a3@(5238)
    1952:	moveb #7,%a3@(5239)
    1958:	moveb #1,%a3@(5236)
    195e:	clrb %a3@(5237)
    1962:	moveb #2,%a3@(5230)
    1968:	moveb #3,%a3@(5231)
    196e:	moveb #3,%a3@(5228)
    1974:	clrb %a3@(5229)
    1978:	moveb #2,%a3@(5226)
    197e:	moveb #1,%a3@(5227)
    1984:	moveb #1,%a3@(5224)
    198a:	clrb %a3@(5225)
    198e:	moveb #1,%a3@(5240)
    1994:	clrb %a3@(6848)
    1998:	moveb #1,%a3@(5241)
    199e:	clrb %a3@(5242)
    19a2:	moveb #1,%a3@(5243)
    19a8:	clrb %a3@(5244)
    19ac:	moveb #1,%a3@(5232)
    19b2:	clrb %a3@(5233)
    19b6:	moveb #1,%a3@(5234)
    19bc:	clrb %a3@(5235)
    19c0:	moveb #2,%a3@(5220)
    19c6:	moveb #1,%a3@(5221)
    19cc:	moveb #1,%a3@(7107)
    19d2:	clrb %a3@(7108)
    19d6:	moveb #1,%a3@(7119)
    19dc:	moveb #4,%a3@(7120)
    19e2:	clrl %d5
    19e4:	movel %a3,%d2
    19e6:	addil #6128,%d2
    19ec:	moveb #8,%a3@(000017e0,%d5:l)
    19f4:	pea 6 <__XCEXIT+0x6>
    19f8:	movel %d2,%sp@-
    19fa:	pea %pc@(173b <_writestring+0x645>)
    19fe:	bsrl 0 <__XCEXIT>
			1a00: DISP32	_bcopy
    1a04:	lea %sp@(12),%sp
    1a08:	moveq #40,%d0
    1a0a:	addl %d0,%d2
    1a0c:	addql #1,%d5
    1a0e:	moveq #15,%d1
    1a10:	cmpl %d5,%d1
    1a12:	bges 19ec <_DoDefaultConfig+0x29a>
    1a14:	moveb #107,%a3@(7121)
    1a1a:	moveal %a4@(0),%a6
			1a1c: BASE16	_SysBase
    1a1e:	lea %a4@(0),%a0
			1a20: BASE16	.data+0xffffd820
    1a22:	lea %a3@(7586),%a1
    1a26:	moveq #63,%d0
    1a28:	notb %d0
    1a2a:	jsr %a6@(-624)
    1a2e:	moveq #2,%d0
    1a30:	movel %d0,%a3@(5248)
    1a34:	moveb #3,%a3@(5246)
    1a3a:	moveq #-1,%d1
    1a3c:	movel %d1,%a3@(5252)
    1a40:	movel %d1,%a3@(5256)
    1a44:	clrb %a3@(5247)
    1a48:	clrw %a3@(6850)
    1a4c:	movew #-1,%a3@(6854)
    1a52:	movew #-1,%a3@(6856)
    1a58:	moveq #6,%d0
    1a5a:	movel %d0,%a3@(5008)
    1a5e:	movew #252,%a3@(6024)
    1a64:	clrw %a3@(6026)
    1a68:	clrw %a3@(6028)
    1a6c:	clrw %a3@(6030)
    1a70:	movew #100,%a3@(7114)
    1a76:	movew #40,%a3@(7116)
    1a7c:	movew #-1,%a3@(7782)
    1a82:	movew #-1,%a3@(7784)
    1a88:	subal %a2,%a2
    1a8a:	movel %a2,%d0
    1a8c:	lsll #3,%d0
    1a8e:	movew #-1,%a3@(00001bd2,%d0:l)
    1a96:	movew #-1,%a3@(00001bd6,%d0:l)
    1a9e:	movew #-1,%a3@(00001bd4,%d0:l)
    1aa6:	movew #-1,%a3@(00001bd8,%d0:l)
    1aae:	addql #1,%a2
    1ab0:	moveq #1,%d1
    1ab2:	cmpl %a2,%d1
    1ab4:	bges 1a8a <_DoDefaultConfig+0x338>
    1ab6:	clrb %a3@(7184)
    1aba:	moveb #1,%a3@(7781)
    1ac0:	clrl %d5
    1ac2:	lea %a4@(500),%a0
			1ac4: BASE16	.data+0xffffd820
    1ac6:	movel %d5,%d0
    1ac8:	lsll #2,%d0
    1aca:	lea %a4@(192),%a1
			1acc: BASE16	.data+0xffffd820
    1ace:	moveal %a0@(00000000,%d0:l),%a2
    1ad2:	moveal %a1@(00000000,%d0:l),%a1
    1ad6:	movel %d5,%d1
    1ad8:	clrl %d0
    1ada:	moveal %sp@(52),%a0
    1ade:	bsrw 21ae <_DoAssignGadget>
    1ae2:	addql #1,%d5
    1ae4:	moveq #41,%d0
    1ae6:	cmpl %d5,%d0
    1ae8:	bges 1ac2 <_DoDefaultConfig+0x370>
    1aea:	clrl %d5
    1aec:	lea %a4@(668),%a0
			1aee: BASE16	.data+0xffffd820
    1af0:	movel %d5,%d0
    1af2:	lsll #2,%d0
    1af4:	lea %a4@(360),%a1
			1af6: BASE16	.data+0xffffd820
    1af8:	moveal %a0@(00000000,%d0:l),%a2
    1afc:	moveal %a1@(00000000,%d0:l),%a1
    1b00:	moveq #42,%d1
    1b02:	addl %d5,%d1
    1b04:	clrl %d0
    1b06:	moveal %sp@(52),%a0
    1b0a:	bsrw 21ae <_DoAssignGadget>
    1b0e:	addql #1,%d5
    1b10:	moveq #34,%d1
    1b12:	cmpl %d5,%d1
    1b14:	bges 1aec <_DoDefaultConfig+0x39a>
    1b16:	moveq #78,%d5
    1b18:	subal %a2,%a2
    1b1a:	subal %a1,%a1
    1b1c:	movel %d5,%d1
    1b1e:	clrl %d0
    1b20:	moveal %sp@(52),%a0
    1b24:	bsrw 21ae <_DoAssignGadget>
    1b28:	addql #1,%d5
    1b2a:	moveq #83,%d0
    1b2c:	cmpl %d5,%d0
    1b2e:	bges 1b18 <_DoDefaultConfig+0x3c6>
    1b30:	moveal %sp@(52),%a0
    1b34:	moveal %a0@(12),%a2
    1b38:	tstl %a2
    1b3a:	beqw 1be6 <_DoDefaultConfig+0x494>
    1b3e:	clrl %d5
    1b40:	clrl %d1
    1b42:	lea %a2@(25),%a1
    1b46:	clrl %a2@(00000010,%d1:l)
    1b4a:	clrb %a1@(1)
    1b4e:	movel #4000,%a2@(00000014,%d1:l)
    1b56:	clrb %a1@(2)
    1b5a:	moveb #2,%a1@(3)
    1b60:	moveq #41,%d0
    1b62:	cmpl %d5,%d0
    1b64:	blts 1b86 <_DoDefaultConfig+0x434>
    1b66:	lea %a4@(1254),%a0
			1b68: BASE16	.data+0xffffd820
    1b6a:	movel %d5,%d0
    1b6c:	lsll #2,%d0
    1b6e:	moveb %a0@(00000000,%d0:l),%a1@(-1)
    1b74:	moveb %a0@(00000001,%d0:l),%a1@
    1b78:	moveb %a0@(00000002,%d0:l),%a1@(4)
    1b7e:	moveb %a0@(00000003,%d0:l),%a1@(5)
    1b84:	bras 1bca <_DoDefaultConfig+0x478>
    1b86:	moveb #1,%a1@(4)
    1b8c:	clrb %a1@(5)
    1b90:	moveq #57,%d0
    1b92:	cmpl %d5,%d0
    1b94:	bnes 1baa <_DoDefaultConfig+0x458>
    1b96:	movel #2052,%d0
    1b9c:	moveb #40,%a2@(00000018,%d0:l)
    1ba2:	moveb #8,%a2@(00000019,%d0:l)
    1ba8:	bras 1bca <_DoDefaultConfig+0x478>
    1baa:	moveq #68,%d0
    1bac:	cmpl %d5,%d0
    1bae:	bnes 1bc4 <_DoDefaultConfig+0x472>
    1bb0:	movel #2448,%d0
    1bb6:	moveb #23,%a2@(00000018,%d0:l)
    1bbc:	moveb #9,%a2@(00000019,%d0:l)
    1bc2:	bras 1bca <_DoDefaultConfig+0x478>
    1bc4:	clrb %a1@(-1)
    1bc8:	clrb %a1@
    1bca:	lea %a1@(36),%a1
    1bce:	moveq #36,%d0
    1bd0:	addl %d0,%d1
    1bd2:	addql #1,%d5
    1bd4:	moveq #83,%d0
    1bd6:	cmpl %d5,%d0
    1bd8:	bgew 1b46 <_DoDefaultConfig+0x3f4>
    1bdc:	moveq #48,%d1
    1bde:	movel %d1,%a2@(1240)
    1be2:	movel %d1,%a2@(2752)
    1be6:	moveal %sp@(52),%a0
    1bea:	movel %a2,%a0@(16)
    1bee:	lea %a3@(16),%a2
    1bf2:	pea 8 <__XCEXIT+0x8>
    1bf6:	movel %a2,%sp@-
    1bf8:	pea %pc@(1741 <_writestring+0x64b>)
    1bfc:	bsrl 0 <__XCEXIT>
			1bfe: DISP32	_bcopy
    1c02:	addqw #8,%sp
    1c04:	movel #9,%sp@
    1c0a:	pea %a3@(32)
    1c0e:	pea %pc@(1749 <_writestring+0x653>)
    1c12:	bsrl 0 <__XCEXIT>
			1c14: DISP32	_bcopy
    1c18:	lea %sp@(12),%sp
    1c1c:	moveq #2,%d5
    1c1e:	movel %d5,%d0
    1c20:	lsll #4,%d0
    1c22:	clrb %a2@(00000000,%d0:l)
    1c26:	addql #1,%d5
    1c28:	moveq #4,%d0
    1c2a:	cmpl %d5,%d0
    1c2c:	bges 1c1e <_DoDefaultConfig+0x4cc>
    1c2e:	clrl %d5
    1c30:	lea %a3@(121),%a6
    1c34:	lea %a4@(844),%a1
			1c36: BASE16	.data+0xffffd820
    1c38:	movel %d5,%d0
    1c3a:	lsll #2,%d0
    1c3c:	lea %a4@(808),%a0
			1c3e: BASE16	.data+0xffffd820
    1c40:	moveal %a1@(00000000,%d0:l),%a2
    1c44:	moveal %a0@(00000000,%d0:l),%a1
    1c48:	movel %d5,%d0
    1c4a:	moveal %sp@(52),%a0
    1c4e:	bsrw 2278 <_DoAssignMenu>
    1c52:	lea %a4@(1216),%a0
			1c54: BASE16	.data+0xffffd820
    1c56:	moveb %a0@(00000000,%d5:l),%a6@(-1)
    1c5c:	lea %a4@(1226),%a0
			1c5e: BASE16	.data+0xffffd820
    1c60:	moveb %a0@(00000000,%d5:l),%a6@
    1c64:	lea %a6@(36),%a6
    1c68:	addql #1,%d5
    1c6a:	moveq #8,%d1
    1c6c:	cmpl %d5,%d1
    1c6e:	bges 1c34 <_DoDefaultConfig+0x4e2>
    1c70:	moveq #20,%d5
    1c72:	clrl %d3
    1c74:	lea %a3@(841),%a6
    1c78:	moveq #-20,%d2
    1c7a:	addl %d5,%d2
    1c7c:	lea %a4@(916),%a0
			1c7e: BASE16	.data+0xffffd820
    1c80:	lea %a4@(880),%a1
			1c82: BASE16	.data+0xffffd820
    1c84:	moveal %a0@(00000000,%d3:l),%a2
    1c88:	moveal %a1@(00000000,%d3:l),%a1
    1c8c:	movel %d5,%d0
    1c8e:	moveal %sp@(52),%a0
    1c92:	bsrw 2278 <_DoAssignMenu>
    1c96:	lea %a4@(1236),%a0
			1c98: BASE16	.data+0xffffd820
    1c9a:	moveb %a0@(00000000,%d2:l),%a6@(-1)
    1ca0:	lea %a4@(1245),%a0
			1ca2: BASE16	.data+0xffffd820
    1ca4:	moveb %a0@(00000000,%d2:l),%a6@
    1ca8:	lea %a6@(36),%a6
    1cac:	addql #4,%d3
    1cae:	addql #1,%d5
    1cb0:	moveq #28,%d0
    1cb2:	cmpl %d5,%d0
    1cb4:	bges 1c78 <_DoDefaultConfig+0x526>
    1cb6:	moveq #26,%d5
    1cb8:	movel #936,%d0
    1cbe:	lea %a3@(1060),%a1
    1cc2:	lea %a3@(112),%a0
    1cc6:	moveq #27,%d1
    1cc8:	cmpl %d5,%d1
    1cca:	beqs 1cd6 <_DoDefaultConfig+0x584>
    1ccc:	movel #8609,%a0@(00000000,%d0:l)
    1cd4:	bras 1cde <_DoDefaultConfig+0x58c>
    1cd6:	movel #8353,%a0@(00000000,%d0:l)
    1cde:	st %a1@
    1ce0:	lea %a1@(36),%a1
    1ce4:	moveq #36,%d1
    1ce6:	addl %d1,%d0
    1ce8:	addql #1,%d5
    1cea:	moveq #28,%d1
    1cec:	cmpl %d5,%d1
    1cee:	bges 1cc2 <_DoDefaultConfig+0x570>
    1cf0:	moveal %sp@(52),%a0
    1cf4:	bsrw 1ee2 <_DoGetDevices>
    1cf8:	moveq #31,%d5
    1cfa:	lea %a3@(3726),%a1
    1cfe:	clrb %a1@(-6)
    1d02:	clrb %a1@(-5)
    1d06:	moveb #1,%a1@(-1)
    1d0c:	clrb %a1@
    1d0e:	lea %a1@(36),%a1
    1d12:	dbf %d5,1cfe <_DoDefaultConfig+0x5ac>
    1d16:	clrw %d5
    1d18:	subql #1,%d5
    1d1a:	bccs 1cfe <_DoDefaultConfig+0x5ac>
    1d1c:	clrl %d5
    1d1e:	moveal %sp@(52),%a0
    1d22:	addql #4,%a0
    1d24:	movel %a0,%sp@(48)
    1d28:	lea %a4@(0),%a6
			1d2a: BASE16	_DOpusBase
    1d2c:	movel %a6,%sp@(44)
    1d30:	moveal %a6@,%a6
    1d32:	movel #916,%d0
    1d38:	moveq #1,%d1
    1d3a:	swap %d1
    1d3c:	jsr %a6@(-288)
    1d40:	moveal %d0,%a3
    1d42:	tstl %a3
    1d44:	beqw 1e6c <_DoDefaultConfig+0x71a>
    1d48:	lea %a4@(952),%a0
			1d4a: BASE16	.data+0xffffd820
    1d4c:	movel %d5,%d6
    1d4e:	lsll #2,%d6
    1d50:	movel %a0@(00000000,%d6:l),%sp@-
    1d54:	pea %a3@(4)
    1d58:	bsrl 0 <__XCEXIT>
			1d5a: DISP32	_strcpy
    1d5e:	lea %a4@(972),%a0
			1d60: BASE16	.data+0xffffd820
    1d62:	movel %a0@(00000000,%d6:l),%sp@-
    1d66:	pea %a3@(36)
    1d6a:	bsrl 0 <__XCEXIT>
			1d6c: DISP32	_strcpy
    1d70:	lea %sp@(16),%sp
    1d74:	lea %a4@(992),%a2
			1d76: BASE16	.data+0xffffd820
    1d78:	movel %a2@(00000000,%d6:l),%sp@-
    1d7c:	bsrl 0 <__XCEXIT>
			1d7e: DISP32	_strlen
    1d82:	addql #4,%sp
    1d84:	moveal %sp@(44),%a0
    1d88:	moveal %a0@,%a6
    1d8a:	moveal %sp@(48),%a0
    1d8e:	addql #1,%d0
    1d90:	clrl %d1
    1d92:	jsr %a6@(-288)
    1d96:	movel %d0,%a3@(844)
    1d9a:	beqs 1daa <_DoDefaultConfig+0x658>
    1d9c:	movel %a2@(00000000,%d6:l),%sp@-
    1da0:	movel %d0,%sp@-
    1da2:	bsrl 0 <__XCEXIT>
			1da4: DISP32	_strcpy
    1da8:	addql #8,%sp
    1daa:	subal %a2,%a2
    1dac:	lea %a4@(1016),%a6
			1dae: BASE16	.data+0xffffd820
    1db0:	movel %a6,%d7
    1db2:	movel %d5,%d0
    1db4:	lsll #4,%d0
    1db6:	moveal %d0,%a0
    1db8:	lea %a0@(00000000,%a2:l:4),%fp
    1dbc:	tstl %fp@(00000000,%d7:l)
    1dc0:	beqw 1e56 <_DoDefaultConfig+0x704>
    1dc4:	lea %a4@(1096),%a0
			1dc6: BASE16	.data+0xffffd820
    1dc8:	movel %a2,%d4
    1dca:	addl %d6,%d4
    1dcc:	moveb %a0@(00000000,%d4:l),%d3
    1dd0:	extbl %d3
    1dd2:	lea %a4@(1116),%a0
			1dd4: BASE16	.data+0xffffd820
    1dd6:	movel %fp@(00000000,%a0:l),%sp@-
    1dda:	movel %d3,%d2
    1ddc:	lsll #2,%d2
    1dde:	movel %d2,%d0
    1de0:	addl %d3,%d0
    1de2:	pea %a3@(0000002c,%d0:l:8)
    1de6:	bsrl 0 <__XCEXIT>
			1de8: DISP32	_strcpy
    1dec:	lea %a4@(1422),%a1
			1dee: BASE16	.data+0xffffd820
    1df0:	movel %d5,%d0
    1df2:	lsll #3,%d0
    1df4:	moveal %d0,%a6
    1df6:	lea %a6@(00000000,%a2:l:2),%a0
    1dfa:	moveaw %a0@(00000000,%a1:l),%a0
    1dfe:	movel %a0,%a3@(000002ac,%d2:l)
    1e04:	lea %a4@(1196),%a0
			1e06: BASE16	.data+0xffffd820
    1e08:	moveb %a0@(00000000,%d4:l),%a3@(0000033c,%d3:l)
    1e10:	movel #4000,%a3@(000002ec,%d2:l)
    1e1a:	addql #8,%sp
    1e1c:	lea %a3@(00000350,%d2:l),%a0
    1e22:	movel %a0,%d2
    1e24:	movel %fp@(00000000,%d7:l),%sp@-
    1e28:	bsrl 0 <__XCEXIT>
			1e2a: DISP32	_strlen
    1e2e:	addql #4,%sp
    1e30:	moveal %sp@(44),%a0
    1e34:	moveal %a0@,%a6
    1e36:	moveal %sp@(48),%a0
    1e3a:	addql #1,%d0
    1e3c:	clrl %d1
    1e3e:	jsr %a6@(-288)
    1e42:	moveal %d2,%a6
    1e44:	movel %d0,%a6@
    1e46:	beqs 1e56 <_DoDefaultConfig+0x704>
    1e48:	movel %fp@(00000000,%d7:l),%sp@-
    1e4c:	movel %a6@,%sp@-
    1e4e:	bsrl 0 <__XCEXIT>
			1e50: DISP32	_strcpy
    1e54:	addql #8,%sp
    1e56:	addql #1,%a2
    1e58:	moveq #3,%d0
    1e5a:	cmpl %a2,%d0
    1e5c:	bgew 1dac <_DoDefaultConfig+0x65a>
    1e60:	movel %a3,%sp@-
    1e62:	movel %sp@(56),%sp@-
    1e66:	bsrw 237c <_linkinnewfiletype>
    1e6a:	addql #8,%sp
    1e6c:	addql #1,%d5
    1e6e:	moveq #4,%d1
    1e70:	cmpl %d5,%d1
    1e72:	bgew 1d1e <_DoDefaultConfig+0x5cc>
    1e76:	moveq #1,%d0
    1e78:	moveml %sp@+,%d2-%d7/%a2-%a6
    1e7c:	lea %sp@(272),%sp
    1e80:	rts

00001e82 <_readline>:
    1e82:	moveml %d2-%d3/%a2,%sp@-
    1e86:	movel %sp@(20),%d0
    1e8a:	moveal %sp@(24),%a2
    1e8e:	movel %sp@(28),%d3
    1e92:	moveal %a2,%a1
    1e94:	movel %a2,%d2
    1e96:	addil #4095,%d2
    1e9c:	moveal %d0,%a0
    1e9e:	addal %sp@(16),%a0
    1ea2:	cmpl %d3,%d0
    1ea4:	beqs 1eaa <_readline+0x28>
    1ea6:	moveb %a0@,%d1
    1ea8:	bnes 1eb8 <_readline+0x36>
    1eaa:	clrb %a1@
    1eac:	cmpl %d3,%d0
    1eae:	bnes 1eb4 <_readline+0x32>
    1eb0:	moveq #-1,%d0
    1eb2:	bras 1ec6 <_readline+0x44>
    1eb4:	addql #1,%d0
    1eb6:	bras 1ec6 <_readline+0x44>
    1eb8:	moveb %d1,%a1@+
    1eba:	addql #1,%a0
    1ebc:	addql #1,%d0
    1ebe:	cmpl %a1,%d2
    1ec0:	bges 1ea2 <_readline+0x20>
    1ec2:	clrb %a2@(00000000,%d0:l)
    1ec6:	moveml %sp@+,%d2-%d3/%a2
    1eca:	rts
    1ecc:	movew %d0,%d5
    1ece:	movel %a4@(25658),%a2@(8229)
    1ed4:	071412
    1ed6:	orib #108,%a3@(25658)
    1edc:	movel %fp@-,%d0
    1ede:	071412
	...

00001ee2 <_DoGetDevices>:
    1ee2:	lea %sp@(-280),%sp
    1ee6:	moveml %d2-%d7/%a2-%a6,%sp@-
    1eea:	lea 0 <__XCEXIT>,%a4
			1eec: 32	___a4_init
    1ef0:	movel %a0,%d6
    1ef2:	movel %a0@,%sp@(44)
    1ef6:	bnes 1efe <_DoGetDevices+0x1c>
    1ef8:	clrl %d0
    1efa:	braw 21a4 <_DoGetDevices+0x2c2>
    1efe:	moveal %a4@(0),%a0
			1f00: BASE16	_DOSBase
    1f02:	moveal %a0@(34),%a0
    1f06:	movel %a0@(24),%d5
    1f0a:	lsll #2,%d5
    1f0c:	moveal %d5,%a0
    1f0e:	moveal %a0@(4),%a3
    1f12:	movel %a3,%d0
    1f14:	lsll #2,%d0
    1f16:	moveal %d0,%a3
    1f18:	clrl %d4
    1f1a:	tstl %a3
    1f1c:	beqw 1fae <_DoGetDevices+0xcc>
    1f20:	moveaw #3696,%fp
    1f24:	tstl %a3@(4)
    1f28:	bnes 1fa0 <_DoGetDevices+0xbe>
    1f2a:	tstl %a3@(8)
    1f2e:	beqs 1fa0 <_DoGetDevices+0xbe>
    1f30:	moveq #48,%d2
    1f32:	addl %sp,%d2
    1f34:	lea %a4@(0),%a2
			1f36: BASE16	_DOpusBase
    1f38:	moveal %a2@,%a6
    1f3a:	moveal %a3@(40),%a0
    1f3e:	moveal %d2,%a1
    1f40:	movel #256,%d0
    1f46:	jsr %a6@(-186)
    1f4a:	moveal %a2@,%a6
    1f4c:	moveal %d2,%a0
    1f4e:	lea %pc@(1ecc <_readline+0x4a>),%a1
    1f52:	jsr %a6@(-102)
    1f56:	pea f <__XCEXIT+0xf>
    1f5a:	movel %d2,%sp@-
    1f5c:	movel %sp,%d3
    1f5e:	addil #312,%d3
    1f64:	movel %d3,%sp@-
    1f66:	bsrl 0 <__XCEXIT>
			1f68: DISP32	_strncpy
    1f6c:	clrb %sp@(331)
    1f70:	movel %d2,%sp@-
    1f72:	movel %d3,%sp@-
    1f74:	movel %d4,%sp@-
    1f76:	movel %d6,%sp@-
    1f78:	bsrw 22fe <_DoAssignDrive>
    1f7c:	moveal %d6,%a0
    1f7e:	moveal %a0@,%a1
    1f80:	addal %fp,%a1
    1f82:	movel %a1,%sp@-
    1f84:	movel %d4,%sp@-
    1f86:	pea %pc@(1ece <_readline+0x4c>)
    1f8a:	bsrl 0 <__XCEXIT>
			1f8c: DISP32	_kprintf
    1f90:	lea %fp@(36),%fp
    1f94:	addql #1,%d4
    1f96:	lea %sp@(40),%sp
    1f9a:	moveq #32,%d0
    1f9c:	cmpl %d4,%d0
    1f9e:	beqs 1fae <_DoGetDevices+0xcc>
    1fa0:	moveal %a3@,%a3
    1fa2:	movel %a3,%d0
    1fa4:	lsll #2,%d0
    1fa6:	moveal %d0,%a3
    1fa8:	tstl %a3
    1faa:	bnew 1f24 <_DoGetDevices+0x42>
    1fae:	movel %d4,%d2
    1fb0:	bpls 1fb4 <_DoGetDevices+0xd2>
    1fb2:	addql #1,%d2
    1fb4:	bras 2010 <_DoGetDevices+0x12e>
    1fb6:	moveal %d2,%a3
    1fb8:	cmpl %a3,%d4
    1fba:	bles 200a <_DoGetDevices+0x128>
    1fbc:	moveal %a3,%a2
    1fbe:	bras 1fcc <_DoGetDevices+0xea>
    1fc0:	moveq #36,%d0
    1fc2:	moveal %fp,%a1
    1fc4:	moveal %d3,%a0
    1fc6:	bsrl 0 <__XCEXIT>
			1fc8: DISP32	_SwapMem
    1fcc:	subal %d2,%a2
    1fce:	tstl %a2
    1fd0:	blts 2004 <_DoGetDevices+0x122>
    1fd2:	lea %a2@(00000000,%d2:l),%a1
    1fd6:	lea %a2@(00000000,%a2:l:8),%a0
    1fda:	moveal %sp@(44),%fp
    1fde:	lea %fp@(00000e70,%a0:l:4),%fp
    1fe4:	movel %fp,%d3
    1fe6:	lea %a1@(00000000,%a1:l:8),%a0
    1fea:	moveal %sp@(44),%a1
    1fee:	lea %a1@(00000e70,%a0:l:4),%fp
    1ff4:	moveal %a4@(0),%a6
			1ff6: BASE16	_DOpusBase
    1ff8:	moveal %d3,%a0
    1ffa:	moveal %fp,%a1
    1ffc:	jsr %a6@(-138)
    2000:	tstl %d0
    2002:	bgts 1fc0 <_DoGetDevices+0xde>
    2004:	addql #1,%a3
    2006:	cmpl %a3,%d4
    2008:	bgts 1fbc <_DoGetDevices+0xda>
    200a:	movel %d2,%d2
    200c:	bpls 2010 <_DoGetDevices+0x12e>
    200e:	addql #1,%d2
    2010:	asrl #1,%d2
    2012:	bgts 1fb6 <_DoGetDevices+0xd4>
    2014:	movel %d4,%d7
    2016:	moveq #31,%d0
    2018:	cmpl %d4,%d0
    201a:	bltw 20c8 <_DoGetDevices+0x1e6>
    201e:	moveal %d5,%a0
    2020:	moveal %a0@(4),%a3
    2024:	movel %a3,%d0
    2026:	lsll #2,%d0
    2028:	moveal %d0,%a3
    202a:	tstl %a3
    202c:	beqw 20c8 <_DoGetDevices+0x1e6>
    2030:	moveal %d4,%a0
    2032:	lea %a0@(00000000,%d4:l:8),%a0
    2036:	movel %a0,%d0
    2038:	lsll #2,%d0
    203a:	movel %d0,%d5
    203c:	addil #3696,%d5
    2042:	moveq #1,%d0
    2044:	cmpl %a3@(4),%d0
    2048:	bnes 20ba <_DoGetDevices+0x1d8>
    204a:	moveq #48,%d2
    204c:	addl %sp,%d2
    204e:	lea %a4@(0),%a2
			2050: BASE16	_DOpusBase
    2052:	moveal %a2@,%a6
    2054:	moveal %a3@(40),%a0
    2058:	moveal %d2,%a1
    205a:	addil #255,%d0
    2060:	jsr %a6@(-186)
    2064:	moveal %a2@,%a6
    2066:	moveal %d2,%a0
    2068:	lea %pc@(1ecc <_readline+0x4a>),%a1
    206c:	jsr %a6@(-102)
    2070:	pea f <__XCEXIT+0xf>
    2074:	movel %d2,%sp@-
    2076:	movel %sp,%d3
    2078:	addil #312,%d3
    207e:	movel %d3,%sp@-
    2080:	bsrl 0 <__XCEXIT>
			2082: DISP32	_strncpy
    2086:	clrb %sp@(331)
    208a:	movel %d2,%sp@-
    208c:	movel %d3,%sp@-
    208e:	movel %d4,%sp@-
    2090:	movel %d6,%sp@-
    2092:	bsrw 22fe <_DoAssignDrive>
    2096:	moveal %d6,%a0
    2098:	moveal %a0@,%a1
    209a:	addal %d5,%a1
    209c:	movel %a1,%sp@-
    209e:	movel %d4,%sp@-
    20a0:	pea %pc@(1ece <_readline+0x4c>)
    20a4:	bsrl 0 <__XCEXIT>
			20a6: DISP32	_kprintf
    20aa:	moveq #36,%d0
    20ac:	addl %d0,%d5
    20ae:	addql #1,%d4
    20b0:	lea %sp@(40),%sp
    20b4:	moveq #32,%d0
    20b6:	cmpl %d4,%d0
    20b8:	beqs 20c8 <_DoGetDevices+0x1e6>
    20ba:	moveal %a3@,%a3
    20bc:	movel %a3,%d0
    20be:	lsll #2,%d0
    20c0:	moveal %d0,%a3
    20c2:	tstl %a3
    20c4:	bnew 2042 <_DoGetDevices+0x160>
    20c8:	movel %d4,%d3
    20ca:	subl %d7,%d3
    20cc:	movel %d3,%d2
    20ce:	bpls 20d2 <_DoGetDevices+0x1f0>
    20d0:	addql #1,%d2
    20d2:	bras 2136 <_DoGetDevices+0x254>
    20d4:	moveal %d2,%a3
    20d6:	cmpl %a3,%d3
    20d8:	bles 2130 <_DoGetDevices+0x24e>
    20da:	moveal %a3,%a2
    20dc:	bras 20ea <_DoGetDevices+0x208>
    20de:	moveq #36,%d0
    20e0:	moveal %fp,%a1
    20e2:	moveal %d5,%a0
    20e4:	bsrl 0 <__XCEXIT>
			20e6: DISP32	_SwapMem
    20ea:	subal %d2,%a2
    20ec:	tstl %a2
    20ee:	blts 212a <_DoGetDevices+0x248>
    20f0:	movel %a2,%d0
    20f2:	addl %d2,%d0
    20f4:	moveal %d0,%a1
    20f6:	addal %d7,%a1
    20f8:	lea %a2@(00000000,%d7:l),%a0
    20fc:	lea %a0@(00000000,%a0:l:8),%a0
    2100:	moveal %sp@(44),%fp
    2104:	lea %fp@(00000e70,%a0:l:4),%fp
    210a:	movel %fp,%d5
    210c:	lea %a1@(00000000,%a1:l:8),%a0
    2110:	moveal %sp@(44),%a1
    2114:	lea %a1@(00000e70,%a0:l:4),%fp
    211a:	moveal %a4@(0),%a6
			211c: BASE16	_DOpusBase
    211e:	moveal %d5,%a0
    2120:	moveal %fp,%a1
    2122:	jsr %a6@(-138)
    2126:	tstl %d0
    2128:	bgts 20de <_DoGetDevices+0x1fc>
    212a:	addql #1,%a3
    212c:	cmpl %a3,%d3
    212e:	bgts 20da <_DoGetDevices+0x1f8>
    2130:	movel %d2,%d2
    2132:	bpls 2136 <_DoGetDevices+0x254>
    2134:	addql #1,%d2
    2136:	asrl #1,%d2
    2138:	bgts 20d4 <_DoGetDevices+0x1f2>
    213a:	moveq #31,%d0
    213c:	cmpl %d4,%d0
    213e:	blts 2178 <_DoGetDevices+0x296>
    2140:	moveal %d4,%a3
    2142:	clrl %sp@-
    2144:	clrl %sp@-
    2146:	movel %a3,%sp@-
    2148:	movel %d6,%sp@-
    214a:	bsrw 22fe <_DoAssignDrive>
    214e:	lea %sp@(16),%sp
    2152:	addql #1,%a3
    2154:	moveq #31,%d0
    2156:	cmpl %a3,%d0
    2158:	bges 2142 <_DoGetDevices+0x260>
    215a:	lea %a3@(00000000,%a3:l:8),%a1
    215e:	moveal %d6,%a2
    2160:	moveal %a2@,%a0
    2162:	pea %a0@(00000e70,%a1:l:4)
    2168:	movel %a3,%sp@-
    216a:	pea %pc@(1ed7 <_readline+0x55>)
    216e:	bsrl 0 <__XCEXIT>
			2170: DISP32	_kprintf
    2174:	lea %sp@(12),%sp
    2178:	clrl %d4
    217a:	movel #3696,%d2
    2180:	moveal %d6,%fp
    2182:	movel %fp@,%d0
    2184:	addl %d2,%d0
    2186:	movel %d0,%sp@-
    2188:	movel %d4,%sp@-
    218a:	pea %pc@(1ece <_readline+0x4c>)
    218e:	bsrl 0 <__XCEXIT>
			2190: DISP32	_kprintf
    2194:	lea %sp@(12),%sp
    2198:	moveq #36,%d0
    219a:	addl %d0,%d2
    219c:	addql #1,%d4
    219e:	moveq #31,%d0
    21a0:	cmpl %d4,%d0
    21a2:	bges 2180 <_DoGetDevices+0x29e>
    21a4:	moveml %sp@+,%d2-%d7/%a2-%a6
    21a8:	lea %sp@(280),%sp
    21ac:	rts

000021ae <_DoAssignGadget>:
    21ae:	moveml %d2-%d3/%a2-%a6,%sp@-
    21b2:	lea 0 <__XCEXIT>,%a4
			21b4: 32	___a4_init
    21b8:	movel %a0,%d2
    21ba:	moveal %d1,%fp
    21bc:	moveal %a1,%a3
    21be:	movel %a2,%d3
    21c0:	moveal %a0@(12),%a2
    21c4:	clrl %d1
    21c6:	bras 21ce <_DoAssignGadget+0x20>
    21c8:	moveal %a2@(3024),%a2
    21cc:	addql #1,%d1
    21ce:	cmpl %d1,%d0
    21d0:	bles 21e0 <_DoAssignGadget+0x32>
    21d2:	tstl %a2
    21d4:	beqs 21dc <_DoAssignGadget+0x2e>
    21d6:	tstl %a2@(3024)
    21da:	bnes 21c8 <_DoAssignGadget+0x1a>
    21dc:	cmpl %d1,%d0
    21de:	bgts 21e4 <_DoAssignGadget+0x36>
    21e0:	tstl %a2
    21e2:	bnes 220c <_DoAssignGadget+0x5e>
    21e4:	moveal %a4@(0),%a6
			21e6: BASE16	_SysBase
    21e8:	movel #3028,%d0
    21ee:	moveq #1,%d1
    21f0:	swap %d1
    21f2:	jsr %a6@(-198)
    21f6:	movel %d0,%d1
    21f8:	beqs 2272 <_DoAssignGadget+0xc4>
    21fa:	tstl %a2
    21fc:	beqs 2204 <_DoAssignGadget+0x56>
    21fe:	movel %d0,%a2@(3024)
    2202:	bras 220a <_DoAssignGadget+0x5c>
    2204:	moveal %d2,%a0
    2206:	movel %d0,%a0@(12)
    220a:	moveal %d1,%a2
    220c:	moveq #-1,%d0
    220e:	cmpl %a3,%d0
    2210:	beqs 223c <_DoAssignGadget+0x8e>
    2212:	lea %fp@(00000000,%fp:l:8),%a0
    2216:	movel %a0,%d2
    2218:	lsll #2,%d2
    221a:	movel %a2@(00000000,%d2:l),%sp@-
    221e:	bsrw 24da <_freestring>
    2222:	clrl %a2@(00000000,%d2:l)
    2226:	addql #4,%sp
    2228:	tstl %a3
    222a:	beqs 223c <_DoAssignGadget+0x8e>
    222c:	tstb %a3@
    222e:	beqs 223c <_DoAssignGadget+0x8e>
    2230:	movel %a3,%sp@-
    2232:	bsrw e8a <_getstringcopy>
    2236:	movel %d0,%a2@(00000000,%d2:l)
    223a:	addql #4,%sp
    223c:	moveq #-1,%d0
    223e:	cmpl %d3,%d0
    2240:	beqs 2272 <_DoAssignGadget+0xc4>
    2242:	lea %fp@(00000000,%fp:l:8),%fp
    2246:	movel %fp,%d2
    2248:	lsll #2,%d2
    224a:	lea %a2@(32),%a6
    224e:	movel %a6@(00000000,%d2:l),%sp@-
    2252:	bsrw 24da <_freestring>
    2256:	clrl %a6@(00000000,%d2:l)
    225a:	addql #4,%sp
    225c:	tstl %d3
    225e:	beqs 2272 <_DoAssignGadget+0xc4>
    2260:	moveal %d3,%a0
    2262:	tstb %a0@
    2264:	beqs 2272 <_DoAssignGadget+0xc4>
    2266:	movel %d3,%sp@-
    2268:	bsrw e8a <_getstringcopy>
    226c:	movel %d0,%a6@(00000000,%d2:l)
    2270:	addql #4,%sp
    2272:	moveml %sp@+,%d2-%d3/%a2-%a6
    2276:	rts

00002278 <_DoAssignMenu>:
    2278:	moveml %d2-%d3/%a2-%a6,%sp@-
    227c:	lea 0 <__XCEXIT>,%a4
			227e: 32	___a4_init
    2282:	moveal %d0,%fp
    2284:	moveal %a1,%a3
    2286:	moveal %a2,%a6
    2288:	movel %a0@,%d3
    228a:	beqs 22f8 <_DoAssignMenu+0x80>
    228c:	moveq #-1,%d0
    228e:	cmpl %a3,%d0
    2290:	beqs 22c2 <_DoAssignMenu+0x4a>
    2292:	lea %fp@(00000000,%fp:l:8),%a0
    2296:	movel %a0,%d2
    2298:	lsll #2,%d2
    229a:	moveal %d3,%a0
    229c:	lea %a0@(96),%a2
    22a0:	movel %a2@(00000000,%d2:l),%sp@-
    22a4:	bsrw 24da <_freestring>
    22a8:	clrl %a2@(00000000,%d2:l)
    22ac:	addql #4,%sp
    22ae:	tstl %a3
    22b0:	beqs 22c2 <_DoAssignMenu+0x4a>
    22b2:	tstb %a3@
    22b4:	beqs 22c2 <_DoAssignMenu+0x4a>
    22b6:	movel %a3,%sp@-
    22b8:	bsrw e8a <_getstringcopy>
    22bc:	movel %d0,%a2@(00000000,%d2:l)
    22c0:	addql #4,%sp
    22c2:	moveq #-1,%d0
    22c4:	cmpl %a6,%d0
    22c6:	beqs 22f8 <_DoAssignMenu+0x80>
    22c8:	lea %fp@(00000000,%fp:l:8),%fp
    22cc:	movel %fp,%d2
    22ce:	lsll #2,%d2
    22d0:	moveal %d3,%a2
    22d2:	lea %a2@(128),%a2
    22d6:	movel %a2@(00000000,%d2:l),%sp@-
    22da:	bsrw 24da <_freestring>
    22de:	clrl %a2@(00000000,%d2:l)
    22e2:	addql #4,%sp
    22e4:	tstl %a6
    22e6:	beqs 22f8 <_DoAssignMenu+0x80>
    22e8:	tstb %a6@
    22ea:	beqs 22f8 <_DoAssignMenu+0x80>
    22ec:	movel %a6,%sp@-
    22ee:	bsrw e8a <_getstringcopy>
    22f2:	movel %d0,%a2@(00000000,%d2:l)
    22f6:	addql #4,%sp
    22f8:	moveml %sp@+,%d2-%d3/%a2-%a6
    22fc:	rts

000022fe <_DoAssignDrive>:
    22fe:	moveml %d2/%a2-%a3/%fp,%sp@-
    2302:	moveal %sp@(20),%a0
    2306:	moveal %sp@(24),%a3
    230a:	movel %sp@(28),%d0
    230e:	moveal %sp@(32),%fp
    2312:	moveal %a0@,%a2
    2314:	tstl %a2
    2316:	beqs 2376 <_DoAssignDrive+0x78>
    2318:	moveq #-1,%d1
    231a:	cmpl %d0,%d1
    231c:	beqs 2342 <_DoAssignDrive+0x44>
    231e:	tstl %d0
    2320:	bnes 232e <_DoAssignDrive+0x30>
    2322:	lea %a3@(00000000,%a3:l:8),%a0
    2326:	clrb %a2@(00000e70,%a0:l:4)
    232c:	bras 2342 <_DoAssignDrive+0x44>
    232e:	movel %d0,%sp@-
    2330:	lea %a3@(00000000,%a3:l:8),%a0
    2334:	pea %a2@(00000e70,%a0:l:4)
    233a:	bsrl 0 <__XCEXIT>
			233c: DISP32	_strcpy
    2340:	addql #8,%sp
    2342:	moveq #-1,%d0
    2344:	cmpl %fp,%d0
    2346:	beqs 2376 <_DoAssignDrive+0x78>
    2348:	lea %a3@(00000000,%a3:l:8),%a3
    234c:	movel %a3,%d2
    234e:	lsll #2,%d2
    2350:	lea %a2@(3728),%a2
    2354:	movel %a2@(00000000,%d2:l),%sp@-
    2358:	bsrw 24da <_freestring>
    235c:	clrl %a2@(00000000,%d2:l)
    2360:	addql #4,%sp
    2362:	tstl %fp
    2364:	beqs 2376 <_DoAssignDrive+0x78>
    2366:	tstb %fp@
    2368:	beqs 2376 <_DoAssignDrive+0x78>
    236a:	movel %fp,%sp@-
    236c:	bsrw e8a <_getstringcopy>
    2370:	movel %d0,%a2@(00000000,%d2:l)
    2374:	addql #4,%sp
    2376:	moveml %sp@+,%d2/%a2-%a3/%fp
    237a:	rts

0000237c <_linkinnewfiletype>:
    237c:	movel %a3,%sp@-
    237e:	movel %a2,%sp@-
    2380:	moveal %sp@(12),%a0
    2384:	moveal %sp@(16),%a3
    2388:	clrl %a3@
    238a:	moveal %a0@(8),%a2
    238e:	tstl %a2
    2390:	bnes 239a <_linkinnewfiletype+0x1e>
    2392:	movel %a3,%a0@(8)
    2396:	bras 23b8 <_linkinnewfiletype+0x3c>
    2398:	moveal %a2@,%a2
    239a:	tstl %a2@
    239c:	beqs 23b6 <_linkinnewfiletype+0x3a>
    239e:	pea %pc@(153d <_writestring+0x447>)
    23a2:	movel %a2@,%d0
    23a4:	addql #4,%d0
    23a6:	movel %d0,%sp@-
    23a8:	bsrl 0 <__XCEXIT>
			23aa: DISP32	_strcmp
    23ae:	addql #8,%sp
    23b0:	tstl %d0
    23b2:	bnes 2398 <_linkinnewfiletype+0x1c>
    23b4:	movel %a2@,%a3@
    23b6:	movel %a3,%a2@
    23b8:	moveal %sp@+,%a2
    23ba:	moveal %sp@+,%a3
    23bc:	rts

000023be <_DoFreeConfig>:
    23be:	moveml %d2-%d3/%a2-%a6,%sp@-
    23c2:	lea 0 <__XCEXIT>,%a4
			23c4: 32	___a4_init
    23c8:	moveal %a0,%fp
    23ca:	moveal %fp@,%a3
    23cc:	tstl %a3
    23ce:	beqw 24d4 <_DoFreeConfig+0x116>
    23d2:	clrl %d2
    23d4:	clrl %d3
    23d6:	lea %a3@(121),%a6
    23da:	subal %a2,%a2
    23dc:	subal %a1,%a1
    23de:	movel %d2,%d0
    23e0:	moveal %fp,%a0
    23e2:	bsrw 2278 <_DoAssignMenu>
    23e6:	clrl %a3@(00000070,%d3:l)
    23ea:	clrb %a6@(1)
    23ee:	movel #4000,%a3@(00000074,%d3:l)
    23f6:	clrb %a6@(2)
    23fa:	moveb #2,%a6@(3)
    2400:	clrb %a6@(4)
    2404:	moveb #1,%a6@(5)
    240a:	clrb %a6@(-1)
    240e:	clrb %a6@
    2410:	lea %a6@(36),%a6
    2414:	moveq #36,%d0
    2416:	addl %d0,%d3
    2418:	addql #1,%d2
    241a:	moveq #99,%d0
    241c:	cmpl %d2,%d0
    241e:	bges 23da <_DoFreeConfig+0x1c>
    2420:	clrl %d2
    2422:	lea %a3@(3726),%a2
    2426:	clrl %sp@-
    2428:	clrl %sp@-
    242a:	movel %d2,%sp@-
    242c:	movel %fp,%sp@-
    242e:	bsrw 22fe <_DoAssignDrive>
    2432:	clrb %a2@(-5)
    2436:	clrb %a2@(-6)
    243a:	moveb #3,%a2@(-1)
    2440:	clrb %a2@
    2442:	lea %sp@(16),%sp
    2446:	lea %a2@(36),%a2
    244a:	addql #1,%d2
    244c:	moveq #31,%d0
    244e:	cmpl %d2,%d0
    2450:	bges 2426 <_DoFreeConfig+0x68>
    2452:	moveal %fp@(12),%a2
    2456:	tstl %a2
    2458:	beqs 2494 <_DoFreeConfig+0xd6>
    245a:	subal %a3,%a3
    245c:	moveq #83,%d2
    245e:	movel %a2@(00000000,%a3:l),%sp@-
    2462:	bsrs 24da <_freestring>
    2464:	movel %a3@(00000020,%a2:l),%sp@-
    2468:	bsrs 24da <_freestring>
    246a:	addql #8,%sp
    246c:	lea %a3@(36),%a3
    2470:	dbf %d2,245e <_DoFreeConfig+0xa0>
    2474:	clrw %d2
    2476:	subql #1,%d2
    2478:	bccs 245e <_DoFreeConfig+0xa0>
    247a:	movel %a2@(3024),%d2
    247e:	moveal %a4@(0),%a6
			2480: BASE16	_SysBase
    2482:	moveal %a2,%a1
    2484:	movel #3028,%d0
    248a:	jsr %a6@(-210)
    248e:	moveal %d2,%a2
    2490:	tstl %a2
    2492:	bnes 245a <_DoFreeConfig+0x9c>
    2494:	clrl %fp@(16)
    2498:	clrl %fp@(12)
    249c:	moveal %fp@(20),%a2
    24a0:	tstl %a2
    24a2:	beqs 24c0 <_DoFreeConfig+0x102>
    24a4:	movel %a2@,%d2
    24a6:	movel %a2@(80),%sp@-
    24aa:	bsrs 24da <_freestring>
    24ac:	addql #4,%sp
    24ae:	moveal %a4@(0),%a6
			24b0: BASE16	_SysBase
    24b2:	moveal %a2,%a1
    24b4:	moveq #84,%d0
    24b6:	jsr %a6@(-210)
    24ba:	moveal %d2,%a2
    24bc:	tstl %a2
    24be:	bnes 24a4 <_DoFreeConfig+0xe6>
    24c0:	clrl %fp@(20)
    24c4:	moveal %a4@(0),%a6
			24c6: BASE16	_DOpusBase
    24c8:	lea %fp@(4),%a0
    24cc:	jsr %a6@(-294)
    24d0:	clrl %fp@(8)
    24d4:	moveml %sp@+,%d2-%d3/%a2-%a6
    24d8:	rts

000024da <_freestring>:
    24da:	movel %a6,%sp@-
    24dc:	movel %d2,%sp@-
    24de:	movel %sp@(12),%d2
    24e2:	beqs 24fa <_freestring+0x20>
    24e4:	movel %d2,%sp@-
    24e6:	bsrl 0 <__XCEXIT>
			24e8: DISP32	_strlen
    24ec:	addql #4,%sp
    24ee:	moveal %a4@(0),%a6
			24f0: BASE16	_SysBase
    24f2:	moveal %d2,%a1
    24f4:	addql #1,%d0
    24f6:	jsr %a6@(-210)
    24fa:	movel %sp@+,%d2
    24fc:	moveal %sp@+,%a6
    24fe:	rts

00002500 <_DoCheckConfig>:
    2500:	movel %a4,%sp@-
    2502:	lea 0 <__XCEXIT>,%a4
			2504: 32	___a4_init
    2508:	moveal %a0@,%a0
    250a:	tstl %a0
    250c:	bnes 2512 <_DoCheckConfig+0x12>
    250e:	clrl %d0
    2510:	bras 254e <_DoCheckConfig+0x4e>
    2512:	moveb %a0@(7112),%d0
    2516:	cmpib #4,%d0
    251a:	bgts 2524 <_DoCheckConfig+0x24>
    251c:	moveb #5,%a0@(7112)
    2522:	bras 2530 <_DoCheckConfig+0x30>
    2524:	cmpib #49,%d0
    2528:	bles 2530 <_DoCheckConfig+0x30>
    252a:	moveb #49,%a0@(7112)
    2530:	moveb %a0@(7111),%d0
    2534:	cmpib #7,%d0
    2538:	bgts 2542 <_DoCheckConfig+0x42>
    253a:	moveb #8,%a0@(7111)
    2540:	bras 254e <_DoCheckConfig+0x4e>
    2542:	cmpib #108,%d0
    2546:	bles 254e <_DoCheckConfig+0x4e>
    2548:	moveb #108,%a0@(7111)
    254e:	moveal %sp@+,%a4
    2550:	rts
    2552:	negw %sp
    2554:	moveq #117,%d0
    2556:	071472
    2558:	addqw #1,%fp@-
    255a:	070565
    255c:	bcss 25d1 <_DoCheckConfig+0xd1>
    255e:	moveq #101,%d2
    2560:	moveq #115,%d1
    2562:	movel %d0,%sp@-
    2564:	negw %sp
    2566:	moveq #117,%d0
    2568:	071472
    256a:	046557
    256c:	bccs 25e3 <_DoCheckConfig+0xe3>
    256e:	bges 25d5 <_DoCheckConfig+0xd5>
    2570:	071457
    2572:	oriw #20336,%d4
    2576:	072563
    2578:	moveaw %a2@,%fp
    257a:	bcss 25f4 <_DoCheckConfig+0xf4>
    257c:	moveq #47,%d4
    257e:	oriw #17752,%a2@
    2582:	addqb #4,%pc@(25c8 <_DoCheckConfig+0xc8>)
    2586:	047560
    2588:	072563
    258a:	moveaw %a4,%fp
    258c:	bvss 25f0 <_DoCheckConfig+0xf0>
    258e:	071457
    2590:	oriw #18754,%a4
    2594:	subqb #1,%pc@(25da <_DoCheckConfig+0xda>)
    2598:	047560
    259a:	072563
    259c:	moveaw %a3@,%fp
    259e:	movel %d0,%sp@-
    25a0:	subqb #1,%pc@(25e6 <_DoCheckConfig+0xe6>)
    25a4:	047560
    25a6:	072563
    25a8:	moveaw %d3,%fp
    25aa:	movel %d0,%sp@-
    25ac:	chkl %pc@(25f1 <_DoCheckConfig+0xf1>),%d1
    25b0:	bsrs 2620 <_DoCheckConfig+0x120>
    25b2:	blss 2619 <_DoCheckConfig+0x119>
    25b4:	bgew 7a28 <_req_rets.49+0x4c56>
    25b8:	074440
    25ba:	040547
    25bc:	bsrs 2627 <_DoCheckConfig+0x127>
    25be:	bgtw 7b2e <_req_rets.49+0x4d5c>
    25c2:	bsrs 2626 <_DoCheckConfig+0x126>
    25c4:	bges 262b <_DoCheckConfig+0x12b>
    25c6:	moveal %a4@(00006669,%d6:l:8),%a0
    25cc:	bgts 2632 <_DoCheckConfig+0x132>
    25ce:	moveal %a4@(00000065,%d6:l),%a0
    25d2:	moveal %a6@-,%a0
    25d4:	bvss 2642 <_DoCheckConfig+0x142>
    25d6:	bcss 25f8 <_DoCheckConfig+0xf8>
    25d8:	movel %fp@-,%d1
    25da:	071442
    25dc:	eoriw #28192,%a1@(25961)
    25e2:	moveq #104,%d2
    25e4:	bcss 2658 <_DoCheckConfig+0x158>
    25e6:	moveal %a4@(00000065,%d6:l),%a0
    25ea:	moveal %d3,%a0
    25ec:	movew %a0@-,%d5
    25ee:	bccs 2659 <_DoCheckConfig+0x159>
    25f0:	moveq #101,%d1
    25f2:	blss 2668 <_DoCheckConfig+0x168>
    25f4:	bles 2668 <_DoCheckConfig+0x168>
    25f6:	074440
    25f8:	bles 266c <_DoCheckConfig+0x16c>
    25fa:	moveal %a4@(00000065,%d6:l),%a0
    25fe:	eoriw #20304,%d4
    2602:	subqw #2,%a3@
    2604:	moveaw %fp,%fp
    2606:	bles 266c <_DoCheckConfig+0x16c>
    2608:	072554
    260a:	bcss 267f <_DoFindSystemFile+0xf>
    260c:	movel %a0@-,%sp@-
    260e:	bccs 2679 <_DoFindSystemFile+0x9>
    2610:	moveq #101,%d1
    2612:	blss 2688 <_DoFindSystemFile+0x18>
    2614:	bles 2688 <_DoFindSystemFile+0x18>
    2616:	074456
    2618:	moveal %a1,%a0
    261a:	bgts 268f <_DoFindSystemFile+0x1f>
    261c:	bcss 2690 <_DoFindSystemFile+0x20>
    261e:	moveq #32,%d2
    2620:	negw %sp
    2622:	moveq #117,%d0
    2624:	071440
    2626:	bccs 2691 <_DoFindSystemFile+0x21>
    2628:	071553
    262a:	eoriw #26144,%a1@(28261)
    2630:	blss 2697 <_DoFindSystemFile+0x27>
    2632:	071563
    2634:	bsrs 26a8 <_DoFindSystemFile+0x38>
    2636:	074440
    2638:	bsrs 26a8 <_DoFindSystemFile+0x38>
    263a:	bccs 265c <_DoCheckConfig+0x15c>
    263c:	071545
    263e:	bges 26a5 <_DoFindSystemFile+0x35>
    2640:	blss 26b6 <_DoFindSystemFile+0x46>
    2642:	moveal %a4@,%a0
    2644:	moveq #121,%d1
    2646:	moveal %d1,%a0
    2648:	beqs 26ab <_DoFindSystemFile+0x3b>
    264a:	bvss 26ba <_DoFindSystemFile+0x4a>
    264c:	movel %a0@-,%d6
    264e:	bles 26c2 <_DoFindSystemFile+0x52>
    2650:	eoriw #24942,%d3
    2654:	blss 26bb <_DoFindSystemFile+0x4b>
    2656:	bges 2678 <_DoFindSystemFile+0x8>
    2658:	moveq #111,%d2
    265a:	moveal %a1@-,%a0
    265c:	bhis 26cd <_DoFindSystemFile+0x5d>
    265e:	moveq #116,%d1
    2660:	moveal %a4@(00000065,%d6:l),%a0
    2664:	moveal %sp@(28773),%a0
    2668:	moveq #97,%d1
    266a:	moveq #105,%d2
    266c:	bles 26dc <_DoFindSystemFile+0x6c>
	...

00002670 <_DoFindSystemFile>:
    2670:	lea %sp@(-616),%sp
    2674:	moveml %d2-%d7/%a2-%a6,%sp@-
    2678:	lea 0 <__XCEXIT>,%a4
			267a: 32	___a4_init
    267e:	movel %a0,%d5
    2680:	movel %a1,%d7
    2682:	movel %d0,%sp@(44)
    2686:	movel %d1,%d6
    2688:	movel %sp,%d4
    268a:	addil #400,%d4
    2690:	moveaw #256,%a3
    2694:	lea %a4@(0),%fp
			2696: BASE16	_DOpusBase
    2698:	moveal %fp@,%a6
    269a:	moveal %d4,%a0
    269c:	moveal %d5,%a1
    269e:	movel %a3,%d0
    26a0:	jsr %a6@(-120)
    26a4:	lea %a4@(0),%a2
			26a6: BASE16	_DOSBase
    26a8:	moveal %a2@,%a6
    26aa:	cmpiw #35,%a6@(20)
    26b0:	blss 26c2 <_DoFindSystemFile+0x52>
    26b2:	movel %d4,%d1
    26b4:	clrl %d2
    26b6:	clrl %d3
    26b8:	jsr %a6@(-780)
    26bc:	tstl %d0
    26be:	bnew 2744 <_DoFindSystemFile+0xd4>
    26c2:	subal %a1,%a1
    26c4:	moveal %d4,%a0
    26c6:	bsrl 0 <__XCEXIT>
			26c8: DISP32	_DoCheckExist
    26cc:	tstl %d0
    26ce:	blts 2712 <_DoFindSystemFile+0xa2>
    26d0:	subal %a3,%a3
    26d2:	bras 26d6 <_DoFindSystemFile+0x66>
    26d4:	addql #1,%a3
    26d6:	moveq #1,%d0
    26d8:	cmpl %a3,%d0
    26da:	blts 2706 <_DoFindSystemFile+0x96>
    26dc:	lea %a4@(1462),%a2
			26de: BASE16	.data+0xffffd820
    26e0:	lea %a3@(00000000,%d6:l:2),%a1
    26e4:	moveal %fp@,%a6
    26e6:	moveal %d4,%a0
    26e8:	moveal %a2@(00000000,%a1:l:4),%a1
    26ec:	moveal %d5,%a2
    26ee:	addil #255,%d0
    26f4:	jsr %a6@(-150)
    26f8:	subal %a1,%a1
    26fa:	moveal %d4,%a0
    26fc:	bsrl 0 <__XCEXIT>
			26fe: DISP32	_DoCheckExist
    2702:	tstl %d0
    2704:	bges 26d4 <_DoFindSystemFile+0x64>
    2706:	moveq #2,%d0
    2708:	cmpl %a3,%d0
    270a:	bnes 2744 <_DoFindSystemFile+0xd4>
    270c:	clrb %sp@(400)
    2710:	bras 2744 <_DoFindSystemFile+0xd4>
    2712:	moveal %a2@,%a6
    2714:	movel #4541,%d1
			2716: 32	.text
    271a:	moveq #-2,%d2
    271c:	jsr %a6@(-84)
    2720:	movel %d0,%d2
    2722:	beqs 2744 <_DoFindSystemFile+0xd4>
    2724:	movel %a3,%d0
    2726:	moveal %d4,%a1
    2728:	moveal %d2,%a0
    272a:	bsrl 0 <__XCEXIT>
			272c: DISP32	_DoPathName
    2730:	moveal %a2@,%a6
    2732:	movel %d2,%d1
    2734:	jsr %a6@(-90)
    2738:	movel %a3,%d0
    273a:	moveal %d5,%a1
    273c:	moveal %d4,%a0
    273e:	bsrl 0 <__XCEXIT>
			2740: DISP32	_DoTackOn
    2744:	tstb %sp@(400)
    2748:	beqs 2760 <_DoFindSystemFile+0xf0>
    274a:	moveal %a4@(0),%a6
			274c: BASE16	_DOpusBase
    274e:	moveal %d7,%a0
    2750:	lea %sp@(400),%a1
    2754:	movel %sp@(44),%d0
    2758:	jsr %a6@(-120)
    275c:	moveq #1,%d0
    275e:	bras 27d4 <_DoFindSystemFile+0x164>
    2760:	moveq #4,%d0
    2762:	cmpl %d6,%d0
    2764:	bnes 27c2 <_DoFindSystemFile+0x152>
    2766:	movel %d5,%sp@-
    2768:	pea %pc@(25c0 <_DoCheckConfig+0xc0>)
    276c:	moveq #56,%d2
    276e:	addl %sp,%d2
    2770:	movel %d2,%sp@-
    2772:	bsrl 0 <__XCEXIT>
			2774: DISP32	_LSprintf
    2778:	movel %d2,%sp@(360)
    277c:	lea %a4@(1510),%a0
			277e: BASE16	.data+0xffffd820
    2780:	movel %a0,%sp@(364)
    2784:	lea %a4@(1522),%a0
			2786: BASE16	.data+0xffffd820
    2788:	movel %a0,%sp@(368)
    278c:	moveq #-1,%d0
    278e:	movel %d0,%sp@(372)
    2792:	movel %d0,%sp@(376)
    2796:	movel %d0,%sp@(380)
    279a:	movel %d0,%sp@(384)
    279e:	clrl %sp@(388)
    27a2:	clrl %sp@(396)
    27a6:	clrl %sp@(400)
    27aa:	lea %sp@(12),%sp
    27ae:	moveal %a4@(0),%a6
			27b0: BASE16	_DOpusBase
    27b2:	subal %a0,%a0
    27b4:	lea %sp@(348),%a1
    27b8:	jsr %a6@(-408)
    27bc:	tstl %d0
    27be:	bnew 2688 <_DoFindSystemFile+0x18>
    27c2:	moveal %a4@(0),%a6
			27c4: BASE16	_DOpusBase
    27c6:	moveal %d7,%a0
    27c8:	moveal %d5,%a1
    27ca:	movel %sp@(44),%d0
    27ce:	jsr %a6@(-120)
    27d2:	clrl %d0
    27d4:	moveml %sp@+,%d2-%d7/%a2-%a6
    27d8:	lea %sp@(616),%sp
    27dc:	rts
	...
