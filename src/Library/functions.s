
functions.o:     file format a.out-amiga

Disassembly of section .text:

00000000 <wbname>:
   0:	subqw #3,%sp@(29291)
   4:	bhis 6b <endgetscr+0x3>
   6:	bgts 6b <endgetscr+0x3>
   8:	bvcw a <rand>

0000000a <rand>:
	...

00000012 <ditherdata>:
  12:	orl %a0,%d4
  14:	movel %a2@-,%d1

00000016 <GetWBScreen>:
  16:	moveml %a2-%a3/%fp-%a6,%sp@-
  1a:	moveal 0 <wbname>,%a6
			1c: 32	_IntuitionBase
  20:	movew %a6@(20),%d0
  24:	cmpiw #36,%d0
  28:	blts 5a <getwb13>
  2a:	moveal %a0,%a2
  2c:	lea %pc@(0 <wbname>),%a0
  30:	jsr %a6@(-510)
  34:	moveal %d0,%a3
  36:	moveal %d0,%a0
  38:	moveal %a2,%a1
  3a:	movel #346,%d0
  40:	moveal 4 <wbname+0x4>,%a6
  44:	jsr %a6@(-624)
  48:	moveal %fp,%a6
  4a:	subal %a0,%a0
  4c:	moveal %a3,%a1
  4e:	moveal 0 <wbname>,%a6
			50: 32	_IntuitionBase
  54:	jsr %a6@(-516)
  58:	bras 68 <endgetscr>

0000005a <getwb13>:
  5a:	movel #346,%d0
  60:	moveq #1,%d1
  62:	subal %a1,%a1
  64:	jsr %a6@(-426)

00000068 <endgetscr>:
  68:	moveml %sp@+,%a2-%a3/%fp-%a6
  6c:	rts

0000006e <Seed>:
  6e:	movel %d0,%d1
  70:	notl %d1
  72:	moveml %d0-%d1,a <rand>
			76: 32	.text

0000007a <longrnd>:
  7a:	moveml %d2-%d3,%sp@-
  7e:	moveml %pc@(a <rand>),%d0-%d1
  84:	andib #14,%d0
  88:	orib #32,%d0
  8c:	movel %d0,%d2
  8e:	movel %d1,%d3
  90:	addl %d2,%d2
  92:	addxl %d3,%d3
  94:	addl %d2,%d0
  96:	addxl %d3,%d1
  98:	swap %d3
  9a:	swap %d2
  9c:	movew %d2,%d3
  9e:	clrw %d2
  a0:	addl %d2,%d0
  a2:	addxl %d3,%d1
  a4:	moveml %d0-%d1,a <rand>
			a8: 32	.text
  ac:	movel %d1,%d0
  ae:	moveml %sp@+,%d2-%d3
  b2:	rts

000000b4 <Random>:
  b4:	movew %d2,%sp@-
  b6:	movew %d0,%d2
  b8:	beqs c6 <skip>
  ba:	bsrs 7a <longrnd>
  bc:	clrw %d0
  be:	swap %d0
  c0:	divuw %d2,%d0
  c2:	clrw %d0
  c4:	swap %d0

000000c6 <skip>:
  c6:	movew %sp@+,%d2
  c8:	rts

000000ca <StrToUpper>:
  ca:	moveb %a0@+,%d0
  cc:	bsrw 3a2 <LToUpper>
  d0:	moveb %d0,%a1@+
  d2:	bnes ca <StrToUpper>
  d4:	rts

000000d6 <StrToLower>:
  d6:	moveb %a0@+,%d0
  d8:	bsrw 3b2 <LToLower>
  dc:	moveb %d0,%a1@+
  de:	bnes d6 <StrToLower>
  e0:	rts

000000e2 <DisableGadget>:
  e2:	btst #0,%a0@(12)
  e8:	bnes f2 <disabled>
  ea:	bset #0,%a0@(12)
  f0:	bsrs 106 <GhostGadget>

000000f2 <disabled>:
  f2:	rts

000000f4 <EnableGadget>:
  f4:	btst #0,%a0@(12)
  fa:	beqs 104 <enabled>
  fc:	bclr #0,%a0@(12)
 102:	bsrs 106 <GhostGadget>

00000104 <enabled>:
 104:	rts

