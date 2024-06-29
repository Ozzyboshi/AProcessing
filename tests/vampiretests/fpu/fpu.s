  XDEF                 _vampire_fpu_test1
  XDEF                 _vampire_fpu_test2
  XDEF                 _vampire_fpu_test3
  XDEF                 _vampire_fpu_test4
  XDEF                 _vampire_fpu_test5
  XDEF                 _vampire_fpu_test6
  XDEF                 _vampire_fpu_test7
  XDEF                 _vampire_fpu_test8
  XDEF                 _vampire_fpu_test9

  include              "../../../libs/precalc/rgbto0r0b0g.s"
  include              "../../../libs/precalc/rgbtoregs.s"
  include              "../../../libs/rasterizers/globaloptions.s"
  include              "../../../libs/vampfpu/copfade.s"
  include              "../../../libs/vampfpu/coldistance.s"

RESULT: dc.l 0,0
_vampire_fpu_test1:

    movem.l d1-d7/a0-a6,-(sp)

    moveq #1,d0
    moveq #2,d1
    moveq #3,d2

    moveq #$F,d3
    moveq #$F,d4
    moveq #$F,d5

    jsr COLDIST

    fmove.d fp0,RESULT

    movem.l (sp)+,d1-d7/a0-a6

    move.l             #RESULT,d0
    rts
 
INPUT2: dc.l $01800975,$01800EEC
RESULT2: dc.w 0
_vampire_fpu_test2:
  movem.l d1-d7,-(sp)

  IFD VAMPIRE
  lea INPUT2,a0
  LOAD #0,D1
  LOAD (a0),D3
  vperm #$FFFFFF23,d3,d1,d0
  vperm #$FFFFFF67,d3,d1,d1

  fmove #50,fp1
  fmove #25,fp2

  jsr COPFADEFPU
  ENDC
  move.w d0,RESULT2
  movem.l (sp)+,d1-d7

  move.l             #RESULT2,d0
  rts

INPUT3: dc.l $01800EEC,$01800975
RESULT3: dc.w 0
_vampire_fpu_test3:
  movem.l d1-d7,-(sp)
  IFD VAMPIRE
  lea INPUT3,a0
  LOAD #0,D1
  LOAD (a0),D3
  vperm #$FFFFFF23,d3,d1,d0
  vperm #$FFFFFF67,d3,d1,d1

  fmove #50,fp1
  fmove #25,fp2

  jsr COPFADEFPU
  move.w d0,RESULT3
  movem.l (sp)+,d1-d7
  ENDC

  move.l             #RESULT3,d0
  rts

RESULT4: dc.w 0
_vampire_fpu_test4:
  movem.l d1-d7,-(sp)

  move.l #$0000,d0
  move.l #$0FFF,d1

  fmove #16,fp1
  fmove #1,fp2

  jsr COPFADEFPU
  move.w d0,RESULT4
  movem.l (sp)+,d1-d7

  move.l             #RESULT4,d0
  rts

RESULT5: dc.w 0
_vampire_fpu_test5:
  movem.l d1-d7,-(sp)

  move.l #$0000,d1
  move.l #$0FFF,d0

  fmove #16,fp1
  fmove #1,fp2

  jsr COPFADEFPU
  move.w d0,RESULT5
  movem.l (sp)+,d1-d7

  move.l             #RESULT5,d0
  rts

RESULT6: dc.w 0
_vampire_fpu_test6:
  movem.l d1-d7,-(sp)

  move.l #$0987,d0

  move.l #$0211,d1

  fmove #1,fp1
  fmove #1,fp2

  movem.l 			d7,-(sp)
  	jsr 				COPFADEFPU
	movem.l 			(sp)+,d7

  move.l #$0987,d0

  move.l #$0211,d1

  fmove #1,fp1
  fmove #1,fp2

  movem.l 			d7,-(sp)
  	jsr 				COPFADEFPU
	movem.l 			(sp)+,d7
  move.w d0,RESULT6
  movem.l (sp)+,d1-d7

  move.l             #RESULT6,d0
  rts

