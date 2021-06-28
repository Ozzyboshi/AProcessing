CIRCLE:
                movem.l                                   d0-d7/a0-a6,-(sp)

  ; init fill routines printing center, this must be stripped after optimizations!
                bsr.w                                     CIRCLE_PRINTLINE_FIRST
  ;bra.s CIRCLE_EXIT
  
    ; load sin cos table addr here into a0
                lea                                       ROT_Z_MATRIX_Q5_11,a0
    
    ; previous point x and x (x on the high word and y on the Y word)
                move.w                                    d0,d3
                add.w                                     d2,d3
                swap                                      d3
                move.w                                    d1,d3
    
                move.w                                    #30,d7                                                                                 ; let's start with first point at angle 30 deg
    
; Cycle from 0 to 90, each time encreasing the angle by 30
CIRCLE_STARTLOOP:
                cmp.w                                     #360,d7
                bhi.w                                     CIRCLE_EXIT
    
    ; load sin and cos relative to the angle
                move.w                                    d7,d6
                lsl.w                                     #3,d6
                move.l                                    4(a0,D6.w),d4                                                                          ; d4 now contains sin(x) on the high word and cos(x) on the low word
    
    ; multiply and normalize d4 data with the radius
                move.l                                    d4,d6
                muls.w                                    d2,d6
                lsr.l                                     #8,d6
                lsr.l                                     #3,d6
    ; x done , d6 now contains x*sin(angle) now same procedure with x
    
                swap                                      d4
                move.w                                    d4,d5
                muls.w                                    d2,d5
                lsr.l                                     #8,d5
                lsr.l                                     #3,d5
    ;lsr.l #5,d5
    
    ; at this point I expect:
    ; d6 = radius*cos(angle) (low word)
    ; d5 = radius*sin(angle) (low word)
    
    ; add the center
                add.w                                     d0,d6
                add.w                                     d1,d5
    
    ; unpack the previous point
                move.w                                    d3,d4                                                                                  ; unpack y into d4
                swap                                      d3                                                                                     ; unpack x into d3
    
    ; print line with transformation , coords d3,d4 - d6,d5
    ; 4th quadrant
                bsr.w                                     CIRCLE_PRINTLINE

  ; 1st quadrant
  ;move.w d3,CIRCLE_TMP

  ;move.w d3,CIRCLE_TMP1_X
  ;move.w d6,CIRCLE_TMP2_X
  
  ;move.w d1,CIRCLE_TMP1_Y
  ;move.w d4,d3
  ;sub.w d1,d3
  ;sub.w d3,CIRCLE_TMP1_Y

  ;move.w d1,CIRCLE_TMP2_Y
  ;move.w d5,d3
  ;sub.w d1,d3
  ;sub.w d3,CIRCLE_TMP2_Y
  

  ;bsr.w CIRCLE_PRINTLINE_FROM_MEM
  ;move.w CIRCLE_TMP,d3




  ; 3rd quadrant
  ;move.w d3,CIRCLE_TMP
  ;move.w d0,CIRCLE_TMP1_X
  ;move.w d3,d3
  ;sub.w d0,d3
  ;sub.w d3,CIRCLE_TMP1_X

  ;move.w d0,CIRCLE_TMP2_X
  ;move.w d6,d3
  ;sub.w d0,d3
  ;sub.w d3,CIRCLE_TMP2_X

  ;move.w CIRCLE_TMP,CIRCLE_TMP1_Y
  ;move.w d5,CIRCLE_TMP2_Y

  ;bsr.w CIRCLE_PRINTLINE_FROM_MEM

  ;move.w CIRCLE_TMP,d3

  ; 2nd quadrant
  ;move.w d0,CIRCLE_TMP1_X
  ;move.w d3,d3
  ;sub.w d0,d3
  ;sub.w d3,CIRCLE_TMP1_X

  ;move.w d1,CIRCLE_TMP1_Y
  ;move.w d4,d3
  ;sub.w d1,d3
  ;sub.w d3,CIRCLE_TMP1_Y

  ;move.w d0,CIRCLE_TMP2_X
  ;move.w d6,d3
  ;sub.w d0,d3
  ;sub.w d3,CIRCLE_TMP2_X

  ;move.w d1,CIRCLE_TMP2_Y
  ;move.w d5,d3
  ;sub.w d1,d3
  ;sub.w d3,CIRCLE_TMP2_Y

  ;bsr.w CIRCLE_PRINTLINE_FROM_MEM
    
    ; pack d3
                move.w                                    d6,d3
                swap                                      d3
                move.w                                    d5,d3
    
                add.w                                     #30,d7
                bra.w                                     CIRCLE_STARTLOOP

