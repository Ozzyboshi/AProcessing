  XDEF                 _vampire_fpu_test1
  XDEF                 _vampire_fpu_test2
  XDEF                 _vampire_fpu_test3
  XDEF                 _vampire_fpu_test4
  XDEF                 _vampire_fpu_test5
  XDEF                 _vampire_fpu_test6

  include              "../../../libs/precalc/rgbto0r0b0g.s"
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

  lea INPUT2,a0
  LOAD #0,D1
  LOAD (a0),D3
  vperm #$FFFFFF23,d3,d1,d0
  vperm #$FFFFFF67,d3,d1,d1

  fmove #50,fp1
  fmove #25,fp2

  jsr COPFADEFPU
  move.w d0,RESULT2
  movem.l (sp)+,d1-d7

  move.l             #RESULT2,d0
  rts

INPUT3: dc.l $01800EEC,$01800975
RESULT3: dc.w 0
_vampire_fpu_test3:
  movem.l d1-d7,-(sp)

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