RESULT7: dc.w 0
COPLIST7:
  dc.w $180,$110 ; Color 0
  dc.w $182,$211 ; Color 1
  dc.w $184,$411 ; Color 2
  dc.w $186,$322 ; Color 3
  dc.w $188,$432 ; Color 4
  dc.w $18a,$346 ; Color 5
  dc.w $18c,$544 ; Color 6
  dc.w $18e,$643 ; Color 7
  dc.w $190,$665 ; Color 8
  dc.w $192,$469 ; Color 9
  dc.w $194,$865 ; Color 10
  dc.w $196,$766 ; Color 11
  dc.w $198,$48C ; Color 12
  dc.w $19a,$877 ; Color 13
  dc.w $19c,$D66 ; Color 14
  dc.w $19e,$48D ; Color 15
  dc.w $1a0,$B76 ; Color 16
  dc.w $1a2,$987 ; Color 17
  dc.w $1a4,$59D ; Color 18
  dc.w $1a6,$998 ; Color 19
  dc.w $1a8,$6AD ; Color 20
  dc.w $1aa,$8AD ; Color 21
  dc.w $1ac,$AAA ; Color 22
  dc.w $1ae,$BA9 ; Color 23
  dc.w $1b0,$DA5 ; Color 24
  dc.w $1b2,$CA7 ; Color 25
  dc.w $1b4,$9BC ; Color 26
  dc.w $1b6,$EB8 ; Color 27
  dc.w $1b8,$EC9 ; Color 28
  dc.w $1ba,$DCB ; Color 29
  dc.w $1bc,$DDD ; Color 30
  dc.w $1be,$EEC ; Color 31
_vampire_fpu_test7:
  movem.l d1-d7,-(sp)
  IFD VAMPIRE

  move.l #$0000,d0
  move.l #$0FFF,d1

  fmove #16,fp1
  fmove #1,fp2

  movem.l 			d7,-(sp)
  	jsr 				COPFADEFPU
	movem.l 			(sp)+,d7
  load d0,e0
  moveq #32-1,d7
  fmove #455,fp6
  lea COPLIST7,a0
vampire_fpu7_loop:
  move.l (a0)+,d6

  RGBTOREGS d6,d0,d1,d2 ; d0 d1 and d2 holds the color from copperlist

  load e0,d6
  RGBTOREGS d6,d3,d4,d5 ; d3 d4 d5 is the color we are looking for

  jsr COLDIST
    nop
    nop
      fcmp fp0,fp6
      fmove FPSR,d6
      ;fblt vampire_fpu7_upd_max
      btst #31-4,d6
      bne.s vampire_fpu7_upd_max
      fmove fp0,fp6
      move.w d7,d6
      swap d7
      move.w d6,d7
      swap d7

vampire_fpu7_upd_max:

  dbra d7,vampire_fpu7_loop
  swap d7
  sub.w #32-1,d7
  neg.w d7
  ENDC
  move.w d7,RESULT7
  movem.l (sp)+,d1-d7

  move.l             #RESULT7,d0
  rts

RESULT8: dc.w 0
_vampire_fpu_test8:
  movem.l d1-d7,-(sp)
  IFD VAMPIRE

  move.l #$0ec8,d0
  load d0,e0
  moveq #32-1,d7
  fmove #455,fp6
  lea COPLIST7,a0
vampire_fpu8_loop:
  move.l (a0)+,d6

  RGBTOREGS d6,d0,d1,d2 ; d0 d1 and d2 holds the color from copperlist

  load e0,d6
  RGBTOREGS d6,d3,d4,d5 ; d3 d4 d5 is the color we are looking for

  jsr COLDIST
  
  fcmp fp0,fp6
  fmove FPSR,d6
  ;fblt vampire_fpu8_upd_max
  btst #31-4,d6
  bne.s vampire_fpu8_upd_max
  fmove fp0,fp6
  move.w d7,d6
  swap d7
  move.w d6,d7
  swap d7

vampire_fpu8_upd_max:

  dbra d7,vampire_fpu8_loop
  swap d7
  sub.w #32-1,d7
  neg.w d7
  ENDC
  move.w d7,RESULT8
  movem.l (sp)+,d1-d7

  move.l             #RESULT8,d0
  rts


RESULT9: dc.w 0
_vampire_fpu_test9:
  movem.l d1-d7,-(sp)
  IFD VAMPIRE

  move.l #$51A,d0
  load d0,e0
  moveq #32-1,d7
  fmove #455,fp6
  lea COPLIST7,a0
vampire_fpu9_loop:
  move.l (a0)+,d6

  RGBTOREGS d6,d0,d1,d2 ; d0 d1 and d2 holds the color from copperlist

  load e0,d6
  RGBTOREGS d6,d3,d4,d5 ; d3 d4 d5 is the color we are looking for

  jsr COLDIST
  
  fcmp fp0,fp6
  fmove FPSR,d6
  ;fblt vampire_fpu9_upd_max
  btst #31-4,d6
  bne.s vampire_fpu9_upd_max
  fmove fp0,fp6
  move.w d7,d6
  swap d7
  move.w d6,d7
  swap d7

vampire_fpu9_upd_max:

  dbra d7,vampire_fpu9_loop
  swap d7
  sub.w #32-1,d7
  neg.w d7
  ENDC
  move.w d7,RESULT9
  movem.l (sp)+,d1-d7

  move.l             #RESULT9,d0
  rts