CIRCLE_EXIT:
                bsr.w                                     ammx_fill_table

                movem.l                                   (sp)+,d0-d7/a0-a6
                rts

CIRCLE_TMP1_X:  dc.w                                      0
CIRCLE_TMP1_Y:  dc.w                                      0
CIRCLE_TMP2_X:  dc.w                                      0
CIRCLE_TMP2_Y:  dc.w                                      0
CIRCLE_TMP:     dc.w                                      0

CIRCLE_PRINTLINE:
                movem.l                                   d0-d1/a1,-(sp)
                POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d3,d4,0
                POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    d6,d5,4
                bsr.w                                     ammxlinefill
                movem.l                                   (sp)+,d0-d1/a1

                rts

CIRCLE_PRINTLINE_FROM_MEM:
                movem.l                                   d0-d1/a1,-(sp)
                POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    CIRCLE_TMP1_X,CIRCLE_TMP1_Y,0
                POINT_TRANSFORM_AND_STORE_IN_FILLTABLE    CIRCLE_TMP2_X,CIRCLE_TMP2_Y,4
                bsr.w                                     ammxlinefill
                movem.l                                   (sp)+,d0-d1/a1

                rts

CIRCLE_PRINTLINE_FIRST:
                movem.l                                   d0-d1/a1,-(sp)
                bsr.w                                     point_execute_transformation

 

                move.w                                    d1,AMMXFILLTABLE_CURRENT_ROW
                move.w                                    d1,AMMXFILLTABLE_END_ROW
                movem.l                                   (sp)+,d0-d1/a1
                rts




                IFD                                       VECCHIO
CIRCLE: ; pass xcenter ycenter radius and precision
                movem.l                                   d0-d7/a0-a6,-(sp)                                                                      ; stack save
                asr.w                                     #6,d0                                                                                  ; normalize center x
                asr.w                                     #6,d1                                                                                  ; normalize center y
                asr.w                                     #6,d2                                                                                  ; normalize radius
				; precision is inside d7, no need to be normalized

    ; save the center into variables
                move.w                                    d0,CIRCLE_Q_10_6_CENTER_X
                move.w                                    d1,CIRCLE_Q_10_6_CENTER_Y

	; save the precision
                move.w                                    d7,CIRCLE_Q_10_6_PRECISION

	;move.w d0,CIRCLE_Q_10_6_LAST_X
                move.w                                    d2,CIRCLE_Q_10_6_LAST_X
                move.w                                    #0,CIRCLE_Q_10_6_LAST_Y