00000106 <GhostGadget>:
 106:	moveml %d2-%d5/%a2-%a3/%a6,%sp@-
 10a:	moveb %a1@(28),%sp@-
 10e:	moveal %a0,%a2
 110:	moveal %a1,%a3
 112:	movel %d0,%d4
 114:	movel %d1,%d5
 116:	moveq #2,%d0
 118:	moveal %a6@(48),%a6
 11c:	jsr %a6@(-354)
 120:	moveal %a3,%a1
 122:	lea %pc@(12 <ditherdata>),%a0
 126:	movel %a0,%a1@(8)
 12a:	moveb #1,%a1@(29)
 130:	movel %d4,%d0
 132:	addw %a2@(4),%d0
 136:	movel %d5,%d1
 138:	addw %a2@(6),%d1
 13c:	moveq #0,%d2
 13e:	movew %a2@(4),%d2
 142:	addw %a2@(8),%d2
 146:	subql #1,%d2
 148:	subl %d4,%d2
 14a:	moveq #0,%d3
 14c:	movew %a2@(6),%d3
 150:	addw %a2@(10),%d3
 154:	subql #1,%d3
 156:	subl %d5,%d3
 158:	jsr %a6@(-306)
 15c:	moveal %a3,%a1
 15e:	movel #0,%a1@(8)
 166:	moveb #0,%a1@(29)
 16c:	moveq #0,%d0
 16e:	moveb %sp@+,%d0
 170:	jsr %a6@(-354)
 174:	moveml %sp@+,%d2-%d5/%a2-%a3/%a6
 178:	rts

0000017a <DrawRadioButton>:
 17a:	moveml %d2-%d7/%a2-%a4/%a6,%sp@-
 17e:	moveal %a6@(48),%a6
 182:	moveal %a0,%a2
 184:	movel %d0,%d6
 186:	movel %d1,%d7
 188:	moveal %a2,%a1
 18a:	movel %d4,%d0
 18c:	jsr %a6@(-342)
 190:	moveal %a2,%a1
 192:	movel %d6,%d0
 194:	moveal %d0,%a3
 196:	movel %d7,%d1
 198:	subql #1,%d1
 19a:	moveal %d1,%a4
 19c:	jsr %a6@(-240)
 1a0:	moveal %a2,%a1
 1a2:	movel %d6,%d0
 1a4:	addl %d2,%d0
 1a6:	addql #1,%d0
 1a8:	movel %a4,%d1
 1aa:	subql #2,%d1
 1ac:	jsr %a6@(-246)
 1b0:	moveal %a2,%a1
 1b2:	movel %a3,%d0
 1b4:	movel %a4,%d1
 1b6:	jsr %a6@(-240)
 1ba:	moveal %a2,%a1
 1bc:	movel %a3,%d0
 1be:	movel %d7,%d1
 1c0:	addl %d3,%d1
 1c2:	jsr %a6@(-246)
 1c6:	moveal %a2,%a1
 1c8:	movel %d6,%d0
 1ca:	subql #1,%d0
 1cc:	moveal %d0,%a3
 1ce:	movel %a4,%d1
 1d0:	jsr %a6@(-240)
 1d4:	moveal %a2,%a1
 1d6:	movel %a3,%d0
 1d8:	movel %d7,%d1
 1da:	addl %d3,%d1
 1dc:	moveal %d1,%a4
 1de:	subql #1,%d1
 1e0:	jsr %a6@(-246)
 1e4:	moveal %a2,%a1
 1e6:	movel %d5,%d0
 1e8:	jsr %a6@(-342)
 1ec:	moveal %a2,%a1
 1ee:	movel %a3,%d0
 1f0:	movel %a4,%d1
 1f2:	jsr %a6@(-240)
 1f6:	moveal %a2,%a1
 1f8:	movel %d6,%d0
 1fa:	addl %d2,%d0
 1fc:	moveal %d0,%a3
 1fe:	addql #1,%d0
 200:	movel %a4,%d1
 202:	jsr %a6@(-246)
 206:	moveal %a2,%a1
 208:	movel %a3,%d0
 20a:	addql #1,%d0
 20c:	movel %d7,%d1
 20e:	subql #1,%d1
 210:	jsr %a6@(-246)
 214:	moveal %a2,%a1
 216:	movel %a3,%d0
 218:	movel %a4,%d1
 21a:	jsr %a6@(-240)
 21e:	moveal %a2,%a1
 220:	movel %a3,%d0
 222:	movel %d7,%d1
 224:	jsr %a6@(-246)
 228:	moveml %sp@+,%d2-%d7/%a2-%a4/%a6
 22c:	rts

