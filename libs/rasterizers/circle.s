CIRCLE:
                movem.l                                   d0-d7/a0,-(sp)
  
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
                cmp.w                                     #90,d7
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
  move.w d3,CIRCLE_TMP

  move.w d3,CIRCLE_TMP1_X
  move.w d6,CIRCLE_TMP2_X
  
  move.w d1,CIRCLE_TMP1_Y
  move.w d4,d3
  sub.w d1,d3
  sub.w d3,CIRCLE_TMP1_Y

  move.w d1,CIRCLE_TMP2_Y
  move.w d5,d3
  sub.w d1,d3
  sub.w d3,CIRCLE_TMP2_Y
  

  bsr.w CIRCLE_PRINTLINE_FROM_MEM
  move.w CIRCLE_TMP,d3




  ; 3rd quadrant
  move.w d3,CIRCLE_TMP
  move.w d0,CIRCLE_TMP1_X
  ;move.w d3,d3
  sub.w d0,d3
  sub.w d3,CIRCLE_TMP1_X

  move.w d0,CIRCLE_TMP2_X
  move.w d6,d3
  sub.w d0,d3
  sub.w d3,CIRCLE_TMP2_X

  move.w CIRCLE_TMP,CIRCLE_TMP1_Y
  move.w d5,CIRCLE_TMP2_Y
  move.w d4,CIRCLE_TMP1_Y

  bsr.w CIRCLE_PRINTLINE_FROM_MEM

  move.w CIRCLE_TMP,d3

  ; 2nd quadrant
  move.w d0,CIRCLE_TMP1_X
  ;move.w d3,d3
  sub.w d0,d3
  sub.w d3,CIRCLE_TMP1_X

  move.w d1,CIRCLE_TMP1_Y
  move.w d4,d3
  sub.w d1,d3
  sub.w d3,CIRCLE_TMP1_Y

  move.w d0,CIRCLE_TMP2_X
  move.w d6,d3
  sub.w d0,d3
  sub.w d3,CIRCLE_TMP2_X

  move.w d1,CIRCLE_TMP2_Y
  move.w d5,d3
  sub.w d1,d3
  sub.w d3,CIRCLE_TMP2_Y

  bsr.w CIRCLE_PRINTLINE_FROM_MEM
    
    ; pack d3
                move.w                                    d6,d3
                swap                                      d3
                move.w                                    d5,d3
    
                add.w                                     #30,d7
                bra.w                                     CIRCLE_STARTLOOP

CIRCLE_EXIT:
                move.l AMMX_FILL_FUNCT_ADDR,a0
                jsr (a0)

                movem.l                                   (sp)+,d0-d7/a0
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

                movem.l                                   (sp)+,d0-d1/a1
                rts