CIRCLE_Q_10_6_STARTLOOP:
                move.w                                    d2,d3                                                                                  ; x of first point is equal to 0+radius
                moveq                                     #0,d4                                                                                  ; y of first point is equal to 0 

                IFD                                       VAMPIRE
                lea                                       COS_SIN_SIN_COSINV_TABLE,b1                                                            ; Cos and SIN in b1 (precalculated * 256)
                LOAD                                      (b1,D7.w*8),E5                                                                         ; Load precalculated sin/cos values to register E5

	;LOAD COORDS,E4 ; Load XY input data in register for pmula
                vperm                                     #$67EF67EF,d3,d4,e4
                PMUl88                                    E4,E5,E7                                                                               ; Calculate rotation with formula x*cos(a) ## y*sin(a) ## x*sin(a) ## -y*cos(a)
	;ammx mode - copy the result in E8 but 16bit shifted
                dc.w                                      $fe7c,$f038,$0000,$0000,$0000,$0010                                                    ; LSL.Q  #16,E7,E8
                PADDW                                     E7,E8,E9                                                                               ; add x*cos(a) + y*sin(a) and x*sin(a) -y*cos(a) in one shot

                VPERM                                     #$01010101,E9,E9,D5                                                                    ; result of first addition to d0
                VPERM                                     #$45454545,E9,E9,D6                                                                    ; result of first addition to d1
                ENDIF

                move.w                                    CIRCLE_Q_10_6_LAST_X,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_X,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_1

                move.w                                    CIRCLE_Q_10_6_LAST_Y,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_Y,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_2

                move.w                                    d5,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_X,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_3

                move.w                                    d6,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_Y,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_4

                LINE_Q_10_6                               CIRCLE_Q_10_6_LINE_1,CIRCLE_Q_10_6_LINE_2,CIRCLE_Q_10_6_LINE_3,CIRCLE_Q_10_6_LINE_4


	; save last point
                move.w                                    d5,CIRCLE_Q_10_6_LAST_X
                move.w                                    d6,CIRCLE_Q_10_6_LAST_Y

	; increment d7 with its own precision
                add.w                                     CIRCLE_Q_10_6_PRECISION,d7

	; if d7 < 360 repeat
                cmp                                       #359,d7
                bls.w                                     CIRCLE_Q_10_6_STARTLOOP

                move.w                                    d2,d3                                                                                  ; x of first point is equal to 0+radius
                moveq                                     #0,d4                                                                                  ; y of first point is equal to 0 

                IFD                                       VAMPIRE
                lea                                       COS_SIN_SIN_COSINV_TABLE,b1                                                            ; Cos and SIN in b1 (precalculated * 256)
                LOAD                                      (b1),E5                                                                                ; Load precalculated sin/cos values to register E5

	;LOAD COORDS,E4 ; Load XY input data in register for pmula
                vperm                                     #$67EF67EF,d3,d4,e4
                PMUl88                                    E4,E5,E7                                                                               ; Calculate rotation with formula x*cos(a) ## y*sin(a) ## x*sin(a) ## -y*cos(a)
	;ammx mode - copy the result in E8 but 16bit shifted
                dc.w                                      $fe7c,$f038,$0000,$0000,$0000,$0010                                                    ; LSL.Q  #16,E7,E8
                PADDW                                     E7,E8,E9                                                                               ; add x*cos(a) + y*sin(a) and x*sin(a) -y*cos(a) in one shot

                VPERM                                     #$01010101,E9,E9,D5                                                                    ; result of first addition to d0
                VPERM                                     #$45454545,E9,E9,D6                                                                    ; result of first addition to d1
                ENDIF

	

                move.w                                    CIRCLE_Q_10_6_LAST_X,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_X,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_1

                move.w                                    CIRCLE_Q_10_6_LAST_Y,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_Y,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_2

                move.w                                    d5,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_X,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_3

                move.w                                    d6,d0
                add.w                                     CIRCLE_Q_10_6_CENTER_Y,d0
                asl.w                                     #6,d0
                move.w                                    d0,CIRCLE_Q_10_6_LINE_4

                LINE_Q_10_6                               CIRCLE_Q_10_6_LINE_1,CIRCLE_Q_10_6_LINE_2,CIRCLE_Q_10_6_LINE_3,CIRCLE_Q_10_6_LINE_4

                movem.l                                   (sp)+,d0-d7/a0-a6

                rts

CIRCLE_Q_10_6_CENTER_X:
                dc.w                                      0
CIRCLE_Q_10_6_CENTER_Y:
                dc.w                                      0
CIRCLE_Q_10_6_LAST_X:
                dc.w                                      0
CIRCLE_Q_10_6_LAST_Y:
                dc.w                                      0
CIRCLE_Q_10_6_PRECISION:
                dc.w                                      0
CIRCLE_Q_10_6_LINE_1:
                dc.w                                      0
CIRCLE_Q_10_6_LINE_2:
                dc.w                                      0
CIRCLE_Q_10_6_LINE_3:
                dc.w                                      0
CIRCLE_Q_10_6_LINE_4:
                dc.w                                      0

                ENDIF