0000022e <_SwapMem>:
 22e:	moveb %a0@,%d1
 230:	moveb %a1@,%a0@+
 232:	moveb %d1,%a1@+
 234:	subql #1,%d0
 236:	bnes 22e <_SwapMem>
 238:	rts

0000023a <LSprintf>:
 23a:	moveml %a2-%a3/%a6,%sp@-
 23e:	moveal %sp@(16),%a3
 242:	moveal %sp@(20),%a0
 246:	lea %sp@(24),%a1
 24a:	lea %pc@(25c <stuffChar>),%a2
 24e:	moveal 4 <wbname+0x4>,%a6
 252:	jsr %a6@(-522)
 256:	moveml %sp@+,%a2-%a3/%a6
 25a:	rts

0000025c <stuffChar>:
 25c:	moveb %d0,%a3@+
 25e:	rts

00000260 <LCreateExtIO>:
 260:	moveml %d2-%d3/%a6,%sp@-
 264:	movel %a0,%d2
 266:	moveq #0,%d3
 268:	movew %d0,%d3
 26a:	beqs 296 <endextio>
 26c:	movel #196608,%d1
 272:	moveal 4 <wbname+0x4>,%a6
 276:	jsr %a6@(-198)
 27a:	tstl %d0
 27c:	beqs 296 <endextio>
 27e:	moveal %d0,%a0
 280:	moveb #5,%a0@(8)
 286:	movew %d3,%a0@(18)
 28a:	movel %d2,%a0@(14)
 28e:	movel %a0,%d0
 290:	moveml %sp@+,%d2-%d3/%a6
 294:	rts

00000296 <endextio>:
 296:	moveml %sp@+,%d2-%d3/%a6
 29a:	moveq #0,%d0
 29c:	rts

0000029e <LCreatePort>:
 29e:	moveml %d2-%d3/%a2-%a3/%a6,%sp@-
 2a2:	moveal %a0,%a2
 2a4:	movel %d0,%d2
 2a6:	moveq #-1,%d0
 2a8:	moveal 4 <wbname+0x4>,%a6
 2ac:	jsr %a6@(-330)
 2b0:	cmpib #-1,%d0
 2b4:	beqw 326 <endport>
 2b8:	moveb %d0,%d3
 2ba:	moveq #34,%d0
 2bc:	movel #196608,%d1
 2c2:	moveal 4 <wbname+0x4>,%a6
 2c6:	jsr %a6@(-198)
 2ca:	tstl %d0
 2cc:	beqs 31e <endport1>
 2ce:	moveal %d0,%a3
 2d0:	movel %a2,%a3@(10)
 2d4:	moveb %d2,%a3@(9)
 2d8:	moveb #4,%a3@(8)
 2de:	moveb #0,%a3@(14)
 2e4:	moveb %d3,%a3@(15)
 2e8:	subal %a1,%a1
 2ea:	moveal 4 <wbname+0x4>,%a6
 2ee:	jsr %a6@(-294)
 2f2:	movel %d0,%a3@(16)
 2f6:	tstl %a2
 2f8:	beqs 306 <noname>
 2fa:	moveal %a3,%a1
 2fc:	moveal 4 <wbname+0x4>,%a6
 300:	jsr %a6@(-354)
 304:	bras 316 <endgotport>

00000306 <noname>:
 306:	lea %a3@(20),%a0
 30a:	movel %a0,%a0@
 30c:	addql #4,%a0@
 30e:	clrl %a0@(4)
 312:	movel %a0,%a0@(8)

00000316 <endgotport>:
 316:	movel %a3,%d0
 318:	moveml %sp@+,%d2-%d3/%a2-%a3/%a6
 31c:	rts

0000031e <endport1>:
 31e:	moveal 4 <wbname+0x4>,%a6
 322:	jsr %a6@(-336)

00000326 <endport>:
 326:	moveml %sp@+,%d2-%d3/%a2-%a3/%a6
 32a:	rts

0000032c <LDeleteExtIO>:
 32c:	movel %a6,%sp@-
 32e:	moveb #-1,%a0@(8)
 334:	movel #-1,%a0@(14)
 33c:	movel #-1,%a0@(20)
 344:	moveal %a0,%a1
 346:	moveq #0,%d0
 348:	movew %a0@(18),%d0
 34c:	moveal 4 <wbname+0x4>,%a6
 350:	jsr %a6@(-210)
 354:	moveal %sp@+,%a6
 356:	rts

00000358 <LDeletePort>:
 358:	moveml %a2/%a6,%sp@-
 35c:	moveal %a0,%a2
 35e:	movel %a2@(10),%d0
 362:	tstl %d0
 364:	beqs 370 <nonamefree>
 366:	moveal %a0,%a1
 368:	moveal 4 <wbname+0x4>,%a6
 36c:	jsr %a6@(-360)

00000370 <nonamefree>:
 370:	movel #-1,%a2@(16)
 378:	lea %a2@(20),%a0
 37c:	movel #-1,%a0@
 382:	moveq #0,%d0
 384:	moveb %a2@(15),%d0
 388:	moveal 4 <wbname+0x4>,%a6
 38c:	jsr %a6@(-336)
 390:	moveal %a2,%a1
 392:	moveq #34,%d0
 394:	moveal 4 <wbname+0x4>,%a6
 398:	jsr %a6@(-210)
 39c:	moveml %sp@+,%a2/%a6
 3a0:	rts

000003a2 <LToUpper>:
 3a2:	movel %a6,%sp@-
 3a4:	moveal 0 <wbname>,%a6
			3a6: 32	_UtilityBase
 3aa:	jsr %a6@(-174)
 3ae:	moveal %sp@+,%a6
 3b0:	rts

000003b2 <LToLower>:
 3b2:	movel %a6,%sp@-
 3b4:	moveal 0 <wbname>,%a6
			3b6: 32	_UtilityBase
 3ba:	jsr %a6@(-180)
 3be:	moveal %sp@+,%a6
 3c0:	rts

000003c2 <LStrCat>:
 3c2:	movel #65535,%d0

000003c8 <LStrnCat>:
 3c8:	tstb %a0@+
 3ca:	bnes 3c8 <LStrnCat>
 3cc:	subql #1,%a0
 3ce:	subql #1,%d0

000003d0 <catloop>:
 3d0:	moveb %a1@+,%a0@+
 3d2:	dbeq %d0,3d0 <catloop>
 3d6:	beqs 3da <endcat>
 3d8:	clrb %a0@

000003da <endcat>:
 3da:	rts

000003dc <LStrCpy>:
 3dc:	moveb %a1@+,%a0@+
 3de:	bnes 3dc <LStrCpy>
 3e0:	rts

000003e2 <LStrnCpy>:
 3e2:	moveb %a1@+,%a0@+
 3e4:	beqs 3ee <endstrncpy>
 3e6:	dbeq %d0,3e2 <LStrnCpy>
 3ea:	moveb #0,%a0@-

000003ee <endstrncpy>:
 3ee:	rts

000003f0 <LStrCmpI>:
 3f0:	movel #32767,%d0

000003f6 <LStrnCmpI>:
 3f6:	movel %d2,%sp@-
 3f8:	movel %d0,%d2
 3fa:	subql #1,%d2
 3fc:	bmis 418 <equal>

000003fe <cmploop>:
 3fe:	moveb %a0@+,%d0
 400:	extl %d0
 402:	bsrs 3a2 <LToUpper>
 404:	moveb %d0,%d1
 406:	moveb %a1@+,%d0
 408:	extl %d0
 40a:	bsrs 3a2 <LToUpper>
 40c:	cmpb %d0,%d1
 40e:	blts 424 <less>
 410:	bgts 41e <greater>
 412:	tstb %d1
 414:	dbeq %d2,3fe <cmploop>

00000418 <equal>:
 418:	moveq #0,%d0
 41a:	movel %sp@+,%d2
 41c:	rts

0000041e <greater>:
 41e:	moveq #1,%d0
 420:	movel %sp@+,%d2
 422:	rts

00000424 <less>:
 424:	moveq #-1,%d0
 426:	movel %sp@+,%d2
 428:	rts

0000042a <LStrCmp>:
 42a:	movel #32767,%d0

00000430 <LStrnCmp>:
 430:	subql #1,%d0
 432:	bmis 444 <equal1>
 434:	moveq #0,%d1

00000436 <cmploop1>:
 436:	moveb %a0@+,%d1
 438:	cmpb %a1@+,%d1
 43a:	blts 44c <less1>
 43c:	bgts 448 <greater1>
 43e:	tstb %d1
 440:	dbeq %d0,436 <cmploop1>

00000444 <equal1>:
 444:	moveq #0,%d0
 446:	rts

00000448 <greater1>:
 448:	moveq #1,%d0
 44a:	rts

0000044c <less1>:
 44c:	moveq #-1,%d0
 44e:	rts
